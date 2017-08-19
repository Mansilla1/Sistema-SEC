#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Código desarrollado por Daniel Mansilla
from __future__ import unicode_literals, absolute_import 
from django.shortcuts import render, redirect
from django.views.generic import View

from apps.preguntas.models import *
from apps.evaluacion.models import *
from apps.contenidos.models import *
from apps.usuarios.models import *
from apps.usuarios.forms import RegistroForm
from django.contrib.auth.models import User
from django.db.models import Count

from django.http import JsonResponse
import datetime
import calendar

#	INDEX
def index(request):
	# ------------------------------------------
	#	OBTENER RANKINGS
	# ------------------------------------------
	user_pregunta = User.objects.exclude(perfilusuario__tipo_usuario='Estudiante').annotate(preguntas=Count('pregunta')).order_by('-preguntas')[:5]
	user_evaluacion = User.objects.exclude(perfilusuario__tipo_usuario='Estudiante').annotate(evaluaciones=Count('evaluacion')).order_by('-evaluaciones')[:5]

	orden_preguntas = Pregunta.objects.all().order_by('-cant_usada')[:5]

	preguntas_evaluar = Pregunta.objects.filter(status=False, observacion='', corregida=False, rechazada=False).order_by('created_at')[:5] # Para comité evaluador

	evaluaciones_profe = Evaluacion.objects.filter(docente=request.user, disponible=True).order_by('creado_en')[:5] # Obtener evaluaciones elaboradas por docentes

	context = {
		'user_pregunta': user_pregunta,
		'user_evaluacion': user_evaluacion,
		'orden_preguntas': orden_preguntas,

		'preguntas_evaluar': preguntas_evaluar,
		'evaluaciones_profe': evaluaciones_profe,
	}
	return render(request, 'index.html', context)

#	DASHBOARDS
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
	#	Preguntas Propuestas
	preguntas_gestion1 = Pregunta.objects.filter(asignatura__eje_curricular__icontains='Gestion de proyectos').count()
	preguntas_desarrollo1 = Pregunta.objects.filter(asignatura__eje_curricular__icontains='Desarrollo de software').count()
	preguntas_arquitectura1 = Pregunta.objects.filter(asignatura__eje_curricular__icontains='Arquitectura de software').count()
	preguntas_ingles1 = Pregunta.objects.filter(asignatura__eje_curricular__icontains='Comprender y comunicarse en idioma ingles').count()

	#	Preguntas aceptadas
	preguntas_gestion2 = Pregunta.objects.filter(asignatura__eje_curricular__icontains='Gestion de proyectos', status=True).count()
	preguntas_desarrollo2 = Pregunta.objects.filter(asignatura__eje_curricular__icontains='Desarrollo de software', status=True).count()
	preguntas_arquitectura2 = Pregunta.objects.filter(asignatura__eje_curricular__icontains='Arquitectura de software', status=True).count()
	preguntas_ingles2 = Pregunta.objects.filter(asignatura__eje_curricular__icontains='Comprender y comunicarse en idioma ingles', status=True).count()

	formacion = ["Gestión de Proyectos", "Desarrollo de Software", "Arquitectura de Software", "Comprender y comunicarse en idioma inglés"]
	preguntas_propuestas = [preguntas_gestion1, preguntas_desarrollo1, preguntas_arquitectura1, preguntas_ingles1]
	preguntas_aceptadas = [preguntas_gestion2, preguntas_desarrollo2, preguntas_arquitectura2, preguntas_ingles2]


	data = {
		'formacion': formacion,
		'preguntas_propuestas': preguntas_propuestas,
		'preguntas_aceptadas': preguntas_aceptadas,
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


def get_obj_evaluacion(request, *args, **kwargs):
	nrc = request.GET['curso'] # Capturamos el id del curso
	# nrc=1
	cant_ev = Evaluacion.objects.filter(curso=nrc, disponible=True, descartada=False).count()
	evaluacions = Evaluacion.objects.filter(curso=nrc, disponible=True, descartada=False)

	ev = []
	# for i in range(int(cant_ev)):
	# 	ev += ['ev%s' % (i+1) ]

	i = 0
	a = 0
	for e in evaluacions:
		if e.tipo_evaluacion == 'Solemne':
			ev += ['sol%s' % (i+1) ]
			i += 1
		elif e.tipo_evaluacion == 'Control':
			ev += ['cl%s' % (a+1) ]
			a += 1
		elif e.tipo_evaluacion == 'Examen':
			ev += ['ex']
		else:
			ev += ['ev']


		

	obj_propuestos = []
	obj_cumplidos = []
	for i in evaluacions:
		#obj propuestos
		objs = 0
		for obj in i.contenidos.all():
			# if obj.aprendizaje != '':
			# 	objs += 1
			# else:
			# 	objs += 0
			for j in obj.contenido_set.all():
				if j.aprendizaje_esperado != '':
					objs += 1
				else:
					objs += 0
				# objs += j.aprendizaje_esperado.count()
		obj_propuestos += [objs]

		# obj evaluados
		objs2 = 0
		for p in i.preguntas.all():
			for c in p.contenido.all():
				objs2 += 1
		obj_cumplidos += [objs2]



	data = {
		'ev': ev, # labels
		'obj_propuestos': obj_propuestos,
		'obj_cumplidos': obj_cumplidos,
	}
	return JsonResponse(data)


def estado_preguntas_mes(request, *args, **kwargs):
	now = datetime.datetime.now()
	year = int(now.year) # 2017

	preguntas_propuestas = []
	preguntas_aceptadas = []

	tiempo = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]

	for i in range(1, 13):
		month = i
		days = calendar.monthrange(year,i)
		first_date = datetime.date(year, month, 1)
		last_date = datetime.date(year, month, days[1])

		preguntas_propuestas += [Pregunta.objects.filter(created_at__range=(first_date, last_date)).count()]
		preguntas_aceptadas += [Pregunta.objects.filter(created_at__range=(first_date, last_date), status=True).count()]

	data = {
		'tiempo': tiempo,
		'preguntas_propuestas': preguntas_propuestas,
		'preguntas_aceptadas': preguntas_aceptadas,
	}

	return JsonResponse(data)

def estado_preguntas_mesElegir(request, *args, **kwargs):
	now = datetime.datetime.now()
	year = int(now.year) # 2017

	mes = request.GET['mes' or None]
	mes = int(mes)
	print mes

	# elegir mes
	if mes == 0: #	Todos los meses
		preguntas_propuestas = []
		preguntas_aceptadas = []

		tiempo = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]

		for i in range(1, 13):
			month = i
			days = calendar.monthrange(year,i)
			first_date = datetime.date(year, month, 1)
			last_date = datetime.date(year, month, days[1])

			preguntas_propuestas += [Pregunta.objects.filter(created_at__range=(first_date, last_date)).count()]
			preguntas_aceptadas += [Pregunta.objects.filter(created_at__range=(first_date, last_date), status=True).count()]

	else: # Semanas
		preguntas_propuestas = []
		preguntas_aceptadas = []

		tiempo = ["Semana 1", "Semana 2", "Semana 3", "Semana 4"]


		days = calendar.monthrange(year,mes)
		first_date = datetime.date(year, mes, 1)
		last_date = datetime.date(year, mes, 7)
		# semana 1
		preguntas_propuestas += [Pregunta.objects.filter(created_at__range=(first_date, last_date)).count()]
		preguntas_aceptadas += [Pregunta.objects.filter(created_at__range=(first_date, last_date), status=True).count()]

		first_date = datetime.date(year, mes, 8)
		last_date = datetime.date(year, mes, 14)
		# semana 2
		preguntas_propuestas += [Pregunta.objects.filter(created_at__range=(first_date, last_date)).count()]
		preguntas_aceptadas += [Pregunta.objects.filter(created_at__range=(first_date, last_date), status=True).count()]

		first_date = datetime.date(year, mes, 15)
		last_date = datetime.date(year, mes, 21)
		# semana 3
		preguntas_propuestas += [Pregunta.objects.filter(created_at__range=(first_date, last_date)).count()]
		preguntas_aceptadas += [Pregunta.objects.filter(created_at__range=(first_date, last_date), status=True).count()]

		first_date = datetime.date(year, mes, 22)
		last_date = datetime.date(year, mes, days[1])
		# semana 4
		preguntas_propuestas += [Pregunta.objects.filter(created_at__range=(first_date, last_date)).count()]
		preguntas_aceptadas += [Pregunta.objects.filter(created_at__range=(first_date, last_date), status=True).count()]


	data = {
		'tiempo': tiempo,
		'preguntas_propuestas': preguntas_propuestas,
		'preguntas_aceptadas': preguntas_aceptadas,
	}

	return JsonResponse(data)


def get_evaluacion_preguntas(request, *args, **kwargs):
	now = datetime.datetime.now()
	year = int(now.year) # 2017

	# month = 8
	# day = 1
	preguntas = []
	evaluaciones = []
	for i in range(1,13):
		month = i
		days = calendar.monthrange(year,i)

		first_date = datetime.date(year, month, 1)
		last_date = datetime.date(year, month, days[1])
		preguntas += [Pregunta.objects.filter(created_at__range=(first_date, last_date), status=True).count()]
		evaluaciones += [Evaluacion.objects.filter(ultima_modificacion__range=(first_date, last_date), disponible=True, descartada=False).count()]

	meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]
	data = {
		'meses': meses,
		'preguntas': preguntas,
		'evaluaciones': evaluaciones,
	}
	return JsonResponse(data)



#	CONFIGURACIÓN
def config_preguntas(request):
	if request.GET:
		contador = int(request.GET.get('cant_utilizar'))
	else:
		contador = 10

	preguntas = Pregunta.objects.filter(status=True, cant_usada__gte=contador-1).order_by('cant_usada')

	context = {
		'preguntas': preguntas,
		'contador': contador
	}

	return render(request, 'apps/configuracion/configuracion_preguntas.html', context)

def config_perfil1(request):
	usuario = PerfilUsuario.objects.get(user__id=request.user.pk)

	if request.POST:
		nombres = request.POST.get('nombres')
		apellido1 = request.POST.get('apellido1')
		apellido2 = request.POST.get('apellido2')
		email = request.POST.get('email')

		usuario.nombres = nombres
		usuario.apellido1 = apellido1
		usuario.apellido2 = apellido2
		usuario.email = email
		usuario.save()

		return redirect('dashboard:config-perfil1')



	context = {
		'usuario': usuario,
	}

	return render(request, 'apps/configuracion/configuracion_perfil1.html', context)

def config_perfil2(request):
	usuario = User.objects.get(id=request.user.pk)

	if request.method == 'GET':
		form = RegistroForm(instance=usuario)

	else:
		form = RegistroForm(request.POST, instance=usuario)

		if form.is_valid():
			form.save()

			return redirect('dashboard:config-perfil2')


	context = {
		'usuario': usuario,
		'form': form,
	}

	return render(request, 'apps/configuracion/configuracion_perfil2.html', context)