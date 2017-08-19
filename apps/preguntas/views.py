#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Código desarrollado por Daniel Mansilla
from django.shortcuts import render, redirect, render_to_response
from django.views.generic import TemplateView, ListView, CreateView, UpdateView, DeleteView, View, DetailView
from django.core.urlresolvers import reverse, reverse_lazy

from django.http import HttpResponse, HttpResponseRedirect
from django.core import serializers
from django.contrib.auth.models import User
# from apps.usuarios.models import PerfilUsuario


from .models import *
from .forms import *

def pregunta_create(request):
	opcion_range = map(chr, range(97, 102))
	pivot = 0
	if request.POST:
		form = PreguntaForm(request.POST)
		cantidad_respuestas = request.POST.get('cantidad_respuestas')
		tipo_pregunta = request.POST.get('tipo_pregunta')

		contenido = request.POST.getlist('contenido', None)

		if form.is_valid():
			form = form.save(commit=False)
			form.usuario = request.user
			form.save()
			form.contenido.add(*contenido)

			for i in range(int(cantidad_respuestas)+1):
				name_respuesta = 'respuesta_%s' % i
				respuesta = request.POST.get(name_respuesta)
				name_imagen_respuesta = 'imagen_respuesta_%s' % i
				imagen_respuesta = request.FILES.get(name_imagen_respuesta)
				name_status_respuesta = 'status_respuesta_%s' % i
				status_respuesta = request.POST.get(name_status_respuesta)
				name_opcion = 'opcion_%s' % i
				opcion = request.POST.get(name_opcion)
				####

				parms = {
					'respuesta' : respuesta,
					'imagen_respuesta' : imagen_respuesta,
					'status_respuesta' : status_respuesta,
					'opcion': opcion,
				}

				form2 = RespuestaForm(parms, request.FILES or None)
				if form2.is_valid():
					form2 = form2.save(commit=False)

					if tipo_pregunta == 'Pregunta de desarrollo':
						form2.status_respuesta = True

					elif tipo_pregunta == 'Seleccion multiple':
						form2.opcion = opcion_range[pivot]
						pivot +=1

					elif tipo_pregunta == 'Terminos pareados':
						if i % 2 == 0:
							form2.status_respuesta = True #Respuestas de la FILA B
						else:
							form2.opcion = opcion_range[pivot]
							pivot +=1 

					form2.pregunta = form
					form2.save()


			return redirect('preguntas:list_preguntas')

	else:
		form = PreguntaForm()
		form2 = RespuestaForm()

	context = {
		'form': form,
	}

	return render(request, 'apps/preguntas/pregunta_form.html', context)

def list_preguntas(request):
    user = User.objects.get(id=request.user.id)
    usuario = user.perfilusuario.tipo_usuario

    if usuario == 'Docente':
        preguntas = Pregunta.objects.filter(usuario=user)
    else:
        preguntas = Pregunta.objects.all()

    context = {
        'preguntas': preguntas,
        'usuario': usuario,
    }
    return render(request, 'apps/preguntas/pregunta_list.html', context)


def pregunta_evalue(request, pregunta_id):
    preguntas = Pregunta.objects.get(id=pregunta_id)

    if request.method == 'GET':
        form = PreguntaForm(instance=preguntas)
    else:
        form = PreguntaForm(request.POST, instance=preguntas)
        if form.is_valid():
            form.corregida = False
            form.save()

            return redirect('preguntas:list_preguntas')

    context = {
        'form': form,
        'preguntas': preguntas,
    }

    return render(request, 'apps/preguntas/pregunta_evalue.html', context)

def pregunta_detail(request, pregunta_id):
    preguntas = Pregunta.objects.get(id=pregunta_id)

    context = {
        'preguntas': preguntas,
    }

    return render(request, 'apps/preguntas/pregunta_detail.html', context)


def pregunta_edit(request, pregunta_id):
    pregunta = Pregunta.objects.get(id=pregunta_id)
    usuario = pregunta.usuario

    if pregunta.tipo_pregunta == 'Pregunta de desarrollo':
    	respuestas = Respuesta.objects.get(pregunta=pregunta)
    else:
    	respuestas = Respuesta.objects.filter(pregunta=pregunta)

    if request.method == 'GET':
        form = PreguntaForm(instance=pregunta)
        # form2 = RespuestaForm(instance=respuestas)
    else:
        form = PreguntaForm(request.POST, request.FILES, instance=pregunta)
        if form.is_valid():
            form = form.save(commit=False)
            form.usuario = usuario
            form.observacion = ''
            form.corregida = True
            form.save()

            if form.tipo_pregunta == 'Pregunta de desarrollo':
            	respuesta = request.POST.get('respuesta_0')
            	imagen_respuesta = request.POST.files('imagen_respuesta_0')
            	respuestas.respuesta = respuesta
            	respuestas.imagen_respuesta = imagen_respuesta
            	respuestas.save()
            else:
            	# respuestas = Respuesta.objects.filter(pregunta=pregunta)
            	print 'caca'


        return redirect('preguntas:list_preguntas')

    context = {
        'form': form,
        # 'form2': form2,
        'pregunta': pregunta,
        'respuestas': respuestas,
    }

    return render(request, 'apps/preguntas/pregunta_editar.html', context)


# AJAX
class GetUnidad(TemplateView):
	def get(self, request, *args, **kwargs):
		asignatura = request.GET['asignatura']
		unidad = Unidad.objects.filter(asignatura=asignatura)
		data = serializers.serialize('json', unidad)
		return HttpResponse(data, content_type="application/json")

class GetContenido(TemplateView):
	def get(self, request, *args, **kwargs):
		unidad = request.GET['unidad']
		contenido = Contenido.objects.filter(unidad=unidad)
		data = serializers.serialize('json', contenido)
		return HttpResponse(data, content_type="application/json")