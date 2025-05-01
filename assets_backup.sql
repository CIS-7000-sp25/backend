-- MySQL dump 10.13  Distrib 9.2.0, for macos15.2 (arm64)
--
-- Host: shuttle.proxy.rlwy.net    Database: railway
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--
-- ORDER BY:  `id`,`name`

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--
-- ORDER BY:  `id`,`group_id`,`permission_id`,`permission_id`

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--
-- ORDER BY:  `id`,`content_type_id`,`codename`

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry');
INSERT INTO `auth_permission` VALUES (2,'Can change log entry',1,'change_logentry');
INSERT INTO `auth_permission` VALUES (3,'Can delete log entry',1,'delete_logentry');
INSERT INTO `auth_permission` VALUES (4,'Can view log entry',1,'view_logentry');
INSERT INTO `auth_permission` VALUES (5,'Can add permission',2,'add_permission');
INSERT INTO `auth_permission` VALUES (6,'Can change permission',2,'change_permission');
INSERT INTO `auth_permission` VALUES (7,'Can delete permission',2,'delete_permission');
INSERT INTO `auth_permission` VALUES (8,'Can view permission',2,'view_permission');
INSERT INTO `auth_permission` VALUES (9,'Can add group',3,'add_group');
INSERT INTO `auth_permission` VALUES (10,'Can change group',3,'change_group');
INSERT INTO `auth_permission` VALUES (11,'Can delete group',3,'delete_group');
INSERT INTO `auth_permission` VALUES (12,'Can view group',3,'view_group');
INSERT INTO `auth_permission` VALUES (13,'Can add content type',4,'add_contenttype');
INSERT INTO `auth_permission` VALUES (14,'Can change content type',4,'change_contenttype');
INSERT INTO `auth_permission` VALUES (15,'Can delete content type',4,'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16,'Can view content type',4,'view_contenttype');
INSERT INTO `auth_permission` VALUES (17,'Can add session',5,'add_session');
INSERT INTO `auth_permission` VALUES (18,'Can change session',5,'change_session');
INSERT INTO `auth_permission` VALUES (19,'Can delete session',5,'delete_session');
INSERT INTO `auth_permission` VALUES (20,'Can view session',5,'view_session');
INSERT INTO `auth_permission` VALUES (21,'Can add user',6,'add_author');
INSERT INTO `auth_permission` VALUES (22,'Can change user',6,'change_author');
INSERT INTO `auth_permission` VALUES (23,'Can delete user',6,'delete_author');
INSERT INTO `auth_permission` VALUES (24,'Can view user',6,'view_author');
INSERT INTO `auth_permission` VALUES (25,'Can add asset',7,'add_asset');
INSERT INTO `auth_permission` VALUES (26,'Can change asset',7,'change_asset');
INSERT INTO `auth_permission` VALUES (27,'Can delete asset',7,'delete_asset');
INSERT INTO `auth_permission` VALUES (28,'Can view asset',7,'view_asset');
INSERT INTO `auth_permission` VALUES (29,'Can add keyword',8,'add_keyword');
INSERT INTO `auth_permission` VALUES (30,'Can change keyword',8,'change_keyword');
INSERT INTO `auth_permission` VALUES (31,'Can delete keyword',8,'delete_keyword');
INSERT INTO `auth_permission` VALUES (32,'Can view keyword',8,'view_keyword');
INSERT INTO `auth_permission` VALUES (33,'Can add status tag',9,'add_statustag');
INSERT INTO `auth_permission` VALUES (34,'Can change status tag',9,'change_statustag');
INSERT INTO `auth_permission` VALUES (35,'Can delete status tag',9,'delete_statustag');
INSERT INTO `auth_permission` VALUES (36,'Can view status tag',9,'view_statustag');
INSERT INTO `auth_permission` VALUES (37,'Can add sublayer',10,'add_sublayer');
INSERT INTO `auth_permission` VALUES (38,'Can change sublayer',10,'change_sublayer');
INSERT INTO `auth_permission` VALUES (39,'Can delete sublayer',10,'delete_sublayer');
INSERT INTO `auth_permission` VALUES (40,'Can view sublayer',10,'view_sublayer');
INSERT INTO `auth_permission` VALUES (41,'Can add commit',11,'add_commit');
INSERT INTO `auth_permission` VALUES (42,'Can change commit',11,'change_commit');
INSERT INTO `auth_permission` VALUES (43,'Can delete commit',11,'delete_commit');
INSERT INTO `auth_permission` VALUES (44,'Can view commit',11,'view_commit');
INSERT INTO `auth_permission` VALUES (45,'Can add profile',12,'add_profile');
INSERT INTO `auth_permission` VALUES (46,'Can change profile',12,'change_profile');
INSERT INTO `auth_permission` VALUES (47,'Can delete profile',12,'delete_profile');
INSERT INTO `auth_permission` VALUES (48,'Can view profile',12,'view_profile');
INSERT INTO `auth_permission` VALUES (49,'Can add request',13,'add_request');
INSERT INTO `auth_permission` VALUES (50,'Can change request',13,'change_request');
INSERT INTO `auth_permission` VALUES (51,'Can delete request',13,'delete_request');
INSERT INTO `auth_permission` VALUES (52,'Can view request',13,'view_request');
INSERT INTO `auth_permission` VALUES (53,'Can add response',14,'add_response');
INSERT INTO `auth_permission` VALUES (54,'Can change response',14,'change_response');
INSERT INTO `auth_permission` VALUES (55,'Can delete response',14,'delete_response');
INSERT INTO `auth_permission` VALUES (56,'Can view response',14,'view_response');
INSERT INTO `auth_permission` VALUES (57,'Can add sql query',15,'add_sqlquery');
INSERT INTO `auth_permission` VALUES (58,'Can change sql query',15,'change_sqlquery');
INSERT INTO `auth_permission` VALUES (59,'Can delete sql query',15,'delete_sqlquery');
INSERT INTO `auth_permission` VALUES (60,'Can view sql query',15,'view_sqlquery');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_library_author_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_library_author_id` FOREIGN KEY (`user_id`) REFERENCES `library_author` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--
-- ORDER BY:  `id`,`content_type_id`,`user_id`

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--
-- ORDER BY:  `id`,`app_label`,`model`

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry');
INSERT INTO `django_content_type` VALUES (2,'auth','permission');
INSERT INTO `django_content_type` VALUES (3,'auth','group');
INSERT INTO `django_content_type` VALUES (4,'contenttypes','contenttype');
INSERT INTO `django_content_type` VALUES (5,'sessions','session');
INSERT INTO `django_content_type` VALUES (6,'library','author');
INSERT INTO `django_content_type` VALUES (7,'library','asset');
INSERT INTO `django_content_type` VALUES (8,'library','keyword');
INSERT INTO `django_content_type` VALUES (9,'library','statustag');
INSERT INTO `django_content_type` VALUES (10,'library','sublayer');
INSERT INTO `django_content_type` VALUES (11,'library','commit');
INSERT INTO `django_content_type` VALUES (12,'silk','profile');
INSERT INTO `django_content_type` VALUES (13,'silk','request');
INSERT INTO `django_content_type` VALUES (14,'silk','response');
INSERT INTO `django_content_type` VALUES (15,'silk','sqlquery');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--
-- ORDER BY:  `id`

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-04-21 06:41:22.263441');
INSERT INTO `django_migrations` VALUES (2,'contenttypes','0002_remove_content_type_name','2025-04-21 06:41:22.417218');
INSERT INTO `django_migrations` VALUES (3,'auth','0001_initial','2025-04-21 06:41:24.166545');
INSERT INTO `django_migrations` VALUES (4,'auth','0002_alter_permission_name_max_length','2025-04-21 06:41:24.610423');
INSERT INTO `django_migrations` VALUES (5,'auth','0003_alter_user_email_max_length','2025-04-21 06:41:24.655501');
INSERT INTO `django_migrations` VALUES (6,'auth','0004_alter_user_username_opts','2025-04-21 06:41:24.701837');
INSERT INTO `django_migrations` VALUES (7,'auth','0005_alter_user_last_login_null','2025-04-21 06:41:24.746670');
INSERT INTO `django_migrations` VALUES (8,'auth','0006_require_contenttypes_0002','2025-04-21 06:41:24.819439');
INSERT INTO `django_migrations` VALUES (9,'auth','0007_alter_validators_add_error_messages','2025-04-21 06:41:24.910400');
INSERT INTO `django_migrations` VALUES (10,'auth','0008_alter_user_username_max_length','2025-04-21 06:41:24.984821');
INSERT INTO `django_migrations` VALUES (11,'auth','0009_alter_user_last_name_max_length','2025-04-21 06:41:25.052204');
INSERT INTO `django_migrations` VALUES (12,'auth','0010_alter_group_name_max_length','2025-04-21 06:41:25.151490');
INSERT INTO `django_migrations` VALUES (13,'auth','0011_update_proxy_permissions','2025-04-21 06:41:25.230110');
INSERT INTO `django_migrations` VALUES (14,'auth','0012_alter_user_first_name_max_length','2025-04-21 06:41:25.280705');
INSERT INTO `django_migrations` VALUES (15,'library','0001_initial','2025-04-21 06:41:33.543738');
INSERT INTO `django_migrations` VALUES (16,'admin','0001_initial','2025-04-21 06:41:33.917235');
INSERT INTO `django_migrations` VALUES (17,'admin','0002_logentry_remove_auto_add','2025-04-21 06:41:34.023252');
INSERT INTO `django_migrations` VALUES (18,'admin','0003_logentry_add_action_flag_choices','2025-04-21 06:41:34.151215');
INSERT INTO `django_migrations` VALUES (19,'sessions','0001_initial','2025-04-21 06:41:34.522360');
INSERT INTO `django_migrations` VALUES (20,'silk','0001_initial','2025-04-21 06:41:36.116487');
INSERT INTO `django_migrations` VALUES (21,'silk','0002_auto_update_uuid4_id_field','2025-04-21 06:41:36.209197');
INSERT INTO `django_migrations` VALUES (22,'silk','0003_request_prof_file','2025-04-21 06:41:36.446164');
INSERT INTO `django_migrations` VALUES (23,'silk','0004_request_prof_file_storage','2025-04-21 06:41:36.518411');
INSERT INTO `django_migrations` VALUES (24,'silk','0005_increase_request_prof_file_length','2025-04-21 06:41:36.785472');
INSERT INTO `django_migrations` VALUES (25,'silk','0006_fix_request_prof_file_blank','2025-04-21 06:41:37.243255');
INSERT INTO `django_migrations` VALUES (26,'silk','0007_sqlquery_identifier','2025-04-21 06:41:37.356207');
INSERT INTO `django_migrations` VALUES (27,'silk','0008_sqlquery_analysis','2025-04-21 06:41:37.445541');
INSERT INTO `django_migrations` VALUES (28,'library','0002_sublayer_checkedoutby','2025-04-21 21:50:34.633735');
INSERT INTO `django_migrations` VALUES (29,'library','0003_sublayer_s3_versionid','2025-04-24 01:14:10.940844');
INSERT INTO `django_migrations` VALUES (30,'library','0004_remove_sublayer_previousverion_remove_sublayer_s3id','2025-04-27 14:44:09.875887');
INSERT INTO `django_migrations` VALUES (31,'library','0005_sublayer_previousversion','2025-04-27 14:44:10.805287');
INSERT INTO `django_migrations` VALUES (32,'library','0006_alter_commit_timestamp_alter_commit_version_and_more','2025-04-27 18:34:58.449994');
INSERT INTO `django_migrations` VALUES (33,'library','0007_alter_commit_timestamp','2025-04-29 16:51:14.642740');
INSERT INTO `django_migrations` VALUES (34,'library','0008_alter_commit_timestamp','2025-04-29 16:51:14.708018');
INSERT INTO `django_migrations` VALUES (35,'library','0009_alter_commit_timestamp','2025-04-29 16:51:14.771418');
INSERT INTO `django_migrations` VALUES (36,'library','0010_alter_commit_timestamp','2025-04-29 16:51:14.839513');
INSERT INTO `django_migrations` VALUES (37,'library','0011_alter_commit_timestamp','2025-04-29 16:51:14.902885');
INSERT INTO `django_migrations` VALUES (38,'library','0012_alter_commit_timestamp','2025-04-29 16:51:14.965262');
INSERT INTO `django_migrations` VALUES (39,'library','0013_alter_commit_timestamp','2025-04-29 16:51:15.089295');
INSERT INTO `django_migrations` VALUES (40,'library','0014_alter_commit_timestamp','2025-04-29 16:54:09.383355');
INSERT INTO `django_migrations` VALUES (41,'library','0006_auto_20250429_1657','2025-04-29 16:57:24.369942');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--
-- ORDER BY:  `session_key`,`expire_date`

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_asset`
--

DROP TABLE IF EXISTS `library_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_asset` (
  `id` char(32) NOT NULL,
  `assetName` varchar(200) NOT NULL,
  `hasTexture` tinyint(1) NOT NULL,
  `thumbnailKey` varchar(200) DEFAULT NULL,
  `checkedOutBy_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `library_asset_checkedOutBy_id_e6d5bb94_fk_library_author_id` (`checkedOutBy_id`),
  CONSTRAINT `library_asset_checkedOutBy_id_e6d5bb94_fk_library_author_id` FOREIGN KEY (`checkedOutBy_id`) REFERENCES `library_author` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_asset`
--
-- ORDER BY:  `id`,`checkedOutBy_id`

LOCK TABLES `library_asset` WRITE;
/*!40000 ALTER TABLE `library_asset` DISABLE KEYS */;
INSERT INTO `library_asset` VALUES ('077caad23bd4486b8fb066bf43d04761','bookStack3',0,'cis-7000-usd-assets-versioned/Assets/bookStack3/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('082f328bf76a4d48be255c620a8cd280','bookStack',0,'cis-7000-usd-assets-versioned/Assets/bookStack/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('10a15094d1dc45b7bcf8c698420b9e91','lantern',0,'cis-7000-usd-assets-versioned/Assets/lantern/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('16fd6a411cc2475099c6b26a09175e77','flaredPotion',0,'cis-7000-usd-assets-versioned/Assets/flaredPotion/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('1c7130d2d78e49d990ba12cde563e7c3','bambooContainer',0,'cis-7000-usd-assets-versioned/Assets/bambooContainer/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('1cb7eed87f6c413b9a582792de2f2fe1','brownBook',0,'cis-7000-usd-assets-versioned/Assets/brownBook/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('21ff4cfc83b0435a91b2404af9477d51','barrel',0,'cis-7000-usd-assets-versioned/Assets/barrel/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('2652016a66e647f2bb874058b4d7e13c','drawerAssembly',0,'cis-7000-usd-assets-versioned/Assets/drawerAssembly/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('2c7ef29f88474ded95eb449ebb264ead','sushi',0,'cis-7000-usd-assets-versioned/Assets/sushi/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('2df25bd14a5542aab9eaa23f1c3ccd1e','parkBench',0,'cis-7000-usd-assets-versioned/Assets/parkBench/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('313b0aae14664f14b656d4d17478fbc3','makeupJar',0,'cis-7000-usd-assets-versioned/Assets/makeupJar/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('31c39c346b394a1f90cf0a00f1c4a6ef','wineGlass',0,'cis-7000-usd-assets-versioned/Assets/wineGlass/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('3684e1145a004e7987f06b8c071166a1','bookStack6',0,'cis-7000-usd-assets-versioned/Assets/bookStack6/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('39338164bc7f4fcaa1a14bc30beae3fe','yellowDuck',0,'cis-7000-usd-assets-versioned/Assets/yellowDuck/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('39ab42636a0747ffa50446bcf4f57980','bookshelf2',0,'cis-7000-usd-assets-versioned/Assets/bookshelf2/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('3d283193f6b54cf0a233a5b83ed95819','flatTeapot',0,'cis-7000-usd-assets-versioned/Assets/flatTeapot/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('3d6b8007d30e4919a46deedb6dfce573','blueJello',0,'cis-7000-usd-assets-versioned/Assets/blueJello/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('3dcf8a1dac8242a59f83c50df682fb69','paniniPress',0,'cis-7000-usd-assets-versioned/Assets/paniniPress/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('3dfa350b0a294d7c9f1b419180d71748','oakTable',0,'cis-7000-usd-assets-versioned/Assets/oakTable/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('3eebe2a320dd4f10b98542d62deec15a','largeInkBottle',0,'cis-7000-usd-assets-versioned/Assets/largeInkBottle/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('427b041b429f4dffb526ee677a936f12','glassCauldron',0,'cis-7000-usd-assets-versioned/Assets/glassCauldron/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('449fe9fdd5434b03ae7f5bc021402fbf','cappedJar',0,'cis-7000-usd-assets-versioned/Assets/cappedJar/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('4be817e19e11426ebeede52145732e77','yugiohClockArc',0,'cis-7000-usd-assets-versioned/Assets/yugiohClockArc/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('579fe0bad3f84b7babc143ab2952234e','cafeTable',0,'cis-7000-usd-assets-versioned/Assets/cafeTable/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('5bac6ed09efe4816b7c427ffb08c599d','mug',0,'cis-7000-usd-assets-versioned/Assets/mug/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('5c179fdb44924eba8a42c0948766ca62','orangePillow',0,'cis-7000-usd-assets-versioned/Assets/orangePillow/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('6188a79945fa415f906a1c6463a497eb','carrot',0,'cis-7000-usd-assets-versioned/Assets/carrot/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('63cd5d6f9e9243fd9a6276093c547cf7','skateboard',0,'cis-7000-usd-assets-versioned/Assets/skateboard/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('65cb65e774ab4a4795d18ff514a071d9','goPieceJar',0,'cis-7000-usd-assets-versioned/Assets/goPieceJar/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('66b74b32abd8459cbe41f434285a7691','kitchenaid',0,'cis-7000-usd-assets-versioned/Assets/kitchenaid/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('6ab7f53a7daf46a2ac8a83abcc89ecf9','lockedBox',0,'cis-7000-usd-assets-versioned/Assets/lockedBox/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('6bc90b076ae74ab9842a07913f22e681','makeupContainers',0,'cis-7000-usd-assets-versioned/Assets/makeupContainers/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('6be75d74d18f4d88bc635b222107966f','glassJarEmpty',0,'cis-7000-usd-assets-versioned/Assets/glassJarEmpty/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('6f6441599cc045ae91530ecd6cc5a81e','campfire',1,'cis-7000-usd-assets-versioned/Assets/campfire/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('76e5d476ecc44eeea6da09806954f8bd','bookStack2',0,'cis-7000-usd-assets-versioned/Assets/bookStack2/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('7b333698a6b74e45a24e2e642b55d1dd','hangingGinger',0,'cis-7000-usd-assets-versioned/Assets/hangingGinger/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('81cdcad6e58a448b8dad18e4d311b5f1','bluePillow',0,'cis-7000-usd-assets-versioned/Assets/bluePillow/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('824b428456c148abb25d24568d649441','cherryTable',0,'cis-7000-usd-assets-versioned/Assets/cherryTable/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('89dbc25b1e554c6eae3212cc3e28850c','ladle',0,'cis-7000-usd-assets-versioned/Assets/ladle/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('8deb7dd1667c428b89933de25c02e4ce','medicineBottle',0,'cis-7000-usd-assets-versioned/Assets/medicineBottle/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('993f2365ed5446068f9eb0e6c21a8e9c','boneBox',0,'cis-7000-usd-assets-versioned/Assets/boneBox/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('99f5e6f9675b41ed91e76daebb016c4a','jelloShelf',0,'cis-7000-usd-assets-versioned/Assets/jelloShelf/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('a0d5c1f281f046cd9ff2287dfed6cd63','pickleBarrels',0,'cis-7000-usd-assets-versioned/Assets/pickleBarrels/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('a1513d5dbdf7478aab3b4d659a3f5e74','candleGroup',0,'cis-7000-usd-assets-versioned/Assets/candleGroup/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('a69b43a2c8ba44a499e7f698f736e60b','elavatedLogPlatform',0,'cis-7000-usd-assets-versioned/Assets/elavatedLogPlatform/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('a8e9675b3e2a4a63b73c6d1fd34ca0e0','asianGoldPieceContainer',0,'cis-7000-usd-assets-versioned/Assets/asianGoldPieceContainer/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('a94d3ddac1e64aff86cf5a194c50d8bf','bustWearingHat',0,'cis-7000-usd-assets-versioned/Assets/bustWearingHat/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('aa9e8d80d09e4675915f7e5080b7b351','hangingPickles',0,'cis-7000-usd-assets-versioned/Assets/hangingPickles/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('aff070bc60b647e29d302848b812f7c2','emptyDrawer',0,'cis-7000-usd-assets-versioned/Assets/emptyDrawer/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('b24acc08b15546e896c3e25add15f1ba','largeCherryTable',0,'cis-7000-usd-assets-versioned/Assets/largeCherryTable/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('b6234f0922c94798ba12257342157faa','oldTelevision',0,'cis-7000-usd-assets-versioned/Assets/oldTelevision/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('b7d69121f36340adbdb7bed776c42a8d','woodenChair',0,'cis-7000-usd-assets-versioned/Assets/woodenChair/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('ba022dd31fd0446a907529c711cea63f','inkBottle',0,'cis-7000-usd-assets-versioned/Assets/inkBottle/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('bc9563cab790436abc6180a53087ad1a','leafyVegetation',0,'cis-7000-usd-assets-versioned/Assets/leafyVegetation/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('bcb688a70758427fbb7e23d1ed9d756e','logSteps',0,'cis-7000-usd-assets-versioned/Assets/logSteps/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('c0e55d851ea64aa4aeec27c29594a555','sittingMoomin',0,'cis-7000-usd-assets-versioned/Assets/sittingMoomin/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('c21bb4bc82c74bf08857cc21bac2f3b4','horns',0,'cis-7000-usd-assets-versioned/Assets/horns/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('c4449799e71a4ce88999ea44a86e067b','vintageLamp',0,'cis-7000-usd-assets-versioned/Assets/vintageLamp/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('c5f39a998aec42cc8396f2ff23cbb375','drinkingHorns',0,'cis-7000-usd-assets-versioned/Assets/drinkingHorns/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('ca9ae1e89e6145bea24272531dcfbe27','cashRegister',0,'cis-7000-usd-assets-versioned/Assets/cashRegister/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('cc9847c9e64a4341bd8287edf73afe04','largePottedPlant',0,'cis-7000-usd-assets-versioned/Assets/largePottedPlant/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('d189b8bcea4e4e289d133f6fdfe25d8b','doubleScrollDrawer',0,'cis-7000-usd-assets-versioned/Assets/doubleScrollDrawer/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('d9782679927741a6b9b9449b3054ff77','bulbousInkJar',0,'cis-7000-usd-assets-versioned/Assets/bulbousInkJar/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('db17d0c2030049769e1ba2ea54d86114','penTablet',0,'cis-7000-usd-assets-versioned/Assets/penTablet/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('e1dc4b9960364ffba02431380e01df0f','foxHandRight',0,'cis-7000-usd-assets-versioned/Assets/foxHandRight/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('ed516f0180c84489b7cd35f892c8e438','alchemistRoomWalls',0,'cis-7000-usd-assets-versioned/Assets/alchemistRoomWalls/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('f08cf286cf1b4110bdb5c6d03dfad92a','cartoonFish',0,'cis-7000-usd-assets-versioned/Assets/cartoonFish/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('f0941eb324214c48b9a0755db5eaf79b','candle',0,'cis-7000-usd-assets-versioned/Assets/candle/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('f148935dbe764e648b2641d5ddcde381','bambooLadder',0,'cis-7000-usd-assets-versioned/Assets/bambooLadder/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('f175fbe4933944a69d06e86c906622d6','beegCrab',0,'cis-7000-usd-assets-versioned/Assets/beegCrab/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('f1d3b419b0444e58a2e45fe157647464','bookStack4',0,'cis-7000-usd-assets-versioned/Assets/bookStack4/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('f3a014272b104716a4e1296a4dcf4404','bookshelf1',0,'cis-7000-usd-assets-versioned/Assets/bookshelf1/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('f3e934c53fa645b881d2e227e8eafaeb','glassJarFull',0,'cis-7000-usd-assets-versioned/Assets/glassJarFull/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('f5e189a845fb4ed3930a81263a21bf99','teapot',0,'cis-7000-usd-assets-versioned/Assets/teapot/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('fa20ba6a205e4d2b951f8262bf5b2802','bookStack5',0,'cis-7000-usd-assets-versioned/Assets/bookStack5/contrib/.thumbs/thumbnail.png',NULL);
INSERT INTO `library_asset` VALUES ('fa5e37ee437e45acb2ae0c3c9c725b83','bookshelf3',0,'cis-7000-usd-assets-versioned/Assets/bookshelf3/contrib/.thumbs/thumbnail.png',NULL);
/*!40000 ALTER TABLE `library_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_asset_keywordsList`
--

DROP TABLE IF EXISTS `library_asset_keywordsList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_asset_keywordsList` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `asset_id` char(32) NOT NULL,
  `keyword_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `library_asset_keywordsList_asset_id_keyword_id_2a064302_uniq` (`asset_id`,`keyword_id`),
  KEY `library_asset_keywor_keyword_id_946423c7_fk_library_k` (`keyword_id`),
  CONSTRAINT `library_asset_keywor_keyword_id_946423c7_fk_library_k` FOREIGN KEY (`keyword_id`) REFERENCES `library_keyword` (`id`),
  CONSTRAINT `library_asset_keywordsList_asset_id_3a4ca979_fk_library_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `library_asset` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_asset_keywordsList`
--
-- ORDER BY:  `id`,`asset_id`,`keyword_id`,`keyword_id`

LOCK TABLES `library_asset_keywordsList` WRITE;
/*!40000 ALTER TABLE `library_asset_keywordsList` DISABLE KEYS */;
INSERT INTO `library_asset_keywordsList` VALUES (6,'f175fbe4933944a69d06e86c906622d6',1);
INSERT INTO `library_asset_keywordsList` VALUES (7,'f175fbe4933944a69d06e86c906622d6',2);
INSERT INTO `library_asset_keywordsList` VALUES (8,'f175fbe4933944a69d06e86c906622d6',3);
INSERT INTO `library_asset_keywordsList` VALUES (9,'f175fbe4933944a69d06e86c906622d6',4);
INSERT INTO `library_asset_keywordsList` VALUES (10,'f175fbe4933944a69d06e86c906622d6',5);
INSERT INTO `library_asset_keywordsList` VALUES (11,'082f328bf76a4d48be255c620a8cd280',6);
INSERT INTO `library_asset_keywordsList` VALUES (12,'082f328bf76a4d48be255c620a8cd280',7);
INSERT INTO `library_asset_keywordsList` VALUES (13,'082f328bf76a4d48be255c620a8cd280',8);
INSERT INTO `library_asset_keywordsList` VALUES (14,'082f328bf76a4d48be255c620a8cd280',9);
INSERT INTO `library_asset_keywordsList` VALUES (15,'082f328bf76a4d48be255c620a8cd280',10);
INSERT INTO `library_asset_keywordsList` VALUES (16,'082f328bf76a4d48be255c620a8cd280',11);
INSERT INTO `library_asset_keywordsList` VALUES (17,'082f328bf76a4d48be255c620a8cd280',12);
INSERT INTO `library_asset_keywordsList` VALUES (18,'082f328bf76a4d48be255c620a8cd280',13);
INSERT INTO `library_asset_keywordsList` VALUES (19,'082f328bf76a4d48be255c620a8cd280',14);
INSERT INTO `library_asset_keywordsList` VALUES (20,'082f328bf76a4d48be255c620a8cd280',15);
INSERT INTO `library_asset_keywordsList` VALUES (21,'579fe0bad3f84b7babc143ab2952234e',16);
INSERT INTO `library_asset_keywordsList` VALUES (22,'579fe0bad3f84b7babc143ab2952234e',17);
INSERT INTO `library_asset_keywordsList` VALUES (23,'579fe0bad3f84b7babc143ab2952234e',18);
INSERT INTO `library_asset_keywordsList` VALUES (24,'6f6441599cc045ae91530ecd6cc5a81e',19);
INSERT INTO `library_asset_keywordsList` VALUES (25,'6f6441599cc045ae91530ecd6cc5a81e',20);
INSERT INTO `library_asset_keywordsList` VALUES (26,'6f6441599cc045ae91530ecd6cc5a81e',21);
INSERT INTO `library_asset_keywordsList` VALUES (27,'6f6441599cc045ae91530ecd6cc5a81e',22);
INSERT INTO `library_asset_keywordsList` VALUES (28,'6f6441599cc045ae91530ecd6cc5a81e',23);
INSERT INTO `library_asset_keywordsList` VALUES (29,'6f6441599cc045ae91530ecd6cc5a81e',24);
INSERT INTO `library_asset_keywordsList` VALUES (30,'6f6441599cc045ae91530ecd6cc5a81e',25);
INSERT INTO `library_asset_keywordsList` VALUES (31,'6f6441599cc045ae91530ecd6cc5a81e',26);
INSERT INTO `library_asset_keywordsList` VALUES (32,'6f6441599cc045ae91530ecd6cc5a81e',27);
INSERT INTO `library_asset_keywordsList` VALUES (33,'6f6441599cc045ae91530ecd6cc5a81e',28);
INSERT INTO `library_asset_keywordsList` VALUES (34,'f08cf286cf1b4110bdb5c6d03dfad92a',29);
INSERT INTO `library_asset_keywordsList` VALUES (35,'f08cf286cf1b4110bdb5c6d03dfad92a',30);
INSERT INTO `library_asset_keywordsList` VALUES (36,'f08cf286cf1b4110bdb5c6d03dfad92a',31);
INSERT INTO `library_asset_keywordsList` VALUES (37,'f08cf286cf1b4110bdb5c6d03dfad92a',4);
INSERT INTO `library_asset_keywordsList` VALUES (38,'f08cf286cf1b4110bdb5c6d03dfad92a',5);
INSERT INTO `library_asset_keywordsList` VALUES (39,'f08cf286cf1b4110bdb5c6d03dfad92a',2);
INSERT INTO `library_asset_keywordsList` VALUES (40,'f08cf286cf1b4110bdb5c6d03dfad92a',32);
INSERT INTO `library_asset_keywordsList` VALUES (41,'f08cf286cf1b4110bdb5c6d03dfad92a',33);
INSERT INTO `library_asset_keywordsList` VALUES (42,'2df25bd14a5542aab9eaa23f1c3ccd1e',34);
INSERT INTO `library_asset_keywordsList` VALUES (43,'2df25bd14a5542aab9eaa23f1c3ccd1e',35);
INSERT INTO `library_asset_keywordsList` VALUES (44,'2df25bd14a5542aab9eaa23f1c3ccd1e',36);
INSERT INTO `library_asset_keywordsList` VALUES (45,'2df25bd14a5542aab9eaa23f1c3ccd1e',37);
INSERT INTO `library_asset_keywordsList` VALUES (46,'2df25bd14a5542aab9eaa23f1c3ccd1e',38);
INSERT INTO `library_asset_keywordsList` VALUES (47,'2df25bd14a5542aab9eaa23f1c3ccd1e',18);
INSERT INTO `library_asset_keywordsList` VALUES (48,'a0d5c1f281f046cd9ff2287dfed6cd63',39);
INSERT INTO `library_asset_keywordsList` VALUES (49,'a0d5c1f281f046cd9ff2287dfed6cd63',40);
INSERT INTO `library_asset_keywordsList` VALUES (50,'a0d5c1f281f046cd9ff2287dfed6cd63',41);
INSERT INTO `library_asset_keywordsList` VALUES (51,'a0d5c1f281f046cd9ff2287dfed6cd63',42);
INSERT INTO `library_asset_keywordsList` VALUES (52,'a0d5c1f281f046cd9ff2287dfed6cd63',43);
INSERT INTO `library_asset_keywordsList` VALUES (53,'a0d5c1f281f046cd9ff2287dfed6cd63',13);
INSERT INTO `library_asset_keywordsList` VALUES (54,'a0d5c1f281f046cd9ff2287dfed6cd63',44);
INSERT INTO `library_asset_keywordsList` VALUES (55,'a0d5c1f281f046cd9ff2287dfed6cd63',45);
INSERT INTO `library_asset_keywordsList` VALUES (56,'a0d5c1f281f046cd9ff2287dfed6cd63',46);
INSERT INTO `library_asset_keywordsList` VALUES (57,'c0e55d851ea64aa4aeec27c29594a555',47);
INSERT INTO `library_asset_keywordsList` VALUES (58,'c0e55d851ea64aa4aeec27c29594a555',4);
INSERT INTO `library_asset_keywordsList` VALUES (59,'c0e55d851ea64aa4aeec27c29594a555',48);
INSERT INTO `library_asset_keywordsList` VALUES (60,'c0e55d851ea64aa4aeec27c29594a555',49);
INSERT INTO `library_asset_keywordsList` VALUES (61,'63cd5d6f9e9243fd9a6276093c547cf7',50);
INSERT INTO `library_asset_keywordsList` VALUES (62,'63cd5d6f9e9243fd9a6276093c547cf7',51);
INSERT INTO `library_asset_keywordsList` VALUES (63,'63cd5d6f9e9243fd9a6276093c547cf7',52);
INSERT INTO `library_asset_keywordsList` VALUES (64,'63cd5d6f9e9243fd9a6276093c547cf7',53);
INSERT INTO `library_asset_keywordsList` VALUES (65,'63cd5d6f9e9243fd9a6276093c547cf7',54);
INSERT INTO `library_asset_keywordsList` VALUES (66,'63cd5d6f9e9243fd9a6276093c547cf7',55);
INSERT INTO `library_asset_keywordsList` VALUES (67,'63cd5d6f9e9243fd9a6276093c547cf7',56);
INSERT INTO `library_asset_keywordsList` VALUES (68,'63cd5d6f9e9243fd9a6276093c547cf7',57);
INSERT INTO `library_asset_keywordsList` VALUES (69,'f5e189a845fb4ed3930a81263a21bf99',58);
INSERT INTO `library_asset_keywordsList` VALUES (70,'f5e189a845fb4ed3930a81263a21bf99',59);
INSERT INTO `library_asset_keywordsList` VALUES (71,'f5e189a845fb4ed3930a81263a21bf99',60);
INSERT INTO `library_asset_keywordsList` VALUES (72,'f5e189a845fb4ed3930a81263a21bf99',61);
INSERT INTO `library_asset_keywordsList` VALUES (73,'f5e189a845fb4ed3930a81263a21bf99',62);
INSERT INTO `library_asset_keywordsList` VALUES (74,'f5e189a845fb4ed3930a81263a21bf99',10);
INSERT INTO `library_asset_keywordsList` VALUES (75,'f5e189a845fb4ed3930a81263a21bf99',13);
INSERT INTO `library_asset_keywordsList` VALUES (76,'f5e189a845fb4ed3930a81263a21bf99',11);
INSERT INTO `library_asset_keywordsList` VALUES (77,'f5e189a845fb4ed3930a81263a21bf99',18);
INSERT INTO `library_asset_keywordsList` VALUES (78,'c4449799e71a4ce88999ea44a86e067b',63);
INSERT INTO `library_asset_keywordsList` VALUES (79,'c4449799e71a4ce88999ea44a86e067b',64);
INSERT INTO `library_asset_keywordsList` VALUES (80,'c4449799e71a4ce88999ea44a86e067b',65);
INSERT INTO `library_asset_keywordsList` VALUES (81,'c4449799e71a4ce88999ea44a86e067b',66);
INSERT INTO `library_asset_keywordsList` VALUES (82,'c4449799e71a4ce88999ea44a86e067b',67);
INSERT INTO `library_asset_keywordsList` VALUES (83,'c4449799e71a4ce88999ea44a86e067b',68);
INSERT INTO `library_asset_keywordsList` VALUES (84,'c4449799e71a4ce88999ea44a86e067b',18);
INSERT INTO `library_asset_keywordsList` VALUES (85,'39338164bc7f4fcaa1a14bc30beae3fe',69);
INSERT INTO `library_asset_keywordsList` VALUES (86,'39338164bc7f4fcaa1a14bc30beae3fe',70);
INSERT INTO `library_asset_keywordsList` VALUES (87,'39338164bc7f4fcaa1a14bc30beae3fe',30);
INSERT INTO `library_asset_keywordsList` VALUES (88,'39338164bc7f4fcaa1a14bc30beae3fe',71);
INSERT INTO `library_asset_keywordsList` VALUES (89,'39338164bc7f4fcaa1a14bc30beae3fe',72);
INSERT INTO `library_asset_keywordsList` VALUES (90,'39338164bc7f4fcaa1a14bc30beae3fe',73);
INSERT INTO `library_asset_keywordsList` VALUES (91,'4be817e19e11426ebeede52145732e77',74);
INSERT INTO `library_asset_keywordsList` VALUES (92,'4be817e19e11426ebeede52145732e77',75);
INSERT INTO `library_asset_keywordsList` VALUES (93,'4be817e19e11426ebeede52145732e77',76);
INSERT INTO `library_asset_keywordsList` VALUES (94,'4be817e19e11426ebeede52145732e77',77);
INSERT INTO `library_asset_keywordsList` VALUES (95,'4be817e19e11426ebeede52145732e77',49);
INSERT INTO `library_asset_keywordsList` VALUES (97,'6188a79945fa415f906a1c6463a497eb',78);
INSERT INTO `library_asset_keywordsList` VALUES (98,'6188a79945fa415f906a1c6463a497eb',79);
INSERT INTO `library_asset_keywordsList` VALUES (99,'66b74b32abd8459cbe41f434285a7691',80);
INSERT INTO `library_asset_keywordsList` VALUES (100,'66b74b32abd8459cbe41f434285a7691',81);
INSERT INTO `library_asset_keywordsList` VALUES (101,'66b74b32abd8459cbe41f434285a7691',82);
INSERT INTO `library_asset_keywordsList` VALUES (102,'66b74b32abd8459cbe41f434285a7691',62);
INSERT INTO `library_asset_keywordsList` VALUES (103,'66b74b32abd8459cbe41f434285a7691',83);
INSERT INTO `library_asset_keywordsList` VALUES (104,'5bac6ed09efe4816b7c427ffb08c599d',84);
INSERT INTO `library_asset_keywordsList` VALUES (105,'5bac6ed09efe4816b7c427ffb08c599d',85);
INSERT INTO `library_asset_keywordsList` VALUES (106,'b6234f0922c94798ba12257342157faa',86);
INSERT INTO `library_asset_keywordsList` VALUES (107,'b6234f0922c94798ba12257342157faa',87);
INSERT INTO `library_asset_keywordsList` VALUES (108,'b6234f0922c94798ba12257342157faa',88);
INSERT INTO `library_asset_keywordsList` VALUES (109,'b6234f0922c94798ba12257342157faa',18);
INSERT INTO `library_asset_keywordsList` VALUES (110,'b6234f0922c94798ba12257342157faa',83);
INSERT INTO `library_asset_keywordsList` VALUES (111,'3dcf8a1dac8242a59f83c50df682fb69',75);
INSERT INTO `library_asset_keywordsList` VALUES (112,'3dcf8a1dac8242a59f83c50df682fb69',62);
INSERT INTO `library_asset_keywordsList` VALUES (113,'3dcf8a1dac8242a59f83c50df682fb69',89);
INSERT INTO `library_asset_keywordsList` VALUES (114,'3dcf8a1dac8242a59f83c50df682fb69',90);
INSERT INTO `library_asset_keywordsList` VALUES (115,'3dcf8a1dac8242a59f83c50df682fb69',91);
INSERT INTO `library_asset_keywordsList` VALUES (116,'3dcf8a1dac8242a59f83c50df682fb69',83);
INSERT INTO `library_asset_keywordsList` VALUES (117,'db17d0c2030049769e1ba2ea54d86114',92);
INSERT INTO `library_asset_keywordsList` VALUES (118,'db17d0c2030049769e1ba2ea54d86114',93);
INSERT INTO `library_asset_keywordsList` VALUES (119,'db17d0c2030049769e1ba2ea54d86114',94);
INSERT INTO `library_asset_keywordsList` VALUES (120,'db17d0c2030049769e1ba2ea54d86114',95);
INSERT INTO `library_asset_keywordsList` VALUES (121,'db17d0c2030049769e1ba2ea54d86114',83);
INSERT INTO `library_asset_keywordsList` VALUES (122,'2c7ef29f88474ded95eb449ebb264ead',96);
INSERT INTO `library_asset_keywordsList` VALUES (123,'2c7ef29f88474ded95eb449ebb264ead',97);
INSERT INTO `library_asset_keywordsList` VALUES (124,'2c7ef29f88474ded95eb449ebb264ead',29);
INSERT INTO `library_asset_keywordsList` VALUES (125,'2c7ef29f88474ded95eb449ebb264ead',90);
INSERT INTO `library_asset_keywordsList` VALUES (126,'2c7ef29f88474ded95eb449ebb264ead',98);
INSERT INTO `library_asset_keywordsList` VALUES (127,'2c7ef29f88474ded95eb449ebb264ead',99);
INSERT INTO `library_asset_keywordsList` VALUES (128,'3d283193f6b54cf0a233a5b83ed95819',58);
INSERT INTO `library_asset_keywordsList` VALUES (129,'3d283193f6b54cf0a233a5b83ed95819',100);
INSERT INTO `library_asset_keywordsList` VALUES (130,'3d283193f6b54cf0a233a5b83ed95819',101);
INSERT INTO `library_asset_keywordsList` VALUES (131,'3d283193f6b54cf0a233a5b83ed95819',62);
INSERT INTO `library_asset_keywordsList` VALUES (132,'31c39c346b394a1f90cf0a00f1c4a6ef',102);
INSERT INTO `library_asset_keywordsList` VALUES (133,'31c39c346b394a1f90cf0a00f1c4a6ef',103);
INSERT INTO `library_asset_keywordsList` VALUES (134,'31c39c346b394a1f90cf0a00f1c4a6ef',104);
INSERT INTO `library_asset_keywordsList` VALUES (135,'31c39c346b394a1f90cf0a00f1c4a6ef',105);
INSERT INTO `library_asset_keywordsList` VALUES (136,'31c39c346b394a1f90cf0a00f1c4a6ef',62);
INSERT INTO `library_asset_keywordsList` VALUES (137,'b7d69121f36340adbdb7bed776c42a8d',106);
INSERT INTO `library_asset_keywordsList` VALUES (138,'b7d69121f36340adbdb7bed776c42a8d',38);
INSERT INTO `library_asset_keywordsList` VALUES (139,'b7d69121f36340adbdb7bed776c42a8d',18);
INSERT INTO `library_asset_keywordsList` VALUES (140,'ed516f0180c84489b7cd35f892c8e438',107);
INSERT INTO `library_asset_keywordsList` VALUES (141,'ed516f0180c84489b7cd35f892c8e438',108);
INSERT INTO `library_asset_keywordsList` VALUES (142,'ed516f0180c84489b7cd35f892c8e438',109);
INSERT INTO `library_asset_keywordsList` VALUES (143,'ed516f0180c84489b7cd35f892c8e438',110);
INSERT INTO `library_asset_keywordsList` VALUES (144,'ed516f0180c84489b7cd35f892c8e438',111);
INSERT INTO `library_asset_keywordsList` VALUES (145,'ed516f0180c84489b7cd35f892c8e438',112);
INSERT INTO `library_asset_keywordsList` VALUES (146,'ed516f0180c84489b7cd35f892c8e438',113);
INSERT INTO `library_asset_keywordsList` VALUES (147,'a8e9675b3e2a4a63b73c6d1fd34ca0e0',114);
INSERT INTO `library_asset_keywordsList` VALUES (148,'a8e9675b3e2a4a63b73c6d1fd34ca0e0',41);
INSERT INTO `library_asset_keywordsList` VALUES (149,'a8e9675b3e2a4a63b73c6d1fd34ca0e0',115);
INSERT INTO `library_asset_keywordsList` VALUES (150,'a8e9675b3e2a4a63b73c6d1fd34ca0e0',116);
INSERT INTO `library_asset_keywordsList` VALUES (151,'a8e9675b3e2a4a63b73c6d1fd34ca0e0',117);
INSERT INTO `library_asset_keywordsList` VALUES (152,'a8e9675b3e2a4a63b73c6d1fd34ca0e0',118);
INSERT INTO `library_asset_keywordsList` VALUES (153,'a8e9675b3e2a4a63b73c6d1fd34ca0e0',119);
INSERT INTO `library_asset_keywordsList` VALUES (154,'1c7130d2d78e49d990ba12cde563e7c3',120);
INSERT INTO `library_asset_keywordsList` VALUES (155,'1c7130d2d78e49d990ba12cde563e7c3',41);
INSERT INTO `library_asset_keywordsList` VALUES (156,'1c7130d2d78e49d990ba12cde563e7c3',23);
INSERT INTO `library_asset_keywordsList` VALUES (157,'1c7130d2d78e49d990ba12cde563e7c3',115);
INSERT INTO `library_asset_keywordsList` VALUES (158,'1c7130d2d78e49d990ba12cde563e7c3',121);
INSERT INTO `library_asset_keywordsList` VALUES (159,'1c7130d2d78e49d990ba12cde563e7c3',122);
INSERT INTO `library_asset_keywordsList` VALUES (160,'1c7130d2d78e49d990ba12cde563e7c3',123);
INSERT INTO `library_asset_keywordsList` VALUES (161,'f148935dbe764e648b2641d5ddcde381',120);
INSERT INTO `library_asset_keywordsList` VALUES (162,'f148935dbe764e648b2641d5ddcde381',124);
INSERT INTO `library_asset_keywordsList` VALUES (163,'f148935dbe764e648b2641d5ddcde381',23);
INSERT INTO `library_asset_keywordsList` VALUES (164,'f148935dbe764e648b2641d5ddcde381',115);
INSERT INTO `library_asset_keywordsList` VALUES (165,'f148935dbe764e648b2641d5ddcde381',125);
INSERT INTO `library_asset_keywordsList` VALUES (166,'f148935dbe764e648b2641d5ddcde381',122);
INSERT INTO `library_asset_keywordsList` VALUES (167,'f148935dbe764e648b2641d5ddcde381',121);
INSERT INTO `library_asset_keywordsList` VALUES (168,'21ff4cfc83b0435a91b2404af9477d51',39);
INSERT INTO `library_asset_keywordsList` VALUES (169,'21ff4cfc83b0435a91b2404af9477d51',23);
INSERT INTO `library_asset_keywordsList` VALUES (170,'21ff4cfc83b0435a91b2404af9477d51',46);
INSERT INTO `library_asset_keywordsList` VALUES (171,'21ff4cfc83b0435a91b2404af9477d51',65);
INSERT INTO `library_asset_keywordsList` VALUES (172,'21ff4cfc83b0435a91b2404af9477d51',126);
INSERT INTO `library_asset_keywordsList` VALUES (173,'21ff4cfc83b0435a91b2404af9477d51',41);
INSERT INTO `library_asset_keywordsList` VALUES (174,'21ff4cfc83b0435a91b2404af9477d51',112);
INSERT INTO `library_asset_keywordsList` VALUES (175,'3d6b8007d30e4919a46deedb6dfce573',127);
INSERT INTO `library_asset_keywordsList` VALUES (176,'3d6b8007d30e4919a46deedb6dfce573',128);
INSERT INTO `library_asset_keywordsList` VALUES (177,'3d6b8007d30e4919a46deedb6dfce573',129);
INSERT INTO `library_asset_keywordsList` VALUES (178,'3d6b8007d30e4919a46deedb6dfce573',130);
INSERT INTO `library_asset_keywordsList` VALUES (179,'3d6b8007d30e4919a46deedb6dfce573',97);
INSERT INTO `library_asset_keywordsList` VALUES (180,'3d6b8007d30e4919a46deedb6dfce573',131);
INSERT INTO `library_asset_keywordsList` VALUES (181,'3d6b8007d30e4919a46deedb6dfce573',132);
INSERT INTO `library_asset_keywordsList` VALUES (182,'81cdcad6e58a448b8dad18e4d311b5f1',133);
INSERT INTO `library_asset_keywordsList` VALUES (183,'81cdcad6e58a448b8dad18e4d311b5f1',128);
INSERT INTO `library_asset_keywordsList` VALUES (184,'81cdcad6e58a448b8dad18e4d311b5f1',134);
INSERT INTO `library_asset_keywordsList` VALUES (185,'81cdcad6e58a448b8dad18e4d311b5f1',135);
INSERT INTO `library_asset_keywordsList` VALUES (186,'81cdcad6e58a448b8dad18e4d311b5f1',136);
INSERT INTO `library_asset_keywordsList` VALUES (187,'81cdcad6e58a448b8dad18e4d311b5f1',117);
INSERT INTO `library_asset_keywordsList` VALUES (188,'81cdcad6e58a448b8dad18e4d311b5f1',137);
INSERT INTO `library_asset_keywordsList` VALUES (189,'993f2365ed5446068f9eb0e6c21a8e9c',138);
INSERT INTO `library_asset_keywordsList` VALUES (190,'993f2365ed5446068f9eb0e6c21a8e9c',139);
INSERT INTO `library_asset_keywordsList` VALUES (191,'993f2365ed5446068f9eb0e6c21a8e9c',41);
INSERT INTO `library_asset_keywordsList` VALUES (192,'993f2365ed5446068f9eb0e6c21a8e9c',46);
INSERT INTO `library_asset_keywordsList` VALUES (193,'993f2365ed5446068f9eb0e6c21a8e9c',88);
INSERT INTO `library_asset_keywordsList` VALUES (194,'993f2365ed5446068f9eb0e6c21a8e9c',121);
INSERT INTO `library_asset_keywordsList` VALUES (195,'993f2365ed5446068f9eb0e6c21a8e9c',65);
INSERT INTO `library_asset_keywordsList` VALUES (196,'f3a014272b104716a4e1296a4dcf4404',140);
INSERT INTO `library_asset_keywordsList` VALUES (197,'f3a014272b104716a4e1296a4dcf4404',23);
INSERT INTO `library_asset_keywordsList` VALUES (198,'f3a014272b104716a4e1296a4dcf4404',141);
INSERT INTO `library_asset_keywordsList` VALUES (199,'f3a014272b104716a4e1296a4dcf4404',46);
INSERT INTO `library_asset_keywordsList` VALUES (200,'f3a014272b104716a4e1296a4dcf4404',7);
INSERT INTO `library_asset_keywordsList` VALUES (201,'f3a014272b104716a4e1296a4dcf4404',18);
INSERT INTO `library_asset_keywordsList` VALUES (202,'f3a014272b104716a4e1296a4dcf4404',113);
INSERT INTO `library_asset_keywordsList` VALUES (203,'39ab42636a0747ffa50446bcf4f57980',140);
INSERT INTO `library_asset_keywordsList` VALUES (204,'39ab42636a0747ffa50446bcf4f57980',23);
INSERT INTO `library_asset_keywordsList` VALUES (205,'39ab42636a0747ffa50446bcf4f57980',141);
INSERT INTO `library_asset_keywordsList` VALUES (206,'39ab42636a0747ffa50446bcf4f57980',46);
INSERT INTO `library_asset_keywordsList` VALUES (207,'39ab42636a0747ffa50446bcf4f57980',7);
INSERT INTO `library_asset_keywordsList` VALUES (208,'39ab42636a0747ffa50446bcf4f57980',18);
INSERT INTO `library_asset_keywordsList` VALUES (209,'39ab42636a0747ffa50446bcf4f57980',113);
INSERT INTO `library_asset_keywordsList` VALUES (210,'fa5e37ee437e45acb2ae0c3c9c725b83',140);
INSERT INTO `library_asset_keywordsList` VALUES (211,'fa5e37ee437e45acb2ae0c3c9c725b83',23);
INSERT INTO `library_asset_keywordsList` VALUES (212,'fa5e37ee437e45acb2ae0c3c9c725b83',141);
INSERT INTO `library_asset_keywordsList` VALUES (213,'fa5e37ee437e45acb2ae0c3c9c725b83',46);
INSERT INTO `library_asset_keywordsList` VALUES (214,'fa5e37ee437e45acb2ae0c3c9c725b83',7);
INSERT INTO `library_asset_keywordsList` VALUES (215,'fa5e37ee437e45acb2ae0c3c9c725b83',18);
INSERT INTO `library_asset_keywordsList` VALUES (216,'fa5e37ee437e45acb2ae0c3c9c725b83',113);
INSERT INTO `library_asset_keywordsList` VALUES (217,'76e5d476ecc44eeea6da09806954f8bd',7);
INSERT INTO `library_asset_keywordsList` VALUES (218,'76e5d476ecc44eeea6da09806954f8bd',8);
INSERT INTO `library_asset_keywordsList` VALUES (219,'76e5d476ecc44eeea6da09806954f8bd',142);
INSERT INTO `library_asset_keywordsList` VALUES (220,'76e5d476ecc44eeea6da09806954f8bd',143);
INSERT INTO `library_asset_keywordsList` VALUES (221,'76e5d476ecc44eeea6da09806954f8bd',13);
INSERT INTO `library_asset_keywordsList` VALUES (222,'077caad23bd4486b8fb066bf43d04761',7);
INSERT INTO `library_asset_keywordsList` VALUES (223,'077caad23bd4486b8fb066bf43d04761',8);
INSERT INTO `library_asset_keywordsList` VALUES (224,'077caad23bd4486b8fb066bf43d04761',142);
INSERT INTO `library_asset_keywordsList` VALUES (225,'077caad23bd4486b8fb066bf43d04761',143);
INSERT INTO `library_asset_keywordsList` VALUES (226,'077caad23bd4486b8fb066bf43d04761',13);
INSERT INTO `library_asset_keywordsList` VALUES (227,'f1d3b419b0444e58a2e45fe157647464',7);
INSERT INTO `library_asset_keywordsList` VALUES (228,'f1d3b419b0444e58a2e45fe157647464',8);
INSERT INTO `library_asset_keywordsList` VALUES (229,'f1d3b419b0444e58a2e45fe157647464',142);
INSERT INTO `library_asset_keywordsList` VALUES (230,'f1d3b419b0444e58a2e45fe157647464',143);
INSERT INTO `library_asset_keywordsList` VALUES (231,'f1d3b419b0444e58a2e45fe157647464',13);
INSERT INTO `library_asset_keywordsList` VALUES (232,'fa20ba6a205e4d2b951f8262bf5b2802',7);
INSERT INTO `library_asset_keywordsList` VALUES (233,'fa20ba6a205e4d2b951f8262bf5b2802',8);
INSERT INTO `library_asset_keywordsList` VALUES (234,'fa20ba6a205e4d2b951f8262bf5b2802',142);
INSERT INTO `library_asset_keywordsList` VALUES (235,'fa20ba6a205e4d2b951f8262bf5b2802',143);
INSERT INTO `library_asset_keywordsList` VALUES (236,'fa20ba6a205e4d2b951f8262bf5b2802',13);
INSERT INTO `library_asset_keywordsList` VALUES (237,'3684e1145a004e7987f06b8c071166a1',7);
INSERT INTO `library_asset_keywordsList` VALUES (238,'3684e1145a004e7987f06b8c071166a1',8);
INSERT INTO `library_asset_keywordsList` VALUES (239,'3684e1145a004e7987f06b8c071166a1',142);
INSERT INTO `library_asset_keywordsList` VALUES (240,'3684e1145a004e7987f06b8c071166a1',143);
INSERT INTO `library_asset_keywordsList` VALUES (241,'3684e1145a004e7987f06b8c071166a1',13);
INSERT INTO `library_asset_keywordsList` VALUES (242,'1cb7eed87f6c413b9a582792de2f2fe1',6);
INSERT INTO `library_asset_keywordsList` VALUES (243,'1cb7eed87f6c413b9a582792de2f2fe1',144);
INSERT INTO `library_asset_keywordsList` VALUES (244,'1cb7eed87f6c413b9a582792de2f2fe1',142);
INSERT INTO `library_asset_keywordsList` VALUES (245,'1cb7eed87f6c413b9a582792de2f2fe1',143);
INSERT INTO `library_asset_keywordsList` VALUES (246,'1cb7eed87f6c413b9a582792de2f2fe1',44);
INSERT INTO `library_asset_keywordsList` VALUES (247,'d9782679927741a6b9b9449b3054ff77',145);
INSERT INTO `library_asset_keywordsList` VALUES (248,'d9782679927741a6b9b9449b3054ff77',146);
INSERT INTO `library_asset_keywordsList` VALUES (249,'d9782679927741a6b9b9449b3054ff77',147);
INSERT INTO `library_asset_keywordsList` VALUES (250,'d9782679927741a6b9b9449b3054ff77',103);
INSERT INTO `library_asset_keywordsList` VALUES (251,'d9782679927741a6b9b9449b3054ff77',148);
INSERT INTO `library_asset_keywordsList` VALUES (252,'a94d3ddac1e64aff86cf5a194c50d8bf',149);
INSERT INTO `library_asset_keywordsList` VALUES (253,'a94d3ddac1e64aff86cf5a194c50d8bf',150);
INSERT INTO `library_asset_keywordsList` VALUES (254,'a94d3ddac1e64aff86cf5a194c50d8bf',151);
INSERT INTO `library_asset_keywordsList` VALUES (255,'a94d3ddac1e64aff86cf5a194c50d8bf',117);
INSERT INTO `library_asset_keywordsList` VALUES (256,'a94d3ddac1e64aff86cf5a194c50d8bf',152);
INSERT INTO `library_asset_keywordsList` VALUES (257,'f0941eb324214c48b9a0755db5eaf79b',66);
INSERT INTO `library_asset_keywordsList` VALUES (258,'f0941eb324214c48b9a0755db5eaf79b',68);
INSERT INTO `library_asset_keywordsList` VALUES (259,'f0941eb324214c48b9a0755db5eaf79b',153);
INSERT INTO `library_asset_keywordsList` VALUES (260,'f0941eb324214c48b9a0755db5eaf79b',154);
INSERT INTO `library_asset_keywordsList` VALUES (261,'f0941eb324214c48b9a0755db5eaf79b',117);
INSERT INTO `library_asset_keywordsList` VALUES (262,'a1513d5dbdf7478aab3b4d659a3f5e74',155);
INSERT INTO `library_asset_keywordsList` VALUES (263,'a1513d5dbdf7478aab3b4d659a3f5e74',68);
INSERT INTO `library_asset_keywordsList` VALUES (264,'a1513d5dbdf7478aab3b4d659a3f5e74',153);
INSERT INTO `library_asset_keywordsList` VALUES (265,'a1513d5dbdf7478aab3b4d659a3f5e74',154);
INSERT INTO `library_asset_keywordsList` VALUES (266,'a1513d5dbdf7478aab3b4d659a3f5e74',156);
INSERT INTO `library_asset_keywordsList` VALUES (267,'449fe9fdd5434b03ae7f5bc021402fbf',146);
INSERT INTO `library_asset_keywordsList` VALUES (268,'449fe9fdd5434b03ae7f5bc021402fbf',103);
INSERT INTO `library_asset_keywordsList` VALUES (269,'449fe9fdd5434b03ae7f5bc021402fbf',41);
INSERT INTO `library_asset_keywordsList` VALUES (270,'449fe9fdd5434b03ae7f5bc021402fbf',157);
INSERT INTO `library_asset_keywordsList` VALUES (271,'449fe9fdd5434b03ae7f5bc021402fbf',46);
INSERT INTO `library_asset_keywordsList` VALUES (272,'ca9ae1e89e6145bea24272531dcfbe27',158);
INSERT INTO `library_asset_keywordsList` VALUES (273,'ca9ae1e89e6145bea24272531dcfbe27',159);
INSERT INTO `library_asset_keywordsList` VALUES (274,'ca9ae1e89e6145bea24272531dcfbe27',88);
INSERT INTO `library_asset_keywordsList` VALUES (275,'ca9ae1e89e6145bea24272531dcfbe27',13);
INSERT INTO `library_asset_keywordsList` VALUES (276,'ca9ae1e89e6145bea24272531dcfbe27',160);
INSERT INTO `library_asset_keywordsList` VALUES (277,'824b428456c148abb25d24568d649441',17);
INSERT INTO `library_asset_keywordsList` VALUES (278,'824b428456c148abb25d24568d649441',18);
INSERT INTO `library_asset_keywordsList` VALUES (279,'824b428456c148abb25d24568d649441',161);
INSERT INTO `library_asset_keywordsList` VALUES (280,'824b428456c148abb25d24568d649441',23);
INSERT INTO `library_asset_keywordsList` VALUES (281,'824b428456c148abb25d24568d649441',162);
INSERT INTO `library_asset_keywordsList` VALUES (282,'d189b8bcea4e4e289d133f6fdfe25d8b',163);
INSERT INTO `library_asset_keywordsList` VALUES (283,'d189b8bcea4e4e289d133f6fdfe25d8b',164);
INSERT INTO `library_asset_keywordsList` VALUES (284,'d189b8bcea4e4e289d133f6fdfe25d8b',46);
INSERT INTO `library_asset_keywordsList` VALUES (285,'d189b8bcea4e4e289d133f6fdfe25d8b',165);
INSERT INTO `library_asset_keywordsList` VALUES (286,'d189b8bcea4e4e289d133f6fdfe25d8b',13);
INSERT INTO `library_asset_keywordsList` VALUES (287,'2652016a66e647f2bb874058b4d7e13c',163);
INSERT INTO `library_asset_keywordsList` VALUES (288,'2652016a66e647f2bb874058b4d7e13c',18);
INSERT INTO `library_asset_keywordsList` VALUES (289,'2652016a66e647f2bb874058b4d7e13c',46);
INSERT INTO `library_asset_keywordsList` VALUES (290,'2652016a66e647f2bb874058b4d7e13c',165);
INSERT INTO `library_asset_keywordsList` VALUES (291,'c5f39a998aec42cc8396f2ff23cbb375',166);
INSERT INTO `library_asset_keywordsList` VALUES (292,'c5f39a998aec42cc8396f2ff23cbb375',167);
INSERT INTO `library_asset_keywordsList` VALUES (293,'c5f39a998aec42cc8396f2ff23cbb375',112);
INSERT INTO `library_asset_keywordsList` VALUES (294,'c5f39a998aec42cc8396f2ff23cbb375',117);
INSERT INTO `library_asset_keywordsList` VALUES (295,'c5f39a998aec42cc8396f2ff23cbb375',13);
INSERT INTO `library_asset_keywordsList` VALUES (296,'a69b43a2c8ba44a499e7f698f736e60b',168);
INSERT INTO `library_asset_keywordsList` VALUES (297,'a69b43a2c8ba44a499e7f698f736e60b',169);
INSERT INTO `library_asset_keywordsList` VALUES (298,'a69b43a2c8ba44a499e7f698f736e60b',170);
INSERT INTO `library_asset_keywordsList` VALUES (299,'a69b43a2c8ba44a499e7f698f736e60b',23);
INSERT INTO `library_asset_keywordsList` VALUES (300,'a69b43a2c8ba44a499e7f698f736e60b',171);
INSERT INTO `library_asset_keywordsList` VALUES (301,'aff070bc60b647e29d302848b812f7c2',163);
INSERT INTO `library_asset_keywordsList` VALUES (302,'aff070bc60b647e29d302848b812f7c2',172);
INSERT INTO `library_asset_keywordsList` VALUES (303,'aff070bc60b647e29d302848b812f7c2',18);
INSERT INTO `library_asset_keywordsList` VALUES (304,'aff070bc60b647e29d302848b812f7c2',46);
INSERT INTO `library_asset_keywordsList` VALUES (305,'16fd6a411cc2475099c6b26a09175e77',148);
INSERT INTO `library_asset_keywordsList` VALUES (306,'16fd6a411cc2475099c6b26a09175e77',173);
INSERT INTO `library_asset_keywordsList` VALUES (307,'16fd6a411cc2475099c6b26a09175e77',174);
INSERT INTO `library_asset_keywordsList` VALUES (308,'16fd6a411cc2475099c6b26a09175e77',175);
INSERT INTO `library_asset_keywordsList` VALUES (309,'16fd6a411cc2475099c6b26a09175e77',103);
INSERT INTO `library_asset_keywordsList` VALUES (310,'e1dc4b9960364ffba02431380e01df0f',176);
INSERT INTO `library_asset_keywordsList` VALUES (311,'e1dc4b9960364ffba02431380e01df0f',177);
INSERT INTO `library_asset_keywordsList` VALUES (312,'e1dc4b9960364ffba02431380e01df0f',178);
INSERT INTO `library_asset_keywordsList` VALUES (313,'e1dc4b9960364ffba02431380e01df0f',5);
INSERT INTO `library_asset_keywordsList` VALUES (314,'e1dc4b9960364ffba02431380e01df0f',179);
INSERT INTO `library_asset_keywordsList` VALUES (315,'427b041b429f4dffb526ee677a936f12',180);
INSERT INTO `library_asset_keywordsList` VALUES (316,'427b041b429f4dffb526ee677a936f12',103);
INSERT INTO `library_asset_keywordsList` VALUES (317,'427b041b429f4dffb526ee677a936f12',148);
INSERT INTO `library_asset_keywordsList` VALUES (318,'427b041b429f4dffb526ee677a936f12',41);
INSERT INTO `library_asset_keywordsList` VALUES (319,'427b041b429f4dffb526ee677a936f12',175);
INSERT INTO `library_asset_keywordsList` VALUES (320,'6be75d74d18f4d88bc635b222107966f',146);
INSERT INTO `library_asset_keywordsList` VALUES (321,'6be75d74d18f4d88bc635b222107966f',103);
INSERT INTO `library_asset_keywordsList` VALUES (322,'6be75d74d18f4d88bc635b222107966f',172);
INSERT INTO `library_asset_keywordsList` VALUES (323,'6be75d74d18f4d88bc635b222107966f',41);
INSERT INTO `library_asset_keywordsList` VALUES (324,'6be75d74d18f4d88bc635b222107966f',46);
INSERT INTO `library_asset_keywordsList` VALUES (325,'f3e934c53fa645b881d2e227e8eafaeb',146);
INSERT INTO `library_asset_keywordsList` VALUES (326,'f3e934c53fa645b881d2e227e8eafaeb',103);
INSERT INTO `library_asset_keywordsList` VALUES (327,'f3e934c53fa645b881d2e227e8eafaeb',181);
INSERT INTO `library_asset_keywordsList` VALUES (328,'f3e934c53fa645b881d2e227e8eafaeb',41);
INSERT INTO `library_asset_keywordsList` VALUES (329,'f3e934c53fa645b881d2e227e8eafaeb',46);
INSERT INTO `library_asset_keywordsList` VALUES (330,'65cb65e774ab4a4795d18ff514a071d9',146);
INSERT INTO `library_asset_keywordsList` VALUES (331,'65cb65e774ab4a4795d18ff514a071d9',182);
INSERT INTO `library_asset_keywordsList` VALUES (332,'65cb65e774ab4a4795d18ff514a071d9',183);
INSERT INTO `library_asset_keywordsList` VALUES (333,'65cb65e774ab4a4795d18ff514a071d9',184);
INSERT INTO `library_asset_keywordsList` VALUES (334,'65cb65e774ab4a4795d18ff514a071d9',41);
INSERT INTO `library_asset_keywordsList` VALUES (335,'7b333698a6b74e45a24e2e642b55d1dd',185);
INSERT INTO `library_asset_keywordsList` VALUES (336,'7b333698a6b74e45a24e2e642b55d1dd',186);
INSERT INTO `library_asset_keywordsList` VALUES (337,'7b333698a6b74e45a24e2e642b55d1dd',97);
INSERT INTO `library_asset_keywordsList` VALUES (338,'7b333698a6b74e45a24e2e642b55d1dd',187);
INSERT INTO `library_asset_keywordsList` VALUES (339,'7b333698a6b74e45a24e2e642b55d1dd',188);
INSERT INTO `library_asset_keywordsList` VALUES (340,'aa9e8d80d09e4675915f7e5080b7b351',189);
INSERT INTO `library_asset_keywordsList` VALUES (341,'aa9e8d80d09e4675915f7e5080b7b351',186);
INSERT INTO `library_asset_keywordsList` VALUES (342,'aa9e8d80d09e4675915f7e5080b7b351',97);
INSERT INTO `library_asset_keywordsList` VALUES (343,'aa9e8d80d09e4675915f7e5080b7b351',146);
INSERT INTO `library_asset_keywordsList` VALUES (344,'aa9e8d80d09e4675915f7e5080b7b351',190);
INSERT INTO `library_asset_keywordsList` VALUES (345,'c21bb4bc82c74bf08857cc21bac2f3b4',191);
INSERT INTO `library_asset_keywordsList` VALUES (346,'c21bb4bc82c74bf08857cc21bac2f3b4',117);
INSERT INTO `library_asset_keywordsList` VALUES (347,'c21bb4bc82c74bf08857cc21bac2f3b4',5);
INSERT INTO `library_asset_keywordsList` VALUES (348,'c21bb4bc82c74bf08857cc21bac2f3b4',138);
INSERT INTO `library_asset_keywordsList` VALUES (349,'c21bb4bc82c74bf08857cc21bac2f3b4',192);
INSERT INTO `library_asset_keywordsList` VALUES (350,'ba022dd31fd0446a907529c711cea63f',145);
INSERT INTO `library_asset_keywordsList` VALUES (351,'ba022dd31fd0446a907529c711cea63f',173);
INSERT INTO `library_asset_keywordsList` VALUES (352,'ba022dd31fd0446a907529c711cea63f',147);
INSERT INTO `library_asset_keywordsList` VALUES (353,'ba022dd31fd0446a907529c711cea63f',103);
INSERT INTO `library_asset_keywordsList` VALUES (354,'ba022dd31fd0446a907529c711cea63f',41);
INSERT INTO `library_asset_keywordsList` VALUES (355,'99f5e6f9675b41ed91e76daebb016c4a',127);
INSERT INTO `library_asset_keywordsList` VALUES (356,'99f5e6f9675b41ed91e76daebb016c4a',141);
INSERT INTO `library_asset_keywordsList` VALUES (357,'99f5e6f9675b41ed91e76daebb016c4a',97);
INSERT INTO `library_asset_keywordsList` VALUES (358,'99f5e6f9675b41ed91e76daebb016c4a',193);
INSERT INTO `library_asset_keywordsList` VALUES (359,'99f5e6f9675b41ed91e76daebb016c4a',46);
INSERT INTO `library_asset_keywordsList` VALUES (360,'89dbc25b1e554c6eae3212cc3e28850c',194);
INSERT INTO `library_asset_keywordsList` VALUES (361,'89dbc25b1e554c6eae3212cc3e28850c',195);
INSERT INTO `library_asset_keywordsList` VALUES (362,'89dbc25b1e554c6eae3212cc3e28850c',62);
INSERT INTO `library_asset_keywordsList` VALUES (363,'89dbc25b1e554c6eae3212cc3e28850c',196);
INSERT INTO `library_asset_keywordsList` VALUES (364,'89dbc25b1e554c6eae3212cc3e28850c',91);
INSERT INTO `library_asset_keywordsList` VALUES (365,'10a15094d1dc45b7bcf8c698420b9e91',197);
INSERT INTO `library_asset_keywordsList` VALUES (366,'10a15094d1dc45b7bcf8c698420b9e91',68);
INSERT INTO `library_asset_keywordsList` VALUES (367,'10a15094d1dc45b7bcf8c698420b9e91',186);
INSERT INTO `library_asset_keywordsList` VALUES (368,'10a15094d1dc45b7bcf8c698420b9e91',117);
INSERT INTO `library_asset_keywordsList` VALUES (369,'10a15094d1dc45b7bcf8c698420b9e91',198);
INSERT INTO `library_asset_keywordsList` VALUES (370,'b24acc08b15546e896c3e25add15f1ba',17);
INSERT INTO `library_asset_keywordsList` VALUES (371,'b24acc08b15546e896c3e25add15f1ba',199);
INSERT INTO `library_asset_keywordsList` VALUES (372,'b24acc08b15546e896c3e25add15f1ba',161);
INSERT INTO `library_asset_keywordsList` VALUES (373,'b24acc08b15546e896c3e25add15f1ba',23);
INSERT INTO `library_asset_keywordsList` VALUES (374,'b24acc08b15546e896c3e25add15f1ba',18);
INSERT INTO `library_asset_keywordsList` VALUES (375,'3eebe2a320dd4f10b98542d62deec15a',145);
INSERT INTO `library_asset_keywordsList` VALUES (376,'3eebe2a320dd4f10b98542d62deec15a',173);
INSERT INTO `library_asset_keywordsList` VALUES (377,'3eebe2a320dd4f10b98542d62deec15a',199);
INSERT INTO `library_asset_keywordsList` VALUES (378,'3eebe2a320dd4f10b98542d62deec15a',103);
INSERT INTO `library_asset_keywordsList` VALUES (379,'3eebe2a320dd4f10b98542d62deec15a',147);
INSERT INTO `library_asset_keywordsList` VALUES (380,'cc9847c9e64a4341bd8287edf73afe04',123);
INSERT INTO `library_asset_keywordsList` VALUES (381,'cc9847c9e64a4341bd8287edf73afe04',200);
INSERT INTO `library_asset_keywordsList` VALUES (382,'cc9847c9e64a4341bd8287edf73afe04',199);
INSERT INTO `library_asset_keywordsList` VALUES (383,'cc9847c9e64a4341bd8287edf73afe04',201);
INSERT INTO `library_asset_keywordsList` VALUES (384,'cc9847c9e64a4341bd8287edf73afe04',117);
INSERT INTO `library_asset_keywordsList` VALUES (385,'bc9563cab790436abc6180a53087ad1a',201);
INSERT INTO `library_asset_keywordsList` VALUES (386,'bc9563cab790436abc6180a53087ad1a',202);
INSERT INTO `library_asset_keywordsList` VALUES (387,'bc9563cab790436abc6180a53087ad1a',203);
INSERT INTO `library_asset_keywordsList` VALUES (388,'bc9563cab790436abc6180a53087ad1a',204);
INSERT INTO `library_asset_keywordsList` VALUES (389,'bc9563cab790436abc6180a53087ad1a',117);
INSERT INTO `library_asset_keywordsList` VALUES (390,'6ab7f53a7daf46a2ac8a83abcc89ecf9',139);
INSERT INTO `library_asset_keywordsList` VALUES (391,'6ab7f53a7daf46a2ac8a83abcc89ecf9',205);
INSERT INTO `library_asset_keywordsList` VALUES (392,'6ab7f53a7daf46a2ac8a83abcc89ecf9',41);
INSERT INTO `library_asset_keywordsList` VALUES (393,'6ab7f53a7daf46a2ac8a83abcc89ecf9',206);
INSERT INTO `library_asset_keywordsList` VALUES (394,'6ab7f53a7daf46a2ac8a83abcc89ecf9',207);
INSERT INTO `library_asset_keywordsList` VALUES (395,'bcb688a70758427fbb7e23d1ed9d756e',169);
INSERT INTO `library_asset_keywordsList` VALUES (396,'bcb688a70758427fbb7e23d1ed9d756e',208);
INSERT INTO `library_asset_keywordsList` VALUES (397,'bcb688a70758427fbb7e23d1ed9d756e',209);
INSERT INTO `library_asset_keywordsList` VALUES (398,'bcb688a70758427fbb7e23d1ed9d756e',23);
INSERT INTO `library_asset_keywordsList` VALUES (399,'bcb688a70758427fbb7e23d1ed9d756e',210);
INSERT INTO `library_asset_keywordsList` VALUES (400,'6bc90b076ae74ab9842a07913f22e681',211);
INSERT INTO `library_asset_keywordsList` VALUES (401,'6bc90b076ae74ab9842a07913f22e681',212);
INSERT INTO `library_asset_keywordsList` VALUES (402,'6bc90b076ae74ab9842a07913f22e681',213);
INSERT INTO `library_asset_keywordsList` VALUES (403,'6bc90b076ae74ab9842a07913f22e681',46);
INSERT INTO `library_asset_keywordsList` VALUES (404,'6bc90b076ae74ab9842a07913f22e681',214);
INSERT INTO `library_asset_keywordsList` VALUES (405,'313b0aae14664f14b656d4d17478fbc3',211);
INSERT INTO `library_asset_keywordsList` VALUES (406,'313b0aae14664f14b656d4d17478fbc3',146);
INSERT INTO `library_asset_keywordsList` VALUES (407,'313b0aae14664f14b656d4d17478fbc3',213);
INSERT INTO `library_asset_keywordsList` VALUES (408,'313b0aae14664f14b656d4d17478fbc3',41);
INSERT INTO `library_asset_keywordsList` VALUES (409,'313b0aae14664f14b656d4d17478fbc3',13);
INSERT INTO `library_asset_keywordsList` VALUES (410,'8deb7dd1667c428b89933de25c02e4ce',215);
INSERT INTO `library_asset_keywordsList` VALUES (411,'8deb7dd1667c428b89933de25c02e4ce',173);
INSERT INTO `library_asset_keywordsList` VALUES (412,'8deb7dd1667c428b89933de25c02e4ce',103);
INSERT INTO `library_asset_keywordsList` VALUES (413,'8deb7dd1667c428b89933de25c02e4ce',148);
INSERT INTO `library_asset_keywordsList` VALUES (414,'8deb7dd1667c428b89933de25c02e4ce',216);
INSERT INTO `library_asset_keywordsList` VALUES (415,'3dfa350b0a294d7c9f1b419180d71748',17);
INSERT INTO `library_asset_keywordsList` VALUES (416,'3dfa350b0a294d7c9f1b419180d71748',217);
INSERT INTO `library_asset_keywordsList` VALUES (417,'3dfa350b0a294d7c9f1b419180d71748',18);
INSERT INTO `library_asset_keywordsList` VALUES (418,'3dfa350b0a294d7c9f1b419180d71748',23);
INSERT INTO `library_asset_keywordsList` VALUES (419,'3dfa350b0a294d7c9f1b419180d71748',162);
INSERT INTO `library_asset_keywordsList` VALUES (420,'5c179fdb44924eba8a42c0948766ca62',133);
INSERT INTO `library_asset_keywordsList` VALUES (421,'5c179fdb44924eba8a42c0948766ca62',218);
INSERT INTO `library_asset_keywordsList` VALUES (422,'5c179fdb44924eba8a42c0948766ca62',136);
INSERT INTO `library_asset_keywordsList` VALUES (423,'5c179fdb44924eba8a42c0948766ca62',135);
INSERT INTO `library_asset_keywordsList` VALUES (424,'5c179fdb44924eba8a42c0948766ca62',117);
INSERT INTO `library_asset_keywordsList` VALUES (425,'6f6441599cc045ae91530ecd6cc5a81e',219);
/*!40000 ALTER TABLE `library_asset_keywordsList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_author`
--

DROP TABLE IF EXISTS `library_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_author` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `firstName` varchar(200) NOT NULL,
  `lastName` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_author`
--
-- ORDER BY:  `id`,`username`

LOCK TABLES `library_author` WRITE;
/*!40000 ALTER TABLE `library_author` DISABLE KEYS */;
INSERT INTO `library_author` VALUES (14,'pbkdf2_sha256$600000$MIaP1bODw2dY6iN66KHaMq$OYPeYyneq/sfZaZwJJ5tKRQEC+t2O/xAfMSgryom9y0=',NULL,0,'willcai','','',0,1,'2025-04-21 06:44:28.574397','Will','Cai','');
INSERT INTO `library_author` VALUES (15,'pbkdf2_sha256$600000$krpgE0ZozfVhFz3MJHTgQE$zKS+mz2VHFzwPmr5Ad9nL4fMfljsGz0wPpNsW4vQPF8=',NULL,0,'eschou','','',0,1,'2025-04-21 06:44:28.791809','Elyssa','Chou','');
INSERT INTO `library_author` VALUES (16,'pbkdf2_sha256$600000$4JEINZO8cqUNN5OSUXWaIb$HTaSwP9JwsIFFSPfHRQbmCanXq4vLJjBqf3eJ3ElODE=',NULL,0,'fernc','','',0,1,'2025-04-21 06:44:28.954423','Caroline','Fernandes','');
INSERT INTO `library_author` VALUES (17,'pbkdf2_sha256$600000$7q3M9A5cbwr6a7tlWLzyxf$m7qfBpAB/BdygxPzAJZgb4dj2UzLrXj1EIZkcBOgwD0=',NULL,0,'geant','','',0,1,'2025-04-21 06:44:29.118424','Anthony','Ge','');
INSERT INTO `library_author` VALUES (18,'pbkdf2_sha256$600000$TGsMhqUYcKnmPrTe9RUGEy$C1pmbMEF01cP1I1fp9SgMAZq+yICyy1aa5kvNfATnWs=',NULL,0,'jyguan','','',0,1,'2025-04-21 06:44:29.297589','Jackie','Guan','');
INSERT INTO `library_author` VALUES (19,'pbkdf2_sha256$600000$LNgzwoQCNLlyeHDZdO3PC1$s7NXPhNHrxnOgpddvnmyKXyD4ifrfbHZIsNpjIzMazQ=',NULL,0,'aajiang','','',0,1,'2025-04-21 06:44:29.457955','Aaron','Jiang','');
INSERT INTO `library_author` VALUES (20,'pbkdf2_sha256$600000$HYJW9qFE4jwaevDebKVujN$vwWnafrlhycBeuX2vI8bIWJxI1pGzfXMdE1OVM7q6YE=',NULL,0,'raclin','','',0,1,'2025-04-21 06:44:29.619083','Rachel','Lin','');
INSERT INTO `library_author` VALUES (21,'pbkdf2_sha256$600000$cHkASTc47jayEIGi9hXyih$sSFu14nWSxc9u5onYKFL0ymyI6lLzvnIdA+YeagJrOY=',NULL,0,'liuamy05','','',0,1,'2025-04-21 06:44:29.800666','Amy','Liu','');
INSERT INTO `library_author` VALUES (22,'pbkdf2_sha256$600000$EN5yC61pZaoTDpPbm0p6Z9$cRK0EDcwr3M5iOVPQt/LQABlXXt9aAZCh/Eu5O2ECYE=',NULL,0,'claran','','',0,1,'2025-04-21 06:44:30.011940','Clara','Nolan','');
INSERT INTO `library_author` VALUES (23,'pbkdf2_sha256$600000$K8bV4wxnO8iLrxQ6tblAWm$+aPOAShFhlro2MvQlcPK5cC4z9h83VmC1mWid6BypUU=',NULL,0,'soominp','','',0,1,'2025-04-21 06:44:30.229995','Jacky','Park','');
INSERT INTO `library_author` VALUES (24,'pbkdf2_sha256$600000$mHPZIGkRq4qnW8d8E2WOgo$Oe3L8BeaBTFB3rlLEbfvaB01CuKgnOYYUMnD0Q7GCrQ=',NULL,0,'chuu','','',0,1,'2025-04-21 06:44:30.436531','Christina','Qiu','');
INSERT INTO `library_author` VALUES (25,'pbkdf2_sha256$600000$mfnmBoJdr349uKjHA2tUuj$SwIliRoisyxo6UGteuH27DQ/EOy1Hth/pCe1DUMS6yU=',NULL,0,'czw','','',0,1,'2025-04-21 06:44:30.622202','Charles','Wang','');
INSERT INTO `library_author` VALUES (26,'pbkdf2_sha256$600000$Jc2TekXh5GIleiVysBI8zF$lQvYYim9vIG9rR3iDNLGnM7cA9HOkMbdE6fz2nCoQaM=',NULL,0,'cxndy','','',0,1,'2025-04-21 06:44:30.863785','Cindy','Xu','');
INSERT INTO `library_author` VALUES (27,'pbkdf2_sha256$600000$3rQFljX60Gxk8G9DDSYcn6$bS4pD86i2hGBd6dIOdpmkK2aYeq6R7g0EhV5+wqH9SY=',NULL,0,'echou','','',0,1,'2025-04-21 06:44:37.510138','','','');
INSERT INTO `library_author` VALUES (28,'pbkdf2_sha256$600000$EGhpuA83tLgsJVEZmWQjBo$C9EYHGra3ti9+ovl9Bq1ER959vY2a0GFtKnyfJzsfLo=',NULL,0,'xizou','','',0,1,'2025-04-21 06:49:37.590701','','','');
INSERT INTO `library_author` VALUES (29,'pbkdf2_sha256$600000$ClAwCs51I66S8zElMmyYgL$/3JLcKq66vEIJIFhPfKI0oY8SeMqQ5QdKGUgF1S4u0w=',NULL,0,'jofisch','','',0,1,'2025-04-21 06:49:37.984883','','','');
INSERT INTO `library_author` VALUES (30,'pbkdf2_sha256$600000$BgmlXhSPXjoqfJcqHTVZ5o$U0FNcHgtswGH/IFlJ18J9LEg4WMA9zxS7NqiviD7izU=',NULL,0,'tlshaw','','',0,1,'2025-04-21 06:49:41.213741','','','');
INSERT INTO `library_author` VALUES (31,'pbkdf2_sha256$600000$0cMJRCCfSR2nGPxZHHmlVJ$hFwVwoktNbjpbyr/0/wunyQ7mwnGgMBtqqhjKr7SkDE=',NULL,0,'unknown','','',0,1,'2025-04-21 06:49:43.844851','','','');
INSERT INTO `library_author` VALUES (32,'pbkdf2_sha256$600000$KEuzdn6sBuHL9d7DvOC4sh$Ae5pETxkikbYMxS7EeypLiId8r750GbXJawByInb6n8=',NULL,0,'chengca','','',0,1,'2025-04-21 06:49:48.058698','','','');
INSERT INTO `library_author` VALUES (33,'pbkdf2_sha256$600000$wOir16JE9sg8dfVLPLuG0d$L5755Umf1uR+RTqvTl8dV3GY0gqSoM0SJLSoTpLZh78=',NULL,0,'hwang27','','',0,1,'2025-04-21 06:49:48.451384','','','');
INSERT INTO `library_author` VALUES (34,'pbkdf2_sha256$600000$0EAP7Q2OPMo6MQVjgjKHG9$AWnRKAm7fqy7I6oHu5WVG+l3JumtX4pDYM5vfIZ3M/c=',NULL,0,'dmeegoda','','',0,1,'2025-04-21 06:49:54.625973','','','');
INSERT INTO `library_author` VALUES (35,'pbkdf2_sha256$600000$SwfXjZ5R0YB0xjY1YfW1nQ$YlBR/cw6F3Ebwfy4QEGhODYTj6Ck1KLlSZyIswqp4jY=',NULL,0,'lijacque','','',0,1,'2025-04-21 06:49:54.978134','','','');
INSERT INTO `library_author` VALUES (36,'pbkdf2_sha256$600000$a9vsvpVwB5dNGkav7Iw9gI$VzXLoHsvuki+YKQh7el/+mmTIMiPqAgI2pOZcSYHDWs=',NULL,0,'annieqiu','','',0,1,'2025-04-21 06:49:58.960495','','','');
INSERT INTO `library_author` VALUES (37,'pbkdf2_sha256$600000$N7WhEDw0tkA8VrG3OR5lf5$S7tCmbgOueGD+UmYk6wjpXjMS41iNIWQIh0AhR0nhnw=',NULL,0,'zhulinda','','',0,1,'2025-04-21 06:49:59.534908','','','');
INSERT INTO `library_author` VALUES (38,'pbkdf2_sha256$600000$CGNEGE2Y5mUkzALRX2oRRb$5ctjjhDUPCbeU4BAe1t1fo+SM2XEdJu8U0+txnoJjhM=',NULL,0,'debbylin','','',0,1,'2025-04-21 06:50:02.375890','','','');
INSERT INTO `library_author` VALUES (39,'pbkdf2_sha256$600000$yi401LYm26qXtQZ0QG8dpG$thpQhlxZNWDt/erJv181VaLJrYyDA11uue65rihn/bM=',NULL,0,'lyifa','','',0,1,'2025-04-21 06:50:04.310508','','','');
INSERT INTO `library_author` VALUES (40,'pbkdf2_sha256$600000$L03DtVj360tk9ydbV1g0DT$skwfkPTM1aA9Q/rWV7DUzby8BFHawxlsVdWcNERlDzM=',NULL,0,'ckyra','','',0,1,'2025-04-21 06:50:04.589882','','','');
/*!40000 ALTER TABLE `library_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_author_groups`
--

DROP TABLE IF EXISTS `library_author_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_author_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `author_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `library_author_groups_author_id_group_id_a5d38461_uniq` (`author_id`,`group_id`),
  KEY `library_author_groups_group_id_6d034c61_fk_auth_group_id` (`group_id`),
  CONSTRAINT `library_author_groups_author_id_f54c3d02_fk_library_author_id` FOREIGN KEY (`author_id`) REFERENCES `library_author` (`id`),
  CONSTRAINT `library_author_groups_group_id_6d034c61_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_author_groups`
--
-- ORDER BY:  `id`,`author_id`,`group_id`,`group_id`

LOCK TABLES `library_author_groups` WRITE;
/*!40000 ALTER TABLE `library_author_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_author_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_author_user_permissions`
--

DROP TABLE IF EXISTS `library_author_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_author_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `author_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `library_author_user_perm_author_id_permission_id_878e589f_uniq` (`author_id`,`permission_id`),
  KEY `library_author_user__permission_id_8a1a11f9_fk_auth_perm` (`permission_id`),
  CONSTRAINT `library_author_user__author_id_8c1463cb_fk_library_a` FOREIGN KEY (`author_id`) REFERENCES `library_author` (`id`),
  CONSTRAINT `library_author_user__permission_id_8a1a11f9_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_author_user_permissions`
--
-- ORDER BY:  `id`,`author_id`,`permission_id`,`permission_id`

LOCK TABLES `library_author_user_permissions` WRITE;
/*!40000 ALTER TABLE `library_author_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_author_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_commit`
--

DROP TABLE IF EXISTS `library_commit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_commit` (
  `id` char(32) NOT NULL,
  `version` varchar(32) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `note` longtext NOT NULL,
  `asset_id` char(32) NOT NULL,
  `author_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `library_commit_asset_id_413107ba_fk_library_asset_id` (`asset_id`),
  KEY `library_commit_author_id_176d6481_fk_library_author_id` (`author_id`),
  KEY `library_commit_timestamp_7bc2a52e` (`timestamp`),
  KEY `library_commit_version_b51ce0c6` (`version`),
  CONSTRAINT `library_commit_asset_id_413107ba_fk_library_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `library_asset` (`id`),
  CONSTRAINT `library_commit_author_id_176d6481_fk_library_author_id` FOREIGN KEY (`author_id`) REFERENCES `library_author` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_commit`
--
-- ORDER BY:  `id`,`asset_id`,`author_id`,`timestamp`,`version`

LOCK TABLES `library_commit` WRITE;
/*!40000 ALTER TABLE `library_commit` DISABLE KEYS */;
INSERT INTO `library_commit` VALUES ('001ac9a1904d46e2b29a4a75780fa815','02.00.00','2024-02-12 00:00:00.000000','Week 3 update: schema version update, add LODs','66b74b32abd8459cbe41f434285a7691',30);
INSERT INTO `library_commit` VALUES ('01ae6f63a86c45c194975b6f7c862c5b','03.00.00','2025-02-14 02:59:00.000000','Converted LODs to a variant set','a0d5c1f281f046cd9ff2287dfed6cd63',18);
INSERT INTO `library_commit` VALUES ('03fd79c412ca4c8f99fa080e96ed9431','05.00.00','2025-04-27 14:54:29.000000','Standardize assets to final project USD structure.','31c39c346b394a1f90cf0a00f1c4a6ef',29);
INSERT INTO `library_commit` VALUES ('08230acecd3545ea9623ae75b96792fd','04.00.00','2025-04-27 14:54:30.000000','Standardize assets to final project USD structure.','4be817e19e11426ebeede52145732e77',21);
INSERT INTO `library_commit` VALUES ('082bcc45f4364815a58bc12565677a33','01.00.00','2024-11-13 21:49:00.000000','Initial creation','2df25bd14a5542aab9eaa23f1c3ccd1e',25);
INSERT INTO `library_commit` VALUES ('08b28d92ef3c4444b7674d702b991163','05.00.00','2025-04-27 14:54:31.000000','Standardize assets to final project USD structure.','6188a79945fa415f906a1c6463a497eb',28);
INSERT INTO `library_commit` VALUES ('0c5066e5a6a74b9cbc9c9b3900f0318d','05.00.00','2024-04-08 00:00:00.000000','Week 10 update: USDA things','66b74b32abd8459cbe41f434285a7691',30);
INSERT INTO `library_commit` VALUES ('0f6600dea1a64039b21aa8f6d45abcb0','01.00.00','2024-02-29 20:06:49.000000','Initial creation','c0e55d851ea64aa4aeec27c29594a555',22);
INSERT INTO `library_commit` VALUES ('10a5599fb94d45559d1c6090a85fc04c','04.00.00','2025-04-27 14:54:29.000000','Standardize assets to final project USD structure.','082f328bf76a4d48be255c620a8cd280',27);
INSERT INTO `library_commit` VALUES ('10dbcf5b85f447abbc93d59c333a4a1c','01.00.00','2024-02-12 00:00:00.000000','created initial mesh and LODs','db17d0c2030049769e1ba2ea54d86114',31);
INSERT INTO `library_commit` VALUES ('120dac7a0ece4eeea9f899d49278f482','01.00.00','2025-04-29 07:02:46.000000','Created models','21ff4cfc83b0435a91b2404af9477d51',19);
INSERT INTO `library_commit` VALUES ('1b5b4fb2d7d54b798f3aba0c4bf2564b','05.00.00','2025-04-27 14:54:29.000000','Standardize assets to final project USD structure.','2c7ef29f88474ded95eb449ebb264ead',34);
INSERT INTO `library_commit` VALUES ('1b8523fac92e47548db29d8d903c715c','01.00.00','2024-02-12 00:00:00.000000','initial upload','b7d69121f36340adbdb7bed776c42a8d',39);
INSERT INTO `library_commit` VALUES ('1fbcf78872b0461baf87acae54c5817f','01.00.00','2025-04-29 07:02:46.000000','Created models','b24acc08b15546e896c3e25add15f1ba',19);
INSERT INTO `library_commit` VALUES ('200d0851a1e341ff98f608b3b6f5c964','03.00.00','2025-02-18 02:20:00.000000','Converted LODs to a varient set','63cd5d6f9e9243fd9a6276093c547cf7',14);
INSERT INTO `library_commit` VALUES ('2080a28eb3e2401394e5acc914513592','01.00.00','2025-04-29 07:02:46.000000','Created models','aa9e8d80d09e4675915f7e5080b7b351',19);
INSERT INTO `library_commit` VALUES ('255c412ab9a1428a8bd9d36554f83f2b','01.00.00','2025-04-29 07:02:46.000000','Created models','6bc90b076ae74ab9842a07913f22e681',19);
INSERT INTO `library_commit` VALUES ('2700c60e767d4eaca7036b942f2dcffa','01.00.00','2025-04-29 07:02:46.000000','Created models','c5f39a998aec42cc8396f2ff23cbb375',19);
INSERT INTO `library_commit` VALUES ('27a42826d23648c2950813057e8aef3b','02.00.00','2024-02-19 00:00:00.000000','combined LODs into one asset with variant set','db17d0c2030049769e1ba2ea54d86114',31);
INSERT INTO `library_commit` VALUES ('27b0f2191a5742909df692b5aa762e72','01.00.00','2025-04-29 07:02:46.000000','Created models','89dbc25b1e554c6eae3212cc3e28850c',19);
INSERT INTO `library_commit` VALUES ('28742f194d4d4dab9c62f34a25321753','01.00.00','2025-04-29 07:02:46.000000','Created models','a94d3ddac1e64aff86cf5a194c50d8bf',19);
INSERT INTO `library_commit` VALUES ('2fe069c0521e49f8b49a7e81c53e819d','02.00.00','2025-02-13 22:05:22.000000','Added LODs','63cd5d6f9e9243fd9a6276093c547cf7',26);
INSERT INTO `library_commit` VALUES ('314883862b0f4134bf3518d58c6eccf8','01.00.00','2024-11-04 03:19:00.000000','Initial creation','579fe0bad3f84b7babc143ab2952234e',14);
INSERT INTO `library_commit` VALUES ('31e6612f6a7b4674854857899b69e0bf','01.00.00','2025-04-29 07:02:46.000000','Created models','2652016a66e647f2bb874058b4d7e13c',19);
INSERT INTO `library_commit` VALUES ('341cbadd5c3b4cde9da4795157532b4c','03.00.00','2025-02-16 07:04:00.000000','Converted LODs to a variant set','39338164bc7f4fcaa1a14bc30beae3fe',20);
INSERT INTO `library_commit` VALUES ('35e5eb6736d54f26866ba050a7f7eff4','01.00.00','2025-04-29 07:02:46.000000','Created models','10a15094d1dc45b7bcf8c698420b9e91',19);
INSERT INTO `library_commit` VALUES ('36aa463d0f734b3aa022ffe653725346','01.00.00','2025-04-29 07:02:46.000000','Created models','f148935dbe764e648b2641d5ddcde381',19);
INSERT INTO `library_commit` VALUES ('37379d25def04ecda689e94fb9edf58b','01.00.00','2024-02-12 00:00:00.000000','Create initial assets and LODs.','3d283193f6b54cf0a233a5b83ed95819',36);
INSERT INTO `library_commit` VALUES ('39bd8cd533fd4770b1396fcbc2740c23','02.00.00','2025-02-09 15:30:00.000000','Added LODs','f5e189a845fb4ed3930a81263a21bf99',20);
INSERT INTO `library_commit` VALUES ('3ac753cfd6a945ac9f316bf8fea01d19','01.00.00','2024-02-12 00:00:00.000000','','6188a79945fa415f906a1c6463a497eb',28);
INSERT INTO `library_commit` VALUES ('3b45de18fe874e6eabe5cbe65471e5b9','01.00.00','2025-02-04 03:14:32.000000','Initial creation','f08cf286cf1b4110bdb5c6d03dfad92a',23);
INSERT INTO `library_commit` VALUES ('3fa24a147e844ce098a09e0d1a20b910','02.00.00','2024-02-19 00:00:00.000000','combined LODs into one asset with variant set','31c39c346b394a1f90cf0a00f1c4a6ef',38);
INSERT INTO `library_commit` VALUES ('4044890db4294e7496e592430109106f','04.00.00','2025-04-27 14:54:32.000000','Standardize assets to final project USD structure.','f175fbe4933944a69d06e86c906622d6',17);
INSERT INTO `library_commit` VALUES ('417e84b4ea95486cb7c332c505fda838','04.00.00','2024-04-08 00:00:00.000000','adjusting format to fit standard','5bac6ed09efe4816b7c427ffb08c599d',31);
INSERT INTO `library_commit` VALUES ('41a8a30353b648ccab73c1ca06d3be53','03.00.00','2024-02-25 00:00:00.000000','updated metadata','b6234f0922c94798ba12257342157faa',31);
INSERT INTO `library_commit` VALUES ('4617d527ce664539ac4d04b98f39c775','02.00.00','2024-02-19 00:00:00.000000','created variants set and added default prim. Added transformation adjustments for each LOD.','3dcf8a1dac8242a59f83c50df682fb69',33);
INSERT INTO `library_commit` VALUES ('4b080631ee8c400c9b317dfe2f73210a','01.00.00','2025-04-29 07:02:46.000000','Created models','a8e9675b3e2a4a63b73c6d1fd34ca0e0',19);
INSERT INTO `library_commit` VALUES ('4b93edfdcd39457387013acc8365ba8f','01.00.00','2025-04-29 07:02:46.000000','Created models','f1d3b419b0444e58a2e45fe157647464',19);
INSERT INTO `library_commit` VALUES ('4b97c3e445a149bca609e5510426ad95','01.00.00','2024-05-23 04:48:00.000000','Inital creation','a0d5c1f281f046cd9ff2287dfed6cd63',19);
INSERT INTO `library_commit` VALUES ('4d8c770d3eab414d98c79ec33c8c8fc9','01.00.00','2025-04-29 07:02:46.000000','Created models','3684e1145a004e7987f06b8c071166a1',19);
INSERT INTO `library_commit` VALUES ('4f387376a39c4a708ac10bcac5597f6b','01.00.00','2025-04-29 07:02:46.000000','Created models','a69b43a2c8ba44a499e7f698f736e60b',19);
INSERT INTO `library_commit` VALUES ('4fca4fc358f64733a9b17129dc9b1d5c','01.00.00','2025-04-29 07:02:46.000000','Created models','3dfa350b0a294d7c9f1b419180d71748',19);
INSERT INTO `library_commit` VALUES ('50cebaaabab640fe81bb36d925a3ff32','02.00.00','2025-02-11 01:48:00.000000','Added LODs','39338164bc7f4fcaa1a14bc30beae3fe',24);
INSERT INTO `library_commit` VALUES ('53e87e970024471aa5f9d59df80cd3ad','03.00.00','2025-02-16 05:22:06.000000','Converted LODs to a variant set','2df25bd14a5542aab9eaa23f1c3ccd1e',21);
INSERT INTO `library_commit` VALUES ('540024a960e340678bbc400097b28d3f','03.00.00','2025-02-19 04:59:00.000000','Converted LODs to a variant set','082f328bf76a4d48be255c620a8cd280',22);
INSERT INTO `library_commit` VALUES ('581241a5d8154c5e964fe8f576d89066','01.00.00','2025-04-29 07:02:46.000000','Created models','bc9563cab790436abc6180a53087ad1a',19);
INSERT INTO `library_commit` VALUES ('582095eb65d6427eab78e83312c6193d','02.00.00','2025-01-30 21:20:00.000000','Added LODs','6f6441599cc045ae91530ecd6cc5a81e',18);
INSERT INTO `library_commit` VALUES ('58d67426fe6e409b92cae3f1b9cd6114','01.00.00','2024-02-12 00:00:00.000000','initial object','2c7ef29f88474ded95eb449ebb264ead',34);
INSERT INTO `library_commit` VALUES ('59571c714f894bed9cb0897d9305e4b8','03.00.00','2024-02-26 00:00:00.000000','Corrected transformations and recreate LOD0.usda','3d283193f6b54cf0a233a5b83ed95819',36);
INSERT INTO `library_commit` VALUES ('59c4ddbbf461431e997d5cd9d1b25956','02.00.00','2025-02-12 00:50:32.000000','Added LODs','c0e55d851ea64aa4aeec27c29594a555',22);
INSERT INTO `library_commit` VALUES ('5b2f005ce7204d98867f315dc4b69391','01.00.00','2025-04-29 07:02:46.000000','Created models','fa20ba6a205e4d2b951f8262bf5b2802',19);
INSERT INTO `library_commit` VALUES ('5b4d4b670fd34c7894b0e73b3e3aaab5','03.00.00','2024-02-25 00:00:00.000000','updated metadata','db17d0c2030049769e1ba2ea54d86114',31);
INSERT INTO `library_commit` VALUES ('5e7a162ff3324b7da8b1b01b65b36bec','04.00.00','2024-04-08 00:00:00.000000','updated asset structure','db17d0c2030049769e1ba2ea54d86114',31);
INSERT INTO `library_commit` VALUES ('5f0f81aacddf40ef9c96d968e4c3ace8','04.00.00','2025-04-27 14:54:30.000000','Standardize assets to final project USD structure.','3d283193f6b54cf0a233a5b83ed95819',36);
INSERT INTO `library_commit` VALUES ('5f6c93b60cd34ee8a81d7a5e5adf3cb2','01.00.00','2025-04-29 07:02:46.000000','Created models','76e5d476ecc44eeea6da09806954f8bd',19);
INSERT INTO `library_commit` VALUES ('5fd4844cd9604823ac0d1ac5fa61ff9a','04.00.00','2024-04-08 00:00:00.000000','updated asset structure','b6234f0922c94798ba12257342157faa',31);
INSERT INTO `library_commit` VALUES ('630802fb36a24f8194e58c83631b74ed','04.00.00','2024-04-08 00:00:00.000000','adjusting format to fit standard','6188a79945fa415f906a1c6463a497eb',28);
INSERT INTO `library_commit` VALUES ('66b966ae4c7242e6965dcd16a661cbde','01.00.00','2025-04-29 07:02:46.000000','Created models','99f5e6f9675b41ed91e76daebb016c4a',19);
INSERT INTO `library_commit` VALUES ('6890728fcdc843919bbacd395c7e3f34','01.00.00','2025-04-29 07:02:46.000000','Created models','f0941eb324214c48b9a0755db5eaf79b',19);
INSERT INTO `library_commit` VALUES ('6a95cdd486874ff69815c584776f892f','02.00.00','2025-02-10 21:59:44.000000','Added LODs','2df25bd14a5542aab9eaa23f1c3ccd1e',25);
INSERT INTO `library_commit` VALUES ('6fdb70b726224a8a9778394fafaed9c0','04.00.00','2025-04-27 14:54:30.000000','Standardize assets to final project USD structure.','579fe0bad3f84b7babc143ab2952234e',14);
INSERT INTO `library_commit` VALUES ('73159c4f081b4195a5398a1c80375646','04.00.00','2024-02-26 00:00:00.000000','Week 5 update: schema version update','66b74b32abd8459cbe41f434285a7691',30);
INSERT INTO `library_commit` VALUES ('73d77d8066b048fdaa5cb53f8299add0','01.00.00','2024-11-21 17:00:00.000000','Initial creation','6f6441599cc045ae91530ecd6cc5a81e',18);
INSERT INTO `library_commit` VALUES ('75271bd9cfb64de19ea2b87dacd46a07','04.00.00','2025-04-27 14:54:31.000000','Standardize assets to final project USD structure.','63cd5d6f9e9243fd9a6276093c547cf7',26);
INSERT INTO `library_commit` VALUES ('7768e01ecfb94601ba27e213c841d797','03.00.00','2024-02-25 00:00:00.000000','updated metadata','31c39c346b394a1f90cf0a00f1c4a6ef',29);
INSERT INTO `library_commit` VALUES ('7831dae0482b42a69a1d0a70e2b24fc4','02.00.00','2025-02-07 22:08:00.000000','Added LODs','082f328bf76a4d48be255c620a8cd280',27);
INSERT INTO `library_commit` VALUES ('7bcaf7366a0f47c9b617cce7a5454d58','02.00.00','2024-02-19 00:00:00.000000','added variants','5bac6ed09efe4816b7c427ffb08c599d',31);
INSERT INTO `library_commit` VALUES ('7c5e07f6fcad4550a221d488db23e390','01.00.00','2024-10-14 20:08:00.000000','Initial creation','082f328bf76a4d48be255c620a8cd280',27);
INSERT INTO `library_commit` VALUES ('7c65c53193494d16b3c18e83046be704','04.00.00','2024-04-08 00:00:00.000000','adjusting format to support assembly','3dcf8a1dac8242a59f83c50df682fb69',32);
INSERT INTO `library_commit` VALUES ('7d44fdb20dd842fc84224148584fcec2','01.00.00','2025-04-29 07:02:46.000000','Created models','d189b8bcea4e4e289d133f6fdfe25d8b',19);
INSERT INTO `library_commit` VALUES ('7dfdde7702cb40bb95e40b4491db644e','01.00.00','2025-04-29 07:02:46.000000','Created models','39ab42636a0747ffa50446bcf4f57980',19);
INSERT INTO `library_commit` VALUES ('8060401cf94c49519913103af6664ff5','01.00.00','2024-01-30 00:00:00.000000','initial upload','3dcf8a1dac8242a59f83c50df682fb69',32);
INSERT INTO `library_commit` VALUES ('80e187d5ae2d48a1aa5969713728ff52','05.00.00','2025-04-27 14:54:32.000000','Standardize assets to final project USD structure.','b6234f0922c94798ba12257342157faa',31);
INSERT INTO `library_commit` VALUES ('83adfd4a64da4bb6be2754ef9d8487bf','04.00.00','2025-02-17 18:26:00.000000','Converted LODs to a variant set','c4449799e71a4ce88999ea44a86e067b',26);
INSERT INTO `library_commit` VALUES ('86b6a2c304a6440fadbe9ecdde9f23df','02.00.00','2024-02-15 00:00:00.000000','created variants set, added default prim and put all prims under one xform to LODs','b7d69121f36340adbdb7bed776c42a8d',40);
INSERT INTO `library_commit` VALUES ('888dbd6f89d74ff5920c2b3a0c54e8b5','02.00.00','2024-02-19 00:00:00.000000','added variants','6188a79945fa415f906a1c6463a497eb',29);
INSERT INTO `library_commit` VALUES ('8914b448f1e94d2c9a5b65bb44c2bf2d','04.00.00','2025-04-27 14:54:31.000000','Standardize assets to final project USD structure.','6f6441599cc045ae91530ecd6cc5a81e',18);
INSERT INTO `library_commit` VALUES ('8930071d64ee4deeb824d7d97f5d6aa7','05.00.00','2025-04-27 14:54:30.000000','Standardize assets to final project USD structure.','3dcf8a1dac8242a59f83c50df682fb69',32);
INSERT INTO `library_commit` VALUES ('895d7506a994461781cd1d45e9a76a61','01.00.00','2025-04-29 07:02:46.000000','Created models','1cb7eed87f6c413b9a582792de2f2fe1',19);
INSERT INTO `library_commit` VALUES ('8b599b89cae0451d8f02f0f8b4c04cd8','02.00.00','2024-02-19 00:00:00.000000','combined LODs into one asset with variant set','b6234f0922c94798ba12257342157faa',31);
INSERT INTO `library_commit` VALUES ('8cc993b07503485798ae74150d47a54e','01.00.00','2025-04-29 07:02:46.000000','Created models','993f2365ed5446068f9eb0e6c21a8e9c',19);
INSERT INTO `library_commit` VALUES ('8d2707e3036c4e66b16a37a64afac8af','01.00.00','2025-04-29 07:02:46.000000','Created models','81cdcad6e58a448b8dad18e4d311b5f1',19);
INSERT INTO `library_commit` VALUES ('8e437cd562b34e0f9c216fb2a1a884c9','04.00.00','2025-04-27 14:54:29.000000','Standardize assets to final project USD structure.','2df25bd14a5542aab9eaa23f1c3ccd1e',25);
INSERT INTO `library_commit` VALUES ('8e9f753a4aa64feea0093d3dcba28e2c','01.00.00','2025-04-29 07:02:46.000000','Created models','a1513d5dbdf7478aab3b4d659a3f5e74',19);
INSERT INTO `library_commit` VALUES ('8f25fb20b7b64e5ebd2116b1a6649971','01.00.00','2025-01-30 18:06:00.000000','Initial creation','c4449799e71a4ce88999ea44a86e067b',16);
INSERT INTO `library_commit` VALUES ('91ecbcb57e2744a6afc8898bc9ef5d7e','01.00.00','2025-04-29 07:02:46.000000','Created models','16fd6a411cc2475099c6b26a09175e77',19);
INSERT INTO `library_commit` VALUES ('9438cca5aaa14472a653f34fd65ef7ef','02.00.00','2025-02-12 05:00:26.000000','Added LODs','4be817e19e11426ebeede52145732e77',21);
INSERT INTO `library_commit` VALUES ('94412349ce034ae6a57bccaf02cb4cbc','03.00.00','2025-02-14 23:46:00.000000','Converted LODs to a variant set','579fe0bad3f84b7babc143ab2952234e',16);
INSERT INTO `library_commit` VALUES ('9449b06834c6450fb8af0fe247f6986b','01.00.00','2025-04-29 07:02:46.000000','Created models','fa5e37ee437e45acb2ae0c3c9c725b83',19);
INSERT INTO `library_commit` VALUES ('9692ca098d154ffebe1b86c91cf91aa1','01.00.00','2025-04-29 07:02:46.000000','Created models','ed516f0180c84489b7cd35f892c8e438',19);
INSERT INTO `library_commit` VALUES ('97356a97e3724964855d050a3b32d7a0','02.00.00','2024-02-19 00:00:00.000000','created variant sets','2c7ef29f88474ded95eb449ebb264ead',35);
INSERT INTO `library_commit` VALUES ('98a0fe04bdc146a681f1511e998d7a88','01.00.00','2025-04-29 07:02:46.000000','Created models','313b0aae14664f14b656d4d17478fbc3',19);
INSERT INTO `library_commit` VALUES ('98c25c753c994c2dabf62ffcf6854893','03.00.00','2025-02-13 05:28:00.000000','Converted LODs to a variant set','6f6441599cc045ae91530ecd6cc5a81e',19);
INSERT INTO `library_commit` VALUES ('9cc050f8df3d47f18321860443d5efb7','04.00.00','2025-04-27 14:54:29.000000','Standardize assets to final project USD structure.','39338164bc7f4fcaa1a14bc30beae3fe',24);
INSERT INTO `library_commit` VALUES ('9d782a95e12b45da867eac3718370559','01.00.00','2025-04-29 07:02:46.000000','Created models','8deb7dd1667c428b89933de25c02e4ce',19);
INSERT INTO `library_commit` VALUES ('a060ae11f20f47c295c978b3d20d68e4','03.00.00','2024-02-27 00:00:00.000000','fixed scales for the LODs','3dcf8a1dac8242a59f83c50df682fb69',32);
INSERT INTO `library_commit` VALUES ('a23502cb6fbe41eda402306bfcadde39','02.00.00','2025-02-10 00:14:28.000000','Added LODs','f08cf286cf1b4110bdb5c6d03dfad92a',23);
INSERT INTO `library_commit` VALUES ('a2da3a9559f24bfb8695e9374b56964f','01.00.00','2025-04-29 07:02:46.000000','Created models','427b041b429f4dffb526ee677a936f12',19);
INSERT INTO `library_commit` VALUES ('a2de5163675145199fd7fd4b2fafee54','01.00.00','2025-04-29 07:02:46.000000','Created models','ca9ae1e89e6145bea24272531dcfbe27',19);
INSERT INTO `library_commit` VALUES ('a5af7751dfb646dc9c2602c30580905f','01.00.00','2025-02-04 01:00:22.000000','Initial creation','63cd5d6f9e9243fd9a6276093c547cf7',26);
INSERT INTO `library_commit` VALUES ('a6828e73d2294bca80df36bec85b5ef6','04.00.00','2024-04-08 00:00:00.000000','add sublayers to woodenChair.usda','b7d69121f36340adbdb7bed776c42a8d',39);
INSERT INTO `library_commit` VALUES ('a972cae8b64a446ca20f69fd50512a68','04.00.00','2024-03-04 00:00:00.000000','fixed up asset structures for week 10 (allowing sublayers and lods per model variant)','2c7ef29f88474ded95eb449ebb264ead',34);
INSERT INTO `library_commit` VALUES ('abc488e0720a4157b80eb82c929b3d35','02.00.00','2024-02-19 00:00:00.000000','Created LOD variants and Rescaled original model','3d283193f6b54cf0a233a5b83ed95819',37);
INSERT INTO `library_commit` VALUES ('ad8b2e590a2b4e1fbd36a23d047d6b94','05.00.00','2025-04-27 14:54:31.000000','Standardize assets to final project USD structure.','5bac6ed09efe4816b7c427ffb08c599d',31);
INSERT INTO `library_commit` VALUES ('b0cdc992c7b44dd7858ec1e6ab30478e','01.00.00','2025-04-29 07:02:46.000000','Created models','d9782679927741a6b9b9449b3054ff77',19);
INSERT INTO `library_commit` VALUES ('b48040f447fe41b6adc06c86635ed3fe','01.00.00','2024-12-03 19:55:13.000000','Initial version','4be817e19e11426ebeede52145732e77',21);
INSERT INTO `library_commit` VALUES ('b488a096c70f4a95815f4b4a3271d55b','04.00.00','2025-04-27 14:54:32.000000','Standardize assets to final project USD structure.','f5e189a845fb4ed3930a81263a21bf99',20);
INSERT INTO `library_commit` VALUES ('b5a01439c6984206b0c2897031285d34','01.00.00','2025-02-04 01:48:00.000000','Initial creation','39338164bc7f4fcaa1a14bc30beae3fe',24);
INSERT INTO `library_commit` VALUES ('b6d60436451b468baf24c893dafd1309','01.00.00','2025-04-29 07:02:46.000000','Created models','ba022dd31fd0446a907529c711cea63f',19);
INSERT INTO `library_commit` VALUES ('b7be187ce7f84cfb873578534a9d03b8','01.00.00','2025-04-29 07:02:46.000000','Created models','c21bb4bc82c74bf08857cc21bac2f3b4',19);
INSERT INTO `library_commit` VALUES ('bb00b85140df41709e2631e00ab9829e','01.00.00','2025-04-29 07:02:46.000000','Created models','e1dc4b9960364ffba02431380e01df0f',19);
INSERT INTO `library_commit` VALUES ('bcfa5267c1734f649512f2031f81bbf0','03.00.00','2024-03-13 00:00:00.000000','adjusting format to fit standard','6188a79945fa415f906a1c6463a497eb',28);
INSERT INTO `library_commit` VALUES ('bf610943d61b4d459695155e6f4316a7','01.00.00','2025-04-29 07:02:46.000000','Created models','cc9847c9e64a4341bd8287edf73afe04',19);
INSERT INTO `library_commit` VALUES ('c08c25fe57b34be086211a48d294f9b9','01.00.00','2024-02-05 00:00:00.000000','Initial version','66b74b32abd8459cbe41f434285a7691',30);
INSERT INTO `library_commit` VALUES ('c117258181e947a39b1d50fe1cb2dc23','06.00.00','2025-04-27 14:54:31.000000','Standardize assets to final project USD structure.','66b74b32abd8459cbe41f434285a7691',30);
INSERT INTO `library_commit` VALUES ('c2c0ceed288e40eb980113aabe074af1','03.00.00','2025-02-18 03:41:03.000000','Converted LODs to a variant set','f08cf286cf1b4110bdb5c6d03dfad92a',17);
INSERT INTO `library_commit` VALUES ('c2f5bd419843464787b73a296ae12a59','02.00.00','2025-02-10 20:17:02.000000','Added LODs','f175fbe4933944a69d06e86c906622d6',17);
INSERT INTO `library_commit` VALUES ('c49d0149a34343ce921bedd142316fa1','03.00.00','2025-02-16 05:18:00.000000','Fixed scale for LOD1&2','c4449799e71a4ce88999ea44a86e067b',16);
INSERT INTO `library_commit` VALUES ('c4e7357fbf214c10b07d5a94a44f1877','03.00.00','2024-03-13 00:00:00.000000','adjusting format to fit standard','5bac6ed09efe4816b7c427ffb08c599d',31);
INSERT INTO `library_commit` VALUES ('c66017fb41a146d5b3de967c43e91328','01.00.00','2025-04-29 07:02:46.000000','Created models','7b333698a6b74e45a24e2e642b55d1dd',19);
INSERT INTO `library_commit` VALUES ('c86cc8d1b0704012a3e4798a753bf207','03.00.00','2024-02-19 00:00:00.000000','Week 4 update: schema version update, add main usda','66b74b32abd8459cbe41f434285a7691',30);
INSERT INTO `library_commit` VALUES ('cb8888970a0a4eac9f59e0b929081b0d','02.00.00','2025-02-04 00:30:00.000000','Added LODs','579fe0bad3f84b7babc143ab2952234e',14);
INSERT INTO `library_commit` VALUES ('ce792b65f0f84479a8f121ec5b17d96e','04.00.00','2025-04-27 14:54:31.000000','Standardize assets to final project USD structure.','a0d5c1f281f046cd9ff2287dfed6cd63',19);
INSERT INTO `library_commit` VALUES ('cfe66c6547fc4a93842ec2d974a7036d','02.00.00','2025-02-09 04:48:00.000000','Added LODs','a0d5c1f281f046cd9ff2287dfed6cd63',19);
INSERT INTO `library_commit` VALUES ('d1419f8a551b4971b778bc1cd3951283','01.00.00','2025-04-29 07:02:46.000000','Created models','6be75d74d18f4d88bc635b222107966f',19);
INSERT INTO `library_commit` VALUES ('d1f65316fc744d97bfdd428432fe3f8f','01.00.00','2025-04-29 07:02:46.000000','Created models','aff070bc60b647e29d302848b812f7c2',19);
INSERT INTO `library_commit` VALUES ('d2a22ce87fe6488fa658c43968ad51e9','03.00.00','2024-02-15 00:00:01.000000','set the scale of LOD1, LOD2 to match LOD0; cleaned up the file','b7d69121f36340adbdb7bed776c42a8d',39);
INSERT INTO `library_commit` VALUES ('d3caf093a9a8400d83b804fa2690a943','03.00.00','2025-02-16 21:05:27.000000','Converted LODs to a variant set','4be817e19e11426ebeede52145732e77',25);
INSERT INTO `library_commit` VALUES ('d4c53fb62da540a59d8284085da38014','03.00.00','2025-02-13 16:23:00.000000','Converted LODs to a variant set','c0e55d851ea64aa4aeec27c29594a555',15);
INSERT INTO `library_commit` VALUES ('d765ee03386a45178d376fea3994bd90','04.00.00','2025-04-27 14:54:32.000000','Standardize assets to final project USD structure.','c0e55d851ea64aa4aeec27c29594a555',22);
INSERT INTO `library_commit` VALUES ('d8b824a83e0e41c6b39ab2485015b6cf','01.00.00','2025-04-29 07:02:46.000000','Created models','1c7130d2d78e49d990ba12cde563e7c3',19);
INSERT INTO `library_commit` VALUES ('da2ecce389dc444ab58cb5350c95d22d','01.00.00','2024-02-12 00:00:00.000000','created initial mesh and LODs','31c39c346b394a1f90cf0a00f1c4a6ef',29);
INSERT INTO `library_commit` VALUES ('da7402477eee4071bd7ec1d3cbb33bda','01.00.00','2025-04-29 07:02:46.000000','Created models','449fe9fdd5434b03ae7f5bc021402fbf',19);
INSERT INTO `library_commit` VALUES ('dc0156eb7a8a4dbf8e08675f3d259c93','01.00.00','2025-04-29 07:02:46.000000','Created models','824b428456c148abb25d24568d649441',19);
INSERT INTO `library_commit` VALUES ('dca1e27cc37a4b4089f96fc95e9ed518','01.00.00','2025-04-29 07:02:46.000000','Created models','f3e934c53fa645b881d2e227e8eafaeb',19);
INSERT INTO `library_commit` VALUES ('dee912bf30834c589b0c1c0745fa8a6c','01.00.00','2025-04-29 07:02:46.000000','Created models','5c179fdb44924eba8a42c0948766ca62',19);
INSERT INTO `library_commit` VALUES ('df59caf90ed04c79961930eaa2bf113a','01.00.00','2025-02-04 07:02:00.000000','Initial creation','f5e189a845fb4ed3930a81263a21bf99',20);
INSERT INTO `library_commit` VALUES ('dfce60d77cb84ffa95a9c383e8f35bd2','01.00.00','2025-04-29 07:02:46.000000','Created models','65cb65e774ab4a4795d18ff514a071d9',19);
INSERT INTO `library_commit` VALUES ('e0399415f1214f3cbe28bae4deeeb20d','03.00.00','2025-02-18 03:34:00.000000','Converted LODs to a variant set','f175fbe4933944a69d06e86c906622d6',23);
INSERT INTO `library_commit` VALUES ('e452ba046c2a4988844b254459c2b802','05.00.00','2025-04-27 14:54:32.000000','Standardize assets to final project USD structure.','b7d69121f36340adbdb7bed776c42a8d',39);
INSERT INTO `library_commit` VALUES ('e808b3a9d92e4cb38681289539b59b79','01.00.00','2025-04-29 07:02:46.000000','Created models','f3a014272b104716a4e1296a4dcf4404',19);
INSERT INTO `library_commit` VALUES ('e8907ca713ac487997030771f58abe33','04.00.00','2025-04-27 14:54:32.000000','Standardize assets to final project USD structure.','f08cf286cf1b4110bdb5c6d03dfad92a',23);
INSERT INTO `library_commit` VALUES ('eb8fa9e26c974a1e96fc7194896c8541','05.00.00','2025-04-27 14:54:32.000000','Standardize assets to final project USD structure.','db17d0c2030049769e1ba2ea54d86114',31);
INSERT INTO `library_commit` VALUES ('edaf26aa3a8141cba15dad89dc759240','01.00.00','2025-04-29 07:02:46.000000','Created models','6ab7f53a7daf46a2ac8a83abcc89ecf9',19);
INSERT INTO `library_commit` VALUES ('ee6b077c499f4358b3975f5e8015838f','01.00.00','2025-04-29 07:02:46.000000','Created models','bcb688a70758427fbb7e23d1ed9d756e',19);
INSERT INTO `library_commit` VALUES ('eeb642f099bd494e80b14360a417f6e4','01.00.00','2025-04-29 07:02:46.000000','Created models','3d6b8007d30e4919a46deedb6dfce573',19);
INSERT INTO `library_commit` VALUES ('eed9ba72fe034f7ba56462197f2f8852','01.00.00','2025-04-29 07:02:46.000000','Created models','3eebe2a320dd4f10b98542d62deec15a',19);
INSERT INTO `library_commit` VALUES ('ef0ae0716eb64cbe8eb71251e4a6a90a','02.00.00','2025-02-04 21:21:00.000000','Added LODs','c4449799e71a4ce88999ea44a86e067b',16);
INSERT INTO `library_commit` VALUES ('f21393a2fd504424a55482e89e812ffb','01.00.00','2024-02-12 00:00:00.000000','','5bac6ed09efe4816b7c427ffb08c599d',31);
INSERT INTO `library_commit` VALUES ('f4b79e645eef40ecacd49a6db56d92e2','01.00.00','2024-02-12 00:00:00.000000','created initial mesh and LODs','b6234f0922c94798ba12257342157faa',31);
INSERT INTO `library_commit` VALUES ('f7f93acbba5b40d6962e1968fb33ef2d','01.00.00','2024-04-22 02:17:05.000000','Initial creation','f175fbe4933944a69d06e86c906622d6',17);
INSERT INTO `library_commit` VALUES ('f8979937617f49acbf7aaffdc1c14a65','01.00.00','2025-04-29 07:02:46.000000','Created models','077caad23bd4486b8fb066bf43d04761',19);
INSERT INTO `library_commit` VALUES ('f9df075641ee449399cd5fbdfa3ce8fd','03.00.00','2024-02-26 00:00:00.000000','fixed up asset standards for week 5 (to version 1.3)','2c7ef29f88474ded95eb449ebb264ead',34);
INSERT INTO `library_commit` VALUES ('fb9768650b0149d7a05d8cc593982f01','04.00.00','2024-04-08 00:00:00.000000','updated asset structure','31c39c346b394a1f90cf0a00f1c4a6ef',29);
INSERT INTO `library_commit` VALUES ('fc0f1a895bf94fa4a03a784575ec2ccb','05.00.00','2025-04-29 17:03:29.000000','Update thumbnail','6f6441599cc045ae91530ecd6cc5a81e',21);
INSERT INTO `library_commit` VALUES ('fc33efcd3fbd46d198eed2843f3d4d9a','03.00.00','2025-02-17 13:08:00.000000','Converted LODs to a variant set','f5e189a845fb4ed3930a81263a21bf99',24);
INSERT INTO `library_commit` VALUES ('fe884b51ef2649f2b8b87e0e83923fa3','05.00.00','2025-04-27 14:54:32.000000','Standardize assets to final project USD structure.','c4449799e71a4ce88999ea44a86e067b',16);
/*!40000 ALTER TABLE `library_commit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_commit_sublayers`
--

DROP TABLE IF EXISTS `library_commit_sublayers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_commit_sublayers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `commit_id` char(32) NOT NULL,
  `sublayer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `library_commit_sublayers_commit_id_sublayer_id_57f9d764_uniq` (`commit_id`,`sublayer_id`),
  KEY `library_commit_subla_sublayer_id_02949159_fk_library_s` (`sublayer_id`),
  CONSTRAINT `library_commit_subla_sublayer_id_02949159_fk_library_s` FOREIGN KEY (`sublayer_id`) REFERENCES `library_sublayer` (`id`),
  CONSTRAINT `library_commit_sublayers_commit_id_d1af5701_fk_library_commit_id` FOREIGN KEY (`commit_id`) REFERENCES `library_commit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1534 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_commit_sublayers`
--
-- ORDER BY:  `id`,`commit_id`,`sublayer_id`,`sublayer_id`

LOCK TABLES `library_commit_sublayers` WRITE;
/*!40000 ALTER TABLE `library_commit_sublayers` DISABLE KEYS */;
INSERT INTO `library_commit_sublayers` VALUES (221,'540024a960e340678bbc400097b28d3f','516bdc476552457daf5abd884b6daca7');
INSERT INTO `library_commit_sublayers` VALUES (222,'540024a960e340678bbc400097b28d3f','a7e36dcf6eb14d9f931992d257732108');
INSERT INTO `library_commit_sublayers` VALUES (223,'540024a960e340678bbc400097b28d3f','2778b9698a79438fa9655aa40dc519cc');
INSERT INTO `library_commit_sublayers` VALUES (224,'540024a960e340678bbc400097b28d3f','32fb1f96603745c78bd868709312320a');
INSERT INTO `library_commit_sublayers` VALUES (225,'540024a960e340678bbc400097b28d3f','48537b32f9824f899cbe6a5b8e2c1f5d');
INSERT INTO `library_commit_sublayers` VALUES (226,'540024a960e340678bbc400097b28d3f','2fcec4c7ec05480396b8fc88771e1e94');
INSERT INTO `library_commit_sublayers` VALUES (227,'540024a960e340678bbc400097b28d3f','f08eff053ca043fb96887f69a3ce6b05');
INSERT INTO `library_commit_sublayers` VALUES (228,'7831dae0482b42a69a1d0a70e2b24fc4','6ee93f2383b94a99853d65c9387508ba');
INSERT INTO `library_commit_sublayers` VALUES (229,'7831dae0482b42a69a1d0a70e2b24fc4','cefda1c46fb147348a12d326507e8c6c');
INSERT INTO `library_commit_sublayers` VALUES (230,'7831dae0482b42a69a1d0a70e2b24fc4','f89e4d0d1d594f3f84986799fa362bc4');
INSERT INTO `library_commit_sublayers` VALUES (231,'7831dae0482b42a69a1d0a70e2b24fc4','07740dcdcc6045b9be2bff5536051bc7');
INSERT INTO `library_commit_sublayers` VALUES (232,'7831dae0482b42a69a1d0a70e2b24fc4','18853089b8624e6cacfad5196d62e0ae');
INSERT INTO `library_commit_sublayers` VALUES (233,'7831dae0482b42a69a1d0a70e2b24fc4','1976b15fe31a495cbd52e020ded276f2');
INSERT INTO `library_commit_sublayers` VALUES (234,'7c5e07f6fcad4550a221d488db23e390','38e6b85ce5034999ab8e0382457af21a');
INSERT INTO `library_commit_sublayers` VALUES (235,'7c5e07f6fcad4550a221d488db23e390','1c82399215254ea09dd7cc704874f531');
INSERT INTO `library_commit_sublayers` VALUES (245,'a972cae8b64a446ca20f69fd50512a68','22bd359023be4ea9a1430b002e7754c2');
INSERT INTO `library_commit_sublayers` VALUES (246,'a972cae8b64a446ca20f69fd50512a68','51101d1af8c3434b928aa4cec7149d54');
INSERT INTO `library_commit_sublayers` VALUES (247,'a972cae8b64a446ca20f69fd50512a68','3d15c0a7c70b4b6aa7715eb83436210b');
INSERT INTO `library_commit_sublayers` VALUES (248,'a972cae8b64a446ca20f69fd50512a68','a62b3985d1224dc1b0e7f6f5d38415bb');
INSERT INTO `library_commit_sublayers` VALUES (249,'a972cae8b64a446ca20f69fd50512a68','a3af27b4562a40c49f449a917b6c3426');
INSERT INTO `library_commit_sublayers` VALUES (250,'a972cae8b64a446ca20f69fd50512a68','51f4a02e7d50436f87a2b37e467a2024');
INSERT INTO `library_commit_sublayers` VALUES (251,'a972cae8b64a446ca20f69fd50512a68','a7f530c25d6442c9a4ba131794e667fd');
INSERT INTO `library_commit_sublayers` VALUES (252,'a972cae8b64a446ca20f69fd50512a68','75a35af5505c43508e455438e13bf716');
INSERT INTO `library_commit_sublayers` VALUES (253,'a972cae8b64a446ca20f69fd50512a68','f6fc431c912542a889e2562652393058');
INSERT INTO `library_commit_sublayers` VALUES (263,'53e87e970024471aa5f9d59df80cd3ad','09dd651b7f924e409f97c83a5d19afda');
INSERT INTO `library_commit_sublayers` VALUES (264,'53e87e970024471aa5f9d59df80cd3ad','3e630e9bff074b48a2b462c219ffa537');
INSERT INTO `library_commit_sublayers` VALUES (265,'53e87e970024471aa5f9d59df80cd3ad','e09038341f53406fbe41dedd8e6874d8');
INSERT INTO `library_commit_sublayers` VALUES (266,'53e87e970024471aa5f9d59df80cd3ad','b8c5a47fa97c4d78ac4851664cfa681b');
INSERT INTO `library_commit_sublayers` VALUES (267,'53e87e970024471aa5f9d59df80cd3ad','ae02874c62cd49f6a654fb4ebc5d8852');
INSERT INTO `library_commit_sublayers` VALUES (268,'53e87e970024471aa5f9d59df80cd3ad','e6103071725c4141bfe640313a04268d');
INSERT INTO `library_commit_sublayers` VALUES (269,'53e87e970024471aa5f9d59df80cd3ad','2ae08945a97c47a28e703509bffde43f');
INSERT INTO `library_commit_sublayers` VALUES (270,'6a95cdd486874ff69815c584776f892f','81a0f30e1d7b4fba81d61fe5b3a01fad');
INSERT INTO `library_commit_sublayers` VALUES (271,'6a95cdd486874ff69815c584776f892f','afbb3dcc89d54ee58c77ed855b90d34c');
INSERT INTO `library_commit_sublayers` VALUES (272,'6a95cdd486874ff69815c584776f892f','709d771ae9274ccdb62fe3869861d55c');
INSERT INTO `library_commit_sublayers` VALUES (273,'6a95cdd486874ff69815c584776f892f','534b95762c4745b6afbda3a342b9ff5c');
INSERT INTO `library_commit_sublayers` VALUES (274,'6a95cdd486874ff69815c584776f892f','fe44e87b1b41426282362ee7db1f0319');
INSERT INTO `library_commit_sublayers` VALUES (275,'6a95cdd486874ff69815c584776f892f','8b5ea39ba3e34e49853aa894df0ade45');
INSERT INTO `library_commit_sublayers` VALUES (276,'082bcc45f4364815a58bc12565677a33','efa1f79f98914b9aa9cf923f5688444f');
INSERT INTO `library_commit_sublayers` VALUES (277,'082bcc45f4364815a58bc12565677a33','e875aaafec874e149484dd7a2e58ebad');
INSERT INTO `library_commit_sublayers` VALUES (287,'fb9768650b0149d7a05d8cc593982f01','495f31afbaf547dcabbf4b0620fd7709');
INSERT INTO `library_commit_sublayers` VALUES (288,'fb9768650b0149d7a05d8cc593982f01','00e8a5b23397433996c025db38a14596');
INSERT INTO `library_commit_sublayers` VALUES (289,'fb9768650b0149d7a05d8cc593982f01','b9358cbb57d74642ba4a5a6c0f25e843');
INSERT INTO `library_commit_sublayers` VALUES (290,'fb9768650b0149d7a05d8cc593982f01','6ce4f1e504054938a2f87b31abe6d6a9');
INSERT INTO `library_commit_sublayers` VALUES (291,'fb9768650b0149d7a05d8cc593982f01','20b06fbe1e2646a48fb12a59027add9f');
INSERT INTO `library_commit_sublayers` VALUES (292,'fb9768650b0149d7a05d8cc593982f01','c3eb1dc4760c4e138abb6da58312cc20');
INSERT INTO `library_commit_sublayers` VALUES (293,'fb9768650b0149d7a05d8cc593982f01','8f732933f3eb47978bddde91b1bc848e');
INSERT INTO `library_commit_sublayers` VALUES (294,'fb9768650b0149d7a05d8cc593982f01','49db2b2780ca4719b39b11716ef90dbc');
INSERT INTO `library_commit_sublayers` VALUES (295,'fb9768650b0149d7a05d8cc593982f01','a6f6880bc09a4070b5350a6e64e84d8e');
INSERT INTO `library_commit_sublayers` VALUES (305,'341cbadd5c3b4cde9da4795157532b4c','8682c633abb44f20ab5361ae5b2b03c1');
INSERT INTO `library_commit_sublayers` VALUES (306,'341cbadd5c3b4cde9da4795157532b4c','9a4ce3fe3fd74b22bfbb43ece5b1842d');
INSERT INTO `library_commit_sublayers` VALUES (307,'341cbadd5c3b4cde9da4795157532b4c','f682e6aa37ad4a30b8ec13716bcbb927');
INSERT INTO `library_commit_sublayers` VALUES (308,'341cbadd5c3b4cde9da4795157532b4c','147f265349d54887b69fa90a3b6d9092');
INSERT INTO `library_commit_sublayers` VALUES (309,'341cbadd5c3b4cde9da4795157532b4c','f55c2b5e468246ea8463c4d24e4fb528');
INSERT INTO `library_commit_sublayers` VALUES (310,'341cbadd5c3b4cde9da4795157532b4c','f288b5f24de4418ba51a0231578e08e4');
INSERT INTO `library_commit_sublayers` VALUES (311,'341cbadd5c3b4cde9da4795157532b4c','b12bdf2291174477aff8ac9ee5af58f5');
INSERT INTO `library_commit_sublayers` VALUES (312,'50cebaaabab640fe81bb36d925a3ff32','6f4c871d5e2d434e99738a64f8b3daa8');
INSERT INTO `library_commit_sublayers` VALUES (313,'50cebaaabab640fe81bb36d925a3ff32','b8732ca7b8294bc3a5729b454fd96a18');
INSERT INTO `library_commit_sublayers` VALUES (314,'50cebaaabab640fe81bb36d925a3ff32','39f918fd62f146a1b5abec8b065451f7');
INSERT INTO `library_commit_sublayers` VALUES (315,'50cebaaabab640fe81bb36d925a3ff32','9bc631313a4e48ee9a5ef582d3f18efd');
INSERT INTO `library_commit_sublayers` VALUES (316,'50cebaaabab640fe81bb36d925a3ff32','64e216bda94c4e4dad2c7bd79afb81b4');
INSERT INTO `library_commit_sublayers` VALUES (317,'50cebaaabab640fe81bb36d925a3ff32','e3f453bee0e84edc8a9fd5aba678abc2');
INSERT INTO `library_commit_sublayers` VALUES (318,'b5a01439c6984206b0c2897031285d34','b312152a58f04327ae151412301a7698');
INSERT INTO `library_commit_sublayers` VALUES (319,'b5a01439c6984206b0c2897031285d34','2788ad36be4b446f9d691186e25102b8');
INSERT INTO `library_commit_sublayers` VALUES (329,'59571c714f894bed9cb0897d9305e4b8','8759083bf3b344e88ac1e5072482985b');
INSERT INTO `library_commit_sublayers` VALUES (330,'59571c714f894bed9cb0897d9305e4b8','c383ddae633c4c47b1d08df676b4049b');
INSERT INTO `library_commit_sublayers` VALUES (331,'59571c714f894bed9cb0897d9305e4b8','d4000c61497441c6bf8c977dd0d7c121');
INSERT INTO `library_commit_sublayers` VALUES (332,'59571c714f894bed9cb0897d9305e4b8','d98eeec6bc4644c5a1bdecc990e75e2b');
INSERT INTO `library_commit_sublayers` VALUES (333,'59571c714f894bed9cb0897d9305e4b8','60226c8f10564fa99411cf6e8e55182d');
INSERT INTO `library_commit_sublayers` VALUES (334,'59571c714f894bed9cb0897d9305e4b8','99f361b53fa64d649d6664310cdecfa9');
INSERT INTO `library_commit_sublayers` VALUES (335,'59571c714f894bed9cb0897d9305e4b8','75fca4590d5f4d9d9c93f24fb8f8f6d0');
INSERT INTO `library_commit_sublayers` VALUES (336,'59571c714f894bed9cb0897d9305e4b8','a92269f1a7a84dc28fd5293e946ac0dc');
INSERT INTO `library_commit_sublayers` VALUES (337,'59571c714f894bed9cb0897d9305e4b8','7006246dafdd4d2faeb9a6065e56c2e5');
INSERT INTO `library_commit_sublayers` VALUES (347,'7c65c53193494d16b3c18e83046be704','5299ec675647431181b24fd4d490b300');
INSERT INTO `library_commit_sublayers` VALUES (348,'7c65c53193494d16b3c18e83046be704','612831e6397f46ed99c20390ebe6dbbd');
INSERT INTO `library_commit_sublayers` VALUES (349,'7c65c53193494d16b3c18e83046be704','196d0687229b414eb9e61aea2ee1b189');
INSERT INTO `library_commit_sublayers` VALUES (350,'7c65c53193494d16b3c18e83046be704','c1f0257d79af48529a1720516a5e03a7');
INSERT INTO `library_commit_sublayers` VALUES (351,'7c65c53193494d16b3c18e83046be704','3c841015c8f9440889bee2410f9d6cbb');
INSERT INTO `library_commit_sublayers` VALUES (352,'7c65c53193494d16b3c18e83046be704','7f1cc6683c054558a5e49a44738e87cc');
INSERT INTO `library_commit_sublayers` VALUES (353,'7c65c53193494d16b3c18e83046be704','d85ea5535dc74f54a00b97099eab0d59');
INSERT INTO `library_commit_sublayers` VALUES (354,'7c65c53193494d16b3c18e83046be704','5da457f5ccdd4dbe92c9438a8513c5ad');
INSERT INTO `library_commit_sublayers` VALUES (355,'7c65c53193494d16b3c18e83046be704','b7dfb8cd9c0d428e8abaab0b7fdd7c59');
INSERT INTO `library_commit_sublayers` VALUES (365,'d3caf093a9a8400d83b804fa2690a943','13fe0fa39d9148dfb77ec3f567be425f');
INSERT INTO `library_commit_sublayers` VALUES (366,'d3caf093a9a8400d83b804fa2690a943','1b9c03f33aff4ee68c5fa5c73295d0cb');
INSERT INTO `library_commit_sublayers` VALUES (367,'d3caf093a9a8400d83b804fa2690a943','65b3d2f973b84607bf23e3343429a4b3');
INSERT INTO `library_commit_sublayers` VALUES (368,'d3caf093a9a8400d83b804fa2690a943','3f205c90629c41f19778f9fce546f1cf');
INSERT INTO `library_commit_sublayers` VALUES (369,'d3caf093a9a8400d83b804fa2690a943','0638d4a878f643bea79d393ebcdd8a56');
INSERT INTO `library_commit_sublayers` VALUES (370,'d3caf093a9a8400d83b804fa2690a943','27f1394e75e14c898677641cda85503c');
INSERT INTO `library_commit_sublayers` VALUES (371,'d3caf093a9a8400d83b804fa2690a943','de9360ed2d004c1a88159ac618b092a7');
INSERT INTO `library_commit_sublayers` VALUES (372,'9438cca5aaa14472a653f34fd65ef7ef','99b2844abae140c5b585f0ea745b01f3');
INSERT INTO `library_commit_sublayers` VALUES (373,'9438cca5aaa14472a653f34fd65ef7ef','59103345dbb042f19c22f97da9eaaa69');
INSERT INTO `library_commit_sublayers` VALUES (374,'9438cca5aaa14472a653f34fd65ef7ef','bbd54b73a16340f8b546a7dae2adfd3a');
INSERT INTO `library_commit_sublayers` VALUES (375,'9438cca5aaa14472a653f34fd65ef7ef','1c51bc2952dd454aa7acf713e17f3df6');
INSERT INTO `library_commit_sublayers` VALUES (376,'9438cca5aaa14472a653f34fd65ef7ef','a3b5ec74d25f4efbb6e27e27ea045dec');
INSERT INTO `library_commit_sublayers` VALUES (377,'9438cca5aaa14472a653f34fd65ef7ef','810d7114013a45feb7c31bd065202ffe');
INSERT INTO `library_commit_sublayers` VALUES (378,'b48040f447fe41b6adc06c86635ed3fe','fa7c142f4c3c4a3c97c407202eb0bbc9');
INSERT INTO `library_commit_sublayers` VALUES (379,'b48040f447fe41b6adc06c86635ed3fe','33d1336a8487400f9b970df309effd06');
INSERT INTO `library_commit_sublayers` VALUES (389,'94412349ce034ae6a57bccaf02cb4cbc','3cc8c2efa3254543bb9683b90f7635b3');
INSERT INTO `library_commit_sublayers` VALUES (390,'94412349ce034ae6a57bccaf02cb4cbc','fdcefd4625a94361b10c0726c9d68059');
INSERT INTO `library_commit_sublayers` VALUES (391,'94412349ce034ae6a57bccaf02cb4cbc','3031485bd2e546738de71e36a3034264');
INSERT INTO `library_commit_sublayers` VALUES (392,'94412349ce034ae6a57bccaf02cb4cbc','37cd37d101954b78b479980da1300e1b');
INSERT INTO `library_commit_sublayers` VALUES (393,'94412349ce034ae6a57bccaf02cb4cbc','5602ecc3eaf64cb2962435586d84e6e9');
INSERT INTO `library_commit_sublayers` VALUES (394,'94412349ce034ae6a57bccaf02cb4cbc','8b54f4825ac941fe92e732317a54ffbd');
INSERT INTO `library_commit_sublayers` VALUES (395,'94412349ce034ae6a57bccaf02cb4cbc','8ed167ad89b14a4d889cc2c82b601547');
INSERT INTO `library_commit_sublayers` VALUES (396,'cb8888970a0a4eac9f59e0b929081b0d','27e3185dd7ac408c8c6840adeaf0d095');
INSERT INTO `library_commit_sublayers` VALUES (397,'cb8888970a0a4eac9f59e0b929081b0d','29b55b989a81410395c8c7ef79b9ee3d');
INSERT INTO `library_commit_sublayers` VALUES (398,'cb8888970a0a4eac9f59e0b929081b0d','4b6794d5be6a45c982b797302bb50e1c');
INSERT INTO `library_commit_sublayers` VALUES (399,'cb8888970a0a4eac9f59e0b929081b0d','c4ce276e6be54db2bd66e02d155e8f65');
INSERT INTO `library_commit_sublayers` VALUES (400,'cb8888970a0a4eac9f59e0b929081b0d','8564f26d5ef54ff9a8818b88cfa35bac');
INSERT INTO `library_commit_sublayers` VALUES (401,'cb8888970a0a4eac9f59e0b929081b0d','d74cd4a159be40199647177ff19366fb');
INSERT INTO `library_commit_sublayers` VALUES (402,'314883862b0f4134bf3518d58c6eccf8','403056f991b7432585eade02945d479c');
INSERT INTO `library_commit_sublayers` VALUES (403,'314883862b0f4134bf3518d58c6eccf8','543316c6499c49f4b86a6e1141a9fbb3');
INSERT INTO `library_commit_sublayers` VALUES (413,'417e84b4ea95486cb7c332c505fda838','c31fda68b3714547b50ebdece410f516');
INSERT INTO `library_commit_sublayers` VALUES (414,'417e84b4ea95486cb7c332c505fda838','4474d3ba0b2e49c7a59fd757c1a82f1d');
INSERT INTO `library_commit_sublayers` VALUES (415,'417e84b4ea95486cb7c332c505fda838','abb67c1a44b14b3b9be6bfb715a9d009');
INSERT INTO `library_commit_sublayers` VALUES (416,'417e84b4ea95486cb7c332c505fda838','47d182d5c42446668b7a57f7c7d1532a');
INSERT INTO `library_commit_sublayers` VALUES (417,'417e84b4ea95486cb7c332c505fda838','75ca0da1c74b49efab40cf7b3d586cd8');
INSERT INTO `library_commit_sublayers` VALUES (418,'417e84b4ea95486cb7c332c505fda838','ad911d80843946ba8707120412889c74');
INSERT INTO `library_commit_sublayers` VALUES (419,'417e84b4ea95486cb7c332c505fda838','0cd6e274afd54daaae98dda4a24d045b');
INSERT INTO `library_commit_sublayers` VALUES (420,'417e84b4ea95486cb7c332c505fda838','8b14d904f6874753a2cb6cfae3a7c076');
INSERT INTO `library_commit_sublayers` VALUES (421,'417e84b4ea95486cb7c332c505fda838','1edd3b9caf294d0985d217808af802c6');
INSERT INTO `library_commit_sublayers` VALUES (431,'630802fb36a24f8194e58c83631b74ed','87ddf876384b4c74ab1aca32bc8a657e');
INSERT INTO `library_commit_sublayers` VALUES (432,'630802fb36a24f8194e58c83631b74ed','1e4a31e3763d4d4eb8f0f9b1cdc6f4ce');
INSERT INTO `library_commit_sublayers` VALUES (433,'630802fb36a24f8194e58c83631b74ed','3bded8793d9b41d1b3ea004dd9848e30');
INSERT INTO `library_commit_sublayers` VALUES (434,'630802fb36a24f8194e58c83631b74ed','b978b8fdc7a34ba6ab2f2df17ade014c');
INSERT INTO `library_commit_sublayers` VALUES (435,'630802fb36a24f8194e58c83631b74ed','044c7bf3b2d24e5a96d72658e8a1451b');
INSERT INTO `library_commit_sublayers` VALUES (436,'630802fb36a24f8194e58c83631b74ed','18d99b4b317f4dd7ac683732d822140d');
INSERT INTO `library_commit_sublayers` VALUES (437,'630802fb36a24f8194e58c83631b74ed','d04f21d0bd12441cb6b301301169823c');
INSERT INTO `library_commit_sublayers` VALUES (438,'630802fb36a24f8194e58c83631b74ed','d5231acd907b455fbe8964c714d07005');
INSERT INTO `library_commit_sublayers` VALUES (439,'630802fb36a24f8194e58c83631b74ed','44264b1451d846b4aa9491aba509b145');
INSERT INTO `library_commit_sublayers` VALUES (449,'200d0851a1e341ff98f608b3b6f5c964','c6b52d0ad6d34f9cb79de17704474f69');
INSERT INTO `library_commit_sublayers` VALUES (450,'200d0851a1e341ff98f608b3b6f5c964','6d19d7789aed4ce888d9c6e799d7f3eb');
INSERT INTO `library_commit_sublayers` VALUES (451,'200d0851a1e341ff98f608b3b6f5c964','a7b1966e7a5e4bc9bcc69897e7526156');
INSERT INTO `library_commit_sublayers` VALUES (452,'200d0851a1e341ff98f608b3b6f5c964','7b9d93d0ff3b49c1b247ce2f192648c2');
INSERT INTO `library_commit_sublayers` VALUES (453,'200d0851a1e341ff98f608b3b6f5c964','6b9f2399eac94d038ff87ae68cdd097e');
INSERT INTO `library_commit_sublayers` VALUES (454,'200d0851a1e341ff98f608b3b6f5c964','c2b5cfd2f7ce483a81778e9a751da5f3');
INSERT INTO `library_commit_sublayers` VALUES (455,'200d0851a1e341ff98f608b3b6f5c964','6024d7153bfb4145985d27ba0e425959');
INSERT INTO `library_commit_sublayers` VALUES (456,'2fe069c0521e49f8b49a7e81c53e819d','40bca4232e294ddfb10800ab91a6a934');
INSERT INTO `library_commit_sublayers` VALUES (457,'2fe069c0521e49f8b49a7e81c53e819d','8111364485c6419ea730a211f63aa372');
INSERT INTO `library_commit_sublayers` VALUES (458,'2fe069c0521e49f8b49a7e81c53e819d','e0758d051bad453286bb0e8631b2ef05');
INSERT INTO `library_commit_sublayers` VALUES (459,'2fe069c0521e49f8b49a7e81c53e819d','a1c1f24a781343bf8832a3c66efd7a6d');
INSERT INTO `library_commit_sublayers` VALUES (460,'2fe069c0521e49f8b49a7e81c53e819d','a250ba3527054f21952d6e1fb842899c');
INSERT INTO `library_commit_sublayers` VALUES (461,'2fe069c0521e49f8b49a7e81c53e819d','5579d8d7d9b041b0a2fcd55e3c437a83');
INSERT INTO `library_commit_sublayers` VALUES (462,'a5af7751dfb646dc9c2602c30580905f','a8872dd8e4ea476eb2c626dcf19b166f');
INSERT INTO `library_commit_sublayers` VALUES (463,'a5af7751dfb646dc9c2602c30580905f','31949ff56cd84ed08bc36fda80fa6c07');
INSERT INTO `library_commit_sublayers` VALUES (473,'0c5066e5a6a74b9cbc9c9b3900f0318d','68c0bfa7259c42cb835aeef2873d0584');
INSERT INTO `library_commit_sublayers` VALUES (474,'0c5066e5a6a74b9cbc9c9b3900f0318d','ff21cfde082f43758f1efe816b5e6020');
INSERT INTO `library_commit_sublayers` VALUES (475,'0c5066e5a6a74b9cbc9c9b3900f0318d','a2c21a1ccc76405d8dc29c8696c941b7');
INSERT INTO `library_commit_sublayers` VALUES (476,'0c5066e5a6a74b9cbc9c9b3900f0318d','a8e39336e66d4a4bba2905a1fd1205b1');
INSERT INTO `library_commit_sublayers` VALUES (477,'0c5066e5a6a74b9cbc9c9b3900f0318d','96fb386c5696425496f3ceb03f99d1f0');
INSERT INTO `library_commit_sublayers` VALUES (478,'0c5066e5a6a74b9cbc9c9b3900f0318d','5f6ba0decd1648d786e2c0f3412a9147');
INSERT INTO `library_commit_sublayers` VALUES (479,'0c5066e5a6a74b9cbc9c9b3900f0318d','e5cc85133b7b49f397bef5e7d8e6f588');
INSERT INTO `library_commit_sublayers` VALUES (493,'98c25c753c994c2dabf62ffcf6854893','d1baaa7ef4d3495087fec9bc4acff40c');
INSERT INTO `library_commit_sublayers` VALUES (494,'98c25c753c994c2dabf62ffcf6854893','e7b518d92dfb491c9f0dc2505f02a768');
INSERT INTO `library_commit_sublayers` VALUES (495,'98c25c753c994c2dabf62ffcf6854893','cbf7b4ad47914ec18725b5f537bcdd8b');
INSERT INTO `library_commit_sublayers` VALUES (496,'98c25c753c994c2dabf62ffcf6854893','520edcf527a6414bb6ece38cfd10bcbd');
INSERT INTO `library_commit_sublayers` VALUES (497,'98c25c753c994c2dabf62ffcf6854893','2368663c60cb42a49df27ff49c527a64');
INSERT INTO `library_commit_sublayers` VALUES (498,'98c25c753c994c2dabf62ffcf6854893','0a677efd0e794db5b52cc06c22e1b6e3');
INSERT INTO `library_commit_sublayers` VALUES (499,'98c25c753c994c2dabf62ffcf6854893','ee8c2c296c9d4bd7b37632509b0922ba');
INSERT INTO `library_commit_sublayers` VALUES (500,'582095eb65d6427eab78e83312c6193d','217259ccc5e243efb5b79a67ea5c7c20');
INSERT INTO `library_commit_sublayers` VALUES (501,'582095eb65d6427eab78e83312c6193d','d95d9bcfe51346cd8d74fc653e4bc045');
INSERT INTO `library_commit_sublayers` VALUES (502,'582095eb65d6427eab78e83312c6193d','88ce57c27a8a402c91ca1ff7bbfb5907');
INSERT INTO `library_commit_sublayers` VALUES (503,'582095eb65d6427eab78e83312c6193d','35794d2463544822ad091498b3a37db0');
INSERT INTO `library_commit_sublayers` VALUES (504,'582095eb65d6427eab78e83312c6193d','02b79267f9f8416f97ed1c4b7ae3eff6');
INSERT INTO `library_commit_sublayers` VALUES (505,'582095eb65d6427eab78e83312c6193d','0aa6e5e500364eb3ab46a7883b64f47e');
INSERT INTO `library_commit_sublayers` VALUES (506,'73d77d8066b048fdaa5cb53f8299add0','9aef1b1557164a6399c813c88ff311f7');
INSERT INTO `library_commit_sublayers` VALUES (507,'73d77d8066b048fdaa5cb53f8299add0','8c29b09dc94f4f319766f2dadc38905f');
INSERT INTO `library_commit_sublayers` VALUES (517,'01ae6f63a86c45c194975b6f7c862c5b','40b59a8213fa4a98a4665f0aa324ef35');
INSERT INTO `library_commit_sublayers` VALUES (518,'01ae6f63a86c45c194975b6f7c862c5b','9fab9d40bca3497184b96660b84a9e5b');
INSERT INTO `library_commit_sublayers` VALUES (519,'01ae6f63a86c45c194975b6f7c862c5b','9b03dfdd1120450391bdda6166c526ce');
INSERT INTO `library_commit_sublayers` VALUES (520,'01ae6f63a86c45c194975b6f7c862c5b','b243827be81243e18ac90c07dfc06fdc');
INSERT INTO `library_commit_sublayers` VALUES (521,'01ae6f63a86c45c194975b6f7c862c5b','972f53e4f0f1482ab656694a4596acde');
INSERT INTO `library_commit_sublayers` VALUES (522,'01ae6f63a86c45c194975b6f7c862c5b','b94f49c7574341619dd5e1ba2adbab7f');
INSERT INTO `library_commit_sublayers` VALUES (523,'01ae6f63a86c45c194975b6f7c862c5b','3ef6d71844a24f91b7454ea86c5afd3e');
INSERT INTO `library_commit_sublayers` VALUES (524,'cfe66c6547fc4a93842ec2d974a7036d','af16c9d8a6064779ab15f111e931ba13');
INSERT INTO `library_commit_sublayers` VALUES (525,'cfe66c6547fc4a93842ec2d974a7036d','7d2c77e43b1549a8bc2b554e3086334b');
INSERT INTO `library_commit_sublayers` VALUES (526,'cfe66c6547fc4a93842ec2d974a7036d','30558e5225934c13b8fab756cd1e0bf3');
INSERT INTO `library_commit_sublayers` VALUES (527,'cfe66c6547fc4a93842ec2d974a7036d','1ec748590a1c40b8a88f8b3f4c90f1c9');
INSERT INTO `library_commit_sublayers` VALUES (528,'cfe66c6547fc4a93842ec2d974a7036d','bbd02d15b3044249a278cbe3bccc29bd');
INSERT INTO `library_commit_sublayers` VALUES (529,'cfe66c6547fc4a93842ec2d974a7036d','1035ad53a5ec4539b154c3f46a67902b');
INSERT INTO `library_commit_sublayers` VALUES (539,'5fd4844cd9604823ac0d1ac5fa61ff9a','04a9b863a2a9415a81f9af8496a1dd0f');
INSERT INTO `library_commit_sublayers` VALUES (540,'5fd4844cd9604823ac0d1ac5fa61ff9a','42f0f3b661464e45a77dfca83910d570');
INSERT INTO `library_commit_sublayers` VALUES (541,'5fd4844cd9604823ac0d1ac5fa61ff9a','34b9f8ebebeb447fac5fe1ac6f58c185');
INSERT INTO `library_commit_sublayers` VALUES (542,'5fd4844cd9604823ac0d1ac5fa61ff9a','1918ef6e12d1425ca0ee245f240f92a5');
INSERT INTO `library_commit_sublayers` VALUES (543,'5fd4844cd9604823ac0d1ac5fa61ff9a','8e3d8134253846a2963d2a537f2366da');
INSERT INTO `library_commit_sublayers` VALUES (544,'5fd4844cd9604823ac0d1ac5fa61ff9a','e615adae1f8e4273a2ab9516896269a1');
INSERT INTO `library_commit_sublayers` VALUES (545,'5fd4844cd9604823ac0d1ac5fa61ff9a','7ec888888f4c451885a15e33a9e0d9f6');
INSERT INTO `library_commit_sublayers` VALUES (546,'5fd4844cd9604823ac0d1ac5fa61ff9a','41287c8a04ef488495b4b9be243ac4e8');
INSERT INTO `library_commit_sublayers` VALUES (547,'5fd4844cd9604823ac0d1ac5fa61ff9a','8fc151b6e9f84884b67d5bf7ed067c74');
INSERT INTO `library_commit_sublayers` VALUES (557,'a6828e73d2294bca80df36bec85b5ef6','37bb7cbace6a4d6dbcdda75600557ba5');
INSERT INTO `library_commit_sublayers` VALUES (558,'a6828e73d2294bca80df36bec85b5ef6','1d724c39e4704147b8576a5c7f5bdfc2');
INSERT INTO `library_commit_sublayers` VALUES (559,'a6828e73d2294bca80df36bec85b5ef6','32c37c9962c44814a7041566293e0558');
INSERT INTO `library_commit_sublayers` VALUES (560,'a6828e73d2294bca80df36bec85b5ef6','22c57368c3b54d89a64b5f47e07161d6');
INSERT INTO `library_commit_sublayers` VALUES (561,'a6828e73d2294bca80df36bec85b5ef6','7aded2453d7a4d9db35a04deb9baec85');
INSERT INTO `library_commit_sublayers` VALUES (562,'a6828e73d2294bca80df36bec85b5ef6','68ac7428b1c145a0a924ec2417c61f75');
INSERT INTO `library_commit_sublayers` VALUES (563,'a6828e73d2294bca80df36bec85b5ef6','199ff1d5f0164f2682e2acb5fff17c1d');
INSERT INTO `library_commit_sublayers` VALUES (564,'a6828e73d2294bca80df36bec85b5ef6','c88497f23d87470e9b1d3ae3535afdb2');
INSERT INTO `library_commit_sublayers` VALUES (565,'a6828e73d2294bca80df36bec85b5ef6','3225012ff11f49b9815161768efc01a5');
INSERT INTO `library_commit_sublayers` VALUES (575,'d4c53fb62da540a59d8284085da38014','045ee427989c42188fc0ca18c82bab60');
INSERT INTO `library_commit_sublayers` VALUES (576,'d4c53fb62da540a59d8284085da38014','3d6ec5a1de5344f393e4320d5c2890a2');
INSERT INTO `library_commit_sublayers` VALUES (577,'d4c53fb62da540a59d8284085da38014','d5ac6ad0be424ab687d42dd654933a07');
INSERT INTO `library_commit_sublayers` VALUES (578,'d4c53fb62da540a59d8284085da38014','908fc4a9475e49198e82eee6470efb68');
INSERT INTO `library_commit_sublayers` VALUES (579,'d4c53fb62da540a59d8284085da38014','4aa0b8a1ce11407c89aecd7f394cc945');
INSERT INTO `library_commit_sublayers` VALUES (580,'d4c53fb62da540a59d8284085da38014','7d24f6a7290442d399b0782928fb25e1');
INSERT INTO `library_commit_sublayers` VALUES (581,'d4c53fb62da540a59d8284085da38014','6eb2c08bed4c412cb28225e7eae316bd');
INSERT INTO `library_commit_sublayers` VALUES (582,'59c4ddbbf461431e997d5cd9d1b25956','2798bd6b65834b00a1bebfdcc98288d2');
INSERT INTO `library_commit_sublayers` VALUES (583,'59c4ddbbf461431e997d5cd9d1b25956','8365539bf6f5449b92c3e4f8afa39366');
INSERT INTO `library_commit_sublayers` VALUES (584,'59c4ddbbf461431e997d5cd9d1b25956','3e272770efae460393c3b588d8fc4666');
INSERT INTO `library_commit_sublayers` VALUES (585,'59c4ddbbf461431e997d5cd9d1b25956','a573d19a3dba4c659081e42debf2817f');
INSERT INTO `library_commit_sublayers` VALUES (586,'59c4ddbbf461431e997d5cd9d1b25956','f00554b692884d969c5350100c950009');
INSERT INTO `library_commit_sublayers` VALUES (587,'59c4ddbbf461431e997d5cd9d1b25956','cbddd40d113f445fb156d4bc2b0cd84c');
INSERT INTO `library_commit_sublayers` VALUES (588,'0f6600dea1a64039b21aa8f6d45abcb0','347e8495f19344ff9c5e5d835bc9ba2e');
INSERT INTO `library_commit_sublayers` VALUES (589,'0f6600dea1a64039b21aa8f6d45abcb0','ea78421d7b294325a2a40c75695b06ca');
INSERT INTO `library_commit_sublayers` VALUES (599,'83adfd4a64da4bb6be2754ef9d8487bf','f459c5f83b154a51907e26ed4a1141d8');
INSERT INTO `library_commit_sublayers` VALUES (600,'83adfd4a64da4bb6be2754ef9d8487bf','1fa61f7c5e8348c3aea7eba11b84f287');
INSERT INTO `library_commit_sublayers` VALUES (601,'83adfd4a64da4bb6be2754ef9d8487bf','9e009bbc7f8841c89a28b63d12e0b9a2');
INSERT INTO `library_commit_sublayers` VALUES (602,'83adfd4a64da4bb6be2754ef9d8487bf','a477f64dd9cf462facad64627d1b44e9');
INSERT INTO `library_commit_sublayers` VALUES (603,'83adfd4a64da4bb6be2754ef9d8487bf','814cb1717e29440bbbb53e09db836074');
INSERT INTO `library_commit_sublayers` VALUES (604,'83adfd4a64da4bb6be2754ef9d8487bf','8d18e310648549f28c156e958e95bb7c');
INSERT INTO `library_commit_sublayers` VALUES (605,'83adfd4a64da4bb6be2754ef9d8487bf','bada50695b4a4cfaaff6b647eec26e93');
INSERT INTO `library_commit_sublayers` VALUES (606,'c49d0149a34343ce921bedd142316fa1','15278124bcfa430e95a4bb7fc35d59e8');
INSERT INTO `library_commit_sublayers` VALUES (607,'c49d0149a34343ce921bedd142316fa1','af5c7dbaa46d479cacd60d222e0e14f0');
INSERT INTO `library_commit_sublayers` VALUES (608,'c49d0149a34343ce921bedd142316fa1','15db36ab63a74d94841877fae2dc537d');
INSERT INTO `library_commit_sublayers` VALUES (609,'c49d0149a34343ce921bedd142316fa1','50697d31c3b94afaaacd0ffc7f22506a');
INSERT INTO `library_commit_sublayers` VALUES (610,'c49d0149a34343ce921bedd142316fa1','fbc3ffec12884eb9803960c37842f2c9');
INSERT INTO `library_commit_sublayers` VALUES (611,'c49d0149a34343ce921bedd142316fa1','2da82147ec47426f99c7e2c7273a1651');
INSERT INTO `library_commit_sublayers` VALUES (612,'ef0ae0716eb64cbe8eb71251e4a6a90a','63c624388f3e4e218aa0aeaf5cf70aab');
INSERT INTO `library_commit_sublayers` VALUES (613,'ef0ae0716eb64cbe8eb71251e4a6a90a','5a062ea7eafb4fe4a7c60e03443e17f8');
INSERT INTO `library_commit_sublayers` VALUES (623,'5e7a162ff3324b7da8b1b01b65b36bec','d4f983f4c1544d8cacf867719cd16589');
INSERT INTO `library_commit_sublayers` VALUES (624,'5e7a162ff3324b7da8b1b01b65b36bec','d6759ae40b554ebebdba68b2665b9419');
INSERT INTO `library_commit_sublayers` VALUES (625,'5e7a162ff3324b7da8b1b01b65b36bec','9bc1704cf5c24e0097adc9bd1ca98019');
INSERT INTO `library_commit_sublayers` VALUES (626,'5e7a162ff3324b7da8b1b01b65b36bec','ff51fd7c19a34f42a8786dfd9af5bc4f');
INSERT INTO `library_commit_sublayers` VALUES (627,'5e7a162ff3324b7da8b1b01b65b36bec','b833bcc8ef1b42d39f55e254ab993cbd');
INSERT INTO `library_commit_sublayers` VALUES (628,'5e7a162ff3324b7da8b1b01b65b36bec','5773876e9c2745f5990750514f451e4b');
INSERT INTO `library_commit_sublayers` VALUES (629,'5e7a162ff3324b7da8b1b01b65b36bec','eaa5f6fa94fe4eadbaa173a8615314c5');
INSERT INTO `library_commit_sublayers` VALUES (630,'5e7a162ff3324b7da8b1b01b65b36bec','3ec5b83c4d0e47edbc06c5a94e0e9031');
INSERT INTO `library_commit_sublayers` VALUES (631,'5e7a162ff3324b7da8b1b01b65b36bec','f49d2e43251441b3b6276972d8504425');
INSERT INTO `library_commit_sublayers` VALUES (641,'c2c0ceed288e40eb980113aabe074af1','e74d5ffb4ae849508b759b5c19f71303');
INSERT INTO `library_commit_sublayers` VALUES (642,'c2c0ceed288e40eb980113aabe074af1','296cf870285c4d2c828ee139741cb7ba');
INSERT INTO `library_commit_sublayers` VALUES (643,'c2c0ceed288e40eb980113aabe074af1','1cdfedc78bb84ecda24f29eab7d5b23b');
INSERT INTO `library_commit_sublayers` VALUES (644,'c2c0ceed288e40eb980113aabe074af1','a3e4c3599a454b4192f00511f1f7e943');
INSERT INTO `library_commit_sublayers` VALUES (645,'c2c0ceed288e40eb980113aabe074af1','ca855549957f4c6e9a1c7dc3921844ee');
INSERT INTO `library_commit_sublayers` VALUES (646,'c2c0ceed288e40eb980113aabe074af1','4fff2eff72184cb39cb83550eb38d1a8');
INSERT INTO `library_commit_sublayers` VALUES (647,'c2c0ceed288e40eb980113aabe074af1','13ea4842bc334abf95ade297a8db0d3b');
INSERT INTO `library_commit_sublayers` VALUES (648,'a23502cb6fbe41eda402306bfcadde39','51d304a88a954cbeac4ec3cbdd13867c');
INSERT INTO `library_commit_sublayers` VALUES (649,'a23502cb6fbe41eda402306bfcadde39','b9c0119c51724d54905e84a37fe4ee17');
INSERT INTO `library_commit_sublayers` VALUES (650,'a23502cb6fbe41eda402306bfcadde39','f5876d2148b343abb7debb064f8a2331');
INSERT INTO `library_commit_sublayers` VALUES (651,'a23502cb6fbe41eda402306bfcadde39','991541c758e4436faf2c2944e58131d2');
INSERT INTO `library_commit_sublayers` VALUES (652,'a23502cb6fbe41eda402306bfcadde39','b232c428c4fc476fa1b5e50334751f32');
INSERT INTO `library_commit_sublayers` VALUES (653,'a23502cb6fbe41eda402306bfcadde39','e2649814552c47b280d1ff0d03b06c93');
INSERT INTO `library_commit_sublayers` VALUES (654,'3b45de18fe874e6eabe5cbe65471e5b9','fa18326764e946fea777e4a2a67bc549');
INSERT INTO `library_commit_sublayers` VALUES (655,'3b45de18fe874e6eabe5cbe65471e5b9','79d05ef40e53422aafb23322a00fc804');
INSERT INTO `library_commit_sublayers` VALUES (665,'e0399415f1214f3cbe28bae4deeeb20d','7018fb48f73d475c8888428b49f491f9');
INSERT INTO `library_commit_sublayers` VALUES (666,'e0399415f1214f3cbe28bae4deeeb20d','403600074ec44109a1c7e5a970cae71f');
INSERT INTO `library_commit_sublayers` VALUES (667,'e0399415f1214f3cbe28bae4deeeb20d','e624dbe3f7b341b7baca810208f182b8');
INSERT INTO `library_commit_sublayers` VALUES (668,'e0399415f1214f3cbe28bae4deeeb20d','7cd0f2815a714b9bb3b11b4c55c0f15a');
INSERT INTO `library_commit_sublayers` VALUES (669,'e0399415f1214f3cbe28bae4deeeb20d','ed5e2fa3588f403d8dbca6a533c0bf32');
INSERT INTO `library_commit_sublayers` VALUES (670,'e0399415f1214f3cbe28bae4deeeb20d','609e880223224f75ac53513b87339956');
INSERT INTO `library_commit_sublayers` VALUES (671,'e0399415f1214f3cbe28bae4deeeb20d','49ca7779bebd4feb8f0e270f7d11964e');
INSERT INTO `library_commit_sublayers` VALUES (672,'c2f5bd419843464787b73a296ae12a59','87745686fbad47cb848372c1466a4123');
INSERT INTO `library_commit_sublayers` VALUES (673,'c2f5bd419843464787b73a296ae12a59','6ff9aacc648645aca3a61d02714821e2');
INSERT INTO `library_commit_sublayers` VALUES (674,'c2f5bd419843464787b73a296ae12a59','76cd88acaf9f45e783c9a87a94b4c34f');
INSERT INTO `library_commit_sublayers` VALUES (675,'c2f5bd419843464787b73a296ae12a59','71787486ea5248b49e090e43e427afa8');
INSERT INTO `library_commit_sublayers` VALUES (676,'c2f5bd419843464787b73a296ae12a59','b512fd1f0469499c9bc54423568c443f');
INSERT INTO `library_commit_sublayers` VALUES (677,'c2f5bd419843464787b73a296ae12a59','1c3c3f96ccae4899b0497ee761449d86');
INSERT INTO `library_commit_sublayers` VALUES (678,'f7f93acbba5b40d6962e1968fb33ef2d','b25f413f6fb84884898af8fb020003e9');
INSERT INTO `library_commit_sublayers` VALUES (679,'f7f93acbba5b40d6962e1968fb33ef2d','fc5ea5c410c047f7a0f17089363b4bc3');
INSERT INTO `library_commit_sublayers` VALUES (689,'fc33efcd3fbd46d198eed2843f3d4d9a','f3b20911dd514171aa913296b90726c3');
INSERT INTO `library_commit_sublayers` VALUES (690,'fc33efcd3fbd46d198eed2843f3d4d9a','fc8626e426164d9281a6b7d16c323edd');
INSERT INTO `library_commit_sublayers` VALUES (691,'fc33efcd3fbd46d198eed2843f3d4d9a','552caa25d2da47a096be276f7549c657');
INSERT INTO `library_commit_sublayers` VALUES (692,'fc33efcd3fbd46d198eed2843f3d4d9a','b8261efbcd8844cfb09c6102a5047967');
INSERT INTO `library_commit_sublayers` VALUES (693,'fc33efcd3fbd46d198eed2843f3d4d9a','f9de3c3082e242c68625359970f85686');
INSERT INTO `library_commit_sublayers` VALUES (694,'fc33efcd3fbd46d198eed2843f3d4d9a','535807adea9f48c9afb9e53af65a7d1b');
INSERT INTO `library_commit_sublayers` VALUES (695,'fc33efcd3fbd46d198eed2843f3d4d9a','3872d75166b44c8aa5aa655e82272b5c');
INSERT INTO `library_commit_sublayers` VALUES (696,'39bd8cd533fd4770b1396fcbc2740c23','da66dbc1cd8e4ac0b85fd2a96b487645');
INSERT INTO `library_commit_sublayers` VALUES (697,'39bd8cd533fd4770b1396fcbc2740c23','abfbe12036544555b5afe7479480f316');
INSERT INTO `library_commit_sublayers` VALUES (698,'39bd8cd533fd4770b1396fcbc2740c23','405e468c09cb4d22bf51b236430080cc');
INSERT INTO `library_commit_sublayers` VALUES (699,'39bd8cd533fd4770b1396fcbc2740c23','8118bb0a4d454b29ba10ad309ce039c6');
INSERT INTO `library_commit_sublayers` VALUES (700,'39bd8cd533fd4770b1396fcbc2740c23','70b415ac62d54711bdeff7f65a6de7af');
INSERT INTO `library_commit_sublayers` VALUES (701,'39bd8cd533fd4770b1396fcbc2740c23','82c107b0a928432d986841c4163543cf');
INSERT INTO `library_commit_sublayers` VALUES (702,'df59caf90ed04c79961930eaa2bf113a','f4972b1dfbc049bb9fcb8180e0ee92b2');
INSERT INTO `library_commit_sublayers` VALUES (703,'df59caf90ed04c79961930eaa2bf113a','64e992a624a04aa0846a4ee7b26e87a8');
INSERT INTO `library_commit_sublayers` VALUES (704,'10a5599fb94d45559d1c6090a85fc04c','e63a4765ed6f4e0a936172d17101dd7e');
INSERT INTO `library_commit_sublayers` VALUES (705,'10a5599fb94d45559d1c6090a85fc04c','ec9c6a0594304635a028980dd6eb9745');
INSERT INTO `library_commit_sublayers` VALUES (706,'10a5599fb94d45559d1c6090a85fc04c','2ee3c49cb8724e6a8f49f7ce92855dcd');
INSERT INTO `library_commit_sublayers` VALUES (707,'10a5599fb94d45559d1c6090a85fc04c','d3079ac13dd349c59ffec6dc88ad3075');
INSERT INTO `library_commit_sublayers` VALUES (708,'10a5599fb94d45559d1c6090a85fc04c','1e300aef29244c009f4a7a420d39cbed');
INSERT INTO `library_commit_sublayers` VALUES (709,'10a5599fb94d45559d1c6090a85fc04c','f2b18a7e57ce4302b513e0de4d0cf209');
INSERT INTO `library_commit_sublayers` VALUES (710,'10a5599fb94d45559d1c6090a85fc04c','8b4faa4abc1b4a7c83accb08a3784815');
INSERT INTO `library_commit_sublayers` VALUES (711,'10a5599fb94d45559d1c6090a85fc04c','cedadbd88628477f9b336f02a317778d');
INSERT INTO `library_commit_sublayers` VALUES (712,'10a5599fb94d45559d1c6090a85fc04c','ef3770bdb9bc4e29b21e142a1424f995');
INSERT INTO `library_commit_sublayers` VALUES (713,'10a5599fb94d45559d1c6090a85fc04c','c1c17d7217ab413599eda9ed6728fd22');
INSERT INTO `library_commit_sublayers` VALUES (714,'1b5b4fb2d7d54b798f3aba0c4bf2564b','338b0af6b46a454381a1e14f78a52443');
INSERT INTO `library_commit_sublayers` VALUES (715,'1b5b4fb2d7d54b798f3aba0c4bf2564b','4442e0d763e245b1a9d87c0ac69312ad');
INSERT INTO `library_commit_sublayers` VALUES (716,'1b5b4fb2d7d54b798f3aba0c4bf2564b','caaa7da37b3b4782875f81cbf8b6f44c');
INSERT INTO `library_commit_sublayers` VALUES (717,'1b5b4fb2d7d54b798f3aba0c4bf2564b','3dada67323124499b22a752b58f8e117');
INSERT INTO `library_commit_sublayers` VALUES (718,'1b5b4fb2d7d54b798f3aba0c4bf2564b','5036103a272d4605b9cd7784a4eaa51b');
INSERT INTO `library_commit_sublayers` VALUES (719,'1b5b4fb2d7d54b798f3aba0c4bf2564b','5743be84a7c74363813960c893a32267');
INSERT INTO `library_commit_sublayers` VALUES (720,'1b5b4fb2d7d54b798f3aba0c4bf2564b','1c559b960a344fd696982fc13842df1e');
INSERT INTO `library_commit_sublayers` VALUES (721,'1b5b4fb2d7d54b798f3aba0c4bf2564b','8dc1122614244420b56179879887edb1');
INSERT INTO `library_commit_sublayers` VALUES (722,'1b5b4fb2d7d54b798f3aba0c4bf2564b','6d235eeedaa2460c8dac7669a5f06edd');
INSERT INTO `library_commit_sublayers` VALUES (723,'1b5b4fb2d7d54b798f3aba0c4bf2564b','144a69c97af7498fa7ecf527dc510a3d');
INSERT INTO `library_commit_sublayers` VALUES (724,'8e437cd562b34e0f9c216fb2a1a884c9','c0843bc1787644ada77758de0f26ef46');
INSERT INTO `library_commit_sublayers` VALUES (725,'8e437cd562b34e0f9c216fb2a1a884c9','21c09de93c1644249496f07bb8200bf8');
INSERT INTO `library_commit_sublayers` VALUES (726,'8e437cd562b34e0f9c216fb2a1a884c9','ba80cc6365384378a0d0fba7cd4146f4');
INSERT INTO `library_commit_sublayers` VALUES (727,'8e437cd562b34e0f9c216fb2a1a884c9','7eb8b48fabea43949f5cab187ff8c668');
INSERT INTO `library_commit_sublayers` VALUES (728,'8e437cd562b34e0f9c216fb2a1a884c9','895aa3517fcc4e3abee525da715a9d97');
INSERT INTO `library_commit_sublayers` VALUES (729,'8e437cd562b34e0f9c216fb2a1a884c9','89468d67c48b4b858bffbea9372472e4');
INSERT INTO `library_commit_sublayers` VALUES (730,'8e437cd562b34e0f9c216fb2a1a884c9','cb9721a2df764657ac377466f1203b84');
INSERT INTO `library_commit_sublayers` VALUES (731,'8e437cd562b34e0f9c216fb2a1a884c9','3ac0e9158802486e9bc3c3241f7eb095');
INSERT INTO `library_commit_sublayers` VALUES (732,'8e437cd562b34e0f9c216fb2a1a884c9','fe3c3e86f78445dc87243f48f1a2a99a');
INSERT INTO `library_commit_sublayers` VALUES (733,'8e437cd562b34e0f9c216fb2a1a884c9','2a5561669adf4c62a53a0405586d4840');
INSERT INTO `library_commit_sublayers` VALUES (734,'03fd79c412ca4c8f99fa080e96ed9431','5ca846a3677d4b2aaebf4a38cdf86634');
INSERT INTO `library_commit_sublayers` VALUES (735,'03fd79c412ca4c8f99fa080e96ed9431','a98c3f91de5144768d4bc59ab3e9ab46');
INSERT INTO `library_commit_sublayers` VALUES (736,'03fd79c412ca4c8f99fa080e96ed9431','7c2f5164a40542f68fca1687595c325a');
INSERT INTO `library_commit_sublayers` VALUES (737,'03fd79c412ca4c8f99fa080e96ed9431','d95f938025274163ab6043b215c25b6c');
INSERT INTO `library_commit_sublayers` VALUES (738,'03fd79c412ca4c8f99fa080e96ed9431','b8b3cb6e4e1e4f26a1780b69299f265b');
INSERT INTO `library_commit_sublayers` VALUES (739,'03fd79c412ca4c8f99fa080e96ed9431','f38bb7aee72f41a9871dafd164bb5f4c');
INSERT INTO `library_commit_sublayers` VALUES (740,'03fd79c412ca4c8f99fa080e96ed9431','443407e33eb64c4cb7f11c0807d0dfff');
INSERT INTO `library_commit_sublayers` VALUES (741,'03fd79c412ca4c8f99fa080e96ed9431','88e1ec3e6562472b966a743f3ed41457');
INSERT INTO `library_commit_sublayers` VALUES (742,'03fd79c412ca4c8f99fa080e96ed9431','4025102dcb894c6f9acf326d1eae4b92');
INSERT INTO `library_commit_sublayers` VALUES (743,'03fd79c412ca4c8f99fa080e96ed9431','16c21e481acd4ad393db97b2f5aae91d');
INSERT INTO `library_commit_sublayers` VALUES (744,'9cc050f8df3d47f18321860443d5efb7','3cadbf0bebcb47cfb568386a015f7c96');
INSERT INTO `library_commit_sublayers` VALUES (745,'9cc050f8df3d47f18321860443d5efb7','251b88a71b3e4294bea213769efdfd33');
INSERT INTO `library_commit_sublayers` VALUES (746,'9cc050f8df3d47f18321860443d5efb7','07334c51a3df4e36b7cb39a48c4dc6f3');
INSERT INTO `library_commit_sublayers` VALUES (747,'9cc050f8df3d47f18321860443d5efb7','a8d1fef8a0a849c1a95370581c106e15');
INSERT INTO `library_commit_sublayers` VALUES (748,'9cc050f8df3d47f18321860443d5efb7','e7fc73d8e937423ca488daa1b7b43b13');
INSERT INTO `library_commit_sublayers` VALUES (749,'9cc050f8df3d47f18321860443d5efb7','9e624709e1694ff8823fe6e80f0f55e7');
INSERT INTO `library_commit_sublayers` VALUES (750,'9cc050f8df3d47f18321860443d5efb7','59c8ec0797fd41e890bca79cac6f8558');
INSERT INTO `library_commit_sublayers` VALUES (751,'9cc050f8df3d47f18321860443d5efb7','37ea8ba54e004e4882dfc1254c7e4de5');
INSERT INTO `library_commit_sublayers` VALUES (752,'9cc050f8df3d47f18321860443d5efb7','f03a775e84a6475591703dc5c19ff311');
INSERT INTO `library_commit_sublayers` VALUES (753,'9cc050f8df3d47f18321860443d5efb7','8c33c61d3f964f8db9c80b83f280ff2a');
INSERT INTO `library_commit_sublayers` VALUES (754,'5f0f81aacddf40ef9c96d968e4c3ace8','b47d5735a72d48d789e480733b5e5978');
INSERT INTO `library_commit_sublayers` VALUES (755,'5f0f81aacddf40ef9c96d968e4c3ace8','b902751b41c94f548bd17b3e8d588190');
INSERT INTO `library_commit_sublayers` VALUES (756,'5f0f81aacddf40ef9c96d968e4c3ace8','17c47250003d4649a550318f4a01ecb1');
INSERT INTO `library_commit_sublayers` VALUES (757,'5f0f81aacddf40ef9c96d968e4c3ace8','9c97f55e7ba64940bd1765fcb1bd0037');
INSERT INTO `library_commit_sublayers` VALUES (758,'5f0f81aacddf40ef9c96d968e4c3ace8','4ddf1425dded4f9a9e8940ba1b05fa3f');
INSERT INTO `library_commit_sublayers` VALUES (759,'5f0f81aacddf40ef9c96d968e4c3ace8','cd4d8c845b284771a6e7e3a0f52dd168');
INSERT INTO `library_commit_sublayers` VALUES (760,'5f0f81aacddf40ef9c96d968e4c3ace8','9b4a21f2bf604e699afd17563bb2a23c');
INSERT INTO `library_commit_sublayers` VALUES (761,'5f0f81aacddf40ef9c96d968e4c3ace8','9c19f3099c58409091bd1d47b2b5bb86');
INSERT INTO `library_commit_sublayers` VALUES (762,'5f0f81aacddf40ef9c96d968e4c3ace8','470f94aabd12454b88826d204e20ef29');
INSERT INTO `library_commit_sublayers` VALUES (763,'5f0f81aacddf40ef9c96d968e4c3ace8','c81fb058f0ad4058b85e786275ddbc62');
INSERT INTO `library_commit_sublayers` VALUES (764,'8930071d64ee4deeb824d7d97f5d6aa7','95bc6b1a696b42b6a31e203a0c418467');
INSERT INTO `library_commit_sublayers` VALUES (765,'8930071d64ee4deeb824d7d97f5d6aa7','9b5e48c171ec49d4875043c1355abb99');
INSERT INTO `library_commit_sublayers` VALUES (766,'8930071d64ee4deeb824d7d97f5d6aa7','94f331ff49824cb4904ff2cc879bd73d');
INSERT INTO `library_commit_sublayers` VALUES (767,'8930071d64ee4deeb824d7d97f5d6aa7','94781e93d5714e7ab5c9868e5c7b80b1');
INSERT INTO `library_commit_sublayers` VALUES (768,'8930071d64ee4deeb824d7d97f5d6aa7','6b1989f5c4b14d42b1a8f68d1265447e');
INSERT INTO `library_commit_sublayers` VALUES (769,'8930071d64ee4deeb824d7d97f5d6aa7','6ed0247a1a23490f8cf00783d67c885a');
INSERT INTO `library_commit_sublayers` VALUES (770,'8930071d64ee4deeb824d7d97f5d6aa7','922def5bc28942e395953b6c7e0db4d6');
INSERT INTO `library_commit_sublayers` VALUES (771,'8930071d64ee4deeb824d7d97f5d6aa7','68cda689d76e4ee391de9bc542e03322');
INSERT INTO `library_commit_sublayers` VALUES (772,'8930071d64ee4deeb824d7d97f5d6aa7','48f9163070714abd9938849849fd04ba');
INSERT INTO `library_commit_sublayers` VALUES (773,'8930071d64ee4deeb824d7d97f5d6aa7','b8179e4eefc640e894e016e0873bbd65');
INSERT INTO `library_commit_sublayers` VALUES (774,'08230acecd3545ea9623ae75b96792fd','8d15c2c51f14448cb61ed5f36c163b7a');
INSERT INTO `library_commit_sublayers` VALUES (775,'08230acecd3545ea9623ae75b96792fd','4666e87cc16948749b755ac3d1d991ee');
INSERT INTO `library_commit_sublayers` VALUES (776,'08230acecd3545ea9623ae75b96792fd','ee6af650b7674010bd8163aec0c365c5');
INSERT INTO `library_commit_sublayers` VALUES (777,'08230acecd3545ea9623ae75b96792fd','b0db1fc0323f471bae9f50df0daf0ca0');
INSERT INTO `library_commit_sublayers` VALUES (778,'08230acecd3545ea9623ae75b96792fd','eafb2bd22ca7456d8994e0f2320daf02');
INSERT INTO `library_commit_sublayers` VALUES (779,'08230acecd3545ea9623ae75b96792fd','ec682351cd1d486dbd7f4962a7ba9a21');
INSERT INTO `library_commit_sublayers` VALUES (780,'08230acecd3545ea9623ae75b96792fd','9d5eacbb3e04497d9d52df5a4756ee78');
INSERT INTO `library_commit_sublayers` VALUES (781,'08230acecd3545ea9623ae75b96792fd','c30276a1a06f405ab2d9d89d7a7e7249');
INSERT INTO `library_commit_sublayers` VALUES (782,'08230acecd3545ea9623ae75b96792fd','39ebc668c8db4fe08f183abd6cdb697d');
INSERT INTO `library_commit_sublayers` VALUES (783,'08230acecd3545ea9623ae75b96792fd','a8225c3f3f0b440ba45b9d83f1995cd2');
INSERT INTO `library_commit_sublayers` VALUES (784,'6fdb70b726224a8a9778394fafaed9c0','ea0c16df7d57432b8ea506c0a2501ecb');
INSERT INTO `library_commit_sublayers` VALUES (785,'6fdb70b726224a8a9778394fafaed9c0','c2abb2f2dcc2458583324c47daa2a6a6');
INSERT INTO `library_commit_sublayers` VALUES (786,'6fdb70b726224a8a9778394fafaed9c0','85ce0e3be20348dfb28b6a91ee857a04');
INSERT INTO `library_commit_sublayers` VALUES (787,'6fdb70b726224a8a9778394fafaed9c0','c873a3def2e443098cd57910a0656c49');
INSERT INTO `library_commit_sublayers` VALUES (788,'6fdb70b726224a8a9778394fafaed9c0','5601ec73389f466dbe741ded28b253ed');
INSERT INTO `library_commit_sublayers` VALUES (789,'6fdb70b726224a8a9778394fafaed9c0','81337c5a3a0e4a738b6181b167c117f5');
INSERT INTO `library_commit_sublayers` VALUES (790,'6fdb70b726224a8a9778394fafaed9c0','c390c4cc2bb94f1aae2adaa19d6083eb');
INSERT INTO `library_commit_sublayers` VALUES (791,'6fdb70b726224a8a9778394fafaed9c0','ad4f4af1ada04a80ab5fa94ce78885e8');
INSERT INTO `library_commit_sublayers` VALUES (792,'6fdb70b726224a8a9778394fafaed9c0','fd886ed9beec4c308334b5c07e2ac639');
INSERT INTO `library_commit_sublayers` VALUES (793,'6fdb70b726224a8a9778394fafaed9c0','82aa28c4b2e24da1a25e995f6df92f92');
INSERT INTO `library_commit_sublayers` VALUES (794,'ad8b2e590a2b4e1fbd36a23d047d6b94','8da572a38a8e4fa4b21a5a2138fb05df');
INSERT INTO `library_commit_sublayers` VALUES (795,'ad8b2e590a2b4e1fbd36a23d047d6b94','9bc523569661429d9b98b5b8e92ef5f7');
INSERT INTO `library_commit_sublayers` VALUES (796,'ad8b2e590a2b4e1fbd36a23d047d6b94','72df0eb8d4f74e49b414d5d277b15a21');
INSERT INTO `library_commit_sublayers` VALUES (797,'ad8b2e590a2b4e1fbd36a23d047d6b94','569f7856e53748899e79bdbf026dbd6a');
INSERT INTO `library_commit_sublayers` VALUES (798,'ad8b2e590a2b4e1fbd36a23d047d6b94','06e2765e503048e285e9526856ffa577');
INSERT INTO `library_commit_sublayers` VALUES (799,'ad8b2e590a2b4e1fbd36a23d047d6b94','b5450756291c43c5b86b609720f8ef32');
INSERT INTO `library_commit_sublayers` VALUES (800,'ad8b2e590a2b4e1fbd36a23d047d6b94','dd2270910972423998e272729d27c2ea');
INSERT INTO `library_commit_sublayers` VALUES (801,'ad8b2e590a2b4e1fbd36a23d047d6b94','3baaa8f68f6c4bbab1e0277cd9b2b34e');
INSERT INTO `library_commit_sublayers` VALUES (802,'ad8b2e590a2b4e1fbd36a23d047d6b94','e077a06a0f76426681bbb4cf75b9a50b');
INSERT INTO `library_commit_sublayers` VALUES (803,'ad8b2e590a2b4e1fbd36a23d047d6b94','558d4c6a9fe04f379e1de81eda4be4ac');
INSERT INTO `library_commit_sublayers` VALUES (804,'08b28d92ef3c4444b7674d702b991163','3613fc0c419549e5834ee331db511ce9');
INSERT INTO `library_commit_sublayers` VALUES (805,'08b28d92ef3c4444b7674d702b991163','9f133b2a743547d893dddd9dcaaa8f38');
INSERT INTO `library_commit_sublayers` VALUES (806,'08b28d92ef3c4444b7674d702b991163','3a029cbfbbf14efc94c3a1cb5e1b9412');
INSERT INTO `library_commit_sublayers` VALUES (807,'08b28d92ef3c4444b7674d702b991163','3c3f19f802be44678ff29fa8f1383a21');
INSERT INTO `library_commit_sublayers` VALUES (808,'08b28d92ef3c4444b7674d702b991163','15b99bd50fc849f088ea634b394691a5');
INSERT INTO `library_commit_sublayers` VALUES (809,'08b28d92ef3c4444b7674d702b991163','9b2b1c5f4b2543cea59533e9a103aaf9');
INSERT INTO `library_commit_sublayers` VALUES (810,'08b28d92ef3c4444b7674d702b991163','8e5908f64a8041cf83f3c3b0b317a136');
INSERT INTO `library_commit_sublayers` VALUES (811,'08b28d92ef3c4444b7674d702b991163','9f232321c17f45498f23d5da70dbd962');
INSERT INTO `library_commit_sublayers` VALUES (812,'08b28d92ef3c4444b7674d702b991163','e71e0cdc8c7c4f3bb1f411e035b9fe80');
INSERT INTO `library_commit_sublayers` VALUES (813,'08b28d92ef3c4444b7674d702b991163','bcc3c848efd248e88196d5a04d878309');
INSERT INTO `library_commit_sublayers` VALUES (814,'75271bd9cfb64de19ea2b87dacd46a07','3ff062a50af747d598b7a2d4897eb1e5');
INSERT INTO `library_commit_sublayers` VALUES (815,'75271bd9cfb64de19ea2b87dacd46a07','70e39cf40baa4a2d9f2e0f8f2a898439');
INSERT INTO `library_commit_sublayers` VALUES (816,'75271bd9cfb64de19ea2b87dacd46a07','ba58fe42e7d6472babc2654f594846fa');
INSERT INTO `library_commit_sublayers` VALUES (817,'75271bd9cfb64de19ea2b87dacd46a07','6394795361df45be941d60f0ad220d7a');
INSERT INTO `library_commit_sublayers` VALUES (818,'75271bd9cfb64de19ea2b87dacd46a07','92e3dff8cfb144efabc66a4b1217ed88');
INSERT INTO `library_commit_sublayers` VALUES (819,'75271bd9cfb64de19ea2b87dacd46a07','03714a629e754fe0ae8864d6c30dbf28');
INSERT INTO `library_commit_sublayers` VALUES (820,'75271bd9cfb64de19ea2b87dacd46a07','56c7edbd65064b55aea9c9ed19a794ab');
INSERT INTO `library_commit_sublayers` VALUES (821,'75271bd9cfb64de19ea2b87dacd46a07','b6e67dfa35f44269b1a760b8b828ccf3');
INSERT INTO `library_commit_sublayers` VALUES (822,'75271bd9cfb64de19ea2b87dacd46a07','e7371595f5d04257bdfbe3f8fdd3a91c');
INSERT INTO `library_commit_sublayers` VALUES (823,'75271bd9cfb64de19ea2b87dacd46a07','b308e80dc75d4ef396f77a629f0b64ab');
INSERT INTO `library_commit_sublayers` VALUES (824,'c117258181e947a39b1d50fe1cb2dc23','8d7f2cb2dec14f1a808b5e39bc87c20d');
INSERT INTO `library_commit_sublayers` VALUES (825,'c117258181e947a39b1d50fe1cb2dc23','71ed1f12d82d49b88a7d466edacc9126');
INSERT INTO `library_commit_sublayers` VALUES (826,'c117258181e947a39b1d50fe1cb2dc23','e67c3689d9d14b11b19dcfd880204951');
INSERT INTO `library_commit_sublayers` VALUES (827,'c117258181e947a39b1d50fe1cb2dc23','bbac91ba2be340ab8fcd033fdb067cb4');
INSERT INTO `library_commit_sublayers` VALUES (828,'c117258181e947a39b1d50fe1cb2dc23','8bbc9a62b87e498f931ffd92f4be35f9');
INSERT INTO `library_commit_sublayers` VALUES (829,'c117258181e947a39b1d50fe1cb2dc23','7bcc3f20bad140c08e7240bb3d4b37cd');
INSERT INTO `library_commit_sublayers` VALUES (830,'c117258181e947a39b1d50fe1cb2dc23','aa06138237e0498f9364321abf181150');
INSERT INTO `library_commit_sublayers` VALUES (831,'c117258181e947a39b1d50fe1cb2dc23','82d7675c6c654d0fb2aeee6f5adf4eda');
INSERT INTO `library_commit_sublayers` VALUES (832,'c117258181e947a39b1d50fe1cb2dc23','a784756dc31541969ee08fa21f5d99a0');
INSERT INTO `library_commit_sublayers` VALUES (833,'c117258181e947a39b1d50fe1cb2dc23','f28d9d926ded4b7ea52c1b8a4b981c0e');
INSERT INTO `library_commit_sublayers` VALUES (834,'8914b448f1e94d2c9a5b65bb44c2bf2d','d6bf37be1aad4d9cbcb99866101492c5');
INSERT INTO `library_commit_sublayers` VALUES (835,'8914b448f1e94d2c9a5b65bb44c2bf2d','f1b8bfb6ae894763b0c9627a5dee83e8');
INSERT INTO `library_commit_sublayers` VALUES (836,'8914b448f1e94d2c9a5b65bb44c2bf2d','2b94961ec244444185023357a7263f8b');
INSERT INTO `library_commit_sublayers` VALUES (837,'8914b448f1e94d2c9a5b65bb44c2bf2d','2b4a2e3ea0e648888aa410d0b80eb75d');
INSERT INTO `library_commit_sublayers` VALUES (838,'8914b448f1e94d2c9a5b65bb44c2bf2d','93559e2e32264ee58bc471b8617533db');
INSERT INTO `library_commit_sublayers` VALUES (839,'8914b448f1e94d2c9a5b65bb44c2bf2d','f11847db15de4ae69fe1d1067c836240');
INSERT INTO `library_commit_sublayers` VALUES (840,'8914b448f1e94d2c9a5b65bb44c2bf2d','87ebb0d8eb734c959a2114e3e2ffe3a6');
INSERT INTO `library_commit_sublayers` VALUES (841,'8914b448f1e94d2c9a5b65bb44c2bf2d','a9e1449b8fe34b3894579d389a6c51a6');
INSERT INTO `library_commit_sublayers` VALUES (842,'8914b448f1e94d2c9a5b65bb44c2bf2d','709f534f9ff44e23958cdd7667aaa9be');
INSERT INTO `library_commit_sublayers` VALUES (843,'8914b448f1e94d2c9a5b65bb44c2bf2d','65c80d35ddf64fc4a2de5a1b75836859');
INSERT INTO `library_commit_sublayers` VALUES (844,'8914b448f1e94d2c9a5b65bb44c2bf2d','b795c6ae29dc4fcfa87445baee6e33ef');
INSERT INTO `library_commit_sublayers` VALUES (845,'8914b448f1e94d2c9a5b65bb44c2bf2d','1fbf243d2d92454b91504f384227f0b8');
INSERT INTO `library_commit_sublayers` VALUES (846,'8914b448f1e94d2c9a5b65bb44c2bf2d','0facb9393f9a4e35bb75c5f46d7d7a8c');
INSERT INTO `library_commit_sublayers` VALUES (847,'8914b448f1e94d2c9a5b65bb44c2bf2d','f351626e2e2940e0bc11adf3c83d61bc');
INSERT INTO `library_commit_sublayers` VALUES (848,'ce792b65f0f84479a8f121ec5b17d96e','f721d4d57f7344bcbe071582f332623d');
INSERT INTO `library_commit_sublayers` VALUES (849,'ce792b65f0f84479a8f121ec5b17d96e','58d306301a724bb2869fd61635696017');
INSERT INTO `library_commit_sublayers` VALUES (850,'ce792b65f0f84479a8f121ec5b17d96e','3fa803fc87154f0481d95b91c1f89baf');
INSERT INTO `library_commit_sublayers` VALUES (851,'ce792b65f0f84479a8f121ec5b17d96e','f7e6e3a992414a17abb896af4d5d29b2');
INSERT INTO `library_commit_sublayers` VALUES (852,'ce792b65f0f84479a8f121ec5b17d96e','72a760469da54d5594ed0e3a2314a565');
INSERT INTO `library_commit_sublayers` VALUES (853,'ce792b65f0f84479a8f121ec5b17d96e','3772f6ef08b34c0a9cf6f910b210fcee');
INSERT INTO `library_commit_sublayers` VALUES (854,'ce792b65f0f84479a8f121ec5b17d96e','1d8aebae1c69434991895fa3089c1d9e');
INSERT INTO `library_commit_sublayers` VALUES (855,'ce792b65f0f84479a8f121ec5b17d96e','47dbc3caf83742dc809a2e30a388c9e1');
INSERT INTO `library_commit_sublayers` VALUES (856,'ce792b65f0f84479a8f121ec5b17d96e','ae2624a722d74a70969ce94ada21550a');
INSERT INTO `library_commit_sublayers` VALUES (857,'ce792b65f0f84479a8f121ec5b17d96e','0bcea527322d44a8abc7ff1c677a8736');
INSERT INTO `library_commit_sublayers` VALUES (858,'80e187d5ae2d48a1aa5969713728ff52','ef3595c308144eeeaf8155763abde9f8');
INSERT INTO `library_commit_sublayers` VALUES (859,'80e187d5ae2d48a1aa5969713728ff52','2bb3563d79af48a98bfaaea8ca777a34');
INSERT INTO `library_commit_sublayers` VALUES (860,'80e187d5ae2d48a1aa5969713728ff52','1f03c01f3dcf44e1be3189794b47d1b6');
INSERT INTO `library_commit_sublayers` VALUES (861,'80e187d5ae2d48a1aa5969713728ff52','38a6121bd3444d7ab5759be1c702b08a');
INSERT INTO `library_commit_sublayers` VALUES (862,'80e187d5ae2d48a1aa5969713728ff52','aec8de5801ca46b5b3651726756acbd6');
INSERT INTO `library_commit_sublayers` VALUES (863,'80e187d5ae2d48a1aa5969713728ff52','a0ab0bf077ea4e418a6b69693e7b42dd');
INSERT INTO `library_commit_sublayers` VALUES (864,'80e187d5ae2d48a1aa5969713728ff52','78f7b23515064cebb2b0216090015b9a');
INSERT INTO `library_commit_sublayers` VALUES (865,'80e187d5ae2d48a1aa5969713728ff52','b12cebdedc4341aca9f14c83978d2126');
INSERT INTO `library_commit_sublayers` VALUES (866,'80e187d5ae2d48a1aa5969713728ff52','744f01e6b30246b2927c572815c34f49');
INSERT INTO `library_commit_sublayers` VALUES (867,'80e187d5ae2d48a1aa5969713728ff52','35afceb6bcbd479b890224a15c7397f5');
INSERT INTO `library_commit_sublayers` VALUES (868,'e452ba046c2a4988844b254459c2b802','7545d997957b4ef2b2665314e7b61bee');
INSERT INTO `library_commit_sublayers` VALUES (869,'e452ba046c2a4988844b254459c2b802','736612ecc56d44859033ca9b073b69f7');
INSERT INTO `library_commit_sublayers` VALUES (870,'e452ba046c2a4988844b254459c2b802','fcc917b1576946aeb7cc97e6305568ce');
INSERT INTO `library_commit_sublayers` VALUES (871,'e452ba046c2a4988844b254459c2b802','c61a196be20b4f57a5599806432a3937');
INSERT INTO `library_commit_sublayers` VALUES (872,'e452ba046c2a4988844b254459c2b802','c6097e3f05e0418ba940e7a7c1f6c700');
INSERT INTO `library_commit_sublayers` VALUES (873,'e452ba046c2a4988844b254459c2b802','934ef03a61e248f9a0ceb5053f70f649');
INSERT INTO `library_commit_sublayers` VALUES (874,'e452ba046c2a4988844b254459c2b802','fba72acb7fad470680258b508d3e2424');
INSERT INTO `library_commit_sublayers` VALUES (875,'e452ba046c2a4988844b254459c2b802','1317b5e8b993488dba088ec532b1daa4');
INSERT INTO `library_commit_sublayers` VALUES (876,'e452ba046c2a4988844b254459c2b802','96999c295e164bb3a2be75718d898378');
INSERT INTO `library_commit_sublayers` VALUES (877,'e452ba046c2a4988844b254459c2b802','bbe99a00a8b9428f8ab37cbbb1ece193');
INSERT INTO `library_commit_sublayers` VALUES (878,'d765ee03386a45178d376fea3994bd90','f489b40609f241609d313f59a3bd2be0');
INSERT INTO `library_commit_sublayers` VALUES (879,'d765ee03386a45178d376fea3994bd90','d33c125840e54b14960050505db7308a');
INSERT INTO `library_commit_sublayers` VALUES (880,'d765ee03386a45178d376fea3994bd90','00bdc51277754fd08faa83ae020f7740');
INSERT INTO `library_commit_sublayers` VALUES (881,'d765ee03386a45178d376fea3994bd90','082526dbe3ed44f088d767de324e52f7');
INSERT INTO `library_commit_sublayers` VALUES (882,'d765ee03386a45178d376fea3994bd90','c71ffd4f4a7542319e74f39a2558b781');
INSERT INTO `library_commit_sublayers` VALUES (883,'d765ee03386a45178d376fea3994bd90','24ebb0cbd1a04acd8b0af9a4f7c3fcbc');
INSERT INTO `library_commit_sublayers` VALUES (884,'d765ee03386a45178d376fea3994bd90','6ffc803d30924593969421a2e040d47e');
INSERT INTO `library_commit_sublayers` VALUES (885,'d765ee03386a45178d376fea3994bd90','0aa360bddc964210832e6813f1378b94');
INSERT INTO `library_commit_sublayers` VALUES (886,'d765ee03386a45178d376fea3994bd90','0c248cd88c224d9998471fa44dc6228e');
INSERT INTO `library_commit_sublayers` VALUES (887,'d765ee03386a45178d376fea3994bd90','dbdb1a48068d4cc5a143bc7f3078fedb');
INSERT INTO `library_commit_sublayers` VALUES (888,'fe884b51ef2649f2b8b87e0e83923fa3','dfcf569029434f74ae3a40d9f6d36ae7');
INSERT INTO `library_commit_sublayers` VALUES (889,'fe884b51ef2649f2b8b87e0e83923fa3','8786ef07a8ee45239c19bfadedc664e7');
INSERT INTO `library_commit_sublayers` VALUES (890,'fe884b51ef2649f2b8b87e0e83923fa3','402944843138422c96ffcacb7051e2b3');
INSERT INTO `library_commit_sublayers` VALUES (891,'fe884b51ef2649f2b8b87e0e83923fa3','05dd0f5e75a342daa91f25b72669d375');
INSERT INTO `library_commit_sublayers` VALUES (892,'fe884b51ef2649f2b8b87e0e83923fa3','d80fdd2ab5914a619a5d29ea18b0ef6b');
INSERT INTO `library_commit_sublayers` VALUES (893,'fe884b51ef2649f2b8b87e0e83923fa3','d655014042bd41e78de02759d872585d');
INSERT INTO `library_commit_sublayers` VALUES (894,'fe884b51ef2649f2b8b87e0e83923fa3','838901e5fd3c44b9ae632990f5122dc2');
INSERT INTO `library_commit_sublayers` VALUES (895,'fe884b51ef2649f2b8b87e0e83923fa3','25da7eb8743f4a6488466666fbf42b23');
INSERT INTO `library_commit_sublayers` VALUES (896,'fe884b51ef2649f2b8b87e0e83923fa3','9dd15c02bac74957a78f788873f33df0');
INSERT INTO `library_commit_sublayers` VALUES (897,'eb8fa9e26c974a1e96fc7194896c8541','5cc5e718d8e1445882a1d0188f67a61e');
INSERT INTO `library_commit_sublayers` VALUES (898,'eb8fa9e26c974a1e96fc7194896c8541','b799564701624a549bbd902da45a8a47');
INSERT INTO `library_commit_sublayers` VALUES (899,'eb8fa9e26c974a1e96fc7194896c8541','a324b4d6b5e14de3b6f6219274142102');
INSERT INTO `library_commit_sublayers` VALUES (900,'eb8fa9e26c974a1e96fc7194896c8541','92aa195abc904dacae73aba5385d175e');
INSERT INTO `library_commit_sublayers` VALUES (901,'eb8fa9e26c974a1e96fc7194896c8541','7ab296be64d54c87ae23ed5e0881af71');
INSERT INTO `library_commit_sublayers` VALUES (902,'eb8fa9e26c974a1e96fc7194896c8541','72fa8062630245fba798fa5f4f0cba00');
INSERT INTO `library_commit_sublayers` VALUES (903,'eb8fa9e26c974a1e96fc7194896c8541','a0d4d3c4ffd644e3ac289812d6b1e2aa');
INSERT INTO `library_commit_sublayers` VALUES (904,'eb8fa9e26c974a1e96fc7194896c8541','8ee13370e23b4af1aca475898a9c7ee1');
INSERT INTO `library_commit_sublayers` VALUES (905,'eb8fa9e26c974a1e96fc7194896c8541','0f6214dc34504c10938ebb874e8a90ae');
INSERT INTO `library_commit_sublayers` VALUES (906,'eb8fa9e26c974a1e96fc7194896c8541','73f63871e97749bab044e0757f3b0de7');
INSERT INTO `library_commit_sublayers` VALUES (907,'e8907ca713ac487997030771f58abe33','8c90182c17914243ad64ddb51ca2c428');
INSERT INTO `library_commit_sublayers` VALUES (908,'e8907ca713ac487997030771f58abe33','1b457f71a7cf4463b78410c7db6536a4');
INSERT INTO `library_commit_sublayers` VALUES (909,'e8907ca713ac487997030771f58abe33','02be432d29d04f05a95cd6c692a13bef');
INSERT INTO `library_commit_sublayers` VALUES (910,'e8907ca713ac487997030771f58abe33','b37595ff43bc452dbd1d2309cda7f394');
INSERT INTO `library_commit_sublayers` VALUES (911,'e8907ca713ac487997030771f58abe33','8f35ab2a7b6a417696a2c5a29c70e0d5');
INSERT INTO `library_commit_sublayers` VALUES (912,'e8907ca713ac487997030771f58abe33','26cc63266c6348ca948a84daa9cb46cf');
INSERT INTO `library_commit_sublayers` VALUES (913,'e8907ca713ac487997030771f58abe33','46bb380410a14a0c8c85a80fabe612fa');
INSERT INTO `library_commit_sublayers` VALUES (914,'e8907ca713ac487997030771f58abe33','ed2b1e16b09f429fa770dbcd7bf56c9d');
INSERT INTO `library_commit_sublayers` VALUES (915,'e8907ca713ac487997030771f58abe33','2f73f174d6234e458105b4698513b3a2');
INSERT INTO `library_commit_sublayers` VALUES (916,'e8907ca713ac487997030771f58abe33','a264712f14db4d73aecf40f6ef385056');
INSERT INTO `library_commit_sublayers` VALUES (917,'4044890db4294e7496e592430109106f','95ac592eeaee4c82b0782eb732aa078b');
INSERT INTO `library_commit_sublayers` VALUES (918,'4044890db4294e7496e592430109106f','2880dd4a09dc40219d8b3e2e15acdef0');
INSERT INTO `library_commit_sublayers` VALUES (919,'4044890db4294e7496e592430109106f','a4931144a23941759e99d04950cec301');
INSERT INTO `library_commit_sublayers` VALUES (920,'4044890db4294e7496e592430109106f','b4a013659e3949f0b3f02acff9639a79');
INSERT INTO `library_commit_sublayers` VALUES (921,'4044890db4294e7496e592430109106f','fb94db9b7d66424a92ae2ff63e1a0cb7');
INSERT INTO `library_commit_sublayers` VALUES (922,'4044890db4294e7496e592430109106f','95f979fcc51c4c368f5f790e8e61b3ba');
INSERT INTO `library_commit_sublayers` VALUES (923,'4044890db4294e7496e592430109106f','8e45973c25e3481580af66a572795448');
INSERT INTO `library_commit_sublayers` VALUES (924,'4044890db4294e7496e592430109106f','80cde3c1b2da4ca7a485ee1f04faf1fc');
INSERT INTO `library_commit_sublayers` VALUES (925,'4044890db4294e7496e592430109106f','ed575d7777f347769d5f1cfc64532bac');
INSERT INTO `library_commit_sublayers` VALUES (926,'4044890db4294e7496e592430109106f','24cebd8487334d4fa5f4e0266fc46398');
INSERT INTO `library_commit_sublayers` VALUES (927,'b488a096c70f4a95815f4b4a3271d55b','b71daac7f2d04d1da7a0e1b4f6fed2c7');
INSERT INTO `library_commit_sublayers` VALUES (928,'b488a096c70f4a95815f4b4a3271d55b','f84088e39af8454b857649f65673ae69');
INSERT INTO `library_commit_sublayers` VALUES (929,'b488a096c70f4a95815f4b4a3271d55b','64803182d08b48378714a0cece4c41af');
INSERT INTO `library_commit_sublayers` VALUES (930,'b488a096c70f4a95815f4b4a3271d55b','3eeb31b6a06c45cf9dadd85a9757653b');
INSERT INTO `library_commit_sublayers` VALUES (931,'b488a096c70f4a95815f4b4a3271d55b','13cc3cd59f064aa8a12d7fda153738df');
INSERT INTO `library_commit_sublayers` VALUES (932,'b488a096c70f4a95815f4b4a3271d55b','3520886754df41a6b6fb36b7e3c252c7');
INSERT INTO `library_commit_sublayers` VALUES (933,'b488a096c70f4a95815f4b4a3271d55b','918adab6951d49a1b6aa2e8b7559e1d8');
INSERT INTO `library_commit_sublayers` VALUES (934,'b488a096c70f4a95815f4b4a3271d55b','a2d1223d1d694535bc2ca74ceecc9d7b');
INSERT INTO `library_commit_sublayers` VALUES (935,'b488a096c70f4a95815f4b4a3271d55b','d7c7b08bc5a14412baa4adb322752bad');
INSERT INTO `library_commit_sublayers` VALUES (936,'b488a096c70f4a95815f4b4a3271d55b','ef3ec2d02bdb433eb561af585800616d');
INSERT INTO `library_commit_sublayers` VALUES (937,'9692ca098d154ffebe1b86c91cf91aa1','8466a1e23e2c459cbca9c8b62ab0255b');
INSERT INTO `library_commit_sublayers` VALUES (938,'9692ca098d154ffebe1b86c91cf91aa1','cee88d7f7a9044149364a7db3553eeeb');
INSERT INTO `library_commit_sublayers` VALUES (939,'9692ca098d154ffebe1b86c91cf91aa1','b41945d97e144858a8e9454b083837d4');
INSERT INTO `library_commit_sublayers` VALUES (940,'9692ca098d154ffebe1b86c91cf91aa1','3b4e78cefc954ed99f390bf399236e8e');
INSERT INTO `library_commit_sublayers` VALUES (941,'9692ca098d154ffebe1b86c91cf91aa1','638f94df698b4ab0a7f97bad075e74ee');
INSERT INTO `library_commit_sublayers` VALUES (942,'9692ca098d154ffebe1b86c91cf91aa1','2996651069364874b5db5ed2f4b5b3bc');
INSERT INTO `library_commit_sublayers` VALUES (943,'9692ca098d154ffebe1b86c91cf91aa1','3bca009c237849a9bf2fa43d81f64db2');
INSERT INTO `library_commit_sublayers` VALUES (944,'9692ca098d154ffebe1b86c91cf91aa1','5f8c9fde7da242e5afa34aeaff66f26e');
INSERT INTO `library_commit_sublayers` VALUES (945,'9692ca098d154ffebe1b86c91cf91aa1','87891c38edab486aa234eb9d5a5c9d1e');
INSERT INTO `library_commit_sublayers` VALUES (946,'9692ca098d154ffebe1b86c91cf91aa1','eb4103efdf014445861e591703c7394f');
INSERT INTO `library_commit_sublayers` VALUES (947,'9692ca098d154ffebe1b86c91cf91aa1','7d29112ac82c4b3d81b72cc05c71422f');
INSERT INTO `library_commit_sublayers` VALUES (948,'4b080631ee8c400c9b317dfe2f73210a','d60ce7d560e245fe8958628409c63313');
INSERT INTO `library_commit_sublayers` VALUES (949,'4b080631ee8c400c9b317dfe2f73210a','8dbb42a197a24925ba3af4912d06e2d6');
INSERT INTO `library_commit_sublayers` VALUES (950,'4b080631ee8c400c9b317dfe2f73210a','793145b95211489da1bb327fdac69401');
INSERT INTO `library_commit_sublayers` VALUES (951,'4b080631ee8c400c9b317dfe2f73210a','88a600eabac3452a86a4050fae960ce9');
INSERT INTO `library_commit_sublayers` VALUES (952,'4b080631ee8c400c9b317dfe2f73210a','d4f41acf012a49248b9ce7f79f66a4e0');
INSERT INTO `library_commit_sublayers` VALUES (953,'4b080631ee8c400c9b317dfe2f73210a','3530965433b844c09c212f3f132253be');
INSERT INTO `library_commit_sublayers` VALUES (954,'4b080631ee8c400c9b317dfe2f73210a','8ea0e9521fe5401bbbf5dc58e6a0db73');
INSERT INTO `library_commit_sublayers` VALUES (955,'4b080631ee8c400c9b317dfe2f73210a','d0747f2082d94ae7afe463306307d723');
INSERT INTO `library_commit_sublayers` VALUES (956,'4b080631ee8c400c9b317dfe2f73210a','978b6574157049239c4151d15e2f7237');
INSERT INTO `library_commit_sublayers` VALUES (957,'4b080631ee8c400c9b317dfe2f73210a','28a34a9aae9d492ab1d047266ad88bdd');
INSERT INTO `library_commit_sublayers` VALUES (958,'4b080631ee8c400c9b317dfe2f73210a','ca7eb614f92d479bb5fc4aa089fd68af');
INSERT INTO `library_commit_sublayers` VALUES (959,'d8b824a83e0e41c6b39ab2485015b6cf','0f1095980e81473a8e686a8a3ff39fc9');
INSERT INTO `library_commit_sublayers` VALUES (960,'d8b824a83e0e41c6b39ab2485015b6cf','c58f6b121c9a4b59b69221fbf22c7cfb');
INSERT INTO `library_commit_sublayers` VALUES (961,'d8b824a83e0e41c6b39ab2485015b6cf','2bd7eec6683a4d3187492614f1b494aa');
INSERT INTO `library_commit_sublayers` VALUES (962,'d8b824a83e0e41c6b39ab2485015b6cf','bd070944cb0b4ed19aa67ec08e7f5b8a');
INSERT INTO `library_commit_sublayers` VALUES (963,'d8b824a83e0e41c6b39ab2485015b6cf','0dbf6ae17226437490f4ffec4fc07444');
INSERT INTO `library_commit_sublayers` VALUES (964,'d8b824a83e0e41c6b39ab2485015b6cf','1256edba410e45dd8f749096efb20b7b');
INSERT INTO `library_commit_sublayers` VALUES (965,'d8b824a83e0e41c6b39ab2485015b6cf','3697a804853943c1be60931b51743d1e');
INSERT INTO `library_commit_sublayers` VALUES (966,'d8b824a83e0e41c6b39ab2485015b6cf','f0b4445067fb44e1b756d51e52e3a34f');
INSERT INTO `library_commit_sublayers` VALUES (967,'d8b824a83e0e41c6b39ab2485015b6cf','f35b68efd97d4747a1fcc83fadeb699f');
INSERT INTO `library_commit_sublayers` VALUES (968,'d8b824a83e0e41c6b39ab2485015b6cf','c6c531f91fcd4a77a9c922cc99ef8aec');
INSERT INTO `library_commit_sublayers` VALUES (969,'d8b824a83e0e41c6b39ab2485015b6cf','ad1a6b542f364c6b9d77a7fa1a74de36');
INSERT INTO `library_commit_sublayers` VALUES (970,'36aa463d0f734b3aa022ffe653725346','4f849e6c350646269a9770fa128f6299');
INSERT INTO `library_commit_sublayers` VALUES (971,'36aa463d0f734b3aa022ffe653725346','58badc5c37284ba9ad266b500b0c185f');
INSERT INTO `library_commit_sublayers` VALUES (972,'36aa463d0f734b3aa022ffe653725346','eb6b5e94360d408a8ff71cb3c5af5856');
INSERT INTO `library_commit_sublayers` VALUES (973,'36aa463d0f734b3aa022ffe653725346','04e3dd579ff949ce82037b1344a23170');
INSERT INTO `library_commit_sublayers` VALUES (974,'36aa463d0f734b3aa022ffe653725346','b0139ba504424ad19375030753158e2f');
INSERT INTO `library_commit_sublayers` VALUES (975,'36aa463d0f734b3aa022ffe653725346','e1c9c9e2ef4345dd9e1b36db525ae4a9');
INSERT INTO `library_commit_sublayers` VALUES (976,'36aa463d0f734b3aa022ffe653725346','1f000c9eedc84e458947291d521c87fc');
INSERT INTO `library_commit_sublayers` VALUES (977,'36aa463d0f734b3aa022ffe653725346','613c7b79d62f4164bf18962fd8eb7e32');
INSERT INTO `library_commit_sublayers` VALUES (978,'36aa463d0f734b3aa022ffe653725346','1ba28eaf0a994d6298b37e336f7a0597');
INSERT INTO `library_commit_sublayers` VALUES (979,'36aa463d0f734b3aa022ffe653725346','470315f0e5b04b1d93fde2d51a9c475f');
INSERT INTO `library_commit_sublayers` VALUES (980,'36aa463d0f734b3aa022ffe653725346','c1a5b3edd13a4386b1ddb6d1feab6bf9');
INSERT INTO `library_commit_sublayers` VALUES (981,'120dac7a0ece4eeea9f899d49278f482','4b369df0ea6846c8877f701d1984b20c');
INSERT INTO `library_commit_sublayers` VALUES (982,'120dac7a0ece4eeea9f899d49278f482','02ff5ee47a1a45faa0d72dccddd986ce');
INSERT INTO `library_commit_sublayers` VALUES (983,'120dac7a0ece4eeea9f899d49278f482','c694b0fff62d482b998e316cb0c318d5');
INSERT INTO `library_commit_sublayers` VALUES (984,'120dac7a0ece4eeea9f899d49278f482','7a36ddc45e8f4a89b68ca2fe2bdab9fa');
INSERT INTO `library_commit_sublayers` VALUES (985,'120dac7a0ece4eeea9f899d49278f482','6915ddd90c4c48919c43ae5b55d3f37f');
INSERT INTO `library_commit_sublayers` VALUES (986,'120dac7a0ece4eeea9f899d49278f482','a04968c7f05b43d0ad30f2f57bb84cc2');
INSERT INTO `library_commit_sublayers` VALUES (987,'120dac7a0ece4eeea9f899d49278f482','5a4558809b864698937cd35cb1439ef9');
INSERT INTO `library_commit_sublayers` VALUES (988,'120dac7a0ece4eeea9f899d49278f482','7a8dcc4549c34975bf7e63168f4c5ec9');
INSERT INTO `library_commit_sublayers` VALUES (989,'120dac7a0ece4eeea9f899d49278f482','105d3dbfeb5d4d3e90807dd3f98e67a2');
INSERT INTO `library_commit_sublayers` VALUES (990,'120dac7a0ece4eeea9f899d49278f482','8391c408185c4b4ab64dbe3699844e66');
INSERT INTO `library_commit_sublayers` VALUES (991,'120dac7a0ece4eeea9f899d49278f482','ec7ac7049638460d892800d69cf15a18');
INSERT INTO `library_commit_sublayers` VALUES (992,'eeb642f099bd494e80b14360a417f6e4','b1dd8437c6a743869daee2ca7d0c21c2');
INSERT INTO `library_commit_sublayers` VALUES (993,'eeb642f099bd494e80b14360a417f6e4','65ce451509704763a5958d60883fafae');
INSERT INTO `library_commit_sublayers` VALUES (994,'eeb642f099bd494e80b14360a417f6e4','e35a85d19b3d459ba371e54344f616d1');
INSERT INTO `library_commit_sublayers` VALUES (995,'eeb642f099bd494e80b14360a417f6e4','d1b78a3061c3480d8c94ba19644a104e');
INSERT INTO `library_commit_sublayers` VALUES (996,'eeb642f099bd494e80b14360a417f6e4','0e511a86742048bfbc293f6493fc1e8e');
INSERT INTO `library_commit_sublayers` VALUES (997,'eeb642f099bd494e80b14360a417f6e4','f4c7d41169064909b45846b67d45cca5');
INSERT INTO `library_commit_sublayers` VALUES (998,'eeb642f099bd494e80b14360a417f6e4','0b62bad88f004b299e701713f154b8c5');
INSERT INTO `library_commit_sublayers` VALUES (999,'eeb642f099bd494e80b14360a417f6e4','fe7ee7b07fbe4b7fac9a57fa18a457b8');
INSERT INTO `library_commit_sublayers` VALUES (1000,'eeb642f099bd494e80b14360a417f6e4','40a335b8eec74416bc51663a00577f51');
INSERT INTO `library_commit_sublayers` VALUES (1001,'eeb642f099bd494e80b14360a417f6e4','5fc09830dd8646e3a5a62befa9939389');
INSERT INTO `library_commit_sublayers` VALUES (1002,'eeb642f099bd494e80b14360a417f6e4','e915918ec6304bf18889369dceee7f19');
INSERT INTO `library_commit_sublayers` VALUES (1003,'8d2707e3036c4e66b16a37a64afac8af','42e205706d5a457cbedb5d09d46b78aa');
INSERT INTO `library_commit_sublayers` VALUES (1004,'8d2707e3036c4e66b16a37a64afac8af','f326d3b9d5034fce8d24d6fd2f6cc6f0');
INSERT INTO `library_commit_sublayers` VALUES (1005,'8d2707e3036c4e66b16a37a64afac8af','9a9f15cf776d41fe8ff51be25bf543ea');
INSERT INTO `library_commit_sublayers` VALUES (1006,'8d2707e3036c4e66b16a37a64afac8af','e71aeb471e274ad79fee0e33d0a60911');
INSERT INTO `library_commit_sublayers` VALUES (1007,'8d2707e3036c4e66b16a37a64afac8af','3e84b6d2f2cf432e944a953323bad587');
INSERT INTO `library_commit_sublayers` VALUES (1008,'8d2707e3036c4e66b16a37a64afac8af','c6062cabfa264cfba352e7bc2c70933f');
INSERT INTO `library_commit_sublayers` VALUES (1009,'8d2707e3036c4e66b16a37a64afac8af','4dfce3ca563341e6a3f840a532b4eeaa');
INSERT INTO `library_commit_sublayers` VALUES (1010,'8d2707e3036c4e66b16a37a64afac8af','e3f6397b989943a3a88f7ecd429cb2bc');
INSERT INTO `library_commit_sublayers` VALUES (1011,'8d2707e3036c4e66b16a37a64afac8af','897d12f9f09845309268dc64146ce651');
INSERT INTO `library_commit_sublayers` VALUES (1012,'8d2707e3036c4e66b16a37a64afac8af','29e4e267083f4377a9820ebd2c8241f3');
INSERT INTO `library_commit_sublayers` VALUES (1013,'8d2707e3036c4e66b16a37a64afac8af','5f7e50854d0947ca85b40649482faed3');
INSERT INTO `library_commit_sublayers` VALUES (1014,'8cc993b07503485798ae74150d47a54e','efb956ed34b24072aaafce9658041d12');
INSERT INTO `library_commit_sublayers` VALUES (1015,'8cc993b07503485798ae74150d47a54e','9afdcb35807a4cf0b8c5dc5ab6b073d9');
INSERT INTO `library_commit_sublayers` VALUES (1016,'8cc993b07503485798ae74150d47a54e','987f61f760db43139772715a1f9792e3');
INSERT INTO `library_commit_sublayers` VALUES (1017,'8cc993b07503485798ae74150d47a54e','2850ee55abad448eb55cbd5731489408');
INSERT INTO `library_commit_sublayers` VALUES (1018,'8cc993b07503485798ae74150d47a54e','6ffcd8cf12a047df9616bdc187b82e0d');
INSERT INTO `library_commit_sublayers` VALUES (1019,'8cc993b07503485798ae74150d47a54e','196f3585431344608bcf683f832494df');
INSERT INTO `library_commit_sublayers` VALUES (1020,'8cc993b07503485798ae74150d47a54e','eaa82bc3155e405c9fa24a1c67a8f3aa');
INSERT INTO `library_commit_sublayers` VALUES (1021,'8cc993b07503485798ae74150d47a54e','f55e093b65dc44cf80d2c6fb3138a0f3');
INSERT INTO `library_commit_sublayers` VALUES (1022,'8cc993b07503485798ae74150d47a54e','ed40ce249737478895e91942a8bfd0f2');
INSERT INTO `library_commit_sublayers` VALUES (1023,'8cc993b07503485798ae74150d47a54e','8273657b4be2496f9ba3e2400838a1ba');
INSERT INTO `library_commit_sublayers` VALUES (1024,'8cc993b07503485798ae74150d47a54e','1d1f446f61524dc7b2132c4503950a57');
INSERT INTO `library_commit_sublayers` VALUES (1025,'e808b3a9d92e4cb38681289539b59b79','47c0c2f72a214052b1e54290193911de');
INSERT INTO `library_commit_sublayers` VALUES (1026,'e808b3a9d92e4cb38681289539b59b79','6e723540141341eab294bde084954314');
INSERT INTO `library_commit_sublayers` VALUES (1027,'e808b3a9d92e4cb38681289539b59b79','4ccb13c05bca40ecb20f6f9070859990');
INSERT INTO `library_commit_sublayers` VALUES (1028,'e808b3a9d92e4cb38681289539b59b79','82a4cc54f2f6426f9ad5fe397c82332f');
INSERT INTO `library_commit_sublayers` VALUES (1029,'e808b3a9d92e4cb38681289539b59b79','11914cee3d074196a62a3cab9e83abf3');
INSERT INTO `library_commit_sublayers` VALUES (1030,'e808b3a9d92e4cb38681289539b59b79','30434525abdd46e0a1a570badf8aedfb');
INSERT INTO `library_commit_sublayers` VALUES (1031,'e808b3a9d92e4cb38681289539b59b79','d77b3bdce4b44808b44af6b5c2ef1835');
INSERT INTO `library_commit_sublayers` VALUES (1032,'e808b3a9d92e4cb38681289539b59b79','15538a70175c492387e0dcd0a8502570');
INSERT INTO `library_commit_sublayers` VALUES (1033,'e808b3a9d92e4cb38681289539b59b79','97519d3f8e7943d68235336a593c71fb');
INSERT INTO `library_commit_sublayers` VALUES (1034,'e808b3a9d92e4cb38681289539b59b79','415a013d54014eec9e4e2f691bdf21a0');
INSERT INTO `library_commit_sublayers` VALUES (1035,'e808b3a9d92e4cb38681289539b59b79','4450bdd586b34397a334503db64ba9f0');
INSERT INTO `library_commit_sublayers` VALUES (1036,'7dfdde7702cb40bb95e40b4491db644e','2bb85b2c93b34bfeb4dc4550b19ca2a7');
INSERT INTO `library_commit_sublayers` VALUES (1037,'7dfdde7702cb40bb95e40b4491db644e','a6e3cc2adfcb41fea798f80109dcbcac');
INSERT INTO `library_commit_sublayers` VALUES (1038,'7dfdde7702cb40bb95e40b4491db644e','cf87ea52ed314a579985063ffe917c1b');
INSERT INTO `library_commit_sublayers` VALUES (1039,'7dfdde7702cb40bb95e40b4491db644e','de264366c02042429cf2e68684930d31');
INSERT INTO `library_commit_sublayers` VALUES (1040,'7dfdde7702cb40bb95e40b4491db644e','65f6b4cf759f47fea8bc359bd08a3102');
INSERT INTO `library_commit_sublayers` VALUES (1041,'7dfdde7702cb40bb95e40b4491db644e','a7b0b230cc71488f9f1c757da5af476b');
INSERT INTO `library_commit_sublayers` VALUES (1042,'7dfdde7702cb40bb95e40b4491db644e','89520d261e5c415fa55ae57fc174e698');
INSERT INTO `library_commit_sublayers` VALUES (1043,'7dfdde7702cb40bb95e40b4491db644e','f29a26c3a937455da07a17acf3670830');
INSERT INTO `library_commit_sublayers` VALUES (1044,'7dfdde7702cb40bb95e40b4491db644e','420825d9b4404826a16b13c953efb694');
INSERT INTO `library_commit_sublayers` VALUES (1045,'7dfdde7702cb40bb95e40b4491db644e','7249a4225c1a45a381ada0c764745a81');
INSERT INTO `library_commit_sublayers` VALUES (1046,'7dfdde7702cb40bb95e40b4491db644e','a5c609d1487c4b4ab040379d071ec27f');
INSERT INTO `library_commit_sublayers` VALUES (1047,'9449b06834c6450fb8af0fe247f6986b','1d3a0241d2db4267b9503b9fda0e83bb');
INSERT INTO `library_commit_sublayers` VALUES (1048,'9449b06834c6450fb8af0fe247f6986b','3f0cea7a77334b209ae19e8d009c666c');
INSERT INTO `library_commit_sublayers` VALUES (1049,'9449b06834c6450fb8af0fe247f6986b','24326c945703440099882bde173469f5');
INSERT INTO `library_commit_sublayers` VALUES (1050,'9449b06834c6450fb8af0fe247f6986b','a854319d15124a20bc5d885e64b920f5');
INSERT INTO `library_commit_sublayers` VALUES (1051,'9449b06834c6450fb8af0fe247f6986b','7ca1bff0650a47cf93fb9cf8860d248e');
INSERT INTO `library_commit_sublayers` VALUES (1052,'9449b06834c6450fb8af0fe247f6986b','9ccad3addfa745c8beeaaa41d951c69f');
INSERT INTO `library_commit_sublayers` VALUES (1053,'9449b06834c6450fb8af0fe247f6986b','b0822f39adc74e97b4b3d9d9eb109725');
INSERT INTO `library_commit_sublayers` VALUES (1054,'9449b06834c6450fb8af0fe247f6986b','434f084b3cc94f54870a835dc4068b1e');
INSERT INTO `library_commit_sublayers` VALUES (1055,'9449b06834c6450fb8af0fe247f6986b','e268d3bb61ac4426af66f4e625638f26');
INSERT INTO `library_commit_sublayers` VALUES (1056,'9449b06834c6450fb8af0fe247f6986b','6a43f20ab25a4d1cb053a6e5610c1414');
INSERT INTO `library_commit_sublayers` VALUES (1057,'9449b06834c6450fb8af0fe247f6986b','d4d0d5def2d940bc83a432d8ae1555e5');
INSERT INTO `library_commit_sublayers` VALUES (1058,'5f6c93b60cd34ee8a81d7a5e5adf3cb2','7eb4453922c946c8b6b67dd53a05bbfd');
INSERT INTO `library_commit_sublayers` VALUES (1059,'5f6c93b60cd34ee8a81d7a5e5adf3cb2','1976415984ba40dd95147cb820abeb8c');
INSERT INTO `library_commit_sublayers` VALUES (1060,'5f6c93b60cd34ee8a81d7a5e5adf3cb2','62b163999d5f43ea96b80d3b8cac0de2');
INSERT INTO `library_commit_sublayers` VALUES (1061,'5f6c93b60cd34ee8a81d7a5e5adf3cb2','2c5b31a180fe4742988ef7c967744713');
INSERT INTO `library_commit_sublayers` VALUES (1062,'5f6c93b60cd34ee8a81d7a5e5adf3cb2','a6ed7675d1a54ba08165aaf14bd0e5e6');
INSERT INTO `library_commit_sublayers` VALUES (1063,'5f6c93b60cd34ee8a81d7a5e5adf3cb2','04a86ed460474a82ae8bd169ada4badf');
INSERT INTO `library_commit_sublayers` VALUES (1064,'5f6c93b60cd34ee8a81d7a5e5adf3cb2','d4607d8a96064df58cd9a83e3aa52676');
INSERT INTO `library_commit_sublayers` VALUES (1065,'5f6c93b60cd34ee8a81d7a5e5adf3cb2','42b5cafd57104017acb7c22bb4514c2a');
INSERT INTO `library_commit_sublayers` VALUES (1066,'5f6c93b60cd34ee8a81d7a5e5adf3cb2','058c120ff7224b0dbdcf0536ae36c04b');
INSERT INTO `library_commit_sublayers` VALUES (1067,'5f6c93b60cd34ee8a81d7a5e5adf3cb2','2d3a182f04634a928c3b4dc32e43c4dd');
INSERT INTO `library_commit_sublayers` VALUES (1068,'5f6c93b60cd34ee8a81d7a5e5adf3cb2','ee9209c1333c4e63bd767b44c9f99606');
INSERT INTO `library_commit_sublayers` VALUES (1069,'f8979937617f49acbf7aaffdc1c14a65','cfe47a8191e345e8bb73232e698dec67');
INSERT INTO `library_commit_sublayers` VALUES (1070,'f8979937617f49acbf7aaffdc1c14a65','9896e3b87b31442098f032dfd7245ab7');
INSERT INTO `library_commit_sublayers` VALUES (1071,'f8979937617f49acbf7aaffdc1c14a65','d7f256426dd64b87a1e2a352454370f3');
INSERT INTO `library_commit_sublayers` VALUES (1072,'f8979937617f49acbf7aaffdc1c14a65','262aeb1dd7db40acade3e89865a85119');
INSERT INTO `library_commit_sublayers` VALUES (1073,'f8979937617f49acbf7aaffdc1c14a65','da479eef03bf4499a2cd98cfbcb99466');
INSERT INTO `library_commit_sublayers` VALUES (1074,'f8979937617f49acbf7aaffdc1c14a65','77632510dbf640bdac036c7c42cb8401');
INSERT INTO `library_commit_sublayers` VALUES (1075,'f8979937617f49acbf7aaffdc1c14a65','45ed8adde0f844cea142ccacaf7df069');
INSERT INTO `library_commit_sublayers` VALUES (1076,'f8979937617f49acbf7aaffdc1c14a65','70655e6097d44557bf2f4aadc6efbef5');
INSERT INTO `library_commit_sublayers` VALUES (1077,'f8979937617f49acbf7aaffdc1c14a65','55c7101390f24e14a71b3af0f85e7b7d');
INSERT INTO `library_commit_sublayers` VALUES (1078,'f8979937617f49acbf7aaffdc1c14a65','2cb5d35a05974a028ae5c5affb69e9fd');
INSERT INTO `library_commit_sublayers` VALUES (1079,'f8979937617f49acbf7aaffdc1c14a65','643034dc0aff4bfc89cb4ce76a3be682');
INSERT INTO `library_commit_sublayers` VALUES (1080,'4b93edfdcd39457387013acc8365ba8f','6443a16c57e646a2a6833175e7dc5612');
INSERT INTO `library_commit_sublayers` VALUES (1081,'4b93edfdcd39457387013acc8365ba8f','0088463b0f194644a352742e3f39efbc');
INSERT INTO `library_commit_sublayers` VALUES (1082,'4b93edfdcd39457387013acc8365ba8f','79876a66a31c405ea57f91611117dd0f');
INSERT INTO `library_commit_sublayers` VALUES (1083,'4b93edfdcd39457387013acc8365ba8f','90b7aaa2b91e4bf697d939c7310026af');
INSERT INTO `library_commit_sublayers` VALUES (1084,'4b93edfdcd39457387013acc8365ba8f','3ca2c865e5e54756a61895b07bb919a4');
INSERT INTO `library_commit_sublayers` VALUES (1085,'4b93edfdcd39457387013acc8365ba8f','f83871010d1a4ac8a38348e10fd8f36b');
INSERT INTO `library_commit_sublayers` VALUES (1086,'4b93edfdcd39457387013acc8365ba8f','a1dc2a64624d41da88c55cb584c41a1b');
INSERT INTO `library_commit_sublayers` VALUES (1087,'4b93edfdcd39457387013acc8365ba8f','ce7c0d8e992c44ad8832d99944c08053');
INSERT INTO `library_commit_sublayers` VALUES (1088,'4b93edfdcd39457387013acc8365ba8f','1ddc397cb7a14914b0392f281e6cd7aa');
INSERT INTO `library_commit_sublayers` VALUES (1089,'4b93edfdcd39457387013acc8365ba8f','8f22f0391652427e8425897ae53134c0');
INSERT INTO `library_commit_sublayers` VALUES (1090,'4b93edfdcd39457387013acc8365ba8f','26a33128d19244c3a08d369cd6c587f6');
INSERT INTO `library_commit_sublayers` VALUES (1091,'5b2f005ce7204d98867f315dc4b69391','fb2dd53b7f3641ad8413588e589a2b96');
INSERT INTO `library_commit_sublayers` VALUES (1092,'5b2f005ce7204d98867f315dc4b69391','c0aa8a9128be4b0687449ba7ed3dc8be');
INSERT INTO `library_commit_sublayers` VALUES (1093,'5b2f005ce7204d98867f315dc4b69391','0c79d56559a1438fa324efbf80972103');
INSERT INTO `library_commit_sublayers` VALUES (1094,'5b2f005ce7204d98867f315dc4b69391','9086d4fb2b58418f8cd4924926fd1a85');
INSERT INTO `library_commit_sublayers` VALUES (1095,'5b2f005ce7204d98867f315dc4b69391','23577d9c98be4ad29ee1464e2037f4a8');
INSERT INTO `library_commit_sublayers` VALUES (1096,'5b2f005ce7204d98867f315dc4b69391','c42afd37488541c283de2f2db00950c5');
INSERT INTO `library_commit_sublayers` VALUES (1097,'5b2f005ce7204d98867f315dc4b69391','5fbdee6b07fb49439e03c80dd42acbfc');
INSERT INTO `library_commit_sublayers` VALUES (1098,'5b2f005ce7204d98867f315dc4b69391','55ce59095e8146c1a1e7443d245239af');
INSERT INTO `library_commit_sublayers` VALUES (1099,'5b2f005ce7204d98867f315dc4b69391','ade15b27414448e8a14840b20b06de04');
INSERT INTO `library_commit_sublayers` VALUES (1100,'5b2f005ce7204d98867f315dc4b69391','f8847fe823114dc78f115fb1b587567c');
INSERT INTO `library_commit_sublayers` VALUES (1101,'5b2f005ce7204d98867f315dc4b69391','e72dc3973fdf4ecb8c23d6a2306ccfe2');
INSERT INTO `library_commit_sublayers` VALUES (1102,'4d8c770d3eab414d98c79ec33c8c8fc9','8f978088612a4799b46bbe997ea77612');
INSERT INTO `library_commit_sublayers` VALUES (1103,'4d8c770d3eab414d98c79ec33c8c8fc9','44996929c1ba4e4d8143b918cdd53289');
INSERT INTO `library_commit_sublayers` VALUES (1104,'4d8c770d3eab414d98c79ec33c8c8fc9','910676f571c74864bf276cb7c56849fe');
INSERT INTO `library_commit_sublayers` VALUES (1105,'4d8c770d3eab414d98c79ec33c8c8fc9','456ddded57364b22bf0f9945413a4621');
INSERT INTO `library_commit_sublayers` VALUES (1106,'4d8c770d3eab414d98c79ec33c8c8fc9','167719843cd14d0a987590eacb22f251');
INSERT INTO `library_commit_sublayers` VALUES (1107,'4d8c770d3eab414d98c79ec33c8c8fc9','e77999b583304a60a647aa73549d1e92');
INSERT INTO `library_commit_sublayers` VALUES (1108,'4d8c770d3eab414d98c79ec33c8c8fc9','b8d5f23f5dc74420b23fdeb8a7dd66df');
INSERT INTO `library_commit_sublayers` VALUES (1109,'4d8c770d3eab414d98c79ec33c8c8fc9','894edf11ac264519b60197b3cf152065');
INSERT INTO `library_commit_sublayers` VALUES (1110,'4d8c770d3eab414d98c79ec33c8c8fc9','9267639666f64f6aa4f4078ada24e43e');
INSERT INTO `library_commit_sublayers` VALUES (1111,'4d8c770d3eab414d98c79ec33c8c8fc9','273cb6890b024cc7b858be9e705e6ef3');
INSERT INTO `library_commit_sublayers` VALUES (1112,'4d8c770d3eab414d98c79ec33c8c8fc9','9c8e74e411514008a254803fbef59caf');
INSERT INTO `library_commit_sublayers` VALUES (1113,'895d7506a994461781cd1d45e9a76a61','20a72e4175f64531bb1cd9031b49140e');
INSERT INTO `library_commit_sublayers` VALUES (1114,'895d7506a994461781cd1d45e9a76a61','13e830ff238848df8943cfb853c367c6');
INSERT INTO `library_commit_sublayers` VALUES (1115,'895d7506a994461781cd1d45e9a76a61','44668f024f9f4d9f91c6c5fab93b73bc');
INSERT INTO `library_commit_sublayers` VALUES (1116,'895d7506a994461781cd1d45e9a76a61','9f3fad4f9d8d425d82624ad4f4b42db7');
INSERT INTO `library_commit_sublayers` VALUES (1117,'895d7506a994461781cd1d45e9a76a61','bd5649a8bfcb4ac795e5219042cde4df');
INSERT INTO `library_commit_sublayers` VALUES (1118,'895d7506a994461781cd1d45e9a76a61','32023482c25c48e5a14939f4326a6013');
INSERT INTO `library_commit_sublayers` VALUES (1119,'895d7506a994461781cd1d45e9a76a61','11aa09e4c25c4e9fb02455e309552dcb');
INSERT INTO `library_commit_sublayers` VALUES (1120,'895d7506a994461781cd1d45e9a76a61','22fe3bf444ed403cb8b9c3da1b07f5a0');
INSERT INTO `library_commit_sublayers` VALUES (1121,'895d7506a994461781cd1d45e9a76a61','a37084a4e342445ca6669bad9df70526');
INSERT INTO `library_commit_sublayers` VALUES (1122,'895d7506a994461781cd1d45e9a76a61','20263d4a4f044f58bee85163086207e6');
INSERT INTO `library_commit_sublayers` VALUES (1123,'895d7506a994461781cd1d45e9a76a61','cce48ceaa7fa42d58d4670a31b873b19');
INSERT INTO `library_commit_sublayers` VALUES (1124,'b0cdc992c7b44dd7858ec1e6ab30478e','31f0bb8e21d94f09bee545dcf8e4a266');
INSERT INTO `library_commit_sublayers` VALUES (1125,'b0cdc992c7b44dd7858ec1e6ab30478e','292058e734a44c05a559825dc82045a9');
INSERT INTO `library_commit_sublayers` VALUES (1126,'b0cdc992c7b44dd7858ec1e6ab30478e','b43eafc11d584b1f8d78a85673d4b09c');
INSERT INTO `library_commit_sublayers` VALUES (1127,'b0cdc992c7b44dd7858ec1e6ab30478e','177a06e9848041a9a03fc50ab4fd2935');
INSERT INTO `library_commit_sublayers` VALUES (1128,'b0cdc992c7b44dd7858ec1e6ab30478e','314692c096034e2e9cb62cb1dbf680e9');
INSERT INTO `library_commit_sublayers` VALUES (1129,'b0cdc992c7b44dd7858ec1e6ab30478e','3b8c391fdda44518ae4c5ba3c738b51a');
INSERT INTO `library_commit_sublayers` VALUES (1130,'b0cdc992c7b44dd7858ec1e6ab30478e','849cd44d6b6e4f66b5f9db86df328e58');
INSERT INTO `library_commit_sublayers` VALUES (1131,'b0cdc992c7b44dd7858ec1e6ab30478e','2aa4978084a9432d9334aee932629e9a');
INSERT INTO `library_commit_sublayers` VALUES (1132,'b0cdc992c7b44dd7858ec1e6ab30478e','891d2195a05747828548471c4453f53e');
INSERT INTO `library_commit_sublayers` VALUES (1133,'b0cdc992c7b44dd7858ec1e6ab30478e','e6c53af2df0d41018c6e756101bd3eef');
INSERT INTO `library_commit_sublayers` VALUES (1134,'b0cdc992c7b44dd7858ec1e6ab30478e','0b942a5a9b3a42089bfdb3613002b3f3');
INSERT INTO `library_commit_sublayers` VALUES (1135,'28742f194d4d4dab9c62f34a25321753','1a31d936de2240bc905da5a3cf712d19');
INSERT INTO `library_commit_sublayers` VALUES (1136,'28742f194d4d4dab9c62f34a25321753','b315a23ac5f343beb3e4f63856bb38e7');
INSERT INTO `library_commit_sublayers` VALUES (1137,'28742f194d4d4dab9c62f34a25321753','4d9c89aaef4743718613e10cf22cd5ae');
INSERT INTO `library_commit_sublayers` VALUES (1138,'28742f194d4d4dab9c62f34a25321753','f67679b483b24e9ca69f7943b2008fad');
INSERT INTO `library_commit_sublayers` VALUES (1139,'28742f194d4d4dab9c62f34a25321753','488b4397d04543e4882bf3b57360219a');
INSERT INTO `library_commit_sublayers` VALUES (1140,'28742f194d4d4dab9c62f34a25321753','0588edc6b802488ebd9ae5e60016d03b');
INSERT INTO `library_commit_sublayers` VALUES (1141,'28742f194d4d4dab9c62f34a25321753','845ed7ac72f64ccd8fb1c3a3b37b9845');
INSERT INTO `library_commit_sublayers` VALUES (1142,'28742f194d4d4dab9c62f34a25321753','d32b6bd3115146d29325cb591d96532b');
INSERT INTO `library_commit_sublayers` VALUES (1143,'28742f194d4d4dab9c62f34a25321753','74f347db7aad47bfa905525b2944147a');
INSERT INTO `library_commit_sublayers` VALUES (1144,'28742f194d4d4dab9c62f34a25321753','9b90b2a5132b4a34a9ece4f68816b2ea');
INSERT INTO `library_commit_sublayers` VALUES (1145,'28742f194d4d4dab9c62f34a25321753','50f56f77e4b644069ceca7e1e4967072');
INSERT INTO `library_commit_sublayers` VALUES (1146,'6890728fcdc843919bbacd395c7e3f34','42e66c127fb841f2bafc4a1036a7487b');
INSERT INTO `library_commit_sublayers` VALUES (1147,'6890728fcdc843919bbacd395c7e3f34','fc4a6703c303439ca99c5559158bffc1');
INSERT INTO `library_commit_sublayers` VALUES (1148,'6890728fcdc843919bbacd395c7e3f34','5174e0a856434d9895cfd1306d33ab4c');
INSERT INTO `library_commit_sublayers` VALUES (1149,'6890728fcdc843919bbacd395c7e3f34','f83eee41bc4140f0a859cb68c2d75c84');
INSERT INTO `library_commit_sublayers` VALUES (1150,'6890728fcdc843919bbacd395c7e3f34','4b6d1ccecd6f4c66a1dc613d92e82260');
INSERT INTO `library_commit_sublayers` VALUES (1151,'6890728fcdc843919bbacd395c7e3f34','0a592adda02747c494aff95c16e915e5');
INSERT INTO `library_commit_sublayers` VALUES (1152,'6890728fcdc843919bbacd395c7e3f34','577c5cb434cb434da9b12ba75a926c2a');
INSERT INTO `library_commit_sublayers` VALUES (1153,'6890728fcdc843919bbacd395c7e3f34','666fb28013094749b7b912c98b103588');
INSERT INTO `library_commit_sublayers` VALUES (1154,'6890728fcdc843919bbacd395c7e3f34','29d983dbf8eb43ddab1dd7e533057f1b');
INSERT INTO `library_commit_sublayers` VALUES (1155,'6890728fcdc843919bbacd395c7e3f34','e0dd7ace2dc5410fb4b83b2f369a7ac4');
INSERT INTO `library_commit_sublayers` VALUES (1156,'6890728fcdc843919bbacd395c7e3f34','dd7a16bb1c144ae3a5bddd7dd9f66ec9');
INSERT INTO `library_commit_sublayers` VALUES (1157,'8e9f753a4aa64feea0093d3dcba28e2c','a424c9d55c1f4839bd3fb4107a8c9eae');
INSERT INTO `library_commit_sublayers` VALUES (1158,'8e9f753a4aa64feea0093d3dcba28e2c','3e227b8016c24dabb27088ea2dd6ff38');
INSERT INTO `library_commit_sublayers` VALUES (1159,'8e9f753a4aa64feea0093d3dcba28e2c','d6e20551ee4846f884ae03ff0ebbee13');
INSERT INTO `library_commit_sublayers` VALUES (1160,'8e9f753a4aa64feea0093d3dcba28e2c','5e31d66700894fcf90426c5dd113c4b9');
INSERT INTO `library_commit_sublayers` VALUES (1161,'8e9f753a4aa64feea0093d3dcba28e2c','98a9fcca05514bba88148673478fe693');
INSERT INTO `library_commit_sublayers` VALUES (1162,'8e9f753a4aa64feea0093d3dcba28e2c','f81db5ae4f4745318f53f03910016244');
INSERT INTO `library_commit_sublayers` VALUES (1163,'8e9f753a4aa64feea0093d3dcba28e2c','65d9d7a798804d68a003e1ae3b328a2e');
INSERT INTO `library_commit_sublayers` VALUES (1164,'8e9f753a4aa64feea0093d3dcba28e2c','0628ce47c36643368c7d3c8f693dbc05');
INSERT INTO `library_commit_sublayers` VALUES (1165,'8e9f753a4aa64feea0093d3dcba28e2c','43f377eb033d4d788d1cbac5835daca2');
INSERT INTO `library_commit_sublayers` VALUES (1166,'8e9f753a4aa64feea0093d3dcba28e2c','99718ae126224cb68d22425dcda4613f');
INSERT INTO `library_commit_sublayers` VALUES (1167,'8e9f753a4aa64feea0093d3dcba28e2c','718cd2dbb06947e984f890d17fa787f2');
INSERT INTO `library_commit_sublayers` VALUES (1168,'da7402477eee4071bd7ec1d3cbb33bda','34c4303bfb5a49cd84a73c1ba2c02448');
INSERT INTO `library_commit_sublayers` VALUES (1169,'da7402477eee4071bd7ec1d3cbb33bda','29db8cfba4ff4bacabf45c5d1ba81536');
INSERT INTO `library_commit_sublayers` VALUES (1170,'da7402477eee4071bd7ec1d3cbb33bda','80f7589f112149b7907301bb9181182d');
INSERT INTO `library_commit_sublayers` VALUES (1171,'da7402477eee4071bd7ec1d3cbb33bda','5f10494503304c6e82ce250a7ee31493');
INSERT INTO `library_commit_sublayers` VALUES (1172,'da7402477eee4071bd7ec1d3cbb33bda','900ff14a4688484f871633414cb1eb33');
INSERT INTO `library_commit_sublayers` VALUES (1173,'da7402477eee4071bd7ec1d3cbb33bda','b88a4e237a8941e3af745c2d9df5f688');
INSERT INTO `library_commit_sublayers` VALUES (1174,'da7402477eee4071bd7ec1d3cbb33bda','c66539af392f4bb18897c6f571f7ab79');
INSERT INTO `library_commit_sublayers` VALUES (1175,'da7402477eee4071bd7ec1d3cbb33bda','0111c899e8414c0499e4082cfdee8f52');
INSERT INTO `library_commit_sublayers` VALUES (1176,'da7402477eee4071bd7ec1d3cbb33bda','bb18fd48ae174a28ad444811f3870a46');
INSERT INTO `library_commit_sublayers` VALUES (1177,'da7402477eee4071bd7ec1d3cbb33bda','a0c3bb4f639d427182933436e9351209');
INSERT INTO `library_commit_sublayers` VALUES (1178,'da7402477eee4071bd7ec1d3cbb33bda','8482628580214c3e98ccdd3f0eced6a9');
INSERT INTO `library_commit_sublayers` VALUES (1179,'a2de5163675145199fd7fd4b2fafee54','e9793d8b4198450dbb61673e79132218');
INSERT INTO `library_commit_sublayers` VALUES (1180,'a2de5163675145199fd7fd4b2fafee54','0ab4e9667abd4a449df4c80bc8c236ba');
INSERT INTO `library_commit_sublayers` VALUES (1181,'a2de5163675145199fd7fd4b2fafee54','3ccfb807e17e4d2ba5119fe4edbd41b7');
INSERT INTO `library_commit_sublayers` VALUES (1182,'a2de5163675145199fd7fd4b2fafee54','c4ecb9696fe24c74b7143b1aa7d94892');
INSERT INTO `library_commit_sublayers` VALUES (1183,'a2de5163675145199fd7fd4b2fafee54','4230fc81f5b240e495c198eb0a70e7f8');
INSERT INTO `library_commit_sublayers` VALUES (1184,'a2de5163675145199fd7fd4b2fafee54','1243e6596de74c4d9780d8bb4c2fecbe');
INSERT INTO `library_commit_sublayers` VALUES (1185,'a2de5163675145199fd7fd4b2fafee54','7677b517c7f54af19fafe6fd921e8f0c');
INSERT INTO `library_commit_sublayers` VALUES (1186,'a2de5163675145199fd7fd4b2fafee54','590c4e14837b48e2ba26ecf2a7a14bac');
INSERT INTO `library_commit_sublayers` VALUES (1187,'a2de5163675145199fd7fd4b2fafee54','800a488cd52c4b5db24bfce17fc35010');
INSERT INTO `library_commit_sublayers` VALUES (1188,'a2de5163675145199fd7fd4b2fafee54','64f14c9748c543b4914dcb6887d25301');
INSERT INTO `library_commit_sublayers` VALUES (1189,'a2de5163675145199fd7fd4b2fafee54','2a2d9be80b0f43cc8d8def245a0b4091');
INSERT INTO `library_commit_sublayers` VALUES (1190,'dc0156eb7a8a4dbf8e08675f3d259c93','46a12350a93b46d4b1d0d81a5de875b3');
INSERT INTO `library_commit_sublayers` VALUES (1191,'dc0156eb7a8a4dbf8e08675f3d259c93','98c1207fed2f4674a22292b013d06282');
INSERT INTO `library_commit_sublayers` VALUES (1192,'dc0156eb7a8a4dbf8e08675f3d259c93','5547bc701cd042d394161e00fedeaedd');
INSERT INTO `library_commit_sublayers` VALUES (1193,'dc0156eb7a8a4dbf8e08675f3d259c93','ba62d83ed4c345ea8a91a9b0eda947ed');
INSERT INTO `library_commit_sublayers` VALUES (1194,'dc0156eb7a8a4dbf8e08675f3d259c93','b219fb6ab07f4e4cbb59a6072239387f');
INSERT INTO `library_commit_sublayers` VALUES (1195,'dc0156eb7a8a4dbf8e08675f3d259c93','afaf31f9c3584523a172ca91ce21096a');
INSERT INTO `library_commit_sublayers` VALUES (1196,'dc0156eb7a8a4dbf8e08675f3d259c93','4e783e14a3074926b18a812f20ac34ec');
INSERT INTO `library_commit_sublayers` VALUES (1197,'dc0156eb7a8a4dbf8e08675f3d259c93','71529c397b1549a3b3402d92e5c2329c');
INSERT INTO `library_commit_sublayers` VALUES (1198,'dc0156eb7a8a4dbf8e08675f3d259c93','35b0a06a4db94f8aa051e4c7c43d86f9');
INSERT INTO `library_commit_sublayers` VALUES (1199,'dc0156eb7a8a4dbf8e08675f3d259c93','e8b3f320352041be9c563655a7fe764d');
INSERT INTO `library_commit_sublayers` VALUES (1200,'dc0156eb7a8a4dbf8e08675f3d259c93','70850c530bf94bebb2c44ff3dfed8266');
INSERT INTO `library_commit_sublayers` VALUES (1201,'7d44fdb20dd842fc84224148584fcec2','e66ef97a956a48ab965ee7398f490d2a');
INSERT INTO `library_commit_sublayers` VALUES (1202,'7d44fdb20dd842fc84224148584fcec2','2546305f28f84e12b78b785b56af35e5');
INSERT INTO `library_commit_sublayers` VALUES (1203,'7d44fdb20dd842fc84224148584fcec2','a66f1054c4d14043a42fc736a811f93f');
INSERT INTO `library_commit_sublayers` VALUES (1204,'7d44fdb20dd842fc84224148584fcec2','aa0457d915324c34be87ecee6a9546b6');
INSERT INTO `library_commit_sublayers` VALUES (1205,'7d44fdb20dd842fc84224148584fcec2','8802fef6c68841239c82a6c5ee70402a');
INSERT INTO `library_commit_sublayers` VALUES (1206,'7d44fdb20dd842fc84224148584fcec2','bccf40f382cd44e4b5653ba300511f5a');
INSERT INTO `library_commit_sublayers` VALUES (1207,'7d44fdb20dd842fc84224148584fcec2','e39b8f69f71b41a7a84c46ebfe297af9');
INSERT INTO `library_commit_sublayers` VALUES (1208,'7d44fdb20dd842fc84224148584fcec2','e2392ee6dfa94cddb369bb9668864cca');
INSERT INTO `library_commit_sublayers` VALUES (1209,'7d44fdb20dd842fc84224148584fcec2','522c083cfbed46219c6f1a8262c43073');
INSERT INTO `library_commit_sublayers` VALUES (1210,'7d44fdb20dd842fc84224148584fcec2','06368f52fb104f69ab8d1e3d3fc805aa');
INSERT INTO `library_commit_sublayers` VALUES (1211,'7d44fdb20dd842fc84224148584fcec2','c891920214654b85a6a628f0bccc683a');
INSERT INTO `library_commit_sublayers` VALUES (1212,'31e6612f6a7b4674854857899b69e0bf','e019e40f07f9468f99009971293f9b06');
INSERT INTO `library_commit_sublayers` VALUES (1213,'31e6612f6a7b4674854857899b69e0bf','e425e4269bc647fa91b8dd7888d57773');
INSERT INTO `library_commit_sublayers` VALUES (1214,'31e6612f6a7b4674854857899b69e0bf','207d8051b10640a88f56007c607a11da');
INSERT INTO `library_commit_sublayers` VALUES (1215,'31e6612f6a7b4674854857899b69e0bf','5ed91753b19349129b1fdc560740aedb');
INSERT INTO `library_commit_sublayers` VALUES (1216,'31e6612f6a7b4674854857899b69e0bf','0bf4b1079eb24185a302e98101e4fa98');
INSERT INTO `library_commit_sublayers` VALUES (1217,'31e6612f6a7b4674854857899b69e0bf','22195941935345419828e1245f44ccd2');
INSERT INTO `library_commit_sublayers` VALUES (1218,'31e6612f6a7b4674854857899b69e0bf','1b20353bc07044aba42975297f46c8cc');
INSERT INTO `library_commit_sublayers` VALUES (1219,'31e6612f6a7b4674854857899b69e0bf','ba6e2d345f6b4fcba6970fceda4b15c6');
INSERT INTO `library_commit_sublayers` VALUES (1220,'31e6612f6a7b4674854857899b69e0bf','f252d3b19aa14962b7d80b6aeafb3303');
INSERT INTO `library_commit_sublayers` VALUES (1221,'31e6612f6a7b4674854857899b69e0bf','b4bfb72213294565ad90f94b3787cade');
INSERT INTO `library_commit_sublayers` VALUES (1222,'31e6612f6a7b4674854857899b69e0bf','31e9a8c609774a68b17ae941c783e028');
INSERT INTO `library_commit_sublayers` VALUES (1223,'2700c60e767d4eaca7036b942f2dcffa','47a109aaeea545d1a26caf83b2187986');
INSERT INTO `library_commit_sublayers` VALUES (1224,'2700c60e767d4eaca7036b942f2dcffa','e699b2a7a9f6487db0a116dd89895b23');
INSERT INTO `library_commit_sublayers` VALUES (1225,'2700c60e767d4eaca7036b942f2dcffa','4dc18a0d14e44ec68a0f8cc6e31fdb83');
INSERT INTO `library_commit_sublayers` VALUES (1226,'2700c60e767d4eaca7036b942f2dcffa','9b5add687523439981016b4e6d0ceedc');
INSERT INTO `library_commit_sublayers` VALUES (1227,'2700c60e767d4eaca7036b942f2dcffa','44a6f61f3778439fa98dc591044ffb41');
INSERT INTO `library_commit_sublayers` VALUES (1228,'2700c60e767d4eaca7036b942f2dcffa','644728309af74f4b88d1e575c7dfa77d');
INSERT INTO `library_commit_sublayers` VALUES (1229,'2700c60e767d4eaca7036b942f2dcffa','7f1c9cb63ba0449aa6783d4599308e22');
INSERT INTO `library_commit_sublayers` VALUES (1230,'2700c60e767d4eaca7036b942f2dcffa','2d6db51f93e24cba94cc5149152c81d8');
INSERT INTO `library_commit_sublayers` VALUES (1231,'2700c60e767d4eaca7036b942f2dcffa','861ce5fc35b647ada00750a4308f1ced');
INSERT INTO `library_commit_sublayers` VALUES (1232,'2700c60e767d4eaca7036b942f2dcffa','ed8fc609bcc74e4285677e3b1195408d');
INSERT INTO `library_commit_sublayers` VALUES (1233,'2700c60e767d4eaca7036b942f2dcffa','cbb396fe04c044a2982a942440d475d7');
INSERT INTO `library_commit_sublayers` VALUES (1234,'4f387376a39c4a708ac10bcac5597f6b','889a5d998a0441d39e07c63bd73df0e3');
INSERT INTO `library_commit_sublayers` VALUES (1235,'4f387376a39c4a708ac10bcac5597f6b','6022266471c24248974c80cc9f2d26a7');
INSERT INTO `library_commit_sublayers` VALUES (1236,'4f387376a39c4a708ac10bcac5597f6b','51977504736048a5a6773a3c97790f04');
INSERT INTO `library_commit_sublayers` VALUES (1237,'4f387376a39c4a708ac10bcac5597f6b','3074f9b84f5249e28022543caa890e67');
INSERT INTO `library_commit_sublayers` VALUES (1238,'4f387376a39c4a708ac10bcac5597f6b','55dc624701df4117b2c54c33371839b9');
INSERT INTO `library_commit_sublayers` VALUES (1239,'4f387376a39c4a708ac10bcac5597f6b','9dc7a61449f9433193975b11f33d5dbb');
INSERT INTO `library_commit_sublayers` VALUES (1240,'4f387376a39c4a708ac10bcac5597f6b','3f6012e81bda494488bf99bf9c56b4df');
INSERT INTO `library_commit_sublayers` VALUES (1241,'4f387376a39c4a708ac10bcac5597f6b','e4c5979769e14768aa03a5dec9649cf6');
INSERT INTO `library_commit_sublayers` VALUES (1242,'4f387376a39c4a708ac10bcac5597f6b','7e81c25ef2014af48269eb04ad798557');
INSERT INTO `library_commit_sublayers` VALUES (1243,'4f387376a39c4a708ac10bcac5597f6b','9ed23bd84ce540349146a00274a64f6f');
INSERT INTO `library_commit_sublayers` VALUES (1244,'4f387376a39c4a708ac10bcac5597f6b','b66d8b3aec7f45b7b311fea3d11959f3');
INSERT INTO `library_commit_sublayers` VALUES (1245,'d1f65316fc744d97bfdd428432fe3f8f','99fc4d6ad9114e9dbe7cca0305acf070');
INSERT INTO `library_commit_sublayers` VALUES (1246,'d1f65316fc744d97bfdd428432fe3f8f','4d8cc7b4620c4b4895b1f1fc25daf5ac');
INSERT INTO `library_commit_sublayers` VALUES (1247,'d1f65316fc744d97bfdd428432fe3f8f','6dfbf9f0de554eec812d9d21b7b5b42a');
INSERT INTO `library_commit_sublayers` VALUES (1248,'d1f65316fc744d97bfdd428432fe3f8f','6f148d86d8374ac39a275dff6e9ff153');
INSERT INTO `library_commit_sublayers` VALUES (1249,'d1f65316fc744d97bfdd428432fe3f8f','a4c3479e6f0a45a6869cb5fc796ad151');
INSERT INTO `library_commit_sublayers` VALUES (1250,'d1f65316fc744d97bfdd428432fe3f8f','3f05b8394cfd43fca2ab6ca45f6c3cba');
INSERT INTO `library_commit_sublayers` VALUES (1251,'d1f65316fc744d97bfdd428432fe3f8f','a1882989aa604882939ad8ae78c7adb8');
INSERT INTO `library_commit_sublayers` VALUES (1252,'d1f65316fc744d97bfdd428432fe3f8f','1048634fd2d5455e9ab40b681ad9d71d');
INSERT INTO `library_commit_sublayers` VALUES (1253,'d1f65316fc744d97bfdd428432fe3f8f','c6c4cf849d2d41e7be3539a9e5a2e6c6');
INSERT INTO `library_commit_sublayers` VALUES (1254,'d1f65316fc744d97bfdd428432fe3f8f','10622b8c90434bf68aa72e29d4e2a145');
INSERT INTO `library_commit_sublayers` VALUES (1255,'d1f65316fc744d97bfdd428432fe3f8f','1e83a522c0dd4d979ee9322ad808be7b');
INSERT INTO `library_commit_sublayers` VALUES (1256,'91ecbcb57e2744a6afc8898bc9ef5d7e','881880e45b4848d8a0f55814f61bf8dd');
INSERT INTO `library_commit_sublayers` VALUES (1257,'91ecbcb57e2744a6afc8898bc9ef5d7e','28e6a435811c47bcbc48c0db6e13d055');
INSERT INTO `library_commit_sublayers` VALUES (1258,'91ecbcb57e2744a6afc8898bc9ef5d7e','1dcd7640b41c4d28a0956443c9d4e3b8');
INSERT INTO `library_commit_sublayers` VALUES (1259,'91ecbcb57e2744a6afc8898bc9ef5d7e','f9514cbe94d240a68735d777058c30d4');
INSERT INTO `library_commit_sublayers` VALUES (1260,'91ecbcb57e2744a6afc8898bc9ef5d7e','0c6c71c2e23c4963be5a75bddae22d68');
INSERT INTO `library_commit_sublayers` VALUES (1261,'91ecbcb57e2744a6afc8898bc9ef5d7e','3bde40ddf7294f0ca450e9bf63ea3f97');
INSERT INTO `library_commit_sublayers` VALUES (1262,'91ecbcb57e2744a6afc8898bc9ef5d7e','91bb7e3906e64dd6afbc2e128fa80eb3');
INSERT INTO `library_commit_sublayers` VALUES (1263,'91ecbcb57e2744a6afc8898bc9ef5d7e','554b397acf89404d9a3f6ac0213ba1f0');
INSERT INTO `library_commit_sublayers` VALUES (1264,'91ecbcb57e2744a6afc8898bc9ef5d7e','b5d8f72ae4824757a8a848da7b830c8a');
INSERT INTO `library_commit_sublayers` VALUES (1265,'91ecbcb57e2744a6afc8898bc9ef5d7e','50f58b3f24ce472a80989b9b7d26ee0c');
INSERT INTO `library_commit_sublayers` VALUES (1266,'91ecbcb57e2744a6afc8898bc9ef5d7e','3b71fe4e3ab14d2396655c9b00590c89');
INSERT INTO `library_commit_sublayers` VALUES (1267,'bb00b85140df41709e2631e00ab9829e','796bd0a32844475e8f1837d3ac9f4633');
INSERT INTO `library_commit_sublayers` VALUES (1268,'bb00b85140df41709e2631e00ab9829e','8bfd2deaf2ea4d2a8509c9e20822672f');
INSERT INTO `library_commit_sublayers` VALUES (1269,'bb00b85140df41709e2631e00ab9829e','56569b849fe84b8f8ce8230f9e2e5195');
INSERT INTO `library_commit_sublayers` VALUES (1270,'bb00b85140df41709e2631e00ab9829e','068649ee89964f9a86e289bc4e27a3b4');
INSERT INTO `library_commit_sublayers` VALUES (1271,'bb00b85140df41709e2631e00ab9829e','4958240253004255bafe4d54b26f9fad');
INSERT INTO `library_commit_sublayers` VALUES (1272,'bb00b85140df41709e2631e00ab9829e','3d450a01af6a46ffb936538b3d1370e1');
INSERT INTO `library_commit_sublayers` VALUES (1273,'bb00b85140df41709e2631e00ab9829e','177cd383c45e48b9bab188ba19ae75e4');
INSERT INTO `library_commit_sublayers` VALUES (1274,'bb00b85140df41709e2631e00ab9829e','1afe791cb3b4447a9f760a9b13b73dd8');
INSERT INTO `library_commit_sublayers` VALUES (1275,'bb00b85140df41709e2631e00ab9829e','7d0c6c72883d429795e7c42a54e557bc');
INSERT INTO `library_commit_sublayers` VALUES (1276,'bb00b85140df41709e2631e00ab9829e','5334714ff7614b31924843162ccea03b');
INSERT INTO `library_commit_sublayers` VALUES (1277,'bb00b85140df41709e2631e00ab9829e','bcc68d4a339c4677808e6b36afdea353');
INSERT INTO `library_commit_sublayers` VALUES (1278,'a2da3a9559f24bfb8695e9374b56964f','5463fab1b56c41bd9eae9d0c3d019026');
INSERT INTO `library_commit_sublayers` VALUES (1279,'a2da3a9559f24bfb8695e9374b56964f','cd2038dae8c648b8ad5c80369ab1e510');
INSERT INTO `library_commit_sublayers` VALUES (1280,'a2da3a9559f24bfb8695e9374b56964f','73ce18bfc6ab4a64a4e2799e2d4a0e0c');
INSERT INTO `library_commit_sublayers` VALUES (1281,'a2da3a9559f24bfb8695e9374b56964f','059c3815c37d4247ab56c3db78bd9992');
INSERT INTO `library_commit_sublayers` VALUES (1282,'a2da3a9559f24bfb8695e9374b56964f','251c9e843c784a34b39d9ecabae9cc64');
INSERT INTO `library_commit_sublayers` VALUES (1283,'a2da3a9559f24bfb8695e9374b56964f','90324868d6694763b5098a11fa26df72');
INSERT INTO `library_commit_sublayers` VALUES (1284,'a2da3a9559f24bfb8695e9374b56964f','182722a01ccd4095b3ce997f1b074921');
INSERT INTO `library_commit_sublayers` VALUES (1285,'a2da3a9559f24bfb8695e9374b56964f','c4cbc04b3454426eb6a1eb67a8134fad');
INSERT INTO `library_commit_sublayers` VALUES (1286,'a2da3a9559f24bfb8695e9374b56964f','129f5a8067b44daea69b62adafe2c0c1');
INSERT INTO `library_commit_sublayers` VALUES (1287,'a2da3a9559f24bfb8695e9374b56964f','15664128978b476d8f35b14a40236a2c');
INSERT INTO `library_commit_sublayers` VALUES (1288,'a2da3a9559f24bfb8695e9374b56964f','c4bfc236388d485da0b34dfc309fa7a0');
INSERT INTO `library_commit_sublayers` VALUES (1289,'d1419f8a551b4971b778bc1cd3951283','a1389093858946b088d83b54072c60d4');
INSERT INTO `library_commit_sublayers` VALUES (1290,'d1419f8a551b4971b778bc1cd3951283','1f07dfd7b29c4e4d8470b6a36633b773');
INSERT INTO `library_commit_sublayers` VALUES (1291,'d1419f8a551b4971b778bc1cd3951283','35217b3bc1a34cf0b8f3684299241c58');
INSERT INTO `library_commit_sublayers` VALUES (1292,'d1419f8a551b4971b778bc1cd3951283','02b389704f194aff97d7000a1d95e882');
INSERT INTO `library_commit_sublayers` VALUES (1293,'d1419f8a551b4971b778bc1cd3951283','6650d23a3673400b86f23fd111f749d7');
INSERT INTO `library_commit_sublayers` VALUES (1294,'d1419f8a551b4971b778bc1cd3951283','dbac904598904299aa68e4a4ec3dffae');
INSERT INTO `library_commit_sublayers` VALUES (1295,'d1419f8a551b4971b778bc1cd3951283','6d7bb457a26143f6acb120eda2be45c3');
INSERT INTO `library_commit_sublayers` VALUES (1296,'d1419f8a551b4971b778bc1cd3951283','ef2d70c7134544a5ac3fbdd85c53048a');
INSERT INTO `library_commit_sublayers` VALUES (1297,'d1419f8a551b4971b778bc1cd3951283','adef90df9996437da89a6ece7a4d957c');
INSERT INTO `library_commit_sublayers` VALUES (1298,'d1419f8a551b4971b778bc1cd3951283','c4f46bbd4d5e4a4ba955d263b2a70f08');
INSERT INTO `library_commit_sublayers` VALUES (1299,'d1419f8a551b4971b778bc1cd3951283','62b38c01c21a43beb9eb9885c2d05c11');
INSERT INTO `library_commit_sublayers` VALUES (1300,'dca1e27cc37a4b4089f96fc95e9ed518','93c9372108ef4070a57aeb58a96a02d7');
INSERT INTO `library_commit_sublayers` VALUES (1301,'dca1e27cc37a4b4089f96fc95e9ed518','de1305464c324efb9ecda894b2f3c72f');
INSERT INTO `library_commit_sublayers` VALUES (1302,'dca1e27cc37a4b4089f96fc95e9ed518','bab091e4e17947d4a533fc6f8c6f47d1');
INSERT INTO `library_commit_sublayers` VALUES (1303,'dca1e27cc37a4b4089f96fc95e9ed518','b1761e56b841493288e2b06da883a107');
INSERT INTO `library_commit_sublayers` VALUES (1304,'dca1e27cc37a4b4089f96fc95e9ed518','a104dab9ce3f425496edd37332f6c6fc');
INSERT INTO `library_commit_sublayers` VALUES (1305,'dca1e27cc37a4b4089f96fc95e9ed518','9e206702aa6840c3a0f680eb49a79d28');
INSERT INTO `library_commit_sublayers` VALUES (1306,'dca1e27cc37a4b4089f96fc95e9ed518','b2cfc0bdb34b49368ec3c2b7050b304d');
INSERT INTO `library_commit_sublayers` VALUES (1307,'dca1e27cc37a4b4089f96fc95e9ed518','eee5e0dff33941d48933cb6e4998d1ef');
INSERT INTO `library_commit_sublayers` VALUES (1308,'dca1e27cc37a4b4089f96fc95e9ed518','03719e5ba18f4790a255d57d59d5a70f');
INSERT INTO `library_commit_sublayers` VALUES (1309,'dca1e27cc37a4b4089f96fc95e9ed518','e2b13c8227264e9d8a43628b54890b51');
INSERT INTO `library_commit_sublayers` VALUES (1310,'dca1e27cc37a4b4089f96fc95e9ed518','8fea15aa971244d3b27f9fe0aa29ad13');
INSERT INTO `library_commit_sublayers` VALUES (1311,'dfce60d77cb84ffa95a9c383e8f35bd2','06ebc6d8507648b88244ae1f5d2c64fb');
INSERT INTO `library_commit_sublayers` VALUES (1312,'dfce60d77cb84ffa95a9c383e8f35bd2','73c230f901c8448a80775e5218cde973');
INSERT INTO `library_commit_sublayers` VALUES (1313,'dfce60d77cb84ffa95a9c383e8f35bd2','1ab804f529ba469796e26d62b0926668');
INSERT INTO `library_commit_sublayers` VALUES (1314,'dfce60d77cb84ffa95a9c383e8f35bd2','7846c0440564483ab3c6b673468e0039');
INSERT INTO `library_commit_sublayers` VALUES (1315,'dfce60d77cb84ffa95a9c383e8f35bd2','b3bc75e828fa4d068353737933411c30');
INSERT INTO `library_commit_sublayers` VALUES (1316,'dfce60d77cb84ffa95a9c383e8f35bd2','e9363f51da0d4035a3ba62e7d5e11f8a');
INSERT INTO `library_commit_sublayers` VALUES (1317,'dfce60d77cb84ffa95a9c383e8f35bd2','c8380b3ad45a4a52aab4343b4f4a7b0d');
INSERT INTO `library_commit_sublayers` VALUES (1318,'dfce60d77cb84ffa95a9c383e8f35bd2','f0b0cf8d14034b64ad9ca7b32b1469b4');
INSERT INTO `library_commit_sublayers` VALUES (1319,'dfce60d77cb84ffa95a9c383e8f35bd2','78a316a678394efdb50afc2546c2c12a');
INSERT INTO `library_commit_sublayers` VALUES (1320,'dfce60d77cb84ffa95a9c383e8f35bd2','6240ea34780540489bf0dd70ff86529b');
INSERT INTO `library_commit_sublayers` VALUES (1321,'dfce60d77cb84ffa95a9c383e8f35bd2','5dc24523763649508c68d78f6e4617c3');
INSERT INTO `library_commit_sublayers` VALUES (1322,'c66017fb41a146d5b3de967c43e91328','8d2db2ac14ab45aea97a3b17878212ea');
INSERT INTO `library_commit_sublayers` VALUES (1323,'c66017fb41a146d5b3de967c43e91328','960de8c8c5ef45369572938068673e8b');
INSERT INTO `library_commit_sublayers` VALUES (1324,'c66017fb41a146d5b3de967c43e91328','ee53e80a2bbe464bb6b8beddeebff38d');
INSERT INTO `library_commit_sublayers` VALUES (1325,'c66017fb41a146d5b3de967c43e91328','91c9f3267d6942769dd281c10742f02e');
INSERT INTO `library_commit_sublayers` VALUES (1326,'c66017fb41a146d5b3de967c43e91328','511f439259d344fda6a0c28b6fc89207');
INSERT INTO `library_commit_sublayers` VALUES (1327,'c66017fb41a146d5b3de967c43e91328','cf4094e0578c46fda7819d82e314cc2e');
INSERT INTO `library_commit_sublayers` VALUES (1328,'c66017fb41a146d5b3de967c43e91328','7a70b05cda424b3c80236cc1a88c160e');
INSERT INTO `library_commit_sublayers` VALUES (1329,'c66017fb41a146d5b3de967c43e91328','bf7e67f2d7bf4f59ac800be563366534');
INSERT INTO `library_commit_sublayers` VALUES (1330,'c66017fb41a146d5b3de967c43e91328','eb67ebb9c59d4bb288410d8cdb3b8f20');
INSERT INTO `library_commit_sublayers` VALUES (1331,'c66017fb41a146d5b3de967c43e91328','31e7fcfe970d44b49abb54390f616d26');
INSERT INTO `library_commit_sublayers` VALUES (1332,'c66017fb41a146d5b3de967c43e91328','f12b527b7f244bec8e125d4f399415bd');
INSERT INTO `library_commit_sublayers` VALUES (1333,'2080a28eb3e2401394e5acc914513592','b11ca703bfb04c289ad60ab1bd03a5b0');
INSERT INTO `library_commit_sublayers` VALUES (1334,'2080a28eb3e2401394e5acc914513592','b85862e5a8394e65961b8ca993a78b48');
INSERT INTO `library_commit_sublayers` VALUES (1335,'2080a28eb3e2401394e5acc914513592','28eb4a78462e42db98b58f467445d3de');
INSERT INTO `library_commit_sublayers` VALUES (1336,'2080a28eb3e2401394e5acc914513592','976802dc351549708c2ada0ef3279760');
INSERT INTO `library_commit_sublayers` VALUES (1337,'2080a28eb3e2401394e5acc914513592','14c2eebf585b45b0accb69fb60b490a2');
INSERT INTO `library_commit_sublayers` VALUES (1338,'2080a28eb3e2401394e5acc914513592','d51b7340c4974793b7749cd7d1b9f39c');
INSERT INTO `library_commit_sublayers` VALUES (1339,'2080a28eb3e2401394e5acc914513592','23ec122414004bd3b70755d24e69898d');
INSERT INTO `library_commit_sublayers` VALUES (1340,'2080a28eb3e2401394e5acc914513592','baad0486e53241e797cde9345f967369');
INSERT INTO `library_commit_sublayers` VALUES (1341,'2080a28eb3e2401394e5acc914513592','95f619fc86684806970cea7079f42201');
INSERT INTO `library_commit_sublayers` VALUES (1342,'2080a28eb3e2401394e5acc914513592','066e5892e54e438b852ec0ee85edce61');
INSERT INTO `library_commit_sublayers` VALUES (1343,'2080a28eb3e2401394e5acc914513592','384a507856034d31b55edd2377957d64');
INSERT INTO `library_commit_sublayers` VALUES (1344,'b7be187ce7f84cfb873578534a9d03b8','c6c72b9c15e3496885bdf5dbdaf99b6d');
INSERT INTO `library_commit_sublayers` VALUES (1345,'b7be187ce7f84cfb873578534a9d03b8','74d5423e468c4d70a8d3bed317389a41');
INSERT INTO `library_commit_sublayers` VALUES (1346,'b7be187ce7f84cfb873578534a9d03b8','9fc2779a83824f1980b6324d4bb539d2');
INSERT INTO `library_commit_sublayers` VALUES (1347,'b7be187ce7f84cfb873578534a9d03b8','9e4d949a06d344d8833627b07d35a5bb');
INSERT INTO `library_commit_sublayers` VALUES (1348,'b7be187ce7f84cfb873578534a9d03b8','7214c72306f3490ca11d5af38d875c8a');
INSERT INTO `library_commit_sublayers` VALUES (1349,'b7be187ce7f84cfb873578534a9d03b8','02937e9f17dd420fba523fd7424e16d0');
INSERT INTO `library_commit_sublayers` VALUES (1350,'b7be187ce7f84cfb873578534a9d03b8','8c088ae98acf42458d04681f98a84561');
INSERT INTO `library_commit_sublayers` VALUES (1351,'b7be187ce7f84cfb873578534a9d03b8','18fbe2d0a6dc4f8aa73a79dbfacca317');
INSERT INTO `library_commit_sublayers` VALUES (1352,'b7be187ce7f84cfb873578534a9d03b8','a57e0b1b487f499ea0322275968b6f5b');
INSERT INTO `library_commit_sublayers` VALUES (1353,'b7be187ce7f84cfb873578534a9d03b8','954982203ac947d7acec2e956106a7f8');
INSERT INTO `library_commit_sublayers` VALUES (1354,'b7be187ce7f84cfb873578534a9d03b8','797baeac95b54dce8abe86b76c82c6a9');
INSERT INTO `library_commit_sublayers` VALUES (1355,'b6d60436451b468baf24c893dafd1309','d6830930731a464a8c287b0a75db0a17');
INSERT INTO `library_commit_sublayers` VALUES (1356,'b6d60436451b468baf24c893dafd1309','372dbbe8e0a34dc2a38153017b145840');
INSERT INTO `library_commit_sublayers` VALUES (1357,'b6d60436451b468baf24c893dafd1309','f277b8bacbe04020aa1ecfe4548d64e4');
INSERT INTO `library_commit_sublayers` VALUES (1358,'b6d60436451b468baf24c893dafd1309','6e2d583d041547dfa4dd003e2bde806f');
INSERT INTO `library_commit_sublayers` VALUES (1359,'b6d60436451b468baf24c893dafd1309','24cc1ddc5e544c36ae0bb2991031818c');
INSERT INTO `library_commit_sublayers` VALUES (1360,'b6d60436451b468baf24c893dafd1309','74d099b11dc04897a13c546096f3fdf5');
INSERT INTO `library_commit_sublayers` VALUES (1361,'b6d60436451b468baf24c893dafd1309','be1b9aad16c34647ba0cd6544ad66ba4');
INSERT INTO `library_commit_sublayers` VALUES (1362,'b6d60436451b468baf24c893dafd1309','77555e9735eb403c98fe191900c2b930');
INSERT INTO `library_commit_sublayers` VALUES (1363,'b6d60436451b468baf24c893dafd1309','f693ebbdaf954284bcd20d5b68e4cc2f');
INSERT INTO `library_commit_sublayers` VALUES (1364,'b6d60436451b468baf24c893dafd1309','90510bc520c04be4aafbf7242c8f550c');
INSERT INTO `library_commit_sublayers` VALUES (1365,'b6d60436451b468baf24c893dafd1309','8746c1e9d54a4c1cb16eb9dc25bc1971');
INSERT INTO `library_commit_sublayers` VALUES (1366,'66b966ae4c7242e6965dcd16a661cbde','ed50dbba724c49708c0a45534ec38202');
INSERT INTO `library_commit_sublayers` VALUES (1367,'66b966ae4c7242e6965dcd16a661cbde','7dc4f439009e4176bc7399ed387071ce');
INSERT INTO `library_commit_sublayers` VALUES (1368,'66b966ae4c7242e6965dcd16a661cbde','f8123942dbb04f16b4f57299d9be43d3');
INSERT INTO `library_commit_sublayers` VALUES (1369,'66b966ae4c7242e6965dcd16a661cbde','68fa817a50494720970689a167895e2a');
INSERT INTO `library_commit_sublayers` VALUES (1370,'66b966ae4c7242e6965dcd16a661cbde','0e56f512e3df41e190503916f755e0bd');
INSERT INTO `library_commit_sublayers` VALUES (1371,'66b966ae4c7242e6965dcd16a661cbde','62f1bdb85fa642d88eb04c8957ee4990');
INSERT INTO `library_commit_sublayers` VALUES (1372,'66b966ae4c7242e6965dcd16a661cbde','938e84b82d9a47d7b0afda6fa91d9d10');
INSERT INTO `library_commit_sublayers` VALUES (1373,'66b966ae4c7242e6965dcd16a661cbde','2a4125f74e6b4d298ee1be5032c36e7d');
INSERT INTO `library_commit_sublayers` VALUES (1374,'66b966ae4c7242e6965dcd16a661cbde','5516ac59e0094dc1b092e05eaa480453');
INSERT INTO `library_commit_sublayers` VALUES (1375,'66b966ae4c7242e6965dcd16a661cbde','eace414f2b544d96a09a06802eb02128');
INSERT INTO `library_commit_sublayers` VALUES (1376,'66b966ae4c7242e6965dcd16a661cbde','67397eafd23048dd902662adbc37bdf5');
INSERT INTO `library_commit_sublayers` VALUES (1377,'27b0f2191a5742909df692b5aa762e72','88cfc04eeac6499ea773b0142c983c6a');
INSERT INTO `library_commit_sublayers` VALUES (1378,'27b0f2191a5742909df692b5aa762e72','8e7b1c69bf0e47c7a9b4571087886d43');
INSERT INTO `library_commit_sublayers` VALUES (1379,'27b0f2191a5742909df692b5aa762e72','a6717690518240a194bbcf6de0da124f');
INSERT INTO `library_commit_sublayers` VALUES (1380,'27b0f2191a5742909df692b5aa762e72','c381426c678f4ae9af0c5b84fd8fa5b0');
INSERT INTO `library_commit_sublayers` VALUES (1381,'27b0f2191a5742909df692b5aa762e72','1b5ad23611a34528938e6238bf12f726');
INSERT INTO `library_commit_sublayers` VALUES (1382,'27b0f2191a5742909df692b5aa762e72','a1654aefc92f4dbc98f2401139305348');
INSERT INTO `library_commit_sublayers` VALUES (1383,'27b0f2191a5742909df692b5aa762e72','150e74bf457c482e8627bb607284905d');
INSERT INTO `library_commit_sublayers` VALUES (1384,'27b0f2191a5742909df692b5aa762e72','e8c72ae68a444c66bbf8630239033028');
INSERT INTO `library_commit_sublayers` VALUES (1385,'27b0f2191a5742909df692b5aa762e72','dae30cda23fc4f0d9b98b08fe6228a56');
INSERT INTO `library_commit_sublayers` VALUES (1386,'27b0f2191a5742909df692b5aa762e72','bd070365551f4738a21e6b5fef2d6f66');
INSERT INTO `library_commit_sublayers` VALUES (1387,'27b0f2191a5742909df692b5aa762e72','7f9e60d87ece4aed978749a3f0e379f2');
INSERT INTO `library_commit_sublayers` VALUES (1388,'35e5eb6736d54f26866ba050a7f7eff4','fc419f1f35274b3abfd3a53721c699ce');
INSERT INTO `library_commit_sublayers` VALUES (1389,'35e5eb6736d54f26866ba050a7f7eff4','2f2f685710cd44babce007ca47b71626');
INSERT INTO `library_commit_sublayers` VALUES (1390,'35e5eb6736d54f26866ba050a7f7eff4','cafba1c0bf5d4cbaa22c7eff269cd9e0');
INSERT INTO `library_commit_sublayers` VALUES (1391,'35e5eb6736d54f26866ba050a7f7eff4','8ec2dff8f9af45f6b0825fb997bb4f93');
INSERT INTO `library_commit_sublayers` VALUES (1392,'35e5eb6736d54f26866ba050a7f7eff4','f51225ee048b4dcd8bc3e3ec245c1605');
INSERT INTO `library_commit_sublayers` VALUES (1393,'35e5eb6736d54f26866ba050a7f7eff4','437041d684344f3bbdd362839c784724');
INSERT INTO `library_commit_sublayers` VALUES (1394,'35e5eb6736d54f26866ba050a7f7eff4','3ae3eef3a7ba44378e75883b59136deb');
INSERT INTO `library_commit_sublayers` VALUES (1395,'35e5eb6736d54f26866ba050a7f7eff4','06a18f2cd9ec4e03ad5aab819ef72c57');
INSERT INTO `library_commit_sublayers` VALUES (1396,'35e5eb6736d54f26866ba050a7f7eff4','8ada07f99a8f4b4ab5007187ac9c649e');
INSERT INTO `library_commit_sublayers` VALUES (1397,'35e5eb6736d54f26866ba050a7f7eff4','979a1e88839c47c484ae2355620cfe51');
INSERT INTO `library_commit_sublayers` VALUES (1398,'35e5eb6736d54f26866ba050a7f7eff4','1070ae32501f4ca794bc47b9327b3798');
INSERT INTO `library_commit_sublayers` VALUES (1399,'1fbcf78872b0461baf87acae54c5817f','b05de79290784af9ac6ca44ba144dd47');
INSERT INTO `library_commit_sublayers` VALUES (1400,'1fbcf78872b0461baf87acae54c5817f','44f9dcd4ca484a089a0058e3fa2cd8ac');
INSERT INTO `library_commit_sublayers` VALUES (1401,'1fbcf78872b0461baf87acae54c5817f','02843b34da1046fca1d8018c43cbac43');
INSERT INTO `library_commit_sublayers` VALUES (1402,'1fbcf78872b0461baf87acae54c5817f','f0b99584108241da9c949e36b31718db');
INSERT INTO `library_commit_sublayers` VALUES (1403,'1fbcf78872b0461baf87acae54c5817f','31e479799c52456fa23c0d8fb78b2aa3');
INSERT INTO `library_commit_sublayers` VALUES (1404,'1fbcf78872b0461baf87acae54c5817f','a19a20dcfd2c4845bb99951c9f3691d9');
INSERT INTO `library_commit_sublayers` VALUES (1405,'1fbcf78872b0461baf87acae54c5817f','1de0ad239b544f95b014460d4928483e');
INSERT INTO `library_commit_sublayers` VALUES (1406,'1fbcf78872b0461baf87acae54c5817f','fc6f436a2ab6464784f2cf4d3406b579');
INSERT INTO `library_commit_sublayers` VALUES (1407,'1fbcf78872b0461baf87acae54c5817f','0fe8e904340e495695bf06f22d62887c');
INSERT INTO `library_commit_sublayers` VALUES (1408,'1fbcf78872b0461baf87acae54c5817f','c5a572c72f0b44a995f1851e48154e5e');
INSERT INTO `library_commit_sublayers` VALUES (1409,'1fbcf78872b0461baf87acae54c5817f','5c489ae399f04c5d85d2b9d4c303003b');
INSERT INTO `library_commit_sublayers` VALUES (1410,'eed9ba72fe034f7ba56462197f2f8852','b44ec938681a4388be706ef1be070e09');
INSERT INTO `library_commit_sublayers` VALUES (1411,'eed9ba72fe034f7ba56462197f2f8852','a4f16d7c38c846dc832ff7d91e8d7a55');
INSERT INTO `library_commit_sublayers` VALUES (1412,'eed9ba72fe034f7ba56462197f2f8852','6184692f91684045abb6852950af67c1');
INSERT INTO `library_commit_sublayers` VALUES (1413,'eed9ba72fe034f7ba56462197f2f8852','5dd0c9e3b52c41e7b81b625a2199f051');
INSERT INTO `library_commit_sublayers` VALUES (1414,'eed9ba72fe034f7ba56462197f2f8852','8298a8a4af8f44219b1f73513f3f6c1c');
INSERT INTO `library_commit_sublayers` VALUES (1415,'eed9ba72fe034f7ba56462197f2f8852','76c7fd9fc26d48b9b1686fee0181e667');
INSERT INTO `library_commit_sublayers` VALUES (1416,'eed9ba72fe034f7ba56462197f2f8852','790f31826ec347ac8afb0c40ade65431');
INSERT INTO `library_commit_sublayers` VALUES (1417,'eed9ba72fe034f7ba56462197f2f8852','a02c9dfade5e42069dc3c60b39f00c1b');
INSERT INTO `library_commit_sublayers` VALUES (1418,'eed9ba72fe034f7ba56462197f2f8852','210c8316d75540a49dd7f5d02bdeeb2e');
INSERT INTO `library_commit_sublayers` VALUES (1419,'eed9ba72fe034f7ba56462197f2f8852','afed027570fe425abb17170caa38e6bb');
INSERT INTO `library_commit_sublayers` VALUES (1420,'eed9ba72fe034f7ba56462197f2f8852','4718adf43d50470ba731838203aaaa71');
INSERT INTO `library_commit_sublayers` VALUES (1421,'bf610943d61b4d459695155e6f4316a7','a41da2a5022f47ba87f820f7b7718ee4');
INSERT INTO `library_commit_sublayers` VALUES (1422,'bf610943d61b4d459695155e6f4316a7','555c116d49264094b8a1e24a7cb8ae68');
INSERT INTO `library_commit_sublayers` VALUES (1423,'bf610943d61b4d459695155e6f4316a7','6757734a396a4bb19e0c7d961a63e340');
INSERT INTO `library_commit_sublayers` VALUES (1424,'bf610943d61b4d459695155e6f4316a7','7fc3e80480b942d0b0fda2a4b48ef985');
INSERT INTO `library_commit_sublayers` VALUES (1425,'bf610943d61b4d459695155e6f4316a7','6e3dff0d70ec4384809a5a388c8d562d');
INSERT INTO `library_commit_sublayers` VALUES (1426,'bf610943d61b4d459695155e6f4316a7','27234d899a2e486dacd7332c0c12caf7');
INSERT INTO `library_commit_sublayers` VALUES (1427,'bf610943d61b4d459695155e6f4316a7','3c5adeb1e0d54ca89c190938b4420cfc');
INSERT INTO `library_commit_sublayers` VALUES (1428,'bf610943d61b4d459695155e6f4316a7','1754ed9d0f204b3699a736738b86d0b8');
INSERT INTO `library_commit_sublayers` VALUES (1429,'bf610943d61b4d459695155e6f4316a7','dffa7bea3c144b4d92e0bd4f3a456257');
INSERT INTO `library_commit_sublayers` VALUES (1430,'bf610943d61b4d459695155e6f4316a7','bde93dcd084b4d6ebd637669ed5facb8');
INSERT INTO `library_commit_sublayers` VALUES (1431,'bf610943d61b4d459695155e6f4316a7','ff85c590e3aa4c28b4b1fe1c0b25509a');
INSERT INTO `library_commit_sublayers` VALUES (1432,'581241a5d8154c5e964fe8f576d89066','575b84cc94f44239bab8cb9ae8f40400');
INSERT INTO `library_commit_sublayers` VALUES (1433,'581241a5d8154c5e964fe8f576d89066','747745e67b8a4cd1936ec4b40f6de41c');
INSERT INTO `library_commit_sublayers` VALUES (1434,'581241a5d8154c5e964fe8f576d89066','a17ceeb3f5ed4b0496b590d8f284282d');
INSERT INTO `library_commit_sublayers` VALUES (1435,'581241a5d8154c5e964fe8f576d89066','8cc4b83bf5ae476d87e179c6eb24e37c');
INSERT INTO `library_commit_sublayers` VALUES (1436,'581241a5d8154c5e964fe8f576d89066','7b6f30c6564744658f34f5398766e5c5');
INSERT INTO `library_commit_sublayers` VALUES (1437,'581241a5d8154c5e964fe8f576d89066','ed1fafd8727d4fd3a74e376fe820923a');
INSERT INTO `library_commit_sublayers` VALUES (1438,'581241a5d8154c5e964fe8f576d89066','61477ec903be474094434f13a6be6c5b');
INSERT INTO `library_commit_sublayers` VALUES (1439,'581241a5d8154c5e964fe8f576d89066','895f926d32674375a0a6010deba17629');
INSERT INTO `library_commit_sublayers` VALUES (1440,'581241a5d8154c5e964fe8f576d89066','12842443869f4b36bda7091ae186c520');
INSERT INTO `library_commit_sublayers` VALUES (1441,'581241a5d8154c5e964fe8f576d89066','e06c9c73b90a41989214ac5adfd2b342');
INSERT INTO `library_commit_sublayers` VALUES (1442,'581241a5d8154c5e964fe8f576d89066','611fb297f594441bbcdfed1902cd8b81');
INSERT INTO `library_commit_sublayers` VALUES (1443,'edaf26aa3a8141cba15dad89dc759240','03a513e96dd04c2e964df0fdd7462f6c');
INSERT INTO `library_commit_sublayers` VALUES (1444,'edaf26aa3a8141cba15dad89dc759240','c2c4c2cee2034b5eb296c99d104a8780');
INSERT INTO `library_commit_sublayers` VALUES (1445,'edaf26aa3a8141cba15dad89dc759240','4aa38d084d67449d883177abfb12224e');
INSERT INTO `library_commit_sublayers` VALUES (1446,'edaf26aa3a8141cba15dad89dc759240','b2338632d7f647b3bed7fb9359852482');
INSERT INTO `library_commit_sublayers` VALUES (1447,'edaf26aa3a8141cba15dad89dc759240','9c0fea89eda847209f62117568bb4b03');
INSERT INTO `library_commit_sublayers` VALUES (1448,'edaf26aa3a8141cba15dad89dc759240','d5fae96fc875487e961a722f2bd9b424');
INSERT INTO `library_commit_sublayers` VALUES (1449,'edaf26aa3a8141cba15dad89dc759240','a0fd8085885b45c7878cc6619d43b54c');
INSERT INTO `library_commit_sublayers` VALUES (1450,'edaf26aa3a8141cba15dad89dc759240','8ac4caee831b4dd5b56d2cf06e1fa663');
INSERT INTO `library_commit_sublayers` VALUES (1451,'edaf26aa3a8141cba15dad89dc759240','7045c7a0e097402aba5e5a41a0433fa2');
INSERT INTO `library_commit_sublayers` VALUES (1452,'edaf26aa3a8141cba15dad89dc759240','4b7a2bddfe504e88bf9df8b15da5f3ff');
INSERT INTO `library_commit_sublayers` VALUES (1453,'edaf26aa3a8141cba15dad89dc759240','49bd10dc403f42edb3004bf94020c6d9');
INSERT INTO `library_commit_sublayers` VALUES (1454,'ee6b077c499f4358b3975f5e8015838f','ea96ca421cbd4e94ba801a458f9a02c2');
INSERT INTO `library_commit_sublayers` VALUES (1455,'ee6b077c499f4358b3975f5e8015838f','67218ab405d34fe69137c7ba6707ee18');
INSERT INTO `library_commit_sublayers` VALUES (1456,'ee6b077c499f4358b3975f5e8015838f','f2dc26a5265e48d49bcbeff3811384a5');
INSERT INTO `library_commit_sublayers` VALUES (1457,'ee6b077c499f4358b3975f5e8015838f','9acda44d7f354a1e9aff43089b9b7c8b');
INSERT INTO `library_commit_sublayers` VALUES (1458,'ee6b077c499f4358b3975f5e8015838f','79de4d86a88140d98b976519b5cadd00');
INSERT INTO `library_commit_sublayers` VALUES (1459,'ee6b077c499f4358b3975f5e8015838f','6d217c228bf848fa8c611329fd01785c');
INSERT INTO `library_commit_sublayers` VALUES (1460,'ee6b077c499f4358b3975f5e8015838f','d5cb903d28c34d638da5d81508db34fd');
INSERT INTO `library_commit_sublayers` VALUES (1461,'ee6b077c499f4358b3975f5e8015838f','184b853e165b4d38bab58787db18dce4');
INSERT INTO `library_commit_sublayers` VALUES (1462,'ee6b077c499f4358b3975f5e8015838f','16dcbc8a785f45cc8dc193dc94bbc568');
INSERT INTO `library_commit_sublayers` VALUES (1463,'ee6b077c499f4358b3975f5e8015838f','b36bd1902a95496087e0d1f7f66bec42');
INSERT INTO `library_commit_sublayers` VALUES (1464,'ee6b077c499f4358b3975f5e8015838f','6c2e13a83f4a4cbd83789a8cf924dd96');
INSERT INTO `library_commit_sublayers` VALUES (1465,'255c412ab9a1428a8bd9d36554f83f2b','fc81545742b445f18469ae0030ed08d5');
INSERT INTO `library_commit_sublayers` VALUES (1466,'255c412ab9a1428a8bd9d36554f83f2b','30c790cbbf5648b9a40afd45cf661a08');
INSERT INTO `library_commit_sublayers` VALUES (1467,'255c412ab9a1428a8bd9d36554f83f2b','7a976f5b51a448ffb19fc3c5a68a0107');
INSERT INTO `library_commit_sublayers` VALUES (1468,'255c412ab9a1428a8bd9d36554f83f2b','aaa06ca34f1c450f81ce6e84d1ccf1c2');
INSERT INTO `library_commit_sublayers` VALUES (1469,'255c412ab9a1428a8bd9d36554f83f2b','f0bf4053c7bc4d08a2ac0cb762d6050e');
INSERT INTO `library_commit_sublayers` VALUES (1470,'255c412ab9a1428a8bd9d36554f83f2b','c22ab52c08d44287a9068ca7b02b0ba2');
INSERT INTO `library_commit_sublayers` VALUES (1471,'255c412ab9a1428a8bd9d36554f83f2b','795b798e3f294e3aaf47a35090d75ade');
INSERT INTO `library_commit_sublayers` VALUES (1472,'255c412ab9a1428a8bd9d36554f83f2b','ccd1a937a23d4f23ac96da2dfd985626');
INSERT INTO `library_commit_sublayers` VALUES (1473,'255c412ab9a1428a8bd9d36554f83f2b','9dddb42036294b31a43af238dfac4a03');
INSERT INTO `library_commit_sublayers` VALUES (1474,'255c412ab9a1428a8bd9d36554f83f2b','2cdc3f6ea539435383bc3b99590b7bb4');
INSERT INTO `library_commit_sublayers` VALUES (1475,'255c412ab9a1428a8bd9d36554f83f2b','4b1f20d5ff4248c185ecad49350eaee1');
INSERT INTO `library_commit_sublayers` VALUES (1476,'98a0fe04bdc146a681f1511e998d7a88','86e84a5d469246e98ece455c56998315');
INSERT INTO `library_commit_sublayers` VALUES (1477,'98a0fe04bdc146a681f1511e998d7a88','91844a350f6642d9b59aabb214b8cf77');
INSERT INTO `library_commit_sublayers` VALUES (1478,'98a0fe04bdc146a681f1511e998d7a88','dc03bf330fda42e1ba5d6d82bc6f5ea6');
INSERT INTO `library_commit_sublayers` VALUES (1479,'98a0fe04bdc146a681f1511e998d7a88','7f14b54340c1445aad738a44f9e79bf6');
INSERT INTO `library_commit_sublayers` VALUES (1480,'98a0fe04bdc146a681f1511e998d7a88','dbfa754930854ee992e6160567216e2a');
INSERT INTO `library_commit_sublayers` VALUES (1481,'98a0fe04bdc146a681f1511e998d7a88','bc1e06d2b839445b9324765a18801d04');
INSERT INTO `library_commit_sublayers` VALUES (1482,'98a0fe04bdc146a681f1511e998d7a88','351d253d31fa496f982333e7682c66c5');
INSERT INTO `library_commit_sublayers` VALUES (1483,'98a0fe04bdc146a681f1511e998d7a88','fd66e425144a405fb46cc74525a7947b');
INSERT INTO `library_commit_sublayers` VALUES (1484,'98a0fe04bdc146a681f1511e998d7a88','a20d85563307474fbeacca42f09d6d31');
INSERT INTO `library_commit_sublayers` VALUES (1485,'98a0fe04bdc146a681f1511e998d7a88','9d24c72f56f647159a7e4d91dd440ce3');
INSERT INTO `library_commit_sublayers` VALUES (1486,'98a0fe04bdc146a681f1511e998d7a88','984b3acf666540828101d092fb2f25df');
INSERT INTO `library_commit_sublayers` VALUES (1487,'9d782a95e12b45da867eac3718370559','6947845d647f477fa2a62cf8db995bce');
INSERT INTO `library_commit_sublayers` VALUES (1488,'9d782a95e12b45da867eac3718370559','1073fa05b88044ed8bfedaa1677ebf56');
INSERT INTO `library_commit_sublayers` VALUES (1489,'9d782a95e12b45da867eac3718370559','699f5eae5f6e403cb15d95d9c0780dab');
INSERT INTO `library_commit_sublayers` VALUES (1490,'9d782a95e12b45da867eac3718370559','5c1c7150e43341a4b3f20bb7c3ae5ecf');
INSERT INTO `library_commit_sublayers` VALUES (1491,'9d782a95e12b45da867eac3718370559','fa4ed72c182d4b719ce9388ae646c42c');
INSERT INTO `library_commit_sublayers` VALUES (1492,'9d782a95e12b45da867eac3718370559','e325d98e9e8644ecb1d99cdca051dd76');
INSERT INTO `library_commit_sublayers` VALUES (1493,'9d782a95e12b45da867eac3718370559','7720fc5de79f443b9c300a8b9b8e40db');
INSERT INTO `library_commit_sublayers` VALUES (1494,'9d782a95e12b45da867eac3718370559','ed8fa8db99b943a5ad34851fb5c2454f');
INSERT INTO `library_commit_sublayers` VALUES (1495,'9d782a95e12b45da867eac3718370559','41ac14ccadd7471e9ebed41c16aefd14');
INSERT INTO `library_commit_sublayers` VALUES (1496,'9d782a95e12b45da867eac3718370559','bf11d33a0b6c49eeb8730bcae4f479b5');
INSERT INTO `library_commit_sublayers` VALUES (1497,'9d782a95e12b45da867eac3718370559','de6ece2194cc48beb6a652ec27e5e8b1');
INSERT INTO `library_commit_sublayers` VALUES (1498,'4fca4fc358f64733a9b17129dc9b1d5c','753952387aa34465be163b801fd853b7');
INSERT INTO `library_commit_sublayers` VALUES (1499,'4fca4fc358f64733a9b17129dc9b1d5c','dd6ff87cd7644316945445ddc52b8fba');
INSERT INTO `library_commit_sublayers` VALUES (1500,'4fca4fc358f64733a9b17129dc9b1d5c','9aa3a975f2c547c896627f5d5660a2bb');
INSERT INTO `library_commit_sublayers` VALUES (1501,'4fca4fc358f64733a9b17129dc9b1d5c','96ab7d828e51416b9f37a00c783e7e04');
INSERT INTO `library_commit_sublayers` VALUES (1502,'4fca4fc358f64733a9b17129dc9b1d5c','6a9f54dde983476b982863ece5aa49f7');
INSERT INTO `library_commit_sublayers` VALUES (1503,'4fca4fc358f64733a9b17129dc9b1d5c','a43cf7a1bcf445b18bd38853e49dff5a');
INSERT INTO `library_commit_sublayers` VALUES (1504,'4fca4fc358f64733a9b17129dc9b1d5c','d97ac13cd4eb46c8a0b51613f24c06b5');
INSERT INTO `library_commit_sublayers` VALUES (1505,'4fca4fc358f64733a9b17129dc9b1d5c','cfcd5ab160a74ba1bbab5d390c6b8b94');
INSERT INTO `library_commit_sublayers` VALUES (1506,'4fca4fc358f64733a9b17129dc9b1d5c','5c2567ae274c49b380c3f52bf02e3c05');
INSERT INTO `library_commit_sublayers` VALUES (1507,'4fca4fc358f64733a9b17129dc9b1d5c','3b280f085fca4b1a9b2acd643bdb6f19');
INSERT INTO `library_commit_sublayers` VALUES (1508,'4fca4fc358f64733a9b17129dc9b1d5c','0767aa15fa0c453a96033e635f24bce9');
INSERT INTO `library_commit_sublayers` VALUES (1509,'dee912bf30834c589b0c1c0745fa8a6c','77f0ebe8af5b4dceb3f5ce56d5e612ae');
INSERT INTO `library_commit_sublayers` VALUES (1510,'dee912bf30834c589b0c1c0745fa8a6c','601cfeb025f44269af416a919549671d');
INSERT INTO `library_commit_sublayers` VALUES (1511,'dee912bf30834c589b0c1c0745fa8a6c','91b111b61a4749d1aaa5a94e6cc68df7');
INSERT INTO `library_commit_sublayers` VALUES (1512,'dee912bf30834c589b0c1c0745fa8a6c','80f9773ec161479185729f73e37f64df');
INSERT INTO `library_commit_sublayers` VALUES (1513,'dee912bf30834c589b0c1c0745fa8a6c','c83ba0af8aa94db69412c82a99b57205');
INSERT INTO `library_commit_sublayers` VALUES (1514,'dee912bf30834c589b0c1c0745fa8a6c','340866fd98fb4a29b9f7b589f0142151');
INSERT INTO `library_commit_sublayers` VALUES (1515,'dee912bf30834c589b0c1c0745fa8a6c','84b703229b444b99b3b692b047d2f662');
INSERT INTO `library_commit_sublayers` VALUES (1516,'dee912bf30834c589b0c1c0745fa8a6c','266774fdbf6d498d934c4d26eb5051be');
INSERT INTO `library_commit_sublayers` VALUES (1517,'dee912bf30834c589b0c1c0745fa8a6c','b8e57d9506fe45a1a4477b61391f0e20');
INSERT INTO `library_commit_sublayers` VALUES (1518,'dee912bf30834c589b0c1c0745fa8a6c','827281040c5144e2900998b72fcc44c7');
INSERT INTO `library_commit_sublayers` VALUES (1519,'dee912bf30834c589b0c1c0745fa8a6c','42d447b8157744d889b4a41dd7d58108');
INSERT INTO `library_commit_sublayers` VALUES (1520,'fc0f1a895bf94fa4a03a784575ec2ccb','40d942a098c64eb8bfd7e82f67ac610b');
INSERT INTO `library_commit_sublayers` VALUES (1521,'fc0f1a895bf94fa4a03a784575ec2ccb','05040fabf50c408f8567d12414abbe84');
INSERT INTO `library_commit_sublayers` VALUES (1522,'fc0f1a895bf94fa4a03a784575ec2ccb','7d6aeb27099840c0b6551ce3cfed9373');
INSERT INTO `library_commit_sublayers` VALUES (1523,'fc0f1a895bf94fa4a03a784575ec2ccb','3d3228f6956041a8a78571477a7315d1');
INSERT INTO `library_commit_sublayers` VALUES (1524,'fc0f1a895bf94fa4a03a784575ec2ccb','38a85eca2991403c9624b620ca430875');
INSERT INTO `library_commit_sublayers` VALUES (1525,'fc0f1a895bf94fa4a03a784575ec2ccb','4b3b55d58b5342f5b601702cd229cb86');
INSERT INTO `library_commit_sublayers` VALUES (1526,'fc0f1a895bf94fa4a03a784575ec2ccb','12ddf398e89044a8bb7969e5a199e5a2');
INSERT INTO `library_commit_sublayers` VALUES (1527,'fc0f1a895bf94fa4a03a784575ec2ccb','95a0e908856e4970b53e30447247c1e4');
INSERT INTO `library_commit_sublayers` VALUES (1528,'fc0f1a895bf94fa4a03a784575ec2ccb','d13a1603bf5540d5917e4d645d2f8390');
INSERT INTO `library_commit_sublayers` VALUES (1529,'fc0f1a895bf94fa4a03a784575ec2ccb','b971a6e035d445568549fa551ce71352');
INSERT INTO `library_commit_sublayers` VALUES (1530,'fc0f1a895bf94fa4a03a784575ec2ccb','b7305685bffe4767a16c35481d1ecccb');
INSERT INTO `library_commit_sublayers` VALUES (1531,'fc0f1a895bf94fa4a03a784575ec2ccb','0a4b96af0ea543fb8050133124069c9a');
INSERT INTO `library_commit_sublayers` VALUES (1532,'fc0f1a895bf94fa4a03a784575ec2ccb','cd63e27bee204814ae12ced429242e63');
INSERT INTO `library_commit_sublayers` VALUES (1533,'fc0f1a895bf94fa4a03a784575ec2ccb','f1190e8126c749079014dfead0e35d47');
/*!40000 ALTER TABLE `library_commit_sublayers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_keyword`
--

DROP TABLE IF EXISTS `library_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_keyword` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `keyword` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_keyword`
--
-- ORDER BY:  `id`,`keyword`

LOCK TABLES `library_keyword` WRITE;
/*!40000 ALTER TABLE `library_keyword` DISABLE KEYS */;
INSERT INTO `library_keyword` VALUES (1,'crab');
INSERT INTO `library_keyword` VALUES (2,'ocean');
INSERT INTO `library_keyword` VALUES (3,'shell');
INSERT INTO `library_keyword` VALUES (4,'creature');
INSERT INTO `library_keyword` VALUES (5,'animal');
INSERT INTO `library_keyword` VALUES (6,'book');
INSERT INTO `library_keyword` VALUES (7,'books');
INSERT INTO `library_keyword` VALUES (8,'stack');
INSERT INTO `library_keyword` VALUES (9,'hardcover');
INSERT INTO `library_keyword` VALUES (10,'household');
INSERT INTO `library_keyword` VALUES (11,'decoration');
INSERT INTO `library_keyword` VALUES (12,'library');
INSERT INTO `library_keyword` VALUES (13,'prop');
INSERT INTO `library_keyword` VALUES (14,'study');
INSERT INTO `library_keyword` VALUES (15,'office');
INSERT INTO `library_keyword` VALUES (16,'cafe');
INSERT INTO `library_keyword` VALUES (17,'table');
INSERT INTO `library_keyword` VALUES (18,'furniture');
INSERT INTO `library_keyword` VALUES (19,'campfire');
INSERT INTO `library_keyword` VALUES (20,'logs');
INSERT INTO `library_keyword` VALUES (21,'rocks');
INSERT INTO `library_keyword` VALUES (22,'stones');
INSERT INTO `library_keyword` VALUES (23,'wood');
INSERT INTO `library_keyword` VALUES (24,'camp');
INSERT INTO `library_keyword` VALUES (25,'outdoors');
INSERT INTO `library_keyword` VALUES (26,'firepit');
INSERT INTO `library_keyword` VALUES (27,'bonfire');
INSERT INTO `library_keyword` VALUES (28,'survival');
INSERT INTO `library_keyword` VALUES (29,'fish');
INSERT INTO `library_keyword` VALUES (30,'cute');
INSERT INTO `library_keyword` VALUES (31,'cartoon');
INSERT INTO `library_keyword` VALUES (32,'coral');
INSERT INTO `library_keyword` VALUES (33,'reef');
INSERT INTO `library_keyword` VALUES (34,'bench');
INSERT INTO `library_keyword` VALUES (35,'park');
INSERT INTO `library_keyword` VALUES (36,'outside');
INSERT INTO `library_keyword` VALUES (37,'seat');
INSERT INTO `library_keyword` VALUES (38,'chair');
INSERT INTO `library_keyword` VALUES (39,'barrel');
INSERT INTO `library_keyword` VALUES (40,'pickel');
INSERT INTO `library_keyword` VALUES (41,'container');
INSERT INTO `library_keyword` VALUES (42,'water-filled');
INSERT INTO `library_keyword` VALUES (43,'wooden');
INSERT INTO `library_keyword` VALUES (44,'object');
INSERT INTO `library_keyword` VALUES (45,'fantasy');
INSERT INTO `library_keyword` VALUES (46,'storage');
INSERT INTO `library_keyword` VALUES (47,'moomin');
INSERT INTO `library_keyword` VALUES (48,'troll');
INSERT INTO `library_keyword` VALUES (49,'character');
INSERT INTO `library_keyword` VALUES (50,'skateboard');
INSERT INTO `library_keyword` VALUES (51,'skater');
INSERT INTO `library_keyword` VALUES (52,'sport');
INSERT INTO `library_keyword` VALUES (53,'play');
INSERT INTO `library_keyword` VALUES (54,'transportation');
INSERT INTO `library_keyword` VALUES (55,'vehicle');
INSERT INTO `library_keyword` VALUES (56,'wheels');
INSERT INTO `library_keyword` VALUES (57,'board');
INSERT INTO `library_keyword` VALUES (58,'teapot');
INSERT INTO `library_keyword` VALUES (59,'tea');
INSERT INTO `library_keyword` VALUES (60,'pot');
INSERT INTO `library_keyword` VALUES (61,'dish');
INSERT INTO `library_keyword` VALUES (62,'kitchen');
INSERT INTO `library_keyword` VALUES (63,'lamp');
INSERT INTO `library_keyword` VALUES (64,'victorian');
INSERT INTO `library_keyword` VALUES (65,'vintage');
INSERT INTO `library_keyword` VALUES (66,'candle');
INSERT INTO `library_keyword` VALUES (67,'bulb');
INSERT INTO `library_keyword` VALUES (68,'light');
INSERT INTO `library_keyword` VALUES (69,'yellow');
INSERT INTO `library_keyword` VALUES (70,'duck');
INSERT INTO `library_keyword` VALUES (71,'rubber');
INSERT INTO `library_keyword` VALUES (72,'toy');
INSERT INTO `library_keyword` VALUES (73,'bathroom');
INSERT INTO `library_keyword` VALUES (74,'yu-gi-oh');
INSERT INTO `library_keyword` VALUES (75,'machine');
INSERT INTO `library_keyword` VALUES (76,'yugioh');
INSERT INTO `library_keyword` VALUES (77,'yu-gi-oh!');
INSERT INTO `library_keyword` VALUES (78,'vegetable');
INSERT INTO `library_keyword` VALUES (79,'carrot');
INSERT INTO `library_keyword` VALUES (80,'mixer');
INSERT INTO `library_keyword` VALUES (81,'kitchenaid');
INSERT INTO `library_keyword` VALUES (82,'stand mixer');
INSERT INTO `library_keyword` VALUES (83,'appliance');
INSERT INTO `library_keyword` VALUES (84,'mug');
INSERT INTO `library_keyword` VALUES (85,'cup');
INSERT INTO `library_keyword` VALUES (86,'television');
INSERT INTO `library_keyword` VALUES (87,'old');
INSERT INTO `library_keyword` VALUES (88,'antique');
INSERT INTO `library_keyword` VALUES (89,'panini');
INSERT INTO `library_keyword` VALUES (90,'edible');
INSERT INTO `library_keyword` VALUES (91,'cooking');
INSERT INTO `library_keyword` VALUES (92,'tablet');
INSERT INTO `library_keyword` VALUES (93,'pen');
INSERT INTO `library_keyword` VALUES (94,'square');
INSERT INTO `library_keyword` VALUES (95,'artist');
INSERT INTO `library_keyword` VALUES (96,'sushi');
INSERT INTO `library_keyword` VALUES (97,'food');
INSERT INTO `library_keyword` VALUES (98,'japan');
INSERT INTO `library_keyword` VALUES (99,'japanese');
INSERT INTO `library_keyword` VALUES (100,'fragile');
INSERT INTO `library_keyword` VALUES (101,'tea set');
INSERT INTO `library_keyword` VALUES (102,'wine');
INSERT INTO `library_keyword` VALUES (103,'glass');
INSERT INTO `library_keyword` VALUES (104,'wine glass');
INSERT INTO `library_keyword` VALUES (105,'drinking');
INSERT INTO `library_keyword` VALUES (106,'wooden chair');
INSERT INTO `library_keyword` VALUES (107,'stone');
INSERT INTO `library_keyword` VALUES (108,'gray');
INSERT INTO `library_keyword` VALUES (109,'walls');
INSERT INTO `library_keyword` VALUES (110,'alchemy');
INSERT INTO `library_keyword` VALUES (111,'room');
INSERT INTO `library_keyword` VALUES (112,'medieval');
INSERT INTO `library_keyword` VALUES (113,'interior');
INSERT INTO `library_keyword` VALUES (114,'gold');
INSERT INTO `library_keyword` VALUES (115,'asian');
INSERT INTO `library_keyword` VALUES (116,'treasure');
INSERT INTO `library_keyword` VALUES (117,'decor');
INSERT INTO `library_keyword` VALUES (118,'precious');
INSERT INTO `library_keyword` VALUES (119,'luxury');
INSERT INTO `library_keyword` VALUES (120,'bamboo');
INSERT INTO `library_keyword` VALUES (121,'natural');
INSERT INTO `library_keyword` VALUES (122,'eco-friendly');
INSERT INTO `library_keyword` VALUES (123,'plant');
INSERT INTO `library_keyword` VALUES (124,'ladder');
INSERT INTO `library_keyword` VALUES (125,'climbing');
INSERT INTO `library_keyword` VALUES (126,'rustic');
INSERT INTO `library_keyword` VALUES (127,'jello');
INSERT INTO `library_keyword` VALUES (128,'blue');
INSERT INTO `library_keyword` VALUES (129,'dessert');
INSERT INTO `library_keyword` VALUES (130,'gelatin');
INSERT INTO `library_keyword` VALUES (131,'transparent');
INSERT INTO `library_keyword` VALUES (132,'colorful');
INSERT INTO `library_keyword` VALUES (133,'pillow');
INSERT INTO `library_keyword` VALUES (134,'fabric');
INSERT INTO `library_keyword` VALUES (135,'cushion');
INSERT INTO `library_keyword` VALUES (136,'soft');
INSERT INTO `library_keyword` VALUES (137,'comfortable');
INSERT INTO `library_keyword` VALUES (138,'bone');
INSERT INTO `library_keyword` VALUES (139,'box');
INSERT INTO `library_keyword` VALUES (140,'bookshelf');
INSERT INTO `library_keyword` VALUES (141,'shelf');
INSERT INTO `library_keyword` VALUES (142,'reading');
INSERT INTO `library_keyword` VALUES (143,'paper');
INSERT INTO `library_keyword` VALUES (144,'brown');
INSERT INTO `library_keyword` VALUES (145,'ink');
INSERT INTO `library_keyword` VALUES (146,'jar');
INSERT INTO `library_keyword` VALUES (147,'writing');
INSERT INTO `library_keyword` VALUES (148,'potion');
INSERT INTO `library_keyword` VALUES (149,'bust');
INSERT INTO `library_keyword` VALUES (150,'statue');
INSERT INTO `library_keyword` VALUES (151,'hat');
INSERT INTO `library_keyword` VALUES (152,'sculpture');
INSERT INTO `library_keyword` VALUES (153,'flame');
INSERT INTO `library_keyword` VALUES (154,'wax');
INSERT INTO `library_keyword` VALUES (155,'candles');
INSERT INTO `library_keyword` VALUES (156,'set');
INSERT INTO `library_keyword` VALUES (157,'capped');
INSERT INTO `library_keyword` VALUES (158,'register');
INSERT INTO `library_keyword` VALUES (159,'money');
INSERT INTO `library_keyword` VALUES (160,'shop');
INSERT INTO `library_keyword` VALUES (161,'cherry');
INSERT INTO `library_keyword` VALUES (162,'surface');
INSERT INTO `library_keyword` VALUES (163,'drawer');
INSERT INTO `library_keyword` VALUES (164,'scrolls');
INSERT INTO `library_keyword` VALUES (165,'cabinet');
INSERT INTO `library_keyword` VALUES (166,'horn');
INSERT INTO `library_keyword` VALUES (167,'drink');
INSERT INTO `library_keyword` VALUES (168,'platform');
INSERT INTO `library_keyword` VALUES (169,'log');
INSERT INTO `library_keyword` VALUES (170,'elevated');
INSERT INTO `library_keyword` VALUES (171,'structure');
INSERT INTO `library_keyword` VALUES (172,'empty');
INSERT INTO `library_keyword` VALUES (173,'bottle');
INSERT INTO `library_keyword` VALUES (174,'flared');
INSERT INTO `library_keyword` VALUES (175,'magic');
INSERT INTO `library_keyword` VALUES (176,'fox');
INSERT INTO `library_keyword` VALUES (177,'hand');
INSERT INTO `library_keyword` VALUES (178,'right');
INSERT INTO `library_keyword` VALUES (179,'model');
INSERT INTO `library_keyword` VALUES (180,'cauldron');
INSERT INTO `library_keyword` VALUES (181,'full');
INSERT INTO `library_keyword` VALUES (182,'game');
INSERT INTO `library_keyword` VALUES (183,'pieces');
INSERT INTO `library_keyword` VALUES (184,'go');
INSERT INTO `library_keyword` VALUES (185,'ginger');
INSERT INTO `library_keyword` VALUES (186,'hanging');
INSERT INTO `library_keyword` VALUES (187,'herb');
INSERT INTO `library_keyword` VALUES (188,'drying');
INSERT INTO `library_keyword` VALUES (189,'pickles');
INSERT INTO `library_keyword` VALUES (190,'preserved');
INSERT INTO `library_keyword` VALUES (191,'horns');
INSERT INTO `library_keyword` VALUES (192,'display');
INSERT INTO `library_keyword` VALUES (193,'wobbly');
INSERT INTO `library_keyword` VALUES (194,'ladle');
INSERT INTO `library_keyword` VALUES (195,'spoon');
INSERT INTO `library_keyword` VALUES (196,'utensil');
INSERT INTO `library_keyword` VALUES (197,'lantern');
INSERT INTO `library_keyword` VALUES (198,'metal');
INSERT INTO `library_keyword` VALUES (199,'large');
INSERT INTO `library_keyword` VALUES (200,'potted');
INSERT INTO `library_keyword` VALUES (201,'vegetation');
INSERT INTO `library_keyword` VALUES (202,'leaves');
INSERT INTO `library_keyword` VALUES (203,'green');
INSERT INTO `library_keyword` VALUES (204,'nature');
INSERT INTO `library_keyword` VALUES (205,'locked');
INSERT INTO `library_keyword` VALUES (206,'secure');
INSERT INTO `library_keyword` VALUES (207,'chest');
INSERT INTO `library_keyword` VALUES (208,'steps');
INSERT INTO `library_keyword` VALUES (209,'stairs');
INSERT INTO `library_keyword` VALUES (210,'path');
INSERT INTO `library_keyword` VALUES (211,'makeup');
INSERT INTO `library_keyword` VALUES (212,'containers');
INSERT INTO `library_keyword` VALUES (213,'beauty');
INSERT INTO `library_keyword` VALUES (214,'jars');
INSERT INTO `library_keyword` VALUES (215,'medicine');
INSERT INTO `library_keyword` VALUES (216,'healing');
INSERT INTO `library_keyword` VALUES (217,'oak');
INSERT INTO `library_keyword` VALUES (218,'orange');
INSERT INTO `library_keyword` VALUES (219,'realistic');
/*!40000 ALTER TABLE `library_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_statustag`
--

DROP TABLE IF EXISTS `library_statustag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_statustag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `statusTag` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `statusTag` (`statusTag`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_statustag`
--
-- ORDER BY:  `id`,`statusTag`

LOCK TABLES `library_statustag` WRITE;
/*!40000 ALTER TABLE `library_statustag` DISABLE KEYS */;
INSERT INTO `library_statustag` VALUES (1,'acquired');
INSERT INTO `library_statustag` VALUES (2,'approved');
INSERT INTO `library_statustag` VALUES (3,'standardized');
INSERT INTO `library_statustag` VALUES (7,'latest');
/*!40000 ALTER TABLE `library_statustag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_sublayer`
--

DROP TABLE IF EXISTS `library_sublayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_sublayer` (
  `id` char(32) NOT NULL,
  `version` varchar(32) NOT NULL,
  `sublayerName` varchar(200) NOT NULL,
  `filepath` varchar(200) NOT NULL,
  `asset_id` char(32) NOT NULL,
  `checkedOutBy_id` bigint DEFAULT NULL,
  `s3_versionID` varchar(64) DEFAULT NULL,
  `previousVersion_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `library_sublayer_asset_id_4d734dac_fk_library_asset_id` (`asset_id`),
  KEY `library_sublayer_checkedOutBy_id_0569313a_fk_library_author_id` (`checkedOutBy_id`),
  KEY `library_sublayer_previousVersion_id_abfdd40b_fk_library_s` (`previousVersion_id`),
  KEY `library_sublayer_filepath_de713fff` (`filepath`),
  KEY `library_sublayer_version_d60e82a4` (`version`),
  CONSTRAINT `library_sublayer_asset_id_4d734dac_fk_library_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `library_asset` (`id`),
  CONSTRAINT `library_sublayer_checkedOutBy_id_0569313a_fk_library_author_id` FOREIGN KEY (`checkedOutBy_id`) REFERENCES `library_author` (`id`),
  CONSTRAINT `library_sublayer_previousVersion_id_abfdd40b_fk_library_s` FOREIGN KEY (`previousVersion_id`) REFERENCES `library_sublayer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_sublayer`
--
-- ORDER BY:  `id`,`asset_id`,`checkedOutBy_id`,`previousVersion_id`,`filepath`,`version`

LOCK TABLES `library_sublayer` WRITE;
/*!40000 ALTER TABLE `library_sublayer` DISABLE KEYS */;
INSERT INTO `library_sublayer` VALUES ('0088463b0f194644a352742e3f39efbc','01.00.00','bookStack4.glb','cis-7000-usd-assets-versioned/Assets/bookStack4/contrib/.cache/bookStack4.glb','f1d3b419b0444e58a2e45fe157647464',NULL,'.pIvZoNXDaZfTI1xOjDBSL5l2lgyiKJs',NULL);
INSERT INTO `library_sublayer` VALUES ('00bdc51277754fd08faa83ae020f7740','04.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/sittingMoomin/contrib/geometry/LOD0/geometry_LOD0.usda','c0e55d851ea64aa4aeec27c29594a555',NULL,'ublgzsNGt6SYyFEAGOWRJ0HFQSNqg0PY',NULL);
INSERT INTO `library_sublayer` VALUES ('00e8a5b23397433996c025db38a14596','04.00.00','wineGlass.usda','usd-asset-versions-dump/2024-assets-acquisition/wineGlass/wineGlass.usda','31c39c346b394a1f90cf0a00f1c4a6ef',NULL,'KZ7m94QbnNrnHs8tTQcb80402lvdIOSO',NULL);
INSERT INTO `library_sublayer` VALUES ('0111c899e8414c0499e4082cfdee8f52','01.00.00','cappedJar.usda','cis-7000-usd-assets-versioned/Assets/cappedJar/cappedJar.usda','449fe9fdd5434b03ae7f5bc021402fbf',NULL,'5CCGs0PoxQd8jPaN9JfCD_RhTX72u1SM',NULL);
INSERT INTO `library_sublayer` VALUES ('02843b34da1046fca1d8018c43cbac43','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/largeCherryTable/contrib/material/default/material_default.usda','b24acc08b15546e896c3e25add15f1ba',NULL,'i1pnxP91NSZcRd0XnBw70Fjqdhy9fNou',NULL);
INSERT INTO `library_sublayer` VALUES ('02937e9f17dd420fba523fd7424e16d0','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/horns/contrib/geometry/LOD1/geometry_LOD1.usda','c21bb4bc82c74bf08857cc21bac2f3b4',NULL,'PsYbk6exPTimS4BfyG56GeU3ZHo6re9Q',NULL);
INSERT INTO `library_sublayer` VALUES ('02b389704f194aff97d7000a1d95e882','01.00.00','glassJarEmpty.usda','cis-7000-usd-assets-versioned/Assets/glassJarEmpty/glassJarEmpty.usda','6be75d74d18f4d88bc635b222107966f',NULL,'MTJzhMJwKIVuygdj48PyYDm68uude5H7',NULL);
INSERT INTO `library_sublayer` VALUES ('02b79267f9f8416f97ed1c4b7ae3eff6','02.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-02.00.00/campfire/thumbnail.png','6f6441599cc045ae91530ecd6cc5a81e',NULL,'nETlNf0JGdW1pr2gneN1OX.ZVh.HBGbk',NULL);
INSERT INTO `library_sublayer` VALUES ('02be432d29d04f05a95cd6c692a13bef','04.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/cartoonFish/contrib/geometry/LOD1/geometry_LOD1.usda','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'BJKx7L4jEFOpX6ganXM73tiedgx76Adl',NULL);
INSERT INTO `library_sublayer` VALUES ('02ff5ee47a1a45faa0d72dccddd986ce','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/barrel/contrib/geometry/geometry.usda','21ff4cfc83b0435a91b2404af9477d51',NULL,'lqWKfdSPFqZadvuKjAazlJPswnDcvqz0',NULL);
INSERT INTO `library_sublayer` VALUES ('03714a629e754fe0ae8864d6c30dbf28','04.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/skateboard/contrib/geometry/LOD1/geometry_LOD1.usda','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'bUjSlAfyKAV.2o5nsiJmQWcggRmaPo.B',NULL);
INSERT INTO `library_sublayer` VALUES ('03719e5ba18f4790a255d57d59d5a70f','01.00.00','glassJarFull.usda','cis-7000-usd-assets-versioned/Assets/glassJarFull/glassJarFull.usda','f3e934c53fa645b881d2e227e8eafaeb',NULL,'C0d_C.cWfa7_4OtNGFNwTP.j8LT4so2i',NULL);
INSERT INTO `library_sublayer` VALUES ('03a513e96dd04c2e964df0fdd7462f6c','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/lockedBox/contrib/geometry/bbox/geometry_bbox.usda','6ab7f53a7daf46a2ac8a83abcc89ecf9',NULL,'yDrkXoTT_0O8WicCXcu_eCYde7fe55QQ',NULL);
INSERT INTO `library_sublayer` VALUES ('044c7bf3b2d24e5a96d72658e8a1451b','04.00.00','carrotLOD1.usda','usd-asset-versions-dump/2024-assets-acquisition/carrot/carrotLOD1.usda','6188a79945fa415f906a1c6463a497eb',NULL,'GUVh6v2YZNFHV_8fxSHo65swlEzv9sL3',NULL);
INSERT INTO `library_sublayer` VALUES ('045ee427989c42188fc0ca18c82bab60','03.00.00','sittingMoomin.usda','usd-asset-versions-dump/2025-assets-03.00.00/sittingMoomin/sittingMoomin.usda','c0e55d851ea64aa4aeec27c29594a555',NULL,'gjzmbotok_IrcMm3yV9t366etRZTcSp_',NULL);
INSERT INTO `library_sublayer` VALUES ('04a86ed460474a82ae8bd169ada4badf','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/bookStack2/contrib/geometry/bbox/geometry_bbox.usda','76e5d476ecc44eeea6da09806954f8bd',NULL,'7GR4ewU.tEGQfUs3TAx8PIIFaOUWEM74',NULL);
INSERT INTO `library_sublayer` VALUES ('04a9b863a2a9415a81f9af8496a1dd0f','04.00.00','oldTelevision_model.usda','usd-asset-versions-dump/2024-assets-acquisition/oldTelevision/oldTelevision_model.usda','b6234f0922c94798ba12257342157faa',NULL,'Gbl5zldOqzKxJtESHDYIE7kbGvKJVTyJ',NULL);
INSERT INTO `library_sublayer` VALUES ('04e3dd579ff949ce82037b1344a23170','01.00.00','bambooLadder.usda','cis-7000-usd-assets-versioned/Assets/bambooLadder/bambooLadder.usda','f148935dbe764e648b2641d5ddcde381',NULL,'wJZZSd65hCLB_1NtzXhihVL_yU43SfVQ',NULL);
INSERT INTO `library_sublayer` VALUES ('05040fabf50c408f8567d12414abbe84','05.00.00','material_rocks.usda','cis-7000-usd-assets-versioned/Assets/campfire/contrib/material/rocks/material_rocks.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'igxAwwMo2_xtPwh.axbIFX.N34eKmhFz','1fbf243d2d92454b91504f384227f0b8');
INSERT INTO `library_sublayer` VALUES ('0588edc6b802488ebd9ae5e60016d03b','01.00.00','bustWearingHat.usda','cis-7000-usd-assets-versioned/Assets/bustWearingHat/bustWearingHat.usda','a94d3ddac1e64aff86cf5a194c50d8bf',NULL,'Sj_88zCqrKwkXZgJOLY5V8zzQ49aKPpn',NULL);
INSERT INTO `library_sublayer` VALUES ('058c120ff7224b0dbdcf0536ae36c04b','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/bookStack2/contrib/geometry/LOD0/geometry_LOD0.usda','76e5d476ecc44eeea6da09806954f8bd',NULL,'gNTW2ncpt5hDiCtHjTsX7t35KBn26jzA',NULL);
INSERT INTO `library_sublayer` VALUES ('059c3815c37d4247ab56c3db78bd9992','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/glassCauldron/contrib/material/default/texture/default.png','427b041b429f4dffb526ee677a936f12',NULL,'iamyukL65MYta3ocsvRqsuXXDvpgEEUC',NULL);
INSERT INTO `library_sublayer` VALUES ('05dd0f5e75a342daa91f25b72669d375','05.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/vintageLamp/contrib/geometry/LOD2/geometry_LOD2.usda','c4449799e71a4ce88999ea44a86e067b',NULL,'7Q_bmhNVPHkf0S9KL9dESQ09rSOgjE0w',NULL);
INSERT INTO `library_sublayer` VALUES ('0628ce47c36643368c7d3c8f693dbc05','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/candleGroup/contrib/material/default/texture/default.png','a1513d5dbdf7478aab3b4d659a3f5e74',NULL,'cEeaRc.gPYH_.7HzCmSJd4vaH4WRsKnu',NULL);
INSERT INTO `library_sublayer` VALUES ('06368f52fb104f69ab8d1e3d3fc805aa','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/doubleScrollDrawer/contrib/material/default/material_default.usda','d189b8bcea4e4e289d133f6fdfe25d8b',NULL,'PUhhagnvCKwtTu_96h50gwTAQY3G5Uq6',NULL);
INSERT INTO `library_sublayer` VALUES ('0638d4a878f643bea79d393ebcdd8a56','03.00.00','yugiohClockArc_LOD2.usda','usd-asset-versions-dump/2025-assets-03.00.00/yugiohClockArc/LODs/yugiohClockArc_LOD2.usda','4be817e19e11426ebeede52145732e77',NULL,'WxagoUYbHwEo2ESUXXYHjJANqAqDwMIH',NULL);
INSERT INTO `library_sublayer` VALUES ('066e5892e54e438b852ec0ee85edce61','01.00.00','hangingPickles.glb','cis-7000-usd-assets-versioned/Assets/hangingPickles/contrib/.cache/hangingPickles.glb','aa9e8d80d09e4675915f7e5080b7b351',NULL,'clbPeWL4v7hNLn.QcI2LgVpdc0lbWsHJ',NULL);
INSERT INTO `library_sublayer` VALUES ('068649ee89964f9a86e289bc4e27a3b4','01.00.00','foxHandRight.glb','cis-7000-usd-assets-versioned/Assets/foxHandRight/contrib/.cache/foxHandRight.glb','e1dc4b9960364ffba02431380e01df0f',NULL,'EYn5HaqQseaDblCq5q9ZOjssAniwHiDR',NULL);
INSERT INTO `library_sublayer` VALUES ('06a18f2cd9ec4e03ad5aab819ef72c57','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/lantern/contrib/geometry/LOD2/geometry_LOD2.usda','10a15094d1dc45b7bcf8c698420b9e91',NULL,'RzBvlO52ZuMvP5ZiRDbcVMiYje9.3xFL',NULL);
INSERT INTO `library_sublayer` VALUES ('06e2765e503048e285e9526856ffa577','05.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/mug/contrib/geometry/LOD0/geometry_LOD0.usda','5bac6ed09efe4816b7c427ffb08c599d',NULL,'HxfuCz2LwuXobKocXk3f18a_ma2XlKTH',NULL);
INSERT INTO `library_sublayer` VALUES ('06ebc6d8507648b88244ae1f5d2c64fb','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/goPieceJar/contrib/geometry/LOD1/geometry_LOD1.usda','65cb65e774ab4a4795d18ff514a071d9',NULL,'1V78WJhJHGnl3rNJdshrbs1qZFyXvgNn',NULL);
INSERT INTO `library_sublayer` VALUES ('07334c51a3df4e36b7cb39a48c4dc6f3','04.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/yellowDuck/contrib/material/material.usda','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'tH92FbQ8AVkSwqAiggBw_JRk2bET4xid',NULL);
INSERT INTO `library_sublayer` VALUES ('0767aa15fa0c453a96033e635f24bce9','01.00.00','oakTable.glb','cis-7000-usd-assets-versioned/Assets/oakTable/contrib/.cache/oakTable.glb','3dfa350b0a294d7c9f1b419180d71748',NULL,'YHtciTuLWw7qM268LUefUsKXENXAweSX',NULL);
INSERT INTO `library_sublayer` VALUES ('07740dcdcc6045b9be2bff5536051bc7','02.00.00','bookStack_LOD1.usda','usd-asset-versions-dump/2025-assets-02.00.00/bookStack/LODs/bookStack_LOD1.usda','082f328bf76a4d48be255c620a8cd280',NULL,'RB74WMI1Yey.r8SdohXC847IJfjG.PDo',NULL);
INSERT INTO `library_sublayer` VALUES ('082526dbe3ed44f088d767de324e52f7','04.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/sittingMoomin/contrib/material/material.usda','c0e55d851ea64aa4aeec27c29594a555',NULL,'OrNVxsrqmqoZt.9FQlwsu0m9pYqXyb.T',NULL);
INSERT INTO `library_sublayer` VALUES ('09dd651b7f924e409f97c83a5d19afda','03.00.00','metadata.json','usd-asset-versions-dump/2025-assets-03.00.00/parkBench/metadata.json','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'ILsw8dsLuQOxz9.7JfVqUvIAmcuw4rO_',NULL);
INSERT INTO `library_sublayer` VALUES ('0a4b96af0ea543fb8050133124069c9a','05.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/campfire/contrib/material/material.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'xZ8OCIuv6vgot2N8qRO9Wi9rOwGcWaA9',NULL);
INSERT INTO `library_sublayer` VALUES ('0a592adda02747c494aff95c16e915e5','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/candle/contrib/geometry/bbox/geometry_bbox.usda','f0941eb324214c48b9a0755db5eaf79b',NULL,'F_njzv.kaLVPkO0uA2iQq_RrQxOIbW5J',NULL);
INSERT INTO `library_sublayer` VALUES ('0a677efd0e794db5b52cc06c22e1b6e3','03.00.00','campfire_LOD0.usda','usd-asset-versions-dump/2025-assets-03.00.00/campfire/LODs/campfire_LOD0.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'1IPoyK_k7pOvJc3_CnX_N9UTUFQ6nl3Z',NULL);
INSERT INTO `library_sublayer` VALUES ('0aa360bddc964210832e6813f1378b94','04.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/sittingMoomin/contrib/geometry/geometry.usda','c0e55d851ea64aa4aeec27c29594a555',NULL,'OeukZWMCxYKEYDg.wvm242DAm3Ztp44o',NULL);
INSERT INTO `library_sublayer` VALUES ('0aa6e5e500364eb3ab46a7883b64f47e','02.00.00','campfire_LOD0.usda','usd-asset-versions-dump/2025-assets-02.00.00/campfire/LODs/campfire_LOD0.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'sU2V4gNaJzMmz5NZMFSkXhXZabXtZKof',NULL);
INSERT INTO `library_sublayer` VALUES ('0ab4e9667abd4a449df4c80bc8c236ba','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/cashRegister/contrib/geometry/LOD0/geometry_LOD0.usda','ca9ae1e89e6145bea24272531dcfbe27',NULL,'oP1LdS6u1EM4iXx9qBYoyvpjivZdeYT_',NULL);
INSERT INTO `library_sublayer` VALUES ('0b62bad88f004b299e701713f154b8c5','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/blueJello/contrib/geometry/LOD2/geometry_LOD2.usda','3d6b8007d30e4919a46deedb6dfce573',NULL,'cFIFplJG642rsH8.ArKCnHXKhS9hvf9T',NULL);
INSERT INTO `library_sublayer` VALUES ('0b942a5a9b3a42089bfdb3613002b3f3','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/bulbousInkJar/contrib/geometry/geometry.usda','d9782679927741a6b9b9449b3054ff77',NULL,'.dd9jES23.vuETp26fS4XpSZxcw_9Ukx',NULL);
INSERT INTO `library_sublayer` VALUES ('0bcea527322d44a8abc7ff1c677a8736','04.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/pickleBarrels/contrib/geometry/LOD0/geometry_LOD0.usda','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'tcg0TA4lhzOLwnpgTKu9e9R1H9hrmqcZ',NULL);
INSERT INTO `library_sublayer` VALUES ('0bf4b1079eb24185a302e98101e4fa98','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/drawerAssembly/contrib/.thumbs/thumbnail.png','2652016a66e647f2bb874058b4d7e13c',NULL,'Xk5vcO00v2OjDLjU3lTYyl5rWMUMLnY0',NULL);
INSERT INTO `library_sublayer` VALUES ('0c248cd88c224d9998471fa44dc6228e','04.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/sittingMoomin/contrib/geometry/LOD2/geometry_LOD2.usda','c0e55d851ea64aa4aeec27c29594a555',NULL,'FELwmVwP5ybAoIZmm9IHvM3z3gAESRag',NULL);
INSERT INTO `library_sublayer` VALUES ('0c6c71c2e23c4963be5a75bddae22d68','01.00.00','flaredPotion.glb','cis-7000-usd-assets-versioned/Assets/flaredPotion/contrib/.cache/flaredPotion.glb','16fd6a411cc2475099c6b26a09175e77',NULL,'xwarjI8f41rxc49MHiPIHUaaqt2pnWEf',NULL);
INSERT INTO `library_sublayer` VALUES ('0c79d56559a1438fa324efbf80972103','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/bookStack5/contrib/geometry/LOD0/geometry_LOD0.usda','fa20ba6a205e4d2b951f8262bf5b2802',NULL,'BcbANzP9ndHKAceQoxH7T4pdj8DVtevs',NULL);
INSERT INTO `library_sublayer` VALUES ('0cd6e274afd54daaae98dda4a24d045b','04.00.00','mugLOD0.usda','usd-asset-versions-dump/2024-assets-acquisition/mug/mugLOD0.usda','5bac6ed09efe4816b7c427ffb08c599d',NULL,'JmRUFxD5j64c9IeoU4g12geRTLAflOvJ',NULL);
INSERT INTO `library_sublayer` VALUES ('0dbf6ae17226437490f4ffec4fc07444','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/bambooContainer/contrib/geometry/LOD1/geometry_LOD1.usda','1c7130d2d78e49d990ba12cde563e7c3',NULL,'zuZ0z4OBb2cPXeDANy1K7BPaiwgGylRR',NULL);
INSERT INTO `library_sublayer` VALUES ('0e511a86742048bfbc293f6493fc1e8e','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/blueJello/contrib/geometry/geometry.usda','3d6b8007d30e4919a46deedb6dfce573',NULL,'ETINsg19YjGsnKxf.sH41bOwLZrxMDYc',NULL);
INSERT INTO `library_sublayer` VALUES ('0e56f512e3df41e190503916f755e0bd','01.00.00','jelloShelf.glb','cis-7000-usd-assets-versioned/Assets/jelloShelf/contrib/.cache/jelloShelf.glb','99f5e6f9675b41ed91e76daebb016c4a',NULL,'kMjqOZqaR1Idy1SdsifsOAQ4s1aT12ld',NULL);
INSERT INTO `library_sublayer` VALUES ('0f1095980e81473a8e686a8a3ff39fc9','01.00.00','bambooContainer.usda','cis-7000-usd-assets-versioned/Assets/bambooContainer/bambooContainer.usda','1c7130d2d78e49d990ba12cde563e7c3',NULL,'E2_GZj0zvleW5075xrephFWdGj6QdeUp',NULL);
INSERT INTO `library_sublayer` VALUES ('0f6214dc34504c10938ebb874e8a90ae','05.00.00','penTablet.usd','cis-7000-usd-assets-versioned/Assets/penTablet/penTablet.usd','db17d0c2030049769e1ba2ea54d86114',NULL,'qxvqID4nNA6hp52EEUrP5_GxrnXm5EVL',NULL);
INSERT INTO `library_sublayer` VALUES ('0facb9393f9a4e35bb75c5f46d7d7a8c','04.00.00','material_logs.usda','cis-7000-usd-assets-versioned/Assets/campfire/contrib/material/logs/material_logs.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'S5uM15_FCgFFkWvnACojgRmAxcbHI.Zl',NULL);
INSERT INTO `library_sublayer` VALUES ('0fe8e904340e495695bf06f22d62887c','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/largeCherryTable/contrib/geometry/LOD2/geometry_LOD2.usda','b24acc08b15546e896c3e25add15f1ba',NULL,'reXV_y7TBcyNBCesp6cSnAjHUiEqlg6O',NULL);
INSERT INTO `library_sublayer` VALUES ('1035ad53a5ec4539b154c3f46a67902b','02.00.00','pickleBarrels_LOD1.usda','usd-asset-versions-dump/2025-assets-02.00.00/pickleBarrels/LODs/pickleBarrels_LOD1.usda','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'XNJh4LSpXhQnsYr9ZJUmuQ9tud1di76g',NULL);
INSERT INTO `library_sublayer` VALUES ('1048634fd2d5455e9ab40b681ad9d71d','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/emptyDrawer/contrib/material/material.usda','aff070bc60b647e29d302848b812f7c2',NULL,'S1ERdnfdaR0vunVWU8ye2nxZbVVI4UIl',NULL);
INSERT INTO `library_sublayer` VALUES ('105d3dbfeb5d4d3e90807dd3f98e67a2','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/barrel/contrib/geometry/LOD0/geometry_LOD0.usda','21ff4cfc83b0435a91b2404af9477d51',NULL,'kll6Rf8M37rmZFBlKJA9aL5p1cFZzPwQ',NULL);
INSERT INTO `library_sublayer` VALUES ('10622b8c90434bf68aa72e29d4e2a145','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/emptyDrawer/contrib/.thumbs/thumbnail.png','aff070bc60b647e29d302848b812f7c2',NULL,'GGoAhTtvmuswWcNCHTOGcyAf_Y93LXKs',NULL);
INSERT INTO `library_sublayer` VALUES ('1070ae32501f4ca794bc47b9327b3798','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/lantern/contrib/material/default/texture/default.png','10a15094d1dc45b7bcf8c698420b9e91',NULL,'3aUg7MfMkqzDVu4IEt9vdd2VUgfIoPep',NULL);
INSERT INTO `library_sublayer` VALUES ('1073fa05b88044ed8bfedaa1677ebf56','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/medicineBottle/contrib/material/material.usda','8deb7dd1667c428b89933de25c02e4ce',NULL,'pPHS6777.DqMbaO9.T7mSgk4IK5XLjcC',NULL);
INSERT INTO `library_sublayer` VALUES ('11914cee3d074196a62a3cab9e83abf3','01.00.00','bookshelf1.usda','cis-7000-usd-assets-versioned/Assets/bookshelf1/bookshelf1.usda','f3a014272b104716a4e1296a4dcf4404',NULL,'HewseoUVWrssMM8MAuZFav0VB_ivjHc0',NULL);
INSERT INTO `library_sublayer` VALUES ('11aa09e4c25c4e9fb02455e309552dcb','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/brownBook/contrib/geometry/LOD2/geometry_LOD2.usda','1cb7eed87f6c413b9a582792de2f2fe1',NULL,'E5bSW1QBQ2eusFwANA6huyXBXea90ILu',NULL);
INSERT INTO `library_sublayer` VALUES ('1243e6596de74c4d9780d8bb4c2fecbe','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/cashRegister/contrib/geometry/LOD1/geometry_LOD1.usda','ca9ae1e89e6145bea24272531dcfbe27',NULL,'_B5W.bA6t.jUS6K9WBUPUvGRMnZ8u0mu',NULL);
INSERT INTO `library_sublayer` VALUES ('1256edba410e45dd8f749096efb20b7b','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/bambooContainer/contrib/material/default/material_default.usda','1c7130d2d78e49d990ba12cde563e7c3',NULL,'T2T9D38e_tXxKsUhuLNeSM6ZMX1U1zGy',NULL);
INSERT INTO `library_sublayer` VALUES ('12842443869f4b36bda7091ae186c520','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/leafyVegetation/contrib/.thumbs/thumbnail.png','bc9563cab790436abc6180a53087ad1a',NULL,'2s5MoYE4l4DnfcwcMXHN_2UwJKZ0KhIA',NULL);
INSERT INTO `library_sublayer` VALUES ('129f5a8067b44daea69b62adafe2c0c1','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/glassCauldron/contrib/.thumbs/thumbnail.png','427b041b429f4dffb526ee677a936f12',NULL,'lcOa5ttOJGWBl1748iDLUFA6qeEz5lkR',NULL);
INSERT INTO `library_sublayer` VALUES ('12ddf398e89044a8bb7969e5a199e5a2','05.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/campfire/contrib/.thumbs/thumbnail.png','6f6441599cc045ae91530ecd6cc5a81e',NULL,'ZmoGfHNKPld032O8qvqxEiTUGDgxLKzb','2b4a2e3ea0e648888aa410d0b80eb75d');
INSERT INTO `library_sublayer` VALUES ('1317b5e8b993488dba088ec532b1daa4','05.00.00','default.png','cis-7000-usd-assets-versioned/Assets/woodenChair/contrib/material/default/texture/default.png','b7d69121f36340adbdb7bed776c42a8d',NULL,'3ajTNlTYAULJ7jBrKyf4c1Tg0Tgkw4UM',NULL);
INSERT INTO `library_sublayer` VALUES ('13cc3cd59f064aa8a12d7fda153738df','04.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/teapot/contrib/material/material.usda','f5e189a845fb4ed3930a81263a21bf99',NULL,'e6Jf68KcmCxbDWelyCIQKGIB0z9MORA_',NULL);
INSERT INTO `library_sublayer` VALUES ('13e830ff238848df8943cfb853c367c6','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/brownBook/contrib/.thumbs/thumbnail.png','1cb7eed87f6c413b9a582792de2f2fe1',NULL,'ZYrSWND6q5BfIVm.aCuF4U2VZgBaSbJ3',NULL);
INSERT INTO `library_sublayer` VALUES ('13ea4842bc334abf95ade297a8db0d3b','03.00.00','cartoonFish_LOD0.usda','usd-asset-versions-dump/2025-assets-03.00.00/cartoonFish/LODs/cartoonFish_LOD0.usda','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'A3AKg0bF9IsATMe13NwOau.4xgDJxtj9',NULL);
INSERT INTO `library_sublayer` VALUES ('13fe0fa39d9148dfb77ec3f567be425f','03.00.00','yugiohClockArc.usda','usd-asset-versions-dump/2025-assets-03.00.00/yugiohClockArc/yugiohClockArc.usda','4be817e19e11426ebeede52145732e77',NULL,'YOvvT65KN5axha4n_AshgzdwYvjlQfJG',NULL);
INSERT INTO `library_sublayer` VALUES ('144a69c97af7498fa7ecf527dc510a3d','05.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/sushi/contrib/material/material.usda','2c7ef29f88474ded95eb449ebb264ead',NULL,'B.z1vX9uQ0Xo_0nzde4Z4EqHzaFxAZ2k',NULL);
INSERT INTO `library_sublayer` VALUES ('147f265349d54887b69fa90a3b6d9092','03.00.00','yellowDuck_LOD2.usda','usd-asset-versions-dump/2025-assets-03.00.00/yellowDuck/LODs/yellowDuck_LOD2.usda','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'Igk_nM4RQenJdLCUIVyjv.gG6XYuQdRO',NULL);
INSERT INTO `library_sublayer` VALUES ('14c2eebf585b45b0accb69fb60b490a2','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/hangingPickles/contrib/material/default/material_default.usda','aa9e8d80d09e4675915f7e5080b7b351',NULL,'QV55NVIHHC4zNC4hPIG.I4CbCVU3sTwV',NULL);
INSERT INTO `library_sublayer` VALUES ('150e74bf457c482e8627bb607284905d','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/ladle/contrib/geometry/geometry.usda','89dbc25b1e554c6eae3212cc3e28850c',NULL,'jGcS7LJ7FRGrI8CPDkVZsPXPvzbXKAVy',NULL);
INSERT INTO `library_sublayer` VALUES ('15278124bcfa430e95a4bb7fc35d59e8','03.00.00','vintageLamp_LOD1.usda','usd-asset-versions-dump/2025-assets-02.00.00/vintageLamp/LODs/vintageLamp_LOD1.usda','c4449799e71a4ce88999ea44a86e067b',NULL,'wmK_lXE6FuyWfWKVffbutgO6O3sdmoFy',NULL);
INSERT INTO `library_sublayer` VALUES ('15538a70175c492387e0dcd0a8502570','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/bookshelf1/contrib/geometry/LOD2/geometry_LOD2.usda','f3a014272b104716a4e1296a4dcf4404',NULL,'iGD7e24pFfNmzL_PWHNB.ca7QRUjOna0',NULL);
INSERT INTO `library_sublayer` VALUES ('15664128978b476d8f35b14a40236a2c','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/glassCauldron/contrib/geometry/bbox/geometry_bbox.usda','427b041b429f4dffb526ee677a936f12',NULL,'ai6.CfWFBtcM1vWFLNYAYQTxWhYYMvt9',NULL);
INSERT INTO `library_sublayer` VALUES ('15b99bd50fc849f088ea634b394691a5','05.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/carrot/contrib/geometry/LOD2/geometry_LOD2.usda','6188a79945fa415f906a1c6463a497eb',NULL,'8SFmnRt3mIkqvUK4vyITFK8HF7KGR9i7',NULL);
INSERT INTO `library_sublayer` VALUES ('15db36ab63a74d94841877fae2dc537d','03.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-02.00.00/vintageLamp/thumbnail.png','c4449799e71a4ce88999ea44a86e067b',NULL,'1_osGozpWzhEqW4Tm9horyjNjsq101av',NULL);
INSERT INTO `library_sublayer` VALUES ('167719843cd14d0a987590eacb22f251','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/bookStack6/contrib/material/material.usda','3684e1145a004e7987f06b8c071166a1',NULL,'IyDOI6BqbjloPVJ64uz3iOUBpctDfRgk',NULL);
INSERT INTO `library_sublayer` VALUES ('16c21e481acd4ad393db97b2f5aae91d','05.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/wineGlass/contrib/.thumbs/thumbnail.png','31c39c346b394a1f90cf0a00f1c4a6ef',NULL,'dIDICm0k5Z4sluS_bTVSxcvmokA9F93A',NULL);
INSERT INTO `library_sublayer` VALUES ('16dcbc8a785f45cc8dc193dc94bbc568','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/logSteps/contrib/geometry/LOD0/geometry_LOD0.usda','bcb688a70758427fbb7e23d1ed9d756e',NULL,'uqyHnuozvCtR6h29sdS_Ok9eB.Z5ZN5X',NULL);
INSERT INTO `library_sublayer` VALUES ('1754ed9d0f204b3699a736738b86d0b8','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/largePottedPlant/contrib/geometry/geometry.usda','cc9847c9e64a4341bd8287edf73afe04',NULL,'qwbVz3j9donNMCiRkmojQZkfOCHBg3D5',NULL);
INSERT INTO `library_sublayer` VALUES ('177a06e9848041a9a03fc50ab4fd2935','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/bulbousInkJar/contrib/geometry/LOD2/geometry_LOD2.usda','d9782679927741a6b9b9449b3054ff77',NULL,'E5lBGXTjVXW1zsVaOjfR5ATd1EqzSZBz',NULL);
INSERT INTO `library_sublayer` VALUES ('177cd383c45e48b9bab188ba19ae75e4','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/foxHandRight/contrib/material/default/material_default.usda','e1dc4b9960364ffba02431380e01df0f',NULL,'09Xuoa0NX_K0qcTL2Mty9DQcQo5wnms3',NULL);
INSERT INTO `library_sublayer` VALUES ('17c47250003d4649a550318f4a01ecb1','04.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/flatTeapot/contrib/geometry/LOD2/geometry_LOD2.usda','3d283193f6b54cf0a233a5b83ed95819',NULL,'_7i025RVqe2QtuS0rE_m6jrPllsh5BJX',NULL);
INSERT INTO `library_sublayer` VALUES ('182722a01ccd4095b3ce997f1b074921','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/glassCauldron/contrib/geometry/geometry.usda','427b041b429f4dffb526ee677a936f12',NULL,'F4SYQTowTVYv2cVGxg2oGFQWbXQrzBZ8',NULL);
INSERT INTO `library_sublayer` VALUES ('184b853e165b4d38bab58787db18dce4','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/logSteps/contrib/.thumbs/thumbnail.png','bcb688a70758427fbb7e23d1ed9d756e',NULL,'yHlaqEDpoKVR154SQDlesJH096L5gBKQ',NULL);
INSERT INTO `library_sublayer` VALUES ('18853089b8624e6cacfad5196d62e0ae','02.00.00','metadata.json','usd-asset-versions-dump/2025-assets-02.00.00/bookStack/metadata.json','082f328bf76a4d48be255c620a8cd280',NULL,'P0yr8EyiKec7G0mE51_WQdfk2wJGFI9N',NULL);
INSERT INTO `library_sublayer` VALUES ('18d99b4b317f4dd7ac683732d822140d','04.00.00','thumb.png','usd-asset-versions-dump/2024-assets-acquisition/carrot/thumb.png','6188a79945fa415f906a1c6463a497eb',NULL,'tXcYa30TrxbHCG.m1NH9Gtht.uE.AA74',NULL);
INSERT INTO `library_sublayer` VALUES ('18fbe2d0a6dc4f8aa73a79dbfacca317','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/horns/contrib/geometry/LOD2/geometry_LOD2.usda','c21bb4bc82c74bf08857cc21bac2f3b4',NULL,'6t4vpNGyJ7.ujYpLbW0kE748o2vaEtC0',NULL);
INSERT INTO `library_sublayer` VALUES ('1918ef6e12d1425ca0ee245f240f92a5','04.00.00','oldTelevisionLOD1.usda','usd-asset-versions-dump/2024-assets-acquisition/oldTelevision/oldTelevisionLOD1.usda','b6234f0922c94798ba12257342157faa',NULL,'wBUQw81CTVJHiuEo46f.3rUDzqy0ol0T',NULL);
INSERT INTO `library_sublayer` VALUES ('196d0687229b414eb9e61aea2ee1b189','04.00.00','paniniPress_model.usda','usd-asset-versions-dump/2024-assets-acquisition/paniniPress/paniniPress_model.usda','3dcf8a1dac8242a59f83c50df682fb69',NULL,'yViEU6hcWnpEQ95UUwYfYQ1NS5SLNAS4',NULL);
INSERT INTO `library_sublayer` VALUES ('196f3585431344608bcf683f832494df','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/boneBox/contrib/geometry/LOD1/geometry_LOD1.usda','993f2365ed5446068f9eb0e6c21a8e9c',NULL,'WCdQyr1jfo8U9P29Tu5HJsI8nZ0KXr7A',NULL);
INSERT INTO `library_sublayer` VALUES ('1976415984ba40dd95147cb820abeb8c','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/bookStack2/contrib/.thumbs/thumbnail.png','76e5d476ecc44eeea6da09806954f8bd',NULL,'EKtnFTaQkQGEohnT.FkQYQyHgDZjgDBx',NULL);
INSERT INTO `library_sublayer` VALUES ('1976b15fe31a495cbd52e020ded276f2','02.00.00','bookStack.fbx','usd-asset-versions-dump/2025-assets-02.00.00/bookStack/bookStack.fbx','082f328bf76a4d48be255c620a8cd280',NULL,'C7yu1Lk6l4BTGLA8w0OExOyHc34kh8af',NULL);
INSERT INTO `library_sublayer` VALUES ('199ff1d5f0164f2682e2acb5fff17c1d','04.00.00','metadata.json','usd-asset-versions-dump/2024-assets-acquisition/woodenChair/metadata.json','b7d69121f36340adbdb7bed776c42a8d',NULL,'0QP8of3pQizag7_V0BH3uiE3Dg2i98dC',NULL);
INSERT INTO `library_sublayer` VALUES ('1a31d936de2240bc905da5a3cf712d19','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/bustWearingHat/contrib/.thumbs/thumbnail.png','a94d3ddac1e64aff86cf5a194c50d8bf',NULL,'a40Je9xuTrwDvGUtQUmcCBmnAK.hf3Qu',NULL);
INSERT INTO `library_sublayer` VALUES ('1ab804f529ba469796e26d62b0926668','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/goPieceJar/contrib/geometry/bbox/geometry_bbox.usda','65cb65e774ab4a4795d18ff514a071d9',NULL,'KyVspV9EUOhvCSjsb7f4uJFRkKAYMg9N',NULL);
INSERT INTO `library_sublayer` VALUES ('1afe791cb3b4447a9f760a9b13b73dd8','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/foxHandRight/contrib/geometry/geometry.usda','e1dc4b9960364ffba02431380e01df0f',NULL,'0A9eSkU4l6VhM3O1ygKNWDg3YlDY4FRh',NULL);
INSERT INTO `library_sublayer` VALUES ('1b20353bc07044aba42975297f46c8cc','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/drawerAssembly/contrib/material/material.usda','2652016a66e647f2bb874058b4d7e13c',NULL,'S8XHAOCQpudZhgB876n3I7VfVJ5ECX4J',NULL);
INSERT INTO `library_sublayer` VALUES ('1b457f71a7cf4463b78410c7db6536a4','04.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/cartoonFish/contrib/geometry/bbox/geometry_bbox.usda','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'iGbSpDDl38RpRfyF1meYgacSf6I5bG9r',NULL);
INSERT INTO `library_sublayer` VALUES ('1b5ad23611a34528938e6238bf12f726','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/ladle/contrib/geometry/bbox/geometry_bbox.usda','89dbc25b1e554c6eae3212cc3e28850c',NULL,'Jqbow0VIUiFdIxzOmk9OmQFtuCOwD4B2',NULL);
INSERT INTO `library_sublayer` VALUES ('1b9c03f33aff4ee68c5fa5c73295d0cb','03.00.00','metadata.json','usd-asset-versions-dump/2025-assets-03.00.00/yugiohClockArc/metadata.json','4be817e19e11426ebeede52145732e77',NULL,'t6mZedRilckWFbekEW.DB3z5BXUot.pb',NULL);
INSERT INTO `library_sublayer` VALUES ('1ba28eaf0a994d6298b37e336f7a0597','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/bambooLadder/contrib/geometry/bbox/geometry_bbox.usda','f148935dbe764e648b2641d5ddcde381',NULL,'93ZYQQEnxqzvzFwm_f5UDMeTyRFLJF1F',NULL);
INSERT INTO `library_sublayer` VALUES ('1c3c3f96ccae4899b0497ee761449d86','02.00.00','beegCrab_LOD1.usda','usd-asset-versions-dump/2025-assets-02.00.00/beegCrab/LODs/beegCrab_LOD1.usda','f175fbe4933944a69d06e86c906622d6',NULL,'xhanOerlwgJXAGKv2K9iDiEu9sQxHGng',NULL);
INSERT INTO `library_sublayer` VALUES ('1c51bc2952dd454aa7acf713e17f3df6','02.00.00','yugiohClockArc_LOD2.usda','usd-asset-versions-dump/2025-assets-02.00.00/yugiohClockArc/LODs/yugiohClockArc_LOD2.usda','4be817e19e11426ebeede52145732e77',NULL,'lMpPrh_0pUudl48fJl8E8dk.Ks7q26ft',NULL);
INSERT INTO `library_sublayer` VALUES ('1c559b960a344fd696982fc13842df1e','05.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/sushi/contrib/geometry/LOD0/geometry_LOD0.usda','2c7ef29f88474ded95eb449ebb264ead',NULL,'GphOyDLvNZ_0VxAi5Cvjh_QRyPsoNn28',NULL);
INSERT INTO `library_sublayer` VALUES ('1c82399215254ea09dd7cc704874f531','01.00.00','bookStack.fbx','usd-asset-versions-dump/2025-assets-01.00.00/bookStack/bookStack.fbx','082f328bf76a4d48be255c620a8cd280',NULL,'771NPidV.8hFiNzgKsCgt9fAU4iUWMOH',NULL);
INSERT INTO `library_sublayer` VALUES ('1cdfedc78bb84ecda24f29eab7d5b23b','03.00.00','cartoonFish.usda','usd-asset-versions-dump/2025-assets-03.00.00/cartoonFish/cartoonFish.usda','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'GxOrwizLJGvCaCify6NLh2mCPc7gRHhi',NULL);
INSERT INTO `library_sublayer` VALUES ('1d1f446f61524dc7b2132c4503950a57','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/boneBox/contrib/material/material.usda','993f2365ed5446068f9eb0e6c21a8e9c',NULL,'3O2g6ysPdYqspQjqpju7ujqnjzytbwRg',NULL);
INSERT INTO `library_sublayer` VALUES ('1d3a0241d2db4267b9503b9fda0e83bb','01.00.00','bookshelf3.glb','cis-7000-usd-assets-versioned/Assets/bookshelf3/contrib/.cache/bookshelf3.glb','fa5e37ee437e45acb2ae0c3c9c725b83',NULL,'PMyEx8zF87WPqLy.CE2eXLcC8a71TDHa',NULL);
INSERT INTO `library_sublayer` VALUES ('1d724c39e4704147b8576a5c7f5bdfc2','04.00.00','woodenChair.ma','usd-asset-versions-dump/2024-assets-acquisition/woodenChair/woodenChair.ma','b7d69121f36340adbdb7bed776c42a8d',NULL,'90BGaha36uZ0lA4Lv8mOGhIcLuGMnCxs',NULL);
INSERT INTO `library_sublayer` VALUES ('1d8aebae1c69434991895fa3089c1d9e','04.00.00','pickleBarrels.usd','cis-7000-usd-assets-versioned/Assets/pickleBarrels/pickleBarrels.usd','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'Apdv.NZr9a_r1sYdra5Z8qgCeOpIB2Ni',NULL);
INSERT INTO `library_sublayer` VALUES ('1dcd7640b41c4d28a0956443c9d4e3b8','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/flaredPotion/contrib/geometry/LOD1/geometry_LOD1.usda','16fd6a411cc2475099c6b26a09175e77',NULL,'2xM866nbUBMAEYs4vMUv3qVxeAknPgEn',NULL);
INSERT INTO `library_sublayer` VALUES ('1ddc397cb7a14914b0392f281e6cd7aa','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/bookStack4/contrib/geometry/bbox/geometry_bbox.usda','f1d3b419b0444e58a2e45fe157647464',NULL,'jmcSKx1RSIKEMpMfeGw76EAvITgVmvJC',NULL);
INSERT INTO `library_sublayer` VALUES ('1de0ad239b544f95b014460d4928483e','01.00.00','largeCherryTable.usda','cis-7000-usd-assets-versioned/Assets/largeCherryTable/largeCherryTable.usda','b24acc08b15546e896c3e25add15f1ba',NULL,'klh45YUm1YZXTKiRLR4nfttxaLCH66Ho',NULL);
INSERT INTO `library_sublayer` VALUES ('1e300aef29244c009f4a7a420d39cbed','04.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/bookStack/contrib/material/material.usda','082f328bf76a4d48be255c620a8cd280',NULL,'Gps4ccCtORTOLKFBPvZNvmyLRShmbtdU',NULL);
INSERT INTO `library_sublayer` VALUES ('1e4a31e3763d4d4eb8f0f9b1cdc6f4ce','04.00.00','carrotLOD0.usda','usd-asset-versions-dump/2024-assets-acquisition/carrot/carrotLOD0.usda','6188a79945fa415f906a1c6463a497eb',NULL,'XlmnWoiGf3KpRiTSk2EEuuOBGCgnoMfE',NULL);
INSERT INTO `library_sublayer` VALUES ('1e83a522c0dd4d979ee9322ad808be7b','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/emptyDrawer/contrib/geometry/LOD0/geometry_LOD0.usda','aff070bc60b647e29d302848b812f7c2',NULL,'DEDI9LC66aVpLJxgvUr_xpUUzkfdjY4f',NULL);
INSERT INTO `library_sublayer` VALUES ('1ec748590a1c40b8a88f8b3f4c90f1c9','02.00.00','pickleBarrels_LOD2.usda','usd-asset-versions-dump/2025-assets-02.00.00/pickleBarrels/LODs/pickleBarrels_LOD2.usda','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'mBdJngPBRJoV1_ErkiV4ltPXWNa2txgs',NULL);
INSERT INTO `library_sublayer` VALUES ('1edd3b9caf294d0985d217808af802c6','04.00.00','mug.ma','usd-asset-versions-dump/2024-assets-acquisition/mug/mug.ma','5bac6ed09efe4816b7c427ffb08c599d',NULL,'qSSjXvHFHEc2U70_SzCuBpe4nH90AQ6O',NULL);
INSERT INTO `library_sublayer` VALUES ('1f000c9eedc84e458947291d521c87fc','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/bambooLadder/contrib/geometry/LOD0/geometry_LOD0.usda','f148935dbe764e648b2641d5ddcde381',NULL,'gHAc.co1pV4S0GDTKbzZSi0MD3X_OMIJ',NULL);
INSERT INTO `library_sublayer` VALUES ('1f03c01f3dcf44e1be3189794b47d1b6','05.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/oldTelevision/contrib/geometry/geometry.usda','b6234f0922c94798ba12257342157faa',NULL,'2lAW_.GnrxtaJLLy0K0TX8YD_w3p9cLn',NULL);
INSERT INTO `library_sublayer` VALUES ('1f07dfd7b29c4e4d8470b6a36633b773','01.00.00','glassJarEmpty.glb','cis-7000-usd-assets-versioned/Assets/glassJarEmpty/contrib/.cache/glassJarEmpty.glb','6be75d74d18f4d88bc635b222107966f',NULL,'uAztRnNueP56xmZ3QUIf7KlZzW8PMmgL',NULL);
INSERT INTO `library_sublayer` VALUES ('1fa61f7c5e8348c3aea7eba11b84f287','04.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-03.00.00/vintageLamp/thumbnail.png','c4449799e71a4ce88999ea44a86e067b',NULL,'lw.zU4BGmTzHvnOWarkRoK8G34aNdGGs',NULL);
INSERT INTO `library_sublayer` VALUES ('1fbf243d2d92454b91504f384227f0b8','04.00.00','material_rocks.usda','cis-7000-usd-assets-versioned/Assets/campfire/contrib/material/rocks/material_rocks.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'JFZ1sCyNUHaa3a7tTbuTyZDiVxGkgcwU',NULL);
INSERT INTO `library_sublayer` VALUES ('20263d4a4f044f58bee85163086207e6','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/brownBook/contrib/geometry/LOD0/geometry_LOD0.usda','1cb7eed87f6c413b9a582792de2f2fe1',NULL,'06GT0CUhO2faByTx8Oxn2jHMgokTUjaa',NULL);
INSERT INTO `library_sublayer` VALUES ('207d8051b10640a88f56007c607a11da','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/drawerAssembly/contrib/geometry/geometry.usda','2652016a66e647f2bb874058b4d7e13c',NULL,'V2RY2JD1fPmys6vD2d6L8bCu5b6QRjuD',NULL);
INSERT INTO `library_sublayer` VALUES ('20a72e4175f64531bb1cd9031b49140e','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/brownBook/contrib/material/material.usda','1cb7eed87f6c413b9a582792de2f2fe1',NULL,'MZ.cdcho8wW2lgGYCnSjG6vd.eGfBQVO',NULL);
INSERT INTO `library_sublayer` VALUES ('20b06fbe1e2646a48fb12a59027add9f','04.00.00','metadata.json','usd-asset-versions-dump/2024-assets-acquisition/wineGlass/metadata.json','31c39c346b394a1f90cf0a00f1c4a6ef',NULL,'kt.jGTQNEdTGD7abi7KFVosuwaWgTl6A',NULL);
INSERT INTO `library_sublayer` VALUES ('210c8316d75540a49dd7f5d02bdeeb2e','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/largeInkBottle/contrib/material/default/material_default.usda','3eebe2a320dd4f10b98542d62deec15a',NULL,'1ueHbn3kVfYYxXKuaIvJvPAzoPORz6Na',NULL);
INSERT INTO `library_sublayer` VALUES ('217259ccc5e243efb5b79a67ea5c7c20','02.00.00','campfire_LOD1.usda','usd-asset-versions-dump/2025-assets-02.00.00/campfire/LODs/campfire_LOD1.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'1PMQEbzZS3_kUGV8_5rTVMJprp9Kn5jY',NULL);
INSERT INTO `library_sublayer` VALUES ('21c09de93c1644249496f07bb8200bf8','04.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/parkBench/contrib/.thumbs/thumbnail.png','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'pvM0q4R41HVLP1pqCSkOmxwrZx.xu_vE',NULL);
INSERT INTO `library_sublayer` VALUES ('22195941935345419828e1245f44ccd2','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/drawerAssembly/contrib/geometry/LOD2/geometry_LOD2.usda','2652016a66e647f2bb874058b4d7e13c',NULL,'_CsSSiDzqcjVtn7n5dt3xFMdWjDf28SQ',NULL);
INSERT INTO `library_sublayer` VALUES ('22bd359023be4ea9a1430b002e7754c2','04.00.00','sushiLOD1.usda','usd-asset-versions-dump/2024-assets-acquisition/sushi/sushiLOD1.usda','2c7ef29f88474ded95eb449ebb264ead',NULL,'.lBubzzd2.gzg06w8Sw.EbYM5iRGCMK2',NULL);
INSERT INTO `library_sublayer` VALUES ('22c57368c3b54d89a64b5f47e07161d6','04.00.00','woodenChair.usda','usd-asset-versions-dump/2024-assets-acquisition/woodenChair/woodenChair.usda','b7d69121f36340adbdb7bed776c42a8d',NULL,'YB.Mou9SxjzA1S4l9jbewUjYsVvPDeO0',NULL);
INSERT INTO `library_sublayer` VALUES ('22fe3bf444ed403cb8b9c3da1b07f5a0','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/brownBook/contrib/material/default/texture/default.png','1cb7eed87f6c413b9a582792de2f2fe1',NULL,'8g2WiL1oBDVhpmdzIpJGoIrtguFjubqa',NULL);
INSERT INTO `library_sublayer` VALUES ('23577d9c98be4ad29ee1464e2037f4a8','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/bookStack5/contrib/geometry/LOD1/geometry_LOD1.usda','fa20ba6a205e4d2b951f8262bf5b2802',NULL,'eFRFj_kwonILgmIIoPRJKQCtafLisP3M',NULL);
INSERT INTO `library_sublayer` VALUES ('2368663c60cb42a49df27ff49c527a64','03.00.00','campfire.fbx','usd-asset-versions-dump/2025-assets-03.00.00/campfire/campfire.fbx','6f6441599cc045ae91530ecd6cc5a81e',NULL,'jThsm5JWKo6pzJU0cmvHdNBhPCt5by3T',NULL);
INSERT INTO `library_sublayer` VALUES ('23ec122414004bd3b70755d24e69898d','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/hangingPickles/contrib/geometry/LOD2/geometry_LOD2.usda','aa9e8d80d09e4675915f7e5080b7b351',NULL,'Y9GLO_58cbwcQ_AFURsqh8gHGy8ZnTz9',NULL);
INSERT INTO `library_sublayer` VALUES ('24326c945703440099882bde173469f5','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/bookshelf3/contrib/material/material.usda','fa5e37ee437e45acb2ae0c3c9c725b83',NULL,'KnG1GYQN1Y6xnVIrdfdUIlyGV04trvs9',NULL);
INSERT INTO `library_sublayer` VALUES ('24cc1ddc5e544c36ae0bb2991031818c','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/inkBottle/contrib/.thumbs/thumbnail.png','ba022dd31fd0446a907529c711cea63f',NULL,'KjuLSVCn5ZIyW_fXiFjQbUxxXOZHYJ.I',NULL);
INSERT INTO `library_sublayer` VALUES ('24cebd8487334d4fa5f4e0266fc46398','04.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/beegCrab/contrib/geometry/LOD0/geometry_LOD0.usda','f175fbe4933944a69d06e86c906622d6',NULL,'g6CKHkZbI.VcuFkP.l_oLCAjj5npQjbg',NULL);
INSERT INTO `library_sublayer` VALUES ('24ebb0cbd1a04acd8b0af9a4f7c3fcbc','04.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/sittingMoomin/contrib/geometry/bbox/geometry_bbox.usda','c0e55d851ea64aa4aeec27c29594a555',NULL,'uQYlY3kbz59oof4TT93U5liiClltU3nk',NULL);
INSERT INTO `library_sublayer` VALUES ('251b88a71b3e4294bea213769efdfd33','04.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/yellowDuck/contrib/geometry/LOD1/geometry_LOD1.usda','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'oM4y7jeuRP9JdJLwHBuRZi6hpXhfZqGZ',NULL);
INSERT INTO `library_sublayer` VALUES ('251c9e843c784a34b39d9ecabae9cc64','01.00.00','glassCauldron.glb','cis-7000-usd-assets-versioned/Assets/glassCauldron/contrib/.cache/glassCauldron.glb','427b041b429f4dffb526ee677a936f12',NULL,'5MO_57gPU7k2GZpjOf91SbejzI51XRRe',NULL);
INSERT INTO `library_sublayer` VALUES ('2546305f28f84e12b78b785b56af35e5','01.00.00','doubleScrollDrawer.usda','cis-7000-usd-assets-versioned/Assets/doubleScrollDrawer/doubleScrollDrawer.usda','d189b8bcea4e4e289d133f6fdfe25d8b',NULL,'fQkNKQHBgcSJL6K0LHWcCehrYhe9P06O',NULL);
INSERT INTO `library_sublayer` VALUES ('25da7eb8743f4a6488466666fbf42b23','05.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/vintageLamp/contrib/material/default/material_default.usda','c4449799e71a4ce88999ea44a86e067b',NULL,'Y3JZJMd9SlLo_rP1LqC8XMb5amSqDJri',NULL);
INSERT INTO `library_sublayer` VALUES ('262aeb1dd7db40acade3e89865a85119','01.00.00','bookStack3.usda','cis-7000-usd-assets-versioned/Assets/bookStack3/bookStack3.usda','077caad23bd4486b8fb066bf43d04761',NULL,'_rFa2LTf_uNLJzL7VHLwdl.NbHYOtvu2',NULL);
INSERT INTO `library_sublayer` VALUES ('266774fdbf6d498d934c4d26eb5051be','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/orangePillow/contrib/material/material.usda','5c179fdb44924eba8a42c0948766ca62',NULL,'9N2KkHgFb.NtHsDN44kYz.cLV5qvUgIT',NULL);
INSERT INTO `library_sublayer` VALUES ('26a33128d19244c3a08d369cd6c587f6','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/bookStack4/contrib/geometry/LOD2/geometry_LOD2.usda','f1d3b419b0444e58a2e45fe157647464',NULL,'0Xh3ayjEhEGrmqYfE3Hp3QMBdzohgdFH',NULL);
INSERT INTO `library_sublayer` VALUES ('26cc63266c6348ca948a84daa9cb46cf','04.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/cartoonFish/contrib/geometry/geometry.usda','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'ABC40NnZstMXHZ.adi9iAxhA6F1so3ME',NULL);
INSERT INTO `library_sublayer` VALUES ('27234d899a2e486dacd7332c0c12caf7','01.00.00','largePottedPlant.usda','cis-7000-usd-assets-versioned/Assets/largePottedPlant/largePottedPlant.usda','cc9847c9e64a4341bd8287edf73afe04',NULL,'ogy_FPy1oTe.3E8D4MxyOnfKbCDklWCr',NULL);
INSERT INTO `library_sublayer` VALUES ('273cb6890b024cc7b858be9e705e6ef3','01.00.00','bookStack6.usda','cis-7000-usd-assets-versioned/Assets/bookStack6/bookStack6.usda','3684e1145a004e7987f06b8c071166a1',NULL,'PIOovUVG84GgyjDUm5GDdCtSHsfpfqU1',NULL);
INSERT INTO `library_sublayer` VALUES ('2778b9698a79438fa9655aa40dc519cc','03.00.00','bookStack.fbx','usd-asset-versions-dump/2025-assets-03.00.00/bookStack/bookStack.fbx','082f328bf76a4d48be255c620a8cd280',NULL,'YNrjgf4JHv6kOACG2n3spCN1EkQkCvxN',NULL);
INSERT INTO `library_sublayer` VALUES ('2788ad36be4b446f9d691186e25102b8','01.00.00','metadata.json','usd-asset-versions-dump/2025-assets-01.00.00/yellowDuck/metadata.json','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'8_aEDLTvMMHfm_oprGKBzTmS7BiadDi4',NULL);
INSERT INTO `library_sublayer` VALUES ('2798bd6b65834b00a1bebfdcc98288d2','02.00.00','sittingMoomin.fbx','usd-asset-versions-dump/2025-assets-02.00.00/sittingMoomin/sittingMoomin.fbx','c0e55d851ea64aa4aeec27c29594a555',NULL,'g2xCKSGC2jbni7I5qF.u.AuK34QhCYQH',NULL);
INSERT INTO `library_sublayer` VALUES ('27e3185dd7ac408c8c6840adeaf0d095','02.00.00','cafeTable_LOD0.usda','usd-asset-versions-dump/2025-assets-02.00.00/cafeTable/LODs/cafeTable_LOD0.usda','579fe0bad3f84b7babc143ab2952234e',NULL,'VePjiF1tb7g0_HSNF7kbstMQBPHs9EN3',NULL);
INSERT INTO `library_sublayer` VALUES ('27f1394e75e14c898677641cda85503c','03.00.00','yugiohClockArc_LOD1.usda','usd-asset-versions-dump/2025-assets-03.00.00/yugiohClockArc/LODs/yugiohClockArc_LOD1.usda','4be817e19e11426ebeede52145732e77',NULL,'5N4YDIwX2sdsBsCWOoE4K2vKMxs5_uG9',NULL);
INSERT INTO `library_sublayer` VALUES ('2850ee55abad448eb55cbd5731489408','01.00.00','boneBox.glb','cis-7000-usd-assets-versioned/Assets/boneBox/contrib/.cache/boneBox.glb','993f2365ed5446068f9eb0e6c21a8e9c',NULL,'_zaLQWSSClhGplrwoSIsB5ss8XjDBvvI',NULL);
INSERT INTO `library_sublayer` VALUES ('2880dd4a09dc40219d8b3e2e15acdef0','04.00.00','default.png','cis-7000-usd-assets-versioned/Assets/beegCrab/contrib/material/default/texture/default.png','f175fbe4933944a69d06e86c906622d6',NULL,'WX_.yMs6IxQsVUc9eE_phdC6W5.dLYxk',NULL);
INSERT INTO `library_sublayer` VALUES ('28a34a9aae9d492ab1d047266ad88bdd','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/asianGoldPieceContainer/contrib/geometry/LOD0/geometry_LOD0.usda','a8e9675b3e2a4a63b73c6d1fd34ca0e0',NULL,'8Sn1p524_.3Kaqn0h0lO.7VLEOjZjIyI',NULL);
INSERT INTO `library_sublayer` VALUES ('28e6a435811c47bcbc48c0db6e13d055','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/flaredPotion/contrib/geometry/bbox/geometry_bbox.usda','16fd6a411cc2475099c6b26a09175e77',NULL,'.MSK.rVWDFvoxoajh4binQVxO3UfsU0k',NULL);
INSERT INTO `library_sublayer` VALUES ('28eb4a78462e42db98b58f467445d3de','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/hangingPickles/contrib/material/material.usda','aa9e8d80d09e4675915f7e5080b7b351',NULL,'aKZwcrEpt3ts9ri4HJVR03ahHGQFgTFr',NULL);
INSERT INTO `library_sublayer` VALUES ('292058e734a44c05a559825dc82045a9','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/bulbousInkJar/contrib/geometry/LOD1/geometry_LOD1.usda','d9782679927741a6b9b9449b3054ff77',NULL,'AaPFkKMJOdEQsBDAfarrMzp8mnQsJPg3',NULL);
INSERT INTO `library_sublayer` VALUES ('296cf870285c4d2c828ee139741cb7ba','03.00.00','cartoonFish_LOD1.usda','usd-asset-versions-dump/2025-assets-03.00.00/cartoonFish/LODs/cartoonFish_LOD1.usda','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'ruyUvVmJvb2iwQN4VwHOYo2f.IAF7Wyd',NULL);
INSERT INTO `library_sublayer` VALUES ('2996651069364874b5db5ed2f4b5b3bc','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/alchemistRoomWalls/contrib/material/default/material_default.usda','ed516f0180c84489b7cd35f892c8e438',NULL,'Dg6qn736uyndqEfkbpMaD5JrLDzFa_Rp',NULL);
INSERT INTO `library_sublayer` VALUES ('29b55b989a81410395c8c7ef79b9ee3d','02.00.00','metadata.json','usd-asset-versions-dump/2025-assets-02.00.00/cafeTable/metadata.json','579fe0bad3f84b7babc143ab2952234e',NULL,'Jv.ZMSu9RHZhCe2IwKXrlMP5.e488Vwe',NULL);
INSERT INTO `library_sublayer` VALUES ('29d983dbf8eb43ddab1dd7e533057f1b','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/candle/contrib/geometry/geometry.usda','f0941eb324214c48b9a0755db5eaf79b',NULL,'m.MzYS8NA9BDgWg.KjI_Ad1hl0pU4qIT',NULL);
INSERT INTO `library_sublayer` VALUES ('29db8cfba4ff4bacabf45c5d1ba81536','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/cappedJar/contrib/material/default/texture/default.png','449fe9fdd5434b03ae7f5bc021402fbf',NULL,'YjSrGJrvgjO9QZdZFV7Zf9Qnoin0VXJd',NULL);
INSERT INTO `library_sublayer` VALUES ('29e4e267083f4377a9820ebd2c8241f3','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/bluePillow/contrib/geometry/LOD1/geometry_LOD1.usda','81cdcad6e58a448b8dad18e4d311b5f1',NULL,'uLo.zbdtFSFb.RZFHLUgYzrMeXErNdmF',NULL);
INSERT INTO `library_sublayer` VALUES ('2a2d9be80b0f43cc8d8def245a0b4091','01.00.00','cashRegister.usda','cis-7000-usd-assets-versioned/Assets/cashRegister/cashRegister.usda','ca9ae1e89e6145bea24272531dcfbe27',NULL,'Vq5_8B3lrDzH04oB.46O.dJVqisPnZat',NULL);
INSERT INTO `library_sublayer` VALUES ('2a4125f74e6b4d298ee1be5032c36e7d','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/jelloShelf/contrib/material/default/texture/default.png','99f5e6f9675b41ed91e76daebb016c4a',NULL,'057IsGBBbOkEOvsvm8X11ftgGw30QBF0',NULL);
INSERT INTO `library_sublayer` VALUES ('2a5561669adf4c62a53a0405586d4840','04.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/parkBench/contrib/geometry/LOD0/geometry_LOD0.usda','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'Oh6RNaHxodZfiYkW3Sh4XkFYQAn.lpt7',NULL);
INSERT INTO `library_sublayer` VALUES ('2aa4978084a9432d9334aee932629e9a','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/bulbousInkJar/contrib/material/default/material_default.usda','d9782679927741a6b9b9449b3054ff77',NULL,'bWN9gYRkLSOJDWfcmo8b7ODVAonfS8q7',NULL);
INSERT INTO `library_sublayer` VALUES ('2ae08945a97c47a28e703509bffde43f','03.00.00','parkBench.fbx','usd-asset-versions-dump/2025-assets-03.00.00/parkBench/parkBench.fbx','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'ezid5TF5bPhgRalxuPuo_pAA9uJIjr44',NULL);
INSERT INTO `library_sublayer` VALUES ('2b4a2e3ea0e648888aa410d0b80eb75d','04.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/campfire/contrib/.thumbs/thumbnail.png','6f6441599cc045ae91530ecd6cc5a81e',NULL,'m8YBAmBRi09aefa7EL9c7Qw4auRiJRiF',NULL);
INSERT INTO `library_sublayer` VALUES ('2b94961ec244444185023357a7263f8b','04.00.00','rocks.png','cis-7000-usd-assets-versioned/Assets/campfire/contrib/material/rocks/texture/rocks.png','6f6441599cc045ae91530ecd6cc5a81e',NULL,'gzHHVmiBKAs0pBdrsEC1iH5p9VigRdpm',NULL);
INSERT INTO `library_sublayer` VALUES ('2bb3563d79af48a98bfaaea8ca777a34','05.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/oldTelevision/contrib/.thumbs/thumbnail.png','b6234f0922c94798ba12257342157faa',NULL,'WOS_NQPOKtTDM0_9rUdKWW6xY28DykgH',NULL);
INSERT INTO `library_sublayer` VALUES ('2bb85b2c93b34bfeb4dc4550b19ca2a7','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/bookshelf2/contrib/.thumbs/thumbnail.png','39ab42636a0747ffa50446bcf4f57980',NULL,'ziVV2R.DG2LrLknpLvTyKORUUYnRZkwX',NULL);
INSERT INTO `library_sublayer` VALUES ('2bd7eec6683a4d3187492614f1b494aa','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/bambooContainer/contrib/material/default/texture/default.png','1c7130d2d78e49d990ba12cde563e7c3',NULL,'QC9fs3_m4dTV_KNdsKtZ6ztJPWlDhu22',NULL);
INSERT INTO `library_sublayer` VALUES ('2c5b31a180fe4742988ef7c967744713','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/bookStack2/contrib/material/default/texture/default.png','76e5d476ecc44eeea6da09806954f8bd',NULL,'7rroeoUKkBr0xL5ODDNy.IRnKvlA21en',NULL);
INSERT INTO `library_sublayer` VALUES ('2cb5d35a05974a028ae5c5affb69e9fd','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/bookStack3/contrib/geometry/bbox/geometry_bbox.usda','077caad23bd4486b8fb066bf43d04761',NULL,'ht1EnGPbf8RInKoAA10DANKVVE1.4xph',NULL);
INSERT INTO `library_sublayer` VALUES ('2cdc3f6ea539435383bc3b99590b7bb4','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/makeupContainers/contrib/geometry/LOD2/geometry_LOD2.usda','6bc90b076ae74ab9842a07913f22e681',NULL,'sx.JaMxxN45n8fHiQ8FM2KTuoXuNBGYR',NULL);
INSERT INTO `library_sublayer` VALUES ('2d3a182f04634a928c3b4dc32e43c4dd','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/bookStack2/contrib/geometry/LOD1/geometry_LOD1.usda','76e5d476ecc44eeea6da09806954f8bd',NULL,'fxrzm3ZhuaNDZbDHCmJtiMkOe82cB5NI',NULL);
INSERT INTO `library_sublayer` VALUES ('2d6db51f93e24cba94cc5149152c81d8','01.00.00','drinkingHorns.usda','cis-7000-usd-assets-versioned/Assets/drinkingHorns/drinkingHorns.usda','c5f39a998aec42cc8396f2ff23cbb375',NULL,'1RqtnFaya.Rec.BCRJe7GvyT5ki6utr7',NULL);
INSERT INTO `library_sublayer` VALUES ('2da82147ec47426f99c7e2c7273a1651','03.00.00','metadata.json','usd-asset-versions-dump/2025-assets-02.00.00/vintageLamp/metadata.json','c4449799e71a4ce88999ea44a86e067b',NULL,'2HLNpU5yWCe41BwddmoplNBC6we_Cjr8',NULL);
INSERT INTO `library_sublayer` VALUES ('2ee3c49cb8724e6a8f49f7ce92855dcd','04.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/bookStack/contrib/geometry/LOD2/geometry_LOD2.usda','082f328bf76a4d48be255c620a8cd280',NULL,'KU4g9E6yGxszBEjzQlHBURbOqLk.l9LI',NULL);
INSERT INTO `library_sublayer` VALUES ('2f2f685710cd44babce007ca47b71626','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/lantern/contrib/geometry/bbox/geometry_bbox.usda','10a15094d1dc45b7bcf8c698420b9e91',NULL,'uqvB5QgGKisZf_djh9GC7Q7jqDoy0WWm',NULL);
INSERT INTO `library_sublayer` VALUES ('2f73f174d6234e458105b4698513b3a2','04.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/cartoonFish/contrib/material/default/material_default.usda','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'P5BIBDIVo5462YzQxsDc29uaMorCE_YR',NULL);
INSERT INTO `library_sublayer` VALUES ('2fcec4c7ec05480396b8fc88771e1e94','03.00.00','metadata.json','usd-asset-versions-dump/2025-assets-03.00.00/bookStack/metadata.json','082f328bf76a4d48be255c620a8cd280',NULL,'GxcO1O5TBKDk6443iSQeortKw1zlpjz2',NULL);
INSERT INTO `library_sublayer` VALUES ('3031485bd2e546738de71e36a3034264','03.00.00','cafeTable.usda','usd-asset-versions-dump/2025-assets-03.00.00/cafeTable/cafeTable.usda','579fe0bad3f84b7babc143ab2952234e',NULL,'dmc6DZ68ZlOwkynh2ehohK0paesLlk8O',NULL);
INSERT INTO `library_sublayer` VALUES ('30434525abdd46e0a1a570badf8aedfb','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/bookshelf1/contrib/material/material.usda','f3a014272b104716a4e1296a4dcf4404',NULL,'_l.tLVVIELL.kv8AZIgvQ6pcIO12mzaz',NULL);
INSERT INTO `library_sublayer` VALUES ('30558e5225934c13b8fab756cd1e0bf3','02.00.00','metadata.json','usd-asset-versions-dump/2025-assets-02.00.00/pickleBarrels/metadata.json','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'VK24nH0bR6A1.HSwhZjRaCd_cl5wbYSV',NULL);
INSERT INTO `library_sublayer` VALUES ('3074f9b84f5249e28022543caa890e67','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/elavatedLogPlatform/contrib/material/material.usda','a69b43a2c8ba44a499e7f698f736e60b',NULL,'HOcBiR45Nz6_DybOfh4Kd26.Xvgojz.H',NULL);
INSERT INTO `library_sublayer` VALUES ('30c790cbbf5648b9a40afd45cf661a08','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/makeupContainers/contrib/geometry/geometry.usda','6bc90b076ae74ab9842a07913f22e681',NULL,'LQrHGRmXxojE_iCFnn6SbDgqbVR4gtq9',NULL);
INSERT INTO `library_sublayer` VALUES ('314692c096034e2e9cb62cb1dbf680e9','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/bulbousInkJar/contrib/material/default/texture/default.png','d9782679927741a6b9b9449b3054ff77',NULL,'Eo.rgYg1.9ml3rLB2vqZnKIGd1aCWAU_',NULL);
INSERT INTO `library_sublayer` VALUES ('31949ff56cd84ed08bc36fda80fa6c07','01.00.00','skateboard.fbx','usd-asset-versions-dump/2025-assets-01.00.00/skateboard/skateboard.fbx','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'7VEYG7j7wv3hw5ocBw.vDKjw8vSsM223',NULL);
INSERT INTO `library_sublayer` VALUES ('31e479799c52456fa23c0d8fb78b2aa3','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/largeCherryTable/contrib/.thumbs/thumbnail.png','b24acc08b15546e896c3e25add15f1ba',NULL,'BJHaz8ctBsPQynGJVcbU1wHWrAo_SnES',NULL);
INSERT INTO `library_sublayer` VALUES ('31e7fcfe970d44b49abb54390f616d26','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/hangingGinger/contrib/geometry/LOD2/geometry_LOD2.usda','7b333698a6b74e45a24e2e642b55d1dd',NULL,'YRwuf7OqLW1k8eYWxzKhod6zMGsao.l5',NULL);
INSERT INTO `library_sublayer` VALUES ('31e9a8c609774a68b17ae941c783e028','01.00.00','drawerAssembly.glb','cis-7000-usd-assets-versioned/Assets/drawerAssembly/contrib/.cache/drawerAssembly.glb','2652016a66e647f2bb874058b4d7e13c',NULL,'UcMm9ToPv3romk2gt79Y0i4DHzUUhagJ',NULL);
INSERT INTO `library_sublayer` VALUES ('31f0bb8e21d94f09bee545dcf8e4a266','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/bulbousInkJar/contrib/.thumbs/thumbnail.png','d9782679927741a6b9b9449b3054ff77',NULL,'dWiwfv.X0ZEwJFIdLnLJ14UZL9.FEKiy',NULL);
INSERT INTO `library_sublayer` VALUES ('32023482c25c48e5a14939f4326a6013','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/brownBook/contrib/geometry/bbox/geometry_bbox.usda','1cb7eed87f6c413b9a582792de2f2fe1',NULL,'dLyOXyUoln7nItYoIpY3mjR2dkGvViJG',NULL);
INSERT INTO `library_sublayer` VALUES ('3225012ff11f49b9815161768efc01a5','04.00.00','woodenChairLOD0.usda','usd-asset-versions-dump/2024-assets-acquisition/woodenChair/woodenChairLOD0.usda','b7d69121f36340adbdb7bed776c42a8d',NULL,'.DCrgKnvNvg_M7t.vC9.mrMCOgCbQWvE',NULL);
INSERT INTO `library_sublayer` VALUES ('32c37c9962c44814a7041566293e0558','04.00.00','woodenChair_material.usda','usd-asset-versions-dump/2024-assets-acquisition/woodenChair/woodenChair_material.usda','b7d69121f36340adbdb7bed776c42a8d',NULL,'TgskpMD6SfrJAgE7DQLycl1CnGHXVo73',NULL);
INSERT INTO `library_sublayer` VALUES ('32fb1f96603745c78bd868709312320a','03.00.00','bookStack_LOD1.usda','usd-asset-versions-dump/2025-assets-03.00.00/bookStack/LODs/bookStack_LOD1.usda','082f328bf76a4d48be255c620a8cd280',NULL,'OqGVGRsiy1oWTe3iHu4bR.x6se.NhSRm',NULL);
INSERT INTO `library_sublayer` VALUES ('338b0af6b46a454381a1e14f78a52443','05.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/sushi/contrib/geometry/LOD1/geometry_LOD1.usda','2c7ef29f88474ded95eb449ebb264ead',NULL,'LSmNSLWRGYD1jfz9dKmdH8FhEkJ.Rymm',NULL);
INSERT INTO `library_sublayer` VALUES ('33d1336a8487400f9b970df309effd06','01.00.00','yugiohClockArc.fbx','usd-asset-versions-dump/2025-assets-01.00.00/yugiohClockArc/yugiohClockArc.fbx','4be817e19e11426ebeede52145732e77',NULL,'JO4vUdwz23q.yxuy_DdS._ET91ox4S8k',NULL);
INSERT INTO `library_sublayer` VALUES ('340866fd98fb4a29b9f7b589f0142151','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/orangePillow/contrib/material/default/texture/default.png','5c179fdb44924eba8a42c0948766ca62',NULL,'hxCTP5DSW.1zDIWw6xC9vYu2n.2yVr9S',NULL);
INSERT INTO `library_sublayer` VALUES ('347e8495f19344ff9c5e5d835bc9ba2e','01.00.00','sittingMoomin.fbx','usd-asset-versions-dump/2025-assets-01.00.00/sittingMoomin/sittingMoomin.fbx','c0e55d851ea64aa4aeec27c29594a555',NULL,'cJwSNiBBTbCQQpfxYaHxGLxb.flf_aFw',NULL);
INSERT INTO `library_sublayer` VALUES ('34b9f8ebebeb447fac5fe1ac6f58c185','04.00.00','oldTelevision.usda','usd-asset-versions-dump/2024-assets-acquisition/oldTelevision/oldTelevision.usda','b6234f0922c94798ba12257342157faa',NULL,'7d4gv0LXc4UWfOnQBGJUs7ss3j86Ey6a',NULL);
INSERT INTO `library_sublayer` VALUES ('34c4303bfb5a49cd84a73c1ba2c02448','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/cappedJar/contrib/geometry/geometry.usda','449fe9fdd5434b03ae7f5bc021402fbf',NULL,'ZvVm4VnGyBF5D7cLtyIsEJbjE3U8d3FZ',NULL);
INSERT INTO `library_sublayer` VALUES ('351d253d31fa496f982333e7682c66c5','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/makeupJar/contrib/material/default/texture/default.png','313b0aae14664f14b656d4d17478fbc3',NULL,'SMTfGzG2aIMkiG1nvbUmZ4Gyi8BKIsuR',NULL);
INSERT INTO `library_sublayer` VALUES ('3520886754df41a6b6fb36b7e3c252c7','04.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/teapot/contrib/material/default/material_default.usda','f5e189a845fb4ed3930a81263a21bf99',NULL,'pI1Xqak6Paro8C0ErTGUhEbP8n5uFDRa',NULL);
INSERT INTO `library_sublayer` VALUES ('35217b3bc1a34cf0b8f3684299241c58','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/glassJarEmpty/contrib/material/default/material_default.usda','6be75d74d18f4d88bc635b222107966f',NULL,'G27Pob3e.feEBecok4KBY0aoko4pIGoK',NULL);
INSERT INTO `library_sublayer` VALUES ('3530965433b844c09c212f3f132253be','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/asianGoldPieceContainer/contrib/geometry/bbox/geometry_bbox.usda','a8e9675b3e2a4a63b73c6d1fd34ca0e0',NULL,'s9VL3IO2SsdvmoYDfYVYKVLTybQq4DbZ',NULL);
INSERT INTO `library_sublayer` VALUES ('35794d2463544822ad091498b3a37db0','02.00.00','metadata.json','usd-asset-versions-dump/2025-assets-02.00.00/campfire/metadata.json','6f6441599cc045ae91530ecd6cc5a81e',NULL,'Gd8MGxmXD7byYPYzsNO3LjYFlIbVIFDP',NULL);
INSERT INTO `library_sublayer` VALUES ('35afceb6bcbd479b890224a15c7397f5','05.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/oldTelevision/contrib/geometry/LOD2/geometry_LOD2.usda','b6234f0922c94798ba12257342157faa',NULL,'MlQtpEo0dEplrt6k.yrJKUpU.TJ9Lhl8',NULL);
INSERT INTO `library_sublayer` VALUES ('35b0a06a4db94f8aa051e4c7c43d86f9','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/cherryTable/contrib/material/material.usda','824b428456c148abb25d24568d649441',NULL,'ybvfJV0uvYt0QgRotOm16CvNFikxVXCo',NULL);
INSERT INTO `library_sublayer` VALUES ('3613fc0c419549e5834ee331db511ce9','05.00.00','carrot.usd','cis-7000-usd-assets-versioned/Assets/carrot/carrot.usd','6188a79945fa415f906a1c6463a497eb',NULL,'OS9kjtjjH27I2Z7BLC6ieOkBlePMGDgD',NULL);
INSERT INTO `library_sublayer` VALUES ('3697a804853943c1be60931b51743d1e','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/bambooContainer/contrib/material/material.usda','1c7130d2d78e49d990ba12cde563e7c3',NULL,'zg1WXY4.p0ApiFH9hfqsARhWL0l_L361',NULL);
INSERT INTO `library_sublayer` VALUES ('372dbbe8e0a34dc2a38153017b145840','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/inkBottle/contrib/material/default/material_default.usda','ba022dd31fd0446a907529c711cea63f',NULL,'RsBUk7g1B1VagLAUm6PRwEZ2V6bgrrRO',NULL);
INSERT INTO `library_sublayer` VALUES ('3772f6ef08b34c0a9cf6f910b210fcee','04.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/pickleBarrels/contrib/geometry/LOD1/geometry_LOD1.usda','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'7GetXPO7xfN_KjhW5BB6JCLRT6KpRPKc',NULL);
INSERT INTO `library_sublayer` VALUES ('37bb7cbace6a4d6dbcdda75600557ba5','04.00.00','woodenChair_model.usda','usd-asset-versions-dump/2024-assets-acquisition/woodenChair/woodenChair_model.usda','b7d69121f36340adbdb7bed776c42a8d',NULL,'moKzLbjYkG62BbP5mwZjMKUjtKaOqI0I',NULL);
INSERT INTO `library_sublayer` VALUES ('37cd37d101954b78b479980da1300e1b','03.00.00','cafeTable_LOD1.usda','usd-asset-versions-dump/2025-assets-03.00.00/cafeTable/LODs/cafeTable_LOD1.usda','579fe0bad3f84b7babc143ab2952234e',NULL,'qmxVYJUj.UTdply8trAhGVH4qMjwqbBi',NULL);
INSERT INTO `library_sublayer` VALUES ('37ea8ba54e004e4882dfc1254c7e4de5','04.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/yellowDuck/contrib/geometry/LOD2/geometry_LOD2.usda','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'YMkBrxxozfFg5f69i2XYtxK5KHyTTrMy',NULL);
INSERT INTO `library_sublayer` VALUES ('384a507856034d31b55edd2377957d64','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/hangingPickles/contrib/material/default/texture/default.png','aa9e8d80d09e4675915f7e5080b7b351',NULL,'t.YVM3wAUQg7ves0g_5fecs25w35Cu7p',NULL);
INSERT INTO `library_sublayer` VALUES ('3872d75166b44c8aa5aa655e82272b5c','03.00.00','metadata.json','usd-asset-versions-dump/2025-assets-03.00.00/teapot/metadata.json','f5e189a845fb4ed3930a81263a21bf99',NULL,'h0mY05n8A7SjfbFD9BhejRNzlTaaEs28',NULL);
INSERT INTO `library_sublayer` VALUES ('38a6121bd3444d7ab5759be1c702b08a','05.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/oldTelevision/contrib/geometry/LOD0/geometry_LOD0.usda','b6234f0922c94798ba12257342157faa',NULL,'E22Y_Xvv9dABRsAcDGF5rRYFiMEUrEhM',NULL);
INSERT INTO `library_sublayer` VALUES ('38a85eca2991403c9624b620ca430875','05.00.00','default.png','cis-7000-usd-assets-versioned/Assets/campfire/contrib/material/default/texture/default.png','6f6441599cc045ae91530ecd6cc5a81e',NULL,'TuZwmF25nJwtNa1CHSUtlae7xelRQ0YR','b795c6ae29dc4fcfa87445baee6e33ef');
INSERT INTO `library_sublayer` VALUES ('38e6b85ce5034999ab8e0382457af21a','01.00.00','metadata.json','usd-asset-versions-dump/2025-assets-01.00.00/bookStack/metadata.json','082f328bf76a4d48be255c620a8cd280',NULL,'hlHisUWYLMs5qdjxzucQpj71DPl4cJs5',NULL);
INSERT INTO `library_sublayer` VALUES ('39ebc668c8db4fe08f183abd6cdb697d','04.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/yugiohClockArc/contrib/geometry/LOD0/geometry_LOD0.usda','4be817e19e11426ebeede52145732e77',NULL,'9fstqbYypyK5l9wbzHfyRDIn0rWxjq1n',NULL);
INSERT INTO `library_sublayer` VALUES ('39f918fd62f146a1b5abec8b065451f7','02.00.00','yellowDuck_LOD0.usda','usd-asset-versions-dump/2025-assets-02.00.00/yellowDuck/LODs/yellowDuck_LOD0.usda','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'qJzmEJ2WAz3VTYuKIyeTqDF.Ax7Jbw0v',NULL);
INSERT INTO `library_sublayer` VALUES ('3a029cbfbbf14efc94c3a1cb5e1b9412','05.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/carrot/contrib/geometry/bbox/geometry_bbox.usda','6188a79945fa415f906a1c6463a497eb',NULL,'qvU_Oe0vlEQPn2R.tVm2WncbOPsVwF6Z',NULL);
INSERT INTO `library_sublayer` VALUES ('3ac0e9158802486e9bc3c3241f7eb095','04.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/parkBench/contrib/geometry/LOD1/geometry_LOD1.usda','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'bnUNu5UCUHHj1SiplY96EXbIX2jwcCRk',NULL);
INSERT INTO `library_sublayer` VALUES ('3ae3eef3a7ba44378e75883b59136deb','01.00.00','lantern.usda','cis-7000-usd-assets-versioned/Assets/lantern/lantern.usda','10a15094d1dc45b7bcf8c698420b9e91',NULL,'ZIONZL8d5g1lATAuw_9LyOevh6MTZhWc',NULL);
INSERT INTO `library_sublayer` VALUES ('3b280f085fca4b1a9b2acd643bdb6f19','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/oakTable/contrib/geometry/geometry.usda','3dfa350b0a294d7c9f1b419180d71748',NULL,'o01J_V2a5_JkoEyl0KZMayhImrCnrgPV',NULL);
INSERT INTO `library_sublayer` VALUES ('3b4e78cefc954ed99f390bf399236e8e','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/alchemistRoomWalls/contrib/geometry/geometry.usda','ed516f0180c84489b7cd35f892c8e438',NULL,'HTya1bqRyYLRpZMbf8_GK5ZAoRF.M6Nb',NULL);
INSERT INTO `library_sublayer` VALUES ('3b71fe4e3ab14d2396655c9b00590c89','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/flaredPotion/contrib/material/material.usda','16fd6a411cc2475099c6b26a09175e77',NULL,'skYsqQtnLCOofptsTmzGX5nKqpHJC.1.',NULL);
INSERT INTO `library_sublayer` VALUES ('3b8c391fdda44518ae4c5ba3c738b51a','01.00.00','bulbousInkJar.usda','cis-7000-usd-assets-versioned/Assets/bulbousInkJar/bulbousInkJar.usda','d9782679927741a6b9b9449b3054ff77',NULL,'tTINozKQvl1Rj12ncaz.AAA7ve3yK87q',NULL);
INSERT INTO `library_sublayer` VALUES ('3baaa8f68f6c4bbab1e0277cd9b2b34e','05.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/mug/contrib/geometry/bbox/geometry_bbox.usda','5bac6ed09efe4816b7c427ffb08c599d',NULL,'K97CBbVhmAE9NKaGzEFkgdkvA9LNVRYj',NULL);
INSERT INTO `library_sublayer` VALUES ('3bca009c237849a9bf2fa43d81f64db2','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/alchemistRoomWalls/contrib/.thumbs/thumbnail.png','ed516f0180c84489b7cd35f892c8e438',NULL,'.DF9SfxD3DpNzrTaJniR76BK.P7uGzrm',NULL);
INSERT INTO `library_sublayer` VALUES ('3bde40ddf7294f0ca450e9bf63ea3f97','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/flaredPotion/contrib/geometry/geometry.usda','16fd6a411cc2475099c6b26a09175e77',NULL,'dHNikpuxjogW_w.YVCXpVcp__8_jJBp6',NULL);
INSERT INTO `library_sublayer` VALUES ('3bded8793d9b41d1b3ea004dd9848e30','04.00.00','carrot_model.usda','usd-asset-versions-dump/2024-assets-acquisition/carrot/carrot_model.usda','6188a79945fa415f906a1c6463a497eb',NULL,'bDViZ0Y8vs1gfNldo0Weum.bBIsLG6L3',NULL);
INSERT INTO `library_sublayer` VALUES ('3c3f19f802be44678ff29fa8f1383a21','05.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/carrot/contrib/material/material.usda','6188a79945fa415f906a1c6463a497eb',NULL,'H22OW9yoIoqeII8WxTz3eey5RYj6XjuA',NULL);
INSERT INTO `library_sublayer` VALUES ('3c5adeb1e0d54ca89c190938b4420cfc','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/largePottedPlant/contrib/material/default/texture/default.png','cc9847c9e64a4341bd8287edf73afe04',NULL,'2cFV2czl0nGpoysMR8bTZoFuxLGjKa9H',NULL);
INSERT INTO `library_sublayer` VALUES ('3c841015c8f9440889bee2410f9d6cbb','04.00.00','thumb.png','usd-asset-versions-dump/2024-assets-acquisition/paniniPress/thumb.png','3dcf8a1dac8242a59f83c50df682fb69',NULL,'E2fTksPivzoFN5lzDAB6gbzbzBqDqSN2',NULL);
INSERT INTO `library_sublayer` VALUES ('3ca2c865e5e54756a61895b07bb919a4','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/bookStack4/contrib/geometry/LOD1/geometry_LOD1.usda','f1d3b419b0444e58a2e45fe157647464',NULL,'iI8g210U.zuTfyKuqJG17ew6LU90FFtN',NULL);
INSERT INTO `library_sublayer` VALUES ('3cadbf0bebcb47cfb568386a015f7c96','04.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/yellowDuck/contrib/geometry/bbox/geometry_bbox.usda','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'K3ADT_CF855WFqKKJZiH.nEF7Tv2AK6C',NULL);
INSERT INTO `library_sublayer` VALUES ('3cc8c2efa3254543bb9683b90f7635b3','03.00.00','cafeTable.fbx','usd-asset-versions-dump/2025-assets-03.00.00/cafeTable/cafeTable.fbx','579fe0bad3f84b7babc143ab2952234e',NULL,'vpj.h7cWTVRpJV_F_pRkDUazdBHuIYdH',NULL);
INSERT INTO `library_sublayer` VALUES ('3ccfb807e17e4d2ba5119fe4edbd41b7','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/cashRegister/contrib/material/default/material_default.usda','ca9ae1e89e6145bea24272531dcfbe27',NULL,'WNS0NUZSkfiwoJGf3xQti1rpcRLawxlq',NULL);
INSERT INTO `library_sublayer` VALUES ('3d15c0a7c70b4b6aa7715eb83436210b','04.00.00','metadata.json','usd-asset-versions-dump/2024-assets-acquisition/sushi/metadata.json','2c7ef29f88474ded95eb449ebb264ead',NULL,'sPxGWd6CV3bE.BRwTaoWi.0DxPWZJNjQ',NULL);
INSERT INTO `library_sublayer` VALUES ('3d3228f6956041a8a78571477a7315d1','05.00.00','logs.png','cis-7000-usd-assets-versioned/Assets/campfire/contrib/material/logs/texture/logs.png','6f6441599cc045ae91530ecd6cc5a81e',NULL,'HHgZFOfYXhXBi5whugLDDfJWvlLyskSj',NULL);
INSERT INTO `library_sublayer` VALUES ('3d450a01af6a46ffb936538b3d1370e1','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/foxHandRight/contrib/.thumbs/thumbnail.png','e1dc4b9960364ffba02431380e01df0f',NULL,'ZOD9NfNNqAAF1RlUd2BaJC70iyq022w_',NULL);
INSERT INTO `library_sublayer` VALUES ('3d6ec5a1de5344f393e4320d5c2890a2','03.00.00','sittingMoomin.fbx','usd-asset-versions-dump/2025-assets-03.00.00/sittingMoomin/sittingMoomin.fbx','c0e55d851ea64aa4aeec27c29594a555',NULL,'jRyM1ZGkCRDyEWAil_UOT90_L_KEbu.C',NULL);
INSERT INTO `library_sublayer` VALUES ('3dada67323124499b22a752b58f8e117','05.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/sushi/contrib/material/default/material_default.usda','2c7ef29f88474ded95eb449ebb264ead',NULL,'yjsQ.n5CSwVmfAgY8kjs96G5vWr2jref',NULL);
INSERT INTO `library_sublayer` VALUES ('3e227b8016c24dabb27088ea2dd6ff38','01.00.00','candleGroup.glb','cis-7000-usd-assets-versioned/Assets/candleGroup/contrib/.cache/candleGroup.glb','a1513d5dbdf7478aab3b4d659a3f5e74',NULL,'pTzABG27SQTZ5ZlHytubZIO9VZhRdDNw',NULL);
INSERT INTO `library_sublayer` VALUES ('3e272770efae460393c3b588d8fc4666','02.00.00','sittingMoomin_LOD1.usda','usd-asset-versions-dump/2025-assets-02.00.00/sittingMoomin/LODs/sittingMoomin_LOD1.usda','c0e55d851ea64aa4aeec27c29594a555',NULL,'VYLo8sONuvcBEMh8cfBRgO7jOJ7r8Lt4',NULL);
INSERT INTO `library_sublayer` VALUES ('3e630e9bff074b48a2b462c219ffa537','03.00.00','parkBench_LOD2.usda','usd-asset-versions-dump/2025-assets-03.00.00/parkBench/LODs/parkBench_LOD2.usda','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'D62MdUDCFoOydo0Cmxzorm.NUcAPTviZ',NULL);
INSERT INTO `library_sublayer` VALUES ('3e84b6d2f2cf432e944a953323bad587','01.00.00','bluePillow.glb','cis-7000-usd-assets-versioned/Assets/bluePillow/contrib/.cache/bluePillow.glb','81cdcad6e58a448b8dad18e4d311b5f1',NULL,'bB0ipQM51wb.CJdZ5s4VsRzTHTwSEerg',NULL);
INSERT INTO `library_sublayer` VALUES ('3ec5b83c4d0e47edbc06c5a94e0e9031','04.00.00','thumb.png','usd-asset-versions-dump/2024-assets-acquisition/penTablet/thumb.png','db17d0c2030049769e1ba2ea54d86114',NULL,'ZIJA9Ki3w5CP4MFsjOCUFuu.x3hKpjZZ',NULL);
INSERT INTO `library_sublayer` VALUES ('3eeb31b6a06c45cf9dadd85a9757653b','04.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/teapot/contrib/.thumbs/thumbnail.png','f5e189a845fb4ed3930a81263a21bf99',NULL,'uHNhbE0daiC0DmNNFTXfs7bGP9cgV9hl',NULL);
INSERT INTO `library_sublayer` VALUES ('3ef6d71844a24f91b7454ea86c5afd3e','03.00.00','metadata.json','usd-asset-versions-dump/2025-assets-03.00.00/pickleBarrels/metadata.json','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'jm6dGQ7NmQEKbz5M3ll_2KuAVS_JMfes',NULL);
INSERT INTO `library_sublayer` VALUES ('3f05b8394cfd43fca2ab6ca45f6c3cba','01.00.00','emptyDrawer.glb','cis-7000-usd-assets-versioned/Assets/emptyDrawer/contrib/.cache/emptyDrawer.glb','aff070bc60b647e29d302848b812f7c2',NULL,'AxriFRSBzkZ5DmMhdw4w4RS794EIXTyw',NULL);
INSERT INTO `library_sublayer` VALUES ('3f0cea7a77334b209ae19e8d009c666c','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/bookshelf3/contrib/geometry/LOD2/geometry_LOD2.usda','fa5e37ee437e45acb2ae0c3c9c725b83',NULL,'1M1JHG94SUhgNeZi5oJ1ek5SBCPMOWFZ',NULL);
INSERT INTO `library_sublayer` VALUES ('3f205c90629c41f19778f9fce546f1cf','03.00.00','yugiohClockArc_LOD0.usda','usd-asset-versions-dump/2025-assets-03.00.00/yugiohClockArc/LODs/yugiohClockArc_LOD0.usda','4be817e19e11426ebeede52145732e77',NULL,'YI1SqdG_W_4UdLvrQ2WHyAPsyMDG9eli',NULL);
INSERT INTO `library_sublayer` VALUES ('3f6012e81bda494488bf99bf9c56b4df','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/elavatedLogPlatform/contrib/.thumbs/thumbnail.png','a69b43a2c8ba44a499e7f698f736e60b',NULL,'O1YA5fYriCLljolpheSg5OCEkEP_aYhO',NULL);
INSERT INTO `library_sublayer` VALUES ('3fa803fc87154f0481d95b91c1f89baf','04.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/pickleBarrels/contrib/material/default/material_default.usda','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'NQxijH8bGxxIgL0fujW1_lyyE_55QPFw',NULL);
INSERT INTO `library_sublayer` VALUES ('3ff062a50af747d598b7a2d4897eb1e5','04.00.00','default.png','cis-7000-usd-assets-versioned/Assets/skateboard/contrib/material/default/texture/default.png','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'AyouUBVr16iu7ZJvu_0zu_NZbMMVuLRC',NULL);
INSERT INTO `library_sublayer` VALUES ('4025102dcb894c6f9acf326d1eae4b92','05.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/wineGlass/contrib/geometry/geometry.usda','31c39c346b394a1f90cf0a00f1c4a6ef',NULL,'ykob754atxJtf1W3oVpYqCYVSJgfWoc_',NULL);
INSERT INTO `library_sublayer` VALUES ('402944843138422c96ffcacb7051e2b3','05.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/vintageLamp/contrib/geometry/LOD0/geometry_LOD0.usda','c4449799e71a4ce88999ea44a86e067b',NULL,'LzcfQBrSc5syrO6XfRKA.t61NKOECeuZ',NULL);
INSERT INTO `library_sublayer` VALUES ('403056f991b7432585eade02945d479c','01.00.00','metadata.json','usd-asset-versions-dump/2025-assets-01.00.00/cafeTable/metadata.json','579fe0bad3f84b7babc143ab2952234e',NULL,'Aliozn9i6Ya_1zooeWhvhBg9o3euaBGd',NULL);
INSERT INTO `library_sublayer` VALUES ('403600074ec44109a1c7e5a970cae71f','03.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-03.00.00/beegCrab/thumbnail.png','f175fbe4933944a69d06e86c906622d6',NULL,'VsgqtO0PPon1v9vZE2VFZIyLV_5UyHnE',NULL);
INSERT INTO `library_sublayer` VALUES ('405e468c09cb4d22bf51b236430080cc','02.00.00','teapot_LOD0.usda','usd-asset-versions-dump/2025-assets-02.00.00/teapot/LODs/teapot_LOD0.usda','f5e189a845fb4ed3930a81263a21bf99',NULL,'72jhOkpDefD7myJUlVVn7Mojo7jUDW6W',NULL);
INSERT INTO `library_sublayer` VALUES ('40a335b8eec74416bc51663a00577f51','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/blueJello/contrib/geometry/bbox/geometry_bbox.usda','3d6b8007d30e4919a46deedb6dfce573',NULL,'stT2qtMqleG7w.YhL5x9e15G4aqklfqZ',NULL);
INSERT INTO `library_sublayer` VALUES ('40b59a8213fa4a98a4665f0aa324ef35','03.00.00','pickelBarrels.fbx','usd-asset-versions-dump/2025-assets-03.00.00/pickleBarrels/pickelBarrels.fbx','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'O6knR7whFz2fm1bWyUh6gZEPHdkbQvkE',NULL);
INSERT INTO `library_sublayer` VALUES ('40bca4232e294ddfb10800ab91a6a934','02.00.00','skateboard_LOD1.usda','usd-asset-versions-dump/2025-assets-02.00.00/skateboard/LODs/skateboard_LOD1.usda','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'3Ry1jWY7qViQ_v5WBpI6LA1tpg0J.6_M',NULL);
INSERT INTO `library_sublayer` VALUES ('40d942a098c64eb8bfd7e82f67ac610b','05.00.00','campfire.usd','cis-7000-usd-assets-versioned/Assets/campfire/campfire.usd','6f6441599cc045ae91530ecd6cc5a81e',NULL,'Bo4BL0ojl8CR0Wg_UQVelrypP8I5QVew',NULL);
INSERT INTO `library_sublayer` VALUES ('41287c8a04ef488495b4b9be243ac4e8','04.00.00','oldTelevisionLOD0.usda','usd-asset-versions-dump/2024-assets-acquisition/oldTelevision/oldTelevisionLOD0.usda','b6234f0922c94798ba12257342157faa',NULL,'2qcnfMdYuR.osELRMKBqgHPAluzcWwZF',NULL);
INSERT INTO `library_sublayer` VALUES ('415a013d54014eec9e4e2f691bdf21a0','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/bookshelf1/contrib/geometry/LOD1/geometry_LOD1.usda','f3a014272b104716a4e1296a4dcf4404',NULL,'Z.mA4GZytvQRMpq4N8VwkX7WV1TAiqTO',NULL);
INSERT INTO `library_sublayer` VALUES ('41ac14ccadd7471e9ebed41c16aefd14','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/medicineBottle/contrib/geometry/LOD0/geometry_LOD0.usda','8deb7dd1667c428b89933de25c02e4ce',NULL,'XWiki82eSzUsOz3Xq0VyBd_BE4IMKhku',NULL);
INSERT INTO `library_sublayer` VALUES ('420825d9b4404826a16b13c953efb694','01.00.00','bookshelf2.usda','cis-7000-usd-assets-versioned/Assets/bookshelf2/bookshelf2.usda','39ab42636a0747ffa50446bcf4f57980',NULL,'dRKYDGq5bmRgwj7H21.Q1oGGtD_80fx6',NULL);
INSERT INTO `library_sublayer` VALUES ('4230fc81f5b240e495c198eb0a70e7f8','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/cashRegister/contrib/geometry/bbox/geometry_bbox.usda','ca9ae1e89e6145bea24272531dcfbe27',NULL,'zcNdEgCxV1gGTwv4FcpyK3Eg.flQjfO6',NULL);
INSERT INTO `library_sublayer` VALUES ('42b5cafd57104017acb7c22bb4514c2a','01.00.00','bookStack2.glb','cis-7000-usd-assets-versioned/Assets/bookStack2/contrib/.cache/bookStack2.glb','76e5d476ecc44eeea6da09806954f8bd',NULL,'TDn0sq2rKHimpKogV_tsDrOJjAMdQ8Bp',NULL);
INSERT INTO `library_sublayer` VALUES ('42d447b8157744d889b4a41dd7d58108','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/orangePillow/contrib/.thumbs/thumbnail.png','5c179fdb44924eba8a42c0948766ca62',NULL,'oCt.6wU_wfqvfkBr1gmsDOGomnVWQUwu',NULL);
INSERT INTO `library_sublayer` VALUES ('42e205706d5a457cbedb5d09d46b78aa','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/bluePillow/contrib/geometry/geometry.usda','81cdcad6e58a448b8dad18e4d311b5f1',NULL,'.lmI0yI.C7.HcbsqVB_KiJlMMPMdvf8d',NULL);
INSERT INTO `library_sublayer` VALUES ('42e66c127fb841f2bafc4a1036a7487b','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/candle/contrib/material/default/material_default.usda','f0941eb324214c48b9a0755db5eaf79b',NULL,'QjZpRdGtAvagDw1rcvVBfDTidsnwtijI',NULL);
INSERT INTO `library_sublayer` VALUES ('42f0f3b661464e45a77dfca83910d570','04.00.00','thumb.png','usd-asset-versions-dump/2024-assets-acquisition/oldTelevision/thumb.png','b6234f0922c94798ba12257342157faa',NULL,'eLMZdzfTCH5u7l8kIzylW1_FkZvtiPvX',NULL);
INSERT INTO `library_sublayer` VALUES ('434f084b3cc94f54870a835dc4068b1e','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/bookshelf3/contrib/material/default/texture/default.png','fa5e37ee437e45acb2ae0c3c9c725b83',NULL,'qcKLJjBzCSxWuH_gI1XiKg5ORdwZCDRk',NULL);
INSERT INTO `library_sublayer` VALUES ('437041d684344f3bbdd362839c784724','01.00.00','lantern.glb','cis-7000-usd-assets-versioned/Assets/lantern/contrib/.cache/lantern.glb','10a15094d1dc45b7bcf8c698420b9e91',NULL,'WSnIg2QQtWbmusqcdAIdv9NuloDUOuRn',NULL);
INSERT INTO `library_sublayer` VALUES ('43f377eb033d4d788d1cbac5835daca2','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/candleGroup/contrib/geometry/LOD0/geometry_LOD0.usda','a1513d5dbdf7478aab3b4d659a3f5e74',NULL,'OpUUaEyh8f1qM8OvDr3wEd7PgSHZOCJe',NULL);
INSERT INTO `library_sublayer` VALUES ('44264b1451d846b4aa9491aba509b145','04.00.00','carrot_material.usda','usd-asset-versions-dump/2024-assets-acquisition/carrot/carrot_material.usda','6188a79945fa415f906a1c6463a497eb',NULL,'6xC0NndnDZGzXhya.2SKLF34oAyoh_cB',NULL);
INSERT INTO `library_sublayer` VALUES ('443407e33eb64c4cb7f11c0807d0dfff','05.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/wineGlass/contrib/geometry/LOD2/geometry_LOD2.usda','31c39c346b394a1f90cf0a00f1c4a6ef',NULL,'KVgX_S6mXbJxYSbzXK9kPxmvjB98jKLD',NULL);
INSERT INTO `library_sublayer` VALUES ('4442e0d763e245b1a9d87c0ac69312ad','05.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/sushi/contrib/geometry/geometry.usda','2c7ef29f88474ded95eb449ebb264ead',NULL,'J8nLsnCuBYaa7oZtROSR_.NRUsWB_UXS',NULL);
INSERT INTO `library_sublayer` VALUES ('4450bdd586b34397a334503db64ba9f0','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/bookshelf1/contrib/material/default/texture/default.png','f3a014272b104716a4e1296a4dcf4404',NULL,'k8teJdeWNLOvfZVC7ZoX8sWbBkx6hDDU',NULL);
INSERT INTO `library_sublayer` VALUES ('44668f024f9f4d9f91c6c5fab93b73bc','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/brownBook/contrib/geometry/LOD1/geometry_LOD1.usda','1cb7eed87f6c413b9a582792de2f2fe1',NULL,'Xb4w71MM0uQMVFdODNENygD.BhggLisL',NULL);
INSERT INTO `library_sublayer` VALUES ('4474d3ba0b2e49c7a59fd757c1a82f1d','04.00.00','metadata.json','usd-asset-versions-dump/2024-assets-acquisition/mug/metadata.json','5bac6ed09efe4816b7c427ffb08c599d',NULL,'lHeXGWh.fGdHqnbRHFediwJnIKWzzy0B',NULL);
INSERT INTO `library_sublayer` VALUES ('44996929c1ba4e4d8143b918cdd53289','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/bookStack6/contrib/geometry/LOD1/geometry_LOD1.usda','3684e1145a004e7987f06b8c071166a1',NULL,'mISveMOuNkkMGInV0y6Ld1mHVUXgMfbl',NULL);
INSERT INTO `library_sublayer` VALUES ('44a6f61f3778439fa98dc591044ffb41','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/drinkingHorns/contrib/geometry/LOD0/geometry_LOD0.usda','c5f39a998aec42cc8396f2ff23cbb375',NULL,'gqMHxHzk9Wz7B.iG11RwE6L50P1Vdznc',NULL);
INSERT INTO `library_sublayer` VALUES ('44f9dcd4ca484a089a0058e3fa2cd8ac','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/largeCherryTable/contrib/geometry/LOD1/geometry_LOD1.usda','b24acc08b15546e896c3e25add15f1ba',NULL,'kFwtPdv5Gxos2.ADfc0EnozoHaSAX.gw',NULL);
INSERT INTO `library_sublayer` VALUES ('456ddded57364b22bf0f9945413a4621','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/bookStack6/contrib/geometry/geometry.usda','3684e1145a004e7987f06b8c071166a1',NULL,'wdGRVXKRjYQ19B_R9oKQlT4LTFmu3W9N',NULL);
INSERT INTO `library_sublayer` VALUES ('45ed8adde0f844cea142ccacaf7df069','01.00.00','bookStack3.glb','cis-7000-usd-assets-versioned/Assets/bookStack3/contrib/.cache/bookStack3.glb','077caad23bd4486b8fb066bf43d04761',NULL,'u2hdFIPAjWpld4RrMoUH.l9ZC1rrC_Pk',NULL);
INSERT INTO `library_sublayer` VALUES ('4666e87cc16948749b755ac3d1d991ee','04.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/yugiohClockArc/contrib/material/material.usda','4be817e19e11426ebeede52145732e77',NULL,'3VldtAG87U6PTs5rYL7EN68X_Ohz2.hI',NULL);
INSERT INTO `library_sublayer` VALUES ('46a12350a93b46d4b1d0d81a5de875b3','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/cherryTable/contrib/geometry/LOD2/geometry_LOD2.usda','824b428456c148abb25d24568d649441',NULL,'pVpduKYFBJkrq9pljhQXOwiDh48o_psf',NULL);
INSERT INTO `library_sublayer` VALUES ('46bb380410a14a0c8c85a80fabe612fa','04.00.00','default.png','cis-7000-usd-assets-versioned/Assets/cartoonFish/contrib/material/default/texture/default.png','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'WfvsKNCarSQ6cvnavtg1gvr7CbCzoVD9',NULL);
INSERT INTO `library_sublayer` VALUES ('470315f0e5b04b1d93fde2d51a9c475f','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/bambooLadder/contrib/material/default/material_default.usda','f148935dbe764e648b2641d5ddcde381',NULL,'Ec2oVH_Q48ueJK5BDmBJY_WbjHJQq7ir',NULL);
INSERT INTO `library_sublayer` VALUES ('470f94aabd12454b88826d204e20ef29','04.00.00','default.png','cis-7000-usd-assets-versioned/Assets/flatTeapot/contrib/material/default/texture/default.png','3d283193f6b54cf0a233a5b83ed95819',NULL,'Cqvuc2zkaxWozU6mvtCJwe5VnBWjDMf7',NULL);
INSERT INTO `library_sublayer` VALUES ('4718adf43d50470ba731838203aaaa71','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/largeInkBottle/contrib/geometry/LOD1/geometry_LOD1.usda','3eebe2a320dd4f10b98542d62deec15a',NULL,'GjCWOPcjEGvBugpbUsohwe.DhBXjMFgF',NULL);
INSERT INTO `library_sublayer` VALUES ('47a109aaeea545d1a26caf83b2187986','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/drinkingHorns/contrib/geometry/geometry.usda','c5f39a998aec42cc8396f2ff23cbb375',NULL,'OaWnbC8zRyM3U8iJVo_qR2BKsZsYHXbQ',NULL);
INSERT INTO `library_sublayer` VALUES ('47c0c2f72a214052b1e54290193911de','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/bookshelf1/contrib/.thumbs/thumbnail.png','f3a014272b104716a4e1296a4dcf4404',NULL,'qVxAXun1oUej0FqGR0o_WLui7gLm4RFR',NULL);
INSERT INTO `library_sublayer` VALUES ('47d182d5c42446668b7a57f7c7d1532a','04.00.00','mug_model.usda','usd-asset-versions-dump/2024-assets-acquisition/mug/mug_model.usda','5bac6ed09efe4816b7c427ffb08c599d',NULL,'A0k3d_YZ2McsvHXSbefAlD8MSzeMJxjQ',NULL);
INSERT INTO `library_sublayer` VALUES ('47dbc3caf83742dc809a2e30a388c9e1','04.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/pickleBarrels/contrib/geometry/bbox/geometry_bbox.usda','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'bM56N3c7ChdxwDC511Qtnhs8vFgpH5WL',NULL);
INSERT INTO `library_sublayer` VALUES ('48537b32f9824f899cbe6a5b8e2c1f5d','03.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-03.00.00/bookStack/thumbnail.png','082f328bf76a4d48be255c620a8cd280',NULL,'s5ap72U_1d0ITNSsHB6IuD433ITYzmwn',NULL);
INSERT INTO `library_sublayer` VALUES ('488b4397d04543e4882bf3b57360219a','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/bustWearingHat/contrib/geometry/LOD0/geometry_LOD0.usda','a94d3ddac1e64aff86cf5a194c50d8bf',NULL,'aGe.8x4nLupSIgdCziYoFXn91fqGI4IM',NULL);
INSERT INTO `library_sublayer` VALUES ('48f9163070714abd9938849849fd04ba','05.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/paniniPress/contrib/material/material.usda','3dcf8a1dac8242a59f83c50df682fb69',NULL,'VmggpbMrXpcCHZDrSDTEElsDpMopUlkH',NULL);
INSERT INTO `library_sublayer` VALUES ('4958240253004255bafe4d54b26f9fad','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/foxHandRight/contrib/geometry/LOD0/geometry_LOD0.usda','e1dc4b9960364ffba02431380e01df0f',NULL,'RNUGr7qvhBneTmtX3ygvtcPfOpLFvr7d',NULL);
INSERT INTO `library_sublayer` VALUES ('495f31afbaf547dcabbf4b0620fd7709','04.00.00','wineGlassLOD1.usda','usd-asset-versions-dump/2024-assets-acquisition/wineGlass/wineGlassLOD1.usda','31c39c346b394a1f90cf0a00f1c4a6ef',NULL,'cufhu6ST736nT1gvhfwbQoI_WTwevu8_',NULL);
INSERT INTO `library_sublayer` VALUES ('49bd10dc403f42edb3004bf94020c6d9','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/lockedBox/contrib/geometry/geometry.usda','6ab7f53a7daf46a2ac8a83abcc89ecf9',NULL,'CrI8JQxebw.Fv4p38bp_TKJX8x3bFo5f',NULL);
INSERT INTO `library_sublayer` VALUES ('49ca7779bebd4feb8f0e270f7d11964e','03.00.00','metadata.json','usd-asset-versions-dump/2025-assets-03.00.00/beegCrab/metadata.json','f175fbe4933944a69d06e86c906622d6',NULL,'pWLU6dLuNU5UWlTDWmtVhuUA.OXcLokr',NULL);
INSERT INTO `library_sublayer` VALUES ('49db2b2780ca4719b39b11716ef90dbc','04.00.00','wineGlassLOD0.usda','usd-asset-versions-dump/2024-assets-acquisition/wineGlass/wineGlassLOD0.usda','31c39c346b394a1f90cf0a00f1c4a6ef',NULL,'vSHCzZM1Jvn3sFSqNSBjVJw1qq4xY1Mb',NULL);
INSERT INTO `library_sublayer` VALUES ('4aa0b8a1ce11407c89aecd7f394cc945','03.00.00','sittingMoomin_LOD0.usda','usd-asset-versions-dump/2025-assets-03.00.00/sittingMoomin/LODs/sittingMoomin_LOD0.usda','c0e55d851ea64aa4aeec27c29594a555',NULL,'_yVkBPXtkCUewi06NsnmiWBMhZFb9Axh',NULL);
INSERT INTO `library_sublayer` VALUES ('4aa38d084d67449d883177abfb12224e','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/lockedBox/contrib/.thumbs/thumbnail.png','6ab7f53a7daf46a2ac8a83abcc89ecf9',NULL,'VoJjpx1t.jmgq1uj49D4BitPE7pen7qS',NULL);
INSERT INTO `library_sublayer` VALUES ('4b1f20d5ff4248c185ecad49350eaee1','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/makeupContainers/contrib/geometry/bbox/geometry_bbox.usda','6bc90b076ae74ab9842a07913f22e681',NULL,'EwaUi4OcPxHF9.RFY9rARCT84pffggqI',NULL);
INSERT INTO `library_sublayer` VALUES ('4b369df0ea6846c8877f701d1984b20c','01.00.00','barrel.glb','cis-7000-usd-assets-versioned/Assets/barrel/contrib/.cache/barrel.glb','21ff4cfc83b0435a91b2404af9477d51',NULL,'hR4L2w1qhBRXInNkCJRlg1XBhJ6Bs5zp',NULL);
INSERT INTO `library_sublayer` VALUES ('4b3b55d58b5342f5b601702cd229cb86','05.00.00','rocks.png','cis-7000-usd-assets-versioned/Assets/campfire/contrib/material/rocks/texture/rocks.png','6f6441599cc045ae91530ecd6cc5a81e',NULL,'wUVvZ4uzM99ZACcksYz0mbmfY1AyZW.u','2b94961ec244444185023357a7263f8b');
INSERT INTO `library_sublayer` VALUES ('4b6794d5be6a45c982b797302bb50e1c','02.00.00','cafeTable.fbx','usd-asset-versions-dump/2025-assets-02.00.00/cafeTable/cafeTable.fbx','579fe0bad3f84b7babc143ab2952234e',NULL,'XDFZwcTgnzHjB1uP04hZHop9yJ6Jp8iO',NULL);
INSERT INTO `library_sublayer` VALUES ('4b6d1ccecd6f4c66a1dc613d92e82260','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/candle/contrib/geometry/LOD0/geometry_LOD0.usda','f0941eb324214c48b9a0755db5eaf79b',NULL,'CbGfPw.SmdudUwiBTL8BxU.ebU.FonVI',NULL);
INSERT INTO `library_sublayer` VALUES ('4b7a2bddfe504e88bf9df8b15da5f3ff','01.00.00','lockedBox.usda','cis-7000-usd-assets-versioned/Assets/lockedBox/lockedBox.usda','6ab7f53a7daf46a2ac8a83abcc89ecf9',NULL,'hPl1uxSgIFGaIykmcE7kmPRZ3FrRiXxC',NULL);
INSERT INTO `library_sublayer` VALUES ('4ccb13c05bca40ecb20f6f9070859990','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/bookshelf1/contrib/geometry/geometry.usda','f3a014272b104716a4e1296a4dcf4404',NULL,'oGt7zyAgV6f8gjwttHci_ySUXneMeXQg',NULL);
INSERT INTO `library_sublayer` VALUES ('4d8cc7b4620c4b4895b1f1fc25daf5ac','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/emptyDrawer/contrib/material/default/material_default.usda','aff070bc60b647e29d302848b812f7c2',NULL,'hZQZmHERWrzJGinVFChfYwCA5Vrr1Xu6',NULL);
INSERT INTO `library_sublayer` VALUES ('4d9c89aaef4743718613e10cf22cd5ae','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/bustWearingHat/contrib/geometry/LOD1/geometry_LOD1.usda','a94d3ddac1e64aff86cf5a194c50d8bf',NULL,'fkXXA043CzLOCXJyJof3k_U7mrskK67C',NULL);
INSERT INTO `library_sublayer` VALUES ('4dc18a0d14e44ec68a0f8cc6e31fdb83','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/drinkingHorns/contrib/material/default/material_default.usda','c5f39a998aec42cc8396f2ff23cbb375',NULL,'_hMqamjwZ9d_s3C3Nt6JEJRSmQkAaeah',NULL);
INSERT INTO `library_sublayer` VALUES ('4ddf1425dded4f9a9e8940ba1b05fa3f','04.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/flatTeapot/contrib/geometry/bbox/geometry_bbox.usda','3d283193f6b54cf0a233a5b83ed95819',NULL,'.BACHmAzjsxb_f8rCRC52FqhTNRUsQ0N',NULL);
INSERT INTO `library_sublayer` VALUES ('4dfce3ca563341e6a3f840a532b4eeaa','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/bluePillow/contrib/geometry/bbox/geometry_bbox.usda','81cdcad6e58a448b8dad18e4d311b5f1',NULL,'2Y2Z0EidtiVwsXlTzPZlXyAUY2yEYPmf',NULL);
INSERT INTO `library_sublayer` VALUES ('4e783e14a3074926b18a812f20ac34ec','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/cherryTable/contrib/.thumbs/thumbnail.png','824b428456c148abb25d24568d649441',NULL,'PpI1ig5qumvV5f1iCKUp6ixDwBMuskwp',NULL);
INSERT INTO `library_sublayer` VALUES ('4f849e6c350646269a9770fa128f6299','01.00.00','bambooLadder.glb','cis-7000-usd-assets-versioned/Assets/bambooLadder/contrib/.cache/bambooLadder.glb','f148935dbe764e648b2641d5ddcde381',NULL,'cZqOmJWcnCVvENOVWSPhvttV6D9QOXSu',NULL);
INSERT INTO `library_sublayer` VALUES ('4fff2eff72184cb39cb83550eb38d1a8','03.00.00','cartoonFish.fbx','usd-asset-versions-dump/2025-assets-03.00.00/cartoonFish/cartoonFish.fbx','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'7a0aiDdbToVhgjCv.zFahq9Zi.PkmM4i',NULL);
INSERT INTO `library_sublayer` VALUES ('5036103a272d4605b9cd7784a4eaa51b','05.00.00','sushi.usd','cis-7000-usd-assets-versioned/Assets/sushi/sushi.usd','2c7ef29f88474ded95eb449ebb264ead',NULL,'EuG7n3FQH4UKQL28xT606RqB.GA_T1nR',NULL);
INSERT INTO `library_sublayer` VALUES ('50697d31c3b94afaaacd0ffc7f22506a','03.00.00','vintageLamp_LOD0.usda','usd-asset-versions-dump/2025-assets-02.00.00/vintageLamp/LODs/vintageLamp_LOD0.usda','c4449799e71a4ce88999ea44a86e067b',NULL,'yjaMf5P.C8DoscUP4GLHDASAELi1NRoK',NULL);
INSERT INTO `library_sublayer` VALUES ('50f56f77e4b644069ceca7e1e4967072','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/bustWearingHat/contrib/geometry/bbox/geometry_bbox.usda','a94d3ddac1e64aff86cf5a194c50d8bf',NULL,'ZlPktAHYtRkjtfUtXfNVXdA2GWyiOFLM',NULL);
INSERT INTO `library_sublayer` VALUES ('50f58b3f24ce472a80989b9b7d26ee0c','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/flaredPotion/contrib/geometry/LOD0/geometry_LOD0.usda','16fd6a411cc2475099c6b26a09175e77',NULL,'lly7cQf8wJzjY5uScd1ir9H0Yg0Z4Wy0',NULL);
INSERT INTO `library_sublayer` VALUES ('51101d1af8c3434b928aa4cec7149d54','04.00.00','sushiLOD2.usda','usd-asset-versions-dump/2024-assets-acquisition/sushi/sushiLOD2.usda','2c7ef29f88474ded95eb449ebb264ead',NULL,'C3QVqpZMVuY3sTcNZRsmKZoIiVqmb6FT',NULL);
INSERT INTO `library_sublayer` VALUES ('511f439259d344fda6a0c28b6fc89207','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/hangingGinger/contrib/.thumbs/thumbnail.png','7b333698a6b74e45a24e2e642b55d1dd',NULL,'BBsMqOzro.35vEPqMFqS6FWN6nlBOReu',NULL);
INSERT INTO `library_sublayer` VALUES ('516bdc476552457daf5abd884b6daca7','03.00.00','bookStack_LOD2.usda','usd-asset-versions-dump/2025-assets-03.00.00/bookStack/LODs/bookStack_LOD2.usda','082f328bf76a4d48be255c620a8cd280',NULL,'Tg0qBGvMRdDZ1txVosKZT7my.jJTGxo1',NULL);
INSERT INTO `library_sublayer` VALUES ('5174e0a856434d9895cfd1306d33ab4c','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/candle/contrib/material/default/texture/default.png','f0941eb324214c48b9a0755db5eaf79b',NULL,'krBNJp9SNa3rlDGMq89v5dYhM8U8PXFE',NULL);
INSERT INTO `library_sublayer` VALUES ('51977504736048a5a6773a3c97790f04','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/elavatedLogPlatform/contrib/geometry/geometry.usda','a69b43a2c8ba44a499e7f698f736e60b',NULL,'WHHUGh.9JyC8oNpDhnMAgvfIN92JB1.Q',NULL);
INSERT INTO `library_sublayer` VALUES ('51d304a88a954cbeac4ec3cbdd13867c','02.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-02.00.00/cartoonFish/thumbnail.png','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'Ae.sJsuDGOTEwS2r.23pssiWYUBQKYp5',NULL);
INSERT INTO `library_sublayer` VALUES ('51f4a02e7d50436f87a2b37e467a2024','04.00.00','sushi_model.usda','usd-asset-versions-dump/2024-assets-acquisition/sushi/sushi_model.usda','2c7ef29f88474ded95eb449ebb264ead',NULL,'l1jA8SnMwFLa05Yw0V5kRGLhfboUHKRj',NULL);
INSERT INTO `library_sublayer` VALUES ('520edcf527a6414bb6ece38cfd10bcbd','03.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-03.00.00/campfire/thumbnail.png','6f6441599cc045ae91530ecd6cc5a81e',NULL,'UYzwh1X8dJtcvHTCIKEK_mMuMSu0KpVQ',NULL);
INSERT INTO `library_sublayer` VALUES ('522c083cfbed46219c6f1a8262c43073','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/doubleScrollDrawer/contrib/material/default/texture/default.png','d189b8bcea4e4e289d133f6fdfe25d8b',NULL,'Xmgb.NdVibz6t9kv9HWjqDm5foymJ_z8',NULL);
INSERT INTO `library_sublayer` VALUES ('5299ec675647431181b24fd4d490b300','04.00.00','paniniPressLOD2.usda','usd-asset-versions-dump/2024-assets-acquisition/paniniPress/paniniPressLOD2.usda','3dcf8a1dac8242a59f83c50df682fb69',NULL,'9NF8UDJUkOZg27M555UzlCzxDHhN_3bP',NULL);
INSERT INTO `library_sublayer` VALUES ('5334714ff7614b31924843162ccea03b','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/foxHandRight/contrib/geometry/LOD1/geometry_LOD1.usda','e1dc4b9960364ffba02431380e01df0f',NULL,'mX9DtJ4gGItetSkxhd1YKzhSIu9l.JKJ',NULL);
INSERT INTO `library_sublayer` VALUES ('534b95762c4745b6afbda3a342b9ff5c','02.00.00','parkBench_LOD0.usda','usd-asset-versions-dump/2025-assets-02.00.00/parkBench/LODs/parkBench_LOD0.usda','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'.5r5y4ktiEucx69NKst678bhl9t_x8di',NULL);
INSERT INTO `library_sublayer` VALUES ('535807adea9f48c9afb9e53af65a7d1b','03.00.00','teapot.fbx','usd-asset-versions-dump/2025-assets-03.00.00/teapot/teapot.fbx','f5e189a845fb4ed3930a81263a21bf99',NULL,'S_N03fra2jS_2wFok1U6mcJQS9llinhG',NULL);
INSERT INTO `library_sublayer` VALUES ('543316c6499c49f4b86a6e1141a9fbb3','01.00.00','cafeTable.fbx','usd-asset-versions-dump/2025-assets-01.00.00/cafeTable/cafeTable.fbx','579fe0bad3f84b7babc143ab2952234e',NULL,'PZsLDqszSdZm.xmEOco3XCEoRDJISTxZ',NULL);
INSERT INTO `library_sublayer` VALUES ('5463fab1b56c41bd9eae9d0c3d019026','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/glassCauldron/contrib/material/material.usda','427b041b429f4dffb526ee677a936f12',NULL,'O8gFXy6U0tEbHv2MyCJ5w4V87uLGBKm9',NULL);
INSERT INTO `library_sublayer` VALUES ('5516ac59e0094dc1b092e05eaa480453','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/jelloShelf/contrib/geometry/LOD1/geometry_LOD1.usda','99f5e6f9675b41ed91e76daebb016c4a',NULL,'jFUCzC6Ijtzj9ZNMaLuwEZw9WwvM.l0t',NULL);
INSERT INTO `library_sublayer` VALUES ('552caa25d2da47a096be276f7549c657','03.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-03.00.00/teapot/thumbnail.png','f5e189a845fb4ed3930a81263a21bf99',NULL,'GVP8FCsFiargKda2klrxkXHI1USWvUGY',NULL);
INSERT INTO `library_sublayer` VALUES ('5547bc701cd042d394161e00fedeaedd','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/cherryTable/contrib/material/default/material_default.usda','824b428456c148abb25d24568d649441',NULL,'JtddX5DLVGoJyqNZ50hD4EreoqUF2.O1',NULL);
INSERT INTO `library_sublayer` VALUES ('554b397acf89404d9a3f6ac0213ba1f0','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/flaredPotion/contrib/geometry/LOD2/geometry_LOD2.usda','16fd6a411cc2475099c6b26a09175e77',NULL,'Jn7zek76u.Nip86baJ0hQX4lJ1OtaXzb',NULL);
INSERT INTO `library_sublayer` VALUES ('555c116d49264094b8a1e24a7cb8ae68','01.00.00','largePottedPlant.glb','cis-7000-usd-assets-versioned/Assets/largePottedPlant/contrib/.cache/largePottedPlant.glb','cc9847c9e64a4341bd8287edf73afe04',NULL,'3A1WK06q2x3szXoBPbZcibekaKSz_9Qw',NULL);
INSERT INTO `library_sublayer` VALUES ('5579d8d7d9b041b0a2fcd55e3c437a83','02.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-02.00.00/skateboard/thumbnail.png','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'ndTC3bVRFeqyxLB3r7MjjAD_JoThKALU',NULL);
INSERT INTO `library_sublayer` VALUES ('558d4c6a9fe04f379e1de81eda4be4ac','05.00.00','default.png','cis-7000-usd-assets-versioned/Assets/mug/contrib/material/default/texture/default.png','5bac6ed09efe4816b7c427ffb08c599d',NULL,'BT4Ddo_NAdwS5Dq48u7S9aE_gbC_0psm',NULL);
INSERT INTO `library_sublayer` VALUES ('55c7101390f24e14a71b3af0f85e7b7d','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/bookStack3/contrib/geometry/geometry.usda','077caad23bd4486b8fb066bf43d04761',NULL,'iYoPh64kxuwMCeLF1Co.6xpfHamzPdN7',NULL);
INSERT INTO `library_sublayer` VALUES ('55ce59095e8146c1a1e7443d245239af','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/bookStack5/contrib/material/material.usda','fa20ba6a205e4d2b951f8262bf5b2802',NULL,'MJ3OmvqJrWsbOfdmTm5vYg4unkoofRJ8',NULL);
INSERT INTO `library_sublayer` VALUES ('55dc624701df4117b2c54c33371839b9','01.00.00','elavatedLogPlatform.usda','cis-7000-usd-assets-versioned/Assets/elavatedLogPlatform/elavatedLogPlatform.usda','a69b43a2c8ba44a499e7f698f736e60b',NULL,'eyf6agncHSpTkHK3AEWz6YQAlx5pu8ee',NULL);
INSERT INTO `library_sublayer` VALUES ('5601ec73389f466dbe741ded28b253ed','04.00.00','default.png','cis-7000-usd-assets-versioned/Assets/cafeTable/contrib/material/default/texture/default.png','579fe0bad3f84b7babc143ab2952234e',NULL,'ELaddqvLtDWBXSpOOStQIeY4y3tWrDRJ',NULL);
INSERT INTO `library_sublayer` VALUES ('5602ecc3eaf64cb2962435586d84e6e9','03.00.00','metadata.json','usd-asset-versions-dump/2025-assets-03.00.00/cafeTable/metadata.json','579fe0bad3f84b7babc143ab2952234e',NULL,'IZfim8zVkRQ4Tf2VpDOYGU99GiOYi8xG',NULL);
INSERT INTO `library_sublayer` VALUES ('56569b849fe84b8f8ce8230f9e2e5195','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/foxHandRight/contrib/material/default/texture/default.png','e1dc4b9960364ffba02431380e01df0f',NULL,'skvx_nwTmghnPS5lREWjYQz66ULFPj.h',NULL);
INSERT INTO `library_sublayer` VALUES ('569f7856e53748899e79bdbf026dbd6a','05.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/mug/contrib/geometry/LOD2/geometry_LOD2.usda','5bac6ed09efe4816b7c427ffb08c599d',NULL,'3H5aRvQAxQ7sPYOsh_bvTaLo2POIoNwN',NULL);
INSERT INTO `library_sublayer` VALUES ('56c7edbd65064b55aea9c9ed19a794ab','04.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/skateboard/contrib/geometry/bbox/geometry_bbox.usda','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'LGmbAyF.7.UM3Y_p.dzJ.ExvB3683n0t',NULL);
INSERT INTO `library_sublayer` VALUES ('5743be84a7c74363813960c893a32267','05.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/sushi/contrib/.thumbs/thumbnail.png','2c7ef29f88474ded95eb449ebb264ead',NULL,'pjXbBsVLZBTHQkwbfcYuwvZoc3fv_2uf',NULL);
INSERT INTO `library_sublayer` VALUES ('575b84cc94f44239bab8cb9ae8f40400','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/leafyVegetation/contrib/geometry/geometry.usda','bc9563cab790436abc6180a53087ad1a',NULL,'.3DVBPogrjMih6b6.SJUuTFG0OKGWlIK',NULL);
INSERT INTO `library_sublayer` VALUES ('5773876e9c2745f5990750514f451e4b','04.00.00','penTabletLOD0.usda','usd-asset-versions-dump/2024-assets-acquisition/penTablet/penTabletLOD0.usda','db17d0c2030049769e1ba2ea54d86114',NULL,'Ko0P391HLwlJdII6TIIJ6MBcUcqQ7g8o',NULL);
INSERT INTO `library_sublayer` VALUES ('577c5cb434cb434da9b12ba75a926c2a','01.00.00','candle.glb','cis-7000-usd-assets-versioned/Assets/candle/contrib/.cache/candle.glb','f0941eb324214c48b9a0755db5eaf79b',NULL,'ThsnmzkTL1ktlYRt_lz_X95z8niqT_zW',NULL);
INSERT INTO `library_sublayer` VALUES ('58badc5c37284ba9ad266b500b0c185f','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/bambooLadder/contrib/material/material.usda','f148935dbe764e648b2641d5ddcde381',NULL,'F1iDhQSAcqORyreOJ0f4RjWH3yUIZRe8',NULL);
INSERT INTO `library_sublayer` VALUES ('58d306301a724bb2869fd61635696017','04.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/pickleBarrels/contrib/material/material.usda','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'M9Cj2NsR6J9iqmwvFZucExbhCzAtP8XX',NULL);
INSERT INTO `library_sublayer` VALUES ('590c4e14837b48e2ba26ecf2a7a14bac','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/cashRegister/contrib/material/default/texture/default.png','ca9ae1e89e6145bea24272531dcfbe27',NULL,'XHpaTLc1_qhIVMC1Qa_HVpyTLoDPgFqP',NULL);
INSERT INTO `library_sublayer` VALUES ('59103345dbb042f19c22f97da9eaaa69','02.00.00','metadata.json','usd-asset-versions-dump/2025-assets-02.00.00/yugiohClockArc/metadata.json','4be817e19e11426ebeede52145732e77',NULL,'7lSj3P7_e2.b6jnJPR323jpgncfbnizP',NULL);
INSERT INTO `library_sublayer` VALUES ('59c8ec0797fd41e890bca79cac6f8558','04.00.00','yellowDuck.usd','cis-7000-usd-assets-versioned/Assets/yellowDuck/yellowDuck.usd','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'g1Ny2gogHCoQnT.PVGNCielTw6FQ44NR',NULL);
INSERT INTO `library_sublayer` VALUES ('5a062ea7eafb4fe4a7c60e03443e17f8','02.00.00','metadata.json','usd-asset-versions-dump/2025-assets-01.00.00/vintageLamp/metadata.json','c4449799e71a4ce88999ea44a86e067b',NULL,'hkHJNlsY_4vskfiRs1zYxJY5YtWz8sEa',NULL);
INSERT INTO `library_sublayer` VALUES ('5a4558809b864698937cd35cb1439ef9','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/barrel/contrib/geometry/bbox/geometry_bbox.usda','21ff4cfc83b0435a91b2404af9477d51',NULL,'Mo0LJp2lSzwOEeTVK5AutXYg3Rs6_pCI',NULL);
INSERT INTO `library_sublayer` VALUES ('5c1c7150e43341a4b3f20bb7c3ae5ecf','01.00.00','medicineBottle.usda','cis-7000-usd-assets-versioned/Assets/medicineBottle/medicineBottle.usda','8deb7dd1667c428b89933de25c02e4ce',NULL,'ehhVXS2.vK2O1P902UHYigYIMAsgdGJj',NULL);
INSERT INTO `library_sublayer` VALUES ('5c2567ae274c49b380c3f52bf02e3c05','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/oakTable/contrib/material/material.usda','3dfa350b0a294d7c9f1b419180d71748',NULL,'VyE23JK32ylWQ1V1Eq2ZZHNlHYEU0Wr9',NULL);
INSERT INTO `library_sublayer` VALUES ('5c489ae399f04c5d85d2b9d4c303003b','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/largeCherryTable/contrib/material/material.usda','b24acc08b15546e896c3e25add15f1ba',NULL,'6kbW_270IkT131lxsdHqFzrgC_jeBzE5',NULL);
INSERT INTO `library_sublayer` VALUES ('5ca846a3677d4b2aaebf4a38cdf86634','05.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/wineGlass/contrib/material/default/material_default.usda','31c39c346b394a1f90cf0a00f1c4a6ef',NULL,'3A.H1MYVHX7iOlIzMVOH_w6B1yNwHFY7',NULL);
INSERT INTO `library_sublayer` VALUES ('5cc5e718d8e1445882a1d0188f67a61e','05.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/penTablet/contrib/geometry/bbox/geometry_bbox.usda','db17d0c2030049769e1ba2ea54d86114',NULL,'gleH6l43yjDVTUHtUWCdQbABdm0rv33E',NULL);
INSERT INTO `library_sublayer` VALUES ('5da457f5ccdd4dbe92c9438a8513c5ad','04.00.00','metadata.json','usd-asset-versions-dump/2024-assets-acquisition/paniniPress/metadata.json','3dcf8a1dac8242a59f83c50df682fb69',NULL,'6_BEiqlZauust6TRJI8HU4X.k7VHGqPV',NULL);
INSERT INTO `library_sublayer` VALUES ('5dc24523763649508c68d78f6e4617c3','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/goPieceJar/contrib/material/default/material_default.usda','65cb65e774ab4a4795d18ff514a071d9',NULL,'TAF02zRxmQX6xFYygGR7QT1dYndwhaXr',NULL);
INSERT INTO `library_sublayer` VALUES ('5dd0c9e3b52c41e7b81b625a2199f051','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/largeInkBottle/contrib/material/default/texture/default.png','3eebe2a320dd4f10b98542d62deec15a',NULL,'KN4ufZ86ygqpcZVBzvjeBwegQwiAHuc7',NULL);
INSERT INTO `library_sublayer` VALUES ('5e31d66700894fcf90426c5dd113c4b9','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/candleGroup/contrib/geometry/geometry.usda','a1513d5dbdf7478aab3b4d659a3f5e74',NULL,'BT3Zyzewyy5F5Pqm37vaBzCwV70kMR9m',NULL);
INSERT INTO `library_sublayer` VALUES ('5ed91753b19349129b1fdc560740aedb','01.00.00','drawerAssembly.usda','cis-7000-usd-assets-versioned/Assets/drawerAssembly/drawerAssembly.usda','2652016a66e647f2bb874058b4d7e13c',NULL,'cnvyvOmExji5iY9RZsHx9BTJ9yhh4EVC',NULL);
INSERT INTO `library_sublayer` VALUES ('5f10494503304c6e82ce250a7ee31493','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/cappedJar/contrib/geometry/LOD1/geometry_LOD1.usda','449fe9fdd5434b03ae7f5bc021402fbf',NULL,'JKCPoY1EVy68mx5mpMTcn.OZhyLQ3.pL',NULL);
INSERT INTO `library_sublayer` VALUES ('5f6ba0decd1648d786e2c0f3412a9147','05.00.00','kitchenaidLOD2.usda','usd-asset-versions-dump/2024-assets-acquisition/kitchenaid/kitchenaidLOD2.usda','66b74b32abd8459cbe41f434285a7691',NULL,'TymdeGerknpcigItZ.SVR1X6PyKkLUP7',NULL);
INSERT INTO `library_sublayer` VALUES ('5f7e50854d0947ca85b40649482faed3','01.00.00','bluePillow.usda','cis-7000-usd-assets-versioned/Assets/bluePillow/bluePillow.usda','81cdcad6e58a448b8dad18e4d311b5f1',NULL,'S7dpTKJ_Oig.XmzZe2yyMHn8tw4_owcQ',NULL);
INSERT INTO `library_sublayer` VALUES ('5f8c9fde7da242e5afa34aeaff66f26e','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/alchemistRoomWalls/contrib/geometry/bbox/geometry_bbox.usda','ed516f0180c84489b7cd35f892c8e438',NULL,'.Ax.2d4KZqX3VfGVW7OXKeiBwe77VXm2',NULL);
INSERT INTO `library_sublayer` VALUES ('5fbdee6b07fb49439e03c80dd42acbfc','01.00.00','bookStack5.glb','cis-7000-usd-assets-versioned/Assets/bookStack5/contrib/.cache/bookStack5.glb','fa20ba6a205e4d2b951f8262bf5b2802',NULL,'SHAfh3VFAxWzdQjYLdeEf_6wzxknQlXN',NULL);
INSERT INTO `library_sublayer` VALUES ('5fc09830dd8646e3a5a62befa9939389','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/blueJello/contrib/geometry/LOD0/geometry_LOD0.usda','3d6b8007d30e4919a46deedb6dfce573',NULL,'AEE2TEjoWW9RW6fME9jtG5_sEDIcCvge',NULL);
INSERT INTO `library_sublayer` VALUES ('601cfeb025f44269af416a919549671d','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/orangePillow/contrib/geometry/LOD0/geometry_LOD0.usda','5c179fdb44924eba8a42c0948766ca62',NULL,'_CeG_vYTr_sMODk3TghU6jdqzwH2G86P',NULL);
INSERT INTO `library_sublayer` VALUES ('6022266471c24248974c80cc9f2d26a7','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/elavatedLogPlatform/contrib/geometry/LOD0/geometry_LOD0.usda','a69b43a2c8ba44a499e7f698f736e60b',NULL,'8kXIYuwTGYJqw4vrRTK6xw8BGRpn6EJm',NULL);
INSERT INTO `library_sublayer` VALUES ('60226c8f10564fa99411cf6e8e55182d','03.00.00','teapot_material.usda','usd-asset-versions-dump/2024-assets-acquisition/flatTeapot/teapot_material.usda','3d283193f6b54cf0a233a5b83ed95819',NULL,'aAjgt9bMr3689PvMG_A08Eb8Gl2Bz.7t',NULL);
INSERT INTO `library_sublayer` VALUES ('6024d7153bfb4145985d27ba0e425959','03.00.00','skateboard.fbx','usd-asset-versions-dump/2025-assets-03.00.00/skateboard/skateboard.fbx','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'bmzB7tOKzvnAjYXaBoXHmBayVdp2d4pq',NULL);
INSERT INTO `library_sublayer` VALUES ('609e880223224f75ac53513b87339956','03.00.00','beegCrab_LOD2.usda','usd-asset-versions-dump/2025-assets-03.00.00/beegCrab/LODs/beegCrab_LOD2.usda','f175fbe4933944a69d06e86c906622d6',NULL,'bR.r00va_4gLfQa1pXWMxl9Jyu1.fg5e',NULL);
INSERT INTO `library_sublayer` VALUES ('611fb297f594441bbcdfed1902cd8b81','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/leafyVegetation/contrib/material/default/texture/default.png','bc9563cab790436abc6180a53087ad1a',NULL,'phQQFioXFoDdAgDuUCfOijTAWXLehCqb',NULL);
INSERT INTO `library_sublayer` VALUES ('612831e6397f46ed99c20390ebe6dbbd','04.00.00','paniniPressLOD1.usda','usd-asset-versions-dump/2024-assets-acquisition/paniniPress/paniniPressLOD1.usda','3dcf8a1dac8242a59f83c50df682fb69',NULL,'xGqoZVxZ32e7XKKrNogqGcQqFXCr_D6b',NULL);
INSERT INTO `library_sublayer` VALUES ('613c7b79d62f4164bf18962fd8eb7e32','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/bambooLadder/contrib/geometry/LOD1/geometry_LOD1.usda','f148935dbe764e648b2641d5ddcde381',NULL,'ipfhhjELYJyjEqEXbRZBvbePkLt907Th',NULL);
INSERT INTO `library_sublayer` VALUES ('61477ec903be474094434f13a6be6c5b','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/leafyVegetation/contrib/geometry/LOD0/geometry_LOD0.usda','bc9563cab790436abc6180a53087ad1a',NULL,'p5uOJCSwrlgMMD8pyeXBFVlhaK2PGBIO',NULL);
INSERT INTO `library_sublayer` VALUES ('6184692f91684045abb6852950af67c1','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/largeInkBottle/contrib/material/material.usda','3eebe2a320dd4f10b98542d62deec15a',NULL,'K8a_embwWHBlyyBQgv.KMHmAuDpDtGq5',NULL);
INSERT INTO `library_sublayer` VALUES ('6240ea34780540489bf0dd70ff86529b','01.00.00','goPieceJar.usda','cis-7000-usd-assets-versioned/Assets/goPieceJar/goPieceJar.usda','65cb65e774ab4a4795d18ff514a071d9',NULL,'L2.6jR6I17xTJ9G0IiOjLi7dtVPMRAQ8',NULL);
INSERT INTO `library_sublayer` VALUES ('62b163999d5f43ea96b80d3b8cac0de2','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/bookStack2/contrib/material/material.usda','76e5d476ecc44eeea6da09806954f8bd',NULL,'4YoFBt_WvREy36L4mNVUrutYJqvMxkrn',NULL);
INSERT INTO `library_sublayer` VALUES ('62b38c01c21a43beb9eb9885c2d05c11','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/glassJarEmpty/contrib/.thumbs/thumbnail.png','6be75d74d18f4d88bc635b222107966f',NULL,'71Qq6ZSN5FqQWuE0XoYzncO_4rhxho1A',NULL);
INSERT INTO `library_sublayer` VALUES ('62f1bdb85fa642d88eb04c8957ee4990','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/jelloShelf/contrib/material/default/material_default.usda','99f5e6f9675b41ed91e76daebb016c4a',NULL,'o2p.hb66JUsXwdcNZnWxhRqCGa9EBI9k',NULL);
INSERT INTO `library_sublayer` VALUES ('638f94df698b4ab0a7f97bad075e74ee','01.00.00','alchemistRoomWalls.usda','cis-7000-usd-assets-versioned/Assets/alchemistRoomWalls/alchemistRoomWalls.usda','ed516f0180c84489b7cd35f892c8e438',NULL,'F8SlRqfw4plASwCh4uLPEukhH9_n9Pqt',NULL);
INSERT INTO `library_sublayer` VALUES ('6394795361df45be941d60f0ad220d7a','04.00.00','skateboard.usd','cis-7000-usd-assets-versioned/Assets/skateboard/skateboard.usd','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'ZxKb7Ts8yW_sV_7.xIaU7_yjLC8S0pbr',NULL);
INSERT INTO `library_sublayer` VALUES ('63c624388f3e4e218aa0aeaf5cf70aab','02.00.00','vintageLamp.fbx','usd-asset-versions-dump/2025-assets-01.00.00/vintageLamp/vintageLamp.fbx','c4449799e71a4ce88999ea44a86e067b',NULL,'Rq9VA30ZKq4q9oJY4YTNjjJ4bxUpE7g9',NULL);
INSERT INTO `library_sublayer` VALUES ('643034dc0aff4bfc89cb4ce76a3be682','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/bookStack3/contrib/geometry/LOD0/geometry_LOD0.usda','077caad23bd4486b8fb066bf43d04761',NULL,'YtDQVVsUvmWYUFj0ufP04neFnEBX_QuJ',NULL);
INSERT INTO `library_sublayer` VALUES ('6443a16c57e646a2a6833175e7dc5612','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/bookStack4/contrib/geometry/LOD0/geometry_LOD0.usda','f1d3b419b0444e58a2e45fe157647464',NULL,'c0mxpYQbJkvB7zFyOIBl_ZV1QBu_kCq2',NULL);
INSERT INTO `library_sublayer` VALUES ('644728309af74f4b88d1e575c7dfa77d','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/drinkingHorns/contrib/material/default/texture/default.png','c5f39a998aec42cc8396f2ff23cbb375',NULL,'otQHuMiTV9zHXAvAaf1Nuut4YcF.7W0v',NULL);
INSERT INTO `library_sublayer` VALUES ('64803182d08b48378714a0cece4c41af','04.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/teapot/contrib/geometry/LOD2/geometry_LOD2.usda','f5e189a845fb4ed3930a81263a21bf99',NULL,'UISFv9M6DmeRyAcuelzIZsCQf28J6AMi',NULL);
INSERT INTO `library_sublayer` VALUES ('64e216bda94c4e4dad2c7bd79afb81b4','02.00.00','metadata.json','usd-asset-versions-dump/2025-assets-02.00.00/yellowDuck/metadata.json','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'ln5Men40pvC6KK72ITrDvtHiEa7p7Tkr',NULL);
INSERT INTO `library_sublayer` VALUES ('64e992a624a04aa0846a4ee7b26e87a8','01.00.00','teapot.fbx','usd-asset-versions-dump/2025-assets-01.00.00/teapot/teapot.fbx','f5e189a845fb4ed3930a81263a21bf99',NULL,'01tGT0bnmPy4s6mkPUiIDpj.MaovR4LQ',NULL);
INSERT INTO `library_sublayer` VALUES ('64f14c9748c543b4914dcb6887d25301','01.00.00','cashRegister.glb','cis-7000-usd-assets-versioned/Assets/cashRegister/contrib/.cache/cashRegister.glb','ca9ae1e89e6145bea24272531dcfbe27',NULL,'edT867ehtrE9PpBM0EFNvbHt7Zhb81dZ',NULL);
INSERT INTO `library_sublayer` VALUES ('65b3d2f973b84607bf23e3343429a4b3','03.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-03.00.00/yugiohClockArc/thumbnail.png','4be817e19e11426ebeede52145732e77',NULL,'LHFjHf7ySCYqNUzb.JZViZhM_AFDgQpq',NULL);
INSERT INTO `library_sublayer` VALUES ('65c80d35ddf64fc4a2de5a1b75836859','04.00.00','logs.png','cis-7000-usd-assets-versioned/Assets/campfire/contrib/material/logs/texture/logs.png','6f6441599cc045ae91530ecd6cc5a81e',NULL,'2IYBZkMb.058trCGDXQDGPPHb9mqDGEW',NULL);
INSERT INTO `library_sublayer` VALUES ('65ce451509704763a5958d60883fafae','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/blueJello/contrib/material/default/texture/default.png','3d6b8007d30e4919a46deedb6dfce573',NULL,'ANwOPqzBvToBIY7d4xjOQfNAHPfw1AzV',NULL);
INSERT INTO `library_sublayer` VALUES ('65d9d7a798804d68a003e1ae3b328a2e','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/candleGroup/contrib/material/default/material_default.usda','a1513d5dbdf7478aab3b4d659a3f5e74',NULL,'cuYPssZL.D2EYqKR4Iaq9CEFr7iSj_VS',NULL);
INSERT INTO `library_sublayer` VALUES ('65f6b4cf759f47fea8bc359bd08a3102','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/bookshelf2/contrib/geometry/geometry.usda','39ab42636a0747ffa50446bcf4f57980',NULL,'LMhNt1T5GaLi78z7Ge4jGhKsRhWxmJK8',NULL);
INSERT INTO `library_sublayer` VALUES ('6650d23a3673400b86f23fd111f749d7','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/glassJarEmpty/contrib/material/default/texture/default.png','6be75d74d18f4d88bc635b222107966f',NULL,'T_W.FWW9y0dinewehxCS.EqGwxS2SZFe',NULL);
INSERT INTO `library_sublayer` VALUES ('666fb28013094749b7b912c98b103588','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/candle/contrib/geometry/LOD2/geometry_LOD2.usda','f0941eb324214c48b9a0755db5eaf79b',NULL,'Jd6G6zIxbrDawoHgNNdYi4rkHRZLHVlj',NULL);
INSERT INTO `library_sublayer` VALUES ('67218ab405d34fe69137c7ba6707ee18','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/logSteps/contrib/geometry/LOD1/geometry_LOD1.usda','bcb688a70758427fbb7e23d1ed9d756e',NULL,'3NrSUfCsFJ.jfoEirzDH7_PZi1J7e.vk',NULL);
INSERT INTO `library_sublayer` VALUES ('67397eafd23048dd902662adbc37bdf5','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/jelloShelf/contrib/material/material.usda','99f5e6f9675b41ed91e76daebb016c4a',NULL,'VWjj7xE6uEBMcrllGrobWlxsA_Ox80v8',NULL);
INSERT INTO `library_sublayer` VALUES ('6757734a396a4bb19e0c7d961a63e340','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/largePottedPlant/contrib/.thumbs/thumbnail.png','cc9847c9e64a4341bd8287edf73afe04',NULL,'L4a4ERzBzdJobwPi76v1KQGDLo5uHLvu',NULL);
INSERT INTO `library_sublayer` VALUES ('68ac7428b1c145a0a924ec2417c61f75','04.00.00','woodenChairLOD1.usda','usd-asset-versions-dump/2024-assets-acquisition/woodenChair/woodenChairLOD1.usda','b7d69121f36340adbdb7bed776c42a8d',NULL,'yawRemQDaNX2HuAOtqwDZk3Sqwl9.TOS',NULL);
INSERT INTO `library_sublayer` VALUES ('68c0bfa7259c42cb835aeef2873d0584','05.00.00','kitchenaid.ma','usd-asset-versions-dump/2024-assets-acquisition/kitchenaid/kitchenaid.ma','66b74b32abd8459cbe41f434285a7691',NULL,'alcbK2rC11b_.2.JwkRWm6LI6MjW016k',NULL);
INSERT INTO `library_sublayer` VALUES ('68cda689d76e4ee391de9bc542e03322','05.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/paniniPress/contrib/material/default/material_default.usda','3dcf8a1dac8242a59f83c50df682fb69',NULL,'A8BIEM9vBUPT8BKsL7.U9XlJYcIRmOCd',NULL);
INSERT INTO `library_sublayer` VALUES ('68fa817a50494720970689a167895e2a','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/jelloShelf/contrib/.thumbs/thumbnail.png','99f5e6f9675b41ed91e76daebb016c4a',NULL,'tx_Mxxg0rBXg9WtD6lwYwdFCJtYENJ9V',NULL);
INSERT INTO `library_sublayer` VALUES ('6915ddd90c4c48919c43ae5b55d3f37f','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/barrel/contrib/geometry/LOD1/geometry_LOD1.usda','21ff4cfc83b0435a91b2404af9477d51',NULL,'5Iqhi18fhut.q9WkIbAxQwAYIKSL2ZgD',NULL);
INSERT INTO `library_sublayer` VALUES ('6947845d647f477fa2a62cf8db995bce','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/medicineBottle/contrib/.thumbs/thumbnail.png','8deb7dd1667c428b89933de25c02e4ce',NULL,'s5Yn7HeUf5KkfwdN_w61Q.10BHcTMDwl',NULL);
INSERT INTO `library_sublayer` VALUES ('699f5eae5f6e403cb15d95d9c0780dab','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/medicineBottle/contrib/geometry/bbox/geometry_bbox.usda','8deb7dd1667c428b89933de25c02e4ce',NULL,'wGQV6GbmFjDxQC9YPolJln6lwmEzS54o',NULL);
INSERT INTO `library_sublayer` VALUES ('6a43f20ab25a4d1cb053a6e5610c1414','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/bookshelf3/contrib/.thumbs/thumbnail.png','fa5e37ee437e45acb2ae0c3c9c725b83',NULL,'G_i3Zg97Pw65bbXAt5ZXjwli9pytxVHo',NULL);
INSERT INTO `library_sublayer` VALUES ('6a9f54dde983476b982863ece5aa49f7','01.00.00','oakTable.usda','cis-7000-usd-assets-versioned/Assets/oakTable/oakTable.usda','3dfa350b0a294d7c9f1b419180d71748',NULL,'nP5cW7WVTNHw5T0wxwUwfjYyhdIkxVxB',NULL);
INSERT INTO `library_sublayer` VALUES ('6b1989f5c4b14d42b1a8f68d1265447e','05.00.00','default.png','cis-7000-usd-assets-versioned/Assets/paniniPress/contrib/material/default/texture/default.png','3dcf8a1dac8242a59f83c50df682fb69',NULL,'40X_u09EvzKhJeefpClesa7Tcj5gjz_6',NULL);
INSERT INTO `library_sublayer` VALUES ('6b9f2399eac94d038ff87ae68cdd097e','03.00.00','skateboard_LOD1.usda','usd-asset-versions-dump/2025-assets-03.00.00/skateboard/LODs/skateboard_LOD1.usda','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'lEADCYtDaUHjo4.4yzVBZsaUpYqOAdp5',NULL);
INSERT INTO `library_sublayer` VALUES ('6c2e13a83f4a4cbd83789a8cf924dd96','01.00.00','logSteps.usda','cis-7000-usd-assets-versioned/Assets/logSteps/logSteps.usda','bcb688a70758427fbb7e23d1ed9d756e',NULL,'OAllne5kYnGpG.Z3afmyNue2BsLsmrpP',NULL);
INSERT INTO `library_sublayer` VALUES ('6ce4f1e504054938a2f87b31abe6d6a9','04.00.00','wineGlass_material.usda','usd-asset-versions-dump/2024-assets-acquisition/wineGlass/wineGlass_material.usda','31c39c346b394a1f90cf0a00f1c4a6ef',NULL,'h.xcu3Wj1sOhofyEElzRoVkQWdi5Dgfx',NULL);
INSERT INTO `library_sublayer` VALUES ('6d19d7789aed4ce888d9c6e799d7f3eb','03.00.00','skateboard.usda','usd-asset-versions-dump/2025-assets-03.00.00/skateboard/skateboard.usda','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'uXkevgU8_9rDKi_TMb6jH6ViePjAt7c9',NULL);
INSERT INTO `library_sublayer` VALUES ('6d217c228bf848fa8c611329fd01785c','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/logSteps/contrib/geometry/bbox/geometry_bbox.usda','bcb688a70758427fbb7e23d1ed9d756e',NULL,'0RQjxTrX50uz7tXkxN5CbXAxAOrjYS7e',NULL);
INSERT INTO `library_sublayer` VALUES ('6d235eeedaa2460c8dac7669a5f06edd','05.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/sushi/contrib/geometry/LOD2/geometry_LOD2.usda','2c7ef29f88474ded95eb449ebb264ead',NULL,'3MuTuBxV7OOBDrYxdsHnIjJV7wD3RJFv',NULL);
INSERT INTO `library_sublayer` VALUES ('6d7bb457a26143f6acb120eda2be45c3','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/glassJarEmpty/contrib/geometry/geometry.usda','6be75d74d18f4d88bc635b222107966f',NULL,'aDU4Or_liPK5k1oH07zp1JbpK76zn1yl',NULL);
INSERT INTO `library_sublayer` VALUES ('6dfbf9f0de554eec812d9d21b7b5b42a','01.00.00','emptyDrawer.usda','cis-7000-usd-assets-versioned/Assets/emptyDrawer/emptyDrawer.usda','aff070bc60b647e29d302848b812f7c2',NULL,'VNyF2xJQzYB8xj9u3IGlo0efs_vh1vOO',NULL);
INSERT INTO `library_sublayer` VALUES ('6e2d583d041547dfa4dd003e2bde806f','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/inkBottle/contrib/geometry/geometry.usda','ba022dd31fd0446a907529c711cea63f',NULL,'9IJWbgthChlKqiMKO_S3y7rvW8PbFAgS',NULL);
INSERT INTO `library_sublayer` VALUES ('6e3dff0d70ec4384809a5a388c8d562d','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/largePottedPlant/contrib/material/default/material_default.usda','cc9847c9e64a4341bd8287edf73afe04',NULL,'ZMQWKblX_7cumS8Twa6qL41q5lFB1SZN',NULL);
INSERT INTO `library_sublayer` VALUES ('6e723540141341eab294bde084954314','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/bookshelf1/contrib/material/default/material_default.usda','f3a014272b104716a4e1296a4dcf4404',NULL,'un5eOPO6RCDtZ9ghkwxw7cIyJHVNBoHv',NULL);
INSERT INTO `library_sublayer` VALUES ('6eb2c08bed4c412cb28225e7eae316bd','03.00.00','metadata.json','usd-asset-versions-dump/2025-assets-03.00.00/sittingMoomin/metadata.json','c0e55d851ea64aa4aeec27c29594a555',NULL,'n39nfW_hgCw25A.OTpi2vSg0oYrWq8.m',NULL);
INSERT INTO `library_sublayer` VALUES ('6ed0247a1a23490f8cf00783d67c885a','05.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/paniniPress/contrib/geometry/LOD2/geometry_LOD2.usda','3dcf8a1dac8242a59f83c50df682fb69',NULL,'ry1HkuIGNtPwMZt1BsJ3fTRhFxVXnBoT',NULL);
INSERT INTO `library_sublayer` VALUES ('6ee93f2383b94a99853d65c9387508ba','02.00.00','bookStack_LOD2.usda','usd-asset-versions-dump/2025-assets-02.00.00/bookStack/LODs/bookStack_LOD2.usda','082f328bf76a4d48be255c620a8cd280',NULL,'YTF7CMZURglHxMjgOEjTbh1cWWw24cea',NULL);
INSERT INTO `library_sublayer` VALUES ('6f148d86d8374ac39a275dff6e9ff153','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/emptyDrawer/contrib/geometry/LOD1/geometry_LOD1.usda','aff070bc60b647e29d302848b812f7c2',NULL,'naukQY0yUhXZKt4hlyKcMYiXy6GQniOJ',NULL);
INSERT INTO `library_sublayer` VALUES ('6f4c871d5e2d434e99738a64f8b3daa8','02.00.00','yellowDuck.fbx','usd-asset-versions-dump/2025-assets-02.00.00/yellowDuck/yellowDuck.fbx','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'rk_33Ei_5qbA7soyDh_YrsZkQEGXsZ01',NULL);
INSERT INTO `library_sublayer` VALUES ('6ff9aacc648645aca3a61d02714821e2','02.00.00','beegCrab.fbx','usd-asset-versions-dump/2025-assets-02.00.00/beegCrab/beegCrab.fbx','f175fbe4933944a69d06e86c906622d6',NULL,'ygyE4bVX_4qRglIm3uQ8sOpfi2lPV.qZ',NULL);
INSERT INTO `library_sublayer` VALUES ('6ffc803d30924593969421a2e040d47e','04.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/sittingMoomin/contrib/.thumbs/thumbnail.png','c0e55d851ea64aa4aeec27c29594a555',NULL,'KHvqBGcDAOwnjSGPGq1ocOdC9jnj0p.e',NULL);
INSERT INTO `library_sublayer` VALUES ('6ffcd8cf12a047df9616bdc187b82e0d','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/boneBox/contrib/geometry/LOD2/geometry_LOD2.usda','993f2365ed5446068f9eb0e6c21a8e9c',NULL,'07_oxvgQkzJCTDvcBcJfUkILSzqzEQaT',NULL);
INSERT INTO `library_sublayer` VALUES ('7006246dafdd4d2faeb9a6065e56c2e5','03.00.00','thumb.png','usd-asset-versions-dump/2024-assets-acquisition/flatTeapot/thumb.png','3d283193f6b54cf0a233a5b83ed95819',NULL,'DyIPUuukQw19C4krG0glkcoibbtWqyuP',NULL);
INSERT INTO `library_sublayer` VALUES ('7018fb48f73d475c8888428b49f491f9','03.00.00','beegCrab.fbx','usd-asset-versions-dump/2025-assets-03.00.00/beegCrab/beegCrab.fbx','f175fbe4933944a69d06e86c906622d6',NULL,'vMprp2Pax_bsCX3H0GVnvBra39IoCisA',NULL);
INSERT INTO `library_sublayer` VALUES ('7045c7a0e097402aba5e5a41a0433fa2','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/lockedBox/contrib/material/material.usda','6ab7f53a7daf46a2ac8a83abcc89ecf9',NULL,'BWldZ29wex36D5Z_j9CTHa09Z3TjZNlI',NULL);
INSERT INTO `library_sublayer` VALUES ('70655e6097d44557bf2f4aadc6efbef5','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/bookStack3/contrib/material/material.usda','077caad23bd4486b8fb066bf43d04761',NULL,'pvqPKSxR1f36IA0KYVfqRbdYCfMaH_xg',NULL);
INSERT INTO `library_sublayer` VALUES ('70850c530bf94bebb2c44ff3dfed8266','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/cherryTable/contrib/geometry/bbox/geometry_bbox.usda','824b428456c148abb25d24568d649441',NULL,'NnpmCqoXsWBeq4gXXqQVjORSJZUASMMj',NULL);
INSERT INTO `library_sublayer` VALUES ('709d771ae9274ccdb62fe3869861d55c','02.00.00','parkBench_LOD2.usda','usd-asset-versions-dump/2025-assets-02.00.00/parkBench/LODs/parkBench_LOD2.usda','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'AwmiosOkht0bssiO0W09sDEPFDHB78fC',NULL);
INSERT INTO `library_sublayer` VALUES ('709f534f9ff44e23958cdd7667aaa9be','04.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/campfire/contrib/material/default/material_default.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'QM9NaQlhlwwz2e5W4nuoxX6SrStAWILg',NULL);
INSERT INTO `library_sublayer` VALUES ('70b415ac62d54711bdeff7f65a6de7af','02.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-02.00.00/teapot/thumbnail.png','f5e189a845fb4ed3930a81263a21bf99',NULL,'Rj9uBnlHGEb3.bUBSdUn0VDlQE5qaX.6',NULL);
INSERT INTO `library_sublayer` VALUES ('70e39cf40baa4a2d9f2e0f8f2a898439','04.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/skateboard/contrib/geometry/LOD0/geometry_LOD0.usda','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'CkI1mMXceWCWmoH89yW40TX2IP_QQ7CO',NULL);
INSERT INTO `library_sublayer` VALUES ('71529c397b1549a3b3402d92e5c2329c','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/cherryTable/contrib/geometry/LOD1/geometry_LOD1.usda','824b428456c148abb25d24568d649441',NULL,'Anx.mE6R.aQdDB7cbXJ7MzgCOlXSmixM',NULL);
INSERT INTO `library_sublayer` VALUES ('71787486ea5248b49e090e43e427afa8','02.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-02.00.00/beegCrab/thumbnail.png','f175fbe4933944a69d06e86c906622d6',NULL,'1md7LBNpJ6qFffLmcsMJYvzYod2m.GNA',NULL);
INSERT INTO `library_sublayer` VALUES ('718cd2dbb06947e984f890d17fa787f2','01.00.00','candleGroup.usda','cis-7000-usd-assets-versioned/Assets/candleGroup/candleGroup.usda','a1513d5dbdf7478aab3b4d659a3f5e74',NULL,'OgJa9x8Sz5nsrLI.AiecIBFL_KRHoHRo',NULL);
INSERT INTO `library_sublayer` VALUES ('71ed1f12d82d49b88a7d466edacc9126','06.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/kitchenaid/contrib/material/material.usda','66b74b32abd8459cbe41f434285a7691',NULL,'w6y0bBHTUQTJfRIcy3l16XUROL_92u87',NULL);
INSERT INTO `library_sublayer` VALUES ('7214c72306f3490ca11d5af38d875c8a','01.00.00','horns.glb','cis-7000-usd-assets-versioned/Assets/horns/contrib/.cache/horns.glb','c21bb4bc82c74bf08857cc21bac2f3b4',NULL,'QwLzwlW9Nrf.Bhe.3gKXpsfSREpIf3g5',NULL);
INSERT INTO `library_sublayer` VALUES ('7249a4225c1a45a381ada0c764745a81','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/bookshelf2/contrib/geometry/LOD2/geometry_LOD2.usda','39ab42636a0747ffa50446bcf4f57980',NULL,'G8EwugOieiGYs5ZPJ8NDBrTa867bLXoE',NULL);
INSERT INTO `library_sublayer` VALUES ('72a760469da54d5594ed0e3a2314a565','04.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/pickleBarrels/contrib/geometry/LOD2/geometry_LOD2.usda','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'lBq_LA9aj1ROHqfFVILvu3D901NNmBHx',NULL);
INSERT INTO `library_sublayer` VALUES ('72df0eb8d4f74e49b414d5d277b15a21','05.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/mug/contrib/geometry/LOD1/geometry_LOD1.usda','5bac6ed09efe4816b7c427ffb08c599d',NULL,'R0V_Y.agdsFBDJkVD4Dx1iuOVfCudZaQ',NULL);
INSERT INTO `library_sublayer` VALUES ('72fa8062630245fba798fa5f4f0cba00','05.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/penTablet/contrib/material/material.usda','db17d0c2030049769e1ba2ea54d86114',NULL,'86L2vj0_3Y8.wXC3cAptzAnq.0f2pRZP',NULL);
INSERT INTO `library_sublayer` VALUES ('736612ecc56d44859033ca9b073b69f7','05.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/woodenChair/contrib/geometry/geometry.usda','b7d69121f36340adbdb7bed776c42a8d',NULL,'b_C8gYtGVulWzlpD83UsotsaoUyR5M8E',NULL);
INSERT INTO `library_sublayer` VALUES ('73c230f901c8448a80775e5218cde973','01.00.00','goPieceJar.glb','cis-7000-usd-assets-versioned/Assets/goPieceJar/contrib/.cache/goPieceJar.glb','65cb65e774ab4a4795d18ff514a071d9',NULL,'c0O6ya2wfZ__XjJ6rEKhS_w9EkRcBsJA',NULL);
INSERT INTO `library_sublayer` VALUES ('73ce18bfc6ab4a64a4e2799e2d4a0e0c','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/glassCauldron/contrib/geometry/LOD1/geometry_LOD1.usda','427b041b429f4dffb526ee677a936f12',NULL,'8RE0XbR9piU_9k1wGmmxbw3cnZsO8UG3',NULL);
INSERT INTO `library_sublayer` VALUES ('73f63871e97749bab044e0757f3b0de7','05.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/penTablet/contrib/geometry/LOD2/geometry_LOD2.usda','db17d0c2030049769e1ba2ea54d86114',NULL,'cdXU2NbMYsXvK3GABQxYmI525elxVz.L',NULL);
INSERT INTO `library_sublayer` VALUES ('744f01e6b30246b2927c572815c34f49','05.00.00','oldTelevision.usd','cis-7000-usd-assets-versioned/Assets/oldTelevision/oldTelevision.usd','b6234f0922c94798ba12257342157faa',NULL,'6ZgIv3YZwT5r_IJaDR_U03Hl7BSgSYuj',NULL);
INSERT INTO `library_sublayer` VALUES ('747745e67b8a4cd1936ec4b40f6de41c','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/leafyVegetation/contrib/geometry/LOD1/geometry_LOD1.usda','bc9563cab790436abc6180a53087ad1a',NULL,'LqAtEe.NJM05pR1c.oIxlYQd60hMoprm',NULL);
INSERT INTO `library_sublayer` VALUES ('74d099b11dc04897a13c546096f3fdf5','01.00.00','inkBottle.glb','cis-7000-usd-assets-versioned/Assets/inkBottle/contrib/.cache/inkBottle.glb','ba022dd31fd0446a907529c711cea63f',NULL,'eodxXfXEgy8MtEMNLLmpsn7KBFQB9Of2',NULL);
INSERT INTO `library_sublayer` VALUES ('74d5423e468c4d70a8d3bed317389a41','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/horns/contrib/geometry/geometry.usda','c21bb4bc82c74bf08857cc21bac2f3b4',NULL,'s8d74e.lGHaH2CaazSK63M7_ACSpK_3c',NULL);
INSERT INTO `library_sublayer` VALUES ('74f347db7aad47bfa905525b2944147a','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/bustWearingHat/contrib/material/default/texture/default.png','a94d3ddac1e64aff86cf5a194c50d8bf',NULL,'bMMUElbA7qbAtrxjxBiz4hvMx4RZ5TMm',NULL);
INSERT INTO `library_sublayer` VALUES ('753952387aa34465be163b801fd853b7','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/oakTable/contrib/geometry/LOD1/geometry_LOD1.usda','3dfa350b0a294d7c9f1b419180d71748',NULL,'49y_gTKpPv5M_MFzQl4PZ7ldGH0e5xB0',NULL);
INSERT INTO `library_sublayer` VALUES ('7545d997957b4ef2b2665314e7b61bee','05.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/woodenChair/contrib/geometry/bbox/geometry_bbox.usda','b7d69121f36340adbdb7bed776c42a8d',NULL,'vQEm1elBEG9JSzvswLCsz.cBSgZvuuLK',NULL);
INSERT INTO `library_sublayer` VALUES ('75a35af5505c43508e455438e13bf716','04.00.00','sushi.usda','usd-asset-versions-dump/2024-assets-acquisition/sushi/sushi.usda','2c7ef29f88474ded95eb449ebb264ead',NULL,'zFMXjPWCMgH52vJNKXcDDd6OfMsuMxqw',NULL);
INSERT INTO `library_sublayer` VALUES ('75ca0da1c74b49efab40cf7b3d586cd8','04.00.00','mug_material.usda','usd-asset-versions-dump/2024-assets-acquisition/mug/mug_material.usda','5bac6ed09efe4816b7c427ffb08c599d',NULL,'E1SzjZIEGzCOUq0blO.3Q2Ox3BhBoWAI',NULL);
INSERT INTO `library_sublayer` VALUES ('75fca4590d5f4d9d9c93f24fb8f8f6d0','03.00.00','teapot.usda','usd-asset-versions-dump/2024-assets-acquisition/flatTeapot/teapot.usda','3d283193f6b54cf0a233a5b83ed95819',NULL,'QZuPOyuoi_5elHfbzo4W_cwo0GVpWXZ1',NULL);
INSERT INTO `library_sublayer` VALUES ('7677b517c7f54af19fafe6fd921e8f0c','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/cashRegister/contrib/geometry/geometry.usda','ca9ae1e89e6145bea24272531dcfbe27',NULL,'3_iQK98eqC0mnU87v3Dgx5JCtRibj6Y0',NULL);
INSERT INTO `library_sublayer` VALUES ('76c7fd9fc26d48b9b1686fee0181e667','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/largeInkBottle/contrib/geometry/LOD0/geometry_LOD0.usda','3eebe2a320dd4f10b98542d62deec15a',NULL,'vAihgsQaJE2.gWmJ1GkdwwMvW6QUbDq5',NULL);
INSERT INTO `library_sublayer` VALUES ('76cd88acaf9f45e783c9a87a94b4c34f','02.00.00','beegCrab_LOD2.usda','usd-asset-versions-dump/2025-assets-02.00.00/beegCrab/LODs/beegCrab_LOD2.usda','f175fbe4933944a69d06e86c906622d6',NULL,'5LoBIg_h.KMkBzK0dMVYA_RHzjTrRzxb',NULL);
INSERT INTO `library_sublayer` VALUES ('7720fc5de79f443b9c300a8b9b8e40db','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/medicineBottle/contrib/geometry/LOD1/geometry_LOD1.usda','8deb7dd1667c428b89933de25c02e4ce',NULL,'CET9Np.uIJsgA4gD1z05S6wCVa_iu8us',NULL);
INSERT INTO `library_sublayer` VALUES ('77555e9735eb403c98fe191900c2b930','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/inkBottle/contrib/geometry/bbox/geometry_bbox.usda','ba022dd31fd0446a907529c711cea63f',NULL,'ELyNRhqI.vtDHx3apA5AESdlmbnZyKg1',NULL);
INSERT INTO `library_sublayer` VALUES ('77632510dbf640bdac036c7c42cb8401','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/bookStack3/contrib/geometry/LOD2/geometry_LOD2.usda','077caad23bd4486b8fb066bf43d04761',NULL,'71VauopwzcXMNDpgne081Zj8pbKa8683',NULL);
INSERT INTO `library_sublayer` VALUES ('77f0ebe8af5b4dceb3f5ce56d5e612ae','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/orangePillow/contrib/geometry/LOD2/geometry_LOD2.usda','5c179fdb44924eba8a42c0948766ca62',NULL,'ZbileqfoztoidkEqzobdlKf7m_kenLgU',NULL);
INSERT INTO `library_sublayer` VALUES ('7846c0440564483ab3c6b673468e0039','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/goPieceJar/contrib/geometry/geometry.usda','65cb65e774ab4a4795d18ff514a071d9',NULL,'i6GC4aax5jN0Bx3eRBvg7K07zVQvTGTr',NULL);
INSERT INTO `library_sublayer` VALUES ('78a316a678394efdb50afc2546c2c12a','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/goPieceJar/contrib/material/default/texture/default.png','65cb65e774ab4a4795d18ff514a071d9',NULL,'BP0VqK6Gtw9XcDAhXNV4cP5MzhDwZj_O',NULL);
INSERT INTO `library_sublayer` VALUES ('78f7b23515064cebb2b0216090015b9a','05.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/oldTelevision/contrib/material/material.usda','b6234f0922c94798ba12257342157faa',NULL,'3vIwKpqU4GanjyBIypHy8VAVMPR81xfR',NULL);
INSERT INTO `library_sublayer` VALUES ('790f31826ec347ac8afb0c40ade65431','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/largeInkBottle/contrib/geometry/bbox/geometry_bbox.usda','3eebe2a320dd4f10b98542d62deec15a',NULL,'RH4cpLQD2J.HYnzQ0wwBIWc5VPpG2qJQ',NULL);
INSERT INTO `library_sublayer` VALUES ('793145b95211489da1bb327fdac69401','01.00.00','asianGoldPieceContainer.glb','cis-7000-usd-assets-versioned/Assets/asianGoldPieceContainer/contrib/.cache/asianGoldPieceContainer.glb','a8e9675b3e2a4a63b73c6d1fd34ca0e0',NULL,'lLJCIGKdHt9wYnjfUQPAbXhM4O1Q6YsW',NULL);
INSERT INTO `library_sublayer` VALUES ('795b798e3f294e3aaf47a35090d75ade','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/makeupContainers/contrib/material/default/texture/default.png','6bc90b076ae74ab9842a07913f22e681',NULL,'HeQxHqMJxyugWQow6h8W4tyZBnzTVHYz',NULL);
INSERT INTO `library_sublayer` VALUES ('796bd0a32844475e8f1837d3ac9f4633','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/foxHandRight/contrib/geometry/LOD2/geometry_LOD2.usda','e1dc4b9960364ffba02431380e01df0f',NULL,'ckh_j99Pi.7QrnDN2OA35yi6H8xFAIai',NULL);
INSERT INTO `library_sublayer` VALUES ('797baeac95b54dce8abe86b76c82c6a9','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/horns/contrib/geometry/bbox/geometry_bbox.usda','c21bb4bc82c74bf08857cc21bac2f3b4',NULL,'eIKOAGeJNHpvPGzShx9JUl8AbxRVyo_I',NULL);
INSERT INTO `library_sublayer` VALUES ('79876a66a31c405ea57f91611117dd0f','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/bookStack4/contrib/material/default/material_default.usda','f1d3b419b0444e58a2e45fe157647464',NULL,'so_C8XKmG8ZWyc2oH0GQ688ugDyAk2BP',NULL);
INSERT INTO `library_sublayer` VALUES ('79d05ef40e53422aafb23322a00fc804','01.00.00','cartoonFish.fbx','usd-asset-versions-dump/2025-assets-01.00.00/cartoonFish/cartoonFish.fbx','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'BAFTl2ajaRRhnX2X5TXk6bTsfBXocUp3',NULL);
INSERT INTO `library_sublayer` VALUES ('79de4d86a88140d98b976519b5cadd00','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/logSteps/contrib/material/default/material_default.usda','bcb688a70758427fbb7e23d1ed9d756e',NULL,'spPXBDlkdTKPscuIBKdcRDzg2u5QwdZM',NULL);
INSERT INTO `library_sublayer` VALUES ('7a36ddc45e8f4a89b68ca2fe2bdab9fa','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/barrel/contrib/.thumbs/thumbnail.png','21ff4cfc83b0435a91b2404af9477d51',NULL,'wYLPPWO5R4q_avORsDjwCp4Essk7LZ89',NULL);
INSERT INTO `library_sublayer` VALUES ('7a70b05cda424b3c80236cc1a88c160e','01.00.00','hangingGinger.usda','cis-7000-usd-assets-versioned/Assets/hangingGinger/hangingGinger.usda','7b333698a6b74e45a24e2e642b55d1dd',NULL,'l47BXDJIe3F1zv9_fXjt3i_68V6HKKox',NULL);
INSERT INTO `library_sublayer` VALUES ('7a8dcc4549c34975bf7e63168f4c5ec9','01.00.00','barrel.usda','cis-7000-usd-assets-versioned/Assets/barrel/barrel.usda','21ff4cfc83b0435a91b2404af9477d51',NULL,'7O69U6ZMhFx21VD0QhKTjHDNfLxVG4E9',NULL);
INSERT INTO `library_sublayer` VALUES ('7a976f5b51a448ffb19fc3c5a68a0107','01.00.00','makeupContainers.usda','cis-7000-usd-assets-versioned/Assets/makeupContainers/makeupContainers.usda','6bc90b076ae74ab9842a07913f22e681',NULL,'RsYkTvR8X9PU8AmaYfabI.Exm4x4pPNB',NULL);
INSERT INTO `library_sublayer` VALUES ('7ab296be64d54c87ae23ed5e0881af71','05.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/penTablet/contrib/geometry/LOD1/geometry_LOD1.usda','db17d0c2030049769e1ba2ea54d86114',NULL,'VwSQ4CW.bvBkN.XoHf3stIv6oR9AYLe6',NULL);
INSERT INTO `library_sublayer` VALUES ('7aded2453d7a4d9db35a04deb9baec85','04.00.00','woodenChairLOD2.usda','usd-asset-versions-dump/2024-assets-acquisition/woodenChair/woodenChairLOD2.usda','b7d69121f36340adbdb7bed776c42a8d',NULL,'yXYH5.1t45hsTfPdPsMo7kjPg4Ca_8MU',NULL);
INSERT INTO `library_sublayer` VALUES ('7b6f30c6564744658f34f5398766e5c5','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/leafyVegetation/contrib/material/material.usda','bc9563cab790436abc6180a53087ad1a',NULL,'3eQMlSUKNYFYmBwvKg39kCl48kMYaffp',NULL);
INSERT INTO `library_sublayer` VALUES ('7b9d93d0ff3b49c1b247ce2f192648c2','03.00.00','skateboard_LOD0.usda','usd-asset-versions-dump/2025-assets-03.00.00/skateboard/LODs/skateboard_LOD0.usda','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'5ZAzqm.M6SVTzB2P_EmbbdnlMXQQsptP',NULL);
INSERT INTO `library_sublayer` VALUES ('7bcc3f20bad140c08e7240bb3d4b37cd','06.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/kitchenaid/contrib/geometry/LOD2/geometry_LOD2.usda','66b74b32abd8459cbe41f434285a7691',NULL,'LinjiVp6BlTdk0nlmCbIE9rvFZAjJAwn',NULL);
INSERT INTO `library_sublayer` VALUES ('7c2f5164a40542f68fca1687595c325a','05.00.00','default.png','cis-7000-usd-assets-versioned/Assets/wineGlass/contrib/material/default/texture/default.png','31c39c346b394a1f90cf0a00f1c4a6ef',NULL,'6oTmJUclKJBvFbBHTlGyFAAwsPiKFg5c',NULL);
INSERT INTO `library_sublayer` VALUES ('7ca1bff0650a47cf93fb9cf8860d248e','01.00.00','bookshelf3.usda','cis-7000-usd-assets-versioned/Assets/bookshelf3/bookshelf3.usda','fa5e37ee437e45acb2ae0c3c9c725b83',NULL,'4i9FBi_Hs_YEqISS50666n7xlDDPBq0r',NULL);
INSERT INTO `library_sublayer` VALUES ('7cd0f2815a714b9bb3b11b4c55c0f15a','03.00.00','beegCrab_LOD1.usda','usd-asset-versions-dump/2025-assets-03.00.00/beegCrab/LODs/beegCrab_LOD1.usda','f175fbe4933944a69d06e86c906622d6',NULL,'cvnv1JNjmZFf2u65oeai_cFOBC7oUDpH',NULL);
INSERT INTO `library_sublayer` VALUES ('7d0c6c72883d429795e7c42a54e557bc','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/foxHandRight/contrib/material/material.usda','e1dc4b9960364ffba02431380e01df0f',NULL,'ZFqrerspPLzO_sWXVFjgz2iTLKb4Pv6E',NULL);
INSERT INTO `library_sublayer` VALUES ('7d24f6a7290442d399b0782928fb25e1','03.00.00','sittingMoomin_LOD2.usda','usd-asset-versions-dump/2025-assets-03.00.00/sittingMoomin/LODs/sittingMoomin_LOD2.usda','c0e55d851ea64aa4aeec27c29594a555',NULL,'79Jj.jnoUi8l0LGYneQNCwjPvQCJ9F3a',NULL);
INSERT INTO `library_sublayer` VALUES ('7d29112ac82c4b3d81b72cc05c71422f','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/alchemistRoomWalls/contrib/geometry/LOD2/geometry_LOD2.usda','ed516f0180c84489b7cd35f892c8e438',NULL,'m8jCdAofTcakQ5v3PWS8pzAO0bXg8sAd',NULL);
INSERT INTO `library_sublayer` VALUES ('7d2c77e43b1549a8bc2b554e3086334b','02.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-02.00.00/pickleBarrels/thumbnail.png','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'XHTIyPTAcqLPGZIxA9mHOcgfDPpDzjoz',NULL);
INSERT INTO `library_sublayer` VALUES ('7d6aeb27099840c0b6551ce3cfed9373','05.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/campfire/contrib/geometry/LOD1/geometry_LOD1.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'dCXmrtc7UhuyLrrp9h5s0Vo5IRFpicKv',NULL);
INSERT INTO `library_sublayer` VALUES ('7dc4f439009e4176bc7399ed387071ce','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/jelloShelf/contrib/geometry/bbox/geometry_bbox.usda','99f5e6f9675b41ed91e76daebb016c4a',NULL,'gcU.L8cSvZrr9MoyUsLBn43BF1SNttUO',NULL);
INSERT INTO `library_sublayer` VALUES ('7e81c25ef2014af48269eb04ad798557','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/elavatedLogPlatform/contrib/geometry/LOD1/geometry_LOD1.usda','a69b43a2c8ba44a499e7f698f736e60b',NULL,'69a.37XLZaEave9yBsXk498LNu6U70v9',NULL);
INSERT INTO `library_sublayer` VALUES ('7eb4453922c946c8b6b67dd53a05bbfd','01.00.00','bookStack2.usda','cis-7000-usd-assets-versioned/Assets/bookStack2/bookStack2.usda','76e5d476ecc44eeea6da09806954f8bd',NULL,'j3zdBL1mXERm6Y9zPmKkTQUUX_xlXQmB',NULL);
INSERT INTO `library_sublayer` VALUES ('7eb8b48fabea43949f5cab187ff8c668','04.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/parkBench/contrib/geometry/bbox/geometry_bbox.usda','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'r6e5.wYJFjp8yxVOOffUx3WdqNgVZ9D9',NULL);
INSERT INTO `library_sublayer` VALUES ('7ec888888f4c451885a15e33a9e0d9f6','04.00.00','oldTelevision_material.usda','usd-asset-versions-dump/2024-assets-acquisition/oldTelevision/oldTelevision_material.usda','b6234f0922c94798ba12257342157faa',NULL,'5IfD4h3AhS9Jx5eokHDZbvcV8Gt7h.Oc',NULL);
INSERT INTO `library_sublayer` VALUES ('7f14b54340c1445aad738a44f9e79bf6','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/makeupJar/contrib/material/material.usda','313b0aae14664f14b656d4d17478fbc3',NULL,'D5LnKQTJ.wBrGDKRiKcc_TQJEOwu3GwG',NULL);
INSERT INTO `library_sublayer` VALUES ('7f1c9cb63ba0449aa6783d4599308e22','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/drinkingHorns/contrib/.thumbs/thumbnail.png','c5f39a998aec42cc8396f2ff23cbb375',NULL,'LSLBmcDmQlmbBchj_Pgb.H0i0MBT_ghR',NULL);
INSERT INTO `library_sublayer` VALUES ('7f1cc6683c054558a5e49a44738e87cc','04.00.00','paniniPress.ma','usd-asset-versions-dump/2024-assets-acquisition/paniniPress/paniniPress.ma','3dcf8a1dac8242a59f83c50df682fb69',NULL,'drmy673dq1._pjT5DyX5CRLcHw3aiTsx',NULL);
INSERT INTO `library_sublayer` VALUES ('7f9e60d87ece4aed978749a3f0e379f2','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/ladle/contrib/material/material.usda','89dbc25b1e554c6eae3212cc3e28850c',NULL,'pKOu1dNcroGQtvk34h6Cjvml_tKJj0yT',NULL);
INSERT INTO `library_sublayer` VALUES ('7fc3e80480b942d0b0fda2a4b48ef985','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/largePottedPlant/contrib/geometry/LOD2/geometry_LOD2.usda','cc9847c9e64a4341bd8287edf73afe04',NULL,'7Ej75O6wyGK8Hz6DO00z_TuOpLiXspq7',NULL);
INSERT INTO `library_sublayer` VALUES ('800a488cd52c4b5db24bfce17fc35010','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/cashRegister/contrib/material/material.usda','ca9ae1e89e6145bea24272531dcfbe27',NULL,'eJfQJ0145xIeygey23NHA9KLgLPE4r.h',NULL);
INSERT INTO `library_sublayer` VALUES ('80cde3c1b2da4ca7a485ee1f04faf1fc','04.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/beegCrab/contrib/geometry/LOD2/geometry_LOD2.usda','f175fbe4933944a69d06e86c906622d6',NULL,'nfMULotFHtVcpGR03DGVEWVQ.eEAobT8',NULL);
INSERT INTO `library_sublayer` VALUES ('80f7589f112149b7907301bb9181182d','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/cappedJar/contrib/material/default/material_default.usda','449fe9fdd5434b03ae7f5bc021402fbf',NULL,'71Rg.x77pnObQUsekwYDIDMl974ZkMNl',NULL);
INSERT INTO `library_sublayer` VALUES ('80f9773ec161479185729f73e37f64df','01.00.00','orangePillow.usda','cis-7000-usd-assets-versioned/Assets/orangePillow/orangePillow.usda','5c179fdb44924eba8a42c0948766ca62',NULL,'tTZxCD65JhYTnxqe.wCD1UfwYqDtctmx',NULL);
INSERT INTO `library_sublayer` VALUES ('810d7114013a45feb7c31bd065202ffe','02.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-02.00.00/yugiohClockArc/thumbnail.png','4be817e19e11426ebeede52145732e77',NULL,'9iuILJr0yZ6ffKnWJv_Xa4iGItzQAeyd',NULL);
INSERT INTO `library_sublayer` VALUES ('8111364485c6419ea730a211f63aa372','02.00.00','skateboard.fbx','usd-asset-versions-dump/2025-assets-02.00.00/skateboard/skateboard.fbx','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'3E0m1d7Wlb9j4gE551dQ2GEwXOp69Muh',NULL);
INSERT INTO `library_sublayer` VALUES ('8118bb0a4d454b29ba10ad309ce039c6','02.00.00','teapot_LOD1.usda','usd-asset-versions-dump/2025-assets-02.00.00/teapot/LODs/teapot_LOD1.usda','f5e189a845fb4ed3930a81263a21bf99',NULL,'bF8puhzEk3w4RTpoeVXjghOXF7kCTfDs',NULL);
INSERT INTO `library_sublayer` VALUES ('81337c5a3a0e4a738b6181b167c117f5','04.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/cafeTable/contrib/.thumbs/thumbnail.png','579fe0bad3f84b7babc143ab2952234e',NULL,'Bwjj3Dm9xLPo42dmq7cQjQ7J9QHHGcpK',NULL);
INSERT INTO `library_sublayer` VALUES ('814cb1717e29440bbbb53e09db836074','04.00.00','vintageLamp.usda','usd-asset-versions-dump/2025-assets-03.00.00/vintageLamp/vintageLamp.usda','c4449799e71a4ce88999ea44a86e067b',NULL,'JDMi6mpkIW.zKC3fMJYQk3nh9jY4I4yy',NULL);
INSERT INTO `library_sublayer` VALUES ('81a0f30e1d7b4fba81d61fe5b3a01fad','02.00.00','parkBench.fbx','usd-asset-versions-dump/2025-assets-02.00.00/parkBench/parkBench.fbx','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'3fyJ8jhQzsDDWRSf90FYEyOcEHjVZcAX',NULL);
INSERT INTO `library_sublayer` VALUES ('827281040c5144e2900998b72fcc44c7','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/orangePillow/contrib/geometry/bbox/geometry_bbox.usda','5c179fdb44924eba8a42c0948766ca62',NULL,'dTh_Tv1OFhEzuPnKOvvinxXdRY5dCpSM',NULL);
INSERT INTO `library_sublayer` VALUES ('8273657b4be2496f9ba3e2400838a1ba','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/boneBox/contrib/material/default/texture/default.png','993f2365ed5446068f9eb0e6c21a8e9c',NULL,'yR1dGaXnsGfnro7qe2WuFjUXEKeZtqNC',NULL);
INSERT INTO `library_sublayer` VALUES ('8298a8a4af8f44219b1f73513f3f6c1c','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/largeInkBottle/contrib/.thumbs/thumbnail.png','3eebe2a320dd4f10b98542d62deec15a',NULL,'.T9Kp.vtXBX2lNdWmscQb.0UoXlzuP2P',NULL);
INSERT INTO `library_sublayer` VALUES ('82a4cc54f2f6426f9ad5fe397c82332f','01.00.00','bookshelf1.glb','cis-7000-usd-assets-versioned/Assets/bookshelf1/contrib/.cache/bookshelf1.glb','f3a014272b104716a4e1296a4dcf4404',NULL,'h_w1tr2PZ5RSRxxm7ymqolSpEF4V9j7G',NULL);
INSERT INTO `library_sublayer` VALUES ('82aa28c4b2e24da1a25e995f6df92f92','04.00.00','cafeTable.usd','cis-7000-usd-assets-versioned/Assets/cafeTable/cafeTable.usd','579fe0bad3f84b7babc143ab2952234e',NULL,'JjbiU8bZcXPGEMivhU1iOLOVVnE8VHGl',NULL);
INSERT INTO `library_sublayer` VALUES ('82c107b0a928432d986841c4163543cf','02.00.00','teapot.fbx','usd-asset-versions-dump/2025-assets-02.00.00/teapot/teapot.fbx','f5e189a845fb4ed3930a81263a21bf99',NULL,'SGvgQwzrGTG96aD3la9BYZ48lQP01ROG',NULL);
INSERT INTO `library_sublayer` VALUES ('82d7675c6c654d0fb2aeee6f5adf4eda','06.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/kitchenaid/contrib/geometry/LOD0/geometry_LOD0.usda','66b74b32abd8459cbe41f434285a7691',NULL,'wYyncNex63ldzuDwESBQx0MMOdn163sb',NULL);
INSERT INTO `library_sublayer` VALUES ('8365539bf6f5449b92c3e4f8afa39366','02.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-02.00.00/sittingMoomin/thumbnail.png','c0e55d851ea64aa4aeec27c29594a555',NULL,'DGTMQ_jjH4p3BLybHMgI6RXRqpWkd9JN',NULL);
INSERT INTO `library_sublayer` VALUES ('838901e5fd3c44b9ae632990f5122dc2','05.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/vintageLamp/contrib/geometry/geometry.usda','c4449799e71a4ce88999ea44a86e067b',NULL,'D..gKGvOX4AxQL6q.ZfeHGnvw7auO82w',NULL);
INSERT INTO `library_sublayer` VALUES ('8391c408185c4b4ab64dbe3699844e66','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/barrel/contrib/material/material.usda','21ff4cfc83b0435a91b2404af9477d51',NULL,'awPN7ncLvnr07.63cOQ9WUSxudWd8AIV',NULL);
INSERT INTO `library_sublayer` VALUES ('845ed7ac72f64ccd8fb1c3a3b37b9845','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/bustWearingHat/contrib/geometry/LOD2/geometry_LOD2.usda','a94d3ddac1e64aff86cf5a194c50d8bf',NULL,'9YB.Xz_MW8Bpt.2ZZkl7oHGpjpYzeTHf',NULL);
INSERT INTO `library_sublayer` VALUES ('8466a1e23e2c459cbca9c8b62ab0255b','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/alchemistRoomWalls/contrib/material/default/texture/default.png','ed516f0180c84489b7cd35f892c8e438',NULL,'wF.myWsDO55Hvnwvq1cRR1qiwKH.E.uX',NULL);
INSERT INTO `library_sublayer` VALUES ('8482628580214c3e98ccdd3f0eced6a9','01.00.00','cappedJar.glb','cis-7000-usd-assets-versioned/Assets/cappedJar/contrib/.cache/cappedJar.glb','449fe9fdd5434b03ae7f5bc021402fbf',NULL,'3IEa_lA5EBbrGt5NKVO8b_IxBijlJQIQ',NULL);
INSERT INTO `library_sublayer` VALUES ('849cd44d6b6e4f66b5f9db86df328e58','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/bulbousInkJar/contrib/material/material.usda','d9782679927741a6b9b9449b3054ff77',NULL,'DNm3bB3UgbV6dnIvQjt4CDHNAqy1tI0c',NULL);
INSERT INTO `library_sublayer` VALUES ('84b703229b444b99b3b692b047d2f662','01.00.00','orangePillow.glb','cis-7000-usd-assets-versioned/Assets/orangePillow/contrib/.cache/orangePillow.glb','5c179fdb44924eba8a42c0948766ca62',NULL,'rv7RdNXbEO3sNL7ECJSZnn3y7XbX..7Y',NULL);
INSERT INTO `library_sublayer` VALUES ('8564f26d5ef54ff9a8818b88cfa35bac','02.00.00','cafeTable_LOD1.usda','usd-asset-versions-dump/2025-assets-02.00.00/cafeTable/LODs/cafeTable_LOD1.usda','579fe0bad3f84b7babc143ab2952234e',NULL,'_R8chT6rJs9qUg0TCDirk86pw0OOHWF5',NULL);
INSERT INTO `library_sublayer` VALUES ('85ce0e3be20348dfb28b6a91ee857a04','04.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/cafeTable/contrib/material/material.usda','579fe0bad3f84b7babc143ab2952234e',NULL,'5_FUF0XE_UXrS1HvKXKtgCEMF3lNTy_8',NULL);
INSERT INTO `library_sublayer` VALUES ('861ce5fc35b647ada00750a4308f1ced','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/drinkingHorns/contrib/material/material.usda','c5f39a998aec42cc8396f2ff23cbb375',NULL,'7TVntb4jETKfpk4sgmeo_jVGMkxXNLyR',NULL);
INSERT INTO `library_sublayer` VALUES ('8682c633abb44f20ab5361ae5b2b03c1','03.00.00','yellowDuck_LOD1.usda','usd-asset-versions-dump/2025-assets-03.00.00/yellowDuck/LODs/yellowDuck_LOD1.usda','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'klCkoUzjLXk5IiH5DSb7GwwEsuos.EYZ',NULL);
INSERT INTO `library_sublayer` VALUES ('86e84a5d469246e98ece455c56998315','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/makeupJar/contrib/geometry/LOD2/geometry_LOD2.usda','313b0aae14664f14b656d4d17478fbc3',NULL,'jwUjD1fyGRBeiACcb.kh_e9rzQpkTRk4',NULL);
INSERT INTO `library_sublayer` VALUES ('8746c1e9d54a4c1cb16eb9dc25bc1971','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/inkBottle/contrib/material/default/texture/default.png','ba022dd31fd0446a907529c711cea63f',NULL,'iWzH.OJlehZMLQKrSe2yZZs262bH6e2f',NULL);
INSERT INTO `library_sublayer` VALUES ('8759083bf3b344e88ac1e5072482985b','03.00.00','teapot.ma','usd-asset-versions-dump/2024-assets-acquisition/flatTeapot/teapot.ma','3d283193f6b54cf0a233a5b83ed95819',NULL,'Q2zxmc0oMbJZARxhGmUgBl0CaChG9SFi',NULL);
INSERT INTO `library_sublayer` VALUES ('87745686fbad47cb848372c1466a4123','02.00.00','beegCrab_LOD0.usda','usd-asset-versions-dump/2025-assets-02.00.00/beegCrab/LODs/beegCrab_LOD0.usda','f175fbe4933944a69d06e86c906622d6',NULL,'vTWBztMckCW6iWMeCFbm_LmkKon7wNVN',NULL);
INSERT INTO `library_sublayer` VALUES ('8786ef07a8ee45239c19bfadedc664e7','05.00.00','default.png','cis-7000-usd-assets-versioned/Assets/vintageLamp/contrib/material/default/texture/default.png','c4449799e71a4ce88999ea44a86e067b',NULL,'t_gLGd1rWPpdLJuBKkegBLg0oT049qRM',NULL);
INSERT INTO `library_sublayer` VALUES ('87891c38edab486aa234eb9d5a5c9d1e','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/alchemistRoomWalls/contrib/geometry/LOD0/geometry_LOD0.usda','ed516f0180c84489b7cd35f892c8e438',NULL,'jZ9s_w2YRRGEdpCZWYUTooVI.2ONMJrm',NULL);
INSERT INTO `library_sublayer` VALUES ('87ddf876384b4c74ab1aca32bc8a657e','04.00.00','carrotLOD2.usda','usd-asset-versions-dump/2024-assets-acquisition/carrot/carrotLOD2.usda','6188a79945fa415f906a1c6463a497eb',NULL,'_QkusVI7y0j4_GG6wjOJL5bwiZu7Qn9V',NULL);
INSERT INTO `library_sublayer` VALUES ('87ebb0d8eb734c959a2114e3e2ffe3a6','04.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/campfire/contrib/material/material.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'M6Zy5o78_XQ7HSh49wmsaKsl62zIBLdg',NULL);
INSERT INTO `library_sublayer` VALUES ('8802fef6c68841239c82a6c5ee70402a','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/doubleScrollDrawer/contrib/geometry/LOD1/geometry_LOD1.usda','d189b8bcea4e4e289d133f6fdfe25d8b',NULL,'1d2ha814HinFZf9_cA1.8sC.t5ESfVVq',NULL);
INSERT INTO `library_sublayer` VALUES ('881880e45b4848d8a0f55814f61bf8dd','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/flaredPotion/contrib/.thumbs/thumbnail.png','16fd6a411cc2475099c6b26a09175e77',NULL,'JceokBtEh_ilq48Ec_y_2YHbyLvS9INx',NULL);
INSERT INTO `library_sublayer` VALUES ('889a5d998a0441d39e07c63bd73df0e3','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/elavatedLogPlatform/contrib/geometry/bbox/geometry_bbox.usda','a69b43a2c8ba44a499e7f698f736e60b',NULL,'0Jm_KTt_ihvU6DiogoXao5dn8qHasGOq',NULL);
INSERT INTO `library_sublayer` VALUES ('88a600eabac3452a86a4050fae960ce9','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/asianGoldPieceContainer/contrib/material/default/texture/default.png','a8e9675b3e2a4a63b73c6d1fd34ca0e0',NULL,'OmvrmSSEJqwUsdS_uAbASycxAMh9XJYA',NULL);
INSERT INTO `library_sublayer` VALUES ('88ce57c27a8a402c91ca1ff7bbfb5907','02.00.00','campfire_LOD2.usda','usd-asset-versions-dump/2025-assets-02.00.00/campfire/LODs/campfire_LOD2.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'1QeiPa19a6oB1OjWkzGVVJM5WF4SRrLO',NULL);
INSERT INTO `library_sublayer` VALUES ('88cfc04eeac6499ea773b0142c983c6a','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/ladle/contrib/material/default/material_default.usda','89dbc25b1e554c6eae3212cc3e28850c',NULL,'cr7OkyUzCG0n2PFN8w7BRsQdqvB9rTUM',NULL);
INSERT INTO `library_sublayer` VALUES ('88e1ec3e6562472b966a743f3ed41457','05.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/wineGlass/contrib/geometry/LOD0/geometry_LOD0.usda','31c39c346b394a1f90cf0a00f1c4a6ef',NULL,'NnfWb5REP6SeIE.SDDWjT1cy3vVDcQMF',NULL);
INSERT INTO `library_sublayer` VALUES ('891d2195a05747828548471c4453f53e','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/bulbousInkJar/contrib/geometry/LOD0/geometry_LOD0.usda','d9782679927741a6b9b9449b3054ff77',NULL,'Gwt.o5qqPY901cPNfn.AOuUNj_.J2eXi',NULL);
INSERT INTO `library_sublayer` VALUES ('89468d67c48b4b858bffbea9372472e4','04.00.00','parkBench.usd','cis-7000-usd-assets-versioned/Assets/parkBench/parkBench.usd','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'UJ8iVsWy04Xbrf.0Gu0tpk.i8rqOJScw',NULL);
INSERT INTO `library_sublayer` VALUES ('894edf11ac264519b60197b3cf152065','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/bookStack6/contrib/geometry/LOD0/geometry_LOD0.usda','3684e1145a004e7987f06b8c071166a1',NULL,'NHtMhI6oGibUbfOLQwUNcGzta0qa35G8',NULL);
INSERT INTO `library_sublayer` VALUES ('89520d261e5c415fa55ae57fc174e698','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/bookshelf2/contrib/material/material.usda','39ab42636a0747ffa50446bcf4f57980',NULL,'wM.LAzEAXvfUiHIGkSQve2pi8YP._GnA',NULL);
INSERT INTO `library_sublayer` VALUES ('895aa3517fcc4e3abee525da715a9d97','04.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/parkBench/contrib/geometry/geometry.usda','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'QOCNqmbSlt.cVG58bdBhQfL12vdA3QBd',NULL);
INSERT INTO `library_sublayer` VALUES ('895f926d32674375a0a6010deba17629','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/leafyVegetation/contrib/material/default/material_default.usda','bc9563cab790436abc6180a53087ad1a',NULL,'ZbDkMHCaidB4tLojxWJL4BvNkH4qvxgh',NULL);
INSERT INTO `library_sublayer` VALUES ('897d12f9f09845309268dc64146ce651','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/bluePillow/contrib/geometry/LOD2/geometry_LOD2.usda','81cdcad6e58a448b8dad18e4d311b5f1',NULL,'A692WMLF.AaxSJ4mBmj5.EYIXlDt9tYM',NULL);
INSERT INTO `library_sublayer` VALUES ('8ac4caee831b4dd5b56d2cf06e1fa663','01.00.00','lockedBox.glb','cis-7000-usd-assets-versioned/Assets/lockedBox/contrib/.cache/lockedBox.glb','6ab7f53a7daf46a2ac8a83abcc89ecf9',NULL,'VdKFy_a.XipGxFTZc6xrJbfzEIwvx1pp',NULL);
INSERT INTO `library_sublayer` VALUES ('8ada07f99a8f4b4ab5007187ac9c649e','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/lantern/contrib/material/default/material_default.usda','10a15094d1dc45b7bcf8c698420b9e91',NULL,'IrgayoOd5BF8qhHD0KxaL1hLnH8xEAos',NULL);
INSERT INTO `library_sublayer` VALUES ('8b14d904f6874753a2cb6cfae3a7c076','04.00.00','thumb.png','usd-asset-versions-dump/2024-assets-acquisition/mug/thumb.png','5bac6ed09efe4816b7c427ffb08c599d',NULL,'xfxlPB6gUStB9gmUi8KzHySjmShLBr_f',NULL);
INSERT INTO `library_sublayer` VALUES ('8b4faa4abc1b4a7c83accb08a3784815','04.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/bookStack/contrib/geometry/LOD0/geometry_LOD0.usda','082f328bf76a4d48be255c620a8cd280',NULL,'3aNUc0gCIMaP_BW5SPDHiYajTxJa_MmS',NULL);
INSERT INTO `library_sublayer` VALUES ('8b54f4825ac941fe92e732317a54ffbd','03.00.00','cafeTable_LOD0.usda','usd-asset-versions-dump/2025-assets-03.00.00/cafeTable/LODs/cafeTable_LOD0.usda','579fe0bad3f84b7babc143ab2952234e',NULL,'ND4slbaiQ8REkhGmHMjy5Yw9GkfHpatH',NULL);
INSERT INTO `library_sublayer` VALUES ('8b5ea39ba3e34e49853aa894df0ade45','02.00.00','parkBench_LOD1.usda','usd-asset-versions-dump/2025-assets-02.00.00/parkBench/LODs/parkBench_LOD1.usda','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'2ghNJqkAuHJnLVLLwMcNbR1tLkd3i.7Z',NULL);
INSERT INTO `library_sublayer` VALUES ('8bbc9a62b87e498f931ffd92f4be35f9','06.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/kitchenaid/contrib/geometry/geometry.usda','66b74b32abd8459cbe41f434285a7691',NULL,'SF7AIY9up6tzsqGsLB2oCl.b6yWYWwis',NULL);
INSERT INTO `library_sublayer` VALUES ('8bfd2deaf2ea4d2a8509c9e20822672f','01.00.00','foxHandRight.usda','cis-7000-usd-assets-versioned/Assets/foxHandRight/foxHandRight.usda','e1dc4b9960364ffba02431380e01df0f',NULL,'2li1_O0y4jVnSGXfkmjK.sIVUvA4bX0V',NULL);
INSERT INTO `library_sublayer` VALUES ('8c088ae98acf42458d04681f98a84561','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/horns/contrib/material/default/texture/default.png','c21bb4bc82c74bf08857cc21bac2f3b4',NULL,'WrZCgPE8MYR7TsgoycJUSDJcWzg6Mjo8',NULL);
INSERT INTO `library_sublayer` VALUES ('8c29b09dc94f4f319766f2dadc38905f','01.00.00','campfire.fbx','usd-asset-versions-dump/2025-assets-01.00.00/campfire/campfire.fbx','6f6441599cc045ae91530ecd6cc5a81e',NULL,'CbbzMlNCn4Fa7PXBVsR3QpvK00YjwUI0',NULL);
INSERT INTO `library_sublayer` VALUES ('8c33c61d3f964f8db9c80b83f280ff2a','04.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/yellowDuck/contrib/geometry/geometry.usda','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'vrJRbW7Q_K4AtHjNQivyTtmL4XOB2kp6',NULL);
INSERT INTO `library_sublayer` VALUES ('8c90182c17914243ad64ddb51ca2c428','04.00.00','cartoonFish.usd','cis-7000-usd-assets-versioned/Assets/cartoonFish/cartoonFish.usd','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'gnxl7OrYBIKbVUPxXGCpwmwxMSLvME4h',NULL);
INSERT INTO `library_sublayer` VALUES ('8cc4b83bf5ae476d87e179c6eb24e37c','01.00.00','leafyVegetation.glb','cis-7000-usd-assets-versioned/Assets/leafyVegetation/contrib/.cache/leafyVegetation.glb','bc9563cab790436abc6180a53087ad1a',NULL,'nAPFrd14cB6UjY_.QCttXIYSySs0_EDG',NULL);
INSERT INTO `library_sublayer` VALUES ('8d15c2c51f14448cb61ed5f36c163b7a','04.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/yugiohClockArc/contrib/geometry/geometry.usda','4be817e19e11426ebeede52145732e77',NULL,'mYx1bpfrsqHHBKx8Blp8oFeFG1_k6A70',NULL);
INSERT INTO `library_sublayer` VALUES ('8d18e310648549f28c156e958e95bb7c','04.00.00','metadata.json','usd-asset-versions-dump/2025-assets-03.00.00/vintageLamp/metadata.json','c4449799e71a4ce88999ea44a86e067b',NULL,'Yl_IGYW6vm.xUxAUVStZAEIeT_qrWvD2',NULL);
INSERT INTO `library_sublayer` VALUES ('8d2db2ac14ab45aea97a3b17878212ea','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/hangingGinger/contrib/material/default/material_default.usda','7b333698a6b74e45a24e2e642b55d1dd',NULL,'3Kk2.RndA65NjeqyxdSlHuZGgs8OUQxn',NULL);
INSERT INTO `library_sublayer` VALUES ('8d7f2cb2dec14f1a808b5e39bc87c20d','06.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/kitchenaid/contrib/material/default/material_default.usda','66b74b32abd8459cbe41f434285a7691',NULL,'4eDJSqWFb2rDm0OKOTQU2ZlAUZ.AvScc',NULL);
INSERT INTO `library_sublayer` VALUES ('8da572a38a8e4fa4b21a5a2138fb05df','05.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/mug/contrib/material/default/material_default.usda','5bac6ed09efe4816b7c427ffb08c599d',NULL,'RqnCrVSiZgJyfy7taHTLFOD9NEB1v_Np',NULL);
INSERT INTO `library_sublayer` VALUES ('8dbb42a197a24925ba3af4912d06e2d6','01.00.00','asianGoldPieceContainer.usda','cis-7000-usd-assets-versioned/Assets/asianGoldPieceContainer/asianGoldPieceContainer.usda','a8e9675b3e2a4a63b73c6d1fd34ca0e0',NULL,'wRqjVnPBYaUn.HUVI1Z7RiV6CA.Go_ID',NULL);
INSERT INTO `library_sublayer` VALUES ('8dc1122614244420b56179879887edb1','05.00.00','default.png','cis-7000-usd-assets-versioned/Assets/sushi/contrib/material/default/texture/default.png','2c7ef29f88474ded95eb449ebb264ead',NULL,'Q2QdEJ02wgAuGcIln6nHCbWcW_NuPRao',NULL);
INSERT INTO `library_sublayer` VALUES ('8e3d8134253846a2963d2a537f2366da','04.00.00','metadata.json','usd-asset-versions-dump/2024-assets-acquisition/oldTelevision/metadata.json','b6234f0922c94798ba12257342157faa',NULL,'s_JE3lLeGmi1ulhNuooYi2LMnYZwWc3i',NULL);
INSERT INTO `library_sublayer` VALUES ('8e45973c25e3481580af66a572795448','04.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/beegCrab/contrib/.thumbs/thumbnail.png','f175fbe4933944a69d06e86c906622d6',NULL,'x_Ap1vGMJf1_RiQamGx8c7.2ykYI9N0O',NULL);
INSERT INTO `library_sublayer` VALUES ('8e5908f64a8041cf83f3c3b0b317a136','05.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/carrot/contrib/material/default/material_default.usda','6188a79945fa415f906a1c6463a497eb',NULL,'b3jFvpS_jyUZPCHWcvMYYP3LBRXPGUUY',NULL);
INSERT INTO `library_sublayer` VALUES ('8e7b1c69bf0e47c7a9b4571087886d43','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/ladle/contrib/geometry/LOD2/geometry_LOD2.usda','89dbc25b1e554c6eae3212cc3e28850c',NULL,'wzIulAxuOrsth_Bwpbewr14Gd78270iH',NULL);
INSERT INTO `library_sublayer` VALUES ('8ea0e9521fe5401bbbf5dc58e6a0db73','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/asianGoldPieceContainer/contrib/geometry/LOD1/geometry_LOD1.usda','a8e9675b3e2a4a63b73c6d1fd34ca0e0',NULL,'nh58aB40ZVprvjKI6nmebCcYy3cuMPqV',NULL);
INSERT INTO `library_sublayer` VALUES ('8ec2dff8f9af45f6b0825fb997bb4f93','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/lantern/contrib/material/material.usda','10a15094d1dc45b7bcf8c698420b9e91',NULL,'LIRN5zB4ce4ewslHpVZlppLXLsZmKx3Q',NULL);
INSERT INTO `library_sublayer` VALUES ('8ed167ad89b14a4d889cc2c82b601547','03.00.00','cafeTable_LOD2.usda','usd-asset-versions-dump/2025-assets-03.00.00/cafeTable/LODs/cafeTable_LOD2.usda','579fe0bad3f84b7babc143ab2952234e',NULL,'Nkc53SO4IhWrtgvLNzr2RXWsxVK6Pwnn',NULL);
INSERT INTO `library_sublayer` VALUES ('8ee13370e23b4af1aca475898a9c7ee1','05.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/penTablet/contrib/material/default/material_default.usda','db17d0c2030049769e1ba2ea54d86114',NULL,'XAIL5llKUT.KgDVesBrluR6AZQiqlS.K',NULL);
INSERT INTO `library_sublayer` VALUES ('8f22f0391652427e8425897ae53134c0','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/bookStack4/contrib/.thumbs/thumbnail.png','f1d3b419b0444e58a2e45fe157647464',NULL,'sEnsh177E3zodjJk2VF2k_XgyE_um_t4',NULL);
INSERT INTO `library_sublayer` VALUES ('8f35ab2a7b6a417696a2c5a29c70e0d5','04.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/cartoonFish/contrib/geometry/LOD2/geometry_LOD2.usda','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'9w.09T7hPuY3w8QpjUwiDTLBoaZoqtX0',NULL);
INSERT INTO `library_sublayer` VALUES ('8f732933f3eb47978bddde91b1bc848e','04.00.00','wineGlass.ma','usd-asset-versions-dump/2024-assets-acquisition/wineGlass/wineGlass.ma','31c39c346b394a1f90cf0a00f1c4a6ef',NULL,'G4FPb6emNasA0DohcnKs2q3pNOWO2Bv9',NULL);
INSERT INTO `library_sublayer` VALUES ('8f978088612a4799b46bbe997ea77612','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/bookStack6/contrib/geometry/LOD2/geometry_LOD2.usda','3684e1145a004e7987f06b8c071166a1',NULL,'zkNEBycHHkLBG7QWQru1kwpJ5KtnCGZO',NULL);
INSERT INTO `library_sublayer` VALUES ('8fc151b6e9f84884b67d5bf7ed067c74','04.00.00','oldTelevision.ma','usd-asset-versions-dump/2024-assets-acquisition/oldTelevision/oldTelevision.ma','b6234f0922c94798ba12257342157faa',NULL,'F14hUtSHyySdDLPuLMKbBtWZ9vX2Jr2w',NULL);
INSERT INTO `library_sublayer` VALUES ('8fea15aa971244d3b27f9fe0aa29ad13','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/glassJarFull/contrib/geometry/LOD2/geometry_LOD2.usda','f3e934c53fa645b881d2e227e8eafaeb',NULL,'ud8kT_6d.poWOsWaIhRzuCb3quWuuBFc',NULL);
INSERT INTO `library_sublayer` VALUES ('900ff14a4688484f871633414cb1eb33','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/cappedJar/contrib/.thumbs/thumbnail.png','449fe9fdd5434b03ae7f5bc021402fbf',NULL,'0S2WmLoI1LpimqhOaj1ByskyvlhF2Pmj',NULL);
INSERT INTO `library_sublayer` VALUES ('90324868d6694763b5098a11fa26df72','01.00.00','glassCauldron.usda','cis-7000-usd-assets-versioned/Assets/glassCauldron/glassCauldron.usda','427b041b429f4dffb526ee677a936f12',NULL,'4sn08RyqkCuP_QDI.oWaGLkA7N0ET8J2',NULL);
INSERT INTO `library_sublayer` VALUES ('90510bc520c04be4aafbf7242c8f550c','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/inkBottle/contrib/material/material.usda','ba022dd31fd0446a907529c711cea63f',NULL,'Y1tUGFK6nYDVKlVu0Ki_tZb91f7JcoSG',NULL);
INSERT INTO `library_sublayer` VALUES ('9086d4fb2b58418f8cd4924926fd1a85','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/bookStack5/contrib/geometry/geometry.usda','fa20ba6a205e4d2b951f8262bf5b2802',NULL,'JmwZGz0kbdXzrQgWxRpXTGgG4Xn98gme',NULL);
INSERT INTO `library_sublayer` VALUES ('908fc4a9475e49198e82eee6470efb68','03.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-03.00.00/sittingMoomin/thumbnail.png','c0e55d851ea64aa4aeec27c29594a555',NULL,'zaz.qLpPfjCeCZEQpaqWQ1GqwGLu0tZh',NULL);
INSERT INTO `library_sublayer` VALUES ('90b7aaa2b91e4bf697d939c7310026af','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/bookStack4/contrib/material/material.usda','f1d3b419b0444e58a2e45fe157647464',NULL,'CRSXeu3eWtpNzStGgrVOcvsgjHB6gNfI',NULL);
INSERT INTO `library_sublayer` VALUES ('910676f571c74864bf276cb7c56849fe','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/bookStack6/contrib/.thumbs/thumbnail.png','3684e1145a004e7987f06b8c071166a1',NULL,'tm6Jgc_DE.P41CGyH.58fDNBJe85yCq4',NULL);
INSERT INTO `library_sublayer` VALUES ('91844a350f6642d9b59aabb214b8cf77','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/makeupJar/contrib/geometry/geometry.usda','313b0aae14664f14b656d4d17478fbc3',NULL,'SJtQ.CVi3F4f8j_ZUsJu1tz3t2SsMJrK',NULL);
INSERT INTO `library_sublayer` VALUES ('918adab6951d49a1b6aa2e8b7559e1d8','04.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/teapot/contrib/geometry/LOD0/geometry_LOD0.usda','f5e189a845fb4ed3930a81263a21bf99',NULL,'9OfdHJK_4t4xYDmHUAeZiLBcCZ34qIu9',NULL);
INSERT INTO `library_sublayer` VALUES ('91b111b61a4749d1aaa5a94e6cc68df7','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/orangePillow/contrib/material/default/material_default.usda','5c179fdb44924eba8a42c0948766ca62',NULL,'OHYpASOAW7OcEylb9Ltpp9MWSukKpIpG',NULL);
INSERT INTO `library_sublayer` VALUES ('91bb7e3906e64dd6afbc2e128fa80eb3','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/flaredPotion/contrib/material/default/material_default.usda','16fd6a411cc2475099c6b26a09175e77',NULL,'vOManb_LyDr75vBK83nTmegqhVCXsL0R',NULL);
INSERT INTO `library_sublayer` VALUES ('91c9f3267d6942769dd281c10742f02e','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/hangingGinger/contrib/geometry/geometry.usda','7b333698a6b74e45a24e2e642b55d1dd',NULL,'SQiIejLM0Ay1pvM9W8vUDHOkl1hsoy_Y',NULL);
INSERT INTO `library_sublayer` VALUES ('922def5bc28942e395953b6c7e0db4d6','05.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/paniniPress/contrib/geometry/bbox/geometry_bbox.usda','3dcf8a1dac8242a59f83c50df682fb69',NULL,'wIy9by1jsOEhlS75g0w16fPyJC6Z02NN',NULL);
INSERT INTO `library_sublayer` VALUES ('9267639666f64f6aa4f4078ada24e43e','01.00.00','bookStack6.glb','cis-7000-usd-assets-versioned/Assets/bookStack6/contrib/.cache/bookStack6.glb','3684e1145a004e7987f06b8c071166a1',NULL,'ME.2FVcWUDjqa7IM9pvSJUk8SVqmifsV',NULL);
INSERT INTO `library_sublayer` VALUES ('92aa195abc904dacae73aba5385d175e','05.00.00','default.png','cis-7000-usd-assets-versioned/Assets/penTablet/contrib/material/default/texture/default.png','db17d0c2030049769e1ba2ea54d86114',NULL,'KKH9pVA0i0sbF93TopurrmwML79EtBKW',NULL);
INSERT INTO `library_sublayer` VALUES ('92e3dff8cfb144efabc66a4b1217ed88','04.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/skateboard/contrib/material/material.usda','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'K0oKElobGQA5N87J4V4CPPJt3tE8Byj4',NULL);
INSERT INTO `library_sublayer` VALUES ('934ef03a61e248f9a0ceb5053f70f649','05.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/woodenChair/contrib/material/material.usda','b7d69121f36340adbdb7bed776c42a8d',NULL,'_qXfy98FoJxXNZR12IWiRsMWlKRwuBdl',NULL);
INSERT INTO `library_sublayer` VALUES ('93559e2e32264ee58bc471b8617533db','04.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/campfire/contrib/geometry/geometry.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'NaM5oIcBj5mfpj89Mxnw.4ZCyb2K7xSq',NULL);
INSERT INTO `library_sublayer` VALUES ('938e84b82d9a47d7b0afda6fa91d9d10','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/jelloShelf/contrib/geometry/geometry.usda','99f5e6f9675b41ed91e76daebb016c4a',NULL,'W9rkbhiJC6b9hf2BmgwTBCgerqYW3E5D',NULL);
INSERT INTO `library_sublayer` VALUES ('93c9372108ef4070a57aeb58a96a02d7','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/glassJarFull/contrib/material/default/material_default.usda','f3e934c53fa645b881d2e227e8eafaeb',NULL,'2IX6m6YvmyNVwjcobhm41MfjM6PBTjuw',NULL);
INSERT INTO `library_sublayer` VALUES ('94781e93d5714e7ab5c9868e5c7b80b1','05.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/paniniPress/contrib/geometry/LOD0/geometry_LOD0.usda','3dcf8a1dac8242a59f83c50df682fb69',NULL,'3H9g_NzN32hNzQhBPgPZZLexSDSswcIA',NULL);
INSERT INTO `library_sublayer` VALUES ('94f331ff49824cb4904ff2cc879bd73d','05.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/paniniPress/contrib/.thumbs/thumbnail.png','3dcf8a1dac8242a59f83c50df682fb69',NULL,'lZVw5hpHi0KKhLA8IgLITmqUS98HEmG9',NULL);
INSERT INTO `library_sublayer` VALUES ('954982203ac947d7acec2e956106a7f8','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/horns/contrib/geometry/LOD0/geometry_LOD0.usda','c21bb4bc82c74bf08857cc21bac2f3b4',NULL,'jfkB7Neu9on5FCcopvEpG7bQ5MehmHn_',NULL);
INSERT INTO `library_sublayer` VALUES ('95a0e908856e4970b53e30447247c1e4','05.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/campfire/contrib/geometry/geometry.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'NTcJS_.a9jeqtV5NConNCUX9kLD4e5wT','93559e2e32264ee58bc471b8617533db');
INSERT INTO `library_sublayer` VALUES ('95ac592eeaee4c82b0782eb732aa078b','04.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/beegCrab/contrib/material/material.usda','f175fbe4933944a69d06e86c906622d6',NULL,'0GBqQzJhH9MXMNgbB0GGKL7LRRfjWDZR',NULL);
INSERT INTO `library_sublayer` VALUES ('95bc6b1a696b42b6a31e203a0c418467','05.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/paniniPress/contrib/geometry/LOD1/geometry_LOD1.usda','3dcf8a1dac8242a59f83c50df682fb69',NULL,'0ek6LRnWquI2Cn4et9nfp4z3JWb84jps',NULL);
INSERT INTO `library_sublayer` VALUES ('95f619fc86684806970cea7079f42201','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/hangingPickles/contrib/geometry/bbox/geometry_bbox.usda','aa9e8d80d09e4675915f7e5080b7b351',NULL,'Ge45pExVwwHqkaI4V0KolezXVdI4.hj9',NULL);
INSERT INTO `library_sublayer` VALUES ('95f979fcc51c4c368f5f790e8e61b3ba','04.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/beegCrab/contrib/geometry/LOD1/geometry_LOD1.usda','f175fbe4933944a69d06e86c906622d6',NULL,'K_jVvVDauZA3RWNDA4bHYhxqT4Oe7anH',NULL);
INSERT INTO `library_sublayer` VALUES ('960de8c8c5ef45369572938068673e8b','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/hangingGinger/contrib/material/material.usda','7b333698a6b74e45a24e2e642b55d1dd',NULL,'jpuDaDNHFJ0Ug1pxyfPZBCjwPLj4pUWL',NULL);
INSERT INTO `library_sublayer` VALUES ('96999c295e164bb3a2be75718d898378','05.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/woodenChair/contrib/geometry/LOD1/geometry_LOD1.usda','b7d69121f36340adbdb7bed776c42a8d',NULL,'Wsplp843AFONhm0s4I7ib8AtGNzbZldb',NULL);
INSERT INTO `library_sublayer` VALUES ('96ab7d828e51416b9f37a00c783e7e04','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/oakTable/contrib/material/default/texture/default.png','3dfa350b0a294d7c9f1b419180d71748',NULL,'Fo3hpVilqz_4Nhz0sYZ4jerpmPoHZ8DD',NULL);
INSERT INTO `library_sublayer` VALUES ('96fb386c5696425496f3ceb03f99d1f0','05.00.00','kitchenaidLOD1.usda','usd-asset-versions-dump/2024-assets-acquisition/kitchenaid/kitchenaidLOD1.usda','66b74b32abd8459cbe41f434285a7691',NULL,'FiqXjtYUy62aBWx5ZVFXEI.D83qVQF9Z',NULL);
INSERT INTO `library_sublayer` VALUES ('972f53e4f0f1482ab656694a4596acde','03.00.00','pickleBarrels_LOD1.usda','usd-asset-versions-dump/2025-assets-03.00.00/pickleBarrels/LODs/pickleBarrels_LOD1.usda','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'G.MVz5_OsJb6D8w0DuiVv_SCBTeOr.E2',NULL);
INSERT INTO `library_sublayer` VALUES ('97519d3f8e7943d68235336a593c71fb','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/bookshelf1/contrib/geometry/bbox/geometry_bbox.usda','f3a014272b104716a4e1296a4dcf4404',NULL,'F0QLbqj8zS3oiFgzGMvZac4Yyu_GL5SL',NULL);
INSERT INTO `library_sublayer` VALUES ('976802dc351549708c2ada0ef3279760','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/hangingPickles/contrib/geometry/LOD1/geometry_LOD1.usda','aa9e8d80d09e4675915f7e5080b7b351',NULL,'fmbHJlckGOS4Te_sB4gWXOWcIYuj4Wj9',NULL);
INSERT INTO `library_sublayer` VALUES ('978b6574157049239c4151d15e2f7237','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/asianGoldPieceContainer/contrib/geometry/geometry.usda','a8e9675b3e2a4a63b73c6d1fd34ca0e0',NULL,'DuRRZTaY.9.sywe0zN44qz2i08u_LmoK',NULL);
INSERT INTO `library_sublayer` VALUES ('979a1e88839c47c484ae2355620cfe51','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/lantern/contrib/geometry/geometry.usda','10a15094d1dc45b7bcf8c698420b9e91',NULL,'b3RATVgaA1mVu9llpcFQK3rGw1hPvpUq',NULL);
INSERT INTO `library_sublayer` VALUES ('984b3acf666540828101d092fb2f25df','01.00.00','makeupJar.usda','cis-7000-usd-assets-versioned/Assets/makeupJar/makeupJar.usda','313b0aae14664f14b656d4d17478fbc3',NULL,'N5nVKaWD_xYojrMWjIDIwZ71tRR4pJgK',NULL);
INSERT INTO `library_sublayer` VALUES ('987f61f760db43139772715a1f9792e3','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/boneBox/contrib/geometry/LOD0/geometry_LOD0.usda','993f2365ed5446068f9eb0e6c21a8e9c',NULL,'ayZwQ8JUsttmX2SkgZ4zDK1E0cDIDUNT',NULL);
INSERT INTO `library_sublayer` VALUES ('9896e3b87b31442098f032dfd7245ab7','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/bookStack3/contrib/material/default/material_default.usda','077caad23bd4486b8fb066bf43d04761',NULL,'Lklq1OUaxHW1in09F6LVRLgqBIbA2IdQ',NULL);
INSERT INTO `library_sublayer` VALUES ('98a9fcca05514bba88148673478fe693','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/candleGroup/contrib/.thumbs/thumbnail.png','a1513d5dbdf7478aab3b4d659a3f5e74',NULL,'BJT3zP1uN9CfZo.1ylbWDoU5Ra01KVW3',NULL);
INSERT INTO `library_sublayer` VALUES ('98c1207fed2f4674a22292b013d06282','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/cherryTable/contrib/material/default/texture/default.png','824b428456c148abb25d24568d649441',NULL,'SIqX1.jADQAvir2bvYZkNAYmJX8SiPlj',NULL);
INSERT INTO `library_sublayer` VALUES ('991541c758e4436faf2c2944e58131d2','02.00.00','cartoonFish_LOD2.usda','usd-asset-versions-dump/2025-assets-02.00.00/cartoonFish/LODs/cartoonFish_LOD2.usda','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'62w1R_t7eEgeKZ8eav9KySx1OroI.2Ql',NULL);
INSERT INTO `library_sublayer` VALUES ('99718ae126224cb68d22425dcda4613f','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/candleGroup/contrib/geometry/LOD2/geometry_LOD2.usda','a1513d5dbdf7478aab3b4d659a3f5e74',NULL,'WCdoE6r_m4M78cJCwNDb39tHldZuKy7Q',NULL);
INSERT INTO `library_sublayer` VALUES ('99b2844abae140c5b585f0ea745b01f3','02.00.00','yugiohClockArc_LOD1.usda','usd-asset-versions-dump/2025-assets-02.00.00/yugiohClockArc/LODs/yugiohClockArc_LOD1.usda','4be817e19e11426ebeede52145732e77',NULL,'y1XY4unleMcSpK_7ZjMfbuPlP031ZNzy',NULL);
INSERT INTO `library_sublayer` VALUES ('99f361b53fa64d649d6664310cdecfa9','03.00.00','metadata.json','usd-asset-versions-dump/2024-assets-acquisition/flatTeapot/metadata.json','3d283193f6b54cf0a233a5b83ed95819',NULL,'tk5SVNlS8_n4_d7QjmvGr4pNuaL9WMKY',NULL);
INSERT INTO `library_sublayer` VALUES ('99fc4d6ad9114e9dbe7cca0305acf070','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/emptyDrawer/contrib/geometry/geometry.usda','aff070bc60b647e29d302848b812f7c2',NULL,'E1WeUQRaoN1wmgGTerZ795RCV5SWS4MX',NULL);
INSERT INTO `library_sublayer` VALUES ('9a4ce3fe3fd74b22bfbb43ece5b1842d','03.00.00','metadata.json','usd-asset-versions-dump/2025-assets-03.00.00/yellowDuck/metadata.json','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'GFJEtSmDPqVRznK271uOdQyqTRhUO6B8',NULL);
INSERT INTO `library_sublayer` VALUES ('9a9f15cf776d41fe8ff51be25bf543ea','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/bluePillow/contrib/geometry/LOD0/geometry_LOD0.usda','81cdcad6e58a448b8dad18e4d311b5f1',NULL,'zzIo9Uo3HBWS2PKkYT1f3rAHjTlF5TZs',NULL);
INSERT INTO `library_sublayer` VALUES ('9aa3a975f2c547c896627f5d5660a2bb','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/oakTable/contrib/geometry/bbox/geometry_bbox.usda','3dfa350b0a294d7c9f1b419180d71748',NULL,'PqMBB5P_ZaXs6aY0Ar1PFwyXqQASDhrF',NULL);
INSERT INTO `library_sublayer` VALUES ('9acda44d7f354a1e9aff43089b9b7c8b','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/logSteps/contrib/material/material.usda','bcb688a70758427fbb7e23d1ed9d756e',NULL,'RbreY1vS74hT0Ws3L2eE2YHoaMzAV1cj',NULL);
INSERT INTO `library_sublayer` VALUES ('9aef1b1557164a6399c813c88ff311f7','01.00.00','metadata.json','usd-asset-versions-dump/2025-assets-01.00.00/campfire/metadata.json','6f6441599cc045ae91530ecd6cc5a81e',NULL,'HjnhmLkgCnaaERv1U9WRDF3b6djwrtT3',NULL);
INSERT INTO `library_sublayer` VALUES ('9afdcb35807a4cf0b8c5dc5ab6b073d9','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/boneBox/contrib/.thumbs/thumbnail.png','993f2365ed5446068f9eb0e6c21a8e9c',NULL,'I52Ftwmf.wHF_TRj67vxjBh57_h_akI5',NULL);
INSERT INTO `library_sublayer` VALUES ('9b03dfdd1120450391bdda6166c526ce','03.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-03.00.00/pickleBarrels/thumbnail.png','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'_1EnR_9mW.1DKX2An3VqL39P2fI_pr_O',NULL);
INSERT INTO `library_sublayer` VALUES ('9b2b1c5f4b2543cea59533e9a103aaf9','05.00.00','default.png','cis-7000-usd-assets-versioned/Assets/carrot/contrib/material/default/texture/default.png','6188a79945fa415f906a1c6463a497eb',NULL,'22BR.X0dqQVodlMJN.3xM_rMKpDCOuo9',NULL);
INSERT INTO `library_sublayer` VALUES ('9b4a21f2bf604e699afd17563bb2a23c','04.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/flatTeapot/contrib/material/default/material_default.usda','3d283193f6b54cf0a233a5b83ed95819',NULL,'TQzYndUpfFhiVuCyZaV0S76VvKjYEtBf',NULL);
INSERT INTO `library_sublayer` VALUES ('9b5add687523439981016b4e6d0ceedc','01.00.00','drinkingHorns.glb','cis-7000-usd-assets-versioned/Assets/drinkingHorns/contrib/.cache/drinkingHorns.glb','c5f39a998aec42cc8396f2ff23cbb375',NULL,'o2o5pRvlUFsr6bdSAx6.1.oGKNDScjCC',NULL);
INSERT INTO `library_sublayer` VALUES ('9b5e48c171ec49d4875043c1355abb99','05.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/paniniPress/contrib/geometry/geometry.usda','3dcf8a1dac8242a59f83c50df682fb69',NULL,'b0ZsQCazDgoLfqvXV.sTh6g3Zhqeuthh',NULL);
INSERT INTO `library_sublayer` VALUES ('9b90b2a5132b4a34a9ece4f68816b2ea','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/bustWearingHat/contrib/material/default/material_default.usda','a94d3ddac1e64aff86cf5a194c50d8bf',NULL,'rT2_MZHRDjC7DjuSpXiSeG9xBxeivTpM',NULL);
INSERT INTO `library_sublayer` VALUES ('9bc1704cf5c24e0097adc9bd1ca98019','04.00.00','penTabletLOD2.usda','usd-asset-versions-dump/2024-assets-acquisition/penTablet/penTabletLOD2.usda','db17d0c2030049769e1ba2ea54d86114',NULL,'D25zcQPctR8ctMFG52EHOj5w1Y94tQgr',NULL);
INSERT INTO `library_sublayer` VALUES ('9bc523569661429d9b98b5b8e92ef5f7','05.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/mug/contrib/geometry/geometry.usda','5bac6ed09efe4816b7c427ffb08c599d',NULL,'jLuwPikV3MjY1Q8GQpiZHe9IZ7sV91ce',NULL);
INSERT INTO `library_sublayer` VALUES ('9bc631313a4e48ee9a5ef582d3f18efd','02.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-02.00.00/yellowDuck/thumbnail.png','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'cQ3M0seCYPSvApz2rdWUobGkJ2a_Aiif',NULL);
INSERT INTO `library_sublayer` VALUES ('9c0fea89eda847209f62117568bb4b03','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/lockedBox/contrib/material/default/material_default.usda','6ab7f53a7daf46a2ac8a83abcc89ecf9',NULL,'vokKkjtfYBIXgVQgIRZg6.nXSD3j5XE9',NULL);
INSERT INTO `library_sublayer` VALUES ('9c19f3099c58409091bd1d47b2b5bb86','04.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/flatTeapot/contrib/geometry/LOD0/geometry_LOD0.usda','3d283193f6b54cf0a233a5b83ed95819',NULL,'0v37smDkFdIoTSdlHR2AJsDuhIXOBZti',NULL);
INSERT INTO `library_sublayer` VALUES ('9c8e74e411514008a254803fbef59caf','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/bookStack6/contrib/geometry/bbox/geometry_bbox.usda','3684e1145a004e7987f06b8c071166a1',NULL,'k.AS4O2Ac_8O8c6aOkmnJoCTPxPSAO0Z',NULL);
INSERT INTO `library_sublayer` VALUES ('9c97f55e7ba64940bd1765fcb1bd0037','04.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/flatTeapot/contrib/geometry/geometry.usda','3d283193f6b54cf0a233a5b83ed95819',NULL,'t9IslYLUgMqrc4k3G14SSWTWyEfz63Uh',NULL);
INSERT INTO `library_sublayer` VALUES ('9ccad3addfa745c8beeaaa41d951c69f','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/bookshelf3/contrib/geometry/LOD0/geometry_LOD0.usda','fa5e37ee437e45acb2ae0c3c9c725b83',NULL,'7NbMWRBii_.MeBrAdmyhGHYTjWLsA4GX',NULL);
INSERT INTO `library_sublayer` VALUES ('9d24c72f56f647159a7e4d91dd440ce3','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/makeupJar/contrib/geometry/bbox/geometry_bbox.usda','313b0aae14664f14b656d4d17478fbc3',NULL,'4b_uhXxgihZqvIgeHANrcU7AaT1KkDWz',NULL);
INSERT INTO `library_sublayer` VALUES ('9d5eacbb3e04497d9d52df5a4756ee78','04.00.00','yugiohClockArc.usd','cis-7000-usd-assets-versioned/Assets/yugiohClockArc/yugiohClockArc.usd','4be817e19e11426ebeede52145732e77',NULL,'1qHeI.BtyMJkZ47rm1WelAnrbW74hCMw',NULL);
INSERT INTO `library_sublayer` VALUES ('9dc7a61449f9433193975b11f33d5dbb','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/elavatedLogPlatform/contrib/material/default/material_default.usda','a69b43a2c8ba44a499e7f698f736e60b',NULL,'su1B6v4RXs4X.2Lhf141AnmEP8x4XRjz',NULL);
INSERT INTO `library_sublayer` VALUES ('9dd15c02bac74957a78f788873f33df0','05.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/vintageLamp/contrib/material/material.usda','c4449799e71a4ce88999ea44a86e067b',NULL,'7fTErXU.c3S7TXEuPYGWzR6pk5laSdNa',NULL);
INSERT INTO `library_sublayer` VALUES ('9dddb42036294b31a43af238dfac4a03','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/makeupContainers/contrib/material/material.usda','6bc90b076ae74ab9842a07913f22e681',NULL,'7QYzbOqYjWQgVX9LGEkxa8rOkIB4cizj',NULL);
INSERT INTO `library_sublayer` VALUES ('9e009bbc7f8841c89a28b63d12e0b9a2','04.00.00','vintageLamp.fbx','usd-asset-versions-dump/2025-assets-03.00.00/vintageLamp/vintageLamp.fbx','c4449799e71a4ce88999ea44a86e067b',NULL,'iYkYKXmHBXCn88ufZJzlDJOPq3p6n_wD',NULL);
INSERT INTO `library_sublayer` VALUES ('9e206702aa6840c3a0f680eb49a79d28','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/glassJarFull/contrib/geometry/LOD1/geometry_LOD1.usda','f3e934c53fa645b881d2e227e8eafaeb',NULL,'2PjoUqoKut7rLIddWas70Q9_FPIoCiYI',NULL);
INSERT INTO `library_sublayer` VALUES ('9e4d949a06d344d8833627b07d35a5bb','01.00.00','horns.usda','cis-7000-usd-assets-versioned/Assets/horns/horns.usda','c21bb4bc82c74bf08857cc21bac2f3b4',NULL,'gnJENHWAazjl.2ndg1qPQ_WYOL.mynuf',NULL);
INSERT INTO `library_sublayer` VALUES ('9e624709e1694ff8823fe6e80f0f55e7','04.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/yellowDuck/contrib/material/default/material_default.usda','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'XeVF_zCTaCFaQ.YJ.jXek0_hNFhwGDxh',NULL);
INSERT INTO `library_sublayer` VALUES ('9ed23bd84ce540349146a00274a64f6f','01.00.00','elavatedLogPlatform.glb','cis-7000-usd-assets-versioned/Assets/elavatedLogPlatform/contrib/.cache/elavatedLogPlatform.glb','a69b43a2c8ba44a499e7f698f736e60b',NULL,'zPAAwlKoA_WzBss_Y2CiwP5VAe7lXlcf',NULL);
INSERT INTO `library_sublayer` VALUES ('9f133b2a743547d893dddd9dcaaa8f38','05.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/carrot/contrib/.thumbs/thumbnail.png','6188a79945fa415f906a1c6463a497eb',NULL,'hl11CPYLMw.mBDdKf3HtwePXCnlXGSuu',NULL);
INSERT INTO `library_sublayer` VALUES ('9f232321c17f45498f23d5da70dbd962','05.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/carrot/contrib/geometry/geometry.usda','6188a79945fa415f906a1c6463a497eb',NULL,'zSGsZCygWKi7CAy8NOKffsVCpbj_ORRq',NULL);
INSERT INTO `library_sublayer` VALUES ('9f3fad4f9d8d425d82624ad4f4b42db7','01.00.00','brownBook.usda','cis-7000-usd-assets-versioned/Assets/brownBook/brownBook.usda','1cb7eed87f6c413b9a582792de2f2fe1',NULL,'EDOx1IRlCMzJnKuptlL1wcKTScihmSjH',NULL);
INSERT INTO `library_sublayer` VALUES ('9fab9d40bca3497184b96660b84a9e5b','03.00.00','pickleBarrels.usda','usd-asset-versions-dump/2025-assets-03.00.00/pickleBarrels/pickleBarrels.usda','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'6bcBkmIulz7rX.y4g1iJrP8kjzzouwv0',NULL);
INSERT INTO `library_sublayer` VALUES ('9fc2779a83824f1980b6324d4bb539d2','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/horns/contrib/.thumbs/thumbnail.png','c21bb4bc82c74bf08857cc21bac2f3b4',NULL,'Gw4zlbDGcR.IGoyIRs64LVG3lYslEA1H',NULL);
INSERT INTO `library_sublayer` VALUES ('a02c9dfade5e42069dc3c60b39f00c1b','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/largeInkBottle/contrib/geometry/geometry.usda','3eebe2a320dd4f10b98542d62deec15a',NULL,'PfE36lk8rRIdsoSaK2KQy6T7kWvCvn2X',NULL);
INSERT INTO `library_sublayer` VALUES ('a04968c7f05b43d0ad30f2f57bb84cc2','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/barrel/contrib/material/default/texture/default.png','21ff4cfc83b0435a91b2404af9477d51',NULL,'0sE8e0lW7y_a0QyDGoebtxNIocNcoRi2',NULL);
INSERT INTO `library_sublayer` VALUES ('a0ab0bf077ea4e418a6b69693e7b42dd','05.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/oldTelevision/contrib/geometry/LOD1/geometry_LOD1.usda','b6234f0922c94798ba12257342157faa',NULL,'IGsnDqfLrfQ18VfvBQjd7qaj2UbvHRX2',NULL);
INSERT INTO `library_sublayer` VALUES ('a0c3bb4f639d427182933436e9351209','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/cappedJar/contrib/material/material.usda','449fe9fdd5434b03ae7f5bc021402fbf',NULL,'Zsey33EeTGZBPebmHjjeteEFq60Qg13u',NULL);
INSERT INTO `library_sublayer` VALUES ('a0d4d3c4ffd644e3ac289812d6b1e2aa','05.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/penTablet/contrib/geometry/LOD0/geometry_LOD0.usda','db17d0c2030049769e1ba2ea54d86114',NULL,'vo3oLIWY5chZ5rjcN.ngBLfYKaUuDeP7',NULL);
INSERT INTO `library_sublayer` VALUES ('a0fd8085885b45c7878cc6619d43b54c','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/lockedBox/contrib/geometry/LOD1/geometry_LOD1.usda','6ab7f53a7daf46a2ac8a83abcc89ecf9',NULL,'LgCtnqTymle.AsFVeZb0yzz8YS5yqcjE',NULL);
INSERT INTO `library_sublayer` VALUES ('a104dab9ce3f425496edd37332f6c6fc','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/glassJarFull/contrib/geometry/LOD0/geometry_LOD0.usda','f3e934c53fa645b881d2e227e8eafaeb',NULL,'MpxJg9L1_jkKaQ.KAI3VuEHKyHP0m9a5',NULL);
INSERT INTO `library_sublayer` VALUES ('a1389093858946b088d83b54072c60d4','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/glassJarEmpty/contrib/geometry/LOD0/geometry_LOD0.usda','6be75d74d18f4d88bc635b222107966f',NULL,'H9by6BrPGsy0nZrAptD6CKb9hdXYm.lQ',NULL);
INSERT INTO `library_sublayer` VALUES ('a1654aefc92f4dbc98f2401139305348','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/ladle/contrib/geometry/LOD1/geometry_LOD1.usda','89dbc25b1e554c6eae3212cc3e28850c',NULL,'TKKNeXarL69Oh31XmvWBKHT29v9.X6Zj',NULL);
INSERT INTO `library_sublayer` VALUES ('a17ceeb3f5ed4b0496b590d8f284282d','01.00.00','leafyVegetation.usda','cis-7000-usd-assets-versioned/Assets/leafyVegetation/leafyVegetation.usda','bc9563cab790436abc6180a53087ad1a',NULL,'6kNKKkdB4nmsAGApIIQEhxt3KezItBa8',NULL);
INSERT INTO `library_sublayer` VALUES ('a1882989aa604882939ad8ae78c7adb8','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/emptyDrawer/contrib/geometry/LOD2/geometry_LOD2.usda','aff070bc60b647e29d302848b812f7c2',NULL,'GgQ5E0FwvI.2b0T4KaVXUfR13_upkXVW',NULL);
INSERT INTO `library_sublayer` VALUES ('a19a20dcfd2c4845bb99951c9f3691d9','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/largeCherryTable/contrib/geometry/LOD0/geometry_LOD0.usda','b24acc08b15546e896c3e25add15f1ba',NULL,'kNUQHx8uO3LdigHx8IYMLrQVImkN0u4J',NULL);
INSERT INTO `library_sublayer` VALUES ('a1c1f24a781343bf8832a3c66efd7a6d','02.00.00','metadata.json','usd-asset-versions-dump/2025-assets-02.00.00/skateboard/metadata.json','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'5bi16ZNziK47rwGQtQpyQ0mjS2Utrkby',NULL);
INSERT INTO `library_sublayer` VALUES ('a1dc2a64624d41da88c55cb584c41a1b','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/bookStack4/contrib/material/default/texture/default.png','f1d3b419b0444e58a2e45fe157647464',NULL,'9VO6tgUZQxEo8S_BIxJ5V2a0OatDLD4O',NULL);
INSERT INTO `library_sublayer` VALUES ('a20d85563307474fbeacca42f09d6d31','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/makeupJar/contrib/.thumbs/thumbnail.png','313b0aae14664f14b656d4d17478fbc3',NULL,'q1dls8VjW5J1Pbvl4pd8gaVVHmIChMMi',NULL);
INSERT INTO `library_sublayer` VALUES ('a250ba3527054f21952d6e1fb842899c','02.00.00','skateboard_LOD2.usda','usd-asset-versions-dump/2025-assets-02.00.00/skateboard/LODs/skateboard_LOD2.usda','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'GwmKnh1jK9O_RbJHRf_PtcSbQ7z5aNxM',NULL);
INSERT INTO `library_sublayer` VALUES ('a264712f14db4d73aecf40f6ef385056','04.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/cartoonFish/contrib/geometry/LOD0/geometry_LOD0.usda','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'jCTAgR5..s_PgbWvhc89aqrahw9YDp3f',NULL);
INSERT INTO `library_sublayer` VALUES ('a2c21a1ccc76405d8dc29c8696c941b7','05.00.00','thumb.png','usd-asset-versions-dump/2024-assets-acquisition/kitchenaid/thumb.png','66b74b32abd8459cbe41f434285a7691',NULL,'PybdEEPd0y_LAuSIIUFveOAX8u9dzFis',NULL);
INSERT INTO `library_sublayer` VALUES ('a2d1223d1d694535bc2ca74ceecc9d7b','04.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/teapot/contrib/geometry/LOD1/geometry_LOD1.usda','f5e189a845fb4ed3930a81263a21bf99',NULL,'826nVshEWaMs3KNkzbNy1bOd4RWYKcth',NULL);
INSERT INTO `library_sublayer` VALUES ('a324b4d6b5e14de3b6f6219274142102','05.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/penTablet/contrib/.thumbs/thumbnail.png','db17d0c2030049769e1ba2ea54d86114',NULL,'.gm8rrYrz7BijH2mmd.95YXnIw8btQns',NULL);
INSERT INTO `library_sublayer` VALUES ('a37084a4e342445ca6669bad9df70526','01.00.00','brownBook.glb','cis-7000-usd-assets-versioned/Assets/brownBook/contrib/.cache/brownBook.glb','1cb7eed87f6c413b9a582792de2f2fe1',NULL,'GeB2_GcB0CED7766Jmx0Qr61R1.D.97b',NULL);
INSERT INTO `library_sublayer` VALUES ('a3af27b4562a40c49f449a917b6c3426','04.00.00','sushi.ma','usd-asset-versions-dump/2024-assets-acquisition/sushi/sushi.ma','2c7ef29f88474ded95eb449ebb264ead',NULL,'CvHtt3BmNr13o3vpmMAggwq_HXO596oS',NULL);
INSERT INTO `library_sublayer` VALUES ('a3b5ec74d25f4efbb6e27e27ea045dec','02.00.00','yugiohClockArc.fbx','usd-asset-versions-dump/2025-assets-02.00.00/yugiohClockArc/yugiohClockArc.fbx','4be817e19e11426ebeede52145732e77',NULL,'GRosIXpNb9OO8WUWNcCxNVgHREs3Nzoe',NULL);
INSERT INTO `library_sublayer` VALUES ('a3e4c3599a454b4192f00511f1f7e943','03.00.00','metadata.json','usd-asset-versions-dump/2025-assets-03.00.00/cartoonFish/metadata.json','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'65KeY8P6Cx1raeLqtLkLX29V9_b_auRw',NULL);
INSERT INTO `library_sublayer` VALUES ('a41da2a5022f47ba87f820f7b7718ee4','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/largePottedPlant/contrib/geometry/LOD0/geometry_LOD0.usda','cc9847c9e64a4341bd8287edf73afe04',NULL,'aRpo6Lj1XJMX.SdJUXjK4t0_VkRlTt9T',NULL);
INSERT INTO `library_sublayer` VALUES ('a424c9d55c1f4839bd3fb4107a8c9eae','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/candleGroup/contrib/geometry/LOD1/geometry_LOD1.usda','a1513d5dbdf7478aab3b4d659a3f5e74',NULL,'HoUq55J_Mu9kIdTcKPV1bZylTh.ZzyWq',NULL);
INSERT INTO `library_sublayer` VALUES ('a43cf7a1bcf445b18bd38853e49dff5a','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/oakTable/contrib/material/default/material_default.usda','3dfa350b0a294d7c9f1b419180d71748',NULL,'rlBcR2m5MBoM.S40jCPrF0KnP1IVnmCW',NULL);
INSERT INTO `library_sublayer` VALUES ('a477f64dd9cf462facad64627d1b44e9','04.00.00','vintageLamp_LOD0.usda','usd-asset-versions-dump/2025-assets-03.00.00/vintageLamp/LODs/vintageLamp_LOD0.usda','c4449799e71a4ce88999ea44a86e067b',NULL,'FM.btEVn7nHlHMjX0MRscNTanGDsqQpk',NULL);
INSERT INTO `library_sublayer` VALUES ('a4931144a23941759e99d04950cec301','04.00.00','beegCrab.usd','cis-7000-usd-assets-versioned/Assets/beegCrab/beegCrab.usd','f175fbe4933944a69d06e86c906622d6',NULL,'dZECmvDw.G11TWu83idAji0jqN5fFm7j',NULL);
INSERT INTO `library_sublayer` VALUES ('a4c3479e6f0a45a6869cb5fc796ad151','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/emptyDrawer/contrib/geometry/bbox/geometry_bbox.usda','aff070bc60b647e29d302848b812f7c2',NULL,'I94HmQhlv29D.mEe_6VBU4otKUCE73YY',NULL);
INSERT INTO `library_sublayer` VALUES ('a4f16d7c38c846dc832ff7d91e8d7a55','01.00.00','largeInkBottle.usda','cis-7000-usd-assets-versioned/Assets/largeInkBottle/largeInkBottle.usda','3eebe2a320dd4f10b98542d62deec15a',NULL,'SedWgHJjHENhAQqe.hfqLcFHqpw7fCA9',NULL);
INSERT INTO `library_sublayer` VALUES ('a573d19a3dba4c659081e42debf2817f','02.00.00','sittingMoomin_LOD0.usda','usd-asset-versions-dump/2025-assets-02.00.00/sittingMoomin/LODs/sittingMoomin_LOD0.usda','c0e55d851ea64aa4aeec27c29594a555',NULL,'NukUodi3T3YrvGsJrluDQSIS52yRZ9lX',NULL);
INSERT INTO `library_sublayer` VALUES ('a57e0b1b487f499ea0322275968b6f5b','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/horns/contrib/material/material.usda','c21bb4bc82c74bf08857cc21bac2f3b4',NULL,'t6R3pAEty3uL5w3GVkbd4l5No57GwgIw',NULL);
INSERT INTO `library_sublayer` VALUES ('a5c609d1487c4b4ab040379d071ec27f','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/bookshelf2/contrib/material/default/material_default.usda','39ab42636a0747ffa50446bcf4f57980',NULL,'Z0htFEW0hpT7OA1ED_pCMniAMbjCu.wm',NULL);
INSERT INTO `library_sublayer` VALUES ('a62b3985d1224dc1b0e7f6f5d38415bb','04.00.00','sushiLOD0.usda','usd-asset-versions-dump/2024-assets-acquisition/sushi/sushiLOD0.usda','2c7ef29f88474ded95eb449ebb264ead',NULL,'S9WZX6NUcgBsDX6beFQ6GHFie4vRe5wJ',NULL);
INSERT INTO `library_sublayer` VALUES ('a66f1054c4d14043a42fc736a811f93f','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/doubleScrollDrawer/contrib/.thumbs/thumbnail.png','d189b8bcea4e4e289d133f6fdfe25d8b',NULL,'YUwyQgTFJWL2lDjQF9BDnEmD0e5AFByd',NULL);
INSERT INTO `library_sublayer` VALUES ('a6717690518240a194bbcf6de0da124f','01.00.00','ladle.glb','cis-7000-usd-assets-versioned/Assets/ladle/contrib/.cache/ladle.glb','89dbc25b1e554c6eae3212cc3e28850c',NULL,'9Pt1UnfeFetmQPSKiFqHb.I_nSC5zZrj',NULL);
INSERT INTO `library_sublayer` VALUES ('a6e3cc2adfcb41fea798f80109dcbcac','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/bookshelf2/contrib/geometry/LOD1/geometry_LOD1.usda','39ab42636a0747ffa50446bcf4f57980',NULL,'9bBb1YQSwVr0pLouaXGWVp1zcTCZoOaS',NULL);
INSERT INTO `library_sublayer` VALUES ('a6ed7675d1a54ba08165aaf14bd0e5e6','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/bookStack2/contrib/geometry/LOD2/geometry_LOD2.usda','76e5d476ecc44eeea6da09806954f8bd',NULL,'sXd6pO9yqfGKV8ct_dXpG5FROHtFPT1d',NULL);
INSERT INTO `library_sublayer` VALUES ('a6f6880bc09a4070b5350a6e64e84d8e','04.00.00','wineGlass_model.usda','usd-asset-versions-dump/2024-assets-acquisition/wineGlass/wineGlass_model.usda','31c39c346b394a1f90cf0a00f1c4a6ef',NULL,'O01yQ9bvQNDa.f1yOalIYwygI.4ccNz7',NULL);
INSERT INTO `library_sublayer` VALUES ('a784756dc31541969ee08fa21f5d99a0','06.00.00','kitchenaid.usd','cis-7000-usd-assets-versioned/Assets/kitchenaid/kitchenaid.usd','66b74b32abd8459cbe41f434285a7691',NULL,'yTvsHfaY08mf9ZZz._hRkhCWku9YgAiS',NULL);
INSERT INTO `library_sublayer` VALUES ('a7b0b230cc71488f9f1c757da5af476b','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/bookshelf2/contrib/geometry/LOD0/geometry_LOD0.usda','39ab42636a0747ffa50446bcf4f57980',NULL,'UUi8mAMG7FgMUWBHfQtUXBCzYDTqa7aY',NULL);
INSERT INTO `library_sublayer` VALUES ('a7b1966e7a5e4bc9bcc69897e7526156','03.00.00','skateboard_LOD2.usda','usd-asset-versions-dump/2025-assets-03.00.00/skateboard/LODs/skateboard_LOD2.usda','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'DC3CUvETOsYMRVpwQm1Ip0QYZOQhENDL',NULL);
INSERT INTO `library_sublayer` VALUES ('a7e36dcf6eb14d9f931992d257732108','03.00.00','bookStack_LOD0.usda','usd-asset-versions-dump/2025-assets-03.00.00/bookStack/LODs/bookStack_LOD0.usda','082f328bf76a4d48be255c620a8cd280',NULL,'Sw4VJnfsc6RBewoszuhJRn8Hmd2eTMRD',NULL);
INSERT INTO `library_sublayer` VALUES ('a7f530c25d6442c9a4ba131794e667fd','04.00.00','thumb.png','usd-asset-versions-dump/2024-assets-acquisition/sushi/thumb.png','2c7ef29f88474ded95eb449ebb264ead',NULL,'m1p0j9tD07T6w5XbmtYHYTaHAdXR1n.l',NULL);
INSERT INTO `library_sublayer` VALUES ('a8225c3f3f0b440ba45b9d83f1995cd2','04.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/yugiohClockArc/contrib/geometry/LOD1/geometry_LOD1.usda','4be817e19e11426ebeede52145732e77',NULL,'jw9pbCxaIJEfymYZd5C8IsfyjLMvTpFR',NULL);
INSERT INTO `library_sublayer` VALUES ('a854319d15124a20bc5d885e64b920f5','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/bookshelf3/contrib/geometry/geometry.usda','fa5e37ee437e45acb2ae0c3c9c725b83',NULL,'5kNVZxt7KZvtO794nRt1Z7ifQtJMGuYi',NULL);
INSERT INTO `library_sublayer` VALUES ('a8872dd8e4ea476eb2c626dcf19b166f','01.00.00','metadata.json','usd-asset-versions-dump/2025-assets-01.00.00/skateboard/metadata.json','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'4Gn6JKJ6FbWqgHsMp4E20KLbAgLXo_K3',NULL);
INSERT INTO `library_sublayer` VALUES ('a8d1fef8a0a849c1a95370581c106e15','04.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/yellowDuck/contrib/geometry/LOD0/geometry_LOD0.usda','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'IjLhKzfJ7ZKg.tIOunddiWUd2ScvpR7J',NULL);
INSERT INTO `library_sublayer` VALUES ('a8e39336e66d4a4bba2905a1fd1205b1','05.00.00','kitchenaidLOD0.usda','usd-asset-versions-dump/2024-assets-acquisition/kitchenaid/kitchenaidLOD0.usda','66b74b32abd8459cbe41f434285a7691',NULL,'VpNdLPia5NTqGtJcLTYWfeK36XM8cUZe',NULL);
INSERT INTO `library_sublayer` VALUES ('a92269f1a7a84dc28fd5293e946ac0dc','03.00.00','teapotLOD2.usda','usd-asset-versions-dump/2024-assets-acquisition/flatTeapot/teapotLOD2.usda','3d283193f6b54cf0a233a5b83ed95819',NULL,'DVBSKz6X204YX6x7iRFzUCSiCHvW_GUI',NULL);
INSERT INTO `library_sublayer` VALUES ('a98c3f91de5144768d4bc59ab3e9ab46','05.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/wineGlass/contrib/geometry/bbox/geometry_bbox.usda','31c39c346b394a1f90cf0a00f1c4a6ef',NULL,'HS_lN9hufMfZA0zsf8XtMu9kf3dUTbGD',NULL);
INSERT INTO `library_sublayer` VALUES ('a9e1449b8fe34b3894579d389a6c51a6','04.00.00','campfire.usd','cis-7000-usd-assets-versioned/Assets/campfire/campfire.usd','6f6441599cc045ae91530ecd6cc5a81e',NULL,'ikTG_HUBA4GxSp.mAnl6QFixlfAnSsag',NULL);
INSERT INTO `library_sublayer` VALUES ('aa0457d915324c34be87ecee6a9546b6','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/doubleScrollDrawer/contrib/geometry/bbox/geometry_bbox.usda','d189b8bcea4e4e289d133f6fdfe25d8b',NULL,'_kNOYi1XHib8HEIv7JGNtR5eSMsFMjdo',NULL);
INSERT INTO `library_sublayer` VALUES ('aa06138237e0498f9364321abf181150','06.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/kitchenaid/contrib/.thumbs/thumbnail.png','66b74b32abd8459cbe41f434285a7691',NULL,'inN.5yFlNPD55nirahjdMEAjYb1GVIqh',NULL);
INSERT INTO `library_sublayer` VALUES ('aaa06ca34f1c450f81ce6e84d1ccf1c2','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/makeupContainers/contrib/geometry/LOD1/geometry_LOD1.usda','6bc90b076ae74ab9842a07913f22e681',NULL,'sr5p.fMbEoLdIqcim0FyDkq0oTfvKF_O',NULL);
INSERT INTO `library_sublayer` VALUES ('abb67c1a44b14b3b9be6bfb715a9d009','04.00.00','mugLOD2.usda','usd-asset-versions-dump/2024-assets-acquisition/mug/mugLOD2.usda','5bac6ed09efe4816b7c427ffb08c599d',NULL,'s7mSDHaJaLk.cWozQUaq4tKbyU3ZgPgz',NULL);
INSERT INTO `library_sublayer` VALUES ('abfbe12036544555b5afe7479480f316','02.00.00','metadata.json','usd-asset-versions-dump/2025-assets-02.00.00/teapot/metadata.json','f5e189a845fb4ed3930a81263a21bf99',NULL,'n2U0xFhSLCeBIgYymr7CIRFs72BuTDzj',NULL);
INSERT INTO `library_sublayer` VALUES ('ad1a6b542f364c6b9d77a7fa1a74de36','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/bambooContainer/contrib/.thumbs/thumbnail.png','1c7130d2d78e49d990ba12cde563e7c3',NULL,'kJeYdUNyRaZxL6GvGec.9xiz5N2h_K89',NULL);
INSERT INTO `library_sublayer` VALUES ('ad4f4af1ada04a80ab5fa94ce78885e8','04.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/cafeTable/contrib/geometry/LOD2/geometry_LOD2.usda','579fe0bad3f84b7babc143ab2952234e',NULL,'.I9t7X8UwCd8R2zUUWW7W3.k39EgB9eR',NULL);
INSERT INTO `library_sublayer` VALUES ('ad911d80843946ba8707120412889c74','04.00.00','mugLOD1.usda','usd-asset-versions-dump/2024-assets-acquisition/mug/mugLOD1.usda','5bac6ed09efe4816b7c427ffb08c599d',NULL,'MmRu3Ta9Sp5oNK7YMCjMmH_FE.5U1F6L',NULL);
INSERT INTO `library_sublayer` VALUES ('ade15b27414448e8a14840b20b06de04','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/bookStack5/contrib/geometry/LOD2/geometry_LOD2.usda','fa20ba6a205e4d2b951f8262bf5b2802',NULL,'y_QtKiEARCTBCTGA2nRHmkadI24ek6am',NULL);
INSERT INTO `library_sublayer` VALUES ('adef90df9996437da89a6ece7a4d957c','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/glassJarEmpty/contrib/geometry/LOD2/geometry_LOD2.usda','6be75d74d18f4d88bc635b222107966f',NULL,'05a9bUYjdBr8dntLfL3ieOp3mP6mqcZS',NULL);
INSERT INTO `library_sublayer` VALUES ('ae02874c62cd49f6a654fb4ebc5d8852','03.00.00','parkBench.usda','usd-asset-versions-dump/2025-assets-03.00.00/parkBench/parkBench.usda','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'j_YqbmNgDK8_JAywQWhNnPOO.OOrkYyB',NULL);
INSERT INTO `library_sublayer` VALUES ('ae2624a722d74a70969ce94ada21550a','04.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/pickleBarrels/contrib/.thumbs/thumbnail.png','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'NM.ojJn5IlIopCN.ixhr6r2ltafpt3oE',NULL);
INSERT INTO `library_sublayer` VALUES ('aec8de5801ca46b5b3651726756acbd6','05.00.00','default.png','cis-7000-usd-assets-versioned/Assets/oldTelevision/contrib/material/default/texture/default.png','b6234f0922c94798ba12257342157faa',NULL,'sshBR03fueSZq8prU7esBYlpUK6Ch9er',NULL);
INSERT INTO `library_sublayer` VALUES ('af16c9d8a6064779ab15f111e931ba13','02.00.00','pickelBarrels.fbx','usd-asset-versions-dump/2025-assets-02.00.00/pickleBarrels/pickelBarrels.fbx','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'5KC_hZ0kxUTvMtFFPNzPEgtDKhxJlzU4',NULL);
INSERT INTO `library_sublayer` VALUES ('af5c7dbaa46d479cacd60d222e0e14f0','03.00.00','vintageLamp_LOD2.usda','usd-asset-versions-dump/2025-assets-02.00.00/vintageLamp/LODs/vintageLamp_LOD2.usda','c4449799e71a4ce88999ea44a86e067b',NULL,'pg9q4hcFggTGLOi.O_v5NZLbBZGL8YUQ',NULL);
INSERT INTO `library_sublayer` VALUES ('afaf31f9c3584523a172ca91ce21096a','01.00.00','cherryTable.usda','cis-7000-usd-assets-versioned/Assets/cherryTable/cherryTable.usda','824b428456c148abb25d24568d649441',NULL,'ZhfpRzLf0Om0fQ3Qbi6vdGTmt99Yqcss',NULL);
INSERT INTO `library_sublayer` VALUES ('afbb3dcc89d54ee58c77ed855b90d34c','02.00.00','metadata.json','usd-asset-versions-dump/2025-assets-02.00.00/parkBench/metadata.json','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'HRGXau8pc0eOoH0VzMN3CFnhJPw6dv1I',NULL);
INSERT INTO `library_sublayer` VALUES ('afed027570fe425abb17170caa38e6bb','01.00.00','largeInkBottle.glb','cis-7000-usd-assets-versioned/Assets/largeInkBottle/contrib/.cache/largeInkBottle.glb','3eebe2a320dd4f10b98542d62deec15a',NULL,'CV3KVOJfSFT0o23dz4r9EwnVfAen_r_f',NULL);
INSERT INTO `library_sublayer` VALUES ('b0139ba504424ad19375030753158e2f','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/bambooLadder/contrib/.thumbs/thumbnail.png','f148935dbe764e648b2641d5ddcde381',NULL,'q7AWOXbsB_H.OcEM0nPQYFcqfFalGGLE',NULL);
INSERT INTO `library_sublayer` VALUES ('b05de79290784af9ac6ca44ba144dd47','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/largeCherryTable/contrib/material/default/texture/default.png','b24acc08b15546e896c3e25add15f1ba',NULL,'QRHjQsNsNReSZWD1tOGVKJV7lW7hAo4P',NULL);
INSERT INTO `library_sublayer` VALUES ('b0822f39adc74e97b4b3d9d9eb109725','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/bookshelf3/contrib/material/default/material_default.usda','fa5e37ee437e45acb2ae0c3c9c725b83',NULL,'Z39Tb9d3DhY2bL3NKBnjZl1soWjC3HE3',NULL);
INSERT INTO `library_sublayer` VALUES ('b0db1fc0323f471bae9f50df0daf0ca0','04.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/yugiohClockArc/contrib/.thumbs/thumbnail.png','4be817e19e11426ebeede52145732e77',NULL,'nLOnHyFSu7HZOXtUJatQT7pKCgiMw.9D',NULL);
INSERT INTO `library_sublayer` VALUES ('b11ca703bfb04c289ad60ab1bd03a5b0','01.00.00','hangingPickles.usda','cis-7000-usd-assets-versioned/Assets/hangingPickles/hangingPickles.usda','aa9e8d80d09e4675915f7e5080b7b351',NULL,'igc1MIBsLxrcgQAVbn.LklMBgWj_a3lK',NULL);
INSERT INTO `library_sublayer` VALUES ('b12bdf2291174477aff8ac9ee5af58f5','03.00.00','yellowDuck.fbx','usd-asset-versions-dump/2025-assets-03.00.00/yellowDuck/yellowDuck.fbx','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'d3nnldnpNli7ZrNqu8b9nzedT6iYBCXl',NULL);
INSERT INTO `library_sublayer` VALUES ('b12cebdedc4341aca9f14c83978d2126','05.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/oldTelevision/contrib/material/default/material_default.usda','b6234f0922c94798ba12257342157faa',NULL,'imXerrVlSQUz2i4a80v0aOxFV9Sn4.Xm',NULL);
INSERT INTO `library_sublayer` VALUES ('b1761e56b841493288e2b06da883a107','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/glassJarFull/contrib/material/material.usda','f3e934c53fa645b881d2e227e8eafaeb',NULL,'so9UoKnq8TKpdurjuv3EWS414A23FXR0',NULL);
INSERT INTO `library_sublayer` VALUES ('b1dd8437c6a743869daee2ca7d0c21c2','01.00.00','blueJello.glb','cis-7000-usd-assets-versioned/Assets/blueJello/contrib/.cache/blueJello.glb','3d6b8007d30e4919a46deedb6dfce573',NULL,'8ouecCySL9mOP5KSNZxvbh5oajPJyhiT',NULL);
INSERT INTO `library_sublayer` VALUES ('b219fb6ab07f4e4cbb59a6072239387f','01.00.00','cherryTable.glb','cis-7000-usd-assets-versioned/Assets/cherryTable/contrib/.cache/cherryTable.glb','824b428456c148abb25d24568d649441',NULL,'wGQxhGzmSBY36a.A6KTyWZnGhuQiOkar',NULL);
INSERT INTO `library_sublayer` VALUES ('b232c428c4fc476fa1b5e50334751f32','02.00.00','cartoonFish.fbx','usd-asset-versions-dump/2025-assets-02.00.00/cartoonFish/cartoonFish.fbx','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'CNaJRs_fe_dfAlmfxNmfB9frESzmHxGT',NULL);
INSERT INTO `library_sublayer` VALUES ('b2338632d7f647b3bed7fb9359852482','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/lockedBox/contrib/geometry/LOD2/geometry_LOD2.usda','6ab7f53a7daf46a2ac8a83abcc89ecf9',NULL,'yQA4Ren71bTwAs_dxCH0pGYM88cXmIiN',NULL);
INSERT INTO `library_sublayer` VALUES ('b243827be81243e18ac90c07dfc06fdc','03.00.00','pickleBarrels_LOD0.usda','usd-asset-versions-dump/2025-assets-03.00.00/pickleBarrels/LODs/pickleBarrels_LOD0.usda','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'eO.Wr4PMBdNFRTEs9pqUjmACoC2JvQ1Q',NULL);
INSERT INTO `library_sublayer` VALUES ('b25f413f6fb84884898af8fb020003e9','01.00.00','beegCrab.fbx','usd-asset-versions-dump/2025-assets-01.00.00/beegCrab/beegCrab.fbx','f175fbe4933944a69d06e86c906622d6',NULL,'22z0S4M9JbJlrwVeCWFwwAuCOxtLANWr',NULL);
INSERT INTO `library_sublayer` VALUES ('b2cfc0bdb34b49368ec3c2b7050b304d','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/glassJarFull/contrib/material/default/texture/default.png','f3e934c53fa645b881d2e227e8eafaeb',NULL,'Ney4.754y5z1i4rSFDv6JnG8MUVRqoAq',NULL);
INSERT INTO `library_sublayer` VALUES ('b308e80dc75d4ef396f77a629f0b64ab','04.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/skateboard/contrib/geometry/geometry.usda','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'oleonV8zuWUAdr6Lv30BGKmPcRfoYGHV',NULL);
INSERT INTO `library_sublayer` VALUES ('b312152a58f04327ae151412301a7698','01.00.00','yellowDuck.fbx','usd-asset-versions-dump/2025-assets-01.00.00/yellowDuck/yellowDuck.fbx','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'UinFNxSh_agCdK2bQauCf_7Wb1gi42wb',NULL);
INSERT INTO `library_sublayer` VALUES ('b315a23ac5f343beb3e4f63856bb38e7','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/bustWearingHat/contrib/material/material.usda','a94d3ddac1e64aff86cf5a194c50d8bf',NULL,'7lPRQWy4Cs_InQJW_p1ht61KE2l.jow6',NULL);
INSERT INTO `library_sublayer` VALUES ('b36bd1902a95496087e0d1f7f66bec42','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/logSteps/contrib/geometry/geometry.usda','bcb688a70758427fbb7e23d1ed9d756e',NULL,'0bJT7OodnBzPvGi.ec5LNpX4EycX1Qig',NULL);
INSERT INTO `library_sublayer` VALUES ('b37595ff43bc452dbd1d2309cda7f394','04.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/cartoonFish/contrib/.thumbs/thumbnail.png','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'45H2uQq7VgEEej5JcYpXlVqlMxtAMH5b',NULL);
INSERT INTO `library_sublayer` VALUES ('b3bc75e828fa4d068353737933411c30','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/goPieceJar/contrib/geometry/LOD2/geometry_LOD2.usda','65cb65e774ab4a4795d18ff514a071d9',NULL,'mHYw8qIGf.LStJ1NugMXwpVSr6GFCji3',NULL);
INSERT INTO `library_sublayer` VALUES ('b41945d97e144858a8e9454b083837d4','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/alchemistRoomWalls/contrib/geometry/LOD1/geometry_LOD1.usda','ed516f0180c84489b7cd35f892c8e438',NULL,'YJ67dxGaWveWDjBz6Zs7f_bEAOb559tu',NULL);
INSERT INTO `library_sublayer` VALUES ('b43eafc11d584b1f8d78a85673d4b09c','01.00.00','bulbousInkJar.glb','cis-7000-usd-assets-versioned/Assets/bulbousInkJar/contrib/.cache/bulbousInkJar.glb','d9782679927741a6b9b9449b3054ff77',NULL,'QPpckit1pdS4gM8Dfj1wWKjxwiXyGUkt',NULL);
INSERT INTO `library_sublayer` VALUES ('b44ec938681a4388be706ef1be070e09','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/largeInkBottle/contrib/geometry/LOD2/geometry_LOD2.usda','3eebe2a320dd4f10b98542d62deec15a',NULL,'SxzCAUPhqPSIL26LBePbcjLiYUcv7UUl',NULL);
INSERT INTO `library_sublayer` VALUES ('b47d5735a72d48d789e480733b5e5978','04.00.00','flatTeapot.usd','cis-7000-usd-assets-versioned/Assets/flatTeapot/flatTeapot.usd','3d283193f6b54cf0a233a5b83ed95819',NULL,'7zBFgjv6qfCr0lkFxIJjtsqo3wOTqBES',NULL);
INSERT INTO `library_sublayer` VALUES ('b4a013659e3949f0b3f02acff9639a79','04.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/beegCrab/contrib/geometry/bbox/geometry_bbox.usda','f175fbe4933944a69d06e86c906622d6',NULL,'lxZp7_xPQye5LBrnv8NBdUAYSBkhusug',NULL);
INSERT INTO `library_sublayer` VALUES ('b4bfb72213294565ad90f94b3787cade','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/drawerAssembly/contrib/material/default/texture/default.png','2652016a66e647f2bb874058b4d7e13c',NULL,'B.FLfASm5MDTOj6sPzt.9.XsS3mLsUHD',NULL);
INSERT INTO `library_sublayer` VALUES ('b512fd1f0469499c9bc54423568c443f','02.00.00','metadata.json','usd-asset-versions-dump/2025-assets-02.00.00/beegCrab/metadata.json','f175fbe4933944a69d06e86c906622d6',NULL,'shxwXaqTjR5mQxi_cKkpzo51MdHjsKuv',NULL);
INSERT INTO `library_sublayer` VALUES ('b5450756291c43c5b86b609720f8ef32','05.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/mug/contrib/.thumbs/thumbnail.png','5bac6ed09efe4816b7c427ffb08c599d',NULL,'xwhy_2zHAUZmX1YviDkvYSf_orxDMeNG',NULL);
INSERT INTO `library_sublayer` VALUES ('b5d8f72ae4824757a8a848da7b830c8a','01.00.00','flaredPotion.usda','cis-7000-usd-assets-versioned/Assets/flaredPotion/flaredPotion.usda','16fd6a411cc2475099c6b26a09175e77',NULL,'0i72z3MoQePY_czQLCjwWM8Zli5vFkTL',NULL);
INSERT INTO `library_sublayer` VALUES ('b66d8b3aec7f45b7b311fea3d11959f3','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/elavatedLogPlatform/contrib/geometry/LOD2/geometry_LOD2.usda','a69b43a2c8ba44a499e7f698f736e60b',NULL,'4DUyDzpanBnVtOTW6EMkBcXmtruzBKGj',NULL);
INSERT INTO `library_sublayer` VALUES ('b6e67dfa35f44269b1a760b8b828ccf3','04.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/skateboard/contrib/.thumbs/thumbnail.png','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'PXQMPpBZwMirzWqFBBYLBxWtes_EEoXF',NULL);
INSERT INTO `library_sublayer` VALUES ('b71daac7f2d04d1da7a0e1b4f6fed2c7','04.00.00','default.png','cis-7000-usd-assets-versioned/Assets/teapot/contrib/material/default/texture/default.png','f5e189a845fb4ed3930a81263a21bf99',NULL,'b2Y3XKGpLLZdJhpxH4U43NhrR97vujrT',NULL);
INSERT INTO `library_sublayer` VALUES ('b7305685bffe4767a16c35481d1ecccb','05.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/campfire/contrib/geometry/bbox/geometry_bbox.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'Q2Rd8Jz2IKyZ4lxpeVHgi2RX2BoT3xq5',NULL);
INSERT INTO `library_sublayer` VALUES ('b795c6ae29dc4fcfa87445baee6e33ef','04.00.00','default.png','cis-7000-usd-assets-versioned/Assets/campfire/contrib/material/default/texture/default.png','6f6441599cc045ae91530ecd6cc5a81e',NULL,'dsiqu4LkB78U3xsULl0Q5rHIXEVM8hEm',NULL);
INSERT INTO `library_sublayer` VALUES ('b799564701624a549bbd902da45a8a47','05.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/penTablet/contrib/geometry/geometry.usda','db17d0c2030049769e1ba2ea54d86114',NULL,'O_N2Y8OqJlokRyk3bPtRxlCzF9KQ4ELd',NULL);
INSERT INTO `library_sublayer` VALUES ('b7dfb8cd9c0d428e8abaab0b7fdd7c59','04.00.00','paniniPress.usda','usd-asset-versions-dump/2024-assets-acquisition/paniniPress/paniniPress.usda','3dcf8a1dac8242a59f83c50df682fb69',NULL,'GmxPWDi3UeU5xpWh_BhZbj3lyLLKRxTk',NULL);
INSERT INTO `library_sublayer` VALUES ('b8179e4eefc640e894e016e0873bbd65','05.00.00','paniniPress.usd','cis-7000-usd-assets-versioned/Assets/paniniPress/paniniPress.usd','3dcf8a1dac8242a59f83c50df682fb69',NULL,'ijurVLONZyStINjesQK8zRa_QL_IHmU.',NULL);
INSERT INTO `library_sublayer` VALUES ('b8261efbcd8844cfb09c6102a5047967','03.00.00','teapot_LOD0.usda','usd-asset-versions-dump/2025-assets-03.00.00/teapot/LODs/teapot_LOD0.usda','f5e189a845fb4ed3930a81263a21bf99',NULL,'8VoVXVl6c3MjwpKNvch5m2cD6Bd8vtYe',NULL);
INSERT INTO `library_sublayer` VALUES ('b833bcc8ef1b42d39f55e254ab993cbd','04.00.00','penTablet.ma','usd-asset-versions-dump/2024-assets-acquisition/penTablet/penTablet.ma','db17d0c2030049769e1ba2ea54d86114',NULL,'cpUzuIeUJZO86EqNBDuk95WEczRCJvPI',NULL);
INSERT INTO `library_sublayer` VALUES ('b85862e5a8394e65961b8ca993a78b48','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/hangingPickles/contrib/geometry/geometry.usda','aa9e8d80d09e4675915f7e5080b7b351',NULL,'nLCrBA5WgkZ0nEZ_RTaM_rY513JKOzhU',NULL);
INSERT INTO `library_sublayer` VALUES ('b8732ca7b8294bc3a5729b454fd96a18','02.00.00','yellowDuck_LOD2.usda','usd-asset-versions-dump/2025-assets-02.00.00/yellowDuck/LODs/yellowDuck_LOD2.usda','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'KOGZDfJd5p77vwFYVhiZP1nEiXdTMQoD',NULL);
INSERT INTO `library_sublayer` VALUES ('b88a4e237a8941e3af745c2d9df5f688','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/cappedJar/contrib/geometry/LOD0/geometry_LOD0.usda','449fe9fdd5434b03ae7f5bc021402fbf',NULL,'BJ8DKBdtmYXSBbR5HcdS2RJrc4lJ5E2a',NULL);
INSERT INTO `library_sublayer` VALUES ('b8b3cb6e4e1e4f26a1780b69299f265b','05.00.00','wineGlass.usd','cis-7000-usd-assets-versioned/Assets/wineGlass/wineGlass.usd','31c39c346b394a1f90cf0a00f1c4a6ef',NULL,'FdH_Dca7hQ_qPQXVvIFnuQNXwwr7tKq0',NULL);
INSERT INTO `library_sublayer` VALUES ('b8c5a47fa97c4d78ac4851664cfa681b','03.00.00','parkBench_LOD0.usda','usd-asset-versions-dump/2025-assets-03.00.00/parkBench/LODs/parkBench_LOD0.usda','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'iEciB6DiSon0cm81C1CTm.CDCVurm5LW',NULL);
INSERT INTO `library_sublayer` VALUES ('b8d5f23f5dc74420b23fdeb8a7dd66df','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/bookStack6/contrib/material/default/material_default.usda','3684e1145a004e7987f06b8c071166a1',NULL,'AAIyVrkKjzuFjdYaeLzCOTdOCT7t0KMw',NULL);
INSERT INTO `library_sublayer` VALUES ('b8e57d9506fe45a1a4477b61391f0e20','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/orangePillow/contrib/geometry/LOD1/geometry_LOD1.usda','5c179fdb44924eba8a42c0948766ca62',NULL,'X6GfvS54AV9x7.4_DPVwX6oZ8u.AhQGg',NULL);
INSERT INTO `library_sublayer` VALUES ('b902751b41c94f548bd17b3e8d588190','04.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/flatTeapot/contrib/.thumbs/thumbnail.png','3d283193f6b54cf0a233a5b83ed95819',NULL,'jcRTBSYwr6T4OVFcgfjey_ztnh_xBiPZ',NULL);
INSERT INTO `library_sublayer` VALUES ('b9358cbb57d74642ba4a5a6c0f25e843','04.00.00','wineGlassLOD2.usda','usd-asset-versions-dump/2024-assets-acquisition/wineGlass/wineGlassLOD2.usda','31c39c346b394a1f90cf0a00f1c4a6ef',NULL,'z7Cch5ko3NiEAVCDQZPYwcUV2AHPprWU',NULL);
INSERT INTO `library_sublayer` VALUES ('b94f49c7574341619dd5e1ba2adbab7f','03.00.00','pickleBarrels_LOD2.usda','usd-asset-versions-dump/2025-assets-03.00.00/pickleBarrels/LODs/pickleBarrels_LOD2.usda','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'VCWM1h7txmKLm0nafJqIhIt8iyRGObfx',NULL);
INSERT INTO `library_sublayer` VALUES ('b971a6e035d445568549fa551ce71352','05.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/campfire/contrib/geometry/LOD0/geometry_LOD0.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'eeIp5x3kK_T4twZSnIT65kxOCS.eOSSd',NULL);
INSERT INTO `library_sublayer` VALUES ('b978b8fdc7a34ba6ab2f2df17ade014c','04.00.00','carrot.ma','usd-asset-versions-dump/2024-assets-acquisition/carrot/carrot.ma','6188a79945fa415f906a1c6463a497eb',NULL,'ZgQWeY0Cp.aGy9zMRwbN_3ndb0joC1GZ',NULL);
INSERT INTO `library_sublayer` VALUES ('b9c0119c51724d54905e84a37fe4ee17','02.00.00','cartoonFish_LOD1.usda','usd-asset-versions-dump/2025-assets-02.00.00/cartoonFish/LODs/cartoonFish_LOD1.usda','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'CXen6PNCsyHYYD4sIbk8TF_s4JGxLKqV',NULL);
INSERT INTO `library_sublayer` VALUES ('ba58fe42e7d6472babc2654f594846fa','04.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/skateboard/contrib/geometry/LOD2/geometry_LOD2.usda','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'Eenr.GNAHpmpO3roe1Cp8Ukbm0R06jqy',NULL);
INSERT INTO `library_sublayer` VALUES ('ba62d83ed4c345ea8a91a9b0eda947ed','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/cherryTable/contrib/geometry/geometry.usda','824b428456c148abb25d24568d649441',NULL,'KvGHBB1ByJaEMDuXNOgvXzHTvFXEVK8_',NULL);
INSERT INTO `library_sublayer` VALUES ('ba6e2d345f6b4fcba6970fceda4b15c6','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/drawerAssembly/contrib/geometry/LOD0/geometry_LOD0.usda','2652016a66e647f2bb874058b4d7e13c',NULL,'MM_tW4Zo9KYY7.BJWflYRPuZCYO_HJes',NULL);
INSERT INTO `library_sublayer` VALUES ('ba80cc6365384378a0d0fba7cd4146f4','04.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/parkBench/contrib/material/material.usda','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'j49DrBjwnFqkOQWB81bFNNOinpgwR1HY',NULL);
INSERT INTO `library_sublayer` VALUES ('baad0486e53241e797cde9345f967369','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/hangingPickles/contrib/.thumbs/thumbnail.png','aa9e8d80d09e4675915f7e5080b7b351',NULL,'1otGcCNAYgtz8GQavL8Cv8brtEYFXGQp',NULL);
INSERT INTO `library_sublayer` VALUES ('bab091e4e17947d4a533fc6f8c6f47d1','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/glassJarFull/contrib/geometry/bbox/geometry_bbox.usda','f3e934c53fa645b881d2e227e8eafaeb',NULL,'CiyyeE5EKKXU2_xWvw8soIlOqeql2lVd',NULL);
INSERT INTO `library_sublayer` VALUES ('bada50695b4a4cfaaff6b647eec26e93','04.00.00','vintageLamp_LOD2.usda','usd-asset-versions-dump/2025-assets-03.00.00/vintageLamp/LODs/vintageLamp_LOD2.usda','c4449799e71a4ce88999ea44a86e067b',NULL,'.qdfe95kdVOzrpCQ.dfyY2e6bT6PZnE1',NULL);
INSERT INTO `library_sublayer` VALUES ('bb18fd48ae174a28ad444811f3870a46','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/cappedJar/contrib/geometry/LOD2/geometry_LOD2.usda','449fe9fdd5434b03ae7f5bc021402fbf',NULL,'yz1wiW2TU22A4uJ1vevD69SQ2GhcTsvo',NULL);
INSERT INTO `library_sublayer` VALUES ('bbac91ba2be340ab8fcd033fdb067cb4','06.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/kitchenaid/contrib/geometry/LOD1/geometry_LOD1.usda','66b74b32abd8459cbe41f434285a7691',NULL,'l3VwUiS_wLxZc4Fam6lcrlKAQ0jCPrwM',NULL);
INSERT INTO `library_sublayer` VALUES ('bbd02d15b3044249a278cbe3bccc29bd','02.00.00','pickleBarrels_LOD0.usda','usd-asset-versions-dump/2025-assets-02.00.00/pickleBarrels/LODs/pickleBarrels_LOD0.usda','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'.30gPb.FRpdEyCS0Uu8PC5z3w7qztaQC',NULL);
INSERT INTO `library_sublayer` VALUES ('bbd54b73a16340f8b546a7dae2adfd3a','02.00.00','yugiohClockArc_LOD0.usda','usd-asset-versions-dump/2025-assets-02.00.00/yugiohClockArc/LODs/yugiohClockArc_LOD0.usda','4be817e19e11426ebeede52145732e77',NULL,'H7PCEG7pGnP0hLNvFesvbv6Q7DTmDYeF',NULL);
INSERT INTO `library_sublayer` VALUES ('bbe99a00a8b9428f8ab37cbbb1ece193','05.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/woodenChair/contrib/material/default/material_default.usda','b7d69121f36340adbdb7bed776c42a8d',NULL,'10agE_E6FS7LO93AgQDrhJvnf6kVtEbD',NULL);
INSERT INTO `library_sublayer` VALUES ('bc1e06d2b839445b9324765a18801d04','01.00.00','makeupJar.glb','cis-7000-usd-assets-versioned/Assets/makeupJar/contrib/.cache/makeupJar.glb','313b0aae14664f14b656d4d17478fbc3',NULL,'UmZqJ98J2nt28MDufqWffIlqgsEBt3g8',NULL);
INSERT INTO `library_sublayer` VALUES ('bcc3c848efd248e88196d5a04d878309','05.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/carrot/contrib/geometry/LOD1/geometry_LOD1.usda','6188a79945fa415f906a1c6463a497eb',NULL,'9FCFIoxaeJZKdG3zcTuKHyKBf8mAJdsX',NULL);
INSERT INTO `library_sublayer` VALUES ('bcc68d4a339c4677808e6b36afdea353','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/foxHandRight/contrib/geometry/bbox/geometry_bbox.usda','e1dc4b9960364ffba02431380e01df0f',NULL,'keny2WHzDcAYS6tzzJDLgmOKn6oEforg',NULL);
INSERT INTO `library_sublayer` VALUES ('bccf40f382cd44e4b5653ba300511f5a','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/doubleScrollDrawer/contrib/geometry/geometry.usda','d189b8bcea4e4e289d133f6fdfe25d8b',NULL,'LFLJ68SkNt_ezKzmXUJHy2UoYu18UGAx',NULL);
INSERT INTO `library_sublayer` VALUES ('bd070365551f4738a21e6b5fef2d6f66','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/ladle/contrib/material/default/texture/default.png','89dbc25b1e554c6eae3212cc3e28850c',NULL,'wzl6ZKNtPwFFZ0d0p5xv8oZ9xG5np5vh',NULL);
INSERT INTO `library_sublayer` VALUES ('bd070944cb0b4ed19aa67ec08e7f5b8a','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/bambooContainer/contrib/geometry/LOD0/geometry_LOD0.usda','1c7130d2d78e49d990ba12cde563e7c3',NULL,'_EVQ8vohFZNuvOYjIw2rb_CYKyZpehDK',NULL);
INSERT INTO `library_sublayer` VALUES ('bd5649a8bfcb4ac795e5219042cde4df','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/brownBook/contrib/material/default/material_default.usda','1cb7eed87f6c413b9a582792de2f2fe1',NULL,'YZqZIEAe4kTFyxCtwwLKTbW59fqfRqQq',NULL);
INSERT INTO `library_sublayer` VALUES ('bde93dcd084b4d6ebd637669ed5facb8','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/largePottedPlant/contrib/geometry/LOD1/geometry_LOD1.usda','cc9847c9e64a4341bd8287edf73afe04',NULL,'XQkSkcyowiIXjCzchBhuaY_IC0cmQRx3',NULL);
INSERT INTO `library_sublayer` VALUES ('be1b9aad16c34647ba0cd6544ad66ba4','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/inkBottle/contrib/geometry/LOD2/geometry_LOD2.usda','ba022dd31fd0446a907529c711cea63f',NULL,'C.pEDFFaHcc4fvl_OvO4HaEKMFbwJZYo',NULL);
INSERT INTO `library_sublayer` VALUES ('bf11d33a0b6c49eeb8730bcae4f479b5','01.00.00','medicineBottle.glb','cis-7000-usd-assets-versioned/Assets/medicineBottle/contrib/.cache/medicineBottle.glb','8deb7dd1667c428b89933de25c02e4ce',NULL,'F9zJkEjBEP9t9.rl8xTt.0f5L1ovMQ13',NULL);
INSERT INTO `library_sublayer` VALUES ('bf7e67f2d7bf4f59ac800be563366534','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/hangingGinger/contrib/geometry/bbox/geometry_bbox.usda','7b333698a6b74e45a24e2e642b55d1dd',NULL,'dclyZ5ARBYjO5i_C0_SsnAlPXNq8XquR',NULL);
INSERT INTO `library_sublayer` VALUES ('c0843bc1787644ada77758de0f26ef46','04.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/parkBench/contrib/geometry/LOD2/geometry_LOD2.usda','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'t6PYTcFMZOzcknOPO4hQgbQ.rGYPQB8_',NULL);
INSERT INTO `library_sublayer` VALUES ('c0aa8a9128be4b0687449ba7ed3dc8be','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/bookStack5/contrib/material/default/texture/default.png','fa20ba6a205e4d2b951f8262bf5b2802',NULL,'jd4IrqbXgEUS_D7n_ot2YjR2.P31qdeZ',NULL);
INSERT INTO `library_sublayer` VALUES ('c1a5b3edd13a4386b1ddb6d1feab6bf9','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/bambooLadder/contrib/material/default/texture/default.png','f148935dbe764e648b2641d5ddcde381',NULL,'ThJt4wQbY6kAt6YYOkVVZ9rz5RY0Qcxa',NULL);
INSERT INTO `library_sublayer` VALUES ('c1c17d7217ab413599eda9ed6728fd22','04.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/bookStack/contrib/material/default/material_default.usda','082f328bf76a4d48be255c620a8cd280',NULL,'OLZDPTicbB5oOSf_pJXooBYs7FTPN8fd',NULL);
INSERT INTO `library_sublayer` VALUES ('c1f0257d79af48529a1720516a5e03a7','04.00.00','paniniPress_material.usda','usd-asset-versions-dump/2024-assets-acquisition/paniniPress/paniniPress_material.usda','3dcf8a1dac8242a59f83c50df682fb69',NULL,'AIucJfvI_GjHhTPiIKR.RfTBhu_ooKF8',NULL);
INSERT INTO `library_sublayer` VALUES ('c22ab52c08d44287a9068ca7b02b0ba2','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/makeupContainers/contrib/geometry/LOD0/geometry_LOD0.usda','6bc90b076ae74ab9842a07913f22e681',NULL,'.0VTMTbdwQPHWNcgmBrFJA2Jby1ieLDr',NULL);
INSERT INTO `library_sublayer` VALUES ('c2abb2f2dcc2458583324c47daa2a6a6','04.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/cafeTable/contrib/material/default/material_default.usda','579fe0bad3f84b7babc143ab2952234e',NULL,'FCCMy2Jyzl0WBwBjcAVlukQGjadgt_Gd',NULL);
INSERT INTO `library_sublayer` VALUES ('c2b5cfd2f7ce483a81778e9a751da5f3','03.00.00','metadata.json','usd-asset-versions-dump/2025-assets-03.00.00/skateboard/metadata.json','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'E.GIR6vUSir3lfPzmxlUJpAR8HYv6h5y',NULL);
INSERT INTO `library_sublayer` VALUES ('c2c4c2cee2034b5eb296c99d104a8780','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/lockedBox/contrib/geometry/LOD0/geometry_LOD0.usda','6ab7f53a7daf46a2ac8a83abcc89ecf9',NULL,'nItuZeO0HunLfWwMX5qMnutdPl_LMcyV',NULL);
INSERT INTO `library_sublayer` VALUES ('c30276a1a06f405ab2d9d89d7a7e7249','04.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/yugiohClockArc/contrib/geometry/bbox/geometry_bbox.usda','4be817e19e11426ebeede52145732e77',NULL,'qzSMu9vrFDGNTFGehdybFlMWzD8tup_7',NULL);
INSERT INTO `library_sublayer` VALUES ('c31fda68b3714547b50ebdece410f516','04.00.00','mug.usda','usd-asset-versions-dump/2024-assets-acquisition/mug/mug.usda','5bac6ed09efe4816b7c427ffb08c599d',NULL,'GWV43EExvvWkWtzv9YkYXyD8aL328XmL',NULL);
INSERT INTO `library_sublayer` VALUES ('c381426c678f4ae9af0c5b84fd8fa5b0','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/ladle/contrib/.thumbs/thumbnail.png','89dbc25b1e554c6eae3212cc3e28850c',NULL,'P96owtM5_K0bQB3UOvYw1Cuh00iOt9JX',NULL);
INSERT INTO `library_sublayer` VALUES ('c383ddae633c4c47b1d08df676b4049b','03.00.00','teapotLOD1.usda','usd-asset-versions-dump/2024-assets-acquisition/flatTeapot/teapotLOD1.usda','3d283193f6b54cf0a233a5b83ed95819',NULL,'z1ZZewkvon96NbAexkgGL1pZ3zqaMhNT',NULL);
INSERT INTO `library_sublayer` VALUES ('c390c4cc2bb94f1aae2adaa19d6083eb','04.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/cafeTable/contrib/geometry/geometry.usda','579fe0bad3f84b7babc143ab2952234e',NULL,'VDuxlXUgrPsOu3nJ09zc8WZQ.cgrWbPg',NULL);
INSERT INTO `library_sublayer` VALUES ('c3eb1dc4760c4e138abb6da58312cc20','04.00.00','thumb.png','usd-asset-versions-dump/2024-assets-acquisition/wineGlass/thumb.png','31c39c346b394a1f90cf0a00f1c4a6ef',NULL,'pJimeENoApwPKRA4cW8wY4dTe7E6qpWt',NULL);
INSERT INTO `library_sublayer` VALUES ('c42afd37488541c283de2f2db00950c5','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/bookStack5/contrib/material/default/material_default.usda','fa20ba6a205e4d2b951f8262bf5b2802',NULL,'kVMAtzkguh6RXFHY0MyGEitpe2u6fkMZ',NULL);
INSERT INTO `library_sublayer` VALUES ('c4bfc236388d485da0b34dfc309fa7a0','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/glassCauldron/contrib/geometry/LOD0/geometry_LOD0.usda','427b041b429f4dffb526ee677a936f12',NULL,'ubeMOMp21Puz.WhW9mcIX0fm9cq_JDkA',NULL);
INSERT INTO `library_sublayer` VALUES ('c4cbc04b3454426eb6a1eb67a8134fad','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/glassCauldron/contrib/geometry/LOD2/geometry_LOD2.usda','427b041b429f4dffb526ee677a936f12',NULL,'tuJ2.ub3H4q77v2nSUFYRjhW4OHnIoKQ',NULL);
INSERT INTO `library_sublayer` VALUES ('c4ce276e6be54db2bd66e02d155e8f65','02.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-02.00.00/cafeTable/thumbnail.png','579fe0bad3f84b7babc143ab2952234e',NULL,'Z9O.YhStYkCNBJju4In12W4siT7wcMJY',NULL);
INSERT INTO `library_sublayer` VALUES ('c4ecb9696fe24c74b7143b1aa7d94892','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/cashRegister/contrib/.thumbs/thumbnail.png','ca9ae1e89e6145bea24272531dcfbe27',NULL,'h8rkpki8JKeoQ7MBswQLb8Xk9WDx5nVt',NULL);
INSERT INTO `library_sublayer` VALUES ('c4f46bbd4d5e4a4ba955d263b2a70f08','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/glassJarEmpty/contrib/geometry/bbox/geometry_bbox.usda','6be75d74d18f4d88bc635b222107966f',NULL,'VpVh_zQ5wOE2MMvYGA9iCoQ05exSfI1s',NULL);
INSERT INTO `library_sublayer` VALUES ('c58f6b121c9a4b59b69221fbf22c7cfb','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/bambooContainer/contrib/geometry/LOD2/geometry_LOD2.usda','1c7130d2d78e49d990ba12cde563e7c3',NULL,'cjGS8gvLfqWXZqefAyzl8Gm120ftVWV3',NULL);
INSERT INTO `library_sublayer` VALUES ('c5a572c72f0b44a995f1851e48154e5e','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/largeCherryTable/contrib/geometry/bbox/geometry_bbox.usda','b24acc08b15546e896c3e25add15f1ba',NULL,'JoZTLs.AzKljQvdomIFbOFV7l2fzq7mZ',NULL);
INSERT INTO `library_sublayer` VALUES ('c6062cabfa264cfba352e7bc2c70933f','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/bluePillow/contrib/.thumbs/thumbnail.png','81cdcad6e58a448b8dad18e4d311b5f1',NULL,'.ykVsm1GzI1d8WEZc5PbPuuAMz3bhUzF',NULL);
INSERT INTO `library_sublayer` VALUES ('c6097e3f05e0418ba940e7a7c1f6c700','05.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/woodenChair/contrib/.thumbs/thumbnail.png','b7d69121f36340adbdb7bed776c42a8d',NULL,'0iVajdxtgwQx9IOthjZgT51o3fV3l0aH',NULL);
INSERT INTO `library_sublayer` VALUES ('c61a196be20b4f57a5599806432a3937','05.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/woodenChair/contrib/geometry/LOD2/geometry_LOD2.usda','b7d69121f36340adbdb7bed776c42a8d',NULL,'pCGEMNY5cYZGPKwjAqTeGTqd_l3vurMy',NULL);
INSERT INTO `library_sublayer` VALUES ('c66539af392f4bb18897c6f571f7ab79','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/cappedJar/contrib/geometry/bbox/geometry_bbox.usda','449fe9fdd5434b03ae7f5bc021402fbf',NULL,'apvvD10pVwMD4hONfraJ4O7524SihmR0',NULL);
INSERT INTO `library_sublayer` VALUES ('c694b0fff62d482b998e316cb0c318d5','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/barrel/contrib/material/default/material_default.usda','21ff4cfc83b0435a91b2404af9477d51',NULL,'boRnlIVtj6cZuoORfcrOJVMXBYVDZ24l',NULL);
INSERT INTO `library_sublayer` VALUES ('c6b52d0ad6d34f9cb79de17704474f69','03.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-03.00.00/skateboard/thumbnail.png','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'oIH5Oc34CZGdf8.gesxRrXlxtdFzXsRa',NULL);
INSERT INTO `library_sublayer` VALUES ('c6c4cf849d2d41e7be3539a9e5a2e6c6','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/emptyDrawer/contrib/material/default/texture/default.png','aff070bc60b647e29d302848b812f7c2',NULL,'XERgrYfjQkxFxRpe4KDPd8xZcYB.VTuS',NULL);
INSERT INTO `library_sublayer` VALUES ('c6c531f91fcd4a77a9c922cc99ef8aec','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/bambooContainer/contrib/geometry/bbox/geometry_bbox.usda','1c7130d2d78e49d990ba12cde563e7c3',NULL,'fF5ZhFkWEzr2y1LN.8B3REZ29cGg0vCS',NULL);
INSERT INTO `library_sublayer` VALUES ('c6c72b9c15e3496885bdf5dbdaf99b6d','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/horns/contrib/material/default/material_default.usda','c21bb4bc82c74bf08857cc21bac2f3b4',NULL,'c2CKAHXAogc.7XfP4VZlBqK74tlVdj4V',NULL);
INSERT INTO `library_sublayer` VALUES ('c71ffd4f4a7542319e74f39a2558b781','04.00.00','sittingMoomin.usd','cis-7000-usd-assets-versioned/Assets/sittingMoomin/sittingMoomin.usd','c0e55d851ea64aa4aeec27c29594a555',NULL,'7oLLogbR4IoGGb.KKBlVNhHhw6T5iu_w',NULL);
INSERT INTO `library_sublayer` VALUES ('c81fb058f0ad4058b85e786275ddbc62','04.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/flatTeapot/contrib/material/material.usda','3d283193f6b54cf0a233a5b83ed95819',NULL,'QH8Rqgtk0yyLsUo_j0S7Zt0mZZQxdwDe',NULL);
INSERT INTO `library_sublayer` VALUES ('c8380b3ad45a4a52aab4343b4f4a7b0d','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/goPieceJar/contrib/geometry/LOD0/geometry_LOD0.usda','65cb65e774ab4a4795d18ff514a071d9',NULL,'ctCLmn0rUydJ5MYWfdac3Vt2gtxtFKx_',NULL);
INSERT INTO `library_sublayer` VALUES ('c83ba0af8aa94db69412c82a99b57205','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/orangePillow/contrib/geometry/geometry.usda','5c179fdb44924eba8a42c0948766ca62',NULL,'fHUXZg4OnZHiqirCAu_WpbXq1WhoiOrT',NULL);
INSERT INTO `library_sublayer` VALUES ('c873a3def2e443098cd57910a0656c49','04.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/cafeTable/contrib/geometry/LOD1/geometry_LOD1.usda','579fe0bad3f84b7babc143ab2952234e',NULL,'ro.TF14.BZvU30cXFt9vDcoRQdmZFYy2',NULL);
INSERT INTO `library_sublayer` VALUES ('c88497f23d87470e9b1d3ae3535afdb2','04.00.00','thumb.png','usd-asset-versions-dump/2024-assets-acquisition/woodenChair/thumb.png','b7d69121f36340adbdb7bed776c42a8d',NULL,'YpqgL30QRwiHlO.IomdezpTDKk3S4220',NULL);
INSERT INTO `library_sublayer` VALUES ('c891920214654b85a6a628f0bccc683a','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/doubleScrollDrawer/contrib/geometry/LOD0/geometry_LOD0.usda','d189b8bcea4e4e289d133f6fdfe25d8b',NULL,'COTwqGk4LV_Hv4rVme2qlAnSqHzMWI.g',NULL);
INSERT INTO `library_sublayer` VALUES ('ca7eb614f92d479bb5fc4aa089fd68af','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/asianGoldPieceContainer/contrib/geometry/LOD2/geometry_LOD2.usda','a8e9675b3e2a4a63b73c6d1fd34ca0e0',NULL,'OeYpWZ6J9hVBTjNAO6v.wxGcMGvj.Qqv',NULL);
INSERT INTO `library_sublayer` VALUES ('ca855549957f4c6e9a1c7dc3921844ee','03.00.00','cartoonFish_LOD2.usda','usd-asset-versions-dump/2025-assets-03.00.00/cartoonFish/LODs/cartoonFish_LOD2.usda','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'WBvQnH94vCMFbtTHCk44GqqcZNOlt2sj',NULL);
INSERT INTO `library_sublayer` VALUES ('caaa7da37b3b4782875f81cbf8b6f44c','05.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/sushi/contrib/geometry/bbox/geometry_bbox.usda','2c7ef29f88474ded95eb449ebb264ead',NULL,'kx5y52mll.gPqLsCx8yJ07Nk2uPdmLyl',NULL);
INSERT INTO `library_sublayer` VALUES ('cafba1c0bf5d4cbaa22c7eff269cd9e0','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/lantern/contrib/geometry/LOD0/geometry_LOD0.usda','10a15094d1dc45b7bcf8c698420b9e91',NULL,'Dqo5.R3zCvi8So4ucTxJafzEWDWLe9ne',NULL);
INSERT INTO `library_sublayer` VALUES ('cb9721a2df764657ac377466f1203b84','04.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/parkBench/contrib/material/default/material_default.usda','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'mKbMfvNGP2WNwuLEWeS21L2e8tPJH4k0',NULL);
INSERT INTO `library_sublayer` VALUES ('cbb396fe04c044a2982a942440d475d7','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/drinkingHorns/contrib/geometry/bbox/geometry_bbox.usda','c5f39a998aec42cc8396f2ff23cbb375',NULL,'5.kwjff6b9vJ1WupG0U5_zpHvvCuYsPK',NULL);
INSERT INTO `library_sublayer` VALUES ('cbddd40d113f445fb156d4bc2b0cd84c','02.00.00','metadata.json','usd-asset-versions-dump/2025-assets-02.00.00/sittingMoomin/metadata.json','c0e55d851ea64aa4aeec27c29594a555',NULL,'Bn_n8MuXgykl8Xz70N0bK0yqdsRWv2sG',NULL);
INSERT INTO `library_sublayer` VALUES ('cbf7b4ad47914ec18725b5f537bcdd8b','03.00.00','campfire_LOD2.usda','usd-asset-versions-dump/2025-assets-03.00.00/campfire/LODs/campfire_LOD2.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'h1nY8nMKWLx5T4FL.MQA6ggUeBChUmw3',NULL);
INSERT INTO `library_sublayer` VALUES ('ccd1a937a23d4f23ac96da2dfd985626','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/makeupContainers/contrib/material/default/material_default.usda','6bc90b076ae74ab9842a07913f22e681',NULL,'82Damk36sd6f1j8l8GefsjVuMb5p5IKF',NULL);
INSERT INTO `library_sublayer` VALUES ('cce48ceaa7fa42d58d4670a31b873b19','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/brownBook/contrib/geometry/geometry.usda','1cb7eed87f6c413b9a582792de2f2fe1',NULL,'efU_jM_sjRjer.qBwNM.7XIZSQnHyNq7',NULL);
INSERT INTO `library_sublayer` VALUES ('cd2038dae8c648b8ad5c80369ab1e510','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/glassCauldron/contrib/material/default/material_default.usda','427b041b429f4dffb526ee677a936f12',NULL,'NrQav5xcB.xUaN_6vDo6dDWLQHaOOR.3',NULL);
INSERT INTO `library_sublayer` VALUES ('cd4d8c845b284771a6e7e3a0f52dd168','04.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/flatTeapot/contrib/geometry/LOD1/geometry_LOD1.usda','3d283193f6b54cf0a233a5b83ed95819',NULL,'ZyXmKt8p8.W9uAgMFdskskFRvEktsb5y',NULL);
INSERT INTO `library_sublayer` VALUES ('cd63e27bee204814ae12ced429242e63','05.00.00','material_logs.usda','cis-7000-usd-assets-versioned/Assets/campfire/contrib/material/logs/material_logs.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'JGPqmwwWlgpMojj0Ohpnxr1svgTtqQxc','0facb9393f9a4e35bb75c5f46d7d7a8c');
INSERT INTO `library_sublayer` VALUES ('ce7c0d8e992c44ad8832d99944c08053','01.00.00','bookStack4.usda','cis-7000-usd-assets-versioned/Assets/bookStack4/bookStack4.usda','f1d3b419b0444e58a2e45fe157647464',NULL,'TWAoDDVNeyytXR_rK.bdHcOwxBEqRKBk',NULL);
INSERT INTO `library_sublayer` VALUES ('cedadbd88628477f9b336f02a317778d','04.00.00','bookStack.usd','cis-7000-usd-assets-versioned/Assets/bookStack/bookStack.usd','082f328bf76a4d48be255c620a8cd280',NULL,'.2C.THKyjW6QkCiRWmFq6MRq67T8POSz',NULL);
INSERT INTO `library_sublayer` VALUES ('cee88d7f7a9044149364a7db3553eeeb','01.00.00','alchemistRoomWalls.glb','cis-7000-usd-assets-versioned/Assets/alchemistRoomWalls/contrib/.cache/alchemistRoomWalls.glb','ed516f0180c84489b7cd35f892c8e438',NULL,'ocbzkbgUpfPp3Vf8QI8JZ3cXjje4f4UN',NULL);
INSERT INTO `library_sublayer` VALUES ('cefda1c46fb147348a12d326507e8c6c','02.00.00','bookStack_LOD0.usda','usd-asset-versions-dump/2025-assets-02.00.00/bookStack/LODs/bookStack_LOD0.usda','082f328bf76a4d48be255c620a8cd280',NULL,'MIQHrHMYOKvh9S6OrosHDZZL9UeivZzw',NULL);
INSERT INTO `library_sublayer` VALUES ('cf4094e0578c46fda7819d82e314cc2e','01.00.00','hangingGinger.glb','cis-7000-usd-assets-versioned/Assets/hangingGinger/contrib/.cache/hangingGinger.glb','7b333698a6b74e45a24e2e642b55d1dd',NULL,'MLQezoy_qyA7Kiml9X4DkTgGUyCbx7WA',NULL);
INSERT INTO `library_sublayer` VALUES ('cf87ea52ed314a579985063ffe917c1b','01.00.00','bookshelf2.glb','cis-7000-usd-assets-versioned/Assets/bookshelf2/contrib/.cache/bookshelf2.glb','39ab42636a0747ffa50446bcf4f57980',NULL,'hKUferJIS80zHQjGqmFETLu.pXIO7E9.',NULL);
INSERT INTO `library_sublayer` VALUES ('cfcd5ab160a74ba1bbab5d390c6b8b94','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/oakTable/contrib/.thumbs/thumbnail.png','3dfa350b0a294d7c9f1b419180d71748',NULL,'ehfl2G6V9pb0JYmPRl1aVJyP81_Fhr2e',NULL);
INSERT INTO `library_sublayer` VALUES ('cfe47a8191e345e8bb73232e698dec67','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/bookStack3/contrib/geometry/LOD1/geometry_LOD1.usda','077caad23bd4486b8fb066bf43d04761',NULL,'shO8v_PvOLNmtW7sgEeLru.Ft69l4Ced',NULL);
INSERT INTO `library_sublayer` VALUES ('d04f21d0bd12441cb6b301301169823c','04.00.00','metadata.json','usd-asset-versions-dump/2024-assets-acquisition/carrot/metadata.json','6188a79945fa415f906a1c6463a497eb',NULL,'nK_3.rGERgJ_QP0fzopSBB291_GFFR.R',NULL);
INSERT INTO `library_sublayer` VALUES ('d0747f2082d94ae7afe463306307d723','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/asianGoldPieceContainer/contrib/material/material.usda','a8e9675b3e2a4a63b73c6d1fd34ca0e0',NULL,'5NqEzem_gF_MV02DZSCF9uVKWLmIoVWf',NULL);
INSERT INTO `library_sublayer` VALUES ('d13a1603bf5540d5917e4d645d2f8390','05.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/campfire/contrib/material/default/material_default.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'etx0jRiWYlSrQK76CuOwTiZ4tUh2e8_c','709f534f9ff44e23958cdd7667aaa9be');
INSERT INTO `library_sublayer` VALUES ('d1b78a3061c3480d8c94ba19644a104e','01.00.00','blueJello.usda','cis-7000-usd-assets-versioned/Assets/blueJello/blueJello.usda','3d6b8007d30e4919a46deedb6dfce573',NULL,'52LIaeyBNx835MF5l2DsvqpqHIao1VSy',NULL);
INSERT INTO `library_sublayer` VALUES ('d1baaa7ef4d3495087fec9bc4acff40c','03.00.00','campfire.usda','usd-asset-versions-dump/2025-assets-03.00.00/campfire/campfire.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'G_u3zd_0H0n1YyRmagoEGS7zEpJRReQB',NULL);
INSERT INTO `library_sublayer` VALUES ('d3079ac13dd349c59ffec6dc88ad3075','04.00.00','default.png','cis-7000-usd-assets-versioned/Assets/bookStack/contrib/material/default/texture/default.png','082f328bf76a4d48be255c620a8cd280',NULL,'JZHA8eEtt.lPK45MIIvuY3K6KlyGrrz8',NULL);
INSERT INTO `library_sublayer` VALUES ('d32b6bd3115146d29325cb591d96532b','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/bustWearingHat/contrib/geometry/geometry.usda','a94d3ddac1e64aff86cf5a194c50d8bf',NULL,'6Jq_UE8_jceIAXwgcAvIJ3sAX_vARIdk',NULL);
INSERT INTO `library_sublayer` VALUES ('d33c125840e54b14960050505db7308a','04.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/sittingMoomin/contrib/geometry/LOD1/geometry_LOD1.usda','c0e55d851ea64aa4aeec27c29594a555',NULL,'M6BT2TxtpzyYukRPxKvML4ma21YOpqdp',NULL);
INSERT INTO `library_sublayer` VALUES ('d4000c61497441c6bf8c977dd0d7c121','03.00.00','teapotLOD0.usda','usd-asset-versions-dump/2024-assets-acquisition/flatTeapot/teapotLOD0.usda','3d283193f6b54cf0a233a5b83ed95819',NULL,'YFELC1P8EF3wLV5ZVU.tOohTcoYbffaA',NULL);
INSERT INTO `library_sublayer` VALUES ('d4607d8a96064df58cd9a83e3aa52676','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/bookStack2/contrib/material/default/material_default.usda','76e5d476ecc44eeea6da09806954f8bd',NULL,'.ktwXtB.u21r_.W73Ocs6fN3SPH9a8Zj',NULL);
INSERT INTO `library_sublayer` VALUES ('d4d0d5def2d940bc83a432d8ae1555e5','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/bookshelf3/contrib/geometry/LOD1/geometry_LOD1.usda','fa5e37ee437e45acb2ae0c3c9c725b83',NULL,'lacOfe.8pwSXsvUyRzQhZKIrtpnquU2X',NULL);
INSERT INTO `library_sublayer` VALUES ('d4f41acf012a49248b9ce7f79f66a4e0','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/asianGoldPieceContainer/contrib/.thumbs/thumbnail.png','a8e9675b3e2a4a63b73c6d1fd34ca0e0',NULL,'qVzNakDhSOCbi8abRl_WdNUzSx0baFsx',NULL);
INSERT INTO `library_sublayer` VALUES ('d4f983f4c1544d8cacf867719cd16589','04.00.00','metadata.json','usd-asset-versions-dump/2024-assets-acquisition/penTablet/metadata.json','db17d0c2030049769e1ba2ea54d86114',NULL,'m6A_iBi0Wb5KjCYaOf4N1_u1f2wUezzH',NULL);
INSERT INTO `library_sublayer` VALUES ('d51b7340c4974793b7749cd7d1b9f39c','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/hangingPickles/contrib/geometry/LOD0/geometry_LOD0.usda','aa9e8d80d09e4675915f7e5080b7b351',NULL,'Wbyq1iL_FAxroLW0uuDMbyuQNrxJBJa4',NULL);
INSERT INTO `library_sublayer` VALUES ('d5231acd907b455fbe8964c714d07005','04.00.00','carrot.usda','usd-asset-versions-dump/2024-assets-acquisition/carrot/carrot.usda','6188a79945fa415f906a1c6463a497eb',NULL,'5t7GWXbWqIVw47p8QRzcvzNba4megkf_',NULL);
INSERT INTO `library_sublayer` VALUES ('d5ac6ad0be424ab687d42dd654933a07','03.00.00','sittingMoomin_LOD1.usda','usd-asset-versions-dump/2025-assets-03.00.00/sittingMoomin/LODs/sittingMoomin_LOD1.usda','c0e55d851ea64aa4aeec27c29594a555',NULL,'YCF5eRc1MtIR_sT2RUlIt1IrC7Fz4STb',NULL);
INSERT INTO `library_sublayer` VALUES ('d5cb903d28c34d638da5d81508db34fd','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/logSteps/contrib/material/default/texture/default.png','bcb688a70758427fbb7e23d1ed9d756e',NULL,'DZ1wF0cf1dGhf_2_dhstfNXf7t6aGFiy',NULL);
INSERT INTO `library_sublayer` VALUES ('d5fae96fc875487e961a722f2bd9b424','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/lockedBox/contrib/material/default/texture/default.png','6ab7f53a7daf46a2ac8a83abcc89ecf9',NULL,'hh4xqtkOHTBKOeL5C2Xjuxl.90cKYDPD',NULL);
INSERT INTO `library_sublayer` VALUES ('d60ce7d560e245fe8958628409c63313','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/asianGoldPieceContainer/contrib/material/default/material_default.usda','a8e9675b3e2a4a63b73c6d1fd34ca0e0',NULL,'6xXrRmopCKjKe7ovuv2pTjWLweB5D4he',NULL);
INSERT INTO `library_sublayer` VALUES ('d655014042bd41e78de02759d872585d','05.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/vintageLamp/contrib/geometry/bbox/geometry_bbox.usda','c4449799e71a4ce88999ea44a86e067b',NULL,'qPuutIfjuJMXapYcR5x7M2Yk882xZ4bP',NULL);
INSERT INTO `library_sublayer` VALUES ('d6759ae40b554ebebdba68b2665b9419','04.00.00','penTablet.usda','usd-asset-versions-dump/2024-assets-acquisition/penTablet/penTablet.usda','db17d0c2030049769e1ba2ea54d86114',NULL,'YfEtPLC3q.8SuAr48U0ximqZ5_Ywk3D0',NULL);
INSERT INTO `library_sublayer` VALUES ('d6830930731a464a8c287b0a75db0a17','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/inkBottle/contrib/geometry/LOD0/geometry_LOD0.usda','ba022dd31fd0446a907529c711cea63f',NULL,'cNywf359aer1wJc_YwY6nmxZiENgHsVQ',NULL);
INSERT INTO `library_sublayer` VALUES ('d6bf37be1aad4d9cbcb99866101492c5','04.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/campfire/contrib/geometry/LOD0/geometry_LOD0.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'Wj2q389OICTtGhBHssyqKSiK.RXlkC5C',NULL);
INSERT INTO `library_sublayer` VALUES ('d6e20551ee4846f884ae03ff0ebbee13','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/candleGroup/contrib/material/material.usda','a1513d5dbdf7478aab3b4d659a3f5e74',NULL,'tO4uCZHyIOhkJ55UVopkrT4KoB9HX74m',NULL);
INSERT INTO `library_sublayer` VALUES ('d74cd4a159be40199647177ff19366fb','02.00.00','cafeTable_LOD2.usda','usd-asset-versions-dump/2025-assets-02.00.00/cafeTable/LODs/cafeTable_LOD2.usda','579fe0bad3f84b7babc143ab2952234e',NULL,'mLTtAtafTntZ3SVOzwNbb71pah2pWrRp',NULL);
INSERT INTO `library_sublayer` VALUES ('d77b3bdce4b44808b44af6b5c2ef1835','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/bookshelf1/contrib/geometry/LOD0/geometry_LOD0.usda','f3a014272b104716a4e1296a4dcf4404',NULL,'3ZTneWpPbxxzhIvXa0FQjn6sE1OM94mp',NULL);
INSERT INTO `library_sublayer` VALUES ('d7c7b08bc5a14412baa4adb322752bad','04.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/teapot/contrib/geometry/geometry.usda','f5e189a845fb4ed3930a81263a21bf99',NULL,'j8ThxR7eUDGNtzOIfKCOhdmgMq23ZBHn',NULL);
INSERT INTO `library_sublayer` VALUES ('d7f256426dd64b87a1e2a352454370f3','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/bookStack3/contrib/.thumbs/thumbnail.png','077caad23bd4486b8fb066bf43d04761',NULL,'SnaH3mYk2jVcpGPKH1qRVRcqOfjII7bf',NULL);
INSERT INTO `library_sublayer` VALUES ('d80fdd2ab5914a619a5d29ea18b0ef6b','05.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/vintageLamp/contrib/geometry/LOD1/geometry_LOD1.usda','c4449799e71a4ce88999ea44a86e067b',NULL,'GWvF.h1PDwGFXDY7aJ320IG.IOiIwV3t',NULL);
INSERT INTO `library_sublayer` VALUES ('d85ea5535dc74f54a00b97099eab0d59','04.00.00','paniniPressLOD0.usda','usd-asset-versions-dump/2024-assets-acquisition/paniniPress/paniniPressLOD0.usda','3dcf8a1dac8242a59f83c50df682fb69',NULL,'IUrbny6FpFjixdphay2C2nKwlKcyPTAh',NULL);
INSERT INTO `library_sublayer` VALUES ('d95d9bcfe51346cd8d74fc653e4bc045','02.00.00','campfire.fbx','usd-asset-versions-dump/2025-assets-02.00.00/campfire/campfire.fbx','6f6441599cc045ae91530ecd6cc5a81e',NULL,'C7ZDSrTDvIwWNauLVOcWURlP.GMImw0g',NULL);
INSERT INTO `library_sublayer` VALUES ('d95f938025274163ab6043b215c25b6c','05.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/wineGlass/contrib/material/material.usda','31c39c346b394a1f90cf0a00f1c4a6ef',NULL,'fnZEBVFLvyNeH12.shXHKYs0KPAcjBZc',NULL);
INSERT INTO `library_sublayer` VALUES ('d97ac13cd4eb46c8a0b51613f24c06b5','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/oakTable/contrib/geometry/LOD2/geometry_LOD2.usda','3dfa350b0a294d7c9f1b419180d71748',NULL,'elnRxiqMb7cUA9cCM5NoCF6Ult8B3eVL',NULL);
INSERT INTO `library_sublayer` VALUES ('d98eeec6bc4644c5a1bdecc990e75e2b','03.00.00','teapot_model.usda','usd-asset-versions-dump/2024-assets-acquisition/flatTeapot/teapot_model.usda','3d283193f6b54cf0a233a5b83ed95819',NULL,'v56poV5whPtahF.bwe9vQ4S71hl.T5YZ',NULL);
INSERT INTO `library_sublayer` VALUES ('da479eef03bf4499a2cd98cfbcb99466','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/bookStack3/contrib/material/default/texture/default.png','077caad23bd4486b8fb066bf43d04761',NULL,'C0JaNupSsAXOMBSquW.25xiMU6Tavtfw',NULL);
INSERT INTO `library_sublayer` VALUES ('da66dbc1cd8e4ac0b85fd2a96b487645','02.00.00','teapot_LOD2.usda','usd-asset-versions-dump/2025-assets-02.00.00/teapot/LODs/teapot_LOD2.usda','f5e189a845fb4ed3930a81263a21bf99',NULL,'jpSaQggxCw.G6H5eoq0GOxpw5.LoiUZY',NULL);
INSERT INTO `library_sublayer` VALUES ('dae30cda23fc4f0d9b98b08fe6228a56','01.00.00','ladle.usda','cis-7000-usd-assets-versioned/Assets/ladle/ladle.usda','89dbc25b1e554c6eae3212cc3e28850c',NULL,'x.tbIE4WGczjN8j4Az2TkIq.qMvAsGbj',NULL);
INSERT INTO `library_sublayer` VALUES ('dbac904598904299aa68e4a4ec3dffae','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/glassJarEmpty/contrib/material/material.usda','6be75d74d18f4d88bc635b222107966f',NULL,'CVrcfAmIq8qpvfagbe8rxTFjRxVjFJav',NULL);
INSERT INTO `library_sublayer` VALUES ('dbdb1a48068d4cc5a143bc7f3078fedb','04.00.00','default.png','cis-7000-usd-assets-versioned/Assets/sittingMoomin/contrib/material/default/texture/default.png','c0e55d851ea64aa4aeec27c29594a555',NULL,'cU933erhrKsHEjYAIntLRNMMARvRxFbH',NULL);
INSERT INTO `library_sublayer` VALUES ('dbfa754930854ee992e6160567216e2a','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/makeupJar/contrib/geometry/LOD0/geometry_LOD0.usda','313b0aae14664f14b656d4d17478fbc3',NULL,'ihntT0qzVgH7WNiwPlOWqkUnvtP6OnMS',NULL);
INSERT INTO `library_sublayer` VALUES ('dc03bf330fda42e1ba5d6d82bc6f5ea6','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/makeupJar/contrib/geometry/LOD1/geometry_LOD1.usda','313b0aae14664f14b656d4d17478fbc3',NULL,'ZbEyZSLsOSeQKqUgSHjP4HzXmr3Jrf80',NULL);
INSERT INTO `library_sublayer` VALUES ('dd2270910972423998e272729d27c2ea','05.00.00','mug.usd','cis-7000-usd-assets-versioned/Assets/mug/mug.usd','5bac6ed09efe4816b7c427ffb08c599d',NULL,'U5Ut164BkJRlMNsFD6EhhA_E4Bm1IQgS',NULL);
INSERT INTO `library_sublayer` VALUES ('dd6ff87cd7644316945445ddc52b8fba','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/oakTable/contrib/geometry/LOD0/geometry_LOD0.usda','3dfa350b0a294d7c9f1b419180d71748',NULL,'iBqxk0FD0hWoqu3A5YbEFHi_bBqS.QPN',NULL);
INSERT INTO `library_sublayer` VALUES ('dd7a16bb1c144ae3a5bddd7dd9f66ec9','01.00.00','candle.usda','cis-7000-usd-assets-versioned/Assets/candle/candle.usda','f0941eb324214c48b9a0755db5eaf79b',NULL,'2Wrm4xKV5Lr1D4gv_t43CTl05_87E9rx',NULL);
INSERT INTO `library_sublayer` VALUES ('de1305464c324efb9ecda894b2f3c72f','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/glassJarFull/contrib/.thumbs/thumbnail.png','f3e934c53fa645b881d2e227e8eafaeb',NULL,'j9DiyB181tRmgElyuvyLjPtxqy5OCeT_',NULL);
INSERT INTO `library_sublayer` VALUES ('de264366c02042429cf2e68684930d31','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/bookshelf2/contrib/material/default/texture/default.png','39ab42636a0747ffa50446bcf4f57980',NULL,'GxNpjWQiyyWRbZiwfvl55o5EKXMYSwxk',NULL);
INSERT INTO `library_sublayer` VALUES ('de6ece2194cc48beb6a652ec27e5e8b1','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/medicineBottle/contrib/geometry/geometry.usda','8deb7dd1667c428b89933de25c02e4ce',NULL,'FaulahesPEV0.UYZ8d_n24bVoRMULJAi',NULL);
INSERT INTO `library_sublayer` VALUES ('de9360ed2d004c1a88159ac618b092a7','03.00.00','yugiohClockArc.fbx','usd-asset-versions-dump/2025-assets-03.00.00/yugiohClockArc/yugiohClockArc.fbx','4be817e19e11426ebeede52145732e77',NULL,'UUsguJ_9G9MYOo3gbZ2s0sNQVdCoWeIR',NULL);
INSERT INTO `library_sublayer` VALUES ('dfcf569029434f74ae3a40d9f6d36ae7','05.00.00','vintageLamp.usd','cis-7000-usd-assets-versioned/Assets/vintageLamp/vintageLamp.usd','c4449799e71a4ce88999ea44a86e067b',NULL,'USkcZ7GizkoiZwLmsPGGpcGvJLA.WhO_',NULL);
INSERT INTO `library_sublayer` VALUES ('dffa7bea3c144b4d92e0bd4f3a456257','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/largePottedPlant/contrib/material/material.usda','cc9847c9e64a4341bd8287edf73afe04',NULL,'11x_H8wyaeejDabP3XTGnqZuafzIjR5n',NULL);
INSERT INTO `library_sublayer` VALUES ('e019e40f07f9468f99009971293f9b06','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/drawerAssembly/contrib/geometry/bbox/geometry_bbox.usda','2652016a66e647f2bb874058b4d7e13c',NULL,'5jcA1kOIyMRI97Ss8poXP90M5yl_tPoQ',NULL);
INSERT INTO `library_sublayer` VALUES ('e06c9c73b90a41989214ac5adfd2b342','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/leafyVegetation/contrib/geometry/bbox/geometry_bbox.usda','bc9563cab790436abc6180a53087ad1a',NULL,'96tVNOFOg1VL2ooJA7mx8A.rE2dCpi0m',NULL);
INSERT INTO `library_sublayer` VALUES ('e0758d051bad453286bb0e8631b2ef05','02.00.00','skateboard_LOD0.usda','usd-asset-versions-dump/2025-assets-02.00.00/skateboard/LODs/skateboard_LOD0.usda','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'I3s.0k6TG7ZZdyXcvNltfHeKoNjfEXTt',NULL);
INSERT INTO `library_sublayer` VALUES ('e077a06a0f76426681bbb4cf75b9a50b','05.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/mug/contrib/material/material.usda','5bac6ed09efe4816b7c427ffb08c599d',NULL,'EtYm_TZhYwao0c6hJ1jZgjoQJ6mBhjs0',NULL);
INSERT INTO `library_sublayer` VALUES ('e09038341f53406fbe41dedd8e6874d8','03.00.00','parkBench_LOD1.usda','usd-asset-versions-dump/2025-assets-03.00.00/parkBench/LODs/parkBench_LOD1.usda','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'QaUdiyHPGKZrp6EcFW9.xbHUHYwGVftc',NULL);
INSERT INTO `library_sublayer` VALUES ('e0dd7ace2dc5410fb4b83b2f369a7ac4','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/candle/contrib/geometry/LOD1/geometry_LOD1.usda','f0941eb324214c48b9a0755db5eaf79b',NULL,'RRyUTswoJibAtKWnQZvh.uWPUK5Fi4O0',NULL);
INSERT INTO `library_sublayer` VALUES ('e1c9c9e2ef4345dd9e1b36db525ae4a9','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/bambooLadder/contrib/geometry/LOD2/geometry_LOD2.usda','f148935dbe764e648b2641d5ddcde381',NULL,'jU.q3TTdiFkWYU6siT9J6WnS6rn6Sucv',NULL);
INSERT INTO `library_sublayer` VALUES ('e2392ee6dfa94cddb369bb9668864cca','01.00.00','doubleScrollDrawer.glb','cis-7000-usd-assets-versioned/Assets/doubleScrollDrawer/contrib/.cache/doubleScrollDrawer.glb','d189b8bcea4e4e289d133f6fdfe25d8b',NULL,'qC7CwvENz674nG5kgQgzxZio9ftypFUO',NULL);
INSERT INTO `library_sublayer` VALUES ('e2649814552c47b280d1ff0d03b06c93','02.00.00','cartoonFish_LOD0.usda','usd-asset-versions-dump/2025-assets-02.00.00/cartoonFish/LODs/cartoonFish_LOD0.usda','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'5du4vSK8IjlBqZZDsN7.PeHGQT0slIAN',NULL);
INSERT INTO `library_sublayer` VALUES ('e268d3bb61ac4426af66f4e625638f26','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/bookshelf3/contrib/geometry/bbox/geometry_bbox.usda','fa5e37ee437e45acb2ae0c3c9c725b83',NULL,'tEY_AJwxbTAn5Art44o.NK6HuKvXB1xj',NULL);
INSERT INTO `library_sublayer` VALUES ('e2b13c8227264e9d8a43628b54890b51','01.00.00','glassJarFull.glb','cis-7000-usd-assets-versioned/Assets/glassJarFull/contrib/.cache/glassJarFull.glb','f3e934c53fa645b881d2e227e8eafaeb',NULL,'q0Ocz4E0OcY1Xsnu4VJxBAwNpYDSNA9g',NULL);
INSERT INTO `library_sublayer` VALUES ('e325d98e9e8644ecb1d99cdca051dd76','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/medicineBottle/contrib/material/default/texture/default.png','8deb7dd1667c428b89933de25c02e4ce',NULL,'3qIAEcvbDw0Wlbre4rv_Mtq6cDeIobIG',NULL);
INSERT INTO `library_sublayer` VALUES ('e35a85d19b3d459ba371e54344f616d1','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/blueJello/contrib/material/default/material_default.usda','3d6b8007d30e4919a46deedb6dfce573',NULL,'cckCDonnK9RrT55HLxn6GOwB7l84yCx1',NULL);
INSERT INTO `library_sublayer` VALUES ('e39b8f69f71b41a7a84c46ebfe297af9','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/doubleScrollDrawer/contrib/geometry/LOD2/geometry_LOD2.usda','d189b8bcea4e4e289d133f6fdfe25d8b',NULL,'QB5iwyQB4sHguwvd1yZML2PdpcBpdudX',NULL);
INSERT INTO `library_sublayer` VALUES ('e3f453bee0e84edc8a9fd5aba678abc2','02.00.00','yellowDuck_LOD1.usda','usd-asset-versions-dump/2025-assets-02.00.00/yellowDuck/LODs/yellowDuck_LOD1.usda','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'HRN6a8z4KH_ypvCzJCCu3PdJU1PmL4b0',NULL);
INSERT INTO `library_sublayer` VALUES ('e3f6397b989943a3a88f7ecd429cb2bc','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/bluePillow/contrib/material/material.usda','81cdcad6e58a448b8dad18e4d311b5f1',NULL,'6HyZmvh8nxIyZnvUTXrOWeFCedwk1Y4O',NULL);
INSERT INTO `library_sublayer` VALUES ('e425e4269bc647fa91b8dd7888d57773','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/drawerAssembly/contrib/geometry/LOD1/geometry_LOD1.usda','2652016a66e647f2bb874058b4d7e13c',NULL,'pjbEeIjbpe1RUcIePEt0yRPPyQnhBnpi',NULL);
INSERT INTO `library_sublayer` VALUES ('e4c5979769e14768aa03a5dec9649cf6','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/elavatedLogPlatform/contrib/material/default/texture/default.png','a69b43a2c8ba44a499e7f698f736e60b',NULL,'j0wVI6aMiTauS_qMZyDaosYLkz1Kaqim',NULL);
INSERT INTO `library_sublayer` VALUES ('e5cc85133b7b49f397bef5e7d8e6f588','05.00.00','metadata.json','usd-asset-versions-dump/2024-assets-acquisition/kitchenaid/metadata.json','66b74b32abd8459cbe41f434285a7691',NULL,'eVBBC3gPh939UsHPr.bEfaTNc0bf1xpc',NULL);
INSERT INTO `library_sublayer` VALUES ('e6103071725c4141bfe640313a04268d','03.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-03.00.00/parkBench/thumbnail.png','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'fEdFgtAu8.8J3kRp8nN6ov_I4YMDAuwu',NULL);
INSERT INTO `library_sublayer` VALUES ('e615adae1f8e4273a2ab9516896269a1','04.00.00','oldTelevisionLOD2.usda','usd-asset-versions-dump/2024-assets-acquisition/oldTelevision/oldTelevisionLOD2.usda','b6234f0922c94798ba12257342157faa',NULL,'zGYR6_dSso3GUWzy9j0rasqMYagFJJjq',NULL);
INSERT INTO `library_sublayer` VALUES ('e624dbe3f7b341b7baca810208f182b8','03.00.00','beegCrab.usda','usd-asset-versions-dump/2025-assets-03.00.00/beegCrab/beegCrab.usda','f175fbe4933944a69d06e86c906622d6',NULL,'FOILIWpvWx0JrNNMT2H.9HCRBs4y5Jtv',NULL);
INSERT INTO `library_sublayer` VALUES ('e63a4765ed6f4e0a936172d17101dd7e','04.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/bookStack/contrib/geometry/geometry.usda','082f328bf76a4d48be255c620a8cd280',NULL,'TzmO6SeaM1KFbdN1oFbmqX_mLhg_J1Zq',NULL);
INSERT INTO `library_sublayer` VALUES ('e66ef97a956a48ab965ee7398f490d2a','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/doubleScrollDrawer/contrib/material/material.usda','d189b8bcea4e4e289d133f6fdfe25d8b',NULL,'U6O_IP15QJ_WpioaFy7MvtYnVksySeK1',NULL);
INSERT INTO `library_sublayer` VALUES ('e67c3689d9d14b11b19dcfd880204951','06.00.00','default.png','cis-7000-usd-assets-versioned/Assets/kitchenaid/contrib/material/default/texture/default.png','66b74b32abd8459cbe41f434285a7691',NULL,'N9mmeKe799LXk48Wo5IsxFluLHAydJhS',NULL);
INSERT INTO `library_sublayer` VALUES ('e699b2a7a9f6487db0a116dd89895b23','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/drinkingHorns/contrib/geometry/LOD2/geometry_LOD2.usda','c5f39a998aec42cc8396f2ff23cbb375',NULL,'oMm3A8bRS6RHjuExaGWn0PbgwdDh7jJD',NULL);
INSERT INTO `library_sublayer` VALUES ('e6c53af2df0d41018c6e756101bd3eef','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/bulbousInkJar/contrib/geometry/bbox/geometry_bbox.usda','d9782679927741a6b9b9449b3054ff77',NULL,'GT9HBJA174hdaoeGB8c_7RIcIS2qtq6C',NULL);
INSERT INTO `library_sublayer` VALUES ('e71aeb471e274ad79fee0e33d0a60911','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/bluePillow/contrib/material/default/material_default.usda','81cdcad6e58a448b8dad18e4d311b5f1',NULL,'q9A6pAXz77mccTz3y__OvcghxSJMrXfN',NULL);
INSERT INTO `library_sublayer` VALUES ('e71e0cdc8c7c4f3bb1f411e035b9fe80','05.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/carrot/contrib/geometry/LOD0/geometry_LOD0.usda','6188a79945fa415f906a1c6463a497eb',NULL,'gjPMZF8ltngwWIANAoZmvuKqaIt.G0sp',NULL);
INSERT INTO `library_sublayer` VALUES ('e72dc3973fdf4ecb8c23d6a2306ccfe2','01.00.00','bookStack5.usda','cis-7000-usd-assets-versioned/Assets/bookStack5/bookStack5.usda','fa20ba6a205e4d2b951f8262bf5b2802',NULL,'A5dEdZB9xmlHYwN3JyO3GL5lXElBTFdm',NULL);
INSERT INTO `library_sublayer` VALUES ('e7371595f5d04257bdfbe3f8fdd3a91c','04.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/skateboard/contrib/material/default/material_default.usda','63cd5d6f9e9243fd9a6276093c547cf7',NULL,'ddLj26IayU_tyd_ezD3QlIKeFmoye5cV',NULL);
INSERT INTO `library_sublayer` VALUES ('e74d5ffb4ae849508b759b5c19f71303','03.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-03.00.00/cartoonFish/thumbnail.png','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'nXghu9YiQj0TZF0N7mwWGOJ.w.wbc9Tr',NULL);
INSERT INTO `library_sublayer` VALUES ('e77999b583304a60a647aa73549d1e92','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/bookStack6/contrib/material/default/texture/default.png','3684e1145a004e7987f06b8c071166a1',NULL,'KWVWQssEtSdC4qByfctsn6KlAzvyZerz',NULL);
INSERT INTO `library_sublayer` VALUES ('e7b518d92dfb491c9f0dc2505f02a768','03.00.00','metadata.json','usd-asset-versions-dump/2025-assets-03.00.00/campfire/metadata.json','6f6441599cc045ae91530ecd6cc5a81e',NULL,'zALadUO38U5UAy.EGpcvT7vV3GLScW_P',NULL);
INSERT INTO `library_sublayer` VALUES ('e7fc73d8e937423ca488daa1b7b43b13','04.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/yellowDuck/contrib/.thumbs/thumbnail.png','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'UYEH91diGwYhh8zpzwsZlIWqAgbqDngJ',NULL);
INSERT INTO `library_sublayer` VALUES ('e875aaafec874e149484dd7a2e58ebad','01.00.00','parkBench.fbx','usd-asset-versions-dump/2025-assets-01.00.00/parkBench/parkBench.fbx','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'Z2PEBCPpfYd6EEiKIqiaivE4MMiBJ4nK',NULL);
INSERT INTO `library_sublayer` VALUES ('e8b3f320352041be9c563655a7fe764d','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/cherryTable/contrib/geometry/LOD0/geometry_LOD0.usda','824b428456c148abb25d24568d649441',NULL,'teyLW9lKqO1TOhf9XM0K9NRBx_eUzL6o',NULL);
INSERT INTO `library_sublayer` VALUES ('e8c72ae68a444c66bbf8630239033028','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/ladle/contrib/geometry/LOD0/geometry_LOD0.usda','89dbc25b1e554c6eae3212cc3e28850c',NULL,'V4rm0K5wgtf9xQIzxw0c1_D_7FjqKOW1',NULL);
INSERT INTO `library_sublayer` VALUES ('e915918ec6304bf18889369dceee7f19','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/blueJello/contrib/.thumbs/thumbnail.png','3d6b8007d30e4919a46deedb6dfce573',NULL,'GvFhB1XyWzibMJe9O_ZHVNekC.yhgumR',NULL);
INSERT INTO `library_sublayer` VALUES ('e9363f51da0d4035a3ba62e7d5e11f8a','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/goPieceJar/contrib/material/material.usda','65cb65e774ab4a4795d18ff514a071d9',NULL,'YGyOvNaXW59bMY1mAVjYplU7FNmkEVCW',NULL);
INSERT INTO `library_sublayer` VALUES ('e9793d8b4198450dbb61673e79132218','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/cashRegister/contrib/geometry/LOD2/geometry_LOD2.usda','ca9ae1e89e6145bea24272531dcfbe27',NULL,'psp5c44KkXMGg5o9vWBbj5VY8WPfGap4',NULL);
INSERT INTO `library_sublayer` VALUES ('ea0c16df7d57432b8ea506c0a2501ecb','04.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/cafeTable/contrib/geometry/LOD0/geometry_LOD0.usda','579fe0bad3f84b7babc143ab2952234e',NULL,'Y9s2vnZt494VW650YEghwVIaU_O4ivDb',NULL);
INSERT INTO `library_sublayer` VALUES ('ea78421d7b294325a2a40c75695b06ca','01.00.00','metadata.json','usd-asset-versions-dump/2025-assets-01.00.00/sittingMoomin/metadata.json','c0e55d851ea64aa4aeec27c29594a555',NULL,'_mjQY5ErMSgwW5WWSVPDseTkyagaIcOi',NULL);
INSERT INTO `library_sublayer` VALUES ('ea96ca421cbd4e94ba801a458f9a02c2','01.00.00','logSteps.glb','cis-7000-usd-assets-versioned/Assets/logSteps/contrib/.cache/logSteps.glb','bcb688a70758427fbb7e23d1ed9d756e',NULL,'hXQjtlpM6j88LI3f2n3K0aTqHOkmcqyh',NULL);
INSERT INTO `library_sublayer` VALUES ('eaa5f6fa94fe4eadbaa173a8615314c5','04.00.00','penTablet_material.usda','usd-asset-versions-dump/2024-assets-acquisition/penTablet/penTablet_material.usda','db17d0c2030049769e1ba2ea54d86114',NULL,'i0de79Nup3e62mxuN.T9kI8.I.eESLaU',NULL);
INSERT INTO `library_sublayer` VALUES ('eaa82bc3155e405c9fa24a1c67a8f3aa','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/boneBox/contrib/material/default/material_default.usda','993f2365ed5446068f9eb0e6c21a8e9c',NULL,'qfahG3OYmWZ85nQxOpG2wXY2nBgK6Uwl',NULL);
INSERT INTO `library_sublayer` VALUES ('eace414f2b544d96a09a06802eb02128','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/jelloShelf/contrib/geometry/LOD2/geometry_LOD2.usda','99f5e6f9675b41ed91e76daebb016c4a',NULL,'dx7mDK0HnaWfq771S2GwN1CfObp6Qvj5',NULL);
INSERT INTO `library_sublayer` VALUES ('eafb2bd22ca7456d8994e0f2320daf02','04.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/yugiohClockArc/contrib/geometry/LOD2/geometry_LOD2.usda','4be817e19e11426ebeede52145732e77',NULL,'d3WvYnUn9jEuUHNKin5uQy027i5F5E9L',NULL);
INSERT INTO `library_sublayer` VALUES ('eb4103efdf014445861e591703c7394f','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/alchemistRoomWalls/contrib/material/material.usda','ed516f0180c84489b7cd35f892c8e438',NULL,'NKubFeBmToxurcD5svdIOiNohLkiJiPG',NULL);
INSERT INTO `library_sublayer` VALUES ('eb67ebb9c59d4bb288410d8cdb3b8f20','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/hangingGinger/contrib/geometry/LOD1/geometry_LOD1.usda','7b333698a6b74e45a24e2e642b55d1dd',NULL,'ptRNLDEwF6fiDfWOlrxXCsJPAL.xH4Ih',NULL);
INSERT INTO `library_sublayer` VALUES ('eb6b5e94360d408a8ff71cb3c5af5856','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/bambooLadder/contrib/geometry/geometry.usda','f148935dbe764e648b2641d5ddcde381',NULL,'NvpzSKhjA8nYqAd7FzaBUp2Njyuq5po9',NULL);
INSERT INTO `library_sublayer` VALUES ('ec682351cd1d486dbd7f4962a7ba9a21','04.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/yugiohClockArc/contrib/material/default/material_default.usda','4be817e19e11426ebeede52145732e77',NULL,'6ZKrw48V.zNFrRKM37b_7Cjtc8zCJ5..',NULL);
INSERT INTO `library_sublayer` VALUES ('ec7ac7049638460d892800d69cf15a18','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/barrel/contrib/geometry/LOD2/geometry_LOD2.usda','21ff4cfc83b0435a91b2404af9477d51',NULL,'rIxruhBF_Dn8N_l2bzXPjT.N9HI4Ivpi',NULL);
INSERT INTO `library_sublayer` VALUES ('ec9c6a0594304635a028980dd6eb9745','04.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/bookStack/contrib/geometry/LOD1/geometry_LOD1.usda','082f328bf76a4d48be255c620a8cd280',NULL,'HJZ8cDhx26uHjUy9wX0jFZaacRf9XbIJ',NULL);
INSERT INTO `library_sublayer` VALUES ('ed1fafd8727d4fd3a74e376fe820923a','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/leafyVegetation/contrib/geometry/LOD2/geometry_LOD2.usda','bc9563cab790436abc6180a53087ad1a',NULL,'qNLAtZT8Uf2u_vgx_j4lz1kvX2YvfbQR',NULL);
INSERT INTO `library_sublayer` VALUES ('ed2b1e16b09f429fa770dbcd7bf56c9d','04.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/cartoonFish/contrib/material/material.usda','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'hGdG4sxajyGC4Mhuswg1gk1D0ZRJ3hn1',NULL);
INSERT INTO `library_sublayer` VALUES ('ed40ce249737478895e91942a8bfd0f2','01.00.00','boneBox.usda','cis-7000-usd-assets-versioned/Assets/boneBox/boneBox.usda','993f2365ed5446068f9eb0e6c21a8e9c',NULL,'MPC_obnZ.vz8MkHqgriikjKqh9jrxU6f',NULL);
INSERT INTO `library_sublayer` VALUES ('ed50dbba724c49708c0a45534ec38202','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/jelloShelf/contrib/geometry/LOD0/geometry_LOD0.usda','99f5e6f9675b41ed91e76daebb016c4a',NULL,'FKP7iWAQ.LSLWmtRz7rLQ4enWsEYxvqL',NULL);
INSERT INTO `library_sublayer` VALUES ('ed575d7777f347769d5f1cfc64532bac','04.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/beegCrab/contrib/material/default/material_default.usda','f175fbe4933944a69d06e86c906622d6',NULL,'qQ1LRIJDfC745NzAMRMnBM2smzqj6zud',NULL);
INSERT INTO `library_sublayer` VALUES ('ed5e2fa3588f403d8dbca6a533c0bf32','03.00.00','beegCrab_LOD0.usda','usd-asset-versions-dump/2025-assets-03.00.00/beegCrab/LODs/beegCrab_LOD0.usda','f175fbe4933944a69d06e86c906622d6',NULL,'odVEBeoZ2HdGhqRc9rB2n.7qZ9UBoBBT',NULL);
INSERT INTO `library_sublayer` VALUES ('ed8fa8db99b943a5ad34851fb5c2454f','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/medicineBottle/contrib/geometry/LOD2/geometry_LOD2.usda','8deb7dd1667c428b89933de25c02e4ce',NULL,'H5riUqZKSltcJrQPmD32ThbGVabESvVG',NULL);
INSERT INTO `library_sublayer` VALUES ('ed8fc609bcc74e4285677e3b1195408d','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/drinkingHorns/contrib/geometry/LOD1/geometry_LOD1.usda','c5f39a998aec42cc8396f2ff23cbb375',NULL,'EBmSCucpJKXTQ.HbH_NIXLeK9m9oHqnD',NULL);
INSERT INTO `library_sublayer` VALUES ('ee53e80a2bbe464bb6b8beddeebff38d','01.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/hangingGinger/contrib/geometry/LOD0/geometry_LOD0.usda','7b333698a6b74e45a24e2e642b55d1dd',NULL,'oOz6TE6fTl1mQLzwuM.6t7_sV9uOd9_5',NULL);
INSERT INTO `library_sublayer` VALUES ('ee6af650b7674010bd8163aec0c365c5','04.00.00','default.png','cis-7000-usd-assets-versioned/Assets/yugiohClockArc/contrib/material/default/texture/default.png','4be817e19e11426ebeede52145732e77',NULL,'uPgh42tTETXSZ.K.dIgsCr6ul2DawDNU',NULL);
INSERT INTO `library_sublayer` VALUES ('ee8c2c296c9d4bd7b37632509b0922ba','03.00.00','campfire_LOD1.usda','usd-asset-versions-dump/2025-assets-03.00.00/campfire/LODs/campfire_LOD1.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'Sq.kEMerwmdfNAWbrq5ql._MKQvYsR74',NULL);
INSERT INTO `library_sublayer` VALUES ('ee9209c1333c4e63bd767b44c9f99606','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/bookStack2/contrib/geometry/geometry.usda','76e5d476ecc44eeea6da09806954f8bd',NULL,'S5kpXwOSPAMuUExM6ArfAulfRKSKFOko',NULL);
INSERT INTO `library_sublayer` VALUES ('eee5e0dff33941d48933cb6e4998d1ef','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/glassJarFull/contrib/geometry/geometry.usda','f3e934c53fa645b881d2e227e8eafaeb',NULL,'be1phzUNCzj_F6t1aYiFZMNt91818IJs',NULL);
INSERT INTO `library_sublayer` VALUES ('ef2d70c7134544a5ac3fbdd85c53048a','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/glassJarEmpty/contrib/geometry/LOD1/geometry_LOD1.usda','6be75d74d18f4d88bc635b222107966f',NULL,'_FsCeTqJ3yxCk0ZlLWUWf050nswtuHtQ',NULL);
INSERT INTO `library_sublayer` VALUES ('ef3595c308144eeeaf8155763abde9f8','05.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/oldTelevision/contrib/geometry/bbox/geometry_bbox.usda','b6234f0922c94798ba12257342157faa',NULL,'4yuYq8QiBYpzPSZhFbO0YKiFwAsVqtG5',NULL);
INSERT INTO `library_sublayer` VALUES ('ef3770bdb9bc4e29b21e142a1424f995','04.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/bookStack/contrib/.thumbs/thumbnail.png','082f328bf76a4d48be255c620a8cd280',NULL,'WSGLaWaqgju2AGBILZBxsdf5ejHmxdMp',NULL);
INSERT INTO `library_sublayer` VALUES ('ef3ec2d02bdb433eb561af585800616d','04.00.00','teapot.usd','cis-7000-usd-assets-versioned/Assets/teapot/teapot.usd','f5e189a845fb4ed3930a81263a21bf99',NULL,'haucTJYMaOd_9AggUDodNf_JJoW3TMdi',NULL);
INSERT INTO `library_sublayer` VALUES ('efa1f79f98914b9aa9cf923f5688444f','01.00.00','metadata.json','usd-asset-versions-dump/2025-assets-01.00.00/parkBench/metadata.json','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'FEkPV9zSrU6sNt7HiPeuOBh63RC8tooC',NULL);
INSERT INTO `library_sublayer` VALUES ('efb956ed34b24072aaafce9658041d12','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/boneBox/contrib/geometry/bbox/geometry_bbox.usda','993f2365ed5446068f9eb0e6c21a8e9c',NULL,'cwKzDOKDuc1Uov8Fn0pdZvM5gLPHI_ZG',NULL);
INSERT INTO `library_sublayer` VALUES ('f00554b692884d969c5350100c950009','02.00.00','sittingMoomin_LOD2.usda','usd-asset-versions-dump/2025-assets-02.00.00/sittingMoomin/LODs/sittingMoomin_LOD2.usda','c0e55d851ea64aa4aeec27c29594a555',NULL,'ncgjhjzv9GNyJOKgo_WPQRfomqF1LrxB',NULL);
INSERT INTO `library_sublayer` VALUES ('f03a775e84a6475591703dc5c19ff311','04.00.00','default.png','cis-7000-usd-assets-versioned/Assets/yellowDuck/contrib/material/default/texture/default.png','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'R_KPwkE3S7xc82IPhuCFty.nKU1R0giP',NULL);
INSERT INTO `library_sublayer` VALUES ('f08eff053ca043fb96887f69a3ce6b05','03.00.00','bookStack.usda','usd-asset-versions-dump/2025-assets-03.00.00/bookStack/bookStack.usda','082f328bf76a4d48be255c620a8cd280',NULL,'0gBZoIEk_gYhG3X_u_Ss75RrIoBxnm6e',NULL);
INSERT INTO `library_sublayer` VALUES ('f0b0cf8d14034b64ad9ca7b32b1469b4','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/goPieceJar/contrib/.thumbs/thumbnail.png','65cb65e774ab4a4795d18ff514a071d9',NULL,'ou3Rsk41IkBP3.5g26uztB5QqZWZmToR',NULL);
INSERT INTO `library_sublayer` VALUES ('f0b4445067fb44e1b756d51e52e3a34f','01.00.00','bambooContainer.glb','cis-7000-usd-assets-versioned/Assets/bambooContainer/contrib/.cache/bambooContainer.glb','1c7130d2d78e49d990ba12cde563e7c3',NULL,'Qg0vTknd5.ZXQ8b0OJkDxfhOBWS_zLLp',NULL);
INSERT INTO `library_sublayer` VALUES ('f0b99584108241da9c949e36b31718db','01.00.00','largeCherryTable.glb','cis-7000-usd-assets-versioned/Assets/largeCherryTable/contrib/.cache/largeCherryTable.glb','b24acc08b15546e896c3e25add15f1ba',NULL,'3LEfQAJWuV3RnMtHRcq1_vOteH7ab4q_',NULL);
INSERT INTO `library_sublayer` VALUES ('f0bf4053c7bc4d08a2ac0cb762d6050e','01.00.00','makeupContainers.glb','cis-7000-usd-assets-versioned/Assets/makeupContainers/contrib/.cache/makeupContainers.glb','6bc90b076ae74ab9842a07913f22e681',NULL,'MTXxAfSJU4Efe0rbNusRxkGSqhhP2ikN',NULL);
INSERT INTO `library_sublayer` VALUES ('f11847db15de4ae69fe1d1067c836240','04.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/campfire/contrib/geometry/bbox/geometry_bbox.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'MNkLU6vBLmg48sMo_PsCyN7g4ie8_XNY',NULL);
INSERT INTO `library_sublayer` VALUES ('f1190e8126c749079014dfead0e35d47','05.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/campfire/contrib/geometry/LOD2/geometry_LOD2.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'9ARxC6E1mcbZdvkASp.5EibsiGQxhhoI',NULL);
INSERT INTO `library_sublayer` VALUES ('f12b527b7f244bec8e125d4f399415bd','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/hangingGinger/contrib/material/default/texture/default.png','7b333698a6b74e45a24e2e642b55d1dd',NULL,'Q8nvj.TGl8lDInDgAa.ZFRVNvt5Klmmd',NULL);
INSERT INTO `library_sublayer` VALUES ('f1b8bfb6ae894763b0c9627a5dee83e8','04.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/campfire/contrib/geometry/LOD1/geometry_LOD1.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'q.3CqAn7RI11JTR5L6sWNXWLAUO2UiG7',NULL);
INSERT INTO `library_sublayer` VALUES ('f252d3b19aa14962b7d80b6aeafb3303','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/drawerAssembly/contrib/material/default/material_default.usda','2652016a66e647f2bb874058b4d7e13c',NULL,'PJtWt.0fLWTPffexrDhPOJbP6yYU3C.A',NULL);
INSERT INTO `library_sublayer` VALUES ('f277b8bacbe04020aa1ecfe4548d64e4','01.00.00','inkBottle.usda','cis-7000-usd-assets-versioned/Assets/inkBottle/inkBottle.usda','ba022dd31fd0446a907529c711cea63f',NULL,'1LVOXngAmCu5H7YbhMeex9dqtzmXexGH',NULL);
INSERT INTO `library_sublayer` VALUES ('f288b5f24de4418ba51a0231578e08e4','03.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-03.00.00/yellowDuck/thumbnail.png','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'3iPm9krmAWR_dpoX02m_FJHIPc2eVT7S',NULL);
INSERT INTO `library_sublayer` VALUES ('f28d9d926ded4b7ea52c1b8a4b981c0e','06.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/kitchenaid/contrib/geometry/bbox/geometry_bbox.usda','66b74b32abd8459cbe41f434285a7691',NULL,'4cAehokgmOTGuZHRAYClJK1gTL9SUYHk',NULL);
INSERT INTO `library_sublayer` VALUES ('f29a26c3a937455da07a17acf3670830','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/bookshelf2/contrib/geometry/bbox/geometry_bbox.usda','39ab42636a0747ffa50446bcf4f57980',NULL,'7jKloqCbsTfWC_eOrLw8reN6fEoqnnDq',NULL);
INSERT INTO `library_sublayer` VALUES ('f2b18a7e57ce4302b513e0de4d0cf209','04.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/bookStack/contrib/geometry/bbox/geometry_bbox.usda','082f328bf76a4d48be255c620a8cd280',NULL,'6uOpeFKr8LqFuol9KcsDqpag1hidw7ay',NULL);
INSERT INTO `library_sublayer` VALUES ('f2dc26a5265e48d49bcbeff3811384a5','01.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/logSteps/contrib/geometry/LOD2/geometry_LOD2.usda','bcb688a70758427fbb7e23d1ed9d756e',NULL,'ERRJXDD7GCzcXW3XS2wAdg2XYoP.AWOE',NULL);
INSERT INTO `library_sublayer` VALUES ('f326d3b9d5034fce8d24d6fd2f6cc6f0','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/bluePillow/contrib/material/default/texture/default.png','81cdcad6e58a448b8dad18e4d311b5f1',NULL,'fikDWAneINxVR8k78coj4KdaA2TPFXA4',NULL);
INSERT INTO `library_sublayer` VALUES ('f351626e2e2940e0bc11adf3c83d61bc','04.00.00','geometry_LOD2.usda','cis-7000-usd-assets-versioned/Assets/campfire/contrib/geometry/LOD2/geometry_LOD2.usda','6f6441599cc045ae91530ecd6cc5a81e',NULL,'PNVauLZll9mAoBdJRmEg7h1Z2Ti69i7k',NULL);
INSERT INTO `library_sublayer` VALUES ('f35b68efd97d4747a1fcc83fadeb699f','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/bambooContainer/contrib/geometry/geometry.usda','1c7130d2d78e49d990ba12cde563e7c3',NULL,'xP65g5ts5PoOx_AqMPCzizzOyz6QbMCG',NULL);
INSERT INTO `library_sublayer` VALUES ('f38bb7aee72f41a9871dafd164bb5f4c','05.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/wineGlass/contrib/geometry/LOD1/geometry_LOD1.usda','31c39c346b394a1f90cf0a00f1c4a6ef',NULL,'l7Mr6qBnmZLSWG22nO6LAl9n3yl0t8LJ',NULL);
INSERT INTO `library_sublayer` VALUES ('f3b20911dd514171aa913296b90726c3','03.00.00','teapot_LOD2.usda','usd-asset-versions-dump/2025-assets-03.00.00/teapot/LODs/teapot_LOD2.usda','f5e189a845fb4ed3930a81263a21bf99',NULL,'79mJ7x2dX7cUijXh7huwPVWK7bq_yi_e',NULL);
INSERT INTO `library_sublayer` VALUES ('f459c5f83b154a51907e26ed4a1141d8','04.00.00','vintageLamp_LOD1.usda','usd-asset-versions-dump/2025-assets-03.00.00/vintageLamp/LODs/vintageLamp_LOD1.usda','c4449799e71a4ce88999ea44a86e067b',NULL,'gm7c6EU4AoaY8SXCvngwYzOtJlEMKLOw',NULL);
INSERT INTO `library_sublayer` VALUES ('f489b40609f241609d313f59a3bd2be0','04.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/sittingMoomin/contrib/material/default/material_default.usda','c0e55d851ea64aa4aeec27c29594a555',NULL,'QINUJqFyu2xCWuglVjDm5l6AYjeK49uA',NULL);
INSERT INTO `library_sublayer` VALUES ('f4972b1dfbc049bb9fcb8180e0ee92b2','01.00.00','metadata.json','usd-asset-versions-dump/2025-assets-01.00.00/teapot/metadata.json','f5e189a845fb4ed3930a81263a21bf99',NULL,'kAAL3Lay_ASEuVZLHiPKTc8y4cSJv78U',NULL);
INSERT INTO `library_sublayer` VALUES ('f49d2e43251441b3b6276972d8504425','04.00.00','penTabletLOD1.usda','usd-asset-versions-dump/2024-assets-acquisition/penTablet/penTabletLOD1.usda','db17d0c2030049769e1ba2ea54d86114',NULL,'Ji7kAD4rZ1qrNJAbpwp7oKwp_.OwNyUz',NULL);
INSERT INTO `library_sublayer` VALUES ('f4c7d41169064909b45846b67d45cca5','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/blueJello/contrib/geometry/LOD1/geometry_LOD1.usda','3d6b8007d30e4919a46deedb6dfce573',NULL,'QmD5ZcZGLMh6o3eKxkCQTRmovmAOX0r6',NULL);
INSERT INTO `library_sublayer` VALUES ('f51225ee048b4dcd8bc3e3ec245c1605','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/lantern/contrib/.thumbs/thumbnail.png','10a15094d1dc45b7bcf8c698420b9e91',NULL,'2OHQ_IM4ur6K9ksTF0CpyjIfIaJSMnFX',NULL);
INSERT INTO `library_sublayer` VALUES ('f55c2b5e468246ea8463c4d24e4fb528','03.00.00','yellowDuck_LOD0.usda','usd-asset-versions-dump/2025-assets-03.00.00/yellowDuck/LODs/yellowDuck_LOD0.usda','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'Cy.AmDIbFExQINb4GG8gftbixbjErkuq',NULL);
INSERT INTO `library_sublayer` VALUES ('f55e093b65dc44cf80d2c6fb3138a0f3','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/boneBox/contrib/geometry/geometry.usda','993f2365ed5446068f9eb0e6c21a8e9c',NULL,'j_wdWLH0kq8FmzyIn6jM9ABAoZ0_tvez',NULL);
INSERT INTO `library_sublayer` VALUES ('f5876d2148b343abb7debb064f8a2331','02.00.00','metadata.json','usd-asset-versions-dump/2025-assets-02.00.00/cartoonFish/metadata.json','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'iTBZA7KsJrzqSYOxYidYEKVl3_Xa7r0V',NULL);
INSERT INTO `library_sublayer` VALUES ('f67679b483b24e9ca69f7943b2008fad','01.00.00','bustWearingHat.glb','cis-7000-usd-assets-versioned/Assets/bustWearingHat/contrib/.cache/bustWearingHat.glb','a94d3ddac1e64aff86cf5a194c50d8bf',NULL,'fH6LDdQqT4bjEol.lC68gfVqIfpBm2dZ',NULL);
INSERT INTO `library_sublayer` VALUES ('f682e6aa37ad4a30b8ec13716bcbb927','03.00.00','yellowDuck.usda','usd-asset-versions-dump/2025-assets-03.00.00/yellowDuck/yellowDuck.usda','39338164bc7f4fcaa1a14bc30beae3fe',NULL,'TXzx2CQNGi3ZAjYfHjIBbWL8dIPpzghH',NULL);
INSERT INTO `library_sublayer` VALUES ('f693ebbdaf954284bcd20d5b68e4cc2f','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/inkBottle/contrib/geometry/LOD1/geometry_LOD1.usda','ba022dd31fd0446a907529c711cea63f',NULL,'FPcguj_EOyNFfBHK2SH0ZYLpexYQ.gNA',NULL);
INSERT INTO `library_sublayer` VALUES ('f6fc431c912542a889e2562652393058','04.00.00','sushi_material.usda','usd-asset-versions-dump/2024-assets-acquisition/sushi/sushi_material.usda','2c7ef29f88474ded95eb449ebb264ead',NULL,'Vl36TaobWBwnwvzOHbkxcDUTkp8b7Qdj',NULL);
INSERT INTO `library_sublayer` VALUES ('f721d4d57f7344bcbe071582f332623d','04.00.00','default.png','cis-7000-usd-assets-versioned/Assets/pickleBarrels/contrib/material/default/texture/default.png','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'WCX1G460_jBSTsC6lpmD_zPw8.SMGLsA',NULL);
INSERT INTO `library_sublayer` VALUES ('f7e6e3a992414a17abb896af4d5d29b2','04.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/pickleBarrels/contrib/geometry/geometry.usda','a0d5c1f281f046cd9ff2287dfed6cd63',NULL,'c42QdK0QbIwzEqTO2y9pfOS4lpgi09Sq',NULL);
INSERT INTO `library_sublayer` VALUES ('f8123942dbb04f16b4f57299d9be43d3','01.00.00','jelloShelf.usda','cis-7000-usd-assets-versioned/Assets/jelloShelf/jelloShelf.usda','99f5e6f9675b41ed91e76daebb016c4a',NULL,'ordJMDk1PFt5N80UkQ1nQ9G3_fiBqU.M',NULL);
INSERT INTO `library_sublayer` VALUES ('f81db5ae4f4745318f53f03910016244','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/candleGroup/contrib/geometry/bbox/geometry_bbox.usda','a1513d5dbdf7478aab3b4d659a3f5e74',NULL,'AkH1SZakikbQdYwiABek4UNfijlnm51D',NULL);
INSERT INTO `library_sublayer` VALUES ('f83871010d1a4ac8a38348e10fd8f36b','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/bookStack4/contrib/geometry/geometry.usda','f1d3b419b0444e58a2e45fe157647464',NULL,'wio8P9gzsZTnGnHmtvzbhhcibdgAKQyU',NULL);
INSERT INTO `library_sublayer` VALUES ('f83eee41bc4140f0a859cb68c2d75c84','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/candle/contrib/.thumbs/thumbnail.png','f0941eb324214c48b9a0755db5eaf79b',NULL,'pcrQD.RhUpVPjniyvEmDZthnztxVHvsm',NULL);
INSERT INTO `library_sublayer` VALUES ('f84088e39af8454b857649f65673ae69','04.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/teapot/contrib/geometry/bbox/geometry_bbox.usda','f5e189a845fb4ed3930a81263a21bf99',NULL,'7V55Wc1EuUjjiVv2VvN0XSphJoFCOJ6m',NULL);
INSERT INTO `library_sublayer` VALUES ('f8847fe823114dc78f115fb1b587567c','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/bookStack5/contrib/geometry/bbox/geometry_bbox.usda','fa20ba6a205e4d2b951f8262bf5b2802',NULL,'5BXPSJfCRRWYp8sO78yQXtkXkWHWaJHT',NULL);
INSERT INTO `library_sublayer` VALUES ('f89e4d0d1d594f3f84986799fa362bc4','02.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-02.00.00/bookStack/thumbnail.png','082f328bf76a4d48be255c620a8cd280',NULL,'AqdNuphviQqFeLU1aoYvlIOFyfl.wAzb',NULL);
INSERT INTO `library_sublayer` VALUES ('f9514cbe94d240a68735d777058c30d4','01.00.00','default.png','cis-7000-usd-assets-versioned/Assets/flaredPotion/contrib/material/default/texture/default.png','16fd6a411cc2475099c6b26a09175e77',NULL,'04RFfOlyfleWNwDPrhuJTAmGuXM9Nu_j',NULL);
INSERT INTO `library_sublayer` VALUES ('f9de3c3082e242c68625359970f85686','03.00.00','teapot_LOD1.usda','usd-asset-versions-dump/2025-assets-03.00.00/teapot/LODs/teapot_LOD1.usda','f5e189a845fb4ed3930a81263a21bf99',NULL,'y2noQJpkKw_L89zQvkFeP0gc6n1QMl1.',NULL);
INSERT INTO `library_sublayer` VALUES ('fa18326764e946fea777e4a2a67bc549','01.00.00','metadata.json','usd-asset-versions-dump/2025-assets-01.00.00/cartoonFish/metadata.json','f08cf286cf1b4110bdb5c6d03dfad92a',NULL,'lmuRVhHkop.IhzeXD5YB3XH4xf7YL65b',NULL);
INSERT INTO `library_sublayer` VALUES ('fa4ed72c182d4b719ce9388ae646c42c','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/medicineBottle/contrib/material/default/material_default.usda','8deb7dd1667c428b89933de25c02e4ce',NULL,'BdeIgYzusvqfqZUbQn2SJlUpjg8TjyGq',NULL);
INSERT INTO `library_sublayer` VALUES ('fa7c142f4c3c4a3c97c407202eb0bbc9','01.00.00','metadata.json','usd-asset-versions-dump/2025-assets-01.00.00/yugiohClockArc/metadata.json','4be817e19e11426ebeede52145732e77',NULL,'xqEx0SZHbDE9mlpGgzErjkBblh4mGsKb',NULL);
INSERT INTO `library_sublayer` VALUES ('fb2dd53b7f3641ad8413588e589a2b96','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/bookStack5/contrib/.thumbs/thumbnail.png','fa20ba6a205e4d2b951f8262bf5b2802',NULL,'Wp8ohmr7.Kx5BsKUlffQHqNADXFsWMmJ',NULL);
INSERT INTO `library_sublayer` VALUES ('fb94db9b7d66424a92ae2ff63e1a0cb7','04.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/beegCrab/contrib/geometry/geometry.usda','f175fbe4933944a69d06e86c906622d6',NULL,'Fy8mtRcti6XOqwsSCTXsOu5jYmljzBz2',NULL);
INSERT INTO `library_sublayer` VALUES ('fba72acb7fad470680258b508d3e2424','05.00.00','geometry_LOD0.usda','cis-7000-usd-assets-versioned/Assets/woodenChair/contrib/geometry/LOD0/geometry_LOD0.usda','b7d69121f36340adbdb7bed776c42a8d',NULL,'ZgUfntZ4WXMLWYz2AVfLBGcvzhYrsIqT',NULL);
INSERT INTO `library_sublayer` VALUES ('fbc3ffec12884eb9803960c37842f2c9','03.00.00','vintageLamp.fbx','usd-asset-versions-dump/2025-assets-02.00.00/vintageLamp/vintageLamp.fbx','c4449799e71a4ce88999ea44a86e067b',NULL,'oJnYgnQGbJxQw4hDlWrGRHpheq9ddYQF',NULL);
INSERT INTO `library_sublayer` VALUES ('fc419f1f35274b3abfd3a53721c699ce','01.00.00','geometry_LOD1.usda','cis-7000-usd-assets-versioned/Assets/lantern/contrib/geometry/LOD1/geometry_LOD1.usda','10a15094d1dc45b7bcf8c698420b9e91',NULL,'xfgHSgcRswKJI6.uosuEb6N3q6osQDbh',NULL);
INSERT INTO `library_sublayer` VALUES ('fc4a6703c303439ca99c5559158bffc1','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/candle/contrib/material/material.usda','f0941eb324214c48b9a0755db5eaf79b',NULL,'uYTTpZkECUbsuYzNNyfqNDAmEu7ZJ3cy',NULL);
INSERT INTO `library_sublayer` VALUES ('fc5ea5c410c047f7a0f17089363b4bc3','01.00.00','metadata.json','usd-asset-versions-dump/2025-assets-01.00.00/beegCrab/metadata.json','f175fbe4933944a69d06e86c906622d6',NULL,'.cHCzYIR25er5O6ocIbJ98kDJi2DetFD',NULL);
INSERT INTO `library_sublayer` VALUES ('fc6f436a2ab6464784f2cf4d3406b579','01.00.00','geometry.usda','cis-7000-usd-assets-versioned/Assets/largeCherryTable/contrib/geometry/geometry.usda','b24acc08b15546e896c3e25add15f1ba',NULL,'Gys17cZJL8SrEGH3twOEqvpDOlit6_KJ',NULL);
INSERT INTO `library_sublayer` VALUES ('fc81545742b445f18469ae0030ed08d5','01.00.00','thumbnail.png','cis-7000-usd-assets-versioned/Assets/makeupContainers/contrib/.thumbs/thumbnail.png','6bc90b076ae74ab9842a07913f22e681',NULL,'mJ6CC1RJA6ePCtZzBPWiIVC.5yy_mbDD',NULL);
INSERT INTO `library_sublayer` VALUES ('fc8626e426164d9281a6b7d16c323edd','03.00.00','teapot.usda','usd-asset-versions-dump/2025-assets-03.00.00/teapot/teapot.usda','f5e189a845fb4ed3930a81263a21bf99',NULL,'xdttkKhcqX3aObSqdxF2pgTOHLjQxwkW',NULL);
INSERT INTO `library_sublayer` VALUES ('fcc917b1576946aeb7cc97e6305568ce','05.00.00','woodenChair.usd','cis-7000-usd-assets-versioned/Assets/woodenChair/woodenChair.usd','b7d69121f36340adbdb7bed776c42a8d',NULL,'Hz7rFXeKzU8BnHi72DM.KdqNrTdpNdDn',NULL);
INSERT INTO `library_sublayer` VALUES ('fd66e425144a405fb46cc74525a7947b','01.00.00','material_default.usda','cis-7000-usd-assets-versioned/Assets/makeupJar/contrib/material/default/material_default.usda','313b0aae14664f14b656d4d17478fbc3',NULL,'1BB4Jb_b628WO1SCpb584liGNzkMRczi',NULL);
INSERT INTO `library_sublayer` VALUES ('fd886ed9beec4c308334b5c07e2ac639','04.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/cafeTable/contrib/geometry/bbox/geometry_bbox.usda','579fe0bad3f84b7babc143ab2952234e',NULL,'2a.DaXuPq46pMU8tSq0dVIKN.b9.0Kf2',NULL);
INSERT INTO `library_sublayer` VALUES ('fdcefd4625a94361b10c0726c9d68059','03.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-03.00.00/cafeTable/thumbnail.png','579fe0bad3f84b7babc143ab2952234e',NULL,'2FIuC_9WbvAGenOKC3rl9_dEneaG2D5z',NULL);
INSERT INTO `library_sublayer` VALUES ('fe3c3e86f78445dc87243f48f1a2a99a','04.00.00','default.png','cis-7000-usd-assets-versioned/Assets/parkBench/contrib/material/default/texture/default.png','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'4KCLTNNBUSZD4gzG_uXUAtX60azOoA32',NULL);
INSERT INTO `library_sublayer` VALUES ('fe44e87b1b41426282362ee7db1f0319','02.00.00','thumbnail.png','usd-asset-versions-dump/2025-assets-02.00.00/parkBench/thumbnail.png','2df25bd14a5542aab9eaa23f1c3ccd1e',NULL,'AAvRemuts4BMba.aFNbxi1vgJ0VmEghR',NULL);
INSERT INTO `library_sublayer` VALUES ('fe7ee7b07fbe4b7fac9a57fa18a457b8','01.00.00','material.usda','cis-7000-usd-assets-versioned/Assets/blueJello/contrib/material/material.usda','3d6b8007d30e4919a46deedb6dfce573',NULL,'QBBnSLNCaz_rS0YMY.FoGvrAHXcUwhQR',NULL);
INSERT INTO `library_sublayer` VALUES ('ff21cfde082f43758f1efe816b5e6020','05.00.00','kitchenaid.usda','usd-asset-versions-dump/2024-assets-acquisition/kitchenaid/kitchenaid.usda','66b74b32abd8459cbe41f434285a7691',NULL,'.rsdeCqNNyEwWq.PUUOK0QfVRTNLbWQY',NULL);
INSERT INTO `library_sublayer` VALUES ('ff51fd7c19a34f42a8786dfd9af5bc4f','04.00.00','penTablet_model.usda','usd-asset-versions-dump/2024-assets-acquisition/penTablet/penTablet_model.usda','db17d0c2030049769e1ba2ea54d86114',NULL,'6k0LqJvnxGKOBaa6JiGotX2U28_aPGfj',NULL);
INSERT INTO `library_sublayer` VALUES ('ff85c590e3aa4c28b4b1fe1c0b25509a','01.00.00','geometry_bbox.usda','cis-7000-usd-assets-versioned/Assets/largePottedPlant/contrib/geometry/bbox/geometry_bbox.usda','cc9847c9e64a4341bd8287edf73afe04',NULL,'uPtRU11OJkWUt88XQya35.oQd2zOhlJm',NULL);
/*!40000 ALTER TABLE `library_sublayer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_sublayer_externalDependencies`
--

DROP TABLE IF EXISTS `library_sublayer_externalDependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_sublayer_externalDependencies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sublayer_id` char(32) NOT NULL,
  `asset_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `library_sublayer_externa_sublayer_id_asset_id_89427688_uniq` (`sublayer_id`,`asset_id`),
  KEY `library_sublayer_ext_asset_id_1ef00df2_fk_library_a` (`asset_id`),
  CONSTRAINT `library_sublayer_ext_asset_id_1ef00df2_fk_library_a` FOREIGN KEY (`asset_id`) REFERENCES `library_asset` (`id`),
  CONSTRAINT `library_sublayer_ext_sublayer_id_874345ae_fk_library_s` FOREIGN KEY (`sublayer_id`) REFERENCES `library_sublayer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_sublayer_externalDependencies`
--
-- ORDER BY:  `id`,`sublayer_id`,`asset_id`,`asset_id`

LOCK TABLES `library_sublayer_externalDependencies` WRITE;
/*!40000 ALTER TABLE `library_sublayer_externalDependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_sublayer_externalDependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_sublayer_internalDependencies`
--

DROP TABLE IF EXISTS `library_sublayer_internalDependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_sublayer_internalDependencies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_sublayer_id` char(32) NOT NULL,
  `to_sublayer_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `library_sublayer_interna_from_sublayer_id_to_subl_fab47004_uniq` (`from_sublayer_id`,`to_sublayer_id`),
  KEY `library_sublayer_int_to_sublayer_id_c5994e73_fk_library_s` (`to_sublayer_id`),
  CONSTRAINT `library_sublayer_int_from_sublayer_id_9a6e664f_fk_library_s` FOREIGN KEY (`from_sublayer_id`) REFERENCES `library_sublayer` (`id`),
  CONSTRAINT `library_sublayer_int_to_sublayer_id_c5994e73_fk_library_s` FOREIGN KEY (`to_sublayer_id`) REFERENCES `library_sublayer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_sublayer_internalDependencies`
--
-- ORDER BY:  `id`,`from_sublayer_id`,`to_sublayer_id`,`to_sublayer_id`

LOCK TABLES `library_sublayer_internalDependencies` WRITE;
/*!40000 ALTER TABLE `library_sublayer_internalDependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_sublayer_internalDependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_sublayer_status`
--

DROP TABLE IF EXISTS `library_sublayer_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_sublayer_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sublayer_id` char(32) NOT NULL,
  `statustag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `library_sublayer_status_sublayer_id_statustag_id_a6ddc361_uniq` (`sublayer_id`,`statustag_id`),
  KEY `library_sublayer_sta_statustag_id_c09f5b25_fk_library_s` (`statustag_id`),
  CONSTRAINT `library_sublayer_sta_statustag_id_c09f5b25_fk_library_s` FOREIGN KEY (`statustag_id`) REFERENCES `library_statustag` (`id`),
  CONSTRAINT `library_sublayer_sta_sublayer_id_2abc5d82_fk_library_s` FOREIGN KEY (`sublayer_id`) REFERENCES `library_sublayer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_sublayer_status`
--
-- ORDER BY:  `id`,`sublayer_id`,`statustag_id`,`statustag_id`

LOCK TABLES `library_sublayer_status` WRITE;
/*!40000 ALTER TABLE `library_sublayer_status` DISABLE KEYS */;
INSERT INTO `library_sublayer_status` VALUES (19,'1c82399215254ea09dd7cc704874f531',1);
INSERT INTO `library_sublayer_status` VALUES (20,'38e6b85ce5034999ab8e0382457af21a',1);
INSERT INTO `library_sublayer_status` VALUES (39,'3d15c0a7c70b4b6aa7715eb83436210b',1);
INSERT INTO `library_sublayer_status` VALUES (40,'a3af27b4562a40c49f449a917b6c3426',1);
INSERT INTO `library_sublayer_status` VALUES (41,'75a35af5505c43508e455438e13bf716',1);
INSERT INTO `library_sublayer_status` VALUES (42,'a62b3985d1224dc1b0e7f6f5d38415bb',1);
INSERT INTO `library_sublayer_status` VALUES (43,'22bd359023be4ea9a1430b002e7754c2',1);
INSERT INTO `library_sublayer_status` VALUES (44,'51101d1af8c3434b928aa4cec7149d54',1);
INSERT INTO `library_sublayer_status` VALUES (45,'f6fc431c912542a889e2562652393058',1);
INSERT INTO `library_sublayer_status` VALUES (46,'51f4a02e7d50436f87a2b37e467a2024',1);
INSERT INTO `library_sublayer_status` VALUES (47,'a7f530c25d6442c9a4ba131794e667fd',1);
INSERT INTO `library_sublayer_status` VALUES (66,'efa1f79f98914b9aa9cf923f5688444f',1);
INSERT INTO `library_sublayer_status` VALUES (67,'e875aaafec874e149484dd7a2e58ebad',1);
INSERT INTO `library_sublayer_status` VALUES (86,'20b06fbe1e2646a48fb12a59027add9f',1);
INSERT INTO `library_sublayer_status` VALUES (87,'c3eb1dc4760c4e138abb6da58312cc20',1);
INSERT INTO `library_sublayer_status` VALUES (88,'8f732933f3eb47978bddde91b1bc848e',1);
INSERT INTO `library_sublayer_status` VALUES (89,'00e8a5b23397433996c025db38a14596',1);
INSERT INTO `library_sublayer_status` VALUES (90,'49db2b2780ca4719b39b11716ef90dbc',1);
INSERT INTO `library_sublayer_status` VALUES (91,'495f31afbaf547dcabbf4b0620fd7709',1);
INSERT INTO `library_sublayer_status` VALUES (92,'b9358cbb57d74642ba4a5a6c0f25e843',1);
INSERT INTO `library_sublayer_status` VALUES (93,'6ce4f1e504054938a2f87b31abe6d6a9',1);
INSERT INTO `library_sublayer_status` VALUES (94,'a6f6880bc09a4070b5350a6e64e84d8e',1);
INSERT INTO `library_sublayer_status` VALUES (113,'2788ad36be4b446f9d691186e25102b8',1);
INSERT INTO `library_sublayer_status` VALUES (114,'b312152a58f04327ae151412301a7698',1);
INSERT INTO `library_sublayer_status` VALUES (133,'99f361b53fa64d649d6664310cdecfa9',1);
INSERT INTO `library_sublayer_status` VALUES (134,'8759083bf3b344e88ac1e5072482985b',1);
INSERT INTO `library_sublayer_status` VALUES (135,'75fca4590d5f4d9d9c93f24fb8f8f6d0',1);
INSERT INTO `library_sublayer_status` VALUES (136,'d4000c61497441c6bf8c977dd0d7c121',1);
INSERT INTO `library_sublayer_status` VALUES (137,'c383ddae633c4c47b1d08df676b4049b',1);
INSERT INTO `library_sublayer_status` VALUES (138,'a92269f1a7a84dc28fd5293e946ac0dc',1);
INSERT INTO `library_sublayer_status` VALUES (139,'60226c8f10564fa99411cf6e8e55182d',1);
INSERT INTO `library_sublayer_status` VALUES (140,'d98eeec6bc4644c5a1bdecc990e75e2b',1);
INSERT INTO `library_sublayer_status` VALUES (141,'7006246dafdd4d2faeb9a6065e56c2e5',1);
INSERT INTO `library_sublayer_status` VALUES (160,'5da457f5ccdd4dbe92c9438a8513c5ad',1);
INSERT INTO `library_sublayer_status` VALUES (161,'7f1cc6683c054558a5e49a44738e87cc',1);
INSERT INTO `library_sublayer_status` VALUES (162,'b7dfb8cd9c0d428e8abaab0b7fdd7c59',1);
INSERT INTO `library_sublayer_status` VALUES (163,'d85ea5535dc74f54a00b97099eab0d59',1);
INSERT INTO `library_sublayer_status` VALUES (164,'612831e6397f46ed99c20390ebe6dbbd',1);
INSERT INTO `library_sublayer_status` VALUES (165,'5299ec675647431181b24fd4d490b300',1);
INSERT INTO `library_sublayer_status` VALUES (166,'c1f0257d79af48529a1720516a5e03a7',1);
INSERT INTO `library_sublayer_status` VALUES (167,'196d0687229b414eb9e61aea2ee1b189',1);
INSERT INTO `library_sublayer_status` VALUES (168,'3c841015c8f9440889bee2410f9d6cbb',1);
INSERT INTO `library_sublayer_status` VALUES (187,'fa7c142f4c3c4a3c97c407202eb0bbc9',1);
INSERT INTO `library_sublayer_status` VALUES (188,'33d1336a8487400f9b970df309effd06',1);
INSERT INTO `library_sublayer_status` VALUES (207,'543316c6499c49f4b86a6e1141a9fbb3',1);
INSERT INTO `library_sublayer_status` VALUES (208,'403056f991b7432585eade02945d479c',1);
INSERT INTO `library_sublayer_status` VALUES (227,'4474d3ba0b2e49c7a59fd757c1a82f1d',1);
INSERT INTO `library_sublayer_status` VALUES (228,'1edd3b9caf294d0985d217808af802c6',1);
INSERT INTO `library_sublayer_status` VALUES (229,'c31fda68b3714547b50ebdece410f516',1);
INSERT INTO `library_sublayer_status` VALUES (230,'0cd6e274afd54daaae98dda4a24d045b',1);
INSERT INTO `library_sublayer_status` VALUES (231,'ad911d80843946ba8707120412889c74',1);
INSERT INTO `library_sublayer_status` VALUES (232,'abb67c1a44b14b3b9be6bfb715a9d009',1);
INSERT INTO `library_sublayer_status` VALUES (233,'75ca0da1c74b49efab40cf7b3d586cd8',1);
INSERT INTO `library_sublayer_status` VALUES (234,'47d182d5c42446668b7a57f7c7d1532a',1);
INSERT INTO `library_sublayer_status` VALUES (235,'8b14d904f6874753a2cb6cfae3a7c076',1);
INSERT INTO `library_sublayer_status` VALUES (254,'b978b8fdc7a34ba6ab2f2df17ade014c',1);
INSERT INTO `library_sublayer_status` VALUES (255,'d5231acd907b455fbe8964c714d07005',1);
INSERT INTO `library_sublayer_status` VALUES (256,'1e4a31e3763d4d4eb8f0f9b1cdc6f4ce',1);
INSERT INTO `library_sublayer_status` VALUES (257,'044c7bf3b2d24e5a96d72658e8a1451b',1);
INSERT INTO `library_sublayer_status` VALUES (258,'87ddf876384b4c74ab1aca32bc8a657e',1);
INSERT INTO `library_sublayer_status` VALUES (259,'44264b1451d846b4aa9491aba509b145',1);
INSERT INTO `library_sublayer_status` VALUES (260,'3bded8793d9b41d1b3ea004dd9848e30',1);
INSERT INTO `library_sublayer_status` VALUES (261,'d04f21d0bd12441cb6b301301169823c',1);
INSERT INTO `library_sublayer_status` VALUES (262,'18d99b4b317f4dd7ac683732d822140d',1);
INSERT INTO `library_sublayer_status` VALUES (281,'a8872dd8e4ea476eb2c626dcf19b166f',1);
INSERT INTO `library_sublayer_status` VALUES (282,'31949ff56cd84ed08bc36fda80fa6c07',1);
INSERT INTO `library_sublayer_status` VALUES (301,'68c0bfa7259c42cb835aeef2873d0584',1);
INSERT INTO `library_sublayer_status` VALUES (302,'ff21cfde082f43758f1efe816b5e6020',1);
INSERT INTO `library_sublayer_status` VALUES (303,'a8e39336e66d4a4bba2905a1fd1205b1',1);
INSERT INTO `library_sublayer_status` VALUES (304,'96fb386c5696425496f3ceb03f99d1f0',1);
INSERT INTO `library_sublayer_status` VALUES (305,'5f6ba0decd1648d786e2c0f3412a9147',1);
INSERT INTO `library_sublayer_status` VALUES (306,'e5cc85133b7b49f397bef5e7d8e6f588',1);
INSERT INTO `library_sublayer_status` VALUES (307,'a2c21a1ccc76405d8dc29c8696c941b7',1);
INSERT INTO `library_sublayer_status` VALUES (334,'8c29b09dc94f4f319766f2dadc38905f',1);
INSERT INTO `library_sublayer_status` VALUES (335,'9aef1b1557164a6399c813c88ff311f7',1);
INSERT INTO `library_sublayer_status` VALUES (372,'8e3d8134253846a2963d2a537f2366da',1);
INSERT INTO `library_sublayer_status` VALUES (373,'8fc151b6e9f84884b67d5bf7ed067c74',1);
INSERT INTO `library_sublayer_status` VALUES (374,'34b9f8ebebeb447fac5fe1ac6f58c185',1);
INSERT INTO `library_sublayer_status` VALUES (375,'41287c8a04ef488495b4b9be243ac4e8',1);
INSERT INTO `library_sublayer_status` VALUES (376,'1918ef6e12d1425ca0ee245f240f92a5',1);
INSERT INTO `library_sublayer_status` VALUES (377,'e615adae1f8e4273a2ab9516896269a1',1);
INSERT INTO `library_sublayer_status` VALUES (378,'7ec888888f4c451885a15e33a9e0d9f6',1);
INSERT INTO `library_sublayer_status` VALUES (379,'04a9b863a2a9415a81f9af8496a1dd0f',1);
INSERT INTO `library_sublayer_status` VALUES (380,'42f0f3b661464e45a77dfca83910d570',1);
INSERT INTO `library_sublayer_status` VALUES (399,'199ff1d5f0164f2682e2acb5fff17c1d',1);
INSERT INTO `library_sublayer_status` VALUES (400,'c88497f23d87470e9b1d3ae3535afdb2',1);
INSERT INTO `library_sublayer_status` VALUES (401,'1d724c39e4704147b8576a5c7f5bdfc2',1);
INSERT INTO `library_sublayer_status` VALUES (402,'22c57368c3b54d89a64b5f47e07161d6',1);
INSERT INTO `library_sublayer_status` VALUES (403,'3225012ff11f49b9815161768efc01a5',1);
INSERT INTO `library_sublayer_status` VALUES (404,'68ac7428b1c145a0a924ec2417c61f75',1);
INSERT INTO `library_sublayer_status` VALUES (405,'7aded2453d7a4d9db35a04deb9baec85',1);
INSERT INTO `library_sublayer_status` VALUES (406,'32c37c9962c44814a7041566293e0558',1);
INSERT INTO `library_sublayer_status` VALUES (407,'37bb7cbace6a4d6dbcdda75600557ba5',1);
INSERT INTO `library_sublayer_status` VALUES (426,'ea78421d7b294325a2a40c75695b06ca',1);
INSERT INTO `library_sublayer_status` VALUES (427,'347e8495f19344ff9c5e5d835bc9ba2e',1);
INSERT INTO `library_sublayer_status` VALUES (446,'5a062ea7eafb4fe4a7c60e03443e17f8',1);
INSERT INTO `library_sublayer_status` VALUES (447,'63c624388f3e4e218aa0aeaf5cf70aab',1);
INSERT INTO `library_sublayer_status` VALUES (466,'d4f983f4c1544d8cacf867719cd16589',1);
INSERT INTO `library_sublayer_status` VALUES (467,'b833bcc8ef1b42d39f55e254ab993cbd',1);
INSERT INTO `library_sublayer_status` VALUES (468,'d6759ae40b554ebebdba68b2665b9419',1);
INSERT INTO `library_sublayer_status` VALUES (469,'5773876e9c2745f5990750514f451e4b',1);
INSERT INTO `library_sublayer_status` VALUES (470,'f49d2e43251441b3b6276972d8504425',1);
INSERT INTO `library_sublayer_status` VALUES (471,'9bc1704cf5c24e0097adc9bd1ca98019',1);
INSERT INTO `library_sublayer_status` VALUES (472,'eaa5f6fa94fe4eadbaa173a8615314c5',1);
INSERT INTO `library_sublayer_status` VALUES (473,'ff51fd7c19a34f42a8786dfd9af5bc4f',1);
INSERT INTO `library_sublayer_status` VALUES (474,'3ec5b83c4d0e47edbc06c5a94e0e9031',1);
INSERT INTO `library_sublayer_status` VALUES (493,'79d05ef40e53422aafb23322a00fc804',1);
INSERT INTO `library_sublayer_status` VALUES (494,'fa18326764e946fea777e4a2a67bc549',1);
INSERT INTO `library_sublayer_status` VALUES (513,'b25f413f6fb84884898af8fb020003e9',1);
INSERT INTO `library_sublayer_status` VALUES (514,'fc5ea5c410c047f7a0f17089363b4bc3',1);
INSERT INTO `library_sublayer_status` VALUES (533,'f4972b1dfbc049bb9fcb8180e0ee92b2',1);
INSERT INTO `library_sublayer_status` VALUES (534,'64e992a624a04aa0846a4ee7b26e87a8',1);
INSERT INTO `library_sublayer_status` VALUES (535,'cedadbd88628477f9b336f02a317778d',2);
INSERT INTO `library_sublayer_status` VALUES (536,'cedadbd88628477f9b336f02a317778d',3);
INSERT INTO `library_sublayer_status` VALUES (537,'ef3770bdb9bc4e29b21e142a1424f995',2);
INSERT INTO `library_sublayer_status` VALUES (538,'ef3770bdb9bc4e29b21e142a1424f995',3);
INSERT INTO `library_sublayer_status` VALUES (539,'8b4faa4abc1b4a7c83accb08a3784815',2);
INSERT INTO `library_sublayer_status` VALUES (540,'8b4faa4abc1b4a7c83accb08a3784815',3);
INSERT INTO `library_sublayer_status` VALUES (541,'ec9c6a0594304635a028980dd6eb9745',2);
INSERT INTO `library_sublayer_status` VALUES (542,'ec9c6a0594304635a028980dd6eb9745',3);
INSERT INTO `library_sublayer_status` VALUES (543,'2ee3c49cb8724e6a8f49f7ce92855dcd',2);
INSERT INTO `library_sublayer_status` VALUES (544,'2ee3c49cb8724e6a8f49f7ce92855dcd',3);
INSERT INTO `library_sublayer_status` VALUES (545,'f2b18a7e57ce4302b513e0de4d0cf209',2);
INSERT INTO `library_sublayer_status` VALUES (546,'f2b18a7e57ce4302b513e0de4d0cf209',3);
INSERT INTO `library_sublayer_status` VALUES (547,'e63a4765ed6f4e0a936172d17101dd7e',2);
INSERT INTO `library_sublayer_status` VALUES (548,'e63a4765ed6f4e0a936172d17101dd7e',3);
INSERT INTO `library_sublayer_status` VALUES (549,'c1c17d7217ab413599eda9ed6728fd22',2);
INSERT INTO `library_sublayer_status` VALUES (550,'c1c17d7217ab413599eda9ed6728fd22',3);
INSERT INTO `library_sublayer_status` VALUES (551,'d3079ac13dd349c59ffec6dc88ad3075',2);
INSERT INTO `library_sublayer_status` VALUES (552,'d3079ac13dd349c59ffec6dc88ad3075',3);
INSERT INTO `library_sublayer_status` VALUES (553,'1e300aef29244c009f4a7a420d39cbed',2);
INSERT INTO `library_sublayer_status` VALUES (554,'1e300aef29244c009f4a7a420d39cbed',3);
INSERT INTO `library_sublayer_status` VALUES (555,'5743be84a7c74363813960c893a32267',2);
INSERT INTO `library_sublayer_status` VALUES (556,'5743be84a7c74363813960c893a32267',3);
INSERT INTO `library_sublayer_status` VALUES (557,'1c559b960a344fd696982fc13842df1e',2);
INSERT INTO `library_sublayer_status` VALUES (558,'1c559b960a344fd696982fc13842df1e',3);
INSERT INTO `library_sublayer_status` VALUES (559,'338b0af6b46a454381a1e14f78a52443',2);
INSERT INTO `library_sublayer_status` VALUES (560,'338b0af6b46a454381a1e14f78a52443',3);
INSERT INTO `library_sublayer_status` VALUES (561,'6d235eeedaa2460c8dac7669a5f06edd',2);
INSERT INTO `library_sublayer_status` VALUES (562,'6d235eeedaa2460c8dac7669a5f06edd',3);
INSERT INTO `library_sublayer_status` VALUES (563,'caaa7da37b3b4782875f81cbf8b6f44c',2);
INSERT INTO `library_sublayer_status` VALUES (564,'caaa7da37b3b4782875f81cbf8b6f44c',3);
INSERT INTO `library_sublayer_status` VALUES (565,'4442e0d763e245b1a9d87c0ac69312ad',2);
INSERT INTO `library_sublayer_status` VALUES (566,'4442e0d763e245b1a9d87c0ac69312ad',3);
INSERT INTO `library_sublayer_status` VALUES (567,'3dada67323124499b22a752b58f8e117',2);
INSERT INTO `library_sublayer_status` VALUES (568,'3dada67323124499b22a752b58f8e117',3);
INSERT INTO `library_sublayer_status` VALUES (569,'8dc1122614244420b56179879887edb1',2);
INSERT INTO `library_sublayer_status` VALUES (570,'8dc1122614244420b56179879887edb1',3);
INSERT INTO `library_sublayer_status` VALUES (571,'144a69c97af7498fa7ecf527dc510a3d',2);
INSERT INTO `library_sublayer_status` VALUES (572,'144a69c97af7498fa7ecf527dc510a3d',3);
INSERT INTO `library_sublayer_status` VALUES (573,'5036103a272d4605b9cd7784a4eaa51b',2);
INSERT INTO `library_sublayer_status` VALUES (574,'5036103a272d4605b9cd7784a4eaa51b',3);
INSERT INTO `library_sublayer_status` VALUES (575,'21c09de93c1644249496f07bb8200bf8',2);
INSERT INTO `library_sublayer_status` VALUES (576,'21c09de93c1644249496f07bb8200bf8',3);
INSERT INTO `library_sublayer_status` VALUES (577,'2a5561669adf4c62a53a0405586d4840',2);
INSERT INTO `library_sublayer_status` VALUES (578,'2a5561669adf4c62a53a0405586d4840',3);
INSERT INTO `library_sublayer_status` VALUES (579,'3ac0e9158802486e9bc3c3241f7eb095',2);
INSERT INTO `library_sublayer_status` VALUES (580,'3ac0e9158802486e9bc3c3241f7eb095',3);
INSERT INTO `library_sublayer_status` VALUES (581,'c0843bc1787644ada77758de0f26ef46',2);
INSERT INTO `library_sublayer_status` VALUES (582,'c0843bc1787644ada77758de0f26ef46',3);
INSERT INTO `library_sublayer_status` VALUES (583,'7eb8b48fabea43949f5cab187ff8c668',2);
INSERT INTO `library_sublayer_status` VALUES (584,'7eb8b48fabea43949f5cab187ff8c668',3);
INSERT INTO `library_sublayer_status` VALUES (585,'895aa3517fcc4e3abee525da715a9d97',2);
INSERT INTO `library_sublayer_status` VALUES (586,'895aa3517fcc4e3abee525da715a9d97',3);
INSERT INTO `library_sublayer_status` VALUES (587,'cb9721a2df764657ac377466f1203b84',2);
INSERT INTO `library_sublayer_status` VALUES (588,'cb9721a2df764657ac377466f1203b84',3);
INSERT INTO `library_sublayer_status` VALUES (589,'fe3c3e86f78445dc87243f48f1a2a99a',2);
INSERT INTO `library_sublayer_status` VALUES (590,'fe3c3e86f78445dc87243f48f1a2a99a',3);
INSERT INTO `library_sublayer_status` VALUES (591,'ba80cc6365384378a0d0fba7cd4146f4',2);
INSERT INTO `library_sublayer_status` VALUES (592,'ba80cc6365384378a0d0fba7cd4146f4',3);
INSERT INTO `library_sublayer_status` VALUES (593,'89468d67c48b4b858bffbea9372472e4',2);
INSERT INTO `library_sublayer_status` VALUES (594,'89468d67c48b4b858bffbea9372472e4',3);
INSERT INTO `library_sublayer_status` VALUES (595,'16c21e481acd4ad393db97b2f5aae91d',2);
INSERT INTO `library_sublayer_status` VALUES (596,'16c21e481acd4ad393db97b2f5aae91d',3);
INSERT INTO `library_sublayer_status` VALUES (597,'88e1ec3e6562472b966a743f3ed41457',2);
INSERT INTO `library_sublayer_status` VALUES (598,'88e1ec3e6562472b966a743f3ed41457',3);
INSERT INTO `library_sublayer_status` VALUES (599,'f38bb7aee72f41a9871dafd164bb5f4c',2);
INSERT INTO `library_sublayer_status` VALUES (600,'f38bb7aee72f41a9871dafd164bb5f4c',3);
INSERT INTO `library_sublayer_status` VALUES (601,'443407e33eb64c4cb7f11c0807d0dfff',2);
INSERT INTO `library_sublayer_status` VALUES (602,'443407e33eb64c4cb7f11c0807d0dfff',3);
INSERT INTO `library_sublayer_status` VALUES (603,'a98c3f91de5144768d4bc59ab3e9ab46',2);
INSERT INTO `library_sublayer_status` VALUES (604,'a98c3f91de5144768d4bc59ab3e9ab46',3);
INSERT INTO `library_sublayer_status` VALUES (605,'4025102dcb894c6f9acf326d1eae4b92',2);
INSERT INTO `library_sublayer_status` VALUES (606,'4025102dcb894c6f9acf326d1eae4b92',3);
INSERT INTO `library_sublayer_status` VALUES (607,'5ca846a3677d4b2aaebf4a38cdf86634',2);
INSERT INTO `library_sublayer_status` VALUES (608,'5ca846a3677d4b2aaebf4a38cdf86634',3);
INSERT INTO `library_sublayer_status` VALUES (609,'7c2f5164a40542f68fca1687595c325a',2);
INSERT INTO `library_sublayer_status` VALUES (610,'7c2f5164a40542f68fca1687595c325a',3);
INSERT INTO `library_sublayer_status` VALUES (611,'d95f938025274163ab6043b215c25b6c',2);
INSERT INTO `library_sublayer_status` VALUES (612,'d95f938025274163ab6043b215c25b6c',3);
INSERT INTO `library_sublayer_status` VALUES (613,'b8b3cb6e4e1e4f26a1780b69299f265b',2);
INSERT INTO `library_sublayer_status` VALUES (614,'b8b3cb6e4e1e4f26a1780b69299f265b',3);
INSERT INTO `library_sublayer_status` VALUES (615,'e7fc73d8e937423ca488daa1b7b43b13',2);
INSERT INTO `library_sublayer_status` VALUES (616,'e7fc73d8e937423ca488daa1b7b43b13',3);
INSERT INTO `library_sublayer_status` VALUES (617,'a8d1fef8a0a849c1a95370581c106e15',2);
INSERT INTO `library_sublayer_status` VALUES (618,'a8d1fef8a0a849c1a95370581c106e15',3);
INSERT INTO `library_sublayer_status` VALUES (619,'251b88a71b3e4294bea213769efdfd33',2);
INSERT INTO `library_sublayer_status` VALUES (620,'251b88a71b3e4294bea213769efdfd33',3);
INSERT INTO `library_sublayer_status` VALUES (621,'37ea8ba54e004e4882dfc1254c7e4de5',2);
INSERT INTO `library_sublayer_status` VALUES (622,'37ea8ba54e004e4882dfc1254c7e4de5',3);
INSERT INTO `library_sublayer_status` VALUES (623,'3cadbf0bebcb47cfb568386a015f7c96',2);
INSERT INTO `library_sublayer_status` VALUES (624,'3cadbf0bebcb47cfb568386a015f7c96',3);
INSERT INTO `library_sublayer_status` VALUES (625,'8c33c61d3f964f8db9c80b83f280ff2a',2);
INSERT INTO `library_sublayer_status` VALUES (626,'8c33c61d3f964f8db9c80b83f280ff2a',3);
INSERT INTO `library_sublayer_status` VALUES (627,'9e624709e1694ff8823fe6e80f0f55e7',2);
INSERT INTO `library_sublayer_status` VALUES (628,'9e624709e1694ff8823fe6e80f0f55e7',3);
INSERT INTO `library_sublayer_status` VALUES (629,'f03a775e84a6475591703dc5c19ff311',2);
INSERT INTO `library_sublayer_status` VALUES (630,'f03a775e84a6475591703dc5c19ff311',3);
INSERT INTO `library_sublayer_status` VALUES (631,'07334c51a3df4e36b7cb39a48c4dc6f3',2);
INSERT INTO `library_sublayer_status` VALUES (632,'07334c51a3df4e36b7cb39a48c4dc6f3',3);
INSERT INTO `library_sublayer_status` VALUES (633,'59c8ec0797fd41e890bca79cac6f8558',2);
INSERT INTO `library_sublayer_status` VALUES (634,'59c8ec0797fd41e890bca79cac6f8558',3);
INSERT INTO `library_sublayer_status` VALUES (635,'b902751b41c94f548bd17b3e8d588190',2);
INSERT INTO `library_sublayer_status` VALUES (636,'b902751b41c94f548bd17b3e8d588190',3);
INSERT INTO `library_sublayer_status` VALUES (637,'9c19f3099c58409091bd1d47b2b5bb86',2);
INSERT INTO `library_sublayer_status` VALUES (638,'9c19f3099c58409091bd1d47b2b5bb86',3);
INSERT INTO `library_sublayer_status` VALUES (639,'cd4d8c845b284771a6e7e3a0f52dd168',2);
INSERT INTO `library_sublayer_status` VALUES (640,'cd4d8c845b284771a6e7e3a0f52dd168',3);
INSERT INTO `library_sublayer_status` VALUES (641,'17c47250003d4649a550318f4a01ecb1',2);
INSERT INTO `library_sublayer_status` VALUES (642,'17c47250003d4649a550318f4a01ecb1',3);
INSERT INTO `library_sublayer_status` VALUES (643,'4ddf1425dded4f9a9e8940ba1b05fa3f',2);
INSERT INTO `library_sublayer_status` VALUES (644,'4ddf1425dded4f9a9e8940ba1b05fa3f',3);
INSERT INTO `library_sublayer_status` VALUES (645,'9c97f55e7ba64940bd1765fcb1bd0037',2);
INSERT INTO `library_sublayer_status` VALUES (646,'9c97f55e7ba64940bd1765fcb1bd0037',3);
INSERT INTO `library_sublayer_status` VALUES (647,'9b4a21f2bf604e699afd17563bb2a23c',2);
INSERT INTO `library_sublayer_status` VALUES (648,'9b4a21f2bf604e699afd17563bb2a23c',3);
INSERT INTO `library_sublayer_status` VALUES (649,'470f94aabd12454b88826d204e20ef29',2);
INSERT INTO `library_sublayer_status` VALUES (650,'470f94aabd12454b88826d204e20ef29',3);
INSERT INTO `library_sublayer_status` VALUES (651,'c81fb058f0ad4058b85e786275ddbc62',2);
INSERT INTO `library_sublayer_status` VALUES (652,'c81fb058f0ad4058b85e786275ddbc62',3);
INSERT INTO `library_sublayer_status` VALUES (653,'b47d5735a72d48d789e480733b5e5978',2);
INSERT INTO `library_sublayer_status` VALUES (654,'b47d5735a72d48d789e480733b5e5978',3);
INSERT INTO `library_sublayer_status` VALUES (655,'94f331ff49824cb4904ff2cc879bd73d',2);
INSERT INTO `library_sublayer_status` VALUES (656,'94f331ff49824cb4904ff2cc879bd73d',3);
INSERT INTO `library_sublayer_status` VALUES (657,'94781e93d5714e7ab5c9868e5c7b80b1',2);
INSERT INTO `library_sublayer_status` VALUES (658,'94781e93d5714e7ab5c9868e5c7b80b1',3);
INSERT INTO `library_sublayer_status` VALUES (659,'95bc6b1a696b42b6a31e203a0c418467',2);
INSERT INTO `library_sublayer_status` VALUES (660,'95bc6b1a696b42b6a31e203a0c418467',3);
INSERT INTO `library_sublayer_status` VALUES (661,'6ed0247a1a23490f8cf00783d67c885a',2);
INSERT INTO `library_sublayer_status` VALUES (662,'6ed0247a1a23490f8cf00783d67c885a',3);
INSERT INTO `library_sublayer_status` VALUES (663,'922def5bc28942e395953b6c7e0db4d6',2);
INSERT INTO `library_sublayer_status` VALUES (664,'922def5bc28942e395953b6c7e0db4d6',3);
INSERT INTO `library_sublayer_status` VALUES (665,'9b5e48c171ec49d4875043c1355abb99',2);
INSERT INTO `library_sublayer_status` VALUES (666,'9b5e48c171ec49d4875043c1355abb99',3);
INSERT INTO `library_sublayer_status` VALUES (667,'68cda689d76e4ee391de9bc542e03322',2);
INSERT INTO `library_sublayer_status` VALUES (668,'68cda689d76e4ee391de9bc542e03322',3);
INSERT INTO `library_sublayer_status` VALUES (669,'6b1989f5c4b14d42b1a8f68d1265447e',2);
INSERT INTO `library_sublayer_status` VALUES (670,'6b1989f5c4b14d42b1a8f68d1265447e',3);
INSERT INTO `library_sublayer_status` VALUES (671,'48f9163070714abd9938849849fd04ba',2);
INSERT INTO `library_sublayer_status` VALUES (672,'48f9163070714abd9938849849fd04ba',3);
INSERT INTO `library_sublayer_status` VALUES (673,'b8179e4eefc640e894e016e0873bbd65',2);
INSERT INTO `library_sublayer_status` VALUES (674,'b8179e4eefc640e894e016e0873bbd65',3);
INSERT INTO `library_sublayer_status` VALUES (675,'b0db1fc0323f471bae9f50df0daf0ca0',2);
INSERT INTO `library_sublayer_status` VALUES (676,'b0db1fc0323f471bae9f50df0daf0ca0',3);
INSERT INTO `library_sublayer_status` VALUES (677,'39ebc668c8db4fe08f183abd6cdb697d',2);
INSERT INTO `library_sublayer_status` VALUES (678,'39ebc668c8db4fe08f183abd6cdb697d',3);
INSERT INTO `library_sublayer_status` VALUES (679,'a8225c3f3f0b440ba45b9d83f1995cd2',2);
INSERT INTO `library_sublayer_status` VALUES (680,'a8225c3f3f0b440ba45b9d83f1995cd2',3);
INSERT INTO `library_sublayer_status` VALUES (681,'eafb2bd22ca7456d8994e0f2320daf02',2);
INSERT INTO `library_sublayer_status` VALUES (682,'eafb2bd22ca7456d8994e0f2320daf02',3);
INSERT INTO `library_sublayer_status` VALUES (683,'c30276a1a06f405ab2d9d89d7a7e7249',2);
INSERT INTO `library_sublayer_status` VALUES (684,'c30276a1a06f405ab2d9d89d7a7e7249',3);
INSERT INTO `library_sublayer_status` VALUES (685,'8d15c2c51f14448cb61ed5f36c163b7a',2);
INSERT INTO `library_sublayer_status` VALUES (686,'8d15c2c51f14448cb61ed5f36c163b7a',3);
INSERT INTO `library_sublayer_status` VALUES (687,'ec682351cd1d486dbd7f4962a7ba9a21',2);
INSERT INTO `library_sublayer_status` VALUES (688,'ec682351cd1d486dbd7f4962a7ba9a21',3);
INSERT INTO `library_sublayer_status` VALUES (689,'ee6af650b7674010bd8163aec0c365c5',2);
INSERT INTO `library_sublayer_status` VALUES (690,'ee6af650b7674010bd8163aec0c365c5',3);
INSERT INTO `library_sublayer_status` VALUES (691,'4666e87cc16948749b755ac3d1d991ee',2);
INSERT INTO `library_sublayer_status` VALUES (692,'4666e87cc16948749b755ac3d1d991ee',3);
INSERT INTO `library_sublayer_status` VALUES (693,'9d5eacbb3e04497d9d52df5a4756ee78',2);
INSERT INTO `library_sublayer_status` VALUES (694,'9d5eacbb3e04497d9d52df5a4756ee78',3);
INSERT INTO `library_sublayer_status` VALUES (695,'82aa28c4b2e24da1a25e995f6df92f92',2);
INSERT INTO `library_sublayer_status` VALUES (696,'82aa28c4b2e24da1a25e995f6df92f92',3);
INSERT INTO `library_sublayer_status` VALUES (697,'81337c5a3a0e4a738b6181b167c117f5',2);
INSERT INTO `library_sublayer_status` VALUES (698,'81337c5a3a0e4a738b6181b167c117f5',3);
INSERT INTO `library_sublayer_status` VALUES (699,'ea0c16df7d57432b8ea506c0a2501ecb',2);
INSERT INTO `library_sublayer_status` VALUES (700,'ea0c16df7d57432b8ea506c0a2501ecb',3);
INSERT INTO `library_sublayer_status` VALUES (701,'c873a3def2e443098cd57910a0656c49',2);
INSERT INTO `library_sublayer_status` VALUES (702,'c873a3def2e443098cd57910a0656c49',3);
INSERT INTO `library_sublayer_status` VALUES (703,'ad4f4af1ada04a80ab5fa94ce78885e8',2);
INSERT INTO `library_sublayer_status` VALUES (704,'ad4f4af1ada04a80ab5fa94ce78885e8',3);
INSERT INTO `library_sublayer_status` VALUES (705,'fd886ed9beec4c308334b5c07e2ac639',2);
INSERT INTO `library_sublayer_status` VALUES (706,'fd886ed9beec4c308334b5c07e2ac639',3);
INSERT INTO `library_sublayer_status` VALUES (707,'c390c4cc2bb94f1aae2adaa19d6083eb',2);
INSERT INTO `library_sublayer_status` VALUES (708,'c390c4cc2bb94f1aae2adaa19d6083eb',3);
INSERT INTO `library_sublayer_status` VALUES (709,'c2abb2f2dcc2458583324c47daa2a6a6',2);
INSERT INTO `library_sublayer_status` VALUES (710,'c2abb2f2dcc2458583324c47daa2a6a6',3);
INSERT INTO `library_sublayer_status` VALUES (711,'5601ec73389f466dbe741ded28b253ed',2);
INSERT INTO `library_sublayer_status` VALUES (712,'5601ec73389f466dbe741ded28b253ed',3);
INSERT INTO `library_sublayer_status` VALUES (713,'85ce0e3be20348dfb28b6a91ee857a04',2);
INSERT INTO `library_sublayer_status` VALUES (714,'85ce0e3be20348dfb28b6a91ee857a04',3);
INSERT INTO `library_sublayer_status` VALUES (715,'b5450756291c43c5b86b609720f8ef32',2);
INSERT INTO `library_sublayer_status` VALUES (716,'b5450756291c43c5b86b609720f8ef32',3);
INSERT INTO `library_sublayer_status` VALUES (717,'06e2765e503048e285e9526856ffa577',2);
INSERT INTO `library_sublayer_status` VALUES (718,'06e2765e503048e285e9526856ffa577',3);
INSERT INTO `library_sublayer_status` VALUES (719,'72df0eb8d4f74e49b414d5d277b15a21',2);
INSERT INTO `library_sublayer_status` VALUES (720,'72df0eb8d4f74e49b414d5d277b15a21',3);
INSERT INTO `library_sublayer_status` VALUES (721,'569f7856e53748899e79bdbf026dbd6a',2);
INSERT INTO `library_sublayer_status` VALUES (722,'569f7856e53748899e79bdbf026dbd6a',3);
INSERT INTO `library_sublayer_status` VALUES (723,'3baaa8f68f6c4bbab1e0277cd9b2b34e',2);
INSERT INTO `library_sublayer_status` VALUES (724,'3baaa8f68f6c4bbab1e0277cd9b2b34e',3);
INSERT INTO `library_sublayer_status` VALUES (725,'9bc523569661429d9b98b5b8e92ef5f7',2);
INSERT INTO `library_sublayer_status` VALUES (726,'9bc523569661429d9b98b5b8e92ef5f7',3);
INSERT INTO `library_sublayer_status` VALUES (727,'8da572a38a8e4fa4b21a5a2138fb05df',2);
INSERT INTO `library_sublayer_status` VALUES (728,'8da572a38a8e4fa4b21a5a2138fb05df',3);
INSERT INTO `library_sublayer_status` VALUES (729,'558d4c6a9fe04f379e1de81eda4be4ac',2);
INSERT INTO `library_sublayer_status` VALUES (730,'558d4c6a9fe04f379e1de81eda4be4ac',3);
INSERT INTO `library_sublayer_status` VALUES (731,'e077a06a0f76426681bbb4cf75b9a50b',2);
INSERT INTO `library_sublayer_status` VALUES (732,'e077a06a0f76426681bbb4cf75b9a50b',3);
INSERT INTO `library_sublayer_status` VALUES (733,'dd2270910972423998e272729d27c2ea',2);
INSERT INTO `library_sublayer_status` VALUES (734,'dd2270910972423998e272729d27c2ea',3);
INSERT INTO `library_sublayer_status` VALUES (735,'3613fc0c419549e5834ee331db511ce9',2);
INSERT INTO `library_sublayer_status` VALUES (736,'3613fc0c419549e5834ee331db511ce9',3);
INSERT INTO `library_sublayer_status` VALUES (737,'9f133b2a743547d893dddd9dcaaa8f38',2);
INSERT INTO `library_sublayer_status` VALUES (738,'9f133b2a743547d893dddd9dcaaa8f38',3);
INSERT INTO `library_sublayer_status` VALUES (739,'e71e0cdc8c7c4f3bb1f411e035b9fe80',2);
INSERT INTO `library_sublayer_status` VALUES (740,'e71e0cdc8c7c4f3bb1f411e035b9fe80',3);
INSERT INTO `library_sublayer_status` VALUES (741,'bcc3c848efd248e88196d5a04d878309',2);
INSERT INTO `library_sublayer_status` VALUES (742,'bcc3c848efd248e88196d5a04d878309',3);
INSERT INTO `library_sublayer_status` VALUES (743,'15b99bd50fc849f088ea634b394691a5',2);
INSERT INTO `library_sublayer_status` VALUES (744,'15b99bd50fc849f088ea634b394691a5',3);
INSERT INTO `library_sublayer_status` VALUES (745,'3a029cbfbbf14efc94c3a1cb5e1b9412',2);
INSERT INTO `library_sublayer_status` VALUES (746,'3a029cbfbbf14efc94c3a1cb5e1b9412',3);
INSERT INTO `library_sublayer_status` VALUES (747,'9f232321c17f45498f23d5da70dbd962',2);
INSERT INTO `library_sublayer_status` VALUES (748,'9f232321c17f45498f23d5da70dbd962',3);
INSERT INTO `library_sublayer_status` VALUES (749,'8e5908f64a8041cf83f3c3b0b317a136',2);
INSERT INTO `library_sublayer_status` VALUES (750,'8e5908f64a8041cf83f3c3b0b317a136',3);
INSERT INTO `library_sublayer_status` VALUES (751,'9b2b1c5f4b2543cea59533e9a103aaf9',2);
INSERT INTO `library_sublayer_status` VALUES (752,'9b2b1c5f4b2543cea59533e9a103aaf9',3);
INSERT INTO `library_sublayer_status` VALUES (753,'3c3f19f802be44678ff29fa8f1383a21',2);
INSERT INTO `library_sublayer_status` VALUES (754,'3c3f19f802be44678ff29fa8f1383a21',3);
INSERT INTO `library_sublayer_status` VALUES (755,'b6e67dfa35f44269b1a760b8b828ccf3',2);
INSERT INTO `library_sublayer_status` VALUES (756,'b6e67dfa35f44269b1a760b8b828ccf3',3);
INSERT INTO `library_sublayer_status` VALUES (757,'70e39cf40baa4a2d9f2e0f8f2a898439',2);
INSERT INTO `library_sublayer_status` VALUES (758,'70e39cf40baa4a2d9f2e0f8f2a898439',3);
INSERT INTO `library_sublayer_status` VALUES (759,'03714a629e754fe0ae8864d6c30dbf28',2);
INSERT INTO `library_sublayer_status` VALUES (760,'03714a629e754fe0ae8864d6c30dbf28',3);
INSERT INTO `library_sublayer_status` VALUES (761,'ba58fe42e7d6472babc2654f594846fa',2);
INSERT INTO `library_sublayer_status` VALUES (762,'ba58fe42e7d6472babc2654f594846fa',3);
INSERT INTO `library_sublayer_status` VALUES (763,'56c7edbd65064b55aea9c9ed19a794ab',2);
INSERT INTO `library_sublayer_status` VALUES (764,'56c7edbd65064b55aea9c9ed19a794ab',3);
INSERT INTO `library_sublayer_status` VALUES (765,'b308e80dc75d4ef396f77a629f0b64ab',2);
INSERT INTO `library_sublayer_status` VALUES (766,'b308e80dc75d4ef396f77a629f0b64ab',3);
INSERT INTO `library_sublayer_status` VALUES (767,'e7371595f5d04257bdfbe3f8fdd3a91c',2);
INSERT INTO `library_sublayer_status` VALUES (768,'e7371595f5d04257bdfbe3f8fdd3a91c',3);
INSERT INTO `library_sublayer_status` VALUES (769,'3ff062a50af747d598b7a2d4897eb1e5',2);
INSERT INTO `library_sublayer_status` VALUES (770,'3ff062a50af747d598b7a2d4897eb1e5',3);
INSERT INTO `library_sublayer_status` VALUES (771,'92e3dff8cfb144efabc66a4b1217ed88',2);
INSERT INTO `library_sublayer_status` VALUES (772,'92e3dff8cfb144efabc66a4b1217ed88',3);
INSERT INTO `library_sublayer_status` VALUES (773,'6394795361df45be941d60f0ad220d7a',2);
INSERT INTO `library_sublayer_status` VALUES (774,'6394795361df45be941d60f0ad220d7a',3);
INSERT INTO `library_sublayer_status` VALUES (775,'aa06138237e0498f9364321abf181150',2);
INSERT INTO `library_sublayer_status` VALUES (776,'aa06138237e0498f9364321abf181150',3);
INSERT INTO `library_sublayer_status` VALUES (777,'82d7675c6c654d0fb2aeee6f5adf4eda',2);
INSERT INTO `library_sublayer_status` VALUES (778,'82d7675c6c654d0fb2aeee6f5adf4eda',3);
INSERT INTO `library_sublayer_status` VALUES (779,'bbac91ba2be340ab8fcd033fdb067cb4',2);
INSERT INTO `library_sublayer_status` VALUES (780,'bbac91ba2be340ab8fcd033fdb067cb4',3);
INSERT INTO `library_sublayer_status` VALUES (781,'7bcc3f20bad140c08e7240bb3d4b37cd',2);
INSERT INTO `library_sublayer_status` VALUES (782,'7bcc3f20bad140c08e7240bb3d4b37cd',3);
INSERT INTO `library_sublayer_status` VALUES (783,'f28d9d926ded4b7ea52c1b8a4b981c0e',2);
INSERT INTO `library_sublayer_status` VALUES (784,'f28d9d926ded4b7ea52c1b8a4b981c0e',3);
INSERT INTO `library_sublayer_status` VALUES (785,'8bbc9a62b87e498f931ffd92f4be35f9',2);
INSERT INTO `library_sublayer_status` VALUES (786,'8bbc9a62b87e498f931ffd92f4be35f9',3);
INSERT INTO `library_sublayer_status` VALUES (787,'8d7f2cb2dec14f1a808b5e39bc87c20d',2);
INSERT INTO `library_sublayer_status` VALUES (788,'8d7f2cb2dec14f1a808b5e39bc87c20d',3);
INSERT INTO `library_sublayer_status` VALUES (789,'e67c3689d9d14b11b19dcfd880204951',2);
INSERT INTO `library_sublayer_status` VALUES (790,'e67c3689d9d14b11b19dcfd880204951',3);
INSERT INTO `library_sublayer_status` VALUES (791,'71ed1f12d82d49b88a7d466edacc9126',2);
INSERT INTO `library_sublayer_status` VALUES (792,'71ed1f12d82d49b88a7d466edacc9126',3);
INSERT INTO `library_sublayer_status` VALUES (793,'a784756dc31541969ee08fa21f5d99a0',2);
INSERT INTO `library_sublayer_status` VALUES (794,'a784756dc31541969ee08fa21f5d99a0',3);
INSERT INTO `library_sublayer_status` VALUES (795,'a9e1449b8fe34b3894579d389a6c51a6',2);
INSERT INTO `library_sublayer_status` VALUES (796,'a9e1449b8fe34b3894579d389a6c51a6',3);
INSERT INTO `library_sublayer_status` VALUES (797,'2b4a2e3ea0e648888aa410d0b80eb75d',2);
INSERT INTO `library_sublayer_status` VALUES (798,'2b4a2e3ea0e648888aa410d0b80eb75d',3);
INSERT INTO `library_sublayer_status` VALUES (799,'d6bf37be1aad4d9cbcb99866101492c5',2);
INSERT INTO `library_sublayer_status` VALUES (800,'d6bf37be1aad4d9cbcb99866101492c5',3);
INSERT INTO `library_sublayer_status` VALUES (801,'f1b8bfb6ae894763b0c9627a5dee83e8',2);
INSERT INTO `library_sublayer_status` VALUES (802,'f1b8bfb6ae894763b0c9627a5dee83e8',3);
INSERT INTO `library_sublayer_status` VALUES (803,'f351626e2e2940e0bc11adf3c83d61bc',2);
INSERT INTO `library_sublayer_status` VALUES (804,'f351626e2e2940e0bc11adf3c83d61bc',3);
INSERT INTO `library_sublayer_status` VALUES (805,'f11847db15de4ae69fe1d1067c836240',2);
INSERT INTO `library_sublayer_status` VALUES (806,'f11847db15de4ae69fe1d1067c836240',3);
INSERT INTO `library_sublayer_status` VALUES (807,'93559e2e32264ee58bc471b8617533db',2);
INSERT INTO `library_sublayer_status` VALUES (808,'93559e2e32264ee58bc471b8617533db',3);
INSERT INTO `library_sublayer_status` VALUES (809,'709f534f9ff44e23958cdd7667aaa9be',2);
INSERT INTO `library_sublayer_status` VALUES (810,'709f534f9ff44e23958cdd7667aaa9be',3);
INSERT INTO `library_sublayer_status` VALUES (811,'b795c6ae29dc4fcfa87445baee6e33ef',2);
INSERT INTO `library_sublayer_status` VALUES (812,'b795c6ae29dc4fcfa87445baee6e33ef',3);
INSERT INTO `library_sublayer_status` VALUES (813,'0facb9393f9a4e35bb75c5f46d7d7a8c',2);
INSERT INTO `library_sublayer_status` VALUES (814,'0facb9393f9a4e35bb75c5f46d7d7a8c',3);
INSERT INTO `library_sublayer_status` VALUES (815,'65c80d35ddf64fc4a2de5a1b75836859',2);
INSERT INTO `library_sublayer_status` VALUES (816,'65c80d35ddf64fc4a2de5a1b75836859',3);
INSERT INTO `library_sublayer_status` VALUES (817,'87ebb0d8eb734c959a2114e3e2ffe3a6',2);
INSERT INTO `library_sublayer_status` VALUES (818,'87ebb0d8eb734c959a2114e3e2ffe3a6',3);
INSERT INTO `library_sublayer_status` VALUES (819,'1fbf243d2d92454b91504f384227f0b8',2);
INSERT INTO `library_sublayer_status` VALUES (820,'1fbf243d2d92454b91504f384227f0b8',3);
INSERT INTO `library_sublayer_status` VALUES (821,'2b94961ec244444185023357a7263f8b',2);
INSERT INTO `library_sublayer_status` VALUES (822,'2b94961ec244444185023357a7263f8b',3);
INSERT INTO `library_sublayer_status` VALUES (823,'ae2624a722d74a70969ce94ada21550a',2);
INSERT INTO `library_sublayer_status` VALUES (824,'ae2624a722d74a70969ce94ada21550a',3);
INSERT INTO `library_sublayer_status` VALUES (825,'0bcea527322d44a8abc7ff1c677a8736',2);
INSERT INTO `library_sublayer_status` VALUES (826,'0bcea527322d44a8abc7ff1c677a8736',3);
INSERT INTO `library_sublayer_status` VALUES (827,'3772f6ef08b34c0a9cf6f910b210fcee',2);
INSERT INTO `library_sublayer_status` VALUES (828,'3772f6ef08b34c0a9cf6f910b210fcee',3);
INSERT INTO `library_sublayer_status` VALUES (829,'72a760469da54d5594ed0e3a2314a565',2);
INSERT INTO `library_sublayer_status` VALUES (830,'72a760469da54d5594ed0e3a2314a565',3);
INSERT INTO `library_sublayer_status` VALUES (831,'47dbc3caf83742dc809a2e30a388c9e1',2);
INSERT INTO `library_sublayer_status` VALUES (832,'47dbc3caf83742dc809a2e30a388c9e1',3);
INSERT INTO `library_sublayer_status` VALUES (833,'f7e6e3a992414a17abb896af4d5d29b2',2);
INSERT INTO `library_sublayer_status` VALUES (834,'f7e6e3a992414a17abb896af4d5d29b2',3);
INSERT INTO `library_sublayer_status` VALUES (835,'3fa803fc87154f0481d95b91c1f89baf',2);
INSERT INTO `library_sublayer_status` VALUES (836,'3fa803fc87154f0481d95b91c1f89baf',3);
INSERT INTO `library_sublayer_status` VALUES (837,'f721d4d57f7344bcbe071582f332623d',2);
INSERT INTO `library_sublayer_status` VALUES (838,'f721d4d57f7344bcbe071582f332623d',3);
INSERT INTO `library_sublayer_status` VALUES (839,'58d306301a724bb2869fd61635696017',2);
INSERT INTO `library_sublayer_status` VALUES (840,'58d306301a724bb2869fd61635696017',3);
INSERT INTO `library_sublayer_status` VALUES (841,'1d8aebae1c69434991895fa3089c1d9e',2);
INSERT INTO `library_sublayer_status` VALUES (842,'1d8aebae1c69434991895fa3089c1d9e',3);
INSERT INTO `library_sublayer_status` VALUES (843,'2bb3563d79af48a98bfaaea8ca777a34',2);
INSERT INTO `library_sublayer_status` VALUES (844,'2bb3563d79af48a98bfaaea8ca777a34',3);
INSERT INTO `library_sublayer_status` VALUES (845,'38a6121bd3444d7ab5759be1c702b08a',2);
INSERT INTO `library_sublayer_status` VALUES (846,'38a6121bd3444d7ab5759be1c702b08a',3);
INSERT INTO `library_sublayer_status` VALUES (847,'a0ab0bf077ea4e418a6b69693e7b42dd',2);
INSERT INTO `library_sublayer_status` VALUES (848,'a0ab0bf077ea4e418a6b69693e7b42dd',3);
INSERT INTO `library_sublayer_status` VALUES (849,'35afceb6bcbd479b890224a15c7397f5',2);
INSERT INTO `library_sublayer_status` VALUES (850,'35afceb6bcbd479b890224a15c7397f5',3);
INSERT INTO `library_sublayer_status` VALUES (851,'ef3595c308144eeeaf8155763abde9f8',2);
INSERT INTO `library_sublayer_status` VALUES (852,'ef3595c308144eeeaf8155763abde9f8',3);
INSERT INTO `library_sublayer_status` VALUES (853,'1f03c01f3dcf44e1be3189794b47d1b6',2);
INSERT INTO `library_sublayer_status` VALUES (854,'1f03c01f3dcf44e1be3189794b47d1b6',3);
INSERT INTO `library_sublayer_status` VALUES (855,'b12cebdedc4341aca9f14c83978d2126',2);
INSERT INTO `library_sublayer_status` VALUES (856,'b12cebdedc4341aca9f14c83978d2126',3);
INSERT INTO `library_sublayer_status` VALUES (857,'aec8de5801ca46b5b3651726756acbd6',2);
INSERT INTO `library_sublayer_status` VALUES (858,'aec8de5801ca46b5b3651726756acbd6',3);
INSERT INTO `library_sublayer_status` VALUES (859,'78f7b23515064cebb2b0216090015b9a',2);
INSERT INTO `library_sublayer_status` VALUES (860,'78f7b23515064cebb2b0216090015b9a',3);
INSERT INTO `library_sublayer_status` VALUES (861,'744f01e6b30246b2927c572815c34f49',2);
INSERT INTO `library_sublayer_status` VALUES (862,'744f01e6b30246b2927c572815c34f49',3);
INSERT INTO `library_sublayer_status` VALUES (863,'c6097e3f05e0418ba940e7a7c1f6c700',2);
INSERT INTO `library_sublayer_status` VALUES (864,'c6097e3f05e0418ba940e7a7c1f6c700',3);
INSERT INTO `library_sublayer_status` VALUES (865,'fba72acb7fad470680258b508d3e2424',2);
INSERT INTO `library_sublayer_status` VALUES (866,'fba72acb7fad470680258b508d3e2424',3);
INSERT INTO `library_sublayer_status` VALUES (867,'96999c295e164bb3a2be75718d898378',2);
INSERT INTO `library_sublayer_status` VALUES (868,'96999c295e164bb3a2be75718d898378',3);
INSERT INTO `library_sublayer_status` VALUES (869,'c61a196be20b4f57a5599806432a3937',2);
INSERT INTO `library_sublayer_status` VALUES (870,'c61a196be20b4f57a5599806432a3937',3);
INSERT INTO `library_sublayer_status` VALUES (871,'7545d997957b4ef2b2665314e7b61bee',2);
INSERT INTO `library_sublayer_status` VALUES (872,'7545d997957b4ef2b2665314e7b61bee',3);
INSERT INTO `library_sublayer_status` VALUES (873,'736612ecc56d44859033ca9b073b69f7',2);
INSERT INTO `library_sublayer_status` VALUES (874,'736612ecc56d44859033ca9b073b69f7',3);
INSERT INTO `library_sublayer_status` VALUES (875,'bbe99a00a8b9428f8ab37cbbb1ece193',2);
INSERT INTO `library_sublayer_status` VALUES (876,'bbe99a00a8b9428f8ab37cbbb1ece193',3);
INSERT INTO `library_sublayer_status` VALUES (877,'1317b5e8b993488dba088ec532b1daa4',2);
INSERT INTO `library_sublayer_status` VALUES (878,'1317b5e8b993488dba088ec532b1daa4',3);
INSERT INTO `library_sublayer_status` VALUES (879,'934ef03a61e248f9a0ceb5053f70f649',2);
INSERT INTO `library_sublayer_status` VALUES (880,'934ef03a61e248f9a0ceb5053f70f649',3);
INSERT INTO `library_sublayer_status` VALUES (881,'fcc917b1576946aeb7cc97e6305568ce',2);
INSERT INTO `library_sublayer_status` VALUES (882,'fcc917b1576946aeb7cc97e6305568ce',3);
INSERT INTO `library_sublayer_status` VALUES (883,'6ffc803d30924593969421a2e040d47e',2);
INSERT INTO `library_sublayer_status` VALUES (884,'6ffc803d30924593969421a2e040d47e',3);
INSERT INTO `library_sublayer_status` VALUES (885,'00bdc51277754fd08faa83ae020f7740',2);
INSERT INTO `library_sublayer_status` VALUES (886,'00bdc51277754fd08faa83ae020f7740',3);
INSERT INTO `library_sublayer_status` VALUES (887,'d33c125840e54b14960050505db7308a',2);
INSERT INTO `library_sublayer_status` VALUES (888,'d33c125840e54b14960050505db7308a',3);
INSERT INTO `library_sublayer_status` VALUES (889,'0c248cd88c224d9998471fa44dc6228e',2);
INSERT INTO `library_sublayer_status` VALUES (890,'0c248cd88c224d9998471fa44dc6228e',3);
INSERT INTO `library_sublayer_status` VALUES (891,'24ebb0cbd1a04acd8b0af9a4f7c3fcbc',2);
INSERT INTO `library_sublayer_status` VALUES (892,'24ebb0cbd1a04acd8b0af9a4f7c3fcbc',3);
INSERT INTO `library_sublayer_status` VALUES (893,'0aa360bddc964210832e6813f1378b94',2);
INSERT INTO `library_sublayer_status` VALUES (894,'0aa360bddc964210832e6813f1378b94',3);
INSERT INTO `library_sublayer_status` VALUES (895,'f489b40609f241609d313f59a3bd2be0',2);
INSERT INTO `library_sublayer_status` VALUES (896,'f489b40609f241609d313f59a3bd2be0',3);
INSERT INTO `library_sublayer_status` VALUES (897,'dbdb1a48068d4cc5a143bc7f3078fedb',2);
INSERT INTO `library_sublayer_status` VALUES (898,'dbdb1a48068d4cc5a143bc7f3078fedb',3);
INSERT INTO `library_sublayer_status` VALUES (899,'082526dbe3ed44f088d767de324e52f7',2);
INSERT INTO `library_sublayer_status` VALUES (900,'082526dbe3ed44f088d767de324e52f7',3);
INSERT INTO `library_sublayer_status` VALUES (901,'c71ffd4f4a7542319e74f39a2558b781',2);
INSERT INTO `library_sublayer_status` VALUES (902,'c71ffd4f4a7542319e74f39a2558b781',3);
INSERT INTO `library_sublayer_status` VALUES (903,'402944843138422c96ffcacb7051e2b3',2);
INSERT INTO `library_sublayer_status` VALUES (904,'402944843138422c96ffcacb7051e2b3',3);
INSERT INTO `library_sublayer_status` VALUES (905,'d80fdd2ab5914a619a5d29ea18b0ef6b',2);
INSERT INTO `library_sublayer_status` VALUES (906,'d80fdd2ab5914a619a5d29ea18b0ef6b',3);
INSERT INTO `library_sublayer_status` VALUES (907,'05dd0f5e75a342daa91f25b72669d375',2);
INSERT INTO `library_sublayer_status` VALUES (908,'05dd0f5e75a342daa91f25b72669d375',3);
INSERT INTO `library_sublayer_status` VALUES (909,'d655014042bd41e78de02759d872585d',2);
INSERT INTO `library_sublayer_status` VALUES (910,'d655014042bd41e78de02759d872585d',3);
INSERT INTO `library_sublayer_status` VALUES (911,'838901e5fd3c44b9ae632990f5122dc2',2);
INSERT INTO `library_sublayer_status` VALUES (912,'838901e5fd3c44b9ae632990f5122dc2',3);
INSERT INTO `library_sublayer_status` VALUES (913,'25da7eb8743f4a6488466666fbf42b23',2);
INSERT INTO `library_sublayer_status` VALUES (914,'25da7eb8743f4a6488466666fbf42b23',3);
INSERT INTO `library_sublayer_status` VALUES (915,'8786ef07a8ee45239c19bfadedc664e7',2);
INSERT INTO `library_sublayer_status` VALUES (916,'8786ef07a8ee45239c19bfadedc664e7',3);
INSERT INTO `library_sublayer_status` VALUES (917,'9dd15c02bac74957a78f788873f33df0',2);
INSERT INTO `library_sublayer_status` VALUES (918,'9dd15c02bac74957a78f788873f33df0',3);
INSERT INTO `library_sublayer_status` VALUES (919,'dfcf569029434f74ae3a40d9f6d36ae7',2);
INSERT INTO `library_sublayer_status` VALUES (920,'dfcf569029434f74ae3a40d9f6d36ae7',3);
INSERT INTO `library_sublayer_status` VALUES (921,'a324b4d6b5e14de3b6f6219274142102',2);
INSERT INTO `library_sublayer_status` VALUES (922,'a324b4d6b5e14de3b6f6219274142102',3);
INSERT INTO `library_sublayer_status` VALUES (923,'a0d4d3c4ffd644e3ac289812d6b1e2aa',2);
INSERT INTO `library_sublayer_status` VALUES (924,'a0d4d3c4ffd644e3ac289812d6b1e2aa',3);
INSERT INTO `library_sublayer_status` VALUES (925,'7ab296be64d54c87ae23ed5e0881af71',2);
INSERT INTO `library_sublayer_status` VALUES (926,'7ab296be64d54c87ae23ed5e0881af71',3);
INSERT INTO `library_sublayer_status` VALUES (927,'73f63871e97749bab044e0757f3b0de7',2);
INSERT INTO `library_sublayer_status` VALUES (928,'73f63871e97749bab044e0757f3b0de7',3);
INSERT INTO `library_sublayer_status` VALUES (929,'5cc5e718d8e1445882a1d0188f67a61e',2);
INSERT INTO `library_sublayer_status` VALUES (930,'5cc5e718d8e1445882a1d0188f67a61e',3);
INSERT INTO `library_sublayer_status` VALUES (931,'b799564701624a549bbd902da45a8a47',2);
INSERT INTO `library_sublayer_status` VALUES (932,'b799564701624a549bbd902da45a8a47',3);
INSERT INTO `library_sublayer_status` VALUES (933,'8ee13370e23b4af1aca475898a9c7ee1',2);
INSERT INTO `library_sublayer_status` VALUES (934,'8ee13370e23b4af1aca475898a9c7ee1',3);
INSERT INTO `library_sublayer_status` VALUES (935,'92aa195abc904dacae73aba5385d175e',2);
INSERT INTO `library_sublayer_status` VALUES (936,'92aa195abc904dacae73aba5385d175e',3);
INSERT INTO `library_sublayer_status` VALUES (937,'72fa8062630245fba798fa5f4f0cba00',2);
INSERT INTO `library_sublayer_status` VALUES (938,'72fa8062630245fba798fa5f4f0cba00',3);
INSERT INTO `library_sublayer_status` VALUES (939,'0f6214dc34504c10938ebb874e8a90ae',2);
INSERT INTO `library_sublayer_status` VALUES (940,'0f6214dc34504c10938ebb874e8a90ae',3);
INSERT INTO `library_sublayer_status` VALUES (941,'8c90182c17914243ad64ddb51ca2c428',2);
INSERT INTO `library_sublayer_status` VALUES (942,'8c90182c17914243ad64ddb51ca2c428',3);
INSERT INTO `library_sublayer_status` VALUES (943,'b37595ff43bc452dbd1d2309cda7f394',2);
INSERT INTO `library_sublayer_status` VALUES (944,'b37595ff43bc452dbd1d2309cda7f394',3);
INSERT INTO `library_sublayer_status` VALUES (945,'a264712f14db4d73aecf40f6ef385056',2);
INSERT INTO `library_sublayer_status` VALUES (946,'a264712f14db4d73aecf40f6ef385056',3);
INSERT INTO `library_sublayer_status` VALUES (947,'02be432d29d04f05a95cd6c692a13bef',2);
INSERT INTO `library_sublayer_status` VALUES (948,'02be432d29d04f05a95cd6c692a13bef',3);
INSERT INTO `library_sublayer_status` VALUES (949,'8f35ab2a7b6a417696a2c5a29c70e0d5',2);
INSERT INTO `library_sublayer_status` VALUES (950,'8f35ab2a7b6a417696a2c5a29c70e0d5',3);
INSERT INTO `library_sublayer_status` VALUES (951,'1b457f71a7cf4463b78410c7db6536a4',2);
INSERT INTO `library_sublayer_status` VALUES (952,'1b457f71a7cf4463b78410c7db6536a4',3);
INSERT INTO `library_sublayer_status` VALUES (953,'26cc63266c6348ca948a84daa9cb46cf',2);
INSERT INTO `library_sublayer_status` VALUES (954,'26cc63266c6348ca948a84daa9cb46cf',3);
INSERT INTO `library_sublayer_status` VALUES (955,'2f73f174d6234e458105b4698513b3a2',2);
INSERT INTO `library_sublayer_status` VALUES (956,'2f73f174d6234e458105b4698513b3a2',3);
INSERT INTO `library_sublayer_status` VALUES (957,'46bb380410a14a0c8c85a80fabe612fa',2);
INSERT INTO `library_sublayer_status` VALUES (958,'46bb380410a14a0c8c85a80fabe612fa',3);
INSERT INTO `library_sublayer_status` VALUES (959,'ed2b1e16b09f429fa770dbcd7bf56c9d',2);
INSERT INTO `library_sublayer_status` VALUES (960,'ed2b1e16b09f429fa770dbcd7bf56c9d',3);
INSERT INTO `library_sublayer_status` VALUES (961,'a4931144a23941759e99d04950cec301',2);
INSERT INTO `library_sublayer_status` VALUES (962,'a4931144a23941759e99d04950cec301',3);
INSERT INTO `library_sublayer_status` VALUES (963,'8e45973c25e3481580af66a572795448',2);
INSERT INTO `library_sublayer_status` VALUES (964,'8e45973c25e3481580af66a572795448',3);
INSERT INTO `library_sublayer_status` VALUES (965,'24cebd8487334d4fa5f4e0266fc46398',2);
INSERT INTO `library_sublayer_status` VALUES (966,'24cebd8487334d4fa5f4e0266fc46398',3);
INSERT INTO `library_sublayer_status` VALUES (967,'95f979fcc51c4c368f5f790e8e61b3ba',2);
INSERT INTO `library_sublayer_status` VALUES (968,'95f979fcc51c4c368f5f790e8e61b3ba',3);
INSERT INTO `library_sublayer_status` VALUES (969,'80cde3c1b2da4ca7a485ee1f04faf1fc',2);
INSERT INTO `library_sublayer_status` VALUES (970,'80cde3c1b2da4ca7a485ee1f04faf1fc',3);
INSERT INTO `library_sublayer_status` VALUES (971,'b4a013659e3949f0b3f02acff9639a79',2);
INSERT INTO `library_sublayer_status` VALUES (972,'b4a013659e3949f0b3f02acff9639a79',3);
INSERT INTO `library_sublayer_status` VALUES (973,'fb94db9b7d66424a92ae2ff63e1a0cb7',2);
INSERT INTO `library_sublayer_status` VALUES (974,'fb94db9b7d66424a92ae2ff63e1a0cb7',3);
INSERT INTO `library_sublayer_status` VALUES (975,'ed575d7777f347769d5f1cfc64532bac',2);
INSERT INTO `library_sublayer_status` VALUES (976,'ed575d7777f347769d5f1cfc64532bac',3);
INSERT INTO `library_sublayer_status` VALUES (977,'2880dd4a09dc40219d8b3e2e15acdef0',2);
INSERT INTO `library_sublayer_status` VALUES (978,'2880dd4a09dc40219d8b3e2e15acdef0',3);
INSERT INTO `library_sublayer_status` VALUES (979,'95ac592eeaee4c82b0782eb732aa078b',2);
INSERT INTO `library_sublayer_status` VALUES (980,'95ac592eeaee4c82b0782eb732aa078b',3);
INSERT INTO `library_sublayer_status` VALUES (981,'3eeb31b6a06c45cf9dadd85a9757653b',2);
INSERT INTO `library_sublayer_status` VALUES (982,'3eeb31b6a06c45cf9dadd85a9757653b',3);
INSERT INTO `library_sublayer_status` VALUES (983,'918adab6951d49a1b6aa2e8b7559e1d8',2);
INSERT INTO `library_sublayer_status` VALUES (984,'918adab6951d49a1b6aa2e8b7559e1d8',3);
INSERT INTO `library_sublayer_status` VALUES (985,'a2d1223d1d694535bc2ca74ceecc9d7b',2);
INSERT INTO `library_sublayer_status` VALUES (986,'a2d1223d1d694535bc2ca74ceecc9d7b',3);
INSERT INTO `library_sublayer_status` VALUES (987,'64803182d08b48378714a0cece4c41af',2);
INSERT INTO `library_sublayer_status` VALUES (988,'64803182d08b48378714a0cece4c41af',3);
INSERT INTO `library_sublayer_status` VALUES (989,'f84088e39af8454b857649f65673ae69',2);
INSERT INTO `library_sublayer_status` VALUES (990,'f84088e39af8454b857649f65673ae69',3);
INSERT INTO `library_sublayer_status` VALUES (991,'d7c7b08bc5a14412baa4adb322752bad',2);
INSERT INTO `library_sublayer_status` VALUES (992,'d7c7b08bc5a14412baa4adb322752bad',3);
INSERT INTO `library_sublayer_status` VALUES (993,'3520886754df41a6b6fb36b7e3c252c7',2);
INSERT INTO `library_sublayer_status` VALUES (994,'3520886754df41a6b6fb36b7e3c252c7',3);
INSERT INTO `library_sublayer_status` VALUES (995,'b71daac7f2d04d1da7a0e1b4f6fed2c7',2);
INSERT INTO `library_sublayer_status` VALUES (996,'b71daac7f2d04d1da7a0e1b4f6fed2c7',3);
INSERT INTO `library_sublayer_status` VALUES (997,'13cc3cd59f064aa8a12d7fda153738df',2);
INSERT INTO `library_sublayer_status` VALUES (998,'13cc3cd59f064aa8a12d7fda153738df',3);
INSERT INTO `library_sublayer_status` VALUES (999,'ef3ec2d02bdb433eb561af585800616d',2);
INSERT INTO `library_sublayer_status` VALUES (1000,'ef3ec2d02bdb433eb561af585800616d',3);
/*!40000 ALTER TABLE `library_sublayer_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `silk_profile`
--

DROP TABLE IF EXISTS `silk_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `silk_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `time_taken` double DEFAULT NULL,
  `file_path` varchar(300) NOT NULL,
  `line_num` int DEFAULT NULL,
  `end_line_num` int DEFAULT NULL,
  `func_name` varchar(300) NOT NULL,
  `exception_raised` tinyint(1) NOT NULL,
  `dynamic` tinyint(1) NOT NULL,
  `request_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `silk_profile_request_id_7b81bd69_fk_silk_request_id` (`request_id`),
  CONSTRAINT `silk_profile_request_id_7b81bd69_fk_silk_request_id` FOREIGN KEY (`request_id`) REFERENCES `silk_request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `silk_profile`
--
-- ORDER BY:  `id`,`request_id`

LOCK TABLES `silk_profile` WRITE;
/*!40000 ALTER TABLE `silk_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `silk_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `silk_profile_queries`
--

DROP TABLE IF EXISTS `silk_profile_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `silk_profile_queries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `profile_id` int NOT NULL,
  `sqlquery_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `silk_profile_queries_profile_id_sqlquery_id_b2403d9b_uniq` (`profile_id`,`sqlquery_id`),
  KEY `silk_profile_queries_sqlquery_id_155df455_fk_silk_sqlquery_id` (`sqlquery_id`),
  CONSTRAINT `silk_profile_queries_profile_id_a3d76db8_fk_silk_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `silk_profile` (`id`),
  CONSTRAINT `silk_profile_queries_sqlquery_id_155df455_fk_silk_sqlquery_id` FOREIGN KEY (`sqlquery_id`) REFERENCES `silk_sqlquery` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `silk_profile_queries`
--
-- ORDER BY:  `id`,`profile_id`,`sqlquery_id`,`sqlquery_id`

LOCK TABLES `silk_profile_queries` WRITE;
/*!40000 ALTER TABLE `silk_profile_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `silk_profile_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `silk_request`
--

DROP TABLE IF EXISTS `silk_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `silk_request` (
  `id` varchar(36) NOT NULL,
  `path` varchar(190) NOT NULL,
  `query_params` longtext NOT NULL,
  `raw_body` longtext NOT NULL,
  `body` longtext NOT NULL,
  `method` varchar(10) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `view_name` varchar(190) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `time_taken` double DEFAULT NULL,
  `encoded_headers` longtext NOT NULL,
  `meta_time` double DEFAULT NULL,
  `meta_num_queries` int DEFAULT NULL,
  `meta_time_spent_queries` double DEFAULT NULL,
  `pyprofile` longtext NOT NULL,
  `num_sql_queries` int NOT NULL,
  `prof_file` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `silk_request_path_9f3d798e` (`path`),
  KEY `silk_request_start_time_1300bc58` (`start_time`),
  KEY `silk_request_view_name_68559f7b` (`view_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `silk_request`
--
-- ORDER BY:  `id`,`path`,`start_time`,`view_name`

LOCK TABLES `silk_request` WRITE;
/*!40000 ALTER TABLE `silk_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `silk_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `silk_sqlquery`
--

DROP TABLE IF EXISTS `silk_sqlquery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `silk_sqlquery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `query` longtext NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `time_taken` double DEFAULT NULL,
  `traceback` longtext NOT NULL,
  `request_id` varchar(36) DEFAULT NULL,
  `identifier` int NOT NULL,
  `analysis` longtext,
  PRIMARY KEY (`id`),
  KEY `silk_sqlquery_request_id_6f8f0527_fk_silk_request_id` (`request_id`),
  CONSTRAINT `silk_sqlquery_request_id_6f8f0527_fk_silk_request_id` FOREIGN KEY (`request_id`) REFERENCES `silk_request` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5597 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `silk_sqlquery`
--
-- ORDER BY:  `id`,`request_id`

LOCK TABLES `silk_sqlquery` WRITE;
/*!40000 ALTER TABLE `silk_sqlquery` DISABLE KEYS */;
/*!40000 ALTER TABLE `silk_sqlquery` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-30 22:38:41
