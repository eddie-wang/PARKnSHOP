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
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `idorder` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `productname` varchar(60) DEFAULT NULL,
  `storename` varchar(40) DEFAULT NULL,
  `commnum` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `state` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idorder`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (10,'123','123','123',123,123,'2014-10-26','undelivered'),(16,'wangxiaohui','CannoCamera','photograper\'sworld',1,4999,'2014-10-27','undelivered'),(17,'wangxiaohui','CannoCamera','photograper\'sworld',1,4999,'2014-10-27','undelivered'),(18,'wangxiaohui','imac','Moderntech',2,20000,'2014-10-27','undelivered'),(19,'wangxiaohui','imac','Moderntech',2,20000,'2014-10-27','undelivered'),(22,'wangxiaohui','Jay_Bed','Fancy',1,3225,'2014-10-28','undelivered'),(24,'wangxiaohui','Jay_Bed','Fancy',1,3225,'2014-10-28','undelivered'),(25,'wangxiaohui','apple','wahtever',1,3,'2014-10-28','undelivered'),(26,'wangxiaohui','banana','wahtever',1,2,'2014-10-28','undelivered'),(29,'wangxiaohui','apple','wahtever',1,3,'2014-11-06','undelivered'),(30,'wangxiaohui','apple','wahtever',1,3,'2014-11-06','undelivered'),(31,'wangxiaohui','apple','wahtever',1,3,'2014-11-06','undelivered'),(32,'wangxiaohui','apple','wahtever',1,3,'2014-11-06','undelivered'),(33,'wangxiaohui','apple','wahtever',1,3,'2014-11-06','received'),(34,'wangxiaohui','imac','Moderntech',1,20000,'2014-11-08','undelivered'),(35,'wangxiaohui','apple','wahtever',1,3,'2014-11-08','undelivered'),(47,'wangxiaohui','apple','wahtever',4,3,'2014-11-09','undelivered'),(48,'wangxiaohui','Macbookpro','Moderntech',1,12000,'2014-11-09','undelivered'),(49,'wangxiaohui','FruitCake','XiXiBakery',1,123,'2014-11-10','undelivered'),(50,'wangxiaohui','FruitCake','XiXiBakery',1,123,'2014-11-10','undelivered'),(51,'wangxiaohui','FruitCake','XiXiBakery',1,123,'2014-11-10','undelivered'),(52,'wangxiaohui','FruitCake','XiXiBakery',1,123,'2014-11-10','undelivered'),(53,'zheng2','Macbookpro','Moderntech',1,12000,'2014-11-10','received');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-12 16:55:41
