CREATE DATABASE  IF NOT EXISTS `syllabusdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `syllabusdb`;
-- MariaDB dump 10.17  Distrib 10.4.7-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: syllabusdb
-- ------------------------------------------------------
-- Server version	10.4.7-MariaDB-1:10.4.7+maria~bionic-log

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
-- Table structure for table `capitulo_academico`
--

DROP TABLE IF EXISTS `capitulo_academico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capitulo_academico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capitulo_academico`
--

LOCK TABLES `capitulo_academico` WRITE;
/*!40000 ALTER TABLE `capitulo_academico` DISABLE KEYS */;
/*!40000 ALTER TABLE `capitulo_academico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docente` (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_nombre` varchar(50) NOT NULL,
  `doc_apellido` varchar(50) NOT NULL,
  `doc_email` varchar(100) DEFAULT NULL,
  `doc_documento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (1,'Alejandro Paolo','Daza Corredor','apdazac@udistrital.edu.co','79777053');
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `espacio_academico`
--

DROP TABLE IF EXISTS `espacio_academico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `espacio_academico` (
  `esa_id` int(11) NOT NULL AUTO_INCREMENT,
  `esa_nombre` varchar(150) DEFAULT NULL,
  `esa_codigo` varchar(10) DEFAULT NULL,
  `prc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`esa_id`),
  KEY `fk_proyecto_curricular` (`prc_id`),
  CONSTRAINT `fk_proyecto_curricular` FOREIGN KEY (`prc_id`) REFERENCES `proyecto_curricular` (`prc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `espacio_academico`
--

LOCK TABLES `espacio_academico` WRITE;
/*!40000 ALTER TABLE `espacio_academico` DISABLE KEYS */;
INSERT INTO `espacio_academico` VALUES (1,'Modelos de programación 1','416',1),(2,'Modelos de programación 2','422',1);
/*!40000 ALTER TABLE `espacio_academico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `espacio_academico_tipo`
--

DROP TABLE IF EXISTS `espacio_academico_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `espacio_academico_tipo` (
  `eat_id` int(11) NOT NULL AUTO_INCREMENT,
  `esa_id` int(11) DEFAULT NULL,
  `tea_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`eat_id`),
  KEY `fk_espacio_academico` (`esa_id`),
  KEY `fk_tipo_espacio_academico` (`tea_id`),
  CONSTRAINT `fk_espacio_academico` FOREIGN KEY (`esa_id`) REFERENCES `espacio_academico` (`esa_id`),
  CONSTRAINT `fk_tipo_espacio_academico` FOREIGN KEY (`tea_id`) REFERENCES `tipo_espacio_academico` (`tea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `espacio_academico_tipo`
--

LOCK TABLES `espacio_academico_tipo` WRITE;
/*!40000 ALTER TABLE `espacio_academico_tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `espacio_academico_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto_curricular`
--

DROP TABLE IF EXISTS `proyecto_curricular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto_curricular` (
  `prc_id` int(11) NOT NULL AUTO_INCREMENT,
  `prc_nombre` varchar(50) NOT NULL,
  `prc_codigo` varchar(10) NOT NULL,
  PRIMARY KEY (`prc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto_curricular`
--

LOCK TABLES `proyecto_curricular` WRITE;
/*!40000 ALTER TABLE `proyecto_curricular` DISABLE KEYS */;
INSERT INTO `proyecto_curricular` VALUES (1,'Ingeniería de Sistemas','0091'),(2,'Ingeniería Electrónica','0092'),(3,'Ingeniería Industrial','0093');
/*!40000 ALTER TABLE `proyecto_curricular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_espacio_academico`
--

DROP TABLE IF EXISTS `tipo_espacio_academico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_espacio_academico` (
  `tea_id` int(11) NOT NULL AUTO_INCREMENT,
  `tea_nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`tea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_espacio_academico`
--

LOCK TABLES `tipo_espacio_academico` WRITE;
/*!40000 ALTER TABLE `tipo_espacio_academico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_espacio_academico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_academica`
--

DROP TABLE IF EXISTS `unidad_academica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad_academica` (
  `una_id` int(11) NOT NULL AUTO_INCREMENT,
  `una_nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`una_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_academica`
--

LOCK TABLES `unidad_academica` WRITE;
/*!40000 ALTER TABLE `unidad_academica` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidad_academica` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-09 21:30:35
