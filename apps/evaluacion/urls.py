from django.conf.urls import url, include
from django.contrib.auth.decorators import login_required
from .views import *

urlpatterns = [
	#	Listado
	url(r'^evaluacion-lista/', login_required(evaluacion_list), name='listar_evaluacion'),
	
	#	Evaluacion paso a paso
	url(r'^generar/step1/$', login_required(evaluacion_step1), name='evaluacion_step1'),
	url(r'^generar/step1/(?P<evaluacion_id>\d+)/$', login_required(evaluacion_step1_back), name='evaluacion_step1_back'),
	url(r'^generar/step2/(?P<evaluacion_id>\d+)/$', login_required(evaluacion_step2), name='evaluacion_step2'),
	url(r'^generar/step3/(?P<evaluacion_id>\d+)/$', login_required(evaluacion_step3), name='evaluacion_step3'),
	url(r'^generar/step4/(?P<evaluacion_id>\d+)/$', login_required(evaluacion_step4), name='evaluacion_step4'),

	#	Evaluacion automatica
	url(r'^automatica/step1/$', login_required(evaluacion_rapida_step1), name='evaluacion_rapida_step1'),
	url(r'^automatica/step2/(?P<evaluacion_id>\d+)/$', login_required(evaluacion_rapida_step2), name='evaluacion_rapida_step2'),

	#	Detalle evaluacion
	url(r'^detalle/(?P<evaluacion_id>\d+)/$', login_required(evaluacion_detail), name='evaluacion_detail'),
	url(r'^descartar/(?P<evaluacion_id>\d+)/$', login_required(descartar_evaluacion), name='evaluacion_descartar'),

	#	Calificacion alumnos
	url(r'^estudiantes-notas/(?P<evaluacion_id>\d+)/$', login_required(estudiante_calificacion), name='estudiante_calificacion'),

	#excel
	url(r'^calificacion/(?P<evaluacion_id>\d+)/$', login_required(calificaciones), name='calificacion'),
	url(r'^agregar/calificaciones/(?P<evaluacion_id>\d+)/$', login_required(get_calificaciones), name='calificacionExcel'),

	#PDF
	url(r'^evaluacion-pdf/(?P<evaluacion_id>\d+)/$', login_required(evaluacion_pdf), name='evaluacionPDF'),
	url(r'^solucion-pdf/(?P<evaluacion_id>\d+)/$', login_required(solucion_pdf), name='solucionPDF'),

	#	AJAX
	url(r'^ContenidoFiltroAjax/$', login_required(ContenidoFiltroAjax.as_view()), name='ContenidoFiltroAjax'),
	url(r'^PreguntaObjAjax/$', login_required(PreguntaObjAjax.as_view()), name='PreguntaObjAjax'),
	url(r'^filtro/palabras/$', login_required(busqueda), name='busqueda_palabra'),
	url(r'^PreguntaBusquedaAjax/$', login_required(PreguntaBusquedaAjax.as_view()), name='PreguntaBusquedaAjax'),
]