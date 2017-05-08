from django.shortcuts import render, HttpResponseRedirect, reverse
from django.contrib.auth.decorators import login_required
from myassets.models import AssetGroup, Asset, IDC
from myuser.models import MyUser
from myassets.forms import AssetGroupFrom, AssetForm, IDCForm, UploadFileForm
from django.contrib.messages import get_messages
from django.contrib import messages
from django.http import HttpResponse, JsonResponse
from practice.settings import MEDIA_ROOT, STATICFILES_DIRS, STATIC_URL
import os, shutil
import datetime
import xlrd
from utils.utils import dbexport
# Create your views here.

@login_required
def assets_groups(request):
    role_id = request.session.get('role_id')
    login_user = MyUser.objects.get(email=request.user)
    asset_groups = MyUser.objects.get(email=request.user).assetgroup.all()
    print(asset_groups)
    return render(request, 'myassets/assetgroups.html', {'asset_groups': asset_groups, 'role_id': role_id, 'login_user': login_user})


@login_required
def asset_group_add(request):
    if MyUser.objects.get(email=request.user).has_perm('myassets.add_assetgroup'):
        asset_groups = AssetGroup.objects.all()
        all_assets = Asset.objects.all()
        if request.method == 'GET':
            role_id = request.session.get('role_id')
            login_user = MyUser.objects.get(email=request.user)
            groupform = AssetGroupFrom()
            status = get_messages(request)
            return render(request, 'myassets/groupadd.html',
                          {'asset_groups': asset_groups, 'groupform': groupform, 'all_assets': all_assets, 'status': status,
                           'role_id': role_id, 'login_user': login_user})
        else:
            groupform = AssetGroupFrom(request.POST)
            if groupform.is_valid():
                params = dict(request.POST)
                selected_host = params.get('searchable[]', '')
                selected_host_obj = [Asset.objects.get(ip=host.split('--')[1]) for host in selected_host]
                group = groupform.save()
                if selected_host:
                    for host in selected_host_obj:
                        host.group.add(group.pk)
                        host.save()
                messages.success(request,'添加用户组成功')
                return HttpResponseRedirect(reverse('assetgroupadd'))
            else:
                return render(request, 'myassets/groupadd.html', {'groupform': groupform, 'all_assets': all_assets})
    else:
        return render(request, 'base/403.html')


@login_required
def asset_group_del(request):
    if MyUser.objects.get(email=request.user).has_perm('myuser.delete_group'):
        group_ids = request.GET.get('id', '')
        group_id_list = group_ids.split(',')
        [AssetGroup.objects.filter(id=group_id).delete() for group_id in group_id_list]
        return HttpResponse('删除成功')
    return HttpResponse('你没有权限删除组')


@login_required
def asset_group_edit(request):
    pass


@login_required
def asset_group_edit_detail(request, group_id):
    if MyUser.objects.get(email=request.user).has_perm('myassets.change_assetgroup'):
        if request.method == 'GET':
            role_id = request.session.get('role_id')
            login_user = MyUser.objects.get(email=request.user)
            asset_group = AssetGroup.objects.get(id=group_id)
            all_assets = Asset.objects.all()
            selected_asset = asset_group.asset_set.all()
            groupform = AssetGroupFrom(instance=asset_group)
            return render(request, 'myassets/groupedit.html', {'groupform': groupform, 'all_assets': all_assets,
                                                               'selected_asset': selected_asset, 'group_id': group_id,
                                                               'role_id': role_id, 'login_user': login_user})
        elif request.method == 'POST':
            asset_group = AssetGroup.objects.get(id=group_id)
            groupform = AssetGroupFrom(request.POST, instance=asset_group)
            if groupform.is_valid():
                params = dict(request.POST)
                selected_asset = params.get('searchable[]','')
                selected_asset_obj = [Asset.objects.get(ip=host.split('--')[1]) for host in selected_asset]
                exist_asset = list(asset_group.asset_set.all())
                group = groupform.save()
                gid = group.pk
                if selected_asset:
                    for asset in selected_asset_obj:
                        if asset not in exist_asset:
                            asset.group.add(gid)
                            asset.save()
                        else:
                            exist_asset.remove(asset)
                if exist_asset:
                    for asset in exist_asset:
                        asset.group.remove(gid)
                        asset.save()
                return HttpResponseRedirect(reverse('assetgroups'))
            messages.error(request, '数据修改失败,请检查！')
            return render(request, 'myassets/groupedit.html')
    else:
        return render(request, 'base/403.html')


@login_required
def assets(request):
    role_id = request.session.get('role_id')
    login_user = MyUser.objects.get(email=request.user)
    if login_user.is_superuser:
        all_assets = Asset.objects.all()
    else:
        all_assets = login_user.asset.all()
    return render(request, 'myassets/assets.html', {'all_assets': all_assets, 'role_id': role_id, 'login_user': login_user})


@login_required
def assets_add(request):
    if MyUser.objects.get(email=request.user).has_perm('myassets.add_asset'):
        if request.method == 'GET':
            role_id = request.session.get('role_id')
            login_user = MyUser.objects.get(email=request.user)
            assetform = AssetForm()
            status = get_messages(request)
            return render(request, 'myassets/assetadd.html', {'assetform': assetform, 'status': status, 'role_id': role_id, 'login_user': login_user})
        elif request.method == 'POST':
            assetform = AssetForm(request.POST)
            if assetform.is_valid():
                assetform.save()
                messages.success(request, '添加资产成功')
                return HttpResponseRedirect(reverse('assetsadd'))
            return render(request, 'myassets/assetadd.html', {'assetform': assetform, 'status': '添加失败'})
    else:
        return render(request, 'base/403.html')


@login_required
def assets_bulk_add(request):
    if MyUser.objects.get(email=request.user).has_perm('myassets.add_asset'):
        if request.method == 'POST':
            form = UploadFileForm(request.POST, request.FILES)
            if form.is_valid():
                upfile = request.FILES['file']
                filename = 'cmdb.xlsx'
                path = os.path.join(MEDIA_ROOT, 'upload', 'file', datetime.datetime.now().strftime("%Y_%m_%d_%H_%M_%S"))
                print(path)
                if not os.path.exists(path):
                    os.mkdir(path)
                asset_file = os.path.join(path, filename)
                with open(asset_file, 'wb') as f:
                    for line in upfile.readlines():
                        f.write(line)
                try:
                    f = xlrd.open_workbook(asset_file)
                    sheet1 = f.sheet_by_name(f.sheet_names()[0])
                    rows = sheet1.nrows
                    for n in range(1, rows):
                        row = sheet1.row_values(n)
                        if row:
                            id, ip, other_ip, hostname, port, username, password, use_default_auth, mac, remote_ip, brand, cpu, memory, disk, system_type, system_version, system_arch, cabinet, position, number, status, asset_type, env, sn, date_added, is_active, comment, idc_id = row
                            if Asset.objects.filter(hostname=hostname).exists():
                                continue
                            asset = Asset(ip=ip, other_ip=other_ip, hostname=hostname, cpu=cpu, memory=memory, disk=disk, system_type=system_type,
                                          system_arch=system_arch, status=int(status),system_version=str(system_version),comment=comment ,is_active=int(is_active), idc_id=int(idc_id))
                            asset.clean_fields()
                            asset.save()
                    return HttpResponseRedirect(reverse('assets'))
                except Exception as e:
                    print('资产文件无法读取，请查检')
                    return HttpResponseRedirect(reverse('assets'))
            messages.error(request, '请检查每列是否填写完整，数据验证失败')
            return HttpResponseRedirect(reverse('assets'))
        else:
            uploadform = UploadFileForm()
            status = get_messages(request)
            role_id = request.session.get('role_id')
            login_user = MyUser.objects.get(email=request.user)
            return render(request, 'myassets/assetbulkadd.html', {'uploadform': uploadform, 'status': status, 'role_id': role_id, 'login_user': login_user})
    else:
        return render(request, 'base/403.html')


@login_required
def assets_del(request):
    if MyUser.objects.get(email=request.user).has_perm('myassets.delete_asset'):
        asset_ids = request.GET.get('id', '')
        asset_id_list = asset_ids.split(',')
        [Asset.objects.filter(id=asset_id).delete() for asset_id in asset_id_list]
        return HttpResponse('删除成功')
    else:
        return render(request, 'base/403.html')

@login_required
def assets_edit(request):
    pass


@login_required
def assets_edit_detail(request, asset_id):
    if MyUser.objects.get(email=request.user).has_perm('myassets.change_asset'):
        if request.method == 'GET':
            role_id = request.session.get('role_id')
            login_user = MyUser.objects.get(email=request.user)
            asset = Asset.objects.get(id=asset_id)
            assetform = AssetForm(instance=asset)
            status = get_messages(request)
            return render(request, 'myassets/assetedit.html', {'assetform': assetform, 'asset_id': asset_id, 'status': status, 'role_id': role_id, 'login_user': login_user})
        elif request.method == 'POST':
            asset = Asset.objects.get(id=asset_id)
            assetform = AssetForm(request.POST, instance=asset)
            if assetform.is_valid():
                assetform.save()
                return HttpResponseRedirect(reverse('assets'))
            messages.error(request, '数据不合法,{}'.format(assetform.errors))
            return render(request, 'myassets/assetedit.html', {'assetform': AssetForm(instance=asset)})
    else:
        return render(request, 'base/403.html')


@login_required
def idcs(request):
    role_id = request.session.get('role_id')
    login_user = MyUser.objects.get(email=request.user)
    all_idcs = IDC.objects.all()
    idcform = IDCForm()
    return render(request, 'myassets/idcs.html', {'all_idcs': all_idcs, 'dicform': idcform, 'role_id': role_id, 'login_user': login_user})


@login_required
def idc_add(request):
    if MyUser.objects.get(email=request.user).has_perm('myassets.add_idc'):
        if request.method == 'GET':
            role_id = request.session.get('role_id')
            login_user = MyUser.objects.get(email=request.user)
            idcform = IDCForm()
            status = get_messages(request)
            return render(request, 'myassets/idcadd.html', {'idcform': idcform, 'status': status, 'role_id': role_id, 'login_user': login_user})
        elif request.method == 'POST':
            idcform = IDCForm(request.POST)
            if idcform.is_valid():
                idcform.save()
                return HttpResponseRedirect(reverse('idcs'))
            messages.error(request, '数据不合法，请查检')
            return render(request, 'myassets/idcs.html')
    return render(request, 'base/403.html')


@login_required
def idc_del(request):
    if MyUser.objects.get(email=request.user).has_perm('myassets.delete_idc'):
        idc_ids = request.GET.get('id', '')
        idc_id_list = idc_ids.split(',')
        [IDC.objects.filter(id=idc_id).delete() for idc_id in idc_id_list]
        return HttpResponse('删除成功')
    else:
        return HttpResponse('没有权限删除机房')


@login_required
def idc_edit(request):
    pass


@login_required
def idc_edit_detail(request, idc_id):
    if MyUser.objects.get(email=request.user).has_perm('myassets.change_idc'):
        if request.method == 'GET':
            idc = IDC.objects.get(id=idc_id)
            idcform = IDCForm(instance=idc)
            status = get_messages(request)
            role_id = request.session.get('role_id')
            login_user = MyUser.objects.get(email=request.user)
            return render(request, 'myassets/idcedit.html', {'idcform': idcform, 'idc_id': idc_id, 'status': status, 'role_id': role_id, 'login_user': login_user})
        elif request.method == 'POST':
            idc = IDC.objects.get(id=idc_id)
            idcform = IDCForm(request.POST, instance=idc)
            if idcform.is_valid():
                idcform.save()
                return HttpResponseRedirect(reverse('idcs'))
            messages.error(request, '数据不合法，请查检')
            return render(request, 'myassets/idcedit.html')
    else:
        return render(request, 'base/403.html')


@login_required
def export_asset(request):
    if request.method == 'GET':
        try:
            filename = 'asset_' + datetime.datetime.now().strftime("%Y_%m_%d_%H_%M_%S") + '.xlsx'
            outpath = os.path.join(MEDIA_ROOT, 'export', filename)
            host = '127.0.0.1'
            dbname = 'assetdb'
            user = 'root'
            password = 'root'
            table_name = 'myassets_asset'
            dbexport(host=host, dbname=dbname, user=user, password=password, table_name=table_name, outputpath=outpath)
            shutil.copy(outpath, os.path.join(STATICFILES_DIRS[0], 'excel'))
            data = {'status': 'success', 'path': '{}{}/{}'.format(STATIC_URL, 'excel', filename)}
            return JsonResponse(data)
        except Exception as e:
            print(e)
            return JsonResponse('导出失败')


def test(reqeust):
    return render(reqeust, 'myuser/test.html')