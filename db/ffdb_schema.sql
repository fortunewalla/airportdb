-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: ffdb
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ffdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ffdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ffdb`;

--
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `airline_id` smallint NOT NULL AUTO_INCREMENT,
  `iata` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `airlinename` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_airport` smallint NOT NULL,
  PRIMARY KEY (`airline_id`),
  UNIQUE KEY `iata_unq` (`iata`),
  KEY `heimat_idx` (`base_airport`),
  CONSTRAINT `fluglinie_ibfk_1` FOREIGN KEY (`base_airport`) REFERENCES `airport` (`airport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flughafen DB by Stefan Pröll, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `airplane`
--

DROP TABLE IF EXISTS `airplane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airplane` (
  `airplane_id` int NOT NULL AUTO_INCREMENT,
  `capacity` mediumint unsigned NOT NULL,
  `type_id` int NOT NULL,
  `airline_id` int NOT NULL,
  PRIMARY KEY (`airplane_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5584 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flughafen DB by Stefan Pröll, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `airplane_type`
--

DROP TABLE IF EXISTS `airplane_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airplane_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`type_id`),
  FULLTEXT KEY `bezeichnung_full` (`identifier`,`description`)
) ENGINE=MyISAM AUTO_INCREMENT=343 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flughafen DB by Stefan Pröll, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `airport_id` smallint NOT NULL AUTO_INCREMENT,
  `iata` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icao` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`airport_id`),
  UNIQUE KEY `icao_unq` (`icao`),
  KEY `name_idx` (`name`),
  KEY `iata_idx` (`iata`)
) ENGINE=InnoDB AUTO_INCREMENT=13598 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flughafen DB by Stefan Pröll, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `airport_geo`
--

DROP TABLE IF EXISTS `airport_geo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport_geo` (
  `airport_id` smallint NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` decimal(11,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `geolocation` point NOT NULL,
  KEY `flughafen_idx` (`airport_id`),
  SPATIAL KEY `geolokation_spt` (`geolocation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flughafen DB by Stefan Pröll, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `airport_reachable`
--

DROP TABLE IF EXISTS `airport_reachable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport_reachable` (
  `airport_id` int NOT NULL,
  `hops` int DEFAULT NULL,
  PRIMARY KEY (`airport_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flughafen DB by Stefan Pröll, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `flight_id` int NOT NULL,
  `seat` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passenger_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`booking_id`),
  UNIQUE KEY `sitzplan_unq` (`flight_id`,`seat`),
  KEY `flug_idx` (`flight_id`),
  KEY `passagier_idx` (`passenger_id`),
  CONSTRAINT `buchung_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`),
  CONSTRAINT `buchung_ibfk_2` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55099781 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flughafen DB by Stefan Pröll, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` smallint NOT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailaddress` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephoneno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `department` enum('Marketing','Accounting','Management','Logistics','Airfield') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `benutzer_unq` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flughafen DB by Stefan Pröll, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `flight_id` int NOT NULL AUTO_INCREMENT,
  `flightno` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` smallint NOT NULL,
  `to` smallint NOT NULL,
  `departure` datetime NOT NULL,
  `arrival` datetime NOT NULL,
  `airline_id` smallint NOT NULL,
  `airplane_id` int NOT NULL,
  PRIMARY KEY (`flight_id`),
  KEY `von_idx` (`from`),
  KEY `nach_idx` (`to`),
  KEY `abflug_idx` (`departure`),
  KEY `ankunft_idx` (`arrival`),
  KEY `fluglinie_idx` (`airline_id`),
  KEY `flugzeug_idx` (`airplane_id`),
  CONSTRAINT `flug_ibfk_1` FOREIGN KEY (`from`) REFERENCES `airport` (`airport_id`),
  CONSTRAINT `flug_ibfk_2` FOREIGN KEY (`to`) REFERENCES `airport` (`airport_id`),
  CONSTRAINT `flug_ibfk_3` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`airline_id`),
  CONSTRAINT `flug_ibfk_4` FOREIGN KEY (`airplane_id`) REFERENCES `airplane` (`airplane_id`)
) ENGINE=InnoDB AUTO_INCREMENT=503856 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flughafen DB by Stefan Pröll, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flight_log`
--

DROP TABLE IF EXISTS `flight_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_log` (
  `log_date` datetime NOT NULL,
  `user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `flight_id` int NOT NULL,
  `flightno_old` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `flightno_new` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_old` smallint NOT NULL,
  `to_old` smallint NOT NULL,
  `from_new` smallint NOT NULL,
  `to_new` smallint NOT NULL,
  `departure_old` datetime NOT NULL,
  `arrival_old` datetime NOT NULL,
  `departure_new` datetime NOT NULL,
  `arrival_new` datetime NOT NULL,
  `airplane_id_old` int NOT NULL,
  `airplane_id_new` int NOT NULL,
  `airline_id_old` smallint NOT NULL,
  `airline_id_new` smallint NOT NULL,
  `comment` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flughafen DB by Stefan Pröll, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flightschedule`
--

DROP TABLE IF EXISTS `flightschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flightschedule` (
  `flightno` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` smallint NOT NULL,
  `to` smallint NOT NULL,
  `departure` time NOT NULL,
  `arrival` time NOT NULL,
  `airline_id` smallint NOT NULL,
  `monday` tinyint(1) DEFAULT '0',
  `tuesday` tinyint(1) DEFAULT '0',
  `wednesday` tinyint(1) DEFAULT '0',
  `thursday` tinyint(1) DEFAULT '0',
  `friday` tinyint(1) DEFAULT '0',
  `saturday` tinyint(1) DEFAULT '0',
  `sunday` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`flightno`),
  KEY `von_idx` (`from`),
  KEY `nach_idx` (`to`),
  KEY `fluglinie_idx` (`airline_id`),
  CONSTRAINT `flugplan_ibfk_1` FOREIGN KEY (`from`) REFERENCES `airport` (`airport_id`),
  CONSTRAINT `flugplan_ibfk_2` FOREIGN KEY (`to`) REFERENCES `airport` (`airport_id`),
  CONSTRAINT `flugplan_ibfk_3` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`airline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flughafen DB by Stefan Pröll, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `passenger_id` int NOT NULL AUTO_INCREMENT,
  `passportno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`passenger_id`),
  UNIQUE KEY `pass_unq` (`passportno`)
) ENGINE=InnoDB AUTO_INCREMENT=36100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flughafen DB by Stefan Pröll, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passengerdetails`
--

DROP TABLE IF EXISTS `passengerdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengerdetails` (
  `passenger_id` int NOT NULL,
  `birthdate` date NOT NULL,
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` smallint NOT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailaddress` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephoneno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`passenger_id`),
  CONSTRAINT `passagierdetails_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flughafen DB by Stefan Pröll, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weatherdata`
--

DROP TABLE IF EXISTS `weatherdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weatherdata` (
  `log_date` date NOT NULL,
  `time` time NOT NULL,
  `station` int NOT NULL,
  `temp` decimal(3,1) NOT NULL,
  `humidity` decimal(4,1) NOT NULL,
  `airpressure` decimal(10,2) NOT NULL,
  `wind` decimal(5,2) NOT NULL,
  `weather` enum('fog-snowfall','snowfall','rain','rain-snowfall','fog-rain','fog-rain-thunderstorm','thunderstorm','fog','rain-thunderstorm') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `winddirection` smallint NOT NULL,
  PRIMARY KEY (`log_date`,`time`,`station`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Flughafen DB by Stefan Pröll, Eva Zangerle, Wolfgang Gassler is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'ffdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-07  9:59:13
