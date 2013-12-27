-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.14


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema roof
--

CREATE DATABASE IF NOT EXISTS roof;
USE roof;

--
-- Definition of table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` (`id`,`name`,`created_at`,`updated_at`) VALUES 
 (1,'SIQ','2013-12-06 06:54:43','2013-12-06 06:54:43'),
 (3,'King roof','2013-12-06 06:59:04','2013-12-06 06:59:04');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;


--
-- Definition of table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `lead_source_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `street1` varchar(100) DEFAULT NULL,
  `street2` varchar(100) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `home_phone` varchar(15) DEFAULT NULL,
  `mobile_phone` varchar(15) DEFAULT NULL,
  `work_phone` varchar(15) DEFAULT NULL,
  `work_phone_ext` varchar(10) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `misc` varchar(500) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `sales_person_id` int(11) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cust_lead_source_idx` (`lead_source_id`),
  KEY `fk_cust_type_idx` (`type`),
  KEY `fk_sales_idx` (`sales_person_id`),
  KEY `fk_cust_company_idx` (`company_id`),
  CONSTRAINT `fk_cust_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cust_lead_source` FOREIGN KEY (`lead_source_id`) REFERENCES `lead_source` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cust_type` FOREIGN KEY (`type`) REFERENCES `customer_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales` FOREIGN KEY (`sales_person_id`) REFERENCES `sales_person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`id`,`first_name`,`last_name`,`email`,`type`,`lead_source_id`,`created_at`,`updated_at`,`street1`,`street2`,`city`,`state`,`zip`,`home_phone`,`mobile_phone`,`work_phone`,`work_phone_ext`,`fax`,`website`,`misc`,`company_id`,`sales_person_id`,`company_name`,`title`,`latitude`,`longitude`) VALUES
 (1,'Niket','Anand','niketanand@gmail.com',2,2,'2013-12-06 05:38:40','2013-12-06 23:16:58','ss','www','Bothell','WA','98021','3333','5555','2222','111','6666','8888','dssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss',3,2,'sss','ddd',NULL,NULL),
 (2,'aaa','bbb','niketanandw@gmail.com',NULL,NULL,'2013-12-06 05:41:40','2013-12-06 07:50:54','3916 212th PL SE','www','Bothell','Washington','98021','ssss','ssssss','sss','ss','6666','8888','ssss',NULL,NULL,NULL,NULL,NULL,NULL),
 (3,'xxxx','ssss','a@b.com',NULL,NULL,'2013-12-06 05:45:16','2013-12-06 05:45:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 (4,'netr','aa','sss',1,1,'2013-12-06 19:29:23','2013-12-06 22:26:04','ss','ss','sss','ss','ss','ss','ss','ss','ss','ss','sss','ss',3,2,NULL,NULL,NULL,NULL),
 (5,'111','222','22',2,2,'2013-12-06 19:40:48','2013-12-06 22:00:24','','','','','','11','','','','','','',3,2,NULL,NULL,NULL,NULL),
 (6,'Robert','John','niketanand@gmail.com',2,2,'2013-12-07 09:54:28','2013-12-07 10:50:02','3916 212th PL SE','','Bothell','WA','98021','4253192176','4253192176','4253192176','','','','',3,2,'Rob','stat','47.80484800','-122.18037000'),
 (7,'Pat','John','sss',NULL,NULL,'2013-12-07 10:44:49','2013-12-07 10:50:35','4055 Factoria Square Mall SE','','Bellevue','WA','98006','','','','','','','',NULL,NULL,'','','47.57332080','-122.17013990'),
 (8,'David','John','ssss',NULL,NULL,'2013-12-07 10:47:45','2013-12-07 10:51:17','10600 Quil Ceda Blvd','','Tulalip','WA','98271','','','','','','','',NULL,NULL,'','','48.09679340','-122.19137160');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;


--
-- Definition of table `customer_type`
--

DROP TABLE IF EXISTS `customer_type`;
CREATE TABLE `customer_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_type`
--

/*!40000 ALTER TABLE `customer_type` DISABLE KEYS */;
INSERT INTO `customer_type` (`id`,`type`,`created_at`,`updated_at`) VALUES 
 (1,'Home owner','2013-12-06 07:01:59','2013-12-06 07:01:59'),
 (2,'Church','2013-12-06 07:02:09','2013-12-06 07:02:09');
/*!40000 ALTER TABLE `customer_type` ENABLE KEYS */;


--
-- Definition of table `job_site`
--

DROP TABLE IF EXISTS `job_site`;
CREATE TABLE `job_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) DEFAULT NULL,
  `contact_name` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `work_phone` varchar(15) DEFAULT NULL,
  `work_phone_ext` varchar(10) DEFAULT NULL,
  `mobile_phone` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `street1` varchar(100) DEFAULT NULL,
  `street2` varchar(100) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `state` varchar(15) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `direction` varchar(200) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_job_site_question_idx` (`question_id`),
  CONSTRAINT `fk_job_site_question` FOREIGN KEY (`question_id`) REFERENCES `job_site_question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_site`
--

/*!40000 ALTER TABLE `job_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_site` ENABLE KEYS */;


--
-- Definition of table `job_site_question`
--

DROP TABLE IF EXISTS `job_site_question`;
CREATE TABLE `job_site_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `easily_accessible` varchar(45) DEFAULT NULL,
  `cust_vacating_when` varchar(45) DEFAULT NULL,
  `parking_consideration` varchar(45) DEFAULT NULL,
  `dumpster_loc_note` varchar(45) DEFAULT NULL,
  `side_garage_use` varchar(45) DEFAULT NULL,
  `driveway_dirt_asphalt` varchar(45) DEFAULT NULL,
  `electrical_location` varchar(45) DEFAULT NULL,
  `animals_restrain` varchar(45) DEFAULT NULL,
  `gutter_color_noted` varchar(45) DEFAULT NULL,
  `landscape_concerns` varchar(45) DEFAULT NULL,
  `work_number_shift` varchar(45) DEFAULT NULL,
  `additional_notes` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_site_question`
--

/*!40000 ALTER TABLE `job_site_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_site_question` ENABLE KEYS */;


--
-- Definition of table `lead_source`
--

DROP TABLE IF EXISTS `lead_source`;
CREATE TABLE `lead_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `source_UNIQUE` (`source`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lead_source`
--

/*!40000 ALTER TABLE `lead_source` DISABLE KEYS */;
INSERT INTO `lead_source` (`id`,`source`,`created_at`,`updated_at`) VALUES 
 (1,'google','2013-12-06 07:04:27','2013-12-06 07:04:27'),
 (2,'paper','2013-12-06 07:04:34','2013-12-06 07:04:34');
/*!40000 ALTER TABLE `lead_source` ENABLE KEYS */;


--
-- Definition of table `sales_person`
--

DROP TABLE IF EXISTS `sales_person`;
CREATE TABLE `sales_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales_person`
--

/*!40000 ALTER TABLE `sales_person` DISABLE KEYS */;
INSERT INTO `sales_person` (`id`,`first_name`,`last_name`,`created_at`,`updated_at`) VALUES 
 (1,'nike','assd','2013-12-06 07:15:03','2013-12-06 07:15:03'),
 (2,'naina','nara','2013-12-06 07:15:13','2013-12-06 07:15:13');
/*!40000 ALTER TABLE `sales_person` ENABLE KEYS */;


--
-- Definition of table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schema_migrations`
--

/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` (`version`) VALUES 
 ('20131206063753'),
 ('20131206070053'),
 ('20131206070333'),
 ('20131206070541');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
