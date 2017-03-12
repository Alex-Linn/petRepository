/*
SQLyog Ultimate v8.32 
MySQL - 5.5.45-log : Database - movieticket
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`movieticket` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `movieticket`;

/*Table structure for table `t_cinema` */

DROP TABLE IF EXISTS `t_cinema`;

CREATE TABLE `t_cinema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(30) DEFAULT NULL,
  `area` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cinema_name` varchar(100) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `map_info` varchar(255) DEFAULT NULL,
  `introduction` text,
  `create_time` date DEFAULT NULL,
  `cinema_desc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2869 DEFAULT CHARSET=utf8;

/*Table structure for table `t_comment` */

DROP TABLE IF EXISTS `t_comment`;

CREATE TABLE `t_comment` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `movie_id` int(30) DEFAULT NULL,
  `user_id` int(30) DEFAULT NULL,
  `comment` text,
  `score` int(11) DEFAULT NULL,
  `dianzan` int(11) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_movie` */

DROP TABLE IF EXISTS `t_movie`;

CREATE TABLE `t_movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(255) NOT NULL,
  `movie_english_name` varchar(255) DEFAULT NULL,
  `director` varchar(100) DEFAULT NULL,
  `performer` varchar(255) DEFAULT NULL,
  `movie_type` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `movie_language` varchar(30) DEFAULT NULL,
  `movie_time` varchar(255) DEFAULT NULL,
  `movie_story` text,
  `poster_url` varchar(255) DEFAULT NULL,
  `rescheduled_time` varchar(30) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `is_show` int(11) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movieName` (`movie_name`)
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=utf8;

/*Table structure for table `t_movie_cinema` */

DROP TABLE IF EXISTS `t_movie_cinema`;

CREATE TABLE `t_movie_cinema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `cinema_id` int(11) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5366 DEFAULT CHARSET=utf8;

/*Table structure for table `t_movie_schedule` */

DROP TABLE IF EXISTS `t_movie_schedule`;

CREATE TABLE `t_movie_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `cinema_id` int(11) DEFAULT NULL,
  `start_time` varchar(30) DEFAULT NULL,
  `end_time` varchar(30) DEFAULT NULL,
  `movie_language` varchar(30) DEFAULT NULL,
  `video_hall` varchar(30) DEFAULT NULL,
  `seat_condition` varchar(30) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `buy_url` varchar(255) DEFAULT NULL,
  `website_type` varchar(30) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11400 DEFAULT CHARSET=utf8;

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) DEFAULT NULL,
  `user_pwd` varchar(30) DEFAULT NULL,
  `user_tel` varchar(30) DEFAULT NULL,
  `user_picture` varchar(50) DEFAULT NULL,
  `user_email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
