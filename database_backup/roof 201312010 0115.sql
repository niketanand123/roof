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
DROP TABLE IF EXISTS `roof`.`company`;
CREATE TABLE  `roof`.`company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `roof`.`customer`;
CREATE TABLE  `roof`.`customer` (
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
  `is_active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_cust_lead_source_idx` (`lead_source_id`),
  KEY `fk_cust_type_idx` (`type`),
  KEY `fk_sales_idx` (`sales_person_id`),
  KEY `fk_cust_company_idx` (`company_id`),
  CONSTRAINT `fk_cust_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cust_lead_source` FOREIGN KEY (`lead_source_id`) REFERENCES `lead_source` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cust_type` FOREIGN KEY (`type`) REFERENCES `customer_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales` FOREIGN KEY (`sales_person_id`) REFERENCES `sales_person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `roof`.`customer_type`;
CREATE TABLE  `roof`.`customer_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `roof`.`employees`;
CREATE TABLE  `roof`.`employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `roof`.`estimate_types`;
CREATE TABLE  `roof`.`estimate_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estimate_type` varchar(50) DEFAULT NULL,
  `default_overhead` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `roof`.`job_details`;
CREATE TABLE  `roof`.`job_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_start_date` date DEFAULT NULL,
  `job_status_id` int(11) DEFAULT NULL,
  `how_many_stories` varchar(255) DEFAULT NULL,
  `existing_roof_type_id` int(11) DEFAULT NULL,
  `new_roof_type_id` int(11) DEFAULT NULL,
  `product_type_id` int(11) DEFAULT NULL,
  `product_color_id` int(11) DEFAULT NULL,
  `sales_rep_id` int(11) DEFAULT NULL,
  `estimate_type_id` int(11) DEFAULT NULL,
  `contract_price` varchar(255) DEFAULT NULL,
  `deposit_due` varchar(255) DEFAULT NULL,
  `deposit_method` varchar(255) DEFAULT NULL,
  `date_completed` date DEFAULT NULL,
  `job_notes` varchar(255) DEFAULT NULL,
  `lead_sheet_note` varchar(255) DEFAULT NULL,
  `info_taken_by_id` int(11) DEFAULT NULL,
  `assign_to_id` int(11) DEFAULT NULL,
  `date_taken` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_type_idx` (`product_type_id`),
  KEY `fk_exist_roof_type_idx` (`existing_roof_type_id`),
  KEY `fk_new_roof_type_idx` (`new_roof_type_id`),
  KEY `fk_product_color_idx` (`product_color_id`),
  KEY `fk_sales_rep_idx` (`sales_rep_id`),
  KEY `fk_estimate_type_idx` (`estimate_type_id`),
  KEY `fk_info_taken_by_idx` (`info_taken_by_id`),
  KEY `fk_assign_to_idx` (`assign_to_id`),
  CONSTRAINT `fk_assign_to` FOREIGN KEY (`assign_to_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estimate_type` FOREIGN KEY (`estimate_type_id`) REFERENCES `estimate_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_exist_roof_type` FOREIGN KEY (`existing_roof_type_id`) REFERENCES `roof_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_info_taken_by` FOREIGN KEY (`info_taken_by_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_new_roof_type` FOREIGN KEY (`new_roof_type_id`) REFERENCES `roof_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_color` FOREIGN KEY (`product_color_id`) REFERENCES `product_colors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_type` FOREIGN KEY (`product_type_id`) REFERENCES `product_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_rep` FOREIGN KEY (`sales_rep_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `roof`.`job_service_types`;
CREATE TABLE  `roof`.`job_service_types` (
  `job_id` int(11) NOT NULL,
  `service_type_id` int(11) NOT NULL,
  PRIMARY KEY (`job_id`,`service_type_id`),
  KEY `fk_serv_type_idx` (`service_type_id`),
  CONSTRAINT `fk_serv_type` FOREIGN KEY (`service_type_id`) REFERENCES `service_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_job_id` FOREIGN KEY (`job_id`) REFERENCES `job_site` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `roof`.`job_site`;
CREATE TABLE  `roof`.`job_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
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
  `easily_accessible` varchar(45) DEFAULT NULL,
  `cust_vacating_when` varchar(45) DEFAULT NULL,
  `parking_consideration` varchar(45) DEFAULT NULL,
  `dumpster_loc_note` varchar(45) DEFAULT NULL,
  `side_garage_use` varchar(45) DEFAULT NULL,
  `driveway_dirt_asphalt` varchar(45) DEFAULT NULL,
  `electrical_location` varchar(45) DEFAULT NULL,
  `water_sanitation_avail` varchar(45) DEFAULT NULL,
  `animals_restrain` varchar(45) DEFAULT NULL,
  `gutter_color_noted` varchar(45) DEFAULT NULL,
  `landscape_concerns` varchar(45) DEFAULT NULL,
  `work_number_shift` varchar(45) DEFAULT NULL,
  `additional_notes` varchar(200) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT '1',
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_job_customer_idx` (`customer_id`),
  CONSTRAINT `fk_job_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `roof`.`job_statuses`;
CREATE TABLE  `roof`.`job_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_status` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `roof`.`lead_source`;
CREATE TABLE  `roof`.`lead_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `source_UNIQUE` (`source`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `roof`.`product_colors`;
CREATE TABLE  `roof`.`product_colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_color` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `roof`.`product_types`;
CREATE TABLE  `roof`.`product_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_type` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `roof`.`roof_types`;
CREATE TABLE  `roof`.`roof_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roof_type` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `roof`.`sales_person`;
CREATE TABLE  `roof`.`sales_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `roof`.`schema_migrations`;
CREATE TABLE  `roof`.`schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `roof`.`service_types`;
CREATE TABLE  `roof`.`service_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_type` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;