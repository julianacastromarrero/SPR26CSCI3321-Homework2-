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
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `ingr_id` int NOT NULL AUTO_INCREMENT,
  `ingr_name` varchar(100) NOT NULL,
  `category` enum('protein','vegetable','oil','spice','dairy','grain','other') NOT NULL,
  `unit` varchar(20) NOT NULL,
  PRIMARY KEY (`ingr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'Virgin Olive Oil','oil','tbsp'),(2,'Garlic','vegetable','cloves'),(3,'White Onion','vegetable','units'),(4,'Bell Pepper','vegetable','units'),(5,'Carrot','vegetable','units'),(6,'Celery','vegetable','stalks'),(7,'Sweet Potato','vegetable','units'),(8,'Ground Turkey','protein','pounds'),(9,'Water','other','cups'),(10,'Tomato Sauce','other','cans'),(11,'Diced Tomatoes','vegetable','cans'),(12,'Chili Powder','spice','tbsp'),(13,'Ground Cumin','spice','tbsp'),(14,'Paprika','spice','tbsp'),(15,'Cayenne Pepper','spice','tsp'),(16,'Kosher Salt','spice','tsp'),(17,'Black Pepper','spice','tsp'),(18,'Red Pepper Flakes','spice','pinch'),(19,'Avocado','vegetable','units'),(20,'Jalapeño','vegetable','units'),(21,'Shredded Cheese','dairy','grams'),(22,'Greek Yogurt','dairy','tbsp'),(23,'Cilantro','vegetable','grams'),(24,'Corn Flour','grain','cups'),(25,'Mozzarella Cheese','dairy','cups'),(26,'Butter','oil','sticks'),(27,'Chicken Breast','protein','units'),(28,'Red Onion','vegetable','units'),(29,'Red Pepper','vegetable','units'),(30,'Red Chilli','vegetable','units'),(31,'Ground Coriander','spice','tbsp'),(32,'Lime','other','units'),(33,'Tabasco','other','drops'),(34,'Tortilla','grain','units'),(35,'Mixed Salad','vegetable','grams'),(36,'Fresh Salsa','other','grams'),(37,'Greek Yogurt','dairy','cups'),(38,'Blueberries','other','cups'),(39,'Strawberries','other','cups'),(40,'Honey','other','tbsp'),(41,'Chia Seeds','other','tbsp');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
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
