from django import forms

# from .models import Asignatura, Unidad
from .models import *

class EvaluacionForm(forms.ModelForm):
	class Meta:
		model = Evaluacion
		fields = [
			'curso',
			'contenidos',
			'preguntas',
			'fecha_evaluacion',
			'puntaje_total',
			'titulo',
			'datos',
			'instrucciones',
			'disponible',
			'tipo_evaluacion',
			'tipo_evaluacion_otro',
			'disponible',
		]
		widgets = {
			'contenidos' : forms.CheckboxSelectMultiple(),
		}

class CalificacionForm(forms.ModelForm):
	class Meta:
		model = Calificacion
		fields = [
			'evaluacion',
			'puntaje_obtenido',
			'calificacion',
		]

class PromedioForm(forms.ModelForm):
	class Meta:
		model = Promedio
		fields = [
			'curso',
			'calificaciones',
			'promedio'
		]

class PuntajePreguntaForm(forms.ModelForm):
	class Meta:
		model = PuntajePregunta
		fields = [
			'evaluacion',
			'pregunta',
			'puntaje',
		]

class EstudianteCalificacionForm(forms.ModelForm):
	class Meta:
		model = EstudianteCalificacion
		fields = [
			'evaluacion',
			'calificacion',
			'estudiante',
		]
