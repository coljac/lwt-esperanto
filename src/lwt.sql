-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: learning-with-texts
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1

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
-- Current Database: `learning-with-texts`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `learning-with-texts` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `learning-with-texts`;

--
-- Table structure for table `_lwtgeneral`
--

DROP TABLE IF EXISTS `_lwtgeneral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_lwtgeneral` (
  `LWTKey` varchar(40) NOT NULL,
  `LWTValue` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`LWTKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_lwtgeneral`
--

LOCK TABLES `_lwtgeneral` WRITE;
/*!40000 ALTER TABLE `_lwtgeneral` DISABLE KEYS */;
INSERT INTO `_lwtgeneral` VALUES ('current_table_prefix',NULL);
/*!40000 ALTER TABLE `_lwtgeneral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archivedtexts`
--

DROP TABLE IF EXISTS `archivedtexts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archivedtexts` (
  `AtID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `AtLgID` int(11) unsigned NOT NULL,
  `AtTitle` varchar(200) NOT NULL,
  `AtText` text NOT NULL,
  `AtAnnotatedText` longtext NOT NULL,
  `AtAudioURI` varchar(200) DEFAULT NULL,
  `AtSourceURI` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`AtID`),
  KEY `AtLgID` (`AtLgID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivedtexts`
--

LOCK TABLES `archivedtexts` WRITE;
/*!40000 ALTER TABLE `archivedtexts` DISABLE KEYS */;
/*!40000 ALTER TABLE `archivedtexts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archtexttags`
--

DROP TABLE IF EXISTS `archtexttags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archtexttags` (
  `AgAtID` int(11) unsigned NOT NULL,
  `AgT2ID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`AgAtID`,`AgT2ID`),
  KEY `AgAtID` (`AgAtID`),
  KEY `AgT2ID` (`AgT2ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archtexttags`
--

LOCK TABLES `archtexttags` WRITE;
/*!40000 ALTER TABLE `archtexttags` DISABLE KEYS */;
/*!40000 ALTER TABLE `archtexttags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `LgID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `LgName` varchar(40) NOT NULL,
  `LgDict1URI` varchar(200) NOT NULL,
  `LgDict2URI` varchar(200) DEFAULT NULL,
  `LgGoogleTranslateURI` varchar(200) DEFAULT NULL,
  `LgExportTemplate` varchar(1000) DEFAULT NULL,
  `LgTextSize` int(5) unsigned NOT NULL DEFAULT '100',
  `LgCharacterSubstitutions` varchar(500) NOT NULL,
  `LgRegexpSplitSentences` varchar(500) NOT NULL,
  `LgExceptionsSplitSentences` varchar(500) NOT NULL,
  `LgRegexpWordCharacters` varchar(500) NOT NULL,
  `LgRemoveSpaces` int(1) unsigned NOT NULL DEFAULT '0',
  `LgSplitEachChar` int(1) unsigned NOT NULL DEFAULT '0',
  `LgRightToLeft` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`LgID`),
  UNIQUE KEY `LgName` (`LgName`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'Esperanto','http://www.reta-vortaro.de/cgi-bin/sercxu.pl?sercxata=###&x=on','https://en.bab.la/dictionary/esperanto-english/###','*http://translate.google.com/?ie=UTF-8&sl=••&tl=••&text=###','$y\\t$t\\n',150,'´=\'|`=\'|’=\'|‘=\'|...=…|..=‥','.!?:;','Mr.|Dr.|[A-Z].|Vd.|Vds.|Sr-o|S-ino','a-zA-ZÀ-ÖØ-öø-ȳĈĉŝŜĝĜŭŬĵĴĥĤ',0,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sentences`
--

DROP TABLE IF EXISTS `sentences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sentences` (
  `SeID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `SeLgID` int(11) unsigned NOT NULL,
  `SeTxID` int(11) unsigned NOT NULL,
  `SeOrder` int(11) unsigned NOT NULL,
  `SeText` text,
  PRIMARY KEY (`SeID`),
  KEY `SeLgID` (`SeLgID`),
  KEY `SeTxID` (`SeTxID`),
  KEY `SeOrder` (`SeOrder`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sentences`
--

LOCK TABLES `sentences` WRITE;
/*!40000 ALTER TABLE `sentences` DISABLE KEYS */;
INSERT INTO `sentences` VALUES (1,1,1,1,'Ho, mia kor\', ne batu maltrankvile, '),(2,1,1,2,'¶ '),(3,1,1,3,'El mia brusto nun ne saltu for! '),(4,1,1,4,'¶ '),(5,1,1,5,'Jam teni min ne povas mi facile, '),(6,1,1,6,'¶ '),(7,1,1,7,'Ho, mia kor\'! '),(8,1,1,8,'¶ '),(9,1,1,9,'¶ '),(10,1,1,10,'Ho, mia kor\'! '),(11,1,1,11,'Post longa laborado '),(12,1,1,12,'¶ '),(13,1,1,13,'Ĉu mi ne venkos en decida hor\'? '),(14,1,1,14,'¶ '),(15,1,1,15,'Sufiĉe! '),(16,1,1,16,'trankviliĝu de l\' batado, '),(17,1,1,17,'¶ '),(18,1,1,18,'Ho, mia kor\'! ');
/*!40000 ALTER TABLE `sentences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `StKey` varchar(40) NOT NULL,
  `StValue` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`StKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('dbversion','v001006003'),('lastscorecalc','2020-09-18'),('currenttext','1');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `TgID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `TgText` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TgComment` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`TgID`),
  UNIQUE KEY `TgText` (`TgText`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags2`
--

DROP TABLE IF EXISTS `tags2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags2` (
  `T2ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `T2Text` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `T2Comment` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`T2ID`),
  UNIQUE KEY `T2Text` (`T2Text`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags2`
--

LOCK TABLES `tags2` WRITE;
/*!40000 ALTER TABLE `tags2` DISABLE KEYS */;
INSERT INTO `tags2` VALUES (1,'poemo','');
/*!40000 ALTER TABLE `tags2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `textitems`
--

DROP TABLE IF EXISTS `textitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `textitems` (
  `TiID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `TiLgID` int(11) unsigned NOT NULL,
  `TiTxID` int(11) unsigned NOT NULL,
  `TiSeID` int(11) unsigned NOT NULL,
  `TiOrder` int(11) unsigned NOT NULL,
  `TiWordCount` int(1) unsigned NOT NULL,
  `TiText` varchar(250) NOT NULL,
  `TiTextLC` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TiIsNotWord` tinyint(1) NOT NULL,
  PRIMARY KEY (`TiID`),
  KEY `TiLgID` (`TiLgID`),
  KEY `TiTxID` (`TiTxID`),
  KEY `TiSeID` (`TiSeID`),
  KEY `TiOrder` (`TiOrder`),
  KEY `TiTextLC` (`TiTextLC`),
  KEY `TiIsNotWord` (`TiIsNotWord`)
) ENGINE=MyISAM AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `textitems`
--

LOCK TABLES `textitems` WRITE;
/*!40000 ALTER TABLE `textitems` DISABLE KEYS */;
INSERT INTO `textitems` VALUES (1,1,1,1,1,1,'Ho','ho',0),(2,1,1,1,1,2,'Ho, mia','ho, mia',0),(3,1,1,1,1,3,'Ho, mia kor','ho, mia kor',0),(4,1,1,1,1,4,'Ho, mia kor\', ne','ho, mia kor\', ne',0),(5,1,1,1,1,5,'Ho, mia kor\', ne batu','ho, mia kor\', ne batu',0),(6,1,1,1,1,6,'Ho, mia kor\', ne batu maltrankvile','ho, mia kor\', ne batu maltrankvile',0),(7,1,1,1,2,1,', ',', ',1),(8,1,1,1,3,1,'mia','mia',0),(9,1,1,1,3,2,'mia kor','mia kor',0),(10,1,1,1,3,3,'mia kor\', ne','mia kor\', ne',0),(11,1,1,1,3,4,'mia kor\', ne batu','mia kor\', ne batu',0),(12,1,1,1,3,5,'mia kor\', ne batu maltrankvile','mia kor\', ne batu maltrankvile',0),(13,1,1,1,4,1,' ',' ',1),(14,1,1,1,5,1,'kor','kor',0),(15,1,1,1,5,2,'kor\', ne','kor\', ne',0),(16,1,1,1,5,3,'kor\', ne batu','kor\', ne batu',0),(17,1,1,1,5,4,'kor\', ne batu maltrankvile','kor\', ne batu maltrankvile',0),(18,1,1,1,6,1,'\', ','\', ',1),(19,1,1,1,7,1,'ne','ne',0),(20,1,1,1,7,2,'ne batu','ne batu',0),(21,1,1,1,7,3,'ne batu maltrankvile','ne batu maltrankvile',0),(22,1,1,1,8,1,' ',' ',1),(23,1,1,1,9,1,'batu','batu',0),(24,1,1,1,9,2,'batu maltrankvile','batu maltrankvile',0),(25,1,1,1,10,1,' ',' ',1),(26,1,1,1,11,1,'maltrankvile','maltrankvile',0),(27,1,1,1,12,1,', ',', ',1),(28,1,1,2,13,1,'¶ ','¶ ',1),(29,1,1,3,14,1,'El','el',0),(30,1,1,3,14,2,'El mia','el mia',0),(31,1,1,3,14,3,'El mia brusto','el mia brusto',0),(32,1,1,3,14,4,'El mia brusto nun','el mia brusto nun',0),(33,1,1,3,14,5,'El mia brusto nun ne','el mia brusto nun ne',0),(34,1,1,3,14,6,'El mia brusto nun ne saltu','el mia brusto nun ne saltu',0),(35,1,1,3,14,7,'El mia brusto nun ne saltu for','el mia brusto nun ne saltu for',0),(36,1,1,3,15,1,' ',' ',1),(37,1,1,3,16,1,'mia','mia',0),(38,1,1,3,16,2,'mia brusto','mia brusto',0),(39,1,1,3,16,3,'mia brusto nun','mia brusto nun',0),(40,1,1,3,16,4,'mia brusto nun ne','mia brusto nun ne',0),(41,1,1,3,16,5,'mia brusto nun ne saltu','mia brusto nun ne saltu',0),(42,1,1,3,16,6,'mia brusto nun ne saltu for','mia brusto nun ne saltu for',0),(43,1,1,3,17,1,' ',' ',1),(44,1,1,3,18,1,'brusto','brusto',0),(45,1,1,3,18,2,'brusto nun','brusto nun',0),(46,1,1,3,18,3,'brusto nun ne','brusto nun ne',0),(47,1,1,3,18,4,'brusto nun ne saltu','brusto nun ne saltu',0),(48,1,1,3,18,5,'brusto nun ne saltu for','brusto nun ne saltu for',0),(49,1,1,3,19,1,' ',' ',1),(50,1,1,3,20,1,'nun','nun',0),(51,1,1,3,20,2,'nun ne','nun ne',0),(52,1,1,3,20,3,'nun ne saltu','nun ne saltu',0),(53,1,1,3,20,4,'nun ne saltu for','nun ne saltu for',0),(54,1,1,3,21,1,' ',' ',1),(55,1,1,3,22,1,'ne','ne',0),(56,1,1,3,22,2,'ne saltu','ne saltu',0),(57,1,1,3,22,3,'ne saltu for','ne saltu for',0),(58,1,1,3,23,1,' ',' ',1),(59,1,1,3,24,1,'saltu','saltu',0),(60,1,1,3,24,2,'saltu for','saltu for',0),(61,1,1,3,25,1,' ',' ',1),(62,1,1,3,26,1,'for','for',0),(63,1,1,3,27,1,'! ','! ',1),(64,1,1,4,28,1,'¶ ','¶ ',1),(65,1,1,5,29,1,'Jam','jam',0),(66,1,1,5,29,2,'Jam teni','jam teni',0),(67,1,1,5,29,3,'Jam teni min','jam teni min',0),(68,1,1,5,29,4,'Jam teni min ne','jam teni min ne',0),(69,1,1,5,29,5,'Jam teni min ne povas','jam teni min ne povas',0),(70,1,1,5,29,6,'Jam teni min ne povas mi','jam teni min ne povas mi',0),(71,1,1,5,29,7,'Jam teni min ne povas mi facile','jam teni min ne povas mi facile',0),(72,1,1,5,30,1,' ',' ',1),(73,1,1,5,31,1,'teni','teni',0),(74,1,1,5,31,2,'teni min','teni min',0),(75,1,1,5,31,3,'teni min ne','teni min ne',0),(76,1,1,5,31,4,'teni min ne povas','teni min ne povas',0),(77,1,1,5,31,5,'teni min ne povas mi','teni min ne povas mi',0),(78,1,1,5,31,6,'teni min ne povas mi facile','teni min ne povas mi facile',0),(79,1,1,5,32,1,' ',' ',1),(80,1,1,5,33,1,'min','min',0),(81,1,1,5,33,2,'min ne','min ne',0),(82,1,1,5,33,3,'min ne povas','min ne povas',0),(83,1,1,5,33,4,'min ne povas mi','min ne povas mi',0),(84,1,1,5,33,5,'min ne povas mi facile','min ne povas mi facile',0),(85,1,1,5,34,1,' ',' ',1),(86,1,1,5,35,1,'ne','ne',0),(87,1,1,5,35,2,'ne povas','ne povas',0),(88,1,1,5,35,3,'ne povas mi','ne povas mi',0),(89,1,1,5,35,4,'ne povas mi facile','ne povas mi facile',0),(90,1,1,5,36,1,' ',' ',1),(91,1,1,5,37,1,'povas','povas',0),(92,1,1,5,37,2,'povas mi','povas mi',0),(93,1,1,5,37,3,'povas mi facile','povas mi facile',0),(94,1,1,5,38,1,' ',' ',1),(95,1,1,5,39,1,'mi','mi',0),(96,1,1,5,39,2,'mi facile','mi facile',0),(97,1,1,5,40,1,' ',' ',1),(98,1,1,5,41,1,'facile','facile',0),(99,1,1,5,42,1,', ',', ',1),(100,1,1,6,43,1,'¶ ','¶ ',1),(101,1,1,7,44,1,'Ho','ho',0),(102,1,1,7,44,2,'Ho, mia','ho, mia',0),(103,1,1,7,44,3,'Ho, mia kor','ho, mia kor',0),(104,1,1,7,45,1,', ',', ',1),(105,1,1,7,46,1,'mia','mia',0),(106,1,1,7,46,2,'mia kor','mia kor',0),(107,1,1,7,47,1,' ',' ',1),(108,1,1,7,48,1,'kor','kor',0),(109,1,1,7,49,1,'\'! ','\'! ',1),(110,1,1,8,50,1,'¶ ','¶ ',1),(111,1,1,9,51,1,'¶ ','¶ ',1),(112,1,1,10,52,1,'Ho','ho',0),(113,1,1,10,52,2,'Ho, mia','ho, mia',0),(114,1,1,10,52,3,'Ho, mia kor','ho, mia kor',0),(115,1,1,10,53,1,', ',', ',1),(116,1,1,10,54,1,'mia','mia',0),(117,1,1,10,54,2,'mia kor','mia kor',0),(118,1,1,10,55,1,' ',' ',1),(119,1,1,10,56,1,'kor','kor',0),(120,1,1,10,57,1,'\'! ','\'! ',1),(121,1,1,11,58,1,'Post','post',0),(122,1,1,11,58,2,'Post longa','post longa',0),(123,1,1,11,58,3,'Post longa laborado','post longa laborado',0),(124,1,1,11,59,1,' ',' ',1),(125,1,1,11,60,1,'longa','longa',0),(126,1,1,11,60,2,'longa laborado','longa laborado',0),(127,1,1,11,61,1,' ',' ',1),(128,1,1,11,62,1,'laborado','laborado',0),(129,1,1,11,63,1,' ',' ',1),(130,1,1,12,64,1,'¶ ','¶ ',1),(131,1,1,13,65,1,'Ĉu','ĉu',0),(132,1,1,13,65,2,'Ĉu mi','ĉu mi',0),(133,1,1,13,65,3,'Ĉu mi ne','ĉu mi ne',0),(134,1,1,13,65,4,'Ĉu mi ne venkos','ĉu mi ne venkos',0),(135,1,1,13,65,5,'Ĉu mi ne venkos en','ĉu mi ne venkos en',0),(136,1,1,13,65,6,'Ĉu mi ne venkos en decida','ĉu mi ne venkos en decida',0),(137,1,1,13,65,7,'Ĉu mi ne venkos en decida hor','ĉu mi ne venkos en decida hor',0),(138,1,1,13,66,1,' ',' ',1),(139,1,1,13,67,1,'mi','mi',0),(140,1,1,13,67,2,'mi ne','mi ne',0),(141,1,1,13,67,3,'mi ne venkos','mi ne venkos',0),(142,1,1,13,67,4,'mi ne venkos en','mi ne venkos en',0),(143,1,1,13,67,5,'mi ne venkos en decida','mi ne venkos en decida',0),(144,1,1,13,67,6,'mi ne venkos en decida hor','mi ne venkos en decida hor',0),(145,1,1,13,68,1,' ',' ',1),(146,1,1,13,69,1,'ne','ne',0),(147,1,1,13,69,2,'ne venkos','ne venkos',0),(148,1,1,13,69,3,'ne venkos en','ne venkos en',0),(149,1,1,13,69,4,'ne venkos en decida','ne venkos en decida',0),(150,1,1,13,69,5,'ne venkos en decida hor','ne venkos en decida hor',0),(151,1,1,13,70,1,' ',' ',1),(152,1,1,13,71,1,'venkos','venkos',0),(153,1,1,13,71,2,'venkos en','venkos en',0),(154,1,1,13,71,3,'venkos en decida','venkos en decida',0),(155,1,1,13,71,4,'venkos en decida hor','venkos en decida hor',0),(156,1,1,13,72,1,' ',' ',1),(157,1,1,13,73,1,'en','en',0),(158,1,1,13,73,2,'en decida','en decida',0),(159,1,1,13,73,3,'en decida hor','en decida hor',0),(160,1,1,13,74,1,' ',' ',1),(161,1,1,13,75,1,'decida','decida',0),(162,1,1,13,75,2,'decida hor','decida hor',0),(163,1,1,13,76,1,' ',' ',1),(164,1,1,13,77,1,'hor','hor',0),(165,1,1,13,78,1,'\'? ','\'? ',1),(166,1,1,14,79,1,'¶ ','¶ ',1),(167,1,1,15,80,1,'Sufiĉe','sufiĉe',0),(168,1,1,15,81,1,'! ','! ',1),(169,1,1,16,82,1,'trankviliĝu','trankviliĝu',0),(170,1,1,16,82,2,'trankviliĝu de','trankviliĝu de',0),(171,1,1,16,82,3,'trankviliĝu de l','trankviliĝu de l',0),(172,1,1,16,82,4,'trankviliĝu de l\' batado','trankviliĝu de l\' batado',0),(173,1,1,16,83,1,' ',' ',1),(174,1,1,16,84,1,'de','de',0),(175,1,1,16,84,2,'de l','de l',0),(176,1,1,16,84,3,'de l\' batado','de l\' batado',0),(177,1,1,16,85,1,' ',' ',1),(178,1,1,16,86,1,'l','l',0),(179,1,1,16,86,2,'l\' batado','l\' batado',0),(180,1,1,16,87,1,'\' ','\' ',1),(181,1,1,16,88,1,'batado','batado',0),(182,1,1,16,89,1,', ',', ',1),(183,1,1,17,90,1,'¶ ','¶ ',1),(184,1,1,18,91,1,'Ho','ho',0),(185,1,1,18,91,2,'Ho, mia','ho, mia',0),(186,1,1,18,91,3,'Ho, mia kor','ho, mia kor',0),(187,1,1,18,92,1,', ',', ',1),(188,1,1,18,93,1,'mia','mia',0),(189,1,1,18,93,2,'mia kor','mia kor',0),(190,1,1,18,94,1,' ',' ',1),(191,1,1,18,95,1,'kor','kor',0),(192,1,1,18,96,1,'\'! ','\'! ',1);
/*!40000 ALTER TABLE `textitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texts`
--

DROP TABLE IF EXISTS `texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texts` (
  `TxID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `TxLgID` int(11) unsigned NOT NULL,
  `TxTitle` varchar(200) NOT NULL,
  `TxText` text NOT NULL,
  `TxAnnotatedText` longtext NOT NULL,
  `TxAudioURI` varchar(200) DEFAULT NULL,
  `TxSourceURI` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`TxID`),
  KEY `TxLgID` (`TxLgID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texts`
--

LOCK TABLES `texts` WRITE;
/*!40000 ALTER TABLE `texts` DISABLE KEYS */;
INSERT INTO `texts` VALUES (1,1,'Ho, mia kor\'','Ho, mia kor\', ne batu maltrankvile,\nEl mia brusto nun ne saltu for!\nJam teni min ne povas mi facile,\nHo, mia kor\'!\n\nHo, mia kor\'! Post longa laborado\nĈu mi ne venkos en decida hor\'?\nSufiĉe! trankviliĝu de l\' batado,\nHo, mia kor\'!','',NULL,'https://en.wikipedia.org/wiki/Ho,_mia_kor%27');
/*!40000 ALTER TABLE `texts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texttags`
--

DROP TABLE IF EXISTS `texttags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texttags` (
  `TtTxID` int(11) unsigned NOT NULL,
  `TtT2ID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`TtTxID`,`TtT2ID`),
  KEY `TtTxID` (`TtTxID`),
  KEY `TtT2ID` (`TtT2ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texttags`
--

LOCK TABLES `texttags` WRITE;
/*!40000 ALTER TABLE `texttags` DISABLE KEYS */;
INSERT INTO `texttags` VALUES (1,1);
/*!40000 ALTER TABLE `texttags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `words`
--

DROP TABLE IF EXISTS `words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `words` (
  `WoID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `WoLgID` int(11) unsigned NOT NULL,
  `WoText` varchar(250) NOT NULL,
  `WoTextLC` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `WoStatus` tinyint(4) NOT NULL,
  `WoTranslation` varchar(500) NOT NULL DEFAULT '*',
  `WoRomanization` varchar(100) DEFAULT NULL,
  `WoSentence` varchar(1000) DEFAULT NULL,
  `WoCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `WoStatusChanged` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `WoTodayScore` double NOT NULL DEFAULT '0',
  `WoTomorrowScore` double NOT NULL DEFAULT '0',
  `WoRandom` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`WoID`),
  UNIQUE KEY `WoLgIDTextLC` (`WoLgID`,`WoTextLC`),
  KEY `WoLgID` (`WoLgID`),
  KEY `WoStatus` (`WoStatus`),
  KEY `WoTextLC` (`WoTextLC`),
  KEY `WoTranslation` (`WoTranslation`(333)),
  KEY `WoCreated` (`WoCreated`),
  KEY `WoStatusChanged` (`WoStatusChanged`),
  KEY `WoTodayScore` (`WoTodayScore`),
  KEY `WoTomorrowScore` (`WoTomorrowScore`),
  KEY `WoRandom` (`WoRandom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `words`
--

LOCK TABLES `words` WRITE;
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
/*!40000 ALTER TABLE `words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wordtags`
--

DROP TABLE IF EXISTS `wordtags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wordtags` (
  `WtWoID` int(11) unsigned NOT NULL,
  `WtTgID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`WtWoID`,`WtTgID`),
  KEY `WtTgID` (`WtTgID`),
  KEY `WtWoID` (`WtWoID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wordtags`
--

LOCK TABLES `wordtags` WRITE;
/*!40000 ALTER TABLE `wordtags` DISABLE KEYS */;
/*!40000 ALTER TABLE `wordtags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-18 10:13:54
