# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: n78048 (MySQL 5.5.28)
# Database: bianx_fieldtrials
# Generation Time: 2018-08-01 16:10:24 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table accession
# ------------------------------------------------------------

DROP TABLE IF EXISTS `accession`;

CREATE TABLE `accession` (
  `accessionId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text,
  `germplasmId` int(11) DEFAULT NULL,
  PRIMARY KEY (`accessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table experimentalArea
# ------------------------------------------------------------

DROP TABLE IF EXISTS `experimentalArea`;

CREATE TABLE `experimentalArea` (
  `experimentalAreaId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rowId` int(11) DEFAULT NULL,
  `location` text,
  `center_gpsId` int(11) DEFAULT NULL,
  `northEast_gpsId` int(11) DEFAULT NULL,
  `southWest_gpsId` int(11) DEFAULT NULL,
  `soilType` text,
  `trialYear` year(4) DEFAULT NULL,
  `name` text,
  PRIMARY KEY (`experimentalAreaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table fieldTrial
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldTrial`;

CREATE TABLE `fieldTrial` (
  `fieldTrialId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `experimentalAreaId` int(11) DEFAULT NULL,
  `name` text,
  `team` text,
  PRIMARY KEY (`fieldTrialId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table germplasm
# ------------------------------------------------------------

DROP TABLE IF EXISTS `germplasm`;

CREATE TABLE `germplasm` (
  `germplasmId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source` text,
  `accession` text,
  `name` text,
  PRIMARY KEY (`germplasmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gps
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gps`;

CREATE TABLE `gps` (
  `gpsId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `altitude` double DEFAULT NULL,
  PRIMARY KEY (`gpsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table plot
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plot`;

CREATE TABLE `plot` (
  `plotId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `accessionId` int(11) DEFAULT NULL,
  `sowingDate` date DEFAULT NULL,
  `harvestDate` date DEFAULT NULL,
  `width` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `trialDesign` text,
  `growingCondition` text,
  `treatment` text,
  PRIMARY KEY (`plotId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table row
# ------------------------------------------------------------

DROP TABLE IF EXISTS `row`;

CREATE TABLE `row` (
  `rowId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `plotId` int(11) NOT NULL,
  `rowNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
