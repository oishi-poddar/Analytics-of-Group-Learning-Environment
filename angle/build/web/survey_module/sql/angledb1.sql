/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  pratik
 * Created: 8 Jun, 2017
 */

-- 7 Jun 2017
-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: angledb1
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `ConferenceDetails`
--

DROP TABLE IF EXISTS `ConferenceDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConferenceDetails` (
  `email` varchar(45) NOT NULL,
  `StartTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EndTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `NoOfParticipants` int(11) NOT NULL,
  `Topic` text NOT NULL,
  `cid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConferenceDetails`
--

LOCK TABLES `ConferenceDetails` WRITE;
/*!40000 ALTER TABLE `ConferenceDetails` DISABLE KEYS */;
INSERT INTO `ConferenceDetails` VALUES ('apurvtandon1995@gmail.com','2017-06-01 21:27:34','2017-06-01 21:27:40',1,'asdf',1),('apurvtandon1995@gmail.com','2017-06-01 22:02:34','2017-06-01 22:02:37',1,'asdf',2),('apurvtandon1995@gmail.com','2017-06-01 22:26:09','2017-06-01 22:26:11',1,'asdlgas',3),('apurvtandon1995@gmail.com','2017-06-01 22:57:59','2017-06-01 22:58:10',1,'asdf',4),('apurvtandon1995@gmail.com','2017-06-01 22:59:56','2017-06-01 23:00:40',3,'asdf',5),('apurvtandon1995@gmail.com','2017-06-02 04:52:09','2017-06-02 04:52:19',1,'asdlgas',6),('apurvtandon1995@gmail.com','2017-06-02 06:10:51','2017-06-02 06:11:00',1,'asdf',7),('apurvtandon1995@gmail.com','2017-06-02 06:12:07','2017-06-02 06:12:23',1,'asdf',8),('apurvtandon1995@gmail.com','2017-06-05 06:18:01','2017-06-05 06:26:21',1,'asdlgas',9),('apurvtandon1995@gmail.com','2017-06-05 06:28:18','2017-06-05 06:29:03',1,'asdf',10),('apurvtandon1995@gmail.com','2017-06-06 11:31:57','2017-06-06 11:33:02',1,'asdf',11),('apurvtandon1995@gmail.com','2017-06-06 11:34:24','2017-06-06 11:36:45',1,'asdf',12);
/*!40000 ALTER TABLE `ConferenceDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feature`
--

DROP TABLE IF EXISTS `Feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Feature` (
  `featureId` int(11) NOT NULL,
  `featureName` varchar(20) NOT NULL,
  `accessNameList` text NOT NULL,
  PRIMARY KEY (`featureId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feature`
--

LOCK TABLES `Feature` WRITE;
/*!40000 ALTER TABLE `Feature` DISABLE KEYS */;
/*!40000 ALTER TABLE `Feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GroupFeatures`
--

DROP TABLE IF EXISTS `GroupFeatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GroupFeatures` (
  `groupId` int(11) NOT NULL,
  `featureList` text NOT NULL,
  KEY `fk_groupId2` (`groupId`),
  CONSTRAINT `fk_groupId2` FOREIGN KEY (`groupId`) REFERENCES `GroupInfo` (`groupId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroupFeatures`
--

LOCK TABLES `GroupFeatures` WRITE;
/*!40000 ALTER TABLE `GroupFeatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `GroupFeatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GroupInfo`
--

DROP TABLE IF EXISTS `GroupInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GroupInfo` (
  `groupId` int(11) NOT NULL AUTO_INCREMENT,
  `groupCode` varchar(8) NOT NULL,
  `groupType` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL COMMENT 'name of group',
  `owner` int(11) NOT NULL COMMENT 'user id',
  `description` text COMMENT 'description about the group',
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUsedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `groupState` tinyint(4) NOT NULL,
  PRIMARY KEY (`groupId`),
  KEY `fk_uid` (`owner`),
  CONSTRAINT `fk_uid` FOREIGN KEY (`owner`) REFERENCES `User` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroupInfo`
--

LOCK TABLES `GroupInfo` WRITE;
/*!40000 ALTER TABLE `GroupInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `GroupInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Login_Info`
--

DROP TABLE IF EXISTS `Login_Info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Login_Info` (
  `LoginId` int(11) NOT NULL,
  `name` text NOT NULL,
  `gender` enum('M','F','O') NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `LoginId` (`LoginId`),
  KEY `LoginId_2` (`LoginId`),
  CONSTRAINT `fk_loginid` FOREIGN KEY (`LoginId`) REFERENCES `User` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login_Info`
--

LOCK TABLES `Login_Info` WRITE;
/*!40000 ALTER TABLE `Login_Info` DISABLE KEYS */;
INSERT INTO `Login_Info` VALUES (1,'Apurva','M','2017-06-07 09:28:58'),(2,'Apurv Tandon','M','2017-06-07 10:43:58'),(3,'Sumit Kr','M','2017-06-07 10:44:50');
/*!40000 ALTER TABLE `Login_Info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ParticipantsDetail`
--

DROP TABLE IF EXISTS `ParticipantsDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ParticipantsDetail` (
  `Jid` varchar(100) NOT NULL,
  `email` text NOT NULL,
  `NickName` text NOT NULL,
  `UserName` text NOT NULL,
  `StartTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TimeDifference` bigint(200) DEFAULT NULL,
  `Topic` text NOT NULL,
  `Message` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParticipantsDetail`
--

LOCK TABLES `ParticipantsDetail` WRITE;
/*!40000 ALTER TABLE `ParticipantsDetail` DISABLE KEYS */;
INSERT INTO `ParticipantsDetail` VALUES ('058b3d1f','rohit@gmail.com','rohit','Apurv Tandon','2017-05-30 20:04:56',0,'abc','heloo kill:heloo kill:le:le:le:le phir se:le phir se'),('11c10486','Rohit1@gmail.com','Rohit1','Apurv Tandon','2017-06-01 13:40:02',0,'api','hello :hello '),('18db72c7','apurvtandon1995@gmail.com','undefined','Apurv Tandon','2017-05-30 18:50:09',0,'pro','hehelp:hehelp:undefined'),('37a0fc0a','Rohit1@gmail.com','Rohit1','Apurv Tandon','2017-06-06 11:49:13',0,'asdf','hello:hello:hjsdhjfkdhsak:my name is rohit:dsfd:fjashfjsd:fjashfjsd'),('443ad9f1','rohit@gmail.com','rohit','Apurv Tandon','2017-05-30 20:04:56',0,'abc','heloo kill:heloo kill:le:le:le:le phir se:le phir se'),('69eee1cc','rohit@gmail.com','rohit','Apurv Tandon','2017-05-30 20:39:50',0,'hii','hello:hello'),('769053fb','Apurv@gmail.com','Apurv','Apurv Tandon','2017-06-01 13:07:10',0,'api','apur hello:apur hello:hi this is rohit'),('88fb35cf','undefined@gmail.com','undefined','Apurv Tandon','2017-06-06 11:49:13',0,'asdf','dsfd:dsfd:dsfd'),('96c91b8f','rohit@gmail.com','rohit','Apurv Tandon','2017-05-30 20:50:14',0,'ghi','huuu:huuu:huu'),('9add5df0','undefined@gmail.com','undefined','Apurv Tandon','2017-06-06 11:49:13',0,'asdf','dsfd:dsfd:dsfd'),('9bb89de0','Apurv@gmail.com','Apurv','Apurv Tandon','2017-06-01 13:01:42',0,'aou','hello:hello:hello:hello'),('ae1773f6','Apurv@gmail.com','Apurv','Apurv Tandon','2017-06-01 12:58:11',0,'apu','hello:hello:hello:hii'),('afa3b3d7','apurvtandon1995@gmail.com','rohit','Apurv Tandon','2017-05-30 18:57:16',0,'test','dff:dff:no its working'),('Apurv Tandon123','Apurv Tandon@gmail.com','Apurv Tandon','Apurv Tandon','2017-05-30 20:21:06',0,'hi','undefined:undefined:undefined:undefined'),('c1b2dd0a','rohit@gmail.com','rohit','Apurv Tandon','2017-05-30 20:50:14',0,'ghi','huuu:huuu:huu'),('c2377b40','undefined@gmail.com','Apurv Tandon','Apurv Tandon','2017-05-30 20:04:49',0,'abc','hello:hello:bahas:hello:bahas:fdsf'),('c288d55a','Rohit1@gmail.com','Rohit1','Apurv Tandon','2017-06-06 11:49:13',0,'asdf','hello:hello:hjsdhjfkdhsak:my name is rohit:dsfd:fjashfjsd:fjashfjsd'),('d4b4bef0','undefined@gmail.com','rohit','Apurv Tandon','2017-05-30 20:04:49',0,'abc','hello:hello:bahas:hello:bahas:fdsf'),('d5462730','Rohit1@gmail.com','Rohit1','Apurv Tandon','2017-06-01 13:40:02',0,'api','hello :hello '),('df3c4c56','Apurv@gmail.com','Apurv','Apurv Tandon','2017-06-01 13:07:10',0,'api','apur hello:apur hello:hi this is rohit'),('f2efd395','Kunal@gmail.com','Kunal','Apurv Tandon','2017-05-31 04:53:12',0,'Pro','Hi:Hi:study urself:dont irritate'),('nickname123','rohit@gmail.com','rohit','Apurv Tandon','2017-05-30 20:04:56',0,'abc','heloo kill:heloo kill:le:le:le:le phir se:le phir se'),('rohit123','rohit@gmail.com','rohit','Apurv Tandon','2017-05-30 20:18:38',0,'hi','hii:hii:hii:hii:hui'),('undefined','apurvtandon1995@gmail.com','Apurv Tandon','Apurv Tandon','2017-05-30 18:50:09',0,'pro','hehelp:hehelp:undefined'),('undefined123','undefined@gmail.com','undefined','Apurv Tandon','2017-05-30 20:20:07',0,'hi','jl:jl:hii');
/*!40000 ALTER TABLE `ParticipantsDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profile`
--

DROP TABLE IF EXISTS `Profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Profile` (
  `profileId` int(11) NOT NULL AUTO_INCREMENT,
  `profileName` text NOT NULL,
  `modifyGroup` tinyint(1) NOT NULL,
  `createTopic` tinyint(1) NOT NULL,
  `modifyTopic` tinyint(1) NOT NULL,
  `postingNote` tinyint(1) NOT NULL,
  `hideNote` tinyint(1) NOT NULL,
  `createAssignment` tinyint(1) NOT NULL,
  `viewAssignment` tinyint(1) NOT NULL,
  `submitAnswer` tinyint(1) NOT NULL,
  `gradeAssignment` tinyint(1) NOT NULL,
  `viewGrades` tinyint(1) NOT NULL,
  `createQuiz` tinyint(1) NOT NULL,
  `viewQuiz` tinyint(1) NOT NULL,
  `sendInvite` tinyint(1) NOT NULL,
  `submitQuiz` tinyint(1) NOT NULL,
  `gradeQuiz` tinyint(1) NOT NULL,
  `startVideoChat` tinyint(1) NOT NULL,
  `startDiscussionForum` tinyint(1) NOT NULL,
  `createPoll` tinyint(1) NOT NULL,
  `viewPoll` tinyint(1) NOT NULL,
  `acceptProfile` tinyint(1) NOT NULL COMMENT 'accept profile for the new user',
  PRIMARY KEY (`profileId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profile`
--

LOCK TABLES `Profile` WRITE;
/*!40000 ALTER TABLE `Profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `Profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique User Id',
  `email` text NOT NULL COMMENT 'email of the user',
  `password` text NOT NULL COMMENT 'password',
  `userIP` text NOT NULL COMMENT 'IP Address',
  `lastLoggedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `loginStatus` tinyint(1) NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'abc@gmail.com','25d55ad283aa400af464c76d713c07ad','0','2017-06-07 09:28:58',1),(2,'apurv@gmail.com','25d55ad283aa400af464c76d713c07ad','127.0.0.1','2017-06-07 10:44:19',1),(3,'sumit@gmail.com','25d55ad283aa400af464c76d713c07ad','127.0.0.1','2017-06-07 10:44:59',1);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserGroup`
--

DROP TABLE IF EXISTS `UserGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserGroup` (
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `profileId` int(11) NOT NULL,
  KEY `fk_userId` (`userId`),
  KEY `fk_groupId` (`groupId`),
  KEY `fk_profileId` (`profileId`),
  CONSTRAINT `fk_groupId` FOREIGN KEY (`groupId`) REFERENCES `GroupInfo` (`groupId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_profileId` FOREIGN KEY (`profileId`) REFERENCES `Profile` (`profileId`),
  CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `User` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserGroup`
--

LOCK TABLES `UserGroup` WRITE;
/*!40000 ALTER TABLE `UserGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_api`
--

DROP TABLE IF EXISTS `jforum_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_key` varchar(32) NOT NULL,
  `api_validity` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_api`
--

LOCK TABLES `jforum_api` WRITE;
/*!40000 ALTER TABLE `jforum_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_attach`
--

DROP TABLE IF EXISTS `jforum_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_attach` (
  `attach_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `privmsgs_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`attach_id`),
  KEY `idx_att_post` (`post_id`),
  KEY `idx_att_priv` (`privmsgs_id`),
  KEY `idx_att_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_attach`
--

LOCK TABLES `jforum_attach` WRITE;
/*!40000 ALTER TABLE `jforum_attach` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_attach_desc`
--

DROP TABLE IF EXISTS `jforum_attach_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_attach_desc` (
  `attach_desc_id` int(11) NOT NULL AUTO_INCREMENT,
  `attach_id` int(11) NOT NULL,
  `physical_filename` varchar(255) NOT NULL,
  `real_filename` varchar(255) NOT NULL,
  `download_count` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `thumb` tinyint(1) DEFAULT '0',
  `extension_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`attach_desc_id`),
  KEY `idx_att_d_att` (`attach_id`),
  KEY `idx_att_d_ext` (`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_attach_desc`
--

LOCK TABLES `jforum_attach_desc` WRITE;
/*!40000 ALTER TABLE `jforum_attach_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_attach_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_attach_quota`
--

DROP TABLE IF EXISTS `jforum_attach_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_attach_quota` (
  `attach_quota_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `quota_limit_id` int(11) NOT NULL,
  PRIMARY KEY (`attach_quota_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_attach_quota`
--

LOCK TABLES `jforum_attach_quota` WRITE;
/*!40000 ALTER TABLE `jforum_attach_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_attach_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_banlist`
--

DROP TABLE IF EXISTS `jforum_banlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_banlist` (
  `banlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `banlist_ip` varchar(15) DEFAULT NULL,
  `banlist_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`banlist_id`),
  KEY `idx_user` (`user_id`),
  KEY `banlist_ip` (`banlist_ip`),
  KEY `banlist_email` (`banlist_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_banlist`
--

LOCK TABLES `jforum_banlist` WRITE;
/*!40000 ALTER TABLE `jforum_banlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_banlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_banner`
--

DROP TABLE IF EXISTS `jforum_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_name` varchar(90) DEFAULT NULL,
  `banner_placement` int(11) NOT NULL DEFAULT '0',
  `banner_description` varchar(250) DEFAULT NULL,
  `banner_clicks` int(11) NOT NULL DEFAULT '0',
  `banner_views` int(11) NOT NULL DEFAULT '0',
  `banner_url` varchar(250) DEFAULT NULL,
  `banner_weight` tinyint(1) NOT NULL DEFAULT '50',
  `banner_active` tinyint(1) NOT NULL DEFAULT '0',
  `banner_comment` varchar(250) DEFAULT NULL,
  `banner_type` int(11) NOT NULL DEFAULT '0',
  `banner_width` int(11) NOT NULL DEFAULT '0',
  `banner_height` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_id`),
  KEY `banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_banner`
--

LOCK TABLES `jforum_banner` WRITE;
/*!40000 ALTER TABLE `jforum_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_bookmarks`
--

DROP TABLE IF EXISTS `jforum_bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_bookmarks` (
  `bookmark_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `relation_id` int(11) NOT NULL,
  `relation_type` int(11) NOT NULL,
  `public_visible` int(11) DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bookmark_id`),
  KEY `book_idx_relation` (`relation_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_bookmarks`
--

LOCK TABLES `jforum_bookmarks` WRITE;
/*!40000 ALTER TABLE `jforum_bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_categories`
--

DROP TABLE IF EXISTS `jforum_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_categories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `display_order` int(11) NOT NULL DEFAULT '0',
  `moderated` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_categories`
--

LOCK TABLES `jforum_categories` WRITE;
/*!40000 ALTER TABLE `jforum_categories` DISABLE KEYS */;
INSERT INTO `jforum_categories` VALUES (1,'Category Test',1,0),(2,'TEAM1',4,0),(3,'hello',3,0),(4,'TEAM2',5,0),(5,'TEAM3',6,0),(6,'q',2,0),(7,'FOR USER1 ONLY',7,0),(8,'Group1',8,0);
/*!40000 ALTER TABLE `jforum_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_config`
--

DROP TABLE IF EXISTS `jforum_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_config` (
  `config_name` varchar(255) NOT NULL DEFAULT '',
  `config_value` varchar(255) NOT NULL DEFAULT '',
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_config`
--

LOCK TABLES `jforum_config` WRITE;
/*!40000 ALTER TABLE `jforum_config` DISABLE KEYS */;
INSERT INTO `jforum_config` VALUES ('most.users.ever.online','3',1),('most.users.ever.online.date','1496138889134',2);
/*!40000 ALTER TABLE `jforum_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_extension_groups`
--

DROP TABLE IF EXISTS `jforum_extension_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_extension_groups` (
  `extension_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `allow` tinyint(1) DEFAULT '1',
  `upload_icon` varchar(100) DEFAULT NULL,
  `download_mode` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`extension_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_extension_groups`
--

LOCK TABLES `jforum_extension_groups` WRITE;
/*!40000 ALTER TABLE `jforum_extension_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_extension_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_extensions`
--

DROP TABLE IF EXISTS `jforum_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_group_id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `upload_icon` varchar(100) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `allow` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`extension_id`),
  KEY `extension_group_id` (`extension_group_id`),
  KEY `extension` (`extension`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_extensions`
--

LOCK TABLES `jforum_extensions` WRITE;
/*!40000 ALTER TABLE `jforum_extensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_forums`
--

DROP TABLE IF EXISTS `jforum_forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_forums` (
  `forum_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_id` int(11) NOT NULL DEFAULT '1',
  `forum_name` varchar(150) NOT NULL DEFAULT '',
  `forum_desc` varchar(255) DEFAULT NULL,
  `forum_order` int(11) DEFAULT '1',
  `forum_topics` int(11) NOT NULL DEFAULT '0',
  `forum_last_post_id` int(11) NOT NULL DEFAULT '0',
  `moderated` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`forum_id`),
  KEY `categories_id` (`categories_id`),
  KEY `idx_forums_cats` (`categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_forums`
--

LOCK TABLES `jforum_forums` WRITE;
/*!40000 ALTER TABLE `jforum_forums` DISABLE KEYS */;
INSERT INTO `jforum_forums` VALUES (1,1,'Test Forum','This is a test forum',1,4,5,0),(2,1,'Test A','testing forum a',2,0,0,0),(3,1,'Test B','testing forum b',1,4,5,0),(4,1,'test c','hi c',3,0,0,0),(5,1,'Test d','testing forum d',4,0,0,0),(6,6,'q1','',5,0,0,0),(7,6,'q2','',6,0,0,0),(8,7,'for user no. 1','hi',7,0,0,0),(9,1,'egrgrfgrdfgrgrdg','',8,0,0,0),(10,1,'gggggggggggggggggggggggggg','',9,0,0,0),(11,7,'fregregregreggggggggggggggggggg','',10,0,0,0),(12,7,'aaaaaaaaaaaaaaaaaa','dsfsdfffffffffffffff',11,0,0,0),(13,7,'bbbbbbbbbbbbbbbbbbb','',12,0,0,0),(14,7,'cccccccccccccccccccccccc','',13,0,0,0),(15,8,'Group1','ddddddd',14,0,0,0),(16,8,'Griuyp2','',15,0,0,0),(17,8,'group3','dsfsdfsdgdgdf',16,0,0,0);
/*!40000 ALTER TABLE `jforum_forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_forums_watch`
--

DROP TABLE IF EXISTS `jforum_forums_watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_forums_watch` (
  `forum_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `idx_fw_forum` (`forum_id`),
  KEY `idx_fw_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_forums_watch`
--

LOCK TABLES `jforum_forums_watch` WRITE;
/*!40000 ALTER TABLE `jforum_forums_watch` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_forums_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_groups`
--

DROP TABLE IF EXISTS `jforum_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(40) NOT NULL DEFAULT '',
  `group_description` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_groups`
--

LOCK TABLES `jforum_groups` WRITE;
/*!40000 ALTER TABLE `jforum_groups` DISABLE KEYS */;
INSERT INTO `jforum_groups` VALUES (1,'General','General Users',0),(2,'Administration','Admin Users',0),(3,'NMEICT','sxx',1),(4,'ABC','HI',1),(5,'ABCd','tI',0),(6,'HIDDEN','I AM TESTING BY MAKING GROUP',0),(7,'HIDDEN','hhfdhdfhgfdh',0),(8,'TEST1','FOR TESTING PURPOSE',0),(9,'Group1','',0);
/*!40000 ALTER TABLE `jforum_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_karma`
--

DROP TABLE IF EXISTS `jforum_karma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_karma` (
  `karma_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `post_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `rate_date` datetime DEFAULT NULL,
  PRIMARY KEY (`karma_id`),
  KEY `post_id` (`post_id`),
  KEY `topic_id` (`topic_id`),
  KEY `post_user_id` (`post_user_id`),
  KEY `from_user_id` (`from_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_karma`
--

LOCK TABLES `jforum_karma` WRITE;
/*!40000 ALTER TABLE `jforum_karma` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_karma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_mail_integration`
--

DROP TABLE IF EXISTS `jforum_mail_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_mail_integration` (
  `forum_id` int(11) NOT NULL,
  `forum_email` varchar(100) NOT NULL,
  `pop_username` varchar(100) NOT NULL,
  `pop_password` varchar(100) NOT NULL,
  `pop_host` varchar(100) NOT NULL,
  `pop_port` int(11) DEFAULT '110',
  `pop_ssl` tinyint(4) DEFAULT '0',
  KEY `forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_mail_integration`
--

LOCK TABLES `jforum_mail_integration` WRITE;
/*!40000 ALTER TABLE `jforum_mail_integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_mail_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_moderation_log`
--

DROP TABLE IF EXISTS `jforum_moderation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_moderation_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `log_description` text NOT NULL,
  `log_original_message` text,
  `log_date` datetime NOT NULL,
  `log_type` tinyint(4) DEFAULT '0',
  `post_id` int(11) DEFAULT '0',
  `topic_id` int(11) DEFAULT '0',
  `post_user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`),
  KEY `post_user_id` (`post_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_moderation_log`
--

LOCK TABLES `jforum_moderation_log` WRITE;
/*!40000 ALTER TABLE `jforum_moderation_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_moderation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_posts`
--

DROP TABLE IF EXISTS `jforum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `post_time` datetime DEFAULT NULL,
  `poster_ip` varchar(15) DEFAULT NULL,
  `enable_bbcode` tinyint(1) NOT NULL DEFAULT '1',
  `enable_html` tinyint(1) NOT NULL DEFAULT '1',
  `enable_smilies` tinyint(1) NOT NULL DEFAULT '1',
  `enable_sig` tinyint(1) NOT NULL DEFAULT '1',
  `post_edit_time` datetime DEFAULT NULL,
  `post_edit_count` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `attach` tinyint(1) DEFAULT '0',
  `need_moderate` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `topic_id` (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `post_time` (`post_time`),
  KEY `need_moderate` (`need_moderate`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_posts`
--

LOCK TABLES `jforum_posts` WRITE;
/*!40000 ALTER TABLE `jforum_posts` DISABLE KEYS */;
INSERT INTO `jforum_posts` VALUES (1,1,1,2,'2005-01-04 16:59:54','127.0.0.1',1,0,1,1,NULL,0,1,0,0),(2,2,1,2,'2017-05-30 15:24:24','127.0.0.1',1,1,1,1,'2017-05-30 15:24:24',0,1,0,0),(3,2,1,4,'2017-05-30 16:36:13','0:0:0:0:0:0:0:1',1,0,1,1,'2017-05-30 16:36:13',0,1,0,0),(4,3,1,2,'2017-05-30 16:51:22','0:0:0:0:0:0:0:1',1,0,1,1,'2017-05-30 16:51:22',0,1,0,0),(5,4,1,2,'2017-05-30 16:51:57','0:0:0:0:0:0:0:1',1,0,1,1,'2017-05-30 16:51:57',0,1,0,0);
/*!40000 ALTER TABLE `jforum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_posts_text`
--

DROP TABLE IF EXISTS `jforum_posts_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_posts_text` (
  `post_id` int(11) NOT NULL,
  `post_text` text,
  `post_subject` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_posts_text`
--

LOCK TABLES `jforum_posts_text` WRITE;
/*!40000 ALTER TABLE `jforum_posts_text` DISABLE KEYS */;
INSERT INTO `jforum_posts_text` VALUES (1,'[b][color=blue][size=18]Congratulations :!: [/size][/color][/b]\nYou have completed the installation, and JForum is up and running. \n\nTo start administering the board, login as [i]Admin / <the password you supplied in the installer>[/i] and access the [b][url=/admBase/login.page]Admin Control Panel[/url][/b] using the link that shows up in the bottom of the page. There you will be able to create Categories, Forums and much more  :D  \n\nFor more information and support, please refer to the following pages:\n\n:arrow: Community forum: http://www.jforum.net/community.jsp\n:arrow: Documentation: http://www.jforum.net/doc\n\nThank you for choosing JForum.\n\n[url=http://www.jforum.net/doc/Team]The JForum Team[/url]\n\n','Welcome to JForum'),(2,'[color=#3AA315][size=18][b]Support JForum - Help the project[/b][/size][/color]<hr>This project is Open Source, and maintained by at least one full time Senior Developer, [i]which costs US$ 3,000.00 / month[/i]. If it helped you, please consider helping this project - especially with some [b][url=http://www.jforum.net/contribute.jsp]donation[/url][/b].\n\n[color=#137C9F][size=14][b]Why supporting this project is a good thing[/b][/size][/color]<hr>The JForum Project started four years ago as a completely free and Open Source program, initially entirely developed on my (Rafael Steil) free time. Today, with the help of some very valuable people, I can spend more time on JForum, to improve it and implement new features (lots of things, requested either on the [url=http://www.jforum.net/forums/list.page]forums[/url] or registered in the [url=http://www.jforum.net/jira]bug tracker[/url]).\nThat is why I am asking you to financially support this work. I love Open Source. I love to use good products without having to pay for it too. But when I see some program that is valuable to my work, that helps me making money, I think it is a good idea to support this project.\n\n[b]Some reasons to support open projects[/b]:<ul><li>Because Open Source is cool? Yes<li>To thank for a great tool? Yes<li>To help the project evolve because this will help my work and my earnings? Yes</ul>Also, as the project grows more and more, it would be great to, sometimes, reward some of the great people who help JForum.\n\nSo, that is what I am asking you: if JForum helps your work, saves your time (time is money, remember?) and increase your earnings, support this project. The simpler way is to make [url=http://www.jforum.net/contribute.jsp]any donation[/url] via PayPal.\n\nJForum has grown a lot every day, since four years ago, which is a great thing, and initially it was not my intention to fully work on this tool. Lately, I am spending a lot of time on it, specially to make JForum 3 a reality, to help users, to improve the program, to research about better solutions. So, your support is very welcome!\n\nThanks!\n\n:arrow: [size=16][b][url=http://www.jforum.net/contribute.jsp]Click here[/url][/b] to go to the [i][b][url=http://www.jforum.net/contribute.jsp]\"Support JForum\"[/url][/b][/i] page.[/size]\n\n','Support JForum - Please read'),(3,'hi testing','Re:Support JForum - Please read'),(4,'zaadadsad','Testing Forum Topic'),(5,'Loser','Donald');

/*!40000 ALTER TABLE `jforum_posts_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_privmsgs`
--

DROP TABLE IF EXISTS `jforum_privmsgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_privmsgs` (
  `privmsgs_id` int(11) NOT NULL AUTO_INCREMENT,
  `privmsgs_type` tinyint(4) NOT NULL DEFAULT '0',
  `privmsgs_subject` varchar(255) NOT NULL DEFAULT '',
  `privmsgs_from_userid` int(11) NOT NULL DEFAULT '0',
  `privmsgs_to_userid` int(11) NOT NULL DEFAULT '0',
  `privmsgs_date` datetime DEFAULT NULL,
  `privmsgs_ip` varchar(15) NOT NULL DEFAULT '',
  `privmsgs_enable_bbcode` tinyint(1) NOT NULL DEFAULT '1',
  `privmsgs_enable_html` tinyint(1) NOT NULL DEFAULT '0',
  `privmsgs_enable_smilies` tinyint(1) NOT NULL DEFAULT '1',
  `privmsgs_attach_sig` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`privmsgs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_privmsgs`
--

LOCK TABLES `jforum_privmsgs` WRITE;
/*!40000 ALTER TABLE `jforum_privmsgs` DISABLE KEYS */;
INSERT INTO `jforum_privmsgs` VALUES (1,2,'hi',4,4,'2017-05-30 16:35:27','',1,0,1,1),(2,1,'hi',4,4,'2017-05-30 16:35:27','',1,0,1,1),(3,2,'hi',2,4,'2017-06-01 12:38:18','',1,0,1,1),(4,1,'hi',2,4,'2017-06-01 12:38:18','',1,0,1,1);
/*!40000 ALTER TABLE `jforum_privmsgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_privmsgs_text`
--

DROP TABLE IF EXISTS `jforum_privmsgs_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_privmsgs_text` (
  `privmsgs_id` int(11) NOT NULL,
  `privmsgs_text` text,
  PRIMARY KEY (`privmsgs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_privmsgs_text`
--

LOCK TABLES `jforum_privmsgs_text` WRITE;
/*!40000 ALTER TABLE `jforum_privmsgs_text` DISABLE KEYS */;
INSERT INTO `jforum_privmsgs_text` VALUES (1,'hi'),(2,'hi'),(3,'dddfdsfdsfdsfdsfds'),(4,'dddfdsfdsfdsfdsfds');
/*!40000 ALTER TABLE `jforum_privmsgs_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_quota_limit`
--

DROP TABLE IF EXISTS `jforum_quota_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_quota_limit` (
  `quota_limit_id` int(11) NOT NULL AUTO_INCREMENT,
  `quota_desc` varchar(50) NOT NULL,
  `quota_limit` int(11) NOT NULL,
  `quota_type` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`quota_limit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_quota_limit`
--

LOCK TABLES `jforum_quota_limit` WRITE;
/*!40000 ALTER TABLE `jforum_quota_limit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_quota_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_ranks`
--

DROP TABLE IF EXISTS `jforum_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_ranks` (
  `rank_id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_title` varchar(50) NOT NULL DEFAULT '',
  `rank_min` int(11) NOT NULL DEFAULT '0',
  `rank_special` tinyint(1) DEFAULT NULL,
  `rank_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_ranks`
--

LOCK TABLES `jforum_ranks` WRITE;
/*!40000 ALTER TABLE `jforum_ranks` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_role_values`
--

DROP TABLE IF EXISTS `jforum_role_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_role_values` (
  `role_id` int(11) NOT NULL,
  `role_value` varchar(255) DEFAULT NULL,
  KEY `idx_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_role_values`
--

LOCK TABLES `jforum_role_values` WRITE;
/*!40000 ALTER TABLE `jforum_role_values` DISABLE KEYS */;
INSERT INTO `jforum_role_values` VALUES (24,'1'),(25,'1'),(26,'1'),(27,'1'),(28,'1'),(29,'1'),(30,'1'),(31,'1'),(32,'1'),(33,'1'),(34,'1'),(35,'1'),(36,'1'),(37,'1'),(38,'1'),(39,'1'),(40,'1'),(25,'4'),(24,'4'),(27,'4'),(3,'4'),(31,'4'),(30,'4'),(37,'4'),(36,'4'),(33,'4'),(32,'4'),(29,'2'),(28,'2'),(41,'4'),(42,'5'),(29,'5'),(28,'5'),(43,'5'),(41,'5'),(29,'6'),(44,'6'),(25,'6'),(24,'6'),(45,'6'),(27,'6'),(3,'6'),(46,'6'),(31,'6'),(30,'6'),(47,'6'),(37,'6'),(36,'6'),(48,'6'),(33,'6'),(32,'6'),(44,'7'),(45,'7'),(27,'7'),(3,'7'),(46,'7'),(31,'7'),(30,'7'),(47,'7'),(37,'7'),(36,'7'),(48,'7'),(33,'7'),(32,'7'),(49,'4'),(50,'7'),(44,'8'),(25,'8'),(24,'8'),(51,'8'),(45,'8'),(27,'8'),(3,'8'),(52,'8'),(46,'8'),(31,'8'),(30,'8'),(53,'8'),(47,'8'),(37,'8'),(36,'8'),(54,'8'),(48,'8'),(33,'8'),(32,'8'),(55,'8'),(44,'9'),(25,'9'),(56,'9'),(57,'9'),(51,'9'),(58,'9'),(59,'9'),(45,'9'),(27,'9'),(3,'9'),(52,'9'),(60,'9'),(61,'9'),(46,'9'),(31,'9'),(30,'9'),(53,'9'),(62,'9'),(63,'9'),(47,'9'),(37,'9'),(36,'9'),(54,'9'),(64,'9'),(65,'9'),(48,'9'),(33,'9'),(32,'9'),(55,'9'),(66,'9'),(67,'9'),(24,'10'),(45,'10'),(27,'10'),(3,'10'),(52,'10'),(60,'10'),(61,'10'),(46,'10'),(31,'10'),(30,'10'),(53,'10'),(62,'10'),(63,'10'),(47,'10'),(37,'10'),(36,'10'),(54,'10'),(64,'10'),(65,'10'),(48,'10'),(33,'10'),(32,'10'),(55,'10'),(66,'10'),(67,'10'),(44,'11'),(25,'11'),(24,'11'),(51,'11'),(58,'11'),(59,'11'),(45,'11'),(27,'11'),(3,'11'),(52,'11'),(60,'11'),(61,'11'),(46,'11'),(31,'11'),(30,'11'),(53,'11'),(62,'11'),(63,'11'),(47,'11'),(37,'11'),(36,'11'),(54,'11'),(64,'11'),(65,'11'),(48,'11'),(33,'11'),(32,'11'),(55,'11'),(66,'11'),(67,'11'),(44,'12'),(25,'12'),(24,'12'),(51,'12'),(58,'12'),(59,'12'),(45,'12'),(27,'12'),(3,'12'),(52,'12'),(60,'12'),(61,'12'),(46,'12'),(31,'12'),(30,'12'),(53,'12'),(62,'12'),(63,'12'),(47,'12'),(37,'12'),(36,'12'),(54,'12'),(64,'12'),(65,'12'),(48,'12'),(33,'12'),(32,'12'),(55,'12'),(66,'12'),(67,'12'),(25,'13'),(51,'13'),(45,'13'),(27,'13'),(3,'13'),(52,'13'),(60,'13'),(61,'13'),(46,'13'),(31,'13'),(30,'13'),(53,'13'),(62,'13'),(63,'13'),(47,'13'),(37,'13'),(36,'13'),(54,'13'),(64,'13'),(65,'13'),(48,'13'),(33,'13'),(32,'13'),(55,'13'),(66,'13'),(67,'13'),(25,'14'),(45,'14'),(27,'14'),(3,'14'),(52,'14'),(60,'14'),(61,'14'),(46,'14'),(31,'14'),(30,'14'),(53,'14'),(62,'14'),(63,'14'),(47,'14'),(37,'14'),(36,'14'),(54,'14'),(64,'14'),(65,'14'),(48,'14'),(33,'14'),(32,'14'),(55,'14'),(66,'14'),(67,'14'),(68,'8'),(44,'15'),(25,'15'),(24,'15'),(69,'15'),(51,'15'),(58,'15'),(59,'15'),(45,'15'),(27,'15'),(3,'15'),(70,'15'),(52,'15'),(60,'15'),(61,'15'),(46,'15'),(31,'15'),(30,'15'),(71,'15'),(53,'15'),(62,'15'),(63,'15'),(47,'15'),(37,'15'),(36,'15'),(72,'15'),(54,'15'),(64,'15'),(65,'15'),(48,'15'),(33,'15'),(32,'15'),(73,'15'),(55,'15'),(66,'15'),(67,'15'),(69,'16'),(45,'16'),(27,'16'),(3,'16'),(70,'16'),(52,'16'),(60,'16'),(61,'16'),(46,'16'),(31,'16'),(30,'16'),(71,'16'),(53,'16'),(62,'16'),(63,'16'),(47,'16'),(37,'16'),(36,'16'),(72,'16'),(54,'16'),(64,'16'),(65,'16'),(48,'16'),(33,'16'),(32,'16'),(73,'16'),(55,'16'),(66,'16'),(67,'16'),(25,'17'),(45,'17'),(27,'17'),(3,'17'),(70,'17'),(52,'17'),(60,'17'),(61,'17'),(46,'17'),(31,'17'),(30,'17'),(71,'17'),(53,'17'),(62,'17'),(63,'17'),(47,'17'),(37,'17'),(36,'17'),(72,'17'),(54,'17'),(64,'17'),(65,'17'),(48,'17'),(33,'17'),(32,'17'),(73,'17'),(55,'17'),(66,'17'),(67,'17'),(69,'17');
/*!40000 ALTER TABLE `jforum_role_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_roles`
--

DROP TABLE IF EXISTS `jforum_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT '0',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `idx_group` (`group_id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_roles`
--

LOCK TABLES `jforum_roles` WRITE;
/*!40000 ALTER TABLE `jforum_roles` DISABLE KEYS */;
INSERT INTO `jforum_roles` VALUES (1,1,'perm_vote'),(2,1,'perm_karma_enabled'),(3,1,'perm_anonymous_post'),(4,1,'perm_create_poll'),(5,1,'perm_bookmarks_enabled'),(6,1,'perm_attachments_download'),(7,1,'perm_create_sticky_announcement_topics'),(8,1,'perm_moderation_log'),(9,2,'perm_administration'),(10,2,'perm_moderation'),(11,2,'perm_moderation_post_remove'),(12,2,'perm_moderation_post_edit'),(13,2,'perm_moderation_topic_move'),(14,2,'perm_moderation_topic_lockUnlock'),(15,2,'perm_moderation_approve_messages'),(16,2,'perm_create_sticky_announcement_topics'),(17,2,'perm_vote'),(18,2,'perm_create_poll'),(19,2,'perm_karma_enabled'),(20,2,'perm_bookmarks_enabled'),(21,2,'perm_attachments_download'),(22,2,'perm_moderation_log'),(23,2,'perm_full_moderation_log'),(24,1,'perm_forum'),(25,2,'perm_forum'),(26,1,'perm_anonymous_post'),(27,2,'perm_anonymous_post'),(28,1,'perm_category'),(29,2,'perm_category'),(30,1,'perm_read_only_forums'),(31,2,'perm_read_only_forums'),(32,1,'perm_html_disabled'),(33,2,'perm_html_disabled'),(34,1,'perm_attachments_enabled'),(35,2,'perm_attachments_enabled'),(36,1,'perm_reply_only'),(37,2,'perm_reply_only'),(38,1,'perm_reply_without_moderation'),(39,2,'perm_reply_without_moderation'),(40,2,'perm_moderation_forums'),(41,3,'perm_category'),(42,5,'perm_category'),(43,4,'perm_category'),(44,5,'perm_forum'),(45,5,'perm_anonymous_post'),(46,5,'perm_read_only_forums'),(47,5,'perm_reply_only'),(48,5,'perm_html_disabled'),(49,2,'perm_category'),(50,6,'perm_category'),(51,6,'perm_forum'),(52,6,'perm_anonymous_post'),(53,6,'perm_read_only_forums'),(54,6,'perm_reply_only'),(55,6,'perm_html_disabled'),(56,4,'perm_forum'),(57,3,'perm_forum'),(58,7,'perm_forum'),(59,8,'perm_forum'),(60,7,'perm_anonymous_post'),(61,8,'perm_anonymous_post'),(62,7,'perm_read_only_forums'),(63,8,'perm_read_only_forums'),(64,7,'perm_reply_only'),(65,8,'perm_reply_only'),(66,7,'perm_html_disabled'),(67,8,'perm_html_disabled'),(68,9,'perm_category'),(69,9,'perm_forum'),(70,9,'perm_anonymous_post'),(71,9,'perm_read_only_forums'),(72,9,'perm_reply_only'),(73,9,'perm_html_disabled');
/*!40000 ALTER TABLE `jforum_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_sessions`
--

DROP TABLE IF EXISTS `jforum_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_sessions` (
  `session_id` varchar(150) NOT NULL DEFAULT '',
  `session_user_id` int(11) NOT NULL DEFAULT '0',
  `session_start` datetime DEFAULT NULL,
  `session_time` bigint(20) DEFAULT '0',
  `session_ip` varchar(15) NOT NULL DEFAULT '',
  `session_page` int(11) NOT NULL DEFAULT '0',
  `session_logged_int` tinyint(1) DEFAULT NULL,
  KEY `idx_sessions_users` (`session_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_sessions`
--

LOCK TABLES `jforum_sessions` WRITE;
/*!40000 ALTER TABLE `jforum_sessions` DISABLE KEYS */;
INSERT INTO `jforum_sessions` VALUES ('d45f351a89c70cc5117af7b349d8',2,'2017-06-06 17:29:16',0,'',0,NULL),('8c6869df5e193a9160f198d13559',3,'2017-05-30 15:28:25',0,'',0,NULL),('909f8537566d859df9f8bf502f72',6,'2017-05-30 16:37:27',0,'',0,NULL),('76e00736dc8dad547b9be23ee896',4,'2017-06-02 11:41:24',0,'',0,NULL),('cd643024ddd853f421a8f5216e42',7,'2017-06-06 15:27:19',0,'',0,NULL),('0e03e7f0abb03a7e54217bc28741',8,'2017-06-07 10:16:43',0,'',0,NULL);
/*!40000 ALTER TABLE `jforum_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_smilies`
--

DROP TABLE IF EXISTS `jforum_smilies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_smilies` (
  `smilie_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(100) DEFAULT NULL,
  `disk_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`smilie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_smilies`
--

LOCK TABLES `jforum_smilies` WRITE;
/*!40000 ALTER TABLE `jforum_smilies` DISABLE KEYS */;
INSERT INTO `jforum_smilies` VALUES (1,':)','<img src=\"#CONTEXT#/images/smilies/3b63d1616c5dfcf29f8a7a031aaa7cad.gif\" />','3b63d1616c5dfcf29f8a7a031aaa7cad.gif'),(2,':-)','<img src=\"#CONTEXT#/images/smilies/3b63d1616c5dfcf29f8a7a031aaa7cad.gif\"/>','3b63d1616c5dfcf29f8a7a031aaa7cad.gif'),(3,':D','<img src=\"#CONTEXT#/images/smilies/283a16da79f3aa23fe1025c96295f04f.gif\" />','283a16da79f3aa23fe1025c96295f04f.gif'),(4,':-D','<img src=\"#CONTEXT#/images/smilies/283a16da79f3aa23fe1025c96295f04f.gif\" />','283a16da79f3aa23fe1025c96295f04f.gif'),(5,':(','<img src=\"#CONTEXT#/images/smilies/9d71f0541cff0a302a0309c5079e8dee.gif\" />','9d71f0541cff0a302a0309c5079e8dee.gif'),(6,':mrgreen:','<img src=\"#CONTEXT#/images/smilies/ed515dbff23a0ee3241dcc0a601c9ed6.gif\" />','ed515dbff23a0ee3241dcc0a601c9ed6.gif'),(7,':-o','<img src=\"#CONTEXT#/images/smilies/47941865eb7bbc2a777305b46cc059a2.gif\"  />','47941865eb7bbc2a777305b46cc059a2.gif'),(8,':shock:','<img src=\"#CONTEXT#/images/smilies/385970365b8ed7503b4294502a458efa.gif\" />','385970365b8ed7503b4294502a458efa.gif'),(9,':?:','<img src=\"#CONTEXT#/images/smilies/0a4d7238daa496a758252d0a2b1a1384.gif\" />','0a4d7238daa496a758252d0a2b1a1384.gif'),(10,'8)','<img src=\"#CONTEXT#/images/smilies/b2eb59423fbf5fa39342041237025880.gif\"  />','b2eb59423fbf5fa39342041237025880.gif'),(11,':lol:','<img src=\"#CONTEXT#/images/smilies/97ada74b88049a6d50a6ed40898a03d7.gif\" />','97ada74b88049a6d50a6ed40898a03d7.gif'),(12,':x','<img src=\"#CONTEXT#/images/smilies/1069449046bcd664c21db15b1dfedaee.gif\"  />','1069449046bcd664c21db15b1dfedaee.gif'),(13,':P','<img src=\"#CONTEXT#/images/smilies/69934afc394145350659cd7add244ca9.gif\" />','69934afc394145350659cd7add244ca9.gif'),(14,':-P','<img src=\"#CONTEXT#/images/smilies/69934afc394145350659cd7add244ca9.gif\" />','69934afc394145350659cd7add244ca9.gif'),(15,':oops:','<img src=\"#CONTEXT#/images/smilies/499fd50bc713bfcdf2ab5a23c00c2d62.gif\" />','499fd50bc713bfcdf2ab5a23c00c2d62.gif'),(16,':cry:','<img src=\"#CONTEXT#/images/smilies/c30b4198e0907b23b8246bdd52aa1c3c.gif\" />','c30b4198e0907b23b8246bdd52aa1c3c.gif'),(17,':evil:','<img src=\"#CONTEXT#/images/smilies/2e207fad049d4d292f60607f80f05768.gif\" />','2e207fad049d4d292f60607f80f05768.gif'),(18,':twisted:','<img src=\"#CONTEXT#/images/smilies/908627bbe5e9f6a080977db8c365caff.gif\" />','908627bbe5e9f6a080977db8c365caff.gif'),(19,':roll:','<img src=\"#CONTEXT#/images/smilies/2786c5c8e1a8be796fb2f726cca5a0fe.gif\" />','2786c5c8e1a8be796fb2f726cca5a0fe.gif'),(20,':wink:','<img src=\"#CONTEXT#/images/smilies/8a80c6485cd926be453217d59a84a888.gif\" />','8a80c6485cd926be453217d59a84a888.gif'),(21,';)','<img src=\"#CONTEXT#/images/smilies/8a80c6485cd926be453217d59a84a888.gif\" />','8a80c6485cd926be453217d59a84a888.gif'),(22,';-)','<img src=\"#CONTEXT#/images/smilies/8a80c6485cd926be453217d59a84a888.gif\" />','8a80c6485cd926be453217d59a84a888.gif'),(23,':!:','<img src=\"#CONTEXT#/images/smilies/9293feeb0183c67ea1ea8c52f0dbaf8c.gif\" />','9293feeb0183c67ea1ea8c52f0dbaf8c.gif'),(24,':?','<img src=\"#CONTEXT#/images/smilies/136dd33cba83140c7ce38db096d05aed.gif\" />','136dd33cba83140c7ce38db096d05aed.gif'),(25,':idea:','<img src=\"#CONTEXT#/images/smilies/8f7fb9dd46fb8ef86f81154a4feaada9.gif\" />','8f7fb9dd46fb8ef86f81154a4feaada9.gif'),(26,':arrow:','<img src=\"#CONTEXT#/images/smilies/d6741711aa045b812616853b5507fd2a.gif\" />','d6741711aa045b812616853b5507fd2a.gif'),(27,':hunf:','<img src=\"#CONTEXT#/images/smilies/0320a00cb4bb5629ab9fc2bc1fcc4e9e.gif\" />','0320a00cb4bb5629ab9fc2bc1fcc4e9e.gif'),(28,':-(','<img src=\"#CONTEXT#/images/smilies/9d71f0541cff0a302a0309c5079e8dee.gif\"  />','9d71f0541cff0a302a0309c5079e8dee.gif'),(29,':XD:','<img src=\"#CONTEXT#/images/smilies/49869fe8223507d7223db3451e5321aa.gif\" />','49869fe8223507d7223db3451e5321aa.gif'),(30,':thumbup:','<img src=\"#CONTEXT#/images/smilies/e8a506dc4ad763aca51bec4ca7dc8560.gif\" />','e8a506dc4ad763aca51bec4ca7dc8560.gif'),(31,':thumbdown:','<img src=\"#CONTEXT#/images/smilies/e78feac27fa924c4d0ad6cf5819f3554.gif\" />','e78feac27fa924c4d0ad6cf5819f3554.gif'),(32,':|','<img src=\"#CONTEXT#/images/smilies/1cfd6e2a9a2c0cf8e74b49b35e2e46c7.gif\" />','1cfd6e2a9a2c0cf8e74b49b35e2e46c7.gif');
/*!40000 ALTER TABLE `jforum_smilies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_themes`
--

DROP TABLE IF EXISTS `jforum_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_themes` (
  `themes_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(30) NOT NULL DEFAULT '',
  `style_name` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`themes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_themes`
--

LOCK TABLES `jforum_themes` WRITE;
/*!40000 ALTER TABLE `jforum_themes` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_topics`
--

DROP TABLE IF EXISTS `jforum_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_topics` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `topic_title` varchar(100) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `topic_time` datetime DEFAULT NULL,
  `topic_views` int(11) DEFAULT '1',
  `topic_replies` int(11) DEFAULT '0',
  `topic_status` tinyint(3) DEFAULT '0',
  `topic_vote_id` int(11) NOT NULL DEFAULT '0',
  `topic_type` tinyint(3) DEFAULT '0',
  `topic_first_post_id` int(11) DEFAULT '0',
  `topic_last_post_id` int(11) NOT NULL DEFAULT '0',
  `topic_moved_id` int(11) DEFAULT '0',
  `moderated` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `user_id` (`user_id`),
  KEY `topic_first_post_id` (`topic_first_post_id`),
  KEY `topic_last_post_id` (`topic_last_post_id`),
  KEY `topic_moved_id` (`topic_moved_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_topics`
--

LOCK TABLES `jforum_topics` WRITE;
/*!40000 ALTER TABLE `jforum_topics` DISABLE KEYS */;
INSERT INTO `jforum_topics` VALUES (1,1,'Welcome to JForum',2,'2005-01-04 16:59:54',2,0,0,0,0,1,1,0,0),(2,1,'Support JForum - Please read',2,'2017-05-30 15:24:24',19,1,0,0,2,2,3,0,0),(3,1,'Testing Forum Topic',2,'2017-05-30 16:51:22',5,0,0,0,0,4,4,0,0),(4,1,'Donald',2,'2017-05-30 16:51:57',13,0,0,0,0,5,5,0,0);
/*!40000 ALTER TABLE `jforum_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_topics_watch`
--

DROP TABLE IF EXISTS `jforum_topics_watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_topics_watch` (
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_read` tinyint(1) DEFAULT '1',
  KEY `idx_topic` (`topic_id`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_topics_watch`
--

LOCK TABLES `jforum_topics_watch` WRITE;
/*!40000 ALTER TABLE `jforum_topics_watch` DISABLE KEYS */;
INSERT INTO `jforum_topics_watch` VALUES (3,2,1),(4,2,1);
/*!40000 ALTER TABLE `jforum_topics_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_user_groups`
--

DROP TABLE IF EXISTS `jforum_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_user_groups` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `idx_group` (`group_id`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_user_groups`
--

LOCK TABLES `jforum_user_groups` WRITE;
/*!40000 ALTER TABLE `jforum_user_groups` DISABLE KEYS */;
INSERT INTO `jforum_user_groups` VALUES (1,1),(2,2),(1,3),(1,4),(1,5),(1,6),(6,7),(9,8),(6,8);
/*!40000 ALTER TABLE `jforum_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_users`
--

DROP TABLE IF EXISTS `jforum_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_active` tinyint(1) DEFAULT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `user_password` varchar(32) NOT NULL DEFAULT '',
  `user_session_time` bigint(20) DEFAULT '0',
  `user_session_page` int(11) NOT NULL DEFAULT '0',
  `user_lastvisit` datetime DEFAULT NULL,
  `user_regdate` datetime DEFAULT NULL,
  `user_level` tinyint(4) DEFAULT NULL,
  `user_posts` int(11) NOT NULL DEFAULT '0',
  `user_timezone` varchar(5) NOT NULL DEFAULT '',
  `user_style` tinyint(4) DEFAULT NULL,
  `user_lang` varchar(255) NOT NULL DEFAULT '',
  `user_dateformat` varchar(20) NOT NULL DEFAULT '%d/%M/%Y %H:%i',
  `user_new_privmsg` int(11) NOT NULL DEFAULT '0',
  `user_unread_privmsg` int(11) NOT NULL DEFAULT '0',
  `user_last_privmsg` datetime DEFAULT NULL,
  `user_emailtime` datetime DEFAULT NULL,
  `user_viewemail` tinyint(1) DEFAULT '0',
  `user_attachsig` tinyint(1) DEFAULT '1',
  `user_allowhtml` tinyint(1) DEFAULT '0',
  `user_allowbbcode` tinyint(1) DEFAULT '1',
  `user_allowsmilies` tinyint(1) DEFAULT '1',
  `user_allowavatar` tinyint(1) DEFAULT '1',
  `user_allow_pm` tinyint(1) DEFAULT '1',
  `user_allow_viewonline` tinyint(1) DEFAULT '1',
  `user_notify` tinyint(1) DEFAULT '1',
  `user_notify_always` tinyint(1) DEFAULT '0',
  `user_notify_text` tinyint(1) DEFAULT '0',
  `user_notify_pm` tinyint(1) DEFAULT '1',
  `user_popup_pm` tinyint(1) DEFAULT '1',
  `rank_id` int(11) DEFAULT '0',
  `user_avatar` varchar(100) DEFAULT NULL,
  `user_avatar_type` tinyint(4) NOT NULL DEFAULT '0',
  `user_email` varchar(255) NOT NULL DEFAULT '',
  `user_icq` varchar(15) DEFAULT NULL,
  `user_website` varchar(255) DEFAULT NULL,
  `user_from` varchar(100) DEFAULT NULL,
  `user_sig` text,
  `user_sig_bbcode_uid` varchar(10) DEFAULT NULL,
  `user_aim` varchar(255) DEFAULT NULL,
  `user_yim` varchar(255) DEFAULT NULL,
  `user_msnm` varchar(255) DEFAULT NULL,
  `user_occ` varchar(100) DEFAULT NULL,
  `user_interests` varchar(255) DEFAULT NULL,
  `user_biography` text,
  `user_actkey` varchar(32) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `themes_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `user_viewonline` tinyint(1) DEFAULT '1',
  `security_hash` varchar(32) DEFAULT NULL,
  `user_karma` double DEFAULT NULL,
  `user_authhash` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_users`
--

LOCK TABLES `jforum_users` WRITE;
/*!40000 ALTER TABLE `jforum_users` DISABLE KEYS */;
INSERT INTO `jforum_users` VALUES (1,NULL,'Anonymous','nopass',0,0,NULL,'2017-05-30 15:24:24',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(2,NULL,'Admin','21232f297a57a5a743894a0e4a801fc3',0,0,NULL,'2017-05-30 15:24:24',NULL,3,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'b274f53bc545f3e65b38dea1170aad79'),(3,1,'pl','288404204e3d452229308317344a285d',0,0,NULL,'2017-05-30 15:28:25',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'pl@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(4,NULL,'chirag','sso ',0,0,NULL,'2017-05-30 16:17:12',NULL,1,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sso@user',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(5,NULL,'1402041050','sso ',0,0,NULL,'2017-05-30 16:27:09',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sso@user',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(6,NULL,'oishi','sso ',0,0,NULL,'2017-05-30 16:37:27',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sso@user',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(7,NULL,'user1','sso ',0,0,NULL,'2017-06-06 15:25:19',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sso@user',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(8,NULL,'user2','sso ',0,0,NULL,'2017-06-06 16:20:14',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'sso@user',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jforum_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_vote_desc`
--

DROP TABLE IF EXISTS `jforum_vote_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_vote_desc` (
  `vote_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `vote_text` varchar(255) NOT NULL DEFAULT '',
  `vote_start` datetime NOT NULL,
  `vote_length` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vote_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_vote_desc`
--

LOCK TABLES `jforum_vote_desc` WRITE;
/*!40000 ALTER TABLE `jforum_vote_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_vote_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_vote_results`
--

DROP TABLE IF EXISTS `jforum_vote_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_vote_results` (
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `vote_option_id` tinyint(4) NOT NULL DEFAULT '0',
  `vote_option_text` varchar(255) NOT NULL DEFAULT '',
  `vote_result` int(11) NOT NULL DEFAULT '0',
  KEY `vote_id` (`vote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_vote_results`
--

LOCK TABLES `jforum_vote_results` WRITE;
/*!40000 ALTER TABLE `jforum_vote_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_vote_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_vote_voters`
--

DROP TABLE IF EXISTS `jforum_vote_voters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_vote_voters` (
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `vote_user_id` int(11) NOT NULL DEFAULT '0',
  `vote_user_ip` varchar(15) NOT NULL DEFAULT '',
  KEY `vote_id` (`vote_id`),
  KEY `vote_user_id` (`vote_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_vote_voters`
--

LOCK TABLES `jforum_vote_voters` WRITE;
/*!40000 ALTER TABLE `jforum_vote_voters` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_vote_voters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_words`
--

DROP TABLE IF EXISTS `jforum_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_words` (
  `word_id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(100) NOT NULL DEFAULT '',
  `replacement` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`word_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_words`
--

LOCK TABLES `jforum_words` WRITE;
/*!40000 ALTER TABLE `jforum_words` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_words` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-07 17:13:02



-- 8 Jun 2017

ALTER TABLE GroupInfo ADD COLUMN `lockState` TINYINT(1) NOT NULL AFTER `groupState`;


ALTER TABLE GroupInfo ADD COLUMN `defaultProfileId` INT NULL AFTER `lockState`,
ADD INDEX `fk_DefaultProfile_idx` (`defaultProfileId` ASC);
ALTER TABLE `GroupInfo` 
ADD CONSTRAINT `fk_DefaultProfile` FOREIGN KEY (`defaultProfileId`) REFERENCES `Profile` (`profileId`) ON DELETE CASCADE ON UPDATE CASCADE;


-- 12 Jun 2017
ALTER TABLE GroupInfo ADD COLUMN `profileIdList` TEXT NULL AFTER `defaultProfileId`;




-- 11 Jun 2017 
-- Modifying Profile Table : changing column name to acceptInvite 
alter table Profile change acceptProfile acceptInvite tinyint(1);


-- 14 Jun 2017
CREATE TABLE `Notification` (
  `notificationId` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `gid` int(11) DEFAULT NULL,
  `title` text NOT NULL,
  `content` text,
  `notificationType` int(11) NOT NULL,
  `viewedFlag` tinyint(1) NOT NULL,
  `dateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`notificationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




--15-June-2017

CREATE TABLE `group_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `note` varchar(100) NOT NULL,
  `noteLink` varchar(300) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `noteFile` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_group_note_1_idx` (`gid`),
  KEY `fk_group_note_2_idx` (`createdBy`),
  CONSTRAINT `fk_group_note_1` FOREIGN KEY (`gid`) REFERENCES `GroupInfo` (`groupId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_group_note_2` FOREIGN KEY (`createdBy`) REFERENCES `User` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--assignment


CREATE TABLE `group_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) NOT NULL,
  `name` text,
  `givenOn` datetime DEFAULT NULL,
  `lastSubmissionDate` datetime DEFAULT NULL,
  `attachment` text,
  `referenceLink` text,
  `description` text,
  `topicName` text,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_group_assignment_1_idx` (`gid`),
  CONSTRAINT `fk_group_assignment_1` FOREIGN KEY (`gid`) REFERENCES `GroupInfo` (`groupId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE `assignment_submission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `submittedOn` datetime DEFAULT NULL,
  `submittedFile` text,
  `grade` text,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `fk_assignment_submission_1_idx` (`aid`),
  KEY `fk_assignment_submission_2_idx` (`uid`),
  CONSTRAINT `fk_assignment_submission_1` FOREIGN KEY (`aid`) REFERENCES `group_assignment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_assignment_submission_2` FOREIGN KEY (`uid`) REFERENCES `Login_Info` (`LoginId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*
    Date 23 June 
    @author : Rohit
    run only these queries;
*/
drop table ConferenceDetails;
create table ConferenceDetails(cid int(11) primary key auto_increment,email varchar(45) not null,StartTime timestamp default NOW(),EndTime timeStamp default NOW(),NoOfParticipants int(11),Topic text not null,groupId int(11) not null);
alter table ParticipantsDetail drop UserName;
alter table ParticipantsDetail add column groupId int(11);
create table JoinConference(email text,NickName text);
alter table ParticipantsDetail add cid int(11);

/*
 *   Date : 24 June
 *   Feature for Poll
*/
CREATE TABLE `angledb1`.`PollData` (
  `pollId` INT NOT NULL,
  `groupId` INT NOT NULL,
  `question` TEXT NOT NULL,
  `createdOn` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` INT NOT NULL,
  `graphType` INT NOT NULL,
  PRIMARY KEY (`pollId`));



CREATE TABLE `angledb1`.`PollOptions` (
  `optionId` INT NOT NULL,
  `pollId` INT NOT NULL,
  `option` TEXT NOT NULL,
  PRIMARY KEY (`optionId`));



CREATE TABLE `angledb1`.`PollVotes` (
  `voteId` INT NOT NULL,
  `pollId` INT NOT NULL,
  `optionId` INT NOT NULL,
  `userId` INT NOT NULL,
  `voteTime` TIMESTAMP NOT NULL,
  PRIMARY KEY (`voteId`));

/*
 *   Feature for Poll
*/



/*
* @author Apurv ToDoList
* To Do List Table Added Make Respective Enteries
*/

CREATE TABLE `toDoList` (
  `userId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `feature` text NOT NULL,
  `topic` text NOT NULL,
  `startDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `toDoList`
--
ALTER TABLE `toDoList`
  ADD KEY `fk_groupId12` (`groupId`),
  ADD KEY `fk_userId12` (`userId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `toDoList`
--
ALTER TABLE `toDoList`
  ADD CONSTRAINT `fk_groupId12` FOREIGN KEY (`groupId`) REFERENCES `GroupInfo` (`groupId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_userId12` FOREIGN KEY (`userId`) REFERENCES `User` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;