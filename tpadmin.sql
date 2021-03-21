/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.0.168
 Source Server Type    : MySQL
 Source Server Version : 100508
 Source Host           : 192.168.0.168:3306
 Source Schema         : tpadmin

 Target Server Type    : MySQL
 Target Server Version : 100508
 File Encoding         : 65001

 Date: 21/03/2021 10:45:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for wp_mall_cate
-- ----------------------------
DROP TABLE IF EXISTS `wp_mall_cate`;
CREATE TABLE `wp_mall_cate`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名',
  `image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图片',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_time` int NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of wp_mall_cate
-- ----------------------------
INSERT INTO `wp_mall_cate` VALUES (9, '手机', 'http://admin.host/upload/20200514/98fc09b0c4ad4d793a6f04bef79a0edc.jpg', 0, 1, '', 1589440437, 1589440437, NULL);

-- ----------------------------
-- Table structure for wp_mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `wp_mall_goods`;
CREATE TABLE `wp_mall_goods`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `cate_id` int NULL DEFAULT NULL COMMENT '分类ID',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `logo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品logo',
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品图片 以 | 做分割符号',
  `describe` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品描述',
  `market_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '市场价',
  `discount_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '折扣价',
  `sales` int NULL DEFAULT 0 COMMENT '销量',
  `virtual_sales` int NULL DEFAULT 0 COMMENT '虚拟销量',
  `stock` int NULL DEFAULT 0 COMMENT '库存',
  `total_stock` int NULL DEFAULT 0 COMMENT '总库存',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_time` int NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cate_id`(`cate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品列表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of wp_mall_goods
-- ----------------------------
INSERT INTO `wp_mall_goods` VALUES (8, 10, '落地-风扇', 'http://admin.host/upload/20200514/a0f7fe9637abd219f7e93ceb2820df9b.jpg', 'http://admin.host/upload/20200514/95496713918290f6315ea3f87efa6bf2.jpg|http://admin.host/upload/20200514/ae29fa9cba4fc02defb7daed41cb2b13.jpg|http://admin.host/upload/20200514/f0a104d88ec7dc6fb42d2f87cbc71b76.jpg|http://admin.host/upload/20200514/3b88be4b1934690e5c1bd6b54b9ab5c8.jpg', '<p>76654757</p>\n\n<p><img alt=\"\" src=\"http://admin.host/upload/20200515/198070421110fa01f2c2ac2f52481647.jpg\" style=\"height:689px; width:790px\" /></p>\n\n<p><img alt=\"\" src=\"http://admin.host/upload/20200515/a07a742c15a78781e79f8a3317006c1d.jpg\" style=\"height:877px; width:790px\" /></p>\n', 599.00, 368.00, 0, 594, 0, 0, 675, 1, '', 1589454309, 1589567016, NULL);
INSERT INTO `wp_mall_goods` VALUES (9, 9, '电脑', 'http://admin.host/upload/20200514/bbf858d469dec2e12a89460110068d3d.jpg', 'http://admin.host/upload/20200514/f0a104d88ec7dc6fb42d2f87cbc71b76.jpg', '<p>477</p>\n', 0.00, 0.00, 0, 0, 115, 320, 0, 1, '', 1589465215, 1589476345, NULL);

-- ----------------------------
-- Table structure for wp_system_admin
-- ----------------------------
DROP TABLE IF EXISTS `wp_system_admin`;
CREATE TABLE `wp_system_admin`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `auth_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色权限ID',
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系手机号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注说明',
  `login_num` bigint UNSIGNED NULL DEFAULT 0 COMMENT '登录次数',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态(0:禁用,1:启用,)',
  `create_time` int NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of wp_system_admin
-- ----------------------------
INSERT INTO `wp_system_admin` VALUES (1, NULL, '/static/admin/images/head.jpg', 'manager', 'df33ce353f69aa82cd9630439c2238d978edd613', '19999999999', 'managerbbb', 20, 0, 1, 1615453571, 1616294438, NULL);
INSERT INTO `wp_system_admin` VALUES (3, '7', 'http://local.tpadmin.cc/upload/20210317/6160ea28c418278d784be87347a09f18.png', 'test2', '80ef8aa5d5482b56e3748c9af5baaa221b04d29f', '188888888888', '', 0, 0, 1, 1615968318, 1616032296, NULL);

-- ----------------------------
-- Table structure for wp_system_auth
-- ----------------------------
DROP TABLE IF EXISTS `wp_system_auth`;
CREATE TABLE `wp_system_auth`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_time` int NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统权限表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of wp_system_auth
-- ----------------------------
INSERT INTO `wp_system_auth` VALUES (1, '管理员', 1, 1, '测试管理员', 1588921753, 1589614331, NULL);
INSERT INTO `wp_system_auth` VALUES (6, '游客权限', 0, 1, '', 1588227513, 1589591751, 1589591751);
INSERT INTO `wp_system_auth` VALUES (7, '测试', 0, 1, '阿斯顿发斯蒂芬', 1615454591, 1615454591, NULL);
INSERT INTO `wp_system_auth` VALUES (8, 'asfasdf', 0, 1, 'asfwwwww', 1616043426, 1616061539, 1616061539);

-- ----------------------------
-- Table structure for wp_system_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `wp_system_auth_node`;
CREATE TABLE `wp_system_auth_node`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `auth_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '角色ID',
  `node_id` bigint NULL DEFAULT NULL COMMENT '节点ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_system_auth_auth`(`auth_id`) USING BTREE,
  INDEX `index_system_auth_node`(`node_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与节点关系表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of wp_system_auth_node
-- ----------------------------
INSERT INTO `wp_system_auth_node` VALUES (1, 6, 1);
INSERT INTO `wp_system_auth_node` VALUES (2, 6, 2);
INSERT INTO `wp_system_auth_node` VALUES (3, 6, 9);
INSERT INTO `wp_system_auth_node` VALUES (4, 6, 12);
INSERT INTO `wp_system_auth_node` VALUES (5, 6, 18);
INSERT INTO `wp_system_auth_node` VALUES (6, 6, 19);
INSERT INTO `wp_system_auth_node` VALUES (7, 6, 21);
INSERT INTO `wp_system_auth_node` VALUES (8, 6, 22);
INSERT INTO `wp_system_auth_node` VALUES (9, 6, 29);
INSERT INTO `wp_system_auth_node` VALUES (10, 6, 30);
INSERT INTO `wp_system_auth_node` VALUES (11, 6, 38);
INSERT INTO `wp_system_auth_node` VALUES (12, 6, 39);
INSERT INTO `wp_system_auth_node` VALUES (13, 6, 45);
INSERT INTO `wp_system_auth_node` VALUES (14, 6, 46);
INSERT INTO `wp_system_auth_node` VALUES (15, 6, 52);
INSERT INTO `wp_system_auth_node` VALUES (16, 6, 53);
INSERT INTO `wp_system_auth_node` VALUES (17, 7, 1);
INSERT INTO `wp_system_auth_node` VALUES (18, 7, 2);
INSERT INTO `wp_system_auth_node` VALUES (19, 7, 3);
INSERT INTO `wp_system_auth_node` VALUES (20, 7, 4);
INSERT INTO `wp_system_auth_node` VALUES (21, 7, 5);
INSERT INTO `wp_system_auth_node` VALUES (22, 7, 6);
INSERT INTO `wp_system_auth_node` VALUES (23, 7, 7);
INSERT INTO `wp_system_auth_node` VALUES (24, 7, 8);
INSERT INTO `wp_system_auth_node` VALUES (25, 7, 18);
INSERT INTO `wp_system_auth_node` VALUES (26, 7, 19);
INSERT INTO `wp_system_auth_node` VALUES (27, 7, 20);
INSERT INTO `wp_system_auth_node` VALUES (28, 8, 1);
INSERT INTO `wp_system_auth_node` VALUES (29, 8, 2);
INSERT INTO `wp_system_auth_node` VALUES (30, 8, 3);
INSERT INTO `wp_system_auth_node` VALUES (31, 8, 4);
INSERT INTO `wp_system_auth_node` VALUES (32, 8, 5);
INSERT INTO `wp_system_auth_node` VALUES (33, 8, 6);
INSERT INTO `wp_system_auth_node` VALUES (34, 8, 7);
INSERT INTO `wp_system_auth_node` VALUES (35, 8, 8);
INSERT INTO `wp_system_auth_node` VALUES (36, 8, 67);
INSERT INTO `wp_system_auth_node` VALUES (37, 8, 68);
INSERT INTO `wp_system_auth_node` VALUES (38, 8, 69);

-- ----------------------------
-- Table structure for wp_system_config
-- ----------------------------
DROP TABLE IF EXISTS `wp_system_config`;
CREATE TABLE `wp_system_config`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '变量值',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  `sort` int NULL DEFAULT 0,
  `create_time` int NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `group`(`group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of wp_system_config
-- ----------------------------
INSERT INTO `wp_system_config` VALUES (41, 'alisms_access_key_id', 'sms', '填你的', '阿里大于公钥', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (42, 'alisms_access_key_secret', 'sms', '填你的', '阿里大鱼私钥', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (55, 'upload_type', 'upload', 'local', '当前上传方式 （local,alioss,qnoss,txoss）', 0, NULL, 1615963636);
INSERT INTO `wp_system_config` VALUES (56, 'upload_allow_ext', 'upload', 'doc,gif,ico,icon,jpg,mp3,mp4,p12,pem,png,rar,jpeg', '允许上传的文件类型', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (57, 'upload_allow_size', 'upload', '1024000', '允许上传的大小', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (58, 'upload_allow_mime', 'upload', 'image/gif,image/jpeg,video/x-msvideo,text/plain,image/png', '允许上传的文件mime', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (59, 'upload_allow_type', 'upload', 'local,alioss,qnoss,txcos', '可用的上传文件方式', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (60, 'alioss_access_key_id', 'upload', '填你的公钥信息公钥信息公钥信息', '阿里云oss公钥', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (61, 'alioss_access_key_secret', 'upload', '填你的私钥信息私钥信息私钥信息', '阿里云oss私钥', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (62, 'alioss_endpoint', 'upload', '填你的', '阿里云oss数据中心', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (63, 'alioss_bucket', 'upload', '填你的', '阿里云oss空间名称', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (64, 'alioss_domain', 'upload', '填你的', '阿里云oss访问域名', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (65, 'logo_title', 'site', '后台管理', 'LOGO标题', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (66, 'logo_image', 'site', 'http://local.tpadmin.cc/upload/20210318/c16922085c0bdbefdf5467443a256ec6.png', 'logo图片', 0, NULL, 1616032378);
INSERT INTO `wp_system_config` VALUES (68, 'site_name', 'site', '后台系统', '站点名称', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (69, 'site_ico', 'site', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/7d32671f4c1d1b01b0b28f45205763f9.ico', '浏览器图标', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (70, 'site_copyright', 'site', '©版权所有 2014-2099', '版权信息', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (71, 'site_beian', 'site', '粤ICP备88888888', '备案信息', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (72, 'site_version', 'site', '2.0.0', '版本信息', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (75, 'sms_type', 'sms', 'alisms', '短信类型', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (76, 'miniapp_appid', 'wechat', '填你的', '小程序公钥', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (77, 'miniapp_appsecret', 'wechat', '填你的', '小程序私钥', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (78, 'web_appid', 'wechat', '填你的', '公众号公钥', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (79, 'web_appsecret', 'wechat', '填你的', '公众号私钥', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (80, 'txcos_secret_id', 'upload', '填你的', '腾讯云cos密钥', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (81, 'txcos_secret_key', 'upload', '填你的', '腾讯云cos私钥', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (82, 'txcos_region', 'upload', '填你的', '存储桶地域', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (83, 'tecos_bucket', 'upload', '填你的', '存储桶名称', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (84, 'qnoss_access_key', 'upload', '填你的', '访问密钥', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (85, 'qnoss_secret_key', 'upload', '填你的', '安全密钥', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (86, 'qnoss_bucket', 'upload', '填你的', '存储空间', 0, NULL, NULL);
INSERT INTO `wp_system_config` VALUES (87, 'qnoss_domain', 'upload', '填你的', '访问域名', 0, NULL, NULL);

-- ----------------------------
-- Table structure for wp_system_log
-- ----------------------------
DROP TABLE IF EXISTS `wp_system_log`;
CREATE TABLE `wp_system_log`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int UNSIGNED NULL DEFAULT 0 COMMENT '管理员ID',
  `url` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作页面',
  `method` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求方法',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '日志标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'User-Agent',
  `create_time` int NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 769 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台操作日志表 - 202103' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of wp_system_log
-- ----------------------------
INSERT INTO `wp_system_log` VALUES (630, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"42lk\",\"keep_login\":\"0\"}', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615453650);
INSERT INTO `wp_system_log` VALUES (631, 1, '/backadmin/ajax/upload', 'post', '', '[]', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615453682);
INSERT INTO `wp_system_log` VALUES (632, 1, '/backadmin/ajax/upload', 'post', '', '[]', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615453682);
INSERT INTO `wp_system_log` VALUES (633, 1, '/backadmin/ajax/upload', 'post', '', '[]', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615453682);
INSERT INTO `wp_system_log` VALUES (634, 1, '/backadmin/system.auth/add', 'post', '', '{\"title\":\"测试\",\"remark\":\"阿斯顿发斯蒂芬\"}', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615454591);
INSERT INTO `wp_system_log` VALUES (635, 1, '/backadmin/system.auth/saveAuthorize', 'post', '', '{\"title\":\"测试\",\"node\":\"[1,2,3,4,5,6,7,8,18,19,20]\",\"id\":\"7\"}', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36 Edg/89.0.774.45', 1615454603);
INSERT INTO `wp_system_log` VALUES (636, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"abbf\",\"keep_login\":\"0\"}', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615525495);
INSERT INTO `wp_system_log` VALUES (637, 1, '/backadmin/system.config/save', 'post', '', '{\"logo_title\":\"后台管理\",\"logo_image\":\"\\/favicon.ico\",\"file\":\"\"}', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615525999);
INSERT INTO `wp_system_log` VALUES (638, 1, '/backadmin/system.config/save', 'post', '', '{\"logo_title\":\"后台管理\",\"logo_image\":\"\\/favicon.ico\",\"file\":\"\"}', '192.168.0.100', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Mobile Safari/537.36', 1615526030);
INSERT INTO `wp_system_log` VALUES (639, 1, '/backadmin/system.config/save', 'post', '', '{\"logo_title\":\"后台管理\",\"logo_image\":\"\\/favicon.ico\",\"file\":\"\"}', '192.168.0.100', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Mobile Safari/537.36', 1615526121);
INSERT INTO `wp_system_log` VALUES (640, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"d972d6f9833c34fcf4d840727f2e9a853b2b1fe6\",\"captcha\":\"fewj\",\"keep_login\":\"0\"}', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615641626);
INSERT INTO `wp_system_log` VALUES (641, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"fewj\",\"keep_login\":\"0\"}', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615641632);
INSERT INTO `wp_system_log` VALUES (642, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"bxqf\",\"keep_login\":\"0\"}', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1615641640);
INSERT INTO `wp_system_log` VALUES (643, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"xn3y\",\"keep_login\":\"0\"}', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615693297);
INSERT INTO `wp_system_log` VALUES (644, 1, '/backadmin/system.menu/add?id=249', 'post', '', '{\"id\":\"249\",\"pid\":\"249\",\"title\":\"订单管理\",\"href\":\"system.admin\\/order\",\"icon\":\"fa fa-list\",\"target\":\"_top\",\"sort\":\"0\",\"remark\":\"\"}', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615694480);
INSERT INTO `wp_system_log` VALUES (645, 1, '/backadmin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615694565);
INSERT INTO `wp_system_log` VALUES (646, 1, '/backadmin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '192.168.0.100', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Mobile Safari/537.36', 1615694576);
INSERT INTO `wp_system_log` VALUES (647, 1, '/backadmin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '192.168.0.100', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Mobile Safari/537.36', 1615695322);
INSERT INTO `wp_system_log` VALUES (648, 1, '/backadmin/system.menu/edit?id=254', 'post', '', '{\"id\":\"254\",\"pid\":\"249\",\"title\":\"订单管理\",\"href\":\"system.adminxx\\/order\",\"icon\":\"fa fa-list\",\"target\":\"_top\",\"sort\":\"0\",\"remark\":\"\"}', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615695343);
INSERT INTO `wp_system_log` VALUES (649, 1, '/backadmin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615695882);
INSERT INTO `wp_system_log` VALUES (650, 1, '/backadmin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615695921);
INSERT INTO `wp_system_log` VALUES (651, 1, '/backadmin/system.config/save', 'post', '', '{\"site_name\":\"后台系统\",\"site_ico\":\"https:\\/\\/lxn-99php.oss-cn-shenzhen.aliyuncs.com\\/upload\\/20191111\\/7d32671f4c1d1b01b0b28f45205763f9.ico\",\"file\":\"\",\"site_version\":\"2.0.0\",\"site_beian\":\"粤ICP备88888888\",\"site_copyright\":\"©版权所有 2014-2099\"}', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615696651);
INSERT INTO `wp_system_log` VALUES (652, 1, '/backadmin/system.menu/delete?id=254', 'post', '', '{\"id\":\"254\"}', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615700118);
INSERT INTO `wp_system_log` VALUES (653, 1, '/backadmin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615700192);
INSERT INTO `wp_system_log` VALUES (654, 1, '/backadmin/system.config/save', 'post', '', '{\"upload_type\":\"alioss\",\"upload_allow_ext\":\"doc,gif,ico,icon,jpg,mp3,mp4,p12,pem,png,rar,jpeg\",\"upload_allow_size\":\"1024000\",\"alioss_access_key_id\":\"填你的公钥信息公钥信息公钥信息\",\"alioss_access_key_secret\":\"填你的私钥信息私钥信息私钥信息\",\"alioss_endpoint\":\"填你的\",\"alioss_bucket\":\"填你的\",\"alioss_domain\":\"填你的\"}', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615700321);
INSERT INTO `wp_system_log` VALUES (655, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"3gad\",\"keep_login\":\"0\"}', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615701267);
INSERT INTO `wp_system_log` VALUES (656, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"evvk\",\"keep_login\":\"0\"}', '172.18.0.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615720443);
INSERT INTO `wp_system_log` VALUES (657, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"tdhd\",\"keep_login\":\"0\"}', '172.18.0.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615720451);
INSERT INTO `wp_system_log` VALUES (658, 1, '/backadmin/system.node/modify', 'post', '', '{\"id\":\"1\",\"field\":\"is_auth\",\"value\":\"0\"}', '172.18.0.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615720464);
INSERT INTO `wp_system_log` VALUES (659, 1, '/backadmin/system.node/modify', 'post', '', '{\"id\":\"1\",\"field\":\"is_auth\",\"value\":\"1\"}', '172.18.0.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615720465);
INSERT INTO `wp_system_log` VALUES (660, NULL, '/backadmin/login/index', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"zu6c\",\"keep_login\":\"0\"}', '172.18.0.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615720560);
INSERT INTO `wp_system_log` VALUES (661, NULL, '/backadmin/login/index', 'post', '', '{\"username\":\"manager\",\"password\":\"461bb6f4dfbdbdd900181288ff6407b102c04457\",\"captcha\":\"啊所发生\",\"keep_login\":\"0\"}', '172.18.0.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615720922);
INSERT INTO `wp_system_log` VALUES (662, NULL, '/backadmin/login/index', 'post', '', '{\"username\":\"manager\",\"password\":\"461bb6f4dfbdbdd900181288ff6407b102c04457\",\"captcha\":\"r4fa\",\"keep_login\":\"0\"}', '172.18.0.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615720929);
INSERT INTO `wp_system_log` VALUES (663, NULL, '/backadmin/login/index', 'post', '', '{\"username\":\"manager\",\"password\":\"461bb6f4dfbdbdd900181288ff6407b102c04457\",\"captcha\":\"r4fa\",\"keep_login\":\"0\"}', '172.18.0.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615720932);
INSERT INTO `wp_system_log` VALUES (664, NULL, '/backadmin/login/index', 'post', '', '{\"username\":\"manager\",\"password\":\"461bb6f4dfbdbdd900181288ff6407b102c04457\",\"captcha\":\"vh7n\",\"keep_login\":\"0\"}', '172.18.0.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615720944);
INSERT INTO `wp_system_log` VALUES (665, NULL, '/backadmin/login/index', 'post', '', '{\"username\":\"manager\",\"password\":\"461bb6f4dfbdbdd900181288ff6407b102c04457\",\"captcha\":\"vh7n\",\"keep_login\":\"0\"}', '172.18.0.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615721337);
INSERT INTO `wp_system_log` VALUES (666, NULL, '/backadmin/login/index', 'post', '', '{\"username\":\"manager\",\"password\":\"461bb6f4dfbdbdd900181288ff6407b102c04457\",\"captcha\":\"pyxf\",\"keep_login\":\"0\"}', '172.18.0.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615721345);
INSERT INTO `wp_system_log` VALUES (667, NULL, '/backadmin/login/index', 'post', '', '{\"username\":\"manager\",\"password\":\"d972d6f9833c34fcf4d840727f2e9a853b2b1fe6\",\"captcha\":\"zgyt\",\"keep_login\":\"0\"}', '172.18.0.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615721355);
INSERT INTO `wp_system_log` VALUES (668, NULL, '/backadmin/login/index', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"zbuy\",\"keep_login\":\"0\"}', '172.18.0.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615721366);
INSERT INTO `wp_system_log` VALUES (669, NULL, '/backadmin/login/index', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"h3pn\",\"keep_login\":\"0\"}', '172.18.0.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615721375);
INSERT INTO `wp_system_log` VALUES (670, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"ebdn\",\"keep_login\":\"0\"}', '172.18.0.12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615775853);
INSERT INTO `wp_system_log` VALUES (671, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"wuq5\",\"keep_login\":\"0\"}', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615952050);
INSERT INTO `wp_system_log` VALUES (672, 1, '/backadmin/ajax/upload', 'post', '', '[]', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615952690);
INSERT INTO `wp_system_log` VALUES (673, 1, '/backadmin/ajax/upload', 'post', '', '[]', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615952697);
INSERT INTO `wp_system_log` VALUES (674, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"cdkj\",\"keep_login\":\"0\"}', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615960173);
INSERT INTO `wp_system_log` VALUES (675, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"wnmb\",\"keep_login\":\"0\"}', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615960182);
INSERT INTO `wp_system_log` VALUES (676, 1, '/backadmin/system.admin/modify', 'post', '', '{\"id\":\"1\",\"field\":\"status\",\"value\":\"0\"}', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615962919);
INSERT INTO `wp_system_log` VALUES (677, 1, '/backadmin/ajax/upload', 'post', '', '[]', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615962937);
INSERT INTO `wp_system_log` VALUES (678, 1, '/backadmin/ajax/upload', 'post', '', '[]', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615962997);
INSERT INTO `wp_system_log` VALUES (679, 1, '/backadmin/ajax/upload', 'post', '', '[]', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615963258);
INSERT INTO `wp_system_log` VALUES (680, 1, '/backadmin/ajax/upload', 'post', '', '[]', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615963290);
INSERT INTO `wp_system_log` VALUES (681, 1, '/backadmin/system.config/save', 'post', '', '{\"upload_type\":\"local\",\"upload_allow_ext\":\"doc,gif,ico,icon,jpg,mp3,mp4,p12,pem,png,rar,jpeg\",\"upload_allow_size\":\"1024000\"}', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615963306);
INSERT INTO `wp_system_log` VALUES (682, 1, '/backadmin/system.config/save', 'post', '', '{\"upload_type\":\"local\",\"upload_allow_ext\":\"doc,gif,ico,icon,jpg,mp3,mp4,p12,pem,png,rar,jpeg\",\"upload_allow_size\":\"1024000\"}', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615963636);
INSERT INTO `wp_system_log` VALUES (683, 1, '/backadmin/ajax/upload', 'post', '', '[]', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615963649);
INSERT INTO `wp_system_log` VALUES (684, 1, '/backadmin/system.admin/add', 'post', '', '{\"head_img\":\"http:\\/\\/local.tpadmin.cc\\/upload\\/20210317\\/9c9be60c729a254b0313c8a17b849863.png\",\"file\":\"\",\"username\":\"asfasdf\",\"phone\":\"188888888888\",\"auth_ids\":{\"7\":\"on\"},\"remark\":\"\"}', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615963665);
INSERT INTO `wp_system_log` VALUES (685, 1, '/backadmin/system.admin/delete?id=2', 'post', '', '{\"id\":\"2\"}', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615964388);
INSERT INTO `wp_system_log` VALUES (686, 1, '/backadmin/ajax/upload', 'post', '', '[]', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615966194);
INSERT INTO `wp_system_log` VALUES (687, 1, '/backadmin/ajax/upload', 'post', '', '[]', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615967270);
INSERT INTO `wp_system_log` VALUES (688, 1, '/backadmin/ajax/upload', 'post', '', '[]', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615967725);
INSERT INTO `wp_system_log` VALUES (689, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"cq8r\",\"keep_login\":\"0\"}', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615967739);
INSERT INTO `wp_system_log` VALUES (690, 1, '/backadmin/ajax/upload', 'post', '', '[]', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615968303);
INSERT INTO `wp_system_log` VALUES (691, 1, '/backadmin/system.admin/add', 'post', '', '{\"head_img\":\"http:\\/\\/local.tpadmin.cc\\/upload\\/20210317\\/6160ea28c418278d784be87347a09f18.png\",\"file\":\"\",\"username\":\"test2\",\"phone\":\"188888888888\",\"auth_ids\":{\"7\":\"on\"},\"remark\":\"\"}', '172.18.0.13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1615968318);
INSERT INTO `wp_system_log` VALUES (692, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"qjby\",\"keep_login\":\"0\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616029340);
INSERT INTO `wp_system_log` VALUES (693, 1, '/backadmin/system.admin/modify', 'post', '', '{\"id\":\"3\",\"field\":\"status\",\"value\":\"0\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616031352);
INSERT INTO `wp_system_log` VALUES (694, 1, '/backadmin/system.admin/modify', 'post', '', '{\"id\":\"3\",\"field\":\"status\",\"value\":\"1\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616031356);
INSERT INTO `wp_system_log` VALUES (695, 1, '/backadmin/system.admin/modify', 'post', '', '{\"id\":\"3\",\"field\":\"status\",\"value\":\"0\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616031361);
INSERT INTO `wp_system_log` VALUES (696, 1, '/backadmin/system.admin/modify', 'post', '', '{\"id\":\"3\",\"field\":\"status\",\"value\":\"1\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616031365);
INSERT INTO `wp_system_log` VALUES (697, 1, '/backadmin/system.admin/password?id=3', 'post', '', '{\"id\":\"3\",\"username\":\"test2\",\"password\":\"a1a003a8b195c1438c1735ad18b2d53a9342477a\",\"password_again\":\"a1a003a8b195c1438c1735ad18b2d53a9342477a\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616032089);
INSERT INTO `wp_system_log` VALUES (698, 1, '/backadmin/system.admin/password?id=3', 'post', '', '{\"id\":\"3\",\"username\":\"test2\",\"password\":\"a1a003a8b195c1438c1735ad18b2d53a9342477a\",\"password_again\":\"a1a003a8b195c1438c1735ad18b2d53a9342477a\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616032095);
INSERT INTO `wp_system_log` VALUES (699, 1, '/backadmin/system.admin/password?id=3', 'post', '', '{\"id\":\"3\",\"username\":\"test2\",\"password\":\"a1a003a8b195c1438c1735ad18b2d53a9342477a\",\"password_again\":\"a1a003a8b195c1438c1735ad18b2d53a9342477a\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616032133);
INSERT INTO `wp_system_log` VALUES (700, 1, '/backadmin/system.admin/password?id=3', 'post', '', '{\"id\":\"3\",\"username\":\"test2\",\"password\":\"a1a003a8b195c1438c1735ad18b2d53a9342477a\",\"password_again\":\"a1a003a8b195c1438c1735ad18b2d53a9342477a\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616032185);
INSERT INTO `wp_system_log` VALUES (701, 1, '/backadmin/system.admin/password?id=3', 'post', '', '{\"id\":\"3\",\"username\":\"test2\",\"password\":\"a1a003a8b195c1438c1735ad18b2d53a9342477a\",\"password_again\":\"a1a003a8b195c1438c1735ad18b2d53a9342477a\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616032207);
INSERT INTO `wp_system_log` VALUES (702, 1, '/backadmin/system.admin/password?id=3', 'post', '', '{\"id\":\"3\",\"username\":\"test2\",\"password\":\"a1a003a8b195c1438c1735ad18b2d53a9342477a\",\"password_again\":\"a1a003a8b195c1438c1735ad18b2d53a9342477a\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616032209);
INSERT INTO `wp_system_log` VALUES (703, 1, '/backadmin/system.admin/password?id=3', 'post', '', '{\"id\":\"3\",\"username\":\"test2\",\"password\":\"a1a003a8b195c1438c1735ad18b2d53a9342477a\",\"password_again\":\"a1a003a8b195c1438c1735ad18b2d53a9342477a\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616032219);
INSERT INTO `wp_system_log` VALUES (704, 1, '/backadmin/system.admin/password?id=3', 'post', '', '{\"id\":\"3\",\"username\":\"test2\",\"password\":\"d02468a017c5bde006249a6b8c6f44a40acf6026\",\"password_again\":\"d02468a017c5bde006249a6b8c6f44a40acf6026\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616032276);
INSERT INTO `wp_system_log` VALUES (705, 1, '/backadmin/system.admin/password?id=3', 'post', '', '{\"id\":\"3\",\"username\":\"test2\",\"password\":\"80ef8aa5d5482b56e3748c9af5baaa221b04d29f\",\"password_again\":\"80ef8aa5d5482b56e3748c9af5baaa221b04d29f\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616032296);
INSERT INTO `wp_system_log` VALUES (706, 1, '/backadmin/ajax/upload', 'post', '', '[]', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616032376);
INSERT INTO `wp_system_log` VALUES (707, 1, '/backadmin/system.config/save', 'post', '', '{\"logo_title\":\"后台管理\",\"logo_image\":\"http:\\/\\/local.tpadmin.cc\\/upload\\/20210318\\/c16922085c0bdbefdf5467443a256ec6.png\",\"file\":\"\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616032378);
INSERT INTO `wp_system_log` VALUES (708, 1, '/backadmin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616040380);
INSERT INTO `wp_system_log` VALUES (709, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"8ly2\",\"keep_login\":\"0\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616040389);
INSERT INTO `wp_system_log` VALUES (710, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"2rpd\",\"keep_login\":\"0\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616040395);
INSERT INTO `wp_system_log` VALUES (711, 1, '/backadmin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616040405);
INSERT INTO `wp_system_log` VALUES (712, 1, '/backadmin/system.node/refreshNode?force=1', 'post', '', '{\"force\":\"1\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616040429);
INSERT INTO `wp_system_log` VALUES (713, 1, '/backadmin/system.auth/add', 'post', '', '{\"title\":\"asfasdf\",\"remark\":\"\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616043426);
INSERT INTO `wp_system_log` VALUES (714, 1, '/backadmin/system.auth/edit?id=8', 'post', '', '{\"id\":\"8\",\"title\":\"asfasdf\",\"remark\":\"asfwwwww\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616043440);
INSERT INTO `wp_system_log` VALUES (715, 1, '/backadmin/system.auth/saveAuthorize', 'post', '', '{\"title\":\"asfasdf\",\"node\":\"[1,2,3,4,5,6,7,8,67,68,69]\",\"id\":\"8\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616043451);
INSERT INTO `wp_system_log` VALUES (716, 1, '/backadmin/mall.goods/modify', 'post', '', '{\"id\":\"8\",\"field\":\"sales\",\"value\":\"1\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616047431);
INSERT INTO `wp_system_log` VALUES (717, 1, '/backadmin/mall.goods/modify', 'post', '', '{\"id\":\"9\",\"field\":\"sales\",\"value\":\"1\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616047486);
INSERT INTO `wp_system_log` VALUES (718, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"vldc\",\"keep_login\":\"0\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616048035);
INSERT INTO `wp_system_log` VALUES (719, 1, '/backadmin/mall.goods/modify', 'post', '', '{\"id\":\"8\",\"field\":\"sales\",\"value\":\"1\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616049332);
INSERT INTO `wp_system_log` VALUES (720, 1, '/backadmin/mall.goods/modify', 'post', '', '{\"id\":\"9\",\"field\":\"sales\",\"value\":\"1\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616049344);
INSERT INTO `wp_system_log` VALUES (721, 1, '/backadmin/mall.goods/modify', 'post', '', '{\"id\":\"8\",\"field\":\"sales\",\"value\":\"1\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616050381);
INSERT INTO `wp_system_log` VALUES (722, 1, '/backadmin/mall.goods/modify', 'post', '', '{\"id\":\"8\",\"field\":\"sales\",\"value\":\"0信息\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616050419);
INSERT INTO `wp_system_log` VALUES (723, 1, '/backadmin/mall.goods/modify', 'post', '', '{\"id\":\"8\",\"field\":\"sales\",\"value\":\"哈哈\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616050438);
INSERT INTO `wp_system_log` VALUES (724, 1, '/backadmin/mall.goods/modify', 'post', '', '{\"id\":\"8\",\"field\":\"sales\",\"value\":\"22\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616050455);
INSERT INTO `wp_system_log` VALUES (725, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"c3fa\",\"keep_login\":\"0\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616059251);
INSERT INTO `wp_system_log` VALUES (726, 1, '/backadmin/system.node/clearNode', 'post', '', '[]', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616060000);
INSERT INTO `wp_system_log` VALUES (727, 1, '/backadmin/system.node/clearNode', 'post', '', '[]', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616060010);
INSERT INTO `wp_system_log` VALUES (728, 1, '/backadmin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616060066);
INSERT INTO `wp_system_log` VALUES (729, 1, '/backadmin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616060087);
INSERT INTO `wp_system_log` VALUES (730, 1, '/backadmin/system.node/refreshNode?force=1', 'post', '', '{\"force\":\"1\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616060097);
INSERT INTO `wp_system_log` VALUES (731, 1, '/backadmin/system.node/clearNode', 'post', '', '[]', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616060105);
INSERT INTO `wp_system_log` VALUES (732, 1, '/backadmin/system.node/clearNode', 'post', '', '[]', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616060182);
INSERT INTO `wp_system_log` VALUES (733, 1, '/backadmin/system.menu/add', 'post', '', '{\"pid\":\"249\",\"title\":\"asdfasdf\",\"href\":\"asdfasdfasdf\",\"icon\":\"fa fa-list\",\"target\":\"_blank\",\"sort\":\"0\",\"remark\":\"\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616060452);
INSERT INTO `wp_system_log` VALUES (734, 1, '/backadmin/system.menu/delete?id=255', 'post', '', '{\"id\":\"255\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616060465);
INSERT INTO `wp_system_log` VALUES (735, 1, '/backadmin/system.menu/delete?id=255', 'post', '', '{\"id\":\"255\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616060478);
INSERT INTO `wp_system_log` VALUES (736, 1, '/backadmin/system.menu/add?id=251', 'post', '', '{\"id\":\"251\",\"pid\":\"251\",\"title\":\"sfasdf\",\"href\":\"asfasdfasd\",\"icon\":\"fa fa-list\",\"target\":\"_blank\",\"sort\":\"0\",\"remark\":\"\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616060886);
INSERT INTO `wp_system_log` VALUES (737, 1, '/backadmin/system.menu/delete?id=256', 'post', '', '{\"id\":\"256\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616060893);
INSERT INTO `wp_system_log` VALUES (738, 1, '/backadmin/system.menu/add', 'post', '', '{\"pid\":\"0\",\"title\":\"asfasdf\",\"href\":\"asfasdf\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616061058);
INSERT INTO `wp_system_log` VALUES (739, 1, '/backadmin/system.menu/delete?id=257', 'post', '', '{\"id\":\"257\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616061064);
INSERT INTO `wp_system_log` VALUES (740, 1, '/backadmin/system.menu/add', 'post', '', '{\"pid\":\"0\",\"title\":\"asdfasdf\",\"href\":\"asdfasdfsd\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616061092);
INSERT INTO `wp_system_log` VALUES (741, 1, '/backadmin/system.menu/delete?id=258', 'post', '', '{\"id\":\"258\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616061103);
INSERT INTO `wp_system_log` VALUES (742, 1, '/backadmin/system.menu/add', 'post', '', '{\"pid\":\"0\",\"title\":\"bbbb\",\"href\":\"bbbb\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616061165);
INSERT INTO `wp_system_log` VALUES (743, 1, '/backadmin/system.menu/delete?id=259', 'post', '', '{\"id\":\"259\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616061175);
INSERT INTO `wp_system_log` VALUES (744, 1, '/backadmin/system.menu/add', 'post', '', '{\"pid\":\"0\",\"title\":\"asdfasdf\",\"href\":\"asdfasdfsad\",\"icon\":\"fa fa-list\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616061280);
INSERT INTO `wp_system_log` VALUES (745, 1, '/backadmin/system.menu/delete?id=260', 'post', '', '{\"id\":\"260\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616061287);
INSERT INTO `wp_system_log` VALUES (746, 1, '/backadmin/system.menu/add', 'post', '', '{\"pid\":\"0\",\"title\":\"asdfasdf\",\"href\":\"asfasdf\",\"icon\":\"fa fa-list\",\"target\":\"_blank\",\"sort\":\"0\",\"remark\":\"\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616061336);
INSERT INTO `wp_system_log` VALUES (747, 1, '/backadmin/system.menu/delete?id=261', 'post', '', '{\"id\":\"261\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616061345);
INSERT INTO `wp_system_log` VALUES (748, 1, '/backadmin/system.auth/delete?id=8', 'post', '', '{\"id\":\"8\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616061539);
INSERT INTO `wp_system_log` VALUES (749, 1, '/backadmin/index/editAdmin.html', 'post', '', '{\"head_img\":\"\\/static\\/admin\\/images\\/head.jpg\",\"file\":\"\",\"username\":\"manager\",\"phone\":\"manager\",\"remark\":\"manager\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616064736);
INSERT INTO `wp_system_log` VALUES (750, 1, '/backadmin/index/editAdmin.html', 'post', '', '{\"head_img\":\"\\/static\\/admin\\/images\\/head.jpg\",\"file\":\"\",\"username\":\"manager\",\"phone\":\"manager\",\"remark\":\"manager2\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616064739);
INSERT INTO `wp_system_log` VALUES (751, 1, '/backadmin/index/editAdmin.html', 'post', '', '{\"head_img\":\"\\/static\\/admin\\/images\\/head.jpg\",\"file\":\"\",\"username\":\"manager\",\"phone\":\"manager\",\"remark\":\"manager2\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616064741);
INSERT INTO `wp_system_log` VALUES (752, 1, '/backadmin/index/editAdmin.html', 'post', '', '{\"head_img\":\"\\/static\\/admin\\/images\\/head.jpg\",\"file\":\"\",\"username\":\"manager\",\"phone\":\"manager\",\"remark\":\"manager2\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616064745);
INSERT INTO `wp_system_log` VALUES (753, 1, '/backadmin/index/editAdmin.html', 'post', '', '{\"head_img\":\"\\/static\\/admin\\/images\\/head.jpg\",\"file\":\"\",\"username\":\"manager\",\"phone\":\"manager\",\"remark\":\"manager2\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616064757);
INSERT INTO `wp_system_log` VALUES (754, 1, '/backadmin/index/editAdmin.html', 'post', '', '{\"head_img\":\"\\/static\\/admin\\/images\\/head.jpg\",\"file\":\"\",\"username\":\"manager\",\"phone\":\"manager\",\"remark\":\"manager2\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616064831);
INSERT INTO `wp_system_log` VALUES (755, 1, '/backadmin/index/editAdmin.html', 'post', '', '{\"head_img\":\"\\/static\\/admin\\/images\\/head.jpg\",\"file\":\"\",\"username\":\"manager\",\"phone\":\"manager\",\"remark\":\"manager2\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616064848);
INSERT INTO `wp_system_log` VALUES (756, 1, '/backadmin/index/editAdmin.html', 'post', '', '{\"head_img\":\"\\/static\\/admin\\/images\\/head.jpg\",\"file\":\"\",\"username\":\"manager\",\"phone\":\"manager\",\"remark\":\"manager2\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616064864);
INSERT INTO `wp_system_log` VALUES (757, 1, '/backadmin/index/editAdmin.html', 'post', '', '{\"head_img\":\"\\/static\\/admin\\/images\\/head.jpg\",\"file\":\"\",\"username\":\"manager\",\"phone\":\"manager\",\"remark\":\"manager2\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616064985);
INSERT INTO `wp_system_log` VALUES (758, 1, '/backadmin/index/editAdmin.html', 'post', '', '{\"head_img\":\"\\/static\\/admin\\/images\\/head.jpg\",\"file\":\"\",\"username\":\"manager\",\"phone\":\"manager\",\"remark\":\"manager2222\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616064990);
INSERT INTO `wp_system_log` VALUES (759, 1, '/backadmin/index/editAdmin.html', 'post', '', '{\"head_img\":\"\\/static\\/admin\\/images\\/head.jpg\",\"file\":\"\",\"username\":\"manager\",\"phone\":\"manager11111\",\"remark\":\"manager\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616065011);
INSERT INTO `wp_system_log` VALUES (760, 1, '/backadmin/index/editAdmin.html', 'post', '', '{\"head_img\":\"\\/static\\/admin\\/images\\/head.jpg\",\"file\":\"\",\"username\":\"manager\",\"phone\":\"manager\",\"remark\":\"manager22\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616065028);
INSERT INTO `wp_system_log` VALUES (761, 1, '/backadmin/index/editAdmin.html', 'post', '', '{\"head_img\":\"\\/static\\/admin\\/images\\/head.jpg\",\"file\":\"\",\"username\":\"manager\",\"phone\":\"19999999999\",\"remark\":\"manager22\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616065096);
INSERT INTO `wp_system_log` VALUES (762, 1, '/backadmin/index/editAdmin.html', 'post', '', '{\"head_img\":\"\\/static\\/admin\\/images\\/head.jpg\",\"file\":\"\",\"username\":\"manager\",\"phone\":\"19999999999\",\"remark\":\"managerbbb\"}', '172.18.0.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616065104);
INSERT INTO `wp_system_log` VALUES (763, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"htmc\",\"keep_login\":\"0\"}', '172.18.0.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616122159);
INSERT INTO `wp_system_log` VALUES (764, 1, '/backadmin/system.uploadfile/delete?id=320', 'post', '', '{\"id\":\"320\"}', '172.18.0.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616122176);
INSERT INTO `wp_system_log` VALUES (765, 1, '/backadmin/system.uploadfile/delete?id=321', 'post', '', '{\"id\":\"321\"}', '172.18.0.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616122182);
INSERT INTO `wp_system_log` VALUES (766, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"vnfb\",\"keep_login\":\"0\"}', '172.18.0.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616145280);
INSERT INTO `wp_system_log` VALUES (767, NULL, '/backadmin/login/index.html', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"xkkq\",\"keep_login\":\"0\"}', '172.18.0.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1616154691);
INSERT INTO `wp_system_log` VALUES (768, NULL, '/backadmin/login/index?username=manager&password=data123456&captcha=4unp', 'post', '', '{\"username\":\"manager\",\"password\":\"df33ce353f69aa82cd9630439c2238d978edd613\",\"captcha\":\"anaw\",\"keep_login\":\"0\"}', '172.18.0.11', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Mobile Safari/537.36', 1616294438);

-- ----------------------------
-- Table structure for wp_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `wp_system_menu`;
CREATE TABLE `wp_system_menu`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '父id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `href` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int NULL DEFAULT 0 COMMENT '菜单排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态(0:禁用,1:启用)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` int NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title`(`title`) USING BTREE,
  INDEX `href`(`href`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 262 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统菜单表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of wp_system_menu
-- ----------------------------
INSERT INTO `wp_system_menu` VALUES (227, 99999999, '后台首页', 'fa fa-home', 'index/welcome', '', '_self', 0, 1, NULL, NULL, 1573120497, NULL);
INSERT INTO `wp_system_menu` VALUES (228, 0, '系统管理', 'fa fa-cog', '', '', '_self', 0, 1, '', NULL, 1588999529, NULL);
INSERT INTO `wp_system_menu` VALUES (234, 228, '菜单管理', 'fa fa-tree', 'system.menu/index', '', '_self', 10, 1, '', NULL, 1588228555, NULL);
INSERT INTO `wp_system_menu` VALUES (244, 228, '管理员管理', 'fa fa-user', 'system.admin/index', '', '_self', 12, 1, '', 1573185011, 1588228573, NULL);
INSERT INTO `wp_system_menu` VALUES (245, 228, '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', '', '_self', 11, 1, '', 1573435877, 1588228634, NULL);
INSERT INTO `wp_system_menu` VALUES (246, 228, '节点管理', 'fa fa-list', 'system.node/index', '', '_self', 9, 1, '', 1573435919, 1588228648, NULL);
INSERT INTO `wp_system_menu` VALUES (247, 228, '配置管理', 'fa fa-asterisk', 'system.config/index', '', '_self', 8, 1, '', 1573457448, 1588228566, NULL);
INSERT INTO `wp_system_menu` VALUES (248, 228, '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', '', '_self', 0, 1, '', 1573542953, 1588228043, NULL);
INSERT INTO `wp_system_menu` VALUES (249, 0, '商城管理', 'fa fa-list', '', '', '_self', 0, 1, '', 1589439884, 1589439884, NULL);
INSERT INTO `wp_system_menu` VALUES (250, 249, '商品分类', 'fa fa-calendar-check-o', 'mall.cate/index', '', '_self', 0, 1, '', 1589439910, 1589439966, NULL);
INSERT INTO `wp_system_menu` VALUES (251, 249, '商品管理', 'fa fa-list', 'mall.goods/index', '', '_self', 0, 1, '', 1589439931, 1589439942, NULL);
INSERT INTO `wp_system_menu` VALUES (252, 228, '快捷入口', 'fa fa-list', 'system.quick/index', '', '_self', 0, 1, '', 1589623683, 1589623683, NULL);
INSERT INTO `wp_system_menu` VALUES (253, 228, '日志管理', 'fa fa-connectdevelop', 'system.log/index', '', '_self', 0, 1, '', 1589623684, 1589623684, NULL);
INSERT INTO `wp_system_menu` VALUES (261, 0, 'asdfasdf', 'fa fa-list', 'asfasdf', '', '_blank', 0, 1, '', 1616061336, 1616061345, 1616061345);

-- ----------------------------
-- Table structure for wp_system_node
-- ----------------------------
DROP TABLE IF EXISTS `wp_system_node`;
CREATE TABLE `wp_system_node`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `node` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点标题',
  `type` tinyint(1) NULL DEFAULT 3 COMMENT '节点类型（1：控制器，2：节点）',
  `is_auth` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否启动RBAC权限控制',
  `create_time` int NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `node`(`node`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统节点表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of wp_system_node
-- ----------------------------
INSERT INTO `wp_system_node` VALUES (1, 'system.admin', '管理员管理', 1, 1, 1589580432, 1615720465);
INSERT INTO `wp_system_node` VALUES (2, 'system.admin/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (3, 'system.admin/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (4, 'system.admin/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (5, 'system.admin/password', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (6, 'system.admin/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (7, 'system.admin/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (8, 'system.admin/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (9, 'system.auth', '角色权限管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (10, 'system.auth/authorize', '授权', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (11, 'system.auth/saveAuthorize', '授权保存', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (12, 'system.auth/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (13, 'system.auth/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (14, 'system.auth/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (15, 'system.auth/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (16, 'system.auth/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (17, 'system.auth/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (18, 'system.config', '系统配置管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (19, 'system.config/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (20, 'system.config/save', '保存', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (21, 'system.menu', '菜单管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (22, 'system.menu/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (23, 'system.menu/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (24, 'system.menu/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (25, 'system.menu/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (26, 'system.menu/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (27, 'system.menu/getMenuTips', '添加菜单提示', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (28, 'system.menu/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (29, 'system.node', '系统节点管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (30, 'system.node/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (31, 'system.node/refreshNode', '系统节点更新', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (32, 'system.node/clearNode', '清除失效节点', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (33, 'system.node/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (34, 'system.node/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (35, 'system.node/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (36, 'system.node/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (37, 'system.node/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (38, 'system.uploadfile', '上传文件管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (39, 'system.uploadfile/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (40, 'system.uploadfile/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (41, 'system.uploadfile/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (42, 'system.uploadfile/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (43, 'system.uploadfile/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (44, 'system.uploadfile/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (45, 'mall.cate', '商品分类管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (46, 'mall.cate/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (47, 'mall.cate/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (48, 'mall.cate/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (49, 'mall.cate/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (50, 'mall.cate/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (51, 'mall.cate/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (52, 'mall.goods', '商城商品管理', 1, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (53, 'mall.goods/index', '列表', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (54, 'mall.goods/stock', '入库', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (55, 'mall.goods/add', '添加', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (56, 'mall.goods/edit', '编辑', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (57, 'mall.goods/delete', '删除', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (58, 'mall.goods/export', '导出', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (59, 'mall.goods/modify', '属性修改', 2, 1, 1589580432, 1589580432);
INSERT INTO `wp_system_node` VALUES (60, 'system.quick', '快捷入口管理', 1, 1, 1589623188, 1589623188);
INSERT INTO `wp_system_node` VALUES (61, 'system.quick/index', '列表', 2, 1, 1589623188, 1589623188);
INSERT INTO `wp_system_node` VALUES (62, 'system.quick/add', '添加', 2, 1, 1589623188, 1589623188);
INSERT INTO `wp_system_node` VALUES (63, 'system.quick/edit', '编辑', 2, 1, 1589623188, 1589623188);
INSERT INTO `wp_system_node` VALUES (64, 'system.quick/delete', '删除', 2, 1, 1589623188, 1589623188);
INSERT INTO `wp_system_node` VALUES (65, 'system.quick/export', '导出', 2, 1, 1589623188, 1589623188);
INSERT INTO `wp_system_node` VALUES (66, 'system.quick/modify', '属性修改', 2, 1, 1589623188, 1589623188);
INSERT INTO `wp_system_node` VALUES (67, 'system.log', '操作日志管理', 1, 1, 1589623188, 1589623188);
INSERT INTO `wp_system_node` VALUES (68, 'system.log/index', '列表', 2, 1, 1589623188, 1589623188);

-- ----------------------------
-- Table structure for wp_system_quick
-- ----------------------------
DROP TABLE IF EXISTS `wp_system_quick`;
CREATE TABLE `wp_system_quick`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快捷入口名称',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快捷链接',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_time` bigint NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` int NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统快捷入口表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of wp_system_quick
-- ----------------------------
INSERT INTO `wp_system_quick` VALUES (1, '管理员管理', 'fa fa-user', 'system.admin/index', 0, 1, '', 1589624097, 1589624792, NULL);
INSERT INTO `wp_system_quick` VALUES (2, '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', 0, 1, '', 1589624772, 1589624781, NULL);
INSERT INTO `wp_system_quick` VALUES (3, '菜单管理', 'fa fa-tree', 'system.menu/index', 0, 1, NULL, 1589624097, 1589624792, NULL);
INSERT INTO `wp_system_quick` VALUES (6, '节点管理', 'fa fa-list', 'system.node/index', 0, 1, NULL, 1589624772, 1589624781, NULL);
INSERT INTO `wp_system_quick` VALUES (7, '配置管理', 'fa fa-asterisk', 'system.config/index', 0, 1, NULL, 1589624097, 1589624792, NULL);
INSERT INTO `wp_system_quick` VALUES (8, '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', 0, 1, NULL, 1589624772, 1589624781, NULL);
INSERT INTO `wp_system_quick` VALUES (10, '商品分类', 'fa fa-calendar-check-o', 'mall.cate/index', 0, 1, NULL, 1589624097, 1589624792, NULL);
INSERT INTO `wp_system_quick` VALUES (11, '商品管理', 'fa fa-list', 'mall.goods/index', 0, 1, NULL, 9147483647, 1589624781, NULL);

-- ----------------------------
-- Table structure for wp_system_uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `wp_system_uploadfile`;
CREATE TABLE `wp_system_uploadfile`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `upload_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `original_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件原名',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '物理路径',
  `image_width` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '宽度',
  `image_height` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '高度',
  `image_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片类型',
  `image_frames` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片帧数',
  `mime_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'mime类型',
  `file_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `file_ext` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sha1` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` int NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` int NULL DEFAULT NULL COMMENT '更新时间',
  `upload_time` int NULL DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `upload_type`(`upload_type`) USING BTREE,
  INDEX `original_name`(`original_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 324 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '上传文件表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of wp_system_uploadfile
-- ----------------------------
INSERT INTO `wp_system_uploadfile` VALUES (286, 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/0a6de1ac058ee134301501899b84ecb1.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', NULL, NULL, NULL);
INSERT INTO `wp_system_uploadfile` VALUES (287, 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/46d7384f04a3bed331715e86a4095d15.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', NULL, NULL, NULL);
INSERT INTO `wp_system_uploadfile` VALUES (288, 'alioss', 'image/x-icon', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/7d32671f4c1d1b01b0b28f45205763f9.ico', '', '', '', 0, 'image/x-icon', 0, 'ico', '', NULL, NULL, NULL);
INSERT INTO `wp_system_uploadfile` VALUES (289, 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/28cefa547f573a951bcdbbeb1396b06f.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', NULL, NULL, NULL);
INSERT INTO `wp_system_uploadfile` VALUES (290, 'alioss', 'image/jpeg', 'https://lxn-99php.oss-cn-shenzhen.aliyuncs.com/upload/20191111/2c412adf1b30c8be3a913e603c7b6e4a.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', NULL, NULL, NULL);
INSERT INTO `wp_system_uploadfile` VALUES (291, 'alioss', 'timg (1).jpg', 'http://easyadmin.oss-cn-shenzhen.aliyuncs.com/upload/20191113/ff793ced447febfa9ea2d86f9f88fa8e.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1573612437, NULL, NULL);
INSERT INTO `wp_system_uploadfile` VALUES (296, 'txcos', '22243.jpg', 'https://easyadmin-1251997243.cos.ap-guangzhou.myqcloud.com/upload/20191114/2381eaf81208ac188fa994b6f2579953.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1573712153, NULL, NULL);
INSERT INTO `wp_system_uploadfile` VALUES (297, 'local', 'timg.jpg', 'http://admin.host/upload/20200423/5055a273cf8e3f393d699d622b74f247.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1587614155, NULL, NULL);
INSERT INTO `wp_system_uploadfile` VALUES (298, 'local', 'timg.jpg', 'http://admin.host/upload/20200423/243f4e59f1b929951ef79c5f8be7468a.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1587614269, NULL, NULL);
INSERT INTO `wp_system_uploadfile` VALUES (299, 'local', 'head.jpg', 'http://admin.host/upload/20200512/a5ce9883379727324f5686ef61205ce2.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1589255649, NULL, NULL);
INSERT INTO `wp_system_uploadfile` VALUES (300, 'local', '896e5b87c9ca70e4.jpg', 'http://admin.host/upload/20200514/577c65f101639f53dbbc9e7aa346f81c.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1589427798, NULL, NULL);
INSERT INTO `wp_system_uploadfile` VALUES (301, 'local', '896e5b87c9ca70e4.jpg', 'http://admin.host/upload/20200514/98fc09b0c4ad4d793a6f04bef79a0edc.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1589427840, NULL, NULL);
INSERT INTO `wp_system_uploadfile` VALUES (302, 'local', '18811e7611c8f292.jpg', 'http://admin.host/upload/20200514/e1c6c9ef6a4b98b8f7d95a1a0191a2df.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1589438645, NULL, NULL);
INSERT INTO `wp_system_uploadfile` VALUES (316, 'local', '20200823094950_ledoi.jpg', 'http://local.yiishop.cc/upload/20210311/f03acaa09c7bd173570ac79bde62e5f0.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1615453682, NULL, NULL);
INSERT INTO `wp_system_uploadfile` VALUES (317, 'local', 'sdf6678678.jpg', 'http://local.yiishop.cc/upload/20210311/97833aa2b138c5cc3c7e22baadc7dfe0.jpg', '', '', '', 0, 'image/jpeg', 0, 'jpg', '', 1615453682, NULL, NULL);
INSERT INTO `wp_system_uploadfile` VALUES (318, 'local', 'd924385dbf2546b0952874358f2db939!1080x1920.jpeg', 'http://local.yiishop.cc/upload/20210311/cdbf4dd7a07c54986669a1ed7b699699.jpeg', '', '', '', 0, 'image/jpeg', 0, 'jpeg', '', 1615453682, NULL, NULL);
INSERT INTO `wp_system_uploadfile` VALUES (319, 'local', 'chat_593.08597285068px_1309553_easyicon.net.png', 'http://local.tpadmin.cc/upload/20210317/9c9be60c729a254b0313c8a17b849863.png', '', '', '', 0, 'image/png', 0, 'png', '', 1615963649, NULL, NULL);
INSERT INTO `wp_system_uploadfile` VALUES (322, 'local', 'chat_593.08597285068px_1309553_easyicon.net.png', 'http://local.tpadmin.cc/upload/20210317/6160ea28c418278d784be87347a09f18.png', '', '', '', 0, 'image/png', 0, 'png', '', 1615968303, NULL, NULL);
INSERT INTO `wp_system_uploadfile` VALUES (323, 'local', '微信截图_20210313211437.png', 'http://local.tpadmin.cc/upload/20210318/c16922085c0bdbefdf5467443a256ec6.png', '', '', '', 0, 'image/png', 0, 'png', '', 1616032376, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
