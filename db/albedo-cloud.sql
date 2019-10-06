/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : albedo-cloud

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 06/10/2019 18:14:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_scheme
-- ----------------------------
DROP TABLE IF EXISTS `gen_scheme`;
CREATE TABLE `gen_scheme` (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类',
  `view_type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '视图类型 0  普通表格 1  表格采用ajax刷新',
  `package_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '生成表编号',
  `version` int(11) DEFAULT '0' COMMENT '默认0，必填，离线乐观锁',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='生成方案';

-- ----------------------------
-- Records of gen_scheme
-- ----------------------------
BEGIN;
INSERT INTO `gen_scheme` VALUES ('13004483d5e3c02a36035a9e40816527', '测试书籍', 'curd', NULL, 'com.albedo.java.modules', 'test', NULL, '测试书籍', '测试书籍', 'admin', 'f127db413b22862d6e5c366512ff91e3', 2, NULL, '1', '2019-10-06 14:39:46.000', '1', '2019-10-06 14:40:23.542', '0');
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '关联父表外键',
  `version` int(11) DEFAULT '0' COMMENT '默认0，必填，离线乐观锁',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `gen_table_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` VALUES ('12e9426319ca4e1806979ee0d447e80f', 'test_tree_book', '  测试树书', 'TestTreeBook', NULL, NULL, 0, NULL, '1', '2019-10-06 14:40:34.604', '1', '2019-10-06 14:40:34.604', '0');
INSERT INTO `gen_table` VALUES ('f127db413b22862d6e5c366512ff91e3', 'test_book', '测试书籍', 'TestBook', NULL, NULL, 0, NULL, '1', '2019-10-06 14:39:07.022', '1', '2019-10-06 14:39:07.022', '0');
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述备注',
  `jdbc_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` bit(1) DEFAULT NULL COMMENT '是否主键',
  `is_unique` bit(1) DEFAULT NULL COMMENT '是否唯一（1：是；0：否）',
  `is_null` bit(1) DEFAULT NULL COMMENT '是否可为空',
  `is_insert` bit(1) DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` bit(1) DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` bit(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` bit(1) DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `version` int(11) DEFAULT '0' COMMENT '默认0，必填，离线乐观锁',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `gen_table_column_table_id` (`gen_table_id`) USING BTREE,
  KEY `gen_table_column_name` (`name`) USING BTREE,
  KEY `gen_table_column_sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_column` VALUES ('0d92ff9afdcb86dba677c9ee344b3e61', '12e9426319ca4e1806979ee0d447e80f', 'description', '备注', NULL, 'varchar(100)', 'String', 'description', b'0', b'0', b'1', b'1', b'1', b'0', b'0', 'eq', 'textarea', '', NULL, 210, 0, NULL, '1', '2019-10-06 14:40:34.617', '1', '2019-10-06 14:40:34.617', '0');
INSERT INTO `gen_table_column` VALUES ('17f800fc8ee1845602493860f025b38f', '12e9426319ca4e1806979ee0d447e80f', 'leaf', '1 叶子节点 0 非叶子节点', NULL, 'bit(1)', 'Integer', 'leaf', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 60, 0, NULL, '1', '2019-10-06 14:40:34.611', '1', '2019-10-06 14:40:34.611', '0');
INSERT INTO `gen_table_column` VALUES ('1a9d8c1689d512f9210eead95a087aac', '12e9426319ca4e1806979ee0d447e80f', 'parent_ids', '父菜单IDs', NULL, 'varchar(2000)', 'String', 'parentIds', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 30, 0, NULL, '1', '2019-10-06 14:40:34.609', '1', '2019-10-06 14:40:34.609', '0');
INSERT INTO `gen_table_column` VALUES ('297e698c82f58a88137561398a9d530f', '12e9426319ca4e1806979ee0d447e80f', 'sort', '排序', NULL, 'int(11)', 'Long', 'sort', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 50, 0, NULL, '1', '2019-10-06 14:40:34.610', '1', '2019-10-06 14:40:34.610', '0');
INSERT INTO `gen_table_column` VALUES ('2b2d9614e6a97e3e52981d964f87c888', 'f127db413b22862d6e5c366512ff91e3', 'last_modified_date', 'last_modified_date', NULL, 'timestamp(3)', 'java.util.Date', 'lastModifiedDate', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'dateselect', '', NULL, 150, 0, NULL, '1', '2019-10-06 14:39:07.063', '1', '2019-10-06 14:39:07.063', '0');
INSERT INTO `gen_table_column` VALUES ('2dca19fd52d91a032868108252bc070c', 'f127db413b22862d6e5c366512ff91e3', 'money_', 'money_', NULL, 'decimal(20,2)', 'Double', 'money', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 90, 0, NULL, '1', '2019-10-06 14:39:07.057', '1', '2019-10-06 14:39:07.057', '0');
INSERT INTO `gen_table_column` VALUES ('2e0492b07ba47b756128c1e5f998bd28', '12e9426319ca4e1806979ee0d447e80f', 'created_by', 'created_by', NULL, 'varchar(50)', 'String', 'createdBy', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 150, 0, NULL, '1', '2019-10-06 14:40:34.615', '1', '2019-10-06 14:40:34.615', '0');
INSERT INTO `gen_table_column` VALUES ('2f4b9482f1c280b78b487ad7816559b0', '12e9426319ca4e1806979ee0d447e80f', 'reset_date', 'reset_date', NULL, 'timestamp(3)', 'java.util.Date', 'resetDate', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'dateselect', '', NULL, 140, 0, NULL, '1', '2019-10-06 14:40:34.614', '1', '2019-10-06 14:40:34.614', '0');
INSERT INTO `gen_table_column` VALUES ('30cbbd7b13ae27b2545abb1c7b1ec32d', 'f127db413b22862d6e5c366512ff91e3', 'del_flag', '0-正常，1-删除', NULL, 'char(1)', 'String', 'delFlag', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'radio', 'sys_flag', NULL, 180, 0, NULL, '1', '2019-10-06 14:39:07.067', '1', '2019-10-06 14:39:07.067', '0');
INSERT INTO `gen_table_column` VALUES ('46836adc9640dd5d3b372d95aef09bb8', '12e9426319ca4e1806979ee0d447e80f', 'money_', 'money_', NULL, 'decimal(20,2)', 'Double', 'money', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 120, 0, NULL, '1', '2019-10-06 14:40:34.613', '1', '2019-10-06 14:40:34.613', '0');
INSERT INTO `gen_table_column` VALUES ('47bd531a9e582f1dbb04f35836eefc9f', 'f127db413b22862d6e5c366512ff91e3', 'title_', '标题', NULL, 'varchar(32)', 'String', 'title', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 'like', 'input', '', NULL, 20, 0, NULL, '1', '2019-10-06 14:39:07.047', '1', '2019-10-06 14:39:07.047', '0');
INSERT INTO `gen_table_column` VALUES ('4ae7532abdc4227819206e3f5f2b6ca1', 'f127db413b22862d6e5c366512ff91e3', 'name_', '名称', NULL, 'varchar(50)', 'String', 'name', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 'like', 'input', '', NULL, 40, 0, NULL, '1', '2019-10-06 14:39:07.049', '1', '2019-10-06 14:39:07.049', '0');
INSERT INTO `gen_table_column` VALUES ('55d4de06781bf21245f4a451831d8ae0', 'f127db413b22862d6e5c366512ff91e3', 'reset_date', 'reset_date', NULL, 'timestamp(3)', 'java.util.Date', 'resetDate', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'dateselect', '', NULL, 110, 0, NULL, '1', '2019-10-06 14:39:07.059', '1', '2019-10-06 14:39:07.059', '0');
INSERT INTO `gen_table_column` VALUES ('56ecb1e9ec0b077575d0bfbc489711a4', '12e9426319ca4e1806979ee0d447e80f', 'activated_', 'activated_', NULL, 'bit(1)', 'Integer', 'activated', b'0', b'0', b'0', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 100, 0, NULL, '1', '2019-10-06 14:40:34.612', '1', '2019-10-06 14:40:34.612', '0');
INSERT INTO `gen_table_column` VALUES ('5944a5626cf6008189a50a62299fb3ce', 'f127db413b22862d6e5c366512ff91e3', 'phone_', '手机', NULL, 'varchar(32)', 'String', 'phone', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 60, 0, NULL, '1', '2019-10-06 14:39:07.053', '1', '2019-10-06 14:39:07.053', '0');
INSERT INTO `gen_table_column` VALUES ('5c380a2c92a888a63e8c92fda991a7fa', 'f127db413b22862d6e5c366512ff91e3', 'created_by', 'created_by', NULL, 'varchar(50)', 'String', 'createdBy', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 120, 0, NULL, '1', '2019-10-06 14:39:07.060', '1', '2019-10-06 14:39:07.060', '0');
INSERT INTO `gen_table_column` VALUES ('68983b9c5e3b1fe8cbc2af3de274e210', 'f127db413b22862d6e5c366512ff91e3', 'number_', 'key', NULL, 'int(11)', 'Long', 'number', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 80, 0, NULL, '1', '2019-10-06 14:39:07.055', '1', '2019-10-06 14:39:07.055', '0');
INSERT INTO `gen_table_column` VALUES ('73ebbc5e6e7b9afac6bfd0af6a2b4965', 'f127db413b22862d6e5c366512ff91e3', 'email_', '邮箱', NULL, 'varchar(100)', 'String', 'email', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 50, 0, NULL, '1', '2019-10-06 14:39:07.051', '1', '2019-10-06 14:39:07.051', '0');
INSERT INTO `gen_table_column` VALUES ('752ffe9b6c4ebed949cbf817da45f8cc', '12e9426319ca4e1806979ee0d447e80f', 'number_', 'key', NULL, 'int(11)', 'Long', 'number', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 110, 0, NULL, '1', '2019-10-06 14:40:34.613', '1', '2019-10-06 14:40:34.613', '0');
INSERT INTO `gen_table_column` VALUES ('764b89c7b8c04c17e4a75cc5d3c77c67', '12e9426319ca4e1806979ee0d447e80f', 'email_', '邮箱', NULL, 'varchar(100)', 'String', 'email', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 80, 0, NULL, '1', '2019-10-06 14:40:34.612', '1', '2019-10-06 14:40:34.612', '0');
INSERT INTO `gen_table_column` VALUES ('7bcc2a4fe1c62559e40b5895532aba37', 'f127db413b22862d6e5c366512ff91e3', 'author_', '作者', NULL, 'varchar(50)', 'String', 'author', b'0', b'0', b'0', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 30, 0, NULL, '1', '2019-10-06 14:39:07.048', '1', '2019-10-06 14:39:07.048', '0');
INSERT INTO `gen_table_column` VALUES ('7e1aae281fa6ccc5b1b5c6338e39e68b', '12e9426319ca4e1806979ee0d447e80f', 'parent_id', 'parent_id', NULL, 'varchar(32)', 'String', 'parentId', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 20, 0, NULL, '1', '2019-10-06 14:40:34.609', '1', '2019-10-06 14:40:34.609', '0');
INSERT INTO `gen_table_column` VALUES ('828748ac17ce2bc253a0801ff10d516e', 'f127db413b22862d6e5c366512ff91e3', 'activated_', 'activated_', NULL, 'bit(1)', 'Integer', 'activated', b'0', b'0', b'0', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 70, 0, NULL, '1', '2019-10-06 14:39:07.054', '1', '2019-10-06 14:39:07.054', '0');
INSERT INTO `gen_table_column` VALUES ('844e86ac722211c85c79b0df064dbbef', 'f127db413b22862d6e5c366512ff91e3', 'id', 'id', NULL, 'varchar(32)', 'String', 'id', b'1', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 10, 0, NULL, '1', '2019-10-06 14:39:07.044', '1', '2019-10-06 14:39:07.044', '0');
INSERT INTO `gen_table_column` VALUES ('87c827388e95cc33e850edccd1f73ad8', '12e9426319ca4e1806979ee0d447e80f', 'phone_', '手机', NULL, 'varchar(32)', 'String', 'phone', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 90, 0, NULL, '1', '2019-10-06 14:40:34.612', '1', '2019-10-06 14:40:34.612', '0');
INSERT INTO `gen_table_column` VALUES ('883607fbefc81e809d7f407f607641f8', 'f127db413b22862d6e5c366512ff91e3', 'amount_', 'amount_', NULL, 'double(11,2)', 'Double', 'amount', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 100, 0, NULL, '1', '2019-10-06 14:39:07.058', '1', '2019-10-06 14:39:07.058', '0');
INSERT INTO `gen_table_column` VALUES ('8a7e43bac4b69751f46db20133ecbf6f', 'f127db413b22862d6e5c366512ff91e3', 'created_date', 'created_date', NULL, 'timestamp(3)', 'java.util.Date', 'createdDate', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'dateselect', '', NULL, 130, 0, NULL, '1', '2019-10-06 14:39:07.060', '1', '2019-10-06 14:39:07.060', '0');
INSERT INTO `gen_table_column` VALUES ('9238368eefc00eeca9427d50960d75ff', '12e9426319ca4e1806979ee0d447e80f', 'last_modified_by', 'last_modified_by', NULL, 'varchar(50)', 'String', 'lastModifiedBy', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 170, 0, NULL, '1', '2019-10-06 14:40:34.615', '1', '2019-10-06 14:40:34.615', '0');
INSERT INTO `gen_table_column` VALUES ('9d1f5045fa74d4cfee53e89d7a2b6968', '12e9426319ca4e1806979ee0d447e80f', 'id', 'id', NULL, 'varchar(32)', 'String', 'id', b'1', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 10, 0, NULL, '1', '2019-10-06 14:40:34.607', '1', '2019-10-06 14:40:34.607', '0');
INSERT INTO `gen_table_column` VALUES ('9d8a5a54f30644c57446c1d7cb258456', '12e9426319ca4e1806979ee0d447e80f', 'last_modified_date', '修改时间', NULL, 'timestamp(3)', 'java.util.Date', 'lastModifiedDate', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'dateselect', '', NULL, 190, 0, NULL, '1', '2019-10-06 14:40:34.616', '1', '2019-10-06 14:40:34.616', '0');
INSERT INTO `gen_table_column` VALUES ('a5b06eff5bff47a783d41c012172c42c', '12e9426319ca4e1806979ee0d447e80f', 'del_flag', '0-正常，1-删除', NULL, 'char(1)', 'String', 'delFlag', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'radio', 'sys_flag', NULL, 180, 0, NULL, '1', '2019-10-06 14:40:34.616', '1', '2019-10-06 14:40:34.616', '0');
INSERT INTO `gen_table_column` VALUES ('ba856ed7716c0bf24d500232689db6b2', 'f127db413b22862d6e5c366512ff91e3', 'description', '备注', NULL, 'varchar(255)', 'String', 'description', b'0', b'0', b'1', b'1', b'1', b'0', b'0', 'eq', 'textarea', '', NULL, 160, 0, NULL, '1', '2019-10-06 14:39:07.065', '1', '2019-10-06 14:39:07.065', '0');
INSERT INTO `gen_table_column` VALUES ('c3a7c8f676b16abaa0a64d5f2b0d1be9', '12e9426319ca4e1806979ee0d447e80f', 'created_date', '创建时间', NULL, 'timestamp(3)', 'java.util.Date', 'createdDate', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'dateselect', '', NULL, 160, 0, NULL, '1', '2019-10-06 14:40:34.615', '1', '2019-10-06 14:40:34.615', '0');
INSERT INTO `gen_table_column` VALUES ('d29c7cb5b4e6798f663164a161f3cef6', '12e9426319ca4e1806979ee0d447e80f', 'amount_', 'amount_', NULL, 'double(11,2)', 'Double', 'amount', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 130, 0, NULL, '1', '2019-10-06 14:40:34.614', '1', '2019-10-06 14:40:34.614', '0');
INSERT INTO `gen_table_column` VALUES ('db77cb3ffc0daede99bcf03a9d744c7c', 'f127db413b22862d6e5c366512ff91e3', 'last_modified_by', 'last_modified_by', NULL, 'varchar(50)', 'String', 'lastModifiedBy', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 140, 0, NULL, '1', '2019-10-06 14:39:07.061', '1', '2019-10-06 14:39:07.061', '0');
INSERT INTO `gen_table_column` VALUES ('e256f80ea90a8e28f60f02513688fc7c', '12e9426319ca4e1806979ee0d447e80f', 'author_', '作者', NULL, 'varchar(50)', 'String', 'author', b'0', b'0', b'0', b'1', b'1', b'1', b'0', 'eq', 'input', '', NULL, 70, 0, NULL, '1', '2019-10-06 14:40:34.611', '1', '2019-10-06 14:40:34.611', '0');
INSERT INTO `gen_table_column` VALUES ('ec3043722c11e34fa19d9d573895de25', 'f127db413b22862d6e5c366512ff91e3', 'version', 'version', NULL, 'int(11)', 'Long', 'version', b'0', b'0', b'1', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 170, 0, NULL, '1', '2019-10-06 14:39:07.066', '1', '2019-10-06 14:39:07.066', '0');
INSERT INTO `gen_table_column` VALUES ('f464b5f34e3c7881af6a07dfc759ae22', '12e9426319ca4e1806979ee0d447e80f', 'name', '部门名称', NULL, 'varchar(50)', 'String', 'name', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 'like', 'input', '', NULL, 40, 0, NULL, '1', '2019-10-06 14:40:34.610', '1', '2019-10-06 14:40:34.610', '0');
INSERT INTO `gen_table_column` VALUES ('fe2531559aa45c2b3b55bee432a23d50', '12e9426319ca4e1806979ee0d447e80f', 'version', 'version', NULL, 'int(11)', 'Long', 'version', b'0', b'0', b'0', b'1', b'0', b'0', b'0', 'eq', 'input', '', NULL, 200, 0, NULL, '1', '2019-10-06 14:40:34.617', '1', '2019-10-06 14:40:34.617', '0');
COMMIT;

-- ----------------------------
-- Table structure for gen_table_fk
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_fk`;
CREATE TABLE `gen_table_fk` (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否主键',
  `is_unique` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '是否唯一（1：是；0：否）',
  `is_null` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `version` int(11) DEFAULT '0' COMMENT '默认0，必填，离线乐观锁',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `gen_table_column_table_id` (`gen_table_id`) USING BTREE,
  KEY `gen_table_column_name` (`name`) USING BTREE,
  KEY `gen_table_column_sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='业务表字段';

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_cron_triggers` VALUES ('AlbedoScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('AlbedoScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('AlbedoScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_job_details` VALUES ('AlbedoScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.albedo.java.modules.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E616C6265646F2E6A6176612E6D6F64756C65732E71756172747A2E646F6D61696E2E4A6F6200000000000000010200074C0009617661696C61626C657400124C6A6176612F6C616E672F537472696E673B4C000A636F6E63757272656E7471007E00094C000E63726F6E45787072657373696F6E71007E00094C000567726F757071007E00094C000C696E766F6B6554617267657471007E00094C000D6D697366697265506F6C69637971007E00094C00046E616D6571007E000978720032636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E4964456E7469747900000000000000010200014C0002696471007E000978720034636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E44617461456E7469747900000000000000010200064C000963726561746564427971007E00094C000B63726561746564446174657400194C6A6176612F74696D652F4C6F63616C4461746554696D653B4C000B6465736372697074696F6E71007E00094C000E6C6173744D6F646966696564427971007E00094C00106C6173744D6F6469666965644461746571007E000C4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78720034636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E42617365456E7469747900000000000000010200014C000764656C466C616771007E000978720037636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E47656E6572616C456E74697479000000000000000102000078720035636F6D2E62616F6D69646F752E6D796261746973706C75732E657874656E73696F6E2E6163746976657265636F72642E4D6F64656C00000000000000010200007870740001307400007372000D6A6176612E74696D652E536572955D84BA1B2248B20C00007870770A05000007E3080E0A15DB7870740001317371007E0014770E05000007E3080F102B1831A6924078737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000574000131740001307400013174000E302F3130202A202A202A202A203F74000744454641554C5474001573696D706C655461736B2E646F4E6F506172616D7374000133740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897800);
INSERT INTO `qrtz_job_details` VALUES ('AlbedoScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.albedo.java.modules.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E616C6265646F2E6A6176612E6D6F64756C65732E71756172747A2E646F6D61696E2E4A6F6200000000000000010200074C0009617661696C61626C657400124C6A6176612F6C616E672F537472696E673B4C000A636F6E63757272656E7471007E00094C000E63726F6E45787072657373696F6E71007E00094C000567726F757071007E00094C000C696E766F6B6554617267657471007E00094C000D6D697366697265506F6C69637971007E00094C00046E616D6571007E000978720032636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E4964456E7469747900000000000000010200014C0002696471007E000978720034636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E44617461456E7469747900000000000000010200064C000963726561746564427971007E00094C000B63726561746564446174657400194C6A6176612F74696D652F4C6F63616C4461746554696D653B4C000B6465736372697074696F6E71007E00094C000E6C6173744D6F646966696564427971007E00094C00106C6173744D6F6469666965644461746571007E000C4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78720034636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E42617365456E7469747900000000000000010200014C000764656C466C616771007E000978720037636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E47656E6572616C456E74697479000000000000000102000078720035636F6D2E62616F6D69646F752E6D796261746973706C75732E657874656E73696F6E2E6163746976657265636F72642E4D6F64656C00000000000000010200007870740001307400007372000D6A6176612E74696D652E536572955D84BA1B2248B20C00007870770E05000007E3080E0A1524389FD9807870740001317371007E0014770E05000007E30A061033342273948078737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000C74000132740001307400013174000E302F3135202A202A202A202A203F74000744454641554C5474001D73696D706C655461736B2E646F506172616D732827616C6265646F272974000133740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897800);
INSERT INTO `qrtz_job_details` VALUES ('AlbedoScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.albedo.java.modules.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720029636F6D2E616C6265646F2E6A6176612E6D6F64756C65732E71756172747A2E646F6D61696E2E4A6F6200000000000000010200074C0009617661696C61626C657400124C6A6176612F6C616E672F537472696E673B4C000A636F6E63757272656E7471007E00094C000E63726F6E45787072657373696F6E71007E00094C000567726F757071007E00094C000C696E766F6B6554617267657471007E00094C000D6D697366697265506F6C69637971007E00094C00046E616D6571007E000978720032636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E4964456E7469747900000000000000010200014C0002696471007E000978720034636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E44617461456E7469747900000000000000010200064C000963726561746564427971007E00094C000B63726561746564446174657400194C6A6176612F74696D652F4C6F63616C4461746554696D653B4C000B6465736372697074696F6E71007E00094C000E6C6173744D6F646966696564427971007E00094C00106C6173744D6F6469666965644461746571007E000C4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78720034636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E42617365456E7469747900000000000000010200014C000764656C466C616771007E000978720037636F6D2E616C6265646F2E6A6176612E636F6D6D6F6E2E70657273697374656E63652E646F6D61696E2E47656E6572616C456E74697479000000000000000102000078720035636F6D2E62616F6D69646F752E6D796261746973706C75732E657874656E73696F6E2E6163746976657265636F72642E4D6F64656C00000000000000010200007870740001307400007372000D6A6176612E74696D652E536572955D84BA1B2248B20C00007870770A05000007E3080E0A15DB7870740001317371007E0014770E05000007E3080F102B161DDCA74078737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000374000133740001307400013174000E302F3230202A202A202A202A203F74000744454641554C5474004073696D706C655461736B2E646F4D756C7469706C65506172616D732827616C6265646F272C20747275652C20323030304C2C203331362E3530442C203130302974000133740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC897800);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_locks` VALUES ('AlbedoScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('AlbedoScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_scheduler_state` VALUES ('AlbedoScheduler', 'somewheredeMBP1570355468971', 1570356833745, 15000);
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-CHC8CQ91565759389736', 1565759603030, 15000);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_triggers` VALUES ('AlbedoScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1570355470000, -1, 5, 'PAUSED', 'CRON', 1570355469000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('AlbedoScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1570355475000, -1, 5, 'PAUSED', 'CRON', 1570355469000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('AlbedoScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1570355480000, -1, 5, 'PAUSED', 'CRON', 1570355469000, 0, NULL, 2, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父菜单IDs',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `leaf` bit(1) DEFAULT b'0' COMMENT '1 叶子节点 0 非叶子节点',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
  `version` int(11) NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES ('1', '-1', NULL, '山东农信', NULL, b'0', '', '2018-01-22 19:00:23.000', NULL, '2019-07-04 16:57:18.000', 0, '', '0');
INSERT INTO `sys_dept` VALUES ('10', '8', NULL, '院校沙县', NULL, b'0', '', '2018-12-10 21:19:26.000', NULL, '2019-06-15 10:56:41.000', 0, '', '0');
INSERT INTO `sys_dept` VALUES ('2', '-1', NULL, '沙县国际', NULL, b'0', '', '2018-01-22 19:00:38.000', NULL, '2019-07-04 16:57:22.000', 0, '', '0');
INSERT INTO `sys_dept` VALUES ('3', '1', NULL, '潍坊农信', NULL, b'0', '', '2018-01-22 19:00:44.000', NULL, '2019-06-15 10:56:41.000', 0, '', '0');
INSERT INTO `sys_dept` VALUES ('4', '3', NULL, '高新农信', 30, b'0', '', '2018-01-22 19:00:52.000', '1', '2019-07-14 09:02:57.000', 6, '', '0');
INSERT INTO `sys_dept` VALUES ('5', '4', NULL, '院校农信', 30, b'0', '', '2018-01-22 19:00:57.000', '1', '2019-07-14 09:10:44.000', 1, '', '0');
INSERT INTO `sys_dept` VALUES ('5f86e2a82b040b1f618aefc62f403024', '5', '5,', '11', 1, b'1', '1', '2019-07-14 09:10:45.000', '1', '2019-07-14 09:10:57.000', 0, NULL, '1');
INSERT INTO `sys_dept` VALUES ('6', '5', NULL, '潍院农信', NULL, b'0', '', '2018-01-22 19:01:06.000', NULL, '2019-01-09 10:58:18.000', 0, '', '0');
INSERT INTO `sys_dept` VALUES ('7', '2', NULL, '山东沙县', NULL, b'0', '', '2018-01-22 19:01:57.000', NULL, '2019-06-15 10:56:41.000', 0, '', '0');
INSERT INTO `sys_dept` VALUES ('8', '7', NULL, '潍坊沙县', NULL, b'0', '', '2018-01-22 19:02:03.000', NULL, '2019-06-15 10:56:41.000', 0, '', '0');
INSERT INTO `sys_dept` VALUES ('9', '8', NULL, '高新沙县', NULL, b'0', '', '2018-01-22 19:02:14.000', NULL, '2018-09-13 01:46:44.000', 0, '', '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_relation`;
CREATE TABLE `sys_dept_relation` (
  `ancestor` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '祖先节点',
  `descendant` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '后代节点',
  PRIMARY KEY (`ancestor`,`descendant`) USING BTREE,
  KEY `idx1` (`ancestor`) USING BTREE,
  KEY `idx2` (`descendant`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='部门关系表';

-- ----------------------------
-- Records of sys_dept_relation
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept_relation` VALUES ('1', '1');
INSERT INTO `sys_dept_relation` VALUES ('1', '3');
INSERT INTO `sys_dept_relation` VALUES ('1', '4');
INSERT INTO `sys_dept_relation` VALUES ('1', '5');
INSERT INTO `sys_dept_relation` VALUES ('10', '10');
INSERT INTO `sys_dept_relation` VALUES ('11', '11');
INSERT INTO `sys_dept_relation` VALUES ('2', '11');
INSERT INTO `sys_dept_relation` VALUES ('2', '2');
INSERT INTO `sys_dept_relation` VALUES ('2', '7');
INSERT INTO `sys_dept_relation` VALUES ('2', '8');
INSERT INTO `sys_dept_relation` VALUES ('3', '3');
INSERT INTO `sys_dept_relation` VALUES ('3', '4');
INSERT INTO `sys_dept_relation` VALUES ('3', '5');
INSERT INTO `sys_dept_relation` VALUES ('4', '4');
INSERT INTO `sys_dept_relation` VALUES ('4', '5');
INSERT INTO `sys_dept_relation` VALUES ('5', '5');
INSERT INTO `sys_dept_relation` VALUES ('7', '11');
INSERT INTO `sys_dept_relation` VALUES ('7', '7');
INSERT INTO `sys_dept_relation` VALUES ('7', '8');
INSERT INTO `sys_dept_relation` VALUES ('8', '11');
INSERT INTO `sys_dept_relation` VALUES ('8', '8');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名',
  `val` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据值',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父菜单ID',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父菜单IDs',
  `sort` int(10) NOT NULL COMMENT '排序（升序）',
  `show` bit(1) DEFAULT NULL COMMENT '是否显示1 是0否',
  `leaf` bit(1) DEFAULT b'0' COMMENT '1 叶子节点 0 非叶子节点',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注信息',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_modified_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  `version` int(11) NOT NULL DEFAULT '0',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_dict_value` (`val`) USING BTREE,
  KEY `sys_dict_label` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES ('05d01334ecdbe94b856038a32a42512b', '任务分组', NULL, 'sys_job_group', 'cfd5f62f601817a3b0f38f5ccb1f5128', '1,cfd5f62f601817a3b0f38f5ccb1f5128,', 30, b'1', b'0', NULL, '1', '2019-08-15 16:33:54.745', '1', '2019-08-15 16:34:47.136', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('0b2420638683f1eec41242beb9912069', '在线', 'on_line', 'sys_online_status_on_line', 'f3592a047c466e348279983336ebaf28', '1,cfd5f62f601817a3b0f38f5ccb1f5128,f3592a047c466e348279983336ebaf28,', 30, b'1', b'1', NULL, '1', '2019-08-11 11:17:28.210', '1', '2019-08-11 11:17:28.210', 0, NULL, '0');
INSERT INTO `sys_dict` VALUES ('0da02abef85f0c0b4350eaeefb4ca78d', '仅本人数据', '4', 'sys_data_scope_4', 'aa294a48211a2deb5c7d76c5e90dc28e', '1,cfd5f62f601817a3b0f38f5ccb1f5128,aa294a48211a2deb5c7d76c5e90dc28e,', 40, b'1', b'1', NULL, '1', '2019-07-14 06:00:03.000', '1', '2019-08-09 11:26:04.724', 5, NULL, '0');
INSERT INTO `sys_dict` VALUES ('0ef7242f2bb88fdbdcbc56e7a879efb0', '其他', '0', 'sys_business_type_0', 'e0696db908c87ad57a85c6b326348dbd', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e0696db908c87ad57a85c6b326348dbd,', 10, b'1', b'1', NULL, '1', '2019-08-07 16:49:39.000', '1', '2019-08-09 11:26:04.726', 3, NULL, '0');
INSERT INTO `sys_dict` VALUES ('0fdd548394368b4969136f32c435fd98', '按钮', '1', 'sys_menu_type_1', 'e26ee931e276a099fb876541ca18756f', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e26ee931e276a099fb876541ca18756f,', 20, b'1', b'1', NULL, '1', '2019-07-14 06:04:44.000', '1', '2019-08-09 11:26:04.726', 4, NULL, '0');
INSERT INTO `sys_dict` VALUES ('1', '数据字典', '', 'base', '-1', NULL, 1, b'1', b'0', '', '1', '2018-07-09 06:16:14.000', '1', '2019-10-06 16:53:06.999', 12, '', '0');
INSERT INTO `sys_dict` VALUES ('13276f100593667c3bd40ab8fea734b4', '立即执行', '1', 'sys_misfire_policy_1', 'cb3d07975904460c94e9e2b30755c04b', '1,cfd5f62f601817a3b0f38f5ccb1f5128,cb3d07975904460c94e9e2b30755c04b,', 30, b'1', b'1', NULL, '1', '2019-08-15 10:24:19.706', '1', '2019-08-15 10:24:19.706', 0, NULL, '0');
INSERT INTO `sys_dict` VALUES ('181dd29afa852bd47a5ae8dd2e02a623', '正常', '1', 'sys_status_1', '952c07b027bf0be298a9243af701b8c5', '1,cfd5f62f601817a3b0f38f5ccb1f5128,952c07b027bf0be298a9243af701b8c5,', 30, b'1', b'1', NULL, '1', '2019-08-14 11:28:01.693', '1', '2019-08-15 09:08:45.451', 0, NULL, '0');
INSERT INTO `sys_dict` VALUES ('2', '是否标识', '', 'sys_flag', 'cfd5f62f601817a3b0f38f5ccb1f5128', '1,cfd5f62f601817a3b0f38f5ccb1f5128,', 10, b'1', b'0', NULL, '1', '2019-06-02 17:17:44.000', '1', '2019-08-09 11:26:04.727', 17, NULL, '0');
INSERT INTO `sys_dict` VALUES ('269ebbfff898cf1db0d243e3f7774d2c', '业务数据', 'biz', 'biz', '1', '1,', 30, b'1', b'1', NULL, '1', '2019-07-14 04:01:51.000', '1', '2019-10-06 16:53:07.026', 5, NULL, '0');
INSERT INTO `sys_dict` VALUES ('2ec9dffe7cb0dea12c8e4e2a90279711', '强退', '6', 'sys_business_type_6', 'e0696db908c87ad57a85c6b326348dbd', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e0696db908c87ad57a85c6b326348dbd,', 70, b'1', b'1', NULL, '1', '2019-08-07 16:52:15.681', '1', '2019-08-09 11:26:04.727', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('3', '是', '1', 'sys_flag_yes', '2', '1,cfd5f62f601817a3b0f38f5ccb1f5128,2,', 10, b'1', b'1', '', '1', '2018-07-09 06:15:40.000', '1', '2019-08-09 11:26:04.728', 5, '', '0');
INSERT INTO `sys_dict` VALUES ('31d677b181cebb9bde79b78f32e1e8a3', '其他', '0', 'sys_operate_type_0', '6b8211aef2fec451b0398b19857443a7', '1,cfd5f62f601817a3b0f38f5ccb1f5128,6b8211aef2fec451b0398b19857443a7,', 10, b'1', b'1', NULL, '1', '2019-08-07 16:48:21.644', '1', '2019-08-09 11:26:04.730', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('3e949b67e0c5be3357bdcce9705f7433', '放弃执行', '3', 'sys_misfire_policy_3', 'cb3d07975904460c94e9e2b30755c04b', '1,cfd5f62f601817a3b0f38f5ccb1f5128,cb3d07975904460c94e9e2b30755c04b,', 30, b'1', b'1', NULL, '1', '2019-08-15 10:24:54.175', '1', '2019-08-15 10:24:54.175', 0, NULL, '0');
INSERT INTO `sys_dict` VALUES ('4', '否', '0', 'sys_flag_no', '2', '1,cfd5f62f601817a3b0f38f5ccb1f5128,2,', 30, b'1', b'1', NULL, '1', '2019-06-02 17:26:40.000', '1', '2019-08-09 11:26:04.732', 6, NULL, '0');
INSERT INTO `sys_dict` VALUES ('4198b5e10fe052546ebb689b4103590e', '所在机构数据', '3', 'sys_data_scope_3', 'aa294a48211a2deb5c7d76c5e90dc28e', '1,cfd5f62f601817a3b0f38f5ccb1f5128,aa294a48211a2deb5c7d76c5e90dc28e,', 30, b'1', b'1', NULL, '1', '2019-07-14 05:59:13.000', '1', '2019-08-09 11:26:04.733', 7, NULL, '0');
INSERT INTO `sys_dict` VALUES ('4ebd555fb352328cb2db93e15d3243ad', '系统', 'SYSTEM', 'sys_job_group_system', '05d01334ecdbe94b856038a32a42512b', '1,cfd5f62f601817a3b0f38f5ccb1f5128,05d01334ecdbe94b856038a32a42512b,', 30, b'1', b'1', NULL, '1', '2019-08-15 16:34:47.139', '1', '2019-08-15 16:34:47.139', 0, NULL, '0');
INSERT INTO `sys_dict` VALUES ('51828811168cd9f0ee1d118068a7d0b9', '编辑', '1', 'sys_business_type_1', 'e0696db908c87ad57a85c6b326348dbd', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e0696db908c87ad57a85c6b326348dbd,', 20, b'1', b'1', NULL, '1', '2019-08-07 16:50:20.634', '1', '2019-08-09 11:26:04.733', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('5933a853cd0199b00424d66f4b92dda3', '所在机构及以下数据', '2', 'sys_data_scope_2', 'aa294a48211a2deb5c7d76c5e90dc28e', '1,cfd5f62f601817a3b0f38f5ccb1f5128,aa294a48211a2deb5c7d76c5e90dc28e,', 20, b'1', b'1', NULL, '1', '2019-07-14 05:53:55.000', '1', '2019-08-09 11:26:04.734', 7, NULL, '0');
INSERT INTO `sys_dict` VALUES ('5f2414b2670c9a66c1d5364613caa654', '后台用户', '1', 'sys_operate_type_1', '6b8211aef2fec451b0398b19857443a7', '1,cfd5f62f601817a3b0f38f5ccb1f5128,6b8211aef2fec451b0398b19857443a7,', 20, b'1', b'1', NULL, '1', '2019-08-07 16:48:40.344', '1', '2019-08-09 11:26:04.734', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('6b8211aef2fec451b0398b19857443a7', '操作人类别', NULL, 'sys_operator_type', 'cfd5f62f601817a3b0f38f5ccb1f5128', '1,cfd5f62f601817a3b0f38f5ccb1f5128,', 30, b'1', b'0', NULL, '1', '2019-08-07 15:37:09.613', '1', '2019-08-09 11:26:04.734', 6, NULL, '0');
INSERT INTO `sys_dict` VALUES ('6e4bba74f32df9149d69f8e9bb19cd9d', '菜单', '0', 'sys_menu_type_0', 'e26ee931e276a099fb876541ca18756f', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e26ee931e276a099fb876541ca18756f,', 10, b'1', b'1', NULL, '1', '2019-07-14 06:04:10.000', '1', '2019-08-09 11:26:04.736', 4, NULL, '0');
INSERT INTO `sys_dict` VALUES ('764d1eaf8a39698fc85a7204c96e7089', '生成代码', '7', 'sys_business_type_7', 'e0696db908c87ad57a85c6b326348dbd', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e0696db908c87ad57a85c6b326348dbd,', 80, b'1', b'1', NULL, '1', '2019-08-07 16:52:36.997', '1', '2019-08-09 11:26:04.739', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('80b084e162b0a30b348a45ff29e5b326', '导出', '4', 'sys_business_type_4', 'e0696db908c87ad57a85c6b326348dbd', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e0696db908c87ad57a85c6b326348dbd,', 50, b'1', b'1', NULL, '1', '2019-08-07 16:51:33.286', '1', '2019-08-09 11:26:04.739', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('8153bd2af73b6d59eed9f34d2bc05bb9', '删除', '3', 'sys_business_type_3', 'e0696db908c87ad57a85c6b326348dbd', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e0696db908c87ad57a85c6b326348dbd,', 40, b'1', b'1', NULL, '1', '2019-08-07 16:50:45.270', '1', '2019-08-09 11:26:04.740', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('8883abe4dcf9390df69a5740050abf74', '离线', 'off_line', 'sys_online_status_off_line', 'f3592a047c466e348279983336ebaf28', '1,cfd5f62f601817a3b0f38f5ccb1f5128,f3592a047c466e348279983336ebaf28,', 30, b'1', b'1', NULL, '1', '2019-08-11 11:17:50.132', '1', '2019-08-11 11:17:50.132', 0, NULL, '0');
INSERT INTO `sys_dict` VALUES ('8c4589d0a32c9b84b6254507354a195b', 'test', 'test', 'test', '-1', NULL, 30, b'1', b'1', NULL, '1', '2019-07-14 03:59:38.000', '1', '2019-07-14 04:00:28.000', 0, NULL, '1');
INSERT INTO `sys_dict` VALUES ('94e00baf14b640d793c133fb7bfa4c9a', '默认', 'DEFAULT', 'sys_job_group_default', '05d01334ecdbe94b856038a32a42512b', '1,cfd5f62f601817a3b0f38f5ccb1f5128,05d01334ecdbe94b856038a32a42512b,', 30, b'1', b'1', NULL, '1', '2019-08-15 16:34:28.547', '1', '2019-08-15 16:34:28.547', 0, NULL, '0');
INSERT INTO `sys_dict` VALUES ('952c07b027bf0be298a9243af701b8c5', '状态', NULL, 'sys_status', 'cfd5f62f601817a3b0f38f5ccb1f5128', '1,cfd5f62f601817a3b0f38f5ccb1f5128,', 30, b'1', b'0', NULL, '1', '2019-08-14 11:26:50.424', '1', '2019-08-15 09:09:12.239', 3, NULL, '0');
INSERT INTO `sys_dict` VALUES ('a5dfce34bdb7aa99560e8c0d393a632f', '全部', '1', 'sys_data_scope_1', 'aa294a48211a2deb5c7d76c5e90dc28e', '1,cfd5f62f601817a3b0f38f5ccb1f5128,aa294a48211a2deb5c7d76c5e90dc28e,', 10, b'1', b'1', NULL, '1', '2019-07-14 05:52:44.000', '1', '2019-08-09 11:26:04.740', 7, NULL, '0');
INSERT INTO `sys_dict` VALUES ('aa294a48211a2deb5c7d76c5e90dc28e', '数据范围', '', 'sys_data_scope', 'cfd5f62f601817a3b0f38f5ccb1f5128', '1,cfd5f62f601817a3b0f38f5ccb1f5128,', 30, b'1', b'0', NULL, '1', '2019-07-14 05:50:08.000', '1', '2019-08-09 11:26:04.741', 16, NULL, '0');
INSERT INTO `sys_dict` VALUES ('b672448a74c1d1a47eb1378e3d8c6dc9', '导入', '5', 'sys_business_type_5', 'e0696db908c87ad57a85c6b326348dbd', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e0696db908c87ad57a85c6b326348dbd,', 60, b'1', b'1', NULL, '1', '2019-08-07 16:51:45.855', '1', '2019-08-09 11:26:04.741', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('c46ec99af2c1f967bf10cf2c0d96a6c5', '按明细设置', '5', 'sys_data_scope_5', 'aa294a48211a2deb5c7d76c5e90dc28e', '1,cfd5f62f601817a3b0f38f5ccb1f5128,aa294a48211a2deb5c7d76c5e90dc28e,', 50, b'1', b'1', NULL, '1', '2019-07-14 06:01:11.000', '1', '2019-08-09 11:26:04.741', 5, NULL, '0');
INSERT INTO `sys_dict` VALUES ('cb3d07975904460c94e9e2b30755c04b', '计划执行错误策略', NULL, 'sys_misfire_policy', 'cfd5f62f601817a3b0f38f5ccb1f5128', '1,cfd5f62f601817a3b0f38f5ccb1f5128,', 30, b'1', b'0', NULL, '1', '2019-08-15 10:23:54.460', '1', '2019-08-15 10:24:54.169', 3, NULL, '0');
INSERT INTO `sys_dict` VALUES ('cfd5f62f601817a3b0f38f5ccb1f5128', '系统数据', 'sys', 'sys', '1', '1,', 30, b'1', b'0', NULL, '1', '2019-07-14 01:13:12.000', '1', '2019-08-15 16:33:54.741', 22, NULL, '0');
INSERT INTO `sys_dict` VALUES ('e0696db908c87ad57a85c6b326348dbd', '业务操作类型', NULL, 'sys_business_type', 'cfd5f62f601817a3b0f38f5ccb1f5128', '1,cfd5f62f601817a3b0f38f5ccb1f5128,', 30, b'1', b'0', NULL, '1', '2019-08-07 15:33:35.000', '1', '2019-08-09 11:26:04.742', 17, NULL, '0');
INSERT INTO `sys_dict` VALUES ('e26ee931e276a099fb876541ca18756f', '菜单类型', '', 'sys_menu_type', 'cfd5f62f601817a3b0f38f5ccb1f5128', '1,cfd5f62f601817a3b0f38f5ccb1f5128,', 30, b'1', b'0', NULL, '1', '2019-07-14 06:01:48.000', '1', '2019-08-09 11:26:04.744', 8, NULL, '0');
INSERT INTO `sys_dict` VALUES ('e7891a6351a2e143899849b2955851b2', '锁定', '2', 'sys_business_type_2', 'e0696db908c87ad57a85c6b326348dbd', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e0696db908c87ad57a85c6b326348dbd,', 30, b'1', b'1', NULL, '1', '2019-08-07 16:50:32.457', '1', '2019-08-09 11:26:04.746', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('ef0368c6fd52ee8f1f4270869da00f18', 'tab按钮', '2', 'sys_menu_type_2', 'e26ee931e276a099fb876541ca18756f', '1,cfd5f62f601817a3b0f38f5ccb1f5128,e26ee931e276a099fb876541ca18756f,', 30, b'1', b'1', NULL, '1', '2019-08-07 13:55:24.531', '1', '2019-08-09 11:26:04.746', 4, NULL, '0');
INSERT INTO `sys_dict` VALUES ('f3592a047c466e348279983336ebaf28', '在线状态', NULL, 'sys_online_status', 'cfd5f62f601817a3b0f38f5ccb1f5128', '1,cfd5f62f601817a3b0f38f5ccb1f5128,', 30, b'1', b'0', NULL, '1', '2019-08-11 11:16:52.095', '1', '2019-08-11 11:17:50.128', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('f35adf75d9ab0ca5cec43815b7db5274', '执行一次', '2', 'sys_misfire_policy_2', 'cb3d07975904460c94e9e2b30755c04b', '1,cfd5f62f601817a3b0f38f5ccb1f5128,cb3d07975904460c94e9e2b30755c04b,', 30, b'1', b'1', NULL, '1', '2019-08-15 10:24:39.273', '1', '2019-08-15 10:24:39.273', 0, NULL, '0');
INSERT INTO `sys_dict` VALUES ('f83a718756762758707c67db3d271c9d', '手机端用户', '2', 'sys_operate_type_2', '6b8211aef2fec451b0398b19857443a7', '1,cfd5f62f601817a3b0f38f5ccb1f5128,6b8211aef2fec451b0398b19857443a7,', 30, b'1', b'1', NULL, '1', '2019-08-07 16:49:00.766', '1', '2019-08-09 11:26:04.746', 2, NULL, '0');
INSERT INTO `sys_dict` VALUES ('fafe8843b2f4091f8096dc0df09c300c', '失败', '0', 'sys_status_0', '952c07b027bf0be298a9243af701b8c5', '1,cfd5f62f601817a3b0f38f5ccb1f5128,952c07b027bf0be298a9243af701b8c5,', 30, b'1', b'1', NULL, '1', '2019-08-14 11:28:11.000', '1', '2019-08-15 09:08:49.884', 1, NULL, '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '是否并发执行（1允许 0禁止）',
  `available` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态(1-正常，0-锁定)',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_modified_date` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3),
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `version` int(11) NOT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'simpleTask.doNoParams', '0/10 * * * * ?', '3', '1', '0', '', '2019-08-14 10:21:36.000', '1', '2019-08-15 16:43:24.833', NULL, 5, '0');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '0/15 * * * * ?', '3', '1', '0', '', '2019-08-14 10:21:36.950', '1', '2019-10-06 16:51:52.578', NULL, 12, '0');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'simpleTask.doMultipleParams(\'albedo\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '0', '', '2019-08-14 10:21:36.000', '1', '2019-08-15 16:43:22.501', NULL, 3, '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `start_time` datetime(3) DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(3) DEFAULT NULL COMMENT '结束时间',
  `create_time` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '异常信息',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1330 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_job_log` VALUES (655, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：5毫秒', '1', '2019-10-06 14:02:20.282', '2019-10-06 14:02:20.287', '2019-10-06 14:02:20.287', '', NULL);
INSERT INTO `sys_job_log` VALUES (656, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:02:30.092', '2019-10-06 14:02:30.092', '2019-10-06 14:02:30.092', '', NULL);
INSERT INTO `sys_job_log` VALUES (657, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:02:45.070', '2019-10-06 14:02:45.070', '2019-10-06 14:02:45.070', '', NULL);
INSERT INTO `sys_job_log` VALUES (658, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:03:00.085', '2019-10-06 14:03:00.085', '2019-10-06 14:03:00.085', '', NULL);
INSERT INTO `sys_job_log` VALUES (659, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:03:15.078', '2019-10-06 14:03:15.078', '2019-10-06 14:03:15.078', '', NULL);
INSERT INTO `sys_job_log` VALUES (660, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:03:30.143', '2019-10-06 14:03:30.143', '2019-10-06 14:03:30.143', '', NULL);
INSERT INTO `sys_job_log` VALUES (661, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:03:45.068', '2019-10-06 14:03:45.068', '2019-10-06 14:03:45.068', '', NULL);
INSERT INTO `sys_job_log` VALUES (662, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:04:00.107', '2019-10-06 14:04:00.107', '2019-10-06 14:04:00.107', '', NULL);
INSERT INTO `sys_job_log` VALUES (663, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:04:15.053', '2019-10-06 14:04:15.053', '2019-10-06 14:04:15.053', '', NULL);
INSERT INTO `sys_job_log` VALUES (664, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:04:30.113', '2019-10-06 14:04:30.114', '2019-10-06 14:04:30.114', '', NULL);
INSERT INTO `sys_job_log` VALUES (665, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:04:45.095', '2019-10-06 14:04:45.096', '2019-10-06 14:04:45.096', '', NULL);
INSERT INTO `sys_job_log` VALUES (666, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:05:00.017', '2019-10-06 14:05:00.017', '2019-10-06 14:05:00.017', '', NULL);
INSERT INTO `sys_job_log` VALUES (667, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:05:15.028', '2019-10-06 14:05:15.029', '2019-10-06 14:05:15.029', '', NULL);
INSERT INTO `sys_job_log` VALUES (668, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:05:30.080', '2019-10-06 14:05:30.080', '2019-10-06 14:05:30.080', '', NULL);
INSERT INTO `sys_job_log` VALUES (669, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:05:45.110', '2019-10-06 14:05:45.110', '2019-10-06 14:05:45.110', '', NULL);
INSERT INTO `sys_job_log` VALUES (670, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:06:00.093', '2019-10-06 14:06:00.093', '2019-10-06 14:06:00.093', '', NULL);
INSERT INTO `sys_job_log` VALUES (671, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:06:15.158', '2019-10-06 14:06:15.158', '2019-10-06 14:06:15.158', '', NULL);
INSERT INTO `sys_job_log` VALUES (672, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:06:30.130', '2019-10-06 14:06:30.130', '2019-10-06 14:06:30.130', '', NULL);
INSERT INTO `sys_job_log` VALUES (673, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:06:45.059', '2019-10-06 14:06:45.059', '2019-10-06 14:06:45.059', '', NULL);
INSERT INTO `sys_job_log` VALUES (674, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:07:00.104', '2019-10-06 14:07:00.105', '2019-10-06 14:07:00.105', '', NULL);
INSERT INTO `sys_job_log` VALUES (675, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:07:15.188', '2019-10-06 14:07:15.188', '2019-10-06 14:07:15.188', '', NULL);
INSERT INTO `sys_job_log` VALUES (676, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:07:30.047', '2019-10-06 14:07:30.047', '2019-10-06 14:07:30.047', '', NULL);
INSERT INTO `sys_job_log` VALUES (677, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:07:45.120', '2019-10-06 14:07:45.120', '2019-10-06 14:07:45.120', '', NULL);
INSERT INTO `sys_job_log` VALUES (678, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:08:00.035', '2019-10-06 14:08:00.035', '2019-10-06 14:08:00.035', '', NULL);
INSERT INTO `sys_job_log` VALUES (679, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:08:15.046', '2019-10-06 14:08:15.046', '2019-10-06 14:08:15.046', '', NULL);
INSERT INTO `sys_job_log` VALUES (680, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:08:30.030', '2019-10-06 14:08:30.030', '2019-10-06 14:08:30.030', '', NULL);
INSERT INTO `sys_job_log` VALUES (681, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:08:45.034', '2019-10-06 14:08:45.034', '2019-10-06 14:08:45.034', '', NULL);
INSERT INTO `sys_job_log` VALUES (682, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:09:00.066', '2019-10-06 14:09:00.066', '2019-10-06 14:09:00.066', '', NULL);
INSERT INTO `sys_job_log` VALUES (683, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:09:15.100', '2019-10-06 14:09:15.100', '2019-10-06 14:09:15.100', '', NULL);
INSERT INTO `sys_job_log` VALUES (684, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:09:30.198', '2019-10-06 14:09:30.198', '2019-10-06 14:09:30.198', '', NULL);
INSERT INTO `sys_job_log` VALUES (685, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:09:45.065', '2019-10-06 14:09:45.065', '2019-10-06 14:09:45.065', '', NULL);
INSERT INTO `sys_job_log` VALUES (686, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:10:00.135', '2019-10-06 14:10:00.135', '2019-10-06 14:10:00.135', '', NULL);
INSERT INTO `sys_job_log` VALUES (687, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:10:15.138', '2019-10-06 14:10:15.138', '2019-10-06 14:10:15.138', '', NULL);
INSERT INTO `sys_job_log` VALUES (688, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:10:30.138', '2019-10-06 14:10:30.138', '2019-10-06 14:10:30.138', '', NULL);
INSERT INTO `sys_job_log` VALUES (689, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:10:45.170', '2019-10-06 14:10:45.170', '2019-10-06 14:10:45.170', '', NULL);
INSERT INTO `sys_job_log` VALUES (690, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:11:00.058', '2019-10-06 14:11:00.058', '2019-10-06 14:11:00.058', '', NULL);
INSERT INTO `sys_job_log` VALUES (691, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:11:15.100', '2019-10-06 14:11:15.100', '2019-10-06 14:11:15.100', '', NULL);
INSERT INTO `sys_job_log` VALUES (692, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:11:30.064', '2019-10-06 14:11:30.064', '2019-10-06 14:11:30.064', '', NULL);
INSERT INTO `sys_job_log` VALUES (693, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:11:45.098', '2019-10-06 14:11:45.098', '2019-10-06 14:11:45.098', '', NULL);
INSERT INTO `sys_job_log` VALUES (694, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:12:00.091', '2019-10-06 14:12:00.091', '2019-10-06 14:12:00.091', '', NULL);
INSERT INTO `sys_job_log` VALUES (695, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:12:15.020', '2019-10-06 14:12:15.020', '2019-10-06 14:12:15.020', '', NULL);
INSERT INTO `sys_job_log` VALUES (696, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:12:30.049', '2019-10-06 14:12:30.049', '2019-10-06 14:12:30.049', '', NULL);
INSERT INTO `sys_job_log` VALUES (697, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:12:45.070', '2019-10-06 14:12:45.070', '2019-10-06 14:12:45.070', '', NULL);
INSERT INTO `sys_job_log` VALUES (698, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:13:00.111', '2019-10-06 14:13:00.112', '2019-10-06 14:13:00.112', '', NULL);
INSERT INTO `sys_job_log` VALUES (699, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:13:15.050', '2019-10-06 14:13:15.050', '2019-10-06 14:13:15.050', '', NULL);
INSERT INTO `sys_job_log` VALUES (700, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:13:30.096', '2019-10-06 14:13:30.096', '2019-10-06 14:13:30.096', '', NULL);
INSERT INTO `sys_job_log` VALUES (701, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:13:45.046', '2019-10-06 14:13:45.046', '2019-10-06 14:13:45.046', '', NULL);
INSERT INTO `sys_job_log` VALUES (702, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:14:00.070', '2019-10-06 14:14:00.070', '2019-10-06 14:14:00.070', '', NULL);
INSERT INTO `sys_job_log` VALUES (703, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:14:15.049', '2019-10-06 14:14:15.049', '2019-10-06 14:14:15.049', '', NULL);
INSERT INTO `sys_job_log` VALUES (704, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:14:30.071', '2019-10-06 14:14:30.072', '2019-10-06 14:14:30.072', '', NULL);
INSERT INTO `sys_job_log` VALUES (705, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:14:45.022', '2019-10-06 14:14:45.022', '2019-10-06 14:14:45.022', '', NULL);
INSERT INTO `sys_job_log` VALUES (706, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:15:00.080', '2019-10-06 14:15:00.080', '2019-10-06 14:15:00.080', '', NULL);
INSERT INTO `sys_job_log` VALUES (707, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:15:15.073', '2019-10-06 14:15:15.073', '2019-10-06 14:15:15.073', '', NULL);
INSERT INTO `sys_job_log` VALUES (708, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:15:30.108', '2019-10-06 14:15:30.108', '2019-10-06 14:15:30.108', '', NULL);
INSERT INTO `sys_job_log` VALUES (709, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:15:45.046', '2019-10-06 14:15:45.046', '2019-10-06 14:15:45.046', '', NULL);
INSERT INTO `sys_job_log` VALUES (710, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:16:00.051', '2019-10-06 14:16:00.051', '2019-10-06 14:16:00.051', '', NULL);
INSERT INTO `sys_job_log` VALUES (711, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:16:15.085', '2019-10-06 14:16:15.085', '2019-10-06 14:16:15.085', '', NULL);
INSERT INTO `sys_job_log` VALUES (712, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:16:30.040', '2019-10-06 14:16:30.040', '2019-10-06 14:16:30.040', '', NULL);
INSERT INTO `sys_job_log` VALUES (713, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:16:45.122', '2019-10-06 14:16:45.122', '2019-10-06 14:16:45.122', '', NULL);
INSERT INTO `sys_job_log` VALUES (714, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:17:00.068', '2019-10-06 14:17:00.068', '2019-10-06 14:17:00.068', '', NULL);
INSERT INTO `sys_job_log` VALUES (715, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:17:15.075', '2019-10-06 14:17:15.075', '2019-10-06 14:17:15.075', '', NULL);
INSERT INTO `sys_job_log` VALUES (716, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:17:30.026', '2019-10-06 14:17:30.027', '2019-10-06 14:17:30.027', '', NULL);
INSERT INTO `sys_job_log` VALUES (717, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:17:45.062', '2019-10-06 14:17:45.062', '2019-10-06 14:17:45.062', '', NULL);
INSERT INTO `sys_job_log` VALUES (718, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:18:00.074', '2019-10-06 14:18:00.074', '2019-10-06 14:18:00.074', '', NULL);
INSERT INTO `sys_job_log` VALUES (719, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:18:15.027', '2019-10-06 14:18:15.027', '2019-10-06 14:18:15.027', '', NULL);
INSERT INTO `sys_job_log` VALUES (720, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:18:30.027', '2019-10-06 14:18:30.027', '2019-10-06 14:18:30.027', '', NULL);
INSERT INTO `sys_job_log` VALUES (721, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:18:45.092', '2019-10-06 14:18:45.092', '2019-10-06 14:18:45.092', '', NULL);
INSERT INTO `sys_job_log` VALUES (722, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:19:00.096', '2019-10-06 14:19:00.097', '2019-10-06 14:19:00.097', '', NULL);
INSERT INTO `sys_job_log` VALUES (723, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:19:15.031', '2019-10-06 14:19:15.031', '2019-10-06 14:19:15.031', '', NULL);
INSERT INTO `sys_job_log` VALUES (724, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:19:30.111', '2019-10-06 14:19:30.111', '2019-10-06 14:19:30.111', '', NULL);
INSERT INTO `sys_job_log` VALUES (725, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:19:45.117', '2019-10-06 14:19:45.117', '2019-10-06 14:19:45.117', '', NULL);
INSERT INTO `sys_job_log` VALUES (726, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:20:00.008', '2019-10-06 14:20:00.008', '2019-10-06 14:20:00.008', '', NULL);
INSERT INTO `sys_job_log` VALUES (727, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:20:15.032', '2019-10-06 14:20:15.032', '2019-10-06 14:20:15.032', '', NULL);
INSERT INTO `sys_job_log` VALUES (728, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:20:30.075', '2019-10-06 14:20:30.075', '2019-10-06 14:20:30.075', '', NULL);
INSERT INTO `sys_job_log` VALUES (729, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:20:45.019', '2019-10-06 14:20:45.019', '2019-10-06 14:20:45.019', '', NULL);
INSERT INTO `sys_job_log` VALUES (730, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:21:00.112', '2019-10-06 14:21:00.112', '2019-10-06 14:21:00.112', '', NULL);
INSERT INTO `sys_job_log` VALUES (731, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:21:15.114', '2019-10-06 14:21:15.114', '2019-10-06 14:21:15.114', '', NULL);
INSERT INTO `sys_job_log` VALUES (732, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:21:30.038', '2019-10-06 14:21:30.038', '2019-10-06 14:21:30.038', '', NULL);
INSERT INTO `sys_job_log` VALUES (733, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:21:45.037', '2019-10-06 14:21:45.037', '2019-10-06 14:21:45.037', '', NULL);
INSERT INTO `sys_job_log` VALUES (734, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:22:00.013', '2019-10-06 14:22:00.013', '2019-10-06 14:22:00.013', '', NULL);
INSERT INTO `sys_job_log` VALUES (735, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:22:15.120', '2019-10-06 14:22:15.121', '2019-10-06 14:22:15.121', '', NULL);
INSERT INTO `sys_job_log` VALUES (736, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:22:30.063', '2019-10-06 14:22:30.063', '2019-10-06 14:22:30.063', '', NULL);
INSERT INTO `sys_job_log` VALUES (737, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:22:45.029', '2019-10-06 14:22:45.030', '2019-10-06 14:22:45.030', '', NULL);
INSERT INTO `sys_job_log` VALUES (738, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:23:00.112', '2019-10-06 14:23:00.112', '2019-10-06 14:23:00.112', '', NULL);
INSERT INTO `sys_job_log` VALUES (739, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:23:15.093', '2019-10-06 14:23:15.093', '2019-10-06 14:23:15.093', '', NULL);
INSERT INTO `sys_job_log` VALUES (740, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:23:30.040', '2019-10-06 14:23:30.040', '2019-10-06 14:23:30.040', '', NULL);
INSERT INTO `sys_job_log` VALUES (741, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:23:45.044', '2019-10-06 14:23:45.044', '2019-10-06 14:23:45.044', '', NULL);
INSERT INTO `sys_job_log` VALUES (742, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:24:00.088', '2019-10-06 14:24:00.088', '2019-10-06 14:24:00.088', '', NULL);
INSERT INTO `sys_job_log` VALUES (743, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:24:15.097', '2019-10-06 14:24:15.097', '2019-10-06 14:24:15.097', '', NULL);
INSERT INTO `sys_job_log` VALUES (744, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:24:30.026', '2019-10-06 14:24:30.027', '2019-10-06 14:24:30.027', '', NULL);
INSERT INTO `sys_job_log` VALUES (745, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:24:45.097', '2019-10-06 14:24:45.097', '2019-10-06 14:24:45.097', '', NULL);
INSERT INTO `sys_job_log` VALUES (746, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:25:00.107', '2019-10-06 14:25:00.107', '2019-10-06 14:25:00.107', '', NULL);
INSERT INTO `sys_job_log` VALUES (747, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:25:15.096', '2019-10-06 14:25:15.096', '2019-10-06 14:25:15.096', '', NULL);
INSERT INTO `sys_job_log` VALUES (748, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:25:30.084', '2019-10-06 14:25:30.084', '2019-10-06 14:25:30.084', '', NULL);
INSERT INTO `sys_job_log` VALUES (749, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:25:45.084', '2019-10-06 14:25:45.084', '2019-10-06 14:25:45.084', '', NULL);
INSERT INTO `sys_job_log` VALUES (750, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:26:00.112', '2019-10-06 14:26:00.112', '2019-10-06 14:26:00.112', '', NULL);
INSERT INTO `sys_job_log` VALUES (751, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:26:15.053', '2019-10-06 14:26:15.054', '2019-10-06 14:26:15.054', '', NULL);
INSERT INTO `sys_job_log` VALUES (752, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:26:30.095', '2019-10-06 14:26:30.095', '2019-10-06 14:26:30.095', '', NULL);
INSERT INTO `sys_job_log` VALUES (753, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:26:45.017', '2019-10-06 14:26:45.017', '2019-10-06 14:26:45.017', '', NULL);
INSERT INTO `sys_job_log` VALUES (754, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:27:00.022', '2019-10-06 14:27:00.022', '2019-10-06 14:27:00.022', '', NULL);
INSERT INTO `sys_job_log` VALUES (755, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:27:15.050', '2019-10-06 14:27:15.050', '2019-10-06 14:27:15.050', '', NULL);
INSERT INTO `sys_job_log` VALUES (756, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:27:30.023', '2019-10-06 14:27:30.023', '2019-10-06 14:27:30.023', '', NULL);
INSERT INTO `sys_job_log` VALUES (757, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:27:45.097', '2019-10-06 14:27:45.097', '2019-10-06 14:27:45.097', '', NULL);
INSERT INTO `sys_job_log` VALUES (758, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:28:00.046', '2019-10-06 14:28:00.046', '2019-10-06 14:28:00.046', '', NULL);
INSERT INTO `sys_job_log` VALUES (759, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:28:15.092', '2019-10-06 14:28:15.092', '2019-10-06 14:28:15.092', '', NULL);
INSERT INTO `sys_job_log` VALUES (760, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:28:30.038', '2019-10-06 14:28:30.038', '2019-10-06 14:28:30.038', '', NULL);
INSERT INTO `sys_job_log` VALUES (761, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:28:45.114', '2019-10-06 14:28:45.114', '2019-10-06 14:28:45.114', '', NULL);
INSERT INTO `sys_job_log` VALUES (762, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:29:00.074', '2019-10-06 14:29:00.074', '2019-10-06 14:29:00.074', '', NULL);
INSERT INTO `sys_job_log` VALUES (763, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:29:15.013', '2019-10-06 14:29:15.013', '2019-10-06 14:29:15.013', '', NULL);
INSERT INTO `sys_job_log` VALUES (764, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:29:30.054', '2019-10-06 14:29:30.054', '2019-10-06 14:29:30.054', '', NULL);
INSERT INTO `sys_job_log` VALUES (765, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:29:45.039', '2019-10-06 14:29:45.040', '2019-10-06 14:29:45.040', '', NULL);
INSERT INTO `sys_job_log` VALUES (766, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:30:00.037', '2019-10-06 14:30:00.038', '2019-10-06 14:30:00.038', '', NULL);
INSERT INTO `sys_job_log` VALUES (767, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:30:15.059', '2019-10-06 14:30:15.059', '2019-10-06 14:30:15.059', '', NULL);
INSERT INTO `sys_job_log` VALUES (768, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:30:30.045', '2019-10-06 14:30:30.045', '2019-10-06 14:30:30.045', '', NULL);
INSERT INTO `sys_job_log` VALUES (769, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:30:45.068', '2019-10-06 14:30:45.068', '2019-10-06 14:30:45.068', '', NULL);
INSERT INTO `sys_job_log` VALUES (770, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:31:00.014', '2019-10-06 14:31:00.014', '2019-10-06 14:31:00.014', '', NULL);
INSERT INTO `sys_job_log` VALUES (771, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:31:15.026', '2019-10-06 14:31:15.026', '2019-10-06 14:31:15.026', '', NULL);
INSERT INTO `sys_job_log` VALUES (772, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:31:30.112', '2019-10-06 14:31:30.113', '2019-10-06 14:31:30.113', '', NULL);
INSERT INTO `sys_job_log` VALUES (773, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:31:45.052', '2019-10-06 14:31:45.052', '2019-10-06 14:31:45.052', '', NULL);
INSERT INTO `sys_job_log` VALUES (774, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:32:00.018', '2019-10-06 14:32:00.018', '2019-10-06 14:32:00.018', '', NULL);
INSERT INTO `sys_job_log` VALUES (775, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:32:15.085', '2019-10-06 14:32:15.085', '2019-10-06 14:32:15.085', '', NULL);
INSERT INTO `sys_job_log` VALUES (776, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:32:30.031', '2019-10-06 14:32:30.031', '2019-10-06 14:32:30.031', '', NULL);
INSERT INTO `sys_job_log` VALUES (777, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:32:45.060', '2019-10-06 14:32:45.060', '2019-10-06 14:32:45.060', '', NULL);
INSERT INTO `sys_job_log` VALUES (778, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:33:00.057', '2019-10-06 14:33:00.058', '2019-10-06 14:33:00.058', '', NULL);
INSERT INTO `sys_job_log` VALUES (779, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:33:15.121', '2019-10-06 14:33:15.121', '2019-10-06 14:33:15.121', '', NULL);
INSERT INTO `sys_job_log` VALUES (780, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:33:30.033', '2019-10-06 14:33:30.033', '2019-10-06 14:33:30.033', '', NULL);
INSERT INTO `sys_job_log` VALUES (781, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:33:45.091', '2019-10-06 14:33:45.091', '2019-10-06 14:33:45.091', '', NULL);
INSERT INTO `sys_job_log` VALUES (782, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:34:00.125', '2019-10-06 14:34:00.125', '2019-10-06 14:34:00.125', '', NULL);
INSERT INTO `sys_job_log` VALUES (783, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:34:15.081', '2019-10-06 14:34:15.081', '2019-10-06 14:34:15.081', '', NULL);
INSERT INTO `sys_job_log` VALUES (784, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:34:30.046', '2019-10-06 14:34:30.046', '2019-10-06 14:34:30.046', '', NULL);
INSERT INTO `sys_job_log` VALUES (785, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:34:45.182', '2019-10-06 14:34:45.183', '2019-10-06 14:34:45.183', '', NULL);
INSERT INTO `sys_job_log` VALUES (786, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:35:00.033', '2019-10-06 14:35:00.033', '2019-10-06 14:35:00.033', '', NULL);
INSERT INTO `sys_job_log` VALUES (787, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:35:15.046', '2019-10-06 14:35:15.046', '2019-10-06 14:35:15.046', '', NULL);
INSERT INTO `sys_job_log` VALUES (788, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:35:30.018', '2019-10-06 14:35:30.019', '2019-10-06 14:35:30.019', '', NULL);
INSERT INTO `sys_job_log` VALUES (789, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:35:45.009', '2019-10-06 14:35:45.009', '2019-10-06 14:35:45.009', '', NULL);
INSERT INTO `sys_job_log` VALUES (790, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:36:00.041', '2019-10-06 14:36:00.041', '2019-10-06 14:36:00.041', '', NULL);
INSERT INTO `sys_job_log` VALUES (791, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:36:15.073', '2019-10-06 14:36:15.073', '2019-10-06 14:36:15.073', '', NULL);
INSERT INTO `sys_job_log` VALUES (792, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:36:30.101', '2019-10-06 14:36:30.102', '2019-10-06 14:36:30.102', '', NULL);
INSERT INTO `sys_job_log` VALUES (793, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:36:45.051', '2019-10-06 14:36:45.051', '2019-10-06 14:36:45.051', '', NULL);
INSERT INTO `sys_job_log` VALUES (794, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:37:00.022', '2019-10-06 14:37:00.023', '2019-10-06 14:37:00.023', '', NULL);
INSERT INTO `sys_job_log` VALUES (795, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:37:15.097', '2019-10-06 14:37:15.098', '2019-10-06 14:37:15.098', '', NULL);
INSERT INTO `sys_job_log` VALUES (796, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:37:30.072', '2019-10-06 14:37:30.072', '2019-10-06 14:37:30.072', '', NULL);
INSERT INTO `sys_job_log` VALUES (797, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:37:45.105', '2019-10-06 14:37:45.105', '2019-10-06 14:37:45.105', '', NULL);
INSERT INTO `sys_job_log` VALUES (798, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:38:00.044', '2019-10-06 14:38:00.044', '2019-10-06 14:38:00.044', '', NULL);
INSERT INTO `sys_job_log` VALUES (799, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:38:15.062', '2019-10-06 14:38:15.062', '2019-10-06 14:38:15.062', '', NULL);
INSERT INTO `sys_job_log` VALUES (800, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:38:30.038', '2019-10-06 14:38:30.039', '2019-10-06 14:38:30.039', '', NULL);
INSERT INTO `sys_job_log` VALUES (801, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:38:45.106', '2019-10-06 14:38:45.106', '2019-10-06 14:38:45.106', '', NULL);
INSERT INTO `sys_job_log` VALUES (802, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:39:00.156', '2019-10-06 14:39:00.156', '2019-10-06 14:39:00.156', '', NULL);
INSERT INTO `sys_job_log` VALUES (803, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:39:15.018', '2019-10-06 14:39:15.018', '2019-10-06 14:39:15.018', '', NULL);
INSERT INTO `sys_job_log` VALUES (804, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:39:30.080', '2019-10-06 14:39:30.080', '2019-10-06 14:39:30.080', '', NULL);
INSERT INTO `sys_job_log` VALUES (805, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:39:45.031', '2019-10-06 14:39:45.031', '2019-10-06 14:39:45.031', '', NULL);
INSERT INTO `sys_job_log` VALUES (806, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:40:00.082', '2019-10-06 14:40:00.082', '2019-10-06 14:40:00.082', '', NULL);
INSERT INTO `sys_job_log` VALUES (807, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:40:15.062', '2019-10-06 14:40:15.062', '2019-10-06 14:40:15.062', '', NULL);
INSERT INTO `sys_job_log` VALUES (808, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:40:30.016', '2019-10-06 14:40:30.016', '2019-10-06 14:40:30.016', '', NULL);
INSERT INTO `sys_job_log` VALUES (809, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:40:45.046', '2019-10-06 14:40:45.046', '2019-10-06 14:40:45.046', '', NULL);
INSERT INTO `sys_job_log` VALUES (810, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:41:00.087', '2019-10-06 14:41:00.087', '2019-10-06 14:41:00.087', '', NULL);
INSERT INTO `sys_job_log` VALUES (811, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:41:15.063', '2019-10-06 14:41:15.063', '2019-10-06 14:41:15.063', '', NULL);
INSERT INTO `sys_job_log` VALUES (812, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:41:30.031', '2019-10-06 14:41:30.031', '2019-10-06 14:41:30.031', '', NULL);
INSERT INTO `sys_job_log` VALUES (813, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:41:45.080', '2019-10-06 14:41:45.080', '2019-10-06 14:41:45.080', '', NULL);
INSERT INTO `sys_job_log` VALUES (814, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:42:00.038', '2019-10-06 14:42:00.038', '2019-10-06 14:42:00.038', '', NULL);
INSERT INTO `sys_job_log` VALUES (815, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:42:15.191', '2019-10-06 14:42:15.191', '2019-10-06 14:42:15.191', '', NULL);
INSERT INTO `sys_job_log` VALUES (816, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:42:30.043', '2019-10-06 14:42:30.043', '2019-10-06 14:42:30.043', '', NULL);
INSERT INTO `sys_job_log` VALUES (817, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:42:45.107', '2019-10-06 14:42:45.108', '2019-10-06 14:42:45.108', '', NULL);
INSERT INTO `sys_job_log` VALUES (818, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:43:00.082', '2019-10-06 14:43:00.082', '2019-10-06 14:43:00.082', '', NULL);
INSERT INTO `sys_job_log` VALUES (819, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:43:15.053', '2019-10-06 14:43:15.053', '2019-10-06 14:43:15.053', '', NULL);
INSERT INTO `sys_job_log` VALUES (820, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:43:30.060', '2019-10-06 14:43:30.060', '2019-10-06 14:43:30.060', '', NULL);
INSERT INTO `sys_job_log` VALUES (821, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:43:45.103', '2019-10-06 14:43:45.103', '2019-10-06 14:43:45.103', '', NULL);
INSERT INTO `sys_job_log` VALUES (822, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:44:00.044', '2019-10-06 14:44:00.045', '2019-10-06 14:44:00.045', '', NULL);
INSERT INTO `sys_job_log` VALUES (823, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:44:15.110', '2019-10-06 14:44:15.110', '2019-10-06 14:44:15.110', '', NULL);
INSERT INTO `sys_job_log` VALUES (824, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:44:30.177', '2019-10-06 14:44:30.177', '2019-10-06 14:44:30.177', '', NULL);
INSERT INTO `sys_job_log` VALUES (825, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:44:45.094', '2019-10-06 14:44:45.094', '2019-10-06 14:44:45.094', '', NULL);
INSERT INTO `sys_job_log` VALUES (826, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:45:00.102', '2019-10-06 14:45:00.102', '2019-10-06 14:45:00.102', '', NULL);
INSERT INTO `sys_job_log` VALUES (827, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:45:15.138', '2019-10-06 14:45:15.138', '2019-10-06 14:45:15.138', '', NULL);
INSERT INTO `sys_job_log` VALUES (828, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:45:30.400', '2019-10-06 14:45:30.400', '2019-10-06 14:45:30.400', '', NULL);
INSERT INTO `sys_job_log` VALUES (829, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:45:57.219', '2019-10-06 14:45:57.219', '2019-10-06 14:45:57.219', '', NULL);
INSERT INTO `sys_job_log` VALUES (830, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:46:02.923', '2019-10-06 14:46:02.923', '2019-10-06 14:46:02.923', '', NULL);
INSERT INTO `sys_job_log` VALUES (831, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:47:03.452', '2019-10-06 14:47:03.452', '2019-10-06 14:47:03.452', '', NULL);
INSERT INTO `sys_job_log` VALUES (832, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：4毫秒', '1', '2019-10-06 14:47:10.279', '2019-10-06 14:47:10.283', '2019-10-06 14:47:10.283', '', NULL);
INSERT INTO `sys_job_log` VALUES (833, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:47:28.721', '2019-10-06 14:47:28.721', '2019-10-06 14:47:28.721', '', NULL);
INSERT INTO `sys_job_log` VALUES (834, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:48:02.324', '2019-10-06 14:48:02.324', '2019-10-06 14:48:02.324', '', NULL);
INSERT INTO `sys_job_log` VALUES (835, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:48:15.722', '2019-10-06 14:48:15.722', '2019-10-06 14:48:15.723', '', NULL);
INSERT INTO `sys_job_log` VALUES (836, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:48:30.383', '2019-10-06 14:48:30.383', '2019-10-06 14:48:30.383', '', NULL);
INSERT INTO `sys_job_log` VALUES (837, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:48:45.191', '2019-10-06 14:48:45.192', '2019-10-06 14:48:45.192', '', NULL);
INSERT INTO `sys_job_log` VALUES (838, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:49:00.263', '2019-10-06 14:49:00.263', '2019-10-06 14:49:00.263', '', NULL);
INSERT INTO `sys_job_log` VALUES (839, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:49:15.015', '2019-10-06 14:49:15.015', '2019-10-06 14:49:15.015', '', NULL);
INSERT INTO `sys_job_log` VALUES (840, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:49:30.095', '2019-10-06 14:49:30.095', '2019-10-06 14:49:30.095', '', NULL);
INSERT INTO `sys_job_log` VALUES (841, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:49:45.221', '2019-10-06 14:49:45.221', '2019-10-06 14:49:45.221', '', NULL);
INSERT INTO `sys_job_log` VALUES (842, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:50:00.019', '2019-10-06 14:50:00.020', '2019-10-06 14:50:00.020', '', NULL);
INSERT INTO `sys_job_log` VALUES (843, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:50:15.076', '2019-10-06 14:50:15.077', '2019-10-06 14:50:15.077', '', NULL);
INSERT INTO `sys_job_log` VALUES (844, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:50:30.135', '2019-10-06 14:50:30.135', '2019-10-06 14:50:30.135', '', NULL);
INSERT INTO `sys_job_log` VALUES (845, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 14:50:45.071', '2019-10-06 14:50:45.073', '2019-10-06 14:50:45.073', '', NULL);
INSERT INTO `sys_job_log` VALUES (846, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:51:00.042', '2019-10-06 14:51:00.043', '2019-10-06 14:51:00.043', '', NULL);
INSERT INTO `sys_job_log` VALUES (847, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 14:51:15.103', '2019-10-06 14:51:15.105', '2019-10-06 14:51:15.105', '', NULL);
INSERT INTO `sys_job_log` VALUES (848, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:51:30.059', '2019-10-06 14:51:30.059', '2019-10-06 14:51:30.059', '', NULL);
INSERT INTO `sys_job_log` VALUES (849, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 14:51:45.105', '2019-10-06 14:51:45.107', '2019-10-06 14:51:45.107', '', NULL);
INSERT INTO `sys_job_log` VALUES (850, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:52:00.040', '2019-10-06 14:52:00.040', '2019-10-06 14:52:00.040', '', NULL);
INSERT INTO `sys_job_log` VALUES (851, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:52:15.079', '2019-10-06 14:52:15.079', '2019-10-06 14:52:15.079', '', NULL);
INSERT INTO `sys_job_log` VALUES (852, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:52:30.022', '2019-10-06 14:52:30.022', '2019-10-06 14:52:30.022', '', NULL);
INSERT INTO `sys_job_log` VALUES (853, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:52:45.061', '2019-10-06 14:52:45.061', '2019-10-06 14:52:45.061', '', NULL);
INSERT INTO `sys_job_log` VALUES (854, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:53:00.082', '2019-10-06 14:53:00.082', '2019-10-06 14:53:00.082', '', NULL);
INSERT INTO `sys_job_log` VALUES (855, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:53:15.086', '2019-10-06 14:53:15.086', '2019-10-06 14:53:15.086', '', NULL);
INSERT INTO `sys_job_log` VALUES (856, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:53:30.023', '2019-10-06 14:53:30.023', '2019-10-06 14:53:30.023', '', NULL);
INSERT INTO `sys_job_log` VALUES (857, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:53:45.038', '2019-10-06 14:53:45.038', '2019-10-06 14:53:45.038', '', NULL);
INSERT INTO `sys_job_log` VALUES (858, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:54:00.079', '2019-10-06 14:54:00.080', '2019-10-06 14:54:00.080', '', NULL);
INSERT INTO `sys_job_log` VALUES (859, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:54:15.040', '2019-10-06 14:54:15.040', '2019-10-06 14:54:15.040', '', NULL);
INSERT INTO `sys_job_log` VALUES (860, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:54:30.142', '2019-10-06 14:54:30.143', '2019-10-06 14:54:30.143', '', NULL);
INSERT INTO `sys_job_log` VALUES (861, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:54:45.095', '2019-10-06 14:54:45.096', '2019-10-06 14:54:45.096', '', NULL);
INSERT INTO `sys_job_log` VALUES (862, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:55:00.045', '2019-10-06 14:55:00.045', '2019-10-06 14:55:00.045', '', NULL);
INSERT INTO `sys_job_log` VALUES (863, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 14:55:15.011', '2019-10-06 14:55:15.013', '2019-10-06 14:55:15.013', '', NULL);
INSERT INTO `sys_job_log` VALUES (864, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:55:30.056', '2019-10-06 14:55:30.056', '2019-10-06 14:55:30.056', '', NULL);
INSERT INTO `sys_job_log` VALUES (865, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:55:45.114', '2019-10-06 14:55:45.114', '2019-10-06 14:55:45.114', '', NULL);
INSERT INTO `sys_job_log` VALUES (866, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:56:00.089', '2019-10-06 14:56:00.090', '2019-10-06 14:56:00.090', '', NULL);
INSERT INTO `sys_job_log` VALUES (867, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:56:15.104', '2019-10-06 14:56:15.104', '2019-10-06 14:56:15.104', '', NULL);
INSERT INTO `sys_job_log` VALUES (868, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:56:30.099', '2019-10-06 14:56:30.099', '2019-10-06 14:56:30.099', '', NULL);
INSERT INTO `sys_job_log` VALUES (869, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:56:45.115', '2019-10-06 14:56:45.115', '2019-10-06 14:56:45.115', '', NULL);
INSERT INTO `sys_job_log` VALUES (870, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:57:00.052', '2019-10-06 14:57:00.052', '2019-10-06 14:57:00.052', '', NULL);
INSERT INTO `sys_job_log` VALUES (871, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:57:15.110', '2019-10-06 14:57:15.110', '2019-10-06 14:57:15.110', '', NULL);
INSERT INTO `sys_job_log` VALUES (872, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:57:30.064', '2019-10-06 14:57:30.064', '2019-10-06 14:57:30.064', '', NULL);
INSERT INTO `sys_job_log` VALUES (873, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:57:45.232', '2019-10-06 14:57:45.232', '2019-10-06 14:57:45.232', '', NULL);
INSERT INTO `sys_job_log` VALUES (874, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:58:00.042', '2019-10-06 14:58:00.043', '2019-10-06 14:58:00.043', '', NULL);
INSERT INTO `sys_job_log` VALUES (875, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:58:15.060', '2019-10-06 14:58:15.060', '2019-10-06 14:58:15.060', '', NULL);
INSERT INTO `sys_job_log` VALUES (876, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:58:30.080', '2019-10-06 14:58:30.081', '2019-10-06 14:58:30.081', '', NULL);
INSERT INTO `sys_job_log` VALUES (877, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:58:45.016', '2019-10-06 14:58:45.016', '2019-10-06 14:58:45.016', '', NULL);
INSERT INTO `sys_job_log` VALUES (878, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:59:00.037', '2019-10-06 14:59:00.037', '2019-10-06 14:59:00.037', '', NULL);
INSERT INTO `sys_job_log` VALUES (879, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:59:15.091', '2019-10-06 14:59:15.092', '2019-10-06 14:59:15.092', '', NULL);
INSERT INTO `sys_job_log` VALUES (880, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 14:59:30.065', '2019-10-06 14:59:30.065', '2019-10-06 14:59:30.065', '', NULL);
INSERT INTO `sys_job_log` VALUES (881, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 14:59:45.138', '2019-10-06 14:59:45.139', '2019-10-06 14:59:45.139', '', NULL);
INSERT INTO `sys_job_log` VALUES (882, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:00:00.035', '2019-10-06 15:00:00.036', '2019-10-06 15:00:00.036', '', NULL);
INSERT INTO `sys_job_log` VALUES (883, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:00:15.114', '2019-10-06 15:00:15.115', '2019-10-06 15:00:15.115', '', NULL);
INSERT INTO `sys_job_log` VALUES (884, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:00:30.103', '2019-10-06 15:00:30.103', '2019-10-06 15:00:30.103', '', NULL);
INSERT INTO `sys_job_log` VALUES (885, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:00:45.177', '2019-10-06 15:00:45.178', '2019-10-06 15:00:45.178', '', NULL);
INSERT INTO `sys_job_log` VALUES (886, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:01:00.086', '2019-10-06 15:01:00.086', '2019-10-06 15:01:00.086', '', NULL);
INSERT INTO `sys_job_log` VALUES (887, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:01:15.110', '2019-10-06 15:01:15.110', '2019-10-06 15:01:15.110', '', NULL);
INSERT INTO `sys_job_log` VALUES (888, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:01:30.020', '2019-10-06 15:01:30.020', '2019-10-06 15:01:30.020', '', NULL);
INSERT INTO `sys_job_log` VALUES (889, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:01:45.073', '2019-10-06 15:01:45.073', '2019-10-06 15:01:45.073', '', NULL);
INSERT INTO `sys_job_log` VALUES (890, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:02:00.053', '2019-10-06 15:02:00.053', '2019-10-06 15:02:00.053', '', NULL);
INSERT INTO `sys_job_log` VALUES (891, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:02:15.117', '2019-10-06 15:02:15.117', '2019-10-06 15:02:15.117', '', NULL);
INSERT INTO `sys_job_log` VALUES (892, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:02:30.055', '2019-10-06 15:02:30.055', '2019-10-06 15:02:30.055', '', NULL);
INSERT INTO `sys_job_log` VALUES (893, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:02:45.102', '2019-10-06 15:02:45.102', '2019-10-06 15:02:45.102', '', NULL);
INSERT INTO `sys_job_log` VALUES (894, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:03:00.047', '2019-10-06 15:03:00.047', '2019-10-06 15:03:00.047', '', NULL);
INSERT INTO `sys_job_log` VALUES (895, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:03:15.112', '2019-10-06 15:03:15.112', '2019-10-06 15:03:15.112', '', NULL);
INSERT INTO `sys_job_log` VALUES (896, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:03:30.084', '2019-10-06 15:03:30.084', '2019-10-06 15:03:30.084', '', NULL);
INSERT INTO `sys_job_log` VALUES (897, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:03:45.017', '2019-10-06 15:03:45.017', '2019-10-06 15:03:45.017', '', NULL);
INSERT INTO `sys_job_log` VALUES (898, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:04:00.088', '2019-10-06 15:04:00.088', '2019-10-06 15:04:00.088', '', NULL);
INSERT INTO `sys_job_log` VALUES (899, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:04:15.038', '2019-10-06 15:04:15.039', '2019-10-06 15:04:15.039', '', NULL);
INSERT INTO `sys_job_log` VALUES (900, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:04:30.195', '2019-10-06 15:04:30.196', '2019-10-06 15:04:30.196', '', NULL);
INSERT INTO `sys_job_log` VALUES (901, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:04:45.102', '2019-10-06 15:04:45.102', '2019-10-06 15:04:45.102', '', NULL);
INSERT INTO `sys_job_log` VALUES (902, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:05:00.054', '2019-10-06 15:05:00.054', '2019-10-06 15:05:00.054', '', NULL);
INSERT INTO `sys_job_log` VALUES (903, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:05:15.095', '2019-10-06 15:05:15.095', '2019-10-06 15:05:15.095', '', NULL);
INSERT INTO `sys_job_log` VALUES (904, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:05:30.052', '2019-10-06 15:05:30.053', '2019-10-06 15:05:30.053', '', NULL);
INSERT INTO `sys_job_log` VALUES (905, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:05:45.125', '2019-10-06 15:05:45.125', '2019-10-06 15:05:45.125', '', NULL);
INSERT INTO `sys_job_log` VALUES (906, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:06:00.060', '2019-10-06 15:06:00.060', '2019-10-06 15:06:00.060', '', NULL);
INSERT INTO `sys_job_log` VALUES (907, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:06:15.308', '2019-10-06 15:06:15.309', '2019-10-06 15:06:15.309', '', NULL);
INSERT INTO `sys_job_log` VALUES (908, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:06:30.248', '2019-10-06 15:06:30.248', '2019-10-06 15:06:30.248', '', NULL);
INSERT INTO `sys_job_log` VALUES (909, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:06:47.342', '2019-10-06 15:06:47.342', '2019-10-06 15:06:47.342', '', NULL);
INSERT INTO `sys_job_log` VALUES (910, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:07:00.564', '2019-10-06 15:07:00.564', '2019-10-06 15:07:00.564', '', NULL);
INSERT INTO `sys_job_log` VALUES (911, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:07:17.359', '2019-10-06 15:07:17.359', '2019-10-06 15:07:17.359', '', NULL);
INSERT INTO `sys_job_log` VALUES (912, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:07:33.529', '2019-10-06 15:07:33.529', '2019-10-06 15:07:33.529', '', NULL);
INSERT INTO `sys_job_log` VALUES (913, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:07:45.417', '2019-10-06 15:07:45.417', '2019-10-06 15:07:45.417', '', NULL);
INSERT INTO `sys_job_log` VALUES (914, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:08:00.593', '2019-10-06 15:08:00.593', '2019-10-06 15:08:00.593', '', NULL);
INSERT INTO `sys_job_log` VALUES (915, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:08:16.473', '2019-10-06 15:08:16.473', '2019-10-06 15:08:16.473', '', NULL);
INSERT INTO `sys_job_log` VALUES (916, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:08:32.323', '2019-10-06 15:08:32.323', '2019-10-06 15:08:32.323', '', NULL);
INSERT INTO `sys_job_log` VALUES (917, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:08:46.304', '2019-10-06 15:08:46.304', '2019-10-06 15:08:46.304', '', NULL);
INSERT INTO `sys_job_log` VALUES (918, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:09:00.358', '2019-10-06 15:09:00.358', '2019-10-06 15:09:00.358', '', NULL);
INSERT INTO `sys_job_log` VALUES (919, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:09:15.037', '2019-10-06 15:09:15.038', '2019-10-06 15:09:15.038', '', NULL);
INSERT INTO `sys_job_log` VALUES (920, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 15:09:30.092', '2019-10-06 15:09:30.094', '2019-10-06 15:09:30.094', '', NULL);
INSERT INTO `sys_job_log` VALUES (921, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:09:45.214', '2019-10-06 15:09:45.214', '2019-10-06 15:09:45.214', '', NULL);
INSERT INTO `sys_job_log` VALUES (922, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:10:00.042', '2019-10-06 15:10:00.043', '2019-10-06 15:10:00.043', '', NULL);
INSERT INTO `sys_job_log` VALUES (923, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 15:10:15.016', '2019-10-06 15:10:15.018', '2019-10-06 15:10:15.018', '', NULL);
INSERT INTO `sys_job_log` VALUES (924, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:10:30.046', '2019-10-06 15:10:30.046', '2019-10-06 15:10:30.046', '', NULL);
INSERT INTO `sys_job_log` VALUES (925, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:10:45.097', '2019-10-06 15:10:45.097', '2019-10-06 15:10:45.097', '', NULL);
INSERT INTO `sys_job_log` VALUES (926, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:11:00.070', '2019-10-06 15:11:00.070', '2019-10-06 15:11:00.070', '', NULL);
INSERT INTO `sys_job_log` VALUES (927, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:11:15.077', '2019-10-06 15:11:15.077', '2019-10-06 15:11:15.077', '', NULL);
INSERT INTO `sys_job_log` VALUES (928, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:11:30.028', '2019-10-06 15:11:30.028', '2019-10-06 15:11:30.028', '', NULL);
INSERT INTO `sys_job_log` VALUES (929, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:11:45.080', '2019-10-06 15:11:45.080', '2019-10-06 15:11:45.080', '', NULL);
INSERT INTO `sys_job_log` VALUES (930, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:12:00.102', '2019-10-06 15:12:00.103', '2019-10-06 15:12:00.103', '', NULL);
INSERT INTO `sys_job_log` VALUES (931, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:12:15.014', '2019-10-06 15:12:15.014', '2019-10-06 15:12:15.014', '', NULL);
INSERT INTO `sys_job_log` VALUES (932, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:12:30.075', '2019-10-06 15:12:30.075', '2019-10-06 15:12:30.075', '', NULL);
INSERT INTO `sys_job_log` VALUES (933, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:12:45.033', '2019-10-06 15:12:45.033', '2019-10-06 15:12:45.033', '', NULL);
INSERT INTO `sys_job_log` VALUES (934, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:13:00.101', '2019-10-06 15:13:00.101', '2019-10-06 15:13:00.101', '', NULL);
INSERT INTO `sys_job_log` VALUES (935, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:13:15.043', '2019-10-06 15:13:15.043', '2019-10-06 15:13:15.043', '', NULL);
INSERT INTO `sys_job_log` VALUES (936, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：3毫秒', '1', '2019-10-06 15:13:30.083', '2019-10-06 15:13:30.086', '2019-10-06 15:13:30.086', '', NULL);
INSERT INTO `sys_job_log` VALUES (937, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:13:45.036', '2019-10-06 15:13:45.036', '2019-10-06 15:13:45.036', '', NULL);
INSERT INTO `sys_job_log` VALUES (938, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 15:14:00.077', '2019-10-06 15:14:00.079', '2019-10-06 15:14:00.079', '', NULL);
INSERT INTO `sys_job_log` VALUES (939, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 15:14:15.100', '2019-10-06 15:14:15.102', '2019-10-06 15:14:15.102', '', NULL);
INSERT INTO `sys_job_log` VALUES (940, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:14:30.094', '2019-10-06 15:14:30.095', '2019-10-06 15:14:30.095', '', NULL);
INSERT INTO `sys_job_log` VALUES (941, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:14:45.080', '2019-10-06 15:14:45.080', '2019-10-06 15:14:45.080', '', NULL);
INSERT INTO `sys_job_log` VALUES (942, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:15:00.039', '2019-10-06 15:15:00.039', '2019-10-06 15:15:00.039', '', NULL);
INSERT INTO `sys_job_log` VALUES (943, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:15:15.113', '2019-10-06 15:15:15.113', '2019-10-06 15:15:15.113', '', NULL);
INSERT INTO `sys_job_log` VALUES (944, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 15:15:30.075', '2019-10-06 15:15:30.077', '2019-10-06 15:15:30.077', '', NULL);
INSERT INTO `sys_job_log` VALUES (945, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:15:45.028', '2019-10-06 15:15:45.028', '2019-10-06 15:15:45.028', '', NULL);
INSERT INTO `sys_job_log` VALUES (946, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:16:00.105', '2019-10-06 15:16:00.105', '2019-10-06 15:16:00.105', '', NULL);
INSERT INTO `sys_job_log` VALUES (947, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:16:15.079', '2019-10-06 15:16:15.079', '2019-10-06 15:16:15.079', '', NULL);
INSERT INTO `sys_job_log` VALUES (948, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:16:30.027', '2019-10-06 15:16:30.027', '2019-10-06 15:16:30.027', '', NULL);
INSERT INTO `sys_job_log` VALUES (949, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:16:45.122', '2019-10-06 15:16:45.122', '2019-10-06 15:16:45.122', '', NULL);
INSERT INTO `sys_job_log` VALUES (950, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:17:00.022', '2019-10-06 15:17:00.022', '2019-10-06 15:17:00.023', '', NULL);
INSERT INTO `sys_job_log` VALUES (951, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:17:15.034', '2019-10-06 15:17:15.034', '2019-10-06 15:17:15.034', '', NULL);
INSERT INTO `sys_job_log` VALUES (952, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:17:30.108', '2019-10-06 15:17:30.108', '2019-10-06 15:17:30.108', '', NULL);
INSERT INTO `sys_job_log` VALUES (953, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:17:45.235', '2019-10-06 15:17:45.235', '2019-10-06 15:17:45.235', '', NULL);
INSERT INTO `sys_job_log` VALUES (954, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:18:00.042', '2019-10-06 15:18:00.042', '2019-10-06 15:18:00.042', '', NULL);
INSERT INTO `sys_job_log` VALUES (955, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:18:15.043', '2019-10-06 15:18:15.043', '2019-10-06 15:18:15.043', '', NULL);
INSERT INTO `sys_job_log` VALUES (956, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:18:30.050', '2019-10-06 15:18:30.050', '2019-10-06 15:18:30.050', '', NULL);
INSERT INTO `sys_job_log` VALUES (957, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：19毫秒', '1', '2019-10-06 15:18:45.021', '2019-10-06 15:18:45.040', '2019-10-06 15:18:45.040', '', NULL);
INSERT INTO `sys_job_log` VALUES (958, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:19:00.109', '2019-10-06 15:19:00.110', '2019-10-06 15:19:00.110', '', NULL);
INSERT INTO `sys_job_log` VALUES (959, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:19:15.087', '2019-10-06 15:19:15.088', '2019-10-06 15:19:15.088', '', NULL);
INSERT INTO `sys_job_log` VALUES (960, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:19:31.221', '2019-10-06 15:19:31.221', '2019-10-06 15:19:31.221', '', NULL);
INSERT INTO `sys_job_log` VALUES (961, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:19:45.086', '2019-10-06 15:19:45.087', '2019-10-06 15:19:45.087', '', NULL);
INSERT INTO `sys_job_log` VALUES (962, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 15:20:00.100', '2019-10-06 15:20:00.102', '2019-10-06 15:20:00.102', '', NULL);
INSERT INTO `sys_job_log` VALUES (963, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:20:15.097', '2019-10-06 15:20:15.097', '2019-10-06 15:20:15.097', '', NULL);
INSERT INTO `sys_job_log` VALUES (964, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:20:30.086', '2019-10-06 15:20:30.087', '2019-10-06 15:20:30.087', '', NULL);
INSERT INTO `sys_job_log` VALUES (965, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:20:45.059', '2019-10-06 15:20:45.059', '2019-10-06 15:20:45.059', '', NULL);
INSERT INTO `sys_job_log` VALUES (966, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:21:00.018', '2019-10-06 15:21:00.018', '2019-10-06 15:21:00.018', '', NULL);
INSERT INTO `sys_job_log` VALUES (967, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:21:15.122', '2019-10-06 15:21:15.122', '2019-10-06 15:21:15.122', '', NULL);
INSERT INTO `sys_job_log` VALUES (968, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:21:30.110', '2019-10-06 15:21:30.111', '2019-10-06 15:21:30.111', '', NULL);
INSERT INTO `sys_job_log` VALUES (969, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:21:45.076', '2019-10-06 15:21:45.077', '2019-10-06 15:21:45.077', '', NULL);
INSERT INTO `sys_job_log` VALUES (970, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:22:00.115', '2019-10-06 15:22:00.116', '2019-10-06 15:22:00.116', '', NULL);
INSERT INTO `sys_job_log` VALUES (971, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:22:15.095', '2019-10-06 15:22:15.095', '2019-10-06 15:22:15.095', '', NULL);
INSERT INTO `sys_job_log` VALUES (972, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:22:30.037', '2019-10-06 15:22:30.037', '2019-10-06 15:22:30.037', '', NULL);
INSERT INTO `sys_job_log` VALUES (973, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:22:45.084', '2019-10-06 15:22:45.084', '2019-10-06 15:22:45.084', '', NULL);
INSERT INTO `sys_job_log` VALUES (974, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:23:00.075', '2019-10-06 15:23:00.075', '2019-10-06 15:23:00.075', '', NULL);
INSERT INTO `sys_job_log` VALUES (975, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:23:15.114', '2019-10-06 15:23:15.114', '2019-10-06 15:23:15.114', '', NULL);
INSERT INTO `sys_job_log` VALUES (976, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:23:30.404', '2019-10-06 15:23:30.404', '2019-10-06 15:23:30.404', '', NULL);
INSERT INTO `sys_job_log` VALUES (977, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:23:45.024', '2019-10-06 15:23:45.025', '2019-10-06 15:23:45.025', '', NULL);
INSERT INTO `sys_job_log` VALUES (978, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:24:00.072', '2019-10-06 15:24:00.072', '2019-10-06 15:24:00.072', '', NULL);
INSERT INTO `sys_job_log` VALUES (979, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:24:15.111', '2019-10-06 15:24:15.112', '2019-10-06 15:24:15.112', '', NULL);
INSERT INTO `sys_job_log` VALUES (980, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:24:30.052', '2019-10-06 15:24:30.052', '2019-10-06 15:24:30.052', '', NULL);
INSERT INTO `sys_job_log` VALUES (981, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:24:45.110', '2019-10-06 15:24:45.111', '2019-10-06 15:24:45.111', '', NULL);
INSERT INTO `sys_job_log` VALUES (982, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:25:00.017', '2019-10-06 15:25:00.017', '2019-10-06 15:25:00.017', '', NULL);
INSERT INTO `sys_job_log` VALUES (983, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:25:15.112', '2019-10-06 15:25:15.112', '2019-10-06 15:25:15.112', '', NULL);
INSERT INTO `sys_job_log` VALUES (984, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:25:30.049', '2019-10-06 15:25:30.049', '2019-10-06 15:25:30.049', '', NULL);
INSERT INTO `sys_job_log` VALUES (985, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 15:25:45.105', '2019-10-06 15:25:45.107', '2019-10-06 15:25:45.107', '', NULL);
INSERT INTO `sys_job_log` VALUES (986, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:26:00.065', '2019-10-06 15:26:00.065', '2019-10-06 15:26:00.065', '', NULL);
INSERT INTO `sys_job_log` VALUES (987, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:26:15.033', '2019-10-06 15:26:15.034', '2019-10-06 15:26:15.034', '', NULL);
INSERT INTO `sys_job_log` VALUES (988, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:26:30.041', '2019-10-06 15:26:30.041', '2019-10-06 15:26:30.041', '', NULL);
INSERT INTO `sys_job_log` VALUES (989, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:26:45.085', '2019-10-06 15:26:45.085', '2019-10-06 15:26:45.085', '', NULL);
INSERT INTO `sys_job_log` VALUES (990, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:27:00.043', '2019-10-06 15:27:00.043', '2019-10-06 15:27:00.043', '', NULL);
INSERT INTO `sys_job_log` VALUES (991, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 15:27:15.082', '2019-10-06 15:27:15.084', '2019-10-06 15:27:15.084', '', NULL);
INSERT INTO `sys_job_log` VALUES (992, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:27:30.033', '2019-10-06 15:27:30.033', '2019-10-06 15:27:30.033', '', NULL);
INSERT INTO `sys_job_log` VALUES (993, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:27:45.036', '2019-10-06 15:27:45.036', '2019-10-06 15:27:45.036', '', NULL);
INSERT INTO `sys_job_log` VALUES (994, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:28:00.095', '2019-10-06 15:28:00.095', '2019-10-06 15:28:00.096', '', NULL);
INSERT INTO `sys_job_log` VALUES (995, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:28:15.037', '2019-10-06 15:28:15.037', '2019-10-06 15:28:15.037', '', NULL);
INSERT INTO `sys_job_log` VALUES (996, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:28:30.120', '2019-10-06 15:28:30.121', '2019-10-06 15:28:30.121', '', NULL);
INSERT INTO `sys_job_log` VALUES (997, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:28:45.116', '2019-10-06 15:28:45.116', '2019-10-06 15:28:45.116', '', NULL);
INSERT INTO `sys_job_log` VALUES (998, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:29:00.097', '2019-10-06 15:29:00.098', '2019-10-06 15:29:00.098', '', NULL);
INSERT INTO `sys_job_log` VALUES (999, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:29:15.044', '2019-10-06 15:29:15.044', '2019-10-06 15:29:15.044', '', NULL);
INSERT INTO `sys_job_log` VALUES (1000, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:29:30.192', '2019-10-06 15:29:30.193', '2019-10-06 15:29:30.193', '', NULL);
INSERT INTO `sys_job_log` VALUES (1001, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:29:45.027', '2019-10-06 15:29:45.027', '2019-10-06 15:29:45.027', '', NULL);
INSERT INTO `sys_job_log` VALUES (1002, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:30:00.064', '2019-10-06 15:30:00.064', '2019-10-06 15:30:00.064', '', NULL);
INSERT INTO `sys_job_log` VALUES (1003, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:30:15.120', '2019-10-06 15:30:15.120', '2019-10-06 15:30:15.120', '', NULL);
INSERT INTO `sys_job_log` VALUES (1004, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:30:30.068', '2019-10-06 15:30:30.068', '2019-10-06 15:30:30.068', '', NULL);
INSERT INTO `sys_job_log` VALUES (1005, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:30:45.066', '2019-10-06 15:30:45.066', '2019-10-06 15:30:45.066', '', NULL);
INSERT INTO `sys_job_log` VALUES (1006, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:31:00.032', '2019-10-06 15:31:00.032', '2019-10-06 15:31:00.032', '', NULL);
INSERT INTO `sys_job_log` VALUES (1007, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:31:15.079', '2019-10-06 15:31:15.079', '2019-10-06 15:31:15.079', '', NULL);
INSERT INTO `sys_job_log` VALUES (1008, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:31:30.016', '2019-10-06 15:31:30.016', '2019-10-06 15:31:30.016', '', NULL);
INSERT INTO `sys_job_log` VALUES (1009, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:31:45.083', '2019-10-06 15:31:45.083', '2019-10-06 15:31:45.083', '', NULL);
INSERT INTO `sys_job_log` VALUES (1010, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 15:32:00.021', '2019-10-06 15:32:00.023', '2019-10-06 15:32:00.023', '', NULL);
INSERT INTO `sys_job_log` VALUES (1011, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:32:15.059', '2019-10-06 15:32:15.059', '2019-10-06 15:32:15.059', '', NULL);
INSERT INTO `sys_job_log` VALUES (1012, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:32:30.119', '2019-10-06 15:32:30.120', '2019-10-06 15:32:30.120', '', NULL);
INSERT INTO `sys_job_log` VALUES (1013, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:32:45.051', '2019-10-06 15:32:45.051', '2019-10-06 15:32:45.051', '', NULL);
INSERT INTO `sys_job_log` VALUES (1014, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:33:00.015', '2019-10-06 15:33:00.015', '2019-10-06 15:33:00.015', '', NULL);
INSERT INTO `sys_job_log` VALUES (1015, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:33:15.058', '2019-10-06 15:33:15.058', '2019-10-06 15:33:15.058', '', NULL);
INSERT INTO `sys_job_log` VALUES (1016, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：18毫秒', '1', '2019-10-06 15:33:30.109', '2019-10-06 15:33:30.127', '2019-10-06 15:33:30.127', '', NULL);
INSERT INTO `sys_job_log` VALUES (1017, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:33:45.092', '2019-10-06 15:33:45.092', '2019-10-06 15:33:45.092', '', NULL);
INSERT INTO `sys_job_log` VALUES (1018, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:34:00.028', '2019-10-06 15:34:00.028', '2019-10-06 15:34:00.028', '', NULL);
INSERT INTO `sys_job_log` VALUES (1019, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:34:15.090', '2019-10-06 15:34:15.090', '2019-10-06 15:34:15.090', '', NULL);
INSERT INTO `sys_job_log` VALUES (1020, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:34:30.043', '2019-10-06 15:34:30.043', '2019-10-06 15:34:30.043', '', NULL);
INSERT INTO `sys_job_log` VALUES (1021, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:34:45.091', '2019-10-06 15:34:45.092', '2019-10-06 15:34:45.092', '', NULL);
INSERT INTO `sys_job_log` VALUES (1022, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:35:00.140', '2019-10-06 15:35:00.141', '2019-10-06 15:35:00.141', '', NULL);
INSERT INTO `sys_job_log` VALUES (1023, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:35:15.099', '2019-10-06 15:35:15.099', '2019-10-06 15:35:15.099', '', NULL);
INSERT INTO `sys_job_log` VALUES (1024, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:35:30.046', '2019-10-06 15:35:30.046', '2019-10-06 15:35:30.046', '', NULL);
INSERT INTO `sys_job_log` VALUES (1025, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:35:45.080', '2019-10-06 15:35:45.080', '2019-10-06 15:35:45.080', '', NULL);
INSERT INTO `sys_job_log` VALUES (1026, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:36:00.132', '2019-10-06 15:36:00.132', '2019-10-06 15:36:00.132', '', NULL);
INSERT INTO `sys_job_log` VALUES (1027, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:36:15.186', '2019-10-06 15:36:15.186', '2019-10-06 15:36:15.186', '', NULL);
INSERT INTO `sys_job_log` VALUES (1028, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:36:30.040', '2019-10-06 15:36:30.041', '2019-10-06 15:36:30.041', '', NULL);
INSERT INTO `sys_job_log` VALUES (1029, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:36:45.011', '2019-10-06 15:36:45.011', '2019-10-06 15:36:45.011', '', NULL);
INSERT INTO `sys_job_log` VALUES (1030, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：3毫秒', '1', '2019-10-06 15:37:00.064', '2019-10-06 15:37:00.067', '2019-10-06 15:37:00.067', '', NULL);
INSERT INTO `sys_job_log` VALUES (1031, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 15:37:15.025', '2019-10-06 15:37:15.027', '2019-10-06 15:37:15.027', '', NULL);
INSERT INTO `sys_job_log` VALUES (1032, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:37:30.046', '2019-10-06 15:37:30.046', '2019-10-06 15:37:30.046', '', NULL);
INSERT INTO `sys_job_log` VALUES (1033, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:37:45.116', '2019-10-06 15:37:45.117', '2019-10-06 15:37:45.117', '', NULL);
INSERT INTO `sys_job_log` VALUES (1034, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:38:00.066', '2019-10-06 15:38:00.066', '2019-10-06 15:38:00.066', '', NULL);
INSERT INTO `sys_job_log` VALUES (1035, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 15:38:15.114', '2019-10-06 15:38:15.116', '2019-10-06 15:38:15.116', '', NULL);
INSERT INTO `sys_job_log` VALUES (1036, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:38:30.102', '2019-10-06 15:38:30.102', '2019-10-06 15:38:30.102', '', NULL);
INSERT INTO `sys_job_log` VALUES (1037, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:38:45.049', '2019-10-06 15:38:45.049', '2019-10-06 15:38:45.049', '', NULL);
INSERT INTO `sys_job_log` VALUES (1038, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:39:00.031', '2019-10-06 15:39:00.031', '2019-10-06 15:39:00.031', '', NULL);
INSERT INTO `sys_job_log` VALUES (1039, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:39:15.111', '2019-10-06 15:39:15.111', '2019-10-06 15:39:15.111', '', NULL);
INSERT INTO `sys_job_log` VALUES (1040, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:39:30.092', '2019-10-06 15:39:30.092', '2019-10-06 15:39:30.092', '', NULL);
INSERT INTO `sys_job_log` VALUES (1041, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:39:45.154', '2019-10-06 15:39:45.154', '2019-10-06 15:39:45.154', '', NULL);
INSERT INTO `sys_job_log` VALUES (1042, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:40:00.112', '2019-10-06 15:40:00.112', '2019-10-06 15:40:00.112', '', NULL);
INSERT INTO `sys_job_log` VALUES (1043, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：4毫秒', '1', '2019-10-06 15:40:15.025', '2019-10-06 15:40:15.029', '2019-10-06 15:40:15.029', '', NULL);
INSERT INTO `sys_job_log` VALUES (1044, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:40:30.054', '2019-10-06 15:40:30.054', '2019-10-06 15:40:30.054', '', NULL);
INSERT INTO `sys_job_log` VALUES (1045, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:40:45.531', '2019-10-06 15:40:45.532', '2019-10-06 15:40:45.532', '', NULL);
INSERT INTO `sys_job_log` VALUES (1046, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:41:00.030', '2019-10-06 15:41:00.030', '2019-10-06 15:41:00.030', '', NULL);
INSERT INTO `sys_job_log` VALUES (1047, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:41:15.064', '2019-10-06 15:41:15.064', '2019-10-06 15:41:15.064', '', NULL);
INSERT INTO `sys_job_log` VALUES (1048, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:41:30.105', '2019-10-06 15:41:30.105', '2019-10-06 15:41:30.105', '', NULL);
INSERT INTO `sys_job_log` VALUES (1049, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：3毫秒', '1', '2019-10-06 15:41:45.039', '2019-10-06 15:41:45.042', '2019-10-06 15:41:45.042', '', NULL);
INSERT INTO `sys_job_log` VALUES (1050, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:42:00.067', '2019-10-06 15:42:00.068', '2019-10-06 15:42:00.068', '', NULL);
INSERT INTO `sys_job_log` VALUES (1051, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:42:15.021', '2019-10-06 15:42:15.021', '2019-10-06 15:42:15.021', '', NULL);
INSERT INTO `sys_job_log` VALUES (1052, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:42:30.109', '2019-10-06 15:42:30.109', '2019-10-06 15:42:30.109', '', NULL);
INSERT INTO `sys_job_log` VALUES (1053, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:42:45.036', '2019-10-06 15:42:45.036', '2019-10-06 15:42:45.036', '', NULL);
INSERT INTO `sys_job_log` VALUES (1054, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:43:00.071', '2019-10-06 15:43:00.071', '2019-10-06 15:43:00.071', '', NULL);
INSERT INTO `sys_job_log` VALUES (1055, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:43:15.121', '2019-10-06 15:43:15.121', '2019-10-06 15:43:15.121', '', NULL);
INSERT INTO `sys_job_log` VALUES (1056, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:43:30.056', '2019-10-06 15:43:30.056', '2019-10-06 15:43:30.056', '', NULL);
INSERT INTO `sys_job_log` VALUES (1057, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:43:45.125', '2019-10-06 15:43:45.126', '2019-10-06 15:43:45.126', '', NULL);
INSERT INTO `sys_job_log` VALUES (1058, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:44:00.042', '2019-10-06 15:44:00.043', '2019-10-06 15:44:00.043', '', NULL);
INSERT INTO `sys_job_log` VALUES (1059, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:44:15.055', '2019-10-06 15:44:15.055', '2019-10-06 15:44:15.057', '', NULL);
INSERT INTO `sys_job_log` VALUES (1060, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:44:30.020', '2019-10-06 15:44:30.020', '2019-10-06 15:44:30.020', '', NULL);
INSERT INTO `sys_job_log` VALUES (1061, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:44:45.085', '2019-10-06 15:44:45.085', '2019-10-06 15:44:45.085', '', NULL);
INSERT INTO `sys_job_log` VALUES (1062, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:45:00.072', '2019-10-06 15:45:00.072', '2019-10-06 15:45:00.072', '', NULL);
INSERT INTO `sys_job_log` VALUES (1063, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:45:15.129', '2019-10-06 15:45:15.129', '2019-10-06 15:45:15.129', '', NULL);
INSERT INTO `sys_job_log` VALUES (1064, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:45:30.041', '2019-10-06 15:45:30.042', '2019-10-06 15:45:30.042', '', NULL);
INSERT INTO `sys_job_log` VALUES (1065, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:45:45.095', '2019-10-06 15:45:45.095', '2019-10-06 15:45:45.095', '', NULL);
INSERT INTO `sys_job_log` VALUES (1066, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:46:00.052', '2019-10-06 15:46:00.052', '2019-10-06 15:46:00.052', '', NULL);
INSERT INTO `sys_job_log` VALUES (1067, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:46:15.093', '2019-10-06 15:46:15.094', '2019-10-06 15:46:15.094', '', NULL);
INSERT INTO `sys_job_log` VALUES (1068, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:46:30.038', '2019-10-06 15:46:30.039', '2019-10-06 15:46:30.039', '', NULL);
INSERT INTO `sys_job_log` VALUES (1069, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:46:45.073', '2019-10-06 15:46:45.073', '2019-10-06 15:46:45.073', '', NULL);
INSERT INTO `sys_job_log` VALUES (1070, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:47:00.015', '2019-10-06 15:47:00.016', '2019-10-06 15:47:00.016', '', NULL);
INSERT INTO `sys_job_log` VALUES (1071, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:47:15.067', '2019-10-06 15:47:15.067', '2019-10-06 15:47:15.067', '', NULL);
INSERT INTO `sys_job_log` VALUES (1072, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:47:30.059', '2019-10-06 15:47:30.059', '2019-10-06 15:47:30.059', '', NULL);
INSERT INTO `sys_job_log` VALUES (1073, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:47:45.104', '2019-10-06 15:47:45.104', '2019-10-06 15:47:45.104', '', NULL);
INSERT INTO `sys_job_log` VALUES (1074, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:48:00.104', '2019-10-06 15:48:00.104', '2019-10-06 15:48:00.104', '', NULL);
INSERT INTO `sys_job_log` VALUES (1075, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:48:15.178', '2019-10-06 15:48:15.178', '2019-10-06 15:48:15.178', '', NULL);
INSERT INTO `sys_job_log` VALUES (1076, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:48:30.124', '2019-10-06 15:48:30.125', '2019-10-06 15:48:30.125', '', NULL);
INSERT INTO `sys_job_log` VALUES (1077, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:48:45.063', '2019-10-06 15:48:45.063', '2019-10-06 15:48:45.063', '', NULL);
INSERT INTO `sys_job_log` VALUES (1078, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 15:49:00.113', '2019-10-06 15:49:00.115', '2019-10-06 15:49:00.115', '', NULL);
INSERT INTO `sys_job_log` VALUES (1079, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:49:15.104', '2019-10-06 15:49:15.104', '2019-10-06 15:49:15.104', '', NULL);
INSERT INTO `sys_job_log` VALUES (1080, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:49:30.099', '2019-10-06 15:49:30.099', '2019-10-06 15:49:30.099', '', NULL);
INSERT INTO `sys_job_log` VALUES (1081, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:49:45.057', '2019-10-06 15:49:45.057', '2019-10-06 15:49:45.057', '', NULL);
INSERT INTO `sys_job_log` VALUES (1082, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 15:50:00.105', '2019-10-06 15:50:00.107', '2019-10-06 15:50:00.107', '', NULL);
INSERT INTO `sys_job_log` VALUES (1083, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:50:15.053', '2019-10-06 15:50:15.053', '2019-10-06 15:50:15.053', '', NULL);
INSERT INTO `sys_job_log` VALUES (1084, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:50:30.021', '2019-10-06 15:50:30.021', '2019-10-06 15:50:30.021', '', NULL);
INSERT INTO `sys_job_log` VALUES (1085, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:50:45.075', '2019-10-06 15:50:45.076', '2019-10-06 15:50:45.076', '', NULL);
INSERT INTO `sys_job_log` VALUES (1086, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:51:00.098', '2019-10-06 15:51:00.099', '2019-10-06 15:51:00.099', '', NULL);
INSERT INTO `sys_job_log` VALUES (1087, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:51:15.060', '2019-10-06 15:51:15.060', '2019-10-06 15:51:15.060', '', NULL);
INSERT INTO `sys_job_log` VALUES (1088, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:51:30.096', '2019-10-06 15:51:30.097', '2019-10-06 15:51:30.097', '', NULL);
INSERT INTO `sys_job_log` VALUES (1089, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:51:45.047', '2019-10-06 15:51:45.047', '2019-10-06 15:51:45.047', '', NULL);
INSERT INTO `sys_job_log` VALUES (1090, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:52:00.098', '2019-10-06 15:52:00.098', '2019-10-06 15:52:00.098', '', NULL);
INSERT INTO `sys_job_log` VALUES (1091, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 15:52:15.025', '2019-10-06 15:52:15.027', '2019-10-06 15:52:15.027', '', NULL);
INSERT INTO `sys_job_log` VALUES (1092, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:52:30.072', '2019-10-06 15:52:30.073', '2019-10-06 15:52:30.073', '', NULL);
INSERT INTO `sys_job_log` VALUES (1093, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:52:45.028', '2019-10-06 15:52:45.028', '2019-10-06 15:52:45.028', '', NULL);
INSERT INTO `sys_job_log` VALUES (1094, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：14毫秒', '1', '2019-10-06 15:53:00.104', '2019-10-06 15:53:00.118', '2019-10-06 15:53:00.118', '', NULL);
INSERT INTO `sys_job_log` VALUES (1095, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:53:15.125', '2019-10-06 15:53:15.125', '2019-10-06 15:53:15.125', '', NULL);
INSERT INTO `sys_job_log` VALUES (1096, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:53:30.020', '2019-10-06 15:53:30.020', '2019-10-06 15:53:30.020', '', NULL);
INSERT INTO `sys_job_log` VALUES (1097, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:53:45.084', '2019-10-06 15:53:45.084', '2019-10-06 15:53:45.084', '', NULL);
INSERT INTO `sys_job_log` VALUES (1098, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:54:00.078', '2019-10-06 15:54:00.078', '2019-10-06 15:54:00.078', '', NULL);
INSERT INTO `sys_job_log` VALUES (1099, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:54:15.029', '2019-10-06 15:54:15.029', '2019-10-06 15:54:15.029', '', NULL);
INSERT INTO `sys_job_log` VALUES (1100, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:54:30.226', '2019-10-06 15:54:30.226', '2019-10-06 15:54:30.226', '', NULL);
INSERT INTO `sys_job_log` VALUES (1101, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:54:45.077', '2019-10-06 15:54:45.077', '2019-10-06 15:54:45.077', '', NULL);
INSERT INTO `sys_job_log` VALUES (1102, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:55:00.031', '2019-10-06 15:55:00.031', '2019-10-06 15:55:00.031', '', NULL);
INSERT INTO `sys_job_log` VALUES (1103, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:55:15.069', '2019-10-06 15:55:15.069', '2019-10-06 15:55:15.069', '', NULL);
INSERT INTO `sys_job_log` VALUES (1104, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:55:30.108', '2019-10-06 15:55:30.109', '2019-10-06 15:55:30.109', '', NULL);
INSERT INTO `sys_job_log` VALUES (1105, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:55:45.040', '2019-10-06 15:55:45.040', '2019-10-06 15:55:45.040', '', NULL);
INSERT INTO `sys_job_log` VALUES (1106, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:56:00.074', '2019-10-06 15:56:00.074', '2019-10-06 15:56:00.074', '', NULL);
INSERT INTO `sys_job_log` VALUES (1107, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:56:15.050', '2019-10-06 15:56:15.050', '2019-10-06 15:56:15.050', '', NULL);
INSERT INTO `sys_job_log` VALUES (1108, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 15:56:30.012', '2019-10-06 15:56:30.014', '2019-10-06 15:56:30.014', '', NULL);
INSERT INTO `sys_job_log` VALUES (1109, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 15:56:45.063', '2019-10-06 15:56:45.065', '2019-10-06 15:56:45.065', '', NULL);
INSERT INTO `sys_job_log` VALUES (1110, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:57:00.086', '2019-10-06 15:57:00.086', '2019-10-06 15:57:00.086', '', NULL);
INSERT INTO `sys_job_log` VALUES (1111, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:57:15.027', '2019-10-06 15:57:15.027', '2019-10-06 15:57:15.027', '', NULL);
INSERT INTO `sys_job_log` VALUES (1112, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:57:30.027', '2019-10-06 15:57:30.028', '2019-10-06 15:57:30.028', '', NULL);
INSERT INTO `sys_job_log` VALUES (1113, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:57:45.077', '2019-10-06 15:57:45.077', '2019-10-06 15:57:45.077', '', NULL);
INSERT INTO `sys_job_log` VALUES (1114, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:58:00.063', '2019-10-06 15:58:00.063', '2019-10-06 15:58:00.063', '', NULL);
INSERT INTO `sys_job_log` VALUES (1115, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:58:15.027', '2019-10-06 15:58:15.028', '2019-10-06 15:58:15.028', '', NULL);
INSERT INTO `sys_job_log` VALUES (1116, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:58:30.062', '2019-10-06 15:58:30.062', '2019-10-06 15:58:30.062', '', NULL);
INSERT INTO `sys_job_log` VALUES (1117, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 15:58:45.056', '2019-10-06 15:58:45.057', '2019-10-06 15:58:45.057', '', NULL);
INSERT INTO `sys_job_log` VALUES (1118, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 15:59:00.089', '2019-10-06 15:59:00.091', '2019-10-06 15:59:00.091', '', NULL);
INSERT INTO `sys_job_log` VALUES (1119, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:59:15.049', '2019-10-06 15:59:15.049', '2019-10-06 15:59:15.049', '', NULL);
INSERT INTO `sys_job_log` VALUES (1120, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:59:30.081', '2019-10-06 15:59:30.081', '2019-10-06 15:59:30.081', '', NULL);
INSERT INTO `sys_job_log` VALUES (1121, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 15:59:45.085', '2019-10-06 15:59:45.085', '2019-10-06 15:59:45.085', '', NULL);
INSERT INTO `sys_job_log` VALUES (1122, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:00:00.074', '2019-10-06 16:00:00.074', '2019-10-06 16:00:00.074', '', NULL);
INSERT INTO `sys_job_log` VALUES (1123, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:00:15.120', '2019-10-06 16:00:15.120', '2019-10-06 16:00:15.120', '', NULL);
INSERT INTO `sys_job_log` VALUES (1124, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:00:30.070', '2019-10-06 16:00:30.070', '2019-10-06 16:00:30.070', '', NULL);
INSERT INTO `sys_job_log` VALUES (1125, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:00:45.027', '2019-10-06 16:00:45.027', '2019-10-06 16:00:45.027', '', NULL);
INSERT INTO `sys_job_log` VALUES (1126, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:01:00.086', '2019-10-06 16:01:00.087', '2019-10-06 16:01:00.087', '', NULL);
INSERT INTO `sys_job_log` VALUES (1127, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:01:15.142', '2019-10-06 16:01:15.142', '2019-10-06 16:01:15.142', '', NULL);
INSERT INTO `sys_job_log` VALUES (1128, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:01:30.103', '2019-10-06 16:01:30.104', '2019-10-06 16:01:30.104', '', NULL);
INSERT INTO `sys_job_log` VALUES (1129, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:01:45.044', '2019-10-06 16:01:45.044', '2019-10-06 16:01:45.044', '', NULL);
INSERT INTO `sys_job_log` VALUES (1130, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:02:00.077', '2019-10-06 16:02:00.077', '2019-10-06 16:02:00.077', '', NULL);
INSERT INTO `sys_job_log` VALUES (1131, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 16:02:15.097', '2019-10-06 16:02:15.099', '2019-10-06 16:02:15.099', '', NULL);
INSERT INTO `sys_job_log` VALUES (1132, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:02:30.045', '2019-10-06 16:02:30.046', '2019-10-06 16:02:30.046', '', NULL);
INSERT INTO `sys_job_log` VALUES (1133, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:02:45.068', '2019-10-06 16:02:45.068', '2019-10-06 16:02:45.068', '', NULL);
INSERT INTO `sys_job_log` VALUES (1134, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:03:00.307', '2019-10-06 16:03:00.307', '2019-10-06 16:03:00.307', '', NULL);
INSERT INTO `sys_job_log` VALUES (1135, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:03:15.040', '2019-10-06 16:03:15.041', '2019-10-06 16:03:15.041', '', NULL);
INSERT INTO `sys_job_log` VALUES (1136, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:03:30.110', '2019-10-06 16:03:30.110', '2019-10-06 16:03:30.110', '', NULL);
INSERT INTO `sys_job_log` VALUES (1137, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:03:45.069', '2019-10-06 16:03:45.069', '2019-10-06 16:03:45.069', '', NULL);
INSERT INTO `sys_job_log` VALUES (1138, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:04:00.046', '2019-10-06 16:04:00.047', '2019-10-06 16:04:00.047', '', NULL);
INSERT INTO `sys_job_log` VALUES (1139, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:04:15.096', '2019-10-06 16:04:15.096', '2019-10-06 16:04:15.096', '', NULL);
INSERT INTO `sys_job_log` VALUES (1140, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:04:30.205', '2019-10-06 16:04:30.205', '2019-10-06 16:04:30.205', '', NULL);
INSERT INTO `sys_job_log` VALUES (1141, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:04:45.090', '2019-10-06 16:04:45.090', '2019-10-06 16:04:45.090', '', NULL);
INSERT INTO `sys_job_log` VALUES (1142, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:05:00.024', '2019-10-06 16:05:00.025', '2019-10-06 16:05:00.025', '', NULL);
INSERT INTO `sys_job_log` VALUES (1143, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:05:15.066', '2019-10-06 16:05:15.066', '2019-10-06 16:05:15.066', '', NULL);
INSERT INTO `sys_job_log` VALUES (1144, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:05:30.114', '2019-10-06 16:05:30.114', '2019-10-06 16:05:30.114', '', NULL);
INSERT INTO `sys_job_log` VALUES (1145, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:05:45.103', '2019-10-06 16:05:45.104', '2019-10-06 16:05:45.104', '', NULL);
INSERT INTO `sys_job_log` VALUES (1146, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:06:00.101', '2019-10-06 16:06:00.101', '2019-10-06 16:06:00.101', '', NULL);
INSERT INTO `sys_job_log` VALUES (1147, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:06:15.054', '2019-10-06 16:06:15.055', '2019-10-06 16:06:15.055', '', NULL);
INSERT INTO `sys_job_log` VALUES (1148, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 16:06:30.178', '2019-10-06 16:06:30.180', '2019-10-06 16:06:30.180', '', NULL);
INSERT INTO `sys_job_log` VALUES (1149, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:06:45.081', '2019-10-06 16:06:45.081', '2019-10-06 16:06:45.081', '', NULL);
INSERT INTO `sys_job_log` VALUES (1150, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:07:00.097', '2019-10-06 16:07:00.097', '2019-10-06 16:07:00.097', '', NULL);
INSERT INTO `sys_job_log` VALUES (1151, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:07:15.110', '2019-10-06 16:07:15.110', '2019-10-06 16:07:15.110', '', NULL);
INSERT INTO `sys_job_log` VALUES (1152, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:07:30.075', '2019-10-06 16:07:30.075', '2019-10-06 16:07:30.075', '', NULL);
INSERT INTO `sys_job_log` VALUES (1153, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:07:45.114', '2019-10-06 16:07:45.114', '2019-10-06 16:07:45.114', '', NULL);
INSERT INTO `sys_job_log` VALUES (1154, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:08:00.063', '2019-10-06 16:08:00.063', '2019-10-06 16:08:00.063', '', NULL);
INSERT INTO `sys_job_log` VALUES (1155, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:08:15.103', '2019-10-06 16:08:15.103', '2019-10-06 16:08:15.103', '', NULL);
INSERT INTO `sys_job_log` VALUES (1156, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:08:30.047', '2019-10-06 16:08:30.047', '2019-10-06 16:08:30.047', '', NULL);
INSERT INTO `sys_job_log` VALUES (1157, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:08:45.120', '2019-10-06 16:08:45.120', '2019-10-06 16:08:45.120', '', NULL);
INSERT INTO `sys_job_log` VALUES (1158, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:09:00.048', '2019-10-06 16:09:00.048', '2019-10-06 16:09:00.048', '', NULL);
INSERT INTO `sys_job_log` VALUES (1159, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:09:15.109', '2019-10-06 16:09:15.109', '2019-10-06 16:09:15.109', '', NULL);
INSERT INTO `sys_job_log` VALUES (1160, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:09:30.185', '2019-10-06 16:09:30.185', '2019-10-06 16:09:30.185', '', NULL);
INSERT INTO `sys_job_log` VALUES (1161, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:09:45.013', '2019-10-06 16:09:45.013', '2019-10-06 16:09:45.013', '', NULL);
INSERT INTO `sys_job_log` VALUES (1162, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:10:00.072', '2019-10-06 16:10:00.072', '2019-10-06 16:10:00.072', '', NULL);
INSERT INTO `sys_job_log` VALUES (1163, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:10:15.118', '2019-10-06 16:10:15.119', '2019-10-06 16:10:15.119', '', NULL);
INSERT INTO `sys_job_log` VALUES (1164, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:10:30.076', '2019-10-06 16:10:30.077', '2019-10-06 16:10:30.077', '', NULL);
INSERT INTO `sys_job_log` VALUES (1165, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:10:45.088', '2019-10-06 16:10:45.088', '2019-10-06 16:10:45.088', '', NULL);
INSERT INTO `sys_job_log` VALUES (1166, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:11:00.033', '2019-10-06 16:11:00.033', '2019-10-06 16:11:00.033', '', NULL);
INSERT INTO `sys_job_log` VALUES (1167, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:11:15.096', '2019-10-06 16:11:15.096', '2019-10-06 16:11:15.096', '', NULL);
INSERT INTO `sys_job_log` VALUES (1168, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:11:30.040', '2019-10-06 16:11:30.040', '2019-10-06 16:11:30.040', '', NULL);
INSERT INTO `sys_job_log` VALUES (1169, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:11:45.092', '2019-10-06 16:11:45.092', '2019-10-06 16:11:45.092', '', NULL);
INSERT INTO `sys_job_log` VALUES (1170, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:12:00.038', '2019-10-06 16:12:00.038', '2019-10-06 16:12:00.038', '', NULL);
INSERT INTO `sys_job_log` VALUES (1171, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:12:15.089', '2019-10-06 16:12:15.089', '2019-10-06 16:12:15.089', '', NULL);
INSERT INTO `sys_job_log` VALUES (1172, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:12:30.047', '2019-10-06 16:12:30.047', '2019-10-06 16:12:30.047', '', NULL);
INSERT INTO `sys_job_log` VALUES (1173, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:12:45.086', '2019-10-06 16:12:45.086', '2019-10-06 16:12:45.086', '', NULL);
INSERT INTO `sys_job_log` VALUES (1174, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:13:00.028', '2019-10-06 16:13:00.028', '2019-10-06 16:13:00.028', '', NULL);
INSERT INTO `sys_job_log` VALUES (1175, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:13:15.126', '2019-10-06 16:13:15.126', '2019-10-06 16:13:15.126', '', NULL);
INSERT INTO `sys_job_log` VALUES (1176, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:13:30.082', '2019-10-06 16:13:30.082', '2019-10-06 16:13:30.082', '', NULL);
INSERT INTO `sys_job_log` VALUES (1177, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:13:45.043', '2019-10-06 16:13:45.043', '2019-10-06 16:13:45.043', '', NULL);
INSERT INTO `sys_job_log` VALUES (1178, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:14:00.120', '2019-10-06 16:14:00.120', '2019-10-06 16:14:00.120', '', NULL);
INSERT INTO `sys_job_log` VALUES (1179, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:14:15.070', '2019-10-06 16:14:15.070', '2019-10-06 16:14:15.070', '', NULL);
INSERT INTO `sys_job_log` VALUES (1180, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:14:30.037', '2019-10-06 16:14:30.037', '2019-10-06 16:14:30.037', '', NULL);
INSERT INTO `sys_job_log` VALUES (1181, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 16:14:45.032', '2019-10-06 16:14:45.034', '2019-10-06 16:14:45.034', '', NULL);
INSERT INTO `sys_job_log` VALUES (1182, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：3毫秒', '1', '2019-10-06 16:15:00.055', '2019-10-06 16:15:00.058', '2019-10-06 16:15:00.058', '', NULL);
INSERT INTO `sys_job_log` VALUES (1183, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:15:15.128', '2019-10-06 16:15:15.128', '2019-10-06 16:15:15.128', '', NULL);
INSERT INTO `sys_job_log` VALUES (1184, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:15:30.075', '2019-10-06 16:15:30.075', '2019-10-06 16:15:30.075', '', NULL);
INSERT INTO `sys_job_log` VALUES (1185, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:15:45.055', '2019-10-06 16:15:45.056', '2019-10-06 16:15:45.056', '', NULL);
INSERT INTO `sys_job_log` VALUES (1186, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:16:00.035', '2019-10-06 16:16:00.035', '2019-10-06 16:16:00.035', '', NULL);
INSERT INTO `sys_job_log` VALUES (1187, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:16:15.018', '2019-10-06 16:16:15.018', '2019-10-06 16:16:15.018', '', NULL);
INSERT INTO `sys_job_log` VALUES (1188, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:16:30.038', '2019-10-06 16:16:30.039', '2019-10-06 16:16:30.039', '', NULL);
INSERT INTO `sys_job_log` VALUES (1189, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:16:45.094', '2019-10-06 16:16:45.094', '2019-10-06 16:16:45.096', '', NULL);
INSERT INTO `sys_job_log` VALUES (1190, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:17:00.070', '2019-10-06 16:17:00.070', '2019-10-06 16:17:00.070', '', NULL);
INSERT INTO `sys_job_log` VALUES (1191, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:17:15.092', '2019-10-06 16:17:15.092', '2019-10-06 16:17:15.092', '', NULL);
INSERT INTO `sys_job_log` VALUES (1192, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 16:17:30.182', '2019-10-06 16:17:30.184', '2019-10-06 16:17:30.184', '', NULL);
INSERT INTO `sys_job_log` VALUES (1193, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:17:45.025', '2019-10-06 16:17:45.025', '2019-10-06 16:17:45.025', '', NULL);
INSERT INTO `sys_job_log` VALUES (1194, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:18:00.026', '2019-10-06 16:18:00.026', '2019-10-06 16:18:00.026', '', NULL);
INSERT INTO `sys_job_log` VALUES (1195, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:18:15.019', '2019-10-06 16:18:15.020', '2019-10-06 16:18:15.020', '', NULL);
INSERT INTO `sys_job_log` VALUES (1196, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:18:30.034', '2019-10-06 16:18:30.035', '2019-10-06 16:18:30.035', '', NULL);
INSERT INTO `sys_job_log` VALUES (1197, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:18:45.046', '2019-10-06 16:18:45.046', '2019-10-06 16:18:45.046', '', NULL);
INSERT INTO `sys_job_log` VALUES (1198, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:19:00.032', '2019-10-06 16:19:00.032', '2019-10-06 16:19:00.032', '', NULL);
INSERT INTO `sys_job_log` VALUES (1199, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:19:15.175', '2019-10-06 16:19:15.175', '2019-10-06 16:19:15.175', '', NULL);
INSERT INTO `sys_job_log` VALUES (1200, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:19:30.034', '2019-10-06 16:19:30.034', '2019-10-06 16:19:30.034', '', NULL);
INSERT INTO `sys_job_log` VALUES (1201, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:19:45.058', '2019-10-06 16:19:45.058', '2019-10-06 16:19:45.058', '', NULL);
INSERT INTO `sys_job_log` VALUES (1202, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:20:00.050', '2019-10-06 16:20:00.050', '2019-10-06 16:20:00.050', '', NULL);
INSERT INTO `sys_job_log` VALUES (1203, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:20:15.036', '2019-10-06 16:20:15.036', '2019-10-06 16:20:15.036', '', NULL);
INSERT INTO `sys_job_log` VALUES (1204, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:20:30.074', '2019-10-06 16:20:30.074', '2019-10-06 16:20:30.074', '', NULL);
INSERT INTO `sys_job_log` VALUES (1205, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:20:45.050', '2019-10-06 16:20:45.050', '2019-10-06 16:20:45.050', '', NULL);
INSERT INTO `sys_job_log` VALUES (1206, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:21:00.035', '2019-10-06 16:21:00.035', '2019-10-06 16:21:00.035', '', NULL);
INSERT INTO `sys_job_log` VALUES (1207, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:21:15.027', '2019-10-06 16:21:15.028', '2019-10-06 16:21:15.028', '', NULL);
INSERT INTO `sys_job_log` VALUES (1208, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:21:30.035', '2019-10-06 16:21:30.035', '2019-10-06 16:21:30.035', '', NULL);
INSERT INTO `sys_job_log` VALUES (1209, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:21:45.047', '2019-10-06 16:21:45.048', '2019-10-06 16:21:45.048', '', NULL);
INSERT INTO `sys_job_log` VALUES (1210, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:22:00.037', '2019-10-06 16:22:00.037', '2019-10-06 16:22:00.037', '', NULL);
INSERT INTO `sys_job_log` VALUES (1211, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 16:22:15.051', '2019-10-06 16:22:15.053', '2019-10-06 16:22:15.053', '', NULL);
INSERT INTO `sys_job_log` VALUES (1212, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 16:22:30.037', '2019-10-06 16:22:30.039', '2019-10-06 16:22:30.039', '', NULL);
INSERT INTO `sys_job_log` VALUES (1213, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:22:45.030', '2019-10-06 16:22:45.031', '2019-10-06 16:22:45.031', '', NULL);
INSERT INTO `sys_job_log` VALUES (1214, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:23:00.043', '2019-10-06 16:23:00.044', '2019-10-06 16:23:00.044', '', NULL);
INSERT INTO `sys_job_log` VALUES (1215, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:23:15.023', '2019-10-06 16:23:15.023', '2019-10-06 16:23:15.023', '', NULL);
INSERT INTO `sys_job_log` VALUES (1216, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:23:30.029', '2019-10-06 16:23:30.029', '2019-10-06 16:23:30.029', '', NULL);
INSERT INTO `sys_job_log` VALUES (1217, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:23:45.014', '2019-10-06 16:23:45.014', '2019-10-06 16:23:45.014', '', NULL);
INSERT INTO `sys_job_log` VALUES (1218, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:24:00.231', '2019-10-06 16:24:00.231', '2019-10-06 16:24:00.231', '', NULL);
INSERT INTO `sys_job_log` VALUES (1219, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:24:15.083', '2019-10-06 16:24:15.083', '2019-10-06 16:24:15.083', '', NULL);
INSERT INTO `sys_job_log` VALUES (1220, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:24:30.101', '2019-10-06 16:24:30.102', '2019-10-06 16:24:30.102', '', NULL);
INSERT INTO `sys_job_log` VALUES (1221, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:24:45.244', '2019-10-06 16:24:45.244', '2019-10-06 16:24:45.244', '', NULL);
INSERT INTO `sys_job_log` VALUES (1222, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:25:00.247', '2019-10-06 16:25:00.247', '2019-10-06 16:25:00.247', '', NULL);
INSERT INTO `sys_job_log` VALUES (1223, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:25:15.264', '2019-10-06 16:25:15.265', '2019-10-06 16:25:15.265', '', NULL);
INSERT INTO `sys_job_log` VALUES (1224, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:25:30.342', '2019-10-06 16:25:30.342', '2019-10-06 16:25:30.342', '', NULL);
INSERT INTO `sys_job_log` VALUES (1225, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:25:45.064', '2019-10-06 16:25:45.064', '2019-10-06 16:25:45.064', '', NULL);
INSERT INTO `sys_job_log` VALUES (1226, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:26:00.090', '2019-10-06 16:26:00.090', '2019-10-06 16:26:00.090', '', NULL);
INSERT INTO `sys_job_log` VALUES (1227, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:26:15.054', '2019-10-06 16:26:15.054', '2019-10-06 16:26:15.054', '', NULL);
INSERT INTO `sys_job_log` VALUES (1228, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:26:30.263', '2019-10-06 16:26:30.263', '2019-10-06 16:26:30.263', '', NULL);
INSERT INTO `sys_job_log` VALUES (1229, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:26:45.063', '2019-10-06 16:26:45.063', '2019-10-06 16:26:45.063', '', NULL);
INSERT INTO `sys_job_log` VALUES (1230, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:27:00.095', '2019-10-06 16:27:00.095', '2019-10-06 16:27:00.095', '', NULL);
INSERT INTO `sys_job_log` VALUES (1231, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:27:15.084', '2019-10-06 16:27:15.084', '2019-10-06 16:27:15.084', '', NULL);
INSERT INTO `sys_job_log` VALUES (1232, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:27:30.096', '2019-10-06 16:27:30.096', '2019-10-06 16:27:30.096', '', NULL);
INSERT INTO `sys_job_log` VALUES (1233, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:27:45.059', '2019-10-06 16:27:45.059', '2019-10-06 16:27:45.059', '', NULL);
INSERT INTO `sys_job_log` VALUES (1234, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:28:00.098', '2019-10-06 16:28:00.098', '2019-10-06 16:28:00.098', '', NULL);
INSERT INTO `sys_job_log` VALUES (1235, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 16:28:15.435', '2019-10-06 16:28:15.437', '2019-10-06 16:28:15.437', '', NULL);
INSERT INTO `sys_job_log` VALUES (1236, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:28:30.096', '2019-10-06 16:28:30.096', '2019-10-06 16:28:30.096', '', NULL);
INSERT INTO `sys_job_log` VALUES (1237, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:28:45.197', '2019-10-06 16:28:45.197', '2019-10-06 16:28:45.197', '', NULL);
INSERT INTO `sys_job_log` VALUES (1238, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:29:00.091', '2019-10-06 16:29:00.092', '2019-10-06 16:29:00.092', '', NULL);
INSERT INTO `sys_job_log` VALUES (1239, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：7毫秒', '1', '2019-10-06 16:29:15.952', '2019-10-06 16:29:15.959', '2019-10-06 16:29:15.959', '', NULL);
INSERT INTO `sys_job_log` VALUES (1240, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:29:30.224', '2019-10-06 16:29:30.224', '2019-10-06 16:29:30.224', '', NULL);
INSERT INTO `sys_job_log` VALUES (1241, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:29:45.119', '2019-10-06 16:29:45.120', '2019-10-06 16:29:45.120', '', NULL);
INSERT INTO `sys_job_log` VALUES (1242, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:30:00.083', '2019-10-06 16:30:00.083', '2019-10-06 16:30:00.083', '', NULL);
INSERT INTO `sys_job_log` VALUES (1243, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:30:15.045', '2019-10-06 16:30:15.045', '2019-10-06 16:30:15.045', '', NULL);
INSERT INTO `sys_job_log` VALUES (1244, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:30:30.202', '2019-10-06 16:30:30.203', '2019-10-06 16:30:30.203', '', NULL);
INSERT INTO `sys_job_log` VALUES (1245, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:30:45.068', '2019-10-06 16:30:45.069', '2019-10-06 16:30:45.069', '', NULL);
INSERT INTO `sys_job_log` VALUES (1246, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:31:00.122', '2019-10-06 16:31:00.122', '2019-10-06 16:31:00.122', '', NULL);
INSERT INTO `sys_job_log` VALUES (1247, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：6毫秒', '1', '2019-10-06 16:31:15.089', '2019-10-06 16:31:15.095', '2019-10-06 16:31:15.095', '', NULL);
INSERT INTO `sys_job_log` VALUES (1248, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:31:30.049', '2019-10-06 16:31:30.050', '2019-10-06 16:31:30.050', '', NULL);
INSERT INTO `sys_job_log` VALUES (1249, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:31:45.063', '2019-10-06 16:31:45.063', '2019-10-06 16:31:45.063', '', NULL);
INSERT INTO `sys_job_log` VALUES (1250, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 16:32:00.108', '2019-10-06 16:32:00.110', '2019-10-06 16:32:00.110', '', NULL);
INSERT INTO `sys_job_log` VALUES (1251, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 16:32:15.075', '2019-10-06 16:32:15.077', '2019-10-06 16:32:15.077', '', NULL);
INSERT INTO `sys_job_log` VALUES (1252, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:32:30.220', '2019-10-06 16:32:30.220', '2019-10-06 16:32:30.220', '', NULL);
INSERT INTO `sys_job_log` VALUES (1253, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 16:32:45.344', '2019-10-06 16:32:45.346', '2019-10-06 16:32:45.346', '', NULL);
INSERT INTO `sys_job_log` VALUES (1254, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:33:00.088', '2019-10-06 16:33:00.088', '2019-10-06 16:33:00.088', '', NULL);
INSERT INTO `sys_job_log` VALUES (1255, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 16:33:15.046', '2019-10-06 16:33:15.048', '2019-10-06 16:33:15.048', '', NULL);
INSERT INTO `sys_job_log` VALUES (1256, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:33:30.039', '2019-10-06 16:33:30.040', '2019-10-06 16:33:30.040', '', NULL);
INSERT INTO `sys_job_log` VALUES (1257, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:33:45.086', '2019-10-06 16:33:45.086', '2019-10-06 16:33:45.086', '', NULL);
INSERT INTO `sys_job_log` VALUES (1258, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 16:34:00.020', '2019-10-06 16:34:00.022', '2019-10-06 16:34:00.022', '', NULL);
INSERT INTO `sys_job_log` VALUES (1259, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:34:15.073', '2019-10-06 16:34:15.073', '2019-10-06 16:34:15.073', '', NULL);
INSERT INTO `sys_job_log` VALUES (1260, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:34:30.059', '2019-10-06 16:34:30.059', '2019-10-06 16:34:30.059', '', NULL);
INSERT INTO `sys_job_log` VALUES (1261, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 16:34:45.265', '2019-10-06 16:34:45.267', '2019-10-06 16:34:45.267', '', NULL);
INSERT INTO `sys_job_log` VALUES (1262, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:35:00.045', '2019-10-06 16:35:00.045', '2019-10-06 16:35:00.045', '', NULL);
INSERT INTO `sys_job_log` VALUES (1263, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:35:15.076', '2019-10-06 16:35:15.076', '2019-10-06 16:35:15.076', '', NULL);
INSERT INTO `sys_job_log` VALUES (1264, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:35:30.094', '2019-10-06 16:35:30.094', '2019-10-06 16:35:30.094', '', NULL);
INSERT INTO `sys_job_log` VALUES (1265, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:35:45.082', '2019-10-06 16:35:45.083', '2019-10-06 16:35:45.083', '', NULL);
INSERT INTO `sys_job_log` VALUES (1266, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:36:00.028', '2019-10-06 16:36:00.028', '2019-10-06 16:36:00.028', '', NULL);
INSERT INTO `sys_job_log` VALUES (1267, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:36:15.058', '2019-10-06 16:36:15.058', '2019-10-06 16:36:15.058', '', NULL);
INSERT INTO `sys_job_log` VALUES (1268, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:36:30.099', '2019-10-06 16:36:30.099', '2019-10-06 16:36:30.099', '', NULL);
INSERT INTO `sys_job_log` VALUES (1269, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 16:36:45.087', '2019-10-06 16:36:45.089', '2019-10-06 16:36:45.089', '', NULL);
INSERT INTO `sys_job_log` VALUES (1270, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:37:00.099', '2019-10-06 16:37:00.099', '2019-10-06 16:37:00.099', '', NULL);
INSERT INTO `sys_job_log` VALUES (1271, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:37:15.243', '2019-10-06 16:37:15.243', '2019-10-06 16:37:15.243', '', NULL);
INSERT INTO `sys_job_log` VALUES (1272, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:37:30.118', '2019-10-06 16:37:30.118', '2019-10-06 16:37:30.118', '', NULL);
INSERT INTO `sys_job_log` VALUES (1273, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:37:45.028', '2019-10-06 16:37:45.028', '2019-10-06 16:37:45.028', '', NULL);
INSERT INTO `sys_job_log` VALUES (1274, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:38:00.041', '2019-10-06 16:38:00.041', '2019-10-06 16:38:00.041', '', NULL);
INSERT INTO `sys_job_log` VALUES (1275, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：4毫秒', '1', '2019-10-06 16:38:15.065', '2019-10-06 16:38:15.069', '2019-10-06 16:38:15.069', '', NULL);
INSERT INTO `sys_job_log` VALUES (1276, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:38:30.223', '2019-10-06 16:38:30.224', '2019-10-06 16:38:30.224', '', NULL);
INSERT INTO `sys_job_log` VALUES (1277, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 16:38:45.415', '2019-10-06 16:38:45.417', '2019-10-06 16:38:45.417', '', NULL);
INSERT INTO `sys_job_log` VALUES (1278, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:39:00.032', '2019-10-06 16:39:00.032', '2019-10-06 16:39:00.032', '', NULL);
INSERT INTO `sys_job_log` VALUES (1279, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:39:15.104', '2019-10-06 16:39:15.104', '2019-10-06 16:39:15.104', '', NULL);
INSERT INTO `sys_job_log` VALUES (1280, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：13毫秒', '1', '2019-10-06 16:39:30.092', '2019-10-06 16:39:30.105', '2019-10-06 16:39:30.105', '', NULL);
INSERT INTO `sys_job_log` VALUES (1281, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:39:45.029', '2019-10-06 16:39:45.029', '2019-10-06 16:39:45.029', '', NULL);
INSERT INTO `sys_job_log` VALUES (1282, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:40:00.170', '2019-10-06 16:40:00.170', '2019-10-06 16:40:00.170', '', NULL);
INSERT INTO `sys_job_log` VALUES (1283, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:40:15.041', '2019-10-06 16:40:15.041', '2019-10-06 16:40:15.041', '', NULL);
INSERT INTO `sys_job_log` VALUES (1284, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:40:30.091', '2019-10-06 16:40:30.091', '2019-10-06 16:40:30.091', '', NULL);
INSERT INTO `sys_job_log` VALUES (1285, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:40:45.207', '2019-10-06 16:40:45.207', '2019-10-06 16:40:45.207', '', NULL);
INSERT INTO `sys_job_log` VALUES (1286, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 16:41:00.032', '2019-10-06 16:41:00.034', '2019-10-06 16:41:00.034', '', NULL);
INSERT INTO `sys_job_log` VALUES (1287, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：12毫秒', '1', '2019-10-06 16:41:15.061', '2019-10-06 16:41:15.073', '2019-10-06 16:41:15.073', '', NULL);
INSERT INTO `sys_job_log` VALUES (1288, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:41:30.141', '2019-10-06 16:41:30.141', '2019-10-06 16:41:30.141', '', NULL);
INSERT INTO `sys_job_log` VALUES (1289, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:41:45.032', '2019-10-06 16:41:45.032', '2019-10-06 16:41:45.032', '', NULL);
INSERT INTO `sys_job_log` VALUES (1290, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:42:00.138', '2019-10-06 16:42:00.138', '2019-10-06 16:42:00.138', '', NULL);
INSERT INTO `sys_job_log` VALUES (1291, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:42:15.057', '2019-10-06 16:42:15.057', '2019-10-06 16:42:15.057', '', NULL);
INSERT INTO `sys_job_log` VALUES (1292, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：71毫秒', '1', '2019-10-06 16:42:30.790', '2019-10-06 16:42:30.861', '2019-10-06 16:42:30.861', '', NULL);
INSERT INTO `sys_job_log` VALUES (1293, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:42:45.329', '2019-10-06 16:42:45.330', '2019-10-06 16:42:45.330', '', NULL);
INSERT INTO `sys_job_log` VALUES (1294, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 16:43:00.070', '2019-10-06 16:43:00.072', '2019-10-06 16:43:00.072', '', NULL);
INSERT INTO `sys_job_log` VALUES (1295, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:43:15.119', '2019-10-06 16:43:15.119', '2019-10-06 16:43:15.119', '', NULL);
INSERT INTO `sys_job_log` VALUES (1296, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:43:30.106', '2019-10-06 16:43:30.106', '2019-10-06 16:43:30.106', '', NULL);
INSERT INTO `sys_job_log` VALUES (1297, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:43:45.117', '2019-10-06 16:43:45.117', '2019-10-06 16:43:45.117', '', NULL);
INSERT INTO `sys_job_log` VALUES (1298, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:44:00.058', '2019-10-06 16:44:00.058', '2019-10-06 16:44:00.058', '', NULL);
INSERT INTO `sys_job_log` VALUES (1299, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:44:15.072', '2019-10-06 16:44:15.072', '2019-10-06 16:44:15.072', '', NULL);
INSERT INTO `sys_job_log` VALUES (1300, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:44:30.029', '2019-10-06 16:44:30.029', '2019-10-06 16:44:30.029', '', NULL);
INSERT INTO `sys_job_log` VALUES (1301, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:44:45.073', '2019-10-06 16:44:45.073', '2019-10-06 16:44:45.073', '', NULL);
INSERT INTO `sys_job_log` VALUES (1302, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:45:00.277', '2019-10-06 16:45:00.277', '2019-10-06 16:45:00.277', '', NULL);
INSERT INTO `sys_job_log` VALUES (1303, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 16:45:15.089', '2019-10-06 16:45:15.091', '2019-10-06 16:45:15.091', '', NULL);
INSERT INTO `sys_job_log` VALUES (1304, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:45:30.058', '2019-10-06 16:45:30.058', '2019-10-06 16:45:30.058', '', NULL);
INSERT INTO `sys_job_log` VALUES (1305, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:45:45.022', '2019-10-06 16:45:45.022', '2019-10-06 16:45:45.022', '', NULL);
INSERT INTO `sys_job_log` VALUES (1306, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:46:00.065', '2019-10-06 16:46:00.066', '2019-10-06 16:46:00.066', '', NULL);
INSERT INTO `sys_job_log` VALUES (1307, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:46:15.097', '2019-10-06 16:46:15.097', '2019-10-06 16:46:15.097', '', NULL);
INSERT INTO `sys_job_log` VALUES (1308, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:46:30.077', '2019-10-06 16:46:30.078', '2019-10-06 16:46:30.078', '', NULL);
INSERT INTO `sys_job_log` VALUES (1309, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:46:45.102', '2019-10-06 16:46:45.102', '2019-10-06 16:46:45.102', '', NULL);
INSERT INTO `sys_job_log` VALUES (1310, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:47:00.061', '2019-10-06 16:47:00.061', '2019-10-06 16:47:00.061', '', NULL);
INSERT INTO `sys_job_log` VALUES (1311, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:47:15.067', '2019-10-06 16:47:15.068', '2019-10-06 16:47:15.068', '', NULL);
INSERT INTO `sys_job_log` VALUES (1312, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:47:30.248', '2019-10-06 16:47:30.248', '2019-10-06 16:47:30.248', '', NULL);
INSERT INTO `sys_job_log` VALUES (1313, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：1毫秒', '1', '2019-10-06 16:47:45.356', '2019-10-06 16:47:45.357', '2019-10-06 16:47:45.357', '', NULL);
INSERT INTO `sys_job_log` VALUES (1314, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:48:00.037', '2019-10-06 16:48:00.037', '2019-10-06 16:48:00.039', '', NULL);
INSERT INTO `sys_job_log` VALUES (1315, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:48:15.073', '2019-10-06 16:48:15.073', '2019-10-06 16:48:15.073', '', NULL);
INSERT INTO `sys_job_log` VALUES (1316, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：4毫秒', '1', '2019-10-06 16:48:30.075', '2019-10-06 16:48:30.079', '2019-10-06 16:48:30.079', '', NULL);
INSERT INTO `sys_job_log` VALUES (1317, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：6毫秒', '1', '2019-10-06 16:48:45.115', '2019-10-06 16:48:45.121', '2019-10-06 16:48:45.121', '', NULL);
INSERT INTO `sys_job_log` VALUES (1318, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:49:00.072', '2019-10-06 16:49:00.072', '2019-10-06 16:49:00.072', '', NULL);
INSERT INTO `sys_job_log` VALUES (1319, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：2毫秒', '1', '2019-10-06 16:49:15.126', '2019-10-06 16:49:15.128', '2019-10-06 16:49:15.128', '', NULL);
INSERT INTO `sys_job_log` VALUES (1320, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:49:30.049', '2019-10-06 16:49:30.049', '2019-10-06 16:49:30.049', '', NULL);
INSERT INTO `sys_job_log` VALUES (1321, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:49:45.043', '2019-10-06 16:49:45.043', '2019-10-06 16:49:45.043', '', NULL);
INSERT INTO `sys_job_log` VALUES (1322, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:50:00.191', '2019-10-06 16:50:00.191', '2019-10-06 16:50:00.191', '', NULL);
INSERT INTO `sys_job_log` VALUES (1323, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:50:15.060', '2019-10-06 16:50:15.060', '2019-10-06 16:50:15.060', '', NULL);
INSERT INTO `sys_job_log` VALUES (1324, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:50:30.022', '2019-10-06 16:50:30.022', '2019-10-06 16:50:30.022', '', NULL);
INSERT INTO `sys_job_log` VALUES (1325, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:50:45.121', '2019-10-06 16:50:45.121', '2019-10-06 16:50:45.121', '', NULL);
INSERT INTO `sys_job_log` VALUES (1326, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：4毫秒', '1', '2019-10-06 16:51:00.082', '2019-10-06 16:51:00.086', '2019-10-06 16:51:00.086', '', NULL);
INSERT INTO `sys_job_log` VALUES (1327, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:51:15.064', '2019-10-06 16:51:15.064', '2019-10-06 16:51:15.064', '', NULL);
INSERT INTO `sys_job_log` VALUES (1328, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:51:30.051', '2019-10-06 16:51:30.051', '2019-10-06 16:51:30.051', '', NULL);
INSERT INTO `sys_job_log` VALUES (1329, '系统默认（有参）', 'DEFAULT', 'simpleTask.doParams(\'albedo\')', '系统默认（有参） 总共耗时：0毫秒', '1', '2019-10-06 16:51:45.128', '2019-10-06 16:51:45.128', '2019-10-06 16:51:45.128', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_log_operate
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_operate`;
CREATE TABLE `sys_log_operate` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '日志标题',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `service_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '服务ID',
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'IP地址',
  `ip_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `user_agent` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '请求URI',
  `method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作方式',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '操作提交的数据',
  `time` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '执行时间',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `exception` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '异常信息',
  `created_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建者',
  `created_date` timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_log_create_by` (`created_by`) USING BTREE,
  KEY `sys_log_request_uri` (`request_uri`) USING BTREE,
  KEY `sys_log_create_date` (`created_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日志表';

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单ID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `permission` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单权限标识',
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '前端URL',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父菜单ID',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父菜单IDs',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `component` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'VUE页面',
  `keep_alive` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '是否显示1 是0否',
  `show` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '是否显示1 是0否',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单类型 （0菜单 1按钮）',
  `leaf` bit(1) DEFAULT b'0' COMMENT '1 叶子节点 0 非叶子节点',
  `sort` int(11) DEFAULT '1' COMMENT '排序值',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `version` int(11) NOT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('1000', '权限管理', NULL, '/upms', '-1', NULL, 'icon-quanxianguanli', 'Layout', '0', '1', '0', b'0', 10, '', '2018-09-28 08:29:53.000', '1', '2019-10-06 16:37:04.250', NULL, 10, '0');
INSERT INTO `sys_menu` VALUES ('1100', '用户管理', NULL, 'user', '1000', '1000,', 'icon-yonghuguanli', 'views/sys/user/index', '0', '1', '0', b'0', 10, '', '2017-11-02 22:24:37.000', '1', '2019-08-18 18:20:13.477', NULL, 8, '0');
INSERT INTO `sys_menu` VALUES ('1101', '用户编辑', 'sys_user_edit', NULL, '1100', NULL, NULL, NULL, '0', '1', '1', b'0', 30, '', '2017-11-08 09:52:09.000', NULL, '2019-08-08 13:23:14.225', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1102', '用户锁定', 'sys_user_lock', NULL, '1100', NULL, NULL, NULL, '0', '1', '1', b'0', 30, '', '2017-11-08 09:52:48.000', NULL, '2019-08-08 13:23:14.228', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1103', '用户删除', 'sys_user_del', NULL, '1100', NULL, NULL, NULL, '0', '1', '1', b'0', 30, '', '2017-11-08 09:54:01.000', NULL, '2019-08-08 13:23:14.231', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1200', '菜单管理', NULL, 'menu', '1000', '1000,', 'icon-caidanguanli', 'views/sys/menu/index', '0', '1', '0', b'0', 20, '', '2017-11-08 09:57:27.000', '1', '2019-10-06 16:37:04.500', NULL, 5, '0');
INSERT INTO `sys_menu` VALUES ('1201', '菜单编辑', 'sys_menu_edit', NULL, '1200', NULL, NULL, NULL, '0', '1', '1', b'0', 30, '', '2017-11-08 10:15:53.000', NULL, '2019-08-08 13:23:14.233', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1202', '菜单锁定', 'sys_menu_lock', NULL, '1200', NULL, NULL, NULL, '0', '1', '1', b'0', 30, '', '2017-11-08 10:16:23.000', NULL, '2019-08-08 13:23:14.235', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1203', '菜单删除', 'sys_menu_del', NULL, '1200', NULL, NULL, NULL, '0', '1', '1', b'0', 30, '', '2017-11-08 10:16:43.000', NULL, '2019-08-08 13:23:14.238', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1300', '角色管理', NULL, 'role', '1000', '1000,', 'icon-jiaoseguanli', 'views/sys/role/index', '0', '1', '0', b'0', 30, '', '2017-11-08 10:13:37.000', '1', '2019-08-18 18:20:13.500', NULL, 3, '0');
INSERT INTO `sys_menu` VALUES ('1301', '角色编辑', 'sys_role_edit', NULL, '1300', NULL, NULL, NULL, '0', '1', '1', b'0', 30, '', '2017-11-08 10:14:18.000', NULL, '2019-08-08 13:23:14.241', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1302', '角色锁定', 'sys_role_lock', NULL, '1300', NULL, NULL, NULL, '0', '1', '1', b'0', 30, '', '2017-11-08 10:14:41.000', NULL, '2019-08-08 13:23:14.243', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1303', '角色删除', 'sys_role_del', NULL, '1300', NULL, NULL, NULL, '0', '1', '1', b'0', 30, '', '2017-11-08 10:14:59.000', NULL, '2019-08-08 13:23:14.245', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1304', '角色查看', 'sys_role_view', NULL, '1300', '1300,', NULL, NULL, '0', '1', '1', b'1', 30, '', '2018-04-20 07:22:55.000', '1', '2019-08-07 17:28:17.093', NULL, 1, '0');
INSERT INTO `sys_menu` VALUES ('13093fb658c1806ad5bd0600316158f2', '操作日志导出', 'sys_logOperate_export', NULL, '2100', '2000,2100,', NULL, NULL, '0', '1', '1', b'1', 30, '1', '2019-08-07 17:50:46.973', '1', '2019-08-08 15:06:52.841', NULL, 1, '0');
INSERT INTO `sys_menu` VALUES ('1400', '部门管理', NULL, 'dept', '1000', NULL, 'icon-web-icon-', 'views/sys/dept/index', '0', '1', '0', b'0', 40, '', '2018-01-20 13:17:19.000', '1', '2019-08-18 18:20:13.508', NULL, 1, '0');
INSERT INTO `sys_menu` VALUES ('1401', '部门编辑', 'sys_dept_edit', NULL, '1400', NULL, NULL, NULL, '0', '1', '1', b'0', 30, '', '2018-01-20 14:56:16.000', NULL, '2019-08-08 13:23:14.247', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1402', '部门锁定', 'sys_dept_lock', NULL, '1400', NULL, NULL, NULL, '0', '1', '1', b'0', 30, '', '2018-01-20 14:56:59.000', NULL, '2019-08-08 13:23:14.249', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1403', '部门删除', 'sys_dept_del', NULL, '1400', NULL, NULL, NULL, '0', '1', '1', b'0', 30, '', '2018-01-20 14:57:28.000', NULL, '2019-08-08 13:23:14.251', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('18d6b5e0f6b986cd074bf23de11ecd34', '任务调度删除', 'quartz_job_del', NULL, '74f2b2a8871a298e0acc4d7129d10e9c', NULL, NULL, NULL, '0', '1', '1', b'0', 80, '1', '2019-08-14 10:36:47.091', '1', '2019-08-14 10:36:47.091', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('1a900c3f10ef5b0987e0a8ee4445316d', '用户查看', 'sys_user_view', NULL, '1100', '1000,1100,', NULL, NULL, '0', '1', '1', b'1', 10, '1', '2019-08-07 17:27:34.000', '1', '2019-08-09 10:55:47.709', NULL, 3, '0');
INSERT INTO `sys_menu` VALUES ('2000', '系统管理', NULL, '/sys', '-1', NULL, 'icon-xitongguanli', 'Layout', '0', '1', '0', b'0', 20, '', '2017-11-07 20:56:00.000', '1', '2019-08-11 16:50:05.967', NULL, 10, '0');
INSERT INTO `sys_menu` VALUES ('2100', '操作日志', NULL, 'log-operate', '2000', '2000,', 'icon-rizhiguanli', 'views/sys/log-operate/index', '0', '1', '0', b'0', 5, '', '2017-11-20 14:06:22.000', '1', '2019-08-08 15:06:52.834', NULL, 5, '0');
INSERT INTO `sys_menu` VALUES ('2101', '操作日志删除', 'sys_logOperate_del', NULL, '2100', '2000,2100,', NULL, NULL, '0', '1', '1', b'1', 30, '', '2017-11-20 20:37:37.000', '1', '2019-08-08 15:06:52.843', NULL, 2, '0');
INSERT INTO `sys_menu` VALUES ('2200', '字典管理', NULL, 'dict', '2000', NULL, 'icon-navicon-zdgl', 'views/sys/dict/index', '0', '1', '0', b'0', 6, '', '2017-11-29 11:30:52.000', NULL, '2019-07-26 13:36:48.667', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('2201', '字典删除', 'sys_dict_del', NULL, '2200', NULL, NULL, NULL, '0', '1', '1', b'0', 30, '', '2017-11-29 11:30:11.000', NULL, '2019-08-08 13:23:14.253', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('2202', '字典编辑', 'sys_dict_edit', NULL, '2200', NULL, NULL, NULL, '0', '1', '1', b'0', 30, '', '2018-05-11 22:34:55.000', NULL, '2019-08-08 13:23:14.256', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('23430df88fb72179c2a85c39eaf4d50b', '任务调度日志清空', 'quartz_job_log_clean', NULL, '74f2b2a8871a298e0acc4d7129d10e9c', '74f2b2a8871a298e0acc4d7129d10e9c,', NULL, NULL, '0', '1', '1', b'1', 30, '1', '2019-08-15 16:12:26.285', '1', '2019-08-15 16:12:26.285', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('247071d42ff40267c8d8c44eac92da67', '生成方案', NULL, 'scheme', '413892fe8d52c1163d6659f51299dc96', '413892fe8d52c1163d6659f51299dc96,', 'icon-appstore', 'views/gen/scheme/index', '0', '1', '0', b'0', 40, '1', '2019-07-21 13:27:35.000', '1', '2019-08-11 09:20:09.072', NULL, 18, '0');
INSERT INTO `sys_menu` VALUES ('2500', '服务接口', NULL, 'http://albedo-gateway:9999/swagger-ui.html', 'ef2382c0cc2d99ee73444e684237a88a', 'ef2382c0cc2d99ee73444e684237a88a,', 'icon-server', NULL, '0', '1', '0', b'1', 500, '', '2018-06-26 10:50:32.000', '1', '2019-08-11 16:44:57.184', NULL, 6, '0');
INSERT INTO `sys_menu` VALUES ('2600', '令牌管理', NULL, 'token', '2000', '2000,', 'icon-denglvlingpai', 'views/sys/token/index', '0', '1', '0', b'0', 11, '', '2018-09-04 05:58:41.000', '1', '2019-08-11 17:36:03.482', NULL, 8, '0');
INSERT INTO `sys_menu` VALUES ('2601', '令牌删除', 'sys_token_del', NULL, '2600', '2000,2600,', NULL, NULL, '0', '1', '1', b'1', 1, '', '2018-09-04 05:59:50.000', '1', '2019-08-11 17:35:57.367', NULL, 5, '0');
INSERT INTO `sys_menu` VALUES ('2725fff0793243a4fcc446281d3c75ee', '测试书籍删除', 'test_testBook_del', NULL, '717a8894bfb7a456d6729dd135da21d1', NULL, NULL, NULL, '0', '1', '1', b'0', 80, 'system', '2019-10-06 17:04:19.682', 'system', '2019-10-06 17:35:00.956', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('29de79df95e70d8e8fbdc7945acf214a', '任务调度查看', 'quartz_job_view', NULL, '74f2b2a8871a298e0acc4d7129d10e9c', NULL, NULL, NULL, '0', '1', '1', b'0', 20, '1', '2019-08-14 10:36:47.085', '1', '2019-08-14 10:36:47.085', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('2c8fdecfee63a310266b2e4b94fd3f4c', '任务调度日志删除', 'quartz_job_log_del', NULL, '74f2b2a8871a298e0acc4d7129d10e9c', '74f2b2a8871a298e0acc4d7129d10e9c,', NULL, NULL, '0', '1', '1', b'1', 30, '1', '2019-08-15 16:12:07.842', '1', '2019-08-15 16:12:07.842', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('34acb71268387bb85c80849f7377c7fd', '任务日志导出', 'quartz_jobLog_export', NULL, 'c93f8fca7ca6f8631d383b08ab67009a', '2000,c93f8fca7ca6f8631d383b08ab67009a,', NULL, NULL, '0', '1', '1', b'1', 40, '1', '2019-08-14 10:36:42.000', '1', '2019-08-15 09:47:37.769', NULL, 4, '0');
INSERT INTO `sys_menu` VALUES ('3c1c5a48888650b9a7ba5a1763f2e205', '任务日志查看', 'quartz_jobLog_view', NULL, 'c93f8fca7ca6f8631d383b08ab67009a', '2000,c93f8fca7ca6f8631d383b08ab67009a,', NULL, NULL, '0', '1', '1', b'1', 20, '1', '2019-08-14 10:36:42.000', '1', '2019-08-15 09:47:41.596', NULL, 4, '0');
INSERT INTO `sys_menu` VALUES ('413892fe8d52c1163d6659f51299dc96', '代码生成', NULL, '/gen', '-1', NULL, 'icon-weibiaoti46', 'Layout', '0', '1', '0', b'0', 100, '1', '2019-07-20 12:00:48.000', '1', '2019-08-11 08:49:50.093', NULL, 21, '0');
INSERT INTO `sys_menu` VALUES ('50cba7c58deb3d5d7fd30d41c592e316', '测试书籍查看', 'test_testBook_view', NULL, '646976384321c62829798e4ad46c83b1', NULL, NULL, NULL, '0', '1', '1', b'0', 20, 'system', '2019-10-06 17:35:01.127', 'system', '2019-10-06 17:35:01.127', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('52715698214e88cb09fa4dd1ea5ad348', '生成方案菜单', 'gen_scheme_menu', NULL, '247071d42ff40267c8d8c44eac92da67', '413892fe8d52c1163d6659f51299dc96,247071d42ff40267c8d8c44eac92da67,', NULL, NULL, '0', '1', '1', b'1', 30, '1', '2019-07-25 13:03:03.000', '1', '2019-08-11 09:20:09.081', NULL, 6, '0');
INSERT INTO `sys_menu` VALUES ('56dd476ad9362f9fa5a595aaa0890ac6', '测试书籍查看', 'test_testBook_view', NULL, '717a8894bfb7a456d6729dd135da21d1', NULL, NULL, NULL, '0', '1', '1', b'0', 20, 'system', '2019-10-06 17:04:19.673', 'system', '2019-10-06 17:35:00.956', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('5da31e19f05edeea6a7041e3101deefe', '任务日志删除', 'quartz_jobLog_del', NULL, 'c93f8fca7ca6f8631d383b08ab67009a', '2000,c93f8fca7ca6f8631d383b08ab67009a,', NULL, NULL, '0', '1', '1', b'1', 80, '1', '2019-08-14 10:36:42.000', '1', '2019-08-15 09:47:45.790', NULL, 4, '0');
INSERT INTO `sys_menu` VALUES ('621e50e1c7d66a1febeb699bebb2fe35', '任务调度执行', 'quartz_job_run', NULL, '74f2b2a8871a298e0acc4d7129d10e9c', '74f2b2a8871a298e0acc4d7129d10e9c,', NULL, NULL, '0', '1', '1', b'1', 30, '1', '2019-08-15 16:10:59.000', '1', '2019-08-15 16:11:07.125', NULL, 1, '0');
INSERT INTO `sys_menu` VALUES ('624508ccdd7e3ed944459cbc854daa0c', '测试书籍编辑', 'test_testBook_edit', NULL, '717a8894bfb7a456d6729dd135da21d1', NULL, NULL, NULL, '0', '1', '1', b'0', 40, 'system', '2019-10-06 17:04:19.678', 'system', '2019-10-06 17:35:00.956', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('646976384321c62829798e4ad46c83b1', '测试书籍', NULL, 'test-book', 'ef2382c0cc2d99ee73444e684237a88a', NULL, 'icon-right-square', 'views/test/test-book/index', '0', '1', '0', b'0', 30, 'system', '2019-10-06 17:35:01.118', 'system', '2019-10-06 17:35:01.118', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('717a8894bfb7a456d6729dd135da21d1', '测试书籍', NULL, 'test-book', '2000', NULL, 'icon-right-square', 'views/test/test-book/index', '0', '1', '0', b'0', 30, 'system', '2019-10-06 17:04:19.666', 'system', '2019-10-06 17:35:00.956', NULL, 0, '1');
INSERT INTO `sys_menu` VALUES ('74f2b2a8871a298e0acc4d7129d10e9c', '任务调度', NULL, 'job', '2000', NULL, 'icon-right-square', 'views/quartz/job/index', '0', '1', '0', b'0', 30, '1', '2019-08-14 10:36:47.081', '1', '2019-08-18 11:31:36.451', NULL, 7, '0');
INSERT INTO `sys_menu` VALUES ('76d6087052dc26b32f3efa71b9cc119b', '任务调度日志', 'quartz_job_log_view', NULL, '74f2b2a8871a298e0acc4d7129d10e9c', '74f2b2a8871a298e0acc4d7129d10e9c,', NULL, NULL, '0', '1', '1', b'1', 30, '1', '2019-08-15 16:11:30.986', '1', '2019-08-15 16:11:30.986', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('7b14af9e9fbff286856338a194422b07', '令牌查看', 'sys_token_view', NULL, '2600', '2000,2600,', NULL, NULL, '0', '1', '1', b'1', 30, '1', '2019-08-08 09:44:25.000', '1', '2019-08-11 17:36:03.491', NULL, 3, '0');
INSERT INTO `sys_menu` VALUES ('7c7a876f4cceba2dd92aa539dea6b6e5', '任务日志清空', 'quartz_jobLog_clean', NULL, 'c93f8fca7ca6f8631d383b08ab67009a', '2000,c93f8fca7ca6f8631d383b08ab67009a,', NULL, NULL, '0', '1', '1', b'1', 30, '1', '2019-08-15 13:55:37.892', '1', '2019-08-15 13:55:37.892', NULL, 1, '0');
INSERT INTO `sys_menu` VALUES ('825f7504bb7932eec7b19716c9afea0f', '服务监控', NULL, 'http://localhost:5001', 'ef2382c0cc2d99ee73444e684237a88a', 'ef2382c0cc2d99ee73444e684237a88a,', 'icon-sliders-fill', NULL, '0', '1', '0', b'1', 30, '1', '2019-08-11 17:39:04.000', '1', '2019-10-06 16:28:39.575', NULL, 4, '0');
INSERT INTO `sys_menu` VALUES ('94b57a562063d103423e2c6125cb30ad', '菜单查看', 'sys_menu_view', NULL, '1200', '1200,', NULL, NULL, '0', '1', '1', b'1', 30, '1', '2019-08-07 17:27:59.697', '1', '2019-10-06 16:37:04.569', NULL, 2, '0');
INSERT INTO `sys_menu` VALUES ('9763343d9cce11ce9eb4f21c8e49122b', '任务调度编辑', 'quartz_job_edit', NULL, '74f2b2a8871a298e0acc4d7129d10e9c', NULL, NULL, NULL, '0', '1', '1', b'0', 40, '1', '2019-08-14 10:36:47.088', '1', '2019-08-14 10:36:47.088', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('97722c6d56c8b9990cc3c1a6eea3d6bb', '业务表编辑', 'gen_table_edit', 'edit', 'a18b33e15bde209a3c9115517c56d9ec', '413892fe8d52c1163d6659f51299dc96,a18b33e15bde209a3c9115517c56d9ec,', NULL, 'views/gen/table/edit', '0', '1', '2', b'1', 30, '1', '2019-07-21 13:24:02.000', '1', '2019-08-08 15:21:18.115', NULL, 5, '0');
INSERT INTO `sys_menu` VALUES ('9f5d2978e7d7e83a3bda05459bac4454', '测试书籍编辑', 'test_testBook_edit', NULL, '646976384321c62829798e4ad46c83b1', NULL, NULL, NULL, '0', '1', '1', b'0', 40, 'system', '2019-10-06 17:35:01.166', 'system', '2019-10-06 17:35:01.166', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('a18b33e15bde209a3c9115517c56d9ec', '业务表', '', 'table', '413892fe8d52c1163d6659f51299dc96', '413892fe8d52c1163d6659f51299dc96,', 'icon-table', 'views/gen/table/index', '0', '1', '0', b'0', 30, '1', '2019-07-20 12:02:02.000', '1', '2019-08-11 08:47:39.824', NULL, 17, '0');
INSERT INTO `sys_menu` VALUES ('b2e04986c136e5ff0efe72f83cd11464', '测试书籍删除', 'test_testBook_del', NULL, '646976384321c62829798e4ad46c83b1', NULL, NULL, NULL, '0', '1', '1', b'0', 80, 'system', '2019-10-06 17:35:01.211', 'system', '2019-10-06 17:35:01.211', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('b961670cbf3454f5927c4bd2a327e915', '生成方案删除', 'gen_scheme_del', NULL, '247071d42ff40267c8d8c44eac92da67', '413892fe8d52c1163d6659f51299dc96,247071d42ff40267c8d8c44eac92da67,', NULL, NULL, '0', '1', '1', b'1', 30, '1', '2019-07-21 13:30:18.000', '1', '2019-08-11 08:50:09.304', NULL, 6, '0');
INSERT INTO `sys_menu` VALUES ('b963a451117f430703817b3b6c87402a', '任务调度日志导出', 'quartz_job_log_export', NULL, '74f2b2a8871a298e0acc4d7129d10e9c', '74f2b2a8871a298e0acc4d7129d10e9c,', NULL, NULL, '0', '1', '1', b'1', 30, '1', '2019-08-15 16:13:16.742', '1', '2019-08-15 16:13:16.742', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('bb9dd4b7a2a462193d0f01517308f812', '业务表查看', 'gen_table_view', NULL, 'a18b33e15bde209a3c9115517c56d9ec', '413892fe8d52c1163d6659f51299dc96,a18b33e15bde209a3c9115517c56d9ec,', NULL, NULL, '0', '1', '1', b'1', 30, '1', '2019-08-11 08:47:39.828', '1', '2019-08-11 08:47:39.828', NULL, 0, '0');
INSERT INTO `sys_menu` VALUES ('bd62904371247f56594741ff8e9bded9', '用户管理导入', 'sys_user_import', NULL, '1100', '1000,1100,', NULL, NULL, '0', '1', '1', b'1', 80, '1', '2019-08-07 17:50:02.000', '1', '2019-08-09 10:55:47.711', NULL, 3, '0');
INSERT INTO `sys_menu` VALUES ('c93f8fca7ca6f8631d383b08ab67009a', '任务日志', NULL, 'job-log', '2000', '2000,', 'icon-right-square', 'views/quartz/job-log/index', '0', '0', '0', b'0', 60, '1', '2019-08-14 10:36:42.000', '1', '2019-08-18 11:31:36.462', NULL, 9, '0');
INSERT INTO `sys_menu` VALUES ('caaec41413c5713c6f290efe08c11415', '生成方案查看', 'gen_scheme_view', NULL, '247071d42ff40267c8d8c44eac92da67', '413892fe8d52c1163d6659f51299dc96,247071d42ff40267c8d8c44eac92da67,', NULL, NULL, '0', '1', '1', b'1', 30, '1', '2019-08-11 08:48:09.000', '1', '2019-08-11 08:50:16.065', NULL, 3, '0');
INSERT INTO `sys_menu` VALUES ('d4c16faad8f883650a3a8eab829ebad9', '操作日志查看', 'sys_logOperate_view', NULL, '2100', '2000,2100,', NULL, NULL, '0', '1', '1', b'1', 30, '1', '2019-08-07 17:51:38.454', '1', '2019-08-08 15:06:52.844', NULL, 1, '0');
INSERT INTO `sys_menu` VALUES ('e086c4aa4943a883b29cf94680608b89', '生成方案代码', 'gen_scheme_code', NULL, '247071d42ff40267c8d8c44eac92da67', '413892fe8d52c1163d6659f51299dc96,247071d42ff40267c8d8c44eac92da67,', NULL, NULL, '0', '1', '1', b'1', 30, '1', '2019-08-11 08:55:37.000', '1', '2019-08-11 09:19:50.418', NULL, 1, '0');
INSERT INTO `sys_menu` VALUES ('e5ea38c1f97dee0043e78f3fb27b25d6', '生成方案编辑', 'gen_scheme_edit', NULL, '247071d42ff40267c8d8c44eac92da67', '413892fe8d52c1163d6659f51299dc96,247071d42ff40267c8d8c44eac92da67,', NULL, NULL, '0', '1', '1', b'1', 30, '1', '2019-07-21 13:29:14.000', '1', '2019-08-05 15:54:01.914', NULL, 4, '0');
INSERT INTO `sys_menu` VALUES ('e710a66583fe0e324492462adb16014e', '业务表删除', 'gen_table_del', NULL, 'a18b33e15bde209a3c9115517c56d9ec', '413892fe8d52c1163d6659f51299dc96,a18b33e15bde209a3c9115517c56d9ec,', NULL, NULL, '0', '1', '1', b'1', 30, '1', '2019-07-21 13:24:45.000', '1', '2019-07-25 13:32:11.051', NULL, 1, '0');
INSERT INTO `sys_menu` VALUES ('ec1ff71a4dd5318b6def9b2be47a95e1', '流量监控', NULL, 'http://localhost:8858', 'ef2382c0cc2d99ee73444e684237a88a', 'ef2382c0cc2d99ee73444e684237a88a,', 'icon-monitor', NULL, '0', '1', '0', b'1', 30, '1', '2019-10-06 16:26:53.000', '1', '2019-10-06 16:31:42.684', NULL, 3, '0');
INSERT INTO `sys_menu` VALUES ('ef2382c0cc2d99ee73444e684237a88a', '资源管理', NULL, '/admin', '-1', NULL, 'icon-barchart', 'Layout', '0', '1', '0', b'0', 30, '1', '2019-08-05 15:58:12.000', '1', '2019-10-06 16:31:42.672', NULL, 26, '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_oauth_client_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_detail`;
CREATE TABLE `sys_oauth_client_detail` (
  `client_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '客户端ID',
  `resource_ids` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源ID',
  `client_secret` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '客户端密钥',
  `scope` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '作用域',
  `authorized_grant_types` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '授权方式',
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '重定向地址',
  `authorities` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限',
  `access_token_validity` int(11) DEFAULT NULL COMMENT '请求令牌有效时间',
  `refresh_token_validity` int(11) DEFAULT NULL COMMENT '刷新令牌有效时间',
  `additional_information` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展信息',
  `autoapprove` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否自动放行',
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='终端信息表';

-- ----------------------------
-- Records of sys_oauth_client_detail
-- ----------------------------
BEGIN;
INSERT INTO `sys_oauth_client_detail` VALUES ('albedo', NULL, 'albedo', 'server', 'password,refresh_token,authorization_code,client_credentials', 'http://localhost:4040/sso1/login,http://localhost:4041/sso1/login', NULL, NULL, NULL, NULL, 'true');
INSERT INTO `sys_oauth_client_detail` VALUES ('app', NULL, 'app', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');
INSERT INTO `sys_oauth_client_detail` VALUES ('daemon', NULL, 'daemon', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');
INSERT INTO `sys_oauth_client_detail` VALUES ('gen', NULL, 'gen', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');
INSERT INTO `sys_oauth_client_detail` VALUES ('swagger', NULL, 'swagger', 'all', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据权限 1全部 2所在机构及以下数据  3 所在机构数据  4仅本人数据 5 按明细设置',
  `available` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '1' COMMENT '1-正常，0-锁定',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3),
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `version` int(11) NOT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `role_idx1_role_code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('1', '管理员', 'ROLE_ADMIN', '管理员', '1', '1', '', '2017-10-29 15:45:51.000', '1', '2019-10-06 17:55:15.163', NULL, 60, '0');
INSERT INTO `sys_role` VALUES ('2', 'ROLE_CQQ', 'ROLE_CQQ', 'ROLE_CQQ', '5', '1', '', '2018-11-11 19:42:26.000', '1', '2019-10-06 17:58:31.314', NULL, 15, '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色ID',
  `dept_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色与部门对应关系';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` VALUES ('0f9d6872dcbf316c9b6272a04cba11a2', '2', '4');
INSERT INTO `sys_role_dept` VALUES ('412c8b665359ed083a0f58bd6236a281', '2', '5');
INSERT INTO `sys_role_dept` VALUES ('7b8f11954c54daf127b4c7287d5f691f', '2', '3');
INSERT INTO `sys_role_dept` VALUES ('a7658322bd5b6b3f7f3a861706ec349e', '1', '8');
INSERT INTO `sys_role_dept` VALUES ('aeb43c2ce9e64f1c523c16c1d31ae95b', '2', '1');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `menu_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色菜单表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES ('1', '1000');
INSERT INTO `sys_role_menu` VALUES ('1', '1100');
INSERT INTO `sys_role_menu` VALUES ('1', '1101');
INSERT INTO `sys_role_menu` VALUES ('1', '1102');
INSERT INTO `sys_role_menu` VALUES ('1', '1103');
INSERT INTO `sys_role_menu` VALUES ('1', '1200');
INSERT INTO `sys_role_menu` VALUES ('1', '1201');
INSERT INTO `sys_role_menu` VALUES ('1', '1202');
INSERT INTO `sys_role_menu` VALUES ('1', '1203');
INSERT INTO `sys_role_menu` VALUES ('1', '1300');
INSERT INTO `sys_role_menu` VALUES ('1', '1301');
INSERT INTO `sys_role_menu` VALUES ('1', '1302');
INSERT INTO `sys_role_menu` VALUES ('1', '1303');
INSERT INTO `sys_role_menu` VALUES ('1', '1304');
INSERT INTO `sys_role_menu` VALUES ('1', '13093fb658c1806ad5bd0600316158f2');
INSERT INTO `sys_role_menu` VALUES ('1', '1400');
INSERT INTO `sys_role_menu` VALUES ('1', '1401');
INSERT INTO `sys_role_menu` VALUES ('1', '1402');
INSERT INTO `sys_role_menu` VALUES ('1', '1403');
INSERT INTO `sys_role_menu` VALUES ('1', '18d6b5e0f6b986cd074bf23de11ecd34');
INSERT INTO `sys_role_menu` VALUES ('1', '1a900c3f10ef5b0987e0a8ee4445316d');
INSERT INTO `sys_role_menu` VALUES ('1', '2000');
INSERT INTO `sys_role_menu` VALUES ('1', '2100');
INSERT INTO `sys_role_menu` VALUES ('1', '2101');
INSERT INTO `sys_role_menu` VALUES ('1', '2200');
INSERT INTO `sys_role_menu` VALUES ('1', '2201');
INSERT INTO `sys_role_menu` VALUES ('1', '2202');
INSERT INTO `sys_role_menu` VALUES ('1', '23430df88fb72179c2a85c39eaf4d50b');
INSERT INTO `sys_role_menu` VALUES ('1', '247071d42ff40267c8d8c44eac92da67');
INSERT INTO `sys_role_menu` VALUES ('1', '2500');
INSERT INTO `sys_role_menu` VALUES ('1', '2600');
INSERT INTO `sys_role_menu` VALUES ('1', '2601');
INSERT INTO `sys_role_menu` VALUES ('1', '29de79df95e70d8e8fbdc7945acf214a');
INSERT INTO `sys_role_menu` VALUES ('1', '2c8fdecfee63a310266b2e4b94fd3f4c');
INSERT INTO `sys_role_menu` VALUES ('1', '34acb71268387bb85c80849f7377c7fd');
INSERT INTO `sys_role_menu` VALUES ('1', '3c1c5a48888650b9a7ba5a1763f2e205');
INSERT INTO `sys_role_menu` VALUES ('1', '413892fe8d52c1163d6659f51299dc96');
INSERT INTO `sys_role_menu` VALUES ('1', '52715698214e88cb09fa4dd1ea5ad348');
INSERT INTO `sys_role_menu` VALUES ('1', '5da31e19f05edeea6a7041e3101deefe');
INSERT INTO `sys_role_menu` VALUES ('1', '621e50e1c7d66a1febeb699bebb2fe35');
INSERT INTO `sys_role_menu` VALUES ('1', '74f2b2a8871a298e0acc4d7129d10e9c');
INSERT INTO `sys_role_menu` VALUES ('1', '76d6087052dc26b32f3efa71b9cc119b');
INSERT INTO `sys_role_menu` VALUES ('1', '7b14af9e9fbff286856338a194422b07');
INSERT INTO `sys_role_menu` VALUES ('1', '7c7a876f4cceba2dd92aa539dea6b6e5');
INSERT INTO `sys_role_menu` VALUES ('1', '825f7504bb7932eec7b19716c9afea0f');
INSERT INTO `sys_role_menu` VALUES ('1', '94b57a562063d103423e2c6125cb30ad');
INSERT INTO `sys_role_menu` VALUES ('1', '9763343d9cce11ce9eb4f21c8e49122b');
INSERT INTO `sys_role_menu` VALUES ('1', '97722c6d56c8b9990cc3c1a6eea3d6bb');
INSERT INTO `sys_role_menu` VALUES ('1', 'a18b33e15bde209a3c9115517c56d9ec');
INSERT INTO `sys_role_menu` VALUES ('1', 'b961670cbf3454f5927c4bd2a327e915');
INSERT INTO `sys_role_menu` VALUES ('1', 'b963a451117f430703817b3b6c87402a');
INSERT INTO `sys_role_menu` VALUES ('1', 'bb9dd4b7a2a462193d0f01517308f812');
INSERT INTO `sys_role_menu` VALUES ('1', 'bd62904371247f56594741ff8e9bded9');
INSERT INTO `sys_role_menu` VALUES ('1', 'c93f8fca7ca6f8631d383b08ab67009a');
INSERT INTO `sys_role_menu` VALUES ('1', 'caaec41413c5713c6f290efe08c11415');
INSERT INTO `sys_role_menu` VALUES ('1', 'd4c16faad8f883650a3a8eab829ebad9');
INSERT INTO `sys_role_menu` VALUES ('1', 'e086c4aa4943a883b29cf94680608b89');
INSERT INTO `sys_role_menu` VALUES ('1', 'e5ea38c1f97dee0043e78f3fb27b25d6');
INSERT INTO `sys_role_menu` VALUES ('1', 'e710a66583fe0e324492462adb16014e');
INSERT INTO `sys_role_menu` VALUES ('1', 'ec1ff71a4dd5318b6def9b2be47a95e1');
INSERT INTO `sys_role_menu` VALUES ('1', 'ef2382c0cc2d99ee73444e684237a88a');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1100');
INSERT INTO `sys_role_menu` VALUES ('2', '1101');
INSERT INTO `sys_role_menu` VALUES ('2', '1102');
INSERT INTO `sys_role_menu` VALUES ('2', '1103');
INSERT INTO `sys_role_menu` VALUES ('2', '1200');
INSERT INTO `sys_role_menu` VALUES ('2', '1201');
INSERT INTO `sys_role_menu` VALUES ('2', '1202');
INSERT INTO `sys_role_menu` VALUES ('2', '1203');
INSERT INTO `sys_role_menu` VALUES ('2', '1300');
INSERT INTO `sys_role_menu` VALUES ('2', '1301');
INSERT INTO `sys_role_menu` VALUES ('2', '1302');
INSERT INTO `sys_role_menu` VALUES ('2', '1303');
INSERT INTO `sys_role_menu` VALUES ('2', '1304');
INSERT INTO `sys_role_menu` VALUES ('2', '1400');
INSERT INTO `sys_role_menu` VALUES ('2', '1401');
INSERT INTO `sys_role_menu` VALUES ('2', '1402');
INSERT INTO `sys_role_menu` VALUES ('2', '1403');
INSERT INTO `sys_role_menu` VALUES ('2', 'e5ea38c1f97dee0043e78f3fb27b25d6');
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '1' COMMENT '主键ID',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '随机盐',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '简介',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像',
  `dept_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门ID',
  `qq_open_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'QQ openid',
  `wx_open_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '微信openid',
  `available` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '1' COMMENT '1-正常，0-锁定',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `version` int(11) NOT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_wx_openid` (`wx_open_id`) USING BTREE,
  KEY `user_qq_openid` (`qq_open_id`) USING BTREE,
  KEY `user_idx1_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', 'admin', '$2a$10$81JhU58/uM.JmWKiCAcxoOiSS///NT6rXbSRATa.UgGG8stlA1ABy', NULL, '17034642999', NULL, '', '1', NULL, 'o_0FT0uyg_H1vVy2H0JpSwlVGhWQ', '1', '', '2018-04-20 07:15:18.000', '1', '2019-08-11 17:31:05.678', NULL, 9, '0');
INSERT INTO `sys_user` VALUES ('53fb3761bdd95ed3d03f4a07f78ea0eb', 'dsafdf', '$2a$10$81JhU58/uM.JmWKiCAcxoOiSS///NT6rXbSRATa.UgGG8stlA1ABy', NULL, '12343543432', '837158@qq.com', NULL, '3', NULL, NULL, '1', '1', '2019-07-07 14:32:17.000', '1', '2019-07-13 01:38:33.000', NULL, 19, '1');
INSERT INTO `sys_user` VALUES ('90da0206c39867a1b36ac36ced80c1a9', 'test', '$2a$10$NmGuhLe7ODgRC0cwHPa0IuJh94uFYGrAMCyndqMwX07s.CH18RmlS', NULL, NULL, NULL, NULL, '3', NULL, NULL, '1', '1', '2019-07-07 14:35:13.000', '1', '2019-10-06 17:03:21.025', NULL, 39, '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `session_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登录ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录账号',
  `dept_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部门ID',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'IP',
  `ip_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'IP地址',
  `user_agent` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户代理',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='在线用户记录';

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('90da0206c39867a1b36ac36ced80c1a9', '1');
COMMIT;

-- ----------------------------
-- Table structure for test_book
-- ----------------------------
DROP TABLE IF EXISTS `test_book`;
CREATE TABLE `test_book` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `author_` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `name_` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `email_` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `phone_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机',
  `activated_` bit(1) NOT NULL,
  `number_` int(11) DEFAULT NULL COMMENT 'key',
  `money_` decimal(20,2) DEFAULT NULL,
  `amount_` double(11,2) DEFAULT NULL,
  `reset_date` timestamp(3) NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_modified_date` timestamp(3) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='测试书籍';

-- ----------------------------
-- Table structure for test_tree_book
-- ----------------------------
DROP TABLE IF EXISTS `test_tree_book`;
CREATE TABLE `test_tree_book` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父菜单IDs',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `leaf` bit(1) DEFAULT b'0' COMMENT '1 叶子节点 0 非叶子节点',
  `author_` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `email_` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `phone_` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机',
  `activated_` bit(1) NOT NULL,
  `number_` int(11) DEFAULT NULL COMMENT 'key',
  `money_` decimal(20,2) DEFAULT NULL,
  `amount_` double(11,2) DEFAULT NULL,
  `reset_date` timestamp(3) NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` timestamp(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `last_modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  `last_modified_date` timestamp(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
  `version` int(11) NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='  测试树书';

-- ----------------------------
-- Table structure for zipkin_annotations
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_annotations`;
CREATE TABLE `zipkin_annotations` (
  `trace_id_high` bigint(20) NOT NULL DEFAULT '0' COMMENT 'If non zero, this means the trace uses 128 bit traceIds instead of 64 bit',
  `trace_id` bigint(20) NOT NULL COMMENT 'coincides with zipkin_spans.trace_id',
  `span_id` bigint(20) NOT NULL COMMENT 'coincides with zipkin_spans.id',
  `a_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'BinaryAnnotation.key or Annotation.value if type == -1',
  `a_value` blob COMMENT 'BinaryAnnotation.value(), which must be smaller than 64KB',
  `a_type` int(11) NOT NULL COMMENT 'BinaryAnnotation.type() or -1 if Annotation',
  `a_timestamp` bigint(20) DEFAULT NULL COMMENT 'Used to implement TTL; Annotation.timestamp or zipkin_spans.timestamp',
  `endpoint_ipv4` int(11) DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
  `endpoint_ipv6` binary(16) DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null, or no IPv6 address',
  `endpoint_port` smallint(6) DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
  `endpoint_service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
  UNIQUE KEY `trace_id_high` (`trace_id_high`,`trace_id`,`span_id`,`a_key`,`a_timestamp`) USING BTREE COMMENT 'Ignore insert on duplicate',
  UNIQUE KEY `trace_id_high_4` (`trace_id_high`,`trace_id`,`span_id`,`a_key`,`a_timestamp`) USING BTREE COMMENT 'Ignore insert on duplicate',
  KEY `trace_id_high_2` (`trace_id_high`,`trace_id`,`span_id`) USING BTREE COMMENT 'for joining with zipkin_spans',
  KEY `trace_id_high_3` (`trace_id_high`,`trace_id`) USING BTREE COMMENT 'for getTraces/ByIds',
  KEY `endpoint_service_name` (`endpoint_service_name`) USING BTREE COMMENT 'for getTraces and getServiceNames',
  KEY `a_type` (`a_type`) USING BTREE COMMENT 'for getTraces and autocomplete values',
  KEY `a_key` (`a_key`) USING BTREE COMMENT 'for getTraces and autocomplete values',
  KEY `trace_id` (`trace_id`,`span_id`,`a_key`) USING BTREE COMMENT 'for dependencies job',
  KEY `trace_id_high_5` (`trace_id_high`,`trace_id`,`span_id`) USING BTREE COMMENT 'for joining with zipkin_spans',
  KEY `trace_id_high_6` (`trace_id_high`,`trace_id`) USING BTREE COMMENT 'for getTraces/ByIds',
  KEY `endpoint_service_name_2` (`endpoint_service_name`) USING BTREE COMMENT 'for getTraces and getServiceNames',
  KEY `a_type_2` (`a_type`) USING BTREE COMMENT 'for getTraces and autocomplete values',
  KEY `a_key_2` (`a_key`) USING BTREE COMMENT 'for getTraces and autocomplete values',
  KEY `trace_id_2` (`trace_id`,`span_id`,`a_key`) USING BTREE COMMENT 'for dependencies job'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- ----------------------------
-- Records of zipkin_annotations
-- ----------------------------
BEGIN;
INSERT INTO `zipkin_annotations` VALUES (0, -1311477175517260020, -4135916356677102999, 'cs', NULL, -1, 1570342915257369, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1311477175517260020, -4135916356677102999, 'cr', NULL, -1, 1570342915297964, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1311477175517260020, -4135916356677102999, 'http.method', 0x504F5354, 6, 1570342915257369, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1311477175517260020, -4135916356677102999, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570342915257369, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1311477175517260020, -6011703719044636176, 'sr', NULL, -1, 1570342915256078, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1311477175517260020, -6011703719044636176, 'ss', NULL, -1, 1570342915381277, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1311477175517260020, -6011703719044636176, 'ca', 0x01, 0, 1570342915256078, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -1311477175517260020, -6011703719044636176, 'http.method', 0x474554, 6, 1570342915256078, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1311477175517260020, -6011703719044636176, 'http.path', 0x2F726F6C652F636F6D626F2D64617461, 6, 1570342915256078, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1311477175517260020, -6011703719044636176, 'mvc.controller.class', 0x526F6C655265736F75726365, 6, 1570342915256078, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1311477175517260020, -6011703719044636176, 'mvc.controller.method', 0x636F6D626F44617461, 6, 1570342915256078, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 263136038163893578, 7740029919066051079, 'cs', NULL, -1, 1570342917864249, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 263136038163893578, 7740029919066051079, 'cr', NULL, -1, 1570342917892563, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 263136038163893578, 7740029919066051079, 'http.method', 0x504F5354, 6, 1570342917864249, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 263136038163893578, 7740029919066051079, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570342917864249, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 263136038163893578, -7532825404173961437, 'sr', NULL, -1, 1570342917861525, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 263136038163893578, -7532825404173961437, 'ss', NULL, -1, 1570342917927712, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 263136038163893578, -7532825404173961437, 'ca', 0x01, 0, 1570342917861525, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 263136038163893578, -7532825404173961437, 'http.method', 0x474554, 6, 1570342917861525, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 263136038163893578, -7532825404173961437, 'http.path', 0x2F646570742F757365722D74726565, 6, 1570342917861525, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 263136038163893578, -7532825404173961437, 'mvc.controller.class', 0x446570745265736F75726365, 6, 1570342917861525, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 263136038163893578, -7532825404173961437, 'mvc.controller.method', 0x6C69737443757272656E7455736572446570745472656573, 6, 1570342917861525, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8774044539550961860, 5901510800400655408, 'cs', NULL, -1, 1570342920891078, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8774044539550961860, 5901510800400655408, 'cr', NULL, -1, 1570342920910416, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8774044539550961860, 5901510800400655408, 'http.method', 0x504F5354, 6, 1570342920891078, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8774044539550961860, 5901510800400655408, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570342920891078, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8774044539550961860, -8271169407139203534, 'sr', NULL, -1, 1570342920890141, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8774044539550961860, -8271169407139203534, 'ss', NULL, -1, 1570342920992413, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8774044539550961860, -8271169407139203534, 'ca', 0x01, 0, 1570342920890141, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -8774044539550961860, -8271169407139203534, 'http.method', 0x474554, 6, 1570342920890141, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8774044539550961860, -8271169407139203534, 'http.path', 0x2F6C6F672D6F7065726174652F, 6, 1570342920890141, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8774044539550961860, -8271169407139203534, 'mvc.controller.class', 0x4C6F674F7065726174655265736F75726365, 6, 1570342920890141, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8774044539550961860, -8271169407139203534, 'mvc.controller.method', 0x67657450616765, 6, 1570342920890141, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3572073428785154189, 2348464483063558439, 'cs', NULL, -1, 1570342987487147, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3572073428785154189, 2348464483063558439, 'cr', NULL, -1, 1570342987511528, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3572073428785154189, 2348464483063558439, 'http.method', 0x504F5354, 6, 1570342987487147, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3572073428785154189, 2348464483063558439, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570342987487147, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3572073428785154189, 3011068575621052770, 'sr', NULL, -1, 1570342987486088, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3572073428785154189, 3011068575621052770, 'ss', NULL, -1, 1570342987536369, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3572073428785154189, 3011068575621052770, 'ca', 0x01, 0, 1570342987486088, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 3572073428785154189, 3011068575621052770, 'http.method', 0x474554, 6, 1570342987486088, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3572073428785154189, 3011068575621052770, 'http.path', 0x2F6C6F672D6F7065726174652F, 6, 1570342987486088, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3572073428785154189, 3011068575621052770, 'mvc.controller.class', 0x4C6F674F7065726174655265736F75726365, 6, 1570342987486088, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3572073428785154189, 3011068575621052770, 'mvc.controller.method', 0x67657450616765, 6, 1570342987486088, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -175846299125394258, 6064403489398866333, 'cs', NULL, -1, 1570342988649092, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -175846299125394258, 6064403489398866333, 'cr', NULL, -1, 1570342988664426, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -175846299125394258, 6064403489398866333, 'http.method', 0x504F5354, 6, 1570342988649092, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -175846299125394258, 6064403489398866333, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570342988649092, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -175846299125394258, 7264064309960648424, 'sr', NULL, -1, 1570342988647097, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -175846299125394258, 7264064309960648424, 'ss', NULL, -1, 1570342988676815, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -175846299125394258, 7264064309960648424, 'ca', 0x01, 0, 1570342988647097, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -175846299125394258, 7264064309960648424, 'http.method', 0x474554, 6, 1570342988647097, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -175846299125394258, 7264064309960648424, 'http.path', 0x2F726F6C652F636F6D626F2D64617461, 6, 1570342988647097, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -175846299125394258, 7264064309960648424, 'mvc.controller.class', 0x526F6C655265736F75726365, 6, 1570342988647097, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -175846299125394258, 7264064309960648424, 'mvc.controller.method', 0x636F6D626F44617461, 6, 1570342988647097, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3759610814858526023, -1427032647807353880, 'cs', NULL, -1, 1570342989313101, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3759610814858526023, -1427032647807353880, 'cr', NULL, -1, 1570342989325619, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3759610814858526023, -1427032647807353880, 'http.method', 0x504F5354, 6, 1570342989313101, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3759610814858526023, -1427032647807353880, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570342989313101, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3759610814858526023, -3035361835060797064, 'sr', NULL, -1, 1570342989312128, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3759610814858526023, -3035361835060797064, 'ss', NULL, -1, 1570342989516825, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3759610814858526023, -3035361835060797064, 'ca', 0x01, 0, 1570342989312128, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -3759610814858526023, -3035361835060797064, 'http.method', 0x474554, 6, 1570342989312128, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3759610814858526023, -3035361835060797064, 'http.path', 0x2F6D656E752F, 6, 1570342989312128, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3759610814858526023, -3035361835060797064, 'mvc.controller.class', 0x4D656E755265736F75726365, 6, 1570342989312128, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3759610814858526023, -3035361835060797064, 'mvc.controller.method', 0x67657450616765, 6, 1570342989312128, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6851193846860752091, -854480872596386926, 'cs', NULL, -1, 1570343076422081, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6851193846860752091, -854480872596386926, 'cr', NULL, -1, 1570343076438978, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6851193846860752091, -854480872596386926, 'http.method', 0x504F5354, 6, 1570343076422081, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6851193846860752091, -854480872596386926, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570343076422081, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6851193846860752091, -1612965059061589855, 'sr', NULL, -1, 1570343076420117, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6851193846860752091, -1612965059061589855, 'ss', NULL, -1, 1570343076455947, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6851193846860752091, -1612965059061589855, 'ca', 0x01, 0, 1570343076420117, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -6851193846860752091, -1612965059061589855, 'http.method', 0x474554, 6, 1570343076420117, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6851193846860752091, -1612965059061589855, 'http.path', 0x2F646570742F74726565, 6, 1570343076420117, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6851193846860752091, -1612965059061589855, 'mvc.controller.class', 0x446570745265736F75726365, 6, 1570343076420117, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6851193846860752091, -1612965059061589855, 'mvc.controller.method', 0x6C697374446570745472656573, 6, 1570343076420117, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5827841547953027486, 8474263428810279882, 'cs', NULL, -1, 1570343247980142, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5827841547953027486, 8474263428810279882, 'cr', NULL, -1, 1570343248002827, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5827841547953027486, 8474263428810279882, 'http.method', 0x504F5354, 6, 1570343247980142, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5827841547953027486, 8474263428810279882, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570343247980142, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5827841547953027486, -959917097985667214, 'sr', NULL, -1, 1570343247977313, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5827841547953027486, -959917097985667214, 'ss', NULL, -1, 1570343248109227, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5827841547953027486, -959917097985667214, 'ca', 0x01, 0, 1570343247977313, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -5827841547953027486, -959917097985667214, 'http.method', 0x474554, 6, 1570343247977313, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5827841547953027486, -959917097985667214, 'http.path', 0x2F646963742F, 6, 1570343247977313, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5827841547953027486, -959917097985667214, 'mvc.controller.class', 0x446963745265736F75726365, 6, 1570343247977313, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5827841547953027486, -959917097985667214, 'mvc.controller.method', 0x67657450616765, 6, 1570343247977313, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2260878341863413466, -4803110280005744182, 'cs', NULL, -1, 1570343477685277, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -2260878341863413466, -4803110280005744182, 'cr', NULL, -1, 1570343477696523, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -2260878341863413466, -4803110280005744182, 'http.method', 0x504F5354, 6, 1570343477685277, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -2260878341863413466, -4803110280005744182, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570343477685277, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -2260878341863413466, 1217578381994860080, 'sr', NULL, -1, 1570343477684066, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -2260878341863413466, 1217578381994860080, 'ss', NULL, -1, 1570343478012582, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -2260878341863413466, 1217578381994860080, 'ca', 0x01, 0, 1570343477684066, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -2260878341863413466, 1217578381994860080, 'http.method', 0x474554, 6, 1570343477684066, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -2260878341863413466, 1217578381994860080, 'http.path', 0x2F7461626C652F7461626C652D6C697374, 6, 1570343477684066, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -2260878341863413466, 1217578381994860080, 'mvc.controller.class', 0x5461626C655265736F75726365, 6, 1570343477684066, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -2260878341863413466, 1217578381994860080, 'mvc.controller.method', 0x7461626C654C697374, 6, 1570343477684066, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 4629830708316230902, -2311336501018229615, 'cs', NULL, -1, 1570343710434212, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4629830708316230902, -2311336501018229615, 'cr', NULL, -1, 1570343710459272, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4629830708316230902, -2311336501018229615, 'http.method', 0x504F5354, 6, 1570343710434212, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4629830708316230902, -2311336501018229615, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570343710434212, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4629830708316230902, 5688049415191538843, 'sr', NULL, -1, 1570343710432577, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4629830708316230902, 5688049415191538843, 'ss', NULL, -1, 1570343710506621, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4629830708316230902, 5688049415191538843, 'ca', 0x01, 0, 1570343710432577, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 4629830708316230902, 5688049415191538843, 'http.method', 0x474554, 6, 1570343710432577, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4629830708316230902, 5688049415191538843, 'http.path', 0x2F6D656E752F757365722D6D656E75, 6, 1570343710432577, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4629830708316230902, 5688049415191538843, 'mvc.controller.class', 0x4D656E755265736F75726365, 6, 1570343710432577, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4629830708316230902, 5688049415191538843, 'mvc.controller.method', 0x676574557365724D656E75, 6, 1570343710432577, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 2706481719270250632, -3169088598126860024, 'cs', NULL, -1, 1570343956812076, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 2706481719270250632, -3169088598126860024, 'cr', NULL, -1, 1570343956822882, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 2706481719270250632, -3169088598126860024, 'http.method', 0x504F5354, 6, 1570343956812076, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 2706481719270250632, -3169088598126860024, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570343956812076, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 2706481719270250632, -5978446170345471492, 'sr', NULL, -1, 1570343956811140, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 2706481719270250632, -5978446170345471492, 'ss', NULL, -1, 1570343956847832, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 2706481719270250632, -5978446170345471492, 'ca', 0x01, 0, 1570343956811140, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 2706481719270250632, -5978446170345471492, 'http.method', 0x474554, 6, 1570343956811140, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 2706481719270250632, -5978446170345471492, 'http.path', 0x2F7461626C652F, 6, 1570343956811140, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 2706481719270250632, -5978446170345471492, 'mvc.controller.class', 0x5461626C655265736F75726365, 6, 1570343956811140, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 2706481719270250632, -5978446170345471492, 'mvc.controller.method', 0x67657450616765, 6, 1570343956811140, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -6880096527785165088, -2291041469826571912, 'cs', NULL, -1, 1570343989784072, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -6880096527785165088, -2291041469826571912, 'cr', NULL, -1, 1570343989795759, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -6880096527785165088, -2291041469826571912, 'http.method', 0x504F5354, 6, 1570343989784072, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -6880096527785165088, -2291041469826571912, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570343989784072, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -6880096527785165088, 3487426452158299168, 'sr', NULL, -1, 1570343989783099, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -6880096527785165088, 3487426452158299168, 'ss', NULL, -1, 1570343990408110, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -6880096527785165088, 3487426452158299168, 'ca', 0x01, 0, 1570343989783099, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -6880096527785165088, 3487426452158299168, 'http.method', 0x474554, 6, 1570343989783099, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -6880096527785165088, 3487426452158299168, 'http.path', 0x2F736368656D652F707265766965772F3133303034343833643565336330326133363033356139653430383136353237, 6, 1570343989783099, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -6880096527785165088, 3487426452158299168, 'mvc.controller.class', 0x536368656D655265736F75726365, 6, 1570343989783099, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -6880096527785165088, 3487426452158299168, 'mvc.controller.method', 0x70726576696577, 6, 1570343989783099, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 1990208109218521674, -942292888007794411, 'cs', NULL, -1, 1570344013309064, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 1990208109218521674, -942292888007794411, 'cr', NULL, -1, 1570344013324229, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 1990208109218521674, -942292888007794411, 'http.method', 0x504F5354, 6, 1570344013309064, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 1990208109218521674, -942292888007794411, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570344013309064, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 1990208109218521674, 3032054266478089488, 'sr', NULL, -1, 1570344013308103, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 1990208109218521674, 3032054266478089488, 'ss', NULL, -1, 1570344013365288, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 1990208109218521674, 3032054266478089488, 'ca', 0x01, 0, 1570344013308103, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 1990208109218521674, 3032054266478089488, 'http.method', 0x474554, 6, 1570344013308103, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 1990208109218521674, 3032054266478089488, 'http.path', 0x2F736368656D652F, 6, 1570344013308103, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 1990208109218521674, 3032054266478089488, 'mvc.controller.class', 0x536368656D655265736F75726365, 6, 1570344013308103, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 1990208109218521674, 3032054266478089488, 'mvc.controller.method', 0x67657450616765, 6, 1570344013308103, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -5863889465431934417, -5602058143072541818, 'cs', NULL, -1, 1570346620231105, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5863889465431934417, -5602058143072541818, 'cr', NULL, -1, 1570346620257869, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5863889465431934417, -5602058143072541818, 'http.method', 0x504F5354, 6, 1570346620231105, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5863889465431934417, -5602058143072541818, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570346620231105, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5863889465431934417, 3256545100157656463, 'sr', NULL, -1, 1570346620230219, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5863889465431934417, 3256545100157656463, 'ss', NULL, -1, 1570346620512838, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5863889465431934417, 3256545100157656463, 'ca', 0x01, 0, 1570346620230219, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -5863889465431934417, 3256545100157656463, 'http.method', 0x474554, 6, 1570346620230219, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5863889465431934417, 3256545100157656463, 'http.path', 0x2F646963742F, 6, 1570346620230219, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5863889465431934417, 3256545100157656463, 'mvc.controller.class', 0x446963745265736F75726365, 6, 1570346620230219, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5863889465431934417, 3256545100157656463, 'mvc.controller.method', 0x67657450616765, 6, 1570346620230219, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -879089909139587202, -8311636133937507900, 'cs', NULL, -1, 1570346624003085, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -879089909139587202, -8311636133937507900, 'cr', NULL, -1, 1570346624016512, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -879089909139587202, -8311636133937507900, 'http.method', 0x504F5354, 6, 1570346624003085, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -879089909139587202, -8311636133937507900, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570346624003085, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -879089909139587202, -7738675970428162549, 'sr', NULL, -1, 1570346624002075, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -879089909139587202, -7738675970428162549, 'ss', NULL, -1, 1570346624037253, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -879089909139587202, -7738675970428162549, 'ca', 0x01, 0, 1570346624002075, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -879089909139587202, -7738675970428162549, 'http.method', 0x474554, 6, 1570346624002075, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -879089909139587202, -7738675970428162549, 'http.path', 0x2F6D656E752F74726565, 6, 1570346624002075, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -879089909139587202, -7738675970428162549, 'mvc.controller.class', 0x4D656E755265736F75726365, 6, 1570346624002075, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -879089909139587202, -7738675970428162549, 'mvc.controller.method', 0x67657454726565, 6, 1570346624002075, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3546624354454334774, 3479779267772991344, 'cs', NULL, -1, 1570346624105355, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3546624354454334774, 3479779267772991344, 'cr', NULL, -1, 1570346624128558, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3546624354454334774, 3479779267772991344, 'http.method', 0x504F5354, 6, 1570346624105355, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3546624354454334774, 3479779267772991344, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570346624105355, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3546624354454334774, 9006292814368331135, 'sr', NULL, -1, 1570346624104139, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3546624354454334774, 9006292814368331135, 'ss', NULL, -1, 1570346624172512, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3546624354454334774, 9006292814368331135, 'ca', 0x01, 0, 1570346624104139, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 3546624354454334774, 9006292814368331135, 'http.method', 0x474554, 6, 1570346624104139, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3546624354454334774, 9006292814368331135, 'http.path', 0x2F6D656E752F, 6, 1570346624104139, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3546624354454334774, 9006292814368331135, 'mvc.controller.class', 0x4D656E755265736F75726365, 6, 1570346624104139, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3546624354454334774, 9006292814368331135, 'mvc.controller.method', 0x67657450616765, 6, 1570346624104139, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8461469795621303889, -6180506607756525729, 'cs', NULL, -1, 1570349643033205, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8461469795621303889, -6180506607756525729, 'cr', NULL, -1, 1570349643206493, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8461469795621303889, -6180506607756525729, 'http.method', 0x504F5354, 6, 1570349643033205, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8461469795621303889, -6180506607756525729, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570349643033205, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1710691596464403680, -1406324572592522086, 'cs', NULL, -1, 1570349643033205, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1710691596464403680, -1406324572592522086, 'cr', NULL, -1, 1570349643206493, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1710691596464403680, -1406324572592522086, 'http.method', 0x504F5354, 6, 1570349643033205, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1710691596464403680, -1406324572592522086, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570349643033205, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1710691596464403680, 5605314515774723917, 'sr', NULL, -1, 1570349643022647, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1710691596464403680, 5605314515774723917, 'ss', NULL, -1, 1570349643338092, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1710691596464403680, 5605314515774723917, 'ca', 0x01, 0, 1570349643022647, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -1710691596464403680, 5605314515774723917, 'http.method', 0x474554, 6, 1570349643022647, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1710691596464403680, 5605314515774723917, 'http.path', 0x2F646570742F757365722D74726565, 6, 1570349643022647, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1710691596464403680, 5605314515774723917, 'mvc.controller.class', 0x446570745265736F75726365, 6, 1570349643022647, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1710691596464403680, 5605314515774723917, 'mvc.controller.method', 0x6C69737443757272656E7455736572446570745472656573, 6, 1570349643022647, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8461469795621303889, -3370784645531572576, 'sr', NULL, -1, 1570349643022619, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8461469795621303889, -3370784645531572576, 'ss', NULL, -1, 1570349643341307, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8461469795621303889, -3370784645531572576, 'ca', 0x01, 0, 1570349643022619, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -8461469795621303889, -3370784645531572576, 'http.method', 0x474554, 6, 1570349643022619, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8461469795621303889, -3370784645531572576, 'http.path', 0x2F726F6C652F, 6, 1570349643022619, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8461469795621303889, -3370784645531572576, 'mvc.controller.class', 0x526F6C655265736F75726365, 6, 1570349643022619, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8461469795621303889, -3370784645531572576, 'mvc.controller.method', 0x67657450616765, 6, 1570349643022619, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8134530858925309630, -5588558111139636413, 'cs', NULL, -1, 1570349684798120, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8134530858925309630, -5588558111139636413, 'cr', NULL, -1, 1570349684823478, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8134530858925309630, -5588558111139636413, 'http.method', 0x504F5354, 6, 1570349684798120, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8134530858925309630, -5588558111139636413, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570349684798120, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8134530858925309630, -4177533179615211760, 'sr', NULL, -1, 1570349684795586, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8134530858925309630, -4177533179615211760, 'ss', NULL, -1, 1570349684841207, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8134530858925309630, -4177533179615211760, 'ca', 0x01, 0, 1570349684795586, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 8134530858925309630, -4177533179615211760, 'http.method', 0x474554, 6, 1570349684795586, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8134530858925309630, -4177533179615211760, 'http.path', 0x2F6C6F672D6F7065726174652F, 6, 1570349684795586, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8134530858925309630, -4177533179615211760, 'mvc.controller.class', 0x4C6F674F7065726174655265736F75726365, 6, 1570349684795586, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8134530858925309630, -4177533179615211760, 'mvc.controller.method', 0x67657450616765, 6, 1570349684795586, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3217056806042716194, -4669033157896051385, 'cs', NULL, -1, 1570350413128185, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3217056806042716194, -4669033157896051385, 'cr', NULL, -1, 1570350413206240, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3217056806042716194, -4669033157896051385, 'http.method', 0x504F5354, 6, 1570350413128185, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3217056806042716194, -4669033157896051385, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570350413128185, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3217056806042716194, -5041793035261182993, 'sr', NULL, -1, 1570350413114335, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3217056806042716194, -5041793035261182993, 'ss', NULL, -1, 1570350413338399, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3217056806042716194, -5041793035261182993, 'ca', 0x01, 0, 1570350413114335, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -3217056806042716194, -5041793035261182993, 'http.method', 0x474554, 6, 1570350413114335, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3217056806042716194, -5041793035261182993, 'http.path', 0x2F6D656E752F, 6, 1570350413114335, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3217056806042716194, -5041793035261182993, 'mvc.controller.class', 0x4D656E755265736F75726365, 6, 1570350413114335, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3217056806042716194, -5041793035261182993, 'mvc.controller.method', 0x67657450616765, 6, 1570350413114335, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2898404041317266350, 5926428325137291458, 'cs', NULL, -1, 1570350464734041, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2898404041317266350, 5926428325137291458, 'cr', NULL, -1, 1570350464779465, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2898404041317266350, 5926428325137291458, 'http.method', 0x504F5354, 6, 1570350464734041, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2898404041317266350, 5926428325137291458, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570350464734041, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2898404041317266350, -5673133534168528367, 'sr', NULL, -1, 1570350464732084, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2898404041317266350, -5673133534168528367, 'ss', NULL, -1, 1570350464885173, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2898404041317266350, -5673133534168528367, 'ca', 0x01, 0, 1570350464732084, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -2898404041317266350, -5673133534168528367, 'http.method', 0x474554, 6, 1570350464732084, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2898404041317266350, -5673133534168528367, 'http.path', 0x2F6D656E752F, 6, 1570350464732084, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2898404041317266350, -5673133534168528367, 'mvc.controller.class', 0x4D656E755265736F75726365, 6, 1570350464732084, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2898404041317266350, -5673133534168528367, 'mvc.controller.method', 0x67657450616765, 6, 1570350464732084, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4410421779105769252, 3150037890371694372, 'cs', NULL, -1, 1570350526918124, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4410421779105769252, 3150037890371694372, 'cr', NULL, -1, 1570350526966333, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4410421779105769252, 3150037890371694372, 'http.method', 0x504F5354, 6, 1570350526918124, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4410421779105769252, 3150037890371694372, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570350526918124, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4410421779105769252, -8339431763020122532, 'sr', NULL, -1, 1570350526917145, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4410421779105769252, -8339431763020122532, 'ss', NULL, -1, 1570350527018698, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4410421779105769252, -8339431763020122532, 'ca', 0x01, 0, 1570350526917145, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 4410421779105769252, -8339431763020122532, 'http.method', 0x474554, 6, 1570350526917145, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4410421779105769252, -8339431763020122532, 'http.path', 0x2F6D656E752F, 6, 1570350526917145, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4410421779105769252, -8339431763020122532, 'mvc.controller.class', 0x4D656E755265736F75726365, 6, 1570350526917145, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4410421779105769252, -8339431763020122532, 'mvc.controller.method', 0x67657450616765, 6, 1570350526917145, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 495403557940151737, -3863234268671894924, 'cs', NULL, -1, 1570350547572053, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 495403557940151737, -3863234268671894924, 'cr', NULL, -1, 1570350547587364, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 495403557940151737, -3863234268671894924, 'http.method', 0x504F5354, 6, 1570350547572053, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 495403557940151737, -3863234268671894924, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570350547572053, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 495403557940151737, 8239167323840955988, 'sr', NULL, -1, 1570350547570062, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 495403557940151737, 8239167323840955988, 'ss', NULL, -1, 1570350547648086, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 495403557940151737, 8239167323840955988, 'ca', 0x01, 0, 1570350547570062, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 495403557940151737, 8239167323840955988, 'http.method', 0x474554, 6, 1570350547570062, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 495403557940151737, 8239167323840955988, 'http.path', 0x2F726F6C652F, 6, 1570350547570062, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 495403557940151737, 8239167323840955988, 'mvc.controller.class', 0x526F6C655265736F75726365, 6, 1570350547570062, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 495403557940151737, 8239167323840955988, 'mvc.controller.method', 0x67657450616765, 6, 1570350547570062, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 7991851767244960667, -9092462615264219908, 'cs', NULL, -1, 1570350551450084, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 7991851767244960667, -9092462615264219908, 'cr', NULL, -1, 1570350551473976, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 7991851767244960667, -9092462615264219908, 'http.method', 0x504F5354, 6, 1570350551450084, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 7991851767244960667, -9092462615264219908, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570350551450084, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 7991851767244960667, -9020930152805207219, 'sr', NULL, -1, 1570350551439860, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 7991851767244960667, -9020930152805207219, 'ss', NULL, -1, 1570350551564226, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 7991851767244960667, -9020930152805207219, 'ca', 0x01, 0, 1570350551439860, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 7991851767244960667, -9020930152805207219, 'http.method', 0x474554, 6, 1570350551439860, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 7991851767244960667, -9020930152805207219, 'http.path', 0x2F726F6C652F, 6, 1570350551439860, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 7991851767244960667, -9020930152805207219, 'mvc.controller.class', 0x526F6C655265736F75726365, 6, 1570350551439860, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 7991851767244960667, -9020930152805207219, 'mvc.controller.method', 0x67657450616765, 6, 1570350551439860, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4977817793071680634, 4458976456185211481, 'cs', NULL, -1, 1570350704531042, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4977817793071680634, 4458976456185211481, 'cr', NULL, -1, 1570350704542880, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4977817793071680634, 4458976456185211481, 'http.method', 0x504F5354, 6, 1570350704531042, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4977817793071680634, 4458976456185211481, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570350704531042, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4977817793071680634, -1061563939586550821, 'sr', NULL, -1, 1570350704530049, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4977817793071680634, -1061563939586550821, 'ss', NULL, -1, 1570350704554797, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4977817793071680634, -1061563939586550821, 'ca', 0x01, 0, 1570350704530049, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 4977817793071680634, -1061563939586550821, 'http.method', 0x474554, 6, 1570350704530049, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4977817793071680634, -1061563939586550821, 'http.path', 0x2F6D656E752F74726565, 6, 1570350704530049, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4977817793071680634, -1061563939586550821, 'mvc.controller.class', 0x4D656E755265736F75726365, 6, 1570350704530049, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 4977817793071680634, -1061563939586550821, 'mvc.controller.method', 0x67657454726565, 6, 1570350704530049, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2931365814843956215, -1872824351246856994, 'cs', NULL, -1, 1570351026950038, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2931365814843956215, -1872824351246856994, 'cr', NULL, -1, 1570351028101491, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2931365814843956215, -1872824351246856994, 'http.method', 0x504F5354, 6, 1570351026950038, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2931365814843956215, -1872824351246856994, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570351026950038, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2931365814843956215, 2988228542878624813, 'sr', NULL, -1, 1570351026949057, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2931365814843956215, 2988228542878624813, 'ss', NULL, -1, 1570351028167610, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2931365814843956215, 2988228542878624813, 'ca', 0x01, 0, 1570351026949057, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -2931365814843956215, 2988228542878624813, 'http.method', 0x474554, 6, 1570351026949057, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2931365814843956215, 2988228542878624813, 'http.path', 0x2F6D656E752F74726565, 6, 1570351026949057, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2931365814843956215, 2988228542878624813, 'mvc.controller.class', 0x4D656E755265736F75726365, 6, 1570351026949057, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2931365814843956215, 2988228542878624813, 'mvc.controller.method', 0x67657454726565, 6, 1570351026949057, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8949017381701860006, 6798935207743092169, 'cs', NULL, -1, 1570351077580074, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8949017381701860006, 6798935207743092169, 'cr', NULL, -1, 1570351077603847, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8949017381701860006, 6798935207743092169, 'http.method', 0x504F5354, 6, 1570351077580074, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8949017381701860006, 6798935207743092169, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570351077580074, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2189493252256832576, 7220229293800246386, 'cs', NULL, -1, 1570351077567057, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2189493252256832576, 7220229293800246386, 'cr', NULL, -1, 1570351077615319, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2189493252256832576, 7220229293800246386, 'http.method', 0x504F5354, 6, 1570351077567057, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2189493252256832576, 7220229293800246386, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570351077567057, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2189493252256832576, 657223020078651992, 'sr', NULL, -1, 1570351077562254, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2189493252256832576, 657223020078651992, 'ss', NULL, -1, 1570351077639455, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2189493252256832576, 657223020078651992, 'ca', 0x01, 0, 1570351077562254, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -2189493252256832576, 657223020078651992, 'http.method', 0x474554, 6, 1570351077562254, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2189493252256832576, 657223020078651992, 'http.path', 0x2F6D656E752F74726565, 6, 1570351077562254, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2189493252256832576, 657223020078651992, 'mvc.controller.class', 0x4D656E755265736F75726365, 6, 1570351077562254, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2189493252256832576, 657223020078651992, 'mvc.controller.method', 0x67657454726565, 6, 1570351077562254, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8949017381701860006, 7093096363649548776, 'sr', NULL, -1, 1570351077579070, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8949017381701860006, 7093096363649548776, 'ss', NULL, -1, 1570351077796878, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8949017381701860006, 7093096363649548776, 'ca', 0x01, 0, 1570351077579070, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 8949017381701860006, 7093096363649548776, 'http.method', 0x474554, 6, 1570351077579070, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8949017381701860006, 7093096363649548776, 'http.path', 0x2F6D656E752F, 6, 1570351077579070, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8949017381701860006, 7093096363649548776, 'mvc.controller.class', 0x4D656E755265736F75726365, 6, 1570351077579070, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8949017381701860006, 7093096363649548776, 'mvc.controller.method', 0x67657450616765, 6, 1570351077579070, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8935671704794550875, 7706154167989123339, 'cs', NULL, -1, 1570351091761087, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8935671704794550875, 7706154167989123339, 'cr', NULL, -1, 1570351091773526, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8935671704794550875, 7706154167989123339, 'http.method', 0x504F5354, 6, 1570351091761087, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8935671704794550875, 7706154167989123339, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570351091761087, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8935671704794550875, -7719016929993797050, 'cs', NULL, -1, 1570351091779068, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8935671704794550875, -7719016929993797050, 'cr', NULL, -1, 1570351091843669, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8935671704794550875, -7719016929993797050, 'http.method', 0x504F5354, 6, 1570351091779068, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8935671704794550875, -7719016929993797050, 'http.path', 0x2F746F6B656E2F70616765, 6, 1570351091779068, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8935671704794550875, -6698818047588430965, 'sr', NULL, -1, 1570351091760054, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8935671704794550875, -6698818047588430965, 'ss', NULL, -1, 1570351091846850, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8935671704794550875, -6698818047588430965, 'ca', 0x01, 0, 1570351091760054, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 8935671704794550875, -6698818047588430965, 'http.method', 0x474554, 6, 1570351091760054, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8935671704794550875, -6698818047588430965, 'http.path', 0x2F746F6B656E2F, 6, 1570351091760054, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8935671704794550875, -6698818047588430965, 'mvc.controller.class', 0x546F6B656E5265736F75726365, 6, 1570351091760054, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 8935671704794550875, -6698818047588430965, 'mvc.controller.method', 0x746F6B656E, 6, 1570351091760054, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6221183179339990787, 2370008347572535543, 'cs', NULL, -1, 1570351159518061, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6221183179339990787, 2370008347572535543, 'cr', NULL, -1, 1570351159534262, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6221183179339990787, 2370008347572535543, 'http.method', 0x504F5354, 6, 1570351159518061, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6221183179339990787, 2370008347572535543, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570351159518061, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6221183179339990787, 494693927340475637, 'cs', NULL, -1, 1570351159540079, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6221183179339990787, 494693927340475637, 'cr', NULL, -1, 1570351159574780, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6221183179339990787, 494693927340475637, 'http.method', 0x504F5354, 6, 1570351159540079, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6221183179339990787, 494693927340475637, 'http.path', 0x2F746F6B656E2F70616765, 6, 1570351159540079, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6221183179339990787, 6157417819447908503, 'sr', NULL, -1, 1570351159518088, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6221183179339990787, 6157417819447908503, 'ss', NULL, -1, 1570351159580848, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6221183179339990787, 6157417819447908503, 'ca', 0x01, 0, 1570351159518088, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 6221183179339990787, 6157417819447908503, 'http.method', 0x474554, 6, 1570351159518088, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6221183179339990787, 6157417819447908503, 'http.path', 0x2F746F6B656E2F, 6, 1570351159518088, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6221183179339990787, 6157417819447908503, 'mvc.controller.class', 0x546F6B656E5265736F75726365, 6, 1570351159518088, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6221183179339990787, 6157417819447908503, 'mvc.controller.method', 0x746F6B656E, 6, 1570351159518088, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -7041182183303365473, 6826095094370864279, 'cs', NULL, -1, 1570351191159036, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -7041182183303365473, 6826095094370864279, 'cr', NULL, -1, 1570351191170497, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -7041182183303365473, 6826095094370864279, 'http.method', 0x504F5354, 6, 1570351191159036, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -7041182183303365473, 6826095094370864279, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570351191159036, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -7041182183303365473, 702138760043331031, 'sr', NULL, -1, 1570351191159049, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -7041182183303365473, 702138760043331031, 'ss', NULL, -1, 1570351191185405, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -7041182183303365473, 702138760043331031, 'ca', 0x01, 0, 1570351191159049, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -7041182183303365473, 702138760043331031, 'http.method', 0x474554, 6, 1570351191159049, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -7041182183303365473, 702138760043331031, 'http.path', 0x2F757365722F696E666F, 6, 1570351191159049, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -7041182183303365473, 702138760043331031, 'mvc.controller.class', 0x557365725265736F75726365, 6, 1570351191159049, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -7041182183303365473, 702138760043331031, 'mvc.controller.method', 0x696E666F, 6, 1570351191159049, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -9164083351855539321, -140317818049489679, 'cs', NULL, -1, 1570351194239063, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -9164083351855539321, -140317818049489679, 'cr', NULL, -1, 1570351194280099, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -9164083351855539321, -140317818049489679, 'http.method', 0x504F5354, 6, 1570351194239063, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -9164083351855539321, -140317818049489679, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570351194239063, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -9164083351855539321, -1096686104612626826, 'sr', NULL, -1, 1570351194238059, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -9164083351855539321, -1096686104612626826, 'ss', NULL, -1, 1570351194353743, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -9164083351855539321, -1096686104612626826, 'ca', 0x01, 0, 1570351194238059, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -9164083351855539321, -1096686104612626826, 'http.method', 0x474554, 6, 1570351194238059, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -9164083351855539321, -1096686104612626826, 'http.path', 0x2F6D656E752F, 6, 1570351194238059, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -9164083351855539321, -1096686104612626826, 'mvc.controller.class', 0x4D656E755265736F75726365, 6, 1570351194238059, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -9164083351855539321, -1096686104612626826, 'mvc.controller.method', 0x67657450616765, 6, 1570351194238059, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6475268191767339172, 3678857894185338710, 'cs', NULL, -1, 1570351210873402, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6475268191767339172, 3678857894185338710, 'cr', NULL, -1, 1570351210908046, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6475268191767339172, 3678857894185338710, 'http.method', 0x504F5354, 6, 1570351210873402, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6475268191767339172, 3678857894185338710, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570351210873402, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6475268191767339172, 302286372798376426, 'sr', NULL, -1, 1570351210870074, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6475268191767339172, 302286372798376426, 'ss', NULL, -1, 1570351210959394, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6475268191767339172, 302286372798376426, 'ca', 0x01, 0, 1570351210870074, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -6475268191767339172, 302286372798376426, 'http.method', 0x474554, 6, 1570351210870074, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6475268191767339172, 302286372798376426, 'http.path', 0x2F6D656E752F, 6, 1570351210870074, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6475268191767339172, 302286372798376426, 'mvc.controller.class', 0x4D656E755265736F75726365, 6, 1570351210870074, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6475268191767339172, 302286372798376426, 'mvc.controller.method', 0x67657450616765, 6, 1570351210870074, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1738549377126299291, -9124471694244522353, 'cs', NULL, -1, 1570351237963038, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1738549377126299291, -9124471694244522353, 'cr', NULL, -1, 1570351237969737, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1738549377126299291, -9124471694244522353, 'http.method', 0x504F5354, 6, 1570351237963038, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1738549377126299291, -9124471694244522353, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570351237963038, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1738549377126299291, -5920579996029014846, 'sr', NULL, -1, 1570351237962047, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1738549377126299291, -5920579996029014846, 'ss', NULL, -1, 1570351237985218, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1738549377126299291, -5920579996029014846, 'ca', 0x01, 0, 1570351237962047, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 1738549377126299291, -5920579996029014846, 'http.method', 0x474554, 6, 1570351237962047, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1738549377126299291, -5920579996029014846, 'http.path', 0x2F6D656E752F3734663262326138383731613239386530616363346437313239643130653963, 6, 1570351237962047, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1738549377126299291, -5920579996029014846, 'mvc.controller.class', 0x4D656E755265736F75726365, 6, 1570351237962047, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1738549377126299291, -5920579996029014846, 'mvc.controller.method', 0x676574, 6, 1570351237962047, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 9080496735260560859, 6143930383645515548, 'cs', NULL, -1, 1570351914553149, -1062731374, NULL, NULL, 'albedo-quartz');
INSERT INTO `zipkin_annotations` VALUES (0, 9080496735260560859, 6143930383645515548, 'cr', NULL, -1, 1570351914658667, -1062731374, NULL, NULL, 'albedo-quartz');
INSERT INTO `zipkin_annotations` VALUES (0, 9080496735260560859, 6143930383645515548, 'http.method', 0x504F5354, 6, 1570351914553149, -1062731374, NULL, NULL, 'albedo-quartz');
INSERT INTO `zipkin_annotations` VALUES (0, 9080496735260560859, 6143930383645515548, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570351914553149, -1062731374, NULL, NULL, 'albedo-quartz');
INSERT INTO `zipkin_annotations` VALUES (0, 9080496735260560859, -3790680084196989992, 'sr', NULL, -1, 1570351914552410, -1062731374, NULL, NULL, 'albedo-quartz');
INSERT INTO `zipkin_annotations` VALUES (0, 9080496735260560859, -3790680084196989992, 'ss', NULL, -1, 1570351915125999, -1062731374, NULL, NULL, 'albedo-quartz');
INSERT INTO `zipkin_annotations` VALUES (0, 9080496735260560859, -3790680084196989992, 'ca', 0x01, 0, 1570351914552410, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 9080496735260560859, -3790680084196989992, 'http.method', 0x474554, 6, 1570351914552410, -1062731374, NULL, NULL, 'albedo-quartz');
INSERT INTO `zipkin_annotations` VALUES (0, 9080496735260560859, -3790680084196989992, 'http.path', 0x2F6A6F622D6C6F672F, 6, 1570351914552410, -1062731374, NULL, NULL, 'albedo-quartz');
INSERT INTO `zipkin_annotations` VALUES (0, 9080496735260560859, -3790680084196989992, 'mvc.controller.class', 0x4A6F624C6F675265736F75726365, 6, 1570351914552410, -1062731374, NULL, NULL, 'albedo-quartz');
INSERT INTO `zipkin_annotations` VALUES (0, 9080496735260560859, -3790680084196989992, 'mvc.controller.method', 0x67657450616765, 6, 1570351914552410, -1062731374, NULL, NULL, 'albedo-quartz');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, -4910506172299314995, 'cs', NULL, -1, 1570351986850082, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, -4910506172299314995, 'cr', NULL, -1, 1570351986875605, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, -4910506172299314995, 'http.method', 0x504F5354, 6, 1570351986850082, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, -4910506172299314995, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570351986850082, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, -8763089687053228705, 'sr', NULL, -1, 1570351987198320, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, -8763089687053228705, 'ss', NULL, -1, 1570351987317630, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, -8763089687053228705, 'ca', 0x01, 0, 1570351987198320, -1062731374, NULL, -12733, '');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, -8763089687053228705, 'http.method', 0x474554, 6, 1570351987198320, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, -8763089687053228705, 'http.path', 0x2F646963742F616C6C, 6, 1570351987198320, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, -8763089687053228705, 'mvc.controller.class', 0x446963745265736F75726365, 6, 1570351987198320, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, -8763089687053228705, 'mvc.controller.method', 0x676574416C6C, 6, 1570351987198320, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, -8763089687053228705, 'cs', NULL, -1, 1570351987186076, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, -8763089687053228705, 'cr', NULL, -1, 1570351987318281, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, -8763089687053228705, 'http.method', 0x474554, 6, 1570351987186076, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, -8763089687053228705, 'http.path', 0x2F646963742F616C6C, 6, 1570351987186076, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 4192001947641720101, 'cs', NULL, -1, 1570351987185508, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 4192001947641720101, 'cr', NULL, -1, 1570351987320693, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 4192001947641720101, 'http.method', 0x474554, 6, 1570351987185508, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 4192001947641720101, 'http.path', 0x2F646963742F616C6C, 6, 1570351987185508, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 4192001947641720101, 'sr', NULL, -1, 1570351987198147, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 4192001947641720101, 'ss', NULL, -1, 1570351987320679, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 4192001947641720101, 'ca', 0x01, 0, 1570351987198147, -1062731374, NULL, -12732, '');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 4192001947641720101, 'http.method', 0x474554, 6, 1570351987198147, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 4192001947641720101, 'http.path', 0x2F646963742F616C6C, 6, 1570351987198147, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 4192001947641720101, 'mvc.controller.class', 0x446963745265736F75726365, 6, 1570351987198147, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 4192001947641720101, 'mvc.controller.method', 0x676574416C6C, 6, 1570351987198147, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 3941291269230870773, 'sr', NULL, -1, 1570351986849388, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 3941291269230870773, 'ss', NULL, -1, 1570351987369361, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 3941291269230870773, 'ca', 0x01, 0, 1570351986849388, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 3941291269230870773, 'http.method', 0x504F5354, 6, 1570351986849388, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 3941291269230870773, 'http.path', 0x2F646963742F, 6, 1570351986849388, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 3941291269230870773, 'mvc.controller.class', 0x446963745265736F75726365, 6, 1570351986849388, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 3941291269230870773, 'mvc.controller.method', 0x73617665, 6, 1570351986849388, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 410906980174918447, 'sr', NULL, -1, 1570351987377889, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 410906980174918447, 'ss', NULL, -1, 1570351987384001, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 410906980174918447, 'ca', 0x01, 0, 1570351987377889, -1062731374, NULL, -12733, '');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 410906980174918447, 'error', 0x343034, 6, 1570351987377889, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 410906980174918447, 'http.method', 0x504F5354, 6, 1570351987377889, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 410906980174918447, 'http.path', 0x2F6C6F672F, 6, 1570351987377889, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 410906980174918447, 'http.status_code', 0x343034, 6, 1570351987377889, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 410906980174918447, 'mvc.controller.class', 0x5265736F75726365487474705265717565737448616E646C6572, 6, 1570351987377889, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 410906980174918447, 'cs', NULL, -1, 1570351987374831, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 410906980174918447, 'cr', NULL, -1, 1570351987385471, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 410906980174918447, 'error', 0x343034, 6, 1570351987374831, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 410906980174918447, 'http.method', 0x504F5354, 6, 1570351987374831, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 410906980174918447, 'http.path', 0x2F6C6F672F, 6, 1570351987374831, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, 410906980174918447, 'http.status_code', 0x343034, 6, 1570351987374831, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, -2672718159532941764, 'class', 0x5379734C6F674C697374656E6572, 6, 1570351987108784, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, -2672718159532941764, 'method', 0x736176655379734C6F67, 6, 1570351987108784, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8585459699661708608, -4524314484574309764, 'lc', '', 6, 1570351987106000, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6619226613136444073, -5769681611853638289, 'cs', NULL, -1, 1570352198763731, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 6619226613136444073, -5769681611853638289, 'cr', NULL, -1, 1570352198826472, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 6619226613136444073, -5769681611853638289, 'http.method', 0x504F5354, 6, 1570352198763731, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 6619226613136444073, -5769681611853638289, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570352198763731, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 6619226613136444073, -7814300868678066722, 'sr', NULL, -1, 1570352198757171, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 6619226613136444073, -7814300868678066722, 'ss', NULL, -1, 1570352199023544, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 6619226613136444073, -7814300868678066722, 'ca', 0x01, 0, 1570352198757171, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 6619226613136444073, -7814300868678066722, 'http.method', 0x474554, 6, 1570352198757171, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 6619226613136444073, -7814300868678066722, 'http.path', 0x2F736368656D652F, 6, 1570352198757171, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 6619226613136444073, -7814300868678066722, 'mvc.controller.class', 0x536368656D655265736F75726365, 6, 1570352198757171, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 6619226613136444073, -7814300868678066722, 'mvc.controller.method', 0x67657450616765, 6, 1570352198757171, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 9076804610333231284, -7258013721882416308, 'cs', NULL, -1, 1570352209146043, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 9076804610333231284, -7258013721882416308, 'cr', NULL, -1, 1570352209183725, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 9076804610333231284, -7258013721882416308, 'http.method', 0x504F5354, 6, 1570352209146043, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 9076804610333231284, -7258013721882416308, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570352209146043, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 9076804610333231284, 1950267377217765997, 'sr', NULL, -1, 1570352209145049, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 9076804610333231284, 1950267377217765997, 'ss', NULL, -1, 1570352209196280, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 9076804610333231284, 1950267377217765997, 'ca', 0x01, 0, 1570352209145049, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 9076804610333231284, 1950267377217765997, 'http.method', 0x474554, 6, 1570352209145049, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 9076804610333231284, 1950267377217765997, 'http.path', 0x2F6C6F672D6F7065726174652F, 6, 1570352209145049, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 9076804610333231284, 1950267377217765997, 'mvc.controller.class', 0x4C6F674F7065726174655265736F75726365, 6, 1570352209145049, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 9076804610333231284, 1950267377217765997, 'mvc.controller.method', 0x67657450616765, 6, 1570352209145049, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1530031099109849610, -3917057402684408490, 'cs', NULL, -1, 1570352258595050, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1530031099109849610, -3917057402684408490, 'cr', NULL, -1, 1570352258871637, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1530031099109849610, -3917057402684408490, 'http.method', 0x504F5354, 6, 1570352258595050, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1530031099109849610, -3917057402684408490, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570352258595050, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3533156003377230797, 8285022025861572222, 'cs', NULL, -1, 1570352258602063, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3533156003377230797, 8285022025861572222, 'cr', NULL, -1, 1570352258908451, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3533156003377230797, 8285022025861572222, 'http.method', 0x504F5354, 6, 1570352258602063, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3533156003377230797, 8285022025861572222, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570352258602063, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1530031099109849610, -1046061539289820626, 'sr', NULL, -1, 1570352258594131, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1530031099109849610, -1046061539289820626, 'ss', NULL, -1, 1570352258952315, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1530031099109849610, -1046061539289820626, 'ca', 0x01, 0, 1570352258594131, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 1530031099109849610, -1046061539289820626, 'http.method', 0x474554, 6, 1570352258594131, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1530031099109849610, -1046061539289820626, 'http.path', 0x2F726F6C652F636F6D626F2D64617461, 6, 1570352258594131, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1530031099109849610, -1046061539289820626, 'mvc.controller.class', 0x526F6C655265736F75726365, 6, 1570352258594131, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1530031099109849610, -1046061539289820626, 'mvc.controller.method', 0x636F6D626F44617461, 6, 1570352258594131, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3533156003377230797, 3546834248815888858, 'sr', NULL, -1, 1570352258601111, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3533156003377230797, 3546834248815888858, 'ss', NULL, -1, 1570352259064282, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3533156003377230797, 3546834248815888858, 'ca', 0x01, 0, 1570352258601111, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 3533156003377230797, 3546834248815888858, 'http.method', 0x474554, 6, 1570352258601111, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3533156003377230797, 3546834248815888858, 'http.path', 0x2F646570742F757365722D74726565, 6, 1570352258601111, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3533156003377230797, 3546834248815888858, 'mvc.controller.class', 0x446570745265736F75726365, 6, 1570352258601111, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3533156003377230797, 3546834248815888858, 'mvc.controller.method', 0x6C69737443757272656E7455736572446570745472656573, 6, 1570352258601111, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6491321965736703399, 7125959769401341643, 'cs', NULL, -1, 1570352351273075, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6491321965736703399, 7125959769401341643, 'cr', NULL, -1, 1570352351330454, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6491321965736703399, 7125959769401341643, 'http.method', 0x504F5354, 6, 1570352351273075, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6491321965736703399, 7125959769401341643, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570352351273075, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6491321965736703399, -7907588856865747033, 'sr', NULL, -1, 1570352351272061, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6491321965736703399, -7907588856865747033, 'ss', NULL, -1, 1570352351351542, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6491321965736703399, -7907588856865747033, 'ca', 0x01, 0, 1570352351272061, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -6491321965736703399, -7907588856865747033, 'http.method', 0x474554, 6, 1570352351272061, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6491321965736703399, -7907588856865747033, 'http.path', 0x2F646570742F757365722D74726565, 6, 1570352351272061, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6491321965736703399, -7907588856865747033, 'mvc.controller.class', 0x446570745265736F75726365, 6, 1570352351272061, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6491321965736703399, -7907588856865747033, 'mvc.controller.method', 0x6C69737443757272656E7455736572446570745472656573, 6, 1570352351272061, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2180519221981865463, -2180519221981865463, 'lc', '', 6, 1570352564350000, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -907301845752286172, 5404289225227278529, 'cs', NULL, -1, 1570352624307157, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -907301845752286172, 5404289225227278529, 'cr', NULL, -1, 1570352624364180, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -907301845752286172, 5404289225227278529, 'http.method', 0x504F5354, 6, 1570352624307157, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -907301845752286172, 5404289225227278529, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570352624307157, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -907301845752286172, 3401748284722463840, 'sr', NULL, -1, 1570352624305232, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -907301845752286172, 3401748284722463840, 'ss', NULL, -1, 1570352624487840, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -907301845752286172, 3401748284722463840, 'ca', 0x01, 0, 1570352624305232, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -907301845752286172, 3401748284722463840, 'http.method', 0x474554, 6, 1570352624305232, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -907301845752286172, 3401748284722463840, 'http.path', 0x2F7461626C652F, 6, 1570352624305232, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -907301845752286172, 3401748284722463840, 'mvc.controller.class', 0x5461626C655265736F75726365, 6, 1570352624305232, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -907301845752286172, 3401748284722463840, 'mvc.controller.method', 0x67657450616765, 6, 1570352624305232, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, 8058490489740808334, 8058490489740808334, 'lc', '', 6, 1570353082423000, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2765120839012649538, -2765120839012649538, 'lc', '', 6, 1570353329568000, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5281163928884064354, -5281163928884064354, 'lc', '', 6, 1570354199802000, -1062731374, NULL, NULL, 'albedo-quartz');
INSERT INTO `zipkin_annotations` VALUES (0, -2530637461577789025, 5036812627426709880, 'cs', NULL, -1, 1570354281826198, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2530637461577789025, 5036812627426709880, 'cr', NULL, -1, 1570354281850148, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2530637461577789025, 5036812627426709880, 'http.method', 0x504F5354, 6, 1570354281826198, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2530637461577789025, 5036812627426709880, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570354281826198, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2530637461577789025, -6377453088129202010, 'sr', NULL, -1, 1570354281825498, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2530637461577789025, -6377453088129202010, 'ss', NULL, -1, 1570354282004290, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2530637461577789025, -6377453088129202010, 'ca', 0x01, 0, 1570354281825498, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -2530637461577789025, -6377453088129202010, 'http.method', 0x474554, 6, 1570354281825498, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2530637461577789025, -6377453088129202010, 'http.path', 0x2F726F6C652F32, 6, 1570354281825498, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2530637461577789025, -6377453088129202010, 'mvc.controller.class', 0x526F6C655265736F75726365, 6, 1570354281825498, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2530637461577789025, -6377453088129202010, 'mvc.controller.method', 0x676574, 6, 1570354281825498, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6060208758854745426, -8184925278860820506, 'cs', NULL, -1, 1570354520821070, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6060208758854745426, -8184925278860820506, 'cr', NULL, -1, 1570354520896417, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6060208758854745426, -8184925278860820506, 'http.method', 0x504F5354, 6, 1570354520821070, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6060208758854745426, -8184925278860820506, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570354520821070, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6060208758854745426, 4458503812852785556, 'sr', NULL, -1, 1570354520820103, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6060208758854745426, 4458503812852785556, 'ss', NULL, -1, 1570354520931093, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6060208758854745426, 4458503812852785556, 'ca', 0x01, 0, 1570354520820103, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 6060208758854745426, 4458503812852785556, 'http.method', 0x474554, 6, 1570354520820103, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6060208758854745426, 4458503812852785556, 'http.path', 0x2F726F6C652F32, 6, 1570354520820103, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6060208758854745426, 4458503812852785556, 'mvc.controller.class', 0x526F6C655265736F75726365, 6, 1570354520820103, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6060208758854745426, 4458503812852785556, 'mvc.controller.method', 0x676574, 6, 1570354520820103, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, 8391279358867437147, 'cs', NULL, -1, 1570354526408311, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, 8391279358867437147, 'cr', NULL, -1, 1570354526431680, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, 8391279358867437147, 'http.method', 0x504F5354, 6, 1570354526408311, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, 8391279358867437147, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570354526408311, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, -4541268023339478345, 'sr', NULL, -1, 1570354526404166, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, -4541268023339478345, 'ss', NULL, -1, 1570354526781855, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, -4541268023339478345, 'ca', 0x01, 0, 1570354526404166, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, -4541268023339478345, 'http.method', 0x504F5354, 6, 1570354526404166, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, -4541268023339478345, 'http.path', 0x2F726F6C65, 6, 1570354526404166, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, -4541268023339478345, 'mvc.controller.class', 0x526F6C655265736F75726365, 6, 1570354526404166, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, -4541268023339478345, 'mvc.controller.method', 0x73617665, 6, 1570354526404166, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, -5110643198949506854, 'sr', NULL, -1, 1570354526792933, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, -5110643198949506854, 'ss', NULL, -1, 1570354526794264, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, -5110643198949506854, 'ca', 0x01, 0, 1570354526792933, -1062731374, NULL, -14093, '');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, -5110643198949506854, 'error', 0x343031, 6, 1570354526792933, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, -5110643198949506854, 'http.method', 0x504F5354, 6, 1570354526792933, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, -5110643198949506854, 'http.path', 0x2F6C6F672D6F7065726174652F, 6, 1570354526792933, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, -5110643198949506854, 'http.status_code', 0x343031, 6, 1570354526792933, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, -5110643198949506854, 'cs', NULL, -1, 1570354526790067, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, -5110643198949506854, 'cr', NULL, -1, 1570354526795180, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, -5110643198949506854, 'error', 0x343031, 6, 1570354526790067, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, -5110643198949506854, 'http.method', 0x504F5354, 6, 1570354526790067, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, -5110643198949506854, 'http.path', 0x2F6C6F672D6F7065726174652F, 6, 1570354526790067, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, -5110643198949506854, 'http.status_code', 0x343031, 6, 1570354526790067, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, 3872675443178481801, 'class', 0x5379734C6F674C697374656E6572, 6, 1570354526780114, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, 3872675443178481801, 'method', 0x736176655379734C6F67, 6, 1570354526780114, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1406163629589379033, 7739788925909492731, 'lc', '', 6, 1570354526780000, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3381120266614656773, 3381120266614656773, 'lc', '', 6, 1570354617794000, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3457150614930525960, -1118169706466489917, 'cs', NULL, -1, 1570354633752307, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3457150614930525960, -1118169706466489917, 'cr', NULL, -1, 1570354633851157, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3457150614930525960, -1118169706466489917, 'http.method', 0x504F5354, 6, 1570354633752307, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3457150614930525960, -1118169706466489917, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570354633752307, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3457150614930525960, 4153903581771765967, 'sr', NULL, -1, 1570354633714740, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3457150614930525960, 4153903581771765967, 'ss', NULL, -1, 1570354634134676, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3457150614930525960, 4153903581771765967, 'ca', 0x01, 0, 1570354633714740, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -3457150614930525960, 4153903581771765967, 'http.method', 0x474554, 6, 1570354633714740, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3457150614930525960, 4153903581771765967, 'http.path', 0x2F726F6C652F32, 6, 1570354633714740, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3457150614930525960, 4153903581771765967, 'mvc.controller.class', 0x526F6C655265736F75726365, 6, 1570354633714740, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3457150614930525960, 4153903581771765967, 'mvc.controller.method', 0x676574, 6, 1570354633714740, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -332632017839300986, 5559048839347872850, 'cs', NULL, -1, 1570354865560071, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -332632017839300986, 5559048839347872850, 'cr', NULL, -1, 1570354865577691, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -332632017839300986, 5559048839347872850, 'http.method', 0x504F5354, 6, 1570354865560071, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -332632017839300986, 5559048839347872850, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570354865560071, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -332632017839300986, 8255404931167176940, 'cs', NULL, -1, 1570354865581081, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -332632017839300986, 8255404931167176940, 'cr', NULL, -1, 1570354865622955, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -332632017839300986, 8255404931167176940, 'http.method', 0x504F5354, 6, 1570354865581081, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -332632017839300986, 8255404931167176940, 'http.path', 0x2F746F6B656E2F70616765, 6, 1570354865581081, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -332632017839300986, 6595257905917975426, 'sr', NULL, -1, 1570354865558238, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -332632017839300986, 6595257905917975426, 'ss', NULL, -1, 1570354865627897, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -332632017839300986, 6595257905917975426, 'ca', 0x01, 0, 1570354865558238, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -332632017839300986, 6595257905917975426, 'http.method', 0x474554, 6, 1570354865558238, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -332632017839300986, 6595257905917975426, 'http.path', 0x2F746F6B656E2F, 6, 1570354865558238, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -332632017839300986, 6595257905917975426, 'mvc.controller.class', 0x546F6B656E5265736F75726365, 6, 1570354865558238, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -332632017839300986, 6595257905917975426, 'mvc.controller.method', 0x746F6B656E, 6, 1570354865558238, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8111783166695558091, 731579691895189936, 'sr', NULL, -1, 1570354914680177, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8111783166695558091, 731579691895189936, 'ss', NULL, -1, 1570354915454520, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8111783166695558091, 731579691895189936, 'ca', 0x01, 0, 1570354914680177, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -8111783166695558091, 731579691895189936, 'http.method', 0x474554, 6, 1570354914680177, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8111783166695558091, 731579691895189936, 'http.path', 0x2F76322F6170692D646F6373, 6, 1570354914680177, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -3177388740964964208, -3177388740964964208, 'lc', '', 6, 1570355342433000, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3776280420139755533, 3776280420139755533, 'lc', '', 6, 1570355399645000, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 6998356862035039207, 6998356862035039207, 'lc', '', 6, 1570355418452000, -1062731374, NULL, NULL, 'albedo-gen');
INSERT INTO `zipkin_annotations` VALUES (0, -2866627072339136163, -2866627072339136163, 'lc', '', 6, 1570355482761000, -1062731374, NULL, NULL, 'albedo-quartz');
INSERT INTO `zipkin_annotations` VALUES (0, -5579354880552029934, -5579354880552029934, 'lc', '', 6, 1570355673761000, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1567840922948369379, -1210768656854980755, 'cs', NULL, -1, 1570355691103545, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1567840922948369379, -1210768656854980755, 'cr', NULL, -1, 1570355691215676, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1567840922948369379, -1210768656854980755, 'http.method', 0x504F5354, 6, 1570355691103545, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1567840922948369379, -1210768656854980755, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570355691103545, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1567840922948369379, -4111769308798134084, 'sr', NULL, -1, 1570355691044477, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1567840922948369379, -4111769308798134084, 'ss', NULL, -1, 1570355691806276, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1567840922948369379, -4111769308798134084, 'ca', 0x01, 0, 1570355691044477, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -1567840922948369379, -4111769308798134084, 'http.method', 0x474554, 6, 1570355691044477, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1567840922948369379, -4111769308798134084, 'http.path', 0x2F646963742F636F646573, 6, 1570355691044477, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1567840922948369379, -4111769308798134084, 'mvc.controller.class', 0x446963745265736F75726365, 6, 1570355691044477, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1567840922948369379, -4111769308798134084, 'mvc.controller.method', 0x6765744279436F646573, 6, 1570355691044477, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 7567416797288916629, 7567416797288916629, 'sr', NULL, -1, 1570355874631363, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 7567416797288916629, 7567416797288916629, 'ss', NULL, -1, 1570355874633512, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 7567416797288916629, 7567416797288916629, 'ca', 0x01, 0, 1570355874631363, 2130706433, NULL, -1656, '');
INSERT INTO `zipkin_annotations` VALUES (0, 7567416797288916629, 7567416797288916629, 'error', 0x343031, 6, 1570355874631363, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 7567416797288916629, 7567416797288916629, 'http.method', 0x504F5354, 6, 1570355874631363, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 7567416797288916629, 7567416797288916629, 'http.path', 0x2F6C6F672D6F7065726174652F73617665, 6, 1570355874631363, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 7567416797288916629, 7567416797288916629, 'http.status_code', 0x343031, 6, 1570355874631363, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 660507369565480960, 660507369565480960, 'sr', NULL, -1, 1570355882226087, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 660507369565480960, 660507369565480960, 'ss', NULL, -1, 1570355882227138, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 660507369565480960, 660507369565480960, 'ca', 0x01, 0, 1570355882226087, 2130706433, NULL, -1598, '');
INSERT INTO `zipkin_annotations` VALUES (0, 660507369565480960, 660507369565480960, 'error', 0x343031, 6, 1570355882226087, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 660507369565480960, 660507369565480960, 'http.method', 0x474554, 6, 1570355882226087, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 660507369565480960, 660507369565480960, 'http.path', 0x2F6C6F672D6F7065726174652F, 6, 1570355882226087, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 660507369565480960, 660507369565480960, 'http.status_code', 0x343031, 6, 1570355882226087, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, -1443311761576867579, 'cs', NULL, -1, 1570355911258104, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, -1443311761576867579, 'cr', NULL, -1, 1570355911291010, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, -1443311761576867579, 'http.method', 0x504F5354, 6, 1570355911258104, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, -1443311761576867579, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570355911258104, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 3667277185845595605, 'sr', NULL, -1, 1570355911256091, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 3667277185845595605, 'ss', NULL, -1, 1570355911489010, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 3667277185845595605, 'ca', 0x01, 0, 1570355911256091, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 3667277185845595605, 'http.method', 0x504F5354, 6, 1570355911256091, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 3667277185845595605, 'http.path', 0x2F726F6C65, 6, 1570355911256091, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 3667277185845595605, 'mvc.controller.class', 0x526F6C655265736F75726365, 6, 1570355911256091, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 3667277185845595605, 'mvc.controller.method', 0x73617665, 6, 1570355911256091, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 3255947693587827990, 'sr', NULL, -1, 1570355911494899, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 3255947693587827990, 'ss', NULL, -1, 1570355911495678, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 3255947693587827990, 'ca', 0x01, 0, 1570355911494899, -1062731374, NULL, -1283, '');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 3255947693587827990, 'error', 0x343031, 6, 1570355911494899, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 3255947693587827990, 'http.method', 0x504F5354, 6, 1570355911494899, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 3255947693587827990, 'http.path', 0x2F6C6F672D6F7065726174652F73617665, 6, 1570355911494899, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 3255947693587827990, 'http.status_code', 0x343031, 6, 1570355911494899, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 3255947693587827990, 'cs', NULL, -1, 1570355911492344, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 3255947693587827990, 'cr', NULL, -1, 1570355911496520, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 3255947693587827990, 'error', 0x343031, 6, 1570355911492344, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 3255947693587827990, 'http.method', 0x504F5354, 6, 1570355911492344, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 3255947693587827990, 'http.path', 0x2F6C6F672D6F7065726174652F73617665, 6, 1570355911492344, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 3255947693587827990, 'http.status_code', 0x343031, 6, 1570355911492344, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 4730762743047074444, 'class', 0x5379734C6F674C697374656E6572, 6, 1570355911487081, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 4730762743047074444, 'method', 0x736176655379734C6F67, 6, 1570355911487081, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -6229014147509267517, 7252299777426563390, 'lc', '', 6, 1570355911487000, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, -6157894490948560721, 'cs', NULL, -1, 1570355911645177, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, -6157894490948560721, 'cr', NULL, -1, 1570355911688942, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, -6157894490948560721, 'http.method', 0x504F5354, 6, 1570355911645177, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, -6157894490948560721, 'http.path', 0x2F6F617574682F636865636B5F746F6B656E, 6, 1570355911645177, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, 5393439888350108162, 'sr', NULL, -1, 1570355911640560, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, 5393439888350108162, 'ss', NULL, -1, 1570355912149807, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, 5393439888350108162, 'ca', 0x01, 0, 1570355911640560, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, 5393439888350108162, 'http.method', 0x504F5354, 6, 1570355911640560, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, 5393439888350108162, 'http.path', 0x2F726F6C65, 6, 1570355911640560, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, 5393439888350108162, 'mvc.controller.class', 0x526F6C655265736F75726365, 6, 1570355911640560, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, 5393439888350108162, 'mvc.controller.method', 0x73617665, 6, 1570355911640560, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, -5327570527466307459, 'sr', NULL, -1, 1570355912155818, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, -5327570527466307459, 'ss', NULL, -1, 1570355912156808, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, -5327570527466307459, 'ca', 0x01, 0, 1570355912155818, -1062731374, NULL, -1283, '');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, -5327570527466307459, 'error', 0x343031, 6, 1570355912155818, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, -5327570527466307459, 'http.method', 0x504F5354, 6, 1570355912155818, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, -5327570527466307459, 'http.path', 0x2F6C6F672D6F7065726174652F73617665, 6, 1570355912155818, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, -5327570527466307459, 'http.status_code', 0x343031, 6, 1570355912155818, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, -5327570527466307459, 'cs', NULL, -1, 1570355912152739, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, -5327570527466307459, 'cr', NULL, -1, 1570355912157447, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, -5327570527466307459, 'error', 0x343031, 6, 1570355912152739, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, -5327570527466307459, 'http.method', 0x504F5354, 6, 1570355912152739, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, -5327570527466307459, 'http.path', 0x2F6C6F672D6F7065726174652F73617665, 6, 1570355912152739, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, -5327570527466307459, 'http.status_code', 0x343031, 6, 1570355912152739, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, -5886769550749699667, 'class', 0x5379734C6F674C697374656E6572, 6, 1570355912147076, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, -5886769550749699667, 'method', 0x736176655379734C6F67, 6, 1570355912147076, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 1123652407958989884, -7055851149456731185, 'lc', '', 6, 1570355912147000, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 3364318480226850634, 3364318480226850634, 'lc', '', 6, 1570356126835000, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, 5572573745800778057, 5572573745800778057, 'lc', '', 6, 1570356433928000, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5135369690576007167, 7996344967320833495, 'sr', NULL, -1, 1570356478956428, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5135369690576007167, 7996344967320833495, 'ss', NULL, -1, 1570356478957693, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5135369690576007167, 7996344967320833495, 'ca', 0x01, 0, 1570356478956428, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -5135369690576007167, 7996344967320833495, 'error', 0x343031, 6, 1570356478956428, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5135369690576007167, 7996344967320833495, 'http.method', 0x504F5354, 6, 1570356478956428, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5135369690576007167, 7996344967320833495, 'http.path', 0x2F646963742F73617665, 6, 1570356478956428, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -5135369690576007167, 7996344967320833495, 'http.status_code', 0x343031, 6, 1570356478956428, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2814173265754954973, -1921196991192632000, 'sr', NULL, -1, 1570356516105088, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2814173265754954973, -1921196991192632000, 'ss', NULL, -1, 1570356516107183, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2814173265754954973, -1921196991192632000, 'ca', 0x01, 0, 1570356516105088, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -2814173265754954973, -1921196991192632000, 'error', 0x343031, 6, 1570356516105088, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2814173265754954973, -1921196991192632000, 'http.method', 0x474554, 6, 1570356516105088, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2814173265754954973, -1921196991192632000, 'http.path', 0x2F6C6F672D6F7065726174652F616C6C, 6, 1570356516105088, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -2814173265754954973, -1921196991192632000, 'http.status_code', 0x343031, 6, 1570356516105088, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8473634626169052317, 6721663733261741253, 'sr', NULL, -1, 1570356516689072, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8473634626169052317, 6721663733261741253, 'ss', NULL, -1, 1570356516690240, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8473634626169052317, 6721663733261741253, 'ca', 0x01, 0, 1570356516689072, 2130706433, NULL, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -8473634626169052317, 6721663733261741253, 'error', 0x343031, 6, 1570356516689072, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8473634626169052317, 6721663733261741253, 'http.method', 0x474554, 6, 1570356516689072, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8473634626169052317, 6721663733261741253, 'http.path', 0x2F6C6F672D6F7065726174652F616C6C, 6, 1570356516689072, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -8473634626169052317, 6721663733261741253, 'http.status_code', 0x343031, 6, 1570356516689072, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -4744816211104456294, -4744816211104456294, 'lc', '', 6, 1570356606371000, -1062731374, NULL, NULL, 'albedo-sys');
INSERT INTO `zipkin_annotations` VALUES (0, -1420273292968258040, -1420273292968258040, 'lc', '', 6, 1570356696749000, -1062731374, NULL, NULL, 'albedo-sys');
COMMIT;

-- ----------------------------
-- Table structure for zipkin_dependencies
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_dependencies`;
CREATE TABLE `zipkin_dependencies` (
  `day` date NOT NULL,
  `parent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `child` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `call_count` bigint(20) DEFAULT NULL,
  `error_count` bigint(20) DEFAULT NULL,
  UNIQUE KEY `day` (`day`,`parent`,`child`) USING BTREE,
  UNIQUE KEY `day_2` (`day`,`parent`,`child`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- ----------------------------
-- Table structure for zipkin_spans
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_spans`;
CREATE TABLE `zipkin_spans` (
  `trace_id_high` bigint(20) NOT NULL DEFAULT '0' COMMENT 'If non zero, this means the trace uses 128 bit traceIds instead of 64 bit',
  `trace_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `debug` bit(1) DEFAULT NULL,
  `start_ts` bigint(20) DEFAULT NULL COMMENT 'Span.timestamp(): epoch micros used for endTs query and to implement TTL',
  `duration` bigint(20) DEFAULT NULL COMMENT 'Span.duration(): micros used for minDuration and maxDuration query',
  UNIQUE KEY `trace_id_high` (`trace_id_high`,`trace_id`,`id`) USING BTREE COMMENT 'ignore insert on duplicate',
  UNIQUE KEY `trace_id_high_4` (`trace_id_high`,`trace_id`,`id`) USING BTREE COMMENT 'ignore insert on duplicate',
  KEY `trace_id_high_2` (`trace_id_high`,`trace_id`,`id`) USING BTREE COMMENT 'for joining with zipkin_annotations',
  KEY `trace_id_high_3` (`trace_id_high`,`trace_id`) USING BTREE COMMENT 'for getTracesByIds',
  KEY `name` (`name`) USING BTREE COMMENT 'for getTraces and getSpanNames',
  KEY `start_ts` (`start_ts`) USING BTREE COMMENT 'for getTraces ordering and range',
  KEY `trace_id_high_5` (`trace_id_high`,`trace_id`,`id`) USING BTREE COMMENT 'for joining with zipkin_annotations',
  KEY `trace_id_high_6` (`trace_id_high`,`trace_id`) USING BTREE COMMENT 'for getTracesByIds',
  KEY `name_2` (`name`) USING BTREE COMMENT 'for getTraces and getSpanNames',
  KEY `start_ts_2` (`start_ts`) USING BTREE COMMENT 'for getTraces ordering and range'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- ----------------------------
-- Records of zipkin_spans
-- ----------------------------
BEGIN;
INSERT INTO `zipkin_spans` VALUES (0, -9164083351855539321, -1096686104612626826, 'get /menu/', -9164083351855539321, NULL, 1570351194238059, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -9164083351855539321, -140317818049489679, 'post', -1096686104612626826, NULL, 1570351194239063, 41036);
INSERT INTO `zipkin_spans` VALUES (0, -8774044539550961860, -8271169407139203534, 'get /log-operate/', -8774044539550961860, NULL, 1570342920890141, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -8774044539550961860, 5901510800400655408, 'post', -8271169407139203534, NULL, 1570342920891078, 19338);
INSERT INTO `zipkin_spans` VALUES (0, -8585459699661708608, -8763089687053228705, 'get', 3941291269230870773, NULL, 1570351987186076, 132205);
INSERT INTO `zipkin_spans` VALUES (0, -8585459699661708608, -4910506172299314995, 'post', 3941291269230870773, NULL, 1570351986850082, 25523);
INSERT INTO `zipkin_spans` VALUES (0, -8585459699661708608, -4524314484574309764, 'async', 3941291269230870773, NULL, 1570351987106000, 283314);
INSERT INTO `zipkin_spans` VALUES (0, -8585459699661708608, -2672718159532941764, 'save-sys-log', 3941291269230870773, NULL, 1570351987108784, 280392);
INSERT INTO `zipkin_spans` VALUES (0, -8585459699661708608, 410906980174918447, 'post', -2672718159532941764, NULL, 1570351987374831, 10640);
INSERT INTO `zipkin_spans` VALUES (0, -8585459699661708608, 3941291269230870773, 'post /dict/', -8585459699661708608, NULL, 1570351986849388, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -8585459699661708608, 4192001947641720101, 'get /dict/all', -2672718159532941764, NULL, 1570351987185508, 135185);
INSERT INTO `zipkin_spans` VALUES (0, -8473634626169052317, 6721663733261741253, 'get', -8473634626169052317, NULL, 1570356516689072, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -8461469795621303889, -6180506607756525729, 'post', -3370784645531572576, NULL, 1570349643033205, 173288);
INSERT INTO `zipkin_spans` VALUES (0, -8461469795621303889, -3370784645531572576, 'get /role/', -8461469795621303889, NULL, 1570349643022619, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -8111783166695558091, 731579691895189936, 'get', -8111783166695558091, NULL, 1570354914680177, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -7041182183303365473, 702138760043331031, 'get /user/info', -7041182183303365473, NULL, 1570351191159049, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -7041182183303365473, 6826095094370864279, 'post', 702138760043331031, NULL, 1570351191159036, 11461);
INSERT INTO `zipkin_spans` VALUES (0, -6880096527785165088, -2291041469826571912, 'post', 3487426452158299168, NULL, 1570343989784072, 11687);
INSERT INTO `zipkin_spans` VALUES (0, -6880096527785165088, 3487426452158299168, 'get /scheme/preview/{id:^[_\',.@a-za-z0-9-]*$}', -6880096527785165088, NULL, 1570343989783099, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -6851193846860752091, -1612965059061589855, 'get /dept/tree', -6851193846860752091, NULL, 1570343076420117, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -6851193846860752091, -854480872596386926, 'post', -1612965059061589855, NULL, 1570343076422081, 16897);
INSERT INTO `zipkin_spans` VALUES (0, -6491321965736703399, -7907588856865747033, 'get /dept/user-tree', -6491321965736703399, NULL, 1570352351272061, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -6491321965736703399, 7125959769401341643, 'post', -7907588856865747033, NULL, 1570352351273075, 57379);
INSERT INTO `zipkin_spans` VALUES (0, -6475268191767339172, 302286372798376426, 'get /menu/', -6475268191767339172, NULL, 1570351210870074, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -6475268191767339172, 3678857894185338710, 'post', 302286372798376426, NULL, 1570351210873402, 34644);
INSERT INTO `zipkin_spans` VALUES (0, -6229014147509267517, -1443311761576867579, 'post', 3667277185845595605, NULL, 1570355911258104, 32906);
INSERT INTO `zipkin_spans` VALUES (0, -6229014147509267517, 3255947693587827990, 'post', 4730762743047074444, NULL, 1570355911492344, 4176);
INSERT INTO `zipkin_spans` VALUES (0, -6229014147509267517, 3667277185845595605, 'post /role', -6229014147509267517, NULL, 1570355911256091, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -6229014147509267517, 4730762743047074444, 'save-sys-log', 3667277185845595605, NULL, 1570355911487081, 11028);
INSERT INTO `zipkin_spans` VALUES (0, -6229014147509267517, 7252299777426563390, 'async', 3667277185845595605, NULL, 1570355911487000, 11262);
INSERT INTO `zipkin_spans` VALUES (0, -5863889465431934417, -5602058143072541818, 'post', 3256545100157656463, NULL, 1570346620231105, 26764);
INSERT INTO `zipkin_spans` VALUES (0, -5863889465431934417, 3256545100157656463, 'get /dict/', -5863889465431934417, NULL, 1570346620230219, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -5827841547953027486, -959917097985667214, 'get /dict/', -5827841547953027486, NULL, 1570343247977313, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -5827841547953027486, 8474263428810279882, 'post', -959917097985667214, NULL, 1570343247980142, 22685);
INSERT INTO `zipkin_spans` VALUES (0, -5579354880552029934, -5579354880552029934, 'async', NULL, NULL, 1570355673761000, 34997);
INSERT INTO `zipkin_spans` VALUES (0, -5281163928884064354, -5281163928884064354, 'async', NULL, NULL, 1570354199802000, 610237);
INSERT INTO `zipkin_spans` VALUES (0, -5135369690576007167, 7996344967320833495, 'post', -5135369690576007167, NULL, 1570356478956428, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -4744816211104456294, -4744816211104456294, 'async', NULL, NULL, 1570356606371000, 80241);
INSERT INTO `zipkin_spans` VALUES (0, -3759610814858526023, -3035361835060797064, 'get /menu/', -3759610814858526023, NULL, 1570342989312128, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -3759610814858526023, -1427032647807353880, 'post', -3035361835060797064, NULL, 1570342989313101, 12518);
INSERT INTO `zipkin_spans` VALUES (0, -3457150614930525960, -1118169706466489917, 'post', 4153903581771765967, NULL, 1570354633752307, 98850);
INSERT INTO `zipkin_spans` VALUES (0, -3457150614930525960, 4153903581771765967, 'get /role/{id:^[_\',.@a-za-z0-9-]*$}', -3457150614930525960, NULL, 1570354633714740, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -3217056806042716194, -5041793035261182993, 'get /menu/', -3217056806042716194, NULL, 1570350413114335, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -3217056806042716194, -4669033157896051385, 'post', -5041793035261182993, NULL, 1570350413128185, 78055);
INSERT INTO `zipkin_spans` VALUES (0, -3177388740964964208, -3177388740964964208, 'async', NULL, NULL, 1570355342433000, 33025);
INSERT INTO `zipkin_spans` VALUES (0, -2931365814843956215, -1872824351246856994, 'post', 2988228542878624813, NULL, 1570351026950038, 1151453);
INSERT INTO `zipkin_spans` VALUES (0, -2931365814843956215, 2988228542878624813, 'get /menu/tree', -2931365814843956215, NULL, 1570351026949057, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -2898404041317266350, -5673133534168528367, 'get /menu/', -2898404041317266350, NULL, 1570350464732084, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -2898404041317266350, 5926428325137291458, 'post', -5673133534168528367, NULL, 1570350464734041, 45424);
INSERT INTO `zipkin_spans` VALUES (0, -2866627072339136163, -2866627072339136163, 'async', NULL, NULL, 1570355482761000, 612535);
INSERT INTO `zipkin_spans` VALUES (0, -2814173265754954973, -1921196991192632000, 'get', -2814173265754954973, NULL, 1570356516105088, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -2765120839012649538, -2765120839012649538, 'async', NULL, NULL, 1570353329568000, 81375);
INSERT INTO `zipkin_spans` VALUES (0, -2530637461577789025, -6377453088129202010, 'get /role/{id:^[_\',.@a-za-z0-9-]*$}', -2530637461577789025, NULL, 1570354281825498, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -2530637461577789025, 5036812627426709880, 'post', -6377453088129202010, NULL, 1570354281826198, 23950);
INSERT INTO `zipkin_spans` VALUES (0, -2260878341863413466, -4803110280005744182, 'post', 1217578381994860080, NULL, 1570343477685277, 11246);
INSERT INTO `zipkin_spans` VALUES (0, -2260878341863413466, 1217578381994860080, 'get /table/table-list', -2260878341863413466, NULL, 1570343477684066, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -2189493252256832576, 657223020078651992, 'get /menu/tree', -2189493252256832576, NULL, 1570351077562254, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -2189493252256832576, 7220229293800246386, 'post', 657223020078651992, NULL, 1570351077567057, 48262);
INSERT INTO `zipkin_spans` VALUES (0, -2180519221981865463, -2180519221981865463, 'async', NULL, NULL, 1570352564350000, 37497);
INSERT INTO `zipkin_spans` VALUES (0, -1710691596464403680, -1406324572592522086, 'post', 5605314515774723917, NULL, 1570349643033205, 173288);
INSERT INTO `zipkin_spans` VALUES (0, -1710691596464403680, 5605314515774723917, 'get /dept/user-tree', -1710691596464403680, NULL, 1570349643022647, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -1567840922948369379, -4111769308798134084, 'get /dict/codes', -1567840922948369379, NULL, 1570355691044477, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -1567840922948369379, -1210768656854980755, 'post', -4111769308798134084, NULL, 1570355691103545, 112131);
INSERT INTO `zipkin_spans` VALUES (0, -1420273292968258040, -1420273292968258040, 'async', NULL, NULL, 1570356696749000, 34138);
INSERT INTO `zipkin_spans` VALUES (0, -1406163629589379033, -5110643198949506854, 'post', 3872675443178481801, NULL, 1570354526790067, 5113);
INSERT INTO `zipkin_spans` VALUES (0, -1406163629589379033, -4541268023339478345, 'post /role', -1406163629589379033, NULL, 1570354526404166, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -1406163629589379033, 3872675443178481801, 'save-sys-log', -4541268023339478345, NULL, 1570354526780114, 20369);
INSERT INTO `zipkin_spans` VALUES (0, -1406163629589379033, 7739788925909492731, 'async', -4541268023339478345, NULL, 1570354526780000, 20628);
INSERT INTO `zipkin_spans` VALUES (0, -1406163629589379033, 8391279358867437147, 'post', -4541268023339478345, NULL, 1570354526408311, 23369);
INSERT INTO `zipkin_spans` VALUES (0, -1311477175517260020, -6011703719044636176, 'get /role/combo-data', -1311477175517260020, NULL, 1570342915256078, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -1311477175517260020, -4135916356677102999, 'post', -6011703719044636176, NULL, 1570342915257369, 40595);
INSERT INTO `zipkin_spans` VALUES (0, -907301845752286172, 3401748284722463840, 'get /table/', -907301845752286172, NULL, 1570352624305232, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -907301845752286172, 5404289225227278529, 'post', 3401748284722463840, NULL, 1570352624307157, 57023);
INSERT INTO `zipkin_spans` VALUES (0, -879089909139587202, -8311636133937507900, 'post', -7738675970428162549, NULL, 1570346624003085, 13427);
INSERT INTO `zipkin_spans` VALUES (0, -879089909139587202, -7738675970428162549, 'get /menu/tree', -879089909139587202, NULL, 1570346624002075, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -332632017839300986, 5559048839347872850, 'post', 6595257905917975426, NULL, 1570354865560071, 17620);
INSERT INTO `zipkin_spans` VALUES (0, -332632017839300986, 6595257905917975426, 'get /token/', -332632017839300986, NULL, 1570354865558238, NULL);
INSERT INTO `zipkin_spans` VALUES (0, -332632017839300986, 8255404931167176940, 'post', 6595257905917975426, NULL, 1570354865581081, 41874);
INSERT INTO `zipkin_spans` VALUES (0, -175846299125394258, 6064403489398866333, 'post', 7264064309960648424, NULL, 1570342988649092, 15334);
INSERT INTO `zipkin_spans` VALUES (0, -175846299125394258, 7264064309960648424, 'get /role/combo-data', -175846299125394258, NULL, 1570342988647097, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 263136038163893578, -7532825404173961437, 'get /dept/user-tree', 263136038163893578, NULL, 1570342917861525, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 263136038163893578, 7740029919066051079, 'post', -7532825404173961437, NULL, 1570342917864249, 28314);
INSERT INTO `zipkin_spans` VALUES (0, 495403557940151737, -3863234268671894924, 'post', 8239167323840955988, NULL, 1570350547572053, 15311);
INSERT INTO `zipkin_spans` VALUES (0, 495403557940151737, 8239167323840955988, 'get /role/', 495403557940151737, NULL, 1570350547570062, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 660507369565480960, 660507369565480960, 'get', NULL, NULL, 1570355882226087, 1051);
INSERT INTO `zipkin_spans` VALUES (0, 1123652407958989884, -7055851149456731185, 'async', 5393439888350108162, NULL, 1570355912147000, 12211);
INSERT INTO `zipkin_spans` VALUES (0, 1123652407958989884, -6157894490948560721, 'post', 5393439888350108162, NULL, 1570355911645177, 43765);
INSERT INTO `zipkin_spans` VALUES (0, 1123652407958989884, -5886769550749699667, 'save-sys-log', 5393439888350108162, NULL, 1570355912147076, 12012);
INSERT INTO `zipkin_spans` VALUES (0, 1123652407958989884, -5327570527466307459, 'post', -5886769550749699667, NULL, 1570355912152739, 4708);
INSERT INTO `zipkin_spans` VALUES (0, 1123652407958989884, 5393439888350108162, 'post /role', 1123652407958989884, NULL, 1570355911640560, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 1530031099109849610, -3917057402684408490, 'post', -1046061539289820626, NULL, 1570352258595050, 276587);
INSERT INTO `zipkin_spans` VALUES (0, 1530031099109849610, -1046061539289820626, 'get /role/combo-data', 1530031099109849610, NULL, 1570352258594131, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 1738549377126299291, -9124471694244522353, 'post', -5920579996029014846, NULL, 1570351237963038, 6699);
INSERT INTO `zipkin_spans` VALUES (0, 1738549377126299291, -5920579996029014846, 'get /menu/{id:^[_\',.@a-za-z0-9-]*$}', 1738549377126299291, NULL, 1570351237962047, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 1990208109218521674, -942292888007794411, 'post', 3032054266478089488, NULL, 1570344013309064, 15165);
INSERT INTO `zipkin_spans` VALUES (0, 1990208109218521674, 3032054266478089488, 'get /scheme/', 1990208109218521674, NULL, 1570344013308103, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 2706481719270250632, -5978446170345471492, 'get /table/', 2706481719270250632, NULL, 1570343956811140, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 2706481719270250632, -3169088598126860024, 'post', -5978446170345471492, NULL, 1570343956812076, 10806);
INSERT INTO `zipkin_spans` VALUES (0, 3364318480226850634, 3364318480226850634, 'async', NULL, NULL, 1570356126835000, 50790);
INSERT INTO `zipkin_spans` VALUES (0, 3381120266614656773, 3381120266614656773, 'async', NULL, NULL, 1570354617794000, 226927);
INSERT INTO `zipkin_spans` VALUES (0, 3533156003377230797, 3546834248815888858, 'get /dept/user-tree', 3533156003377230797, NULL, 1570352258601111, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 3533156003377230797, 8285022025861572222, 'post', 3546834248815888858, NULL, 1570352258602063, 306388);
INSERT INTO `zipkin_spans` VALUES (0, 3546624354454334774, 3479779267772991344, 'post', 9006292814368331135, NULL, 1570346624105355, 23203);
INSERT INTO `zipkin_spans` VALUES (0, 3546624354454334774, 9006292814368331135, 'get /menu/', 3546624354454334774, NULL, 1570346624104139, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 3572073428785154189, 2348464483063558439, 'post', 3011068575621052770, NULL, 1570342987487147, 24381);
INSERT INTO `zipkin_spans` VALUES (0, 3572073428785154189, 3011068575621052770, 'get /log-operate/', 3572073428785154189, NULL, 1570342987486088, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 3776280420139755533, 3776280420139755533, 'async', NULL, NULL, 1570355399645000, 98924);
INSERT INTO `zipkin_spans` VALUES (0, 4410421779105769252, -8339431763020122532, 'get /menu/', 4410421779105769252, NULL, 1570350526917145, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 4410421779105769252, 3150037890371694372, 'post', -8339431763020122532, NULL, 1570350526918124, 48209);
INSERT INTO `zipkin_spans` VALUES (0, 4629830708316230902, -2311336501018229615, 'post', 5688049415191538843, NULL, 1570343710434212, 25060);
INSERT INTO `zipkin_spans` VALUES (0, 4629830708316230902, 5688049415191538843, 'get /menu/user-menu', 4629830708316230902, NULL, 1570343710432577, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 4977817793071680634, -1061563939586550821, 'get /menu/tree', 4977817793071680634, NULL, 1570350704530049, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 4977817793071680634, 4458976456185211481, 'post', -1061563939586550821, NULL, 1570350704531042, 11838);
INSERT INTO `zipkin_spans` VALUES (0, 5572573745800778057, 5572573745800778057, 'async', NULL, NULL, 1570356433928000, 130083);
INSERT INTO `zipkin_spans` VALUES (0, 6060208758854745426, -8184925278860820506, 'post', 4458503812852785556, NULL, 1570354520821070, 75347);
INSERT INTO `zipkin_spans` VALUES (0, 6060208758854745426, 4458503812852785556, 'get /role/{id:^[_\',.@a-za-z0-9-]*$}', 6060208758854745426, NULL, 1570354520820103, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 6221183179339990787, 494693927340475637, 'post', 6157417819447908503, NULL, 1570351159540079, 34701);
INSERT INTO `zipkin_spans` VALUES (0, 6221183179339990787, 2370008347572535543, 'post', 6157417819447908503, NULL, 1570351159518061, 16201);
INSERT INTO `zipkin_spans` VALUES (0, 6221183179339990787, 6157417819447908503, 'get /token/', 6221183179339990787, NULL, 1570351159518088, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 6619226613136444073, -7814300868678066722, 'get /scheme/', 6619226613136444073, NULL, 1570352198757171, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 6619226613136444073, -5769681611853638289, 'post', -7814300868678066722, NULL, 1570352198763731, 62741);
INSERT INTO `zipkin_spans` VALUES (0, 6998356862035039207, 6998356862035039207, 'async', NULL, NULL, 1570355418452000, 406161);
INSERT INTO `zipkin_spans` VALUES (0, 7567416797288916629, 7567416797288916629, 'post', NULL, NULL, 1570355874631363, 2149);
INSERT INTO `zipkin_spans` VALUES (0, 7991851767244960667, -9092462615264219908, 'post', -9020930152805207219, NULL, 1570350551450084, 23892);
INSERT INTO `zipkin_spans` VALUES (0, 7991851767244960667, -9020930152805207219, 'get /role/', 7991851767244960667, NULL, 1570350551439860, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 8058490489740808334, 8058490489740808334, 'async', NULL, NULL, 1570353082423000, 37258);
INSERT INTO `zipkin_spans` VALUES (0, 8134530858925309630, -5588558111139636413, 'post', -4177533179615211760, NULL, 1570349684798120, 25358);
INSERT INTO `zipkin_spans` VALUES (0, 8134530858925309630, -4177533179615211760, 'get /log-operate/', 8134530858925309630, NULL, 1570349684795586, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 8935671704794550875, -7719016929993797050, 'post', -6698818047588430965, NULL, 1570351091779068, 64601);
INSERT INTO `zipkin_spans` VALUES (0, 8935671704794550875, -6698818047588430965, 'get /token/', 8935671704794550875, NULL, 1570351091760054, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 8935671704794550875, 7706154167989123339, 'post', -6698818047588430965, NULL, 1570351091761087, 12439);
INSERT INTO `zipkin_spans` VALUES (0, 8949017381701860006, 6798935207743092169, 'post', 7093096363649548776, NULL, 1570351077580074, 23773);
INSERT INTO `zipkin_spans` VALUES (0, 8949017381701860006, 7093096363649548776, 'get /menu/', 8949017381701860006, NULL, 1570351077579070, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 9076804610333231284, -7258013721882416308, 'post', 1950267377217765997, NULL, 1570352209146043, 37682);
INSERT INTO `zipkin_spans` VALUES (0, 9076804610333231284, 1950267377217765997, 'get /log-operate/', 9076804610333231284, NULL, 1570352209145049, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 9080496735260560859, -3790680084196989992, 'get /job-log/', 9080496735260560859, NULL, 1570351914552410, NULL);
INSERT INTO `zipkin_spans` VALUES (0, 9080496735260560859, 6143930383645515548, 'post', -3790680084196989992, NULL, 1570351914553149, 105518);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
