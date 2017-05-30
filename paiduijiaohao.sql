/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : paiduijiaohao

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-05-24 21:12:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_obj
-- ----------------------------
DROP TABLE IF EXISTS `t_obj`;
CREATE TABLE `t_obj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `ndate` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `fname` varchar(200) DEFAULT NULL,
  `clert` varchar(200) DEFAULT NULL,
  `tel` varchar(200) DEFAULT NULL,
  `yuanxi` varchar(200) DEFAULT NULL,
  `score` varchar(200) DEFAULT NULL,
  `course` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_obj
-- ----------------------------
INSERT INTO `t_obj` VALUES ('1', '测试类型1', '这里是业务类型的详细介绍', '2017-05-20 10:27:32', '1', null, null, null, null, null, null, null, null);
INSERT INTO `t_obj` VALUES ('2', '测试类型2', '这里是业务类型2的详细介绍', '2017-05-20 10:27:48', '1', null, null, null, null, null, null, null, null);
INSERT INTO `t_obj` VALUES ('3', '通用业务', '这里是描述', '2017-05-20 10:43:42', '1', null, null, null, null, null, null, null, null);
INSERT INTO `t_obj` VALUES ('4', '测试业务类型3', '这里是业务类型的详细说明', '2017-05-20 10:56:15', '1', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `passwd` varchar(50) DEFAULT NULL,
  `roletype` varchar(50) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `wechat` varchar(50) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `birth` varchar(20) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `sid` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `zhiwei` varchar(200) DEFAULT NULL,
  `otitle` varchar(200) DEFAULT NULL,
  `zhiban` varchar(500) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL,
  `zan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'admin', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_user` VALUES ('2', '业务1', null, '3', null, '15123385885', null, null, null, null, null, null, null, '主任', '测试类型1', '1', '1', '这里是柜员的说明', '1');
INSERT INTO `t_user` VALUES ('3', '业务2', null, '3', null, '15123385885', null, null, null, null, null, null, null, '经理', '测试类型1', '1', '1', '这里是简介', '2');
INSERT INTO `t_user` VALUES ('4', 'ideabobo', '111111', '2', null, '15123385885', null, null, null, null, null, null, '重庆璧山', null, null, null, null, null, null);
INSERT INTO `t_user` VALUES ('5', '业务3', null, '3', null, '15123385885', null, null, null, null, null, null, null, '主任', '测试类型2', '1', '2', '这里是柜员的介绍', null);
INSERT INTO `t_user` VALUES ('6', '王波', '123456', '2', '', '15123385885', '1231232', '', null, '', null, null, '重庆璧山', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for wct_bill
-- ----------------------------
DROP TABLE IF EXISTS `wct_bill`;
CREATE TABLE `wct_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gids` varchar(100) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `uid` varchar(100) DEFAULT NULL,
  `shop` varchar(100) DEFAULT NULL,
  `bill` varchar(2000) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `ndate` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `way` varchar(50) DEFAULT NULL,
  `gnames` varchar(500) DEFAULT NULL,
  `sid` varchar(10) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `statecn` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_bill
-- ----------------------------
INSERT INTO `wct_bill` VALUES ('1', null, null, 'ideabobo', '4', '测试类型1', null, null, '2017-05-20 10:49:34', null, null, null, null, null, null, null, null, '已叫号');
INSERT INTO `wct_bill` VALUES ('2', null, null, 'ideabobo', '4', '测试类型1', null, null, '2017-05-20 10:50:37', null, null, null, null, null, null, null, null, '已叫号');
INSERT INTO `wct_bill` VALUES ('3', null, null, 'ideabobo', '4', '测试类型1', null, null, '2017-05-20 10:50:41', null, null, null, null, null, null, null, null, '已叫号');
INSERT INTO `wct_bill` VALUES ('4', null, null, 'ideabobo', '4', '测试类型1', null, null, '2017-05-20 10:50:42', null, null, null, null, null, null, null, null, '已叫号');
INSERT INTO `wct_bill` VALUES ('5', null, null, 'ideabobo', '4', '测试类型1', null, null, '2017-05-20 10:50:44', null, null, null, null, null, null, null, null, '已叫号');
INSERT INTO `wct_bill` VALUES ('6', null, null, 'ideabobo', '4', '测试类型1', null, null, '2017-05-20 10:50:46', null, null, null, null, null, null, null, null, '已叫号');
INSERT INTO `wct_bill` VALUES ('7', null, null, '王波', '6', '测试类型1', null, null, '2017-05-20 11:03:35', null, null, null, null, null, null, '办手机卡', null, '已叫号');
INSERT INTO `wct_bill` VALUES ('8', null, null, '游客', 'ed1a6a3d-77a8-4bde-97a7-fc1d3d19fcf7', '测试类型2', null, null, '2017-05-23 19:39:28', null, null, null, null, null, null, '说明', null, '未叫号');
INSERT INTO `wct_bill` VALUES ('9', null, null, '游客', '0dc9a8ac-9b28-4c5b-a7ab-a1de5ccc2852', '测试类型1', null, null, '2017-05-23 19:43:33', null, null, null, null, null, null, '说明', null, '未叫号');
INSERT INTO `wct_bill` VALUES ('10', null, null, '游客', 'bd7480cd-6372-4621-9091-7966ab78ada2', '测试类型2', null, null, '2017-05-23 19:44:02', null, null, null, null, null, null, '123123', null, '未叫号');
INSERT INTO `wct_bill` VALUES ('11', null, null, '游客', '3ccb0af9-5838-4d91-b4a1-139af0acdf2b', '测试类型1', null, null, '2017-05-23 19:53:14', null, null, null, null, null, null, '说明', null, '未叫号');
INSERT INTO `wct_bill` VALUES ('12', null, null, '游客', '30dfcec5-2b74-4b15-a506-bc9dea126f72', '测试类型1', null, null, '2017-05-23 20:25:50', null, null, null, null, null, null, '呵呵', null, '已叫号');

-- ----------------------------
-- Table structure for wct_line
-- ----------------------------
DROP TABLE IF EXISTS `wct_line`;
CREATE TABLE `wct_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_line
-- ----------------------------
INSERT INTO `wct_line` VALUES ('1', '9', '0dc9a8ac-9b28-4c5b-a7ab-a1de5ccc2852');
INSERT INTO `wct_line` VALUES ('2', '10', 'bd7480cd-6372-4621-9091-7966ab78ada2');
INSERT INTO `wct_line` VALUES ('3', '11', '3ccb0af9-5838-4d91-b4a1-139af0acdf2b');

-- ----------------------------
-- Table structure for wct_posts
-- ----------------------------
DROP TABLE IF EXISTS `wct_posts`;
CREATE TABLE `wct_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `uid` varchar(10) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `ndate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_posts
-- ----------------------------

-- ----------------------------
-- Table structure for wct_replay
-- ----------------------------
DROP TABLE IF EXISTS `wct_replay`;
CREATE TABLE `wct_replay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(10) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `uid` varchar(10) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `ndate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_replay
-- ----------------------------

-- ----------------------------
-- Table structure for wct_shop
-- ----------------------------
DROP TABLE IF EXISTS `wct_shop`;
CREATE TABLE `wct_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(100) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `ownid` varchar(10) DEFAULT NULL,
  `passwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_shop
-- ----------------------------
