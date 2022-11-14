-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbpractices
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add problem',7,'add_problem'),(26,'Can change problem',7,'change_problem'),(27,'Can delete problem',7,'delete_problem'),(28,'Can view problem',7,'view_problem'),(29,'Can add section',8,'add_section'),(30,'Can change section',8,'change_section'),(31,'Can delete section',8,'delete_section'),(32,'Can view section',8,'view_section'),(33,'Can add subject',9,'add_subject'),(34,'Can change subject',9,'change_subject'),(35,'Can delete subject',9,'delete_subject'),(36,'Can view subject',9,'view_subject'),(37,'Can add student',10,'add_student'),(38,'Can change student',10,'change_student'),(39,'Can delete student',10,'delete_student'),(40,'Can view student',10,'view_student'),(41,'Can add score',11,'add_score'),(42,'Can change score',11,'change_score'),(43,'Can delete score',11,'delete_score'),(44,'Can view score',11,'view_score');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$J1OWJ2b8ceAybLHzPXen84$oT/PRLvMU1rFwFvxQy1zlm1qZ2IIYk8Oowl2OvXXbC0=','2022-11-10 14:28:44.709519',1,'admin','','','admin@hotmail.com',1,1,'2022-11-09 15:03:28.069983');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-11-09 15:06:46.090037','1','3N1',1,'[{\"added\": {}}]',8,1),(2,'2022-11-09 15:06:52.257353','2','3N2',1,'[{\"added\": {}}]',8,1),(3,'2022-11-09 15:06:55.801790','3','3R1',1,'[{\"added\": {}}]',8,1),(4,'2022-11-09 15:07:02.213191','4','3R2',1,'[{\"added\": {}}]',8,1),(5,'2022-11-09 15:07:07.704909','5','4N1',1,'[{\"added\": {}}]',8,1),(6,'2022-11-09 15:07:12.869420','6','4N2',1,'[{\"added\": {}}]',8,1),(7,'2022-11-09 15:07:16.657481','7','4R1',1,'[{\"added\": {}}]',8,1),(8,'2022-11-09 15:07:22.848006','8','4R2',1,'[{\"added\": {}}]',8,1),(9,'2022-11-09 15:08:34.152091','002','002 : John (3N1) ',1,'[{\"added\": {}}]',10,1),(10,'2022-11-09 15:08:44.152651','003','003 : Anny (3R1) ',1,'[{\"added\": {}}]',10,1),(11,'2022-11-09 15:08:56.819380','004','004 : Sam (3N2) ',1,'[{\"added\": {}}]',10,1),(12,'2022-11-09 15:09:06.455539','005','005 : Adda (3R1) ',1,'[{\"added\": {}}]',10,1),(13,'2022-11-09 15:09:29.466528','001','001 : Sample (3N2) ',1,'[{\"added\": {}}]',10,1),(14,'2022-11-09 15:09:47.879584','006','006 : Jonathan (3R1) ',1,'[{\"added\": {}}]',10,1),(15,'2022-11-09 15:09:57.867779','007','007 : Cherry (3R1) ',1,'[{\"added\": {}}]',10,1),(16,'2022-11-09 15:10:11.035777','008','008 : Lose (4N1) ',1,'[{\"added\": {}}]',10,1),(17,'2022-11-09 15:10:21.003887','009','009 : Anna (4N1) ',1,'[{\"added\": {}}]',10,1),(18,'2022-11-09 15:10:29.826005','010','010 : Tipphy (3R1) ',1,'[{\"added\": {}}]',10,1),(19,'2022-11-09 15:11:24.828702','32043-001j','32043-001j : DBMS (3 credit)',1,'[{\"added\": {}}]',9,1),(20,'2022-11-09 15:11:36.085990','32043-001','32043-001 : DBMS (3 credit)',2,'[{\"changed\": {\"fields\": [\"Subid\"]}}]',9,1),(21,'2022-11-09 15:11:46.595454','32-041-202','32-041-202 : Programming 1 (3 credit)',1,'[{\"added\": {}}]',9,1),(22,'2022-11-09 15:11:58.899148','30-042-101','30-042-101 : DBAP (3 credit)',1,'[{\"added\": {}}]',9,1),(23,'2022-11-09 15:12:08.477183','32043-001j','32043-001j : DBMS (3 credit)',3,'',9,1),(24,'2022-11-11 02:57:27.952224','1','1 : ให้ประกาศตัวแปร สำหรับ เก็บชื่อลูกค้า, รายได้ต่อเดือน, เพศ, และอาชีพ (2.0 score)',1,'[{\"added\": {}}]',7,1),(25,'2022-11-11 03:19:23.654135','2','[30-042-101] 1.1.2 : ให้กำหนดค่าให้กับตัวแปรเงินเดือน (salary) ตามที่ต้องการ\r\nให้คำนวณรายได้ทั้งปี (incomes) จากเงินเดือนทีกำหนดไว้\r\nให้คำนวณภาษี (tax) ในอัตราร้อยละ 3 ของรายได้ทั้งปี (2.0 score)',1,'[{\"added\": {}}]',7,1),(26,'2022-11-11 03:20:37.455985','3','[30-042-101] 1.1.3 : cusid = \"c00001\'\r\ncusname = \"Aricha\"\r\nsalary = 50000.00\r\nbonus = salary * 3\r\nให้สั่งแสดงค่าจากตัวแปรทั้ง 4 ตัว ทางหน้าจอภาพ (1.0 score)',1,'[{\"added\": {}}]',7,1),(27,'2022-11-11 03:53:54.693211','2','[30-042-101] 1.1.2 : ให้กำหนดค่าให้กับตัวแปรเงินเดือน (salary) ตามที่ต้องการ\r\nให้คำนวณรายได้ทั้งปี (incomes) จากเงินเดือนทีกำหนดไว้\r\nให้คำนวณภาษี (tax) ในอัตราร้อยละ 3 ของรายได้ทั้งปี (2.0 score)',2,'[]',7,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'evaluateapp','problem'),(11,'evaluateapp','score'),(8,'evaluateapp','section'),(10,'evaluateapp','student'),(9,'evaluateapp','subject'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-11-09 14:51:30.325311'),(2,'auth','0001_initial','2022-11-09 14:51:59.371154'),(3,'admin','0001_initial','2022-11-09 14:52:11.071320'),(4,'admin','0002_logentry_remove_auto_add','2022-11-09 14:52:11.196291'),(5,'admin','0003_logentry_add_action_flag_choices','2022-11-09 14:52:11.383746'),(6,'contenttypes','0002_remove_content_type_name','2022-11-09 14:52:14.648608'),(7,'auth','0002_alter_permission_name_max_length','2022-11-09 14:52:17.257372'),(8,'auth','0003_alter_user_email_max_length','2022-11-09 14:52:20.569145'),(9,'auth','0004_alter_user_username_opts','2022-11-09 14:52:20.772221'),(10,'auth','0005_alter_user_last_login_null','2022-11-09 14:52:24.178106'),(11,'auth','0006_require_contenttypes_0002','2022-11-09 14:52:24.474479'),(12,'auth','0007_alter_validators_add_error_messages','2022-11-09 14:52:24.662022'),(13,'auth','0008_alter_user_username_max_length','2022-11-09 14:52:29.128930'),(14,'auth','0009_alter_user_last_name_max_length','2022-11-09 14:52:34.924634'),(15,'auth','0010_alter_group_name_max_length','2022-11-09 14:52:37.908564'),(16,'auth','0011_update_proxy_permissions','2022-11-09 14:52:37.986231'),(17,'auth','0012_alter_user_first_name_max_length','2022-11-09 14:52:40.316208'),(18,'evaluateapp','0001_initial','2022-11-09 14:53:01.734533'),(19,'sessions','0001_initial','2022-11-09 14:53:03.389859'),(20,'evaluateapp','0002_problem_objdetail_problem_objid','2022-11-11 02:54:00.938902'),(21,'evaluateapp','0003_alter_problem_objid','2022-11-11 03:02:55.300475'),(22,'evaluateapp','0004_alter_problem_objid','2022-11-11 08:28:53.166062');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('fcms0hrco2wawsluut1pdj6oun194tdk','.eJxVT8tygzAM_BefY0YCR0COvfcbGNmWC3nYHQzNIZN_jyk5tDdpX7P7UAOvyzisWeZh8uqkUB3-YpbdReJG-DPHr1S5FJd5stUmqd5srj6Tl-vHW_svYOQ8FjcLUQttwN5y8ORDcHUH0pFI51qxRwoIVD4UY7zHmnvTUwOtOTqDLCU0r_YsbilhDWgwtUbYyuaCTSmqEx7UzyT3rUrRxDTf-Lrbfoc1tTZAGjrUzW7c4XJ978tJPV_dDlNn:1ouVI6:HgYs_8tBNVs6WhIZtUV2JXsPiUYWBeErS6plaUggPGM','2022-11-28 08:58:06.067634'),('lau8d608w13kdfkmz33i5bst8fw8tm8d','.eJxVT7sSwiAQ_Bdqk4GE8LC09xsyBxwmPsAJiRaO_y7EFNrt7e7t3r1ID8s89EvCqR8d2RNGdr-cAXvBUAR3hnCKtY1hnkZTF0u9qak-RofXw-b9CxggDXkbUAhJpWfagHfCeW8bRVEJRGUlmk54RkWeGHLuHGtAcy1aKnlnOQPMoY8Rn6Unp4U43eCaubSY9eq2qTgVFVWsaml5IX3pjO4r0uT9Ab3QSaY:1ouZ8h:4J82wLfKSsBwoJNJBNKt9XeC8e_gZFrgqJMXOQgAcYM','2022-11-28 13:04:39.922912');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluateapp_problem`
--

DROP TABLE IF EXISTS `evaluateapp_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluateapp_problem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` longtext NOT NULL,
  `fullscore` double NOT NULL,
  `subject_id` varchar(14) NOT NULL,
  `objdetail` varchar(255) NOT NULL,
  `objid` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluateapp_problem_subject_id_7d576668_fk_evaluatea` (`subject_id`),
  CONSTRAINT `evaluateapp_problem_subject_id_7d576668_fk_evaluatea` FOREIGN KEY (`subject_id`) REFERENCES `evaluateapp_subject` (`subid`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluateapp_problem`
--

LOCK TABLES `evaluateapp_problem` WRITE;
/*!40000 ALTER TABLE `evaluateapp_problem` DISABLE KEYS */;
INSERT INTO `evaluateapp_problem` VALUES (9,'1. ให้ทำการสร้างโปรเจ็คชื่อ digiTechSystem โดยกำหนด Virtual Environment ชื่อ myvenv ในตำแหน่ง',0.25,'32-406-081-301','สร้างโปรเจ็คไพทอน','2.1.1'),(10,'1. ให้ทำการสร้างไฟล์ pyTest1.py ในโปรเจ็ค digiTechSystem',0.25,'32-406-081-301','สร้างแฟ้มข้อมูลไพธอน','2.1.2'),(11,'1. ในไฟล์ pyTest.py ให้เขียนคำสั่งเพื่อแสดงดาว 50 ตัว (โดยใช้วิธีการ Repeating) ตามด้วยข้อความ Welcome to Digital Business Technology และตามด้วยดาวอีก 50 ดวง (โดยใช้วิธีการ Repeating) ดังตัวอย่าง \r\n\r\n****************************** Welcome to Digital Business Technology *******************************',0.5,'32-406-081-301','เขียนโปรแกรมแสดงผลข้อความ','2.1.4'),(12,'1. ประกาศตัวแปรข้อความสำหรับเก็บข้อมูลรหัสลูกค้า 1 ตัว โดยยังไม่กำหนดค่าเริ่มต้น\r\n2. ประกาศตัวแปรทศนิยมสำหรับเก็บข้อมูลเงินเดือน โดยให้ค่าเริ่มต้นเป็น 25000.50 บาท\r\n3 ประกาศตัวแปรตรรกศาสตร์สำหรับเก็บข้อมูลเพศ โดยให้ค่าเริ่มต้นเป็น True',0.5,'32-406-081-301','เขียนโปรแกรมเพื่อกำหนดค่าตัวแปร','2.2.3'),(13,'1. ประกาศตัวแปรค่าคงที่ทศนิยมสำหรับเก็บข้อมูลอัตราภาษีขาย โดยมีค่าเท่ากับ 0.10\r\n2. ระกาศตัวแปรค่าคงที่ข้อความเก็บสโลแกนบริษั โดยมีค่าเป็น “Happy and Success We can”',0.5,'32-406-081-301','เขียนโปรแกรมเพื่อกำหนดค่าตัวแปรค่าคงที่','2.2.5'),(14,'amountSale1 = 25000.00\r\namountSale2 = 30000.00\r\n1. กำหนดค่าให้กับตัวแปรผลรวม (total) เพื่อคำนวณยอดขายของทั้งสองคนรวมกัน\r\n2. คำนวณหาว่าพนักงานขายคนที่ 1 กับพนักงานขายคนที่ 2 มียอดขายแตกต่างกันเท่าใด\r\n3. คำนวณหากำไร (profit) โดยบริษัทคิดกำไรไว้ร้อยละ 15 ของราคาขายที่ตั้งไว้',1,'32-406-081-301','เขียนโปรแกรมประมวลผลทางคณิตศาสตร์','2.3.2'),(15,'1. กำหนดค่าให้กับตัวแปรปีปัจจุบัน (currentYear) มีค่าเท่ากับข้อความ “2565”\r\n2. เขียนคำสั่งในการรับค่าอายุทางแป้นพิมพ์ เพื่อเก็บในตัวแปรเลขจำนวนเต็ม (age)\r\n3. คำนวณค่าให้กับตัวแปร (birthYear) โดยนำปีปัจจุบันมาลบกับอายุ \r\nprint(“ปีปัจจุบัน: ”, currentYear, “, ปีเกิด: ”, birthYear, “, อายุ: ”, age',1,'32-406-081-301','เขียนโปรแกรมแปลงค่าตัวแปรต่างชนิด','2.3.3'),(16,'SOCIAL_RATE = 0.03\r\n1. กำหนดค่าทศนิยมให้กับตัวแปรเงินเดือน (salary) เป็น 35000.00 \r\n2. คำนวณหาเงินประกันสังคมที่จ่ายทั้งปี(socialMoney) โดยอาศัยค่าข้อมูลจากตัวแปรเงินเดือนและอัตราเงินประกันสังคม\r\n3. กำหนดค่าให้กับตัวแปรชื่อ result โดยให้เก็บข้อความ “ปีนี้ท่านจ่ายเงินประกันสังคม จำนวน xxxx.xx บาท” (โดยค่า xxxx.xx คือค่าที่ได้มาจากตัวแปร socialMoney) \r\n4. แสดงผลค่าจากตัวแปร result ออกทางจอภาพ',1,'32-406-081-301','เขียนโปรแกรมการแสดงผลลัพธ์ข้อมูล','2.3.4'),(17,'1. กำหนดค่าให้กับตัวแปรลิสต์ชื่อ lstSaleNames เพื่อเก็บรายชื่อของพนักงานจำนวน 7 คน (ให้นักศึกษาสมมติขึ้นเองทั้ง 7 คน)  \r\n2. แสดงรายชื่อพนักงานทั้ง 7 คน ในตัวแปร lstSaleNames ออกทางจอภาพ\r\n3. แสดงรายชื่อพนักงาน คนที่ 3-4 ในตัวแปร lstSaleNames ออกทางจอภาพ',1,'32-406-081-301','เขียนโปรแกรมที่มีการใช้ข้อมูลเชิงประกอบแบบ List','2.4.1'),(18,'1. กำหนดค่าให้กับตัวแปรทูเพิลชื่อ tpDownRate  เพื่อเก็บอัตราร้อยละเงินดาว์นสินค้าที่บริษัทกำหนดให้ลูกค้าเลือกได้ ประกอบด้วยค่า 10, 20, 25, 50, 60  \r\nprint(tpDownRate)\r\n2. กำหนดค่าตัวเลขทศนิยมให้กับตัวแปร price มีค่าเป็น 54200.00 \r\n3. คำนวณเงินดาว์น (downPayment) จากตัวแปร price กรณีที่ลูกค้าเลือกอัตราเงินดาว์นรายการที่ 3',1,'32-406-081-301','เขียนโปรแกรมที่มีการใช้ข้อมูลเชิงประกอบแบบ Tuple','2.4.2'),(19,'1. กำหนดค่าให้กับตัวแปรดิกชันนารี่ชื่อ dicSalary โดยมีตำแหน่งงานเป็นคีย์ เพื่อบอกอัตราเงินเดือนเริ่มต้น	   ของตำแหน่งนั้นๆ ให้นักศึกษาสมมติค่าข้อมูลตำแหน่งและเงินเดือน 5 ค่า \r\nprint(dicSalary) \r\n2.  เพิ่มตำแหน่งงาน “Business Analysis” อัตราเงินเดือนเริ่มต้นเท่ากับ 30000.00 บาท \r\n3. แสดงอัตราเงินเดือนเริ่มต้นของคนที่ทำงานในตำแหน่ง “Business Analysis”',1,'32-406-081-301','เขียนโปรแกรมที่มีการใช้ข้อมูลเชิงประกอบแบบ Dictionary','2.4.3'),(20,'1. กำหนดค่าให้กับตัวแปรเซตชื่อ setTeamA โดยเก็บข้อมูลรายชื่อนักกีฬา 5-7 คน\r\n2. กำหนดค่าให้กับตัวแปรเซตชื่อ setTeamB โดยเก็บข้อมูลรายชื่อนักกีฬา 5-7 คน\r\nprint(setTeamA)\r\nprint(setTeamB)\r\n3. กำหนดค่าให้กับตัวแปรเซตชื่อ setSporter โดยนำข้อมูลจาก setTeamA มีรวมกับข้อมูลใน setTeamB \r\nprint(setSporter)\r\n4. แสดงจำนวนนักกีฬารวมจากตัวปร setSporter ออกทางจอภาพ',1,'32-406-081-301','เขียนโปรแกรมที่มีการใช้ข้อมูลเชิงประกอบแบบ Set','2.4.4'),(21,'saleAmount = 5000.00\r\nmemberStatus = input(“ท่านเป็นสมาชิกของบริษัทหรือไม่? [Y/y]: ”)\r\n1. ตรวจสอบค่าจากตัวแปร memberStatus ว่ามีค่าเป็น “Y” หรือ “y” หรือไม่ \r\n	หากใช่ ให้ลดราคาจากตัวแปรจำนวนเงินที่ต้องชำระ saleAmount ลง 10 เปอร์เซ็นต์ \r\n2. แสดงจำนวนเงินที่ต้องชำระออกทางจอภาพ',0.5,'32-406-081-301','เขียนโปรแกรมที่มีการใช้คำสั่ง if','3.2.1'),(22,'temp = float(input(“โปรดระบุอุณหภูมิในร่างกายของท่าน: ”))\r\n1. ตรวจสอบค่าอุณหภูมิในร่างกายที่รับมา \r\n	หากค่าอุณหภูมิ ไม่ถึง 37 ให้กำหนดค่าให้ตัวแปรผลการตรวจ (result) มีค่าเป็น “ปกติ”   	\r\n	มิเช่นนั้นแล้ว ให้กำหนดค่าให้ตัวแปรผลการตรวจ (result) มีค่าเป็น “ท่านไม่สบาย โปรดพบแพทย์”   \r\n2. แสดงค่าอุณหภูมิและผลการตรวจออกทางจอภาพ',0.5,'32-406-081-301','เขียนโปรแกรมที่มีการใช้คำสั่ง if-else','3.2.2'),(23,'type = input(“โปรดระบุประเภทห้องพัก [Standard, Deluxe, Suite]: ”)\r\n1. ตรวจสอบว่าผู้ใช้ระบบได้ระบุห้องพักประเภทใด \r\n	หากระบุเป็น “Standard” ให้กำหนดอัตราค่าห้อง (price) เป็น 1500.00 บาท\r\n	หากระบุเป็น “Deluxe” 	ให้กำหนดอัตราค่าห้อง (price) เป็น 2500.00 บาท					\r\n        หากระบุเป็น “Suite” 	ให้กำหนดอัตราค่าห้อง (price) เป็น 4000.00 บาท\r\n	หากระบุเป็นค่าอื่น	ให้กำหนดอัตราค่าห้อง (price) เป็น “Error” \r\n2. แสดงอัตราค่าห้องออกทางจอภาพ',0.5,'32-406-081-301','เขียนโปรแกรมที่มีการใช้คำสั่ง if-elif-else','3.2.3'),(24,'credits = int(input(“โปรดระบุหน่วกิตสะสม: ”))\r\ngpa = float(input(“โปรดเกรดเฉลี่ยสะสม: ”))\r\n1. ตรวจสอบหน่วยกิตและเกรดเฉลี่ยสะสมของผู้เรียน เพื่อแสดงสถานะการเป็นนักศึกษา   \r\n	ถ้าหน่วยกิตไม่ถึง 30 หน่วยกิต \r\n		กำหนดค่าสถานะ (status) เป็น “ปกติ”\r\n	ถ้าหน่วยกิต 30 – 59 หน่วยกิต \r\n		ถ้าเกรดเฉลี่ยสะสม ต่ำกว่า 1.50	กำหนดค่าสถานะ (status) เป็น “ตกออก”\r\n		ถ้าเกรดเฉลี่ยสะสม 1.50 ขึ้นไป กำหนดค่าสถานะ (status) เป็น “ปกติ”\r\n 	ถ้าหน่วยกิต 60 – 126 หน่วยกิต \r\n		ถ้าเกรดเฉลี่ยสะสม ต่ำกว่า 1.75 	กำหนดค่าสถานะ (status) เป็น “ตกออก”\r\n		ถ้าเกรดเฉลี่ยสะสม 1.75 ขึ้นไป กำหนดค่าสถานะ (status) เป็น “ปกติ”\r\n	ถ้าหน่วยกิต 127 หน่วยกิต ขึ้นไป \r\n		ถ้าเกรดเฉลี่ยสะสม ต่ำกว่า 1.90 	กำหนดค่าสถานะ (status) เป็น “ตกออก”\r\n		ถ้าเกรดเฉลี่ยสะสม 1.90 - 2.00  	กำหนดค่าสถานะ (status) เป็น “รอพินิจ”\r\n		ถ้าเกรดเฉลี่ยสะสม 2.00 ขึ้นไป กำหนดค่าสถานะ (status) เป็น “สำเร็จการศึกษา”	\r\n2. แสดงหน่วกิต เกรดเฉลี่ยสะสม และสถานะการเป็นนักศึกษาออกทางจอภาพ',1,'32-406-081-301','เขียนโปรแกรมที่มีการใช้คำสั่งตรวจสอบเงื่อนไขเชิงซ้อน','3.2.4'),(25,'number = int(input(“โปรดระบุค่าตัวเลข: ”))\r\n1. กำหนดค่าตัวแปร i เท่ากับ 1\r\n2. เขียนคำสั่งวนซ้ำแบบ while เมื่อตัวแปร i มีค่าไม่เกินค่าตัวแปร number  \r\n3. ทุก ๆ รอบ ให้แสดงข้อความออกทางจอภาพ ด้วยคำว่า “Hello” และแสดงค่าจากตัวแปร i ในบรรทัดถัดไป \r\n4. เมื่อแสดงผลทางจอภาพแล้ว ให้เพิ่มค่า i ขึ้น 2 ค่า ทำไปเรื่อย ๆ จนกว่า i จะมากกว่าค่าตัวแปร number',1,'32-406-081-301','เขียนโปรแกรมที่มีการใช้คำสั่ง  while','3.3.2'),(26,'number = int(input(“โปรดระบุค่าตัวเลข: ”))\r\n1. กำหนดค่าเริ่มต้น total ให้มีค่าเริ่มต้น เท่ากับ 0, และตัวแปร average เท่ากับ 0.00\r\n2. เขียนคำสั่งวนซ้ำแบบ for ตั้งแต่ 1 ถึง number เพื่อหาค่าสะสมตัวตั้งแต่ 1 ถึง number เก็บไว้ที่ตัวแปร   total\r\n3. คำนวณค่าเฉลี่ยจากตัวแปร total และ number เก็บไว้ที่ตัวแปร average \r\n4. แสดงค่าสะสมจากตัวแปร total และค่าเฉลี่ยจากตัวแปร average',1,'32-406-081-301','เขียนโปรแกรมที่มีการใช้คำสั่ง for','3.3.3'),(27,'number = int(input(“โปรดระบุค่าตัวเลข: ”))\r\n1. เขียนคำสั่งวนซ้ำแบบ for ตั้งแต่ 1 ถึง 100 โดยใช้ตัวแปร i เป็นตัวแปรควบคุมรอบ \r\n2. ในลูปให้ทำการแสดงค่าตัวแปร i ออกทางจอภาพ \r\n3. จากนั้นให้ตรวจสอบว่าตัวแปร i มีค่าเท่ากับ number หรือไม่ หากใช่ ให้สั่ง break ออกจากลูป\r\n4. เมื่อออกจากลูปมาแล้ว ให้แสดงข้อความ “Good bye”',0.5,'32-406-081-301','เขียนโปรแกรมที่มีการใช้คำสั่ง break','3.3.4'),(28,'number = int(input(“โปรดระบุค่าตัวเลข: ”))\r\n1. เขียนคำสั่งวนซ้ำแบบ for ตั้งแต่ 1 ถึง 100 โดยใช้ตัวแปร i เป็นตัวแปรควบคุมรอบ \r\n2. ในลูปให้ตรวจสอบว่าตัวแปร i เท่ากับ 10 หรือ i เท่ากับ 20 หรือไม่ หากใช่ ให้สั่ง continue เพื่อไปรอบถัดไป\r\n3.  ในลูปให้ทำการแสดงค่าตัวแปร i ออกทางจอภาพ 	    \r\n4. เมื่อออกจากลูปมาแล้ว ให้แสดงข้อความ “Good bye”',0.25,'32-406-081-301','เขียนโปรแกรมที่มีการใช้คำสั่ง continue','3.3.5'),(29,'1. เขียนคำสั่งวนซ้ำแบบ for ตั้งแต่ 1 ถึง 100 โดยใช้ตัวแปร i เป็นตัวแปรควบคุมรอบ \r\n2. ในลูปยังไม่มีคำสั่งประมวงผลใด ๆ ให้ใส่คำสั่ง pass ไว้',0.25,'32-406-081-301','เขียนโปรแกรมที่มีการใช้คำสั่ง pass','3.3.6'),(30,'1. เขียนคำสั่งวนซ้ำแบบ for ตั้งแต่ 1 ถึง 12 โดยใช้ตัวแปร i เป็นตัวแปรควบคุมรอบ \r\n	2. ในลูป i ให้เขียนคำสั่งวนลูปย่อยภายใน โดยใช้ตัวแปร j เป็นตัวแปรควบคุมรอบ\r\n		3. ในแต่ละรอบย่อย ให้คำนวณหาผลคูณของ i กับ j เก็บไว้ที่ตัวแปร multiply\r\n		4. ในแต่ละรอบย่อย ให้แสดงค่าจากตัวแปร multiply',1,'32-406-081-301','เขียนโปรแกรมที่มีการวนซ้ำเชิงซ้อน','3.3.7'),(31,'strTest = “Digital Business Application Programming”   \r\nmoney = 15250.50	\r\n1. เรียกใช้ฟังก์ชันเพื่อนับจำนวนตัวอักษรในตัวแปร strTest พร้อมแสดงผลทางจอภาพ\r\n2. เรียกใช้ฟังก์ชันแสดงค่าจากตัวแปร strTest เฉพาะคำว่า Business   \r\n3. เรียกใช้ฟังก์ชันแสดงค่าในตัวแปร money โดยจัดรูปแบบ มีทศนิยม 2 ตำแหน่งคอมมาหลักพัน',0.5,'32-406-081-301','เขียนโปรแกรมที่มีการเรียกใช้ฟังก์ชันในระบบ','4.1.3'),(32,'1. ให้สร้างใช้ฟังก์ชันชื่อ calNewSalary โดยเป็นฟังก์ชันที่รับค่าอาร์กิวเมนท์ 2 ตัว คือ เงินเดือนเดิม (salary) และอัตราที่เพิ่ม (percent) โดยฟังก์ชันดังกล่าวจะส่งคืนค่า เงินเดือนใหม่ออกมา \r\n2. ในฟังก์ชันให้คำนวณเพื่อหาค่าเงินเดือนใหม่ (newSalary) จากเงินเดือนที่รับมาและอัตราที่เพิ่ม \r\n3. ส่งคืนค่าจากตัวแปรเงินเดือนใหม่  \r\n\r\nmySalary = calNewSalary(35000.00, 3)\r\nprint(“New Salary: ”, mySalary)',1,'32-406-081-301','เขียนโปรแกรมที่มีการสร้างฟังก์ชัน','4.1.4'),(33,'number = input(“โปรดป้อนเงินเดือน: ”) \r\n1. ให้ตรวจสอบว่าค่าตัวแปร number ที่ผู้ใช้ระบบป้อนมานั้น เป็นตัวเลขหรือไม่ \r\n	หากใช่ ให้แสดงเงินเดือนออกทางจอภาพ \r\n	หากไม่ใช่ ให้แสดงข้อความ “ท่านป้อนเงินเดือนไม่ถูกต้อง” ออกทางจอภาพ \r\nstrFruits = “Apple Mango Peach Papaya Grep Banana Orange Watermelon Cherry”\r\n2. กำหนดค่าให้กับตัวแปรเชิงประกอบแบบลิสต์ชื่อ lstFruits โดยการหั่นข้อความมาจากตัวแปร strFruits\r\n3. สั่งแสดงข้อมูลจากตัวแปร lstFruits ออกทางจอภาพ',0.5,'32-406-081-301','เขียนโปรแกรมที่มีการเรียกใช้เมธอดในระบบ','4.2.3'),(34,'สร้างไฟล์คลาส ชื่อ Building.py และประกาศคลาสชื่อ Building  เพื่อรอการพัฒนาในภายหลัง (ห้ามไม่ให้มีการแจ้ง Error ในไฟล์นี้)',0.5,'32-406-081-301','เขียนโปรแกรมที่มีการสร้างคลาส','4.3.2'),(35,'1. เปิดไฟล์คลาส ชื่อ Building.py ที่ได้สร้างไว้ก่อนหน้านี้ \r\n\r\nclass Building:\r\n         2. สร้างเมธอท __init__ โดยมีการรับตัวแปร 7 ตัว ประกอบด้วย ชื่อเจ้าของ ความกว้าง ความลึก จำนวนชั้น มูลค่าของอาคาร ละติจูด ลองติจูด (owner, width, deep, floors, value, latitude, longitude)',1,'32-406-081-301','เขียนโปรแกรมที่มีการประกาศแอททริบิวท์','4.3.3'),(36,'1. เปิดไฟล์  Building.py เพื่อเขียนโปรแกรมภายใต้คลาส Building \r\n\r\nclass Building:\r\n	2. สร้างเมธอท __str__ เพื่อคืนค่าข้อความโดยนำค่าจากแอตทริบิวส์ทุกตัวมาต่อกัน พร้อมคำอธิบาย \r\n	3. สร้างเมธอท setCost เพื่อคำนวณค่าให้กับแอตทริบิวส์ค่าก่อสร้าง (cost) เป็นเมธอทที่ไม่รับค่าจากภายนอก แต่คำนวณจาก 30 เปอร์เซ็นต์ของมูลค่าของอาคาร (value) \r\n	4. แก้ไขเมธอท __init__ โดยหลังจากที่ให้ค่าแอตทริบิวส์แล้ว ให้เรียกใช้เมธอท setCost',1,'32-406-081-301','เขียนโปรแกรมที่มีการสร้างเมธอด','4.3.4'),(37,'1. สร้างไฟล์ไพทอน ชื่อ TestPractice.py \r\n2. นำเข้าคลาส Building เพื่อนำมาใช้ในโปรแกรมที่กำลังเขียน \r\n3. สร้างอ๊อบเจ็กต์ชื่อ hotel1 จากคลาส Building โดยสมมติค่าให้เหมาะสมตามความต้องการ\r\n4. สร้างอ๊อบเจ็กต์ชื่อ hotel2 จากคลาส Building โดยสมมติค่าให้เหมาะสมตามความต้องการ\r\n \r\nprint(hotel1)\r\nprint(hotel2)',1,'32-406-081-301','เขียนโปรแกรมที่มีการสร้างออบเจ็กต์','4.4.2'),(38,'1. ดาว์นโหลดไฟล์ sakiladb.sql ตามที่ผู้สอนกำหนด แล้วนำเข้า (import) เข้าสู่ระบบฐานข้อมูล MySql 	เพื่อให้ได้ฐานข้อมูล sakila	\r\n2. สร้าง user ชื่อ devman รหัสผ่าน 1234 พร้อมกำหนดสิทธิ์ให้กับ user ดังกล่าวให้สามารถใช้ฐานข้อมูล sakila ได้ทุกสิทธิ์ \r\n3. สร้างไฟล์ dbsetting.py เพื่อกำหนดตัวแปรที่จำเป็นต้องใช้ในการติดต่อฐานข้อมูล sakila\r\n4. สร้างไฟล์ connectdb.py โดยนำไฟล์ข้อที่ 3 ไปใช้ และทำการเปิดการเชื่อมต่อฐานข้อมูลที่เตรียมไว้ \r\n\r\nprint(“เชื่อมต่อระบบฐานข้อมูลสำเร็จ”)',1,'32-406-081-301','เขียนโปรแกรมที่มีการเปิดการเชื่อมต่อฐานข้อมูล','5.1.5'),(39,'1. เปิดไฟล์ TestPractice.py ที่เขียนไว้แล้ว เพื่อเขียนโปรแกรมต่อจากเดิม (โดยไม่ลบหรือแก้ไขของเดิม) \r\n2. เปลี่ยนชื่อเจ้าของโรงแรมในอ๊อบเจ็กต์ hotel1 เป็น “แจ็ค หม่า”\r\n3. เปลี่ยนชื่อเจ้าของโรงแรมในอ๊อบเจ็กต์ hotel2 เป็นชื่อตามที่นักศึกษากำหนด \r\n4. แก้ไขมูลค่าของอาคารในอ๊อบเจ็กต์ hotel1 เป็น 100000000.00 บาท\r\n5. แก้ไขมูลค่าของอาคารในอ๊อบเจ็กต์ hotel2 เป็นค่าตามที่นักศึกษากำหนด\r\n\r\nprint(hotel1) \r\nprint(hotel2)',1,'32-406-081-301','เขียนโปรแกรมที่มีการเข้าถึงแอททริบิวท์ของออบเจ็กต์','4.4.3'),(40,'1. เปิดไฟล์ connectdb.py ที่ได้สร้างไว เพื่อเขียนโปรแกรมต่อ (โดยไม่แก้ไขหรือลบคำสั่งเดิม) \r\n2. ทำการสั่งปิดการเชื่อมต่อฐานข้อมูลที่ได้เชื่อมต่อไว้ตามจุดประสงค์ที่ 5.1.5  \r\n\r\nprint(“ปิดการเชื่อมต่อระบบฐานข้อมูลแล้ว”)',1,'32-406-081-301','เขียนโปรแกรมที่มีการการปิดการเชื่อมต่อฐานข้อมูล','5.1.6'),(41,'1. สร้างฟังก์ชันชื่อ showPG  ทำการค้นคืนข้อมูลภาพยนตร์ (film) โดยแสดงเฉพาะภาพยนตร์ที่มีเรตติ้ง (rating) เป็น “PG” เท่านั้น โดยให้แสดงเฉพาะ รหัสภาพยนตร์ (film_id) ชื่อเรื่อง (title) ปีที่ฉาย (release_year) จำนวนวันที่ให้เช่า (rental_duration) อัตราค่าเช่า (rental_rate) ความยาว (length) ดังตัวอย่าง \r\n\r\n film_id   title  	    release_year      rental_duration    rental_rate	       length	\r\n***************************************************************************************\r\nxx	xxxxxxxxxx		xxxx		  xx.xx			xxx		xxx\r\nxx	xxxxxxxxxx		xxxx		  xx.xx			xxx		xxx\r\nxx	xxxxxxxxxx		xxxx		  xx.xx			xxx		xxx	\r\n***************************************************************************************\r\n	\r\nshowPG()',1,'32-406-081-301','เขียนโปรแกรมที่มีการเพิ่มข้อมูล','5.2.1'),(42,'1.  สร้างฟังก์ชันชื่อ addNewActor สำหรับเพิ่มข้อมูลนักแสดง (actor) โดยฟังก์ชันจะรับอาร์กิวเม้นท์ 2 ตัว ได้แก่ ชื่อ และนามสกุล เพื่อนำไปบันทึกลงในตารางข้อมูลนักแสดง (actor) โดยรหัสนักแสดงไม่ต้องให้ค่าเนื่องจากเป็นฟิลด์ที่ระบบสร้างให้อัตโนมัติ (Auto increment) \r\n\r\nname = input(“ชื่อนักแสดงใหม่: ”) \r\nsurname = input(“นามสกุลนักแสดงใหม่: ”)\r\naddNewActor(name, surname) \r\nprint(“เพิ่มนักแสดงใหม่เรียบร้อย”)',1,'32-406-081-301','เขียนโปรแกรมที่มีการแก้ไขข้อมูล','5.2.2'),(43,'1.  สร้างฟังก์ชันชื่อ updateActor สำหรับแก้ไขข้อมูลนักแสดง (actor) โดยฟังก์ชันจะรับอาร์กิวเม้นท์ 3 ตัว ได้แก่ รหัสนักแสดง ชื่อ และนามสกุล  เพื่อนำไปแก้ไขข้อมูลเฉพาะชื่อและนามสกุลในตารางข้อมูลนักแสดง (actor) ตามรหัสนักแสดงที่ระบุ   \r\n\r\nid = input(“รหัสนักแสดงที่ต้องการแก้ไข: ”) \r\nname = input(“ชื่อนักแสดงที่แก้ไขใหม่: ”) \r\nsurname = = input(“นามสกุลนักแสดงที่แก้ไขใหม่: ”)\r\nupdateActor(id, name, surname)\r\nprint(“แก้ไขข้อมูลนักแสดงเรียบร้อย”)',1,'32-406-081-301','เขียนโปรแกรมที่มีการลบข้อมูล','5.2.3'),(44,'1.  สร้างฟังก์ชันชื่อ deleteActor สำหรับลบข้อมูลนักแสดง (actor) โดยฟังก์ชันจะรับอาร์กิวเม้นท์ 1 ตัว ได้แก่ รหัสนักแสดง เพื่อนำไปเป็นเงื่อนไขในการลบในตารางข้อมูลนักแสดง (actor) ตามรหัสนักแสดงที่ส่งมา  \r\n\r\nid = input(“รหัสนักแสดงที่ต้องการลบ: ”) \r\ndeleteActor(id) \r\nprint(“ลบข้อมูลนักแสดงเรียบร้อย”)',1,'32-406-081-301','เขียนโปรแกรมที่มีการค้นคืนข้อมูล','5.2.4'),(45,'1.   สร้างฟังก์ชันชื่อ rejectCustomer สำหรับลบข้อมูลลูกค้า (customer) ออกจากระบบ โดยฟังก์ชันจะรับอาร์กิวเม้นท์ 1 ตัว ได้แก่ รหัสลูกค้า เพื่อนำไปเป็นเงื่อนไขในการลบข้อมูล โดยโปรแกรมจะต้องทำการใช้คำสั่งในการลบข้อมูลการเช่า (rental) ทั้งหมดที่ถูกเช่าโดยลูกค้าคนดังกล่าวออกก่อน แล้วจึงค่อยสั่งลบข้อมูลลูกค้าในตารางข้อมูล (customer) อีกทำหนึ่ง ในการลบทั้ง 2 ตารางนี้ จะต้องใช้คำสั่งควบคุมทรานแซคชันเพื่อให้มั่นใจว่าจะไม่เกิดความผิดพลาดที่อาจเกิดขึ้นกลางคันได้ หากดำเนินการสำเร็จให้แจ้ง “ลบข้อมูลลูกค้าเรียบร้อย” แต่หากเกิดความผิดพลาด ให้แสดงข้อความ “เกิดความผิดพลาด ไม่สามารถลบข้อมูลลูกค้าได้” \r\n\r\nid = input(“รหัสลูกค้าที่ต้องการลบ: ”) \r\nrejectCustomer(id)',1,'32-406-081-301','เขียนโปรแกรมที่มีการควบคุมการประมวลผลรายการ','5.2.5'),(46,'1.  สร้างโปรเจ็ค Django ชื่อว่า djangPractice ในโปรเจ็คให้มี Application 2 Application คือ ProductApp และ OrderApp \r\n2. ติดตั้ง bootstrap5, fontawesome5 \r\n3. สร้างไฟล์ base.html เพื่ออกแบบเลเอาต์ ที่มี 2 แถว แถวแรกใช้พื้นที่เต็ม 12 ส่วนพื้นสีน้ำเงินตัวหนังสือสีขาว เพื่อแสดงชื่อบริษัท “Boeing Jet Rental System” แถวที่สองแบ่งเป็น 2 คอลัมน์ ด้านซ้าย 3 ส่วนพื้นสีฟ้าตัวหนังสือ สีแดง ด้านขวา 9 ส่วน  พื้นสีขาวตัวหนังสือสีน้ำเงิน และสร้างพื้นที่ block ด้านขวาโดยตั้งชื่อว่า dataBlock  ส่วนด้านซ้ายแสดงเมนู (ลิงก์) 2 รายการ ได้แก่ เมนู Home เพื่อเรียกเราท์เตอร์ “/” ,  เมนู History เพื่อเรียกเราท์เตอร์ “history” \r\n4. สร้างไฟล์ home.html ที่มีการนำไฟล์ base.py มาต่อขยาย โดยกำหนดค่าใน dataBlock ภายในมีข้อความ 3 บรรทัด คือ “Welcome to Digitech Service Co., Ltd.”  “Boeing Jet Rental System” และ “Our Product is the Best Service of the World” \r\n5. สร้างไฟล์ history.html ที่มีการนำไฟล์ base.py มาต่อขยาย โดยกำหนดค่าใน dataBlock ภายในมีข้อความ “Digitech Service Co., Ltd. ก่อตั้งในปี 1990 เพื่อให้บริการเช่าเครื่องบิน Boeing Jet แก่สาธารณะชนทั่วไป สำหรับการนำไปใช้ในการเดินทางไปท่องเที่ยวส่วนตัว ไปไร่ไปนาไปสวน ............................ (ต่อเอง) .............................” \r\n6. สร้างฟังก์ชันในไฟล์ views.py จำนวน 2 ฟังก์ชัน ชื่อฟังก์ชัน home เพื่อทำหน้าที่ในการแสดงหน้าหลัก (home.html) และฟังก์ชัน history เพื่อทำหน้าที่ในการแสดงหน้าประวัติ (history.html) \r\n7. สร้างเราท์เตอร์ 2 เราท์เตอร์ ชื่อ ‘home’ และ ‘history’ ในไฟล์ urls.py สำหรับเรียกใช้ฟังก์ชันใน view.py',1,'32-406-081-301','เขียนโปรแกรมเว็บแอพพลิเคชันแบบ MVT','6.1.5'),(47,'1. สร้างฐานข้อมูลว่างชื่อ dbPractices\r\n2. ให้สิทธิ์ User ที่ชื่อ devman ให้สามารถเข้าใช้ได้ในระดับ owner\r\n3. กำหนดค่าการเชื่อมต่อฐานข้อมูลในไฟล์ setting.py ให้ถูกต้อง \r\n4. สร้างคลาสชื่อ Scores ที่สืบทอดคุณสมบัติมาจาก models.Model เพื่อเก็บคะแนนสอบ ที่ประกอบด้วย รหัสนักศึกษา ชื่อนักศึกษา รหัสวิชา ชื่อวิชา คะแนนสอบ โดยกำหนดชนิดของฟิลด์ข้อมูลตามความเหมาะสม\r\n5. ใข้คำสั่ง pip ทำการเตรียมและโอนย้ายโครงสร้างข้อมูลจาก Model ไปยังฐานข้อมูล \r\n6. ใช้คำสั่ง pip เพื่อสร้าง superuser ของระบบ 1 คน \r\n7. register Model Score l ให้กับแอพพลิเคชัน admin\r\n8. เข้าใช้แอพพลิเคชัน admin',1,'32-406-081-301','สร้างโมเดลเชื่อมต่อฐานข้อมูล','6.2.2'),(48,'1. สร้างฟอร์มแม่แบบในการรับข้อมูลสำหรับโมเดล Score ให้เหมะสม',1,'32-406-081-301','สร้างฟอร์มแม่แบบสำหรับรับข้อมูล','6.2.4'),(49,'1. สร้างไฟล์ HTML ว่างขึ้นมา 1 ไฟล์ ชื่อ studentScores.html \r\n1. สร้างฟังก์ชันใน views.py ชื่อ studentScores เพื่ออ่านข้อมูลคะแนนสอบทุกคน จากฐานข้อมูลแล้วแนบไปแสดงในไฟล์ studentScores.html \r\n2. ในไฟล์ studentScores.html ให้เขียนคำสั่งเพื่อแสดงตารางข้อมูล รหัสนักศึกษา ชื่อนักศึกษา รหัสวิชา ชื่อวิชา คะแนนสอบ ของทุกคน ที่ได้รับมาจาก veiws\r\n3. สร้างเราท์เตอร์ชื่อ studentScores เพื่อเรียกใช้ฟังก์ชัน studentScore ที่อยู่ในไฟล์ views.py\r\n4. แก้ไขไฟล์ base.html โดยให้เพิ่มเมนู show Scores เพื่อเรียกเราท์เตอร์ “studentScores”',1,'32-406-081-301','เขียนโปรแกรมเว็บเพื่อแสดงข้อมูลจากฐานข้อมูล','6.3.1'),(50,'1. สร้างไฟล์ HTML ว่างขึ้นมา 1 ไฟล์ ชื่อ inputScore.html\r\n2. สร้างฟังก์ชันชื่อ inputScore ใน views.py โดยในฟังก์ชันให้ตรวจสอบสถานะเมธอด \r\n         ถ้าเมธอทเป็น POST  \r\n               หากค่าในฟอร์มที่แนบมาถูกต้อง ให้ทำการบันทึกข้อมูลลงฐานข้อมูล \r\n               หากค่าในฟอร์มไม่ถูกต้องให้แสดงฟอร์ม inputScore.html เพื่อรับข้อมูลอีกครั้ง\r\n        หากเมธอทไม่ใช่ POST ให้สร้างฟอร์มจากฟอร์มแม่แบบที่ใช้รับค่าให้กับโมเดล Score แล้วแนบไปแสดงไฟล์ inputScore.html เพื่อรับค่า  \r\n3. ออกแบบไฟล์ inputScore.html เพื่อรับข้อมูลจากผู้ใช้จากฟอร์มแม่แบบของโมเดล Score \r\n4. เพิ่ม 1 เราท์เตอร์ ในไฟล์ urls.py สำหรับเรียกใช้ฟังก์ชัน inputScore ในไฟล์ view.py ที่สร้างขึ้นในข้อที่ 2 \r\n5. แก้ไขไฟล์ base.html โดยให้เพิ่มเมนู Input Product เพื่อเรียกเราท์เตอร์ “inputScore”',1,'32-406-081-301','เขียนโปรแกรมเว็บเพื่อเพิ่มข้อมูลในฐานข้อมูล','6.3.2'),(51,'....................',1,'32-406-081-301','เขียนโปรแกรมเว็บเพื่อแก้ไขข้อมูลในฐานข้อมูล','6.3.3'),(52,'..............................',1,'32-406-081-301','เขียนโปรแกรมเว็บเพื่อลบข้อมูลในฐานข้อมูล','6.3.4'),(53,'....................................',1,'32-406-081-301','เขียนโปรแกรมเว็บจัดการตัวแปรระบบกับฐานข้อมูล','6.3.5');
/*!40000 ALTER TABLE `evaluateapp_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluateapp_score`
--

DROP TABLE IF EXISTS `evaluateapp_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluateapp_score` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `result` int NOT NULL,
  `score` double NOT NULL,
  `problem_id` bigint NOT NULL,
  `student_id` varchar(14) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluateapp_score_problem_id_bd8d8dcb_fk_evaluateapp_problem_id` (`problem_id`),
  KEY `evaluateapp_score_student_id_56a6ebad_fk_evaluatea` (`student_id`),
  CONSTRAINT `evaluateapp_score_problem_id_bd8d8dcb_fk_evaluateapp_problem_id` FOREIGN KEY (`problem_id`) REFERENCES `evaluateapp_problem` (`id`),
  CONSTRAINT `evaluateapp_score_student_id_56a6ebad_fk_evaluatea` FOREIGN KEY (`student_id`) REFERENCES `evaluateapp_student` (`stdid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluateapp_score`
--

LOCK TABLES `evaluateapp_score` WRITE;
/*!40000 ALTER TABLE `evaluateapp_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluateapp_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluateapp_section`
--

DROP TABLE IF EXISTS `evaluateapp_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluateapp_section` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `level` varchar(15) NOT NULL,
  `group` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluateapp_section`
--

LOCK TABLES `evaluateapp_section` WRITE;
/*!40000 ALTER TABLE `evaluateapp_section` DISABLE KEYS */;
INSERT INTO `evaluateapp_section` VALUES (1,'3','N1'),(2,'3','N2'),(3,'3','R1'),(4,'3','R2'),(5,'4','N1'),(6,'4','N2'),(7,'4','R1'),(8,'4','R2');
/*!40000 ALTER TABLE `evaluateapp_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluateapp_student`
--

DROP TABLE IF EXISTS `evaluateapp_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluateapp_student` (
  `stdid` varchar(14) NOT NULL,
  `name` varchar(50) NOT NULL,
  `section_id` bigint NOT NULL,
  PRIMARY KEY (`stdid`),
  KEY `evaluateapp_student_section_id_fa44538b_fk_evaluatea` (`section_id`),
  CONSTRAINT `evaluateapp_student_section_id_fa44538b_fk_evaluatea` FOREIGN KEY (`section_id`) REFERENCES `evaluateapp_section` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluateapp_student`
--

LOCK TABLES `evaluateapp_student` WRITE;
/*!40000 ALTER TABLE `evaluateapp_student` DISABLE KEYS */;
INSERT INTO `evaluateapp_student` VALUES ('64342310122-1','นางสาววิริยา  หล่อยดา',4),('65342310004-3','นายกิตติพงษ์  พาบุดดา',3),('65342310015-1','นางสาวพัชราพร  ดวงจิตร',3),('65342310016-1','นายวชิระ  บุญปก',3),('65342310017-1','นางสาวณัฐพร  บุญมาหล้า',3),('65342310042-5','นางสาวจุฑารัตน์  วงค์ละคร',3),('65342310044-5','นางสาวจุฑารัตน์  ประจันตะเสน',3),('65342310050-2','นางสาวกัณฑิมา  ยุชิ',3),('65342310058-2','นายบุญญฤทธิ์  สิงห์คราน',3),('65342310061-0','นายชัยธนา  หะพินรัมย์',3),('65342310063-0','นายธนพนธ์  วีระนาวิน',3),('65342310065-0','นางสาวธัญญารัตน์  ศรีโยวงศ์',3),('65342310066-0','นางสาวสุภาวดี  อรุณโณ',3),('65342310070-8','นางสาวปิยวรรณ  ใจทน',3),('65342310073-8','นางสาวสุภัสสร  มูลเอก',3),('65342310087-6','นางสาวสุกัญญา  ชินคำ',3),('65342310110-0','นายอภิวัฒน์  มะลิวงศ์',3),('65342310111-0','นางสาวกัลยรัตน์  ไตรลิน',3),('65342310114-0','นางสาวศิริวรรณ  แสงอุ่นอุรัย',3),('65342310130-6','นายภาสกร  โมรา',3),('65342310132-6','นางสาวนวญลหง  เชื้อสาวะถี',3),('65342310138-6','นายสุกัลย์  ขุริดี',3),('65342310139-6','นายเกียรติยศ  เกรียงไกรวรรณ',3),('65342310140-4','นายณัฐวัฒน์  ทองคำเหลา',3),('65342310144-4','นางสาวนวรัตน์  พิบูลย์',3),('65342310147-4','นายพิชิตชัย  ธรรมชัย',3),('65342310148-4','นางสาวเปรมวดี  สุทธิบาก',3),('65342310149-4','นายนิติภูมิ  มหาหงษ์',3),('65342310150-1','นายชนาธิป  เกตโล',3),('65342310151-1','นายศุภรักษ์  สะเดา',3),('65342310153-1','นางสาวสิริยากร  วรสุทธิ์',4),('65342310159-1','นางสาวณิชาภัทร  ไชยธงรัตน์',4),('65342310161-9','นางสาวจิระพร  ชำกุล',4),('65342310169-9','นางสาวธัญญลักษณ์  กลอยกระโทก',4),('65342310180-5','นางสาวฉัตรวิมล  หวังสบาย',4),('65342310182-5','นางสาวอาริชา  ชามนตรี',4),('65342310191-3','นายอันดา  แก้วภู',4),('65342310197-3','นางสาววรรณดา  เมฆจินดา',4),('65342310201-1','นางสาวธนิดาพร  ไชยสมเดช',4),('65342310202-1','นางสาวกรรณิกา  ศรีบุรินทร์',4),('65342310208-1','นายธีรวัชร  อาจองค์',4),('65342310209-1','นางสาวธีระรินทร์  แสงทองฟ้า',4),('65342310214-9','นายฤกษ์สฤษฏ์  พิศาลสาสน์',4),('65342310215-9','นายปกรณ์  ทองโพธิ์แก้ว',4),('65342310217-9','นายภาณุพงศ์  นามโยธี',4),('65342310222-7','นายณัฐวัฒน์  มาตรา',4),('65342310224-7','นายชัยอนันต์  สิมาชัย',4),('65342310228-7','นางสาวกุลปริยา  ปะโพทานัง',4),('65342310263-8','นางสาวจินตนา  รัตนะวัน',4),('65342310264-8','นายบัณทัต  อุประ',4),('65342310265-8','นายอรรถพร  ดอนเกิด',4),('65342310266-8','นายคชาพล  พูนผล',4),('65342310270-6','นายสพลดนัย  เจาะจง',4),('65342310273-6','นายธีระพงษ์  ภูทอง',4),('65342310276-6','นายศุภชัย  สีทองแดง',4);
/*!40000 ALTER TABLE `evaluateapp_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluateapp_subject`
--

DROP TABLE IF EXISTS `evaluateapp_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluateapp_subject` (
  `subid` varchar(14) NOT NULL,
  `name` varchar(125) NOT NULL,
  `credit` int NOT NULL,
  PRIMARY KEY (`subid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluateapp_subject`
--

LOCK TABLES `evaluateapp_subject` WRITE;
/*!40000 ALTER TABLE `evaluateapp_subject` DISABLE KEYS */;
INSERT INTO `evaluateapp_subject` VALUES ('32-406-081-301','Digital Business Application Programming',3),('32-406-083-101','Computer Programming 1',3),('32-406-085-203','Business Intelligence',3);
/*!40000 ALTER TABLE `evaluateapp_subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-14 22:26:11
