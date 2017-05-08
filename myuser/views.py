from myuser.loginform import LoginForm
from django.contrib import messages
from django.contrib.auth import authenticate
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.messages import get_messages
from django.contrib.auth import login as djangologin
from django.contrib.auth import logout as djangologout
from django.contrib.auth.models import Group, Permission
from myuser.forms import GroupForm, UserForm, PasswordForm, ChangePassworForm, ResetPasswordForm
from django.contrib.auth.decorators import login_required, permission_required
from practice.api import *
from myuser.models import MyUser
from myassets.models import Asset, AssetGroup
from django.core.mail import send_mail
from django.conf import settings
from utils.utils import URL


@login_required
def index(request):
    role_id = request.session.get('role_id')
    login_user = MyUser.objects.get(email=request.user)
    if role_id == 3:
        all_user = MyUser.objects.all()
        all_assets = Asset.objects.all()
        return render(request, 'myuser/index.html', {'all_user': all_user, 'login_user': login_user,
                                                         'role_id': role_id ,'total_users': len(all_user),
                                                         'total_assets': len(all_assets)})
    elif request.session.get('role_id', None) == 2:
        return HttpResponseRedirect(reverse('admin'))
    elif request.session.get('role_id', None) == 1:
        return HttpResponseRedirect(reverse('guest'))


@defend_attack
def login(request):
    """登录界面"""
    if request.user.is_authenticated():
        return HttpResponseRedirect(reverse('index'))
    if request.method == 'GET':
        return render(request, 'myuser/login.html')
    else:
        form = LoginForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            user = authenticate(
                username=cd['username'],
                password=cd['password']
            )
            if user is not None:
                if user.is_active:
                    djangologin(request, user)
                    if user.role == 'SU':
                        request.session['role_id'] = 3
                    elif user.role == 'AU':
                        request.session['role_id'] = 2
                    elif user.role == 'CU':
                        request.session['role_id'] = 1
                    # request.session.set_expiry(7200)
                    return redirect(request.GET.get('next', '/'))
                else:
                    error = '用户未激活'
            else:
                error = '用户名或密码错误'
        else:
            error = '用户名或密码错误'
        return render(request, 'myuser/login.html', {'error': error})


def logout(request):
    djangologout(request)
    return HttpResponseRedirect(reverse('index'))


@login_required
def admin(request):
    role_id = request.session.get('role_id')
    login_user = MyUser.objects.get(email=request.user)
    all_user = MyUser.objects.all()
    all_assets = MyUser.objects.get(email=request.user).asset.all()
    asset_group = MyUser.objects.get(email=request.user).assetgroup.all()
    return render(request, 'myuser/admin.html', {'login_user': login_user,'role_id': role_id ,'all_user': all_user, 'total_assets': all_assets})


@login_required
def guest(request):
    role_id = request.session.get('role_id')
    user_id = request.session.get('_auth_user_id')
    login_user = MyUser.objects.get(id=user_id)
    all_assets = MyUser.objects.get(email=request.user).asset.all()
    asset_group = MyUser.objects.get(email=request.user).assetgroup.all()
    return render(request, 'myuser/guest.html', {'login_user': login_user,'role_id': role_id, 'total_assets': len(all_assets)})


@login_required
def groups(request):
    role_id = request.session.get('role_id')
    user_id = request.session.get('_auth_user_id')
    login_user = MyUser.objects.get(id=user_id)
    all_groups = Group.objects.all()
    return render(request, 'myuser/groups.html', {'login_user': login_user, 'login_role': login_user.role, 'all_groups': all_groups, 'role_id': role_id})


@login_required
def groupadd(request):
    if MyUser.objects.get(email=request.user).has_perm('myuser.add_group'):
        all_user = MyUser.objects.all()
        if request.method == 'GET':
            login_user = MyUser.objects.get(email=request.user)
            role_id = request.session.get('role_id')
            groupform = GroupForm()
            status = get_messages(request)
            return render(request, 'myuser/groupadd.html',
                          {'all_user': all_user, 'groupform': groupform, 'status': status, 'login_user': login_user, 'role_id': role_id})
        else:
            groupform = GroupForm(request.POST)
            if groupform.is_valid():
                params = dict(request.POST)
                selected_user_id = params.get('selected_user_id', '')
                selected_permission_id = params.get('permissions', '')
                group = groupform.save()
                gid = group.pk
                selected_permissions = [Permission.objects.get(id=permid) for permid in selected_permission_id]
                if selected_user_id:
                    for uid in selected_user_id:
                        user = MyUser.objects.get(id=int(uid))
                        user.groups.add(gid)
                        if selected_permissions:
                            user_permission = user.user_permissions.all()
                            for p in selected_permissions:
                                if p not in user_permission:
                                    user.user_permissions.add(p)
                                    user.save()
                messages.success(request,'添加用户组成功')
                return HttpResponseRedirect(reverse('groupadd'))
            else:
                return render(request, 'myuser/groupadd.html', {'groupform': groupform, 'all_user': all_user})
    else:
        return render(request, 'base/403.html')


@login_required
def groupdel(request):
    if MyUser.objects.get(email=request.user).has_perm('myuser.delete_group'):
        group_ids = request.GET.get('id', '')
        group_id_list = group_ids.split(',')
        [Group.objects.filter(id=group_id).delete() for group_id in group_id_list]
        return HttpResponse('删除成功')
    return render(request, 'base/403.html')


@login_required
def groupedit(request):
    pass


@login_required
def groupedit_detail(request, group_id):
    if request.method == 'GET':
        login_user = MyUser.objects.get(email=request.user)
        role_id = request.session.get('role_id')
        group_info = get_object_or_404(Group, id=group_id)
        group_form = GroupForm(instance=group_info)
        all_user = MyUser.objects.all()
        selected_user = group_info.user_set.all()
        status = get_messages(request)
        return render(request, 'myuser/groupedit.html', {'group_form': group_form, 'all_user': all_user,
                                                         'selected_user': selected_user, 'group_id': group_id,
                                                         'status': status, 'login_user': login_user, 'role_id': role_id})
    elif request.method == 'POST':
        group_info = get_object_or_404(Group, id=group_id)
        groupform = GroupForm(request.POST, instance=group_info)
        if groupform.is_valid():
            params = dict(request.POST)
            exist_user = list(group_info.user_set.all())
            selected_user_id = params.get('selected_user_id', None)
            group = groupform.save()
            gid = group.pk
            if selected_user_id:
                selected_user = [MyUser.objects.get(id=int(uid)) for uid in selected_user_id]
                for user in selected_user:
                    if user not in exist_user:
                        user.groups.add(gid)
                        user.save()
                    else:
                        exist_user.remove(user)
                if exist_user:
                    for user in exist_user:
                        user.groups.remove(gid)
                        user.save()
                return HttpResponseRedirect(reverse('groups'))
        messages.error(request, '数据修改失败,请检查！')
        return render(request, 'myuser/groupedit.html')


def group_search(request):
    if request.method == 'GET':
        group_name = request.GET.get('name')
        if Group.objects.filter(name=group_name).exists():
            return HttpResponse('exist')
        return HttpResponse('unuse')


# 用户相关

@login_required
def users(request):
    role_id = request.session.get('role_id')
    user_id = request.session.get('_auth_user_id')
    login_user = MyUser.objects.get(id=user_id)
    all_users = MyUser.objects.all()
    return render(request, 'myuser/users.html', {'login_user': login_user, 'all_users': all_users, 'role_id': role_id})


@login_required
def useradd(request):
    if MyUser.objects.get(email=request.user).has_perm('myuser.add_myuser'):
        if request.method == 'GET':
            login_user = MyUser.objects.get(email=request.user)
            role_id = request.session.get('role_id')
            userform = UserForm()
            passwordform = PasswordForm()
            status = get_messages(request)
            return render(request, 'myuser/useradd.html', {'userform': userform, 'paswordform': passwordform, 'status': status, 'login_user': login_user, 'role_id': role_id})
        else:
            userform = UserForm(request.POST)
            passwordform = PasswordForm(request.POST)
            if userform.is_valid() and passwordform.is_valid():
                password = passwordform.cleaned_data['password1']
                email = userform.cleaned_data['email']
                role = request.POST.get('role', '')
                is_sendmail = request.POST.get('sendmail', '')
                userform.save()
                user = MyUser.objects.get(email=email)
                user.set_password(password)
                if role in ['SU', 'AU']:
                    user.is_admin = 1
                else:
                    user.is_admin = 0
                user.save()
                if is_sendmail:
                    message = """
                        您好:
                           您的用户名:{}
                           您的邮箱: {}
                           您的权限:{}
                           您的web登录密码:{}
                           登录地址: {}
                           ^_^ 请用邮箱登录 ^_^
                    """.format(request.POST.get('username'), email, role, password, URL)
                    send_mail('用户{}添加成功'.format(request.POST.get('username')), message, settings.DEFAULT_FROM_EMAIL, [email])
                messages.success(request,'添加用户成功')
                return HttpResponseRedirect(reverse('useradd'))
            return render(request, 'myuser/useradd.html', {'userform': userform, 'paswordform': passwordform})
    return render(request, 'base/403.html')

@login_required
def useredit(request):
    pass


@login_required
@permission_required('myuser.change_myuser')
def useredit_detail(request, user_id):
    if request.method == 'GET':
        login_user = MyUser.objects.get(email=request.user)
        role_id = request.session.get('role_id')
        user_info = get_object_or_404(MyUser, id=user_id)
        user_form = UserForm(instance=user_info)
        status = get_messages(request)
        return render(request, 'myuser/useredit.html', {'user_form': user_form, 'user_id': user_id, 'status': status, 'login_user': login_user, 'role_id': role_id})
    elif request.method == 'POST':
        user_info = get_object_or_404(MyUser, id=user_id)
        user_form = UserForm(request.POST, instance=user_info)
        if user_form.is_valid():
            group_id_list = dict(request.POST).get('groups')
            group_list = [Group.objects.get(id=gid) for gid in group_id_list]
            user_of_group = [group for group in user_info.groups.all()]
            if group_list == user_of_group:
                user_form.save()
                return HttpResponseRedirect(reverse('users'))
            else:
                for g in user_of_group:
                    user_info.groups.remove(g)
                user_info.save()
                for g in group_list:
                    user_info.groups.add(g)
                user_info.save()
                user_form.save()
                return HttpResponseRedirect(reverse('users'))
        messages.error(request, '数据修改失败,请检查！')
        return render(request, 'myuser/useredit.html')


@login_required
def changepwd(request):
    pass


@login_required
@permission_required('myuser.change_password')
def change_password(request, user_id):
    if request.method == 'GET':
        changepwdform = ChangePassworForm()
        login_user = MyUser.objects.get(email=request.user)
        role_id = request.session.get('role_id')
        return render(request, 'myuser/changepassword.html', {'changepwdform': changepwdform, 'user_id': user_id, 'login_user': login_user, 'role_id': role_id})
    elif request.method == 'POST':
        login_user = request.user
        role_id = request.session.get('role_id')
        changepwdform = ChangePassworForm(request.POST)
        if changepwdform.is_valid():
            oldpassword = request.POST.get('oldpassword', '')
            username = request.user
            user_auth = authenticate(username=username, password=oldpassword)
            if user_auth and user_auth.is_active:
                newpassword = request.POST.get('newpassword1', '')
                user_auth.set_password(newpassword)
                user_auth.save()
                return render(request, 'myuser/changepassword.html', {'login_user': login_user, 'role_id': role_id,'changepwdform': changepwdform, 'status': '密码修改成功'})
            else:
                return render(request,'myuser/changepassword.html', {'login_user': login_user, 'role_id': role_id,'changepwdform': changepwdform, 'status': '旧密码错误或用户已禁用'})
        else:
            return render(request,'myuser/changepassword.html', {'login_user': login_user, 'role_id': role_id,'changepwdform': changepwdform, 'status':'请查检数据是否填写正确'})


@login_required
def resetpwd(request):
    pass


@login_required
def reset_password(request, user_id):
    if MyUser.objects.get(email=request.user).has_perm('myuser.reset_password'):
        if request.method == 'POST':
            reset_pwdform = ResetPasswordForm(request.POST)
            if reset_pwdform.is_valid():
                user = MyUser.objects.get(id=user_id)
                new_pwd = request.POST.get('newpassword1')
                user.set_password(new_pwd)
                user.save()
                return render(request, 'myuser/resetpwd.html', {'reset_pwdform': reset_pwdform, 'user': user.email , 'status': '密码重置成功'})
        reset_pwdform = ResetPasswordForm()
        user = MyUser.objects.get(id=user_id).email
        login_user = MyUser.objects.get(email=user)
        role_id = request.session.get('role_id')
        return render(request, 'myuser/resetpwd.html', {'reset_pwdform': reset_pwdform, 'user_id': user_id, 'user':user, 'login_user': login_user, 'role_id': role_id})
    else:
        return render(request, 'base/403.html')


@login_required
def userdel(request):
    user = request.user
    if MyUser.objects.get(email=user).has_perm('myuser.delete_myuser'):
        user_ids = request.GET.get('id', '')
        user_id_list = user_ids.split(',')
        [MyUser.objects.filter(id=user_id).delete() for user_id in user_id_list]
        return HttpResponse('删除成功')
    else:
        return render(request, 'base/403.html')

@login_required
def user_search(request):
    if request.method == 'GET':
        input_email = request.GET.get('email')
        if MyUser.objects.filter(email=input_email).exists():
            return HttpResponse('exist')
        return HttpResponse('unuse')


# user setting
@login_required
def super_setting(request):
    pass
    # login_user = MyUser.objects.get(email=request.user)
    # role_id = request.session.get('role_id')
    # return render(request, 'myuser/supersetting.html', {'user_form': user_form, 'user_id': user_id, 'status': status, 'login_user': login_user, 'role_id': role_id})

@login_required
def admin_setting(request):
    pass


@login_required
def guest_setting(request):
    if request.method == 'GET':
        changepwdform = ChangePassworForm()
        login_user = request.user
        role_id = request.session.get('role_id')
        return render(request, 'myuser/guestsetting.html', {'login_user': login_user, 'role_id': role_id ,'changepwdform': changepwdform})
    elif request.method == 'POST':
        login_user = request.user
        role_id = request.session.get('role_id')
        changepwdform = ChangePassworForm(request.POST)
        if changepwdform.is_valid():
            oldpassword = request.POST.get('oldpassword', '')
            username = request.user
            user_auth = authenticate(username=username, password=oldpassword)
            if user_auth and user_auth.is_active:
                newpassword = request.POST.get('newpassword1', '')
                user_auth.set_password(newpassword)
                user_auth.save()
                return render(request, 'myuser/guestsetting.html', {'login_user': login_user, 'role_id': role_id, 'changepwdform': changepwdform, 'status': 'success'})
            else:
                return render(request,'myuser/guestsetting.html', {'login_user': login_user, 'role_id': role_id, 'changepwdform': changepwdform, 'status': 'failed'})
        else:
            return render(request,'myuser/guestsetting.html', {'login_user': login_user, 'role_id': role_id,'changepwdform': changepwdform, 'status': 'error'})