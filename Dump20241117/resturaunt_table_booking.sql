-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: resturaunt
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `table_booking`
--

DROP TABLE IF EXISTS `table_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `booking_date` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `admin_id` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `table_id` bigint DEFAULT NULL,
  `approval_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKo9uc0mpsqm6gtxd9cnoivsl1y` (`admin_id`),
  KEY `FKp3bt5847bfqjdps6f6ne91era` (`customer_id`),
  KEY `FK7x0fmqm2hpa8ml01t8fraiwjp` (`table_id`),
  CONSTRAINT `FK7x0fmqm2hpa8ml01t8fraiwjp` FOREIGN KEY (`table_id`) REFERENCES `tables` (`id`),
  CONSTRAINT `FKo9uc0mpsqm6gtxd9cnoivsl1y` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKp3bt5847bfqjdps6f6ne91era` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_booking`
--

LOCK TABLES `table_booking` WRITE;
/*!40000 ALTER TABLE `table_booking` DISABLE KEYS */;
INSERT INTO `table_booking` VALUES (20,'2024-09-29 17:49:11.544233','APPROVED',1,2,2,'2024-09-29 17:54:42.798506'),(21,'2024-09-29 17:55:26.114192','REJECTED',1,2,4,NULL),(22,'2024-09-29 17:55:26.789689','REJECTED',1,2,7,NULL),(23,'2024-09-29 17:56:24.869171','APPROVED',1,2,7,'2024-09-29 17:56:29.041042'),(24,'2024-09-29 17:59:01.441206','PENDING',NULL,2,3,NULL),(25,'2024-09-30 17:40:29.893840','PENDING',NULL,2,5,NULL);
/*!40000 ALTER TABLE `table_booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-17 19:20:13
