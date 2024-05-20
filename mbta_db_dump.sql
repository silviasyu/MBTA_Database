CREATE DATABASE  IF NOT EXISTS `mbtadb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mbtadb`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: mbtadb
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(34) NOT NULL,
  `first_name` varchar(34) NOT NULL,
  `last_name` varchar(34) NOT NULL,
  `phone_num` varchar(11) NOT NULL,
  `email` varchar(34) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=245679 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'boston1','Nano','Liklikadce','8572061958','liklikadzenano@gmail.com'),(2,'mbta2','Silvia','Yu','23456789123','syu@gmail.com'),(3,'trains3','Mbta','Trains','34567891234','mbta@gmail.com'),(4,'cs5200','comp','sci','6170000000','cs@gmail.com'),(5,'abc','data','base','1232343456','data@base.com');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arrives`
--

DROP TABLE IF EXISTS `arrives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arrives` (
  `station_id` int NOT NULL,
  `train_id` int NOT NULL,
  `schedule_id` int NOT NULL,
  PRIMARY KEY (`station_id`,`train_id`,`schedule_id`),
  KEY `train_id` (`train_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `arrives_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `station` (`station_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `arrives_ibfk_2` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `arrives_ibfk_3` FOREIGN KEY (`schedule_id`) REFERENCES `scheduled_time` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrives`
--

LOCK TABLES `arrives` WRITE;
/*!40000 ALTER TABLE `arrives` DISABLE KEYS */;
INSERT INTO `arrives` VALUES (1,100,1),(1,100,5),(2,100,3),(2,100,7),(3,100,5),(3,100,9),(4,100,6),(4,100,11),(5,100,8),(5,100,12),(6,100,10),(6,100,14),(7,100,12),(7,100,16),(8,100,13),(8,100,18),(9,100,14),(9,100,20),(10,100,16),(10,100,22),(11,100,18),(11,100,24),(12,100,20),(12,100,26),(13,100,22),(13,100,28),(14,100,24),(15,100,26),(16,100,28),(17,100,30),(18,100,32),(19,100,33),(20,100,34),(21,100,35),(22,100,36),(23,100,37),(24,100,38),(25,100,32),(26,100,33),(27,100,35),(28,100,37),(29,100,40),(9,200,42),(30,200,33),(31,200,34),(32,200,35),(33,200,36),(34,200,37),(35,200,38),(36,200,39),(37,200,40),(38,200,41),(40,200,43),(41,200,44),(42,200,45),(43,200,46),(44,200,47),(45,200,48),(46,200,49),(47,200,50),(48,200,51),(49,200,52),(38,300,29),(49,300,20),(50,300,21),(51,300,22),(52,300,23),(53,300,24),(54,300,25),(55,300,26),(56,300,27),(57,300,28),(58,300,30),(59,300,31),(8,400,2),(58,400,1),(60,400,3),(61,400,4),(62,400,5),(63,400,6),(64,400,7),(65,400,8),(66,400,9),(67,400,10),(68,400,11),(69,400,12),(70,400,13),(71,400,14),(72,400,15),(73,400,16),(74,400,17),(75,400,18),(76,400,19),(77,400,20),(78,400,21),(79,400,22),(80,400,23),(8,500,25),(58,500,24),(60,500,26),(61,500,27),(62,500,28),(63,500,29),(64,500,30),(81,500,31),(82,500,32),(83,500,33),(84,500,34),(85,500,35),(86,500,36),(87,500,37),(88,500,38),(89,500,39),(90,500,40),(91,500,41),(92,500,42),(93,500,43),(8,600,50),(36,600,47),(37,600,48),(58,600,49),(60,600,51),(61,600,52),(62,600,53),(63,600,54),(64,600,55),(94,600,44),(95,600,45),(96,600,46),(97,600,56),(98,600,57),(99,600,58),(100,600,59),(101,600,60),(102,600,61),(103,600,62),(104,600,63),(105,600,64),(106,600,65),(107,600,66),(108,600,67),(109,600,68),(8,700,70),(36,700,67),(37,700,68),(58,700,69),(60,700,71),(61,700,72),(62,700,73),(95,700,65),(96,700,66),(110,700,60),(111,700,61),(112,700,62),(113,700,63),(114,700,64),(115,700,74),(116,700,75),(117,700,76),(118,700,77),(119,700,78),(120,700,79),(121,700,80),(122,700,81),(123,700,82),(124,700,83),(125,700,84);
/*!40000 ALTER TABLE `arrives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line`
--

DROP TABLE IF EXISTS `line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `line` (
  `line_name` varchar(64) NOT NULL,
  PRIMARY KEY (`line_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line`
--

LOCK TABLES `line` WRITE;
/*!40000 ALTER TABLE `line` DISABLE KEYS */;
INSERT INTO `line` VALUES ('Blue'),('Green B'),('Green C'),('Green D'),('Green E'),('Orange'),('Red');
/*!40000 ALTER TABLE `line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_line_link`
--

DROP TABLE IF EXISTS `route_line_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route_line_link` (
  `route_id` int NOT NULL,
  `line_name` varchar(64) NOT NULL,
  PRIMARY KEY (`route_id`,`line_name`),
  KEY `line_name` (`line_name`),
  CONSTRAINT `route_line_link_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route_segment` (`route_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `route_line_link_ibfk_2` FOREIGN KEY (`line_name`) REFERENCES `line` (`line_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_line_link`
--

LOCK TABLES `route_line_link` WRITE;
/*!40000 ALTER TABLE `route_line_link` DISABLE KEYS */;
INSERT INTO `route_line_link` VALUES (1,'Blue'),(2,'Blue'),(3,'Blue'),(4,'Blue'),(5,'Blue'),(6,'Blue'),(7,'Blue'),(8,'Blue'),(9,'Blue'),(10,'Blue'),(11,'Blue'),(69,'Green B'),(70,'Green B'),(71,'Green B'),(72,'Green B'),(85,'Green B'),(112,'Green B'),(113,'Green B'),(114,'Green B'),(115,'Green B'),(116,'Green B'),(117,'Green B'),(118,'Green B'),(119,'Green B'),(120,'Green B'),(121,'Green B'),(122,'Green B'),(123,'Green B'),(124,'Green B'),(125,'Green B'),(126,'Green B'),(127,'Green B'),(69,'Green C'),(70,'Green C'),(71,'Green C'),(72,'Green C'),(85,'Green C'),(99,'Green C'),(100,'Green C'),(101,'Green C'),(102,'Green C'),(103,'Green C'),(104,'Green C'),(105,'Green C'),(106,'Green C'),(107,'Green C'),(108,'Green C'),(109,'Green C'),(110,'Green C'),(111,'Green C'),(64,'Green D'),(65,'Green D'),(66,'Green D'),(67,'Green D'),(68,'Green D'),(69,'Green D'),(70,'Green D'),(71,'Green D'),(72,'Green D'),(84,'Green D'),(85,'Green D'),(86,'Green D'),(87,'Green D'),(88,'Green D'),(89,'Green D'),(90,'Green D'),(91,'Green D'),(92,'Green D'),(93,'Green D'),(94,'Green D'),(95,'Green D'),(96,'Green D'),(97,'Green D'),(98,'Green D'),(59,'Green E'),(60,'Green E'),(61,'Green E'),(62,'Green E'),(63,'Green E'),(65,'Green E'),(66,'Green E'),(67,'Green E'),(68,'Green E'),(69,'Green E'),(70,'Green E'),(71,'Green E'),(72,'Green E'),(73,'Green E'),(74,'Green E'),(75,'Green E'),(76,'Green E'),(77,'Green E'),(78,'Green E'),(79,'Green E'),(80,'Green E'),(81,'Green E'),(82,'Green E'),(83,'Green E'),(12,'Orange'),(13,'Orange'),(14,'Orange'),(15,'Orange'),(16,'Orange'),(17,'Orange'),(18,'Orange'),(19,'Orange'),(20,'Orange'),(21,'Orange'),(22,'Orange'),(23,'Orange'),(24,'Orange'),(25,'Orange'),(26,'Orange'),(27,'Orange'),(28,'Orange'),(29,'Orange'),(30,'Orange'),(31,'Red'),(32,'Red'),(33,'Red'),(34,'Red'),(35,'Red'),(36,'Red'),(37,'Red'),(38,'Red'),(39,'Red'),(40,'Red'),(41,'Red'),(42,'Red'),(43,'Red'),(44,'Red'),(45,'Red'),(46,'Red'),(47,'Red'),(48,'Red'),(49,'Red'),(50,'Red'),(51,'Red'),(52,'Red'),(53,'Red'),(54,'Red'),(55,'Red'),(56,'Red'),(57,'Red'),(58,'Red');
/*!40000 ALTER TABLE `route_line_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_segment`
--

DROP TABLE IF EXISTS `route_segment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route_segment` (
  `route_id` int NOT NULL AUTO_INCREMENT,
  `distance` double NOT NULL,
  `walking_time` int NOT NULL,
  PRIMARY KEY (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_segment`
--

LOCK TABLES `route_segment` WRITE;
/*!40000 ALTER TABLE `route_segment` DISABLE KEYS */;
INSERT INTO `route_segment` VALUES (1,0.4,8),(2,0.73,14),(3,0.57,11),(4,0.44,10),(5,1.08,28),(6,0.63,11),(7,0.57,13),(8,0.9,42),(9,0.28,4),(10,0.17,3),(11,0.17,3),(12,0.83,16),(13,1.75,36),(14,0.659,20),(15,0.572,15),(16,0.83,20),(17,0.81,21),(18,0.27,9),(19,0.35,4),(20,0.18,7),(21,0.25,5),(22,0.27,5),(23,0.55,14),(24,0.69,11),(25,0.41,11),(26,0.52,9),(27,0.55,12),(28,0.51,9),(29,0.51,10),(30,0.69,16),(31,0.96,20),(32,0.66,14),(33,0.99,21),(34,1.08,20),(35,0.95,18),(36,0.71,18),(37,0.56,15),(38,0.22,2),(39,0.27,6),(40,0.82,22),(41,0.84,18),(42,0.74,17),(43,0.7,12),(44,1,23),(45,0.59,14),(46,0.62,13),(47,0.38,15),(48,0.57,15),(49,0.29,6),(50,0.31,7),(51,0.44,10),(52,0.3,17),(53,0.26,15),(54,3.53,88),(55,0.8,17),(56,1.28,26),(57,1.33,27),(58,1.86,74),(59,13,1),(60,14,0),(61,14,1),(62,22,1),(63,17,1),(64,24,1),(65,14,0),(66,7,1),(67,9,0),(68,6,0),(69,6,0),(70,5,0),(71,7,0),(72,8,0),(73,9,0),(74,5,0),(75,6,0),(76,8,0),(77,6,0),(78,5,0),(79,3,0),(80,4,0),(81,3,0),(82,3,0),(83,1,0),(84,12,1),(85,10,0),(86,13,1),(87,9,0),(88,15,1),(89,11,1),(90,16,1),(91,11,0),(92,23,1),(93,34,1),(94,17,1),(95,12,1),(96,22,1),(97,26,1),(98,30,1),(99,15,1),(100,4,0),(101,4,0),(102,4,0),(103,6,0),(104,5,0),(105,4,0),(106,3,0),(107,4,0),(108,3,0),(109,4,0),(110,4,0),(111,5,0),(112,8,0),(113,4,0),(114,3,0),(115,10,0),(116,7,0),(117,5,0),(118,6,0),(119,3,0),(120,4,0),(121,3,0),(122,7,0),(123,6,0),(124,6,0),(125,3,0),(126,6,0),(127,10,0);
/*!40000 ALTER TABLE `route_segment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_station_link`
--

DROP TABLE IF EXISTS `route_station_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route_station_link` (
  `route_id` int NOT NULL,
  `current_station_id` int NOT NULL,
  `next_station_id` int NOT NULL,
  `bound` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`route_id`,`current_station_id`,`next_station_id`),
  KEY `current_station_id` (`current_station_id`),
  KEY `next_station_id` (`next_station_id`),
  CONSTRAINT `route_station_link_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route_segment` (`route_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `route_station_link_ibfk_2` FOREIGN KEY (`current_station_id`) REFERENCES `station` (`station_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `route_station_link_ibfk_3` FOREIGN KEY (`next_station_id`) REFERENCES `station` (`station_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_station_link`
--

LOCK TABLES `route_station_link` WRITE;
/*!40000 ALTER TABLE `route_station_link` DISABLE KEYS */;
INSERT INTO `route_station_link` VALUES (1,49,50,'inbound'),(1,50,49,'outbound'),(2,50,51,'inbound'),(2,51,50,'outbound'),(3,51,52,'inbound'),(3,52,51,'outbound'),(4,52,53,'inbound'),(4,53,52,'outbound'),(5,53,54,'inbound'),(5,54,53,'outbound'),(6,54,55,'inbound'),(6,55,54,'outbound'),(7,55,56,'inbound'),(7,56,55,'outbound'),(8,56,57,'inbound'),(8,57,56,'outbound'),(9,38,57,'outbound'),(9,57,38,'inbound'),(10,38,58,'inbound'),(10,58,38,'outbound'),(11,58,59,'inbound'),(11,59,58,'outbound'),(12,30,31,'outbound'),(12,31,30,'inbound'),(13,31,32,'outbound'),(13,32,31,'inbound'),(14,32,33,'outbound'),(14,33,32,'inbound'),(15,33,34,'outbound'),(15,34,33,'inbound'),(16,34,35,'outbound'),(16,35,34,'inbound'),(17,35,36,'outbound'),(17,36,35,'inbound'),(18,36,37,'outbound'),(18,37,36,'inbound'),(19,37,38,'outbound'),(19,38,37,'inbound'),(20,9,38,'inbound'),(20,38,9,'outbound'),(21,9,39,'outbound'),(21,39,9,'inbound'),(22,39,40,'outbound'),(22,40,39,'inbound'),(23,40,41,'outbound'),(23,41,40,'inbound'),(24,41,42,'outbound'),(24,42,41,'inbound'),(25,42,43,'outbound'),(25,43,42,'inbound'),(26,43,44,'outbound'),(26,44,43,'inbound'),(27,44,45,'outbound'),(27,45,44,'inbound'),(28,45,46,'outbound'),(28,46,45,'inbound'),(29,46,47,'outbound'),(29,47,46,'inbound'),(30,47,48,'outbound'),(30,48,47,'inbound'),(31,1,2,'inbound'),(31,2,1,'outbound'),(32,2,3,'inbound'),(32,3,2,'outbound'),(33,3,4,'inbound'),(33,4,3,'outbound'),(34,4,5,'inbound'),(34,5,4,'outbound'),(35,5,6,'inbound'),(35,6,5,'outbound'),(36,6,7,'inbound'),(36,7,6,'outbound'),(37,7,8,'inbound'),(37,8,7,'outbound'),(38,8,9,'inbound'),(38,9,8,'outbound'),(39,9,10,'inbound'),(39,10,9,'outbound'),(40,10,11,'inbound'),(40,11,10,'outbound'),(41,11,12,'inbound'),(41,12,11,'outbound'),(42,12,13,'inbound'),(42,13,12,'outbound'),(43,13,14,'inbound'),(43,14,13,'outbound'),(44,14,15,'inbound'),(44,15,14,'outbound'),(45,15,16,'inbound'),(45,16,15,'outbound'),(46,16,17,'inbound'),(46,17,16,'outbound'),(47,17,18,'inbound'),(47,18,17,'outbound'),(48,18,19,'inbound'),(48,19,18,'outbound'),(49,19,20,'inbound'),(49,20,19,'outbound'),(50,20,21,'inbound'),(50,21,20,'outbound'),(51,21,22,'inbound'),(51,22,21,'outbound'),(52,22,23,'inbound'),(52,23,22,'outbound'),(53,23,24,'inbound'),(53,24,23,'outbound'),(54,13,25,'inbound'),(54,25,13,'outbound'),(55,25,26,'inbound'),(55,26,25,'outbound'),(56,26,27,'inbound'),(56,27,26,'outbound'),(57,27,28,'inbound'),(57,28,27,'outbound'),(58,28,29,'inbound'),(58,29,28,'outbound'),(59,110,111,'outbound'),(59,111,110,'inbound'),(60,111,112,'outbound'),(60,112,111,'inbound'),(61,112,113,'outbound'),(61,113,112,'inbound'),(62,113,114,'outbound'),(62,114,113,'inbound'),(63,95,114,'inbound'),(63,114,95,'outbound'),(64,94,95,'outbound'),(64,95,94,'inbound'),(65,95,96,'outbound'),(65,96,95,'inbound'),(66,36,96,'inbound'),(66,96,36,'outbound'),(67,36,37,'outbound'),(67,37,36,'inbound'),(68,37,58,'outbound'),(68,58,37,'inbound'),(69,8,58,'inbound'),(69,58,8,'outbound'),(70,8,60,'outbound'),(70,60,8,'inbound'),(71,60,61,'outbound'),(71,61,60,'inbound'),(72,61,62,'outbound'),(72,62,61,'inbound'),(73,62,115,'outbound'),(73,115,62,'inbound'),(74,115,116,'outbound'),(74,116,115,'inbound'),(75,116,117,'outbound'),(75,117,116,'inbound'),(76,117,118,'outbound'),(76,118,117,'inbound'),(77,118,119,'outbound'),(77,119,118,'inbound'),(78,119,120,'outbound'),(78,120,119,'inbound'),(79,120,121,'outbound'),(79,121,120,'inbound'),(80,121,122,'outbound'),(80,122,121,'inbound'),(81,122,123,'outbound'),(81,123,122,'inbound'),(82,123,124,'outbound'),(82,124,123,'inbound'),(83,124,125,'outbound'),(83,125,124,'inbound'),(84,62,63,'outbound'),(84,63,62,'inbound'),(85,63,64,'outbound'),(85,64,63,'inbound'),(86,64,97,'outbound'),(86,97,64,'inbound'),(87,97,98,'outbound'),(87,98,97,'inbound'),(88,98,99,'outbound'),(88,99,98,'inbound'),(89,99,100,'outbound'),(89,100,99,'inbound'),(90,100,101,'outbound'),(90,101,100,'inbound'),(91,101,102,'outbound'),(91,102,101,'inbound'),(92,102,103,'outbound'),(92,103,102,'inbound'),(93,103,104,'outbound'),(93,104,103,'inbound'),(94,104,105,'outbound'),(94,105,104,'inbound'),(95,105,106,'outbound'),(95,106,105,'inbound'),(96,106,107,'outbound'),(96,107,106,'inbound'),(97,107,108,'outbound'),(97,108,107,'inbound'),(98,108,109,'outbound'),(98,109,108,'inbound'),(99,64,81,'outbound'),(99,81,64,'inbound'),(100,81,82,'outbound'),(100,82,81,'inbound'),(101,82,83,'outbound'),(101,83,82,'inbound'),(102,83,84,'outbound'),(102,84,83,'inbound'),(103,84,85,'outbound'),(103,85,84,'inbound'),(104,85,86,'outbound'),(104,86,85,'inbound'),(105,86,87,'outbound'),(105,87,86,'inbound'),(106,87,88,'outbound'),(106,88,87,'inbound'),(107,88,89,'outbound'),(107,89,88,'inbound'),(108,89,90,'outbound'),(108,90,89,'inbound'),(109,90,91,'outbound'),(109,91,90,'inbound'),(110,91,92,'outbound'),(110,92,91,'inbound'),(111,92,93,'outbound'),(111,93,92,'inbound'),(112,64,65,'outbound'),(112,65,64,'inbound'),(113,65,66,'outbound'),(113,66,65,'inbound'),(114,66,67,'outbound'),(114,67,66,'inbound'),(115,67,68,'outbound'),(115,68,67,'inbound'),(116,68,69,'outbound'),(116,69,68,'inbound'),(117,69,70,'outbound'),(117,70,69,'inbound'),(118,70,71,'outbound'),(118,71,70,'inbound'),(119,71,72,'outbound'),(119,72,71,'inbound'),(120,72,73,'outbound'),(120,73,72,'inbound'),(121,73,74,'outbound'),(121,74,73,'inbound'),(122,74,75,'outbound'),(122,75,74,'inbound'),(123,75,76,'outbound'),(123,76,75,'inbound'),(124,76,77,'outbound'),(124,77,76,'inbound'),(125,77,78,'outbound'),(125,78,77,'inbound'),(126,78,79,'outbound'),(126,79,78,'inbound'),(127,79,80,'outbound'),(127,80,79,'inbound');
/*!40000 ALTER TABLE `route_station_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_time`
--

DROP TABLE IF EXISTS `scheduled_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduled_time` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `arrival_time` time NOT NULL,
  `admin_id` int DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `scheduled_time_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_time`
--

LOCK TABLES `scheduled_time` WRITE;
/*!40000 ALTER TABLE `scheduled_time` DISABLE KEYS */;
INSERT INTO `scheduled_time` VALUES (1,'05:00:00',1),(2,'05:10:00',1),(3,'05:20:00',1),(4,'05:30:00',1),(5,'05:40:00',1),(6,'05:50:00',1),(7,'06:00:00',1),(8,'06:10:00',1),(9,'06:20:00',1),(10,'06:30:00',1),(11,'06:40:00',1),(12,'06:50:00',1),(13,'07:00:00',1),(14,'07:10:00',1),(15,'07:20:00',1),(16,'07:30:00',1),(17,'07:40:00',1),(18,'07:50:00',1),(19,'08:00:00',1),(20,'08:10:00',1),(21,'08:20:00',1),(22,'08:30:00',1),(23,'08:40:00',1),(24,'08:50:00',1),(25,'09:00:00',1),(26,'09:15:00',1),(27,'09:30:00',1),(28,'09:45:00',1),(29,'10:00:00',2),(30,'10:15:00',2),(31,'10:30:00',2),(32,'10:45:00',2),(33,'11:00:00',2),(34,'11:15:00',2),(35,'11:30:00',2),(36,'11:45:00',2),(37,'12:00:00',2),(38,'12:15:00',2),(39,'12:30:00',2),(40,'12:45:00',2),(41,'13:00:00',2),(42,'13:15:00',2),(43,'13:30:00',2),(44,'13:45:00',2),(45,'14:00:00',2),(46,'14:20:00',2),(47,'14:40:00',2),(48,'15:00:00',2),(49,'15:20:00',2),(50,'15:40:00',2),(51,'16:00:00',2),(52,'16:20:00',2),(53,'16:40:00',2),(54,'16:50:00',2),(55,'17:00:00',2),(56,'17:10:00',2),(57,'17:20:00',3),(58,'17:30:00',3),(59,'17:40:00',3),(60,'17:50:00',3),(61,'18:00:00',3),(62,'18:10:00',3),(63,'18:20:00',3),(64,'18:30:00',3),(65,'18:40:00',3),(66,'18:50:00',3),(67,'19:00:00',3),(68,'19:20:00',3),(69,'19:40:00',3),(70,'20:00:00',3),(71,'20:20:00',3),(72,'20:40:00',3),(73,'21:00:00',3),(74,'21:20:00',3),(75,'21:40:00',3),(76,'22:00:00',3),(77,'22:20:00',3),(78,'22:40:00',3),(79,'23:00:00',3),(80,'23:20:00',3),(81,'23:40:00',3),(82,'00:00:00',3),(83,'00:20:00',3),(84,'00:30:00',3);
/*!40000 ALTER TABLE `scheduled_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station` (
  `station_id` int NOT NULL AUTO_INCREMENT,
  `station_name` varchar(64) NOT NULL,
  `accessible` tinyint(1) NOT NULL DEFAULT '0',
  `both_bounds` tinyint(1) NOT NULL DEFAULT '0',
  `fare_vending_machine` tinyint(1) NOT NULL DEFAULT '0',
  `new_card` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (1,'Alewife',1,1,1,1),(2,'Davis',1,1,1,0),(3,'Porter',1,1,1,0),(4,'Harvard',1,1,1,0),(5,'Central',1,0,1,0),(6,'Kenall/MIT',1,0,1,0),(7,'Charles/MGH',1,1,1,0),(8,'Park Street',1,1,1,1),(9,'Downtown Crossing',1,1,1,1),(10,'South Station',1,1,1,1),(11,'Broadway',1,1,1,0),(12,'Andrew',1,1,1,0),(13,'JFK/UMass',1,1,1,0),(14,'Savin Hill',1,1,1,0),(15,'Fields Corner',1,1,1,0),(16,'Shawmut',1,1,1,0),(17,'Ashmont',1,1,1,1),(18,'Cedar Grove',1,1,0,0),(19,'Butler',1,1,0,0),(20,'Milton',1,1,0,0),(21,'Central Avenue',1,1,0,0),(22,'Valley Road',0,1,0,0),(23,'Capen Street',1,1,0,0),(24,'Mattapan',1,1,1,0),(25,'North Quincy',1,1,1,0),(26,'Wollaston',1,1,1,0),(27,'Quincy Center',1,1,1,1),(28,'Quincy Adams',1,1,1,0),(29,'Braintree',1,1,1,0),(30,'Oak Grove',1,1,1,1),(31,'Malden Center',1,1,1,0),(32,'Wellington',1,1,1,0),(33,'Assembly',1,1,1,0),(34,'Sullivan Square',1,1,1,0),(35,'Community College',1,1,1,0),(36,'North Station',1,1,1,1),(37,'Haymarket',1,1,1,1),(38,'State',1,1,1,0),(39,'Chinatown',1,0,1,0),(40,'Tufts Medical Center',1,1,1,0),(41,'Back Bay',1,1,1,1),(42,'Massachusetts Avenue',1,1,1,0),(43,'Ruggles',1,1,1,1),(44,'Roxbury Crossing',1,1,1,0),(45,'Jackson Square',1,1,1,0),(46,'Stony Brook',1,1,1,0),(47,'Green Street',1,1,1,0),(48,'Forest Hills',1,1,1,1),(49,'Wonderland',1,1,1,1),(50,'Revere Beach',1,1,1,0),(51,'Beachmount',1,1,1,0),(52,'Suffolk Downs',1,1,1,0),(53,'Orient Heights',1,1,1,0),(54,'Wood Island',1,1,1,0),(55,'Airport',1,1,1,0),(56,'Maverick',1,1,1,1),(57,'Aquarium',1,1,1,0),(58,'Government center',1,1,1,0),(59,'Bowdoin',0,1,1,0),(60,'Boylston',0,0,1,0),(61,'Arlington',1,1,1,0),(62,'Copley',1,0,1,0),(63,'Hynes Convention Center',1,1,1,0),(64,'Kenmore',1,1,1,1),(65,'Blandford Street',0,1,0,0),(66,'Boston University East',1,1,0,0),(67,'Boston University central',1,1,0,0),(68,'Amory Street',1,1,0,0),(69,'Babcock Street',1,1,0,0),(70,'Packard\'s Corner',0,1,0,0),(71,'Harvard Avenue',1,1,0,0),(72,'Griggs Street',0,1,0,0),(73,'Allston Street',0,1,0,0),(74,'Warren Street',0,1,0,0),(75,'Washington Street',1,1,0,0),(76,'Sutherland Road',0,1,0,0),(77,'Chiswick Road',0,1,0,0),(78,'Chestnut Hill Ave',0,1,0,0),(79,'South Street',0,1,0,0),(80,'Boston College',1,1,0,0),(81,'Saint Mary\'s Street',1,1,0,0),(82,'Hawes Street',0,1,0,0),(83,'Kent Street',0,1,0,0),(84,'Saint Paul Street',0,1,0,0),(85,'Coolidge Corner',1,1,0,0),(86,'Summit Avenue',0,1,0,0),(87,'Brandon Hall',0,1,0,0),(88,'Fairbanks Street',0,1,0,0),(89,'Washington Square',1,1,0,0),(90,'Tappan Street',0,1,0,0),(91,'Dean Road',0,1,0,0),(92,'Englewood Avenue',0,1,0,0),(93,'Cleveland Circle',1,1,0,0),(94,'Union Square',1,1,1,0),(95,'Lechmere',1,1,1,0),(96,'Science Park/West End',1,1,1,0),(97,'Fenway',1,1,1,0),(98,'Longwood',1,1,1,0),(99,'Brookline Village',1,1,1,0),(100,'Brookline Hills',1,1,1,0),(101,'Beaconsfield',0,1,1,0),(102,'Reservoir',1,1,1,0),(103,'Chestnut Hill',0,1,1,0),(104,'Newton Centre',1,1,1,0),(105,'Newton Highlands',1,1,1,0),(106,'Eliot',0,1,1,0),(107,'Waban',0,1,1,0),(108,'Woodland',1,1,1,0),(109,'Riverside',1,1,1,0),(110,'Medford/Tufts',1,1,1,0),(111,'Ball Square',1,1,1,0),(112,'Magoun Square',1,1,1,0),(113,'Gilman Square',1,1,1,0),(114,'East Somerville',1,1,1,0),(115,'Prudential',1,1,1,0),(116,'Symphony',0,0,1,0),(117,'Northeastern University',1,1,0,0),(118,'Museum of Fine Arts',1,1,0,0),(119,'Longwood Medical Area',1,1,0,0),(120,'Brigham Circle',1,1,0,0),(121,'Fenwood Road',0,1,0,0),(122,'Mission Park',0,1,0,0),(123,'Riverway',0,1,0,0),(124,'Back of the Hill',0,1,0,0),(125,'Heath Street',1,1,0,0);
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train` (
  `train_id` int NOT NULL AUTO_INCREMENT,
  `capacity` int NOT NULL,
  `line_name` varchar(64) NOT NULL,
  PRIMARY KEY (`train_id`),
  KEY `line_name` (`line_name`),
  CONSTRAINT `train_ibfk_1` FOREIGN KEY (`line_name`) REFERENCES `line` (`line_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=801 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (100,500,'Red'),(101,1020,'Red'),(200,1020,'Orange'),(300,1020,'Blue'),(400,510,'Green B'),(500,1000,'Green C'),(600,510,'Green D'),(700,510,'Green E');
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mbtadb'
--

--
-- Dumping routines for database 'mbtadb'
--
/*!50003 DROP FUNCTION IF EXISTS `accessible_from_station` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `accessible_from_station`(station_name_p varchar(64)) RETURNS varchar(20) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
begin 
declare ret_bol boolean;
declare ret_val varchar(20);
select `accessible` into ret_bol from station 
where station_name = station_name_p; 
if (ret_bol = 1) then 
	return 'accessible';
else 
	return 'not accessible';
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `accessible_from_line` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `accessible_from_line`(line_name_p varchar(64))
begin 
select distinct station_name from station 
join route_station_link on station.station_id = route_station_link.current_station_id 
natural join route_segment 
natural join route_line_link 
natural join line 
where `accessible` = 1 and line_name = line_name_p; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `all_arrives_time_for_line` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_arrives_time_for_line`(line_name_p varchar(64))
begin 
select line_name, station_name, arrival_time, train_id from arrives
natural join station 
natural join scheduled_time
natural join train
where line_name = line_name_p 
order by arrival_time; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `all_lines` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_lines`()
begin 
select * from line; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `all_scheduled_time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_scheduled_time`()
begin 
select arrival_time from scheduled_time; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `all_stations_of` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_stations_of`(line_name_p varchar(64))
begin 
select distinct station_name from station 
join route_station_link on station.station_id = route_station_link.current_station_id 
natural join route_segment 
natural join route_line_link 
natural join line 
where line_name = line_name_p; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `all_times_for_station` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_times_for_station`(station_name_p varchar(64))
begin 
select distinct arrival_time from station 
join route_station_link on station.station_id = route_station_link.current_station_id 
natural join route_segment 
natural join route_line_link 
natural join line 
natural join arrives 
natural join scheduled_time
where station_name = station_name_p; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_password`(admin_id_p int, password_p varchar(34))
begin 
	select count(*) from `admin` where admin_id = admin_id_p and password = password_p;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_arrives` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_arrives`(station_name_p varchar(64), train_id_p int, arrival_time_p time)
begin 
declare schedule_id_p int;
declare station_id_p varchar(64);
select schedule_id into schedule_id_p from scheduled_time where arrival_time = arrival_time_p;
select station_id into station_id_p from station where station_name = station_name_p;
insert into arrives(station_id, train_id, schedule_id) value(station_id_p, train_id_p, schedule_id_p); 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_new_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_new_admin`(password_p varchar(34), first_name_p varchar(34), 
last_name_p varchar(34), phone_num_p varchar(11), email_p varchar(34))
begin
	declare admin_id_p int;
	select max(admin_id) + 1 into admin_id_p from admin;
	insert into admin(admin_id, `password`, first_name,last_name, phone_num, email)
	values (admin_id_p, `password_p`, first_name_p,last_name_p, phone_num_p, email_p);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_new_train` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_new_train`(train_id_p int, capacity_p int , line_name_p varchar(64))
begin
	insert into train(train_id, capacity, line_name)
	values (train_id_p, capacity_p, line_name_p);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_time`(arrival_time_p time, admin_id_p int)
begin 
declare schedule_id_p int;
select max(schedule_id) + 1 into schedule_id_p from scheduled_time;
insert into scheduled_time(schedule_id, arrival_time, admin_id) value(schedule_id_p, arrival_time_p, admin_id_p); 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_admin`(admin_id_p int)
begin 
	delete from admin
    where admin_id = admin_id_p;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_time`(arrival_time_p time)
begin 
declare schedule_id_p int;
select schedule_id into schedule_id_p from scheduled_time where arrival_time = arrival_time_p;
delete from scheduled_time where schedule_id = schedule_id_p; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_train` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_train`(train_id_p int)
begin 
	delete from train
    where train_id = train_id_p;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_admins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_admins`()
begin
	select *
    from admin;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_trains` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_trains`()
begin
	select * from train;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lines_of_station` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lines_of_station`(station_name_p varchar(64))
begin 
select distinct line_name from station 
join route_station_link on station.station_id = route_station_link.current_station_id 
natural join route_segment 
natural join route_line_link 
natural join line 
where station_name = station_name_p; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_card_anywhere` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_card_anywhere`()
begin 
select distinct station_name from station 
where new_card = 1; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_card_from_line` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_card_from_line`(line_name_p varchar(64))
begin 
select distinct station_name from station 
join route_station_link on station.station_id = route_station_link.current_station_id 
natural join route_segment 
natural join route_line_link 
natural join line 
where new_card = 1 and line_name = line_name_p; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_card_station_from_line` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_card_station_from_line`(line_name_p varchar(64))
begin 

select distinct station_name, new_card from station 
join route_station_link on station.station_id = route_station_link.current_station_id 
natural join route_segment 
natural join route_line_link 
natural join line
where line_name = line_name_p; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `next_train_after_time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `next_train_after_time`(current_time_p time, station_name_p varchar(64))
begin 
select distinct arrival_time from station 
join route_station_link on station.station_id = route_station_link.current_station_id 
natural join route_segment 
natural join route_line_link 
natural join line 
natural join arrives 
natural join scheduled_time
where station_name = station_name_p and arrival_time > current_time_p; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `no_new_card_station_from_line` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `no_new_card_station_from_line`(line_name_p varchar(64))
begin 

select distinct station_name from station 
join route_station_link on station.station_id = route_station_link.current_station_id 
natural join route_segment 
natural join route_line_link 
natural join line
where line_name = line_name_p and new_card = 0; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `query_time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `query_time`(arrival_time_p time)
begin 
select count(*) from scheduled_time where arrival_time = arrival_time_p; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_accessiblity_at_station` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_accessiblity_at_station`(station_name_p varchar(64), new_accessible_p varchar(10))
begin 
declare the_station_id varchar(64);
declare new_accessible bool;
select station_id into the_station_id from station where station_name = station_name_p;
if (new_accessible_p = 'no') then 
	set new_accessible = 0;
else 
	set new_accessible = 1;
end if;
update station set `accessible` = new_accessible where station_id = the_station_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_accessiblity_at_station2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_accessiblity_at_station2`(station_name_p varchar(64))
begin 
declare the_station_id varchar(64);
declare old_accessible, new_accessible bool;
select station_id into the_station_id from station where station_name = station_name_p;
select `accessible` into old_accessible from station where station_name = station_name_p;
if (old_accessible = 0) then 
	set new_accessible = 1;
else 
	set new_accessible = 0;
end if;
update station set `accessible` = new_accessible where station_id = the_station_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_email_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_email_admin`(admin_id_p int, email_new varchar(34))
begin
    update admin
    set email = email_new
    where
    admin_id = admin_id_p;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_new_card_at_station` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_new_card_at_station`(station_name_p varchar(64), new_card_bool varchar(10))
begin 
declare the_station_id varchar(64);
declare new_card_p bool;
select station_id into the_station_id from station where station_name = station_name_p;
if (new_card_bool = 'no') then 
	set new_card_p = 0;
else 
	set new_card_p = 1;
end if;
update station set new_card = new_card_p where station_id = the_station_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_phone_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_phone_admin`(admin_id_p int, new_phone varchar(11))
begin
    update `admin`
    set phone_num = new_phone
    where
    admin_id = admin_id_p;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_station_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_station_name`(station_old_name_p varchar(64), station_new_name_p varchar(64))
begin 
declare the_station_id varchar(64);
select station_id into the_station_id from station where station_name = station_old_name_p;
update station set station_name = station_new_name_p where station_id = the_station_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_train_capacity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_train_capacity`(train_id_p int, new_capacity int)
begin
    update train
    set capacity = new_capacity
    where
    train_id = train_id_p;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `yes_new_card_station_from_line` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `yes_new_card_station_from_line`(line_name_p varchar(64))
begin 

select distinct station_name from station 
join route_station_link on station.station_id = route_station_link.current_station_id 
natural join route_segment 
natural join route_line_link 
natural join line
where line_name = line_name_p and new_card = 1; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-20 23:36:10
