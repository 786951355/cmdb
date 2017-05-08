# coding: utf-8

import os, sys, time, re
import hashlib
import datetime
import random
import subprocess
import uuid
import json

from django.http import HttpResponse, Http404
from myuser.models import MyUser
from myassets.models import Asset, AssetGroup

from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from django.core.mail import send_mail
from django.core.urlresolvers import reverse


def defend_attack(func):
    def _deco(request, *args, **kwargs):
        if int(request.session.get('visit', 1)) > 10:
            return HttpResponse('Forbidden', status=403)
        request.session['visit'] = request.session.get('visit', 1) + 1
        request.session.set_expiry(7200)
        return func(request, *args, **kwargs)
    return _deco


#
# def require_role(role='user'):
#     """
#     decorator for require user role in ["super", "admin", "user"]
#     要求用户是某种角色 ["super", "admin", "user"]的装饰器
#     """
#
#     def _deco(func):
#         def __deco(request, *args, **kwargs):
#             # request.session['pre_url'] = request.path
#             # if not request.user.is_authenticated():
#             #     return HttpResponseRedirect(reverse('login'))
#             if role == 'super':
#                 if request.user.role == 'SU':
#                     return HttpResponseRedirect(reverse('index'))
#             elif role == 'admin':
#                 if request.user.role == 'AU':
#                     return HttpResponseRedirect(reverse('admin'))
#             elif role == 'user':
#                 print(request.user.role, '===================================================')
#                 # if request.user.role == 'CU':
#                 return HttpResponseRedirect(reverse('guest'))
#             return func(request, *args, **kwargs)
#         return __deco
#     return _deco
#
#
# def is_role_request(request, role='user'):
#     """
#     require this request of user is right
#     要求请求角色正确
#     """
#     role_all = {'user': 'CU', 'admin': 'AU', 'super': 'SU'}
#     if request.user.role == role_all.get(role, 'CU'):
#         return True
#     else:
#         return False