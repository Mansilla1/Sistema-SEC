# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-08-03 01:34
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('preguntas', '0005_auto_20170729_0345'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pregunta',
            name='dificultad',
            field=models.CharField(blank=True, choices=[('Basica', 'B\xe1sica'), ('Intermedia', 'Intermedia'), ('Avanzada', 'Avanzada')], max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='pregunta',
            name='tipo_pregunta',
            field=models.CharField(blank=True, choices=[('Pregunta de desarrollo', 'Pregunta de desarrollo'), ('Seleccion multiple', 'Selecci\xf3n m\xfaltiple'), ('Terminos pareados', 'T\xe9rminos pareados')], max_length=200, null=True),
        ),
    ]