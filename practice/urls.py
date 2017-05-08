"""practice URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from myuser.views import *
from myassets.views import *
from myperm.views import *

urlpatterns = [
    # url(r'^admin/', admin.site.urls),
    url(r'^$', index, name='index'),
    url(r'^admin/$', admin, name='admin'),
    url(r'^guest/$', guest, name='guest'),
    url(r'^login/$', login, name='login'),
    url(r'^logout/$', logout, name='logout'),
    url(r'^user/groups/$', groups, name='groups'),
    url(r'^user/users/$', users, name='users'),
    url(r'^asset/assetgroups/$', assets_groups, name='assetgroups'),
    url(r'^asset/assets/$', assets, name='assets'),
    url(r'^asset/idcs/$', idcs, name='idcs'),
    url(r'^group/add/$', groupadd, name='groupadd'),
    url(r'^group/del/$', groupdel, name='groupdel'),
    url(r'^group/edit/$', groupedit, name='groupedit'),
    url(r'^group/edit/(?P<group_id>[0-9]+)', groupedit_detail, name='groupeditdetail'),
    url(r'^group/search/', group_search, name='groupsearch'),
    url(r'^user/add/$', useradd, name='useradd'),
    url(r'^user/del/$', userdel, name='userdel'),
    url(r'^user/edit/$', useredit, name='useredit'),
    url(r'^user/edit/(?P<user_id>[0-9]+)', useredit_detail, name='usereditdetail'),
    url(r'^user/search/', user_search, name='usersearch'),
    url(r'^user/changepassword/$', changepwd, name='changepwd'),
    url(r'^user/changepassword/(?P<user_id>[0-9]+)', change_password, name='changepassword'),
    url(r'^user/resetpassword/$', resetpwd, name='resetpwd'),
    url(r'^user/resetpassword/(?P<user_id>[0-9]+)', reset_password, name='resetpassword'),
    url(r'^asset/add/$', assets_add, name='assetsadd'),
    url(r'^asset/bulkadd/$', assets_bulk_add, name='bulkadd'),
    url(r'^asset/del/$', assets_del, name='assetsdel'),
    url(r'^asset/edit/$', assets_edit, name='assetsedit'),
    url(r'^asset/edit/(?P<asset_id>[0-9]+)', assets_edit_detail, name='assetseditdetail'),
    url(r'^asset/export/$', export_asset, name='exportasset'),
    url(r'^assetgroup/add/$', asset_group_add, name='assetgroupadd'),
    url(r'^assetgroup/del/$', asset_group_del, name='assetgroupdel'),
    url(r'^assetgroup/edit/$', asset_group_edit, name='assetgroupedit'),
    url(r'^assetgroup/edit/(?P<group_id>[0-9]+)', asset_group_edit_detail, name='assetgroupeditdetail'),
    url(r'^idc/add/$', idc_add, name='idcadd'),
    url(r'^idc/del/$', idc_del, name='idcdel'),
    url(r'^idc/edit/$',idc_edit, name='idcedit'),
    url(r'^idc/edit/(?P<idc_id>[0-9]+)', idc_edit_detail, name='idceditdetail'),
    url(r'^susetting/$', super_setting, name='susetting'),
    url(r'^ausetting/$', admin_setting, name='ausetting'),
    url(r'^gusetting/$', guest_setting, name='gusetting'),
    url(r'^test', test, name='test'),

]
