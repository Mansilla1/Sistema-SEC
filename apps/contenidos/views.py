#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Código desarrollado por Daniel Mansilla
from django.shortcuts import render, render_to_response, redirect, get_object_or_404
from django.db.models import Q
from django.core.urlresolvers import reverse_lazy

from django.views.generic import TemplateView, ListView, CreateView, UpdateView, DeleteView, View

from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from django.core.exceptions import RequestDataTooBig
from django.core import serializers

from django.conf import settings
from io import BytesIO
from reportlab.pdfgen import canvas
import openpyxl
from openpyxl import Workbook
from openpyxl.styles import Font

from Proyecto.utilities import render_pdf, generate_pdf

from django.contrib.auth.models import User
import requests
import ast

from .models import *
from .forms import *


#	ASIGNATURA
def asignatura_list(request):
	asignaturas = Asignatura.objects.all()

	context = {
		'asignaturas': asignaturas,
	}

	return render(request, 'apps/contenidos/asignatura_list.html', context)

def asignatura_create(request):
	if request.POST:
		form = AsignaturaForm(request.POST)
		# unidades = request.POST.get('cantidad_unidad') #cantidad de unidades
		# condicion = request.POST.get('cantidad_condicion') #cantidad de unidades
		# biblio = request.POST.get('cantidad_biblio') #cantidad de unidades		
		# unidades = request.POST.get('cantidad_unidad') #info asignatura


		#para agregar la asignatura
		if form.is_valid():
			form = form.save()
			print "paso 1"
		
		# #Unidades
		# for a in range(int(unidades)+1):
		# 	name_unidad = 'unidad_%i' % a
		# 	unidad = request.POST.get(name_unidad)

		# 	name_nombre = 'nombre_%i' % a
		# 	nombre = request.POST.get(name_nombre)

		# 	name_descripcion = 'descripcion_%i' % a
		# 	descripcion = request.POST.get(name_descripcion)

		# 	params = {
		# 		'unidad': unidad,
		# 		'nombre': nombre,
		# 		'descripcion': descripcion,
		# 	}

		# 	form2 = UnidadForm(params)

		# 	if form2.is_valid():
		# 		form2 = form2.save(commit=False)
		# 		form2.asignatura = form
		# 		form2.save()
		# 		print "todo good"

		# #Informacion asignatura
		# form3 = InformacionForm(request.POST)

		# if form3.is_valid():
		# 	form3 = form3.save(commit=False)
		# 	form3.asignatura = form
		# 	form3.save()

		# for b in range(int(condicion)+1):
		# 	name_descripcion_condicion = 'descripcion_condicion_%i' % b
		# 	descripcion_condicion = request.POST.get(name_descripcion_condicion)

		# 	params = {
		# 		'descripcion_condicion': descripcion_condicion,
		# 	}

		# 	form5 = CondicionesAprobacionForm(params)

		# 	if form5.is_valid():
		# 		form5 = form5.save(commit=False)
		# 		form5.asignatura = form
		# 		form5.save()

		# for c in range(int(biblio)+1):
		# 	name_tipo_biblio = 'tipo_biblio_%i' % c
		# 	tipo_biblio = request.POST.get(name_tipo_biblio)

		# 	name_bibliografia = 'bibliografia_%i' % c
		# 	bibliografia = request.POST.get(name_bibliografia)

		# 	params = {
		# 		'tipo_biblio': tipo_biblio,
		# 		'bibliografia': bibliografia,
		# 	}

		# 	form4 = BibliografiaForm(params)
		# 	if form4.is_valid():
		# 		form4 = form4.save(commit=False)
		# 		form4.asignatura = form
		# 		form4.save()
		# 		print "todo good"

		return redirect('contenidos:asignaturaList')
	else:
		form = AsignaturaForm()
		# form2 = UnidadForm()

	context = {
		'form': form,
		# 'form2': form2,
	}
	return render(request, 'apps/contenidos/asignatura_create.html', context)


def asignatura_update(request, asignatura_id):
	asignatura = Asignatura.objects.get(id=asignatura_id)
	if request.method == 'GET':
		form = AsignaturaForm(instance=asignatura)
	else:
		form = AsignaturaForm(request.POST, instance=asignatura)
		if form.is_valid():
			form = form.save(commit=False)
			form.save()
			# form.estudiantes.add(*estudiantes)

		return redirect('contenidos:asignaturaList')


	context = {
		'asignatura': asignatura,
		'form': form,
	}
	return render(request, 'apps/contenidos/asignatura_update.html', context)


#	CURSOS
def curso_list(request):
	cursos = Curso.objects.all()
	
	context = {
		'cursos': cursos,
	}

	return render(request, 'apps/contenidos/cursos_list.html', context)

def curso_create(request):
	if request.POST:
		estudiantes = request.POST.getlist('estudiantes', None)
		form = CursoForm(request.POST)
		if form.is_valid():
			form = form.save(commit=False)
			form.save()
			form.estudiantes.add(*estudiantes)

		return redirect('contenidos:cursoList')
	else:
		form = CursoForm()

	context = {
		'form': form,
	}
	return render(request, 'apps/contenidos/curso_create.html', context)

def curso_update(request, curso_id):
	curso = Curso.objects.get(id=curso_id)
	if request.method == 'GET':
		form = CursoForm(instance=curso)
	else:
		print "-" * 100
		print "SI"
		form = CursoForm(request.POST, instance=curso)
		estudiantes = request.POST.getlist('estudiantes', None)
		if form.is_valid():
			form = form.save(commit=False)
			for e in estudiantes:
				try:
					form.estudiantes.add(e)
				except:
					pass
			form.save()
			# form.estudiantes.add(*estudiantes)

		return redirect('contenidos:cursoList')


	context = {
		'curso': curso,
		'form': form,
	}
	return render(request, 'apps/contenidos/curso_update.html', context)

def curso_detail(request, curso_id):
	curso = Curso.objects.get(id=curso_id)
	return render(request, 'apps/contenidos/curso_detail.html', {'curso':curso})

def curso_delete(request, curso_id):
	curso = Curso.objects.get(id=curso_id)
	if request.POST:
		curso.delete()
		return redirect('contenidos:cursoList')

	return render(request, 'apps/contenidos/curso_delete.html', {'curso':curso})

#	DOCUMENTACIÓN
def programaCurso_pdf(request, asignatura_id, *args, **kwargs):
	asignatura = Asignatura.objects.get(id=asignatura_id)

	context = {
		'asignatura': asignatura,
	}

	resp = HttpResponse(content_type='application/pdf')
	result = generate_pdf('apps/contenidos/pdf/programa_curso.html', context , file_object=resp)
	return result

def syllabus_pdf(request, asignatura_id, *args, **kwargs):
	asignatura = Asignatura.objects.get(id=asignatura_id)

	context = {
		'asignatura': asignatura,
	}

	resp = HttpResponse(content_type='application/pdf')
	result = generate_pdf('apps/contenidos/pdf/syllabus.html', context , file_object=resp)
	return result

	
# def programaCurso(request):
# 	queryset = request.GET.get('asignatura')
# 	asignaturas = Asignatura.objects.all()
# 	if queryset:
# 		qset = (
# 			Q(id=queryset)
# 		)
# 		result = Asignatura.objects.filter(qset)
# 	else:
# 		result = []

# 	title = 'Programa Curso'
# 	context = {
# 		'queryset': queryset,
# 		'asignaturas': asignaturas,
# 		'result': result,
# 		'title': title,
# 	}

# 	return render(request, 'apps/contenidos/programa_curso.html', context)

# # SYLLABUS
# def syllabusCurso(request):
# 	queryset = request.GET.get('asignatura')
# 	asignaturas = Asignatura.objects.all()
# 	if queryset:
# 		qset = (
# 			Q(id=queryset)
# 		)
# 		result = Asignatura.objects.filter(qset)
# 	else:
# 		result = []

# 	title = 'Syllabus de Curso'

# 	context = {
# 		'queryset': queryset,
# 		'asignaturas': asignaturas,
# 		'result': result,
# 		'title': title,
# 	}

# 	return render(request, 'apps/contenidos/syllabus_curso.html', context)







# def asignatura_detail(request, asignatura_id):
# 	asignatura = Asignatura.objects.get(id=asignatura_id)

# 	context = {
# 		'asignatura': asignatura,
# 	}
# 	return render(request, 'apps/contenidos/asignatura_detail.html', context)

# def asignatura_delete(request, asignatura_id):
# 	# asignatura = Asignatura.objects.get(id=asignatura_id)
# 	asignatura = get_object_or_404(Asignatura, id=asignatura_id)
# 	if request.method == 'POST':
# 		asignatura.delete()
# 		return redirect('contenidos:asignaturaList')
# 	return render(request, 'apps/contenidos/asignatura_delete.html', {'asignatura':asignatura})


#	AJAX
class GetCarrera(TemplateView):
	def get(self, request, *args, **kwargs):
		carrera = Carrera.objects.all()
		data = serializers.serialize('json', carrera)
		return HttpResponse(data, content_type="application/json")

class GetAsignatura(TemplateView):
	def get(self, request, *args, **kwargs):
		asignatura = Asignatura.objects.all()
		data = serializers.serialize('json', asignatura)
		return HttpResponse(data, content_type="application/json")

class GetCursoAsignatura(TemplateView):
	def get(self, request, *args, **kwargs):
		asignatura = request.GET['asignatura']
		cursos = Curso.objects.filter(asignatura=asignatura)
		data = serializers.serialize('json', cursos)
		return HttpResponse(data, content_type="application/json")


class GetCursoAsignaturaProfe(TemplateView):
	def get(self, request, *args, **kwargs):
		asignatura = request.GET['asignatura']
		cursos = Curso.objects.filter(asignatura=asignatura)

		# Get profes
		profes = []
		for curso in cursos:
			profe = curso.docente.pk
			profes += [PerfilUsuario.objects.get(id=profe)]


		datos = serializers.serialize('json', cursos)
		datos2 = serializers.serialize('json', profes)

		data = {
			'datos': datos,
			'datos2': datos2,
		}

		print data
		return HttpResponse(data, content_type="application/json")

class GetUsuario(TemplateView):
	def get(self, request, *args, **kwargs):
		coordinador = PerfilUsuario.objects.all()
		data = serializers.serialize('json', coordinador)
		return HttpResponse(data, content_type="application/json")


	# ----------- CONTENIDO POR ASIGNATURA ------------------
class GetContenidoAsignatura(TemplateView):
	def get(self, request, *args, **kwargs):
		asignatura = request.GET['asignatura']
		contenido = Unidad.objects.filter(asignatura__id=asignatura)
		data = serializers.serialize('json', contenido)
		return HttpResponse(data, content_type="application/json")

from rest_framework.renderers import JSONRenderer
class GetAlumnosNRC(TemplateView):
	def get(self, request, *args, **kwargs):
		nrc = request.GET['nrc']
		# nrc = 7220

		url = "http://cubesoa.asuscomm.com:90/get/ListCourse/"

		payload = "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"nrc\"\r\n\r\n%s\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--" % (nrc)
		headers = {
		    'content-type': "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
		    'authorization': "Token b74c12bac948c49b06e15229abfcd11498ed3dbb",
		    'cache-control': "no-cache",
		    'postman-token': "de770d1a-ff87-90c4-ca96-98359e612a2c"
		    }

		response = requests.request("POST", url, data=payload, headers=headers)
		content = response.content 
		content = ast.literal_eval(content)
		

		# url = "http://cubesoa.asuscomm.com:90/get/get_user_info/"

		# payload = "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"user_pk\"\r\n\r\n%s\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--" %(nrc)
		# headers = {
		#     'content-type': "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
		#     'authorization': "Token b74c12bac948c49b06e15229abfcd11498ed3dbb",
		#     'cache-control': "no-cache",
		#     'postman-token': "6e195fff-83a0-c576-811e-269cdbf238df"
		#     }

		# response = requests.request("POST", url, data=payload, headers=headers)



		data = JSONRenderer().render(response)
		print "-" * 100
		# print data
		return HttpResponse(data, content_type="application/json")

def prueba_api(request):
	return render(request, 'apps/contenidos/API/prueba.html', {})