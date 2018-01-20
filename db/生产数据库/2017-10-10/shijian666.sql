-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2017-10-10 09:00:24
-- 服务器版本： 5.7.18-log
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shijian666`
--

-- --------------------------------------------------------

--
-- 表的结构 `bao_activity`
--

CREATE TABLE `bao_activity` (
  `activity_id` int(10) UNSIGNED NOT NULL,
  `cate_id` int(10) DEFAULT '0',
  `shop_id` int(10) DEFAULT NULL,
  `tuan_id` int(11) DEFAULT '0',
  `city_id` smallint(5) UNSIGNED DEFAULT '0',
  `area_id` smallint(5) UNSIGNED DEFAULT '0',
  `business_id` smallint(5) UNSIGNED DEFAULT '0',
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
  `template` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_activity_cate`
--

CREATE TABLE `bao_activity_cate` (
  `cate_id` int(10) UNSIGNED NOT NULL,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` tinyint(3) DEFAULT '0',
  `orderby` tinyint(3) DEFAULT '100'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_activity_cate`
--

INSERT INTO `bao_activity_cate` (`cate_id`, `cate_name`, `parent_id`, `orderby`) VALUES
(16, '亲子活动', 0, 6);

-- --------------------------------------------------------

--
-- 表的结构 `bao_activity_sign`
--

CREATE TABLE `bao_activity_sign` (
  `sign_id` int(10) UNSIGNED NOT NULL,
  `activity_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `num` int(5) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_ad`
--

CREATE TABLE `bao_ad` (
  `ad_id` int(10) UNSIGNED NOT NULL,
  `site_id` smallint(6) DEFAULT '0',
  `city_id` smallint(5) UNSIGNED DEFAULT '0',
  `title` varchar(64) DEFAULT NULL,
  `link_url` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `code` varchar(1024) DEFAULT NULL,
  `bg_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `orderby` tinyint(3) DEFAULT '100'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_admin`
--

CREATE TABLE `bao_admin` (
  `admin_id` smallint(5) UNSIGNED NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  `role_id` smallint(5) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `last_time` int(11) DEFAULT NULL,
  `last_ip` varchar(20) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_admin`
--

INSERT INTO `bao_admin` (`admin_id`, `username`, `password`, `role_id`, `mobile`, `create_time`, `create_ip`, `last_time`, `last_ip`, `closed`) VALUES
(1, 'admin', '33a75aa862a862adc6cbcd553dc8148c', 1, '15589022301', 1441886203, '127.0.0.1', 1507512641, '175.9.81.130', 0),
(2, 'huo0319', 'afdd0b4ad2ec172c586e2150770fbf9e', 2, '15849921313', 1445578332, '1.25.192.166', NULL, NULL, 1),
(3, '111', '96e79218965eb72c92a549dd5a330112', 2, '15555555511', 1470042533, '112.234.101.6', 1471241057, '140.224.62.130', 1);

-- --------------------------------------------------------

--
-- 表的结构 `bao_ad_site`
--

CREATE TABLE `bao_ad_site` (
  `site_id` smallint(5) UNSIGNED NOT NULL,
  `theme` varchar(32) DEFAULT NULL,
  `site_name` varchar(64) DEFAULT NULL,
  `site_type` tinyint(1) DEFAULT NULL,
  `site_place` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_area`
--

CREATE TABLE `bao_area` (
  `area_id` smallint(5) UNSIGNED NOT NULL,
  `city_id` smallint(5) DEFAULT '0',
  `area_name` varchar(32) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_area`
--

INSERT INTO `bao_area` (`area_id`, `city_id`, `area_name`, `orderby`) VALUES
(24, 8, '望城区', 1);

-- --------------------------------------------------------

--
-- 表的结构 `bao_around`
--

CREATE TABLE `bao_around` (
  `around_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '1代表常去，2代表我家，3代表公司',
  `name` varchar(128) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_around`
--

INSERT INTO `bao_around` (`around_id`, `user_id`, `type`, `name`, `lng`, `lat`) VALUES
(1, 101, 2, '安徽省合肥市庐阳区吴山巷13号', '117.298904', '31.875651'),
(2, 101, 3, '安徽省合肥市庐阳区阜南路51号', '117.292077', '31.875467'),
(3, 101, 1, '安徽省合肥市瑶海区银屏路', '117.305587', '31.877491'),
(4, 1, 2, '安徽省合肥市庐阳区淮河路291号', '117.290927', '31.871296'),
(5, 1, 3, '安徽省合肥市庐阳区寿春路170号', '117.293083', '31.873443'),
(6, 1, 1, '安徽省合肥市庐阳区吴山巷13号', '117.298904', '31.875651'),
(7, 35, 2, '安徽省合肥市庐阳区淮河路377号', '117.286112', '31.872155'),
(8, 125, 2, '安徽省合肥市庐阳区宿州路68号', '117.29567', '31.868537'),
(9, 148, 1, '地址：重庆市黔江区行署街', '108.775235', '29.538243'),
(10, 194, 3, '地址：地铁13号线; 地铁8号线', '116.566705', '40.155183');

-- --------------------------------------------------------

--
-- 表的结构 `bao_article`
--

CREATE TABLE `bao_article` (
  `article_id` int(10) UNSIGNED NOT NULL,
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
  `zan` int(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_article_cate`
--

CREATE TABLE `bao_article_cate` (
  `cate_id` int(10) UNSIGNED NOT NULL,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_article_cate`
--

INSERT INTO `bao_article_cate` (`cate_id`, `cate_name`, `parent_id`, `orderby`) VALUES
(10, '旅游', 0, 4),
(12, '自驾游', 10, 2);

-- --------------------------------------------------------

--
-- 表的结构 `bao_article_comment`
--

CREATE TABLE `bao_article_comment` (
  `comment_id` int(11) NOT NULL COMMENT '主键id',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级评论id,若是一级评论则为0',
  `nickname` varchar(100) DEFAULT NULL COMMENT '评论人昵称',
  `user_id` int(11) DEFAULT NULL COMMENT '评论人UID',
  `post_id` int(11) DEFAULT NULL COMMENT '新闻编号',
  `content` text COMMENT '评论内容',
  `zan` int(6) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT NULL COMMENT '评论或回复发表时间',
  `create_ip` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_award`
--

CREATE TABLE `bao_award` (
  `award_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `type` enum('shark','scratch','lottery') DEFAULT NULL COMMENT '摇一摇 刮刮卡  抽奖大转盘',
  `explain` varchar(1024) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `is_online` tinyint(1) DEFAULT '0' COMMENT '1就是在线状态了'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_award_goods`
--

CREATE TABLE `bao_award_goods` (
  `goods_id` int(10) UNSIGNED NOT NULL,
  `award_id` int(11) DEFAULT NULL,
  `award_name` varchar(32) DEFAULT NULL,
  `goods_name` varchar(64) DEFAULT NULL,
  `prob` int(11) DEFAULT '0' COMMENT '数值越大概率越低',
  `num` int(11) DEFAULT '0',
  `surplus` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_award_share`
--

CREATE TABLE `bao_award_share` (
  `id` int(10) UNSIGNED NOT NULL,
  `award_id` int(11) DEFAULT NULL,
  `is_used` tinyint(4) DEFAULT '0' COMMENT '1代表抽过奖了',
  `ip` varchar(15) DEFAULT NULL,
  `num` int(11) DEFAULT '0' COMMENT '点击的数量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_award_winning`
--

CREATE TABLE `bao_award_winning` (
  `winning_id` int(11) UNSIGNED NOT NULL,
  `award_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `goods_id` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `randstr` varchar(6) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_billboard`
--

CREATE TABLE `bao_billboard` (
  `list_id` int(10) NOT NULL,
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
  `is_chose` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_bill_cate`
--

CREATE TABLE `bao_bill_cate` (
  `cate_id` int(11) UNSIGNED NOT NULL,
  `cate_name` varchar(128) DEFAULT '0',
  `orderby` tinyint(3) DEFAULT '100',
  `photo` varchar(128) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_bill_cate`
--

INSERT INTO `bao_bill_cate` (`cate_id`, `cate_name`, `orderby`, `photo`, `closed`) VALUES
(10, '旅游', 100, '2015/04/24/thumb_5539ab0897a6d.png', 0);

-- --------------------------------------------------------

--
-- 表的结构 `bao_bill_order`
--

CREATE TABLE `bao_bill_order` (
  `bill_order_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT '0',
  `city_id` smallint(5) UNSIGNED DEFAULT '0',
  `area_id` smallint(5) UNSIGNED DEFAULT '0',
  `mobile` varchar(11) DEFAULT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `sum` int(10) UNSIGNED DEFAULT '0',
  `money` int(10) UNSIGNED DEFAULT '0',
  `interest` decimal(15,2) UNSIGNED DEFAULT '0.00',
  `create_time` int(11) UNSIGNED DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED DEFAULT '0' COMMENT '0等待处理  1代表已成功  2代表已退款',
  `admin_id` int(11) UNSIGNED DEFAULT '0',
  `admin_time` int(11) UNSIGNED DEFAULT '0',
  `admin_memo` varchar(255) DEFAULT NULL,
  `bill_type_id` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_bill_shop`
--

CREATE TABLE `bao_bill_shop` (
  `bill_id` int(10) NOT NULL,
  `list_id` int(10) DEFAULT NULL,
  `shop_id` int(10) DEFAULT NULL,
  `reason` varchar(128) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `votenum` int(11) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_bill_type`
--

CREATE TABLE `bao_bill_type` (
  `bill_type_id` tinyint(2) UNSIGNED NOT NULL,
  `bill_type_name` varchar(20) DEFAULT NULL,
  `bill_fields` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `sms_notify` tinyint(1) DEFAULT NULL,
  `fee_rate` decimal(10,2) UNSIGNED DEFAULT '0.00',
  `integral` int(11) UNSIGNED DEFAULT '0',
  `bill_fields_label` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `areas` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_bill_type`
--

INSERT INTO `bao_bill_type` (`bill_type_id`, `bill_type_name`, `bill_fields`, `enable`, `sms_notify`, `fee_rate`, `integral`, `bill_fields_label`, `memo`, `areas`) VALUES
(1, '手机固话', 'realname,mobile', 1, 1, '0.00', 1, '手机户主,手机号,', '目前开通全国代收手机费、山西固话费', '25,26,27,28,29,12,13,14,15,16,17,18,19,20,21,22,23,24,36,37,38,39,40,41,42,43,44,45,30,31,32,33,34,35,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130'),
(2, '电费', 'realname,account', 1, 1, '0.00', 1, '户主姓名,用户编号,', '目前开通长治、晋中、运城、忻州的代收电费业务', '12,13,14,15,16,17,18,19,20,21,22,23,24,46,47,48,49,50,51,52,53,54,55,56,70,71,72,73,74,75,76,77,78,79,80,81,82,111,112,113,114,115,116,117,118,119,120,121,122,123,124'),
(3, '交警罚款', 'realname,account', 1, 0, '0.00', 1, '车牌号码,,处罚决定书编号', '请认真核对您处罚决定书编号，对照填写。', '12,13,14,15,16,17,18,19,20,21,22,23,24'),
(4, '待开发', 'realname,account', 1, 0, '0.00', 1, NULL, NULL, NULL),
(5, '水费', 'realname,mobile,account', 1, 1, '2.00', 0, '姓名,手机号,水费编号', '水费测试', '1,2,3,4,5,6,7,8,9,10,12,11,13,14,15,16,17,18');

-- --------------------------------------------------------

--
-- 表的结构 `bao_bill_vote`
--

CREATE TABLE `bao_bill_vote` (
  `vote_id` int(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bill_id` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_business`
--

CREATE TABLE `bao_business` (
  `business_id` smallint(5) UNSIGNED NOT NULL,
  `business_name` varchar(32) DEFAULT NULL,
  `area_id` smallint(5) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `is_hot` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_business`
--

INSERT INTO `bao_business` (`business_id`, `business_name`, `area_id`, `orderby`, `is_hot`) VALUES
(34, '望城区', 24, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `bao_city`
--

CREATE TABLE `bao_city` (
  `city_id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `pinyin` varchar(32) DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT '0',
  `lng` varchar(15) DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `first_letter` char(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_city`
--

INSERT INTO `bao_city` (`city_id`, `name`, `pinyin`, `is_open`, `lng`, `lat`, `orderby`, `first_letter`) VALUES
(8, '长沙', 'changsha', 1, '112.9455', '28.235', 99, 'C');

-- --------------------------------------------------------

--
-- 表的结构 `bao_community`
--

CREATE TABLE `bao_community` (
  `community_id` smallint(5) UNSIGNED NOT NULL,
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
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='小区表';

-- --------------------------------------------------------

--
-- 表的结构 `bao_community_news`
--

CREATE TABLE `bao_community_news` (
  `news_id` int(11) UNSIGNED NOT NULL,
  `community_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `intro` varchar(1024) DEFAULT NULL,
  `details` text,
  `views` int(11) DEFAULT '0',
  `audit` tinyint(1) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_community_posts`
--

CREATE TABLE `bao_community_posts` (
  `post_id` int(10) NOT NULL,
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
  `create_ip` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_community_replys`
--

CREATE TABLE `bao_community_replys` (
  `reply_id` int(10) NOT NULL,
  `community_id` int(10) NOT NULL,
  `post_id` int(10) NOT NULL DEFAULT '0',
  `parent_id` int(10) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `gallery` varchar(500) NOT NULL,
  `create_time` int(10) NOT NULL,
  `create_ip` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_community_users`
--

CREATE TABLE `bao_community_users` (
  `join_id` int(10) NOT NULL,
  `community_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_connect`
--

CREATE TABLE `bao_connect` (
  `connect_id` int(10) UNSIGNED NOT NULL,
  `type` enum('weibo','test','weixin','qq') DEFAULT 'qq' COMMENT 'test 作为调试的时候使用！以免不懂得用户误会小弟啊',
  `open_id` varchar(32) DEFAULT NULL,
  `token` varchar(512) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_convenient_phone`
--

CREATE TABLE `bao_convenient_phone` (
  `phone_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `orderby` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_convenient_phone_maps`
--

CREATE TABLE `bao_convenient_phone_maps` (
  `phone_id` int(11) DEFAULT NULL,
  `community_id` smallint(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_convenient_phone_villages`
--

CREATE TABLE `bao_convenient_phone_villages` (
  `phone_id` int(11) DEFAULT NULL,
  `village_id` smallint(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_coupon`
--

CREATE TABLE `bao_coupon` (
  `coupon_id` int(10) UNSIGNED NOT NULL,
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
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_coupon_download`
--

CREATE TABLE `bao_coupon_download` (
  `download_id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `mobile` char(11) DEFAULT NULL,
  `code` char(8) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `is_used` tinyint(1) DEFAULT '0',
  `used_time` int(11) DEFAULT NULL,
  `used_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_delivery`
--

CREATE TABLE `bao_delivery` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `add_time` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_delivery_order`
--

CREATE TABLE `bao_delivery_order` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '0是商城，1是外卖，2是快件',
  `type_order_id` int(10) UNSIGNED NOT NULL COMMENT '关联的分类中的订单编号',
  `delivery_id` int(10) UNSIGNED NOT NULL COMMENT '配送员ID',
  `shop_id` int(10) UNSIGNED NOT NULL,
  `city_id` int(10) NOT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `lng` varchar(15) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `shop_name` varchar(64) NOT NULL DEFAULT '',
  `shop_addr` varchar(64) NOT NULL DEFAULT '',
  `shop_mobile` varchar(64) DEFAULT '',
  `user_name` varchar(64) NOT NULL DEFAULT '',
  `user_addr` varchar(64) NOT NULL DEFAULT '',
  `user_mobile` varchar(11) DEFAULT '',
  `create_time` int(10) UNSIGNED NOT NULL,
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '接单时间',
  `end_time` int(10) DEFAULT '0' COMMENT '完成时间 ',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '0是货到付款，1是已付款，2是配送中，8是已完成。',
  `closed` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_ele`
--

CREATE TABLE `bao_ele` (
  `shop_id` int(10) UNSIGNED NOT NULL,
  `shop_name` varchar(64) DEFAULT NULL COMMENT '冗余方便查询',
  `city_id` smallint(5) UNSIGNED DEFAULT NULL,
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
  `audit` tinyint(3) UNSIGNED DEFAULT '0' COMMENT '0审核中1成功入驻2未通过',
  `rate` int(11) DEFAULT '60' COMMENT '费率 每个商品的结算价格'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_ele_cate`
--

CREATE TABLE `bao_ele_cate` (
  `cate_id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `cate_name` varchar(32) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  `closed` tinyint(2) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_ele_cate`
--

INSERT INTO `bao_ele_cate` (`cate_id`, `shop_id`, `cate_name`, `num`, `closed`) VALUES
(1, 39, '旅游', 3, 0);

-- --------------------------------------------------------

--
-- 表的结构 `bao_ele_dianping`
--

CREATE TABLE `bao_ele_dianping` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `speed` tinyint(3) UNSIGNED DEFAULT '0',
  `contents` varchar(1024) DEFAULT NULL,
  `reply` varchar(1024) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `show_date` date DEFAULT NULL,
  `closed` tinyint(2) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_ele_dianping_pics`
--

CREATE TABLE `bao_ele_dianping_pics` (
  `pic_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `pic` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_ele_order`
--

CREATE TABLE `bao_ele_order` (
  `order_id` int(10) UNSIGNED NOT NULL,
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
  `month` int(11) DEFAULT '201501'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_ele_order_product`
--

CREATE TABLE `bao_ele_order_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  `total_price` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_ele_product`
--

CREATE TABLE `bao_ele_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(32) DEFAULT NULL,
  `desc` varchar(255) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `settlement_price` int(11) UNSIGNED DEFAULT NULL,
  `is_new` tinyint(1) DEFAULT '0',
  `is_hot` tinyint(1) DEFAULT '0',
  `is_tuijian` tinyint(1) DEFAULT '0',
  `sold_num` int(11) DEFAULT '0',
  `month_num` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `audit` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_email`
--

CREATE TABLE `bao_email` (
  `email_id` int(10) UNSIGNED NOT NULL,
  `email_key` varchar(32) DEFAULT NULL,
  `email_explain` varchar(1024) DEFAULT NULL,
  `email_tmpl` text,
  `is_open` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_express`
--

CREATE TABLE `bao_express` (
  `express_id` int(10) UNSIGNED NOT NULL,
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
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_feedback`
--

CREATE TABLE `bao_feedback` (
  `feed_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `details` text,
  `reply` text,
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `reply_time` int(11) DEFAULT NULL,
  `reply_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_found`
--

CREATE TABLE `bao_found` (
  `found_id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  `link_url` varchar(128) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_goods`
--

CREATE TABLE `bao_goods` (
  `goods_id` int(10) UNSIGNED NOT NULL,
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
  `use_integral` int(11) DEFAULT '0' COMMENT '可使用积分数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_goods`
--

INSERT INTO `bao_goods` (`goods_id`, `title`, `intro`, `num`, `guige`, `cate_id`, `shopcate_id`, `area_id`, `business_id`, `shop_id`, `city_id`, `branch_id`, `select1`, `select2`, `select3`, `select4`, `select5`, `photo`, `wei_pic`, `price`, `mall_price`, `settlement_price`, `sold_num`, `views`, `instructions`, `details`, `end_date`, `audit`, `closed`, `is_mall`, `is_vs1`, `is_vs2`, `is_vs3`, `is_vs4`, `is_vs5`, `is_vs6`, `commission`, `share`, `create_time`, `create_ip`, `orderby`, `use_integral`) VALUES
(2, '贝拉小镇国庆开园活动', '贝拉小镇国庆开园活动', 2147483647, '无', 2, 54, 24, 33, 144, '8', NULL, 0, 0, 0, 0, 0, '2017/09/27/thumb_59cbabd6545ec.jpg', '0', 26000, 26000, 25740, 0, 0, '<p>贝拉小镇国庆开园活动</p>', '<p>贝拉小镇国庆开园活动</p>', '2017-09-30', 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1506154971, '192.168.11.1', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `bao_goods_cate`
--

CREATE TABLE `bao_goods_cate` (
  `cate_id` int(10) UNSIGNED NOT NULL,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `select1` varchar(32) DEFAULT NULL,
  `select2` varchar(32) DEFAULT NULL,
  `select3` varchar(32) DEFAULT NULL,
  `select4` varchar(32) DEFAULT NULL,
  `select5` varchar(32) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `rate` int(11) DEFAULT '60' COMMENT '结算费率'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_goods_cate`
--

INSERT INTO `bao_goods_cate` (`cate_id`, `cate_name`, `parent_id`, `select1`, `select2`, `select3`, `select4`, `select5`, `orderby`, `rate`) VALUES
(1, '旅游', 0, '', '', '', '', '', 1, 0),
(2, '亲子活动', 1, '', '', '', '', '', 1, 10);

-- --------------------------------------------------------

--
-- 表的结构 `bao_goods_cate_attr`
--

CREATE TABLE `bao_goods_cate_attr` (
  `attr_id` smallint(5) UNSIGNED NOT NULL,
  `cate_id` smallint(5) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `attr_name` varchar(32) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_goods_dianping`
--

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
  `closed` tinyint(2) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_goods_dianping_pics`
--

CREATE TABLE `bao_goods_dianping_pics` (
  `pic_id` int(10) UNSIGNED NOT NULL,
  `goods_id` int(11) DEFAULT '0',
  `dianping_id` int(11) DEFAULT NULL,
  `pic` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_goods_photos`
--

CREATE TABLE `bao_goods_photos` (
  `pic_id` int(11) UNSIGNED NOT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_goods_photos`
--

INSERT INTO `bao_goods_photos` (`pic_id`, `goods_id`, `photo`) VALUES
(8, 2, '2017/09/27/59cbabdd19275.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `bao_goods_shopcate`
--

CREATE TABLE `bao_goods_shopcate` (
  `cate_id` int(10) UNSIGNED NOT NULL,
  `cate_name` varchar(32) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_goods_shopcate`
--

INSERT INTO `bao_goods_shopcate` (`cate_id`, `cate_name`, `shop_id`, `orderby`) VALUES
(54, '亲子活动', 144, 1);

-- --------------------------------------------------------

--
-- 表的结构 `bao_housework`
--

CREATE TABLE `bao_housework` (
  `housework_id` int(10) UNSIGNED NOT NULL,
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
  `gold` tinyint(3) DEFAULT '0' COMMENT '未填数字代表应用全局的设置'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_housework_look`
--

CREATE TABLE `bao_housework_look` (
  `look_id` int(10) UNSIGNED NOT NULL,
  `housework_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_housework_setting`
--

CREATE TABLE `bao_housework_setting` (
  `id` tinyint(3) UNSIGNED NOT NULL,
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
  `areas` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_huodong`
--

CREATE TABLE `bao_huodong` (
  `huodong_id` int(10) NOT NULL,
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
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_huodong_sign`
--

CREATE TABLE `bao_huodong_sign` (
  `sign_id` int(10) NOT NULL,
  `huodong_id` int(11) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `num` int(5) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_integral_exchange`
--

CREATE TABLE `bao_integral_exchange` (
  `exchange_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `addr_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0' COMMENT '1代表后台已经确认了那么发货是前台发货还是什么流程'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_integral_goods`
--

CREATE TABLE `bao_integral_goods` (
  `goods_id` int(10) UNSIGNED NOT NULL,
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
  `orderby` tinyint(3) DEFAULT '100'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_keyword`
--

CREATE TABLE `bao_keyword` (
  `key_id` int(10) UNSIGNED NOT NULL,
  `keyword` varchar(32) DEFAULT NULL,
  `type` tinyint(2) DEFAULT '0' COMMENT '搜索关键字，0不限，1表示团购，2表示商家',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_keyword`
--

INSERT INTO `bao_keyword` (`key_id`, `keyword`, `type`, `create_time`, `create_ip`) VALUES
(1, '培训', 1, 1420630100, '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `bao_life`
--

CREATE TABLE `bao_life` (
  `life_id` int(10) UNSIGNED NOT NULL,
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
  `lat` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_life_cate`
--

CREATE TABLE `bao_life_cate` (
  `cate_id` smallint(5) UNSIGNED NOT NULL,
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
  `is_hot` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_life_cate_attr`
--

CREATE TABLE `bao_life_cate_attr` (
  `attr_id` smallint(5) UNSIGNED NOT NULL,
  `cate_id` smallint(5) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `attr_name` varchar(32) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_life_cate_attr`
--

INSERT INTO `bao_life_cate_attr` (`attr_id`, `cate_id`, `type`, `attr_name`, `orderby`) VALUES
(1086, 35, 'select3', '1万—2万', 3),
(1087, 35, 'select3', '2万—4万', 4),
(1088, 35, 'select3', '4万—6万', 5),
(1089, 35, 'select3', '6万—8万', 6),
(1090, 35, 'select3', '8万以上', 7),
(1092, 36, 'select1', '小型车', 2),
(1093, 36, 'select1', 'SUV/越野车', 3),
(1094, 36, 'select1', '中型车', 4),
(1095, 36, 'select1', '豪华车', 5),
(1096, 36, 'select1', 'MPV/商务车', 6),
(1097, 36, 'select1', '跑车', 7),
(1098, 36, 'select1', '面包车', 8),
(1101, 36, 'select1', '其它', 9),
(1102, 36, 'select2', '奇瑞   ', 2),
(1103, 36, 'select2', '大众    ', 3),
(1104, 36, 'select2', '现代   ', 4),
(1105, 36, 'select2', '别克   ', 5),
(1106, 36, 'select2', '本田   ', 6),
(1107, 36, 'select2', '江淮   ', 7),
(1108, 36, 'select2', '日产   ', 8),
(1109, 36, 'select2', '雪佛兰   ', 9),
(1110, 36, 'select2', '丰田   ', 10),
(1111, 36, 'select2', '奥迪   ', 11),
(1112, 36, 'select2', '宝马   ', 12),
(1113, 36, 'select2', '福特  ', 13),
(1114, 36, 'select2', '起亚  ', 14),
(1115, 36, 'select2', '长安   ', 15),
(1116, 36, 'select2', '瑞麒   ', 16),
(1117, 36, 'select2', '比亚迪    ', 17),
(1118, 36, 'select2', '马自达   ', 18),
(1119, 36, 'select2', '福田    ', 19),
(1120, 36, 'select2', '标致    ', 20),
(1121, 36, 'select2', '奔驰   ', 21),
(1122, 36, 'select2', '东风   ', 22),
(1123, 36, 'select2', '长城   ', 23),
(1124, 36, 'select2', '雪铁龙   ', 24),
(1125, 36, 'select2', '中华  ', 25),
(1126, 36, 'select2', '荣威  ', 26),
(1127, 36, 'select2', '铃木  ', 27),
(1128, 36, 'select2', 'MG  ', 28),
(1129, 36, 'select2', '开瑞   ', 29),
(1130, 36, 'select2', '一汽   ', 30),
(1131, 36, 'select2', '沃尔沃   ', 31),
(1132, 36, 'select2', '金杯   ', 32),
(1133, 36, 'select2', '三菱   ', 33),
(1134, 36, 'select2', '莲花   ', 34),
(1135, 36, 'select2', '凯迪拉克    ', 35),
(1136, 36, 'select2', '海马   ', 36),
(1137, 36, 'select2', '哈飞   ', 37),
(1138, 36, 'select2', '长丰     ', 38),
(1139, 36, 'select2', '东南    ', 39),
(1140, 36, 'select2', '吉利    ', 40),
(1141, 36, 'select2', '斯柯达    ', 41),
(1142, 36, 'select2', '夏利    ', 42),
(1143, 36, 'select2', '昌河   ', 43),
(1144, 36, 'select2', '双环   ', 44),
(1145, 36, 'select2', '双龙   ', 45),
(1146, 36, 'select2', '西安奥拓   ', 46),
(1147, 36, 'select2', '斯巴鲁    ', 47),
(1148, 36, 'select2', '萨博    ', 48),
(1149, 36, 'select2', '中兴   ', 49),
(1150, 36, 'select2', '宝骏    ', 50),
(1151, 36, 'select2', '众泰   ', 51),
(1152, 36, 'select2', 'MINI(迷你)   ', 52),
(1153, 36, 'select2', '解放    ', 53),
(1154, 36, 'select2', '保时捷    ', 54),
(1155, 36, 'select2', '北汽制造    ', 55),
(1156, 36, 'select2', '宾利    ', 56),
(1157, 36, 'select2', '奔腾   ', 57),
(1158, 36, 'select2', '英菲尼迪         ', 58),
(1159, 36, 'select2', '吉利英伦   ', 59),
(1160, 36, 'select2', '新凯   ', 60),
(1161, 36, 'select2', '东风风神     ', 61),
(1162, 36, 'select2', '江铃   ', 62),
(1163, 36, 'select2', '东风风行    ', 63),
(1164, 36, 'select2', '捷豹    ', 64),
(1165, 36, 'select2', '菲亚特   ', 65),
(1166, 36, 'select2', '克莱斯勒    ', 66),
(1167, 36, 'select2', '吉普   ', 67),
(1168, 36, 'select2', '吉奥  ', 68),
(1169, 36, 'select2', '红旗    ', 69),
(1170, 36, 'select2', '华普    ', 70),
(1171, 36, 'select2', '华泰   ', 71),
(1172, 36, 'select2', '黄海   ', 72),
(1173, 36, 'select2', '雷克萨斯    ', 73),
(1174, 36, 'select2', '雷诺    ', 74),
(1175, 36, 'select2', '欧宝   ', 75),
(1176, 36, 'select2', '吉利帝豪   ', 76),
(1177, 36, 'select2', '道奇   ', 77),
(1178, 36, 'select2', '大迪    ', 78),
(1179, 36, 'select2', '讴歌    ', 79),
(1180, 36, 'select2', '路虎    ', 80),
(1181, 36, 'select2', '力帆     ', 81),
(1182, 36, 'select2', '林肯    ', 82),
(1183, 36, 'select2', '法拉利    ', 83),
(1184, 36, 'select2', '陆风川汽   ', 84),
(1185, 36, 'select2', '野马   ', 85),
(1186, 36, 'select2', '玛莎拉蒂', 86),
(1187, 36, 'select2', '兰博基尼', 87),
(1188, 36, 'select2', '其他', 88),
(1189, 36, 'select3', '1万以下', 2),
(1190, 36, 'select3', '1万—2万', 3),
(1191, 36, 'select3', '2万—4万', 4),
(1192, 36, 'select3', '4万以上', 5),
(1194, 37, 'select1', '车辆收购', 2),
(1195, 37, 'select1', '车辆评估', 3),
(1199, 38, 'select1', '快递员', 2),
(1200, 38, 'select1', '送货员', 3),
(1201, 38, 'select1', '保安', 4),
(1202, 38, 'select1', '编辑', 5),
(1203, 38, 'select1', '前台', 6),
(1204, 38, 'select1', '收银员', 7),
(1205, 38, 'select1', '店长', 8),
(1206, 38, 'select1', '摄影/影视', 9),
(1207, 38, 'select1', '广告/美工/设计', 10),
(1208, 38, 'select1', '保健按摩', 11),
(1209, 38, 'select1', 'KTV/酒吧', 12),
(1210, 38, 'select1', '美容美发', 13),
(1211, 38, 'select1', '网管', 14),
(1212, 38, 'select1', '翻译', 15),
(1213, 38, 'select1', '仓管', 16),
(1214, 38, 'select1', '切配', 17),
(1215, 38, 'select1', '厨师', 18),
(1216, 38, 'select1', '司机', 19),
(1217, 38, 'select1', '文员', 20),
(1218, 38, 'select1', '人事', 21),
(1219, 38, 'select1', '客服', 22),
(1220, 38, 'select1', '服务员', 23),
(1221, 38, 'select1', '营业员', 24),
(1222, 38, 'select1', '工人/技工', 25),
(1223, 38, 'select1', '行政', 26),
(1224, 38, 'select1', '房产经纪人', 27),
(1225, 38, 'select1', '助理', 28),
(1226, 38, 'select1', '教育/培训/咨询', 29),
(1227, 38, 'select1', '金融/银行/保险', 30),
(1228, 38, 'select1', '财务/会计/出纳', 31),
(1229, 38, 'select1', '家政', 32),
(1230, 38, 'select1', '保洁', 33),
(1231, 38, 'select1', '销售/业务员', 34),
(1232, 38, 'select1', '程序工程师', 35),
(1233, 38, 'select1', '其他', 36),
(1234, 38, 'select2', '女', 2),
(1235, 38, 'select2', '男', 3),
(1236, 38, 'select3', '本科及以上', 2),
(1237, 38, 'select3', '大专', 3),
(1238, 38, 'select3', '高中/中专', 4),
(1239, 38, 'select3', '初中及以下', 5),
(1241, 39, 'select1', '翻译', 2),
(1242, 39, 'select1', '演员', 3),
(1243, 39, 'select1', '客服', 4),
(1244, 39, 'select1', '充场/座谈会', 5),
(1245, 39, 'select1', '摄影', 6),
(1246, 39, 'select1', '网站', 7),
(1247, 39, 'select1', '会计', 8),
(1248, 39, 'select1', '模特', 9),
(1249, 39, 'select1', '礼仪', 10),
(1250, 39, 'select1', '设计', 11),
(1251, 39, 'select1', '家教', 12),
(1252, 39, 'select1', '服务员', 13),
(1253, 39, 'select1', '场地布置', 14),
(1254, 39, 'select1', '其他', 15),
(1256, 39, 'select2', '女', 2),
(1257, 39, 'select2', '男', 3),
(1259, 40, 'select1', '旅游', 2),
(1260, 40, 'select1', '运动', 3),
(1261, 40, 'select1', '唱歌/泡吧', 4),
(1262, 40, 'select1', '创业', 5),
(1263, 40, 'select1', '做公益', 6),
(1264, 40, 'select1', '逛街', 7),
(1265, 40, 'select1', '学习', 8),
(1266, 40, 'select1', '玩桌游', 9),
(1267, 40, 'select1', '看演出', 10),
(1268, 40, 'select1', '晨跑', 11),
(1269, 40, 'select1', '广场活动', 12),
(1270, 40, 'select1', '其他', 13),
(1272, 40, 'select2', '女', 2),
(1273, 40, 'select2', '男', 3),
(1275, 41, 'select1', '女', 2),
(1276, 41, 'select1', '男', 3),
(1278, 41, 'select2', '25岁以下', 2),
(1279, 41, 'select2', '25岁—30岁', 3),
(1280, 41, 'select2', '30岁—40岁', 4),
(1281, 41, 'select2', '40岁—50岁', 5),
(1282, 41, 'select2', '50岁—60岁', 6),
(1283, 41, 'select2', '60岁以上', 7),
(1285, 42, 'select1', '女', 2),
(1286, 42, 'select1', '男', 3),
(1288, 42, 'select2', '20岁以下', 2),
(1289, 42, 'select2', '20岁—25岁', 3),
(1290, 42, 'select2', '25岁—30岁岁', 4),
(1291, 42, 'select2', '30岁—40岁', 5),
(1292, 42, 'select2', '40岁—50岁', 6),
(1293, 42, 'select2', '50岁以上', 7),
(1295, 44, 'select1', '魔术', 17),
(1296, 44, 'select1', '古玩鉴赏', 18),
(1297, 44, 'select1', '电器维修', 19),
(1298, 44, 'select1', '唱歌', 20),
(1299, 44, 'select1', '方言', 21),
(1300, 44, 'select1', '理财/金融', 22),
(1301, 44, 'select1', '数理化', 23),
(1302, 44, 'select1', '武术', 24),
(1303, 44, 'select1', '电工', 25),
(1304, 44, 'select1', '象棋/围棋', 26),
(1305, 44, 'select1', '中医', 27),
(1306, 44, 'select1', '平面设计', 28),
(1307, 44, 'select1', '服装设计', 29),
(1308, 44, 'select1', '会计/财务', 16),
(1309, 44, 'select1', '乐器', 15),
(1310, 44, 'select1', '美容/按摩', 2),
(1311, 44, 'select1', '外语', 3),
(1312, 44, 'select1', '开车', 4),
(1313, 44, 'select1', '电脑', 5),
(1314, 44, 'select1', '体育/打球', 6),
(1315, 44, 'select1', '跳舞', 7),
(1316, 44, 'select1', '室内设计', 8),
(1317, 44, 'select1', '摄影', 9),
(1318, 44, 'select1', '销售', 10),
(1319, 44, 'select1', '书法绘画', 11),
(1320, 44, 'select1', '烹饪', 12),
(1321, 44, 'select1', '投资/开店', 13),
(1322, 44, 'select1', '电脑程序', 14),
(1323, 44, 'select1', '其他', 30),
(1325, 45, 'select1', '寻人启事', 2),
(1326, 45, 'select1', '寻物启事', 3),
(1327, 45, 'select1', '寻宠物启事', 4),
(1328, 45, 'select1', '老乡', 5),
(1329, 45, 'select1', '其他', 6),
(1331, 46, 'select1', '没车', 2),
(1332, 46, 'select1', '有车', 3),
(1334, 46, 'select2', '长途拼车', 2),
(1335, 46, 'select2', '上下班拼车', 3),
(1336, 46, 'select2', '上下学拼车', 4),
(1337, 46, 'select2', '其他拼车', 5),
(1339, 47, 'select1', '整套出租', 2),
(1340, 47, 'select1', '单间出租', 3),
(1341, 47, 'select1', '床位出租', 4),
(1343, 47, 'select2', '500元以下', 2),
(1344, 47, 'select2', '500元—1000元', 3),
(1345, 47, 'select2', '1000元—1500元', 4),
(1346, 47, 'select2', '1500元—2500元', 5),
(1347, 47, 'select2', '2500元—3500元', 6),
(1348, 47, 'select2', '3500元以上', 7),
(1350, 47, 'select3', '4室及以上', 2),
(1351, 47, 'select3', '3室', 3),
(1352, 47, 'select3', '2室', 4),
(1353, 47, 'select3', '1室', 5),
(1355, 48, 'select1', '整套出租', 2),
(1356, 48, 'select1', '单间出租', 3),
(1357, 48, 'select1', '床位出租', 4),
(1359, 48, 'select2', '500元以下', 2),
(1360, 48, 'select2', '500元—1000元', 3),
(1361, 48, 'select2', '1000元—1500元', 4),
(1362, 48, 'select2', '1500元—2500元', 5),
(1363, 48, 'select2', '2500元—3500元', 6),
(1364, 48, 'select2', '3500元以上', 7),
(1366, 48, 'select3', '4室及以上', 2),
(1367, 48, 'select3', '3室', 3),
(1368, 48, 'select3', '2室', 4),
(1369, 48, 'select3', '1室', 5),
(1371, 49, 'select1', '限70平米以下', 2),
(1372, 49, 'select1', '70平米—90平米', 3),
(1373, 49, 'select1', '90平米—110平米', 4),
(1374, 49, 'select1', '110平米—150平米', 5),
(1375, 49, 'select1', '150平米以上', 6),
(1377, 49, 'select2', '30万以下', 2),
(1378, 49, 'select2', '30万—40万', 3),
(1379, 49, 'select2', '40万—50万', 4),
(1380, 49, 'select2', '50万—70万', 5),
(1381, 49, 'select2', '70万—90万', 6),
(1382, 49, 'select2', '90万—120万', 7),
(1383, 49, 'select2', '120万以上', 8),
(1385, 49, 'select3', '4室及以上', 2),
(1386, 49, 'select3', '3室2厅2卫', 3),
(1387, 49, 'select3', '3室2厅1卫', 4),
(1388, 49, 'select3', '3室1厅1卫', 5),
(1389, 49, 'select3', '2室2厅2卫', 6),
(1390, 49, 'select3', '1室1厅1卫', 7),
(1391, 49, 'select3', '2室1厅1卫', 8),
(1392, 49, 'select3', '2室2厅1卫', 9),
(1393, 49, 'select3', '1室0厅1卫', 10),
(1394, 49, 'select3', '其它', 11),
(1396, 50, 'select1', '临街店铺', 2),
(1397, 50, 'select1', '购物中心', 3),
(1398, 50, 'select1', '住宅底商摊位/柜台', 4),
(1399, 50, 'select1', '写字楼底商', 5),
(1400, 50, 'select1', '其他', 6),
(1402, 50, 'select2', '50平米以下', 2),
(1403, 50, 'select2', '50平米—100平米', 3),
(1404, 50, 'select2', '100平米—150平米', 4),
(1405, 50, 'select2', '150平米—250平米', 5),
(1406, 50, 'select2', '250平米以上', 6),
(1408, 50, 'select3', '30万以下', 2),
(1409, 50, 'select3', '30万—50万', 3),
(1410, 50, 'select3', '50万—80万', 4),
(1411, 50, 'select3', '80万—120万', 5),
(1412, 50, 'select3', '120万—300万', 6),
(1413, 50, 'select3', '300万—500万', 7),
(1414, 50, 'select3', '500万以上', 8),
(1418, 51, 'select1', '餐饮美食', 2),
(1419, 51, 'select1', '空铺转让', 3),
(1420, 51, 'select1', '服饰鞋包', 4),
(1421, 51, 'select1', '休闲娱乐', 5),
(1422, 51, 'select1', '美容美发', 6),
(1423, 51, 'select1', '酒店宾馆', 7),
(1424, 51, 'select1', '超市零售', 8),
(1425, 51, 'select1', '生活服务', 9),
(1426, 51, 'select1', '汽修美容', 10),
(1427, 51, 'select1', '家居建材', 11),
(1428, 51, 'select1', '电子通讯', 12),
(1429, 51, 'select1', '教育培训', 13),
(1430, 51, 'select1', '专柜转让', 14),
(1431, 51, 'select1', '医药保健', 15),
(1432, 51, 'select1', '其它', 16),
(1433, 51, 'select2', '50平米以下', 2),
(1434, 51, 'select2', '50平米—80平米', 3),
(1435, 51, 'select2', '80平米—120平米', 4),
(1436, 51, 'select2', '120平米—200平米', 5),
(1437, 51, 'select2', '200平米以上', 6),
(1438, 51, 'select3', '2000元/月以下', 2),
(1439, 51, 'select3', '2000元/月—3000元/月', 3),
(1440, 51, 'select3', '3000元/月—5000元/月', 4),
(1441, 51, 'select3', '5000元/月—8000元/月', 5),
(1442, 51, 'select3', '8000元/月—15000元/月', 6),
(1443, 51, 'select3', '15000元/月以上', 7),
(1447, 53, 'select1', '纯写字楼', 2),
(1448, 53, 'select1', '商务中心', 3),
(1449, 53, 'select1', '商住楼', 4),
(1450, 53, 'select1', '园区办公', 5),
(1451, 53, 'select1', '其他', 6),
(1452, 53, 'select2', '50平米以下', 2),
(1453, 53, 'select2', '50平米—100平米', 3),
(1454, 53, 'select2', '100平米—150平米', 4),
(1455, 53, 'select2', '150平米—200平米', 5),
(1456, 53, 'select2', '200平米—300平米', 6),
(1457, 53, 'select2', '300平米以上', 7),
(1458, 53, 'select3', '50元/平米/天以下', 2),
(1459, 53, 'select3', '50—100元/平米/天', 3),
(1460, 53, 'select3', '100—200元/平米/天', 4),
(1461, 53, 'select3', '200—400元/平米/天', 5),
(1462, 53, 'select3', '400以上元/平米/天', 6),
(1466, 54, 'select1', '家庭旅馆', 2),
(1467, 54, 'select1', '宾馆酒店', 3),
(1468, 54, 'select1', '高档公寓', 4),
(1469, 54, 'select1', '其他', 5),
(1470, 54, 'select2', '床位', 2),
(1471, 54, 'select2', '单间', 3),
(1472, 54, 'select2', '整套', 4),
(1473, 54, 'select3', '20元/天以下', 2),
(1474, 54, 'select3', '20元/天—50元/天', 3),
(1475, 54, 'select3', '50元/天—100元/天', 4),
(1476, 54, 'select3', '100元/天—200元/天', 5),
(1477, 54, 'select3', '200元/天—400元/天', 6),
(1478, 54, 'select3', '400元/天以上', 7),
(1480, 55, 'select1', '50平米以下', 2),
(1481, 55, 'select1', '50平米—150平米', 3),
(1482, 55, 'select1', '150平米—300平米', 4),
(1483, 55, 'select1', '300平米—500平米', 5),
(1484, 55, 'select1', '500平米—1000平米', 6),
(1485, 55, 'select1', '1000平米—3000平米', 7),
(1486, 55, 'select1', '3000平米以上', 8),
(1488, 55, 'select2', '50元/平米/天以下', 2),
(1489, 55, 'select2', '50—100元/平米/天', 3),
(1490, 55, 'select2', '100—200元/平米/天', 4),
(1491, 55, 'select2', '200—400元/平米/天', 5),
(1492, 55, 'select2', '400元/平米/天以上', 6),
(1496, 56, 'select1', '纯写字楼', 2),
(1497, 56, 'select1', '商务中心', 3),
(1498, 56, 'select1', '商住楼', 4),
(1499, 56, 'select1', '园区办公', 5),
(1500, 56, 'select1', '其他', 6),
(1501, 56, 'select2', '50平米以下', 2),
(1502, 56, 'select2', '50平米—80平米', 3),
(1503, 56, 'select2', '80平米—120平米', 4),
(1504, 56, 'select2', '120平米—180平米', 5),
(1505, 56, 'select2', '180平米—250平米', 6),
(1506, 56, 'select2', '250平米以上', 7),
(1507, 56, 'select3', '30万元以下', 2),
(1508, 56, 'select3', '30万元—50万元', 3),
(1509, 56, 'select3', '50万元—100万元', 4),
(1510, 56, 'select3', '100万元—200万元', 5),
(1511, 56, 'select3', '200万元—300万元', 6),
(1512, 56, 'select3', '300万元—500万元', 7),
(1513, 56, 'select3', '500万元以上', 8),
(1515, 57, 'select1', '50平米以下', 2),
(1516, 57, 'select1', '50平米—80平米', 3),
(1517, 57, 'select1', '80平米—120平米', 4),
(1518, 57, 'select1', '120平米—150平米', 5),
(1519, 57, 'select1', '150平米—250平米', 6),
(1520, 57, 'select1', '250平米以上', 7),
(1522, 57, 'select2', '30万元以下', 2),
(1523, 57, 'select2', '30万元—50万元', 3),
(1524, 57, 'select2', '50万元—80万元', 4),
(1525, 57, 'select2', '80万元—120万元', 5),
(1526, 57, 'select2', '120万元—200万元', 6),
(1527, 57, 'select2', '200万元以上', 7),
(1529, 57, 'select3', '4室及以上', 2),
(1530, 57, 'select3', '3室2厅2卫', 3),
(1531, 57, 'select3', '3室2厅1卫', 4),
(1532, 57, 'select3', '3室1厅1卫', 5),
(1533, 57, 'select3', '2室2厅2卫', 6),
(1534, 57, 'select3', '1室1厅1卫', 7),
(1535, 57, 'select3', '2室1厅1卫', 8),
(1536, 57, 'select3', '2室2厅1卫1', 9),
(1537, 57, 'select3', '室0厅1卫', 10),
(1538, 57, 'select3', '其它', 11),
(1540, 58, 'select1', '初中', 2),
(1541, 58, 'select1', '高中', 3),
(1542, 58, 'select1', '小学', 4),
(1543, 58, 'select1', '小升初', 5),
(1544, 58, 'select1', '初升高', 6),
(1545, 58, 'select1', '其他', 7),
(1547, 58, 'select2', '30元/小时以下', 2),
(1548, 58, 'select2', '30元/小时—50元/小时', 3),
(1549, 58, 'select2', '50元/小时—100元/小时', 4),
(1550, 58, 'select2', '100元/小时—200元/小时', 5),
(1551, 58, 'select2', '200元/小时以上', 6),
(1553, 59, 'select1', '财会/金融', 2),
(1554, 59, 'select1', '建筑', 3),
(1555, 59, 'select1', '公务员', 4),
(1556, 59, 'select1', '美容美发', 5),
(1557, 59, 'select1', '经营/管理', 6),
(1558, 59, 'select1', '技工', 7),
(1559, 59, 'select1', '教师', 8),
(1560, 59, 'select1', '心理/医疗/保健', 9),
(1561, 59, 'select1', '厨师', 10),
(1562, 59, 'select1', '外贸/采购/物流', 11),
(1563, 59, 'select1', '司法考试', 12),
(1564, 59, 'select1', '网络技术', 13),
(1565, 59, 'select1', '面点', 14),
(1566, 59, 'select1', '其他', 15),
(1568, 59, 'select2', '200元以下', 2),
(1569, 59, 'select2', '200元—500元', 3),
(1570, 59, 'select2', '500元—1000元', 4),
(1571, 59, 'select2', '1000元—3000元', 5),
(1572, 59, 'select2', '3000元—7000元', 6),
(1573, 59, 'select2', '7000元以上', 7),
(1575, 60, 'select1', '自考', 2),
(1576, 60, 'select1', '专科/本科', 3),
(1577, 60, 'select1', '网络/远程', 4),
(1578, 60, 'select1', '成人高考', 5),
(1579, 60, 'select1', '在职研究生', 6),
(1580, 60, 'select1', '出国留学', 7),
(1581, 60, 'select1', '考研', 8),
(1582, 60, 'select1', '其他', 9),
(1584, 60, 'select2', '500元以下', 2),
(1585, 60, 'select2', '500元—2000元', 3),
(1586, 60, 'select2', '2000元—5000元', 4),
(1587, 60, 'select2', '5000元—10000元', 5),
(1588, 60, 'select2', '10000元以上', 6),
(1591, 61, 'select1', '办公自动化', 2),
(1592, 61, 'select1', '网络营销', 3),
(1593, 61, 'select1', '认证培训', 4),
(1594, 61, 'select1', '网络工程/管理', 5),
(1595, 61, 'select1', '硬件技术/维修', 6),
(1596, 61, 'select1', '影视动画', 7),
(1597, 61, 'select1', '软件开发', 8),
(1598, 61, 'select1', '数据库培训', 9),
(1599, 61, 'select1', '计算机等级考试', 10),
(1600, 61, 'select1', '计算机软考', 11),
(1601, 61, 'select1', 'app开发', 12),
(1602, 61, 'select1', '游戏开发', 13),
(1603, 61, 'select1', '其他', 14),
(1604, 61, 'select2', '500元以下', 2),
(1605, 61, 'select2', '500元—1000元', 3),
(1606, 61, 'select2', '1000元—3000元', 4),
(1607, 61, 'select2', '3000元—7000元', 5),
(1608, 61, 'select2', '7000元以上', 6),
(1611, 62, 'select1', '书法', 2),
(1612, 62, 'select1', '美术', 3),
(1613, 62, 'select1', '舞蹈', 4),
(1614, 62, 'select1', '乐器', 5),
(1615, 62, 'select1', '声乐', 6),
(1616, 62, 'select1', '表演/礼仪', 7),
(1617, 62, 'select1', '其他', 8),
(1618, 62, 'select2', '500元以下', 2),
(1619, 62, 'select2', '500—1000', 3),
(1620, 62, 'select2', '1000—2000', 4),
(1621, 62, 'select2', '2000—4000', 5),
(1622, 62, 'select2', '4000—7000', 6),
(1623, 62, 'select2', '7000以上', 7),
(1626, 63, 'select1', '韩语', 2),
(1627, 63, 'select1', '英语', 3),
(1628, 63, 'select1', '日语', 4),
(1629, 63, 'select1', '俄语', 5),
(1630, 63, 'select1', '考试类英语', 6),
(1631, 63, 'select1', '西班牙语', 7),
(1632, 63, 'select1', '法语', 8),
(1633, 63, 'select1', '德语', 9),
(1634, 63, 'select1', '其他语种', 10),
(1635, 63, 'select2', '500元以下', 2),
(1636, 63, 'select2', '500元—1000元', 3),
(1637, 63, 'select2', '1000元—2000元', 4),
(1638, 63, 'select2', '2000元—3000元', 5),
(1639, 63, 'select2', '3000元以上', 6),
(1642, 64, 'select1', '室内设计', 2),
(1643, 64, 'select1', '平面设计', 3),
(1644, 64, 'select1', '模具设计', 4),
(1645, 64, 'select1', '网页设计', 5),
(1646, 64, 'select1', '广告设计', 6),
(1647, 64, 'select1', '建筑设计', 7),
(1648, 64, 'select1', '景观/园林设计', 8),
(1649, 64, 'select1', '家具设计', 9),
(1650, 64, 'select1', '形象设计', 10),
(1651, 64, 'select1', '动漫设计', 11),
(1652, 64, 'select1', '包装设计', 12),
(1653, 64, 'select1', '服装设计', 13),
(1654, 64, 'select1', '其他', 14),
(1655, 64, 'select2', '500元以下', 2),
(1656, 64, 'select2', '500元—1000元', 3),
(1657, 64, 'select2', '1000元—3000元', 4),
(1658, 64, 'select2', '3000元—5000元', 5),
(1659, 64, 'select2', '5000元—8000元', 6),
(1660, 64, 'select2', '8000元以上', 7),
(1662, 65, 'select1', '学前教育', 2),
(1663, 65, 'select1', '亲子教育', 3),
(1664, 65, 'select1', '胎教', 4),
(1665, 65, 'select1', '母婴护理', 5),
(1666, 65, 'select1', '其他', 6),
(1668, 65, 'select2', '500元以下', 2),
(1669, 65, 'select2', '500元—1000元', 3),
(1670, 65, 'select2', '1000元—3000元', 4),
(1671, 65, 'select2', '3000元—5000元', 5),
(1672, 65, 'select2', '5000元以上', 6),
(1674, 66, 'select1', '跆拳道', 2),
(1675, 66, 'select1', '球类', 3),
(1676, 66, 'select1', '游泳', 4),
(1677, 66, 'select1', '健身', 5),
(1678, 66, 'select1', '武术', 6),
(1679, 66, 'select1', '瑜伽', 7),
(1680, 66, 'select1', '棋类', 8),
(1681, 66, 'select1', '其他', 9),
(1683, 66, 'select2', '500元以下', 2),
(1684, 66, 'select2', '500元—1000元', 3),
(1685, 66, 'select2', '1000元—3000元', 4),
(1686, 66, 'select2', '3000元以上', 5),
(1688, 67, 'select1', '普工', 2),
(1689, 67, 'select1', '安装/维修工', 3),
(1690, 67, 'select1', '焊工', 4),
(1691, 67, 'select1', '电工', 5),
(1692, 67, 'select1', '装卸/搬运工', 6),
(1693, 67, 'select1', '建筑/装修工', 7),
(1694, 67, 'select1', '缝纫/制衣工', 8),
(1695, 67, 'select1', '车工/铣工/钳工', 9),
(1696, 67, 'select1', '模具工', 10),
(1697, 67, 'select1', '油漆工', 11),
(1698, 67, 'select1', '木工', 12),
(1699, 67, 'select1', '生产主管/组长', 13),
(1700, 67, 'select1', '钳工', 14),
(1701, 67, 'select1', '车间主任', 15),
(1702, 67, 'select1', '厂长/副厂长', 16),
(1703, 67, 'select1', '其他', 17),
(1706, 67, 'select2', '2000元—3000元', 3),
(1707, 67, 'select2', '3000元—5000元', 4),
(1708, 67, 'select2', '5000元—8000元', 5),
(1709, 67, 'select2', '8000元—12000元', 6),
(1710, 67, 'select2', '12000元以上', 7),
(1712, 68, 'select1', '销售专员', 2),
(1713, 68, 'select1', '电话销售', 3),
(1714, 68, 'select1', '销售经理/主管', 4),
(1715, 68, 'select1', '保险/金融顾问', 5),
(1716, 68, 'select1', '跟单员/助理', 6),
(1717, 68, 'select1', '网络销售', 7),
(1718, 68, 'select1', '房产经纪人', 8),
(1719, 68, 'select1', '保险经纪人', 9),
(1720, 68, 'select1', '证券/期货/外汇经纪人', 10),
(1721, 68, 'select1', '信用卡/银行卡业务', 11),
(1722, 68, 'select1', '股票/期货操盘手', 12),
(1723, 68, 'select1', '银行会计/柜员', 13),
(1724, 68, 'select1', '证券经理/总监', 14),
(1725, 68, 'select1', '银行经理/主任', 15),
(1726, 68, 'select1', '其他', 16),
(1728, 68, 'select2', '2000元以下', 2),
(1729, 68, 'select2', '2000元—3000元', 3),
(1730, 68, 'select2', '3000元—5000元', 4),
(1731, 68, 'select2', '5000元—8000元', 5),
(1732, 68, 'select2', '8000元—12000元', 6),
(1733, 68, 'select2', '12000元以上', 7),
(1735, 69, 'select1', '足疗师', 2),
(1736, 69, 'select1', '按摩师', 3),
(1737, 69, 'select1', '保健师', 4),
(1738, 69, 'select1', '其他', 5),
(1740, 69, 'select2', '2000元以下', 2),
(1741, 69, 'select2', '2000元—3000元', 3),
(1742, 69, 'select2', '3000元—5000元', 4),
(1743, 69, 'select2', '5000元—8000元', 5),
(1744, 69, 'select2', '8000元—12000元', 6),
(1745, 69, 'select2', '12000元以上', 7),
(1747, 70, 'select1', '室内设计', 2),
(1748, 70, 'select1', '平面设计', 3),
(1749, 70, 'select1', '广告设计', 4),
(1750, 70, 'select1', 'CAD制图', 5),
(1751, 70, 'select1', '网页设计', 6),
(1752, 70, 'select1', '店面/陈列设计', 7),
(1753, 70, 'select1', '摄影师', 8),
(1754, 70, 'select1', '包装设计', 9),
(1755, 70, 'select1', '服装设计', 10),
(1756, 70, 'select1', '其它', 11),
(1758, 70, 'select2', '2000元以下', 2),
(1759, 70, 'select2', '2000元—3000元', 3),
(1760, 70, 'select2', '3000元—5000元', 4),
(1761, 70, 'select2', '5000元—8000元', 5),
(1762, 70, 'select2', '8000元—12000元', 6),
(1763, 70, 'select2', '12000元以上', 7),
(1765, 71, 'select1', '文员', 2),
(1766, 71, 'select1', '行政专员/助理', 3),
(1767, 71, 'select1', '前台/总机/接待', 4),
(1768, 71, 'select1', '人事专员/助理', 5),
(1769, 71, 'select1', '秘书/助理', 6),
(1770, 71, 'select1', '编辑/文案', 7),
(1771, 71, 'select1', '后勤', 8),
(1772, 71, 'select1', '招聘经理/主管', 9),
(1773, 71, 'select1', '招聘专员/助理', 10),
(1774, 71, 'select1', '行政经理/主管', 11),
(1775, 71, 'select1', '人事经理/主管', 12),
(1776, 71, 'select1', '记者/采编', 13),
(1777, 71, 'select1', '猎头', 14),
(1778, 71, 'select1', '行政总监', 15),
(1779, 71, 'select1', '总编/副总编/主编', 16),
(1780, 71, 'select1', '其他', 17),
(1782, 71, 'select2', '2000元以下', 2),
(1783, 71, 'select2', '2000元—3000元', 3),
(1784, 71, 'select2', '3000元—5000元', 4),
(1785, 71, 'select2', '5000元—8000元', 5),
(1786, 71, 'select2', '8000元—12000元', 6),
(1787, 71, 'select2', '12000元以上', 7),
(1789, 72, 'select1', '营业员', 2),
(1790, 72, 'select1', '导购员', 3),
(1791, 72, 'select1', '促销员', 4),
(1792, 72, 'select1', '店长', 5),
(1793, 72, 'select1', '理货员', 6),
(1794, 72, 'select1', '其他', 7),
(1797, 72, 'select2', '2000元以下', 2),
(1798, 72, 'select2', '2000元—3000元', 3),
(1799, 72, 'select2', '3000元—5000元', 4),
(1800, 72, 'select2', '5000元—8000元', 5),
(1801, 72, 'select2', '8000元—12000元', 6),
(1802, 72, 'select2', '12000元以上', 7),
(1803, 72, 'select3', '做六休一', 2),
(1804, 72, 'select3', '做二休一', 3),
(1805, 72, 'select3', '做五休二', 4),
(1806, 72, 'select3', '做一休一', 5),
(1807, 72, 'select3', '其他', 6),
(1809, 73, 'select1', '餐厅服务员', 2),
(1810, 73, 'select1', '收银员', 3),
(1811, 73, 'select1', '大堂服务员', 4),
(1812, 73, 'select1', '客房服务员', 5),
(1813, 73, 'select1', '大堂经理/领班', 6),
(1814, 73, 'select1', '迎宾/接待', 7),
(1815, 73, 'select1', '其他', 8),
(1817, 73, 'select2', '2000元以下', 2),
(1818, 73, 'select2', '2000元—3000元', 3),
(1819, 73, 'select2', '3000元—5000元', 4),
(1820, 73, 'select2', '5000元—8000元', 5),
(1821, 73, 'select2', '8000元—12000元', 6),
(1822, 73, 'select2', '12000元以上', 7),
(1824, 74, 'select1', '厨师', 2),
(1825, 74, 'select1', '切配/厨工', 3),
(1826, 74, 'select1', '面点师', 4),
(1827, 74, 'select1', '洗碗工', 5),
(1828, 74, 'select1', '其他', 6),
(1830, 74, 'select2', '2000元以下', 2),
(1831, 74, 'select2', '2000元—3000元', 3),
(1832, 74, 'select2', '3000元—5000元', 4),
(1833, 74, 'select2', '5000元—8000元', 5),
(1834, 74, 'select2', '8000元—12000元', 6),
(1835, 74, 'select2', '12000元以上', 7),
(1837, 75, 'select1', '送货员', 2),
(1838, 75, 'select1', '快递员', 3),
(1839, 75, 'select1', '仓库管理员', 4),
(1840, 75, 'select1', '跟单员', 5),
(1841, 75, 'select1', '送餐员', 6),
(1842, 75, 'select1', '调度员', 7),
(1843, 75, 'select1', '其它', 8),
(1845, 75, 'select2', '2000元以下', 2),
(1846, 75, 'select2', '2000元—3000元', 3),
(1847, 75, 'select2', '3000元—5000元', 4),
(1848, 75, 'select2', '5000元—8000元', 5),
(1849, 75, 'select2', '8000元—12000元', 6),
(1850, 75, 'select2', '12000元以上', 7),
(1852, 76, 'select1', '900元以下', 2),
(1853, 76, 'select1', '900元—2000元', 3),
(1854, 76, 'select1', '2000元—3000元', 4),
(1855, 76, 'select1', '3000元以上', 5),
(1857, 77, 'select1', '保洁', 2),
(1858, 77, 'select1', '保姆', 3),
(1859, 77, 'select1', '钟点工', 5),
(1860, 77, 'select1', '陪护', 6),
(1861, 77, 'select1', '育婴师', 6),
(1862, 77, 'select1', '月嫂', 7),
(1863, 77, 'select1', '其它', 8),
(1865, 77, 'select2', '900元以下', 2),
(1866, 77, 'select2', '900元—2000元', 3),
(1867, 77, 'select2', '2000元—3000元', 4),
(1868, 77, 'select2', '3000元以上', 5),
(1870, 78, 'select1', '货车', 2),
(1871, 78, 'select1', '出租车', 3),
(1872, 78, 'select1', '轿车', 4),
(1873, 78, 'select1', '面包车', 5),
(1874, 78, 'select1', '客车', 6),
(1875, 78, 'select1', '挖掘机', 7),
(1876, 78, 'select1', '叉车/铲车/吊车', 8),
(1877, 78, 'select1', '驾校教练/陪驾', 9),
(1878, 78, 'select1', '其他', 10),
(1880, 78, 'select2', '2000元以下', 2),
(1881, 78, 'select2', '2000元—3000元', 3),
(1882, 78, 'select2', '3000元—5000元', 4),
(1883, 78, 'select2', '5000元—8000元', 5),
(1884, 78, 'select2', '8000元—12000元', 6),
(1885, 78, 'select2', '12000元以上', 7),
(1887, 79, 'select1', '中小学教师', 2),
(1888, 79, 'select1', '家教', 3),
(1889, 79, 'select1', '早教', 4),
(1890, 79, 'select1', '文艺/体育教师', 5),
(1891, 79, 'select1', '企业培训', 6),
(1892, 79, 'select1', '运动/健身教练', 7),
(1893, 79, 'select1', '校长', 8),
(1894, 79, 'select1', '瑜伽/舞蹈老师', 9),
(1895, 79, 'select1', '其他', 10),
(1897, 79, 'select2', '2000元以下', 2),
(1898, 79, 'select2', '2000元—3000元', 3),
(1899, 79, 'select2', '3000元—5000元', 4),
(1900, 79, 'select2', '5000元—8000元', 5),
(1901, 79, 'select2', '8000元—12000元', 6),
(1902, 79, 'select2', '12000元以上', 7),
(1904, 80, 'select1', '会计', 2),
(1905, 80, 'select1', '财务', 3),
(1906, 80, 'select1', '出纳', 4),
(1907, 80, 'select1', '统计员', 5),
(1908, 80, 'select1', '审计', 6),
(1909, 80, 'select1', '税务', 7),
(1910, 80, 'select1', '其他', 8),
(1912, 80, 'select2', '2000元以下', 2),
(1913, 80, 'select2', '2000元—3000元', 3),
(1914, 80, 'select2', '3000元—5000元', 4),
(1915, 80, 'select2', '5000元—8000元', 5),
(1916, 80, 'select2', '8000元—12000元', 6),
(1917, 80, 'select2', '12000元以上', 7),
(1919, 81, 'select1', '淘宝美工', 2),
(1920, 81, 'select1', '淘宝客服', 3),
(1921, 81, 'select1', '网店店长', 4),
(1922, 81, 'select1', '店铺运营/推广', 5),
(1923, 81, 'select1', '其它', 6),
(1925, 81, 'select2', '2000元以下', 2),
(1926, 81, 'select2', '2000元—3000元', 3),
(1927, 81, 'select2', '3000元—5000元', 4),
(1928, 81, 'select2', '5000元—8000元', 5),
(1929, 81, 'select2', '8000元—12000元', 6),
(1930, 81, 'select2', '12000元以上', 7),
(1932, 81, 'select3', '做六休一', 2),
(1933, 81, 'select3', '做二休一', 3),
(1934, 81, 'select3', '做五休二', 4),
(1935, 81, 'select3', '做一休一', 5),
(1936, 81, 'select3', '其他', 6),
(1938, 82, 'select1', '客服专员/助理', 2),
(1939, 82, 'select1', '客服经理/主管', 3),
(1940, 82, 'select1', '其他', 4),
(1942, 82, 'select2', '2000元以下', 2),
(1943, 82, 'select2', '2000元—3000元', 3),
(1944, 82, 'select2', '3000元—5000元', 4),
(1945, 82, 'select2', '5000元以上', 5),
(1947, 83, 'select1', '美发师', 2),
(1948, 83, 'select1', '化妆师', 3),
(1949, 83, 'select1', '美容师', 4),
(1950, 83, 'select1', '美发助理/学徒', 5),
(1951, 83, 'select1', '美容助理/学徒', 6),
(1952, 83, 'select1', '美甲师', 7),
(1953, 83, 'select1', '洗头工', 8),
(1954, 83, 'select1', '其它', 9),
(1956, 83, 'select2', '2000元以下', 2),
(1957, 83, 'select2', '2000元—3000元', 3),
(1958, 83, 'select2', '3000元—5000元', 4),
(1959, 83, 'select2', '5000元—8000元', 5),
(1960, 83, 'select2', '8000元—12000元', 6),
(1961, 83, 'select2', '12000元以上', 7),
(1963, 84, 'select1', '技术支持/维护', 2),
(1964, 84, 'select1', '游戏设计/开发', 3),
(1965, 84, 'select1', '网络工程师', 4),
(1966, 84, 'select1', '网站运营', 5),
(1967, 84, 'select1', '网站编辑', 6),
(1968, 84, 'select1', '技术专员/助理', 7),
(1969, 84, 'select1', '程序员', 8),
(1970, 84, 'select1', '网络管理员', 9),
(1971, 84, 'select1', '硬件工程师', 10),
(1972, 84, 'select1', '技术总监/经理', 11),
(1973, 84, 'select1', '软件工程师', 12),
(1974, 84, 'select1', '产品经理/专员', 13),
(1975, 84, 'select1', '测试员', 14),
(1976, 84, 'select1', '通信工程师', 15),
(1977, 84, 'select1', '架构师', 16),
(1978, 84, 'select1', '数据库管理', 17),
(1979, 84, 'select1', '其他', 18),
(1981, 84, 'select2', '2000元以下', 2),
(1982, 84, 'select2', '2000元—3000元', 3),
(1983, 84, 'select2', '3000元—5000元', 4),
(1984, 84, 'select2', '5000元—8000元', 5),
(1985, 84, 'select2', '8000元—12000元', 6),
(1986, 84, 'select2', '12000元以上', 7),
(1988, 84, 'select3', '无经验', 2),
(1989, 84, 'select3', '一年经验', 3),
(1990, 84, 'select3', '二年经验', 4),
(1991, 84, 'select3', '三年经验', 5),
(1992, 84, 'select3', '三年以上经验', 6),
(1994, 85, 'select1', '市场专员/助理', 2),
(1995, 85, 'select1', '营销经理', 3),
(1996, 85, 'select1', '市场经理/主管', 4),
(1997, 85, 'select1', '客户经理/主管', 5),
(1998, 85, 'select1', '公关专员/助理', 6),
(1999, 85, 'select1', '公关经理/主管', 7),
(2000, 85, 'select1', '大客户经理', 8),
(2001, 85, 'select1', '其他', 9),
(2003, 85, 'select2', '2000元以下', 2),
(2004, 85, 'select2', '2000元—3000元', 3),
(2005, 85, 'select2', '3000元—5000元', 4),
(2006, 85, 'select2', '5000元—8000元', 5),
(2007, 85, 'select2', '8000元—12000元', 6),
(2008, 85, 'select2', '12000元以上', 7),
(2010, 87, 'select1', '德语', 2),
(2011, 87, 'select1', '英语', 3),
(2012, 87, 'select1', '韩语', 4),
(2013, 87, 'select1', '日语', 5),
(2014, 87, 'select1', '俄语', 6),
(2015, 87, 'select1', '西班牙语', 7),
(2016, 87, 'select1', '法语', 8),
(2017, 87, 'select1', '其它', 9),
(2019, 87, 'select2', '2000元以下', 2),
(2020, 87, 'select2', '2000元—3000元', 3),
(2021, 87, 'select2', '3000元—5000元', 4),
(2022, 87, 'select2', '5000元—8000元', 5),
(2023, 87, 'select2', '8000元—12000元', 6),
(2024, 87, 'select2', '12000元以上', 7),
(2026, 89, 'select1', '2000元以下', 2),
(2027, 89, 'select1', '2000元—3000元', 3),
(2028, 89, 'select1', '3000元—5000元', 4),
(2029, 89, 'select1', '5000元—8000元', 5),
(2030, 89, 'select1', '8000元—12000元', 6),
(2031, 89, 'select1', '12000元以上', 7),
(2033, 90, 'select1', '产品代理', 2),
(2034, 90, 'select1', '服装箱包', 3),
(2035, 90, 'select1', '餐饮加盟', 4),
(2036, 90, 'select1', '教育培训', 5),
(2037, 90, 'select1', '建材家居', 6),
(2038, 90, 'select1', '干洗加盟', 7),
(2039, 90, 'select1', '美容保健', 8),
(2040, 90, 'select1', '快递物流', 9),
(2041, 90, 'select1', '礼品饰品', 10),
(2042, 90, 'select1', '农业养殖', 11),
(2043, 90, 'select1', '母婴用品', 12),
(2044, 90, 'select1', '其他', 13),
(2046, 91, 'select1', '无抵押贷款', 2),
(2047, 91, 'select1', '企业/个体户贷款', 3),
(2048, 91, 'select1', '汽车抵押贷款', 4),
(2049, 91, 'select1', '房产抵押贷款', 5),
(2050, 91, 'select1', '买房贷款', 6),
(2051, 91, 'select1', '买车贷款', 7),
(2052, 91, 'select1', '其它', 8),
(2054, 92, 'select1', '空调维修', 2),
(2055, 92, 'select1', '热水器维修', 3),
(2056, 92, 'select1', '空调移机', 4),
(2057, 92, 'select1', '洗衣机维修', 5),
(2058, 92, 'select1', '冰箱维修', 6),
(2059, 92, 'select1', '电视机维修', 7),
(2060, 92, 'select1', '饮水机维修', 8),
(2061, 92, 'select1', '电饭煲维修', 9),
(2062, 92, 'select1', '抽油烟机维修', 10),
(2063, 92, 'select1', '电磁炉维修', 11),
(2064, 92, 'select1', '其他', 12),
(2066, 93, 'select1', '吊顶', 2),
(2067, 93, 'select1', '门窗', 3),
(2068, 93, 'select1', '涂料', 4),
(2069, 93, 'select1', '钢材', 5),
(2070, 93, 'select1', '五金', 6),
(2071, 93, 'select1', '墙纸', 7),
(2072, 93, 'select1', '地板', 8),
(2073, 93, 'select1', '油漆', 9),
(2074, 93, 'select1', '卫浴洁具', 10),
(2075, 93, 'select1', '玻璃', 11),
(2076, 93, 'select1', '瓷砖', 12),
(2077, 93, 'select1', '窗帘', 13),
(2078, 93, 'select1', '灯具', 14),
(2079, 93, 'select1', '水泥', 15),
(2080, 93, 'select1', '橱柜', 16),
(2081, 93, 'select1', '厨卫电器', 17),
(2082, 93, 'select1', '暖气地暖', 18),
(2083, 93, 'select1', '其它', 19),
(2085, 94, 'select1', '公司注册', 2),
(2086, 94, 'select1', '工商年检', 3),
(2087, 94, 'select1', '商标注册', 4),
(2088, 94, 'select1', '公司转让', 5),
(2089, 94, 'select1', '专利注册', 6),
(2090, 94, 'select1', '海外公司注册', 7),
(2091, 94, 'select1', '专项审批', 8),
(2092, 94, 'select1', '香港公司注册', 9),
(2093, 94, 'select1', '公司注销', 10),
(2094, 94, 'select1', '验资开户', 11),
(2095, 94, 'select1', '资质认证', 12),
(2096, 94, 'select1', '外资公司注册', 13),
(2097, 94, 'select1', '其它', 14),
(2099, 95, 'select1', '新房装修', 2),
(2100, 95, 'select1', '店铺装修', 3),
(2101, 95, 'select1', '办公室/写字楼装修', 4),
(2102, 95, 'select1', '二手房装修', 5),
(2103, 95, 'select1', '厂房装修', 6),
(2104, 95, 'select1', '拆旧', 7),
(2105, 95, 'select1', '学校/幼儿园装修', 8),
(2106, 95, 'select1', '商场/超市装修', 9),
(2107, 95, 'select1', '酒店装修', 10),
(2108, 95, 'select1', '其他', 11),
(2110, 96, 'select1', '理财产品', 2),
(2111, 96, 'select1', '期货', 3),
(2112, 96, 'select1', '股票', 4),
(2113, 96, 'select1', '黄金', 5),
(2114, 96, 'select1', '证券', 6),
(2115, 96, 'select1', '信用卡', 7),
(2116, 96, 'select1', '基金', 8),
(2117, 96, 'select1', '外汇', 9),
(2118, 96, 'select1', '保险', 10),
(2119, 96, 'select1', '其它', 11),
(2121, 97, 'select1', '会计', 2),
(2122, 97, 'select1', '审计', 3),
(2124, 98, 'select1', '电脑维修', 2),
(2125, 98, 'select1', '笔记本维修', 3),
(2126, 98, 'select1', '网络布线', 4),
(2127, 98, 'select1', 'IT外包', 5),
(2128, 98, 'select1', '打印机维修', 6),
(2129, 98, 'select1', '数据恢复', 7),
(2130, 98, 'select1', '传真机维修', 8),
(2131, 98, 'select1', '安防监控', 9),
(2132, 98, 'select1', 'ipad/平板电脑维修', 10),
(2133, 98, 'select1', '机房建设', 11),
(2134, 98, 'select1', '其它', 12),
(2136, 99, 'select1', '货运', 2),
(2137, 99, 'select1', '快递', 3),
(2138, 99, 'select1', '仓储', 4),
(2139, 99, 'select1', '行李托运', 5),
(2140, 99, 'select1', '进出口报关', 6),
(2141, 99, 'select1', '其它', 7),
(2143, 100, 'select1', '农产品加工/代理', 2),
(2144, 100, 'select1', '农作物', 3),
(2145, 100, 'select1', '畜禽养殖', 4),
(2146, 100, 'select1', '水产', 5),
(2147, 100, 'select1', '园林花卉', 6),
(2148, 100, 'select1', '动植物种苗', 7),
(2149, 100, 'select1', '农机具/设备', 8),
(2150, 100, 'select1', '饲料/兽药', 9),
(2151, 100, 'select1', '农药/肥料', 10),
(2152, 100, 'select1', '其它', 11),
(2154, 101, 'select1', '活动策划', 12),
(2155, 101, 'select1', '广告策划', 11),
(2156, 101, 'select1', '平面设计', 10),
(2157, 101, 'select1', '网页设计', 9),
(2158, 101, 'select1', 'Logo设计/VI设计', 8),
(2159, 101, 'select1', '工业设计', 7),
(2160, 101, 'select1', '景观设计', 6),
(2161, 101, 'select1', '影视/动画制作', 5),
(2162, 101, 'select1', '室内设计', 4),
(2163, 101, 'select1', '名片设计', 3),
(2164, 101, 'select1', '服装设计', 2),
(2165, 101, 'select1', '其它', 13),
(2167, 102, 'select1', '管道疏通', 2),
(2168, 102, 'select1', '下水道疏通', 3),
(2169, 102, 'select1', '马桶疏通', 4),
(2170, 102, 'select1', '化粪池疏通', 5),
(2171, 102, 'select1', '管道清淤', 6),
(2172, 102, 'select1', '打捞', 7),
(2174, 103, 'select1', '带司机租车', 2),
(2175, 103, 'select1', '商务租车', 3),
(2176, 103, 'select1', '旅游租车', 4),
(2177, 103, 'select1', '婚车', 5),
(2178, 103, 'select1', '豪华车', 6),
(2179, 103, 'select1', '货车', 7),
(2180, 103, 'select1', '其他', 8),
(2182, 103, 'select2', '100元以下', 2),
(2183, 103, 'select2', '200元—300元', 3),
(2184, 103, 'select2', '300元—500元', 4),
(2185, 103, 'select2', '500元—800元', 5),
(2186, 103, 'select2', '800元—1200元', 6),
(2187, 103, 'select2', '1200元以上', 7),
(2189, 104, 'select1', '周边游', 2),
(2190, 104, 'select1', '农家乐', 3),
(2191, 104, 'select1', '旅行社', 4),
(2192, 104, 'select1', '导游', 5),
(2193, 104, 'select1', '港澳台游', 6),
(2194, 104, 'select1', '温泉', 7),
(2195, 104, 'select1', '出国游', 8),
(2196, 104, 'select1', '其它', 9),
(2198, 105, 'select1', '婚纱摄影', 2),
(2199, 105, 'select1', '艺术照', 3),
(2200, 105, 'select1', '写真', 4),
(2201, 105, 'select1', '摄像', 5),
(2202, 105, 'select1', '商业摄影', 6),
(2203, 105, 'select1', '儿童摄影', 7),
(2204, 105, 'select1', '其他', 8),
(2206, 106, 'select1', '日常保洁', 2),
(2207, 106, 'select1', '擦玻璃', 3),
(2208, 106, 'select1', '开荒保洁', 4),
(2209, 106, 'select1', '抽油烟机清洗', 5),
(2210, 106, 'select1', '地毯清洗', 6),
(2211, 106, 'select1', '外墙清洗', 7),
(2212, 106, 'select1', '干洗', 8),
(2213, 106, 'select1', '石材翻新/养护', 9),
(2214, 106, 'select1', '地板打蜡', 10),
(2215, 106, 'select1', '沙发清洗', 11),
(2216, 106, 'select1', '空调清洗', 12),
(2217, 106, 'select1', '灯具清洗', 13),
(2218, 106, 'select1', '空气净化', 14),
(2219, 106, 'select1', '瓷砖美缝', 15),
(2220, 106, 'select1', '其他', 16),
(2222, 107, 'select1', '100元以下', 2),
(2223, 107, 'select1', '100元—200元', 3),
(2224, 107, 'select1', '200元—300元', 4),
(2225, 107, 'select1', '300元—500元', 5),
(2226, 107, 'select1', '500元以上', 6),
(2228, 109, 'select1', 'C1(手动档汽车)', 2),
(2229, 109, 'select1', 'C2(自动挡汽车)', 3),
(2230, 109, 'select1', 'B1(中型客车)', 4),
(2231, 109, 'select1', 'B2(大型货车)', 5),
(2232, 109, 'select1', 'E(二轮摩托车)', 6),
(2233, 109, 'select1', 'F(轻便摩托车)', 7),
(2234, 109, 'select1', 'D(三轮摩托车)', 8),
(2235, 109, 'select1', 'A2(牵引车)', 9),
(2236, 109, 'select1', 'C3(载货汽车)', 10),
(2237, 109, 'select1', 'C4(三轮汽车)', 11),
(2238, 109, 'select1', 'C5(残疾人专用)', 12),
(2239, 109, 'select1', 'A(大型客车)', 13),
(2240, 109, 'select1', 'A3(城市公交车)', 14),
(2242, 109, 'select2', '2000元以下', 2),
(2243, 109, 'select2', '2000元—5000元', 3),
(2244, 109, 'select2', '5000元—8000元', 4),
(2245, 109, 'select2', '8000元以上', 5),
(2247, 111, 'select1', '健身', 2),
(2248, 111, 'select1', '瑜伽', 3),
(2249, 111, 'select1', '按摩', 4),
(2250, 111, 'select1', '足疗', 5),
(2251, 111, 'select1', '会所', 6),
(2252, 111, 'select1', 'KTV', 7),
(2253, 111, 'select1', '洗浴', 8),
(2254, 111, 'select1', '酒吧', 9),
(2255, 111, 'select1', '桌游', 10),
(2256, 111, 'select1', '演唱会', 11),
(2257, 111, 'select1', '演出票务', 12),
(2258, 111, 'select1', '电影票', 13),
(2259, 111, 'select1', '其他', 14),
(2261, 112, 'select1', '印刷', 2),
(2262, 112, 'select1', '喷绘', 3),
(2263, 112, 'select1', '名片', 4),
(2264, 112, 'select1', '制卡', 5),
(2265, 112, 'select1', '灯箱', 6),
(2266, 112, 'select1', '易拉宝', 7),
(2267, 112, 'select1', '其他', 8),
(2269, 113, 'select1', '签证', 2),
(2270, 113, 'select1', '机票', 3),
(2271, 113, 'select1', '移民', 4),
(2273, 114, 'select1', '礼品定制', 2),
(2274, 114, 'select1', '商务礼品', 3),
(2275, 114, 'select1', '其它', 4),
(2277, 115, 'select1', '水电维修', 2),
(2278, 115, 'select1', '马桶维修', 3),
(2279, 115, 'select1', '防水补漏', 4),
(2280, 115, 'select1', '淋浴房维修', 5),
(2281, 115, 'select1', '家具维修', 6),
(2282, 115, 'select1', '门窗维修', 7),
(2283, 115, 'select1', '沙发维修', 8),
(2284, 115, 'select1', '其他', 9),
(2286, 116, 'select1', '美容', 10),
(2287, 116, 'select1', '减肥瘦身', 9),
(2288, 116, 'select1', '祛痘/祛斑', 8),
(2289, 116, 'select1', 'spa', 7),
(2290, 116, 'select1', '丰胸', 6),
(2291, 116, 'select1', '美发', 5),
(2292, 116, 'select1', '除皱', 4),
(2293, 116, 'select1', '脱毛', 3),
(2294, 116, 'select1', '美甲', 2),
(2297, 116, 'select2', '100元以下', 2),
(2298, 116, 'select2', '100元—200元', 3),
(2299, 116, 'select2', '200元—400元', 4),
(2300, 116, 'select2', '400元—800元', 5),
(2301, 116, 'select2', '800元—1200元', 6),
(2302, 116, 'select2', '1200元—1500元', 7),
(2303, 116, 'select2', '1500元以上', 8),
(2305, 117, 'select1', '家政公司', 2),
(2306, 117, 'select1', '保姆', 3),
(2307, 117, 'select1', '东家', 4),
(2308, 117, 'select1', '其它', 5),
(2310, 117, 'select2', '钟点工', 2),
(2311, 117, 'select2', '做饭', 3),
(2312, 117, 'select2', '保姆', 4),
(2313, 117, 'select2', '照顾孩子', 5),
(2314, 117, 'select2', '住家阿姨', 6),
(2315, 117, 'select2', '照顾老人', 7),
(2316, 117, 'select2', '育婴师/育儿嫂', 8),
(2317, 117, 'select2', '月嫂', 9),
(2318, 117, 'select2', '催乳师', 10),
(2319, 117, 'select2', '护工/陪护', 11),
(2320, 117, 'select2', '其它', 12),
(2322, 118, 'select1', '网站建设', 2),
(2323, 118, 'select1', '网站推广', 3),
(2324, 118, 'select1', '网站维护/外包', 4),
(2325, 118, 'select1', '域名注册', 5),
(2326, 118, 'select1', '服务器', 6),
(2327, 118, 'select1', '企业邮箱', 7),
(2328, 118, 'select1', '其它', 8),
(2330, 119, 'select1', '绿植/盆栽', 2),
(2331, 119, 'select1', '园艺用品', 3),
(2332, 119, 'select1', '鲜花', 4),
(2333, 119, 'select1', '其它', 5),
(2335, 120, 'select1', '新娘化妆', 2),
(2336, 120, 'select1', '婚车租赁', 3),
(2337, 120, 'select1', '婚庆公司', 4),
(2338, 120, 'select1', '婚礼跟拍', 5),
(2339, 120, 'select1', '婚纱礼服', 6),
(2340, 120, 'select1', '司仪', 7),
(2341, 120, 'select1', '婚礼用品', 8),
(2342, 120, 'select1', '婚宴', 9),
(2343, 120, 'select1', '喜糖', 10),
(2344, 120, 'select1', '婚戒首饰', 11),
(2345, 120, 'select1', '其他', 12),
(2347, 120, 'select2', '500元以下', 2),
(2348, 120, 'select2', '500元—1000元', 3),
(2349, 120, 'select2', '1000元—2000元', 4),
(2350, 120, 'select2', '2000元—4000元', 5),
(2351, 120, 'select2', '4000元以上', 6),
(2353, 121, 'select1', '庆典公司', 2),
(2354, 121, 'select1', '场地布置', 3),
(2355, 121, 'select1', '灯光音响', 4),
(2356, 121, 'select1', '礼仪模特', 5),
(2357, 121, 'select1', '乐队演出', 6),
(2358, 121, 'select1', '司仪', 7),
(2359, 121, 'select1', '化妆', 8),
(2360, 121, 'select1', '其它', 9),
(2362, 122, 'select1', '债务纠纷', 2),
(2363, 122, 'select1', '合同纠纷', 3),
(2364, 122, 'select1', '交通事故', 4),
(2365, 122, 'select1', '离婚', 5),
(2366, 122, 'select1', '刑事辩护', 6),
(2367, 122, 'select1', '知识产权', 7),
(2368, 122, 'select1', '房产纠纷', 8),
(2369, 122, 'select1', '法律援助', 9),
(2370, 122, 'select1', '劳动纠纷', 10),
(2371, 122, 'select1', '其它', 11),
(2373, 123, 'select1', '快餐', 2),
(2374, 123, 'select1', '送水', 3),
(2375, 123, 'select1', '食材配送', 4),
(2376, 123, 'select1', '宴会外卖', 5),
(2377, 123, 'select1', '承包食堂', 6),
(2378, 123, 'select1', '其它', 7),
(2380, 124, 'select1', '星级酒店', 2),
(2381, 124, 'select1', '经济型酒店', 3),
(2382, 124, 'select1', '宾馆', 4),
(2383, 124, 'select1', '青年旅舍', 5),
(2384, 124, 'select1', '中等', 6),
(2385, 124, 'select1', '度假村', 7),
(2386, 124, 'select1', '连锁酒店', 8),
(2387, 124, 'select1', '其它', 9),
(2389, 124, 'select2', '100元以下', 2),
(2390, 124, 'select2', '100元—200元', 3),
(2391, 124, 'select2', '200元—300元', 4),
(2392, 124, 'select2', '300元—500元', 5),
(2393, 124, 'select2', '500元—800元', 6),
(2394, 124, 'select2', '800元以上', 7),
(2396, 125, 'select1', '购物', 2),
(2397, 125, 'select1', '休闲娱乐', 3),
(2398, 125, 'select1', '论坛', 4),
(2399, 125, 'select1', '新闻', 5),
(2400, 125, 'select1', '交通地图', 6),
(2401, 125, 'select1', '游戏', 7),
(2402, 125, 'select1', 'KTV', 8),
(2403, 125, 'select1', '会所', 9),
(2404, 125, 'select1', '茶庄', 10),
(2405, 125, 'select1', '其他', 11),
(2407, 126, 'select1', '笔译', 2),
(2408, 126, 'select1', '口译', 3),
(2409, 126, 'select1', '速记', 4),
(2410, 126, 'select1', '同声传译', 5),
(2411, 126, 'select1', '其它', 6),
(2413, 127, 'select1', '面部整形', 2),
(2414, 127, 'select1', '眼部整形', 3),
(2415, 127, 'select1', '鼻部整形', 4),
(2416, 127, 'select1', '唇部整形', 5),
(2417, 127, 'select1', '牙齿美容', 6),
(2418, 127, 'select1', '皮肤美容', 7),
(2419, 127, 'select1', '胸部整形', 8),
(2420, 127, 'select1', '微整形', 9),
(2421, 127, 'select1', '吸脂溶脂减肥', 10),
(2422, 127, 'select1', '私密整形', 11),
(2423, 127, 'select1', '激光脱毛', 12),
(2424, 127, 'select1', '假体取出', 13),
(2425, 127, 'select1', '其他', 14),
(2427, 128, 'select1', '肾病科', 2),
(2428, 128, 'select1', '皮肤病科', 3),
(2429, 128, 'select1', '风湿科', 4),
(2430, 128, 'select1', '眼科', 5),
(2431, 128, 'select1', '骨科', 6),
(2432, 128, 'select1', '儿科', 7),
(2433, 128, 'select1', '泌尿科', 8),
(2434, 128, 'select1', '肝病科', 9),
(2435, 128, 'select1', '不孕不育', 10),
(2436, 128, 'select1', '妇科', 11),
(2437, 128, 'select1', '性交障碍', 12),
(2438, 128, 'select1', '性病科', 13),
(2439, 128, 'select1', '内分泌科', 14),
(2440, 128, 'select1', '肿瘤科', 15),
(2441, 128, 'select1', '男科', 16),
(2442, 128, 'select1', '其它', 17),
(2444, 130, 'select1', '摄影', 2),
(2445, 130, 'select1', '翻译', 3),
(2446, 130, 'select1', '装卸工', 4),
(2447, 130, 'select1', '地勤', 5),
(2448, 130, 'select1', '杂务', 6),
(2449, 130, 'select1', '其他', 7),
(2451, 130, 'select2', '100元以下', 2),
(2452, 130, 'select2', '100元—200元', 3),
(2453, 130, 'select2', '200元—300元', 4),
(2454, 130, 'select2', '300元—500元', 5),
(2455, 130, 'select2', '500元以上', 6),
(2457, 131, 'select1', '中学理科', 2),
(2458, 131, 'select1', '小学英语', 3),
(2459, 131, 'select1', '中学文科', 4),
(2460, 131, 'select1', '文艺体育', 5),
(2461, 131, 'select1', '奥数', 6),
(2462, 131, 'select1', '其他', 7),
(2464, 131, 'select2', '30元以下', 2),
(2465, 131, 'select2', '30元—50元', 3),
(2466, 131, 'select2', '50元—70元', 4),
(2467, 131, 'select2', '70元—100元', 5),
(2468, 131, 'select2', '100元—150元', 6),
(2469, 131, 'select2', '150元以上', 7),
(2471, 132, 'select1', '派发', 2),
(2472, 132, 'select1', '促销', 3),
(2473, 132, 'select1', '其它 ', 4),
(2475, 132, 'select2', '10元以下', 2),
(2476, 132, 'select2', '10元—20元', 3),
(2477, 132, 'select2', '20元—30元', 4),
(2478, 132, 'select2', '30元—70元', 5),
(2479, 132, 'select2', '70元以上', 6),
(2481, 133, 'select1', '礼仪', 2),
(2482, 133, 'select1', '模特', 3),
(2483, 133, 'select1', '其它', 4),
(2485, 133, 'select2', '20元以下', 2),
(2486, 133, 'select2', '20元—30元', 3),
(2487, 133, 'select2', '30元—60元', 4),
(2488, 133, 'select2', '60元—100元', 5),
(2489, 133, 'select2', '100元—150元', 6),
(2490, 133, 'select2', '150元以上', 7),
(2492, 134, 'select1', '10元以下', 2),
(2493, 134, 'select1', '10元—20元', 3),
(2494, 134, 'select1', '20元—40元', 4),
(2495, 134, 'select1', '40元—70元', 5),
(2496, 134, 'select1', '70元以上', 6),
(2498, 135, 'select1', '10元以下', 2),
(2499, 135, 'select1', '10元—20元', 3),
(2500, 135, 'select1', '20元—30元', 4),
(2501, 135, 'select1', '30元以上', 5),
(2503, 135, 'select2', '上午', 2),
(2504, 135, 'select2', '中午', 3),
(2505, 135, 'select2', '下午', 4),
(2506, 135, 'select2', '晚间', 5),
(2507, 135, 'select2', '晚9点以后', 6),
(2508, 135, 'select2', '其它', 7),
(2510, 136, 'select1', '设计', 2),
(2511, 136, 'select1', '网站', 3),
(2512, 136, 'select1', '其它', 4),
(2514, 136, 'select2', '50元以下', 2),
(2515, 136, 'select2', '50—100', 3),
(2516, 136, 'select2', '100—200', 4),
(2517, 136, 'select2', '200以上', 5),
(2519, 137, 'select1', '50元以下', 2),
(2520, 137, 'select1', '50元—100元', 3),
(2521, 137, 'select1', '100元—200元', 4),
(2522, 137, 'select1', '200元以上', 5),
(2524, 138, 'select1', '50元以下', 2),
(2525, 138, 'select1', '50元—100元', 3),
(2526, 138, 'select1', '100元—200元', 4),
(2527, 138, 'select1', '200元以上', 5),
(2529, 139, 'select1', '50元以下', 2),
(2530, 139, 'select1', '50元—100元', 3),
(2531, 139, 'select1', '100元—200元', 4),
(2532, 139, 'select1', '200元—500元', 5),
(2533, 139, 'select1', '500元以上', 6),
(2535, 140, 'select1', '50元以下', 2),
(2536, 140, 'select1', '50元—100元', 3),
(2537, 140, 'select1', '100元—200元', 4),
(2538, 140, 'select1', '200元以上', 5),
(2540, 141, 'select1', '50元以下', 2),
(2541, 141, 'select1', '50元—100元', 3),
(2542, 141, 'select1', '100元—200元', 5),
(2543, 141, 'select1', '200元以上', 6),
(2545, 142, 'select1', '泰迪', 2),
(2546, 142, 'select1', '金毛', 3),
(2547, 142, 'select1', '比熊', 4),
(2548, 142, 'select1', '萨摩耶', 5),
(2549, 142, 'select1', '阿拉斯加', 6),
(2550, 142, 'select1', '博美', 7),
(2551, 142, 'select1', '哈士奇', 8),
(2552, 142, 'select1', '拉布拉多', 9),
(2553, 142, 'select1', '德国牧羊犬', 10),
(2554, 142, 'select1', '松狮', 11),
(2555, 142, 'select1', '秋田犬', 12),
(2556, 142, 'select1', '吉娃娃', 13),
(2557, 142, 'select1', '藏獒', 14),
(2558, 142, 'select1', '雪纳瑞', 15),
(2559, 142, 'select1', '贵宾', 16),
(2560, 142, 'select1', '边境牧羊犬', 17),
(2561, 142, 'select1', '巴哥犬', 18),
(2562, 142, 'select1', '古牧', 19),
(2563, 142, 'select1', '罗威纳', 20),
(2564, 142, 'select1', '银狐犬', 21),
(2565, 142, 'select1', '杜宾犬', 22),
(2566, 142, 'select1', '京巴', 23),
(2567, 142, 'select1', '比特', 24),
(2568, 142, 'select1', '苏格兰牧羊犬', 25),
(2569, 142, 'select1', '高加索犬', 26),
(2570, 142, 'select1', '灵缇犬', 27),
(2571, 142, 'select1', '西高地', 28),
(2572, 142, 'select1', '马犬', 29),
(2573, 142, 'select1', '喜乐蒂', 30),
(2574, 142, 'select1', '牛头梗', 31),
(2575, 142, 'select1', '雪橇犬', 32),
(2576, 142, 'select1', '西施犬', 33),
(2577, 142, 'select1', '大白熊', 34),
(2578, 142, 'select1', '卡斯罗', 35),
(2579, 142, 'select1', '沙皮犬', 36),
(2580, 142, 'select1', '蝴蝶犬', 37),
(2581, 142, 'select1', '伯恩山犬', 38),
(2582, 142, 'select1', '斗牛犬', 39),
(2583, 142, 'select1', '万能梗', 40),
(2584, 142, 'select1', '小鹿犬', 41),
(2585, 142, 'select1', '猎狐梗', 42),
(2586, 142, 'select1', '威玛烈犬', 43),
(2587, 142, 'select1', '柴犬', 44),
(2588, 142, 'select1', '斑点狗', 45),
(2589, 142, 'select1', '巴吉度猎犬', 46),
(2590, 142, 'select1', '阿富汗猎犬', 47),
(2591, 142, 'select1', '格力犬', 48),
(2592, 142, 'select1', '比格犬', 49),
(2593, 142, 'select1', '大丹犬', 50),
(2594, 142, 'select1', '腊肠犬', 51),
(2595, 142, 'select1', '可卡犬', 52),
(2596, 142, 'select1', '柯基犬', 53),
(2597, 142, 'select1', '圣伯纳', 54),
(2598, 142, 'select1', '其他', 55),
(2600, 142, 'select2', '100元以下', 2),
(2601, 142, 'select2', '100元—300元', 3),
(2602, 142, 'select2', '300元—500元', 4),
(2603, 142, 'select2', '500元—800元', 5),
(2604, 142, 'select2', '800元—1200元', 6),
(2605, 142, 'select2', '1200元—2000元', 7),
(2606, 142, 'select2', '2000元以上', 8),
(2608, 142, 'select3', '公', 2),
(2609, 142, 'select3', '牧', 3),
(2611, 143, 'select1', '其他水族', 2),
(2612, 143, 'select1', '奇石盆景', 3),
(2613, 143, 'select1', '玩赏鸟', 4),
(2614, 143, 'select1', '观赏鱼', 5),
(2615, 143, 'select1', '其他', 6),
(2617, 143, 'select2', '100元以下', 2),
(2618, 143, 'select2', '100元—300元', 3),
(2619, 143, 'select2', '300元—500元', 4),
(2620, 143, 'select2', '500元—800元', 5),
(2621, 143, 'select2', '800元—1200元', 6),
(2622, 143, 'select2', '1200元—2000元', 7),
(2623, 143, 'select2', '2000元以上', 8),
(2625, 144, 'select1', '赠送', 2),
(2626, 144, 'select1', '求赠', 3),
(2628, 144, 'select2', '狗', 2),
(2629, 144, 'select2', '猫', 3),
(2630, 144, 'select2', '鼠', 4),
(2631, 144, 'select2', '兔', 5),
(2632, 144, 'select2', '鸟', 6),
(2633, 144, 'select2', '水族', 7),
(2634, 144, 'select2', '蛇', 8),
(2635, 144, 'select2', '猪', 9),
(2636, 144, 'select2', '其他', 10),
(2638, 145, 'select1', '蓝猫', 2),
(2639, 145, 'select1', '短毛猫', 3),
(2640, 145, 'select1', '折耳猫', 4),
(2641, 145, 'select1', '加菲猫', 5),
(2642, 145, 'select1', '虎斑猫', 6),
(2643, 145, 'select1', '金吉拉', 7),
(2644, 145, 'select1', '波斯猫', 8),
(2645, 145, 'select1', '暹罗猫', 9),
(2646, 145, 'select1', '豹猫', 10),
(2647, 145, 'select1', '其他', 11),
(2649, 145, 'select2', '100元以下', 2),
(2650, 145, 'select2', '100元—300元', 3),
(2651, 145, 'select2', '300元—500元', 4),
(2652, 145, 'select2', '500元—800元', 5),
(2653, 145, 'select2', '800元—1200元', 6),
(2654, 145, 'select2', '1200元—2000元', 7),
(2655, 145, 'select2', '2000元以上', 8),
(2657, 145, 'select3', '公', 2),
(2658, 145, 'select3', '母', 3),
(2660, 146, 'select1', '配种', 2),
(2661, 146, 'select1', '训练', 3),
(2662, 146, 'select1', '寄养', 4),
(2663, 146, 'select1', '医院', 5),
(2664, 146, 'select1', '美容', 6),
(2665, 146, 'select1', '托运', 7),
(2666, 146, 'select1', '临时照看', 8),
(2667, 146, 'select1', '其他', 9),
(2669, 147, 'select1', '宠物衣服', 2),
(2670, 147, 'select1', '宠物除毛器', 3),
(2671, 147, 'select1', '宠物粮', 4),
(2672, 147, 'select1', '宠物链', 5),
(2673, 147, 'select1', '宠物鞋', 6),
(2674, 147, 'select1', '宠物配饰', 7),
(2675, 147, 'select1', '宠物其它应用', 8),
(2676, 147, 'select1', '宠物其它食品', 9),
(2677, 147, 'select1', '其它', 10),
(2679, 147, 'select2', '供应', 2),
(2680, 147, 'select2', '求购', 3),
(2681, 147, 'select3', '测试1', 100),
(2682, 147, 'select3', '测试2', 100),
(2683, 147, 'select3', '测试3', 100);

-- --------------------------------------------------------

--
-- 表的结构 `bao_life_details`
--

CREATE TABLE `bao_life_details` (
  `life_id` int(11) NOT NULL DEFAULT '0',
  `details` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_life_love`
--

CREATE TABLE `bao_life_love` (
  `id` int(10) UNSIGNED NOT NULL,
  `life_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_life_photos`
--

CREATE TABLE `bao_life_photos` (
  `pic_id` int(11) UNSIGNED NOT NULL,
  `life_id` int(11) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_life_report`
--

CREATE TABLE `bao_life_report` (
  `id` int(10) UNSIGNED NOT NULL,
  `life_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_links`
--

CREATE TABLE `bao_links` (
  `link_id` smallint(5) UNSIGNED NOT NULL,
  `link_name` varchar(32) DEFAULT NULL,
  `link_url` varchar(128) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_lock`
--

CREATE TABLE `bao_lock` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(11) DEFAULT '0',
  `t` char(8) DEFAULT '0' COMMENT 'UID 操作分钟级别锁'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_market`
--

CREATE TABLE `bao_market` (
  `market_id` int(11) NOT NULL,
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
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_market_activity`
--

CREATE TABLE `bao_market_activity` (
  `id` int(11) UNSIGNED NOT NULL,
  `market_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `details` text,
  `views` int(11) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_market_details`
--

CREATE TABLE `bao_market_details` (
  `market_id` int(11) NOT NULL DEFAULT '0',
  `details` text,
  `business_time` varchar(32) DEFAULT '9:00-18:00',
  `near` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_market_enter`
--

CREATE TABLE `bao_market_enter` (
  `enter_id` int(11) UNSIGNED NOT NULL,
  `market_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_market_favorites`
--

CREATE TABLE `bao_market_favorites` (
  `favorites_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `market_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_market_pic`
--

CREATE TABLE `bao_market_pic` (
  `pic_id` int(11) UNSIGNED NOT NULL,
  `market_id` int(11) DEFAULT NULL,
  `pic` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_menu`
--

CREATE TABLE `bao_menu` (
  `menu_id` smallint(5) UNSIGNED NOT NULL,
  `menu_name` varchar(32) DEFAULT NULL,
  `menu_action` varchar(64) DEFAULT NULL,
  `parent_id` smallint(5) DEFAULT '0',
  `orderby` tinyint(3) UNSIGNED DEFAULT '100' COMMENT '1排序第一',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '0代表不直接显示'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_menu`
--

INSERT INTO `bao_menu` (`menu_id`, `menu_name`, `menu_action`, `parent_id`, `orderby`, `is_show`) VALUES
(1, '系统', NULL, 0, 1, 1),
(2, '设置', NULL, 0, 2, 1),
(3, '商家', NULL, 0, 3, 1),
(4, '会员', NULL, 0, 4, 1),
(5, '商城', NULL, 0, 5, 1),
(203, '支付方式', 'payment/index', 202, 1, 1),
(7, '功能', NULL, 0, 6, 1),
(8, '运营', NULL, 0, 10, 1),
(9, '管理员管理', NULL, 1, 2, 1),
(11, '后台菜单管理', NULL, 1, 1, 1),
(12, '菜单列表', 'menu/index', 11, 2, 1),
(13, '新增菜单', 'menu/create', 11, 3, 0),
(14, '编辑菜单', 'menu/edit', 11, 1, 0),
(15, '删除菜单', 'menu/delete', 11, 3, 0),
(16, '更新菜单', 'menu/update', 11, 4, 0),
(17, '批量菜单', 'menu/action', 11, 1, 0),
(18, '角色管理', 'role/index', 9, 2, 1),
(25, '新增角色', 'role/create', 9, 7, 0),
(26, '编辑角色', 'role/edit', 9, 1, 0),
(27, '删除角色', 'role/delete', 9, 2, 0),
(28, '角色授权', 'role/auth', 9, 8, 0),
(29, '管理员管理', 'admin/index', 9, 1, 1),
(30, '新增管理员', 'admin/create', 9, 2, 0),
(31, '编辑管理员', 'admin/edit', 9, 2, 0),
(32, '删除管理员', 'admin/delete', 9, 4, 0),
(33, '会员管理', NULL, 4, 1, 1),
(34, '会员管理', 'user/index', 33, 1, 1),
(35, '新增会员', 'user/create', 33, 2, 0),
(36, '编辑会员', 'user/edit', 33, 6, 0),
(37, '删除会员', 'user/delete', 33, 4, 0),
(60, '预约订座', NULL, 3, 4, 1),
(39, '缓存管理', NULL, 8, 6, 1),
(40, '清空缓存', 'clean/cache', 39, 100, 1),
(41, '审核会员', 'user/audit', 33, 3, 0),
(42, '商家类别', NULL, 3, 1, 1),
(43, '商家管理', NULL, 3, 2, 1),
(44, '分类列表', 'shopcate/index', 42, 1, 1),
(45, '新增分类', 'shopcate/create', 42, 2, 0),
(46, '编辑分类', 'shopcate/edit', 42, 3, 0),
(47, '删除分类', 'shopcate/delete', 42, 4, 0),
(48, '更新排序', 'shopcate/update', 42, 5, 0),
(49, '基本设置', NULL, 2, 1, 1),
(50, '区域设置', NULL, 2, 3, 1),
(51, '区域管理', 'area/index', 50, 11, 1),
(52, '新增区域', 'area/create', 50, 12, 0),
(53, '编辑区域', 'area/edit', 50, 13, 0),
(54, '删除区域', 'area/delete', 50, 14, 0),
(55, '商圈管理', 'business/index', 50, 15, 0),
(56, '新增商圈', 'business/create', 50, 19, 0),
(57, '编辑商圈', 'business/edit', 50, 18, 0),
(58, '删除商圈', 'business/delete', 50, 17, 0),
(277, '审核商家', 'shop/audit', 43, 100, 0),
(61, '文章内容', NULL, 7, 2, 1),
(62, '抢购', NULL, 5, 3, 1),
(65, '友情链接', NULL, 8, 4, 1),
(66, '广告管理', NULL, 8, 1, 1),
(202, '支付设置', NULL, 2, 2, 1),
(215, '微信', NULL, 0, 9, 1),
(70, '友情链接', 'links/index', 65, 100, 1),
(71, '添加友情', 'links/create', 65, 100, 0),
(72, '修改友情', 'links/edit', 65, 100, 0),
(73, '删除友情', 'links/delete', 65, 100, 0),
(278, '积分兑换', 'integralexchange/index', 234, 2, 1),
(279, '设为已完成兑换', 'integralexchange/audit', 234, 2, 0),
(280, '设为热门分类', 'shopcate/hots', 42, 6, 0),
(80, '站点设置', 'setting/site', 49, 1, 1),
(81, '附件设置', 'setting/attachs', 49, 2, 1),
(270, '选择分类', 'activitycate/select', 244, 100, 0),
(85, '商家列表', 'shop/index', 43, 2, 1),
(86, '新增商家', 'shop/create', 43, 100, 0),
(87, '修改商家', 'shop/edit', 43, 100, 0),
(88, '删除商家', 'shop/delete', 43, 100, 0),
(90, '异步选择会员', 'user/select', 33, 2, 0),
(91, '异步查询商圈', 'business/child', 50, 20, 0),
(95, '预定合作', 'shop/yuyue', 43, 100, 0),
(96, '商家新闻', 'shopnews/index', 228, 2, 1),
(97, '发布新闻', 'shopnews/create', 228, 1, 1),
(98, '修改新闻', 'shopnews/edit', 228, 3, 0),
(99, '删除新闻', 'shopnews/delete', 228, 4, 0),
(100, '审核新闻', 'shopnews/audit', 228, 5, 0),
(101, '商家异步查询', 'shop/select', 43, 100, 0),
(102, '商家图片', 'shoppic/index', 43, 41, 1),
(103, '删除图片', 'shoppic/delete', 43, 42, 0),
(104, '异步查询', 'articlecate/child', 61, 3, 0),
(105, '更新排序', 'articlecate/update', 61, 4, 0),
(106, '删除分类', 'articlecate/delete', 61, 5, 0),
(107, '编辑分类', 'articlecate/edit', 61, 6, 0),
(108, '新增分类', 'articlecate/create', 61, 7, 0),
(109, '分类列表', 'articlecate/index', 61, 1, 1),
(110, '文章管理', 'article/index', 61, 2, 1),
(111, '新增文章', 'article/create', 61, 8, 0),
(112, '编辑文章', 'article/edit', 61, 9, 0),
(113, '删除文章', 'article/delete', 61, 10, 0),
(114, '贴吧管理', NULL, 7, 2, 1),
(115, '敏感词过滤', 'sensitive/index', 49, 3, 1),
(116, '新增敏感词', 'sensitive/create', 49, 4, 0),
(117, '编辑敏感词', 'sensitive/edit', 49, 5, 0),
(118, '删除敏感词', 'sensitive/delete', 49, 6, 0),
(119, '帖子分享', 'post/index', 114, 1, 1),
(120, '新增帖子', 'post/create', 114, 2, 0),
(121, '编辑帖子', 'post/edit', 114, 3, 0),
(122, '删除帖子', 'post/delete', 114, 4, 0),
(123, '审核帖子', 'post/audit', 114, 5, 0),
(509, '会员提现', NULL, 4, 100, 1),
(125, '抢购列表', 'tuan/index', 62, 1, 1),
(126, '新增抢购', 'tuan/create', 62, 14, 0),
(127, '编辑抢购', 'tuan/edit', 62, 11, 0),
(128, '删除抢购', 'tuan/delete', 62, 12, 0),
(129, '审核抢购', 'tuan/audit', 62, 13, 0),
(130, '订单管理', 'tuanorder/index', 62, 20, 1),
(206, '支付日志', 'paymentlogs/index', 202, 4, 1),
(134, '优惠券', NULL, 5, 5, 1),
(135, '优惠券管理', 'coupon/index', 134, 1, 1),
(136, '新增优惠券', 'coupon/create', 134, 2, 0),
(137, '编辑优惠券', 'coupon/edit', 134, 3, 0),
(138, '删除优惠券', 'coupon/delete', 134, 4, 0),
(139, '审核优惠券', 'coupon/audit', 134, 5, 0),
(140, '优惠券下载', 'coupondownload/index', 134, 6, 1),
(142, '回复帖子', 'postreply/index', 114, 11, 1),
(143, '新增回复', 'postreply/create', 114, 12, 0),
(144, '编辑回复', 'postreply/edit', 114, 13, 0),
(145, '删除回复', 'postreply/delete', 114, 14, 0),
(146, '审核回复', 'postreply/audit', 114, 15, 0),
(156, '短信设置', 'setting/sms', 49, 11, 1),
(157, '邮件设置', 'setting/mail', 49, 12, 1),
(158, '模版管理', NULL, 2, 4, 1),
(159, '短信模版', 'sms/index', 158, 11, 1),
(160, '新增短信模版', 'sms/create', 158, 12, 0),
(161, '编辑短信模版', 'sms/edit', 158, 13, 0),
(162, '关闭短信模版', 'sms/delete', 158, 14, 0),
(163, '邮件模版', 'email/index', 158, 21, 1),
(164, '新增邮件模版', 'email/create', 158, 22, 0),
(165, '编辑邮件模版', 'email/edit', 158, 23, 0),
(166, '关闭邮件模版', 'email/delete', 158, 24, 0),
(167, 'SEO模版', 'seo/index', 158, 31, 1),
(168, '新增SEO模版', 'seo/create', 158, 100, 0),
(169, '编辑SEO模版', 'seo/edit', 158, 100, 0),
(170, '删除SEO模版', 'seo/delete', 158, 100, 0),
(171, '网站风格', 'template/index', 158, 40, 1),
(172, '安装风格', 'template/install', 158, 42, 0),
(173, '卸载风格', 'template/uninstall', 158, 41, 0),
(174, '配置风格', 'template/setting', 158, 43, 0),
(175, '批量开启短信', 'sms/audit', 158, 15, 0),
(176, '开启邮件模版', 'email/audit', 158, 25, 0),
(177, '商家点评', 'shopdianping/index', 230, 22, 1),
(178, '发布点评', 'shopdianping/create', 230, 21, 1),
(179, '编辑点评', 'shopdianping/edit', 230, 23, 0),
(180, '删除点评', 'shopdianping/delete', 230, 24, 0),
(181, '商家预约', 'shopyuyue/index', 60, 31, 1),
(182, '新增预约', 'shopyuyue/create', 60, 32, 0),
(183, '编辑预约', 'shopyuyue/edit', 60, 33, 0),
(184, '删除预约', 'shopyuyue/delete', 60, 34, 0),
(185, '系统文章', 'systemcontent/index', 61, 21, 1),
(186, '新增系统文章', 'systemcontent/create', 61, 22, 0),
(187, '编辑系统文章', 'systemcontent/edit', 61, 23, 0),
(188, '删除系统文章', 'systemcontent/delete', 61, 24, 0),
(189, '广告位设置', 'adsite/index', 66, 1, 1),
(494, '人才招聘', NULL, 487, 10, 1),
(495, '人才招聘', 'work/index', 494, 1, 1),
(193, '广告管理', 'ad/index', 66, 11, 0),
(194, '新增广告', 'ad/create', 66, 12, 0),
(195, '编辑广告', 'ad/edit', 66, 13, 0),
(196, '删除广告', 'ad/delete', 66, 14, 0),
(197, '设为默认模版', 'template/df', 158, 44, 0),
(198, '新增挂件', 'template/add', 158, 45, 0),
(199, '编辑挂件', 'template/edit', 158, 46, 0),
(200, '删除挂件', 'template/delete', 158, 47, 0),
(201, '更新模版', 'template/update', 158, 48, 0),
(204, '安装支付', 'payment/install', 202, 2, 0),
(205, '卸载支付', 'payment/uninstall', 202, 3, 0),
(259, '积分设置', 'setting/integral', 49, 13, 1),
(441, '资金记录', 'shopmoney/index', 440, 1, 1),
(209, '抢购券管理', 'tuancode/index', 62, 33, 1),
(210, '删除抢购券', 'tuancode/delete', 62, 34, 0),
(211, '积分日志', 'userintegrallogs/index', 291, 40, 1),
(212, '增加积分', 'user/integral', 33, 8, 1),
(213, '金块日志', 'usergoldlogs/index', 291, 42, 1),
(214, '增加金块', 'user/gold', 33, 9, 0),
(216, '微信O2O', NULL, 215, 1, 1),
(217, '商家微信', NULL, 215, 2, 1),
(218, '微信配置', 'setting/weixin', 216, 1, 1),
(219, '微信关键字', 'weixinkeyword/index', 216, 2, 1),
(220, '新增关键字', 'weixinkeyword/create', 216, 3, 0),
(221, '编辑关键字', 'weixinkeyword/edit', 216, 4, 0),
(222, '删除关键字', 'weixinkeyword/delete', 216, 5, 0),
(223, '商家商品', 'goods/index', 231, 51, 1),
(224, '新增商品', 'goods/create', 231, 52, 0),
(225, '编辑商品', 'goods/edit', 231, 53, 0),
(226, '删除商品', 'goods/delete', 231, 54, 0),
(227, '审核商品', 'goods/audit', 231, 55, 0),
(228, '商家新闻', NULL, 3, 6, 1),
(230, '商家点评', NULL, 3, 5, 1),
(231, '商家产品', NULL, 5, 1, 1),
(486, '榜单分类', 'billcate/index', 483, 1, 1),
(234, '积分商城', NULL, 5, 6, 1),
(235, '商品列表', 'integralgoods/index', 234, 1, 1),
(236, '新增商品', 'integralgoods/create', 234, 1, 0),
(237, '修改商品', 'integralgoods/edit', 234, 1, 0),
(238, '删除商品', 'integralgoods/delete', 234, 1, 0),
(239, '审核商品', 'integralgoods/audit', 234, 1, 0),
(240, '会员等级', 'userrank/index', 33, 21, 1),
(241, '新增等级', 'userrank/create', 33, 22, 0),
(242, '编辑等级', 'userrank/edit', 33, 23, 0),
(243, '删除等级', 'userrank/delete', 33, 24, 0),
(244, '活动管理', NULL, 7, 5, 1),
(245, '活动列表', 'activity/index', 244, 2, 1),
(246, '活动添加', 'activity/create', 244, 100, 0),
(247, '活动审核', 'activity/audit', 244, 100, 0),
(248, '活动编辑', 'activity/edit', 244, 100, 0),
(249, '活动删除', 'activity/delete', 244, 100, 0),
(262, '新增地址', 'useraddr/create', 260, 2, 0),
(260, '收货地址', NULL, 4, 4, 1),
(261, '收货地址', 'useraddr/index', 260, 1, 1),
(255, '分类列表', 'activitycate/index', 244, 1, 1),
(256, '添加分类', 'activitycate/create', 244, 100, 0),
(257, '编辑分类', 'activitycate/edit', 244, 100, 0),
(258, '删除分类', 'activitycate/delete', 244, 100, 0),
(263, '编辑地址', 'useraddr/edit', 260, 3, 0),
(264, '删除地址', 'useraddr/delete', 260, 4, 0),
(265, '商品类别', 'goodscate/index', 231, 1, 1),
(266, '新增分类', 'goodscate/create', 231, 2, 0),
(267, '编辑分类', 'goodscate/edit', 231, 3, 0),
(268, '更新分类', 'goodscate/update', 231, 4, 0),
(269, '删除分类', 'goodscate/delete', 231, 5, 0),
(271, '添加子分类', 'activitycate/child', 244, 100, 0),
(274, '微信消息列表', 'weixinmsg/index', 216, 11, 1),
(275, '第三方登录', 'setting/connect', 33, 10, 1),
(281, '热门商圈', 'business/hots', 50, 16, 0),
(282, '统计报表', NULL, 8, 5, 1),
(283, '团购数分析', 'tongji/index', 282, 11, 1),
(296, '抢购券退款', 'tuancode/refund', 62, 34, 1),
(289, '团购金额', 'tongji/money', 282, 12, 1),
(290, '威望设置', 'setting/prestige', 49, 14, 1),
(291, '会员日志', NULL, 4, 5, 1),
(292, '余额日志', 'usermoneylogs/index', 291, 43, 1),
(297, '抢购券退款操作', 'tuancode/refunding', 62, 35, 0),
(298, '抢购券过期', 'tuancode/overdue', 62, 35, 1),
(299, '抢购券过期退款操作', 'tuancode/overdueing', 62, 35, 0),
(490, '生成卡密', 'usercard/create', 488, 2, 0),
(303, '手机功能', NULL, 487, 7, 1),
(305, '新增发现', 'found/create', 303, 2, 0),
(306, '编辑发现', 'found/edit', 303, 3, 0),
(307, '删除发现', 'found/delete', 303, 4, 0),
(308, '审核发现', 'found/audit', 303, 5, 0),
(309, '消息管理', 'msg/index', 303, 6, 1),
(310, '新增消息', 'msg/create', 303, 7, 0),
(311, '编辑消息', 'msg/edit', 303, 8, 0),
(312, '删除消息', 'msg/delete', 303, 9, 0),
(313, '报名管理', 'activitysign/index', 244, 3, 1),
(314, '商城订单', NULL, 5, 7, 1),
(315, '订单汇总', 'order/index', 314, 1, 1),
(316, '等待捡货', 'order/wait', 314, 2, 1),
(317, '捡货单管理', 'order/picks', 314, 4, 1),
(318, '发货管理', 'order/delivery', 314, 5, 1),
(319, '加入捡货单', 'order/pick', 314, 100, 0),
(320, '清空拣货单', 'order/clean', 314, 100, 0),
(321, '创建捡货单', 'order/create', 314, 100, 0),
(322, '捡货单详情', 'order/pickdetail', 314, 100, 0),
(324, '打印配送单', 'order/send', 314, 100, 0),
(325, '订单发货', 'order/distribution', 314, 100, 0),
(326, '增加余额', 'user/money', 33, 100, 0),
(327, '新增商家资金', 'shopmoney/create', 43, 100, 0),
(328, '商家审核列表', 'shop/apply', 43, 3, 1),
(329, '分类列表', 'sharecate/index', 114, 1, 1),
(330, '添加分类', 'sharecate/create', 114, 100, 0),
(331, '选择分类', 'sharecate/select', 114, 100, 0),
(332, '添加子分类', 'sharecate/child', 114, 100, 0),
(333, '编辑分类', 'sharecate/edit', 114, 100, 0),
(334, '删除分类', 'sharecate/delete', 114, 100, 0),
(335, '频道', NULL, 0, 8, 1),
(336, '自定义菜单', 'setting/weixinmenu', 216, 6, 1),
(337, '删除微信消息', 'weixinmsg/delete', 216, 12, 0),
(338, '分类信息', NULL, 335, 1, 1),
(339, '分类管理', 'lifecate/index', 338, 1, 1),
(340, '新增分类', 'lifecate/create', 338, 2, 0),
(341, '编辑分类', 'lifecate/edit', 338, 3, 0),
(342, '删除分类', 'lifecate/delete', 338, 4, 0),
(343, '属性设置', 'lifecate/setting', 338, 5, 0),
(344, '抢购分类', NULL, 5, 2, 1),
(345, '分类列表', 'tuancate/index', 344, 1, 1),
(346, '添加分类', 'tuancate/create', 344, 100, 0),
(347, '添加子分类', 'tuancate/child', 344, 100, 0),
(348, '删除分类', 'tuancate/delete', 344, 100, 0),
(349, '编辑分类', 'tuancate/edit', 344, 100, 0),
(350, '选择分类', 'tuancate/select', 344, 100, 0),
(351, '删除属性', 'lifecate/delattr', 338, 6, 0),
(352, '信息列表', 'life/index', 338, 11, 1),
(353, '新增信息', 'life/create', 338, 12, 0),
(354, '编辑信息', 'life/edit', 338, 13, 0),
(355, '删除信息', 'life/delete', 338, 14, 0),
(356, '审核信息', 'life/audit', 338, 15, 0),
(357, '分类异步查询', 'lifecate/ajax', 338, 7, 0),
(358, '抢购点评', NULL, 5, 4, 1),
(359, '抢购点评', 'tuandianping/index', 358, 2, 1),
(360, '发布点评', 'tuandianping/create', 358, 1, 1),
(361, '删除点评', 'tuandianping/delete', 358, 100, 0),
(362, '编辑点评', 'tuandianping/edit', 358, 100, 0),
(363, '插件', NULL, 0, 7, 1),
(364, '投票插件', NULL, 363, 2, 1),
(365, '投票列表', 'vote/index', 364, 1, 1),
(366, '投票添加', 'vote/create', 364, 100, 0),
(367, '投票编辑', 'vote/edit', 364, 100, 0),
(368, '删除投票', 'vote/delete', 364, 100, 0),
(517, '新增站点', 'city/create', 50, 2, 0),
(519, '删除站点', 'city/delete', 50, 4, 0),
(518, '编辑站点', 'city/edit', 50, 3, 0),
(375, '查看结果', 'vote/result', 364, 2, 0),
(499, '家政配置', 'setting/housework', 498, 1, 1),
(527, '微信模板消息', 'weixintmpl/index', 216, 13, 1),
(394, '抽奖插件', NULL, 363, 3, 1),
(387, '关键字列表', 'shopweixinkeyword/index', 217, 100, 1),
(388, '新增关键字', 'shopweixinkeyword/create', 217, 100, 0),
(389, '编辑关键字', 'shopweixinkeyword/edit', 217, 100, 0),
(390, '删除关键字', 'shopweixinkeyword/delete', 217, 100, 0),
(391, '群发消息', 'weixinkeyword/mass', 216, 7, 1),
(392, '货到付款捡货', 'order/wait2', 314, 3, 1),
(395, '抽奖管理', 'award/index', 394, 1, 1),
(396, '新增抽奖', 'award/create', 394, 2, 0),
(397, '编辑抽奖', 'award/edit', 394, 3, 0),
(398, '删除抽奖', 'award/delete', 394, 4, 0),
(399, '启用抽奖', 'award/online', 394, 5, 0),
(400, '奖品设置', 'awardgoods/index', 394, 6, 0),
(401, '新增奖品', 'awardgoods/create', 394, 7, 0),
(402, '编辑奖品', 'awardgoods/edit', 394, 8, 0),
(403, '删除奖品', 'awardgoods/delete', 394, 9, 0),
(404, '中奖名单', 'awardwinning/index', 394, 10, 0),
(405, '新增中奖', 'awardwinning/create', 394, 11, 0),
(406, '编辑中奖', 'awardwinning/edit', 394, 12, 0),
(407, '删除中奖', 'awardwinning/delete', 394, 13, 0),
(408, '关键字管理', NULL, 8, 3, 1),
(410, '关键字列表', 'keyword/index', 408, 1, 1),
(411, '添加关键字', 'keyword/create', 408, 100, 0),
(412, '编辑关键字', 'keyword/edit', 408, 100, 0),
(413, '删除关键字', 'keyword/delete', 408, 100, 0),
(414, '手机配置', 'setting/mobile', 303, 10, 1),
(418, '设置热门分类', 'life/hots', 338, 4, 0),
(416, '外卖', NULL, 335, 3, 1),
(516, '城市站点', 'city/index', 50, 1, 1),
(419, '举报信息', 'lifereport/index', 338, 20, 1),
(498, '家政服务', NULL, 487, 11, 1),
(421, '商家列表', 'ele/index', 416, 2, 1),
(422, '新增商家', 'ele/create', 416, 2, 0),
(423, '编辑商家', 'ele/edit', 416, 3, 0),
(424, '删除商家', 'ele/delete', 416, 4, 0),
(425, '打样管理', 'ele/opened', 416, 4, 0),
(489, '会员卡管理', 'usercard/index', 488, 1, 1),
(487, '手机', NULL, 0, 9, 1),
(488, '会员卡管理', NULL, 4, 2, 1),
(430, '菜单管理', 'eleproduct/index', 416, 12, 1),
(431, '新增菜单', 'eleproduct/create', 416, 12, 0),
(432, '编辑菜单', 'eleproduct/edit', 416, 12, 0),
(433, '删除菜单', 'eleproduct/delete', 416, 12, 0),
(434, '进入商家中心', 'shop/login', 43, 100, 0),
(435, '卡密管理', 'rechargecard/index', 202, 5, 1),
(436, '添加充值卡', 'rechargecard/create', 202, 100, 0),
(437, '删除充值卡', 'rechargecard/delete', 202, 100, 0),
(438, '餐饮订单管理', 'eleorder/index', 416, 22, 1),
(439, '删除订单', 'eleorder/delete', 416, 100, 0),
(440, '结算管理', NULL, 3, 3, 1),
(442, '对账单管理', 'settlement/index', 440, 2, 0),
(443, '新增对账单', 'settlement/create', 440, 3, 0),
(444, '对账单详情', 'settlementshop/index', 440, 4, 0),
(445, '商场管理', NULL, 7, 8, 1),
(446, '商场列表', 'market/index', 445, 1, 1),
(447, '添加商场', 'market/create', 445, 100, 0),
(448, '编辑商场', 'market/edit', 445, 100, 0),
(449, '删除商场', 'market/delete', 445, 100, 0),
(450, '商家入驻', 'market/enter', 445, 100, 0),
(451, '入驻列表', 'market/enterlist', 445, 100, 0),
(452, '撤销入驻', 'market/cancle', 445, 100, 0),
(453, '商场活动', 'marketactivity/index', 445, 2, 1),
(454, '添加活动', 'marketactivity/create', 445, 100, 0),
(455, '编辑活动', 'marketactivity/edit', 445, 100, 0),
(456, '删除活动', 'marketactivity/delete', 445, 100, 0),
(561, '小区服务台', 'feedback/index', 555, 6, 1),
(560, '小区论坛', 'communityposts/index', 555, 5, 1),
(468, '推广配置', 'tui/index', 282, 1, 1),
(469, '新增推广', 'tui/create', 282, 2, 0),
(470, '编辑推广', 'tui/edit', 282, 3, 0),
(471, '删除推广', 'tui/delete', 282, 4, 0),
(472, '来源分析', 'tongji/laiyuan', 282, 13, 1),
(473, '推广效果分析', 'tongji/tuiguan', 282, 14, 1),
(477, '手机版约会', NULL, 487, 6, 1),
(475, '关键词分析', 'tongji/keyword', 282, 16, 1),
(476, '来源金额', 'tongji/lmoney', 282, 13, 1),
(478, '附近约会', 'hdmobile/index', 477, 1, 1),
(482, '报名管理', 'hdmobilesign/index', 477, 2, 1),
(483, '上榜榜单', NULL, 7, 10, 1),
(484, '榜单列表', 'billboard/index', 483, 2, 1),
(485, '榜单管理', 'billshop/index', 483, 100, 1),
(491, '会员卡删除', 'usercard/delete', 488, 3, 1),
(492, '导入会员卡', 'usercard/import', 488, 4, 0),
(493, '确定导入', 'usercard/importok', 488, 5, 0),
(496, '审核招聘', 'work/audit', 494, 2, 0),
(497, '删除招聘', 'work/delete', 494, 3, 0),
(500, '家政列表', 'housework/index', 498, 4, 1),
(501, '删除家政', 'housework/delete', 498, 5, 0),
(502, '修改家政', 'housework/edit', 498, 6, 0),
(510, '提现管理', 'usercash/index', 509, 100, 1),
(520, '微店审核列表', 'weidian/index', 43, 100, 1),
(521, '开通订座', 'shop/ding', 43, 100, 0),
(515, '优购配置', 'setting/mall', 231, 100, 1),
(522, '专题管理', 'zhuanti/index', 62, 41, 1),
(523, '配送员管理', NULL, 335, 100, 1),
(524, '配送员列表', 'delivery/index', 523, 100, 1),
(525, '添加配送员', 'delivery/create', 523, 100, 0),
(526, '配送记录', 'delivery/lists', 523, 100, 0),
(190, '添加广告位', 'adsite/create', 66, 2, 1),
(528, 'UC整合', 'setting/ucenter', 33, 100, 1),
(529, '新功能', NULL, 0, 100, 1),
(530, '缴费管理', NULL, 529, 100, 1),
(532, '缴费类型', 'bill/billtype', 530, 1, 1),
(533, '缴费订单', 'bill/billorder', 530, 2, 1),
(534, '系统维护', NULL, 1, 100, 1),
(535, '数据库维护', 'check/index', 534, 100, 1),
(536, '销售流水', NULL, 3, 100, 1),
(537, '资金记录', 'shopmoney/index', 536, 1, 1),
(538, '月订单汇总', 'shopmoney/tjmonth', 536, 2, 1),
(539, '日订单汇总', 'shopmoney/tjday', 536, 3, 1),
(540, '年订单汇总', 'shopmoney/tjyear', 536, 4, 1),
(541, '全民经纪人', NULL, 4, 100, 1),
(542, '全民经纪人', 'setting/quanming', 541, 100, 1),
(543, '全民推广明细', 'quanming/index', 541, 2, 1),
(544, '全民经纪人', 'tongji/quanming', 282, 17, 1),
(545, 'APP', NULL, 0, 100, 1),
(546, 'app推送管理', NULL, 545, 2, 1),
(547, 'app管理', NULL, 545, 1, 1),
(548, 'APP版本管理', 'setting/updateapp', 547, 1, 1),
(549, '推送配置', 'setting/jpush', 546, 100, 1),
(550, '群发消息', 'jpush/mass', 546, 2, 1),
(551, '单发消息', 'jpush/single', 546, 3, 1),
(552, '历史记录', 'jpush/history', 546, 4, 1),
(553, '家政项目配置', 'housework/setting', 498, 2, 1),
(554, '设置项目配置', 'housework/setting2', 498, 3, 0),
(555, '小区管理', NULL, 529, 100, 1),
(556, '小区管理', 'community/index', 555, 1, 1),
(557, '新增小区', 'community/add', 555, 2, 0),
(558, '编辑小区', 'community/edit', 555, 3, 0),
(559, '删除小区', 'community/delete', 555, 4, 0),
(562, '社区、村镇设置', NULL, 529, 100, 1),
(563, '社区村镇管理', 'village/index', 562, 100, 1),
(564, '编辑', 'village/edit', 562, 100, 0),
(565, '通知以及活动管理', 'village/notice', 562, 100, 0),
(566, '工作人员管理', 'village/worker', 562, 100, 0),
(567, '社区村评论删除', 'village/bbs_replys_delete', 562, 100, 0),
(568, '社区村帖子删除', 'village/bbs_delete', 562, 100, 0),
(569, '社区村帖子查看', 'village/bbs_view', 562, 100, 0),
(570, '社区村意见删除', 'village/reply_delete', 562, 100, 0),
(571, '社区村工作人员删除', 'village/worker_delete', 562, 100, 0),
(572, '社区村添加', 'village/create', 562, 100, 0),
(573, '社区村工作人员编辑', 'village/worker_edit', 562, 100, 0),
(574, '社区村通知以及活动删除', 'village/notice_delete', 562, 100, 0),
(575, '社区村通知以及活动编', 'village/notice_edit', 562, 100, 0),
(576, '社区村通知以及活动新增', 'village/notice_create', 562, 100, 0),
(577, '删除', 'village/delete', 562, 100, 0),
(578, '帖子管理', 'village/bbs', 562, 100, 0),
(579, '意见管理', 'village/suggestion', 562, 100, 0),
(580, '社区村工作人员添加', 'village/worker_create', 562, 100, 0),
(581, '小区便民电话', 'convenientphone/index', 555, 7, 1),
(582, '添加便民电话', 'convenientphone/create', 555, 8, 0),
(583, '删除便民电话', 'convenientphone/delete', 555, 9, 0),
(584, '编辑便民电话', 'convenientphone/edit', 555, 10, 0),
(586, '会员', NULL, 3, 100, 1);

-- --------------------------------------------------------

--
-- 表的结构 `bao_message`
--

CREATE TABLE `bao_message` (
  `msg_id` int(15) NOT NULL,
  `parent_id` int(15) NOT NULL DEFAULT '0',
  `send_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `content` varchar(200) NOT NULL,
  `read_time` int(10) NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_message`
--

INSERT INTO `bao_message` (`msg_id`, `parent_id`, `send_id`, `user_id`, `content`, `read_time`, `create_time`) VALUES
(2, 0, 0, 214, '贝拉小镇希望你们成为他的员工，点击链接同意：<a href=\"/mcenter/information/worker/worker_id/5.html\">查看详情</a>', 0, 1506314934),
(3, 0, 0, 233, '贝拉小镇希望你们成为他的员工，点击链接同意：<a href=\"/mcenter/information/worker/worker_id/6.html\">查看详情</a>', 0, 1506314979),
(4, 0, 0, 217, '贝拉小镇希望你们成为他的员工，点击链接同意：<a href=\"/mcenter/information/worker/worker_id/7.html\">查看详情</a>', 0, 1506410136);

-- --------------------------------------------------------

--
-- 表的结构 `bao_msg`
--

CREATE TABLE `bao_msg` (
  `msg_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT '0',
  `type` enum('gift','coupon','movie','message') DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `intro` varchar(256) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL COMMENT '可以为空 如果为空',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `details` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_msg_read`
--

CREATE TABLE `bao_msg_read` (
  `read_id` int(10) UNSIGNED NOT NULL,
  `msg_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_msg_read`
--

INSERT INTO `bao_msg_read` (`read_id`, `msg_id`, `user_id`, `create_time`, `create_ip`) VALUES
(1, 1, 1, 1416401024, '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `bao_order`
--

CREATE TABLE `bao_order` (
  `order_id` int(11) UNSIGNED NOT NULL,
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
  `juan_num` tinyint(4) DEFAULT '0' COMMENT '使用卷数量',
  `piao_url` varchar(150) DEFAULT NULL COMMENT '票付通二维码连接',
  `piao_img` varchar(150) DEFAULT NULL COMMENT '票付通二维码图片',
  `piao_uucode` varchar(50) DEFAULT NULL,
  `check_time` int(11) NOT NULL COMMENT '检车时间',
  `yw_time` int(11) NOT NULL COMMENT '游玩时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_order`
--

INSERT INTO `bao_order` (`order_id`, `addr_id`, `shop_id`, `user_id`, `total_price`, `create_time`, `create_ip`, `update_time`, `update_ip`, `status`, `is_daofu`, `is_shop`, `closed`, `use_integral`, `can_use_integral`, `act_code`, `juan_num`, `piao_url`, `piao_img`, `piao_uucode`, `check_time`, `yw_time`) VALUES
(83950579, 0, NULL, 10085, 260, 1506594860, '0.0.0.0', 1506594860, NULL, 0, 0, 0, 0, 0, 0, '95152880', 0, NULL, NULL, NULL, 1506594980, 1507392000),
(83950580, 0, NULL, 10085, 260, 1506594865, '0.0.0.0', 1506594865, NULL, 0, 0, 0, 0, 0, 0, '33550265', 0, NULL, NULL, NULL, 1506594985, 1507392000),
(83950581, 0, NULL, 10085, 250, 1506595412, '0.0.0.0', 1506595412, NULL, 0, 0, 0, 0, 0, 0, '23881593', 1, NULL, NULL, NULL, 1506595532, 1507392000),
(83950582, 0, NULL, 10088, 260, 1506596177, '0.0.0.0', 1506596177, NULL, 0, 0, 0, 0, 0, 0, '73748734', 0, NULL, NULL, NULL, 1506596297, 1506787200),
(83950583, 0, NULL, 10085, 240, 1506596500, '0.0.0.0', 1506596500, NULL, 0, 0, 0, 0, 0, 0, '96195227', 2, NULL, NULL, NULL, 1506596620, 1506873600),
(83950584, 0, NULL, 10108, 260, 1506597746, '0.0.0.0', 1506597746, NULL, 0, 0, 0, 0, 0, 0, '19691095', 0, NULL, NULL, NULL, 1506597866, 1507392000),
(83950585, 0, NULL, 10101, 260, 1506598354, '0.0.0.0', 1506598354, NULL, 0, 0, 0, 0, 0, 0, '33759843', 0, NULL, NULL, NULL, 1506598474, 1507132800),
(83950586, 0, NULL, 10084, 240, 1506598812, '0.0.0.0', 1506598812, NULL, 0, 0, 0, 0, 0, 0, '41287197', 2, NULL, NULL, NULL, 1506598932, 1506787200),
(83950587, 0, NULL, 10085, 240, 1506603493, '0.0.0.0', 1506603493, NULL, 0, 0, 0, 0, 0, 0, '81252235', 2, NULL, NULL, NULL, 1506603613, 1506787200),
(83950588, 0, NULL, 10137, 260, 1506604165, '0.0.0.0', 1506604165, NULL, 0, 0, 0, 0, 0, 0, '43702684', 0, NULL, NULL, NULL, 1506604285, 1506787200),
(83950589, 0, NULL, 10212, 260, 1506606682, '0.0.0.0', 1506606682, NULL, 0, 0, 0, 0, 0, 0, '18367349', 0, NULL, NULL, NULL, 1506606802, 1506960000),
(83950590, 0, NULL, 10085, 240, 1506606891, '0.0.0.0', 1506606891, NULL, 0, 0, 0, 0, 0, 0, '14638573', 2, NULL, NULL, NULL, 1506607011, 1506787200),
(83950591, 0, NULL, 10091, 260, 1506607975, '0.0.0.0', 1506607975, NULL, 0, 0, 0, 0, 0, 0, '57671384', 0, NULL, NULL, NULL, 1506608095, 1507132800),
(83950592, 0, NULL, 10261, 260, 1506609141, '0.0.0.0', 1506609141, NULL, 0, 0, 0, 0, 0, 0, '53887655', 0, NULL, NULL, NULL, 1506609261, 1507132800),
(83950593, 0, NULL, 10097, 260, 1506609280, '0.0.0.0', 1506609280, NULL, 0, 0, 0, 0, 0, 0, '92777652', 0, NULL, NULL, NULL, 1506609400, 1506960000),
(83950594, 0, NULL, 10097, 260, 1506609438, '0.0.0.0', 1506609438, NULL, 0, 0, 0, 0, 0, 0, '34020572', 0, NULL, NULL, NULL, 1506609558, 1506787200),
(83950595, 0, NULL, 10317, 260, 1506610300, '0.0.0.0', 1506610300, NULL, 0, 0, 0, 0, 0, 0, '49943256', 0, NULL, NULL, NULL, 1506610420, 1507219200),
(83950596, 0, NULL, 10333, 260, 1506611498, '0.0.0.0', 1506611498, NULL, 2, 0, 0, 0, 0, 0, '63471101', 0, 'http://12301.cc/Myal4r4', 'http://open.12301.cc/qr_img.php?code=YnrK', '074543', 1506611618, 1506787200),
(83950597, 0, NULL, 10131, 240, 1506612585, '0.0.0.0', 1506612585, NULL, 3, 0, 0, 0, 0, 0, '78586431', 2, 'http://12301.cc/MdV3g94', 'http://open.12301.cc/qr_img.php?code=mLa6D', '882537', 1506612705, 1506873600),
(83950598, 0, NULL, 10097, 260, 1506613536, '0.0.0.0', 1506613536, NULL, 0, 0, 0, 0, 0, 0, '97584587', 0, NULL, NULL, NULL, 1506613656, 1506787200),
(83950599, 0, NULL, 10088, 260, 1506613725, '0.0.0.0', 1506613725, NULL, 0, 0, 0, 0, 0, 0, '58144998', 0, NULL, NULL, NULL, 1506613845, 1507392000),
(83950600, 0, NULL, 10383, 260, 1506625325, '0.0.0.0', 1506625325, NULL, 0, 0, 0, 0, 0, 0, '56361126', 0, NULL, NULL, NULL, 1506625445, 1507219200),
(83950601, 0, NULL, 10097, 260, 1506636693, '0.0.0.0', 1506636693, NULL, 0, 0, 0, 0, 0, 0, '73530287', 0, NULL, NULL, NULL, 1506636813, 1506787200),
(83950602, 0, NULL, 10487, 260, 1506646642, '0.0.0.0', 1506646642, NULL, 0, 0, 0, 0, 0, 0, '31676941', 0, NULL, NULL, NULL, 1506646762, 1506787200),
(83950603, 0, NULL, 10375, 260, 1506647166, '0.0.0.0', 1506647166, NULL, 0, 0, 0, 0, 0, 0, '94478683', 0, NULL, NULL, NULL, 1506647286, 1506787200),
(83950604, 0, NULL, 10392, 260, 1506647412, '0.0.0.0', 1506647412, NULL, 3, 0, 0, 0, 0, 0, '44690295', 0, 'http://12301.cc/M9DnKXa', 'http://open.12301.cc/qr_img.php?code=', '873245', 1506647532, 1506787200),
(83950605, 0, NULL, 10392, 260, 1506647841, '0.0.0.0', 1506647841, NULL, 3, 0, 0, 0, 0, 0, '89929060', 0, 'http://12301.cc/MwElevW', 'http://open.12301.cc/qr_img.php?code=', '046192', 1506647961, 1506787200),
(83950606, 0, NULL, 10425, 260, 1506647891, '0.0.0.0', 1506647891, NULL, 0, 0, 0, 0, 0, 0, '84228596', 0, NULL, NULL, NULL, 1506648011, 1507305600),
(83950607, 0, NULL, 10085, 240, 1506647999, '0.0.0.0', 1506647999, NULL, 0, 0, 0, 0, 0, 0, '96874138', 2, NULL, NULL, NULL, 1506648119, 1507392000),
(83950608, 0, NULL, 10427, 240, 1506648155, '0.0.0.0', 1506648155, NULL, 3, 0, 0, 0, 0, 0, '92013556', 2, 'http://12301.cc/MWP4AvM', 'http://open.12301.cc/qr_img.php?code=', '079154', 1506648275, 1506960000),
(83950609, 0, NULL, 10460, 240, 1506648306, '0.0.0.0', 1506648306, NULL, 2, 0, 0, 0, 0, 0, '80143186', 2, 'http://12301.cc/MqyK2yq', 'http://open.12301.cc/qr_img.php?code=', '083214', 1506648426, 1507305600),
(83950610, 0, NULL, 10447, 240, 1506648466, '0.0.0.0', 1506648466, NULL, 0, 0, 0, 0, 0, 0, '89090307', 2, NULL, NULL, NULL, 1506648586, 1506960000),
(83950611, 0, NULL, 10447, 240, 1506648807, '0.0.0.0', 1506648807, NULL, 0, 0, 0, 0, 0, 0, '47902779', 2, NULL, NULL, NULL, 1506648927, 1506960000),
(83950612, 0, NULL, 10447, 240, 1506648863, '0.0.0.0', 1506648863, NULL, 0, 0, 0, 0, 0, 0, '57916455', 2, NULL, NULL, NULL, 1506648983, 1506960000),
(83950613, 0, NULL, 10539, 260, 1506651214, '0.0.0.0', 1506651214, NULL, 2, 0, 0, 0, 0, 0, '23327935', 0, 'http://12301.cc/MPdVxPV', 'http://open.12301.cc/qr_img.php?code=', '508419', 1506651334, 1506960000),
(83950614, 0, NULL, 10425, 240, 1506651987, '0.0.0.0', 1506651987, NULL, 0, 0, 0, 0, 0, 0, '25452707', 2, NULL, NULL, NULL, 1506652107, 1507305600),
(83950615, 0, NULL, 10560, 240, 1506653271, '0.0.0.0', 1506653271, NULL, 3, 0, 0, 0, 0, 0, '11928671', 2, 'http://12301.cc/MRy0KjP', 'http://open.12301.cc/qr_img.php?code=3NRRn', '210006', 1506653391, 1506960000),
(83950616, 0, NULL, 10600, 260, 1506654431, '0.0.0.0', 1506654431, NULL, 0, 0, 0, 0, 0, 0, '80054421', 0, NULL, NULL, NULL, 1506654551, 1506787200),
(83950617, 0, NULL, 10568, 240, 1506654547, '0.0.0.0', 1506654547, NULL, 0, 0, 0, 0, 0, 0, '85925178', 2, NULL, NULL, NULL, 1506654667, 1506960000),
(83950618, 0, NULL, 10600, 260, 1506654745, '0.0.0.0', 1506654745, NULL, 3, 0, 0, 0, 0, 0, '42878544', 0, 'http://12301.cc/MD8DK3B', 'http://open.12301.cc/qr_img.php?code=vYdXE', '440471', 1506654865, 1506787200),
(83950619, 0, NULL, 10600, 260, 1506654778, '0.0.0.0', 1506654778, NULL, 3, 0, 0, 0, 0, 0, '86445504', 0, 'http://12301.cc/MBZXLXE', 'http://open.12301.cc/qr_img.php?code=q5po4', '846512', 1506654898, 1506787200),
(83950620, 0, NULL, 10619, 260, 1506656457, '0.0.0.0', 1506656457, NULL, 2, 0, 0, 0, 0, 0, '35313694', 0, 'http://12301.cc/M8jaqgy', 'http://open.12301.cc/qr_img.php?code=eEj9n', '875452', 1506656577, 1506787200),
(83950621, 0, NULL, 10647, 260, 1506657964, '0.0.0.0', 1506657964, NULL, 2, 0, 0, 0, 0, 0, '92984165', 0, 'http://12301.cc/MZPMZwz', 'http://open.12301.cc/qr_img.php?code=8xP45', '568375', 1506658084, 1507219200),
(83950622, 0, NULL, 10592, 240, 1506657967, '0.0.0.0', 1506657967, NULL, 3, 0, 0, 0, 0, 0, '15791781', 2, 'http://12301.cc/Mqy538E', 'http://open.12301.cc/qr_img.php?code=bpZnp', '236370', 1506658087, 1506873600),
(83950623, 0, NULL, 10374, 260, 1506658546, '0.0.0.0', 1506658546, NULL, 0, 0, 0, 0, 0, 0, '61806121', 0, NULL, NULL, NULL, 1506658666, 1506873600),
(83950624, 0, NULL, 10374, 260, 1506658639, '0.0.0.0', 1506658639, NULL, 3, 0, 0, 0, 0, 0, '52579064', 0, 'http://12301.cc/MZPMZOv', 'http://open.12301.cc/qr_img.php?code=bnyXG', '425370', 1506658759, 1506873600),
(83950625, 0, NULL, 10374, 260, 1506658677, '0.0.0.0', 1506658677, NULL, 3, 0, 0, 0, 0, 0, '92726868', 0, 'http://12301.cc/M3489wy', 'http://open.12301.cc/qr_img.php?code=XaWP4', '476040', 1506658797, 1506873600),
(83950626, 0, NULL, 10617, 240, 1506660000, '0.0.0.0', 1506660000, NULL, 2, 0, 0, 0, 0, 0, '29972197', 2, 'http://12301.cc/M4raMbL', 'http://open.12301.cc/qr_img.php?code=mXgA', '082637', 1506660120, 1506787200),
(83950627, 0, NULL, 10085, 240, 1506667594, '0.0.0.0', 1506667594, NULL, 0, 0, 0, 0, 0, 0, '79748288', 2, NULL, NULL, NULL, 1506667714, 1506787200),
(83950628, 0, NULL, 10091, 260, 1506668212, '0.0.0.0', 1506668212, NULL, 0, 0, 0, 0, 0, 0, '45474727', 0, NULL, NULL, NULL, 1506668332, 1506787200),
(83950629, 0, NULL, 10705, 240, 1506670863, '0.0.0.0', 1506670863, NULL, 2, 0, 0, 0, 0, 0, '13263849', 2, 'http://12301.cc/Mqy5Kjd', 'http://open.12301.cc/qr_img.php?code=rlgGe', '373144', 1506670983, 1506960000),
(83950630, 0, NULL, 10425, 240, 1506675744, '0.0.0.0', 1506675744, NULL, 3, 0, 0, 0, 0, 0, '18120424', 2, 'http://12301.cc/MbKDDWg', 'http://open.12301.cc/qr_img.php?code=ZvBGV', '736428', 1506675864, 1507305600),
(83950631, 0, NULL, 10568, 240, 1506676420, '0.0.0.0', 1506676420, NULL, 3, 0, 0, 0, 0, 0, '18013328', 2, 'http://12301.cc/MwEqqAA', 'http://open.12301.cc/qr_img.php?code=GGYlW', '558753', 1506676540, 1506960000),
(83950632, 0, NULL, 10760, 260, 1506680330, '0.0.0.0', 1506680330, NULL, 2, 0, 0, 0, 0, 0, '18842612', 0, 'http://12301.cc/MlYRXAb', 'http://open.12301.cc/qr_img.php?code=VNMe6', '568180', 1506680450, 1506787200),
(83950633, 0, NULL, 10760, 260, 1506680390, '0.0.0.0', 1506680390, NULL, 2, 0, 0, 0, 0, 0, '20447695', 0, 'http://12301.cc/Mr9dmeY', 'http://open.12301.cc/qr_img.php?code=mLRb', '021137', 1506680510, 1506787200),
(83950634, 0, NULL, 10447, 240, 1506681097, '0.0.0.0', 1506681097, NULL, 0, 0, 0, 0, 0, 0, '96863849', 2, NULL, NULL, NULL, 1506681217, 1506960000),
(83950635, 0, NULL, 10447, 240, 1506681154, '0.0.0.0', 1506681154, NULL, 3, 0, 0, 0, 0, 0, '78488986', 2, 'http://12301.cc/MzB7mDz', 'http://open.12301.cc/qr_img.php?code=NwlYx', '636823', 1506681274, 1506960000),
(83950636, 0, NULL, 10663, 260, 1506681198, '0.0.0.0', 1506681198, NULL, 0, 0, 0, 0, 0, 0, '52128344', 0, NULL, NULL, NULL, 1506681318, 1507392000),
(83950637, 0, NULL, 10368, 250, 1506681220, '0.0.0.0', 1506681220, NULL, 3, 0, 0, 0, 0, 0, '72374757', 1, 'http://12301.cc/MWPm29y', 'http://open.12301.cc/qr_img.php?code=yMpwz', '541068', 1506681340, 1507219200),
(83950638, 0, NULL, 10113, 260, 1506684716, '0.0.0.0', 1506684716, NULL, 0, 0, 0, 0, 0, 0, '88078881', 0, NULL, NULL, NULL, 1506684836, 1507132800),
(83950639, 0, NULL, 10182, 260, 1506687888, '0.0.0.0', 1506687888, NULL, 3, 0, 0, 0, 0, 0, '81041182', 0, 'http://12301.cc/MME7aaN', 'http://open.12301.cc/qr_img.php?code=myKmA', '116781', 1506688008, 1507305600),
(83950640, 0, NULL, 10182, 260, 1506687935, '0.0.0.0', 1506687935, NULL, 0, 0, 0, 0, 0, 0, '73673630', 0, NULL, NULL, NULL, 1506688055, 1507305600),
(83950641, 0, NULL, 10182, 260, 1506688341, '0.0.0.0', 1506688341, NULL, 3, 0, 0, 0, 0, 0, '80943891', 0, 'http://12301.cc/MwEqORD', 'http://open.12301.cc/qr_img.php?code=MxPNR', '223458', 1506688461, 1507305600),
(83950642, 0, NULL, 10085, 240, 1506690837, '0.0.0.0', 1506690837, NULL, 0, 0, 0, 0, 0, 0, '15052009', 2, NULL, NULL, NULL, 1506690957, 1507392000),
(83950643, 0, NULL, 10456, 240, 1506691071, '0.0.0.0', 1506691071, NULL, 3, 0, 0, 0, 0, 0, '29107765', 2, 'http://12301.cc/Mjl53E2', 'http://open.12301.cc/qr_img.php?code=E00Ry', '437360', 1506691191, 1506960000),
(83950644, 0, NULL, 10825, 260, 1506695633, '0.0.0.0', 1506695633, NULL, 0, 0, 0, 0, 0, 0, '26239918', 0, NULL, NULL, NULL, 1506695753, 1506960000),
(83950645, 0, NULL, 10463, 260, 1506697528, '0.0.0.0', 1506697528, NULL, 3, 0, 0, 0, 0, 0, '63775085', 0, 'http://12301.cc/MRy0o5A', 'http://open.12301.cc/qr_img.php?code=yMaXL', '521768', 1506697648, 1506787200),
(83950646, 0, NULL, 10523, 260, 1506698799, '0.0.0.0', 1506698799, NULL, 0, 0, 0, 0, 0, 0, '39500245', 0, NULL, NULL, NULL, 1506698919, 1507219200),
(83950647, 0, NULL, 10844, 260, 1506700181, '0.0.0.0', 1506700181, NULL, 3, 0, 0, 0, 0, 0, '57354152', 0, 'http://12301.cc/MALpzBE', 'http://open.12301.cc/qr_img.php?code=eMXBn', '656508', 1506700301, 1506787200),
(83950648, 0, NULL, 10085, 240, 1506733423, '0.0.0.0', 1506733423, NULL, 0, 0, 0, 0, 0, 0, '77399675', 2, NULL, NULL, NULL, 1506733543, 1506787200),
(83950649, 0, NULL, 10441, 240, 1506733441, '0.0.0.0', 1506733441, NULL, 3, 0, 0, 0, 0, 0, '28047574', 2, 'http://12301.cc/MRy0m3A', 'http://open.12301.cc/qr_img.php?code=ZPRvv', '461128', 1506733561, 1506873600),
(83950650, 0, NULL, 10733, 260, 1506734285, '0.0.0.0', 1506734285, NULL, 3, 0, 0, 0, 0, 0, '79447072', 0, 'http://12301.cc/MBZXvga', 'http://open.12301.cc/qr_img.php?code=VvONp', '341036', 1506734405, 1506873600),
(83950651, 0, NULL, 10839, 260, 1506734407, '0.0.0.0', 1506734407, NULL, 0, 0, 0, 0, 0, 0, '60505845', 0, NULL, NULL, NULL, 1506734527, 1506960000),
(83950652, 0, NULL, 10839, 260, 1506734419, '0.0.0.0', 1506734419, NULL, 2, 0, 0, 0, 0, 0, '75744005', 0, 'http://12301.cc/MnnvNqD', 'http://open.12301.cc/qr_img.php?code=z3Ox7', '113705', 1506734539, 1506960000),
(83950653, 0, NULL, 10735, 260, 1506734567, '0.0.0.0', 1506734567, NULL, 3, 0, 0, 0, 0, 0, '74867131', 0, 'http://12301.cc/MLE7vnE', 'http://open.12301.cc/qr_img.php?code=4D3gj', '221842', 1506734687, 1506873600),
(83950654, 0, NULL, 10278, 250, 1506734988, '0.0.0.0', 1506734988, NULL, 0, 0, 0, 0, 0, 0, '49175854', 1, NULL, NULL, NULL, 1506735108, 1506960000),
(83950655, 0, NULL, 10278, 250, 1506735009, '0.0.0.0', 1506735009, NULL, 3, 0, 0, 0, 0, 0, '33886700', 1, 'http://12301.cc/MvYmNpR', 'http://open.12301.cc/qr_img.php?code=ylrKW', '718468', 1506735129, 1506873600),
(83950656, 0, NULL, 10879, 260, 1506737241, '0.0.0.0', 1506737241, NULL, 3, 0, 0, 0, 0, 0, '47772422', 0, 'http://12301.cc/MZPMq0l', 'http://open.12301.cc/qr_img.php?code=En0j', '068016', 1506737361, 1506873600),
(83950657, 0, NULL, 10884, 260, 1506737699, '0.0.0.0', 1506737699, NULL, 0, 0, 0, 0, 0, 0, '79028067', 0, NULL, NULL, NULL, 1506737819, 1507132800),
(83950658, 0, NULL, 10108, 260, 1506737837, '0.0.0.0', 1506737837, NULL, 0, 0, 0, 0, 0, 0, '26124478', 0, NULL, NULL, NULL, 1506737957, 1506787200),
(83950659, 0, NULL, 10091, 260, 1506738090, '0.0.0.0', 1506738090, NULL, 0, 0, 0, 0, 0, 0, '82141384', 0, NULL, NULL, NULL, 1506738210, 1506787200),
(83950660, 0, NULL, 10091, 260, 1506738101, '0.0.0.0', 1506738101, NULL, 0, 0, 0, 0, 0, 0, '44645971', 0, NULL, NULL, NULL, 1506738221, 1506787200),
(83950661, 0, NULL, 10085, 240, 1506739241, '0.0.0.0', 1506739241, NULL, 0, 0, 0, 0, 0, 0, '62746006', 2, NULL, NULL, NULL, 1506739361, 1506787200),
(83950662, 0, NULL, 10651, 240, 1506739257, '0.0.0.0', 1506739257, NULL, 3, 0, 0, 0, 0, 0, '25486214', 2, 'http://12301.cc/MObxqgG', 'http://open.12301.cc/qr_img.php?code=AAwzd', '680202', 1506739377, 1506787200),
(83950663, 0, NULL, 10108, 260, 1506739393, '0.0.0.0', 1506739393, NULL, 0, 0, 0, 0, 0, 0, '93464979', 0, NULL, NULL, NULL, 1506739513, 1507392000),
(83950664, 0, NULL, 10651, 240, 1506739595, '0.0.0.0', 1506739595, NULL, 3, 0, 0, 0, 0, 0, '28352363', 2, 'http://12301.cc/MaKDdnq', 'http://open.12301.cc/qr_img.php?code=44yM3', '513242', 1506739715, 1506787200),
(83950665, 0, NULL, 10906, 260, 1506740017, '0.0.0.0', 1506740017, NULL, 3, 0, 0, 0, 0, 0, '99077830', 0, 'http://12301.cc/M5wMYBP', 'http://open.12301.cc/qr_img.php?code=RYpvW', '528238', 1506740137, 1506873600),
(83950666, 0, NULL, 10387, 260, 1506740093, '0.0.0.0', 1506740093, NULL, 3, 0, 0, 0, 0, 0, '13212186', 0, 'http://12301.cc/MALpGD5', 'http://open.12301.cc/qr_img.php?code=9lWza', '648607', 1506740213, 1506873600),
(83950667, 0, NULL, 10906, 260, 1506740247, '0.0.0.0', 1506740247, NULL, 3, 0, 0, 0, 0, 0, '46958127', 0, 'http://12301.cc/Myay8RN', 'http://open.12301.cc/qr_img.php?code=KbeXZ', '555074', 1506740367, 1506873600),
(83950668, 0, NULL, 10825, 260, 1506740699, '0.0.0.0', 1506740699, NULL, 0, 0, 0, 0, 0, 0, '68404052', 0, NULL, NULL, NULL, 1506740819, 1506960000),
(83950669, 0, NULL, 10730, 260, 1506740713, '0.0.0.0', 1506740713, NULL, 3, 0, 0, 0, 0, 0, '83666046', 0, 'http://12301.cc/MwEq8eA', 'http://open.12301.cc/qr_img.php?code=ZKeOz', '680872', 1506740833, 1506960000),
(83950670, 0, NULL, 10825, 260, 1506740729, '0.0.0.0', 1506740729, NULL, 0, 0, 0, 0, 0, 0, '87244854', 0, NULL, NULL, NULL, 1506740849, 1506960000),
(83950671, 0, NULL, 10825, 260, 1506740758, '0.0.0.0', 1506740758, NULL, 3, 0, 0, 0, 0, 0, '99380160', 0, 'http://12301.cc/M0D4Mjn', 'http://open.12301.cc/qr_img.php?code=Od29K', '305254', 1506740878, 1506960000),
(83950672, 0, NULL, 10651, 240, 1506740912, '0.0.0.0', 1506740912, NULL, 3, 0, 0, 0, 0, 0, '67593974', 2, 'http://12301.cc/MLE7d0P', 'http://open.12301.cc/qr_img.php?code=bVbpA', '652526', 1506741032, 1506787200),
(83950673, 0, NULL, 10933, 260, 1506741471, '0.0.0.0', 1506741471, NULL, 0, 0, 0, 0, 0, 0, '64967340', 0, NULL, NULL, NULL, 1506741591, 1506873600),
(83950674, 0, NULL, 10933, 260, 1506741595, '0.0.0.0', 1506741595, NULL, 3, 0, 0, 0, 0, 0, '43476890', 0, 'http://12301.cc/M4raY9K', 'http://open.12301.cc/qr_img.php?code=789RD', '330015', 1506741715, 1506873600),
(83950675, 0, NULL, 10932, 260, 1506741750, '0.0.0.0', 1506741750, NULL, 3, 0, 0, 0, 0, 0, '97339455', 0, 'http://12301.cc/M242Egy', 'http://open.12301.cc/qr_img.php?code=dNrba', '366662', 1506741870, 1506787200),
(83950676, 0, NULL, 10343, 240, 1506742100, '0.0.0.0', 1506742100, NULL, 0, 0, 0, 0, 0, 0, '82210975', 2, NULL, NULL, NULL, 1506742220, 1507046400),
(83950677, 0, NULL, 10936, 240, 1506745731, '0.0.0.0', 1506745731, NULL, 0, 0, 0, 0, 0, 0, '77012238', 2, NULL, NULL, NULL, 1506745851, 1507219200),
(83950678, 0, NULL, 10936, 240, 1506745741, '0.0.0.0', 1506745741, NULL, 2, 0, 0, 0, 0, 0, '60704485', 2, 'http://12301.cc/M242jBl', 'http://open.12301.cc/qr_img.php?code=XKBP7', '141140', 1506745861, 1507219200),
(83950679, 0, NULL, 10590, 240, 1506745949, '0.0.0.0', 1506745949, NULL, 3, 0, 0, 0, 0, 0, '20589269', 2, 'http://12301.cc/M5wM95X', 'http://open.12301.cc/qr_img.php?code=mqLex', '276537', 1506746069, 1507305600),
(83950680, 0, NULL, 10496, 240, 1506747382, '0.0.0.0', 1506747382, NULL, 3, 0, 0, 0, 0, 0, '43672678', 2, 'http://12301.cc/Mjl57nG', 'http://open.12301.cc/qr_img.php?code=aNxGG', '314532', 1506747502, 1506787200),
(83950681, 0, NULL, 10468, 240, 1506747484, '0.0.0.0', 1506747484, NULL, 3, 0, 0, 0, 0, 0, '67097148', 2, 'http://12301.cc/M9DBWyW', 'http://open.12301.cc/qr_img.php?code=dNvpR', '403718', 1506747604, 1506787200),
(83950682, 0, NULL, 10461, 240, 1506748471, '0.0.0.0', 1506748471, NULL, 3, 0, 0, 0, 0, 0, '13492345', 2, 'http://12301.cc/MdVoG64', 'http://open.12301.cc/qr_img.php?code=eBovg', '373708', 1506748591, 1506787200),
(83950683, 0, NULL, 10933, 260, 1506749109, '0.0.0.0', 1506749109, NULL, 3, 0, 0, 0, 0, 0, '80603994', 0, 'http://12301.cc/MG0oByn', 'http://open.12301.cc/qr_img.php?code=jvB7r', '632348', 1506749229, 1506873600),
(83950684, 0, NULL, 10258, 240, 1506749903, '0.0.0.0', 1506749903, NULL, 3, 0, 0, 0, 0, 0, '44239324', 2, 'http://12301.cc/Mqy57Dq', 'http://open.12301.cc/qr_img.php?code=nv9O8', '788547', 1506750023, 1507305600),
(83950685, 0, NULL, 10853, 260, 1506751258, '0.0.0.0', 1506751258, NULL, 3, 0, 0, 0, 0, 0, '76700153', 0, 'http://12301.cc/Mp7lDPR', 'http://open.12301.cc/qr_img.php?code=BYG6d', '638434', 1506751378, 1506873600),
(83950686, 0, NULL, 10858, 260, 1506752039, '0.0.0.0', 1506752039, NULL, 3, 0, 0, 0, 0, 0, '23448366', 0, 'http://12301.cc/MnnvXyD', 'http://open.12301.cc/qr_img.php?code=BYOnW', '642734', 1506752159, 1506873600),
(83950687, 0, NULL, 10085, 240, 1506752992, '0.0.0.0', 1506752992, NULL, 0, 0, 0, 0, 0, 0, '91498109', 2, NULL, NULL, NULL, 1506753112, 1507392000),
(83950688, 0, NULL, 11002, 260, 1506753977, '0.0.0.0', 1506753977, NULL, 3, 0, 0, 0, 0, 0, '48666352', 0, 'http://12301.cc/MwEqGe6', 'http://open.12301.cc/qr_img.php?code=e6Rn', '072452', 1506754097, 1506873600),
(83950689, 0, NULL, 11006, 260, 1506754708, '0.0.0.0', 1506754708, NULL, 0, 0, 0, 0, 0, 0, '41768035', 0, NULL, NULL, NULL, 1506754828, 1506787200),
(83950690, 0, NULL, 10791, 260, 1506755487, '0.0.0.0', 1506755487, NULL, 3, 0, 0, 0, 0, 0, '91103776', 0, 'http://12301.cc/MZPMX74', 'http://open.12301.cc/qr_img.php?code=XqOov', '211684', 1506755607, 1506873600),
(83950691, 0, NULL, 10856, 260, 1506756556, '0.0.0.0', 1506756556, NULL, 2, 0, 0, 0, 0, 0, '56271927', 0, 'http://12301.cc/MzB7xrv', 'http://open.12301.cc/qr_img.php?code=34W5w', '504050', 1506756676, 1507046400),
(83950692, 0, NULL, 11022, 260, 1506758414, '0.0.0.0', 1506758414, NULL, 3, 0, 0, 0, 0, 0, '73008837', 0, 'http://12301.cc/MME76XR', 'http://open.12301.cc/qr_img.php?code=3NOoo', '233850', 1506758534, 1506787200),
(83950693, 0, NULL, 10849, 260, 1506758697, '0.0.0.0', 1506758697, NULL, 3, 0, 0, 0, 0, 0, '48276882', 0, 'http://12301.cc/Mxgan5a', 'http://open.12301.cc/qr_img.php?code=Y0l7N', '137887', 1506758817, 1506960000),
(83950694, 0, NULL, 11016, 260, 1506759050, '0.0.0.0', 1506759050, NULL, 0, 0, 0, 0, 0, 0, '36907584', 0, NULL, NULL, NULL, 1506759170, 1506787200),
(83950695, 0, NULL, 11016, 260, 1506759148, '0.0.0.0', 1506759148, NULL, 3, 0, 0, 0, 0, 0, '70023901', 0, 'http://12301.cc/M9DBom5', 'http://open.12301.cc/qr_img.php?code=qmZ0E', '647812', 1506759268, 1506787200),
(83950696, 0, NULL, 11004, 260, 1506759158, '0.0.0.0', 1506759158, NULL, 3, 0, 0, 0, 0, 0, '32690966', 0, 'http://12301.cc/MojEYjp', 'http://open.12301.cc/qr_img.php?code=KE94b', '475030', 1506759278, 1506787200),
(83950697, 0, NULL, 11004, 260, 1506759311, '0.0.0.0', 1506759311, NULL, 3, 0, 0, 0, 0, 0, '96222492', 0, 'http://12301.cc/MlYRjlM', 'http://open.12301.cc/qr_img.php?code=rMqj3', '657644', 1506759431, 1506787200),
(83950698, 0, NULL, 10725, 240, 1506765743, '0.0.0.0', 1506765743, NULL, 3, 0, 0, 0, 0, 0, '71957338', 2, 'http://12301.cc/Mjl5zBr', 'http://open.12301.cc/qr_img.php?code=YVp53', '561043', 1506765863, 1507132800),
(83950699, 0, NULL, 11037, 240, 1506766662, '0.0.0.0', 1506766662, NULL, 3, 0, 0, 0, 0, 0, '97157853', 2, 'http://12301.cc/MXaMNE7', 'http://open.12301.cc/qr_img.php?code=NA7xw', '273467', 1506766782, 1506873600),
(83950700, 0, NULL, 11055, 260, 1506767643, '0.0.0.0', 1506767643, NULL, 0, 0, 0, 0, 0, 0, '41462119', 0, NULL, NULL, NULL, 1506767763, 1506787200),
(83950701, 0, NULL, 11035, 250, 1506768882, '0.0.0.0', 1506768882, NULL, 3, 0, 0, 0, 0, 0, '42217234', 1, 'http://12301.cc/MALpOKR', 'http://open.12301.cc/qr_img.php?code=aMPb', '038276', 1506769002, 1506873600),
(83950702, 0, NULL, 10604, 260, 1506769027, '0.0.0.0', 1506769027, NULL, 0, 0, 0, 0, 0, 0, '38555145', 0, NULL, NULL, NULL, 1506769147, 1507219200),
(83950703, 0, NULL, 10604, 260, 1506769516, '0.0.0.0', 1506769516, NULL, 3, 0, 0, 0, 0, 0, '70032512', 0, 'http://12301.cc/MaKD6ly', 'http://open.12301.cc/qr_img.php?code=yAgxl', '677168', 1506769636, 1507219200),
(83950704, 0, NULL, 10604, 260, 1506769554, '0.0.0.0', 1506769554, NULL, 0, 0, 0, 0, 0, 0, '90152824', 0, NULL, NULL, NULL, 1506769674, 1507219200),
(83950705, 0, NULL, 10604, 260, 1506769619, '0.0.0.0', 1506769619, NULL, 3, 0, 0, 0, 0, 0, '22267936', 0, 'http://12301.cc/M242aOx', 'http://open.12301.cc/qr_img.php?code=OE4ER', '542354', 1506769739, 1507219200),
(83950706, 0, NULL, 10604, 260, 1506769697, '0.0.0.0', 1506769697, NULL, 3, 0, 0, 0, 0, 0, '93130627', 0, 'http://12301.cc/Mp7l6Zd', 'http://open.12301.cc/qr_img.php?code=Lr3pj', '323033', 1506769817, 1507219200),
(83950707, 0, NULL, 10238, 240, 1506769720, '0.0.0.0', 1506769720, NULL, 3, 0, 0, 0, 0, 0, '94476961', 2, 'http://12301.cc/M242am6', 'http://open.12301.cc/qr_img.php?code=OAKV0', '647110', 1506769840, 1506873600),
(83950708, 0, NULL, 11066, 260, 1506769800, '0.0.0.0', 1506769800, NULL, 3, 0, 0, 0, 0, 0, '46523539', 0, 'http://12301.cc/ME0DMn9', 'http://open.12301.cc/qr_img.php?code=jyr8g', '303748', 1506769920, 1507219200),
(83950709, 0, NULL, 10881, 250, 1506770002, '0.0.0.0', 1506770002, NULL, 0, 0, 0, 0, 0, 0, '64435962', 1, NULL, NULL, NULL, 1506770122, 1507219200),
(83950710, 0, NULL, 10881, 250, 1506770055, '0.0.0.0', 1506770055, NULL, 3, 0, 0, 0, 0, 0, '87295472', 1, 'http://12301.cc/MG0oEDn', 'http://open.12301.cc/qr_img.php?code=gojn', '051273', 1506770175, 1507219200),
(83950711, 0, NULL, 10238, 260, 1506770327, '0.0.0.0', 1506770327, NULL, 0, 0, 0, 0, 0, 0, '46683040', 0, NULL, NULL, NULL, 1506770447, 1506873600),
(83950712, 0, NULL, 11070, 260, 1506770377, '0.0.0.0', 1506770377, NULL, 3, 0, 0, 0, 0, 0, '83219634', 0, 'http://12301.cc/Mgv4xlO', 'http://open.12301.cc/qr_img.php?code=llRER', '615525', 1506770497, 1507219200),
(83950713, 0, NULL, 10238, 260, 1506770491, '0.0.0.0', 1506770491, NULL, 3, 0, 0, 0, 0, 0, '54436396', 0, 'http://12301.cc/MxgaBWv', 'http://open.12301.cc/qr_img.php?code=Y9Eo', '047887', 1506770611, 1506873600),
(83950714, 0, NULL, 11010, 260, 1506770672, '0.0.0.0', 1506770672, NULL, 3, 0, 0, 0, 0, 0, '49026633', 0, 'http://12301.cc/M7n29nX', 'http://open.12301.cc/qr_img.php?code=9aw2W', '301251', 1506770792, 1506873600),
(83950715, 0, NULL, 11010, 260, 1506770727, '0.0.0.0', 1506770727, NULL, 3, 0, 0, 0, 0, 0, '91233923', 0, 'http://12301.cc/MzB7VPv', 'http://open.12301.cc/qr_img.php?code=54YLY', '726463', 1506770847, 1506873600),
(83950716, 0, NULL, 10853, 240, 1506770951, '0.0.0.0', 1506770951, NULL, 3, 0, 0, 0, 0, 0, '53349303', 2, 'http://12301.cc/Mqy5voj', 'http://open.12301.cc/qr_img.php?code=PbEpe', '563757', 1506771071, 1506873600),
(83950717, 0, NULL, 11065, 240, 1506771275, '0.0.0.0', 1506771275, NULL, 3, 0, 0, 0, 0, 0, '12966573', 2, 'http://12301.cc/Mjl5Wae', 'http://open.12301.cc/qr_img.php?code=EdwR', '080516', 1506771395, 1506873600),
(83950718, 0, NULL, 11064, 250, 1506771288, '0.0.0.0', 1506771288, NULL, 3, 0, 0, 0, 0, 0, '38478784', 1, 'http://12301.cc/MXaMAn7', 'http://open.12301.cc/qr_img.php?code=W24yY', '867520', 1506771408, 1506873600),
(83950719, 0, NULL, 10582, 260, 1506771559, '0.0.0.0', 1506771559, NULL, 3, 0, 0, 0, 0, 0, '82634935', 0, 'http://12301.cc/MbKDqWg', 'http://open.12301.cc/qr_img.php?code=awx0W', '571076', 1506771679, 1507132800),
(83950720, 0, NULL, 11071, 250, 1506771864, '0.0.0.0', 1506771864, NULL, 3, 0, 0, 0, 0, 0, '32427699', 1, 'http://12301.cc/MALpxNE', 'http://open.12301.cc/qr_img.php?code=y0KwK', '264224', 1506771984, 1506873600),
(83950721, 0, NULL, 10140, 240, 1506773041, '0.0.0.0', 1506773041, NULL, 0, 0, 0, 0, 0, 0, '77213156', 2, NULL, NULL, NULL, 1506773161, 1506787200),
(83950722, 0, NULL, 10140, 240, 1506773069, '0.0.0.0', 1506773069, NULL, 3, 0, 0, 0, 0, 0, '70322301', 2, 'http://12301.cc/M242YZM', 'http://open.12301.cc/qr_img.php?code=BlKq', '063678', 1506773189, 1506787200),
(83950723, 0, NULL, 10168, 240, 1506773315, '0.0.0.0', 1506773315, NULL, 3, 0, 0, 0, 0, 0, '79085726', 2, 'http://12301.cc/Mr9dr7e', 'http://open.12301.cc/qr_img.php?code=jMKr', '080148', 1506773435, 1506787200),
(83950724, 0, NULL, 10113, 260, 1506773462, '0.0.0.0', 1506773462, NULL, 3, 0, 0, 0, 0, 0, '92328769', 0, 'http://12301.cc/MlYRLAD', 'http://open.12301.cc/qr_img.php?code=B0eN4', '558878', 1506773582, 1507132800),
(83950725, 0, NULL, 10085, 240, 1506773601, '0.0.0.0', 1506773601, NULL, 0, 0, 0, 0, 0, 0, '80513215', 2, NULL, NULL, NULL, 1506773721, 1507392000),
(83950726, 0, NULL, 10518, 260, 1506773655, '0.0.0.0', 1506773655, NULL, 3, 0, 0, 0, 0, 0, '22761688', 0, 'http://12301.cc/MRy09O7', 'http://open.12301.cc/qr_img.php?code=GRznM', '750353', 1506773775, 1507132800),
(83950727, 0, NULL, 11087, 260, 1506773931, '0.0.0.0', 1506773931, NULL, 0, 0, 0, 0, 0, 0, '59473846', 0, NULL, NULL, NULL, 1506774051, 1506787200),
(83950728, 0, NULL, 10585, 240, 1506775381, '0.0.0.0', 1506775381, NULL, 3, 0, 0, 0, 0, 0, '41284852', 2, 'http://12301.cc/M9DBb2x', 'http://open.12301.cc/qr_img.php?code=nngqN', '458147', 1506775501, 1506873600),
(83950729, 0, NULL, 10587, 240, 1506775616, '0.0.0.0', 1506775616, NULL, 3, 0, 0, 0, 0, 0, '27346297', 2, 'http://12301.cc/ME0DRZZ', 'http://open.12301.cc/qr_img.php?code=eNzM9', '437852', 1506775736, 1506873600),
(83950730, 0, NULL, 10597, 240, 1506776156, '0.0.0.0', 1506776156, NULL, 3, 0, 0, 0, 0, 0, '24556369', 2, 'http://12301.cc/MVybDVp', 'http://open.12301.cc/qr_img.php?code=oMVX9', '246883', 1506776276, 1506873600),
(83950731, 0, NULL, 10212, 250, 1506779244, '0.0.0.0', 1506779244, NULL, 0, 0, 0, 0, 0, 0, '38043417', 1, NULL, NULL, NULL, 1506779364, 1506960000),
(83950732, 0, NULL, 10212, 250, 1506779256, '0.0.0.0', 1506779256, NULL, 0, 0, 0, 0, 0, 0, '90255847', 1, NULL, NULL, NULL, 1506779376, 1506873600),
(83950733, 0, NULL, 10200, 260, 1506781273, '0.0.0.0', 1506781273, NULL, 0, 0, 0, 0, 0, 0, '97974968', 0, NULL, NULL, NULL, 1506781393, 1506873600),
(83950734, 0, NULL, 10968, 260, 1506782119, '0.0.0.0', 1506782119, NULL, 2, 0, 0, 0, 0, 0, '73617456', 0, 'http://12301.cc/MALEmYx', 'http://open.12301.cc/qr_img.php?code=Z8Ojv', '230128', 1506782239, 1507132800),
(83950735, 0, NULL, 10968, 260, 1506782196, '0.0.0.0', 1506782196, NULL, 2, 0, 0, 0, 0, 0, '99685317', 0, 'http://12301.cc/MxgbjDr', 'http://open.12301.cc/qr_img.php?code=PNZPd', '368813', 1506782316, 1507132800),
(83950736, 0, NULL, 11109, 240, 1506782359, '0.0.0.0', 1506782359, NULL, 3, 0, 0, 0, 0, 0, '71761885', 2, 'http://12301.cc/MwE0yAj', 'http://open.12301.cc/qr_img.php?code=qdgMK', '405556', 1506782479, 1506873600),
(83950737, 0, NULL, 11108, 260, 1506782472, '0.0.0.0', 1506782472, NULL, 2, 0, 0, 0, 0, 0, '79745542', 0, 'http://12301.cc/M34mp0N', 'http://open.12301.cc/qr_img.php?code=MxyNe', '204114', 1506782592, 1507046400),
(83950738, 0, NULL, 11111, 260, 1506783298, '0.0.0.0', 1506783298, NULL, 2, 0, 0, 0, 0, 0, '98255757', 0, 'http://12301.cc/MD8MEB9', 'http://open.12301.cc/qr_img.php?code=nwja', '024303', 1506783418, 1506787200),
(83950739, 0, NULL, 10085, 240, 1506784016, '0.0.0.0', 1506784016, NULL, 0, 0, 0, 0, 0, 0, '73850556', 2, NULL, NULL, NULL, 1506784136, 1507392000),
(83950740, 0, NULL, 11134, 260, 1506784256, '0.0.0.0', 1506784256, NULL, 0, 0, 0, 0, 0, 0, '24149611', 0, NULL, NULL, NULL, 1506784376, 1506873600),
(83950741, 0, NULL, 11109, 240, 1506784349, '0.0.0.0', 1506784349, NULL, 3, 0, 0, 0, 0, 0, '87409474', 2, 'http://12301.cc/MnnEPWV', 'http://open.12301.cc/qr_img.php?code=P80V', '084313', 1506784469, 1506873600),
(83950742, 0, NULL, 11050, 240, 1506784831, '0.0.0.0', 1506784831, NULL, 3, 0, 0, 0, 0, 0, '96054425', 2, 'http://12301.cc/Mr9mWe4', 'http://open.12301.cc/qr_img.php?code=4b2pD', '745186', 1506784951, 1506873600),
(83950743, 0, NULL, 10084, 240, 1506785099, '0.0.0.0', 1506785099, NULL, 2, 0, 0, 0, 0, 0, '72929321', 2, 'http://12301.cc/Mqyox7e', 'http://open.12301.cc/qr_img.php?code=NVgYv', '137367', 1506785219, 1506873600),
(83950744, 0, NULL, 11104, 260, 1506785417, '0.0.0.0', 1506785417, NULL, 3, 0, 0, 0, 0, 0, '76130042', 0, 'http://12301.cc/Mr9mWrY', 'http://open.12301.cc/qr_img.php?code=VV9AP', '216380', 1506785537, 1506960000),
(83950745, 0, NULL, 11059, 260, 1506785466, '0.0.0.0', 1506785466, NULL, 3, 0, 0, 0, 0, 0, '63874753', 0, 'http://12301.cc/MKE8Pyz', 'http://open.12301.cc/qr_img.php?code=3lE83', '168850', 1506785586, 1506873600),
(83950746, 0, NULL, 11141, 260, 1506785657, '0.0.0.0', 1506785657, NULL, 0, 0, 0, 0, 0, 0, '23590968', 0, NULL, NULL, NULL, 1506785777, 1506960000),
(83950747, 0, NULL, 11141, 260, 1506785807, '0.0.0.0', 1506785807, NULL, 3, 0, 0, 0, 0, 0, '74075130', 0, 'http://12301.cc/MeNEWMg', 'http://open.12301.cc/qr_img.php?code=ydWnL', '241268', 1506785927, 1506960000),
(83950748, 0, NULL, 10200, 260, 1506785884, '0.0.0.0', 1506785884, NULL, 0, 0, 0, 0, 0, 0, '21159813', 0, NULL, NULL, NULL, 1506786004, 1506873600),
(83950749, 0, NULL, 10200, 260, 1506785921, '0.0.0.0', 1506785921, NULL, 3, 0, 0, 0, 0, 0, '16260530', 0, 'http://12301.cc/Mr9m5LL', 'http://open.12301.cc/qr_img.php?code=r5R33', '306788', 1506786041, 1506873600),
(83950750, 0, NULL, 11143, 260, 1506787091, '0.0.0.0', 1506787091, NULL, 3, 0, 0, 0, 0, 0, '35002880', 0, 'http://12301.cc/MgvEyLv', 'http://open.12301.cc/qr_img.php?code=nmKBD', '014792', 1506787211, 1506873600);

-- --------------------------------------------------------

--
-- 表的结构 `bao_order_goods`
--

CREATE TABLE `bao_order_goods` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `tui_uid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_order_goods`
--

INSERT INTO `bao_order_goods` (`id`, `order_id`, `goods_id`, `shop_id`, `num`, `price`, `total_price`, `js_price`, `status`, `create_time`, `create_ip`, `update_time`, `update_ip`, `is_daofu`, `tui_uid`) VALUES
(169, 83950579, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(170, 83950580, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(171, 83950581, 2, NULL, 1, 260, 250, 0, 0, 0, NULL, 0, NULL, 0, 0),
(172, 83950582, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(173, 83950583, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(174, 83950584, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(175, 83950585, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(176, 83950586, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(177, 83950587, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(178, 83950588, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(179, 83950589, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(180, 83950590, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(181, 83950591, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(182, 83950592, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(183, 83950593, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(184, 83950594, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(185, 83950595, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(186, 83950596, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(187, 83950597, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(188, 83950598, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(189, 83950599, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(190, 83950600, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(191, 83950601, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(192, 83950602, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(193, 83950603, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(194, 83950604, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(195, 83950605, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(196, 83950606, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(197, 83950607, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(198, 83950608, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(199, 83950609, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(200, 83950610, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(201, 83950611, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(202, 83950612, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(203, 83950613, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(204, 83950614, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(205, 83950615, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(206, 83950616, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(207, 83950617, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(208, 83950618, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(209, 83950619, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(210, 83950620, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(211, 83950621, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(212, 83950622, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(213, 83950623, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(214, 83950624, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(215, 83950625, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(216, 83950626, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(217, 83950627, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(218, 83950628, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(219, 83950629, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(220, 83950630, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(221, 83950631, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(222, 83950632, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(223, 83950633, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(224, 83950634, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(225, 83950635, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(226, 83950636, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(227, 83950637, 2, NULL, 1, 260, 250, 0, 0, 0, NULL, 0, NULL, 0, 0),
(228, 83950638, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(229, 83950639, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(230, 83950640, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(231, 83950641, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(232, 83950642, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(233, 83950643, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(234, 83950644, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(235, 83950645, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(236, 83950646, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(237, 83950647, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(238, 83950648, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(239, 83950649, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(240, 83950650, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(241, 83950651, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(242, 83950652, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(243, 83950653, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(244, 83950654, 2, NULL, 1, 260, 250, 0, 0, 0, NULL, 0, NULL, 0, 0),
(245, 83950655, 2, NULL, 1, 260, 250, 0, 0, 0, NULL, 0, NULL, 0, 0),
(246, 83950656, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(247, 83950657, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(248, 83950658, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(249, 83950659, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(250, 83950660, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(251, 83950661, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(252, 83950662, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(253, 83950663, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(254, 83950664, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(255, 83950665, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(256, 83950666, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(257, 83950667, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(258, 83950668, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(259, 83950669, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(260, 83950670, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(261, 83950671, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(262, 83950672, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(263, 83950673, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(264, 83950674, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(265, 83950675, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(266, 83950676, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(267, 83950677, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(268, 83950678, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(269, 83950679, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(270, 83950680, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(271, 83950681, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(272, 83950682, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(273, 83950683, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(274, 83950684, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(275, 83950685, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(276, 83950686, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(277, 83950687, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(278, 83950688, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(279, 83950689, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(280, 83950690, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(281, 83950691, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(282, 83950692, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(283, 83950693, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(284, 83950694, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(285, 83950695, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(286, 83950696, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(287, 83950697, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(288, 83950698, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(289, 83950699, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(290, 83950700, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(291, 83950701, 2, NULL, 1, 260, 250, 0, 0, 0, NULL, 0, NULL, 0, 0),
(292, 83950702, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(293, 83950703, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(294, 83950704, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(295, 83950705, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(296, 83950706, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(297, 83950707, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(298, 83950708, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(299, 83950709, 2, NULL, 1, 260, 250, 0, 0, 0, NULL, 0, NULL, 0, 0),
(300, 83950710, 2, NULL, 1, 260, 250, 0, 0, 0, NULL, 0, NULL, 0, 0),
(301, 83950711, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(302, 83950712, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(303, 83950713, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(304, 83950714, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(305, 83950715, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(306, 83950716, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(307, 83950717, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(308, 83950718, 2, NULL, 1, 260, 250, 0, 0, 0, NULL, 0, NULL, 0, 0),
(309, 83950719, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(310, 83950720, 2, NULL, 1, 260, 250, 0, 0, 0, NULL, 0, NULL, 0, 0),
(311, 83950721, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(312, 83950722, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(313, 83950723, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(314, 83950724, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(315, 83950725, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(316, 83950726, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(317, 83950727, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(318, 83950728, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(319, 83950729, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(320, 83950730, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(321, 83950731, 2, NULL, 1, 260, 250, 0, 0, 0, NULL, 0, NULL, 0, 0),
(322, 83950732, 2, NULL, 1, 260, 250, 0, 0, 0, NULL, 0, NULL, 0, 0),
(323, 83950733, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(324, 83950734, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(325, 83950735, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(326, 83950736, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(327, 83950737, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(328, 83950738, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(329, 83950739, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(330, 83950740, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(331, 83950741, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(332, 83950742, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(333, 83950743, 2, NULL, 1, 260, 240, 0, 0, 0, NULL, 0, NULL, 0, 0),
(334, 83950744, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(335, 83950745, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(336, 83950746, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(337, 83950747, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(338, 83950748, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(339, 83950749, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0),
(340, 83950750, 2, NULL, 1, 260, 260, 0, 0, 0, NULL, 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `bao_order_pick`
--

CREATE TABLE `bao_order_pick` (
  `pick_id` int(11) UNSIGNED NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT '0',
  `name` varchar(64) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `order_ids` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_order_pick`
--

INSERT INTO `bao_order_pick` (`pick_id`, `admin_id`, `shop_id`, `name`, `create_time`, `create_ip`, `order_ids`) VALUES
(4, 1, 0, '捡货单2015-04-11 15:01:36', 1428735695, '127.0.0.1', '100071,100073,100074,100081,100082,100083,100084,100097,100100'),
(5, 1, 0, '捡货单2015-04-11 15:06:44', 1428736003, '127.0.0.1', '100054,100055,100056,100057,100059,100060,100064,100099'),
(6, 0, 1, '捡货单2015-04-13 19:49:15', 1428925754, '127.0.0.1', '100111'),
(7, 0, 1, '捡货单2015-04-13 20:02:38', 1428926557, '127.0.0.1', '100110'),
(8, 0, 1, '捡货单2015-05-16 08:52:44', 1431737563, '127.0.0.1', '100124'),
(9, 0, 95, '捡货单2015-06-01 14:27:18', 1433140037, '127.0.0.1', '100125,100127'),
(10, 0, 95, '捡货单2015-06-01 14:51:44', 1433141503, '127.0.0.1', '100134'),
(13, 0, 1, '捡货单2015-08-05 14:42:43', 1438756962, '127.0.0.1', '100117,100121'),
(14, 0, 1, '捡货单2015-08-05 15:17:25', 1438759044, '127.0.0.1', '100117'),
(15, 0, 1, '捡货单2015-08-13 12:02:55', 1439438575, '127.0.0.1', '100121'),
(16, 1, 0, '捡货单2015-08-19 15:08:01', 1439968080, '127.0.0.1', '100061,100066'),
(17, 0, 1, '捡货单2015-08-26 14:13:03', 1440569582, '127.0.0.1', '100350'),
(18, 0, 139, '捡货单2015-11-11 12:07:52', 1447214872, '61.149.87.175', '100549'),
(19, 0, 139, '捡货单2015-11-11 12:14:18', 1447215258, '127.145.56.183', '100550,100552,100553');

-- --------------------------------------------------------

--
-- 表的结构 `bao_payment`
--

CREATE TABLE `bao_payment` (
  `payment_id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `logo` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `mobile_logo` varchar(32) DEFAULT NULL,
  `contents` varchar(1024) DEFAULT NULL,
  `setting` text,
  `is_mobile_only` tinyint(1) DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_payment`
--

INSERT INTO `bao_payment` (`payment_id`, `name`, `logo`, `code`, `mobile_logo`, `contents`, `setting`, `is_mobile_only`, `is_open`) VALUES
(1, '支付宝', 'alipay.png', 'alipay', 'alipay_mobile.png', '支付宝（中国）网络技术有限公司是国内领先的第三方支付平台，致力于提供“简单、安全、快速”的支付解决方案。支付宝公司从2004年建立开始，始终以“信任”作为产品和服务的核心。作为中国主流的第三方支付平台，我们不仅从产品上确保用户在线支付的安全，同时致力于通过担保交易等创新让用户通过支付宝在网络间建立信任的关系，去帮助建设更纯净的互联网环境。', 'a:8:{s:7:\"service\";s:1:\"1\";s:14:\"alipay_partner\";s:16:\"2088802062480213\";s:10:\"alipay_key\";s:32:\"qmy06qjq300zzkn52jy2hrg5yoa6izgt\";s:14:\"alipay_account\";s:16:\"283068487@qq.com\";s:18:\"alipay_app_partner\";s:0:\"\";s:17:\"alipay_app_seller\";s:0:\"\";s:18:\"alipay_app_private\";s:0:\"\";s:17:\"alipay_app_public\";s:0:\"\";}', 0, 1),
(2, '财付通', 'tenpay.png', 'tenpay', 'tenpay_mobile.png', '财付通（https://www.tenpay.com/v2/）是腾讯集团旗下中国领先的第三方支付平台，一直致力于为互联网用户和企业提供安全、便捷、专业的在线支付服务。自2005年成立伊始，财付通就以“安全便捷”作为产品和服务的核心，不仅为个人用户创造200多种便民服务和应用场景，还为40多万大中型企业提供专业的资金结算解决方案。', 'a:2:{s:14:\"tenpay_account\";s:4:\"1111\";s:10:\"tenpay_key\";s:4:\"1111\";}', 0, 1),
(3, '微信支付', 'weixin.png', 'weixin', 'weixin_mobile.png', '微信支付是由腾讯公司知名移动社交通讯软件微信及第三方支付平台财付通联合推出的移动支付创新产品，旨在为广大微信用户及商户提供更优质的支付服务，微信的支付和安全系统由腾讯财付通提供支持。财付通是持有互联网支付牌照并具备完备的安全体系的第三方支付平台。', 'a:4:{s:5:\"appid\";s:9:\"111111111\";s:9:\"appsecret\";s:11:\"11111111111\";s:5:\"mchid\";s:12:\"111111111111\";s:6:\"appkey\";s:15:\"111111111111111\";}', 1, 1),
(4, '余额支付', 'money.png', 'money', 'money_mobile.png', '余额支付是最方便快捷的', '{s:5:\"appid\";s:0:\"\";s:10:\"paysignkey\";s:0:\"\";s:9:\"appsecret\";s:0:\"\";s:9:\"partnerid\";s:0:\"\";s:10:\"partnerkey\";s:0:\"\";}', 0, 1),
(5, '银联支付', 'chinapay.png', 'chinapay', 'chinapay_mobile.png', '银联在线支付是中国银联推出的网上支付平台，支持多家发卡银行，涵盖借记卡和信用卡等，包含认证支付、快捷支付和网银支付多种方式，其中认证和快捷支付无需开通网银，仅需一张银行卡，即可享受安全、快捷的网上支付服务！www.chinapay.com', 'a:3:{s:16:\"chinapay_merabbr\";s:0:\"\";s:16:\"chinapay_account\";s:0:\"\";s:12:\"chinapay_key\";s:0:\"\";}', 0, 1),
(6, '网银在线', 'chinabank.png', 'chinabank', 'chinabank_mobile.png', '网银在线（www.chinabank.com.cn）与中国工商银行、招商银行、中国建设银行、农业银行、民生银行等数十家金融机构达成协议。全面支持全国19家银行的信用卡及借记卡实现网上支付。', 'a:2:{s:17:\"chinabank_account\";s:0:\"\";s:13:\"chinabank_key\";s:0:\"\";}', 0, 1),
(7, 'paypal', 'paypal.png', 'paypal', 'paypal_mobile.png', 'PayPal（www.paypal.com） 是在线付款解决方案的全球领导者，在全世界有超过七千一百六十万个帐户用户。PayPal 可在 56 个市场以 7 种货币（加元、欧元、英镑、美元、日元、澳元、港元）使用。', 'a:4:{s:18:\"paypal_ec_username\";s:0:\"\";s:18:\"paypal_ec_password\";s:0:\"\";s:19:\"paypal_ec_signature\";s:0:\"\";s:18:\"paypal_ec_currency\";s:3:\"AUD\";}', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `bao_payment_logs`
--

CREATE TABLE `bao_payment_logs` (
  `log_id` int(10) UNSIGNED NOT NULL,
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
  `is_paid` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_payment_logs`
--

INSERT INTO `bao_payment_logs` (`log_id`, `user_id`, `type`, `order_id`, `order_ids`, `code`, `need_pay`, `create_time`, `create_ip`, `pay_time`, `pay_ip`, `is_paid`) VALUES
(154, 214, 'money', 0, NULL, 'alipay', 20000, 1506243188, '175.13.159.75', NULL, NULL, 0),
(155, 1, 'tuan', 100641, NULL, '67446704', 260, 1506245673, '175.13.158.53', NULL, NULL, 0),
(156, 1, 'tuan', 100642, NULL, '53181966', 260, 1506245712, '175.13.158.53', NULL, NULL, 0),
(157, 1, '', 100644, NULL, '28054829', 260, 1506245883, '175.13.158.53', NULL, NULL, 0),
(158, 1, '', 100645, NULL, '56125645', 260, 1506245966, '175.13.158.53', NULL, NULL, 0),
(159, 1, '', 100646, NULL, '98976516', 260, 1506246087, '175.13.158.53', NULL, NULL, 0),
(160, 1, '', 100647, NULL, 'mobile', 520, 1506246193, '175.13.158.53', NULL, NULL, 0),
(161, 1, '', 100648, NULL, 'mobile', 260, 1506246232, '175.13.158.53', NULL, NULL, 0),
(162, 1, '', 100649, NULL, 'mobile', 520, 1506246297, '175.13.158.53', NULL, NULL, 0),
(163, 1, '', 100650, NULL, 'mobile', 260, 1506246374, '175.13.158.53', NULL, NULL, 0),
(164, 1, '', 100651, NULL, 'mobile', 260, 1506246395, '175.13.158.53', NULL, NULL, 0),
(165, 1, '', 100652, NULL, 'mobile', 260, 1506246613, '175.13.158.53', NULL, NULL, 0),
(166, 1, '', 100653, NULL, 'mobile', 260, 1506247391, '118.250.149.20', NULL, NULL, 0),
(167, 1, '', 100654, NULL, 'mobile', 520, 1506247427, '220.202.152.28', NULL, NULL, 0),
(168, 1, '', 100655, NULL, 'mobile', 260, 1506247446, '175.13.158.53', NULL, NULL, 0),
(169, 1, '', 100656, NULL, 'mobile', 260, 1506247466, '118.250.149.20', NULL, NULL, 0),
(170, 1, '', 100657, NULL, 'mobile', 260, 1506247511, '220.202.152.84', NULL, NULL, 0),
(171, 1, '', 100658, NULL, 'mobile', 260, 1506247548, '220.202.152.84', NULL, NULL, 0),
(172, 1, '', 100659, NULL, 'mobile', 260, 1506247555, '175.13.159.75', NULL, NULL, 0),
(173, 1, '', 100660, NULL, 'mobile', 260, 1506247564, '220.202.152.84', NULL, NULL, 0),
(174, 1, '', 100661, NULL, 'mobile', 260, 1506247593, '175.13.159.75', NULL, NULL, 0),
(175, 1, '', 100662, NULL, 'mobile', 260, 1506247601, '175.13.159.75', NULL, NULL, 0),
(176, 1, '', 100663, NULL, 'mobile', 260, 1506247603, '175.13.159.75', NULL, NULL, 0),
(177, 1, '', 100664, NULL, 'mobile', 260, 1506247964, '175.13.159.75', NULL, NULL, 0),
(178, 1, '', 100665, NULL, 'mobile', 260, 1506248448, '220.202.152.84', NULL, NULL, 0),
(179, 1, '', 100666, NULL, 'mobile', 260, 1506248952, '220.202.152.84', NULL, NULL, 0),
(180, 1, '', 100667, NULL, 'weixin', 780, 1506253984, '113.246.153.37', NULL, NULL, 0),
(181, 1, '', 100668, NULL, 'weixin', 260, 1506253996, '113.246.153.37', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `bao_piaofutong_callback`
--

CREATE TABLE `bao_piaofutong_callback` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `data` varchar(2000) DEFAULT NULL,
  `create_time` int(11) DEFAULT '100',
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_piaofutong_callback`
--

INSERT INTO `bao_piaofutong_callback` (`id`, `data`, `create_time`, `create_ip`) VALUES
(1, '{\"VerifyCode\":\"ab54f9d58e7774b14750ff468ce25a67\",\"Order16U\":\"16377955\",\"ActionTime\":\"2017-09-26 19:35:03\",\"OrderCall\":\"LTTX707164\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":0,\"RefundFee\":0}', 1506425703, '121.43.119.39'),
(2, '{\"VerifyCode\":\"ab54f9d58e7774b14750ff468ce25a67\",\"Order16U\":\"16377954\",\"ActionTime\":\"2017-09-26 19:48:51\",\"OrderCall\":\"LTTX707158\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":0,\"RefundFee\":0}', 1506426531, '121.43.119.39'),
(3, '{\"VerifyCode\":\"ab54f9d58e7774b14750ff468ce25a67\",\"Order16U\":\"16377956\",\"ActionTime\":\"2017-09-26 20:10:19\",\"OrderCall\":\"LTTX707175\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":0,\"RefundFee\":0}', 1506427819, '121.43.119.39'),
(4, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19458087\",\"ActionTime\":\"2017-09-27 13:43:43\",\"OrderCall\":\"\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506491024, '114.55.115.148'),
(5, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19458135\",\"ActionTime\":\"2017-09-27 13:43:48\",\"OrderCall\":\"1506483807\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506491029, '114.55.115.148'),
(6, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505201, '114.55.115.148'),
(7, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505204, '121.199.25.173'),
(8, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505210, '114.55.115.148'),
(9, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505215, '121.199.25.173'),
(10, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505216, '121.199.25.173'),
(11, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505222, '114.55.115.148'),
(12, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505223, '114.55.115.148'),
(13, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505225, '114.55.115.148'),
(14, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505231, '114.55.115.148'),
(15, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505233, '114.55.115.148'),
(16, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505235, '114.55.115.148'),
(17, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505238, '114.55.115.148'),
(18, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505243, '114.55.115.148'),
(19, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505243, '114.55.115.148'),
(20, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505244, '114.55.115.148'),
(21, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505255, '114.55.115.148'),
(22, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505258, '114.55.115.148'),
(23, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505261, '114.55.115.148'),
(24, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505266, '121.199.25.173'),
(25, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505268, '121.199.25.173'),
(26, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505270, '114.55.115.148'),
(27, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505273, '114.55.115.148'),
(28, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505275, '121.199.25.173'),
(29, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505278, '114.55.115.148'),
(30, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506505280, '121.199.25.173'),
(31, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506510303, '121.199.25.173'),
(32, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506510304, '121.199.25.173'),
(33, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506517460, '114.55.115.148'),
(34, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506517466, '114.55.115.148'),
(35, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506517469, '114.55.115.148'),
(36, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506517476, '114.55.115.148'),
(37, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506517480, '114.55.115.148'),
(38, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506517489, '114.55.115.148'),
(39, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506522332, '121.199.25.173'),
(40, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506522334, '121.199.25.173'),
(41, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506524102, '121.199.25.173'),
(42, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506524103, '121.199.25.173'),
(43, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506524104, '121.199.25.173'),
(44, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506524105, '121.199.25.173'),
(45, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506526203, '121.199.25.173'),
(46, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506526233, '121.199.25.173'),
(47, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506527103, '121.199.25.173'),
(48, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506527402, '121.199.25.173'),
(49, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506527403, '121.199.25.173'),
(50, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506528003, '121.199.25.173'),
(51, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506528583, '114.55.115.148'),
(52, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506528586, '114.55.115.148'),
(53, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506528589, '121.199.25.173'),
(54, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506528591, '114.55.115.148'),
(55, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506528593, '114.55.115.148'),
(56, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506528596, '114.55.115.148'),
(57, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506528599, '114.55.115.148'),
(58, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506528601, '114.55.115.148'),
(59, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506528603, '121.199.25.173'),
(60, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506528603, '114.55.115.148'),
(61, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506528609, '121.199.25.173'),
(62, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506528611, '114.55.115.148'),
(63, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506528613, '114.55.115.148'),
(64, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506529203, '121.199.25.173'),
(65, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506529803, '121.199.25.173'),
(66, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506529804, '121.199.25.173'),
(67, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531430, '175.13.159.197'),
(68, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531431, '175.13.159.197'),
(69, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531432, '175.13.159.197'),
(70, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531433, '175.13.159.197'),
(71, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531433, '175.13.159.197'),
(72, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531433, '175.13.159.197'),
(73, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531434, '175.13.159.197'),
(74, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531434, '175.13.159.197'),
(75, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531435, '175.13.159.197'),
(76, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531435, '175.13.159.197'),
(77, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"2175807442-22710996\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531436, '175.13.159.197'),
(78, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"241\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531499, '175.13.159.197'),
(79, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"241\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531500, '175.13.159.197'),
(80, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"241\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531501, '175.13.159.197'),
(81, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"241\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531501, '175.13.159.197'),
(82, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"241\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531501, '175.13.159.197'),
(83, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"241\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531501, '175.13.159.197'),
(84, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"241\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531501, '175.13.159.197'),
(85, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"241\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531502, '175.13.159.197'),
(86, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"241\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531527, '175.13.159.197'),
(87, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"241\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531548, '175.13.159.197'),
(88, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"241\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531549, '175.13.159.197'),
(89, '{\"VerifyCode\" :\"aa67c1bf2b411a3617c9d9e224582458\" ,\"Order16U\" ;\"4694891\" ,”\nActionTime\":\"2016-06-14\n16:44: 35\",\"OrderCall :\"241\" ,\"Tnumber\" :\"3\",\"Orderstate\" :\n1,\"AllCheckNum\" :\"3\",\"Source\" :\"4\",\"Action\" :\"1\"}', 1506531549, '175.13.159.197'),
(90, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473361\",\"ActionTime\":\"17171717-SepSep-2828 0101:0909:3434\",\"OrderCall\":\"243\",\"Tnumber\":\"2\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506532234, '121.199.25.173'),
(91, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473362\",\"ActionTime\":\"17171717-SepSep-2828 0101:0909:3535\",\"OrderCall\":\"244\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506532235, '121.199.25.173'),
(92, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473432\",\"ActionTime\":\"17171717-SepSep-2828 0101:0909:0202\",\"OrderCall\":\"248\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506534902, '121.199.25.173'),
(93, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473540\",\"ActionTime\":\"17171717-SepSep-2828 0404:0909:0202\",\"OrderCall\":\"10\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506545403, '121.199.25.173'),
(94, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473560\",\"ActionTime\":\"17171717-SepSep-2828 0505:0909:0303\",\"OrderCall\":\"33\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506546004, '121.199.25.173'),
(95, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473583\",\"ActionTime\":\"17171717-SepSep-2828 0505:0909:0202\",\"OrderCall\":\"42\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506548102, '121.199.25.173'),
(96, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473590\",\"ActionTime\":\"17171717-SepSep-2828 0505:0909:0202\",\"OrderCall\":\"100000\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506548702, '121.199.25.173'),
(97, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19474826\",\"ActionTime\":\"17171717-SepSep-2828 0808:0909:0404\",\"OrderCall\":\"83950517\",\"Tnumber\":\"5\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506557704, '121.199.25.173'),
(98, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472985\",\"ActionTime\":\"2017-09-28 09:11:52\",\"OrderCall\":\"210\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561112, '114.55.115.148'),
(99, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472938\",\"ActionTime\":\"2017-09-28 09:11:55\",\"OrderCall\":\"202\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561115, '114.55.115.148'),
(100, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472937\",\"ActionTime\":\"2017-09-28 09:11:58\",\"OrderCall\":\"201\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561118, '121.199.25.173'),
(101, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472933\",\"ActionTime\":\"2017-09-28 09:12:09\",\"OrderCall\":\"200\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":49400,\"RefundFee\":0}', 1506561129, '114.55.115.148'),
(102, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472929\",\"ActionTime\":\"2017-09-28 09:12:14\",\"OrderCall\":\"199\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561135, '121.199.25.173'),
(103, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472923\",\"ActionTime\":\"2017-09-28 09:12:16\",\"OrderCall\":\"198\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561136, '114.55.115.148'),
(104, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472908\",\"ActionTime\":\"2017-09-28 09:12:20\",\"OrderCall\":\"197\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561140, '114.55.115.148'),
(105, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472857\",\"ActionTime\":\"2017-09-28 09:12:22\",\"OrderCall\":\"196\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561143, '121.199.25.173'),
(106, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472806\",\"ActionTime\":\"2017-09-28 09:12:24\",\"OrderCall\":\"193\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561145, '114.55.115.148'),
(107, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472804\",\"ActionTime\":\"2017-09-28 09:12:27\",\"OrderCall\":\"192\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561147, '114.55.115.148'),
(108, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472775\",\"ActionTime\":\"2017-09-28 09:12:28\",\"OrderCall\":\"187\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561148, '121.199.25.173'),
(109, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472770\",\"ActionTime\":\"2017-09-28 09:12:32\",\"OrderCall\":\"185\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":123500,\"RefundFee\":0}', 1506561152, '114.55.115.148'),
(110, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472759\",\"ActionTime\":\"2017-09-28 09:12:35\",\"OrderCall\":\"184\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561155, '114.55.115.148'),
(111, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472450\",\"ActionTime\":\"2017-09-28 09:12:39\",\"OrderCall\":\"167\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561159, '114.55.115.148'),
(112, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472451\",\"ActionTime\":\"2017-09-28 09:12:42\",\"OrderCall\":\"168\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561162, '121.199.25.173'),
(113, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472443\",\"ActionTime\":\"2017-09-28 09:12:43\",\"OrderCall\":\"166\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":49400,\"RefundFee\":0}', 1506561163, '114.55.115.148'),
(114, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472419\",\"ActionTime\":\"2017-09-28 09:12:46\",\"OrderCall\":\"165\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561166, '114.55.115.148'),
(115, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472418\",\"ActionTime\":\"2017-09-28 09:12:48\",\"OrderCall\":\"164\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561168, '114.55.115.148'),
(116, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472378\",\"ActionTime\":\"2017-09-28 09:13:02\",\"OrderCall\":\"163\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561182, '114.55.115.148'),
(117, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472311\",\"ActionTime\":\"2017-09-28 09:13:05\",\"OrderCall\":\"162\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561185, '114.55.115.148'),
(118, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472265\",\"ActionTime\":\"2017-09-28 09:13:06\",\"OrderCall\":\"161\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561186, '114.55.115.148'),
(119, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472263\",\"ActionTime\":\"2017-09-28 09:13:10\",\"OrderCall\":\"160\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561190, '114.55.115.148'),
(120, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472260\",\"ActionTime\":\"2017-09-28 09:13:11\",\"OrderCall\":\"159\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561191, '114.55.115.148'),
(121, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472256\",\"ActionTime\":\"2017-09-28 09:13:13\",\"OrderCall\":\"158\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561193, '114.55.115.148'),
(122, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472255\",\"ActionTime\":\"2017-09-28 09:13:15\",\"OrderCall\":\"157\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561195, '114.55.115.148'),
(123, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472251\",\"ActionTime\":\"2017-09-28 09:13:17\",\"OrderCall\":\"156\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561197, '114.55.115.148'),
(124, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472250\",\"ActionTime\":\"2017-09-28 09:13:19\",\"OrderCall\":\"155\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561200, '121.199.25.173'),
(125, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472248\",\"ActionTime\":\"2017-09-28 09:13:23\",\"OrderCall\":\"154\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561203, '114.55.115.148'),
(126, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472243\",\"ActionTime\":\"2017-09-28 09:13:25\",\"OrderCall\":\"153\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561205, '114.55.115.148'),
(127, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472220\",\"ActionTime\":\"2017-09-28 09:13:28\",\"OrderCall\":\"152\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561208, '121.199.25.173'),
(128, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472219\",\"ActionTime\":\"2017-09-28 09:13:29\",\"OrderCall\":\"151\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561209, '114.55.115.148'),
(129, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472218\",\"ActionTime\":\"2017-09-28 09:13:35\",\"OrderCall\":\"150\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561215, '114.55.115.148'),
(130, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472217\",\"ActionTime\":\"2017-09-28 09:13:36\",\"OrderCall\":\"149\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561216, '114.55.115.148'),
(131, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472210\",\"ActionTime\":\"2017-09-28 09:13:50\",\"OrderCall\":\"148\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561230, '114.55.115.148'),
(132, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472209\",\"ActionTime\":\"2017-09-28 09:13:53\",\"OrderCall\":\"147\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561234, '114.55.115.148'),
(133, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472207\",\"ActionTime\":\"2017-09-28 09:13:55\",\"OrderCall\":\"146\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561235, '114.55.115.148'),
(134, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472206\",\"ActionTime\":\"2017-09-28 09:13:57\",\"OrderCall\":\"145\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561237, '114.55.115.148'),
(135, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19472203\",\"ActionTime\":\"2017-09-28 09:13:59\",\"OrderCall\":\"144\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561240, '114.55.115.148'),
(136, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19471674\",\"ActionTime\":\"2017-09-28 09:14:03\",\"OrderCall\":\"143\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561243, '114.55.115.148'),
(137, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19471658\",\"ActionTime\":\"2017-09-28 09:14:06\",\"OrderCall\":\"141\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":49400,\"RefundFee\":0}', 1506561246, '114.55.115.148'),
(138, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19471655\",\"ActionTime\":\"2017-09-28 09:14:10\",\"OrderCall\":\"139\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":49400,\"RefundFee\":0}', 1506561250, '121.199.25.173'),
(139, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19471657\",\"ActionTime\":\"2017-09-28 09:14:12\",\"OrderCall\":\"140\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":49400,\"RefundFee\":0}', 1506561252, '121.199.25.173'),
(140, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19471653\",\"ActionTime\":\"2017-09-28 09:14:14\",\"OrderCall\":\"138\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":49400,\"RefundFee\":0}', 1506561255, '114.55.115.148'),
(141, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19471673\",\"ActionTime\":\"2017-09-28 09:14:23\",\"OrderCall\":\"142\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561263, '114.55.115.148'),
(142, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19475862\",\"ActionTime\":\"2017-09-28 09:14:48\",\"OrderCall\":\"83950532\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561289, '114.55.115.148'),
(143, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19475804\",\"ActionTime\":\"2017-09-28 09:14:50\",\"OrderCall\":\"83950531\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561291, '114.55.115.148'),
(144, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19475437\",\"ActionTime\":\"2017-09-28 09:14:53\",\"OrderCall\":\"83950530\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561294, '114.55.115.148'),
(145, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19475414\",\"ActionTime\":\"2017-09-28 09:14:55\",\"OrderCall\":\"83950529\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561295, '114.55.115.148'),
(146, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19475340\",\"ActionTime\":\"2017-09-28 09:14:56\",\"OrderCall\":\"83950527\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561296, '114.55.115.148'),
(147, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19475314\",\"ActionTime\":\"2017-09-28 09:15:01\",\"OrderCall\":\"83950528\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":49400,\"RefundFee\":0}', 1506561301, '114.55.115.148'),
(148, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19475292\",\"ActionTime\":\"2017-09-28 09:15:03\",\"OrderCall\":\"83950526\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561303, '114.55.115.148'),
(149, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19475152\",\"ActionTime\":\"2017-09-28 09:15:06\",\"OrderCall\":\"83950521\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561307, '114.55.115.148'),
(150, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19475129\",\"ActionTime\":\"2017-09-28 09:15:09\",\"OrderCall\":\"83950523\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561309, '114.55.115.148'),
(151, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19475108\",\"ActionTime\":\"2017-09-28 09:15:11\",\"OrderCall\":\"83950524\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":49400,\"RefundFee\":0}', 1506561311, '121.199.25.173'),
(152, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19475095\",\"ActionTime\":\"2017-09-28 09:15:15\",\"OrderCall\":\"83950522\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561315, '121.199.25.173'),
(153, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19474826\",\"ActionTime\":\"2017-09-28 09:15:20\",\"OrderCall\":\"83950517\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":123500,\"RefundFee\":0}', 1506561320, '114.55.115.148'),
(154, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19474617\",\"ActionTime\":\"2017-09-28 09:15:21\",\"OrderCall\":\"83950512\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561322, '121.199.25.173');
INSERT INTO `bao_piaofutong_callback` (`id`, `data`, `create_time`, `create_ip`) VALUES
(155, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19474568\",\"ActionTime\":\"2017-09-28 09:15:24\",\"OrderCall\":\"83950511\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561324, '114.55.115.148'),
(156, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19474545\",\"ActionTime\":\"2017-09-28 09:15:26\",\"OrderCall\":\"83950510\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561327, '114.55.115.148'),
(157, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19474357\",\"ActionTime\":\"2017-09-28 09:15:41\",\"OrderCall\":\"83950505\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":49400,\"RefundFee\":0}', 1506561341, '114.55.115.148'),
(158, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473769\",\"ActionTime\":\"2017-09-28 09:15:44\",\"OrderCall\":\"83950504\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561344, '114.55.115.148'),
(159, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473612\",\"ActionTime\":\"2017-09-28 09:15:47\",\"OrderCall\":\"83950503\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561347, '114.55.115.148'),
(160, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473603\",\"ActionTime\":\"2017-09-28 09:15:48\",\"OrderCall\":\"83950502\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561348, '114.55.115.148'),
(161, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473601\",\"ActionTime\":\"2017-09-28 09:15:50\",\"OrderCall\":\"83950501\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561350, '114.55.115.148'),
(162, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473596\",\"ActionTime\":\"2017-09-28 09:15:52\",\"OrderCall\":\"83950500\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561352, '114.55.115.148'),
(163, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473590\",\"ActionTime\":\"2017-09-28 09:15:54\",\"OrderCall\":\"100000\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561354, '114.55.115.148'),
(164, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473587\",\"ActionTime\":\"2017-09-28 09:15:57\",\"OrderCall\":\"1000\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561358, '114.55.115.148'),
(165, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473586\",\"ActionTime\":\"2017-09-28 09:16:01\",\"OrderCall\":\"44\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561361, '114.55.115.148'),
(166, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473584\",\"ActionTime\":\"2017-09-28 09:16:09\",\"OrderCall\":\"43\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561369, '114.55.115.148'),
(167, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473583\",\"ActionTime\":\"2017-09-28 09:16:11\",\"OrderCall\":\"42\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561371, '114.55.115.148'),
(168, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473578\",\"ActionTime\":\"2017-09-28 09:16:14\",\"OrderCall\":\"41\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561374, '114.55.115.148'),
(169, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473575\",\"ActionTime\":\"2017-09-28 09:16:16\",\"OrderCall\":\"40\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561376, '114.55.115.148'),
(170, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473573\",\"ActionTime\":\"2017-09-28 09:16:18\",\"OrderCall\":\"39\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506561378, '114.55.115.148'),
(171, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19477777\",\"ActionTime\":\"2017-09-28 09:52:29\",\"OrderCall\":\"JCJYXSZHSJPT83950545\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":74100,\"RefundFee\":0}', 1506563549, '114.55.115.148'),
(172, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19477615\",\"ActionTime\":\"2017-09-28 09:52:32\",\"OrderCall\":\"JCJYXSZHSJPT83950544\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563552, '114.55.115.148'),
(173, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19477577\",\"ActionTime\":\"2017-09-28 09:52:35\",\"OrderCall\":\"JCJYXSZHSJPT83950542\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":49400,\"RefundFee\":0}', 1506563555, '121.199.25.173'),
(174, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19477515\",\"ActionTime\":\"2017-09-28 09:52:36\",\"OrderCall\":\"JCJYXSZHSJPT83950540\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563556, '114.55.115.148'),
(175, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19477463\",\"ActionTime\":\"2017-09-28 09:52:39\",\"OrderCall\":\"JCJYXSZHSJPT83950541\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":49400,\"RefundFee\":0}', 1506563559, '114.55.115.148'),
(176, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19477414\",\"ActionTime\":\"2017-09-28 09:52:42\",\"OrderCall\":\"JCJYXSZHSJPT83950539\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563563, '121.199.25.173'),
(177, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19477364\",\"ActionTime\":\"2017-09-28 09:52:44\",\"OrderCall\":\"JCJYXSZHSJPT83950537\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563564, '114.55.115.148'),
(178, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19477099\",\"ActionTime\":\"2017-09-28 09:52:47\",\"OrderCall\":\"JCJYXSZHSJPT83950536\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563567, '114.55.115.148'),
(179, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19476922\",\"ActionTime\":\"2017-09-28 09:52:49\",\"OrderCall\":\"JCJYXSZHSJPT83950533\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563569, '114.55.115.148'),
(180, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19476879\",\"ActionTime\":\"2017-09-28 09:52:51\",\"OrderCall\":\"JCJYXSZHSJPT83950534\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":49400,\"RefundFee\":0}', 1506563571, '114.55.115.148'),
(181, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19476845\",\"ActionTime\":\"2017-09-28 09:52:53\",\"OrderCall\":\"JCJYXSZHSJPT83950535\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563573, '114.55.115.148'),
(182, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19476276\",\"ActionTime\":\"2017-09-28 09:52:55\",\"OrderCall\":\"83950527\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563575, '114.55.115.148'),
(183, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473563\",\"ActionTime\":\"2017-09-28 09:53:17\",\"OrderCall\":\"38\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563597, '121.199.25.173'),
(184, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473560\",\"ActionTime\":\"2017-09-28 09:53:18\",\"OrderCall\":\"33\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563598, '121.199.25.173'),
(185, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473558\",\"ActionTime\":\"2017-09-28 09:53:21\",\"OrderCall\":\"34\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":49400,\"RefundFee\":0}', 1506563601, '121.199.25.173'),
(186, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473556\",\"ActionTime\":\"2017-09-28 09:53:29\",\"OrderCall\":\"35\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563609, '114.55.115.148'),
(187, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473548\",\"ActionTime\":\"2017-09-28 09:53:31\",\"OrderCall\":\"3\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563611, '114.55.115.148'),
(188, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473546\",\"ActionTime\":\"2017-09-28 09:53:32\",\"OrderCall\":\"5\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563612, '114.55.115.148'),
(189, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473545\",\"ActionTime\":\"2017-09-28 09:53:36\",\"OrderCall\":\"7\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563616, '114.55.115.148'),
(190, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473510\",\"ActionTime\":\"2017-09-28 09:53:40\",\"OrderCall\":\"12\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563621, '114.55.115.148'),
(191, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473517\",\"ActionTime\":\"2017-09-28 09:53:40\",\"OrderCall\":\"11\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563621, '114.55.115.148'),
(192, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473540\",\"ActionTime\":\"2017-09-28 09:53:43\",\"OrderCall\":\"10\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563623, '114.55.115.148'),
(193, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473509\",\"ActionTime\":\"2017-09-28 09:53:46\",\"OrderCall\":\"19\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563626, '114.55.115.148'),
(194, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473506\",\"ActionTime\":\"2017-09-28 09:53:48\",\"OrderCall\":\"24\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":49400,\"RefundFee\":0}', 1506563628, '114.55.115.148'),
(195, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473504\",\"ActionTime\":\"2017-09-28 09:53:51\",\"OrderCall\":\"25\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563631, '121.199.25.173'),
(196, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473475\",\"ActionTime\":\"2017-09-28 09:53:53\",\"OrderCall\":\"1\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563633, '114.55.115.148'),
(197, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473474\",\"ActionTime\":\"2017-09-28 09:53:55\",\"OrderCall\":\"2\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563635, '114.55.115.148'),
(198, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473441\",\"ActionTime\":\"2017-09-28 09:53:57\",\"OrderCall\":\"250\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563637, '114.55.115.148'),
(199, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473436\",\"ActionTime\":\"2017-09-28 09:53:59\",\"OrderCall\":\"249\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563640, '114.55.115.148'),
(200, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473432\",\"ActionTime\":\"2017-09-28 09:54:04\",\"OrderCall\":\"248\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563644, '114.55.115.148'),
(201, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473430\",\"ActionTime\":\"2017-09-28 09:54:06\",\"OrderCall\":\"247\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563646, '114.55.115.148'),
(202, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473428\",\"ActionTime\":\"2017-09-28 09:54:08\",\"OrderCall\":\"246\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":49400,\"RefundFee\":0}', 1506563649, '114.55.115.148'),
(203, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473363\",\"ActionTime\":\"2017-09-28 09:54:09\",\"OrderCall\":\"245\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563650, '114.55.115.148'),
(204, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473362\",\"ActionTime\":\"2017-09-28 09:54:11\",\"OrderCall\":\"244\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563651, '121.199.25.173'),
(205, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473361\",\"ActionTime\":\"2017-09-28 09:54:13\",\"OrderCall\":\"243\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":49400,\"RefundFee\":0}', 1506563653, '114.55.115.148'),
(206, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473360\",\"ActionTime\":\"2017-09-28 09:54:15\",\"OrderCall\":\"242\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":49400,\"RefundFee\":0}', 1506563655, '114.55.115.148'),
(207, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473307\",\"ActionTime\":\"2017-09-28 09:54:17\",\"OrderCall\":\"241\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":49400,\"RefundFee\":0}', 1506563657, '114.55.115.148'),
(208, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473276\",\"ActionTime\":\"2017-09-28 09:54:19\",\"OrderCall\":\"240\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563659, '114.55.115.148'),
(209, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473252\",\"ActionTime\":\"2017-09-28 09:54:21\",\"OrderCall\":\"239\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563661, '114.55.115.148'),
(210, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473251\",\"ActionTime\":\"2017-09-28 09:54:23\",\"OrderCall\":\"238\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563663, '114.55.115.148'),
(211, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473201\",\"ActionTime\":\"2017-09-28 09:54:25\",\"OrderCall\":\"236\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563665, '121.199.25.173'),
(212, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473249\",\"ActionTime\":\"2017-09-28 09:54:27\",\"OrderCall\":\"237\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563667, '114.55.115.148'),
(213, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473198\",\"ActionTime\":\"2017-09-28 09:54:29\",\"OrderCall\":\"235\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563669, '114.55.115.148'),
(214, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473196\",\"ActionTime\":\"2017-09-28 09:54:31\",\"OrderCall\":\"234\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563671, '121.199.25.173'),
(215, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473195\",\"ActionTime\":\"2017-09-28 09:54:33\",\"OrderCall\":\"233\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563673, '121.199.25.173'),
(216, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473191\",\"ActionTime\":\"2017-09-28 09:54:48\",\"OrderCall\":\"232\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563688, '114.55.115.148'),
(217, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473183\",\"ActionTime\":\"2017-09-28 09:54:51\",\"OrderCall\":\"231\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563691, '114.55.115.148'),
(218, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473177\",\"ActionTime\":\"2017-09-28 09:54:53\",\"OrderCall\":\"230\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563693, '114.55.115.148'),
(219, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473175\",\"ActionTime\":\"2017-09-28 09:54:55\",\"OrderCall\":\"229\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563695, '114.55.115.148'),
(220, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473172\",\"ActionTime\":\"2017-09-28 09:54:59\",\"OrderCall\":\"228\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563699, '114.55.115.148'),
(221, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473170\",\"ActionTime\":\"2017-09-28 09:55:02\",\"OrderCall\":\"227\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563703, '121.199.25.173'),
(222, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19478033\",\"ActionTime\":\"17171717-SepSep-2828 0909:0909:0404\",\"OrderCall\":\"JCJYXSZHSJPT83950545\",\"Tnumber\":\"3\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506563704, '121.199.25.173'),
(223, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473168\",\"ActionTime\":\"2017-09-28 09:55:05\",\"OrderCall\":\"226\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563705, '114.55.115.148'),
(224, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473167\",\"ActionTime\":\"2017-09-28 09:55:07\",\"OrderCall\":\"225\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563707, '121.199.25.173'),
(225, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473163\",\"ActionTime\":\"2017-09-28 09:55:09\",\"OrderCall\":\"224\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563709, '114.55.115.148'),
(226, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473162\",\"ActionTime\":\"2017-09-28 09:55:11\",\"OrderCall\":\"223\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563711, '114.55.115.148'),
(227, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473160\",\"ActionTime\":\"2017-09-28 09:55:14\",\"OrderCall\":\"222\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563714, '114.55.115.148'),
(228, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473157\",\"ActionTime\":\"2017-09-28 09:55:31\",\"OrderCall\":\"221\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563732, '114.55.115.148'),
(229, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19478033\",\"ActionTime\":\"17171717-SepSep-2828 0909:0909:3232\",\"OrderCall\":\"JCJYXSZHSJPT83950545\",\"Tnumber\":\"3\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506563732, '121.199.25.173'),
(230, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473146\",\"ActionTime\":\"2017-09-28 09:55:35\",\"OrderCall\":\"220\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563735, '114.55.115.148'),
(231, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473111\",\"ActionTime\":\"2017-09-28 09:55:36\",\"OrderCall\":\"219\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563736, '121.199.25.173'),
(232, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19473106\",\"ActionTime\":\"2017-09-28 09:55:39\",\"OrderCall\":\"218\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506563740, '121.199.25.173'),
(233, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19478033\",\"ActionTime\":\"2017-09-28 09:56:26\",\"OrderCall\":\"JCJYXSZHSJPT83950545\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":74100,\"RefundFee\":0}', 1506563786, '114.55.115.148'),
(234, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19478994\",\"ActionTime\":\"17171717-SepSep-2828 1010:0909:3232\",\"OrderCall\":\"JCJYXSZHSJPT83950549\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506564932, '121.199.25.173'),
(235, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19478198\",\"ActionTime\":\"2017-09-28 11:25:45\",\"OrderCall\":\"JCJYXSZHSJPT83950546\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506569145, '114.55.115.148'),
(236, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19478231\",\"ActionTime\":\"2017-09-28 11:25:47\",\"OrderCall\":\"JCJYXSZHSJPT83950545\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":74100,\"RefundFee\":0}', 1506569147, '114.55.115.148'),
(237, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19478245\",\"ActionTime\":\"2017-09-28 11:25:50\",\"OrderCall\":\"JCJYXSZHSJPT83950539\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506569150, '114.55.115.148'),
(238, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19478648\",\"ActionTime\":\"2017-09-28 11:25:51\",\"OrderCall\":\"JCJYXSZHSJPT83950547\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506569151, '114.55.115.148'),
(239, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19479860\",\"ActionTime\":\"2017-09-28 11:25:58\",\"OrderCall\":\"JCJYXSZHSJPT83950551\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506569158, '114.55.115.148'),
(240, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19478994\",\"ActionTime\":\"2017-09-28 11:25:59\",\"OrderCall\":\"JCJYXSZHSJPT83950549\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506569159, '114.55.115.148'),
(241, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19481326\",\"ActionTime\":\"2017-09-28 11:26:02\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950553\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506569162, '114.55.115.148'),
(242, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19481356\",\"ActionTime\":\"2017-09-28 11:26:05\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950555\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506569165, '114.55.115.148'),
(243, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19481394\",\"ActionTime\":\"2017-09-28 11:26:08\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950554\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506569169, '114.55.115.148'),
(244, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19481498\",\"ActionTime\":\"2017-09-28 11:26:10\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950556\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506569170, '114.55.115.148'),
(245, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19481752\",\"ActionTime\":\"2017-09-28 11:26:10\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950559\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506569171, '114.55.115.148'),
(246, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19481792\",\"ActionTime\":\"2017-09-28 11:26:13\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950558\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506569173, '114.55.115.148'),
(247, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19481853\",\"ActionTime\":\"2017-09-28 11:26:16\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950560\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506569176, '121.199.25.173'),
(248, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19493452\",\"ActionTime\":\"2017-09-28 18:18:48\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950578\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506593928, '114.55.115.148'),
(249, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19493438\",\"ActionTime\":\"2017-09-28 18:18:57\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950577\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506593937, '114.55.115.148'),
(250, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19493298\",\"ActionTime\":\"2017-09-28 18:19:02\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950576\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506593943, '114.55.115.148'),
(251, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19493168\",\"ActionTime\":\"2017-09-28 18:19:08\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950574\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506593948, '114.55.115.148'),
(252, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19493132\",\"ActionTime\":\"2017-09-28 18:19:14\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950573\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506593954, '114.55.115.148'),
(253, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19493112\",\"ActionTime\":\"2017-09-28 18:19:18\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950571\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506593958, '114.55.115.148'),
(254, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19493097\",\"ActionTime\":\"2017-09-28 18:19:20\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950572\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506593960, '114.55.115.148'),
(255, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19492808\",\"ActionTime\":\"2017-09-28 18:19:28\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950570\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506593968, '114.55.115.148'),
(256, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19492668\",\"ActionTime\":\"2017-09-28 18:19:32\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950569\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506593972, '114.55.115.148'),
(257, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19492654\",\"ActionTime\":\"2017-09-28 18:19:35\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950568\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506593975, '114.55.115.148'),
(258, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19492636\",\"ActionTime\":\"2017-09-28 18:19:38\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950567\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506593979, '121.199.25.173'),
(259, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19488771\",\"ActionTime\":\"2017-09-28 18:19:41\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950564\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506593981, '114.55.115.148'),
(260, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19482931\",\"ActionTime\":\"2017-09-28 18:19:45\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950562\",\"Tnumber\":0,\"OrderState\":8,\"Refundtype\":1,\"Explain\":\"\\u7cfb\\u7edf\\u81ea\\u52a8\\u5ba1\\u6838\",\"Source\":2,\"Action\":3,\"AllCheckNum\":0,\"RefundAmount\":24700,\"RefundFee\":0}', 1506593985, '114.55.115.148'),
(261, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19504807\",\"ActionTime\":\"17171717-SepSep-2929 0909:0909:0202\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950604\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506647702, '121.199.25.173'),
(262, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19504807\",\"ActionTime\":\"17171717-SepSep-2929 0909:0909:3131\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950604\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506647731, '121.199.25.173'),
(263, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19504807\",\"ActionTime\":\"17171717-SepSep-2929 0909:0909:3232\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950604\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506647732, '121.199.25.173'),
(264, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19505089\",\"ActionTime\":\"17171717-SepSep-2929 0909:0909:0303\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950605\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506648003, '121.199.25.173'),
(265, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19505089\",\"ActionTime\":\"17171717-SepSep-2929 0909:0909:3131\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950605\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506648032, '121.199.25.173'),
(266, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19505089\",\"ActionTime\":\"17171717-SepSep-2929 0909:0909:3232\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950605\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506648033, '121.199.25.173'),
(267, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19505320\",\"ActionTime\":\"17171717-SepSep-2929 0909:0909:0303\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950608\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506648303, '121.199.25.173'),
(268, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19505320\",\"ActionTime\":\"17171717-SepSep-2929 0909:0909:3131\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950608\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506648331, '121.199.25.173'),
(269, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19505320\",\"ActionTime\":\"17171717-SepSep-2929 0909:0909:3232\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950608\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506648332, '121.199.25.173'),
(270, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19505456\",\"ActionTime\":\"17171717-SepSep-2929 0909:0909:0202\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950609\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506648602, '121.199.25.173'),
(271, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19505456\",\"ActionTime\":\"17171717-SepSep-2929 0909:0909:3333\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950609\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506648633, '121.199.25.173'),
(272, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19505456\",\"ActionTime\":\"17171717-SepSep-2929 0909:0909:3333\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950609\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506648634, '121.199.25.173'),
(273, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19508113\",\"ActionTime\":\"17171717-SepSep-2929 1010:0909:0505\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950613\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506651305, '121.199.25.173'),
(274, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19508113\",\"ActionTime\":\"17171717-SepSep-2929 1010:0909:3232\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950613\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506651332, '121.199.25.173'),
(275, '{\"VerifyCode\":\"fef6526f3d3f9c51d6e906309190482c\",\"Order16U\":\"19508113\",\"ActionTime\":\"17171717-SepSep-2929 1010:0909:3333\",\"OrderCall\":\"J8C3J9Y5X0S5ZHSJPT83950613\",\"Tnumber\":\"1\",\"OrderState\":10,\"OrderStatus\":\"success\"}', 1506651333, '121.199.25.173'),
(276, '{\"VerifyCode\":\"ab54f9d58e7774b14750ff468ce25a67\",\"Order16U\":\"16378504\",\"ActionTime\":\"2017-09-29 18:30:29\",\"OrderCall\":\"4060205169119170929000336001mp\",\"Tnumber\":1,\"OrderState\":1,\"AllCheckNum\":1,\"Source\":4,\"Action\":2}', 1506681367, '112.111.40.20'),
(277, '{\"VerifyCode\":\"ab54f9d58e7774b14750ff468ce25a67\",\"Order16U\":\"16378504\",\"ActionTime\":\"2017-09-29 18:30:29\",\"OrderCall\":\"4060205169119170929000336001mp\",\"Tnumber\":1,\"OrderState\":1,\"AllCheckNum\":1,\"Source\":4,\"Action\":2}', 1506681527, '112.111.40.20');

-- --------------------------------------------------------

--
-- 表的结构 `bao_post`
--

CREATE TABLE `bao_post` (
  `post_id` int(10) UNSIGNED NOT NULL,
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
  `is_fine` tinyint(1) DEFAULT '0' COMMENT '1代表精华'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_post_reply`
--

CREATE TABLE `bao_post_reply` (
  `reply_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `zan_num` int(11) DEFAULT '0',
  `contents` text,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_post_zan`
--

CREATE TABLE `bao_post_zan` (
  `zan_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_qrcode_census`
--

CREATE TABLE `bao_qrcode_census` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT '0',
  `year` smallint(5) DEFAULT '0',
  `month` tinyint(2) DEFAULT '0',
  `day` tinyint(2) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_quanming`
--

CREATE TABLE `bao_quanming` (
  `tid` int(10) UNSIGNED NOT NULL,
  `uid` int(11) DEFAULT '0' COMMENT '获得佣金的用户ID',
  `buy_uid` int(11) DEFAULT '0' COMMENT '购买的用户ID',
  `rank` tinyint(4) DEFAULT '0' COMMENT '第几级会员产生的收益',
  `price` int(11) DEFAULT '0' COMMENT '对方消费多少',
  `commission` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `year` char(4) DEFAULT NULL,
  `month` char(2) DEFAULT NULL,
  `day` char(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_recharge_card`
--

CREATE TABLE `bao_recharge_card` (
  `card_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT '0',
  `card_key` char(32) DEFAULT '0',
  `value` int(10) DEFAULT '0',
  `end_date` date DEFAULT '0000-00-00',
  `is_used` tinyint(3) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT '0',
  `user_id` int(10) DEFAULT '0',
  `used_time` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_role`
--

CREATE TABLE `bao_role` (
  `role_id` smallint(5) UNSIGNED NOT NULL,
  `role_name` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_role`
--

INSERT INTO `bao_role` (`role_id`, `role_name`) VALUES
(1, '系统管理员'),
(2, '分站管理'),
(3, '财务部'),
(4, '运营部'),
(5, '市场部'),
(6, '客服部');

-- --------------------------------------------------------

--
-- 表的结构 `bao_role_maps`
--

CREATE TABLE `bao_role_maps` (
  `role_id` smallint(5) DEFAULT NULL,
  `menu_id` smallint(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_role_maps`
--

INSERT INTO `bao_role_maps` (`role_id`, `menu_id`) VALUES
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 34),
(2, 35),
(2, 37),
(2, 40),
(2, 41),
(2, 44),
(2, 45),
(2, 46),
(2, 47),
(2, 48),
(2, 80),
(2, 81),
(2, 85),
(2, 86),
(2, 87),
(2, 88),
(2, 90),
(2, 95),
(2, 96),
(2, 97),
(2, 98),
(2, 99),
(2, 100),
(2, 101),
(2, 102),
(2, 103),
(2, 115),
(2, 116),
(2, 117),
(2, 118),
(2, 125),
(2, 126),
(2, 127),
(2, 128),
(2, 129),
(2, 130),
(2, 156),
(2, 157),
(2, 177),
(2, 178),
(2, 179),
(2, 180),
(2, 181),
(2, 182),
(2, 183),
(2, 184),
(2, 209),
(2, 210),
(2, 212),
(2, 223),
(2, 224),
(2, 227),
(2, 240),
(2, 259),
(2, 261),
(2, 262),
(2, 263),
(2, 264),
(2, 265),
(2, 268),
(2, 277),
(2, 280),
(2, 290),
(2, 296),
(2, 297),
(2, 298),
(2, 299),
(2, 327),
(2, 328),
(2, 345),
(2, 346),
(2, 347),
(2, 348),
(2, 349),
(2, 350),
(2, 434),
(2, 441),
(2, 442),
(2, 443),
(2, 444),
(2, 503),
(2, 515),
(2, 520),
(2, 521),
(2, 522),
(2, 532),
(2, 533),
(2, 535),
(2, 548),
(2, 549),
(2, 550),
(2, 551),
(2, 552),
(2, 556),
(2, 557),
(2, 558),
(2, 559),
(2, 560),
(2, 561),
(2, 563),
(2, 564),
(2, 565),
(2, 566),
(2, 567),
(2, 568),
(2, 569),
(2, 570),
(2, 571),
(2, 572),
(2, 573),
(2, 574),
(2, 575),
(2, 576),
(2, 577),
(2, 578),
(2, 579),
(2, 580),
(2, 581),
(2, 582),
(2, 583),
(2, 584);

-- --------------------------------------------------------

--
-- 表的结构 `bao_sensitive_words`
--

CREATE TABLE `bao_sensitive_words` (
  `words_id` smallint(5) UNSIGNED NOT NULL,
  `words` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_sensitive_words`
--

INSERT INTO `bao_sensitive_words` (`words_id`, `words`) VALUES
(1, '共产党'),
(2, '习近平'),
(3, '法轮功');

-- --------------------------------------------------------

--
-- 表的结构 `bao_seo`
--

CREATE TABLE `bao_seo` (
  `seo_id` int(10) UNSIGNED NOT NULL,
  `seo_key` varchar(32) DEFAULT NULL,
  `seo_explain` varchar(1024) DEFAULT NULL,
  `seo_title` varchar(1024) DEFAULT NULL,
  `seo_keywords` varchar(1024) DEFAULT NULL,
  `seo_desc` varchar(1024) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_seo`
--

INSERT INTO `bao_seo` (`seo_id`, `seo_key`, `seo_explain`, `seo_title`, `seo_keywords`, `seo_desc`) VALUES
(1, 'index_index', '首页SEO配置\r\n\r\n暂时没有其他可以用的标签!', '{sitename}_门户系统！咨询电话{tel}', '门户系统', '是山西生活宝门户系统，宗旨是身边的美提现出来，把山西的美传播出去'),
(2, 'article_index', '文章列表\r\n可使用的标签有：\r\n1、{cate_name}', '{sitename}{cate_name}文章频道聚集了最好的生活内容！让您的生活更精彩', '{sitename}{cate_name}文章频道聚集了最好的生活内容！让您的生活更精彩', '{sitename}{cate_name}文章频道聚集了最好的生活内容！让您的生活更精彩'),
(3, 'article_detail', '文章详情\r\n1、{title}标题\r\n2、{keywords}关键字\r\n3、{desc}描述\r\n4、{cate_name}分类', '{title}-{sitename}', '{keywords}', '{desc}'),
(4, 'article_system', '系统文章\r\n1、{title}标题', '{title}-{sitename}', '{title}-{sitename}', '{title}-{sitename}'),
(5, 'coupon_index', '优惠券列表\r\n1、{area_name}地区\r\n2、{cate_name}', '{area_name}{cate_name}商户哪家好？{sitename}', '{area_name}{cate_name}商户哪家好？{sitename}', '{area_name}{cate_name}商户哪家好？{sitename}'),
(6, 'coupon_detail', '优惠券详情\r\n1、{shop_name}商家名称\r\n2、{title}优惠券标题\r\n', '商户{shop_name}的优惠券“{title}”', '商户{shop_name}的优惠券“{title}”', '商户{shop_name}的优惠券“{title}”'),
(7, 'tuan_detail', '生活团购详情\r\n1、{shop_name}商家名称\r\n2、{title}优惠券标题', '商户{shop_name}的商品“{title}”', '商户{shop_name}的商品“{title}”', '商户{shop_name}的商品“{title}”'),
(8, 'tuan_index', '团购列表\r\n1、{area_name}地区\r\n2、{cate_name}\r\n3、{business_name}', '山西{area_name}{business_name}{cate_name}本地生活团购！吃喝玩乐一切都在{sitename}！', '山西{area_name}{business_name}{cate_name}本地生活团购！吃喝玩乐一切都在{sitename}！', '山西{area_name}{business_name}{cate_name}本地生活团购！吃喝玩乐一切都在{sitename}！'),
(9, 'news_index', '新闻列表\r\n1、{cate_name} 分类', '{cate_name}商家新闻列表-{sitename}', '{cate_name}商家新闻列表-{sitename}', '{cate_name}商家新闻列表-{sitename}'),
(10, 'news_detail', '新闻详情\r\n1、{title}标题', '{title}', '{title}', '{title}'),
(11, 'share_index', '消费分享\r\n1、{cate_name}分类', '{cate_name}消费分享-{sitename}', '{cate_name}消费分享-{sitename}', '{cate_name}消费分享-{sitename}'),
(12, 'share_detail', '消费分享详情\r\n1、{title}标题', '{title}', '{title}', '{title}'),
(13, 'shop_index', '商家列表\r\n1、{cate_name}分类\r\n2、{area_name}地区\r\n3、{business_name}商圈', '{area_name}{cate_name}{business_name}商家列表', '{area_name}{cate_name}{business_name}商家列表', '{area_name}{cate_name}{business_name}商家列表'),
(14, 'shop_detail', '商家详情\r\n1、{shop_name}\r\n2、{shop_tel}', '商家详情{shop_name}{shop_tel}', '商家详情{shop_name}{shop_tel}', '商家详情{shop_name}{shop_tel}'),
(15, 'app_index', 'APP页面', '优服汇_生活宝门户系统手机客户端下载', '优服汇_生活宝门户系统手机客户端下载', '优服汇_生活宝门户系统手机客户端下载'),
(16, 'recommend_index', '暂无可用标签', '打造全城最实惠的消费方式！消费享受折扣就上{sitename}', '打造全城最实惠的消费方式！消费享受折扣就上{sitename}', '打造全城最实惠的消费方式！消费享受折扣就上{sitename}'),
(17, 'blog_index', '用户博客\r\n1、{nickname}用户昵称', '{nickname}的博客', '{nickname}的博客', '{nickname}的博客'),
(18, 'huodong_index', '活动类型：1、{cate_name} 2、{area_name}', '山西{area_name}最全的{cate_name}活动', '山西{area_name}最全的{cate_name}活动', '山西{area_name}最全的{cate_name}活动'),
(19, 'huodong_detail', '活动详情\r\n1、{title}标题\r\n2、{shop_name}商家名称', '{title}-{shop_name}', '{title}-{shop_name}', '{title}-{shop_name}'),
(20, 'ele_ding', '订座列表\r\n1、{cate_name}分类\r\n2、{area_name}地区\r\n3、{business_name}商圈', '{area_name}{cate_name}{business_name}订座列表', '{area_name}{cate_name}{business_name}订座列表', '{area_name}{cate_name}{business_name}订座列表'),
(21, 'mall_main', '购物列表\r\n1、{cate_name}分类\r\n2、{area_name}地区\r\n3、{business_name}商圈', '{area_name}{cate_name}{business_name}购物列表', '{area_name}{cate_name}{business_name}购物列表', '{area_name}{cate_name}{business_name}购物列表'),
(22, 'mall_detail', '购物详情\r\n1、{shop_name}商家名称\r\n2、{title}商品标题', '商户{shop_name}的商品“{title}”', '商户{shop_name}的商品“{title}”', '商户{shop_name}的商品“{title}”'),
(23, 'vip_index', 'VIP列表\r\n1、{cate_name}分类\r\n2、{area_name}地区\r\n3、{business_name}商圈', '{area_name}{cate_name}{business_name}会员卡列表', '{area_name}{cate_name}{business_name}会员卡列表', '{area_name}{cate_name}{business_name}会员卡列表'),
(24, 'mall_index', '购物首页{cate_name}', '{cate_name}购物首页', '{cate_name}购物首页', '{cate_name}购物首页'),
(25, 'jifen_index', '积分兑换列表', '积分兑换列表', '积分兑换列表', '积分兑换列表'),
(26, 'jifen_detail', '积分商品&quot;{title}&quot;详情', '积分商品&quot;{title}&quot;详情', '积分商品&quot;{title}&quot;详情', '积分商品&quot;{title}&quot;详情'),
(27, 'ele_detail', '订餐详情\r\n1、{shop_name}商家名称\r\n2、{shop_tel}订餐电话', '商户{shop_name}的订餐电话“{shop_tel}”', '商户{shop_name}的订餐电话“{shop_tel}”', '商户{shop_name}的订餐电话“{shop_tel}”'),
(28, 'ele_shop', '订餐详情', '订餐详情', '订餐详情', '订餐详情'),
(29, 'ele_index', '餐饮美食首页', '餐饮美食首页', '餐饮美食首页', '餐饮美食首页'),
(30, 'life_index', '生活信息首页', '生活信息首页', '生活信息首页', '生活信息首页'),
(31, 'life_detail', '生活信息详情\r\n1、{title}', '{title}', '{title}', '{title}'),
(32, 'life_main', '生活信息主页{area_name}{business_name}', '生活信息主页{area_name}{business_name}', '生活信息主页{area_name}{business_name}', '生活信息主页{area_name}{business_name}'),
(33, 'life_fabu', '发布生活信息', '发布生活信息', '发布生活信息', '发布生活信息'),
(34, 'shop_apply', '商家入驻申请', '商家入驻申请', '商家入驻申请', '商家入驻申请'),
(36, 'ele_main', '餐饮美食主页', '餐饮美食主页', '餐饮美食主页', '餐饮美食主页'),
(37, 'ele_takeout', '外卖点餐', '外卖点餐', '外卖点餐', '外卖点餐'),
(38, 'ele_pay', '订单支付页面', '订单支付页面', '订单支付页面', '订单支付页面'),
(39, 'tuan_main', '团购主页', '团购主页', '团购主页', '团购主页'),
(40, 'mall_shop', '商家店铺页面的SEO\r\n1、{shop_name}商家店铺', '{shop_name}的店铺', '{shop_name}的店铺', '{shop_name}的店铺'),
(41, 'billboard_index', '{sitename}榜单首页', '{sitename}榜单首页', '{sitename}榜单首页', '{sitename}榜单首页'),
(42, 'billboard_bdlist', '1、{cate_name} 榜单内容', '{cate_name} 榜单内容', '{cate_name} 榜单内容', '{cate_name} 榜单内容'),
(43, 'billborder_bddetails', '榜单详情 1、{title}', '{title}', '{title}', '{title}'),
(44, 'jifen_main', '积分主页：1、{sitename}一卡通全城', '{sitename}一卡通全城', '{sitename}一卡通全城', '{sitename}一卡通全城'),
(45, 'jifen_shop', '商家联盟：1、{shop_name}', '联盟商家{shop_name}的详情', '联盟商家{shop_name}的详情', '联盟商家{shop_name}的详情'),
(46, 'hdmobile_detail', '手机活动 1、{title}', '{title}', '{title}', '{title}'),
(48, 'community_detail', '小区详细页面SEO模版 {name} 小区名称 {addr} 小区地址', '{name}', '{name},小区大全,{sitename}', '{name}小区位于{addr}，{sitename}为您提供{name}小区的物业信息，以及{name}小区附近的商家、美食、优惠，您还可以和小区邻居相互交流。'),
(47, 'shop_detail', '手机商家 1、{title}', '{title}', '{title}', '{title}'),
(50, 'index_more', '首页更多', '{sitename}_山西生活宝门户系统！咨询电话{tel}', '{sitename}_山西生活宝门户系统！咨询电话{tel}', '{sitename}_山西生活宝门户系统！咨询电话{tel}'),
(51, 'tieba_detail', '城市贴吧1、{title}', '{title}', '{title}', '{title}'),
(52, 'tieba_index', '城市贴吧 1、{title}', '{title}', '{title}', '{title}'),
(53, 'tieba_main', '城市贴吧分类 1、{title}', '{title}', '{title}', '{title}'),
(54, 'community_index', '小区首页SEO模版 {area_name}区域名称', '{city}小区大全', '小区大全,{area_name}小区', '优服汇小区为您提供山西所有的社区、小区大全，您可以加入自己的小区，查看物业信息、小区附近的商家、优惠折扣，还可以和同小区邻居畅聊！'),
(55, 'weidian_index', '会员微信微店 1、{title}', '{title}', '{title}', '{title}'),
(56, 'community_news', '小区公告内容 1、标题{title} 2、名称{name} 3、地址{addr} 4、描述{desc}', '{title}_小区通知_{name}物业通知_{sitename}', '{name},小区通知,物业通知', '小区公告：{title}，{desc}'),
(57, 'community_tie', '小区贴吧帖子模版 {name} 小区名称 {addr} 小区地址 {title} 帖子标题 {desc} 帖子200字描述', '{title}_{name}_{name}贴吧_{sitename}', '{name}小区,{title}贴吧,{sitename}', '{desc}，{name}小区。'),
(58, 'community_tieba', '小区贴吧SEO模版 {name} 小区名字 {addr} 小区地址', '{name}_小区贴吧_{sitename}', '{name},小区贴吧,{sitename}', '{name}贴吧是由{sitename}为{name}小区业主提供的交流平台，通过{name}贴吧您可以与小区的邻居畅聊，欢迎{name}小区业主加入{name}贴吧。'),
(59, 'community_newslist', '小区公告内容 1、标题{title} 2、名称{name} 3、地址{addr} 4、描述{desc}', '小区通知_{name}物业通知_{sitename}', '{name},小区通知,物业通知', '小区公告：{title}，{desc}'),
(60, 'housekeeping_index', '家政服务', '家政服务', '家政服务', '家政服务'),
(61, 'housekeeping_appointment', '家政服务', '家政服务', '家政服务', '家政服务'),
(62, 'housekeeping_main', '家政服务', '家政服务', '家政服务', '家政服务');

-- --------------------------------------------------------

--
-- 表的结构 `bao_session`
--

CREATE TABLE `bao_session` (
  `session_id` varchar(64) NOT NULL,
  `session_expire` int(11) NOT NULL,
  `session_data` blob
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `bao_session`
--

INSERT INTO `bao_session` (`session_id`, `session_expire`, `session_data`) VALUES
('i0uaf483rkdgpj5d02h7u01434', 1506498988, 0x755f6f70656e69642537437325334132382533412532326f47465242307a556a4c544165372d4f794e42633648514a726d6e45253232253342755f696425374373253341332533412532323232322532322533426f617574685f696e666f253743612533413925334125374273253341362533412532326f70656e69642532322533427325334132382533412532326f47465242307a556a4c544165372d4f794e42633648514a726d6e4525323225334273253341382533412532326e69636b6e616d6525323225334273253341392533412532322545352538372541312545352538372541312545352541442539302532322533427325334133253341253232736578253232253342692533413225334273253341382533412532326c616e677561676525323225334273253341352533412532327a685f434e2532322533427325334134253341253232636974792532322533427325334136253341253232254539253935254246254536254232253939253232253342732533413825334125323270726f76696e636525323225334273253341362533412532322545362542392539362545352538442539372532322533427325334137253341253232636f756e747279253232253342732533413625334125323225453425423825414425453525394225424425323225334273253341313025334125323268656164696d6775726c253232253342732533413132362533412532326874747025334125324625324677782e716c6f676f2e636e2532466d6d6f70656e25324676695f33322532465069616a785371425261454b79466d6e6963546d42364268445152573269637a5656626e6a3276336e62646578594d5966716962766e486843684135374b69634f4a304779534151435969634c5673446c68454d38557a4a6148467725324630253232253342732533413925334125323270726976696c6567652532322533426125334130253341253742253744253744),
('159bvqg1bfjpmhbkvb6ogjqqi0', 1506498783, 0x755f6f70656e69642537437325334132382533412532326f47465242307a556a4c544165372d4f794e42633648514a726d6e45253232253342755f696425374373253341332533412532323232322532322533426f617574685f696e666f253743612533413925334125374273253341362533412532326f70656e69642532322533427325334132382533412532326f47465242307a556a4c544165372d4f794e42633648514a726d6e4525323225334273253341382533412532326e69636b6e616d6525323225334273253341392533412532322545352538372541312545352538372541312545352541442539302532322533427325334133253341253232736578253232253342692533413225334273253341382533412532326c616e677561676525323225334273253341352533412532327a685f434e2532322533427325334134253341253232636974792532322533427325334136253341253232254539253935254246254536254232253939253232253342732533413825334125323270726f76696e636525323225334273253341362533412532322545362542392539362545352538442539372532322533427325334137253341253232636f756e747279253232253342732533413625334125323225453425423825414425453525394225424425323225334273253341313025334125323268656164696d6775726c253232253342732533413132362533412532326874747025334125324625324677782e716c6f676f2e636e2532466d6d6f70656e25324676695f33322532465069616a785371425261454b79466d6e6963546d42364268445152573269637a5656626e6a3276336e62646578594d5966716962766e486843684135374b69634f4a304779534151435969634c5673446c68454d38557a4a6148467725324630253232253342732533413925334125323270726976696c6567652532322533426125334130253341253742253744253744),
('codu64u8ndt3m88phr3ukiu7a7', 1506498880, 0x755f6f70656e69642537437325334132382533412532326f4746524230374f794a456f4444684148714573576b795774425263253232253342755f696425374373253341332533412532323232312532322533426f617574685f696e666f253743612533413925334125374273253341362533412532326f70656e69642532322533427325334132382533412532326f4746524230374f794a456f4444684148714573576b79577442526325323225334273253341382533412532326e69636b6e616d652532322533427325334131322533412532322545352542452539372545392539372542322545392541352541452545382538432542362532322533427325334133253341253232736578253232253342692533413125334273253341382533412532326c616e677561676525323225334273253341352533412532327a685f434e2532322533427325334134253341253232636974792532322533427325334136253341253232254536254235254237254535253846254133253232253342732533413825334125323270726f76696e636525323225334273253341362533412532322545362542352542372545352538442539372532322533427325334137253341253232636f756e747279253232253342732533413625334125323225453425423825414425453525394225424425323225334273253341313025334125323268656164696d6775726c253232253342732533413132362533412532326874747025334125324625324677782e716c6f676f2e636e2532466d6d6f70656e25324676695f333225324651306a3454774754665449696148504641376844667234657a72314c4a53504662434b50506f696169624131696245326a3839753856446848763030725974467658524d34737069617469626c70374a526f5459534534446c51506725324630253232253342732533413925334125323270726976696c6567652532322533426125334130253341253742253744253744),
('861aiua9sh7ojaqv3taj3n41f3', 1506499039, 0x755f6f70656e69642537437325334132382533412532326f4746524230374f794a456f4444684148714573576b795774425263253232253342755f696425374373253341332533412532323232312532322533426f617574685f696e666f253743612533413925334125374273253341362533412532326f70656e69642532322533427325334132382533412532326f4746524230374f794a456f4444684148714573576b79577442526325323225334273253341382533412532326e69636b6e616d652532322533427325334131322533412532322545352542452539372545392539372542322545392541352541452545382538432542362532322533427325334133253341253232736578253232253342692533413125334273253341382533412532326c616e677561676525323225334273253341352533412532327a685f434e2532322533427325334134253341253232636974792532322533427325334136253341253232254536254235254237254535253846254133253232253342732533413825334125323270726f76696e636525323225334273253341362533412532322545362542352542372545352538442539372532322533427325334137253341253232636f756e747279253232253342732533413625334125323225453425423825414425453525394225424425323225334273253341313025334125323268656164696d6775726c253232253342732533413132362533412532326874747025334125324625324677782e716c6f676f2e636e2532466d6d6f70656e25324676695f333225324651306a3454774754665449696148504641376844667234657a72314c4a53504662434b50506f696169624131696245326a3839753856446848763030725974467658524d34737069617469626c70374a526f5459534534446c51506725324630253232253342732533413925334125323270726976696c6567652532322533426125334130253341253742253744253744),
('vvtf8js9sq9hibhmfqg5atlni6', 1506499356, 0x755f6f70656e69642537437325334132382533412532326f474652423030737642555968394d42536434723573426d544c3434253232253342755f696425374373253341332533412532323231372532322533426f617574685f696e666f253743612533413925334125374273253341362533412532326f70656e69642532322533427325334132382533412532326f474652423030737642555968394d42536434723573426d544c343425323225334273253341382533412532326e69636b6e616d652532322533427325334131352533412532322545372538332541372545382542452541332545362541342539322545372539412541452545382539422538422532322533427325334133253341253232736578253232253342692533413125334273253341382533412532326c616e677561676525323225334273253341352533412532327a685f434e2532322533427325334134253341253232636974792532322533427325334136253341253232254539253935254246254536254232253939253232253342732533413825334125323270726f76696e636525323225334273253341362533412532322545362542392539362545352538442539372532322533427325334137253341253232636f756e747279253232253342732533413625334125323225453425423825414425453525394225424425323225334273253341313025334125323268656164696d6775726c253232253342732533413132342533412532326874747025334125324625324677782e716c6f676f2e636e2532466d6d6f70656e25324676695f33322532466431504a33513475556d6b634d584272326f59337352635951706962545953473032516a646369614e43526c796b43314453385a33336963434f4431516363664c5233746231504e704846436b51444c4c696232756a62564b7725324630253232253342732533413925334125323270726976696c6567652532322533426125334130253341253742253744253744),
('fm84hrak0bh7d9kn0eehu316p5', 1506499315, 0x7665726966792537437325334134253341253232584f4c5425323225334261646d696e253743612533413131253341253742732533413825334125323261646d696e5f69642532322533427325334131253341253232312532322533427325334138253341253232757365726e616d65253232253342732533413525334125323261646d696e253232253342732533413825334125323270617373776f726425323225334273253341333225334125323265313061646333393439626135396162626535366530353766323066383833652532322533427325334137253341253232726f6c655f696425323225334273253341312533412532323125323225334273253341362533412532326d6f62696c6525323225334273253341313125334125323231353538393032323330312532322533427325334131312533412532326372656174655f74696d652532322533427325334131302533412532323134343138383632303325323225334273253341392533412532326372656174655f697025323225334273253341392533412532323132372e302e302e3125323225334273253341392533412532326c6173745f74696d65253232253342692533413135303634393432313225334273253341372533412532326c6173745f69702532322533427325334131312533412532323137352e392e38322e33392532322533427325334136253341253232636c6f7365642532322533427325334131253341253232302532322533427325334139253341253232726f6c655f6e616d65253232253342732533413135253341253232254537254233254242254537254242253946254537254145254131254537253930253836254535253931253938253232253342253744),
('pjrhsem07536lm9gedgc3rqf06', 1506499756, 0x755f6f70656e69642537437325334132382533412532326f474652423039753558336b77444943314e7276684179497871306b253232253342755f696425374373253341332533412532323231362532322533426f617574685f696e666f253743612533413925334125374273253341362533412532326f70656e69642532322533427325334132382533412532326f474652423039753558336b77444943314e7276684179497871306b25323225334273253341382533412532326e69636b6e616d652532322533427325334131322533412532325f5f5f5f5f2b576f772b637a2532322533427325334133253341253232736578253232253342692533413125334273253341382533412532326c616e677561676525323225334273253341352533412532327a685f434e2532322533427325334134253341253232636974792532322533427325334130253341253232253232253342732533413825334125323270726f76696e636525323225334273253341302533412532322532322533427325334137253341253232636f756e747279253232253342732533413625334125323225453425423925394625453925393725413825323225334273253341313025334125323268656164696d6775726c253232253342732533413132382533412532326874747025334125324625324677782e716c6f676f2e636e2532466d6d6f70656e25324676695f333225324651306a3454774754665449727665306836786962517a674f576e44763669614d69627a4f36704e52637244437a763871426963696246526d6d6f4a3046746243766e45576961706648696232376e354e515173424569627367354566647725324630253232253342732533413925334125323270726976696c6567652532322533426125334130253341253742253744253744),
('bgod3d3lpoldcr3jnbauclaf94', 1506499088, 0x755f6f70656e69642537437325334132382533412532326f474652423030737642555968394d42536434723573426d544c3434253232253342755f696425374373253341332533412532323231372532322533426f617574685f696e666f253743612533413925334125374273253341362533412532326f70656e69642532322533427325334132382533412532326f474652423030737642555968394d42536434723573426d544c343425323225334273253341382533412532326e69636b6e616d652532322533427325334131352533412532322545372538332541372545382542452541332545362541342539322545372539412541452545382539422538422532322533427325334133253341253232736578253232253342692533413125334273253341382533412532326c616e677561676525323225334273253341352533412532327a685f434e2532322533427325334134253341253232636974792532322533427325334136253341253232254539253935254246254536254232253939253232253342732533413825334125323270726f76696e636525323225334273253341362533412532322545362542392539362545352538442539372532322533427325334137253341253232636f756e747279253232253342732533413625334125323225453425423825414425453525394225424425323225334273253341313025334125323268656164696d6775726c253232253342732533413132342533412532326874747025334125324625324677782e716c6f676f2e636e2532466d6d6f70656e25324676695f33322532466431504a33513475556d6b634d584272326f59337352635951706962545953473032516a646369614e43526c796b43314453385a33336963434f4431516363664c5233746231504e704846436b51444c4c696232756a62564b7725324630253232253342732533413925334125323270726976696c6567652532322533426125334130253341253742253744253744),
('98dk6dmq4qr3vk5hg37kp3njs5', 1506498057, 0x755f6f70656e69642537437325334132382533412532326f474652423035524f315a353648507a754e6346784d743579593034253232253342755f696425374373253341332533412532323232332532322533426f617574685f696e666f253743612533413925334125374273253341362533412532326f70656e69642532322533427325334132382533412532326f474652423035524f315a353648507a754e6346784d74357959303425323225334273253341382533412532326e69636b6e616d652532322533427325334131352533412532322545362542332539352545382538302538352545322538302541322545372541372538302545352538352538332532322533427325334133253341253232736578253232253342692533413225334273253341382533412532326c616e677561676525323225334273253341352533412532327a685f434e2532322533427325334134253341253232636974792532322533427325334136253341253232254539253935254246254536254232253939253232253342732533413825334125323270726f76696e636525323225334273253341362533412532322545362542392539362545352538442539372532322533427325334137253341253232636f756e747279253232253342732533413625334125323225453425423825414425453525394225424425323225334273253341313025334125323268656164696d6775726c253232253342732533413132312533412532326874747025334125324625324677782e716c6f676f2e636e2532466d6d6f70656e25324676695f333225324651306a345477475466544a6a38775a3444476c696379677459485934614439686e6d6f495864464a6c515475564f49327068507a43676d6c6c5a7566324e6b764e6564386f43343866535539567a32504e48465430364125324630253232253342732533413925334125323270726976696c6567652532322533426125334130253341253742253744253744);

-- --------------------------------------------------------

--
-- 表的结构 `bao_setting`
--

CREATE TABLE `bao_setting` (
  `k` varchar(255) DEFAULT NULL,
  `v` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_setting`
--

INSERT INTO `bao_setting` (`k`, `v`) VALUES
('site', 'a:20:{s:8:\"sitename\";s:24:\"学生综合实践平台\";s:4:\"host\";s:25:\"http://www.shijian666.com\";s:6:\"imgurl\";s:25:\"http://www.shijian666.com\";s:7:\"android\";s:23:\"/download.aspx?id=29348\";s:3:\"ios\";s:23:\"/download.aspx?id=29348\";s:4:\"logo\";s:28:\"2017/09/23/59c62f59ca74f.png\";s:2:\"qq\";s:9:\"283068487\";s:3:\"tel\";s:12:\"0539-6999990\";s:5:\"email\";s:16:\"283068487@qq.com\";s:7:\"ucenter\";s:1:\"0\";s:6:\"weixin\";s:1:\"1\";s:3:\"icp\";s:17:\"琼ICP备00000号\";s:5:\"title\";s:24:\"学生综合实践平台\";s:7:\"keyword\";s:24:\"学生综合实践平台\";s:8:\"headinfo\";s:0:\"\";s:11:\"description\";s:24:\"学生综合实践平台\";s:6:\"tongji\";s:0:\"\";s:7:\"city_id\";s:1:\"8\";s:3:\"lng\";s:10:\"116.400244\";s:3:\"lat\";s:9:\"39.918034\";}'),
('attachs', 'a:35:{s:5:\"water\";s:28:\"2014/09/16/541827480b2f1.png\";s:8:\"shoplogo\";a:1:{s:5:\"thumb\";s:7:\"150X150\";}s:10:\"marketlogo\";a:1:{s:5:\"thumb\";s:7:\"150X150\";}s:6:\"market\";a:1:{s:5:\"thumb\";s:7:\"300X300\";}s:9:\"marketpic\";a:1:{s:5:\"thumb\";s:7:\"600X400\";}s:8:\"sitelogo\";a:1:{s:5:\"thumb\";s:6:\"180X55\";}s:8:\"shopnews\";a:1:{s:5:\"thumb\";s:7:\"260X260\";}s:11:\"lifeservice\";a:2:{s:5:\"thumb\";s:0:\"\";s:4:\"icon\";s:6:\"120X80\";}s:8:\"activity\";a:1:{s:5:\"thumb\";s:7:\"640X480\";}s:6:\"coupon\";a:1:{s:5:\"thumb\";s:7:\"577X430\";}s:7:\"huodong\";a:1:{s:5:\"thumb\";s:7:\"320X240\";}s:9:\"billboard\";a:1:{s:5:\"thumb\";s:7:\"640X480\";}s:8:\"billcate\";a:1:{s:5:\"thumb\";s:5:\"60X60\";}s:7:\"article\";a:1:{s:5:\"thumb\";s:7:\"260X260\";}s:13:\"integralgoods\";a:1:{s:5:\"thumb\";s:7:\"350X350\";}s:4:\"dian\";a:1:{s:5:\"thumb\";s:7:\"340X270\";}s:8:\"dingroom\";a:1:{s:5:\"thumb\";s:7:\"340X270\";}s:12:\"shopdianping\";a:1:{s:5:\"thumb\";s:7:\"380X260\";}s:5:\"found\";a:1:{s:5:\"thumb\";s:7:\"640X300\";}s:4:\"user\";a:1:{s:5:\"thumb\";a:3:{s:5:\"thumb\";s:7:\"200X200\";s:6:\"middle\";s:7:\"120X120\";s:5:\"small\";s:5:\"60X60\";}}s:9:\"shopphoto\";a:1:{s:5:\"thumb\";s:7:\"300X300\";}s:9:\"recommend\";a:1:{s:5:\"thumb\";s:7:\"180X180\";}s:4:\"tuan\";a:1:{s:5:\"thumb\";s:7:\"545X305\";}s:4:\"life\";a:1:{s:5:\"thumb\";s:7:\"320X320\";}s:7:\"lifepic\";a:1:{s:5:\"thumb\";s:7:\"600X400\";}s:7:\"votepic\";a:1:{s:5:\"thumb\";s:7:\"150X150\";}s:6:\"weixin\";a:1:{s:5:\"thumb\";s:7:\"320X120\";}s:10:\"votebanner\";a:1:{s:5:\"thumb\";s:7:\"640X300\";}s:5:\"goods\";a:1:{s:5:\"thumb\";s:7:\"480X480\";}s:10:\"shopbanner\";a:1:{s:5:\"thumb\";s:7:\"320X120\";}s:11:\"shopbanner1\";a:1:{s:5:\"thumb\";s:8:\"1000X300\";}s:10:\"eleproduct\";a:1:{s:5:\"thumb\";s:7:\"300X300\";}s:8:\"dingmenu\";a:1:{s:5:\"thumb\";s:7:\"600X450\";}s:4:\"mall\";a:1:{s:5:\"thumb\";s:7:\"300X140\";}s:6:\"editor\";a:1:{s:5:\"thumb\";s:7:\"600X600\";}}'),
('ucenter', 'a:15:{s:7:\"charset\";s:1:\"1\";s:10:\"UC_CONNECT\";s:8:\"mysql111\";s:9:\"UC_DBHOST\";s:24:\"qdm169940700.my3w.com111\";s:9:\"UC_DBUSER\";s:15:\"qdm169940700111\";s:7:\"UC_DBPW\";s:11:\"fu123123111\";s:9:\"UC_DBNAME\";s:15:\"qdm169940700_db\";s:12:\"UC_DBCHARSET\";s:3:\"gbk\";s:13:\"UC_DBTABLEPRE\";s:30:\"`qdm169940700_db`.pre_ucenter_\";s:12:\"UC_DBCONNECT\";s:1:\"0\";s:6:\"UC_KEY\";s:39:\"9f0eEu7yKduxws5A1uTpxH9XJudjROHk0KAoS+g\";s:6:\"UC_API\";s:27:\"http://www.7v9.cn/uc_server\";s:10:\"UC_CHARSET\";s:3:\"gbk\";s:5:\"UC_IP\";s:0:\"\";s:8:\"UC_APPID\";s:1:\"3\";s:6:\"UC_PPP\";s:2:\"20\";}'),
('sms', 'a:3:{s:3:\"url\";s:92:\"http://api.smsbao.com/sms?u=221115&p=87ed1b34e613f50c38c0bb56279b51fd&m={mobile}&c={content}\";s:7:\"charset\";s:1:\"0\";s:4:\"code\";s:1:\"0\";}'),
('mail', 'a:5:{s:4:\"smtp\";s:18:\"smtp.exmail.qq.com\";s:4:\"port\";s:2:\"25\";s:8:\"username\";s:15:\"admin@junchang.taobao.com\";s:8:\"password\";s:8:\"Fu201200\";s:4:\"from\";s:15:\"admin@ly190.com\";}'),
('weixin', 'a:9:{s:5:\"token\";s:32:\"e10adc3949ba59abbe56e057f20f883e\";s:5:\"appid\";s:18:\"wxe9368584f5249426\";s:9:\"appsecret\";s:32:\"c3bb4a8c357e22d5f3a2f104d49b8dab\";s:2:\"id\";s:15:\"gh_f272c7b8c437\";s:4:\"type\";s:1:\"1\";s:11:\"description\";s:18:\"很爱很爱你！\";s:5:\"title\";s:0:\"\";s:7:\"linkurl\";s:0:\"\";s:5:\"photo\";s:0:\"\";}'),
('integral', 'a:6:{s:5:\"share\";s:1:\"5\";s:5:\"reply\";s:1:\"1\";s:6:\"mobile\";s:3:\"100\";s:5:\"email\";s:3:\"100\";s:4:\"sign\";s:1:\"5\";s:9:\"firstsign\";s:2:\"50\";}'),
('connect', 'a:7:{s:5:\"debug\";s:1:\"1\";s:9:\"qq_app_id\";s:9:\"101373442\";s:10:\"qq_app_key\";s:32:\"55bb79076d7a16cefa10295315e70a56\";s:9:\"wb_app_id\";s:10:\"1326887888\";s:10:\"wb_app_key\";s:32:\"c8f3a5a2984f989fd568c0a02ae5a183\";s:9:\"wx_app_id\";s:0:\"\";s:10:\"wx_app_key\";s:0:\"\";}'),
('prestige', 'a:7:{s:5:\"login\";s:1:\"1\";s:8:\"dianping\";s:1:\"5\";s:5:\"share\";s:1:\"2\";s:5:\"reply\";s:1:\"1\";s:4:\"tuan\";s:2:\"10\";s:6:\"mobile\";s:3:\"100\";s:5:\"email\";s:3:\"100\";}'),
('weixinmenu', 'a:2:{s:6:\"button\";a:3:{i:1;s:6:\"关于\";i:2;s:6:\"功能\";i:3;s:6:\"其他\";}s:5:\"child\";a:3:{i:1;a:5:{i:1;a:2:{s:4:\"name\";s:12:\"公司介绍\";s:3:\"url\";s:33:\"http://127.0.0.1mobile/index.html\";}i:2;a:2:{s:4:\"name\";s:0:\"\";s:3:\"url\";s:0:\"\";}i:3;a:2:{s:4:\"name\";s:0:\"\";s:3:\"url\";s:0:\"\";}i:4;a:2:{s:4:\"name\";s:0:\"\";s:3:\"url\";s:0:\"\";}i:5;a:2:{s:4:\"name\";s:0:\"\";s:3:\"url\";s:0:\"\";}}i:2;a:5:{i:1;a:2:{s:4:\"name\";s:6:\"团购\";s:3:\"url\";s:38:\"http://127.0.0.1mobile/tuan/index.html\";}i:2;a:2:{s:4:\"name\";s:6:\"商家\";s:3:\"url\";s:38:\"http://127.0.0.1mobile/shop/index.html\";}i:3;a:2:{s:4:\"name\";s:6:\"发现\";s:3:\"url\";s:39:\"http://127.0.0.1mobile/found/index.html\";}i:4;a:2:{s:4:\"name\";s:6:\"吃饭\";s:3:\"url\";s:44:\"http://127.0.0.1mobile/shop/index/cat/1.html\";}i:5;a:2:{s:4:\"name\";s:12:\"休闲娱乐\";s:3:\"url\";s:45:\"http://127.0.0.1mobile/shop/index/cat/12.html\";}}i:3;a:5:{i:1;a:2:{s:4:\"name\";s:6:\"测试\";s:3:\"url\";s:33:\"http://127.0.0.1mobile/index.html\";}i:2;a:2:{s:4:\"name\";s:0:\"\";s:3:\"url\";s:0:\"\";}i:3;a:2:{s:4:\"name\";s:0:\"\";s:3:\"url\";s:0:\"\";}i:4;a:2:{s:4:\"name\";s:0:\"\";s:3:\"url\";s:0:\"\";}i:5;a:2:{s:4:\"name\";s:0:\"\";s:3:\"url\";s:0:\"\";}}}}'),
('shop', 'a:5:{s:6:\"weixin\";s:2:\"30\";s:5:\"yuyue\";s:2:\"30\";s:4:\"card\";s:2:\"30\";s:3:\"bao\";s:2:\"30\";s:4:\"life\";a:2:{s:3:\"top\";s:1:\"1\";s:6:\"urgent\";s:1:\"1\";}}'),
('mobile', 'a:3:{s:8:\"guaguale\";s:1:\"2\";s:9:\"choujiang\";s:1:\"1\";s:8:\"yaoyiyao\";s:1:\"3\";}'),
('ele', 'a:2:{s:4:\"shop\";a:13:{i:0;s:2:\"42\";i:1;s:2:\"45\";i:2;s:2:\"47\";i:3;s:2:\"52\";i:4;s:2:\"51\";i:5;s:1:\"2\";i:6;s:2:\"43\";i:7;s:2:\"44\";i:8;s:2:\"48\";i:9;s:2:\"49\";i:10;s:2:\"50\";i:11;s:2:\"66\";i:12;s:2:\"54\";}s:4:\"tuan\";a:30:{i:0;s:1:\"4\";i:1;s:1:\"3\";i:2;s:1:\"5\";i:3;s:1:\"6\";i:4;s:1:\"7\";i:5;s:1:\"8\";i:6;s:1:\"9\";i:7;s:2:\"10\";i:8;s:2:\"11\";i:9;s:2:\"12\";i:10;s:2:\"13\";i:11;s:2:\"14\";i:12;s:2:\"16\";i:13;s:2:\"17\";i:14;s:2:\"18\";i:15;s:2:\"19\";i:16;s:2:\"20\";i:17;s:2:\"21\";i:18;s:2:\"22\";i:19;s:2:\"23\";i:20;s:2:\"24\";i:21;s:2:\"25\";i:22;s:2:\"26\";i:23;s:2:\"27\";i:24;s:2:\"28\";i:25;s:2:\"29\";i:26;s:2:\"30\";i:27;s:2:\"31\";i:28;s:2:\"32\";i:29;s:2:\"33\";}}'),
('housework', 'a:2:{s:4:\"gold\";s:1:\"1\";s:3:\"num\";s:1:\"3\";}'),
('weidian', 'a:5:{s:10:\"bianlidian\";s:2:\"16\";s:11:\"xianhuadian\";s:2:\"33\";s:13:\"shengxiandian\";s:2:\"44\";s:9:\"kaoyadian\";s:1:\"2\";s:10:\"dangaodian\";s:2:\"43\";}'),
('mall', 'a:16:{s:5:\"ming1\";s:9:\"烤鸭店\";s:5:\"dian1\";s:1:\"1\";s:5:\"ming2\";s:9:\"蛋糕店\";s:5:\"dian2\";s:1:\"9\";s:5:\"ming3\";s:9:\"鲜花店\";s:5:\"dian3\";s:2:\"10\";s:5:\"ming4\";s:9:\"水果店\";s:5:\"dian4\";s:2:\"11\";s:5:\"ming5\";s:9:\"便利店\";s:5:\"dian5\";s:2:\"12\";s:5:\"ming6\";s:9:\"坚果店\";s:5:\"dian6\";s:1:\"6\";s:5:\"ming7\";s:9:\"奶茶店\";s:5:\"dian7\";s:1:\"7\";s:5:\"ming8\";s:9:\"茶叶店\";s:5:\"dian8\";s:1:\"8\";}'),
('quanming', 'a:12:{s:7:\"content\";s:30:\"全民经济人内容描述。\";s:5:\"intro\";s:36:\"全民经济人活动规则描述。\";s:7:\"is_tuan\";s:1:\"0\";s:7:\"is_mall\";s:1:\"0\";s:6:\"is_ele\";s:1:\"0\";s:4:\"rate\";s:1:\"5\";s:5:\"rate1\";s:1:\"1\";s:5:\"rate2\";s:1:\"2\";s:5:\"rate3\";s:1:\"3\";s:5:\"rate4\";s:1:\"4\";s:5:\"rate5\";s:1:\"5\";s:5:\"rate6\";s:1:\"6\";}');

-- --------------------------------------------------------

--
-- 表的结构 `bao_share_cate`
--

CREATE TABLE `bao_share_cate` (
  `cate_id` int(10) NOT NULL,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_share_cate`
--

INSERT INTO `bao_share_cate` (`cate_id`, `cate_name`, `parent_id`, `orderby`) VALUES
(4, '旅游', 0, 2);

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop`
--

CREATE TABLE `bao_shop` (
  `shop_id` int(10) UNSIGNED NOT NULL,
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
  `tui_uid` int(11) DEFAULT '0' COMMENT '代理商'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_shop`
--

INSERT INTO `bao_shop` (`shop_id`, `user_id`, `cate_id`, `area_id`, `city_id`, `type_id`, `business_id`, `shop_name`, `logo`, `photo`, `tel`, `extension`, `qq`, `mobile`, `contact`, `addr`, `score`, `score_num`, `fans_num`, `d1`, `d2`, `d3`, `orderby`, `lng`, `lat`, `ding_num`, `closed`, `view`, `audit`, `is_pei`, `is_ding`, `tags`, `create_time`, `create_ip`, `tui_uid`) VALUES
(144, 214, 65, 24, 8, '0', 33, '贝拉小镇', '2017/09/27/thumb_59cbacdfc5d40.jpg', '2017/09/27/thumb_59cbad090f234.jpg', '123123132123', '', '', '', '李明', '湖南省长沙市望城区金州大道光明村', 0, 0, 0, 0, 0, 0, 100, '', '', 0, 0, 18, 1, 0, 1, '', 1506142639, '192.168.11.1', 0);

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_banner`
--

CREATE TABLE `bao_shop_banner` (
  `banner_id` int(10) NOT NULL,
  `shop_id` int(10) DEFAULT '0',
  `is_mobile` tinyint(1) DEFAULT '1',
  `photo` varchar(128) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT NULL,
  `audit` tinyint(1) DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_branch`
--

CREATE TABLE `bao_shop_branch` (
  `branch_id` int(11) UNSIGNED NOT NULL,
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
  `score_num` int(10) UNSIGNED NOT NULL,
  `closed` tinyint(1) DEFAULT '0',
  `view` int(11) DEFAULT '0',
  `fans_num` int(11) DEFAULT '0',
  `audit` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_cate`
--

CREATE TABLE `bao_shop_cate` (
  `cate_id` int(10) UNSIGNED NOT NULL,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `is_hot` tinyint(1) DEFAULT '0',
  `d1` varchar(32) DEFAULT '价格',
  `d2` varchar(32) DEFAULT '环境',
  `d3` varchar(32) DEFAULT '服务',
  `title` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_shop_cate`
--

INSERT INTO `bao_shop_cate` (`cate_id`, `cate_name`, `parent_id`, `orderby`, `is_hot`, `d1`, `d2`, `d3`, `title`) VALUES
(65, '旅游', 0, 1, 0, '号', '坏', '很好', '国内外旅游');

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_comment`
--

CREATE TABLE `bao_shop_comment` (
  `comment_id` int(11) NOT NULL COMMENT '主键id',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级评论id,若是一级评论则为0',
  `nickname` varchar(100) DEFAULT NULL COMMENT '评论人昵称',
  `user_id` int(11) DEFAULT NULL COMMENT '评论人UID',
  `post_id` int(11) DEFAULT NULL COMMENT '新闻编号',
  `content` text COMMENT '评论内容',
  `zan` int(6) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT NULL COMMENT '评论或回复发表时间',
  `create_ip` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_details`
--

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
  `delivery_time` tinyint(3) DEFAULT '30' COMMENT '接单倒计时（单位：分钟）'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_shop_details`
--

INSERT INTO `bao_shop_details` (`shop_id`, `details`, `theme_id`, `theme_expir_time`, `discounts`, `business_time`, `price`, `near`, `wei_pic`, `is_dingyue`, `app_id`, `app_key`, `token`, `weixin_msg`, `menus`, `seo_title`, `seo_keywords`, `seo_description`, `icp`, `sitelogo`, `bank`, `delivery_time`) VALUES
(144, '<p><img src=\"http://dev.hnwtt.cn/attachs/editor/2017/09/24/thumb_59c7817e64921.jpg\" _src=\"http://dev.hnwtt.cn/attachs/editor/2017/09/24/thumb_59c7817e64921.jpg\"/></p>', 0, NULL, NULL, '07:00-20:00', NULL, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30);

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_dianping`
--

CREATE TABLE `bao_shop_dianping` (
  `dianping_id` int(10) UNSIGNED NOT NULL,
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
  `closed` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_dianping_pics`
--

CREATE TABLE `bao_shop_dianping_pics` (
  `pic_id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(11) DEFAULT '0',
  `dianping_id` int(11) DEFAULT NULL,
  `pic` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_ding_cate`
--

CREATE TABLE `bao_shop_ding_cate` (
  `cate_id` int(11) UNSIGNED NOT NULL,
  `shop_id` int(11) DEFAULT '0',
  `cate_name` varchar(64) DEFAULT '',
  `orderby` tinyint(3) DEFAULT '100'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_shop_ding_cate`
--

INSERT INTO `bao_shop_ding_cate` (`cate_id`, `shop_id`, `cate_name`, `orderby`) VALUES
(1, 1, '旅游', 2);

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_ding_dianping`
--

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
  `closed` tinyint(2) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_ding_dianping_pic`
--

CREATE TABLE `bao_shop_ding_dianping_pic` (
  `pic_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `pic` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_ding_menu`
--

CREATE TABLE `bao_shop_ding_menu` (
  `menu_id` int(11) UNSIGNED NOT NULL,
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
  `closed` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_shop_ding_menu`
--

INSERT INTO `bao_shop_ding_menu` (`menu_id`, `menu_name`, `shop_id`, `cate_id`, `photo`, `price`, `ding_price`, `is_tuijian`, `is_new`, `is_sale`, `create_time`, `create_ip`, `closed`) VALUES
(1, '旅游', 1, 1, '2015/08/03/55bf85a948ce5.jpg', 35000, 32000, 1, 1, 1, 1438614975, '127.0.0.1', 0);

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_ding_order`
--

CREATE TABLE `bao_shop_ding_order` (
  `order_id` mediumint(8) NOT NULL,
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
  `create_ip` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_ding_room`
--

CREATE TABLE `bao_shop_ding_room` (
  `room_id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `intro` varchar(64) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  `money` int(11) DEFAULT '0',
  `last_date` date DEFAULT NULL,
  `last_t` tinyint(3) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0' COMMENT '1 代表该包厢已经不能被预定了'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_ding_setting`
--

CREATE TABLE `bao_shop_ding_setting` (
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `mobile` varchar(11) DEFAULT NULL COMMENT '有单了，通知手机号',
  `money` int(11) DEFAULT '0' COMMENT '包厢需要缴纳定金',
  `bao_time` tinyint(3) DEFAULT '0' COMMENT '包厢预定间隔小时',
  `start_time` tinyint(3) DEFAULT '0' COMMENT '开始接客时间',
  `end_time` tinyint(3) DEFAULT '0' COMMENT '打烊时间',
  `is_bao` tinyint(1) DEFAULT '0' COMMENT '1代表包厢有位子',
  `is_ting` tinyint(1) DEFAULT '0' COMMENT '1代表大厅有位置'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_shop_ding_setting`
--

INSERT INTO `bao_shop_ding_setting` (`shop_id`, `mobile`, `money`, `bao_time`, `start_time`, `end_time`, `is_bao`, `is_ting`) VALUES
(144, '', 2000, 3, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_ding_yuyue`
--

CREATE TABLE `bao_shop_ding_yuyue` (
  `ding_id` mediumint(8) NOT NULL,
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
  `create_ip` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_expand`
--

CREATE TABLE `bao_shop_expand` (
  `expand_id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `expand` tinyint(3) DEFAULT NULL,
  `intro` varchar(256) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_favorites`
--

CREATE TABLE `bao_shop_favorites` (
  `favorites_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `last_news_id` int(11) DEFAULT '0',
  `read_id` int(11) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_life_service`
--

CREATE TABLE `bao_shop_life_service` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `cate_id` smallint(5) UNSIGNED NOT NULL,
  `area_id` smallint(5) UNSIGNED NOT NULL,
  `city_id` smallint(5) UNSIGNED NOT NULL,
  `business_id` smallint(5) UNSIGNED NOT NULL,
  `shop_name` varchar(64) NOT NULL,
  `logo` varchar(64) NOT NULL,
  `photo` varchar(64) NOT NULL,
  `tel` varchar(64) DEFAULT NULL,
  `extension` varchar(8) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `contact` varchar(32) DEFAULT NULL,
  `addr` varchar(64) DEFAULT NULL,
  `create_ip` varchar(15) NOT NULL,
  `create_time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_logs`
--

CREATE TABLE `bao_shop_logs` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `type` enum('yuyue','card','wei','bao') DEFAULT NULL,
  `date` date DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_money`
--

CREATE TABLE `bao_shop_money` (
  `money_id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL,
  `type` enum('tuan','ele','ding','goods') DEFAULT 'tuan',
  `order_id` int(11) DEFAULT '0',
  `intro` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_shop_money`
--

INSERT INTO `bao_shop_money` (`money_id`, `shop_id`, `money`, `create_time`, `create_ip`, `type`, `order_id`, `intro`) VALUES
(92, 144, 26000, 1506229519, '222.244.144.157', 'goods', 123456, '444');

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_news`
--

CREATE TABLE `bao_shop_news` (
  `news_id` int(11) UNSIGNED NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `cate_id` smallint(5) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `details` text,
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `orderby` tinyint(1) DEFAULT '50',
  `audit` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_pic`
--

CREATE TABLE `bao_shop_pic` (
  `pic_id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100',
  `audit` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_shop_pic`
--

INSERT INTO `bao_shop_pic` (`pic_id`, `shop_id`, `photo`, `title`, `orderby`, `audit`, `create_time`, `create_ip`) VALUES
(34, 144, '2017/09/27/thumb_59cbacec51e79.jpg', '1', 100, 0, 1506520300, '175.13.159.197');

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_weixin_access`
--

CREATE TABLE `bao_shop_weixin_access` (
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `access_token` varchar(256) DEFAULT NULL,
  `expir_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_shop_weixin_access`
--

INSERT INTO `bao_shop_weixin_access` (`shop_id`, `access_token`, `expir_time`) VALUES
(1, 'ZgaB-vJS_07uHOFjeFl2gRTV6DK0KMq1_Wu_7vA5PmLrPu7DIdExMlYIEGR9nKqku1FkXsDQYp3N2pgH9NgA25QZmUEY2NIccM6RbDUjFa4', 1439191115),
(128, '0scLp_xg1dq48UkRDpblpgkSKII6j0yaDjBBUFVkGb7v7aYJU8DY5hj47vclxUunSdWFJCl57sqDCqHEVomfh2sPIWr-I7lS0fdMkHmS11UQCJdADAZLS', 1446702461);

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_weixin_keyword`
--

CREATE TABLE `bao_shop_weixin_keyword` (
  `keyword_id` int(10) UNSIGNED NOT NULL,
  `shop_id` int(11) DEFAULT '0',
  `keyword` varchar(32) DEFAULT NULL,
  `type` enum('news','text') DEFAULT 'text' COMMENT '0普通消息 1图片消息',
  `title` varchar(128) DEFAULT NULL,
  `contents` text,
  `url` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_worker`
--

CREATE TABLE `bao_shop_worker` (
  `worker_id` int(10) NOT NULL,
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
  `status` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_shop_worker`
--

INSERT INTO `bao_shop_worker` (`worker_id`, `user_id`, `shop_id`, `name`, `tel`, `mobile`, `qq`, `weixin`, `work`, `addr`, `tuan`, `coupon`, `yuyue`, `status`) VALUES
(5, 214, 144, '贝晓拉', '0731-12345678', 2147483647, '236467617', '13590288934', '店员', '长沙', 0, 0, 0, 0),
(6, 233, 144, '贝阿呗', '0731-12345678', 2147483647, '236467617', '13590288934', '店员', '长沙', 0, 0, 0, 0),
(7, 217, 144, '黄海洋', '', 2147483647, '', '', '扫码的', '奥克斯', 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `bao_shop_yuyue`
--

CREATE TABLE `bao_shop_yuyue` (
  `yuyue_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT '0',
  `shop_id` int(11) UNSIGNED DEFAULT '0',
  `name` varchar(32) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `yuyue_date` date DEFAULT NULL,
  `yuyue_time` varchar(32) DEFAULT NULL,
  `number` smallint(5) UNSIGNED DEFAULT '0',
  `code` varchar(32) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0',
  `create_ip` varchar(15) DEFAULT NULL,
  `used` tinyint(1) DEFAULT '0',
  `used_time` int(11) DEFAULT '0',
  `used_ip` varchar(15) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_sms`
--

CREATE TABLE `bao_sms` (
  `sms_id` int(10) UNSIGNED NOT NULL,
  `sms_key` varchar(32) DEFAULT NULL,
  `sms_explain` varchar(1024) DEFAULT NULL,
  `sms_tmpl` varchar(2048) DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_sms`
--

INSERT INTO `bao_sms` (`sms_id`, `sms_key`, `sms_explain`, `sms_tmpl`, `is_open`) VALUES
(1, 'sms_code', '可用标签：\r\n1、验证码 :{code}', '您的手机验证码：{code}，如非本人操作，请忽略！【{sitename}】', 1),
(4, 'sms_shop_yuyue', '1、{shop_name}商家\r\n2、{shop_tel}商家电话\r\n3、{code}电子预约券\r\n4、{shop_addr}商家地址', '您预约的优惠券：{code},您可前往{shop_name}进行消费;商家地址:{shop_addr},电话{shop_tel};【{sitename}】', 0),
(3, 'sms_coupon_downloads', '可使用标签：\r\n1、{coupon_title} 优惠券标题\r\n2、{shop_name}商家\r\n3、{code}优惠券码\r\n4、{expire_date}有效期', '您下载了商家{shop_name}的优惠券{coupon_title}，优惠券码：{code}，您可在{expire_date}之前使用该优惠券！【{sitename}】', 0),
(5, 'sms_tuan', '报名成功后发送短信给用户！\r\n1、{nickname}用户昵称\r\n2、{tuan}活动名称\r\n3、{code}活动券码', '您订购的{tuan}活动券码：{code}；请妥善保管，勿告知他人！【sitename】', 1),
(6, 'sms_newpwd', '找回密码：\r\n1、{newpwd}新密码', '您的密码被重置成{newpwd}，您可使用密码登录！【{sitename}】', 0),
(7, 'sms_shop_mall', '商城通知商家短信模板', '您有新的订单！【{sitename}】', 0),
(8, 'sms_shop_tuan', '团购通知商家信息模板', '您有新的订单！【{sitename}】', 0),
(24, 'sms_ele', '订餐后发送短信给用户！ 1、{nickname}用户昵称 2、{shopname}外卖商家', '您在{shopname}点的外卖订单已经生成，请耐心等待美食的到来。【{sitename}】', 0),
(25, 'sms_shop_ele', '订餐通知商家短信模版', '您有新的订单！【{sitename}】', 0),
(26, 'sms_shangjia_yuyue', '{name}预约人', '{name}预约了您的场地，请及时登录你的网站回复，【{sitename}】。', 0),
(27, 'sms_bill_order_confirm', '缴费成功通知用户短信模版', '您的{billtype}缴费订单已处理。【{sitename}】', 0),
(28, 'sms_bill_order_refund', '缴费退款通知用户短信模版', '您的{billtype}缴费订单已退款，处理说明：{memo}【{sitename}】', 0);

-- --------------------------------------------------------

--
-- 表的结构 `bao_system_content`
--

CREATE TABLE `bao_system_content` (
  `content_id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(32) DEFAULT NULL,
  `contents` text,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(255) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT '100'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_system_content`
--

INSERT INTO `bao_system_content` (`content_id`, `title`, `contents`, `create_time`, `create_ip`, `orderby`) VALUES
(1, '关于我们', '<p>关于我们</p>', 1410871894, '127.0.0.1', 1),
(2, '人才招聘', '<p>人才招聘</p>', 1410872282, '127.0.0.1', 5),
(3, '联系我们', '<p>联系我们</p>', 1410872306, '127.0.0.1', 2),
(4, '媒体合作', '<p>媒体合作</p>', 1410872331, '127.0.0.1', 3),
(5, '广告合作', '<p>广告合作</p>', 1410872363, '127.0.0.1', 6),
(6, '免责声明', '<p>免责声明</p>', 1410872456, '127.0.0.1', 7),
(7, '服务协议', '<p>服务协议</p>', 1410872491, '127.0.0.1', 8);

-- --------------------------------------------------------

--
-- 表的结构 `bao_template`
--

CREATE TABLE `bao_template` (
  `template_id` smallint(6) UNSIGNED NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `theme` varchar(32) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_template`
--

INSERT INTO `bao_template` (`template_id`, `name`, `theme`, `photo`, `is_default`) VALUES
(4, '默认模版', 'default', 'index.jpg', 1),
(5, '测试模板', 'test', 'index.jpg', 0),
(6, '新版红色', 'news', 'index.jpg', 0);

-- --------------------------------------------------------

--
-- 表的结构 `bao_template_setting`
--

CREATE TABLE `bao_template_setting` (
  `theme` varchar(32) DEFAULT NULL,
  `setting` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_template_setting`
--

INSERT INTO `bao_template_setting` (`theme`, `setting`) VALUES
('default', 'a:2:{s:5:\"index\";a:8:{s:5:\"first\";a:6:{s:4:\"name\";s:13:\"装修&服务\";s:5:\"value\";s:1:\"7\";s:4:\"tuan\";s:3:\"100\";s:2:\"ad\";s:1:\"3\";s:5:\"total\";s:3:\"164\";s:4:\"near\";s:2:\"31\";}s:6:\"second\";a:6:{s:4:\"name\";s:13:\"婚庆&酒店\";s:5:\"value\";s:1:\"6\";s:4:\"tuan\";s:2:\"41\";s:2:\"ad\";s:1:\"4\";s:5:\"total\";s:2:\"54\";s:4:\"near\";s:2:\"10\";}s:5:\"third\";a:6:{s:4:\"name\";s:13:\"家政&服务\";s:5:\"value\";s:2:\"14\";s:4:\"tuan\";s:3:\"107\";s:2:\"ad\";s:1:\"5\";s:5:\"total\";s:2:\"85\";s:4:\"near\";s:2:\"21\";}s:6:\"fourth\";a:6:{s:4:\"name\";s:13:\"汽车&驾校\";s:5:\"value\";s:1:\"8\";s:4:\"tuan\";s:2:\"94\";s:2:\"ad\";s:1:\"7\";s:5:\"total\";s:2:\"54\";s:4:\"near\";s:2:\"12\";}s:5:\"fifth\";a:6:{s:4:\"name\";s:12:\"教育培训\";s:5:\"value\";s:2:\"11\";s:4:\"tuan\";s:2:\"96\";s:2:\"ad\";s:1:\"8\";s:5:\"total\";s:2:\"87\";s:4:\"near\";s:2:\"32\";}s:5:\"sixth\";a:6:{s:4:\"name\";s:13:\"母婴&亲子\";s:5:\"value\";s:2:\"10\";s:4:\"tuan\";s:2:\"40\";s:2:\"ad\";s:2:\"14\";s:5:\"total\";s:3:\"150\";s:4:\"near\";s:2:\"51\";}s:7:\"seventh\";a:6:{s:4:\"name\";s:13:\"丽人&保养\";s:5:\"value\";s:1:\"9\";s:4:\"tuan\";s:2:\"36\";s:2:\"ad\";s:2:\"15\";s:5:\"total\";s:3:\"187\";s:4:\"near\";s:2:\"55\";}s:6:\"eighth\";a:6:{s:4:\"name\";s:13:\"餐饮&娱乐\";s:5:\"value\";s:1:\"1\";s:4:\"tuan\";s:1:\"1\";s:2:\"ad\";s:2:\"16\";s:5:\"total\";s:3:\"562\";s:4:\"near\";s:3:\"145\";}}s:5:\"floor\";a:6:{s:5:\"first\";a:3:{s:4:\"name\";s:12:\"休闲零食\";s:5:\"value\";s:2:\"21\";s:2:\"ad\";s:2:\"24\";}s:6:\"second\";a:3:{s:4:\"name\";s:12:\"厨房用品\";s:5:\"value\";s:1:\"1\";s:2:\"ad\";s:2:\"25\";}s:5:\"third\";a:3:{s:4:\"name\";s:12:\"家具电器\";s:5:\"value\";s:2:\"14\";s:2:\"ad\";s:2:\"26\";}s:6:\"fourth\";a:3:{s:4:\"name\";s:12:\"婚庆用品\";s:5:\"value\";s:1:\"2\";s:2:\"ad\";s:2:\"27\";}s:5:\"fifth\";a:3:{s:4:\"name\";s:12:\"生活用品\";s:5:\"value\";s:1:\"6\";s:2:\"ad\";s:2:\"28\";}s:5:\"sixth\";a:3:{s:4:\"name\";s:12:\"建材专区\";s:5:\"value\";s:2:\"33\";s:2:\"ad\";s:2:\"29\";}}}');

-- --------------------------------------------------------

--
-- 表的结构 `bao_tongji`
--

CREATE TABLE `bao_tongji` (
  `tongji_id` int(10) UNSIGNED NOT NULL,
  `from` varchar(12) DEFAULT NULL,
  `keyword` varchar(32) DEFAULT NULL COMMENT '超过的部分忽略',
  `type` tinyint(1) DEFAULT '0' COMMENT '1 团购  2购物  暂时只统计这两块',
  `money` int(11) DEFAULT NULL,
  `year` smallint(4) DEFAULT NULL,
  `month` char(2) DEFAULT NULL,
  `day` char(2) DEFAULT NULL,
  `date` date DEFAULT '2015-03-24',
  `is_mobile` tinyint(1) DEFAULT '0',
  `is_weixin` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_tuan`
--

CREATE TABLE `bao_tuan` (
  `tuan_id` int(10) UNSIGNED NOT NULL,
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
  `kill_price` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_tuan_cate`
--

CREATE TABLE `bao_tuan_cate` (
  `cate_id` int(10) NOT NULL,
  `cate_name` varchar(32) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `orderby` tinyint(3) DEFAULT NULL,
  `is_hot` tinyint(2) DEFAULT NULL,
  `rate` int(11) DEFAULT '60' COMMENT '结算费率'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_tuan_cate`
--

INSERT INTO `bao_tuan_cate` (`cate_id`, `cate_name`, `parent_id`, `orderby`, `is_hot`, `rate`) VALUES
(2, '旅游', 0, 99, 0, 60);

-- --------------------------------------------------------

--
-- 表的结构 `bao_tuan_code`
--

CREATE TABLE `bao_tuan_code` (
  `code_id` int(10) UNSIGNED NOT NULL,
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
  `status` tinyint(1) DEFAULT '0' COMMENT '0代表正常，1代表申请退款中，2代表已经退款'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_tuan_details`
--

CREATE TABLE `bao_tuan_details` (
  `tuan_id` int(10) NOT NULL,
  `details` text,
  `instructions` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_tuan_dianping`
--

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
  `closed` tinyint(2) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_tuan_dianping_pics`
--

CREATE TABLE `bao_tuan_dianping_pics` (
  `pic_id` int(10) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `pic` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_tuan_meal`
--

CREATE TABLE `bao_tuan_meal` (
  `tuan_id` int(11) UNSIGNED DEFAULT '0' COMMENT '主套餐',
  `id` int(11) UNSIGNED DEFAULT '0' COMMENT '分套餐id',
  `name` varchar(64) DEFAULT NULL COMMENT '套餐名'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_tuan_order`
--

CREATE TABLE `bao_tuan_order` (
  `order_id` int(10) UNSIGNED NOT NULL,
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
  `is_dianping` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_tuan_view`
--

CREATE TABLE `bao_tuan_view` (
  `view_id` int(10) NOT NULL,
  `tuan_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_tui`
--

CREATE TABLE `bao_tui` (
  `tui_id` int(10) UNSIGNED NOT NULL,
  `tui_name` varchar(64) DEFAULT NULL,
  `tui_link` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_users`
--

CREATE TABLE `bao_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `account` varchar(64) DEFAULT NULL COMMENT '邮件或者手机',
  `password` char(32) DEFAULT NULL,
  `face` varchar(255) DEFAULT NULL,
  `ext0` varchar(15) DEFAULT NULL COMMENT '为了兼容DISCUZ 设立的用户名存储的字段',
  `nickname` varchar(32) DEFAULT NULL,
  `truename` varchar(15) NOT NULL COMMENT '真实姓名',
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
  `pid` int(10) UNSIGNED DEFAULT '0' COMMENT '邀请人id',
  `is_subscribe` tinyint(2) UNSIGNED DEFAULT '0' COMMENT '是否关注公众号'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_users`
--

INSERT INTO `bao_users` (`user_id`, `account`, `password`, `face`, `ext0`, `nickname`, `truename`, `integral`, `prestige`, `money`, `rank_id`, `gold`, `reg_time`, `reg_ip`, `last_time`, `last_ip`, `closed`, `uc_id`, `email`, `mobile`, `ping_num`, `post_num`, `invite1`, `invite2`, `invite3`, `invite4`, `invite5`, `invite6`, `token`, `p_openid`, `pid`, `is_subscribe`) VALUES
(10102, 'wx_1506597536', NULL, NULL, NULL, '曾玉枚（湖南永盛)', '', 0, 0, 0, 1, 0, 1506597536, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02Ck6c2iC6etG6gZhV8Yjq4', NULL, 0),
(10103, 'wx_1506597542', NULL, NULL, NULL, '', '', 0, 0, 0, 1, 0, 1506597542, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wvUB3ZDO4fYwMg8n24KaRw', NULL, 0),
(10096, 'wx_15065962024627', NULL, NULL, NULL, '小葱', '', 0, 0, 0, 1, 0, 1506596202, NULL, 1506596301, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zNAp-dUOBYw7DCG0yjJUyM', 10084, 1),
(10097, 'wx_1506596707', NULL, NULL, NULL, '林文斌', '林文斌', 0, 0, 0, 1, 0, 1506596707, NULL, 1506609176, NULL, 0, 0, NULL, '18650743136', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-v2cJ5MonDf45oH6twjmag', NULL, 1),
(10098, 'wx_15065971453366', NULL, NULL, NULL, '10084_7174', '', 0, 0, 0, 1, 0, 1506597145, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04R9sSoIL1X3TJq17ynKCq0', 10084, 1),
(10099, 'wx_15065972641743', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/4HpHtnD0qrNZs0MJLNWwT0qePlGxofJZTutoy103LGLMxz5ESfRjLhaZzp7S9hbp3D7Licr6xRCxYbCF6gKHGtg/0', NULL, 'Andy 熊哥^_^', '', 0, 0, 0, 1, 0, 1506597264, NULL, 1506731172, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-TpZTGYzUIdie2cpeBkZLc', 10084, 1),
(10100, 'wx_15065973509108', NULL, NULL, NULL, '10084_2264', '', 0, 0, 0, 1, 0, 1506597350, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00L8SiMbAVa9eNpGhhTTfyw', 10084, 1),
(10101, 'wx_1506597382', NULL, NULL, NULL, '黄小黄', '黄小黄', 0, 0, 0, 1, 0, 1506597382, NULL, NULL, NULL, 0, 0, NULL, '18674355945', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00zD8TN0g9P0j4_Y_ru7Bmk', NULL, 1),
(10091, 'wx_1506595571', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/d1PJ3Q4uUmkcMXBr2oY3sRcYQpibTYSG02QjdciaNCRlykC1DS8Z33icCOD1QccfLR3tb1PNpHFCkQDLLib2ujbVKw/0', NULL, '烧辣椒皮蛋', '黄海洋', 0, 0, 0, 1, 0, 1506595571, NULL, 1506770561, NULL, 0, 0, NULL, '18569532116', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00svBUYh9MBSd4r5sBmTL44', 10085, 1),
(10092, 'wx_15065956649612', NULL, NULL, NULL, '10084_5844', '', 0, 0, 0, 1, 0, 1506595664, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-zuYc2HHdrNdRHuJqUwEzs', 10084, 1),
(10093, 'wx_15065956679191', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTItBBuFNrdC2m4WkgQfBjxnAKo8KzBXhucPibCYwfVofpSMcZoCSicqlFLoEKd0JiamAM7PUDicz5Q79g/0', NULL, '隐慕云', '', 0, 0, 0, 1, 0, 1506595667, NULL, 1506772603, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wgmNM11Fzj2771ADPTpDM4', 10086, 1),
(10094, 'wx_15065958258842', NULL, NULL, NULL, '清静自然', '', 0, 0, 0, 1, 0, 1506595825, NULL, 1506597365, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_V0Qkmj9qcATGlWvieH3A4', 10084, 0),
(10095, 'wx_15065958875447', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/EUqwKu38BfIYAHvibOs1ib8T7qHyx4HYn0RptZ4Beiakjf4Luic5lMmsmnmPfAeiapmXReR6c01UJj4fIVj4FwICYmA/0', NULL, '逍遥芳儿', '', 0, 0, 0, 1, 0, 1506595887, NULL, 1506868333, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0x8Owp6LOYuCM0uMRlNnKPM', 10084, 1),
(10086, 'wx_15065948331844', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/06pciaj1aSVCcQXEAbb5nZvibMwxibSxMZ9T9W8u7nYBXTw8iao48fD2pZwp701ZEcK4NEdmFYyhwYXTzgib8rv0jBw/0', NULL, '慕云', '刘姣', 0, 0, 0, 1, 0, 1506594833, NULL, 1507596569, NULL, 0, 0, NULL, '13687303317', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02ghH4mIs48UIAPEQLyXc_g', 10084, 1),
(10087, 'wx_15065949451229', NULL, NULL, NULL, '西瓜', '', 0, 0, 0, 1, 0, 1506594945, NULL, 1506594977, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02-ZAyGnS6oeKwwlB5ut14Q', 10084, 1),
(10088, 'wx_1506595275', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKj6gYiaqicwEicGibOx0NvaOtnDSjjhtic20rE9fTqiauhIvh2viaq8OiafFic5NvlDvtTVx7wibQhliayb9dqg/0', NULL, '踏歌笙', '看看', 0, 0, 0, 1, 0, 1506595275, NULL, 1506831352, NULL, 0, 0, NULL, '15580077343', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01at9wEyPqz6a8vrM3PQzSY', 10085, 1),
(10089, 'wx_15065954772477', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJj8wZ4DGlicygtYHY4aD9hnmoIXdFJlQTuVOI2phPzCgmllZuf2NkvNed8oC48fSU9Vz2PNHFT06A/0', NULL, '法者•秀元', '糖糖', 0, 0, 0, 1, 0, 1506595477, NULL, 1506824281, NULL, 0, 0, NULL, '18574385086', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05RO1Z56HPzuNcFxMt5yY04', 10085, 1),
(10090, 'wx_1506595536', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epFRbF5IkEBkP14rfyyMaoRFs0OA6TiaHaHxtTKGcJM3icFjuyPa1uFiapy0mwt5ia2EjJlHMGxTye8yg/0', NULL, '张乐[嘿哈]', '', 0, 0, 0, 1, 0, 1506595536, NULL, 1506787843, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05XQWiwp8JsysUSE1hSkJzE', 10085, 1),
(10083, 'wx_1506594647', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/nXpx9icMWMic0LnBoufvFTKVfDxRPTm0EKBQDHldpbjurz5Zn2iaZVue3aGDFia0hJ8yCYichTibDkoNjGuoeyz6hQYQ/0', NULL, '夏靖奇', '夏靖奇', 0, 0, 0, 1, 0, 1506594647, NULL, 1506786526, NULL, 0, 0, NULL, '15874983826', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB052qdx-N-4kkTrLlDAnzC8U', 10085, 1),
(10084, 'wx_1506594652', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/gnubyuV2Z7d8ueADBrK3PjhNcJUzFvWGMb5Y0QAFicHySPhF6LmPfdiafAiaJ5dBkGP4KCrozdGkSlqickDZNX1TRw/0', NULL, 'andy熊哥', '熊志国', 0, 0, 0, 1, 0, 1506594652, NULL, NULL, NULL, 0, 0, NULL, '15874931002', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02xqVFqAhJbSiAJFCA3X_g8', NULL, 1),
(10085, 'wx_1506594753', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/JDULaVdViaon3aX40bGkhiad5LhP2dibyibLF5zkfVdjSk0XC8SdxmmmqcQAFm3pLICicaHLzn5Zu5hcQPTDG532dXg/0', NULL, '会编码的厨小师', '张鹏', 0, 0, 0, 1, 0, 1506594753, NULL, NULL, NULL, 0, 0, NULL, '13590288934', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0y0NYaIwPtT2EuVfMUgVy6I', NULL, 1),
(10104, 'wx_1506597548', NULL, NULL, NULL, '', '', 0, 0, 0, 1, 0, 1506597548, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0w_M4QhZ0r0Ny4V_4_09B_s', NULL, 1),
(10105, 'wx_1506597592', NULL, NULL, NULL, '一笑而过', '', 0, 0, 0, 1, 0, 1506597592, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01QrdbXpgXrbAexD6KTZt60', NULL, 0),
(10106, 'wx_1506597612', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqH2n8FhTnrbAGYQTRnymYDHPt0lWA4QsCUiaRJcp54OaScuG7lb6fUrIOOtxZ8ibrryic3ia6H8e6yEg/0', NULL, '阳娟丽（平安综合金融）', '', 0, 0, 0, 1, 0, 1506597612, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_BIhIigUphZlM0ShRgPk00', NULL, 0),
(10107, 'wx_15065976246814', NULL, NULL, NULL, '10094_2292', '', 0, 0, 0, 1, 0, 1506597624, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yqRpMutYrin3vSQdLcfap4', 10094, 1),
(10108, 'wx_15065976268850', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIkUFzCjqQPaWI3zQXpbiacibHq3DyDjHwKOIEcqhHnS1LxdniaxXpUECB8Ecydw1HmRbPNzyaGrczHA/0', NULL, '小水阳光', '你好', 0, 0, 0, 1, 0, 1506597626, NULL, 1506786446, NULL, 0, 0, NULL, '15973176773', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07ayklY3rVd2JtSNpiGVLos', 10085, 1),
(10109, 'wx_1506597647', NULL, NULL, NULL, '谢业群', '', 0, 0, 0, 1, 0, 1506597647, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07wKpYv4xVyfqBMP4LKUIe0', NULL, 0),
(10110, 'wx_1506597666', NULL, NULL, NULL, '廖^O^莲', '', 0, 0, 0, 1, 0, 1506597666, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wjfHT2F0bzboqLfrvH3KY4', NULL, 0),
(10111, 'wx_1506597692', NULL, NULL, NULL, '溜溜溜', '', 0, 0, 0, 1, 0, 1506597692, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0x5rOxPqnR__ecMCeKOpbwA', NULL, 0),
(10112, 'wx_1506597709', NULL, NULL, NULL, '年年有余', '', 0, 0, 0, 1, 0, 1506597709, NULL, 1506600116, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yDgyTV6AAaxSpPAS0FafhM', NULL, 0),
(10113, 'wx_1506597720', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKK7o6icou2utBa7CibvndfyTYicaOBBsiaOFLy9PPHZuS5GjugR6ak5kbPXquHricFKX3hAy74qCeqBicw/0', NULL, '逸慧', '肖珊', 0, 0, 0, 1, 0, 1506597720, NULL, 1506648370, NULL, 0, 0, NULL, '13873366833', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06m0lcpjIx8oEUycCl6DRso', NULL, 1),
(10114, 'wx_1506597740', NULL, NULL, NULL, 'ty', '', 0, 0, 0, 1, 0, 1506597740, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02HYFtCitJ2aJTO0vV3GgZw', NULL, 1),
(10115, 'wx_1506597742', NULL, NULL, NULL, '精典妆家～黄英', '', 0, 0, 0, 1, 0, 1506597742, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB079isL3x42wfiQF9vbzhUeA', NULL, 0),
(10116, 'wx_1506597760', NULL, NULL, NULL, '梦醒时分', '', 0, 0, 0, 1, 0, 1506597760, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB039jQ4sEAKGtXnV4VP8JRIk', NULL, 1),
(10117, 'wx_1506597773', NULL, NULL, NULL, '人生如茶', '', 0, 0, 0, 1, 0, 1506597773, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05qUibQnN8hQmcaUXvWQFyI', NULL, 1),
(10118, 'wx_1506597787', NULL, NULL, NULL, '晴晴', '', 0, 0, 0, 1, 0, 1506597787, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00muc097kNcYRbY4SHe6sfc', NULL, 0),
(10119, 'wx_1506597807', NULL, NULL, NULL, '洛洛', '', 0, 0, 0, 1, 0, 1506597807, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05kPsdxN3MzXdg46fyacBME', NULL, 0),
(10120, 'wx_15065978741944', NULL, NULL, NULL, '10095_4601', '', 0, 0, 0, 1, 0, 1506597874, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06rXu1V6-CvQrv2BqYgpOjY', 10095, 1),
(10121, 'wx_15065979133834', NULL, NULL, NULL, '10095_6242', '', 0, 0, 0, 1, 0, 1506597913, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07qJJlQ0DAG2uBjHzrpmWzc', 10095, 0),
(10122, 'wx_1506597977', NULL, NULL, NULL, '阳光总在风雨后', '', 0, 0, 0, 1, 0, 1506597977, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xv2vrjoWOl_eD57bkU75jI', NULL, 0),
(10123, 'wx_15065979828069', NULL, NULL, NULL, '10095_7954', '', 0, 0, 0, 1, 0, 1506597982, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02DAgbNAER1yPKPj1Ul8Lc4', 10095, 1),
(10124, 'wx_1506598028', NULL, NULL, NULL, '小红', '', 0, 0, 0, 1, 0, 1506598028, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xti5YfLMbyAoLe35h4N97Q', NULL, 0),
(10125, 'wx_1506598035', NULL, NULL, NULL, '谭老板', '', 0, 0, 0, 1, 0, 1506598035, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0w1daH5jUV3d1aZys1L7P34', NULL, 0),
(10126, 'wx_1506598055', NULL, NULL, NULL, '王利明', '', 0, 0, 0, 1, 0, 1506598055, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03UQWFuiVPY3hn8pWITsZ_8', NULL, 1),
(10127, 'wx_15065981751821', NULL, NULL, NULL, '10095_9959', '', 0, 0, 0, 1, 0, 1506598175, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wUtr75IISwL_d-ErBvO0vE', 10095, 1),
(10128, 'wx_1506598264', NULL, NULL, NULL, '玲18973602218', '', 0, 0, 0, 1, 0, 1506598264, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB005C3dNPgFJdUOqWaypBtNo', NULL, 0),
(10129, 'wx_1506598304', NULL, NULL, NULL, 'krissy', '', 0, 0, 0, 1, 0, 1506598304, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-0xOGeO9XGKCLeKZWJg2GM', NULL, 1),
(10130, 'wx_15065983463621', NULL, NULL, NULL, '10095_6292', '', 0, 0, 0, 1, 0, 1506598346, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xYlhMytQ4g4msaU3MbLniw', 10095, 1),
(10131, 'wx_1506598410', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/o2IiaorsOlosiapgQdnARyZZ8pbFZQjaWumiaq6qDiapZ8PogAtaPYbNcQ1dwt3dJk8WMYbWPLsSeCHibv3wxjG6KqA/0', NULL, '做自己的女王', '王卓', 0, 0, 0, 1, 0, 1506598410, NULL, NULL, NULL, 0, 0, NULL, '13307369008', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05qZ0EaozNYAoDPm1luH64g', NULL, 1),
(10132, 'wx_1506598480', NULL, NULL, NULL, '（', '', 0, 0, 0, 1, 0, 1506598480, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB028Ur9AR6p0xt7InQS29mxA', NULL, 0),
(10133, 'wx_1506598498', NULL, NULL, NULL, '十一', '', 0, 0, 0, 1, 0, 1506598498, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03-BmKjKRzznM19eXm4P4fA', NULL, 0),
(10134, 'wx_15065985276948', NULL, NULL, NULL, '10095_7201', '', 0, 0, 0, 1, 0, 1506598527, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07elbLcciNt2AuV0sh-cbjY', 10095, 1),
(10135, 'wx_1506598557', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epmBqbqOIzocWhhczl3zR0ZiaiatXEfvfOaH0ew7ECIqqTnCI3SuyicFghkicykFicoIL4YW1x9xOV88zQ/0', NULL, 'LILY', '', 0, 0, 0, 1, 0, 1506598557, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07n7yjT5vFCa2cfX56d41oI', NULL, 1),
(10136, 'wx_15065988119418', NULL, NULL, NULL, '10095_9573', '', 0, 0, 0, 1, 0, 1506598811, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08lw20BH0hvyNvXQIZtxTj8', 10095, 1),
(10137, 'wx_1506598816', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIiaHPFA7hDfr4ezr1LJSPFbCKPPoiaibA1ibE2j89u8VDhHv00rYtFvXRM4spiatiblp7JRoTYSE4DlQPg/0', NULL, '得闲饮茶', '苏贤甲', 0, 0, 0, 1, 0, 1506598816, NULL, 1506798459, NULL, 0, 0, NULL, '15808902204', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07OyJEoDDhAHqEsWkyWtBRc', 10084, 1),
(10138, 'wx_1506598855', NULL, NULL, NULL, '李国宏', '', 0, 0, 0, 1, 0, 1506598855, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06zqDv_Itrg59oneK3Pi9Gk', NULL, 0),
(10139, 'wx_15065989304977', NULL, NULL, NULL, '火花', '', 0, 0, 0, 1, 0, 1506598930, NULL, 1506598937, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04c0TAM5P0drvK8u1qwwi2U', 10131, 1),
(10140, 'wx_15065989599582', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJLU8PAzOpkP7deic8uJqNNehQNRoxyTic8sCYB00XYPdqJOm86rqRpiaERuvgfiaL3Unk6QicXnstFTWw/0', NULL, '', '柳女士', 0, 0, 0, 1, 0, 1506598959, NULL, 1506821999, NULL, 0, 0, NULL, '18973609166', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08BjzldAiRyAxiG-KrK3a7U', 10131, 1),
(10141, 'wx_1506599017', NULL, NULL, NULL, '宸宸', '', 0, 0, 0, 1, 0, 1506599017, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06DjH2vi9oQNAbXZnA9meFg', NULL, 0),
(10142, 'wx_1506599027', NULL, NULL, NULL, '小毛乖乖', '', 0, 0, 0, 1, 0, 1506599027, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07ziKAZGXuvxTepRvFKt4eM', NULL, 0),
(10143, 'wx_1506599065', NULL, NULL, NULL, '霞', '', 0, 0, 0, 1, 0, 1506599065, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03DSLfkeieqmxLwWzlQ9aUY', NULL, 1),
(10144, 'wx_1506599072', NULL, NULL, NULL, '如意', '', 0, 0, 0, 1, 0, 1506599072, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_uqhvmoz4yeMydpykTqGVs', NULL, 1),
(10145, 'wx_1506599134', NULL, NULL, NULL, 'Judy', '', 0, 0, 0, 1, 0, 1506599134, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_DeiXcTYkxKXRuz8En5dCY', NULL, 0),
(10146, 'wx_15065991947399', NULL, NULL, NULL, '吴莉娟', '', 0, 0, 0, 1, 0, 1506599194, NULL, 1506599205, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08YnhwBCS22k8LmH2UiNOD4', 10131, 1),
(10147, 'wx_15065992706658', NULL, NULL, NULL, '', '纪秀', 0, 0, 0, 1, 0, 1506599270, NULL, 1506599318, NULL, 0, 0, NULL, '17607318670', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB079Vs4ByVUH0EhNl7id2BDA', 10095, 1),
(10148, 'wx_1506599275', NULL, NULL, NULL, 'A～依然', '', 0, 0, 0, 1, 0, 1506599275, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03HQlU4sW0v5u4pEzMgYplM', 10112, 0),
(10149, 'wx_15065994106346', NULL, NULL, NULL, '10140_2220', '', 0, 0, 0, 1, 0, 1506599410, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01NauGln9D7So90rXJgBTg8', 10140, 1),
(10150, 'wx_15065994131379', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/lauNNcuJ32wQJ6ssjK5gicPlnxiaDS366b8D3E41T8H6FtLAyiahA8iczdOibB50NyEdaia5YiaPMgCwUwxaibKlIZBAtw/0', NULL, '三元', '', 0, 0, 0, 1, 0, 1506599413, NULL, 1506868544, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB025XjhvIAuGm5CBx3vHEqXA', 10095, 1),
(10151, 'wx_1506599468', NULL, NULL, NULL, '天蓝', '', 0, 0, 0, 1, 0, 1506599468, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09vT3xEvCtrrVCDUWxgjMI0', NULL, 0),
(10152, 'wx_15065995555296', NULL, NULL, NULL, '10094_8230', '', 0, 0, 0, 1, 0, 1506599555, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07zfzWRonaZGgtaUk0zPeRM', 10094, 0),
(10153, 'wx_15065995782381', NULL, NULL, NULL, '10140_3320', '', 0, 0, 0, 1, 0, 1506599578, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zkKaHXJhGSotW4cnhUmv3A', 10140, 1),
(10154, 'wx_15065996807631', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/QfNSgehchH8I3tjA8HkWKtpldqAqBP3wwE4HaeVciaY8zULyFAx1WjrXG2Njz6PMTXLO3iatScFRaib8JlffnX8rg/0', NULL, '珞加', '', 0, 0, 0, 1, 0, 1506599680, NULL, 1506743871, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yX6yTBjytb9Tf-qnMrMHT0', 10086, 1),
(10155, 'wx_15066000577578', NULL, NULL, NULL, '10095_3433', '', 0, 0, 0, 1, 0, 1506600057, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05YsqWHFe37tf-BAZ1Cn6g0', 10095, 0),
(10156, 'wx_1506600112', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/7etWsXv0YIXdE32l3EEicQbQlLGVU5IEE5U3ibrd9SjlgGF3dk49aJLWuKC2LIMQribBaxLXYrRLxZJicV5sK6TwnA/0', NULL, 'try to do', '', 0, 0, 0, 1, 0, 1506600112, NULL, 1506695417, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB082BKlcKvyFvBbeLqWpKnNg', 10108, 0),
(10157, 'wx_15066001534330', NULL, NULL, NULL, '10095_5943', '', 0, 0, 0, 1, 0, 1506600153, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0w-07LW6Lk5HDNGsMALD5xY', 10095, 1),
(10158, 'wx_1506600165', NULL, NULL, NULL, NULL, '', 0, 0, 0, 1, 0, 1506600165, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, 10112, 0),
(10159, 'wx_1506600168', NULL, NULL, NULL, '猫猫', '', 0, 0, 0, 1, 0, 1506600168, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_AygkHUBmifoRHQAe9HB3o', NULL, 0),
(10160, 'wx_15066002999477', NULL, NULL, NULL, '10095_5635', '', 0, 0, 0, 1, 0, 1506600299, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06fTW-jvpWDS2Te21b555XE', 10095, 1),
(10161, 'wx_15066003221056', NULL, NULL, NULL, '10095_5151', '', 0, 0, 0, 1, 0, 1506600322, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wqmSrvDH61hOWZJtvdhRO8', 10095, 1),
(10162, 'wx_15066003242260', NULL, NULL, NULL, '10095_4271', '', 0, 0, 0, 1, 0, 1506600324, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01XiB8mKUWBGplX-snevGck', 10095, 1),
(10163, 'wx_15066003387703', NULL, NULL, NULL, '10095_9712', '', 0, 0, 0, 1, 0, 1506600338, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wKSJomlP0WsnIm9cxbgKng', 10095, 1),
(10164, 'wx_15066003397922', NULL, NULL, NULL, '依恋', '', 0, 0, 0, 1, 0, 1506600339, NULL, 1506604725, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-XvqXcunObh7k5i5g_D2iA', 10095, 1),
(10165, 'wx_15066004698199', NULL, NULL, NULL, '', '', 0, 0, 0, 1, 0, 1506600469, NULL, 1506600480, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_ceYx0U68psacsE-L4AGng', 10140, 1),
(10166, 'wx_15066005387734', NULL, NULL, NULL, '诸老三', '诸戈伟', 0, 0, 0, 1, 0, 1506600538, NULL, 1506601550, NULL, 0, 0, NULL, '18182139938', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wQG8FmJB3Ru3oAtfTtee1s', 10140, 1),
(10167, 'wx_1506600590', NULL, NULL, NULL, '云朵 〉李娟', '', 0, 0, 0, 1, 0, 1506600590, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xfbXhAX-2h-yCn4vXkJqdo', 10139, 0),
(10168, 'wx_15066006457080', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/iancibARpBUuuteBAwxiakicPokqjD4yQibPKencIWYju1g5qp15ykjtBLXUibZYC04KpkUyb67OW1Fx9elHHslMahzg/0', NULL, '二当家的', '岳鹏', 0, 0, 0, 1, 0, 1506600645, NULL, 1506822055, NULL, 0, 0, NULL, '18973609177', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07R_Hskd8zzyLl4l7azhqyQ', 10140, 1),
(10169, 'wx_1506600664', NULL, NULL, NULL, '张小曼', '', 0, 0, 0, 1, 0, 1506600664, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_V1_aI4_eoUJ6UjJQQWCGM', NULL, 0),
(10170, 'wx_15066007074029', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/rxI6V38Shhu90OXzjPjaN7zxNzXpXkH8vzDAicspnmcmR0iaH7bkkAXRM3oeTUUTuGbsPWjyhicCiaDIA8HOKLhbnA/0', NULL, '无名', '', 0, 0, 0, 1, 0, 1506600707, NULL, 1506767226, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04x3lkopj5uyaMmyMSMP_ew', 10140, 1),
(10171, 'wx_15066009928296', NULL, NULL, NULL, '10095_2923', '', 0, 0, 0, 1, 0, 1506600992, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08eZYC1M0djBdN2csO_54iQ', 10095, 1),
(10172, 'wx_15066011141139', NULL, NULL, NULL, '10095_5146', '', 0, 0, 0, 1, 0, 1506601114, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB062nhk73cbHtIRNakjldJTk', 10095, 0),
(10173, 'wx_15066011682863', NULL, NULL, NULL, '10095_7818', '', 0, 0, 0, 1, 0, 1506601168, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01ZNbwLrDnRtvOtpXtnBat4', 10095, 1),
(10174, 'wx_15066011979455', NULL, NULL, NULL, '10095_6714', '', 0, 0, 0, 1, 0, 1506601197, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04-qhKmNsIzxo80RH5ajzpo', 10095, 1),
(10175, 'wx_15066011996383', NULL, NULL, NULL, '10095_6490', '', 0, 0, 0, 1, 0, 1506601199, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB028vOSGrz_PbToxLkMpMgFU', 10095, 1),
(10176, 'wx_15066013445665', NULL, NULL, NULL, '10135_3847', '', 0, 0, 0, 1, 0, 1506601344, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04orRdDcBdz79qmb0e0m9d0', 10135, 1),
(10177, 'wx_1506601371', NULL, NULL, NULL, '一缕阳光', '', 0, 0, 0, 1, 0, 1506601371, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB064HQuBOLjciQBV6ZNiUMxY', NULL, 0),
(10178, 'wx_1506601380', NULL, NULL, NULL, '知足常乐', '', 0, 0, 0, 1, 0, 1506601380, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0w1S3XDR3vt_Qp5ytOVepsc', NULL, 0),
(10179, 'wx_1506601478', NULL, NULL, NULL, '兰姐', '', 0, 0, 0, 1, 0, 1506601478, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04RRTybD4EeTU3AWlD-T0Uk', 10166, 0),
(10180, 'wx_1506601541', NULL, NULL, NULL, '明天会更好', '', 0, 0, 0, 1, 0, 1506601541, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB094lXI2bxaW3l3U1b_jxcK4', NULL, 0),
(10181, 'wx_1506601678', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLYuf83N7NSAib823iaSmITMSfOBRUDUEyibGcxsLI1ZDtB8wOfElypExmYw56jfANHGD5EMUTv2H55g/0', NULL, '张妍', '', 0, 0, 0, 1, 0, 1506601678, NULL, 1506780446, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05C2S_wMEVeA65-A-l2Gv-E', NULL, 1),
(10182, 'wx_15066016848939', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/xRYuVOluJxeuRtmKPjwwkTyKTaVUNRJRHKHGyLEBtyu0wfv6GlhEukAbyjUtibOegBaCiacTZ3DONZTdrZX9rYOQ/0', NULL, '围裙妈妈คิดถึง', '陈宇', 0, 0, 0, 1, 0, 1506601684, NULL, 1507243249, NULL, 0, 0, NULL, '18975652881', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00xNmgX6VUIt-Z_gb5WmypE', 10168, 1),
(10183, 'wx_1506601694', NULL, NULL, NULL, NULL, '', 0, 0, 0, 1, 0, 1506601694, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, 0),
(10184, 'wx_1506601861', NULL, NULL, NULL, '熊妍', '', 0, 0, 0, 1, 0, 1506601861, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05VWYOCts7qIrF6LogSAyVs', NULL, 1),
(10185, 'wx_1506601909', NULL, NULL, NULL, '', '', 0, 0, 0, 1, 0, 1506601909, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zUft4bzSo_iWr0QaVdP4-0', 10166, 0),
(10186, 'wx_15066021648084', NULL, NULL, NULL, '10095_3237', '', 0, 0, 0, 1, 0, 1506602164, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wcKVNotoIqFA-aTcOGEpB4', 10095, 1),
(10187, 'wx_15066021965770', NULL, NULL, NULL, '10095_6058', '', 0, 0, 0, 1, 0, 1506602196, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02XeJiWYUGiqWX4M8HJUpLw', 10095, 1),
(10188, 'wx_15066022562742', NULL, NULL, NULL, '10131_7176', '', 0, 0, 0, 1, 0, 1506602256, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06hdnxWNHDpXW0HMhM1n5O0', 10131, 1),
(10189, 'wx_1506602277', NULL, NULL, NULL, '小花', '', 0, 0, 0, 1, 0, 1506602277, NULL, 1506661493, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wf6XWFNpAQKe5v892Z3Pk8', 10182, 0),
(10190, 'wx_1506602405', NULL, NULL, NULL, '兰馨', '', 0, 0, 0, 1, 0, 1506602405, NULL, 1506602419, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0w1OMPDQ_n3hYmBSvq4-tdw', 10182, 0),
(10191, 'wx_15066024641509', NULL, NULL, NULL, '10168_1039', '', 0, 0, 0, 1, 0, 1506602464, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-DN4F74Dj331CSgaveJxdE', 10168, 1),
(10192, 'wx_15066025391201', NULL, NULL, NULL, '雲和！', '', 0, 0, 0, 1, 0, 1506602539, NULL, 1506602565, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03wKMXkgPx3DhSm773Z1dho', 10095, 1),
(10193, 'wx_15066026529273', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/WDY2KWa67iaw6uQXJIQg4PtKtfUdAeMOTGLrEwwkjpoicmUeWQxPcVTw9rEHyFZeQNUUm0Z1p1ADaGxCNl3CtSMg/0', NULL, '李华生', '李华生', 0, 0, 0, 1, 0, 1506602652, NULL, 1506811871, NULL, 0, 0, NULL, '15802615299', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wBgdwWkkn_7TaoOWtckpwE', 10084, 1),
(10194, 'wx_1506602661', NULL, NULL, NULL, '呀嘿', '', 0, 0, 0, 1, 0, 1506602661, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0woHMqc-UV2cb-IoLdOJ0RQ', 10182, 0),
(10195, 'wx_15066026744422', NULL, NULL, NULL, '10095_3381', '', 0, 0, 0, 1, 0, 1506602674, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yEhN6D__k5K2MK0av_rFRU', 10095, 1),
(10196, 'wx_1506602780', NULL, NULL, NULL, '太平洋保险售后服务向琼梅18169419', '', 0, 0, 0, 1, 0, 1506602780, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zV2DEDfu5UBkFQmLyvFsV8', NULL, 0),
(10197, 'wx_1506602812', NULL, NULL, NULL, '十八子日月', '', 0, 0, 0, 1, 0, 1506602812, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-es7JOPqrA2WkYCql2R_yU', NULL, 0),
(10198, 'wx_15066028253577', NULL, NULL, NULL, 'nini', '', 0, 0, 0, 1, 0, 1506602825, NULL, 1506644340, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0984HqYvBmDoYKn2XEEcwy4', 10140, 1),
(10199, 'wx_15066032517352', NULL, NULL, NULL, '10168_3612', '', 0, 0, 0, 1, 0, 1506603251, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-mT6ryTAfrWW7W2qmsDAls', 10168, 0),
(10200, 'wx_15066033225358', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIlk0ZTU5Jn4FWPOnuJml58iaaILQPMia4zSddicVRagEtU9xutpic9BkYpc4ic8otRtOIJde8QxaWCXwQ/0', NULL, '美的厨卫(13875972409)', '洪军桂', 0, 0, 0, 1, 0, 1506603322, NULL, 1506909060, NULL, 0, 0, NULL, '13875972409', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0y2xR5B3o2ZRM_FA-bKwMkY', 10084, 1),
(10201, 'wx_15066033362049', NULL, NULL, NULL, '10168_6407', '', 0, 0, 0, 1, 0, 1506603336, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07zdf0qylgudZ9nVzVZNF68', 10168, 1),
(10202, 'wx_1506603366', NULL, NULL, NULL, '奶奶杨秀云', '', 0, 0, 0, 1, 0, 1506603366, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01xRHI-6AUZ7VlRM3Sj6Gdg', NULL, 0),
(10205, 'wx_15066035846937', NULL, NULL, NULL, '中国人寿沈丽英', '', 0, 0, 0, 1, 0, 1506603584, NULL, 1506649746, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wKAYMd4vSamYuMxjrk3H1I', 10140, 1),
(10203, 'wx_1506603399', NULL, NULL, NULL, '韩宝儿', '', 0, 0, 0, 1, 0, 1506603399, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xxkdaDiuho9pdCUDPbOUEY', NULL, 0),
(10204, 'wx_15066034021272', NULL, NULL, NULL, '张静', '', 0, 0, 0, 1, 0, 1506603402, NULL, 1506603408, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09_Rgfvic5ea1cV0Sd_IdvI', 10168, 1),
(10206, 'wx_15066036952171', NULL, NULL, NULL, '10086_6087', '', 0, 0, 0, 1, 0, 1506603695, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06ow5sDKcQZA9blaNxN8D9w', 10086, 1),
(10207, 'wx_1506604115', NULL, NULL, NULL, '陈亮', '', 0, 0, 0, 1, 0, 1506604115, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05MwM1hT7_JwRhyHf16MPbA', 10182, 0),
(10208, 'wx_1506604369', NULL, NULL, NULL, '丽（晴江妈）', '', 0, 0, 0, 1, 0, 1506604369, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zdrmDsT7WJt3aEJOjk5OHk', NULL, 0),
(10209, 'wx_1506604411', NULL, NULL, NULL, '乐陶陶', '', 0, 0, 0, 1, 0, 1506604411, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_ehum3y3rBQ6AMuGFCgDCY', NULL, 0),
(10210, 'wx_15066050076891', NULL, NULL, NULL, '10095_6383', '', 0, 0, 0, 1, 0, 1506605007, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-9VI7nMegKRzvI6v9d1QZE', 10095, 1),
(10211, 'wx_1506605056', NULL, NULL, NULL, 'Andy', '', 0, 0, 0, 1, 0, 1506605056, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00a5Sz5BQzJ0-GPMdjEElaQ', NULL, 1),
(10212, 'wx_1506605280', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIrve0h6xibQzgOWnDv6iaMibzO6pNRcrDCzv8qBicibFRmmoJ0FtbCvnEWiapfHib27n5NQQsBEibsg5Efdw/0', NULL, '_____ Wow cz', '刘朝忠', 0, 0, 0, 1, 0, 1506605280, NULL, NULL, NULL, 0, 0, NULL, '18570148379', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09u5X3kwDIC1NrvhAyIxq0k', NULL, 1),
(10213, 'wx_1506605315', NULL, NULL, NULL, '谭丽华', '', 0, 0, 0, 1, 0, 1506605315, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03mXjemTBb6cpV75u5-8FFM', NULL, 0),
(10214, 'wx_1506605419', NULL, NULL, NULL, '猫猫仔郭帅迩', '', 0, 0, 0, 1, 0, 1506605419, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00_6o-QZnWuhdJKcS2lyqos', NULL, 0),
(10215, 'wx_1506605495', NULL, NULL, NULL, '光荣岁月', '', 0, 0, 0, 1, 0, 1506605495, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08OQm2R7xs-MwaadLxs8SSw', NULL, 0),
(10216, 'wx_15066055374346', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJBX1icpnQZGQc8XFVZ0FzKet6Pg7ibmdiaibm4T9SCiaZOovMDe1n1lGx5eOULn0EfXrXE7UAayh5lzQA/0', NULL, '海凌', '', 0, 0, 0, 1, 0, 1506605537, NULL, 1506771117, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yzcvwJ6rlM35dWBsk0MLsY', 10140, 1),
(10217, 'wx_1506605765', NULL, NULL, NULL, '亚亚', '', 0, 0, 0, 1, 0, 1506605765, NULL, 1506605827, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04eoyb98w6MxrfhrKW9ZtR0', 10143, 0),
(10218, 'wx_1506605874', NULL, NULL, NULL, '澄子', '', 0, 0, 0, 1, 0, 1506605874, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06ReV7sDfVCrtTfo87yntuw', NULL, 1),
(10219, 'wx_15066059364119', NULL, NULL, NULL, '0_9416', '', 0, 0, 0, 1, 0, 1506605936, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB005ZJJtr4phJslxC_jFTdh0', 0, 1),
(10220, 'wx_15066059429907', NULL, NULL, NULL, '10168_6465', '', 0, 0, 0, 1, 0, 1506605942, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB038DYDO4JcmAp_leMnK4B_4', 10168, 1),
(10221, 'wx_15066060833586', NULL, NULL, NULL, 'caicai', '', 0, 0, 0, 1, 0, 1506606083, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07dg-Pf3IhaSpGbw2yFp1o8', NULL, 1),
(10222, 'wx_1506606097', NULL, NULL, NULL, '髙雨', '', 0, 0, 0, 1, 0, 1506606097, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0ylOM9eBCkwpoYBA9x384io', NULL, 1),
(10223, 'wx_1506606139', NULL, NULL, NULL, '曼 17373652627', '', 0, 0, 0, 1, 0, 1506606139, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0x0Z2thOmzgpntzggGmtjew', NULL, 1),
(10224, 'wx_15066062734770', NULL, NULL, NULL, '10095_4672', '', 0, 0, 0, 1, 0, 1506606273, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB053IMkZkIuNf90jNYPMJnXw', 10095, 1),
(10225, 'wx_1506606456', NULL, NULL, NULL, '姜方杰*13974290907', '', 0, 0, 0, 1, 0, 1506606456, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08o4ZdEx8d-FNf_y-2WnmMY', NULL, 0),
(10226, 'wx_1506606475', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/0FRSkfnMBUicxpZ8ArnomLfhFxEr2cNPdMvX26gwQrHrE7HfoHhc2C6sfr5ZHVofIibMta1PJvFP4rqRU9Vgicw3A/0', NULL, '心随我动', '罗灿', 0, 0, 0, 1, 0, 1506606475, NULL, NULL, NULL, 0, 0, NULL, '13548575888', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zbf6w86RTPreQMZLdu2mwY', NULL, 1),
(10227, 'wx_15066065928694', NULL, NULL, NULL, '牛小涛', '', 0, 0, 0, 1, 0, 1506606592, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07LsJTqOuSXRBNylckVQq9s', NULL, 1),
(10228, 'wx_15066068218397', NULL, NULL, NULL, '杨帆', '', 0, 0, 0, 1, 0, 1506606821, NULL, 1506606899, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0y7BO9XzlHx33TimbRCtk84', 10140, 0),
(10229, 'wx_15066068356947', NULL, NULL, NULL, '默默', '', 0, 0, 0, 1, 0, 1506606835, NULL, 1506607252, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB055IpmZQcM3hooTdiIGpwRk', 10140, 1),
(10230, 'wx_15066068907612', NULL, NULL, NULL, '10095_5397', '', 0, 0, 0, 1, 0, 1506606890, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0880yAIOTNnC5EbJdSKFp4Q', 10095, 1),
(10231, 'wx_1506607107', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/BB1slw8ecccady34icfbvSR9uEpZZFUxYsw3SllNlrMx7MQB6zos119cL66RiaRSxntonTOtfV8TgFf96v6CVJaA/0', NULL, '网坛新秀', '', 0, 0, 0, 1, 0, 1506607107, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04OCyQ0UmAXrFRydGNHKUgg', NULL, 1),
(10232, 'wx_15066072463172', NULL, NULL, NULL, '周胜', '周胜', 0, 0, 0, 1, 0, 1506607246, NULL, 1506608649, NULL, 0, 0, NULL, '18108428338', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07x-IYX0CGtXy8sYiSS_yJE', 10084, 1),
(10233, 'wx_1506607262', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/LX9zs5DgA4hZXdRUodBoJYTdpjibtvK3iczteAJfLfv0g3iahbDj45fETTUXMaP3BESq4toQpuC0r8z62IYLtn6Nw/0', NULL, '阿猛', '', 0, 0, 0, 1, 0, 1506607262, NULL, 1506744358, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06gDP52QgStlS2-cG0_SGsA', 10182, 0),
(10234, 'wx_15066073288022', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/OtyczrBlZhTc2JuFNicROz4naDiasMBWJzEO5hCzz60AqZ5kaW5OuiaumiaJ6fCQ1jP6u4yw7NRjsncMZibAFbSgetg/0', NULL, '周浩', '', 0, 0, 0, 1, 0, 1506607328, NULL, 1506773927, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06ifUe8Bw4cG2uxy8TbM8P0', 10084, 1),
(10235, 'wx_1506607518', NULL, NULL, NULL, '嘿呀啊', '', 0, 0, 0, 1, 0, 1506607518, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zdOaJp-_okyrS00y6anLR0', NULL, 1),
(10236, 'wx_15066075975664', NULL, NULL, NULL, '妮儿', '', 0, 0, 0, 1, 0, 1506607597, NULL, 1506607617, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04JuQm3p8jrxZdtmPaFT2ck', 10234, 1),
(10237, 'wx_15066077736954', NULL, NULL, NULL, '邹政权', '', 0, 0, 0, 1, 0, 1506607773, NULL, 1506650477, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_pmzp6OX55OZehtOVO7yOA', 10084, 1),
(10238, 'wx_15066078629748', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/xFteofk54TA04wcDkKq4KaZ7JZXEl1AgkDJIW0dJqXd47n2OtibtDZnnicns1SVBdV9tgW21DXcvNibgfaKZmxejg/0', NULL, 'A环宇电脑', '胡建新', 0, 0, 0, 1, 0, 1506607862, NULL, 1506769631, NULL, 0, 0, NULL, '13825668093', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02mrq9kYB7laD1mdV9oSuoY', 10140, 1),
(10239, 'wx_15066078841504', NULL, NULL, NULL, 'Apirl', '', 0, 0, 0, 1, 0, 1506607884, NULL, 1506645154, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01S76pbim8KVJY2bLVOiLeY', 10193, 1),
(10240, 'wx_15066080582939', NULL, NULL, NULL, '10084_6566', '', 0, 0, 0, 1, 0, 1506608058, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09RsXRerLF4_Z-SVBJj_l0Y', 10084, 1),
(10241, 'wx_15066081761873', NULL, NULL, NULL, '陈小典', '', 0, 0, 0, 1, 0, 1506608176, NULL, 1506609201, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05r38Y6ir8d_kmXskLK6jX8', 10193, 1),
(10242, 'wx_15066081815790', NULL, NULL, NULL, '10095_1116', '', 0, 0, 0, 1, 0, 1506608181, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08ZAq0AjwiDODAzmZaKv5N4', 10095, 1),
(10243, 'wx_15066082149513', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLOIQk2rKYevbhRcnbunf4kKbPZicVhcd2o9dMOkKic6LJqIvKbxpribcFh9qyrPomtRuVqWenUAdfhA/0', NULL, '燕子', '', 0, 0, 0, 1, 0, 1506608214, NULL, 1506682153, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zd8q3BoLgNKiiTtZMa15EA', 10240, 1),
(10244, 'wx_15066082499965', NULL, NULL, NULL, '10240_5435', '', 0, 0, 0, 1, 0, 1506608249, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09na4h74B-3lcligR2leI_w', 10240, 1),
(10245, 'wx_15066082635466', NULL, NULL, NULL, '幻影', '', 0, 0, 0, 1, 0, 1506608263, NULL, 1506613603, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02d5GQnIfehWBYupa48s0i0', 10193, 1),
(10246, 'wx_15066082859202', NULL, NULL, NULL, '', '', 0, 0, 0, 1, 0, 1506608285, NULL, 1506608845, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-10VjULNgfc1aOjCQL1Z34', 10193, 1),
(10247, 'wx_15066083673560', NULL, NULL, NULL, '嘉嘉', '', 0, 0, 0, 1, 0, 1506608367, NULL, 1506656927, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB048kB7aKBao2ThZNLUAmjIQ', 10084, 1),
(10248, 'wx_15066085332791', NULL, NULL, NULL, '燕子', '', 0, 0, 0, 1, 0, 1506608533, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xb8Yl8DoJgcpGXN093RmkE', NULL, 1),
(10249, 'wx_15066085836238', NULL, NULL, NULL, '晗', '', 0, 0, 0, 1, 0, 1506608583, NULL, 1506608591, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_t9b2FxAsqm8z9U6PUdhy0', 10129, 1),
(10250, 'wx_15066086529292', NULL, NULL, NULL, '银银', '', 0, 0, 0, 1, 0, 1506608652, NULL, 1506608661, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07ZSPU_wnuWkQEhoGClEhHs', 10193, 1),
(10251, 'wx_15066086655704', NULL, NULL, NULL, '华世李', '', 0, 0, 0, 1, 0, 1506608665, NULL, 1506608697, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xpEPXsh3fTWqJvgyG1po0w', 10193, 1),
(10252, 'wx_15066086738788', NULL, NULL, NULL, '10193_8947', '', 0, 0, 0, 1, 0, 1506608673, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-n-bbx9ZkTlTVYuXgKYawQ', 10193, 1),
(10253, 'wx_15066086822138', NULL, NULL, NULL, '易利辉', '易利辉', 0, 0, 0, 1, 0, 1506608682, NULL, 1506609178, NULL, 0, 0, NULL, '18807411778', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_OTO2PZDmiOIiuBLcU6GP4', 10193, 1),
(10254, 'wx_15066086971118', NULL, NULL, NULL, '绿地', '', 0, 0, 0, 1, 0, 1506608697, NULL, 1506608716, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05D-1Ov0vegjTGCqbXq3LEs', 10193, 1),
(10255, 'wx_15066087186715', NULL, NULL, NULL, '邹玲 18975127810', '', 0, 0, 0, 1, 0, 1506608718, NULL, 1506608725, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05pjVmvIPg-4Cubk7jv2fMY', 10193, 1),
(10256, 'wx_15066087255919', NULL, NULL, NULL, '10247_7508', '', 0, 0, 0, 1, 0, 1506608725, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wGUsbn3bxsB21elalD_DAw', 10247, 1),
(10257, 'wx_15066087362559', NULL, NULL, NULL, '徐玉堂', '', 0, 0, 0, 1, 0, 1506608736, NULL, 1506608875, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zCKnEB2zlXBDbT_Vvqha7E', 10084, 1),
(10258, 'wx_15066087557440', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/g5PdLJCTsn6Ckn2z6WnfzTHvX4LhTe6aY95CyvsRIeIkbUAwUFPIFtRmr0cIu5BE7poffgXfY9CYCibfJLcnXuQ/0', NULL, '小龙女', '谢龙', 0, 0, 0, 1, 0, 1506608755, NULL, 1507340819, NULL, 0, 0, NULL, '18692277955', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB038tRKind6VdKRbcVzQIAis', 10193, 1),
(10259, 'wx_15066087988898', NULL, NULL, NULL, '夜未央', '', 0, 0, 0, 1, 0, 1506608798, NULL, 1506608877, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yKKygL0Er_KUfDrfY4Mo2c', 10193, 0),
(10260, 'wx_15066088167539', NULL, NULL, NULL, '月亮', '', 0, 0, 0, 1, 0, 1506608816, NULL, 1506608829, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05PlFyCu03H9R9C8mo62O7c', 10193, 1),
(10261, 'wx_15066088198313', NULL, NULL, NULL, '飘飘', '吴佳容', 0, 0, 0, 1, 0, 1506608819, NULL, 1506608867, NULL, 0, 0, NULL, '13787161597', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06UQ6joDZ3feKjnrinmBXjw', 10084, 1),
(10262, 'wx_15066088959825', NULL, NULL, NULL, '环球Pearl许肖依 13545142550', '', 0, 0, 0, 1, 0, 1506608895, NULL, 1506608932, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01nk8il-bxGJeWvRkrLZMWg', 10193, 1),
(10263, 'wx_15066089138377', NULL, NULL, NULL, '嘻嘻', '', 0, 0, 0, 1, 0, 1506608913, NULL, 1506608928, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_5lAHnWZc_nNGF9ANqDzqU', 10193, 1),
(10264, 'wx_15066089577319', NULL, NULL, NULL, 'y~\"开水白菜\"', '', 0, 0, 0, 1, 0, 1506608957, NULL, 1506640039, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB020kVpftF1UC4tqA51GE_lg', 10231, 1),
(10265, 'wx_15066089902489', NULL, NULL, NULL, '小周汽车装饰', '', 0, 0, 0, 1, 0, 1506608990, NULL, 1506610898, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zKsf0HWzr7niRw5dTvma2c', 10245, 1),
(10266, 'wx_15066090703504', NULL, NULL, NULL, '苗', '', 0, 0, 0, 1, 0, 1506609070, NULL, 1506609084, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07BNFpgprhsYWTfRm1WNaUY', 10193, 1),
(10267, 'wx_15066090897771', NULL, NULL, NULL, 'ViVi', '', 0, 0, 0, 1, 0, 1506609089, NULL, 1506609126, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06s9H_SeSwMXblqOuNvbnHs', 10193, 1),
(10268, 'wx_15066091309116', NULL, NULL, NULL, '陌上花开', '', 0, 0, 0, 1, 0, 1506609130, NULL, 1506609136, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00wLB-IZ0d5U7rCpgpebMm4', 10193, 1),
(10269, 'wx_15066091333695', NULL, NULL, NULL, '唐鑫', '', 0, 0, 0, 1, 0, 1506609133, NULL, 1506609142, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04BOZjUSm7Ix1g2Hip5iZ70', 10193, 1),
(10270, 'wx_15066092524941', NULL, NULL, NULL, '何艳', '', 0, 0, 0, 1, 0, 1506609252, NULL, 1506609578, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0x998FpOqA1k5o4A1qjMIiY', 10193, 1),
(10271, 'wx_15066092585764', NULL, NULL, NULL, '潜心修道', '', 0, 0, 0, 1, 0, 1506609258, NULL, 1506644761, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yz8TeY8C4LxFW2P7SIaCqg', 10193, 1),
(10272, 'wx_15066093181445', NULL, NULL, NULL, 'Mini', '', 0, 0, 0, 1, 0, 1506609318, NULL, 1506609323, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02y4iXTjzd0UyATxV3JFAJ8', 10193, 1),
(10273, 'wx_15066093748837', NULL, NULL, NULL, '10193_8221', '', 0, 0, 0, 1, 0, 1506609374, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB076Mu639kXdGz-8lDRiweV4', 10193, 1),
(10274, 'wx_15066093993319', NULL, NULL, NULL, '郝淑芹', '', 0, 0, 0, 1, 0, 1506609399, NULL, 1506609416, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB006MPoeVyt0Y5Hf4A5LQZdI', 10193, 1),
(10275, 'wx_15066094751164', NULL, NULL, NULL, '个性礼品定制丁丁', '', 0, 0, 0, 1, 0, 1506609475, NULL, 1506609480, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07srX60664k6C8Kg1UXjDYU', 10193, 1),
(10276, 'wx_15066094784963', NULL, NULL, NULL, 'xxg', '', 0, 0, 0, 1, 0, 1506609478, NULL, 1506609533, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_Y3XT3u7hKZWQCxJKx_sL4', 10193, 1),
(10277, 'wx_15066094796886', NULL, NULL, NULL, '10193_4064', '', 0, 0, 0, 1, 0, 1506609479, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07Lb3klxkqIpOhr9WZ8PDIg', 10193, 1),
(10278, 'wx_15066095298302', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKmCVdnVtX9oSKiagsH1Tlx4ibpddkkxsupBVYIn7P3V1UqiaaB0872ZSbMoaRiaLqicRZRNEmn8FrYo2A/0', NULL, '大雁侠vip', '周雁', 0, 0, 0, 1, 0, 1506609529, NULL, 1506920971, NULL, 0, 0, NULL, '13397416168', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0w2Iv06Ii7u8nhvFzvau5ms', 10193, 1),
(10279, 'wx_15066095678544', NULL, NULL, NULL, '10257_8293', '', 0, 0, 0, 1, 0, 1506609567, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_KAMsy-dxofwIJgo3QHAjM', 10257, 1),
(10280, 'wx_1506609598', NULL, NULL, NULL, '海天', '', 0, 0, 0, 1, 0, 1506609598, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0--MKD5080EKLiTHkGEW8lw', 10275, 0),
(10281, 'wx_15066096118877', NULL, NULL, NULL, '友文彩印谭丽红', '', 0, 0, 0, 1, 0, 1506609611, NULL, 1506611071, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01XevJ8n-f1l_q135whWuGY', 10193, 1),
(10282, 'wx_15066096325796', NULL, NULL, NULL, '10193_6706', '', 0, 0, 0, 1, 0, 1506609632, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xyy1JozVeAF7w6yIFSKCXA', 10193, 1),
(10283, 'wx_15066096382566', NULL, NULL, NULL, '10257_8111', '', 0, 0, 0, 1, 0, 1506609638, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06bTUEnnAjDszGwFfqseLy4', 10257, 1),
(10284, 'wx_15066096667880', NULL, NULL, NULL, '杨玲', '', 0, 0, 0, 1, 0, 1506609666, NULL, 1506610685, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zXB2sbDBkfO96y9FtMQZdE', 10245, 1),
(10285, 'wx_15066096833757', NULL, NULL, NULL, 'nobut', '', 0, 0, 0, 1, 0, 1506609683, NULL, 1506609797, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09iQvsowTLpp3zWcPOfVBNc', 10084, 1),
(10286, 'wx_15066096989466', NULL, NULL, NULL, '10193_4013', '', 0, 0, 0, 1, 0, 1506609698, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03n3GEPcySCDFG0x6M4wDvY', 10193, 0),
(10287, 'wx_15066097043327', NULL, NULL, NULL, '10193_1320', '', 0, 0, 0, 1, 0, 1506609704, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yl1OUUqzQitYzmo4CA2YG0', 10193, 1),
(10288, 'wx_15066097209279', NULL, NULL, NULL, '10271_3216', '', 0, 0, 0, 1, 0, 1506609720, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08ZchY76l_4t87wPqqwLGns', 10271, 0),
(10289, 'wx_15066097871299', NULL, NULL, NULL, '10237_7121', '', 0, 0, 0, 1, 0, 1506609787, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-Zxt6qFA_DM-U5_1vQyz8M', 10237, 1),
(10290, 'wx_15066098061501', NULL, NULL, NULL, '10193_8907', '', 0, 0, 0, 1, 0, 1506609806, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_ns4XsqeLmuDgldgbDgqg0', 10193, 1),
(10291, 'wx_15066098176578', NULL, NULL, NULL, '浅笑嫣然', '', 0, 0, 0, 1, 0, 1506609817, NULL, 1506609822, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0y4tgLH_7MZjwNGp3UcrQ4s', 10271, 1),
(10292, 'wx_15066098649913', NULL, NULL, NULL, 'smile', '', 0, 0, 0, 1, 0, 1506609864, NULL, 1506610137, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04tqmLIOvmw56zd3yEH3BeI', 10193, 1),
(10293, 'wx_15066098786817', NULL, NULL, NULL, '海', '', 0, 0, 0, 1, 0, 1506609878, NULL, 1506609911, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0z4oPYGIO0jGYRrIdYFl0ec', 10193, 1),
(10294, 'wx_15066098841754', NULL, NULL, NULL, '嘉仪 古月伊生', '', 0, 0, 0, 1, 0, 1506609884, NULL, 1506609888, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00pbDj2OyHZx3m7mWRUHtgQ', 10271, 1),
(10295, 'wx_15066098894213', NULL, NULL, NULL, '牡丹妹妹', '', 0, 0, 0, 1, 0, 1506609889, NULL, 1506609900, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02x1yuBR3qDPTdYJ7LG1v7c', 10271, 1),
(10296, 'wx_15066099091484', NULL, NULL, NULL, '10234_7045', '', 0, 0, 0, 1, 0, 1506609909, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08_7K5xYS9x98_WEgHaapXw', 10234, 1);
INSERT INTO `bao_users` (`user_id`, `account`, `password`, `face`, `ext0`, `nickname`, `truename`, `integral`, `prestige`, `money`, `rank_id`, `gold`, `reg_time`, `reg_ip`, `last_time`, `last_ip`, `closed`, `uc_id`, `email`, `mobile`, `ping_num`, `post_num`, `invite1`, `invite2`, `invite3`, `invite4`, `invite5`, `invite6`, `token`, `p_openid`, `pid`, `is_subscribe`) VALUES
(10297, 'wx_15066099245250', NULL, NULL, NULL, ' 阳光灿烂', '', 0, 0, 0, 1, 0, 1506609924, NULL, 1506609942, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wFHX221Vfwr9a37c4EGK_E', 10193, 1),
(10298, 'wx_15066099341258', NULL, NULL, NULL, '10193_1045', '', 0, 0, 0, 1, 0, 1506609934, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05fn2goVxE6oIi9tDRMAcFQ', 10193, 1),
(10299, 'wx_15066099402525', NULL, NULL, NULL, '谭员外', '', 0, 0, 0, 1, 0, 1506609940, NULL, 1506609953, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00XzxhVwNNQT4-zyLeAoUg8', 10271, 1),
(10300, 'wx_15066099471012', NULL, NULL, NULL, '微智', '', 0, 0, 0, 1, 0, 1506609947, NULL, 1506609988, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wV5cq7YQbJ1I0K4IWroJNw', 10271, 1),
(10301, 'wx_15066099521056', NULL, NULL, NULL, '10193_6567', '', 0, 0, 0, 1, 0, 1506609952, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02_e9DUYCXhAoyh11YnBTp0', 10193, 1),
(10302, 'wx_15066099549656', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/AOKK8mzdWAag5StLzhT28BBfYaLblEXcEIXZ60rRVIkMs6n3oBbOTU3KicreAcxPpD07hP8K5gcCkLI6picU4cjg/0', NULL, '小镁姐', '', 0, 0, 0, 1, 0, 1506609954, NULL, 1506677725, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02Q-JYEZ3qgj4znfhF1La58', 10237, 1),
(10303, 'wx_15066099826874', NULL, NULL, NULL, '﹎困惑。', '', 0, 0, 0, 1, 0, 1506609982, NULL, 1506609987, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB027cRd4zlA-sM9MPM5wA0Ww', 10193, 1),
(10304, 'wx_15066099843585', NULL, NULL, NULL, '熊小坑。', '', 0, 0, 0, 1, 0, 1506609984, NULL, 1506610018, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07ah2TgtlkEy5fXxUuDCRDo', 10193, 1),
(10305, 'wx_1506609989', NULL, NULL, NULL, '周锋', '', 0, 0, 0, 1, 0, 1506609989, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09MoBym9wVs86XfTgPad7Q8', NULL, 1),
(10306, 'wx_15066099897104', NULL, NULL, NULL, '筷子兄弟', '何快', 0, 0, 0, 1, 0, 1506609989, NULL, 1506658086, NULL, 0, 0, NULL, '13786141994', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07HnBWdT1v2FluYUJhpjtfw', 10193, 1),
(10307, 'wx_15066100189116', NULL, NULL, NULL, '10193_1098', '', 0, 0, 0, 1, 0, 1506610018, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB080vdPSfxNhxWPqNtJOCwGg', 10193, 1),
(10308, 'wx_15066100607161', NULL, NULL, NULL, '掌声响起来', '', 0, 0, 0, 1, 0, 1506610060, NULL, 1506658028, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01hoAtc3CMkyxdMK571KWtM', 10193, 1),
(10309, 'wx_15066100641711', NULL, NULL, NULL, '', '', 0, 0, 0, 1, 0, 1506610064, NULL, 1506655323, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07YKzNi2IKf7M_bCXhmXBIw', 10193, 1),
(10310, 'wx_15066101175245', NULL, NULL, NULL, '文锋', '', 0, 0, 0, 1, 0, 1506610117, NULL, 1506610145, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03rU2nwF-jxiR07kW13Or44', 10193, 1),
(10311, 'wx_15066101185927', NULL, NULL, NULL, '微妈妈', '', 0, 0, 0, 1, 0, 1506610118, NULL, 1506610210, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xvhlUmZX_vJFjrKVWU5Ips', 10084, 1),
(10312, 'wx_15066101263855', NULL, NULL, NULL, '10271_9436', '', 0, 0, 0, 1, 0, 1506610126, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB067L950QMA_mqZL15HsMOH8', 10271, 1),
(10313, 'wx_1506610147', NULL, NULL, NULL, '米米', '', 0, 0, 0, 1, 0, 1506610147, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB005lbT-RLsTnjofGMtFjUE0', 10275, 0),
(10314, 'wx_15066101574409', NULL, NULL, NULL, '天行健', '', 0, 0, 0, 1, 0, 1506610157, NULL, 1506645904, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-vA43_zbKBVEABdicTpl3Q', 10271, 1),
(10315, 'wx_15066101618891', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKlJWibJZnnAWRMV5RcLJWbNRF554qMU7jHbaCejRg3zAmKa8ht7oKDyf9sGiarDwdrkLFfFicF9LYFg/0', NULL, '刘恒', '', 0, 0, 0, 1, 0, 1506610161, NULL, 1506782794, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07YQMWL8o6lcM0AfTlAKxRc', 10084, 1),
(10316, 'wx_15066101638982', NULL, NULL, NULL, '10193_6151', '', 0, 0, 0, 1, 0, 1506610163, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04kpKxX4vaJeLFpPD-dXcnc', 10193, 1),
(10317, 'wx_15066101942740', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKS8ErvFxKfnADKVZkSfQvib6Q53wT3OrW1HibBMIhia2iaPysx2Wf0XAyJdWoM6hqEBMGzH5PetgaQ3g/0', NULL, '宋亮', '宋亮', 0, 0, 0, 1, 0, 1506610194, NULL, 1506698142, NULL, 0, 0, NULL, '13874964967', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01ENnXNgwevTj5tsmQjJl5Q', 10193, 1),
(10318, 'wx_15066102247585', NULL, NULL, NULL, '', '', 0, 0, 0, 1, 0, 1506610224, NULL, 1506641952, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zjkFOdRM822AWH0NWA0pUc', 10193, 1),
(10319, 'wx_1506610232', NULL, NULL, NULL, '只在乎现在', '', 0, 0, 0, 1, 0, 1506610232, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01B8i02KR1atetrxrl2aVLE', NULL, 0),
(10320, 'wx_15066103932780', NULL, NULL, NULL, '10226_7986', '', 0, 0, 0, 1, 0, 1506610393, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wA8M1PZM6fEIk7TPpi68fA', 10226, 1),
(10321, 'wx_15066104366431', NULL, NULL, NULL, '10084_6708', '', 0, 0, 0, 1, 0, 1506610436, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06W1sU8cQ0OhbS0xA2sdxb4', 10084, 1),
(10322, 'wx_15066104407419', NULL, NULL, NULL, '10257_4655', '', 0, 0, 0, 1, 0, 1506610440, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05rMdNjrxMDl0cyL4q3wR78', 10257, 1),
(10323, 'wx_15066104767377', NULL, NULL, NULL, '10084_2451', '', 0, 0, 0, 1, 0, 1506610476, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09zOyahA7x2NHfuKUrB8erw', 10084, 1),
(10324, 'wx_1506610481', NULL, NULL, NULL, NULL, '', 0, 0, 0, 1, 0, 1506610481, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, 0),
(10325, 'wx_1506610559', NULL, NULL, NULL, 'vivo小邓电信宽带顾问17788998113', '', 0, 0, 0, 1, 0, 1506610559, NULL, 1506610640, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05bd7TSz1Y0tIzqmV0B0j4k', 10275, 1),
(10326, 'wx_15066105598172', NULL, NULL, NULL, '笑寒', '', 0, 0, 0, 1, 0, 1506610559, NULL, 1506616164, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0ygArbAbVMs7HFE34VjZJAM', 10193, 1),
(10327, 'wx_15066105783656', NULL, NULL, NULL, '10193_9572', '', 0, 0, 0, 1, 0, 1506610578, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wcX7HwR7wGYhiZhKZaYOhk', 10193, 1),
(10328, 'wx_15066105834109', NULL, NULL, NULL, '10084_3431', '', 0, 0, 0, 1, 0, 1506610583, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09XJc68eAYwKlYnWyauJCZw', 10084, 1),
(10329, 'wx_15066107456361', NULL, NULL, NULL, '10226_5880', '', 0, 0, 0, 1, 0, 1506610745, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_sTDCBDtU20mh-Udeiad0Y', 10226, 1),
(10330, 'wx_15066107849609', NULL, NULL, NULL, '10084_6251', '', 0, 0, 0, 1, 0, 1506610784, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08U-IAnU4Z6bTnOWuOu_uw0', 10084, 0),
(10331, 'wx_15066108162985', NULL, NULL, NULL, '兰兰', '', 0, 0, 0, 1, 0, 1506610816, NULL, 1506610826, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB010ByQDCxTugpxl3-s3l3tI', 10226, 1),
(10332, 'wx_15066108289964', NULL, NULL, NULL, '明歌', '', 0, 0, 0, 1, 0, 1506610828, NULL, 1506611248, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_T0_bnyBYjgoo5qDBPBMX0', 10193, 1),
(10333, 'wx_15066108461094', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLQaMteDutdlKWdAfe6fQNNgunjRpuKMTtVW5p3ZZ4tOBR7KWB459X9iah97ficf94bAfCwHbzCJ65g/0', NULL, 'sunny', '张雪', 0, 0, 0, 1, 0, 1506610846, NULL, 1507088956, NULL, 0, 0, NULL, '13387311959', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08U3CpwBKFm-LRQTaOK0uFQ', 10226, 1),
(10334, 'wx_1506610927', NULL, NULL, NULL, 'Zhen', '', 0, 0, 0, 1, 0, 1506610927, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xUWGpKB9SWvgIO-l2g_Jh0', NULL, 1),
(10335, 'wx_15066109275043', NULL, NULL, NULL, '10232_5296', '', 0, 0, 0, 1, 0, 1506610927, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03nQ3jQOv3pONw-dBKqZyMY', 10232, 1),
(10336, 'wx_15066110143276', NULL, NULL, NULL, '10238_1803', '', 0, 0, 0, 1, 0, 1506611014, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08fYSMpqGyqvv4iSnXSIbco', 10238, 1),
(10337, 'wx_15066110878978', NULL, NULL, NULL, '程程', '', 0, 0, 0, 1, 0, 1506611087, NULL, 1506611155, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02GxAMbhE7GWVi8xLq3ZVNQ', 10226, 0),
(10338, 'wx_15066111179971', NULL, NULL, NULL, '风轻云静的小辣椒', '', 0, 0, 0, 1, 0, 1506611117, NULL, 1506611148, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0x9XStBdHiawoz_YjHFJ5ng', 10095, 1),
(10339, 'wx_1506611130', NULL, NULL, NULL, '喜群', '', 0, 0, 0, 1, 0, 1506611130, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yAkDLCwbKW5vZ5yoHlIoHQ', NULL, 0),
(10340, 'wx_15066112066954', NULL, NULL, NULL, '10226_9577', '', 0, 0, 0, 1, 0, 1506611206, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01BDvO8zweb-tlXm1rB--nI', 10226, 1),
(10341, 'wx_15066112472695', NULL, NULL, NULL, '', '廖亮', 0, 0, 0, 1, 0, 1506611247, NULL, 1506646566, NULL, 0, 0, NULL, '15273155258', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_5loBuznJGL9QATRkFkaLc', 10193, 1),
(10342, 'wx_15066112783096', NULL, NULL, NULL, '流震心', '', 0, 0, 0, 1, 0, 1506611278, NULL, 1506611868, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_MzT7JKHuTy7osoBflP2lw', 10193, 1),
(10343, 'wx_15066113289668', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/iaeFs0REHV9gAsLY1R3qXLMsNLIWlu05Y0uCxSFiaIlfNqWPpMiaGXvMsF6rT5icT9Jq6z3RWT3AibVG0L783O0IJBw/0', NULL, '辉', '王先生', 0, 0, 0, 1, 0, 1506611328, NULL, 1506741953, NULL, 0, 0, NULL, '18673178130', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-C2fEppJkCwSvDIR5HnINU', 10226, 1),
(10344, 'wx_15066114101194', NULL, NULL, NULL, '微笑', '', 0, 0, 0, 1, 0, 1506611410, NULL, 1506611428, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_8WZBJoTlPwwbDk43ceDRo', 10193, 1),
(10345, 'wx_15066114665676', NULL, NULL, NULL, '10271_9861', '', 0, 0, 0, 1, 0, 1506611466, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00xsNkXlsh_a42JhD_cJEOI', 10271, 0),
(10346, 'wx_15066114695108', NULL, NULL, NULL, 'wyd', '', 0, 0, 0, 1, 0, 1506611469, NULL, 1506611728, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00JE4rMIbwEKyadji3hdkNg', 10193, 1),
(10347, 'wx_15066115803707', NULL, NULL, NULL, '春材', '', 0, 0, 0, 1, 0, 1506611580, NULL, 1506611647, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0y6fJEnBCt8T1J1KWtb5otY', 10193, 1),
(10348, 'wx_15066115867657', NULL, NULL, NULL, '10226_2563', '', 0, 0, 0, 1, 0, 1506611586, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07fBHYePhscmHfURg9nYUTc', 10226, 1),
(10349, 'wx_15066116272249', NULL, NULL, NULL, '李杰-W&ART', '', 0, 0, 0, 1, 0, 1506611627, NULL, 1506611635, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yEMQjkWMxA03fFTQHq4zD0', 10193, 1),
(10350, 'wx_15066117765619', NULL, NULL, NULL, '10193_3664', '', 0, 0, 0, 1, 0, 1506611776, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xAKkgCO9aaFOtAfrf9iUDw', 10193, 1),
(10351, 'wx_15066119233450', NULL, NULL, NULL, '10193_3851', '', 0, 0, 0, 1, 0, 1506611923, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06ctChfvw_1eHlM3Edjudy0', 10193, 1),
(10352, 'wx_1506611937', NULL, NULL, NULL, '嘟嘟妈', '', 0, 0, 0, 1, 0, 1506611937, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0y9P1xxxINe8HK2OeeHl8GI', NULL, 1),
(10353, 'wx_15066119841235', NULL, NULL, NULL, '10193_6000', '', 0, 0, 0, 1, 0, 1506611984, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01RiSNOX-Nt9gcFrZlfo3FA', 10193, 1),
(10354, 'wx_15066120318904', NULL, NULL, NULL, '10084_7047', '', 0, 0, 0, 1, 0, 1506612031, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00MbIVjJdgfWIElb6F4sEK4', 10084, 1),
(10355, 'wx_1506612083', NULL, NULL, NULL, 'A～Liu', '', 0, 0, 0, 1, 0, 1506612083, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zFyaoZtxDE3gahxcRTHdQA', 10264, 0),
(10356, 'wx_15066121394015', NULL, NULL, NULL, '10232_5405', '', 0, 0, 0, 1, 0, 1506612139, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01UnK9rchuTzDATmcnHMA5I', 10232, 0),
(10357, 'wx_15066121803349', NULL, NULL, NULL, '10237_8796', '', 0, 0, 0, 1, 0, 1506612180, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0w7A403rsxQUg-L6itqd_YY', 10237, 1),
(10358, 'wx_15066122967491', NULL, NULL, NULL, '10193_9605', '', 0, 0, 0, 1, 0, 1506612296, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_OiImR_TAa8yeRCf3FpbCA', 10193, 1),
(10359, 'wx_15066123663250', NULL, NULL, NULL, '10193_9629', '', 0, 0, 0, 1, 0, 1506612366, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_7qqjiDK3guGsH7zFrKgWo', 10193, 1),
(10360, 'wx_15066128354004', NULL, NULL, NULL, '10240_7772', '', 0, 0, 0, 1, 0, 1506612835, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB092YuaxVJyfedWRq2nQoPXY', 10240, 1),
(10361, 'wx_15066130031996', NULL, NULL, NULL, '简单de做人', '', 0, 0, 0, 1, 0, 1506613003, NULL, 1506613141, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08XGiXPyjipXMlFcfvUwlPU', 10193, 1),
(10362, 'wx_15066133017791', NULL, NULL, NULL, '丁丁', '', 0, 0, 0, 1, 0, 1506613301, NULL, 1506613322, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01nT5nCHpjRrFRONT2FTiFQ', 10343, 1),
(10363, 'wx_15066134526847', NULL, NULL, NULL, '刘沙沙18569497915', '', 0, 0, 0, 1, 0, 1506613452, NULL, 1506613465, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zIZuSGrP-PlSIcvUQFHu7g', 10226, 1),
(10364, 'wx_15066135458022', NULL, NULL, NULL, '戴莉莉', '', 0, 0, 0, 1, 0, 1506613545, NULL, 1506613583, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08GzB8w_DSTZEaz7Kqs31uw', 10193, 1),
(10365, 'wx_15066138225835', NULL, NULL, NULL, '10084_4612', '', 0, 0, 0, 1, 0, 1506613822, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02LATWYI9Cs4slNad-9coVo', 10084, 1),
(10366, 'wx_15066139794721', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoIu6ic0D7aFUdr5F1HJFc44DtyYbC0YxvXaToNsOTyFkrwfe4bkFYt7I1ImjldfY4VicmTZheLt47w/0', NULL, '欧兵华', '', 0, 0, 0, 1, 0, 1506613979, NULL, 1506819635, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0ytUZwIJMCW3AMFjPkXuDDw', 10193, 1),
(10367, 'wx_15066140776737', NULL, NULL, NULL, '10193_4069', '', 0, 0, 0, 1, 0, 1506614077, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07RVagap5XBCQo5LhvyzVhA', 10193, 1),
(10368, 'wx_15066142463364', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLe9NH7m00ZYWKwPNGqIMsmiaQX3CE5nBgCDcJ3vnuM9qlQ3UkOIdpdz1hDNbCvqpZj7WNWdyZ5VOg/0', NULL, '陈美芳', '丁晨熙', 0, 0, 0, 1, 0, 1506614246, NULL, 1506725731, NULL, 0, 0, NULL, '13574840503', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07j254P2ax7gsc3zoRcM3Gg', 10271, 1),
(10369, 'wx_15066147919684', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/jkNFdjysIuCqgwIEUyR7EsicSfP99ZESicEZoCr2QnvaghcWhJbQueRHBlI8As1ZibfqicrPpGgQKHzicG5Xsibkp9jQ/0', NULL, '一生所爱', '', 0, 0, 0, 1, 0, 1506614791, NULL, 1506760524, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03ypS9FKI7E802f2csKI2-o', 10193, 1),
(10370, 'wx_15066149189124', NULL, NULL, NULL, '隐形的翅膀', '', 0, 0, 0, 1, 0, 1506614918, NULL, 1506615122, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zB-201nb3-OIqvEDIs9zyU', 10193, 1),
(10371, 'wx_15066149934692', NULL, NULL, NULL, '看云', '', 0, 0, 0, 1, 0, 1506614993, NULL, 1506615012, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xciLIGAMuub39zlZvXJ8GI', 10193, 1),
(10372, 'wx_15066150979440', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/oibNQr0sgVy4ia7MR0Fnky0ESUsnicHo2k09GXHTL9EicU20uKePl4D2ChsNzvSgtqyas9r71G3kibxO0pzia5u4ekrQ/0', NULL, 'zTing', '', 0, 0, 0, 1, 0, 1506615097, NULL, 1506775611, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0ywkSa64aFvpJL_Z01jqRwo', 10341, 1),
(10373, 'wx_15066152664209', NULL, NULL, NULL, '10193_1265', '', 0, 0, 0, 1, 0, 1506615266, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0w0hg2gEYUtVPTqRXJ-Wc7Y', 10193, 1),
(10374, 'wx_15066154395309', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/baaer8ibfYRbdLPnArU0aFJdeaNqibd5LI56MTSyYhlicicUk8ySjCu0OyFD8DIeSFdo09RwZQu6FdYsLTtqF6aXicw/0', NULL, '华哥', '张俊华', 0, 0, 0, 1, 0, 1506615439, NULL, 1506912908, NULL, 0, 0, NULL, '18229964888', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08hEX7YfOe9ZppNQkG0lvOI', 10193, 1),
(10375, 'wx_15066156537686', NULL, NULL, NULL, '格瓦拉', '罗意豪', 0, 0, 0, 1, 0, 1506615653, NULL, 1506647122, NULL, 0, 0, NULL, '18684839289', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0z9BE0O-ZAplk80Cu07DO48', 10193, 1),
(10376, 'wx_15066160772964', NULL, NULL, NULL, '小 ⑨', '', 0, 0, 0, 1, 0, 1506616077, NULL, 1506616210, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04xNfeDbvYw9Q2SwdOf0uAI', 10193, 0),
(10378, 'wx_15066176741487', NULL, NULL, NULL, '李坚', '', 0, 0, 0, 1, 0, 1506617674, NULL, 1506646037, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB063ekDu0WYm9S4G45FyebJI', 10193, 1),
(10377, 'wx_15066161358542', NULL, NULL, NULL, '10343_6006', '', 0, 0, 0, 1, 0, 1506616135, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-LPBwFmkghJl75PsIuYFnk', 10343, 1),
(10379, 'wx_1506618254', NULL, NULL, NULL, '浴火涅槃', '', 0, 0, 0, 1, 0, 1506618254, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07FMs-ZoI7px7dbax6aBbrM', NULL, 1),
(10380, 'wx_1506618403', NULL, NULL, NULL, 'Sunny', '', 0, 0, 0, 1, 0, 1506618403, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zvSrrgazIXXNx4w-lRw92g', NULL, 0),
(10381, 'wx_15066191948580', NULL, NULL, NULL, 'Sam', '', 0, 0, 0, 1, 0, 1506619194, NULL, 1506619215, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07gi66DFvYi3nhNiN6EJf4g', 10193, 1),
(10382, 'wx_15066194092886', NULL, NULL, NULL, '', '', 0, 0, 0, 1, 0, 1506619409, NULL, 1506619420, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_56Lndw3RGkEBYSdmTWfK4', 10308, 0),
(10383, 'wx_15066250933007', NULL, NULL, NULL, '我是小忆', '董娟', 0, 0, 0, 1, 0, 1506625093, NULL, 1506625108, NULL, 0, 0, NULL, '15802642325', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0y9Jg0iuuX3UWzEuMf0Ac58', 10271, 1),
(10384, 'wx_15066250966301', NULL, NULL, NULL, '10237_7980', '', 0, 0, 0, 1, 0, 1506625096, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xyIWH-fBZZ1zMm1RcXXtBY', 10237, 1),
(10385, 'wx_15066271615322', NULL, NULL, NULL, '10084_4537', '', 0, 0, 0, 1, 0, 1506627161, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04VYQiBRbKrQG1mKPg7D8g8', 10084, 1),
(10386, 'wx_15066278655581', NULL, NULL, NULL, '10240_9064', '', 0, 0, 0, 1, 0, 1506627865, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08Rc_-hCywwVgH4tzKPmXrE', 10240, 1),
(10387, 'wx_15066350156930', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/bwUov9kmhWbOs8SYMxprU8Z7WTAiaolMHiblibSrGB2HZ5MfCBC2sbtOiaInWzXBA9L4A6uuIHqJJo6MjJRIOVz2ug/0', NULL, 'dan', '张丹', 0, 0, 0, 1, 0, 1506635015, NULL, 1506862022, NULL, 0, 0, NULL, '15116422727', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wACh7KPgOGvbHFWgPDrsxE', 10237, 1),
(10388, 'wx_1506635222', NULL, NULL, NULL, '樱花雨', '', 0, 0, 0, 1, 0, 1506635222, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0z4SBSOfW5Om8GCvNJl1a-s', NULL, 0),
(10389, 'wx_15066357287735', NULL, NULL, NULL, '10084_5203', '', 0, 0, 0, 1, 0, 1506635728, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08NzD9LefLUoJDbzzqAX01Y', 10084, 1),
(10390, 'wx_15066357587331', NULL, NULL, NULL, '10258_9356', '', 0, 0, 0, 1, 0, 1506635758, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08XC1GSX7Ttl0zFVepLEmsY', 10258, 1),
(10391, 'wx_15066360793297', NULL, NULL, NULL, '10193_6571', '', 0, 0, 0, 1, 0, 1506636079, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0545nsRWAzKKH5K4LZSAH50', 10193, 1),
(10392, 'wx_15066365097192', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/5V4t5pH6GovoEUUaB3junibt7opVknRQbgjCoV7PmpPN6UNIHukHqch3Usy3zgwmMcxsyYicicqN2huPIs3TiagVvQ/0', NULL, '向艳', '向艳', 0, 0, 0, 1, 0, 1506636509, NULL, 1506815355, NULL, 0, 0, NULL, '13974819450', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00Tjo4G68nPnDad0Dnltfnk', 10341, 1),
(10393, 'wx_1506636676', NULL, NULL, NULL, '娟', '', 0, 0, 0, 1, 0, 1506636676, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xUq1ALaHDHi7aYVOvLrSpI', NULL, 1),
(10394, 'wx_1506636698', NULL, NULL, NULL, '小米', '', 0, 0, 0, 1, 0, 1506636698, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00cxI_5xFSm2JphlKdsTSAs', NULL, 0),
(10395, 'wx_15066374968052', NULL, NULL, NULL, '坚持 坚强', '', 0, 0, 0, 1, 0, 1506637496, NULL, 1506637509, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03oxum0IToFhXiJXwABzHwg', 10234, 1),
(10396, 'wx_15066381914644', NULL, NULL, NULL, 'old man&sea', '梁洋', 0, 0, 0, 1, 0, 1506638191, NULL, 1506638843, NULL, 0, 0, NULL, '13517484070', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_7eBY_YfSyP8JTKAGJwII0', 10341, 1),
(10397, 'wx_1506638373', NULL, NULL, NULL, ' 五朵金花李鹏霞', '', 0, 0, 0, 1, 0, 1506638373, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08Puu_sJNxsT3KLtYaWtEZQ', NULL, 0),
(10398, 'wx_1506638610', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/h4J1nJibxBvN1QgjsEJf2DlHF3ALp7oF74E2ydticRLPEEloHqMcLtrECJ1ZTsCbulO7mBiacqES2UOLSibFgbNfEQ/0', NULL, '齐章礼', '', 0, 0, 0, 1, 0, 1506638610, NULL, 1506733354, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00rAPbV7l5GQKSAYXK2q2o0', 10387, 0),
(10399, 'wx_15066386616194', NULL, NULL, NULL, '10193_8955', '', 0, 0, 0, 1, 0, 1506638661, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01-SpwnJx9k1tS0XEJ01lZE', 10193, 1),
(10400, 'wx_1506638679', NULL, NULL, NULL, '邓邓的邓邓', '', 0, 0, 0, 1, 0, 1506638679, NULL, 1506639472, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05qKTQr9h-cZlDMLhc48s3I', 10396, 0),
(10401, 'wx_15066389139192', NULL, NULL, NULL, '周素', '', 0, 0, 0, 1, 0, 1506638913, NULL, 1506639101, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xPjDr6amqjnuzyOrA9lTuI', 10084, 0),
(10402, 'wx_15066390806349', NULL, NULL, NULL, '雲ཧག༢།mu喵呦', '', 0, 0, 0, 1, 0, 1506639080, NULL, 1506639166, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09qsemG6oqUldK4Gnm9sEj8', 10271, 1),
(10403, 'wx_15066391227514', NULL, NULL, NULL, '朱朱', '', 0, 0, 0, 1, 0, 1506639122, NULL, 1506639136, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08COIo_0gqyKmCdD-pRrCLo', 10271, 1),
(10404, 'wx_15066391612316', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/19yEsJTn4V2I2ACf5wRQeXBeCSI3p9qNDJyURQc3oxpiaxczC51YmaqLbEdrZb0Td0Hx4xLwF6OLicJPqyFabpJA/0', NULL, '婧瑜', '', 0, 0, 0, 1, 0, 1506639161, NULL, 1506871742, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yh4yPmnB_zzOTIbRl4iew8', 10226, 1),
(10405, 'wx_15066393344157', NULL, NULL, NULL, '10193_2014', '', 0, 0, 0, 1, 0, 1506639334, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01d2OM9yjFXRgFclySVMVis', 10193, 1),
(10406, 'wx_15066393538710', NULL, NULL, NULL, '10271_5588', '', 0, 0, 0, 1, 0, 1506639353, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_451zOWjayAj16Lhwq7Kjo', 10271, 0),
(10407, 'wx_15066394101949', NULL, NULL, NULL, '唐崇阳', '', 0, 0, 0, 1, 0, 1506639410, NULL, 1506639424, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yUacWrYh-CrUvKKeWrR3gQ', 10258, 1),
(10408, 'wx_15066394605898', NULL, NULL, NULL, '吴̆菊̆红̆', '', 0, 0, 0, 1, 0, 1506639460, NULL, 1506639477, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05HhNcFa5K1Yg3DZ5XTnubs', 10271, 1),
(10409, 'wx_1506639465', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/N3zKgaH6SrmCBAHW4R0CTRvZiaicY8MnaXSosuYgfrPibEJ6Lm0MqSyGqIyGva6vvq4GRnfaCTgIib4NQAP0Wep4Rg/0', NULL, '时光如梭', '', 0, 0, 0, 1, 0, 1506639465, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05c5Lf-0g0E-RygOaz0_m-w', NULL, 1),
(10410, 'wx_1506639590', NULL, NULL, NULL, '陈楚良', '', 0, 0, 0, 1, 0, 1506639590, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02B4GFUlfMCIA_P3wmXIWu8', NULL, 1),
(10411, 'wx_15066397019153', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL3Kah2s4jfNIcPUokltK8ekLlIj7RlMesFXBxu8jibEFiaDmpDogiaCqz2DyNE3vyZVpFJaIVNSg3OA/0', NULL, '炬子哥', '张炬', 0, 0, 0, 1, 0, 1506639701, NULL, 1506725277, NULL, 0, 0, NULL, '13873182951', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00aWXjTKi-QQJwVKCNsvVy0', 10271, 1),
(10412, 'wx_15066397289623', NULL, NULL, NULL, '友利*(^з^)', '', 0, 0, 0, 1, 0, 1506639728, NULL, 1506639763, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zlzonN8H0nzbFM5s7LtHMI', 10193, 1),
(10413, 'wx_15066399863278', NULL, NULL, NULL, '波波⁷', '', 0, 0, 0, 1, 0, 1506639986, NULL, 1506640027, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xPn2sndE7HyRZwLNrXoxrs', 10193, 1),
(10414, 'wx_15066403127632', NULL, NULL, NULL, 'silvia', '', 0, 0, 0, 1, 0, 1506640312, NULL, 1506640329, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-ThBYQHVbBRwHORFOmzOAw', 10341, 1),
(10415, 'wx_15066404375589', NULL, NULL, NULL, '10131_7014', '', 0, 0, 0, 1, 0, 1506640437, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB086AxJedwJFuXPqwygi3RRk', 10131, 1),
(10416, 'wx_15066404571975', NULL, NULL, NULL, '10193_2306', '', 0, 0, 0, 1, 0, 1506640457, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09vrFHYuWZdL41GraOS7v9k', 10193, 0),
(10417, 'wx_15066404844647', NULL, NULL, NULL, '10095_5749', '', 0, 0, 0, 1, 0, 1506640484, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03FR-aTa5u005y5NrkIzexY', 10095, 1),
(10418, 'wx_15066406693439', NULL, NULL, NULL, '10308_7018', '', 0, 0, 0, 1, 0, 1506640669, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_pp0LHCs118RIbaohz7Qx0', 10308, 0),
(10419, 'wx_15066409179539', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Sndcm0A0Qv0rKfprDQmpJv83ykayq3FXolEJLibspJhPoFlNCvM1aEG2AN5BgjJyyQTUicL5ZsLMiak37Fh4YKLEA/0', NULL, '戴惠强', '', 0, 0, 0, 1, 0, 1506640917, NULL, 1506812400, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_znGmTePNiopyXv6N8o8Lo', 10193, 1),
(10420, 'wx_15066410523987', NULL, NULL, NULL, '刘江亚', '', 0, 0, 0, 1, 0, 1506641052, NULL, 1506641102, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_2Q-_q-S9tILmIcjjzPWsw', 10084, 1),
(10421, 'wx_15066410637776', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/QPTHiavzK1GMIVLsQbd0wWXIj46Vav2ESXSecU01qMibwMRLwYH8VAflTwuicHcbK19gleMicaPqCiaCosf3aorL60w/0', NULL, '甜甜', '', 0, 0, 0, 1, 0, 1506641063, NULL, 1506909679, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00zV1nw6rblzGhSyh_r8kf0', 10193, 0),
(10422, 'wx_15066412086794', NULL, NULL, NULL, '10401_8311', '', 0, 0, 0, 1, 0, 1506641208, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05KLso4aDMWHR7R4uD28N1U', 10401, 1),
(10423, 'wx_15066412765485', NULL, NULL, NULL, '10271_9655', '', 0, 0, 0, 1, 0, 1506641276, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0z3qo8TThp5V1AcSuzadLrg', 10271, 1),
(10424, 'wx_15066413552494', NULL, NULL, NULL, '10308_7225', '', 0, 0, 0, 1, 0, 1506641355, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0y3EPDnkk2OamQAmKpm54NI', 10308, 1),
(10425, 'wx_15066413924901', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/XC1ftFDmkXItfHqTe1GmJqUbVGz5Ds8UeZG23eUTP7jodicibCtwlib6K39cmECwzKMaLRWzfFFUIl8tjncXBWqeg/0', NULL, '幽玥', '盛霞', 0, 0, 0, 1, 0, 1506641392, NULL, 1507338387, NULL, 0, 0, NULL, '13739088400', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0ySXdZdSLV5cyyOHl1QZ1wE', 10271, 1),
(10426, 'wx_15066414794062', NULL, NULL, NULL, '罗少', '', 0, 0, 0, 1, 0, 1506641479, NULL, 1506641497, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xdvmN7Y3MQcoT4Ya01rVsc', 10193, 1),
(10427, 'wx_15066416208684', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/f0OjYtHBB71QzdDuiasYnkia9utian8xRUgqiaRqtd1D58VQtw4etamjJw74B2qowHeh2EzP8ylclcX7R7xPdDxibvQ/0', NULL, '彭宇琳', '彭宇玲', 0, 0, 0, 1, 0, 1506641620, NULL, 1506998406, NULL, 0, 0, NULL, '13787009067', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07EY8QF_fvGVYldqWKbrLow', 10084, 1),
(10428, 'wx_15066417534896', NULL, NULL, NULL, '10308_4231', '', 0, 0, 0, 1, 0, 1506641753, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08by930Sgilon3Qn7oCvcC0', 10308, 1),
(10429, 'wx_15066419434254', NULL, NULL, NULL, '芳姐', '', 0, 0, 0, 1, 0, 1506641943, NULL, 1506642049, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xkoGDN56EcgvUk721iKvnI', 10137, 1),
(10430, 'wx_15066419629457', NULL, NULL, NULL, '廖希', '', 0, 0, 0, 1, 0, 1506641962, NULL, 1506642071, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00JQ9J7B7eRdvFySO-iEumI', 10193, 1),
(10431, 'wx_15066422621095', NULL, NULL, NULL, 'Ly', '', 0, 0, 0, 1, 0, 1506642262, NULL, 1506644218, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07UPpwJZ-52dJWvqvvs1Kig', 10257, 0),
(10432, 'wx_15066423514653', NULL, NULL, NULL, '10271_3121', '', 0, 0, 0, 1, 0, 1506642351, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02LtY77Jw5WFq2_6YpCIcNY', 10271, 1),
(10433, 'wx_15066425692830', NULL, NULL, NULL, '10308_2263', '', 0, 0, 0, 1, 0, 1506642569, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-wXpJ72CMYnLNZF_Cb-w5c', 10308, 1),
(10434, 'wx_15066426653947', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/p2B0PZp5vVXy35loKVCS3MSACicU2erQ0iaff1eS7UAe9hKE5wW3IicrvGjkJJIw1YWUyicaXgcn5IFJBlwEr1C99Q/0', NULL, '交通银行谭芳', '', 0, 0, 0, 1, 0, 1506642665, NULL, 1506848089, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03DLPGc1TDFWC5OVaVpfyss', 10308, 1),
(10435, 'wx_15066426661500', NULL, NULL, NULL, '10308_5192', '', 0, 0, 0, 1, 0, 1506642666, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01QpwEFVA_cP9ZHc-Sk070A', 10308, 1),
(10436, 'wx_15066427078007', NULL, NULL, NULL, '10308_8667', '', 0, 0, 0, 1, 0, 1506642707, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03IbugaQBcdHJ9_kzBhOtiE', 10308, 1),
(10437, 'wx_15066427575250', NULL, NULL, NULL, '10193_6061', '', 0, 0, 0, 1, 0, 1506642757, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08JZByP2nvu-sQ_MrqJbltk', 10193, 1),
(10438, 'wx_15066428718896', NULL, NULL, NULL, '10193_9327', '', 0, 0, 0, 1, 0, 1506642871, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01tPZkNEOx2BKiKfMwthsIQ', 10193, 1),
(10439, 'wx_15066429516218', NULL, NULL, NULL, '皇派门窗，陈艳。', '', 0, 0, 0, 1, 0, 1506642951, NULL, 1506643035, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08DE8hLJ9bqR_Rlb6UhTiKg', 10193, 1),
(10440, 'wx_15066431409788', NULL, NULL, NULL, '10193_6581', '', 0, 0, 0, 1, 0, 1506643140, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00ViYH7-R4ktDz_WzGQIBew', 10193, 1),
(10441, 'wx_15066431438974', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKKebPHkVmoxg0LWCwRYRkc2Phd3IeHTb2Kz338AzpkCGjKQHxHfqsad0d5wNMFACEq34bNzJky1Q/0', NULL, '赛', '王赛', 0, 0, 0, 1, 0, 1506643143, NULL, 1506824017, NULL, 0, 0, NULL, '18874852911', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB071JqubjljAnmNIHAL4pGfM', 10308, 1),
(10442, 'wx_15066431523121', NULL, NULL, NULL, '10226_2863', '', 0, 0, 0, 1, 0, 1506643152, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07InK6bpy6Mmp4-_-82OQhg', 10226, 1),
(10443, 'wx_15066432772082', NULL, NULL, NULL, '林善发', '', 0, 0, 0, 1, 0, 1506643277, NULL, 1506643288, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yxeM9ThIf-1wvMz0W_JvMY', 10271, 1),
(10444, 'wx_15066432827574', NULL, NULL, NULL, '怕辣怕辣，周硕', '', 0, 0, 0, 1, 0, 1506643282, NULL, 1506643289, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB018qXIS04MkYohrD3S0W_e4', 10308, 1),
(10445, 'wx_1506643364', NULL, NULL, NULL, '质慧', '', 0, 0, 0, 1, 0, 1506643364, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wnY2NFWBhVBWGeSzADX1xc', NULL, 0),
(10446, 'wx_15066434654061', NULL, NULL, NULL, '10137_2047', '', 0, 0, 0, 1, 0, 1506643465, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06AXR3lQ76kIJZdr3QGdwCo', 10137, 1),
(10447, 'wx_15066437782241', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/qJdGU91ibBcvWkZmXgMxwE5WPKW0Xnxia9f1Eicu7wID6fRMD1oUQf5kYHOshdoNDdacJFbVUtf9xDaFXQibvMns0g/0', NULL, '苏公子', '苏行', 0, 0, 0, 1, 0, 1506643778, NULL, 1506998381, NULL, 0, 0, NULL, '18970096086', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00Tjine-oeH31YVCUIbZMWQ', 10427, 1),
(10448, 'wx_1506643828', NULL, NULL, NULL, '余翼', '', 0, 0, 0, 1, 0, 1506643828, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09P6ni2F1kI4NZ2PpHrsdhw', NULL, 1),
(10449, 'wx_1506643984', NULL, NULL, NULL, '风儿', '', 0, 0, 0, 1, 0, 1506643984, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04Ik6o2fl88PXDvAQwsB3z0', NULL, 1),
(10450, 'wx_15066440457013', NULL, NULL, NULL, '友尚娱乐城', '', 0, 0, 0, 1, 0, 1506644045, NULL, 1506644090, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wQwNCqkDFzhHK2Q0IcoO1E', 10094, 1),
(10451, 'wx_15066440548584', NULL, NULL, NULL, '10343_8998', '', 0, 0, 0, 1, 0, 1506644054, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0--NYVbo7tO4aT7CkLl4Npk', 10343, 1),
(10452, 'wx_15066441129792', NULL, NULL, NULL, '木小易', '', 0, 0, 0, 1, 0, 1506644112, NULL, 1506644120, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03qY9eWaGAy-VqVEozYozg0', 10308, 1),
(10453, 'wx_15066445799040', NULL, NULL, NULL, '彭擦擦', '', 0, 0, 0, 1, 0, 1506644579, NULL, 1506644831, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02nFZ5XDUlnAyL0CM4PmOwI', 10427, 1),
(10454, 'wx_15066447084114', NULL, NULL, NULL, '小辣子（蕊妈）', '', 0, 0, 0, 1, 0, 1506644708, NULL, 1506644741, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04XhhuyKhuFwrF4LGRJknU8', 10341, 1),
(10455, 'wx_15066448444280', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/nzEWxyQpKrDnfkXurndGpZ2ptU3T8r3lKBktjbvLFKuWIhLeicdJhZLDmcBO17AB6vNPyIWHCQxupN69ibLQ2xDA/0', NULL, '长沙小鹰会  王琛', '王琛', 0, 0, 0, 1, 0, 1506644844, NULL, 1506953387, NULL, 0, 0, NULL, '17775851846', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-ZF1neooVqGwnNdsR3-h-U', 10308, 1),
(10456, 'wx_15066448545412', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/5VWee2ibF8IhBiakR0XL1OibXYJfhCplAUaHEXQ7XR3g5eD5365npX1BDcSTksZTFHCCPkQ3h986Orqh4QAvuibMLg/0', NULL, '彭术林', '彭术林', 0, 0, 0, 1, 0, 1506644854, NULL, 1506772151, NULL, 0, 0, NULL, '13517484982', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zPu3dLMc5VCaCtVB78UBEg', 10427, 1),
(10457, 'wx_15066448881519', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epE7T0VLXVcictibuL3JKxLXhKGq23cEpicXcmvlxNP3gJrjib4iciazkjmlYk4nbLcv3GG3aWpcaqYgoHA/0', NULL, '卡拉扬箱包扬海', '', 0, 0, 0, 1, 0, 1506644888, NULL, 1506678846, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07z56iYZAkLJJE-YAcuhaAs', 10308, 1),
(10458, 'wx_15066449028428', NULL, NULL, NULL, '10193_6772', '', 0, 0, 0, 1, 0, 1506644902, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08as7uQYZLLaWk7mxTaQRlQ', 10193, 0),
(10459, 'wx_1506645005', NULL, NULL, NULL, '自由飞翔', '', 0, 0, 0, 1, 0, 1506645005, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04VUQW0lOkOmQIpRp90dzVs', NULL, 0),
(10460, 'wx_15066450961037', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/to2r1q3l77jiahK30pwxD3e672xicm1M40ia6bt60Gib7zqNZezDVgWMGFibpKm4C6TIz4wvn2kiaZ8cOakibYufgUHRw/0', NULL, '[太阳][玫瑰]@李伏元  工商财税', '李伏元', 0, 0, 0, 1, 0, 1506645096, NULL, 1507261341, NULL, 0, 0, NULL, '15367886357', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-MHdxRCiKtEgqFBlnBpIoQ', 10308, 1),
(10461, 'wx_15066451332979', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqN54SZrKibS0K1xXgQiat3icnj53dIrx1ONFKMAbQqsm6DINyp5TrqfHcJ3fibaquFIN5kAaibMTM7Z7A/0', NULL, '', '袁亚琼', 0, 0, 0, 1, 0, 1506645133, NULL, 1506845435, NULL, 0, 0, NULL, '18975837220', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_YjjJbsOqSvgHKK67pRnb0', 10271, 1),
(10462, 'wx_15066452249459', NULL, NULL, NULL, '勿忘我', '', 0, 0, 0, 1, 0, 1506645224, NULL, 1506645246, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zw9TStTxISUzgkmLYz7VTQ', 10137, 1),
(10463, 'wx_1506645360', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/lLRbXfG8Hatj6xxib1Y7Xic1ibgDNBZgZKqsAII9auTQYGibZiakM0LiatJTuUAO6qIov5flzKwekuohRlPzW8pPNQbQ/0', NULL, '张小妹容颜健康管理       陈玲', '陈玲', 0, 0, 0, 1, 0, 1506645360, NULL, 1506742761, NULL, 0, 0, NULL, '13755063826', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_CpidvtuuelywT3uf0EtEw', NULL, 1),
(10464, 'wx_15066453878690', NULL, NULL, NULL, '10447_6011', '', 0, 0, 0, 1, 0, 1506645387, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB078ucfmPSValVacpAeMurG4', 10447, 1),
(10465, 'wx_15066454184593', NULL, NULL, NULL, '贺致用', '', 0, 0, 0, 1, 0, 1506645418, NULL, 1506645487, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-8m79n0zGkvMcIZd-qm4YE', 10193, 1),
(10466, 'wx_15066454477887', NULL, NULL, NULL, '10193_1063', '', 0, 0, 0, 1, 0, 1506645447, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zUPokTQmUsSkKsh3z5W4dw', 10193, 1),
(10467, 'wx_15066454585794', NULL, NULL, NULL, '10308_1803', '', 0, 0, 0, 1, 0, 1506645458, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05TAi1QzOj-iCgkS1v0tGCA', 10308, 1),
(10468, 'wx_15066454947553', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKsAGtYyN8IVuH4zOIib4xcuOucKqWWiaspQFtAjFVacdmk0FsBicMdWL0APnWs4PzaxjTNOMKnSQAXg/0', NULL, '王丽', '王丽萍', 0, 0, 0, 1, 0, 1506645494, NULL, 1506792280, NULL, 0, 0, NULL, '13574170469', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05BFIIWM4RcQUTKLR58NPfk', 10461, 1),
(10469, 'wx_15066455646213', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJJJH68vVosK8NU3mBJd6D43tUkib3oVI9xXvvJicu5D0vMyuIHZibnr0KPuLy73zLuicVwEib6McmYZ2w/0', NULL, '曹慧', '', 0, 0, 0, 1, 0, 1506645564, NULL, 1506744935, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09hvMa7QRc04cU53CIN44Oo', 10137, 1),
(10470, 'wx_15066455683204', NULL, NULL, NULL, '10455_9078', '', 0, 0, 0, 1, 0, 1506645568, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07gRtW8dKmyMunHB_1PEmT8', 10455, 1),
(10471, 'wx_15066455802917', NULL, NULL, NULL, 'Cindy', '', 0, 0, 0, 1, 0, 1506645580, NULL, 1506646360, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-9HOzejU4HEhXPG6XNFef8', 10455, 1),
(10472, 'wx_15066457858111', NULL, NULL, NULL, '何伟', '', 0, 0, 0, 1, 0, 1506645785, NULL, 1506645805, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02-kCZ_xcsJ3HDeb8yQZBnc', 10193, 1),
(10473, 'wx_15066457902488', NULL, NULL, NULL, '丹', '', 0, 0, 0, 1, 0, 1506645790, NULL, 1506645843, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00UlFv8MG3JDTKbUMyHSiqQ', 10468, 1),
(10474, 'wx_15066457974059', NULL, NULL, NULL, '10471_8814', '', 0, 0, 0, 1, 0, 1506645797, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03w8Zdrhairy76j0WpeDe_M', 10471, 1),
(10475, 'wx_1506645804', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ4k7O1B9ibJCt9quJcNM9hgicnolEQGjjR8FzkylfyFGyric6IPn8dlAib6ca2TTGoRXzz9OjksAeFYw/0', NULL, 'Bruce Sun', '', 0, 0, 0, 1, 0, 1506645804, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01NYQMekfyLL0bXef_V0OMI', NULL, 1),
(10476, 'wx_15066459321127', NULL, NULL, NULL, '10137_8847', '', 0, 0, 0, 1, 0, 1506645932, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06qZ-dTSeXgp0uMS1G6ZLzU', 10137, 1),
(10477, 'wx_15066459404932', NULL, NULL, NULL, '10193_5957', '', 0, 0, 0, 1, 0, 1506645940, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xsIDno8yKzzo86uHdY406M', 10193, 1),
(10478, 'wx_1506645950', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJZKgXCpjYqaz0N04hFQSCiaPxO2YyIhP00icGfGOjycV0VibBQGbmwicbpETxafutHEeTx4aIsUvEJaw/0', NULL, '王睿敏', '', 0, 0, 0, 1, 0, 1506645950, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB052KFD92k1ROKxcqj46ixns', NULL, 1),
(10479, 'wx_15066460179818', NULL, NULL, NULL, '浑浊っ', '', 0, 0, 0, 1, 0, 1506646017, NULL, 1506646028, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_o5kACUGeOLDlDDXeHTnMU', 10341, 1),
(10480, 'wx_15066460493012', NULL, NULL, NULL, '', '', 0, 0, 0, 1, 0, 1506646049, NULL, 1506646064, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xJOXd9mTy-LahDw_ik95Kk', 10193, 1),
(10481, 'wx_15066460629978', NULL, NULL, NULL, '昌li', '', 0, 0, 0, 1, 0, 1506646062, NULL, 1506646070, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01J_NY16GIhHhDwHifylRdw', 10084, 1),
(10482, 'wx_1506646148', NULL, NULL, NULL, '九春李太平', '', 0, 0, 0, 1, 0, 1506646148, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08RgPlGC18pWZ1fRJGdRdFk', NULL, 1),
(10483, 'wx_15066461702046', NULL, NULL, NULL, '10471_4998', '', 0, 0, 0, 1, 0, 1506646170, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB061EEy2yhEI1zJd1hgws3-k', 10471, 1),
(10484, 'wx_15066462871334', NULL, NULL, NULL, '10471_6052', '', 0, 0, 0, 1, 0, 1506646287, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xFI4_1t7hCXExR448upGZE', 10471, 1),
(10485, 'wx_15066463168029', NULL, NULL, NULL, '水颜舫', '', 0, 0, 0, 1, 0, 1506646316, NULL, 1506646325, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yS5psCj-zhqf68qkCZgwwU', 10193, 1),
(10486, 'wx_15066464905370', NULL, NULL, NULL, 'cc', '', 0, 0, 0, 1, 0, 1506646490, NULL, 1506646508, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_8KkX_4Z_WS3nC-jW9WwWw', 10193, 1),
(10487, 'wx_1506646511', NULL, NULL, NULL, '苗苗', '赵佳兴', 0, 0, 0, 1, 0, 1506646511, NULL, NULL, NULL, 0, 0, NULL, '15873903388', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06VM3jYImGJYly64Q8qs_Kg', NULL, 1),
(10488, 'wx_15066466466594', NULL, NULL, NULL, 'A陆雷', '', 0, 0, 0, 1, 0, 1506646646, NULL, 1506646662, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xjATwKMFEQlJJCwcaVedW8', 10308, 1),
(10489, 'wx_15066466835280', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJZicRP0FZ78kYt0QRQxwxqVOkOUmZeeOqjG6yOczev7QUs8JgI2icng0adV2wy3Z3XRaT1oON22rsQ/0', NULL, '贺玲', '', 0, 0, 0, 1, 0, 1506646683, NULL, 1506729879, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04CZnJzmg8eDh9A5u6AAYtQ', 10455, 1),
(10490, 'wx_15066467092882', NULL, NULL, NULL, '10447_8992', '', 0, 0, 0, 1, 0, 1506646709, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wMyp7NF1qNyMJCZmungj18', 10447, 0),
(10491, 'wx_15066467383660', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/wpMrYfXQAg5FrCIyuOibXDRPTgyKyUjrHICJlOQSN9a3BzUoglZb6y6eEIicEuMdVlv5NFC3CLZZBiaXrV5od2vMQ/0', NULL, 'Tina', '', 0, 0, 0, 1, 0, 1506646738, NULL, 1507186131, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01V8mmuDyqUxI3vKGKhcZq4', 10193, 1),
(10492, 'wx_1506646811', NULL, NULL, NULL, '雁冰', '', 0, 0, 0, 1, 0, 1506646811, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB010mRNBCEyG6vQu71w6s6SQ', NULL, 1),
(10493, 'wx_15066468671748', NULL, NULL, NULL, '', '', 0, 0, 0, 1, 0, 1506646867, NULL, 1506646875, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00Upvj4vkr0ZNvshKqM0UMc', 10341, 1),
(10494, 'wx_15066468913366', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJDZyib556fyCJ3BkKYrgNibXmmTBo6lh2uxYq9ZuDXw17JHXfGBzNcgQ34icQqqib2XQ81159icwToh9w/0', NULL, '', '', 0, 0, 0, 1, 0, 1506646891, NULL, 1506699433, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03GaoCEmttIbSdwnGL0vN3Q', 10193, 1),
(10495, 'wx_1506646913', NULL, NULL, NULL, '继淼', '', 0, 0, 0, 1, 0, 1506646913, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB012KfiU642fxZKdvte9hyJA', NULL, 0),
(10496, 'wx_15066469434090', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKP0UyrA0egLpLibgvwWjibFYdfKWmdpvgiaTZodeJl7aQdOSJrjaTJmNVrWwJplicxVicNoyFVWia2XAkQ/0', NULL, '刘燕', '刘燕', 0, 0, 0, 1, 0, 1506646943, NULL, 1506819662, NULL, 0, 0, NULL, '13973252154', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02fD0c_jbgPh7jXvjRiAviw', 10461, 1),
(10497, 'wx_15066469511462', NULL, NULL, NULL, '10427_4173', '', 0, 0, 0, 1, 0, 1506646951, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03IqbFLzHvsuZzId7TKFY9g', 10427, 1),
(10498, 'wx_15066471276156', NULL, NULL, NULL, '10471_7190', '', 0, 0, 0, 1, 0, 1506647127, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04CXZS7zCy969JWVe9UKIa4', 10471, 1),
(10499, 'wx_1506647169', NULL, NULL, NULL, '梦回美好', '', 0, 0, 0, 1, 0, 1506647169, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zZoEnvyF7n8pqW_RuiqTVM', 10460, 1),
(10500, 'wx_15066472605216', NULL, NULL, NULL, '10447_2151', '', 0, 0, 0, 1, 0, 1506647260, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02WfFivU1z2qkxKkAYNPKiw', 10447, 1),
(10501, 'wx_1506647305', NULL, NULL, NULL, '王乐韬妈妈', '', 0, 0, 0, 1, 0, 1506647305, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-jaxKG-TOVZQXc4pVrrOfI', 10493, 0),
(10502, 'wx_15066473449175', NULL, NULL, NULL, '程波', '', 0, 0, 0, 1, 0, 1506647344, NULL, 1506647667, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01n0OjZHCcd8W2dRRKeXhAE', 10460, 1),
(10503, 'wx_15066473608835', NULL, NULL, NULL, '糖糖', '', 0, 0, 0, 1, 0, 1506647360, NULL, 1506647386, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_ivxLhDxx3QZ_pRbqK-Z9Q', 10089, 1),
(10504, 'wx_1506647451', NULL, NULL, NULL, '随心而至', '', 0, 0, 0, 1, 0, 1506647451, NULL, 1506668493, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB004KGhDaMh4RCwlq3zXsbh4', 10212, 1),
(10505, 'wx_15066474588831', NULL, NULL, NULL, '张琼', '', 0, 0, 0, 1, 0, 1506647458, NULL, 1506647555, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06sg-2yDEwKYdsQQ9vNh5hs', 10278, 1),
(10506, 'wx_1506647466', NULL, NULL, NULL, 'A特立西路店＋原瓶进口红酒', '', 0, 0, 0, 1, 0, 1506647466, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07ap4jUXbRXDKQZso9Q47zc', 10460, 0),
(10507, 'wx_15066475074836', NULL, NULL, NULL, '梅子', '', 0, 0, 0, 1, 0, 1506647507, NULL, 1506647512, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03qvE3aXSexCS02Jm-Ut29g', 10447, 1);
INSERT INTO `bao_users` (`user_id`, `account`, `password`, `face`, `ext0`, `nickname`, `truename`, `integral`, `prestige`, `money`, `rank_id`, `gold`, `reg_time`, `reg_ip`, `last_time`, `last_ip`, `closed`, `uc_id`, `email`, `mobile`, `ping_num`, `post_num`, `invite1`, `invite2`, `invite3`, `invite4`, `invite5`, `invite6`, `token`, `p_openid`, `pid`, `is_subscribe`) VALUES
(10508, 'wx_1506647513', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKyFmnicTmB6BhDQRW2iczVVbnj2v3nbdexYMYfqibvnHhChA57KicOJ0GySAQCYicLVsDlhEM8UzJaHFw/0', NULL, '凡凡子', '', 0, 0, 0, 1, 0, 1506647513, NULL, 1506823818, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zUjLTAe7-OyNBc6HQJrmnE', 10212, 1),
(10509, 'wx_15066475263929', NULL, NULL, NULL, '10193_2760', '', 0, 0, 0, 1, 0, 1506647526, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-47MoFx-EEFduvgIkSLniI', 10193, 1),
(10510, 'wx_15066475359845', NULL, NULL, NULL, '大学生眼镜店     18639419815', '', 0, 0, 0, 1, 0, 1506647535, NULL, 1506647574, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05qnaHVatmt9t33hI1ivuAk', 10427, 1),
(10511, 'wx_15066475616086', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/aDo5kuQL9yjCPzFSjeKYibvBBFZAec2ZhQr7NicAwZYbMpYAxk3G1vYSNjiak6Tpb8y8MLMy7Vd6FAJB2Xpia2jkrg/0', NULL, '米艳', '', 0, 0, 0, 1, 0, 1506647561, NULL, 1507251608, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0316JuOr50YsoaOMzmwEe7k', 10193, 1),
(10512, 'wx_15066475906866', NULL, NULL, NULL, '10278_1833', '', 0, 0, 0, 1, 0, 1506647590, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00FQMru2Z9HBIPHDK_MOG3k', 10278, 1),
(10513, 'wx_15066476318812', NULL, NULL, NULL, '夏天墙绘', '', 0, 0, 0, 1, 0, 1506647631, NULL, 1506648309, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0x_G_n_skP2ZTaKJuibLUmk', 10460, 1),
(10514, 'wx_15066477176673', NULL, NULL, NULL, '萤火虫', '', 0, 0, 0, 1, 0, 1506647717, NULL, 1506647734, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04ddTKAed3bOvDY3NIDz4jM', 10193, 0),
(10515, 'wx_15066477538045', NULL, NULL, NULL, '10460_8201', '', 0, 0, 0, 1, 0, 1506647753, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08oeyI8knNjA8xWtni9hGvI', 10460, 1),
(10516, 'wx_15066477674764', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ0LP3VXv0uYnWn0g5At2RPSr6vnU8Ne3OgsfFp91ibH66Luopky3rZdGsJ7PXA6tgagkibd0fibQ0Pw/0', NULL, '杜俊杰', '杜俊杰', 0, 0, 0, 1, 0, 1506647767, NULL, 1506821597, NULL, 0, 0, NULL, '15874189813', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08E6frl1BWex1hGVyg7ZKoY', 10308, 1),
(10517, 'wx_15066477924988', NULL, NULL, NULL, '李芳', '李芳', 0, 0, 0, 1, 0, 1506647792, NULL, 1506647798, NULL, 0, 0, NULL, '15116119525', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0z6abqg_uh5beh38YCywyUQ', 10341, 1),
(10518, 'wx_1506647874', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/HLDjKFe3k6HMGs377ywVpZvFI1B0E6agrJ5wxULVzNn3phoBiaCbOugy4eVSIJ7iauVI1nibJbibu9GGTKIpjdNexg/0', NULL, '向阳', '向阳', 0, 0, 0, 1, 0, 1506647874, NULL, 1507167634, NULL, 0, 0, NULL, '13511168855', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09S3L7hdJgrqvqiyYt1j4fU', 10113, 1),
(10519, 'wx_15066479654796', NULL, NULL, NULL, '阿力', '力力', 0, 0, 0, 1, 0, 1506647965, NULL, 1506647970, NULL, 0, 0, NULL, '13974960876', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_pE0wXrArtZ6vsWZS6yUHc', 10455, 1),
(10520, 'wx_15066479728434', NULL, NULL, NULL, '10447_8016', '', 0, 0, 0, 1, 0, 1506647972, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wuItiuVomJ8Pc8TpqBA10s', 10447, 0),
(10521, 'wx_1506648029', NULL, NULL, NULL, '九爷', '', 0, 0, 0, 1, 0, 1506648029, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-757a_p_H9KAIgtBDUDWFU', NULL, 0),
(10522, 'wx_15066480594083', NULL, NULL, NULL, 'mumu', '', 0, 0, 0, 1, 0, 1506648059, NULL, 1506648105, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05Q-r7bl4ONwygFdClAPi08', 10496, 1),
(10523, 'wx_15066481778552', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL1D4gALoUfmQSWhzibllQaGJOtGcicQ0ciau8UYS92XvMHibeiaM5ZukJDgkvQZSXkGtCRTrncJUzKaWw/0', NULL, '周庆兵', '周庆兵', 0, 0, 0, 1, 0, 1506648177, NULL, 1506698723, NULL, 0, 0, NULL, '13432706887', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00lIf4X_889pFT-Fb4nwACw', 10425, 1),
(10524, 'wx_1506648197', NULL, NULL, NULL, '刘威良', '', 0, 0, 0, 1, 0, 1506648197, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB017ZLvsEb9KRcMk5dWBXrRA', 10463, 0),
(10525, 'wx_15066482463386', NULL, NULL, NULL, '10447_1151', '', 0, 0, 0, 1, 0, 1506648246, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zH8amYpb62a5YUP-iBRmf8', 10447, 0),
(10526, 'wx_15066483715357', NULL, NULL, NULL, '10271_9917', '', 0, 0, 0, 1, 0, 1506648371, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04GXlsVu3I0CMgipIAU5ZhE', 10271, 1),
(10527, 'wx_1506648414', NULL, NULL, NULL, '贺敏', '', 0, 0, 0, 1, 0, 1506648414, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03_auJdJnU5Cb3UnwunrDnY', 10513, 0),
(10528, 'wx_15066484577265', NULL, NULL, NULL, '芯宝贝', '', 0, 0, 0, 1, 0, 1506648457, NULL, 1506648586, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02CpXrJQA5xTJajdZGV7SOg', 10447, 1),
(10529, 'wx_1506648533', NULL, NULL, NULL, '红薯', '', 0, 0, 0, 1, 0, 1506648533, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03-FvZE2Xn2V26GVbGHnJHc', 10513, 0),
(10530, 'wx_15066485733850', NULL, NULL, NULL, 'Candy琦', '', 0, 0, 0, 1, 0, 1506648573, NULL, 1506648587, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-n0mqZVH0UPv2rgi6T6E3E', 10137, 1),
(10531, 'wx_15066485776425', NULL, NULL, NULL, '妞妈', '', 0, 0, 0, 1, 0, 1506648577, NULL, 1506648593, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05kH0TOCEtuKZXR7CWKWQXY', 10455, 1),
(10532, 'wx_15066485938308', NULL, NULL, NULL, '10425_1017', '', 0, 0, 0, 1, 0, 1506648593, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07KNZP4AJ3HQ7Hf_DgXuFuQ', 10425, 1),
(10533, 'wx_1506648600', NULL, NULL, NULL, '天天', '', 0, 0, 0, 1, 0, 1506648600, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xB6vsd1oCxT4Tywd3VAnNc', 10513, 0),
(10534, 'wx_15066486605127', NULL, NULL, NULL, '10193_7126', '', 0, 0, 0, 1, 0, 1506648660, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06vtFIBXRAH7Sdjg1ZAdQ6M', 10193, 1),
(10535, 'wx_15066486677088', NULL, NULL, NULL, '10468_4487', '', 0, 0, 0, 1, 0, 1506648667, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05KECV2W4rm4BHemqkNGF0M', 10468, 1),
(10536, 'wx_15066488455197', NULL, NULL, NULL, '10193_7670', '', 0, 0, 0, 1, 0, 1506648845, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09fO2s5j8MZ753HYtMhZo0E', 10193, 1),
(10537, 'wx_15066488557293', NULL, NULL, NULL, '王燕', '', 0, 0, 0, 1, 0, 1506648855, NULL, 1506659217, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00ftp-ECKfwsvbMJv4huu-8', 10447, 0),
(10538, 'wx_15066490687423', NULL, NULL, NULL, '情侠', '', 0, 0, 0, 1, 0, 1506649068, NULL, 1506649100, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01sHNIGIV-hphuocTuJhVhg', 10086, 1),
(10539, 'wx_1506649278', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIBLoDt13VmfGQe8fcsJB8TnzhMN4J6Oj0mKbIvxWmxGT4BCZ2982ogat1FDJvDCibfhZUTxES37Pg/0', NULL, '聪', '汤聪', 0, 0, 0, 1, 0, 1506649278, NULL, 1507250975, NULL, 0, 0, NULL, '13875845238', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-qCyJtY4ErlcX6UCM5JgTA', 10460, 1),
(10540, 'wx_1506649302', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/ACHKPeIa7Y2IVMyZ2VuzAK3wjuibx65uQia55McIwT3NNkMgnKwhaoYumziaqibzJq5UCPWxEErL5kbOm8ohsErXCA/0', NULL, '小强', '', 0, 0, 0, 1, 0, 1506649302, NULL, 1506919201, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04Cx5I-3JPCza-N6W5AQklw', 10518, 0),
(10541, 'wx_15066493778053', NULL, NULL, NULL, '10193_8417', '', 0, 0, 0, 1, 0, 1506649377, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xuo2eO20TJs6k9gXVSUuo8', 10193, 1),
(10542, 'wx_15066496099188', NULL, NULL, NULL, '10258_4793', '', 0, 0, 0, 1, 0, 1506649609, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0762-RH-qGNTQmDDXF0XH6A', 10258, 1),
(10543, 'wx_15066498301710', NULL, NULL, NULL, '微智校园&严秋华', '', 0, 0, 0, 1, 0, 1506649830, NULL, 1506649866, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02vR6ETo3ATJ5WcTRvmGVCM', 10193, 1),
(10544, 'wx_1506649885', NULL, NULL, NULL, '苏新林', '', 0, 0, 0, 1, 0, 1506649885, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yOXN8ShspajcCta5IDPXU8', 10460, 0),
(10545, 'wx_15066499587544', NULL, NULL, NULL, '10226_2952', '', 0, 0, 0, 1, 0, 1506649958, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07lx2dxZ94ZVHaMln2bXHZc', 10226, 1),
(10546, 'wx_15066501511740', NULL, NULL, NULL, '10226_4751', '', 0, 0, 0, 1, 0, 1506650151, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08fSpdAoZjGZnxKcAG958nQ', 10226, 1),
(10547, 'wx_15066501542601', NULL, NULL, NULL, ' Yang （睿）', '', 0, 0, 0, 1, 0, 1506650154, NULL, 1506650414, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08z0D7OPC8mS1HUamnNpVfk', 10193, 1),
(10548, 'wx_15066501952002', NULL, NULL, NULL, 'Tinav', '', 0, 0, 0, 1, 0, 1506650195, NULL, 1506650382, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00MOA8Q_1C0RdD0lx2xCLyE', 10226, 1),
(10549, 'wx_15066506065325', NULL, NULL, NULL, '汤小云', '', 0, 0, 0, 1, 0, 1506650606, NULL, 1506650620, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-fswzpbcWlnnlqLFbne3qc', 10447, 1),
(10550, 'wx_15066506604510', NULL, NULL, NULL, '吴老师@微智校园', '', 0, 0, 0, 1, 0, 1506650660, NULL, 1506650665, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_07S4mdoSDZiRmuNz2Lnq0', 10193, 1),
(10551, 'wx_15066507537437', NULL, NULL, NULL, '丫丫', '', 0, 0, 0, 1, 0, 1506650753, NULL, 1506650773, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-JVmPVJMJMXys8rgbkxXH0', 10226, 1),
(10552, 'wx_1506650970', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLg4Ps1GKzN8OqUT6pH3Sw8VibUyWk4ibKcq4icpQaVtib6tlYAJaIKeltqX4eia9flVhOT611ajM4ibOsA/0', NULL, '唐诗与茶', '', 0, 0, 0, 1, 0, 1506650970, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wHEV9s1xlDLxbwiIKxGovU', NULL, 1),
(10553, 'wx_15066511343812', NULL, NULL, NULL, '10375_7559', '', 0, 0, 0, 1, 0, 1506651134, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05GPzcYnfc0affb6r5qt0Ns', 10375, 1),
(10554, 'wx_1506651402', NULL, NULL, NULL, '雪', '', 0, 0, 0, 1, 0, 1506651402, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01xZsVuC6k_2j1gIHnoOO7U', NULL, 1),
(10555, 'wx_15066514115619', NULL, NULL, NULL, '10193_9222', '', 0, 0, 0, 1, 0, 1506651411, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05Um6Kbf75jz3X1JzIGyRC8', 10193, 1),
(10556, 'wx_15066514273561', NULL, NULL, NULL, '雷雨', '', 0, 0, 0, 1, 0, 1506651427, NULL, 1506652396, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02DWvJb6tWRH992xN_2OYvw', 10496, 1),
(10557, 'wx_15066515069671', NULL, NULL, NULL, '10193_3660', '', 0, 0, 0, 1, 0, 1506651506, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB044PLonMbc80XVkeAGuKBXQ', 10193, 0),
(10558, 'wx_15066515166364', NULL, NULL, NULL, '兜兜', '周煦昂', 0, 0, 0, 1, 0, 1506651516, NULL, 1506651741, NULL, 0, 0, NULL, '18507312808', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03_rhk0lK-Zt-HizDShAvog', 10226, 1),
(10559, 'wx_15066515615313', NULL, NULL, NULL, '10084_6912', '', 0, 0, 0, 1, 0, 1506651561, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_bC6wrsfXj3tE-JewQSKFY', 10084, 1),
(10560, 'wx_15066516277056', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJISJ4tXT8bibB8oBXPtPkDIJCkdZkYP0hN1439fZXPXs5mXROK81AmDrwuBVtPDz0tPI6JBxLGDTA/0', NULL, '莎', '彭莎', 0, 0, 0, 1, 0, 1506651627, NULL, 1507114169, NULL, 0, 0, NULL, '15802587070', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07-IOtB9Hq_NUjQ_NuFa-iY', 10455, 1),
(10561, 'wx_15066516662485', NULL, NULL, NULL, '10425_3881', '', 0, 0, 0, 1, 0, 1506651666, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-oboPQnJU4loJou5zB9nw8', 10425, 1),
(10562, 'wx_1506651703', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eroIMibXTzbhg76X7aSKrFp0d1j9VDXicibmODd22iaNspCIRSskvEFdOdVxkwykNjq5UqwozQvjynCGw/0', NULL, '子玥', '', 0, 0, 0, 1, 0, 1506651703, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01PU3P3ByGonaOQ3NatO1Kg', NULL, 0),
(10563, 'wx_15066517272129', NULL, NULL, NULL, '10560_9746', '', 0, 0, 0, 1, 0, 1506651727, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02Ihc3BjSG9oYWGd18JFLOU', 10560, 1),
(10564, 'wx_1506651775', NULL, NULL, NULL, '焕焕', '', 0, 0, 0, 1, 0, 1506651775, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04MBKCWYvPhf_6CDOyUik2k', NULL, 1),
(10565, 'wx_15066519167232', NULL, NULL, NULL, '10425_3811', '', 0, 0, 0, 1, 0, 1506651916, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03V38iCEyM2SrZmF_dmC15Y', 10425, 1),
(10566, 'wx_15066519272773', NULL, NULL, NULL, '10425_7851', '', 0, 0, 0, 1, 0, 1506651927, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05aetzD54v0KiluvZMiqWJU', 10425, 1),
(10567, 'wx_15066520166893', NULL, NULL, NULL, '埠菁', '', 0, 0, 0, 1, 0, 1506652016, NULL, 1506652041, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zsAe2L0JhLDYO1rCnVlPxs', 10193, 1),
(10568, 'wx_15066520782756', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/RRugFTGanib1MMWibAe8vjiceTpPSP9e6ibvBzI2JUiaARUM5us1asLjUfXElNB2hOwNIdWfoUe5hXicWMIsc30j4lfw/0', NULL, '王凤', '王凤', 0, 0, 0, 1, 0, 1506652078, NULL, 1507004311, NULL, 0, 0, NULL, '13755024494', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-K0GPHlFdwVkIvjSI5RJNU', 10560, 1),
(10569, 'wx_15066522298879', NULL, NULL, NULL, '10193_2759', '', 0, 0, 0, 1, 0, 1506652229, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB010KIEp4JX5T3dRy9YO4nLI', 10193, 1),
(10570, 'wx_15066522304320', NULL, NULL, NULL, '10568_2153', '', 0, 0, 0, 1, 0, 1506652230, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-ocsMovekwJA85kEheVJs0', 10568, 0),
(10571, 'wx_15066522301706', NULL, NULL, NULL, '10568_4817', '', 0, 0, 0, 1, 0, 1506652230, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03r_UmYLznHcD0i9XzchsoQ', 10568, 0),
(10572, 'wx_15066522402961', NULL, NULL, NULL, '10568_6502', '', 0, 0, 0, 1, 0, 1506652240, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yScMEiTQSMM_ggXeLMf5zM', 10568, 1),
(10573, 'wx_15066522415153', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/F1j8c5jQQuNpLUib6rrDaib2f1UAR1281npDib9hiaoHxVfiaOWQYIDlvtDga3suqBlVu033mBvzvw4bsIhWrkWqGxg/0', NULL, '孙艳华', '', 0, 0, 0, 1, 0, 1506652241, NULL, 1506823662, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00ciehmpbeSU4eBic_oYrFc', 10193, 1),
(10574, 'wx_15066522672132', NULL, NULL, NULL, '10568_1904', '', 0, 0, 0, 1, 0, 1506652267, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yw_I3eNPq2hCuw_Gkvbk0A', 10568, 1),
(10575, 'wx_15066524649707', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/gch6rXI1gU4EastytuCOWtYDCB4qNT5yYo2hYVia010Fibr4iczPkf4YmccD3MIxaDudjw7uIJjBmZVEdVdXp7B0g/0', NULL, '黄丹', '', 0, 0, 0, 1, 0, 1506652464, NULL, 1506819684, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02i_mOSgi0R5k1TDK_LYF-8', 10560, 1),
(10576, 'wx_15066525056529', NULL, NULL, NULL, '10425_9368', '', 0, 0, 0, 1, 0, 1506652505, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB005Awn5hu97NyK1ecGR45A4', 10425, 1),
(10577, 'wx_15066525564418', NULL, NULL, NULL, '梁霞', '', 0, 0, 0, 1, 0, 1506652556, NULL, 1506652573, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zlhOBws-WQu4h8Z4DHC_Ns', 10558, 1),
(10578, 'wx_15066526101554', NULL, NULL, NULL, '10193_6390', '', 0, 0, 0, 1, 0, 1506652610, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07u_0lsMQwYsin7Tl_Ot2mQ', 10193, 1),
(10579, 'wx_15066526492964', NULL, NULL, NULL, '10427_5988', '', 0, 0, 0, 1, 0, 1506652649, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zmUysuGbmzH1t-zme2rAl8', 10427, 1),
(10580, 'wx_1506652693', NULL, NULL, NULL, NULL, '', 0, 0, 0, 1, 0, 1506652693, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, 10577, 0),
(10581, 'wx_15066527147981', NULL, NULL, NULL, '贺杰如-电脑数码产品专卖', '', 0, 0, 0, 1, 0, 1506652714, NULL, 1506652805, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00XtbmVRgNRNao37r-N9Vxo', 10193, 1),
(10582, 'wx_15066529361302', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/QUdfVuRhR2S6N7W8eJnz9VEeAd9AZfyQKwY9eB9pBnwxc5MV7WTS5eN21oicjo0BEXL5nDHpzRX2rXiboDmhMDKw/0', NULL, '黄刚', '黄刚', 0, 0, 0, 1, 0, 1506652936, NULL, 1507158849, NULL, 0, 0, NULL, '13574161697', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07Cbw5wbZYystoigaA8nxw8', 10455, 1),
(10583, 'wx_1506652980', NULL, NULL, NULL, '詹', '', 0, 0, 0, 1, 0, 1506652980, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08VHju9tix4fDekOvwuqwmg', 10585, 1),
(10584, 'wx_1506653021', NULL, NULL, NULL, '雨露', '', 0, 0, 0, 1, 0, 1506653021, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zrgH3LCju8-azPILMiLa7I', NULL, 1),
(10585, 'wx_1506653068', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/iaDXltFylKJtPicn2eib37D5En6pr23X8HuXtl0ibwPr5vUwXfoWK1pcEiaHI9uf790w416nhaTh9le9bnQKzvJs2Sw/0', NULL, '陈艳', '陈艳', 0, 0, 0, 1, 0, 1506653068, NULL, NULL, NULL, 0, 0, NULL, '18688920731', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0z5nMyi5C76BP4YpC9suMoI', NULL, 1),
(10586, 'wx_15066531138514', NULL, NULL, NULL, '10560_6594', '', 0, 0, 0, 1, 0, 1506653113, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-YgCPQyzhKF--nxFec37qY', 10560, 1),
(10587, 'wx_1506653150', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/sZjCVIbfsARGUZgUb5VEN5Stbibnibxl6oic5fAgPzLT0z5ohd1iaib42XHRJdfIqLWkCU4PdOj2kfsKjslDzxHcxGQ/0', NULL, '朵依', '陈婷', 0, 0, 0, 1, 0, 1506653150, NULL, 1506775263, NULL, 0, 0, NULL, '13808494308', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00CxV8llDKsY63EFpPisfNE', 10585, 1),
(10588, 'wx_1506653456', NULL, NULL, NULL, 'jason liu', '', 0, 0, 0, 1, 0, 1506653456, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zsAgd-6KfPM1q8d-LEgSIA', 10577, 0),
(10589, 'wx_15066534616428', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/fDN1YPppNmhGEpr3HAcEyXMicvvEjwopMUsDpicRYD9M0dcHWCgnibWmjnP62RoJ2PY2h6xrWJ6dzqdDchKAFQJibg/0', NULL, '三元', '', 0, 0, 0, 1, 0, 1506653461, NULL, 1506859305, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xB_Kj9HdX-aThKIxVxHxZw', 10560, 1),
(10590, 'wx_15066534673726', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIiaeJ7mrpPKdg4RdstoWn6tcNQzVs7QKic4j70M1BxDEBVqZzB8RmRJgnS2YkJ2SNA5cVnLsDvuwAQ/0', NULL, '艳指坊', '盛艳', 0, 0, 0, 1, 0, 1506653467, NULL, 1507338379, NULL, 0, 0, NULL, '15873120510', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0y1mVTfeod72pvrieV-o-BE', 10425, 1),
(10591, 'wx_15066535689545', NULL, NULL, NULL, 'keson', '', 0, 0, 0, 1, 0, 1506653568, NULL, 1506653586, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00d0YPT0kXVxcyMOvAYHuJg', 10140, 1),
(10592, 'wx_15066536934752', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/1jBasvt0wvNOMGf0Sr99S1P9JINyiaTFibEibZs0eTtHr5De72Y0m1pVm1tIhdHAfhm2raMUBloQhwoUHCEO2Fwog/0', NULL, '张娜&玩转乒乓ゅ', '张娜', 0, 0, 0, 1, 0, 1506653693, NULL, 1506904691, NULL, 0, 0, NULL, '13755198917', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03roxcf-RdNN7Tj0N4nkfuA', 10560, 1),
(10593, 'wx_15066539679581', NULL, NULL, NULL, 'Gent', '', 0, 0, 0, 1, 0, 1506653967, NULL, 1506653988, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-a5PLn5mqOusKs9XdgzRwk', 10560, 1),
(10594, 'wx_15066540294515', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoKpPk0yKZK4gPGXfTibbb8AevIYKC9HfBmiaGlhb3M4ZXMiatcjQeGejwtBiaSmLgTNMugFt3QE1VlDA/0', NULL, 'normy', '', 0, 0, 0, 1, 0, 1506654029, NULL, 1506728407, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0783CUeNkQgxVHTY-KLtmBo', 10560, 1),
(10595, 'wx_15066541253539', NULL, NULL, NULL, '唱歌', '', 0, 0, 0, 1, 0, 1506654125, NULL, 1506660262, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zdwPDqA0SLqEJ81U_kuo8Q', 10587, 1),
(10596, 'wx_15066541886612', NULL, NULL, NULL, '海南兰', '', 0, 0, 0, 1, 0, 1506654188, NULL, 1506662690, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08DpxtPJDNz5it3XxNbWfY4', 10237, 1),
(10597, 'wx_1506654271', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTISoEDZfNS1qNvgzTr7J4mm1TzLvPMODAaF3Ig1rKHTR830uhHPB63LOF7ic3eic4deBRXYibbx8ldpQ/0', NULL, '小雅', '占雅', 0, 0, 0, 1, 0, 1506654271, NULL, 1506776120, NULL, 0, 0, NULL, '15907480383', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04Mc5N7ZiVRBtc5at0eeiEc', 10585, 1),
(10598, 'wx_15066542792611', NULL, NULL, NULL, 'A玉珊', '', 0, 0, 0, 1, 0, 1506654279, NULL, 1506654302, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zCpa2cCp_bBnaGIMIWbDZs', 10560, 1),
(10599, 'wx_15066543249073', NULL, NULL, NULL, '张湘建', '', 0, 0, 0, 1, 0, 1506654324, NULL, 1506654334, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08Axa8q4iXCNx14QFkgA2rk', 10560, 0),
(10600, 'wx_15066543253284', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/lfN94XRrv3FCah5f4MjiaXicHTO8HLDPAktWI19VbIgDdPG4TulRm1ZVLWRUhADJXfvuGwJ8bTH0Y9rP2zxAiaREw/0', NULL, '水晶', '王红丽', 0, 0, 0, 1, 0, 1506654325, NULL, 1506830971, NULL, 0, 0, NULL, '13975149990', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05_H27am-ddsO5jERuM2vHM', 10193, 1),
(10601, 'wx_15066543307967', NULL, NULL, NULL, '10560_5256', '', 0, 0, 0, 1, 0, 1506654330, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xnBp48AJwDyLdpV1txIX0c', 10560, 1),
(10602, 'wx_15066543395815', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/8wicwR0fGXkibXIC3H1gib6B5zaOzsp2vFcbDlvmA1DQBP1BczhVNEUSsOEKpbuEhaSsedblBdlBXyr07O1oLqcuA/0', NULL, '若水', '', 0, 0, 0, 1, 0, 1506654339, NULL, 1506824067, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03gJPLT89SenhdJKrcQCNQg', 10582, 1),
(10603, 'wx_15066546594754', NULL, NULL, NULL, '10592_2670', '', 0, 0, 0, 1, 0, 1506654659, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07tmhq_s9XAGs-hxm9ryUJg', 10592, 1),
(10604, 'wx_15066548243317', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKkhNjHTojF2FFxakkib1zSvBhRicWIZXHgibEjRg7ry49bTbam3eyhqMU3cLEbyTjhX6kI2a8wRlxjg/0', NULL, '丁倩', '周子奥', 0, 0, 0, 1, 0, 1506654824, NULL, 1507289067, NULL, 0, 0, NULL, '18316010664', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yhkezD_eX1Ustet-jRga6g', 10523, 1),
(10605, 'wx_15066548803858', NULL, NULL, NULL, '代代', '', 0, 0, 0, 1, 0, 1506654880, NULL, 1506654890, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02yn-oWE1malwZnjKhzI3Fk', 10131, 1),
(10606, 'wx_15066549813004', NULL, NULL, NULL, '10592_8442', '', 0, 0, 0, 1, 0, 1506654981, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04q9H0VX_aU_XsjsD0E-THY', 10592, 0),
(10607, 'wx_15066550271773', NULL, NULL, NULL, '木 每', '', 0, 0, 0, 1, 0, 1506655027, NULL, 1506655043, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08h3-9vkH6Xhmbe7W2A8cys', 10560, 1),
(10608, 'wx_15066552973516', NULL, NULL, NULL, '10585_8407', '', 0, 0, 0, 1, 0, 1506655297, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0z5T-DBb3R5Lyr7h9iVucDA', 10585, 1),
(10609, 'wx_15066553559008', NULL, NULL, NULL, '10587_7684', '', 0, 0, 0, 1, 0, 1506655355, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04p7yVFGCb7mE8HtbWk-ah4', 10587, 1),
(10610, 'wx_15066556204175', NULL, NULL, NULL, '10597_2915', '', 0, 0, 0, 1, 0, 1506655620, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zFAF9zdAba3HNm455B9oGk', 10597, 1),
(10611, 'wx_15066556485464', NULL, NULL, NULL, '金*希康乐*', '', 0, 0, 0, 1, 0, 1506655648, NULL, 1506655737, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01iYwrdTC3KVCoUuvVGx9TM', 10560, 1),
(10612, 'wx_15066556834569', NULL, NULL, NULL, '10597_7536', '', 0, 0, 0, 1, 0, 1506655683, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01jZIfycax3BB1od0KcL0ro', 10597, 0),
(10613, 'wx_15066558036396', NULL, NULL, NULL, '', '', 0, 0, 0, 1, 0, 1506655803, NULL, 1506655819, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02YKuUy7axsUMhx42-xba4w', 10193, 1),
(10614, 'wx_15066558151960', NULL, NULL, NULL, '树林牛', '', 0, 0, 0, 1, 0, 1506655815, NULL, 1506655855, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB029LSL_GLxiwQxyvQNU0CTo', 10597, 1),
(10615, 'wx_15066560334981', NULL, NULL, NULL, '10193_3603', '', 0, 0, 0, 1, 0, 1506656033, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wDdbC6js_uqHQ7NMrTxOec', 10193, 1),
(10616, 'wx_15066560798764', NULL, NULL, NULL, '10597_6406', '', 0, 0, 0, 1, 0, 1506656079, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wdSoWs6gWiqeeRwrOInDnA', 10597, 1),
(10617, 'wx_15066561237623', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Sm2CpybjO8BgksztE9pQMCqZshJvjraE6ticcH9XYzWzSAF4B5gtL62OsdeGUia8d9tuz5ib57Q2mvyictJNjICvWg/0', NULL, '张美林', '张美林', 0, 0, 0, 1, 0, 1506656123, NULL, 1506783525, NULL, 0, 0, NULL, '18684788751', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05grEHbk_sPnUj7iNzYNF_Y', 10308, 1),
(10618, 'wx_1506656147', NULL, NULL, NULL, '一切皆有可能', '', 0, 0, 0, 1, 0, 1506656147, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04tizV3pYF1EN919Wafzl24', 10334, 0),
(10619, 'wx_15066561814663', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/BZROGkDG04icTld9paSrWwmHYGnSsy4Audic2aDXKzUezShGiaM5TkPXP4v8otZaAbBm1BKKEsO1DmquMhVxAvGoA/0', NULL, 'Vivo&oppo手机专卖', '章良', 0, 0, 0, 1, 0, 1506656181, NULL, 1507341792, NULL, 0, 0, NULL, '15386485015', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB077H8_sLilm2ho-6P8cF4Ko', 10587, 1),
(10620, 'wx_15066562471687', NULL, NULL, NULL, '10441_8178', '', 0, 0, 0, 1, 0, 1506656247, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02D8mntHtEtXLU7zIhx4o5o', 10441, 1),
(10621, 'wx_15066562642171', NULL, NULL, NULL, '10193_5871', '', 0, 0, 0, 1, 0, 1506656264, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06S8pG50tPqwc0xlicibecs', 10193, 1),
(10622, 'wx_1506656363', NULL, NULL, NULL, '珊', '', 0, 0, 0, 1, 0, 1506656363, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08EmEIj36m_dhdrn9Siq1dc', 10585, 1),
(10623, 'wx_1506656404', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eof6DV1YtWQ7mzlJhdp0qLJcSSzoLqvhQiaDY4DeIicVmUeceFic9yGj6miblDGiascwr4EpnhfFHTmgicg/0', NULL, '水手', '', 0, 0, 0, 1, 0, 1506656404, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02G9XqAOzqsBRJb5rX6BnBA', NULL, 0),
(10624, 'wx_1506656406', NULL, NULL, NULL, '乔乔斯', '', 0, 0, 0, 1, 0, 1506656406, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0w0KyhwuvW1CrdMi8kpHDdY', NULL, 0),
(10625, 'wx_15066564412664', NULL, NULL, NULL, '10193_9812', '', 0, 0, 0, 1, 0, 1506656441, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06sDKTiZ-j5Kt-_xYOlFjIQ', 10193, 1),
(10626, 'wx_15066564987733', NULL, NULL, NULL, '10592_4912', '', 0, 0, 0, 1, 0, 1506656498, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02H3xc5iXM0-mM1vX_lrVuE', 10592, 1),
(10627, 'wx_15066565755666', NULL, NULL, NULL, '10592_5677', '', 0, 0, 0, 1, 0, 1506656575, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00Av5nDu3VKuKUo19Jr3V38', 10592, 1),
(10628, 'wx_15066565801822', NULL, NULL, NULL, '龙龙婆', '', 0, 0, 0, 1, 0, 1506656580, NULL, 1506657836, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00aq_nXXddndErND_HxnYpw', 10560, 1),
(10629, 'wx_15066566292760', NULL, NULL, NULL, '10441_1765', '', 0, 0, 0, 1, 0, 1506656629, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06pmrOnngtp4XAA7OaEtviI', 10441, 1),
(10630, 'wx_1506656643', NULL, NULL, NULL, 'Ly', '', 0, 0, 0, 1, 0, 1506656643, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00laTLSew5pwS90FLsmconc', 10602, 0),
(10631, 'wx_15066566568142', NULL, NULL, NULL, '习惯了习惯', '', 0, 0, 0, 1, 0, 1506656656, NULL, 1506664708, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09OoWde_554tTNg9APnIVpU', 10193, 1),
(10632, 'wx_1506656689', NULL, NULL, NULL, '晨曦', '', 0, 0, 0, 1, 0, 1506656689, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03OxgfHv29YjvLVbKgz-te8', 10602, 0),
(10633, 'wx_1506656775', NULL, NULL, NULL, '欣瑶', '', 0, 0, 0, 1, 0, 1506656775, NULL, 1506662393, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02HTM-E3aUqr_6H2dTMdV88', 10602, 1),
(10634, 'wx_15066568251709', NULL, NULL, NULL, '10617_2029', '', 0, 0, 0, 1, 0, 1506656825, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wbmaY6U3j1tyJ7q5SpaN1k', 10617, 1),
(10635, 'wx_15066569479424', NULL, NULL, NULL, '10617_1328', '', 0, 0, 0, 1, 0, 1506656947, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zdGXWZpBQfMqAem8BcosX4', 10617, 1),
(10636, 'wx_15066569608936', NULL, NULL, NULL, '小五', '', 0, 0, 0, 1, 0, 1506656960, NULL, 1506656965, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00Eg-krEDO8-zy9x1tI3bYs', 10089, 1),
(10637, 'wx_1506656967', NULL, NULL, NULL, '梅子', '', 0, 0, 0, 1, 0, 1506656967, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00QF4EN9jfGF5_5_pXLrjjI', NULL, 0),
(10638, 'wx_15066570905760', NULL, NULL, NULL, '10617_2246', '', 0, 0, 0, 1, 0, 1506657090, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xTnH5XPVf5o5CPpFTd4riw', 10617, 1),
(10639, 'wx_15066572132015', NULL, NULL, NULL, 'AA长沙合天下车行@陈婷13667309922', '', 0, 0, 0, 1, 0, 1506657213, NULL, 1506657228, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02nEyqYXOB9s2GJdXO58UEE', 10548, 1),
(10640, 'wx_15066572371270', NULL, NULL, NULL, '张凌', '', 0, 0, 0, 1, 0, 1506657237, NULL, 1506657377, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04fYDJygBk5bBTuz7dMafNs', 10226, 1),
(10641, 'wx_15066572787473', NULL, NULL, NULL, '10193_2095', '', 0, 0, 0, 1, 0, 1506657278, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03blkoFOqQLHPScHPC8AO4o', 10193, 1),
(10642, 'wx_15066574181766', NULL, NULL, NULL, '永哥', '', 0, 0, 0, 1, 0, 1506657418, NULL, 1506657429, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_SzD8BbyobFiGwNoWisIeI', 10193, 1),
(10643, 'wx_15066574458750', NULL, NULL, NULL, '10597_7167', '', 0, 0, 0, 1, 0, 1506657445, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-gu0lvW0b27Nz3VdbpNpaY', 10597, 1),
(10644, 'wx_15066574908522', NULL, NULL, NULL, '欢欢', '', 0, 0, 0, 1, 0, 1506657490, NULL, 1506657520, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB063RznpKgp7fv6HEKRBT3Xg', 10086, 1),
(10645, 'wx_15066576345304', NULL, NULL, NULL, '10617_9230', '', 0, 0, 0, 1, 0, 1506657634, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05Emhz2M1HafEBQ40gVqlms', 10617, 1),
(10646, 'wx_1506657782', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/ibc7DhTUVHfuuUQMx66OcT0IUhvxuTZZXkS31WCN5qDYQJv3w9OzRQxXE57TDMEQR4vqw4NLUjGgzOCp2evbLDA/0', NULL, '中国人寿秋香', '', 0, 0, 0, 1, 0, 1506657782, NULL, 1506866007, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05xsuXJVcIcrhwQ9i_D5RzM', 10374, 0),
(10647, 'wx_15066578535029', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ7h2t7ZmOZEhyVwpvdz07r9KYguxtibvg4xhOFORShUX6GENBqxydcAicdUYmcgQG7P3V8KhoN8R1Q/0', NULL, '大头', '刘峥', 0, 0, 0, 1, 0, 1506657853, NULL, 1507255218, NULL, 0, 0, NULL, '13319585225', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xsoCUS99PaL0yl6CV9Hb6c', 10592, 1),
(10648, 'wx_15066579522748', NULL, NULL, NULL, 'Honeybaby(JYZ）', '', 0, 0, 0, 1, 0, 1506657952, NULL, 1506657977, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01R0C4B_3drMb127mJiouR0', 10193, 1),
(10649, 'wx_15066580066221', NULL, NULL, NULL, '10193_2882', '', 0, 0, 0, 1, 0, 1506658006, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB050wMaupmMyf5JYBFvytMyQ', 10193, 1),
(10650, 'wx_15066582552068', NULL, NULL, NULL, '琼楼玉宇', '', 0, 0, 0, 1, 0, 1506658255, NULL, 1506658268, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01hgjPh8UKGZc0KtBZaAu6w', 10308, 0),
(10651, 'wx_15066584632909', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/hzoy2kUjUGy2NzwXd0sLWe7tDckibdQzGOH1tqdw71M5EFXBcxMicK3w1j5lNldKKb0icVoAjs1FDRNSSXj2jINvA/0', NULL, '甜蜜蜜', '卢娟', 0, 0, 0, 1, 0, 1506658463, NULL, 1506826338, NULL, 0, 0, NULL, '15211089797', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09w8IurqLbO1maA--HbEm5o', 10193, 1),
(10652, 'wx_15066584893559', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/jpRia98bOeHiaxfA65icCXDyS6dkPv7uMu6LUkZ2qpkyo4EXh3ibIiaZCvtoOTNicOtj6CAARg3msGHaaIUIPIjnX0ew/0', NULL, 'aa佳菲喵aa', '', 0, 0, 0, 1, 0, 1506658489, NULL, 1507180910, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zYg0Pm_VhOAl5EYWVeUXI4', 10306, 1),
(10653, 'wx_15066587675883', NULL, NULL, NULL, '阳春', '', 0, 0, 0, 1, 0, 1506658767, NULL, 1506658800, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04dn-7jVjKbXoXA1qE0WLa8', 10308, 1),
(10654, 'wx_15066588075816', NULL, NULL, NULL, '伊儿', '', 0, 0, 0, 1, 0, 1506658807, NULL, 1506658830, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07YyCCADJEAeI_u0kLM9CaI', 10193, 1),
(10655, 'wx_15066589619883', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoNQA3ofOtwjmFJBjVYFk7R154xPTtuGBF160dJOypoicsZQpuiaOibPIC1wcibBicI9bEHGrM8ib8ItfRg/0', NULL, '小雅', '', 0, 0, 0, 1, 0, 1506658961, NULL, 1507271200, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zZ9RHxjFhP0f6PGZ88m_cE', 10193, 0),
(10656, 'wx_15066590967623', NULL, NULL, NULL, '10441_5019', '', 0, 0, 0, 1, 0, 1506659096, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0z_dhcFnc1TMuBlwMso4z9I', 10441, 1),
(10657, 'wx_15066592044396', NULL, NULL, NULL, '丹.', '', 0, 0, 0, 1, 0, 1506659204, NULL, 1506659223, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06jLM29zrJm8Qw76gfiLZag', 10193, 1),
(10658, 'wx_1506659314', NULL, NULL, NULL, 'HF', '', 0, 0, 0, 1, 0, 1506659314, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01VqkFboZMsC3Wl_WFCmpF8', 10602, 0),
(10659, 'wx_15066594215466', NULL, NULL, NULL, '10441_6675', '', 0, 0, 0, 1, 0, 1506659421, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06QcR32U8hc7XDTooYYmWLs', 10441, 1),
(10660, 'wx_15066596622981', NULL, NULL, NULL, '燕子', '', 0, 0, 0, 1, 0, 1506659662, NULL, 1506659684, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wJvb2c_KDezffoJWBI-bDM', 10193, 1),
(10661, 'wx_15066597227505', NULL, NULL, NULL, '10193_8244', '', 0, 0, 0, 1, 0, 1506659722, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB018YwVCNTgjDE10aYnGeUHQ', 10193, 1),
(10662, 'wx_15066598024227', NULL, NULL, NULL, '10237_2520', '', 0, 0, 0, 1, 0, 1506659802, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03Zvxt6rVQ7t0vQ5vlY-DTk', 10237, 1),
(10663, 'wx_1506660054', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKnWPyWLxFfSzRAgALUwr0icvJLMxJHkWiaXMZuUriboM7rQ606fmV7s0ffMzUBlY0bRlHKrQrtOJaaA/0', NULL, '家元', '黄春梅', 0, 0, 0, 1, 0, 1506660054, NULL, NULL, NULL, 0, 0, NULL, '15111456982', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03gWKsQOGo9uMOudGenWSK0', NULL, 1),
(10664, 'wx_15066602807276', NULL, NULL, NULL, '徐煕乔', '', 0, 0, 0, 1, 0, 1506660280, NULL, 1506660287, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_e3ngXpKMBIpmKPStTGHQM', 10226, 1),
(10665, 'wx_1506660300', NULL, NULL, NULL, 'SoIiya', '', 0, 0, 0, 1, 0, 1506660300, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09NMQDDp2BO0lwuyP6TfYmw', NULL, 0),
(10666, 'wx_15066603093621', NULL, NULL, NULL, '10587_8219', '', 0, 0, 0, 1, 0, 1506660309, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wZWJzstIwN6jcgETKzF2QQ', 10587, 0),
(10667, 'wx_15066603314827', NULL, NULL, NULL, 'joyce', '', 0, 0, 0, 1, 0, 1506660331, NULL, 1506660339, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0772aWUyfnd-SY3M9Ia3Qj8', 10226, 1),
(10668, 'wx_15066603926623', NULL, NULL, NULL, '10587_2775', '', 0, 0, 0, 1, 0, 1506660392, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB081vc4BXRjhSQ9S5EP22qtc', 10587, 0),
(10669, 'wx_15066606493234', NULL, NULL, NULL, '思念', '', 0, 0, 0, 1, 0, 1506660649, NULL, 1506660702, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB008Rfc8Q6Ym97ZhvFHjkbYw', 10193, 0),
(10670, 'wx_15066606705720', NULL, NULL, NULL, 'Ycc', '', 0, 0, 0, 1, 0, 1506660670, NULL, 1506661134, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_ctlRcOrdH_HHNFHYY6akA', 10193, 1),
(10671, 'wx_15066608241766', NULL, NULL, NULL, '10496_1183', '', 0, 0, 0, 1, 0, 1506660824, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-t5jQo6TSnnbESup9iiSCo', 10496, 1),
(10672, 'wx_15066610543160', NULL, NULL, NULL, '爱丽丝少儿英语', '', 0, 0, 0, 1, 0, 1506661054, NULL, 1506661104, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xcf8lPRbOnpMCyGV0pOkWg', 10592, 1),
(10673, 'wx_15066611868770', NULL, NULL, NULL, '开心妈妈', '', 0, 0, 0, 1, 0, 1506661186, NULL, 1506663748, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09tiVwR7ZxQwWoKZ2P_2YJ8', 10237, 1),
(10674, 'wx_15066612359623', NULL, NULL, NULL, '嘉怡妈', '', 0, 0, 0, 1, 0, 1506661235, NULL, 1506661255, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00wzPpIwaPf-dvG2k8Fz6jg', 10193, 0),
(10675, 'wx_15066612863418', NULL, NULL, NULL, '彩霞', '', 0, 0, 0, 1, 0, 1506661286, NULL, 1506661305, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05eUb8dSZEDYhLFSInyHs5c', 10193, 1),
(10676, 'wx_1506661638', NULL, NULL, NULL, 'A程程', '', 0, 0, 0, 1, 0, 1506661638, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03W4rLRxu4ifYuEDdqy00ok', NULL, 0),
(10677, 'wx_15066617393195', NULL, NULL, NULL, '范\'范', '', 0, 0, 0, 1, 0, 1506661739, NULL, 1506661767, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01H5YDFdD6dTyqAKXU8EsRo', 10271, 1),
(10678, 'wx_15066621102856', NULL, NULL, NULL, '10226_9127', '', 0, 0, 0, 1, 0, 1506662110, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_PZ6ku9kykgGx_Y1fSPd5I', 10226, 1),
(10679, 'wx_15066623552909', NULL, NULL, NULL, '郭娉婕', '', 0, 0, 0, 1, 0, 1506662355, NULL, 1506662370, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yt8ODU6iFuuwM6HobAblek', 10617, 1),
(10680, 'wx_15066628109327', NULL, NULL, NULL, '10597_1921', '', 0, 0, 0, 1, 0, 1506662810, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB008t1koEQt2PMaxMOPvRh78', 10597, 1),
(10681, 'wx_15066628537462', NULL, NULL, NULL, '涵养天下', '', 0, 0, 0, 1, 0, 1506662853, NULL, 1506662878, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yLOJmb7vUn9Mu4zgUH7y5s', 10193, 1),
(10682, 'wx_15066629067884', NULL, NULL, NULL, '10308_3529', '', 0, 0, 0, 1, 0, 1506662906, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09Jh3RI2TwdUrmnADyR0UwQ', 10308, 1),
(10683, 'wx_15066631819558', NULL, NULL, NULL, '红叶', '', 0, 0, 0, 1, 0, 1506663181, NULL, 1506663186, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05l4AkhGWfhovjM4uSg8dE8', 10308, 0),
(10684, 'wx_15066638718565', NULL, NULL, NULL, 'Cherry', '', 0, 0, 0, 1, 0, 1506663871, NULL, 1506663876, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB077priKzx7zs1EoUL5n3hUA', 10193, 1),
(10685, 'wx_15066640533153', NULL, NULL, NULL, '10560_7982', '', 0, 0, 0, 1, 0, 1506664053, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04ZLoUUC3ECBID6Ym4lQXNo', 10560, 1),
(10686, 'wx_15066641228094', NULL, NULL, NULL, '汽车服务一条龙', '', 0, 0, 0, 1, 0, 1506664122, NULL, 1506664411, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09nJAc_KjLliTxWMMtQ2Rzk', 10193, 1),
(10687, 'wx_1506664155', NULL, NULL, NULL, '神马浮云', '', 0, 0, 0, 1, 0, 1506664155, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09uAZcaildaBQ30A0JEJFxY', 10334, 1),
(10688, 'wx_15066642833954', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/tu6Bg5DbBkPKMp0EIIJg63RrM4It6fJ2hPjpMGWFEyDiaO4iakAu19EmcXDcPvP3AcSUuarmwibVaL1RIlrm2h3CA/0', NULL, '阳阳', '邹蕙阳', 0, 0, 0, 1, 0, 1506664283, NULL, 1506782671, NULL, 0, 0, NULL, '15367819530', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02NS7AjDSI3fQS3uTn_uHSA', 10193, 1),
(10689, 'wx_15066643607690', NULL, NULL, NULL, '10193_9776', '', 0, 0, 0, 1, 0, 1506664360, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-LigtaOPllC1GtmwGAeXJY', 10193, 1),
(10690, 'wx_15066645944872', NULL, NULL, NULL, 'ROSE', '', 0, 0, 0, 1, 0, 1506664594, NULL, 1506664601, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wLTEworyHYixLvKnJ2pOH4', 10193, 0),
(10691, 'wx_15066652099192', NULL, NULL, NULL, 'Sugar', '', 0, 0, 0, 1, 0, 1506665209, NULL, 1506665234, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05KJSkjD5u87JJHuUwqlis4', 10193, 1),
(10692, 'wx_15066652572963', NULL, NULL, NULL, '10193_4350', '', 0, 0, 0, 1, 0, 1506665257, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01N0xn_DT3ViYenXpD8EWwA', 10193, 1),
(10693, 'wx_15066652715253', NULL, NULL, NULL, '欧艺集成墙饰(全屋定制)', '', 0, 0, 0, 1, 0, 1506665271, NULL, 1506665305, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09sgBX5ko8GwgENT1tP8qs0', 10193, 1),
(10694, 'wx_15066653592628', NULL, NULL, NULL, '10441_5591', '', 0, 0, 0, 1, 0, 1506665359, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_vQNZPhh2aodypQvJD69Ik', 10441, 1),
(10695, 'wx_15066654002102', NULL, NULL, NULL, '10137_3476', '', 0, 0, 0, 1, 0, 1506665400, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03dIyt__n6hDRWSDzef8Yks', 10137, 1),
(10696, 'wx_1506665476', NULL, NULL, NULL, '群', '', 0, 0, 0, 1, 0, 1506665476, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0y3w_P7DD0fT-sfWzhUxE4c', 10602, 0),
(10697, 'wx_15066654776424', NULL, NULL, NULL, 'Julie', '', 0, 0, 0, 1, 0, 1506665477, NULL, 1506665502, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05xAXNlK4VOEQuuQ-roWEJo', 10193, 1),
(10698, 'wx_15066655836205', NULL, NULL, NULL, '田田', '', 0, 0, 0, 1, 0, 1506665583, NULL, 1506665608, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02Ka5Uvd-iqo7GcXJ4IJ-h8', 10193, 1),
(10699, 'wx_15066657168483', NULL, NULL, NULL, '10441_6572', '', 0, 0, 0, 1, 0, 1506665716, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07PqlxpQ8QEQD7_IdZly0-o', 10441, 1),
(10700, 'wx_15066661125179', NULL, NULL, NULL, '戴丽娴', '', 0, 0, 0, 1, 0, 1506666112, NULL, 1506666132, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00Uj6iUoAGamXijI3sFMDyM', 10193, 1),
(10701, 'wx_15066663306310', NULL, NULL, NULL, '10193_4725', '', 0, 0, 0, 1, 0, 1506666330, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02M1z9FvOcrCfn48VD7k0EY', 10193, 1),
(10702, 'wx_15066663562651', NULL, NULL, NULL, '过客', '', 0, 0, 0, 1, 0, 1506666356, NULL, 1506666382, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB092Eg1EbDvn2iZBGe-8LE2o', 10193, 0),
(10703, 'wx_1506666452', NULL, NULL, NULL, '冬日阳光', '', 0, 0, 0, 1, 0, 1506666452, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0x6Q6c21ErI7B1ezal_o8bs', NULL, 0),
(10704, 'wx_1506666615', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/VEBT3E7yqWyOX3af8C5rKLXY8DCpAStuozqa2bI12bgvFP7uJ7SiblSULVM1wkwIRULZILNw8cQ6iaDlPEVuM1XA/0', NULL, '明天的太阳', '', 0, 0, 0, 1, 0, 1506666615, NULL, 1506779801, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07b8q2h06Vzuu9ospOdPWq4', 10703, 0),
(10705, 'wx_15066672689861', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/n2Ru77WgLdscppztJhyaFPpC20xFQQibPonTBCpIibFMtZV10rdARoEbhpmt3mwxWpD1KxFgeWGxZzaqumG5TYbA/0', NULL, '涵涵', '吴述凤', 0, 0, 0, 1, 0, 1506667268, NULL, 1507260680, NULL, 0, 0, NULL, '13875800030', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04_MG3fgQjigncZV3aW5Uwg', 10193, 1),
(10706, 'wx_15066678994293', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/XcWCT8wyHXou0dGVr1ia3iaRzOu4GhCpBOOBVWm4u6N77uDsQoD2zgYvEzJiaa5oUYsYJiboSiafoEPpZSnicBmfYhLg/0', NULL, '华华', '', 0, 0, 0, 1, 0, 1506667899, NULL, 1506772228, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07H8ZWtiMp17-teSvDeRcsI', 10617, 1),
(10707, 'wx_15066679505098', NULL, NULL, NULL, '10705_4565', '', 0, 0, 0, 1, 0, 1506667950, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05gPbumwSbvSWGGQyUO_wTU', 10705, 0),
(10708, 'wx_15066681458090', NULL, NULL, NULL, '10705_1322', '', 0, 0, 0, 1, 0, 1506668145, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB019LDR6sJt0hFiz0TudYefA', 10705, 1),
(10709, 'wx_15066683493479', NULL, NULL, NULL, '10705_1784', '', 0, 0, 0, 1, 0, 1506668349, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05obw_z78l8PBmOkIK2PmGM', 10705, 1),
(10710, 'wx_15066683856570', NULL, NULL, NULL, '李淑华', '', 0, 0, 0, 1, 0, 1506668385, NULL, 1506668421, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zT-Z0cv5rST9VpbUAtQa_E', 10193, 0),
(10711, 'wx_1506668563', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ0lHhbutibIdYKPV1LslRXs6K05yNiaXUfUZQAbjjEZxspApS2DaF2RQ9kWShOLxNwr1O8CuVQvsFA/0', NULL, '帆', '', 0, 0, 0, 1, 0, 1506668563, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09wB17hiMqfPl5xQisygY1M', NULL, 1),
(10712, 'wx_15066687512881', NULL, NULL, NULL, '10600_1196', '', 0, 0, 0, 1, 0, 1506668751, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0ytj3YSC_bKM2PR_tGYB3GA', 10600, 1),
(10713, 'wx_15066687874124', NULL, NULL, NULL, '10685_9590', '', 0, 0, 0, 1, 0, 1506668787, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB048s6uPxf5QixY1SUDL88Xc', 10685, 0),
(10714, 'wx_15066688036717', NULL, NULL, NULL, '10705_6163', '', 0, 0, 0, 1, 0, 1506668803, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01Tl2v8abkmtCdOP1VeKASw', 10705, 1),
(10715, 'wx_15066688241027', NULL, NULL, NULL, '0_5010', '', 0, 0, 0, 1, 0, 1506668824, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02MaqGb1bczFc2ce_-xU6CU', 0, 1),
(10716, 'wx_15066688337006', NULL, NULL, NULL, 'May', '', 0, 0, 0, 1, 0, 1506668833, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09vcNVaWGZxdE-1gGH9ogX4', NULL, 1),
(10717, 'wx_15066688502910', NULL, NULL, NULL, '10193_3074', '', 0, 0, 0, 1, 0, 1506668850, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03CDhJmOw5Lk1SDNcW3ZFWk', 10193, 1),
(10718, 'wx_15066688914993', NULL, NULL, NULL, '10193_7707', '', 0, 0, 0, 1, 0, 1506668891, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-kDWFsJEWzSBh6vpjsKusk', 10193, 1),
(10719, 'wx_15066691612499', NULL, NULL, NULL, '一天到晚游泳的鱼', '', 0, 0, 0, 1, 0, 1506669161, NULL, 1506669175, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zwdCV0YtGFXewCzLTwgULo', 10308, 0);
INSERT INTO `bao_users` (`user_id`, `account`, `password`, `face`, `ext0`, `nickname`, `truename`, `integral`, `prestige`, `money`, `rank_id`, `gold`, `reg_time`, `reg_ip`, `last_time`, `last_ip`, `closed`, `uc_id`, `email`, `mobile`, `ping_num`, `post_num`, `invite1`, `invite2`, `invite3`, `invite4`, `invite5`, `invite6`, `token`, `p_openid`, `pid`, `is_subscribe`) VALUES
(10720, 'wx_1506669291', NULL, NULL, NULL, '七曜融光', '', 0, 0, 0, 1, 0, 1506669291, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-2s3rl7Qtia362g8i5e5QU', NULL, 0),
(10721, 'wx_1506669342', NULL, NULL, NULL, '蒙子*-*', '', 0, 0, 0, 1, 0, 1506669342, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06lH_J73OIkFVbFX_sdsSiw', NULL, 0),
(10722, 'wx_1506669363', NULL, NULL, NULL, NULL, '', 0, 0, 0, 1, 0, 1506669363, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, 0),
(10723, 'wx_1506669493', NULL, NULL, NULL, '花姐', '', 0, 0, 0, 1, 0, 1506669493, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02pXxBbtZ1wz1RvgI93flPw', NULL, 0),
(10724, 'wx_15066696592380', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/2ylJKNcgH7P4Tk7dv2rOJYJ97sFljBfhEtiaVahsqXKs842XiatefW2MYKW3m10Mic2OhoK2Aibcnvzrhohh2B7EsA/0', NULL, '阿德', '', 0, 0, 0, 1, 0, 1506669659, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04Cmm5VSanaVHEQ6lSolk3I', NULL, 1),
(10725, 'wx_15066699099470', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/lsTBWic1pKJPNno2bAyONGgTIepvBxCLxoZRbpiaZEBk6spib7QJpxPXPUtwTDfD5d2Gb8icnfTibCCCVsZEXdXgViaw/0', NULL, '浩子', '刘卫平', 0, 0, 0, 1, 0, 1506669909, NULL, 1507172944, NULL, 0, 0, NULL, '18670018090', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zRphvbs005NqF9N-HgaiTw', 10705, 1),
(10726, 'wx_1506670127', NULL, NULL, NULL, '飞燕', '', 0, 0, 0, 1, 0, 1506670127, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0--ICbYTFOQ9cFsfarCv2rY', NULL, 0),
(10727, 'wx_15066701852571', NULL, NULL, NULL, '10308_2303', '', 0, 0, 0, 1, 0, 1506670185, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08mdiERgghYztlSc2c7_p4E', 10308, 1),
(10728, 'wx_15066702376944', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL1vPVbhPK1wLh6vgrdNwTKYxOdkiaCkq77DFBLq1pGXiacbzfHX1kvbZTYJGiaIb8tlrTamzDmdCHicQ/0', NULL, '刘鹏', '', 0, 0, 0, 1, 0, 1506670237, NULL, 1506675713, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0x8io5VUjyEsLnjj4ZbB9Sk', 10193, 1),
(10729, 'wx_1506670392', NULL, NULL, NULL, 'JerryYin', '', 0, 0, 0, 1, 0, 1506670392, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04MS-ITaRgI6WHfR48srCBs', NULL, 0),
(10730, 'wx_1506670906', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/2XUGkCmOQiaXgic8b8tRNicfXLNc6ZTgn8aPb9IpXbicobdBS9apSC3IRUas9YicLVInSXZMEXo0ym9Q9Rh2zz07icQw/0', NULL, '蓝心', '杨巧辉', 0, 0, 0, 1, 0, 1506670906, NULL, NULL, NULL, 0, 0, NULL, '13548605270', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yE3_8hfyw-2YJmEFYDOpIc', NULL, 1),
(10731, 'wx_1506671542', NULL, NULL, NULL, '伍毅', '', 0, 0, 0, 1, 0, 1506671542, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00Y9YK3R4iQD5JDXsR1QYjA', NULL, 1),
(10732, 'wx_1506671547', NULL, NULL, NULL, 'iceCoke', '', 0, 0, 0, 1, 0, 1506671547, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xDo8qZz9vAA5A7z25ysMRY', NULL, 0),
(10733, 'wx_1506671610', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/ogldrzdm3ncSQSiaQGDIibeK7vsSsUQOVvsdAxkxKficrQQlQVLibQNPQYRPsfWBsYm3ODrsAsohVYEQticBbcRMADw/0', NULL, 'Rain妈', '高永红', 0, 0, 0, 1, 0, 1506671610, NULL, 1506733879, NULL, 0, 0, NULL, '13908499177', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-nqXgHiLeTzy1QgtNWauv0', NULL, 1),
(10734, 'wx_15066716959082', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/e9YxTIibRQjLXzV3nvARO8orhhXCcU3Bo0SNa6o4pYQqjRU2nn2PjF6sZK3icYFZ0DuFAg9wUDSnhqfgibaAvSc3A/0', NULL, '美好明天', '', 0, 0, 0, 1, 0, 1506671695, NULL, 1506671953, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xmTG63qwR1u0YOilkNEKa8', 10193, 1),
(10735, 'wx_1506671942', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoq7m8RwcAXypp6T7zyibiccK9Ny51qNRRicZKoGxic8UABhO7tnT5rrcFstje9cpC2uOO9CB9DNTLU9A/0', NULL, '轩轩', '吴玎轩', 0, 0, 0, 1, 0, 1506671942, NULL, 1506734555, NULL, 0, 0, NULL, '13787113057', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07tzV9ZB6oH0jRKgIaLljt4', 10733, 1),
(10736, 'wx_1506672151', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL3PIyficCu7b9xdlz90LIuO09SZBIlKNuaNPYk91fPQCX5kbTxoyaQXwgrTzlCUboGM7nb2X8siaMg/0', NULL, '璐', '', 0, 0, 0, 1, 0, 1506672151, NULL, 1507245639, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02ircBaauH73OL8rMNA0IeE', 10137, 1),
(10737, 'wx_15066722279867', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq1syBetkpCB78BicDwmn4yhLeT8YkJwSia3PM3H976CfiboAo1qehzUaFrJvfMdzfg0mJaKGVTIhyvQ/0', NULL, 'rambo', '', 0, 0, 0, 1, 0, 1506672227, NULL, 1506672240, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04fFoD2QxDw7NO-towRTH-4', 10193, 1),
(10738, 'wx_15066725158840', NULL, NULL, NULL, '10441_2141', '', 0, 0, 0, 1, 0, 1506672515, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0ySTXfDtlbPvLzToFL3oMCM', 10441, 1),
(10739, 'wx_1506672850', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/rlIeDLHvqo0ibj5N4Vdib7HZ6KGFPcIq45aicKPjiapN3nlg3SUvnmcicIvGsJy5H1DtPwr0fiaeohoeicp7PVJOZGnKA/0', NULL, '姚大姐', '', 0, 0, 0, 1, 0, 1506672850, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yN7D6a4sx4rnMPGLkoFwW8', NULL, 0),
(10740, 'wx_1506673237', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eo0AXcIpH0ehJ158NSSLttuHeLnk46VaZF1FC7xhdOl4saysMncsMetSN169DcPo8WlS1uvEXEvcQ/0', NULL, '李月红', '', 0, 0, 0, 1, 0, 1506673237, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB076Her1-6Z5oR70Vl1bfxBQ', NULL, 0),
(10741, 'wx_15066736167117', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eruGBAPeolgkJftvvhIoQ5b160TuqiaLGKULCICyzic6TyE95LSJ66eXS2OuHibOoibgnPbrf0rjuJFRA/0', NULL, 'A雪碧', '', 0, 0, 0, 1, 0, 1506673616, NULL, 1506673629, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-XU50wu6I3fjPzQ3CBVYNg', 10137, 1),
(10742, 'wx_1506673747', NULL, NULL, NULL, 'Hot Wheels', '', 0, 0, 0, 1, 0, 1506673747, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06hGcwMAIBQbcdZrAlZY2zk', 10741, 0),
(10743, 'wx_1506673933', NULL, NULL, NULL, '大漠胡杨', '', 0, 0, 0, 1, 0, 1506673933, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09F3GSNYv8qadU3ICPvUb8Q', NULL, 0),
(10744, 'wx_15066742979931', NULL, NULL, NULL, '10468_4717', '', 0, 0, 0, 1, 0, 1506674297, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05AkqmV1xdx_5TPWYAQHpDo', 10468, 0),
(10745, 'wx_1506674854', NULL, NULL, NULL, '黄黄', '', 0, 0, 0, 1, 0, 1506674854, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05SuVdDp6TkTbV0jghhC13I', 10736, 0),
(10746, 'wx_1506675023', NULL, NULL, NULL, '小雪', '', 0, 0, 0, 1, 0, 1506675023, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07xmIARzE1YdoMI1en3z4to', NULL, 0),
(10747, 'wx_1506675247', NULL, NULL, NULL, 'lily家&私房蛋糕订制15211169252', '', 0, 0, 0, 1, 0, 1506675247, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07X9AYYXQEMiXD9wSncfDuQ', NULL, 1),
(10748, 'wx_15066756945919', NULL, NULL, NULL, '10234_8224', '', 0, 0, 0, 1, 0, 1506675694, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06GvCl4GVTh2qOtRCUjmubo', 10234, 1),
(10749, 'wx_15066757598965', NULL, NULL, NULL, '10468_3268', '', 0, 0, 0, 1, 0, 1506675759, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wFXX4SQOpPUdGf7nC1ExpQ', 10468, 0),
(10750, 'wx_1506675904', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJaUCKo06apSzCPgBBRvdyFQpJLvzd6TKJZX9Bg8pQxZbV4iaD15333rxRGKv1NoXAPjV8OXKbS61w/0', NULL, 'fang', '', 0, 0, 0, 1, 0, 1506675904, NULL, 1507342075, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02EmRrDxeV5kXUS_xvXqsKs', 10736, 1),
(10751, 'wx_15066763876840', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJQyP4WVaRJVTZ3r2Ohiavsoqz9jWMLpMTuFaGtPUfkSAicmRz8HHA52P3mudzswbfRLDYW7na92Q8Q/0', NULL, '姗姗来吃', '', 0, 0, 0, 1, 0, 1506676387, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02_1xGCXS6FFnd__7X5lI6g', NULL, 1),
(10752, 'wx_15066764452691', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK8uiaErzMEKjBd9pXr34uWtwy4eeWqQxhnuic54mXYKS9xicbDB0IXdcJJ5OaRs9Q6ecf0Awd3LeXyA/0', NULL, '丹丹', '', 0, 0, 0, 1, 0, 1506676445, NULL, 1506676457, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xckr-XCFzEaP1nHQiPkmwc', 10193, 1),
(10753, 'wx_15066775771866', NULL, NULL, NULL, '10468_3681', '', 0, 0, 0, 1, 0, 1506677577, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05LoXDUiRWtZIR_anAtPO_8', 10468, 1),
(10754, 'wx_1506678098', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/2A31NBAqNRXxfhsHXwf85QcPNKmcPUhxEafdtHIusyF2MlUfQmFSkh88vwsP6xM6nLhUiaF7aQM7dDkjvPmT5kA/0', NULL, '家豪妈', '', 0, 0, 0, 1, 0, 1506678098, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00Yze6ctgGVPjApnsg2UW-c', NULL, 0),
(10755, 'wx_1506678179', NULL, NULL, NULL, '王', '', 0, 0, 0, 1, 0, 1506678179, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06Vl029BjdaGanYXwed9mXA', NULL, 0),
(10756, 'wx_1506678325', NULL, NULL, NULL, '孤帆', '', 0, 0, 0, 1, 0, 1506678325, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07OC4mMQ28HJJ28J-TfVQa0', NULL, 0),
(10757, 'wx_1506678355', NULL, NULL, NULL, '嘉', '', 0, 0, 0, 1, 0, 1506678355, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB099Tg8f7p2_U1rC8MazYIN4', NULL, 0),
(10758, 'wx_15066784165071', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/pOXJHa4n9SXfmmjt5TaFqnSicOZkZwyYJtO5BYuD4YBFeEU9LqMiaMGNxKqxzeRcEBlaNsWymwkwDTr00mySQ1Dw/0', NULL, '梁淼', '', 0, 0, 0, 1, 0, 1506678416, NULL, 1506678429, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xoUSRg-AvP0V2C51JUsGvo', 10193, 1),
(10759, 'wx_1506678569', NULL, NULL, NULL, '一生的守候', '', 0, 0, 0, 1, 0, 1506678569, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05QG3DUrfy6-zO24YArErAY', NULL, 0),
(10760, 'wx_1506679393', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoXoqDLvF3l8Ka6Uib9biaqbz8vhuhCibEckCWricSwo7vKvylEqngl6CBmLOxcGIlrnW48818ibHPiaBtQ/0', NULL, '31Plus', '单彦', 0, 0, 0, 1, 0, 1506679393, NULL, NULL, NULL, 0, 0, NULL, '18570373888', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06us9PPwuipMuYnFP1Jrbkc', NULL, 1),
(10761, 'wx_15066800972166', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI39AMrvGpMUQMiaMgfJxHqBbPOd3q9BGHVqlVYB9vw5EIn35mE9Evy1oialY1yEkLnJjGXax5FYsHA/0', NULL, '龚明', '', 0, 0, 0, 1, 0, 1506680097, NULL, 1506680107, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08cqzN4ANsoApsRM1eHAaDI', 10552, 1),
(10762, 'wx_15066801765988', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/faLUScl8xT7VAdlBA4jAAvzrmJUt4IROjZG67vpEAWCApIN2wkGSHzku5YMwQIu1r8DT21Wd2AykhmeL79AMIA/0', NULL, '艳子', '', 0, 0, 0, 1, 0, 1506680176, NULL, 1506680200, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zLWBWFIuswgA1VC5fET6l0', 10560, 1),
(10763, 'wx_15066802844302', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/JlzJ9YTRgUrBbGppKbiadbDOsKf985EhibSUCsEY8WZRX4cp4JFj6PicqGavPib7icL6muMHuImCQwzWvYmvhovpuyw/0', NULL, '苗妺儿', '', 0, 0, 0, 1, 0, 1506680284, NULL, 1506728865, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01Aec5y_VLZsJAi_2TfzWl0', 10226, 1),
(10764, 'wx_15066803252971', NULL, NULL, NULL, '10368_4384', '', 0, 0, 0, 1, 0, 1506680325, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00liaLdGeuY07l8mi3QM4D4', 10368, 1),
(10765, 'wx_1506680356', NULL, NULL, NULL, '言希', '', 0, 0, 0, 1, 0, 1506680356, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wkTGBTQEHObsO5Ko6TzfI8', NULL, 0),
(10766, 'wx_15066803696853', NULL, NULL, NULL, '10368_5427', '', 0, 0, 0, 1, 0, 1506680369, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09M99ZgLNRmIZqbFSpUv7Cs', 10368, 1),
(10767, 'wx_15066803729846', NULL, NULL, NULL, '10368_8622', '', 0, 0, 0, 1, 0, 1506680372, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05S_VYqp6m_VNhvS-Ccn9Tw', 10368, 1),
(10768, 'wx_1506680522', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/mLINGeaLsJHDTLXCUCM9pPU7iatwGDJQ5iaIYgWLD0c90h1CQUQQB9Vzz4pAFTKaXRxdzdlScW0Taxp8Kfic0Yiaiag/0', NULL, '散珠碎玉', '', 0, 0, 0, 1, 0, 1506680522, NULL, 1506740611, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01UyoHIX_CuVcbdbX7cxyfg', NULL, 0),
(10769, 'wx_1506680590', NULL, NULL, NULL, '潇潇', '', 0, 0, 0, 1, 0, 1506680590, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05bj2p1-eDT3ZrVoRa2y5ew', NULL, 0),
(10770, 'wx_15066806321484', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIuNQXObUwZmIx5hbw1SiaLuLFZXp5agk5SHkJ6XsD6sL3zNJ6hCjlLtX9093tIeJic1FoPPraSquxw/0', NULL, 'Liu', '', 0, 0, 0, 1, 0, 1506680632, NULL, 1506680642, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01hLi4cuspdLfpR3rpN8X7g', 10308, 1),
(10771, 'wx_1506680695', NULL, NULL, NULL, '爱心飞翔', '', 0, 0, 0, 1, 0, 1506680695, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00_NNFaNuWwcz2FGjEKF738', NULL, 0),
(10772, 'wx_1506680929', NULL, NULL, NULL, '易天下', '', 0, 0, 0, 1, 0, 1506680929, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wIlOk_7WBUHNp7mhD9RE18', 10768, 0),
(10773, 'wx_1506681143', NULL, NULL, NULL, 'acbd', '', 0, 0, 0, 1, 0, 1506681143, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05yzai_hvdKaDnkVDBWa3cE', 10374, 0),
(10774, 'wx_1506681198', NULL, NULL, NULL, '左利', '', 0, 0, 0, 1, 0, 1506681198, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03_05zk8ygRXMh_ZljKBzeI', 10374, 0),
(10775, 'wx_15066823797538', NULL, NULL, NULL, '10094_9251', '', 0, 0, 0, 1, 0, 1506682379, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-U-AB5j_AQvyTiVuBtvqyE', 10094, 1),
(10776, 'wx_15066828817299', NULL, NULL, NULL, '10368_6797', '', 0, 0, 0, 1, 0, 1506682881, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01mWqkbIYpQcjbl-kJzgDBw', 10368, 1),
(10777, 'wx_15066833754925', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/kGtQqrbXrBAJdB3ZKbM5rDYGkHvicXswGH18HrBicPKDsHuiaH6tFYLeaia86QbTkEr4PSCzBGXtNPJFXn8Y2EAlSQ/0', NULL, 'A短信群发，鼎实装饰，餐饮抽排', '丁志丽', 0, 0, 0, 1, 0, 1506683375, NULL, 1506728144, NULL, 0, 0, NULL, '15874985903', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB077gzR5sEBs6ESUX-2AeuEg', 10368, 1),
(10778, 'wx_1506683531', NULL, NULL, NULL, '开心就好', '', 0, 0, 0, 1, 0, 1506683531, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wopFglS0KfT6YH0LWHPte8', NULL, 0),
(10779, 'wx_1506683721', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/LyXoVuH1CSbKHRcdagwGO9y8otVMeC7kInOajmqe07OZicGywqhgIOqWj7lHOicicgzUAZ6KgjIF0QnB4qQB9OFDA/0', NULL, '꧁ 乐   荳 ꧂', '', 0, 0, 0, 1, 0, 1506683721, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04yoNMlg9hDi8AekkJphoQQ', NULL, 1),
(10780, 'wx_15066841745407', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLAFNR7biasuXrM7MtOpdTswiaB654VzvWMicyInOCT0bYZSz1Kku8xBBPN20Uic2NW8n0N7xxwicPDf6g/0', NULL, '雀鹰@8623.com', '', 0, 0, 0, 1, 0, 1506684174, NULL, 1506770298, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xtXJz0Fm2xCfPPxOls8nE4', 10140, 1),
(10781, 'wx_15066841834869', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/ia94oUsibJVIjTAcNjiajZ0bEjEWX063AhtVc6gIv28Ciay6ssEJ3S8b77okkic6xoicF5KTCVQibMI2SHB5NtBiao1iasw/0', NULL, '爱丽丝', '', 0, 0, 0, 1, 0, 1506684183, NULL, 1506696323, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xEb_JcpfQy-8nHlooFKCZw', 10368, 1),
(10782, 'wx_1506684816', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/dtoDVnFEAHcBYMHBDWKiaxdEfzzhia7TgoY1LSFx5t503wPPmIJroEnRhMzJ7ElwroCJz77vPV60Tt91y045cQsQ/0', NULL, '贵&云', '', 0, 0, 0, 1, 0, 1506684816, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05zNmEGJ42fE4wNjjHTULg0', NULL, 0),
(10783, 'wx_15066857119197', NULL, NULL, NULL, '10238_8647', '', 0, 0, 0, 1, 0, 1506685711, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08WvO7sii7cRrD0C81Ws05E', 10238, 1),
(10784, 'wx_15066857331626', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/WkoXk7jt43LibUb4GprXib4VvKqfThDc7ibbJVOUSkAVjROmAbX2JKIgX3MSV7QNXHtIVjTt66iaDDsrR9iaIItL0qg/0', NULL, 'COCO', '', 0, 0, 0, 1, 0, 1506685733, NULL, 1506742996, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03iUdhKS4ZA1OpHxfSEiAsw', 10238, 1),
(10785, 'wx_15066859197509', NULL, NULL, NULL, '10368_8586', '', 0, 0, 0, 1, 0, 1506685919, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0ydyIXdv4YKj_8xbUEGjeXc', 10368, 1),
(10786, 'wx_1506685958', NULL, NULL, NULL, '何英桃', '', 0, 0, 0, 1, 0, 1506685958, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03c1K-9jnt1SY13iokG9zjI', 10523, 0),
(10787, 'wx_15066867243417', NULL, NULL, NULL, '10427_1222', '', 0, 0, 0, 1, 0, 1506686724, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0z707KhX5rjg2UDHrnum7YU', 10427, 0),
(10788, 'wx_15066868582926', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/7yhS482zEnice1mYz8LcAiblGkdmYcFHzrXqwBZ4SfMqibicmQx8wUafDWOImTdnIBR5YWhZZjJ6YGwtldtAlHcliaQ/0', NULL, '辰辰妈', '', 0, 0, 0, 1, 0, 1506686858, NULL, 1506686891, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02e0hHKeLJVO7cKX4hAQwAo', 10193, 1),
(10789, 'wx_1506687223', NULL, NULL, NULL, '有缘人', '', 0, 0, 0, 1, 0, 1506687223, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zApW8fq6VDvi6Gpkm0h6fw', NULL, 0),
(10790, 'wx_1506687251', NULL, NULL, NULL, '受苦受累破壳日', '', 0, 0, 0, 1, 0, 1506687251, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0z0EUkl1aiPiSDugae8vol0', NULL, 0),
(10791, 'wx_15066873546915', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Nz5mskQlzulFbicAwKoJFVjCENlxqdUdNicqjYjJMW2UAwvMPicict26cZEh9RNkuQDweMicq9tSo2fNebxJfiakDkCA/0', NULL, '佳姐姐', '胡佳', 0, 0, 0, 1, 0, 1506687354, NULL, 1506897404, NULL, 0, 0, NULL, '15116319199', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-CiE2RGj3ao-vPNYqklUCA', 10455, 1),
(10792, 'wx_1506687360', NULL, NULL, NULL, '小鱼', '', 0, 0, 0, 1, 0, 1506687360, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07YkZ7k5x8-P2U_D6387GQs', 10768, 0),
(10793, 'wx_1506688668', NULL, NULL, NULL, '等着我', '', 0, 0, 0, 1, 0, 1506688668, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01rS3kdgF_HLlx64fJHPIFM', NULL, 0),
(10794, 'wx_15066887317150', NULL, NULL, NULL, '10368_8719', '', 0, 0, 0, 1, 0, 1506688731, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB005F4XoDlYRmsIEDbKG-Oms', 10368, 1),
(10795, 'wx_15066887519057', NULL, NULL, NULL, '10368_8600', '', 0, 0, 0, 1, 0, 1506688751, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05tX19FcdCHzr3Ig-Yay0_I', 10368, 1),
(10796, 'wx_15066887843292', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/ogldrzdm3ncSQSiaQGDIibeGpE0WpkxDglvUrRxTCsXLp9FicvtaPqXZjy2YUmHPVddEWoyLtDLZHfk0TDrdU3ibGQ/0', NULL, '蜜汁', '', 0, 0, 0, 1, 0, 1506688784, NULL, 1506688793, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02EwF-3s-KDZY3imx0RclzM', 10306, 0),
(10797, 'wx_15066888132198', NULL, NULL, NULL, '10084_2725', '', 0, 0, 0, 1, 0, 1506688813, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01743CW7c2VPBRNSbfitZZc', 10084, 0),
(10798, 'wx_15066889825631', NULL, NULL, NULL, '10456_4348', '', 0, 0, 0, 1, 0, 1506688982, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-QYJUePmVQTrjKEsM3IZTU', 10456, 1),
(10799, 'wx_15066895369346', NULL, NULL, NULL, '10368_1581', '', 0, 0, 0, 1, 0, 1506689536, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0367kKy_Rg00nhUY4a-g81k', 10368, 1),
(10800, 'wx_1506689595', NULL, NULL, NULL, '晓春', '', 0, 0, 0, 1, 0, 1506689595, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06ym1IOTQwuyeW-Ls-_fXT8', NULL, 0),
(10801, 'wx_15066898823401', NULL, NULL, NULL, '10456_3159', '', 0, 0, 0, 1, 0, 1506689882, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB064YSQieoXD9HWo3ueVHd5A', 10456, 1),
(10802, 'wx_1506690226', NULL, NULL, NULL, '代志红', '', 0, 0, 0, 1, 0, 1506690226, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01EctgpPF1vCgx6oNM-PgnI', NULL, 0),
(10803, 'wx_1506690386', NULL, NULL, NULL, '美丽谛造者@@', '', 0, 0, 0, 1, 0, 1506690386, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0z-ZJK33iGGR140WAZ6q1MM', NULL, 0),
(10804, 'wx_15066909287464', NULL, NULL, NULL, '10456_8592', '', 0, 0, 0, 1, 0, 1506690928, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_-kvfJUFQUneekxJCObjFY', 10456, 1),
(10805, 'wx_15066909308779', NULL, NULL, NULL, '10193_2713', '', 0, 0, 0, 1, 0, 1506690930, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0y61zuQ-qlxsSuo_6HHmTw0', 10193, 1),
(10806, 'wx_15066909792665', NULL, NULL, NULL, '10456_5176', '', 0, 0, 0, 1, 0, 1506690979, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05bO39eEeFMwdq86zYiNsBk', 10456, 1),
(10807, 'wx_1506690995', NULL, NULL, NULL, '杨林', '', 0, 0, 0, 1, 0, 1506690995, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05haSk8ezXB1E9xzSIISzPQ', 10085, 0),
(10808, 'wx_1506691020', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIDgzHSfba9diaibeprcaQzU0QGEmxz3icX9icbO8zH4SDYIRJsmk4YjIt3zujWibAftMSzFQlBobicm9BQ/0', NULL, '安心的等待', '', 0, 0, 0, 1, 0, 1506691020, NULL, 1506691023, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03iZmwTlcEkvXR4yE_y5bA8', 10085, 0),
(10809, 'wx_1506691053', NULL, NULL, NULL, 'royang', '', 0, 0, 0, 1, 0, 1506691053, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-ZDoVpdfGoJNnbNwVt6Ouo', 10085, 0),
(10810, 'wx_1506691217', NULL, NULL, NULL, 'Fiona', '', 0, 0, 0, 1, 0, 1506691217, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05YB94jWM4tKkOXFYnWprcU', 10085, 0),
(10811, 'wx_15066913179894', NULL, NULL, NULL, '10368_1538', '', 0, 0, 0, 1, 0, 1506691317, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB067YbHVrEd94S55QLk_TtZQ', 10368, 1),
(10812, 'wx_15066913694095', NULL, NULL, NULL, '10085_7446', '', 0, 0, 0, 1, 0, 1506691369, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09mObYwqpUZJR20b4fgdaTM', 10085, 1),
(10813, 'wx_1506691396', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/HAnA7B2e1vDyfUibsfkA2yWMHGdXtRKGaGWPPZekW7XW9W2kvyzPN6x2QVuPNjyJmsNQWFJlK9Wkn7TMjNXbib7A/0', NULL, '肖琳@金天鹅', '', 0, 0, 0, 1, 0, 1506691396, NULL, 1506764211, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zKET8uAyr-rwEtUO36pfp4', 10085, 0),
(10814, 'wx_15066919086391', NULL, NULL, NULL, '10193_6864', '', 0, 0, 0, 1, 0, 1506691908, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xZsJ4Xn0s-6ejFGYzuk2Lw', 10193, 1),
(10815, 'wx_1506692605', NULL, NULL, NULL, '胡悦', '', 0, 0, 0, 1, 0, 1506692605, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB029AuaRK_4f4S0_US6mrxO8', 10085, 0),
(10816, 'wx_1506692626', NULL, NULL, NULL, '绿谷教育', '', 0, 0, 0, 1, 0, 1506692626, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-g1GW_tuiVWi-j_l61-w_8', 10085, 0),
(10817, 'wx_1506692896', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/FC7d3bDPUHSq7Amyao6u9TdsvlpgY7et5V5Rs5GmZKwzkN39SYlg1k4EZ9YzArtz5L2ypebFhSl5icOJw7QvqgQ/0', NULL, '沙龙', '', 0, 0, 0, 1, 0, 1506692896, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yuzUJOSzvzMqb9i1B2GibM', NULL, 1),
(10818, 'wx_1506693379', NULL, NULL, NULL, '風飛鳥', '', 0, 0, 0, 1, 0, 1506693379, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07hXxZv2uvtzPZwSNm_zU8w', 10085, 0),
(10819, 'wx_1506693649', NULL, NULL, NULL, '美美', '', 0, 0, 0, 1, 0, 1506693649, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06cmi0OwqiDmb5EzOAnK5K0', 10193, 1),
(10820, 'wx_15066937213253', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/5aibUDzYx4euAInfXjQfiaKFiaPnibrrgiadMS3iajWhB0C3a4WJlZic9cJwkwgAGxr2Vsot7V44bJMTwIb2xialtRS3ug/0', NULL, 'Sunshine', '', 0, 0, 0, 1, 0, 1506693721, NULL, 1506693761, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02T7sWbZHMYF1nSULDEZ9G4', 10245, 1),
(10821, 'wx_15066938271803', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/QwFTesWia4dYVqmhia8FWl6xg4sIanVAIJR4FAOlselKMJv0gbf530YnRJIibRCfRM4OsQiapgZt7AYDoInQvbSbDw/0', NULL, '琦', '', 0, 0, 0, 1, 0, 1506693827, NULL, 1506768809, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0ygSP7c3LOIskbtOJQtuYyI', 10560, 1),
(10822, 'wx_1506694595', NULL, NULL, NULL, '一米阳光', '', 0, 0, 0, 1, 0, 1506694595, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xtEqB480q6hChihjHsgNM8', NULL, 0),
(10823, 'wx_15066946381171', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLzuDJMn2ghqpgT67mYibcyfvqf3SdY9KFDiaDb1Brcxt3Io5fdMv5YynAOPoRgoWzKaIbyicuwylj1A/0', NULL, '陈美丹', '', 0, 0, 0, 1, 0, 1506694638, NULL, 1506696193, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wzqKTl6zElmNL0-kE2hd3o', 10193, 1),
(10824, 'wx_1506694805', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/SPtGxRcz6GePibuUz9XXeKPEQBWhakkUAx7tSQPHEA8vxEmXVjqibiagpeI5RLSYeNZxEx4eTd1HcO44YNPn6EBeA/0', NULL, '何巧平', '', 0, 0, 0, 1, 0, 1506694805, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08LcrVh5svBmUuSEKS3_qtU', NULL, 1),
(10825, 'wx_1506695023', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/oG6aCHTcShVBRdiazeWcw9yz9ORickmKxibyTFbsD4kmqjic0BeWCSh1daLfceeyf4ElHDbzbicOBLvQNrfMCnyicAbg/0', NULL, '玲', '肖玲', 0, 0, 0, 1, 0, 1506695023, NULL, NULL, NULL, 0, 0, NULL, '13787261677', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xktViS7l0QL2i6yroG0Yrk', NULL, 1),
(10826, 'wx_15066950981000', NULL, NULL, NULL, '10193_1157', '', 0, 0, 0, 1, 0, 1506695098, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wsqZIJ1BblEHykpKCsnMGk', 10193, 1),
(10827, 'wx_15066951724522', NULL, NULL, NULL, '10368_7360', '', 0, 0, 0, 1, 0, 1506695172, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02eHMUYA_W5SBtX2QBg7BOU', 10368, 0),
(10828, 'wx_15066952559387', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/wD860ng9SoSlKqrACicZxticfRgkib98KWCZ5PkdaCVXibgQXfTzGia5GyCIKkSMm62lezOtibJkTkiaXA4zqtHyIonVA/0', NULL, '逗逗', '', 0, 0, 0, 1, 0, 1506695255, NULL, 1506695282, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-nYDZ62qpEYWmybOTE-JKk', 10826, 1),
(10829, 'wx_15066954717417', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/PAA40tuAbMmzaNOo1LvSFibcdONWAk1c02P4w0bZdlJyibvzZwBQXw81mc2Urepl4JOibluUA73njMhEOzIoWybBA/0', NULL, 'Elaine', '', 0, 0, 0, 1, 0, 1506695471, NULL, 1506737287, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05Mr-6JxHvGMah94ri_bwQY', 10085, 1),
(10830, 'wx_1506695745', NULL, NULL, NULL, '剪艺一族', '', 0, 0, 0, 1, 0, 1506695745, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08dbPNjcgPXKEkE0Z50VOJc', NULL, 1),
(10831, 'wx_15066959638120', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/0YOSfACeceliaytAUl57rhjAiaom9Jh9urRLAMCFemQ1a3wWaHxlf5erpgibj6GFDRVhPHBJ9YXictbpfPNK9Nx4tw/0', NULL, '婷博的船', '', 0, 0, 0, 1, 0, 1506695963, NULL, 1506749820, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_DsOBxkT4Rmx6eEWBMft18', 10193, 1),
(10832, 'wx_15066959938393', NULL, NULL, NULL, '10085_8390', '', 0, 0, 0, 1, 0, 1506695993, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB077KWAs1A_bKfYZwsK0TDS0', 10085, 1),
(10833, 'wx_15066962331397', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/sqJxWupzKZ7libiaFSokRicmdavzo7hIj2ib621iahG2aMARVkftCWGVMBX3ngjKWV4lHQtn3KyQD6iaOECsLTh0xorg/0', NULL, '毛衣编织', '', 0, 0, 0, 1, 0, 1506696233, NULL, 1506696251, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09a1oRmntD70aCMk4Sx6xrM', 10193, 1),
(10834, 'wx_15066963225217', NULL, NULL, NULL, '10447_1613', '', 0, 0, 0, 1, 0, 1506696322, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07LyETA56KcPpLY1SqAvPCM', 10447, 1),
(10835, 'wx_15066965199672', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/8O52yqV5gQudWrYxBiazlKVBWgXsicnpicrbkgFnN8f9Dhrkp9sFz1sAys3dT0Kan3zNsFI6EcN6YJbAjSFibWdc6w/0', NULL, '李易轩妈妈', '', 0, 0, 0, 1, 0, 1506696519, NULL, 1506696531, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wB1-_1hu09xHQJJgc3Rip8', 10831, 1),
(10836, 'wx_15066967379628', NULL, NULL, NULL, '10826_6702', '', 0, 0, 0, 1, 0, 1506696737, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09Jtv_5m2rlkCYuY9hPBvBY', 10826, 1),
(10837, 'wx_1506696933', NULL, NULL, NULL, '微笑！快乐18373668620', '', 0, 0, 0, 1, 0, 1506696933, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09i7JYUYmGLEWco-4Q7oCck', NULL, 0),
(10838, 'wx_15066974535040', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/gicwcgzfqZYXtOxOY3Yoc8aHeeY8ibhPb7yVv6QD8icniafpZxB8nCia1kvugPOBkpWR2jhSMQVicmPkmCAXTCvQEticQ/0', NULL, '薇儿', '', 0, 0, 0, 1, 0, 1506697453, NULL, 1506697544, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04WZraqc07lMRvQdtphcU0o', 10193, 1),
(10839, 'wx_1506697901', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/0ibbxuNK6Ihero4DRjUYdqXYgMicOpv28bjBPbr902cf5ap1mLRTGrF4hpgZL7n4YrJ9vNibMrjdPsJxtDEfx3Qgw/0', NULL, '极致美容美甲', '杨梦琦', 0, 0, 0, 1, 0, 1506697901, NULL, 1506849309, NULL, 0, 0, NULL, '13974274868', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_qAwgX75T2aOU77Ox0vgTs', NULL, 0),
(10840, 'wx_1506698290', NULL, NULL, NULL, '麦淘13288699535', '', 0, 0, 0, 1, 0, 1506698290, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-raRJuCj__fDyguBjRbYWY', NULL, 1),
(10841, 'wx_1506698307', NULL, NULL, NULL, 'A', '', 0, 0, 0, 1, 0, 1506698307, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB018f71FPY8zMg1nB8U6AEB0', NULL, 0),
(10842, 'wx_1506698666', NULL, NULL, NULL, 'J.L', '', 0, 0, 0, 1, 0, 1506698666, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wscSHHLvybGdiHMjZCvhys', NULL, 0),
(10843, 'wx_1506699100', NULL, NULL, NULL, '杨立新', '', 0, 0, 0, 1, 0, 1506699100, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yEYBFtZ1a0Zx4Dnnd7pvRI', 10839, 0),
(10844, 'wx_15066997812310', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/2yIongiauHyiavklND7wkRc3gnhgXFsIMuocXX59x5Gy5fO4aPHKfJqkoJMUViahXj3m3M9KR1EVcDKzeuCwctEhg/0', NULL, '慧  糊', '胡慧', 0, 0, 0, 1, 0, 1506699781, NULL, 1506756171, NULL, 0, 0, NULL, '15307333560', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07_naWTJqXvLcEKZrtJMBqo', 10457, 1),
(10845, 'wx_1506703009', NULL, NULL, NULL, '烨磊', '', 0, 0, 0, 1, 0, 1506703009, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_FZ1xqK85PGkmI8KSalpg4', NULL, 0),
(10846, 'wx_1506703701', NULL, NULL, NULL, '别闹我会笑', '', 0, 0, 0, 1, 0, 1506703701, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03Rd7DC99zbH7w95LIYlbqY', NULL, 0),
(10847, 'wx_1506709892', NULL, NULL, NULL, '青青宝贝', '', 0, 0, 0, 1, 0, 1506709892, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xrP8uAqgPS0hdAufQOewXM', NULL, 0),
(10848, 'wx_15067149738597', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKQVQC5yibIg4iaVWry1nzD50yTHK39vYkHgDo3Bq4dGul6AxANKrDGfOUryVQTpHcY1Syt8pbyNoVA/0', NULL, '刘', '', 0, 0, 0, 1, 0, 1506714973, NULL, 1506715020, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05lrHtuhVxfgThH_eGUcucg', 10193, 1),
(10849, 'wx_15067152226898', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqfR7O9SEYWSYfUjVYQqm3teYYmBW6RE5mrtmkX4d2TiblYKqg9cMJQeR5ZMcZZDLI9L8Hy8kiaiapvA/0', NULL, '上当的兔子爱肉包', '包宁', 0, 0, 0, 1, 0, 1506715222, NULL, 1506758686, NULL, 0, 0, NULL, '13707483072', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01eqOM-On_E-zd8u51bWbWo', 10825, 1),
(10850, 'wx_1506723495', NULL, NULL, NULL, '楚 奕', '', 0, 0, 0, 1, 0, 1506723495, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wdgn2tHMybVTAd7i9BNRvI', NULL, 0),
(10851, 'wx_1506724642', NULL, NULL, NULL, '龙峰晓戈', '', 0, 0, 0, 1, 0, 1506724642, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB014BkIVKKFrVFX5EReaZpA0', NULL, 0),
(10852, 'wx_15067246749672', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eov7bTibSYicCJOoibXH0Oiaejdr88AJ09otf7aJ1mBAmWxbeKzEI6UhI94PSCCffv2NqYibedTCLUcdHg/0', NULL, '^_^小妞', '赖海娥', 0, 0, 0, 1, 0, 1506724674, NULL, 1506945650, NULL, 0, 0, NULL, '13548738544', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB097A0NYn1694qwomKqTrfY4', 10193, 1),
(10853, 'wx_1506725409', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKUbo67MOSRKkNQPuMIib2od4J9dne2HMNWda2wEAmphSowU3SUeGHDVEo8mHJAs42Lcz5rwgtl5ibw/0', NULL, '娟子', '张娟', 0, 0, 0, 1, 0, 1506725409, NULL, 1506830047, NULL, 0, 0, NULL, '18274986787', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB055vjak7TOsCa_4zT32DE1Q', 10411, 1),
(10854, 'wx_1506725538', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/TjNwmJ3Hex8TumMAiardzWDDxZiaPgQ4KOeEiclZ9Rib7qNO0z5gU3TCRGCvwRicPbVmOVkfHqrCbPKIuXEdddVvUSA/0', NULL, '张佳', '', 0, 0, 0, 1, 0, 1506725538, NULL, 1506819192, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zcwgJWEe0kysboqHcGs2E8', 10411, 1),
(10855, 'wx_15067262625089', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ7Fd19uVrF8SCJLuIeCuYtgibL1snODXX5aXH7bSjmllzsm0yao7OmCTNWCcLs5S48lPmvXrdybQw/0', NULL, '任纯', '', 0, 0, 0, 1, 0, 1506726262, NULL, 1507180925, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00z9SN__gf7Fo5DHKDd9ezw', 10193, 1),
(10856, 'wx_1506727078', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/nXpx9icMWMic0LnBoufvFTKelnKxdrqblFsNOOGnFrAQLTa3uObETHZLTUboM46fOPyal2otD9SBgk1xXDmufQGw/0', NULL, '湘北', '杨明珍', 0, 0, 0, 1, 0, 1506727078, NULL, NULL, NULL, 0, 0, NULL, '13787870931', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB089IYNlHjid-z_PC4OHYdXs', NULL, 1),
(10857, 'wx_1506727965', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/hKb5A121ibQ5pMrQVicDlicICKyu2yqKicR2S963B8iaaApKbsKuesrRgUSk2081gOjOicLhpUrs003RDVpEDDiajCickw/0', NULL, '倩', '', 0, 0, 0, 1, 0, 1506727965, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB029jJvo3VNZOpdUAs6yZtqE', NULL, 0),
(10858, 'wx_1506728377', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIfwha2lRtPQWAiaQB1bd08Krw7GLTCTODZ6dBAyGEGgMEXEnNfbJYVzia2j4lm1JdcELO4ezbL0Mng/0', NULL, '恋上紫精灵', '杨涛', 0, 0, 0, 1, 0, 1506728377, NULL, 1506907002, NULL, 0, 0, NULL, '13787271771', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wRTKz0KaWKm1nqRmXvurhs', 10853, 1),
(10859, 'wx_1506729779', NULL, NULL, NULL, '', '', 0, 0, 0, 1, 0, 1506729779, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-TNsdxdX39MxK_HfAl_HsA', NULL, 0),
(10860, 'wx_1506729893', NULL, NULL, NULL, '红绿蓝', '', 0, 0, 0, 1, 0, 1506729893, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yQun8hWtOMN_WS99w9Q-8U', 10085, 0),
(10861, 'wx_1506730980', NULL, NULL, NULL, '王华', '', 0, 0, 0, 1, 0, 1506730980, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-avgmM3WUXjHa75PmKwWZE', NULL, 0),
(10862, 'wx_15067313655119', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKkhNjHTojF2HpOX2SwXduSMG9xVMyMmiasibSJBpqgmHOhU7hm37t3fiaARibvibJdPO447TJUnT3NYFw/0', NULL, 'A', '', 0, 0, 0, 1, 0, 1506731365, NULL, 1506731492, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07NuILdOQ-Cqh4fH6ukYTpY', 10193, 1),
(10863, 'wx_1506731704', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/iancibARpBUuuteBAwxiakicPtIjIHicg8KouHicMSppLftlc31fRJhMoKCochjjZVABusT854QjFOB2xDImAZFF3J1w/0', NULL, '一缕彩虹', '', 0, 0, 0, 1, 0, 1506731704, NULL, 1506760176, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zk--Xl9HyAFQpMjDH9jZU4', 10839, 1),
(10864, 'wx_15067323554993', NULL, NULL, NULL, '10193_3576', '', 0, 0, 0, 1, 0, 1506732355, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05-xU5FRE1kJA9oHywER5As', 10193, 1),
(10865, 'wx_1506732953', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Vlk1TcdT2YoqfKKPm33CoEzib4e9YdpEyyibgxvywucSbyebYVibJ2uyzQgS3pVNVcliaLu5GlPgPlBKibWx7mic7dQA/0', NULL, 'Ivan', '', 0, 0, 0, 1, 0, 1506732953, NULL, 1506745419, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02e4D1OeFDZreaqOITMj4hY', 10768, 0),
(10866, 'wx_15067332168935', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKuicqibS2rrgs6DEUNHHicCUw34YRDp4LgpJDlTcFnSxrSpyGYpfI6lGdob1bclMLLbrFPicL8Hw7BfQ/0', NULL, 'A合天下车行陈灿13146611128', '', 0, 0, 0, 1, 0, 1506733216, NULL, 1506733242, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0x63gPuk3ATJr6i2ngOLUy0', 10548, 1),
(10867, 'wx_1506733805', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/ffG5wBHkIM1SBuYy1pBPkKRsBXxFUhdC42RicDs55NuGwuicNo6PbGm2yu9BhY91VDFj4DX5XibXA0TEQzQibO7G2Q/0', NULL, '阿斌哥', '', 0, 0, 0, 1, 0, 1506733805, NULL, 1506733845, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yxkALDP8ZEEul2tDnhv_28', 10733, 0),
(10868, 'wx_1506734325', NULL, NULL, NULL, '', '', 0, 0, 0, 1, 0, 1506734325, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05xAhNC0A75qph0LR5wKAUk', 10839, 0),
(10869, 'wx_1506734513', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLaAwZVG1ibo25JEfyhnyz54CD1Wk0wPB9zfQ4axs0a7ThfxIeJmFRpNhicRFcmPLJ73oMVRuLMcTBQ/0', NULL, '桃源[刚明家私]开心', '', 0, 0, 0, 1, 0, 1506734513, NULL, 1507208652, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03WQrD7ueF4DrLWSBsw4Nac', 10839, 1),
(10870, 'wx_1506734827', NULL, NULL, NULL, 'molly', '', 0, 0, 0, 1, 0, 1506734827, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09dY8VXmLyTdHZ3xGQhE_U4', 10086, 0),
(10871, 'wx_1506735065', NULL, NULL, NULL, NULL, '', 0, 0, 0, 1, 0, 1506735065, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, 0),
(10872, 'wx_1506735134', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eop0WqMdLWVMGicsAlkqD7fsz7KfaqS6yoRXuDgpHbwLookrm3Wcy6VKRfwtOfXJWRHkZywCFq9Rng/0', NULL, '言甚言甚', '', 0, 0, 0, 1, 0, 1506735134, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02_ZBD4Sa5WsdXIZrAscixs', NULL, 0),
(10873, 'wx_15067353241775', NULL, NULL, NULL, '10651_8658', '', 0, 0, 0, 1, 0, 1506735324, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01sb7WE0asPiR0f2s2R-Cdg', 10651, 1),
(10874, 'wx_1506735696', NULL, NULL, NULL, '洁洁', '', 0, 0, 0, 1, 0, 1506735696, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wLNv9EYrlFe31XPsFLYOK0', NULL, 1),
(10875, 'wx_15067360971981', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/V3XEAwxI2V4L5a2TRQiaMVxcQP9Se3s8uwgibWxotaMeZM16uk7ico1AWnpLsbpK0dM8FB5crqsWSaCb5AJiaxepIQ/0', NULL, 'Zz', '', 0, 0, 0, 1, 0, 1506736097, NULL, 1506736309, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_9oq3rxHsIo0xMh30ssC0U', 10651, 1),
(10876, 'wx_15067363458595', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/kZ2sx8jFOWJ85YXmeiafq5QJzmGpwibNRib3ZQyKTPrNxQuMia79k9Ghh3p6xgpwqfRcNBY6MibTib9mkruWicktcr5RA/0', NULL, '文文', '卢娅文', 0, 0, 0, 1, 0, 1506736345, NULL, 1506758234, NULL, 0, 0, NULL, '15717310242', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB055DAwDqAhKS9PG2ia6_3ys', 10651, 1),
(10877, 'wx_1506736363', NULL, NULL, NULL, 'hei', '', 0, 0, 0, 1, 0, 1506736363, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07KaI8rNqEgLmRmc1-0RUM0', 10093, 0),
(10878, 'wx_1506736427', NULL, NULL, NULL, '国寿餐饮部', '', 0, 0, 0, 1, 0, 1506736427, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02a87SSGSsqfCBSXSX5RSFc', 10113, 0),
(10879, 'wx_15067364282524', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erdbGLzibLgoIP7qjWNOd2Y0Mpjggf8KCXcibHGOL5hJib5LY22tAyJmeiaicPGGIR9YUFMy8w8F7eAm9A/0', NULL, '夏埝武', '夏先生', 0, 0, 0, 1, 0, 1506736428, NULL, 1506736456, NULL, 0, 0, NULL, '18173115551', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01aJRygyFGTAWKTDsQO5nFU', 10084, 1),
(10880, 'wx_1506736834', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLOWucpCLACCTNCAd2GYedHYqJ9icR8bR0VynI0Vbp4wP7Wk9iagA0aKdpbciblqqTDF1KmLg4b385RQ/0', NULL, '劲', '', 0, 0, 0, 1, 0, 1506736834, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB071LpZR7BLR56nMovKHuy0A', NULL, 0),
(10881, 'wx_1506736954', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/uQIbNAoAU8EaPYeO9p7wUT591hIEQSbUwVlhNcCJ7SmXqlM6Lo2uePFRSLobpXkxtjl9xAoyicicqon3nSN3icQLA/0', NULL, '✺◟(∗❛ัᴗ❛ั∗)◞✺玲', '张熠', 0, 0, 0, 1, 0, 1506736954, NULL, 1506820024, NULL, 0, 0, NULL, '17375703797', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05ttdRKiO20ZB_Q5s9WI-SY', NULL, 1),
(10882, 'wx_1506737023', NULL, NULL, NULL, 'ゞ°tao', '', 0, 0, 0, 1, 0, 1506737023, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB066fcbT23xpTJFfHf37bTvg', 10651, 0),
(10883, 'wx_15067371936841', NULL, NULL, NULL, '10651_1962', '', 0, 0, 0, 1, 0, 1506737193, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02TOpTbBLTF_CsPPUk7M62Y', 10651, 1),
(10884, 'wx_15067375935518', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLjuSjpjA61fjqPXJefmDHqciakDUib3W7ajvAja4ibuaiclv49gto0reg4npdPIGEfeTy2eZnGSfuPhA/0', NULL, '今非昔比', '陈旺', 0, 0, 0, 1, 0, 1506737593, NULL, 1506737597, NULL, 0, 0, NULL, '13739088931', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_ydbP8ZCNLyEJD_GmHVQ_E', 10193, 1),
(10885, 'wx_15067376927648', NULL, NULL, NULL, '10085_1336', '', 0, 0, 0, 1, 0, 1506737692, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xdu5xXVExD8_s12KCQUI10', 10085, 1),
(10886, 'wx_15067378305787', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/61KyiazgcZwKUsgFCoUkSwB195nV6GRep3l7uQNOVMD4BYS51kQKL5ZTvJt73niaWHWtolLIzua3wHYkiar50CSfw/0', NULL, 'loloone', '', 0, 0, 0, 1, 0, 1506737830, NULL, 1506737843, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_uFvEd5oBbw8GFLK8zcILM', 10085, 1),
(10887, 'wx_1506737914', NULL, NULL, NULL, '帝国武警', '', 0, 0, 0, 1, 0, 1506737914, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09pgKpMIwKtuD2625cxMXJU', 10874, 0),
(10888, 'wx_15067379676373', NULL, NULL, NULL, '10876_7965', '', 0, 0, 0, 1, 0, 1506737967, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0y8SS_mk2Rb5ZbW5NBE0BpA', 10876, 0),
(10889, 'wx_15067380146027', NULL, NULL, NULL, '10651_7332', '', 0, 0, 0, 1, 0, 1506738014, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03OKHP4ROYm3g7UnPcTON6s', 10651, 1),
(10890, 'wx_15067381217335', NULL, NULL, NULL, '10590_3296', '', 0, 0, 0, 1, 0, 1506738121, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00Qho7fQglgG7RARTTC4c74', 10590, 1),
(10891, 'wx_15067381756228', NULL, NULL, NULL, '10876_1558', '', 0, 0, 0, 1, 0, 1506738175, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05rDTvZL5e8s2yXX8OMB4DY', 10876, 1),
(10892, 'wx_15067382753460', NULL, NULL, NULL, '10651_7310', '', 0, 0, 0, 1, 0, 1506738275, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01S_xarSBEGX0Jdu23oCz40', 10651, 1),
(10893, 'wx_15067383536369', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/SsPEoZTVvcjiaj0nFeNZFZQygIdtezmHycovfYiaqLhk7OMJlk1TOneHHb8iamzpWTGXZHQKdrV241wCxyTkWR73A/0', NULL, 'Kiss《蝎子》', '', 0, 0, 0, 1, 0, 1506738353, NULL, 1506738368, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09Nlb5nlVQdkK-IiPX3bBBk', 10590, 0),
(10894, 'wx_15067383963427', NULL, NULL, NULL, '10876_2428', '', 0, 0, 0, 1, 0, 1506738396, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02IoZvGgDafEu4WpMNKu3rE', 10876, 1),
(10895, 'wx_1506738451', NULL, NULL, NULL, '袁帝', '', 0, 0, 0, 1, 0, 1506738451, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-0oLm_lVecdxBQGkHMlpjQ', 10085, 0),
(10896, 'wx_15067386106314', NULL, NULL, NULL, '10876_8027', '', 0, 0, 0, 1, 0, 1506738610, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02vCFafKImduSlXA2n1aVmI', 10876, 1),
(10897, 'wx_1506738678', NULL, NULL, NULL, '灵芝', '', 0, 0, 0, 1, 0, 1506738678, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04eVT7-kcN96VfeS1qQC0X0', NULL, 0),
(10898, 'wx_1506738680', NULL, NULL, NULL, '万象板材.好万年板材13135011688', '', 0, 0, 0, 1, 0, 1506738680, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03s6BcXNF8k0fAZ_W8a5328', 10093, 0),
(10899, 'wx_15067390469406', NULL, NULL, NULL, '10651_5051', '', 0, 0, 0, 1, 0, 1506739046, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0y-SOBH7KFdljCCaLwFeLdA', 10651, 1),
(10900, 'wx_15067391031504', NULL, NULL, NULL, '10876_4090', '', 0, 0, 0, 1, 0, 1506739103, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05t9HUbpXtekR2vJXzJXqrE', 10876, 1),
(10901, 'wx_1506739236', NULL, NULL, NULL, '◆◇回忆、终究是回忆つ', '', 0, 0, 0, 1, 0, 1506739236, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03zg8g1Ui8A1qFnASvyKn3M', NULL, 0),
(10902, 'wx_1506739339', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLvfic0yoAJYvcbXYNJu9a678mdBmibcKhCceNThscjHaja9XVwKrngGiaHyWCyIBMT1rYjOpaw2ibcxg/0', NULL, '欢乐木子', '', 0, 0, 0, 1, 0, 1506739339, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08bHobbXT59fyXollWbB4_s', NULL, 0),
(10903, 'wx_1506739369', NULL, NULL, NULL, '王敏', '', 0, 0, 0, 1, 0, 1506739369, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01V5rudv5HCa0nLrtODF8jI', 10872, 0),
(10904, 'wx_15067395452983', NULL, NULL, NULL, '10651_7875', '', 0, 0, 0, 1, 0, 1506739545, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xM84Sl5cCuEibYCcdQPKTY', 10651, 1),
(10905, 'wx_1506739546', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/bR7dxD7K7dvL3xJKkmiaPdjMwJyiaPibyb3k5wYZL70LHqubjK4Ae5qM09wibE9l8PngK0pcSudQzkoLS8n0Sg4PpQ/0', NULL, '陈永', '', 0, 0, 0, 1, 0, 1506739546, NULL, 1507249813, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01-Fgvz8Jtn3BotjhvBQKJo', 10881, 0),
(10906, 'wx_1506739632', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIyzxJjMdthb6j3WvednXRic0fFgJeibUdMyuwaoJNNZF3hibmIrnhics8HEkNjdyQlagFb4t9PeTUazA/0', NULL, '晓杰', '罗杰', 0, 0, 0, 1, 0, 1506739632, NULL, 1506767186, NULL, 0, 0, NULL, '13786197283', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01PXC27XJbn6hetphROu7Lo', 10387, 1),
(10907, 'wx_1506739699', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/PrghAhO9C0bS4bvBINxnZGCAbjWPg9dqaUBoOXeDDnV54ny8wMoslZD3ckiaAkwv83U8k1971vBnwL6oNV5Tclg/0', NULL, '金朋-肖', '', 0, 0, 0, 1, 0, 1506739699, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08sVNkcL38T870pKJVcXF6s', NULL, 0),
(10908, 'wx_1506739794', NULL, NULL, NULL, '朱磊', '', 0, 0, 0, 1, 0, 1506739794, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0ziESbCKBeXReTzPzyR_MEc', NULL, 0),
(10909, 'wx_1506739803', NULL, NULL, NULL, '绿叶·花儿13973226094', '', 0, 0, 0, 1, 0, 1506739803, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05fIgPAoRoJfWPgM_5oL-kk', 10881, 1),
(10910, 'wx_1506739899', NULL, NULL, NULL, '金朋医疗器械（阙景晴）', '', 0, 0, 0, 1, 0, 1506739899, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0707BfSNg0Bha7mgnHIirGk', 10907, 0),
(10911, 'wx_15067399527632', NULL, NULL, NULL, '10651_6921', '', 0, 0, 0, 1, 0, 1506739952, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_bOLl9e3h5BECJSuWNthMQ', 10651, 0),
(10912, 'wx_1506739966', NULL, NULL, NULL, '陈元元火龙果', '', 0, 0, 0, 1, 0, 1506739966, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09tZIlccJGuOtE-uN94tYog', 10907, 0);
INSERT INTO `bao_users` (`user_id`, `account`, `password`, `face`, `ext0`, `nickname`, `truename`, `integral`, `prestige`, `money`, `rank_id`, `gold`, `reg_time`, `reg_ip`, `last_time`, `last_ip`, `closed`, `uc_id`, `email`, `mobile`, `ping_num`, `post_num`, `invite1`, `invite2`, `invite3`, `invite4`, `invite5`, `invite6`, `token`, `p_openid`, `pid`, `is_subscribe`) VALUES
(10913, 'wx_1506739982', NULL, NULL, NULL, '晴', '', 0, 0, 0, 1, 0, 1506739982, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05lqrvFeGlAyLVnrIFkdAd8', 10907, 0),
(10914, 'wx_1506740076', NULL, NULL, NULL, '宝贝妈咪', '', 0, 0, 0, 1, 0, 1506740076, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00AQaL9cP8CSMErgbvHTeXY', NULL, 0),
(10915, 'wx_1506740137', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Fh0aG5eHbiahxxbNibNqEDYIibHsp9v890xJC7njia2UgLCbIQyccbpvGwLGEUiaWXROrZE5knfBzWMWUEZpoPVXEvw/0', NULL, '美丽人生', '', 0, 0, 0, 1, 0, 1506740137, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xg9srt3IjA_S-Q0qrrjRc8', NULL, 0),
(10916, 'wx_1506740138', NULL, NULL, NULL, '闪闪红星', '', 0, 0, 0, 1, 0, 1506740138, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yRf3sMOe07Q4uYTfDhw9-o', NULL, 0),
(10917, 'wx_15067401471251', NULL, NULL, NULL, '10651_6935', '', 0, 0, 0, 1, 0, 1506740147, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09ZlA_W5lHpmpK4P_v_pZ5Y', 10651, 1),
(10918, 'wx_1506740194', NULL, NULL, NULL, '小微', '', 0, 0, 0, 1, 0, 1506740194, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0917EXOkXgZg57u7An95Hp4', NULL, 0),
(10919, 'wx_1506740244', NULL, NULL, NULL, '虎子妈', '', 0, 0, 0, 1, 0, 1506740244, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01DlSU-iWh-2AiZGldI_6jw', 10463, 0),
(10920, 'wx_1506740255', NULL, NULL, NULL, '动主了', '', 0, 0, 0, 1, 0, 1506740255, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02GysUcXAhJCmgKjCsjT0UE', 10463, 0),
(10921, 'wx_1506740294', NULL, NULL, NULL, ' 珍妮', '', 0, 0, 0, 1, 0, 1506740294, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07qV2K92hjVzm9fADYOLNmc', NULL, 0),
(10922, 'wx_15067403165283', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/ygq7iaCTmFrTLTPicDWk2HhQ4Nvg0amicOZI95Be7P6AFVSm9MIzViaTgBlPDPH9A7EAZ131NaD25unTN7rVYPtuYQ/0', NULL, '恩哥', '', 0, 0, 0, 1, 0, 1506740316, NULL, 1506740374, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01_V6kiULA1-PKEjM4CJcpk', 10651, 1),
(10923, 'wx_15067403264896', NULL, NULL, NULL, '10651_3292', '', 0, 0, 0, 1, 0, 1506740326, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02FyvdIgfZ0v43gcrPUYxkY', 10651, 1),
(10924, 'wx_1506740414', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/ZxfdlQiaa4E9RvX89ndBzmfgraEbrbRgurVA5AHmdHyptAA47DDeZOthhv6bBFCEhQhrfnEIM6icicFmPtCBic7Viag/0', NULL, '', '', 0, 0, 0, 1, 0, 1506740414, NULL, 1507351602, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01PODuWnNsUnEn7SqdY-NCE', 10189, 0),
(10925, 'wx_15067405461886', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/dicU2DzHQsjOVib69zmDxlQhtqpNaFW66fEMvGMWRkCTv0T6cnhcD9DmAy4mM3LDBxKIRQ5Cf7mPBsqZxNZCUMoA/0', NULL, '大奶牛', '', 0, 0, 0, 1, 0, 1506740546, NULL, 1506740555, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_rMW2Gan5d4IsWrqbNBiP8', 10271, 1),
(10926, 'wx_1506740635', NULL, NULL, NULL, '甜蜜99', '', 0, 0, 0, 1, 0, 1506740635, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02yzloG2EN0RqPSmgkngq-Y', NULL, 0),
(10927, 'wx_1506740651', NULL, NULL, NULL, '小新', '', 0, 0, 0, 1, 0, 1506740651, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06oUtYuk5m4jOpTJjlw7GnQ', 10768, 0),
(10928, 'wx_1506740668', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/1bVVPxy2jtGqTnhEcvL738iaZvza5lBSLLEibbtiarKSCqcib7L3P9I7W7LgZzEAprWDfQIggHSrXUOqsQ8KFJeQxg/0', NULL, '情深缘浅', '', 0, 0, 0, 1, 0, 1506740668, NULL, 1507000751, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09KJyU-3gMoU-AZt41diGns', 10730, 1),
(10929, 'wx_1506740795', NULL, NULL, NULL, '兰猫', '', 0, 0, 0, 1, 0, 1506740795, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02iyUOowxpo1tUB-fF-LVpk', 10387, 0),
(10930, 'wx_15067408248360', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/YZI082gUHiaYsrbuZXmAVBbvnvVEpFFic63EwGk3rK0eiaUpL0pWNcZ0kmuLicVFj8lEU7iaWsvQZWUZaWQwqBjEjLw/0', NULL, '海绵宝宝只是爱笑', '', 0, 0, 0, 1, 0, 1506740824, NULL, 1506740877, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wTU7wQzUg2yyoWVM7ZKnA0', 10590, 1),
(10931, 'wx_1506741148', NULL, NULL, NULL, '汉寿承德', '', 0, 0, 0, 1, 0, 1506741148, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06MlyF2uevguQh5LxIuGbeA', NULL, 0),
(10932, 'wx_1506741225', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/soIqerKr5enjvuS7olyYHjPcfdhicLSGBGtpHiasEY4nXF7chQ6FdF7lEqe2ppia3hiadVY5qjUia13PR6fZC3iatZNw/0', NULL, '邓凤姣', '邓凤姣', 0, 0, 0, 1, 0, 1506741225, NULL, 1506818632, NULL, 0, 0, NULL, '13974980828', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03zGjrwO_LNIh8LoxIpmlyE', 10387, 1),
(10933, 'wx_15067413888302', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/pnknopwlpg0XnMf5VX2h9oLKEYafX15W9VkdJ2yLe24IlaZxHGaQk6AXrGucK6ooShdVgpZfaWC2tgia1I4XDQA/0', NULL, '千亿太阳', '刘艳南', 0, 0, 0, 1, 0, 1506741388, NULL, 1506748160, NULL, 0, 0, NULL, '13973131359', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05NZdzCppyeoF4_Bi_tMOo8', 10085, 1),
(10934, 'wx_15067414095441', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/mHibFJhnKJC681juDpiccB3EMbFib93GBqAmibZMTFWoD2ToeCggl8icBQia31bj0S0NuzkUZEtYyonbKJ0M4ylDVF2w/0', NULL, '林玲', '', 0, 0, 0, 1, 0, 1506741409, NULL, 1506741478, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB015n6ypIFPBQBNJzaYJGmFs', 10085, 1),
(10935, 'wx_15067416648765', NULL, NULL, NULL, '10590_1809', '', 0, 0, 0, 1, 0, 1506741664, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xsCzPuDk6hm4mmEXzgWRiM', 10590, 1),
(10936, 'wx_15067417171161', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKjUQKXcdj9tpns0xFS7nicNzn7KsrhAdicCYIxwqIiaX5PKQHLs7P9aEuITcBaFfz6ICmprOItgRjow/0', NULL, '丫丫-兜兜妈', '申娅晴', 0, 0, 0, 1, 0, 1506741717, NULL, 1506741727, NULL, 0, 0, NULL, '18973162228', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-OOm50zo_qHblhwmQV2-Jw', 10085, 1),
(10937, 'wx_1506741856', NULL, NULL, NULL, '苹果', '', 0, 0, 0, 1, 0, 1506741856, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zc0gMXRu2uZpzHjyAW5KxY', NULL, 0),
(10938, 'wx_15067420213266', NULL, NULL, NULL, '10343_4417', '', 0, 0, 0, 1, 0, 1506742021, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00zN6Qj03hhUnFCEqZ39Bgo', 10343, 1),
(10939, 'wx_1506742076', NULL, NULL, NULL, '顾小妞爱菲儿', '', 0, 0, 0, 1, 0, 1506742076, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-r1qDpI6DJ4TQWv5BGEewY', 10463, 0),
(10940, 'wx_15067421146361', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/hv2mnlMicQCbsdAOoFfzeSUUEfdwEp1ygiaId05icEQFXuOBuiaDxQARPGNpuC51Q3V0mKGNRDYXfibxH0XZic1qIHeQ/0', NULL, '木须', '', 0, 0, 0, 1, 0, 1506742114, NULL, 1506742479, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yfqWw7_4jShZ5zPY6PQ7Dc', 10936, 1),
(10941, 'wx_15067421434519', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLdSAwwB3j320yzdFXgViacL1JOOulpfiaA6nRvIGPp2Px5vbBKliapApgySmLP0ar2nzppFT3lpbQ3w/0', NULL, 'andy.lu', '', 0, 0, 0, 1, 0, 1506742143, NULL, 1506742149, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB061BWRQPN7ErTc0zQC1uT9g', 10085, 1),
(10942, 'wx_15067421837390', NULL, NULL, NULL, '10085_1406', '', 0, 0, 0, 1, 0, 1506742183, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wO9BKf9vdJOxVR3JcMsuuY', 10085, 1),
(10943, 'wx_1506742383', NULL, NULL, NULL, '巴伊老爷吉祥', '', 0, 0, 0, 1, 0, 1506742383, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03NJjLB6WEe1L755vR8OaL4', NULL, 0),
(10944, 'wx_15067425576766', NULL, NULL, NULL, '10590_4965', '', 0, 0, 0, 1, 0, 1506742557, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04dVNPqQgUgyDEt1dGH3tKg', 10590, 1),
(10945, 'wx_15067425634448', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK31tjIub6HP1kFeWa70ic3PlTRicvSPs2FEEnrlTicGXJFAZBNrMy2OEPeDqjfh1fiapGxMMwh4D8EibA/0', NULL, '', '', 0, 0, 0, 1, 0, 1506742563, NULL, 1506742585, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00LlUTnGn789-5l7PQyJnHc', 10085, 1),
(10946, 'wx_15067427067870', NULL, NULL, NULL, '10936_1044', '', 0, 0, 0, 1, 0, 1506742706, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_yt7RuniK5NoF5gBFFR2Cw', 10936, 1),
(10947, 'wx_15067430861049', NULL, NULL, NULL, '10936_9016', '', 0, 0, 0, 1, 0, 1506743086, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yU3z5URsgPqcen6pQnqy_U', 10936, 1),
(10948, 'wx_15067431384311', NULL, NULL, NULL, '10936_9241', '', 0, 0, 0, 1, 0, 1506743138, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zsxbWL2HkPvJYwR8dr5N54', 10936, 1),
(10949, 'wx_15067432903782', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/uibel6yEuBv1wOZcbo3a8ObzYDqeibZXv59NQPd8w7vr3oyLvesIzLicj2EA24Xpnwqv9t4iaXFBia6VydPvqWibibx1A/0', NULL, '菱角', '', 0, 0, 0, 1, 0, 1506743290, NULL, 1506743299, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02lHY0YkyS4Xmz8zrEJ2xBM', 10936, 1),
(10950, 'wx_15067434441216', NULL, NULL, NULL, '10085_9440', '', 0, 0, 0, 1, 0, 1506743444, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wt0wGP0lcW3n7b0vfyJ5zU', 10085, 1),
(10951, 'wx_1506743453', NULL, NULL, NULL, '王丹', '', 0, 0, 0, 1, 0, 1506743453, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08tQvFEVxHHLYv_JAXDh1E4', 10093, 0),
(10952, 'wx_15067434679457', NULL, NULL, NULL, '10516_6610', '', 0, 0, 0, 1, 0, 1506743467, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zOZHBJvY7ZkFCIH0fLMKDU', 10516, 1),
(10953, 'wx_15067435367412', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/OwZuBRbVUkyRsecAPhhAiap1sSpOtZbs8ABewYbVibf0DRiag9Uj5Xf4vPPnb3VhELH5WLYDZiaQqmEm4s89ceUGDQ/0', NULL, '曾艳华-美的空调18075185273', '', 0, 0, 0, 1, 0, 1506743536, NULL, 1506743561, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xFVtzWWKI7zSKLi68HNIj8', 10089, 1),
(10954, 'wx_1506743893', NULL, NULL, NULL, '严小玲', '', 0, 0, 0, 1, 0, 1506743893, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06dAERhmAkB2RPdAFeS9isI', NULL, 0),
(10955, 'wx_1506743894', NULL, NULL, NULL, NULL, '', 0, 0, 0, 1, 0, 1506743894, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, 0),
(10956, 'wx_15067440256821', NULL, NULL, NULL, '10936_7094', '', 0, 0, 0, 1, 0, 1506744025, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09RKrNsQ2n9Bu-jLwDUSDn0', 10936, 0),
(10957, 'wx_15067441778829', NULL, NULL, NULL, '10516_4167', '', 0, 0, 0, 1, 0, 1506744177, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wY4m7NehpHtqAH-tfIdP-w', 10516, 1),
(10958, 'wx_15067442163818', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/MCvY6ibuXWfD7hvGU6BnA4RicVvjIzcCjhWVyticXdpiaf8pibmYMDBdon8ibvPZOMUlI5AWJpBNQcJibHRP3TIRmHfJg/0', NULL, '宁', '周宁', 0, 0, 0, 1, 0, 1506744216, NULL, 1506744229, NULL, 0, 0, NULL, '17752881112', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-KesQMgD4FMr8U8--eoQvw', 10341, 1),
(10959, 'wx_15067442916167', NULL, NULL, NULL, '10516_4312', '', 0, 0, 0, 1, 0, 1506744291, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zxxf4D6ehXYTqvG1g5bOCc', 10516, 1),
(10960, 'wx_15067443039908', NULL, NULL, NULL, '10936_6850', '', 0, 0, 0, 1, 0, 1506744303, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02i7K270LXFZSqufNUAiDqo', 10936, 1),
(10961, 'wx_15067447211519', NULL, NULL, NULL, '10516_7008', '', 0, 0, 0, 1, 0, 1506744721, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04_7xbckwbHMBWNxyQMf160', 10516, 1),
(10962, 'wx_1506745369', NULL, NULL, NULL, '小熊', '', 0, 0, 0, 1, 0, 1506745369, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09zaaUIOCTHEdR0pMlS1iTc', 10387, 0),
(10963, 'wx_1506745499', NULL, NULL, NULL, '惜', '', 0, 0, 0, 1, 0, 1506745499, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0z3Bk0EB5Gwfs3rp2qu_KLY', NULL, 0),
(10964, 'wx_1506745575', NULL, NULL, NULL, '中宁～志华18627555559', '', 0, 0, 0, 1, 0, 1506745575, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wCPd67bLUB2hzq4zy2D_oU', 10387, 0),
(10965, 'wx_1506745922', NULL, NULL, NULL, '沁心', '', 0, 0, 0, 1, 0, 1506745922, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB085-Hn-c5UiQNOdlKnsyXPs', NULL, 0),
(10966, 'wx_15067459348839', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKKhXoGksjaLU8fH4SJ9IiaYHrSeLoDLibxuevejnxJr6fttWGYFvqNM9Kj3ygrM6sj6icK8lwfaNs9g/0', NULL, 'A中南四驱二手车行绝缘18674866956', '', 0, 0, 0, 1, 0, 1506745934, NULL, 1506745948, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zm26VPJptA9wlRaE5OWgsM', 10089, 1),
(10967, 'wx_15067461978678', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/BwfuPESyBml1ljzqAOWU7tqUict8waav4MticwG1Vqia4UXo9lbcafDrCmbR5FH0iaicIdMMZIafZauwHYuFSRhs1Ww/0', NULL, '且行且珍惜', '', 0, 0, 0, 1, 0, 1506746197, NULL, 1506746233, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03qe1ydyhKZ7iUc5xNr6PrA', 10193, 1),
(10968, 'wx_15067462033065', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/ejH5Kh9NVaYWLrRsSCicpfL57ZicMASLLdNzPMK9TbX1icZ5sZDFXMndAflOibkaSzEF3pMwXbobQn6JibQ9FicibeXaw/0', NULL, 'YOU', '范友', 0, 0, 0, 1, 0, 1506746203, NULL, 1507427105, NULL, 0, 0, NULL, '13873105127', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04E_Ny_RLO1YPGjCa4Iw1C4', 10193, 1),
(10969, 'wx_15067462141706', NULL, NULL, NULL, '10516_6642', '', 0, 0, 0, 1, 0, 1506746214, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0914Bu9h5LquTT99GxUdLyc', 10516, 1),
(10970, 'wx_15067463467347', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Sd4jEhHGho641ibSCccicDeNeLTBl1QHeR7aqp5Jk3xnnaVueoUickBdP5Lvaib1PiayH5iaDic2TGV7rul7xXtjVSib5g/0', NULL, '萍安', '', 0, 0, 0, 1, 0, 1506746346, NULL, 1506746401, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB070jRUk5b7ptzPv_W5_4HkI', 10193, 1),
(10971, 'wx_15067464121099', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ19UmygmZsYTEFMGokgY8RXY9njdHWDsqCJd1N1algKd1EnzNx35hkcNk0TYEaTfgS0ib45dDUg0w/0', NULL, '竹叶沙沙', '', 0, 0, 0, 1, 0, 1506746412, NULL, 1506746423, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04pGZmdo7OcooExdEMU5LZQ', 10193, 1),
(10972, 'wx_1506746643', NULL, NULL, NULL, '游魂', '', 0, 0, 0, 1, 0, 1506746643, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03BC4PVSxLTq9c_cQvcwL5g', NULL, 1),
(10973, 'wx_1506746915', NULL, NULL, NULL, '自由自在', '', 0, 0, 0, 1, 0, 1506746915, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04cqmp_dCHq3mdybxil8fGs', NULL, 0),
(10974, 'wx_1506747080', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/JUxl1nttCEjJk44J3cEibibAGJGr2SMibG4dyjic0Mj9o1908MUIktDbltqegISo60AkdX4iaYIWm3O5hvrT8el2sibA/0', NULL, '姜娣子', '', 0, 0, 0, 1, 0, 1506747080, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zE3zVuRaFo7vfJaFemWuqs', NULL, 1),
(10975, 'wx_15067472805705', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKPt8nLhz9pbUfof7PMjseicHuo6z4RPWHSGgniavFg0qqsDPUiaUWz3xzcERdq3oF5Q69lNN6vYvkZg/0', NULL, ' swallow ', '', 0, 0, 0, 1, 0, 1506747280, NULL, 1506747295, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05-bb-Hcf1D6kpL0klDjukw', 10496, 1),
(10976, 'wx_15067474049715', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/ibacddv1lNV79IAeIvIVMHVutAF8s1EgiaQzpJ40ygfU8euAvnSLLwtOZ7LZ21H3VUPHAjQfeSfMyPlKxwgjzPibA/0', NULL, '王丽', '', 0, 0, 0, 1, 0, 1506747404, NULL, 1506760727, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xvPh-gjJI2SM_RtzUOJYbc', 10468, 1),
(10977, 'wx_15067474141808', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibPvFyeRXqcZ3CgMzlQbbGtTibOC12f8fdOmLYe6Ep7Ran5lVSic4jnO5MfanEMx1hrgiab5OhoTLNg/0', NULL, '糖糖', '', 0, 0, 0, 1, 0, 1506747414, NULL, 1506747430, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08Aohh2Kl25Z-cdEeP4aeuk', 10063, 1),
(10978, 'wx_1506747460', NULL, NULL, NULL, '糊涂的过', '', 0, 0, 0, 1, 0, 1506747460, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04jOD36wixtKh9NpvQj4wH4', 10093, 0),
(10979, 'wx_15067475759239', NULL, NULL, NULL, '10701_1869', '', 0, 0, 0, 1, 0, 1506747575, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03RS6ZcpHTEJF9JtOly617s', 10701, 0),
(10980, 'wx_15067475886426', NULL, NULL, NULL, '10461_5341', '', 0, 0, 0, 1, 0, 1506747588, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05UkwiyEpkS08eJH0ghDQBw', 10461, 1),
(10981, 'wx_15067477368274', NULL, NULL, NULL, '10461_5920', '', 0, 0, 0, 1, 0, 1506747736, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0x3gM1N-u5Sv_MaMIqnHWPA', 10461, 0),
(10982, 'wx_1506747852', NULL, NULL, NULL, '日杂用品店', '', 0, 0, 0, 1, 0, 1506747852, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zsxH0kB4oUi3lnbfS0qRR4', 10093, 0),
(10983, 'wx_15067481342562', NULL, NULL, NULL, '10560_6064', '', 0, 0, 0, 1, 0, 1506748134, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wHI3aWnBKbw0VkJkpwoJIU', 10560, 1),
(10984, 'wx_15067481741207', NULL, NULL, NULL, '10651_2148', '', 0, 0, 0, 1, 0, 1506748174, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03NdQ-ch-h8-jny6o51QTWk', 10651, 0),
(10985, 'wx_15067484029875', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/TADD2cYphDGAaU8TscZgg9JDMiaibuUNSI7pLVyppoByicJF3kbl5qopbuvJhhJHSicZoIjvRAGFgjmcIKBuAOKQjg/0', NULL, '时光无心', '', 0, 0, 0, 1, 0, 1506748402, NULL, 1506748413, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_2Qa0XSLwosUp2SMbhOA6Q', 10085, 1),
(10986, 'wx_15067484739163', NULL, NULL, NULL, '10985_3815', '', 0, 0, 0, 1, 0, 1506748473, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yxnWBWF6Uuj28r3vr6xdeg', 10985, 1),
(10987, 'wx_15067489059044', NULL, NULL, NULL, '10085_5580', '', 0, 0, 0, 1, 0, 1506748905, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB020XvRNZvrA5BrnQPXZahqY', 10085, 1),
(10988, 'wx_1506748952', NULL, NULL, NULL, '雾雨', '', 0, 0, 0, 1, 0, 1506748952, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zDcXrditG77V9dcRF-QXr4', NULL, 0),
(10989, 'wx_15067492264739', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/mJgy1BfjtjPnsLj59bs9dgoEa71yxia5CgRZrcu9QZZZHF4pDWFo61GxXdBzccu2g0uhRI8ZDYF4xt4p5SOk99Q/0', NULL, '玉颜', '', 0, 0, 0, 1, 0, 1506749226, NULL, 1506749262, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-yLGO0nY_ruOtGXhnV3nhc', 10968, 1),
(10990, 'wx_15067498321708', NULL, NULL, NULL, '10258_3532', '', 0, 0, 0, 1, 0, 1506749832, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wcLZs9JZ5m_Ds-OlSmdk48', 10258, 1),
(10991, 'wx_15067498838700', NULL, NULL, NULL, '10258_9940', '', 0, 0, 0, 1, 0, 1506749883, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xapFg69pPNSeJ5JTBxuNf0', 10258, 1),
(10992, 'wx_15067499062812', NULL, NULL, NULL, '10258_7599', '', 0, 0, 0, 1, 0, 1506749906, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-4IA66m2cc2GZ4qkIcjrfI', 10258, 1),
(10993, 'wx_1506749970', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/PQCciblvEQuiaObBM00DswZulTyTiayOuibXuywVibfN26FiaqKQsIfYS9g6FAJxZicvqAgIqVYPru1ElSfDicG6Y3G3iaw/0', NULL, 'shelley', '', 0, 0, 0, 1, 0, 1506749970, NULL, 1506858431, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09iikO6qI5vo9Zv5xvUIXE4', 10831, 0),
(10994, 'wx_15067499841409', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Lh7libTvPGyQNoIdHrGFEM0ZUdGic8O7oJPFk0U8ibVLLMIowneFKebHNTicYNZBB2T1WaKYZlebQB6Dn3WzflDBbQ/0', NULL, 'A00不记得了', '', 0, 0, 0, 1, 0, 1506749984, NULL, 1506750011, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07RyO5BLZD7QGsFF1sxM2FE', 10085, 0),
(10995, 'wx_1506750023', NULL, NULL, NULL, '何昌', '', 0, 0, 0, 1, 0, 1506750023, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07D43PaCjov7aZ-c69ZEqWc', 10902, 0),
(10996, 'wx_15067500717257', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqb8SVnFOpax0P63LwzCy7AIIdbZ8cnHP1WlILiaFwkTNh9nrvvBu83miaxvPmO7ibwh0cYxFkTtXUiag/0', NULL, 'ヤwen╅す文', '', 0, 0, 0, 1, 0, 1506750071, NULL, 1506750083, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09-Mm5s2N4mUKrERFy7IEdM', 10085, 0),
(10997, 'wx_1506750103', NULL, NULL, NULL, '海马', '', 0, 0, 0, 1, 0, 1506750103, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-lgtVuawbdrdjY17aBwsgw', NULL, 0),
(10998, 'wx_1506750432', NULL, NULL, NULL, '一一', '', 0, 0, 0, 1, 0, 1506750432, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07nZ_jRGYPTNp4PjmTyn728', NULL, 0),
(10999, 'wx_1506750488', NULL, NULL, NULL, '529', '', 0, 0, 0, 1, 0, 1506750488, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00ZaUCLdZqFTnqh5IgBfCMY', 10998, 0),
(11000, 'wx_15067509955370', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/UVlfwia03ZcQIpBYQVlT7P3sqicw4OUJZ4hEyQt7rHxG4bWmIVeQHzKFOM6MrcFvHiaRSmicqibicBZwhYAw2iclxBvsQ/0', NULL, '轩轩妈(吴姐)', '', 0, 0, 0, 1, 0, 1506750995, NULL, 1506751017, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02j-8hZvFyUCFgV5pwKpplk', 10457, 1),
(11001, 'wx_1506751166', NULL, NULL, NULL, '涂涂', '', 0, 0, 0, 1, 0, 1506751166, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_Qhil3XZ5YBvYUTT5G0qoY', NULL, 0),
(11002, 'wx_1506753386', NULL, NULL, NULL, '红雨', '贺红宇', 0, 0, 0, 1, 0, 1506753386, NULL, NULL, NULL, 0, 0, NULL, '15874077212', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yk6I3iZ-TcSCTODnt0uV88', 10853, 1),
(11003, 'wx_1506753494', NULL, NULL, NULL, '小古', '', 0, 0, 0, 1, 0, 1506753494, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07f333GWgJ8urYi4Qbxuhg0', 10374, 0),
(11004, 'wx_1506753840', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/WiaatoVvMXwxPvqbSsj3e9pJ9ErxIxYzwHxS8rx0yVfxwNToxNoXFKiaTvr7HzqxjE2OWvtTY0NxwjibSb9M5UeIQ/0', NULL, '兔子', '曹博文', 0, 0, 0, 1, 0, 1506753840, NULL, 1506813907, NULL, 0, 0, NULL, '13787141816', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04fN_cbHZrFs0HT6zf_U13g', NULL, 1),
(11005, 'wx_15067544046818', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJNAQic2GmDfibBED0RHyZ86gUJibN5AzKSPU1fgv7A69223kBYzTbiaCuZiacINcISqrxv3eiaibUHmMicyQ/0', NULL, '深空失忆.', '', 0, 0, 0, 1, 0, 1506754404, NULL, 1506754416, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02VeTa6goHewpQtw0EW2U9A', 10084, 0),
(11006, 'wx_15067545421932', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK2LQJJqvGX6EHnQsRV8Y5icmALsFwXMrEYWsnZJgJRGKGgubQ5Uzxw0BcM0AqpCUJljkzmthmWSOg/0', NULL, '胡佳', '胡佳', 0, 0, 0, 1, 0, 1506754542, NULL, 1506754579, NULL, 0, 0, NULL, '18007315277', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08OOf4bRIW0bZ2HLbM-YHQw', 10461, 1),
(11007, 'wx_1506754876', NULL, NULL, NULL, 'Thomas', '', 0, 0, 0, 1, 0, 1506754876, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zggO3WzzHSEHeYLwlGjDHI', 10853, 0),
(11008, 'wx_15067553523849', NULL, NULL, NULL, '10706_2646', '', 0, 0, 0, 1, 0, 1506755352, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02oqelo80-Fi1h6AZIaXLAY', 10706, 1),
(11009, 'wx_15067554895719', NULL, NULL, NULL, '10706_1123', '', 0, 0, 0, 1, 0, 1506755489, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xsLcqHthD7uLh7DaRfb1Rg', 10706, 1),
(11010, 'wx_1506756017', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKCbnOvEatUN53IRiatpsBJ51wBUJjEIicaUkQwcRmQ9ka6yDygN90mILn2hibnZLja7JsTKV9wxc3FA/0', NULL, '小胖 哥', '张壮', 0, 0, 0, 1, 0, 1506756017, NULL, 1506826983, NULL, 0, 0, NULL, '13975869230', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0z4uGhRKOgsLo-FnHKC3QoM', 10853, 1),
(11011, 'wx_1506756338', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIavBvxZz8M4SyTzxaPAqykHwM2rQfzib1oJRgibTicPjibThHKnsqPkdK2aRDlfibbnAAmOCvDV6iaWlFg/0', NULL, '小雅', '', 0, 0, 0, 1, 0, 1506756338, NULL, 1506768987, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07MTn5K1PLGZ5E6Y-bwEsgg', 10853, 1),
(11012, 'wx_1506756352', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ3Bg711Fe9YuHXCiaaibHC7scSKfLIhTNlgqFCH0GQotBn6u1OLhJG7e0tW2x8llG0T0kz5PjASpCA/0', NULL, '小张', '', 0, 0, 0, 1, 0, 1506756352, NULL, 1506756353, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0w7JKstDYg9tW4TzCD3WFA4', 10853, 0),
(11013, 'wx_15067565427148', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJzVbpVFm6icw9JESbPqOd21z1SpjA3mkZ5eXPKJgc1Y682NkDUyshO6IMibjbLrqARw8k8owNoTPhQ/0', NULL, '曼琳', '', 0, 0, 0, 1, 0, 1506756542, NULL, 1506756552, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09d67VAhb3qGUWizOwlzRv8', 10706, 1),
(11014, 'wx_15067570495659', NULL, NULL, NULL, '10725_2736', '', 0, 0, 0, 1, 0, 1506757049, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0z-TRaguRCLCyvO5i8PTEZY', 10725, 1),
(11015, 'wx_15067570632652', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/oUa9Rd3wiaXv53yk7mFicSFfTS8pv1bNEDKJlRpjCibree1EVbpk0ruSOByPXEQw6WvDQJRBd7AZYwibsusS5Qjiakg/0', NULL, '陈姣', '', 0, 0, 0, 1, 0, 1506757063, NULL, 1506757088, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01LogRJiEd0YIKKFz7_blB4', 10193, 1),
(11016, 'wx_1506757519', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJIN4lTa881LHKiaeRdH6wrR3oKLkOXgCuOIbTB5QVnjH8mNIKicCibvry3pWk1rEG7dl9RzfTo8o5tg/0', NULL, '文浩', '文浩', 0, 0, 0, 1, 0, 1506757519, NULL, NULL, NULL, 0, 0, NULL, '13469041058', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06M_CYBoLac7ajmV2ljenz0', NULL, 1),
(11017, 'wx_1506758147', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKTaK9MlElLufsczyZSX5FMVhPvWGoMvwcMUpVtiavcRonByO2YNOqu8uQl9s8bb6L1iartiaskCJ3Yg/0', NULL, '绿水青山', '', 0, 0, 0, 1, 0, 1506758147, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07ysVxH6LS-XxLd5YoV0PrA', NULL, 1),
(11018, 'wx_1506758183', NULL, NULL, NULL, '波波', '', 0, 0, 0, 1, 0, 1506758183, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_be864pNRJZbSOPzQqimDU', NULL, 0),
(11019, 'wx_1506758221', NULL, NULL, NULL, '笑笑', '', 0, 0, 0, 1, 0, 1506758221, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08oo7jt5xfNd5Gth4hdK6oQ', NULL, 0),
(11020, 'wx_1506758249', NULL, NULL, NULL, '陈yayun', '', 0, 0, 0, 1, 0, 1506758249, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-qJc4vWT52ZAmp05nFJjBM', 10463, 0),
(11021, 'wx_1506758303', NULL, NULL, NULL, '金福珠', '', 0, 0, 0, 1, 0, 1506758303, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05iNR6P7U9WPsAGk7EFDCOc', 10907, 0),
(11022, 'wx_1506758325', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ2OAQ9FiatF3xwIy5t7JtmMr7hO3tSiasHkoLygRuIgTGvy0udukhT8bJhefFtbHKLkZfKLC3bRCCg/0', NULL, '风纹', '左熙', 0, 0, 0, 1, 0, 1506758325, NULL, NULL, NULL, 0, 0, NULL, '13787237174', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_1EH4QcE64OapXNWVzczF8', NULL, 1),
(11023, 'wx_1506758382', NULL, NULL, NULL, '可爱姐妹俩', '', 0, 0, 0, 1, 0, 1506758382, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08THou4K35GG5NYhGAcu1Rs', NULL, 0),
(11024, 'wx_1506759365', NULL, NULL, NULL, '微笑百事达', '', 0, 0, 0, 1, 0, 1506759365, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05M9pdPqZQHVtn13R6hdWtw', 11004, 0),
(11025, 'wx_15067595396260', NULL, NULL, NULL, '10706_6106', '', 0, 0, 0, 1, 0, 1506759539, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02YPH2pL4awu_78U4wde9EE', 10706, 1),
(11026, 'wx_15067597824794', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLgsx7Jic0oLzicsWvBRwcTiagPDib2IRWFMj9cL4khTSJCf9b4xW9sTNfic1ibsyCnBDbxsRtpicLYNXibFw/0', NULL, '可乐加冰', '', 0, 0, 0, 1, 0, 1506759782, NULL, 1506859301, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00mNAQcP9LeZBuOo3so2n3A', 10193, 1),
(11027, 'wx_1506759838', NULL, NULL, NULL, 'HeTing', '', 0, 0, 0, 1, 0, 1506759838, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07K6f3QurNErmsC0tv3TFOo', 10463, 1),
(11028, 'wx_1506760032', NULL, NULL, NULL, '银子', '', 0, 0, 0, 1, 0, 1506760032, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB049d7Ow8yT1sunbc1tQjeQ4', 10463, 0),
(11029, 'wx_1506760107', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIPMibbOlKedxXJe5EQsjIXUfn6ROG235TnOqIjDCmEtERxl5e5tuGhzEttOAKUibnOAtpeaGWwLA0A/0', NULL, 'LJ', '', 0, 0, 0, 1, 0, 1506760107, NULL, 1506824460, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0za52vp-9y87DICrh3Wq11Q', 10853, 0),
(11030, 'wx_1506760327', NULL, NULL, NULL, 'lulu', '', 0, 0, 0, 1, 0, 1506760327, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05eoRbTtsjzQFQe_-4Qkt5o', 11028, 0),
(11031, 'wx_1506760529', NULL, NULL, NULL, '『禁区』', '', 0, 0, 0, 1, 0, 1506760529, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08hnpEERkp0u2cQK8Wre9BQ', 10853, 0),
(11032, 'wx_1506760783', NULL, NULL, NULL, '涵涵', '', 0, 0, 0, 1, 0, 1506760783, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-NOUkm4VtUCCDzhma1xiTI', NULL, 1),
(11033, 'wx_15067619344585', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/jicDURl6ibD2HZV6HUPb3jFH7x2sia3p2Aib7Xt88SKLzWWibdalWCd5aiaNLSOgcDl2Zcaib1Us525tQPOFppEIYIKmw/0', NULL, '贺素莲', '', 0, 0, 0, 1, 0, 1506761934, NULL, 1506931601, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05fVtlIc-hi2MBSoV9UFB8A', 10461, 1),
(11034, 'wx_1506762030', NULL, NULL, NULL, '五哥', '', 0, 0, 0, 1, 0, 1506762030, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xf0meNX7DwG7qgPdW9uJ4Q', 11004, 0),
(11035, 'wx_1506763059', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/iancibARpBUuuteBAwxiakicPia58Ylg5qlLwsrvCA6MnZtiahRE0fcz7CJrVMe9bwhrheDVgAxF3dNk96v3X4P5ubPA/0', NULL, 'AA', '叶沐华', 0, 0, 0, 1, 0, 1506763059, NULL, 1506952846, NULL, 0, 0, NULL, '18975197090', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_Xzxa43X17gIoxKFEyjAds', 10463, 1),
(11036, 'wx_1506763387', NULL, NULL, NULL, '善心人', '', 0, 0, 0, 1, 0, 1506763387, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09br_OI6aZaOlyay2AezrMU', NULL, 0),
(11037, 'wx_15067635915536', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqBIzcUib0sLp3wx08hNNhBYDuHwGOYrUxr1hBsfd0icT6f51bOpCXiavvXet2lic5ByH0UwlcE3yFpug/0', NULL, 'Bonnie', '李泽熹', 0, 0, 0, 1, 0, 1506763591, NULL, 1506908447, NULL, 0, 0, NULL, '13637423111', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02y-9NRnHMgLA3rKPsqvYwQ', 11035, 1),
(11038, 'wx_1506763611', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKj6m6P4xQyHDuHL39PWblH1Lepiap7icickYx6BymJhqv6sy36WL4flDyPZAMXv0T0RCKOo3axkNFZQ/0', NULL, '刹那恍惚', '', 0, 0, 0, 1, 0, 1506763611, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04131Uy5b42SNe6NrAqMnKM', NULL, 0),
(11039, 'wx_1506763689', NULL, NULL, NULL, '一半', '', 0, 0, 0, 1, 0, 1506763689, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09C2RE6jrGN0Luc4csfZDs8', 10463, 0),
(11040, 'wx_1506763945', NULL, NULL, NULL, 'caicai', '', 0, 0, 0, 1, 0, 1506763945, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02OmarxqeCsbMPmb_SyQ8Aw', 10463, 0),
(11041, 'wx_1506763966', NULL, NULL, NULL, 'Ya', '', 0, 0, 0, 1, 0, 1506763966, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_-gP_-jemrFik_w-8juTkE', 11037, 0),
(11042, 'wx_15067641185909', NULL, NULL, NULL, '11035_9115', '', 0, 0, 0, 1, 0, 1506764118, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08B0vVSi5NCkUkOSwF4jgzI', 11035, 1),
(11043, 'wx_15067643444675', NULL, NULL, NULL, '10725_3835', '', 0, 0, 0, 1, 0, 1506764344, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07-Jtxw7NfpJ0FGF1TRk414', 10725, 1),
(11044, 'wx_15067643692220', NULL, NULL, NULL, '10725_1203', '', 0, 0, 0, 1, 0, 1506764369, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09nDWvSWn4_ZQlZmoWi9Nwk', 10725, 1),
(11045, 'wx_15067645898821', NULL, NULL, NULL, '10725_1011', '', 0, 0, 0, 1, 0, 1506764589, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02o4FOiNW8CwHkolH-zeXgA', 10725, 1),
(11046, 'wx_1506764775', NULL, NULL, NULL, '姜艳', '', 0, 0, 0, 1, 0, 1506764775, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05Y4LF_aqguucI5MSDzJU1I', NULL, 0),
(11047, 'wx_15067651701531', NULL, NULL, NULL, '11037_8570', '', 0, 0, 0, 1, 0, 1506765170, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yCquiAZM4dhgj-Ad7DfByk', 11037, 1),
(11048, 'wx_15067651733123', NULL, NULL, NULL, '11037_4697', '', 0, 0, 0, 1, 0, 1506765173, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yhpYHO6P3nnRjfruWjr-bw', 11037, 0),
(11049, 'wx_1506765725', NULL, NULL, NULL, '琴', '', 0, 0, 0, 1, 0, 1506765725, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wfRXI9ZlA6yn6j35Dv97pI', 10463, 0),
(11050, 'wx_15067662415887', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoic753FmpJs0Yt0Z4qVvm791kyOn447ciaNTfLsLe6rVsPicoAA29oHhjeg4sPy60oO2kNIgU59faRA/0', NULL, 'boris', '李涵子茜', 0, 0, 0, 1, 0, 1506766241, NULL, 1506783305, NULL, 0, 0, NULL, '13874923111', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wAZ9ixpqoT4eG5_7ogU_Xc', 11037, 1),
(11051, 'wx_15067665887730', NULL, NULL, NULL, '11037_3105', '', 0, 0, 0, 1, 0, 1506766588, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02vN7-ed-x4O0sPBaSEre94', 11037, 1),
(11052, 'wx_1506766761', NULL, NULL, NULL, 'Party', '', 0, 0, 0, 1, 0, 1506766761, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xLKIWW1uK_Lree9d4cSIYU', 11041, 0),
(11053, 'wx_1506767034', NULL, NULL, NULL, '米', '', 0, 0, 0, 1, 0, 1506767034, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-xXW4bT9F0I_WPwQ2AvpcQ', 10463, 1),
(11054, 'wx_1506767222', NULL, NULL, NULL, '馨然', '', 0, 0, 0, 1, 0, 1506767222, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05PCvpwe-IQwqp0YrHIcaDM', 10387, 0),
(11055, 'wx_1506767411', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLiagibnCGMEuXDlqQz0tcFYmQAFsdqGnOva8nRKicsG0r67mzgIf1a8BicO2tmfgcRicrAFX2FyC6kxAQ/0', NULL, '莞尔', '黄宇清', 0, 0, 0, 1, 0, 1506767411, NULL, 1506824536, NULL, 0, 0, NULL, '18974815188', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zcIWl2qiKWSZ2g6gl-4Mjw', 10387, 1),
(11056, 'wx_15067674529669', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/tjHiaNoasJ3FH5gCvYZtZ3X4r9ATDdic6j4f84vKSmE31xyvD7Vbxgh7dLPauFElCvOWiaiauX583Qo5XBMcjQFnpA/0', NULL, '兰姣', '', 0, 0, 0, 1, 0, 1506767452, NULL, 1506767492, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-arNmSO9i01IwDapu4nT5g', 10238, 1),
(11057, 'wx_1506767647', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJibw5IjiawBH29Y5ZukRdXeUpaEaiagzVRdgCTxcicKGn38LCo12MyvFMq9DITN3leuQIcwcvK5IWDicw/0', NULL, '江水东流', '', 0, 0, 0, 1, 0, 1506767647, NULL, 1506780320, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB043IA_ZkzuWF5Klvxq9jaT4', 10602, 0),
(11058, 'wx_1506767724', NULL, NULL, NULL, 'Memory', '', 0, 0, 0, 1, 0, 1506767724, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05P_rlFkaW6DiwlO7VCwqCw', 10387, 0),
(11059, 'wx_15067677841833', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/UgLcIqvhYGxiaV0gsoA8X77S5ZiaPZiaSKsopoYj3f1xyaHKnfShGOmglSR2800ZfSzLe8PqJc4bOzcR1eFFEDN9w/0', NULL, 'Aaa小美', '曾美', 0, 0, 0, 1, 0, 1506767784, NULL, 1507010730, NULL, 0, 0, NULL, '15387515622', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0y46AY-KmSAx6DUxG3RNsz0', 10226, 1),
(11060, 'wx_15067678369656', NULL, NULL, NULL, '11037_8727', '', 0, 0, 0, 1, 0, 1506767836, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_pVJ0MsoK_qEAQ_xMJefvw', 11037, 1),
(11061, 'wx_1506767851', NULL, NULL, NULL, '涵宝宝大V店13467663219', '', 0, 0, 0, 1, 0, 1506767851, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04qyeVwC5BNsg5EsA9qHRf8', 10740, 0),
(11062, 'wx_15067678873359', NULL, NULL, NULL, '10226_6800', '', 0, 0, 0, 1, 0, 1506767887, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0--DbyCbaobXqAdsRsnLpgk', 10226, 1),
(11063, 'wx_15067679204476', NULL, NULL, NULL, '10226_3267', '', 0, 0, 0, 1, 0, 1506767920, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xWWoYMfK6nrDiY62t6oB64', 10226, 1),
(11064, 'wx_15067679759936', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/vOZcibej70AERvQzQzjXkMdeg5y2JytGZH5eZB5NgVokMXxVqQ56Ce3RQicR3B7r0L0erNahagSCYpGU42zdDK6Q/0', NULL, '又又', '袁羽萱', 0, 0, 0, 1, 0, 1506767975, NULL, 1506780401, NULL, 0, 0, NULL, '13714701221', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zlDVVFT2Vgmm-JcVxKQUJ8', 11035, 1),
(11065, 'wx_15067690712152', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/M5bIsGJ28puXRIQLnhcAmtga5RiaPm8D8hJd0ZVjhd4t5EUGibp6CAkS3vCibOgogom6LFQ8picZSFEDUx9tDtoCGQ/0', NULL, '霍霍', '霍辉艳', 0, 0, 0, 1, 0, 1506769071, NULL, 1506910541, NULL, 0, 0, NULL, '13787186099', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01DpjXxO9a_F_mNSdwYNhnw', 11035, 1),
(11066, 'wx_1506769532', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/WqNQ9Z0sMLHncKkOTjVcdYVDfEc8SIhOJIgRwBeWNTFRg2XoIY1EicPBs7lficLSytg8RlgdZQZvs5R2w3fnYLCw/0', NULL, '玲', '刘雨烯', 0, 0, 0, 1, 0, 1506769532, NULL, 1507190895, NULL, 0, 0, NULL, '18173272587', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04wmAk3aum3Ad3pY5N0tTwA', 10881, 1),
(11067, 'wx_15067695871997', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/haiaeqZT2KLoVdBld96Vj9DMWnEVITyU4fH77qvUhictoZDdRpy8oESlFPiaJARRD4iabn4wORyl6HK5ibsTLJ6HPNw/0', NULL, '黄英', '', 0, 0, 0, 1, 0, 1506769587, NULL, 1506769803, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0x1Lw5omYGvZHSoHqa-gMRY', 11065, 1),
(11068, 'wx_15067696243563', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/njL7XtElvzGqY1nS92RmLvsZKVAy5bQSPymNRPibjtLV4Hiahh8HGNBxrNtdgV53wW6O0JIVyjWfK9Lu9Jiaozx0Q/0', NULL, '敏', '', 0, 0, 0, 1, 0, 1506769624, NULL, 1506769661, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08JYoxOV63KBG5YETvx7Kg0', 11064, 1),
(11069, 'wx_15067696746105', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLPic6Amiat1ye5WkYZUX9bjtsaPvmPBsicf4hticiaMQamFJ5dniaBOqTztmFS5zhMUAqQuw4a0GFia23icQ/0', NULL, '周为', '', 0, 0, 0, 1, 0, 1506769674, NULL, 1506769701, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01-p8JdAsupBMVdWkNSFHWE', 11065, 1),
(11070, 'wx_1506770115', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/VR4nRI1lc4Ndqc4ibAAUicTjTJLCxKcPk4NKTU01c5b6Pu1ZBJhKC9QnM09MJETibYLojVTpDQYmWpR8gu93NOq7w/0', NULL, 'A小利子18670318151', '周利群', 0, 0, 0, 1, 0, 1506770115, NULL, 1507250675, NULL, 0, 0, NULL, '18670318151', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB048QSrAbLgJCkly3tGa7UCQ', 10881, 1),
(11071, 'wx_15067702334799', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Iy3rGQO05UmgVEEhFibticuY0SQXWk2R60Q924vXhuUZiaqD2pOFA9TRl0e3MEOoicmMH30UDLgKueJntEHSjva5uQ/0', NULL, '李进', '李进', 0, 0, 0, 1, 0, 1506770233, NULL, 1506910646, NULL, 0, 0, NULL, '18874158888', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0z2J65-lNEZXa67qyTbeE5A', 11065, 1),
(11072, 'wx_15067705033308', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK7qUTfB8fLaibBtibZzx6ZAbqU4p8t0fgVQr7EKWy5ls6oDTiaiaLtTfD3vdMZcUBIC9T3Dw7mhRnsAA/0', NULL, '娟子', '', 0, 0, 0, 1, 0, 1506770503, NULL, 1506770566, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00cvBPozamoHHE9HofjRM1M', 10226, 1),
(11073, 'wx_15067707272675', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/0tR4AdhjYaJNkz64KVWkDwj31ayqtzTIahh3iaqVUzvTbtmd9HbTUjdkIqMqSp9ouictchiaVWc8fFuF2MhQDuGQg/0', NULL, '金轮彩印刘', '', 0, 0, 0, 1, 0, 1506770727, NULL, 1506770735, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB024GWo1wptDzUpNjQdDOKwU', 11064, 1),
(11074, 'wx_15067710527513', NULL, NULL, NULL, '11071_9498', '', 0, 0, 0, 1, 0, 1506771052, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0x8cygoJpk8va7tpD5r3WpI', 11071, 1),
(11075, 'wx_15067711667259', NULL, NULL, NULL, '11065_3518', '', 0, 0, 0, 1, 0, 1506771166, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yK3UaTs1lWavXgVInfU6fg', 11065, 1),
(11076, 'wx_15067717443405', NULL, NULL, NULL, '11071_3508', '', 0, 0, 0, 1, 0, 1506771744, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yDOipf0Bcd4VNgfHcBk0Yk', 11071, 1),
(11077, 'wx_15067719822467', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/1NZaKkTpsHs4ibKu32BfdmgKdN3qSwqY3lB1x9Hfp2SYqOjcHqkFFticg17kGCryzsGpzIRLibr92RNJLlpc3ZunQ/0', NULL, '快乐相随', '', 0, 0, 0, 1, 0, 1506771982, NULL, 1506771992, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08PFJAe4-g5_BdAjI1HIxr0', 10084, 1),
(11078, 'wx_15067721239962', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/eslslOnucI0u7g9qibRp6Y773Ub70KvyVGjWTSQw2aMZOgS130OBfGSPshjicMDry9xFHsibFPGxFxk0AkhibYky3Q/0', NULL, '小鱼霸霸美食团长', '', 0, 0, 0, 1, 0, 1506772123, NULL, 1506772156, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-3CP9ExNH1dK_i3iv5hju8', 10084, 1),
(11079, 'wx_15067723131073', NULL, NULL, NULL, '11071_4693', '', 0, 0, 0, 1, 0, 1506772313, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07EjZnWtGzd2Iwk9DhcQ3-c', 11071, 1),
(11080, 'wx_15067724093675', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKv9QDsj4H4QmMEjNzPuALBEzc7zTibGVz81HbfeJ75CWy0saWaEV2Mic3E71SicvbxKhUIhdYhDzy0Q/0', NULL, '彭红', '', 0, 0, 0, 1, 0, 1506772409, NULL, 1506772420, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06yfycs8IVe3z6PyanzQnmw', 11078, 1),
(11081, 'wx_1506772671', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/J18Grq4X881MDxmQttsGBYWZPQyvhQmS80GtEaslfz7UbM7UCHuZfEcEavKL0RHXGHBbQ3ZqYDuwBI3Rd13FaA/0', NULL, 'A雪儿', '', 0, 0, 0, 1, 0, 1506772671, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08OY5_WUq_84Rl1jCaduOVA', NULL, 0),
(11082, 'wx_15067726878355', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK3K0aocsTDjROrLjSFq9x8FjWF6Pqlbv3ibFk4ibgDAptBuhygDCgQtZmVFAwc8ZESzqeKn02z7XsA/0', NULL, '香蕉树下的菠菜', '', 0, 0, 0, 1, 0, 1506772687, NULL, 1506772726, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zKGP71K0Guc_ejmqn5_oyA', 10084, 0),
(11083, 'wx_15067730967190', NULL, NULL, NULL, '10193_4973', '', 0, 0, 0, 1, 0, 1506773096, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0918XgpAZl5LmjoKcunRO-Q', 10193, 1),
(11084, 'wx_15067731132431', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEIKp2vzJ0Zzd9M3WcrzBSuEicWm2v59GClKZKhtr7lCYJHX0xIGw0Fhaic8l8O9kJeTDa754ldiaOrmw/0', NULL, 'A.B.C杂工', '', 0, 0, 0, 1, 0, 1506773113, NULL, 1506773122, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0x6YWATRyq0ufNAneeYrXiY', 10457, 1),
(11085, 'wx_15067731241597', NULL, NULL, NULL, '11065_6256', '', 0, 0, 0, 1, 0, 1506773124, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0w9LAZkpW2FSjBxxgrOSzbE', 11065, 1),
(11086, 'wx_15067735887637', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/VCwf3KferJV9pFymZporb9A2PmwuoITNrrkFUOuoAaMe4r3ic7s1U7kyUbY0jmiafynkDViagVyPCYTskg2eYhRRg/0', NULL, '多多', '', 0, 0, 0, 1, 0, 1506773588, NULL, 1506773601, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01Ik_oXY4FeJSctDaJr8GdI', 10086, 1),
(11087, 'wx_1506773709', NULL, NULL, NULL, '乖乖女', '谈小玲', 0, 0, 0, 1, 0, 1506773709, NULL, NULL, NULL, 0, 0, NULL, '15084868684', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01R00bkQbiV9IX3TynmshWc', 10740, 1),
(11088, 'wx_15067737677809', NULL, NULL, NULL, '11071_4540', '', 0, 0, 0, 1, 0, 1506773767, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02z7-o5zkfhFeYmgkY-b5CE', 11071, 1),
(11089, 'wx_15067739946747', NULL, NULL, NULL, '11065_2268', '', 0, 0, 0, 1, 0, 1506773994, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06Kd8mY1xYqoDiWKQar_QHQ', 11065, 1),
(11090, 'wx_15067741104945', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL8uDbhFygvI7TEVc9ghsTNNQQ00MnMQWicvccCsDwL4ON15l8xiadYbbsDLPLIG9LrMNYicybYITcWA/0', NULL, '美', '', 0, 0, 0, 1, 0, 1506774110, NULL, 1506774139, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08n107LeARXRFX-OZ82QdgQ', 10086, 0),
(11091, 'wx_1506774383', NULL, NULL, NULL, '肖旺', '', 0, 0, 0, 1, 0, 1506774383, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zI1YIF_40scVeCL-QwZo3Q', NULL, 0),
(11092, 'wx_1506774584', NULL, NULL, NULL, '一中七杯茶', '', 0, 0, 0, 1, 0, 1506774584, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wBUWvD9ss_l6aNtXTrjsU0', NULL, 0),
(11093, 'wx_15067746114071', NULL, NULL, NULL, '10876_7784', '', 0, 0, 0, 1, 0, 1506774611, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09Yjv9T9X3JXBXGUV6bOPuc', 10876, 1),
(11094, 'wx_15067750661086', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/FqOzD5Fb06gVGo5TcltJSTzzplA7vTkXWLePujcS2BibhIHibIc9ejnkZiaPcIYGpbNNbuEkkp2g82MP9poS0Kapw/0', NULL, '米汤稀饭～～马丹', '马丹', 0, 0, 0, 1, 0, 1506775066, NULL, 1506775074, NULL, 0, 0, NULL, '13637314060', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0weo4ZZzgClPlp94JWuHku0', 11064, 1),
(11095, 'wx_15067757002344', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJjnia8l0exPsxExaaUMAibvFtrjLbib7IaIQK2Ld1uXgVqh81wGBZ9pgkAY7tek7QxFibkOia9q3293bg/0', NULL, '盛夏薄荷糖', '', 0, 0, 0, 1, 0, 1506775700, NULL, 1506775735, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07vGYTGBsWFuim11shN0We4', 10341, 0),
(11096, 'wx_15067759392497', NULL, NULL, NULL, '10084_3315', '', 0, 0, 0, 1, 0, 1506775939, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yenpPfMLtmFvjGqHR_ZI9c', 10084, 1),
(11097, 'wx_15067761476145', NULL, NULL, NULL, '11095_1043', '', 0, 0, 0, 1, 0, 1506776147, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0we2LCZY32x2xtpbE0bBGlo', 11095, 1),
(11098, 'wx_1506777132', NULL, NULL, NULL, '袁静', '', 0, 0, 0, 1, 0, 1506777132, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0z3dvC-NzxD1AYYIe891Lbc', NULL, 0),
(11099, 'wx_15067779844223', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/MLnp5KzNDicn1Qc7h5e2U8CDdDrxqL7Brgo05EIAw4OHPvPgbtjia8HXnsNZQAIHicJgc05c5OqHGT1K8o23zRrCQ/0', NULL, '哎喂波滴', '', 0, 0, 0, 1, 0, 1506777984, NULL, 1506778006, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04l1XfrJxdNdTWejYfXIrwk', 10137, 0),
(11100, 'wx_1506778370', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIw6RYicXecjzr9usU5dkQfaBCN2yJAmdLcibLdJl5UzP7SP4aqFcKjekNibY6apJRxhIAyKeyYk7zdA/0', NULL, '莎莎', '陈莎莎', 0, 0, 0, 1, 0, 1506778370, NULL, 1506811409, NULL, 0, 0, NULL, '13337312997', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06r1RM0U-6IqMxAEzyFx1QA', NULL, 1),
(11101, 'wx_15067784488073', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL7yicZXT3XmJ0jXzfIbawKXR5jBXDBfTG4jTfGQgrjNWHgSMc9ibdQP71QZqMIgskWa0ZDibHUJtRsQ/0', NULL, '灼夏', '彭琳', 0, 0, 0, 1, 0, 1506778448, NULL, 1506787304, NULL, 0, 0, NULL, '18973191522', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0y3NvvfLt0R_0UljNLZndHU', 10461, 1),
(11102, 'wx_1506779033', NULL, NULL, NULL, '新兴画廊(主营国画、油画、装饰画)', '', 0, 0, 0, 1, 0, 1506779033, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08Gz9GMdhlPYZgFGS8w0m_g', NULL, 0),
(11103, 'wx_1506779236', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eouGTWjic6c7yG3rwUz2kpAJyBa34naKgwm9aLOUW0zstsyhmkCqzsm0S8icPWI0B0RmibEzIwwwXlGg/0', NULL, '半颗糖&也狠甜', '', 0, 0, 0, 1, 0, 1506779236, NULL, 1506838547, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00qaKPtXseju9sX9WMNaSME', 11100, 1);
INSERT INTO `bao_users` (`user_id`, `account`, `password`, `face`, `ext0`, `nickname`, `truename`, `integral`, `prestige`, `money`, `rank_id`, `gold`, `reg_time`, `reg_ip`, `last_time`, `last_ip`, `closed`, `uc_id`, `email`, `mobile`, `ping_num`, `post_num`, `invite1`, `invite2`, `invite3`, `invite4`, `invite5`, `invite6`, `token`, `p_openid`, `pid`, `is_subscribe`) VALUES
(11104, 'wx_1506779253', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/icWc0PejeWLcaWxgrlEf7KSoM5VXmI5EYd2nSia229RcCD4plARXrUj5WgWedp2v9XhrV64ZohM5B1ecsje4IZUw/0', NULL, 'Missy Yan', '严佳', 0, 0, 0, 1, 0, 1506779253, NULL, 1506947103, NULL, 0, 0, NULL, '13574842332', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07tjleynVZXf-W2F3jE5VQs', 10181, 1),
(11105, 'wx_1506780280', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/5b4PNiavbQwmXAXpCaL8HZPvq8LE1WebZ3sBIAIayicr6riccrMSrkRsVx2pCmC2LEFrHW4aOkaXjQyeBV0DUYASg/0', NULL, '金芽儿', '', 0, 0, 0, 1, 0, 1506780280, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03p4Rbw5oGvl83gz45btAXY', NULL, 1),
(11106, 'wx_1506780356', NULL, NULL, NULL, '依依爸', '', 0, 0, 0, 1, 0, 1506780356, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07i-M8X_T34UhffIV9nx2-U', 10704, 0),
(11107, 'wx_15067806106876', NULL, NULL, NULL, '0_3313', '', 0, 0, 0, 1, 0, 1506780610, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02-AQJ-e5j6Cf2ngqkHdDTY', 0, 1),
(11108, 'wx_15067808581155', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKXJmuu7N9fb4uJ6Nbcq9gdq8euu4oDU4xyaMe84tW6n472FGIaYrS2Z03Rlj2Cd1icr5yQPp1dG4w/0', NULL, '湘江源', '张紫阳', 0, 0, 0, 1, 0, 1506780858, NULL, 1506994847, NULL, 0, 0, NULL, '18608415750', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02vq96NFiSThqknnlHl0maM', 10086, 1),
(11109, 'wx_15067811076459', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/sIKXMercncOVZiaQlicavVUSM12LcXEGgETbx4Zf8teMyjFbhBRxIRg47VmibwjNk89TeuHAblneq3uWA40ksFOvw/0', NULL, '东塘交易大楼爱儿健', '李琼琳', 0, 0, 0, 1, 0, 1506781107, NULL, 1506907540, NULL, 0, 0, NULL, '13787127078', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-iia0tgp48pLQLYv1EjBOA', 10193, 1),
(11110, 'wx_15067811336535', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLV51XkHT3iamc5p8Cvgqrp2POTD9G367SX0r6BcSGgJ8Xro9ic5ibgBSwQDE6iahMXLYqFaHjgUFsVQg/0', NULL, 'Cici', '刘娜', 0, 0, 0, 1, 0, 1506781133, NULL, NULL, NULL, 0, 0, NULL, '15989084746', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0w8cPLAuAZ5N1Mj9hOPbso4', NULL, 1),
(11111, 'wx_15067811657871', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erI5Z5EsBfJ6oSfzTBNaxNhlJE8Xzf2pzwP6wllJg2cO4e099VjA9Bpb082BLNfa5KMibBZXwGibzfw/0', NULL, '彭小龙', '彭小龙', 0, 0, 0, 1, 0, 1506781165, NULL, NULL, NULL, 0, 0, NULL, '15388978787', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02WQiwKnKpbdCqo_-UhEyKQ', NULL, 1),
(11112, 'wx_15067812318871', NULL, NULL, NULL, '10084_1772', '', 0, 0, 0, 1, 0, 1506781231, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00p74KuXXJDN9KWbQdC_sXs', 10084, 1),
(11113, 'wx_15067816581833', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/osc1xjewicf6H249kq7j6cBusWricQPxyic0AiapWtCF62hW5gQkUmQ0PEyLBOykm4ldIQJN4uTkosMrZ9CHBvvgMw/0', NULL, '金话筒摇篮 王妍苏', '', 0, 0, 0, 1, 0, 1506781658, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01qTQiHCQAAsuOK0d5frmLQ', NULL, 1),
(11114, 'wx_15067817719374', NULL, NULL, NULL, '11109_1147', '', 0, 0, 0, 1, 0, 1506781771, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_F2JMg5spB3mCWZZom5q_I', 11109, 1),
(11115, 'wx_15067818501834', NULL, NULL, NULL, '11109_2752', '', 0, 0, 0, 1, 0, 1506781850, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08m4f4knSiKSIulQVhC6j6Y', 11109, 1),
(11116, 'wx_15067819809456', NULL, NULL, NULL, '11109_7970', '', 0, 0, 0, 1, 0, 1506781980, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-9bkk3BrqKrfnDZKPHXCmY', 11109, 1),
(11117, 'wx_15067819858593', NULL, NULL, NULL, '10193_4117', '', 0, 0, 0, 1, 0, 1506781985, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yytwWtixMxqcAHUJio8NOA', 10193, 1),
(11118, 'wx_15067820522965', NULL, NULL, NULL, '11109_1367', '', 0, 0, 0, 1, 0, 1506782052, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02lHsDPa0_eXCZWM0oB6ZGA', 11109, 1),
(11119, 'wx_15067824008982', NULL, NULL, NULL, '10258_5768', '', 0, 0, 0, 1, 0, 1506782400, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0616-aHP3OtTEWaxud-MLCE', 10258, 1),
(11120, 'wx_15067826921060', NULL, NULL, NULL, '11109_3994', '', 0, 0, 0, 1, 0, 1506782692, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03991LyaDIbXpJL2gnQiF8M', 11109, 1),
(11121, 'wx_1506782821', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/eslslOnucI0u7g9qibRp6Yic6CUBeZkh5vwDLFiaY7hrib3rgaks0q0WLGs89ny8aRFrTkR29zv9Qcs1hByDfw6aGQ/0', NULL, '刁老', '', 0, 0, 0, 1, 0, 1506782821, NULL, 1506794859, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01s9S3OUYwrdrLDebxLVChs', 11103, 1),
(11122, 'wx_15067828532379', NULL, NULL, NULL, '11100_5758', '', 0, 0, 0, 1, 0, 1506782853, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02coba62PyN0OHv0oNjSSHA', 11100, 1),
(11123, 'wx_15067829739355', NULL, NULL, NULL, '11109_7533', '', 0, 0, 0, 1, 0, 1506782973, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB062WoGFR-GxW5HwHPNgGNVU', 11109, 1),
(11124, 'wx_15067830983455', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/JRGNCzHG6iatEXyKkBkxAVxN4cibgrmqZYZo5J28mYU55UasrcWRG0FBovcBBqVZ3aJj4BXnza67sdVUKoTCOnNQ/0', NULL, 'ELAINE   ', '', 0, 0, 0, 1, 0, 1506783098, NULL, 1506783107, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07r2WKv4HIQ3So-w-YPLXc0', 11103, 1),
(11125, 'wx_1506783112', NULL, NULL, NULL, '骄哥', '', 0, 0, 0, 1, 0, 1506783112, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zwDiwtihw9RLVbOQwwbRUc', 11103, 1),
(11126, 'wx_15067833324476', NULL, NULL, NULL, '11100_1091', '', 0, 0, 0, 1, 0, 1506783332, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01DfyJjbv3vKQMOBYZlPz6Q', 11100, 1),
(11127, 'wx_15067833987270', NULL, NULL, NULL, '11050_2195', '', 0, 0, 0, 1, 0, 1506783398, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06iv7gvbH9h5ruoB6GlgKqw', 11050, 1),
(11128, 'wx_1506783575', NULL, NULL, NULL, '悠悠', '', 0, 0, 0, 1, 0, 1506783575, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02HOaJPq3wuhi-mczpJPbdo', NULL, 0),
(11129, 'wx_1506783627', NULL, NULL, NULL, 'Lotus', '', 0, 0, 0, 1, 0, 1506783627, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xYdXE-lAoOfUMWiZv1QTbI', 10688, 0),
(11130, 'wx_15067838967982', NULL, NULL, NULL, '11100_2064', '', 0, 0, 0, 1, 0, 1506783896, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09sV7cjT4V61SQR1bl-DfkY', 11100, 1),
(11131, 'wx_15067839928704', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJZicRP0FZ78kYHOKa97oBcFWKicUajg4zuzm8FlJwia8lfuHib7djj823ibcGzy89m6KRHrrfFEicickfLw/0', NULL, '航飞', '', 0, 0, 0, 1, 0, 1506783992, NULL, 1506784013, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_8d0RZVGowJc6DCrtX_rrU', 11109, 1),
(11132, 'wx_15067840453520', NULL, NULL, NULL, '11050_2622', '', 0, 0, 0, 1, 0, 1506784045, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wLJRGLaXtk877fGD3QYoUk', 11050, 1),
(11133, 'wx_1506784080', NULL, NULL, NULL, '晏登科妈', '', 0, 0, 0, 1, 0, 1506784080, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05aIQnP4EgYxtenwizLvHeQ', NULL, 0),
(11134, 'wx_15067840987176', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIa5x1WabbmqLVqVibgQ0S5XUFle0m3gndvOIAcMkooTgy1HS8Ay2miaD1NVrodP2w8ganWzeJh3JVg/0', NULL, '小天使', '蒋英', 0, 0, 0, 1, 0, 1506784098, NULL, 1506784103, NULL, 0, 0, NULL, '18684806798', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09iY7hNnsnYbdH3UUyry3qg', 11109, 1),
(11135, 'wx_1506784225', NULL, NULL, NULL, '弘佳', '', 0, 0, 0, 1, 0, 1506784225, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB056R_gQ892DuSJNATC1Ecp0', 10688, 0),
(11136, 'wx_15067842471639', NULL, NULL, NULL, '11050_4756', '', 0, 0, 0, 1, 0, 1506784247, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_7Wiz5SDEh_k8wz72QELpc', 11050, 0),
(11137, 'wx_1506784286', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/O5whRT78Nia8Ig2ms2qDWGkYWwibGib20VdZj7U1LhxDwF1wk1F1LpLcQuwiaOWQtDoL4RI7jIvPGAvSWUXtxAud4g/0', NULL, '李卓', '', 0, 0, 0, 1, 0, 1506784286, NULL, 1506989213, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09UDXxzjnA32H4JqHYPWHXE', 10181, 0),
(11138, 'wx_15067847361062', NULL, NULL, NULL, '11050_8455', '', 0, 0, 0, 1, 0, 1506784736, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0ysg4emuZdGlBazE0RANP40', 11050, 0),
(11139, 'wx_1506784874', NULL, NULL, NULL, '期盼 美好', '', 0, 0, 0, 1, 0, 1506784874, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_KPA275clPEerChe7uHQfc', 11100, 0),
(11140, 'wx_15067850953627', NULL, NULL, NULL, '11103_8244', '', 0, 0, 0, 1, 0, 1506785095, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04ubLTTYFCPIJ6ktPJYeK3E', 11103, 1),
(11141, 'wx_1506785590', NULL, NULL, NULL, 'ENJY JEWELRY', '李雨宸', 0, 0, 0, 1, 0, 1506785590, NULL, NULL, NULL, 0, 0, NULL, '18670380005', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-QY8aoB-CLZepMGbIIpqsg', NULL, 1),
(11142, 'wx_15067858764751', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/vNKM5MLdhvF469phMdCbiaYo9g12CRN4s2upv9xLIYXDF1W0gvLUImut71muIPxprJicZGkVZ9R8ibTibLJQp4wicYw/0', NULL, '你若简单，我便真诚', '', 0, 0, 0, 1, 0, 1506785876, NULL, 1506785895, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05j32jnOooV16qR7ksLSnRY', 10876, 1),
(11143, 'wx_15067866771740', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/JeaCuBuCGxktAMkdgO6eia9AhWicSf7DmILKGVtDoqtZoSdIlaqGt1XyKDq7emichiatQsia5EO4eV5Zob3jzApLiadw/0', NULL, '雪儿', '张芳', 0, 0, 0, 1, 0, 1506786677, NULL, 1506909759, NULL, 0, 0, NULL, '13574165420', 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB032IWe9L4kfNqQPF-fyOios', 10200, 1),
(11144, 'wx_1506788426', NULL, NULL, NULL, '凌飞', '', 0, 0, 0, 1, 0, 1506788426, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08Hx0Dtaok7ZyUiP90A-Vns', 10113, 0),
(11145, 'wx_1506794856', NULL, NULL, NULL, NULL, '', 0, 0, 0, 1, 0, 1506794856, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, 0),
(11146, 'wx_15068033728258', NULL, NULL, NULL, '11109_7141', '', 0, 0, 0, 1, 0, 1506803372, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08FLNmxngaeDNgZ_fR6vy98', 11109, 1),
(11147, 'wx_1506807147', NULL, NULL, NULL, '廿画', '', 0, 0, 0, 1, 0, 1506807147, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03uh4uSdSEat_QV6tmo1zRQ', 11100, 0),
(11148, 'wx_15068137104048', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/KWhSPGbJlOQsFK9rvgXTiczuKWoHvzQnMX8uujcwTadTzBhQXRHXpG6o2G3AoxGkiagoZZ5LXR2TnmnMCUwU65jg/0', NULL, '高晓愈', '', 0, 0, 0, 1, 0, 1506813710, NULL, 1506813721, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xMafv_e4Nff7e8jKPNg0y0', 11064, 1),
(11149, 'wx_1506813741', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKAGkG5x0hvhlyBGK6lplqP6zxznRiadBldVIfia0qqIlUqfKUylNchmmgonphEibLK9lc1t34ZtF63g/0', NULL, '欣然', '', 0, 0, 0, 1, 0, 1506813741, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00NLfMSDGDBFJeMSIqF3zFY', NULL, 0),
(11150, 'wx_1506814379', NULL, NULL, NULL, '郭荣', '', 0, 0, 0, 1, 0, 1506814379, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04M6oGPD2Nl9zJU2Ngn9MO8', NULL, 0),
(11151, 'wx_15068144077111', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/kwFDiaWnAZ4dqFibzFnTRBHB8POA5DibX852JHia4kI29rIkcXPeY0CjOT6YUk6mQIfW4GrC0yiax2vHKG77LtIoQlA/0', NULL, '何琼', '', 0, 0, 0, 1, 0, 1506814407, NULL, 1506814417, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xmIInBqtYSPkhI6DYAf8eA', 10193, 1),
(11152, 'wx_1506815055', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/sHPrgfrTWlWHqP6h7UAm4kyzUZiaeEfQDJZlEkbFv7IeXbQvglTykouT3nhRzgNoFm3lxoMIPOBADmicUc6NyLUg/0', NULL, 'GREEN', '', 0, 0, 0, 1, 0, 1506815055, NULL, 1506815066, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xCDj8fdVxxkLdNRsw1F6mQ', 10387, 0),
(11153, 'wx_1506815993', NULL, NULL, NULL, '乐颜', '', 0, 0, 0, 1, 0, 1506815993, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07s7oXVZjVLevEF-s470VC4', 10387, 0),
(11154, 'wx_1506816660', NULL, NULL, NULL, '峻熙嗲嗲', '', 0, 0, 0, 1, 0, 1506816660, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_uU9-mNs-3qFrNg1WX5Z3M', NULL, 0),
(11155, 'wx_1506816831', NULL, NULL, NULL, '☀ 嗨，宝贝 ⚡', '', 0, 0, 0, 1, 0, 1506816831, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04-g5mJDi0W2tnojgcibaDM', 10387, 0),
(11156, 'wx_1506816866', NULL, NULL, NULL, 'A0', '', 0, 0, 0, 1, 0, 1506816866, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB051URV7p_0T_HVTp235Iufc', 10881, 0),
(11157, 'wx_1506816902', NULL, NULL, NULL, 'Sunday莎', '', 0, 0, 0, 1, 0, 1506816902, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_LLzVILJHOaJaYN-9d6jkU', 10881, 0),
(11158, 'wx_1506818711', NULL, NULL, NULL, '蔡医生', '', 0, 0, 0, 1, 0, 1506818711, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03q7NP_JIdg7iZhJ2jBOkeg', 10932, 0),
(11159, 'wx_15068196107921', NULL, NULL, NULL, '11103_5759', '', 0, 0, 0, 1, 0, 1506819610, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06-MWC7xgcbCFu3OxgBTvJA', 11103, 1),
(11160, 'wx_1506820155', NULL, NULL, NULL, '邓爱华', '', 0, 0, 0, 1, 0, 1506820155, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06VN02U0ExN_uHY-f2fPfUs', NULL, 0),
(11161, 'wx_1506822618', NULL, NULL, NULL, '等待(姜波)太保15526406128', '', 0, 0, 0, 1, 0, 1506822618, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xlqty2SNWVWDkPLKJbphEo', 10374, 0),
(11162, 'wx_1506826773', NULL, NULL, NULL, '程玲俐', '', 0, 0, 0, 1, 0, 1506826773, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-6tOghZI6qSVeVxfGl-X2c', NULL, 0),
(11163, 'wx_15068284081176', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/mgDhES1jUzh4iaYW49UVZ0ic0Yw6ubKzuPojZ8wwPKMJ4U1nCtvGrPpcTqWibC0hxoud5TvRwbWu566HEVPrIdfFQ/0', NULL, '', '', 0, 0, 0, 1, 0, 1506828408, NULL, 1506828415, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB000-u-HRKZyP77Ue71PeTqc', 10341, 0),
(11164, 'wx_1506829301', NULL, NULL, NULL, 'V1vikA**', '', 0, 0, 0, 1, 0, 1506829301, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07-kLWhZBym1B81IcszGTYY', NULL, 0),
(11165, 'wx_15068358422369', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/MzdoRBU6VN4hIWCn6bbXe2q2fb8vOtmXQ1mgvbqqQlBdOKEl3Wvc5VwxLL0icVCFXTQUtYcOpMPh3QHQDU0a2dQ/0', NULL, '彭翔', '', 0, 0, 0, 1, 0, 1506835842, NULL, 1506835851, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB06u_Ki-Lnh0rmfPQCslTbj8', 10193, 1),
(11166, 'wx_15068377916733', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM7hicfib7ya6YR5216kj3Qv2j5YADL6B4pNfGvxDy7YibCWeN2ibDsR1zmyvrNYQb9bup2NTXIiavDWFQblB2cU6rEaM/0', NULL, '倩倩', '', 0, 0, 0, 1, 0, 1506837791, NULL, 1506837803, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07olCgou0Xt6n8Bjc1Hn0Ac', 11078, 1),
(11167, 'wx_1506842568', NULL, NULL, NULL, '刚哥', '', 0, 0, 0, 1, 0, 1506842568, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB040EFBKFywe_Ar7_8q_yca4', NULL, 0),
(11168, 'wx_15068446894743', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/4zxibyyKdPJvVZG7eHvAx2C2swia5icGdllsID4Ibchh8aExxGcrVkeMMqRkTzFk8OiaZY6KPg27P92po8K4er5txA/0', NULL, '李敏', '', 0, 0, 0, 1, 0, 1506844689, NULL, 1506844701, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04wsY5tZi5SnQHDj_jljThE', 10603, 1),
(11169, 'wx_1506847004', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/9jFEk6dqn5AuKvqQtEsYe0Z5u9CChhkYZLkAKq5zrzJF5ia6uq6g0DAEA2B3S0o87hmrbs53Leo4tZbfO0ypS9Q/0', NULL, '爱本兮。爱生活', '', 0, 0, 0, 1, 0, 1506847004, NULL, 1506967725, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_ya9cKk_kra3Nyida9x8Zw', 10193, 1),
(11170, 'wx_15068473111069', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/fpTh4iaiby3kV0cVibeRicy17BmJ5iaQo5V8YYiaWLn4CSGynaFcqic5oSHz8tZ0SrS8I0L9OszUkhZXuqiaSlibL5lY76w/0', NULL, 'Fendy', '', 0, 0, 0, 1, 0, 1506847311, NULL, 1506865174, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07ZkvVRFj2NVldTEqAgKEn4', 10226, 1),
(11171, 'wx_1506848270', NULL, NULL, NULL, 'Daisy Ding', '', 0, 0, 0, 1, 0, 1506848270, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB050qDXebMGv2cZE4NDWyfL0', 10463, 0),
(11172, 'wx_15068505924098', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLHibGcW0k2MjrmhibibkctUp5YL0IYrgn2XUxZ8PAib2DFUBicCUria4ezS4giaf4O3t0icMJKYCL9dsN54Q/0', NULL, '唐学文', '', 0, 0, 0, 1, 0, 1506850592, NULL, 1506850603, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yupKGm07nzTTYcod3Z_AV8', 10193, 1),
(11173, 'wx_15068511771218', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/IuGC12Pk506nkaS3gibtmcveoviafJhDRJQT8hZIBXuiciasH9UT3KrHiaxLz8a5shDIoFkLFG0QZPiaR2SFK305gfMA/0', NULL, '七七', '', 0, 0, 0, 1, 0, 1506851177, NULL, 1506851188, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wFD65IyZ0osmag-9mxirfo', 10308, 0),
(11174, 'wx_15068515837469', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/fLJr5qzyqb1KW1fCjWvlBletMm5kic5armSMSjzpUYAzpyamwzWk0XC6TkyXVhnmHCrYKGmnmoY8eWpq4b6XDuQ/0', NULL, '小博', '', 0, 0, 0, 1, 0, 1506851583, NULL, 1506851588, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01YLOuQYMAUz45WOe1BO6ME', 10084, 1),
(11175, 'wx_15068656482604', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/ujLicQ5Hk3TU9Az8OFxUNv65cAohMzTcqpyNUg4UqxDt6IGx9ImbbcIKUaPYPqS2Bl6CVj4kIHduiaiafribyTZmLg/0', NULL, '邹美丽', '', 0, 0, 0, 1, 0, 1506865648, NULL, 1506865658, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03NdZ_QUMZrMOmy3bBvSsYM', 10193, 1),
(11176, 'wx_15068979634217', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKiaUKuBV03cVeS6QpM0kxQuJu2gl6oQW89EALIO1dDe2DTACCd1gcLvgYbDibpTLz1WKaswtibT5mMw/0', NULL, '叶插柳', '', 0, 0, 0, 1, 0, 1506897963, NULL, 1506897974, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07A5dUo0z56g965xuNzDNHY', 10193, 0),
(11177, 'wx_1506901040', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/GLgEskNOMPruOdgyyFCKHNlI50LWbKupLwWREdZPkiceaJL9SzpuokDHQoUy9AJCYDmicclqGCGoLaELBicGBBh4Q/0', NULL, '\'朝阳', '', 0, 0, 0, 1, 0, 1506901040, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB036gBjtwhgD3Mb4qVsI5dN8', NULL, 0),
(11178, 'wx_15069066218312', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epTD4AL0fq1VOR6ccASV5DaaDygXll5QJaj7pSKZJYH6xkFQpzowKhZmEobuGgibCEBHAcfN77qtIw/0', NULL, '妍妍', '', 0, 0, 0, 1, 0, 1506906621, NULL, 1506906634, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04PvV7k1uWejnRDwk91T4_I', 10084, 1),
(11179, 'wx_15069070602701', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/KcX5v5n7vf77icCzsBibk6fRJFbaoSFMB1c8JkH2zp35xvhJibFPpnb3tqVALx0Uicl8oARdtJEibSibp2Q1FWmaH24g/0', NULL, '奕涵妈妈', '', 0, 0, 0, 1, 0, 1506907060, NULL, 1506907070, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-wize6Qy2KqShceT7HbkgQ', 11035, 1),
(11180, 'wx_15069123043196', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erdA63kwLxfGe2SLh9oLw4QbDtkrWzOeENsvhicOick7s87kzFP2ujP6k1Ee3wGvPGqMibq2LItabE0g/0', NULL, '', '', 0, 0, 0, 1, 0, 1506912304, NULL, 1506912313, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01dt-bihSn6oYWqwWgd2jQM', 10193, 1),
(11181, 'wx_1506913036', NULL, NULL, NULL, '蓓蓓yi~', '', 0, 0, 0, 1, 0, 1506913036, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB03yc1Zyd3ZdctzHRTpeo1ag', 10387, 0),
(11182, 'wx_1506914152', NULL, NULL, NULL, '', '', 0, 0, 0, 1, 0, 1506914152, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zn17s5R08xJkYskl9HFJZg', NULL, 0),
(11183, 'wx_15069215106928', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/oWANQhuGgk8efGxvferpYKNCib4Cmn533yuIxe4tbibb7ENyfZt4ibQNZmjXXlnibtZTz1GJ4mqbQKomW0gBQBO95A/0', NULL, '美松杨', '', 0, 0, 0, 1, 0, 1506921510, NULL, 1506921520, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zzwgGT1Qe81pZNmXaRRYOo', 10085, 1),
(11184, 'wx_1506924263', NULL, NULL, NULL, '张湛', '', 0, 0, 0, 1, 0, 1506924263, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01qJovORjpvC3s_nj-f22qM', 10387, 0),
(11185, 'wx_1506924271', NULL, NULL, NULL, '胡正德-湖南洋洋数码设备有限公司', '', 0, 0, 0, 1, 0, 1506924271, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09Czzexc5ZXlfhaDhCNoF1U', 10387, 0),
(11186, 'wx_1506939136', NULL, NULL, NULL, '迷路的鹿', '', 0, 0, 0, 1, 0, 1506939136, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zD3CJuMvL-IBOtMJFAVRig', NULL, 0),
(11187, 'wx_1506943690', NULL, NULL, NULL, '妮子', '', 0, 0, 0, 1, 0, 1506943690, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0xE7Gke8285crFR6N4BOKBs', 10434, 0),
(11188, 'wx_1506943700', NULL, NULL, NULL, '蒋de洋贝', '', 0, 0, 0, 1, 0, 1506943700, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09XhtGtWWSxx4Z5qAcbXc1E', NULL, 0),
(11189, 'wx_1506997066', NULL, NULL, NULL, '勇往直前', '', 0, 0, 0, 1, 0, 1506997066, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0-IyrxifGq1mvTMEGe_w3Wg', 10518, 0),
(11190, 'wx_1507001879', NULL, NULL, NULL, '圣勇', '', 0, 0, 0, 1, 0, 1507001879, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00SoSRy0i5gNFd_BommSn3M', NULL, 0),
(11191, 'wx_1507007930', NULL, NULL, NULL, '糖糖', '', 0, 0, 0, 1, 0, 1507007930, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00Q1SROwYX9PK-x9kwhoh4M', 10730, 0),
(11192, 'wx_1507016965', NULL, NULL, NULL, '彭鹏', '', 0, 0, 0, 1, 0, 1507016965, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zA4Qy2rocuOdCKfYdAzvi0', NULL, 0),
(11193, 'wx_15070862836375', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/9QAl1a9dt582RfG4OUBVdyib1mZrdxlbnsR9dqzCMh7RWQIl1PwbYt1ALdiaVmrib3j9Vkiau2j0yWb40VpL2Hpu5Q/0', NULL, '媛媛', '', 0, 0, 0, 1, 0, 1507086283, NULL, 1507086295, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07fsgHNPux2mogVZxkMJ4gg', 10193, 1),
(11194, 'wx_15071069814300', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/hcRLck95z1R2gPtViarb4qwzPia6iaLmER7LAGyBHDuJuq77Rrg0nJ6ICiaoOHAAS9MzEK6ZnCy735SJQtlt1Bfc4w/0', NULL, '婵玉－韩妆玉颜', '', 0, 0, 0, 1, 0, 1507106981, NULL, 1507106988, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB095vG7dvtcKx_qCSREtPXAY', 10587, 1),
(11195, 'wx_1507118710', NULL, NULL, NULL, '红红', '', 0, 0, 0, 1, 0, 1507118710, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wh8Nz-Qby4WSwLEE_n1fKc', NULL, 0),
(11196, 'wx_1507121609', NULL, NULL, NULL, '周维', '', 0, 0, 0, 1, 0, 1507121609, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_CBi86V13rtCnfGx9E_-II', NULL, 1),
(11197, 'wx_1507123837', NULL, NULL, NULL, '倪海燕', '', 0, 0, 0, 1, 0, 1507123837, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB08eGK5hXHxW0_SvnsmVwSt4', 10334, 0),
(11198, 'wx_15071645415384', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/WiaiaRGvvhCxUstt5gaer2oKYica4ueNHetdl93dD8MfTyZZX4ibhydehZMIjxqF0lMILickvHRuq6ZsEib7uLI3oLpw/0', NULL, '甜甜的微笑', '', 0, 0, 0, 1, 0, 1507164541, NULL, 1507164551, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02UJeixCk-A9rSN5W4L274Q', 10193, 1),
(11199, 'wx_15071699767459', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/j0EsJpicLiaAn7NoVlRlgWvRAOF5VkU45VonUcXAWB7JfMU0I9Kx2N7iakNdVwUjpPjaJC9VWobsM0m3ZKEmfwQnw/0', NULL, 'yy', '', 0, 0, 0, 1, 0, 1507169976, NULL, 1507210547, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB00SGApdyHpVGI6ku9yP5ENA', 10140, 1),
(11200, 'wx_15071760669651', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/nl5cicXOrXic5ESCmegopIHG1L2IXTkibp6VAx0yMG0P1LiauSbmY9iaKrpP88GlgbG23ndTnQddkib3YGv1t2Hexypw/0', NULL, '小月', '', 0, 0, 0, 1, 0, 1507176066, NULL, 1507176082, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB05QMFhbQv5FeR_PRH1ogVT0', 10463, 1),
(11201, 'wx_1507194282', NULL, NULL, NULL, '矢亦比', '', 0, 0, 0, 1, 0, 1507194282, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB09FV9Kum3XAQTjALm-z54NI', 10085, 0),
(11202, 'wx_1507208069', NULL, NULL, NULL, '文', '', 0, 0, 0, 1, 0, 1507208069, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB04Vv9CkJqXrs01DCpNpQc6Q', NULL, 0),
(11203, 'wx_15072626318396', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/eFNylkVW9YwxyyPib9gJRWvUBrDu9WSCiaibiaib43HHA1bAUH14AibntGcI4zXvBR5KshmNA0KXBQuMVibiaTbTUAiamLA/0', NULL, '华18173137525', '', 0, 0, 0, 1, 0, 1507262631, NULL, 1507262642, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0yDb4evkGDmrkXL6Xwv3oes', 10137, 1),
(11204, 'wx_1507272192', NULL, NULL, NULL, 'Yerik', '', 0, 0, 0, 1, 0, 1507272192, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07-G4oSRpwjl_rMfbsAcYKM', NULL, 1),
(11205, 'wx_15072965307039', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eow3MhwmtVI5Fcj1ib6SvvxcS1m6chjEXzYv2KTFhGIkxKRvSsSI97QDib79LOEaks8JLE33F0QXNlA/0', NULL, '小蛐', '', 0, 0, 0, 1, 0, 1507296530, NULL, 1507296573, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0zzF0IMfOz11znmHk7G-Vo4', 10193, 0),
(11206, 'wx_15073470228495', NULL, 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLnn6NSRpTdUa0Uo6NGg8N4EF85u32mlegJBrzDnkWJ0V38aYR3XGqExlRJcbpTWnSCzRF68X3IKA/0', NULL, '杨坤', '', 0, 0, 0, 1, 0, 1507347022, NULL, 1507347033, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB07F353niEtQEfMsm_AQyjkM', 10308, 1),
(11207, 'wx_15074165145004', NULL, NULL, NULL, '10193_7046', '', 0, 0, 0, 1, 0, 1507416514, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01cZsI1_d_Ax-L0L18_nk7I', 10193, 1),
(11208, 'wx_1507504786', NULL, NULL, NULL, 'WL', '', 0, 0, 0, 1, 0, 1507504786, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB01Jgtv8goBfCq499h_PuMZA', NULL, 0),
(11209, 'wx_1507504787', NULL, NULL, NULL, NULL, '', 0, 0, 0, 1, 0, 1507504787, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', NULL, NULL, 0),
(11210, 'wx_1507517029', NULL, NULL, NULL, 'N.', '', 0, 0, 0, 1, 0, 1507517029, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0_O4EpeooIXgO7rivvzxpks', NULL, 1),
(11211, 'wx_1507517190', NULL, NULL, NULL, '酷爸 | 糖糖²⁰¹⁷', '', 0, 0, 0, 1, 0, 1507517190, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB02FFMwh4Ows3X5rmaMY2XQc', NULL, 1),
(11212, 'wx_1507519137', NULL, NULL, NULL, 'Daring ^_^Echo', '', 0, 0, 0, 1, 0, 1507519137, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, '0', 'oGFRB0wXJ7eTCfUOoviCVkrG0iyA', NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `bao_users_cash`
--

CREATE TABLE `bao_users_cash` (
  `cash_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '0未审核1通过2拒绝',
  `reason` text,
  `account` varchar(64) DEFAULT NULL,
  `bank_name` varchar(128) NOT NULL,
  `bank_num` varchar(32) NOT NULL,
  `bank_branch` varchar(128) NOT NULL,
  `bank_realname` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_users_cash`
--

INSERT INTO `bao_users_cash` (`cash_id`, `user_id`, `money`, `addtime`, `status`, `reason`, `account`, `bank_name`, `bank_num`, `bank_branch`, `bank_realname`) VALUES
(70, 148, 11100, 1447557810, 0, NULL, '123456@qq.com', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `bao_users_ex`
--

CREATE TABLE `bao_users_ex` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `last_uid` int(11) DEFAULT '0',
  `views` int(11) DEFAULT NULL,
  `bank_name` varchar(128) DEFAULT NULL,
  `bank_num` varchar(32) DEFAULT NULL,
  `bank_branch` varchar(128) DEFAULT NULL,
  `bank_realname` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_users_ex`
--

INSERT INTO `bao_users_ex` (`user_id`, `last_uid`, `views`, `bank_name`, `bank_num`, `bank_branch`, `bank_realname`) VALUES
(214, 0, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `bao_users_goods`
--

CREATE TABLE `bao_users_goods` (
  `record_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT '0',
  `goods_id` int(10) DEFAULT NULL,
  `record_time` int(11) DEFAULT NULL,
  `record_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_users_look`
--

CREATE TABLE `bao_users_look` (
  `look_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `last_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_users_look`
--

INSERT INTO `bao_users_look` (`look_id`, `user_id`, `shop_id`, `last_time`) VALUES
(272, 214, 144, 1506302131);

-- --------------------------------------------------------

--
-- 表的结构 `bao_users_visitors`
--

CREATE TABLE `bao_users_visitors` (
  `visitors_id` int(10) UNSIGNED NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `last_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_user_addr`
--

CREATE TABLE `bao_user_addr` (
  `addr_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT '0',
  `city_id` int(11) DEFAULT '0',
  `area_id` int(11) DEFAULT '0',
  `business_id` int(11) DEFAULT '0',
  `name` varchar(32) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `addr` varchar(1024) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_user_card`
--

CREATE TABLE `bao_user_card` (
  `card_id` int(10) UNSIGNED NOT NULL,
  `card_num` varchar(32) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_user_code`
--

CREATE TABLE `bao_user_code` (
  `code_id` int(10) UNSIGNED NOT NULL,
  `phone` varchar(20) DEFAULT '0' COMMENT '手机号',
  `code` varchar(10) DEFAULT NULL COMMENT '验证码',
  `validity` int(11) DEFAULT '0' COMMENT '有效期'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_user_code`
--

INSERT INTO `bao_user_code` (`code_id`, `phone`, `code`, `validity`) VALUES
(256, '13590288934', '5826', 300),
(257, '13590288935', '6080', 300),
(258, '18670390078', '8778', 300),
(259, '18569532116', '2160', 300),
(260, '17620492925', '8259', 300),
(261, '15808902204', '8730', 300),
(262, '15580077343', '7467', 300),
(263, '18673182686', '3859', 300),
(264, '18683182686', '9901', 300),
(265, '15564378461', '4494', 300),
(266, '18570148379', '2935', 300),
(267, '13687303317', '7611', 300),
(268, '18173179272', '4674', 300),
(269, '15874983826', '5485', 300),
(270, '15973176773', '1275', 300),
(271, '18674355945', '1209', 300),
(272, '15874931002', '8862', 300),
(273, '13974998951', '2396', 300),
(274, '15874986826', '3354', 300),
(275, '13873366833', '9478', 300),
(276, '17607318670', '6838', 300),
(277, '13307369008', '5083', 300),
(278, '18182139938', '7516', 300),
(279, '18973609166', '7418', 300),
(280, '18975652881', '7828', 300),
(281, '13787161597', '4944', 300),
(282, '18807411778', '7342', 300),
(283, '18650743136', '1566', 300),
(284, '13548575888', '7338', 300),
(285, '18108428338', '5869', 300),
(286, '13874964967', '4364', 300),
(287, '15273155258', '3168', 300),
(288, '13786141994', '6772', 300),
(289, '13387311959', '8791', 300),
(290, '15802642325', '1008', 300),
(291, '15116422727', '8162', 300),
(292, '13517484070', '1013', 300),
(293, '13787009067', '3495', 300),
(294, '15873903388', '4574', 300),
(295, '15367886357', '6618', 300),
(296, '18684839289', '8144', 300),
(297, '13397416168', '8163', 300),
(298, '13974818450', '6755', 300),
(299, '13974819450', '4871', 300),
(300, '13739088400', '9384', 300),
(301, '15116119525', '9553', 300),
(302, '13974960876', '3393', 300),
(303, '18970096086', '6246', 300),
(304, '17775851846', '3275', 300),
(305, '13875845238', '4435', 300),
(306, '18507312808', '6622', 300),
(307, '13755024494', '1540', 300),
(308, '15802587070', '8893', 300),
(309, '13808494308', '9830', 300),
(310, '13975149990', '2115', 300),
(311, '15907480383', '5187', 300),
(312, '13432706887', '8252', 300),
(313, '15386485015', '5954', 300),
(314, '13319585225', '5809', 300),
(315, '13755198917', '3510', 300),
(316, '18229964888', '4980', 300),
(317, '18684788751', '2315', 300),
(318, '13873182951', '9795', 300),
(319, '13875800030', '5801', 300),
(320, '13908499177', '2557', 300),
(321, '13787113057', '6740', 300),
(322, '18570373888', '5880', 300),
(323, '13574840503', '8018', 300),
(324, '15111456982', '9945', 300),
(325, '15116319199', '7886', 300),
(326, '13517484982', '7378', 300),
(327, '13787261677', '3604', 300),
(328, '13755063826', '9607', 300),
(329, '13974274868', '7601', 300),
(330, '15307333560', '8529', 300),
(331, '13618488184', '9213', 300),
(332, '13548738544', '4818', 300),
(333, '15874985903', '4262', 300),
(334, '15802615299', '2804', 300),
(335, '18874852911', '7451', 300),
(336, '18173115551', '3584', 300),
(337, '13787870931', '1388', 300),
(338, '15211089797', '4853', 300),
(339, '15717310242', '2851', 300),
(340, '13739088931', '1233', 300),
(341, '13786197283', '3962', 300),
(342, '13548605270', '3140', 300),
(343, '13973131359', '7037', 300),
(344, '13974980828', '2593', 300),
(345, '15874189813', '8912', 300),
(346, '18673178130', '3677', 300),
(347, '18973162228', '8342', 300),
(348, '17752881113', '2970', 300),
(349, '15873120510', '4274', 300),
(350, '13973252154', '3464', 300),
(351, '13574170469', '2452', 300),
(352, '18975837220', '9647', 300),
(353, '13707483072', '6089', 300),
(354, '18692277955', '7450', 300),
(355, '18274986787', '4464', 300),
(356, '13787271771', '1567', 300),
(357, '15874077212', '8645', 300),
(358, '13787141816', '3650', 300),
(359, '18007315277', '3061', 300),
(360, '18574385086', '8344', 300),
(361, '13787237174', '7207', 300),
(362, '13469041058', '6632', 300),
(363, '18670018090', '7494', 300),
(364, '13637423111', '9658', 300),
(365, '18974815188', '9787', 300),
(366, '18975197090', '2106', 300),
(367, '13975869230', '2163', 300),
(368, '13825668093', '7416', 300),
(369, '18173272587', '4109', 300),
(370, '13787186099', '2405', 300),
(371, '17375703797', '2088', 300),
(372, '18670318151', '6038', 300),
(373, '13714701221', '5271', 300),
(374, '13574161697', '8891', 300),
(375, '18874158888', '2129', 300),
(376, '18973609177', '1541', 300),
(377, '13511168855', '7958', 300),
(378, '15084868684', '7427', 300),
(379, '13637314060', '1871', 300),
(380, '18688920731', '7866', 300),
(381, '13875972409', '8041', 300),
(382, '15388978787', '1881', 300),
(383, '15989084746', '1846', 300),
(384, '13873105127', '1896', 300),
(385, '13787127078', '3664', 300),
(386, '18608415750', '9133', 300),
(387, '15367819530', '1270', 300),
(388, '13574842332', '3515', 300),
(389, '13337312997', '2503', 300),
(390, '18684806798', '6474', 300),
(391, '13874923111', '2800', 300),
(392, '15387515622', '7384', 300),
(393, '18670380005', '8253', 300),
(394, '13574165420', '7551', 300),
(395, '18973191522', '7788', 300);

-- --------------------------------------------------------

--
-- 表的结构 `bao_user_gold_logs`
--

CREATE TABLE `bao_user_gold_logs` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT '0',
  `gold` int(11) DEFAULT '0',
  `intro` varchar(64) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_user_integral_logs`
--

CREATE TABLE `bao_user_integral_logs` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL,
  `intro` varchar(256) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_user_money_logs`
--

CREATE TABLE `bao_user_money_logs` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT '0',
  `money` int(11) DEFAULT '0',
  `intro` varchar(64) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_user_money_logs`
--

INSERT INTO `bao_user_money_logs` (`log_id`, `user_id`, `money`, `intro`, `create_time`, `create_ip`) VALUES
(122, 214, 26000, '444', 1506229519, '222.244.144.157');

-- --------------------------------------------------------

--
-- 表的结构 `bao_user_rank`
--

CREATE TABLE `bao_user_rank` (
  `rank_id` tinyint(3) UNSIGNED NOT NULL,
  `rank_name` varchar(32) DEFAULT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `icon1` varchar(64) DEFAULT NULL,
  `prestige` int(11) DEFAULT '0' COMMENT '需要的积分数',
  `rebate` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_user_rank`
--

INSERT INTO `bao_user_rank` (`rank_id`, `rank_name`, `icon`, `icon1`, `prestige`, `rebate`) VALUES
(1, 'VIP1', 'usericon0', '', 0, 1),
(2, 'VIP2', 'usericon1', 'usericon1', 100, 2),
(3, 'VIP3', 'usericon0', 'usericon1', 500, 3),
(4, 'VIP4', 'usericon0', 'usericon1', 1000, 5),
(5, 'VIP5', 'usericon0', 'usericon0', 5000, 10),
(6, 'VIP6', 'usericon0', 'usericon1', 10000, 15);

-- --------------------------------------------------------

--
-- 表的结构 `bao_user_sign`
--

CREATE TABLE `bao_user_sign` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `day` int(11) DEFAULT '0',
  `is_first` tinyint(4) DEFAULT '1',
  `last_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_village`
--

CREATE TABLE `bao_village` (
  `village_id` smallint(5) UNSIGNED NOT NULL,
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
  `info` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='小区表';

-- --------------------------------------------------------

--
-- 表的结构 `bao_village_bbs`
--

CREATE TABLE `bao_village_bbs` (
  `post_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `username` varchar(80) NOT NULL,
  `village_id` int(10) NOT NULL,
  `title` varchar(200) NOT NULL,
  `details` text NOT NULL,
  `view_num` int(10) NOT NULL DEFAULT '0',
  `zan_num` int(10) NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL,
  `create_ip` varchar(30) NOT NULL,
  `hot` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_village_bbs_replys`
--

CREATE TABLE `bao_village_bbs_replys` (
  `reply_id` int(10) NOT NULL,
  `village_id` int(10) NOT NULL,
  `post_id` int(10) NOT NULL DEFAULT '0',
  `parent_id` int(10) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `create_time` int(10) NOT NULL,
  `create_ip` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_village_notice`
--

CREATE TABLE `bao_village_notice` (
  `id` int(4) NOT NULL,
  `village_id` smallint(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `context` text NOT NULL,
  `addtime` int(11) NOT NULL,
  `type` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_village_suggestion`
--

CREATE TABLE `bao_village_suggestion` (
  `id` int(4) NOT NULL,
  `village_id` smallint(5) NOT NULL,
  `user` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `context` varchar(255) NOT NULL,
  `addtime` int(11) NOT NULL,
  `replytime` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  `reply` varchar(255) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `person` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_village_worker`
--

CREATE TABLE `bao_village_worker` (
  `id` int(4) NOT NULL,
  `village_id` smallint(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `job` varchar(50) NOT NULL,
  `orderby` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_vote`
--

CREATE TABLE `bao_vote` (
  `vote_id` int(10) NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `is_select` tinyint(2) DEFAULT '0',
  `is_pic` tinyint(2) DEFAULT '0',
  `banner` varchar(64) DEFAULT NULL,
  `num` int(10) DEFAULT '0',
  `shop_id` int(11) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_work` tinyint(2) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_vote_option`
--

CREATE TABLE `bao_vote_option` (
  `option_id` int(10) UNSIGNED NOT NULL,
  `vote_id` int(11) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  `number` int(11) DEFAULT '0',
  `orderby` tinyint(3) DEFAULT '100'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_vote_result`
--

CREATE TABLE `bao_vote_result` (
  `result_id` int(10) NOT NULL,
  `vote_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `vote_option` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `create_ip` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_weidian_details`
--

CREATE TABLE `bao_weidian_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `weidian_name` varchar(64) NOT NULL,
  `addr` varchar(128) NOT NULL,
  `business_time` varchar(32) NOT NULL,
  `details` text NOT NULL,
  `pic` varchar(64) NOT NULL,
  `logo` varchar(64) NOT NULL,
  `shop_id` int(10) UNSIGNED NOT NULL,
  `lng` varchar(15) NOT NULL,
  `lat` varchar(15) NOT NULL,
  `cate_id` int(10) UNSIGNED NOT NULL,
  `audit` tinyint(1) UNSIGNED NOT NULL,
  `reg_time` int(10) UNSIGNED NOT NULL,
  `update_time` int(10) UNSIGNED NOT NULL,
  `city_id` smallint(5) UNSIGNED NOT NULL,
  `area_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_weidian_details`
--

INSERT INTO `bao_weidian_details` (`id`, `weidian_name`, `addr`, `business_time`, `details`, `pic`, `logo`, `shop_id`, `lng`, `lat`, `cate_id`, `audit`, `reg_time`, `update_time`, `city_id`, `area_id`) VALUES
(16, '贝拉小镇', '湖南省长沙市望城区金州大道光明村', '', '<p>贝拉小镇国庆开园活动</p>', '2017/09/27/59cbad6e00b08.jpg', '2017/09/27/59cbad7112fa8.jpg', 144, '112.726569', '28.242617', 1, 1, 1506520435, 1506520458, 8, 24);

-- --------------------------------------------------------

--
-- 表的结构 `bao_weixin_conn`
--

CREATE TABLE `bao_weixin_conn` (
  `conn_id` int(20) NOT NULL,
  `state` varchar(64) NOT NULL,
  `status` int(2) NOT NULL,
  `user_id` int(10) NOT NULL,
  `create_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_weixin_keyword`
--

CREATE TABLE `bao_weixin_keyword` (
  `keyword_id` int(10) UNSIGNED NOT NULL,
  `keyword` varchar(32) DEFAULT NULL,
  `type` enum('news','text') DEFAULT 'text' COMMENT '0普通消息 1图片消息',
  `title` varchar(128) DEFAULT NULL,
  `contents` text,
  `url` varchar(128) DEFAULT NULL,
  `photo` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_weixin_msg`
--

CREATE TABLE `bao_weixin_msg` (
  `msg_id` int(10) UNSIGNED NOT NULL,
  `FromUserName` varchar(64) DEFAULT NULL,
  `ToUserName` varchar(64) DEFAULT NULL,
  `Content` varchar(1024) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_weixin_qrcode`
--

CREATE TABLE `bao_weixin_qrcode` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `type` tinyint(1) DEFAULT '0',
  `soure_id` smallint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_weixin_qrcode`
--

INSERT INTO `bao_weixin_qrcode` (`id`, `type`, `soure_id`) VALUES
(68, 1, 144),
(69, 3, 2);

-- --------------------------------------------------------

--
-- 表的结构 `bao_weixin_tmpl`
--

CREATE TABLE `bao_weixin_tmpl` (
  `tmpl_id` mediumint(9) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '模板标题',
  `serial` varchar(255) DEFAULT NULL COMMENT '模板系统编号',
  `template_id` varchar(255) DEFAULT NULL COMMENT '模板应用ID',
  `info` varchar(255) DEFAULT NULL COMMENT '模板介绍',
  `sort` tinyint(4) UNSIGNED DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) DEFAULT NULL COMMENT '模板介绍',
  `create_time` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_weixin_tmpl`
--

INSERT INTO `bao_weixin_tmpl` (`tmpl_id`, `title`, `serial`, `template_id`, `info`, `sort`, `status`, `create_time`, `update_time`) VALUES
(1, '下单成功通知', 'OPENTM202297555', 'crc5bMInGWI2xpeicir5Mkj0IjS5DRytUBpPdiPFjX4', NULL, 0, 1, 1446794361, 1446820734),
(2, '订单支付成功 ', 'OPENTM202243342', 'ywj44WufxVan804RdjBZ-P6zt_2nyi0X-cE7QzmH5w4', NULL, 0, 1, 1446794361, 1446820734),
(3, '订单确认通知', 'OPENTM203218540', 'Gbaib2CJQYcXQezu1BEJZAK0oJ_PPiAD2d7LuTXcjZk', NULL, 0, 1, 1446794361, 1446820734),
(4, '订单取消通知 ', 'TM00850', 'ydBf_eqCWUShMYyJ2LcI5ryhtvnUuq7eOm0RDiEG9nU', NULL, 0, 1, 1446794361, 1446820734),
(5, '订单发货通知', 'OPENTM202297614', 'umS5ptvztDdGFTsu-Sq0bxqnoSOf6jlCOTNUOV3bL9c', NULL, 0, 1, 1446794361, 1446820734),
(6, '订单确认收货通知', 'OPENTM202314085', 'J0j8u7ilwOPWElyHF7EskXxIxXmrleSVmcCC-E-ObMI', NULL, 0, 1, 1446794361, 1446820734),
(7, '账户余额变动通知', 'OPENTM205454780', 'MzpS9ENeHHN0LKuXFpEW5hIhtpW6hhcezIa-WiPBicA', NULL, 0, 1, 1446794361, 1446820734);

-- --------------------------------------------------------

--
-- 表的结构 `bao_work`
--

CREATE TABLE `bao_work` (
  `work_id` int(10) UNSIGNED NOT NULL,
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
  `views` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_yjuan`
--

CREATE TABLE `bao_yjuan` (
  `j_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nums` tinyint(4) NOT NULL DEFAULT '0',
  `use_num` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='优惠券表';

--
-- 转存表中的数据 `bao_yjuan`
--

INSERT INTO `bao_yjuan` (`j_id`, `user_id`, `nums`, `use_num`) VALUES
(110, 10084, 20, 2),
(111, 10085, 10, 0),
(112, 10095, 14, 0),
(113, 10131, 3, 2),
(114, 10094, 2, 0),
(115, 10140, 7, 2),
(116, 10086, 3, 0),
(117, 10168, 2, 2),
(118, 0, 2, 0),
(119, 10193, 89, 0),
(120, 10240, 2, 0),
(121, 10257, 2, 0),
(122, 10245, 1, 0),
(123, 10271, 10, 0),
(124, 10234, 2, 0),
(125, 10237, 4, 0),
(126, 10226, 12, 0),
(127, 10232, 1, 0),
(128, 10343, 2, 0),
(129, 10341, 5, 0),
(130, 10258, 3, 2),
(131, 10308, 11, 0),
(132, 10137, 5, 0),
(133, 10427, 3, 2),
(134, 10455, 4, 0),
(135, 10471, 2, 0),
(136, 10447, 3, 2),
(137, 10461, 3, 2),
(138, 10212, 1, 0),
(139, 10460, 2, 2),
(140, 10278, 1, 1),
(141, 10425, 3, 2),
(142, 10468, 2, 2),
(143, 10496, 2, 2),
(144, 10560, 8, 2),
(145, 10568, 2, 2),
(146, 10585, 2, 2),
(147, 10592, 2, 2),
(148, 10587, 2, 2),
(149, 10597, 2, 2),
(150, 10441, 3, 2),
(151, 10617, 3, 2),
(152, 10089, 2, 0),
(153, 10705, 2, 2),
(154, 10368, 6, 1),
(155, 10238, 2, 2),
(156, 10306, 1, 0),
(157, 10456, 2, 2),
(158, 10826, 1, 0),
(159, 10548, 1, 0),
(160, 10651, 6, 6),
(161, 10876, 3, 0),
(162, 10590, 2, 2),
(163, 10387, 1, 0),
(164, 10936, 3, 2),
(165, 10516, 2, 0),
(166, 10457, 1, 0),
(167, 10853, 2, 2),
(168, 10706, 2, 0),
(169, 10839, 1, 0),
(170, 10463, 2, 0),
(171, 11035, 2, 1),
(172, 10725, 2, 2),
(173, 11037, 2, 2),
(174, 10881, 1, 1),
(175, 11065, 3, 2),
(176, 11064, 2, 1),
(177, 11071, 2, 1),
(178, 10411, 1, 0),
(179, 11109, 4, 4),
(180, 11100, 2, 0),
(181, 11103, 2, 0),
(182, 11050, 2, 2),
(183, 11078, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `bao_zhuan`
--

CREATE TABLE `bao_zhuan` (
  `zhuan_id` int(10) NOT NULL,
  `map_id` tinyint(4) DEFAULT NULL,
  `goods_id` int(10) NOT NULL,
  `floor_id` tinyint(4) NOT NULL,
  `sort` smallint(6) NOT NULL DEFAULT '0',
  `deadline` int(10) NOT NULL COMMENT '到期时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_zhuan_config`
--

CREATE TABLE `bao_zhuan_config` (
  `config_id` int(11) NOT NULL,
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
  `status` tinyint(1) DEFAULT '1' COMMENT '0:删除,1正常'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bao_zhuan_floor`
--

CREATE TABLE `bao_zhuan_floor` (
  `floor_id` int(11) NOT NULL,
  `title` varchar(11) DEFAULT NULL COMMENT '11',
  `sort` tinyint(4) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '0:删除,1:正常'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_zhuan_floor`
--

INSERT INTO `bao_zhuan_floor` (`floor_id`, `title`, `sort`, `status`) VALUES
(3, '旅游', 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `bao_zhuan_map`
--

CREATE TABLE `bao_zhuan_map` (
  `map_id` tinyint(4) NOT NULL COMMENT '专题ID',
  `title` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '0:不启用，1:启用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bao_zhuan_map`
--

INSERT INTO `bao_zhuan_map` (`map_id`, `title`, `status`) VALUES
(1, '第一个专题', 1),
(2, '第二个专题', 1),
(3, '第三个专题', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bao_activity`
--
ALTER TABLE `bao_activity`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `bao_activity_cate`
--
ALTER TABLE `bao_activity_cate`
  ADD PRIMARY KEY (`cate_id`);

--
-- Indexes for table `bao_activity_sign`
--
ALTER TABLE `bao_activity_sign`
  ADD PRIMARY KEY (`sign_id`);

--
-- Indexes for table `bao_ad`
--
ALTER TABLE `bao_ad`
  ADD PRIMARY KEY (`ad_id`);

--
-- Indexes for table `bao_admin`
--
ALTER TABLE `bao_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `bao_ad_site`
--
ALTER TABLE `bao_ad_site`
  ADD PRIMARY KEY (`site_id`);

--
-- Indexes for table `bao_area`
--
ALTER TABLE `bao_area`
  ADD PRIMARY KEY (`area_id`);

--
-- Indexes for table `bao_around`
--
ALTER TABLE `bao_around`
  ADD PRIMARY KEY (`around_id`);

--
-- Indexes for table `bao_article`
--
ALTER TABLE `bao_article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `bao_article_cate`
--
ALTER TABLE `bao_article_cate`
  ADD PRIMARY KEY (`cate_id`);

--
-- Indexes for table `bao_article_comment`
--
ALTER TABLE `bao_article_comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `bao_award`
--
ALTER TABLE `bao_award`
  ADD PRIMARY KEY (`award_id`);

--
-- Indexes for table `bao_award_goods`
--
ALTER TABLE `bao_award_goods`
  ADD PRIMARY KEY (`goods_id`),
  ADD KEY `award_id` (`award_id`);

--
-- Indexes for table `bao_award_share`
--
ALTER TABLE `bao_award_share`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ip` (`ip`,`award_id`);

--
-- Indexes for table `bao_award_winning`
--
ALTER TABLE `bao_award_winning`
  ADD PRIMARY KEY (`winning_id`),
  ADD KEY `award_id` (`award_id`);

--
-- Indexes for table `bao_billboard`
--
ALTER TABLE `bao_billboard`
  ADD PRIMARY KEY (`list_id`);

--
-- Indexes for table `bao_bill_cate`
--
ALTER TABLE `bao_bill_cate`
  ADD PRIMARY KEY (`cate_id`);

--
-- Indexes for table `bao_bill_order`
--
ALTER TABLE `bao_bill_order`
  ADD PRIMARY KEY (`bill_order_id`);

--
-- Indexes for table `bao_bill_shop`
--
ALTER TABLE `bao_bill_shop`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indexes for table `bao_bill_type`
--
ALTER TABLE `bao_bill_type`
  ADD PRIMARY KEY (`bill_type_id`);

--
-- Indexes for table `bao_bill_vote`
--
ALTER TABLE `bao_bill_vote`
  ADD PRIMARY KEY (`vote_id`);

--
-- Indexes for table `bao_business`
--
ALTER TABLE `bao_business`
  ADD PRIMARY KEY (`business_id`);

--
-- Indexes for table `bao_city`
--
ALTER TABLE `bao_city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `bao_community`
--
ALTER TABLE `bao_community`
  ADD PRIMARY KEY (`community_id`),
  ADD KEY `city_id` (`city_id`,`area_id`);

--
-- Indexes for table `bao_community_news`
--
ALTER TABLE `bao_community_news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `bao_community_posts`
--
ALTER TABLE `bao_community_posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `bao_community_replys`
--
ALTER TABLE `bao_community_replys`
  ADD PRIMARY KEY (`reply_id`);

--
-- Indexes for table `bao_community_users`
--
ALTER TABLE `bao_community_users`
  ADD PRIMARY KEY (`join_id`);

--
-- Indexes for table `bao_connect`
--
ALTER TABLE `bao_connect`
  ADD PRIMARY KEY (`connect_id`),
  ADD UNIQUE KEY `type` (`type`,`open_id`);

--
-- Indexes for table `bao_convenient_phone`
--
ALTER TABLE `bao_convenient_phone`
  ADD PRIMARY KEY (`phone_id`);

--
-- Indexes for table `bao_convenient_phone_maps`
--
ALTER TABLE `bao_convenient_phone_maps`
  ADD UNIQUE KEY `phone_id` (`phone_id`,`community_id`);

--
-- Indexes for table `bao_convenient_phone_villages`
--
ALTER TABLE `bao_convenient_phone_villages`
  ADD UNIQUE KEY `phone_id` (`phone_id`,`village_id`);

--
-- Indexes for table `bao_coupon`
--
ALTER TABLE `bao_coupon`
  ADD PRIMARY KEY (`coupon_id`),
  ADD KEY `cate_id` (`cate_id`,`area_id`);

--
-- Indexes for table `bao_coupon_download`
--
ALTER TABLE `bao_coupon_download`
  ADD PRIMARY KEY (`download_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `bao_delivery`
--
ALTER TABLE `bao_delivery`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `bao_delivery_order`
--
ALTER TABLE `bao_delivery_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `bao_ele`
--
ALTER TABLE `bao_ele`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indexes for table `bao_ele_cate`
--
ALTER TABLE `bao_ele_cate`
  ADD PRIMARY KEY (`cate_id`),
  ADD KEY `shop_id` (`shop_id`);

--
-- Indexes for table `bao_ele_dianping`
--
ALTER TABLE `bao_ele_dianping`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `bao_ele_dianping_pics`
--
ALTER TABLE `bao_ele_dianping_pics`
  ADD PRIMARY KEY (`pic_id`),
  ADD KEY `dianping_id` (`order_id`);

--
-- Indexes for table `bao_ele_order`
--
ALTER TABLE `bao_ele_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `bao_ele_order_product`
--
ALTER TABLE `bao_ele_order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `bao_ele_product`
--
ALTER TABLE `bao_ele_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `shop_id` (`shop_id`);

--
-- Indexes for table `bao_email`
--
ALTER TABLE `bao_email`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `email_key` (`email_key`);

--
-- Indexes for table `bao_express`
--
ALTER TABLE `bao_express`
  ADD PRIMARY KEY (`express_id`);

--
-- Indexes for table `bao_feedback`
--
ALTER TABLE `bao_feedback`
  ADD PRIMARY KEY (`feed_id`);

--
-- Indexes for table `bao_found`
--
ALTER TABLE `bao_found`
  ADD PRIMARY KEY (`found_id`);

--
-- Indexes for table `bao_goods`
--
ALTER TABLE `bao_goods`
  ADD PRIMARY KEY (`goods_id`);

--
-- Indexes for table `bao_goods_cate`
--
ALTER TABLE `bao_goods_cate`
  ADD PRIMARY KEY (`cate_id`);

--
-- Indexes for table `bao_goods_cate_attr`
--
ALTER TABLE `bao_goods_cate_attr`
  ADD PRIMARY KEY (`attr_id`);

--
-- Indexes for table `bao_goods_dianping`
--
ALTER TABLE `bao_goods_dianping`
  ADD PRIMARY KEY (`dianping_id`);

--
-- Indexes for table `bao_goods_dianping_pics`
--
ALTER TABLE `bao_goods_dianping_pics`
  ADD PRIMARY KEY (`pic_id`),
  ADD KEY `dianping_id` (`dianping_id`);

--
-- Indexes for table `bao_goods_photos`
--
ALTER TABLE `bao_goods_photos`
  ADD PRIMARY KEY (`pic_id`);

--
-- Indexes for table `bao_goods_shopcate`
--
ALTER TABLE `bao_goods_shopcate`
  ADD PRIMARY KEY (`cate_id`);

--
-- Indexes for table `bao_housework`
--
ALTER TABLE `bao_housework`
  ADD PRIMARY KEY (`housework_id`),
  ADD KEY `svc_id` (`svc_id`);

--
-- Indexes for table `bao_housework_look`
--
ALTER TABLE `bao_housework_look`
  ADD PRIMARY KEY (`look_id`),
  ADD UNIQUE KEY `housework_id` (`housework_id`,`shop_id`);

--
-- Indexes for table `bao_housework_setting`
--
ALTER TABLE `bao_housework_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bao_huodong`
--
ALTER TABLE `bao_huodong`
  ADD PRIMARY KEY (`huodong_id`);

--
-- Indexes for table `bao_huodong_sign`
--
ALTER TABLE `bao_huodong_sign`
  ADD PRIMARY KEY (`sign_id`);

--
-- Indexes for table `bao_integral_exchange`
--
ALTER TABLE `bao_integral_exchange`
  ADD PRIMARY KEY (`exchange_id`);

--
-- Indexes for table `bao_integral_goods`
--
ALTER TABLE `bao_integral_goods`
  ADD PRIMARY KEY (`goods_id`);

--
-- Indexes for table `bao_keyword`
--
ALTER TABLE `bao_keyword`
  ADD PRIMARY KEY (`key_id`);

--
-- Indexes for table `bao_life`
--
ALTER TABLE `bao_life`
  ADD PRIMARY KEY (`life_id`);

--
-- Indexes for table `bao_life_cate`
--
ALTER TABLE `bao_life_cate`
  ADD PRIMARY KEY (`cate_id`);

--
-- Indexes for table `bao_life_cate_attr`
--
ALTER TABLE `bao_life_cate_attr`
  ADD PRIMARY KEY (`attr_id`);

--
-- Indexes for table `bao_life_details`
--
ALTER TABLE `bao_life_details`
  ADD PRIMARY KEY (`life_id`);

--
-- Indexes for table `bao_life_love`
--
ALTER TABLE `bao_life_love`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `life_id` (`life_id`,`user_id`);

--
-- Indexes for table `bao_life_photos`
--
ALTER TABLE `bao_life_photos`
  ADD PRIMARY KEY (`pic_id`);

--
-- Indexes for table `bao_life_report`
--
ALTER TABLE `bao_life_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bao_links`
--
ALTER TABLE `bao_links`
  ADD PRIMARY KEY (`link_id`);

--
-- Indexes for table `bao_lock`
--
ALTER TABLE `bao_lock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`,`t`);

--
-- Indexes for table `bao_market`
--
ALTER TABLE `bao_market`
  ADD PRIMARY KEY (`market_id`);

--
-- Indexes for table `bao_market_activity`
--
ALTER TABLE `bao_market_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bao_market_details`
--
ALTER TABLE `bao_market_details`
  ADD PRIMARY KEY (`market_id`);

--
-- Indexes for table `bao_market_enter`
--
ALTER TABLE `bao_market_enter`
  ADD PRIMARY KEY (`enter_id`);

--
-- Indexes for table `bao_market_favorites`
--
ALTER TABLE `bao_market_favorites`
  ADD PRIMARY KEY (`favorites_id`);

--
-- Indexes for table `bao_market_pic`
--
ALTER TABLE `bao_market_pic`
  ADD PRIMARY KEY (`pic_id`);

--
-- Indexes for table `bao_menu`
--
ALTER TABLE `bao_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `bao_message`
--
ALTER TABLE `bao_message`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `bao_msg`
--
ALTER TABLE `bao_msg`
  ADD PRIMARY KEY (`msg_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `bao_msg_read`
--
ALTER TABLE `bao_msg_read`
  ADD PRIMARY KEY (`read_id`),
  ADD UNIQUE KEY `msg_id` (`msg_id`,`user_id`);

--
-- Indexes for table `bao_order`
--
ALTER TABLE `bao_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `bao_order_goods`
--
ALTER TABLE `bao_order_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `bao_order_pick`
--
ALTER TABLE `bao_order_pick`
  ADD PRIMARY KEY (`pick_id`);

--
-- Indexes for table `bao_payment`
--
ALTER TABLE `bao_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `bao_payment_logs`
--
ALTER TABLE `bao_payment_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `bao_piaofutong_callback`
--
ALTER TABLE `bao_piaofutong_callback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bao_post`
--
ALTER TABLE `bao_post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `bao_post_reply`
--
ALTER TABLE `bao_post_reply`
  ADD PRIMARY KEY (`reply_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `bao_post_zan`
--
ALTER TABLE `bao_post_zan`
  ADD PRIMARY KEY (`zan_id`),
  ADD UNIQUE KEY `post_id` (`post_id`,`create_ip`);

--
-- Indexes for table `bao_qrcode_census`
--
ALTER TABLE `bao_qrcode_census`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`user_id`) USING BTREE;

--
-- Indexes for table `bao_quanming`
--
ALTER TABLE `bao_quanming`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `uid` (`uid`,`rank`);

--
-- Indexes for table `bao_recharge_card`
--
ALTER TABLE `bao_recharge_card`
  ADD PRIMARY KEY (`card_id`);

--
-- Indexes for table `bao_role`
--
ALTER TABLE `bao_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `bao_role_maps`
--
ALTER TABLE `bao_role_maps`
  ADD UNIQUE KEY `role_id` (`role_id`,`menu_id`);

--
-- Indexes for table `bao_sensitive_words`
--
ALTER TABLE `bao_sensitive_words`
  ADD PRIMARY KEY (`words_id`);

--
-- Indexes for table `bao_seo`
--
ALTER TABLE `bao_seo`
  ADD PRIMARY KEY (`seo_id`);

--
-- Indexes for table `bao_session`
--
ALTER TABLE `bao_session`
  ADD UNIQUE KEY `session_id` (`session_id`);

--
-- Indexes for table `bao_setting`
--
ALTER TABLE `bao_setting`
  ADD UNIQUE KEY `k` (`k`);

--
-- Indexes for table `bao_share_cate`
--
ALTER TABLE `bao_share_cate`
  ADD PRIMARY KEY (`cate_id`);

--
-- Indexes for table `bao_shop`
--
ALTER TABLE `bao_shop`
  ADD PRIMARY KEY (`shop_id`),
  ADD KEY `cate_id` (`cate_id`,`area_id`,`business_id`);

--
-- Indexes for table `bao_shop_banner`
--
ALTER TABLE `bao_shop_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `bao_shop_branch`
--
ALTER TABLE `bao_shop_branch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `bao_shop_cate`
--
ALTER TABLE `bao_shop_cate`
  ADD PRIMARY KEY (`cate_id`);

--
-- Indexes for table `bao_shop_comment`
--
ALTER TABLE `bao_shop_comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `bao_shop_details`
--
ALTER TABLE `bao_shop_details`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indexes for table `bao_shop_dianping`
--
ALTER TABLE `bao_shop_dianping`
  ADD PRIMARY KEY (`dianping_id`),
  ADD KEY `shop_id` (`shop_id`);

--
-- Indexes for table `bao_shop_dianping_pics`
--
ALTER TABLE `bao_shop_dianping_pics`
  ADD PRIMARY KEY (`pic_id`),
  ADD KEY `dianping_id` (`dianping_id`);

--
-- Indexes for table `bao_shop_ding_cate`
--
ALTER TABLE `bao_shop_ding_cate`
  ADD PRIMARY KEY (`cate_id`);

--
-- Indexes for table `bao_shop_ding_dianping`
--
ALTER TABLE `bao_shop_ding_dianping`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `bao_shop_ding_dianping_pic`
--
ALTER TABLE `bao_shop_ding_dianping_pic`
  ADD PRIMARY KEY (`pic_id`),
  ADD KEY `dianping_id` (`order_id`);

--
-- Indexes for table `bao_shop_ding_menu`
--
ALTER TABLE `bao_shop_ding_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `bao_shop_ding_order`
--
ALTER TABLE `bao_shop_ding_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `bao_shop_ding_room`
--
ALTER TABLE `bao_shop_ding_room`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `shop_id` (`shop_id`);

--
-- Indexes for table `bao_shop_ding_setting`
--
ALTER TABLE `bao_shop_ding_setting`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indexes for table `bao_shop_ding_yuyue`
--
ALTER TABLE `bao_shop_ding_yuyue`
  ADD PRIMARY KEY (`ding_id`);

--
-- Indexes for table `bao_shop_expand`
--
ALTER TABLE `bao_shop_expand`
  ADD PRIMARY KEY (`expand_id`);

--
-- Indexes for table `bao_shop_favorites`
--
ALTER TABLE `bao_shop_favorites`
  ADD PRIMARY KEY (`favorites_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`shop_id`);

--
-- Indexes for table `bao_shop_life_service`
--
ALTER TABLE `bao_shop_life_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bao_shop_logs`
--
ALTER TABLE `bao_shop_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `bao_shop_money`
--
ALTER TABLE `bao_shop_money`
  ADD PRIMARY KEY (`money_id`),
  ADD KEY `shop_id` (`shop_id`);

--
-- Indexes for table `bao_shop_news`
--
ALTER TABLE `bao_shop_news`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `shop_id` (`shop_id`),
  ADD KEY `cate_id` (`cate_id`);

--
-- Indexes for table `bao_shop_pic`
--
ALTER TABLE `bao_shop_pic`
  ADD PRIMARY KEY (`pic_id`);

--
-- Indexes for table `bao_shop_weixin_access`
--
ALTER TABLE `bao_shop_weixin_access`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indexes for table `bao_shop_weixin_keyword`
--
ALTER TABLE `bao_shop_weixin_keyword`
  ADD PRIMARY KEY (`keyword_id`),
  ADD UNIQUE KEY `shop_id` (`shop_id`,`keyword`);

--
-- Indexes for table `bao_shop_worker`
--
ALTER TABLE `bao_shop_worker`
  ADD PRIMARY KEY (`worker_id`);

--
-- Indexes for table `bao_shop_yuyue`
--
ALTER TABLE `bao_shop_yuyue`
  ADD PRIMARY KEY (`yuyue_id`);

--
-- Indexes for table `bao_sms`
--
ALTER TABLE `bao_sms`
  ADD PRIMARY KEY (`sms_id`),
  ADD UNIQUE KEY `sms_key` (`sms_key`);

--
-- Indexes for table `bao_system_content`
--
ALTER TABLE `bao_system_content`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `bao_template`
--
ALTER TABLE `bao_template`
  ADD PRIMARY KEY (`template_id`),
  ADD UNIQUE KEY `theme` (`theme`);

--
-- Indexes for table `bao_template_setting`
--
ALTER TABLE `bao_template_setting`
  ADD UNIQUE KEY `theme` (`theme`);

--
-- Indexes for table `bao_tongji`
--
ALTER TABLE `bao_tongji`
  ADD PRIMARY KEY (`tongji_id`),
  ADD KEY `from` (`from`),
  ADD KEY `keyword` (`keyword`),
  ADD KEY `type` (`type`),
  ADD KEY `year` (`year`,`month`);

--
-- Indexes for table `bao_tuan`
--
ALTER TABLE `bao_tuan`
  ADD PRIMARY KEY (`tuan_id`),
  ADD KEY `cate_id` (`cate_id`,`area_id`);

--
-- Indexes for table `bao_tuan_cate`
--
ALTER TABLE `bao_tuan_cate`
  ADD PRIMARY KEY (`cate_id`);

--
-- Indexes for table `bao_tuan_code`
--
ALTER TABLE `bao_tuan_code`
  ADD PRIMARY KEY (`code_id`);

--
-- Indexes for table `bao_tuan_details`
--
ALTER TABLE `bao_tuan_details`
  ADD PRIMARY KEY (`tuan_id`);

--
-- Indexes for table `bao_tuan_dianping`
--
ALTER TABLE `bao_tuan_dianping`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `bao_tuan_dianping_pics`
--
ALTER TABLE `bao_tuan_dianping_pics`
  ADD PRIMARY KEY (`pic_id`);

--
-- Indexes for table `bao_tuan_order`
--
ALTER TABLE `bao_tuan_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `bao_tuan_view`
--
ALTER TABLE `bao_tuan_view`
  ADD PRIMARY KEY (`view_id`);

--
-- Indexes for table `bao_tui`
--
ALTER TABLE `bao_tui`
  ADD PRIMARY KEY (`tui_id`);

--
-- Indexes for table `bao_users`
--
ALTER TABLE `bao_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `p_openid` (`account`);

--
-- Indexes for table `bao_users_cash`
--
ALTER TABLE `bao_users_cash`
  ADD PRIMARY KEY (`cash_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `bao_users_ex`
--
ALTER TABLE `bao_users_ex`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `bao_users_goods`
--
ALTER TABLE `bao_users_goods`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `bao_users_look`
--
ALTER TABLE `bao_users_look`
  ADD PRIMARY KEY (`look_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`shop_id`);

--
-- Indexes for table `bao_users_visitors`
--
ALTER TABLE `bao_users_visitors`
  ADD PRIMARY KEY (`visitors_id`),
  ADD UNIQUE KEY `uid` (`uid`,`user_id`);

--
-- Indexes for table `bao_user_addr`
--
ALTER TABLE `bao_user_addr`
  ADD PRIMARY KEY (`addr_id`);

--
-- Indexes for table `bao_user_card`
--
ALTER TABLE `bao_user_card`
  ADD PRIMARY KEY (`card_id`),
  ADD UNIQUE KEY `card_num` (`card_num`);

--
-- Indexes for table `bao_user_code`
--
ALTER TABLE `bao_user_code`
  ADD PRIMARY KEY (`code_id`);

--
-- Indexes for table `bao_user_gold_logs`
--
ALTER TABLE `bao_user_gold_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `bao_user_integral_logs`
--
ALTER TABLE `bao_user_integral_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `bao_user_money_logs`
--
ALTER TABLE `bao_user_money_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `bao_user_rank`
--
ALTER TABLE `bao_user_rank`
  ADD PRIMARY KEY (`rank_id`);

--
-- Indexes for table `bao_user_sign`
--
ALTER TABLE `bao_user_sign`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `bao_village`
--
ALTER TABLE `bao_village`
  ADD PRIMARY KEY (`village_id`),
  ADD KEY `city_id` (`city_id`,`area_id`);

--
-- Indexes for table `bao_village_bbs`
--
ALTER TABLE `bao_village_bbs`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `bao_village_bbs_replys`
--
ALTER TABLE `bao_village_bbs_replys`
  ADD PRIMARY KEY (`reply_id`);

--
-- Indexes for table `bao_village_notice`
--
ALTER TABLE `bao_village_notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bao_village_suggestion`
--
ALTER TABLE `bao_village_suggestion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bao_village_worker`
--
ALTER TABLE `bao_village_worker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bao_vote`
--
ALTER TABLE `bao_vote`
  ADD PRIMARY KEY (`vote_id`);

--
-- Indexes for table `bao_vote_option`
--
ALTER TABLE `bao_vote_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `bao_vote_result`
--
ALTER TABLE `bao_vote_result`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `vote_id` (`vote_id`,`create_ip`);

--
-- Indexes for table `bao_weidian_details`
--
ALTER TABLE `bao_weidian_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bao_weixin_conn`
--
ALTER TABLE `bao_weixin_conn`
  ADD PRIMARY KEY (`conn_id`);

--
-- Indexes for table `bao_weixin_keyword`
--
ALTER TABLE `bao_weixin_keyword`
  ADD PRIMARY KEY (`keyword_id`);

--
-- Indexes for table `bao_weixin_msg`
--
ALTER TABLE `bao_weixin_msg`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `bao_weixin_qrcode`
--
ALTER TABLE `bao_weixin_qrcode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bao_weixin_tmpl`
--
ALTER TABLE `bao_weixin_tmpl`
  ADD PRIMARY KEY (`tmpl_id`);

--
-- Indexes for table `bao_work`
--
ALTER TABLE `bao_work`
  ADD PRIMARY KEY (`work_id`),
  ADD KEY `shop_id` (`shop_id`),
  ADD KEY `lng` (`lng`,`lat`);

--
-- Indexes for table `bao_yjuan`
--
ALTER TABLE `bao_yjuan`
  ADD PRIMARY KEY (`j_id`);

--
-- Indexes for table `bao_zhuan`
--
ALTER TABLE `bao_zhuan`
  ADD PRIMARY KEY (`zhuan_id`);

--
-- Indexes for table `bao_zhuan_config`
--
ALTER TABLE `bao_zhuan_config`
  ADD PRIMARY KEY (`config_id`);

--
-- Indexes for table `bao_zhuan_floor`
--
ALTER TABLE `bao_zhuan_floor`
  ADD PRIMARY KEY (`floor_id`);

--
-- Indexes for table `bao_zhuan_map`
--
ALTER TABLE `bao_zhuan_map`
  ADD PRIMARY KEY (`map_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `bao_activity`
--
ALTER TABLE `bao_activity`
  MODIFY `activity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- 使用表AUTO_INCREMENT `bao_activity_cate`
--
ALTER TABLE `bao_activity_cate`
  MODIFY `cate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- 使用表AUTO_INCREMENT `bao_activity_sign`
--
ALTER TABLE `bao_activity_sign`
  MODIFY `sign_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- 使用表AUTO_INCREMENT `bao_ad`
--
ALTER TABLE `bao_ad`
  MODIFY `ad_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;
--
-- 使用表AUTO_INCREMENT `bao_admin`
--
ALTER TABLE `bao_admin`
  MODIFY `admin_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `bao_ad_site`
--
ALTER TABLE `bao_ad_site`
  MODIFY `site_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- 使用表AUTO_INCREMENT `bao_area`
--
ALTER TABLE `bao_area`
  MODIFY `area_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- 使用表AUTO_INCREMENT `bao_around`
--
ALTER TABLE `bao_around`
  MODIFY `around_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `bao_article`
--
ALTER TABLE `bao_article`
  MODIFY `article_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `bao_article_cate`
--
ALTER TABLE `bao_article_cate`
  MODIFY `cate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- 使用表AUTO_INCREMENT `bao_article_comment`
--
ALTER TABLE `bao_article_comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id', AUTO_INCREMENT=15;
--
-- 使用表AUTO_INCREMENT `bao_award`
--
ALTER TABLE `bao_award`
  MODIFY `award_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `bao_award_goods`
--
ALTER TABLE `bao_award_goods`
  MODIFY `goods_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- 使用表AUTO_INCREMENT `bao_award_share`
--
ALTER TABLE `bao_award_share`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- 使用表AUTO_INCREMENT `bao_award_winning`
--
ALTER TABLE `bao_award_winning`
  MODIFY `winning_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `bao_billboard`
--
ALTER TABLE `bao_billboard`
  MODIFY `list_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- 使用表AUTO_INCREMENT `bao_bill_cate`
--
ALTER TABLE `bao_bill_cate`
  MODIFY `cate_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `bao_bill_order`
--
ALTER TABLE `bao_bill_order`
  MODIFY `bill_order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- 使用表AUTO_INCREMENT `bao_bill_shop`
--
ALTER TABLE `bao_bill_shop`
  MODIFY `bill_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `bao_bill_type`
--
ALTER TABLE `bao_bill_type`
  MODIFY `bill_type_id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `bao_bill_vote`
--
ALTER TABLE `bao_bill_vote`
  MODIFY `vote_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `bao_business`
--
ALTER TABLE `bao_business`
  MODIFY `business_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- 使用表AUTO_INCREMENT `bao_city`
--
ALTER TABLE `bao_city`
  MODIFY `city_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `bao_community`
--
ALTER TABLE `bao_community`
  MODIFY `community_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `bao_community_news`
--
ALTER TABLE `bao_community_news`
  MODIFY `news_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- 使用表AUTO_INCREMENT `bao_community_posts`
--
ALTER TABLE `bao_community_posts`
  MODIFY `post_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `bao_community_replys`
--
ALTER TABLE `bao_community_replys`
  MODIFY `reply_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `bao_community_users`
--
ALTER TABLE `bao_community_users`
  MODIFY `join_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- 使用表AUTO_INCREMENT `bao_connect`
--
ALTER TABLE `bao_connect`
  MODIFY `connect_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- 使用表AUTO_INCREMENT `bao_convenient_phone`
--
ALTER TABLE `bao_convenient_phone`
  MODIFY `phone_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- 使用表AUTO_INCREMENT `bao_coupon`
--
ALTER TABLE `bao_coupon`
  MODIFY `coupon_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- 使用表AUTO_INCREMENT `bao_coupon_download`
--
ALTER TABLE `bao_coupon_download`
  MODIFY `download_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;
--
-- 使用表AUTO_INCREMENT `bao_delivery`
--
ALTER TABLE `bao_delivery`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `bao_delivery_order`
--
ALTER TABLE `bao_delivery_order`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
--
-- 使用表AUTO_INCREMENT `bao_ele`
--
ALTER TABLE `bao_ele`
  MODIFY `shop_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;
--
-- 使用表AUTO_INCREMENT `bao_ele_cate`
--
ALTER TABLE `bao_ele_cate`
  MODIFY `cate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `bao_ele_dianping_pics`
--
ALTER TABLE `bao_ele_dianping_pics`
  MODIFY `pic_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `bao_ele_order`
--
ALTER TABLE `bao_ele_order`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;
--
-- 使用表AUTO_INCREMENT `bao_ele_order_product`
--
ALTER TABLE `bao_ele_order_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=372;
--
-- 使用表AUTO_INCREMENT `bao_ele_product`
--
ALTER TABLE `bao_ele_product`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `bao_email`
--
ALTER TABLE `bao_email`
  MODIFY `email_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `bao_express`
--
ALTER TABLE `bao_express`
  MODIFY `express_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `bao_feedback`
--
ALTER TABLE `bao_feedback`
  MODIFY `feed_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `bao_found`
--
ALTER TABLE `bao_found`
  MODIFY `found_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `bao_goods`
--
ALTER TABLE `bao_goods`
  MODIFY `goods_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `bao_goods_cate`
--
ALTER TABLE `bao_goods_cate`
  MODIFY `cate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `bao_goods_cate_attr`
--
ALTER TABLE `bao_goods_cate_attr`
  MODIFY `attr_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- 使用表AUTO_INCREMENT `bao_goods_dianping_pics`
--
ALTER TABLE `bao_goods_dianping_pics`
  MODIFY `pic_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `bao_goods_photos`
--
ALTER TABLE `bao_goods_photos`
  MODIFY `pic_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `bao_goods_shopcate`
--
ALTER TABLE `bao_goods_shopcate`
  MODIFY `cate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- 使用表AUTO_INCREMENT `bao_housework`
--
ALTER TABLE `bao_housework`
  MODIFY `housework_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- 使用表AUTO_INCREMENT `bao_housework_look`
--
ALTER TABLE `bao_housework_look`
  MODIFY `look_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- 使用表AUTO_INCREMENT `bao_housework_setting`
--
ALTER TABLE `bao_housework_setting`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `bao_huodong`
--
ALTER TABLE `bao_huodong`
  MODIFY `huodong_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- 使用表AUTO_INCREMENT `bao_huodong_sign`
--
ALTER TABLE `bao_huodong_sign`
  MODIFY `sign_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- 使用表AUTO_INCREMENT `bao_integral_exchange`
--
ALTER TABLE `bao_integral_exchange`
  MODIFY `exchange_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- 使用表AUTO_INCREMENT `bao_integral_goods`
--
ALTER TABLE `bao_integral_goods`
  MODIFY `goods_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `bao_keyword`
--
ALTER TABLE `bao_keyword`
  MODIFY `key_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `bao_life`
--
ALTER TABLE `bao_life`
  MODIFY `life_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- 使用表AUTO_INCREMENT `bao_life_cate`
--
ALTER TABLE `bao_life_cate`
  MODIFY `cate_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;
--
-- 使用表AUTO_INCREMENT `bao_life_cate_attr`
--
ALTER TABLE `bao_life_cate_attr`
  MODIFY `attr_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2684;
--
-- 使用表AUTO_INCREMENT `bao_life_love`
--
ALTER TABLE `bao_life_love`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `bao_life_photos`
--
ALTER TABLE `bao_life_photos`
  MODIFY `pic_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;
--
-- 使用表AUTO_INCREMENT `bao_life_report`
--
ALTER TABLE `bao_life_report`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `bao_links`
--
ALTER TABLE `bao_links`
  MODIFY `link_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `bao_lock`
--
ALTER TABLE `bao_lock`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=550;
--
-- 使用表AUTO_INCREMENT `bao_market`
--
ALTER TABLE `bao_market`
  MODIFY `market_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `bao_market_activity`
--
ALTER TABLE `bao_market_activity`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `bao_market_enter`
--
ALTER TABLE `bao_market_enter`
  MODIFY `enter_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `bao_market_favorites`
--
ALTER TABLE `bao_market_favorites`
  MODIFY `favorites_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `bao_market_pic`
--
ALTER TABLE `bao_market_pic`
  MODIFY `pic_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- 使用表AUTO_INCREMENT `bao_menu`
--
ALTER TABLE `bao_menu`
  MODIFY `menu_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=587;
--
-- 使用表AUTO_INCREMENT `bao_message`
--
ALTER TABLE `bao_message`
  MODIFY `msg_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `bao_msg`
--
ALTER TABLE `bao_msg`
  MODIFY `msg_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `bao_msg_read`
--
ALTER TABLE `bao_msg_read`
  MODIFY `read_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `bao_order`
--
ALTER TABLE `bao_order`
  MODIFY `order_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83950751;
--
-- 使用表AUTO_INCREMENT `bao_order_goods`
--
ALTER TABLE `bao_order_goods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=341;
--
-- 使用表AUTO_INCREMENT `bao_order_pick`
--
ALTER TABLE `bao_order_pick`
  MODIFY `pick_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- 使用表AUTO_INCREMENT `bao_payment`
--
ALTER TABLE `bao_payment`
  MODIFY `payment_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `bao_payment_logs`
--
ALTER TABLE `bao_payment_logs`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;
--
-- 使用表AUTO_INCREMENT `bao_piaofutong_callback`
--
ALTER TABLE `bao_piaofutong_callback`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;
--
-- 使用表AUTO_INCREMENT `bao_post`
--
ALTER TABLE `bao_post`
  MODIFY `post_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- 使用表AUTO_INCREMENT `bao_post_reply`
--
ALTER TABLE `bao_post_reply`
  MODIFY `reply_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
--
-- 使用表AUTO_INCREMENT `bao_post_zan`
--
ALTER TABLE `bao_post_zan`
  MODIFY `zan_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
--
-- 使用表AUTO_INCREMENT `bao_qrcode_census`
--
ALTER TABLE `bao_qrcode_census`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `bao_quanming`
--
ALTER TABLE `bao_quanming`
  MODIFY `tid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `bao_recharge_card`
--
ALTER TABLE `bao_recharge_card`
  MODIFY `card_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- 使用表AUTO_INCREMENT `bao_role`
--
ALTER TABLE `bao_role`
  MODIFY `role_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `bao_sensitive_words`
--
ALTER TABLE `bao_sensitive_words`
  MODIFY `words_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `bao_seo`
--
ALTER TABLE `bao_seo`
  MODIFY `seo_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- 使用表AUTO_INCREMENT `bao_share_cate`
--
ALTER TABLE `bao_share_cate`
  MODIFY `cate_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `bao_shop`
--
ALTER TABLE `bao_shop`
  MODIFY `shop_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;
--
-- 使用表AUTO_INCREMENT `bao_shop_banner`
--
ALTER TABLE `bao_shop_banner`
  MODIFY `banner_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- 使用表AUTO_INCREMENT `bao_shop_branch`
--
ALTER TABLE `bao_shop_branch`
  MODIFY `branch_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- 使用表AUTO_INCREMENT `bao_shop_cate`
--
ALTER TABLE `bao_shop_cate`
  MODIFY `cate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- 使用表AUTO_INCREMENT `bao_shop_comment`
--
ALTER TABLE `bao_shop_comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `bao_shop_dianping`
--
ALTER TABLE `bao_shop_dianping`
  MODIFY `dianping_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- 使用表AUTO_INCREMENT `bao_shop_dianping_pics`
--
ALTER TABLE `bao_shop_dianping_pics`
  MODIFY `pic_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- 使用表AUTO_INCREMENT `bao_shop_ding_cate`
--
ALTER TABLE `bao_shop_ding_cate`
  MODIFY `cate_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `bao_shop_ding_dianping_pic`
--
ALTER TABLE `bao_shop_ding_dianping_pic`
  MODIFY `pic_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `bao_shop_ding_menu`
--
ALTER TABLE `bao_shop_ding_menu`
  MODIFY `menu_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `bao_shop_ding_order`
--
ALTER TABLE `bao_shop_ding_order`
  MODIFY `order_id` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;
--
-- 使用表AUTO_INCREMENT `bao_shop_ding_room`
--
ALTER TABLE `bao_shop_ding_room`
  MODIFY `room_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `bao_shop_ding_yuyue`
--
ALTER TABLE `bao_shop_ding_yuyue`
  MODIFY `ding_id` mediumint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
--
-- 使用表AUTO_INCREMENT `bao_shop_expand`
--
ALTER TABLE `bao_shop_expand`
  MODIFY `expand_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `bao_shop_favorites`
--
ALTER TABLE `bao_shop_favorites`
  MODIFY `favorites_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
--
-- 使用表AUTO_INCREMENT `bao_shop_life_service`
--
ALTER TABLE `bao_shop_life_service`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `bao_shop_logs`
--
ALTER TABLE `bao_shop_logs`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `bao_shop_money`
--
ALTER TABLE `bao_shop_money`
  MODIFY `money_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
--
-- 使用表AUTO_INCREMENT `bao_shop_news`
--
ALTER TABLE `bao_shop_news`
  MODIFY `news_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- 使用表AUTO_INCREMENT `bao_shop_pic`
--
ALTER TABLE `bao_shop_pic`
  MODIFY `pic_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- 使用表AUTO_INCREMENT `bao_shop_weixin_keyword`
--
ALTER TABLE `bao_shop_weixin_keyword`
  MODIFY `keyword_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `bao_shop_worker`
--
ALTER TABLE `bao_shop_worker`
  MODIFY `worker_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `bao_shop_yuyue`
--
ALTER TABLE `bao_shop_yuyue`
  MODIFY `yuyue_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- 使用表AUTO_INCREMENT `bao_sms`
--
ALTER TABLE `bao_sms`
  MODIFY `sms_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- 使用表AUTO_INCREMENT `bao_system_content`
--
ALTER TABLE `bao_system_content`
  MODIFY `content_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `bao_template`
--
ALTER TABLE `bao_template`
  MODIFY `template_id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `bao_tongji`
--
ALTER TABLE `bao_tongji`
  MODIFY `tongji_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=294;
--
-- 使用表AUTO_INCREMENT `bao_tuan`
--
ALTER TABLE `bao_tuan`
  MODIFY `tuan_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- 使用表AUTO_INCREMENT `bao_tuan_cate`
--
ALTER TABLE `bao_tuan_cate`
  MODIFY `cate_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;
--
-- 使用表AUTO_INCREMENT `bao_tuan_code`
--
ALTER TABLE `bao_tuan_code`
  MODIFY `code_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;
--
-- 使用表AUTO_INCREMENT `bao_tuan_dianping_pics`
--
ALTER TABLE `bao_tuan_dianping_pics`
  MODIFY `pic_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;
--
-- 使用表AUTO_INCREMENT `bao_tuan_order`
--
ALTER TABLE `bao_tuan_order`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100406;
--
-- 使用表AUTO_INCREMENT `bao_tuan_view`
--
ALTER TABLE `bao_tuan_view`
  MODIFY `view_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- 使用表AUTO_INCREMENT `bao_tui`
--
ALTER TABLE `bao_tui`
  MODIFY `tui_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `bao_users`
--
ALTER TABLE `bao_users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11213;
--
-- 使用表AUTO_INCREMENT `bao_users_cash`
--
ALTER TABLE `bao_users_cash`
  MODIFY `cash_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
--
-- 使用表AUTO_INCREMENT `bao_users_goods`
--
ALTER TABLE `bao_users_goods`
  MODIFY `record_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
--
-- 使用表AUTO_INCREMENT `bao_users_look`
--
ALTER TABLE `bao_users_look`
  MODIFY `look_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=273;
--
-- 使用表AUTO_INCREMENT `bao_users_visitors`
--
ALTER TABLE `bao_users_visitors`
  MODIFY `visitors_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- 使用表AUTO_INCREMENT `bao_user_addr`
--
ALTER TABLE `bao_user_addr`
  MODIFY `addr_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- 使用表AUTO_INCREMENT `bao_user_card`
--
ALTER TABLE `bao_user_card`
  MODIFY `card_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=406;
--
-- 使用表AUTO_INCREMENT `bao_user_code`
--
ALTER TABLE `bao_user_code`
  MODIFY `code_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=396;
--
-- 使用表AUTO_INCREMENT `bao_user_gold_logs`
--
ALTER TABLE `bao_user_gold_logs`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- 使用表AUTO_INCREMENT `bao_user_integral_logs`
--
ALTER TABLE `bao_user_integral_logs`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;
--
-- 使用表AUTO_INCREMENT `bao_user_money_logs`
--
ALTER TABLE `bao_user_money_logs`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;
--
-- 使用表AUTO_INCREMENT `bao_user_rank`
--
ALTER TABLE `bao_user_rank`
  MODIFY `rank_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `bao_village`
--
ALTER TABLE `bao_village`
  MODIFY `village_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `bao_village_bbs`
--
ALTER TABLE `bao_village_bbs`
  MODIFY `post_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- 使用表AUTO_INCREMENT `bao_village_bbs_replys`
--
ALTER TABLE `bao_village_bbs_replys`
  MODIFY `reply_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `bao_village_notice`
--
ALTER TABLE `bao_village_notice`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- 使用表AUTO_INCREMENT `bao_village_suggestion`
--
ALTER TABLE `bao_village_suggestion`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `bao_village_worker`
--
ALTER TABLE `bao_village_worker`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `bao_vote`
--
ALTER TABLE `bao_vote`
  MODIFY `vote_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- 使用表AUTO_INCREMENT `bao_vote_option`
--
ALTER TABLE `bao_vote_option`
  MODIFY `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
--
-- 使用表AUTO_INCREMENT `bao_vote_result`
--
ALTER TABLE `bao_vote_result`
  MODIFY `result_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- 使用表AUTO_INCREMENT `bao_weidian_details`
--
ALTER TABLE `bao_weidian_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `bao_weixin_conn`
--
ALTER TABLE `bao_weixin_conn`
  MODIFY `conn_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `bao_weixin_keyword`
--
ALTER TABLE `bao_weixin_keyword`
  MODIFY `keyword_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `bao_weixin_msg`
--
ALTER TABLE `bao_weixin_msg`
  MODIFY `msg_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `bao_weixin_qrcode`
--
ALTER TABLE `bao_weixin_qrcode`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
--
-- 使用表AUTO_INCREMENT `bao_work`
--
ALTER TABLE `bao_work`
  MODIFY `work_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- 使用表AUTO_INCREMENT `bao_yjuan`
--
ALTER TABLE `bao_yjuan`
  MODIFY `j_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;
--
-- 使用表AUTO_INCREMENT `bao_zhuan`
--
ALTER TABLE `bao_zhuan`
  MODIFY `zhuan_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- 使用表AUTO_INCREMENT `bao_zhuan_config`
--
ALTER TABLE `bao_zhuan_config`
  MODIFY `config_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `bao_zhuan_floor`
--
ALTER TABLE `bao_zhuan_floor`
  MODIFY `floor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `bao_zhuan_map`
--
ALTER TABLE `bao_zhuan_map`
  MODIFY `map_id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '专题ID', AUTO_INCREMENT=4;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
