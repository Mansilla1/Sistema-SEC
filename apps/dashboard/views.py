#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Código desarrollado por Daniel Mansilla
from __future__ import unicode_literals, absolute_import 
from django.shortcuts import render
from django.views.generic import View

from apps.preguntas.models import *
from apps.evaluacion.models import *
from apps.contenidos.models import *
from apps.usuarios.models import *
from django.contrib.auth.models import User
from django.db.models import Count

from django.http import JsonResponse

def index(request):
	# ------------------------------------------
	#	OBTENER RANKINGS
	# ------------------------------------------
	user_pregunta = User.objects.exclude(perfilusuario__tipo_usuario='Estudiante').annotate(preguntas=Count('pregunta')).order_by('-preguntas')[:5]
	user_evaluacion = User.objects.exclude(perfilusuario__tipo_usuario='Estudiante').annotate(evaluaciones=Count('evaluacion')).order_by('-evaluaciones')[:5]

	orden_preguntas = Pregunta.objects.all().order_by('-cant_usada')[:5]

	context = {
		'user_pregunta': user_pregunta,
		'user_evaluacion': user_evaluacion,
		'orden_preguntas': orden_preguntas,
	}
	return render(request, 'index.html', context)


class Dashboard(View):
	def get(self, request, *args, **kwargs):
		orden_preguntas = Pregunta.objects.all().order_by('-cant_usada')[:5]

		context = {
			'orden_preguntas': orden_preguntas,
		}

		return render(request, 'apps/dashboard/charts.html', context)


def get_data(request, *args, **kwargs):
	preguntas_gestion = Pregunta.objects.filter(asignatura__eje_curricular__icontains='Gestion de proyectos', status=True).count()
	preguntas_desarrollo = Pregunta.objects.filter(asignatura__eje_curricular__icontains='Desarrollo de software', status=True).count()
	preguntas_arquitectura = Pregunta.objects.filter(asignatura__eje_curricular__icontains='Arquitectura de software', status=True).count()
	preguntas_ingles = Pregunta.objects.filter(asignatura__eje_curricular__icontains='Comprender y comunicarse en idioma ingles', status=True).count()

	formacion = ["Gestión de Proyectos", "Desarrollo de Software", "Arquitectura de Software", "Comprender y comunicarse en idioma inglés"]
	preguntas_total = [preguntas_gestion, preguntas_desarrollo, preguntas_arquitectura, preguntas_ingles]
	# preguntas_total = [5,10,20,1]


	data = {
		'formacion': formacion,
		'preguntas_total': preguntas_total,
	}

	return JsonResponse(data)


def tasa_rechazo(request, *args, **kwargs):
	preguntas_gestion = Pregunta.objects.filter(asignatura__eje_curricular__icontains='Gestion de proyectos', status=False).count()
	preguntas_desarrollo = Pregunta.objects.filter(asignatura__eje_curricular__icontains='Desarrollo de software', status=False).count()
	preguntas_arquitectura = Pregunta.objects.filter(asignatura__eje_curricular__icontains='Arquitectura de software', status=False).count()
	preguntas_ingles = Pregunta.objects.filter(asignatura__eje_curricular__icontains='Comprender y comunicarse en idioma ingles', status=False).count()

	formacion = ["Gestión de Proyectos", "Desarrollo de Software", "Arquitectura de Software", "Comprender y comunicarse en idioma inglés"]
	preguntas_total = [preguntas_gestion, preguntas_desarrollo, preguntas_arquitectura, preguntas_ingles]
	# preguntas_total = [5,10,20,1]


	data = {
		'formacion': formacion,
		'preguntas_total': preguntas_total,
	}

	return JsonResponse(data)

def get_data_evaluacion(request, *args, **kwargs):
	evaluaciones_gestion = Evaluacion.objects.filter(curso__asignatura__eje_curricular__icontains='Gestion de proyectos', disponible=True).count()
	evaluaciones_desarrollo = Evaluacion.objects.filter(curso__asignatura__eje_curricular__icontains='Desarrollo de software', disponible=True).count()
	evaluaciones_arquitectura = Evaluacion.objects.filter(curso__asignatura__eje_curricular__icontains='Arquitectura de software', disponible=True).count()
	evaluaciones_ingles = Evaluacion.objects.filter(curso__asignatura__eje_curricular__icontains='Comprender y comunicarse en idioma ingles', disponible=True).count()

	formacion = ["Gestión de Proyectos", "Desarrollo de Software", "Arquitectura de Software", "Comprender y comunicarse en idioma inglés"]
	evaluaciones_total = [evaluaciones_gestion, evaluaciones_desarrollo, evaluaciones_arquitectura, evaluaciones_ingles]
	# preguntas_total = [5,10,20,1]


	data = {
		'formacion': formacion,
		'evaluaciones_total': evaluaciones_total,
	}

	return JsonResponse(data)


def get_evaluacion_preguntas(request, *args, **kwargs):
	preguntas = [12, 19, 3, 17, 28, 24, 7, 9, 4, 6, 13, 25]
	evaluaciones = [25, 29, 5, 5, 20, 3, 10, 45, 34, 58, 27, 31]


	meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]
	data = {
		'meses': meses,
		'preguntas': preguntas,
		'evaluaciones': evaluaciones,
	}
	return JsonResponse(data)

