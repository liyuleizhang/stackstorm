/*
 Navicat Premium Data Transfer

 Source Server         : 172.16.0.6
 Source Server Type    : MySQL
 Source Server Version : 50630
 Source Host           : 172.16.0.6:3306
 Source Schema         : one_infrastructure

 Target Server Type    : MySQL
 Target Server Version : 50630
 File Encoding         : 65001

 Date: 11/10/2018 10:26:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
use one_infrastructure;

INSERT INTO `t_region` VALUES ('1', '2018-08-28 17:23:27', 'bf8d1a19-ad46-4297-ada2-d1095409121c', '0', '2018-08-28 17:23:27', 'bf8d1a19-ad46-4297-ada2-d1095409121c', null, '成都数据中心');

INSERT INTO `t_system` VALUES ('1', '2018-11-08 17:04:08', 'bf8d1a19-ad46-4297-ada2-d1095409121c', '0', '2018-11-08 17:04:08', 'bf8d1a19-ad46-4297-ada2-d1095409121c', 'endpoint', '1', '数据一张图', '/statistics-ui/', '0', 'test', 'test', '统计系统', '1');
INSERT INTO `t_system` VALUES ('2', '2018-11-08 17:04:08', 'bf8d1a19-ad46-4297-ada2-d1095409121c', '0', '2018-11-08 17:04:08', 'bf8d1a19-ad46-4297-ada2-d1095409121c', 'endpoint', '1', '服务交付平台', '/wh-admin-ui/', '0', 'xx2', '2x1x21x', '服务交付系统', '1');
INSERT INTO `t_system` VALUES ('5', '2018-10-09 17:11:18', 'admin', '0', '2018-10-09 17:11:18', 'admin', 'endpoint', '1', '数据治理平台', '/hubble-ui/metag/partitionOverview', '0', 'xx', 'xxx', '大数据服务系统', '1');


-- ----------------------------
-- Records of t_upms_permission_resource
-- ----------------------------
INSERT INTO `t_upms_permission_resource` VALUES (435, '2018-08-13 17:41:10', NULL, 0, '2018-08-13 17:41:10', NULL, '用户中心', 'fast.admin.userCenter', NULL, 0, 'header', '', 'icon-yhzx2', 'abc', 0);
INSERT INTO `t_upms_permission_resource` VALUES (436, '2018-08-13 17:41:10', NULL, 0, '2018-08-13 17:41:10', NULL, '租户管理', 'fast.admin.userCenter.tenantManage', 435, 0, '', 'fast.admin.userCenter.tenantManage', NULL, 'abc', 0);
INSERT INTO `t_upms_permission_resource` VALUES (437, '2018-08-13 17:41:10', NULL, 0, '2018-08-13 17:41:10', NULL, '用户管理', 'fast.admin.userCenter.userList', 435, 0, '', 'fast.admin.userCenter.userList', NULL, 'fast.admin.userCenter.userList', 0);
INSERT INTO `t_upms_permission_resource` VALUES (438, '2018-08-13 17:41:10', NULL, 0, '2018-08-13 17:41:10', NULL, '管理员角色管理', 'fast.admin.userCenter.managerRoleManagement', 435, 0, '', 'fast.admin.userCenter.managerRoleManagement', NULL, 'fast.admin.userCenter.managerRoleManagement', 0);
INSERT INTO `t_upms_permission_resource` VALUES (439, '2018-08-13 17:41:10', NULL, 0, '2018-08-13 17:41:10', NULL, '用户角色管理', 'fast.admin.userCenter.userRoleManagement', 435, 0, '', 'fast.admin.userCenter.userRoleManagement', NULL, 'fast.admin.userCenter.userRoleManagement', 0);
INSERT INTO `t_upms_permission_resource` VALUES (440, '2018-08-13 17:41:10', NULL, 0, '2018-08-13 17:41:10', NULL, '工单中心', 'fast.admin.workOrderManagement', NULL, 0, 'header', '', 'icon-mir-gdzx', 'cc_per_nav_statistic', 0);
INSERT INTO `t_upms_permission_resource` VALUES (441, '2018-08-13 17:41:10', NULL, 0, '2018-08-13 17:41:10', NULL, '工单管理', 'fast.admin.workOrderManagement.all', 440, 0, '', 'fast.admin.workOrderManagement.all', NULL, 'fast.admin.workOrderManagement.all', 0);
INSERT INTO `t_upms_permission_resource` VALUES (442, '2018-08-13 17:41:10', NULL, 0, '2018-08-13 17:41:10', NULL, '工单类型管理', 'fast.admin.workOrderManagement.type', 440, 0, '', 'fast.admin.workOrderManagement.type', NULL, 'fast.admin.workOrderManagement.type', 0);
INSERT INTO `t_upms_permission_resource` VALUES (443, '2018-08-13 17:41:10', NULL, 0, '2018-08-13 17:41:10', NULL, '平台配置', 'fast.admin.platformConfiguration', NULL, 0, 'header', '', 'icon-mir-ptpz', 'cc_per_nav_statistic', 0);
INSERT INTO `t_upms_permission_resource` VALUES (444, '2018-08-13 17:41:10', NULL, 0, '2018-08-13 17:41:10', NULL, '安全配置', 'fast.admin.platformConfiguration.securityConfig', 443, 0, '', 'fast.admin.platformConfiguration.securityConfig', NULL, 'fast.admin.platformConfiguration.securityConfig', 0);
INSERT INTO `t_upms_permission_resource` VALUES (445, '2018-08-13 17:41:10', NULL, 0, '2018-08-13 17:41:10', NULL, '个性化配置', 'fast.admin.platformConfiguration.personalConfig', 443, 0, '', 'fast.admin.platformConfiguration.personalConfig', NULL, 'fast.admin.platformConfiguration.personalConfig', 0);
INSERT INTO `t_upms_permission_resource` VALUES (446, '2018-08-13 17:41:10', NULL, 0, '2018-08-13 17:41:10', NULL, '审计管理', 'fast.admin.auditManagement.', NULL, 0, 'header', '', 'icon-sjgl1', 'cc_per_nav_statistic', 0);
INSERT INTO `t_upms_permission_resource` VALUES (447, '2018-08-13 17:41:10', NULL, 0, '2018-08-13 17:41:10', NULL, '登录日志', 'fast.admin.auditManagement.loginLog', 446, 0, '', 'fast.admin.auditManagement.loginLog', NULL, 'fast.admin.auditManagement.loginLog', 0);
INSERT INTO `t_upms_permission_resource` VALUES (796, '2019-05-09 17:31:51', NULL, 0, '2019-05-09 17:31:41', NULL, '操作日志', 'fast.admin.auditManagement.auditLog', 446, 0, NULL, 'fast.admin.auditManagement.auditLog', NULL, 'fast.admin.auditManagement.auditLog', 0);
INSERT INTO `t_upms_permission_resource` VALUES (1027, '2018-08-13 17:41:10', NULL, 0, '2018-08-13 17:41:10', NULL, '监控平台', 'fast.admin.monitor', NULL, 0, '', 'fast.admin.monitor', 'icon-gly-jktj', 'fast.admin.monitor', 0);
-- ----------------------------
-- Records of t_upms_role_permission_resource_mapping
-- ----------------------------
INSERT INTO `t_upms_role_permission_resource_mapping` VALUES (1280, '2018-09-13 18:29:04', NULL, NULL, '2018-09-13 18:29:04', NULL, '0b8810c8-ed82-48e2-a895-d98dc0da4c7a', 435);
INSERT INTO `t_upms_role_permission_resource_mapping` VALUES (1281, '2018-09-13 18:29:04', NULL, NULL, '2018-09-13 18:29:04', NULL, '0b8810c8-ed82-48e2-a895-d98dc0da4c7a', 436);
INSERT INTO `t_upms_role_permission_resource_mapping` VALUES (1282, '2018-09-13 18:29:04', NULL, NULL, '2018-09-13 18:29:04', NULL, '0b8810c8-ed82-48e2-a895-d98dc0da4c7a', 437);
INSERT INTO `t_upms_role_permission_resource_mapping` VALUES (1283, '2018-09-13 18:29:04', NULL, NULL, '2018-09-13 18:29:04', NULL, '0b8810c8-ed82-48e2-a895-d98dc0da4c7a', 438);
INSERT INTO `t_upms_role_permission_resource_mapping` VALUES (1284, '2018-09-13 18:29:04', NULL, NULL, '2018-09-13 18:29:04', NULL, '0b8810c8-ed82-48e2-a895-d98dc0da4c7a', 439);
-- INSERT INTO `t_upms_role_permission_resource_mapping` VALUES (1285, '2018-09-13 18:29:04', NULL, NULL, '2018-09-13 18:29:04', NULL, '0b8810c8-ed82-48e2-a895-d98dc0da4c7a', 440);
-- INSERT INTO `t_upms_role_permission_resource_mapping` VALUES (1286, '2018-09-13 18:29:04', NULL, NULL, '2018-09-13 18:29:04', NULL, '0b8810c8-ed82-48e2-a895-d98dc0da4c7a', 441);
-- INSERT INTO `t_upms_role_permission_resource_mapping` VALUES (1287, '2018-09-13 18:29:04', NULL, NULL, '2018-09-13 18:29:04', NULL, '0b8810c8-ed82-48e2-a895-d98dc0da4c7a', 442);
-- INSERT INTO `t_upms_role_permission_resource_mapping` VALUES (1288, '2018-09-13 18:29:04', NULL, NULL, '2018-09-13 18:29:04', NULL, '0b8810c8-ed82-48e2-a895-d98dc0da4c7a', 443);
-- INSERT INTO `t_upms_role_permission_resource_mapping` VALUES (1289, '2018-09-13 18:29:04', NULL, NULL, '2018-09-13 18:29:04', NULL, '0b8810c8-ed82-48e2-a895-d98dc0da4c7a', 444);
-- INSERT INTO `t_upms_role_permission_resource_mapping` VALUES (1290, '2018-09-13 18:29:04', NULL, NULL, '2018-09-13 18:29:04', NULL, '0b8810c8-ed82-48e2-a895-d98dc0da4c7a', 445);
-- INSERT INTO `t_upms_role_permission_resource_mapping` VALUES (1291, '2018-09-13 18:29:04', NULL, NULL, '2018-09-13 18:29:04', NULL, '0b8810c8-ed82-48e2-a895-d98dc0da4c7a', 446);
-- INSERT INTO `t_upms_role_permission_resource_mapping` VALUES (1292, '2018-09-13 18:29:04', NULL, NULL, '2018-09-13 18:29:04', NULL, '0b8810c8-ed82-48e2-a895-d98dc0da4c7a', 447);

