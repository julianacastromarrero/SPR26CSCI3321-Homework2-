-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: recipe_db
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `recipe_ingredients`
--

DROP TABLE IF EXISTS `recipe_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_ingredients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipe_id` int NOT NULL,
  `ingr_id` int NOT NULL,
  `quantity` varchar(20) DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ri_recipe` (`recipe_id`),
  KEY `fk_ri_ingredients` (`ingr_id`),
  CONSTRAINT `fk_ri_ingredients` FOREIGN KEY (`ingr_id`) REFERENCES `ingredients` (`ingr_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ri_recipe` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_ingredients`
--

LOCK TABLES `recipe_ingredients` WRITE;
/*!40000 ALTER TABLE `recipe_ingredients` DISABLE KEYS */;
INSERT INTO `recipe_ingredients` VALUES (1,1,1,'1','extra virgin'),(2,1,2,'3','minced'),(3,1,3,'2','diced'),(4,1,4,'2','any color, cored and chopped'),(5,1,5,'2','peeled and diced'),(6,1,6,'2','diced'),(7,1,7,'1','peeled and cubed, optional'),(8,1,8,'2','93% lean'),(9,1,9,'1.5','more as needed'),(10,1,10,'1','15-ounce can'),(11,1,11,'1','14.5-ounce can, in their juices'),(12,1,12,'3',NULL),(13,1,13,'1',NULL),(14,1,14,'1',NULL),(15,1,15,'1','adjust for extra kick'),(16,1,16,'1',NULL),(17,1,17,'0.5','ground'),(18,1,18,'1',NULL),(19,1,19,NULL,'topping'),(20,1,20,NULL,'topping, thinly sliced'),(21,1,21,NULL,'topping'),(22,1,22,NULL,'topping, or sour cream'),(23,1,23,NULL,'topping, freshly chopped'),(24,2,24,'2','plus 0.5 cup reserved if needed'),(25,2,9,'2.5','warm'),(26,2,25,'2','shredded, part in dough part as filling'),(27,2,26,'0.5','for greasing skillet'),(28,2,16,NULL,'to taste'),(29,3,27,'2','finely sliced'),(30,3,28,'1','finely sliced'),(31,3,29,'1','sliced'),(32,3,30,'1','finely sliced, optional'),(33,3,14,'1','smoked'),(34,3,31,'1',NULL),(35,3,13,NULL,'pinch'),(36,3,2,'2','crushed'),(37,3,1,'4',NULL),(38,3,32,'1','juiced'),(39,3,33,NULL,'4-5 drops'),(40,3,34,'8','wrapped in foil, warmed in oven'),(41,3,35,NULL,'topping'),(42,3,36,'230','topping'),(43,3,16,NULL,'to taste'),(44,3,17,NULL,'to taste'),(45,4,37,'1',NULL),(46,4,38,'0.5',NULL),(47,4,39,'0.5','sliced'),(48,4,40,'1','drizzle'),(49,4,41,'1','sprinkle');
/*!40000 ALTER TABLE `recipe_ingredients` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-08 20:41:32
