-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Ven 24 Juin 2011 à 08:10
-- Version du serveur: 6.0.0
-- Version de PHP: 5.2.9-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `tpzdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `exp_table`
--

DROP TABLE IF EXISTS `exp_table`;
CREATE TABLE IF NOT EXISTS `exp_table` (
  `level` tinyint(2) NOT NULL,
  `r1` smallint(4) unsigned NOT NULL DEFAULT '0',  -- 1 to 5
  `r2` smallint(4) unsigned NOT NULL DEFAULT '0',  -- 6 to 10
  `r3` smallint(4) unsigned NOT NULL DEFAULT '0',  -- 11 to 15
  `r4` smallint(4) unsigned NOT NULL DEFAULT '0',  -- 16 to 20
  `r5` smallint(4) unsigned NOT NULL DEFAULT '0',  -- 21 to 25
  `r6` smallint(4) unsigned NOT NULL DEFAULT '0',  -- 26 to 30
  `r7` smallint(4) unsigned NOT NULL DEFAULT '0',  -- 31 to 35
  `r8` smallint(4) unsigned NOT NULL DEFAULT '0',  -- 36 to 40
  `r9` smallint(4) unsigned NOT NULL DEFAULT '0',  -- 41 to 45
  `r10` smallint(4) unsigned NOT NULL DEFAULT '0', -- 46 to 50
  `r11` smallint(4) unsigned NOT NULL DEFAULT '0', -- 51 to 55
  `r12` smallint(4) unsigned NOT NULL DEFAULT '0', -- 56 to 60
  `r13` smallint(4) unsigned NOT NULL DEFAULT '0', -- 61 to 65
  `r14` smallint(4) unsigned NOT NULL DEFAULT '0', -- 66 to 70
  `r15` smallint(4) unsigned NOT NULL DEFAULT '0', -- 71 to 75
  `r16` smallint(4) unsigned NOT NULL DEFAULT '0', -- 76 to 80
  `r17` smallint(4) unsigned NOT NULL DEFAULT '0', -- 81 to 85
  `r18` smallint(4) unsigned NOT NULL DEFAULT '0', -- 86 to 90
  `r19` smallint(4) unsigned NOT NULL DEFAULT '0', -- 91 to 95
  `r20` smallint(4) unsigned NOT NULL DEFAULT '0', -- 96 to 99
  PRIMARY KEY (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=65;

--
-- Contenu de la table `exp_table`
--

INSERT INTO `exp_table` VALUES (15, 600, 600, 600, 600, 600, 600, 600, 600, 600, 530, 530, 580, 800, 800, 800, 800, 800, 800, 800, 800);
INSERT INTO `exp_table` VALUES (14, 600, 600, 600, 600, 600, 600, 600, 600, 600, 530, 530, 580, 720, 720, 720, 720, 720, 720, 720, 720);
INSERT INTO `exp_table` VALUES (13, 600, 600, 600, 600, 600, 600, 600, 600, 600, 530, 530, 580, 630, 630, 630, 630, 630, 630, 630, 630);
INSERT INTO `exp_table` VALUES (12, 600, 600, 600, 600, 600, 600, 600, 600, 600, 530, 530, 580, 580, 580, 580, 580, 580, 580, 580, 580);
INSERT INTO `exp_table` VALUES (11, 600, 600, 600, 600, 600, 600, 600, 600, 600, 530, 530, 580, 530, 530, 530, 530, 530, 530, 530, 530);
INSERT INTO `exp_table` VALUES (10, 600, 600, 600, 600, 600, 600, 600, 600, 600, 530, 530, 530, 480, 480, 480, 480, 480, 480, 480, 480);
INSERT INTO `exp_table` VALUES  (9, 600, 600, 600, 600, 600, 600, 600, 600, 600, 530, 530, 480, 440, 440, 440, 440, 440, 440, 440, 440);
INSERT INTO `exp_table` VALUES  (8, 600, 600, 600, 600, 600, 600, 550, 550, 550, 530, 480, 430, 400, 400, 400, 400, 400, 400, 400, 400);
INSERT INTO `exp_table` VALUES  (7, 550, 550, 550, 550, 550, 550, 500, 500, 500, 470, 430, 380, 360, 360, 360, 360, 360, 360, 360, 360);
INSERT INTO `exp_table` VALUES  (6, 450, 450, 450, 450, 450, 450, 450, 450, 450, 400, 370, 330, 320, 320, 320, 320, 320, 320, 320, 320);
INSERT INTO `exp_table` VALUES  (5, 350, 350, 350, 350, 350, 350, 400, 400, 400, 340, 310, 280, 280, 280, 280, 280, 280, 280, 280, 280);
INSERT INTO `exp_table` VALUES  (4, 200, 200, 200, 200, 200, 200, 300, 300, 300, 270, 250, 240, 240, 240, 240, 240, 240, 240, 240, 240);
INSERT INTO `exp_table` VALUES  (3, 160, 160, 160, 160, 160, 160, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200);
INSERT INTO `exp_table` VALUES  (2, 140, 140, 140, 140, 140, 140, 150, 150, 150, 150, 150, 160, 160, 160, 160, 160, 160, 160, 160, 160);
INSERT INTO `exp_table` VALUES  (1, 120, 120, 120, 120, 120, 120, 125, 125, 125, 125, 125, 130, 130, 130, 130, 130, 130, 130, 130, 130);
INSERT INTO `exp_table` VALUES  (0, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100);
INSERT INTO `exp_table` VALUES (-1, 72, 72, 72, 72, 72, 72, 72, 86, 86, 86, 86, 86, 86, 86, 93, 93, 93, 93, 93, 93);
INSERT INTO `exp_table` VALUES (-2, 50, 50, 50, 50, 50, 50, 61, 72, 72, 72, 72, 72, 72, 72, 86, 86, 86, 86, 86, 86);
INSERT INTO `exp_table` VALUES (-3, 40, 40, 45, 45, 46, 46, 50, 50, 61, 61, 61, 61, 61, 61, 72, 72, 72, 72, 72, 72);
INSERT INTO `exp_table` VALUES (-4, 30, 35, 40, 40, 41, 41, 46, 46, 50, 50, 56, 56, 57, 57, 61, 61, 61, 61, 61, 61);
INSERT INTO `exp_table` VALUES (-5, 25, 30, 35, 35, 37, 37, 41, 43, 46, 47, 50, 50, 53, 53, 57, 57, 57, 57, 57, 57);
INSERT INTO `exp_table` VALUES (-6, 20, 25, 30, 30, 33, 33, 37, 39, 43, 43, 47, 47, 50, 50, 53, 53, 53, 53, 53, 53);
INSERT INTO `exp_table` VALUES (-7, 0, 20, 25, 25, 29, 29, 33, 35, 39, 40, 43, 44, 47, 47, 50, 50, 50, 50, 50, 50);
INSERT INTO `exp_table` VALUES (-8, 0, 15, 20, 20, 24, 24, 29, 31, 35, 37, 40, 41, 44, 45, 47, 47, 47, 47, 47, 47);
INSERT INTO `exp_table` VALUES (-9, 0, 0, 15, 15, 20, 20, 24, 28, 31, 33, 37, 38, 41, 44, 45, 45, 45, 45, 45, 45);
INSERT INTO `exp_table` VALUES (-10, 0, 0, 0, 0, 15, 15, 20, 24, 28, 30, 33, 35, 38, 39, 42, 42, 42, 42, 42, 42);
INSERT INTO `exp_table` VALUES (-11, 0, 0, 0, 0, 0, 0, 15, 20, 24, 27, 30, 32, 35, 36, 39, 39, 39, 39, 39, 39);
INSERT INTO `exp_table` VALUES (-12, 0, 0, 0, 0, 0, 0, 0, 15, 20, 23, 27, 29, 32, 34, 36, 36, 36, 36, 36, 36);
INSERT INTO `exp_table` VALUES (-13, 0, 0, 0, 0, 0, 0, 0, 0, 15, 20, 23, 26, 29, 31, 34, 34, 34, 34, 34, 34);
INSERT INTO `exp_table` VALUES (-14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 20, 23, 26, 28, 31, 31, 31, 31, 31, 31);
INSERT INTO `exp_table` VALUES (-15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 20, 23, 25, 28, 28, 28, 28, 28, 28);
INSERT INTO `exp_table` VALUES (-16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 20, 23, 25, 25, 25, 25, 25, 25);
INSERT INTO `exp_table` VALUES (-17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 20, 23, 23, 23, 23, 23, 23);
INSERT INTO `exp_table` VALUES (-18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 20, 20, 20, 20, 20, 20);
INSERT INTO `exp_table` VALUES (-19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15);
INSERT INTO `exp_table` VALUES (-20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `exp_table` VALUES (-44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);