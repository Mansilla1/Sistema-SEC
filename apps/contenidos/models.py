#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Código desarrollado por Daniel Mansilla
from __future__ import unicode_literals, absolute_import

from django.db import models

from apps.usuarios.models import PerfilUsuario, Estudiante

class Sede(models.Model):
	sede = models.CharField(max_length=255, default='Antonio Varas')
	lugar = models.CharField(max_length=255, blank=True, null=True)

	def __unicode__(self):
		return self.sede

class Facultad(models.Model):
	facultad = models.CharField(max_length=255, default='Ingenieria')

	def __unicode__(self):
		return self.facultad

class Carrera(models.Model):
	carrera = models.CharField(max_length=200)
	sede = models.ForeignKey(Sede, on_delete=models.CASCADE)
	facultad = models.ForeignKey(Facultad, on_delete=models.CASCADE)

	def __unicode__(self):
		return self.carrera


class Asignatura(models.Model):
	carrera = models.ForeignKey(Carrera, on_delete=models.CASCADE)
	codigo = models.CharField(max_length=10, unique=True, verbose_name="Código asignatura")
	nombre = models.CharField(max_length=100, verbose_name='Nombre de asignatura')
	coordinador = models.ForeignKey(PerfilUsuario, on_delete=models.CASCADE)

	duracion = models.CharField(max_length=50, blank=True, null=True)
	creditos = models.IntegerField()
	nivel = models.CharField(max_length=50, verbose_name="Período")
	caracter = models.CharField(max_length=50, blank=True, null=True)
	horas_teoricas = models.IntegerField(blank=True, null=True)
	horas_laboratorio = models.IntegerField(blank=True, null=True)
	horas_teoricas_personal = models.IntegerField(blank=True, null=True, editable=False)
	horas_laboratorio_personal = models.IntegerField(blank=True, null=True, editable=False)
	horas_dedicadas = models.IntegerField(blank=True, null=True, editable=False)
	programas_academicos = models.CharField(max_length=100, blank=True, null=True)
	pre_requisitos = models.CharField(max_length=50, blank=True, null=True)
	nombre_requisito = models.CharField(max_length=100, blank=True, null=True)
	co_requisitos =  models.CharField(max_length=50, blank=True, null=True)
	equivalencias = models.CharField(max_length=50, blank=True, null=True)
	eje_curricular = models.CharField(max_length=255, blank=True, null=True)
	creado_en = models.DateTimeField(auto_now_add=True)
	ultima_modificacion = models.DateTimeField(auto_now=True)
	disponible = models.BooleanField(default=True)
	#dato importante! 
	tipo = (
		('Regular', 'Regular'),
		('Advance', 'Advance'),
	)
	tipo_programa = models.CharField(max_length=15 ,choices=tipo)

	def save(self):
		if not self.horas_laboratorio:
			self.horas_laboratorio = 0

		self.horas_teoricas_personal = int(self.horas_teoricas) / 2
		self.horas_laboratorio_personal = int(self.horas_laboratorio) / 2

		self.horas_dedicadas = int(self.horas_teoricas) + int(self.horas_laboratorio) + int(self.horas_teoricas_personal) + int(self.horas_laboratorio_personal)
		super(Asignatura, self).save()

	def __str__(self):
		return self.codigo

class Curso(models.Model):
	nrc = models.CharField(max_length=50)
	asignatura = models.ForeignKey(Asignatura, on_delete=models.CASCADE)
	docente = models.ForeignKey(PerfilUsuario, on_delete=models.CASCADE)
	estudiantes = models.ManyToManyField(Estudiante, blank=True)

	regimen = models.CharField(max_length=200)
	status = models.BooleanField(default=True)

	def __str__(self):
		return self.nrc


class Unidad(models.Model):
	nombre = models.CharField(max_length=150)
	asignatura = models.ForeignKey(Asignatura, verbose_name='Asignatura', on_delete=models.CASCADE)
	unidad = models.IntegerField(null=True)

	def __unicode__(self): 	#__unicode__ para atributos que tengan caracteres en español
		return self.nombre

class Contenido(models.Model):
	unidad = models.ForeignKey(Unidad, on_delete=models.CASCADE)
	contenido = models.CharField(max_length=150)
	aprendizaje_esperado = models.TextField(null=True, blank=True)

	def __unicode__(self): 	#__unicode__ para atributos que tengan caracteres en español
		return self.contenido



class Informacion(models.Model):
	asignatura = models.ForeignKey(Asignatura, verbose_name='Asignatura', on_delete=models.CASCADE)
	objetivos_educacionales = models.TextField(blank=True, null=True, verbose_name="Objetivos educacionales")
	competencias_egreso = models.TextField(blank=True, null=True, verbose_name="Competencias de egreso")
	aprendizaje = models.TextField(blank=True, null=True, verbose_name="Resultados de aprendizaje")
	descripcion = models.TextField(blank=True, null=True, verbose_name="Descripción general")
	habilidades = models.TextField(blank=True, null=True, verbose_name="Habilidades transversales")
	modalidad = models.TextField(blank=True, null=True, verbose_name="Modalidad didáctica y procedimientos de evaluaciones")


class CondicionesAprobacion(models.Model):
	asignatura = models.ForeignKey(Asignatura, on_delete=models.CASCADE)
	descripcion_condicion = models.TextField()

class Bibliografia(models.Model):
	asignatura = models.ForeignKey(Asignatura, on_delete=models.CASCADE)
	tipo = (
		('Obligatoria', 'Obligatoria'),
		('Complementaria', 'Complementaria'),
		('Linea', 'Recursos en línea'),
	)
	tipo_biblio = models.CharField(max_length=50 ,choices=tipo, verbose_name="Tipo de bibliografía")
	bibliografia = models.TextField(verbose_name="Bibliografía")

