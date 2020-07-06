
create database if not exists qdb;
use qdb;

CREATE TABLE `atestq`
(
  `id` INTEGER AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(256),
  `date` DATE
);
INSERT INTO `atestq`
(  `name`,  `date`)
VALUES
(  'foo',  '2017-07-24'),
(  'bar',  '2017-05-31'),
(  'baz',  '1958-09-29'),
(  'quz',  '1913-07-06');


DROP TABLE IF EXISTS `itemq`;
CREATE TABLE `itemq` (
  `sfdate` date DEFAULT NULL,
  `sfshift` enum('Nights','Days','Afternoons') DEFAULT NULL,
  `reportedby` varchar(99) DEFAULT NULL,
  `field_1` varchar(40) DEFAULT NULL,
  `zgen` varchar(99) DEFAULT NULL,
  `miscellaneous` text,
  `createdtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedtime` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;

INSERT INTO `itemq` (`sfdate`, `sfshift`, `reportedby`, `field_1`, `zgen`, `miscellaneous`, `createdtime`, `updatedtime`, `id`) VALUES
('2013-06-25',	'Nights',	'Chad ',	'ddad',	'',	'a',	'2013-06-25 13:22:53',	'2013-06-25 09:22:30',	12),
('2013-06-25',	'Afternoons',	'Cathy ',	'a',	'a',	'a',	'2013-06-25 14:56:25',	'2013-06-25 10:56:02',	13),
('2020-06-02',	NULL,	'test',	'David peeba ',	'a test to see  ..',	'test from `writetest`',	'2020-03-25 01:49:25',	'2020-06-07 16:45:53',	118);

-- =================================================

-- Adminer 4.7.6 MySQL dump
SET NAMES utf8;
SET foreign_key_checks = 0;
SET NAMES utf8mb4;

DROP TABLE IF EXISTS `qissuesq`;
CREATE TABLE `qissuesq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Issuedby` varchar(20) NOT NULL,
  `Cost` int DEFAULT '0',
  `Lengthofchange` double NOT NULL DEFAULT '1',
  `body` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Cost` (`Cost`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `qissuesq` (`id`, `Issuedby`, `Cost`, `Lengthofchange`, `body`, `updated_at`, `created_at`) VALUES
(1,	'',	0,	1,	'one',	'2020-07-03 16:02:17',	'2020-07-03 16:02:17');

DELIMITER ;;

CREATE TRIGGER `qissues_trigger_created` BEFORE INSERT ON `qissuesq` FOR EACH ROW
BEGIN 
      SET new.created_at := now();  
      SET new.updated_at := now(); 
      END;;

CREATE TRIGGER `qissues_trigger_updated` BEFORE UPDATE ON `qissuesq` FOR EACH ROW
BEGIN 
      SET new.updated_at := now();  
      END;;

DELIMITER ;

