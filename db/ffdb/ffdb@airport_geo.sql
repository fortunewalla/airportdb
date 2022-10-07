-- MySQLShell dump 2.0.1  Distrib Ver 8.0.30 for Linux on x86_64 - for MySQL 8.0.30 (MySQL Community Server (GPL)), for Linux (x86_64)
--
-- Host: localhost    Database: ffdb    Table: airport_geo
-- ------------------------------------------------------
-- Server version	8.0.30

--
-- Table structure for table `airport_geo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `airport_geo` (
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
