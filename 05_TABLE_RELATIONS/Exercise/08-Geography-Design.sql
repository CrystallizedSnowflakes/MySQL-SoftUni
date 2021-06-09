CREATE DATABASE IF NOT EXISTS `geography` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `geography`;

CREATE TABLE IF NOT EXISTS `continents` (
  `continent_code` char(2) NOT NULL,
  `continent_name` varchar(50) NOT NULL,
  PRIMARY KEY (`continent_code`),
  UNIQUE KEY `PK_Continents` (`continent_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `countries` (
  `country_code` char(2) NOT NULL,
  `iso_code` char(3) NOT NULL,
  `country_name` varchar(45) NOT NULL,
  `currency_code` char(3) DEFAULT NULL,
  `continent_code` char(2) NOT NULL,
  `population` int(10) NOT NULL,
  `are_in_sq_km` int(10) NOT NULL,
  `capital` varchar(30) NOT NULL,
  PRIMARY KEY (`country_code`),
  UNIQUE KEY `PK_Countries` (`country_code`),
  KEY `fk_countries_currencies` (`currency_code`),
  KEY `fk_countries_continents` (`continent_code`),
  CONSTRAINT `fk_countries_continents` FOREIGN KEY (`continent_code`) REFERENCES `continents` (`continent_code`),
  CONSTRAINT `fk_countries_currencies` FOREIGN KEY (`currency_code`) REFERENCES `currencies` (`currency_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `countries_rivers` (
  `river_id` int(10) NOT NULL,
  `country_code` char(2) NOT NULL,
  PRIMARY KEY (`river_id`,`country_code`),
  UNIQUE KEY `PK_CountriesRivers` (`country_code`,`river_id`),
  CONSTRAINT `fk_countries_rivers_countries` FOREIGN KEY (`country_code`) REFERENCES `countries` (`country_code`),
  CONSTRAINT `fk_countries_rivers_rivers` FOREIGN KEY (`river_id`) REFERENCES `rivers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `currencies` (
  `currency_code` char(3) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`currency_code`),
  UNIQUE KEY `PK_Currencies` (`currency_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mountains` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mountain_range` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PK_Mountains` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mountains_countries` (
  `mountain_id` int(10) NOT NULL,
  `country_code` char(2) NOT NULL,
  PRIMARY KEY (`mountain_id`,`country_code`),
  UNIQUE KEY `PK_MountainsContinents` (`mountain_id`,`country_code`),
  KEY `fk_mountains_countries_mountains` (`country_code`),
  CONSTRAINT `fk_mountains_countries_countries` FOREIGN KEY (`mountain_id`) REFERENCES `mountains` (`id`),
  CONSTRAINT `fk_mountains_countries_mountains` FOREIGN KEY (`country_code`) REFERENCES `countries` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `peaks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `peak_name` varchar(50) NOT NULL,
  `elevation` int(10) NOT NULL,
  `mountain_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PK_Peaks` (`id`),
  KEY `fk_peaks_mountains` (`mountain_id`),
  CONSTRAINT `fk_peaks_mountains` FOREIGN KEY (`mountain_id`) REFERENCES `mountains` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `rivers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `river_name` varchar(50) NOT NULL,
  `length` int(10) NOT NULL,
  `drainage_area` int(10) NOT NULL,
  `average_discharge` int(10) NOT NULL,
  `outflow` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PK_Rivers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
