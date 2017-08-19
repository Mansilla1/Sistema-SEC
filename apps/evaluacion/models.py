from __future__ import unicode_literals, absolute_import
from django.contrib.auth.models import User
from django.db import models

from apps.contenidos.models import Asignatura, Unidad, Contenido, Curso
from apps.preguntas.models import Pregunta, Respuesta
from apps.usuarios.models import PerfilUsuario, Estudiante

class Evaluacion(models.Model):
	# asignatura = models.ForeignKey(Asignatura, on_delete=models.CASCADE)
	curso = models.ForeignKey(Curso, on_delete=models.CASCADE)
	contenidos = models.ManyToManyField(Unidad, blank=True)
	preguntas = models.ManyToManyField(Pregunta, blank=True)
	fecha_evaluacion = models.DateField(blank=True, null=True)
	puntaje_total = models.IntegerField(blank=True, null=True)
	exigencia = models.IntegerField(blank=True, null=True)
	docente = models.ForeignKey(User)
	tipo = (
		('Solemne', 'Solemne'),		
		('Control', 'Control'),		
		('Examen', 'Examen'),		
		('Otro', 'Otro'),		
	)
	tipo_evaluacion = models.CharField(max_length=200, choices=tipo, blank=True, null=True)
	tipo_evaluacion_otro = models.CharField(max_length=255, blank=True, null=True)
	titulo = models.CharField(max_length=255, blank=True, null=True)
	datos = models.TextField(blank=True, null=True)
	instrucciones = models.TextField(blank=True, null=True)
	creado_en = models.DateTimeField(auto_now_add=True)
	ultima_modificacion = models.DateTimeField(auto_now=True)
	disponible = models.BooleanField(default=False)
	descartada = models.BooleanField(default=False)
	cronometro_inicio = models.DateTimeField(blank=True, null=True, editable=False)


class Calificacion(models.Model):
	evaluacion = models.ForeignKey(Evaluacion, on_delete=models.CASCADE)
	count = models.IntegerField(default=0)
	puntaje_obtenido = models.FloatField(blank=True, null=True)
	calificacion = models.FloatField(blank=True, null=True)
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)
	status = models.BooleanField(default=False)

	def save(self):
		self.count+=1
		super(Calificacion, self).save()

class PuntajePregunta(models.Model):
	evaluacion = models.ForeignKey(Evaluacion, on_delete=models.CASCADE, blank=True, null=True)
	pregunta = models.ForeignKey(Pregunta, on_delete=models.CASCADE, blank=True, null=True)
	puntaje = models.FloatField(blank=True, null=True)

class Promedio(models.Model):
	evaluacion = models.ForeignKey(Evaluacion, on_delete=models.CASCADE, blank=True, null=True)
	# seccion = models.ForeignKey(Seccion, on_delete=models.CASCADE, blank=True, null=True)
	curso = models.ForeignKey(Curso, on_delete=models.CASCADE, blank=True, null=True)
	calificaciones = models.ManyToManyField(Calificacion)
	promedio = models.FloatField()
	pje_promedio = models.FloatField(blank=True, null=True)

class EstudianteCalificacion(models.Model):
	evaluacion = models.ForeignKey(Evaluacion, on_delete=models.CASCADE)
	calificacion = models.ForeignKey(Calificacion, on_delete=models.CASCADE)
	estudiante = models.ForeignKey(Estudiante, on_delete=models.CASCADE)
	# puntaje = models.ManyToManyField(PuntajePregunta, blank=True)

