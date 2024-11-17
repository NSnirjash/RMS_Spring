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
-- Table structure for table `order_food`
--

DROP TABLE IF EXISTS `order_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_food` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notes` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `total_price` double NOT NULL,
  `admin_id` bigint DEFAULT NULL,
  `staff_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKeen81vsxk3nq6tvmhetwh6kx6` (`admin_id`),
  KEY `FKep1m0f5fvajjewx3n2jnddxnj` (`staff_id`),
  KEY `FK23nh1g8lnaphjg1f0vx5oho4c` (`user_id`),
  CONSTRAINT `FK23nh1g8lnaphjg1f0vx5oho4c` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKeen81vsxk3nq6tvmhetwh6kx6` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKep1m0f5fvajjewx3n2jnddxnj` FOREIGN KEY (`staff_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_food`
--

LOCK TABLES `order_food` WRITE;
/*!40000 ALTER TABLE `order_food` DISABLE KEYS */;
INSERT INTO `order_food` VALUES (3,NULL,'APPROVED',880,1,5,2),(4,NULL,'APPROVED',900,1,5,2),(5,NULL,'REJECTED',1900,1,NULL,2),(6,NULL,'REJECTED',380,1,NULL,3),(7,NULL,'PENDING',500,NULL,NULL,1);
/*!40000 ALTER TABLE `order_food` ENABLE KEYS */;
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
