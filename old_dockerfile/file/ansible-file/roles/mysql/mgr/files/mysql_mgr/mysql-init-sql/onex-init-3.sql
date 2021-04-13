SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
use one_infrastructure;

-- ----------------------------
-- Table structure for migration_model
-- ----------------------------
DROP TABLE IF EXISTS `migration_model`;
CREATE TABLE `migration_model` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of migration_model
-- ----------------------------
INSERT INTO `migration_model` VALUES ('SINGLETON', '3.4.0');

-- ----------------------------
-- Table structure for offline_client_session
-- ----------------------------
DROP TABLE IF EXISTS `offline_client_session`;
CREATE TABLE `offline_client_session` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `DATA` longtext,
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`OFFLINE_FLAG`) USING BTREE,
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of offline_client_session
-- ----------------------------

-- ----------------------------
-- Table structure for offline_user_session
-- ----------------------------
DROP TABLE IF EXISTS `offline_user_session`;
CREATE TABLE `offline_user_session` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of offline_user_session
-- ----------------------------

-- ----------------------------
-- Table structure for policy_config
-- ----------------------------
DROP TABLE IF EXISTS `policy_config`;
CREATE TABLE `policy_config` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`) USING BTREE,
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of policy_config
-- ----------------------------
INSERT INTO `policy_config` VALUES ('11fcaeb7-8a5b-4f97-8803-22812ebfd584', 'code', '// by default, grants any permission associated with this policy\n$evaluation.grant();\n');
INSERT INTO `policy_config` VALUES ('4a37fd1a-3c87-4688-ac8f-c14aef4cec6e', 'defaultResourceType', 'urn:admin-client:resources:default');
INSERT INTO `policy_config` VALUES ('58c77104-cdf1-4a1c-a32f-bc201fe3e83b', 'code', '// by default, grants any permission associated with this policy\n$evaluation.grant();\n');
INSERT INTO `policy_config` VALUES ('833231dd-5dec-4b80-bc27-0c302d6c6820', 'defaultResourceType', 'urn:user-client:resources:default');

-- ----------------------------
-- Table structure for protocol_mapper
-- ----------------------------
DROP TABLE IF EXISTS `protocol_mapper`;
CREATE TABLE `protocol_mapper` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_TEXT` varchar(255) DEFAULT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_TEMPLATE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`) USING BTREE,
  KEY `IDX_PROTO_MAPP_CLIENT_TEMPL` (`CLIENT_TEMPLATE_ID`) USING BTREE,
  CONSTRAINT `FK_CLI_TMPLT_MAPPER` FOREIGN KEY (`CLIENT_TEMPLATE_ID`) REFERENCES `client_template` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of protocol_mapper
-- ----------------------------
INSERT INTO `protocol_mapper` VALUES ('010bef20-28db-4a0f-a266-40637a840a1b', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${username}', 'b3c0ea5f-1829-4e3c-90ff-70d7c4fda34a', null);
INSERT INTO `protocol_mapper` VALUES ('07b27d24-d53a-41bd-8a01-66d56fa9a725', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${email}', '98d018b0-db18-4f60-9f6d-62e299fdb6de', null);
INSERT INTO `protocol_mapper` VALUES ('0ba24002-7d0a-4864-8bb0-fcd263919a2e', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${familyName}', '03bff8cd-1776-4ffb-9c2d-3e8d4dd2713f', null);
INSERT INTO `protocol_mapper` VALUES ('0ca30930-665f-4d12-a85e-35e60a06ea97', 'Client ID', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '\0', '', 'eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', null);
INSERT INTO `protocol_mapper` VALUES ('0d602845-ac2b-429a-8174-c89bd32276b3', 'full name', 'openid-connect', 'oidc-full-name-mapper', '', '${fullName}', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null);
INSERT INTO `protocol_mapper` VALUES ('0e8a4b42-a131-490a-8a73-a985f9178452', 'full name', 'openid-connect', 'oidc-full-name-mapper', '', '${fullName}', 'b3c0ea5f-1829-4e3c-90ff-70d7c4fda34a', null);
INSERT INTO `protocol_mapper` VALUES ('0f32955e-2d3c-4a4c-bd17-6655cefca754', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${givenName}', 'b3c0ea5f-1829-4e3c-90ff-70d7c4fda34a', null);
INSERT INTO `protocol_mapper` VALUES ('10ccfe61-4d39-4c7d-9980-728601b92ce7', 'role list', 'saml', 'saml-role-list-mapper', '\0', null, 'a88c73bb-b26d-469a-ba62-974607334ee3', null);
INSERT INTO `protocol_mapper` VALUES ('10fd150f-4448-42e2-ab9c-62163e0f2dab', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${username}', '98d018b0-db18-4f60-9f6d-62e299fdb6de', null);
INSERT INTO `protocol_mapper` VALUES ('13631580-1c6d-4032-89d3-c9c09036298a', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${email}', 'eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', null);
INSERT INTO `protocol_mapper` VALUES ('1d800edc-a13a-445a-bca2-48c8ce87d280', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${username}', 'a88c73bb-b26d-469a-ba62-974607334ee3', null);
INSERT INTO `protocol_mapper` VALUES ('1f0d183c-5b16-4603-bb46-cfb988106880', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${email}', 'a88c73bb-b26d-469a-ba62-974607334ee3', null);
INSERT INTO `protocol_mapper` VALUES ('23125207-a3cd-40aa-86bc-e4757cd39761', 'full name', 'openid-connect', 'oidc-full-name-mapper', '', '${fullName}', '8d79b1b4-ef33-4aab-9050-07fdc4d05c7a', null);
INSERT INTO `protocol_mapper` VALUES ('2329776b-e0c8-4f19-9a53-f88065db31d1', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${username}', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null);
INSERT INTO `protocol_mapper` VALUES ('26dfbdcc-7fdf-495e-acfb-7bc0f9ff2375', 'full name', 'openid-connect', 'oidc-full-name-mapper', '', '${fullName}', 'bbfee872-0023-4535-98d0-bb2a81b650a8', null);
INSERT INTO `protocol_mapper` VALUES ('283bae82-99b6-4637-bf2d-739b83a13b10', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${email}', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null);
INSERT INTO `protocol_mapper` VALUES ('297075e4-1b78-4bd5-ab40-bb653fe3a9ce', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${givenName}', 'bbfee872-0023-4535-98d0-bb2a81b650a8', null);
INSERT INTO `protocol_mapper` VALUES ('2e772a8c-fe10-41f6-90e7-9b225ecbc465', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${email}', 'bbfee872-0023-4535-98d0-bb2a81b650a8', null);
INSERT INTO `protocol_mapper` VALUES ('2f57e62d-3189-4153-b4b5-8b28224359b8', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${familyName}', '8d79b1b4-ef33-4aab-9050-07fdc4d05c7a', null);
INSERT INTO `protocol_mapper` VALUES ('338308a1-3972-407a-9f2a-4cc345d42b49', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${givenName}', 'f966b688-394d-41de-a79b-fa8ed800587d', null);
INSERT INTO `protocol_mapper` VALUES ('358ce5cf-23bd-4a72-b691-393e0b13a2ea', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${givenName}', 'c60de944-62eb-4773-b1f4-550be57b3f25', null);
INSERT INTO `protocol_mapper` VALUES ('371fd1af-8dc6-4794-a9c1-67f6534578c2', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${givenName}', '33958903-5b08-4a0e-b27d-2a046631ddae', null);
INSERT INTO `protocol_mapper` VALUES ('39f17e02-59fd-4e39-8ccf-7c12c01385e7', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${givenName}', '8d79b1b4-ef33-4aab-9050-07fdc4d05c7a', null);
INSERT INTO `protocol_mapper` VALUES ('3d76d31e-2ffb-447e-8043-9e5f9b979f38', 'Client Host', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '\0', '', 'c60de944-62eb-4773-b1f4-550be57b3f25', null);
INSERT INTO `protocol_mapper` VALUES ('3e405eeb-6f66-48a7-a36e-efaa344aedaf', 'role list', 'saml', 'saml-role-list-mapper', '\0', null, '33958903-5b08-4a0e-b27d-2a046631ddae', null);
INSERT INTO `protocol_mapper` VALUES ('41759180-2930-4d11-bd14-4517910a9f9f', 'role list', 'saml', 'saml-role-list-mapper', '\0', null, '8d79b1b4-ef33-4aab-9050-07fdc4d05c7a', null);
INSERT INTO `protocol_mapper` VALUES ('4846c79e-ddf7-4c2f-9dfb-e3c22d45ccd5', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${familyName}', '98d018b0-db18-4f60-9f6d-62e299fdb6de', null);
INSERT INTO `protocol_mapper` VALUES ('48c3552c-03dd-4923-b000-08428dac9630', 'Client IP Address', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '\0', '', 'eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', null);
INSERT INTO `protocol_mapper` VALUES ('4e3d37da-3172-4921-9892-da963bf591ce', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${username}', '8d79b1b4-ef33-4aab-9050-07fdc4d05c7a', null);
INSERT INTO `protocol_mapper` VALUES ('55b7ec19-387a-442e-8aae-29c861c08369', 'full name', 'openid-connect', 'oidc-full-name-mapper', '', '${fullName}', '03bff8cd-1776-4ffb-9c2d-3e8d4dd2713f', null);
INSERT INTO `protocol_mapper` VALUES ('56e63080-ea61-4b48-a4ec-8c450b668037', 'role list', 'saml', 'saml-role-list-mapper', '\0', null, 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null);
INSERT INTO `protocol_mapper` VALUES ('57105df1-4802-4760-a1d4-0f87b3c0331b', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${username}', 'c60de944-62eb-4773-b1f4-550be57b3f25', null);
INSERT INTO `protocol_mapper` VALUES ('586551fb-c32d-4224-9394-e9a65e3fd85a', 'full name', 'openid-connect', 'oidc-full-name-mapper', '', '${fullName}', '98d018b0-db18-4f60-9f6d-62e299fdb6de', null);
INSERT INTO `protocol_mapper` VALUES ('5a747f91-a008-4392-a0d8-900d1a7583a6', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${familyName}', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null);
INSERT INTO `protocol_mapper` VALUES ('5b2f0b2e-e2fd-4a91-b067-ccd5ca1e2278', 'role list', 'saml', 'saml-role-list-mapper', '\0', null, 'eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', null);
INSERT INTO `protocol_mapper` VALUES ('5cfd668e-d124-49a2-baeb-7e92c1c11620', 'role list', 'saml', 'saml-role-list-mapper', '\0', null, 'b3c0ea5f-1829-4e3c-90ff-70d7c4fda34a', null);
INSERT INTO `protocol_mapper` VALUES ('6a78d756-a324-4a14-81f3-a442bacf2d42', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${familyName}', 'eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', null);
INSERT INTO `protocol_mapper` VALUES ('6b07cf8e-1421-40e0-8b7c-4913aaaef41b', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${username}', '03bff8cd-1776-4ffb-9c2d-3e8d4dd2713f', null);
INSERT INTO `protocol_mapper` VALUES ('6e3b7ef5-3b4a-4b6c-a664-9975a8b99759', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${email}', '03bff8cd-1776-4ffb-9c2d-3e8d4dd2713f', null);
INSERT INTO `protocol_mapper` VALUES ('6f7e53db-7ba3-4e3c-94c4-df90437a3526', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${givenName}', '0c0a8bdb-7b30-4c61-9328-18a4435e782a', null);
INSERT INTO `protocol_mapper` VALUES ('7002d776-006a-4091-819f-b268fcbc1897', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${familyName}', '33958903-5b08-4a0e-b27d-2a046631ddae', null);
INSERT INTO `protocol_mapper` VALUES ('74657d32-fafb-4bf8-baa7-a69654f4e317', 'Client Host', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '\0', '', 'eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', null);
INSERT INTO `protocol_mapper` VALUES ('76d656c1-01c6-4b69-9d2f-31030c99d4c7', 'role list', 'saml', 'saml-role-list-mapper', '\0', null, '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null);
INSERT INTO `protocol_mapper` VALUES ('77750183-f60d-465a-a703-e478406c472c', 'full name', 'openid-connect', 'oidc-full-name-mapper', '', '${fullName}', 'eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', null);
INSERT INTO `protocol_mapper` VALUES ('7b2a7ba3-47c9-42f4-9f2e-304f1a992c5d', 'full name', 'openid-connect', 'oidc-full-name-mapper', '', '${fullName}', '33958903-5b08-4a0e-b27d-2a046631ddae', null);
INSERT INTO `protocol_mapper` VALUES ('7d55f103-be43-417e-a7d5-a02db76bd0de', 'full name', 'openid-connect', 'oidc-full-name-mapper', '', '${fullName}', 'f966b688-394d-41de-a79b-fa8ed800587d', null);
INSERT INTO `protocol_mapper` VALUES ('7e189f55-7e17-42b5-acab-09f9789d842f', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${familyName}', 'bbfee872-0023-4535-98d0-bb2a81b650a8', null);
INSERT INTO `protocol_mapper` VALUES ('7f194dbe-d268-455e-a76c-7da3df69cbf2', 'admin', 'openid-connect', 'oidc-usermodel-attribute-mapper', '\0', null, 'eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', null);
INSERT INTO `protocol_mapper` VALUES ('815de017-ae7a-45a3-b1b8-3826c552bd52', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${email}', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null);
INSERT INTO `protocol_mapper` VALUES ('82139711-e87c-46e0-bd92-3de9f710f13a', 'full name', 'openid-connect', 'oidc-full-name-mapper', '', '${fullName}', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null);
INSERT INTO `protocol_mapper` VALUES ('83e32c39-46c5-45e9-bbee-cf1c9dea620c', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${familyName}', 'b3c0ea5f-1829-4e3c-90ff-70d7c4fda34a', null);
INSERT INTO `protocol_mapper` VALUES ('89196723-e46d-4c36-a8ed-9ce605c57913', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${email}', '33958903-5b08-4a0e-b27d-2a046631ddae', null);
INSERT INTO `protocol_mapper` VALUES ('8a55a258-c348-42ec-bf2a-53726178720c', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${username}', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null);
INSERT INTO `protocol_mapper` VALUES ('950ea927-4dde-42cf-9e70-9b6745b30eeb', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${email}', 'b3c0ea5f-1829-4e3c-90ff-70d7c4fda34a', null);
INSERT INTO `protocol_mapper` VALUES ('994306e7-99f0-40a2-a756-05826e272595', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${familyName}', 'c60de944-62eb-4773-b1f4-550be57b3f25', null);
INSERT INTO `protocol_mapper` VALUES ('9971b124-8506-4f13-8735-be5dfa025ae9', 'full name', 'openid-connect', 'oidc-full-name-mapper', '', '${fullName}', 'c60de944-62eb-4773-b1f4-550be57b3f25', null);
INSERT INTO `protocol_mapper` VALUES ('a0f3296a-0e6f-4029-bc66-a7ebf37954df', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${givenName}', '03bff8cd-1776-4ffb-9c2d-3e8d4dd2713f', null);
INSERT INTO `protocol_mapper` VALUES ('a3670ff1-1c0b-44e9-ac96-945187c3a9a0', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '\0', '${locale}', '0c0a8bdb-7b30-4c61-9328-18a4435e782a', null);
INSERT INTO `protocol_mapper` VALUES ('a4355a59-2004-4f75-bff2-f17746e80013', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${email}', 'c60de944-62eb-4773-b1f4-550be57b3f25', null);
INSERT INTO `protocol_mapper` VALUES ('a5199e5c-1b3d-4ea9-9972-2277d06c4322', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${username}', '0c0a8bdb-7b30-4c61-9328-18a4435e782a', null);
INSERT INTO `protocol_mapper` VALUES ('a52b2361-f9b2-4401-b665-503273631d6b', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${email}', '8d79b1b4-ef33-4aab-9050-07fdc4d05c7a', null);
INSERT INTO `protocol_mapper` VALUES ('a8627931-7101-4833-b9da-235750503c92', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${givenName}', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null);
INSERT INTO `protocol_mapper` VALUES ('ab3591ab-e2ee-4760-905b-c31976d2fde3', 'role list', 'saml', 'saml-role-list-mapper', '\0', null, 'f966b688-394d-41de-a79b-fa8ed800587d', null);
INSERT INTO `protocol_mapper` VALUES ('ad75e2dd-9a7c-4ac1-ae73-579538855a14', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${givenName}', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null);
INSERT INTO `protocol_mapper` VALUES ('af9dacde-e0db-422b-929d-bdc155f50b32', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '\0', '${locale}', '8d79b1b4-ef33-4aab-9050-07fdc4d05c7a', null);
INSERT INTO `protocol_mapper` VALUES ('b1c4bc43-3af4-43fe-80d6-5d02695fdf6c', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${givenName}', 'eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', null);
INSERT INTO `protocol_mapper` VALUES ('b24014af-e6d0-47e9-935c-649edbe59093', 'full name', 'openid-connect', 'oidc-full-name-mapper', '', '${fullName}', 'a88c73bb-b26d-469a-ba62-974607334ee3', null);
INSERT INTO `protocol_mapper` VALUES ('b5b59991-f397-405e-9014-d3446ec4989b', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${familyName}', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null);
INSERT INTO `protocol_mapper` VALUES ('b882f385-9292-47cd-afbc-1d20ee03a865', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${email}', '0c0a8bdb-7b30-4c61-9328-18a4435e782a', null);
INSERT INTO `protocol_mapper` VALUES ('b88bd042-9bf1-4a83-8c9c-93d17acb5d16', 'role list', 'saml', 'saml-role-list-mapper', '\0', null, '98d018b0-db18-4f60-9f6d-62e299fdb6de', null);
INSERT INTO `protocol_mapper` VALUES ('b9907cc4-0e45-42a9-8e17-6d0be03096b8', 'role list', 'saml', 'saml-role-list-mapper', '\0', null, 'c60de944-62eb-4773-b1f4-550be57b3f25', null);
INSERT INTO `protocol_mapper` VALUES ('ba32d153-b775-4f6d-9b2f-cc7fcacd0d43', 'role list', 'saml', 'saml-role-list-mapper', '\0', null, 'bbfee872-0023-4535-98d0-bb2a81b650a8', null);
INSERT INTO `protocol_mapper` VALUES ('c1631ca3-9ac5-4c42-bc50-d4451fb18b37', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${email}', 'f966b688-394d-41de-a79b-fa8ed800587d', null);
INSERT INTO `protocol_mapper` VALUES ('c23835b7-d117-4ab8-a499-38dcb2c13029', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${givenName}', '98d018b0-db18-4f60-9f6d-62e299fdb6de', null);
INSERT INTO `protocol_mapper` VALUES ('c36ab0de-e52c-4a73-80fa-e8bbbe20c2c5', 'Client IP Address', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '\0', '', 'c60de944-62eb-4773-b1f4-550be57b3f25', null);
INSERT INTO `protocol_mapper` VALUES ('c4b38fb4-44e8-46c9-9c1d-54308c21c122', 'role list', 'saml', 'saml-role-list-mapper', '\0', null, '0c0a8bdb-7b30-4c61-9328-18a4435e782a', null);
INSERT INTO `protocol_mapper` VALUES ('c68b7606-4506-4f74-9900-68184ebf6c68', 'isAdmin', 'openid-connect', 'oidc-usermodel-attribute-mapper', '\0', null, 'c60de944-62eb-4773-b1f4-550be57b3f25', null);
INSERT INTO `protocol_mapper` VALUES ('ccfe97b7-4f9f-4be8-a3df-b769d9f81dcb', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${familyName}', '0c0a8bdb-7b30-4c61-9328-18a4435e782a', null);
INSERT INTO `protocol_mapper` VALUES ('cdda46e3-b44e-4b65-ad18-b2c477f4df8e', 'full name', 'openid-connect', 'oidc-full-name-mapper', '', '${fullName}', '0c0a8bdb-7b30-4c61-9328-18a4435e782a', null);
INSERT INTO `protocol_mapper` VALUES ('ce8930be-b8fd-4a0a-9bdb-241fce7f75e1', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${givenName}', 'a88c73bb-b26d-469a-ba62-974607334ee3', null);
INSERT INTO `protocol_mapper` VALUES ('d2406e4d-8aef-4862-ad1b-ce10987321b8', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${username}', 'f966b688-394d-41de-a79b-fa8ed800587d', null);
INSERT INTO `protocol_mapper` VALUES ('d32e4d28-f58d-41d5-91f2-198fca2c608f', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${familyName}', 'a88c73bb-b26d-469a-ba62-974607334ee3', null);
INSERT INTO `protocol_mapper` VALUES ('d7ffe16a-68a4-4ef5-b75c-1cadcf5fa070', 'role list', 'saml', 'saml-role-list-mapper', '\0', null, '03bff8cd-1776-4ffb-9c2d-3e8d4dd2713f', null);
INSERT INTO `protocol_mapper` VALUES ('e4ebda80-7055-4248-ba3e-bb6dd2f9c155', 'Client ID', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '\0', '', 'c60de944-62eb-4773-b1f4-550be57b3f25', null);
INSERT INTO `protocol_mapper` VALUES ('e92e09cd-d55a-4d3f-904e-c695a410d202', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${username}', 'eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', null);
INSERT INTO `protocol_mapper` VALUES ('e9f0cf84-4a6b-4975-92bb-aee38541eb46', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${familyName}', 'f966b688-394d-41de-a79b-fa8ed800587d', null);
INSERT INTO `protocol_mapper` VALUES ('ed57d053-62ea-48b1-9f10-88d68a52fd7f', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${username}', 'bbfee872-0023-4535-98d0-bb2a81b650a8', null);
INSERT INTO `protocol_mapper` VALUES ('f8d78f99-cce9-471b-92af-7a90fd62a65b', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', '', '${username}', '33958903-5b08-4a0e-b27d-2a046631ddae', null);

-- ----------------------------
-- Table structure for protocol_mapper_config
-- ----------------------------
DROP TABLE IF EXISTS `protocol_mapper_config`;
CREATE TABLE `protocol_mapper_config` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`) USING BTREE,
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `protocol_mapper` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of protocol_mapper_config
-- ----------------------------
INSERT INTO `protocol_mapper_config` VALUES ('010bef20-28db-4a0f-a266-40637a840a1b', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('010bef20-28db-4a0f-a266-40637a840a1b', 'preferred_username', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('010bef20-28db-4a0f-a266-40637a840a1b', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('010bef20-28db-4a0f-a266-40637a840a1b', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('010bef20-28db-4a0f-a266-40637a840a1b', 'username', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('010bef20-28db-4a0f-a266-40637a840a1b', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('07b27d24-d53a-41bd-8a01-66d56fa9a725', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('07b27d24-d53a-41bd-8a01-66d56fa9a725', 'email', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('07b27d24-d53a-41bd-8a01-66d56fa9a725', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('07b27d24-d53a-41bd-8a01-66d56fa9a725', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('07b27d24-d53a-41bd-8a01-66d56fa9a725', 'email', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('07b27d24-d53a-41bd-8a01-66d56fa9a725', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('0ba24002-7d0a-4864-8bb0-fcd263919a2e', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('0ba24002-7d0a-4864-8bb0-fcd263919a2e', 'family_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('0ba24002-7d0a-4864-8bb0-fcd263919a2e', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('0ba24002-7d0a-4864-8bb0-fcd263919a2e', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('0ba24002-7d0a-4864-8bb0-fcd263919a2e', 'lastName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('0ba24002-7d0a-4864-8bb0-fcd263919a2e', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('0ca30930-665f-4d12-a85e-35e60a06ea97', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('0ca30930-665f-4d12-a85e-35e60a06ea97', 'clientId', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('0ca30930-665f-4d12-a85e-35e60a06ea97', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('0ca30930-665f-4d12-a85e-35e60a06ea97', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('0ca30930-665f-4d12-a85e-35e60a06ea97', 'clientId', 'user.session.note');
INSERT INTO `protocol_mapper_config` VALUES ('0d602845-ac2b-429a-8174-c89bd32276b3', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('0d602845-ac2b-429a-8174-c89bd32276b3', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('0e8a4b42-a131-490a-8a73-a985f9178452', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('0e8a4b42-a131-490a-8a73-a985f9178452', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('0f32955e-2d3c-4a4c-bd17-6655cefca754', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('0f32955e-2d3c-4a4c-bd17-6655cefca754', 'given_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('0f32955e-2d3c-4a4c-bd17-6655cefca754', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('0f32955e-2d3c-4a4c-bd17-6655cefca754', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('0f32955e-2d3c-4a4c-bd17-6655cefca754', 'firstName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('0f32955e-2d3c-4a4c-bd17-6655cefca754', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('10ccfe61-4d39-4c7d-9980-728601b92ce7', 'Role', 'attribute.name');
INSERT INTO `protocol_mapper_config` VALUES ('10ccfe61-4d39-4c7d-9980-728601b92ce7', 'Basic', 'attribute.nameformat');
INSERT INTO `protocol_mapper_config` VALUES ('10ccfe61-4d39-4c7d-9980-728601b92ce7', 'false', 'single');
INSERT INTO `protocol_mapper_config` VALUES ('10fd150f-4448-42e2-ab9c-62163e0f2dab', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('10fd150f-4448-42e2-ab9c-62163e0f2dab', 'preferred_username', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('10fd150f-4448-42e2-ab9c-62163e0f2dab', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('10fd150f-4448-42e2-ab9c-62163e0f2dab', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('10fd150f-4448-42e2-ab9c-62163e0f2dab', 'username', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('10fd150f-4448-42e2-ab9c-62163e0f2dab', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('13631580-1c6d-4032-89d3-c9c09036298a', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('13631580-1c6d-4032-89d3-c9c09036298a', 'email', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('13631580-1c6d-4032-89d3-c9c09036298a', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('13631580-1c6d-4032-89d3-c9c09036298a', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('13631580-1c6d-4032-89d3-c9c09036298a', 'email', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('13631580-1c6d-4032-89d3-c9c09036298a', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('1d800edc-a13a-445a-bca2-48c8ce87d280', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('1d800edc-a13a-445a-bca2-48c8ce87d280', 'preferred_username', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('1d800edc-a13a-445a-bca2-48c8ce87d280', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('1d800edc-a13a-445a-bca2-48c8ce87d280', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('1d800edc-a13a-445a-bca2-48c8ce87d280', 'username', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('1d800edc-a13a-445a-bca2-48c8ce87d280', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('1f0d183c-5b16-4603-bb46-cfb988106880', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('1f0d183c-5b16-4603-bb46-cfb988106880', 'email', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('1f0d183c-5b16-4603-bb46-cfb988106880', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('1f0d183c-5b16-4603-bb46-cfb988106880', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('1f0d183c-5b16-4603-bb46-cfb988106880', 'email', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('1f0d183c-5b16-4603-bb46-cfb988106880', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('23125207-a3cd-40aa-86bc-e4757cd39761', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('23125207-a3cd-40aa-86bc-e4757cd39761', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('2329776b-e0c8-4f19-9a53-f88065db31d1', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('2329776b-e0c8-4f19-9a53-f88065db31d1', 'preferred_username', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('2329776b-e0c8-4f19-9a53-f88065db31d1', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('2329776b-e0c8-4f19-9a53-f88065db31d1', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('2329776b-e0c8-4f19-9a53-f88065db31d1', 'username', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('2329776b-e0c8-4f19-9a53-f88065db31d1', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('26dfbdcc-7fdf-495e-acfb-7bc0f9ff2375', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('26dfbdcc-7fdf-495e-acfb-7bc0f9ff2375', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('283bae82-99b6-4637-bf2d-739b83a13b10', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('283bae82-99b6-4637-bf2d-739b83a13b10', 'email', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('283bae82-99b6-4637-bf2d-739b83a13b10', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('283bae82-99b6-4637-bf2d-739b83a13b10', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('283bae82-99b6-4637-bf2d-739b83a13b10', 'email', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('283bae82-99b6-4637-bf2d-739b83a13b10', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('297075e4-1b78-4bd5-ab40-bb653fe3a9ce', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('297075e4-1b78-4bd5-ab40-bb653fe3a9ce', 'given_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('297075e4-1b78-4bd5-ab40-bb653fe3a9ce', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('297075e4-1b78-4bd5-ab40-bb653fe3a9ce', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('297075e4-1b78-4bd5-ab40-bb653fe3a9ce', 'firstName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('297075e4-1b78-4bd5-ab40-bb653fe3a9ce', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('2e772a8c-fe10-41f6-90e7-9b225ecbc465', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('2e772a8c-fe10-41f6-90e7-9b225ecbc465', 'email', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('2e772a8c-fe10-41f6-90e7-9b225ecbc465', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('2e772a8c-fe10-41f6-90e7-9b225ecbc465', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('2e772a8c-fe10-41f6-90e7-9b225ecbc465', 'email', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('2e772a8c-fe10-41f6-90e7-9b225ecbc465', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('2f57e62d-3189-4153-b4b5-8b28224359b8', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('2f57e62d-3189-4153-b4b5-8b28224359b8', 'family_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('2f57e62d-3189-4153-b4b5-8b28224359b8', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('2f57e62d-3189-4153-b4b5-8b28224359b8', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('2f57e62d-3189-4153-b4b5-8b28224359b8', 'lastName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('2f57e62d-3189-4153-b4b5-8b28224359b8', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('338308a1-3972-407a-9f2a-4cc345d42b49', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('338308a1-3972-407a-9f2a-4cc345d42b49', 'given_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('338308a1-3972-407a-9f2a-4cc345d42b49', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('338308a1-3972-407a-9f2a-4cc345d42b49', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('338308a1-3972-407a-9f2a-4cc345d42b49', 'firstName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('338308a1-3972-407a-9f2a-4cc345d42b49', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('358ce5cf-23bd-4a72-b691-393e0b13a2ea', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('358ce5cf-23bd-4a72-b691-393e0b13a2ea', 'given_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('358ce5cf-23bd-4a72-b691-393e0b13a2ea', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('358ce5cf-23bd-4a72-b691-393e0b13a2ea', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('358ce5cf-23bd-4a72-b691-393e0b13a2ea', 'firstName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('358ce5cf-23bd-4a72-b691-393e0b13a2ea', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('371fd1af-8dc6-4794-a9c1-67f6534578c2', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('371fd1af-8dc6-4794-a9c1-67f6534578c2', 'given_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('371fd1af-8dc6-4794-a9c1-67f6534578c2', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('371fd1af-8dc6-4794-a9c1-67f6534578c2', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('371fd1af-8dc6-4794-a9c1-67f6534578c2', 'firstName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('371fd1af-8dc6-4794-a9c1-67f6534578c2', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('39f17e02-59fd-4e39-8ccf-7c12c01385e7', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('39f17e02-59fd-4e39-8ccf-7c12c01385e7', 'given_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('39f17e02-59fd-4e39-8ccf-7c12c01385e7', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('39f17e02-59fd-4e39-8ccf-7c12c01385e7', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('39f17e02-59fd-4e39-8ccf-7c12c01385e7', 'firstName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('39f17e02-59fd-4e39-8ccf-7c12c01385e7', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('3d76d31e-2ffb-447e-8043-9e5f9b979f38', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('3d76d31e-2ffb-447e-8043-9e5f9b979f38', 'clientHost', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('3d76d31e-2ffb-447e-8043-9e5f9b979f38', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('3d76d31e-2ffb-447e-8043-9e5f9b979f38', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('3d76d31e-2ffb-447e-8043-9e5f9b979f38', 'clientHost', 'user.session.note');
INSERT INTO `protocol_mapper_config` VALUES ('3e405eeb-6f66-48a7-a36e-efaa344aedaf', 'Role', 'attribute.name');
INSERT INTO `protocol_mapper_config` VALUES ('3e405eeb-6f66-48a7-a36e-efaa344aedaf', 'Basic', 'attribute.nameformat');
INSERT INTO `protocol_mapper_config` VALUES ('3e405eeb-6f66-48a7-a36e-efaa344aedaf', 'false', 'single');
INSERT INTO `protocol_mapper_config` VALUES ('41759180-2930-4d11-bd14-4517910a9f9f', 'Role', 'attribute.name');
INSERT INTO `protocol_mapper_config` VALUES ('41759180-2930-4d11-bd14-4517910a9f9f', 'Basic', 'attribute.nameformat');
INSERT INTO `protocol_mapper_config` VALUES ('41759180-2930-4d11-bd14-4517910a9f9f', 'false', 'single');
INSERT INTO `protocol_mapper_config` VALUES ('4846c79e-ddf7-4c2f-9dfb-e3c22d45ccd5', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('4846c79e-ddf7-4c2f-9dfb-e3c22d45ccd5', 'family_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('4846c79e-ddf7-4c2f-9dfb-e3c22d45ccd5', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('4846c79e-ddf7-4c2f-9dfb-e3c22d45ccd5', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('4846c79e-ddf7-4c2f-9dfb-e3c22d45ccd5', 'lastName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('4846c79e-ddf7-4c2f-9dfb-e3c22d45ccd5', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('48c3552c-03dd-4923-b000-08428dac9630', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('48c3552c-03dd-4923-b000-08428dac9630', 'clientAddress', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('48c3552c-03dd-4923-b000-08428dac9630', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('48c3552c-03dd-4923-b000-08428dac9630', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('48c3552c-03dd-4923-b000-08428dac9630', 'clientAddress', 'user.session.note');
INSERT INTO `protocol_mapper_config` VALUES ('4e3d37da-3172-4921-9892-da963bf591ce', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('4e3d37da-3172-4921-9892-da963bf591ce', 'preferred_username', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('4e3d37da-3172-4921-9892-da963bf591ce', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('4e3d37da-3172-4921-9892-da963bf591ce', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('4e3d37da-3172-4921-9892-da963bf591ce', 'username', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('4e3d37da-3172-4921-9892-da963bf591ce', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('55b7ec19-387a-442e-8aae-29c861c08369', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('55b7ec19-387a-442e-8aae-29c861c08369', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('56e63080-ea61-4b48-a4ec-8c450b668037', 'Role', 'attribute.name');
INSERT INTO `protocol_mapper_config` VALUES ('56e63080-ea61-4b48-a4ec-8c450b668037', 'Basic', 'attribute.nameformat');
INSERT INTO `protocol_mapper_config` VALUES ('56e63080-ea61-4b48-a4ec-8c450b668037', 'false', 'single');
INSERT INTO `protocol_mapper_config` VALUES ('57105df1-4802-4760-a1d4-0f87b3c0331b', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('57105df1-4802-4760-a1d4-0f87b3c0331b', 'preferred_username', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('57105df1-4802-4760-a1d4-0f87b3c0331b', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('57105df1-4802-4760-a1d4-0f87b3c0331b', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('57105df1-4802-4760-a1d4-0f87b3c0331b', 'username', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('57105df1-4802-4760-a1d4-0f87b3c0331b', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('586551fb-c32d-4224-9394-e9a65e3fd85a', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('586551fb-c32d-4224-9394-e9a65e3fd85a', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('5a747f91-a008-4392-a0d8-900d1a7583a6', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('5a747f91-a008-4392-a0d8-900d1a7583a6', 'family_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('5a747f91-a008-4392-a0d8-900d1a7583a6', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('5a747f91-a008-4392-a0d8-900d1a7583a6', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('5a747f91-a008-4392-a0d8-900d1a7583a6', 'lastName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('5a747f91-a008-4392-a0d8-900d1a7583a6', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('5b2f0b2e-e2fd-4a91-b067-ccd5ca1e2278', 'Role', 'attribute.name');
INSERT INTO `protocol_mapper_config` VALUES ('5b2f0b2e-e2fd-4a91-b067-ccd5ca1e2278', 'Basic', 'attribute.nameformat');
INSERT INTO `protocol_mapper_config` VALUES ('5b2f0b2e-e2fd-4a91-b067-ccd5ca1e2278', 'false', 'single');
INSERT INTO `protocol_mapper_config` VALUES ('5cfd668e-d124-49a2-baeb-7e92c1c11620', 'Role', 'attribute.name');
INSERT INTO `protocol_mapper_config` VALUES ('5cfd668e-d124-49a2-baeb-7e92c1c11620', 'Basic', 'attribute.nameformat');
INSERT INTO `protocol_mapper_config` VALUES ('5cfd668e-d124-49a2-baeb-7e92c1c11620', 'false', 'single');
INSERT INTO `protocol_mapper_config` VALUES ('6a78d756-a324-4a14-81f3-a442bacf2d42', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('6a78d756-a324-4a14-81f3-a442bacf2d42', 'family_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('6a78d756-a324-4a14-81f3-a442bacf2d42', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('6a78d756-a324-4a14-81f3-a442bacf2d42', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('6a78d756-a324-4a14-81f3-a442bacf2d42', 'lastName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('6a78d756-a324-4a14-81f3-a442bacf2d42', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('6b07cf8e-1421-40e0-8b7c-4913aaaef41b', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('6b07cf8e-1421-40e0-8b7c-4913aaaef41b', 'preferred_username', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('6b07cf8e-1421-40e0-8b7c-4913aaaef41b', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('6b07cf8e-1421-40e0-8b7c-4913aaaef41b', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('6b07cf8e-1421-40e0-8b7c-4913aaaef41b', 'username', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('6b07cf8e-1421-40e0-8b7c-4913aaaef41b', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('6e3b7ef5-3b4a-4b6c-a664-9975a8b99759', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('6e3b7ef5-3b4a-4b6c-a664-9975a8b99759', 'email', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('6e3b7ef5-3b4a-4b6c-a664-9975a8b99759', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('6e3b7ef5-3b4a-4b6c-a664-9975a8b99759', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('6e3b7ef5-3b4a-4b6c-a664-9975a8b99759', 'email', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('6e3b7ef5-3b4a-4b6c-a664-9975a8b99759', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('6f7e53db-7ba3-4e3c-94c4-df90437a3526', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('6f7e53db-7ba3-4e3c-94c4-df90437a3526', 'given_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('6f7e53db-7ba3-4e3c-94c4-df90437a3526', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('6f7e53db-7ba3-4e3c-94c4-df90437a3526', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('6f7e53db-7ba3-4e3c-94c4-df90437a3526', 'firstName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('6f7e53db-7ba3-4e3c-94c4-df90437a3526', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('7002d776-006a-4091-819f-b268fcbc1897', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('7002d776-006a-4091-819f-b268fcbc1897', 'family_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('7002d776-006a-4091-819f-b268fcbc1897', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('7002d776-006a-4091-819f-b268fcbc1897', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('7002d776-006a-4091-819f-b268fcbc1897', 'lastName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('7002d776-006a-4091-819f-b268fcbc1897', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('74657d32-fafb-4bf8-baa7-a69654f4e317', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('74657d32-fafb-4bf8-baa7-a69654f4e317', 'clientHost', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('74657d32-fafb-4bf8-baa7-a69654f4e317', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('74657d32-fafb-4bf8-baa7-a69654f4e317', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('74657d32-fafb-4bf8-baa7-a69654f4e317', 'clientHost', 'user.session.note');
INSERT INTO `protocol_mapper_config` VALUES ('76d656c1-01c6-4b69-9d2f-31030c99d4c7', 'Role', 'attribute.name');
INSERT INTO `protocol_mapper_config` VALUES ('76d656c1-01c6-4b69-9d2f-31030c99d4c7', 'Basic', 'attribute.nameformat');
INSERT INTO `protocol_mapper_config` VALUES ('76d656c1-01c6-4b69-9d2f-31030c99d4c7', 'false', 'single');
INSERT INTO `protocol_mapper_config` VALUES ('77750183-f60d-465a-a703-e478406c472c', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('77750183-f60d-465a-a703-e478406c472c', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('7b2a7ba3-47c9-42f4-9f2e-304f1a992c5d', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('7b2a7ba3-47c9-42f4-9f2e-304f1a992c5d', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('7d55f103-be43-417e-a7d5-a02db76bd0de', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('7d55f103-be43-417e-a7d5-a02db76bd0de', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('7e189f55-7e17-42b5-acab-09f9789d842f', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('7e189f55-7e17-42b5-acab-09f9789d842f', 'family_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('7e189f55-7e17-42b5-acab-09f9789d842f', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('7e189f55-7e17-42b5-acab-09f9789d842f', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('7e189f55-7e17-42b5-acab-09f9789d842f', 'lastName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('7e189f55-7e17-42b5-acab-09f9789d842f', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('7f194dbe-d268-455e-a76c-7da3df69cbf2', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('7f194dbe-d268-455e-a76c-7da3df69cbf2', 'isAdmin', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('7f194dbe-d268-455e-a76c-7da3df69cbf2', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('7f194dbe-d268-455e-a76c-7da3df69cbf2', '', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('7f194dbe-d268-455e-a76c-7da3df69cbf2', '', 'multivalued');
INSERT INTO `protocol_mapper_config` VALUES ('7f194dbe-d268-455e-a76c-7da3df69cbf2', 'admin', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('7f194dbe-d268-455e-a76c-7da3df69cbf2', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('815de017-ae7a-45a3-b1b8-3826c552bd52', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('815de017-ae7a-45a3-b1b8-3826c552bd52', 'email', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('815de017-ae7a-45a3-b1b8-3826c552bd52', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('815de017-ae7a-45a3-b1b8-3826c552bd52', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('815de017-ae7a-45a3-b1b8-3826c552bd52', 'email', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('815de017-ae7a-45a3-b1b8-3826c552bd52', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('82139711-e87c-46e0-bd92-3de9f710f13a', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('82139711-e87c-46e0-bd92-3de9f710f13a', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('83e32c39-46c5-45e9-bbee-cf1c9dea620c', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('83e32c39-46c5-45e9-bbee-cf1c9dea620c', 'family_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('83e32c39-46c5-45e9-bbee-cf1c9dea620c', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('83e32c39-46c5-45e9-bbee-cf1c9dea620c', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('83e32c39-46c5-45e9-bbee-cf1c9dea620c', 'lastName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('83e32c39-46c5-45e9-bbee-cf1c9dea620c', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('89196723-e46d-4c36-a8ed-9ce605c57913', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('89196723-e46d-4c36-a8ed-9ce605c57913', 'email', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('89196723-e46d-4c36-a8ed-9ce605c57913', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('89196723-e46d-4c36-a8ed-9ce605c57913', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('89196723-e46d-4c36-a8ed-9ce605c57913', 'email', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('89196723-e46d-4c36-a8ed-9ce605c57913', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('8a55a258-c348-42ec-bf2a-53726178720c', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('8a55a258-c348-42ec-bf2a-53726178720c', 'preferred_username', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('8a55a258-c348-42ec-bf2a-53726178720c', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('8a55a258-c348-42ec-bf2a-53726178720c', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('8a55a258-c348-42ec-bf2a-53726178720c', 'username', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('8a55a258-c348-42ec-bf2a-53726178720c', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('950ea927-4dde-42cf-9e70-9b6745b30eeb', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('950ea927-4dde-42cf-9e70-9b6745b30eeb', 'email', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('950ea927-4dde-42cf-9e70-9b6745b30eeb', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('950ea927-4dde-42cf-9e70-9b6745b30eeb', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('950ea927-4dde-42cf-9e70-9b6745b30eeb', 'email', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('950ea927-4dde-42cf-9e70-9b6745b30eeb', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('994306e7-99f0-40a2-a756-05826e272595', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('994306e7-99f0-40a2-a756-05826e272595', 'family_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('994306e7-99f0-40a2-a756-05826e272595', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('994306e7-99f0-40a2-a756-05826e272595', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('994306e7-99f0-40a2-a756-05826e272595', 'lastName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('994306e7-99f0-40a2-a756-05826e272595', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('9971b124-8506-4f13-8735-be5dfa025ae9', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('9971b124-8506-4f13-8735-be5dfa025ae9', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('a0f3296a-0e6f-4029-bc66-a7ebf37954df', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('a0f3296a-0e6f-4029-bc66-a7ebf37954df', 'given_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('a0f3296a-0e6f-4029-bc66-a7ebf37954df', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('a0f3296a-0e6f-4029-bc66-a7ebf37954df', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('a0f3296a-0e6f-4029-bc66-a7ebf37954df', 'firstName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('a0f3296a-0e6f-4029-bc66-a7ebf37954df', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('a3670ff1-1c0b-44e9-ac96-945187c3a9a0', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('a3670ff1-1c0b-44e9-ac96-945187c3a9a0', 'locale', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('a3670ff1-1c0b-44e9-ac96-945187c3a9a0', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('a3670ff1-1c0b-44e9-ac96-945187c3a9a0', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('a3670ff1-1c0b-44e9-ac96-945187c3a9a0', 'locale', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('a3670ff1-1c0b-44e9-ac96-945187c3a9a0', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('a4355a59-2004-4f75-bff2-f17746e80013', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('a4355a59-2004-4f75-bff2-f17746e80013', 'email', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('a4355a59-2004-4f75-bff2-f17746e80013', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('a4355a59-2004-4f75-bff2-f17746e80013', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('a4355a59-2004-4f75-bff2-f17746e80013', 'email', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('a4355a59-2004-4f75-bff2-f17746e80013', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('a5199e5c-1b3d-4ea9-9972-2277d06c4322', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('a5199e5c-1b3d-4ea9-9972-2277d06c4322', 'preferred_username', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('a5199e5c-1b3d-4ea9-9972-2277d06c4322', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('a5199e5c-1b3d-4ea9-9972-2277d06c4322', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('a5199e5c-1b3d-4ea9-9972-2277d06c4322', 'username', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('a5199e5c-1b3d-4ea9-9972-2277d06c4322', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('a52b2361-f9b2-4401-b665-503273631d6b', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('a52b2361-f9b2-4401-b665-503273631d6b', 'email', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('a52b2361-f9b2-4401-b665-503273631d6b', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('a52b2361-f9b2-4401-b665-503273631d6b', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('a52b2361-f9b2-4401-b665-503273631d6b', 'email', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('a52b2361-f9b2-4401-b665-503273631d6b', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('a8627931-7101-4833-b9da-235750503c92', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('a8627931-7101-4833-b9da-235750503c92', 'given_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('a8627931-7101-4833-b9da-235750503c92', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('a8627931-7101-4833-b9da-235750503c92', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('a8627931-7101-4833-b9da-235750503c92', 'firstName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('a8627931-7101-4833-b9da-235750503c92', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('ab3591ab-e2ee-4760-905b-c31976d2fde3', 'Role', 'attribute.name');
INSERT INTO `protocol_mapper_config` VALUES ('ab3591ab-e2ee-4760-905b-c31976d2fde3', 'Basic', 'attribute.nameformat');
INSERT INTO `protocol_mapper_config` VALUES ('ab3591ab-e2ee-4760-905b-c31976d2fde3', 'false', 'single');
INSERT INTO `protocol_mapper_config` VALUES ('ad75e2dd-9a7c-4ac1-ae73-579538855a14', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('ad75e2dd-9a7c-4ac1-ae73-579538855a14', 'given_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('ad75e2dd-9a7c-4ac1-ae73-579538855a14', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('ad75e2dd-9a7c-4ac1-ae73-579538855a14', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('ad75e2dd-9a7c-4ac1-ae73-579538855a14', 'firstName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('ad75e2dd-9a7c-4ac1-ae73-579538855a14', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('af9dacde-e0db-422b-929d-bdc155f50b32', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('af9dacde-e0db-422b-929d-bdc155f50b32', 'locale', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('af9dacde-e0db-422b-929d-bdc155f50b32', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('af9dacde-e0db-422b-929d-bdc155f50b32', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('af9dacde-e0db-422b-929d-bdc155f50b32', 'locale', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('af9dacde-e0db-422b-929d-bdc155f50b32', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('b1c4bc43-3af4-43fe-80d6-5d02695fdf6c', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('b1c4bc43-3af4-43fe-80d6-5d02695fdf6c', 'given_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('b1c4bc43-3af4-43fe-80d6-5d02695fdf6c', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('b1c4bc43-3af4-43fe-80d6-5d02695fdf6c', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('b1c4bc43-3af4-43fe-80d6-5d02695fdf6c', 'firstName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('b1c4bc43-3af4-43fe-80d6-5d02695fdf6c', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('b24014af-e6d0-47e9-935c-649edbe59093', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('b24014af-e6d0-47e9-935c-649edbe59093', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('b5b59991-f397-405e-9014-d3446ec4989b', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('b5b59991-f397-405e-9014-d3446ec4989b', 'family_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('b5b59991-f397-405e-9014-d3446ec4989b', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('b5b59991-f397-405e-9014-d3446ec4989b', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('b5b59991-f397-405e-9014-d3446ec4989b', 'lastName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('b5b59991-f397-405e-9014-d3446ec4989b', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('b882f385-9292-47cd-afbc-1d20ee03a865', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('b882f385-9292-47cd-afbc-1d20ee03a865', 'email', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('b882f385-9292-47cd-afbc-1d20ee03a865', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('b882f385-9292-47cd-afbc-1d20ee03a865', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('b882f385-9292-47cd-afbc-1d20ee03a865', 'email', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('b882f385-9292-47cd-afbc-1d20ee03a865', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('b88bd042-9bf1-4a83-8c9c-93d17acb5d16', 'Role', 'attribute.name');
INSERT INTO `protocol_mapper_config` VALUES ('b88bd042-9bf1-4a83-8c9c-93d17acb5d16', 'Basic', 'attribute.nameformat');
INSERT INTO `protocol_mapper_config` VALUES ('b88bd042-9bf1-4a83-8c9c-93d17acb5d16', 'false', 'single');
INSERT INTO `protocol_mapper_config` VALUES ('b9907cc4-0e45-42a9-8e17-6d0be03096b8', 'Role', 'attribute.name');
INSERT INTO `protocol_mapper_config` VALUES ('b9907cc4-0e45-42a9-8e17-6d0be03096b8', 'Basic', 'attribute.nameformat');
INSERT INTO `protocol_mapper_config` VALUES ('b9907cc4-0e45-42a9-8e17-6d0be03096b8', 'false', 'single');
INSERT INTO `protocol_mapper_config` VALUES ('ba32d153-b775-4f6d-9b2f-cc7fcacd0d43', 'Role', 'attribute.name');
INSERT INTO `protocol_mapper_config` VALUES ('ba32d153-b775-4f6d-9b2f-cc7fcacd0d43', 'Basic', 'attribute.nameformat');
INSERT INTO `protocol_mapper_config` VALUES ('ba32d153-b775-4f6d-9b2f-cc7fcacd0d43', 'false', 'single');
INSERT INTO `protocol_mapper_config` VALUES ('c1631ca3-9ac5-4c42-bc50-d4451fb18b37', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('c1631ca3-9ac5-4c42-bc50-d4451fb18b37', 'email', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('c1631ca3-9ac5-4c42-bc50-d4451fb18b37', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('c1631ca3-9ac5-4c42-bc50-d4451fb18b37', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('c1631ca3-9ac5-4c42-bc50-d4451fb18b37', 'email', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('c1631ca3-9ac5-4c42-bc50-d4451fb18b37', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('c23835b7-d117-4ab8-a499-38dcb2c13029', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('c23835b7-d117-4ab8-a499-38dcb2c13029', 'given_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('c23835b7-d117-4ab8-a499-38dcb2c13029', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('c23835b7-d117-4ab8-a499-38dcb2c13029', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('c23835b7-d117-4ab8-a499-38dcb2c13029', 'firstName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('c23835b7-d117-4ab8-a499-38dcb2c13029', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('c36ab0de-e52c-4a73-80fa-e8bbbe20c2c5', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('c36ab0de-e52c-4a73-80fa-e8bbbe20c2c5', 'clientAddress', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('c36ab0de-e52c-4a73-80fa-e8bbbe20c2c5', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('c36ab0de-e52c-4a73-80fa-e8bbbe20c2c5', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('c36ab0de-e52c-4a73-80fa-e8bbbe20c2c5', 'clientAddress', 'user.session.note');
INSERT INTO `protocol_mapper_config` VALUES ('c4b38fb4-44e8-46c9-9c1d-54308c21c122', 'Role', 'attribute.name');
INSERT INTO `protocol_mapper_config` VALUES ('c4b38fb4-44e8-46c9-9c1d-54308c21c122', 'Basic', 'attribute.nameformat');
INSERT INTO `protocol_mapper_config` VALUES ('c4b38fb4-44e8-46c9-9c1d-54308c21c122', 'false', 'single');
INSERT INTO `protocol_mapper_config` VALUES ('c68b7606-4506-4f74-9900-68184ebf6c68', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('c68b7606-4506-4f74-9900-68184ebf6c68', 'isAdmin', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('c68b7606-4506-4f74-9900-68184ebf6c68', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('c68b7606-4506-4f74-9900-68184ebf6c68', '', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('c68b7606-4506-4f74-9900-68184ebf6c68', '', 'multivalued');
INSERT INTO `protocol_mapper_config` VALUES ('c68b7606-4506-4f74-9900-68184ebf6c68', 'admin', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('c68b7606-4506-4f74-9900-68184ebf6c68', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('ccfe97b7-4f9f-4be8-a3df-b769d9f81dcb', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('ccfe97b7-4f9f-4be8-a3df-b769d9f81dcb', 'family_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('ccfe97b7-4f9f-4be8-a3df-b769d9f81dcb', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('ccfe97b7-4f9f-4be8-a3df-b769d9f81dcb', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('ccfe97b7-4f9f-4be8-a3df-b769d9f81dcb', 'lastName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('ccfe97b7-4f9f-4be8-a3df-b769d9f81dcb', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('cdda46e3-b44e-4b65-ad18-b2c477f4df8e', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('cdda46e3-b44e-4b65-ad18-b2c477f4df8e', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('ce8930be-b8fd-4a0a-9bdb-241fce7f75e1', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('ce8930be-b8fd-4a0a-9bdb-241fce7f75e1', 'given_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('ce8930be-b8fd-4a0a-9bdb-241fce7f75e1', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('ce8930be-b8fd-4a0a-9bdb-241fce7f75e1', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('ce8930be-b8fd-4a0a-9bdb-241fce7f75e1', 'firstName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('ce8930be-b8fd-4a0a-9bdb-241fce7f75e1', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('d2406e4d-8aef-4862-ad1b-ce10987321b8', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('d2406e4d-8aef-4862-ad1b-ce10987321b8', 'preferred_username', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('d2406e4d-8aef-4862-ad1b-ce10987321b8', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('d2406e4d-8aef-4862-ad1b-ce10987321b8', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('d2406e4d-8aef-4862-ad1b-ce10987321b8', 'username', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('d2406e4d-8aef-4862-ad1b-ce10987321b8', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('d32e4d28-f58d-41d5-91f2-198fca2c608f', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('d32e4d28-f58d-41d5-91f2-198fca2c608f', 'family_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('d32e4d28-f58d-41d5-91f2-198fca2c608f', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('d32e4d28-f58d-41d5-91f2-198fca2c608f', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('d32e4d28-f58d-41d5-91f2-198fca2c608f', 'lastName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('d32e4d28-f58d-41d5-91f2-198fca2c608f', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('d7ffe16a-68a4-4ef5-b75c-1cadcf5fa070', 'Role', 'attribute.name');
INSERT INTO `protocol_mapper_config` VALUES ('d7ffe16a-68a4-4ef5-b75c-1cadcf5fa070', 'Basic', 'attribute.nameformat');
INSERT INTO `protocol_mapper_config` VALUES ('d7ffe16a-68a4-4ef5-b75c-1cadcf5fa070', 'false', 'single');
INSERT INTO `protocol_mapper_config` VALUES ('e4ebda80-7055-4248-ba3e-bb6dd2f9c155', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('e4ebda80-7055-4248-ba3e-bb6dd2f9c155', 'clientId', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('e4ebda80-7055-4248-ba3e-bb6dd2f9c155', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('e4ebda80-7055-4248-ba3e-bb6dd2f9c155', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('e4ebda80-7055-4248-ba3e-bb6dd2f9c155', 'clientId', 'user.session.note');
INSERT INTO `protocol_mapper_config` VALUES ('e92e09cd-d55a-4d3f-904e-c695a410d202', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('e92e09cd-d55a-4d3f-904e-c695a410d202', 'preferred_username', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('e92e09cd-d55a-4d3f-904e-c695a410d202', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('e92e09cd-d55a-4d3f-904e-c695a410d202', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('e92e09cd-d55a-4d3f-904e-c695a410d202', 'username', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('e92e09cd-d55a-4d3f-904e-c695a410d202', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('e9f0cf84-4a6b-4975-92bb-aee38541eb46', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('e9f0cf84-4a6b-4975-92bb-aee38541eb46', 'family_name', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('e9f0cf84-4a6b-4975-92bb-aee38541eb46', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('e9f0cf84-4a6b-4975-92bb-aee38541eb46', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('e9f0cf84-4a6b-4975-92bb-aee38541eb46', 'lastName', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('e9f0cf84-4a6b-4975-92bb-aee38541eb46', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('ed57d053-62ea-48b1-9f10-88d68a52fd7f', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('ed57d053-62ea-48b1-9f10-88d68a52fd7f', 'preferred_username', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('ed57d053-62ea-48b1-9f10-88d68a52fd7f', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('ed57d053-62ea-48b1-9f10-88d68a52fd7f', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('ed57d053-62ea-48b1-9f10-88d68a52fd7f', 'username', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('ed57d053-62ea-48b1-9f10-88d68a52fd7f', 'true', 'userinfo.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('f8d78f99-cce9-471b-92af-7a90fd62a65b', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('f8d78f99-cce9-471b-92af-7a90fd62a65b', 'preferred_username', 'claim.name');
INSERT INTO `protocol_mapper_config` VALUES ('f8d78f99-cce9-471b-92af-7a90fd62a65b', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` VALUES ('f8d78f99-cce9-471b-92af-7a90fd62a65b', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` VALUES ('f8d78f99-cce9-471b-92af-7a90fd62a65b', 'username', 'user.attribute');
INSERT INTO `protocol_mapper_config` VALUES ('f8d78f99-cce9-471b-92af-7a90fd62a65b', 'true', 'userinfo.token.claim');

-- ----------------------------
-- Table structure for realm
-- ----------------------------
DROP TABLE IF EXISTS `realm`;
CREATE TABLE `realm` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PASSWORD_POLICY` varchar(2550) DEFAULT NULL,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int(11) DEFAULT '0',
  `OTP_POLICY_WINDOW` int(11) DEFAULT '1',
  `OTP_POLICY_PERIOD` int(11) DEFAULT '30',
  `OTP_POLICY_DIGITS` int(11) DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`) USING BTREE,
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`) USING BTREE,
  CONSTRAINT `FK_TRAF444KK6QRKMS7N56AIWQ5Y` FOREIGN KEY (`MASTER_ADMIN_CLIENT`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of realm
-- ----------------------------
INSERT INTO `realm` VALUES ('fast', '60', '86400', '3600', null, null, null, '', '', '0', 'onex', 'fast', '0', null, '\0', '\0', '\0', '\0', 'EXTERNAL', '3600', '86400', '\0', '\0', 'a88c73bb-b26d-469a-ba62-974607334ee3', '86400', '', 'zh-CN', '\0', '\0', '\0', '\0', '0', '1', '30', '6', 'HmacSHA1', 'totp', '6b8a674a-2e15-4ea7-b8d6-0558b7139a89', '3ac80cd8-8e64-4acf-9744-e22d2553a3a5', '806079a2-0fc5-4253-8c2c-9f0abb1ecd5a', '6404036d-670f-46be-b48f-f2cf7b3a438f', 'cbe32cec-36cb-44c5-9c3e-5fced09dd179', '2592000', '\0', '900', '', '\0', 'cc2de003-1dca-40b9-8675-f7bf5710a009', '0');
INSERT INTO `realm` VALUES ('master', '60', '300', '60', null, null, null, '', '\0', '0', 'keycloak', 'master', '0', null, '\0', '\0', '\0', '\0', 'EXTERNAL', '1800', '36000', '\0', '\0', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', '1800', '\0', null, '\0', '\0', '\0', '\0', '0', '1', '30', '6', 'HmacSHA1', 'totp', '138d2f81-05a3-4327-b417-ac31bbfb101d', '7b361013-7625-40d0-b7dd-6c41a0a0b14e', '1dda46c0-589b-4ba9-a777-7d7a9686f59a', '887545f8-328f-4af4-a554-8d665ec53c45', 'b060f08f-4457-4ac7-86f6-8954078cf762', '2592000', '\0', '900', '', '\0', 'd8c17159-e810-4ea8-8691-825be4d91213', '0');

-- ----------------------------
-- Table structure for realm_attribute
-- ----------------------------
DROP TABLE IF EXISTS `realm_attribute`;
CREATE TABLE `realm_attribute` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`NAME`,`REALM_ID`) USING BTREE,
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`) USING BTREE,
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of realm_attribute
-- ----------------------------
INSERT INTO `realm_attribute` VALUES ('actionTokenGeneratedByAdminLifespan', '43200', 'fast');
INSERT INTO `realm_attribute` VALUES ('actionTokenGeneratedByAdminLifespan', '43200', 'master');
INSERT INTO `realm_attribute` VALUES ('actionTokenGeneratedByUserLifespan', '300', 'fast');
INSERT INTO `realm_attribute` VALUES ('actionTokenGeneratedByUserLifespan', '300', 'master');
INSERT INTO `realm_attribute` VALUES ('bruteForceProtected', 'true', 'fast');
INSERT INTO `realm_attribute` VALUES ('bruteForceProtected', 'false', 'master');
INSERT INTO `realm_attribute` VALUES ('displayName', 'Keycloak', 'master');
INSERT INTO `realm_attribute` VALUES ('displayNameHtml', '<div class=\"kc-logo-text\"><span>Keycloak</span></div>', 'master');
INSERT INTO `realm_attribute` VALUES ('failureFactor', '4', 'fast');
INSERT INTO `realm_attribute` VALUES ('failureFactor', '30', 'master');
INSERT INTO `realm_attribute` VALUES ('maxDeltaTimeSeconds', '43200', 'fast');
INSERT INTO `realm_attribute` VALUES ('maxDeltaTimeSeconds', '43200', 'master');
INSERT INTO `realm_attribute` VALUES ('maxFailureWaitSeconds', '900', 'fast');
INSERT INTO `realm_attribute` VALUES ('maxFailureWaitSeconds', '900', 'master');
INSERT INTO `realm_attribute` VALUES ('minimumQuickLoginWaitSeconds', '120', 'fast');
INSERT INTO `realm_attribute` VALUES ('minimumQuickLoginWaitSeconds', '60', 'master');
INSERT INTO `realm_attribute` VALUES ('permanentLockout', 'false', 'fast');
INSERT INTO `realm_attribute` VALUES ('permanentLockout', 'false', 'master');
INSERT INTO `realm_attribute` VALUES ('quickLoginCheckMilliSeconds', '1000', 'fast');
INSERT INTO `realm_attribute` VALUES ('quickLoginCheckMilliSeconds', '1000', 'master');
INSERT INTO `realm_attribute` VALUES ('waitIncrementSeconds', '60', 'fast');
INSERT INTO `realm_attribute` VALUES ('waitIncrementSeconds', '60', 'master');
INSERT INTO `realm_attribute` VALUES ('_browser_header.contentSecurityPolicy', 'frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';', 'fast');
INSERT INTO `realm_attribute` VALUES ('_browser_header.contentSecurityPolicy', 'frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';', 'master');
INSERT INTO `realm_attribute` VALUES ('_browser_header.xContentTypeOptions', 'nosniff', 'fast');
INSERT INTO `realm_attribute` VALUES ('_browser_header.xContentTypeOptions', 'nosniff', 'master');
INSERT INTO `realm_attribute` VALUES ('_browser_header.xFrameOptions', 'SAMEORIGIN', 'fast');
INSERT INTO `realm_attribute` VALUES ('_browser_header.xFrameOptions', 'SAMEORIGIN', 'master');
INSERT INTO `realm_attribute` VALUES ('_browser_header.xRobotsTag', 'none', 'fast');
INSERT INTO `realm_attribute` VALUES ('_browser_header.xRobotsTag', 'none', 'master');
INSERT INTO `realm_attribute` VALUES ('_browser_header.xXSSProtection', '1; mode=block', 'fast');
INSERT INTO `realm_attribute` VALUES ('_browser_header.xXSSProtection', '1; mode=block', 'master');

-- ----------------------------
-- Table structure for realm_default_groups
-- ----------------------------
DROP TABLE IF EXISTS `realm_default_groups`;
CREATE TABLE `realm_default_groups` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`) USING BTREE,
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`) USING BTREE,
  CONSTRAINT `FK_DEF_GROUPS_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `keycloak_group` (`ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of realm_default_groups
-- ----------------------------

-- ----------------------------
-- Table structure for realm_default_roles
-- ----------------------------
DROP TABLE IF EXISTS `realm_default_roles`;
CREATE TABLE `realm_default_roles` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `REALM_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  UNIQUE KEY `UK_H4WPD7W4HSOOLNI3H0SW7BTJE` (`ROLE_ID`) USING BTREE,
  KEY `IDX_REALM_DEF_ROLES_REALM` (`REALM_ID`) USING BTREE,
  CONSTRAINT `FK_EVUDB1PPW84OXFAX2DRS03ICC` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`),
  CONSTRAINT `FK_H4WPD7W4HSOOLNI3H0SW7BTJE` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of realm_default_roles
-- ----------------------------
INSERT INTO `realm_default_roles` VALUES ('1', 'fast', '4e743829-4408-4e2f-8a0b-5e61a6d14303');
INSERT INTO `realm_default_roles` VALUES ('2', 'fast', 'b1f8eaa4-6b6a-4235-bf64-e6843c5d036c');
INSERT INTO `realm_default_roles` VALUES ('3', 'master', '094ba54d-6e1d-4fcf-b36b-0c2b2d7410fd');
INSERT INTO `realm_default_roles` VALUES ('4', 'master', '67ead231-1987-4cd7-b330-12fa70e53db4');

-- ----------------------------
-- Table structure for realm_enabled_event_types
-- ----------------------------
DROP TABLE IF EXISTS `realm_enabled_event_types`;
CREATE TABLE `realm_enabled_event_types` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`) USING BTREE,
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of realm_enabled_event_types
-- ----------------------------
INSERT INTO `realm_enabled_event_types` VALUES ('25', 'fast', 'LOGOUT');
INSERT INTO `realm_enabled_event_types` VALUES ('26', 'fast', 'LOGIN_ERROR');
INSERT INTO `realm_enabled_event_types` VALUES ('27', 'fast', 'LOGOUT_ERROR');
INSERT INTO `realm_enabled_event_types` VALUES ('28', 'fast', 'LOGIN');

-- ----------------------------
-- Table structure for realm_events_listeners
-- ----------------------------
DROP TABLE IF EXISTS `realm_events_listeners`;
CREATE TABLE `realm_events_listeners` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`) USING BTREE,
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of realm_events_listeners
-- ----------------------------
INSERT INTO `realm_events_listeners` VALUES ('2', 'master', 'jboss-logging');
INSERT INTO `realm_events_listeners` VALUES ('8', 'fast', 'logInfoRecord');

-- ----------------------------
-- Table structure for realm_required_credential
-- ----------------------------
DROP TABLE IF EXISTS `realm_required_credential`;
CREATE TABLE `realm_required_credential` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`) USING BTREE,
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of realm_required_credential
-- ----------------------------
INSERT INTO `realm_required_credential` VALUES ('password', 'password', '', '', 'fast');
INSERT INTO `realm_required_credential` VALUES ('password', 'password', '', '', 'master');

-- ----------------------------
-- Table structure for realm_smtp_config
-- ----------------------------
DROP TABLE IF EXISTS `realm_smtp_config`;
CREATE TABLE `realm_smtp_config` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`) USING BTREE,
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of realm_smtp_config
-- ----------------------------

-- ----------------------------
-- Table structure for realm_supported_locales
-- ----------------------------
DROP TABLE IF EXISTS `realm_supported_locales`;
CREATE TABLE `realm_supported_locales` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`) USING BTREE,
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of realm_supported_locales
-- ----------------------------
INSERT INTO `realm_supported_locales` VALUES ('2', 'master', '');
INSERT INTO `realm_supported_locales` VALUES ('43', 'fast', 'zh-CN');

-- ----------------------------
-- Table structure for redirect_uris
-- ----------------------------
DROP TABLE IF EXISTS `redirect_uris`;
CREATE TABLE `redirect_uris` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`) USING BTREE,
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of redirect_uris
-- ----------------------------
INSERT INTO `redirect_uris` VALUES ('1', '03bff8cd-1776-4ffb-9c2d-3e8d4dd2713f', '/auth/realms/fast/account/*');
INSERT INTO `redirect_uris` VALUES ('2', '8d79b1b4-ef33-4aab-9050-07fdc4d05c7a', '/auth/admin/fast/console/*');
INSERT INTO `redirect_uris` VALUES ('3', '0c0a8bdb-7b30-4c61-9328-18a4435e782a', '/auth/admin/master/console/*');
INSERT INTO `redirect_uris` VALUES ('4', '33958903-5b08-4a0e-b27d-2a046631ddae', '/auth/realms/master/account/*');
INSERT INTO `redirect_uris` VALUES ('40', 'c60de944-62eb-4773-b1f4-550be57b3f25', 'http://{ONEX_IP}/*');
INSERT INTO `redirect_uris` VALUES ('42', 'eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', 'http://{ONEX_IP}/*');

-- ----------------------------
-- Table structure for required_action_config
-- ----------------------------
DROP TABLE IF EXISTS `required_action_config`;
CREATE TABLE `required_action_config` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of required_action_config
-- ----------------------------

-- ----------------------------
-- Table structure for required_action_provider
-- ----------------------------
DROP TABLE IF EXISTS `required_action_provider`;
CREATE TABLE `required_action_provider` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`) USING BTREE,
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of required_action_provider
-- ----------------------------
INSERT INTO `required_action_provider` VALUES ('0a13501a-b269-405c-a989-07403c0cc2e2', 'UPDATE_PASSWORD', 'Update Password', 'fast', '', '\0', 'UPDATE_PASSWORD');
INSERT INTO `required_action_provider` VALUES ('0ab979ca-dc24-4fad-9514-6a0aa9bc0f2d', 'UPDATE_PROFILE', 'Update Profile', 'master', '', '\0', 'UPDATE_PROFILE');
INSERT INTO `required_action_provider` VALUES ('2d391f69-d89d-43e0-a1d5-98921a47809c', 'CONFIGURE_TOTP', 'Configure OTP', 'fast', '', '\0', 'CONFIGURE_TOTP');
INSERT INTO `required_action_provider` VALUES ('44ad34d0-7c6f-4ed2-9660-2d6099251d36', 'UPDATE_PROFILE', 'Update Profile', 'fast', '', '\0', 'UPDATE_PROFILE');
INSERT INTO `required_action_provider` VALUES ('75d1c48c-326f-4fb4-a630-bda7ff3ebb71', 'VERIFY_EMAIL', 'Verify Email', 'fast', '', '\0', 'VERIFY_EMAIL');
INSERT INTO `required_action_provider` VALUES ('7849aa71-b084-4449-8e65-c30505f35dd4', 'terms_and_conditions', 'Terms and Conditions', 'master', '\0', '\0', 'terms_and_conditions');
INSERT INTO `required_action_provider` VALUES ('930f35ac-01eb-4120-a6ce-4df780b287bb', 'terms_and_conditions', 'Terms and Conditions', 'fast', '\0', '\0', 'terms_and_conditions');
INSERT INTO `required_action_provider` VALUES ('98d32a40-8569-43bc-9a0a-a4cfc3a72a5f', 'VERIFY_EMAIL', 'Verify Email', 'master', '', '\0', 'VERIFY_EMAIL');
INSERT INTO `required_action_provider` VALUES ('b8669c6e-d06d-4a1a-b856-dfee83b5d639', 'UPDATE_PASSWORD', 'Update Password', 'master', '', '\0', 'UPDATE_PASSWORD');
INSERT INTO `required_action_provider` VALUES ('cc820b5f-983b-4439-80f7-0eabcac1d218', 'CONFIGURE_TOTP', 'Configure OTP', 'master', '', '\0', 'CONFIGURE_TOTP');

-- ----------------------------
-- Table structure for resource_policy
-- ----------------------------
DROP TABLE IF EXISTS `resource_policy`;
CREATE TABLE `resource_policy` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`) USING BTREE,
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`) USING BTREE,
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of resource_policy
-- ----------------------------

-- ----------------------------
-- Table structure for resource_scope
-- ----------------------------
DROP TABLE IF EXISTS `resource_scope`;
CREATE TABLE `resource_scope` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`) USING BTREE,
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`) USING BTREE,
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of resource_scope
-- ----------------------------

-- ----------------------------
-- Table structure for resource_server
-- ----------------------------
DROP TABLE IF EXISTS `resource_server`;
CREATE TABLE `resource_server` (
  `ID` varchar(36) NOT NULL DEFAULT '',
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of resource_server
-- ----------------------------
INSERT INTO `resource_server` VALUES ('c60de944-62eb-4773-b1f4-550be57b3f25', '\0', '0');
INSERT INTO `resource_server` VALUES ('eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', '\0', '0');

-- ----------------------------
-- Table structure for resource_server_policy
-- ----------------------------
DROP TABLE IF EXISTS `resource_server_policy`;
CREATE TABLE `resource_server_policy` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`) USING BTREE,
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`) USING BTREE,
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of resource_server_policy
-- ----------------------------
INSERT INTO `resource_server_policy` VALUES ('11fcaeb7-8a5b-4f97-8803-22812ebfd584', 'Default Policy', 'A policy that grants access only for users within this realm', 'js', '0', '0', 'c60de944-62eb-4773-b1f4-550be57b3f25');
INSERT INTO `resource_server_policy` VALUES ('4a37fd1a-3c87-4688-ac8f-c14aef4cec6e', 'Default Permission', 'A permission that applies to the default resource type', 'resource', '1', '0', 'c60de944-62eb-4773-b1f4-550be57b3f25');
INSERT INTO `resource_server_policy` VALUES ('58c77104-cdf1-4a1c-a32f-bc201fe3e83b', 'Default Policy', 'A policy that grants access only for users within this realm', 'js', '0', '0', 'eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5');
INSERT INTO `resource_server_policy` VALUES ('833231dd-5dec-4b80-bc27-0c302d6c6820', 'Default Permission', 'A permission that applies to the default resource type', 'resource', '1', '0', 'eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5');

-- ----------------------------
-- Table structure for resource_server_resource
-- ----------------------------
DROP TABLE IF EXISTS `resource_server_resource`;
CREATE TABLE `resource_server_resource` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `URI` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(36) NOT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`) USING BTREE,
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`) USING BTREE,
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of resource_server_resource
-- ----------------------------
INSERT INTO `resource_server_resource` VALUES ('1605fd56-6c5d-4814-b5b1-421b61d1a22a', 'Default Resource', '/*', 'urn:user-client:resources:default', null, 'eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', 'eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5');
INSERT INTO `resource_server_resource` VALUES ('7b3e5a4f-99d9-4399-b2ae-5cd6d2170719', 'Default Resource', '/*', 'urn:admin-client:resources:default', null, 'c60de944-62eb-4773-b1f4-550be57b3f25', 'c60de944-62eb-4773-b1f4-550be57b3f25');

-- ----------------------------
-- Table structure for resource_server_scope
-- ----------------------------
DROP TABLE IF EXISTS `resource_server_scope`;
CREATE TABLE `resource_server_scope` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`) USING BTREE,
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`) USING BTREE,
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of resource_server_scope
-- ----------------------------

-- ----------------------------
-- Table structure for role_attribute
-- ----------------------------
DROP TABLE IF EXISTS `role_attribute`;
CREATE TABLE `role_attribute` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  `last_modify_user` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '扩展属性名称',
  `role_id` varchar(36) DEFAULT NULL COMMENT '关联角色ID',
  `value` varchar(255) DEFAULT NULL COMMENT '扩展属性值',
  PRIMARY KEY (`oid`) USING BTREE,
  KEY `FKjhk52n93q2eg1gwxd4as6kixj` (`role_id`) USING BTREE,
  CONSTRAINT `FKjhk52n93q2eg1gwxd4as6kixj` FOREIGN KEY (`role_id`) REFERENCES `keycloak_role` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of role_attribute
-- ----------------------------
INSERT INTO `role_attribute` VALUES ('1', '2018-08-28 17:33:58', null, '0', '2018-08-28 17:33:58', null, 'createUser', '0b8810c8-ed82-48e2-a895-d98dc0da4c7a', 'bf8d1a19-ad46-4297-ada2-d1095409121c');
INSERT INTO `role_attribute` VALUES ('2', '2018-08-28 17:33:58', null, '0', '2018-08-28 17:33:58', null, 'createTime', '0b8810c8-ed82-48e2-a895-d98dc0da4c7a', '1535448838214');

-- ----------------------------
-- Table structure for scope_mapping
-- ----------------------------
DROP TABLE IF EXISTS `scope_mapping`;
CREATE TABLE `scope_mapping` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`) USING BTREE,
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`) USING BTREE,
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_P3RH9GRKU11KQFRS4FLTT7RNQ` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of scope_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for scope_policy
-- ----------------------------
DROP TABLE IF EXISTS `scope_policy`;
CREATE TABLE `scope_policy` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`) USING BTREE,
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`) USING BTREE,
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of scope_policy
-- ----------------------------

-- ----------------------------
-- Table structure for template_scope_mapping
-- ----------------------------
DROP TABLE IF EXISTS `template_scope_mapping`;
CREATE TABLE `template_scope_mapping` (
  `TEMPLATE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`TEMPLATE_ID`,`ROLE_ID`) USING BTREE,
  KEY `IDX_TEMPL_SCOPE_MAPP_ROLE` (`ROLE_ID`) USING BTREE,
  CONSTRAINT `FK_TEMPL_SCOPE_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`),
  CONSTRAINT `FK_TEMPL_SCOPE_TEMPL` FOREIGN KEY (`TEMPLATE_ID`) REFERENCES `client_template` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of template_scope_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for username_login_failure
-- ----------------------------
DROP TABLE IF EXISTS `username_login_failure`;
CREATE TABLE `username_login_failure` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
  `LAST_FAILURE` bigint(20) DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int(11) DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of username_login_failure
-- ----------------------------

-- ----------------------------
-- Table structure for user_attribute
-- ----------------------------
DROP TABLE IF EXISTS `user_attribute`;
CREATE TABLE `user_attribute` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`) USING BTREE,
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_attribute
-- ----------------------------
INSERT INTO `user_attribute` VALUES ('updatorId', 'bf8d1a19-ad46-4297-ada2-d1095409121c', 'bf8d1a19-ad46-4297-ada2-d1095409121c', '054b7163-5aa0-43eb-b6cd-305fff3851b4');
INSERT INTO `user_attribute` VALUES ('LastLogInTime', '1542276839988', 'bf8d1a19-ad46-4297-ada2-d1095409121c', '32b6de4f-2899-470a-978f-1445fe62f331');
INSERT INTO `user_attribute` VALUES ('updateDate', '1535940901830', 'bf8d1a19-ad46-4297-ada2-d1095409121c', '5efd5923-6626-4142-bd50-ec997727ec08');
INSERT INTO `user_attribute` VALUES ('creatorId', 'bf8d1a19-ad46-4297-ada2-d1095409121c', 'bf8d1a19-ad46-4297-ada2-d1095409121c', 'b090125c-28cd-4846-9243-2db19949968e');
INSERT INTO `user_attribute` VALUES ('admin', 'true', 'bf8d1a19-ad46-4297-ada2-d1095409121c', 'c3aac4c0-97e5-48af-bec6-c1d525d3ceba');
INSERT INTO `user_attribute` VALUES ('updateTime', '1534480681', 'bf8d1a19-ad46-4297-ada2-d1095409121c', 'e65fd399-513a-4728-bcdd-5e00f314027d');

-- ----------------------------
-- Table structure for user_consent
-- ----------------------------
DROP TABLE IF EXISTS `user_consent`;
CREATE TABLE `user_consent` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`USER_ID`) USING BTREE,
  KEY `IDX_USER_CONSENT` (`USER_ID`) USING BTREE,
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_consent
-- ----------------------------

-- ----------------------------
-- Table structure for user_consent_prot_mapper
-- ----------------------------
DROP TABLE IF EXISTS `user_consent_prot_mapper`;
CREATE TABLE `user_consent_prot_mapper` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`PROTOCOL_MAPPER_ID`) USING BTREE,
  KEY `IDX_CONSENT_PROTMAPPER` (`USER_CONSENT_ID`) USING BTREE,
  CONSTRAINT `FK_GRNTCSNT_PRM_GR` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `user_consent` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_consent_prot_mapper
-- ----------------------------

-- ----------------------------
-- Table structure for user_consent_role
-- ----------------------------
DROP TABLE IF EXISTS `user_consent_role`;
CREATE TABLE `user_consent_role` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`ROLE_ID`) USING BTREE,
  KEY `IDX_CONSENT_ROLE` (`USER_CONSENT_ID`) USING BTREE,
  CONSTRAINT `FK_GRNTCSNT_ROLE_GR` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `user_consent` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_consent_role
-- ----------------------------

-- ----------------------------
-- Table structure for user_entity
-- ----------------------------
DROP TABLE IF EXISTS `user_entity`;
CREATE TABLE `user_entity` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(36) DEFAULT NULL,
  `NOT_BEFORE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`) USING BTREE,
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`) USING BTREE,
  KEY `IDX_USER_EMAIL` (`EMAIL`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_entity
-- ----------------------------
INSERT INTO `user_entity` VALUES ('7f643a21-4516-441a-9612-fbf101f3be07', null, 'fe4a686e-508e-4867-a4ef-7108ac5b735b', '\0', '', null, null, null, 'master', 'keycloak', '1526559203602', null, '0');
INSERT INTO `user_entity` VALUES ('986cc63f-81ca-48a9-a3eb-19d576b14edd', 'service-account-admin-client@placeholder.org', 'service-account-admin-client@placeholder.org', '\0', '', null, null, null, 'fast', 'service-account-admin-client', '1526559381951', 'c60de944-62eb-4773-b1f4-550be57b3f25', '0');
INSERT INTO `user_entity` VALUES ('a71c1780-9307-43cd-87cd-8908a6a6e344', 'service-account-user-client@placeholder.org', 'service-account-user-client@placeholder.org', '\0', '', null, null, null, 'fast', 'service-account-user-client', '1526559479645', 'eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', '0');
INSERT INTO `user_entity` VALUES ('bf8d1a19-ad46-4297-ada2-d1095409121c', 'admin@chinacloud.com.cn', 'admin@chinacloud.com.cn', '\0', '', null, 'admin', null, 'fast', 'admin', '1526559548756', null, '0');

-- ----------------------------
-- Table structure for user_federation_config
-- ----------------------------
DROP TABLE IF EXISTS `user_federation_config`;
CREATE TABLE `user_federation_config` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`) USING BTREE,
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `user_federation_provider` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_federation_config
-- ----------------------------

-- ----------------------------
-- Table structure for user_federation_mapper
-- ----------------------------
DROP TABLE IF EXISTS `user_federation_mapper`;
CREATE TABLE `user_federation_mapper` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`) USING BTREE,
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`) USING BTREE,
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `user_federation_provider` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_federation_mapper
-- ----------------------------

-- ----------------------------
-- Table structure for user_federation_mapper_config
-- ----------------------------
DROP TABLE IF EXISTS `user_federation_mapper_config`;
CREATE TABLE `user_federation_mapper_config` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`) USING BTREE,
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `user_federation_mapper` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_federation_mapper_config
-- ----------------------------

-- ----------------------------
-- Table structure for user_federation_provider
-- ----------------------------
DROP TABLE IF EXISTS `user_federation_provider`;
CREATE TABLE `user_federation_provider` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
  `LAST_SYNC` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`) USING BTREE,
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_federation_provider
-- ----------------------------

-- ----------------------------
-- Table structure for user_group_membership
-- ----------------------------
DROP TABLE IF EXISTS `user_group_membership`;
CREATE TABLE `user_group_membership` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`) USING BTREE,
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`) USING BTREE,
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_group_membership
-- ----------------------------
INSERT INTO `user_group_membership` VALUES ('45cc8c92-8640-490c-84c6-58f4cc82393a', 'bf8d1a19-ad46-4297-ada2-d1095409121c');
INSERT INTO `user_group_membership` VALUES ('512032de-e220-45ba-bd23-1f15cd3c0f88', 'bf8d1a19-ad46-4297-ada2-d1095409121c');

-- ----------------------------
-- Table structure for user_log_info
-- ----------------------------
DROP TABLE IF EXISTS `user_log_info`;
CREATE TABLE `user_log_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL COMMENT '产生日志时的用户名',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `type` varchar(255) NOT NULL COMMENT '事件类型',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  `ip` varchar(255) DEFAULT NULL COMMENT '登陆IP地址',
  `error` varchar(255) DEFAULT NULL COMMENT '错误信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5463 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_log_info
-- ----------------------------
INSERT INTO `user_log_info` VALUES ('5451', null, null, 'LOGIN_ERROR', '2018-11-15 17:57:15', '172.16.80.3', 'invalid_redirect_uri');
INSERT INTO `user_log_info` VALUES ('5452', null, null, 'LOGIN_ERROR', '2018-11-15 17:57:15', '172.16.80.3', 'invalid_redirect_uri');
INSERT INTO `user_log_info` VALUES ('5453', null, null, 'LOGIN_ERROR', '2018-11-15 17:57:15', '172.16.80.3', 'invalid_redirect_uri');
INSERT INTO `user_log_info` VALUES ('5454', null, null, 'LOGIN_ERROR', '2018-11-15 17:57:15', '172.16.80.3', 'invalid_redirect_uri');
INSERT INTO `user_log_info` VALUES ('5455', null, null, 'LOGIN_ERROR', '2018-11-15 17:57:33', '172.16.80.3', 'invalid_redirect_uri');
INSERT INTO `user_log_info` VALUES ('5456', null, null, 'LOGIN_ERROR', '2018-11-15 17:57:36', '172.16.80.3', 'invalid_redirect_uri');
INSERT INTO `user_log_info` VALUES ('5457', null, null, 'LOGIN_ERROR', '2018-11-15 18:09:05', '10.111.125.97', 'invalid_redirect_uri');
INSERT INTO `user_log_info` VALUES ('5458', null, null, 'LOGIN_ERROR', '2018-11-15 18:10:25', '10.111.125.97', 'invalid_redirect_uri');
INSERT INTO `user_log_info` VALUES ('5459', null, null, 'LOGIN_ERROR', '2018-11-15 18:10:34', '10.111.125.97', 'invalid_redirect_uri');
INSERT INTO `user_log_info` VALUES ('5460', null, null, 'LOGIN_ERROR', '2018-11-15 18:12:38', '172.16.80.3', 'invalid_redirect_uri');
INSERT INTO `user_log_info` VALUES ('5461', 'admin', 'bf8d1a19-ad46-4297-ada2-d1095409121c', 'LOGIN', '2018-11-15 18:14:00', '172.16.80.3', null);
INSERT INTO `user_log_info` VALUES ('5462', 'admin', 'bf8d1a19-ad46-4297-ada2-d1095409121c', 'LOGOUT', '2018-11-15 18:14:02', '172.16.80.3', null);

-- ----------------------------
-- Table structure for user_required_action
-- ----------------------------
DROP TABLE IF EXISTS `user_required_action`;
CREATE TABLE `user_required_action` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`) USING BTREE,
  KEY `IDX_USER_REQACTIONS` (`USER_ID`) USING BTREE,
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_required_action
-- ----------------------------

-- ----------------------------
-- Table structure for user_role_mapping
-- ----------------------------
DROP TABLE IF EXISTS `user_role_mapping`;
CREATE TABLE `user_role_mapping` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`) USING BTREE,
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`) USING BTREE,
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_role_mapping
-- ----------------------------
INSERT INTO `user_role_mapping` VALUES ('094ba54d-6e1d-4fcf-b36b-0c2b2d7410fd', '7f643a21-4516-441a-9612-fbf101f3be07');
INSERT INTO `user_role_mapping` VALUES ('217e51e7-2599-4ab1-8836-3af33fe2d866', '7f643a21-4516-441a-9612-fbf101f3be07');
INSERT INTO `user_role_mapping` VALUES ('67ead231-1987-4cd7-b330-12fa70e53db4', '7f643a21-4516-441a-9612-fbf101f3be07');
INSERT INTO `user_role_mapping` VALUES ('b471d3dd-d641-481c-9d8a-9f84237b8965', '7f643a21-4516-441a-9612-fbf101f3be07');
INSERT INTO `user_role_mapping` VALUES ('e538f394-cd81-4c77-84e8-53c7453c9656', '7f643a21-4516-441a-9612-fbf101f3be07');
INSERT INTO `user_role_mapping` VALUES ('023c0582-ea4e-4e8c-9803-bb0e015d9bc2', '986cc63f-81ca-48a9-a3eb-19d576b14edd');
INSERT INTO `user_role_mapping` VALUES ('0480ebc6-ad4c-48b3-a527-5c4c5588eaa0', '986cc63f-81ca-48a9-a3eb-19d576b14edd');
INSERT INTO `user_role_mapping` VALUES ('0f994c7a-f610-4c93-b91a-7f5e99c20d59', '986cc63f-81ca-48a9-a3eb-19d576b14edd');
INSERT INTO `user_role_mapping` VALUES ('10ce694e-ddf3-488d-8282-5421fb2df3e8', '986cc63f-81ca-48a9-a3eb-19d576b14edd');
INSERT INTO `user_role_mapping` VALUES ('3ae649be-bd35-4fe8-8a30-6a8b4311b997', '986cc63f-81ca-48a9-a3eb-19d576b14edd');
INSERT INTO `user_role_mapping` VALUES ('4dbe80d0-fdec-42eb-9f53-b6f7f478fa77', '986cc63f-81ca-48a9-a3eb-19d576b14edd');
INSERT INTO `user_role_mapping` VALUES ('4e743829-4408-4e2f-8a0b-5e61a6d14303', '986cc63f-81ca-48a9-a3eb-19d576b14edd');
INSERT INTO `user_role_mapping` VALUES ('64a6bc1b-3605-45d4-9ae3-3734b315a24a', '986cc63f-81ca-48a9-a3eb-19d576b14edd');
INSERT INTO `user_role_mapping` VALUES ('9e789bd2-63de-43d2-b3e0-0ab46df0b77e', '986cc63f-81ca-48a9-a3eb-19d576b14edd');
INSERT INTO `user_role_mapping` VALUES ('ae9c9ff9-23bb-427e-99c6-92832b5b80f9', '986cc63f-81ca-48a9-a3eb-19d576b14edd');
INSERT INTO `user_role_mapping` VALUES ('b1f8eaa4-6b6a-4235-bf64-e6843c5d036c', '986cc63f-81ca-48a9-a3eb-19d576b14edd');
INSERT INTO `user_role_mapping` VALUES ('b565b89d-0b40-4400-8cde-5af890c44786', '986cc63f-81ca-48a9-a3eb-19d576b14edd');
INSERT INTO `user_role_mapping` VALUES ('b747157c-7d5c-432b-ac48-fd5fce1f8998', '986cc63f-81ca-48a9-a3eb-19d576b14edd');
INSERT INTO `user_role_mapping` VALUES ('dd713acc-c759-40e8-93f2-7bc1b6eb281e', '986cc63f-81ca-48a9-a3eb-19d576b14edd');
INSERT INTO `user_role_mapping` VALUES ('ef01ff92-cdb4-4586-84d9-ebdac68882cf', '986cc63f-81ca-48a9-a3eb-19d576b14edd');
INSERT INTO `user_role_mapping` VALUES ('f204916f-4eb2-481e-bea4-8b555795eb51', '986cc63f-81ca-48a9-a3eb-19d576b14edd');
INSERT INTO `user_role_mapping` VALUES ('f4f8095f-b8e3-425f-ad36-e0d173152f51', '986cc63f-81ca-48a9-a3eb-19d576b14edd');
INSERT INTO `user_role_mapping` VALUES ('023c0582-ea4e-4e8c-9803-bb0e015d9bc2', 'a71c1780-9307-43cd-87cd-8908a6a6e344');
INSERT INTO `user_role_mapping` VALUES ('0480ebc6-ad4c-48b3-a527-5c4c5588eaa0', 'a71c1780-9307-43cd-87cd-8908a6a6e344');
INSERT INTO `user_role_mapping` VALUES ('0f994c7a-f610-4c93-b91a-7f5e99c20d59', 'a71c1780-9307-43cd-87cd-8908a6a6e344');
INSERT INTO `user_role_mapping` VALUES ('10ce694e-ddf3-488d-8282-5421fb2df3e8', 'a71c1780-9307-43cd-87cd-8908a6a6e344');
INSERT INTO `user_role_mapping` VALUES ('3ae649be-bd35-4fe8-8a30-6a8b4311b997', 'a71c1780-9307-43cd-87cd-8908a6a6e344');
INSERT INTO `user_role_mapping` VALUES ('4dbe80d0-fdec-42eb-9f53-b6f7f478fa77', 'a71c1780-9307-43cd-87cd-8908a6a6e344');
INSERT INTO `user_role_mapping` VALUES ('4e743829-4408-4e2f-8a0b-5e61a6d14303', 'a71c1780-9307-43cd-87cd-8908a6a6e344');
INSERT INTO `user_role_mapping` VALUES ('64a6bc1b-3605-45d4-9ae3-3734b315a24a', 'a71c1780-9307-43cd-87cd-8908a6a6e344');
INSERT INTO `user_role_mapping` VALUES ('9e789bd2-63de-43d2-b3e0-0ab46df0b77e', 'a71c1780-9307-43cd-87cd-8908a6a6e344');
INSERT INTO `user_role_mapping` VALUES ('ae9c9ff9-23bb-427e-99c6-92832b5b80f9', 'a71c1780-9307-43cd-87cd-8908a6a6e344');
INSERT INTO `user_role_mapping` VALUES ('b1f8eaa4-6b6a-4235-bf64-e6843c5d036c', 'a71c1780-9307-43cd-87cd-8908a6a6e344');
INSERT INTO `user_role_mapping` VALUES ('b565b89d-0b40-4400-8cde-5af890c44786', 'a71c1780-9307-43cd-87cd-8908a6a6e344');
INSERT INTO `user_role_mapping` VALUES ('b747157c-7d5c-432b-ac48-fd5fce1f8998', 'a71c1780-9307-43cd-87cd-8908a6a6e344');
INSERT INTO `user_role_mapping` VALUES ('dd713acc-c759-40e8-93f2-7bc1b6eb281e', 'a71c1780-9307-43cd-87cd-8908a6a6e344');
INSERT INTO `user_role_mapping` VALUES ('ef01ff92-cdb4-4586-84d9-ebdac68882cf', 'a71c1780-9307-43cd-87cd-8908a6a6e344');
INSERT INTO `user_role_mapping` VALUES ('f204916f-4eb2-481e-bea4-8b555795eb51', 'a71c1780-9307-43cd-87cd-8908a6a6e344');
INSERT INTO `user_role_mapping` VALUES ('f4f8095f-b8e3-425f-ad36-e0d173152f51', 'a71c1780-9307-43cd-87cd-8908a6a6e344');
INSERT INTO `user_role_mapping` VALUES ('0b8810c8-ed82-48e2-a895-d98dc0da4c7a', 'bf8d1a19-ad46-4297-ada2-d1095409121c');
INSERT INTO `user_role_mapping` VALUES ('4e743829-4408-4e2f-8a0b-5e61a6d14303', 'bf8d1a19-ad46-4297-ada2-d1095409121c');
INSERT INTO `user_role_mapping` VALUES ('ae9c9ff9-23bb-427e-99c6-92832b5b80f9', 'bf8d1a19-ad46-4297-ada2-d1095409121c');
INSERT INTO `user_role_mapping` VALUES ('b1f8eaa4-6b6a-4235-bf64-e6843c5d036c', 'bf8d1a19-ad46-4297-ada2-d1095409121c');
INSERT INTO `user_role_mapping` VALUES ('b565b89d-0b40-4400-8cde-5af890c44786', 'bf8d1a19-ad46-4297-ada2-d1095409121c');

-- ----------------------------
-- Table structure for user_session
-- ----------------------------
DROP TABLE IF EXISTS `user_session`;
CREATE TABLE `user_session` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int(11) DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_session
-- ----------------------------

-- ----------------------------
-- Table structure for user_session_note
-- ----------------------------
DROP TABLE IF EXISTS `user_session_note`;
CREATE TABLE `user_session_note` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`USER_SESSION`,`NAME`) USING BTREE,
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `user_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_session_note
-- ----------------------------

-- ----------------------------
-- Table structure for web_origins
-- ----------------------------
DROP TABLE IF EXISTS `web_origins`;
CREATE TABLE `web_origins` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`) USING BTREE,
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of web_origins
-- ----------------------------
INSERT INTO `web_origins` VALUES ('1', '0c0a8bdb-7b30-4c61-9328-18a4435e782a', '');
INSERT INTO `web_origins` VALUES ('2', '33958903-5b08-4a0e-b27d-2a046631ddae', '');
INSERT INTO `web_origins` VALUES ('36', 'c60de944-62eb-4773-b1f4-550be57b3f25', 'http://{ONEX_IP}');
INSERT INTO `web_origins` VALUES ('37', 'eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', 'http://{ONEX_IP}');

-- pulsar client add
INSERT INTO `client` (`ID`, `ENABLED`, `FULL_SCOPE_ALLOWED`, `CLIENT_ID`, `NOT_BEFORE`, `PUBLIC_CLIENT`, `SECRET`, `BASE_URL`, `BEARER_ONLY`, `MANAGEMENT_URL`, `SURROGATE_AUTH_REQUIRED`, `REALM_ID`, `PROTOCOL`, `NODE_REREG_TIMEOUT`, `FRONTCHANNEL_LOGOUT`, `CONSENT_REQUIRED`, `NAME`, `SERVICE_ACCOUNTS_ENABLED`, `CLIENT_AUTHENTICATOR_TYPE`, `ROOT_URL`, `DESCRIPTION`, `REGISTRATION_TOKEN`, `STANDARD_FLOW_ENABLED`, `IMPLICIT_FLOW_ENABLED`, `DIRECT_ACCESS_GRANTS_ENABLED`, `CLIENT_TEMPLATE_ID`, `USE_TEMPLATE_CONFIG`, `USE_TEMPLATE_SCOPE`, `USE_TEMPLATE_MAPPERS`) VALUES ('43ffeb8a-0024-4c7e-9826-f4897b1a46fa', b'1', b'1', 'pulsar-client', '0', b'0', '96591682-27c0-483f-9882-3b57215c83fe', NULL, b'0', NULL, b'0', 'fast', 'openid-connect', '-1', b'0', b'0', NULL, b'1', 'client-secret', NULL, NULL, NULL, b'1', b'0', b'1', NULL, b'0', b'0', b'0');

INSERT INTO `client_attributes` (`CLIENT_ID`, `VALUE`, `NAME`) VALUES ('43ffeb8a-0024-4c7e-9826-f4897b1a46fa', 'false', 'saml.assertion.signature');
INSERT INTO `client_attributes` (`CLIENT_ID`, `VALUE`, `NAME`) VALUES ('43ffeb8a-0024-4c7e-9826-f4897b1a46fa', 'false', 'saml.authnstatement');
INSERT INTO `client_attributes` (`CLIENT_ID`, `VALUE`, `NAME`) VALUES ('43ffeb8a-0024-4c7e-9826-f4897b1a46fa', 'false', 'saml.client.signature');
INSERT INTO `client_attributes` (`CLIENT_ID`, `VALUE`, `NAME`) VALUES ('43ffeb8a-0024-4c7e-9826-f4897b1a46fa', 'false', 'saml.encrypt');
INSERT INTO `client_attributes` (`CLIENT_ID`, `VALUE`, `NAME`) VALUES ('43ffeb8a-0024-4c7e-9826-f4897b1a46fa', 'false', 'saml.force.post.binding');
INSERT INTO `client_attributes` (`CLIENT_ID`, `VALUE`, `NAME`) VALUES ('43ffeb8a-0024-4c7e-9826-f4897b1a46fa', 'false', 'saml.multivalued.roles');
INSERT INTO `client_attributes` (`CLIENT_ID`, `VALUE`, `NAME`) VALUES ('43ffeb8a-0024-4c7e-9826-f4897b1a46fa', 'false', 'saml.onetimeuse.condition');
INSERT INTO `client_attributes` (`CLIENT_ID`, `VALUE`, `NAME`) VALUES ('43ffeb8a-0024-4c7e-9826-f4897b1a46fa', 'false', 'saml.server.signature');
INSERT INTO `client_attributes` (`CLIENT_ID`, `VALUE`, `NAME`) VALUES ('43ffeb8a-0024-4c7e-9826-f4897b1a46fa', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO `client_attributes` (`CLIENT_ID`, `VALUE`, `NAME`) VALUES ('43ffeb8a-0024-4c7e-9826-f4897b1a46fa', 'false', 'saml_force_name_id_format');

INSERT INTO `keycloak_role` (`ID`, `CLIENT_REALM_CONSTRAINT`, `CLIENT_ROLE`, `DESCRIPTION`, `NAME`, `REALM_ID`, `CLIENT`, `REALM`, `SCOPE_PARAM_REQUIRED`) VALUES ('48aa5b79-4b0e-413c-8c72-49ab002ba252', '43ffeb8a-0024-4c7e-9826-f4897b1a46fa', b'1', NULL, 'uma_protection', 'fast', '43ffeb8a-0024-4c7e-9826-f4897b1a46fa', NULL, b'0');

INSERT INTO `resource_server` (`ID`, `ALLOW_RS_REMOTE_MGMT`, `POLICY_ENFORCE_MODE`) VALUES ('43ffeb8a-0024-4c7e-9826-f4897b1a46fa', b'0', '0');

INSERT INTO `resource_server_policy` (`ID`, `NAME`, `DESCRIPTION`, `TYPE`, `DECISION_STRATEGY`, `LOGIC`, `RESOURCE_SERVER_ID`) VALUES ('0895fbcc-0e32-419e-bfd2-354e98a3241c', 'Default Policy', 'A policy that grants access only for users within this realm', 'js', '0', '0', '43ffeb8a-0024-4c7e-9826-f4897b1a46fa');
INSERT INTO `resource_server_policy` (`ID`, `NAME`, `DESCRIPTION`, `TYPE`, `DECISION_STRATEGY`, `LOGIC`, `RESOURCE_SERVER_ID`) VALUES ('e403df97-f60c-452a-8507-be3ce6884a51', 'Default Permission', 'A permission that applies to the default resource type', 'resource', '1', '0', '43ffeb8a-0024-4c7e-9826-f4897b1a46fa');

INSERT INTO `resource_server_resource` (`ID`, `NAME`, `URI`, `TYPE`, `ICON_URI`, `OWNER`, `RESOURCE_SERVER_ID`) VALUES ('ff02a5e4-5a2a-4933-8e2c-2f1beeba84d5', 'Default Resource', '/*', 'urn:pulsar-client:resources:default', NULL, '43ffeb8a-0024-4c7e-9826-f4897b1a46fa', '43ffeb8a-0024-4c7e-9826-f4897b1a46fa');

INSERT INTO `policy_config` (`POLICY_ID`, `NAME`, `VALUE`) VALUES ('0895fbcc-0e32-419e-bfd2-354e98a3241c', 'code', '// by default, grants any permission associated with this policy\n$evaluation.grant();\n');
INSERT INTO `policy_config` (`POLICY_ID`, `NAME`, `VALUE`) VALUES ('e403df97-f60c-452a-8507-be3ce6884a51', 'defaultResourceType', 'urn:pulsar-client:resources:default');

INSERT INTO `associated_policy` (`POLICY_ID`, `ASSOCIATED_POLICY_ID`) VALUES ('e403df97-f60c-452a-8507-be3ce6884a51', '0895fbcc-0e32-419e-bfd2-354e98a3241c');

INSERT INTO `protocol_mapper` (`ID`, `NAME`, `PROTOCOL`, `PROTOCOL_MAPPER_NAME`, `CONSENT_REQUIRED`, `CONSENT_TEXT`, `CLIENT_ID`, `CLIENT_TEMPLATE_ID`) VALUES ('116ebbe0-2317-4e62-8955-4ba0aeb7b9b1', 'full name', 'openid-connect', 'oidc-full-name-mapper', b'1', '${fullName}', '43ffeb8a-0024-4c7e-9826-f4897b1a46fa', NULL);
INSERT INTO `protocol_mapper` (`ID`, `NAME`, `PROTOCOL`, `PROTOCOL_MAPPER_NAME`, `CONSENT_REQUIRED`, `CONSENT_TEXT`, `CLIENT_ID`, `CLIENT_TEMPLATE_ID`) VALUES ('23c7cdfc-deeb-40b7-8e1f-aaab447e21f5', 'Client IP Address', 'openid-connect', 'oidc-usersessionmodel-note-mapper', b'0', '', '43ffeb8a-0024-4c7e-9826-f4897b1a46fa', NULL);
INSERT INTO `protocol_mapper` (`ID`, `NAME`, `PROTOCOL`, `PROTOCOL_MAPPER_NAME`, `CONSENT_REQUIRED`, `CONSENT_TEXT`, `CLIENT_ID`, `CLIENT_TEMPLATE_ID`) VALUES ('2534c856-bbe3-44e1-9805-dfabac500b3e', 'role list', 'saml', 'saml-role-list-mapper', b'0', NULL, '43ffeb8a-0024-4c7e-9826-f4897b1a46fa', NULL);
INSERT INTO `protocol_mapper` (`ID`, `NAME`, `PROTOCOL`, `PROTOCOL_MAPPER_NAME`, `CONSENT_REQUIRED`, `CONSENT_TEXT`, `CLIENT_ID`, `CLIENT_TEMPLATE_ID`) VALUES ('2f3ee3c1-9978-4d7b-9a6a-e0feed15d44f', 'Client Host', 'openid-connect', 'oidc-usersessionmodel-note-mapper', b'0', '', '43ffeb8a-0024-4c7e-9826-f4897b1a46fa', NULL);
INSERT INTO `protocol_mapper` (`ID`, `NAME`, `PROTOCOL`, `PROTOCOL_MAPPER_NAME`, `CONSENT_REQUIRED`, `CONSENT_TEXT`, `CLIENT_ID`, `CLIENT_TEMPLATE_ID`) VALUES ('4f3c44f1-a57f-4c98-aa10-76b009f942b4', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', b'1', '${givenName}', '43ffeb8a-0024-4c7e-9826-f4897b1a46fa', NULL);
INSERT INTO `protocol_mapper` (`ID`, `NAME`, `PROTOCOL`, `PROTOCOL_MAPPER_NAME`, `CONSENT_REQUIRED`, `CONSENT_TEXT`, `CLIENT_ID`, `CLIENT_TEMPLATE_ID`) VALUES ('66dbc066-5fde-4106-83f0-bb6dcc1af51d', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', b'1', '${email}', '43ffeb8a-0024-4c7e-9826-f4897b1a46fa', NULL);
INSERT INTO `protocol_mapper` (`ID`, `NAME`, `PROTOCOL`, `PROTOCOL_MAPPER_NAME`, `CONSENT_REQUIRED`, `CONSENT_TEXT`, `CLIENT_ID`, `CLIENT_TEMPLATE_ID`) VALUES ('af04fe5c-1f43-4136-9b8c-c6d007fe2b86', 'Client ID', 'openid-connect', 'oidc-usersessionmodel-note-mapper', b'0', '', '43ffeb8a-0024-4c7e-9826-f4897b1a46fa', NULL);
INSERT INTO `protocol_mapper` (`ID`, `NAME`, `PROTOCOL`, `PROTOCOL_MAPPER_NAME`, `CONSENT_REQUIRED`, `CONSENT_TEXT`, `CLIENT_ID`, `CLIENT_TEMPLATE_ID`) VALUES ('b7945235-03e5-48b0-818d-da4a5c1a86c5', 'isAdmin', 'openid-connect', 'oidc-usermodel-attribute-mapper', b'0', NULL, '43ffeb8a-0024-4c7e-9826-f4897b1a46fa', NULL);
INSERT INTO `protocol_mapper` (`ID`, `NAME`, `PROTOCOL`, `PROTOCOL_MAPPER_NAME`, `CONSENT_REQUIRED`, `CONSENT_TEXT`, `CLIENT_ID`, `CLIENT_TEMPLATE_ID`) VALUES ('bc95a760-6c44-4e33-bcfc-2845c02ef4df', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', b'1', '${username}', '43ffeb8a-0024-4c7e-9826-f4897b1a46fa', NULL);
INSERT INTO `protocol_mapper` (`ID`, `NAME`, `PROTOCOL`, `PROTOCOL_MAPPER_NAME`, `CONSENT_REQUIRED`, `CONSENT_TEXT`, `CLIENT_ID`, `CLIENT_TEMPLATE_ID`) VALUES ('c76a4ed1-d4e9-482b-a0b1-08803d37ea75', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', b'1', '${familyName}', '43ffeb8a-0024-4c7e-9826-f4897b1a46fa', NULL);

INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('116ebbe0-2317-4e62-8955-4ba0aeb7b9b1', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('116ebbe0-2317-4e62-8955-4ba0aeb7b9b1', 'true', 'id.token.claim');

INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('23c7cdfc-deeb-40b7-8e1f-aaab447e21f5', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('23c7cdfc-deeb-40b7-8e1f-aaab447e21f5', 'clientAddress', 'claim.name');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('23c7cdfc-deeb-40b7-8e1f-aaab447e21f5', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('23c7cdfc-deeb-40b7-8e1f-aaab447e21f5', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('23c7cdfc-deeb-40b7-8e1f-aaab447e21f5', 'clientAddress', 'user.session.note');

INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('2534c856-bbe3-44e1-9805-dfabac500b3e', 'Role', 'attribute.name');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('2534c856-bbe3-44e1-9805-dfabac500b3e', 'Basic', 'attribute.nameformat');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('2534c856-bbe3-44e1-9805-dfabac500b3e', 'false', 'single');

INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('2f3ee3c1-9978-4d7b-9a6a-e0feed15d44f', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('2f3ee3c1-9978-4d7b-9a6a-e0feed15d44f', 'clientHost', 'claim.name');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('2f3ee3c1-9978-4d7b-9a6a-e0feed15d44f', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('2f3ee3c1-9978-4d7b-9a6a-e0feed15d44f', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('2f3ee3c1-9978-4d7b-9a6a-e0feed15d44f', 'clientHost', 'user.session.note');

INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('4f3c44f1-a57f-4c98-aa10-76b009f942b4', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('4f3c44f1-a57f-4c98-aa10-76b009f942b4', 'given_name', 'claim.name');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('4f3c44f1-a57f-4c98-aa10-76b009f942b4', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('4f3c44f1-a57f-4c98-aa10-76b009f942b4', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('4f3c44f1-a57f-4c98-aa10-76b009f942b4', 'firstName', 'user.attribute');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('4f3c44f1-a57f-4c98-aa10-76b009f942b4', 'true', 'userinfo.token.claim');

INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('66dbc066-5fde-4106-83f0-bb6dcc1af51d', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('66dbc066-5fde-4106-83f0-bb6dcc1af51d', 'email', 'claim.name');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('66dbc066-5fde-4106-83f0-bb6dcc1af51d', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('66dbc066-5fde-4106-83f0-bb6dcc1af51d', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('66dbc066-5fde-4106-83f0-bb6dcc1af51d', 'email', 'user.attribute');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('66dbc066-5fde-4106-83f0-bb6dcc1af51d', 'true', 'userinfo.token.claim');

INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('af04fe5c-1f43-4136-9b8c-c6d007fe2b86', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('af04fe5c-1f43-4136-9b8c-c6d007fe2b86', 'clientId', 'claim.name');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('af04fe5c-1f43-4136-9b8c-c6d007fe2b86', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('af04fe5c-1f43-4136-9b8c-c6d007fe2b86', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('af04fe5c-1f43-4136-9b8c-c6d007fe2b86', 'clientId', 'user.session.note');

INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('b7945235-03e5-48b0-818d-da4a5c1a86c5', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('b7945235-03e5-48b0-818d-da4a5c1a86c5', 'isAdmin', 'claim.name');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('b7945235-03e5-48b0-818d-da4a5c1a86c5', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('b7945235-03e5-48b0-818d-da4a5c1a86c5', 'boolean', 'jsonType.label');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('b7945235-03e5-48b0-818d-da4a5c1a86c5', '', 'multivalued');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('b7945235-03e5-48b0-818d-da4a5c1a86c5', 'admin', 'user.attribute');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('b7945235-03e5-48b0-818d-da4a5c1a86c5', 'true', 'userinfo.token.claim');

INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('bc95a760-6c44-4e33-bcfc-2845c02ef4df', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('bc95a760-6c44-4e33-bcfc-2845c02ef4df', 'preferred_username', 'claim.name');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('bc95a760-6c44-4e33-bcfc-2845c02ef4df', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('bc95a760-6c44-4e33-bcfc-2845c02ef4df', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('bc95a760-6c44-4e33-bcfc-2845c02ef4df', 'username', 'user.attribute');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('bc95a760-6c44-4e33-bcfc-2845c02ef4df', 'true', 'userinfo.token.claim');

INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('c76a4ed1-d4e9-482b-a0b1-08803d37ea75', 'true', 'access.token.claim');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('c76a4ed1-d4e9-482b-a0b1-08803d37ea75', 'family_name', 'claim.name');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('c76a4ed1-d4e9-482b-a0b1-08803d37ea75', 'true', 'id.token.claim');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('c76a4ed1-d4e9-482b-a0b1-08803d37ea75', 'String', 'jsonType.label');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('c76a4ed1-d4e9-482b-a0b1-08803d37ea75', 'lastName', 'user.attribute');
INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES ('c76a4ed1-d4e9-482b-a0b1-08803d37ea75', 'true', 'userinfo.token.claim');

INSERT INTO `redirect_uris` (`CLIENT_ID`, `VALUE`) VALUES ('43ffeb8a-0024-4c7e-9826-f4897b1a46fa', 'http://{ONEX_IP}/*');

INSERT INTO `user_entity` (`ID`, `EMAIL`, `EMAIL_CONSTRAINT`, `EMAIL_VERIFIED`, `ENABLED`, `FEDERATION_LINK`, `FIRST_NAME`, `LAST_NAME`, `REALM_ID`, `USERNAME`, `CREATED_TIMESTAMP`, `SERVICE_ACCOUNT_CLIENT_LINK`, `NOT_BEFORE`) VALUES ('f395deee-f600-4490-b5a7-5035ad83b518', 'service-account-pulsar-client@placeholder.org', 'service-account-pulsar-client@placeholder.org', b'0', b'1', NULL, NULL, NULL, 'fast', 'service-account-pulsar-client', '1542087807057', '43ffeb8a-0024-4c7e-9826-f4897b1a46fa', '0');

INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES ('023c0582-ea4e-4e8c-9803-bb0e015d9bc2', 'f395deee-f600-4490-b5a7-5035ad83b518');
INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES ('0480ebc6-ad4c-48b3-a527-5c4c5588eaa0', 'f395deee-f600-4490-b5a7-5035ad83b518');
INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES ('0f994c7a-f610-4c93-b91a-7f5e99c20d59', 'f395deee-f600-4490-b5a7-5035ad83b518');
INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES ('10ce694e-ddf3-488d-8282-5421fb2df3e8', 'f395deee-f600-4490-b5a7-5035ad83b518');
INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES ('3ae649be-bd35-4fe8-8a30-6a8b4311b997', 'f395deee-f600-4490-b5a7-5035ad83b518');
INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES ('48aa5b79-4b0e-413c-8c72-49ab002ba252', 'f395deee-f600-4490-b5a7-5035ad83b518');
INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES ('4dbe80d0-fdec-42eb-9f53-b6f7f478fa77', 'f395deee-f600-4490-b5a7-5035ad83b518');
INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES ('4e743829-4408-4e2f-8a0b-5e61a6d14303', 'f395deee-f600-4490-b5a7-5035ad83b518');
INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES ('64a6bc1b-3605-45d4-9ae3-3734b315a24a', 'f395deee-f600-4490-b5a7-5035ad83b518');
INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES ('9e789bd2-63de-43d2-b3e0-0ab46df0b77e', 'f395deee-f600-4490-b5a7-5035ad83b518');
INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES ('ae9c9ff9-23bb-427e-99c6-92832b5b80f9', 'f395deee-f600-4490-b5a7-5035ad83b518');
INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES ('b1f8eaa4-6b6a-4235-bf64-e6843c5d036c', 'f395deee-f600-4490-b5a7-5035ad83b518');
INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES ('b565b89d-0b40-4400-8cde-5af890c44786', 'f395deee-f600-4490-b5a7-5035ad83b518');
INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES ('b747157c-7d5c-432b-ac48-fd5fce1f8998', 'f395deee-f600-4490-b5a7-5035ad83b518');
INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES ('dd713acc-c759-40e8-93f2-7bc1b6eb281e', 'f395deee-f600-4490-b5a7-5035ad83b518');
INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES ('ef01ff92-cdb4-4586-84d9-ebdac68882cf', 'f395deee-f600-4490-b5a7-5035ad83b518');
INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES ('f204916f-4eb2-481e-bea4-8b555795eb51', 'f395deee-f600-4490-b5a7-5035ad83b518');
INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES ('f4f8095f-b8e3-425f-ad36-e0d173152f51', 'f395deee-f600-4490-b5a7-5035ad83b518');

INSERT INTO `web_origins` (`CLIENT_ID`, `VALUE`) VALUES ('43ffeb8a-0024-4c7e-9826-f4897b1a46fa', 'http://{ONEX_IP}');
