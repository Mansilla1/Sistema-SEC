# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-07-29 06:57
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('preguntas', '0002_auto_20170729_0256'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pregunta',
            name='tipo_pregunta',
            field=models.CharField(choices=[('Pregunta de desarrollo', 'Pregunta de desarrollo'), ('Seleccion m\xfaltiple', 'Seleccion m\xfaltiple'), ('T\xe9rminos pareados', 'T\xe9rminos pareados')], max_length=200),
        ),
    ]
