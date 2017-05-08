import re
from django import forms
from django.forms import ModelForm
from django.contrib.auth.models import Group
from myuser.models import MyUser


def check_password_complexity(pwd):
    def checklen(pwd):
        return len(pwd) >= 8

    def checkContainUpper(pwd):
        pattern = re.compile('[A-Z]+')
        match = pattern.findall(pwd)
        if match:
            return True
        else:
            return False

    def checkContainNum(pwd):
        pattern = re.compile('[0-9]+')
        match = pattern.findall(pwd)
        if match:
            return True
        else:
            return False

    def checkContainLower(pwd):
        pattern = re.compile('[a-z]+')
        match = pattern.findall(pwd)
        if match:
            return True
        else:
            return False

    def checkPassword(pwd):
        lenOK = checklen(pwd)
        upperOK = checkContainUpper(pwd)
        lowerOK = checkContainLower(pwd)
        numOK = checkContainNum(pwd)
        return lenOK and upperOK and lowerOK and numOK

    return checkPassword(pwd)


class GroupForm(ModelForm):
    class Meta:
        model = Group
        fields = '__all__'
        labels = {
            'name': '组名称',
            'permissions': '组权限'
        }
        widgets = {
            'permissions': forms.SelectMultiple(attrs={'size':12, "class": "am-field-valid"})
        }
        help_texts = {
            'permissions': ('按住ctrl键可以多选，编辑权限如果已经有选择的请按住ctrl键增删'),
        }


class UserForm(ModelForm):
    class Meta:
        model = MyUser
        fields = ['username', 'email', 'date_of_birth', 'groups', 'is_active', 'role', 'user_permissions', 'asset', 'assetgroup']
        labels = {
            'username': '姓名',
            'email': '邮箱',
            'date_of_birth': '出生日期',
            'groups': '所属用户组',
            'is_active': '是否激活',
            'role': '角色',
            'user_permissions': '权限',
            'asset': '资产列表',
            'assetgroup': '资产组'
        }
        widgets = {
            'date_of_birth': forms.TextInput(attrs={"class": "am-form-group am-form-field", "data-am-datepicker":"{theme: 'success'}"}),
            'role': forms.Select(attrs={"style":"color: #1a1a1a"}),
            'group': forms.SelectMultiple(attrs={'size': 6, "class": "am-field-valid"}),
            'user_permissions': forms.SelectMultiple(attrs={'size': 12, "class": "am-field-valid"}),
            'asset': forms.SelectMultiple(attrs={'size': 8, "class": "am-field-valid"}),
            'assetgroup': forms.SelectMultiple(attrs={'size': 8, "class": "am-field-valid"}),
        }
        help_texts = {
            'user_permissions': ('按住ctrl键可以多选，编辑权限如果已经有选择的请按住ctrl键增删'),
        }


class PasswordForm(forms.Form):
    password1 = forms.CharField(required=True,label='密码', widget=forms.PasswordInput(attrs={'placeholder': '密码', 'rows': 1}))
    password2 = forms.CharField(required=True,label='确认密码', widget=forms.PasswordInput(attrs={'placeholder': '确认密码', 'rows': 1}))

    def clean(self):
        cleaned_data = super(PasswordForm, self).clean()
        password1 = cleaned_data['password1']
        password2 = cleaned_data['password2']
        if password1 != password2:
            raise forms.ValidationError('密码不匹配')
        elif not check_password_complexity(password1):
            raise forms.ValidationError('密码长度不能小于8位并且要包含大小写')


class ChangePassworForm(forms.Form):
    oldpassword = forms.CharField(required=True,label='输入原密码', widget=forms.PasswordInput(attrs={'placeholder': '原密码', 'rows': 1}))
    newpassword1 = forms.CharField(required=True,label='输入新密码', widget=forms.PasswordInput(attrs={'placeholder': '新密码', 'rows': 1}))
    newpassword2 = forms.CharField(required=True,label='确认新密码', widget=forms.PasswordInput(attrs={'placeholder': '确认密码', 'rows': 1}))

    def clean(self):
        cleaned_data = super(ChangePassworForm, self).clean()
        newpassword1 = cleaned_data['newpassword1']
        newpassword2 = cleaned_data['newpassword2']
        if newpassword1 != newpassword2:
            raise forms.ValidationError('新密码不匹配')
        elif not check_password_complexity(newpassword1):
            raise forms.ValidationError('密码长度不能小于8位并且要包含大小写')


class ResetPasswordForm(forms.Form):
    newpassword1 = forms.CharField(required=True,label='输入新密码', widget=forms.PasswordInput(attrs={'placeholder': '新密码', 'rows': 1}))
    newpassword2 = forms.CharField(required=True,label='确认新密码', widget=forms.PasswordInput(attrs={'placeholder': '确认密码', 'rows': 1}))

    def clean(self):
        cleaned_data = super(ResetPasswordForm, self).clean()
        newpassword1 = cleaned_data['newpassword1']
        newpassword2 = cleaned_data['newpassword2']
        if newpassword1 != newpassword2:
            raise forms.ValidationError('新密码不匹配')
        elif not check_password_complexity(newpassword1):
            raise forms.ValidationError('密码长度不能小于8位并且要包含大小写')
