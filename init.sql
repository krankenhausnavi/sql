SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

CREATE DATABASE `navi`
USE `navi`;

DROP TABLE IF EXISTS `institutions`;
CREATE TABLE `institutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL,
  `type` enum('doctor','hospital','other') NOT NULL,
  `street` varchar(256) NOT NULL,
  `city` varchar(64) NOT NULL,
  `postcode` varchar(16) NOT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `website` varchar(512) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `lat` float NOT NULL,
  `lon` float NOT NULL,
  `comment` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `opening_hours`;
CREATE TABLE `opening_hours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `institution_id` int(11) NOT NULL,
  `day` enum('Montag','Dienstag','Mittwoch','Donnerstag','Freitag','Samstag','Sonntag') NOT NULL,
  `start_time` varchar(10) NOT NULL,
  `end_time` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `resources`;
CREATE TABLE `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `institution_id` int(11) NOT NULL,
  `resource_type` enum('Betten','IPS-Betten ohne Beatmung','IPS-Betten mit Beatmung','Nicht-IPS-Betten mit Beatmung','COVID-Betten','Herz-Lungen-Geräte') NOT NULL,
  `max_capacity` int(11) NOT NULL,
  `current_capacity` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `waiting_times`;
CREATE TABLE `waiting_times` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `institution_id` int(11) NOT NULL,
  `service_type` enum('Hausbesuch','Notfalltermin','Telefonauskunft') NOT NULL,
  `waiting_time` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
