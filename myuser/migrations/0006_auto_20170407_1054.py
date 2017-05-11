# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-04-07 02:54
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myassets', '0004_auto_20170407_1054'),
        ('myuser', '0005_auto_20170405_1630'),
    ]

    operations = [
        migrations.AddField(
            model_name='myuser',
            name='asset',
            field=models.ManyToManyField(to='myassets.Asset'),
        ),
        migrations.AddField(
            model_name='myuser',
            name='assetgroup',
            field=models.ManyToManyField(to='myassets.AssetGroup'),
        ),
    ]