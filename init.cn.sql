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
INSERT INTO `address` VALUES (1,1734895272690987009,'John Doe','123-456-7890','123 Main St, City A',0),(2,3,'Jane Smith','987-654-3210','456 Oak St, City B',1),(3,4,'Alice Johnson','555-123-4567','789 Elm St, City C',1),(4,5,'Bob Miller','777-888-9999','321 Pine St, City D',1),(5,6,'Emily Brown','111-222-3333','654 Maple St, City E',1),(6,7,'David Davis','444-555-6666','987 Birch St, City F',1),(7,8,'Grace White','888-999-0000','234 Cedar St, City G',1),(8,9,'Samuel Lee','222-333-4444','567 Spruce St, City H',1),(9,10,'Olivia Taylor','666-777-8888','890 Walnut St, City I',1),(10,2,'Michael Wilson','333-444-5555','234 Pine St, City J',1),(11,3,'Sophia Hall','555-666-7777','567 Oak St, City K',1),(12,4,'Daniel Adams','999-000-1111','890 Elm St, City L',1),(13,5,'Ava Martinez','111-222-3333','123 Maple St, City M',1),(14,6,'Ethan Turner','777-888-9999','456 Cedar St, City N',1),(15,7,'Isabella Murphy','222-333-4444','789 Spruce St, City O',1),(16,8,'Liam Garcia','888-999-0000','321 Birch St, City P',1),(17,9,'Mia Foster','444-555-6666','654 Walnut St, City Q',1),(18,10,'Noah Carter','666-777-8888','987 Pine St, City R',1),(1737845755812716546,1737826819041849346,'d','+8615734174861','甘井子区大连湾街道毛茔子村六月福商店',0),(1737846233439117313,1737826819041849346,'5','+8615734174861','甘井子区大连湾街道毛茔子村六月福商店',0),(1738087474120486914,1737826819041849346,'阿里组','15912345678','河北工业大学北辰校区东西区宿舍',1);
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
INSERT INTO `category` VALUES (1,1,'开胃菜',1),(2,2,'主菜',1),(3,3,'甜点',1),(4,4,'饮料',1),(5,5,'特色菜',1),(6,1,'沙拉',1),(7,2,'海鲜',1),(8,3,'冰淇淋',1),(9,4,'软饮料',1),(10,5,'主厨推荐',1),(11,1,'汤',1),(12,2,'意大利面',1),(13,3,'蛋糕',1),(14,4,'咖啡',1),(15,5,'健康选项',1),(1737789815122006018,1,'爆炒猫粮',1),(1737789931023208450,1,'香煎鲫鱼',1),(1738043838620069889,1,'爆炒bug',0);
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
INSERT INTO `dish` VALUES (1,1,'玛格丽塔披萨','经典的番茄和莫扎里拉奶酪披萨。',3.00,0.90,'https://s2.loli.net/2023/12/22/AFmZaLJikxY4oq9.png',1,1),(2,2,'鸡肉阿尔弗雷多意面','搭配烤鸡的奶油阿尔弗雷多酱意面。',14.99,0.00,'https://s2.loli.net/2023/12/22/AFmZaLJikxY4oq9.png',1,2),(3,3,'巧克力软糖蛋糕','浓郁的巧克力蛋糕配软糖糖霜。',7.99,0.00,'https://s2.loli.net/2023/12/22/AFmZaLJikxY4oq9.png',1,3),(4,4,'凯撒沙拉','新鲜的罗马生菜搭配凯撒酱和烤面包块。',8.99,0.00,'https://s2.loli.net/2023/12/22/AFmZaLJikxY4oq9.png',1,4),(5,5,'海鲜烩饭','传统西班牙菜，融合海鲜和米饭。',18.99,0.00,'https://s2.loli.net/2023/12/22/AFmZaLJikxY4oq9.png',1,5),(6,6,'芒果探戈冰沙','清爽的芒果热带风味冰沙。',5.99,0.00,'https://s2.loli.net/2023/12/22/AFmZaLJikxY4oq9.png',1,1),(7,7,'意大利肉酱面','经典意大利肉酱配意大利面。',12.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,2),(8,8,'草莓芝士蛋糕','浓郁的芝士蛋糕，顶部配新鲜草莓。',10.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,3),(9,9,'烤三文鱼','柠檬香草调味烤至完美的三文鱼排。',16.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,4),(10,10,'素食炒菜','多种蔬菜以美味的酱汁炒制而成。',11.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,5),(11,11,'菠萝天堂披萨','夏威夷风味披萨，配火腿和菠萝。',13.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,1),(12,12,'提拉米苏','经典意大利甜点，咖啡浸泡手指饼干和马斯卡彭奶酪的分层。',9.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,2),(13,13,'鸡肉凯撒卷饼','烤鸡肉、罗马生菜和凯撒酱包裹在卷饼中。',8.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,3),(14,14,'抹茶冰淇淋','日式抹茶味冰淇淋。',6.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,4),(15,15,'烧烤拉猪肉三明治','慢煮拉猪肉配烧烤酱夹在面包中。',10.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,5),(16,1,'素食披萨','美味的披萨，上面有多种新鲜蔬菜。',11.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',2,1),(17,2,'虾仁意面','大蒜黄油虾配意大利面。',16.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,2),(18,3,'红丝绒蛋糕','湿润松软的红丝绒蛋糕配奶油奶酪糖霜。',8.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,3),(19,4,'希腊沙拉','脆爽的希腊沙拉，配橄榄、羊奶酪和调味酱。',9.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,4),(20,5,'寿司拼盘','多种寿司卷，搭配酱油和芥末。',19.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,5),(21,6,'蓝莓爆炸冰沙','清新的蓝莓酸奶冰沙。',6.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',2,1),(22,7,'鸡肉帕尔马干酪','裹面包屑烘烤的鸡肉，上面撒有番茄酱和融化的奶酪。',13.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,2),(23,8,'薄荷巧克力片冰淇淋','经典的薄荷味冰淇淋配巧克力片。',7.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,3),(24,9,'龙虾尾','黄油慢煮龙虾尾，配融化的黄油。',21.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,4),(25,10,'卡普雷塞沙拉','新鲜的莫扎里拉奶酪、西红柿和罗勒，淋上香醋酱。',10.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,5),(26,11,'烧烤鸡肉披萨','烧烤鸡肉、红洋葱和香菜搭配披萨。',14.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,1),(27,12,'芝士蛋糕布朗尼','浓郁的布朗尼蛋糕，融合了奶油芝士蛋糕的味道。',9.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,2),(28,13,'火鸡俱乐部三明治','经典火鸡俱乐部三明治，配培根、生菜和西红柿。',8.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,3),(29,14,'开心果冰淇淋','浓郁奶油的开心果味冰淇淋。',6.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,4),(30,15,'凯郡烤鸡','辛辣的凯郡风味烤鸡胸肉。',12.99,0.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,5),(1737805688855523330,1737789815122006018,'芝士蛋糕','',3.00,5.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',2,1),(1737806417406111746,2,'南京烤鸭',NULL,4.00,3.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',2,1),(1737806717856690178,1737789931023208450,'薄荷巧克力片冰淇淋','',54.00,5.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,1),(1737806773598990338,1737789815122006018,'黄焖鸡','',556.00,6.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',1,1),(1737806928716935169,11,'凯郡烤鸡','',6.00,6.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',2,1),(1737807091867009025,15,'希腊沙拉','',567.00,89.00,'https://th.bing.com/th/id/OIP.2dhr5Ln6cMHIu9SmwE_uBgHaE7?w=273&h=182&c=7&r=0&o=5&dpr=2&pid=1.7',2,1);
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
INSERT INTO `restaurant` VALUES (1,'醉香人间美味居','admin','admin','醉香人间美味居，品味地道的舌尖传奇','亨顺广场A区 12号','https://s2.loli.net/2023/12/21/gnBSXybRDQfwqtF.png',150,4.2,15.00,'2023-01-01 10:00:00',1),(2,'福满楼锦绣食府','1234567892','password2','福满楼锦绣食府，为您献上奢华的饕餮盛宴','亨顺广场B区 45号','cover2.jpg',120,4.5,12.50,'2023-02-05 12:30:00',1),(3,'天香雅轩云间阁','1234567893','password3','天香雅轩云间阁，清雅环境中的别样美味','亨顺广场A区 78号','cover3.jpg',180,4.0,10.00,'2023-03-10 15:45:00',1),(4,'绿竹庭院春风斋','1234567894','password4','香满楼经典佳肴，诠释地道的中华风味','亨顺广场B区 23号','cover4.jpg',130,4.7,18.00,'2023-04-15 18:20:00',0),(5,'悠然美食醉客栈','1234567895','password5','盛世御膳皇宴庭，感受皇家级别的用餐体验','亨顺广场A区 56号','cover5.jpg',160,4.3,16.50,'2023-05-20 21:10:00',1),(6,'鸿运满堂盛世居','1234567890','passwordA','品尚厨艺百味坊，融合传统与现代的美食文化','亨顺广场B区 89号','https://s2.loli.net/2023/12/21/gnBSXybRDQfwqtF.png',80,4.2,15.50,'2023-01-01 08:30:00',1),(7,'锦味楼百味人家','9876543210','passwordB','天府之味川香居，尽享麻辣鲜香的地道川菜','亨顺广场A区 34号','sizzlinggrills_cover.jpg',120,3.8,14.20,'2023-01-02 15:45:00',0),(8,'馋香坊江南忆苑','5555555555','passwordC','桃源春晓田园居，回归自然的绿色饮食之选','亨顺广场B区 67号','rusticplate_cover.jpg',90,4.5,13.00,'2023-01-03 12:15:00',1),(9,'禾香满园绿柳轩','9998887777','passwordD','琼楼玉宇美食苑，体验珍馐美馔的至臻享受','亨顺广场A区 90号','https://s2.loli.net/2023/12/21/gnBSXybRDQfwqtF.png',110,4.0,16.80,'2023-01-04 18:00:00',1),(10,'味之源醉美江南','4443332222','passwordE','百味轩全季餐厅，让每一季都充满味蕾的惊喜','亨顺广场B区 11号','urbanspice_cover.jpg',100,4.8,12.30,'2023-01-05 10:30:00',0),(11,'香满楼食里飘香','1112223333','passwordF','悦客堂特色食府，打造宾至如归的用餐氛围','亨顺广场A区 22号','mamamia_cover.jpg',85,4.3,14.50,'2023-01-06 13:45:00',1),(12,'福禄寿喜锦绣堂','6667778888','passwordG','醉仙楼山水隐居，感受诗意山水间的美味佳肴','亨顺广场B区 33号','spicywok_cover.jpg',95,3.5,11.70,'2023-01-07 17:20:00',0),(13,'闲云雅居人间味','3334445555','passwordH','春华秋实四季居，传承自然季节的精致美味','亨顺广场A区 44号','greenleaf_cover.jpg',75,4.0,13.20,'2023-01-08 11:10:00',1),(14,'锦绣江南天香阁','7778889999','passwordI','御品堂经典川粤，让味蕾畅游中国南北风味','亨顺广场B区 55号','bellavita_cover.jpg',105,4.7,15.10,'2023-01-09 14:30:00',1),(15,'食香客栈春风堂','2221110000','passwordJ','碧水云间海鲜阁，鲜美与清新在此完美结合','亨顺广场A区 66号','flaminggrill_cover.jpg',115,3.9,14.80,'2023-01-10 19:15:00',0),(16,'盛世味道云鼎居','8889990000','passwordK','九鼎轩百家宴，为您呈现舌尖上的传统盛宴','亨顺广场B区 77号','sushidelight_cover.jpg',88,4.6,12.60,'2023-01-11 12:45:00',1),(17,'醉美春色悠然馆','1110009999','passwordL','华庭雅苑湖畔轩，享受水天一色中的静谧美味','亨顺广场A区 88号','tasteofindia_cover.jpg',98,4.1,13.90,'2023-01-12 16:40:00',0),(18,'百味雅居福满园','6669993333','passwordM','锦绣江南特色堂，品味江南水乡的美食文化','亨顺广场B区 99号','fusionbites_cover.jpg',80,4.4,11.50,'2023-01-13 10:00:00',1),(19,'天香锦苑云中楼','3338885555','passwordN','天籁之味山珍馆，体验深山原生态的珍馐美味','亨顺广场A区 10号','mediterraneanoasis_cover.jpg',92,4.2,14.20,'2023-01-14 13:20:00',1),(20,'炊烟袅袅江南楼','5554442222','passwordO','蓬莱阁海天盛筵，感受仙境般的海鲜美食之旅','亨顺广场B区 20号','smokehousebbq_cover.jpg',105,3.7,12.90,'2023-01-15 18:30:00',0),(21,'品味江南闲庭轩','9990001111','passwordP','悠然春舍田园小厨，收获家的温暖与自然的恩赐','亨顺广场A区 30号','crispycorner_cover.jpg',82,4.0,11.20,'2023-01-16 11:50:00',1),(22,'禾香锦堂醉仙楼','4443336666','passwordQ','听风小筑文艺餐厅，让用餐成为一场艺术享受','亨顺广场B区 40号','chocobliss_cover.jpg',94,4.5,13.70,'2023-01-17 15:10:00',0),(23,'锦绣佳肴天香园','1112225555','passwordR','知味轩经典粤菜馆，探寻传统粤菜的独特魅力','亨顺广场A区 50号','gourmetgrill_cover.jpg',110,3.9,14.50,'2023-01-18 17:45:00',1),(24,'福运春风江湖阁','8885552222','passwordS','九味楼私房定制，为您量身打造专属美味体验','亨顺广场B区 60号','sunrise_cover.jpg',78,4.1,12.00,'2023-01-19 09:00:00',0),(25,'悠悠江南醉香楼','2225558888','passwordT','逸品堂中华食府，融汇传统与创新的绝佳美食','亨顺广场A区 70号','zen_tea_cover.jpg',96,4.3,13.40,'2023-01-20 14:15:00',1);
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
INSERT INTO `user` VALUES (2,'用户_wm2E1213','12345678902','123456','https://static.vecteezy.com/system/resources/previews/008/302/513/non_2x/eps10-blue-user-icon-or-logo-in-simple-flat-trendy-modern-style-isolated-on-white-background-free-vector.jpg','2023-01-02 09:15:00',0),(3,'用户_wm2E21','12345678903','123456','https://static.vecteezy.com/system/resources/previews/008/302/513/non_2x/eps10-blue-user-icon-or-logo-in-simple-flat-trendy-modern-style-isolated-on-white-background-free-vector.jpg','2023-01-03 10:30:00',1),(4,'用户_wm2E1','12345678904','123456','https://static.vecteezy.com/system/resources/previews/008/302/513/non_2x/eps10-blue-user-icon-or-logo-in-simple-flat-trendy-modern-style-isolated-on-white-background-free-vector.jpg','2023-01-04 11:45:00',0),(5,'用户_wm2E1','12345678905','123456','https://static.vecteezy.com/system/resources/previews/008/302/513/non_2x/eps10-blue-user-icon-or-logo-in-simple-flat-trendy-modern-style-isolated-on-white-background-free-vector.jpg','2023-01-05 13:00:00',1),(6,'用户_wm2E1','12345678906','123456','https://static.vecteezy.com/system/resources/previews/008/302/513/non_2x/eps10-blue-user-icon-or-logo-in-simple-flat-trendy-modern-style-isolated-on-white-background-free-vector.jpg','2023-01-06 14:15:00',0),(7,'用户_wm2E1','12345678907','123456','https://static.vecteezy.com/system/resources/previews/008/302/513/non_2x/eps10-blue-user-icon-or-logo-in-simple-flat-trendy-modern-style-isolated-on-white-background-free-vector.jpg','2023-01-07 15:30:00',1),(8,'用户_wm2E1','12345678908','123456','https://static.vecteezy.com/system/resources/previews/008/302/513/non_2x/eps10-blue-user-icon-or-logo-in-simple-flat-trendy-modern-style-isolated-on-white-background-free-vector.jpg','2023-01-08 16:45:00',0),(9,'用户_wm2E1','12345678909','123456','https://static.vecteezy.com/system/resources/previews/008/302/513/non_2x/eps10-blue-user-icon-or-logo-in-simple-flat-trendy-modern-style-isolated-on-white-background-free-vector.jpg','2023-01-09 18:00:00',1),(10,'用户_wm2E1','12345678910','123456','https://static.vecteezy.com/system/resources/previews/008/302/513/non_2x/eps10-blue-user-icon-or-logo-in-simple-flat-trendy-modern-style-isolated-on-white-background-free-vector.jpg','2023-01-10 19:15:00',0),(1734895272690987009,'用户3139','15930193139','zhang123','https://static.vecteezy.com/system/resources/previews/008/302/513/non_2x/eps10-blue-user-icon-or-logo-in-simple-flat-trendy-modern-style-isolated-on-white-background-free-vector.jpg','2023-12-13 19:17:20',1),(1735243744732553217,'zhangsan','123456789','zhangsan','https://static.vecteezy.com/system/resources/previews/008/302/513/non_2x/eps10-blue-user-icon-or-logo-in-simple-flat-trendy-modern-style-isolated-on-white-background-free-vector.jpg','2023-12-14 18:22:03',1),(1737826819041849346,'用户_wm2E1','user','user','https://s2.loli.net/2023/12/22/1HqzGPBC6vDfeZm.png','2023-12-21 21:26:15',1);
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

-- Dump completed on 2024-12-10 21:21:00
