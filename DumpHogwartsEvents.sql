CREATE DATABASE  IF NOT EXISTS `hogwartsuniversityevents` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hogwartsuniversityevents`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hogwartsuniversityevents
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `accesses`
--

DROP TABLE IF EXISTS `accesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accesses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `level_access` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesses`
--

LOCK TABLES `accesses` WRITE;
/*!40000 ALTER TABLE `accesses` DISABLE KEYS */;
INSERT INTO `accesses` VALUES (1,'Admin',1),(2,'Manager',2),(3,'User',3),(4,'Visitor',4);
/*!40000 ALTER TABLE `accesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` VALUES (1,'A'),(2,'B'),(3,'C'),(4,'D');
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkins`
--

DROP TABLE IF EXISTS `checkins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkins` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_fk` bigint NOT NULL,
  `event_fk` bigint NOT NULL,
  `moment` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_fk` (`user_fk`),
  KEY `event_fk` (`event_fk`),
  CONSTRAINT `checkins_ibfk_1` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`),
  CONSTRAINT `checkins_ibfk_2` FOREIGN KEY (`event_fk`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkins`
--

LOCK TABLES `checkins` WRITE;
/*!40000 ALTER TABLE `checkins` DISABLE KEYS */;
INSERT INTO `checkins` VALUES (1,12,1,'2023-05-21 00:57:21'),(2,7,2,'2023-05-21 00:57:21'),(3,8,2,'2023-05-21 00:57:21'),(4,9,2,'2023-05-21 00:57:21'),(5,10,2,'2023-05-21 00:57:21'),(6,7,3,'2023-05-21 00:57:21'),(7,8,3,'2023-05-21 00:57:21'),(8,9,3,'2023-05-21 00:57:21'),(9,10,3,'2023-05-21 00:57:21'),(10,7,4,'2023-05-21 00:57:21'),(11,8,4,'2023-05-21 00:57:21'),(12,9,4,'2023-05-21 00:57:21'),(13,10,4,'2023-05-21 00:57:21'),(14,12,4,'2023-05-21 00:57:21'),(15,7,5,'2023-05-21 00:57:21'),(16,8,5,'2023-05-21 00:57:21'),(17,9,5,'2023-05-21 00:57:21'),(18,10,5,'2023-05-21 00:57:21'),(19,1,7,'2023-05-21 00:57:21'),(20,2,7,'2023-05-21 00:57:21'),(21,3,7,'2023-05-21 00:57:21'),(22,4,7,'2023-05-21 00:57:21');
/*!40000 ALTER TABLE `checkins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equip_local`
--

DROP TABLE IF EXISTS `equip_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equip_local` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `local_fk` bigint NOT NULL,
  `equip_fk` bigint NOT NULL,
  `qtd_equip` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `local_fk` (`local_fk`),
  KEY `equip_fk` (`equip_fk`),
  CONSTRAINT `equip_local_ibfk_1` FOREIGN KEY (`local_fk`) REFERENCES `locals` (`id`),
  CONSTRAINT `equip_local_ibfk_2` FOREIGN KEY (`equip_fk`) REFERENCES `equipaments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equip_local`
--

LOCK TABLES `equip_local` WRITE;
/*!40000 ALTER TABLE `equip_local` DISABLE KEYS */;
INSERT INTO `equip_local` VALUES (1,2,4,60),(2,3,4,60),(3,4,4,60),(4,8,4,60),(5,9,4,60),(6,10,4,60),(7,2,3,2),(8,3,3,1),(9,4,3,2),(10,8,3,1),(11,2,2,1),(12,3,2,1),(13,4,2,1),(14,1,1,1),(15,2,1,1),(16,8,1,1);
/*!40000 ALTER TABLE `equip_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipaments`
--

DROP TABLE IF EXISTS `equipaments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipaments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipaments`
--

LOCK TABLES `equipaments` WRITE;
/*!40000 ALTER TABLE `equipaments` DISABLE KEYS */;
INSERT INTO `equipaments` VALUES (1,'projector'),(2,'smart TV'),(3,'air conditioner'),(4,'workstation');
/*!40000 ALTER TABLE `equipaments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `time_init` datetime NOT NULL,
  `time_end` datetime NOT NULL,
  `checkin_limit` datetime DEFAULT NULL,
  `responsible_fk` bigint NOT NULL,
  `local_fk` bigint NOT NULL,
  `n_particips` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `responsible_fk` (`responsible_fk`),
  KEY `local_fk` (`local_fk`),
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`responsible_fk`) REFERENCES `users` (`id`),
  CONSTRAINT `events_ibfk_2` FOREIGN KEY (`local_fk`) REFERENCES `locals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'new student reception ceremony','2023-01-26 19:00:00','2023-01-26 21:00:00','2023-01-26 18:30:00',1,1,500),(2,'phosphorus manipulation','2023-05-21 12:00:00','2023-05-21 16:00:00','2023-01-26 11:30:00',3,8,40),(3,'transfiguring amphibians and small rodents','2023-05-28 15:00:00','2023-05-28 17:00:00','2023-05-28 14:50:00',2,4,40),(4,'How to defend yourself against a dementor','2023-06-03 12:00:00','2023-06-03 14:00:00','2023-06-03 11:55:00',1,3,40),(5,'How Computers Work and the Future of Muggles','2023-06-09 19:00:00','2023-01-26 21:00:00','2023-01-26 18:30:00',4,5,40),(6,'the problems with casting potions','2023-06-21 12:00:00','2023-06-21 16:00:00','2023-06-26 11:30:00',3,8,60),(7,'board meeting','2023-06-30 19:00:00','2023-06-30 21:00:00','2023-06-30 18:30:00',1,9,4);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locals`
--

DROP TABLE IF EXISTS `locals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locals` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `block_fk` bigint NOT NULL,
  `max_people` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `block_fk` (`block_fk`),
  CONSTRAINT `locals_ibfk_1` FOREIGN KEY (`block_fk`) REFERENCES `blocks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locals`
--

LOCK TABLES `locals` WRITE;
/*!40000 ALTER TABLE `locals` DISABLE KEYS */;
INSERT INTO `locals` VALUES (1,'Main hall',1,2000),(2,'Classroom 7',4,350),(3,'Classroom 1',2,100),(4,'Classroom 3',3,200),(5,'Muggle Studies classroom',4,100),(6,'Music Classroom',3,500),(7,'Astronomy classroom',4,100),(8,'Potions Classroom',2,20),(9,'Room 99',1,50),(10,'Room 102',1,50);
/*!40000 ALTER TABLE `locals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `occupations`
--

DROP TABLE IF EXISTS `occupations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `occupations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `access_fk` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `access_fk` (`access_fk`),
  CONSTRAINT `occupations_ibfk_1` FOREIGN KEY (`access_fk`) REFERENCES `accesses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `occupations`
--

LOCK TABLES `occupations` WRITE;
/*!40000 ALTER TABLE `occupations` DISABLE KEYS */;
INSERT INTO `occupations` VALUES (1,'Director',1),(2,'Coordinator',2),(3,'Advisor',3),(4,'Social worker',3),(5,'Secretary',3),(6,'Student',4);
/*!40000 ALTER TABLE `occupations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` enum('active','disable') NOT NULL DEFAULT 'active',
  `occupation_fk` bigint NOT NULL DEFAULT '6',
  `name` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `dtBirth` date NOT NULL,
  `dtRgt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `occupation_fk` (`occupation_fk`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`occupation_fk`) REFERENCES `occupations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'active',1,'Albus Dumbledore','Dumbledore@hogwarts.com','potteer!','1881-08-01','2023-05-21 00:57:20'),(2,'active',2,'Minerva McGonagall','Minerva@hogwarts.com','Gryffindor','1935-10-04','2023-05-21 00:57:20'),(3,'active',2,'Severo Snape','Severo@hogwarts.com','Mind','1960-01-09','2023-05-21 00:57:20'),(4,'active',2,'Quirinus Quirrell','Quirinus@hogwarts.com','pureevil','1967-09-26','2023-05-21 00:57:20'),(5,'active',4,'Sirius Black','Sirius@hogwarts.com','bestgodfather','1959-11-03','2023-05-21 00:57:20'),(6,'active',5,'Rhuan Ribeiro','rhuan.augusto.ribeiro@gmail.com.br','write_me','2004-05-25','2023-05-21 00:57:20'),(7,'active',6,'Harry Potter','harry.potter@gmail.com','J. K. Rowling','1980-07-31','2023-05-21 00:57:20'),(8,'active',6,'Hermione Granger','hermione.granger@outlook.com','library','1979-09-19','2023-05-21 00:57:20'),(9,'active',6,'Ronald Weasley','ronaldWeasley@hotmail.com','Perebas123','1980-03-01','2023-05-21 00:57:20'),(10,'active',6,'Draco Malfoy','draco@malfoys.com','moneymoneyandpower','1980-06-05','2023-05-21 00:57:20'),(11,'active',6,'Neville Longbottom','nevillelong@gmail.com','imscary','1980-07-30','2023-05-21 00:57:20'),(12,'active',6,'Luna Lovegood','lunalove@gmail.com','lovegood','1981-02-13','2023-05-21 00:57:20');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-21  1:08:15
