/*
Navicat SQLite Data Transfer

Source Server         : priacte
Source Server Version : 30714
Source Host           : :0

Target Server Type    : SQLite
Target Server Version : 30714
File Encoding         : 65001

Date: 2017-04-10 16:03:33
*/

PRAGMA foreign_keys = OFF;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS "main"."auth_group";
CREATE TABLE "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(80) NOT NULL UNIQUE);

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO "main"."auth_group" VALUES (1, 'ops');
INSERT INTO "main"."auth_group" VALUES (2, 'dev');
INSERT INTO "main"."auth_group" VALUES (3, 'test');
INSERT INTO "main"."auth_group" VALUES (4, 'g1');
INSERT INTO "main"."auth_group" VALUES (5, 'G2');
INSERT INTO "main"."auth_group" VALUES (6, 'g2');
INSERT INTO "main"."auth_group" VALUES (7, 't1');
INSERT INTO "main"."auth_group" VALUES (8, 't2');
INSERT INTO "main"."auth_group" VALUES (10, 'infinity');
INSERT INTO "main"."auth_group" VALUES (12, 'Old1');
INSERT INTO "main"."auth_group" VALUES (13, 'afdfa');
INSERT INTO "main"."auth_group" VALUES (14, 'afdafda');
INSERT INTO "main"."auth_group" VALUES (15, 'afdaf');
INSERT INTO "main"."auth_group" VALUES (16, 'afdafdaf');
INSERT INTO "main"."auth_group" VALUES (17, '1fffaaa');
INSERT INTO "main"."auth_group" VALUES (18, 'dddddaa');
INSERT INTO "main"."auth_group" VALUES (19, 'NewGroup001');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS "main"."auth_group_permissions";
CREATE TABLE "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"));

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO "main"."auth_group_permissions" VALUES (1, 1, 75);
INSERT INTO "main"."auth_group_permissions" VALUES (2, 1, 76);
INSERT INTO "main"."auth_group_permissions" VALUES (3, 1, 49);
INSERT INTO "main"."auth_group_permissions" VALUES (4, 1, 50);
INSERT INTO "main"."auth_group_permissions" VALUES (5, 1, 58);
INSERT INTO "main"."auth_group_permissions" VALUES (6, 1, 59);
INSERT INTO "main"."auth_group_permissions" VALUES (7, 1, 61);
INSERT INTO "main"."auth_group_permissions" VALUES (8, 1, 62);
INSERT INTO "main"."auth_group_permissions" VALUES (9, 2, 61);
INSERT INTO "main"."auth_group_permissions" VALUES (10, 2, 62);
INSERT INTO "main"."auth_group_permissions" VALUES (11, 3, 49);
INSERT INTO "main"."auth_group_permissions" VALUES (12, 3, 50);
INSERT INTO "main"."auth_group_permissions" VALUES (13, 4, 49);
INSERT INTO "main"."auth_group_permissions" VALUES (14, 4, 50);
INSERT INTO "main"."auth_group_permissions" VALUES (15, 5, 59);
INSERT INTO "main"."auth_group_permissions" VALUES (16, 6, 43);
INSERT INTO "main"."auth_group_permissions" VALUES (17, 6, 44);
INSERT INTO "main"."auth_group_permissions" VALUES (18, 7, 43);
INSERT INTO "main"."auth_group_permissions" VALUES (19, 7, 44);
INSERT INTO "main"."auth_group_permissions" VALUES (22, 2, 49);
INSERT INTO "main"."auth_group_permissions" VALUES (23, 2, 50);
INSERT INTO "main"."auth_group_permissions" VALUES (24, 2, 59);
INSERT INTO "main"."auth_group_permissions" VALUES (25, 2, 58);
INSERT INTO "main"."auth_group_permissions" VALUES (26, 10, 45);
INSERT INTO "main"."auth_group_permissions" VALUES (28, 12, 47);
INSERT INTO "main"."auth_group_permissions" VALUES (29, 13, 51);
INSERT INTO "main"."auth_group_permissions" VALUES (30, 14, 43);
INSERT INTO "main"."auth_group_permissions" VALUES (31, 15, 51);
INSERT INTO "main"."auth_group_permissions" VALUES (32, 17, 49);
INSERT INTO "main"."auth_group_permissions" VALUES (33, 3, 56);
INSERT INTO "main"."auth_group_permissions" VALUES (34, 3, 55);
INSERT INTO "main"."auth_group_permissions" VALUES (35, 19, 58);
INSERT INTO "main"."auth_group_permissions" VALUES (36, 19, 61);
INSERT INTO "main"."auth_group_permissions" VALUES (37, 19, 62);
INSERT INTO "main"."auth_group_permissions" VALUES (38, 12, 49);
INSERT INTO "main"."auth_group_permissions" VALUES (39, 12, 50);
INSERT INTO "main"."auth_group_permissions" VALUES (40, 19, 79);
INSERT INTO "main"."auth_group_permissions" VALUES (41, 19, 55);
INSERT INTO "main"."auth_group_permissions" VALUES (42, 10, 49);

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS "main"."auth_permission";
CREATE TABLE "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id"), "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO "main"."auth_permission" VALUES (43, 1, 'add_logentry', 'Can add log entry');
INSERT INTO "main"."auth_permission" VALUES (44, 1, 'change_logentry', 'Can change log entry');
INSERT INTO "main"."auth_permission" VALUES (45, 1, 'delete_logentry', 'Can delete log entry');
INSERT INTO "main"."auth_permission" VALUES (46, 2, 'add_permission', 'Can add permission');
INSERT INTO "main"."auth_permission" VALUES (47, 2, 'change_permission', 'Can change permission');
INSERT INTO "main"."auth_permission" VALUES (48, 2, 'delete_permission', 'Can delete permission');
INSERT INTO "main"."auth_permission" VALUES (49, 3, 'add_group', 'Can add group');
INSERT INTO "main"."auth_permission" VALUES (50, 3, 'change_group', 'Can change group');
INSERT INTO "main"."auth_permission" VALUES (51, 3, 'delete_group', 'Can delete group');
INSERT INTO "main"."auth_permission" VALUES (52, 4, 'add_contenttype', 'Can add content type');
INSERT INTO "main"."auth_permission" VALUES (53, 4, 'change_contenttype', 'Can change content type');
INSERT INTO "main"."auth_permission" VALUES (54, 4, 'delete_contenttype', 'Can delete content type');
INSERT INTO "main"."auth_permission" VALUES (55, 5, 'add_session', 'Can add session');
INSERT INTO "main"."auth_permission" VALUES (56, 5, 'change_session', 'Can change session');
INSERT INTO "main"."auth_permission" VALUES (57, 5, 'delete_session', 'Can delete session');
INSERT INTO "main"."auth_permission" VALUES (58, 6, 'add_myuser', 'Can add my user');
INSERT INTO "main"."auth_permission" VALUES (59, 6, 'change_myuser', 'Can change my user');
INSERT INTO "main"."auth_permission" VALUES (60, 6, 'delete_myuser', 'Can delete my user');
INSERT INTO "main"."auth_permission" VALUES (61, 6, 'can_viewuser', 'Can view users');
INSERT INTO "main"."auth_permission" VALUES (62, 6, 'can_viewgroup', 'Can view groups');
INSERT INTO "main"."auth_permission" VALUES (63, 9, 'add_idc', 'Can add IDC机房');
INSERT INTO "main"."auth_permission" VALUES (64, 9, 'change_idc', 'Can change IDC机房');
INSERT INTO "main"."auth_permission" VALUES (65, 9, 'delete_idc', 'Can delete IDC机房');
INSERT INTO "main"."auth_permission" VALUES (66, 7, 'add_assetrecord', 'Can add asset record');
INSERT INTO "main"."auth_permission" VALUES (67, 7, 'change_assetrecord', 'Can change asset record');
INSERT INTO "main"."auth_permission" VALUES (68, 7, 'delete_assetrecord', 'Can delete asset record');
INSERT INTO "main"."auth_permission" VALUES (69, 8, 'add_assetgroup', 'Can add asset group');
INSERT INTO "main"."auth_permission" VALUES (70, 8, 'change_assetgroup', 'Can change asset group');
INSERT INTO "main"."auth_permission" VALUES (71, 8, 'delete_assetgroup', 'Can delete asset group');
INSERT INTO "main"."auth_permission" VALUES (75, 11, 'add_asset', 'Can add asset');
INSERT INTO "main"."auth_permission" VALUES (76, 11, 'change_asset', 'Can change asset');
INSERT INTO "main"."auth_permission" VALUES (77, 11, 'delete_asset', 'Can delete asset');
INSERT INTO "main"."auth_permission" VALUES (78, 6, 'change_password', 'Can change_password');
INSERT INTO "main"."auth_permission" VALUES (79, 6, 'reset_password', 'Can reset_password');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS "main"."django_admin_log";
CREATE TABLE "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id"), "user_id" integer NOT NULL REFERENCES "myuser_myuser" ("id"), "action_time" datetime NOT NULL);

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS "main"."django_content_type";
CREATE TABLE "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO "main"."django_content_type" VALUES (1, 'admin', 'logentry');
INSERT INTO "main"."django_content_type" VALUES (2, 'auth', 'permission');
INSERT INTO "main"."django_content_type" VALUES (3, 'auth', 'group');
INSERT INTO "main"."django_content_type" VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO "main"."django_content_type" VALUES (5, 'sessions', 'session');
INSERT INTO "main"."django_content_type" VALUES (6, 'myuser', 'myuser');
INSERT INTO "main"."django_content_type" VALUES (7, 'myassets', 'assetrecord');
INSERT INTO "main"."django_content_type" VALUES (8, 'myassets', 'assetgroup');
INSERT INTO "main"."django_content_type" VALUES (9, 'myassets', 'idc');
INSERT INTO "main"."django_content_type" VALUES (11, 'myassets', 'asset');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS "main"."django_migrations";
CREATE TABLE "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO "main"."django_migrations" VALUES (1, 'contenttypes', '0001_initial', '2017-03-29 03:32:15.273682');
INSERT INTO "main"."django_migrations" VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2017-03-29 03:32:15.300702');
INSERT INTO "main"."django_migrations" VALUES (3, 'auth', '0001_initial', '2017-03-29 03:32:15.337728');
INSERT INTO "main"."django_migrations" VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2017-03-29 03:32:15.367749');
INSERT INTO "main"."django_migrations" VALUES (5, 'auth', '0003_alter_user_email_max_length', '2017-03-29 03:32:15.382762');
INSERT INTO "main"."django_migrations" VALUES (6, 'auth', '0004_alter_user_username_opts', '2017-03-29 03:32:15.397771');
INSERT INTO "main"."django_migrations" VALUES (7, 'auth', '0005_alter_user_last_login_null', '2017-03-29 03:32:15.412783');
INSERT INTO "main"."django_migrations" VALUES (8, 'auth', '0006_require_contenttypes_0002', '2017-03-29 03:32:15.422788');
INSERT INTO "main"."django_migrations" VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2017-03-29 03:32:15.440802');
INSERT INTO "main"."django_migrations" VALUES (10, 'auth', '0008_alter_user_username_max_length', '2017-03-29 03:32:15.455813');
INSERT INTO "main"."django_migrations" VALUES (11, 'myuser', '0001_initial', '2017-03-29 03:32:15.486834');
INSERT INTO "main"."django_migrations" VALUES (12, 'admin', '0001_initial', '2017-03-29 03:32:15.517857');
INSERT INTO "main"."django_migrations" VALUES (13, 'admin', '0002_logentry_remove_auto_add', '2017-03-29 03:32:15.562911');
INSERT INTO "main"."django_migrations" VALUES (14, 'myassets', '0001_initial', '2017-03-29 03:32:15.632939');
INSERT INTO "main"."django_migrations" VALUES (15, 'sessions', '0001_initial', '2017-03-29 03:32:15.654954');
INSERT INTO "main"."django_migrations" VALUES (16, 'myuser', '0002_auto_20170329_1140', '2017-03-29 03:40:30.839030');
INSERT INTO "main"."django_migrations" VALUES (17, 'myuser', '0003_auto_20170329_1144', '2017-03-29 03:44:06.585720');
INSERT INTO "main"."django_migrations" VALUES (18, 'myuser', '0004_auto_20170329_1532', '2017-03-29 07:32:24.129924');
INSERT INTO "main"."django_migrations" VALUES (19, 'myassets', '0002_auto_20170405_1630', '2017-04-05 08:30:24.793739');
INSERT INTO "main"."django_migrations" VALUES (20, 'myuser', '0005_auto_20170405_1630', '2017-04-05 08:30:24.831768');
INSERT INTO "main"."django_migrations" VALUES (21, 'myassets', '0003_auto_20170407_1048', '2017-04-07 02:48:38.507665');
INSERT INTO "main"."django_migrations" VALUES (22, 'myassets', '0004_auto_20170407_1054', '2017-04-07 02:55:01.550838');
INSERT INTO "main"."django_migrations" VALUES (23, 'myuser', '0006_auto_20170407_1054', '2017-04-07 02:55:01.600873');
INSERT INTO "main"."django_migrations" VALUES (24, 'myuser', '0007_remove_myuser_group', '2017-04-10 01:21:52.284566');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS "main"."django_session";
CREATE TABLE "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO "main"."django_session" VALUES ('qy8a5kel4xoqqrg87ncnrvmdv2fn40hw', 'NTEzNzJkMTM1ZDI2NTNjYWZmY2E1MDYwMDU4YTI4NDUyMmJmYzBiNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgxM2M2MTc2N2FiYzU3M2U4Y2ExMDA1NWUwYzEyZmM5YzdjMmE4MjMiLCJ2aXNpdCI6MywiX3Nlc3Npb25fZXhwaXJ5Ijo3MjAwLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsInJvbGVfaWQiOjMsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-03-29 05:33:28.642259');
INSERT INTO "main"."django_session" VALUES ('5elbamlvouhlamppxb6zt1b0pl6nkhub', 'OTRjYmFkOWFhMTg2ZGNkMTc3MzQ0ZmE5MjM2OTJkMWJjMjBhY2JhODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwidmlzaXQiOjMsInJvbGVfaWQiOjMsIl9zZXNzaW9uX2V4cGlyeSI6NzIwMCwiX2F1dGhfdXNlcl9oYXNoIjoiODEzYzYxNzY3YWJjNTczZThjYTEwMDU1ZTBjMTJmYzljN2MyYTgyMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2017-03-29 05:48:57.906082');
INSERT INTO "main"."django_session" VALUES ('e9iyxlcx8uieav2vhzggp933azeb8w9d', 'NGU1NWE1MzJkOWM1OTRhN2QwOWEzNmY2NmU0OTc5YjQ4NTk5Njg3Mzp7InJvbGVfaWQiOjMsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiODEzYzYxNzY3YWJjNTczZThjYTEwMDU1ZTBjMTJmYzljN2MyYTgyMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX3Nlc3Npb25fZXhwaXJ5Ijo3MjAwLCJ2aXNpdCI6M30=', '2017-03-29 12:19:57.126008');
INSERT INTO "main"."django_session" VALUES ('mz0se43oodwr49g73sbqvw36hz7fgqik', 'YzQ2OGRlM2I0NzNlZGZkY2M4ZTllYzcyODE3ZmUzMmQ4YTZlNTUzNDp7InJvbGVfaWQiOjIsIl9zZXNzaW9uX2V4cGlyeSI6NzIwMCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiIsInZpc2l0IjoxMSwiX2F1dGhfdXNlcl9oYXNoIjoiYzllYTA4YjkyYzhiZGIyYmQzNWRiM2U2NjM3ZDhkY2Y4MTA1MjRlNyJ9', '2017-03-29 10:15:09.039402');
INSERT INTO "main"."django_session" VALUES ('oelj666y51wldfwdyhtkv91qc1pyfd6f', 'ZTAxNjEyNWRkNzc3MGQ0MDM1NGMzZDllOGQ5MDFmY2FjZWJhZDNhOTp7InJvbGVfaWQiOjMsInZpc2l0IjozLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9zZXNzaW9uX2V4cGlyeSI6NzIwMCwiX2F1dGhfdXNlcl9oYXNoIjoiODEzYzYxNzY3YWJjNTczZThjYTEwMDU1ZTBjMTJmYzljN2MyYTgyMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2017-03-29 13:42:04.338308');
INSERT INTO "main"."django_session" VALUES ('u2frw96q8owzc2o9ug12pum83awcz0bs', 'ZGIwNDcwMzgyNTc5MTRkYWEwMjBmY2E1MTkwMWM4NDhjMzZhMmYyOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwicm9sZV9pZCI6MywiX3Nlc3Npb25fZXhwaXJ5Ijo3MjAwLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjgxM2M2MTc2N2FiYzU3M2U4Y2ExMDA1NWUwYzEyZmM5YzdjMmE4MjMiLCJ2aXNpdCI6M30=', '2017-03-30 05:28:32.144734');
INSERT INTO "main"."django_session" VALUES ('kwwfngn4fqzealut75eh3wqss95n1vf2', 'OTA2NjVlNDcxZTZiZWJhMTNhYWZiNjQ5OWRhNjEyNTljNTFhNGY5NTp7InJvbGVfaWQiOjMsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiODEzYzYxNzY3YWJjNTczZThjYTEwMDU1ZTBjMTJmYzljN2MyYTgyMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidmlzaXQiOjQsIl9zZXNzaW9uX2V4cGlyeSI6NzIwMH0=', '2017-03-30 07:15:57.640875');
INSERT INTO "main"."django_session" VALUES ('ekqoo9k0ixmuun36aco7noiic0utfjoo', 'ZDVmNzY2ZjM5NTdmZWUyZWY1YzQ3NTVmN2QwNzhiY2ZhMjY2YTRiMjp7InJvbGVfaWQiOjMsIl9zZXNzaW9uX2V4cGlyeSI6NzIwMCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfaGFzaCI6IjgxM2M2MTc2N2FiYzU3M2U4Y2ExMDA1NWUwYzEyZmM5YzdjMmE4MjMiLCJ2aXNpdCI6M30=', '2017-03-30 07:41:00.816898');
INSERT INTO "main"."django_session" VALUES ('1p6mjfoaa09yeky3htfqwglw8nda4asu', 'Y2ZjY2E0MTFhODMxNTdhMTQyOWIxZWQ2YzhjMTU5MTZjNDRlOGI2NDp7fQ==', '2017-04-13 05:42:25.717322');
INSERT INTO "main"."django_session" VALUES ('pl2awaeu7drvwvmh7x592dxqlkadrlni', 'Y2ZjY2E0MTFhODMxNTdhMTQyOWIxZWQ2YzhjMTU5MTZjNDRlOGI2NDp7fQ==', '2017-04-13 05:55:20.840028');
INSERT INTO "main"."django_session" VALUES ('kepr830om10kdb79ucmjwhk69bfffp7t', 'NzRjMTQwOTMxNTg1OWZkMjFhNzRkNDIzZDg1MTFiN2I5MDdlYjY1OTp7InJvbGVfaWQiOjMsIl9zZXNzaW9uX2V4cGlyeSI6NzIwMCwidmlzaXQiOjMsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiODEzYzYxNzY3YWJjNTczZThjYTEwMDU1ZTBjMTJmYzljN2MyYTgyMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2017-03-30 08:00:35.516346');
INSERT INTO "main"."django_session" VALUES ('jl4q71qc49tmprwqsintyaarh9i600pc', 'NzRjMTQwOTMxNTg1OWZkMjFhNzRkNDIzZDg1MTFiN2I5MDdlYjY1OTp7InJvbGVfaWQiOjMsIl9zZXNzaW9uX2V4cGlyeSI6NzIwMCwidmlzaXQiOjMsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiODEzYzYxNzY3YWJjNTczZThjYTEwMDU1ZTBjMTJmYzljN2MyYTgyMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2017-03-30 12:03:14.766150');
INSERT INTO "main"."django_session" VALUES ('lbaza6faw71k5zcyh81lapom01ypdpfg', 'NzkyYTMzYzQ0MzBkZWJhMWI0MDRhZTVkOWRmZjQ0Mzk1YjIwNmI2OTp7InJvbGVfaWQiOjMsIl9zZXNzaW9uX2V4cGlyeSI6NzIwMCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfaGFzaCI6IjgxM2M2MTc2N2FiYzU3M2U4Y2ExMDA1NWUwYzEyZmM5YzdjMmE4MjMiLCJ2aXNpdCI6NH0=', '2017-03-30 11:57:02.135761');
INSERT INTO "main"."django_session" VALUES ('ubzmnn65uuimk9q49r9cmrcbbryzhw21', 'MDkwMjY1N2FlOWEzNzg0OGQ4OTBiYzViZGNiMGVhNjM1ZTllYmZkYTp7Il9zZXNzaW9uX2V4cGlyeSI6NzIwMCwicm9sZV9pZCI6MywiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI4MTNjNjE3NjdhYmM1NzNlOGNhMTAwNTVlMGMxMmZjOWM3YzJhODIzIiwidmlzaXQiOjMsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2017-03-31 05:51:29.914531');
INSERT INTO "main"."django_session" VALUES ('kkk598jicvo3ruu523fkd8wlfpq4y8h6', 'NTEwOTZmYTE4YmU3ZTQxNjA3NTA0MTlmYTE4NjJiYTMxN2Q2MGVmODp7InJvbGVfaWQiOjMsIl9hdXRoX3VzZXJfaGFzaCI6IjgxM2M2MTc2N2FiYzU3M2U4Y2ExMDA1NWUwYzEyZmM5YzdjMmE4MjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9zZXNzaW9uX2V4cGlyeSI6NzIwMCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJ2aXNpdCI6M30=', '2017-03-31 12:36:19.552936');
INSERT INTO "main"."django_session" VALUES ('s7kikihlcmzzk3yw6enlbzr8z48a92je', 'NGY0NzJiMGM3MWFjODA3MmRkNTI4MTNjNzA0ZjRjNjVlMmE3YmI2Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwicm9sZV9pZCI6MywiX2F1dGhfdXNlcl9oYXNoIjoiODEzYzYxNzY3YWJjNTczZThjYTEwMDU1ZTBjMTJmYzljN2MyYTgyMyIsIl9zZXNzaW9uX2V4cGlyeSI6NzIwMCwidmlzaXQiOjMsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-04-01 10:40:20.119295');
INSERT INTO "main"."django_session" VALUES ('441u0ik72p9eh7qhqmoai8czlirhhfl9', 'NzYxYmYyZTAwN2YxNmRmMDIzYzU0NjhmN2E2ZWYwNDVlOGZhMjE0Njp7InJvbGVfaWQiOjMsIl9zZXNzaW9uX2V4cGlyeSI6NzIwMCwiX2F1dGhfdXNlcl9oYXNoIjoiODEzYzYxNzY3YWJjNTczZThjYTEwMDU1ZTBjMTJmYzljN2MyYTgyMyIsInZpc2l0IjozLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-04-05 05:24:28.640645');
INSERT INTO "main"."django_session" VALUES ('n6mpul1apocbjxri6mms5pluqvfukx2o', 'ZDM4NzJjNTE3ZmQ5ZmExMjIyNzA1ZGM1NDI4MGQ2YTJkZjlhNWYyMjp7InZpc2l0IjozLCJfc2Vzc2lvbl9leHBpcnkiOjcyMDAsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiODEzYzYxNzY3YWJjNTczZThjYTEwMDU1ZTBjMTJmYzljN2MyYTgyMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwicm9sZV9pZCI6M30=', '2017-04-05 11:55:05.091703');
INSERT INTO "main"."django_session" VALUES ('f8vypuq6l3wuw2z7z0m75bj92rbd8mce', 'YWZiODdjYTdmOGEwMjg0N2MxYzZkNDU2NDkzNDljZWYyYjk2OTY0ZTp7Il9zZXNzaW9uX2V4cGlyeSI6NzIwMCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJyb2xlX2lkIjoyLCJ2aXNpdCI6NywiX2F1dGhfdXNlcl9oYXNoIjoiODE0YmU2ZWE0MTNjYTVhMGQ4N2FjMDA3ZmVmOWFiYWE5YjI2ZGI1ZCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2017-04-05 11:39:09.527738');
INSERT INTO "main"."django_session" VALUES ('5d0i4pasljc5g1tw149wwvd13p20kepl', 'ZjJkMDgzODA5MmIyOTg3YzUxYmNjYzZhYjA1Mjg2MGZhODNmZGY5MTp7InJvbGVfaWQiOjEsIl9hdXRoX3VzZXJfaWQiOiIxMSIsInZpc2l0IjozLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9zZXNzaW9uX2V4cGlyeSI6NzIwMCwiX2F1dGhfdXNlcl9oYXNoIjoiMDBhMDhhZjJjNjg4MTgwNWY5YjkxODk5M2FjOGE5NmI1MjEyZGZhYSJ9', '2017-04-05 11:58:42.428845');
INSERT INTO "main"."django_session" VALUES ('kkfmjzxdpuuy1bwdeatr18qmxnjqn37s', 'Yjc4Y2IxNGNiN2I1ZjkxOWQyM2YxN2M0ZmExNGVkZmM1MDc5MGM3OTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9zZXNzaW9uX2V4cGlyeSI6NzIwMCwiX2F1dGhfdXNlcl9oYXNoIjoiMDBhMDhhZjJjNjg4MTgwNWY5YjkxODk5M2FjOGE5NmI1MjEyZGZhYSIsInZpc2l0Ijo0LCJyb2xlX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2017-04-06 04:38:57.865306');
INSERT INTO "main"."django_session" VALUES ('a88bzams3wa52a3blf184p23vmzc0md4', 'OWNlM2NhZGQ1YTg4MWI2OWJkNWUxZWU5Y2UzNzBiM2MwNTg4MTVkYzp7InJvbGVfaWQiOjMsIl9zZXNzaW9uX2V4cGlyeSI6NzIwMCwidmlzaXQiOjMsIl9hdXRoX3VzZXJfaGFzaCI6IjgxM2M2MTc2N2FiYzU3M2U4Y2ExMDA1NWUwYzEyZmM5YzdjMmE4MjMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2017-04-06 04:46:42.379656');
INSERT INTO "main"."django_session" VALUES ('3y85e5ca9p0xomn345t2doskx0wl42sk', 'ZDEyOTg2ZGZmMDY1MDU1MDQ5YzZkN2Q1ZmQyYjcwOGVlODg0YWZiZDp7InJvbGVfaWQiOjMsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjcyMDAsInZpc2l0IjozLCJfYXV0aF91c2VyX2hhc2giOiI4MTNjNjE3NjdhYmM1NzNlOGNhMTAwNTVlMGMxMmZjOWM3YzJhODIzIn0=', '2017-04-06 12:13:19.775764');
INSERT INTO "main"."django_session" VALUES ('ywwznzovf2bih3opes0w8smim1wdpspa', 'MDU2NjA2Nzg4NGU0YzBmYzZlODBkZjBhMmZmZTMxMGI0NDgwNmRmMTp7InZpc2l0Ijo3LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIiwicm9sZV9pZCI6MiwiX2F1dGhfdXNlcl9oYXNoIjoiODE0YmU2ZWE0MTNjYTVhMGQ4N2FjMDA3ZmVmOWFiYWE5YjI2ZGI1ZCIsIl9zZXNzaW9uX2V4cGlyeSI6NzIwMH0=', '2017-04-07 12:35:47.478861');
INSERT INTO "main"."django_session" VALUES ('kzzyca2p1xn8ng8fra6a3u3d4jfakn5w', 'MDZhNzMwM2RhZmE4ZWZhMGMwM2Q5NjY1YzkyYThiZDI5MjYxMGUxYjp7InZpc2l0IjozLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwicm9sZV9pZCI6MywiX2F1dGhfdXNlcl9oYXNoIjoiODEzYzYxNzY3YWJjNTczZThjYTEwMDU1ZTBjMTJmYzljN2MyYTgyMyIsIl9zZXNzaW9uX2V4cGlyeSI6NzIwMH0=', '2017-04-07 12:30:31.435435');
INSERT INTO "main"."django_session" VALUES ('oag8dq6n077ohd1p6cw0s4s0mpgpek9d', 'MzkxNmM1N2ZhNGEwOGJkM2NkMzA3YzRlZDRmYmVhNDlkNTJmNWUwNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidmlzaXQiOjMsIl9hdXRoX3VzZXJfaGFzaCI6IjgxM2M2MTc2N2FiYzU3M2U4Y2ExMDA1NWUwYzEyZmM5YzdjMmE4MjMiLCJfYXV0aF91c2VyX2lkIjoiMSIsInJvbGVfaWQiOjMsIl9zZXNzaW9uX2V4cGlyeSI6NzIwMH0=', '2017-04-10 05:32:28.900946');
INSERT INTO "main"."django_session" VALUES ('yecd7pi88xdwz38e3pmo7v458a1iu7fx', 'YzBiMWQwNWE4YjI1MjYzMWZhMjQ1ZDRlOTkwMTA0ZDc3NjQwMTg2ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODE0YmU2ZWE0MTNjYTVhMGQ4N2FjMDA3ZmVmOWFiYWE5YjI2ZGI1ZCIsInZpc2l0IjozLCJfYXV0aF91c2VyX2lkIjoiMiIsInJvbGVfaWQiOjIsIl9zZXNzaW9uX2V4cGlyeSI6NzIwMH0=', '2017-04-10 05:32:49.888594');
INSERT INTO "main"."django_session" VALUES ('lmek8icn79ulv0ye049d1wl1qvy9f50s', 'NzEwOGMyZjUxYWEyNTdlZmU2ZGM4Mzk3ODBjZTFmYjc2MmQzZTFiNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODEzYzYxNzY3YWJjNTczZThjYTEwMDU1ZTBjMTJmYzljN2MyYTgyMyIsInZpc2l0IjozLCJfYXV0aF91c2VyX2lkIjoiMSIsInJvbGVfaWQiOjMsIl9zZXNzaW9uX2V4cGlyeSI6NzIwMH0=', '2017-04-10 07:34:54.141817');
INSERT INTO "main"."django_session" VALUES ('bli5gvsy69c4ydgxwnlfyhct6xdang6t', 'MzQ3NWRjNTgwMTFiYzBhOTJmMTE5OGY2OTA4N2JjMWY3ZTMxNDQwOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidmlzaXQiOjMsIl9hdXRoX3VzZXJfaGFzaCI6IjgxNGJlNmVhNDEzY2E1YTBkODdhYzAwN2ZlZjlhYmFhOWIyNmRiNWQiLCJfYXV0aF91c2VyX2lkIjoiMiIsInJvbGVfaWQiOjIsIl9zZXNzaW9uX2V4cGlyeSI6NzIwMH0=', '2017-04-10 07:34:32.712192');

-- ----------------------------
-- Table structure for myassets_asset
-- ----------------------------
DROP TABLE IF EXISTS "main"."myassets_asset";
CREATE TABLE "myassets_asset" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "ip" varchar(32) NULL, "other_ip" varchar(255) NULL, "hostname" varchar(128) NOT NULL UNIQUE, "port" integer NULL, "username" varchar(16) NULL, "password" varchar(256) NULL, "mac" varchar(20) NULL, "remote_ip" varchar(16) NULL, "brand" varchar(64) NULL, "cpu" varchar(64) NULL, "memory" varchar(128) NULL, "disk" varchar(1024) NULL, "system_type" varchar(32) NULL, "system_version" varchar(8) NULL, "system_arch" varchar(16) NULL, "cabinet" varchar(32) NULL, "position" integer NULL, "number" varchar(32) NULL, "status" integer NULL, "asset_type" integer NULL, "env" integer NULL, "sn" varchar(128) NULL, "date_added" datetime NULL, "is_active" bool NOT NULL, "comment" varchar(128) NULL, "idc_id" integer NULL REFERENCES "myassets_idc" ("id"), "use_default_auth" bool NOT NULL);

-- ----------------------------
-- Records of myassets_asset
-- ----------------------------
INSERT INTO "main"."myassets_asset" VALUES (1, '192.168.1.111', '', 'account', null, '', '', '', '', '', 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 2', '8G', '500G', 'CentOS', 6.4, 'x86_64', '', null, '', 1, 2, 1, '', '2017-04-01 07:55:20.811127', 1, '配置文件', 1, 1);
INSERT INTO "main"."myassets_asset" VALUES (2, '192.168.1.2', '', 'account11', null, '', '', '', '', '', 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 2', '16G', '500G', '', '', '', '', null, '', 1, 1, 1, '', '2017-04-05 07:56:04.779531', 1, '配置文件2', 2, 1);
INSERT INTO "main"."myassets_asset" VALUES (34, '192.168.1.3', 'None', 'account12', null, '', '', '', '', '', 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 2', '10G', '502G', 'CentOS', 6.6, 'x86_64', '', null, '', 1, null, null, '', '2017-04-05 07:53:20.036819', 1, '配置文件3', 1, 1);
INSERT INTO "main"."myassets_asset" VALUES (35, '192.168.1.4', 'None', 'account13', null, null, null, null, null, null, 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 3', '11G', '503G', 'CentOS', 6.699999999999999, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.283095', 1, '配置文件4', 2, 1);
INSERT INTO "main"."myassets_asset" VALUES (36, '192.168.1.5', 'None', 'account14', null, null, null, null, null, null, 'None', '12G', '504G', 'CentOS', 6.799999999999999, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.295121', 1, '配置文件5', 1, 1);
INSERT INTO "main"."myassets_asset" VALUES (37, '192.168.1.6', 'None', 'account15', null, null, null, null, null, null, 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 3', '13G', '505G', 'CentOS', 6.899999999999999, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.310126', 1, '配置文件6', 1, 1);
INSERT INTO "main"."myassets_asset" VALUES (38, '192.168.1.7', 'None', 'account16', null, '', '', '', '', '', 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 4', '14G', '506G', 'CentOS', 6.8, 'x86_64', '', null, '', 1, null, null, '', '2017-04-10 03:30:52.399923', 1, '配置文件7', 2, 1);
INSERT INTO "main"."myassets_asset" VALUES (39, '192.168.1.8', 'None', 'account17', null, null, null, null, null, null, 'None', '15G', '507G', 'CentOS', 7.099999999999998, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.334131', 1, '配置文件8', 1, 1);
INSERT INTO "main"."myassets_asset" VALUES (40, '192.168.1.9', 'None', 'website1', null, null, null, null, null, null, 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 3', '16G', '508G', 'CentOS', 6.4, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.346157', 1, 'website1', 1, 1);
INSERT INTO "main"."myassets_asset" VALUES (41, '192.168.1.10', 'None', 'db1', null, '', '', '', '', '', 'None', '17G', '509G', 'CentOS', 6.5, 'x86_64', '', null, '', 1, null, null, '', '2017-04-05 07:53:41.419259', 1, 'db1', 2, 1);
INSERT INTO "main"."myassets_asset" VALUES (42, '192.168.1.11', 'None', 'gameserver', null, null, null, null, null, null, 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 4', '18G', '510G', 'CentOS', 6.6, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.372158', 1, 'gameserver', 1, 1);
INSERT INTO "main"."myassets_asset" VALUES (43, '192.168.1.12', 'None', 'website2', null, null, null, null, null, null, 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 5', '19G', '511G', 'CentOS', 6.699999999999999, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.383166', 1, 'website2', 2, 1);
INSERT INTO "main"."myassets_asset" VALUES (44, '192.168.1.13', 'None', 'db2', null, null, null, null, null, null, 'None', '20G', '512G', 'CentOS', 6.799999999999999, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.395177', 1, 'db2', 2, 1);
INSERT INTO "main"."myassets_asset" VALUES (45, '192.168.1.14', 'None', 'gameserver2', null, null, null, null, null, null, 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 5', '21G', '513G', 'CentOS', 6.899999999999999, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.406182', 1, 'gameserver', 1, 1);
INSERT INTO "main"."myassets_asset" VALUES (46, '192.168.1.15', 'None', 'website3', null, null, null, null, null, null, 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 6', '22G', '514G', 'CentOS', 6.999999999999998, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.418192', 1, 'website3', 2, 1);
INSERT INTO "main"."myassets_asset" VALUES (47, '192.168.1.16', 'None', 'website4', null, null, null, null, null, null, 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 2', '8G', '500G', 'CentOS', 6.4, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.429216', 1, 'website4', 1, 1);
INSERT INTO "main"."myassets_asset" VALUES (48, '192.168.1.17', 'None', 'website5', null, null, null, null, null, null, 'None', '9G', '501G', 'CentOS', 6.5, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.441209', 1, 'website5', 1, 1);
INSERT INTO "main"."myassets_asset" VALUES (49, '192.168.1.18', 'None', 'website6', null, null, null, null, null, null, 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 2', '10G', '502G', 'CentOS', 6.6, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.452232', 1, 'website6', 1, 1);
INSERT INTO "main"."myassets_asset" VALUES (50, '192.168.1.19', 'None', 'website7', null, null, null, null, null, null, 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 3', '11G', '503G', 'CentOS', 6.699999999999999, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.464223', 1, 'website7', 2, 1);
INSERT INTO "main"."myassets_asset" VALUES (51, '192.168.1.20', 'None', 'website8', null, null, null, null, null, null, 'None', '12G', '504G', 'CentOS', 6.799999999999999, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.475231', 1, 'website8', 1, 1);
INSERT INTO "main"."myassets_asset" VALUES (52, '192.168.1.21', 'None', 'website9', null, null, null, null, null, null, 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 3', '13G', '505G', 'CentOS', 6.899999999999999, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.486239', 1, 'website9', 1, 1);
INSERT INTO "main"."myassets_asset" VALUES (53, '192.168.1.22', 'None', 'website10', null, null, null, null, null, null, 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 4', '14G', '506G', 'CentOS', 6.999999999999998, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.498247', 1, 'website10', 2, 1);
INSERT INTO "main"."myassets_asset" VALUES (54, '192.168.1.23', 'None', 'website11', null, null, null, null, null, null, 'None', '15G', '507G', 'CentOS', 7.099999999999998, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.508266', 1, 'website11', 1, 1);
INSERT INTO "main"."myassets_asset" VALUES (55, '192.168.1.24', 'None', 'website12', null, null, null, null, null, null, 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 3', '16G', '508G', 'CentOS', 6.4, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.520263', 1, 'website12', 1, 1);
INSERT INTO "main"."myassets_asset" VALUES (56, '192.168.1.25', 'None', 'website13', null, null, null, null, null, null, 'None', '17G', '509G', 'CentOS', 6.5, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.531271', 1, 'website13', 2, 1);
INSERT INTO "main"."myassets_asset" VALUES (57, '192.168.1.26', 'None', 'website14', null, null, null, null, null, null, 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 4', '18G', '510G', 'CentOS', 6.6, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.543280', 1, 'website14', 1, 1);
INSERT INTO "main"."myassets_asset" VALUES (58, '192.168.1.27', 'None', 'website15', null, null, null, null, null, null, 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 5', '19G', '511G', 'CentOS', 6.699999999999999, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.554289', 1, 'website15', 2, 1);
INSERT INTO "main"."myassets_asset" VALUES (59, '192.168.1.28', 'None', 'website16', null, null, null, null, null, null, 'None', '20G', '512G', 'CentOS', 6.799999999999999, 'x86_64', null, null, null, 0, null, null, null, '2017-04-05 07:37:49.565295', 1, 'website16', 2, 1);
INSERT INTO "main"."myassets_asset" VALUES (60, '192.168.1.29', 'None', 'website17', null, null, null, null, null, null, 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 5', '21G', '513G', 'CentOS', 6.899999999999999, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.576303', 1, 'website17', 1, 1);
INSERT INTO "main"."myassets_asset" VALUES (61, '192.168.1.30', 'None', 'website18', null, null, null, null, null, null, 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 6', '22G', '514G', 'CentOS', 6.999999999999998, 'x86_64', null, null, null, 1, null, null, null, '2017-04-05 07:37:49.589313', 1, 'website18', 2, 1);
INSERT INTO "main"."myassets_asset" VALUES (62, '192.168.1.31', 'None', 'website19', null, null, null, null, null, null, 'Intel(R) Xeon(R) CPU E5-2630 0 @ 2.30GHz * 7', '23G', '515G', 'CentOS', 6.0, 'x86_65', null, null, null, 1, null, null, null, '2017-04-07 02:11:14.656608', 0, 'website19', 1, 1);

-- ----------------------------
-- Table structure for myassets_assetgroup
-- ----------------------------
DROP TABLE IF EXISTS "main"."myassets_assetgroup";
CREATE TABLE "myassets_assetgroup" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(80) NOT NULL UNIQUE, "comment" varchar(160) NULL);

-- ----------------------------
-- Records of myassets_assetgroup
-- ----------------------------
INSERT INTO "main"."myassets_assetgroup" VALUES (1, 'website', 'website edit test');
INSERT INTO "main"."myassets_assetgroup" VALUES (2, 'AG1', 'AG1');
INSERT INTO "main"."myassets_assetgroup" VALUES (3, 'miniwarriors', 'miniwarriors');
INSERT INTO "main"."myassets_assetgroup" VALUES (4, 'sanguo', 'sanguo');
INSERT INTO "main"."myassets_assetgroup" VALUES (5, 'ac', 'ac');
INSERT INTO "main"."myassets_assetgroup" VALUES (6, 'mw2', 'mw2');
INSERT INTO "main"."myassets_assetgroup" VALUES (7, 1111, 1111);
INSERT INTO "main"."myassets_assetgroup" VALUES (8, 2222, 2222);
INSERT INTO "main"."myassets_assetgroup" VALUES (9, 333, 333);

-- ----------------------------
-- Table structure for myassets_assetrecord
-- ----------------------------
DROP TABLE IF EXISTS "main"."myassets_assetrecord";
CREATE TABLE "myassets_assetrecord" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "username" varchar(30) NULL, "alert_time" datetime NOT NULL, "content" text NULL, "comment" text NULL, "asset_id" integer NOT NULL REFERENCES "myassets_asset" ("id"));

-- ----------------------------
-- Records of myassets_assetrecord
-- ----------------------------

-- ----------------------------
-- Table structure for myassets_asset_group
-- ----------------------------
DROP TABLE IF EXISTS "main"."myassets_asset_group";
CREATE TABLE "myassets_asset_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "asset_id" integer NOT NULL REFERENCES "myassets_asset" ("id"), "assetgroup_id" integer NOT NULL REFERENCES "myassets_assetgroup" ("id"));

-- ----------------------------
-- Records of myassets_asset_group
-- ----------------------------
INSERT INTO "main"."myassets_asset_group" VALUES (2, 2, 1);
INSERT INTO "main"."myassets_asset_group" VALUES (4, 1, 2);
INSERT INTO "main"."myassets_asset_group" VALUES (5, 2, 2);
INSERT INTO "main"."myassets_asset_group" VALUES (7, 1, 5);
INSERT INTO "main"."myassets_asset_group" VALUES (8, 2, 5);
INSERT INTO "main"."myassets_asset_group" VALUES (9, 2, 6);
INSERT INTO "main"."myassets_asset_group" VALUES (11, 1, 1);
INSERT INTO "main"."myassets_asset_group" VALUES (12, 2, 3);
INSERT INTO "main"."myassets_asset_group" VALUES (13, 1, 7);
INSERT INTO "main"."myassets_asset_group" VALUES (22, 1, 4);
INSERT INTO "main"."myassets_asset_group" VALUES (23, 34, 9);
INSERT INTO "main"."myassets_asset_group" VALUES (24, 34, 2);
INSERT INTO "main"."myassets_asset_group" VALUES (25, 41, 2);
INSERT INTO "main"."myassets_asset_group" VALUES (26, 38, 9);

-- ----------------------------
-- Table structure for myassets_idc
-- ----------------------------
DROP TABLE IF EXISTS "main"."myassets_idc";
CREATE TABLE "myassets_idc" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(32) NOT NULL, "bandwidth" varchar(32) NULL, "linkman" varchar(16) NULL, "phone" varchar(32) NULL, "address" varchar(128) NULL, "network" text NULL, "date_added" date NULL, "operator" varchar(32) NULL, "comment" varchar(128) NULL);

-- ----------------------------
-- Records of myassets_idc
-- ----------------------------
INSERT INTO "main"."myassets_idc" VALUES (1, '阿里云', '10M', '张三', 18888888888, '杭州', '', '2017-04-01', 'bgp', '阿里云 杭州节点');
INSERT INTO "main"."myassets_idc" VALUES (2, '上海南汇', '100M共享', '张三', 18588888888, '上海南汇', '', '2017-04-07', '电信', '南汇5星级机房');

-- ----------------------------
-- Table structure for myuser_myuser
-- ----------------------------
DROP TABLE IF EXISTS "main"."myuser_myuser";
CREATE TABLE "myuser_myuser" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "first_name" varchar(30) NOT NULL, "last_name" varchar(30) NOT NULL, "date_joined" datetime NOT NULL, "username" varchar(20) NOT NULL UNIQUE, "email" varchar(255) NOT NULL UNIQUE, "is_active" bool NOT NULL, "is_admin" bool NOT NULL, "role" varchar(2) NOT NULL, "date_of_birth" date NOT NULL);

-- ----------------------------
-- Records of myuser_myuser
-- ----------------------------
INSERT INTO "main"."myuser_myuser" VALUES (1, 'pbkdf2_sha256$30000$hQ1KsDO1DJuG$WkI0t1Y7ZYiug0GmhNusmcb8HFIVLGPzG6LhpdBgsk4=', '2017-04-10 05:33:34.655406', 1, '', '', '2017-03-29 03:33:08.095503', 'admin', 'admin@gmail.com', 1, 1, 'SU', '1970-01-01');
INSERT INTO "main"."myuser_myuser" VALUES (2, 'pbkdf2_sha256$30000$GpVbdLphuMKh$5xjnoEJPez4nq1JBtaYYnZI1kzfdwN5Q7cxanblBmrU=', '2017-04-10 05:34:00.051467', 0, '', '', '2017-03-29 03:50:03.402601', '陈奎', '786951355@qq.com', 1, 1, 'AU', '1990-03-20');
INSERT INTO "main"."myuser_myuser" VALUES (3, 'pbkdf2_sha256$30000$3N3ssyBaKNx8$86t9sZoO7aHqdff/H9Wc4wlvmHsspiriJRv/0slQthk=', null, 0, '', '', '2017-03-29 03:55:43.049150', '张三', 'zhangsan@gmail.com', 1, 1, 'AU', '1987-10-05');
INSERT INTO "main"."myuser_myuser" VALUES (11, 'pbkdf2_sha256$30000$jKN7wEMe6ww9$hp/Mi8Yi3qhQ7I9Ry1aBODTPbKBX+COI6//6m0Iv8E0=', '2017-04-06 01:16:38.138497', 0, '', '', '2017-03-29 08:23:42.229884', 'u1', 'u1@qq.com', 1, 0, 'CU', '2017-03-16');
INSERT INTO "main"."myuser_myuser" VALUES (15, 'pbkdf2_sha256$30000$5RyA3nhTIlCd$YlCBhQlKmPZbO2ri8iMZHmfKrXdVMiv+mQxvs3608qk=', null, 0, '', '', '2017-04-06 05:52:34.599054', 'u2', 'u2@gmail.com', 1, 0, 'CU', '2017-04-22');
INSERT INTO "main"."myuser_myuser" VALUES (16, 'pbkdf2_sha256$30000$K2QpS11TYzj0$tZJWwlzp/5WhPfq7HfsJfymVuxpRzdk8TEh9EY0Gy/0=', null, 0, '', '', '2017-04-06 06:12:08.461473', 'KK', '335190531@qq.com', 1, 0, 'CU', '1990-10-10');
INSERT INTO "main"."myuser_myuser" VALUES (17, 'pbkdf2_sha256$30000$TaVU40g65y6U$kO7BF+I7kGa2jAirl13S7KoES3emsuqlbQFh6BdV/ec=', null, 0, '', '', '2017-04-06 06:21:22.846000', 111111, 'chen_kuixy@sina.cn', 1, 0, 'CU', '2017-04-05');
INSERT INTO "main"."myuser_myuser" VALUES (18, 'pbkdf2_sha256$30000$a1VD5jMepIj6$NBtComUzRh11HYDrfP5He4WLzYuq0Q/w1LnRMURkwFU=', '2017-04-07 08:20:50.806046', 0, '', '', '2017-04-07 03:43:25.629194', '林华华', 'linhua@gmail.com', 1, 0, 'CU', '1987-06-10');

-- ----------------------------
-- Table structure for myuser_myuser_asset
-- ----------------------------
DROP TABLE IF EXISTS "main"."myuser_myuser_asset";
CREATE TABLE "myuser_myuser_asset" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "myuser_id" integer NOT NULL REFERENCES "myuser_myuser" ("id"), "asset_id" integer NOT NULL REFERENCES "myassets_asset" ("id"));

-- ----------------------------
-- Records of myuser_myuser_asset
-- ----------------------------
INSERT INTO "main"."myuser_myuser_asset" VALUES (1, 18, 2);
INSERT INTO "main"."myuser_myuser_asset" VALUES (2, 18, 35);
INSERT INTO "main"."myuser_myuser_asset" VALUES (3, 18, 34);
INSERT INTO "main"."myuser_myuser_asset" VALUES (4, 18, 36);
INSERT INTO "main"."myuser_myuser_asset" VALUES (5, 17, 57);
INSERT INTO "main"."myuser_myuser_asset" VALUES (6, 17, 58);
INSERT INTO "main"."myuser_myuser_asset" VALUES (7, 17, 59);
INSERT INTO "main"."myuser_myuser_asset" VALUES (8, 2, 2);
INSERT INTO "main"."myuser_myuser_asset" VALUES (9, 2, 35);
INSERT INTO "main"."myuser_myuser_asset" VALUES (10, 2, 34);
INSERT INTO "main"."myuser_myuser_asset" VALUES (11, 2, 37);
INSERT INTO "main"."myuser_myuser_asset" VALUES (12, 2, 38);
INSERT INTO "main"."myuser_myuser_asset" VALUES (13, 2, 36);
INSERT INTO "main"."myuser_myuser_asset" VALUES (14, 1, 1);
INSERT INTO "main"."myuser_myuser_asset" VALUES (15, 1, 2);
INSERT INTO "main"."myuser_myuser_asset" VALUES (16, 1, 34);
INSERT INTO "main"."myuser_myuser_asset" VALUES (17, 1, 35);
INSERT INTO "main"."myuser_myuser_asset" VALUES (18, 1, 36);
INSERT INTO "main"."myuser_myuser_asset" VALUES (19, 1, 37);
INSERT INTO "main"."myuser_myuser_asset" VALUES (20, 1, 38);
INSERT INTO "main"."myuser_myuser_asset" VALUES (21, 1, 39);
INSERT INTO "main"."myuser_myuser_asset" VALUES (22, 1, 40);
INSERT INTO "main"."myuser_myuser_asset" VALUES (23, 1, 41);
INSERT INTO "main"."myuser_myuser_asset" VALUES (24, 1, 42);
INSERT INTO "main"."myuser_myuser_asset" VALUES (25, 1, 43);
INSERT INTO "main"."myuser_myuser_asset" VALUES (26, 1, 44);
INSERT INTO "main"."myuser_myuser_asset" VALUES (27, 1, 45);
INSERT INTO "main"."myuser_myuser_asset" VALUES (28, 1, 46);
INSERT INTO "main"."myuser_myuser_asset" VALUES (29, 1, 47);
INSERT INTO "main"."myuser_myuser_asset" VALUES (30, 1, 48);
INSERT INTO "main"."myuser_myuser_asset" VALUES (31, 1, 49);
INSERT INTO "main"."myuser_myuser_asset" VALUES (32, 1, 50);
INSERT INTO "main"."myuser_myuser_asset" VALUES (33, 1, 51);
INSERT INTO "main"."myuser_myuser_asset" VALUES (34, 1, 52);
INSERT INTO "main"."myuser_myuser_asset" VALUES (35, 1, 53);
INSERT INTO "main"."myuser_myuser_asset" VALUES (36, 1, 54);
INSERT INTO "main"."myuser_myuser_asset" VALUES (37, 1, 55);
INSERT INTO "main"."myuser_myuser_asset" VALUES (38, 1, 56);
INSERT INTO "main"."myuser_myuser_asset" VALUES (39, 1, 57);
INSERT INTO "main"."myuser_myuser_asset" VALUES (40, 1, 58);
INSERT INTO "main"."myuser_myuser_asset" VALUES (41, 1, 59);
INSERT INTO "main"."myuser_myuser_asset" VALUES (42, 1, 60);
INSERT INTO "main"."myuser_myuser_asset" VALUES (43, 1, 61);
INSERT INTO "main"."myuser_myuser_asset" VALUES (44, 1, 62);
INSERT INTO "main"."myuser_myuser_asset" VALUES (45, 18, 1);
INSERT INTO "main"."myuser_myuser_asset" VALUES (46, 18, 37);
INSERT INTO "main"."myuser_myuser_asset" VALUES (47, 18, 38);
INSERT INTO "main"."myuser_myuser_asset" VALUES (48, 18, 39);
INSERT INTO "main"."myuser_myuser_asset" VALUES (49, 18, 40);
INSERT INTO "main"."myuser_myuser_asset" VALUES (50, 18, 41);
INSERT INTO "main"."myuser_myuser_asset" VALUES (51, 18, 42);
INSERT INTO "main"."myuser_myuser_asset" VALUES (52, 18, 43);
INSERT INTO "main"."myuser_myuser_asset" VALUES (53, 18, 44);
INSERT INTO "main"."myuser_myuser_asset" VALUES (54, 18, 45);
INSERT INTO "main"."myuser_myuser_asset" VALUES (55, 18, 46);
INSERT INTO "main"."myuser_myuser_asset" VALUES (56, 18, 47);
INSERT INTO "main"."myuser_myuser_asset" VALUES (57, 18, 48);
INSERT INTO "main"."myuser_myuser_asset" VALUES (58, 18, 49);
INSERT INTO "main"."myuser_myuser_asset" VALUES (59, 18, 50);
INSERT INTO "main"."myuser_myuser_asset" VALUES (60, 18, 51);
INSERT INTO "main"."myuser_myuser_asset" VALUES (61, 18, 52);
INSERT INTO "main"."myuser_myuser_asset" VALUES (62, 18, 53);
INSERT INTO "main"."myuser_myuser_asset" VALUES (63, 18, 54);
INSERT INTO "main"."myuser_myuser_asset" VALUES (64, 18, 55);
INSERT INTO "main"."myuser_myuser_asset" VALUES (65, 18, 56);
INSERT INTO "main"."myuser_myuser_asset" VALUES (66, 18, 57);
INSERT INTO "main"."myuser_myuser_asset" VALUES (67, 18, 58);
INSERT INTO "main"."myuser_myuser_asset" VALUES (68, 18, 59);
INSERT INTO "main"."myuser_myuser_asset" VALUES (69, 18, 60);
INSERT INTO "main"."myuser_myuser_asset" VALUES (70, 18, 61);
INSERT INTO "main"."myuser_myuser_asset" VALUES (71, 18, 62);
INSERT INTO "main"."myuser_myuser_asset" VALUES (72, 17, 34);
INSERT INTO "main"."myuser_myuser_asset" VALUES (73, 17, 35);
INSERT INTO "main"."myuser_myuser_asset" VALUES (74, 15, 50);
INSERT INTO "main"."myuser_myuser_asset" VALUES (75, 15, 46);
INSERT INTO "main"."myuser_myuser_asset" VALUES (76, 16, 2);
INSERT INTO "main"."myuser_myuser_asset" VALUES (77, 16, 35);
INSERT INTO "main"."myuser_myuser_asset" VALUES (78, 11, 1);
INSERT INTO "main"."myuser_myuser_asset" VALUES (79, 11, 34);
INSERT INTO "main"."myuser_myuser_asset" VALUES (80, 3, 2);
INSERT INTO "main"."myuser_myuser_asset" VALUES (81, 3, 35);
INSERT INTO "main"."myuser_myuser_asset" VALUES (82, 3, 34);
INSERT INTO "main"."myuser_myuser_asset" VALUES (83, 3, 37);

-- ----------------------------
-- Table structure for myuser_myuser_assetgroup
-- ----------------------------
DROP TABLE IF EXISTS "main"."myuser_myuser_assetgroup";
CREATE TABLE "myuser_myuser_assetgroup" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "myuser_id" integer NOT NULL REFERENCES "myuser_myuser" ("id"), "assetgroup_id" integer NOT NULL REFERENCES "myassets_assetgroup" ("id"));

-- ----------------------------
-- Records of myuser_myuser_assetgroup
-- ----------------------------
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (1, 18, 1);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (2, 18, 4);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (3, 17, 3);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (4, 2, 8);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (5, 2, 4);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (6, 2, 5);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (7, 2, 6);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (8, 2, 7);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (9, 1, 1);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (10, 1, 2);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (11, 1, 3);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (12, 1, 4);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (13, 1, 5);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (14, 1, 6);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (15, 1, 7);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (16, 1, 8);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (17, 1, 9);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (18, 15, 2);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (19, 16, 1);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (20, 16, 2);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (21, 16, 3);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (22, 11, 1);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (23, 11, 2);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (24, 3, 4);
INSERT INTO "main"."myuser_myuser_assetgroup" VALUES (25, 3, 5);

-- ----------------------------
-- Table structure for myuser_myuser_groups
-- ----------------------------
DROP TABLE IF EXISTS "main"."myuser_myuser_groups";
CREATE TABLE "myuser_myuser_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "myuser_id" integer NOT NULL REFERENCES "myuser_myuser" ("id"), "group_id" integer NOT NULL REFERENCES "auth_group" ("id"));

-- ----------------------------
-- Records of myuser_myuser_groups
-- ----------------------------
INSERT INTO "main"."myuser_myuser_groups" VALUES (1, 16, 19);
INSERT INTO "main"."myuser_myuser_groups" VALUES (2, 17, 19);
INSERT INTO "main"."myuser_myuser_groups" VALUES (3, 18, 19);
INSERT INTO "main"."myuser_myuser_groups" VALUES (4, 11, 12);
INSERT INTO "main"."myuser_myuser_groups" VALUES (5, 15, 12);
INSERT INTO "main"."myuser_myuser_groups" VALUES (6, 16, 10);
INSERT INTO "main"."myuser_myuser_groups" VALUES (7, 17, 10);

-- ----------------------------
-- Table structure for myuser_myuser_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS "main"."myuser_myuser_user_permissions";
CREATE TABLE "myuser_myuser_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "myuser_id" integer NOT NULL REFERENCES "myuser_myuser" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"));

-- ----------------------------
-- Records of myuser_myuser_user_permissions
-- ----------------------------
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (1, 2, 77);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (2, 3, 45);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (3, 3, 49);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (4, 3, 50);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (5, 3, 75);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (6, 3, 76);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (7, 3, 58);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (8, 3, 62);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (9, 3, 61);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (10, 3, 59);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (11, 2, 49);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (12, 2, 3);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (13, 2, 64);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (14, 2, 57);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (21, 18, 76);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (22, 1, 43);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (23, 1, 44);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (24, 1, 45);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (25, 1, 46);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (26, 1, 47);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (27, 1, 48);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (28, 1, 49);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (29, 1, 50);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (30, 1, 51);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (31, 1, 52);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (32, 1, 53);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (33, 1, 54);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (34, 1, 55);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (35, 1, 56);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (36, 1, 57);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (37, 1, 58);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (38, 1, 59);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (39, 1, 60);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (40, 1, 61);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (41, 1, 62);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (42, 1, 63);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (43, 1, 64);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (44, 1, 65);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (45, 1, 66);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (46, 1, 67);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (47, 1, 68);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (48, 1, 69);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (49, 1, 70);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (50, 1, 71);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (51, 1, 75);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (52, 1, 76);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (53, 1, 77);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (54, 1, 78);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (55, 1, 79);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (56, 18, 75);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (57, 18, 69);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (58, 18, 63);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (59, 18, 64);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (112, 11, 45);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (127, 15, 75);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (135, 15, 64);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (136, 15, 69);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (137, 15, 63);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (138, 2, 50);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (139, 2, 75);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (140, 2, 76);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (141, 2, 58);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (142, 2, 62);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (143, 2, 61);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (144, 2, 59);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (145, 16, 58);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (146, 16, 62);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (147, 16, 61);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (148, 17, 58);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (149, 17, 62);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (150, 17, 61);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (151, 18, 58);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (152, 18, 62);
INSERT INTO "main"."myuser_myuser_user_permissions" VALUES (153, 18, 61);

-- ----------------------------
-- Table structure for sqlite_sequence
-- ----------------------------
DROP TABLE IF EXISTS "main"."sqlite_sequence";
CREATE TABLE sqlite_sequence(name,seq);

-- ----------------------------
-- Records of sqlite_sequence
-- ----------------------------
INSERT INTO "main"."sqlite_sequence" VALUES ('django_migrations', 24);
INSERT INTO "main"."sqlite_sequence" VALUES ('django_content_type', 12);
INSERT INTO "main"."sqlite_sequence" VALUES ('auth_permission', 82);
INSERT INTO "main"."sqlite_sequence" VALUES ('django_admin_log', 0);
INSERT INTO "main"."sqlite_sequence" VALUES ('myuser_myuser', 18);
INSERT INTO "main"."sqlite_sequence" VALUES ('auth_group', 19);
INSERT INTO "main"."sqlite_sequence" VALUES ('auth_group_permissions', 42);
INSERT INTO "main"."sqlite_sequence" VALUES ('myuser_myuser_user_permissions', 153);
INSERT INTO "main"."sqlite_sequence" VALUES ('myassets_assetgroup', 13);
INSERT INTO "main"."sqlite_sequence" VALUES ('myassets_asset_group', 26);
INSERT INTO "main"."sqlite_sequence" VALUES ('myassets_idc', 4);
INSERT INTO "main"."sqlite_sequence" VALUES ('myassets_asset', 62);
INSERT INTO "main"."sqlite_sequence" VALUES ('myuser_myuser_asset', 83);
INSERT INTO "main"."sqlite_sequence" VALUES ('myuser_myuser_assetgroup', 25);
INSERT INTO "main"."sqlite_sequence" VALUES ('myuser_myuser_groups', 7);

-- ----------------------------
-- Indexes structure for table auth_group_permissions
-- ----------------------------
CREATE INDEX "main"."auth_group_permissions_0e939a4f"
ON "auth_group_permissions" ("group_id" ASC);
CREATE INDEX "main"."auth_group_permissions_8373b171"
ON "auth_group_permissions" ("permission_id" ASC);
CREATE UNIQUE INDEX "main"."auth_group_permissions_group_id_0cd325b0_uniq"
ON "auth_group_permissions" ("group_id" ASC, "permission_id" ASC);

-- ----------------------------
-- Indexes structure for table auth_permission
-- ----------------------------
CREATE INDEX "main"."auth_permission_417f1b1c"
ON "auth_permission" ("content_type_id" ASC);
CREATE UNIQUE INDEX "main"."auth_permission_content_type_id_01ab375a_uniq"
ON "auth_permission" ("content_type_id" ASC, "codename" ASC);

-- ----------------------------
-- Indexes structure for table django_admin_log
-- ----------------------------
CREATE INDEX "main"."django_admin_log_417f1b1c"
ON "django_admin_log" ("content_type_id" ASC);
CREATE INDEX "main"."django_admin_log_e8701ad4"
ON "django_admin_log" ("user_id" ASC);

-- ----------------------------
-- Indexes structure for table django_content_type
-- ----------------------------
CREATE UNIQUE INDEX "main"."django_content_type_app_label_76bd3d3b_uniq"
ON "django_content_type" ("app_label" ASC, "model" ASC);

-- ----------------------------
-- Indexes structure for table django_session
-- ----------------------------
CREATE INDEX "main"."django_session_de54fa62"
ON "django_session" ("expire_date" ASC);

-- ----------------------------
-- Indexes structure for table myassets_asset
-- ----------------------------
CREATE INDEX "main"."myassets_asset_0869e37a"
ON "myassets_asset" ("idc_id" ASC);

-- ----------------------------
-- Indexes structure for table myuser_myuser_asset
-- ----------------------------
CREATE INDEX "main"."myuser_myuser_asset_51c6d5db"
ON "myuser_myuser_asset" ("asset_id" ASC);
CREATE INDEX "main"."myuser_myuser_asset_8b14fb18"
ON "myuser_myuser_asset" ("myuser_id" ASC);
CREATE UNIQUE INDEX "main"."myuser_myuser_asset_myuser_id_227c6b13_uniq"
ON "myuser_myuser_asset" ("myuser_id" ASC, "asset_id" ASC);

-- ----------------------------
-- Indexes structure for table myuser_myuser_assetgroup
-- ----------------------------
CREATE INDEX "main"."myuser_myuser_assetgroup_2f088294"
ON "myuser_myuser_assetgroup" ("assetgroup_id" ASC);
CREATE INDEX "main"."myuser_myuser_assetgroup_8b14fb18"
ON "myuser_myuser_assetgroup" ("myuser_id" ASC);
CREATE UNIQUE INDEX "main"."myuser_myuser_assetgroup_myuser_id_a5191297_uniq"
ON "myuser_myuser_assetgroup" ("myuser_id" ASC, "assetgroup_id" ASC);

-- ----------------------------
-- Indexes structure for table myuser_myuser_groups
-- ----------------------------
CREATE INDEX "main"."myuser_myuser_groups_0e939a4f"
ON "myuser_myuser_groups" ("group_id" ASC);
CREATE INDEX "main"."myuser_myuser_groups_8b14fb18"
ON "myuser_myuser_groups" ("myuser_id" ASC);
CREATE UNIQUE INDEX "main"."myuser_myuser_groups_myuser_id_a8292f11_uniq"
ON "myuser_myuser_groups" ("myuser_id" ASC, "group_id" ASC);

-- ----------------------------
-- Indexes structure for table myuser_myuser_user_permissions
-- ----------------------------
CREATE INDEX "main"."myuser_myuser_user_permissions_8373b171"
ON "myuser_myuser_user_permissions" ("permission_id" ASC);
CREATE INDEX "main"."myuser_myuser_user_permissions_8b14fb18"
ON "myuser_myuser_user_permissions" ("myuser_id" ASC);
CREATE UNIQUE INDEX "main"."myuser_myuser_user_permissions_myuser_id_c5bca93b_uniq"
ON "myuser_myuser_user_permissions" ("myuser_id" ASC, "permission_id" ASC);
