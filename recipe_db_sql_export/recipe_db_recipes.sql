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
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `recipe_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `cuisine` varchar(50) DEFAULT NULL,
  `difficulty` enum('easy','medium','hard') NOT NULL DEFAULT 'medium',
  `prot_type` enum('chicken','beef','turkey','tofu','grains','dairy') NOT NULL,
  `prep_mins` int DEFAULT NULL,
  `cook_mins` int DEFAULT NULL,
  `servings` int DEFAULT NULL,
  `instruct` text NOT NULL,
  `protein_gr` int NOT NULL DEFAULT '0',
  `ref_url` varchar(2000) DEFAULT NULL,
  `tried` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`recipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,'Healthy Turkey Chili','main','American','easy','turkey',20,55,8,'1. Heat the oil in a Dutch oven or large soup pot over medium heat. Add the garlic, onions, bell peppers, carrots, celery, and sweet potato. Sauté for 5 to 7 minutes, until soft.\n    2. Add the turkey and cook until browned, 5 to 7 minutes, stirring often to break up the chunks.\n    3. Once the meat is browned, add 1 1/2 cups water, tomato sauce, diced tomatoes in their juices, chili powder, cumin, paprika, cayenne, salt, black pepper, and red pepper flakes. Bring to a boil, then reduce to a moderate bubble. Let cook, uncovered, until the chili thickens, about 45 minutes, stirring every so often.\n    4. Taste and adjust seasonings. Serve hot with desired toppings.',24,'https://www.wellplated.com/healthy-turkey-chili/',0),(2,'Colombian Arepa filled with cheese','breakfast','Colombian','easy','dairy',30,25,10,'1. Add 2 cups of corn meal and 2 cups warm milk or water to a large bowl. Reserve the remaining ½ cup if needed. Add shredded mozzarella cheese and 2 pinches of salt.\n    2. Form a ball with the dough. Flatten and form a bowl in your hand. Place shredded mozzarella inside and seal edges.\n    3. Heat skillet to 320°F and rub with butter. Cook arepas until golden brown and cheese oozes.',9,'https://arepasdelgringo.com/make-arepas-de-queso-colombian-recipe/',1),(3,'Easy Chicken Fajitas','main','Tex-Mex','easy','chicken',15,10,4,'1. Heat oven to 200C/180C fan/gas 6 and wrap 8 medium tortillas in foil.\n    2. Mix smoked paprika, ground coriander, a pinch of ground cumin, crushed garlic, olive oil, lime juice and Tabasco with salt and pepper.\n    3. Stir sliced chicken breasts, red onion, red pepper and red chilli into the marinade.\n    4. Heat a griddle pan until smoking hot and cook chicken and vegetables until charred, about 5 mins.\n    5. Serve with warmed tortillas, mixed salad and fresh salsa.',25,'https://www.bbcgoodfood.com/recipes/easy-chicken-fajitas',0),(4,'Greek Yogurt with Berries','breakfast','Personal','easy','dairy',5,0,1,'1. Spoon Greek yogurt into a bowl.\n    2. Add blueberries and sliced strawberries.\n    3. Drizzle with honey and sprinkle chia seeds on top.\n    4. Mix gently and serve immediately.',15,NULL,1);
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
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
