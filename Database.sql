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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (1,_binary '','Fast Food','15a5579f-f82f-414c-bb13-4bb9f8cfd9ab_pasta.jpg','Pasta',99.99),(2,_binary '','Main Course','e2ca467c-9889-4204-be0d-e21f8bd32472_muttonBiryani.jpg','Mutton Biryani',450),(4,_binary '','Fast Food','96e6bfa7-f1d9-4027-9898-463d7b340783_pizza.jpg','Pizza',250),(5,_binary '','Main Course','3f197ee2-74a1-44e1-bde5-7f693098226d_BeefBiryani.jpg','Beaf Biryani',550),(6,_binary '','Fast Food','101a72da-7b47-4a92-ba0f-cba96a297114_ChickenBurger.jpg','Chicken Burger',250),(7,_binary '','Fast Food','fc03fefd-def9-4af1-8350-f6905af07c6b_ClubSandwich.jpg','Club Sandwich',180),(8,_binary '','Main Course','cb18eef7-69f8-4567-ae08-ffbf1fbef113_VegetableBiryani.jpg','Vegetable Biryani',320);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` VALUES (1,2,'AVAILABLE','T1'),(2,4,'BOOKED','T2'),(3,6,'AVAILABLE','T3'),(4,4,'AVAILABLE','T4'),(5,6,'AVAILABLE','T5'),(6,4,'AVAILABLE','T6'),(7,2,'BOOKED','T7');
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3MjY2ODQ0NzEsImV4cCI6MTcyNjc3MDg3MX0.5Bfdr8KwNmPRjp8QYmB5FWj13KRQy9RQ-5OOlileg9PHovcRQqZ864Ali9NZf7BH',1),(2,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3MjY2ODQ1MDMsImV4cCI6MTcyNjc3MDkwM30.RXl_wGgKSHlU6_6BLBbqsH-m_IBSHW9SOuYTJz3zgw949H0cRbTRhZBeufwpukQ_',2),(3,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3MjY2ODYyMDUsImV4cCI6MTcyNjc3MjYwNX0.Ea7usqCSE9sMPWpbrjpDFwuxRhBvuglpHlCztX7-1Q7Qu4w1W4NDJtpae7dHfgA4',2),(4,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3MjY4NzE1NzgsImV4cCI6MTcyNjk1Nzk3OH0.4D7VOtAhVzolz3_cJthUk9JwAn1QI8kVOOR2cUIH8cLhg6k9DfyqP7Yx3Dgld7l4',2),(5,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3MjY4NzE2MTksImV4cCI6MTcyNjk1ODAxOX0.tYBaUS9Xdl8iiCA84xmqLbnQRsfBVnNuOSOyMO7WEBqu8inE2xqmuXqPMmHrbPPB',1),(6,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc1MTgwNDgsImV4cCI6MTcyNzYwNDQ0OH0.BD9yPu-RGc1tCr9OKbYckGxd55Wku0fFpxNlmzoNtqU4xvXUEe9_MjgY_RMeBu5M',1),(7,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc1MTk3NTQsImV4cCI6MTcyNzYwNjE1NH0.yaQN61AwT_dz1KxwcV61lrc5SmrjavKREMIH7XTbKgOwkTDsjPT_OEWYJs-cDhom',1),(8,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc1MjAwMDIsImV4cCI6MTcyNzYwNjQwMn0.qwFuvxPio7s9CU1A1SK81ugj5WCNrVEiq_vemXTKH1zyi0qkzCU6-2N-51x25AyD',1),(9,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc1MjM1MzYsImV4cCI6MTcyNzYwOTkzNn0.fIWeOlZ85AEXM4FESz2fPBQI4K9PEIE_gysnixLnROpeYQQzTRCUoq5nzeGmF6B-',1),(10,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWZpcXVscmF6dWlkYjU5QGdtYWlsLmNvbSIsImlhdCI6MTcyNzUyNDM5NSwiZXhwIjoxNzI3NjEwNzk1fQ.y9GBSvUMgF_ixq6iNISbFEWQhVVfc39V3mQJl8SPS9qGdjOVD9hy1XzsXj_f7IjV',3),(11,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXlhbXVsaXNsYW1AZ21haWwuY29tIiwiaWF0IjoxNzI3NTI0NzI5LCJleHAiOjE3Mjc2MTExMjl9.EgpndpSBdwmy9-VwL5mwCK-GiMTnUAJ7Aq3--lvnMBXI26V_R5pkd1aF2V0vpuza',4),(12,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXlhbXVsaXNsYW1AZ21haWwuY29tIiwiaWF0IjoxNzI3NTI1MzYwLCJleHAiOjE3Mjc2MTE3NjB9.yoKxqbimiIQv9xzKJb-qGBHMiY1FMPm0m057S2EUI7yXoOQ1G2Ns89iaFGXDgLE1',4),(13,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc1MjY0MTEsImV4cCI6MTcyNzYxMjgxMX0.wCi7Ef66OSRTBaNHFuj_nyUTy5iZi-5XzanHizTMTDWS8o0CfBL2ht_ZsJlslaI-',2),(14,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MDQ1MTcsImV4cCI6MTcyNzY5MDkxN30.OjBRYmSqFfRtFWNW9msxrfy3I7M_PihP63-96wRPRonO6ZFngW8Z0sR9CVlkkira',2),(15,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MDQ1ODYsImV4cCI6MTcyNzY5MDk4Nn0.FDdK51uqnfIQk3XL0iSaqQWSqno6tzcYnxCu_oB3oYZjDJWRV3mb9cd2_YpqEice',2),(16,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MDUzNjEsImV4cCI6MTcyNzY5MTc2MX0.XCSNhB6_gMPhVaif3Bh3H_ebdUJcMHFzQhdWDNRG3JBk-LMV_GP4TJZrL7ITGZQ1',1),(17,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MDY1MDMsImV4cCI6MTcyNzY5MjkwM30.i7vudCT-CrxcZyGYqJrDtfzWd9QhZZ8UFdZIM_zxkZqfiY7GdopBlhaSA7OHlshA',1),(18,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MTA0MTgsImV4cCI6MTcyNzY5NjgxOH0.1t2KKurFj4T3wClhhKFBmIvxKTu0tqgtpK3Aeq6Z0Cwk5x8XqLPb2xXTvo38-DnF',2),(19,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MTA2MTUsImV4cCI6MTcyNzY5NzAxNX0.u5CNPQoEg-vi-tAJss39WrTksIy_i53l77qLUF-fdXBPjmLnuWtvgrpG-8wtsHx2',1),(20,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MTA5MTAsImV4cCI6MTcyNzY5NzMxMH0.yCNsLr-lYxwVJYP3WnQ-QCTvY2jtYa2FLCbemJwM1sXa59_LlyTkWd0Tx9QlelBx',2),(21,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2MTQ1NjMsImV4cCI6MTcyNzcwMDk2M30.3VqCAra8x5DlYZ2U4fW14COP6hQzz6xxVJJ8xwSyGAsXA0xTKKCmARItt1pJ5AWO',1),(22,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2ODQ3NTYsImV4cCI6MTcyNzc3MTE1Nn0.p7gHWjwXJJfKTWbQFOeXSRNw3yAhnRypE9DnA4S5_PBezDTOC8LsR28zywyL4rN5',2),(23,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2ODUwMDEsImV4cCI6MTcyNzc3MTQwMX0.PfBKcDqC328QyIl-mL8mKytvb7GTGZvLSc8BdYq7M1eEWy1DL0vkF-8tGpfA38lX',1),(24,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2ODYxNDcsImV4cCI6MTcyNzc3MjU0N30.XvmOG-schwHDBLjfDl5XFQGgQs5YSI-oFw1l4GCBG_hQEhszj3ys07xaYwn2zG6e',2),(25,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2ODkxMjQsImV4cCI6MTcyNzc3NTUyNH0._iTNE61rC_dt76tiTK4fpSrj3kluqxTBuFC5MqXeb5FIhxb3qpiN5NRcXRUWJX2D',2),(26,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2ODk3NjAsImV4cCI6MTcyNzc3NjE2MH0.VEotBJorPziDbpZKx6G8Q2JxpNVwz8Up_6da96tDj6mNkGuzFJqmb6MNyAMuX0-D',2),(27,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTE1ODEsImV4cCI6MTcyNzc3Nzk4MX0.YJtwdB4pGdjl4T2huoI8XZyg6yk4L585HunlCRAibeq7w1rNbMqv7liekrGS_auj',2),(28,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTM5ODcsImV4cCI6MTcyNzc4MDM4N30.YwGBTpxfN8fxbSaLdGiTem-xXX_DLT4PQDbIacupnWTMA6dT9XX67VNgvRORnb3U',2),(29,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTUyNjAsImV4cCI6MTcyNzc4MTY2MH0.OzbSpmEOMmT6dEVGz9q7LEVZp_4ohWa7j9XGtNn0yM7WKuhVR7QDOrToQKcby1Vn',2),(30,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTcwNzMsImV4cCI6MTcyNzc4MzQ3M30.aUcuCxzvxHBf8SS1ySScY-o6up2clBBfX5GH3PTk1nr3K6FMSMoYyUu9O8SzEe4X',1),(31,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTc4MzMsImV4cCI6MTcyNzc4NDIzM30.xv65K9x8YJ0rEaU9xEiNb_eHkczmrLlXLQrb8x-As6RqYMgvz8FDWN9xxrcddX6B',1),(32,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTk1MTcsImV4cCI6MTcyNzc4NTkxN30.6Pqq2Kt4YYNsnkz0juDPtJ8A9W7ksHLCs2Jfoyd-UzRtqTvWvASJNDbdWL8eTvoE',2),(33,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTk1NTAsImV4cCI6MTcyNzc4NTk1MH0.I_Sv4x0wgW6wxCusuMUVr00VSB1JJK5J6FYLfa4P9W1IGDlPu4NJU1wcvpDpyd4A',1),(34,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTk3NjgsImV4cCI6MTcyNzc4NjE2OH0.hcvDV6KFhwB8OOISmS075W9QZOO_R9XNIXNnWBCYp5YkGPMTCQnWfHspEfk798Zf',2),(35,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc2OTk4MDksImV4cCI6MTcyNzc4NjIwOX0.MIbxtmRbBcc1FOQz-fkPp5o6ACiKCX_d2pnhLIJ4PKJZChKSk3JWg1SROvidjv20',1),(36,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3MDAxNDUsImV4cCI6MTcyNzc4NjU0NX0.KtT2I332xRMEcsp8j2kLX1GbxXy1aNB6FK1CBp5up-AJs_qamQ9Az8sMZVkrE3tg',2),(37,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3MDAxODQsImV4cCI6MTcyNzc4NjU4NH0.a5lle1A-y02P8Tnmy9A7xMe8G5Jdkd8NSvk73DppAggANP4HT882mb4hxt9_2Ema',2),(38,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3MDAyNjksImV4cCI6MTcyNzc4NjY2OX0.ZonkjEzNCGSk_uKOPwghy1hIpBQWR5uHf6e7YkWg-wksDlFlklIhQTNtRn8D5e8J',2),(39,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3NTg1MTcsImV4cCI6MTcyNzg0NDkxN30.256NAQZUQJmUIPS5OCFx-_u14t0YiKStrRU80Ul_xF5csB2XgD3dzFvyWzDPkQ9e',2),(40,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3NTkwMDEsImV4cCI6MTcyNzg0NTQwMX0.vbYwWln8mMpf4DplbwPqi43eumTmzp8-SnZ3_YT3T5QbxGXlq7YSLty9wUPtQktZ',2),(41,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJyYWhtYW4uZi5zYWRpcXVyQGdtYWlsLmNvbSIsImlhdCI6MTcyNzc2MDA2OSwiZXhwIjoxNzI3ODQ2NDY5fQ.70BRsOrcRH9ouKQ-UfIPojBg6sS6GrIzu3-N4do8w2i01FipVuiKNXGvT5ZhKEwQ',5),(42,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3NjA0NDIsImV4cCI6MTcyNzg0Njg0Mn0.I1Y08aqOlbQ4Hgysv4LHqI52h8sst2V8Gcrf7_UA5R_QAgsP7PDE2rk04aN6ixik',2),(43,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc3NjEwNDksImV4cCI6MTcyNzg0NzQ0OX0.3iBY6UamhYeq1JZH9LLLbcg5Aqt804fnckpni-Np3_Rd70go-0-9y1w_k6I-PIH2',2),(44,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJzaGFocml5YXJuaXJqYXNoMTk5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc4MTUzNjIsImV4cCI6MTcyNzkwMTc2Mn0.HtbWHZkfD7puZ2D3VhYo__p8b7xnx73LtvSuZ8EFmxrNTZKOF11gTFhQxUiiziom',1),(45,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc4NDU4MzUsImV4cCI6MTcyNzkzMjIzNX0.awvsab1dfT7WOaZRVJDTCKdtYBLvrOjq_TCvJYY0l2a2LXGqkpdsWhQr862Aq545',2),(46,_binary '','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc5ODE4MjUsImV4cCI6MTcyODA2ODIyNX0.6pe2xgTJspTRG2xrQzAZipjkBS9lsgB-55W3bmpcqQKeR-Z3LUzaWhOo3104TClm',2),(47,_binary '\0','eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJuYXNpZi5zLm5pcmphc2g5NkBnbWFpbC5jb20iLCJpYXQiOjE3Mjc5ODU5NTEsImV4cCI6MTcyODA3MjM1MX0.ezF1cdraUGt4pHKy7sK_INlCYKXJzspEQtyLFMC0H36yM_CjwuCzaUETYbYWJBCH',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,_binary '','Kathalbagan, Dhaka','shahriyarnirjash1996@gmail.com',NULL,'Shahriyar Nirjash','$2a$10$saYs4xMJKY.mhQoTxib1wOLV/aZ7RAuSDnYB/la6xmHW2OAxwHgvq','01784054171','ADMIN'),(2,_binary '','Kathalbagan, Dhaka','nasif.s.nirjash96@gmail.com',NULL,'Nasif Shahriar','$2a$10$D1BQAWN82ZFjOSewr1.8xONpUGTBc51KPHJiIUUyholiH5bwBARpO','01303547093','USER'),(3,_binary '','Agargaon','rafiqulrazuidb59@gmail.com','','Rafiqul ISlam','$2a$10$JeT2v27JX3PXmNe2JEk6bOzgfq/pGa/l0N9J6SjVS9kgP9ZszY47C','01775805206','USER'),(4,_binary '','Agargaon','nayamulislam@gmail.com','','nayamul Islam','$2a$10$cRW72WYe2QdjWO544Yh8AucEmjXnd6Edow.kZdbv4cRj4G2cpQR/2','01303547095','WAITER'),(5,_binary '\0','Mohammadpur','rahman.f.sadiqur@gmail.com','','Sadiqur Rahman','$2a$10$VlAqa47ZY8rHMV.t4B63c.s.Cugt7vd2PXP0DreHu9r.Yu1rNAIP6','01710938092','WAITER');
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

-- Dump completed on 2024-10-04  2:27:14
