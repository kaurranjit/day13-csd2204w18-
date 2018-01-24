-- MySQL dump 10.16  Distrib 10.1.21-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.21-MariaDB

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
-- Table structure for table `emp_details`
--

DROP TABLE IF EXISTS `emp_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_details` (
  `EMPLOYEE_ID` int(6) NOT NULL,
  `FIRST_NAME` varchar(20) DEFAULT NULL,
  `LAST_NAME` varchar(25) NOT NULL,
  `EMAIL` varchar(25) NOT NULL,
  `PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `HIRE_DATE` date DEFAULT NULL,
  `JOB_ID` varchar(10) NOT NULL,
  `SALARY` double(8,2) DEFAULT NULL,
  `COMMISSION_PCT` double(2,2) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_details`
--

LOCK TABLES `emp_details` WRITE;
/*!40000 ALTER TABLE `emp_details` DISABLE KEYS */;
INSERT INTO `emp_details` VALUES (101,'NEENA','KOCHHAR','NEENA.KOCHHAR@GMAIL.COM','2345678','2002-10-10','AD_VP',18000.00,0.50),(102,'LEX','DE HANN','LEX.HANN@GMAIL.COM','2345678','1995-10-20','AD_VP',18000.00,0.50),(103,'ALEXANDER','HUNOLD','ALEXANDER.HUNOLD@GMAIL.CO','2345678','2002-11-23','IT_PROG',10000.00,0.25),(104,'BRUCE','ERNST','BRUCE.ERNST@GMAIL.COM','2345678','2003-08-24','IT_PROG',7000.00,0.25),(105,'DAVID','AUSTIN','DAVID.AUSTIN@GMAIL.COM','2345678','2005-04-10','IT_PROG',5800.00,0.25),(334,'Ana','King','ANA','212.212.21201','2013-02-05','IT_PROG',18000.00,0.50);
/*!40000 ALTER TABLE `emp_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE OR REPLACE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `emp_details_BINS`
BEFORE INSERT ON emp_details
FOR EACH ROW
BEGIN
SET NEW.FIRST_NAME = TRIM(NEW.FIRST_NAME);
SET NEW.LAST_NAME = TRIM(NEW.LAST_NAME);
SET NEW.JOB_ID = UPPER(NEW.JOB_ID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE OR REPLACE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `emp_details_AUPD`
AFTER UPDATE ON emp_details FOR EACH ROW
BEGIN
INSERT INTO LOG_EMP_DETAILS_UPDATE VALUES (user(),
CONCAT('Update employee Record ',
OLD.FIRST_NAME,' Old Salary :',OLD.Salary,' New Salary : ',
NEW.Salary),NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE OR REPLACE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `emp_details_ADEL`
AFTER DELETE ON emp_details FOR EACH ROW
BEGIN
INSERT INTO LOG_EMP_DETAILS_UPDATE VALUES (user(),
CONCAT('Delete Employee Record', OLD.FIRST_NAME, '->
Deleted on '),NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `log_emp_details`
--

DROP TABLE IF EXISTS `log_emp_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_emp_details` (
  `EMPLOYEE_ID` int(6) DEFAULT NULL,
  `SALARY` double(8,2) DEFAULT NULL,
  `EDTTIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_emp_details`
--

LOCK TABLES `log_emp_details` WRITE;
/*!40000 ALTER TABLE `log_emp_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_emp_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_emp_details_update`
--

DROP TABLE IF EXISTS `log_emp_details_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_emp_details_update` (
  `USER` varchar(50) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `UDTTIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_emp_details_update`
--

LOCK TABLES `log_emp_details_update` WRITE;
/*!40000 ALTER TABLE `log_emp_details_update` DISABLE KEYS */;
INSERT INTO `log_emp_details_update` VALUES ('root@localhost','Update employee Record STEVEN Old Salary :24000.00 New Salary : 25000.00','2018-01-24 09:10:48'),('root@localhost','Update employee Record NEENA Old Salary :17000.00 New Salary : 18000.00','2018-01-24 09:10:48'),('root@localhost','Update employee Record LEX Old Salary :17000.00 New Salary : 18000.00','2018-01-24 09:10:48'),('root@localhost','Update employee Record ALEXANDER Old Salary :9000.00 New Salary : 10000.00','2018-01-24 09:10:48'),('root@localhost','Update employee Record BRUCE Old Salary :6000.00 New Salary : 7000.00','2018-01-24 09:10:48'),('root@localhost','Update employee Record DAVID Old Salary :4800.00 New Salary : 5800.00','2018-01-24 09:10:48'),('root@localhost','Update employee Record Ana Old Salary :17000.00 New Salary : 18000.00','2018-01-24 09:10:48'),('root@localhost','Delete Employee RecordSTEVEN->\nDeleted on ','2018-01-24 09:31:21');
/*!40000 ALTER TABLE `log_emp_details_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numbers`
--

DROP TABLE IF EXISTS `numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numbers` (
  `N1` float(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numbers`
--

LOCK TABLES `numbers` WRITE;
/*!40000 ALTER TABLE `numbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `numbers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger ins_sum
before insert ON numbers
 for each row SET @sum = NEW.n1 */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `price_logs`
--

DROP TABLE IF EXISTS `price_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_code` int(3) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_logs`
--

LOCK TABLES `price_logs` WRITE;
/*!40000 ALTER TABLE `price_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `price_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_marks`
--

DROP TABLE IF EXISTS `stud_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stud_marks` (
  `STUDENT_ID` int(3) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `SUB1` double(4,2) DEFAULT NULL,
  `SUB2` double(4,2) DEFAULT NULL,
  `SUB3` double(4,2) DEFAULT NULL,
  `SUB4` double(4,2) DEFAULT NULL,
  `SUB5` double(4,2) DEFAULT NULL,
  `TOTAL` double(5,2) DEFAULT NULL,
  `PERCENTAGE` double(4,2) DEFAULT NULL,
  `GRADE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`STUDENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_marks`
--

LOCK TABLES `stud_marks` WRITE;
/*!40000 ALTER TABLE `stud_marks` DISABLE KEYS */;
INSERT INTO `stud_marks` VALUES (1,'ALEX',54.00,69.00,89.00,87.00,59.00,358.00,71.60,'GOOD'),(2,'BOB',54.00,69.00,89.00,87.00,59.00,358.00,71.60,'GOOD'),(3,'CHARLEY',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'DONNA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `stud_marks` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE OR REPLACE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `stud_marks_BUPD`
BEFORE UPDATE ON stud_marks FOR EACH ROW
BEGIN
SET NEW.TOTAL = NEW.SUB1 + NEW.SUB2 + NEW.SUB3 +
NEW.SUB4 + NEW.SUB5;
SET NEW.PERCENTAGE = NEW.TOTAL/5;
IF NEW.PERCENTAGE >=90
THEN SET NEW.GRADE = 'EXCELLENT';
ELSEIF NEW.PERCENTAGE>=75 AND NEW.PERCENTAGE<90
THEN SET NEW.GRADE = 'VERY GOOD';
ELSEIF NEW.PERCENTAGE>=60 AND NEW.PERCENTAGE<75
THEN SET NEW.GRADE = 'GOOD';
ELSEIF NEW.PERCENTAGE>=40 AND NEW.PERCENTAGE<60
THEN SET NEW.GRADE = 'AVERAGE';
ELSE SET NEW.GRADE = 'NOT PROMOTED';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_change_logs`
--

DROP TABLE IF EXISTS `user_change_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_change_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_code` int(3) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_change_logs`
--

LOCK TABLES `user_change_logs` WRITE;
/*!40000 ALTER TABLE `user_change_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_change_logs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-24 11:12:34
