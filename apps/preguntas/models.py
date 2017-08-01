#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Código desarrollado por Daniel Mansilla
from __future__ import unicode_literals, absolute_import 
from django.core.validators import MaxValueValidator

from django.db import models

from django.contrib.auth.models import User
from apps.contenidos.models import Asignatura, Unidad, Contenido

from django.conf import settings
from sorl.thumbnail import ImageField


class Pregunta(models.Model):
	asignatura = models.ForeignKey(Asignatura, on_delete=models.CASCADE)
	unidad = models.ForeignKey(Unidad, on_delete=models.CASCADE)
	contenido = models.ManyToManyField(Contenido, blank=True)
	tipo = (
		('Pregunta de desarrollo', 'Pregunta de desarrollo'),
		('Seleccion multiple', 'Selección múltiple'),
		('Terminos pareados', 'Términos pareados'),
	)
	tipo_pregunta = models.CharField(max_length=200, choices=tipo, blank=True, null=True)
	pregunta = models.TextField()
	difi = (
		('Basica', 'Básica'),
		('Intermedia', 'Intermedia'),
		('Avanzada', 'Avanzada'),
	)
	dificultad = models.CharField(max_length=200, choices=difi, blank=True, null=True)
	imagen_pregunta = models.ImageField(upload_to='Preguntas/', blank=True, null=True)
	usuario = models.ForeignKey(User, blank=True, null=True)
	observacion = models.CharField(max_length=120, blank=True, null=True)
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)
	status = models.BooleanField(default=False)
	count = models.IntegerField(null=True, blank=True, editable=False, default=0)
	corregida = models.BooleanField(default=False)
	rechazada = models.BooleanField(default=False)
	cant_usada = models.IntegerField(null=True, blank=True, editable=False, default=0)

	def save(self):
		self.count += 1
		super(Pregunta, self).save()


class Respuesta(models.Model):
	pregunta = models.ForeignKey(Pregunta, on_delete=models.CASCADE, blank=True, null=True)
	opcion = models.CharField(max_length=1, blank=True, null=True)
	respuesta = models.TextField()
	imagen_respuesta = models.ImageField(upload_to='Respuestas/', blank=True, null=True)
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)
	status_respuesta = models.BooleanField(default=False)

	def __str__(self):
		return self.respuesta