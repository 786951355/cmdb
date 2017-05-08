from django import forms
from django.forms import ModelForm
from myassets.models import AssetGroup, Asset, IDC

class AssetForm(ModelForm):
    class Meta:
        model = Asset
        # fields = ['hostname', 'ip', 'group',  'idc', 'comment', 'is_active', 'status', 'asset_type', 'env']
        fields = '__all__'
        labels = {
            'hostname': '主机名称',
            'ip': '主机IP',
            'group': '所属主机组',
            'idc': '机房',
            'comment': '备注',
            'is_active': '是否激活',
            'status': '机器状态',
            'asset_type': '资产类型',
            'env': '运行环境'
        }
        widgets = {
            'group': forms.SelectMultiple(attrs={'size':10}),
            'status': forms.Select(attrs={"style":"color: #1a1a1a"}),
            'asset_type': forms.Select(attrs={"style":"color: #1a1a2a"})
        }

class AssetGroupFrom(ModelForm):
    class Meta:
        model = AssetGroup
        fields = '__all__'
        labels = {
            'name': '资产组名称',
            'comment': '备注'
        }


class IDCForm(ModelForm):
    class Meta:
        model = IDC
        fields = '__all__'
        labels = {
            'name': '机房名称',
            'linkman': '联系人',
            'phone': '电话',
            'comment': '备注'
        }


class UploadFileForm(forms.Form):
    file = forms.FileField(label="文件")
