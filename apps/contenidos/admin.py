from django.contrib import admin
from .models import *

from import_export import resources
from import_export.admin import ImportExportModelAdmin


class AsignaturaResource(resources.ModelResource):
	class Meta:
		model = Asignatura

class CursoResource(resources.ModelResource):
	class Meta:
		model = Curso

class UnidadResource(resources.ModelResource):
	class Meta:
		model = Unidad

class ContenidoResource(resources.ModelResource):
	class Meta:
		model = Contenido


class AsignaturaAdmin(ImportExportModelAdmin, admin.ModelAdmin):
	list_display = ('codigo', 'nombre', 'tipo_programa','creado_en', 'ultima_modificacion', 'disponible')
	list_filter = ('disponible', 'tipo_programa',)
	search_fields = ('codigo', 'nombre',)
	resource_class = AsignaturaResource

class CursoAdmin(ImportExportModelAdmin, admin.ModelAdmin):
	list_display = ('id', 'nrc', 'asignatura', 'status')
	list_filter = ('regimen', 'asignatura__nombre', 'status')
	search_fields = ('regimen', 'asignatura__nombre')
	resource_class = CursoResource


class UnidadAdmin(ImportExportModelAdmin, admin.ModelAdmin):
	list_display = ('nombre', 'asignatura', 'unidad')
	search_fields = ('nombre', 'unidad')
	resource_class = UnidadResource

class ContenidoAdmin(ImportExportModelAdmin, admin.ModelAdmin):
	list_display = ('contenido', 'unidad')
	search_fields = ('contenido', 'unidad')
	resource_class = ContenidoResource


class SedeAdmin(admin.ModelAdmin):
	list_display = ('id', 'sede', 'lugar')

class FacultadAdmin(admin.ModelAdmin):
	list_display = ('id', 'facultad')

class CarreraAdmin(admin.ModelAdmin):
	list_display = ('codigo_carrera', 'carrera', 'sede', 'facultad')
	list_filter = ('sede', 'facultad')
	search_fields = ('sede', 'facultad', 'carrera')

# class InformacionAdmin(admin.ModelAdmin):
# 	list_display = ('asignatura',)
# 	list_filter = ('asignatura__nombre',)
# 	#list_editable = ( 'tipo_programa',)
# 	search_fields = ('asignatura__nombre',)

class ObjetivoEducacionalAdmin(admin.ModelAdmin):
	list_display = ('asignatura',)
	list_filter = ('asignatura__nombre',)
	search_fields = ('asignatura__nombre', )

class CompetenciaEgresoAdmin(admin.ModelAdmin):
	list_display = ('asignatura',)
	list_filter = ('asignatura__nombre',)
	search_fields = ('asignatura__nombre', )

class ResultadoAprendizajeAdmin(admin.ModelAdmin):
	list_display = ('asignatura',)
	list_filter = ('asignatura__nombre',)
	search_fields = ('asignatura__nombre', )

class DescripcionGeneralAdmin(admin.ModelAdmin):
	list_display = ('asignatura',)
	list_filter = ('asignatura__nombre',)
	search_fields = ('asignatura__nombre', )

class HabilidadTransversalAdmin(admin.ModelAdmin):
	list_display = ('asignatura',)
	list_filter = ('asignatura__nombre',)
	search_fields = ('asignatura__nombre', )

class ModalidadDidacticaAdmin(admin.ModelAdmin):
	list_display = ('asignatura',)
	list_filter = ('asignatura__nombre',)
	search_fields = ('asignatura__nombre', )

class CondicionesAprobacionAdmin(admin.ModelAdmin):
	list_display = ('asignatura',)
	list_filter = ('asignatura__nombre',)
	search_fields = ('asignatura__nombre', )

class BibliografiaAdmin(admin.ModelAdmin):
	list_display = ('asignatura', 'tipo_biblio')
	list_filter = ('asignatura__nombre',)
	#list_editable = ( 'tipo_programa',)
	search_fields = ('asignatura__nombre', )


admin.site.register(Sede, SedeAdmin)
admin.site.register(Facultad, FacultadAdmin)
admin.site.register(Carrera, CarreraAdmin)
admin.site.register(Asignatura, AsignaturaAdmin)
admin.site.register(Curso, CursoAdmin)
admin.site.register(Unidad, UnidadAdmin)
admin.site.register(Contenido, ContenidoAdmin)

admin.site.register(ObjetivoEducacional, ObjetivoEducacionalAdmin)
admin.site.register(CompetenciaEgreso, CompetenciaEgresoAdmin)
admin.site.register(ResultadoAprendizaje, ResultadoAprendizajeAdmin)
admin.site.register(DescripcionGeneral, DescripcionGeneralAdmin)
admin.site.register(HabilidadTransversal, HabilidadTransversalAdmin)
admin.site.register(ModalidadDidactica, ModalidadDidacticaAdmin)
admin.site.register(CondicionesAprobacion, CondicionesAprobacionAdmin)
admin.site.register(Bibliografia, BibliografiaAdmin)
