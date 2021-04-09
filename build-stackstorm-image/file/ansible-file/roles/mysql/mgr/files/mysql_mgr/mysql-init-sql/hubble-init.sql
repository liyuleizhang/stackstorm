    CREATE SCHEMA IF NOT EXISTS `zone` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    GRANT ALL ON zone.* to zone@'%' IDENTIFIED BY 'chinacloudzone';


    -- dataquality database defination
    CREATE SCHEMA IF NOT EXISTS `dataquality` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    GRANT ALL ON dataquality.* to dataquality@'%' IDENTIFIED BY 'chinaclouddataquality';


    -- metagrid database defination
    CREATE SCHEMA IF NOT EXISTS `metagrid` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    GRANT ALL ON *.* to metagrid@'%' IDENTIFIED BY 'chinacloudmetagrid';

    -- datasync database defination
    CREATE SCHEMA IF NOT EXISTS `datasync` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    GRANT ALL ON datasync.* to datasync@'%' IDENTIFIED BY 'chinaclouddatasync';

    -- sqoop database defination
    CREATE SCHEMA IF NOT EXISTS `sqoop_metastore` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    GRANT ALL ON sqoop_metastore.* to datasync@'%' IDENTIFIED BY 'chinaclouddatasync';

    -- orchestra database defination
    CREATE SCHEMA IF NOT EXISTS `orchestra` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    GRANT ALL ON orchestra.* to orcadmin@'%' IDENTIFIED BY 'chinacloudorcadmin';

    -- blackhole database defination
    CREATE SCHEMA IF NOT EXISTS `blackhole` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    GRANT ALL ON blackhole.* to blackhole@'%' IDENTIFIED BY 'chinacloudblackhole';

    -- onelog database defination
    CREATE SCHEMA IF NOT EXISTS `one_log` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    GRANT ALL ON one_log.* to onelog@'%' IDENTIFIED BY 'chinacloudonelog';

	-- directory database defination
    CREATE SCHEMA IF NOT EXISTS `data_res_catalog` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    GRANT ALL ON data_res_catalog.* to datares@'%' IDENTIFIED BY 'chinaclouddatares';


	-- broker-parent database defination
    CREATE SCHEMA IF NOT EXISTS `broker_parent` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    GRANT ALL ON broker_parent.* to brokerparent@'%' IDENTIFIED BY 'chinacloudbrokerparent';

	-- broker-api database defination
    CREATE SCHEMA IF NOT EXISTS `broker_dynamic_api` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    GRANT ALL ON broker_dynamic_api.* to brokerapi@'%' IDENTIFIED BY 'chinacloudbrokerapi';

	-- broker-dynamic-api database defination
    CREATE SCHEMA IF NOT EXISTS `token_server` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    GRANT ALL ON token_server.* to tokenserver@'%' IDENTIFIED BY 'chinacloudtokenserver';

	-- broker-api database defination
    CREATE SCHEMA IF NOT EXISTS `broker_dataset_dynamic` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    GRANT ALL ON broker_dataset_dynamic.* to brokerdataset@'%' IDENTIFIED BY 'chinacloudbrokerdataset';

    -- broker-api database defination
--     CREATE SCHEMA IF NOT EXISTS `statistics` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
--     GRANT ALL ON statistics.* to brokerdataset@'%' IDENTIFIED BY 'chinacloudstatistics';

    -- broker-file database defination
    CREATE SCHEMA IF NOT EXISTS `broker_file_service` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    GRANT ALL ON broker_file_service.* to brokerfile@'%' IDENTIFIED BY 'chinacloudbrokerfile';

    CREATE SCHEMA IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    GRANT ALL ON test.* to test@'%' IDENTIFIED BY 'chinacloudtest';

    -- data-exchange database definition
    CREATE SCHEMA IF NOT EXISTS `data_exchange` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

    GRANT ALL ON *.* to fast@'%' IDENTIFIED BY '123456';
    FLUSH PRIVILEGES;

use datasync;

CREATE TABLE IF NOT EXISTS `all_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `all_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `job` (
  `jobId` varchar(50) NOT NULL,
  `jobType` varchar(40) NOT NULL,
  `createTime` varchar(40) DEFAULT NULL,
  `jobName` varchar(200) DEFAULT NULL,
  `submitParams` varchar(6000) DEFAULT NULL,
  `jobInfo` varchar(4000) DEFAULT '''',
  `lastCount` varchar(50) DEFAULT NULL,
  `totalCount` varchar(50) DEFAULT NULL,
  `runCount` varchar(50) DEFAULT NULL,
  `failCount` varchar(50) DEFAULT NULL,
  `runTime` varchar(50) DEFAULT NULL,
  `jobDataSource` varchar(256) DEFAULT NULL,
  `jobChecksum` varchar(256) DEFAULT NULL,
  `jobSubType` varchar(256) DEFAULT NULL,
  `dataExtractTime` varchar(40) DEFAULT NULL,
  `metaDataChecksum` varchar(255) DEFAULT NULL,
  `connectionID` varchar(255) DEFAULT NULL,
  `labels` varchar(50) DEFAULT NULL,
  `alarm` varchar(20) DEFAULT NULL,
  `databaseType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`jobId`),
  UNIQUE KEY `jobName` (`jobName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 导出  表 datasync.job_history 结构
CREATE TABLE IF NOT EXISTS `job_history` (
  `id` varchar(64) NOT NULL,
  `jobId` varchar(64) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `records` varchar(50) DEFAULT NULL,
  `spendTime` varchar(32) DEFAULT NULL,
  `timestamp` bigint(32) DEFAULT NULL,
  `jobName` varchar(200) DEFAULT NULL,
  `createDate` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `job_statistic` (
  `id` varchar(255) NOT NULL,
  `createDate` varchar(255) DEFAULT NULL,
  `totalCount` varchar(128) DEFAULT NULL,
  `lastCount` varchar(128) DEFAULT NULL,
  `runCount` varchar(128) DEFAULT NULL,
  `failCount` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_createDate` (`createDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `role` (
  `roleId` varchar(36) NOT NULL,
  `roleName` varchar(20) DEFAULT NULL,
  `roleDesc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `role_privilege` (
  `roleId` varchar(36) NOT NULL,
  `privilegeName` varchar(36) NOT NULL,
  PRIMARY KEY (`roleId`,`privilegeName`),
  CONSTRAINT `Role_Privilege_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `scheduler` (
  `jobId` varchar(225) NOT NULL,
  `schedulerExist` varchar(40) DEFAULT NULL,
  `pattern` varchar(255) DEFAULT NULL,
  `shell` varchar(3000) DEFAULT NULL,
  `lastRunningTime` varchar(40) DEFAULT NULL,
  `nextRunningTime` varchar(40) DEFAULT NULL,
  `isRunning` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`jobId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tableinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tableName` varchar(256) DEFAULT NULL,
  `count` bigint(20) DEFAULT NULL,
  `updateTime` varchar(40) DEFAULT NULL,
  `tableCnName` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `user_role` (
  `userId` varchar(36) NOT NULL,
  `roleId` varchar(36) NOT NULL,
  `tenantId` varchar(36) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`,`tenantId`),
  KEY `FK_user_role_reference` (`roleId`),
  CONSTRAINT `User_Role_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE  or REPLACE ALGORITHM=UNDEFINED DEFINER=`datasync`@`%` SQL SECURITY DEFINER VIEW  `jobsche` AS select `a`.`jobId` AS `jobId`,`a`.`jobType` AS `jobType`,`a`.`jobDataSource` AS `jobDataSource`,`a`.`jobName` AS `jobName`,`a`.`createTime` AS `createTime`,`a`.`jobInfo` AS `jobInfo`,`a`.`lastCount` AS `lastCount`,`a`.`totalCount` AS `totalCount`,`a`.`failCount` AS `failCount`,`a`.`runCount` AS `runCount`,`b`.`schedulerExist` AS `schedulerExist`,`b`.`lastRunningTime` AS `lastRunningTime`,`b`.`nextRunningTime` AS `nextRunningTime`,`b`.`pattern` AS `pattern` from (`job` `a` left join `scheduler` `b` on((`a`.`jobId` = `b`.`jobId`)));


use sqoop_metastore;
DROP TABLE IF EXISTS `SQOOP_SESSIONS`;
CREATE TABLE IF NOT EXISTS `SQOOP_SESSIONS` (
  `job_name` varchar(64) NOT NULL,
  `propname` varchar(128) NOT NULL,
  `propval` varchar(20480) DEFAULT NULL,
  `propclass` varchar(32) NOT NULL,
  PRIMARY KEY (`job_name`,`propname`),
  UNIQUE KEY `SQOOP_SESSIONS_unq` (`job_name`,`propname`,`propclass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `SQOOP_ROOT`;
CREATE TABLE `SQOOP_ROOT` (
  `version` int(11) DEFAULT NULL,
  `propname` varchar(128) NOT NULL,
  `propval` varchar(256) DEFAULT NULL,
PRIMARY KEY (`propname`),
  UNIQUE KEY `SQOOP_ROOT_unq` (`version`,`propname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `SQOOP_ROOT` VALUES (null, 'sqoop.hsqldb.job.storage.version', '0');
INSERT INTO `SQOOP_ROOT` VALUES ('0', 'sqoop.hsqldb.job.info.table', 'SQOOP_SESSIONS');

