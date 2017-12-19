/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : devreg

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-12-19 22:58:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for p_article
-- ----------------------------
DROP TABLE IF EXISTS `p_article`;
CREATE TABLE `p_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relation_id` int(11) DEFAULT NULL COMMENT '关联ID',
  `title` varchar(1000) DEFAULT NULL,
  `type` int(11) DEFAULT '1' COMMENT '1首页 2公告 3值班团队 4分析专家 5公司简介',
  `cont` text,
  `addtime` varchar(128) DEFAULT NULL,
  `addymd` varchar(128) DEFAULT NULL,
  `admin` varchar(64) DEFAULT NULL,
  `num` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_article
-- ----------------------------

-- ----------------------------
-- Table structure for p_index
-- ----------------------------
DROP TABLE IF EXISTS `p_index`;
CREATE TABLE `p_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) DEFAULT NULL COMMENT '标题',
  `endtime` datetime DEFAULT NULL COMMENT '结束时间',
  `meetdate` varchar(64) DEFAULT NULL COMMENT '会议日期',
  `tougaodate` varchar(64) DEFAULT NULL COMMENT '征文投稿截止日期',
  `regdate` varchar(64) DEFAULT NULL COMMENT '网上注册截止日期',
  `spotdate` varchar(64) DEFAULT NULL COMMENT '现场报到日期',
  `weixin` varchar(128) DEFAULT NULL,
  `wxpic` varchar(256) DEFAULT NULL,
  `meetintro` text COMMENT '会议简介',
  `meetbase` text COMMENT '基本信息',
  `tougao` text COMMENT '征文投稿',
  `content` text COMMENT '会议内容',
  `reg` text COMMENT '参会注册',
  `hotel` text COMMENT '酒店交通',
  `contact` text COMMENT '联系我们',
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_index
-- ----------------------------
INSERT INTO `p_index` VALUES ('1', '2016年河南省超声医学学术年会', '2017-12-07 00:00:00', '2017年10月28日-10月29日', '2017年09月10日', '2017年10月25日', '2017年10月27日', '444', null, null, null, null, null, null, null, null, '2017-12-11 22:39:17');
INSERT INTO `p_index` VALUES ('2', '2017年河南省超声医学学术年会', '2017-12-01 00:00:00', '2017年10月28日-10月29日', '2017年09月10日', '2017年10月25日', '2017年10月27日', '河南省超声医学学术年会', '/Public/Uploads/2017-12-11/5a2e98fa0761f.png', null, null, null, null, null, null, null, '2017-12-11 22:40:58');

-- ----------------------------
-- Table structure for p_login
-- ----------------------------
DROP TABLE IF EXISTS `p_login`;
CREATE TABLE `p_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pwd` text CHARACTER SET utf8,
  `addymd` date DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `ip` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of p_login
-- ----------------------------
INSERT INTO `p_login` VALUES ('1', 'admin', '123asd', '2017-09-16', '1505552484', null);
INSERT INTO `p_login` VALUES ('2', 'admin', '123asd', '2017-09-16', '1505552539', '127.0.0.1');

-- ----------------------------
-- Table structure for p_menber
-- ----------------------------
DROP TABLE IF EXISTS `p_menber`;
CREATE TABLE `p_menber` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `pwd` varchar(100) DEFAULT NULL,
  `tel` varchar(64) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `type` int(4) DEFAULT '1' COMMENT '1普通 2 3 4',
  `userface` varchar(255) DEFAULT NULL,
  `sex` int(1) DEFAULT '1' COMMENT '1男 2女',
  `biryear` varchar(10) DEFAULT NULL,
  `birmonth` varchar(10) DEFAULT NULL,
  `birday` varchar(10) DEFAULT NULL,
  `degreey` int(2) DEFAULT NULL,
  `sheng` varchar(10) DEFAULT NULL,
  `shi` varchar(10) DEFAULT NULL,
  `cert` varchar(64) DEFAULT NULL,
  `job` varchar(64) DEFAULT NULL,
  `zhiwu` varchar(64) DEFAULT NULL,
  `addr` varchar(300) DEFAULT NULL,
  `youbian` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_menber
-- ----------------------------
INSERT INTO `p_menber` VALUES ('1', '100', '1', '100', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `p_menber` VALUES ('2', '101', '1', '101', null, '1', null, '0', '2017-08-16', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `p_menber` VALUES ('34', '102', '1', '102', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `p_menber` VALUES ('35', '103', '1', '103', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `p_menber` VALUES ('36', '104', '1', '104', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `p_menber` VALUES ('37', '105', '1', '105', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `p_menber` VALUES ('38', '18883287644', '1', '18883287644', null, '1', null, '0', '2017-11-27', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for p_message
-- ----------------------------
DROP TABLE IF EXISTS `p_message`;
CREATE TABLE `p_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `cont` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `tel` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `time` int(12) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `state` int(1) DEFAULT '1' COMMENT '1有效  2 无效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of p_message
-- ----------------------------
INSERT INTO `p_message` VALUES ('11', 'af814b00d0a1a723cfd2773f998c85c3', '7056', '188832876441', null, '1502616589', '2017-08-13', '1');
INSERT INTO `p_message` VALUES ('12', '6d5975dfcd0b523497d7e09fcbb01003', '2876', '15538867970', null, '1502616778', '2017-08-13', '1');
INSERT INTO `p_message` VALUES ('13', '30cdaa5bc1b5618d7e824e7fbae56b57', '1936', '18883287644', null, '1511792183', '2017-11-27', '1');

-- ----------------------------
-- Table structure for p_orderlog
-- ----------------------------
DROP TABLE IF EXISTS `p_orderlog`;
CREATE TABLE `p_orderlog` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL COMMENT '用户id',
  `productid` int(11) NOT NULL,
  `productname` varchar(64) DEFAULT NULL,
  `productmoney` varchar(32) DEFAULT NULL COMMENT '产品带来的利润',
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '0待支付 1收益中 2已完成',
  `orderid` varchar(128) NOT NULL COMMENT '订单id',
  `addtime` int(12) DEFAULT NULL,
  `num` int(5) DEFAULT NULL COMMENT '购买数量',
  `price` varchar(40) DEFAULT NULL COMMENT '购买单价',
  `totals` varchar(40) DEFAULT NULL,
  `addymd` date DEFAULT NULL,
  `type` int(2) DEFAULT '1' COMMENT '1买地  2 1000买幼崽 3 成年5000 4母牦牛10000  10买商城物品',
  `option` varchar(1000) DEFAULT NULL COMMENT '其他说明',
  PRIMARY KEY (`logid`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_orderlog
-- ----------------------------
INSERT INTO `p_orderlog` VALUES ('85', '2', '1', '地', '101', '1', '1511789707', '1511789707', '1', '100', '100', '2017-11-27', '1', '');
INSERT INTO `p_orderlog` VALUES ('86', '1', '1', '地', '100', '1', '1511870953', '1511870953', '1', '100', '100', '2017-11-28', '1', '');
INSERT INTO `p_orderlog` VALUES ('87', '1', '2', '幼崽牦牛', '100', '1', '1511871216', '1511871216', '1', '1000', '1000', '2017-11-28', '2', '');

-- ----------------------------
-- Table structure for p_product
-- ----------------------------
DROP TABLE IF EXISTS `p_product`;
CREATE TABLE `p_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '产品名',
  `cont` text COMMENT '产品描述',
  `pic` varchar(255) DEFAULT NULL COMMENT '产品图片',
  `price` varchar(100) DEFAULT NULL COMMENT '售卖价格',
  `effectdays` varchar(30) DEFAULT NULL COMMENT '理财有效天数',
  `daycome` varchar(100) DEFAULT NULL COMMENT '理财每日收益',
  `daynum` int(11) DEFAULT NULL COMMENT '每日发放数量',
  `one` varchar(50) DEFAULT NULL COMMENT '一代每日返利',
  `two` varchar(50) DEFAULT NULL,
  `state` int(3) DEFAULT '1' COMMENT '1上架  2下架',
  `addtime` varchar(100) DEFAULT NULL,
  `salenum` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_product
-- ----------------------------
INSERT INTO `p_product` VALUES ('2', '钱付贰号', '钱付贰号，每日收益投资本金1%,连本带利4500元出局，银卡享受一代会员日收益0.8%，直到享受完一代会员投资金额100%，享受二代会员日收益0.6%，直到享受完二代会员投资金额50%。', '/register/Public/Uploads/2017-03-31/58ddce2af1148.png', '100', '15', '12', '100', '1', '1', '1', '2017-03-31 22:35:41', '0');
INSERT INTO `p_product` VALUES ('3', '钱付叁号', '钱付叁号，每日收益投资本金1.2%,连本带利4500元出局，金卡享受一代会员日收益0.9%，直到享受完一代会员投资金额100%，享受二代会员日收益0.7%，直到享受完二代会员投资金额50%。', '/register/Public/Uploads/2017-03-31/58ddce371bfd2.png', '200', '36', '24', '100', '1', '1', '1', '2017-03-31 22:35:54', '0');

-- ----------------------------
-- Table structure for p_user
-- ----------------------------
DROP TABLE IF EXISTS `p_user`;
CREATE TABLE `p_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '登录名',
  `openid` varchar(255) DEFAULT NULL COMMENT '微信ID',
  `nickname` varchar(255) DEFAULT NULL COMMENT '微信昵称',
  `address` varchar(255) DEFAULT NULL COMMENT '微信地址',
  `userface` varchar(255) DEFAULT NULL COMMENT '维信头像',
  `addtime` varchar(255) DEFAULT NULL COMMENT '注册时间',
  `manager` int(2) DEFAULT '1' COMMENT '0 禁用账号 1管理员 2 超级管理员',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_user
-- ----------------------------
INSERT INTO `p_user` VALUES ('1', '123asd', 'admin', null, null, null, null, '2017-03-10 13:56:27', '2');
INSERT INTO `p_user` VALUES ('2', '123456', 'admin2', null, null, null, null, '2017-03-10 13:56:27', '2');
