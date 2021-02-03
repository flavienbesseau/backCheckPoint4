/* Replace with your SQL commands */

CREATE DATABASE  IF NOT EXISTS `Chagall` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Chagall`;
-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: Chagall
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `class_has_teacher`
--

DROP TABLE IF EXISTS `class_has_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_has_teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_class_has_teacher_teacher1_idx` (`teacher_id`),
  KEY `fk_class_has_teacher_class1_idx` (`class_id`),
  CONSTRAINT `fk_class_has_teacher_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  CONSTRAINT `fk_class_has_teacher_teacher1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pupil`
--

DROP TABLE IF EXISTS `pupil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pupil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `family_name` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `birth_date` date NOT NULL,
  `parents_phone` int NOT NULL,
  `fk_class_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pupil_1_idx` (`fk_class_id`),
  CONSTRAINT `fk_pupil_1` FOREIGN KEY (`fk_class_id`) REFERENCES `class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pupil_has_teacher`
--

DROP TABLE IF EXISTS `pupil_has_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pupil_has_teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pupil_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pupil_has_teacher_teacher1_idx` (`teacher_id`),
  KEY `fk_pupil_has_teacher_pupil_idx` (`pupil_id`),
  CONSTRAINT `fk_pupil_has_teacher_pupil` FOREIGN KEY (`pupil_id`) REFERENCES `pupil` (`id`),
  CONSTRAINT `fk_pupil_has_teacher_teacher1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `family_name` varchar(100) NOT NULL DEFAULT 'Inconnu',
  `first_name` varchar(100) NOT NULL DEFAULT 'Inconnu',
  `discipline` varchar(100) NOT NULL DEFAULT 'Inconnu',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'Chagall'
--

--
-- Dumping routines for database 'Chagall'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-03 20:25:45


CREATE DATABASE  IF NOT EXISTS `Chagall` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Chagall`;
-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: Chagall
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` (`id`, `name`) VALUES (1,'6ème'),(2,'5ème'),(3,'4ème'),(4,'3ème');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `class_has_teacher`
--

LOCK TABLES `class_has_teacher` WRITE;
/*!40000 ALTER TABLE `class_has_teacher` DISABLE KEYS */;
INSERT INTO `class_has_teacher` (`id`, `class_id`, `teacher_id`) VALUES (49,1,53),(50,1,54),(51,1,55),(52,1,59),(53,1,61),(54,1,63),(55,2,53),(56,2,54),(57,2,55),(58,2,59),(59,2,61),(60,2,63),(61,3,56),(62,3,57),(63,3,58),(64,3,60),(65,3,64),(66,3,65),(67,4,56),(68,4,58),(69,4,60),(70,4,64),(71,4,65);
/*!40000 ALTER TABLE `class_has_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` (`id`, `pseudo`, `password`) VALUES (1,'flavienb','password1'),(2,'pierrek','password2'),(3,'essai','hello'),(4,'esddsai','heddllo'),(5,'aaa','aaa'),(6,'essai2','dskhdhsjkdsh'),(7,'essai23','dskhdhsjkdsh'),(8,'dsdsds','fsfsfs'),(9,'dsddsdslkj','kljfdlkfdjlkf'),(10,'azerty','azerty'),(11,'azerty','azerty'),(12,'ss',''),(13,'dddd','sfsfssf'),(14,'sqdsds','sfss'),(15,'dsdsds','ddsds'),(16,'dsds','dsdsd'),(17,'dsdssd','gdgdgdgd');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pupil`
--

LOCK TABLES `pupil` WRITE;
/*!40000 ALTER TABLE `pupil` DISABLE KEYS */;
INSERT INTO `pupil` (`id`, `family_name`, `first_name`, `birth_date`, `parents_phone`, `fk_class_id`) VALUES (50,'Etau','Axel','2010-12-01',835656565,1),(51,'Castex','Jean','2009-10-11',658985478,2),(52,'Macron','Jean','2010-02-02',148746464,3),(53,'Macron','Brigitte','2008-04-24',245875695,1),(54,'Dati','Rachida','2008-03-18',258789924,2),(55,'Brode','Leo','2009-12-12',557899664,3),(56,'Salomé','Théo','2007-04-21',254585860,4),(57,'Perrot','Patrick','2007-08-13',247852398,4);
/*!40000 ALTER TABLE `pupil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pupil_has_teacher`
--

LOCK TABLES `pupil_has_teacher` WRITE;
/*!40000 ALTER TABLE `pupil_has_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `pupil_has_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` (`id`, `family_name`, `first_name`, `discipline`) VALUES (53,'Marchand','Tom','Maths'),(54,'Olive','Pierre','Français'),(55,'Brochard','Xavier','Anglais'),(56,'Pitre','Marcel','Maths'),(57,'Nolin','Jean-Paul','Français'),(58,'Bégué','Marion','Anglais'),(59,'Esperanza','Maria','Espagnol'),(60,'Rufin','François','Espagnol'),(61,'Skopj','Alexandre','SVT'),(62,'Pernaud','Jean-Pierre','Maths'),(63,'Perrier','Hayo','Physique'),(64,'Voison','Pauline','Physique'),(65,'Pons','Cédric','SVT');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-03 20:16:50