CREATE DATABASE  IF NOT EXISTS `parknshop` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `parknshop`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: parknshop
-- ------------------------------------------------------
-- Server version	5.6.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `commodity`
--

DROP TABLE IF EXISTS `commodity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodity` (
  `productname` varchar(60) NOT NULL,
  `shopname` varchar(40) NOT NULL,
  `price` double DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `details` text,
  `salevolume` int(11) DEFAULT '0',
  `stock` int(11) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`productname`,`shopname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity`
--

LOCK TABLES `commodity` WRITE;
/*!40000 ALTER TABLE `commodity` DISABLE KEYS */;
INSERT INTO `commodity` VALUES ('apple','wahtever',3,'Dairy&Eggs',' cheap',12,88,'../images/apple.jpg'),('banana','wahtever',2,'fruit',' good!',1,59,'../images/banana.jpg'),('CannoCamera','photograper\'sworld',4999,'Camera',' God!!',2,298,'../images/cannon.jpg'),('chocolatecake','XiXiBakery',233,'Bakery',' yummy~~~',0,134,'../images/chocalatecake.jpg'),('classicmilk','Erie',69,'Wines&Beer',' delicous',0,123,'../images/classicmilk.jpg'),('FruitCake','XiXiBakery',123,'Bakery',' It\'s delicious!!',4,96,'../images/fruitcake.jpg'),('imac','Moderntech',20000,'computer',' good!!!!!!!!',5,195,'../images/imac.jpg'),('Jay\'ssofa','Fancy',3400,'furniture',' Made of genuine leather!',0,30,'../images/sofa.jpg'),('Jay_Bed','Fancy',3225,'furniture',' It\'s comfortable to use!',2,98,'../images/bed.jpg'),('kidscare','Balabala',100,'Baby Care',' it\'s very comfortable!!!',0,150,'../images/balabala1.jpg'),('littlebeef','Snicker',23,'Snacks',' yummy~~~',0,22,'../images/beef1.jpg'),('littlepork','Snicker',45,'Snacks',' can not miss??',0,134,'../images/pork.jpg'),('Macbookpro','Moderntech',12000,'computer','the best computer in the earth.',11,989,'../images/mbp.jpg'),('majiangcake','XiXiBakery',134,'Bakery',' you cannot miss it!',0,100,'../images/majiangcake.jpg'),('milk','Erie',69,'Dairy&Eggs',' low calorie , low fat',0,100,'../images/erie_milk.jpg'),('Nikon','photograper\'sworld',51470,'camera','You could not miss it!!!',0,231,'../images/nikon.jpg'),('niuchahcha','Snicker',34,'Snacks','  Delicious',0,133,'../images/niuchacha.jpg'),('puremilk','Erie',29,'Dairy&Eggs',' pure milk,high quality!',0,3000,'../images/puremilk.jpg'),('Thinkpad','Moderntech',15000,'Computer',' Classical!!',0,20,'../images/thinkpad.jpg');
/*!40000 ALTER TABLE `commodity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-12 16:55:40
