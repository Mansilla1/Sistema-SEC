from django.contrib import admin

from .models import *

class PreguntaAdmin(admin.ModelAdmin):
	list_display = ('id', 'asignatura', 'usuario', 'dificultad', 'tipo_pregunta', 'status', 'cant_usada')
	list_editable = ('status',)
	list_filter = ('status','asignatura__nombre','asignatura__tipo_programa', 'tipo_pregunta', 'rechazada')
	search_fields = ('asignatura__nombre', 'tipo_pregunta')

class RespuestaAdmin(admin.ModelAdmin):
	list_display = ('id', 'pregunta','created_at', 'updated_at', 'status_respuesta')
	list_filter = ('pregunta__status', 'pregunta__tipo_pregunta')
	search_fields = ('pregunta__pregunta',)


admin.site.register(Pregunta, PreguntaAdmin)
admin.site.register(Respuesta, RespuestaAdmin)
