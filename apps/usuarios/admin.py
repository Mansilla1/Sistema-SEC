from django.contrib import admin
from .models import *

from import_export import resources
from import_export.admin import ImportExportModelAdmin


class UsuarioResource(resources.ModelResource):
	class Meta:
		model = PerfilUsuario

class EstudianteResource(resources.ModelResource):
	class Meta:
		model = Estudiante

class PerfilUsuarioAdmin(ImportExportModelAdmin, admin.ModelAdmin):
	list_display = ('rut', 'user', 'tipo_usuario', 'created_at', 'updated_at', 'status')
	list_filter = ('tipo_usuario',)
	resource_class = UsuarioResource

class EstudianteAdmin(ImportExportModelAdmin, admin.ModelAdmin):
	list_display = ('rut', 'nombre1', 'apellido1', 'apellido2', 'email')
	# list_editable = ('nombre1', 'apellido1', 'apellido2', 'email')
	resource_class = EstudianteResource

admin.site.register(PerfilUsuario, PerfilUsuarioAdmin)
admin.site.register(Estudiante, EstudianteAdmin)
