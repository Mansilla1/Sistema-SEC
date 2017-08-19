from django.conf.urls import url
from django.contrib.auth.decorators import login_required
from .views import *

urlpatterns = [
	#	Asignaturas
	url(r'^asignaturas/', login_required(asignatura_list), name='asignaturaList'),
	url(r'^nueva-asignatura/', login_required(asignatura_create), name='asignaturaCreate'),
	url(r'^actualizar-asignatura/(?P<asignatura_id>\d+)/$', login_required(asignatura_update), name='asignaturaUpdate'),

	#	contenidos
	url(r'^contenidos/asignatura/(?P<asignatura_id>\d+)/$', login_required(contenidos_form), name='contenidos_form'),
	url(r'^contenidos/actualizar-unidad/(?P<unidad_id>\d+)/$', login_required(unidad_edit), name='unidad_edit'),
	url(r'^contenidos/eliminar-unidad/(?P<unidad_id>\d+)/$', login_required(unidad_delete), name='unidad_delete'),
	# url(r'^elimina-asignatura/(?P<asignatura_id>\d+)/$', login_required(asignatura_delete), name='asignaturaDelete'),
	# url(r'^detalle-asignatura/(?P<asignatura_id>\d+)/$', login_required(asignatura_detail), name='asignaturaDetail'),
	

	#	Cursos
	url(r'^cursos/', login_required(curso_list), name='cursoList'),
	url(r'^nuevo-cursos/', login_required(curso_create), name='cursoCreate'),
	url(r'^detalle-curso/(?P<curso_id>\d+)/$', login_required(curso_detail), name='cursoDetail'),
	url(r'^eliminar-curso/(?P<curso_id>\d+)/$', login_required(curso_delete), name='cursoDelete'),
	url(r'^actualizar-curso/(?P<curso_id>\d+)/$', login_required(curso_update), name='cursoUpdate'),

		#	Curso-API
	# url(r'^detalle-cursoAPI/(?P<curso_id>\d+)/$', login_required(students), name='students'),

	#	Carreras
	url(r'^carreras/', login_required(carrera_list), name='carreraList'),
	url(r'^nueva-carrera/', login_required(carrera_create), name='carreraCreate'),
	url(r'^actualizar-carrera/(?P<carrera_id>\d+)/$', login_required(carrera_update), name='carreraUpdate'),
	url(r'^eliminar-carrera/(?P<carrera_id>\d+)/$', login_required(carrera_delete), name='carreraDelete'),




	#	AJAX
	url(r'^carreraAJAX/', login_required(GetCarrera.as_view()), name='get_carrera'),
	url(r'^asignaturaAJAX/', login_required(GetAsignatura.as_view()), name='get_asignatura'),
	url(r'^usuarioAJAX/', login_required(GetUsuario.as_view()), name='get_usuario'),
	url(r'^cursoAsignaturaAJAX/', login_required(GetCursoAsignatura.as_view()), name='get_curso_asignatura'),
	url(r'^cursoAsignaturaProfeAJAX/', login_required(GetCursoAsignaturaProfe.as_view()), name='get_curso_asignatura_profe'),
	url(r'^contenidoAsignaturaAJAX/', login_required(GetContenidoAsignatura.as_view()), name='get_contenido_asignatura'),


	#	PDF
	url(r'^syllabus-pdf/(?P<asignatura_id>\d+)/$', login_required(syllabus_pdf), name='syllabus_pdf'),
	url(r'^programaCurso-pdf/(?P<asignatura_id>\d+)/$', login_required(programaCurso_pdf), name='programaCurso_pdf'),


	#	API
	url(r'^API1/$', login_required(prueba_api), name='prueba_api'),
	url(r'^API-estudiantes-nrc/$', login_required(GetAlumnosNRC.as_view()), name='GetAlumnosNRC'),

]