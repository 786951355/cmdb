# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-04-07 02:54
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myassets', '0003_auto_20170407_1048'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='assetperm',
            name='asset',
        ),
        migrations.RemoveField(
            model_name='assetperm',
            name='group',
        ),
        migrations.RemoveField(
            model_name='assetperm',
            name='user',
        ),
        migrations.DeleteModel(
            name='AssetPerm',
        ),
    ]