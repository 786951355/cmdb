/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : assetdb

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-09-06 10:31:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('1', 'admin');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO `auth_group_permissions` VALUES ('1', '1', '1');
INSERT INTO `auth_group_permissions` VALUES ('2', '1', '2');
INSERT INTO `auth_group_permissions` VALUES ('3', '1', '3');
INSERT INTO `auth_group_permissions` VALUES ('4', '1', '4');
INSERT INTO `auth_group_permissions` VALUES ('5', '1', '5');
INSERT INTO `auth_group_permissions` VALUES ('6', '1', '6');
INSERT INTO `auth_group_permissions` VALUES ('7', '1', '7');
INSERT INTO `auth_group_permissions` VALUES ('8', '1', '8');
INSERT INTO `auth_group_permissions` VALUES ('9', '1', '9');
INSERT INTO `auth_group_permissions` VALUES ('10', '1', '10');
INSERT INTO `auth_group_permissions` VALUES ('11', '1', '11');
INSERT INTO `auth_group_permissions` VALUES ('12', '1', '12');
INSERT INTO `auth_group_permissions` VALUES ('13', '1', '13');
INSERT INTO `auth_group_permissions` VALUES ('14', '1', '14');
INSERT INTO `auth_group_permissions` VALUES ('15', '1', '15');
INSERT INTO `auth_group_permissions` VALUES ('16', '1', '16');
INSERT INTO `auth_group_permissions` VALUES ('17', '1', '17');
INSERT INTO `auth_group_permissions` VALUES ('18', '1', '18');
INSERT INTO `auth_group_permissions` VALUES ('19', '1', '19');
INSERT INTO `auth_group_permissions` VALUES ('20', '1', '20');
INSERT INTO `auth_group_permissions` VALUES ('21', '1', '21');
INSERT INTO `auth_group_permissions` VALUES ('22', '1', '22');
INSERT INTO `auth_group_permissions` VALUES ('23', '1', '23');
INSERT INTO `auth_group_permissions` VALUES ('24', '1', '24');
INSERT INTO `auth_group_permissions` VALUES ('25', '1', '25');
INSERT INTO `auth_group_permissions` VALUES ('26', '1', '26');
INSERT INTO `auth_group_permissions` VALUES ('27', '1', '27');
INSERT INTO `auth_group_permissions` VALUES ('28', '1', '28');
INSERT INTO `auth_group_permissions` VALUES ('29', '1', '29');
INSERT INTO `auth_group_permissions` VALUES ('30', '1', '30');
INSERT INTO `auth_group_permissions` VALUES ('31', '1', '31');
INSERT INTO `auth_group_permissions` VALUES ('32', '1', '32');
INSERT INTO `auth_group_permissions` VALUES ('33', '1', '33');
INSERT INTO `auth_group_permissions` VALUES ('34', '1', '34');

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add my user', '6', 'add_myuser');
INSERT INTO `auth_permission` VALUES ('17', 'Can change my user', '6', 'change_myuser');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete my user', '6', 'delete_myuser');
INSERT INTO `auth_permission` VALUES ('19', 'Can view users', '6', 'can_viewuser');
INSERT INTO `auth_permission` VALUES ('20', 'Can view groups', '6', 'can_viewgroup');
INSERT INTO `auth_permission` VALUES ('21', 'Can change_password', '6', 'change_password');
INSERT INTO `auth_permission` VALUES ('22', 'Can reset_password', '6', 'reset_password');
INSERT INTO `auth_permission` VALUES ('23', 'Can add asset', '7', 'add_asset');
INSERT INTO `auth_permission` VALUES ('24', 'Can change asset', '7', 'change_asset');
INSERT INTO `auth_permission` VALUES ('25', 'Can delete asset', '7', 'delete_asset');
INSERT INTO `auth_permission` VALUES ('26', 'Can add asset group', '8', 'add_assetgroup');
INSERT INTO `auth_permission` VALUES ('27', 'Can change asset group', '8', 'change_assetgroup');
INSERT INTO `auth_permission` VALUES ('28', 'Can delete asset group', '8', 'delete_assetgroup');
INSERT INTO `auth_permission` VALUES ('29', 'Can add IDC机房', '9', 'add_idc');
INSERT INTO `auth_permission` VALUES ('30', 'Can change IDC机房', '9', 'change_idc');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete IDC机房', '9', 'delete_idc');
INSERT INTO `auth_permission` VALUES ('32', 'Can add asset record', '10', 'add_assetrecord');
INSERT INTO `auth_permission` VALUES ('33', 'Can change asset record', '10', 'change_assetrecord');
INSERT INTO `auth_permission` VALUES ('34', 'Can delete asset record', '10', 'delete_assetrecord');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_myuser_myuser_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_myuser_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `myuser_myuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'myassets', 'asset');
INSERT INTO `django_content_type` VALUES ('8', 'myassets', 'assetgroup');
INSERT INTO `django_content_type` VALUES ('10', 'myassets', 'assetrecord');
INSERT INTO `django_content_type` VALUES ('9', 'myassets', 'idc');
INSERT INTO `django_content_type` VALUES ('6', 'myuser', 'myuser');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-08-25 03:06:33.005683');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2017-08-25 03:06:34.139748');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2017-08-25 03:06:37.313930');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2017-08-25 03:06:37.887963');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2017-08-25 03:06:37.955966');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2017-08-25 03:06:37.991968');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2017-08-25 03:06:38.030971');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2017-08-25 03:06:38.073973');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2017-08-25 03:06:38.128976');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2017-08-25 03:06:38.166979');
INSERT INTO `django_migrations` VALUES ('11', 'myuser', '0001_initial', '2017-08-25 03:06:45.357390');
INSERT INTO `django_migrations` VALUES ('12', 'admin', '0001_initial', '2017-08-25 03:06:46.921479');
INSERT INTO `django_migrations` VALUES ('13', 'admin', '0002_logentry_remove_auto_add', '2017-08-25 03:06:46.954481');
INSERT INTO `django_migrations` VALUES ('14', 'myassets', '0001_initial', '2017-08-25 03:06:55.969997');
INSERT INTO `django_migrations` VALUES ('15', 'myassets', '0002_auto_20170405_1630', '2017-08-25 03:06:56.040001');
INSERT INTO `django_migrations` VALUES ('16', 'myassets', '0003_auto_20170407_1048', '2017-08-25 03:07:04.079461');
INSERT INTO `django_migrations` VALUES ('17', 'myassets', '0004_auto_20170407_1054', '2017-08-25 03:07:05.008514');
INSERT INTO `django_migrations` VALUES ('18', 'myuser', '0002_auto_20170329_1140', '2017-08-25 03:07:05.037515');
INSERT INTO `django_migrations` VALUES ('19', 'myuser', '0003_auto_20170329_1144', '2017-08-25 03:07:05.064517');
INSERT INTO `django_migrations` VALUES ('20', 'myuser', '0004_auto_20170329_1532', '2017-08-25 03:07:05.092519');
INSERT INTO `django_migrations` VALUES ('21', 'myuser', '0005_auto_20170405_1630', '2017-08-25 03:07:05.123520');
INSERT INTO `django_migrations` VALUES ('22', 'myuser', '0006_auto_20170407_1054', '2017-08-25 03:07:09.643779');
INSERT INTO `django_migrations` VALUES ('23', 'myuser', '0007_remove_myuser_group', '2017-08-25 03:07:09.845790');
INSERT INTO `django_migrations` VALUES ('24', 'myuser', '0008_auto_20170825_1106', '2017-08-25 03:07:09.900794');
INSERT INTO `django_migrations` VALUES ('25', 'sessions', '0001_initial', '2017-08-25 03:07:10.404822');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('871oy1pab3y7fml6rij3ob8yr43sk3z7', 'MjQ2ZTc0ODVkODY5MjllZDk2MGUwZTI0NGIzOGRlMGZjN2FkYzY1NTp7InZpc2l0IjozLCJfc2Vzc2lvbl9leHBpcnkiOjcyMDAsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NmIxYmFmNjg1ZDkzZWRkOWNhZjgzN2IwN2ViNTEyMzVmMjAzMWZjIiwicm9sZV9pZCI6M30=', '2017-08-25 07:14:03.737280');
INSERT INTO `django_session` VALUES ('og4hyxdvxknv1tkrbwtbx7m2dj3oiqk5', 'MjQ2ZTc0ODVkODY5MjllZDk2MGUwZTI0NGIzOGRlMGZjN2FkYzY1NTp7InZpc2l0IjozLCJfc2Vzc2lvbl9leHBpcnkiOjcyMDAsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NmIxYmFmNjg1ZDkzZWRkOWNhZjgzN2IwN2ViNTEyMzVmMjAzMWZjIiwicm9sZV9pZCI6M30=', '2017-08-28 12:19:21.168906');

-- ----------------------------
-- Table structure for myassets_asset
-- ----------------------------
DROP TABLE IF EXISTS `myassets_asset`;
CREATE TABLE `myassets_asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(32) DEFAULT NULL,
  `other_ip` varchar(255) DEFAULT NULL,
  `hostname` varchar(128) NOT NULL,
  `port` int(11) DEFAULT NULL,
  `username` varchar(16) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `use_default_auth` tinyint(1) NOT NULL,
  `mac` varchar(20) DEFAULT NULL,
  `remote_ip` varchar(16) DEFAULT NULL,
  `brand` varchar(64) DEFAULT NULL,
  `cpu` varchar(64) DEFAULT NULL,
  `memory` varchar(128) DEFAULT NULL,
  `disk` varchar(1024) DEFAULT NULL,
  `system_type` varchar(32) DEFAULT NULL,
  `system_version` varchar(8) DEFAULT NULL,
  `system_arch` varchar(16) DEFAULT NULL,
  `cabinet` varchar(32) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `number` varchar(32) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `asset_type` int(11) DEFAULT NULL,
  `env` int(11) DEFAULT NULL,
  `sn` varchar(128) DEFAULT NULL,
  `date_added` datetime(6) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `comment` varchar(128) DEFAULT NULL,
  `idc_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  KEY `myassets_asset_idc_id_ea4c5201_fk_myassets_idc_id` (`idc_id`),
  CONSTRAINT `myassets_asset_idc_id_ea4c5201_fk_myassets_idc_id` FOREIGN KEY (`idc_id`) REFERENCES `myassets_idc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of myassets_asset
-- ----------------------------
INSERT INTO `myassets_asset` VALUES ('1', '10.10.10.10', '', 'test', '22', '', '', '1', '', '', '', '', '', '', '', '', '', '', null, '', '1', '1', null, '', '2017-08-28 07:33:57.325294', '1', '', null);

-- ----------------------------
-- Table structure for myassets_assetgroup
-- ----------------------------
DROP TABLE IF EXISTS `myassets_assetgroup`;
CREATE TABLE `myassets_assetgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `comment` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of myassets_assetgroup
-- ----------------------------
INSERT INTO `myassets_assetgroup` VALUES ('1', 'test', 'test');

-- ----------------------------
-- Table structure for myassets_assetrecord
-- ----------------------------
DROP TABLE IF EXISTS `myassets_assetrecord`;
CREATE TABLE `myassets_assetrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `alert_time` datetime(6) NOT NULL,
  `content` longtext,
  `comment` longtext,
  `asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myassets_assetrecord_asset_id_d27be398_fk_myassets_asset_id` (`asset_id`),
  CONSTRAINT `myassets_assetrecord_asset_id_d27be398_fk_myassets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `myassets_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of myassets_assetrecord
-- ----------------------------

-- ----------------------------
-- Table structure for myassets_asset_group
-- ----------------------------
DROP TABLE IF EXISTS `myassets_asset_group`;
CREATE TABLE `myassets_asset_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `assetgroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myassets_asset_group_asset_id_fdd1a821_uniq` (`asset_id`,`assetgroup_id`),
  KEY `myassets_asset__assetgroup_id_6b260b81_fk_myassets_assetgroup_id` (`assetgroup_id`),
  CONSTRAINT `myassets_asset__assetgroup_id_6b260b81_fk_myassets_assetgroup_id` FOREIGN KEY (`assetgroup_id`) REFERENCES `myassets_assetgroup` (`id`),
  CONSTRAINT `myassets_asset_group_asset_id_c5d7d743_fk_myassets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `myassets_asset` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of myassets_asset_group
-- ----------------------------
INSERT INTO `myassets_asset_group` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for myassets_idc
-- ----------------------------
DROP TABLE IF EXISTS `myassets_idc`;
CREATE TABLE `myassets_idc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `bandwidth` varchar(32) DEFAULT NULL,
  `linkman` varchar(16) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `network` longtext,
  `date_added` date DEFAULT NULL,
  `operator` varchar(32) DEFAULT NULL,
  `comment` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of myassets_idc
-- ----------------------------

-- ----------------------------
-- Table structure for myuser_myuser
-- ----------------------------
DROP TABLE IF EXISTS `myuser_myuser`;
CREATE TABLE `myuser_myuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `role` varchar(2) NOT NULL,
  `date_of_birth` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of myuser_myuser
-- ----------------------------
INSERT INTO `myuser_myuser` VALUES ('1', 'pbkdf2_sha256$30000$j292BDA0o5ck$tlxIzJuaDBInzp+gOdOGEOBWksHP7eEJvT3wnYSfDAg=', '2017-08-28 07:08:52.974250', '1', '', '', '2017-08-25 03:11:53.902038', 'admin', 'admin@qq.com', '1', '1', 'AU', '1990-10-10');
INSERT INTO `myuser_myuser` VALUES ('2', 'pbkdf2_sha256$30000$0g1azD9WmQNh$pT7/oJ+Y4Tp1vN73UVqegje6H/0/i0eVHr7WvqRScbQ=', null, '0', '', '', '2017-08-28 07:43:29.427016', '测试', 'test@qq.com', '1', '0', 'CU', '1970-10-20');

-- ----------------------------
-- Table structure for myuser_myuser_asset
-- ----------------------------
DROP TABLE IF EXISTS `myuser_myuser_asset`;
CREATE TABLE `myuser_myuser_asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `myuser_id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myuser_myuser_asset_myuser_id_227c6b13_uniq` (`myuser_id`,`asset_id`),
  KEY `myuser_myuser_asset_asset_id_10118b09_fk_myassets_asset_id` (`asset_id`),
  CONSTRAINT `myuser_myuser_asset_asset_id_10118b09_fk_myassets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `myassets_asset` (`id`),
  CONSTRAINT `myuser_myuser_asset_myuser_id_4feda7fd_fk_myuser_myuser_id` FOREIGN KEY (`myuser_id`) REFERENCES `myuser_myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of myuser_myuser_asset
-- ----------------------------
INSERT INTO `myuser_myuser_asset` VALUES ('1', '1', '1');
INSERT INTO `myuser_myuser_asset` VALUES ('2', '2', '1');

-- ----------------------------
-- Table structure for myuser_myuser_assetgroup
-- ----------------------------
DROP TABLE IF EXISTS `myuser_myuser_assetgroup`;
CREATE TABLE `myuser_myuser_assetgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `myuser_id` int(11) NOT NULL,
  `assetgroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myuser_myuser_assetgroup_myuser_id_a5191297_uniq` (`myuser_id`,`assetgroup_id`),
  KEY `myuser_myuser_a_assetgroup_id_5907f23a_fk_myassets_assetgroup_id` (`assetgroup_id`),
  CONSTRAINT `myuser_myuser_a_assetgroup_id_5907f23a_fk_myassets_assetgroup_id` FOREIGN KEY (`assetgroup_id`) REFERENCES `myassets_assetgroup` (`id`),
  CONSTRAINT `myuser_myuser_assetgroup_myuser_id_6ff16564_fk_myuser_myuser_id` FOREIGN KEY (`myuser_id`) REFERENCES `myuser_myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of myuser_myuser_assetgroup
-- ----------------------------
INSERT INTO `myuser_myuser_assetgroup` VALUES ('1', '1', '1');
INSERT INTO `myuser_myuser_assetgroup` VALUES ('2', '2', '1');

-- ----------------------------
-- Table structure for myuser_myuser_groups
-- ----------------------------
DROP TABLE IF EXISTS `myuser_myuser_groups`;
CREATE TABLE `myuser_myuser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `myuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myuser_myuser_groups_myuser_id_a8292f11_uniq` (`myuser_id`,`group_id`),
  KEY `myuser_myuser_groups_group_id_39a2ce78_fk_auth_group_id` (`group_id`),
  CONSTRAINT `myuser_myuser_groups_group_id_39a2ce78_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `myuser_myuser_groups_myuser_id_f678c889_fk_myuser_myuser_id` FOREIGN KEY (`myuser_id`) REFERENCES `myuser_myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of myuser_myuser_groups
-- ----------------------------
INSERT INTO `myuser_myuser_groups` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for myuser_myuser_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `myuser_myuser_user_permissions`;
CREATE TABLE `myuser_myuser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `myuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myuser_myuser_user_permissions_myuser_id_c5bca93b_uniq` (`myuser_id`,`permission_id`),
  KEY `myuser_myuser_user__permission_id_d9f710f2_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `myuser_myuser_user__permission_id_d9f710f2_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `myuser_myuser_user_permis_myuser_id_a12b8631_fk_myuser_myuser_id` FOREIGN KEY (`myuser_id`) REFERENCES `myuser_myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of myuser_myuser_user_permissions
-- ----------------------------
INSERT INTO `myuser_myuser_user_permissions` VALUES ('1', '1', '1');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('2', '1', '2');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('3', '1', '3');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('7', '1', '4');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('8', '1', '5');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('9', '1', '6');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('4', '1', '7');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('5', '1', '8');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('6', '1', '9');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('10', '1', '10');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('11', '1', '11');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('12', '1', '12');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('32', '1', '13');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('33', '1', '14');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('34', '1', '15');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('25', '1', '16');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('28', '1', '17');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('30', '1', '18');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('27', '1', '19');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('26', '1', '20');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('29', '1', '21');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('31', '1', '22');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('13', '1', '23');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('14', '1', '24');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('15', '1', '25');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('16', '1', '26');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('17', '1', '27');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('18', '1', '28');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('22', '1', '29');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('23', '1', '30');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('24', '1', '31');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('19', '1', '32');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('20', '1', '33');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('21', '1', '34');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('36', '2', '23');
INSERT INTO `myuser_myuser_user_permissions` VALUES ('35', '2', '24');
