-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: sistemaSEC
-- ------------------------------------------------------
-- Server version 5.5.41-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add kv store',7,'add_kvstore'),(20,'Can change kv store',7,'change_kvstore'),(21,'Can delete kv store',7,'delete_kvstore'),(22,'Can add perfil usuario',8,'add_perfilusuario'),(23,'Can change perfil usuario',8,'change_perfilusuario'),(24,'Can delete perfil usuario',8,'delete_perfilusuario'),(25,'Can add curso',9,'add_curso'),(26,'Can change curso',9,'change_curso'),(27,'Can delete curso',9,'delete_curso'),(28,'Can add sede',10,'add_sede'),(29,'Can change sede',10,'change_sede'),(30,'Can delete sede',10,'delete_sede'),(31,'Can add facultad',11,'add_facultad'),(32,'Can change facultad',11,'change_facultad'),(33,'Can delete facultad',11,'delete_facultad'),(34,'Can add asignatura',12,'add_asignatura'),(35,'Can change asignatura',12,'change_asignatura'),(36,'Can delete asignatura',12,'delete_asignatura'),(37,'Can add contenido',13,'add_contenido'),(38,'Can change contenido',13,'change_contenido'),(39,'Can delete contenido',13,'delete_contenido'),(43,'Can add bibliografia',15,'add_bibliografia'),(44,'Can change bibliografia',15,'change_bibliografia'),(45,'Can delete bibliografia',15,'delete_bibliografia'),(46,'Can add carrera',16,'add_carrera'),(47,'Can change carrera',16,'change_carrera'),(48,'Can delete carrera',16,'delete_carrera'),(49,'Can add condiciones aprobacion',17,'add_condicionesaprobacion'),(50,'Can change condiciones aprobacion',17,'change_condicionesaprobacion'),(51,'Can delete condiciones aprobacion',17,'delete_condicionesaprobacion'),(52,'Can add unidad',18,'add_unidad'),(53,'Can change unidad',18,'change_unidad'),(54,'Can delete unidad',18,'delete_unidad'),(55,'Can add estudiante',19,'add_estudiante'),(56,'Can change estudiante',19,'change_estudiante'),(57,'Can delete estudiante',19,'delete_estudiante'),(58,'Can add pregunta',20,'add_pregunta'),(59,'Can change pregunta',20,'change_pregunta'),(60,'Can delete pregunta',20,'delete_pregunta'),(61,'Can add respuesta',21,'add_respuesta'),(62,'Can change respuesta',21,'change_respuesta'),(63,'Can delete respuesta',21,'delete_respuesta'),(64,'Can add promedio',22,'add_promedio'),(65,'Can change promedio',22,'change_promedio'),(66,'Can delete promedio',22,'delete_promedio'),(67,'Can add puntaje pregunta',23,'add_puntajepregunta'),(68,'Can change puntaje pregunta',23,'change_puntajepregunta'),(69,'Can delete puntaje pregunta',23,'delete_puntajepregunta'),(70,'Can add evaluacion',24,'add_evaluacion'),(71,'Can change evaluacion',24,'change_evaluacion'),(72,'Can delete evaluacion',24,'delete_evaluacion'),(73,'Can add estudiante calificacion',25,'add_estudiantecalificacion'),(74,'Can change estudiante calificacion',25,'change_estudiantecalificacion'),(75,'Can delete estudiante calificacion',25,'delete_estudiantecalificacion'),(76,'Can add calificacion',26,'add_calificacion'),(77,'Can change calificacion',26,'change_calificacion'),(78,'Can delete calificacion',26,'delete_calificacion'),(79,'Can add objetivo educacional',27,'add_objetivoeducacional'),(80,'Can change objetivo educacional',27,'change_objetivoeducacional'),(81,'Can delete objetivo educacional',27,'delete_objetivoeducacional'),(82,'Can add resultado aprendizaje',28,'add_resultadoaprendizaje'),(83,'Can change resultado aprendizaje',28,'change_resultadoaprendizaje'),(84,'Can delete resultado aprendizaje',28,'delete_resultadoaprendizaje'),(85,'Can add competencia egreso',29,'add_competenciaegreso'),(86,'Can change competencia egreso',29,'change_competenciaegreso'),(87,'Can delete competencia egreso',29,'delete_competenciaegreso'),(88,'Can add modalidad didactica',30,'add_modalidaddidactica'),(89,'Can change modalidad didactica',30,'change_modalidaddidactica'),(90,'Can delete modalidad didactica',30,'delete_modalidaddidactica'),(91,'Can add habilidad transversal',31,'add_habilidadtransversal'),(92,'Can change habilidad transversal',31,'change_habilidadtransversal'),(93,'Can delete habilidad transversal',31,'delete_habilidadtransversal'),(94,'Can add descripcion general',32,'add_descripciongeneral'),(95,'Can change descripcion general',32,'change_descripciongeneral'),(96,'Can delete descripcion general',32,'delete_descripciongeneral');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$GM4bZArZCKCq$6WDu3pKNbdPmBlvpPaX+RrGRMgotsedyrFQDV8s7cac=','2017-08-18 03:07:07',1,'Admin','','','',1,1,'2017-07-28 20:10:50'),(2,'pbkdf2_sha256$30000$pJBMQb6aPcO5$Iwx8AU6YAFiwLRSlQ5n/lX8FnRXbidxrWIww1TXiGTo=',NULL,0,'m.olmosoto','','','',0,1,'2017-07-28 21:57:37'),(3,'pbkdf2_sha256$30000$ZOHYiVv7Cdoj$RJ+o6Am+ziOXdAKiRvI0eZCJq18AZL+kue9NYSSMFt4=','2017-08-06 15:20:25',0,'Docente','','','',0,1,'2017-07-31 23:33:08'),(7,'pbkdf2_sha256$30000$hJ0IIym1yoHS$Fm4+dEveoNb/Wc2qVVjVLwleYrHvGnNM+/r0PABDIPc=','2017-08-06 14:10:01',0,'eduardoquiroga','','','',0,1,'2017-08-01 17:52:11'),(8,'pbkdf2_sha256$30000$j0jTP7lBPdqw$TkRe3nfjkWYOA74Pa4xWSmgmTFsEtUo2tyX2OFeD5Es=','2017-08-06 15:16:22',0,'Comite','','','',0,1,'2017-08-06 14:13:25');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenidos_asignatura`
--

DROP TABLE IF EXISTS `contenidos_asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenidos_asignatura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `duracion` varchar(50) DEFAULT NULL,
  `creditos` int(11) NOT NULL,
  `nivel` varchar(50) NOT NULL,
  `caracter` varchar(50) DEFAULT NULL,
  `horas_teoricas` int(11) DEFAULT NULL,
  `horas_laboratorio` int(11) DEFAULT NULL,
  `horas_teoricas_personal` int(11) DEFAULT NULL,
  `horas_laboratorio_personal` int(11) DEFAULT NULL,
  `horas_dedicadas` int(11) DEFAULT NULL,
  `programas_academicos` varchar(100) DEFAULT NULL,
  `pre_requisitos` varchar(50) DEFAULT NULL,
  `nombre_requisito` varchar(100) DEFAULT NULL,
  `co_requisitos` varchar(50) DEFAULT NULL,
  `equivalencias` varchar(50) DEFAULT NULL,
  `eje_curricular` varchar(255) DEFAULT NULL,
  `creado_en` datetime NOT NULL,
  `ultima_modificacion` datetime NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  `tipo_programa` varchar(15) NOT NULL,
  `carrera_id` int(11) NOT NULL,
  `coordinador_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `contenidos_asignatura_15b82638` (`carrera_id`),
  KEY `contenidos_asignatura_6f86ee32` (`coordinador_id`),
  CONSTRAINT `contenidos_asignatu_carrera_id_37059d76_fk_contenidos_carrera_id` FOREIGN KEY (`carrera_id`) REFERENCES `contenidos_carrera` (`id`),
  CONSTRAINT `contenidos__coordinador_id_b1537476_fk_usuarios_perfilusuario_id` FOREIGN KEY (`coordinador_id`) REFERENCES `usuarios_perfilusuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidos_asignatura`
--

LOCK TABLES `contenidos_asignatura` WRITE;
/*!40000 ALTER TABLE `contenidos_asignatura` DISABLE KEYS */;
INSERT INTO `contenidos_asignatura` VALUES (1,'INS121','PROGRAMACIÓN I','',6,'1er Semestre',NULL,6,2,3,1,12,NULL,'','','',NULL,'Desarrollo de software','2017-07-29 02:52:35','2017-08-08 02:31:31',1,'Regular',1,1),(3,'INS124','PROGRAMACIÓN II',NULL,6,'2do Semestre',NULL,6,2,3,1,12,NULL,'INS121','PROGRAMACIÓN I',NULL,NULL,'Desarrollo de software','2017-07-29 02:52:37','2017-07-31 23:54:33',1,'Regular',1,1),(6,'INS127','ESTRUCTURA DE DATOS',NULL,6,'3er Semestre',NULL,6,2,3,1,12,NULL,NULL,NULL,NULL,NULL,'Desarrollo de software','2017-07-29 02:52:40','2017-07-31 23:54:33',1,'Regular',1,1);
/*!40000 ALTER TABLE `contenidos_asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenidos_bibliografia`
--

DROP TABLE IF EXISTS `contenidos_bibliografia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenidos_bibliografia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_biblio` varchar(50) NOT NULL,
  `bibliografia` longtext NOT NULL,
  `asignatura_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contenidos_bi_asignatura_id_44e708ba_fk_contenidos_asignatura_id` (`asignatura_id`),
  CONSTRAINT `contenidos_bi_asignatura_id_44e708ba_fk_contenidos_asignatura_id` FOREIGN KEY (`asignatura_id`) REFERENCES `contenidos_asignatura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidos_bibliografia`
--

LOCK TABLES `contenidos_bibliografia` WRITE;
/*!40000 ALTER TABLE `contenidos_bibliografia` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenidos_bibliografia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenidos_carrera`
--

DROP TABLE IF EXISTS `contenidos_carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenidos_carrera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carrera` varchar(200) NOT NULL,
  `facultad_id` int(11) NOT NULL,
  `sede_id` int(11) NOT NULL,
  `codigo_carrera` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contenidos_carrera_00e3be6f` (`facultad_id`),
  KEY `contenidos_carrera_0687f864` (`sede_id`),
  CONSTRAINT `contenidos_carrera_sede_id_d5e670f6_fk_contenidos_sede_id` FOREIGN KEY (`sede_id`) REFERENCES `contenidos_sede` (`id`),
  CONSTRAINT `contenidos_carrer_facultad_id_beacdf36_fk_contenidos_facultad_id` FOREIGN KEY (`facultad_id`) REFERENCES `contenidos_facultad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidos_carrera`
--

LOCK TABLES `contenidos_carrera` WRITE;
/*!40000 ALTER TABLE `contenidos_carrera` DISABLE KEYS */;
INSERT INTO `contenidos_carrera` VALUES (1,'Ingeniería en Computación e Informática',1,1,'UNAB11500');
/*!40000 ALTER TABLE `contenidos_carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenidos_competenciaegreso`
--

DROP TABLE IF EXISTS `contenidos_competenciaegreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenidos_competenciaegreso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `competencia_egreso` longtext,
  `asignatura_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contenidos_co_asignatura_id_87ff2720_fk_contenidos_asignatura_id` (`asignatura_id`),
  CONSTRAINT `contenidos_co_asignatura_id_87ff2720_fk_contenidos_asignatura_id` FOREIGN KEY (`asignatura_id`) REFERENCES `contenidos_asignatura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidos_competenciaegreso`
--

LOCK TABLES `contenidos_competenciaegreso` WRITE;
/*!40000 ALTER TABLE `contenidos_competenciaegreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenidos_competenciaegreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenidos_condicionesaprobacion`
--

DROP TABLE IF EXISTS `contenidos_condicionesaprobacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenidos_condicionesaprobacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_condicion` longtext NOT NULL,
  `asignatura_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contenidos_co_asignatura_id_95636c4a_fk_contenidos_asignatura_id` (`asignatura_id`),
  CONSTRAINT `contenidos_co_asignatura_id_95636c4a_fk_contenidos_asignatura_id` FOREIGN KEY (`asignatura_id`) REFERENCES `contenidos_asignatura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidos_condicionesaprobacion`
--

LOCK TABLES `contenidos_condicionesaprobacion` WRITE;
/*!40000 ALTER TABLE `contenidos_condicionesaprobacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenidos_condicionesaprobacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenidos_contenido`
--

DROP TABLE IF EXISTS `contenidos_contenido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenidos_contenido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenido` varchar(150) NOT NULL,
  `aprendizaje_esperado` longtext,
  `unidad_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contenidos_contenido_d8b8136c` (`unidad_id`),
  CONSTRAINT `contenidos_contenido_unidad_id_eb014e7b_fk_contenidos_unidad_id` FOREIGN KEY (`unidad_id`) REFERENCES `contenidos_unidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidos_contenido`
--

LOCK TABLES `contenidos_contenido` WRITE;
/*!40000 ALTER TABLE `contenidos_contenido` DISABLE KEYS */;
INSERT INTO `contenidos_contenido` VALUES (2,'Dato vs Información','Aprender sobre dato e información',1),(3,'Definición de problemas','',1),(4,'Modelos de programación','',1),(5,'Licencias de software','',1),(6,'Algoritmos y partes que lo conforman','',1),(7,'Psedocodigo','',1),(8,'Técnicas de Programación Estructurada utilizando las estructuras de secuencias, selección e iteración','',1),(9,'Programación estructurada utilizando las estructuras de secuencias, selección e iteración','',1),(10,'Uso de contadores, acumuladores','Construir programas estructurados con lenguaje Python usando sentencias simples de secuencias, selección y de repetición',1),(11,'Funciones y módulos para construir programas','Construir funciones en programas estructurados con lenguaje Python, que permitan agrupar módulos reutilizables usando estructuras de datos simples',2),(12,'Listas y Tuplas','',2),(13,'Diccionarios y conjuntos','',2),(14,'Estructuras de datos anidadas','',2),(15,'Array en Python con módulo Numpy','',3),(16,'Salto de línea, búsqueda de string, reemplazo, transformar mayúscula –minúscula','Construir programa computacional en Python para resolver problemas usando arreglos unidimensionales y bidimensionales (vectores y matrices)',3),(17,'Leer archivos','Aplicar herramientas para el uso de procesamientos de texto',3),(18,'Escribir archivos','Construir programa computacional en Python para resolver problemas usando archivos de texto.',3),(19,'Lenguaje C','Construir programas en lenguaje C usando punteros y tipos de datos estructurados que permitan entregar soluciones eficientes y correctas para un problema dado',4),(20,'Punteros en C','',4),(21,'Arreglos y registros en C','',4),(22,'Técnicas de ordenamiento','Implementa soluciones eficientes y correctas para un problema de búsqueda y ordenamiento de datos estructurados usando la mejor alternativa, dado un conjunto de algoritmos predefinidos',4),(23,'Comparar algoritmos de búsqueda y ordenamiento en términos de su eficiencia','',4),(24,'Listas enlazadas, implementaciones clásicas y aplicaciones','',4),(25,'Pilas, implementaciones clásicas y aplicaciones','',4),(26,'Colas, implementaciones clásicas y aplicaciones','',4),(27,'Variantes de Listas, Pilas y colas (simples, dobles y circulares)','Construir programas eficientes y correctos para un problema dado, usando las operaciones fundamentales predefinidas de estructuras lineales pilas, colas y listas',4),(28,'Definición de Recursividad y aplicaciones','',5),(29,'Conceptos de árboles y recorridos','Resolver problemas de programación en lenguaje C que utilicen funciones recursivas',5),(30,'Conceptos de ABB','',5),(31,'Implementaciones fundamentales de ABB','Construir programas eficientes y correctos para un problema dado, usando las operaciones fundamentales predefinidas de estructuras no lineales árboles',5),(32,'Colas de prioridad y aplicaciones mediante heaps y heapsort','',5),(33,'Balance de árboles (AVL) y aplicación','',5),(34,'Operaciones de conjuntos','',6),(35,'Indexación mediante hashing','Aplicar la mejor alternativa para dar solución a un problema dado, usando conjuntos y una lista de funciones hashing',6),(36,'Hashing abierto y cerrado','',6),(37,'Conceptos de grafos e implementaciones clásicas','',6),(38,'Algoritmos de cobertura de costo mínimo y camino mínimo','Aplicar la mejor alternativa para dar solución a problema dado, usando algoritmos de estructuras no lineales de grafos predefinidos',6),(39,'haskgfahsf','ajshfjashfjas',1),(40,'Paradigma POO','Comprender los conceptos fundamentales del paradigma asociado a la Programación Orientado a Objetos.',7),(41,'Modelado en POO','Diseñar un modelo utilizando el paradigma OO que permitan resolver situaciones reales y de ingeniería.',7),(42,'Desarrollo procedimental','',7),(43,'Principios de la POO','',7),(44,'Abstracción','',7),(45,'Encapsulamiento','',7),(46,'Clases - Instancias','',7),(47,'Objetos','',7),(48,'Mensajes y métodos','',7),(49,'Comportamiento','',7),(50,'Herencia','',7),(51,'Polimorfismo','',7),(52,'Persistencia','',7),(53,'Encapsulamiento','Construir programas, utilizando la POO (JAVA) para resolver situaciones reales y de ingeniería.',8),(54,'Clases - Instancias','',8),(55,'Objetos','',8),(56,'Mensajes y métodos','',8),(57,'Comportamiento','',8),(58,'Herencia','',8),(59,'Polimorfismo','',8),(60,'Clases de arreglos con una y dos dimensiones','Desarrollar una aplicación en lenguaje de programación OO (JAVA) utilizando una base de datos relacional y una interfaz gráfica.',9),(61,'Sentencias básicas de administración de bases datos tales como crear BD y tablas, insertar, actualizar, eliminar, entre otros.','',9),(62,'Sentencias/Clases para manejo de base de datos tales como Conecction, url conexión a BD, Statement, ClassforName, etc.','',9),(63,'Clases y objetos para interfaces gráficas tales como JFrame, JPanel, JLabel, etc.','',9);
/*!40000 ALTER TABLE `contenidos_contenido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenidos_curso`
--

DROP TABLE IF EXISTS `contenidos_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenidos_curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nrc` varchar(50) NOT NULL,
  `regimen` varchar(200) NOT NULL,
  `asignatura_id` int(11) NOT NULL,
  `docente_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contenidos_cu_asignatura_id_5769bab6_fk_contenidos_asignatura_id` (`asignatura_id`),
  KEY `contenidos_curs_docente_id_75095130_fk_usuarios_perfilusuario_id` (`docente_id`),
  CONSTRAINT `contenidos_curs_docente_id_75095130_fk_usuarios_perfilusuario_id` FOREIGN KEY (`docente_id`) REFERENCES `usuarios_perfilusuario` (`id`),
  CONSTRAINT `contenidos_cu_asignatura_id_5769bab6_fk_contenidos_asignatura_id` FOREIGN KEY (`asignatura_id`) REFERENCES `contenidos_asignatura` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidos_curso`
--

LOCK TABLES `contenidos_curso` WRITE;
/*!40000 ALTER TABLE `contenidos_curso` DISABLE KEYS */;
INSERT INTO `contenidos_curso` VALUES (1,'6590','Diurno',1,1,1),(2,'123','Diurno',1,1,1);
/*!40000 ALTER TABLE `contenidos_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenidos_curso_estudiantes`
--

DROP TABLE IF EXISTS `contenidos_curso_estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenidos_curso_estudiantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curso_id` int(11) NOT NULL,
  `estudiante_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contenidos_curso_estudiantes_curso_id_6bcd967c_uniq` (`curso_id`,`estudiante_id`),
  KEY `contenidos_curs_estudiante_id_8b2dd1f8_fk_usuarios_estudiante_id` (`estudiante_id`),
  CONSTRAINT `contenidos_curso_estudi_curso_id_d729d561_fk_contenidos_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `contenidos_curso` (`id`),
  CONSTRAINT `contenidos_curs_estudiante_id_8b2dd1f8_fk_usuarios_estudiante_id` FOREIGN KEY (`estudiante_id`) REFERENCES `usuarios_estudiante` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidos_curso_estudiantes`
--

LOCK TABLES `contenidos_curso_estudiantes` WRITE;
/*!40000 ALTER TABLE `contenidos_curso_estudiantes` DISABLE KEYS */;
INSERT INTO `contenidos_curso_estudiantes` VALUES (2,1,1),(4,1,2),(5,1,3),(6,1,4),(7,1,5),(8,1,6),(9,1,7),(10,1,8),(11,1,9),(12,1,10),(13,1,11),(14,1,12),(15,1,13),(16,1,14),(17,1,15),(18,1,16),(19,1,17),(20,1,18),(21,1,19),(22,1,20),(23,1,21),(24,1,22),(1,2,1),(26,2,2),(27,2,3),(28,2,4),(29,2,5),(30,2,6),(31,2,7),(32,2,8),(33,2,9),(34,2,10),(35,2,11),(36,2,12),(37,2,13),(38,2,14),(39,2,15),(40,2,16),(41,2,17),(42,2,18),(43,2,19),(44,2,20),(45,2,21),(46,2,22);
/*!40000 ALTER TABLE `contenidos_curso_estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenidos_descripciongeneral`
--

DROP TABLE IF EXISTS `contenidos_descripciongeneral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenidos_descripciongeneral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_general` longtext,
  `asignatura_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contenidos_de_asignatura_id_11e283bf_fk_contenidos_asignatura_id` (`asignatura_id`),
  CONSTRAINT `contenidos_de_asignatura_id_11e283bf_fk_contenidos_asignatura_id` FOREIGN KEY (`asignatura_id`) REFERENCES `contenidos_asignatura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidos_descripciongeneral`
--

LOCK TABLES `contenidos_descripciongeneral` WRITE;
/*!40000 ALTER TABLE `contenidos_descripciongeneral` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenidos_descripciongeneral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenidos_facultad`
--

DROP TABLE IF EXISTS `contenidos_facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenidos_facultad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facultad` varchar(255) NOT NULL,
  `descripcion` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidos_facultad`
--

LOCK TABLES `contenidos_facultad` WRITE;
/*!40000 ALTER TABLE `contenidos_facultad` DISABLE KEYS */;
INSERT INTO `contenidos_facultad` VALUES (1,'Ingeniería',NULL);
/*!40000 ALTER TABLE `contenidos_facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenidos_habilidadtransversal`
--

DROP TABLE IF EXISTS `contenidos_habilidadtransversal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenidos_habilidadtransversal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `habilidad_transversal` longtext,
  `asignatura_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contenidos_ha_asignatura_id_749846d7_fk_contenidos_asignatura_id` (`asignatura_id`),
  CONSTRAINT `contenidos_ha_asignatura_id_749846d7_fk_contenidos_asignatura_id` FOREIGN KEY (`asignatura_id`) REFERENCES `contenidos_asignatura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidos_habilidadtransversal`
--

LOCK TABLES `contenidos_habilidadtransversal` WRITE;
/*!40000 ALTER TABLE `contenidos_habilidadtransversal` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenidos_habilidadtransversal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenidos_modalidaddidactica`
--

DROP TABLE IF EXISTS `contenidos_modalidaddidactica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenidos_modalidaddidactica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modalidad_didactica` longtext,
  `asignatura_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contenidos_mo_asignatura_id_380fc1ed_fk_contenidos_asignatura_id` (`asignatura_id`),
  CONSTRAINT `contenidos_mo_asignatura_id_380fc1ed_fk_contenidos_asignatura_id` FOREIGN KEY (`asignatura_id`) REFERENCES `contenidos_asignatura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidos_modalidaddidactica`
--

LOCK TABLES `contenidos_modalidaddidactica` WRITE;
/*!40000 ALTER TABLE `contenidos_modalidaddidactica` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenidos_modalidaddidactica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenidos_objetivoeducacional`
--

DROP TABLE IF EXISTS `contenidos_objetivoeducacional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenidos_objetivoeducacional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objetivo_educacional` longtext,
  `asignatura_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contenidos_ob_asignatura_id_b50b530a_fk_contenidos_asignatura_id` (`asignatura_id`),
  CONSTRAINT `contenidos_ob_asignatura_id_b50b530a_fk_contenidos_asignatura_id` FOREIGN KEY (`asignatura_id`) REFERENCES `contenidos_asignatura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidos_objetivoeducacional`
--

LOCK TABLES `contenidos_objetivoeducacional` WRITE;
/*!40000 ALTER TABLE `contenidos_objetivoeducacional` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenidos_objetivoeducacional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenidos_resultadoaprendizaje`
--

DROP TABLE IF EXISTS `contenidos_resultadoaprendizaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenidos_resultadoaprendizaje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resultado_aprendizaje` longtext,
  `asignatura_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contenidos_re_asignatura_id_10af5122_fk_contenidos_asignatura_id` (`asignatura_id`),
  CONSTRAINT `contenidos_re_asignatura_id_10af5122_fk_contenidos_asignatura_id` FOREIGN KEY (`asignatura_id`) REFERENCES `contenidos_asignatura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidos_resultadoaprendizaje`
--

LOCK TABLES `contenidos_resultadoaprendizaje` WRITE;
/*!40000 ALTER TABLE `contenidos_resultadoaprendizaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenidos_resultadoaprendizaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenidos_sede`
--

DROP TABLE IF EXISTS `contenidos_sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenidos_sede` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sede` varchar(255) NOT NULL,
  `lugar` varchar(255) DEFAULT NULL,
  `descripcion` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidos_sede`
--

LOCK TABLES `contenidos_sede` WRITE;
/*!40000 ALTER TABLE `contenidos_sede` DISABLE KEYS */;
INSERT INTO `contenidos_sede` VALUES (1,'Antonio Varas','Antonio Varas #880',NULL);
/*!40000 ALTER TABLE `contenidos_sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenidos_unidad`
--

DROP TABLE IF EXISTS `contenidos_unidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenidos_unidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `unidad` int(11) DEFAULT NULL,
  `asignatura_id` int(11) NOT NULL,
  `aprendizaje` longtext,
  PRIMARY KEY (`id`),
  KEY `contenidos_un_asignatura_id_4bcc06e0_fk_contenidos_asignatura_id` (`asignatura_id`),
  CONSTRAINT `contenidos_un_asignatura_id_4bcc06e0_fk_contenidos_asignatura_id` FOREIGN KEY (`asignatura_id`) REFERENCES `contenidos_asignatura` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidos_unidad`
--

LOCK TABLES `contenidos_unidad` WRITE;
/*!40000 ALTER TABLE `contenidos_unidad` DISABLE KEYS */;
INSERT INTO `contenidos_unidad` VALUES (1,'Algoritmos y Programación Estructurada',1,1,'Aplicar la mejor alternativa para dar solución a problema dado, usando algoritmos de estructuras no lineales de grafos predefinidos'),(2,'Funciones y módulos con estructuras de datos simples',2,1,'Construir funciones y módulos en un programa computacional bajo el concepto de programación estructurada usando estructuras de datos simples.'),(3,'Estructuras de datos complejas: Arreglos y Archivos de texto',3,1,'Construir un programa computacional bajo el concepto de programación estructurada usando estructuras de datos complejas tales como arreglos, matrices y archivos.'),(4,'Punteros, tipos de datos estructurados y estructuras lineales con lenguaje C',1,6,NULL),(5,'Recursividad y Árboles',2,6,NULL),(6,'Conjuntos, Indexación y Grafos',3,6,''),(7,'Orientación a Objetos (OO)',1,3,'Analizar un problema real de desarrollo de software utilizando los conceptos fundamentales del paradigma de Programación Orientado a Objeto.'),(8,'Programación Orientada a Objeto - Abstracción',2,3,'Construir un programa computacional utilizando el paradigma orientado a objetos cautelando la correcta sintaxis en la creación de clases y sus características.'),(9,'Programación Orientada a Objeto y Bases de Datos',3,3,'Construir un programa computacional bajo el paradigma de programación orientado a objeto, considerando la creación de una base de datos relacional (tablas con al menos una vista).');
/*!40000 ALTER TABLE `contenidos_unidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-07-28 20:23:01','1','1111111-1',1,'[{\"added\": {}}]',8,1),(2,'2017-07-28 22:51:04','1','Antonio Varas',1,'[{\"added\": {}}]',10,1),(3,'2017-07-28 22:51:12','1','Ingenieria',1,'[{\"added\": {}}]',11,1),(4,'2017-07-28 22:51:18','1','Ingeniería',2,'[{\"changed\": {\"fields\": [\"facultad\"]}}]',11,1),(5,'2017-07-28 22:51:39','1','Ingeniería en Computación e Informática',1,'[{\"added\": {}}]',16,1),(6,'2017-07-28 22:52:35','1','INS121',1,'[{\"added\": {}}]',12,1),(7,'2017-07-28 22:55:07','1','6590',1,'[{\"added\": {}}]',9,1),(8,'2017-07-28 22:55:19','1','INS121',2,'[{\"changed\": {\"fields\": [\"eje_curricular\"]}}]',12,1),(9,'2017-07-29 02:12:02','2','kjkj',3,'',12,1),(10,'2017-07-29 02:13:53','3','asd',3,'',12,1),(11,'2017-07-29 05:16:44','1','18887510-6',1,'[{\"added\": {}}]',19,1),(12,'2017-07-29 05:30:48','2','123',2,'[]',9,1),(13,'2017-07-29 05:34:45','4','312341',3,'',9,1),(14,'2017-07-29 05:34:45','3','312341',3,'',9,1),(15,'2017-07-29 06:32:31','1','Algoritmos y Programación Estructurada',1,'[{\"added\": {}}]',18,1),(16,'2017-07-29 06:33:27','2','Dato vs Información',1,'[{\"added\": {}}]',13,1),(17,'2017-07-29 06:57:45','1','Pregunta object',1,'[{\"added\": {}}]',20,1),(18,'2017-07-29 06:57:52','1','Pregunta object',3,'',20,1),(19,'2017-07-29 07:15:07','2','Pregunta object',1,'[{\"added\": {}}]',20,1),(20,'2017-07-29 07:15:52','2','Pregunta object',2,'[{\"changed\": {\"fields\": [\"dificultad\"]}}]',20,1),(21,'2017-07-29 08:08:33','8','Pregunta object',3,'',20,1),(22,'2017-07-29 08:08:33','7','Pregunta object',3,'',20,1),(23,'2017-07-29 08:08:33','6','Pregunta object',3,'',20,1),(24,'2017-07-29 08:08:33','5','Pregunta object',3,'',20,1),(25,'2017-07-29 08:08:33','4','Pregunta object',3,'',20,1),(26,'2017-07-29 08:08:33','3','Pregunta object',3,'',20,1),(27,'2017-07-29 08:08:33','2','Pregunta object',3,'',20,1),(28,'2017-07-29 08:14:02','9','Pregunta object',2,'[{\"changed\": {\"fields\": [\"corregida\"]}}]',20,1),(29,'2017-07-29 15:56:44','1','Evaluacion object',3,'',24,1),(30,'2017-07-29 16:33:58','4','Evaluacion object',2,'[]',24,1),(31,'2017-07-29 17:09:27','8','Evaluacion object',2,'[{\"changed\": {\"fields\": [\"fecha_evaluacion\", \"instrucciones\"]}}]',24,1),(32,'2017-07-29 22:25:20','12','Evaluacion object',3,'',24,1),(33,'2017-07-29 22:25:20','11','Evaluacion object',3,'',24,1),(34,'2017-07-29 22:25:20','10','Evaluacion object',3,'',24,1),(35,'2017-07-29 22:25:20','9','Evaluacion object',3,'',24,1),(36,'2017-07-29 22:25:20','8','Evaluacion object',3,'',24,1),(37,'2017-07-29 22:25:20','7','Evaluacion object',3,'',24,1),(38,'2017-07-29 22:25:20','6','Evaluacion object',3,'',24,1),(39,'2017-07-29 22:25:20','5','Evaluacion object',3,'',24,1),(40,'2017-07-29 22:25:20','4','Evaluacion object',3,'',24,1),(41,'2017-07-29 22:25:20','3','Evaluacion object',3,'',24,1),(42,'2017-07-29 22:25:20','2','Evaluacion object',3,'',24,1),(43,'2017-07-30 00:09:23','1','EstudianteCalificacion object',1,'[{\"added\": {}}]',25,1),(44,'2017-07-30 00:09:30','1','EstudianteCalificacion object',3,'',25,1),(45,'2017-07-30 00:10:05','5','Calificacion object',3,'',26,1),(46,'2017-07-30 00:10:05','4','Calificacion object',3,'',26,1),(47,'2017-07-30 00:10:05','3','Calificacion object',3,'',26,1),(48,'2017-07-30 00:10:05','2','Calificacion object',3,'',26,1),(49,'2017-07-30 00:10:05','1','Calificacion object',3,'',26,1),(50,'2017-07-30 00:13:33','7','Calificacion object',3,'',26,1),(51,'2017-07-30 00:13:33','6','Calificacion object',3,'',26,1),(52,'2017-07-30 18:22:31','16','Evaluacion object',3,'',24,1),(53,'2017-07-30 20:30:02','18','Evaluacion object',3,'',24,1),(54,'2017-07-30 20:30:02','14','Evaluacion object',3,'',24,1),(55,'2017-07-30 20:30:02','13','Evaluacion object',3,'',24,1),(56,'2017-07-31 17:32:15','11','Pregunta object',2,'[{\"changed\": {\"fields\": [\"tipo_pregunta\"]}}]',20,1),(57,'2017-07-31 17:32:45','8','respuesta falsa 2',2,'[{\"changed\": {\"fields\": [\"opcion\"]}}]',21,1),(58,'2017-07-31 17:32:49','7','respuesta correcta',2,'[{\"changed\": {\"fields\": [\"opcion\"]}}]',21,1),(59,'2017-07-31 17:32:56','6','respuesta falsa',2,'[{\"changed\": {\"fields\": [\"opcion\"]}}]',21,1),(60,'2017-07-31 17:41:34','14','Pregunta object',3,'',20,1),(61,'2017-07-31 17:41:34','13','Pregunta object',3,'',20,1),(62,'2017-07-31 17:41:34','12','Pregunta object',3,'',20,1),(63,'2017-07-31 17:41:34','11','Pregunta object',3,'',20,1),(64,'2017-07-31 17:45:43','10','Pregunta object',2,'[{\"changed\": {\"fields\": [\"dificultad\"]}}]',20,1),(65,'2017-07-31 17:45:48','9','Pregunta object',2,'[{\"changed\": {\"fields\": [\"dificultad\"]}}]',20,1),(66,'2017-07-31 17:47:46','16','Pregunta object',3,'',20,1),(67,'2017-07-31 17:57:05','2','skdj',3,'',12,1),(68,'2017-07-31 20:48:49','1','INS121',2,'update through import_export',12,1),(69,'2017-07-31 20:48:49','2','INS122',1,'new through import_export',12,1),(70,'2017-07-31 20:48:49','3','INS124',1,'new through import_export',12,1),(71,'2017-07-31 20:48:49','4','INS125',1,'new through import_export',12,1),(72,'2017-07-31 20:48:49','5','INS126',1,'new through import_export',12,1),(73,'2017-07-31 20:48:49','6','INS127',1,'new through import_export',12,1),(74,'2017-07-31 20:48:49','7','INS131',1,'new through import_export',12,1),(75,'2017-07-31 20:48:49','8','INS123',1,'new through import_export',12,1),(76,'2017-07-31 20:48:49','9','INS128',1,'new through import_export',12,1),(77,'2017-07-31 20:48:49','10','ING119',1,'new through import_export',12,1),(78,'2017-07-31 20:48:49','11','INS232',1,'new through import_export',12,1),(79,'2017-07-31 20:48:49','12','ING129',1,'new through import_export',12,1),(80,'2017-07-31 23:54:33','1','INS121',2,'update through import_export',12,1),(81,'2017-07-31 23:54:33','2','INS122',2,'update through import_export',12,1),(82,'2017-07-31 23:54:33','3','INS124',2,'update through import_export',12,1),(83,'2017-07-31 23:54:33','4','INS125',2,'update through import_export',12,1),(84,'2017-07-31 23:54:33','5','INS126',2,'update through import_export',12,1),(85,'2017-07-31 23:54:33','6','INS127',2,'update through import_export',12,1),(86,'2017-07-31 23:54:33','7','INS131',2,'update through import_export',12,1),(87,'2017-07-31 23:54:33','8','INS123',2,'update through import_export',12,1),(88,'2017-07-31 23:54:33','9','INS128',2,'update through import_export',12,1),(89,'2017-07-31 23:54:33','10','ING119',2,'update through import_export',12,1),(90,'2017-07-31 23:54:33','11','INS232',2,'update through import_export',12,1),(91,'2017-07-31 23:54:33','12','ING129',2,'update through import_export',12,1),(92,'2017-07-31 23:54:33','13','ITC1701',1,'new through import_export',12,1),(93,'2017-07-31 23:54:33','14','IGE232',1,'new through import_export',12,1),(94,'2017-07-31 23:54:33','15','INS234',1,'new through import_export',12,1),(95,'2017-08-01 00:59:34','18','Pregunta object',3,'',20,1),(96,'2017-08-01 00:59:34','17','Pregunta object',3,'',20,1),(97,'2017-08-01 00:59:34','15','Pregunta object',3,'',20,1),(98,'2017-08-01 00:59:34','10','Pregunta object',3,'',20,1),(99,'2017-08-01 00:59:34','9','Pregunta object',3,'',20,1),(100,'2017-08-01 01:07:07','32','Evaluacion object',3,'',24,1),(101,'2017-08-01 01:07:07','31','Evaluacion object',3,'',24,1),(102,'2017-08-01 01:07:07','30','Evaluacion object',3,'',24,1),(103,'2017-08-01 01:07:07','29','Evaluacion object',3,'',24,1),(104,'2017-08-01 01:07:07','28','Evaluacion object',3,'',24,1),(105,'2017-08-01 01:07:07','27','Evaluacion object',3,'',24,1),(106,'2017-08-01 01:07:07','26','Evaluacion object',3,'',24,1),(107,'2017-08-01 01:07:07','25','Evaluacion object',3,'',24,1),(108,'2017-08-01 01:07:07','24','Evaluacion object',3,'',24,1),(109,'2017-08-01 01:07:07','23','Evaluacion object',3,'',24,1),(110,'2017-08-01 01:07:07','22','Evaluacion object',3,'',24,1),(111,'2017-08-01 01:07:07','21','Evaluacion object',3,'',24,1),(112,'2017-08-01 01:07:07','20','Evaluacion object',3,'',24,1),(113,'2017-08-01 01:07:07','19','Evaluacion object',3,'',24,1),(114,'2017-08-01 01:07:07','17','Evaluacion object',3,'',24,1),(115,'2017-08-01 01:07:07','15','Evaluacion object',3,'',24,1),(116,'2017-08-01 01:30:44','3','Definición de problemas',1,'[{\"added\": {}}]',13,1),(117,'2017-08-01 01:30:57','4','Modelos de programación',1,'[{\"added\": {}}]',13,1),(118,'2017-08-01 01:30:59','4','Modelos de programación',2,'[]',13,1),(119,'2017-08-01 01:31:07','5','Licencias de software',1,'[{\"added\": {}}]',13,1),(120,'2017-08-01 01:31:24','6','Algoritmos y partes que lo conforman',1,'[{\"added\": {}}]',13,1),(121,'2017-08-01 01:31:32','7','Psedocodigo',1,'[{\"added\": {}}]',13,1),(122,'2017-08-01 01:31:39','8','Técnicas de Programación Estructurada utilizando las estructuras de secuencias, selección e iteración',1,'[{\"added\": {}}]',13,1),(123,'2017-08-01 01:31:49','9','Programación estructurada utilizando las estructuras de secuencias, selección e iteración',1,'[{\"added\": {}}]',13,1),(124,'2017-08-01 01:32:06','10','Uso de contadores, acumuladores',1,'[{\"added\": {}}]',13,1),(125,'2017-08-01 01:32:20','2','Funciones y módulos con estructuras de datos simples',1,'[{\"added\": {}}]',18,1),(126,'2017-08-01 01:32:36','11','Funciones y módulos para construir programas',1,'[{\"added\": {}}]',13,1),(127,'2017-08-01 01:32:45','12','Listas y Tuplas',1,'[{\"added\": {}}]',13,1),(128,'2017-08-01 01:32:52','13','Diccionarios y conjuntos',1,'[{\"added\": {}}]',13,1),(129,'2017-08-01 01:33:00','14','Estructuras de datos anidadas',1,'[{\"added\": {}}]',13,1),(130,'2017-08-01 01:33:10','3','Estructuras de datos complejas: Arreglos y Archivos de texto',1,'[{\"added\": {}}]',18,1),(131,'2017-08-01 01:33:17','15','Array en Python con módulo Numpy',1,'[{\"added\": {}}]',13,1),(132,'2017-08-01 01:33:30','16','Salto de línea, búsqueda de string, reemplazo, transformar mayúscula –minúscula',1,'[{\"added\": {}}]',13,1),(133,'2017-08-01 01:33:44','17','Leer archivos',1,'[{\"added\": {}}]',13,1),(134,'2017-08-01 01:33:56','18','Escribir archivos',1,'[{\"added\": {}}]',13,1),(135,'2017-08-01 01:34:52','4','Punteros, tipos de datos estructurados y estructuras lineales con lenguaje C',1,'[{\"added\": {}}]',18,1),(136,'2017-08-01 01:35:05','19','Lenguaje C',1,'[{\"added\": {}}]',13,1),(137,'2017-08-01 01:35:13','20','Punteros en C',1,'[{\"added\": {}}]',13,1),(138,'2017-08-01 01:35:24','21','Arreglos y registros en C',1,'[{\"added\": {}}]',13,1),(139,'2017-08-01 01:35:35','22','Técnicas de ordenamiento',1,'[{\"added\": {}}]',13,1),(140,'2017-08-01 01:35:46','23','Comparar algoritmos de búsqueda y ordenamiento en términos de su eficiencia',1,'[{\"added\": {}}]',13,1),(141,'2017-08-01 01:35:52','24','Listas enlazadas, implementaciones clásicas y aplicaciones',1,'[{\"added\": {}}]',13,1),(142,'2017-08-01 01:35:58','25','Pilas, implementaciones clásicas y aplicaciones',1,'[{\"added\": {}}]',13,1),(143,'2017-08-01 01:36:04','26','Colas, implementaciones clásicas y aplicaciones',1,'[{\"added\": {}}]',13,1),(144,'2017-08-01 01:36:16','27','Variantes de Listas, Pilas y colas (simples, dobles y circulares)',1,'[{\"added\": {}}]',13,1),(145,'2017-08-01 01:36:30','5','Recursividad y Árboles',1,'[{\"added\": {}}]',18,1),(146,'2017-08-01 01:36:37','28','Definición de Recursividad y aplicaciones',1,'[{\"added\": {}}]',13,1),(147,'2017-08-01 01:36:50','29','Conceptos de árboles y recorridos',1,'[{\"added\": {}}]',13,1),(148,'2017-08-01 01:36:57','30','Conceptos de ABB',1,'[{\"added\": {}}]',13,1),(149,'2017-08-01 01:37:08','31','Implementaciones fundamentales de ABB',1,'[{\"added\": {}}]',13,1),(150,'2017-08-01 01:37:15','32','Colas de prioridad y aplicaciones mediante heaps y heapsort',1,'[{\"added\": {}}]',13,1),(151,'2017-08-01 01:37:24','33','Balance de árboles (AVL) y aplicación',1,'[{\"added\": {}}]',13,1),(152,'2017-08-01 01:44:28','6','Conjuntos, Indexación y Grafos',1,'[{\"added\": {}}]',18,1),(153,'2017-08-01 01:44:35','34','Operaciones de conjuntos',1,'[{\"added\": {}}]',13,1),(154,'2017-08-01 01:44:49','35','Indexación mediante hashing',1,'[{\"added\": {}}]',13,1),(155,'2017-08-01 01:44:57','36','Hashing abierto y cerrado',1,'[{\"added\": {}}]',13,1),(156,'2017-08-01 01:45:04','37','Conceptos de grafos e implementaciones clásicas',1,'[{\"added\": {}}]',13,1),(157,'2017-08-01 01:45:26','38','Algoritmos de cobertura de costo mínimo y camino mínimo',1,'[{\"added\": {}}]',13,1),(158,'2017-08-01 02:37:07','1','18887510-6',2,'update through import_export',19,1),(159,'2017-08-01 02:37:07','2','19063520-1',1,'new through import_export',19,1),(160,'2017-08-01 02:37:07','3','15543977-7',1,'new through import_export',19,1),(161,'2017-08-01 02:37:07','4','16801499-6',1,'new through import_export',19,1),(162,'2017-08-01 02:37:07','5','18730770-8',1,'new through import_export',19,1),(163,'2017-08-01 02:37:07','6','18835858-6',1,'new through import_export',19,1),(164,'2017-08-01 02:37:07','7','17065525-7',1,'new through import_export',19,1),(165,'2017-08-01 02:37:07','8','18022940-K',1,'new through import_export',19,1),(166,'2017-08-01 02:37:07','9','16710759-1',1,'new through import_export',19,1),(167,'2017-08-01 02:37:07','10','18465931-K',1,'new through import_export',19,1),(168,'2017-08-01 02:37:07','11','17404921-1',1,'new through import_export',19,1),(169,'2017-08-01 02:37:07','12','18955953-4',1,'new through import_export',19,1),(170,'2017-08-01 02:37:07','13','19081153-0',1,'new through import_export',19,1),(171,'2017-08-01 02:37:07','14','18612229-1',1,'new through import_export',19,1),(172,'2017-08-01 02:37:07','15','14210543-8',1,'new through import_export',19,1),(173,'2017-08-01 02:37:07','16','19114687-5',1,'new through import_export',19,1),(174,'2017-08-01 02:37:07','17','19289131-0',1,'new through import_export',19,1),(175,'2017-08-01 02:37:07','18','18049150-3',1,'new through import_export',19,1),(176,'2017-08-01 02:37:07','19','19164187-6',1,'new through import_export',19,1),(177,'2017-08-01 02:37:07','20','14746315-4',1,'new through import_export',19,1),(178,'2017-08-01 02:37:07','21','16365587-K',1,'new through import_export',19,1),(179,'2017-08-01 02:37:07','22','17402209-7',1,'new through import_export',19,1),(180,'2017-08-01 17:13:03','22','17402209-7',2,'[]',19,1),(181,'2017-08-01 17:13:49','21','16365587-K',2,'[]',19,1),(182,'2017-08-01 17:13:53','20','14746315-4',2,'[]',19,1),(183,'2017-08-01 17:13:58','19','19164187-6',2,'[]',19,1),(184,'2017-08-01 17:14:04','18','18049150-3',2,'[{\"changed\": {\"fields\": [\"apellido2\"]}}]',19,1),(185,'2017-08-01 17:14:08','17','19289131-0',2,'[]',19,1),(186,'2017-08-01 17:14:12','16','19114687-5',2,'[]',19,1),(187,'2017-08-01 17:14:18','16','19114687-5',2,'[]',19,1),(188,'2017-08-01 17:16:19','15','14210543-8',2,'[]',19,1),(189,'2017-08-01 17:16:22','14','18612229-1',2,'[]',19,1),(190,'2017-08-01 17:16:25','13','19081153-0',2,'[]',19,1),(191,'2017-08-01 17:16:28','12','18955953-4',2,'[]',19,1),(192,'2017-08-01 17:16:30','11','17404921-1',2,'[]',19,1),(193,'2017-08-01 17:16:33','10','18465931-K',2,'[]',19,1),(194,'2017-08-01 17:16:35','9','16710759-1',2,'[]',19,1),(195,'2017-08-01 17:16:37','8','18022940-K',2,'[]',19,1),(196,'2017-08-01 17:16:40','7','17065525-7',2,'[]',19,1),(197,'2017-08-01 17:16:43','6','18835858-6',2,'[]',19,1),(198,'2017-08-01 17:16:46','5','18730770-8',2,'[]',19,1),(199,'2017-08-01 17:16:49','4','16801499-6',2,'[]',19,1),(200,'2017-08-01 17:16:51','3','15543977-7',2,'[]',19,1),(201,'2017-08-01 17:16:54','2','19063520-1',2,'[]',19,1),(202,'2017-08-01 17:19:07','1','18887510-6',2,'[]',19,1),(203,'2017-08-01 17:29:55','4','f.molinaa',3,'',3,1),(204,'2017-08-01 17:30:35','5','f.molinaa',3,'',3,1),(205,'2017-08-01 17:31:37','6','19669833-7',2,'[{\"changed\": {\"fields\": [\"tipo_usuario\"]}}]',8,1),(206,'2017-08-03 02:44:56','6','Conjuntos, Indexación y Grafos',2,'[]',18,1),(207,'2017-08-03 03:44:34','7','Unidad 4',3,'',18,1),(208,'2017-08-03 05:29:11','1','Ingeniería en Computación e Informática',2,'[{\"changed\": {\"fields\": [\"codigo_carrera\"]}}]',16,1),(209,'2017-08-06 14:29:14','1','Algoritmos y Programación Estructurada',2,'[{\"changed\": {\"fields\": [\"aprendizaje\"]}}]',18,1),(210,'2017-08-06 15:14:49','7','Izim3n',3,'',18,1),(211,'2017-08-06 15:19:43','28','Pregunta object',2,'[{\"changed\": {\"fields\": [\"rechazada\"]}}]',20,1),(212,'2017-08-06 15:19:43','27','Pregunta object',2,'[{\"changed\": {\"fields\": [\"rechazada\"]}}]',20,1),(213,'2017-08-08 02:22:06','16','AA12',3,'',12,1),(214,'2017-08-08 02:23:04','15','INS234',3,'',12,1),(215,'2017-08-08 02:23:04','14','IGE232',3,'',12,1),(216,'2017-08-08 02:23:04','13','ITC1701',3,'',12,1),(217,'2017-08-08 02:23:04','12','ING129',3,'',12,1),(218,'2017-08-08 02:23:04','11','INS232',3,'',12,1),(219,'2017-08-08 02:23:04','10','ING119',3,'',12,1),(220,'2017-08-08 02:23:04','9','INS128',3,'',12,1),(221,'2017-08-08 02:23:04','8','INS123',3,'',12,1),(222,'2017-08-08 02:23:04','7','INS131',3,'',12,1),(223,'2017-08-08 02:23:04','5','INS126',3,'',12,1),(224,'2017-08-08 02:23:04','4','INS125',3,'',12,1),(225,'2017-08-08 02:23:04','2','INS122',3,'',12,1),(226,'2017-08-18 03:08:54','28','Pregunta object',3,'',20,1),(227,'2017-08-18 03:08:54','27','Pregunta object',3,'',20,1),(228,'2017-08-18 03:08:54','26','Pregunta object',3,'',20,1),(229,'2017-08-18 03:08:54','25','Pregunta object',3,'',20,1),(230,'2017-08-18 03:08:54','24','Pregunta object',3,'',20,1),(231,'2017-08-18 03:08:54','23','Pregunta object',3,'',20,1),(232,'2017-08-18 03:08:54','22','Pregunta object',3,'',20,1),(233,'2017-08-18 03:08:54','21','Pregunta object',3,'',20,1),(234,'2017-08-18 03:08:54','20','Pregunta object',3,'',20,1),(235,'2017-08-18 03:08:54','19','Pregunta object',3,'',20,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(12,'contenidos','asignatura'),(15,'contenidos','bibliografia'),(16,'contenidos','carrera'),(29,'contenidos','competenciaegreso'),(17,'contenidos','condicionesaprobacion'),(13,'contenidos','contenido'),(9,'contenidos','curso'),(32,'contenidos','descripciongeneral'),(11,'contenidos','facultad'),(31,'contenidos','habilidadtransversal'),(30,'contenidos','modalidaddidactica'),(27,'contenidos','objetivoeducacional'),(28,'contenidos','resultadoaprendizaje'),(10,'contenidos','sede'),(18,'contenidos','unidad'),(5,'contenttypes','contenttype'),(26,'evaluacion','calificacion'),(25,'evaluacion','estudiantecalificacion'),(24,'evaluacion','evaluacion'),(22,'evaluacion','promedio'),(23,'evaluacion','puntajepregunta'),(20,'preguntas','pregunta'),(21,'preguntas','respuesta'),(6,'sessions','session'),(7,'thumbnail','kvstore'),(19,'usuarios','estudiante'),(8,'usuarios','perfilusuario');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-07-28 20:10:26'),(2,'auth','0001_initial','2017-07-28 20:10:27'),(3,'admin','0001_initial','2017-07-28 20:10:27'),(4,'admin','0002_logentry_remove_auto_add','2017-07-28 20:10:27'),(5,'contenttypes','0002_remove_content_type_name','2017-07-28 20:10:27'),(6,'auth','0002_alter_permission_name_max_length','2017-07-28 20:10:28'),(7,'auth','0003_alter_user_email_max_length','2017-07-28 20:10:28'),(8,'auth','0004_alter_user_username_opts','2017-07-28 20:10:28'),(9,'auth','0005_alter_user_last_login_null','2017-07-28 20:10:28'),(10,'auth','0006_require_contenttypes_0002','2017-07-28 20:10:28'),(11,'auth','0007_alter_validators_add_error_messages','2017-07-28 20:10:28'),(12,'auth','0008_alter_user_username_max_length','2017-07-28 20:10:28'),(13,'sessions','0001_initial','2017-07-28 20:10:28'),(14,'usuarios','0001_initial','2017-07-28 20:21:26'),(15,'contenidos','0001_initial','2017-07-28 22:37:02'),(16,'usuarios','0002_estudiante','2017-07-28 22:41:04'),(17,'contenidos','0002_curso_estudiantes','2017-07-28 22:41:05'),(18,'contenidos','0003_curso_status','2017-07-28 22:53:56'),(19,'usuarios','0003_auto_20170728_2115','2017-07-29 01:15:54'),(20,'preguntas','0001_initial','2017-07-29 06:08:41'),(21,'preguntas','0002_auto_20170729_0256','2017-07-29 06:56:21'),(22,'preguntas','0003_auto_20170729_0257','2017-07-29 06:57:32'),(23,'preguntas','0004_auto_20170729_0314','2017-07-29 07:14:18'),(24,'preguntas','0005_auto_20170729_0345','2017-07-29 07:45:36'),(25,'evaluacion','0001_initial','2017-07-29 15:25:36'),(26,'contenidos','0004_unidad_aprendizaje','2017-08-03 01:34:28'),(27,'preguntas','0006_auto_20170802_2134','2017-08-03 01:34:30'),(28,'contenidos','0005_carrera_codigo_carrera','2017-08-03 05:27:56'),(29,'contenidos','0006_auto_20170806_1245','2017-08-06 16:45:14');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('7zrsw6ov8oydroh8co18ugdmx8xidsbp','MmQ1YzNjZTAzYjU4NWEwNmNlNjJkMzVlMTFlZGYxMjY4ZmJmYzQ1ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1YTczNWYzZGNhNTIxYjEzODQ5OTFmYjI1ZTY5NDcwMzZkNzZjMzYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-08-20 15:37:40'),('bhbph2h90wdrua17typuhh651lpi2gsg','MmQ1YzNjZTAzYjU4NWEwNmNlNjJkMzVlMTFlZGYxMjY4ZmJmYzQ1ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1YTczNWYzZGNhNTIxYjEzODQ5OTFmYjI1ZTY5NDcwMzZkNzZjMzYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-08-12 01:33:56'),('kgta56di0thk93w4kparazi8ebfogxpw','NzA1N2EwMmQ5ZWYxMWRkZmU4ODEzMTUzNDRhY2QxOWY5MzU1MGExYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1YTczNWYzZGNhNTIxYjEzODQ5OTFmYjI1ZTY5NDcwMzZkNzZjMzYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-08-12 17:10:20'),('qjb8ecuugmclbe6bb0ajxgew9h5o91lh','NTc5YmQ3MTA5NGViN2IwYTJhMmYyYjdlNzk0Zjc0ODg5NmJjYmJjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImI4NTRmN2YzOWZlMWJhOTA5M2E5NzdiMDNiNGE3Njk3NTU1MmJlMmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3In0=','2017-08-16 03:05:55'),('v8sci2hu8haylhe9ndb2jadca6jiwri5','NzA1N2EwMmQ5ZWYxMWRkZmU4ODEzMTUzNDRhY2QxOWY5MzU1MGExYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1YTczNWYzZGNhNTIxYjEzODQ5OTFmYjI1ZTY5NDcwMzZkNzZjMzYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-09-01 03:07:07');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion_calificacion`
--

DROP TABLE IF EXISTS `evaluacion_calificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluacion_calificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `puntaje_obtenido` double DEFAULT NULL,
  `calificacion` double DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `evaluacion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluacion_calificacion_674780a4` (`evaluacion_id`),
  CONSTRAINT `evaluacion_ca_evaluacion_id_3749ed51_fk_evaluacion_evaluacion_id` FOREIGN KEY (`evaluacion_id`) REFERENCES `evaluacion_evaluacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion_calificacion`
--

LOCK TABLES `evaluacion_calificacion` WRITE;
/*!40000 ALTER TABLE `evaluacion_calificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacion_calificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion_estudiantecalificacion`
--

DROP TABLE IF EXISTS `evaluacion_estudiantecalificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluacion_estudiantecalificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calificacion_id` int(11) NOT NULL,
  `estudiante_id` int(11) NOT NULL,
  `evaluacion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluacio_calificacion_id_29aa4741_fk_evaluacion_calificacion_id` (`calificacion_id`),
  KEY `evaluacion_estu_estudiante_id_f832187e_fk_usuarios_estudiante_id` (`estudiante_id`),
  KEY `evaluacion_id` (`evaluacion_id`),
  CONSTRAINT `evaluacion_estudiantecalificacion_ibfk_1` FOREIGN KEY (`evaluacion_id`) REFERENCES `evaluacion_evaluacion` (`id`),
  CONSTRAINT `evaluacion_estu_estudiante_id_f832187e_fk_usuarios_estudiante_id` FOREIGN KEY (`estudiante_id`) REFERENCES `usuarios_estudiante` (`id`),
  CONSTRAINT `evaluacio_calificacion_id_29aa4741_fk_evaluacion_calificacion_id` FOREIGN KEY (`calificacion_id`) REFERENCES `evaluacion_calificacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion_estudiantecalificacion`
--

LOCK TABLES `evaluacion_estudiantecalificacion` WRITE;
/*!40000 ALTER TABLE `evaluacion_estudiantecalificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacion_estudiantecalificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion_evaluacion`
--

DROP TABLE IF EXISTS `evaluacion_evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluacion_evaluacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_evaluacion` date DEFAULT NULL,
  `puntaje_total` int(11) DEFAULT NULL,
  `exigencia` int(11) DEFAULT NULL,
  `tipo_evaluacion` varchar(200) DEFAULT NULL,
  `tipo_evaluacion_otro` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `datos` longtext,
  `instrucciones` longtext,
  `creado_en` datetime NOT NULL,
  `ultima_modificacion` datetime NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `docente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluacion_evaluacion_curso_id_d50ee6c1_fk_contenidos_curso_id` (`curso_id`),
  KEY `evaluacion_evaluacion_docente_id_dbfc66a9_fk_auth_user_id` (`docente_id`),
  CONSTRAINT `evaluacion_evaluacion_curso_id_d50ee6c1_fk_contenidos_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `contenidos_curso` (`id`),
  CONSTRAINT `evaluacion_evaluacion_docente_id_dbfc66a9_fk_auth_user_id` FOREIGN KEY (`docente_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion_evaluacion`
--

LOCK TABLES `evaluacion_evaluacion` WRITE;
/*!40000 ALTER TABLE `evaluacion_evaluacion` DISABLE KEYS */;
INSERT INTO `evaluacion_evaluacion` VALUES (33,'2017-08-01',76,NULL,'Solemne','','SOLEMNE - PROGRAMACIÓN I','Daniel Mansilla Cañoles','No se permite el uso de smartphones, tablets u otro dispositivo tecnológico.\nUse lápiz pasta para responder las preguntas.\nEl uso de lapiz grafito no tendrá derecho a reclamos.','2017-08-01 05:12:49','2017-08-01 05:12:49',1,1,1),(34,NULL,NULL,NULL,NULL,'','','','','2017-08-01 15:09:09','2017-08-01 15:09:09',0,1,1),(35,'2017-08-01',2,NULL,'Solemne','','','Daniel Mansilla Cañoles','No se permite el uso de smartphones, tablets u otro dispositivo tecnológico.\r\nUse lápiz pasta para responder las preguntas.\r\nEl uso de lapiz grafito no tendrá derecho a reclamos.','2017-08-01 15:27:34','2017-08-01 15:27:52',1,1,1),(36,'2017-08-01',30,NULL,'Solemne','','','Daniel Mansilla Cañoles','No se permite el uso de smartphones, tablets u otro dispositivo tecnológico.\r\nUse lápiz pasta para responder las preguntas.\r\nEl uso de lapiz grafito no tendrá derecho a reclamos.','2017-08-01 15:58:22','2017-08-01 15:58:41',1,1,1),(37,'2017-08-01',14,NULL,'Solemne','','SOLEMNE - PROGRAMACIÓN I','Daniel Mansilla Cañoles','No se permite el uso de smartphones, tablets u otro dispositivo tecnológico.\nUse lápiz pasta para responder las preguntas.\nEl uso de lapiz grafito no tendrá derecho a reclamos.','2017-08-01 18:19:24','2017-08-01 18:19:25',1,1,1),(38,'2017-08-03',54,NULL,'Solemne','','SOLEMNE - PROGRAMACIÓN I','Daniel Mansilla Cañoles','No se permite el uso de smartphones, tablets u otro dispositivo tecnológico.\nUse lápiz pasta para responder las preguntas.\nEl uso de lapiz grafito no tendrá derecho a reclamos.','2017-08-02 04:20:41','2017-08-02 04:20:45',1,1,1),(39,'2017-08-02',40,NULL,'Solemne','','SOLEMNE - PROGRAMACIÓN I','Daniel Mansilla Cañoles','No se permite el uso de smartphones, tablets u otro dispositivo tecnológico.\nUse lápiz pasta para responder las preguntas.\nEl uso de lapiz grafito no tendrá derecho a reclamos.','2017-08-02 04:21:56','2017-08-02 04:21:56',1,1,1),(40,'2017-08-02',43,NULL,'Solemne','','SOLEMNE - PROGRAMACIÓN I','Daniel Mansilla Cañoles','No se permite el uso de smartphones, tablets u otro dispositivo tecnológico.\nUse lápiz pasta para responder las preguntas.\nEl uso de lapiz grafito no tendrá derecho a reclamos.','2017-08-02 04:22:36','2017-08-02 04:22:37',1,1,1),(41,'2017-08-02',0,NULL,'Solemne','','SOLEMNE - PROGRAMACIÓN I','Daniel Mansilla Cañoles','No se permite el uso de smartphones, tablets u otro dispositivo tecnológico.\nUse lápiz pasta para responder las preguntas.\nEl uso de lapiz grafito no tendrá derecho a reclamos.','2017-08-02 04:23:13','2017-08-02 04:23:13',1,1,1),(42,'2017-08-02',101,NULL,'Solemne','','SOLEMNE - PROGRAMACIÓN I','Daniel Mansilla Cañoles','No se permite el uso de smartphones, tablets u otro dispositivo tecnológico.\nUse lápiz pasta para responder las preguntas.\nEl uso de lapiz grafito no tendrá derecho a reclamos.','2017-08-02 04:24:22','2017-08-02 04:24:23',1,1,1),(43,'2017-08-03',89,NULL,'Solemne','','SOLEMNE - PROGRAMACIÓN I','Daniel Mansilla Cañoles','No se permite el uso de smartphones, tablets u otro dispositivo tecnológico.\nUse lápiz pasta para responder las preguntas.\nEl uso de lapiz grafito no tendrá derecho a reclamos.','2017-08-02 04:27:13','2017-08-02 04:27:23',1,1,1),(44,'2017-08-03',40,NULL,'Solemne','','Evaluación','Daniel Mansilla Cañoles','No se permite el uso de smartphones, tablets u otro dispositivo tecnológico.\r\nUse lápiz pasta para responder las preguntas.\r\nEl uso de lapiz grafito no tendrá derecho a reclamos.\r\nNo copiar','2017-08-02 04:30:41','2017-08-02 04:32:53',1,1,1),(45,NULL,NULL,NULL,NULL,'','','','','2017-08-03 03:31:49','2017-08-03 03:31:49',0,1,1),(46,'2017-08-06',42,NULL,'Solemne','','SOLEMNE - PROGRAMACIÓN I','Docente Docente ','No se permite el uso de smartphones, tablets u otro dispositivo tecnológico.\nUse lápiz pasta para responder las preguntas.\nEl uso de lapiz grafito no tendrá derecho a reclamos.','2017-08-06 15:21:05','2017-08-06 15:21:05',1,1,3),(47,'2017-08-06',71,NULL,'Solemne','','SOLEMNE - PROGRAMACIÓN I','Docente Docente ','No se permite el uso de smartphones, tablets u otro dispositivo tecnológico.\nUse lápiz pasta para responder las preguntas.\nEl uso de lapiz grafito no tendrá derecho a reclamos.','2017-08-06 15:22:02','2017-08-06 15:22:02',1,1,3),(48,'2017-08-06',30,NULL,'Solemne','','SOLEMNE I - PROGRAMACIÓN I','Daniel Mansilla','No se permite el uso de smartphones, tablets u otro dispositivo tecnológico.\r\nUse lápiz pasta para responder las preguntas.\r\nEl uso de lapiz grafito no tendrá derecho a reclamos.','2017-08-06 15:25:03','2017-08-06 15:25:58',1,1,3),(49,NULL,NULL,NULL,NULL,'','','','','2017-08-09 20:07:58','2017-08-09 20:07:58',0,1,1),(50,'2017-08-09',65,NULL,'Solemne','','SOLEMNE - PROGRAMACIÓN I','Daniel Mansilla Cañoles','No se permite el uso de smartphones, tablets u otro dispositivo tecnológico.\nUse lápiz pasta para responder las preguntas.\nEl uso de lapiz grafito no tendrá derecho a reclamos.','2017-08-09 20:08:32','2017-08-09 20:08:32',1,1,1);
/*!40000 ALTER TABLE `evaluacion_evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion_evaluacion_contenidos`
--

DROP TABLE IF EXISTS `evaluacion_evaluacion_contenidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluacion_evaluacion_contenidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluacion_id` int(11) NOT NULL,
  `unidad_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evaluacion_evaluacion_contenidos_evaluacion_id_aec66df9_uniq` (`evaluacion_id`,`unidad_id`),
  KEY `evaluacion_evaluacion_unidad_id_53a31628_fk_contenidos_unidad_id` (`unidad_id`),
  CONSTRAINT `evaluacion_evaluacion_unidad_id_53a31628_fk_contenidos_unidad_id` FOREIGN KEY (`unidad_id`) REFERENCES `contenidos_unidad` (`id`),
  CONSTRAINT `evaluacion_ev_evaluacion_id_198c3f18_fk_evaluacion_evaluacion_id` FOREIGN KEY (`evaluacion_id`) REFERENCES `evaluacion_evaluacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion_evaluacion_contenidos`
--

LOCK TABLES `evaluacion_evaluacion_contenidos` WRITE;
/*!40000 ALTER TABLE `evaluacion_evaluacion_contenidos` DISABLE KEYS */;
INSERT INTO `evaluacion_evaluacion_contenidos` VALUES (1,50,1);
/*!40000 ALTER TABLE `evaluacion_evaluacion_contenidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion_evaluacion_preguntas`
--

DROP TABLE IF EXISTS `evaluacion_evaluacion_preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluacion_evaluacion_preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluacion_id` int(11) NOT NULL,
  `pregunta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evaluacion_evaluacion_preguntas_evaluacion_id_0f8427eb_uniq` (`evaluacion_id`,`pregunta_id`),
  KEY `evaluacion_evaluac_pregunta_id_a109d604_fk_preguntas_pregunta_id` (`pregunta_id`),
  CONSTRAINT `evaluacion_evaluac_pregunta_id_a109d604_fk_preguntas_pregunta_id` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas_pregunta` (`id`),
  CONSTRAINT `evaluacion_ev_evaluacion_id_bbc17d9e_fk_evaluacion_evaluacion_id` FOREIGN KEY (`evaluacion_id`) REFERENCES `evaluacion_evaluacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion_evaluacion_preguntas`
--

LOCK TABLES `evaluacion_evaluacion_preguntas` WRITE;
/*!40000 ALTER TABLE `evaluacion_evaluacion_preguntas` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacion_evaluacion_preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion_promedio`
--

DROP TABLE IF EXISTS `evaluacion_promedio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluacion_promedio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promedio` double NOT NULL,
  `pje_promedio` double DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `evaluacion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluacion_promedio_curso_id_7b112e04_fk_contenidos_curso_id` (`curso_id`),
  KEY `evaluacion_pr_evaluacion_id_c4d14828_fk_evaluacion_evaluacion_id` (`evaluacion_id`),
  CONSTRAINT `evaluacion_promedio_curso_id_7b112e04_fk_contenidos_curso_id` FOREIGN KEY (`curso_id`) REFERENCES `contenidos_curso` (`id`),
  CONSTRAINT `evaluacion_pr_evaluacion_id_c4d14828_fk_evaluacion_evaluacion_id` FOREIGN KEY (`evaluacion_id`) REFERENCES `evaluacion_evaluacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion_promedio`
--

LOCK TABLES `evaluacion_promedio` WRITE;
/*!40000 ALTER TABLE `evaluacion_promedio` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacion_promedio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion_promedio_calificaciones`
--

DROP TABLE IF EXISTS `evaluacion_promedio_calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluacion_promedio_calificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promedio_id` int(11) NOT NULL,
  `calificacion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `evaluacion_promedio_calificaciones_promedio_id_00868f27_uniq` (`promedio_id`,`calificacion_id`),
  KEY `evaluacio_calificacion_id_1e1245f3_fk_evaluacion_calificacion_id` (`calificacion_id`),
  CONSTRAINT `evaluacion_promed_promedio_id_d6b09925_fk_evaluacion_promedio_id` FOREIGN KEY (`promedio_id`) REFERENCES `evaluacion_promedio` (`id`),
  CONSTRAINT `evaluacio_calificacion_id_1e1245f3_fk_evaluacion_calificacion_id` FOREIGN KEY (`calificacion_id`) REFERENCES `evaluacion_calificacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion_promedio_calificaciones`
--

LOCK TABLES `evaluacion_promedio_calificaciones` WRITE;
/*!40000 ALTER TABLE `evaluacion_promedio_calificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacion_promedio_calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion_puntajepregunta`
--

DROP TABLE IF EXISTS `evaluacion_puntajepregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluacion_puntajepregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `puntaje` double DEFAULT NULL,
  `evaluacion_id` int(11) DEFAULT NULL,
  `pregunta_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluacion_pu_evaluacion_id_f85b580a_fk_evaluacion_evaluacion_id` (`evaluacion_id`),
  KEY `evaluacion_puntaje_pregunta_id_0b4ab49f_fk_preguntas_pregunta_id` (`pregunta_id`),
  CONSTRAINT `evaluacion_puntaje_pregunta_id_0b4ab49f_fk_preguntas_pregunta_id` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas_pregunta` (`id`),
  CONSTRAINT `evaluacion_pu_evaluacion_id_f85b580a_fk_evaluacion_evaluacion_id` FOREIGN KEY (`evaluacion_id`) REFERENCES `evaluacion_evaluacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion_puntajepregunta`
--

LOCK TABLES `evaluacion_puntajepregunta` WRITE;
/*!40000 ALTER TABLE `evaluacion_puntajepregunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacion_puntajepregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas_pregunta`
--

DROP TABLE IF EXISTS `preguntas_pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntas_pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_pregunta` varchar(200) DEFAULT NULL,
  `pregunta` longtext NOT NULL,
  `dificultad` varchar(200) DEFAULT NULL,
  `imagen_pregunta` varchar(100) DEFAULT NULL,
  `observacion` varchar(120) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `corregida` tinyint(1) NOT NULL,
  `rechazada` tinyint(1) NOT NULL,
  `cant_usada` int(11) DEFAULT NULL,
  `asignatura_id` int(11) NOT NULL,
  `unidad_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `preguntas_pre_asignatura_id_b6102ce3_fk_contenidos_asignatura_id` (`asignatura_id`),
  KEY `preguntas_pregunta_unidad_id_b88de49e_fk_contenidos_unidad_id` (`unidad_id`),
  KEY `preguntas_pregunta_usuario_id_d62d41ae_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `preguntas_pregunta_unidad_id_b88de49e_fk_contenidos_unidad_id` FOREIGN KEY (`unidad_id`) REFERENCES `contenidos_unidad` (`id`),
  CONSTRAINT `preguntas_pregunta_usuario_id_d62d41ae_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `preguntas_pre_asignatura_id_b6102ce3_fk_contenidos_asignatura_id` FOREIGN KEY (`asignatura_id`) REFERENCES `contenidos_asignatura` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas_pregunta`
--

LOCK TABLES `preguntas_pregunta` WRITE;
/*!40000 ALTER TABLE `preguntas_pregunta` DISABLE KEYS */;
INSERT INTO `preguntas_pregunta` VALUES (29,'Pregunta de desarrollo','Defina que es un algoritmo.','Basica','','','2017-08-18 03:16:07','2017-08-18 03:16:07',0,1,0,0,0,1,1,1),(30,'Pregunta de desarrollo','Cuántos tipos de algoritmos existen?','Basica','','','2017-08-18 03:17:08','2017-08-18 03:17:08',0,1,0,0,0,1,1,1),(31,'Pregunta de desarrollo','Escriba un programa en pseudocódigo que lea dos números, calculando y escribiendo el valor de su suma, resta, producto y división.','Intermedia','','','2017-08-18 03:25:08','2017-08-18 03:25:08',0,1,0,0,0,1,1,1),(32,'Pregunta de desarrollo','Cual es la diferencia entre una lista y un tupla?','Basica','','','2017-08-18 03:28:12','2017-08-18 03:28:12',0,1,0,0,0,1,2,1),(33,'Pregunta de desarrollo','Escriba la función par(x) que retorne True si x es par, y False si es impar:','Intermedia','','','2017-08-18 03:34:37','2017-08-18 03:34:37',0,1,0,0,0,1,2,1),(34,'Pregunta de desarrollo','Escriba una función maximo_par(d) que entregue el valor máximo de la suma de una llave y un valor del diccionario d','Avanzada','','','2017-08-18 03:37:27','2017-08-18 03:37:27',0,1,0,0,0,1,2,1),(35,'Pregunta de desarrollo','Dado un mensaje, se debe calcular su costo para enviarlo por telégrafo. Para esto se sabe que cada letra cuesta $10, los caracteres especiales que no sean letras cuestan $30 y los dígitos tienen un valor de $20 cada uno. Los espacios no tienen valor. Su mensaje debe ser un string, y las letras del castellano (ñ, á, é, í, ó, ú) se consideran caracteres especiales.','Avanzada','','','2017-08-18 03:39:17','2017-08-18 03:39:17',0,1,0,0,0,1,3,1),(36,'Pregunta de desarrollo','Que es NumPy?','Basica','','','2017-08-18 03:40:51','2017-08-18 03:40:51',0,1,0,0,0,1,3,1),(37,'Pregunta de desarrollo','Cree una matriz de 5x5 con valores de fila en el rango de 0 a 4','Intermedia','','','2017-08-18 03:47:32','2017-08-18 03:47:32',0,1,0,0,0,1,3,1),(38,'Pregunta de desarrollo','Escriba un programa que intercambie dos filas de un arreglo','Avanzada','','','2017-08-18 03:49:08','2017-08-18 03:49:08',0,1,0,0,0,1,3,1);
/*!40000 ALTER TABLE `preguntas_pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas_pregunta_contenido`
--

DROP TABLE IF EXISTS `preguntas_pregunta_contenido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntas_pregunta_contenido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta_id` int(11) NOT NULL,
  `contenido_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `preguntas_pregunta_contenido_pregunta_id_d117d398_uniq` (`pregunta_id`,`contenido_id`),
  KEY `preguntas_pregu_contenido_id_9fbafdaa_fk_contenidos_contenido_id` (`contenido_id`),
  CONSTRAINT `preguntas_pregunta_pregunta_id_fd581b18_fk_preguntas_pregunta_id` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas_pregunta` (`id`),
  CONSTRAINT `preguntas_pregu_contenido_id_9fbafdaa_fk_contenidos_contenido_id` FOREIGN KEY (`contenido_id`) REFERENCES `contenidos_contenido` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas_pregunta_contenido`
--

LOCK TABLES `preguntas_pregunta_contenido` WRITE;
/*!40000 ALTER TABLE `preguntas_pregunta_contenido` DISABLE KEYS */;
INSERT INTO `preguntas_pregunta_contenido` VALUES (40,29,6),(41,30,6),(42,31,7),(43,32,12),(44,33,11),(45,34,13),(46,35,17),(47,36,15),(48,37,15),(49,38,15);
/*!40000 ALTER TABLE `preguntas_pregunta_contenido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas_respuesta`
--

DROP TABLE IF EXISTS `preguntas_respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntas_respuesta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opcion` varchar(1) DEFAULT NULL,
  `respuesta` longtext NOT NULL,
  `imagen_respuesta` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status_respuesta` tinyint(1) NOT NULL,
  `pregunta_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `preguntas_respuest_pregunta_id_c8204340_fk_preguntas_pregunta_id` (`pregunta_id`),
  CONSTRAINT `preguntas_respuest_pregunta_id_c8204340_fk_preguntas_pregunta_id` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas_pregunta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas_respuesta`
--

LOCK TABLES `preguntas_respuesta` WRITE;
/*!40000 ALTER TABLE `preguntas_respuesta` DISABLE KEYS */;
INSERT INTO `preguntas_respuesta` VALUES (50,'','El algoritmo es un conjunto de pasos, instrucciones o acciones que se deben seguir para resolver un problema. Existen una gran cantidad de algoritmos, hay que escoger el más efectivo.','','2017-08-18 03:16:07','2017-08-18 03:16:07',1,29),(51,'','Hay dos tipos de algoritmos que son los cualitativos y cuantitativos, cualitativos son todos aquellos pasos o instrucciones descritos por medio de palabras que sirven para llegar a la obtención de una respuesta o solución de un problema, y cuantitativos son todos aquellos pasos o instrucciones que involucran cálculos numéricos para llegar a un resultado satisfactorio.','','2017-08-18 03:17:08','2017-08-18 03:17:08',1,30),(52,'','Var numero1, numero2, resultado: numerica\r\nInicio\r\n   Escribir \"Introduce el primer numero\"\r\n   Leer numero1\r\n   Escribir \"Introduce el segundo numero\"\r\n   Leer numero2\r\n   resultado<-numero1+numero2\r\n   Escribir resultado\r\n   resultado<-numero1-numero2\r\n   Escribir resultado\r\n   resultado<-numero1*numero2\r\n   Escribir resultado\r\n   resultado<-numero1/numero2\r\n   Escribir resultado\r\nFin','','2017-08-18 03:25:08','2017-08-18 03:25:08',1,31),(53,'','La diferencia es que las listas presentan una serie de funciones adicionales que permiten un amplio manejo de los valores que contienen. Basándonos en esta definición, puede decirse que las listas son dinámicas, mientras que las tuplas son estáticas.','','2017-08-18 03:28:12','2017-08-18 03:28:12',1,32),(54,'','def par(x):\r\n    if x % 2 == 0:\r\n        return True\r\n    else:\r\n        return False','','2017-08-18 03:34:37','2017-08-18 03:34:37',1,33),(55,'','def maximo_par(d):\r\n  mayor = -float(\'inf\')\r\n   for clave,valor in d.items():\r\n     if clave + valor &gt; mayor:\r\n       mayor = clave + valor\r\nreturn mayor','','2017-08-18 03:37:27','2017-08-18 03:37:27',1,34),(56,'','mensaje = raw_input(\"Mensaje: \")\r\nmensaje = mensaje.lower()\r\ncosto = 0\r\n \r\nfor i in mensaje:\r\n    if i != \' \':\r\n        if i in \'qwertyuiopasdfghjklzxcvbnm\':\r\n            costo += 10\r\n        elif i in \'1234567890\':\r\n            costo += 20\r\n        else:\r\n            costo += 30\r\nprint \"Su mensaje cuesta $\" + str(costo)','','2017-08-18 03:39:17','2017-08-18 03:39:17',1,35),(57,'','NumPy es una extensión de Python, que le agrega mayor soporte para vectores y matrices, constituyendo una biblioteca de funciones matemáticas de alto nivel para operar con esos vectores o matrices.','','2017-08-18 03:40:51','2017-08-18 03:40:51',1,36),(58,'','Z = np.zeros((5,5))\r\nZ += np.arange(5)\r\nprint(Z)','','2017-08-18 03:47:32','2017-08-18 03:47:32',1,37),(59,'','A = np.arange(25).reshape(5,5)\r\nA[[0,1]] = A[[1,0]]\r\nprint(A)','','2017-08-18 03:49:08','2017-08-18 03:49:08',1,38);
/*!40000 ALTER TABLE `preguntas_respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_estudiante`
--

DROP TABLE IF EXISTS `usuarios_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_estudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rut` varchar(12) NOT NULL,
  `nombre1` varchar(200) DEFAULT NULL,
  `apellido1` varchar(200) DEFAULT NULL,
  `apellido2` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nombre2` varchar(200) DEFAULT NULL,
  `nombre3` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_estudiante`
--

LOCK TABLES `usuarios_estudiante` WRITE;
/*!40000 ALTER TABLE `usuarios_estudiante` DISABLE KEYS */;
INSERT INTO `usuarios_estudiante` VALUES (1,'18887510-6','Daniel','Mansilla','Cañoles','d.mansillacaoles@uandresbello.edu','Alejandro',''),(2,'19063520-1','Luis','Araneda','Garrido','l.aranedagarrido@uandresbello.edu','',''),(3,'15543977-7','Marianela','Contreras','Leon','m.contrerasleon@uandresbello.edu','',''),(4,'16801499-6','Christopher','Elgueta','Mendoza','ch.elgueta@uandresbello.edu','',''),(5,'18730770-8','Daniel','Hidalgo','Gamonal','d.hidalgogamonal@uandresbello.edu','',''),(6,'18835858-6','Ignacio','León','Quinteros','i.lenquinteros@uandresbello.edu','',''),(7,'17065525-7','Cristian','Lucero','Albornoz','c.luceroalbornoz@uandresbello.edu','',''),(8,'18022940-K','Anibal','Mendez','Jimenez','a.mendezjimenez@uandresbello.edu','Esteban',''),(9,'16710759-1','Manuel','Olmos','Soto','m.olmossoto@uandresbello.edu','',''),(10,'18465931-K','Christopher','Rios','Rodriguez','c.riosrodriguez@uandresbello.edu','',''),(11,'17404921-1','Daniel','Roa','Vidal','d.roavidal@uandresbello.edu','Arturo',''),(12,'18955953-4','Mauricio','Ruiz','Torres','m.ruiztorres1@uandresbello.edu','',''),(13,'19081153-0','Catalina','Salazar','Soto','c.salazarsoto1@uandresbello.edu','',''),(14,'18612229-1','Javier','Santibañez','Muñoz','j.santibaezmuoz@uandresbello.edu','Esteban',''),(15,'14210543-8','Daniel','Segura','Nalvarte','d.seguranalvarte@uandresbello.edu','',''),(16,'19114687-5','Franco','Soto','Sanhueza','f.sotosanhueza@uandresbello.edu','',''),(17,'19289131-0','Rodrigo','Torres','Escobedo','r.torresescobedo@uandresbello.edu','',''),(18,'18049150-3','Cesar','Torres','Gonzalez','c.torresgonzalez@uandresbello.edu','',''),(19,'19164187-6','Nehemias','Valdebenito','Iturra','n.valdebenitoiturra@uandresbello.edu','',''),(20,'14746315-4','José','Valdivia','Calcina','j.valdiviacalcina@uandresbello.edu','Miguel',''),(21,'16365587-K','Claudio','Vasquez','Campos','c.vasquezcampos@uandresbello.edu','Ignacio',''),(22,'17402209-7','Ignacio','Viedma','Escalona','i.viedmaescalona@uandresbello.edu','','');
/*!40000 ALTER TABLE `usuarios_estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_perfilusuario`
--

DROP TABLE IF EXISTS `usuarios_perfilusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_perfilusuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rut` varchar(12) NOT NULL,
  `nombres` varchar(200) DEFAULT NULL,
  `apellido1` varchar(200) DEFAULT NULL,
  `apellido2` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `numero_telefono` varchar(12) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `tipo_usuario` varchar(200) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `usuarios_perfilusuario_user_id_f03197c5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_perfilusuario`
--

LOCK TABLES `usuarios_perfilusuario` WRITE;
/*!40000 ALTER TABLE `usuarios_perfilusuario` DISABLE KEYS */;
INSERT INTO `usuarios_perfilusuario` VALUES (1,'18887510-6','Daniel','Mansilla','Cañoles','daanichannel@gmail.com','','','2017-07-28 20:23:01','2017-07-31 18:17:45',1,'Administrador',1),(2,'16710759-1','Manuel','Olmos','Soto','manuelalejandro.soto1@gmail.com','','','2017-07-28 21:57:37','2017-07-28 21:57:37',1,'Administrador',2),(3,'11111','Docente','Docente','','docente@docente.cl','','','2017-07-31 23:33:08','2017-08-06 14:14:52',1,'Docente',3),(7,'15021085-2','Eduardo','Quiroga','Aguilera','correo@unab.cl','','','2017-08-01 17:52:12','2017-08-01 17:52:12',1,'Comite academico',7),(8,'111111-1','Comité','Evaluador','','ejemplo@ejemplo.cl','','','2017-08-06 14:13:25','2017-08-06 14:14:47',1,'Comite academico',8);
/*!40000 ALTER TABLE `usuarios_perfilusuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-18  3:51:47
