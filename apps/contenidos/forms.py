from django import forms

from .models import *


class AsignaturaForm(forms.ModelForm):
	class Meta:
		model = Asignatura
		fields = [
			'carrera',
			'codigo',
			'nombre',
			'coordinador',
			'duracion',
			'creditos',
			'nivel',
			'horas_teoricas',
			'horas_laboratorio',
			'pre_requisitos',
			'nombre_requisito',
			'co_requisitos',
			'tipo_programa',
			'eje_curricular',
		]

class CursoForm(forms.ModelForm):
	class Meta:
		model = Curso
		fields = [
			'nrc',
			'asignatura',
			'docente',
			'estudiantes',
			'regimen',
		]
		widgets = {
			'nrc': forms.TextInput(attrs={'class': 'form-control'}),
			# 'regimen': forms.Select(attrs={'class': 'form-control'}),
		}

class UnidadForm(forms.ModelForm):
	class Meta:
		model = Unidad
		fields = [
			'nombre',
			# 'asignatura',
			'unidad',
		]


class ContenidoForm(forms.ModelForm):
	class Meta:
		model = Contenido
		fields = [
			'contenido',
			# 'unidad',
			'aprendizaje_esperado',
		]


class InformacionForm(forms.ModelForm):
	class Meta:
		model = Informacion
		fields = [
			# 'asignatura',
			'objetivos_educacionales',
			'competencias_egreso',
			'aprendizaje',
			'descripcion',
			'habilidades',
			'modalidad',
		]


class CondicionesAprobacionForm(forms.ModelForm):
	class Meta:
		model = CondicionesAprobacion 
		fields = [
			'descripcion_condicion',
		]

class BibliografiaForm(forms.ModelForm):
	class Meta:
		model = Bibliografia
		fields = [
			'tipo_biblio',
			'bibliografia',
		]
