from django.conf.urls import url, include
from django.contrib import admin
from django.contrib.auth.views import (
        login, logout_then_login, password_reset, password_reset_done, password_reset_confirm,
        password_reset_complete
    )
from django.contrib.auth.decorators import login_required
from django.conf import settings
from django.conf.urls.static import static
from django.views.static import serve


from apps.dashboard import views as vista #incluye la pagina de inicio al sistema

urlpatterns = [
	# Admin site, hecho por django (no se toca)
    url(r'^admin/', admin.site.urls),
    #login de usuario
    url(r'^$', login, {'template_name':'login/login.html'}),
    url(r'^accounts/login', login, {'template_name':'login/login.html'}, name='login'),
    url(r'^logout/', logout_then_login, name='logout'),
    # #recuperacion contrasena
    url(r'^reset-password/$', password_reset, {'template_name':'login/registation/password_reset_form.html',
        'email_template_name': 'login/registation/password_reset_email.html'}, 
        name='password_reset'),
    url(r'^password-reset/done/$', password_reset_done, {'template_name':'login/registation/password_reset_done.html'}, 
        name='password_reset_done'),
    url(r'^password-reset/confirm/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$', 
        password_reset_confirm, {'template_name':'login/registation/password_reset_confirm.html'}, 
        name='password_reset_confirm'),
    url(r'^password-reset/complete/$', password_reset_complete, {'template_name':'login/registation/password_reset_complete.html'}, 
        name='password_reset_complete'),
    # url inicio
    url(r'^inicio/$', login_required(vista.index), name='inicio'),
    # #url de apps 
    # # CONTENIDOS
    url(r'^contenidos/', include('apps.contenidos.urls', namespace="contenidos")),
    # # PREGUNTAS
    url(r'^preguntas/', include('apps.preguntas.urls', namespace="preguntas")),
    # # EVALUACIONES
    url(r'^evaluaciones/', include('apps.evaluacion.urls', namespace="evaluaciones")),
    # USUARIOS
    url(r'^usuarios/', include('apps.usuarios.urls', namespace="usuarios")),
    # # DASHBOARD
    url(r'^dashboard/', include('apps.dashboard.urls', namespace="dashboard")),

    #   API
    # url(r'^api/evaluacion/', include('apps.evaluacion.api.urls', namespace="api-evaluaciones")),


   
] #+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.DEBUG:
    urlpatterns += [
            url(r'^media/(?P<path>.*)$', serve, {
                'document_root': settings.MEDIA_ROOT,
            }),
        ]