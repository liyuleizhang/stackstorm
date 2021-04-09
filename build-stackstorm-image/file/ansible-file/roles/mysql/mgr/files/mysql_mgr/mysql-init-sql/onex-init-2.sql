SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
use one_infrastructure;

-- ----------------------------
-- Table structure for admin_event_entity
-- ----------------------------
DROP TABLE IF EXISTS `admin_event_entity`;
CREATE TABLE `admin_event_entity` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` varchar(2550) DEFAULT NULL,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of admin_event_entity
-- ----------------------------

-- ----------------------------
-- Table structure for associated_policy
-- ----------------------------
DROP TABLE IF EXISTS `associated_policy`;
CREATE TABLE `associated_policy` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`) USING BTREE,
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`) USING BTREE,
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `resource_server_policy` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of associated_policy
-- ----------------------------
INSERT INTO `associated_policy` VALUES ('4a37fd1a-3c87-4688-ac8f-c14aef4cec6e', '11fcaeb7-8a5b-4f97-8803-22812ebfd584');
INSERT INTO `associated_policy` VALUES ('833231dd-5dec-4b80-bc27-0c302d6c6820', '58c77104-cdf1-4a1c-a32f-bc201fe3e83b');

-- ----------------------------
-- Table structure for authentication_execution
-- ----------------------------
DROP TABLE IF EXISTS `authentication_execution`;
CREATE TABLE `authentication_execution` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`) USING BTREE,
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`) USING BTREE,
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `authentication_flow` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of authentication_execution
-- ----------------------------
INSERT INTO `authentication_execution` VALUES ('022d8ced-dda4-49fd-8b26-6732440e90cf', null, 'reset-otp', 'master', '887545f8-328f-4af4-a554-8d665ec53c45', '1', '40', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('04b4f031-22d4-421d-ab95-6d5d8e0b0386', null, 'auth-otp-form', 'master', '1b57f63e-2690-4af1-bff2-5d77da349f12', '1', '20', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('0cbafee2-6db6-4f17-9655-e698ba190313', null, 'docker-http-basic-authenticator', 'fast', 'cc2de003-1dca-40b9-8675-f7bf5710a009', '0', '10', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('12977c65-48a8-4c12-9694-cfe510ffc5c1', null, 'idp-confirm-link', 'master', '344cc350-204c-4fe4-8319-65da9a9394cd', '0', '10', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('14809324-f280-4a1b-a02a-2ee296ecf62c', null, null, 'fast', 'cff4d085-1a12-4723-9968-497353eecf15', '2', '30', '', 'ebab75b8-cd7a-491b-bd50-7cba07d4bef9', null);
INSERT INTO `authentication_execution` VALUES ('1641f6cb-edca-4058-a9b0-547086917725', null, 'reset-password', 'fast', '6404036d-670f-46be-b48f-f2cf7b3a438f', '0', '30', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('1817d850-1304-423e-a7cf-4f59b74849c9', null, 'identity-provider-redirector', 'fast', '6b8a674a-2e15-4ea7-b8d6-0558b7139a89', '2', '25', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('1ac163b3-25fb-4dc9-b815-de27ef14eab5', null, 'http-basic-authenticator', 'fast', '8840ef4c-bd2a-44e9-a832-0cca974c7dda', '0', '10', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('1bf97394-26e8-4138-8731-dd97e0a1bfb3', null, null, 'fast', '6b8a674a-2e15-4ea7-b8d6-0558b7139a89', '2', '30', '', '70e0596b-b930-4b81-bae2-10d87fc545c3', null);
INSERT INTO `authentication_execution` VALUES ('24ce90e1-7b81-4d23-b584-2be61a42b06e', null, 'auth-otp-form', 'fast', '70e0596b-b930-4b81-bae2-10d87fc545c3', '1', '20', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('284a3502-ee9b-4c2d-a456-4af020831faf', null, 'direct-grant-validate-otp', 'fast', '806079a2-0fc5-4253-8c2c-9f0abb1ecd5a', '1', '30', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('29744582-b368-4365-a9f5-133234775e3b', null, null, 'master', '344cc350-204c-4fe4-8319-65da9a9394cd', '2', '30', '', 'b2df4f6a-5c17-4310-99c4-039bd683761b', null);
INSERT INTO `authentication_execution` VALUES ('2c0f1943-574c-4bde-8c92-ef352a5a3d94', null, 'auth-username-password-form', 'fast', '70e0596b-b930-4b81-bae2-10d87fc545c3', '0', '10', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('31a369be-82e5-4982-bc2a-abf984cadf00', null, 'registration-recaptcha-action', 'master', '659ba0fb-9540-4b10-aa2a-91c5d577dcc5', '3', '60', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('31fd5448-6398-40f5-ab20-c6994ffb84ae', null, 'reset-credentials-choose-user', 'master', '887545f8-328f-4af4-a554-8d665ec53c45', '0', '10', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('32e1b78c-203d-4361-b0d6-752a1ae637f2', null, 'identity-provider-redirector', 'master', '138d2f81-05a3-4327-b417-ac31bbfb101d', '2', '25', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('37a33792-e5c9-477b-818e-66c1ed4ea07d', null, 'reset-credentials-choose-user', 'fast', '6404036d-670f-46be-b48f-f2cf7b3a438f', '0', '10', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('3e71f125-cc61-4c48-8c9d-bda8428b3584', null, 'idp-email-verification', 'fast', 'ebab75b8-cd7a-491b-bd50-7cba07d4bef9', '2', '20', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('44608fd4-66b4-4674-a842-51c584092a31', null, 'registration-recaptcha-action', 'fast', '58459abf-baa9-4766-8d44-ddb502e32ebe', '3', '60', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('4e7daae6-1952-47ba-94cc-e4fbd75197ec', null, 'idp-username-password-form', 'master', 'b2df4f6a-5c17-4310-99c4-039bd683761b', '0', '10', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('54b4d673-9bd0-4206-b618-c9bb59c624fd', null, 'reset-password', 'master', '887545f8-328f-4af4-a554-8d665ec53c45', '0', '30', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('574b5157-71ae-422b-bd3d-f1b3fb8846cb', null, 'client-jwt', 'master', 'b060f08f-4457-4ac7-86f6-8954078cf762', '2', '20', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('6140d827-de86-4db9-8292-cce514dba17f', null, null, 'master', '138d2f81-05a3-4327-b417-ac31bbfb101d', '2', '30', '', '1b57f63e-2690-4af1-bff2-5d77da349f12', null);
INSERT INTO `authentication_execution` VALUES ('63a9f698-9830-43db-a169-320b40f00641', null, 'registration-page-form', 'master', '7b361013-7625-40d0-b7dd-6c41a0a0b14e', '0', '10', '', '659ba0fb-9540-4b10-aa2a-91c5d577dcc5', null);
INSERT INTO `authentication_execution` VALUES ('66b18d48-722b-4ad4-9815-9939ef895a0f', null, 'docker-http-basic-authenticator', 'master', 'd8c17159-e810-4ea8-8691-825be4d91213', '0', '10', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('67f12727-c227-4a92-81fb-31b1e1d87a77', null, 'auth-spnego', 'master', '138d2f81-05a3-4327-b417-ac31bbfb101d', '3', '20', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('7005382d-b0bb-44f8-8a6b-8ecfbd527119', null, 'auth-otp-form', 'master', 'b2df4f6a-5c17-4310-99c4-039bd683761b', '1', '20', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('713e0ade-3cdb-4ff1-868e-642b69a3ec35', null, 'direct-grant-validate-password', 'fast', '806079a2-0fc5-4253-8c2c-9f0abb1ecd5a', '0', '20', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('726e4c25-6093-419b-99c1-f75b76cda64b', null, 'registration-profile-action', 'master', '659ba0fb-9540-4b10-aa2a-91c5d577dcc5', '0', '40', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('72ec38ba-1ec5-46f0-bc2c-adaab34b207c', null, 'registration-password-action', 'fast', '58459abf-baa9-4766-8d44-ddb502e32ebe', '0', '50', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('74ae506c-2f23-4514-a2f7-115f26a4518b', null, 'idp-create-user-if-unique', 'fast', 'cff4d085-1a12-4723-9968-497353eecf15', '2', '20', '\0', null, '8a9f934e-185c-443e-89a1-88d09140684c');
INSERT INTO `authentication_execution` VALUES ('75431c2a-fb74-4199-b0f3-c5b668477f9e', null, 'auth-spnego', 'fast', '6b8a674a-2e15-4ea7-b8d6-0558b7139a89', '3', '20', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('8612cf6f-9db4-4ed3-af23-9a6002c26816', null, 'client-jwt', 'fast', 'cbe32cec-36cb-44c5-9c3e-5fced09dd179', '2', '20', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('89c68a91-ccb8-456a-ba54-b5ada0672c29', null, 'idp-confirm-link', 'fast', 'ebab75b8-cd7a-491b-bd50-7cba07d4bef9', '0', '10', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('96ef2594-fe28-41ac-a515-294cbf4e10cb', null, 'idp-create-user-if-unique', 'master', '6d200864-592a-4d15-a328-fad38b924bfb', '2', '20', '\0', null, '9494484e-b7d4-45db-a3d6-9245ce1ed6f9');
INSERT INTO `authentication_execution` VALUES ('97988fca-bb9f-4912-ba64-473219887209', null, 'idp-email-verification', 'master', '344cc350-204c-4fe4-8319-65da9a9394cd', '2', '20', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('97d448e3-5a2e-49db-a8a6-9a715883fef3', null, 'auth-cookie', 'master', '138d2f81-05a3-4327-b417-ac31bbfb101d', '2', '10', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('987f7f41-3c8c-4e4d-a946-97c8ac9ca42e', null, 'registration-page-form', 'fast', '3ac80cd8-8e64-4acf-9744-e22d2553a3a5', '0', '10', '', '58459abf-baa9-4766-8d44-ddb502e32ebe', null);
INSERT INTO `authentication_execution` VALUES ('99123753-12c8-450c-8d24-e629d251ca96', null, 'direct-grant-validate-username', 'fast', '806079a2-0fc5-4253-8c2c-9f0abb1ecd5a', '0', '10', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('9d9a9335-7812-4a0e-908a-cc9a8baa0f34', null, 'auth-username-password-form', 'master', '1b57f63e-2690-4af1-bff2-5d77da349f12', '0', '10', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('9ded38c2-86f5-4752-9588-413dcbcf3e66', null, 'direct-grant-validate-otp', 'master', '1dda46c0-589b-4ba9-a777-7d7a9686f59a', '1', '30', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('a31cf27a-e9e1-4c0e-b584-3b411811da82', null, 'idp-username-password-form', 'fast', '3411faab-d5a9-40c2-a6b9-76c1d15bdaed', '0', '10', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('a4fcad3c-ecdf-4624-b92d-3967144cb94e', null, 'client-secret', 'master', 'b060f08f-4457-4ac7-86f6-8954078cf762', '2', '10', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('a72214cb-a80c-49bf-8344-b9a3b4f33b88', null, 'direct-grant-validate-username', 'master', '1dda46c0-589b-4ba9-a777-7d7a9686f59a', '0', '10', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('a89f5a83-cd57-4728-ae58-1b2716d738c6', null, 'registration-user-creation', 'master', '659ba0fb-9540-4b10-aa2a-91c5d577dcc5', '0', '20', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('a8c45457-4670-49d4-bb29-6f37d26404e1', null, 'idp-review-profile', 'fast', 'cff4d085-1a12-4723-9968-497353eecf15', '0', '10', '\0', null, '1bde0102-e468-4623-a569-a94eee570510');
INSERT INTO `authentication_execution` VALUES ('adef7f79-dc32-448b-83ef-dc3c4e3c1d3e', null, 'reset-credential-email', 'master', '887545f8-328f-4af4-a554-8d665ec53c45', '0', '20', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('bd320e03-0813-4ffc-b69a-b8f5d287fb6d', null, 'auth-otp-form', 'fast', '3411faab-d5a9-40c2-a6b9-76c1d15bdaed', '1', '20', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('c653952d-b417-4a9b-8b62-ea39bdedb399', null, 'reset-otp', 'fast', '6404036d-670f-46be-b48f-f2cf7b3a438f', '1', '40', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('cb94d89f-9952-41f7-96ba-8294806fb4d1', null, 'direct-grant-validate-password', 'master', '1dda46c0-589b-4ba9-a777-7d7a9686f59a', '0', '20', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('d309c34a-dac7-4f5a-ad4d-9eb4474077ff', null, null, 'fast', 'ebab75b8-cd7a-491b-bd50-7cba07d4bef9', '2', '30', '', '3411faab-d5a9-40c2-a6b9-76c1d15bdaed', null);
INSERT INTO `authentication_execution` VALUES ('d33a015f-0882-4c92-a529-b603e569d2d7', null, 'client-secret', 'fast', 'cbe32cec-36cb-44c5-9c3e-5fced09dd179', '2', '10', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('dd470e03-fbfa-48ed-992a-9c1d1c9eca96', null, 'reset-credential-email', 'fast', '6404036d-670f-46be-b48f-f2cf7b3a438f', '0', '20', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('e1bdad3d-18fe-406b-a7bd-ca6acf4852ac', null, 'auth-cookie', 'fast', '6b8a674a-2e15-4ea7-b8d6-0558b7139a89', '2', '10', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('eb2e7416-d36e-463e-b1df-d2bb930b4d31', null, 'registration-profile-action', 'fast', '58459abf-baa9-4766-8d44-ddb502e32ebe', '0', '40', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('f1c42f9d-a7c1-468d-980c-a47bd4b1ad88', null, 'idp-review-profile', 'master', '6d200864-592a-4d15-a328-fad38b924bfb', '0', '10', '\0', null, '81f152be-b552-4c79-8e83-c68ca2a3228e');
INSERT INTO `authentication_execution` VALUES ('f35fa5fa-609b-41b8-880f-89757f0b8b8d', null, null, 'master', '6d200864-592a-4d15-a328-fad38b924bfb', '2', '30', '', '344cc350-204c-4fe4-8319-65da9a9394cd', null);
INSERT INTO `authentication_execution` VALUES ('f543e791-d4bc-41f5-9324-9f91fe3c9223', null, 'http-basic-authenticator', 'master', '269be818-9322-4933-af6e-6fee1bc8e38a', '0', '10', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('fd168a58-ad03-4652-a952-0bd5f08ace7f', null, 'registration-password-action', 'master', '659ba0fb-9540-4b10-aa2a-91c5d577dcc5', '0', '50', '\0', null, null);
INSERT INTO `authentication_execution` VALUES ('fd62a87e-61fa-4c8b-8784-9203dad94a4d', null, 'registration-user-creation', 'fast', '58459abf-baa9-4766-8d44-ddb502e32ebe', '0', '20', '\0', null, null);

-- ----------------------------
-- Table structure for authentication_flow
-- ----------------------------
DROP TABLE IF EXISTS `authentication_flow`;
CREATE TABLE `authentication_flow` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`) USING BTREE,
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of authentication_flow
-- ----------------------------
INSERT INTO `authentication_flow` VALUES ('138d2f81-05a3-4327-b417-ac31bbfb101d', 'browser', 'browser based authentication', 'master', 'basic-flow', '', '');
INSERT INTO `authentication_flow` VALUES ('1b57f63e-2690-4af1-bff2-5d77da349f12', 'forms', 'Username, password, otp and other auth forms.', 'master', 'basic-flow', '\0', '');
INSERT INTO `authentication_flow` VALUES ('1dda46c0-589b-4ba9-a777-7d7a9686f59a', 'direct grant', 'OpenID Connect Resource Owner Grant', 'master', 'basic-flow', '', '');
INSERT INTO `authentication_flow` VALUES ('269be818-9322-4933-af6e-6fee1bc8e38a', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'master', 'basic-flow', '', '');
INSERT INTO `authentication_flow` VALUES ('3411faab-d5a9-40c2-a6b9-76c1d15bdaed', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'fast', 'basic-flow', '\0', '');
INSERT INTO `authentication_flow` VALUES ('344cc350-204c-4fe4-8319-65da9a9394cd', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'master', 'basic-flow', '\0', '');
INSERT INTO `authentication_flow` VALUES ('3ac80cd8-8e64-4acf-9744-e22d2553a3a5', 'registration', 'registration flow', 'fast', 'basic-flow', '', '');
INSERT INTO `authentication_flow` VALUES ('58459abf-baa9-4766-8d44-ddb502e32ebe', 'registration form', 'registration form', 'fast', 'form-flow', '\0', '');
INSERT INTO `authentication_flow` VALUES ('6404036d-670f-46be-b48f-f2cf7b3a438f', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'fast', 'basic-flow', '', '');
INSERT INTO `authentication_flow` VALUES ('659ba0fb-9540-4b10-aa2a-91c5d577dcc5', 'registration form', 'registration form', 'master', 'form-flow', '\0', '');
INSERT INTO `authentication_flow` VALUES ('6b8a674a-2e15-4ea7-b8d6-0558b7139a89', 'browser', 'browser based authentication', 'fast', 'basic-flow', '', '');
INSERT INTO `authentication_flow` VALUES ('6d200864-592a-4d15-a328-fad38b924bfb', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'master', 'basic-flow', '', '');
INSERT INTO `authentication_flow` VALUES ('70e0596b-b930-4b81-bae2-10d87fc545c3', 'forms', 'Username, password, otp and other auth forms.', 'fast', 'basic-flow', '\0', '');
INSERT INTO `authentication_flow` VALUES ('7b361013-7625-40d0-b7dd-6c41a0a0b14e', 'registration', 'registration flow', 'master', 'basic-flow', '', '');
INSERT INTO `authentication_flow` VALUES ('806079a2-0fc5-4253-8c2c-9f0abb1ecd5a', 'direct grant', 'OpenID Connect Resource Owner Grant', 'fast', 'basic-flow', '', '');
INSERT INTO `authentication_flow` VALUES ('8840ef4c-bd2a-44e9-a832-0cca974c7dda', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'fast', 'basic-flow', '', '');
INSERT INTO `authentication_flow` VALUES ('887545f8-328f-4af4-a554-8d665ec53c45', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'master', 'basic-flow', '', '');
INSERT INTO `authentication_flow` VALUES ('b060f08f-4457-4ac7-86f6-8954078cf762', 'clients', 'Base authentication for clients', 'master', 'client-flow', '', '');
INSERT INTO `authentication_flow` VALUES ('b2df4f6a-5c17-4310-99c4-039bd683761b', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'master', 'basic-flow', '\0', '');
INSERT INTO `authentication_flow` VALUES ('cbe32cec-36cb-44c5-9c3e-5fced09dd179', 'clients', 'Base authentication for clients', 'fast', 'client-flow', '', '');
INSERT INTO `authentication_flow` VALUES ('cc2de003-1dca-40b9-8675-f7bf5710a009', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'fast', 'basic-flow', '', '');
INSERT INTO `authentication_flow` VALUES ('cff4d085-1a12-4723-9968-497353eecf15', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'fast', 'basic-flow', '', '');
INSERT INTO `authentication_flow` VALUES ('d8c17159-e810-4ea8-8691-825be4d91213', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'master', 'basic-flow', '', '');
INSERT INTO `authentication_flow` VALUES ('ebab75b8-cd7a-491b-bd50-7cba07d4bef9', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'fast', 'basic-flow', '\0', '');

-- ----------------------------
-- Table structure for authenticator_config
-- ----------------------------
DROP TABLE IF EXISTS `authenticator_config`;
CREATE TABLE `authenticator_config` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`) USING BTREE,
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of authenticator_config
-- ----------------------------
INSERT INTO `authenticator_config` VALUES ('1bde0102-e468-4623-a569-a94eee570510', 'review profile config', 'fast');
INSERT INTO `authenticator_config` VALUES ('81f152be-b552-4c79-8e83-c68ca2a3228e', 'review profile config', 'master');
INSERT INTO `authenticator_config` VALUES ('8a9f934e-185c-443e-89a1-88d09140684c', 'create unique user config', 'fast');
INSERT INTO `authenticator_config` VALUES ('9494484e-b7d4-45db-a3d6-9245ce1ed6f9', 'create unique user config', 'master');

-- ----------------------------
-- Table structure for authenticator_config_entry
-- ----------------------------
DROP TABLE IF EXISTS `authenticator_config_entry`;
CREATE TABLE `authenticator_config_entry` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of authenticator_config_entry
-- ----------------------------
INSERT INTO `authenticator_config_entry` VALUES ('1bde0102-e468-4623-a569-a94eee570510', 'missing', 'update.profile.on.first.login');
INSERT INTO `authenticator_config_entry` VALUES ('81f152be-b552-4c79-8e83-c68ca2a3228e', 'missing', 'update.profile.on.first.login');
INSERT INTO `authenticator_config_entry` VALUES ('8a9f934e-185c-443e-89a1-88d09140684c', 'false', 'require.password.update.after.registration');
INSERT INTO `authenticator_config_entry` VALUES ('9494484e-b7d4-45db-a3d6-9245ce1ed6f9', 'false', 'require.password.update.after.registration');

-- ----------------------------
-- Table structure for broker_link
-- ----------------------------
DROP TABLE IF EXISTS `broker_link`;
CREATE TABLE `broker_link` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of broker_link
-- ----------------------------

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int(11) DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_TEMPLATE_ID` varchar(36) DEFAULT NULL,
  `USE_TEMPLATE_CONFIG` bit(1) NOT NULL DEFAULT b'0',
  `USE_TEMPLATE_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  `USE_TEMPLATE_MAPPERS` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`) USING BTREE,
  KEY `IDX_CLIENT_CLIENT_TEMPL_ID` (`CLIENT_TEMPLATE_ID`) USING BTREE,
  CONSTRAINT `FK_CLI_TMPLT_CLIENT` FOREIGN KEY (`CLIENT_TEMPLATE_ID`) REFERENCES `client_template` (`ID`),
  CONSTRAINT `FK_P56CTINXXB9GSK57FO49F9TAC` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('03bff8cd-1776-4ffb-9c2d-3e8d4dd2713f', '', '\0', 'account', '0', '\0', '8a351dd6-a3ba-4970-965a-0d8c4a65e259', '/auth/realms/fast/account', '\0', null, '\0', 'fast', 'openid-connect', '0', '\0', '\0', '${client_account}', '\0', 'client-secret', null, null, null, '', '\0', '\0', null, '\0', '\0', '\0');
INSERT INTO `client` VALUES ('0c0a8bdb-7b30-4c61-9328-18a4435e782a', '', '\0', 'security-admin-console', '0', '', '612cf4d7-42bf-4e48-92ae-9ab4389dc459', '/auth/admin/master/console/index.html', '\0', null, '\0', 'master', 'openid-connect', '0', '\0', '\0', '${client_security-admin-console}', '\0', 'client-secret', '', null, null, '', '\0', '\0', null, '\0', '\0', '\0');
INSERT INTO `client` VALUES ('33958903-5b08-4a0e-b27d-2a046631ddae', '', '\0', 'account', '0', '\0', '789f0d2e-438e-43bb-a509-95ed7c629370', '/auth/realms/master/account', '\0', null, '\0', 'master', 'openid-connect', '0', '\0', '\0', '${client_account}', '\0', 'client-secret', null, null, null, '', '\0', '\0', null, '\0', '\0', '\0');
INSERT INTO `client` VALUES ('3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', '', '\0', 'realm-management', '0', '\0', '6b522241-15cc-4f6c-860e-23df964b573d', null, '', null, '\0', 'fast', 'openid-connect', '0', '\0', '\0', '${client_realm-management}', '\0', 'client-secret', null, null, null, '', '\0', '\0', null, '\0', '\0', '\0');
INSERT INTO `client` VALUES ('8d79b1b4-ef33-4aab-9050-07fdc4d05c7a', '', '\0', 'security-admin-console', '0', '', '48c8e2fd-9f63-491d-86ba-1190de50d179', '/auth/admin/fast/console/index.html', '\0', null, '\0', 'fast', 'openid-connect', '0', '\0', '\0', '${client_security-admin-console}', '\0', 'client-secret', null, null, null, '', '\0', '\0', null, '\0', '\0', '\0');
INSERT INTO `client` VALUES ('98d018b0-db18-4f60-9f6d-62e299fdb6de', '', '\0', 'broker', '0', '\0', '7bdb8d06-8eab-4490-920a-e771317030b1', null, '\0', null, '\0', 'fast', 'openid-connect', '0', '\0', '\0', '${client_broker}', '\0', 'client-secret', null, null, null, '', '\0', '\0', null, '\0', '\0', '\0');
INSERT INTO `client` VALUES ('a88c73bb-b26d-469a-ba62-974607334ee3', '', '', 'fast-realm', '0', '\0', '6826d019-8685-4a48-b812-c99b354ae996', null, '', null, '\0', 'master', null, '0', '\0', '\0', 'fast Realm', '\0', 'client-secret', null, null, null, '', '\0', '\0', null, '\0', '\0', '\0');
INSERT INTO `client` VALUES ('b3c0ea5f-1829-4e3c-90ff-70d7c4fda34a', '', '\0', 'admin-cli', '0', '', '5ad5081b-1514-4d38-bdce-739c01a561a4', null, '\0', null, '\0', 'master', 'openid-connect', '0', '\0', '\0', '${client_admin-cli}', '\0', 'client-secret', null, null, null, '\0', '\0', '', null, '\0', '\0', '\0');
INSERT INTO `client` VALUES ('bbfee872-0023-4535-98d0-bb2a81b650a8', '', '\0', 'broker', '0', '\0', '53f616a9-9355-4549-831a-f76a69982487', null, '\0', null, '\0', 'master', 'openid-connect', '0', '\0', '\0', '${client_broker}', '\0', 'client-secret', null, null, null, '', '\0', '\0', null, '\0', '\0', '\0');
INSERT INTO `client` VALUES ('c60de944-62eb-4773-b1f4-550be57b3f25', '', '', 'admin-client', '0', '\0', '3b8ac077-e9fc-4f59-a984-67a9526961ba', null, '\0', '', '\0', 'fast', 'openid-connect', '-1', '\0', '\0', null, '', 'client-secret', '', null, null, '', '\0', '', null, '\0', '\0', '\0');
INSERT INTO `client` VALUES ('eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', '', '', 'user-client', '0', '\0', 'b1f34b10-dea8-42f0-a5a0-b46a708f75d9', null, '\0', '', '\0', 'fast', 'openid-connect', '-1', '\0', '\0', null, '', 'client-secret', '', null, null, '', '\0', '', null, '\0', '\0', '\0');
INSERT INTO `client` VALUES ('eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', '', '', 'master-realm', '0', '\0', '5aff0ab9-00a0-4530-b0e1-23cfa5308ef4', null, '', null, '\0', 'master', null, '0', '\0', '\0', 'master Realm', '\0', 'client-secret', null, null, null, '', '\0', '\0', null, '\0', '\0', '\0');
INSERT INTO `client` VALUES ('f966b688-394d-41de-a79b-fa8ed800587d', '', '\0', 'admin-cli', '0', '', 'f7b21dc9-b801-447c-a6bf-83e278875281', null, '\0', null, '\0', 'fast', 'openid-connect', '0', '\0', '\0', '${client_admin-cli}', '\0', 'client-secret', null, null, null, '\0', '\0', '', null, '\0', '\0', '\0');

-- ----------------------------
-- Table structure for client_attributes
-- ----------------------------
DROP TABLE IF EXISTS `client_attributes`;
CREATE TABLE `client_attributes` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`) USING BTREE,
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of client_attributes
-- ----------------------------
INSERT INTO `client_attributes` VALUES ('0c0a8bdb-7b30-4c61-9328-18a4435e782a', 'false', 'saml.assertion.signature');
INSERT INTO `client_attributes` VALUES ('0c0a8bdb-7b30-4c61-9328-18a4435e782a', 'false', 'saml.authnstatement');
INSERT INTO `client_attributes` VALUES ('0c0a8bdb-7b30-4c61-9328-18a4435e782a', 'false', 'saml.client.signature');
INSERT INTO `client_attributes` VALUES ('0c0a8bdb-7b30-4c61-9328-18a4435e782a', 'false', 'saml.encrypt');
INSERT INTO `client_attributes` VALUES ('0c0a8bdb-7b30-4c61-9328-18a4435e782a', 'false', 'saml.force.post.binding');
INSERT INTO `client_attributes` VALUES ('0c0a8bdb-7b30-4c61-9328-18a4435e782a', 'false', 'saml.multivalued.roles');
INSERT INTO `client_attributes` VALUES ('0c0a8bdb-7b30-4c61-9328-18a4435e782a', 'false', 'saml.onetimeuse.condition');
INSERT INTO `client_attributes` VALUES ('0c0a8bdb-7b30-4c61-9328-18a4435e782a', 'false', 'saml.server.signature');
INSERT INTO `client_attributes` VALUES ('0c0a8bdb-7b30-4c61-9328-18a4435e782a', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO `client_attributes` VALUES ('0c0a8bdb-7b30-4c61-9328-18a4435e782a', 'false', 'saml_force_name_id_format');
INSERT INTO `client_attributes` VALUES ('33958903-5b08-4a0e-b27d-2a046631ddae', 'false', 'saml.assertion.signature');
INSERT INTO `client_attributes` VALUES ('33958903-5b08-4a0e-b27d-2a046631ddae', 'false', 'saml.authnstatement');
INSERT INTO `client_attributes` VALUES ('33958903-5b08-4a0e-b27d-2a046631ddae', 'false', 'saml.client.signature');
INSERT INTO `client_attributes` VALUES ('33958903-5b08-4a0e-b27d-2a046631ddae', 'false', 'saml.encrypt');
INSERT INTO `client_attributes` VALUES ('33958903-5b08-4a0e-b27d-2a046631ddae', 'false', 'saml.force.post.binding');
INSERT INTO `client_attributes` VALUES ('33958903-5b08-4a0e-b27d-2a046631ddae', 'false', 'saml.multivalued.roles');
INSERT INTO `client_attributes` VALUES ('33958903-5b08-4a0e-b27d-2a046631ddae', 'false', 'saml.onetimeuse.condition');
INSERT INTO `client_attributes` VALUES ('33958903-5b08-4a0e-b27d-2a046631ddae', 'false', 'saml.server.signature');
INSERT INTO `client_attributes` VALUES ('33958903-5b08-4a0e-b27d-2a046631ddae', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO `client_attributes` VALUES ('33958903-5b08-4a0e-b27d-2a046631ddae', 'false', 'saml_force_name_id_format');
INSERT INTO `client_attributes` VALUES ('c60de944-62eb-4773-b1f4-550be57b3f25', 'false', 'saml.assertion.signature');
INSERT INTO `client_attributes` VALUES ('c60de944-62eb-4773-b1f4-550be57b3f25', 'false', 'saml.authnstatement');
INSERT INTO `client_attributes` VALUES ('c60de944-62eb-4773-b1f4-550be57b3f25', 'false', 'saml.client.signature');
INSERT INTO `client_attributes` VALUES ('c60de944-62eb-4773-b1f4-550be57b3f25', 'false', 'saml.encrypt');
INSERT INTO `client_attributes` VALUES ('c60de944-62eb-4773-b1f4-550be57b3f25', 'false', 'saml.force.post.binding');
INSERT INTO `client_attributes` VALUES ('c60de944-62eb-4773-b1f4-550be57b3f25', 'false', 'saml.multivalued.roles');
INSERT INTO `client_attributes` VALUES ('c60de944-62eb-4773-b1f4-550be57b3f25', 'false', 'saml.onetimeuse.condition');
INSERT INTO `client_attributes` VALUES ('c60de944-62eb-4773-b1f4-550be57b3f25', 'false', 'saml.server.signature');
INSERT INTO `client_attributes` VALUES ('c60de944-62eb-4773-b1f4-550be57b3f25', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO `client_attributes` VALUES ('c60de944-62eb-4773-b1f4-550be57b3f25', 'false', 'saml_force_name_id_format');
INSERT INTO `client_attributes` VALUES ('eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', 'false', 'saml.assertion.signature');
INSERT INTO `client_attributes` VALUES ('eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', 'false', 'saml.authnstatement');
INSERT INTO `client_attributes` VALUES ('eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', 'false', 'saml.client.signature');
INSERT INTO `client_attributes` VALUES ('eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', 'false', 'saml.encrypt');
INSERT INTO `client_attributes` VALUES ('eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', 'false', 'saml.force.post.binding');
INSERT INTO `client_attributes` VALUES ('eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', 'false', 'saml.multivalued.roles');
INSERT INTO `client_attributes` VALUES ('eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', 'false', 'saml.onetimeuse.condition');
INSERT INTO `client_attributes` VALUES ('eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', 'false', 'saml.server.signature');
INSERT INTO `client_attributes` VALUES ('eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO `client_attributes` VALUES ('eecfbdc8-69b7-40f3-9beb-d9d5ac09d6c5', 'false', 'saml_force_name_id_format');

-- ----------------------------
-- Table structure for client_default_roles
-- ----------------------------
DROP TABLE IF EXISTS `client_default_roles`;
CREATE TABLE `client_default_roles` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  UNIQUE KEY `UK_8AELWNIBJI49AVXSRTUF6XJOW` (`ROLE_ID`) USING BTREE,
  KEY `IDX_CLIENT_DEF_ROLES_CLIENT` (`CLIENT_ID`) USING BTREE,
  CONSTRAINT `FK_8AELWNIBJI49AVXSRTUF6XJOW` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`),
  CONSTRAINT `FK_NUILTS7KLWQW2H8M2B5JOYTKY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of client_default_roles
-- ----------------------------
INSERT INTO `client_default_roles` VALUES ('1', '03bff8cd-1776-4ffb-9c2d-3e8d4dd2713f', 'ae9c9ff9-23bb-427e-99c6-92832b5b80f9');
INSERT INTO `client_default_roles` VALUES ('2', '03bff8cd-1776-4ffb-9c2d-3e8d4dd2713f', 'b565b89d-0b40-4400-8cde-5af890c44786');
INSERT INTO `client_default_roles` VALUES ('3', '33958903-5b08-4a0e-b27d-2a046631ddae', '217e51e7-2599-4ab1-8836-3af33fe2d866');
INSERT INTO `client_default_roles` VALUES ('4', '33958903-5b08-4a0e-b27d-2a046631ddae', 'b471d3dd-d641-481c-9d8a-9f84237b8965');

-- ----------------------------
-- Table structure for client_identity_prov_mapping
-- ----------------------------
DROP TABLE IF EXISTS `client_identity_prov_mapping`;
CREATE TABLE `client_identity_prov_mapping` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` varchar(36) NOT NULL,
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `RETRIEVE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`oid`) USING BTREE,
  UNIQUE KEY `UK_7CAELWNIBJI49AVXSRTUF6XJ12` (`IDENTITY_PROVIDER_ID`,`CLIENT_ID`) USING BTREE,
  KEY `IDX_CLIENT_ID_PROV_MAP_CLIENT` (`CLIENT_ID`) USING BTREE,
  CONSTRAINT `FK_56ELWNIBJI49AVXSRTUF6XJ23` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_7CELWNIBJI49AVXSRTUF6XJ12` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `identity_provider` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of client_identity_prov_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for client_initial_access
-- ----------------------------
DROP TABLE IF EXISTS `client_initial_access`;
CREATE TABLE `client_initial_access` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `EXPIRATION` int(11) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  `REMAINING_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`) USING BTREE,
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of client_initial_access
-- ----------------------------

-- ----------------------------
-- Table structure for client_node_registrations
-- ----------------------------
DROP TABLE IF EXISTS `client_node_registrations`;
CREATE TABLE `client_node_registrations` (
  `CLIENT_ID` varchar(36) NOT NULL DEFAULT '',
  `VALUE` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`) USING BTREE,
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of client_node_registrations
-- ----------------------------

-- ----------------------------
-- Table structure for client_session
-- ----------------------------
DROP TABLE IF EXISTS `client_session`;
CREATE TABLE `client_session` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`) USING BTREE,
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `user_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of client_session
-- ----------------------------

-- ----------------------------
-- Table structure for client_session_auth_status
-- ----------------------------
DROP TABLE IF EXISTS `client_session_auth_status`;
CREATE TABLE `client_session_auth_status` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`) USING BTREE,
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of client_session_auth_status
-- ----------------------------

-- ----------------------------
-- Table structure for client_session_note
-- ----------------------------
DROP TABLE IF EXISTS `client_session_note`;
CREATE TABLE `client_session_note` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`) USING BTREE,
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of client_session_note
-- ----------------------------

-- ----------------------------
-- Table structure for client_session_prot_mapper
-- ----------------------------
DROP TABLE IF EXISTS `client_session_prot_mapper`;
CREATE TABLE `client_session_prot_mapper` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`) USING BTREE,
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of client_session_prot_mapper
-- ----------------------------

-- ----------------------------
-- Table structure for client_session_role
-- ----------------------------
DROP TABLE IF EXISTS `client_session_role`;
CREATE TABLE `client_session_role` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`) USING BTREE,
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of client_session_role
-- ----------------------------

-- ----------------------------
-- Table structure for client_template
-- ----------------------------
DROP TABLE IF EXISTS `client_template`;
CREATE TABLE `client_template` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `UK_CLI_TEMPLATE` (`REALM_ID`,`NAME`) USING BTREE,
  CONSTRAINT `FK_REALM_CLI_TMPLT` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of client_template
-- ----------------------------

-- ----------------------------
-- Table structure for client_template_attributes
-- ----------------------------
DROP TABLE IF EXISTS `client_template_attributes`;
CREATE TABLE `client_template_attributes` (
  `TEMPLATE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`TEMPLATE_ID`,`NAME`) USING BTREE,
  CONSTRAINT `FK_CL_TEMPL_ATTR_TEMPL` FOREIGN KEY (`TEMPLATE_ID`) REFERENCES `client_template` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of client_template_attributes
-- ----------------------------

-- ----------------------------
-- Table structure for client_user_session_note
-- ----------------------------
DROP TABLE IF EXISTS `client_user_session_note`;
CREATE TABLE `client_user_session_note` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`) USING BTREE,
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of client_user_session_note
-- ----------------------------

-- ----------------------------
-- Table structure for component
-- ----------------------------
DROP TABLE IF EXISTS `component`;
CREATE TABLE `component` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`) USING BTREE,
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of component
-- ----------------------------
INSERT INTO `component` VALUES ('0409e351-5c9e-413b-b9e1-df3cbc996df4', 'rsa-generated', 'fast', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'fast', null);
INSERT INTO `component` VALUES ('13d8d3d5-f4d5-4af3-8cb8-e04c52a4598c', 'rsa-generated', 'master', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'master', null);
INSERT INTO `component` VALUES ('15ba8d59-ae91-4aad-96da-31f26dacce11', 'Allowed Client Templates', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO `component` VALUES ('41c9769e-803f-4298-a163-fd9fde39411e', 'Trusted Hosts', 'master', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO `component` VALUES ('4aa971fe-fd90-41d1-bd2d-86e2a97b0a52', 'Trusted Hosts', 'fast', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'fast', 'anonymous');
INSERT INTO `component` VALUES ('4d770a37-b961-49b5-802c-3ed696fb3449', 'Allowed Protocol Mapper Types', 'fast', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'fast', 'authenticated');
INSERT INTO `component` VALUES ('564f3e90-2231-4999-ba67-4df61cf2733f', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO `component` VALUES ('622f4fdb-a6fc-43c4-93c2-03e00e6ee831', 'Max Clients Limit', 'fast', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'fast', 'anonymous');
INSERT INTO `component` VALUES ('8cf2883d-6ee5-4fb1-b218-7b89fc9641fd', 'Full Scope Disabled', 'fast', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'fast', 'anonymous');
INSERT INTO `component` VALUES ('a037866d-be52-4b81-9c8d-967d60c42633', 'Allowed Client Templates', 'fast', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'fast', 'anonymous');
INSERT INTO `component` VALUES ('ad81c92c-7ab1-45a3-8803-e9b2047fc7a4', 'hmac-generated', 'fast', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'fast', null);
INSERT INTO `component` VALUES ('ae630da0-5042-4baf-82ed-b2ed75ca69b8', 'Consent Required', 'fast', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'fast', 'anonymous');
INSERT INTO `component` VALUES ('ae9c5d18-878d-4f13-ba73-2f52b2a4defe', 'hmac-generated', 'master', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'master', null);
INSERT INTO `component` VALUES ('ba18664a-2480-42e9-979a-3906c8845f4b', 'Full Scope Disabled', 'master', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO `component` VALUES ('c05f0d3b-54f2-4f3b-bbd2-753dd78d69f0', 'Allowed Client Templates', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO `component` VALUES ('d1a7b61d-5c65-4614-9c23-543a25cfe44c', 'Max Clients Limit', 'master', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO `component` VALUES ('d2ae36d5-88ac-4a1a-bc67-c7e7c283c7b9', 'Consent Required', 'master', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO `component` VALUES ('e688df0a-abb9-44e0-af22-3f4d3c829898', 'Allowed Protocol Mapper Types', 'fast', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'fast', 'anonymous');
INSERT INTO `component` VALUES ('eb60b8c9-5b52-4028-ab7f-445fa1dc3bc6', 'aes-generated', 'master', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'master', null);
INSERT INTO `component` VALUES ('f44c8378-485a-4e27-9bc2-f06178bc5ca6', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO `component` VALUES ('fb5e93fa-7f29-4abf-82fb-b1af3e613186', 'aes-generated', 'fast', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'fast', null);
INSERT INTO `component` VALUES ('fdbac6ae-e649-4f5b-9ece-a7c3bf083430', 'Allowed Client Templates', 'fast', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'fast', 'authenticated');

-- ----------------------------
-- Table structure for component_config
-- ----------------------------
DROP TABLE IF EXISTS `component_config`;
CREATE TABLE `component_config` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`) USING BTREE,
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `component` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of component_config
-- ----------------------------
INSERT INTO `component_config` VALUES ('04cbade4-f2af-4314-8c98-58d74f65bbe9', 'd1a7b61d-5c65-4614-9c23-543a25cfe44c', 'max-clients', '200');
INSERT INTO `component_config` VALUES ('093e2816-9b7d-4e14-a1b0-80da996baa2e', '4d770a37-b961-49b5-802c-3ed696fb3449', 'consent-required-for-all-mappers', 'true');
INSERT INTO `component_config` VALUES ('0bb39edd-cc07-41c6-a486-19e66b3d502d', 'fb5e93fa-7f29-4abf-82fb-b1af3e613186', 'priority', '100');
INSERT INTO `component_config` VALUES ('0cff03cc-0e69-4aaa-92a5-b0f9e62bd154', '564f3e90-2231-4999-ba67-4df61cf2733f', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO `component_config` VALUES ('0fd3e58b-165d-4258-ad2a-c66aa863fca5', '564f3e90-2231-4999-ba67-4df61cf2733f', 'consent-required-for-all-mappers', 'true');
INSERT INTO `component_config` VALUES ('1012cd45-2da3-4608-b8d0-509bdca187ee', '4aa971fe-fd90-41d1-bd2d-86e2a97b0a52', 'client-uris-must-match', 'true');
INSERT INTO `component_config` VALUES ('1abc4bf5-4a76-4ae6-af71-24b9cfbec665', '41c9769e-803f-4298-a163-fd9fde39411e', 'client-uris-must-match', 'true');
INSERT INTO `component_config` VALUES ('1cd8c8e4-242a-4c8d-ab44-5cb0ffbeed55', '622f4fdb-a6fc-43c4-93c2-03e00e6ee831', 'max-clients', '200');
INSERT INTO `component_config` VALUES ('1f6414fd-89fc-4cb3-b28a-45c7fb1b1923', '564f3e90-2231-4999-ba67-4df61cf2733f', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO `component_config` VALUES ('20df4d3e-23d5-4c8e-b1cd-d2fb6f052ed7', '4d770a37-b961-49b5-802c-3ed696fb3449', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO `component_config` VALUES ('23ff5973-4f14-425f-8fae-ecda4ba2ea92', '564f3e90-2231-4999-ba67-4df61cf2733f', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO `component_config` VALUES ('2f899772-f4a4-4894-8a28-4db39f7c9b8f', 'ae9c5d18-878d-4f13-ba73-2f52b2a4defe', 'priority', '100');
INSERT INTO `component_config` VALUES ('31499093-e744-4ea0-bca0-a988c84bd491', 'f44c8378-485a-4e27-9bc2-f06178bc5ca6', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO `component_config` VALUES ('35ce9ca8-2a49-480f-8760-005265fda32c', '0409e351-5c9e-413b-b9e1-df3cbc996df4', 'priority', '100');
INSERT INTO `component_config` VALUES ('35e00426-5437-4ab3-bbcc-3d2b3907c4ee', '564f3e90-2231-4999-ba67-4df61cf2733f', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO `component_config` VALUES ('3c574b40-e056-4669-8d9e-7505927e71d9', 'e688df0a-abb9-44e0-af22-3f4d3c829898', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO `component_config` VALUES ('3eeb0203-3f93-4b54-90eb-e147ebae3f8c', '13d8d3d5-f4d5-4af3-8cb8-e04c52a4598c', 'certificate', 'MIICmzCCAYMCBgFjbgTdazANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMTgwNTE3MTIxMTQyWhcNMjgwNTE3MTIxMzIyWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCX0H8ZHHyZy0haQLy3BJBIb6oo/lorpmdqm5eKTSIa89BaqxEO3zig3qLmJACIknv5+fREIYQ1ejhZfJO1rSiNcC7H8Dxkw77xb6oJdfAPAvUcgPPJryn2kQVu3UM5H7gzqWIM5Ej7x+KzsXrtYVyJSsDbhCF2LyymYqtHazVc9ax6BLUSi0YK4BMwi5UvZfl5KNHC3tk8oggDQVL57lXHjUdkoi0EpwkCgWSpacq6QBoeqqUlxoK26tm31VE9YyTcWsZ/RkPmu/+gOQCFlP9bX0DI/gs8VzANtF0Bi3U5sjU3XTR20c1Fd7QcgYdwnM//SeloHA2v/+kfkNIdQa0ZAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFuXM9AYMt+oq1YKdp3mumhI+OL/1/v/4E/sW54IXIcFyIEZfuv3F8hGUeWMZwmBm/fODMhGy8i2E33iHv+kPMIMBfodSpG2E2QpMuVY6qp7o1o9uZWE7lI/Nw1Zt87U8VjglfNGBevMDjSP+nVYrL4NV19iTTOXv1uvN6ufupIEoL38V3YAWmcAdRAg3hy0Z+GNCjqzfwa61QbgELX0VOH8yFBJ9AuV/ykedrwjknZ/qRmTqpzk/QSBiqTwhAed0AFgoNOQ3PuG0FpQCpJ0uOWAjKC3iQxMnb9DHg9n1Wkpgb+Ji/+eLhfKLiLP5WBY9EK3SGydqVov8OpsoSZ29XI=');
INSERT INTO `component_config` VALUES ('43e24172-3dfb-442b-82ed-75ac05c679a2', 'fb5e93fa-7f29-4abf-82fb-b1af3e613186', 'secret', 'zgpK5Sa4K8N7Pkql11tHCA');
INSERT INTO `component_config` VALUES ('455de97e-eeb8-4221-bb7a-4fafa3b1ba8f', 'f44c8378-485a-4e27-9bc2-f06178bc5ca6', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO `component_config` VALUES ('45e0ce7c-514b-4c9c-b495-3c3be9cacea2', 'ae9c5d18-878d-4f13-ba73-2f52b2a4defe', 'secret', 'T-kkYvSvwnphD2k85FNn_AfWQYS6zZPFczM4hYQZwjY');
INSERT INTO `component_config` VALUES ('4da61ed9-0529-4b2d-a736-4ce38871b1e6', 'e688df0a-abb9-44e0-af22-3f4d3c829898', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO `component_config` VALUES ('4f567a5f-3073-494f-8ad5-85d201ea39fa', 'eb60b8c9-5b52-4028-ab7f-445fa1dc3bc6', 'secret', 'XxBN29qRaR0YnL4g4FWlfg');
INSERT INTO `component_config` VALUES ('539fc611-f504-4f7b-9f84-44f15161d542', '4d770a37-b961-49b5-802c-3ed696fb3449', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO `component_config` VALUES ('55865815-3ad7-42eb-ad96-503ab51b02ce', 'f44c8378-485a-4e27-9bc2-f06178bc5ca6', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO `component_config` VALUES ('58f1ae44-92e4-4380-a538-a9d0893055c7', '4aa971fe-fd90-41d1-bd2d-86e2a97b0a52', 'host-sending-registration-request-must-match', 'true');
INSERT INTO `component_config` VALUES ('62dfdc7c-d06c-40d4-a5fe-1f53c5efab7b', '0409e351-5c9e-413b-b9e1-df3cbc996df4', 'privateKey', 'MIIEowIBAAKCAQEAtT5CpVHmtjaR9zM+DmXczNlvyZUbiV5wfJxPrWPetUNouppj6FtqCGbyGhHollLoZh1orblUKYR+NWmHTGwfG4a0WUg1T6TnMYW+j/XCOyT9fRJUAr6PF9Gk81QXlhBfEoSn1jvctv7dR3kp27xxB221pBMUMfF6P9IWfByZTqDWKANWb/Oi19V7RgHBnGUsBkxKRh8TwNc9ulkrd9b7kcEnd98kLHkb5FsR5K2XStxy/VLIo6jT28WpUZXXFlSbu/H4LlyFhKOLJBstZyivMp+Okn6s1YPXcYat6O4ZPFtzCZ58sfxtYnhcMFthR8NHAwAWTj/WzUx886GNpadIPwIDAQABAoIBAQCpGvpb/drh0HDI0UrpbClkCMzArRsQRMl3uvCsuy4kukyRL1RgjEqWpFbn9CWrfJfSD0aIMQ9R3YlUlK3kpE0yBbFoTHNRaG8+SafP8mHThWPuupcgKGSiuLzLPH71STkrshJXVWtOYuZbtbVUjLJ5V+fOuu5w2vpRadgI3TY9oUa/+q5rP9TYkz94jw00FNXNUPpBAepPA5Rteoers03rZu5YQM9o6p5mYTomIHAl7UyupGaVZ3icqixNeqs7ArwWNMxSNCMpLE1AqLOqr7nhvV8XXIZO8NyXC2d0jxHY3dsdoXpDO/rXhlpWZeGWeJ9VUwoRcIIs9M/vUDPRUQEhAoGBAPNDSj2x+xydCn8ziRTn9Nl89ge7nfBg/ku/vbAKyZQm5OG0dxc/O4w1FO7p/f406wAKunuStkK4RFcGADD7hq/COYHhXL2PFjs2w5qvUDb1jvCRu0IOK5rJg2PL5SJTbEVflpXiv1+v2c1HYrpSygaxP1YR/hrTH5ITA6y4v/ttAoGBAL67p7zMC4Oh3Z9/6hKo4BQ7PM6y6ZZiQEFVwvcJmcOpRSnq7l+lX7FoTg4u34hyYF2DPppb/uI9gByXanlaB67yu9FJkHI/Ef/XrlWHpwP/I/BbpZoOPCwT8UbdY4BdCY3F6TB9dQcNMeJNodKpxhEv7qv0IvkYTmO3xaNK9rrbAoGAd1XtV7K2M2U+vwPzHZRk40SQFV8OrduHJHXdgjzogotKAQdc3MSiW7e2mzWi6k/fcNfSf8iLLNPkgqRo956MhjBLsdFyg3NsPoQxFPMn8K4p/w4exNravUZZ9F0T/PDbznSEFOd1ZmWH/VIltq3iecH+BiUxeMtVU32McfD4DUkCgYBWolYmY2g3eiZ4dFmV8C8YAXA1Uv7W1/nns1TDcRDu1swbpiJwP2Wf54jM2G2gRJOQ5jRhWLgFe3ndgslSJZqn1ImLHqcFvbAnTYhaQSuTnSht3LLzrtOWEdjeH2E6xQe55dNtuw6VDWFDMY/3aDYXSHZYlKPuESRKFwcmjL5VUQKBgGEqBlcW4WtXXUGgrWoEtf5EgSviWCzT1NZdZEwp6paCDFRJaHciQMpKKLvyz97WWoKNJbj3dOzVsRMM2IvlbAM+pK+NqBQZj03859KffBm/tb03pWOmj3KGCKAJuKLk+oZYeWFyb3qNGP1CvJZmI75G9kmeu/go0o/4kxCabb3i');
INSERT INTO `component_config` VALUES ('6598d1c8-c45f-4392-8fe5-9c6b60eb8a81', '564f3e90-2231-4999-ba67-4df61cf2733f', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO `component_config` VALUES ('693f2553-b906-4141-8004-c223d486d50d', 'ad81c92c-7ab1-45a3-8803-e9b2047fc7a4', 'priority', '100');
INSERT INTO `component_config` VALUES ('6d609f43-1306-421b-a130-749fee41f440', '4d770a37-b961-49b5-802c-3ed696fb3449', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO `component_config` VALUES ('72690261-6480-478d-9be8-e26e940b2a9f', '564f3e90-2231-4999-ba67-4df61cf2733f', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO `component_config` VALUES ('735a5d06-e9d5-4487-803c-064d1c099d8d', '4d770a37-b961-49b5-802c-3ed696fb3449', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO `component_config` VALUES ('73ce6509-27de-4f47-b8b3-3e2a2e80757c', 'f44c8378-485a-4e27-9bc2-f06178bc5ca6', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO `component_config` VALUES ('765f9cbf-53d8-48ae-9018-370e7d1d20f2', 'f44c8378-485a-4e27-9bc2-f06178bc5ca6', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO `component_config` VALUES ('7b011309-93a7-4ab5-9863-06bb7ab7bbbf', '13d8d3d5-f4d5-4af3-8cb8-e04c52a4598c', 'privateKey', 'MIIEogIBAAKCAQEAl9B/GRx8mctIWkC8twSQSG+qKP5aK6ZnapuXik0iGvPQWqsRDt84oN6i5iQAiJJ7+fn0RCGENXo4WXyTta0ojXAux/A8ZMO+8W+qCXXwDwL1HIDzya8p9pEFbt1DOR+4M6liDORI+8fis7F67WFciUrA24Qhdi8spmKrR2s1XPWsegS1EotGCuATMIuVL2X5eSjRwt7ZPKIIA0FS+e5Vx41HZKItBKcJAoFkqWnKukAaHqqlJcaCturZt9VRPWMk3FrGf0ZD5rv/oDkAhZT/W19AyP4LPFcwDbRdAYt1ObI1N100dtHNRXe0HIGHcJzP/0npaBwNr//pH5DSHUGtGQIDAQABAoIBADMrIfuLv29ytdM9qJ2jGyJfCKJCgI/fyVGEWcJSlyEwdlRo/hneIM8P2yXokol1nfW2Sp9AELiZli6LL5n3YAiz/ACFt0VbOJtVwKDpsFzO6WCPEhwzPtiNLqCcUREK4OIAwDyKIRND3uQj+MPTogXgPTp/wWt9IPZ/oS00NEs9OZ1R1ciAMP9s5JC5lMFapRoM7u3EjiRilH7HzRI6Olp+MD1tioW87KRzKlHr/d2X4Div0Nsi1CwY30LE1C84w273+j0Xr2c62bePO/E0WGwh4z55u+n7I5rxGf4SC7KLpLWqc6IOafHsomDbqcqXmesFkpSGebcclwRk13MWE5ECgYEA0ZuHNMCQe6zYy48kTwM0rVPEKA1HwJbU7MvZLBZLNIIlJUZGjy2Rf9B6gDPd79PEUYT/aEWR187LcbO70kByFe7hLfKKWWM70aFbYBIfhSk19/I5Bc8xWk2LPHKh0+cilUZTs5nzag7mLeBBwJWOR3+yWUPZ1LqHSNDpQMvQqBUCgYEAuWphsmf0Huq/yM+tsqOp80IfhTS4oCz77d/MbQFWbI9CnwjQyWnTLobOYoFdLNTHHgsAgcOkLZE/V7+gvu03HuaqzWuN43ToF3AMlN43xIZ7k7nXr/UOl10P+pDh5B4Ohs/dvO/OLIHEEARXS7/RI0e/jSaBoyh2HBsy694YzfUCgYBnTVpeUkUi3rXd5McFNdRBVBZJkvn43Z1EstZuVvJrh3SdITxnFhMuReYJxwYrS1fmwUBK+HZ/QIidmfIIFgDj9F4AEhfDJBf4Iajx+RyVuRDDCRq3VTzCf5MOkIRW9gPiQ82+pzIC5CLnGy3spwh/Dl0shzcVE3TXGzbJ22kTXQKBgBc8arPl7ST2vEQZKqZpdkHi9npGCiEgog3EbyT19vOx3GJ7w1aKaYm6ISEdHyUgITf1nwGkF+4R9sMzY5yps6+urpcBtI1duDw/sYPyeUCqrc/siUgmyMZVRkxbXcOttJpWcG5eCxNuy7hKIvp+NmJaenng6nwc9Pg+vFnswmUFAoGAAh1oILcNVNUZXjRAbKC4fC4XaSEtQR2QyXHkZwwuVK5qJmJj0T5THgJ3N7FUPq9HfHE98arHHRqlgXp07mjiMNKO7qzB49FzEbinu3jSBMzkONuwI1uyW1p7CCFXOzJgWs3W+aeBO2x2/TTXYQSFqpl970+aNNYTiNZqsAK7EKA=');
INSERT INTO `component_config` VALUES ('7ee8bb25-69c5-45b2-9797-969b383bf807', 'eb60b8c9-5b52-4028-ab7f-445fa1dc3bc6', 'kid', 'e1e0c09c-86d4-404a-a242-abb12f093fad');
INSERT INTO `component_config` VALUES ('81939b50-0594-4a8a-ac86-4460d052e8aa', 'e688df0a-abb9-44e0-af22-3f4d3c829898', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO `component_config` VALUES ('85b1b9b6-d3a1-44cf-a712-896013e25132', 'f44c8378-485a-4e27-9bc2-f06178bc5ca6', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO `component_config` VALUES ('9505159d-9b0e-4d6a-bf8e-9c53056ac94f', 'fb5e93fa-7f29-4abf-82fb-b1af3e613186', 'kid', '1e6c918b-b9c2-453b-a4af-566445ca9cea');
INSERT INTO `component_config` VALUES ('966eb63d-25d4-4e12-b66a-4e08111d76f0', 'f44c8378-485a-4e27-9bc2-f06178bc5ca6', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO `component_config` VALUES ('9eee85bf-f929-4ddc-8c3f-984e41ae7036', '4d770a37-b961-49b5-802c-3ed696fb3449', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO `component_config` VALUES ('a140612e-e788-4258-b33d-3844e716e586', '13d8d3d5-f4d5-4af3-8cb8-e04c52a4598c', 'priority', '100');
INSERT INTO `component_config` VALUES ('a1d001f5-5bed-4fab-8cbb-ac2d9ff2de5c', '0409e351-5c9e-413b-b9e1-df3cbc996df4', 'certificate', 'MIIClzCCAX8CBgFjbgWkojANBgkqhkiG9w0BAQsFADAPMQ0wCwYDVQQDDARmYXN0MB4XDTE4MDUxNzEyMTIzM1oXDTI4MDUxNzEyMTQxM1owDzENMAsGA1UEAwwEZmFzdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALU+QqVR5rY2kfczPg5l3MzZb8mVG4lecHycT61j3rVDaLqaY+hbaghm8hoR6JZS6GYdaK25VCmEfjVph0xsHxuGtFlINU+k5zGFvo/1wjsk/X0SVAK+jxfRpPNUF5YQXxKEp9Y73Lb+3Ud5Kdu8cQdttaQTFDHxej/SFnwcmU6g1igDVm/zotfVe0YBwZxlLAZMSkYfE8DXPbpZK3fW+5HBJ3ffJCx5G+RbEeStl0rccv1SyKOo09vFqVGV1xZUm7vx+C5chYSjiyQbLWcorzKfjpJ+rNWD13GGrejuGTxbcwmefLH8bWJ4XDBbYUfDRwMAFk4/1s1MfPOhjaWnSD8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAHU7PUs+yDUA6gb/6nkPUpmsx49ZIQK/64Bfoc9pf8NwEvpl5FntvEGhV2N6XC5ImktANWEd8eBsqJ8RPa1Ht/GKGbDpMlPJSEgV/l/n3X4Po++IvSg9Ea+QWhrkBBS3MrcznqiUPyC22Z5s5r/C1w0MW6nkWwuquBtKqnNLMaGkWYDhv79jQfWGsG/zaIgl8jyDmhHUU1817aOe0M0ZRcAfc7BcW1iF3aM9687dehPdDcQVcUqWKOcuwCdcjuS99UMpVxX0jjmcHcT9pcI9GjIUlbR3imDXmYPdKb7hTZaQ4HqnBZB67aeAom9tG2F54LEiEiv9AqkFw5diKMV68ow==');
INSERT INTO `component_config` VALUES ('a577cefa-04a4-4135-b6ef-24487a377a69', 'f44c8378-485a-4e27-9bc2-f06178bc5ca6', 'consent-required-for-all-mappers', 'true');
INSERT INTO `component_config` VALUES ('bb94fa42-43d9-454c-9150-fde71aa36932', 'e688df0a-abb9-44e0-af22-3f4d3c829898', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO `component_config` VALUES ('bedca038-ff2b-42e3-bc32-a56538918078', 'ad81c92c-7ab1-45a3-8803-e9b2047fc7a4', 'kid', 'a19a2388-28f8-4193-87fb-577ef072fe0e');
INSERT INTO `component_config` VALUES ('c128f983-028f-4364-9e0c-e0a9074a58d4', '564f3e90-2231-4999-ba67-4df61cf2733f', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO `component_config` VALUES ('c3c114cb-1021-48e1-9f30-e9575baa57b6', '4d770a37-b961-49b5-802c-3ed696fb3449', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO `component_config` VALUES ('c8a26984-bc3c-4809-8864-fccbdda0dd59', '41c9769e-803f-4298-a163-fd9fde39411e', 'host-sending-registration-request-must-match', 'true');
INSERT INTO `component_config` VALUES ('cc630496-f1f9-4de3-a15c-717116474470', 'e688df0a-abb9-44e0-af22-3f4d3c829898', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO `component_config` VALUES ('d3a20979-badb-4fc2-b219-15fe682ec886', 'e688df0a-abb9-44e0-af22-3f4d3c829898', 'consent-required-for-all-mappers', 'true');
INSERT INTO `component_config` VALUES ('df81dc16-f279-4726-9bfd-93fe51b8d662', 'ad81c92c-7ab1-45a3-8803-e9b2047fc7a4', 'secret', 'qT_vWvUfhTFxump22olAolBUZ46_rVsHtI124Sx04vI');
INSERT INTO `component_config` VALUES ('e20361ae-07d5-4348-aad0-a1fc0dcc199d', 'e688df0a-abb9-44e0-af22-3f4d3c829898', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO `component_config` VALUES ('e657e4a4-5a10-4415-8064-7c6770067b66', 'e688df0a-abb9-44e0-af22-3f4d3c829898', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO `component_config` VALUES ('e720f80b-786e-40de-88d3-320fe26c5b5c', 'ae9c5d18-878d-4f13-ba73-2f52b2a4defe', 'kid', '572e694f-e407-4ce9-918e-91e06ca4f823');
INSERT INTO `component_config` VALUES ('e92687fc-1986-45da-a9bc-f4484919e3f7', '564f3e90-2231-4999-ba67-4df61cf2733f', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO `component_config` VALUES ('f2f4d375-4839-4d38-9b68-7680c40f2f2e', '4d770a37-b961-49b5-802c-3ed696fb3449', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO `component_config` VALUES ('f66d0782-f4a1-4e40-bb45-65d663944b1b', 'eb60b8c9-5b52-4028-ab7f-445fa1dc3bc6', 'priority', '100');
INSERT INTO `component_config` VALUES ('f8dee8b5-0102-4b62-b58e-703ad82c4b20', 'f44c8378-485a-4e27-9bc2-f06178bc5ca6', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO `component_config` VALUES ('ff655832-063c-4cf5-abc7-0257d7d35500', '4d770a37-b961-49b5-802c-3ed696fb3449', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO `component_config` VALUES ('ff9a5095-1223-49db-ae38-c7f42c92a1a2', 'e688df0a-abb9-44e0-af22-3f4d3c829898', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');

-- ----------------------------
-- Table structure for composite_role
-- ----------------------------
DROP TABLE IF EXISTS `composite_role`;
CREATE TABLE `composite_role` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  KEY `IDX_COMPOSITE` (`COMPOSITE`) USING BTREE,
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`) USING BTREE,
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `keycloak_role` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `keycloak_role` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of composite_role
-- ----------------------------
INSERT INTO `composite_role` VALUES ('1', 'e538f394-cd81-4c77-84e8-53c7453c9656', '404cc232-11bc-40e1-91c0-f7ec99b87620');
INSERT INTO `composite_role` VALUES ('2', 'e538f394-cd81-4c77-84e8-53c7453c9656', '2d62eef8-0e88-4ecd-9342-ba4b63ce1c33');
INSERT INTO `composite_role` VALUES ('3', 'e538f394-cd81-4c77-84e8-53c7453c9656', '2010f6be-4d93-48c3-9d3a-9f5b0024b642');
INSERT INTO `composite_role` VALUES ('4', 'e538f394-cd81-4c77-84e8-53c7453c9656', 'c6a82644-6d6c-4863-99f1-d559f771a233');
INSERT INTO `composite_role` VALUES ('5', 'e538f394-cd81-4c77-84e8-53c7453c9656', '3c06e820-ee26-408c-a99c-0f9e53af65dd');
INSERT INTO `composite_role` VALUES ('6', 'e538f394-cd81-4c77-84e8-53c7453c9656', '1a1d2c21-b84d-42ec-997f-1eaa0054ff63');
INSERT INTO `composite_role` VALUES ('7', 'e538f394-cd81-4c77-84e8-53c7453c9656', '2ea3dadb-8c5f-4574-835b-06eb7b91f7a9');
INSERT INTO `composite_role` VALUES ('8', 'e538f394-cd81-4c77-84e8-53c7453c9656', 'f9393b3c-ae86-4837-afbe-8fdd7463933f');
INSERT INTO `composite_role` VALUES ('9', 'e538f394-cd81-4c77-84e8-53c7453c9656', 'c3426144-09c9-4b8e-8305-09a586e032bd');
INSERT INTO `composite_role` VALUES ('10', 'e538f394-cd81-4c77-84e8-53c7453c9656', 'a0b8c786-bb5b-42b9-9df5-9cef6b65209b');
INSERT INTO `composite_role` VALUES ('11', 'e538f394-cd81-4c77-84e8-53c7453c9656', '44f03660-410c-472d-9c87-47cf3d7dc41f');
INSERT INTO `composite_role` VALUES ('12', 'e538f394-cd81-4c77-84e8-53c7453c9656', 'c543ad00-b325-435f-8edd-1a2c6f1a1d80');
INSERT INTO `composite_role` VALUES ('13', 'e538f394-cd81-4c77-84e8-53c7453c9656', 'f4cff7ad-0f82-485c-8986-b26191673e99');
INSERT INTO `composite_role` VALUES ('14', 'e538f394-cd81-4c77-84e8-53c7453c9656', '25991f0f-3e5a-478f-a830-c8235b61b682');
INSERT INTO `composite_role` VALUES ('15', 'e538f394-cd81-4c77-84e8-53c7453c9656', '530cdab7-0f2e-4666-92f2-ef21665fcb78');
INSERT INTO `composite_role` VALUES ('16', 'e538f394-cd81-4c77-84e8-53c7453c9656', 'ab4b0bd8-1479-4078-ac60-edcd9b0e9ece');
INSERT INTO `composite_role` VALUES ('17', 'e538f394-cd81-4c77-84e8-53c7453c9656', '8f21e4df-1822-454c-b6b8-833a80d3c171');
INSERT INTO `composite_role` VALUES ('18', 'e538f394-cd81-4c77-84e8-53c7453c9656', '54cb6ec3-da48-419f-a59e-7c9f288637cc');
INSERT INTO `composite_role` VALUES ('19', 'c6a82644-6d6c-4863-99f1-d559f771a233', '2010f6be-4d93-48c3-9d3a-9f5b0024b642');
INSERT INTO `composite_role` VALUES ('20', 'c6a82644-6d6c-4863-99f1-d559f771a233', 'f4cff7ad-0f82-485c-8986-b26191673e99');
INSERT INTO `composite_role` VALUES ('21', '2d62eef8-0e88-4ecd-9342-ba4b63ce1c33', '530cdab7-0f2e-4666-92f2-ef21665fcb78');
INSERT INTO `composite_role` VALUES ('22', '217e51e7-2599-4ab1-8836-3af33fe2d866', '414eef6a-18c5-4024-8e54-c9c879822433');
INSERT INTO `composite_role` VALUES ('23', 'e538f394-cd81-4c77-84e8-53c7453c9656', '307ef2d6-cb71-4803-abd9-55141c6fc305');
INSERT INTO `composite_role` VALUES ('24', 'e538f394-cd81-4c77-84e8-53c7453c9656', 'aa4a0ead-49b1-407d-b023-6082d8e270a9');
INSERT INTO `composite_role` VALUES ('25', 'e538f394-cd81-4c77-84e8-53c7453c9656', '7d7cf2e7-e7d7-48f2-9368-0d8e3d80e7a7');
INSERT INTO `composite_role` VALUES ('26', 'e538f394-cd81-4c77-84e8-53c7453c9656', '700a6c4a-9f74-41e5-9042-389285afaec3');
INSERT INTO `composite_role` VALUES ('27', 'e538f394-cd81-4c77-84e8-53c7453c9656', '886167f9-a1aa-4245-b32b-c4e8d113e6c8');
INSERT INTO `composite_role` VALUES ('28', 'e538f394-cd81-4c77-84e8-53c7453c9656', '4dc28844-93c8-4d48-a3a3-3419774f1687');
INSERT INTO `composite_role` VALUES ('29', 'e538f394-cd81-4c77-84e8-53c7453c9656', '027e57a9-0f1e-42d6-9a1d-7cfeed7d7cfa');
INSERT INTO `composite_role` VALUES ('30', 'e538f394-cd81-4c77-84e8-53c7453c9656', '662b5cf6-dc04-4c7b-9bf3-f5af05f4e8d1');
INSERT INTO `composite_role` VALUES ('31', 'e538f394-cd81-4c77-84e8-53c7453c9656', '9e7344e4-2c12-4fa1-884b-ab2fe57bae74');
INSERT INTO `composite_role` VALUES ('32', 'e538f394-cd81-4c77-84e8-53c7453c9656', 'd2f4aee9-8eb8-4120-93b5-43886378deb2');
INSERT INTO `composite_role` VALUES ('33', 'e538f394-cd81-4c77-84e8-53c7453c9656', '65794970-2026-416d-9a6b-ec37a221fca7');
INSERT INTO `composite_role` VALUES ('34', 'e538f394-cd81-4c77-84e8-53c7453c9656', '15e3b10a-a7e8-463d-8958-801edbb23a52');
INSERT INTO `composite_role` VALUES ('35', 'e538f394-cd81-4c77-84e8-53c7453c9656', '3eccf79d-ebc6-4d61-81cf-9dfe46a8474a');
INSERT INTO `composite_role` VALUES ('36', 'e538f394-cd81-4c77-84e8-53c7453c9656', '90603e30-d9e3-486c-bd87-0ceae0fe68c4');
INSERT INTO `composite_role` VALUES ('37', 'e538f394-cd81-4c77-84e8-53c7453c9656', 'd105ddbb-98ea-4b9f-b471-af8a818809cc');
INSERT INTO `composite_role` VALUES ('38', 'e538f394-cd81-4c77-84e8-53c7453c9656', '56b7a33b-47df-4ca3-812e-b4f3b0afaca9');
INSERT INTO `composite_role` VALUES ('39', 'e538f394-cd81-4c77-84e8-53c7453c9656', 'f04d6b7a-493e-4c65-86f0-5e9ec3d5274d');
INSERT INTO `composite_role` VALUES ('40', 'e538f394-cd81-4c77-84e8-53c7453c9656', '11e77094-5cfa-4b6b-b6c9-a7fdb6a4e99f');
INSERT INTO `composite_role` VALUES ('41', '7d7cf2e7-e7d7-48f2-9368-0d8e3d80e7a7', 'd105ddbb-98ea-4b9f-b471-af8a818809cc');
INSERT INTO `composite_role` VALUES ('42', '7d7cf2e7-e7d7-48f2-9368-0d8e3d80e7a7', '90603e30-d9e3-486c-bd87-0ceae0fe68c4');
INSERT INTO `composite_role` VALUES ('43', 'f04d6b7a-493e-4c65-86f0-5e9ec3d5274d', '56b7a33b-47df-4ca3-812e-b4f3b0afaca9');
INSERT INTO `composite_role` VALUES ('44', '64a6bc1b-3605-45d4-9ae3-3734b315a24a', '023c0582-ea4e-4e8c-9803-bb0e015d9bc2');
INSERT INTO `composite_role` VALUES ('45', '64a6bc1b-3605-45d4-9ae3-3734b315a24a', '10ce694e-ddf3-488d-8282-5421fb2df3e8');
INSERT INTO `composite_role` VALUES ('46', '64a6bc1b-3605-45d4-9ae3-3734b315a24a', 'd8fda467-e3b7-46cc-9069-0ce01cc25bf2');
INSERT INTO `composite_role` VALUES ('47', '64a6bc1b-3605-45d4-9ae3-3734b315a24a', '14051456-e863-4920-94b9-9f53384becda');
INSERT INTO `composite_role` VALUES ('48', '64a6bc1b-3605-45d4-9ae3-3734b315a24a', '976271f6-ceda-490d-bd69-84200cd992e4');
INSERT INTO `composite_role` VALUES ('49', '64a6bc1b-3605-45d4-9ae3-3734b315a24a', 'b747157c-7d5c-432b-ac48-fd5fce1f8998');
INSERT INTO `composite_role` VALUES ('50', '64a6bc1b-3605-45d4-9ae3-3734b315a24a', 'ef01ff92-cdb4-4586-84d9-ebdac68882cf');
INSERT INTO `composite_role` VALUES ('51', '64a6bc1b-3605-45d4-9ae3-3734b315a24a', '4dbe80d0-fdec-42eb-9f53-b6f7f478fa77');
INSERT INTO `composite_role` VALUES ('52', '64a6bc1b-3605-45d4-9ae3-3734b315a24a', 'dd713acc-c759-40e8-93f2-7bc1b6eb281e');
INSERT INTO `composite_role` VALUES ('53', '64a6bc1b-3605-45d4-9ae3-3734b315a24a', 'f4f8095f-b8e3-425f-ad36-e0d173152f51');
INSERT INTO `composite_role` VALUES ('54', '64a6bc1b-3605-45d4-9ae3-3734b315a24a', '4ef9797f-45ba-4ba3-a1e8-1cf1bb0c57c0');
INSERT INTO `composite_role` VALUES ('55', '64a6bc1b-3605-45d4-9ae3-3734b315a24a', '9e789bd2-63de-43d2-b3e0-0ab46df0b77e');
INSERT INTO `composite_role` VALUES ('56', '64a6bc1b-3605-45d4-9ae3-3734b315a24a', 'c9b123ed-1bb9-4438-9f6a-e7271a54eecb');
INSERT INTO `composite_role` VALUES ('57', '64a6bc1b-3605-45d4-9ae3-3734b315a24a', '0f994c7a-f610-4c93-b91a-7f5e99c20d59');
INSERT INTO `composite_role` VALUES ('58', '64a6bc1b-3605-45d4-9ae3-3734b315a24a', '0480ebc6-ad4c-48b3-a527-5c4c5588eaa0');
INSERT INTO `composite_role` VALUES ('59', '64a6bc1b-3605-45d4-9ae3-3734b315a24a', '3ae649be-bd35-4fe8-8a30-6a8b4311b997');
INSERT INTO `composite_role` VALUES ('60', '64a6bc1b-3605-45d4-9ae3-3734b315a24a', '2ebe2304-29fa-457b-b69f-c3aa0c10d0ae');
INSERT INTO `composite_role` VALUES ('61', 'd8fda467-e3b7-46cc-9069-0ce01cc25bf2', '10ce694e-ddf3-488d-8282-5421fb2df3e8');
INSERT INTO `composite_role` VALUES ('62', 'd8fda467-e3b7-46cc-9069-0ce01cc25bf2', 'ef01ff92-cdb4-4586-84d9-ebdac68882cf');
INSERT INTO `composite_role` VALUES ('63', '976271f6-ceda-490d-bd69-84200cd992e4', '0480ebc6-ad4c-48b3-a527-5c4c5588eaa0');
INSERT INTO `composite_role` VALUES ('64', 'e538f394-cd81-4c77-84e8-53c7453c9656', 'f70b8c18-056f-463c-bc44-bb7a721adf6b');
INSERT INTO `composite_role` VALUES ('65', 'ae9c9ff9-23bb-427e-99c6-92832b5b80f9', '212c0fe9-ca9b-4830-a486-df5abc5e9e48');
INSERT INTO `composite_role` VALUES ('66', '64a6bc1b-3605-45d4-9ae3-3734b315a24a', 'f204916f-4eb2-481e-bea4-8b555795eb51');

-- ----------------------------
-- Table structure for credential
-- ----------------------------
DROP TABLE IF EXISTS `credential`;
CREATE TABLE `credential` (
  `ID` varchar(36) NOT NULL,
  `DEVICE` varchar(255) DEFAULT NULL,
  `HASH_ITERATIONS` int(11) DEFAULT NULL,
  `SALT` blob,
  `TYPE` varchar(255) DEFAULT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `COUNTER` int(11) DEFAULT '0',
  `DIGITS` int(11) DEFAULT '6',
  `PERIOD` int(11) DEFAULT '30',
  `ALGORITHM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`) USING BTREE,
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of credential
-- ----------------------------
INSERT INTO `credential` VALUES ('2d5e7dc5-3279-41df-9285-19b03ed024d4', null, '27500', 0xAC84731DB59EFD6BE046379A541F5067, 'password', 'TJ+Dn2JuLImA800yw4C7EXiFR6mWdPrnzMLt2GZSEuATatbGgqM8jnjzRKfWQVeQtcSl53CiINuk2qeiCvVNOg==', '7f643a21-4516-441a-9612-fbf101f3be07', null, '0', '0', '0', 'pbkdf2-sha256');
INSERT INTO `credential` VALUES ('f113ec45-f151-41ad-8847-da67268ad1d5', null, '27500', 0x4469D1DA39029AC2C3928529B2BB8980, 'password', '0kVRm5a2w9cHcQPL5re43SONGe8Wqnp1OUV9EKczUJz7WkPmExfLZsN7ruB9VtyUxkeEoGz/yJNN0IBHxYoCPw==', 'bf8d1a19-ad46-4297-ada2-d1095409121c', '1542276533579', '0', '0', '0', 'pbkdf2-sha256');

-- ----------------------------
-- Table structure for credential_attribute
-- ----------------------------
DROP TABLE IF EXISTS `credential_attribute`;
CREATE TABLE `credential_attribute` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID` varchar(36) NOT NULL,
  `CREDENTIAL_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  KEY `IDX_CREDENTIAL_ATTR_CRED` (`CREDENTIAL_ID`) USING BTREE,
  CONSTRAINT `FK_CRED_ATTR` FOREIGN KEY (`CREDENTIAL_ID`) REFERENCES `credential` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of credential_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `databasechangelog`;
CREATE TABLE `databasechangelog` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of databasechangelog
-- ----------------------------
INSERT INTO `databasechangelog` VALUES ('1', '1.0.0.Final', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.0.0.Final.xml', '2018-05-17 20:12:14', '1', 'EXECUTED', '7:00a57f7a6fb456639b34e62972e0ec02', 'createTable (x29), addPrimaryKey (x21), addUniqueConstraint (x9), addForeignKeyConstraint (x32)', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('2', '1.0.0.Final', 'sthorger@redhat.com', 'META-INF/db2-jpa-changelog-1.0.0.Final.xml', '2018-05-17 20:12:14', '2', 'MARK_RAN', '7:f061c3934594ee60a9b2343f5100ae4e', 'createTable (x29), addPrimaryKey (x21), addUniqueConstraint (x6), addForeignKeyConstraint (x30)', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('3', '1.1.0.Beta1', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Beta1.xml', '2018-05-17 20:12:16', '3', 'EXECUTED', '7:0310eb8ba07cec616460794d42ade0fa', 'delete (x3), createTable (x3), addColumn (x5), addPrimaryKey (x3), addForeignKeyConstraint (x3), customChange', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('4', '1.1.0.Final', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Final.xml', '2018-05-17 20:12:16', '4', 'EXECUTED', '7:5d25857e708c3233ef4439df1f93f012', 'renameColumn', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('5', '1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/jpa-changelog-1.2.0.Beta1.xml', '2018-05-17 20:12:22', '5', 'EXECUTED', '7:c7a54a1041d58eb3817a4a883b4d4e84', 'delete (x4), createTable (x8), addColumn (x2), addPrimaryKey (x6), addForeignKeyConstraint (x9), addUniqueConstraint (x2), addColumn, dropForeignKeyConstraint (x2), dropUniqueConstraint, renameColumn (x3), addUniqueConstraint, addForeignKeyConstra...', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('6', '1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.Beta1.xml', '2018-05-17 20:12:22', '6', 'MARK_RAN', '7:2e01012df20974c1c2a605ef8afe25b7', 'delete (x4), createTable (x8), addColumn (x2), addPrimaryKey (x6), addForeignKeyConstraint (x9), addUniqueConstraint (x2), addColumn, dropForeignKeyConstraint (x2), dropUniqueConstraint, renameColumn (x3), customChange, dropForeignKeyConstraint, d...', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('7', '1.2.0.RC1', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.2.0.CR1.xml', '2018-05-17 20:12:28', '7', 'EXECUTED', '7:0f08df48468428e0f30ee59a8ec01a41', 'delete (x5), createTable (x3), addColumn, createTable (x4), addPrimaryKey (x7), addForeignKeyConstraint (x6), renameColumn, addColumn (x2), update, dropColumn, dropForeignKeyConstraint, renameColumn, addForeignKeyConstraint, dropForeignKeyConstrai...', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('8', '1.2.0.RC1', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.CR1.xml', '2018-05-17 20:12:28', '8', 'MARK_RAN', '7:a77ea2ad226b345e7d689d366f185c8c', 'delete (x5), createTable (x3), addColumn, createTable (x4), addPrimaryKey (x7), addForeignKeyConstraint (x6), renameColumn, addUniqueConstraint, addColumn (x2), update, dropColumn, dropForeignKeyConstraint, renameColumn, addForeignKeyConstraint, r...', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('9', '1.2.0.Final', 'keycloak', 'META-INF/jpa-changelog-1.2.0.Final.xml', '2018-05-17 20:12:28', '9', 'EXECUTED', '7:a3377a2059aefbf3b90ebb4c4cc8e2ab', 'update (x3)', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('10', '1.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.3.0.xml', '2018-05-17 20:12:34', '10', 'EXECUTED', '7:04c1dbedc2aa3e9756d1a1668e003451', 'delete (x6), createTable (x7), addColumn, createTable, addColumn (x2), update, dropDefaultValue, dropColumn, addColumn, update (x4), addPrimaryKey (x4), dropPrimaryKey, dropColumn, addPrimaryKey (x4), addForeignKeyConstraint (x8), dropDefaultValue...', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('11', '1.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.4.0.xml', '2018-05-17 20:12:37', '11', 'EXECUTED', '7:36ef39ed560ad07062d956db861042ba', 'delete (x7), addColumn (x5), dropColumn, renameTable (x2), update (x10), createTable (x3), customChange, dropPrimaryKey, addPrimaryKey (x4), addForeignKeyConstraint (x2), dropColumn, addColumn', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('12', '1.4.0', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.4.0.xml', '2018-05-17 20:12:37', '12', 'MARK_RAN', '7:d909180b2530479a716d3f9c9eaea3d7', 'delete (x7), addColumn (x5), dropColumn, renameTable, dropForeignKeyConstraint, renameTable, addForeignKeyConstraint, update (x10), createTable (x3), customChange, dropPrimaryKey, addPrimaryKey (x4), addForeignKeyConstraint (x2), dropColumn, addCo...', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('13', '1.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.5.0.xml', '2018-05-17 20:12:37', '13', 'EXECUTED', '7:cf12b04b79bea5152f165eb41f3955f6', 'delete (x7), dropDefaultValue, dropColumn, addColumn (x3)', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('14', '1.6.1_from15', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2018-05-17 20:12:38', '14', 'EXECUTED', '7:7e32c8f05c755e8675764e7d5f514509', 'addColumn (x3), createTable (x2), addPrimaryKey (x2)', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('15', '1.6.1_from16-pre', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2018-05-17 20:12:38', '15', 'MARK_RAN', '7:980ba23cc0ec39cab731ce903dd01291', 'delete (x2)', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('16', '1.6.1_from16', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2018-05-17 20:12:38', '16', 'MARK_RAN', '7:2fa220758991285312eb84f3b4ff5336', 'dropPrimaryKey (x2), addColumn, update, dropColumn, addColumn, update, dropColumn, addPrimaryKey (x2)', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('17', '1.6.1', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2018-05-17 20:12:38', '17', 'EXECUTED', '7:d41d8cd98f00b204e9800998ecf8427e', 'Empty', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('18', '1.7.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.7.0.xml', '2018-05-17 20:12:42', '18', 'EXECUTED', '7:91ace540896df890cc00a0490ee52bbc', 'createTable (x5), addColumn (x2), dropDefaultValue, dropColumn, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint (x2), addUniqueConstrain...', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('19', '1.8.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.8.0.xml', '2018-05-17 20:12:45', '19', 'EXECUTED', '7:c31d1646dfa2618a9335c00e07f89f24', 'addColumn, createTable (x3), dropNotNullConstraint, addColumn (x2), createTable, addPrimaryKey, addUniqueConstraint, addForeignKeyConstraint (x5), addPrimaryKey, addForeignKeyConstraint (x2), addPrimaryKey, addForeignKeyConstraint, update', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('20', '1.8.0-2', 'keycloak', 'META-INF/jpa-changelog-1.8.0.xml', '2018-05-17 20:12:45', '20', 'EXECUTED', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue, update', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('21', '1.8.0', 'mposolda@redhat.com', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2018-05-17 20:12:45', '21', 'MARK_RAN', '7:f987971fe6b37d963bc95fee2b27f8df', 'addColumn, createTable (x3), dropNotNullConstraint, addColumn (x2), createTable, addPrimaryKey, addUniqueConstraint, addForeignKeyConstraint (x5), addPrimaryKey, addForeignKeyConstraint (x2), addPrimaryKey, addForeignKeyConstraint, update', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('22', '1.8.0-2', 'keycloak', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2018-05-17 20:12:45', '22', 'MARK_RAN', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue, update', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('23', '1.9.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.9.0.xml', '2018-05-17 20:12:46', '23', 'EXECUTED', '7:ed2dc7f799d19ac452cbcda56c929e47', 'update (x9), customChange, dropForeignKeyConstraint (x2), dropUniqueConstraint, dropTable, dropForeignKeyConstraint (x2), dropTable, dropForeignKeyConstraint (x2), dropUniqueConstraint, dropTable, createIndex', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('24', '1.9.1', 'keycloak', 'META-INF/jpa-changelog-1.9.1.xml', '2018-05-17 20:12:46', '24', 'EXECUTED', '7:80b5db88a5dda36ece5f235be8757615', 'modifyDataType (x3)', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('25', '1.9.1', 'keycloak', 'META-INF/db2-jpa-changelog-1.9.1.xml', '2018-05-17 20:12:46', '25', 'MARK_RAN', '7:1437310ed1305a9b93f8848f301726ce', 'modifyDataType (x2)', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('26', '1.9.2', 'keycloak', 'META-INF/jpa-changelog-1.9.2.xml', '2018-05-17 20:12:47', '26', 'EXECUTED', '7:b82ffb34850fa0836be16deefc6a87c4', 'createIndex (x11)', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('27', 'authz-2.0.0', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.0.0.xml', '2018-05-17 20:12:52', '27', 'EXECUTED', '7:9cc98082921330d8d9266decdd4bd658', 'createTable, addPrimaryKey, addUniqueConstraint, createTable, addPrimaryKey, addForeignKeyConstraint, addUniqueConstraint, createTable, addPrimaryKey, addForeignKeyConstraint, addUniqueConstraint, createTable, addPrimaryKey, addForeignKeyConstrain...', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('28', 'authz-2.5.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.5.1.xml', '2018-05-17 20:12:52', '28', 'EXECUTED', '7:03d64aeed9cb52b969bd30a7ac0db57e', 'update', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('29', '2.1.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.1.0.xml', '2018-05-17 20:12:55', '29', 'EXECUTED', '7:e01599a82bf8d6dc22a9da506e22e868', 'createTable (x11), addPrimaryKey (x11), addForeignKeyConstraint (x2)', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('30', '2.2.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.2.0.xml', '2018-05-17 20:12:56', '30', 'EXECUTED', '7:53188c3eb1107546e6f765835705b6c1', 'addColumn, createTable (x2), modifyDataType, addForeignKeyConstraint (x2)', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('31', '2.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.3.0.xml', '2018-05-17 20:12:58', '31', 'EXECUTED', '7:d6e6f3bc57a0c5586737d1351725d4d4', 'createTable, addPrimaryKey, dropDefaultValue, dropColumn, addColumn (x2), customChange, dropColumn (x4), addColumn', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('32', '2.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.4.0.xml', '2018-05-17 20:12:58', '32', 'EXECUTED', '7:454d604fbd755d9df3fd9c6329043aa5', 'customChange', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('33', '2.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2018-05-17 20:12:58', '33', 'EXECUTED', '7:57e98a3077e29caf562f7dbf80c72600', 'customChange, modifyDataType', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('34', '2.5.0-unicode-oracle', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2018-05-17 20:12:58', '34', 'MARK_RAN', '7:e4c7e8f2256210aee71ddc42f538b57a', 'modifyDataType (x13), addColumn, sql, dropColumn, renameColumn, modifyDataType (x2)', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('35', '2.5.0-unicode-other-dbs', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2018-05-17 20:12:59', '35', 'EXECUTED', '7:09a43c97e49bc626460480aa1379b522', 'modifyDataType (x5), dropUniqueConstraint, modifyDataType (x3), addUniqueConstraint, dropPrimaryKey, modifyDataType, addNotNullConstraint, addPrimaryKey, modifyDataType (x5), dropUniqueConstraint, modifyDataType, addUniqueConstraint, modifyDataType', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('36', '2.5.0-duplicate-email-support', 'slawomir@dabek.name', 'META-INF/jpa-changelog-2.5.0.xml', '2018-05-17 20:13:00', '36', 'EXECUTED', '7:26bfc7c74fefa9126f2ce702fb775553', 'addColumn', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('37', '2.5.0-unique-group-names', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2018-05-17 20:13:00', '37', 'EXECUTED', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('38', '2.5.1', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.1.xml', '2018-05-17 20:13:00', '38', 'EXECUTED', '7:37fc1781855ac5388c494f1442b3f717', 'addColumn', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('39', '3.0.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-3.0.0.xml', '2018-05-17 20:13:00', '39', 'EXECUTED', '7:13a27db0dae6049541136adad7261d27', 'addColumn', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('40', '3.2.0-fix', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2018-05-17 20:13:00', '40', 'MARK_RAN', '7:550300617e3b59e8af3a6294df8248a3', 'addNotNullConstraint', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('41', '3.2.0-fix-with-keycloak-5416', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2018-05-17 20:13:00', '41', 'MARK_RAN', '7:e3a9482b8931481dc2772a5c07c44f17', 'dropIndex, addNotNullConstraint, createIndex', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('42', '3.2.0-fixed', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2018-05-17 20:13:06', '42', 'EXECUTED', '7:a72a7858967bd414835d19e04d880312', 'addColumn, dropPrimaryKey, dropColumn, addPrimaryKey, createTable, addPrimaryKey, addForeignKeyConstraint, createIndex (x45)', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('43', '3.3.0', 'keycloak', 'META-INF/jpa-changelog-3.3.0.xml', '2018-05-17 20:13:06', '43', 'EXECUTED', '7:94edff7cf9ce179e7e85f0cd78a3cf2c', 'addColumn', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('44', 'authz-3.4.0.CR1-resource-server-pk-change-part1', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2018-05-17 20:13:07', '44', 'EXECUTED', '7:6a48ce645a3525488a90fbf76adf3bb3', 'addColumn (x3)', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('45', 'authz-3.4.0.CR1-resource-server-pk-change-part2', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2018-05-17 20:13:07', '45', 'EXECUTED', '7:0464562f01c089a07c4bf0a9beadcfda', 'sql', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('46', 'authz-3.4.0.CR1-resource-server-pk-change-part2-mssql', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2018-05-17 20:13:07', '46', 'MARK_RAN', '7:a9f3a2b597e3e0fee41cd0581edf5616', 'sql', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('47', 'authz-3.4.0.CR1-resource-server-pk-change-part3', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2018-05-17 20:13:11', '47', 'EXECUTED', '7:51bbd74dd6273e11f278a19601c08707', 'addNotNullConstraint (x3), dropUniqueConstraint (x3), dropForeignKeyConstraint, dropIndex, dropColumn, dropForeignKeyConstraint, dropIndex, dropColumn, dropForeignKeyConstraint, dropIndex, dropColumn, dropPrimaryKey, dropUniqueConstraint, dropColu...', '', null, '3.4.1', null, null);
INSERT INTO `databasechangelog` VALUES ('48', 'authn-3.4.0.CR1-refresh-token-max-reuse', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2018-05-17 20:13:11', '48', 'EXECUTED', '7:edad604c882df12f74941dac3cc6d650', 'addColumn', '', null, '3.4.1', null, null);

-- ----------------------------
-- Table structure for databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `databasechangeloglock`;
CREATE TABLE `databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of databasechangeloglock
-- ----------------------------
INSERT INTO `databasechangeloglock` VALUES ('1', '\0', null, null);

-- ----------------------------
-- Table structure for event_entity
-- ----------------------------
DROP TABLE IF EXISTS `event_entity`;
CREATE TABLE `event_entity` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` varchar(2550) DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint(20) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of event_entity
-- ----------------------------

-- ----------------------------
-- Table structure for federated_identity
-- ----------------------------
DROP TABLE IF EXISTS `federated_identity`;
CREATE TABLE `federated_identity` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`) USING BTREE,
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`) USING BTREE,
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`) USING BTREE,
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of federated_identity
-- ----------------------------

-- ----------------------------
-- Table structure for federated_user
-- ----------------------------
DROP TABLE IF EXISTS `federated_user`;
CREATE TABLE `federated_user` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of federated_user
-- ----------------------------

-- ----------------------------
-- Table structure for fed_credential_attribute
-- ----------------------------
DROP TABLE IF EXISTS `fed_credential_attribute`;
CREATE TABLE `fed_credential_attribute` (
  `oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID` varchar(36) NOT NULL,
  `CREDENTIAL_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  KEY `IDX_FED_CRED_ATTR_CRED` (`CREDENTIAL_ID`) USING BTREE,
  CONSTRAINT `FK_FED_CRED_ATTR` FOREIGN KEY (`CREDENTIAL_ID`) REFERENCES `fed_user_credential` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of fed_credential_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for fed_user_attribute
-- ----------------------------
DROP TABLE IF EXISTS `fed_user_attribute`;
CREATE TABLE `fed_user_attribute` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` varchar(2024) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of fed_user_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for fed_user_consent
-- ----------------------------
DROP TABLE IF EXISTS `fed_user_consent`;
CREATE TABLE `fed_user_consent` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of fed_user_consent
-- ----------------------------

-- ----------------------------
-- Table structure for fed_user_consent_prot_mapper
-- ----------------------------
DROP TABLE IF EXISTS `fed_user_consent_prot_mapper`;
CREATE TABLE `fed_user_consent_prot_mapper` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`PROTOCOL_MAPPER_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of fed_user_consent_prot_mapper
-- ----------------------------

-- ----------------------------
-- Table structure for fed_user_consent_role
-- ----------------------------
DROP TABLE IF EXISTS `fed_user_consent_role`;
CREATE TABLE `fed_user_consent_role` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`ROLE_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of fed_user_consent_role
-- ----------------------------

-- ----------------------------
-- Table structure for fed_user_credential
-- ----------------------------
DROP TABLE IF EXISTS `fed_user_credential`;
CREATE TABLE `fed_user_credential` (
  `ID` varchar(36) NOT NULL,
  `DEVICE` varchar(255) DEFAULT NULL,
  `HASH_ITERATIONS` int(11) DEFAULT NULL,
  `SALT` blob,
  `TYPE` varchar(255) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `COUNTER` int(11) DEFAULT '0',
  `DIGITS` int(11) DEFAULT '6',
  `PERIOD` int(11) DEFAULT '30',
  `ALGORITHM` varchar(36) DEFAULT 'HmacSHA1',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of fed_user_credential
-- ----------------------------

-- ----------------------------
-- Table structure for fed_user_group_membership
-- ----------------------------
DROP TABLE IF EXISTS `fed_user_group_membership`;
CREATE TABLE `fed_user_group_membership` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of fed_user_group_membership
-- ----------------------------

-- ----------------------------
-- Table structure for fed_user_required_action
-- ----------------------------
DROP TABLE IF EXISTS `fed_user_required_action`;
CREATE TABLE `fed_user_required_action` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of fed_user_required_action
-- ----------------------------

-- ----------------------------
-- Table structure for fed_user_role_mapping
-- ----------------------------
DROP TABLE IF EXISTS `fed_user_role_mapping`;
CREATE TABLE `fed_user_role_mapping` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of fed_user_role_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for group_attribute
-- ----------------------------
DROP TABLE IF EXISTS `group_attribute`;
CREATE TABLE `group_attribute` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`) USING BTREE,
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `keycloak_group` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of group_attribute
-- ----------------------------
INSERT INTO `group_attribute` VALUES ('03daac52-9f81-4cde-bfdf-cb9e544c55a9', 'bf8d1a19-ad46-4297-ada2-d1095409121c', '1535509229635', '45cc8c92-8640-490c-84c6-58f4cc82393a');
INSERT INTO `group_attribute` VALUES ('56ac31d3-838a-4efd-bcb2-fcd9981a14da', 'description', '系统内置租户', '45cc8c92-8640-490c-84c6-58f4cc82393a');
INSERT INTO `group_attribute` VALUES ('6689d9be-f8d8-403a-ade2-631043ec0538', 'updateTime', '1534485945887', '45cc8c92-8640-490c-84c6-58f4cc82393a');
INSERT INTO `group_attribute` VALUES ('cb48615d-f4b0-43ed-a936-5b20b46ba599', 'admin', 'true', '45cc8c92-8640-490c-84c6-58f4cc82393a');
INSERT INTO `group_attribute` VALUES ('fa968b0d-1aa2-4e74-a824-ebe5a43d07d6', 'creatorId', 'bf8d1a19-ad46-4297-ada2-d1095409121c', '45cc8c92-8640-490c-84c6-58f4cc82393a');
INSERT INTO `group_attribute` VALUES ('90fcf7e5-be4c-4a09-9518-e91e4a35735b', 'updaterId', 'bf8d1a19-ad46-4297-ada2-d1095409121c', '45cc8c92-8640-490c-84c6-58f4cc82393a');
INSERT INTO `group_attribute` VALUES ('efd43db5-c599-4545-b03e-899ea6846d14', 'createTime', '1534901775352', '45cc8c92-8640-490c-84c6-58f4cc82393a');

INSERT INTO `group_attribute` VALUES ('1ed08e10-8b2b-4132-b910-b9cdd66955e7', 'createTime', '1534991094167', '512032de-e220-45ba-bd23-1f15cd3c0f88');
INSERT INTO `group_attribute` VALUES ('43a8f204-7b71-4ff0-8773-a7621fb3dc63', 'bf8d1a19-ad46-4297-ada2-d1095409121c', '1534991094167', '512032de-e220-45ba-bd23-1f15cd3c0f88');
INSERT INTO `group_attribute` VALUES ('d21b129c-4208-43dd-b933-35fb863a6433', 'updaterId', 'bf8d1a19-ad46-4297-ada2-d1095409121c', '512032de-e220-45ba-bd23-1f15cd3c0f88');
INSERT INTO `group_attribute` VALUES ('fd3d988e-a39f-4162-9916-2c9e537354f1', 'creatorId', 'bf8d1a19-ad46-4297-ada2-d1095409121c', '512032de-e220-45ba-bd23-1f15cd3c0f88');
INSERT INTO `group_attribute` VALUES ('745aee0e-bf7e-444a-b402-7e335cae54ae', 'updateTime', '1534991094167', '512032de-e220-45ba-bd23-1f15cd3c0f88');

-- ----------------------------
-- Table structure for group_role_mapping
-- ----------------------------
DROP TABLE IF EXISTS `group_role_mapping`;
CREATE TABLE `group_role_mapping` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`) USING BTREE,
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`) USING BTREE,
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `keycloak_group` (`ID`),
  CONSTRAINT `FK_GROUP_ROLE_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of group_role_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for identity_provider
-- ----------------------------
DROP TABLE IF EXISTS `identity_provider`;
CREATE TABLE `identity_provider` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`) USING BTREE,
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`) USING BTREE,
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`) USING BTREE,
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of identity_provider
-- ----------------------------

-- ----------------------------
-- Table structure for identity_provider_config
-- ----------------------------
DROP TABLE IF EXISTS `identity_provider_config`;
CREATE TABLE `identity_provider_config` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`) USING BTREE,
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `identity_provider` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of identity_provider_config
-- ----------------------------

-- ----------------------------
-- Table structure for identity_provider_mapper
-- ----------------------------
DROP TABLE IF EXISTS `identity_provider_mapper`;
CREATE TABLE `identity_provider_mapper` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`) USING BTREE,
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of identity_provider_mapper
-- ----------------------------

-- ----------------------------
-- Table structure for idp_mapper_config
-- ----------------------------
DROP TABLE IF EXISTS `idp_mapper_config`;
CREATE TABLE `idp_mapper_config` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`) USING BTREE,
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `identity_provider_mapper` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of idp_mapper_config
-- ----------------------------

-- ----------------------------
-- Table structure for jgroupsping
-- ----------------------------
DROP TABLE IF EXISTS `jgroupsping`;
CREATE TABLE `jgroupsping` (
  `own_addr` varchar(200) NOT NULL,
  `cluster_name` varchar(200) NOT NULL,
  `creation_timestamp` datetime DEFAULT NULL,
  `ping_data` blob,
  PRIMARY KEY (`own_addr`,`cluster_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of jgroupsping
-- ----------------------------

-- ----------------------------
-- Table structure for keycloak_group
-- ----------------------------
DROP TABLE IF EXISTS `keycloak_group`;
CREATE TABLE `keycloak_group` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_GROUP` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`) USING BTREE,
  CONSTRAINT `FK_GROUP_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of keycloak_group
-- ----------------------------
INSERT INTO `keycloak_group` VALUES ('45cc8c92-8640-490c-84c6-58f4cc82393a', 'admin', null, 'fast');
INSERT INTO `keycloak_group` VALUES ('512032de-e220-45ba-bd23-1f15cd3c0f88', 'default', null, 'fast');

-- ----------------------------
-- Table structure for keycloak_role
-- ----------------------------
DROP TABLE IF EXISTS `keycloak_role`;
CREATE TABLE `keycloak_role` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(36) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  `SCOPE_PARAM_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`) USING BTREE,
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`) USING BTREE,
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`) USING BTREE,
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `realm` (`ID`),
  CONSTRAINT `FK_KJHO5LE2C0RAL09FL8CM9WFW9` FOREIGN KEY (`CLIENT`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of keycloak_role
-- ----------------------------
INSERT INTO `keycloak_role` VALUES ('023c0582-ea4e-4e8c-9803-bb0e015d9bc2', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', '', '${role_query-realms}', 'query-realms', 'fast', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null, '\0');
INSERT INTO `keycloak_role` VALUES ('027e57a9-0f1e-42d6-9a1d-7cfeed7d7cfa', 'a88c73bb-b26d-469a-ba62-974607334ee3', '', '${role_manage-events}', 'manage-events', 'master', 'a88c73bb-b26d-469a-ba62-974607334ee3', null, '\0');
INSERT INTO `keycloak_role` VALUES ('0480ebc6-ad4c-48b3-a527-5c4c5588eaa0', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', '', '${role_query-clients}', 'query-clients', 'fast', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null, '\0');
INSERT INTO `keycloak_role` VALUES ('094ba54d-6e1d-4fcf-b36b-0c2b2d7410fd', 'master', '\0', '${role_uma_authorization}', 'uma_authorization', 'master', null, 'master', '\0');
INSERT INTO `keycloak_role` VALUES ('0b8810c8-ed82-48e2-a895-d98dc0da4c7a', 'fast', '', null, '系统管理员', 'fast', 'c60de944-62eb-4773-b1f4-550be57b3f25', null, '\0');
INSERT INTO `keycloak_role` VALUES ('0f994c7a-f610-4c93-b91a-7f5e99c20d59', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', '', '${role_create-client}', 'create-client', 'fast', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null, '\0');
INSERT INTO `keycloak_role` VALUES ('10ce694e-ddf3-488d-8282-5421fb2df3e8', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', '', '${role_query-users}', 'query-users', 'fast', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null, '\0');
INSERT INTO `keycloak_role` VALUES ('11e77094-5cfa-4b6b-b6c9-a7fdb6a4e99f', 'a88c73bb-b26d-469a-ba62-974607334ee3', '', '${role_manage-realm}', 'manage-realm', 'master', 'a88c73bb-b26d-469a-ba62-974607334ee3', null, '\0');
INSERT INTO `keycloak_role` VALUES ('14051456-e863-4920-94b9-9f53384becda', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', '', '${role_view-realm}', 'view-realm', 'fast', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null, '\0');
INSERT INTO `keycloak_role` VALUES ('15e3b10a-a7e8-463d-8958-801edbb23a52', 'a88c73bb-b26d-469a-ba62-974607334ee3', '', '${role_query-realms}', 'query-realms', 'master', 'a88c73bb-b26d-469a-ba62-974607334ee3', null, '\0');
INSERT INTO `keycloak_role` VALUES ('1a1d2c21-b84d-42ec-997f-1eaa0054ff63', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', '', '${role_manage-events}', 'manage-events', 'master', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null, '\0');
INSERT INTO `keycloak_role` VALUES ('2010f6be-4d93-48c3-9d3a-9f5b0024b642', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', '', '${role_query-users}', 'query-users', 'master', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null, '\0');
INSERT INTO `keycloak_role` VALUES ('212c0fe9-ca9b-4830-a486-df5abc5e9e48', '03bff8cd-1776-4ffb-9c2d-3e8d4dd2713f', '', '${role_manage-account-links}', 'manage-account-links', 'fast', '03bff8cd-1776-4ffb-9c2d-3e8d4dd2713f', null, '\0');
INSERT INTO `keycloak_role` VALUES ('217e51e7-2599-4ab1-8836-3af33fe2d866', '33958903-5b08-4a0e-b27d-2a046631ddae', '', '${role_manage-account}', 'manage-account', 'master', '33958903-5b08-4a0e-b27d-2a046631ddae', null, '\0');
INSERT INTO `keycloak_role` VALUES ('25991f0f-3e5a-478f-a830-c8235b61b682', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', '', '${role_query-realms}', 'query-realms', 'master', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null, '\0');
INSERT INTO `keycloak_role` VALUES ('2d62eef8-0e88-4ecd-9342-ba4b63ce1c33', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', '', '${role_view-clients}', 'view-clients', 'master', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null, '\0');
INSERT INTO `keycloak_role` VALUES ('2ea3dadb-8c5f-4574-835b-06eb7b91f7a9', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', '', '${role_create-client}', 'create-client', 'master', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null, '\0');
INSERT INTO `keycloak_role` VALUES ('2ebe2304-29fa-457b-b69f-c3aa0c10d0ae', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', '', '${role_view-events}', 'view-events', 'fast', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null, '\0');
INSERT INTO `keycloak_role` VALUES ('307ef2d6-cb71-4803-abd9-55141c6fc305', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', '', '${role_impersonation}', 'impersonation', 'master', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null, '\0');
INSERT INTO `keycloak_role` VALUES ('3ae649be-bd35-4fe8-8a30-6a8b4311b997', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', '', '${role_manage-clients}', 'manage-clients', 'fast', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null, '\0');
INSERT INTO `keycloak_role` VALUES ('3c06e820-ee26-408c-a99c-0f9e53af65dd', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', '', '${role_view-authorization}', 'view-authorization', 'master', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null, '\0');
INSERT INTO `keycloak_role` VALUES ('3eccf79d-ebc6-4d61-81cf-9dfe46a8474a', 'a88c73bb-b26d-469a-ba62-974607334ee3', '', '${role_manage-clients}', 'manage-clients', 'master', 'a88c73bb-b26d-469a-ba62-974607334ee3', null, '\0');
INSERT INTO `keycloak_role` VALUES ('404cc232-11bc-40e1-91c0-f7ec99b87620', 'master', '\0', '${role_create-realm}', 'create-realm', 'master', null, 'master', '\0');
INSERT INTO `keycloak_role` VALUES ('414eef6a-18c5-4024-8e54-c9c879822433', '33958903-5b08-4a0e-b27d-2a046631ddae', '', '${role_manage-account-links}', 'manage-account-links', 'master', '33958903-5b08-4a0e-b27d-2a046631ddae', null, '\0');
INSERT INTO `keycloak_role` VALUES ('44f03660-410c-472d-9c87-47cf3d7dc41f', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', '', '${role_manage-clients}', 'manage-clients', 'master', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null, '\0');
INSERT INTO `keycloak_role` VALUES ('4dbe80d0-fdec-42eb-9f53-b6f7f478fa77', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', '', '${role_manage-events}', 'manage-events', 'fast', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null, '\0');
INSERT INTO `keycloak_role` VALUES ('4dc28844-93c8-4d48-a3a3-3419774f1687', 'a88c73bb-b26d-469a-ba62-974607334ee3', '', '${role_view-identity-providers}', 'view-identity-providers', 'master', 'a88c73bb-b26d-469a-ba62-974607334ee3', null, '\0');
INSERT INTO `keycloak_role` VALUES ('4e743829-4408-4e2f-8a0b-5e61a6d14303', 'fast', '\0', '${role_uma_authorization}', 'uma_authorization', 'fast', null, 'fast', '\0');
INSERT INTO `keycloak_role` VALUES ('4ef9797f-45ba-4ba3-a1e8-1cf1bb0c57c0', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', '', '${role_view-authorization}', 'view-authorization', 'fast', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null, '\0');
INSERT INTO `keycloak_role` VALUES ('530cdab7-0f2e-4666-92f2-ef21665fcb78', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', '', '${role_query-clients}', 'query-clients', 'master', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null, '\0');
INSERT INTO `keycloak_role` VALUES ('54cb6ec3-da48-419f-a59e-7c9f288637cc', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', '', '${role_view-identity-providers}', 'view-identity-providers', 'master', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null, '\0');
INSERT INTO `keycloak_role` VALUES ('56b7a33b-47df-4ca3-812e-b4f3b0afaca9', 'a88c73bb-b26d-469a-ba62-974607334ee3', '', '${role_query-clients}', 'query-clients', 'master', 'a88c73bb-b26d-469a-ba62-974607334ee3', null, '\0');
INSERT INTO `keycloak_role` VALUES ('64a6bc1b-3605-45d4-9ae3-3734b315a24a', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', '', '${role_realm-admin}', 'realm-admin', 'fast', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null, '\0');
INSERT INTO `keycloak_role` VALUES ('65794970-2026-416d-9a6b-ec37a221fca7', 'a88c73bb-b26d-469a-ba62-974607334ee3', '', '${role_view-realm}', 'view-realm', 'master', 'a88c73bb-b26d-469a-ba62-974607334ee3', null, '\0');
INSERT INTO `keycloak_role` VALUES ('662b5cf6-dc04-4c7b-9bf3-f5af05f4e8d1', 'a88c73bb-b26d-469a-ba62-974607334ee3', '', '${role_view-events}', 'view-events', 'master', 'a88c73bb-b26d-469a-ba62-974607334ee3', null, '\0');
INSERT INTO `keycloak_role` VALUES ('67ead231-1987-4cd7-b330-12fa70e53db4', 'master', '\0', '${role_offline-access}', 'offline_access', 'master', null, 'master', '');
INSERT INTO `keycloak_role` VALUES ('700a6c4a-9f74-41e5-9042-389285afaec3', 'a88c73bb-b26d-469a-ba62-974607334ee3', '', '${role_manage-authorization}', 'manage-authorization', 'master', 'a88c73bb-b26d-469a-ba62-974607334ee3', null, '\0');
INSERT INTO `keycloak_role` VALUES ('7d7cf2e7-e7d7-48f2-9368-0d8e3d80e7a7', 'a88c73bb-b26d-469a-ba62-974607334ee3', '', '${role_view-users}', 'view-users', 'master', 'a88c73bb-b26d-469a-ba62-974607334ee3', null, '\0');
INSERT INTO `keycloak_role` VALUES ('862109de-cd7a-49dc-9b70-45f4cb4ff2c8', 'bbfee872-0023-4535-98d0-bb2a81b650a8', '', '${role_read-token}', 'read-token', 'master', 'bbfee872-0023-4535-98d0-bb2a81b650a8', null, '\0');
INSERT INTO `keycloak_role` VALUES ('886167f9-a1aa-4245-b32b-c4e8d113e6c8', 'a88c73bb-b26d-469a-ba62-974607334ee3', '', '${role_view-authorization}', 'view-authorization', 'master', 'a88c73bb-b26d-469a-ba62-974607334ee3', null, '\0');
INSERT INTO `keycloak_role` VALUES ('8f21e4df-1822-454c-b6b8-833a80d3c171', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', '', '${role_manage-users}', 'manage-users', 'master', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null, '\0');
INSERT INTO `keycloak_role` VALUES ('90603e30-d9e3-486c-bd87-0ceae0fe68c4', 'a88c73bb-b26d-469a-ba62-974607334ee3', '', '${role_query-users}', 'query-users', 'master', 'a88c73bb-b26d-469a-ba62-974607334ee3', null, '\0');
INSERT INTO `keycloak_role` VALUES ('976271f6-ceda-490d-bd69-84200cd992e4', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', '', '${role_view-clients}', 'view-clients', 'fast', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null, '\0');
INSERT INTO `keycloak_role` VALUES ('9e7344e4-2c12-4fa1-884b-ab2fe57bae74', 'a88c73bb-b26d-469a-ba62-974607334ee3', '', '${role_manage-identity-providers}', 'manage-identity-providers', 'master', 'a88c73bb-b26d-469a-ba62-974607334ee3', null, '\0');
INSERT INTO `keycloak_role` VALUES ('9e789bd2-63de-43d2-b3e0-0ab46df0b77e', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', '', '${role_manage-identity-providers}', 'manage-identity-providers', 'fast', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null, '\0');
INSERT INTO `keycloak_role` VALUES ('a0b8c786-bb5b-42b9-9df5-9cef6b65209b', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', '', '${role_view-realm}', 'view-realm', 'master', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null, '\0');
INSERT INTO `keycloak_role` VALUES ('aa4a0ead-49b1-407d-b023-6082d8e270a9', 'a88c73bb-b26d-469a-ba62-974607334ee3', '', '${role_manage-users}', 'manage-users', 'master', 'a88c73bb-b26d-469a-ba62-974607334ee3', null, '\0');
INSERT INTO `keycloak_role` VALUES ('ab4b0bd8-1479-4078-ac60-edcd9b0e9ece', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', '', '${role_manage-realm}', 'manage-realm', 'master', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null, '\0');
INSERT INTO `keycloak_role` VALUES ('ae9c9ff9-23bb-427e-99c6-92832b5b80f9', '03bff8cd-1776-4ffb-9c2d-3e8d4dd2713f', '', '${role_manage-account}', 'manage-account', 'fast', '03bff8cd-1776-4ffb-9c2d-3e8d4dd2713f', null, '\0');
INSERT INTO `keycloak_role` VALUES ('b1f8eaa4-6b6a-4235-bf64-e6843c5d036c', 'fast', '\0', '${role_offline-access}', 'offline_access', 'fast', null, 'fast', '');
INSERT INTO `keycloak_role` VALUES ('b471d3dd-d641-481c-9d8a-9f84237b8965', '33958903-5b08-4a0e-b27d-2a046631ddae', '', '${role_view-profile}', 'view-profile', 'master', '33958903-5b08-4a0e-b27d-2a046631ddae', null, '\0');
INSERT INTO `keycloak_role` VALUES ('b565b89d-0b40-4400-8cde-5af890c44786', '03bff8cd-1776-4ffb-9c2d-3e8d4dd2713f', '', '${role_view-profile}', 'view-profile', 'fast', '03bff8cd-1776-4ffb-9c2d-3e8d4dd2713f', null, '\0');
INSERT INTO `keycloak_role` VALUES ('b747157c-7d5c-432b-ac48-fd5fce1f8998', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', '', '${role_manage-users}', 'manage-users', 'fast', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null, '\0');
INSERT INTO `keycloak_role` VALUES ('c3426144-09c9-4b8e-8305-09a586e032bd', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', '', '${role_view-events}', 'view-events', 'master', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null, '\0');
INSERT INTO `keycloak_role` VALUES ('c543ad00-b325-435f-8edd-1a2c6f1a1d80', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', '', '${role_manage-identity-providers}', 'manage-identity-providers', 'master', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null, '\0');
INSERT INTO `keycloak_role` VALUES ('c6a82644-6d6c-4863-99f1-d559f771a233', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', '', '${role_view-users}', 'view-users', 'master', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null, '\0');
INSERT INTO `keycloak_role` VALUES ('c9b123ed-1bb9-4438-9f6a-e7271a54eecb', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', '', '${role_view-identity-providers}', 'view-identity-providers', 'fast', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null, '\0');
INSERT INTO `keycloak_role` VALUES ('d105ddbb-98ea-4b9f-b471-af8a818809cc', 'a88c73bb-b26d-469a-ba62-974607334ee3', '', '${role_query-groups}', 'query-groups', 'master', 'a88c73bb-b26d-469a-ba62-974607334ee3', null, '\0');
INSERT INTO `keycloak_role` VALUES ('d2f4aee9-8eb8-4120-93b5-43886378deb2', 'a88c73bb-b26d-469a-ba62-974607334ee3', '', '${role_create-client}', 'create-client', 'master', 'a88c73bb-b26d-469a-ba62-974607334ee3', null, '\0');
INSERT INTO `keycloak_role` VALUES ('d8fda467-e3b7-46cc-9069-0ce01cc25bf2', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', '', '${role_view-users}', 'view-users', 'fast', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null, '\0');
INSERT INTO `keycloak_role` VALUES ('dd713acc-c759-40e8-93f2-7bc1b6eb281e', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', '', '${role_manage-realm}', 'manage-realm', 'fast', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null, '\0');
INSERT INTO `keycloak_role` VALUES ('e538f394-cd81-4c77-84e8-53c7453c9656', 'master', '\0', '${role_admin}', 'admin', 'master', null, 'master', '\0');
INSERT INTO `keycloak_role` VALUES ('ef01ff92-cdb4-4586-84d9-ebdac68882cf', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', '', '${role_query-groups}', 'query-groups', 'fast', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null, '\0');
INSERT INTO `keycloak_role` VALUES ('f04d6b7a-493e-4c65-86f0-5e9ec3d5274d', 'a88c73bb-b26d-469a-ba62-974607334ee3', '', '${role_view-clients}', 'view-clients', 'master', 'a88c73bb-b26d-469a-ba62-974607334ee3', null, '\0');
INSERT INTO `keycloak_role` VALUES ('f05095bc-7c3d-4568-ac02-05a5e8dc9724', '98d018b0-db18-4f60-9f6d-62e299fdb6de', '', '${role_read-token}', 'read-token', 'fast', '98d018b0-db18-4f60-9f6d-62e299fdb6de', null, '\0');
INSERT INTO `keycloak_role` VALUES ('f204916f-4eb2-481e-bea4-8b555795eb51', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', '', '${role_impersonation}', 'impersonation', 'fast', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null, '\0');
INSERT INTO `keycloak_role` VALUES ('f4cff7ad-0f82-485c-8986-b26191673e99', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', '', '${role_query-groups}', 'query-groups', 'master', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null, '\0');
INSERT INTO `keycloak_role` VALUES ('f4f8095f-b8e3-425f-ad36-e0d173152f51', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', '', '${role_manage-authorization}', 'manage-authorization', 'fast', '3f3d66d1-e4e5-43dd-aa07-2a9d5d551075', null, '\0');
INSERT INTO `keycloak_role` VALUES ('f70b8c18-056f-463c-bc44-bb7a721adf6b', 'a88c73bb-b26d-469a-ba62-974607334ee3', '', '${role_impersonation}', 'impersonation', 'master', 'a88c73bb-b26d-469a-ba62-974607334ee3', null, '\0');
INSERT INTO `keycloak_role` VALUES ('f9393b3c-ae86-4837-afbe-8fdd7463933f', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', '', '${role_manage-authorization}', 'manage-authorization', 'master', 'eed30dc9-b6be-4dc6-857a-2b2c3e4c5208', null, '\0');