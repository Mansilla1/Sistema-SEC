from django.conf.urls import url
from django.contrib.auth.decorators import login_required
from .views import *

urlpatterns = [
	#	DASHBOARD
	url(r'^dashboard/$', login_required(Dashboard.as_view()), name='Dashboard'),

	#	DATA(AJAX)
	url(r'^api/data/$', login_required(get_data), name='api-data'),
	url(r'^api/rechazo/$', login_required(tasa_rechazo), name='tasa-rechazo'),
	url(r'^api-evaluaciones/$', login_required(get_data_evaluacion), name='api-data-evaluacion'),
	url(r'^api-objetivos/evaluaciones/$', login_required(get_obj_evaluacion), name='get_obj_evaluacion'),
	url(r'^api-meses/$', login_required(get_evaluacion_preguntas), name='api-data-evaluacion-pregunta'),
	url(r'^api-meses-preguntas/$', login_required(estado_preguntas_mes), name='estado-preguntas-mes'),
	url(r'^api-meses-preguntasElegir/$', login_required(estado_preguntas_mesElegir), name='estado-preguntas-mesElegir'),

	#	Configuracion
	url(r'^configuracion-preguntas/$', login_required(config_preguntas), name='config-preguntas'),
	url(r'^configuracion-perfil1/$', login_required(config_perfil1), name='config-perfil1'),
	url(r'^configuracion-perfil2/$', login_required(config_perfil2), name='config-perfil2'),


]