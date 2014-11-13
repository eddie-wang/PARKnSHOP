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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `userNameC` varchar(20) NOT NULL,
  `password` varchar(16) DEFAULT NULL,
  `phoneNumber` varchar(14) DEFAULT NULL,
  `E-mail` text,
  `sex` varchar(6) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `adrress` varchar(40) DEFAULT NULL,
  `isBlacklist` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`userNameC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('Eddie','930512','187222222','eddie@gmail.com','male','1990-05-01','asfadsfdsfasd',0),('jack','930512','12321321','123213213@163.com','male','1992-06-04','asasdf',0),('jay','930512','187000000','783637384@qq.com','male','1993-04-03','wahaaa',0),('lily','930512','123123213','werewqr@162.com','female','1993-05-12','asadsf',0),('Lucy','930512','18700861111','LUCY@gmail.com','male','1993-05-12','Xidian Uï¼? DIng Xiang 12',0),('Mike','930512','1313123123','asd@gmail.com','Male','1999-05-12','13123122312',0),('rose','930512','18700867533','787878@qq.com','male','1993-05-12','dasfdasdf',0),('rrw','930512','18700867532','rrw@163.com','male','1993-05-12','Xidian U Haitang 4',0),('wang','930512','123123213','asfasd@163.com','male','1993-05-12','123123',0),('wangxiaohui','930512','1870867532','786830875@qq.com','m','1993-05-12','Xidian U, DingXiang 12',0),('zheng2','zheng2','18723459876','5367435@qq.com','male','1993-09-02','xidian dingxiang',0),('zyp','930512','18700867532','asdfs@163.com','male','1993-05-12','Shenyang TieXI Street',0);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
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
