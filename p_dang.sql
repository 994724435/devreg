/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : devreg

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-04-18 21:56:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for p_dang
-- ----------------------------
DROP TABLE IF EXISTS `p_dang`;
CREATE TABLE `p_dang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `id_card` varchar(50) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `mingzu` varchar(64) DEFAULT NULL,
  `jiguan` varchar(64) DEFAULT NULL,
  `tel` varchar(32) DEFAULT NULL,
  `zuzhi` varchar(300) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `zhuan_date` date DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `edu` varchar(255) DEFAULT NULL,
  `sf` varchar(20) DEFAULT '正式党员',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_dang
-- ----------------------------
INSERT INTO `p_dang` VALUES ('1', '李海龙', '123456789012345678', '男', '12', '12', '18883287644', 'asd', '2018-04-18', '2018-04-18', '12', '123', null);
