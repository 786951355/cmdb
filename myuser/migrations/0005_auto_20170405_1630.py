# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-04-05 08:30
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myuser', '0004_auto_20170329_1532'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='myuser',
            options={'permissions': (('can_viewuser', 'Can view users'), ('can_viewgroup', 'Can view groups'), ('change_password', 'Can change_password'), ('reset_password', 'Can reset_password'))},
        ),
    ]