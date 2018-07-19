# Sistema de Evaluación Centralizado (SEC)

Aplicación Web desarrollada en [Django](https://www.djangoproject.com) para [Universidad Andrés Bello](http://www.unab.cl).

## Autores
* [Daniel Mansilla Cañoles](https://github.com/Mansilla1)
* [Manuel Olmos Soto](https://github.com/mmolsoto)

# Instalación

*Nota: El proyecto ha sido desarrollado en:*

* *[Python 2.7](https://www.python.org/downloads/)*
* *[Django 1.10](https://www.djangoproject.com/download/)*


*Nota 2: El sistema está configurado para utilizarse con Bases de Datos __MySQL__, sin embargo, puede configurarse para utilizar cualquier otro motor de Base de Datos (SQLite por ejemplo)*


* Paso 1: **Activar entorno vitual**. Posicionarse en la carpeta raíz del proyecto (donde se ha creado el entorno virtual) y ejecutar:

```
$ source bin/activate
```  

* Paso 2: **Instalar requerimientos**. En la carpeta donde se encuentra el archivo _requirements.txt_ ejecutar el comando:

```
$ pip install -r requirements.txt
```
Esto lo que hará, será instalar los requerimientos para que el sistema funcione en la máquina.

* Paso 3: **Configurar Base de Datos**. 
	- Crear la base de datos de nombre **sistemaSEC** en MySQL y definir root como dueño de la base.
	- Importar base de datos con el siguiente comando:

```
$ mysql -u root -p -h localhost sistemaSEC < database.sql
```

* Paso 4: **Manos a la obra!**. Para desplegar el sistema en servidor local, ejecutar el comando:

```
$ python manage.py runserver
```
Este comando activará el servidor local, al cual puedes acceder desde tu navegador yendo a la url: [127.0.0.1:8000](http://127.0.0.1:8000)

# ¿Cómo generar una nueva pregunta?

Dentro del sistema se debe acceder al apartado de [preguntas](http://127.0.0.1:8000/preguntas/preguntas/) y presionar el botón verde de [nueva pregunta](http://127.0.0.1:8000/preguntas/pregunta-add/).

![Nueva pregunta](images/nueva_pregunta.png)

Completar el formulario y esperar a que la pregunta sea validada por una entidad.


