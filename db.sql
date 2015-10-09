# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.19-1~exp1ubuntu2)
# Database: api
# Generation Time: 2015-07-31 03:51:41 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table api
# ------------------------------------------------------------

-- DROP TABLE IF EXISTS `api`;

-- CREATE TABLE `api` (
--   `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '接口编号',
--   `aid` int(11) DEFAULT '0' COMMENT '接口分类id',
--   `num` varchar(100) DEFAULT NULL COMMENT '接口编号',
--   `url` varchar(240) DEFAULT NULL COMMENT '请求地址',
--   `name` varchar(100) DEFAULT NULL COMMENT '接口名',
--   `des` varchar(300) DEFAULT NULL COMMENT '接口描述',
--   `parameter` text COMMENT '请求参数{所有的主求参数,以json格式在此存放}',
--   `memo` text COMMENT '备注',
--   `re` text COMMENT '返回值',
--   `lasttime` int(11) unsigned DEFAULT NULL COMMENT '提后操作时间',
--   `lastuid` int(11) unsigned DEFAULT NULL COMMENT '最后修改uid',
--   `isdel` tinyint(4) unsigned DEFAULT '0' COMMENT '{0:正常,1:删除}',
--   `type` char(11) DEFAULT NULL COMMENT '请求方式',
--   `ord` int(11) DEFAULT '0' COMMENT '排序(值越大,越靠前)',
--   PRIMARY KEY (`id`)
-- ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='接口明细表';




# Dump of table auth
# ------------------------------------------------------------

-- DROP TABLE IF EXISTS `auth`;

-- CREATE TABLE `auth` (
--   `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
--   `uid` int(11) DEFAULT NULL COMMENT '用户',
--   `aid` int(11) DEFAULT NULL COMMENT '接口分类权限',
--   PRIMARY KEY (`id`)
-- ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限表 - 若用户为普通管理员时，读此表获取权限';



# Dump of table cate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cate`;

CREATE TABLE `cate` (
  `aid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `cid` int(11) unsigned NOT NULL COMMENT '联系用户id',
  `cname` varchar(200) NOT NULL DEFAULT '' COMMENT '分类名称',
  `cdesc` varchar(200) NOT NULL DEFAULT '' COMMENT '分类描述',
  `isdel` int(11) DEFAULT '0' COMMENT '是否删除{0:正常,1删除}',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='接口分类表';




# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nice_name` char(20) DEFAULT NULL COMMENT '昵称',
  `login_name` char(20) DEFAULT NULL COMMENT '登录名',
  `last_time` int(11) DEFAULT '0' COMMENT '最近登录时间',
  `login_pwd` varchar(32) DEFAULT NULL COMMENT '登录密码',
  `isdel` int(11) DEFAULT '0' COMMENT '{0正常,1:删除}',
  `issuper` int(11) DEFAULT '0' COMMENT '{0:普通管理员,1超级管理员}',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
