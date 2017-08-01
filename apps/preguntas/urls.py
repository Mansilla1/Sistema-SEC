from django.conf.urls import url
from django.contrib.auth.decorators import login_required

from .views import *

urlpatterns = [
	#	Preguntas
	url(r'^preguntas/', login_required(list_preguntas), name='list_preguntas'),
	url(r'^pregunta-add/', login_required(pregunta_create), name='preguntaCreate'),
	url(r'^pregunta-evaluar/(?P<pregunta_id>\d+)/$', login_required(pregunta_evalue), name='preguntaEvalue'),
	url(r'^pregunta-detalle/(?P<pregunta_id>\d+)/$', login_required(pregunta_detail), name='PreguntaDetail'),

	#AJAX
	url(r'^get_unidades/$', login_required(GetUnidad.as_view()), name='get_unidad'),
	url(r'^get_contenidos/$', login_required(GetContenido.as_view()), name='get_contenido'),
]