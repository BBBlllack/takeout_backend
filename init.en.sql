-- MySQL dump 10.13  Distrib 8.0.32, for macos13 (arm64)
--
-- Host: localhost    Database: software_takeout
-- ------------------------------------------------------
-- Server version	8.0.32

create database if not exists software_takeout;

use software_takeout;

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `status` bigint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_address_user_uid` (`uid`),
  CONSTRAINT `fk_address_user_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1738087474120486915 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,1734895272690987009,'John Doe','123-456-7890','123 Main St, City A',1),(2,3,'Jane Smith','987-654-3210','456 Oak St, City B',1),(3,4,'Alice Johnson','555-123-4567','789 Elm St, City C',1),(4,5,'Bob Miller','777-888-9999','321 Pine St, City D',1),(5,6,'Emily Brown','111-222-3333','654 Maple St, City E',1),(6,7,'David Davis','444-555-6666','987 Birch St, City F',1),(7,8,'Grace White','888-999-0000','234 Cedar St, City G',1),(8,9,'Samuel Lee','222-333-4444','567 Spruce St, City H',1),(9,10,'Olivia Taylor','666-777-8888','890 Walnut St, City I',1),(10,2,'Michael Wilson','333-444-5555','234 Pine St, City J',1),(11,3,'Sophia Hall','555-666-7777','567 Oak St, City K',1),(12,4,'Daniel Adams','999-000-1111','890 Elm St, City L',1),(13,5,'Ava Martinez','111-222-3333','123 Maple St, City M',1),(14,6,'Ethan Turner','777-888-9999','456 Cedar St, City N',1),(15,7,'Isabella Murphy','222-333-4444','789 Spruce St, City O',1),(16,8,'Liam Garcia','888-999-0000','321 Birch St, City P',1),(17,9,'Mia Foster','444-555-6666','654 Walnut St, City Q',1),(18,10,'Noah Carter','666-777-8888','987 Pine St, City R',1),(1737845755812716546,1737826819041849346,'d','+8615734174861','甘井子区大连湾街道毛茔子村六月福商店',0),(1737846233439117313,1737826819041849346,'5','+8615734174861','甘井子区大连湾街道毛茔子村六月福商店',0),(1738087474120486914,1737826819041849346,'阿里组','15912345678','河北工业大学北辰校区东西区宿舍',1);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rid` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_restaurant_rid` (`rid`),
  CONSTRAINT `fk_category_restaurant_rid` FOREIGN KEY (`rid`) REFERENCES `restaurant` (`id`),
  CONSTRAINT `category_chk_1` CHECK ((`status` in (0,1,2,3,4,5)))
) ENGINE=InnoDB AUTO_INCREMENT=1738043838620069890 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,1,'Appetizers',1),(2,2,'Main Course',1),(3,3,'Desserts',1),(4,4,'Beverages',1),(5,5,'Specials',1),(6,1,'Salads',1),(7,2,'Seafood',1),(8,3,'Ice Cream',1),(9,4,'Soft Drinks',1),(10,5,'Chef Recommendations',1),(11,1,'Soup',1),(12,2,'Pasta',1),(13,3,'Cakes',1),(14,4,'Coffee',1),(15,5,'Healthy Options',1),(1737789815122006018,1,'爆炒猫粮',1),(1737789931023208450,1,'香煎鲫鱼',1),(1738043838620069889,1,'爆炒程序员',0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliver`
--

DROP TABLE IF EXISTS `deliver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliver` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliver`
--

LOCK TABLES `deliver` WRITE;
/*!40000 ALTER TABLE `deliver` DISABLE KEYS */;
INSERT INTO `deliver` VALUES (1,'张小明','13812345678','password123','avatar1.jpg',1),(2,'王小红','13698765432','securePass','avatar2.jpg',1),(3,'李大志','13987654321','deliveryPass','avatar3.jpg',1),(4,'刘小芳','13776543210','pass1234','avatar4.jpg',1),(5,'陈小刚','13555443322','deliveryPass123','avatar5.jpg',0),(6,'赵丽丽','13866554433','secure123','avatar6.jpg',0),(7,'孙小强','13644332211','deliveryPass456','avatar7.jpg',1),(8,'周小雨','13788776655','rainyDay','avatar8.jpg',1),(9,'吴大宝','13999887766','bigBoss','avatar9.jpg',0),(10,'郑小乐','13566778899','happy123','avatar10.jpg',1);
/*!40000 ALTER TABLE `deliver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cid` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `price` decimal(6,2) NOT NULL,
  `discount` decimal(4,2) NOT NULL DEFAULT '0.00',
  `cover` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `rid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dish_category_cid` (`cid`),
  KEY `fk_dish_rest_rid` (`rid`),
  CONSTRAINT `fk_dish_category_cid` FOREIGN KEY (`cid`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_dish_rest_rid` FOREIGN KEY (`rid`) REFERENCES `restaurant` (`id`),
  CONSTRAINT `dish_chk_1` CHECK ((`status` in (0,1,2,3,4,5)))
) ENGINE=InnoDB AUTO_INCREMENT=1737807091867009026 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,1,'Margherita Pizza','Classic tomato and mozzarella cheese pizza.',3.00,0.90,'https://s2.loli.net/2023/12/22/AFmZaLJikxY4oq9.png',1,1),(2,2,'Chicken Alfredo Pasta','Creamy Alfredo sauce with grilled chicken over pasta.',14.99,0.00,'https://s2.loli.net/2023/12/22/AFmZaLJikxY4oq9.png',1,2),(3,3,'Chocolate Fudge Cake','Decadent chocolate cake with fudge icing.',7.99,0.00,'https://s2.loli.net/2023/12/22/AFmZaLJikxY4oq9.png',1,3),(4,4,'Caesar Salad','Fresh romaine lettuce with Caesar dressing and croutons.',8.99,0.00,'https://s2.loli.net/2023/12/22/AFmZaLJikxY4oq9.png',1,4),(5,5,'Seafood Paella','Traditional Spanish dish with a mix of seafood and rice.',18.99,0.00,'https://s2.loli.net/2023/12/22/AFmZaLJikxY4oq9.png',1,5),(6,6,'Mango Tango Smoothie','Refreshing smoothie with mango and tropical flavors.',5.99,0.00,'https://s2.loli.net/2023/12/22/AFmZaLJikxY4oq9.png',1,1),(7,7,'Spaghetti Bolognese','Classic Italian meat sauce over a bed of spaghetti.',12.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,2),(8,8,'Strawberry Cheesecake','Creamy cheesecake with fresh strawberries on top.',10.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,3),(9,9,'Grilled Salmon','Salmon fillet grilled to perfection with lemon and herbs.',16.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,4),(10,10,'Vegetarian Stir-Fry','Assorted vegetables stir-fried in a savory sauce.',11.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,5),(11,11,'Pineapple Paradise Pizza','Hawaiian-style pizza with ham and pineapple.',13.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,1),(12,12,'Tiramisu','Classic Italian dessert with layers of coffee-soaked ladyfingers and mascarpone.',9.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,2),(13,13,'Chicken Caesar Wrap','Grilled chicken, romaine lettuce, and Caesar dressing in a wrap.',8.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,3),(14,14,'Green Tea Ice Cream','Japanese green tea-flavored ice cream.',6.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,4),(15,15,'BBQ Pulled Pork Sandwich','Slow-cooked pulled pork with BBQ sauce on a bun.',10.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,5),(16,1,'Vegetarian Pizza','Delicious pizza with assorted fresh vegetables.',11.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',2,1),(17,2,'Shrimp Scampi Pasta','Garlic butter shrimp served over a bed of pasta.',16.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,2),(18,3,'Red Velvet Cake','Moist and fluffy red velvet cake with cream cheese frosting.',8.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,3),(19,4,'Greek Salad','Crunchy Greek salad with olives, feta cheese, and dressing.',9.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,4),(20,5,'Sushi Platter','Assorted sushi rolls with soy sauce and wasabi.',19.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,5),(21,6,'Blueberry Blast Smoothie','Refreshing smoothie with blueberries and yogurt.',6.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',2,1),(22,7,'Chicken Parmesan','Breaded and baked chicken topped with marinara and melted cheese.',13.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,2),(23,8,'Mint Chocolate Chip Ice Cream','Classic mint-flavored ice cream with chocolate chips.',7.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,3),(24,9,'Lobster Tail','Butter-poached lobster tail served with drawn butter.',21.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,4),(25,10,'Caprese Salad','Fresh mozzarella, tomatoes, and basil drizzled with balsamic glaze.',10.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,5),(26,11,'BBQ Chicken Pizza','Barbecue chicken, red onions, and cilantro on a pizza.',14.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,1),(27,12,'Cheesecake Brownies','Decadent brownies swirled with creamy cheesecake.',9.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,2),(28,13,'Turkey Club Sandwich','Classic turkey club with bacon, lettuce, and tomato.',8.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,3),(29,14,'Pistachio Ice Cream','Rich and creamy pistachio-flavored ice cream.',6.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,4),(30,15,'Cajun Grilled Chicken','Spicy Cajun-seasoned grilled chicken breast.',12.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,5),(1737805688855523330,1737789815122006018,'d','5',3.00,5.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',2,1),(1737806417406111746,2,'2',NULL,4.00,3.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',2,1),(1737806717856690178,1737789931023208450,'R','6',54.00,5.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,1),(1737806773598990338,1737789815122006018,'H','78',556.00,6.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,1),(1737806928716935169,11,'657','6',6.00,6.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',2,1),(1737807091867009025,15,'78','67346',567.00,89.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',2,1);
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domap`
--

DROP TABLE IF EXISTS `domap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domap` (
  `did` bigint NOT NULL,
  `oid` bigint NOT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domap`
--

LOCK TABLES `domap` WRITE;
/*!40000 ALTER TABLE `domap` DISABLE KEYS */;
INSERT INTO `domap` VALUES (1,1,NULL),(2,2,NULL),(3,3,NULL),(1,1735250801363845121,NULL),(2,1738028320613765121,NULL),(1,1738028582875205634,NULL),(2,1738029389943181313,NULL),(2,1738030238379544578,NULL);
/*!40000 ALTER TABLE `domap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `oid` bigint DEFAULT NULL,
  `did` bigint DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `mark` int DEFAULT '0',
  `quantity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_orderdetail_order_oid` (`oid`),
  KEY `fk_orderdetail_dish_did` (`did`),
  CONSTRAINT `fk_orderdetail_dish_did` FOREIGN KEY (`did`) REFERENCES `dish` (`id`),
  CONSTRAINT `fk_orderdetail_order_oid` FOREIGN KEY (`oid`) REFERENCES `orders` (`id`),
  CONSTRAINT `orderdetail_chk_1` CHECK (((`mark` <= 5) and (`mark` >= 0)))
) ENGINE=InnoDB AUTO_INCREMENT=1742073812159111171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (1,1,1,NULL,0,1),(2,1,2,NULL,0,2),(3,2,1,NULL,0,3),(4,2,2,NULL,0,2),(5,3,3,NULL,0,3),(1735250801598726146,1735250801363845121,1,9.99,0,2),(1735250801607114753,1735250801363845121,2,14.99,0,3),(1735250801611309057,1735250801363845121,3,7.99,0,1),(1738028320781537281,1738028320613765121,6,17.97,0,3),(1738028582921342978,1738028582875205634,6,5.99,0,1),(1738029389985124353,1738029389943181313,21,69.90,0,10),(1738030238442459137,1738030238379544578,6,359.40,0,60),(1738948296417742850,1738948296283525121,1,13.65,0,5),(1738948296430325761,1738948296283525121,16,11.99,0,1),(1738948296430325762,1738948296283525121,1,2.73,0,1),(1739164481130360833,1739164481029697537,16,11.99,0,1),(1739164481134555137,1739164481029697537,1,2.73,0,1),(1742072935184670722,1742072935042064385,1,2.73,0,1),(1742072935193059329,1742072935042064385,6,5.99,0,1),(1742073812159111169,1742073812066836481,1,2.73,0,1),(1742073812159111170,1742073812066836481,6,5.99,0,1);
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint DEFAULT NULL,
  `aid` bigint DEFAULT NULL,
  `totalprice` decimal(8,2) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `rid` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_user_uid` (`uid`),
  KEY `fk_order_address_aid` (`aid`),
  KEY `fk_orders_rid` (`rid`),
  CONSTRAINT `fk_order_address_aid` FOREIGN KEY (`aid`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_order_user_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_orders_rid` FOREIGN KEY (`rid`) REFERENCES `restaurant` (`id`),
  CONSTRAINT `orders_chk_1` CHECK ((`status` in (0,1,2,3,4,5)))
) ENGINE=InnoDB AUTO_INCREMENT=1742073812066836482 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,1,NULL,'2023-12-13 23:20:43',NULL,1,1),(2,2,1,NULL,'2023-12-13 23:20:58',NULL,NULL,2),(3,2,10,NULL,'2023-12-13 23:21:49',NULL,NULL,3),(1735250801363845121,1734895272690987009,1,NULL,'2023-12-14 18:50:05','不放香菜',1,1),(1738028320613765121,1737826819041849346,1737846233439117313,NULL,'2023-12-22 10:46:57',NULL,1,1),(1738028582875205634,1737826819041849346,1737846233439117313,NULL,'2023-12-22 10:47:59',NULL,3,1),(1738029389943181313,1737826819041849346,1737846233439117313,NULL,'2023-12-22 10:51:12',NULL,0,1),(1738030238379544578,1737826819041849346,1737846233439117313,NULL,'2023-12-22 10:54:34',NULL,0,1),(1738948296283525121,1737826819041849346,1738087474120486914,NULL,'2023-12-24 23:42:36',NULL,0,1),(1739164481029697537,1737826819041849346,1738087474120486914,NULL,'2023-12-25 14:01:39',NULL,3,1),(1742072935042064385,1737826819041849346,1738087474120486914,NULL,'2024-01-02 14:38:48',NULL,3,1),(1742073812066836481,1737826819041849346,1738087474120486914,NULL,'2024-01-02 14:42:17',NULL,1,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `announce` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `sale` bigint NOT NULL DEFAULT '0',
  `mark` decimal(2,1) DEFAULT NULL,
  `percent` decimal(4,2) NOT NULL DEFAULT '10.00',
  `regtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  CONSTRAINT `restaurant_chk_1` CHECK (((`mark` <= 5) and (`mark` >= 1))),
  CONSTRAINT `restaurant_chk_2` CHECK ((`status` in (0,1,2,3,4,5)))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Super Delight Restaurant','admin','admin','Welcome to Super Delight Restaurant!!!','123 Main St, City A','https://s2.loli.net/2023/12/21/gnBSXybRDQfwqtF.png',150,4.2,15.00,'2023-01-01 10:00:00',1),(2,'Gourmet Palace','1234567892','password2','Discover the flavors at Gourmet Palace','456 Oak St, City B','cover2.jpg',120,4.5,12.50,'2023-02-05 12:30:00',1),(3,'Tasty Treats Bistro','1234567893','password3','Indulge in Tasty Treats at our Bistro','789 Maple St, City C','cover3.jpg',180,4.0,10.00,'2023-03-10 15:45:00',1),(4,'Savor the Spice','1234567894','password4','Experience the spice at Savor the Spice','101 Pine St, City D','cover4.jpg',130,4.7,18.00,'2023-04-15 18:20:00',0),(5,'Urban Eats','1234567895','password5','Your go-to place for Urban Eats','202 Cedar St, City E','cover5.jpg',160,4.3,16.50,'2023-05-20 21:10:00',1),(6,'Golden Spoon Restaurant','1234567890','passwordA','Delicious dishes served with love.','123 Main St, Cityville','goldenspoon_cover.jpg',80,4.2,15.50,'2023-01-01 08:30:00',1),(7,'Sizzling Grills','9876543210','passwordB','Experience the joy of grilling!','456 Oak St, Townsville','sizzlinggrills_cover.jpg',120,3.8,14.20,'2023-01-02 15:45:00',0),(8,'Rustic Plate Bistro','5555555555','passwordC','Where tradition meets modern flavors.','789 Maple St, Villageton','rusticplate_cover.jpg',90,4.5,13.00,'2023-01-03 12:15:00',1),(9,'Ocean Fresh Seafood','9998887777','passwordD','Bringing the ocean to your table.','321 Pine St, Beach City','oceanfresh_cover.jpg',110,4.0,16.80,'2023-01-04 18:00:00',1),(10,'Urban Spice Kitchen','4443332222','passwordE','A journey of flavors from around the world.','567 Elm St, Metropolis','urbanspice_cover.jpg',100,4.8,12.30,'2023-01-05 10:30:00',0),(11,'Mama Mia Pizzeria','1112223333','passwordF','Authentic Italian pizzas made with love.','876 Birch St, Pizzatown','mamamia_cover.jpg',85,4.3,14.50,'2023-01-06 13:45:00',1),(12,'Spicy Wok Express','6667778888','passwordG','Savor the heat of Asian wok dishes.','234 Cedar St, Spicetown','spicywok_cover.jpg',95,3.5,11.70,'2023-01-07 17:20:00',0),(13,'Green Leaf Cafe','3334445555','passwordH','Wholesome and hearty vegetarian delights.','789 Walnut St, Greensville','greenleaf_cover.jpg',75,4.0,13.20,'2023-01-08 11:10:00',1),(14,'Bella Vita Trattoria','7778889999','passwordI','Experience the good life with authentic Italian flavors.','456 Chestnut St, Bellaville','bellavita_cover.jpg',105,4.7,15.10,'2023-01-09 14:30:00',1),(15,'Flaming Grill House','2221110000','passwordJ','Where the grill meets excitement.','987 Oak St, Flametown','flaminggrill_cover.jpg',115,3.9,14.80,'2023-01-10 19:15:00',0),(16,'Sushi Delight','8889990000','passwordK','Indulge in the artistry of Japanese cuisine.','123 Pine St, Sushiville','sushidelight_cover.jpg',88,4.6,12.60,'2023-01-11 12:45:00',1),(17,'Taste of India','1110009999','passwordL','A symphony of spices in every bite.','654 Maple St, Indiatown','tasteofindia_cover.jpg',98,4.1,13.90,'2023-01-12 16:40:00',0),(18,'Fusion Bites','6669993333','passwordM','Blending flavors for a culinary adventure.','789 Elm St, Fusionville','fusionbites_cover.jpg',80,4.4,11.50,'2023-01-13 10:00:00',1),(19,'Mediterranean Oasis','3338885555','passwordN','Escape to the shores of the Mediterranean.','345 Birch St, Meditown','mediterraneanoasis_cover.jpg',92,4.2,14.20,'2023-01-14 13:20:00',1),(20,'Smokehouse BBQ','5554442222','passwordO','Savor the rich flavors of authentic barbecue.','876 Cedar St, Smoketown','smokehousebbq_cover.jpg',105,3.7,12.90,'2023-01-15 18:30:00',0),(21,'Crispy Corner','9990001111','passwordP','Crunchy delights to satisfy every craving.','432 Walnut St, Crispytown','crispycorner_cover.jpg',82,4.0,11.20,'2023-01-16 11:50:00',1),(22,'Choco Bliss Cafe','4443336666','passwordQ','Indulge in a world of chocolatey goodness.','567 Oak St, Chocotown','chocobliss_cover.jpg',94,4.5,13.70,'2023-01-17 15:10:00',0),(23,'Gourmet Grill Hub','1112225555','passwordR','Elevate your taste buds with gourmet delights.','765 Pine St, Gourmetville','gourmetgrill_cover.jpg',110,3.9,14.50,'2023-01-18 17:45:00',1),(24,'Sunrise Breakfast Nook','8885552222','passwordS','Start your day with a delightful sunrise meal.','987 Elm St, Sunrisetown','sunrise_cover.jpg',78,4.1,12.00,'2023-01-19 09:00:00',0),(25,'Zen Tea House','2225558888','passwordT','Sip tranquility with every cup of tea.','543 Birch St, Zentown','zen_tea_cover.jpg',96,4.3,13.40,'2023-01-20 14:15:00',1);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopcar`
--

DROP TABLE IF EXISTS `shopcar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopcar` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint NOT NULL,
  `did` bigint NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `rid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_shopcar_user_uid` (`uid`),
  KEY `fk_shopcar_dish_did` (`did`),
  CONSTRAINT `fk_shopcar_dish_did` FOREIGN KEY (`did`) REFERENCES `dish` (`id`),
  CONSTRAINT `fk_shopcar_user_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1742073792278085635 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopcar`
--

LOCK TABLES `shopcar` WRITE;
/*!40000 ALTER TABLE `shopcar` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopcar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `regtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  CONSTRAINT `user_chk_1` CHECK ((`status` in (0,1,2,3,4,5)))
) ENGINE=InnoDB AUTO_INCREMENT=1737826819041849347 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'Alice Smith','12345678902','123456','','2023-01-02 09:15:00',0),(3,'Bob Johnson','12345678903','123456','','2023-01-03 10:30:00',1),(4,'Emma White','12345678904','123456','','2023-01-04 11:45:00',0),(5,'Michael Brown','12345678905','123456','','2023-01-05 13:00:00',1),(6,'Sophia Davis','12345678906','123456','','2023-01-06 14:15:00',0),(7,'Matthew Wilson','12345678907','123456','','2023-01-07 15:30:00',1),(8,'Olivia Martinez','12345678908','123456','','2023-01-08 16:45:00',0),(9,'Daniel Taylor','12345678909','123456','','2023-01-09 18:00:00',1),(10,'Ava Garcia','12345678910','123456','','2023-01-10 19:15:00',0),(1734895272690987009,'用户3139','15930193139','zhang123',NULL,'2023-12-13 19:17:20',0),(1735243744732553217,'zhangsan','123456789','zhangsan',NULL,'2023-12-14 18:22:03',0),(1737826819041849346,'用户_wm2E1','user','user','https://s2.loli.net/2023/12/22/1HqzGPBC6vDfeZm.png','2023-12-21 21:26:15',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-10 11:51:11
