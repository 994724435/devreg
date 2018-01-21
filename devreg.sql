/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : devreg

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-01-21 22:26:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for p_article
-- ----------------------------
DROP TABLE IF EXISTS `p_article`;
CREATE TABLE `p_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relation_title` varchar(500) DEFAULT NULL COMMENT '关联ID',
  `title` varchar(1000) DEFAULT NULL,
  `type` int(11) DEFAULT '1' COMMENT '1首页 2公告 3值班团队 4分析专家 5公司简介',
  `cont` text,
  `addtime` varchar(128) DEFAULT NULL,
  `addymd` varchar(128) DEFAULT NULL,
  `admin` varchar(64) DEFAULT NULL,
  `num` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_article
-- ----------------------------
INSERT INTO `p_article` VALUES ('10', '2016年河南省超声医学学术年会1', '2017年河南省超声医学学术年会', '1', '阿斯达发生的发生的发生大幅沙发上的', '2018-01-21 22:20:50', '2018-01-21', 'admin', '1');

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
  `banpic` varchar(256) DEFAULT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_index
-- ----------------------------
INSERT INTO `p_index` VALUES ('1', '2016年河南省超声医学学术年会1', '0000-00-00 00:00:00', '2017年10月28日-10月29日1', '2017年09月10日1', '2017年10月25日1', '2017年10月27日1', '4441', '/Public/Uploads/2018-01-21/5a6492fe1c51c.jpg', '/Public/Uploads/2018-01-21/5a6492f0cbabc.jpg', '<span style=\"font-family:&quot;font-size:14.66px;line-height:22px;background-color:#FFFFFF;\"><span style=\"font-size:14px;line-height:2;\">&nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"font-size:14px;line-height:2;\">&nbsp;<strong>河南省</strong>医学会拟定于</span></span><span style=\"font-family:&quot;font-size:14px;line-height:2;background-color:#FFFFFF;\">10</span><span style=\"font-family:&quot;font-size:14px;line-height:2;background-color:#FFFFFF;\">月下旬在郑州市召开</span><span style=\"font-family:&quot;font-size:14px;line-height:2;background-color:#FFFFFF;\">2017</span><span style=\"font-family:&quot;font-size:14px;line-height:2;background-color:#FFFFFF;\">年河南省超声医学学术年会。届时会邀请省内超声医学专家就</span><span style=\"font-family:&quot;font-size:14px;line-height:22px;background-color:#FFFFFF;\"><span style=\"line-height:2;\">专题学术报告 , 主要内容有：</span><span style=\"line-height:2;\">专题学术报告及超声指南解读、优秀论文报告、</span><span style=\"font-family:宋体;font-size:11pt;\"><span style=\"font-family:&quot;font-size:14px;line-height:2;\">中青年论坛</span><span style=\"font-family:&quot;font-size:14px;line-height:2;\">--</span><span style=\"font-family:&quot;font-size:14px;line-height:2;\">浅表器官超声辩论赛、</span><span style=\"font-family:&quot;font-size:14px;line-height:2;\">误诊病例报告及分析、</span></span><span style=\"font-family:宋体;font-size:11pt;\"><span style=\"font-family:&quot;font-size:14px;line-height:2;\">妇产超声疑难病例竞猜—对抗赛、</span><span style=\"font-family:&quot;font-size:14px;line-height:2;\">PPT</span><span style=\"font-family:&quot;font-size:14px;line-height:2;\">制作专题讲座等多种方式学术交流。</span></span><span style=\"font-size:11pt;\"><span style=\"font-family:宋体;\"><span style=\"font-family:&quot;font-size:14px;line-height:2;\">此次会议被列入</span><span style=\"font-family:&quot;font-size:14px;line-height:2;\">2017</span><span style=\"font-family:&quot;font-size:14px;line-height:2;\">年国家继续医学教育项目（项目编号：</span><span style=\"font-family:&quot;font-size:14px;line-height:2;\">2017-09-02-144&nbsp;</span><span style=\"font-family:&quot;font-size:14px;line-height:2;\">），会后授予</span><span style=\"font-family:&quot;font-size:14px;line-height:2;\">国家级Ⅰ类学分</span><span style=\"font-family:&quot;font-size:14px;line-height:2;\">10</span><span style=\"font-family:&quot;font-size:14px;line-height:2;\">分，凡</span><span style=\"font-family:&quot;font-size:14px;line-height:2;\">不到会者不发学分证，会后不再补发。</span></span></span></span>', null, null, null, null, null, '<span style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\"><span style=\"font-size:11pt;\"><span style=\"font-family:宋体;\"><span style=\"font-family:&quot;font-size:14px;\"><strong><span style=\"line-height:2;\">大会秘书处</span></strong><br />\r\n<span style=\"line-height:2;\">河南省医学会</span></span><span style=\"font-family:&quot;font-size:14px;\"><span style=\"line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br />\r\n</span><span style=\"font-family:&quot;font-size:14px;line-height:2;\">李小龙</span><span><span style=\"font-family:&quot;font-size:14px;line-height:2;\">&nbsp;:&nbsp;</span><span style=\"font-family:&quot;font-size:14px;\"><span style=\"line-height:2;\">0371-85963308</span><br />\r\n<span style=\"line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style=\"font-family:&quot;font-size:14px;line-height:2;\">15824851311</span></span></span></span></span><span style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\"> \r\n<p>\r\n	<span style=\"font-family:宋体;\"><span style=\"font-size:11pt;\"><span style=\"font-family:&quot;font-size:14px;line-height:2;\">河南省人民医院</span><span style=\"font-family:&quot;font-size:14px;\"><span style=\"line-height:2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br />\r\n</span></span></span> \r\n</p>\r\n</span><span style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\"> \r\n<p>\r\n	<span style=\"font-family:宋体;\"><span style=\"font-size:11pt;\"><span style=\"font-family:&quot;font-size:14px;line-height:2;\">吴</span><span style=\"font-family:&quot;font-size:14px;line-height:2;\"><span style=\"line-height:2;\">&nbsp;&nbsp;</span></span><span style=\"font-family:&quot;font-size:14px;line-height:2;\">刚&nbsp; :&nbsp;</span><span><span style=\"font-family:&quot;font-size:14px;line-height:2;\">18538298205&nbsp;</span><span style=\"font-family:&quot;font-size:14px;line-height:2;\">&nbsp;&nbsp;</span></span></span></span> \r\n</p>\r\n</span>', '2017-12-11 22:39:17');
INSERT INTO `p_index` VALUES ('2', '2017年河南省超声医学学术年会', '0000-00-00 00:00:00', '2017年10月28日-10月29日', '2017年09月10日', '2017年10月25日', '2017年10月27日', '河南省超声医学学术年会', null, '/devreg/Public/Uploads/2017-12-27/5a432d7e87266.jpg', null, null, null, null, null, null, null, '2017-12-11 22:40:58');
INSERT INTO `p_index` VALUES ('3', 'test', '0000-00-00 00:00:00', '2017年10月28日-10月29日', '2017年09月10日', '2017年10月25日', '2017年10月27日', '', null, null, null, null, null, null, null, null, null, '2017-12-27 13:30:47');
INSERT INTO `p_index` VALUES ('4', 'test1', '0000-00-00 00:00:00', '2017年10月28日-10月29日', '2017年09月10日', '2017年10月25日', '2017年10月27日', '', null, null, null, null, null, null, null, null, null, '2017-12-27 13:31:42');
INSERT INTO `p_index` VALUES ('5', 'test3', '0000-00-00 00:00:00', '2017年10月28日-10月29日', '2017年09月10日', '2017年10月25日', '2017年10月27日', '', '/Public/Uploads/2017-12-27/5a4331099a6f1.jpg', '', null, null, null, null, null, null, null, '2017-12-27 13:35:05');

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
