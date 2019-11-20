-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `ID` int(11) NOT NULL,
  `Contacto` int(11) DEFAULT NULL,
  `Correo` int(11) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Cliente_Correo1_idx` (`Correo`),
  KEY `fk_Cliente_Contactos1_idx` (`Contacto`),
  CONSTRAINT `fk_Cliente_Contactos1` FOREIGN KEY (`Contacto`) REFERENCES `contactos` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Correo1` FOREIGN KEY (`Correo`) REFERENCES `correo` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,2,1,'calle 85 # 55-89'),(2,1,5,'carrera 57 # 48s 89'),(3,3,2,'calle 1 # 77j 27'),(4,4,3,'calle 85 # 105 66'),(5,5,4,'diagonal 45 #10 45');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacto` (
  `ID` int(11) NOT NULL,
  `Contacto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto`
--

LOCK TABLES `contacto` WRITE;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
INSERT INTO `contacto` VALUES (1,'3125789698'),(2,'3126664587'),(3,'3154568987'),(4,'3204225566'),(5,'3558969897');
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactos`
--

DROP TABLE IF EXISTS `contactos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contactos` (
  `ID` int(11) NOT NULL,
  `Numero` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactos`
--

LOCK TABLES `contactos` WRITE;
/*!40000 ALTER TABLE `contactos` DISABLE KEYS */;
INSERT INTO `contactos` VALUES (1,'3125789698'),(2,'3126664587'),(3,'3154568987'),(4,'3204225566'),(5,'3558969897');
/*!40000 ALTER TABLE `contactos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correo`
--

DROP TABLE IF EXISTS `correo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correo` (
  `ID` int(11) NOT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correo`
--

LOCK TABLES `correo` WRITE;
/*!40000 ALTER TABLE `correo` DISABLE KEYS */;
INSERT INTO `correo` VALUES (1,'fdc45@hotmail.com'),(2,'mac85@gmail.com'),(3,'daca78@hotmail.com'),(4,'isa7@outlook.com'),(5,'carl89@gmail.com');
/*!40000 ALTER TABLE `correo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `ID` varchar(45) NOT NULL,
  `Producto` varchar(45) NOT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Total` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`,`Producto`),
  KEY `fk_Factura_Cliente1_idx` (`IdCliente`),
  CONSTRAINT `fk_Factura_Cliente1` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES ('1','2',3,'2019-05-02','06:10:00','150000'),('2','5',1,'2019-05-10','03:00:00','55000'),('3','1',2,'2019-06-23','02:55:00','15000'),('4','3',2,'2019-06-23','02:56:00','25000'),('5','4',2,'2019-06-23','02:57:00','30000');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kardex`
--

DROP TABLE IF EXISTS `kardex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kardex` (
  `Cantidad` int(11) NOT NULL,
  `IdProducto` varchar(45) NOT NULL,
  `ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cantidad`,`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kardex`
--

LOCK TABLES `kardex` WRITE;
/*!40000 ALTER TABLE `kardex` DISABLE KEYS */;
INSERT INTO `kardex` VALUES (165,'4',4),(250,'3',3),(320,'5',5),(500,'1',1),(600,'2',2);
/*!40000 ALTER TABLE `kardex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `ID` int(11) NOT NULL,
  `Tipodocumento` int(11) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `Numerodocumento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_PERSONA_Tipodocumento_idx` (`Tipodocumento`),
  CONSTRAINT `fk_PERSONA_Tipodocumento` FOREIGN KEY (`Tipodocumento`) REFERENCES `tipodocumento` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,1,'Alejandro','Cortes','204589632'),(2,3,'Martha','Ramirez','1035645782'),(3,1,'Rafael','Colmenares','456852123'),(4,1,'Esteban','Perez','1020785456'),(5,2,'Alejandra','Ayala','9803654741');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `ID` int(11) NOT NULL,
  `IDprovedor` int(11) DEFAULT NULL,
  `Tipo` varchar(45) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Color` varchar(45) DEFAULT NULL,
  `Precio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Producto_Provedor1_idx` (`IDprovedor`),
  CONSTRAINT `fk_Producto_Provedor1` FOREIGN KEY (`IDprovedor`) REFERENCES `provedor` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,2,'2','Pintura','azul','25000'),(2,1,'2','Laca','amarilla','18000'),(3,5,'1','Esmalte','transparente','6000'),(4,3,'4','Sellador','Blanco','56000'),(5,4,'5','Estuco plastico','blanco','15000');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provedor`
--

DROP TABLE IF EXISTS `provedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provedor` (
  `ID` int(11) NOT NULL,
  `Persona` int(11) NOT NULL,
  `Contacto` int(11) DEFAULT NULL,
  `Producto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`,`Persona`),
  KEY `fk_Provedor_Contactos1_idx` (`Contacto`),
  CONSTRAINT `fk_Provedor_Contactos1` FOREIGN KEY (`Contacto`) REFERENCES `contactos` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provedor`
--

LOCK TABLES `provedor` WRITE;
/*!40000 ALTER TABLE `provedor` DISABLE KEYS */;
INSERT INTO `provedor` VALUES (1,1,2,'pintura'),(2,3,1,'aerosol'),(3,5,3,'estuco'),(4,2,4,'laca'),(5,4,5,'esmalte');
/*!40000 ALTER TABLE `provedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `ID` int(11) NOT NULL,
  `Tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'aerosol'),(2,'pintura'),(3,'laca'),(4,'esmalte'),(5,'sellador');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodocumento`
--

DROP TABLE IF EXISTS `tipodocumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodocumento` (
  `ID` int(11) NOT NULL,
  `Tipodocumento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodocumento`
--

LOCK TABLES `tipodocumento` WRITE;
/*!40000 ALTER TABLE `tipodocumento` DISABLE KEYS */;
INSERT INTO `tipodocumento` VALUES (1,'CC'),(2,'TI'),(3,'Pasaporte'),(4,'DNI'),(5,'NIT');
/*!40000 ALTER TABLE `tipodocumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL,
  `User` varchar(45) DEFAULT NULL,
  `Contraseña` varchar(45) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `Persona_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`,`Persona_ID`),
  KEY `fk_Usuario_Persona1_idx` (`Persona_ID`),
  CONSTRAINT `fk_Usuario_Persona1` FOREIGN KEY (`Persona_ID`) REFERENCES `persona` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Carlos','123456','1',2),(2,'Mariana','gato2','5',1),(3,'David','martillo45','3',3),(4,'Nicolas','vaper788','4',4),(5,'Camilo','lolcito5','2',5);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-15 21:05:58
