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
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bill_date` datetime(6) NOT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `total_amount` double NOT NULL,
  `order_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `admin_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK575bqi2iwedxvaiwo0mbg60cp` (`order_id`),
  KEY `FKk8vs7ac9xknv5xp18pdiehpp1` (`user_id`),
  KEY `FKq0n4pj8my3wrumxgw1c91i65v` (`admin_id`),
  CONSTRAINT `FKecri4b3uflcfgk69y3wvnyq8s` FOREIGN KEY (`order_id`) REFERENCES `order_food` (`id`),
  CONSTRAINT `FKk8vs7ac9xknv5xp18pdiehpp1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKq0n4pj8my3wrumxgw1c91i65v` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKrfbvkrffamfql7cjmen8v976v` (`email`),
  UNIQUE KEY `UKm3iom37efaxd5eucmxjqqcbe9` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `available` bit(1) NOT NULL,
  `category` varchar(50) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKlmnpdno9yst912bustvp4vuyr` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (1,_binary '','Fast Food','15a5579f-f82f-414c-bb13-4bb9f8cfd9ab_pasta.jpg','Pasta',99.99),(2,_binary '','Main Course','e2ca467c-9889-4204-be0d-e21f8bd32472_muttonBiryani.jpg','Mutton Biryani',450),(4,_binary '','Fast Food','96e6bfa7-f1d9-4027-9898-463d7b340783_pizza.jpg','Pizza',250),(5,_binary '','Main Course','3f197ee2-74a1-44e1-bde5-7f693098226d_BeefBiryani.jpg','Beaf Biryani',550),(6,_binary '','Fast Food','101a72da-7b47-4a92-ba0f-cba96a297114_ChickenBurger.jpg','Chicken Burger',250),(7,_binary '','Fast Food','fc03fefd-def9-4af1-8350-f6905af07c6b_ClubSandwich.jpg','Club Sandwich',180),(8,_binary '','Main Course','cb18eef7-69f8-4567-ae08-ffbf1fbef113_VegetableBiryani.jpg','Vegetable Biryani',320),(9,_binary '','Dessert','c0bc871b-2666-4f12-bee4-28b3784d12e6_upload.jpg','Cakes',150);
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `final_price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,150.5),(2,150.5),(3,150.5),(4,150.5),(5,150.5),(6,150.5),(7,150.5),(8,150.5),(9,150.5),(10,1099.98);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_food`
--

DROP TABLE IF EXISTS `order_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_food` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notes` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `status` varchar(255) NOT NULL,
  `total_price` double NOT NULL,
  `admin_id` bigint DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `order_details_id` bigint NOT NULL,
  `staff_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKeen81vsxk3nq6tvmhetwh6kx6` (`admin_id`),
  KEY `FK9nxt5klwvfrqf77wdbsve23xc` (`food_id`),
  KEY `FKky0s2neoka61132ir5jb5vlav` (`order_details_id`),
  KEY `FKep1m0f5fvajjewx3n2jnddxnj` (`staff_id`),
  KEY `FK23nh1g8lnaphjg1f0vx5oho4c` (`user_id`),
  CONSTRAINT `FK23nh1g8lnaphjg1f0vx5oho4c` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK9nxt5klwvfrqf77wdbsve23xc` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`),
  CONSTRAINT `FKeen81vsxk3nq6tvmhetwh6kx6` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKep1m0f5fvajjewx3n2jnddxnj` FOREIGN KEY (`staff_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKky0s2neoka61132ir5jb5vlav` FOREIGN KEY (`order_details_id`) REFERENCES `order_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_food`
--

LOCK TABLES `order_food` WRITE;
/*!40000 ALTER TABLE `order_food` DISABLE KEYS */;
INSERT INTO `order_food` VALUES (1,'Extra cheese',2,'PENDING',900,NULL,2,10,NULL,1),(2,'No croutons',2,'PENDING',199.98,NULL,1,10,NULL,1);
/*!40000 ALTER TABLE `order_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_approvals`
--

DROP TABLE IF EXISTS `table_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_approvals` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `approval_date` datetime(6) DEFAULT NULL,
  `approval_status` varchar(255) NOT NULL,
  `admin_id` bigint DEFAULT NULL,
  `booking_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK44wjr04mnbl1ju7swctq4q9js` (`booking_id`),
  KEY `FKgcv9v3ocqn8wn9huc937lip2f` (`admin_id`),
  CONSTRAINT `FK6ffbgi3b0obmjb79v5097rto9` FOREIGN KEY (`booking_id`) REFERENCES `table_booking` (`id`),
  CONSTRAINT `FKgcv9v3ocqn8wn9huc937lip2f` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_approvals`
--

LOCK TABLES `table_approvals` WRITE;
/*!40000 ALTER TABLE `table_approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_approvals` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `capacity` int NOT NULL,
  `status` varchar(50) NOT NULL,
  `table_number` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKfjmmqyocmsfsje61iybqifd96` (`table_number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` VALUES (1,2,'AVAILABLE','T1'),(2,4,'BOOKED','T2'),(3,6,'AVAILABLE','T3'),(4,4,'AVAILABLE','T4'),(5,6,'AVAILABLE','T5'),(6,4,'AVAILABLE','T6'),(7,2,'BOOKED','T7'),(10,2,'AVAILABLE','T10');
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_logged_out` bit(1) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj8rfw4x0wjjyibfqq566j4qng` (`user_id`),
  CONSTRAINT `FKj8rfw4x0wjjyibfqq566j4qng` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3MjY2ODQ0NzEsImV4cCI6MTcyNjc3MDg3MX0.5Bfdr8KwNmPRjp8QYmB5FWj13KRQy9RQ-5OOlileg9PHovcRQqZ864Ali9NZf7BH',1),(2,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3MjY2ODQ1MDMsImV4cCI6MTcyNjc3MDkwM30.RXl_wGgKSHlU6_6BLBbqsH-m_IBSHW9SOuYTJz3zgw949H0cRbTRhZBeufwpukQ_',2),(3,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3MjY2ODYyMDUsImV4cCI6MTcyNjc3MjYwNX0.Ea7usqCSE9sMPWpbrjpDFwuxRhBvuglpHlCztX7-1Q7Qu4w1W4NDJtpae7dHfgA4',2),(4,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3MjY4NzE1NzgsImV4cCI6MTcyNjk1Nzk3OH0.4D7VOtAhVzolz3_cJthUk9JwAn1QI8kVOOR2cUIH8cLhg6k9DfyqP7Yx3Dgld7l4',2),(5,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3MjY4NzE2MTksImV4cCI6MTcyNjk1ODAxOX0.tYBaUS9Xdl8iiCA84xmqLbnQRsfBVnNuOSOyMO7WEBqu8inE2xqmuXqPMmHrbPPB',1),(6,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc1MTgwNDgsImV4cCI6MTcyNzYwNDQ0OH0.BD9yPu-RGc1tCr9OKbYckGxd55Wku0fFpxNlmzoNtqU4xvXUEe9_MjgY_RMeBu5M',1),(7,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc1MTk3NTQsImV4cCI6MTcyNzYwNjE1NH0.yaQN61AwT_dz1KxwcV61lrc5SmrjavKREMIH7XTbKgOwkTDsjPT_OEWYJs-cDhom',1),(8,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc1MjAwMDIsImV4cCI6MTcyNzYwNjQwMn0.qwFuvxPio7s9CU1A1SK81ugj5WCNrVEiq_vemXTKH1zyi0qkzCU6-2N-51x25AyD',1),(9,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc1MjM1MzYsImV4cCI6MTcyNzYwOTkzNn0.fIWeOlZ85AEXM4FESz2fPBQI4K9PEIE_gysnixLnROpeYQQzTRCUoq5nzeGmF6B-',1),(10,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVscmF6dWlkYjU5QGdtYWlsLmNvbSIsImlhdCI6MTcyNzUyNDM5NSwiZXhwIjoxNzI3NjEwNzk1fQ.y9GBSvUMgF_ixq6iNISbFEWQhVVfc39V3mQJl8SPS9qGdjOVD9hy1XzsXj_f7IjV',3),(11,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXlhbXVsaXNsYW1AZ21haWwuY29tIiwiaWF0IjoxNzI3NTI0NzI5LCJleHAiOjE3Mjc2MTExMjl9.EgpndpSBdwmy9-VwL5mwCK-GiMTnUAJ7Aq3--lvnMBXI26V_R5pkd1aF2V0vpuza',4),(12,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXlhbXVsaXNsYW1AZ21haWwuY29tIiwiaWF0IjoxNzI3NTI1MzYwLCJleHAiOjE3Mjc2MTE3NjB9.yoKxqbimiIQv9xzKJb-qGBHMiY1FMPm0m057S2EUI7yXoOQ1G2Ns89iaFGXDgLE1',4),(13,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc1MjY0MTEsImV4cCI6MTcyNzYxMjgxMX0.wCi7Ef66OSRTBaNHFuj_nyUTy5iZi-5XzanHizTMTDWS8o0CfBL2ht_ZsJlslaI-',2),(14,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MDQ1MTcsImV4cCI6MTcyNzY5MDkxN30.OjBRYmSqFfRtFWNW9msxrfy3I7M_PihP63-96wRPRonO6ZFngW8Z0sR9CVlkkira',2),(15,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MDQ1ODYsImV4cCI6MTcyNzY5MDk4Nn0.FDdK51uqnfIQk3XL0iSaqQWSqno6tzcYnxCu_oB3oYZjDJWRV3mb9cd2_YpqEice',2),(16,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MDUzNjEsImV4cCI6MTcyNzY5MTc2MX0.XCSNhB6_gMPhVaif3Bh3H_ebdUJcMHFzQhdWDNRG3JBk-LMV_GP4TJZrL7ITGZQ1',1),(17,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MDY1MDMsImV4cCI6MTcyNzY5MjkwM30.i7vudCT-CrxcZyGYqJrDtfzWd9QhZZ8UFdZIM_zxkZqfiY7GdopBlhaSA7OHlshA',1),(18,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MTA0MTgsImV4cCI6MTcyNzY5NjgxOH0.1t2KKurFj4T3wClhhKFBmIvxKTu0tqgtpK3Aeq6Z0Cwk5x8XqLPb2xXTvo38-DnF',2),(19,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MTA2MTUsImV4cCI6MTcyNzY5NzAxNX0.u5CNPQoEg-vi-tAJss39WrTksIy_i53l77qLUF-fdXBPjmLnuWtvgrpG-8wtsHx2',1),(20,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MTA5MTAsImV4cCI6MTcyNzY5NzMxMH0.yCNsLr-lYxwVJYP3WnQ-QCTvY2jtYa2FLCbemJwM1sXa59_LlyTkWd0Tx9QlelBx',2),(21,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MTQ1NjMsImV4cCI6MTcyNzcwMDk2M30.3VqCAra8x5DlYZ2U4fW14COP6hQzz6xxVJJ8xwSyGAsXA0xTKKCmARItt1pJ5AWO',1),(22,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2ODQ3NTYsImV4cCI6MTcyNzc3MTE1Nn0.p7gHWjwXJJfKTWbQFOeXSRNw3yAhnRypE9DnA4S5_PBezDTOC8LsR28zywyL4rN5',2),(23,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2ODUwMDEsImV4cCI6MTcyNzc3MTQwMX0.PfBKcDqC328QyIl-mL8mKytvb7GTGZvLSc8BdYq7M1eEWy1DL0vkF-8tGpfA38lX',1),(24,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2ODYxNDcsImV4cCI6MTcyNzc3MjU0N30.XvmOG-schwHDBLjfDl5XFQGgQs5YSI-oFw1l4GCBG_hQEhszj3ys07xaYwn2zG6e',2),(25,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2ODkxMjQsImV4cCI6MTcyNzc3NTUyNH0._iTNE61rC_dt76tiTK4fpSrj3kluqxTBuFC5MqXeb5FIhxb3qpiN5NRcXRUWJX2D',2),(26,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2ODk3NjAsImV4cCI6MTcyNzc3NjE2MH0.VEotBJorPziDbpZKx6G8Q2JxpNVwz8Up_6da96tDj6mNkGuzFJqmb6MNyAMuX0-D',2),(27,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTE1ODEsImV4cCI6MTcyNzc3Nzk4MX0.YJtwdB4pGdjl4T2huoI8XZyg6yk4L585HunlCRAibeq7w1rNbMqv7liekrGS_auj',2),(28,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTM5ODcsImV4cCI6MTcyNzc4MDM4N30.YwGBTpxfN8fxbSaLdGiTem-xXX_DLT4PQDbIacupnWTMA6dT9XX67VNgvRORnb3U',2),(29,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTUyNjAsImV4cCI6MTcyNzc4MTY2MH0.OzbSpmEOMmT6dEVGz9q7LEVZp_4ohWa7j9XGtNn0yM7WKuhVR7QDOrToQKcby1Vn',2),(30,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTcwNzMsImV4cCI6MTcyNzc4MzQ3M30.aUcuCxzvxHBf8SS1ySScY-o6up2clBBfX5GH3PTk1nr3K6FMSMoYyUu9O8SzEe4X',1),(31,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTc4MzMsImV4cCI6MTcyNzc4NDIzM30.xv65K9x8YJ0rEaU9xEiNb_eHkczmrLlXLQrb8x-As6RqYMgvz8FDWN9xxrcddX6B',1),(32,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTk1MTcsImV4cCI6MTcyNzc4NTkxN30.6Pqq2Kt4YYNsnkz0juDPtJ8A9W7ksHLCs2Jfoyd-UzRtqTvWvASJNDbdWL8eTvoE',2),(33,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTk1NTAsImV4cCI6MTcyNzc4NTk1MH0.I_Sv4x0wgW6wxCusuMUVr00VSB1JJK5J6FYLfa4P9W1IGDlPu4NJU1wcvpDpyd4A',1),(34,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTk3NjgsImV4cCI6MTcyNzc4NjE2OH0.hcvDV6KFhwB8OOISmS075W9QZOO_R9XNIXNnWBCYp5YkGPMTCQnWfHspEfk798Zf',2),(35,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTk4MDksImV4cCI6MTcyNzc4NjIwOX0.MIbxtmRbBcc1FOQz-fkPp5o6ACiKCX_d2pnhLIJ4PKJZChKSk3JWg1SROvidjv20',1),(36,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3MDAxNDUsImV4cCI6MTcyNzc4NjU0NX0.KtT2I332xRMEcsp8j2kLX1GbxXy1aNB6FK1CBp5up-AJs_qamQ9Az8sMZVkrE3tg',2),(37,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3MDAxODQsImV4cCI6MTcyNzc4NjU4NH0.a5lle1A-y02P8Tnmy9A7xMe8G5Jdkd8NSvk73DppAggANP4HT882mb4hxt9_2Ema',2),(38,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3MDAyNjksImV4cCI6MTcyNzc4NjY2OX0.ZonkjEzNCGSk_uKOPwghy1hIpBQWR5uHf6e7YkWg-wksDlFlklIhQTNtRn8D5e8J',2),(39,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3NTg1MTcsImV4cCI6MTcyNzg0NDkxN30.256NAQZUQJmUIPS5OCFx-_u14t0YiKStrRU80Ul_xF5csB2XgD3dzFvyWzDPkQ9e',2),(40,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3NTkwMDEsImV4cCI6MTcyNzg0NTQwMX0.vbYwWln8mMpf4DplbwPqi43eumTmzp8-SnZ3_YT3T5QbxGXlq7YSLty9wUPtQktZ',2),(41,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWhtYW4uZi5zYWRpcXVyQGdtYWlsLmNvbSIsImlhdCI6MTcyNzc2MDA2OSwiZXhwIjoxNzI3ODQ2NDY5fQ.70BRsOrcRH9ouKQ-UfIPojBg6sS6GrIzu3-N4do8w2i01FipVuiKNXGvT5ZhKEwQ',5),(42,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3NjA0NDIsImV4cCI6MTcyNzg0Njg0Mn0.I1Y08aqOlbQ4Hgysv4LHqI52h8sst2V8Gcrf7_UA5R_QAgsP7PDE2rk04aN6ixik',2),(43,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3NjEwNDksImV4cCI6MTcyNzg0NzQ0OX0.3iBY6UamhYeq1JZH9LLLbcg5Aqt804fnckpni-Np3_Rd70go-0-9y1w_k6I-PIH2',2),(44,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc4MTUzNjIsImV4cCI6MTcyNzkwMTc2Mn0.HtbWHZkfD7puZ2D3VhYo__p8b7xnx73LtvSuZ8EFmxrNTZKOF11gTFhQxUiiziom',1),(45,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc4NDU4MzUsImV4cCI6MTcyNzkzMjIzNX0.awvsab1dfT7WOaZRVJDTCKdtYBLvrOjq_TCvJYY0l2a2LXGqkpdsWhQr862Aq545',2),(46,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc5ODE4MjUsImV4cCI6MTcyODA2ODIyNX0.6pe2xgTJspTRG2xrQzAZipjkBS9lsgB-55W3bmpcqQKeR-Z3LUzaWhOo3104TClm',2),(47,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc5ODU5NTEsImV4cCI6MTcyODA3MjM1MX0.ezF1cdraUGt4pHKy7sK_INlCYKXJzspEQtyLFMC0H36yM_CjwuCzaUETYbYWJBCH',2),(48,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhYWFhYWFAZ21haWwuY29tIiwiaWF0IjoxNzMwMDMxOTIxLCJleHAiOjE3MzAxMTgzMjF9.9QdPltTwRyTUN5VqWYhZMwqllldjJRBj7i3ONbWnAuA5C9vtK0hkpJm1QSjqXgAo',6),(49,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJmZGZkc2ZkZkBmYmZndi50Z2hmdGciLCJpYXQiOjE3MzAwMzI2NjEsImV4cCI6MTczMDExOTA2MX0.29FFBHVCo6JmXeut6wDkxsRM3YPFjwl1zZzDDyJn1CSMUK_YuA1wbAHYVatzSe5S',7),(50,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuZXlhbXVsQGdtYWlsLmNvbSIsInJvbGUiOiJVU0VSIiwiaWF0IjoxNzMwODAzNTA5LCJleHAiOjE3MzA4ODk5MDl9.aLCdsm68nf86vBVo2NH2-VtxJfmorJ_ujmmchnHJLoOKAGS2ErmaAjkqrJyEm70o',8),(51,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4MDk0NjQsImV4cCI6MTczMDg5NTg2NH0.vNNQ7oONE-5Ne_5UM4_V7JdOE_Hote_4e5pVGYj3BW6sUxj_wTmAjJa9b2Y_JRsW',1),(52,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJhYWFhYUBhYWFhLmFhYSIsInJvbGUiOiJVU0VSIiwiaWF0IjoxNzMwODA5NTM0LCJleHAiOjE3MzA4OTU5MzR9.yZGi2cYzXMY58K99E9jjqpuA_TLJK57GzSZVCG6XDN0boPVenmySFbtwSHDQWVMo',9),(53,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5MDE3NiwiZXhwIjoxNzMwOTc2NTc2fQ.jW0DCyI_pka-Im4_v4XpnCqJ7zEGt8JW0i7en_Txx6iEFrJL9UpS7YUdWfuZ5p4-',2),(54,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzA4OTM1MTcsImV4cCI6MTczMDk3OTkxN30.yPb-0vm7udj7N6PGcE5oAOuzSvlVybdEvbF5CxD70LKlG_P78Ut9g_WqHPGhSavv',1),(55,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5MzYxMCwiZXhwIjoxNzMwOTgwMDEwfQ.nP_NBC9WcEw3V6QoKUrTXmnUTc4RaP3sQHiyY3t012JhfuyXMxCDnPg7YLjW6fY6',2),(56,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5NDI3MiwiZXhwIjoxNzMwOTgwNjcyfQ.I9pDJ5m6cWoUftSZNDCFH48DsUyUrbUWLAuRVn13JW_uob4YEBZ2yP-BfZ1e3XOt',2),(57,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5NDQxNSwiZXhwIjoxNzMwOTgwODE1fQ.-68JztCEXhfEQXeG-HglVFLldsXl4zMSP9di5S494ln1Bl0nzT0ff_s2_tYbPKQg',2),(58,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5NDg5NiwiZXhwIjoxNzMwOTgxMjk2fQ.zD3V9uSy0J4BQ5hyjI0Oie5K1LzyKic9ncsKS512Oeb2TQoxGgBzGXvBCeRGG0Ym',2),(59,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5NTE1MywiZXhwIjoxNzMwOTgxNTUzfQ.uA6ca_XlHZdJqZsyHcxn_DYgI7YfDvHnLMVRreAfV7A03ZkUuKfu4AcSIQQo5i-E',2),(60,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5NTE2OSwiZXhwIjoxNzMwOTgxNTY5fQ.hmJysRlmy6QCww89s-EBzTheEDTuAaP5nOhTT7x9mQtiBqhbJ3lhV3t1bojAq4Qg',2),(61,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDg5NjMwNCwiZXhwIjoxNzMwOTgyNzA0fQ.1fj6gaKiUFqfjiEv_-pBaG8vxE797IOcXHV3eSJNmz_iNtcnyESsZGcPXsbdJd-W',2),(62,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3Mjg5NywiZXhwIjoxNzMxMDU5Mjk3fQ.dSgKM-joM3axaPKDiKZtL1QzoVCx1XVi-Q0ZVE9t8qY2zrafsE0ppGP01ik7dM6V',2),(63,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3OTI1OCwiZXhwIjoxNzMxMDY1NjU4fQ.q90JfPbGg5tNaaaskELO3IVJqdtdl-1NCkaVMH_KRtatTAb8fnZfzU2_d4y7-UD1',2),(64,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3OTU1MCwiZXhwIjoxNzMxMDY1OTUwfQ.bl5Ht_vg06M8jLvF_jBDq67lPJ5XWoKuhaxKhlZtdwn8rlLSvX9aZE6UjDGnolIT',2),(65,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3OTcxNywiZXhwIjoxNzMxMDY2MTE3fQ.gD9O1NjPdluWRqP4MsiVhkwLBiFH3GeD1a01YOIOtGpNzJh3XUnO-iSsXc3ctKpK',2),(66,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk3OTk0MCwiZXhwIjoxNzMxMDY2MzQwfQ.EVb_cxeEgFLy9VC9NNRK18fmVhrk8OrQ-KJj9oFtPhFnex-j6sG59-xsqW128NAn',2),(67,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk4MDA5OCwiZXhwIjoxNzMxMDY2NDk4fQ.5SC7fgK_O-Z452Qja2tbKjam3865hB5UMCBUCKPkoE7BLIKRQovEJAHUK5tywkbA',2),(68,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk4MDMxMSwiZXhwIjoxNzMxMDY2NzExfQ.rEgo6QQhe0_SajH2wQQkWu_YvI8KXVRtrG5jAaX05t0tgkRbokTK1aat5tA6QdD_',2),(69,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk4MDU2OCwiZXhwIjoxNzMxMDY2OTY4fQ.6kKaztYXoBIOdGYBD2aK_KqMX3QIaV7r8K6v-YmVIuRmWSvPA3ue4IZCbmcEX6fa',2),(70,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk4MDczOCwiZXhwIjoxNzMxMDY3MTM4fQ.BJRj9MPkZPIcV7818uJytspnBFgkVABENXJ0G2-ilHK0wVMZv5y0I7gNU46znhOl',2),(71,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk4MDk2MywiZXhwIjoxNzMxMDY3MzYzfQ.JQ-y2e-sKSStBlE0g-bud7FviC6Xu5sTnLGDim7nz3C6gMZQKONZRvHCTnwmwSs1',2),(72,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk4MTE0OCwiZXhwIjoxNzMxMDY3NTQ4fQ.Y0Gl_qrjNhJwTgq7cQP92GXuGTkLgmCdaXyKnY_Nmev2GKkvSbQn9u4qSkwAbrCb',2),(73,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMDk4MTIzMSwiZXhwIjoxNzMxMDY3NjMxfQ.leuronnS7cfA_6JTNkOPyRG97ofFITXJV1vvczMian87WXXK921SxnoEIPMg5K2H',2),(74,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzExNTA2NzksImV4cCI6MTczMTIzNzA3OX0.2DzArQ_TFBTULmQz_SQbhCUSowa50Sbp7nofgrR-R9ic19gSGdNNm4hyRt2wVEb_',1),(75,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTE1MDcyNiwiZXhwIjoxNzMxMjM3MTI2fQ.M5vLdwTT2dPdlxCTdaiom3YEuVK-_GP_geOI-Hy_eic51mq58tNPLSZpz3wwNrKM',2),(76,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzExNTE2NTksImV4cCI6MTczMTIzODA1OX0.FDeONW18Qe2SqnnaSOmzaeRmtOgQedzj3NRGiyYF9qUl6GnMts5q_n4PKqj1POsW',1),(77,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzExNTE3NjksImV4cCI6MTczMTIzODE2OX0.dr8l4Rp1NvjPAzQxqJjfWhb-DclY1WxCjoq5Ezk9QWotF3FoK_MB609xgYVzMNKr',1),(78,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzExNTIxNDAsImV4cCI6MTczMTIzODU0MH0.V-_Rx0S68ay3BHu7HdS3Ckl4btZkeySXJcsElAnC4_AqmiN1qP20G72v8zaWkZbo',1),(79,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDI4ODgsImV4cCI6MTczMTQ4OTI4OH0.NvaYdMwhHQ96Hs-2FmJykgzQ1puBaXymtMnoGK-tYoiNyF6wru06lMvd8mJdi_GT',1),(80,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwMzAwNywiZXhwIjoxNzMxNDg5NDA3fQ.5d_oLDumrw41aUw0zd7A5vTQPAeh1hIpOhi7JSNd3wmxmWDgVcyhUtO8ArMhWUR7',2),(81,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDMxMTIsImV4cCI6MTczMTQ4OTUxMn0.LpnuOWSd7LEJQfe_pDdumRKzomgzRtfwjuSmYCknrQo5Rc0en4z81ld6uVhDJqFH',1),(82,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDM0MjksImV4cCI6MTczMTQ4OTgyOX0.Hz0L1eNgf0ooeEpa0SwWZnDjv7b_KsUQnMA4_5QbjjRYnfbJb2NVH71oulB4yRAO',1),(83,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDU0OTEsImV4cCI6MTczMTQ5MTg5MX0.f5q4QvV1BpHjVPixNxyseJXZiE9NtS4RmpJwEVeegOYwVmzuyJI29UTjp4O7B-ay',1),(84,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwNTc4MCwiZXhwIjoxNzMxNDkyMTgwfQ.IzX_5dkygZ0SXy1vxolPZ42GExMhNOsheab29sgBhYMl1GdMhgeYV9bk0Kf7Cgnf',2),(85,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDYwMTMsImV4cCI6MTczMTQ5MjQxM30.DmWzyNzivVFEG13AFgB_fY-wnE2QmZvTsktKdXCIugDQFbqXY1o8oW-VpWMqUJy1',1),(86,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDYwNDQsImV4cCI6MTczMTQ5MjQ0NH0.cV-KJq5tLBpsNUvv41keQHi6JMFeqkJJQFnkSSltCNJWjUnmSwrQbTMhrSmrekfL',1),(87,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDYxNTQsImV4cCI6MTczMTQ5MjU1NH0.WkBH4drTtkxCiQ4xBSIIDlbfuOUouyd5Pya4uIS1yuQ052RJhT2p8kPBDrdF_Asy',1),(88,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDYyNTIsImV4cCI6MTczMTQ5MjY1Mn0.HCWomrn5SCNNOW2sadHHmp2qHM90XF1UN6HTyGtXVtIEyj2mV9zv5zXMSpNk5e9X',1),(89,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDYzOTEsImV4cCI6MTczMTQ5Mjc5MX0.zlMw6_QRUDwkndOnYWjbZaSg_-1dK3kM1qA3njLJNrBSOLDxQGaK4XGYJr2BsbFU',1),(90,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwNjQ1NiwiZXhwIjoxNzMxNDkyODU2fQ.jxn-U7ZcEBUZ1_-J9V7zK0J35xaM2BRSznjurbYj-JHCJNY-2FWNwOPBTdg71iFf',2),(91,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDY2MDcsImV4cCI6MTczMTQ5MzAwN30.g9KF5yNH0QnofUX-epRgZo_gQcQj7uqqE4Jz9Y5NnlfVsuAdF0di7RGxW7jtt13t',1),(92,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDY2NDgsImV4cCI6MTczMTQ5MzA0OH0.nlpgiw2g6QoznpwJVFDECERUu-9UOMsK41PWdB20Tmx0TF7mFP8cpBOc3u1pFbei',1),(93,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDY3MzUsImV4cCI6MTczMTQ5MzEzNX0.r_odcZiVk2TkkfdhQTPT59Dx_T7JMlOFYlgH_5vg-zQFvJfaZughV3WGNJ-uOEs0',1),(94,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDcxOTgsImV4cCI6MTczMTQ5MzU5OH0.Cy9eq6EhAJ9RTDPpWgjyMQ8B1k6cVeEcjYRWz6w5VTLbu2Iq-nmmP_1ARX92bIeD',1),(95,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDc2NTcsImV4cCI6MTczMTQ5NDA1N30.57pwg_zXypw2Kc9cdkXbviG7BY-GHN0tcq4eZ2naNpv-VFuMuBS8PgpHRnvhjdEG',1),(96,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwNzk3NiwiZXhwIjoxNzMxNDk0Mzc2fQ.rWeu9ggovSmv74UUmkNqeZ4FtH9OdZajpvJlq51eKOzT1Veb1iSBxivwPJ04uuPs',2),(97,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDkxODgsImV4cCI6MTczMTQ5NTU4OH0.Fp5WAsjDNrVLN-gyvWAVS8r6rJdxNu0UO822IxE4CMFscc1CpuHBemmiexHrMFQG',1),(98,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDkyMzEsImV4cCI6MTczMTQ5NTYzMX0.Az2rem6xuN5-0TOIcl7CHbowZPyaD1CBVuDr7-oOzPOmlEECTrUdEQ-nJSkgLvlI',1),(99,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQwOTQxMiwiZXhwIjoxNzMxNDk1ODEyfQ.34puGzKc9iubHc-Fa95fQ_PWLSZ6PuOCV0ZMsYH39UiScXXHjiI2NHH9voXHMnC-',2),(100,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDk0NjAsImV4cCI6MTczMTQ5NTg2MH0.pw95h8wtIukYYMw8HYijDlNluZgyqqnlCEiXI1-G66hNnSKYJT0wSp73OkTEBcfv',1),(101,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDk3NDEsImV4cCI6MTczMTQ5NjE0MX0.OUgfI3h1yFDdQydO0Ne5saL0zcPt7hT-ZMkpTTr2m5VL3l69WWumWH8drU0JeCXW',1),(102,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MDk5MzUsImV4cCI6MTczMTQ5NjMzNX0.VdoUgQqVGXLk2cctMDcny8NpfVCA_ktJj7IMltWu029i0jS9sZmPsDMkAIB6AaD5',1),(103,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MTM1MDAsImV4cCI6MTczMTQ5OTkwMH0.5dmHedRqBdMSBC9sR1C58KrGAFwRypjLr4XF9MTF67CrwhnnKjKnfXmB6vbpjqlC',1),(104,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MTM2OTksImV4cCI6MTczMTUwMDA5OX0.3Hj8Bobio0lkjgDcRvhl3oszFaqPKWZS6LzYFSpWtGqEULkFoV9erM6OVMdjUmKh',1),(105,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQxNDA3NSwiZXhwIjoxNzMxNTAwNDc1fQ.d3qcJlWyjm7ZHN0gIEjaDxP89uepn1zFD2fNYnyjjIz1wUiC3OLJbI3AaRO67h9F',2),(106,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MTQxODYsImV4cCI6MTczMTUwMDU4Nn0.xNNAngevAM3Pwo03b_8DI1J8mTgXFdgWg-2gCE_cprKfEIuDY61qjlQGbMBSbkwI',1),(107,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0MTQyMTQsImV4cCI6MTczMTUwMDYxNH0.AIPKi8nFhPq5UwakRPtqXJNK3VilIYJaj31LnJx5h7VQRJ5YJrPOvw0gPV4Uk_T0',1),(108,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0ODkzOTMsImV4cCI6MTczMTU3NTc5M30.YwSwHFTn7XEdrA1EOT9tsmzyKCjxPL1Lx1aIFW1CjQv8iGQPq1M1PfIzI8tXN9Ng',1),(109,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQ5MDcxOSwiZXhwIjoxNzMxNTc3MTE5fQ.CfslHVnp_AfvJwqAc6Xz9vsLkYYQ4kUllsl83JDTw9KzVCYw4QQKYF6qrKLrj0fk',2),(110,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0OTExMTYsImV4cCI6MTczMTU3NzUxNn0.I-SjjlpNOwvvOONbrfrrS51uxTY4NNFfCPIXfMn4MF_PHDQC2GSrU--OcbL75E_2',1),(111,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0OTExMzMsImV4cCI6MTczMTU3NzUzM30.-ehhIA4McfdFUQm2i2A1-9a3KthUjK-S_y55Eu1ruKs9BA2rEOhlDoxTHWGoLd2H',1),(112,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0OTExNDksImV4cCI6MTczMTU3NzU0OX0.1-QZmDARJHGq-nNmH3WYzTpzTI1vNORQwBKXSdGKALTQARJNzMGVrJP8fuxdDVpz',1),(113,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0OTE4NDIsImV4cCI6MTczMTU3ODI0Mn0.EHJLV6OCm3FayZZlSykvFtMWVSDpn2DZCk_jGPR-rLAeZ0x3-dfTUsU5WE51AiPG',1),(114,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0OTIyMjIsImV4cCI6MTczMTU3ODYyMn0.20bkwV8uq3RCORWc7E6rhEGi_ICxAT0IDY8srikkF4x1UdPpZ185kxRKCUf3Pf7p',1),(115,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQ5MzE2NSwiZXhwIjoxNzMxNTc5NTY1fQ.Dm6d36tph4FB7lfEJI7owhmSCagFJoXaLFfQibA_lhOsxPNUZbD5EHOOi8UtWmGw',2),(116,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE0OTUwNDUsImV4cCI6MTczMTU4MTQ0NX0.JkwEL8T33SOZ8_bh2fpyxvN_UrOy3dvmv6fajpbu0oIeAWG3JP_nlCwfAsIjjjNZ',1),(117,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQ5NTEzMiwiZXhwIjoxNzMxNTgxNTMyfQ.iEKPDG4-RX0OSS8UbhJ7NceJ06FfLeTK0fxYF3ShuasVzyud2UuUq4fgXtEBHocp',2),(118,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQ5ODgzMiwiZXhwIjoxNzMxNTg1MjMyfQ.qGKo1xl03NAn0Jp6yIy81xz2x_xjzBy4opiV0HDoHEyTOmktyLFiRABiWLMUYoeX',2),(119,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQ5OTUyMSwiZXhwIjoxNzMxNTg1OTIxfQ.6KRtp97JLbHW1fcsVsvEQvBqkZKp8ZsGtb6pbllcv6iufauemfVFfHagfqQ1IBT5',2),(120,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTQ5OTg2NiwiZXhwIjoxNzMxNTg2MjY2fQ.5_5fZB_e88S5NMZ5Mg9rsCwJ_T93SkRVS2lXeVVnMu2yUhu4v-nuoT9s-exEKo1x',2),(121,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE1MDAxMDEsImV4cCI6MTczMTU4NjUwMX0.Zp2ajTyBjYNKMh-h64GXbT-MR33_bJznCtcPqQkP9UjmH_Q_cnSR0yAzjFPZxdSq',1),(122,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTUwMTA2OSwiZXhwIjoxNzMxNTg3NDY5fQ.iV6goE4yW4Huv7VXZ8QXx4b4YmXt-FvJLNwgRDkoXFBBwloXmSkfWTT4O8gmaYPC',2),(123,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE4MzY0NjIsImV4cCI6MTczMTkyMjg2Mn0.Yi4tQsxhoQavyv5PSB8tCs6z94pg4s47UBoIoKjvgAAHz0Kq_vwH_rGnByZpOsPJ',1),(124,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJyb2xlIjoiVVNFUiIsImlhdCI6MTczMTgzNzM2NCwiZXhwIjoxNzMxOTIzNzY0fQ.Plue0NgwSeVI_5JFFBID0lmq0CPLeaIsyHElXDuRkcN82NyTj5dpM2EOqTk3zH57',2),(125,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE3MzE4Mzc0MzIsImV4cCI6MTczMTkyMzgzMn0.LKCUasH40XnuDhP3oCCfdxs6rmbgb2UciB4P_b9X0H-AWj2xLg60MWHTxqC6Wx83',1);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2024-11-17 16:05:59
