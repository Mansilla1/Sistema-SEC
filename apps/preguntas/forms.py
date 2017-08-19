#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Código desarrollado por Daniel Mansilla
from django import forms
from .models import *

class PreguntaForm(forms.ModelForm):
	class Meta:
		model = Pregunta 
		fields = [
			'asignatura',
			'unidad',
			'contenido',
			'dificultad',
			'tipo_pregunta',
			'pregunta',
			'imagen_pregunta',
			'status',
			'observacion',
			'rechazada',
			'usuario',

			# 'cant_usada',
		]
		widgets = {
			'asignatura': forms.Select(attrs={'class': 'form-control'}),
			# 'contenido': forms.Select(attrs={'class': 'form-control'}),
			'dificultad': forms.Select(attrs={'class': 'form-control'}),
			'tipo_pregunta': forms.Select(attrs={'class': 'form-control'}),
			'pregunta': forms.Textarea(attrs={'class': 'form-control'}),
			'imagen_pregunta': forms.FileInput(attrs={'class': 'form-control'}),
			# 'status': forms.CheckBox(attrs='class', 'form-control'),
			# 'observacion': forms.TextInput(attrs='class', 'form-control'),
			# 'rechazada': forms.TextInput(attrs='class', 'form-control'),
		}

class RespuestaForm(forms.ModelForm):
	class Meta:
		model = Respuesta
		fields = [
			'opcion',
			'respuesta',
			'imagen_respuesta',
			'status_respuesta',
		]