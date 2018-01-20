/*
Navicat MySQL Data Transfer

Source Server         : 192.168.202.124_智慧教育1.0开发库
Source Server Version : 50635
Source Host           : 192.168.202.124:3306
Source Database       : shijian666

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2017-09-30 17:36:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bao_activity`
-- ----------------------------
DROP TABLE IF EXISTS `bao_activity`;
CREATE TABLE `bao_activity` (
  `activity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(10) DEFAULT '0',
  `shop_id` int(10) DEFAULT NULL,
  `tuan_id` int(11) DEFAULT '0',
  `city_id` smallint(5) unsigned DEFAULT '0',
  `area_id` smallint(5) unsigned DEFAULT '0',
  `business_id` smallint(5) unsigned DEFAULT '0',
  `title` varchar(128) DEFAULT NULL,
  `intro` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `thumb` text,
  `details` text,
  `price` decimal(32,0) DEFAULT NULL,
  `bg_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `time` varchar(64) DEFAULT NULL,
  `sign_end` date DEFAULT NULL,
  `addr` varchar(1024) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT NULL,
  `audit` tinyint(2) DEFAULT '0',
  `closed` tinyint(2) DEFAULT '0',
  `sign_num` int(10) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  `template` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_activity
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_activity_cate`
-- ----------------------------
DROP TABLE IF EXISTS `bao_activity_cate`;
CREATE TABLE `bao_activity_cate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` tinyint(3) DEFAULT '0',
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_activity_cate
-- ----------------------------
INSERT INTO `bao_activity_cate` VALUES ('16', '亲子活动', '0', '6');

-- ----------------------------
-- Table structure for `bao_activity_sign`
-- ----------------------------
DROP TABLE IF EXISTS `bao_activity_sign`;
CREATE TABLE `bao_activity_sign` (
  `sign_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `num` int(5) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`sign_id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_activity_sign
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_ad`
-- ----------------------------
DROP TABLE IF EXISTS `bao_ad`;
CREATE TABLE `bao_ad` (
  `ad_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` smallint(6) DEFAULT '0',
  `city_id` smallint(5) unsigned DEFAULT '0',
  `title` varchar(64) DEFAULT NULL,
  `link_url` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `code` varchar(1024) DEFAULT NULL,
  `bg_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`ad_id`)
) ENGINE=MyISAM AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_ad
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_admin`
-- ----------------------------
DROP TABLE IF EXISTS `bao_admin`;
CREATE TABLE `bao_admin` (
  `admin_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  `role_id` smallint(5) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `last_time` int(11) DEFAULT NULL,
  `last_ip` varchar(20) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_admin
-- ----------------------------
INSERT INTO `bao_admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1', '15589022301', '1441886203', '127.0.0.1', '1506651591', '192.168.11.1', '0');
INSERT INTO `bao_admin` VALUES ('2', 'huo0319', 'afdd0b4ad2ec172c586e2150770fbf9e', '2', '15849921313', '1445578332', '1.25.192.166', null, null, '1');
INSERT INTO `bao_admin` VALUES ('3', '111', '96e79218965eb72c92a549dd5a330112', '2', '15555555511', '1470042533', '112.234.101.6', '1471241057', '140.224.62.130', '0');

-- ----------------------------
-- Table structure for `bao_ad_site`
-- ----------------------------
DROP TABLE IF EXISTS `bao_ad_site`;
CREATE TABLE `bao_ad_site` (
  `site_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(32) DEFAULT NULL,
  `site_name` varchar(64) DEFAULT NULL,
  `site_type` tinyint(1) DEFAULT NULL,
  `site_place` smallint(5) DEFAULT '0',
  PRIMARY KEY (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_ad_site
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_area`
-- ----------------------------
DROP TABLE IF EXISTS `bao_area`;
CREATE TABLE `bao_area` (
  `area_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` smallint(5) DEFAULT '0',
  `area_name` varchar(32) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`area_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_area
-- ----------------------------
INSERT INTO `bao_area` VALUES ('24', '8', '望城区', '1');

-- ----------------------------
-- Table structure for `bao_around`
-- ----------------------------
DROP TABLE IF EXISTS `bao_around`;
CREATE TABLE `bao_around` (
  `around_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '1代表常去，2代表我家，3代表公司',
  `name` varchar(128) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`around_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_around
-- ----------------------------
INSERT INTO `bao_around` VALUES ('1', '101', '2', '安徽省合肥市庐阳区吴山巷13号', '117.298904', '31.875651');
INSERT INTO `bao_around` VALUES ('2', '101', '3', '安徽省合肥市庐阳区阜南路51号', '117.292077', '31.875467');
INSERT INTO `bao_around` VALUES ('3', '101', '1', '安徽省合肥市瑶海区银屏路', '117.305587', '31.877491');
INSERT INTO `bao_around` VALUES ('4', '1', '2', '安徽省合肥市庐阳区淮河路291号', '117.290927', '31.871296');
INSERT INTO `bao_around` VALUES ('5', '1', '3', '安徽省合肥市庐阳区寿春路170号', '117.293083', '31.873443');
INSERT INTO `bao_around` VALUES ('6', '1', '1', '安徽省合肥市庐阳区吴山巷13号', '117.298904', '31.875651');
INSERT INTO `bao_around` VALUES ('7', '35', '2', '安徽省合肥市庐阳区淮河路377号', '117.286112', '31.872155');
INSERT INTO `bao_around` VALUES ('8', '125', '2', '安徽省合肥市庐阳区宿州路68号', '117.29567', '31.868537');
INSERT INTO `bao_around` VALUES ('9', '148', '1', '地址：重庆市黔江区行署街', '108.775235', '29.538243');
INSERT INTO `bao_around` VALUES ('10', '194', '3', '地址：地铁13号线; 地铁8号线', '116.566705', '40.155183');

-- ----------------------------
-- Table structure for `bao_article`
-- ----------------------------
DROP TABLE IF EXISTS `bao_article`;
CREATE TABLE `bao_article` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `cate_id` smallint(5) DEFAULT '0',
  `source` varchar(32) DEFAULT NULL,
  `keywords` varchar(256) DEFAULT NULL,
  `desc` varchar(256) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `details` text,
  `istop` int(2) NOT NULL DEFAULT '0',
  `isroll` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `zan` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_article
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_article_cate`
-- ----------------------------
DROP TABLE IF EXISTS `bao_article_cate`;
CREATE TABLE `bao_article_cate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_article_cate
-- ----------------------------
INSERT INTO `bao_article_cate` VALUES ('10', '旅游', '0', '4');
INSERT INTO `bao_article_cate` VALUES ('12', '自驾游', '10', '2');

-- ----------------------------
-- Table structure for `bao_article_comment`
-- ----------------------------
DROP TABLE IF EXISTS `bao_article_comment`;
CREATE TABLE `bao_article_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级评论id,若是一级评论则为0',
  `nickname` varchar(100) DEFAULT NULL COMMENT '评论人昵称',
  `user_id` int(11) DEFAULT NULL COMMENT '评论人UID',
  `post_id` int(11) DEFAULT NULL COMMENT '新闻编号',
  `content` text COMMENT '评论内容',
  `zan` int(6) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT NULL COMMENT '评论或回复发表时间',
  `create_ip` varchar(20) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_article_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_award`
-- ----------------------------
DROP TABLE IF EXISTS `bao_award`;
CREATE TABLE `bao_award` (
  `award_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `type` enum('shark','scratch','lottery') DEFAULT NULL COMMENT '摇一摇 刮刮卡  抽奖大转盘',
  `explain` varchar(1024) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `is_online` tinyint(1) DEFAULT '0' COMMENT '1就是在线状态了',
  PRIMARY KEY (`award_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_award
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_award_goods`
-- ----------------------------
DROP TABLE IF EXISTS `bao_award_goods`;
CREATE TABLE `bao_award_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `award_id` int(11) DEFAULT NULL,
  `award_name` varchar(32) DEFAULT NULL,
  `goods_name` varchar(64) DEFAULT NULL,
  `prob` int(11) DEFAULT '0' COMMENT '数值越大概率越低',
  `num` int(11) DEFAULT '0',
  `surplus` int(11) DEFAULT '0',
  PRIMARY KEY (`goods_id`),
  KEY `award_id` (`award_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_award_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_award_share`
-- ----------------------------
DROP TABLE IF EXISTS `bao_award_share`;
CREATE TABLE `bao_award_share` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `award_id` int(11) DEFAULT NULL,
  `is_used` tinyint(4) DEFAULT '0' COMMENT '1代表抽过奖了',
  `ip` varchar(15) DEFAULT NULL,
  `num` int(11) DEFAULT '0' COMMENT '点击的数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`,`award_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_award_share
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_award_winning`
-- ----------------------------
DROP TABLE IF EXISTS `bao_award_winning`;
CREATE TABLE `bao_award_winning` (
  `winning_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `award_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `goods_id` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `randstr` varchar(6) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`winning_id`),
  KEY `award_id` (`award_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_award_winning
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_billboard`
-- ----------------------------
DROP TABLE IF EXISTS `bao_billboard`;
CREATE TABLE `bao_billboard` (
  `list_id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `intro` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `cate_id` int(10) DEFAULT NULL,
  `looknum` int(11) DEFAULT '0',
  `orderby` int(10) DEFAULT '100',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `is_hot` tinyint(1) DEFAULT '0',
  `is_new` tinyint(1) DEFAULT NULL,
  `is_chose` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`list_id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_billboard
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_bill_cate`
-- ----------------------------
DROP TABLE IF EXISTS `bao_bill_cate`;
CREATE TABLE `bao_bill_cate` (
  `cate_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(128) DEFAULT '0',
  `orderby` tinyint(3) DEFAULT '100',
  `photo` varchar(128) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_bill_cate
-- ----------------------------
INSERT INTO `bao_bill_cate` VALUES ('10', '旅游', '100', '2015/04/24/thumb_5539ab0897a6d.png', '0');

-- ----------------------------
-- Table structure for `bao_bill_order`
-- ----------------------------
DROP TABLE IF EXISTS `bao_bill_order`;
CREATE TABLE `bao_bill_order` (
  `bill_order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `city_id` smallint(5) unsigned DEFAULT '0',
  `area_id` smallint(5) unsigned DEFAULT '0',
  `mobile` varchar(11) DEFAULT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `sum` int(10) unsigned DEFAULT '0',
  `money` int(10) unsigned DEFAULT '0',
  `interest` decimal(15,2) unsigned DEFAULT '0.00',
  `create_time` int(11) unsigned DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  `status` tinyint(3) unsigned DEFAULT '0' COMMENT '0等待处理  1代表已成功  2代表已退款',
  `admin_id` int(11) unsigned DEFAULT '0',
  `admin_time` int(11) unsigned DEFAULT '0',
  `admin_memo` varchar(255) DEFAULT NULL,
  `bill_type_id` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bill_order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_bill_order
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_bill_shop`
-- ----------------------------
DROP TABLE IF EXISTS `bao_bill_shop`;
CREATE TABLE `bao_bill_shop` (
  `bill_id` int(10) NOT NULL AUTO_INCREMENT,
  `list_id` int(10) DEFAULT NULL,
  `shop_id` int(10) DEFAULT NULL,
  `reason` varchar(128) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `votenum` int(11) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_bill_shop
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_bill_type`
-- ----------------------------
DROP TABLE IF EXISTS `bao_bill_type`;
CREATE TABLE `bao_bill_type` (
  `bill_type_id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `bill_type_name` varchar(20) DEFAULT NULL,
  `bill_fields` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sms_notify` tinyint(1) DEFAULT NULL,
  `fee_rate` decimal(10,2) unsigned DEFAULT '0.00',
  `integral` int(11) unsigned DEFAULT '0',
  `bill_fields_label` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `areas` text,
  PRIMARY KEY (`bill_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_bill_type
-- ----------------------------
INSERT INTO `bao_bill_type` VALUES ('1', '手机固话', 'realname,mobile', '1', '1', '0.00', '1', '手机户主,手机号,', '目前开通全国代收手机费、山西固话费', '25,26,27,28,29,12,13,14,15,16,17,18,19,20,21,22,23,24,36,37,38,39,40,41,42,43,44,45,30,31,32,33,34,35,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130');
INSERT INTO `bao_bill_type` VALUES ('2', '电费', 'realname,account', '1', '1', '0.00', '1', '户主姓名,用户编号,', '目前开通长治、晋中、运城、忻州的代收电费业务', '12,13,14,15,16,17,18,19,20,21,22,23,24,46,47,48,49,50,51,52,53,54,55,56,70,71,72,73,74,75,76,77,78,79,80,81,82,111,112,113,114,115,116,117,118,119,120,121,122,123,124');
INSERT INTO `bao_bill_type` VALUES ('3', '交警罚款', 'realname,account', '1', '0', '0.00', '1', '车牌号码,,处罚决定书编号', '请认真核对您处罚决定书编号，对照填写。', '12,13,14,15,16,17,18,19,20,21,22,23,24');
INSERT INTO `bao_bill_type` VALUES ('4', '待开发', 'realname,account', '1', '0', '0.00', '1', null, null, null);
INSERT INTO `bao_bill_type` VALUES ('5', '水费', 'realname,mobile,account', '1', '1', '2.00', '0', '姓名,手机号,水费编号', '水费测试', '1,2,3,4,5,6,7,8,9,10,12,11,13,14,15,16,17,18');

-- ----------------------------
-- Table structure for `bao_bill_vote`
-- ----------------------------
DROP TABLE IF EXISTS `bao_bill_vote`;
CREATE TABLE `bao_bill_vote` (
  `vote_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `bill_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_bill_vote
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_business`
-- ----------------------------
DROP TABLE IF EXISTS `bao_business`;
CREATE TABLE `bao_business` (
  `business_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `business_name` varchar(32) DEFAULT NULL,
  `area_id` smallint(5) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `is_hot` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`business_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_business
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_city`
-- ----------------------------
DROP TABLE IF EXISTS `bao_city`;
CREATE TABLE `bao_city` (
  `city_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `pinyin` varchar(32) DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT '0',
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `first_letter` char(1) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_city
-- ----------------------------
INSERT INTO `bao_city` VALUES ('8', '长沙', 'changsha', '1', '112.9455', '28.235', '99', 'C');

-- ----------------------------
-- Table structure for `bao_community`
-- ----------------------------
DROP TABLE IF EXISTS `bao_community`;
CREATE TABLE `bao_community` (
  `community_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '物业管理员',
  `city_id` smallint(5) DEFAULT NULL,
  `area_id` smallint(5) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `addr` varchar(128) DEFAULT NULL,
  `tel` varchar(20) NOT NULL,
  `pic` varchar(64) NOT NULL,
  `property` varchar(128) DEFAULT NULL COMMENT '物业',
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `orderby` tinyint(4) DEFAULT '100',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`community_id`),
  KEY `city_id` (`city_id`,`area_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='小区表';

-- ----------------------------
-- Records of bao_community
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_community_news`
-- ----------------------------
DROP TABLE IF EXISTS `bao_community_news`;
CREATE TABLE `bao_community_news` (
  `news_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `community_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `intro` varchar(1024) DEFAULT NULL,
  `details` text,
  `views` int(11) DEFAULT '0',
  `audit` tinyint(1) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_community_news
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_community_posts`
-- ----------------------------
DROP TABLE IF EXISTS `bao_community_posts`;
CREATE TABLE `bao_community_posts` (
  `post_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `username` varchar(80) NOT NULL,
  `community_id` int(10) NOT NULL,
  `title` varchar(200) NOT NULL,
  `details` text NOT NULL,
  `views` int(11) DEFAULT '0',
  `audit` tinyint(11) DEFAULT '0',
  `gallery` varchar(500) NOT NULL,
  `view_num` int(10) NOT NULL DEFAULT '0',
  `reply_num` int(10) NOT NULL DEFAULT '0',
  `zan_num` int(10) NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL,
  `create_ip` varchar(30) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_community_posts
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_community_replys`
-- ----------------------------
DROP TABLE IF EXISTS `bao_community_replys`;
CREATE TABLE `bao_community_replys` (
  `reply_id` int(10) NOT NULL AUTO_INCREMENT,
  `community_id` int(10) NOT NULL,
  `post_id` int(10) NOT NULL DEFAULT '0',
  `parent_id` int(10) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `gallery` varchar(500) NOT NULL,
  `create_time` int(10) NOT NULL,
  `create_ip` varchar(20) NOT NULL,
  PRIMARY KEY (`reply_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_community_replys
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_community_users`
-- ----------------------------
DROP TABLE IF EXISTS `bao_community_users`;
CREATE TABLE `bao_community_users` (
  `join_id` int(10) NOT NULL AUTO_INCREMENT,
  `community_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`join_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_community_users
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_connect`
-- ----------------------------
DROP TABLE IF EXISTS `bao_connect`;
CREATE TABLE `bao_connect` (
  `connect_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('weibo','test','weixin','qq') DEFAULT 'qq' COMMENT 'test 作为调试的时候使用！以免不懂得用户误会小弟啊',
  `open_id` varchar(32) DEFAULT NULL,
  `token` varchar(512) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`connect_id`),
  UNIQUE KEY `type` (`type`,`open_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_connect
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_convenient_phone`
-- ----------------------------
DROP TABLE IF EXISTS `bao_convenient_phone`;
CREATE TABLE `bao_convenient_phone` (
  `phone_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `orderby` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`phone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_convenient_phone
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_convenient_phone_maps`
-- ----------------------------
DROP TABLE IF EXISTS `bao_convenient_phone_maps`;
CREATE TABLE `bao_convenient_phone_maps` (
  `phone_id` int(11) DEFAULT NULL,
  `community_id` smallint(6) DEFAULT NULL,
  UNIQUE KEY `phone_id` (`phone_id`,`community_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_convenient_phone_maps
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_convenient_phone_villages`
-- ----------------------------
DROP TABLE IF EXISTS `bao_convenient_phone_villages`;
CREATE TABLE `bao_convenient_phone_villages` (
  `phone_id` int(11) DEFAULT NULL,
  `village_id` smallint(6) DEFAULT NULL,
  UNIQUE KEY `phone_id` (`phone_id`,`village_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_convenient_phone_villages
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `bao_coupon`;
CREATE TABLE `bao_coupon` (
  `coupon_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `cate_id` smallint(6) DEFAULT NULL,
  `city_id` smallint(6) DEFAULT '0',
  `area_id` smallint(6) DEFAULT '0',
  `business_id` smallint(6) DEFAULT '0',
  `title` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `downloads` int(11) DEFAULT '0',
  `intro` varchar(1024) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0',
  `num` int(11) DEFAULT '9999999',
  `limit_num` tinyint(3) DEFAULT '0' COMMENT '0代表不限制',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`coupon_id`),
  KEY `cate_id` (`cate_id`,`area_id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_coupon_download`
-- ----------------------------
DROP TABLE IF EXISTS `bao_coupon_download`;
CREATE TABLE `bao_coupon_download` (
  `download_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `mobile` char(11) DEFAULT NULL,
  `code` char(8) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `is_used` tinyint(1) DEFAULT '0',
  `used_time` int(11) DEFAULT NULL,
  `used_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`download_id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_coupon_download
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_delivery`
-- ----------------------------
DROP TABLE IF EXISTS `bao_delivery`;
CREATE TABLE `bao_delivery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_delivery
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_delivery_order`
-- ----------------------------
DROP TABLE IF EXISTS `bao_delivery_order`;
CREATE TABLE `bao_delivery_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '0是商城，1是外卖，2是快件',
  `type_order_id` int(10) unsigned NOT NULL COMMENT '关联的分类中的订单编号',
  `delivery_id` int(10) unsigned NOT NULL COMMENT '配送员ID',
  `shop_id` int(10) unsigned NOT NULL,
  `city_id` int(10) NOT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `shop_name` varchar(64) NOT NULL DEFAULT '',
  `shop_addr` varchar(64) NOT NULL DEFAULT '',
  `shop_mobile` varchar(64) DEFAULT '',
  `user_name` varchar(64) NOT NULL DEFAULT '',
  `user_addr` varchar(64) NOT NULL DEFAULT '',
  `user_mobile` varchar(11) DEFAULT '',
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '接单时间',
  `end_time` int(10) DEFAULT '0' COMMENT '完成时间 ',
  `status` tinyint(1) unsigned NOT NULL COMMENT '0是货到付款，1是已付款，2是配送中，8是已完成。',
  `closed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_delivery_order
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_ele`
-- ----------------------------
DROP TABLE IF EXISTS `bao_ele`;
CREATE TABLE `bao_ele` (
  `shop_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(64) DEFAULT NULL COMMENT '冗余方便查询',
  `city_id` smallint(5) unsigned DEFAULT NULL,
  `area_id` smallint(5) DEFAULT '0',
  `business_id` smallint(5) DEFAULT '0',
  `cate` varchar(64) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT '0' COMMENT '1 代表营业中',
  `is_pay` tinyint(1) DEFAULT '0' COMMENT '1代表支持在线付款',
  `is_fan` tinyint(1) DEFAULT '0' COMMENT '1 代表返现',
  `fan_money` int(10) DEFAULT NULL,
  `is_new` tinyint(1) DEFAULT NULL,
  `full_money` int(10) DEFAULT '0' COMMENT '满多少MONEY 立刻减几元',
  `new_money` int(10) DEFAULT '0' COMMENT '减多少钱  比如说 满20减5元 那么  每增加10块钱 将额外减一元',
  `logistics` int(10) DEFAULT '0' COMMENT '0代表不收取配送费 填写其他的将代表收取',
  `since_money` int(10) DEFAULT NULL COMMENT '起送价',
  `sold_num` int(10) DEFAULT NULL,
  `month_num` int(10) DEFAULT NULL,
  `intro` varchar(1024) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100' COMMENT '数字越小排序越高',
  `distribution` tinyint(3) DEFAULT '30' COMMENT '分钟  配送时间',
  `audit` tinyint(3) unsigned DEFAULT '0' COMMENT '0审核中1成功入驻2未通过',
  `rate` int(11) DEFAULT '60' COMMENT '费率 每个商品的结算价格',
  PRIMARY KEY (`shop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_ele
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_ele_cate`
-- ----------------------------
DROP TABLE IF EXISTS `bao_ele_cate`;
CREATE TABLE `bao_ele_cate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `cate_name` varchar(32) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  `closed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`cate_id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_ele_cate
-- ----------------------------
INSERT INTO `bao_ele_cate` VALUES ('1', '39', '旅游', '3', '0');

-- ----------------------------
-- Table structure for `bao_ele_dianping`
-- ----------------------------
DROP TABLE IF EXISTS `bao_ele_dianping`;
CREATE TABLE `bao_ele_dianping` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `speed` tinyint(3) unsigned DEFAULT '0',
  `contents` varchar(1024) DEFAULT NULL,
  `reply` varchar(1024) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `show_date` date DEFAULT NULL,
  `closed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_ele_dianping
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_ele_dianping_pics`
-- ----------------------------
DROP TABLE IF EXISTS `bao_ele_dianping_pics`;
CREATE TABLE `bao_ele_dianping_pics` (
  `pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `pic` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pic_id`),
  KEY `dianping_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_ele_dianping_pics
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_ele_order`
-- ----------------------------
DROP TABLE IF EXISTS `bao_ele_order`;
CREATE TABLE `bao_ele_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `addr_id` int(11) DEFAULT '0',
  `total_price` int(11) DEFAULT '0',
  `logistics` int(11) DEFAULT '0',
  `need_pay` int(11) DEFAULT '0',
  `num` int(11) DEFAULT '0',
  `new_money` int(11) DEFAULT '0',
  `fan_money` int(11) DEFAULT '0',
  `settlement_price` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT '0' COMMENT '1等待处理  2代表已经确认  8代表配送完成',
  `is_pay` tinyint(1) DEFAULT '0' COMMENT '0是货到付款，1是在线支付',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  `audit_time` int(11) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `month` int(11) DEFAULT '201501',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=257 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_ele_order
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_ele_order_product`
-- ----------------------------
DROP TABLE IF EXISTS `bao_ele_order_product`;
CREATE TABLE `bao_ele_order_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  `total_price` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=372 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_ele_order_product
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_ele_product`
-- ----------------------------
DROP TABLE IF EXISTS `bao_ele_product`;
CREATE TABLE `bao_ele_product` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(32) DEFAULT NULL,
  `desc` varchar(255) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `settlement_price` int(11) unsigned DEFAULT NULL,
  `is_new` tinyint(1) DEFAULT '0',
  `is_hot` tinyint(1) DEFAULT '0',
  `is_tuijian` tinyint(1) DEFAULT '0',
  `sold_num` int(11) DEFAULT '0',
  `month_num` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `audit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_ele_product
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_email`
-- ----------------------------
DROP TABLE IF EXISTS `bao_email`;
CREATE TABLE `bao_email` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_key` varchar(32) DEFAULT NULL,
  `email_explain` varchar(1024) DEFAULT NULL,
  `email_tmpl` text,
  `is_open` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_key` (`email_key`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_email
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_express`
-- ----------------------------
DROP TABLE IF EXISTS `bao_express`;
CREATE TABLE `bao_express` (
  `express_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT '0',
  `city_id` int(10) DEFAULT '0',
  `area_id` int(10) DEFAULT '0',
  `business_id` int(10) DEFAULT '0',
  `title` varchar(64) DEFAULT NULL,
  `from_name` varchar(32) DEFAULT NULL,
  `from_addr` varchar(255) DEFAULT NULL,
  `from_mobile` varchar(11) DEFAULT NULL,
  `to_name` varchar(32) DEFAULT NULL,
  `to_addr` varchar(255) DEFAULT NULL,
  `to_mobile` varchar(11) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '0未处理，1已接单，2已完成，-1已拒收',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(10) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`express_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_express
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `bao_feedback`;
CREATE TABLE `bao_feedback` (
  `feed_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `details` text,
  `reply` text,
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `reply_time` int(11) DEFAULT NULL,
  `reply_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`feed_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_found`
-- ----------------------------
DROP TABLE IF EXISTS `bao_found`;
CREATE TABLE `bao_found` (
  `found_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  `link_url` varchar(128) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`found_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_found
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_goods`
-- ----------------------------
DROP TABLE IF EXISTS `bao_goods`;
CREATE TABLE `bao_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `intro` varchar(128) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  `guige` varchar(64) DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `shopcate_id` int(11) DEFAULT NULL,
  `area_id` smallint(5) DEFAULT NULL,
  `business_id` smallint(5) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `city_id` varchar(64) DEFAULT NULL,
  `branch_id` varchar(64) DEFAULT NULL,
  `select1` int(11) DEFAULT NULL,
  `select2` int(11) DEFAULT NULL,
  `select3` int(11) DEFAULT NULL,
  `select4` int(11) DEFAULT NULL,
  `select5` int(11) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `wei_pic` varchar(256) DEFAULT NULL COMMENT '购物二维码',
  `price` int(11) DEFAULT NULL,
  `mall_price` int(11) DEFAULT NULL,
  `settlement_price` int(11) DEFAULT '0',
  `sold_num` int(11) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  `instructions` text,
  `details` text,
  `end_date` date DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `is_mall` tinyint(3) DEFAULT '0',
  `is_vs1` int(2) DEFAULT '0',
  `is_vs2` int(2) DEFAULT '0',
  `is_vs3` int(2) DEFAULT '0',
  `is_vs4` int(2) DEFAULT '0',
  `is_vs5` int(2) DEFAULT '0',
  `is_vs6` int(2) DEFAULT '0',
  `commission` int(11) DEFAULT '0',
  `share` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `orderby` tinyint(4) DEFAULT '100',
  `use_integral` int(11) DEFAULT '0' COMMENT '可使用积分数',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_goods
-- ----------------------------
INSERT INTO `bao_goods` VALUES ('2', '贝拉活动', '哈哈哈', '2147483647', '无', '3', '53', '24', '33', '144', '8', null, '2', '5', '9', '10', '13', '&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transit', '0', '25600', '25600', '25344', '0', '0', '<p><span style=\"white-space: normal;\">贝拉</span><span style=\"white-space: normal;\">贝拉</span><span style=\"white-space: normal;\">贝拉</span></p>', '<p><span style=\"white-space: normal;\">贝拉</span><span style=\"white-space: normal;\">贝拉</span><span style=\"white-space: normal;\">贝拉</span></p>', '0000-00-00', '0', '0', '1', '1', '1', '1', '1', '1', '1', '0', '0', '1506154971', '192.168.11.1', '100', '100');

-- ----------------------------
-- Table structure for `bao_goods_cate`
-- ----------------------------
DROP TABLE IF EXISTS `bao_goods_cate`;
CREATE TABLE `bao_goods_cate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `select1` varchar(32) DEFAULT NULL,
  `select2` varchar(32) DEFAULT NULL,
  `select3` varchar(32) DEFAULT NULL,
  `select4` varchar(32) DEFAULT NULL,
  `select5` varchar(32) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `rate` int(11) DEFAULT '60' COMMENT '结算费率',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_goods_cate
-- ----------------------------
INSERT INTO `bao_goods_cate` VALUES ('1', '旅游', '0', '', '', '', '', '', '1', '0');
INSERT INTO `bao_goods_cate` VALUES ('2', '亲子活动', '1', '', '', '', '', '', '1', '10');

-- ----------------------------
-- Table structure for `bao_goods_cate_attr`
-- ----------------------------
DROP TABLE IF EXISTS `bao_goods_cate_attr`;
CREATE TABLE `bao_goods_cate_attr` (
  `attr_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(5) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `attr_name` varchar(32) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`attr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_goods_cate_attr
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_goods_dianping`
-- ----------------------------
DROP TABLE IF EXISTS `bao_goods_dianping`;
CREATE TABLE `bao_goods_dianping` (
  `dianping_id` int(11) NOT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT '0',
  `score` int(11) DEFAULT NULL,
  `contents` varchar(1024) DEFAULT NULL,
  `reply` varchar(1024) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `show_date` date DEFAULT NULL,
  `closed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`dianping_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_goods_dianping
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_goods_dianping_pics`
-- ----------------------------
DROP TABLE IF EXISTS `bao_goods_dianping_pics`;
CREATE TABLE `bao_goods_dianping_pics` (
  `pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT '0',
  `dianping_id` int(11) DEFAULT NULL,
  `pic` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pic_id`),
  KEY `dianping_id` (`dianping_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_goods_dianping_pics
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_goods_photos`
-- ----------------------------
DROP TABLE IF EXISTS `bao_goods_photos`;
CREATE TABLE `bao_goods_photos` (
  `pic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_goods_photos
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_goods_shopcate`
-- ----------------------------
DROP TABLE IF EXISTS `bao_goods_shopcate`;
CREATE TABLE `bao_goods_shopcate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(32) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_goods_shopcate
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_housework`
-- ----------------------------
DROP TABLE IF EXISTS `bao_housework`;
CREATE TABLE `bao_housework` (
  `housework_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `svc_id` tinyint(3) DEFAULT '0',
  `svctime` varchar(20) DEFAULT NULL,
  `addr` varchar(128) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `buy_num` tinyint(3) DEFAULT '0',
  `contents` varchar(1024) DEFAULT NULL,
  `is_real` tinyint(1) DEFAULT '0' COMMENT '1代表客服已经确认过是有效的',
  `num` tinyint(3) DEFAULT '0' COMMENT '未填数字就代表使用全局的',
  `gold` tinyint(3) DEFAULT '0' COMMENT '未填数字代表应用全局的设置',
  PRIMARY KEY (`housework_id`),
  KEY `svc_id` (`svc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_housework
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_housework_look`
-- ----------------------------
DROP TABLE IF EXISTS `bao_housework_look`;
CREATE TABLE `bao_housework_look` (
  `look_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `housework_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`look_id`),
  UNIQUE KEY `housework_id` (`housework_id`,`shop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_housework_look
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_housework_setting`
-- ----------------------------
DROP TABLE IF EXISTS `bao_housework_setting`;
CREATE TABLE `bao_housework_setting` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `price` int(11) DEFAULT '0',
  `unit` varchar(32) DEFAULT NULL,
  `gongju` varchar(64) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `tel` varchar(32) DEFAULT NULL,
  `biz_time` varchar(64) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `contents` text,
  `yuyue_num` int(11) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  `areas` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_housework_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_huodong`
-- ----------------------------
DROP TABLE IF EXISTS `bao_huodong`;
CREATE TABLE `bao_huodong` (
  `huodong_id` int(10) NOT NULL AUTO_INCREMENT,
  `cate_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `shop_id` int(10) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `intro` varchar(128) DEFAULT NULL,
  `time` varchar(64) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `addr` varchar(1024) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `sign_num` int(11) DEFAULT '0',
  `lat` varchar(15) DEFAULT '' COMMENT '纬度',
  `lng` varchar(15) DEFAULT '0' COMMENT '经度',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`huodong_id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_huodong
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_huodong_sign`
-- ----------------------------
DROP TABLE IF EXISTS `bao_huodong_sign`;
CREATE TABLE `bao_huodong_sign` (
  `sign_id` int(10) NOT NULL AUTO_INCREMENT,
  `huodong_id` int(11) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `num` int(5) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`sign_id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_huodong_sign
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_integral_exchange`
-- ----------------------------
DROP TABLE IF EXISTS `bao_integral_exchange`;
CREATE TABLE `bao_integral_exchange` (
  `exchange_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `addr_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0' COMMENT '1代表后台已经确认了那么发货是前台发货还是什么流程',
  PRIMARY KEY (`exchange_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_integral_exchange
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_integral_goods`
-- ----------------------------
DROP TABLE IF EXISTS `bao_integral_goods`;
CREATE TABLE `bao_integral_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `face_pic` varchar(64) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `is_vip` tinyint(1) DEFAULT '0' COMMENT '1代表只能是本店的VIP 才能兑换该物品',
  `integral` int(11) DEFAULT '0',
  `price` int(11) DEFAULT '0',
  `num` int(11) DEFAULT '0',
  `limit_num` int(11) DEFAULT '0',
  `exchange_num` int(11) DEFAULT '0',
  `details` text,
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(255) DEFAULT NULL,
  `audit` tinyint(4) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0' COMMENT '1代表已经下架',
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_integral_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `bao_keyword`;
CREATE TABLE `bao_keyword` (
  `key_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(32) DEFAULT NULL,
  `type` tinyint(2) DEFAULT '0' COMMENT '搜索关键字，0不限，1表示团购，2表示商家',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`key_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_keyword
-- ----------------------------
INSERT INTO `bao_keyword` VALUES ('1', '培训', '1', '1420630100', '127.0.0.1');

-- ----------------------------
-- Table structure for `bao_life`
-- ----------------------------
DROP TABLE IF EXISTS `bao_life`;
CREATE TABLE `bao_life` (
  `life_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `cate_id` smallint(5) DEFAULT '0',
  `city_id` smallint(5) DEFAULT '0',
  `area_id` smallint(5) DEFAULT '0',
  `business_id` smallint(5) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `is_shop` tinyint(1) DEFAULT '0',
  `text1` varchar(64) DEFAULT NULL,
  `text2` varchar(64) DEFAULT NULL,
  `text3` varchar(64) DEFAULT NULL,
  `num1` int(11) DEFAULT NULL,
  `num2` int(11) DEFAULT NULL,
  `select1` int(11) DEFAULT NULL,
  `select2` int(11) DEFAULT NULL,
  `select3` int(11) DEFAULT NULL,
  `select4` int(11) DEFAULT NULL,
  `select5` int(11) DEFAULT NULL,
  `urgent_date` date DEFAULT '0000-00-00',
  `top_date` date DEFAULT '0000-00-00',
  `photo` varchar(64) DEFAULT NULL,
  `contact` varchar(32) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `qq` varchar(15) DEFAULT NULL,
  `addr` varchar(128) DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  `last_time` int(11) DEFAULT '0',
  `audit` tinyint(1) DEFAULT '0',
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`life_id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_life
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_life_cate`
-- ----------------------------
DROP TABLE IF EXISTS `bao_life_cate`;
CREATE TABLE `bao_life_cate` (
  `cate_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` tinyint(3) DEFAULT '0',
  `cate_name` varchar(32) DEFAULT NULL,
  `num` int(11) DEFAULT '0' COMMENT '信息数冗余',
  `text1` varchar(32) DEFAULT NULL COMMENT '文本字段一',
  `text2` varchar(32) DEFAULT NULL COMMENT '文本字段2',
  `text3` varchar(32) DEFAULT NULL,
  `num1` varchar(32) DEFAULT NULL,
  `num2` varchar(32) DEFAULT NULL COMMENT '5个text字段，如果text 字段没有设置那么就不启用',
  `unit1` varchar(32) DEFAULT NULL,
  `unit2` varchar(32) DEFAULT NULL,
  `select1` varchar(32) DEFAULT NULL,
  `select2` varchar(32) DEFAULT NULL,
  `select3` varchar(32) DEFAULT NULL,
  `select4` varchar(32) DEFAULT NULL COMMENT '多选1',
  `select5` varchar(32) DEFAULT NULL COMMENT '多选2',
  `orderby` tinyint(3) DEFAULT '100',
  `is_hot` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_life_cate
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_life_cate_attr`
-- ----------------------------
DROP TABLE IF EXISTS `bao_life_cate_attr`;
CREATE TABLE `bao_life_cate_attr` (
  `attr_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(5) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `attr_name` varchar(32) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`attr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2684 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_life_cate_attr
-- ----------------------------
INSERT INTO `bao_life_cate_attr` VALUES ('1086', '35', 'select3', '1万—2万', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1087', '35', 'select3', '2万—4万', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1088', '35', 'select3', '4万—6万', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1089', '35', 'select3', '6万—8万', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1090', '35', 'select3', '8万以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1092', '36', 'select1', '小型车', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1093', '36', 'select1', 'SUV/越野车', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1094', '36', 'select1', '中型车', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1095', '36', 'select1', '豪华车', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1096', '36', 'select1', 'MPV/商务车', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1097', '36', 'select1', '跑车', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1098', '36', 'select1', '面包车', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1101', '36', 'select1', '其它', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1102', '36', 'select2', '奇瑞   ', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1103', '36', 'select2', '大众    ', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1104', '36', 'select2', '现代   ', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1105', '36', 'select2', '别克   ', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1106', '36', 'select2', '本田   ', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1107', '36', 'select2', '江淮   ', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1108', '36', 'select2', '日产   ', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1109', '36', 'select2', '雪佛兰   ', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1110', '36', 'select2', '丰田   ', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('1111', '36', 'select2', '奥迪   ', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('1112', '36', 'select2', '宝马   ', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('1113', '36', 'select2', '福特  ', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('1114', '36', 'select2', '起亚  ', '14');
INSERT INTO `bao_life_cate_attr` VALUES ('1115', '36', 'select2', '长安   ', '15');
INSERT INTO `bao_life_cate_attr` VALUES ('1116', '36', 'select2', '瑞麒   ', '16');
INSERT INTO `bao_life_cate_attr` VALUES ('1117', '36', 'select2', '比亚迪    ', '17');
INSERT INTO `bao_life_cate_attr` VALUES ('1118', '36', 'select2', '马自达   ', '18');
INSERT INTO `bao_life_cate_attr` VALUES ('1119', '36', 'select2', '福田    ', '19');
INSERT INTO `bao_life_cate_attr` VALUES ('1120', '36', 'select2', '标致    ', '20');
INSERT INTO `bao_life_cate_attr` VALUES ('1121', '36', 'select2', '奔驰   ', '21');
INSERT INTO `bao_life_cate_attr` VALUES ('1122', '36', 'select2', '东风   ', '22');
INSERT INTO `bao_life_cate_attr` VALUES ('1123', '36', 'select2', '长城   ', '23');
INSERT INTO `bao_life_cate_attr` VALUES ('1124', '36', 'select2', '雪铁龙   ', '24');
INSERT INTO `bao_life_cate_attr` VALUES ('1125', '36', 'select2', '中华  ', '25');
INSERT INTO `bao_life_cate_attr` VALUES ('1126', '36', 'select2', '荣威  ', '26');
INSERT INTO `bao_life_cate_attr` VALUES ('1127', '36', 'select2', '铃木  ', '27');
INSERT INTO `bao_life_cate_attr` VALUES ('1128', '36', 'select2', 'MG  ', '28');
INSERT INTO `bao_life_cate_attr` VALUES ('1129', '36', 'select2', '开瑞   ', '29');
INSERT INTO `bao_life_cate_attr` VALUES ('1130', '36', 'select2', '一汽   ', '30');
INSERT INTO `bao_life_cate_attr` VALUES ('1131', '36', 'select2', '沃尔沃   ', '31');
INSERT INTO `bao_life_cate_attr` VALUES ('1132', '36', 'select2', '金杯   ', '32');
INSERT INTO `bao_life_cate_attr` VALUES ('1133', '36', 'select2', '三菱   ', '33');
INSERT INTO `bao_life_cate_attr` VALUES ('1134', '36', 'select2', '莲花   ', '34');
INSERT INTO `bao_life_cate_attr` VALUES ('1135', '36', 'select2', '凯迪拉克    ', '35');
INSERT INTO `bao_life_cate_attr` VALUES ('1136', '36', 'select2', '海马   ', '36');
INSERT INTO `bao_life_cate_attr` VALUES ('1137', '36', 'select2', '哈飞   ', '37');
INSERT INTO `bao_life_cate_attr` VALUES ('1138', '36', 'select2', '长丰     ', '38');
INSERT INTO `bao_life_cate_attr` VALUES ('1139', '36', 'select2', '东南    ', '39');
INSERT INTO `bao_life_cate_attr` VALUES ('1140', '36', 'select2', '吉利    ', '40');
INSERT INTO `bao_life_cate_attr` VALUES ('1141', '36', 'select2', '斯柯达    ', '41');
INSERT INTO `bao_life_cate_attr` VALUES ('1142', '36', 'select2', '夏利    ', '42');
INSERT INTO `bao_life_cate_attr` VALUES ('1143', '36', 'select2', '昌河   ', '43');
INSERT INTO `bao_life_cate_attr` VALUES ('1144', '36', 'select2', '双环   ', '44');
INSERT INTO `bao_life_cate_attr` VALUES ('1145', '36', 'select2', '双龙   ', '45');
INSERT INTO `bao_life_cate_attr` VALUES ('1146', '36', 'select2', '西安奥拓   ', '46');
INSERT INTO `bao_life_cate_attr` VALUES ('1147', '36', 'select2', '斯巴鲁    ', '47');
INSERT INTO `bao_life_cate_attr` VALUES ('1148', '36', 'select2', '萨博    ', '48');
INSERT INTO `bao_life_cate_attr` VALUES ('1149', '36', 'select2', '中兴   ', '49');
INSERT INTO `bao_life_cate_attr` VALUES ('1150', '36', 'select2', '宝骏    ', '50');
INSERT INTO `bao_life_cate_attr` VALUES ('1151', '36', 'select2', '众泰   ', '51');
INSERT INTO `bao_life_cate_attr` VALUES ('1152', '36', 'select2', 'MINI(迷你)   ', '52');
INSERT INTO `bao_life_cate_attr` VALUES ('1153', '36', 'select2', '解放    ', '53');
INSERT INTO `bao_life_cate_attr` VALUES ('1154', '36', 'select2', '保时捷    ', '54');
INSERT INTO `bao_life_cate_attr` VALUES ('1155', '36', 'select2', '北汽制造    ', '55');
INSERT INTO `bao_life_cate_attr` VALUES ('1156', '36', 'select2', '宾利    ', '56');
INSERT INTO `bao_life_cate_attr` VALUES ('1157', '36', 'select2', '奔腾   ', '57');
INSERT INTO `bao_life_cate_attr` VALUES ('1158', '36', 'select2', '英菲尼迪         ', '58');
INSERT INTO `bao_life_cate_attr` VALUES ('1159', '36', 'select2', '吉利英伦   ', '59');
INSERT INTO `bao_life_cate_attr` VALUES ('1160', '36', 'select2', '新凯   ', '60');
INSERT INTO `bao_life_cate_attr` VALUES ('1161', '36', 'select2', '东风风神     ', '61');
INSERT INTO `bao_life_cate_attr` VALUES ('1162', '36', 'select2', '江铃   ', '62');
INSERT INTO `bao_life_cate_attr` VALUES ('1163', '36', 'select2', '东风风行    ', '63');
INSERT INTO `bao_life_cate_attr` VALUES ('1164', '36', 'select2', '捷豹    ', '64');
INSERT INTO `bao_life_cate_attr` VALUES ('1165', '36', 'select2', '菲亚特   ', '65');
INSERT INTO `bao_life_cate_attr` VALUES ('1166', '36', 'select2', '克莱斯勒    ', '66');
INSERT INTO `bao_life_cate_attr` VALUES ('1167', '36', 'select2', '吉普   ', '67');
INSERT INTO `bao_life_cate_attr` VALUES ('1168', '36', 'select2', '吉奥  ', '68');
INSERT INTO `bao_life_cate_attr` VALUES ('1169', '36', 'select2', '红旗    ', '69');
INSERT INTO `bao_life_cate_attr` VALUES ('1170', '36', 'select2', '华普    ', '70');
INSERT INTO `bao_life_cate_attr` VALUES ('1171', '36', 'select2', '华泰   ', '71');
INSERT INTO `bao_life_cate_attr` VALUES ('1172', '36', 'select2', '黄海   ', '72');
INSERT INTO `bao_life_cate_attr` VALUES ('1173', '36', 'select2', '雷克萨斯    ', '73');
INSERT INTO `bao_life_cate_attr` VALUES ('1174', '36', 'select2', '雷诺    ', '74');
INSERT INTO `bao_life_cate_attr` VALUES ('1175', '36', 'select2', '欧宝   ', '75');
INSERT INTO `bao_life_cate_attr` VALUES ('1176', '36', 'select2', '吉利帝豪   ', '76');
INSERT INTO `bao_life_cate_attr` VALUES ('1177', '36', 'select2', '道奇   ', '77');
INSERT INTO `bao_life_cate_attr` VALUES ('1178', '36', 'select2', '大迪    ', '78');
INSERT INTO `bao_life_cate_attr` VALUES ('1179', '36', 'select2', '讴歌    ', '79');
INSERT INTO `bao_life_cate_attr` VALUES ('1180', '36', 'select2', '路虎    ', '80');
INSERT INTO `bao_life_cate_attr` VALUES ('1181', '36', 'select2', '力帆     ', '81');
INSERT INTO `bao_life_cate_attr` VALUES ('1182', '36', 'select2', '林肯    ', '82');
INSERT INTO `bao_life_cate_attr` VALUES ('1183', '36', 'select2', '法拉利    ', '83');
INSERT INTO `bao_life_cate_attr` VALUES ('1184', '36', 'select2', '陆风川汽   ', '84');
INSERT INTO `bao_life_cate_attr` VALUES ('1185', '36', 'select2', '野马   ', '85');
INSERT INTO `bao_life_cate_attr` VALUES ('1186', '36', 'select2', '玛莎拉蒂', '86');
INSERT INTO `bao_life_cate_attr` VALUES ('1187', '36', 'select2', '兰博基尼', '87');
INSERT INTO `bao_life_cate_attr` VALUES ('1188', '36', 'select2', '其他', '88');
INSERT INTO `bao_life_cate_attr` VALUES ('1189', '36', 'select3', '1万以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1190', '36', 'select3', '1万—2万', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1191', '36', 'select3', '2万—4万', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1192', '36', 'select3', '4万以上', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1194', '37', 'select1', '车辆收购', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1195', '37', 'select1', '车辆评估', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1199', '38', 'select1', '快递员', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1200', '38', 'select1', '送货员', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1201', '38', 'select1', '保安', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1202', '38', 'select1', '编辑', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1203', '38', 'select1', '前台', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1204', '38', 'select1', '收银员', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1205', '38', 'select1', '店长', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1206', '38', 'select1', '摄影/影视', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1207', '38', 'select1', '广告/美工/设计', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('1208', '38', 'select1', '保健按摩', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('1209', '38', 'select1', 'KTV/酒吧', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('1210', '38', 'select1', '美容美发', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('1211', '38', 'select1', '网管', '14');
INSERT INTO `bao_life_cate_attr` VALUES ('1212', '38', 'select1', '翻译', '15');
INSERT INTO `bao_life_cate_attr` VALUES ('1213', '38', 'select1', '仓管', '16');
INSERT INTO `bao_life_cate_attr` VALUES ('1214', '38', 'select1', '切配', '17');
INSERT INTO `bao_life_cate_attr` VALUES ('1215', '38', 'select1', '厨师', '18');
INSERT INTO `bao_life_cate_attr` VALUES ('1216', '38', 'select1', '司机', '19');
INSERT INTO `bao_life_cate_attr` VALUES ('1217', '38', 'select1', '文员', '20');
INSERT INTO `bao_life_cate_attr` VALUES ('1218', '38', 'select1', '人事', '21');
INSERT INTO `bao_life_cate_attr` VALUES ('1219', '38', 'select1', '客服', '22');
INSERT INTO `bao_life_cate_attr` VALUES ('1220', '38', 'select1', '服务员', '23');
INSERT INTO `bao_life_cate_attr` VALUES ('1221', '38', 'select1', '营业员', '24');
INSERT INTO `bao_life_cate_attr` VALUES ('1222', '38', 'select1', '工人/技工', '25');
INSERT INTO `bao_life_cate_attr` VALUES ('1223', '38', 'select1', '行政', '26');
INSERT INTO `bao_life_cate_attr` VALUES ('1224', '38', 'select1', '房产经纪人', '27');
INSERT INTO `bao_life_cate_attr` VALUES ('1225', '38', 'select1', '助理', '28');
INSERT INTO `bao_life_cate_attr` VALUES ('1226', '38', 'select1', '教育/培训/咨询', '29');
INSERT INTO `bao_life_cate_attr` VALUES ('1227', '38', 'select1', '金融/银行/保险', '30');
INSERT INTO `bao_life_cate_attr` VALUES ('1228', '38', 'select1', '财务/会计/出纳', '31');
INSERT INTO `bao_life_cate_attr` VALUES ('1229', '38', 'select1', '家政', '32');
INSERT INTO `bao_life_cate_attr` VALUES ('1230', '38', 'select1', '保洁', '33');
INSERT INTO `bao_life_cate_attr` VALUES ('1231', '38', 'select1', '销售/业务员', '34');
INSERT INTO `bao_life_cate_attr` VALUES ('1232', '38', 'select1', '程序工程师', '35');
INSERT INTO `bao_life_cate_attr` VALUES ('1233', '38', 'select1', '其他', '36');
INSERT INTO `bao_life_cate_attr` VALUES ('1234', '38', 'select2', '女', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1235', '38', 'select2', '男', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1236', '38', 'select3', '本科及以上', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1237', '38', 'select3', '大专', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1238', '38', 'select3', '高中/中专', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1239', '38', 'select3', '初中及以下', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1241', '39', 'select1', '翻译', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1242', '39', 'select1', '演员', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1243', '39', 'select1', '客服', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1244', '39', 'select1', '充场/座谈会', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1245', '39', 'select1', '摄影', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1246', '39', 'select1', '网站', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1247', '39', 'select1', '会计', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1248', '39', 'select1', '模特', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1249', '39', 'select1', '礼仪', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('1250', '39', 'select1', '设计', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('1251', '39', 'select1', '家教', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('1252', '39', 'select1', '服务员', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('1253', '39', 'select1', '场地布置', '14');
INSERT INTO `bao_life_cate_attr` VALUES ('1254', '39', 'select1', '其他', '15');
INSERT INTO `bao_life_cate_attr` VALUES ('1256', '39', 'select2', '女', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1257', '39', 'select2', '男', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1259', '40', 'select1', '旅游', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1260', '40', 'select1', '运动', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1261', '40', 'select1', '唱歌/泡吧', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1262', '40', 'select1', '创业', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1263', '40', 'select1', '做公益', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1264', '40', 'select1', '逛街', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1265', '40', 'select1', '学习', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1266', '40', 'select1', '玩桌游', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1267', '40', 'select1', '看演出', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('1268', '40', 'select1', '晨跑', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('1269', '40', 'select1', '广场活动', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('1270', '40', 'select1', '其他', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('1272', '40', 'select2', '女', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1273', '40', 'select2', '男', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1275', '41', 'select1', '女', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1276', '41', 'select1', '男', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1278', '41', 'select2', '25岁以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1279', '41', 'select2', '25岁—30岁', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1280', '41', 'select2', '30岁—40岁', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1281', '41', 'select2', '40岁—50岁', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1282', '41', 'select2', '50岁—60岁', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1283', '41', 'select2', '60岁以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1285', '42', 'select1', '女', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1286', '42', 'select1', '男', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1288', '42', 'select2', '20岁以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1289', '42', 'select2', '20岁—25岁', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1290', '42', 'select2', '25岁—30岁岁', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1291', '42', 'select2', '30岁—40岁', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1292', '42', 'select2', '40岁—50岁', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1293', '42', 'select2', '50岁以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1295', '44', 'select1', '魔术', '17');
INSERT INTO `bao_life_cate_attr` VALUES ('1296', '44', 'select1', '古玩鉴赏', '18');
INSERT INTO `bao_life_cate_attr` VALUES ('1297', '44', 'select1', '电器维修', '19');
INSERT INTO `bao_life_cate_attr` VALUES ('1298', '44', 'select1', '唱歌', '20');
INSERT INTO `bao_life_cate_attr` VALUES ('1299', '44', 'select1', '方言', '21');
INSERT INTO `bao_life_cate_attr` VALUES ('1300', '44', 'select1', '理财/金融', '22');
INSERT INTO `bao_life_cate_attr` VALUES ('1301', '44', 'select1', '数理化', '23');
INSERT INTO `bao_life_cate_attr` VALUES ('1302', '44', 'select1', '武术', '24');
INSERT INTO `bao_life_cate_attr` VALUES ('1303', '44', 'select1', '电工', '25');
INSERT INTO `bao_life_cate_attr` VALUES ('1304', '44', 'select1', '象棋/围棋', '26');
INSERT INTO `bao_life_cate_attr` VALUES ('1305', '44', 'select1', '中医', '27');
INSERT INTO `bao_life_cate_attr` VALUES ('1306', '44', 'select1', '平面设计', '28');
INSERT INTO `bao_life_cate_attr` VALUES ('1307', '44', 'select1', '服装设计', '29');
INSERT INTO `bao_life_cate_attr` VALUES ('1308', '44', 'select1', '会计/财务', '16');
INSERT INTO `bao_life_cate_attr` VALUES ('1309', '44', 'select1', '乐器', '15');
INSERT INTO `bao_life_cate_attr` VALUES ('1310', '44', 'select1', '美容/按摩', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1311', '44', 'select1', '外语', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1312', '44', 'select1', '开车', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1313', '44', 'select1', '电脑', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1314', '44', 'select1', '体育/打球', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1315', '44', 'select1', '跳舞', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1316', '44', 'select1', '室内设计', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1317', '44', 'select1', '摄影', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1318', '44', 'select1', '销售', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('1319', '44', 'select1', '书法绘画', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('1320', '44', 'select1', '烹饪', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('1321', '44', 'select1', '投资/开店', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('1322', '44', 'select1', '电脑程序', '14');
INSERT INTO `bao_life_cate_attr` VALUES ('1323', '44', 'select1', '其他', '30');
INSERT INTO `bao_life_cate_attr` VALUES ('1325', '45', 'select1', '寻人启事', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1326', '45', 'select1', '寻物启事', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1327', '45', 'select1', '寻宠物启事', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1328', '45', 'select1', '老乡', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1329', '45', 'select1', '其他', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1331', '46', 'select1', '没车', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1332', '46', 'select1', '有车', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1334', '46', 'select2', '长途拼车', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1335', '46', 'select2', '上下班拼车', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1336', '46', 'select2', '上下学拼车', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1337', '46', 'select2', '其他拼车', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1339', '47', 'select1', '整套出租', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1340', '47', 'select1', '单间出租', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1341', '47', 'select1', '床位出租', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1343', '47', 'select2', '500元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1344', '47', 'select2', '500元—1000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1345', '47', 'select2', '1000元—1500元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1346', '47', 'select2', '1500元—2500元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1347', '47', 'select2', '2500元—3500元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1348', '47', 'select2', '3500元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1350', '47', 'select3', '4室及以上', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1351', '47', 'select3', '3室', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1352', '47', 'select3', '2室', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1353', '47', 'select3', '1室', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1355', '48', 'select1', '整套出租', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1356', '48', 'select1', '单间出租', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1357', '48', 'select1', '床位出租', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1359', '48', 'select2', '500元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1360', '48', 'select2', '500元—1000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1361', '48', 'select2', '1000元—1500元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1362', '48', 'select2', '1500元—2500元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1363', '48', 'select2', '2500元—3500元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1364', '48', 'select2', '3500元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1366', '48', 'select3', '4室及以上', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1367', '48', 'select3', '3室', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1368', '48', 'select3', '2室', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1369', '48', 'select3', '1室', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1371', '49', 'select1', '限70平米以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1372', '49', 'select1', '70平米—90平米', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1373', '49', 'select1', '90平米—110平米', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1374', '49', 'select1', '110平米—150平米', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1375', '49', 'select1', '150平米以上', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1377', '49', 'select2', '30万以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1378', '49', 'select2', '30万—40万', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1379', '49', 'select2', '40万—50万', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1380', '49', 'select2', '50万—70万', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1381', '49', 'select2', '70万—90万', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1382', '49', 'select2', '90万—120万', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1383', '49', 'select2', '120万以上', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1385', '49', 'select3', '4室及以上', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1386', '49', 'select3', '3室2厅2卫', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1387', '49', 'select3', '3室2厅1卫', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1388', '49', 'select3', '3室1厅1卫', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1389', '49', 'select3', '2室2厅2卫', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1390', '49', 'select3', '1室1厅1卫', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1391', '49', 'select3', '2室1厅1卫', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1392', '49', 'select3', '2室2厅1卫', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1393', '49', 'select3', '1室0厅1卫', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('1394', '49', 'select3', '其它', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('1396', '50', 'select1', '临街店铺', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1397', '50', 'select1', '购物中心', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1398', '50', 'select1', '住宅底商摊位/柜台', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1399', '50', 'select1', '写字楼底商', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1400', '50', 'select1', '其他', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1402', '50', 'select2', '50平米以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1403', '50', 'select2', '50平米—100平米', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1404', '50', 'select2', '100平米—150平米', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1405', '50', 'select2', '150平米—250平米', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1406', '50', 'select2', '250平米以上', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1408', '50', 'select3', '30万以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1409', '50', 'select3', '30万—50万', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1410', '50', 'select3', '50万—80万', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1411', '50', 'select3', '80万—120万', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1412', '50', 'select3', '120万—300万', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1413', '50', 'select3', '300万—500万', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1414', '50', 'select3', '500万以上', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1418', '51', 'select1', '餐饮美食', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1419', '51', 'select1', '空铺转让', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1420', '51', 'select1', '服饰鞋包', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1421', '51', 'select1', '休闲娱乐', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1422', '51', 'select1', '美容美发', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1423', '51', 'select1', '酒店宾馆', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1424', '51', 'select1', '超市零售', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1425', '51', 'select1', '生活服务', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1426', '51', 'select1', '汽修美容', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('1427', '51', 'select1', '家居建材', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('1428', '51', 'select1', '电子通讯', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('1429', '51', 'select1', '教育培训', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('1430', '51', 'select1', '专柜转让', '14');
INSERT INTO `bao_life_cate_attr` VALUES ('1431', '51', 'select1', '医药保健', '15');
INSERT INTO `bao_life_cate_attr` VALUES ('1432', '51', 'select1', '其它', '16');
INSERT INTO `bao_life_cate_attr` VALUES ('1433', '51', 'select2', '50平米以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1434', '51', 'select2', '50平米—80平米', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1435', '51', 'select2', '80平米—120平米', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1436', '51', 'select2', '120平米—200平米', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1437', '51', 'select2', '200平米以上', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1438', '51', 'select3', '2000元/月以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1439', '51', 'select3', '2000元/月—3000元/月', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1440', '51', 'select3', '3000元/月—5000元/月', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1441', '51', 'select3', '5000元/月—8000元/月', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1442', '51', 'select3', '8000元/月—15000元/月', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1443', '51', 'select3', '15000元/月以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1447', '53', 'select1', '纯写字楼', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1448', '53', 'select1', '商务中心', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1449', '53', 'select1', '商住楼', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1450', '53', 'select1', '园区办公', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1451', '53', 'select1', '其他', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1452', '53', 'select2', '50平米以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1453', '53', 'select2', '50平米—100平米', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1454', '53', 'select2', '100平米—150平米', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1455', '53', 'select2', '150平米—200平米', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1456', '53', 'select2', '200平米—300平米', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1457', '53', 'select2', '300平米以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1458', '53', 'select3', '50元/平米/天以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1459', '53', 'select3', '50—100元/平米/天', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1460', '53', 'select3', '100—200元/平米/天', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1461', '53', 'select3', '200—400元/平米/天', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1462', '53', 'select3', '400以上元/平米/天', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1466', '54', 'select1', '家庭旅馆', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1467', '54', 'select1', '宾馆酒店', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1468', '54', 'select1', '高档公寓', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1469', '54', 'select1', '其他', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1470', '54', 'select2', '床位', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1471', '54', 'select2', '单间', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1472', '54', 'select2', '整套', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1473', '54', 'select3', '20元/天以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1474', '54', 'select3', '20元/天—50元/天', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1475', '54', 'select3', '50元/天—100元/天', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1476', '54', 'select3', '100元/天—200元/天', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1477', '54', 'select3', '200元/天—400元/天', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1478', '54', 'select3', '400元/天以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1480', '55', 'select1', '50平米以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1481', '55', 'select1', '50平米—150平米', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1482', '55', 'select1', '150平米—300平米', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1483', '55', 'select1', '300平米—500平米', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1484', '55', 'select1', '500平米—1000平米', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1485', '55', 'select1', '1000平米—3000平米', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1486', '55', 'select1', '3000平米以上', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1488', '55', 'select2', '50元/平米/天以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1489', '55', 'select2', '50—100元/平米/天', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1490', '55', 'select2', '100—200元/平米/天', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1491', '55', 'select2', '200—400元/平米/天', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1492', '55', 'select2', '400元/平米/天以上', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1496', '56', 'select1', '纯写字楼', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1497', '56', 'select1', '商务中心', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1498', '56', 'select1', '商住楼', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1499', '56', 'select1', '园区办公', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1500', '56', 'select1', '其他', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1501', '56', 'select2', '50平米以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1502', '56', 'select2', '50平米—80平米', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1503', '56', 'select2', '80平米—120平米', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1504', '56', 'select2', '120平米—180平米', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1505', '56', 'select2', '180平米—250平米', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1506', '56', 'select2', '250平米以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1507', '56', 'select3', '30万元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1508', '56', 'select3', '30万元—50万元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1509', '56', 'select3', '50万元—100万元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1510', '56', 'select3', '100万元—200万元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1511', '56', 'select3', '200万元—300万元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1512', '56', 'select3', '300万元—500万元', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1513', '56', 'select3', '500万元以上', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1515', '57', 'select1', '50平米以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1516', '57', 'select1', '50平米—80平米', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1517', '57', 'select1', '80平米—120平米', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1518', '57', 'select1', '120平米—150平米', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1519', '57', 'select1', '150平米—250平米', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1520', '57', 'select1', '250平米以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1522', '57', 'select2', '30万元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1523', '57', 'select2', '30万元—50万元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1524', '57', 'select2', '50万元—80万元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1525', '57', 'select2', '80万元—120万元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1526', '57', 'select2', '120万元—200万元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1527', '57', 'select2', '200万元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1529', '57', 'select3', '4室及以上', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1530', '57', 'select3', '3室2厅2卫', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1531', '57', 'select3', '3室2厅1卫', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1532', '57', 'select3', '3室1厅1卫', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1533', '57', 'select3', '2室2厅2卫', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1534', '57', 'select3', '1室1厅1卫', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1535', '57', 'select3', '2室1厅1卫', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1536', '57', 'select3', '2室2厅1卫1', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1537', '57', 'select3', '室0厅1卫', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('1538', '57', 'select3', '其它', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('1540', '58', 'select1', '初中', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1541', '58', 'select1', '高中', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1542', '58', 'select1', '小学', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1543', '58', 'select1', '小升初', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1544', '58', 'select1', '初升高', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1545', '58', 'select1', '其他', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1547', '58', 'select2', '30元/小时以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1548', '58', 'select2', '30元/小时—50元/小时', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1549', '58', 'select2', '50元/小时—100元/小时', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1550', '58', 'select2', '100元/小时—200元/小时', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1551', '58', 'select2', '200元/小时以上', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1553', '59', 'select1', '财会/金融', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1554', '59', 'select1', '建筑', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1555', '59', 'select1', '公务员', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1556', '59', 'select1', '美容美发', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1557', '59', 'select1', '经营/管理', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1558', '59', 'select1', '技工', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1559', '59', 'select1', '教师', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1560', '59', 'select1', '心理/医疗/保健', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1561', '59', 'select1', '厨师', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('1562', '59', 'select1', '外贸/采购/物流', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('1563', '59', 'select1', '司法考试', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('1564', '59', 'select1', '网络技术', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('1565', '59', 'select1', '面点', '14');
INSERT INTO `bao_life_cate_attr` VALUES ('1566', '59', 'select1', '其他', '15');
INSERT INTO `bao_life_cate_attr` VALUES ('1568', '59', 'select2', '200元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1569', '59', 'select2', '200元—500元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1570', '59', 'select2', '500元—1000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1571', '59', 'select2', '1000元—3000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1572', '59', 'select2', '3000元—7000元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1573', '59', 'select2', '7000元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1575', '60', 'select1', '自考', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1576', '60', 'select1', '专科/本科', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1577', '60', 'select1', '网络/远程', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1578', '60', 'select1', '成人高考', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1579', '60', 'select1', '在职研究生', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1580', '60', 'select1', '出国留学', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1581', '60', 'select1', '考研', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1582', '60', 'select1', '其他', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1584', '60', 'select2', '500元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1585', '60', 'select2', '500元—2000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1586', '60', 'select2', '2000元—5000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1587', '60', 'select2', '5000元—10000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1588', '60', 'select2', '10000元以上', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1591', '61', 'select1', '办公自动化', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1592', '61', 'select1', '网络营销', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1593', '61', 'select1', '认证培训', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1594', '61', 'select1', '网络工程/管理', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1595', '61', 'select1', '硬件技术/维修', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1596', '61', 'select1', '影视动画', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1597', '61', 'select1', '软件开发', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1598', '61', 'select1', '数据库培训', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1599', '61', 'select1', '计算机等级考试', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('1600', '61', 'select1', '计算机软考', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('1601', '61', 'select1', 'app开发', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('1602', '61', 'select1', '游戏开发', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('1603', '61', 'select1', '其他', '14');
INSERT INTO `bao_life_cate_attr` VALUES ('1604', '61', 'select2', '500元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1605', '61', 'select2', '500元—1000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1606', '61', 'select2', '1000元—3000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1607', '61', 'select2', '3000元—7000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1608', '61', 'select2', '7000元以上', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1611', '62', 'select1', '书法', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1612', '62', 'select1', '美术', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1613', '62', 'select1', '舞蹈', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1614', '62', 'select1', '乐器', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1615', '62', 'select1', '声乐', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1616', '62', 'select1', '表演/礼仪', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1617', '62', 'select1', '其他', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1618', '62', 'select2', '500元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1619', '62', 'select2', '500—1000', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1620', '62', 'select2', '1000—2000', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1621', '62', 'select2', '2000—4000', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1622', '62', 'select2', '4000—7000', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1623', '62', 'select2', '7000以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1626', '63', 'select1', '韩语', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1627', '63', 'select1', '英语', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1628', '63', 'select1', '日语', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1629', '63', 'select1', '俄语', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1630', '63', 'select1', '考试类英语', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1631', '63', 'select1', '西班牙语', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1632', '63', 'select1', '法语', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1633', '63', 'select1', '德语', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1634', '63', 'select1', '其他语种', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('1635', '63', 'select2', '500元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1636', '63', 'select2', '500元—1000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1637', '63', 'select2', '1000元—2000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1638', '63', 'select2', '2000元—3000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1639', '63', 'select2', '3000元以上', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1642', '64', 'select1', '室内设计', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1643', '64', 'select1', '平面设计', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1644', '64', 'select1', '模具设计', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1645', '64', 'select1', '网页设计', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1646', '64', 'select1', '广告设计', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1647', '64', 'select1', '建筑设计', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1648', '64', 'select1', '景观/园林设计', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1649', '64', 'select1', '家具设计', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1650', '64', 'select1', '形象设计', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('1651', '64', 'select1', '动漫设计', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('1652', '64', 'select1', '包装设计', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('1653', '64', 'select1', '服装设计', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('1654', '64', 'select1', '其他', '14');
INSERT INTO `bao_life_cate_attr` VALUES ('1655', '64', 'select2', '500元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1656', '64', 'select2', '500元—1000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1657', '64', 'select2', '1000元—3000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1658', '64', 'select2', '3000元—5000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1659', '64', 'select2', '5000元—8000元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1660', '64', 'select2', '8000元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1662', '65', 'select1', '学前教育', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1663', '65', 'select1', '亲子教育', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1664', '65', 'select1', '胎教', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1665', '65', 'select1', '母婴护理', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1666', '65', 'select1', '其他', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1668', '65', 'select2', '500元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1669', '65', 'select2', '500元—1000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1670', '65', 'select2', '1000元—3000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1671', '65', 'select2', '3000元—5000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1672', '65', 'select2', '5000元以上', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1674', '66', 'select1', '跆拳道', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1675', '66', 'select1', '球类', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1676', '66', 'select1', '游泳', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1677', '66', 'select1', '健身', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1678', '66', 'select1', '武术', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1679', '66', 'select1', '瑜伽', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1680', '66', 'select1', '棋类', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1681', '66', 'select1', '其他', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1683', '66', 'select2', '500元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1684', '66', 'select2', '500元—1000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1685', '66', 'select2', '1000元—3000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1686', '66', 'select2', '3000元以上', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1688', '67', 'select1', '普工', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1689', '67', 'select1', '安装/维修工', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1690', '67', 'select1', '焊工', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1691', '67', 'select1', '电工', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1692', '67', 'select1', '装卸/搬运工', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1693', '67', 'select1', '建筑/装修工', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1694', '67', 'select1', '缝纫/制衣工', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1695', '67', 'select1', '车工/铣工/钳工', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1696', '67', 'select1', '模具工', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('1697', '67', 'select1', '油漆工', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('1698', '67', 'select1', '木工', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('1699', '67', 'select1', '生产主管/组长', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('1700', '67', 'select1', '钳工', '14');
INSERT INTO `bao_life_cate_attr` VALUES ('1701', '67', 'select1', '车间主任', '15');
INSERT INTO `bao_life_cate_attr` VALUES ('1702', '67', 'select1', '厂长/副厂长', '16');
INSERT INTO `bao_life_cate_attr` VALUES ('1703', '67', 'select1', '其他', '17');
INSERT INTO `bao_life_cate_attr` VALUES ('1706', '67', 'select2', '2000元—3000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1707', '67', 'select2', '3000元—5000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1708', '67', 'select2', '5000元—8000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1709', '67', 'select2', '8000元—12000元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1710', '67', 'select2', '12000元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1712', '68', 'select1', '销售专员', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1713', '68', 'select1', '电话销售', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1714', '68', 'select1', '销售经理/主管', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1715', '68', 'select1', '保险/金融顾问', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1716', '68', 'select1', '跟单员/助理', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1717', '68', 'select1', '网络销售', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1718', '68', 'select1', '房产经纪人', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1719', '68', 'select1', '保险经纪人', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1720', '68', 'select1', '证券/期货/外汇经纪人', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('1721', '68', 'select1', '信用卡/银行卡业务', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('1722', '68', 'select1', '股票/期货操盘手', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('1723', '68', 'select1', '银行会计/柜员', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('1724', '68', 'select1', '证券经理/总监', '14');
INSERT INTO `bao_life_cate_attr` VALUES ('1725', '68', 'select1', '银行经理/主任', '15');
INSERT INTO `bao_life_cate_attr` VALUES ('1726', '68', 'select1', '其他', '16');
INSERT INTO `bao_life_cate_attr` VALUES ('1728', '68', 'select2', '2000元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1729', '68', 'select2', '2000元—3000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1730', '68', 'select2', '3000元—5000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1731', '68', 'select2', '5000元—8000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1732', '68', 'select2', '8000元—12000元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1733', '68', 'select2', '12000元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1735', '69', 'select1', '足疗师', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1736', '69', 'select1', '按摩师', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1737', '69', 'select1', '保健师', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1738', '69', 'select1', '其他', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1740', '69', 'select2', '2000元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1741', '69', 'select2', '2000元—3000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1742', '69', 'select2', '3000元—5000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1743', '69', 'select2', '5000元—8000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1744', '69', 'select2', '8000元—12000元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1745', '69', 'select2', '12000元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1747', '70', 'select1', '室内设计', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1748', '70', 'select1', '平面设计', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1749', '70', 'select1', '广告设计', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1750', '70', 'select1', 'CAD制图', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1751', '70', 'select1', '网页设计', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1752', '70', 'select1', '店面/陈列设计', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1753', '70', 'select1', '摄影师', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1754', '70', 'select1', '包装设计', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1755', '70', 'select1', '服装设计', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('1756', '70', 'select1', '其它', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('1758', '70', 'select2', '2000元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1759', '70', 'select2', '2000元—3000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1760', '70', 'select2', '3000元—5000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1761', '70', 'select2', '5000元—8000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1762', '70', 'select2', '8000元—12000元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1763', '70', 'select2', '12000元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1765', '71', 'select1', '文员', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1766', '71', 'select1', '行政专员/助理', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1767', '71', 'select1', '前台/总机/接待', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1768', '71', 'select1', '人事专员/助理', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1769', '71', 'select1', '秘书/助理', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1770', '71', 'select1', '编辑/文案', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1771', '71', 'select1', '后勤', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1772', '71', 'select1', '招聘经理/主管', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1773', '71', 'select1', '招聘专员/助理', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('1774', '71', 'select1', '行政经理/主管', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('1775', '71', 'select1', '人事经理/主管', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('1776', '71', 'select1', '记者/采编', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('1777', '71', 'select1', '猎头', '14');
INSERT INTO `bao_life_cate_attr` VALUES ('1778', '71', 'select1', '行政总监', '15');
INSERT INTO `bao_life_cate_attr` VALUES ('1779', '71', 'select1', '总编/副总编/主编', '16');
INSERT INTO `bao_life_cate_attr` VALUES ('1780', '71', 'select1', '其他', '17');
INSERT INTO `bao_life_cate_attr` VALUES ('1782', '71', 'select2', '2000元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1783', '71', 'select2', '2000元—3000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1784', '71', 'select2', '3000元—5000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1785', '71', 'select2', '5000元—8000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1786', '71', 'select2', '8000元—12000元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1787', '71', 'select2', '12000元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1789', '72', 'select1', '营业员', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1790', '72', 'select1', '导购员', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1791', '72', 'select1', '促销员', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1792', '72', 'select1', '店长', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1793', '72', 'select1', '理货员', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1794', '72', 'select1', '其他', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1797', '72', 'select2', '2000元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1798', '72', 'select2', '2000元—3000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1799', '72', 'select2', '3000元—5000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1800', '72', 'select2', '5000元—8000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1801', '72', 'select2', '8000元—12000元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1802', '72', 'select2', '12000元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1803', '72', 'select3', '做六休一', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1804', '72', 'select3', '做二休一', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1805', '72', 'select3', '做五休二', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1806', '72', 'select3', '做一休一', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1807', '72', 'select3', '其他', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1809', '73', 'select1', '餐厅服务员', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1810', '73', 'select1', '收银员', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1811', '73', 'select1', '大堂服务员', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1812', '73', 'select1', '客房服务员', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1813', '73', 'select1', '大堂经理/领班', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1814', '73', 'select1', '迎宾/接待', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1815', '73', 'select1', '其他', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1817', '73', 'select2', '2000元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1818', '73', 'select2', '2000元—3000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1819', '73', 'select2', '3000元—5000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1820', '73', 'select2', '5000元—8000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1821', '73', 'select2', '8000元—12000元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1822', '73', 'select2', '12000元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1824', '74', 'select1', '厨师', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1825', '74', 'select1', '切配/厨工', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1826', '74', 'select1', '面点师', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1827', '74', 'select1', '洗碗工', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1828', '74', 'select1', '其他', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1830', '74', 'select2', '2000元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1831', '74', 'select2', '2000元—3000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1832', '74', 'select2', '3000元—5000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1833', '74', 'select2', '5000元—8000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1834', '74', 'select2', '8000元—12000元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1835', '74', 'select2', '12000元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1837', '75', 'select1', '送货员', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1838', '75', 'select1', '快递员', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1839', '75', 'select1', '仓库管理员', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1840', '75', 'select1', '跟单员', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1841', '75', 'select1', '送餐员', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1842', '75', 'select1', '调度员', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1843', '75', 'select1', '其它', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1845', '75', 'select2', '2000元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1846', '75', 'select2', '2000元—3000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1847', '75', 'select2', '3000元—5000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1848', '75', 'select2', '5000元—8000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1849', '75', 'select2', '8000元—12000元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1850', '75', 'select2', '12000元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1852', '76', 'select1', '900元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1853', '76', 'select1', '900元—2000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1854', '76', 'select1', '2000元—3000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1855', '76', 'select1', '3000元以上', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1857', '77', 'select1', '保洁', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1858', '77', 'select1', '保姆', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1859', '77', 'select1', '钟点工', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1860', '77', 'select1', '陪护', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1861', '77', 'select1', '育婴师', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1862', '77', 'select1', '月嫂', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1863', '77', 'select1', '其它', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1865', '77', 'select2', '900元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1866', '77', 'select2', '900元—2000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1867', '77', 'select2', '2000元—3000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1868', '77', 'select2', '3000元以上', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1870', '78', 'select1', '货车', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1871', '78', 'select1', '出租车', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1872', '78', 'select1', '轿车', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1873', '78', 'select1', '面包车', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1874', '78', 'select1', '客车', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1875', '78', 'select1', '挖掘机', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1876', '78', 'select1', '叉车/铲车/吊车', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1877', '78', 'select1', '驾校教练/陪驾', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1878', '78', 'select1', '其他', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('1880', '78', 'select2', '2000元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1881', '78', 'select2', '2000元—3000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1882', '78', 'select2', '3000元—5000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1883', '78', 'select2', '5000元—8000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1884', '78', 'select2', '8000元—12000元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1885', '78', 'select2', '12000元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1887', '79', 'select1', '中小学教师', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1888', '79', 'select1', '家教', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1889', '79', 'select1', '早教', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1890', '79', 'select1', '文艺/体育教师', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1891', '79', 'select1', '企业培训', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1892', '79', 'select1', '运动/健身教练', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1893', '79', 'select1', '校长', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1894', '79', 'select1', '瑜伽/舞蹈老师', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1895', '79', 'select1', '其他', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('1897', '79', 'select2', '2000元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1898', '79', 'select2', '2000元—3000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1899', '79', 'select2', '3000元—5000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1900', '79', 'select2', '5000元—8000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1901', '79', 'select2', '8000元—12000元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1902', '79', 'select2', '12000元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1904', '80', 'select1', '会计', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1905', '80', 'select1', '财务', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1906', '80', 'select1', '出纳', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1907', '80', 'select1', '统计员', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1908', '80', 'select1', '审计', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1909', '80', 'select1', '税务', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1910', '80', 'select1', '其他', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1912', '80', 'select2', '2000元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1913', '80', 'select2', '2000元—3000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1914', '80', 'select2', '3000元—5000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1915', '80', 'select2', '5000元—8000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1916', '80', 'select2', '8000元—12000元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1917', '80', 'select2', '12000元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1919', '81', 'select1', '淘宝美工', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1920', '81', 'select1', '淘宝客服', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1921', '81', 'select1', '网店店长', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1922', '81', 'select1', '店铺运营/推广', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1923', '81', 'select1', '其它', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1925', '81', 'select2', '2000元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1926', '81', 'select2', '2000元—3000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1927', '81', 'select2', '3000元—5000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1928', '81', 'select2', '5000元—8000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1929', '81', 'select2', '8000元—12000元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1930', '81', 'select2', '12000元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1932', '81', 'select3', '做六休一', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1933', '81', 'select3', '做二休一', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1934', '81', 'select3', '做五休二', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1935', '81', 'select3', '做一休一', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1936', '81', 'select3', '其他', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1938', '82', 'select1', '客服专员/助理', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1939', '82', 'select1', '客服经理/主管', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1940', '82', 'select1', '其他', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1942', '82', 'select2', '2000元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1943', '82', 'select2', '2000元—3000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1944', '82', 'select2', '3000元—5000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1945', '82', 'select2', '5000元以上', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1947', '83', 'select1', '美发师', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1948', '83', 'select1', '化妆师', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1949', '83', 'select1', '美容师', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1950', '83', 'select1', '美发助理/学徒', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1951', '83', 'select1', '美容助理/学徒', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1952', '83', 'select1', '美甲师', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1953', '83', 'select1', '洗头工', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1954', '83', 'select1', '其它', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1956', '83', 'select2', '2000元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1957', '83', 'select2', '2000元—3000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1958', '83', 'select2', '3000元—5000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1959', '83', 'select2', '5000元—8000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1960', '83', 'select2', '8000元—12000元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1961', '83', 'select2', '12000元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1963', '84', 'select1', '技术支持/维护', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1964', '84', 'select1', '游戏设计/开发', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1965', '84', 'select1', '网络工程师', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1966', '84', 'select1', '网站运营', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1967', '84', 'select1', '网站编辑', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1968', '84', 'select1', '技术专员/助理', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1969', '84', 'select1', '程序员', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('1970', '84', 'select1', '网络管理员', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('1971', '84', 'select1', '硬件工程师', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('1972', '84', 'select1', '技术总监/经理', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('1973', '84', 'select1', '软件工程师', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('1974', '84', 'select1', '产品经理/专员', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('1975', '84', 'select1', '测试员', '14');
INSERT INTO `bao_life_cate_attr` VALUES ('1976', '84', 'select1', '通信工程师', '15');
INSERT INTO `bao_life_cate_attr` VALUES ('1977', '84', 'select1', '架构师', '16');
INSERT INTO `bao_life_cate_attr` VALUES ('1978', '84', 'select1', '数据库管理', '17');
INSERT INTO `bao_life_cate_attr` VALUES ('1979', '84', 'select1', '其他', '18');
INSERT INTO `bao_life_cate_attr` VALUES ('1981', '84', 'select2', '2000元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1982', '84', 'select2', '2000元—3000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1983', '84', 'select2', '3000元—5000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1984', '84', 'select2', '5000元—8000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1985', '84', 'select2', '8000元—12000元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1986', '84', 'select2', '12000元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('1988', '84', 'select3', '无经验', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1989', '84', 'select3', '一年经验', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1990', '84', 'select3', '二年经验', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1991', '84', 'select3', '三年经验', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1992', '84', 'select3', '三年以上经验', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1994', '85', 'select1', '市场专员/助理', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('1995', '85', 'select1', '营销经理', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('1996', '85', 'select1', '市场经理/主管', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('1997', '85', 'select1', '客户经理/主管', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('1998', '85', 'select1', '公关专员/助理', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('1999', '85', 'select1', '公关经理/主管', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2000', '85', 'select1', '大客户经理', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2001', '85', 'select1', '其他', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2003', '85', 'select2', '2000元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2004', '85', 'select2', '2000元—3000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2005', '85', 'select2', '3000元—5000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2006', '85', 'select2', '5000元—8000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2007', '85', 'select2', '8000元—12000元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2008', '85', 'select2', '12000元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2010', '87', 'select1', '德语', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2011', '87', 'select1', '英语', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2012', '87', 'select1', '韩语', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2013', '87', 'select1', '日语', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2014', '87', 'select1', '俄语', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2015', '87', 'select1', '西班牙语', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2016', '87', 'select1', '法语', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2017', '87', 'select1', '其它', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2019', '87', 'select2', '2000元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2020', '87', 'select2', '2000元—3000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2021', '87', 'select2', '3000元—5000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2022', '87', 'select2', '5000元—8000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2023', '87', 'select2', '8000元—12000元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2024', '87', 'select2', '12000元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2026', '89', 'select1', '2000元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2027', '89', 'select1', '2000元—3000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2028', '89', 'select1', '3000元—5000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2029', '89', 'select1', '5000元—8000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2030', '89', 'select1', '8000元—12000元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2031', '89', 'select1', '12000元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2033', '90', 'select1', '产品代理', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2034', '90', 'select1', '服装箱包', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2035', '90', 'select1', '餐饮加盟', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2036', '90', 'select1', '教育培训', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2037', '90', 'select1', '建材家居', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2038', '90', 'select1', '干洗加盟', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2039', '90', 'select1', '美容保健', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2040', '90', 'select1', '快递物流', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2041', '90', 'select1', '礼品饰品', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2042', '90', 'select1', '农业养殖', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('2043', '90', 'select1', '母婴用品', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('2044', '90', 'select1', '其他', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('2046', '91', 'select1', '无抵押贷款', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2047', '91', 'select1', '企业/个体户贷款', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2048', '91', 'select1', '汽车抵押贷款', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2049', '91', 'select1', '房产抵押贷款', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2050', '91', 'select1', '买房贷款', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2051', '91', 'select1', '买车贷款', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2052', '91', 'select1', '其它', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2054', '92', 'select1', '空调维修', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2055', '92', 'select1', '热水器维修', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2056', '92', 'select1', '空调移机', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2057', '92', 'select1', '洗衣机维修', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2058', '92', 'select1', '冰箱维修', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2059', '92', 'select1', '电视机维修', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2060', '92', 'select1', '饮水机维修', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2061', '92', 'select1', '电饭煲维修', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2062', '92', 'select1', '抽油烟机维修', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2063', '92', 'select1', '电磁炉维修', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('2064', '92', 'select1', '其他', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('2066', '93', 'select1', '吊顶', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2067', '93', 'select1', '门窗', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2068', '93', 'select1', '涂料', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2069', '93', 'select1', '钢材', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2070', '93', 'select1', '五金', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2071', '93', 'select1', '墙纸', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2072', '93', 'select1', '地板', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2073', '93', 'select1', '油漆', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2074', '93', 'select1', '卫浴洁具', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2075', '93', 'select1', '玻璃', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('2076', '93', 'select1', '瓷砖', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('2077', '93', 'select1', '窗帘', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('2078', '93', 'select1', '灯具', '14');
INSERT INTO `bao_life_cate_attr` VALUES ('2079', '93', 'select1', '水泥', '15');
INSERT INTO `bao_life_cate_attr` VALUES ('2080', '93', 'select1', '橱柜', '16');
INSERT INTO `bao_life_cate_attr` VALUES ('2081', '93', 'select1', '厨卫电器', '17');
INSERT INTO `bao_life_cate_attr` VALUES ('2082', '93', 'select1', '暖气地暖', '18');
INSERT INTO `bao_life_cate_attr` VALUES ('2083', '93', 'select1', '其它', '19');
INSERT INTO `bao_life_cate_attr` VALUES ('2085', '94', 'select1', '公司注册', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2086', '94', 'select1', '工商年检', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2087', '94', 'select1', '商标注册', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2088', '94', 'select1', '公司转让', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2089', '94', 'select1', '专利注册', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2090', '94', 'select1', '海外公司注册', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2091', '94', 'select1', '专项审批', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2092', '94', 'select1', '香港公司注册', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2093', '94', 'select1', '公司注销', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2094', '94', 'select1', '验资开户', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('2095', '94', 'select1', '资质认证', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('2096', '94', 'select1', '外资公司注册', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('2097', '94', 'select1', '其它', '14');
INSERT INTO `bao_life_cate_attr` VALUES ('2099', '95', 'select1', '新房装修', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2100', '95', 'select1', '店铺装修', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2101', '95', 'select1', '办公室/写字楼装修', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2102', '95', 'select1', '二手房装修', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2103', '95', 'select1', '厂房装修', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2104', '95', 'select1', '拆旧', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2105', '95', 'select1', '学校/幼儿园装修', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2106', '95', 'select1', '商场/超市装修', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2107', '95', 'select1', '酒店装修', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2108', '95', 'select1', '其他', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('2110', '96', 'select1', '理财产品', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2111', '96', 'select1', '期货', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2112', '96', 'select1', '股票', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2113', '96', 'select1', '黄金', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2114', '96', 'select1', '证券', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2115', '96', 'select1', '信用卡', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2116', '96', 'select1', '基金', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2117', '96', 'select1', '外汇', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2118', '96', 'select1', '保险', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2119', '96', 'select1', '其它', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('2121', '97', 'select1', '会计', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2122', '97', 'select1', '审计', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2124', '98', 'select1', '电脑维修', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2125', '98', 'select1', '笔记本维修', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2126', '98', 'select1', '网络布线', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2127', '98', 'select1', 'IT外包', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2128', '98', 'select1', '打印机维修', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2129', '98', 'select1', '数据恢复', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2130', '98', 'select1', '传真机维修', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2131', '98', 'select1', '安防监控', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2132', '98', 'select1', 'ipad/平板电脑维修', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2133', '98', 'select1', '机房建设', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('2134', '98', 'select1', '其它', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('2136', '99', 'select1', '货运', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2137', '99', 'select1', '快递', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2138', '99', 'select1', '仓储', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2139', '99', 'select1', '行李托运', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2140', '99', 'select1', '进出口报关', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2141', '99', 'select1', '其它', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2143', '100', 'select1', '农产品加工/代理', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2144', '100', 'select1', '农作物', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2145', '100', 'select1', '畜禽养殖', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2146', '100', 'select1', '水产', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2147', '100', 'select1', '园林花卉', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2148', '100', 'select1', '动植物种苗', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2149', '100', 'select1', '农机具/设备', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2150', '100', 'select1', '饲料/兽药', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2151', '100', 'select1', '农药/肥料', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2152', '100', 'select1', '其它', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('2154', '101', 'select1', '活动策划', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('2155', '101', 'select1', '广告策划', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('2156', '101', 'select1', '平面设计', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2157', '101', 'select1', '网页设计', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2158', '101', 'select1', 'Logo设计/VI设计', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2159', '101', 'select1', '工业设计', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2160', '101', 'select1', '景观设计', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2161', '101', 'select1', '影视/动画制作', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2162', '101', 'select1', '室内设计', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2163', '101', 'select1', '名片设计', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2164', '101', 'select1', '服装设计', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2165', '101', 'select1', '其它', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('2167', '102', 'select1', '管道疏通', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2168', '102', 'select1', '下水道疏通', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2169', '102', 'select1', '马桶疏通', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2170', '102', 'select1', '化粪池疏通', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2171', '102', 'select1', '管道清淤', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2172', '102', 'select1', '打捞', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2174', '103', 'select1', '带司机租车', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2175', '103', 'select1', '商务租车', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2176', '103', 'select1', '旅游租车', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2177', '103', 'select1', '婚车', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2178', '103', 'select1', '豪华车', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2179', '103', 'select1', '货车', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2180', '103', 'select1', '其他', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2182', '103', 'select2', '100元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2183', '103', 'select2', '200元—300元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2184', '103', 'select2', '300元—500元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2185', '103', 'select2', '500元—800元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2186', '103', 'select2', '800元—1200元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2187', '103', 'select2', '1200元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2189', '104', 'select1', '周边游', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2190', '104', 'select1', '农家乐', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2191', '104', 'select1', '旅行社', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2192', '104', 'select1', '导游', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2193', '104', 'select1', '港澳台游', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2194', '104', 'select1', '温泉', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2195', '104', 'select1', '出国游', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2196', '104', 'select1', '其它', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2198', '105', 'select1', '婚纱摄影', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2199', '105', 'select1', '艺术照', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2200', '105', 'select1', '写真', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2201', '105', 'select1', '摄像', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2202', '105', 'select1', '商业摄影', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2203', '105', 'select1', '儿童摄影', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2204', '105', 'select1', '其他', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2206', '106', 'select1', '日常保洁', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2207', '106', 'select1', '擦玻璃', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2208', '106', 'select1', '开荒保洁', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2209', '106', 'select1', '抽油烟机清洗', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2210', '106', 'select1', '地毯清洗', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2211', '106', 'select1', '外墙清洗', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2212', '106', 'select1', '干洗', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2213', '106', 'select1', '石材翻新/养护', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2214', '106', 'select1', '地板打蜡', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2215', '106', 'select1', '沙发清洗', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('2216', '106', 'select1', '空调清洗', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('2217', '106', 'select1', '灯具清洗', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('2218', '106', 'select1', '空气净化', '14');
INSERT INTO `bao_life_cate_attr` VALUES ('2219', '106', 'select1', '瓷砖美缝', '15');
INSERT INTO `bao_life_cate_attr` VALUES ('2220', '106', 'select1', '其他', '16');
INSERT INTO `bao_life_cate_attr` VALUES ('2222', '107', 'select1', '100元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2223', '107', 'select1', '100元—200元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2224', '107', 'select1', '200元—300元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2225', '107', 'select1', '300元—500元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2226', '107', 'select1', '500元以上', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2228', '109', 'select1', 'C1(手动档汽车)', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2229', '109', 'select1', 'C2(自动挡汽车)', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2230', '109', 'select1', 'B1(中型客车)', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2231', '109', 'select1', 'B2(大型货车)', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2232', '109', 'select1', 'E(二轮摩托车)', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2233', '109', 'select1', 'F(轻便摩托车)', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2234', '109', 'select1', 'D(三轮摩托车)', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2235', '109', 'select1', 'A2(牵引车)', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2236', '109', 'select1', 'C3(载货汽车)', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2237', '109', 'select1', 'C4(三轮汽车)', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('2238', '109', 'select1', 'C5(残疾人专用)', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('2239', '109', 'select1', 'A(大型客车)', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('2240', '109', 'select1', 'A3(城市公交车)', '14');
INSERT INTO `bao_life_cate_attr` VALUES ('2242', '109', 'select2', '2000元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2243', '109', 'select2', '2000元—5000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2244', '109', 'select2', '5000元—8000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2245', '109', 'select2', '8000元以上', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2247', '111', 'select1', '健身', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2248', '111', 'select1', '瑜伽', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2249', '111', 'select1', '按摩', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2250', '111', 'select1', '足疗', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2251', '111', 'select1', '会所', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2252', '111', 'select1', 'KTV', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2253', '111', 'select1', '洗浴', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2254', '111', 'select1', '酒吧', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2255', '111', 'select1', '桌游', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2256', '111', 'select1', '演唱会', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('2257', '111', 'select1', '演出票务', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('2258', '111', 'select1', '电影票', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('2259', '111', 'select1', '其他', '14');
INSERT INTO `bao_life_cate_attr` VALUES ('2261', '112', 'select1', '印刷', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2262', '112', 'select1', '喷绘', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2263', '112', 'select1', '名片', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2264', '112', 'select1', '制卡', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2265', '112', 'select1', '灯箱', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2266', '112', 'select1', '易拉宝', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2267', '112', 'select1', '其他', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2269', '113', 'select1', '签证', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2270', '113', 'select1', '机票', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2271', '113', 'select1', '移民', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2273', '114', 'select1', '礼品定制', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2274', '114', 'select1', '商务礼品', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2275', '114', 'select1', '其它', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2277', '115', 'select1', '水电维修', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2278', '115', 'select1', '马桶维修', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2279', '115', 'select1', '防水补漏', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2280', '115', 'select1', '淋浴房维修', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2281', '115', 'select1', '家具维修', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2282', '115', 'select1', '门窗维修', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2283', '115', 'select1', '沙发维修', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2284', '115', 'select1', '其他', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2286', '116', 'select1', '美容', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2287', '116', 'select1', '减肥瘦身', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2288', '116', 'select1', '祛痘/祛斑', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2289', '116', 'select1', 'spa', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2290', '116', 'select1', '丰胸', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2291', '116', 'select1', '美发', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2292', '116', 'select1', '除皱', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2293', '116', 'select1', '脱毛', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2294', '116', 'select1', '美甲', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2297', '116', 'select2', '100元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2298', '116', 'select2', '100元—200元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2299', '116', 'select2', '200元—400元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2300', '116', 'select2', '400元—800元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2301', '116', 'select2', '800元—1200元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2302', '116', 'select2', '1200元—1500元', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2303', '116', 'select2', '1500元以上', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2305', '117', 'select1', '家政公司', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2306', '117', 'select1', '保姆', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2307', '117', 'select1', '东家', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2308', '117', 'select1', '其它', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2310', '117', 'select2', '钟点工', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2311', '117', 'select2', '做饭', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2312', '117', 'select2', '保姆', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2313', '117', 'select2', '照顾孩子', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2314', '117', 'select2', '住家阿姨', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2315', '117', 'select2', '照顾老人', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2316', '117', 'select2', '育婴师/育儿嫂', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2317', '117', 'select2', '月嫂', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2318', '117', 'select2', '催乳师', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2319', '117', 'select2', '护工/陪护', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('2320', '117', 'select2', '其它', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('2322', '118', 'select1', '网站建设', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2323', '118', 'select1', '网站推广', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2324', '118', 'select1', '网站维护/外包', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2325', '118', 'select1', '域名注册', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2326', '118', 'select1', '服务器', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2327', '118', 'select1', '企业邮箱', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2328', '118', 'select1', '其它', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2330', '119', 'select1', '绿植/盆栽', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2331', '119', 'select1', '园艺用品', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2332', '119', 'select1', '鲜花', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2333', '119', 'select1', '其它', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2335', '120', 'select1', '新娘化妆', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2336', '120', 'select1', '婚车租赁', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2337', '120', 'select1', '婚庆公司', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2338', '120', 'select1', '婚礼跟拍', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2339', '120', 'select1', '婚纱礼服', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2340', '120', 'select1', '司仪', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2341', '120', 'select1', '婚礼用品', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2342', '120', 'select1', '婚宴', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2343', '120', 'select1', '喜糖', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2344', '120', 'select1', '婚戒首饰', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('2345', '120', 'select1', '其他', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('2347', '120', 'select2', '500元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2348', '120', 'select2', '500元—1000元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2349', '120', 'select2', '1000元—2000元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2350', '120', 'select2', '2000元—4000元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2351', '120', 'select2', '4000元以上', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2353', '121', 'select1', '庆典公司', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2354', '121', 'select1', '场地布置', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2355', '121', 'select1', '灯光音响', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2356', '121', 'select1', '礼仪模特', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2357', '121', 'select1', '乐队演出', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2358', '121', 'select1', '司仪', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2359', '121', 'select1', '化妆', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2360', '121', 'select1', '其它', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2362', '122', 'select1', '债务纠纷', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2363', '122', 'select1', '合同纠纷', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2364', '122', 'select1', '交通事故', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2365', '122', 'select1', '离婚', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2366', '122', 'select1', '刑事辩护', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2367', '122', 'select1', '知识产权', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2368', '122', 'select1', '房产纠纷', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2369', '122', 'select1', '法律援助', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2370', '122', 'select1', '劳动纠纷', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2371', '122', 'select1', '其它', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('2373', '123', 'select1', '快餐', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2374', '123', 'select1', '送水', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2375', '123', 'select1', '食材配送', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2376', '123', 'select1', '宴会外卖', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2377', '123', 'select1', '承包食堂', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2378', '123', 'select1', '其它', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2380', '124', 'select1', '星级酒店', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2381', '124', 'select1', '经济型酒店', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2382', '124', 'select1', '宾馆', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2383', '124', 'select1', '青年旅舍', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2384', '124', 'select1', '中等', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2385', '124', 'select1', '度假村', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2386', '124', 'select1', '连锁酒店', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2387', '124', 'select1', '其它', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2389', '124', 'select2', '100元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2390', '124', 'select2', '100元—200元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2391', '124', 'select2', '200元—300元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2392', '124', 'select2', '300元—500元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2393', '124', 'select2', '500元—800元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2394', '124', 'select2', '800元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2396', '125', 'select1', '购物', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2397', '125', 'select1', '休闲娱乐', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2398', '125', 'select1', '论坛', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2399', '125', 'select1', '新闻', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2400', '125', 'select1', '交通地图', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2401', '125', 'select1', '游戏', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2402', '125', 'select1', 'KTV', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2403', '125', 'select1', '会所', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2404', '125', 'select1', '茶庄', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2405', '125', 'select1', '其他', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('2407', '126', 'select1', '笔译', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2408', '126', 'select1', '口译', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2409', '126', 'select1', '速记', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2410', '126', 'select1', '同声传译', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2411', '126', 'select1', '其它', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2413', '127', 'select1', '面部整形', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2414', '127', 'select1', '眼部整形', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2415', '127', 'select1', '鼻部整形', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2416', '127', 'select1', '唇部整形', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2417', '127', 'select1', '牙齿美容', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2418', '127', 'select1', '皮肤美容', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2419', '127', 'select1', '胸部整形', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2420', '127', 'select1', '微整形', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2421', '127', 'select1', '吸脂溶脂减肥', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2422', '127', 'select1', '私密整形', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('2423', '127', 'select1', '激光脱毛', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('2424', '127', 'select1', '假体取出', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('2425', '127', 'select1', '其他', '14');
INSERT INTO `bao_life_cate_attr` VALUES ('2427', '128', 'select1', '肾病科', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2428', '128', 'select1', '皮肤病科', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2429', '128', 'select1', '风湿科', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2430', '128', 'select1', '眼科', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2431', '128', 'select1', '骨科', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2432', '128', 'select1', '儿科', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2433', '128', 'select1', '泌尿科', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2434', '128', 'select1', '肝病科', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2435', '128', 'select1', '不孕不育', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2436', '128', 'select1', '妇科', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('2437', '128', 'select1', '性交障碍', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('2438', '128', 'select1', '性病科', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('2439', '128', 'select1', '内分泌科', '14');
INSERT INTO `bao_life_cate_attr` VALUES ('2440', '128', 'select1', '肿瘤科', '15');
INSERT INTO `bao_life_cate_attr` VALUES ('2441', '128', 'select1', '男科', '16');
INSERT INTO `bao_life_cate_attr` VALUES ('2442', '128', 'select1', '其它', '17');
INSERT INTO `bao_life_cate_attr` VALUES ('2444', '130', 'select1', '摄影', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2445', '130', 'select1', '翻译', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2446', '130', 'select1', '装卸工', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2447', '130', 'select1', '地勤', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2448', '130', 'select1', '杂务', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2449', '130', 'select1', '其他', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2451', '130', 'select2', '100元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2452', '130', 'select2', '100元—200元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2453', '130', 'select2', '200元—300元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2454', '130', 'select2', '300元—500元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2455', '130', 'select2', '500元以上', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2457', '131', 'select1', '中学理科', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2458', '131', 'select1', '小学英语', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2459', '131', 'select1', '中学文科', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2460', '131', 'select1', '文艺体育', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2461', '131', 'select1', '奥数', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2462', '131', 'select1', '其他', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2464', '131', 'select2', '30元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2465', '131', 'select2', '30元—50元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2466', '131', 'select2', '50元—70元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2467', '131', 'select2', '70元—100元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2468', '131', 'select2', '100元—150元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2469', '131', 'select2', '150元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2471', '132', 'select1', '派发', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2472', '132', 'select1', '促销', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2473', '132', 'select1', '其它 ', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2475', '132', 'select2', '10元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2476', '132', 'select2', '10元—20元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2477', '132', 'select2', '20元—30元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2478', '132', 'select2', '30元—70元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2479', '132', 'select2', '70元以上', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2481', '133', 'select1', '礼仪', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2482', '133', 'select1', '模特', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2483', '133', 'select1', '其它', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2485', '133', 'select2', '20元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2486', '133', 'select2', '20元—30元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2487', '133', 'select2', '30元—60元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2488', '133', 'select2', '60元—100元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2489', '133', 'select2', '100元—150元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2490', '133', 'select2', '150元以上', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2492', '134', 'select1', '10元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2493', '134', 'select1', '10元—20元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2494', '134', 'select1', '20元—40元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2495', '134', 'select1', '40元—70元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2496', '134', 'select1', '70元以上', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2498', '135', 'select1', '10元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2499', '135', 'select1', '10元—20元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2500', '135', 'select1', '20元—30元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2501', '135', 'select1', '30元以上', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2503', '135', 'select2', '上午', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2504', '135', 'select2', '中午', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2505', '135', 'select2', '下午', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2506', '135', 'select2', '晚间', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2507', '135', 'select2', '晚9点以后', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2508', '135', 'select2', '其它', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2510', '136', 'select1', '设计', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2511', '136', 'select1', '网站', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2512', '136', 'select1', '其它', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2514', '136', 'select2', '50元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2515', '136', 'select2', '50—100', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2516', '136', 'select2', '100—200', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2517', '136', 'select2', '200以上', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2519', '137', 'select1', '50元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2520', '137', 'select1', '50元—100元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2521', '137', 'select1', '100元—200元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2522', '137', 'select1', '200元以上', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2524', '138', 'select1', '50元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2525', '138', 'select1', '50元—100元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2526', '138', 'select1', '100元—200元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2527', '138', 'select1', '200元以上', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2529', '139', 'select1', '50元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2530', '139', 'select1', '50元—100元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2531', '139', 'select1', '100元—200元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2532', '139', 'select1', '200元—500元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2533', '139', 'select1', '500元以上', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2535', '140', 'select1', '50元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2536', '140', 'select1', '50元—100元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2537', '140', 'select1', '100元—200元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2538', '140', 'select1', '200元以上', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2540', '141', 'select1', '50元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2541', '141', 'select1', '50元—100元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2542', '141', 'select1', '100元—200元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2543', '141', 'select1', '200元以上', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2545', '142', 'select1', '泰迪', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2546', '142', 'select1', '金毛', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2547', '142', 'select1', '比熊', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2548', '142', 'select1', '萨摩耶', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2549', '142', 'select1', '阿拉斯加', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2550', '142', 'select1', '博美', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2551', '142', 'select1', '哈士奇', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2552', '142', 'select1', '拉布拉多', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2553', '142', 'select1', '德国牧羊犬', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2554', '142', 'select1', '松狮', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('2555', '142', 'select1', '秋田犬', '12');
INSERT INTO `bao_life_cate_attr` VALUES ('2556', '142', 'select1', '吉娃娃', '13');
INSERT INTO `bao_life_cate_attr` VALUES ('2557', '142', 'select1', '藏獒', '14');
INSERT INTO `bao_life_cate_attr` VALUES ('2558', '142', 'select1', '雪纳瑞', '15');
INSERT INTO `bao_life_cate_attr` VALUES ('2559', '142', 'select1', '贵宾', '16');
INSERT INTO `bao_life_cate_attr` VALUES ('2560', '142', 'select1', '边境牧羊犬', '17');
INSERT INTO `bao_life_cate_attr` VALUES ('2561', '142', 'select1', '巴哥犬', '18');
INSERT INTO `bao_life_cate_attr` VALUES ('2562', '142', 'select1', '古牧', '19');
INSERT INTO `bao_life_cate_attr` VALUES ('2563', '142', 'select1', '罗威纳', '20');
INSERT INTO `bao_life_cate_attr` VALUES ('2564', '142', 'select1', '银狐犬', '21');
INSERT INTO `bao_life_cate_attr` VALUES ('2565', '142', 'select1', '杜宾犬', '22');
INSERT INTO `bao_life_cate_attr` VALUES ('2566', '142', 'select1', '京巴', '23');
INSERT INTO `bao_life_cate_attr` VALUES ('2567', '142', 'select1', '比特', '24');
INSERT INTO `bao_life_cate_attr` VALUES ('2568', '142', 'select1', '苏格兰牧羊犬', '25');
INSERT INTO `bao_life_cate_attr` VALUES ('2569', '142', 'select1', '高加索犬', '26');
INSERT INTO `bao_life_cate_attr` VALUES ('2570', '142', 'select1', '灵缇犬', '27');
INSERT INTO `bao_life_cate_attr` VALUES ('2571', '142', 'select1', '西高地', '28');
INSERT INTO `bao_life_cate_attr` VALUES ('2572', '142', 'select1', '马犬', '29');
INSERT INTO `bao_life_cate_attr` VALUES ('2573', '142', 'select1', '喜乐蒂', '30');
INSERT INTO `bao_life_cate_attr` VALUES ('2574', '142', 'select1', '牛头梗', '31');
INSERT INTO `bao_life_cate_attr` VALUES ('2575', '142', 'select1', '雪橇犬', '32');
INSERT INTO `bao_life_cate_attr` VALUES ('2576', '142', 'select1', '西施犬', '33');
INSERT INTO `bao_life_cate_attr` VALUES ('2577', '142', 'select1', '大白熊', '34');
INSERT INTO `bao_life_cate_attr` VALUES ('2578', '142', 'select1', '卡斯罗', '35');
INSERT INTO `bao_life_cate_attr` VALUES ('2579', '142', 'select1', '沙皮犬', '36');
INSERT INTO `bao_life_cate_attr` VALUES ('2580', '142', 'select1', '蝴蝶犬', '37');
INSERT INTO `bao_life_cate_attr` VALUES ('2581', '142', 'select1', '伯恩山犬', '38');
INSERT INTO `bao_life_cate_attr` VALUES ('2582', '142', 'select1', '斗牛犬', '39');
INSERT INTO `bao_life_cate_attr` VALUES ('2583', '142', 'select1', '万能梗', '40');
INSERT INTO `bao_life_cate_attr` VALUES ('2584', '142', 'select1', '小鹿犬', '41');
INSERT INTO `bao_life_cate_attr` VALUES ('2585', '142', 'select1', '猎狐梗', '42');
INSERT INTO `bao_life_cate_attr` VALUES ('2586', '142', 'select1', '威玛烈犬', '43');
INSERT INTO `bao_life_cate_attr` VALUES ('2587', '142', 'select1', '柴犬', '44');
INSERT INTO `bao_life_cate_attr` VALUES ('2588', '142', 'select1', '斑点狗', '45');
INSERT INTO `bao_life_cate_attr` VALUES ('2589', '142', 'select1', '巴吉度猎犬', '46');
INSERT INTO `bao_life_cate_attr` VALUES ('2590', '142', 'select1', '阿富汗猎犬', '47');
INSERT INTO `bao_life_cate_attr` VALUES ('2591', '142', 'select1', '格力犬', '48');
INSERT INTO `bao_life_cate_attr` VALUES ('2592', '142', 'select1', '比格犬', '49');
INSERT INTO `bao_life_cate_attr` VALUES ('2593', '142', 'select1', '大丹犬', '50');
INSERT INTO `bao_life_cate_attr` VALUES ('2594', '142', 'select1', '腊肠犬', '51');
INSERT INTO `bao_life_cate_attr` VALUES ('2595', '142', 'select1', '可卡犬', '52');
INSERT INTO `bao_life_cate_attr` VALUES ('2596', '142', 'select1', '柯基犬', '53');
INSERT INTO `bao_life_cate_attr` VALUES ('2597', '142', 'select1', '圣伯纳', '54');
INSERT INTO `bao_life_cate_attr` VALUES ('2598', '142', 'select1', '其他', '55');
INSERT INTO `bao_life_cate_attr` VALUES ('2600', '142', 'select2', '100元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2601', '142', 'select2', '100元—300元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2602', '142', 'select2', '300元—500元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2603', '142', 'select2', '500元—800元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2604', '142', 'select2', '800元—1200元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2605', '142', 'select2', '1200元—2000元', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2606', '142', 'select2', '2000元以上', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2608', '142', 'select3', '公', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2609', '142', 'select3', '牧', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2611', '143', 'select1', '其他水族', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2612', '143', 'select1', '奇石盆景', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2613', '143', 'select1', '玩赏鸟', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2614', '143', 'select1', '观赏鱼', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2615', '143', 'select1', '其他', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2617', '143', 'select2', '100元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2618', '143', 'select2', '100元—300元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2619', '143', 'select2', '300元—500元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2620', '143', 'select2', '500元—800元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2621', '143', 'select2', '800元—1200元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2622', '143', 'select2', '1200元—2000元', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2623', '143', 'select2', '2000元以上', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2625', '144', 'select1', '赠送', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2626', '144', 'select1', '求赠', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2628', '144', 'select2', '狗', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2629', '144', 'select2', '猫', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2630', '144', 'select2', '鼠', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2631', '144', 'select2', '兔', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2632', '144', 'select2', '鸟', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2633', '144', 'select2', '水族', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2634', '144', 'select2', '蛇', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2635', '144', 'select2', '猪', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2636', '144', 'select2', '其他', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2638', '145', 'select1', '蓝猫', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2639', '145', 'select1', '短毛猫', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2640', '145', 'select1', '折耳猫', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2641', '145', 'select1', '加菲猫', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2642', '145', 'select1', '虎斑猫', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2643', '145', 'select1', '金吉拉', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2644', '145', 'select1', '波斯猫', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2645', '145', 'select1', '暹罗猫', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2646', '145', 'select1', '豹猫', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2647', '145', 'select1', '其他', '11');
INSERT INTO `bao_life_cate_attr` VALUES ('2649', '145', 'select2', '100元以下', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2650', '145', 'select2', '100元—300元', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2651', '145', 'select2', '300元—500元', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2652', '145', 'select2', '500元—800元', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2653', '145', 'select2', '800元—1200元', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2654', '145', 'select2', '1200元—2000元', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2655', '145', 'select2', '2000元以上', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2657', '145', 'select3', '公', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2658', '145', 'select3', '母', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2660', '146', 'select1', '配种', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2661', '146', 'select1', '训练', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2662', '146', 'select1', '寄养', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2663', '146', 'select1', '医院', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2664', '146', 'select1', '美容', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2665', '146', 'select1', '托运', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2666', '146', 'select1', '临时照看', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2667', '146', 'select1', '其他', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2669', '147', 'select1', '宠物衣服', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2670', '147', 'select1', '宠物除毛器', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2671', '147', 'select1', '宠物粮', '4');
INSERT INTO `bao_life_cate_attr` VALUES ('2672', '147', 'select1', '宠物链', '5');
INSERT INTO `bao_life_cate_attr` VALUES ('2673', '147', 'select1', '宠物鞋', '6');
INSERT INTO `bao_life_cate_attr` VALUES ('2674', '147', 'select1', '宠物配饰', '7');
INSERT INTO `bao_life_cate_attr` VALUES ('2675', '147', 'select1', '宠物其它应用', '8');
INSERT INTO `bao_life_cate_attr` VALUES ('2676', '147', 'select1', '宠物其它食品', '9');
INSERT INTO `bao_life_cate_attr` VALUES ('2677', '147', 'select1', '其它', '10');
INSERT INTO `bao_life_cate_attr` VALUES ('2679', '147', 'select2', '供应', '2');
INSERT INTO `bao_life_cate_attr` VALUES ('2680', '147', 'select2', '求购', '3');
INSERT INTO `bao_life_cate_attr` VALUES ('2681', '147', 'select3', '测试1', '100');
INSERT INTO `bao_life_cate_attr` VALUES ('2682', '147', 'select3', '测试2', '100');
INSERT INTO `bao_life_cate_attr` VALUES ('2683', '147', 'select3', '测试3', '100');

-- ----------------------------
-- Table structure for `bao_life_details`
-- ----------------------------
DROP TABLE IF EXISTS `bao_life_details`;
CREATE TABLE `bao_life_details` (
  `life_id` int(11) NOT NULL DEFAULT '0',
  `details` text,
  PRIMARY KEY (`life_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_life_details
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_life_love`
-- ----------------------------
DROP TABLE IF EXISTS `bao_life_love`;
CREATE TABLE `bao_life_love` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `life_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `life_id` (`life_id`,`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_life_love
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_life_photos`
-- ----------------------------
DROP TABLE IF EXISTS `bao_life_photos`;
CREATE TABLE `bao_life_photos` (
  `pic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `life_id` int(11) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_life_photos
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_life_report`
-- ----------------------------
DROP TABLE IF EXISTS `bao_life_report`;
CREATE TABLE `bao_life_report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `life_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_life_report
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_links`
-- ----------------------------
DROP TABLE IF EXISTS `bao_links`;
CREATE TABLE `bao_links` (
  `link_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `link_name` varchar(32) DEFAULT NULL,
  `link_url` varchar(128) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_links
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_lock`
-- ----------------------------
DROP TABLE IF EXISTS `bao_lock`;
CREATE TABLE `bao_lock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `t` char(8) DEFAULT '0' COMMENT 'UID 操作分钟级别锁',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`,`t`)
) ENGINE=MyISAM AUTO_INCREMENT=550 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_lock
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_market`
-- ----------------------------
DROP TABLE IF EXISTS `bao_market`;
CREATE TABLE `bao_market` (
  `market_id` int(11) NOT NULL AUTO_INCREMENT,
  `market_name` varchar(64) DEFAULT NULL,
  `area_id` smallint(5) DEFAULT '0',
  `business_id` smallint(5) DEFAULT '0',
  `logo` varchar(64) DEFAULT '0',
  `photo` varchar(64) DEFAULT '0',
  `tel` varchar(64) DEFAULT NULL,
  `contact` varchar(32) DEFAULT NULL,
  `addr` varchar(64) DEFAULT NULL,
  `summary` text,
  `orderby` int(11) DEFAULT '100',
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `view` int(11) DEFAULT '0',
  `tags` varchar(64) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`market_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_market
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_market_activity`
-- ----------------------------
DROP TABLE IF EXISTS `bao_market_activity`;
CREATE TABLE `bao_market_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `market_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `details` text,
  `views` int(11) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_market_activity
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_market_details`
-- ----------------------------
DROP TABLE IF EXISTS `bao_market_details`;
CREATE TABLE `bao_market_details` (
  `market_id` int(11) NOT NULL DEFAULT '0',
  `details` text,
  `business_time` varchar(32) DEFAULT '9:00-18:00',
  `near` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`market_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_market_details
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_market_enter`
-- ----------------------------
DROP TABLE IF EXISTS `bao_market_enter`;
CREATE TABLE `bao_market_enter` (
  `enter_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `market_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`enter_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_market_enter
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_market_favorites`
-- ----------------------------
DROP TABLE IF EXISTS `bao_market_favorites`;
CREATE TABLE `bao_market_favorites` (
  `favorites_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `market_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`favorites_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_market_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_market_pic`
-- ----------------------------
DROP TABLE IF EXISTS `bao_market_pic`;
CREATE TABLE `bao_market_pic` (
  `pic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `market_id` int(11) DEFAULT NULL,
  `pic` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`pic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_market_pic
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_menu`
-- ----------------------------
DROP TABLE IF EXISTS `bao_menu`;
CREATE TABLE `bao_menu` (
  `menu_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(32) DEFAULT NULL,
  `menu_action` varchar(64) DEFAULT NULL,
  `parent_id` smallint(5) DEFAULT '0',
  `orderby` tinyint(3) unsigned DEFAULT '100' COMMENT '1排序第一',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '0代表不直接显示',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=587 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_menu
-- ----------------------------
INSERT INTO `bao_menu` VALUES ('1', '系统', null, '0', '1', '1');
INSERT INTO `bao_menu` VALUES ('2', '设置', null, '0', '2', '1');
INSERT INTO `bao_menu` VALUES ('3', '商家', null, '0', '3', '1');
INSERT INTO `bao_menu` VALUES ('4', '会员', null, '0', '4', '1');
INSERT INTO `bao_menu` VALUES ('5', '商城', null, '0', '5', '1');
INSERT INTO `bao_menu` VALUES ('203', '支付方式', 'payment/index', '202', '1', '1');
INSERT INTO `bao_menu` VALUES ('7', '功能', null, '0', '6', '1');
INSERT INTO `bao_menu` VALUES ('8', '运营', null, '0', '10', '1');
INSERT INTO `bao_menu` VALUES ('9', '管理员管理', null, '1', '2', '1');
INSERT INTO `bao_menu` VALUES ('11', '后台菜单管理', null, '1', '1', '1');
INSERT INTO `bao_menu` VALUES ('12', '菜单列表', 'menu/index', '11', '2', '1');
INSERT INTO `bao_menu` VALUES ('13', '新增菜单', 'menu/create', '11', '3', '0');
INSERT INTO `bao_menu` VALUES ('14', '编辑菜单', 'menu/edit', '11', '1', '0');
INSERT INTO `bao_menu` VALUES ('15', '删除菜单', 'menu/delete', '11', '3', '0');
INSERT INTO `bao_menu` VALUES ('16', '更新菜单', 'menu/update', '11', '4', '0');
INSERT INTO `bao_menu` VALUES ('17', '批量菜单', 'menu/action', '11', '1', '0');
INSERT INTO `bao_menu` VALUES ('18', '角色管理', 'role/index', '9', '2', '1');
INSERT INTO `bao_menu` VALUES ('25', '新增角色', 'role/create', '9', '7', '0');
INSERT INTO `bao_menu` VALUES ('26', '编辑角色', 'role/edit', '9', '1', '0');
INSERT INTO `bao_menu` VALUES ('27', '删除角色', 'role/delete', '9', '2', '0');
INSERT INTO `bao_menu` VALUES ('28', '角色授权', 'role/auth', '9', '8', '0');
INSERT INTO `bao_menu` VALUES ('29', '管理员管理', 'admin/index', '9', '1', '1');
INSERT INTO `bao_menu` VALUES ('30', '新增管理员', 'admin/create', '9', '2', '0');
INSERT INTO `bao_menu` VALUES ('31', '编辑管理员', 'admin/edit', '9', '2', '0');
INSERT INTO `bao_menu` VALUES ('32', '删除管理员', 'admin/delete', '9', '4', '0');
INSERT INTO `bao_menu` VALUES ('33', '会员管理', null, '4', '1', '1');
INSERT INTO `bao_menu` VALUES ('34', '会员管理', 'user/index', '33', '1', '1');
INSERT INTO `bao_menu` VALUES ('35', '新增会员', 'user/create', '33', '2', '0');
INSERT INTO `bao_menu` VALUES ('36', '编辑会员', 'user/edit', '33', '6', '0');
INSERT INTO `bao_menu` VALUES ('37', '删除会员', 'user/delete', '33', '4', '0');
INSERT INTO `bao_menu` VALUES ('60', '预约订座', null, '3', '4', '1');
INSERT INTO `bao_menu` VALUES ('39', '缓存管理', null, '8', '6', '1');
INSERT INTO `bao_menu` VALUES ('40', '清空缓存', 'clean/cache', '39', '100', '1');
INSERT INTO `bao_menu` VALUES ('41', '审核会员', 'user/audit', '33', '3', '0');
INSERT INTO `bao_menu` VALUES ('42', '商家类别', null, '3', '1', '1');
INSERT INTO `bao_menu` VALUES ('43', '商家管理', null, '3', '2', '1');
INSERT INTO `bao_menu` VALUES ('44', '分类列表', 'shopcate/index', '42', '1', '1');
INSERT INTO `bao_menu` VALUES ('45', '新增分类', 'shopcate/create', '42', '2', '0');
INSERT INTO `bao_menu` VALUES ('46', '编辑分类', 'shopcate/edit', '42', '3', '0');
INSERT INTO `bao_menu` VALUES ('47', '删除分类', 'shopcate/delete', '42', '4', '0');
INSERT INTO `bao_menu` VALUES ('48', '更新排序', 'shopcate/update', '42', '5', '0');
INSERT INTO `bao_menu` VALUES ('49', '基本设置', null, '2', '1', '1');
INSERT INTO `bao_menu` VALUES ('50', '区域设置', null, '2', '3', '1');
INSERT INTO `bao_menu` VALUES ('51', '区域管理', 'area/index', '50', '11', '1');
INSERT INTO `bao_menu` VALUES ('52', '新增区域', 'area/create', '50', '12', '0');
INSERT INTO `bao_menu` VALUES ('53', '编辑区域', 'area/edit', '50', '13', '0');
INSERT INTO `bao_menu` VALUES ('54', '删除区域', 'area/delete', '50', '14', '0');
INSERT INTO `bao_menu` VALUES ('55', '商圈管理', 'business/index', '50', '15', '0');
INSERT INTO `bao_menu` VALUES ('56', '新增商圈', 'business/create', '50', '19', '0');
INSERT INTO `bao_menu` VALUES ('57', '编辑商圈', 'business/edit', '50', '18', '0');
INSERT INTO `bao_menu` VALUES ('58', '删除商圈', 'business/delete', '50', '17', '0');
INSERT INTO `bao_menu` VALUES ('277', '审核商家', 'shop/audit', '43', '100', '0');
INSERT INTO `bao_menu` VALUES ('61', '文章内容', null, '7', '2', '1');
INSERT INTO `bao_menu` VALUES ('62', '抢购', null, '5', '3', '1');
INSERT INTO `bao_menu` VALUES ('65', '友情链接', null, '8', '4', '1');
INSERT INTO `bao_menu` VALUES ('66', '广告管理', null, '8', '1', '1');
INSERT INTO `bao_menu` VALUES ('202', '支付设置', null, '2', '2', '1');
INSERT INTO `bao_menu` VALUES ('215', '微信', null, '0', '9', '1');
INSERT INTO `bao_menu` VALUES ('70', '友情链接', 'links/index', '65', '100', '1');
INSERT INTO `bao_menu` VALUES ('71', '添加友情', 'links/create', '65', '100', '0');
INSERT INTO `bao_menu` VALUES ('72', '修改友情', 'links/edit', '65', '100', '0');
INSERT INTO `bao_menu` VALUES ('73', '删除友情', 'links/delete', '65', '100', '0');
INSERT INTO `bao_menu` VALUES ('278', '积分兑换', 'integralexchange/index', '234', '2', '1');
INSERT INTO `bao_menu` VALUES ('279', '设为已完成兑换', 'integralexchange/audit', '234', '2', '0');
INSERT INTO `bao_menu` VALUES ('280', '设为热门分类', 'shopcate/hots', '42', '6', '0');
INSERT INTO `bao_menu` VALUES ('80', '站点设置', 'setting/site', '49', '1', '1');
INSERT INTO `bao_menu` VALUES ('81', '附件设置', 'setting/attachs', '49', '2', '1');
INSERT INTO `bao_menu` VALUES ('270', '选择分类', 'activitycate/select', '244', '100', '0');
INSERT INTO `bao_menu` VALUES ('85', '商家列表', 'shop/index', '43', '2', '1');
INSERT INTO `bao_menu` VALUES ('86', '新增商家', 'shop/create', '43', '100', '0');
INSERT INTO `bao_menu` VALUES ('87', '修改商家', 'shop/edit', '43', '100', '0');
INSERT INTO `bao_menu` VALUES ('88', '删除商家', 'shop/delete', '43', '100', '0');
INSERT INTO `bao_menu` VALUES ('90', '异步选择会员', 'user/select', '33', '2', '0');
INSERT INTO `bao_menu` VALUES ('91', '异步查询商圈', 'business/child', '50', '20', '0');
INSERT INTO `bao_menu` VALUES ('95', '预定合作', 'shop/yuyue', '43', '100', '0');
INSERT INTO `bao_menu` VALUES ('96', '商家新闻', 'shopnews/index', '228', '2', '1');
INSERT INTO `bao_menu` VALUES ('97', '发布新闻', 'shopnews/create', '228', '1', '1');
INSERT INTO `bao_menu` VALUES ('98', '修改新闻', 'shopnews/edit', '228', '3', '0');
INSERT INTO `bao_menu` VALUES ('99', '删除新闻', 'shopnews/delete', '228', '4', '0');
INSERT INTO `bao_menu` VALUES ('100', '审核新闻', 'shopnews/audit', '228', '5', '0');
INSERT INTO `bao_menu` VALUES ('101', '商家异步查询', 'shop/select', '43', '100', '0');
INSERT INTO `bao_menu` VALUES ('102', '商家图片', 'shoppic/index', '43', '41', '1');
INSERT INTO `bao_menu` VALUES ('103', '删除图片', 'shoppic/delete', '43', '42', '0');
INSERT INTO `bao_menu` VALUES ('104', '异步查询', 'articlecate/child', '61', '3', '0');
INSERT INTO `bao_menu` VALUES ('105', '更新排序', 'articlecate/update', '61', '4', '0');
INSERT INTO `bao_menu` VALUES ('106', '删除分类', 'articlecate/delete', '61', '5', '0');
INSERT INTO `bao_menu` VALUES ('107', '编辑分类', 'articlecate/edit', '61', '6', '0');
INSERT INTO `bao_menu` VALUES ('108', '新增分类', 'articlecate/create', '61', '7', '0');
INSERT INTO `bao_menu` VALUES ('109', '分类列表', 'articlecate/index', '61', '1', '1');
INSERT INTO `bao_menu` VALUES ('110', '文章管理', 'article/index', '61', '2', '1');
INSERT INTO `bao_menu` VALUES ('111', '新增文章', 'article/create', '61', '8', '0');
INSERT INTO `bao_menu` VALUES ('112', '编辑文章', 'article/edit', '61', '9', '0');
INSERT INTO `bao_menu` VALUES ('113', '删除文章', 'article/delete', '61', '10', '0');
INSERT INTO `bao_menu` VALUES ('114', '贴吧管理', null, '7', '2', '1');
INSERT INTO `bao_menu` VALUES ('115', '敏感词过滤', 'sensitive/index', '49', '3', '1');
INSERT INTO `bao_menu` VALUES ('116', '新增敏感词', 'sensitive/create', '49', '4', '0');
INSERT INTO `bao_menu` VALUES ('117', '编辑敏感词', 'sensitive/edit', '49', '5', '0');
INSERT INTO `bao_menu` VALUES ('118', '删除敏感词', 'sensitive/delete', '49', '6', '0');
INSERT INTO `bao_menu` VALUES ('119', '帖子分享', 'post/index', '114', '1', '1');
INSERT INTO `bao_menu` VALUES ('120', '新增帖子', 'post/create', '114', '2', '0');
INSERT INTO `bao_menu` VALUES ('121', '编辑帖子', 'post/edit', '114', '3', '0');
INSERT INTO `bao_menu` VALUES ('122', '删除帖子', 'post/delete', '114', '4', '0');
INSERT INTO `bao_menu` VALUES ('123', '审核帖子', 'post/audit', '114', '5', '0');
INSERT INTO `bao_menu` VALUES ('509', '会员提现', null, '4', '100', '1');
INSERT INTO `bao_menu` VALUES ('125', '抢购列表', 'tuan/index', '62', '1', '1');
INSERT INTO `bao_menu` VALUES ('126', '新增抢购', 'tuan/create', '62', '14', '0');
INSERT INTO `bao_menu` VALUES ('127', '编辑抢购', 'tuan/edit', '62', '11', '0');
INSERT INTO `bao_menu` VALUES ('128', '删除抢购', 'tuan/delete', '62', '12', '0');
INSERT INTO `bao_menu` VALUES ('129', '审核抢购', 'tuan/audit', '62', '13', '0');
INSERT INTO `bao_menu` VALUES ('130', '订单管理', 'tuanorder/index', '62', '20', '1');
INSERT INTO `bao_menu` VALUES ('206', '支付日志', 'paymentlogs/index', '202', '4', '1');
INSERT INTO `bao_menu` VALUES ('134', '优惠券', null, '5', '5', '1');
INSERT INTO `bao_menu` VALUES ('135', '优惠券管理', 'coupon/index', '134', '1', '1');
INSERT INTO `bao_menu` VALUES ('136', '新增优惠券', 'coupon/create', '134', '2', '0');
INSERT INTO `bao_menu` VALUES ('137', '编辑优惠券', 'coupon/edit', '134', '3', '0');
INSERT INTO `bao_menu` VALUES ('138', '删除优惠券', 'coupon/delete', '134', '4', '0');
INSERT INTO `bao_menu` VALUES ('139', '审核优惠券', 'coupon/audit', '134', '5', '0');
INSERT INTO `bao_menu` VALUES ('140', '优惠券下载', 'coupondownload/index', '134', '6', '1');
INSERT INTO `bao_menu` VALUES ('142', '回复帖子', 'postreply/index', '114', '11', '1');
INSERT INTO `bao_menu` VALUES ('143', '新增回复', 'postreply/create', '114', '12', '0');
INSERT INTO `bao_menu` VALUES ('144', '编辑回复', 'postreply/edit', '114', '13', '0');
INSERT INTO `bao_menu` VALUES ('145', '删除回复', 'postreply/delete', '114', '14', '0');
INSERT INTO `bao_menu` VALUES ('146', '审核回复', 'postreply/audit', '114', '15', '0');
INSERT INTO `bao_menu` VALUES ('156', '短信设置', 'setting/sms', '49', '11', '1');
INSERT INTO `bao_menu` VALUES ('157', '邮件设置', 'setting/mail', '49', '12', '1');
INSERT INTO `bao_menu` VALUES ('158', '模版管理', null, '2', '4', '1');
INSERT INTO `bao_menu` VALUES ('159', '短信模版', 'sms/index', '158', '11', '1');
INSERT INTO `bao_menu` VALUES ('160', '新增短信模版', 'sms/create', '158', '12', '0');
INSERT INTO `bao_menu` VALUES ('161', '编辑短信模版', 'sms/edit', '158', '13', '0');
INSERT INTO `bao_menu` VALUES ('162', '关闭短信模版', 'sms/delete', '158', '14', '0');
INSERT INTO `bao_menu` VALUES ('163', '邮件模版', 'email/index', '158', '21', '1');
INSERT INTO `bao_menu` VALUES ('164', '新增邮件模版', 'email/create', '158', '22', '0');
INSERT INTO `bao_menu` VALUES ('165', '编辑邮件模版', 'email/edit', '158', '23', '0');
INSERT INTO `bao_menu` VALUES ('166', '关闭邮件模版', 'email/delete', '158', '24', '0');
INSERT INTO `bao_menu` VALUES ('167', 'SEO模版', 'seo/index', '158', '31', '1');
INSERT INTO `bao_menu` VALUES ('168', '新增SEO模版', 'seo/create', '158', '100', '0');
INSERT INTO `bao_menu` VALUES ('169', '编辑SEO模版', 'seo/edit', '158', '100', '0');
INSERT INTO `bao_menu` VALUES ('170', '删除SEO模版', 'seo/delete', '158', '100', '0');
INSERT INTO `bao_menu` VALUES ('171', '网站风格', 'template/index', '158', '40', '1');
INSERT INTO `bao_menu` VALUES ('172', '安装风格', 'template/install', '158', '42', '0');
INSERT INTO `bao_menu` VALUES ('173', '卸载风格', 'template/uninstall', '158', '41', '0');
INSERT INTO `bao_menu` VALUES ('174', '配置风格', 'template/setting', '158', '43', '0');
INSERT INTO `bao_menu` VALUES ('175', '批量开启短信', 'sms/audit', '158', '15', '0');
INSERT INTO `bao_menu` VALUES ('176', '开启邮件模版', 'email/audit', '158', '25', '0');
INSERT INTO `bao_menu` VALUES ('177', '商家点评', 'shopdianping/index', '230', '22', '1');
INSERT INTO `bao_menu` VALUES ('178', '发布点评', 'shopdianping/create', '230', '21', '1');
INSERT INTO `bao_menu` VALUES ('179', '编辑点评', 'shopdianping/edit', '230', '23', '0');
INSERT INTO `bao_menu` VALUES ('180', '删除点评', 'shopdianping/delete', '230', '24', '0');
INSERT INTO `bao_menu` VALUES ('181', '商家预约', 'shopyuyue/index', '60', '31', '1');
INSERT INTO `bao_menu` VALUES ('182', '新增预约', 'shopyuyue/create', '60', '32', '0');
INSERT INTO `bao_menu` VALUES ('183', '编辑预约', 'shopyuyue/edit', '60', '33', '0');
INSERT INTO `bao_menu` VALUES ('184', '删除预约', 'shopyuyue/delete', '60', '34', '0');
INSERT INTO `bao_menu` VALUES ('185', '系统文章', 'systemcontent/index', '61', '21', '1');
INSERT INTO `bao_menu` VALUES ('186', '新增系统文章', 'systemcontent/create', '61', '22', '0');
INSERT INTO `bao_menu` VALUES ('187', '编辑系统文章', 'systemcontent/edit', '61', '23', '0');
INSERT INTO `bao_menu` VALUES ('188', '删除系统文章', 'systemcontent/delete', '61', '24', '0');
INSERT INTO `bao_menu` VALUES ('189', '广告位设置', 'adsite/index', '66', '1', '1');
INSERT INTO `bao_menu` VALUES ('494', '人才招聘', null, '487', '10', '1');
INSERT INTO `bao_menu` VALUES ('495', '人才招聘', 'work/index', '494', '1', '1');
INSERT INTO `bao_menu` VALUES ('193', '广告管理', 'ad/index', '66', '11', '0');
INSERT INTO `bao_menu` VALUES ('194', '新增广告', 'ad/create', '66', '12', '0');
INSERT INTO `bao_menu` VALUES ('195', '编辑广告', 'ad/edit', '66', '13', '0');
INSERT INTO `bao_menu` VALUES ('196', '删除广告', 'ad/delete', '66', '14', '0');
INSERT INTO `bao_menu` VALUES ('197', '设为默认模版', 'template/df', '158', '44', '0');
INSERT INTO `bao_menu` VALUES ('198', '新增挂件', 'template/add', '158', '45', '0');
INSERT INTO `bao_menu` VALUES ('199', '编辑挂件', 'template/edit', '158', '46', '0');
INSERT INTO `bao_menu` VALUES ('200', '删除挂件', 'template/delete', '158', '47', '0');
INSERT INTO `bao_menu` VALUES ('201', '更新模版', 'template/update', '158', '48', '0');
INSERT INTO `bao_menu` VALUES ('204', '安装支付', 'payment/install', '202', '2', '0');
INSERT INTO `bao_menu` VALUES ('205', '卸载支付', 'payment/uninstall', '202', '3', '0');
INSERT INTO `bao_menu` VALUES ('259', '积分设置', 'setting/integral', '49', '13', '1');
INSERT INTO `bao_menu` VALUES ('441', '资金记录', 'shopmoney/index', '440', '1', '1');
INSERT INTO `bao_menu` VALUES ('209', '抢购券管理', 'tuancode/index', '62', '33', '1');
INSERT INTO `bao_menu` VALUES ('210', '删除抢购券', 'tuancode/delete', '62', '34', '0');
INSERT INTO `bao_menu` VALUES ('211', '积分日志', 'userintegrallogs/index', '291', '40', '1');
INSERT INTO `bao_menu` VALUES ('212', '增加积分', 'user/integral', '33', '8', '1');
INSERT INTO `bao_menu` VALUES ('213', '金块日志', 'usergoldlogs/index', '291', '42', '1');
INSERT INTO `bao_menu` VALUES ('214', '增加金块', 'user/gold', '33', '9', '0');
INSERT INTO `bao_menu` VALUES ('216', '微信O2O', null, '215', '1', '1');
INSERT INTO `bao_menu` VALUES ('217', '商家微信', null, '215', '2', '1');
INSERT INTO `bao_menu` VALUES ('218', '微信配置', 'setting/weixin', '216', '1', '1');
INSERT INTO `bao_menu` VALUES ('219', '微信关键字', 'weixinkeyword/index', '216', '2', '1');
INSERT INTO `bao_menu` VALUES ('220', '新增关键字', 'weixinkeyword/create', '216', '3', '0');
INSERT INTO `bao_menu` VALUES ('221', '编辑关键字', 'weixinkeyword/edit', '216', '4', '0');
INSERT INTO `bao_menu` VALUES ('222', '删除关键字', 'weixinkeyword/delete', '216', '5', '0');
INSERT INTO `bao_menu` VALUES ('223', '商家商品', 'goods/index', '231', '51', '1');
INSERT INTO `bao_menu` VALUES ('224', '新增商品', 'goods/create', '231', '52', '0');
INSERT INTO `bao_menu` VALUES ('225', '编辑商品', 'goods/edit', '231', '53', '0');
INSERT INTO `bao_menu` VALUES ('226', '删除商品', 'goods/delete', '231', '54', '0');
INSERT INTO `bao_menu` VALUES ('227', '审核商品', 'goods/audit', '231', '55', '0');
INSERT INTO `bao_menu` VALUES ('228', '商家新闻', null, '3', '6', '1');
INSERT INTO `bao_menu` VALUES ('230', '商家点评', null, '3', '5', '1');
INSERT INTO `bao_menu` VALUES ('231', '商家产品', null, '5', '1', '1');
INSERT INTO `bao_menu` VALUES ('486', '榜单分类', 'billcate/index', '483', '1', '1');
INSERT INTO `bao_menu` VALUES ('234', '积分商城', null, '5', '6', '1');
INSERT INTO `bao_menu` VALUES ('235', '商品列表', 'integralgoods/index', '234', '1', '1');
INSERT INTO `bao_menu` VALUES ('236', '新增商品', 'integralgoods/create', '234', '1', '0');
INSERT INTO `bao_menu` VALUES ('237', '修改商品', 'integralgoods/edit', '234', '1', '0');
INSERT INTO `bao_menu` VALUES ('238', '删除商品', 'integralgoods/delete', '234', '1', '0');
INSERT INTO `bao_menu` VALUES ('239', '审核商品', 'integralgoods/audit', '234', '1', '0');
INSERT INTO `bao_menu` VALUES ('240', '会员等级', 'userrank/index', '33', '21', '1');
INSERT INTO `bao_menu` VALUES ('241', '新增等级', 'userrank/create', '33', '22', '0');
INSERT INTO `bao_menu` VALUES ('242', '编辑等级', 'userrank/edit', '33', '23', '0');
INSERT INTO `bao_menu` VALUES ('243', '删除等级', 'userrank/delete', '33', '24', '0');
INSERT INTO `bao_menu` VALUES ('244', '活动管理', null, '7', '5', '1');
INSERT INTO `bao_menu` VALUES ('245', '活动列表', 'activity/index', '244', '2', '1');
INSERT INTO `bao_menu` VALUES ('246', '活动添加', 'activity/create', '244', '100', '0');
INSERT INTO `bao_menu` VALUES ('247', '活动审核', 'activity/audit', '244', '100', '0');
INSERT INTO `bao_menu` VALUES ('248', '活动编辑', 'activity/edit', '244', '100', '0');
INSERT INTO `bao_menu` VALUES ('249', '活动删除', 'activity/delete', '244', '100', '0');
INSERT INTO `bao_menu` VALUES ('262', '新增地址', 'useraddr/create', '260', '2', '0');
INSERT INTO `bao_menu` VALUES ('260', '收货地址', null, '4', '4', '1');
INSERT INTO `bao_menu` VALUES ('261', '收货地址', 'useraddr/index', '260', '1', '1');
INSERT INTO `bao_menu` VALUES ('255', '分类列表', 'activitycate/index', '244', '1', '1');
INSERT INTO `bao_menu` VALUES ('256', '添加分类', 'activitycate/create', '244', '100', '0');
INSERT INTO `bao_menu` VALUES ('257', '编辑分类', 'activitycate/edit', '244', '100', '0');
INSERT INTO `bao_menu` VALUES ('258', '删除分类', 'activitycate/delete', '244', '100', '0');
INSERT INTO `bao_menu` VALUES ('263', '编辑地址', 'useraddr/edit', '260', '3', '0');
INSERT INTO `bao_menu` VALUES ('264', '删除地址', 'useraddr/delete', '260', '4', '0');
INSERT INTO `bao_menu` VALUES ('265', '商品类别', 'goodscate/index', '231', '1', '1');
INSERT INTO `bao_menu` VALUES ('266', '新增分类', 'goodscate/create', '231', '2', '0');
INSERT INTO `bao_menu` VALUES ('267', '编辑分类', 'goodscate/edit', '231', '3', '0');
INSERT INTO `bao_menu` VALUES ('268', '更新分类', 'goodscate/update', '231', '4', '0');
INSERT INTO `bao_menu` VALUES ('269', '删除分类', 'goodscate/delete', '231', '5', '0');
INSERT INTO `bao_menu` VALUES ('271', '添加子分类', 'activitycate/child', '244', '100', '0');
INSERT INTO `bao_menu` VALUES ('274', '微信消息列表', 'weixinmsg/index', '216', '11', '1');
INSERT INTO `bao_menu` VALUES ('275', '第三方登录', 'setting/connect', '33', '10', '1');
INSERT INTO `bao_menu` VALUES ('281', '热门商圈', 'business/hots', '50', '16', '0');
INSERT INTO `bao_menu` VALUES ('282', '统计报表', null, '8', '5', '1');
INSERT INTO `bao_menu` VALUES ('283', '团购数分析', 'tongji/index', '282', '11', '1');
INSERT INTO `bao_menu` VALUES ('296', '抢购券退款', 'tuancode/refund', '62', '34', '1');
INSERT INTO `bao_menu` VALUES ('289', '团购金额', 'tongji/money', '282', '12', '1');
INSERT INTO `bao_menu` VALUES ('290', '威望设置', 'setting/prestige', '49', '14', '1');
INSERT INTO `bao_menu` VALUES ('291', '会员日志', null, '4', '5', '1');
INSERT INTO `bao_menu` VALUES ('292', '余额日志', 'usermoneylogs/index', '291', '43', '1');
INSERT INTO `bao_menu` VALUES ('297', '抢购券退款操作', 'tuancode/refunding', '62', '35', '0');
INSERT INTO `bao_menu` VALUES ('298', '抢购券过期', 'tuancode/overdue', '62', '35', '1');
INSERT INTO `bao_menu` VALUES ('299', '抢购券过期退款操作', 'tuancode/overdueing', '62', '35', '0');
INSERT INTO `bao_menu` VALUES ('490', '生成卡密', 'usercard/create', '488', '2', '0');
INSERT INTO `bao_menu` VALUES ('303', '手机功能', null, '487', '7', '1');
INSERT INTO `bao_menu` VALUES ('305', '新增发现', 'found/create', '303', '2', '0');
INSERT INTO `bao_menu` VALUES ('306', '编辑发现', 'found/edit', '303', '3', '0');
INSERT INTO `bao_menu` VALUES ('307', '删除发现', 'found/delete', '303', '4', '0');
INSERT INTO `bao_menu` VALUES ('308', '审核发现', 'found/audit', '303', '5', '0');
INSERT INTO `bao_menu` VALUES ('309', '消息管理', 'msg/index', '303', '6', '1');
INSERT INTO `bao_menu` VALUES ('310', '新增消息', 'msg/create', '303', '7', '0');
INSERT INTO `bao_menu` VALUES ('311', '编辑消息', 'msg/edit', '303', '8', '0');
INSERT INTO `bao_menu` VALUES ('312', '删除消息', 'msg/delete', '303', '9', '0');
INSERT INTO `bao_menu` VALUES ('313', '报名管理', 'activitysign/index', '244', '3', '1');
INSERT INTO `bao_menu` VALUES ('314', '商城订单', null, '5', '7', '1');
INSERT INTO `bao_menu` VALUES ('315', '订单汇总', 'order/index', '314', '1', '1');
INSERT INTO `bao_menu` VALUES ('316', '等待捡货', 'order/wait', '314', '2', '1');
INSERT INTO `bao_menu` VALUES ('317', '捡货单管理', 'order/picks', '314', '4', '1');
INSERT INTO `bao_menu` VALUES ('318', '发货管理', 'order/delivery', '314', '5', '1');
INSERT INTO `bao_menu` VALUES ('319', '加入捡货单', 'order/pick', '314', '100', '0');
INSERT INTO `bao_menu` VALUES ('320', '清空拣货单', 'order/clean', '314', '100', '0');
INSERT INTO `bao_menu` VALUES ('321', '创建捡货单', 'order/create', '314', '100', '0');
INSERT INTO `bao_menu` VALUES ('322', '捡货单详情', 'order/pickdetail', '314', '100', '0');
INSERT INTO `bao_menu` VALUES ('324', '打印配送单', 'order/send', '314', '100', '0');
INSERT INTO `bao_menu` VALUES ('325', '订单发货', 'order/distribution', '314', '100', '0');
INSERT INTO `bao_menu` VALUES ('326', '增加余额', 'user/money', '33', '100', '0');
INSERT INTO `bao_menu` VALUES ('327', '新增商家资金', 'shopmoney/create', '43', '100', '0');
INSERT INTO `bao_menu` VALUES ('328', '商家审核列表', 'shop/apply', '43', '3', '1');
INSERT INTO `bao_menu` VALUES ('329', '分类列表', 'sharecate/index', '114', '1', '1');
INSERT INTO `bao_menu` VALUES ('330', '添加分类', 'sharecate/create', '114', '100', '0');
INSERT INTO `bao_menu` VALUES ('331', '选择分类', 'sharecate/select', '114', '100', '0');
INSERT INTO `bao_menu` VALUES ('332', '添加子分类', 'sharecate/child', '114', '100', '0');
INSERT INTO `bao_menu` VALUES ('333', '编辑分类', 'sharecate/edit', '114', '100', '0');
INSERT INTO `bao_menu` VALUES ('334', '删除分类', 'sharecate/delete', '114', '100', '0');
INSERT INTO `bao_menu` VALUES ('335', '频道', null, '0', '8', '1');
INSERT INTO `bao_menu` VALUES ('336', '自定义菜单', 'setting/weixinmenu', '216', '6', '1');
INSERT INTO `bao_menu` VALUES ('337', '删除微信消息', 'weixinmsg/delete', '216', '12', '0');
INSERT INTO `bao_menu` VALUES ('338', '分类信息', null, '335', '1', '1');
INSERT INTO `bao_menu` VALUES ('339', '分类管理', 'lifecate/index', '338', '1', '1');
INSERT INTO `bao_menu` VALUES ('340', '新增分类', 'lifecate/create', '338', '2', '0');
INSERT INTO `bao_menu` VALUES ('341', '编辑分类', 'lifecate/edit', '338', '3', '0');
INSERT INTO `bao_menu` VALUES ('342', '删除分类', 'lifecate/delete', '338', '4', '0');
INSERT INTO `bao_menu` VALUES ('343', '属性设置', 'lifecate/setting', '338', '5', '0');
INSERT INTO `bao_menu` VALUES ('344', '抢购分类', null, '5', '2', '1');
INSERT INTO `bao_menu` VALUES ('345', '分类列表', 'tuancate/index', '344', '1', '1');
INSERT INTO `bao_menu` VALUES ('346', '添加分类', 'tuancate/create', '344', '100', '0');
INSERT INTO `bao_menu` VALUES ('347', '添加子分类', 'tuancate/child', '344', '100', '0');
INSERT INTO `bao_menu` VALUES ('348', '删除分类', 'tuancate/delete', '344', '100', '0');
INSERT INTO `bao_menu` VALUES ('349', '编辑分类', 'tuancate/edit', '344', '100', '0');
INSERT INTO `bao_menu` VALUES ('350', '选择分类', 'tuancate/select', '344', '100', '0');
INSERT INTO `bao_menu` VALUES ('351', '删除属性', 'lifecate/delattr', '338', '6', '0');
INSERT INTO `bao_menu` VALUES ('352', '信息列表', 'life/index', '338', '11', '1');
INSERT INTO `bao_menu` VALUES ('353', '新增信息', 'life/create', '338', '12', '0');
INSERT INTO `bao_menu` VALUES ('354', '编辑信息', 'life/edit', '338', '13', '0');
INSERT INTO `bao_menu` VALUES ('355', '删除信息', 'life/delete', '338', '14', '0');
INSERT INTO `bao_menu` VALUES ('356', '审核信息', 'life/audit', '338', '15', '0');
INSERT INTO `bao_menu` VALUES ('357', '分类异步查询', 'lifecate/ajax', '338', '7', '0');
INSERT INTO `bao_menu` VALUES ('358', '抢购点评', null, '5', '4', '1');
INSERT INTO `bao_menu` VALUES ('359', '抢购点评', 'tuandianping/index', '358', '2', '1');
INSERT INTO `bao_menu` VALUES ('360', '发布点评', 'tuandianping/create', '358', '1', '1');
INSERT INTO `bao_menu` VALUES ('361', '删除点评', 'tuandianping/delete', '358', '100', '0');
INSERT INTO `bao_menu` VALUES ('362', '编辑点评', 'tuandianping/edit', '358', '100', '0');
INSERT INTO `bao_menu` VALUES ('363', '插件', null, '0', '7', '1');
INSERT INTO `bao_menu` VALUES ('364', '投票插件', null, '363', '2', '1');
INSERT INTO `bao_menu` VALUES ('365', '投票列表', 'vote/index', '364', '1', '1');
INSERT INTO `bao_menu` VALUES ('366', '投票添加', 'vote/create', '364', '100', '0');
INSERT INTO `bao_menu` VALUES ('367', '投票编辑', 'vote/edit', '364', '100', '0');
INSERT INTO `bao_menu` VALUES ('368', '删除投票', 'vote/delete', '364', '100', '0');
INSERT INTO `bao_menu` VALUES ('517', '新增站点', 'city/create', '50', '2', '0');
INSERT INTO `bao_menu` VALUES ('519', '删除站点', 'city/delete', '50', '4', '0');
INSERT INTO `bao_menu` VALUES ('518', '编辑站点', 'city/edit', '50', '3', '0');
INSERT INTO `bao_menu` VALUES ('375', '查看结果', 'vote/result', '364', '2', '0');
INSERT INTO `bao_menu` VALUES ('499', '家政配置', 'setting/housework', '498', '1', '1');
INSERT INTO `bao_menu` VALUES ('527', '微信模板消息', 'weixintmpl/index', '216', '13', '1');
INSERT INTO `bao_menu` VALUES ('394', '抽奖插件', null, '363', '3', '1');
INSERT INTO `bao_menu` VALUES ('387', '关键字列表', 'shopweixinkeyword/index', '217', '100', '1');
INSERT INTO `bao_menu` VALUES ('388', '新增关键字', 'shopweixinkeyword/create', '217', '100', '0');
INSERT INTO `bao_menu` VALUES ('389', '编辑关键字', 'shopweixinkeyword/edit', '217', '100', '0');
INSERT INTO `bao_menu` VALUES ('390', '删除关键字', 'shopweixinkeyword/delete', '217', '100', '0');
INSERT INTO `bao_menu` VALUES ('391', '群发消息', 'weixinkeyword/mass', '216', '7', '1');
INSERT INTO `bao_menu` VALUES ('392', '货到付款捡货', 'order/wait2', '314', '3', '1');
INSERT INTO `bao_menu` VALUES ('395', '抽奖管理', 'award/index', '394', '1', '1');
INSERT INTO `bao_menu` VALUES ('396', '新增抽奖', 'award/create', '394', '2', '0');
INSERT INTO `bao_menu` VALUES ('397', '编辑抽奖', 'award/edit', '394', '3', '0');
INSERT INTO `bao_menu` VALUES ('398', '删除抽奖', 'award/delete', '394', '4', '0');
INSERT INTO `bao_menu` VALUES ('399', '启用抽奖', 'award/online', '394', '5', '0');
INSERT INTO `bao_menu` VALUES ('400', '奖品设置', 'awardgoods/index', '394', '6', '0');
INSERT INTO `bao_menu` VALUES ('401', '新增奖品', 'awardgoods/create', '394', '7', '0');
INSERT INTO `bao_menu` VALUES ('402', '编辑奖品', 'awardgoods/edit', '394', '8', '0');
INSERT INTO `bao_menu` VALUES ('403', '删除奖品', 'awardgoods/delete', '394', '9', '0');
INSERT INTO `bao_menu` VALUES ('404', '中奖名单', 'awardwinning/index', '394', '10', '0');
INSERT INTO `bao_menu` VALUES ('405', '新增中奖', 'awardwinning/create', '394', '11', '0');
INSERT INTO `bao_menu` VALUES ('406', '编辑中奖', 'awardwinning/edit', '394', '12', '0');
INSERT INTO `bao_menu` VALUES ('407', '删除中奖', 'awardwinning/delete', '394', '13', '0');
INSERT INTO `bao_menu` VALUES ('408', '关键字管理', null, '8', '3', '1');
INSERT INTO `bao_menu` VALUES ('410', '关键字列表', 'keyword/index', '408', '1', '1');
INSERT INTO `bao_menu` VALUES ('411', '添加关键字', 'keyword/create', '408', '100', '0');
INSERT INTO `bao_menu` VALUES ('412', '编辑关键字', 'keyword/edit', '408', '100', '0');
INSERT INTO `bao_menu` VALUES ('413', '删除关键字', 'keyword/delete', '408', '100', '0');
INSERT INTO `bao_menu` VALUES ('414', '手机配置', 'setting/mobile', '303', '10', '1');
INSERT INTO `bao_menu` VALUES ('418', '设置热门分类', 'life/hots', '338', '4', '0');
INSERT INTO `bao_menu` VALUES ('416', '外卖', null, '335', '3', '1');
INSERT INTO `bao_menu` VALUES ('516', '城市站点', 'city/index', '50', '1', '1');
INSERT INTO `bao_menu` VALUES ('419', '举报信息', 'lifereport/index', '338', '20', '1');
INSERT INTO `bao_menu` VALUES ('498', '家政服务', null, '487', '11', '1');
INSERT INTO `bao_menu` VALUES ('421', '商家列表', 'ele/index', '416', '2', '1');
INSERT INTO `bao_menu` VALUES ('422', '新增商家', 'ele/create', '416', '2', '0');
INSERT INTO `bao_menu` VALUES ('423', '编辑商家', 'ele/edit', '416', '3', '0');
INSERT INTO `bao_menu` VALUES ('424', '删除商家', 'ele/delete', '416', '4', '0');
INSERT INTO `bao_menu` VALUES ('425', '打样管理', 'ele/opened', '416', '4', '0');
INSERT INTO `bao_menu` VALUES ('489', '会员卡管理', 'usercard/index', '488', '1', '1');
INSERT INTO `bao_menu` VALUES ('487', '手机', null, '0', '9', '1');
INSERT INTO `bao_menu` VALUES ('488', '会员卡管理', null, '4', '2', '1');
INSERT INTO `bao_menu` VALUES ('430', '菜单管理', 'eleproduct/index', '416', '12', '1');
INSERT INTO `bao_menu` VALUES ('431', '新增菜单', 'eleproduct/create', '416', '12', '0');
INSERT INTO `bao_menu` VALUES ('432', '编辑菜单', 'eleproduct/edit', '416', '12', '0');
INSERT INTO `bao_menu` VALUES ('433', '删除菜单', 'eleproduct/delete', '416', '12', '0');
INSERT INTO `bao_menu` VALUES ('434', '进入商家中心', 'shop/login', '43', '100', '0');
INSERT INTO `bao_menu` VALUES ('435', '卡密管理', 'rechargecard/index', '202', '5', '1');
INSERT INTO `bao_menu` VALUES ('436', '添加充值卡', 'rechargecard/create', '202', '100', '0');
INSERT INTO `bao_menu` VALUES ('437', '删除充值卡', 'rechargecard/delete', '202', '100', '0');
INSERT INTO `bao_menu` VALUES ('438', '餐饮订单管理', 'eleorder/index', '416', '22', '1');
INSERT INTO `bao_menu` VALUES ('439', '删除订单', 'eleorder/delete', '416', '100', '0');
INSERT INTO `bao_menu` VALUES ('440', '结算管理', null, '3', '3', '1');
INSERT INTO `bao_menu` VALUES ('442', '对账单管理', 'settlement/index', '440', '2', '0');
INSERT INTO `bao_menu` VALUES ('443', '新增对账单', 'settlement/create', '440', '3', '0');
INSERT INTO `bao_menu` VALUES ('444', '对账单详情', 'settlementshop/index', '440', '4', '0');
INSERT INTO `bao_menu` VALUES ('445', '商场管理', null, '7', '8', '1');
INSERT INTO `bao_menu` VALUES ('446', '商场列表', 'market/index', '445', '1', '1');
INSERT INTO `bao_menu` VALUES ('447', '添加商场', 'market/create', '445', '100', '0');
INSERT INTO `bao_menu` VALUES ('448', '编辑商场', 'market/edit', '445', '100', '0');
INSERT INTO `bao_menu` VALUES ('449', '删除商场', 'market/delete', '445', '100', '0');
INSERT INTO `bao_menu` VALUES ('450', '商家入驻', 'market/enter', '445', '100', '0');
INSERT INTO `bao_menu` VALUES ('451', '入驻列表', 'market/enterlist', '445', '100', '0');
INSERT INTO `bao_menu` VALUES ('452', '撤销入驻', 'market/cancle', '445', '100', '0');
INSERT INTO `bao_menu` VALUES ('453', '商场活动', 'marketactivity/index', '445', '2', '1');
INSERT INTO `bao_menu` VALUES ('454', '添加活动', 'marketactivity/create', '445', '100', '0');
INSERT INTO `bao_menu` VALUES ('455', '编辑活动', 'marketactivity/edit', '445', '100', '0');
INSERT INTO `bao_menu` VALUES ('456', '删除活动', 'marketactivity/delete', '445', '100', '0');
INSERT INTO `bao_menu` VALUES ('561', '小区服务台', 'feedback/index', '555', '6', '1');
INSERT INTO `bao_menu` VALUES ('560', '小区论坛', 'communityposts/index', '555', '5', '1');
INSERT INTO `bao_menu` VALUES ('468', '推广配置', 'tui/index', '282', '1', '1');
INSERT INTO `bao_menu` VALUES ('469', '新增推广', 'tui/create', '282', '2', '0');
INSERT INTO `bao_menu` VALUES ('470', '编辑推广', 'tui/edit', '282', '3', '0');
INSERT INTO `bao_menu` VALUES ('471', '删除推广', 'tui/delete', '282', '4', '0');
INSERT INTO `bao_menu` VALUES ('472', '来源分析', 'tongji/laiyuan', '282', '13', '1');
INSERT INTO `bao_menu` VALUES ('473', '推广效果分析', 'tongji/tuiguan', '282', '14', '1');
INSERT INTO `bao_menu` VALUES ('477', '手机版约会', null, '487', '6', '1');
INSERT INTO `bao_menu` VALUES ('475', '关键词分析', 'tongji/keyword', '282', '16', '1');
INSERT INTO `bao_menu` VALUES ('476', '来源金额', 'tongji/lmoney', '282', '13', '1');
INSERT INTO `bao_menu` VALUES ('478', '附近约会', 'hdmobile/index', '477', '1', '1');
INSERT INTO `bao_menu` VALUES ('482', '报名管理', 'hdmobilesign/index', '477', '2', '1');
INSERT INTO `bao_menu` VALUES ('483', '上榜榜单', null, '7', '10', '1');
INSERT INTO `bao_menu` VALUES ('484', '榜单列表', 'billboard/index', '483', '2', '1');
INSERT INTO `bao_menu` VALUES ('485', '榜单管理', 'billshop/index', '483', '100', '1');
INSERT INTO `bao_menu` VALUES ('491', '会员卡删除', 'usercard/delete', '488', '3', '1');
INSERT INTO `bao_menu` VALUES ('492', '导入会员卡', 'usercard/import', '488', '4', '0');
INSERT INTO `bao_menu` VALUES ('493', '确定导入', 'usercard/importok', '488', '5', '0');
INSERT INTO `bao_menu` VALUES ('496', '审核招聘', 'work/audit', '494', '2', '0');
INSERT INTO `bao_menu` VALUES ('497', '删除招聘', 'work/delete', '494', '3', '0');
INSERT INTO `bao_menu` VALUES ('500', '家政列表', 'housework/index', '498', '4', '1');
INSERT INTO `bao_menu` VALUES ('501', '删除家政', 'housework/delete', '498', '5', '0');
INSERT INTO `bao_menu` VALUES ('502', '修改家政', 'housework/edit', '498', '6', '0');
INSERT INTO `bao_menu` VALUES ('510', '提现管理', 'usercash/index', '509', '100', '1');
INSERT INTO `bao_menu` VALUES ('520', '微店审核列表', 'weidian/index', '43', '100', '1');
INSERT INTO `bao_menu` VALUES ('521', '开通订座', 'shop/ding', '43', '100', '0');
INSERT INTO `bao_menu` VALUES ('515', '优购配置', 'setting/mall', '231', '100', '1');
INSERT INTO `bao_menu` VALUES ('522', '专题管理', 'zhuanti/index', '62', '41', '1');
INSERT INTO `bao_menu` VALUES ('523', '配送员管理', null, '335', '100', '1');
INSERT INTO `bao_menu` VALUES ('524', '配送员列表', 'delivery/index', '523', '100', '1');
INSERT INTO `bao_menu` VALUES ('525', '添加配送员', 'delivery/create', '523', '100', '0');
INSERT INTO `bao_menu` VALUES ('526', '配送记录', 'delivery/lists', '523', '100', '0');
INSERT INTO `bao_menu` VALUES ('190', '添加广告位', 'adsite/create', '66', '2', '1');
INSERT INTO `bao_menu` VALUES ('528', 'UC整合', 'setting/ucenter', '33', '100', '1');
INSERT INTO `bao_menu` VALUES ('529', '新功能', null, '0', '100', '1');
INSERT INTO `bao_menu` VALUES ('530', '缴费管理', null, '529', '100', '1');
INSERT INTO `bao_menu` VALUES ('532', '缴费类型', 'bill/billtype', '530', '1', '1');
INSERT INTO `bao_menu` VALUES ('533', '缴费订单', 'bill/billorder', '530', '2', '1');
INSERT INTO `bao_menu` VALUES ('534', '系统维护', null, '1', '100', '1');
INSERT INTO `bao_menu` VALUES ('535', '数据库维护', 'check/index', '534', '100', '1');
INSERT INTO `bao_menu` VALUES ('536', '销售流水', null, '3', '100', '1');
INSERT INTO `bao_menu` VALUES ('537', '资金记录', 'shopmoney/index', '536', '1', '1');
INSERT INTO `bao_menu` VALUES ('538', '月订单汇总', 'shopmoney/tjmonth', '536', '2', '1');
INSERT INTO `bao_menu` VALUES ('539', '日订单汇总', 'shopmoney/tjday', '536', '3', '1');
INSERT INTO `bao_menu` VALUES ('540', '年订单汇总', 'shopmoney/tjyear', '536', '4', '1');
INSERT INTO `bao_menu` VALUES ('541', '全民经纪人', null, '4', '100', '1');
INSERT INTO `bao_menu` VALUES ('542', '全民经纪人', 'setting/quanming', '541', '100', '1');
INSERT INTO `bao_menu` VALUES ('543', '全民推广明细', 'quanming/index', '541', '2', '1');
INSERT INTO `bao_menu` VALUES ('544', '全民经纪人', 'tongji/quanming', '282', '17', '1');
INSERT INTO `bao_menu` VALUES ('545', 'APP', null, '0', '100', '1');
INSERT INTO `bao_menu` VALUES ('546', 'app推送管理', null, '545', '2', '1');
INSERT INTO `bao_menu` VALUES ('547', 'app管理', null, '545', '1', '1');
INSERT INTO `bao_menu` VALUES ('548', 'APP版本管理', 'setting/updateapp', '547', '1', '1');
INSERT INTO `bao_menu` VALUES ('549', '推送配置', 'setting/jpush', '546', '100', '1');
INSERT INTO `bao_menu` VALUES ('550', '群发消息', 'jpush/mass', '546', '2', '1');
INSERT INTO `bao_menu` VALUES ('551', '单发消息', 'jpush/single', '546', '3', '1');
INSERT INTO `bao_menu` VALUES ('552', '历史记录', 'jpush/history', '546', '4', '1');
INSERT INTO `bao_menu` VALUES ('553', '家政项目配置', 'housework/setting', '498', '2', '1');
INSERT INTO `bao_menu` VALUES ('554', '设置项目配置', 'housework/setting2', '498', '3', '0');
INSERT INTO `bao_menu` VALUES ('555', '小区管理', null, '529', '100', '1');
INSERT INTO `bao_menu` VALUES ('556', '小区管理', 'community/index', '555', '1', '1');
INSERT INTO `bao_menu` VALUES ('557', '新增小区', 'community/add', '555', '2', '0');
INSERT INTO `bao_menu` VALUES ('558', '编辑小区', 'community/edit', '555', '3', '0');
INSERT INTO `bao_menu` VALUES ('559', '删除小区', 'community/delete', '555', '4', '0');
INSERT INTO `bao_menu` VALUES ('562', '社区、村镇设置', null, '529', '100', '1');
INSERT INTO `bao_menu` VALUES ('563', '社区村镇管理', 'village/index', '562', '100', '1');
INSERT INTO `bao_menu` VALUES ('564', '编辑', 'village/edit', '562', '100', '0');
INSERT INTO `bao_menu` VALUES ('565', '通知以及活动管理', 'village/notice', '562', '100', '0');
INSERT INTO `bao_menu` VALUES ('566', '工作人员管理', 'village/worker', '562', '100', '0');
INSERT INTO `bao_menu` VALUES ('567', '社区村评论删除', 'village/bbs_replys_delete', '562', '100', '0');
INSERT INTO `bao_menu` VALUES ('568', '社区村帖子删除', 'village/bbs_delete', '562', '100', '0');
INSERT INTO `bao_menu` VALUES ('569', '社区村帖子查看', 'village/bbs_view', '562', '100', '0');
INSERT INTO `bao_menu` VALUES ('570', '社区村意见删除', 'village/reply_delete', '562', '100', '0');
INSERT INTO `bao_menu` VALUES ('571', '社区村工作人员删除', 'village/worker_delete', '562', '100', '0');
INSERT INTO `bao_menu` VALUES ('572', '社区村添加', 'village/create', '562', '100', '0');
INSERT INTO `bao_menu` VALUES ('573', '社区村工作人员编辑', 'village/worker_edit', '562', '100', '0');
INSERT INTO `bao_menu` VALUES ('574', '社区村通知以及活动删除', 'village/notice_delete', '562', '100', '0');
INSERT INTO `bao_menu` VALUES ('575', '社区村通知以及活动编', 'village/notice_edit', '562', '100', '0');
INSERT INTO `bao_menu` VALUES ('576', '社区村通知以及活动新增', 'village/notice_create', '562', '100', '0');
INSERT INTO `bao_menu` VALUES ('577', '删除', 'village/delete', '562', '100', '0');
INSERT INTO `bao_menu` VALUES ('578', '帖子管理', 'village/bbs', '562', '100', '0');
INSERT INTO `bao_menu` VALUES ('579', '意见管理', 'village/suggestion', '562', '100', '0');
INSERT INTO `bao_menu` VALUES ('580', '社区村工作人员添加', 'village/worker_create', '562', '100', '0');
INSERT INTO `bao_menu` VALUES ('581', '小区便民电话', 'convenientphone/index', '555', '7', '1');
INSERT INTO `bao_menu` VALUES ('582', '添加便民电话', 'convenientphone/create', '555', '8', '0');
INSERT INTO `bao_menu` VALUES ('583', '删除便民电话', 'convenientphone/delete', '555', '9', '0');
INSERT INTO `bao_menu` VALUES ('584', '编辑便民电话', 'convenientphone/edit', '555', '10', '0');
INSERT INTO `bao_menu` VALUES ('586', '会员', null, '3', '100', '1');

-- ----------------------------
-- Table structure for `bao_message`
-- ----------------------------
DROP TABLE IF EXISTS `bao_message`;
CREATE TABLE `bao_message` (
  `msg_id` int(15) NOT NULL AUTO_INCREMENT,
  `parent_id` int(15) NOT NULL DEFAULT '0',
  `send_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `content` varchar(200) NOT NULL,
  `read_time` int(10) NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_message
-- ----------------------------
INSERT INTO `bao_message` VALUES ('2', '0', '0', '59', '贝拉小镇希望你们成为他的员工，点击链接同意：<a href=\"/mcenter/information/worker/worker_id/5.html\">查看详情</a>', '0', '1506254423');
INSERT INTO `bao_message` VALUES ('3', '0', '0', '214', '贝拉小镇希望你们成为他的员工，点击链接同意：<a href=\"/mcenter/information/worker/worker_id/6.html\">查看详情</a>', '0', '1506254748');
INSERT INTO `bao_message` VALUES ('4', '0', '0', '215', '贝拉小镇希望你们成为他的员工，点击链接同意：<a href=\"/mcenter/information/worker/worker_id/7.html\">查看详情</a>', '0', '1506408473');
INSERT INTO `bao_message` VALUES ('5', '0', '0', '215', '贝拉小镇希望你们成为他的员工，点击链接同意：<a href=\"/mcenter/information/worker/worker_id/8.html\">查看详情</a>', '0', '1506408676');

-- ----------------------------
-- Table structure for `bao_msg`
-- ----------------------------
DROP TABLE IF EXISTS `bao_msg`;
CREATE TABLE `bao_msg` (
  `msg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `type` enum('gift','coupon','movie','message') DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `intro` varchar(256) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL COMMENT '可以为空 如果为空',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `details` text,
  PRIMARY KEY (`msg_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_msg
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_msg_read`
-- ----------------------------
DROP TABLE IF EXISTS `bao_msg_read`;
CREATE TABLE `bao_msg_read` (
  `read_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msg_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`read_id`),
  UNIQUE KEY `msg_id` (`msg_id`,`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_msg_read
-- ----------------------------
INSERT INTO `bao_msg_read` VALUES ('1', '1', '1', '1416401024', '127.0.0.1');

-- ----------------------------
-- Table structure for `bao_order`
-- ----------------------------
DROP TABLE IF EXISTS `bao_order`;
CREATE TABLE `bao_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `addr_id` int(11) DEFAULT '0',
  `shop_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_price` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '0.0.0.0',
  `update_time` int(11) DEFAULT '0',
  `update_ip` varchar(15) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '1代表已经付款  2代表正在配送  3代表已经完成',
  `is_daofu` tinyint(1) DEFAULT '0',
  `is_shop` tinyint(1) DEFAULT '0' COMMENT '1 代表商家发货',
  `closed` tinyint(1) DEFAULT '0',
  `use_integral` int(11) DEFAULT '0' COMMENT '订单使用积分数',
  `can_use_integral` int(11) DEFAULT '0' COMMENT '可使用的积分数',
  `act_code` varchar(40) DEFAULT NULL COMMENT '活动劵码',
  `piao_uucode` varchar(50) DEFAULT NULL COMMENT '票付通凭证码',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100619 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_order
-- ----------------------------
INSERT INTO `bao_order` VALUES ('100054', '35', '2', '1', '18900', '1425987850', '127.0.0.1', '0', null, '0', '1', '1', '1', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100055', '34', '1', '1', '165011', '1426037467', '127.0.0.1', '0', null, '8', '1', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100056', '35', '2', '1', '18900', '1426037467', '127.0.0.1', '0', null, '0', '1', '0', '1', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100057', '21', '4', '101', '1264911', '1426038286', '127.0.0.1', '0', null, '0', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100058', '21', '6', '101', '419700', '1426042862', '127.0.0.1', '0', null, '3', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100059', '21', '1', '101', '495033', '1426055113', '127.0.0.1', '0', null, '8', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100060', '21', '2', '101', '56700', '1426055113', '127.0.0.1', '0', null, '8', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100061', '34', '1', '101', '165011', '1426056740', '127.0.0.1', '0', null, '8', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100062', '35', '1', '101', '330022', '1426056792', '127.0.0.1', '0', null, '3', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100063', '21', '2', '101', '37800', '1426056792', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100064', '21', '3', '101', '0', '1426065603', '127.0.0.1', '0', null, '8', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100065', '21', '1', '101', '1594933', '1426065738', '127.0.0.1', '0', null, '1', '0', '0', '1', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100066', '21', '1', '101', '279800', '1426066184', '127.0.0.1', '0', null, '8', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100067', '21', '1', '101', '0', '1426067179', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100068', '21', '1', '101', '0', '1426067366', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100069', '21', '2', '101', '0', '1426067819', '127.0.0.1', '0', null, '8', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100070', '35', '1', '1', '2865187', '1426068754', '127.0.0.1', '0', null, '3', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100071', '34', '2', '1', '56700', '1426068754', '127.0.0.1', '0', null, '8', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100072', '21', '2', '101', '123400', '1426069083', '127.0.0.1', '0', null, '1', '0', '0', '1', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100073', '21', '1', '101', '2400000', '1426069083', '127.0.0.1', '0', null, '8', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100074', '21', '2', '101', '28900', '1426069315', '127.0.0.1', '0', null, '8', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100075', '21', '1', '101', '480000', '1426069315', '127.0.0.1', '0', null, '8', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100076', '21', '95', '101', '540000', '1426069932', '127.0.0.1', '0', null, '3', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100077', '21', '1', '101', '419700', '1426069932', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100078', '21', '95', '101', '314911', '1426070838', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100079', '21', '1', '101', '1710110', '1426071124', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100080', '21', '8', '101', '28900', '1426071124', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100081', '21', '1', '101', '495033', '1426071256', '127.0.0.1', '0', null, '2', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100082', '21', '8', '101', '37800', '1426071256', '127.0.0.1', '0', null, '8', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100083', '21', '1', '101', '165011', '1426071950', '127.0.0.1', '0', null, '2', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100084', '21', '8', '101', '10000', '1426071950', '127.0.0.1', '0', null, '2', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100085', '2', '1', '1', '314911', '1426128987', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100086', '2', '1', '1', '304911', '1426757801', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100087', '35', '1', '1', '304911', '1426764217', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100088', '35', '8', '101', '18900', '1426820277', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100089', '21', '95', '101', '960000', '1426820277', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100090', '34', '8', '101', '18900', '1426820838', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100091', '35', '95', '101', '960000', '1426820838', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100092', '31', '1', '101', '10000', '1426820900', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100093', '32', '8', '101', '18900', '1426820900', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100094', '33', '95', '101', '960000', '1426820900', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100095', '28', '95', '101', '960000', '1426821037', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100096', '33', '95', '108', '480000', '1426906807', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100097', '21', '2', '101', '78000', '1427107811', '127.0.0.1', '0', null, '2', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100098', '27', '6', '101', '45000', '1427179687', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100099', '26', '1', '6', '304911', '1427357472', '127.0.0.1', '0', null, '2', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100100', '21', '5', '101', '3900', '1427855325', '127.0.0.1', '0', null, '2', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100101', '25', '5', '101', '11700', '1428025392', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100102', '23', '1', '101', '960000', '1428027210', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100103', '22', '1', '101', '330022', '1428027353', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100104', '26', '1', '101', '2414733', '1428032254', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100105', '28', '8', '101', '4000', '1428387495', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100106', '29', '8', '15', '16000', '1428455403', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100107', '35', '6', '15', '20000', '1428455788', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100108', '29', '6', '15', '20000', '1428455918', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100109', '23', '9', '1', '59900', '1428914885', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100110', '2', '1', '1', '48800', '1428919674', '127.0.0.1', '0', null, '8', '1', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100111', '2', '1', '1', '48800', '1428919739', '127.0.0.1', '0', null, '8', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100112', '19', '1', '1', '634933', '1429173877', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100113', '35', '2', '101', '10000', '1429231772', '127.0.0.1', '0', null, '0', '0', '0', '1', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100114', '21', '1', '101', '165011', '1429232526', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100115', '35', '5', '101', '11700', '1429235685', '127.0.0.1', '0', null, '0', '0', '0', '1', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100116', '34', '3', '101', '14400', '1429242654', '127.0.0.1', '0', null, '1', '0', '0', '1', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100117', '19', '1', '1', '427622', '1429264449', '127.0.0.1', '0', null, '8', '1', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100118', '0', '8', '101', '20000', '1429773305', '127.0.0.1', '0', null, '0', '0', '0', '1', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100119', '0', '5', '101', '26000', '1429773305', '127.0.0.1', '0', null, '0', '0', '0', '1', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100120', '21', '1', '101', '50000', '1429773454', '127.0.0.1', '0', null, '2', '0', '1', '1', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100121', '0', '1', '108', '60000', '1429775682', '127.0.0.1', '0', null, '8', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100122', '0', '97', '1', '38750', '1430133932', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100123', '0', '95', '1', '86400', '1430907729', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100124', '35', '95', '101', '192600', '1430964096', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100125', '28', '95', '101', '33000', '1430965021', '127.0.0.1', '0', null, '2', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100126', '21', '84', '101', '47600', '1430967620', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100127', '35', '95', '101', '21000', '1430979532', '127.0.0.1', '0', null, '2', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100128', '0', '40', '1', '5500', '1431667971', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100129', '0', '98', '1', '13800', '1432022636', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100130', '0', '95', '121', '7600', '1432098680', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100131', '36', '95', '121', '3800', '1432098870', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100146', '5', '95', '1', '8000', '1436598261', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100145', '19', '95', '1', '3800', '1436514435', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100134', '9', '95', '1', '4000', '1432796009', '127.0.0.1', '0', null, '2', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100135', '0', '2', '108', '98', '1432951387', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100136', '0', '85', '108', '1680', '1432952280', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100137', '0', '2', '1', '98', '1432953453', '127.0.0.1', '0', null, '0', '0', '0', '1', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100138', '2', '95', '1', '3800', '1432962602', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100139', '38', '1', '101', '1200', '1433137572', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100140', '0', '2', '108', '490', '1434352376', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100141', '0', '95', '101', '3800', '1435053554', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100142', '0', '98', '101', '6900', '1435198013', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100143', '21', '2', '101', '98', '1436412471', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100144', '39', '47', '125', '6600', '1436427677', '127.0.0.1', '0', null, '0', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100147', '0', '2', '1', '98', '1437617533', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100227', '19', '99', '1', '4800', '1439520424', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100149', '8', '85', '1', '3360', '1437618333', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100150', '0', '85', '1', '3360', '1437618353', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100151', '0', '97', '1', '7800', '1437626522', '127.0.0.1', '0', null, '0', '0', '1', '1', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100158', '0', '41', '101', '6980', '1438927043', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100159', '0', '95', '101', '3282800', '1438927043', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100160', '0', '41', '101', '6980', '1438927067', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100161', '0', '95', '101', '3282800', '1438927067', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100162', '0', '41', '101', '6980', '1438927073', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100163', '0', '95', '101', '3282800', '1438927073', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100164', '0', '16', '101', '138000', '1438927199', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100165', '0', '16', '101', '138000', '1438927238', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100166', '35', '43', '101', '6300', '1438928407', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100167', '35', '95', '101', '3800', '1438928407', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100168', '0', '95', '101', '799800', '1439175874', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100169', '0', '95', '101', '799800', '1439175903', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100170', '0', '43', '101', '6300', '1439175925', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100171', '0', '43', '101', '6300', '1439176108', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100172', '0', '95', '101', '3800', '1439202112', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100173', '0', '95', '101', '19000', '1439253802', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100174', '0', '95', '101', '19000', '1439254048', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100175', '46', '95', '101', '7600', '1439254692', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100176', '46', '95', '101', '7600', '1439254875', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100177', '46', '95', '101', '7600', '1439255104', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100178', '28', '95', '101', '3800', '1439258918', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100179', '46', '43', '101', '6300', '1439259012', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100180', '45', '41', '101', '3490', '1439260346', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100181', '28', '95', '101', '3800', '1439260534', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100182', '46', '95', '101', '3800', '1439260840', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100183', '46', '95', '101', '3200', '1439261841', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100184', '45', '43', '101', '6300', '1439262415', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100185', '28', '41', '101', '3490', '1439262584', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100186', '28', '40', '101', '4280', '1439262815', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100187', '28', '95', '101', '3800', '1439264478', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100188', '45', '43', '101', '6300', '1439269092', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100189', '45', '95', '101', '3800', '1439269092', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100190', '35', '84', '101', '6380', '1439272565', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100191', '35', '95', '101', '7600', '1439272565', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100192', '45', '40', '101', '2500', '1439273039', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100193', '45', '85', '101', '5980', '1439278197', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100194', '45', '39', '101', '4260', '1439278197', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100195', '45', '47', '101', '13200', '1439278197', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100196', '45', '41', '101', '2750', '1439278361', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100197', '45', '43', '101', '6300', '1439278361', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100198', '45', '85', '101', '2990', '1439278421', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100199', '46', '41', '101', '2750', '1439278700', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100200', '46', '42', '101', '4800', '1439278700', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100201', '46', '42', '101', '4800', '1439278803', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100202', '46', '85', '101', '14950', '1439278870', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100203', '46', '47', '101', '19800', '1439278870', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100204', '45', '41', '101', '2750', '1439278930', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100205', '45', '43', '101', '6300', '1439278930', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100206', '45', '43', '101', '12600', '1439279107', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100207', '45', '20', '101', '199900', '1439279107', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100208', '45', '42', '101', '4800', '1439279243', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100209', '45', '46', '101', '3579', '1439279397', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100210', '45', '43', '101', '6300', '1439279397', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100211', '46', '87', '101', '4490', '1439279631', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100212', '46', '95', '101', '3200', '1439279631', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100213', '46', '43', '101', '6300', '1439279781', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100214', '46', '95', '101', '3800', '1439279781', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100215', '45', '85', '101', '3980', '1439279986', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100216', '45', '95', '101', '3800', '1439279986', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100217', '45', '85', '101', '3980', '1439280319', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100218', '45', '95', '101', '3800', '1439280319', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100219', '45', '85', '101', '7960', '1439280549', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100220', '45', '95', '101', '7600', '1439280549', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100221', '35', '95', '101', '3800', '1439280677', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100222', '46', '43', '101', '6300', '1439280956', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100223', '46', '95', '101', '3800', '1439280956', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100224', '45', '85', '101', '3980', '1439281754', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100225', '45', '95', '101', '3800', '1439281754', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100226', '45', '95', '101', '10200', '1439285962', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100228', '8', '87', '1', '2340', '1439521427', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100229', '9', '85', '1', '3960', '1439532806', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100230', '0', '43', '101', '6300', '1439532886', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100231', '0', '3', '101', '4800', '1439538453', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100232', '0', '3', '101', '4800', '1439538538', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100233', '0', '12', '101', '89900', '1439538568', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100234', '0', '85', '1', '3360', '1439545562', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100235', '35', '85', '101', '1680', '1439545729', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100236', '19', '2', '1', '93880', '1439603840', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100237', '0', '2', '1', '40000', '1439604700', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100238', '0', '2', '1', '8594', '1439604717', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100239', '9', '2', '1', '8594', '1439604908', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100240', '0', '2', '1', '12940', '1439605193', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100241', '0', '2', '1', '14248', '1439605219', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100242', '8', '2', '1', '44088', '1439605643', '127.0.0.1', '0', null, '0', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100243', '0', '2', '1', '24150', '1439609262', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100244', '0', '98', '1', '13800', '1439609262', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100245', '8', '2', '1', '24150', '1439609290', '127.0.0.1', '0', null, '0', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100246', '8', '98', '1', '13800', '1439609290', '127.0.0.1', '0', null, '0', '1', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100247', '0', '2', '1', '98', '1439625019', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100248', '0', '2', '1', '98', '1439626784', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100249', '0', '85', '1', '374349', '1439628485', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100250', '0', '41', '1', '3490', '1439633333', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100251', '0', '41', '1', '3490', '1439633335', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100252', '0', '42', '1', '1770', '1439633586', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100253', '0', '41', '1', '3490', '1439634332', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100254', '51', '95', '35', '1999500', '1439772342', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100255', '0', '43', '101', '6300', '1439772435', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100256', '0', '41', '36', '2750', '1439772912', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100257', '0', '1', '1', '35910', '1439777921', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100258', '0', '2', '1', '98', '1439790104', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100259', '0', '2', '1', '4000', '1439790865', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100260', '8', '95', '1', '3800', '1439792449', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100261', '0', '2', '1', '98', '1439793899', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100262', '0', '43', '101', '75600', '1439794915', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100263', '0', '95', '101', '3800', '1439794915', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100264', '0', '2', '1', '588', '1439805846', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100265', '35', '85', '1', '1680', '1439805967', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100266', '0', '85', '1', '6720', '1439806061', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100267', '8', '85', '1', '1680', '1439806109', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100268', '5', '11', '1', '226000', '1439806425', '127.0.0.1', '0', null, '0', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100269', '5', '40', '1', '5500', '1439806425', '127.0.0.1', '0', null, '0', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100270', '52', '40', '36', '5500', '1439808942', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100271', '35', '2', '1', '98', '1439862009', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100272', '35', '99', '1', '1200', '1439862071', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100273', '35', '1', '1', '1200', '1439862071', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100274', '35', '2', '1', '4248', '1439863879', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100275', '35', '42', '1', '6570', '1439863879', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100276', '0', '2', '1', '98', '1439864603', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100277', '19', '18', '1', '538800', '1439875504', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100278', '5', '15', '1', '899700', '1439875681', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100279', '35', '2', '1', '98', '1439876883', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100280', '35', '85', '1', '21840', '1439877055', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100281', '8', '39', '1', '2840', '1439880993', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100282', '8', '1', '1', '9190', '1439880993', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100283', '8', '44', '1', '5980', '1439880993', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100284', '8', '41', '1', '13750', '1439880993', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100285', '8', '46', '1', '7158', '1439880993', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100286', '8', '20', '1', '26800', '1439880993', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100287', '8', '19', '1', '49800', '1439880993', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100288', '8', '17', '1', '689900', '1439880993', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100289', '0', '39', '1', '2840', '1439881003', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100290', '0', '1', '1', '9190', '1439881003', '127.0.0.1', '1440476869', '127.0.0.1', '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100291', '0', '44', '1', '5980', '1439881003', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100292', '0', '41', '1', '13750', '1439881003', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100293', '0', '46', '1', '7158', '1439881003', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100294', '0', '20', '1', '26800', '1439881003', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100295', '8', '19', '1', '49800', '1439881003', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100296', '0', '17', '1', '689900', '1439881003', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100297', '0', '43', '101', '6300', '1439954085', '127.0.0.1', '0', null, '8', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100300', '0', '17', '1', '359800', '1439970352', '127.0.0.1', '0', null, '2', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100301', '0', '1', '1', '3990', '1439970352', '127.0.0.1', '0', null, '8', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100302', '0', '41', '1', '19460', '1440052816', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100303', '0', '47', '1', '72600', '1440052816', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100304', '8', '41', '1', '19460', '1440052818', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100305', '8', '47', '1', '72600', '1440052818', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100306', '8', '41', '1', '19460', '1440052820', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100307', '0', '47', '1', '72600', '1440052820', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100308', '0', '95', '1', '250000', '1440055186', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100309', '2', '18', '1', '599800', '1440055186', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100310', '64', '41', '140', '6240', '1440056442', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100311', '0', '95', '1', '250000', '1440056441', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100312', '0', '18', '1', '599800', '1440056441', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100313', '64', '39', '140', '7500', '1440057023', '127.0.0.1', '0', null, '0', '1', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100314', '64', '39', '140', '7500', '1440059781', '127.0.0.1', '0', null, '0', '1', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100315', '2', '41', '1', '31410', '1440060490', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100316', '0', '41', '1', '3490', '1440062776', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100317', '0', '95', '1', '3800', '1440062776', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100318', '0', '41', '1', '3490', '1440063294', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100319', '0', '95', '1', '3800', '1440063294', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100320', '2', '43', '1', '6300', '1440064601', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100321', '0', '85', '1', '2990', '1440124174', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100322', '0', '18', '1', '299900', '1440124174', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100323', '64', '47', '140', '6600', '1440135423', '127.0.0.1', '0', null, '0', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100324', '64', '47', '140', '6600', '1440136471', '127.0.0.1', '0', null, '0', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100325', '64', '47', '140', '6600', '1440136831', '127.0.0.1', '0', null, '2', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100326', '64', '87', '140', '180', '1440138790', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100327', '64', '2', '140', '98', '1440138991', '127.0.0.1', '0', null, '8', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100328', '64', '2', '140', '1764', '1440139245', '127.0.0.1', '0', null, '8', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100329', '0', '95', '101', '3800', '1440153171', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100330', '0', '95', '1', '3800', '1440206175', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100331', '0', '17', '1', '179900', '1440206752', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100332', '0', '17', '1', '179900', '1440206757', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100333', '0', '95', '1', '3800', '1440206796', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100334', '5', '41', '1', '2750', '1440208163', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100335', '8', '95', '1', '3800', '1440221183', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100336', '8', '1', '1', '11970', '1440221183', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100337', '8', '95', '1', '3800', '1440221278', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100338', '0', '1', '1', '11970', '1440221278', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100339', '9', '95', '1', '3800', '1440221858', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100340', '0', '95', '1', '3800', '1440222018', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100341', '8', '95', '1', '3800', '1440222898', '127.0.0.1', '0', null, '8', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100342', '8', '1', '1', '3990', '1440222898', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100343', '0', '95', '1', '3200', '1440222920', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100344', '2', '43', '1', '12600', '1440224751', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100345', '0', '41', '1', '3490', '1440228233', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100346', '0', '41', '1', '3490', '1440228925', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100347', '0', '41', '1', '3490', '1440228989', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100348', '0', '17', '1', '179900', '1440229705', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100349', '0', '85', '140', '1680', '1440233440', '127.0.0.1', '0', null, '0', '0', '0', '1', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100350', '64', '1', '140', '3990', '1440396909', '127.0.0.1', '0', null, '2', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100351', '8', '5', '1', '11700', '1440400048', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100352', '0', '2', '1', '300', '1440400353', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100353', '0', '87', '1', '360', '1440400796', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100354', '8', '84', '1', '1390', '1440403661', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100355', '2', '84', '1', '3190', '1440403797', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100356', '2', '95', '1', '3800', '1440403797', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100357', '2', '95', '1', '3800', '1440405642', '127.0.0.1', '0', null, '8', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100358', '2', '99', '1', '1200', '1440406038', '127.0.0.1', '0', null, '8', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100359', '2', '95', '1', '3800', '1440406167', '127.0.0.1', '0', null, '8', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100360', '2', '95', '1', '3800', '1440406201', '127.0.0.1', '0', null, '8', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100361', '2', '95', '1', '3800', '1440406251', '127.0.0.1', '0', null, '8', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100362', '8', '1', '1', '3990', '1440406298', '127.0.0.1', '0', null, '8', '0', '0', '1', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100363', '0', '1', '1', '3990', '1440406472', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100364', '8', '1', '1', '39900', '1440407010', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100365', '0', '1', '1', '3990', '1440411018', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100366', '0', '1', '1', '3990', '1440411026', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100367', '0', '1', '1', '3990', '1440411035', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100368', '0', '1', '1', '9190', '1440411057', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100369', '0', '1', '1', '9190', '1440411066', '127.0.0.1', '1440553902', '127.0.0.1', '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100370', '8', '2', '1', '686', '1440486348', '127.0.0.1', '0', null, '0', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100371', '0', '84', '1', '3190', '1440552236', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100372', '0', '43', '1', '6300', '1440552236', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100373', '8', '84', '1', '3190', '1440554394', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100374', '8', '43', '1', '6300', '1440554394', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100375', '2', '95', '1', '3200', '1440567401', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100376', '2', '1', '1', '7980', '1440567401', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100377', '2', '95', '1', '3200', '1440567486', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100378', '2', '1', '1', '7980', '1440567486', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100379', '50', '40', '143', '60500', '1440572834', '127.0.0.1', '1440572985', '127.0.0.1', '0', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100380', '0', '95', '1', '424900', '1440579560', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100381', '0', '15', '1', '1524000', '1440579560', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100382', '2', '43', '1', '6300', '1440580321', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100383', '0', '95', '1', '399900', '1440580381', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100384', '0', '1', '1', '3990', '1440580381', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100385', '0', '41', '1', '3490', '1440583666', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100386', '0', '95', '1', '857400', '1440583666', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100387', '0', '1', '1', '3990', '1440583666', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100388', '0', '17', '1', '1379800', '1440583666', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100389', '0', '41', '1', '3490', '1440583771', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100390', '0', '17', '1', '689900', '1440583771', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100391', '2', '41', '1', '17450', '1440583955', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100392', '2', '47', '1', '6600', '1440583955', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100393', '2', '95', '1', '28800', '1440583955', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100394', '2', '1', '1', '3990', '1440583955', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100395', '2', '41', '1', '3490', '1440584357', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100396', '2', '45', '1', '8900', '1440584486', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100397', '2', '84', '1', '3190', '1440584580', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100398', '2', '15', '1', '299900', '1440584684', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100399', '2', '95', '1', '25000', '1440638553', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100400', '2', '18', '1', '198000', '1440638713', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100401', '2', '95', '1', '75000', '1440638713', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100402', '2', '40', '1', '12280', '1440639061', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100403', '74', '95', '144', '3800', '1440666266', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100404', '0', '1', '101', '3990', '1440743307', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100405', '63', '2', '101', '120000', '1440809571', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100406', '0', '2', '101', '120000', '1440809607', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100407', '63', '2', '101', '16000', '1440810322', '127.0.0.1', '0', null, '2', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100408', '0', '2', '101', '14248', '1440811107', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100409', '0', '2', '145', '294', '1440819412', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100410', '0', '2', '1', '490', '1440819710', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100411', '8', '2', '1', '80000', '1440831664', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100412', '73', '41', '101', '3490', '1440833164', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100413', '73', '95', '101', '3800', '1440833164', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100414', '73', '1', '101', '3990', '1440833589', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100415', '73', '41', '101', '2750', '1440833891', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100416', '73', '95', '101', '3800', '1440833891', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100417', '73', '42', '101', '28800', '1440833928', '127.0.0.1', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100418', '0', '2', '143', '150', '1440987012', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100419', '0', '2', '143', '68000', '1440987387', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100420', '0', '2', '143', '68000', '1440987393', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100421', '0', '1', '1', '7980', '1440987611', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100422', '0', '20', '1', '379800', '1440987611', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100423', '0', '95', '160', '3800', '1440987888', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100424', '0', '95', '101', '3800', '1440988321', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100425', '19', '39', '1', '30620', '1441005584', '127.0.0.1', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100426', '0', '2', '147', '150', '1441087268', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100427', '77', '2', '147', '150', '1441088209', '127.0.0.1', '0', null, '3', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100428', '77', '2', '147', '150', '1441088713', '127.0.0.1', '0', null, '3', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100429', '0', '2', '147', '16000', '1441089242', '127.0.0.1', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100430', '77', '2', '147', '8000', '1441089537', '127.0.0.1', '0', null, '2', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100431', '77', '2', '147', '8000', '1441090554', '127.0.0.1', '0', null, '8', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100432', '77', '95', '147', '7600', '1441095315', '127.0.0.1', '0', null, '0', '1', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100433', '77', '95', '147', '7600', '1441095478', '127.0.0.1', '0', null, '0', '1', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100434', '77', '95', '147', '3800', '1441096034', '127.0.0.1', '0', null, '0', '1', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100435', '77', '95', '147', '799800', '1441096255', '127.0.0.1', '0', null, '0', '1', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100436', '0', '95', '147', '799800', '1441097282', '127.0.0.1', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100437', '84', '2', '145', '150', '1443186237', '219.145.179.207', '0', null, '3', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100438', '84', '2', '145', '200', '1443238095', '219.145.179.207', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100439', '85', '87', '148', '360', '1443422739', '27.13.30.10', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100440', '85', '2', '148', '8450', '1443748494', '27.13.30.178', '0', null, '3', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100441', '85', '43', '148', '6300', '1443752823', '27.13.30.178', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100442', '85', '2', '148', '4000', '1443752926', '27.13.30.178', '0', null, '3', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100443', '86', '41', '160', '3490', '1444068413', '14.215.166.57', '0', null, '0', '1', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100444', '86', '43', '160', '6300', '1444068413', '14.215.166.57', '0', null, '0', '1', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100445', '87', '85', '162', '2879', '1444185656', '1.27.105.53', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100446', '87', '39', '162', '1420', '1444186633', '1.27.105.53', '0', null, '3', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100447', '87', '85', '162', '990', '1444196637', '1.27.105.53', '0', null, '3', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100448', '0', '84', '148', '17850', '1444276360', '223.104.25.91', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100449', '0', '85', '148', '48800', '1444276360', '223.104.25.91', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100450', '0', '84', '148', '17850', '1444276363', '223.104.25.91', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100451', '0', '85', '148', '48800', '1444276363', '223.104.25.91', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100452', '0', '84', '148', '17850', '1444276384', '223.104.25.91', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100453', '0', '85', '148', '48800', '1444276384', '223.104.25.91', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100454', '0', '11', '148', '452000', '1444279824', '223.104.25.91', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100455', '0', '11', '148', '452000', '1444279826', '223.104.25.91', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100456', '0', '11', '148', '452000', '1444279828', '223.104.25.91', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100457', '0', '11', '148', '452000', '1444279829', '223.104.25.91', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100458', '0', '11', '148', '1130000', '1444279853', '223.104.25.91', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100459', '0', '84', '148', '5950', '1444291356', '27.13.29.105', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100460', '85', '84', '148', '5950', '1444291740', '27.13.29.105', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100461', '85', '12', '148', '479800', '1444317371', '27.13.29.105', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100462', '85', '1', '148', '3990', '1444317371', '27.13.29.105', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100463', '85', '127', '148', '26400', '1444317371', '27.13.29.105', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100464', '85', '127', '148', '132000', '1444318191', '27.13.29.105', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100465', '85', '127', '148', '132000', '1444318435', '27.13.29.105', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100466', '85', '127', '148', '8800', '1444320874', '27.13.29.105', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100467', '0', '84', '167', '5950', '1444467681', '27.13.29.105', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100468', '0', '84', '148', '5950', '1444533154', '27.13.154.156', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100469', '85', '85', '148', '10080', '1444969253', '27.13.25.194', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100470', '0', '2', '148', '16300', '1445043224', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100471', '85', '2', '148', '16300', '1445044488', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100472', '85', '2', '148', '16300', '1445044900', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100473', '85', '84', '148', '5950', '1445045311', '27.13.152.63', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100474', '85', '2', '148', '16300', '1445045311', '27.13.152.63', '0', null, '2', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100475', '0', '84', '148', '5950', '1445045378', '27.13.152.63', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100476', '0', '2', '148', '16300', '1445045378', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100477', '85', '84', '148', '5950', '1445045606', '27.13.152.63', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100478', '85', '2', '148', '16300', '1445045606', '27.13.152.63', '0', null, '3', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100479', '85', '130', '148', '200', '1445045606', '27.13.152.63', '0', null, '3', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100480', '85', '84', '148', '11900', '1445045838', '27.13.152.63', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100481', '85', '2', '148', '16300', '1445045838', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100482', '85', '130', '148', '200', '1445045838', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100483', '85', '84', '148', '11900', '1445046417', '27.13.152.63', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100484', '85', '2', '148', '16300', '1445046417', '27.13.152.63', '0', null, '2', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100485', '85', '130', '148', '200', '1445046417', '27.13.152.63', '0', null, '2', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100486', '0', '84', '148', '11900', '1445046544', '27.13.152.63', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100487', '0', '2', '148', '16300', '1445046544', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100488', '0', '130', '148', '200', '1445046544', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100489', '85', '84', '148', '17850', '1445046566', '27.13.152.63', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100490', '85', '2', '148', '16300', '1445046566', '27.13.152.63', '0', null, '2', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100491', '85', '130', '148', '200', '1445046566', '27.13.152.63', '0', null, '2', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100492', '85', '84', '148', '35700', '1445050964', '27.13.152.63', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100493', '85', '84', '148', '35700', '1445052642', '27.13.152.63', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100494', '85', '84', '148', '35700', '1445052877', '27.13.152.63', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100495', '85', '84', '148', '53550', '1445053091', '27.13.152.63', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100496', '85', '2', '148', '12000', '1445053091', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100497', '85', '2', '148', '12000', '1445053284', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100498', '85', '2', '148', '12000', '1445053500', '27.13.152.63', '0', null, '2', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100499', '85', '130', '148', '200', '1445053666', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100500', '85', '130', '148', '200', '1445053929', '27.13.152.63', '0', null, '2', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100501', '85', '130', '148', '200', '1445054110', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100502', '0', '130', '148', '200', '1445054173', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100503', '0', '130', '148', '200', '1445054307', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100504', '85', '130', '148', '200', '1445054491', '27.13.152.63', '0', null, '0', '0', '0', '1', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100505', '0', '130', '148', '200', '1445055043', '27.13.152.63', '0', null, '0', '0', '0', '1', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100506', '85', '130', '148', '1000', '1445055058', '27.13.152.63', '0', null, '0', '0', '0', '1', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100507', '85', '128', '148', '1866400', '1445217030', '27.13.152.63', '0', null, '2', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100508', '85', '85', '148', '6720', '1445218088', '27.13.152.63', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100509', '85', '85', '148', '6720', '1445218284', '27.13.152.63', '0', null, '0', '0', '0', '1', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100510', '85', '128', '148', '1399800', '1445314271', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100511', '0', '128', '148', '933200', '1445352667', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100512', '0', '128', '148', '933200', '1445352705', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100513', '0', '128', '148', '933200', '1445352716', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100514', '0', '128', '148', '933200', '1445352870', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100515', '85', '128', '148', '933200', '1445353039', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100516', '85', '128', '148', '466600', '1445355253', '27.13.152.63', '0', null, '2', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100517', '85', '128', '148', '466600', '1445355503', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100518', '85', '128', '148', '466600', '1445355524', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100519', '85', '128', '148', '466600', '1445355602', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100520', '0', '128', '148', '466600', '1445355611', '27.13.152.63', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100521', '85', '128', '148', '933200', '1445356602', '27.13.152.63', '0', null, '2', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100522', '0', '135', '174', '7000', '1445392891', '110.185.132.246', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100523', '0', '135', '174', '7000', '1445392894', '110.185.132.246', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100524', '8', '128', '1', '466600', '1445562412', '27.13.154.203', '0', null, '3', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100525', '8', '128', '1', '466600', '1445563020', '27.13.154.203', '0', null, '3', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100526', '0', '99', '185', '1200', '1445650606', '218.201.79.217', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100527', '0', '85', '148', '990', '1445774677', '27.13.26.92', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100528', '0', '85', '148', '1680', '1445774881', '27.13.26.92', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100529', '0', '128', '148', '466600', '1445775420', '27.13.26.92', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100530', '98', '85', '148', '990', '1445775774', '27.13.26.92', '0', null, '0', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100531', '0', '84', '148', '3190', '1445832044', '118.239.221.44', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100532', '85', '128', '148', '466600', '1445838110', '27.13.26.92', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100533', '98', '135', '148', '7000', '1446355307', '117.156.3.229', '0', null, '2', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100534', '85', '128', '148', '466600', '1446715545', '27.13.154.190', '0', null, '3', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100535', '94', '134', '148', '66600', '1446853407', '223.104.25.187', '1446853590', '223.104.25.187', '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100536', '94', '134', '148', '66600', '1446860164', '223.104.25.187', '0', null, '3', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100537', '95', '85', '148', '990', '1446860229', '223.104.25.187', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100538', '100', '128', '193', '466600', '1446971975', '111.85.228.69', '0', null, '0', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100539', '100', '134', '193', '66600', '1446971975', '111.85.228.69', '0', null, '0', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100540', '0', '85', '178', '5980', '1446976024', '101.36.72.180', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100541', '0', '128', '178', '1399800', '1446976024', '101.36.72.180', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100542', '0', '84', '181', '3190', '1447147940', '124.126.220.141', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100543', '101', '99', '181', '1200', '1447148402', '124.126.220.141', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100544', '101', '84', '181', '3190', '1447148697', '124.126.220.141', '0', null, '1', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100545', '101', '134', '181', '66600', '1447206494', '61.149.87.175', '0', null, '3', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100546', '0', '134', '177', '66600', '1447208581', '61.149.87.175', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100547', '91', '134', '177', '133200', '1447208593', '61.149.87.175', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100548', '0', '134', '181', '133200', '1447208662', '61.149.87.175', '0', null, '0', '0', '1', '1', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100549', '101', '134', '181', '133200', '1447208673', '61.149.87.175', '0', null, '2', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100550', '101', '139', '181', '5380', '1447214327', '61.149.87.175', '0', null, '3', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100551', '102', '84', '191', '3190', '1447214651', '127.145.56.183', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100552', '101', '139', '181', '5380', '1447214761', '61.149.87.175', '0', null, '8', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100553', '101', '139', '181', '10760', '1447214767', '61.149.87.175', '0', null, '2', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100554', '101', '139', '181', '16140', '1447215490', '61.149.87.175', '0', null, '1', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100555', '0', '134', '196', '66600', '1447226557', '123.52.36.116', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100556', '0', '139', '148', '10760', '1447238012', '114.111.167.83', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100557', '85', '144', '59', '260', '1447238027', '114.111.167.83', '0', null, '0', '1', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100558', '85', '144', '59', '260', '1447238027', '114.111.167.83', '0', null, '0', '1', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100559', '0', '85', '148', '1680', '1447238089', '114.111.167.83', '0', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100560', '0', '139', '148', '10760', '1447238089', '114.111.167.83', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100561', '103', '1', '206', '20000', '1468978324', '110.167.99.233', '0', null, '0', '0', '1', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100566', '0', '144', '1', '260', '1506157042', '0.0.0.0', '1506157042', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100567', '0', '144', '1', '260', '1506157050', '0.0.0.0', '1506157050', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100568', '0', '144', '1', '260', '1506157069', '0.0.0.0', '1506157069', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100569', '0', '144', '1', '520', '1506157150', '0.0.0.0', '1506157150', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100570', '0', '144', '1', '520', '1506157200', '0.0.0.0', '1506157200', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100571', '0', '144', '1', '520', '1506157272', '0.0.0.0', '1506157272', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100572', '0', '144', '1', '260', '1506223856', '0.0.0.0', '1506223856', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100573', '0', '144', '1', '0', '1506223943', '0.0.0.0', '1506223943', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100574', '0', '144', '1', '0', '1506223944', '0.0.0.0', '1506223944', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100575', '0', '144', '1', '0', '1506223945', '0.0.0.0', '1506223945', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100576', '0', '144', '1', '0', '1506223992', '0.0.0.0', '1506223992', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100577', '0', '144', '1', '0', '1506223992', '0.0.0.0', '1506223992', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100578', '0', '144', '1', '0', '1506223993', '0.0.0.0', '1506223993', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100579', '0', '144', '1', '0', '1506224015', '0.0.0.0', '1506224015', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100580', '0', '144', '1', '0', '1506224016', '0.0.0.0', '1506224016', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100581', '0', '144', '1', '260', '1506224507', '0.0.0.0', '1506224507', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100582', '0', '144', '1', '260', '1506224526', '0.0.0.0', '1506224526', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100583', '0', '144', '1', '260', '1506224961', '0.0.0.0', '1506224961', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100584', '0', '144', '1', '260', '1506224969', '0.0.0.0', '1506224969', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100585', '0', '144', '1', '260', '1506225016', '0.0.0.0', '1506225016', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100586', '0', '144', '1', '260', '1506225018', '0.0.0.0', '1506225018', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100587', '0', '144', '1', '260', '1506225018', '0.0.0.0', '1506225018', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100588', '0', '144', '1', '260', '1506225019', '0.0.0.0', '1506225019', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100589', '0', '144', '1', '260', '1506225019', '0.0.0.0', '1506225019', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100590', '0', '144', '1', '260', '1506225044', '0.0.0.0', '1506225044', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100591', '0', '144', '1', '260', '1506225045', '0.0.0.0', '1506225045', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100592', '0', '144', '1', '260', '1506225046', '0.0.0.0', '1506225046', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100593', '0', '144', '1', '260', '1506225050', '0.0.0.0', '1506225050', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100594', '0', '144', '1', '260', '1506225067', '0.0.0.0', '1506225067', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100595', '0', '144', '1', '260', '1506225068', '0.0.0.0', '1506225068', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100596', '0', '144', '1', '260', '1506225068', '0.0.0.0', '1506225068', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100597', '0', '144', '1', '260', '1506225068', '0.0.0.0', '1506225068', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100598', '0', '144', '1', '260', '1506225069', '0.0.0.0', '1506225069', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100599', '0', '144', '1', '260', '1506225069', '0.0.0.0', '1506225069', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100600', '0', '144', '1', '260', '1506225070', '0.0.0.0', '1506225070', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100601', '0', '144', '1', '260', '1506225074', '0.0.0.0', '1506225074', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100602', '0', '144', '1', '260', '1506225075', '0.0.0.0', '1506225075', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100603', '0', '144', '1', '260', '1506225076', '0.0.0.0', '1506225076', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100604', '0', '144', '1', '260', '1506225111', '0.0.0.0', '1506225111', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100605', '0', '144', '59', '260', '1506225122', '0.0.0.0', '1506225122', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100606', '0', '144', '59', '260', '1506225122', '0.0.0.0', '1506225122', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100607', '0', '144', '59', '260', '1506225123', '0.0.0.0', '1506225123', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100608', '0', '144', '59', '260', '1506225123', '0.0.0.0', '1506225123', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100609', '0', '144', '59', '260', '1506225168', '0.0.0.0', '1506225168', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100610', '0', '144', '59', '260', '1506225168', '0.0.0.0', '1506225168', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100611', '0', '144', '59', '260', '1506225171', '0.0.0.0', '1506225171', null, '0', '0', '0', '0', '0', '0', null, null);
INSERT INTO `bao_order` VALUES ('100612', '0', '144', '59', '520', '1506225946', '0.0.0.0', '1506225946', null, '0', '0', '0', '0', '0', '0', '3f33c34e89812a7c6ae4f4dcdc73b1e4', null);
INSERT INTO `bao_order` VALUES ('100613', '0', '144', '59', '260', '1506231021', '0.0.0.0', '1506231021', null, '0', '0', '0', '0', '0', '0', '42150418', null);
INSERT INTO `bao_order` VALUES ('100614', '0', '144', '59', '260', '1506231036', '0.0.0.0', '1506231036', null, '0', '0', '0', '0', '0', '0', '96573913', null);
INSERT INTO `bao_order` VALUES ('100615', '0', '144', '59', '520', '1506231089', '0.0.0.0', '1506231089', null, '0', '0', '0', '0', '0', '0', '50964167', null);
INSERT INTO `bao_order` VALUES ('100616', '0', '144', '59', '260', '1506231272', '0.0.0.0', '1506231272', null, '0', '0', '0', '0', '0', '0', '54439762', null);
INSERT INTO `bao_order` VALUES ('100617', '0', '144', '59', '260', '1506231324', '0.0.0.0', '1506231324', null, '3', '0', '0', '0', '0', '0', '76642824', null);
INSERT INTO `bao_order` VALUES ('100618', '0', '144', '59', '260', '1506232268', '0.0.0.0', '1506232268', null, '3', '0', '0', '0', '0', '0', '43243243', null);

-- ----------------------------
-- Table structure for `bao_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `bao_order_goods`;
CREATE TABLE `bao_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `js_price` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0' COMMENT '1代表已经发货 2代表申请退款  3代表已经退款',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  `update_time` int(11) DEFAULT '0',
  `update_ip` varchar(15) DEFAULT NULL,
  `is_daofu` tinyint(1) DEFAULT '0',
  `tui_uid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=734 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_order_goods
-- ----------------------------
INSERT INTO `bao_order_goods` VALUES ('58', '100054', '3', '2', '1', '18900', '18900', '0', '8', '1425987850', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('59', '100055', '2', '1', '1', '165011', '165011', '0', '8', '1426037467', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('60', '100056', '3', '2', '1', '18900', '18900', '0', '0', '1426037467', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('61', '100057', '2', '1', '1', '165011', '165011', '0', '0', '1426038286', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('62', '100057', '7', '1', '2', '480000', '960000', '0', '0', '1426038286', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('63', '100057', '8', '1', '1', '139900', '139900', '0', '0', '1426038286', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('64', '100058', '8', '1', '3', '139900', '419700', '0', '0', '1426042862', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('65', '100059', '2', '1', '3', '165011', '495033', '0', '8', '1426055113', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('66', '100060', '3', '2', '3', '18900', '56700', '0', '8', '1426055113', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('67', '100061', '2', '1', '1', '165011', '165011', '0', '8', '1426056740', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('68', '100062', '2', '1', '2', '165011', '330022', '0', '1', '1426056792', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('69', '100063', '3', '2', '2', '18900', '37800', '0', '1', '1426056792', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('105', '100086', '2', '1', '1', '165011', '165011', '0', '1', '1426757801', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('71', '100065', '2', '1', '3', '165011', '495033', '0', '1', '1426065738', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('72', '100065', '6', '1', '2', '480000', '960000', '0', '1', '1426065738', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('73', '100065', '8', '1', '1', '139900', '139900', '0', '1', '1426065738', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('74', '100066', '8', '1', '2', '139900', '279800', '0', '8', '1426066184', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('106', '100086', '8', '1', '1', '139900', '139900', '0', '1', '1426757801', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('80', '100070', '1', '1', '6', '10000', '60000', '0', '0', '1426068754', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('81', '100070', '2', '1', '17', '165011', '2805187', '0', '1', '1426068754', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('82', '100071', '3', '2', '3', '18900', '56700', '0', '8', '1426068754', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('83', '100072', '3', '2', '6', '18900', '113400', '0', '1', '1426069083', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('84', '100072', '5', '2', '1', '10000', '10000', '0', '1', '1426069083', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('85', '100073', '7', '1', '5', '480000', '2400000', '0', '8', '1426069083', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('86', '100074', '3', '2', '1', '18900', '18900', '0', '8', '1426069315', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('87', '100074', '5', '2', '1', '10000', '10000', '0', '8', '1426069315', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('88', '100075', '7', '1', '1', '480000', '480000', '0', '8', '1426069315', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('89', '100076', '4', '95', '3', '180000', '540000', '0', '1', '1426069932', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('90', '100077', '8', '1', '3', '139900', '419700', '0', '0', '1426069932', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('91', '100078', '2', '1', '1', '165011', '165011', '0', '0', '1426070838', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('92', '100078', '5', '8', '1', '10000', '10000', '0', '0', '1426070838', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('93', '100078', '8', '1', '1', '139900', '139900', '0', '0', '1426070838', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('94', '100079', '1', '1', '6', '10000', '60000', '0', '0', '1426071124', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('95', '100079', '2', '1', '10', '165011', '1650110', '0', '0', '1426071124', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('96', '100080', '3', '8', '1', '18900', '18900', '0', '0', '1426071124', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('97', '100080', '5', '8', '1', '10000', '10000', '0', '0', '1426071124', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('98', '100081', '2', '1', '3', '165011', '495033', '0', '1', '1426071256', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('99', '100082', '3', '8', '2', '18900', '37800', '0', '8', '1426071256', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('100', '100083', '2', '1', '1', '165011', '165011', '0', '1', '1426071950', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('101', '100084', '5', '8', '1', '10000', '10000', '0', '1', '1426071950', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('102', '100085', '1', '1', '1', '10000', '10000', '0', '0', '1426128987', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('103', '100085', '2', '1', '1', '165011', '165011', '0', '0', '1426128987', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('104', '100085', '8', '1', '1', '139900', '139900', '0', '0', '1426128987', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('107', '100087', '2', '1', '1', '165011', '165011', '0', '0', '1426764217', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('108', '100087', '8', '1', '1', '139900', '139900', '0', '0', '1426764217', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('109', '100088', '3', '8', '1', '18900', '18900', '0', '0', '1426820277', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('110', '100089', '9', '95', '2', '480000', '960000', '0', '0', '1426820277', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('111', '100090', '3', '8', '1', '18900', '18900', '0', '0', '1426820838', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('112', '100091', '9', '95', '2', '480000', '960000', '0', '0', '1426820838', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('113', '100092', '1', '1', '1', '10000', '10000', '0', '0', '1426820900', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('114', '100093', '3', '8', '1', '18900', '18900', '0', '0', '1426820900', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('115', '100094', '9', '95', '2', '480000', '960000', '0', '0', '1426820900', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('116', '100095', '9', '95', '2', '480000', '960000', '0', '0', '1426821037', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('117', '100096', '9', '95', '1', '480000', '480000', '0', '0', '1426906807', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('118', '100097', '16', '2', '3', '6000', '18000', '0', '1', '1427107811', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('119', '100097', '21', '2', '3', '20000', '60000', '0', '1', '1427107811', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('120', '100098', '19', '6', '9', '5000', '45000', '0', '0', '1427179687', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('121', '100099', '2', '1', '1', '165011', '165011', '0', '1', '1427357472', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('122', '100099', '8', '1', '1', '139900', '139900', '0', '1', '1427357472', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('123', '100100', '13', '5', '1', '3900', '3900', '0', '1', '1427855325', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('124', '100101', '13', '5', '3', '3900', '11700', '0', '0', '1428025392', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('125', '100102', '6', '1', '2', '480000', '960000', '0', '0', '1428027210', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('126', '100103', '2', '1', '2', '165011', '330022', '0', '0', '1428027353', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('127', '100104', '1', '1', '1', '10000', '10000', '0', '0', '1428032254', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('128', '100104', '2', '1', '3', '165011', '495033', '0', '0', '1428032254', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('129', '100104', '7', '1', '3', '480000', '1440000', '0', '0', '1428032254', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('130', '100104', '8', '1', '3', '139900', '419700', '0', '0', '1428032254', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('131', '100104', '10', '1', '1', '48800', '48800', '0', '0', '1428032254', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('132', '100104', '12', '1', '1', '1200', '1200', '0', '0', '1428032254', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('133', '100105', '14', '8', '1', '4000', '4000', '0', '0', '1428387495', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('134', '100106', '14', '8', '4', '4000', '16000', '0', '0', '1428455403', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('135', '100107', '18', '6', '1', '20000', '20000', '0', '0', '1428455788', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('136', '100108', '18', '6', '1', '20000', '20000', '0', '0', '1428455918', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('137', '100109', '11', '9', '1', '59900', '59900', '0', '0', '1428914885', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('138', '100110', '10', '1', '1', '48800', '48800', '0', '8', '1428919674', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('139', '100111', '10', '1', '1', '48800', '48800', '0', '8', '1428919739', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('140', '100112', '2', '1', '3', '165011', '495033', '0', '0', '1429173877', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('141', '100112', '8', '1', '1', '139900', '139900', '0', '0', '1429173877', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('142', '100113', '21', '2', '1', '10000', '10000', '0', '0', '1429231772', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('143', '100114', '2', '1', '1', '165011', '165011', '0', '0', '1429232526', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('144', '100115', '13', '5', '3', '3900', '11700', '0', '0', '1429235685', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('145', '100116', '15', '3', '3', '4800', '14400', '0', '0', '1429242654', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('146', '100117', '2', '1', '2', '165011', '330022', '0', '8', '1429264449', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('147', '100117', '10', '1', '2', '48800', '97600', '0', '8', '1429264449', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('148', '100118', '5', '8', '2', '10000', '20000', '0', '0', '1429773305', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('149', '100119', '20', '5', '2', '13000', '26000', '0', '0', '1429773305', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('150', '100120', '1', '1', '5', '10000', '50000', '0', '0', '1429773454', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('151', '100121', '1', '1', '1', '10000', '10000', '0', '8', '1429775682', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('152', '100121', '10', '1', '1', '48800', '48800', '0', '8', '1429775682', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('153', '100121', '12', '1', '1', '1200', '1200', '0', '8', '1429775682', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('154', '100122', '75', '97', '3', '6900', '20700', '0', '0', '1430133932', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('155', '100122', '96', '97', '2', '7800', '15600', '0', '0', '1430133932', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('156', '100122', '119', '97', '1', '2450', '2450', '0', '0', '1430133932', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('157', '100123', '69', '95', '3', '3800', '11400', '0', '0', '1430907729', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('158', '100123', '80', '95', '3', '4000', '12000', '0', '0', '1430907729', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('159', '100123', '115', '95', '3', '21000', '63000', '0', '0', '1430907729', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('160', '100124', '58', '95', '1', '25000', '25000', '0', '8', '1430964096', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('161', '100124', '68', '95', '2', '42000', '84000', '0', '8', '1430964096', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('162', '100124', '69', '95', '22', '3800', '83600', '0', '8', '1430964096', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('163', '100125', '80', '95', '3', '4000', '12000', '0', '1', '1430965021', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('164', '100125', '115', '95', '1', '21000', '21000', '0', '1', '1430965021', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('165', '100126', '7', '84', '8', '5950', '47600', '0', '0', '1430967620', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('166', '100127', '115', '95', '1', '21000', '21000', '0', '1', '1430979532', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('167', '100128', '29', '40', '1', '5500', '5500', '0', '0', '1431667971', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('168', '100129', '88', '98', '2', '6900', '13800', '0', '0', '1432022636', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('169', '100130', '69', '95', '2', '3800', '7600', '0', '0', '1432098680', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('170', '100131', '69', '95', '1', '3800', '3800', '0', '0', '1432098870', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('171', '100132', '80', '95', '1', '4000', '4000', '0', '0', '1432795821', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('172', '100133', '80', '95', '1', '4000', '4000', '0', '0', '1432796007', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('173', '100134', '80', '95', '1', '4000', '4000', '0', '1', '1432796009', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('174', '100135', '143', '2', '1', '98', '98', '0', '0', '1432951387', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('175', '100136', '4', '85', '1', '1680', '1680', '0', '0', '1432952280', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('176', '100137', '143', '2', '1', '98', '98', '0', '0', '1432953453', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('177', '100138', '69', '95', '1', '3800', '3800', '0', '0', '1432962602', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('178', '100139', '12', '1', '1', '1200', '1200', '0', '1', '1433137572', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('179', '100140', '143', '2', '5', '98', '490', '0', '0', '1434352376', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('180', '100141', '69', '95', '1', '3800', '3800', '0', '0', '1435053554', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('181', '100142', '88', '98', '1', '6900', '6900', '0', '0', '1435198013', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('182', '100143', '143', '2', '1', '98', '98', '0', '0', '1436412471', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('183', '100144', '31', '47', '1', '6600', '6600', '0', '0', '1436427677', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('184', '100145', '69', '95', '1', '3800', '3800', '0', '0', '1436514435', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('185', '100146', '80', '95', '2', '4000', '8000', '0', '0', '1436598261', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('186', '100147', '143', '2', '1', '98', '98', '0', '0', '1437617533', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('187', '100148', '6', '11', '1', '226000', '226000', '0', '0', '1437617559', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('188', '100149', '4', '85', '2', '1680', '3360', '0', '0', '1437618333', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('189', '100150', '4', '85', '2', '1680', '3360', '0', '0', '1437618353', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('190', '100151', '96', '97', '1', '7800', '7800', '0', '0', '1437626522', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('191', '100152', '69', '95', '1', '3800', '3800', '0', '0', '1437706080', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('192', '100153', '69', '95', '1', '3800', '3800', '0', '0', '1437707078', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('193', '100154', '69', '95', '1', '3800', '3800', '0', '0', '1437707719', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('194', '100155', '69', '95', '1', '3800', '3800', '0', '0', '1437707910', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('195', '100156', '143', '2', '1', '98', '98', '0', '0', '1438158258', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('196', '100157', '131', '2', '2', '150', '300', '0', '0', '1438237402', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('197', '100157', '143', '2', '2', '98', '196', '0', '0', '1438237402', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('198', '100158', '24', '41', '2', '3490', '6980', '0', '0', '1438927043', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('199', '100159', '69', '95', '22', '3800', '83600', '0', '0', '1438927043', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('200', '100159', '117', '95', '8', '399900', '3199200', '0', '0', '1438927043', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('201', '100160', '24', '41', '2', '3490', '6980', '0', '0', '1438927067', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('202', '100161', '69', '95', '22', '3800', '83600', '0', '0', '1438927067', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('203', '100161', '117', '95', '8', '399900', '3199200', '0', '0', '1438927067', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('204', '100162', '24', '41', '2', '3490', '6980', '0', '0', '1438927073', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('205', '100163', '69', '95', '22', '3800', '83600', '0', '0', '1438927073', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('206', '100163', '117', '95', '8', '399900', '3199200', '0', '0', '1438927073', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('207', '100164', '85', '16', '1', '138000', '138000', '0', '0', '1438927199', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('208', '100165', '85', '16', '1', '138000', '138000', '0', '0', '1438927238', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('209', '100166', '34', '43', '1', '6300', '6300', '0', '0', '1438928407', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('210', '100167', '69', '95', '1', '3800', '3800', '0', '0', '1438928407', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('211', '100168', '117', '95', '2', '399900', '799800', '0', '0', '1439175874', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('212', '100169', '117', '95', '2', '399900', '799800', '0', '0', '1439175903', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('213', '100170', '34', '43', '1', '6300', '6300', '0', '0', '1439175925', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('214', '100171', '34', '43', '1', '6300', '6300', '0', '0', '1439176108', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('215', '100172', '69', '95', '1', '3800', '3800', '0', '0', '1439202112', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('216', '100173', '69', '95', '5', '3800', '19000', '0', '0', '1439253802', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('217', '100174', '69', '95', '5', '3800', '19000', '0', '0', '1439254048', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('218', '100175', '69', '95', '2', '3800', '7600', '0', '0', '1439254692', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('219', '100176', '69', '95', '2', '3800', '7600', '0', '0', '1439254875', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('220', '100177', '69', '95', '2', '3800', '7600', '0', '0', '1439255104', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('221', '100178', '69', '95', '1', '3800', '3800', '0', '0', '1439258918', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('222', '100179', '34', '43', '1', '6300', '6300', '0', '0', '1439259012', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('223', '100180', '24', '41', '1', '3490', '3490', '0', '0', '1439260346', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('224', '100181', '69', '95', '1', '3800', '3800', '0', '0', '1439260534', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('225', '100182', '69', '95', '1', '3800', '3800', '0', '0', '1439260840', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('226', '100183', '72', '95', '1', '3200', '3200', '0', '0', '1439261841', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('227', '100184', '34', '43', '1', '6300', '6300', '0', '0', '1439262415', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('228', '100185', '24', '41', '1', '3490', '3490', '0', '0', '1439262584', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('229', '100186', '27', '40', '1', '4280', '4280', '0', '0', '1439262815', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('230', '100187', '69', '95', '1', '3800', '3800', '0', '0', '1439264478', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('231', '100188', '34', '43', '1', '6300', '6300', '0', '0', '1439269092', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('232', '100189', '69', '95', '1', '3800', '3800', '0', '0', '1439269092', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('233', '100190', '5', '84', '2', '3190', '6380', '0', '0', '1439272565', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('234', '100191', '69', '95', '2', '3800', '7600', '0', '0', '1439272565', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('235', '100192', '23', '40', '1', '2500', '2500', '0', '0', '1439273039', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('236', '100193', '1', '85', '2', '2990', '5980', '0', '0', '1439278197', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('237', '100194', '8', '39', '3', '1420', '4260', '0', '0', '1439278197', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('238', '100195', '31', '47', '2', '6600', '13200', '0', '0', '1439278197', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('239', '100196', '30', '41', '1', '2750', '2750', '0', '0', '1439278361', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('240', '100197', '34', '43', '1', '6300', '6300', '0', '0', '1439278361', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('241', '100198', '1', '85', '1', '2990', '2990', '0', '0', '1439278421', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('242', '100199', '30', '41', '1', '2750', '2750', '0', '0', '1439278700', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('243', '100200', '32', '42', '1', '4800', '4800', '0', '0', '1439278700', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('244', '100201', '32', '42', '1', '4800', '4800', '0', '0', '1439278803', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('245', '100202', '1', '85', '5', '2990', '14950', '0', '0', '1439278870', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('246', '100203', '31', '47', '3', '6600', '19800', '0', '0', '1439278870', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('247', '100204', '30', '41', '1', '2750', '2750', '0', '0', '1439278930', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('248', '100205', '34', '43', '1', '6300', '6300', '0', '0', '1439278930', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('249', '100206', '34', '43', '2', '6300', '12600', '0', '0', '1439279107', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('250', '100207', '49', '20', '1', '199900', '199900', '0', '0', '1439279107', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('251', '100208', '32', '42', '1', '4800', '4800', '0', '0', '1439279243', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('252', '100209', '33', '46', '1', '3579', '3579', '0', '0', '1439279397', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('253', '100210', '34', '43', '1', '6300', '6300', '0', '0', '1439279397', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('254', '100211', '39', '87', '1', '4490', '4490', '0', '0', '1439279631', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('255', '100212', '72', '95', '1', '3200', '3200', '0', '0', '1439279631', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('256', '100213', '34', '43', '1', '6300', '6300', '0', '0', '1439279781', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('257', '100214', '69', '95', '1', '3800', '3800', '0', '0', '1439279781', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('258', '100215', '1', '85', '1', '2990', '2990', '0', '0', '1439279986', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('259', '100215', '2', '85', '1', '990', '990', '0', '0', '1439279986', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('260', '100216', '69', '95', '1', '3800', '3800', '0', '0', '1439279986', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('261', '100217', '1', '85', '1', '2990', '2990', '0', '0', '1439280319', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('262', '100217', '2', '85', '1', '990', '990', '0', '0', '1439280319', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('263', '100218', '69', '95', '1', '3800', '3800', '0', '0', '1439280319', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('264', '100219', '1', '85', '2', '2990', '5980', '0', '0', '1439280549', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('265', '100219', '2', '85', '2', '990', '1980', '0', '0', '1439280549', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('266', '100220', '69', '95', '2', '3800', '7600', '0', '0', '1439280549', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('267', '100221', '69', '95', '1', '3800', '3800', '0', '0', '1439280677', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('268', '100222', '34', '43', '1', '6300', '6300', '0', '0', '1439280956', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('269', '100223', '69', '95', '1', '3800', '3800', '0', '0', '1439280956', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('270', '100224', '1', '85', '1', '2990', '2990', '0', '0', '1439281754', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('271', '100224', '2', '85', '1', '990', '990', '0', '0', '1439281754', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('272', '100225', '69', '95', '1', '3800', '3800', '0', '0', '1439281754', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('273', '100226', '69', '95', '1', '3800', '3800', '0', '0', '1439285962', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('274', '100226', '72', '95', '2', '3200', '6400', '0', '0', '1439285962', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('275', '100227', '3', '99', '4', '1200', '4800', '0', '0', '1439520424', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('276', '100228', '9', '87', '13', '180', '2340', '0', '0', '1439521427', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('277', '100229', '2', '85', '4', '990', '3960', '0', '0', '1439532806', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('278', '100230', '34', '43', '1', '6300', '6300', '0', '0', '1439532886', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('279', '100231', '15', '3', '1', '4800', '4800', '0', '0', '1439538453', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('280', '100232', '15', '3', '1', '4800', '4800', '0', '0', '1439538538', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('281', '100233', '102', '12', '1', '89900', '89900', '0', '0', '1439538568', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('282', '100234', '4', '85', '2', '1680', '3360', '0', '0', '1439545562', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('283', '100235', '4', '85', '1', '1680', '1680', '0', '0', '1439545729', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('284', '100236', '16', '2', '23', '4000', '92000', '0', '0', '1439603840', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('285', '100236', '131', '2', '6', '150', '900', '0', '0', '1439603840', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('286', '100236', '143', '2', '10', '98', '980', '0', '0', '1439603840', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('287', '100237', '21', '2', '4', '10000', '40000', '0', '0', '1439604700', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('288', '100238', '16', '2', '2', '4000', '8000', '0', '0', '1439604717', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('289', '100238', '131', '2', '2', '150', '300', '0', '0', '1439604717', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('290', '100238', '143', '2', '3', '98', '294', '0', '0', '1439604717', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('291', '100239', '16', '2', '2', '4000', '8000', '0', '0', '1439604908', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('292', '100239', '131', '2', '2', '150', '300', '0', '0', '1439604908', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('293', '100239', '143', '2', '3', '98', '294', '0', '0', '1439604908', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('294', '100240', '16', '2', '3', '4000', '12000', '0', '0', '1439605193', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('295', '100240', '131', '2', '3', '150', '450', '0', '0', '1439605193', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('296', '100240', '143', '2', '5', '98', '490', '0', '0', '1439605193', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('297', '100241', '16', '2', '1', '4000', '4000', '0', '0', '1439605219', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('298', '100241', '21', '2', '1', '10000', '10000', '0', '0', '1439605219', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('299', '100241', '131', '2', '1', '150', '150', '0', '0', '1439605219', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('300', '100241', '143', '2', '1', '98', '98', '0', '0', '1439605219', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('301', '100242', '16', '2', '3', '4000', '12000', '0', '0', '1439605643', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('302', '100242', '21', '2', '3', '10000', '30000', '0', '0', '1439605643', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('303', '100242', '131', '2', '10', '150', '1500', '0', '0', '1439605643', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('304', '100242', '143', '2', '6', '98', '588', '0', '0', '1439605643', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('305', '100243', '16', '2', '6', '4000', '24000', '0', '0', '1439609262', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('306', '100243', '131', '2', '1', '150', '150', '0', '0', '1439609262', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('307', '100244', '88', '98', '2', '6900', '13800', '0', '0', '1439609262', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('308', '100245', '16', '2', '6', '4000', '24000', '0', '0', '1439609290', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('309', '100245', '131', '2', '1', '150', '150', '0', '0', '1439609290', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('310', '100246', '88', '98', '2', '6900', '13800', '0', '0', '1439609290', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('311', '100247', '143', '2', '1', '98', '98', '0', '0', '1439625019', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('312', '100248', '143', '2', '1', '98', '98', '0', '0', '1439626784', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('313', '100249', '36', '85', '4', '14900', '59600', '0', '0', '1439628485', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('314', '100249', '40', '85', '5', '56000', '280000', '0', '0', '1439628485', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('315', '100249', '41', '85', '1', '19600', '19600', '0', '0', '1439628485', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('316', '100249', '91', '85', '1', '7900', '7900', '0', '0', '1439628485', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('317', '100249', '110', '85', '1', '1889', '1889', '0', '0', '1439628485', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('318', '100249', '150', '85', '2', '2680', '5360', '0', '0', '1439628485', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('319', '100250', '24', '41', '1', '3490', '3490', '0', '0', '1439633333', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('320', '100251', '24', '41', '1', '3490', '3490', '0', '0', '1439633335', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('321', '100252', '25', '42', '1', '1770', '1770', '0', '0', '1439633586', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('322', '100253', '24', '41', '1', '3490', '3490', '0', '0', '1439634332', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('323', '100254', '117', '95', '5', '399900', '1999500', '0', '0', '1439772342', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('324', '100255', '34', '43', '1', '6300', '6300', '0', '0', '1439772435', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('325', '100256', '30', '41', '1', '2750', '2750', '0', '0', '1439772912', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('326', '100257', '148', '1', '9', '3990', '35910', '0', '0', '1439777921', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('327', '100258', '143', '2', '1', '98', '98', '0', '0', '1439790104', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('328', '100259', '16', '2', '1', '4000', '4000', '0', '0', '1439790865', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('329', '100260', '69', '95', '1', '3800', '3800', '0', '0', '1439792449', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('330', '100261', '143', '2', '1', '98', '98', '0', '0', '1439793899', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('331', '100262', '34', '43', '12', '6300', '75600', '0', '0', '1439794915', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('332', '100263', '69', '95', '1', '3800', '3800', '0', '0', '1439794915', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('333', '100264', '143', '2', '6', '98', '588', '0', '0', '1439805846', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('334', '100265', '4', '85', '1', '1680', '1680', '0', '0', '1439805967', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('335', '100266', '4', '85', '4', '1680', '6720', '0', '0', '1439806061', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('336', '100267', '4', '85', '1', '1680', '1680', '0', '0', '1439806109', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('337', '100268', '6', '11', '1', '226000', '226000', '0', '0', '1439806425', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('338', '100269', '29', '40', '1', '5500', '5500', '0', '0', '1439806425', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('339', '100270', '29', '40', '1', '5500', '5500', '0', '0', '1439808942', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('340', '100271', '143', '2', '1', '98', '98', '0', '0', '1439862009', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('341', '100272', '3', '99', '1', '1200', '1200', '0', '0', '1439862071', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('342', '100273', '12', '1', '1', '1200', '1200', '0', '0', '1439862071', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('343', '100274', '16', '2', '1', '4000', '4000', '0', '0', '1439863879', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('344', '100274', '131', '2', '1', '150', '150', '0', '0', '1439863879', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('345', '100274', '143', '2', '1', '98', '98', '0', '0', '1439863879', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('346', '100275', '25', '42', '1', '1770', '1770', '0', '0', '1439863879', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('347', '100275', '32', '42', '1', '4800', '4800', '0', '0', '1439863879', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('348', '100276', '143', '2', '1', '98', '98', '0', '0', '1439864603', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('349', '100277', '111', '18', '6', '89800', '538800', '0', '0', '1439875504', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('350', '100278', '52', '15', '3', '299900', '899700', '0', '0', '1439875681', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('351', '100279', '143', '2', '1', '98', '98', '0', '0', '1439876883', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('352', '100280', '4', '85', '13', '1680', '21840', '0', '0', '1439877055', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('353', '100281', '8', '39', '2', '1420', '2840', '0', '0', '1439880993', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('354', '100282', '12', '1', '1', '1200', '1200', '0', '0', '1439880993', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('355', '100282', '130', '1', '1', '4000', '4000', '0', '0', '1439880993', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('356', '100282', '148', '1', '1', '3990', '3990', '0', '0', '1439880993', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('357', '100283', '28', '44', '2', '2990', '5980', '0', '0', '1439880993', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('358', '100284', '30', '41', '5', '2750', '13750', '0', '0', '1439880993', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('359', '100285', '33', '46', '2', '3579', '7158', '0', '0', '1439880993', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('360', '100286', '120', '20', '1', '26800', '26800', '0', '0', '1439880993', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('361', '100287', '123', '19', '1', '49800', '49800', '0', '0', '1439880993', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('362', '100288', '153', '17', '1', '689900', '689900', '0', '0', '1439880993', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('363', '100289', '8', '39', '2', '1420', '2840', '0', '0', '1439881003', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('364', '100290', '12', '1', '1', '1200', '1200', '0', '0', '1439881003', '127.0.0.1', '1440476869', '127.0.0.1', '0', '0');
INSERT INTO `bao_order_goods` VALUES ('365', '100290', '130', '1', '1', '4000', '4000', '0', '0', '1439881003', '127.0.0.1', '1440476869', '127.0.0.1', '0', '0');
INSERT INTO `bao_order_goods` VALUES ('366', '100290', '148', '1', '1', '3990', '3990', '0', '0', '1439881003', '127.0.0.1', '1440476869', '127.0.0.1', '0', '0');
INSERT INTO `bao_order_goods` VALUES ('367', '100291', '28', '44', '2', '2990', '5980', '0', '0', '1439881003', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('368', '100292', '30', '41', '5', '2750', '13750', '0', '0', '1439881003', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('369', '100293', '33', '46', '2', '3579', '7158', '0', '0', '1439881003', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('370', '100294', '120', '20', '1', '26800', '26800', '0', '0', '1439881003', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('371', '100295', '123', '19', '1', '49800', '49800', '0', '0', '1439881003', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('372', '100296', '153', '17', '1', '689900', '689900', '0', '0', '1439881003', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('373', '100297', '34', '43', '1', '6300', '6300', '0', '0', '1439954085', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('374', '100298', '69', '95', '1', '3800', '3800', '0', '0', '1439954085', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('375', '100299', '69', '95', '1', '3800', '3800', '0', '0', '1439955160', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('376', '100300', '145', '17', '2', '179900', '359800', '0', '0', '1439970352', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('377', '100301', '148', '1', '1', '3990', '3990', '0', '0', '1439970352', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('378', '100302', '24', '41', '4', '3490', '13960', '0', '0', '1440052816', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('379', '100302', '30', '41', '2', '2750', '5500', '0', '0', '1440052816', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('380', '100303', '31', '47', '11', '6600', '72600', '0', '0', '1440052816', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('381', '100304', '24', '41', '4', '3490', '13960', '0', '0', '1440052818', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('382', '100304', '30', '41', '2', '2750', '5500', '0', '0', '1440052818', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('383', '100305', '31', '47', '11', '6600', '72600', '0', '0', '1440052818', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('384', '100306', '24', '41', '4', '3490', '13960', '0', '0', '1440052820', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('385', '100306', '30', '41', '2', '2750', '5500', '0', '0', '1440052820', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('386', '100307', '31', '47', '11', '6600', '72600', '0', '0', '1440052820', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('387', '100308', '63', '95', '5', '50000', '250000', '0', '0', '1440055186', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('388', '100309', '114', '18', '2', '299900', '599800', '0', '0', '1440055186', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('389', '100310', '24', '41', '1', '3490', '3490', '0', '0', '1440056442', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('390', '100310', '30', '41', '1', '2750', '2750', '0', '0', '1440056442', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('391', '100311', '63', '95', '5', '50000', '250000', '0', '0', '1440056441', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('392', '100312', '114', '18', '2', '299900', '599800', '0', '0', '1440056441', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('393', '100313', '22', '39', '1', '7500', '7500', '0', '0', '1440057023', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('394', '100314', '22', '39', '1', '7500', '7500', '0', '0', '1440059781', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('395', '100315', '24', '41', '9', '3490', '31410', '0', '0', '1440060490', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('396', '100316', '24', '41', '1', '3490', '3490', '0', '0', '1440062776', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('397', '100317', '69', '95', '1', '3800', '3800', '0', '0', '1440062776', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('398', '100318', '24', '41', '1', '3490', '3490', '0', '0', '1440063294', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('399', '100319', '69', '95', '1', '3800', '3800', '0', '0', '1440063294', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('400', '100320', '34', '43', '1', '6300', '6300', '0', '0', '1440064601', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('401', '100321', '1', '85', '1', '2990', '2990', '0', '0', '1440124174', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('402', '100322', '114', '18', '1', '299900', '299900', '0', '0', '1440124174', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('403', '100323', '31', '47', '1', '6600', '6600', '0', '0', '1440135423', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('404', '100324', '31', '47', '1', '6600', '6600', '0', '0', '1440136471', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('405', '100325', '31', '47', '1', '6600', '6600', '0', '0', '1440136831', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('406', '100326', '9', '87', '1', '180', '180', '0', '0', '1440138790', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('407', '100327', '143', '2', '1', '98', '98', '0', '0', '1440138991', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('408', '100328', '143', '2', '18', '98', '1764', '0', '0', '1440139245', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('409', '100329', '69', '95', '1', '3800', '3800', '0', '0', '1440153171', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('410', '100330', '69', '95', '1', '3800', '3800', '0', '0', '1440206175', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('411', '100331', '145', '17', '1', '179900', '179900', '0', '0', '1440206752', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('412', '100332', '145', '17', '1', '179900', '179900', '0', '0', '1440206757', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('413', '100333', '69', '95', '1', '3800', '3800', '0', '0', '1440206796', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('414', '100334', '30', '41', '1', '2750', '2750', '0', '0', '1440208163', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('415', '100335', '69', '95', '1', '3800', '3800', '0', '0', '1440221183', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('416', '100336', '148', '1', '3', '3990', '11970', '0', '0', '1440221183', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('417', '100337', '69', '95', '1', '3800', '3800', '0', '0', '1440221278', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('418', '100338', '148', '1', '3', '3990', '11970', '0', '0', '1440221278', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('419', '100339', '69', '95', '1', '3800', '3800', '0', '0', '1440221858', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('420', '100340', '69', '95', '1', '3800', '3800', '0', '0', '1440222018', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('421', '100341', '69', '95', '1', '3800', '3800', '0', '0', '1440222898', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('422', '100342', '148', '1', '1', '3990', '3990', '0', '0', '1440222898', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('423', '100343', '72', '95', '1', '3200', '3200', '0', '0', '1440222920', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('424', '100344', '34', '43', '2', '6300', '12600', '0', '0', '1440224751', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('425', '100345', '24', '41', '1', '3490', '3490', '0', '0', '1440228233', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('426', '100346', '24', '41', '1', '3490', '3490', '0', '0', '1440228925', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('427', '100347', '24', '41', '1', '3490', '3490', '0', '0', '1440228989', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('428', '100348', '145', '17', '1', '179900', '179900', '0', '0', '1440229705', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('429', '100349', '4', '85', '1', '1680', '1680', '0', '0', '1440233440', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('430', '100350', '148', '1', '1', '3990', '3990', '0', '8', '1440396909', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('431', '100351', '13', '5', '3', '3900', '11700', '0', '0', '1440400048', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('432', '100352', '131', '2', '2', '150', '300', '0', '0', '1440400353', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('433', '100353', '9', '87', '2', '180', '360', '0', '0', '1440400796', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('434', '100354', '35', '84', '1', '1390', '1390', '0', '0', '1440403661', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('435', '100355', '5', '84', '1', '3190', '3190', '0', '0', '1440403797', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('436', '100356', '69', '95', '1', '3800', '3800', '0', '0', '1440403797', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('437', '100357', '69', '95', '1', '3800', '3800', '0', '0', '1440405642', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('438', '100358', '3', '99', '1', '1200', '1200', '0', '0', '1440406038', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('439', '100359', '69', '95', '1', '3800', '3800', '0', '0', '1440406167', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('440', '100360', '69', '95', '1', '3800', '3800', '0', '0', '1440406201', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('441', '100361', '69', '95', '1', '3800', '3800', '0', '0', '1440406251', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('442', '100362', '148', '1', '1', '3990', '3990', '0', '0', '1440406298', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('443', '100363', '148', '1', '1', '3990', '3990', '0', '0', '1440406472', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('444', '100364', '148', '1', '10', '3990', '39900', '0', '0', '1440407010', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('445', '100365', '148', '1', '1', '3990', '3990', '0', '0', '1440411018', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('446', '100366', '148', '1', '1', '3990', '3990', '0', '0', '1440411026', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('447', '100367', '148', '1', '1', '3990', '3990', '0', '0', '1440411035', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('448', '100368', '12', '1', '1', '1200', '1200', '0', '0', '1440411057', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('449', '100368', '130', '1', '1', '4000', '4000', '0', '0', '1440411057', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('450', '100368', '148', '1', '1', '3990', '3990', '0', '0', '1440411057', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('451', '100369', '12', '1', '1', '1200', '1200', '0', '0', '1440411066', '127.0.0.1', '1440553902', '127.0.0.1', '0', '0');
INSERT INTO `bao_order_goods` VALUES ('452', '100369', '130', '1', '1', '4000', '4000', '0', '0', '1440411066', '127.0.0.1', '1440553902', '127.0.0.1', '0', '0');
INSERT INTO `bao_order_goods` VALUES ('453', '100369', '148', '1', '1', '3990', '3990', '0', '0', '1440411066', '127.0.0.1', '1440553902', '127.0.0.1', '0', '0');
INSERT INTO `bao_order_goods` VALUES ('454', '100370', '143', '2', '7', '98', '686', '0', '0', '1440486348', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('455', '100371', '5', '84', '1', '3190', '3190', '0', '0', '1440552236', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('456', '100372', '34', '43', '1', '6300', '6300', '0', '0', '1440552236', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('457', '100373', '5', '84', '1', '3190', '3190', '0', '0', '1440554394', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('458', '100374', '34', '43', '1', '6300', '6300', '0', '0', '1440554394', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('459', '100375', '72', '95', '1', '3200', '3200', '0', '0', '1440567401', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('460', '100376', '148', '1', '2', '3990', '7980', '0', '0', '1440567401', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('461', '100377', '72', '95', '1', '3200', '3200', '0', '0', '1440567486', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('462', '100378', '148', '1', '2', '3990', '7980', '0', '0', '1440567486', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('463', '100379', '29', '40', '11', '5500', '60500', '0', '0', '1440572834', '127.0.0.1', '1440572985', '127.0.0.1', '1', '0');
INSERT INTO `bao_order_goods` VALUES ('464', '100380', '58', '95', '1', '25000', '25000', '0', '0', '1440579560', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('465', '100380', '117', '95', '1', '399900', '399900', '0', '0', '1440579560', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('466', '100381', '59', '15', '3', '508000', '1524000', '0', '0', '1440579560', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('467', '100382', '34', '43', '1', '6300', '6300', '0', '0', '1440580321', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('468', '100383', '117', '95', '1', '399900', '399900', '0', '0', '1440580381', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('469', '100384', '148', '1', '1', '3990', '3990', '0', '0', '1440580381', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('470', '100385', '24', '41', '1', '3490', '3490', '0', '0', '1440583666', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('471', '100386', '63', '95', '1', '50000', '50000', '0', '0', '1440583666', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('472', '100386', '69', '95', '2', '3800', '7600', '0', '0', '1440583666', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('473', '100386', '117', '95', '2', '399900', '799800', '0', '0', '1440583666', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('474', '100387', '148', '1', '1', '3990', '3990', '0', '0', '1440583666', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('475', '100388', '153', '17', '2', '689900', '1379800', '0', '0', '1440583666', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('476', '100389', '24', '41', '1', '3490', '3490', '0', '0', '1440583771', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('477', '100390', '153', '17', '1', '689900', '689900', '0', '0', '1440583771', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('478', '100391', '24', '41', '5', '3490', '17450', '0', '0', '1440583955', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('479', '100392', '31', '47', '1', '6600', '6600', '0', '0', '1440583955', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('480', '100393', '58', '95', '1', '25000', '25000', '0', '0', '1440583955', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('481', '100393', '69', '95', '1', '3800', '3800', '0', '0', '1440583955', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('482', '100394', '148', '1', '1', '3990', '3990', '0', '0', '1440583955', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('483', '100395', '24', '41', '1', '3490', '3490', '0', '0', '1440584357', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('484', '100396', '26', '45', '1', '8900', '8900', '0', '0', '1440584486', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('485', '100397', '5', '84', '1', '3190', '3190', '0', '0', '1440584580', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('486', '100398', '52', '15', '1', '299900', '299900', '0', '0', '1440584684', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('487', '100399', '58', '95', '1', '25000', '25000', '0', '0', '1440638553', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('488', '100400', '53', '18', '1', '198000', '198000', '0', '0', '1440638713', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('489', '100401', '58', '95', '1', '25000', '25000', '0', '0', '1440638713', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('490', '100401', '63', '95', '1', '50000', '50000', '0', '0', '1440638713', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('491', '100402', '23', '40', '1', '2500', '2500', '0', '0', '1440639061', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('492', '100402', '27', '40', '1', '4280', '4280', '0', '0', '1440639061', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('493', '100402', '29', '40', '1', '5500', '5500', '0', '0', '1440639061', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('494', '100403', '69', '95', '1', '3800', '3800', '0', '0', '1440666266', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('495', '100404', '148', '1', '1', '3990', '3990', '0', '0', '1440743307', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('496', '100405', '16', '2', '30', '4000', '120000', '0', '0', '1440809571', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('497', '100406', '16', '2', '30', '4000', '120000', '0', '0', '1440809607', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('498', '100407', '16', '2', '4', '4000', '16000', '0', '0', '1440810322', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('499', '100408', '16', '2', '1', '4000', '4000', '0', '0', '1440811107', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('500', '100408', '21', '2', '1', '10000', '10000', '0', '0', '1440811107', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('501', '100408', '131', '2', '1', '150', '150', '0', '0', '1440811107', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('502', '100408', '143', '2', '1', '98', '98', '0', '0', '1440811107', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('503', '100409', '143', '2', '3', '98', '294', '0', '0', '1440819412', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('504', '100410', '143', '2', '5', '98', '490', '0', '0', '1440819710', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('505', '100411', '21', '2', '8', '10000', '80000', '0', '0', '1440831664', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('506', '100412', '24', '41', '1', '3490', '3490', '0', '0', '1440833164', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('507', '100413', '69', '95', '1', '3800', '3800', '0', '0', '1440833164', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('508', '100414', '148', '1', '1', '3990', '3990', '0', '0', '1440833589', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('509', '100415', '30', '41', '1', '2750', '2750', '2650', '0', '1440833891', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('510', '100416', '69', '95', '1', '3800', '3800', '3700', '0', '1440833891', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('511', '100417', '32', '42', '6', '4800', '28800', '28200', '0', '1440833928', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('512', '100418', '131', '2', '1', '150', '150', '0', '0', '1440987012', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('513', '100419', '16', '2', '17', '4000', '68000', '0', '0', '1440987387', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('514', '100420', '16', '2', '17', '4000', '68000', '0', '0', '1440987393', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('515', '100421', '148', '1', '2', '3990', '7980', '7780', '0', '1440987611', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('516', '100422', '155', '20', '2', '189900', '379800', '379600', '0', '1440987611', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('517', '100423', '69', '95', '1', '3800', '3800', '3700', '0', '1440987888', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('518', '100424', '69', '95', '1', '3800', '3800', '3700', '0', '1440988321', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('519', '100425', '8', '39', '11', '1420', '15620', '0', '0', '1441005584', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('520', '100425', '22', '39', '2', '7500', '15000', '0', '0', '1441005584', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('521', '100426', '131', '2', '1', '150', '150', '0', '0', '1441087268', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('522', '100427', '131', '2', '1', '150', '150', '0', '0', '1441088209', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('523', '100428', '131', '2', '1', '150', '150', '0', '0', '1441088713', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('524', '100429', '16', '2', '4', '4000', '16000', '0', '0', '1441089242', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('525', '100430', '16', '2', '2', '4000', '8000', '0', '0', '1441089537', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('526', '100431', '16', '2', '2', '4000', '8000', '0', '0', '1441090554', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('527', '100432', '69', '95', '2', '3800', '7600', '7400', '0', '1441095315', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('528', '100433', '69', '95', '2', '3800', '7600', '7400', '0', '1441095478', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('529', '100434', '69', '95', '1', '3800', '3800', '3700', '0', '1441096034', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('530', '100435', '117', '95', '2', '399900', '799800', '799600', '0', '1441096255', '127.0.0.1', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('531', '100436', '117', '95', '2', '399900', '799800', '799600', '0', '1441097282', '127.0.0.1', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('532', '100437', '131', '2', '1', '150', '150', '50', '0', '1443186237', '219.145.179.207', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('533', '100438', '143', '2', '1', '200', '200', '100', '0', '1443238095', '219.145.179.207', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('534', '100439', '9', '87', '2', '180', '360', '160', '0', '1443422739', '27.13.30.10', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('535', '100440', '16', '2', '2', '4000', '8000', '7800', '0', '1443748494', '27.13.30.178', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('536', '100440', '131', '2', '3', '150', '450', '150', '0', '1443748494', '27.13.30.178', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('537', '100441', '34', '43', '1', '6300', '6300', '6200', '0', '1443752823', '27.13.30.178', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('538', '100442', '16', '2', '1', '4000', '4000', '3900', '0', '1443752926', '27.13.30.178', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('539', '100443', '24', '41', '1', '3490', '3490', '3390', '0', '1444068413', '14.215.166.57', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('540', '100444', '34', '43', '1', '6300', '6300', '6200', '0', '1444068413', '14.215.166.57', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('541', '100445', '2', '85', '1', '990', '990', '890', '0', '1444185656', '1.27.105.53', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('542', '100445', '110', '85', '1', '1889', '1889', '1789', '0', '1444185656', '1.27.105.53', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('543', '100446', '8', '39', '1', '1420', '1420', '1320', '0', '1444186633', '1.27.105.53', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('544', '100447', '2', '85', '1', '990', '990', '890', '0', '1444196637', '1.27.105.53', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('545', '100448', '7', '84', '3', '5950', '17850', '17550', '0', '1444276360', '223.104.25.91', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('546', '100449', '10', '85', '1', '48800', '48800', '48700', '0', '1444276360', '223.104.25.91', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('547', '100450', '7', '84', '3', '5950', '17850', '17550', '0', '1444276363', '223.104.25.91', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('548', '100451', '10', '85', '1', '48800', '48800', '48700', '0', '1444276363', '223.104.25.91', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('549', '100452', '7', '84', '3', '5950', '17850', '17550', '0', '1444276384', '223.104.25.91', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('550', '100453', '10', '85', '1', '48800', '48800', '48700', '0', '1444276384', '223.104.25.91', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('551', '100454', '6', '11', '2', '226000', '452000', '451800', '0', '1444279824', '223.104.25.91', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('552', '100455', '6', '11', '2', '226000', '452000', '451800', '0', '1444279826', '223.104.25.91', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('553', '100456', '6', '11', '2', '226000', '452000', '451800', '0', '1444279828', '223.104.25.91', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('554', '100457', '6', '11', '2', '226000', '452000', '451800', '0', '1444279829', '223.104.25.91', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('555', '100458', '6', '11', '5', '226000', '1130000', '1129500', '0', '1444279853', '223.104.25.91', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('556', '100459', '7', '84', '1', '5950', '5950', '5850', '0', '1444291356', '27.13.29.105', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('557', '100460', '7', '84', '1', '5950', '5950', '5850', '0', '1444291740', '27.13.29.105', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('558', '100461', '45', '12', '2', '239900', '479800', '479600', '0', '1444317371', '27.13.29.105', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('559', '100462', '148', '1', '1', '3990', '3990', '3890', '0', '1444317371', '27.13.29.105', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('560', '100463', '162', '127', '3', '8800', '26400', '26100', '0', '1444317371', '27.13.29.105', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('561', '100464', '162', '127', '15', '8800', '132000', '130500', '0', '1444318191', '27.13.29.105', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('562', '100465', '162', '127', '15', '8800', '132000', '130500', '0', '1444318435', '27.13.29.105', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('563', '100466', '162', '127', '1', '8800', '8800', '8700', '0', '1444320874', '27.13.29.105', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('564', '100467', '7', '84', '1', '5950', '5950', '5850', '0', '1444467681', '27.13.29.105', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('565', '100468', '7', '84', '1', '5950', '5950', '5850', '0', '1444533154', '27.13.154.156', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('566', '100469', '4', '85', '6', '1680', '10080', '9480', '0', '1444969253', '27.13.25.194', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('567', '100470', '16', '2', '4', '4000', '16000', '15600', '0', '1445043224', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('568', '100470', '131', '2', '2', '150', '300', '100', '0', '1445043224', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('569', '100471', '16', '2', '4', '4000', '16000', '15600', '0', '1445044488', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('570', '100471', '131', '2', '2', '150', '300', '100', '0', '1445044488', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('571', '100472', '16', '2', '4', '4000', '16000', '15600', '0', '1445044900', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('572', '100472', '131', '2', '2', '150', '300', '100', '0', '1445044900', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('573', '100473', '7', '84', '1', '5950', '5950', '5850', '0', '1445045311', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('574', '100474', '16', '2', '4', '4000', '16000', '15600', '0', '1445045311', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('575', '100474', '131', '2', '2', '150', '300', '100', '0', '1445045311', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('576', '100475', '7', '84', '1', '5950', '5950', '5850', '0', '1445045378', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('577', '100476', '16', '2', '4', '4000', '16000', '15600', '0', '1445045378', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('578', '100476', '131', '2', '2', '150', '300', '100', '0', '1445045378', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('579', '100477', '7', '84', '1', '5950', '5950', '5850', '0', '1445045606', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('580', '100478', '16', '2', '4', '4000', '16000', '15600', '0', '1445045606', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('581', '100478', '131', '2', '2', '150', '300', '100', '0', '1445045606', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('582', '100479', '163', '130', '1', '200', '200', '100', '0', '1445045606', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('583', '100480', '7', '84', '2', '5950', '11900', '11700', '0', '1445045838', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('584', '100481', '16', '2', '4', '4000', '16000', '15600', '0', '1445045838', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('585', '100481', '131', '2', '2', '150', '300', '100', '0', '1445045838', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('586', '100482', '163', '130', '1', '200', '200', '100', '0', '1445045838', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('587', '100483', '7', '84', '2', '5950', '11900', '11700', '0', '1445046417', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('588', '100484', '16', '2', '4', '4000', '16000', '15600', '0', '1445046417', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('589', '100484', '131', '2', '2', '150', '300', '100', '0', '1445046417', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('590', '100485', '163', '130', '1', '200', '200', '100', '0', '1445046417', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('591', '100486', '7', '84', '2', '5950', '11900', '11700', '0', '1445046544', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('592', '100487', '16', '2', '4', '4000', '16000', '15600', '0', '1445046544', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('593', '100487', '131', '2', '2', '150', '300', '100', '0', '1445046544', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('594', '100488', '163', '130', '1', '200', '200', '100', '0', '1445046544', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('595', '100489', '7', '84', '3', '5950', '17850', '17550', '0', '1445046566', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('596', '100490', '16', '2', '4', '4000', '16000', '15600', '0', '1445046566', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('597', '100490', '131', '2', '2', '150', '300', '100', '0', '1445046566', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('598', '100491', '163', '130', '1', '200', '200', '100', '0', '1445046566', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('599', '100492', '7', '84', '6', '5950', '35700', '35100', '0', '1445050964', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('600', '100493', '7', '84', '6', '5950', '35700', '35100', '0', '1445052642', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('601', '100494', '7', '84', '6', '5950', '35700', '35100', '0', '1445052877', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('602', '100495', '7', '84', '9', '5950', '53550', '52650', '0', '1445053091', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('603', '100496', '16', '2', '3', '4000', '12000', '11700', '0', '1445053091', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('604', '100497', '16', '2', '3', '4000', '12000', '11700', '0', '1445053284', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('605', '100498', '16', '2', '3', '4000', '12000', '11700', '0', '1445053500', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('606', '100499', '163', '130', '1', '200', '200', '100', '0', '1445053666', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('607', '100500', '163', '130', '1', '200', '200', '100', '0', '1445053929', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('608', '100501', '163', '130', '1', '200', '200', '100', '0', '1445054110', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('609', '100502', '163', '130', '1', '200', '200', '100', '0', '1445054173', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('610', '100503', '163', '130', '1', '200', '200', '100', '0', '1445054307', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('611', '100504', '163', '130', '1', '200', '200', '100', '0', '1445054491', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('612', '100505', '163', '130', '1', '200', '200', '100', '0', '1445055043', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('613', '100506', '163', '130', '5', '200', '1000', '500', '0', '1445055058', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('614', '100507', '164', '128', '4', '466600', '1866400', '1822000', '0', '1445217030', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('615', '100508', '4', '85', '4', '1680', '6720', '6320', '0', '1445218088', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('616', '100509', '4', '85', '4', '1680', '6720', '6320', '0', '1445218284', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('617', '100510', '164', '128', '3', '466600', '1399800', '1366500', '0', '1445314271', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('618', '100511', '164', '128', '2', '466600', '933200', '911000', '0', '1445352667', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('619', '100512', '164', '128', '2', '466600', '933200', '911000', '0', '1445352705', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('620', '100513', '164', '128', '2', '466600', '933200', '911000', '0', '1445352716', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('621', '100514', '164', '128', '2', '466600', '933200', '911000', '0', '1445352870', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('622', '100515', '164', '128', '2', '466600', '933200', '911000', '0', '1445353039', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('623', '100516', '164', '128', '1', '466600', '466600', '455500', '0', '1445355253', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('624', '100517', '164', '128', '1', '466600', '466600', '455500', '0', '1445355503', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('625', '100518', '164', '128', '1', '466600', '466600', '455500', '0', '1445355524', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('626', '100519', '164', '128', '1', '466600', '466600', '455500', '0', '1445355602', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('627', '100520', '164', '128', '1', '466600', '466600', '455500', '0', '1445355611', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('628', '100521', '164', '128', '2', '466600', '933200', '911000', '0', '1445356602', '27.13.152.63', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('629', '100522', '166', '135', '2', '3500', '7000', '5800', '0', '1445392891', '110.185.132.246', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('630', '100523', '166', '135', '2', '3500', '7000', '5800', '0', '1445392894', '110.185.132.246', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('631', '100524', '164', '128', '1', '466600', '466600', '455500', '0', '1445562412', '27.13.154.203', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('632', '100525', '164', '128', '1', '466600', '466600', '455500', '0', '1445563020', '27.13.154.203', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('633', '100526', '3', '99', '1', '1200', '1200', '1100', '0', '1445650606', '218.201.79.217', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('634', '100527', '2', '85', '1', '990', '990', '890', '0', '1445774677', '27.13.26.92', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('635', '100528', '4', '85', '1', '1680', '1680', '1580', '0', '1445774881', '27.13.26.92', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('636', '100529', '164', '128', '1', '466600', '466600', '455500', '0', '1445775420', '27.13.26.92', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('637', '100530', '2', '85', '1', '990', '990', '890', '0', '1445775774', '27.13.26.92', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('638', '100531', '5', '84', '1', '3190', '3190', '3090', '0', '1445832044', '118.239.221.44', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('639', '100532', '164', '128', '1', '466600', '466600', '455500', '0', '1445838110', '27.13.26.92', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('640', '100533', '166', '135', '2', '3500', '7000', '5800', '0', '1446355307', '117.156.3.229', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('641', '100534', '164', '128', '1', '466600', '466600', '455500', '0', '1446715545', '27.13.154.190', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('642', '100535', '165', '134', '1', '66600', '66600', '65000', '0', '1446853407', '223.104.25.187', '1446853590', '223.104.25.187', '0', '0');
INSERT INTO `bao_order_goods` VALUES ('643', '100536', '165', '134', '1', '66600', '66600', '65000', '0', '1446860164', '223.104.25.187', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('644', '100537', '2', '85', '1', '990', '990', '890', '0', '1446860229', '223.104.25.187', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('645', '100538', '164', '128', '1', '466600', '466600', '455500', '0', '1446971975', '111.85.228.69', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('646', '100539', '165', '134', '1', '66600', '66600', '65000', '0', '1446971975', '111.85.228.69', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('647', '100540', '1', '85', '2', '2990', '5980', '5780', '0', '1446976024', '101.36.72.180', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('648', '100541', '164', '128', '3', '466600', '1399800', '1366500', '0', '1446976024', '101.36.72.180', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('649', '100542', '5', '84', '1', '3190', '3190', '3090', '0', '1447147940', '124.126.220.141', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('650', '100543', '3', '99', '1', '1200', '1200', '1100', '0', '1447148402', '124.126.220.141', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('651', '100544', '5', '84', '1', '3190', '3190', '3090', '0', '1447148697', '124.126.220.141', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('652', '100545', '165', '134', '1', '66600', '66600', '65000', '0', '1447206494', '61.149.87.175', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('653', '100546', '165', '134', '1', '66600', '66600', '65000', '0', '1447208581', '61.149.87.175', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('654', '100547', '165', '134', '2', '66600', '133200', '130000', '0', '1447208593', '61.149.87.175', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('655', '100548', '165', '134', '2', '66600', '133200', '130000', '0', '1447208662', '61.149.87.175', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('656', '100549', '165', '134', '2', '66600', '133200', '130000', '1', '1447208673', '61.149.87.175', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('657', '100550', '168', '139', '1', '5380', '5380', '5057', '8', '1447214327', '61.149.87.175', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('658', '100551', '5', '84', '1', '3190', '3190', '3090', '0', '1447214651', '127.145.56.183', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('659', '100552', '168', '139', '1', '5380', '5380', '5057', '8', '1447214761', '61.149.87.175', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('660', '100553', '168', '139', '2', '5380', '10760', '10114', '1', '1447214767', '61.149.87.175', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('661', '100554', '168', '139', '3', '5380', '16140', '15171', '0', '1447215490', '61.149.87.175', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('662', '100555', '165', '134', '1', '66600', '66600', '65000', '0', '1447226557', '123.52.36.116', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('663', '100556', '168', '139', '2', '5380', '10760', '10114', '0', '1447238012', '114.111.167.83', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('664', '100557', '4', '85', '1', '1680', '1680', '1580', '0', '1447238027', '114.111.167.83', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('665', '100558', '168', '139', '2', '5380', '10760', '10114', '0', '1447238027', '114.111.167.83', '0', null, '1', '0');
INSERT INTO `bao_order_goods` VALUES ('666', '100559', '4', '85', '1', '1680', '1680', '1580', '0', '1447238089', '114.111.167.83', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('667', '100560', '168', '139', '2', '5380', '10760', '10114', '0', '1447238089', '114.111.167.83', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('668', '100561', '1', '1', '1', '20000', '20000', '25000', '0', '1468978324', '110.167.99.233', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('669', '100562', '1', '1', '1', '20000', '20000', '25000', '0', '1468978397', '110.167.99.233', '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('670', '0', '2', null, '2', '260', '520', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('671', '0', '2', null, '2', '260', '520', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('672', '0', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('673', '0', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('674', '0', '2', null, '4', '260', '1040', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('675', '0', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('676', '0', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('677', '0', '2', null, '2', '260', '520', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('678', '0', '2', null, '3', '260', '780', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('679', '0', '2', null, '2', '260', '520', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('680', '0', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('681', '100566', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('682', '100567', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('683', '100568', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('684', '100569', '2', null, '2', '260', '520', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('685', '100570', '2', '144', '2', '260', '520', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('686', '100571', '2', '144', '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('687', '100572', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('688', '100573', '2', null, '1', '260', '0', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('689', '100574', '2', null, '1', '260', '0', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('690', '100575', '2', null, '1', '260', '0', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('691', '100576', '2', null, '1', '260', '0', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('692', '100577', '2', null, '1', '260', '0', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('693', '100578', '2', null, '1', '260', '0', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('694', '100579', '2', null, '1', '260', '0', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('695', '100580', '2', null, '1', '260', '0', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('696', '100581', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('697', '100582', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('698', '100583', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('699', '100584', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('700', '100585', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('701', '100586', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('702', '100587', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('703', '100588', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('704', '100589', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('705', '100590', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('706', '100591', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('707', '100592', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('708', '100593', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('709', '100594', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('710', '100595', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('711', '100596', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('712', '100597', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('713', '100598', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('714', '100599', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('715', '100600', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('716', '100601', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('717', '100602', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('718', '100603', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('719', '100604', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('720', '100605', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('721', '100606', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('722', '100607', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('723', '100608', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('724', '100609', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('725', '100610', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('726', '100611', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('727', '100612', '2', null, '2', '260', '520', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('728', '100613', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('729', '100614', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('730', '100615', '2', null, '2', '260', '520', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('731', '100616', '2', null, '10', '260', '2600', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('732', '100617', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');
INSERT INTO `bao_order_goods` VALUES ('733', '100618', '2', null, '1', '260', '260', '0', '0', '0', null, '0', null, '0', '0');

-- ----------------------------
-- Table structure for `bao_order_pick`
-- ----------------------------
DROP TABLE IF EXISTS `bao_order_pick`;
CREATE TABLE `bao_order_pick` (
  `pick_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT '0',
  `name` varchar(64) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `order_ids` text,
  PRIMARY KEY (`pick_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_order_pick
-- ----------------------------
INSERT INTO `bao_order_pick` VALUES ('4', '1', '0', '捡货单2015-04-11 15:01:36', '1428735695', '127.0.0.1', '100071,100073,100074,100081,100082,100083,100084,100097,100100');
INSERT INTO `bao_order_pick` VALUES ('5', '1', '0', '捡货单2015-04-11 15:06:44', '1428736003', '127.0.0.1', '100054,100055,100056,100057,100059,100060,100064,100099');
INSERT INTO `bao_order_pick` VALUES ('6', '0', '1', '捡货单2015-04-13 19:49:15', '1428925754', '127.0.0.1', '100111');
INSERT INTO `bao_order_pick` VALUES ('7', '0', '1', '捡货单2015-04-13 20:02:38', '1428926557', '127.0.0.1', '100110');
INSERT INTO `bao_order_pick` VALUES ('8', '0', '1', '捡货单2015-05-16 08:52:44', '1431737563', '127.0.0.1', '100124');
INSERT INTO `bao_order_pick` VALUES ('9', '0', '95', '捡货单2015-06-01 14:27:18', '1433140037', '127.0.0.1', '100125,100127');
INSERT INTO `bao_order_pick` VALUES ('10', '0', '95', '捡货单2015-06-01 14:51:44', '1433141503', '127.0.0.1', '100134');
INSERT INTO `bao_order_pick` VALUES ('13', '0', '1', '捡货单2015-08-05 14:42:43', '1438756962', '127.0.0.1', '100117,100121');
INSERT INTO `bao_order_pick` VALUES ('14', '0', '1', '捡货单2015-08-05 15:17:25', '1438759044', '127.0.0.1', '100117');
INSERT INTO `bao_order_pick` VALUES ('15', '0', '1', '捡货单2015-08-13 12:02:55', '1439438575', '127.0.0.1', '100121');
INSERT INTO `bao_order_pick` VALUES ('16', '1', '0', '捡货单2015-08-19 15:08:01', '1439968080', '127.0.0.1', '100061,100066');
INSERT INTO `bao_order_pick` VALUES ('17', '0', '1', '捡货单2015-08-26 14:13:03', '1440569582', '127.0.0.1', '100350');
INSERT INTO `bao_order_pick` VALUES ('18', '0', '139', '捡货单2015-11-11 12:07:52', '1447214872', '61.149.87.175', '100549');
INSERT INTO `bao_order_pick` VALUES ('19', '0', '139', '捡货单2015-11-11 12:14:18', '1447215258', '127.145.56.183', '100550,100552,100553');

-- ----------------------------
-- Table structure for `bao_payment`
-- ----------------------------
DROP TABLE IF EXISTS `bao_payment`;
CREATE TABLE `bao_payment` (
  `payment_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `logo` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `mobile_logo` varchar(32) DEFAULT NULL,
  `contents` varchar(1024) DEFAULT NULL,
  `setting` text,
  `is_mobile_only` tinyint(1) DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_payment
-- ----------------------------
INSERT INTO `bao_payment` VALUES ('1', '支付宝', 'alipay.png', 'alipay', 'alipay_mobile.png', '支付宝（中国）网络技术有限公司是国内领先的第三方支付平台，致力于提供“简单、安全、快速”的支付解决方案。支付宝公司从2004年建立开始，始终以“信任”作为产品和服务的核心。作为中国主流的第三方支付平台，我们不仅从产品上确保用户在线支付的安全，同时致力于通过担保交易等创新让用户通过支付宝在网络间建立信任的关系，去帮助建设更纯净的互联网环境。', 'a:8:{s:7:\"service\";s:1:\"1\";s:14:\"alipay_partner\";s:16:\"2088802062480213\";s:10:\"alipay_key\";s:32:\"qmy06qjq300zzkn52jy2hrg5yoa6izgt\";s:14:\"alipay_account\";s:16:\"283068487@qq.com\";s:18:\"alipay_app_partner\";s:0:\"\";s:17:\"alipay_app_seller\";s:0:\"\";s:18:\"alipay_app_private\";s:0:\"\";s:17:\"alipay_app_public\";s:0:\"\";}', '0', '1');
INSERT INTO `bao_payment` VALUES ('2', '财付通', 'tenpay.png', 'tenpay', 'tenpay_mobile.png', '财付通（https://www.tenpay.com/v2/）是腾讯集团旗下中国领先的第三方支付平台，一直致力于为互联网用户和企业提供安全、便捷、专业的在线支付服务。自2005年成立伊始，财付通就以“安全便捷”作为产品和服务的核心，不仅为个人用户创造200多种便民服务和应用场景，还为40多万大中型企业提供专业的资金结算解决方案。', 'a:2:{s:14:\"tenpay_account\";s:4:\"1111\";s:10:\"tenpay_key\";s:4:\"1111\";}', '0', '1');
INSERT INTO `bao_payment` VALUES ('3', '微信支付', 'weixin.png', 'weixin', 'weixin_mobile.png', '微信支付是由腾讯公司知名移动社交通讯软件微信及第三方支付平台财付通联合推出的移动支付创新产品，旨在为广大微信用户及商户提供更优质的支付服务，微信的支付和安全系统由腾讯财付通提供支持。财付通是持有互联网支付牌照并具备完备的安全体系的第三方支付平台。', 'a:4:{s:5:\"appid\";s:9:\"111111111\";s:9:\"appsecret\";s:11:\"11111111111\";s:5:\"mchid\";s:12:\"111111111111\";s:6:\"appkey\";s:15:\"111111111111111\";}', '1', '1');
INSERT INTO `bao_payment` VALUES ('4', '余额支付', 'money.png', 'money', 'money_mobile.png', '余额支付是最方便快捷的', '{s:5:\"appid\";s:0:\"\";s:10:\"paysignkey\";s:0:\"\";s:9:\"appsecret\";s:0:\"\";s:9:\"partnerid\";s:0:\"\";s:10:\"partnerkey\";s:0:\"\";}', '0', '1');
INSERT INTO `bao_payment` VALUES ('5', '银联支付', 'chinapay.png', 'chinapay', 'chinapay_mobile.png', '银联在线支付是中国银联推出的网上支付平台，支持多家发卡银行，涵盖借记卡和信用卡等，包含认证支付、快捷支付和网银支付多种方式，其中认证和快捷支付无需开通网银，仅需一张银行卡，即可享受安全、快捷的网上支付服务！www.chinapay.com', 'a:3:{s:16:\"chinapay_merabbr\";s:0:\"\";s:16:\"chinapay_account\";s:0:\"\";s:12:\"chinapay_key\";s:0:\"\";}', '0', '1');
INSERT INTO `bao_payment` VALUES ('6', '网银在线', 'chinabank.png', 'chinabank', 'chinabank_mobile.png', '网银在线（www.chinabank.com.cn）与中国工商银行、招商银行、中国建设银行、农业银行、民生银行等数十家金融机构达成协议。全面支持全国19家银行的信用卡及借记卡实现网上支付。', 'a:2:{s:17:\"chinabank_account\";s:0:\"\";s:13:\"chinabank_key\";s:0:\"\";}', '0', '1');
INSERT INTO `bao_payment` VALUES ('7', 'paypal', 'paypal.png', 'paypal', 'paypal_mobile.png', 'PayPal（www.paypal.com） 是在线付款解决方案的全球领导者，在全世界有超过七千一百六十万个帐户用户。PayPal 可在 56 个市场以 7 种货币（加元、欧元、英镑、美元、日元、澳元、港元）使用。', 'a:4:{s:18:\"paypal_ec_username\";s:0:\"\";s:18:\"paypal_ec_password\";s:0:\"\";s:19:\"paypal_ec_signature\";s:0:\"\";s:18:\"paypal_ec_currency\";s:3:\"AUD\";}', '0', '1');

-- ----------------------------
-- Table structure for `bao_payment_logs`
-- ----------------------------
DROP TABLE IF EXISTS `bao_payment_logs`;
CREATE TABLE `bao_payment_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `type` enum('tuan','gold','money','ele','ding','goods') DEFAULT 'tuan',
  `order_id` int(11) DEFAULT '0',
  `order_ids` text COMMENT '如果该支付方式支持多个订单（合并付款）',
  `code` varchar(32) DEFAULT NULL,
  `need_pay` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `pay_time` int(11) DEFAULT NULL,
  `pay_ip` varchar(15) DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_payment_logs
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_piaofutong_callback`
-- ----------------------------
DROP TABLE IF EXISTS `bao_piaofutong_callback`;
CREATE TABLE `bao_piaofutong_callback` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `data` varchar(2000) DEFAULT NULL,
  `create_time` int(11) DEFAULT '100',
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_piaofutong_callback
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_post`
-- ----------------------------
DROP TABLE IF EXISTS `bao_post`;
CREATE TABLE `bao_post` (
  `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `cate_id` smallint(6) DEFAULT '0',
  `details` text,
  `pic` text NOT NULL,
  `views` int(11) DEFAULT '0',
  `reply_num` int(11) DEFAULT '0',
  `zan_num` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `last_id` int(11) DEFAULT NULL,
  `last_time` int(11) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0',
  `orderby` tinyint(3) DEFAULT '100' COMMENT '1就是第一名',
  `is_fine` tinyint(1) DEFAULT '0' COMMENT '1代表精华',
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_post
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_post_reply`
-- ----------------------------
DROP TABLE IF EXISTS `bao_post_reply`;
CREATE TABLE `bao_post_reply` (
  `reply_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `zan_num` int(11) DEFAULT '0',
  `contents` text,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`reply_id`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_post_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_post_zan`
-- ----------------------------
DROP TABLE IF EXISTS `bao_post_zan`;
CREATE TABLE `bao_post_zan` (
  `zan_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`zan_id`),
  UNIQUE KEY `post_id` (`post_id`,`create_ip`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_post_zan
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_qrcode_census`
-- ----------------------------
DROP TABLE IF EXISTS `bao_qrcode_census`;
CREATE TABLE `bao_qrcode_census` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `year` smallint(5) DEFAULT '0',
  `month` tinyint(2) DEFAULT '0',
  `day` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_qrcode_census
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_quanming`
-- ----------------------------
DROP TABLE IF EXISTS `bao_quanming`;
CREATE TABLE `bao_quanming` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '获得佣金的用户ID',
  `buy_uid` int(11) DEFAULT '0' COMMENT '购买的用户ID',
  `rank` tinyint(4) DEFAULT '0' COMMENT '第几级会员产生的收益',
  `price` int(11) DEFAULT '0' COMMENT '对方消费多少',
  `commission` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `year` char(4) DEFAULT NULL,
  `month` char(2) DEFAULT NULL,
  `day` char(2) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `uid` (`uid`,`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_quanming
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_recharge_card`
-- ----------------------------
DROP TABLE IF EXISTS `bao_recharge_card`;
CREATE TABLE `bao_recharge_card` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT '0',
  `card_key` char(32) DEFAULT '0',
  `value` int(10) DEFAULT '0',
  `end_date` date DEFAULT '0000-00-00',
  `is_used` tinyint(3) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '0',
  `user_id` int(10) DEFAULT '0',
  `used_time` int(11) DEFAULT '0',
  PRIMARY KEY (`card_id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_recharge_card
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_role`
-- ----------------------------
DROP TABLE IF EXISTS `bao_role`;
CREATE TABLE `bao_role` (
  `role_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_role
-- ----------------------------
INSERT INTO `bao_role` VALUES ('1', '系统管理员');
INSERT INTO `bao_role` VALUES ('2', '分站管理');

-- ----------------------------
-- Table structure for `bao_role_maps`
-- ----------------------------
DROP TABLE IF EXISTS `bao_role_maps`;
CREATE TABLE `bao_role_maps` (
  `role_id` smallint(5) DEFAULT NULL,
  `menu_id` smallint(5) DEFAULT NULL,
  UNIQUE KEY `role_id` (`role_id`,`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_role_maps
-- ----------------------------
INSERT INTO `bao_role_maps` VALUES ('2', '12');
INSERT INTO `bao_role_maps` VALUES ('2', '13');
INSERT INTO `bao_role_maps` VALUES ('2', '14');
INSERT INTO `bao_role_maps` VALUES ('2', '15');
INSERT INTO `bao_role_maps` VALUES ('2', '16');
INSERT INTO `bao_role_maps` VALUES ('2', '17');
INSERT INTO `bao_role_maps` VALUES ('2', '34');
INSERT INTO `bao_role_maps` VALUES ('2', '35');
INSERT INTO `bao_role_maps` VALUES ('2', '37');
INSERT INTO `bao_role_maps` VALUES ('2', '40');
INSERT INTO `bao_role_maps` VALUES ('2', '41');
INSERT INTO `bao_role_maps` VALUES ('2', '44');
INSERT INTO `bao_role_maps` VALUES ('2', '45');
INSERT INTO `bao_role_maps` VALUES ('2', '46');
INSERT INTO `bao_role_maps` VALUES ('2', '47');
INSERT INTO `bao_role_maps` VALUES ('2', '48');
INSERT INTO `bao_role_maps` VALUES ('2', '80');
INSERT INTO `bao_role_maps` VALUES ('2', '81');
INSERT INTO `bao_role_maps` VALUES ('2', '85');
INSERT INTO `bao_role_maps` VALUES ('2', '86');
INSERT INTO `bao_role_maps` VALUES ('2', '87');
INSERT INTO `bao_role_maps` VALUES ('2', '88');
INSERT INTO `bao_role_maps` VALUES ('2', '90');
INSERT INTO `bao_role_maps` VALUES ('2', '95');
INSERT INTO `bao_role_maps` VALUES ('2', '96');
INSERT INTO `bao_role_maps` VALUES ('2', '97');
INSERT INTO `bao_role_maps` VALUES ('2', '98');
INSERT INTO `bao_role_maps` VALUES ('2', '99');
INSERT INTO `bao_role_maps` VALUES ('2', '100');
INSERT INTO `bao_role_maps` VALUES ('2', '101');
INSERT INTO `bao_role_maps` VALUES ('2', '102');
INSERT INTO `bao_role_maps` VALUES ('2', '103');
INSERT INTO `bao_role_maps` VALUES ('2', '115');
INSERT INTO `bao_role_maps` VALUES ('2', '116');
INSERT INTO `bao_role_maps` VALUES ('2', '117');
INSERT INTO `bao_role_maps` VALUES ('2', '118');
INSERT INTO `bao_role_maps` VALUES ('2', '125');
INSERT INTO `bao_role_maps` VALUES ('2', '126');
INSERT INTO `bao_role_maps` VALUES ('2', '127');
INSERT INTO `bao_role_maps` VALUES ('2', '128');
INSERT INTO `bao_role_maps` VALUES ('2', '129');
INSERT INTO `bao_role_maps` VALUES ('2', '130');
INSERT INTO `bao_role_maps` VALUES ('2', '156');
INSERT INTO `bao_role_maps` VALUES ('2', '157');
INSERT INTO `bao_role_maps` VALUES ('2', '177');
INSERT INTO `bao_role_maps` VALUES ('2', '178');
INSERT INTO `bao_role_maps` VALUES ('2', '179');
INSERT INTO `bao_role_maps` VALUES ('2', '180');
INSERT INTO `bao_role_maps` VALUES ('2', '181');
INSERT INTO `bao_role_maps` VALUES ('2', '182');
INSERT INTO `bao_role_maps` VALUES ('2', '183');
INSERT INTO `bao_role_maps` VALUES ('2', '184');
INSERT INTO `bao_role_maps` VALUES ('2', '209');
INSERT INTO `bao_role_maps` VALUES ('2', '210');
INSERT INTO `bao_role_maps` VALUES ('2', '212');
INSERT INTO `bao_role_maps` VALUES ('2', '223');
INSERT INTO `bao_role_maps` VALUES ('2', '224');
INSERT INTO `bao_role_maps` VALUES ('2', '227');
INSERT INTO `bao_role_maps` VALUES ('2', '240');
INSERT INTO `bao_role_maps` VALUES ('2', '259');
INSERT INTO `bao_role_maps` VALUES ('2', '261');
INSERT INTO `bao_role_maps` VALUES ('2', '262');
INSERT INTO `bao_role_maps` VALUES ('2', '263');
INSERT INTO `bao_role_maps` VALUES ('2', '264');
INSERT INTO `bao_role_maps` VALUES ('2', '265');
INSERT INTO `bao_role_maps` VALUES ('2', '268');
INSERT INTO `bao_role_maps` VALUES ('2', '277');
INSERT INTO `bao_role_maps` VALUES ('2', '280');
INSERT INTO `bao_role_maps` VALUES ('2', '290');
INSERT INTO `bao_role_maps` VALUES ('2', '296');
INSERT INTO `bao_role_maps` VALUES ('2', '297');
INSERT INTO `bao_role_maps` VALUES ('2', '298');
INSERT INTO `bao_role_maps` VALUES ('2', '299');
INSERT INTO `bao_role_maps` VALUES ('2', '327');
INSERT INTO `bao_role_maps` VALUES ('2', '328');
INSERT INTO `bao_role_maps` VALUES ('2', '345');
INSERT INTO `bao_role_maps` VALUES ('2', '346');
INSERT INTO `bao_role_maps` VALUES ('2', '347');
INSERT INTO `bao_role_maps` VALUES ('2', '348');
INSERT INTO `bao_role_maps` VALUES ('2', '349');
INSERT INTO `bao_role_maps` VALUES ('2', '350');
INSERT INTO `bao_role_maps` VALUES ('2', '434');
INSERT INTO `bao_role_maps` VALUES ('2', '441');
INSERT INTO `bao_role_maps` VALUES ('2', '442');
INSERT INTO `bao_role_maps` VALUES ('2', '443');
INSERT INTO `bao_role_maps` VALUES ('2', '444');
INSERT INTO `bao_role_maps` VALUES ('2', '503');
INSERT INTO `bao_role_maps` VALUES ('2', '515');
INSERT INTO `bao_role_maps` VALUES ('2', '520');
INSERT INTO `bao_role_maps` VALUES ('2', '521');
INSERT INTO `bao_role_maps` VALUES ('2', '522');
INSERT INTO `bao_role_maps` VALUES ('2', '532');
INSERT INTO `bao_role_maps` VALUES ('2', '533');
INSERT INTO `bao_role_maps` VALUES ('2', '535');
INSERT INTO `bao_role_maps` VALUES ('2', '548');
INSERT INTO `bao_role_maps` VALUES ('2', '549');
INSERT INTO `bao_role_maps` VALUES ('2', '550');
INSERT INTO `bao_role_maps` VALUES ('2', '551');
INSERT INTO `bao_role_maps` VALUES ('2', '552');
INSERT INTO `bao_role_maps` VALUES ('2', '556');
INSERT INTO `bao_role_maps` VALUES ('2', '557');
INSERT INTO `bao_role_maps` VALUES ('2', '558');
INSERT INTO `bao_role_maps` VALUES ('2', '559');
INSERT INTO `bao_role_maps` VALUES ('2', '560');
INSERT INTO `bao_role_maps` VALUES ('2', '561');
INSERT INTO `bao_role_maps` VALUES ('2', '563');
INSERT INTO `bao_role_maps` VALUES ('2', '564');
INSERT INTO `bao_role_maps` VALUES ('2', '565');
INSERT INTO `bao_role_maps` VALUES ('2', '566');
INSERT INTO `bao_role_maps` VALUES ('2', '567');
INSERT INTO `bao_role_maps` VALUES ('2', '568');
INSERT INTO `bao_role_maps` VALUES ('2', '569');
INSERT INTO `bao_role_maps` VALUES ('2', '570');
INSERT INTO `bao_role_maps` VALUES ('2', '571');
INSERT INTO `bao_role_maps` VALUES ('2', '572');
INSERT INTO `bao_role_maps` VALUES ('2', '573');
INSERT INTO `bao_role_maps` VALUES ('2', '574');
INSERT INTO `bao_role_maps` VALUES ('2', '575');
INSERT INTO `bao_role_maps` VALUES ('2', '576');
INSERT INTO `bao_role_maps` VALUES ('2', '577');
INSERT INTO `bao_role_maps` VALUES ('2', '578');
INSERT INTO `bao_role_maps` VALUES ('2', '579');
INSERT INTO `bao_role_maps` VALUES ('2', '580');
INSERT INTO `bao_role_maps` VALUES ('2', '581');
INSERT INTO `bao_role_maps` VALUES ('2', '582');
INSERT INTO `bao_role_maps` VALUES ('2', '583');
INSERT INTO `bao_role_maps` VALUES ('2', '584');

-- ----------------------------
-- Table structure for `bao_sensitive_words`
-- ----------------------------
DROP TABLE IF EXISTS `bao_sensitive_words`;
CREATE TABLE `bao_sensitive_words` (
  `words_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `words` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`words_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_sensitive_words
-- ----------------------------
INSERT INTO `bao_sensitive_words` VALUES ('1', '共产党');
INSERT INTO `bao_sensitive_words` VALUES ('2', '习近平');
INSERT INTO `bao_sensitive_words` VALUES ('3', '法轮功');

-- ----------------------------
-- Table structure for `bao_seo`
-- ----------------------------
DROP TABLE IF EXISTS `bao_seo`;
CREATE TABLE `bao_seo` (
  `seo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seo_key` varchar(32) DEFAULT NULL,
  `seo_explain` varchar(1024) DEFAULT NULL,
  `seo_title` varchar(1024) DEFAULT NULL,
  `seo_keywords` varchar(1024) DEFAULT NULL,
  `seo_desc` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`seo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_seo
-- ----------------------------
INSERT INTO `bao_seo` VALUES ('1', 'index_index', '首页SEO配置\r\n\r\n暂时没有其他可以用的标签!', '{sitename}_门户系统！咨询电话{tel}', '门户系统', '是山西生活宝门户系统，宗旨是身边的美提现出来，把山西的美传播出去');
INSERT INTO `bao_seo` VALUES ('2', 'article_index', '文章列表\r\n可使用的标签有：\r\n1、{cate_name}', '{sitename}{cate_name}文章频道聚集了最好的生活内容！让您的生活更精彩', '{sitename}{cate_name}文章频道聚集了最好的生活内容！让您的生活更精彩', '{sitename}{cate_name}文章频道聚集了最好的生活内容！让您的生活更精彩');
INSERT INTO `bao_seo` VALUES ('3', 'article_detail', '文章详情\r\n1、{title}标题\r\n2、{keywords}关键字\r\n3、{desc}描述\r\n4、{cate_name}分类', '{title}-{sitename}', '{keywords}', '{desc}');
INSERT INTO `bao_seo` VALUES ('4', 'article_system', '系统文章\r\n1、{title}标题', '{title}-{sitename}', '{title}-{sitename}', '{title}-{sitename}');
INSERT INTO `bao_seo` VALUES ('5', 'coupon_index', '优惠券列表\r\n1、{area_name}地区\r\n2、{cate_name}', '{area_name}{cate_name}商户哪家好？{sitename}', '{area_name}{cate_name}商户哪家好？{sitename}', '{area_name}{cate_name}商户哪家好？{sitename}');
INSERT INTO `bao_seo` VALUES ('6', 'coupon_detail', '优惠券详情\r\n1、{shop_name}商家名称\r\n2、{title}优惠券标题\r\n', '商户{shop_name}的优惠券“{title}”', '商户{shop_name}的优惠券“{title}”', '商户{shop_name}的优惠券“{title}”');
INSERT INTO `bao_seo` VALUES ('7', 'tuan_detail', '生活团购详情\r\n1、{shop_name}商家名称\r\n2、{title}优惠券标题', '商户{shop_name}的商品“{title}”', '商户{shop_name}的商品“{title}”', '商户{shop_name}的商品“{title}”');
INSERT INTO `bao_seo` VALUES ('8', 'tuan_index', '团购列表\r\n1、{area_name}地区\r\n2、{cate_name}\r\n3、{business_name}', '山西{area_name}{business_name}{cate_name}本地生活团购！吃喝玩乐一切都在{sitename}！', '山西{area_name}{business_name}{cate_name}本地生活团购！吃喝玩乐一切都在{sitename}！', '山西{area_name}{business_name}{cate_name}本地生活团购！吃喝玩乐一切都在{sitename}！');
INSERT INTO `bao_seo` VALUES ('9', 'news_index', '新闻列表\r\n1、{cate_name} 分类', '{cate_name}商家新闻列表-{sitename}', '{cate_name}商家新闻列表-{sitename}', '{cate_name}商家新闻列表-{sitename}');
INSERT INTO `bao_seo` VALUES ('10', 'news_detail', '新闻详情\r\n1、{title}标题', '{title}', '{title}', '{title}');
INSERT INTO `bao_seo` VALUES ('11', 'share_index', '消费分享\r\n1、{cate_name}分类', '{cate_name}消费分享-{sitename}', '{cate_name}消费分享-{sitename}', '{cate_name}消费分享-{sitename}');
INSERT INTO `bao_seo` VALUES ('12', 'share_detail', '消费分享详情\r\n1、{title}标题', '{title}', '{title}', '{title}');
INSERT INTO `bao_seo` VALUES ('13', 'shop_index', '商家列表\r\n1、{cate_name}分类\r\n2、{area_name}地区\r\n3、{business_name}商圈', '{area_name}{cate_name}{business_name}商家列表', '{area_name}{cate_name}{business_name}商家列表', '{area_name}{cate_name}{business_name}商家列表');
INSERT INTO `bao_seo` VALUES ('14', 'shop_detail', '商家详情\r\n1、{shop_name}\r\n2、{shop_tel}', '商家详情{shop_name}{shop_tel}', '商家详情{shop_name}{shop_tel}', '商家详情{shop_name}{shop_tel}');
INSERT INTO `bao_seo` VALUES ('15', 'app_index', 'APP页面', '优服汇_生活宝门户系统手机客户端下载', '优服汇_生活宝门户系统手机客户端下载', '优服汇_生活宝门户系统手机客户端下载');
INSERT INTO `bao_seo` VALUES ('16', 'recommend_index', '暂无可用标签', '打造全城最实惠的消费方式！消费享受折扣就上{sitename}', '打造全城最实惠的消费方式！消费享受折扣就上{sitename}', '打造全城最实惠的消费方式！消费享受折扣就上{sitename}');
INSERT INTO `bao_seo` VALUES ('17', 'blog_index', '用户博客\r\n1、{nickname}用户昵称', '{nickname}的博客', '{nickname}的博客', '{nickname}的博客');
INSERT INTO `bao_seo` VALUES ('18', 'huodong_index', '活动类型：1、{cate_name} 2、{area_name}', '山西{area_name}最全的{cate_name}活动', '山西{area_name}最全的{cate_name}活动', '山西{area_name}最全的{cate_name}活动');
INSERT INTO `bao_seo` VALUES ('19', 'huodong_detail', '活动详情\r\n1、{title}标题\r\n2、{shop_name}商家名称', '{title}-{shop_name}', '{title}-{shop_name}', '{title}-{shop_name}');
INSERT INTO `bao_seo` VALUES ('20', 'ele_ding', '订座列表\r\n1、{cate_name}分类\r\n2、{area_name}地区\r\n3、{business_name}商圈', '{area_name}{cate_name}{business_name}订座列表', '{area_name}{cate_name}{business_name}订座列表', '{area_name}{cate_name}{business_name}订座列表');
INSERT INTO `bao_seo` VALUES ('21', 'mall_main', '购物列表\r\n1、{cate_name}分类\r\n2、{area_name}地区\r\n3、{business_name}商圈', '{area_name}{cate_name}{business_name}购物列表', '{area_name}{cate_name}{business_name}购物列表', '{area_name}{cate_name}{business_name}购物列表');
INSERT INTO `bao_seo` VALUES ('22', 'mall_detail', '购物详情\r\n1、{shop_name}商家名称\r\n2、{title}商品标题', '商户{shop_name}的商品“{title}”', '商户{shop_name}的商品“{title}”', '商户{shop_name}的商品“{title}”');
INSERT INTO `bao_seo` VALUES ('23', 'vip_index', 'VIP列表\r\n1、{cate_name}分类\r\n2、{area_name}地区\r\n3、{business_name}商圈', '{area_name}{cate_name}{business_name}会员卡列表', '{area_name}{cate_name}{business_name}会员卡列表', '{area_name}{cate_name}{business_name}会员卡列表');
INSERT INTO `bao_seo` VALUES ('24', 'mall_index', '购物首页{cate_name}', '{cate_name}购物首页', '{cate_name}购物首页', '{cate_name}购物首页');
INSERT INTO `bao_seo` VALUES ('25', 'jifen_index', '积分兑换列表', '积分兑换列表', '积分兑换列表', '积分兑换列表');
INSERT INTO `bao_seo` VALUES ('26', 'jifen_detail', '积分商品&quot;{title}&quot;详情', '积分商品&quot;{title}&quot;详情', '积分商品&quot;{title}&quot;详情', '积分商品&quot;{title}&quot;详情');
INSERT INTO `bao_seo` VALUES ('27', 'ele_detail', '订餐详情\r\n1、{shop_name}商家名称\r\n2、{shop_tel}订餐电话', '商户{shop_name}的订餐电话“{shop_tel}”', '商户{shop_name}的订餐电话“{shop_tel}”', '商户{shop_name}的订餐电话“{shop_tel}”');
INSERT INTO `bao_seo` VALUES ('28', 'ele_shop', '订餐详情', '订餐详情', '订餐详情', '订餐详情');
INSERT INTO `bao_seo` VALUES ('29', 'ele_index', '餐饮美食首页', '餐饮美食首页', '餐饮美食首页', '餐饮美食首页');
INSERT INTO `bao_seo` VALUES ('30', 'life_index', '生活信息首页', '生活信息首页', '生活信息首页', '生活信息首页');
INSERT INTO `bao_seo` VALUES ('31', 'life_detail', '生活信息详情\r\n1、{title}', '{title}', '{title}', '{title}');
INSERT INTO `bao_seo` VALUES ('32', 'life_main', '生活信息主页{area_name}{business_name}', '生活信息主页{area_name}{business_name}', '生活信息主页{area_name}{business_name}', '生活信息主页{area_name}{business_name}');
INSERT INTO `bao_seo` VALUES ('33', 'life_fabu', '发布生活信息', '发布生活信息', '发布生活信息', '发布生活信息');
INSERT INTO `bao_seo` VALUES ('34', 'shop_apply', '商家入驻申请', '商家入驻申请', '商家入驻申请', '商家入驻申请');
INSERT INTO `bao_seo` VALUES ('36', 'ele_main', '餐饮美食主页', '餐饮美食主页', '餐饮美食主页', '餐饮美食主页');
INSERT INTO `bao_seo` VALUES ('37', 'ele_takeout', '外卖点餐', '外卖点餐', '外卖点餐', '外卖点餐');
INSERT INTO `bao_seo` VALUES ('38', 'ele_pay', '订单支付页面', '订单支付页面', '订单支付页面', '订单支付页面');
INSERT INTO `bao_seo` VALUES ('39', 'tuan_main', '团购主页', '团购主页', '团购主页', '团购主页');
INSERT INTO `bao_seo` VALUES ('40', 'mall_shop', '商家店铺页面的SEO\r\n1、{shop_name}商家店铺', '{shop_name}的店铺', '{shop_name}的店铺', '{shop_name}的店铺');
INSERT INTO `bao_seo` VALUES ('41', 'billboard_index', '{sitename}榜单首页', '{sitename}榜单首页', '{sitename}榜单首页', '{sitename}榜单首页');
INSERT INTO `bao_seo` VALUES ('42', 'billboard_bdlist', '1、{cate_name} 榜单内容', '{cate_name} 榜单内容', '{cate_name} 榜单内容', '{cate_name} 榜单内容');
INSERT INTO `bao_seo` VALUES ('43', 'billborder_bddetails', '榜单详情 1、{title}', '{title}', '{title}', '{title}');
INSERT INTO `bao_seo` VALUES ('44', 'jifen_main', '积分主页：1、{sitename}一卡通全城', '{sitename}一卡通全城', '{sitename}一卡通全城', '{sitename}一卡通全城');
INSERT INTO `bao_seo` VALUES ('45', 'jifen_shop', '商家联盟：1、{shop_name}', '联盟商家{shop_name}的详情', '联盟商家{shop_name}的详情', '联盟商家{shop_name}的详情');
INSERT INTO `bao_seo` VALUES ('46', 'hdmobile_detail', '手机活动 1、{title}', '{title}', '{title}', '{title}');
INSERT INTO `bao_seo` VALUES ('48', 'community_detail', '小区详细页面SEO模版 {name} 小区名称 {addr} 小区地址', '{name}', '{name},小区大全,{sitename}', '{name}小区位于{addr}，{sitename}为您提供{name}小区的物业信息，以及{name}小区附近的商家、美食、优惠，您还可以和小区邻居相互交流。');
INSERT INTO `bao_seo` VALUES ('47', 'shop_detail', '手机商家 1、{title}', '{title}', '{title}', '{title}');
INSERT INTO `bao_seo` VALUES ('50', 'index_more', '首页更多', '{sitename}_山西生活宝门户系统！咨询电话{tel}', '{sitename}_山西生活宝门户系统！咨询电话{tel}', '{sitename}_山西生活宝门户系统！咨询电话{tel}');
INSERT INTO `bao_seo` VALUES ('51', 'tieba_detail', '城市贴吧1、{title}', '{title}', '{title}', '{title}');
INSERT INTO `bao_seo` VALUES ('52', 'tieba_index', '城市贴吧 1、{title}', '{title}', '{title}', '{title}');
INSERT INTO `bao_seo` VALUES ('53', 'tieba_main', '城市贴吧分类 1、{title}', '{title}', '{title}', '{title}');
INSERT INTO `bao_seo` VALUES ('54', 'community_index', '小区首页SEO模版 {area_name}区域名称', '{city}小区大全', '小区大全,{area_name}小区', '优服汇小区为您提供山西所有的社区、小区大全，您可以加入自己的小区，查看物业信息、小区附近的商家、优惠折扣，还可以和同小区邻居畅聊！');
INSERT INTO `bao_seo` VALUES ('55', 'weidian_index', '会员微信微店 1、{title}', '{title}', '{title}', '{title}');
INSERT INTO `bao_seo` VALUES ('56', 'community_news', '小区公告内容 1、标题{title} 2、名称{name} 3、地址{addr} 4、描述{desc}', '{title}_小区通知_{name}物业通知_{sitename}', '{name},小区通知,物业通知', '小区公告：{title}，{desc}');
INSERT INTO `bao_seo` VALUES ('57', 'community_tie', '小区贴吧帖子模版 {name} 小区名称 {addr} 小区地址 {title} 帖子标题 {desc} 帖子200字描述', '{title}_{name}_{name}贴吧_{sitename}', '{name}小区,{title}贴吧,{sitename}', '{desc}，{name}小区。');
INSERT INTO `bao_seo` VALUES ('58', 'community_tieba', '小区贴吧SEO模版 {name} 小区名字 {addr} 小区地址', '{name}_小区贴吧_{sitename}', '{name},小区贴吧,{sitename}', '{name}贴吧是由{sitename}为{name}小区业主提供的交流平台，通过{name}贴吧您可以与小区的邻居畅聊，欢迎{name}小区业主加入{name}贴吧。');
INSERT INTO `bao_seo` VALUES ('59', 'community_newslist', '小区公告内容 1、标题{title} 2、名称{name} 3、地址{addr} 4、描述{desc}', '小区通知_{name}物业通知_{sitename}', '{name},小区通知,物业通知', '小区公告：{title}，{desc}');
INSERT INTO `bao_seo` VALUES ('60', 'housekeeping_index', '家政服务', '家政服务', '家政服务', '家政服务');
INSERT INTO `bao_seo` VALUES ('61', 'housekeeping_appointment', '家政服务', '家政服务', '家政服务', '家政服务');
INSERT INTO `bao_seo` VALUES ('62', 'housekeeping_main', '家政服务', '家政服务', '家政服务', '家政服务');

-- ----------------------------
-- Table structure for `bao_session`
-- ----------------------------
DROP TABLE IF EXISTS `bao_session`;
CREATE TABLE `bao_session` (
  `session_id` varchar(64) NOT NULL,
  `session_expire` int(11) NOT NULL,
  `session_data` blob,
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of bao_session
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_setting`
-- ----------------------------
DROP TABLE IF EXISTS `bao_setting`;
CREATE TABLE `bao_setting` (
  `k` varchar(255) DEFAULT NULL,
  `v` text,
  UNIQUE KEY `k` (`k`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_setting
-- ----------------------------
INSERT INTO `bao_setting` VALUES ('site', 'a:20:{s:8:\"sitename\";s:24:\"学生综合实践平台\";s:4:\"host\";s:25:\"http://www.shijian666.com\";s:6:\"imgurl\";s:25:\"http://www.shijian666.com\";s:7:\"android\";s:23:\"/download.aspx?id=29348\";s:3:\"ios\";s:23:\"/download.aspx?id=29348\";s:4:\"logo\";s:28:\"2017/09/23/59c62f59ca74f.png\";s:2:\"qq\";s:9:\"283068487\";s:3:\"tel\";s:12:\"0539-6999990\";s:5:\"email\";s:16:\"283068487@qq.com\";s:7:\"ucenter\";s:1:\"0\";s:6:\"weixin\";s:1:\"1\";s:3:\"icp\";s:17:\"琼ICP备00000号\";s:5:\"title\";s:24:\"学生综合实践平台\";s:7:\"keyword\";s:24:\"学生综合实践平台\";s:8:\"headinfo\";s:0:\"\";s:11:\"description\";s:24:\"学生综合实践平台\";s:6:\"tongji\";s:0:\"\";s:7:\"city_id\";s:1:\"8\";s:3:\"lng\";s:10:\"116.400244\";s:3:\"lat\";s:9:\"39.918034\";}');
INSERT INTO `bao_setting` VALUES ('attachs', 'a:35:{s:5:\"water\";s:28:\"2014/09/16/541827480b2f1.png\";s:8:\"shoplogo\";a:1:{s:5:\"thumb\";s:7:\"150X150\";}s:10:\"marketlogo\";a:1:{s:5:\"thumb\";s:7:\"150X150\";}s:6:\"market\";a:1:{s:5:\"thumb\";s:7:\"300X300\";}s:9:\"marketpic\";a:1:{s:5:\"thumb\";s:7:\"600X400\";}s:8:\"sitelogo\";a:1:{s:5:\"thumb\";s:6:\"180X55\";}s:8:\"shopnews\";a:1:{s:5:\"thumb\";s:7:\"260X260\";}s:8:\"activity\";a:1:{s:5:\"thumb\";s:7:\"640X480\";}s:6:\"coupon\";a:1:{s:5:\"thumb\";s:7:\"577X430\";}s:7:\"huodong\";a:1:{s:5:\"thumb\";s:7:\"320X240\";}s:9:\"billboard\";a:1:{s:5:\"thumb\";s:7:\"640X480\";}s:8:\"billcate\";a:1:{s:5:\"thumb\";s:5:\"60X60\";}s:7:\"article\";a:1:{s:5:\"thumb\";s:7:\"260X260\";}s:13:\"integralgoods\";a:1:{s:5:\"thumb\";s:7:\"350X350\";}s:4:\"dian\";a:1:{s:5:\"thumb\";s:7:\"340X270\";}s:8:\"dingroom\";a:1:{s:5:\"thumb\";s:7:\"340X270\";}s:12:\"shopdianping\";a:1:{s:5:\"thumb\";s:7:\"380X260\";}s:5:\"found\";a:1:{s:5:\"thumb\";s:7:\"640X300\";}s:4:\"user\";a:1:{s:5:\"thumb\";a:3:{s:5:\"thumb\";s:7:\"200X200\";s:6:\"middle\";s:7:\"120X120\";s:5:\"small\";s:5:\"60X60\";}}s:9:\"shopphoto\";a:1:{s:5:\"thumb\";s:7:\"300X300\";}s:9:\"recommend\";a:1:{s:5:\"thumb\";s:7:\"180X180\";}s:4:\"tuan\";a:1:{s:5:\"thumb\";s:7:\"545X305\";}s:11:\"lifeservice\";a:1:{s:4:\"icon\";s:6:\"120X80\";}s:4:\"life\";a:1:{s:5:\"thumb\";s:7:\"320X320\";}s:7:\"lifepic\";a:1:{s:5:\"thumb\";s:7:\"600X400\";}s:7:\"votepic\";a:1:{s:5:\"thumb\";s:7:\"150X150\";}s:6:\"weixin\";a:1:{s:5:\"thumb\";s:7:\"320X120\";}s:10:\"votebanner\";a:1:{s:5:\"thumb\";s:7:\"640X300\";}s:5:\"goods\";a:1:{s:5:\"thumb\";s:7:\"480X480\";}s:10:\"shopbanner\";a:1:{s:5:\"thumb\";s:7:\"320X120\";}s:11:\"shopbanner1\";a:1:{s:5:\"thumb\";s:8:\"1000X300\";}s:10:\"eleproduct\";a:1:{s:5:\"thumb\";s:7:\"300X300\";}s:8:\"dingmenu\";a:1:{s:5:\"thumb\";s:7:\"600X450\";}s:4:\"mall\";a:1:{s:5:\"thumb\";s:7:\"300X140\";}s:6:\"editor\";a:2:{s:5:\"thumb\";s:7:\"600X600\";s:5:\"water\";s:1:\"1\";}}');
INSERT INTO `bao_setting` VALUES ('ucenter', 'a:15:{s:7:\"charset\";s:1:\"1\";s:10:\"UC_CONNECT\";s:8:\"mysql111\";s:9:\"UC_DBHOST\";s:24:\"qdm169940700.my3w.com111\";s:9:\"UC_DBUSER\";s:15:\"qdm169940700111\";s:7:\"UC_DBPW\";s:11:\"fu123123111\";s:9:\"UC_DBNAME\";s:15:\"qdm169940700_db\";s:12:\"UC_DBCHARSET\";s:3:\"gbk\";s:13:\"UC_DBTABLEPRE\";s:30:\"`qdm169940700_db`.pre_ucenter_\";s:12:\"UC_DBCONNECT\";s:1:\"0\";s:6:\"UC_KEY\";s:39:\"9f0eEu7yKduxws5A1uTpxH9XJudjROHk0KAoS+g\";s:6:\"UC_API\";s:27:\"http://www.7v9.cn/uc_server\";s:10:\"UC_CHARSET\";s:3:\"gbk\";s:5:\"UC_IP\";s:0:\"\";s:8:\"UC_APPID\";s:1:\"3\";s:6:\"UC_PPP\";s:2:\"20\";}');
INSERT INTO `bao_setting` VALUES ('sms', 'a:3:{s:3:\"url\";s:92:\"http://api.smsbao.com/sms?u=221115&p=87ed1b34e613f50c38c0bb56279b51fd&m={mobile}&c={content}\";s:7:\"charset\";s:1:\"0\";s:4:\"code\";s:1:\"0\";}');
INSERT INTO `bao_setting` VALUES ('mail', 'a:5:{s:4:\"smtp\";s:18:\"smtp.exmail.qq.com\";s:4:\"port\";s:2:\"25\";s:8:\"username\";s:15:\"admin@junchang.taobao.com\";s:8:\"password\";s:8:\"Fu201200\";s:4:\"from\";s:15:\"admin@ly190.com\";}');
INSERT INTO `bao_setting` VALUES ('weixin', 'a:9:{s:5:\"token\";s:32:\"e10adc3949ba59abbe56e057f20f883e\";s:5:\"appid\";s:18:\"wxe9368584f5249426\";s:9:\"appsecret\";s:32:\"c3bb4a8c357e22d5f3a2f104d49b8dab\";s:2:\"id\";s:15:\"gh_f272c7b8c437\";s:4:\"type\";s:1:\"1\";s:11:\"description\";s:18:\"很爱很爱你！\";s:5:\"title\";s:0:\"\";s:7:\"linkurl\";s:0:\"\";s:5:\"photo\";s:0:\"\";}');
INSERT INTO `bao_setting` VALUES ('integral', 'a:6:{s:5:\"share\";s:1:\"5\";s:5:\"reply\";s:1:\"1\";s:6:\"mobile\";s:3:\"100\";s:5:\"email\";s:3:\"100\";s:4:\"sign\";s:1:\"5\";s:9:\"firstsign\";s:2:\"50\";}');
INSERT INTO `bao_setting` VALUES ('connect', 'a:7:{s:5:\"debug\";s:1:\"1\";s:9:\"qq_app_id\";s:9:\"101321195\";s:10:\"qq_app_key\";s:32:\"b965728211f87f9506d4c62768f544b2\";s:9:\"wb_app_id\";s:0:\"\";s:10:\"wb_app_key\";s:0:\"\";s:9:\"wx_app_id\";s:0:\"\";s:10:\"wx_app_key\";s:0:\"\";}');
INSERT INTO `bao_setting` VALUES ('prestige', 'a:7:{s:5:\"login\";s:1:\"1\";s:8:\"dianping\";s:1:\"5\";s:5:\"share\";s:1:\"2\";s:5:\"reply\";s:1:\"1\";s:4:\"tuan\";s:2:\"10\";s:6:\"mobile\";s:3:\"100\";s:5:\"email\";s:3:\"100\";}');
INSERT INTO `bao_setting` VALUES ('weixinmenu', 'a:2:{s:6:\"button\";a:3:{i:1;s:6:\"关于\";i:2;s:6:\"功能\";i:3;s:6:\"其他\";}s:5:\"child\";a:3:{i:1;a:5:{i:1;a:2:{s:4:\"name\";s:12:\"公司介绍\";s:3:\"url\";s:33:\"http://127.0.0.1mobile/index.html\";}i:2;a:2:{s:4:\"name\";s:0:\"\";s:3:\"url\";s:0:\"\";}i:3;a:2:{s:4:\"name\";s:0:\"\";s:3:\"url\";s:0:\"\";}i:4;a:2:{s:4:\"name\";s:0:\"\";s:3:\"url\";s:0:\"\";}i:5;a:2:{s:4:\"name\";s:0:\"\";s:3:\"url\";s:0:\"\";}}i:2;a:5:{i:1;a:2:{s:4:\"name\";s:6:\"团购\";s:3:\"url\";s:38:\"http://127.0.0.1mobile/tuan/index.html\";}i:2;a:2:{s:4:\"name\";s:6:\"商家\";s:3:\"url\";s:38:\"http://127.0.0.1mobile/shop/index.html\";}i:3;a:2:{s:4:\"name\";s:6:\"发现\";s:3:\"url\";s:39:\"http://127.0.0.1mobile/found/index.html\";}i:4;a:2:{s:4:\"name\";s:6:\"吃饭\";s:3:\"url\";s:44:\"http://127.0.0.1mobile/shop/index/cat/1.html\";}i:5;a:2:{s:4:\"name\";s:12:\"休闲娱乐\";s:3:\"url\";s:45:\"http://127.0.0.1mobile/shop/index/cat/12.html\";}}i:3;a:5:{i:1;a:2:{s:4:\"name\";s:6:\"测试\";s:3:\"url\";s:33:\"http://127.0.0.1mobile/index.html\";}i:2;a:2:{s:4:\"name\";s:0:\"\";s:3:\"url\";s:0:\"\";}i:3;a:2:{s:4:\"name\";s:0:\"\";s:3:\"url\";s:0:\"\";}i:4;a:2:{s:4:\"name\";s:0:\"\";s:3:\"url\";s:0:\"\";}i:5;a:2:{s:4:\"name\";s:0:\"\";s:3:\"url\";s:0:\"\";}}}}');
INSERT INTO `bao_setting` VALUES ('shop', 'a:5:{s:6:\"weixin\";s:2:\"30\";s:5:\"yuyue\";s:2:\"30\";s:4:\"card\";s:2:\"30\";s:3:\"bao\";s:2:\"30\";s:4:\"life\";a:2:{s:3:\"top\";s:1:\"1\";s:6:\"urgent\";s:1:\"1\";}}');
INSERT INTO `bao_setting` VALUES ('mobile', 'a:3:{s:8:\"guaguale\";s:1:\"2\";s:9:\"choujiang\";s:1:\"1\";s:8:\"yaoyiyao\";s:1:\"3\";}');
INSERT INTO `bao_setting` VALUES ('ele', 'a:2:{s:4:\"shop\";a:13:{i:0;s:2:\"42\";i:1;s:2:\"45\";i:2;s:2:\"47\";i:3;s:2:\"52\";i:4;s:2:\"51\";i:5;s:1:\"2\";i:6;s:2:\"43\";i:7;s:2:\"44\";i:8;s:2:\"48\";i:9;s:2:\"49\";i:10;s:2:\"50\";i:11;s:2:\"66\";i:12;s:2:\"54\";}s:4:\"tuan\";a:30:{i:0;s:1:\"4\";i:1;s:1:\"3\";i:2;s:1:\"5\";i:3;s:1:\"6\";i:4;s:1:\"7\";i:5;s:1:\"8\";i:6;s:1:\"9\";i:7;s:2:\"10\";i:8;s:2:\"11\";i:9;s:2:\"12\";i:10;s:2:\"13\";i:11;s:2:\"14\";i:12;s:2:\"16\";i:13;s:2:\"17\";i:14;s:2:\"18\";i:15;s:2:\"19\";i:16;s:2:\"20\";i:17;s:2:\"21\";i:18;s:2:\"22\";i:19;s:2:\"23\";i:20;s:2:\"24\";i:21;s:2:\"25\";i:22;s:2:\"26\";i:23;s:2:\"27\";i:24;s:2:\"28\";i:25;s:2:\"29\";i:26;s:2:\"30\";i:27;s:2:\"31\";i:28;s:2:\"32\";i:29;s:2:\"33\";}}');
INSERT INTO `bao_setting` VALUES ('housework', 'a:2:{s:4:\"gold\";s:1:\"1\";s:3:\"num\";s:1:\"3\";}');
INSERT INTO `bao_setting` VALUES ('weidian', 'a:5:{s:10:\"bianlidian\";s:2:\"16\";s:11:\"xianhuadian\";s:2:\"33\";s:13:\"shengxiandian\";s:2:\"44\";s:9:\"kaoyadian\";s:1:\"2\";s:10:\"dangaodian\";s:2:\"43\";}');
INSERT INTO `bao_setting` VALUES ('mall', 'a:16:{s:5:\"ming1\";s:9:\"烤鸭店\";s:5:\"dian1\";s:1:\"1\";s:5:\"ming2\";s:9:\"蛋糕店\";s:5:\"dian2\";s:1:\"9\";s:5:\"ming3\";s:9:\"鲜花店\";s:5:\"dian3\";s:2:\"10\";s:5:\"ming4\";s:9:\"水果店\";s:5:\"dian4\";s:2:\"11\";s:5:\"ming5\";s:9:\"便利店\";s:5:\"dian5\";s:2:\"12\";s:5:\"ming6\";s:9:\"坚果店\";s:5:\"dian6\";s:1:\"6\";s:5:\"ming7\";s:9:\"奶茶店\";s:5:\"dian7\";s:1:\"7\";s:5:\"ming8\";s:9:\"茶叶店\";s:5:\"dian8\";s:1:\"8\";}');
INSERT INTO `bao_setting` VALUES ('quanming', 'a:12:{s:7:\"content\";s:30:\"全民经济人内容描述。\";s:5:\"intro\";s:36:\"全民经济人活动规则描述。\";s:7:\"is_tuan\";s:1:\"0\";s:7:\"is_mall\";s:1:\"0\";s:6:\"is_ele\";s:1:\"0\";s:4:\"rate\";s:1:\"5\";s:5:\"rate1\";s:1:\"1\";s:5:\"rate2\";s:1:\"2\";s:5:\"rate3\";s:1:\"3\";s:5:\"rate4\";s:1:\"4\";s:5:\"rate5\";s:1:\"5\";s:5:\"rate6\";s:1:\"6\";}');

-- ----------------------------
-- Table structure for `bao_share_cate`
-- ----------------------------
DROP TABLE IF EXISTS `bao_share_cate`;
CREATE TABLE `bao_share_cate` (
  `cate_id` int(10) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_share_cate
-- ----------------------------
INSERT INTO `bao_share_cate` VALUES ('4', '旅游', '0', '2');

-- ----------------------------
-- Table structure for `bao_shop`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop`;
CREATE TABLE `bao_shop` (
  `shop_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `cate_id` smallint(5) DEFAULT NULL,
  `area_id` smallint(5) DEFAULT NULL,
  `city_id` smallint(5) DEFAULT '0',
  `type_id` char(20) DEFAULT '0',
  `business_id` smallint(5) DEFAULT NULL,
  `shop_name` varchar(64) DEFAULT NULL,
  `logo` varchar(64) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  `tel` varchar(64) DEFAULT NULL,
  `extension` varchar(8) DEFAULT NULL,
  `qq` varchar(10) NOT NULL,
  `mobile` varchar(11) DEFAULT '0',
  `contact` varchar(32) DEFAULT NULL,
  `addr` varchar(64) DEFAULT NULL,
  `score` tinyint(3) DEFAULT '0' COMMENT '评价',
  `score_num` int(11) DEFAULT '0',
  `fans_num` int(11) DEFAULT '0',
  `d1` tinyint(3) DEFAULT '0',
  `d2` tinyint(3) DEFAULT '0',
  `d3` tinyint(3) DEFAULT '0' COMMENT '点评项目',
  `orderby` int(11) DEFAULT '100' COMMENT '越小排序越高',
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `ding_num` int(10) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `view` int(11) DEFAULT '0',
  `audit` tinyint(1) DEFAULT '0' COMMENT '1代表已经审核',
  `is_pei` tinyint(1) DEFAULT '0' COMMENT '是否商家自主配送',
  `is_ding` tinyint(1) DEFAULT '0' COMMENT '针对餐饮行业的订座',
  `tags` varchar(64) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `tui_uid` int(11) DEFAULT '0' COMMENT '代理商',
  PRIMARY KEY (`shop_id`),
  KEY `cate_id` (`cate_id`,`area_id`,`business_id`)
) ENGINE=MyISAM AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop
-- ----------------------------
INSERT INTO `bao_shop` VALUES ('144', '214', '65', '24', '8', '0', '33', '贝拉小镇', '2017/09/24/thumb_59c77e8b126fc.png', '2017/09/24/thumb_59c77ec6b7a0f.jpg', '123123132123', '', '', '', '贝拉小镇', '贝拉小镇贝拉小镇', '0', '0', '0', '0', '0', '0', '100', '', '', '0', '0', '31', '1', '0', '0', '', '1506142639', '192.168.11.1', '0');

-- ----------------------------
-- Table structure for `bao_shop_banner`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_banner`;
CREATE TABLE `bao_shop_banner` (
  `banner_id` int(10) NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) DEFAULT '0',
  `is_mobile` tinyint(1) DEFAULT '1',
  `photo` varchar(128) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_banner
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_shop_branch`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_branch`;
CREATE TABLE `bao_shop_branch` (
  `branch_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `score` tinyint(3) DEFAULT '0',
  `password` varchar(32) DEFAULT '',
  `shop_id` int(11) DEFAULT '0',
  `city_id` smallint(5) DEFAULT '0',
  `area_id` smallint(5) DEFAULT '0',
  `business_id` smallint(5) DEFAULT '0',
  `addr` varchar(128) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `telephone` varchar(11) NOT NULL DEFAULT '',
  `business_time` varchar(64) DEFAULT NULL,
  `d1` tinyint(3) DEFAULT '0',
  `d2` tinyint(3) DEFAULT '0',
  `d3` tinyint(3) DEFAULT '0',
  `score_num` int(10) unsigned NOT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `view` int(11) DEFAULT '0',
  `fans_num` int(11) DEFAULT '0',
  `audit` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_branch
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_shop_cate`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_cate`;
CREATE TABLE `bao_shop_cate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `is_hot` tinyint(1) DEFAULT '0',
  `d1` varchar(32) DEFAULT '价格',
  `d2` varchar(32) DEFAULT '环境',
  `d3` varchar(32) DEFAULT '服务',
  `title` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_cate
-- ----------------------------
INSERT INTO `bao_shop_cate` VALUES ('65', '旅游', '0', '1', '0', '号', '坏', '很好', '国内外旅游');

-- ----------------------------
-- Table structure for `bao_shop_comment`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_comment`;
CREATE TABLE `bao_shop_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级评论id,若是一级评论则为0',
  `nickname` varchar(100) DEFAULT NULL COMMENT '评论人昵称',
  `user_id` int(11) DEFAULT NULL COMMENT '评论人UID',
  `post_id` int(11) DEFAULT NULL COMMENT '新闻编号',
  `content` text COMMENT '评论内容',
  `zan` int(6) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT NULL COMMENT '评论或回复发表时间',
  `create_ip` varchar(20) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_shop_details`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_details`;
CREATE TABLE `bao_shop_details` (
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `details` text,
  `theme_id` int(11) DEFAULT '0',
  `theme_expir_time` int(11) DEFAULT NULL,
  `discounts` varchar(32) DEFAULT NULL,
  `business_time` varchar(32) DEFAULT '9:00-18:00',
  `price` int(10) DEFAULT NULL,
  `near` varchar(64) DEFAULT NULL,
  `wei_pic` varchar(256) DEFAULT NULL,
  `is_dingyue` tinyint(1) DEFAULT '0' COMMENT '是否是订阅号',
  `app_id` varchar(32) DEFAULT NULL,
  `app_key` varchar(256) DEFAULT NULL,
  `token` varchar(32) DEFAULT NULL,
  `weixin_msg` text,
  `menus` text,
  `seo_title` varchar(32) DEFAULT NULL,
  `seo_keywords` varchar(32) DEFAULT NULL,
  `seo_description` varchar(32) DEFAULT NULL,
  `icp` varchar(32) DEFAULT NULL,
  `sitelogo` varchar(64) DEFAULT NULL,
  `bank` varchar(1024) DEFAULT NULL,
  `delivery_time` tinyint(3) DEFAULT '30' COMMENT '接单倒计时（单位：分钟）',
  PRIMARY KEY (`shop_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_details
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_shop_dianping`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_dianping`;
CREATE TABLE `bao_shop_dianping` (
  `dianping_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT '0',
  `evaluate` tinyint(1) DEFAULT '0' COMMENT '1表示好评，2表示中评，3表示差评',
  `score` tinyint(3) DEFAULT NULL,
  `d1` tinyint(3) DEFAULT '0',
  `d2` tinyint(3) DEFAULT '0',
  `d3` tinyint(3) DEFAULT '0',
  `cost` int(11) DEFAULT NULL,
  `contents` varchar(1024) DEFAULT NULL,
  `reply` varchar(1024) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `show_date` date DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`dianping_id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_dianping
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_shop_dianping_pics`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_dianping_pics`;
CREATE TABLE `bao_shop_dianping_pics` (
  `pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT '0',
  `dianping_id` int(11) DEFAULT NULL,
  `pic` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pic_id`),
  KEY `dianping_id` (`dianping_id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_dianping_pics
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_shop_ding_cate`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_ding_cate`;
CREATE TABLE `bao_shop_ding_cate` (
  `cate_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT '0',
  `cate_name` varchar(64) DEFAULT '',
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_ding_cate
-- ----------------------------
INSERT INTO `bao_shop_ding_cate` VALUES ('1', '1', '旅游', '2');

-- ----------------------------
-- Table structure for `bao_shop_ding_dianping`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_ding_dianping`;
CREATE TABLE `bao_shop_ding_dianping` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `contents` varchar(1024) DEFAULT NULL,
  `reply` varchar(1024) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `show_date` date DEFAULT NULL,
  `closed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_ding_dianping
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_shop_ding_dianping_pic`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_ding_dianping_pic`;
CREATE TABLE `bao_shop_ding_dianping_pic` (
  `pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `pic` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pic_id`),
  KEY `dianping_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_ding_dianping_pic
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_shop_ding_menu`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_ding_menu`;
CREATE TABLE `bao_shop_ding_menu` (
  `menu_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(64) DEFAULT '',
  `shop_id` int(11) DEFAULT '0',
  `cate_id` int(11) DEFAULT '0',
  `photo` varchar(128) DEFAULT '',
  `price` int(11) DEFAULT '0',
  `ding_price` int(11) DEFAULT '0',
  `is_tuijian` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  `is_new` tinyint(1) DEFAULT '0' COMMENT '是否新品',
  `is_sale` tinyint(1) DEFAULT '0' COMMENT '是否优惠',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '',
  `closed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_ding_menu
-- ----------------------------
INSERT INTO `bao_shop_ding_menu` VALUES ('1', '旅游', '1', '1', '2015/08/03/55bf85a948ce5.jpg', '35000', '32000', '1', '1', '1', '1438614975', '127.0.0.1', '0');

-- ----------------------------
-- Table structure for `bao_shop_ding_order`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_ding_order`;
CREATE TABLE `bao_shop_ding_order` (
  `order_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `order_no` int(10) DEFAULT NULL,
  `is_dianping` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1代表已经付款购买   0未付款 -1 取消 2已消费',
  `name` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `total_price` int(10) DEFAULT NULL,
  `need_price` int(10) DEFAULT NULL,
  `user_id` mediumint(8) DEFAULT NULL,
  `ding_id` mediumint(8) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT '1' COMMENT '1男 2女',
  `tip` mediumtext,
  `use_integral` varchar(50) DEFAULT NULL,
  `create_time` int(10) DEFAULT NULL,
  `create_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_ding_order
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_shop_ding_room`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_ding_room`;
CREATE TABLE `bao_shop_ding_room` (
  `room_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `intro` varchar(64) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  `money` int(11) DEFAULT '0',
  `last_date` date DEFAULT NULL,
  `last_t` tinyint(3) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0' COMMENT '1 代表该包厢已经不能被预定了',
  PRIMARY KEY (`room_id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_ding_room
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_shop_ding_setting`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_ding_setting`;
CREATE TABLE `bao_shop_ding_setting` (
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `mobile` varchar(11) DEFAULT NULL COMMENT '有单了，通知手机号',
  `money` int(11) DEFAULT '0' COMMENT '包厢需要缴纳定金',
  `bao_time` tinyint(3) DEFAULT '0' COMMENT '包厢预定间隔小时',
  `start_time` tinyint(3) DEFAULT '0' COMMENT '开始接客时间',
  `end_time` tinyint(3) DEFAULT '0' COMMENT '打烊时间',
  `is_bao` tinyint(1) DEFAULT '0' COMMENT '1代表包厢有位子',
  `is_ting` tinyint(1) DEFAULT '0' COMMENT '1代表大厅有位置',
  PRIMARY KEY (`shop_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_ding_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_shop_ding_yuyue`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_ding_yuyue`;
CREATE TABLE `bao_shop_ding_yuyue` (
  `ding_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `room_id` mediumint(8) NOT NULL,
  `shop_id` mediumint(8) DEFAULT NULL,
  `last_date` date NOT NULL,
  `last_t` tinyint(3) NOT NULL,
  `menu` varchar(50) DEFAULT NULL,
  `user_id` mediumint(8) DEFAULT NULL,
  `number` int(3) DEFAULT NULL,
  `order_no` int(10) DEFAULT NULL,
  `is_pay` tinyint(1) DEFAULT '0' COMMENT '1代表已经付款购买   0未付款',
  `create_time` int(10) DEFAULT NULL,
  `create_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ding_id`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_ding_yuyue
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_shop_expand`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_expand`;
CREATE TABLE `bao_shop_expand` (
  `expand_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `expand` tinyint(3) DEFAULT NULL,
  `intro` varchar(256) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`expand_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_expand
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_shop_favorites`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_favorites`;
CREATE TABLE `bao_shop_favorites` (
  `favorites_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `last_news_id` int(11) DEFAULT '0',
  `read_id` int(11) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`favorites_id`),
  UNIQUE KEY `user_id` (`user_id`,`shop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_shop_life_service`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_life_service`;
CREATE TABLE `bao_shop_life_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `cate_id` smallint(5) unsigned NOT NULL,
  `area_id` smallint(5) unsigned NOT NULL,
  `city_id` smallint(5) unsigned NOT NULL,
  `business_id` smallint(5) unsigned NOT NULL,
  `shop_name` varchar(64) NOT NULL,
  `logo` varchar(64) NOT NULL,
  `photo` varchar(64) NOT NULL,
  `tel` varchar(64) DEFAULT NULL,
  `extension` varchar(8) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `contact` varchar(32) DEFAULT NULL,
  `addr` varchar(64) DEFAULT NULL,
  `create_ip` varchar(15) NOT NULL,
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_life_service
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_shop_logs`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_logs`;
CREATE TABLE `bao_shop_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `type` enum('yuyue','card','wei','bao') DEFAULT NULL,
  `date` date DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_logs
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_shop_money`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_money`;
CREATE TABLE `bao_shop_money` (
  `money_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `type` enum('tuan','ele','ding','goods') DEFAULT 'tuan',
  `order_id` int(11) DEFAULT '0',
  `intro` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`money_id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_money
-- ----------------------------
INSERT INTO `bao_shop_money` VALUES ('92', '144', '26000', '1506229519', '222.244.144.157', 'goods', '123456', '444');

-- ----------------------------
-- Table structure for `bao_shop_news`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_news`;
CREATE TABLE `bao_shop_news` (
  `news_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `cate_id` smallint(5) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `details` text,
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `orderby` tinyint(1) DEFAULT '50',
  `audit` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`news_id`),
  KEY `shop_id` (`shop_id`),
  KEY `cate_id` (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_news
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_shop_pic`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_pic`;
CREATE TABLE `bao_shop_pic` (
  `pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `audit` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`pic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_pic
-- ----------------------------
INSERT INTO `bao_shop_pic` VALUES ('34', '144', '2017/09/24/thumb_59c78058ab090.jpg', '', '100', '0', '1506246744', '127.0.0.1');

-- ----------------------------
-- Table structure for `bao_shop_weixin_access`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_weixin_access`;
CREATE TABLE `bao_shop_weixin_access` (
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `access_token` varchar(256) DEFAULT NULL,
  `expir_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`shop_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_weixin_access
-- ----------------------------
INSERT INTO `bao_shop_weixin_access` VALUES ('1', 'ZgaB-vJS_07uHOFjeFl2gRTV6DK0KMq1_Wu_7vA5PmLrPu7DIdExMlYIEGR9nKqku1FkXsDQYp3N2pgH9NgA25QZmUEY2NIccM6RbDUjFa4', '1439191115');
INSERT INTO `bao_shop_weixin_access` VALUES ('128', '0scLp_xg1dq48UkRDpblpgkSKII6j0yaDjBBUFVkGb7v7aYJU8DY5hj47vclxUunSdWFJCl57sqDCqHEVomfh2sPIWr-I7lS0fdMkHmS11UQCJdADAZLS', '1446702461');

-- ----------------------------
-- Table structure for `bao_shop_weixin_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_weixin_keyword`;
CREATE TABLE `bao_shop_weixin_keyword` (
  `keyword_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT '0',
  `keyword` varchar(32) DEFAULT NULL,
  `type` enum('news','text') DEFAULT 'text' COMMENT '0普通消息 1图片消息',
  `title` varchar(128) DEFAULT NULL,
  `contents` text,
  `url` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `shop_id` (`shop_id`,`keyword`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_weixin_keyword
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_shop_worker`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_worker`;
CREATE TABLE `bao_shop_worker` (
  `worker_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(15) NOT NULL,
  `shop_id` int(15) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `mobile` int(13) NOT NULL,
  `qq` varchar(20) NOT NULL,
  `weixin` varchar(40) NOT NULL,
  `work` varchar(80) NOT NULL,
  `addr` varchar(200) NOT NULL,
  `tuan` int(1) NOT NULL DEFAULT '0',
  `coupon` int(1) NOT NULL DEFAULT '0',
  `yuyue` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`worker_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_worker
-- ----------------------------
INSERT INTO `bao_shop_worker` VALUES ('8', '215', '144', '黄海洋', '', '2147483647', '', '', '扫码的', '奥克斯', '1', '1', '1', '0');
INSERT INTO `bao_shop_worker` VALUES ('6', '59', '144', '贝阿呗', '0731-12345678', '2147483647', '236467617', '13590288934', '店员', '长沙', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `bao_shop_yuyue`
-- ----------------------------
DROP TABLE IF EXISTS `bao_shop_yuyue`;
CREATE TABLE `bao_shop_yuyue` (
  `yuyue_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT '0',
  `shop_id` int(11) unsigned DEFAULT '0',
  `name` varchar(32) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `yuyue_date` date DEFAULT NULL,
  `yuyue_time` varchar(32) DEFAULT NULL,
  `number` smallint(5) unsigned DEFAULT '0',
  `code` varchar(32) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  `used` tinyint(1) DEFAULT '0',
  `used_time` int(11) DEFAULT '0',
  `used_ip` varchar(15) DEFAULT '',
  PRIMARY KEY (`yuyue_id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_shop_yuyue
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_sms`
-- ----------------------------
DROP TABLE IF EXISTS `bao_sms`;
CREATE TABLE `bao_sms` (
  `sms_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sms_key` varchar(32) DEFAULT NULL,
  `sms_explain` varchar(1024) DEFAULT NULL,
  `sms_tmpl` varchar(2048) DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`sms_id`),
  UNIQUE KEY `sms_key` (`sms_key`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_sms
-- ----------------------------
INSERT INTO `bao_sms` VALUES ('1', 'sms_code', '可用标签：\r\n1、验证码 :{code}', '您的手机验证码：{code}，如非本人操作，请忽略！【{sitename}】', '1');
INSERT INTO `bao_sms` VALUES ('4', 'sms_shop_yuyue', '1、{shop_name}商家\r\n2、{shop_tel}商家电话\r\n3、{code}电子预约券\r\n4、{shop_addr}商家地址', '您预约的优惠券：{code},您可前往{shop_name}进行消费;商家地址:{shop_addr},电话{shop_tel};【{sitename}】', '0');
INSERT INTO `bao_sms` VALUES ('3', 'sms_coupon_downloads', '可使用标签：\r\n1、{coupon_title} 优惠券标题\r\n2、{shop_name}商家\r\n3、{code}优惠券码\r\n4、{expire_date}有效期', '您下载了商家{shop_name}的优惠券{coupon_title}，优惠券码：{code}，您可在{expire_date}之前使用该优惠券！【{sitename}】', '0');
INSERT INTO `bao_sms` VALUES ('5', 'sms_tuan', '报名成功后发送短信给用户！\r\n1、{nickname}用户昵称\r\n2、{tuan}活动名称\r\n3、{code}活动券码', '您订购的{tuan}活动券码：{code}；请妥善保管，勿告知他人！【sitename】', '1');
INSERT INTO `bao_sms` VALUES ('6', 'sms_newpwd', '找回密码：\r\n1、{newpwd}新密码', '您的密码被重置成{newpwd}，您可使用密码登录！【{sitename}】', '0');
INSERT INTO `bao_sms` VALUES ('7', 'sms_shop_mall', '商城通知商家短信模板', '您有新的订单！【{sitename}】', '0');
INSERT INTO `bao_sms` VALUES ('8', 'sms_shop_tuan', '团购通知商家信息模板', '您有新的订单！【{sitename}】', '0');
INSERT INTO `bao_sms` VALUES ('24', 'sms_ele', '订餐后发送短信给用户！ 1、{nickname}用户昵称 2、{shopname}外卖商家', '您在{shopname}点的外卖订单已经生成，请耐心等待美食的到来。【{sitename}】', '0');
INSERT INTO `bao_sms` VALUES ('25', 'sms_shop_ele', '订餐通知商家短信模版', '您有新的订单！【{sitename}】', '0');
INSERT INTO `bao_sms` VALUES ('26', 'sms_shangjia_yuyue', '{name}预约人', '{name}预约了您的场地，请及时登录你的网站回复，【{sitename}】。', '0');
INSERT INTO `bao_sms` VALUES ('27', 'sms_bill_order_confirm', '缴费成功通知用户短信模版', '您的{billtype}缴费订单已处理。【{sitename}】', '0');
INSERT INTO `bao_sms` VALUES ('28', 'sms_bill_order_refund', '缴费退款通知用户短信模版', '您的{billtype}缴费订单已退款，处理说明：{memo}【{sitename}】', '0');

-- ----------------------------
-- Table structure for `bao_system_content`
-- ----------------------------
DROP TABLE IF EXISTS `bao_system_content`;
CREATE TABLE `bao_system_content` (
  `content_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `contents` text,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(255) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_system_content
-- ----------------------------
INSERT INTO `bao_system_content` VALUES ('1', '关于我们', '<p>关于我们</p>', '1410871894', '127.0.0.1', '1');
INSERT INTO `bao_system_content` VALUES ('2', '人才招聘', '<p>人才招聘</p>', '1410872282', '127.0.0.1', '5');
INSERT INTO `bao_system_content` VALUES ('3', '联系我们', '<p>联系我们</p>', '1410872306', '127.0.0.1', '2');
INSERT INTO `bao_system_content` VALUES ('4', '媒体合作', '<p>媒体合作</p>', '1410872331', '127.0.0.1', '3');
INSERT INTO `bao_system_content` VALUES ('5', '广告合作', '<p>广告合作</p>', '1410872363', '127.0.0.1', '6');
INSERT INTO `bao_system_content` VALUES ('6', '免责声明', '<p>免责声明</p>', '1410872456', '127.0.0.1', '7');
INSERT INTO `bao_system_content` VALUES ('7', '服务协议', '<p>服务协议</p>', '1410872491', '127.0.0.1', '8');

-- ----------------------------
-- Table structure for `bao_template`
-- ----------------------------
DROP TABLE IF EXISTS `bao_template`;
CREATE TABLE `bao_template` (
  `template_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `theme` varchar(32) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `theme` (`theme`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_template
-- ----------------------------
INSERT INTO `bao_template` VALUES ('4', '默认模版', 'default', 'index.jpg', '1');
INSERT INTO `bao_template` VALUES ('5', '测试模板', 'test', 'index.jpg', '0');
INSERT INTO `bao_template` VALUES ('6', '新版红色', 'news', 'index.jpg', '0');

-- ----------------------------
-- Table structure for `bao_template_setting`
-- ----------------------------
DROP TABLE IF EXISTS `bao_template_setting`;
CREATE TABLE `bao_template_setting` (
  `theme` varchar(32) DEFAULT NULL,
  `setting` text,
  UNIQUE KEY `theme` (`theme`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_template_setting
-- ----------------------------
INSERT INTO `bao_template_setting` VALUES ('default', 'a:2:{s:5:\"index\";a:8:{s:5:\"first\";a:6:{s:4:\"name\";s:13:\"装修&服务\";s:5:\"value\";s:1:\"7\";s:4:\"tuan\";s:3:\"100\";s:2:\"ad\";s:1:\"3\";s:5:\"total\";s:3:\"164\";s:4:\"near\";s:2:\"31\";}s:6:\"second\";a:6:{s:4:\"name\";s:13:\"婚庆&酒店\";s:5:\"value\";s:1:\"6\";s:4:\"tuan\";s:2:\"41\";s:2:\"ad\";s:1:\"4\";s:5:\"total\";s:2:\"54\";s:4:\"near\";s:2:\"10\";}s:5:\"third\";a:6:{s:4:\"name\";s:13:\"家政&服务\";s:5:\"value\";s:2:\"14\";s:4:\"tuan\";s:3:\"107\";s:2:\"ad\";s:1:\"5\";s:5:\"total\";s:2:\"85\";s:4:\"near\";s:2:\"21\";}s:6:\"fourth\";a:6:{s:4:\"name\";s:13:\"汽车&驾校\";s:5:\"value\";s:1:\"8\";s:4:\"tuan\";s:2:\"94\";s:2:\"ad\";s:1:\"7\";s:5:\"total\";s:2:\"54\";s:4:\"near\";s:2:\"12\";}s:5:\"fifth\";a:6:{s:4:\"name\";s:12:\"教育培训\";s:5:\"value\";s:2:\"11\";s:4:\"tuan\";s:2:\"96\";s:2:\"ad\";s:1:\"8\";s:5:\"total\";s:2:\"87\";s:4:\"near\";s:2:\"32\";}s:5:\"sixth\";a:6:{s:4:\"name\";s:13:\"母婴&亲子\";s:5:\"value\";s:2:\"10\";s:4:\"tuan\";s:2:\"40\";s:2:\"ad\";s:2:\"14\";s:5:\"total\";s:3:\"150\";s:4:\"near\";s:2:\"51\";}s:7:\"seventh\";a:6:{s:4:\"name\";s:13:\"丽人&保养\";s:5:\"value\";s:1:\"9\";s:4:\"tuan\";s:2:\"36\";s:2:\"ad\";s:2:\"15\";s:5:\"total\";s:3:\"187\";s:4:\"near\";s:2:\"55\";}s:6:\"eighth\";a:6:{s:4:\"name\";s:13:\"餐饮&娱乐\";s:5:\"value\";s:1:\"1\";s:4:\"tuan\";s:1:\"1\";s:2:\"ad\";s:2:\"16\";s:5:\"total\";s:3:\"562\";s:4:\"near\";s:3:\"145\";}}s:5:\"floor\";a:6:{s:5:\"first\";a:3:{s:4:\"name\";s:12:\"休闲零食\";s:5:\"value\";s:2:\"21\";s:2:\"ad\";s:2:\"24\";}s:6:\"second\";a:3:{s:4:\"name\";s:12:\"厨房用品\";s:5:\"value\";s:1:\"1\";s:2:\"ad\";s:2:\"25\";}s:5:\"third\";a:3:{s:4:\"name\";s:12:\"家具电器\";s:5:\"value\";s:2:\"14\";s:2:\"ad\";s:2:\"26\";}s:6:\"fourth\";a:3:{s:4:\"name\";s:12:\"婚庆用品\";s:5:\"value\";s:1:\"2\";s:2:\"ad\";s:2:\"27\";}s:5:\"fifth\";a:3:{s:4:\"name\";s:12:\"生活用品\";s:5:\"value\";s:1:\"6\";s:2:\"ad\";s:2:\"28\";}s:5:\"sixth\";a:3:{s:4:\"name\";s:12:\"建材专区\";s:5:\"value\";s:2:\"33\";s:2:\"ad\";s:2:\"29\";}}}');

-- ----------------------------
-- Table structure for `bao_tongji`
-- ----------------------------
DROP TABLE IF EXISTS `bao_tongji`;
CREATE TABLE `bao_tongji` (
  `tongji_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(12) DEFAULT NULL,
  `keyword` varchar(32) DEFAULT NULL COMMENT '超过的部分忽略',
  `type` tinyint(1) DEFAULT '0' COMMENT '1 团购  2购物  暂时只统计这两块',
  `money` int(11) DEFAULT NULL,
  `year` smallint(4) DEFAULT NULL,
  `month` char(2) DEFAULT NULL,
  `day` char(2) DEFAULT NULL,
  `date` date DEFAULT '2015-03-24',
  `is_mobile` tinyint(1) DEFAULT '0',
  `is_weixin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`tongji_id`),
  KEY `from` (`from`),
  KEY `keyword` (`keyword`),
  KEY `type` (`type`),
  KEY `year` (`year`,`month`)
) ENGINE=MyISAM AUTO_INCREMENT=294 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_tongji
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_tuan`
-- ----------------------------
DROP TABLE IF EXISTS `bao_tuan`;
CREATE TABLE `bao_tuan` (
  `tuan_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT '0',
  `cate_id` smallint(6) DEFAULT NULL,
  `area_id` smallint(6) DEFAULT NULL,
  `city_id` smallint(5) DEFAULT '0',
  `business_id` smallint(6) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `intro` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `thumb` text COMMENT '缩略图',
  `price` int(11) DEFAULT NULL,
  `tuan_price` int(11) DEFAULT NULL,
  `settlement_price` int(11) DEFAULT '0' COMMENT '结算金额',
  `use_integral` int(11) DEFAULT '0' COMMENT '代表允许使用的积分数，100积分是1RMB',
  `num` int(11) DEFAULT '0',
  `sold_num` int(11) DEFAULT '0',
  `tao_num` tinyint(2) DEFAULT '0' COMMENT '套餐人数',
  `wei_pic` varchar(256) DEFAULT NULL COMMENT '抢购二维码',
  `bg_date` date DEFAULT '0000-00-00',
  `end_date` date DEFAULT NULL,
  `fail_date` date DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `orderby` tinyint(3) DEFAULT '100',
  `is_hot` tinyint(2) DEFAULT '0',
  `is_new` tinyint(2) DEFAULT '0',
  `is_chose` tinyint(2) DEFAULT '0',
  `is_multi` tinyint(1) DEFAULT '0' COMMENT '多店可用',
  `freebook` tinyint(2) DEFAULT '0',
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `is_return_cash` tinyint(2) DEFAULT '0',
  `xiangou` int(11) DEFAULT NULL,
  `xiadan` int(1) DEFAULT NULL,
  `is_seckill` tinyint(1) DEFAULT '0',
  `kill_bg` date DEFAULT NULL,
  `kill_end` date DEFAULT NULL,
  `kill_num` int(11) DEFAULT '0',
  `kill_price` int(11) DEFAULT '0',
  PRIMARY KEY (`tuan_id`),
  KEY `cate_id` (`cate_id`,`area_id`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_tuan
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_tuan_cate`
-- ----------------------------
DROP TABLE IF EXISTS `bao_tuan_cate`;
CREATE TABLE `bao_tuan_cate` (
  `cate_id` int(10) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT NULL,
  `is_hot` tinyint(2) DEFAULT NULL,
  `rate` int(11) DEFAULT '60' COMMENT '结算费率',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_tuan_cate
-- ----------------------------
INSERT INTO `bao_tuan_cate` VALUES ('2', '旅游', '0', '99', '0', '60');

-- ----------------------------
-- Table structure for `bao_tuan_code`
-- ----------------------------
DROP TABLE IF EXISTS `bao_tuan_code`;
CREATE TABLE `bao_tuan_code` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(8) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `shop_id` int(11) DEFAULT '0',
  `branch_id` int(11) DEFAULT '0',
  `order_id` int(11) DEFAULT NULL,
  `tuan_id` int(11) DEFAULT '0',
  `price` int(11) DEFAULT NULL,
  `settlement_price` int(11) DEFAULT NULL,
  `real_money` int(11) DEFAULT '0' COMMENT '真实花费的MONEY',
  `real_integral` int(11) DEFAULT '0' COMMENT '真实积分',
  `fail_date` date DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `used_time` int(11) DEFAULT '0',
  `used_ip` varchar(15) DEFAULT '0.0.0.0',
  `is_used` tinyint(1) DEFAULT '0' COMMENT '1代表已经使用',
  `status` tinyint(1) DEFAULT '0' COMMENT '0代表正常，1代表申请退款中，2代表已经退款',
  PRIMARY KEY (`code_id`)
) ENGINE=MyISAM AUTO_INCREMENT=256 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_tuan_code
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_tuan_details`
-- ----------------------------
DROP TABLE IF EXISTS `bao_tuan_details`;
CREATE TABLE `bao_tuan_details` (
  `tuan_id` int(10) NOT NULL,
  `details` text,
  `instructions` text,
  PRIMARY KEY (`tuan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_tuan_details
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_tuan_dianping`
-- ----------------------------
DROP TABLE IF EXISTS `bao_tuan_dianping`;
CREATE TABLE `bao_tuan_dianping` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `tuan_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `contents` varchar(1024) DEFAULT NULL,
  `reply` varchar(1024) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `show_date` date DEFAULT NULL,
  `closed` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_tuan_dianping
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_tuan_dianping_pics`
-- ----------------------------
DROP TABLE IF EXISTS `bao_tuan_dianping_pics`;
CREATE TABLE `bao_tuan_dianping_pics` (
  `pic_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `pic` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_tuan_dianping_pics
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_tuan_meal`
-- ----------------------------
DROP TABLE IF EXISTS `bao_tuan_meal`;
CREATE TABLE `bao_tuan_meal` (
  `tuan_id` int(11) unsigned DEFAULT '0' COMMENT '主套餐',
  `id` int(11) unsigned DEFAULT '0' COMMENT '分套餐id',
  `name` varchar(64) DEFAULT NULL COMMENT '套餐名'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_tuan_meal
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_tuan_order`
-- ----------------------------
DROP TABLE IF EXISTS `bao_tuan_order`;
CREATE TABLE `bao_tuan_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `tuan_id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  `shop_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT '0',
  `total_price` int(11) DEFAULT NULL,
  `use_integral` int(11) DEFAULT '0',
  `need_pay` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `update_time` int(11) DEFAULT '0',
  `update_ip` varchar(15) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '1代表已经付款购买  -1表示到店付',
  `is_mobile` tinyint(1) DEFAULT '0' COMMENT '为了统计用',
  `is_dianping` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100406 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_tuan_order
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_tuan_view`
-- ----------------------------
DROP TABLE IF EXISTS `bao_tuan_view`;
CREATE TABLE `bao_tuan_view` (
  `view_id` int(10) NOT NULL AUTO_INCREMENT,
  `tuan_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`view_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_tuan_view
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_tui`
-- ----------------------------
DROP TABLE IF EXISTS `bao_tui`;
CREATE TABLE `bao_tui` (
  `tui_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tui_name` varchar(64) DEFAULT NULL,
  `tui_link` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`tui_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_tui
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_users`
-- ----------------------------
DROP TABLE IF EXISTS `bao_users`;
CREATE TABLE `bao_users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(64) DEFAULT NULL COMMENT '邮件或者手机',
  `password` char(32) DEFAULT NULL,
  `face` varchar(128) DEFAULT NULL,
  `ext0` varchar(15) DEFAULT NULL COMMENT '为了兼容DISCUZ 设立的用户名存储的字段',
  `nickname` varchar(32) DEFAULT NULL,
  `integral` int(11) DEFAULT '0',
  `prestige` int(11) DEFAULT '0' COMMENT '声望，影响等级的',
  `money` int(11) DEFAULT '0' COMMENT '账户余额',
  `rank_id` tinyint(4) DEFAULT '1' COMMENT '等级ID',
  `gold` int(11) DEFAULT '0',
  `reg_time` int(11) DEFAULT '0',
  `reg_ip` varchar(15) DEFAULT NULL,
  `last_time` int(11) DEFAULT NULL,
  `last_ip` varchar(20) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0' COMMENT '-1代表需要激活   0 代表正常  1 代表删除',
  `uc_id` int(11) DEFAULT '0',
  `email` varchar(64) DEFAULT NULL COMMENT '认证的邮件',
  `mobile` varchar(11) DEFAULT NULL COMMENT '认证的手机号码',
  `ping_num` int(11) DEFAULT '0',
  `post_num` int(11) DEFAULT '0',
  `invite1` int(11) DEFAULT NULL,
  `invite2` int(11) DEFAULT NULL,
  `invite3` int(11) DEFAULT NULL,
  `invite4` int(11) DEFAULT NULL,
  `invite5` int(11) DEFAULT NULL,
  `invite6` int(11) DEFAULT '0',
  `token` char(32) DEFAULT '0',
  `p_openid` varchar(30) DEFAULT NULL COMMENT '微信用户openid',
  `pid` int(10) unsigned DEFAULT NULL COMMENT '邀请人id',
  `is_subscribe` tinyint(2) unsigned DEFAULT '0' COMMENT '是否关注公众号',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `p_openid` (`account`)
) ENGINE=MyISAM AUTO_INCREMENT=216 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_users
-- ----------------------------
INSERT INTO `bao_users` VALUES ('59', '13600000000', 'e10adc3949ba59abbe56e057f20f883e', '', '', '贝小拉', '0', '0', '0', '1', '0', '1413190812', '114.98.220.191', null, null, '1', '0', null, null, '0', '0', null, null, null, null, null, '0', '0', '347c3fd1', null, '0');
INSERT INTO `bao_users` VALUES ('214', 'beilaxiaozhen', 'e10adc3949ba59abbe56e057f20f883e', '', 'beilaxiaozhen', '贝拉小镇', '0', '2', '26000', '1', '0', '1506141304', '192.168.11.1', '1506246309', '127.0.0.1', '0', '0', null, null, '0', '0', null, null, null, null, null, '0', '347c3fd1013c646a8119ff77a7901e01', '347c3fd2', '59', '0');
INSERT INTO `bao_users` VALUES ('215', '18569532116', 'e10adc3949ba59abbe56e057f20f883e', '', '', '烧辣椒皮蛋', '0', '0', '0', '1', '0', '1506408400', '222.244.144.157', null, null, '0', '0', null, null, '0', '0', null, null, null, null, null, '0', '0', '347c3fd3', '59', '0');

-- ----------------------------
-- Table structure for `bao_users_cash`
-- ----------------------------
DROP TABLE IF EXISTS `bao_users_cash`;
CREATE TABLE `bao_users_cash` (
  `cash_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '0未审核1通过2拒绝',
  `reason` text,
  `account` varchar(64) DEFAULT NULL,
  `bank_name` varchar(128) NOT NULL,
  `bank_num` varchar(32) NOT NULL,
  `bank_branch` varchar(128) NOT NULL,
  `bank_realname` varchar(64) NOT NULL,
  PRIMARY KEY (`cash_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_users_cash
-- ----------------------------
INSERT INTO `bao_users_cash` VALUES ('70', '148', '11100', '1447557810', '0', null, '123456@qq.com', '', '', '', '');

-- ----------------------------
-- Table structure for `bao_users_ex`
-- ----------------------------
DROP TABLE IF EXISTS `bao_users_ex`;
CREATE TABLE `bao_users_ex` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `last_uid` int(11) DEFAULT '0',
  `views` int(11) DEFAULT NULL,
  `bank_name` varchar(128) DEFAULT NULL,
  `bank_num` varchar(32) DEFAULT NULL,
  `bank_branch` varchar(128) DEFAULT NULL,
  `bank_realname` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_users_ex
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_users_goods`
-- ----------------------------
DROP TABLE IF EXISTS `bao_users_goods`;
CREATE TABLE `bao_users_goods` (
  `record_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT '0',
  `goods_id` int(10) DEFAULT NULL,
  `record_time` int(11) DEFAULT NULL,
  `record_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_users_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_users_look`
-- ----------------------------
DROP TABLE IF EXISTS `bao_users_look`;
CREATE TABLE `bao_users_look` (
  `look_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `last_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`look_id`),
  UNIQUE KEY `user_id` (`user_id`,`shop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=273 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_users_look
-- ----------------------------
INSERT INTO `bao_users_look` VALUES ('272', '178', '144', '1506242517');

-- ----------------------------
-- Table structure for `bao_users_visitors`
-- ----------------------------
DROP TABLE IF EXISTS `bao_users_visitors`;
CREATE TABLE `bao_users_visitors` (
  `visitors_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `last_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`visitors_id`),
  UNIQUE KEY `uid` (`uid`,`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_users_visitors
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_user_addr`
-- ----------------------------
DROP TABLE IF EXISTS `bao_user_addr`;
CREATE TABLE `bao_user_addr` (
  `addr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `city_id` int(11) DEFAULT '0',
  `area_id` int(11) DEFAULT '0',
  `business_id` int(11) DEFAULT '0',
  `name` varchar(32) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `addr` varchar(1024) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`addr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_user_addr
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_user_card`
-- ----------------------------
DROP TABLE IF EXISTS `bao_user_card`;
CREATE TABLE `bao_user_card` (
  `card_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `card_num` varchar(32) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`card_id`),
  UNIQUE KEY `card_num` (`card_num`)
) ENGINE=MyISAM AUTO_INCREMENT=406 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_user_card
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_user_code`
-- ----------------------------
DROP TABLE IF EXISTS `bao_user_code`;
CREATE TABLE `bao_user_code` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) DEFAULT '0' COMMENT '手机号',
  `code` varchar(10) DEFAULT NULL COMMENT '验证码',
  `validity` int(11) DEFAULT '0' COMMENT '有效期',
  PRIMARY KEY (`code_id`)
) ENGINE=MyISAM AUTO_INCREMENT=257 DEFAULT CHARSET=utf8 COMMENT='用户验证码表';

-- ----------------------------
-- Records of bao_user_code
-- ----------------------------
INSERT INTO `bao_user_code` VALUES ('256', '13590288934', '7004', '300');

-- ----------------------------
-- Table structure for `bao_user_gold_logs`
-- ----------------------------
DROP TABLE IF EXISTS `bao_user_gold_logs`;
CREATE TABLE `bao_user_gold_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `gold` int(11) DEFAULT '0',
  `intro` varchar(64) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_user_gold_logs
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_user_integral_logs`
-- ----------------------------
DROP TABLE IF EXISTS `bao_user_integral_logs`;
CREATE TABLE `bao_user_integral_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL,
  `intro` varchar(256) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_user_integral_logs
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_user_money_logs`
-- ----------------------------
DROP TABLE IF EXISTS `bao_user_money_logs`;
CREATE TABLE `bao_user_money_logs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `money` int(11) DEFAULT '0',
  `intro` varchar(64) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_user_money_logs
-- ----------------------------
INSERT INTO `bao_user_money_logs` VALUES ('122', '214', '26000', '444', '1506229519', '222.244.144.157');

-- ----------------------------
-- Table structure for `bao_user_rank`
-- ----------------------------
DROP TABLE IF EXISTS `bao_user_rank`;
CREATE TABLE `bao_user_rank` (
  `rank_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(32) DEFAULT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `icon1` varchar(64) DEFAULT NULL,
  `prestige` int(11) DEFAULT '0' COMMENT '需要的积分数',
  `rebate` int(10) DEFAULT '0',
  PRIMARY KEY (`rank_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_user_rank
-- ----------------------------
INSERT INTO `bao_user_rank` VALUES ('1', 'VIP1', 'usericon0', '', '0', '1');
INSERT INTO `bao_user_rank` VALUES ('2', 'VIP2', 'usericon1', 'usericon1', '100', '2');
INSERT INTO `bao_user_rank` VALUES ('3', 'VIP3', 'usericon0', 'usericon1', '500', '3');
INSERT INTO `bao_user_rank` VALUES ('4', 'VIP4', 'usericon0', 'usericon1', '1000', '5');
INSERT INTO `bao_user_rank` VALUES ('5', 'VIP5', 'usericon0', 'usericon0', '5000', '10');
INSERT INTO `bao_user_rank` VALUES ('6', 'VIP6', 'usericon0', 'usericon1', '10000', '15');

-- ----------------------------
-- Table structure for `bao_user_sign`
-- ----------------------------
DROP TABLE IF EXISTS `bao_user_sign`;
CREATE TABLE `bao_user_sign` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `day` int(11) DEFAULT '0',
  `is_first` tinyint(4) DEFAULT '1',
  `last_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_user_sign
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_village`
-- ----------------------------
DROP TABLE IF EXISTS `bao_village`;
CREATE TABLE `bao_village` (
  `village_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '物业管理员',
  `city_id` smallint(5) DEFAULT NULL,
  `area_id` smallint(5) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `addr` varchar(128) DEFAULT NULL,
  `tel` varchar(20) NOT NULL,
  `pic` varchar(64) NOT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `orderby` tinyint(4) DEFAULT '100',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `info` text NOT NULL,
  PRIMARY KEY (`village_id`),
  KEY `city_id` (`city_id`,`area_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='小区表';

-- ----------------------------
-- Records of bao_village
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_village_bbs`
-- ----------------------------
DROP TABLE IF EXISTS `bao_village_bbs`;
CREATE TABLE `bao_village_bbs` (
  `post_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `username` varchar(80) NOT NULL,
  `village_id` int(10) NOT NULL,
  `title` varchar(200) NOT NULL,
  `details` text NOT NULL,
  `view_num` int(10) NOT NULL DEFAULT '0',
  `zan_num` int(10) NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL,
  `create_ip` varchar(30) NOT NULL,
  `hot` int(1) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_village_bbs
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_village_bbs_replys`
-- ----------------------------
DROP TABLE IF EXISTS `bao_village_bbs_replys`;
CREATE TABLE `bao_village_bbs_replys` (
  `reply_id` int(10) NOT NULL AUTO_INCREMENT,
  `village_id` int(10) NOT NULL,
  `post_id` int(10) NOT NULL DEFAULT '0',
  `parent_id` int(10) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `create_time` int(10) NOT NULL,
  `create_ip` varchar(20) NOT NULL,
  PRIMARY KEY (`reply_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_village_bbs_replys
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_village_notice`
-- ----------------------------
DROP TABLE IF EXISTS `bao_village_notice`;
CREATE TABLE `bao_village_notice` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `village_id` smallint(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `context` text NOT NULL,
  `addtime` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_village_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_village_suggestion`
-- ----------------------------
DROP TABLE IF EXISTS `bao_village_suggestion`;
CREATE TABLE `bao_village_suggestion` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `village_id` smallint(5) NOT NULL,
  `user` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `context` varchar(255) NOT NULL,
  `addtime` int(11) NOT NULL,
  `replytime` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  `reply` varchar(255) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `person` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_village_suggestion
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_village_worker`
-- ----------------------------
DROP TABLE IF EXISTS `bao_village_worker`;
CREATE TABLE `bao_village_worker` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `village_id` smallint(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `job` varchar(50) NOT NULL,
  `orderby` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_village_worker
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_vote`
-- ----------------------------
DROP TABLE IF EXISTS `bao_vote`;
CREATE TABLE `bao_vote` (
  `vote_id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `is_select` tinyint(2) DEFAULT '0',
  `is_pic` tinyint(2) DEFAULT '0',
  `banner` varchar(64) DEFAULT NULL,
  `num` int(10) DEFAULT '0',
  `shop_id` int(11) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_work` tinyint(2) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`vote_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_vote
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_vote_option`
-- ----------------------------
DROP TABLE IF EXISTS `bao_vote_option`;
CREATE TABLE `bao_vote_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vote_id` int(11) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  `number` int(11) DEFAULT '0',
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_vote_option
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_vote_result`
-- ----------------------------
DROP TABLE IF EXISTS `bao_vote_result`;
CREATE TABLE `bao_vote_result` (
  `result_id` int(10) NOT NULL AUTO_INCREMENT,
  `vote_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `vote_option` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`result_id`),
  KEY `vote_id` (`vote_id`,`create_ip`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_vote_result
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_weidian_details`
-- ----------------------------
DROP TABLE IF EXISTS `bao_weidian_details`;
CREATE TABLE `bao_weidian_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weidian_name` varchar(64) NOT NULL,
  `addr` varchar(128) NOT NULL,
  `business_time` varchar(32) NOT NULL,
  `details` text NOT NULL,
  `pic` varchar(64) NOT NULL,
  `logo` varchar(64) NOT NULL,
  `shop_id` int(10) unsigned NOT NULL,
  `lng` varchar(15) NOT NULL,
  `lat` varchar(15) NOT NULL,
  `cate_id` int(10) unsigned NOT NULL,
  `audit` tinyint(1) unsigned NOT NULL,
  `reg_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  `city_id` smallint(5) unsigned NOT NULL,
  `area_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_weidian_details
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_weixin_conn`
-- ----------------------------
DROP TABLE IF EXISTS `bao_weixin_conn`;
CREATE TABLE `bao_weixin_conn` (
  `conn_id` int(20) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) NOT NULL,
  `status` int(2) NOT NULL,
  `user_id` int(10) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`conn_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_weixin_conn
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_weixin_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `bao_weixin_keyword`;
CREATE TABLE `bao_weixin_keyword` (
  `keyword_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(32) DEFAULT NULL,
  `type` enum('news','text') DEFAULT 'text' COMMENT '0普通消息 1图片消息',
  `title` varchar(128) DEFAULT NULL,
  `contents` text,
  `url` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`keyword_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_weixin_keyword
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_weixin_msg`
-- ----------------------------
DROP TABLE IF EXISTS `bao_weixin_msg`;
CREATE TABLE `bao_weixin_msg` (
  `msg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FromUserName` varchar(64) DEFAULT NULL,
  `ToUserName` varchar(64) DEFAULT NULL,
  `Content` varchar(1024) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`msg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_weixin_msg
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_weixin_qrcode`
-- ----------------------------
DROP TABLE IF EXISTS `bao_weixin_qrcode`;
CREATE TABLE `bao_weixin_qrcode` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '0',
  `soure_id` smallint(5) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_weixin_qrcode
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_weixin_tmpl`
-- ----------------------------
DROP TABLE IF EXISTS `bao_weixin_tmpl`;
CREATE TABLE `bao_weixin_tmpl` (
  `tmpl_id` mediumint(9) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '模板标题',
  `serial` varchar(255) DEFAULT NULL COMMENT '模板系统编号',
  `template_id` varchar(255) DEFAULT NULL COMMENT '模板应用ID',
  `info` varchar(255) DEFAULT NULL COMMENT '模板介绍',
  `sort` tinyint(4) unsigned DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) DEFAULT NULL COMMENT '模板介绍',
  `create_time` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`tmpl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_weixin_tmpl
-- ----------------------------
INSERT INTO `bao_weixin_tmpl` VALUES ('1', '下单成功通知', 'OPENTM202297555', 'crc5bMInGWI2xpeicir5Mkj0IjS5DRytUBpPdiPFjX4', null, '0', '1', '1446794361', '1446820734');
INSERT INTO `bao_weixin_tmpl` VALUES ('2', '订单支付成功 ', 'OPENTM202243342', 'ywj44WufxVan804RdjBZ-P6zt_2nyi0X-cE7QzmH5w4', null, '0', '1', '1446794361', '1446820734');
INSERT INTO `bao_weixin_tmpl` VALUES ('3', '订单确认通知', 'OPENTM203218540', 'Gbaib2CJQYcXQezu1BEJZAK0oJ_PPiAD2d7LuTXcjZk', null, '0', '1', '1446794361', '1446820734');
INSERT INTO `bao_weixin_tmpl` VALUES ('4', '订单取消通知 ', 'TM00850', 'ydBf_eqCWUShMYyJ2LcI5ryhtvnUuq7eOm0RDiEG9nU', null, '0', '1', '1446794361', '1446820734');
INSERT INTO `bao_weixin_tmpl` VALUES ('5', '订单发货通知', 'OPENTM202297614', 'umS5ptvztDdGFTsu-Sq0bxqnoSOf6jlCOTNUOV3bL9c', null, '0', '1', '1446794361', '1446820734');
INSERT INTO `bao_weixin_tmpl` VALUES ('6', '订单确认收货通知', 'OPENTM202314085', 'J0j8u7ilwOPWElyHF7EskXxIxXmrleSVmcCC-E-ObMI', null, '0', '1', '1446794361', '1446820734');
INSERT INTO `bao_weixin_tmpl` VALUES ('7', '账户余额变动通知', 'OPENTM205454780', 'MzpS9ENeHHN0LKuXFpEW5hIhtpW6hhcezIa-WiPBicA', null, '0', '1', '1446794361', '1446820734');

-- ----------------------------
-- Table structure for `bao_work`
-- ----------------------------
DROP TABLE IF EXISTS `bao_work`;
CREATE TABLE `bao_work` (
  `work_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `area_id` smallint(5) DEFAULT '0',
  `city_id` smallint(5) DEFAULT '0',
  `business_id` smallint(5) DEFAULT '0',
  `money1` int(11) DEFAULT '0' COMMENT '起步MONEY',
  `money2` int(11) DEFAULT '0' COMMENT '封顶MONEY',
  `num` tinyint(4) DEFAULT '0' COMMENT '0代表若干',
  `intro` varchar(1024) DEFAULT NULL,
  `work_time` varchar(32) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `expir_date` date DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0' COMMENT '1 代表显示',
  `views` int(11) DEFAULT '0',
  PRIMARY KEY (`work_id`),
  KEY `shop_id` (`shop_id`),
  KEY `lng` (`lng`,`lat`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_work
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_yjuan`
-- ----------------------------
DROP TABLE IF EXISTS `bao_yjuan`;
CREATE TABLE `bao_yjuan` (
  `j_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `nums` tinyint(4) NOT NULL DEFAULT '0',
  `use_num` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`j_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='优惠券表';

-- ----------------------------
-- Records of bao_yjuan
-- ----------------------------
INSERT INTO `bao_yjuan` VALUES ('1', '59', '1', '1');

-- ----------------------------
-- Table structure for `bao_zhuan`
-- ----------------------------
DROP TABLE IF EXISTS `bao_zhuan`;
CREATE TABLE `bao_zhuan` (
  `zhuan_id` int(10) NOT NULL AUTO_INCREMENT,
  `map_id` tinyint(4) DEFAULT NULL,
  `goods_id` int(10) NOT NULL,
  `floor_id` tinyint(4) NOT NULL,
  `sort` smallint(6) NOT NULL DEFAULT '0',
  `deadline` int(10) NOT NULL COMMENT '到期时间',
  PRIMARY KEY (`zhuan_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_zhuan
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_zhuan_config`
-- ----------------------------
DROP TABLE IF EXISTS `bao_zhuan_config`;
CREATE TABLE `bao_zhuan_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `map_id` int(11) DEFAULT NULL,
  `color_title` varchar(10) DEFAULT NULL,
  `color_bg` varchar(10) DEFAULT NULL,
  `color_mtitle` varchar(10) DEFAULT NULL,
  `color_mbg` varchar(10) DEFAULT NULL,
  `pc_banner` varchar(255) DEFAULT NULL,
  `mobile_banner` varchar(255) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '0:删除,1正常',
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_zhuan_config
-- ----------------------------

-- ----------------------------
-- Table structure for `bao_zhuan_floor`
-- ----------------------------
DROP TABLE IF EXISTS `bao_zhuan_floor`;
CREATE TABLE `bao_zhuan_floor` (
  `floor_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(11) DEFAULT NULL COMMENT '11',
  `sort` tinyint(4) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '0:删除,1:正常',
  PRIMARY KEY (`floor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_zhuan_floor
-- ----------------------------
INSERT INTO `bao_zhuan_floor` VALUES ('3', '旅游', '2', '1');

-- ----------------------------
-- Table structure for `bao_zhuan_map`
-- ----------------------------
DROP TABLE IF EXISTS `bao_zhuan_map`;
CREATE TABLE `bao_zhuan_map` (
  `map_id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '专题ID',
  `title` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '0:不启用，1:启用',
  PRIMARY KEY (`map_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bao_zhuan_map
-- ----------------------------
INSERT INTO `bao_zhuan_map` VALUES ('1', '第一个专题', '1');
INSERT INTO `bao_zhuan_map` VALUES ('2', '第二个专题', '1');
INSERT INTO `bao_zhuan_map` VALUES ('3', '第三个专题', '1');
