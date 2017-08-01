from django.conf.urls import url, include
from django.contrib.auth.decorators import login_required

from .views import *

urlpatterns = [
	url(r'^listado/', login_required(usuarioList), name='listar'),
	url(r'^registro/', login_required(usuarioCreate), name='registrar'),
	# url(r'^detalle/(?P<pk>\d+)/$', login_required(UsuarioDetail.as_view()), name='usuarioDetalle'),
	url(r'^eliminar/(?P<usuario_id>\d+)/$', login_required(usuarioDelete), name='eliminar'),
	url(r'^actualizar/(?P<usuario_id>\d+)/$', login_required(usuarioUpdate), name='actualizar'),
	#	upload
	url(r'^masive/', login_required(upload), name='upload'),
	url(r'^usuarioUpload/planilla/$', login_required(get_planilla_usuario), name='get_planilla_usuario'),


	#	ESTUDIANTES
	url(r'^listado-estudiantes/$', login_required(estudiante_list), name='listar_estudiantes'),
	url(r'^nuevo-estudiante/$', login_required(estudiante_create), name='nuevo_estudiante'),

	url(r'^estudiante-masive/', login_required(upload_estudiante), name='upload_estudiante'),
	url(r'^estudianteUpload/planilla/$', login_required(get_planilla_estudiante), name='get_planilla_estudiante'),

	#	AJAX
	url(r'^estudiantesAJAX/$', login_required(GetEstudiantes.as_view()), name='get_estudiantes'),
]