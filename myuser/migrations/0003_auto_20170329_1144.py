# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-03-29 03:44
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myuser', '0002_auto_20170329_1140'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='myuser',
            options={'permissions': (('can_viewuser', 'Can view users'), ('can_viewgroup', 'Can view groups'))},
        ),
    ]
