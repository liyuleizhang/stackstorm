-- statsdb database defination
DROP DATABASE IF EXISTS  `statsdb`;
CREATE SCHEMA `statsdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

GRANT ALL ON statsdb.* to apimanager@'%' IDENTIFIED BY '123456';

FLUSH PRIVILEGES;

use statsdb;

-- 导出  表 statsdb.API_DESTINATION_SUMMARY 结构
CREATE TABLE IF NOT EXISTS `API_DESTINATION_SUMMARY` (
  `api` varchar(254) NOT NULL DEFAULT '',
  `version` varchar(254) NOT NULL DEFAULT '',
  `apiPublisher` varchar(254) NOT NULL DEFAULT '',
  `context` varchar(254) NOT NULL DEFAULT '',
  `destination` varchar(254) NOT NULL DEFAULT '',
  `total_request_count` int(11) DEFAULT NULL,
  `hostName` varchar(254) NOT NULL DEFAULT '',
  `year` int(11) NOT NULL DEFAULT '0',
  `month` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `time` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`api`,`version`,`apiPublisher`,`context`,`destination`,`hostName`,`year`,`month`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 数据导出被取消选择。


-- 导出  表 statsdb.API_EXE_TIME_HOUR_SUMMARY 结构
CREATE TABLE IF NOT EXISTS `API_EXE_TIME_HOUR_SUMMARY` (
  `api` varchar(254) NOT NULL DEFAULT '',
  `version` varchar(254) NOT NULL DEFAULT '',
  `tenantDomain` varchar(254) NOT NULL DEFAULT '',
  `apiPublisher` varchar(254) NOT NULL DEFAULT '',
  `apiResponseTime` bigint(20) DEFAULT NULL,
  `context` varchar(254) NOT NULL DEFAULT '',
  `securityLatency` bigint(20) DEFAULT NULL,
  `throttlingLatency` bigint(20) DEFAULT NULL,
  `requestMediationLatency` bigint(20) DEFAULT NULL,
  `responseMediationLatency` bigint(20) DEFAULT NULL,
  `backendLatency` bigint(20) DEFAULT NULL,
  `otherLatency` bigint(20) DEFAULT NULL,
  `year` int(11) NOT NULL DEFAULT '0',
  `month` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `hour` int(11) NOT NULL DEFAULT '0',
  `time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`api`,`version`,`tenantDomain`,`apiPublisher`,`context`,`year`,`month`,`day`,`hour`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 数据导出被取消选择。


-- 导出  表 statsdb.API_EXE_TIME_MIN_SUMMARY 结构
CREATE TABLE IF NOT EXISTS `API_EXE_TIME_MIN_SUMMARY` (
  `api` varchar(254) NOT NULL DEFAULT '',
  `version` varchar(254) NOT NULL DEFAULT '',
  `tenantDomain` varchar(254) NOT NULL DEFAULT '',
  `apiPublisher` varchar(254) NOT NULL DEFAULT '',
  `apiResponseTime` bigint(20) DEFAULT NULL,
  `context` varchar(254) NOT NULL DEFAULT '',
  `securityLatency` bigint(20) DEFAULT NULL,
  `throttlingLatency` bigint(20) DEFAULT NULL,
  `requestMediationLatency` bigint(20) DEFAULT NULL,
  `responseMediationLatency` bigint(20) DEFAULT NULL,
  `backendLatency` bigint(20) DEFAULT NULL,
  `otherLatency` bigint(20) DEFAULT NULL,
  `year` int(11) NOT NULL DEFAULT '0',
  `month` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `hour` int(11) NOT NULL DEFAULT '0',
  `minutes` int(11) NOT NULL DEFAULT '0',
  `time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`api`,`version`,`tenantDomain`,`apiPublisher`,`context`,`year`,`month`,`day`,`hour`,`minutes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 数据导出被取消选择。


-- 导出  表 statsdb.API_EXE_TME_DAY_SUMMARY 结构
CREATE TABLE IF NOT EXISTS `API_EXE_TME_DAY_SUMMARY` (
  `api` varchar(254) NOT NULL DEFAULT '',
  `version` varchar(254) NOT NULL DEFAULT '',
  `tenantDomain` varchar(254) NOT NULL DEFAULT '',
  `apiPublisher` varchar(254) NOT NULL DEFAULT '',
  `apiResponseTime` bigint(20) DEFAULT NULL,
  `context` varchar(254) NOT NULL DEFAULT '',
  `securityLatency` bigint(20) DEFAULT NULL,
  `throttlingLatency` bigint(20) DEFAULT NULL,
  `requestMediationLatency` bigint(20) DEFAULT NULL,
  `responseMediationLatency` bigint(20) DEFAULT NULL,
  `backendLatency` bigint(20) DEFAULT NULL,
  `otherLatency` bigint(20) DEFAULT NULL,
  `year` int(11) NOT NULL DEFAULT '0',
  `month` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`api`,`version`,`apiPublisher`,`context`,`year`,`month`,`day`,`tenantDomain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 数据导出被取消选择。


-- 导出  表 statsdb.API_FAULT_SUMMARY 结构
CREATE TABLE IF NOT EXISTS `API_FAULT_SUMMARY` (
  `api` varchar(254) NOT NULL DEFAULT '',
  `version` varchar(254) NOT NULL DEFAULT '',
  `apiPublisher` varchar(254) NOT NULL DEFAULT '',
  `consumerKey` varchar(254) NOT NULL DEFAULT '',
  `context` varchar(254) NOT NULL DEFAULT '',
  `total_fault_count` int(11) DEFAULT NULL,
  `hostName` varchar(254) NOT NULL DEFAULT '',
  `year` int(11) NOT NULL DEFAULT '0',
  `month` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `time` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`api`,`version`,`apiPublisher`,`consumerKey`,`context`,`hostName`,`year`,`month`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 数据导出被取消选择。


-- 导出  表 statsdb.API_LAST_ACCESS_TIME_SUMMARY 结构
CREATE TABLE IF NOT EXISTS `API_LAST_ACCESS_TIME_SUMMARY` (
  `tenantDomain` varchar(254) NOT NULL DEFAULT '',
  `apiPublisher` varchar(254) NOT NULL DEFAULT '',
  `api` varchar(254) NOT NULL DEFAULT '',
  `version` varchar(254) DEFAULT NULL,
  `userId` varchar(254) DEFAULT NULL,
  `context` varchar(254) DEFAULT NULL,
  `max_request_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`tenantDomain`,`apiPublisher`,`api`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 数据导出被取消选择。


-- 导出  表 statsdb.API_REQUEST_SUMMARY 结构
CREATE TABLE IF NOT EXISTS `API_REQUEST_SUMMARY` (
  `api` varchar(254) NOT NULL DEFAULT '',
  `api_version` varchar(254) NOT NULL DEFAULT '',
  `version` varchar(254) NOT NULL DEFAULT '',
  `apiPublisher` varchar(254) NOT NULL DEFAULT '',
  `consumerKey` varchar(254) NOT NULL DEFAULT '',
  `userId` varchar(254) NOT NULL DEFAULT '',
  `context` varchar(254) NOT NULL DEFAULT '',
  `max_request_time` bigint(20) DEFAULT NULL,
  `total_request_count` int(11) DEFAULT NULL,
  `hostName` varchar(254) NOT NULL DEFAULT '',
  `year` int(11) NOT NULL DEFAULT '0',
  `month` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `time` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`api`,`api_version`,`version`,`apiPublisher`,`consumerKey`,`userId`,`context`,`hostName`,`year`,`month`,`day`),
  KEY `API_REQUEST_SUMMARY_INDEX` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 数据导出被取消选择。


-- 导出  表 statsdb.API_REQ_USER_BROW_SUMMARY 结构
CREATE TABLE IF NOT EXISTS `API_REQ_USER_BROW_SUMMARY` (
  `api` varchar(254) NOT NULL DEFAULT '',
  `version` varchar(254) NOT NULL DEFAULT '',
  `apiPublisher` varchar(254) NOT NULL DEFAULT '',
  `tenantDomain` varchar(254) NOT NULL DEFAULT '',
  `total_request_count` int(11) DEFAULT NULL,
  `year` int(11) NOT NULL DEFAULT '0',
  `month` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `requestTime` bigint(20) DEFAULT NULL,
  `os` varchar(254) NOT NULL DEFAULT '',
  `browser` varchar(254) NOT NULL DEFAULT '',
  PRIMARY KEY (`api`,`version`,`apiPublisher`,`year`,`month`,`day`,`os`,`browser`,`tenantDomain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 数据导出被取消选择。


-- 导出  表 statsdb.API_Resource_USAGE_SUMMARY 结构
CREATE TABLE IF NOT EXISTS `API_Resource_USAGE_SUMMARY` (
  `api` varchar(254) NOT NULL DEFAULT '',
  `version` varchar(254) NOT NULL DEFAULT '',
  `apiPublisher` varchar(254) NOT NULL DEFAULT '',
  `consumerKey` varchar(254) NOT NULL DEFAULT '',
  `resourcePath` varchar(254) NOT NULL DEFAULT '',
  `context` varchar(254) NOT NULL DEFAULT '',
  `method` varchar(254) NOT NULL DEFAULT '',
  `total_request_count` int(11) DEFAULT NULL,
  `hostName` varchar(254) NOT NULL DEFAULT '',
  `year` int(11) NOT NULL DEFAULT '0',
  `month` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `time` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`api`,`version`,`apiPublisher`,`consumerKey`,`context`,`resourcePath`,`method`,`hostName`,`year`,`month`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 数据导出被取消选择。


-- 导出  表 statsdb.API_RESPONSE_SUMMARY 结构
CREATE TABLE IF NOT EXISTS `API_RESPONSE_SUMMARY` (
  `api_version` varchar(254) NOT NULL DEFAULT '',
  `apiPublisher` varchar(254) NOT NULL DEFAULT '',
  `context` varchar(254) NOT NULL DEFAULT '',
  `serviceTime` int(11) DEFAULT NULL,
  `total_response_count` int(11) DEFAULT NULL,
  `hostName` varchar(254) NOT NULL DEFAULT '',
  `year` int(11) NOT NULL DEFAULT '0',
  `month` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `time` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`api_version`,`apiPublisher`,`context`,`hostName`,`year`,`month`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 数据导出被取消选择。


-- 导出  表 statsdb.API_THROTTLED_OUT_SUMMARY 结构
CREATE TABLE IF NOT EXISTS `API_THROTTLED_OUT_SUMMARY` (
  `api` varchar(254) NOT NULL DEFAULT '',
  `api_version` varchar(254) NOT NULL DEFAULT '',
  `context` varchar(254) NOT NULL DEFAULT '',
  `apiPublisher` varchar(254) NOT NULL DEFAULT '',
  `applicationName` varchar(254) NOT NULL DEFAULT '',
  `tenantDomain` varchar(254) NOT NULL DEFAULT '',
  `year` int(11) NOT NULL DEFAULT '0',
  `month` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `week` int(11) DEFAULT NULL,
  `time` varchar(254) DEFAULT NULL,
  `success_request_count` int(11) DEFAULT NULL,
  `throttleout_count` int(11) DEFAULT NULL,
  `throttledOutReason` varchar(254) NOT NULL DEFAULT '',
  PRIMARY KEY (`api`,`api_version`,`context`,`apiPublisher`,`applicationName`,`tenantDomain`,`year`,`month`,`day`,`throttledOutReason`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 数据导出被取消选择。


-- 导出  表 statsdb.API_VERSION_USAGE_SUMMARY 结构
CREATE TABLE IF NOT EXISTS `API_VERSION_USAGE_SUMMARY` (
  `api` varchar(254) NOT NULL DEFAULT '',
  `version` varchar(254) NOT NULL DEFAULT '',
  `apiPublisher` varchar(254) NOT NULL DEFAULT '',
  `context` varchar(254) NOT NULL DEFAULT '',
  `total_request_count` int(11) DEFAULT NULL,
  `hostName` varchar(254) NOT NULL DEFAULT '',
  `year` int(11) NOT NULL DEFAULT '0',
  `month` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `time` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`api`,`version`,`apiPublisher`,`context`,`hostName`,`year`,`month`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;