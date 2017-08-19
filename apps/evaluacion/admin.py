from django.contrib import admin
from .models import *

class EvaluacionAdmin(admin.ModelAdmin):
	list_display = ('id', 'curso', 'fecha_evaluacion', 'docente', 'creado_en', 'ultima_modificacion', 'disponible', 'cronometro_inicio')
	list_editable = ('disponible',)
	list_filter = ('disponible','curso__asignatura__nombre')
	search_fields = ('curso__asignatura__nombre', 'docente__username')

class CalificacionAdmin(admin.ModelAdmin):
	list_display = ('id', 'created_at', 'updated_at','status')
	list_editable = ('status',)
	list_filter = ('status',)
	# search_fields = ('asignatura__nombre', 'docente__username')

class PromedioAdmin(admin.ModelAdmin):
	list_display = ('id', 'curso')
	list_filter = ('curso__asignatura__nombre',)

class PuntajePreguntaAdmin(admin.ModelAdmin):
	list_display = ('id', 'evaluacion','puntaje')
	list_filter = ('evaluacion__curso__asignatura__nombre',)


class EstudianteCalificacionAdmin(admin.ModelAdmin):
	list_display = ('id','estudiante')


admin.site.register(Evaluacion, EvaluacionAdmin)
admin.site.register(Calificacion, CalificacionAdmin)
admin.site.register(Promedio, PromedioAdmin)
admin.site.register(PuntajePregunta, PuntajePreguntaAdmin)
admin.site.register(EstudianteCalificacion, EstudianteCalificacionAdmin)
