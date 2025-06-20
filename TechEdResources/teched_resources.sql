CREATE DATABASE  IF NOT EXISTS `teched_resources` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `teched_resources`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: teched_resources
-- ------------------------------------------------------
-- Server version	8.0.42

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
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_customuser'),(22,'Can change user',6,'change_customuser'),(23,'Can delete user',6,'delete_customuser'),(24,'Can view user',6,'view_customuser'),(25,'Can add keyword',7,'add_keyword'),(26,'Can change keyword',7,'change_keyword'),(27,'Can delete keyword',7,'delete_keyword'),(28,'Can view keyword',7,'view_keyword'),(29,'Can add subject',8,'add_subject'),(30,'Can change subject',8,'change_subject'),(31,'Can delete subject',8,'delete_subject'),(32,'Can view subject',8,'view_subject'),(33,'Can add article',9,'add_article'),(34,'Can change article',9,'change_article'),(35,'Can delete article',9,'delete_article'),(36,'Can view article',9,'view_article'),(37,'Can add article keyword',10,'add_articlekeyword'),(38,'Can change article keyword',10,'change_articlekeyword'),(39,'Can delete article keyword',10,'delete_articlekeyword'),(40,'Can view article keyword',10,'view_articlekeyword');
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
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_resources_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_resources_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `resources_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

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
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(9,'resources','article'),(10,'resources','articlekeyword'),(6,'resources','customuser'),(7,'resources','keyword'),(8,'resources','subject'),(5,'sessions','session');
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
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-06-19 10:52:36.112757'),(2,'contenttypes','0002_remove_content_type_name','2025-06-19 10:52:36.328194'),(3,'auth','0001_initial','2025-06-19 10:52:37.017010'),(4,'auth','0002_alter_permission_name_max_length','2025-06-19 10:52:37.215703'),(5,'auth','0003_alter_user_email_max_length','2025-06-19 10:52:37.248973'),(6,'auth','0004_alter_user_username_opts','2025-06-19 10:52:37.280714'),(7,'auth','0005_alter_user_last_login_null','2025-06-19 10:52:37.297184'),(8,'auth','0006_require_contenttypes_0002','2025-06-19 10:52:37.317730'),(9,'auth','0007_alter_validators_add_error_messages','2025-06-19 10:52:37.347152'),(10,'auth','0008_alter_user_username_max_length','2025-06-19 10:52:37.381460'),(11,'auth','0009_alter_user_last_name_max_length','2025-06-19 10:52:37.411523'),(12,'auth','0010_alter_group_name_max_length','2025-06-19 10:52:37.490030'),(13,'auth','0011_update_proxy_permissions','2025-06-19 10:52:37.518534'),(14,'auth','0012_alter_user_first_name_max_length','2025-06-19 10:52:37.544119'),(15,'resources','0001_initial','2025-06-19 10:52:42.015301'),(16,'admin','0001_initial','2025-06-19 10:52:43.207962'),(17,'admin','0002_logentry_remove_auto_add','2025-06-19 10:52:43.295334'),(18,'admin','0003_logentry_add_action_flag_choices','2025-06-19 10:52:43.341118'),(19,'sessions','0001_initial','2025-06-19 10:52:43.663827');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('azvemiy460ddpqw7xkm2mjspfz2y80qk','.eJxVjEEOwiAQRe_C2hAYywAu3fcMZIahUjVtUtqV8e7apAvd_vfef6lE21rT1sqSRlEX1anT78aUH2Xagdxpus06z9O6jKx3RR-06X6W8rwe7t9BpVa_tQVENwSDTvAcMsWIbBiK65C6SCLsg7dcIgzE5K14zmgxA4AFh0a9P9PWN3A:1uSWzm:CTfSLP9WEyeSYHXRXbBYnPBaWnhtnwZJFCBYfgiS6lU','2025-07-04 08:21:10.950385'),('ir5g6pkgzqdch3ze985vx7i4mzid7vi3','.eJxVjMEOwiAQRP-FsyGLwlI8eu83kIUFqRpISnsy_rtt0oNe5jDvzbyFp3Upfu1p9hOLqziL028XKD5T3QE_qN6bjK0u8xTkrsiDdjk2Tq_b4f4dFOplW2eLzDFHUhpCHiIZGLS6GNSsnIMUGLQ2ji27BGZLi4jGWoxgcgISny_wEje3:1uSXSj:TysC7X0n0ORGPSVFqnJxm558GAhcS-fYr20KCus1Lgg','2025-07-04 08:51:05.084650'),('l7gi4d7yysnfmt16l7wyfieoq26ezto4','.eJxVjDsOwyAQRO9CHSE-gsUp0-cMCHYhOIlAMnZl5e7BkotE0817MzvzYVuL33pa_EzsyjS7_HYx4CvVA9Az1Efj2Oq6zJEfCj9p5_dG6X073b-DEnoZa9RySgJ1NopAQoRoLCRQNpN1ykjjYnbKSRpBGiIIKVQ2pGHSSMg-X9IuN3M:1uSXVN:ejAHCd-BkhlfF8QKGYKa-EymLOi_SMVToCte9hJi6kI','2025-07-04 08:53:49.846079'),('piis6kxmpcfst9e0w0qeyb8tjvi5urvk','.eJxVjEEOwiAQRe_C2hAYywAu3fcMZIahUjVtUtqV8e7apAvd_vfef6lE21rT1sqSRlEX1anT78aUH2Xagdxpus06z9O6jKx3RR-06X6W8rwe7t9BpVa_tQVENwSDTvAcMsWIbBiK65C6SCLsg7dcIgzE5K14zmgxA4AFh0a9P9PWN3A:1uSWrc:XciwUEOve-W40JnmK3WlYAoUUmW-59VhgBOLhWkAsIY','2025-07-04 08:12:44.531227'),('r2mmb0qyzs6lpugx73fdg8bytzqkli5e','.eJxVjEEOwiAQRe_C2hAYywAu3fcMZIahUjVtUtqV8e7apAvd_vfef6lE21rT1sqSRlEX1anT78aUH2Xagdxpus06z9O6jKx3RR-06X6W8rwe7t9BpVa_tQVENwSDTvAcMsWIbBiK65C6SCLsg7dcIgzE5K14zmgxA4AFh0a9P9PWN3A:1uSWMe:yRxVKCBuZHJwoIzuDXN6vITpbOoRIM46tsFltRgBwlE','2025-07-04 07:40:44.818844'),('z5tm3qrnmxjskjdu8iisr5s030zb5ner','e30:1uSXPv:mwjV9NKWioy8wjrKHEOzYAb1Ms3Ve4TC0R7LHF2UHCA','2025-07-04 08:48:11.810038');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources_article`
--

DROP TABLE IF EXISTS `resources_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources_article` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `article_type` varchar(9) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `year` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `medium` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dimensions` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `location` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `born` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `died` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nationality` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `known_for` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `designed_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `developer` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  `subject_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resources_article_author_id_dd980003_fk_resources_customuser_id` (`author_id`),
  KEY `resources_article_subject_id_f93ff934_fk_resources_subject_id` (`subject_id`),
  CONSTRAINT `resources_article_author_id_dd980003_fk_resources_customuser_id` FOREIGN KEY (`author_id`) REFERENCES `resources_customuser` (`id`),
  CONSTRAINT `resources_article_subject_id_f93ff934_fk_resources_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `resources_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources_article`
--

LOCK TABLES `resources_article` WRITE;
/*!40000 ALTER TABLE `resources_article` DISABLE KEYS */;
INSERT INTO `resources_article` VALUES (1,'Claude Monet','Oscar-Claude Monet was a French painter, a founder of French Impressionist painting and the most consistent and prolific practitioner of the movement\'s philosophy of expressing one\'s perceptions before nature, especially as applied to plein air landscape painting. The term \"Impressionism\" is derived from the title of his painting Impression, soleil levant (Impression, Sunrise), which was exhibited in 1874 in the first of the independent exhibitions mounted by Monet and his associates as an alternative to the Salon de Paris. Monet\'s ambition of documenting the French countryside led him to adopt a method of painting the same scene many times in order to capture the changing of light and the passing of the seasons. From 1883, Monet lived in Giverny, where he purchased a house and property and began a vast landscaping project which included lily ponds that would become the subjects of his best-known works. In 1899, he began painting the water lilies, first in vertical views with a Japanese bridge as a central feature and later in the series of large-scale paintings that was to occupy him continuously for the next 20 years of his life.','BIOGRAPHY','2025-06-19 11:21:56.411511','2025-06-20 07:41:38.817833',NULL,NULL,NULL,NULL,'1844','1926','French','Painter','Hemant','Hemant',1,1),(2,'Leonardo da Vinci','Leonardo di ser Piero da Vinci, more commonly Leonardo da Vinci, was an Italian polymath of the Renaissance, whose areas of interest included invention, painting, sculpting, architecture, science, music, mathematics, engineering, literature, anatomy, geology, astronomy, botany, writing, history, and cartography. He has been variously called the father of palaeontology, ichnology, and architecture, and is widely considered one of the greatest painters of all time. Sometimes credited with the inventions of the parachute, helicopter and tank, he epitomised the Renaissance humanist ideal.','BIOGRAPHY','2025-06-19 11:21:56.438188','2025-06-19 11:21:56.438188',NULL,NULL,NULL,NULL,'1452','1519','Italian','Art and Science',NULL,NULL,1,1),(3,'Mona Lisa','The Mona Lisa is a half-length portrait painting by the Italian Renaissance artist Leonardo da Vinci that has been described as \"the best known, the most visited, the most written about, the most sung about, the most parodied work of art in the world\". The Mona Lisa is also one of the most valuable paintings in the world. It holds the Guinness World Record for the highest known insurance valuation in history at $100 million in 1962, which is worth nearly $800 million in 2017.','OBJECT','2025-06-19 11:21:56.484976','2025-06-19 11:21:56.484976','1503-1506','Oil on poplar panel','77cm x53 cm','Musee du Louvre, Paris',NULL,NULL,NULL,NULL,'','',1,1),(4,'Pythagorean theorem','In mathematics, the Pythagorean theorem, also known as Pythagoras\' theorem, is a fundamental relation in Euclidean geometry among the three sides of a right triangle. It states that the square of the hypotenuse (the side opposite the right angle) is equal to the sum of the squares of the other two sides. The theorem can be written as an equation relating the lengths of the sides a, b and c, often called the \"Pythagorean equation\": {a^{2}+b^{2}=c^{2},} a^{2}+b^{2}=c^{2}, where c represents the length of the hypotenuse and a and b the lengths of the triangle\'s other two sides. Although it is often argued that knowledge of the theorem predates him, the theorem is named after the ancient Greek mathematician Pythagoras as it is he who, by tradition, is credited with its first proof, although no evidence of it exists.There is some evidence that Babylonian mathematicians understood the formula, although little of it indicates an application within a mathematical framework.Mesopotamian, Indian and Chinese mathematicians all discovered the theorem independently and, in some cases, provided proofs for special cases. The theorem has been given numerous proofs – possibly the most for any mathematical theorem. They are very diverse, including both geometric proofs and algebraic proofs, with some dating back thousands of years. The theorem can be generalized in various ways, including higher-dimensional spaces, to spaces that are not Euclidean, to objects that are not right triangles, and indeed, to objects that are not triangles at all, but n-dimensional solids. The Pythagorean theorem has attracted interest outside mathematics as a symbol of mathematical abstruseness, mystique, or intellectual power; popular references in literature, plays, musicals, songs, stamps and cartoons abound.','CONCEPT','2025-06-19 11:21:56.492749','2025-06-19 11:21:56.492749',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2),(5,'Euclid','Euclid, sometimes given the name Euclid of Alexandria to distinguish him from Euclides of Megara, was a Greek mathematician, often referred to as the \"founder of geometry\" or the \"father of geometry\". He was active in Alexandria during the reign of Ptolemy I (323–283 BC). His Elements is one of the most influential works in the history of mathematics, serving as the main textbook for teaching mathematics (especially geometry) from the time of its publication until the late 19th or early 20th century. In the Elements, Euclid deduced the theorems of what is now called Euclidean geometry from a small set of axioms. Euclid also wrote works on perspective, conic sections, spherical geometry, number theory, and rigor.','BIOGRAPHY','2025-06-19 11:21:56.499914','2025-06-19 11:21:56.499914',NULL,NULL,NULL,NULL,'4th century BC','3rd century BC','','Euclidean geometry',NULL,NULL,1,2),(6,'Quicksort','Quicksort (sometimes called partition-exchange sort) is an efficient sorting algorithm, serving as a systematic method for placing the elements of an array in order. Developed by Tony Hoare in 1959 and published in 1961, it is still a commonly used algorithm for sorting. Quicksort is a comparison sort, meaning that it can sort items of any type for which a \"less-than\" relation (formally, a total order) is defined. In efficient implementations it is not a stable sort, meaning that the relative order of equal sort items is not preserved. Quicksort can operate in-place on an array, requiring small additional amounts of memory to perform the sorting. It is very similar to selection sort, except that it does not always choose worst-case partition.','CONCEPT','2025-06-19 11:21:56.523608','2025-06-19 11:21:56.523608',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2),(7,'Bill Gates','William Henry Gates III is an American business magnate, investor, author, philanthropist, humanitarian, and principal founder of Microsoft Corporation. During his career at Microsoft, Gates held the positions of chairman, CEO and chief software architect, while also being the largest individual shareholder until May 2014. In 1975, Gates and Paul Allen launched Microsoft, which became the world\'s largest PC software company. Gates led the company as chief executive officer until stepping down in January 2000, but he remained as chairman and created the position of chief software architect for himself.','BIOGRAPHY','2025-06-19 11:21:56.530909','2025-06-19 11:21:56.530909',NULL,NULL,NULL,NULL,'1955','','USA','Founder of the Microsoft Corporation ',NULL,NULL,1,3),(8,'Steve Jobs','Steven Paul Jobs was an American entrepreneur and business magnate. He was the chairman, chief executive officer (CEO), and a co-founder of Apple Inc., chairman and majority shareholder of Pixar, a member of The Walt Disney Company\'s board of directors following its acquisition of Pixar, and the founder, chairman, and CEO of NeXT. Jobs is widely recognized as a pioneer of the microcomputer revolution of the 1970s and 1980s, along with Apple co-founder Steve Wozniak.','BIOGRAPHY','2025-06-19 11:21:56.553898','2025-06-19 11:21:56.553898',NULL,NULL,NULL,NULL,'1955','2011','USA','Co-creator of the Macintosh, iPod, iPhone, iPad, and first Apple Stores',NULL,NULL,1,3),(9,'Java','Java is a general-purpose computer-programming language that is concurrent, class-based, object-oriented, and specifically designed to have as few implementation dependencies as possible. It is intended to let application developers \"write once, run anywhere\", meaning that compiled Java code can run on all platforms that support Java without the need for recompilation. Java applications are typically compiled to bytecode that can run on any Java virtual machine (JVM) regardless of computer architecture. As of 2016, Java is one of the most popular programming languages in use, particularly for client-server web applications, with a reported 9 million developers. Java was originally developed by James Gosling at Sun Microsystems (which has since been acquired by Oracle Corporation) and released in 1995 as a core component of Sun Microsystems\' Java platform. The language derives much of its syntax from C and C++, but it has fewer low-level facilities than either of them.','OBJECT','2025-06-19 11:21:56.627633','2025-06-19 11:21:56.627633','','','','',NULL,NULL,NULL,NULL,'James Gosling','',1,3),(11,'python','ewew','OBJECT','2025-06-20 08:02:14.093601','2025-06-20 08:17:40.004318','2000',NULL,NULL,'new zealand',NULL,NULL,NULL,NULL,NULL,NULL,3,3);
/*!40000 ALTER TABLE `resources_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources_articlekeyword`
--

DROP TABLE IF EXISTS `resources_articlekeyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources_articlekeyword` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `article_id` bigint NOT NULL,
  `keyword_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resources_articlekeyword_article_id_keyword_id_c30e5447_uniq` (`article_id`,`keyword_id`),
  KEY `resources_articlekey_keyword_id_e8555a25_fk_resources` (`keyword_id`),
  CONSTRAINT `resources_articlekey_article_id_961b1ba7_fk_resources` FOREIGN KEY (`article_id`) REFERENCES `resources_article` (`id`),
  CONSTRAINT `resources_articlekey_keyword_id_e8555a25_fk_resources` FOREIGN KEY (`keyword_id`) REFERENCES `resources_keyword` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources_articlekeyword`
--

LOCK TABLES `resources_articlekeyword` WRITE;
/*!40000 ALTER TABLE `resources_articlekeyword` DISABLE KEYS */;
INSERT INTO `resources_articlekeyword` VALUES (11,1,1),(2,2,2),(3,5,3),(4,7,4),(5,8,5),(6,8,6),(7,8,7),(8,8,8),(9,8,9);
/*!40000 ALTER TABLE `resources_articlekeyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources_customuser`
--

DROP TABLE IF EXISTS `resources_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(7) COLLATE utf8mb4_general_ci NOT NULL,
  `bio` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources_customuser`
--

LOCK TABLES `resources_customuser` WRITE;
/*!40000 ALTER TABLE `resources_customuser` DISABLE KEYS */;
INSERT INTO `resources_customuser` VALUES (1,'pbkdf2_sha256$720000$LwPUyRkj8Og48IrXlgCpUw$JGZ6RCmXQrHYEbLfAvWVqKdHiBjfHiz0QHvSOSBh1YA=','2025-06-20 08:48:11.818040',1,'admin','','','admin@teched.edu',1,1,'2025-06-19 11:21:55.750026','ADMIN',NULL),(2,'pbkdf2_sha256$720000$ydrdVWNQjDty54LIl8xqYM$IUqWIje9o5Y3rCIV+dKTwx2CwTEWaN5Gfy+QnzcSw0o=','2025-06-20 08:51:05.079652',0,'student1','','','',0,1,'2025-06-19 11:32:05.069330','STUDENT',NULL),(3,'pbkdf2_sha256$720000$aAulojtoTcMN4wWLnnNvjV$RfOlG00IoDY2qIR31GyxNcAy1ePGO+YYeUHCHfgriAo=','2025-06-20 08:53:49.841078',0,'tutor1','','','',0,1,'2025-06-19 11:32:05.721215','TUTOR',NULL),(4,'pbkdf2_sha256$720000$6m4Lai20EPRDJxVRXt9qBF$Bf3h20VF5HFQRUx3toD7bLi+sgCMcHQjozKNh03dqJM=','2025-06-20 08:59:23.641107',1,'admin2','','','admin2@example.com',1,1,'2025-06-19 11:32:08.592730','ADMIN',NULL),(5,'pbkdf2_sha256$600000$SNWX6PFf1IEPFRShlQmRkN$VIXroPfldUZVo5xk31nItQit4hlOWtWfMMBqx6+AyM4=','2025-06-19 11:55:56.664147',1,'hemant','','','',1,1,'2025-06-19 11:38:29.771282','STUDENT',NULL);
/*!40000 ALTER TABLE `resources_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources_customuser_groups`
--

DROP TABLE IF EXISTS `resources_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resources_customuser_groups_customuser_id_group_id_7a63f08c_uniq` (`customuser_id`,`group_id`),
  KEY `resources_customuser_groups_group_id_3663969b_fk_auth_group_id` (`group_id`),
  CONSTRAINT `resources_customuser_customuser_id_10b92cb6_fk_resources` FOREIGN KEY (`customuser_id`) REFERENCES `resources_customuser` (`id`),
  CONSTRAINT `resources_customuser_groups_group_id_3663969b_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources_customuser_groups`
--

LOCK TABLES `resources_customuser_groups` WRITE;
/*!40000 ALTER TABLE `resources_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `resources_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources_customuser_user_permissions`
--

DROP TABLE IF EXISTS `resources_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resources_customuser_use_customuser_id_permission_f2c6ab6c_uniq` (`customuser_id`,`permission_id`),
  KEY `resources_customuser_permission_id_925690e0_fk_auth_perm` (`permission_id`),
  CONSTRAINT `resources_customuser_customuser_id_a806b314_fk_resources` FOREIGN KEY (`customuser_id`) REFERENCES `resources_customuser` (`id`),
  CONSTRAINT `resources_customuser_permission_id_925690e0_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources_customuser_user_permissions`
--

LOCK TABLES `resources_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `resources_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `resources_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources_keyword`
--

DROP TABLE IF EXISTS `resources_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources_keyword` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `keyword` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources_keyword`
--

LOCK TABLES `resources_keyword` WRITE;
/*!40000 ALTER TABLE `resources_keyword` DISABLE KEYS */;
INSERT INTO `resources_keyword` VALUES (9,'and first Apple Stores'),(2,'Art and Science'),(5,'Co-creator of the Macintosh'),(3,'Euclidean geometry'),(4,'Founder of the Microsoft Corporation'),(8,'iPad'),(7,'iPhone'),(6,'iPod'),(1,'Painter');
/*!40000 ALTER TABLE `resources_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources_subject`
--

DROP TABLE IF EXISTS `resources_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources_subject`
--

LOCK TABLES `resources_subject` WRITE;
/*!40000 ALTER TABLE `resources_subject` DISABLE KEYS */;
INSERT INTO `resources_subject` VALUES (1,'Arts','Resources about Arts'),(2,'Mathematics','Resources about Mathematics'),(3,'Technology','Resources about Technology');
/*!40000 ALTER TABLE `resources_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'teched_resources'
--

--
-- Dumping routines for database 'teched_resources'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-20 14:32:12
