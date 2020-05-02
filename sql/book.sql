/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.19 : Database - ssmbuild
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssmbuild` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ssmbuild`;

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `bookId` int NOT NULL AUTO_INCREMENT COMMENT '书Id',
  `bookName` varchar(100) NOT NULL COMMENT '书名',
  `bookCount` int NOT NULL COMMENT '数量',
  `detail` varchar(200) NOT NULL COMMENT '描述',
  `bookImg` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;

/*Data for the table `books` */

insert  into `books`(`bookId`,`bookName`,`bookCount`,`detail`,`bookImg`) values (40,'Mongo',10,'入门到入土','images\\847b9d6c850a48cba3cb19dc37ab490d_图 (9).jpg'),(41,'Ubuntu',30,'从进门到进牢','images\\61c25e76d1ae4c1185b030f90f3eb01e_图 (12).jpg'),(42,'jvm',45,'入门到放弃123','images\\58ce4b2ba1cb4a1f9791763edefc05df_图 (7).jpg'),(43,'MySQL',5,'删库到跑路','images\\990af617ef27447bbd91a837b42b5614_图 (3).jpg'),(44,'Redis',20,'学了用不上','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(45,'程序员转行',25,'卖煎饼','images\\08e3e76305724ddab97d1bd454115456_图 (8).jpg'),(46,'数据结构与算法',23,'只会排序','images\\2de1f616770749b9b6c2a6b7b4915ce4_图 (6).jpg'),(47,'算法导论',3,'垫脚，压泡面','images\\0705da54a2814b548ce73d3d13830f79_图 (2).jpg'),(82,'MySQL',5,'从删库到跑路','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(83,'Linux',10,'从进门到进牢','images\\58ce4b2ba1cb4a1f9791763edefc05df_图 (7).jpg'),(84,'Java',1,'从入门到放弃','images\\0705da54a2814b548ce73d3d13830f79_图 (2).jpg'),(85,'MySQL',5,'从删库到跑路','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(86,'Linux',10,'从进门到进牢','images\\58ce4b2ba1cb4a1f9791763edefc05df_图 (7).jpg'),(87,'Java',1,'从入门到放弃','images\\0705da54a2814b548ce73d3d13830f79_图 (2).jpg'),(88,'MySQL',5,'从删库到跑路','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(89,'Linux',10,'从进门到进牢','images\\58ce4b2ba1cb4a1f9791763edefc05df_图 (7).jpg'),(90,'Java',1,'从入门到放弃','images\\0705da54a2814b548ce73d3d13830f79_图 (2).jpg'),(91,'MySQL',5,'从删库到跑路','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(92,'Linux',10,'从进门到进牢','images\\58ce4b2ba1cb4a1f9791763edefc05df_图 (7).jpg'),(94,'MySQL',5,'从删库到跑路','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(95,'Linux',10,'从进门到进牢','images\\58ce4b2ba1cb4a1f9791763edefc05df_图 (7).jpg'),(97,'MySQL',5,'从删库到跑路','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(98,'CentOS',10,'从进门到进牢','images\\58ce4b2ba1cb4a1f9791763edefc05df_图 (7).jpg'),(99,'Java',1,'从入门到放弃','images\\0705da54a2814b548ce73d3d13830f79_图 (2).jpg'),(100,'MySQL',5,'从删库到跑路','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(101,'Linux',10,'从进门到进牢','images\\58ce4b2ba1cb4a1f9791763edefc05df_图 (7).jpg'),(102,'Java',1,'从入门到放弃','images\\0705da54a2814b548ce73d3d13830f79_图 (2).jpg'),(103,'MySQL',5,'从删库到跑路','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(104,'Linux',10,'从进门到进牢','images\\58ce4b2ba1cb4a1f9791763edefc05df_图 (7).jpg'),(105,'Java',1,'从入门到放弃','images\\0705da54a2814b548ce73d3d13830f79_图 (2).jpg'),(106,'MySQL',5,'从删库到跑路','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(107,'Linux',10,'从进门到进牢','images\\58ce4b2ba1cb4a1f9791763edefc05df_图 (7).jpg'),(108,'Java',1,'从入门到放弃','images\\0705da54a2814b548ce73d3d13830f79_图 (2).jpg'),(109,'MySQL',5,'从删库到跑路','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(110,'Linux',10,'从进门到进牢','images\\58ce4b2ba1cb4a1f9791763edefc05df_图 (7).jpg'),(111,'Java',1,'从入门到放弃','images\\0705da54a2814b548ce73d3d13830f79_图 (2).jpg'),(112,'MySQL',5,'从删库到跑路','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(113,'Linux',10,'从进门到进牢','images\\58ce4b2ba1cb4a1f9791763edefc05df_图 (7).jpg'),(114,'Java',1,'从入门到放弃','images\\0705da54a2814b548ce73d3d13830f79_图 (2).jpg'),(115,'MySQL',5,'从删库到跑路','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(116,'Linux',10,'从进门到进牢','images\\58ce4b2ba1cb4a1f9791763edefc05df_图 (7).jpg'),(117,'Java',1,'从入门到放弃','images\\0705da54a2814b548ce73d3d13830f79_图 (2).jpg'),(118,'MySQL',5,'从删库到跑路','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(119,'Linux',10,'从进门到进牢','images\\58ce4b2ba1cb4a1f9791763edefc05df_图 (7).jpg'),(120,'Java',1,'从入门到放弃','images\\0705da54a2814b548ce73d3d13830f79_图 (2).jpg'),(121,'MySQL',5,'从删库到跑路','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(122,'Linux',10,'从进门到进牢','images\\58ce4b2ba1cb4a1f9791763edefc05df_图 (7).jpg'),(123,'Java',1,'从入门到放弃','images\\0705da54a2814b548ce73d3d13830f79_图 (2).jpg'),(124,'MySQL',5,'从删库到跑路','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(125,'Linux',10,'从进门到进牢','images\\58ce4b2ba1cb4a1f9791763edefc05df_图 (7).jpg'),(126,'Java',1,'从入门到放弃','images\\0705da54a2814b548ce73d3d13830f79_图 (2).jpg'),(127,'MySQL',5,'从删库到跑路','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(128,'Linux',10,'从进门到进牢','images\\58ce4b2ba1cb4a1f9791763edefc05df_图 (7).jpg'),(129,'Java',1,'从入门到放弃','images\\0705da54a2814b548ce73d3d13830f79_图 (2).jpg'),(130,'MySQL',5,'从删库到跑路','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(131,'Linux',10,'从进门到进牢','images\\58ce4b2ba1cb4a1f9791763edefc05df_图 (7).jpg'),(132,'Java',1,'从入门到放弃','images\\0705da54a2814b548ce73d3d13830f79_图 (2).jpg'),(133,'MySQL',5,'从删库到跑路','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(134,'Linux',10,'从进门到进牢','images\\58ce4b2ba1cb4a1f9791763edefc05df_图 (7).jpg'),(135,'Java',1,'从入门到放弃','images\\0705da54a2814b548ce73d3d13830f79_图 (2).jpg'),(136,'MySQL',5,'从删库到跑路','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(137,'Linux',10,'从进门到进牢','images\\58ce4b2ba1cb4a1f9791763edefc05df_图 (7).jpg'),(138,'Java',1,'从入门到放弃','images\\0705da54a2814b548ce73d3d13830f79_图 (2).jpg'),(139,'MySQL',5,'从删库到跑路','images\\36a01ceee1ad473e908ceff38982e768_图 (17).jpg'),(141,'Hello World',1,'Hello','images\\650d1f85231d483f8c003dc83db054af_01078934591fa0611046e454ac014cae.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
