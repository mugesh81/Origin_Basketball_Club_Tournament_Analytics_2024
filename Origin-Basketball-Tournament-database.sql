-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: origin_basketball_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `award_categories`
--

DROP TABLE IF EXISTS `award_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `award_categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `award_categories`
--

LOCK TABLES `award_categories` WRITE;
/*!40000 ALTER TABLE `award_categories` DISABLE KEYS */;
INSERT INTO `award_categories` VALUES (8,'Best Centre Player'),(6,'Best Defence Player'),(2,'Best Discipline Player'),(1,'Best Emerging Player'),(3,'Best Offence Player'),(11,'Best Parenting Interest in Basketball'),(7,'Best Play Maker'),(13,'Best Player of Finals'),(12,'Best Player of Semi Finals'),(14,'Best Player of the Tournament'),(4,'Best Point Guard'),(9,'Best Promising Player'),(5,'Best Shooter'),(10,'Best Stylish Player');
/*!40000 ALTER TABLE `award_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `award_winners`
--

DROP TABLE IF EXISTS `award_winners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `award_winners` (
  `winner_id` int NOT NULL AUTO_INCREMENT,
  `award_id` int DEFAULT NULL,
  `player_id` int DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  PRIMARY KEY (`winner_id`),
  KEY `award_id` (`award_id`),
  KEY `player_id` (`player_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `award_winners_ibfk_1` FOREIGN KEY (`award_id`) REFERENCES `awards` (`award_id`),
  CONSTRAINT `award_winners_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`),
  CONSTRAINT `award_winners_ibfk_3` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `award_winners`
--

LOCK TABLES `award_winners` WRITE;
/*!40000 ALTER TABLE `award_winners` DISABLE KEYS */;
INSERT INTO `award_winners` VALUES (93,4,1,2),(94,14,1,2),(95,13,1,2),(96,3,1,2),(97,10,9,2),(98,11,64,6),(99,1,154,12),(100,5,194,1),(101,7,194,1),(102,9,196,1),(103,8,197,1),(104,6,199,1),(105,12,205,16),(106,2,206,16),(108,22,217,17),(109,23,221,17),(110,16,222,17),(111,21,223,17),(112,24,229,18),(113,26,241,19),(114,19,265,22),(115,29,265,22),(116,28,265,22),(117,18,265,22),(118,25,266,22),(119,20,277,20),(120,27,277,20),(121,17,278,20);
/*!40000 ALTER TABLE `award_winners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awards` (
  `award_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `gender_id` int DEFAULT NULL,
  `sponsor_id` int DEFAULT NULL,
  `tournament_id` int DEFAULT NULL,
  PRIMARY KEY (`award_id`),
  KEY `category_id` (`category_id`),
  KEY `gender_id` (`gender_id`),
  KEY `sponsor_id` (`sponsor_id`),
  KEY `tournament_id` (`tournament_id`),
  CONSTRAINT `awards_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `award_categories` (`category_id`),
  CONSTRAINT `awards_ibfk_2` FOREIGN KEY (`gender_id`) REFERENCES `gender_categories` (`gender_id`),
  CONSTRAINT `awards_ibfk_3` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsors` (`sponsor_id`),
  CONSTRAINT `awards_ibfk_4` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
INSERT INTO `awards` VALUES (1,1,1,1,1),(2,2,1,3,1),(3,3,1,4,1),(4,4,1,6,1),(5,5,1,8,1),(6,6,1,10,1),(7,7,1,12,1),(8,8,1,14,1),(9,9,1,16,1),(10,10,1,18,1),(11,11,1,20,1),(12,12,1,22,1),(13,13,1,23,1),(14,14,1,24,1),(16,1,2,2,1),(17,2,2,4,1),(18,3,2,5,1),(19,4,2,7,1),(20,5,2,9,1),(21,6,2,11,1),(22,7,2,13,1),(23,8,2,15,1),(24,9,2,17,1),(25,10,2,19,1),(26,11,2,21,1),(27,12,2,22,1),(28,13,2,23,1),(29,14,2,26,1);
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donations`
--

DROP TABLE IF EXISTS `donations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donations` (
  `donation_id` int NOT NULL AUTO_INCREMENT,
  `sponsor_id` int DEFAULT NULL,
  `tournament_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`donation_id`),
  KEY `sponsor_id` (`sponsor_id`),
  KEY `tournament_id` (`tournament_id`),
  CONSTRAINT `donations_ibfk_1` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsors` (`sponsor_id`),
  CONSTRAINT `donations_ibfk_2` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donations`
--

LOCK TABLES `donations` WRITE;
/*!40000 ALTER TABLE `donations` DISABLE KEYS */;
INSERT INTO `donations` VALUES (131,27,1,27000.00),(132,28,1,20000.00),(133,29,1,30000.00),(134,30,1,37000.00),(135,31,1,18000.00),(136,32,1,16000.00),(137,33,1,15000.00),(138,34,1,15000.00),(139,35,1,5000.00),(140,36,1,15000.00),(141,37,1,27100.00),(142,38,1,10000.00),(143,39,1,5000.00),(144,40,1,10000.00),(145,41,1,12000.00),(146,42,1,5000.00),(147,43,1,11000.00),(148,44,1,10000.00),(149,45,1,10000.00),(150,46,1,3000.00),(151,47,1,3000.00),(152,48,1,5000.00),(153,49,1,5000.00),(154,50,1,15000.00),(155,51,1,25000.00),(162,73,1,5000.00),(163,72,1,3000.00),(164,57,1,3000.00),(165,59,1,3000.00),(166,82,1,4000.00),(167,55,1,5000.00),(168,64,1,3000.00),(169,80,1,1000.00),(170,68,1,2000.00),(171,75,1,5000.00),(172,77,1,2000.00),(173,84,1,3000.00),(174,70,1,10000.00),(175,26,1,25000.00),(176,60,1,10000.00),(177,56,1,15000.00),(178,69,1,3000.00),(179,81,1,3000.00),(180,79,1,3000.00),(181,65,1,3000.00),(182,67,1,5000.00),(183,71,1,3000.00),(184,58,1,5000.00),(185,54,1,10000.00),(186,61,1,20000.00),(187,53,1,20000.00),(188,86,1,5000.00),(189,25,1,20000.00),(190,22,1,5000.00),(191,85,1,2500.00),(192,83,1,5000.00),(193,80,1,1000.00);
/*!40000 ALTER TABLE `donations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `expense_id` int NOT NULL AUTO_INCREMENT,
  `tournament_id` int DEFAULT NULL,
  `expense_category` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`expense_id`),
  KEY `tournament_id` (`tournament_id`),
  CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (1,1,'Food Allowance For Boys',124000.00),(2,1,'Accommodation For Boys(Hotel)',105000.00),(3,1,'Food Allowance For Girls',60000.00),(4,1,'Accommodation For Girls(Hotel)',60000.00),(5,1,'Sounds & Lights',30000.00),(6,1,'Allowance For Referees',60000.00),(7,1,'Accommodation For Coaches & Referees',42000.00),(8,1,'Special Prize',30000.00),(9,1,'Prize Money For Boys',30000.00),(10,1,'Prize Money For Girls',30000.00),(11,1,'Stage & Chair',25000.00),(12,1,'Trophy repair work',10000.00),(13,1,'Prize - Cycle',16000.00),(14,1,'Prize - Alarm Clock',10000.00),(15,1,'Ground Paint',10000.00),(16,1,'Score Board',5000.00),(17,1,'Banner',10000.00),(18,1,'Sticker',5000.00),(19,1,'Photos',5000.00),(20,1,'Refreshment - Tea',5000.00),(21,1,'Refreshment - Snacks',5000.00),(22,1,'Water Can',2000.00);
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender_categories`
--

DROP TABLE IF EXISTS `gender_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender_categories` (
  `gender_id` int NOT NULL AUTO_INCREMENT,
  `gender_name` varchar(20) NOT NULL,
  PRIMARY KEY (`gender_id`),
  UNIQUE KEY `gender_name` (`gender_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender_categories`
--

LOCK TABLES `gender_categories` WRITE;
/*!40000 ALTER TABLE `gender_categories` DISABLE KEYS */;
INSERT INTO `gender_categories` VALUES (1,'Boys'),(2,'Girls');
/*!40000 ALTER TABLE `gender_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_results`
--

DROP TABLE IF EXISTS `match_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_results` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `match_id` int DEFAULT NULL,
  `team1_score` int DEFAULT NULL,
  `team2_score` int DEFAULT NULL,
  `winner_team_id` int DEFAULT NULL,
  PRIMARY KEY (`result_id`),
  UNIQUE KEY `match_id` (`match_id`),
  KEY `winner_team_id` (`winner_team_id`),
  CONSTRAINT `match_results_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`),
  CONSTRAINT `match_results_ibfk_2` FOREIGN KEY (`winner_team_id`) REFERENCES `teams` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_results`
--

LOCK TABLES `match_results` WRITE;
/*!40000 ALTER TABLE `match_results` DISABLE KEYS */;
INSERT INTO `match_results` VALUES (1,28,70,15,2),(2,29,60,43,5),(3,30,48,16,4),(4,31,50,26,8),(5,32,31,12,10),(6,NULL,40,27,17),(7,NULL,42,5,17),(8,48,47,39,18),(9,46,40,27,17),(10,47,38,24,19),(11,33,44,30,12),(12,34,52,28,2),(13,35,46,41,1),(14,36,55,33,3),(15,49,45,26,17),(16,50,38,34,23),(17,37,49,38,4),(18,38,42,35,7),(19,39,51,29,3),(20,40,42,48,6),(21,51,36,44,19),(22,41,46,32,3),(23,42,44,40,6),(24,43,54,38,2),(25,44,49,41,3),(26,45,58,52,2),(27,52,46,39,17);
/*!40000 ALTER TABLE `match_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_stages`
--

DROP TABLE IF EXISTS `match_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_stages` (
  `stage_id` int NOT NULL AUTO_INCREMENT,
  `stage_name` varchar(50) NOT NULL,
  PRIMARY KEY (`stage_id`),
  UNIQUE KEY `stage_name` (`stage_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_stages`
--

LOCK TABLES `match_stages` WRITE;
/*!40000 ALTER TABLE `match_stages` DISABLE KEYS */;
INSERT INTO `match_stages` VALUES (4,'Final'),(1,'League'),(2,'Quarter Final'),(3,'Semi Final');
/*!40000 ALTER TABLE `match_stages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `match_id` int NOT NULL AUTO_INCREMENT,
  `tournament_id` int DEFAULT NULL,
  `match_date` date DEFAULT NULL,
  `match_time` time DEFAULT NULL,
  `team1_id` int DEFAULT NULL,
  `team2_id` int DEFAULT NULL,
  `stage_id` int DEFAULT NULL,
  `gender_id` int DEFAULT NULL,
  PRIMARY KEY (`match_id`),
  UNIQUE KEY `unique_match` (`match_date`,`match_time`,`team1_id`,`team2_id`,`gender_id`),
  KEY `tournament_id` (`tournament_id`),
  KEY `team1_id` (`team1_id`),
  KEY `team2_id` (`team2_id`),
  KEY `stage_id` (`stage_id`),
  KEY `gender_id` (`gender_id`),
  CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`),
  CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`team1_id`) REFERENCES `teams` (`team_id`),
  CONSTRAINT `matches_ibfk_3` FOREIGN KEY (`team2_id`) REFERENCES `teams` (`team_id`),
  CONSTRAINT `matches_ibfk_4` FOREIGN KEY (`stage_id`) REFERENCES `match_stages` (`stage_id`),
  CONSTRAINT `matches_ibfk_5` FOREIGN KEY (`gender_id`) REFERENCES `gender_categories` (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (28,1,'2024-01-27','06:30:00',2,14,1,1),(29,1,'2024-01-27','16:00:00',5,9,1,1),(30,1,'2024-01-27','18:00:00',4,16,1,1),(31,1,'2024-01-27','19:00:00',8,12,1,1),(32,1,'2024-01-27','22:00:00',10,14,1,1),(33,1,'2024-01-28','07:30:00',12,16,1,1),(34,1,'2024-01-28','08:30:00',2,10,1,1),(35,1,'2024-01-28','17:00:00',1,5,1,1),(36,1,'2024-01-28','19:00:00',3,7,1,1),(37,1,'2024-01-29','06:15:00',4,12,1,1),(38,1,'2024-01-29','08:15:00',7,15,1,1),(39,1,'2024-01-29','16:00:00',3,13,1,1),(40,1,'2024-01-29','18:00:00',2,6,1,1),(41,1,'2024-01-30','06:30:00',3,15,1,1),(42,1,'2024-01-30','07:30:00',6,14,1,1),(43,1,'2024-01-30','18:00:00',2,6,3,1),(44,1,'2024-01-30','20:00:00',3,4,3,1),(45,1,'2024-01-31','19:00:00',2,3,4,1),(46,1,'2024-01-27','07:30:00',17,23,1,2),(47,1,'2024-01-27','17:00:00',19,21,1,2),(48,1,'2024-01-27','20:00:00',18,20,1,2),(49,1,'2024-01-28','06:30:00',17,21,1,2),(50,1,'2024-01-28','16:00:00',23,22,1,2),(51,1,'2024-01-29','17:00:00',17,19,1,2),(52,1,'2024-01-31','17:00:00',17,19,4,2);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_match_stats`
--

DROP TABLE IF EXISTS `player_match_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_match_stats` (
  `stat_id` int NOT NULL AUTO_INCREMENT,
  `match_id` int DEFAULT NULL,
  `player_id` int DEFAULT NULL,
  `points` int DEFAULT '0',
  `rebounds` int DEFAULT '0',
  `assists` int DEFAULT '0',
  `steals` int DEFAULT '0',
  `blocks` int DEFAULT '0',
  `minutes_played` int DEFAULT NULL,
  PRIMARY KEY (`stat_id`),
  KEY `match_id` (`match_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_match_stats_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`),
  CONSTRAINT `player_match_stats_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_match_stats`
--

LOCK TABLES `player_match_stats` WRITE;
/*!40000 ALTER TABLE `player_match_stats` DISABLE KEYS */;
INSERT INTO `player_match_stats` VALUES (25,45,1,18,5,6,2,1,34),(26,45,194,12,3,4,1,0,28),(27,45,199,10,7,2,1,1,30),(28,45,205,14,4,3,1,0,33),(29,45,206,11,2,2,0,0,29),(30,52,265,14,4,5,2,0,33),(31,52,277,12,3,4,1,0,32);
/*!40000 ALTER TABLE `player_match_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_positions`
--

DROP TABLE IF EXISTS `player_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_positions` (
  `position_id` int NOT NULL AUTO_INCREMENT,
  `position_name` varchar(10) NOT NULL,
  PRIMARY KEY (`position_id`),
  UNIQUE KEY `position_name` (`position_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_positions`
--

LOCK TABLES `player_positions` WRITE;
/*!40000 ALTER TABLE `player_positions` DISABLE KEYS */;
INSERT INTO `player_positions` VALUES (5,'C'),(4,'PF'),(1,'PG'),(3,'SF'),(2,'SG');
/*!40000 ALTER TABLE `player_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `player_id` int NOT NULL AUTO_INCREMENT,
  `player_name` varchar(100) NOT NULL,
  `jersey_no` int NOT NULL,
  `team_id` int DEFAULT NULL,
  `position_id` int DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `team_id` (`team_id`,`jersey_no`),
  KEY `position_id` (`position_id`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`),
  CONSTRAINT `players_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `player_positions` (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Arjun Kumar',3,2,1),(2,'Joshua Paul',5,2,2),(3,'Mohamed Rizwan',7,2,3),(4,'Karthik Raj',10,2,4),(5,'Samuel Joseph',12,2,5),(6,'Naveen Prakash',15,2,2),(7,'Ibrahim Ameen',18,2,3),(8,'Dinesh Kumar',21,2,4),(9,'Andrew Thomas',23,2,5),(10,'Santhosh Velan',27,2,1),(11,'Faizal Rahman',30,2,3),(12,'Paul Antony',34,2,4),(13,'Rohit Kumar',4,3,1),(14,'Daniel James',6,3,2),(15,'Salman Farooq',8,3,3),(16,'Vignesh Raj',11,3,4),(17,'Antony Louis',13,3,5),(18,'Sathish Kumar',16,3,2),(19,'Nizam Ali',19,3,3),(20,'Praveen Raj',22,3,4),(21,'Stephen Roy',24,3,5),(22,'Arif Khan',28,3,1),(23,'Kavin Selvam',31,3,3),(24,'Michael David',35,3,4),(25,'Ajay Kumar',3,4,1),(26,'Joseph Alex',5,4,2),(27,'Imran Shaikh',7,4,3),(28,'Manoj Raj',10,4,4),(29,'Wilson John',12,4,5),(30,'Suresh Babu',15,4,2),(31,'Rahman Yusuf',18,4,3),(32,'Prakash Raj',21,4,4),(33,'Thomas Samuel',23,4,5),(34,'Karthi Vel',27,4,1),(35,'Salim Ahmed',30,4,3),(36,'Benedict Paul',34,4,4),(61,'Rakesh Kumar',4,6,1),(62,'Benjamin Paul',6,6,2),(63,'Nabeel Hassan',8,6,3),(64,'Gokul Raj',11,6,4),(65,'Vincent Thomas',13,6,5),(66,'Hari Prakash',16,6,2),(67,'Shahid Ali',19,6,3),(68,'Balaji Kumar',22,6,4),(69,'Chris Antony',24,6,5),(70,'Lokesh Vel',28,6,1),(71,'Yasir Arafat',31,6,3),(72,'Saravanan',35,6,4),(73,'Deepak Kumar',3,7,1),(74,'Joel Peter',5,7,2),(75,'Afsal Rahman',7,7,3),(76,'Manikandan',10,7,4),(77,'Stephen Paul',12,7,5),(78,'Karthikeyan',15,7,2),(79,'Salman Khan',18,7,3),(80,'Vijay Anand',21,7,4),(81,'Antony Samuel',23,7,5),(82,'Sivakumar',27,7,1),(83,'Irfan Ahmed',30,7,3),(84,'Ramesh Kumar',34,7,4),(85,'Ajith Kumar',4,8,1),(86,'Francis Xavier',6,8,2),(87,'Niyas Mohammed',8,8,3),(88,'Rajesh Kumar',11,8,4),(89,'Dominic Paul',13,8,5),(90,'Suresh Raj',16,8,2),(91,'Ameenullah',19,8,3),(92,'Mohan Kumar',22,8,4),(93,'Peter Antony',24,8,5),(94,'Senthil Vel',28,8,1),(95,'Shamsudeen',31,8,3),(96,'Girish Kumar',35,8,4),(97,'Prakash Kumar',3,9,1),(98,'Alwin Joseph',5,9,2),(99,'Nazeer Hussain',7,9,3),(100,'Raghavendra',10,9,4),(101,'Michael George',12,9,5),(102,'Vigneshwaran',15,9,2),(103,'Aslam Khan',18,9,3),(104,'Kumaravel',21,9,4),(105,'John Peter',23,9,5),(106,'Aravind Raj',27,9,1),(107,'Sulaiman',30,9,3),(108,'Baskar Kumar',34,9,4),(109,'Sanjay Kumar',3,5,1),(110,'Alex Martin',5,5,2),(111,'Abdul Rahim',7,5,3),(112,'Muthukumar',10,5,4),(113,'Robert James',12,5,5),(114,'Kannan Vel',15,5,2),(115,'Sameer Khan',18,5,3),(116,'Arun Prasad',21,5,4),(117,'Joseph David',23,5,5),(118,'Sathya Raj',27,5,1),(119,'Faisal Ahmed',30,5,3),(120,'Praveen Kumar',34,5,4),(121,'Rajkumar',3,10,1),(122,'Jerin Paul',5,10,2),(123,'Niyas Ahmed',7,10,3),(124,'Senthil Kumar',10,10,4),(125,'Anthony Raj',12,10,5),(126,'Karthick Vel',15,10,2),(127,'Shahul Hameed',18,10,3),(128,'Balamurugan',21,10,4),(129,'Peter Louis',23,10,5),(130,'Sivaprakash',27,10,1),(131,'Faheem Akbar',30,10,3),(132,'Madhan Kumar',34,10,4),(133,'Arul Raj',4,11,1),(134,'Felix John',6,11,2),(135,'Junaid Khan',8,11,3),(136,'Ramesh Babu',11,11,4),(137,'Clifford Paul',13,11,5),(138,'Sathish Kumar',16,11,2),(139,'Azeemullah',19,11,3),(140,'Karthi Raj',22,11,4),(141,'Joseph Antony',24,11,5),(142,'Gopinath',28,11,1),(143,'Shahid Ali',31,11,3),(144,'Sarath Kumar',35,11,4),(145,'Pravin Kumar',3,12,1),(146,'Stephen Raj',5,12,2),(147,'Ameer Hussain',7,12,3),(148,'Thiyagarajan',10,12,4),(149,'Martin Joseph',12,12,5),(150,'Ravi Shankar',15,12,2),(151,'Sulaiman Khan',18,12,3),(152,'Arun Kumar',21,12,4),(153,'Benedict Paul',23,12,5),(154,'Naveen Raj',27,12,1),(155,'Yasir Rahman',30,12,3),(156,'Selvakumar',34,12,4),(157,'Hariharan',4,13,1),(158,'John Michael',6,13,2),(159,'Nawaz Ali',8,13,3),(160,'Murugan',11,13,4),(161,'Thomas Paul',13,13,5),(162,'Kannan Raj',16,13,2),(163,'Riyaz Ahmed',19,13,3),(164,'Bharath Kumar',22,13,4),(165,'Antony David',24,13,5),(166,'Suresh Vel',28,13,1),(167,'Zakir Hussain',31,13,3),(168,'Rajasekar',35,13,4),(169,'Kannan Kumar',3,14,1),(170,'Isaac John',5,14,2),(171,'Imthiyas Ali',7,14,3),(172,'Ganesan',10,14,4),(173,'Paulraj',12,14,5),(174,'Muthukumar',15,14,2),(175,'Rashid Khan',18,14,3),(176,'Selvam',21,14,4),(177,'Joseph Selvan',23,14,5),(178,'Aravind',27,14,1),(179,'Nizamuddin',30,14,3),(180,'Raja Kumar',34,14,4),(181,'Manikandan',4,15,1),(182,'Santhosh Paul',6,15,2),(183,'Salman Ameer',8,15,3),(184,'Ravichandran',11,15,4),(185,'James Robert',13,15,5),(186,'Karthi Raj',16,15,2),(187,'Feroz Khan',19,15,3),(188,'Prabhu Kumar',22,15,4),(189,'Antony Sam',24,15,5),(190,'Gowtham',28,15,1),(191,'Irfan Ahmed',31,15,3),(192,'Sivakumar',35,15,4),(193,'Raghul Kumar',3,1,1),(194,'Joel David',5,1,2),(195,'Afsar Ali',7,1,3),(196,'Sathish Raj',10,1,4),(197,'Michael Joseph',12,1,5),(198,'Vignesh Kumar',15,1,2),(199,'Imran Khan',18,1,3),(200,'Balaji',21,1,4),(201,'Antony Paul',23,1,5),(202,'Naveen Raj',27,1,1),(203,'Salman Rahman',30,1,3),(204,'Gopalakrishnan',34,1,4),(205,'Karthik Kumar',4,16,1),(206,'Samuel Raj',6,16,2),(207,'Nabeel Ahmed',8,16,3),(208,'Suresh Kumar',11,16,4),(209,'Christopher Paul',13,16,5),(210,'Lokesh Raj',16,16,2),(211,'Faisal Hussain',19,16,3),(212,'Prakash',22,16,4),(213,'Andrew Thomas',24,16,5),(214,'Gokul Raj',28,16,1),(215,'Yusuf Ali',31,16,3),(216,'Saravanan',35,16,4),(217,'Mary Agnes',3,17,1),(218,'Anitha Raj',5,17,2),(219,'Fathima Noor',7,17,3),(220,'Divya Lakshmi',10,17,4),(221,'Jennifer Paul',12,17,5),(222,'Keerthana',15,17,2),(223,'Ayesha Begum',18,17,3),(224,'Meenakshi',21,17,4),(225,'Christina Mary',23,17,5),(226,'Nithya',27,17,1),(227,'Salma Banu',30,17,3),(228,'Revathi',34,17,4),(229,'Pavithra',4,18,1),(230,'Ruth Mary',6,18,2),(231,'Nazia Sultana',8,18,3),(232,'Sangeetha',11,18,4),(233,'Angela Rose',13,18,5),(234,'Deepika',16,18,2),(235,'Hiba Rahman',19,18,3),(236,'Kavitha',22,18,4),(237,'Merlin Joseph',24,18,5),(238,'Sandhiya',28,18,1),(239,'Yasmin',31,18,3),(240,'Anupriya',35,18,4),(241,'Theresa',3,19,1),(242,'Karthika',5,19,2),(243,'Sana Parveen',7,19,3),(244,'Priyanka',10,19,4),(245,'Esther Mary',12,19,5),(246,'Lavanya',15,19,2),(247,'Farzana',18,19,3),(248,'Rajalakshmi',21,19,4),(249,'Catherine',23,19,5),(250,'Monisha',27,19,1),(251,'Amina',30,19,3),(252,'Harini',34,19,4),(253,'Bhavani',4,23,1),(254,'Riya Joseph',6,23,2),(255,'Sofia Begum',8,23,3),(256,'Malathi',11,23,4),(257,'Helena',13,23,5),(258,'Yamuna',16,23,2),(259,'Nusrat',19,23,3),(260,'Poornima',22,23,4),(261,'Maria',24,23,5),(262,'Janani',28,23,1),(263,'Shabana',31,23,3),(264,'Kalpana',35,23,4),(265,'Anjali',3,22,1),(266,'Celine Mary',5,22,2),(267,'Sana Khan',7,22,3),(268,'Deepthi',10,22,4),(269,'Roselin',12,22,5),(270,'Kowsalya',15,22,2),(271,'Amina Begum',18,22,3),(272,'Sharmila',21,22,4),(273,'Judith',23,22,5),(274,'Monika',27,22,1),(275,'Farheen',30,22,3),(276,'Revathi',34,22,4),(277,'Kavya',4,20,1),(278,'Agnes Mary',6,20,2),(279,'Nafisa',8,20,3),(280,'Soundarya',11,20,4),(281,'Angelina',13,20,5),(282,'Keerthi',16,20,2),(283,'Bushra',19,20,3),(284,'Uma',22,20,4),(285,'Therese',24,20,5),(286,'Sathya',28,20,1),(287,'Rihana',31,20,3),(288,'Meena',35,20,4),(289,'Haritha',3,21,1),(290,'Gloria',5,21,2),(291,'Asma',7,21,3),(292,'Mahalakshmi',10,21,4),(293,'Clara',12,21,5),(294,'Preethi',15,21,2),(295,'Sameera',18,21,3),(296,'Selvi',21,21,4),(297,'Maria',23,21,5),(298,'Dhivya',27,21,1),(299,'Rukaiya',30,21,3),(300,'Karpagam',34,21,4);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsors`
--

DROP TABLE IF EXISTS `sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsors` (
  `sponsor_id` int NOT NULL AUTO_INCREMENT,
  `sponsor_name` varchar(150) NOT NULL,
  PRIMARY KEY (`sponsor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsors`
--

LOCK TABLES `sponsors` WRITE;
/*!40000 ALTER TABLE `sponsors` DISABLE KEYS */;
INSERT INTO `sponsors` VALUES (1,'Mr. Kathiravan – Traffic Department (VOC Port)'),(2,'Mr. Muthu Selvam – Traffic Department (VOC Port)'),(3,'Mr. Jude Ranjith – Traffic Department (VOC Port)'),(4,'Mr. Michael Raj – Traffic Department (VOC Port)'),(5,'Mr. Abbas – Traffic Department (VOC Port)'),(6,'Mr. W. Ramesh – Traffic Department (VOC Port)'),(7,'Mr. V. Dinesh Kumar – Traffic Department (VOC Port)'),(8,'Mr. Jayakumar – Traffic Department (VOC Port)'),(9,'Mr. S. Balakrishnan – Traffic Department (VOC Port)'),(10,'Mr. Anandhamurugan – Traffic Department (VOC Port)'),(11,'Mr. M. Saravana Kumar – Traffic Department (VOC Port)'),(12,'Mr. K. Subramaniyam – Traffic Department (VOC Port)'),(13,'Mr. Manikandan – Traffic Department (VOC Port)'),(14,'Mr. Dougles Ponraj – Traffic Department (VOC Port)'),(15,'Mr. Asik – Mavericks Basketball Club'),(16,'Mr. Raja – Customs'),(17,'Mr. Senthil – VOC Port'),(18,'Mr. Dushi – Retired VOC Port'),(19,'Mr. Jothimani – EB Department'),(20,'Mr. B. Santhosh – VOC Port'),(21,'Mr. B. Ramesh – VOC Port'),(22,'Titan Showroom'),(23,'Mr. Raja – Sudha Gas'),(24,'Mr. Packiyam – Annai Vellankanni Boat Owner'),(25,'Sigaram Cold Storage'),(26,'Delight Public School'),(27,'Origin Club A/C'),(28,'F. Selvakumar'),(29,'F. Selvakumar Special Prize Sponsor'),(30,'F. Selva Kumar (Sponsors)'),(31,'Kanagavel (Sponsors)'),(32,'Packiyam (Annai Velankanni Boat)'),(33,'Selvakumar (R.K Mutton Stall)'),(34,'Rajkumar (R.K Mutton Stall)'),(35,'Besil'),(36,'Rajwin'),(37,'Rajwin (Sponsor)'),(38,'Habib'),(39,'Chinnathamby (Advocate)'),(40,'Chinna (Advocate)'),(41,'Nagaraj (Police)'),(42,'Siva (Advocate)'),(43,'Ramkumar (Sponsors)'),(44,'Sam Issac David (Sharon Motors)'),(45,'Origin Kidz Skool'),(46,'Senthil (Port)'),(47,'Sheik (Dubai)'),(48,'Raja (Sudha Gas)'),(49,'Sahul (Banu Mobiles)'),(50,'Kingston (CCGW)'),(51,'Delight Public School (CBSE)'),(52,'Titan Showroom'),(53,'Durai Raj – Sri Surabhi Impacts'),(54,'Velraj'),(55,'Joseph (Tea Stall)'),(56,'Prem (VM Promoters)'),(57,'Aswin (Chicken)'),(58,'Stadium Basketball Club'),(59,'Boys Collection - Samsuthin'),(60,'Nixon Christopher'),(61,'Anandha Vel – Shipping Company'),(62,'Sigaram Cold Storage'),(63,'Samson - Bar'),(64,'Jothi (TNEB)'),(65,'Ramesh (Port)'),(66,'Santhosh (Port)'),(67,'Sathya Sankar (YBC)'),(68,'Messiah (TNEB)'),(69,'Raj Kumar (ICF)'),(70,'Classic Basketball Club'),(71,'Selvam (Chicken)'),(72,'Ashok (Eby Friend)'),(73,'Ajay (Hosur)'),(74,'Jeyaseelan'),(75,'Siva - Bar'),(76,'Ragland'),(77,'Siva (Eby Friend)'),(78,'Bala (Sharon Autos)'),(79,'Ramesh (Advocate)'),(80,'Karupu (Police)'),(81,'Rajesh (Steel)'),(82,'Dubai Mobiles - Ismail'),(83,'Jenifer (Eby Friend)'),(84,'Suresh (Power Plant)'),(85,'Dushi (Port Trust)'),(86,'Godson (Oliver Autos – Eral)');
/*!40000 ALTER TABLE `sponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `team_name` varchar(150) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `group_name` varchar(10) DEFAULT NULL,
  `gender_id` int DEFAULT NULL,
  `tournament_id` int DEFAULT NULL,
  PRIMARY KEY (`team_id`),
  KEY `gender_id` (`gender_id`),
  KEY `tournament_id` (`tournament_id`),
  CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`gender_id`) REFERENCES `gender_categories` (`gender_id`),
  CONSTRAINT `teams_ibfk_2` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Kamala Subramaniam','Tanjore','A',1,1),(2,'Crescent','Tuticorin','A',1,1),(3,'Velammal','Chennai','B',1,1),(4,'MSP','Dindugal','B',1,1),(5,'MDT','Thirunelveli','C',1,1),(6,'Perks','Coimbatore','C',1,1),(7,'CSMA','Dindugal','D',1,1),(8,'LaSalle','Tuticorin','D',1,1),(9,'St. Thomas','Tuticorin','A',1,1),(10,'Britto','Madurai','B',1,1),(11,'St. Xavier','Tuticorin','C',1,1),(12,'Carmel','Nagercoil','D',1,1),(13,'LMS','Nagercoil','A',1,1),(14,'Alagar','Tuticorin','B',1,1),(15,'SDAT Theni','Theni','C',1,1),(16,'Kamala Subramaniam CBSE','Tanjore','D',1,1),(17,'Holy Cross','Tuticorin','A',2,1),(18,'NSVV','Pattiveerampatti','A',2,1),(19,'St. Joseph','Salem','A',2,1),(20,'Rajendra','Erode','B',2,1),(21,'St. Ignatius','Thirunelveli','B',2,1),(22,'St. Thomas','Tuticorin','B',2,1),(23,'Subbiah Vidhyalayam','Tuticorin','A',2,1);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournaments`
--

DROP TABLE IF EXISTS `tournaments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournaments` (
  `tournament_id` int NOT NULL AUTO_INCREMENT,
  `tournament_name` varchar(150) NOT NULL,
  `edition` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `venue_id` int DEFAULT NULL,
  PRIMARY KEY (`tournament_id`),
  KEY `venue_id` (`venue_id`),
  CONSTRAINT `tournaments_ibfk_1` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`venue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournaments`
--

LOCK TABLES `tournaments` WRITE;
/*!40000 ALTER TABLE `tournaments` DISABLE KEYS */;
INSERT INTO `tournaments` VALUES (1,'Origin Basketball Club State Level Invitational Tournament','6th State Level','2024-01-27','2024-01-31',1);
/*!40000 ALTER TABLE `tournaments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_league_outcomes`
--

DROP TABLE IF EXISTS `v_league_outcomes`;
/*!50001 DROP VIEW IF EXISTS `v_league_outcomes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_league_outcomes` AS SELECT 
 1 AS `match_id`,
 1 AS `tournament_id`,
 1 AS `gender_id`,
 1 AS `stage_id`,
 1 AS `match_date`,
 1 AS `team_id`,
 1 AS `points_scored`,
 1 AS `points_conceded`,
 1 AS `is_win`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_league_points_table`
--

DROP TABLE IF EXISTS `v_league_points_table`;
/*!50001 DROP VIEW IF EXISTS `v_league_points_table`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_league_points_table` AS SELECT 
 1 AS `team_name`,
 1 AS `gender_name`,
 1 AS `matches_played`,
 1 AS `wins`,
 1 AS `losses`,
 1 AS `points_for`,
 1 AS `points_against`,
 1 AS `point_difference`,
 1 AS `points`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_team_match_outcomes`
--

DROP TABLE IF EXISTS `v_team_match_outcomes`;
/*!50001 DROP VIEW IF EXISTS `v_team_match_outcomes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_team_match_outcomes` AS SELECT 
 1 AS `match_id`,
 1 AS `tournament_id`,
 1 AS `gender_id`,
 1 AS `stage_id`,
 1 AS `match_date`,
 1 AS `team_id`,
 1 AS `points_scored`,
 1 AS `points_conceded`,
 1 AS `is_win`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `venues`
--

DROP TABLE IF EXISTS `venues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venues` (
  `venue_id` int NOT NULL AUTO_INCREMENT,
  `venue_name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  PRIMARY KEY (`venue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venues`
--

LOCK TABLES `venues` WRITE;
/*!40000 ALTER TABLE `venues` DISABLE KEYS */;
INSERT INTO `venues` VALUES (1,'SDAT Stadium','Thoothukudi');
/*!40000 ALTER TABLE `venues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `v_league_outcomes`
--

/*!50001 DROP VIEW IF EXISTS `v_league_outcomes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_league_outcomes` AS select `v_team_match_outcomes`.`match_id` AS `match_id`,`v_team_match_outcomes`.`tournament_id` AS `tournament_id`,`v_team_match_outcomes`.`gender_id` AS `gender_id`,`v_team_match_outcomes`.`stage_id` AS `stage_id`,`v_team_match_outcomes`.`match_date` AS `match_date`,`v_team_match_outcomes`.`team_id` AS `team_id`,`v_team_match_outcomes`.`points_scored` AS `points_scored`,`v_team_match_outcomes`.`points_conceded` AS `points_conceded`,`v_team_match_outcomes`.`is_win` AS `is_win` from `v_team_match_outcomes` where (`v_team_match_outcomes`.`stage_id` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_league_points_table`
--

/*!50001 DROP VIEW IF EXISTS `v_league_points_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_league_points_table` AS select `t`.`team_name` AS `team_name`,`gc`.`gender_name` AS `gender_name`,count(0) AS `matches_played`,sum(`v`.`is_win`) AS `wins`,(count(0) - sum(`v`.`is_win`)) AS `losses`,sum(`v`.`points_scored`) AS `points_for`,sum(`v`.`points_conceded`) AS `points_against`,(sum(`v`.`points_scored`) - sum(`v`.`points_conceded`)) AS `point_difference`,(sum(`v`.`is_win`) * 2) AS `points` from ((`v_league_outcomes` `v` join `teams` `t` on((`v`.`team_id` = `t`.`team_id`))) join `gender_categories` `gc` on((`v`.`gender_id` = `gc`.`gender_id`))) group by `t`.`team_name`,`gc`.`gender_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_team_match_outcomes`
--

/*!50001 DROP VIEW IF EXISTS `v_team_match_outcomes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_team_match_outcomes` AS select `m`.`match_id` AS `match_id`,`m`.`tournament_id` AS `tournament_id`,`m`.`gender_id` AS `gender_id`,`m`.`stage_id` AS `stage_id`,`m`.`match_date` AS `match_date`,`m`.`team1_id` AS `team_id`,`r`.`team1_score` AS `points_scored`,`r`.`team2_score` AS `points_conceded`,(case when (`r`.`winner_team_id` = `m`.`team1_id`) then 1 else 0 end) AS `is_win` from (`matches` `m` join `match_results` `r` on((`m`.`match_id` = `r`.`match_id`))) union all select `m`.`match_id` AS `match_id`,`m`.`tournament_id` AS `tournament_id`,`m`.`gender_id` AS `gender_id`,`m`.`stage_id` AS `stage_id`,`m`.`match_date` AS `match_date`,`m`.`team2_id` AS `team_id`,`r`.`team2_score` AS `points_scored`,`r`.`team1_score` AS `points_conceded`,(case when (`r`.`winner_team_id` = `m`.`team2_id`) then 1 else 0 end) AS `is_win` from (`matches` `m` join `match_results` `r` on((`m`.`match_id` = `r`.`match_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-24 15:31:26
