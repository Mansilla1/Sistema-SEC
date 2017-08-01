#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Código desarrollado por Daniel Mansilla
from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm

from django.utils import timezone
import datetime

from .models import *

class RegistroForm(UserCreationForm):
	class Meta:
		model = User
		fields = [
			'username',
			# 'first_name',
			# 'last_name',
			# 'email',
			'password1',
			'password2',
		]
		widgets = {
			'username': forms.TextInput(attrs={'class': 'form-control'}),
			# 'first_name': forms.TextInput(attrs={'class': 'form-control'}),
			# 'last_name': forms.TextInput(attrs={'class': 'form-control'}),
			# 'email': forms.TextInput(attrs={'class': 'form-control'}),
			'password1': forms.PasswordInput(attrs={'class': 'form-control'}),
			'password2': forms.PasswordInput(attrs={'class': 'form-control'}),
		}

class PerfilForm(forms.ModelForm):

	class Meta:
		model = PerfilUsuario
		fields = [
			'rut',
			'nombres',
			'apellido1',
			'apellido2',
			'email',
			'numero_telefono',
			'tipo_usuario',
		]

		widgets = {
			'rut': forms.TextInput(attrs={'class': 'form-control'}),
			'nombres': forms.TextInput(attrs={'class': 'form-control'}),
			'apellido1': forms.TextInput(attrs={'class': 'form-control'}),
			'apellido2': forms.TextInput(attrs={'class': 'form-control'}),
			'email': forms.TextInput(attrs={'class': 'form-control'}),
			'numero_telefono': forms.TextInput(attrs={'class': 'form-control'}),
			'tipo_usuario': forms.Select(attrs={'class': 'form-control'}),
		}
	

class EstudianteForm(forms.ModelForm):
	class Meta:
		model = Estudiante 
		fields = [
			'rut',
			'nombre1',
			'nombre2',
			'nombre3',
			'apellido1',
			'apellido2',
			'email',


		]