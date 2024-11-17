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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `role` enum('ADMIN','USER','WAITER') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UKr53o2ojjw4fikudfnsuuga336` (`password`),
  UNIQUE KEY `UKdu5v5sr43g5bfnji4vb8hg5s3` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,_binary '','Kathalbagan, Dhaka','shahriyarnirjash1996@gmail.com',NULL,'Shahriyar Nirjash','$2a$10$saYs4xMJKY.mhQoTxib1wOLV/aZ7RAuSDnYB/la6xmHW2OAxwHgvq','01784054171','ADMIN'),(2,_binary '','Kathalbagan, Dhaka','nasif.s.nirjash96@gmail.com',NULL,'Nasif Shahriar','$2a$10$D1BQAWN82ZFjOSewr1.8xONpUGTBc51KPHJiIUUyholiH5bwBARpO','01303547093','USER'),(3,_binary '','Agargaon','rafiqulrazuidb59@gmail.com','','Rafiqul ISlam','$2a$10$JeT2v27JX3PXmNe2JEk6bOzgfq/pGa/l0N9J6SjVS9kgP9ZszY47C','01775805206','USER'),(4,_binary '','Agargaon','nayamulislam@gmail.com','','nayamul Islam','$2a$10$cRW72WYe2QdjWO544Yh8AucEmjXnd6Edow.kZdbv4cRj4G2cpQR/2','01303547095','WAITER'),(5,_binary '\0','Mohammadpur','rahman.f.sadiqur@gmail.com','','Sadiqur Rahman','$2a$10$VlAqa47ZY8rHMV.t4B63c.s.Cugt7vd2PXP0DreHu9r.Yu1rNAIP6','01710938092','WAITER'),(6,_binary '\0','Kathalbagan, Dhaka','aaaaaa@gmail.com',NULL,'aaaaaaaa','$2a$10$5/lQqEqUApPTZarh923R3uEihdVjuzHm1Zsle2L/AdObZQuzTrwfC','01784054571','USER'),(7,_binary '\0','fdefdf','fdfdsfdf@fbfgv.tghftg',NULL,'fsfsdfdf','$2a$10$jeRFRt1JujLbiQfEmVtOC.6lFDwFYQTDi.2DJoJAoI4kfVI7Rx12W','63536786378','USER'),(8,_binary '\0','asdfghjkl','neyamul@gmail.com',NULL,'Mr. Neyamul Islam','$2a$10$1nCM0ntWFDcUiHL/AGI6tu8fcF9oFGgAsM4txUO5fMf2P/vAceMMG','96325874125','USER'),(9,_binary '\0','grgtert','aaaaa@aaaa.aaa',NULL,'aaaaaaaa','$2a$10$VOohZi6IZEZK65yDQR1yauKNk79pDUY7cR5t.pWAfUhLC80LtKP/S','159623487895','USER');
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

-- Dump completed on 2024-11-17 19:20:13
