from django.conf.urls import url
from django.contrib.auth.decorators import login_required
from .views import *

urlpatterns = [
	#	DASHBOARD
	url(r'^$', login_required(Dashboard.as_view()), name='Dashboard'),

	#	DATA(AJAX)
	url(r'^api/data/$', login_required(get_data), name='api-data'),
	url(r'^api/rechazo/$', login_required(tasa_rechazo), name='tasa-rechazo'),
	url(r'^api-evaluaciones/$', login_required(get_data_evaluacion), name='api-data-evaluacion'),
	url(r'^api-meses/$', login_required(get_evaluacion_preguntas), name='api-data-evaluacion-pregunta'),

]