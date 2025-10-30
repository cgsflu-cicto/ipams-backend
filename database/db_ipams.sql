/*
SQLyog Enterprise - MySQL GUI v6.56
MySQL - 5.5.5-10.4.28-MariaDB : Database - db_ipams
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `annual_investment_plans` */

CREATE TABLE `annual_investment_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `aip_code` varchar(255) NOT NULL,
  `ppa` text NOT NULL,
  `office_id` int(11) unsigned NOT NULL,
  `aip_year` int(4) NOT NULL,
  `start_date` date DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `expected_outputs` text DEFAULT NULL,
  `funding_source_id` int(11) unsigned DEFAULT NULL,
  `personal_services` decimal(15,2) DEFAULT 0.00,
  `mooe` decimal(15,2) DEFAULT 0.00,
  `capital_outlay` decimal(15,2) DEFAULT 0.00,
  `cc_adaptation` varchar(255) DEFAULT NULL,
  `cc_mitigation` varchar(255) DEFAULT NULL,
  `cc_topology_code` varchar(255) DEFAULT NULL,
  `type` enum('Regular','Supplemental') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `aip_code` (`aip_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `annual_investment_plans` */

insert  into `annual_investment_plans`(`id`,`aip_code`,`ppa`,`office_id`,`aip_year`,`start_date`,`completion_date`,`expected_outputs`,`funding_source_id`,`personal_services`,`mooe`,`capital_outlay`,`cc_adaptation`,`cc_mitigation`,`cc_topology_code`,`type`,`created_at`,`updated_at`,`deleted_at`) values (1,'AIP-2024-001','Rehabilitation of drainage system',24,2024,'2024-01-10','2024-10-10','Reduced flooding in barangays',3,'100.00','200.00','300.00','yes','123','INFRA','Regular','2025-10-28 04:21:43','2025-10-28 05:12:39',NULL);
insert  into `annual_investment_plans`(`id`,`aip_code`,`ppa`,`office_id`,`aip_year`,`start_date`,`completion_date`,`expected_outputs`,`funding_source_id`,`personal_services`,`mooe`,`capital_outlay`,`cc_adaptation`,`cc_mitigation`,`cc_topology_code`,`type`,`created_at`,`updated_at`,`deleted_at`) values (2,'AIP-2025-001','Road Widening Project Phase 1',24,2025,'2025-01-01','2025-10-01','Improved road access and traffic flow',1,'100000.00','200000.00','300000.00','Flood prevention','Reduced emissions','CC1234','Regular','2025-10-29 02:26:24','2025-10-29 02:26:24',NULL);
insert  into `annual_investment_plans`(`id`,`aip_code`,`ppa`,`office_id`,`aip_year`,`start_date`,`completion_date`,`expected_outputs`,`funding_source_id`,`personal_services`,`mooe`,`capital_outlay`,`cc_adaptation`,`cc_mitigation`,`cc_topology_code`,`type`,`created_at`,`updated_at`,`deleted_at`) values (3,'1234','Road',24,2025,'2025-01-01','2025-01-01',NULL,1,'100.00','200.00','300.00','test','test',NULL,'Regular','2025-10-30 06:00:55','2025-10-30 06:00:55',NULL);

/*Table structure for table `cache` */

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cache` */

insert  into `cache`(`key`,`value`,`expiration`) values ('laravel-cache-a6cf3449fbccdc26d9aeadb6f26b8c25','i:1;',1761722782);
insert  into `cache`(`key`,`value`,`expiration`) values ('laravel-cache-a6cf3449fbccdc26d9aeadb6f26b8c25:timer','i:1761722782;',1761722782);
insert  into `cache`(`key`,`value`,`expiration`) values ('laravel-cache-c6be2cf7c13d9a527ee2fe401bbae3c7','i:1;',1761728051);
insert  into `cache`(`key`,`value`,`expiration`) values ('laravel-cache-c6be2cf7c13d9a527ee2fe401bbae3c7:timer','i:1761728051;',1761728051);

/*Table structure for table `cache_locks` */

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cache_locks` */

/*Table structure for table `failed_jobs` */

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `funding_sources` */

CREATE TABLE `funding_sources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `funding_sources` */

insert  into `funding_sources`(`id`,`name`,`created_at`,`updated_at`,`deleted_at`) values (1,'General Fund','2025-10-28 12:04:57','2025-10-28 12:04:57',NULL);
insert  into `funding_sources`(`id`,`name`,`created_at`,`updated_at`,`deleted_at`) values (2,'Special Education Fund','2025-10-28 12:05:07','2025-10-28 12:05:07',NULL);
insert  into `funding_sources`(`id`,`name`,`created_at`,`updated_at`,`deleted_at`) values (3,'20% Development Fund','2025-10-28 12:05:11','2025-10-28 12:05:11',NULL);
insert  into `funding_sources`(`id`,`name`,`created_at`,`updated_at`,`deleted_at`) values (4,'Gender and Development Fund','2025-10-28 12:05:17','2025-10-28 12:05:17',NULL);
insert  into `funding_sources`(`id`,`name`,`created_at`,`updated_at`,`deleted_at`) values (5,'Local Disaster Risk Reduction and Management Fund','2025-10-28 12:05:21','2025-10-28 12:05:21',NULL);
insert  into `funding_sources`(`id`,`name`,`created_at`,`updated_at`,`deleted_at`) values (6,'Sangguniang Kabataan Fund','2025-10-28 12:05:26','2025-10-28 12:05:26',NULL);
insert  into `funding_sources`(`id`,`name`,`created_at`,`updated_at`,`deleted_at`) values (7,'Trust Fund','2025-10-28 12:05:36','2025-10-28 12:05:36',NULL);
insert  into `funding_sources`(`id`,`name`,`created_at`,`updated_at`,`deleted_at`) values (8,'Loan Proceeds','2025-10-28 12:05:40','2025-10-28 12:05:40',NULL);
insert  into `funding_sources`(`id`,`name`,`created_at`,`updated_at`,`deleted_at`) values (9,'External Sources','2025-10-28 12:05:42','2025-10-28 12:05:42',NULL);

/*Table structure for table `job_batches` */

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `job_batches` */

/*Table structure for table `jobs` */

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobs` */

/*Table structure for table `migrations` */

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'0001_01_01_000000_create_users_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (2,'0001_01_01_000001_create_cache_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (3,'0001_01_01_000002_create_jobs_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (4,'2025_08_14_170933_add_two_factor_columns_to_users_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (5,'2025_10_28_014427_create_personal_access_tokens_table',2);

/*Table structure for table `milestone_of_activities` */

CREATE TABLE `milestone_of_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT 'project_procurement_management_plans',
  `schedule` date DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `milestone_of_activities` */

/*Table structure for table `mode_of_procurements` */

CREATE TABLE `mode_of_procurements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mode` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mode_of_procurements` */

insert  into `mode_of_procurements`(`id`,`mode`,`created_at`,`updated_at`,`deleted_at`) values (1,'Competitive Bidding',NULL,NULL,NULL);
insert  into `mode_of_procurements`(`id`,`mode`,`created_at`,`updated_at`,`deleted_at`) values (2,'Limited Source Bidding',NULL,NULL,NULL);
insert  into `mode_of_procurements`(`id`,`mode`,`created_at`,`updated_at`,`deleted_at`) values (3,'Direct Contracting',NULL,NULL,NULL);
insert  into `mode_of_procurements`(`id`,`mode`,`created_at`,`updated_at`,`deleted_at`) values (4,'Repeat Order',NULL,NULL,NULL);
insert  into `mode_of_procurements`(`id`,`mode`,`created_at`,`updated_at`,`deleted_at`) values (5,'Small Value Procurement',NULL,NULL,NULL);
insert  into `mode_of_procurements`(`id`,`mode`,`created_at`,`updated_at`,`deleted_at`) values (6,'NP - Two Failed Biddings',NULL,NULL,NULL);
insert  into `mode_of_procurements`(`id`,`mode`,`created_at`,`updated_at`,`deleted_at`) values (7,'NP - Emergency Cases',NULL,NULL,NULL);
insert  into `mode_of_procurements`(`id`,`mode`,`created_at`,`updated_at`,`deleted_at`) values (8,'NP - Take Over Contracts',NULL,NULL,NULL);
insert  into `mode_of_procurements`(`id`,`mode`,`created_at`,`updated_at`,`deleted_at`) values (9,'NP - Adjacent or Contiguous',NULL,NULL,NULL);
insert  into `mode_of_procurements`(`id`,`mode`,`created_at`,`updated_at`,`deleted_at`) values (10,'NP - Agency to Agency',NULL,NULL,NULL);
insert  into `mode_of_procurements`(`id`,`mode`,`created_at`,`updated_at`,`deleted_at`) values (11,'NP - Scientific, Scholarly, or Artistic Work',NULL,NULL,NULL);
insert  into `mode_of_procurements`(`id`,`mode`,`created_at`,`updated_at`,`deleted_at`) values (12,'NP - Highly Technical Consultants',NULL,NULL,NULL);
insert  into `mode_of_procurements`(`id`,`mode`,`created_at`,`updated_at`,`deleted_at`) values (13,'NP - Defense Cooperation Agreements and Inventory Based Items',NULL,NULL,NULL);
insert  into `mode_of_procurements`(`id`,`mode`,`created_at`,`updated_at`,`deleted_at`) values (14,'NP - Lease of Real Property and Venue',NULL,NULL,NULL);
insert  into `mode_of_procurements`(`id`,`mode`,`created_at`,`updated_at`,`deleted_at`) values (15,'NP - Non Government Organization (NGO) Platform',NULL,NULL,NULL);
insert  into `mode_of_procurements`(`id`,`mode`,`created_at`,`updated_at`,`deleted_at`) values (16,'NP - Community Participation',NULL,NULL,NULL);
insert  into `mode_of_procurements`(`id`,`mode`,`created_at`,`updated_at`,`deleted_at`) values (17,'NP - United Nations (UN) Agencies, International Organizations or International Financing Institutions',NULL,NULL,NULL);
insert  into `mode_of_procurements`(`id`,`mode`,`created_at`,`updated_at`,`deleted_at`) values (18,'NP - Direct Retail Purchase of Petroleum Fuel, Oil and Lubricant Products, Electronic Charging Devices, and Online Subscriptions',NULL,NULL,NULL);

/*Table structure for table `offices` */

CREATE TABLE `offices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `office_name` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `offices` */

insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (1,'ABEO','Agricultural and Biosystems Engineering Office','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (2,'ACA','Office of the City Accountant','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (3,'ADM','Office of the City Administrator','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (4,'AGR','Office of the City Agriculturist','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (5,'BAC','Bids and Awards Committee','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (6,'BFP','Bureau of Fire','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (7,'CBO','Office of the City Budget Officer','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (8,'CDO','Cooperative Development Office','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (9,'CDRRMO','City Disaster Risk Reduction and Management Office','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (10,'CHO','Office of the City Health Officer','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (11,'CLO','Office of the City Legal Officer','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (12,'CMLC','COMELEC','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (13,'COA','Commission on Audit','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (14,'CSD','City Schools Division','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (15,'CTO','Office of the City Treasurer','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (16,'DILG','LGOO-DILG','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (17,'EAS','Office of the City Engineer','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (18,'EEM','Office of the Economic Enterprises Management Officer','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (19,'ELEC','Electrical Section','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (20,'ENR','Office of the City Environment and Natural Resources Officer','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (21,'GAD','Gender and Development Office','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (22,'GSO','Office of the General Services Officer','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (23,'HRM','Office of the Human Resources Officer','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (24,'ICT','Information Communications Technology','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (25,'IDS','Information Dissemination Section','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (26,'LEBDO','Local Economic and Business  Development Office','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (27,'LIB','City Library','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (28,'LNMB','Liga ng mga Barangay','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (29,'LUSCM','La Union Science Centrum and Museum','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (30,'OCA','Office of the City Assessor','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (31,'OCM','Office of the City Mayor','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (32,'OCVM','Office of the City Vice Mayor','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (33,'OIA','Office of the Internal Auditor','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (34,'OPS','Office for Public Safety','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (35,'OSM','Office for Strategy Management','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (36,'OSP','Sanggunian Panlungsod','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (37,'OSSP','Office of the Secretary to the Sanggunian Panlungsod','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (38,'PACU','Public Assistance and Complaints Unit','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (39,'PDAO','Person with Disabilities Affairs Office','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (40,'PDO','Office of the City Planning and Development Coordinator','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (41,'PESO','Public Employment Service Office','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (42,'PNP','City Police Office','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (43,'REC','Records Office','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (44,'REG','Office of the Civil Registrar','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (45,'SNC','Senior Citizen','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (46,'SWD','Office of the City Social Welfare and Development','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (47,'VET','Office of the City Veterinarian','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);
insert  into `offices`(`id`,`code`,`office_name`,`created_at`,`updated_at`,`deleted_at`) values (48,'YDO','Youth Development Office','2025-10-28 08:36:25','2025-10-28 08:36:25',NULL);

/*Table structure for table `password_reset_tokens` */

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_reset_tokens` */

/*Table structure for table `personal_access_tokens` */

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`expires_at`,`created_at`,`updated_at`) values (1,'App\\Models\\User',1,'api-token','58f7db2c2085d2e4afbcb253b1adadabb8e5e8650573e855aa63f86be258329d','[\"*\"]',NULL,NULL,'2025-10-28 02:23:20','2025-10-28 02:23:20');
insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`expires_at`,`created_at`,`updated_at`) values (2,'App\\Models\\User',1,'api-token','2dccea260af43e2cdb49acd46833194d2690887b0ef1604d434c7b486fd89a9a','[\"*\"]',NULL,NULL,'2025-10-28 02:33:52','2025-10-28 02:33:52');
insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`expires_at`,`created_at`,`updated_at`) values (3,'App\\Models\\User',1,'api-token','282b2d94d4e635fbe633363b96eb6a8d166f6fa8eca626fe5c87141b06a932e9','[\"*\"]',NULL,NULL,'2025-10-28 02:46:05','2025-10-28 02:46:05');
insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`expires_at`,`created_at`,`updated_at`) values (4,'App\\Models\\User',1,'api-token','155fe832f4c07ee53a2d6fcc9910c1029c24acbe90b777d0547304f6335cacdd','[\"*\"]',NULL,NULL,'2025-10-28 02:50:35','2025-10-28 02:50:35');
insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`expires_at`,`created_at`,`updated_at`) values (5,'App\\Models\\User',1,'api-token','1930ae188369062f28b4ff7afde08600a3587ec05b3a617c665685c28afa0810','[\"*\"]',NULL,NULL,'2025-10-28 02:51:15','2025-10-28 02:51:15');
insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`expires_at`,`created_at`,`updated_at`) values (7,'App\\Models\\User',1,'api-token','79a44ac6d088914661f9a1c4714e46c76387cee9b9d6147fa55ea75c93e91bf9','[\"*\"]','2025-10-28 05:41:16',NULL,'2025-10-28 04:15:57','2025-10-28 05:41:16');
insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`expires_at`,`created_at`,`updated_at`) values (8,'App\\Models\\User',1,'api-token','124627e625159cb9ea25ec07e6e82d6c168b569a97e6221bb1078d48925c49d1','[\"*\"]','2025-10-28 06:05:02',NULL,'2025-10-28 04:50:50','2025-10-28 06:05:02');
insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`expires_at`,`created_at`,`updated_at`) values (9,'App\\Models\\User',1,'api-token','45fc537c5cfbca2e24a95b798e080b860f79117c72732da2dd719884d62304f2','[\"*\"]','2025-10-28 06:26:33',NULL,'2025-10-28 06:05:47','2025-10-28 06:26:33');
insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`expires_at`,`created_at`,`updated_at`) values (10,'App\\Models\\User',1,'api-token','ad68414c540fc198442ed3cd0adc3661f5beed27f0b3db08ed5d5c87b40ac652','[\"*\"]','2025-10-29 02:26:24',NULL,'2025-10-29 02:23:25','2025-10-29 02:26:24');
insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`expires_at`,`created_at`,`updated_at`) values (11,'App\\Models\\User',1,'api-token','d4a9c4c663150ec9888866843b64ebca1d48a01a662e49a229de5b7a783bf750','[\"*\"]','2025-10-30 06:50:23',NULL,'2025-10-30 05:53:26','2025-10-30 06:50:23');

/*Table structure for table `project_procurement_management_plans` */

CREATE TABLE `project_procurement_management_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT 'annual_procurement_plan',
  `general_description` varchar(255) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  `estimated_budget` double DEFAULT NULL,
  `mode_of_procurement_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `project_procurement_management_plans` */

insert  into `project_procurement_management_plans`(`id`,`parent_id`,`general_description`,`quantity`,`estimated_budget`,`mode_of_procurement_id`,`created_at`,`updated_at`,`deleted_at`) values (1,1,'hello',100,1000,2,'2025-10-30 06:15:10','2025-10-30 06:32:51',NULL);
insert  into `project_procurement_management_plans`(`id`,`parent_id`,`general_description`,`quantity`,`estimated_budget`,`mode_of_procurement_id`,`created_at`,`updated_at`,`deleted_at`) values (2,1,'hello',10,100,1,'2025-10-30 06:31:47','2025-10-30 06:31:47',NULL);
insert  into `project_procurement_management_plans`(`id`,`parent_id`,`general_description`,`quantity`,`estimated_budget`,`mode_of_procurement_id`,`created_at`,`updated_at`,`deleted_at`) values (3,1,'hello',100,1000,2,'2025-10-30 06:48:47','2025-10-30 06:48:47',NULL);

/*Table structure for table `sessions` */

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('C6Hldq6utWKTjDfBFjqfdJazXPqxNWQg7SEi8FXU',NULL,'127.0.0.1','PostmanRuntime/7.49.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoib0MyYU9RYXFpYjcwRlFreG5KUW9QN1VhcXBnZEx2VWZ6WXF5TWFHayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1761807017);
insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('FJ6lPkIBrgFKFX76qYaLAh1p4HREcyVdO8vkDttn',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoibENGV0k2eXg1S1k0aUdJTFJoNktidHA0cnZqSGpOd3hTQUNtZUp0SiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9haXAvY3JlYXRlIjtzOjU6InJvdXRlIjtzOjEwOiJhaXAuY3JlYXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9',1761728694);
insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('mBxhVNCJy94CMQpYbPoQwXW33wmberaP89Nm2p36',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOHJ1ZU5RaDF5SW9xRHlaYXhCNThWNWJsNVhHcENwb2hSRk4yU1hYcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9haXAiO3M6NToicm91dGUiO3M6OToiYWlwLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9',1761722728);
insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('tNW4kJSIapZGCDW2LewUcNUDrFStJIpdFRFmSQKo',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoielJKS1FJejJTdVNwTWxWZ0V4cDRIZkROMktjTFpvTTdlaTlYNVFsWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9haXAiO3M6NToicm91dGUiO3M6OToiYWlwLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjQxOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvc2V0dGluZ3MvdHdvLWZhY3RvciI7fX0=',1761717016);

/*Table structure for table `users` */

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL,
  `sex` enum('Male','Female') DEFAULT NULL,
  `access_level` enum('Admin','Planning','Budget','BAC','Departments') NOT NULL DEFAULT 'Departments',
  `office_id` bigint(20) unsigned DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `users_office_id_foreign` (`office_id`),
  CONSTRAINT `users_office_id_foreign` FOREIGN KEY (`office_id`) REFERENCES `offices` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`email`,`name`,`sex`,`access_level`,`office_id`,`password`,`remember_token`,`created_at`,`updated_at`,`deleted_at`) values (1,'admin','admin@admin.com','Administrator','Male','Admin',24,'$2y$12$OH6HCuLLsJQUq5r/rN9vd.5LN.5ZSu0j8lH4Hb0QjvYtYM0Q/Sqi.',NULL,'2025-10-28 10:20:47','2025-10-28 10:20:47',NULL);
insert  into `users`(`id`,`username`,`email`,`name`,`sex`,`access_level`,`office_id`,`password`,`remember_token`,`created_at`,`updated_at`,`deleted_at`) values (3,'admin2','admin2@admin2.com','Administrator2','Female','Admin',24,'$2y$12$OH6HCuLLsJQUq5r/rN9vd.5LN.5ZSu0j8lH4Hb0QjvYtYM0Q/Sqi.',NULL,'2025-10-28 14:19:58','2025-10-28 06:26:33',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;