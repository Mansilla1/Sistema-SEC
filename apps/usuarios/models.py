#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals, absolute_import 

from django.db import models

from django.contrib.auth.models import User
# from apps.contenidos.models import Asignatura, Sesion, Seccion
# from apps.evaluacion.models import Evaluacion, Calificacion, Promedio
# from apps.preguntas.models import Pregunta

import datetime

# from django.conf import settings

class PerfilUsuario(models.Model):
	rut = models.CharField(max_length=12)
	nombres = models.CharField(max_length=200, blank=True, null=True)
	apellido1 = models.CharField(max_length=200, blank=True, null=True)
	apellido2 = models.CharField(max_length=200, blank=True, null=True)
	user = models.OneToOneField(User, on_delete=models.CASCADE, verbose_name='Usuario')
	email = models.EmailField(max_length=100, blank=True, null=True)
	foto = models.ImageField(upload_to='perfiles/', blank=True, null=True)
	numero_telefono = models.CharField(max_length=12, blank=True, null=True)
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)
	status = models.BooleanField(default=True)
	# tipo_user = (
	# 	('Estudiante', 'Estudiante'),
	# 	('Docente', 'Docente'),
	# 	('Directivo', 'Directivo'),
	# 	('Administrador', 'Administrador'),
	# 	('Comite academico', 'Comité académico'),
	# 	('Otro', 'Otro'),
	# )
	tipo_usuario = models.CharField(max_length=200, blank=True, null=True)
	# tipo_usuario_otro = models.CharField(max_length=100, blank=True, null=True)
	# secciones = models.ManyToManyField(Seccion, blank=True)
	# activation_key = models.CharField(max_length=40, blank=True)
	# key_expires = models.DateTimeField(default=datetime.date.today())

	def __str__(self):
		return self.rut

class Estudiante(models.Model):
	rut = models.CharField(max_length=12)
	nombre1 = models.CharField(max_length=200, blank=True, null=True)
	nombre2 = models.CharField(max_length=200, blank=True, null=True)
	nombre3 = models.CharField(max_length=200, blank=True, null=True)
	apellido1 = models.CharField(max_length=200, blank=True, null=True)
	apellido2 = models.CharField(max_length=200, blank=True, null=True)
	email = models.EmailField(max_length=100, blank=True, null=True)

	def __str__(self):
		return self.rut