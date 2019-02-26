# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: n78048 (MySQL 5.5.28)
# Database: bianx_fieldtrials
# Generation Time: 2018-08-24 15:40:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table experimentalArea
# ------------------------------------------------------------

DROP TABLE IF EXISTS `experimentalArea`;

CREATE TABLE `experimentalArea` (
  `experimentalAreaId` int(11) DEFAULT NULL,
  `fieldTrailId` int(11) DEFAULT NULL,
  `location` text,
  `soilType` text,
  `trialYear` year(4) DEFAULT NULL,
  `name` text,
  KEY `experimentalAreaId` (`experimentalAreaId`),
  KEY `exp_field` (`fieldTrailId`),
  CONSTRAINT `exp_field` FOREIGN KEY (`fieldTrailId`) REFERENCES `fieldTrial` (`fieldTrialId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table experimentalArea_phenotype
# ------------------------------------------------------------

DROP TABLE IF EXISTS `experimentalArea_phenotype`;

CREATE TABLE `experimentalArea_phenotype` (
  `experimentalAreaId` int(11) DEFAULT NULL,
  `phenotypeId` int(11) DEFAULT NULL,
  `corrected` tinyint(1) DEFAULT NULL,
  `method` text,
  KEY `experimentalAreaId` (`experimentalAreaId`),
  KEY `phenotypeId` (`phenotypeId`),
  CONSTRAINT `relationexpid` FOREIGN KEY (`experimentalAreaId`) REFERENCES `experimentalArea` (`experimentalAreaId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relationphenotypeid` FOREIGN KEY (`phenotypeId`) REFERENCES `phenotype` (`phenotypeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table fieldTrial
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldTrial`;

CREATE TABLE `fieldTrial` (
  `fieldTrialId` int(11) DEFAULT NULL,
  `name` text,
  `team` text,
  KEY `fieldTrialId` (`fieldTrialId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gps
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gps`;

CREATE TABLE `gps` (
  `gpsId` int(11) DEFAULT NULL,
  `experimentalAreaId` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `altitude` double DEFAULT NULL,
  KEY `gpsId` (`gpsId`),
  KEY `experimentalAreaId` (`experimentalAreaId`),
  CONSTRAINT `exp_gps` FOREIGN KEY (`experimentalAreaId`) REFERENCES `experimentalArea` (`experimentalAreaId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table instrument
# ------------------------------------------------------------

DROP TABLE IF EXISTS `instrument`;

CREATE TABLE `instrument` (
  `instrumentId` int(11) DEFAULT NULL,
  `instrumentName` text,
  `model` text,
  KEY `instrumentId` (`instrumentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table material
# ------------------------------------------------------------

DROP TABLE IF EXISTS `material`;

CREATE TABLE `material` (
  `materialId` int(11) DEFAULT NULL,
  `germanplasmId` int(11) DEFAULT NULL,
  `source` text,
  `accessionName` text,
  `pedigree` text,
  `barcode` text,
  `InGRU` tinyint(4) DEFAULT NULL,
  KEY `germ` (`materialId`),
  KEY `accessionId` (`germanplasmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table phenotype
# ------------------------------------------------------------

DROP TABLE IF EXISTS `phenotype`;

CREATE TABLE `phenotype` (
  `phenotypeId` int(11) DEFAULT NULL,
  `trait` text,
  `traitAbbr` text,
  `measurement` text,
  `unit` text,
  `date` date DEFAULT NULL,
  `instrumentId` int(11) DEFAULT NULL,
  `growthStage` text,
  KEY `phenotypeId` (`phenotypeId`),
  KEY `instrumentId` (`instrumentId`),
  CONSTRAINT `pheno_instru` FOREIGN KEY (`instrumentId`) REFERENCES `instrument` (`instrumentId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table plot
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plot`;

CREATE TABLE `plot` (
  `plotId` int(11) DEFAULT NULL,
  `experimentalAreaId` int(11) DEFAULT NULL,
  `sowingDate` date DEFAULT NULL,
  `harvestDate` date DEFAULT NULL,
  `width` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `trialDesign` text,
  `growingCondition` text,
  `treatment` text,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  KEY `plotId` (`plotId`),
  KEY `experimentalAreaId` (`experimentalAreaId`),
  CONSTRAINT `plot_exp` FOREIGN KEY (`experimentalAreaId`) REFERENCES `experimentalArea` (`experimentalAreaId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table row
# ------------------------------------------------------------

DROP TABLE IF EXISTS `row`;

CREATE TABLE `row` (
  `rowId` int(11) DEFAULT NULL,
  `plotId` int(11) NOT NULL,
  `rowNumber` int(11) DEFAULT NULL,
  `materialId` int(11) DEFAULT NULL,
  KEY `rowId` (`rowId`),
  KEY `plot` (`plotId`),
  KEY `row_mater` (`materialId`),
  CONSTRAINT `row_mater` FOREIGN KEY (`materialId`) REFERENCES `material` (`materialId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `plot` FOREIGN KEY (`plotId`) REFERENCES `plot` (`plotId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table row_Phenotype
# ------------------------------------------------------------

DROP TABLE IF EXISTS `row_Phenotype`;

CREATE TABLE `row_Phenotype` (
  `rowId` int(11) DEFAULT NULL,
  `phenotypeId` int(11) DEFAULT NULL,
  `corrected` tinyint(1) DEFAULT NULL,
  `method` text,
  KEY `plotId` (`rowId`),
  KEY `phenotypeId` (`phenotypeId`),
  CONSTRAINT `row_pheno` FOREIGN KEY (`rowId`) REFERENCES `row` (`rowId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rpheno` FOREIGN KEY (`phenotypeId`) REFERENCES `phenotype` (`phenotypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
