-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: datacenter
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accessControlEvent`
--

DROP TABLE IF EXISTS `accessControlEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accessControlEvent` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `deviceId` varchar(255) DEFAULT NULL COMMENT '设备id',
  `deviceCode` varchar(64) DEFAULT NULL COMMENT '设备编号',
  `channel` int(10) DEFAULT NULL COMMENT '设备通道  0为主机/控制器  >0为摄像机通道',
  `certifiedType` int(11) DEFAULT NULL COMMENT '证件类型',
  `certifiedNo` varchar(64) DEFAULT NULL COMMENT '证件号码',
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(64) DEFAULT NULL COMMENT '手机号码',
  `eventType` int(11) DEFAULT NULL COMMENT '事件类型',
  `eventTime` datetime DEFAULT NULL COMMENT '发生时间',
  `eventCode` int(11) DEFAULT NULL,
  `dataTime` datetime DEFAULT NULL COMMENT '数据接收时间',
  `certifiedTypeCode` int(1) DEFAULT NULL COMMENT '认证类型',
  `cardId` varchar(255) DEFAULT NULL COMMENT 'IC卡号',
  `picUrl` varchar(256) DEFAULT NULL COMMENT '传来的图片路径',
  `eventPicUrl` varchar(256) DEFAULT NULL,
  `personType` int(11) DEFAULT NULL COMMENT '人员类型',
  `visit` varchar(64) DEFAULT NULL COMMENT '访问人',
  `houseCode` varchar(255) DEFAULT NULL COMMENT '访问屋',
  `featureInfo` int(11) DEFAULT NULL COMMENT '特征信息',
  `similarity` int(11) DEFAULT NULL COMMENT '人脸对比结果比对相似度',
  `note` varchar(256) DEFAULT NULL COMMENT '消息备注',
  `lon` double DEFAULT NULL COMMENT '经度',
  `lat` double DEFAULT NULL COMMENT '纬度',
  `alt` double DEFAULT NULL COMMENT '高度',
  `floor` varchar(64) DEFAULT NULL COMMENT '楼层',
  `gisType` int(11) DEFAULT NULL,
  `infoSource` varchar(64) DEFAULT NULL,
  `alert` tinyint(1) DEFAULT '1' COMMENT ' 1-未报警 2-已报警\n  `alert` tinyint(1) DEFAULT ''1'' COMMENT ''1-未报警 2-已报警'',\n',
  `triggerTime` datetime DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `deviceId` (`deviceId`) USING BTREE,
  KEY `deviceCode` (`deviceCode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='出入口控制事件信息表';
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building` (
  `buildingId` int(30) NOT NULL AUTO_INCREMENT,
  `villageId` int(30) DEFAULT NULL COMMENT '小区id',
  `buildingCode` varchar(64) DEFAULT NULL COMMENT '楼栋编码',
  `buildingNo` varchar(64) DEFAULT NULL COMMENT '楼栋-单元编号',
  `floorTotal` int(10) DEFAULT NULL COMMENT '楼层数',
  `houseTotal` int(10) DEFAULT NULL COMMENT '户数',
  `Note` varchar(256) DEFAULT NULL COMMENT '描述',
  `lon` double(11,6) DEFAULT NULL,
  `lat` double(11,6) DEFAULT NULL,
  `alt` double(11,2) DEFAULT NULL,
  `gisArea` varchar(1024) DEFAULT NULL COMMENT '坐标',
  `gisType` tinyint(2) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`buildingId`),
  UNIQUE KEY `indexbuildingcode` (`buildingCode`) USING BTREE,
  KEY `indexvillageid` (`villageId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='楼栋信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `carId` int(30) NOT NULL AUTO_INCREMENT,
  `villageId` int(30) DEFAULT NULL COMMENT '小区id',
  `villageCode` varchar(64) DEFAULT NULL COMMENT '小区编码',
  `plateNo` varchar(64) DEFAULT NULL COMMENT '车牌号',
  `plateType` int(2) DEFAULT NULL COMMENT '车牌类型',
  `carType` int(11) DEFAULT NULL COMMENT '车辆类型',
  `peopleId` int(11) DEFAULT NULL COMMENT '人员编号',
  `name` varchar(64) DEFAULT NULL,
  `credentialType` int(2) DEFAULT NULL COMMENT '证件类型',
  `credentailNo` varchar(64) DEFAULT NULL,
  `contactTel` varchar(64) DEFAULT NULL COMMENT '联系电话',
  `enable` tinyint(1) DEFAULT '1' COMMENT '1 - 有效 0 - 无效',
  `set` text,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`carId`),
  KEY `villageId` (`villageId`) USING BTREE,
  KEY `villageCode` (`villageCode`) USING BTREE,
  KEY `peopleId` (`peopleId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,NULL,NULL,'浙A12345',1,1,NULL,NULL,111,NULL,NULL,1,'[{\"device\":\"000000000001\",\"channel\":1},{\"device\":\"000000000001\",\"channel\":2}]','2019-03-28 15:11:16',NULL);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `deviceId` int(30) NOT NULL AUTO_INCREMENT,
  `deviceCode` varchar(64) NOT NULL COMMENT '设备编号 填的编号',
  `deviceNumber` varchar(65) DEFAULT NULL COMMENT '自动生成的码',
  `deviceType` tinyint(1) DEFAULT NULL COMMENT '1-人脸抓拍 2-视频安防监控 3-USB防插拔 4-出入口控制 5-停车库 6-入侵和紧急报警 7-实时电子巡检 8-状态感知检测 9-状态采集检测',
  `deviceObjId` int(30) DEFAULT NULL COMMENT '设备对应的设备类型所属的表主键Id  比如 出入口控制对应entrance表的主键   停车库对应parking表的主键',
  `villageId` int(30) DEFAULT NULL COMMENT '设备对应的小区',
  `villageCode` varchar(64) DEFAULT NULL COMMENT '设备对应的小区',
  `lon` double(11,6) DEFAULT NULL,
  `lat` double(11,6) DEFAULT NULL,
  `alt` double(11,2) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `state` tinyint(1) DEFAULT '1' COMMENT '设备状态 1-可用 2-禁用',
  `floor` varchar(64) DEFAULT NULL,
  `gisType` tinyint(2) DEFAULT NULL,
  `gisArea` varchar(1024) DEFAULT NULL,
  `isHidden` tinyint(4) DEFAULT '0',
  `isCloudDevice` tinyint(1) DEFAULT '0',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`deviceId`),
  KEY `deviceCode` (`deviceCode`) USING BTREE,
  KEY `villageId` (`villageId`) USING BTREE,
  KEY `villageCode` (`villageCode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='设备表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (1,'20190222',NULL,5,1,1,'7b0b476d-5e5c-44af-a9f7-77a5e8f38f67',1.000000,1.000000,1.00,'测试','测试停车场01',1,'',1,NULL,0,0,'2019-03-28 14:52:30','2019-03-28 14:52:30'),(2,'e00000000001',NULL,4,NULL,1,'7b0b476d-5e5c-44af-a9f7-77a5e8f38f67',12.000000,12.000000,12.00,'','门禁测试01',1,'12',1,NULL,0,0,'2019-03-28 14:53:02',NULL),(3,'s00000000001',NULL,1,NULL,1,'7b0b476d-5e5c-44af-a9f7-77a5e8f38f67',1.000000,1.000000,1.00,'','人脸抓拍测试01',1,'1',1,NULL,0,0,'2019-03-28 14:53:35',NULL),(4,'AU20190328',NULL,3,NULL,1,'7b0b476d-5e5c-44af-a9f7-77a5e8f38f67',1.000000,1.000000,1.00,'','usb 测试01',1,'1',1,NULL,0,0,'2019-03-28 14:54:26',NULL),(5,'1101110',NULL,4,NULL,1,'7b0b476d-5e5c-44af-a9f7-77a5e8f38f67',121.521326,31.239704,1.00,'','福山路人行出入口',1,'1',1,NULL,0,0,'2019-04-07 13:47:11',NULL),(6,'r00001',NULL,1,NULL,1,'7b0b476d-5e5c-44af-a9f7-77a5e8f38f67',121.520307,31.240135,1.00,'','福山路大门出口',1,'1',1,NULL,0,0,'2019-04-07 17:49:39',NULL),(7,'r00002',NULL,1,NULL,1,'7b0b476d-5e5c-44af-a9f7-77a5e8f38f67',121.520272,31.240154,1.00,'','乳山路大门入口',1,'1',1,NULL,0,0,'2019-04-07 17:50:57',NULL),(8,'r00003',NULL,1,NULL,1,'7b0b476d-5e5c-44af-a9f7-77a5e8f38f67',121.502298,31.240146,1.00,'','栖霞路小门入口',1,'1',1,NULL,0,0,'2019-04-07 17:59:36',NULL),(9,'r00004','4f2037fa-2ca7-ef03-e1c3-4c4e8211a225',1,NULL,1,'7b0b476d-5e5c-44af-a9f7-77a5e8f38f67',121.553685,31.254680,1.00,'','栖霞路小门进',1,'1',1,NULL,0,0,'2019-04-09 11:48:44','2019-04-09 12:33:52'),(10,'20190409',NULL,5,2,1,'7b0b476d-5e5c-44af-a9f7-77a5e8f38f67',121.553682,31.256843,1.00,'福山路乳山路','车辆出入口',1,'1',1,NULL,0,0,'2019-04-09 11:51:27','2019-04-09 11:51:27'),(11,'r00005',NULL,1,NULL,1,'7b0b476d-5e5c-44af-a9f7-77a5e8f38f67',121.558732,30.476524,1.00,'','乳山路小门出口',1,'1',1,NULL,0,0,'2019-04-09 12:35:36',NULL),(12,'r00006',NULL,1,NULL,1,'7b0b476d-5e5c-44af-a9f7-77a5e8f38f67',121.556933,31.984223,2.00,'','栖霞路大门出口',1,'1',1,NULL,0,0,'2019-04-09 12:39:42',NULL),(13,'r00007',NULL,1,NULL,1,'7b0b476d-5e5c-44af-a9f7-77a5e8f38f67',121.559832,31.424466,2.00,'','乳山路小门进',1,'1',1,NULL,0,0,'2019-04-09 12:40:57',NULL),(14,'r00008',NULL,1,NULL,1,'7b0b476d-5e5c-44af-a9f7-77a5e8f38f67',121.558945,31.564323,2.00,'','栖霞路小门出口',1,'1',1,NULL,0,0,'2019-04-09 13:07:32',NULL),(15,'r00009',NULL,1,NULL,1,'7b0b476d-5e5c-44af-a9f7-77a5e8f38f67',121.558689,31.557589,2.00,'','乳山路大门出口',1,'1',1,NULL,0,0,'2019-04-09 13:08:25',NULL);
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrance`
--

DROP TABLE IF EXISTS `entrance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrance` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `villageCode` varchar(64) DEFAULT NULL,
  `villageId` int(30) DEFAULT NULL,
  `picUrl` varchar(255) DEFAULT NULL,
  `lon` double(11,6) DEFAULT NULL,
  `lat` double(11,6) DEFAULT NULL,
  `alt` double(11,2) DEFAULT NULL,
  `gisArea` varchar(1024) DEFAULT NULL COMMENT 'gisArea',
  `gisType` tinyint(2) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `villageId` (`villageId`) USING BTREE,
  KEY `villageCode` (`villageCode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='小区出入口表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrance`
--

LOCK TABLES `entrance` WRITE;
/*!40000 ALTER TABLE `entrance` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventImage`
--

DROP TABLE IF EXISTS `eventImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventImage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picData` text COMMENT 'base64图片数据',
  `event_id` int(30) NOT NULL COMMENT '事件id',
  `event_type` tinyint(1) NOT NULL COMMENT '事件类型',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventImage`
--

LOCK TABLES `eventImage` WRITE;
/*!40000 ALTER TABLE `eventImage` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faceIdentificationEvent`
--

DROP TABLE IF EXISTS `faceIdentificationEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faceIdentificationEvent` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `deviceId` varchar(255) DEFAULT NULL COMMENT '设备id',
  `deviceCode` varchar(64) DEFAULT NULL COMMENT '设备编号',
  `channel` int(10) DEFAULT NULL COMMENT '设备通道  0为主机/控制器  >0为摄像机通道',
  `credentialType` int(11) DEFAULT NULL COMMENT '证件类型 1-身份证、2-护照、3-港澳通行证 4-台湾居民来往大陆通行证',
  `credentialNo` varchar(64) DEFAULT NULL COMMENT '证件号码',
  `eventCode` int(11) DEFAULT NULL,
  `eventType` int(11) DEFAULT NULL COMMENT '事件类型',
  `eventTime` datetime DEFAULT NULL COMMENT '发生时间',
  `dataTime` datetime DEFAULT NULL COMMENT '数据接收时间',
  `localPicUrl` varchar(256) DEFAULT NULL COMMENT '本地图片路径',
  `picUrl` varchar(256) DEFAULT NULL COMMENT '传来的图片路径',
  `faceContrast` int(11) DEFAULT NULL COMMENT '人脸对比结果',
  `personCode` int(11) DEFAULT NULL COMMENT '人员类型',
  `featureInfo` int(11) DEFAULT NULL COMMENT '特征信息',
  `note` varchar(256) DEFAULT NULL COMMENT '消息备注',
  `lon` double DEFAULT NULL COMMENT '经度',
  `lat` double DEFAULT NULL COMMENT '纬度',
  `alt` double DEFAULT NULL COMMENT '高度',
  `floor` varchar(64) DEFAULT NULL COMMENT '楼层',
  `gisType` int(11) DEFAULT NULL,
  `infoSource` varchar(64) DEFAULT NULL,
  `alert` tinyint(1) DEFAULT '1' COMMENT '1-未报警 2-已报警',
  `count` int(11) DEFAULT NULL COMMENT '人脸数量',
  `target` varchar(1024) DEFAULT NULL COMMENT '目标坐标 json',
  `sub` tinyint(4) DEFAULT NULL COMMENT '1 子图片 0 全景图',
  `groupId` varchar(255) DEFAULT NULL COMMENT '图片集标签',
  `eventPicUrl` varchar(255) DEFAULT NULL COMMENT '图片标签',
  `similarity` int(10) DEFAULT NULL,
  `triggerTime` datetime DEFAULT NULL COMMENT '触发时间',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `deviceId` (`deviceId`) USING BTREE,
  KEY `deviceCode` (`deviceCode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='人脸抓拍系统事件信息表';
/*!40101 SET character_set_client = @saved_cs_client */;


-- Table structure for table `heartbeat_access`
--

DROP TABLE IF EXISTS `heartbeat_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heartbeat_access` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `deviceId` int(30) NOT NULL COMMENT '设备id',
  `deviceCode` varchar(64) NOT NULL COMMENT '设备编号',
  `heartTime` datetime NOT NULL COMMENT '心跳时间',
  `online` tinyint(4) NOT NULL COMMENT '是否在线 1-在线 2-不在线',
  `shield` tinyint(4) DEFAULT NULL COMMENT '是否屏蔽 1- 屏蔽 2-不屏蔽',
  `shieldTime` datetime DEFAULT NULL COMMENT '屏蔽时间',
  `shieldNumber` int(30) DEFAULT NULL COMMENT '屏蔽次数',
  `note` varchar(256) DEFAULT NULL COMMENT '备注信息',
  `lon` double NOT NULL COMMENT '经度',
  `lat` double NOT NULL COMMENT '纬度',
  `alt` double DEFAULT NULL,
  `floor` varchar(64) DEFAULT NULL COMMENT '楼层',
  `gisType` tinyint(1) NOT NULL COMMENT '坐标系代码 1-WGS84  2-CGC2000 3-BD09 4-GCJ02 5-西安80 6-北京54 7-其他',
  `infoSource` varchar(64) DEFAULT NULL COMMENT '信息来源',
  PRIMARY KEY (`id`),
  KEY `deviceId` (`deviceId`) USING BTREE,
  KEY `deviceCode` (`deviceCode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='出入口控制心跳表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heartbeat_access`
--

LOCK TABLES `heartbeat_access` WRITE;
/*!40000 ALTER TABLE `heartbeat_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `heartbeat_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heartbeat_emergency`
--

DROP TABLE IF EXISTS `heartbeat_emergency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heartbeat_emergency` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `deviceId` int(30) NOT NULL COMMENT '设备id',
  `deviceCode` varchar(64) NOT NULL COMMENT '设备编号',
  `heartTime` datetime NOT NULL COMMENT '心跳时间',
  `online` tinyint(4) NOT NULL COMMENT '是否在线 1-在线 2-不在线',
  `shield` tinyint(4) DEFAULT NULL COMMENT '是否屏蔽 1- 屏蔽 2-不屏蔽',
  `shieldTime` datetime DEFAULT NULL COMMENT '屏蔽时间',
  `shieldNumber` int(30) DEFAULT NULL COMMENT '屏蔽次数',
  `note` varchar(256) DEFAULT NULL COMMENT '备注信息',
  `lon` double NOT NULL COMMENT '经度',
  `lat` double NOT NULL COMMENT '纬度',
  `alt` double DEFAULT NULL,
  `floor` varchar(64) DEFAULT NULL COMMENT '楼层',
  `gisType` tinyint(1) NOT NULL COMMENT '坐标系代码 1-WGS84  2-CGC2000 3-BD09 4-GCJ02 5-西安80 6-北京54 7-其他',
  `infoSource` varchar(64) DEFAULT NULL COMMENT '信息来源',
  PRIMARY KEY (`id`),
  KEY `deviceId` (`deviceId`) USING BTREE,
  KEY `deviceCode` (`deviceCode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='入侵额紧急报警心跳表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heartbeat_emergency`
--

LOCK TABLES `heartbeat_emergency` WRITE;
/*!40000 ALTER TABLE `heartbeat_emergency` DISABLE KEYS */;
/*!40000 ALTER TABLE `heartbeat_emergency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heartbeat_face`
--

DROP TABLE IF EXISTS `heartbeat_face`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heartbeat_face` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `deviceId` int(30) NOT NULL COMMENT '设备id',
  `deviceCode` varchar(64) NOT NULL COMMENT '设备编号',
  `heartTime` datetime NOT NULL COMMENT '心跳时间',
  `online` tinyint(4) NOT NULL COMMENT '是否在线 1-在线 2-不在线',
  `shield` tinyint(4) DEFAULT NULL COMMENT '是否屏蔽 1- 屏蔽 2-不屏蔽',
  `shieldTime` datetime DEFAULT NULL COMMENT '屏蔽时间',
  `shieldNumber` int(30) DEFAULT NULL COMMENT '屏蔽次数',
  `note` varchar(256) DEFAULT NULL COMMENT '备注信息',
  `lon` double NOT NULL COMMENT '经度',
  `lat` double NOT NULL COMMENT '纬度',
  `alt` double DEFAULT NULL,
  `floor` varchar(64) DEFAULT NULL COMMENT '楼层',
  `gisType` tinyint(1) NOT NULL COMMENT '坐标系代码 1-WGS84  2-CGC2000 3-BD09 4-GCJ02 5-西安80 6-北京54 7-其他',
  `infoSource` varchar(64) DEFAULT NULL COMMENT '信息来源',
  PRIMARY KEY (`id`),
  KEY `deviceId` (`deviceId`) USING BTREE,
  KEY `deviceCode` (`deviceCode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='人脸抓拍心跳表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heartbeat_face`
--

LOCK TABLES `heartbeat_face` WRITE;
/*!40000 ALTER TABLE `heartbeat_face` DISABLE KEYS */;
/*!40000 ALTER TABLE `heartbeat_face` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heartbeat_parking`
--

DROP TABLE IF EXISTS `heartbeat_parking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heartbeat_parking` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `deviceId` int(30) NOT NULL COMMENT '设备id',
  `deviceCode` varchar(64) NOT NULL COMMENT '设备编号',
  `parkingName` varchar(64) DEFAULT NULL COMMENT '停车场名称',
  `parkCode` varchar(64) NOT NULL COMMENT '停车场编号',
  `address` varchar(64) DEFAULT NULL COMMENT '地址',
  `heartTime` datetime NOT NULL COMMENT '心跳时间',
  `online` tinyint(4) NOT NULL COMMENT '是否在线 1-在线 2-不在线',
  `shield` tinyint(4) DEFAULT NULL COMMENT '是否屏蔽 1- 屏蔽 2-不屏蔽',
  `shieldTime` datetime DEFAULT NULL COMMENT '屏蔽时间',
  `shieldNumber` int(30) DEFAULT NULL COMMENT '屏蔽次数',
  `totalParkingNumber` int(11) DEFAULT NULL COMMENT '总车位数',
  `remainingParkingNumber` int(11) DEFAULT NULL COMMENT '剩余车位数',
  `note` varchar(256) DEFAULT NULL COMMENT '备注信息',
  `lon` double NOT NULL COMMENT '经度',
  `lat` double NOT NULL COMMENT '纬度',
  `alt` double DEFAULT NULL,
  `floor` varchar(64) DEFAULT NULL COMMENT '楼层',
  `gisType` tinyint(1) NOT NULL COMMENT '坐标系代码 1-WGS84  2-CGC2000 3-BD09 4-GCJ02 5-西安80 6-北京54 7-其他',
  `infoSource` varchar(64) DEFAULT NULL COMMENT '信息来源',
  PRIMARY KEY (`id`),
  KEY `deviceId` (`deviceId`) USING BTREE,
  KEY `deviceCode` (`deviceCode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='停车场心跳表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heartbeat_parking`
--

LOCK TABLES `heartbeat_parking` WRITE;
/*!40000 ALTER TABLE `heartbeat_parking` DISABLE KEYS */;
/*!40000 ALTER TABLE `heartbeat_parking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heartbeat_powerbox`
--

DROP TABLE IF EXISTS `heartbeat_powerbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heartbeat_powerbox` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `PowerBoxId` varchar(30) NOT NULL COMMENT '设备编号',
  `PowerBoxCode` varchar(64) DEFAULT NULL COMMENT '电源箱编码 填的编码',
  `heartTime` datetime NOT NULL COMMENT '心跳时间',
  `online` tinyint(4) NOT NULL COMMENT '是否在线 1-在线 2-不在线',
  `temperature` varchar(50) DEFAULT NULL COMMENT '温度',
  `humidity` varchar(10) DEFAULT NULL COMMENT '湿度',
  `shield` tinyint(4) DEFAULT NULL COMMENT '是否屏蔽 1- 屏蔽 2-不屏蔽',
  `shieldTime` datetime DEFAULT NULL COMMENT '屏蔽时间',
  `shieldNumber` int(30) DEFAULT NULL COMMENT '屏蔽次数',
  `note` varchar(256) DEFAULT NULL COMMENT '备注信息',
  `lon` double DEFAULT NULL COMMENT '经度',
  `lat` double DEFAULT NULL COMMENT '纬度',
  `alt` double DEFAULT NULL,
  `floor` varchar(64) DEFAULT NULL COMMENT '楼层',
  `Lighting_V12` tinyint(4) DEFAULT NULL COMMENT '防雷器12 1- true 0-false',
  `Lighting_V24` tinyint(4) DEFAULT NULL COMMENT '防雷器24 1- true 0-false',
  `Lighting_V220` tinyint(4) DEFAULT NULL COMMENT '防雷器220 1- true 0-false',
  `Electrical_First` tinyint(4) DEFAULT NULL COMMENT '1- true 0-false',
  `Electrical_Second` tinyint(4) DEFAULT NULL COMMENT '1- true 0-false',
  `Electrical_Third` tinyint(4) DEFAULT NULL COMMENT '1- true 0-false',
  `Electrical_Fourth` tinyint(4) DEFAULT NULL COMMENT '1- true 0-false',
  `V_12` varchar(10) DEFAULT NULL COMMENT '电压12v',
  `V_24` varchar(10) DEFAULT NULL COMMENT '电压24v',
  `V_220` varchar(10) DEFAULT NULL COMMENT '电压220v',
  PRIMARY KEY (`id`),
  KEY `PowerBoxId` (`PowerBoxId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='更新心跳表';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `heartbeat_usb`
--

DROP TABLE IF EXISTS `heartbeat_usb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heartbeat_usb` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `deviceId` int(30) NOT NULL COMMENT '设备id',
  `deviceCode` varchar(64) NOT NULL COMMENT '设备编号',
  `heartTime` datetime NOT NULL COMMENT '心跳时间',
  `online` tinyint(4) NOT NULL COMMENT '是否在线 1-在线 2-不在线',
  `shield` tinyint(4) DEFAULT NULL COMMENT '是否屏蔽 1- 屏蔽 2-不屏蔽',
  `shieldTime` datetime DEFAULT NULL COMMENT '屏蔽时间',
  `shieldNumber` int(30) DEFAULT NULL COMMENT '屏蔽次数',
  `note` varchar(256) DEFAULT NULL COMMENT '备注信息',
  `lon` double NOT NULL COMMENT '经度',
  `lat` double NOT NULL COMMENT '纬度',
  `alt` double DEFAULT NULL,
  `floor` varchar(64) DEFAULT NULL COMMENT '楼层',
  `gisType` tinyint(1) NOT NULL COMMENT '坐标系代码 1-WGS84  2-CGC2000 3-BD09 4-GCJ02 5-西安80 6-北京54 7-其他',
  `infoSource` varchar(64) DEFAULT NULL COMMENT '信息来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='USB防插拔心跳表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heartbeat_usb`
--

LOCK TABLES `heartbeat_usb` WRITE;
/*!40000 ALTER TABLE `heartbeat_usb` DISABLE KEYS */;
/*!40000 ALTER TABLE `heartbeat_usb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heartbeat_video`
--

DROP TABLE IF EXISTS `heartbeat_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heartbeat_video` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `deviceId` int(30) NOT NULL COMMENT '设备id',
  `deviceCode` varchar(64) NOT NULL COMMENT '设备编号',
  `heartTime` datetime NOT NULL COMMENT '心跳时间',
  `online` tinyint(4) NOT NULL COMMENT '是否在线 1-在线 2-不在线',
  `shield` tinyint(4) DEFAULT NULL COMMENT '是否屏蔽 1- 屏蔽 2-不屏蔽',
  `shieldTime` datetime DEFAULT NULL COMMENT '屏蔽时间',
  `shieldNumber` int(30) DEFAULT NULL COMMENT '屏蔽次数',
  `note` varchar(256) DEFAULT NULL COMMENT '备注信息',
  `lon` double NOT NULL COMMENT '经度',
  `lat` double NOT NULL COMMENT '纬度',
  `alt` double DEFAULT NULL,
  `floor` varchar(64) DEFAULT NULL COMMENT '楼层',
  `gisType` tinyint(1) NOT NULL COMMENT '坐标系代码 1-WGS84  2-CGC2000 3-BD09 4-GCJ02 5-西安80 6-北京54 7-其他',
  `infoSource` varchar(64) DEFAULT NULL COMMENT '信息来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='视频安防监控心跳表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heartbeat_video`
--

LOCK TABLES `heartbeat_video` WRITE;
/*!40000 ALTER TABLE `heartbeat_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `heartbeat_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `house` (
  `houseId` int(30) NOT NULL AUTO_INCREMENT,
  `villageId` int(30) DEFAULT NULL COMMENT '小区id',
  `buildingId` int(30) DEFAULT NULL COMMENT '楼栋id',
  `floor` varchar(64) DEFAULT NULL COMMENT '楼层编号',
  `houseNo` varchar(64) DEFAULT NULL COMMENT '房屋编号',
  `houseCode` varchar(64) DEFAULT NULL COMMENT '房屋编码',
  `houseLabelId` int(30) DEFAULT NULL COMMENT '房屋类别',
  `housePurposeId` int(30) DEFAULT NULL COMMENT '房屋用途',
  `houseArea` float(30,2) DEFAULT NULL COMMENT '房屋面积',
  `peopleNumber` int(10) DEFAULT NULL COMMENT '最大居住人数',
  `Note` varchar(256) DEFAULT NULL COMMENT '描述',
  `lon` double(11,6) DEFAULT NULL,
  `lat` double(11,6) DEFAULT NULL,
  `alt` double(11,2) DEFAULT NULL,
  `gisType` int(1) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`houseId`),
  UNIQUE KEY `indexhousecode` (`houseCode`) USING BTREE,
  KEY `indexvillageid` (`villageId`) USING BTREE,
  KEY `indexbuildingid` (`buildingId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house`
--

LOCK TABLES `house` WRITE;
/*!40000 ALTER TABLE `house` DISABLE KEYS */;
/*!40000 ALTER TABLE `house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intrusionEmergencyEvent`
--

DROP TABLE IF EXISTS `intrusionEmergencyEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intrusionEmergencyEvent` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `deviceId` int(30) NOT NULL COMMENT '设备id',
  `deviceCode` varchar(64) NOT NULL COMMENT '设备编号',
  `channel` int(10) NOT NULL COMMENT '设备通道  0为主机/控制器  >0为防区号',
  `eventSystem` int(11) NOT NULL COMMENT '事件系统  周界 入侵探测 报警等',
  `eventType` int(10) NOT NULL COMMENT '事件类型',
  `eventTime` datetime NOT NULL COMMENT '发生时间',
  `dataTime` datetime NOT NULL COMMENT '数据接收时间',
  `relPerson` varchar(64) DEFAULT NULL COMMENT '关联对象',
  `dealPerson` varchar(64) DEFAULT NULL COMMENT '处置人员',
  `note` varchar(256) DEFAULT NULL COMMENT '备注信息',
  `lon` double NOT NULL COMMENT '经度',
  `lat` double NOT NULL COMMENT '纬度',
  `alt` double DEFAULT NULL COMMENT '高度',
  `floor` varchar(64) DEFAULT NULL COMMENT '楼层',
  `gisType` int(11) NOT NULL,
  `infoSource` varchar(64) DEFAULT NULL,
  `alert` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-未报警 2-已报警',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `deviceId` (`deviceId`) USING BTREE,
  KEY `deviceCode` (`deviceCode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='入侵和紧急报警事件信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intrusionEmergencyEvent`
--

LOCK TABLES `intrusionEmergencyEvent` WRITE;
/*!40000 ALTER TABLE `intrusionEmergencyEvent` DISABLE KEYS */;
/*!40000 ALTER TABLE `intrusionEmergencyEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitorImage`
--

DROP TABLE IF EXISTS `monitorImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitorImage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picData` text COMMENT 'base64图片数据',
  `picUrl` varchar(256) DEFAULT NULL COMMENT '图片地址',
  `event_id` int(30) DEFAULT NULL COMMENT '事件Id',
  `event_type` tinyint(1) DEFAULT NULL COMMENT '事件类型',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='布控图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitorImage`
--

LOCK TABLES `monitorImage` WRITE;
/*!40000 ALTER TABLE `monitorImage` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitorImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking`
--

DROP TABLE IF EXISTS `parking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `villageId` int(30) DEFAULT NULL,
  `villageCode` varchar(64) DEFAULT NULL,
  `parkCode` varchar(64) DEFAULT NULL COMMENT '停车场编号',
  `parkName` varchar(255) DEFAULT NULL COMMENT '停车场名称',
  `parkNum` int(20) DEFAULT NULL COMMENT '车位数量',
  `address` varchar(255) DEFAULT NULL,
  `note` varchar(256) DEFAULT NULL COMMENT '备注',
  `lon` double(11,6) DEFAULT NULL,
  `lat` double(11,6) DEFAULT NULL,
  `alt` double(11,2) DEFAULT NULL,
  `floor` varchar(64) DEFAULT NULL,
  `gisArea` varchar(1024) DEFAULT NULL,
  `gisType` tinyint(2) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `villageId` (`villageId`) USING BTREE,
  KEY `villageCode` (`villageCode`) USING BTREE,
  KEY `parkCode` (`parkCode`) USING BTREE,
  KEY `parkName` (`parkName`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='停车库表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking`
--

LOCK TABLES `parking` WRITE;
/*!40000 ALTER TABLE `parking` DISABLE KEYS */;
INSERT INTO `parking` VALUES (1,1,'7b0b476d-5e5c-44af-a9f7-77a5e8f38f67',NULL,'测试',10000,'测试','测试停车场01',1.000000,1.000000,1.00,'',NULL,1,'2019-03-28 14:52:30',NULL),(2,1,'7b0b476d-5e5c-44af-a9f7-77a5e8f38f67',NULL,'市新小区',400,'福山路乳山路','车辆出入口',121.553682,31.256843,1.00,'1',NULL,1,'2019-04-09 11:51:27',NULL);
/*!40000 ALTER TABLE `parking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parkingEvent`
--

DROP TABLE IF EXISTS `parkingEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parkingEvent` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `deviceId` varchar(255) DEFAULT NULL,
  `deviceCode` varchar(64) DEFAULT NULL,
  `channel` int(10) DEFAULT NULL COMMENT '设备通道',
  `plateNo` varchar(64) DEFAULT NULL COMMENT '车牌号',
  `plateCode` int(10) DEFAULT NULL COMMENT '车牌类型',
  `plateColor` varchar(255) DEFAULT NULL COMMENT '车牌颜色',
  `carCode` int(10) DEFAULT NULL COMMENT '车辆类型',
  `licenseColor` int(10) DEFAULT NULL COMMENT '车牌颜色',
  `entranceCode` varchar(255) DEFAULT NULL,
  `entranceTime` datetime DEFAULT NULL COMMENT '进出场时间',
  `eventType` int(11) DEFAULT NULL,
  `eventCode` varchar(255) DEFAULT NULL,
  `eventPicUrl` varchar(255) DEFAULT NULL COMMENT '全景图片',
  `platePic` varchar(255) DEFAULT NULL COMMENT '车牌图片',
  `imageCredibility` int(10) DEFAULT NULL COMMENT '图片可信度',
  `drivingPersonnel` varchar(64) DEFAULT NULL COMMENT '驾乘人员',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `lon` double(11,6) DEFAULT NULL COMMENT '经度',
  `lat` double(11,6) DEFAULT NULL COMMENT '纬度',
  `alt` double(11,2) DEFAULT NULL COMMENT '高度',
  `floor` varchar(64) DEFAULT NULL COMMENT '楼层',
  `gisType` int(10) DEFAULT NULL COMMENT '坐标系代码',
  `infoSource` varchar(64) DEFAULT NULL COMMENT '信息来源',
  `similarity` int(30) DEFAULT NULL COMMENT '识别可信度',
  `alert` tinyint(1) DEFAULT '1' COMMENT ' 1-未报警 2-已报警\n',
  `triggerTime` datetime DEFAULT NULL COMMENT '触发时间',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `diviceId` (`deviceId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=571 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parkingEvent`
--

LOCK TABLES `parkingEvent` WRITE;
/*!40000 ALTER TABLE `parkingEvent` DISABLE KEYS */;
INSERT INTO `parkingEvent` VALUES (1,'1','20190222',1,'苏B92912',1,'2',5,NULL,'25aca05c-ab23-4ddc-a274-6d9208ea6066',NULL,NULL,'7','/image/get?name=parking/b88685bc39352c39ec7ecfb8bb4f3a01.jpg','/image/get?name=parking/5b0588c490b464611fa53102a296ad9d.jpg',NULL,NULL,'车辆入场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-03-28 15:09:52','2019-03-28 15:09:55',NULL),(2,'10','20190409',2,'闽JE3231',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/6a973d0f4642a9c4804531aed06c6d61.jpg','/image/get?name=parking/78bb688c43f1e05f61bc51b71820a989.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 12:15:04','2019-04-09 12:07:57',NULL),(3,'10','20190409',2,'贵HN1807',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c2e62acff859722ca4cc46fa4a7f0a36.jpg','/image/get?name=parking/01a8902e723b1dcbbcb21660cb05f66e.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 12:23:55','2019-04-09 12:16:48',NULL),(4,'10','20190409',2,'豫BA0028',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9a168c604d938e65593aa3241a45191c.jpg','/image/get?name=parking/9a196b487e208943647dbd8c409cf048.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,67,1,'2019-04-09 12:33:58','2019-04-09 12:26:52',NULL),(5,'10','20190409',2,'粤A00281',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/992d4d628bcde11ad16b0026c9651799.jpg','/image/get?name=parking/4cd354f2c1168fc2fdadcece18276376.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,78,1,'2019-04-09 12:42:33','2019-04-09 12:35:24',NULL),(6,'10','20190409',2,'沪AFL213',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ff79b9fc667aff115dbf23c021e14ccc.jpg','/image/get?name=parking/c45f902ee05c2b408fe8c84d8278409c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 12:57:45','2019-04-09 12:50:27',NULL),(7,'10','20190409',2,'沪A71K97',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/1b2b423ac18413a7a78cf0ab7c9b2070.jpg','/image/get?name=parking/ea5a2e08574de8c1c1aa4a0a2d6ac29f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-09 12:58:14','2019-04-09 12:50:56',NULL),(8,'10','20190409',2,'沪A507N5',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/db4373e79d315867fa741efad57bb45e.jpg','/image/get?name=parking/b51147a3f5d764d8ea2264cc7a946bd8.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,92,1,'2019-04-09 12:58:32','2019-04-09 12:51:14',NULL),(9,'10','20190409',2,'苏NLC406',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/adb3dbdc67bed836dd2020e22af9ea22.jpg','/image/get?name=parking/30083d2ced59ab1e3fdf6c368291a8a4.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,85,1,'2019-04-09 13:12:16','2019-04-09 13:04:56',NULL),(10,'10','20190409',2,'沪A5J993',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9c1d86202bc9fb58f1f6b8edaf1a9c4f.jpg','/image/get?name=parking/ecf633cbfba4eb28b6f88024972ca399.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-09 13:20:29','2019-04-09 13:13:07',NULL),(11,'10','20190409',2,'沪EG1525',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a13da390d2e255346a838db512e24ad2.jpg','/image/get?name=parking/f0b4d1dea2afceb0c43ebc091b60659c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 13:31:20','2019-04-09 13:23:58',NULL),(12,'10','20190409',2,'苏F3733K',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7c1d50454ac685287cbbaffc005700ec.jpg','/image/get?name=parking/e24088274b0f6649232d0e48e9e58f42.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 13:35:49','2019-04-09 13:28:25',NULL),(13,'10','20190409',2,'苏K9639V',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7d9609614aafcf849c094d4bedac1bd8.jpg','/image/get?name=parking/aae4e5002de4b32f4e2f3154865729b7.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 13:37:25','2019-04-09 13:30:02',NULL),(14,'10','20190409',2,'苏KJ918R',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2d527bf974c4e3072144d9d3c9d1917e.jpg','/image/get?name=parking/3e151f2bd9ee4df2f5b70f7c821fad4c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-09 13:42:27','2019-04-09 13:35:02',NULL),(15,'10','20190409',2,'沪FB1768',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b7d27d20808adaf8d7910ed274224f98.jpg','/image/get?name=parking/aefeb22a0734630184f8960fd27262d6.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 13:45:46','2019-04-09 13:38:21',NULL),(16,'10','20190409',2,'冀A2CC97',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c54865179f3889444430bcc426b40605.jpg','/image/get?name=parking/8a9139f958080882e9f8a1c2c2f6c9c5.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 13:46:14','2019-04-09 13:38:49',NULL),(17,'10','20190409',2,'鲁NAQ622',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/0819d1acd2136227698abe2905e0c7db.jpg','/image/get?name=parking/15a1e8a886b16e538b9c9ffa7a10408d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-09 13:52:22','2019-04-09 13:44:57',NULL),(18,'10','20190409',2,'沪DL2398',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/5a642e68731f2cb6351d495ebd52f9ab.jpg','/image/get?name=parking/64dc7be1b9a427cc77f358300b2c3c15.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 14:08:05','2019-04-09 14:00:37',NULL),(19,'10','20190409',2,'沪GU8746',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/3d29982919b7f9e62005d362cc3112e4.jpg','/image/get?name=parking/ae21b830aa41ccf87b337558d1e59971.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 14:08:46','2019-04-09 14:01:18',NULL),(20,'10','20190409',2,'沪L75033',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/040cff857ccebffe75024a1c8f319553.jpg','/image/get?name=parking/8a1473f3e7c3511ab29b866a94be8ae3.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 14:09:44','2019-04-09 14:02:15',NULL),(21,'10','20190409',2,'沪ASZ180',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ec229f582898fb1b06c1f856bc7498a1.jpg','/image/get?name=parking/f29430f287c0364f443de301e8788c9e.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 14:26:54','2019-04-09 14:19:23',NULL),(22,'10','20190409',2,'沪ES0277',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ad9b33a12688f81ef91fabe3b0c7fa58.jpg','/image/get?name=parking/8732a25fc3834f7c71d428cc960c1c5f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 14:47:50','2019-04-09 14:40:16',NULL),(23,'10','20190409',2,'浙B9R661',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d3eab4d4e9551165a721e643afbf18be.jpg','/image/get?name=parking/e0a726fbdb24dafe81743a0fd666d8ef.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 14:48:26','2019-04-09 14:40:53',NULL),(24,'10','20190409',2,'苏E592MM',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/204f2b32213a4ab79409705e75185379.jpg','/image/get?name=parking/d98d65f580accfa9ac10b3d1c5029f08.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 15:23:20','2019-04-09 15:15:41',NULL),(25,'10','20190409',2,'沪B107G6',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2782f05f6d1806f4c01ea9d8743176e0.jpg','/image/get?name=parking/6e2328e10be6f18605edd5d713479bc6.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 15:30:42','2019-04-09 15:23:02',NULL),(26,'10','20190409',2,'沪BRE065',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c042a2ff95d8e00199f3044670b05003.jpg','/image/get?name=parking/355c242e497d15a85a43fc45a7fab8ac.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 15:32:12','2019-04-09 15:24:32',NULL),(27,'10','20190409',2,'沪ALN508',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/742ca8c784746bac5e50b4c5cacb31ce.jpg','/image/get?name=parking/4392f69a1db714dce2e4c1209eb7f8bc.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 15:36:09','2019-04-09 15:28:28',NULL),(28,'10','20190409',2,'沪GU5391',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/994557f5553543627825e1b7a1f73a21.jpg','/image/get?name=parking/8b2e2c1001413b71683f5d1fb9c02333.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 15:41:29','2019-04-09 15:33:48',NULL),(29,'10','20190409',2,'沪EG1525',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/fe3dcd9dcb09a61d8bdadaaad4b4e746.jpg','/image/get?name=parking/c514b11e255ab2eb5aadf1cf463f00e3.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 15:42:04','2019-04-09 15:34:23',NULL),(30,'10','20190409',2,'皖NGR683',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d0d99d100f0b5d9b7962781e75760d2d.jpg','/image/get?name=parking/c7ed4249d56fcb5325b15939238a2977.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 15:54:48','2019-04-09 15:47:05',NULL),(31,'10','20190409',2,'沪N27096',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f4b1e49cd8afad33b8a18f8afcb08158.jpg','/image/get?name=parking/b52c246b1645152b78b422c935949dc2.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-09 16:04:55','2019-04-09 15:57:10',NULL),(32,'10','20190409',2,'沪DL2398',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/e7efe3b9f9a174190f7ab22805fa6e89.jpg','/image/get?name=parking/11bc6e7d3e56015af9bff130a611295d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-09 16:06:01','2019-04-09 15:58:17',NULL),(33,'10','20190409',2,'沪B6G376',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/adef374191edd39347fd86b4dc2b5f96.jpg','/image/get?name=parking/7c8bac2708680fa1f8afdc69fe29cff9.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 16:11:30','2019-04-09 16:03:44',NULL),(34,'10','20190409',2,'苏EL3C67',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/5109ba165b246728250edde680543f29.jpg','/image/get?name=parking/e228bb87598323cbcaf9caaf5b926f84.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 16:12:01','2019-04-09 16:04:15',NULL),(35,'10','20190409',2,'皖A8D524',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f54c7f807bc7c9f00b578edd3b563a20.jpg','/image/get?name=parking/502d075d15a96a374085c51fe48516dc.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-09 16:16:54','2019-04-09 16:09:08',NULL),(36,'10','20190409',2,'沪M58852',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/767216f7c79fe1c61917499ac9b950a8.jpg','/image/get?name=parking/40510a00ef3da69d64dccfb040ff8ef2.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 16:17:07','2019-04-09 16:09:21',NULL),(37,'10','20190409',2,'沪JC5697',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/552559065b7783665f040696eac4a9b6.jpg','/image/get?name=parking/2d7c20ee8d32229c95ddf60baa50ea03.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-09 16:22:57','2019-04-09 16:15:10',NULL),(38,'10','20190409',2,'沪A8G291',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/fb039f74a10058ca92fef594294b4258.jpg','/image/get?name=parking/d49ccd158d36d4c35e631c9ba9c4a83d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 16:35:46','2019-04-09 16:27:58',NULL),(39,'10','20190409',2,'沪EJ2689',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b8e0ef6a31baea6cb7c5a3c9f66e11cd.jpg','/image/get?name=parking/b5a97b3799167a08507b5d8669d16cc7.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 16:36:50','2019-04-09 16:29:01',NULL),(40,'10','20190409',2,'苏C8703K',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b9d2a17e00b58f2b6c4f9a03d545bbaf.jpg','/image/get?name=parking/5c15ba358f4e0902d1b2c056aa288966.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 16:58:16','2019-04-09 16:50:24',NULL),(41,'10','20190409',2,'沪A008Q9',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ee6ee2323aa82cf6c569d9d25f6f88a2.jpg','/image/get?name=parking/8811147c0db7170d4499315b338360f5.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,89,1,'2019-04-09 17:01:08','2019-04-09 16:53:16',NULL),(42,'10','20190409',2,'沪G75617',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7aa71747ba016b3a237759c918c188fa.jpg','/image/get?name=parking/f640800c586ad147047dab70d1c26e94.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 17:14:00','2019-04-09 17:06:06',NULL),(43,'10','20190409',2,'沪BLD252',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b7a31f46bf1947e9733f02296ef56a39.jpg','/image/get?name=parking/3ef38b411ab488648c875adbc9511c47.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 17:14:43','2019-04-09 17:06:49',NULL),(44,'10','20190409',2,'沪B59D86',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/aa4539ca1a9097f22bb01d5657920b07.jpg','/image/get?name=parking/7197b02a9621abe47f39ec23888a3c5e.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 17:15:40','2019-04-09 17:07:45',NULL),(45,'10','20190409',2,'皖DBE166',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/4518c97226e5e84d0f68cecf6f9cb893.jpg','/image/get?name=parking/abbb85960e5ba70de8210cc35e0f6b9e.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-09 17:20:48','2019-04-09 17:12:53',NULL),(46,'10','20190409',2,'浙AR3S29',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c2e5fb9c7cdc337593a675b7d8cd2265.jpg','/image/get?name=parking/ad716c70c3381eb940125a4e17fbd085.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 17:25:07','2019-04-09 17:17:12',NULL),(47,'10','20190409',2,'沪A1K308',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9a48a7b68bcff2db8794a921dc19a2dd.jpg','/image/get?name=parking/5f59ed017a33248f1dc78dcec3221074.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 17:32:47','2019-04-09 17:24:50',NULL),(48,'10','20190409',2,'沪BLZ562',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/1f907770227233f6a505734c7820bcd4.jpg','/image/get?name=parking/c76575dd62910b6b550071ad766ecb3a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 17:33:25','2019-04-09 17:25:28',NULL),(49,'10','20190409',2,'沪B9A669',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ed417324f88e3726d739160c5605ac91.jpg','/image/get?name=parking/c68b488335bc964b900f6351081c18f8.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 17:37:00','2019-04-09 17:29:02',NULL),(50,'10','20190409',2,'沪B107G6',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/10fbdea6212c190b44ce6a5487aa2197.jpg','/image/get?name=parking/ba42fcd3189a5b9c9ad25f5e704ad66c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 17:43:01','2019-04-09 17:35:03',NULL),(51,'10','20190409',2,'沪AFL059',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/278c6ede206ca232a93fc46eb4197938.jpg','/image/get?name=parking/bb3523da931b3e7d855962b433e0e6e3.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 17:53:58','2019-04-09 17:45:58',NULL),(52,'10','20190409',2,'冀GEU329',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/e9ce92b5520a326655ec5a916d02555b.jpg','/image/get?name=parking/cc1549c15dfa98de78c1df6fb4e2cf86.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 18:35:02','2019-04-09 18:26:57',NULL),(53,'10','20190409',2,'苏KXJ616',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b1902737bbb3fd56c94755ba8cbea8b8.jpg','/image/get?name=parking/9aae42af7639536e92d416ed0a52b650.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,85,1,'2019-04-09 18:35:22','2019-04-09 18:27:17',NULL),(54,'10','20190409',2,'沪L69255',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/38f5545f6125c98da5ca2389a286de1a.jpg','/image/get?name=parking/bd842dd18f665b8df28f8fa118646bf8.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 18:44:17','2019-04-09 18:36:10',NULL),(55,'10','20190409',2,'苏JZD505',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9a6bc2a9b3d4cd2389498efbba49be74.jpg','/image/get?name=parking/c73889a41354d586edc24302d7ac3fbc.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 18:45:55','2019-04-09 18:37:48',NULL),(56,'10','20190409',2,'沪B0N591',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b5c471d02f541fed7dc8597cc55dfddf.jpg','/image/get?name=parking/66224834f9321d1c9ce68e5eea72c3f2.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 18:48:27','2019-04-09 18:40:20',NULL),(57,'10','20190409',2,'沪GT8687',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c3a810fe8b658d9e7f95c1f9252cf82c.jpg','/image/get?name=parking/1e6589be6f338d65cd76c0bdfb2583a0.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 18:50:21','2019-04-09 18:42:13',NULL),(58,'10','20190409',2,'沪A369V3',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9bbb7c61f4a6308c2055b2c0777957d7.jpg','/image/get?name=parking/62b97bc7ee265d1bff2506a0aea79bd3.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-09 18:52:27','2019-04-09 18:44:19',NULL),(59,'10','20190409',2,'浙G62953',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a14296325f86fb545773ff226443f91b.jpg','/image/get?name=parking/12cc538e4156c8197dd9af9534d65a4a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 18:58:31','2019-04-09 18:50:22',NULL),(60,'10','20190409',2,'沪A570Q9',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/213753148833cffef6618b0cb7424094.jpg','/image/get?name=parking/614da83a6912fbe821fd746d16ecbed2.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-09 19:00:58','2019-04-09 18:52:49',NULL),(61,'10','20190409',2,'苏D78E12',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7dfb352b62e4f2e92b6f3ccb25195321.jpg','/image/get?name=parking/a307f0785239bd7b15020b5f81e58121.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-09 19:04:20','2019-04-09 18:56:11',NULL),(62,'10','20190409',2,'沪AVN718',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/29c9d4d256286810c00c1c51e65c47bf.jpg','/image/get?name=parking/8a01e6e20871e618dce2e5d043a7f35f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 19:08:57','2019-04-09 19:00:47',NULL),(63,'10','20190409',2,'沪B765K7',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/8d27953044d4d7b48debf2bba126e662.jpg','/image/get?name=parking/44edadff6553d69c93f9f29e7c1a5d81.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 19:10:08','2019-04-09 19:01:57',NULL),(64,'10','20190409',2,'闽JP6088',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/99277972a1a9cb219cdd88e038530d5c.jpg','/image/get?name=parking/4f746b7e00a6526d9a18240725336c21.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,92,1,'2019-04-09 19:10:18','2019-04-09 19:02:08',NULL),(65,'10','20190409',2,'沪G02551',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2d7fcb7defff2962f49fd3182484d5da.jpg','/image/get?name=parking/35b7fd1886440ce74d5bbe115c9a0caf.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-09 19:10:40','2019-04-09 19:02:30',NULL),(66,'10','20190409',2,'沪J69360',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b665d52313aa45c36b58d868744ca3c4.jpg','/image/get?name=parking/628146ec49d7a0c64575848289555482.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-09 19:11:50','2019-04-09 19:03:39',NULL),(67,'10','20190409',2,'沪B6G376',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/3c38c27cf60eed2c0619f622def90889.jpg','/image/get?name=parking/69c60820789ed5daed94c937499e930b.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-09 19:40:04','2019-04-09 19:31:50',NULL),(68,'10','20190409',2,'皖S2E516',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b0bf91c8dcfeea83e3adcc5f58dc7f5b.jpg','/image/get?name=parking/613878aaf11801118d584cd1c3ec948b.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-09 19:46:29','2019-04-09 19:38:14',NULL),(69,'10','20190409',2,'沪B9A669',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7a8495a42fba0487f5884ae55d9fb016.jpg','/image/get?name=parking/c727e94056880f9e6fd46994a1f2da08.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 19:57:22','2019-04-09 19:49:05',NULL),(70,'10','20190409',2,'沪AWB975',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/fa502e587490980b9fa2f93d4d527fa3.jpg','/image/get?name=parking/8bed70759635dc65f1ca4d56164e2768.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 20:07:01','2019-04-09 19:58:42',NULL),(71,'10','20190409',2,'苏BM569N',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/70627b0ca730987a6330311d40ec0423.jpg','/image/get?name=parking/860d18437cc12cb9a3090f39d1248618.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,75,1,'2019-04-09 20:16:31','2019-04-09 20:08:11',NULL),(72,'10','20190409',2,'沪A8X862',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a81daa063da879daf81a42f8ca8858c6.jpg','/image/get?name=parking/4362d66d92fb7d10e3a9afbfecdc0087.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,89,1,'2019-04-09 20:54:52','2019-04-09 20:46:27',NULL),(73,'10','20190409',2,'沪A093V8',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/02f7e62e99d09db1dd0eeb1f5bec92e0.jpg','/image/get?name=parking/2ad8c0ff27b3b7b1d808a04702b7b7b0.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 20:55:01','2019-04-09 20:46:35',NULL),(74,'10','20190409',2,'苏N379X7',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/dd43d94dc2279da6de67b925719255b6.jpg','/image/get?name=parking/32d2e09563a8fda26170a07fe276a00a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 20:56:03','2019-04-09 20:47:37',NULL),(75,'10','20190409',2,'沪BGL222',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/5bcce4443f55dd3490cf011aa710a7b5.jpg','/image/get?name=parking/e5a7826437e572c30fb37edf5139dc76.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-09 21:02:41','2019-04-09 20:54:14',NULL),(76,'10','20190409',2,'沪B6G376',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d937811a8d2d4dc0cccec69f6cb7491d.jpg','/image/get?name=parking/c5d78def2f13df198af7ba35dc7ebddd.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 21:13:55','2019-04-09 21:05:27',NULL),(77,'10','20190409',2,'沪BVN716',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/68f4681fc2dce7065b323c15dfb6eab6.jpg','/image/get?name=parking/e92d5e69fe57342e56a08ce4b84c8d8c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 21:19:09','2019-04-09 21:10:40',NULL),(78,'10','20190409',2,'川A0BE15',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/73bc60e7c12291a69f4e0250f69d622b.jpg','/image/get?name=parking/d9c039c79ca89ae7a067090c8c601a78.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,89,1,'2019-04-09 21:19:19','2019-04-09 21:10:50',NULL),(79,'10','20190409',2,'浙GDS191',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/80e23e7d6addd85468664075f5e2be23.jpg','/image/get?name=parking/2433a512c20cdf6b57582f96802c6565.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 21:21:48','2019-04-09 21:13:19',NULL),(80,'10','20190409',2,'沪EG8666',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/aa1ec1445d9cf87f5c3c212b973109f9.jpg','/image/get?name=parking/60c802138f13faab73a594e179d01596.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 21:27:53','2019-04-09 21:19:23',NULL),(81,'10','20190409',2,'苏J9Y256',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b46838b5e907224a0be492fe7c9c9a36.jpg','/image/get?name=parking/3fdbb5922c3fadb611b0d243d1750b95.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,82,1,'2019-04-09 21:42:48','2019-04-09 21:34:16',NULL),(82,'10','20190409',2,'沪FE9137',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/59da94cb2b286230b01d52067ff1650e.jpg','/image/get?name=parking/4bb537167a9eb7c9ff008c3c7eb628c7.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-09 22:33:14','2019-04-09 22:24:34',NULL),(83,'10','20190409',2,'豫S60T89',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a07ba903406fc7ec03505e76fe89ac9f.jpg','/image/get?name=parking/9b4b30e22bf19571380cd649f766e2cc.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,92,1,'2019-04-10 00:12:28','2019-04-10 00:03:35',NULL),(84,'10','20190409',2,'沪GU7100',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/34b4aec21b8a1fa8e6a972c5c21e30f8.jpg','/image/get?name=parking/02c4a4a8f9ee7d75999516145786f4f8.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 03:36:24','2019-04-10 03:27:02',NULL),(85,'10','20190409',2,'沪B6B675',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d65c698589474f65db58e4b7f344aede.jpg','/image/get?name=parking/e18ebcf7eafe5ecf3af432be863c9d40.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 05:46:24','2019-04-10 05:36:44',NULL),(86,'10','20190409',2,'沪BMT989',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b63143ce0ead6e014e0279fb0616a360.jpg','/image/get?name=parking/b47a269427b3333c239860291ea0626d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 06:00:42','2019-04-10 05:51:00',NULL),(87,'10','20190409',2,'沪B6G376',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/90355b9e2e33601aeab9fecd0c781390.jpg','/image/get?name=parking/f06e225c5108edd7b96ccf8a61c26a25.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 06:15:01','2019-04-10 06:05:17',NULL),(88,'10','20190409',2,'沪BVN716',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/868f917323703e96c05b1286fbc9c03d.jpg','/image/get?name=parking/98825c5c82581011219c68b4329b2c11.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 06:17:36','2019-04-10 06:07:51',NULL),(89,'10','20190409',2,'沪DBC109',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/45d9dd0b2371743de7d9602b40291f9e.jpg','/image/get?name=parking/45a99ce0d19cf92fcc4973a593b5ce18.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 06:17:57','2019-04-10 06:08:13',NULL),(90,'10','20190409',2,'沪A19P05',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d084e47fe50ea3f1809b0107f32c59a7.jpg','/image/get?name=parking/c3e2d9843e83077cad3975014917bb4f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 06:21:32','2019-04-10 06:11:47',NULL),(91,'10','20190409',2,'皖FC0690',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ed7a6a82f190d20bb5f684783b38fde7.jpg','/image/get?name=parking/8d5db51c6084ba68f76e4284ff4af3a0.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,82,1,'2019-04-10 06:22:44','2019-04-10 06:12:59',NULL),(92,'10','20190409',2,'陕GSZ208',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9549d2007601b6402b3b592ea753dca5.jpg','/image/get?name=parking/a894429d01c5b9a54bba2eaec66f7d1d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 06:23:33','2019-04-10 06:13:48',NULL),(93,'10','20190409',2,'鲁R1H686',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d1967f3f8c0f6839306e63df4d2f202c.jpg','/image/get?name=parking/a9529644def6be3f5ce13710791e96c7.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 06:23:59','2019-04-10 06:14:14',NULL),(94,'10','20190409',2,'浙GDS191',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/0ec1b5533f3f186dd791285b6c5c1fcf.jpg','/image/get?name=parking/480fcd3ab16a00812d86c66e9f058c34.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 06:33:23','2019-04-10 06:23:36',NULL),(95,'10','20190409',2,'沪A978Q5',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a51eb00b0241844fc2e52b94fc2cc706.jpg','/image/get?name=parking/0df18aafbba0577e478a667dd8eae703.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 06:37:37','2019-04-10 06:27:49',NULL),(96,'10','20190409',2,'闽JS0183',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d58108d7b12096b495cee306f4b0861e.jpg','/image/get?name=parking/8571fe2f3dd0f93c5bb6e7e02ee4d915.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 06:39:06','2019-04-10 06:29:19',NULL),(97,'10','20190409',2,'沪A71K97',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b7596a9ae631f5e6f1f9fe4c94e4964b.jpg','/image/get?name=parking/4da499395522f9bb206e6cf39f27242f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 06:45:55','2019-04-10 06:36:07',NULL),(98,'10','20190409',2,'沪B8N250',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/764dfd9e8b6799e3e45fecd282de5aa2.jpg','/image/get?name=parking/5928ab127d3b2b88f10e1bb7171c07e3.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 06:47:18','2019-04-10 06:37:30',NULL),(99,'10','20190409',2,'沪AF23109',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/608d9b1e5a3b34fab563beaf25d7ec39.jpg','/image/get?name=parking/4c2e0f9c9187b90fed4e6338e3b930cf.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,93,1,'2019-04-10 06:58:33','2019-04-10 06:48:43',NULL),(100,'10','20190409',2,'沪A093V8',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b85359e82add00401e3574b01fd28b03.jpg','/image/get?name=parking/ce4c3db7b762587b805763a98cb2ae3a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 06:59:21','2019-04-10 06:49:31',NULL),(101,'10','20190409',2,'沪A37K68',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d9886df76fe5dc61adb11317ae26d9b5.jpg','/image/get?name=parking/332552fc417e07c27c015120cee0ba3a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 06:59:48','2019-04-10 06:49:58',NULL),(102,'10','20190409',2,'沪K13717',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a770f6d6061a85f2589ae6959f813d99.jpg','/image/get?name=parking/00d3111ef1026fa0a56c7058445a3958.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:00:38','2019-04-10 06:50:47',NULL),(103,'10','20190409',2,'沪B69Q91',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a2c2005881d6294ff8122584a6dd7293.jpg','/image/get?name=parking/3ae84b4daf9e1e710ba54ee297e4f79c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:02:43','2019-04-10 06:52:53',NULL),(104,'10','20190409',2,'沪BDR935',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/281bdf5163cea6ac7c6f0c122ce30753.jpg','/image/get?name=parking/80b8cd2adbc16d386e88b3de41494429.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:03:45','2019-04-10 06:53:54',NULL),(105,'10','20190409',2,'沪A531J6',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/dd14b0a07bd10ea7b81c79ad64164f19.jpg','/image/get?name=parking/1fbeb427e531bc895f598a7a3950e44d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:05:46','2019-04-10 06:55:54',NULL),(106,'10','20190409',2,'沪A5J993',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/eaf0543123cfa9fcfab748986ff4e708.jpg','/image/get?name=parking/40e6b437e9c7e4cd3044a932088a86d5.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:05:52','2019-04-10 06:56:00',NULL),(107,'10','20190409',2,'皖EDF521',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/44623b66389214d264bdf5616cc2060a.jpg','/image/get?name=parking/a2e5af8cf002284f1a8abca723a58012.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 07:05:56','2019-04-10 06:56:05',NULL),(108,'10','20190409',2,'沪EH7635',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2ea193e74c3aaecfecb604565c771780.jpg','/image/get?name=parking/acb38171d3eba6f119e08a5f97640aac.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:07:01','2019-04-10 06:57:09',NULL),(109,'10','20190409',2,'沪EJ0353',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/3d5a8f61995b4f284316ee9621e3a429.jpg','/image/get?name=parking/ef6d7fd16a1d0b8057f2c25cd88e9999.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:07:15','2019-04-10 06:57:24',NULL),(110,'10','20190409',2,'沪DGV562',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/bdaac931161954b86625786a618b5d81.jpg','/image/get?name=parking/79d8a654d083d047c85cdeb1ca737c81.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:07:38','2019-04-10 06:57:47',NULL),(111,'10','20190409',2,'鲁E7B096',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2f825418fe212cf39d82075cce317fcc.jpg','/image/get?name=parking/2ca6e9342665bfc8577d3002e69276b0.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:08:10','2019-04-10 06:58:19',NULL),(112,'10','20190409',2,'苏BM569N',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/840f6ec0f2db98edfffb37253fde465f.jpg','/image/get?name=parking/61b5f1843dfbf5c0383c1a06e86bf2a0.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:08:22','2019-04-10 06:58:30',NULL),(113,'10','20190409',2,'京N1EK18',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/5f9e9eec9bf92249b96becc0b1dd2fbf.jpg','/image/get?name=parking/20498e9958dd0662941f5955ed1f896e.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:10:51','2019-04-10 07:00:59',NULL),(114,'10','20190409',2,'苏B652K7',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f59b621a3db3271c03bc1f95e463ec08.jpg','/image/get?name=parking/634505bb4e8cedfea383b2adf7bbee3f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 07:12:38','2019-04-10 07:02:46',NULL),(115,'10','20190409',2,'苏KR9512',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/4b0cb4cef2395f92b1bd96ca087d40b6.jpg','/image/get?name=parking/1c246a87b9aee748795022991dbded9a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:12:41','2019-04-10 07:02:49',NULL),(116,'10','20190409',2,'赣FL5550',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/e8b6695409fc8b6d9d30f9003a459edc.jpg','/image/get?name=parking/71bd3ecc64e0d3cbbc2fd1de052a29cb.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,92,1,'2019-04-10 07:15:59','2019-04-10 07:06:07',NULL),(117,'10','20190409',2,'沪B626P2',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/99d3842f64b7e4d57390e0981aed868d.jpg','/image/get?name=parking/caa60c68d545c949c73c63eb82c4d37b.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:17:34','2019-04-10 07:07:41',NULL),(118,'10','20190409',2,'沪B1Q100',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/215959187f932ebcf62ed1cab6d22816.jpg','/image/get?name=parking/5ea803c1fa92a84a9cea67284cbb36d1.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:18:38','2019-04-10 07:08:45',NULL),(119,'10','20190409',2,'沪B5B939',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/afdec8a8a602bb5d76cad23d95e65d81.jpg','/image/get?name=parking/929589d268898a492bb5dc2da53e2538.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:23:58','2019-04-10 07:14:04',NULL),(120,'10','20190409',2,'沪B6B659',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ffc945ddaa19e2647ea5034cb7d7ad30.jpg','/image/get?name=parking/c48c4af5d2b3fc5e468edd5ffc1fb5fc.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:25:29','2019-04-10 07:15:35',NULL),(121,'10','20190409',2,'陕C0927X',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9309e9c99f3bdafc2433d3ad35478255.jpg','/image/get?name=parking/5545cc6018cb11ff538bc9baf6377521.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:29:10','2019-04-10 07:19:16',NULL),(122,'10','20190409',2,'沪AWG837',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/882d871fe0b2cfaa94d9ddf4147297a0.jpg','/image/get?name=parking/e61ce7c6b9ffdca645b2f20d4b844290.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:30:28','2019-04-10 07:20:34',NULL),(123,'10','20190409',2,'苏J6Z831',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/980c84588293de2088a585d3b3314c51.jpg','/image/get?name=parking/e6a457529500482cc139068e02b66333.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 07:30:36','2019-04-10 07:20:41',NULL),(124,'10','20190409',2,'沪AEJ818',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f098ee68a0b1eb4c80934f8d24333a5e.jpg','/image/get?name=parking/9a37d8ad49f41ec5d21e8593b3a95712.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 07:30:48','2019-04-10 07:20:53',NULL),(125,'10','20190409',2,'沪A37C67',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f2dbd92d40ad36eccb600c5331b5cf17.jpg','/image/get?name=parking/190b9803f39042762a1bf9a58f38bd43.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:33:13','2019-04-10 07:23:19',NULL),(126,'10','20190409',2,'沪A654L1',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/348c20b4cdf7d5a18833b7dbac51cf0f.jpg','/image/get?name=parking/2af8d63002c2e599ea72e36bb9f0dfed.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:36:08','2019-04-10 07:26:12',NULL),(127,'10','20190409',2,'陕AG318A',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/61764dc5fa00f5dd595596ecb4898d2d.jpg','/image/get?name=parking/6cf688f327065b09aa89df5d54bcd0b7.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:41:01','2019-04-10 07:31:05',NULL),(128,'10','20190409',2,'苏M8Q571',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f86bc67a197dd87561f4f8fe4095892f.jpg','/image/get?name=parking/ed6e6a3b313ccdd8f2ad769e8eb8c1de.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:43:06','2019-04-10 07:33:09',NULL),(129,'10','20190409',2,'沪BH5997',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/abe87771cc3c7fe1fbad1a927b80f24b.jpg','/image/get?name=parking/57957819aee625c0f4f78c2fabfbfe37.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:45:09','2019-04-10 07:35:12',NULL),(130,'10','20190409',2,'浙B69R17',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b40bf17fe90ef74c2396232120e65080.jpg','/image/get?name=parking/e61c4ecfbb85724d87c7beb445f62978.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:45:31','2019-04-10 07:35:34',NULL),(131,'10','20190409',2,'沪B7Q518',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9ac906fc30f9de038fda38441603fdfd.jpg','/image/get?name=parking/0da5c69e83d6eaebd1959521869a4316.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:46:00','2019-04-10 07:36:03',NULL),(132,'10','20190409',2,'沪DKD033',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/abb06f9899aea54d8219dcc9674f813a.jpg','/image/get?name=parking/aa05116ff4a7b0d292a044425eced382.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:46:13','2019-04-10 07:36:16',NULL),(133,'10','20190409',2,'沪KT5001',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/942a0e01e14892979b40abbab92b0ba8.jpg','/image/get?name=parking/6cdc70e7a23141a15411277c58a8836d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:46:18','2019-04-10 07:36:21',NULL),(134,'10','20190409',2,'浙AY9U50',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/0261f1226200108a5ac7e2660ca7559c.jpg','/image/get?name=parking/a198823dd12b4b30136a3cb2b9d27790.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:52:47','2019-04-10 07:43:19',NULL),(135,'10','20190409',2,'沪K81921',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/21cf0f6e8daa7bdb30d44e06171470e8.jpg','/image/get?name=parking/687d7b4fe6e6532061f843cda81dc5f0.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:54:06','2019-04-10 07:44:08',NULL),(136,'10','20190409',2,'沪G97917',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9fb3fde7f6b27f8bcf9dc7723d84d9a0.jpg','/image/get?name=parking/f0dffc1dc6c94c588685b0481c6ef4ed.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:54:13','2019-04-10 07:44:15',NULL),(137,'10','20190409',2,'苏EN9X37',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ba0a9529b385b769c1fadb8fc74c60fe.jpg','/image/get?name=parking/37ebb8f1fd814c006690d568a49a4d65.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:54:50','2019-04-10 07:44:51',NULL),(138,'10','20190409',2,'苏E592MM',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/73f0b9e73ca1cc27da6cea5cc3fa77fe.jpg','/image/get?name=parking/97b41856ae3b674f69c9a2549b54e6e7.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 07:54:56','2019-04-10 07:44:57',NULL),(139,'10','20190409',2,'浙AM602D',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/dce84c38ab56e0ce7471bb75c391044e.jpg','/image/get?name=parking/c769587cbdd35126ef3ec9042fe39da9.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 07:57:39','2019-04-10 07:47:40',NULL),(140,'10','20190409',2,'沪B00Q78',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/57ba50d01c1e833090eff64aa7476657.jpg','/image/get?name=parking/71381793447a0c76c485f8a62807e064.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:00:08','2019-04-10 07:50:09',NULL),(141,'10','20190409',2,'沪DAL006',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/1e5cec9cc62051270181291644fe489c.jpg','/image/get?name=parking/15b881a86ceb375d4d4148ea820e521e.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:04:07','2019-04-10 07:54:08',NULL),(142,'10','20190409',2,'沪KZ5151',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/064de769bca5edf6b376e1f208b305aa.jpg','/image/get?name=parking/249a63677c9c110676a733482ba52d55.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:04:49','2019-04-10 07:54:49',NULL),(143,'10','20190409',2,'浙AB065W',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/56aa15f425fb259ed78cc51c2a6a57cf.jpg','/image/get?name=parking/2ee760022bffac6233a868e5a922fbaa.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:04:53','2019-04-10 07:54:54',NULL),(144,'10','20190409',2,'沪EG1525',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/bb4f8148186460af4b555e53a38c3c3b.jpg','/image/get?name=parking/a7fdab227febb6328248f9f9ecd60091.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:06:31','2019-04-10 07:56:31',NULL),(145,'10','20190409',2,'苏K7601R',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a2c385cb2410a7fffdb46425d44d39f0.jpg','/image/get?name=parking/59791f534ca7e12a39981cda8fd6ab1a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:07:06','2019-04-10 07:57:06',NULL),(146,'10','20190409',2,'沪AXR296',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/3c3459a2774b9ebcf164fc77ac1886fb.jpg','/image/get?name=parking/5225ba828dc919852ea16ae657169280.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:07:13','2019-04-10 07:57:13',NULL),(147,'10','20190409',2,'沪HY6889',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f16ccf31dcf7f102b34ca9d2edd6619e.jpg','/image/get?name=parking/6db00a2327d14066b9c5fbcdbadb52a1.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:11:41','2019-04-10 08:01:40',NULL),(148,'10','20190409',2,'沪A500W7',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d09554115d876cf3ed2348fc4fdc1ce8.jpg','/image/get?name=parking/6d59f966c07b606a01a78c37aecbb64b.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:12:11','2019-04-10 08:02:10',NULL),(149,'10','20190409',2,'沪A028P0',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/42447d14dbeda637df8314ebec50cb7a.jpg','/image/get?name=parking/07fc6547eb21f5b81e854124908dded7.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:15:40','2019-04-10 08:05:39',NULL),(150,'10','20190409',2,'晋L66P02',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/60d74e848cb52fe2f91a14b8766fd210.jpg','/image/get?name=parking/c882a949c37c2626d4926edf2664c81d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:17:27','2019-04-10 08:07:26',NULL),(151,'10','20190409',2,'沪AFF535',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/30d7f4f3257e1069e6e15c55d0cfed23.jpg','/image/get?name=parking/25f59f734342d92e8c4787b222e762e4.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:19:43','2019-04-10 08:09:41',NULL),(152,'10','20190409',2,'沪AF97709',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/65edf68fc1167cc4fa140e17375e4f25.jpg','/image/get?name=parking/e6e9dbe97f745ec06d0c97195df2226d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 08:24:03','2019-04-10 08:14:01',NULL),(153,'10','20190409',2,'浙A939GY',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9dc120dcc94f61636df525cd378129d4.jpg','/image/get?name=parking/65091204e1b95966d1d7d23ce7d14bcd.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:25:08','2019-04-10 08:15:06',NULL),(154,'10','20190409',2,'苏A63C53',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b6a2922af139bba6d248f99f63c7ee22.jpg','/image/get?name=parking/799083bbfd1546d0b829db084a1014ae.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 08:26:31','2019-04-10 08:16:28',NULL),(155,'10','20190409',2,'沪A3D535',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/dfa3c84d88389a485ef62f818be529d3.jpg','/image/get?name=parking/450bf5cd939db52f556bcb056a980d23.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:30:33','2019-04-10 08:20:30',NULL),(156,'10','20190409',2,'沪LB9330',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/20d8902e69fd07e37ad14d888e2adc6f.jpg','/image/get?name=parking/fa732527520d1c3d9151674792fb52b1.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:34:04','2019-04-10 08:24:00',NULL),(157,'10','20190409',2,'沪BNZ570',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/31b7ef433eff83ea597611d7915aab58.jpg','/image/get?name=parking/225cac2a8de3828276eb36e966600bd3.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:37:51','2019-04-10 08:27:47',NULL),(158,'10','20190409',2,'沪AUE009',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/01906a6f5ebb998da29592912edac788.jpg','/image/get?name=parking/e156cc4ee21e785233e2ecd997c7cf1e.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:38:56','2019-04-10 08:28:51',NULL),(159,'10','20190409',2,'苏FRF881',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/136dba5b94384505fbf8653da15c84b5.jpg','/image/get?name=parking/342b9f12b8d793677a2142508c3247ab.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:39:09','2019-04-10 08:29:04',NULL),(160,'10','20190409',2,'鄂D6P285',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/df96ffdcfc81431c6d638b73da2fb648.jpg','/image/get?name=parking/642235b69505961b2569f473a0eef9a8.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:41:53','2019-04-10 08:31:49',NULL),(161,'10','20190409',2,'沪BHU690',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/e63a4942485ed2ebd1d039f5eab09301.jpg','/image/get?name=parking/20ce3ec9bf51ea4f0a06d68efcdf57c0.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:46:02','2019-04-10 08:35:57',NULL),(162,'10','20190409',2,'沪A132K6',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/91082850f107a49f169e2f1a9dc9cd56.jpg','/image/get?name=parking/2790d9aa42b2ff3996d277c3ad6f7ad8.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:46:53','2019-04-10 08:36:47',NULL),(163,'10','20190409',2,'沪JB7837',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/6d23b80afaad5b3f5cc05d591ac60f4f.jpg','/image/get?name=parking/9174dfbc7b242f393d46fb7224dfa02f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:49:02','2019-04-10 08:38:56',NULL),(164,'10','20190409',2,'沪DL2398',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/45654fcc815bb5e43556e82b611b2bb9.jpg','/image/get?name=parking/82b993e264bca7de392b3475db6fa23d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:49:15','2019-04-10 08:39:09',NULL),(165,'10','20190409',2,'皖AV761K',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b8c169c48a6a68aa77b4cc80f5daa775.jpg','/image/get?name=parking/cafe421816ecc5d164c4edc08d96611a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 08:49:27','2019-04-10 08:39:22',NULL),(166,'10','20190409',2,'晋LP5662',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2137402522f3f4a685049151999525c6.jpg','/image/get?name=parking/aca5f348bb8789297379299f58ed1268.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 08:53:00','2019-04-10 08:42:54',NULL),(167,'10','20190409',2,'苏FGU756',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/e14d0a75857f6cc172cb2e95da154ea2.jpg','/image/get?name=parking/3829711b9cac387964a77731fbc39ba1.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 09:08:35','2019-04-10 08:58:27',NULL),(168,'10','20190409',2,'沪K97672',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/aeb42edb208c0a89ee1cd1d4a43edfbb.jpg','/image/get?name=parking/6239556a18aa7079788a3cf9b5e6f1b9.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 09:10:28','2019-04-10 09:00:20',NULL),(169,'10','20190409',2,'苏D78E12',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/5ea8d37e7d271d86f7ff6af48988dff0.jpg','/image/get?name=parking/c369f36bf48497abc1ee8d106c7641d7.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 09:11:26','2019-04-10 09:01:17',NULL),(170,'10','20190409',2,'苏D78E12',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2f3c28690238a8457aa3872fa798aeff.jpg','/image/get?name=parking/7e3da33c9ed500488b00ba905e2fd471.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 09:11:45','2019-04-10 09:01:36',NULL),(171,'10','20190409',2,'苏M8Q571',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/72535b299253a4e432c7efd6c9d43d0a.jpg','/image/get?name=parking/cb3df1adb84e2f7e8f4825af041f645e.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 09:12:58','2019-04-10 09:02:49',NULL),(172,'10','20190409',2,'沪B027F8',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c7c4e4ad83a4cc459572eb15c8d0022d.jpg','/image/get?name=parking/ca60bc7938a2e97c2a25db2251c34872.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 09:21:54','2019-04-10 09:11:44',NULL),(173,'10','20190409',2,'苏AR2233',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/13765fa5d418ed693d3c508ae8e48532.jpg','/image/get?name=parking/b2ee50132078e08492b4ede2f826faa0.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 09:22:06','2019-04-10 09:11:55',NULL),(174,'10','20190409',2,'沪BXX930',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c7da8825a3d33515e6c41db161352234.jpg','/image/get?name=parking/c5d8e657c2c99f3012c72cc02fd4d502.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 09:29:23','2019-04-10 09:19:12',NULL),(175,'10','20190409',2,'闽JJ3812',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ce16b17a05cd7317f8afb094140234b2.jpg','/image/get?name=parking/81029a1be17d1bfc28d25be9ed7e52e6.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 09:32:27','2019-04-10 09:22:15',NULL),(176,'10','20190409',2,'沪AGL113',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/4dcdc8ab674870e9700a225b9490981a.jpg','/image/get?name=parking/aba4ba09a1ece552cb664e6d3d502939.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 09:39:37','2019-04-10 09:29:24',NULL),(177,'10','20190409',2,'浙DN77P8',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ae158792a5e999a56c1f7fc7da6c1f2b.jpg','/image/get?name=parking/2b13450363b32bf44aa0e5900b889a65.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 09:47:51','2019-04-10 09:37:37',NULL),(178,'10','20190409',2,'苏JZQ331',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/11cc2b39a1e9d99f1d0955daccd20c2f.jpg','/image/get?name=parking/094a7226fbf11c427c9d09dbc020ab93.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 09:55:17','2019-04-10 09:45:02',NULL),(179,'10','20190409',2,'沪FB1768',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7ef147e80d425f719036daf9b396732a.jpg','/image/get?name=parking/b7fb186bc3a126e800458e20ffb508e5.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 10:00:57','2019-04-10 09:50:41',NULL),(180,'10','20190409',2,'苏J526X7',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/fe64b12baf28ed9e7d08fdf6cb85fbc2.jpg','/image/get?name=parking/8c7b8c1e18c94420d1b95118188ce0f4.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 10:06:25','2019-04-10 09:56:08',NULL),(181,'10','20190409',2,'沪GY8610',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/910bdacb800880e620509e043eba29e6.jpg','/image/get?name=parking/2ce2f049ce2f81f29d468450836f5eb4.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 10:09:35','2019-04-10 09:59:18',NULL),(182,'10','20190409',2,'沪B7Q518',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/561cf4e350ea96b39342fb5ff00acb4b.jpg','/image/get?name=parking/db051631b446c0ab7c04636d311e9586.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 10:09:57','2019-04-10 09:59:40',NULL),(183,'10','20190409',2,'沪GE6293',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9676dc35c9f18be2801fcf40fe0069d0.jpg','/image/get?name=parking/72c3c4bf4d95bf359f369ce523252573.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 10:14:54','2019-04-10 10:04:37',NULL),(184,'10','20190409',2,'沪AF09498',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/140e2df32eca32c8b72b9196c7bc70ae.jpg','/image/get?name=parking/78ce8c1806a6db43ddd3c725d06dc738.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 10:15:28','2019-04-10 10:05:10',NULL),(185,'10','20190409',2,'沪AFA599',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/dfec9fddcd5a4be9de31a1649cf2416e.jpg','/image/get?name=parking/7221b58528bd126011d045d6b5d01e0f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 10:15:56','2019-04-10 10:05:38',NULL),(186,'10','20190409',2,'沪DX4008',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9c76ad0fd20f5b53e70c2d68453ddf63.jpg','/image/get?name=parking/941c08f3e3f651c471a31c7621c408fd.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 10:23:02','2019-04-10 10:12:43',NULL),(187,'10','20190409',2,'沪A6T657',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/deb837cc5f003f62c9f5486001f90d0c.jpg','/image/get?name=parking/e61f5fcc458c231c38ed59ebe583d0c7.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,82,1,'2019-04-10 10:28:52','2019-04-10 10:18:32',NULL),(188,'10','20190409',2,'沪FZ2065',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/3c4a7a500f41dace346cea1a5ec416aa.jpg','/image/get?name=parking/2d5000bed1795754a7ce9eaadc2158f8.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 10:34:15','2019-04-10 10:23:55',NULL),(189,'10','20190409',2,'沪JY7985',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c8cb483960dcde45152a2f4aa26e6235.jpg','/image/get?name=parking/284177278db8746a3072d9d35ba557fd.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 10:34:54','2019-04-10 10:24:33',NULL),(190,'10','20190409',2,'豫AJ99L0',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a02abb88746f1115714a4cfdf09a0b5a.jpg','/image/get?name=parking/7455e50ff2a0c1bf99e55c21c82c9785.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 10:38:01','2019-04-10 10:27:40',NULL),(191,'10','20190409',2,'川A0BE15',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d974c1415635924215ad724d0758d3d8.jpg','/image/get?name=parking/4f12e21e100f3a39ee0524abddfc0e73.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 10:50:20','2019-04-10 10:39:57',NULL),(192,'10','20190409',2,'沪BRT044',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/92ba4aef61820157e048aa9c31d0a0ec.jpg','/image/get?name=parking/27e40d24c3f898825a4cc429d0a0754f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 10:51:37','2019-04-10 10:41:14',NULL),(193,'10','20190409',2,'沪AF56059',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d61a7fc0a81f4b0834629e9759a0f386.jpg','/image/get?name=parking/9b495b11afcf0dbc06fa1a4bb5e1ff1f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,90,1,'2019-04-10 10:54:18','2019-04-10 10:43:54',NULL),(194,'10','20190409',2,'苏GM7311',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f070180a6e1579b2268b35769baab18a.jpg','/image/get?name=parking/abf28c8c44a23007b8fc2333e168bd38.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 11:15:41','2019-04-10 11:05:14',NULL),(195,'10','20190409',2,'沪DK1023',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/686c4b67a472725972dd25d1306e342c.jpg','/image/get?name=parking/6e4ab668c50ed6133d465d6e973ac815.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 11:29:34','2019-04-10 11:19:05',NULL),(196,'10','20190409',2,'皖EDF521',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/1ecaeaeca286bb4efb07f074c922acf6.jpg','/image/get?name=parking/f6d906473576c247731743a3073b04ff.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 11:34:36','2019-04-10 11:24:07',NULL),(197,'10','20190409',2,'苏BQ9M19',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d8025af796ee7730ec8fda8ac604965c.jpg','/image/get?name=parking/e27822f85c168024deac82ebccdbd223.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,92,1,'2019-04-10 11:43:55','2019-04-10 11:33:24',NULL),(198,'10','20190409',2,'沪A691E3',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/eeb5f8d0cba3bbaff87614c10681296f.jpg','/image/get?name=parking/9a1b9c30222f880adbf658bcc57534e6.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 11:50:40','2019-04-10 11:40:08',NULL),(199,'10','20190409',2,'沪A71K97',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/570e033f629569710b4c3007503ae7ca.jpg','/image/get?name=parking/c9176651126f270afd4a69cbb67e0ebe.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 11:57:59','2019-04-10 11:47:26',NULL),(200,'10','20190409',2,'冀A2CC97',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7b626ff5b49b939942c001bcbd11bd1c.jpg','/image/get?name=parking/1652763458218663ab0d3f88c91fba94.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 11:58:37','2019-04-10 11:48:04',NULL),(201,'10','20190409',2,'沪BKZ176',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/55df5d85138a6d28afdb0b19cadca749.jpg','/image/get?name=parking/ab384adbb7756d3daa4f5063335e7eb0.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 12:01:28','2019-04-10 11:50:55',NULL),(202,'10','20190409',2,'沪A7S583',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a24e8b8989759a0ff7a70a837523dadc.jpg','/image/get?name=parking/63f4584cf5b198485c7f39ce6f525f4c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 12:08:39','2019-04-10 11:58:06',NULL),(203,'10','20190409',2,'苏MCJ213',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/797325c92667f75a5bb68899332bf824.jpg','/image/get?name=parking/be2f181d8ed4dc2670cd232ee346d313.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 12:12:14','2019-04-10 12:01:39',NULL),(204,'10','20190409',2,'苏J526X7',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/35e8c581eefe3161a5874f7954b7c1a4.jpg','/image/get?name=parking/28304adf79e635bf28aa5019ded7fa9c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 12:23:20','2019-04-10 12:12:44',NULL),(205,'10','20190409',2,'沪ME0501',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/0f58e17b1e52ec6495fe9898e19e3490.jpg','/image/get?name=parking/7ca67310248aa7038360a586e096e331.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 12:23:58','2019-04-10 12:13:22',NULL),(206,'10','20190409',2,'苏ETE219',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2e9309489f7e9fd3df651f26455dad96.jpg','/image/get?name=parking/6f165dc7fd65be97666cbd87363dabca.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 12:33:19','2019-04-10 12:22:41',NULL),(207,'10','20190409',2,'苏ETE219',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/12b4b5303246d77800623dea4fa6ffb6.jpg','/image/get?name=parking/6ecdf6d79cd78820933bbfa53cee5412.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 12:34:17','2019-04-10 12:23:40',NULL),(208,'10','20190409',2,'沪DHH938',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c061af1f35f7a6bdf609ad07a1641cc6.jpg','/image/get?name=parking/c94eb20cdc90eb756fb316a598b7bce8.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 12:36:34','2019-04-10 12:25:57',NULL),(209,'10','20190409',2,'沪BBS235',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/069f4843128d6c99658f6fe040e6ecc4.jpg','/image/get?name=parking/69c4b5bcc2b8950e041cf7c201dffb1f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 12:38:18','2019-04-10 12:27:40',NULL),(210,'10','20190409',2,'沪BH8P86',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d1919db20c1a68e958f2c450001ec259.jpg','/image/get?name=parking/2e4b8bb079aec068fe4c17c5ba847e90.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 12:42:02','2019-04-10 12:31:23',NULL),(211,'10','20190409',2,'浙AM602D',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b844f4ee9c8cba678e6849f2be2cf52e.jpg','/image/get?name=parking/49ae21abba8a6f48db8e1fcb3dba401e.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 12:43:12','2019-04-10 12:32:33',NULL),(212,'10','20190409',2,'沪FZ2065',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/398a7ee26d32fcbefa18f4309005c72b.jpg','/image/get?name=parking/285fdeb4d57d57a97ff832d095b3df46.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 12:44:59','2019-04-10 12:34:20',NULL),(213,'10','20190409',2,'浙B9R661',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/26293bb27c9db356b78390c9395275ee.jpg','/image/get?name=parking/4b2a87f3f2a849c5e93bb067eb51570c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 12:45:58','2019-04-10 12:35:19',NULL),(214,'10','20190409',2,'沪GT8687',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/3b16f8ac5a8d06a750516e001c62acb1.jpg','/image/get?name=parking/66489b04e1871e8d04a8faaf50d970d0.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 12:46:27','2019-04-10 12:35:48',NULL),(215,'10','20190409',2,'沪B6G376',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/1d6f0db28195e6727fcfff85afb07345.jpg','/image/get?name=parking/6e2815cedc840edeada788d4a44c01d7.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 12:49:59','2019-04-10 12:39:20',NULL),(216,'10','20190409',2,'皖AV761K',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/cd7f1b372138250d70139ea558391da1.jpg','/image/get?name=parking/82585d4aa8b39426ef74ce27672b9477.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 12:55:33','2019-04-10 12:44:53',NULL),(217,'10','20190409',2,'苏MJG360',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/8d9da44dc4872e0e2837e3be83a15c21.jpg','/image/get?name=parking/46c51d46bd1149f23d3491d4142e1796.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 13:04:21','2019-04-10 12:53:39',NULL),(218,'10','20190409',2,'苏MJG360',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c0f49c75cd59bda9383c4e68c81c6323.jpg','/image/get?name=parking/5c993b8ecd972f45d72481386e4f124c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 13:04:53','2019-04-10 12:54:12',NULL),(219,'10','20190409',2,'沪BLZ562',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/e207faf152ea979e715217804c53d8e1.jpg','/image/get?name=parking/9a3b66e8556adff37cd10e80f20792bd.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 13:05:00','2019-04-10 12:54:18',NULL),(220,'10','20190409',2,'浙C29WB5',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/e52b40a46a1e208a37277237985f6fe8.jpg','/image/get?name=parking/f93ea691344a87f5f7b57f9212c33659.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 13:05:22','2019-04-10 12:54:40',NULL),(221,'10','20190409',2,'鲁QR82B2',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/49fb0f8bd38fce69349fda5d36b39dbb.jpg','/image/get?name=parking/28087ee0a8b22dddbb907de2a24545a8.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 13:12:30','2019-04-10 13:01:47',NULL),(222,'10','20190409',2,'晋FEU889',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/8d1f825d2c713cb9fd390644871897d6.jpg','/image/get?name=parking/38cd2445f961996f744101c363a456a2.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 13:12:38','2019-04-10 13:01:55',NULL),(223,'10','20190409',2,'沪AUA070',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/793bb144c3e6351f2ef688eca0df17b2.jpg','/image/get?name=parking/3a1cb534e97878d61d6a727081cd2158.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 13:19:02','2019-04-10 13:08:18',NULL),(224,'10','20190409',2,'苏AU7E96',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/69b76334050ce6d0b95cfc6dd3c96455.jpg','/image/get?name=parking/d5376487ff08840994e58d1baabe5bb2.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 13:19:50','2019-04-10 13:09:06',NULL),(225,'10','20190409',2,'沪DQ1878',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/4ab71d95a941ab32a109afa8800f37a0.jpg','/image/get?name=parking/e171fdb46317a18e8f40bb6bb8e0a7df.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 13:20:45','2019-04-10 13:10:02',NULL),(226,'10','20190409',2,'沪L75033',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/13a842d944d5a0df4bd269e1e5763385.jpg','/image/get?name=parking/01d4bfd34c85e5b7c23623be1bb159af.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 13:22:44','2019-04-10 13:11:59',NULL),(227,'10','20190409',2,'沪EG1525',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/cbe6e72a3dcf573951bfa652ec08dede.jpg','/image/get?name=parking/949425dc3c55a16910af5ec83f5b40f9.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 13:24:40','2019-04-10 13:13:56',NULL),(228,'10','20190409',2,'沪BND880',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/3c618a8a9a5feec3c854bf77c3b4f218.jpg','/image/get?name=parking/afbffb3acc434b8d66cc66715db79b3c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 13:27:45','2019-04-10 13:17:00',NULL),(229,'10','20190409',2,'沪BR1044',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/6454d667655e6e13966a91fdcc5b7713.jpg','/image/get?name=parking/5006c7507d4d8596735cfb110079feb6.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 13:45:25','2019-04-10 13:34:38',NULL),(230,'10','20190409',2,'沪DD0479',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/efa07868e3b8233509f337aa245cc0d8.jpg','/image/get?name=parking/566d6b03ddb4138f659350ad8704ab65.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,85,1,'2019-04-10 13:55:06','2019-04-10 13:44:17',NULL),(231,'10','20190409',2,'沪A5G318',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ba735a48c9be7ef97144831e0e882944.jpg','/image/get?name=parking/ae7471cdc7184f3131bf2022b863b5f0.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 13:58:05','2019-04-10 13:47:16',NULL),(232,'10','20190409',2,'鲁QE739R',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f30abbeeb64238bbd64c9c463362bad9.jpg','/image/get?name=parking/54ca811489723981a4436038733af63a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 14:00:30','2019-04-10 13:49:41',NULL),(233,'10','20190409',2,'沪DL2398',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/3f4e4b6fa6b2fec9313ff9b4dc1a9de6.jpg','/image/get?name=parking/722e161fc3ea46de7582d0a2f3b95ca4.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 14:01:08','2019-04-10 13:50:18',NULL),(234,'10','20190409',2,'沪EJ2689',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f99306a7efa524ff7eecd31e4c9d43b2.jpg','/image/get?name=parking/b2bea19f3f4def537b4cfafb48e6db4a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 14:18:42','2019-04-10 14:07:50',NULL),(235,'10','20190409',2,'苏MC150X',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/59ef1003a12e583d1d620ede9f652214.jpg','/image/get?name=parking/3b745e0120212c1c372f17f9c15e8807.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 14:25:06','2019-04-10 14:14:13',NULL),(236,'10','20190409',2,'沪FB1768',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9f482bbc04b069372335fccc536b8ae2.jpg','/image/get?name=parking/28c2151f16fb3d0fa41f9060bda1d9f9.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 14:27:47','2019-04-10 14:16:53',NULL),(237,'10','20190409',2,'沪NC0012',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/e7dfefc937e543879b37fd4fac58eac2.jpg','/image/get?name=parking/01be36c43d015ca789d850bcf1d830bb.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 14:28:41','2019-04-10 14:17:48',NULL),(238,'10','20190409',2,'沪AFF127',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/8f6e4c9dd3103ab5298adce4a12ed785.jpg','/image/get?name=parking/798de2dd302518934f08e69ab8d866e4.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 14:35:34','2019-04-10 14:24:39',NULL),(239,'10','20190409',2,'沪A587E1',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/89ed538b7ebfcb60f081c72cafcbcc18.jpg','/image/get?name=parking/435fe1630111468774fc254b45b0be9e.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 14:39:32','2019-04-10 14:28:37',NULL),(240,'10','20190409',2,'沪AD05171',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/5ceb4aa728e39d0e76b23eb8279c9608.jpg','/image/get?name=parking/0a6b7fb4acafda7206805c07b255694c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 14:47:40','2019-04-10 14:36:44',NULL),(241,'10','20190409',2,'沪BHB756',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/71daefbdd387d21ec6f94e6c8adae6da.jpg','/image/get?name=parking/ba8b060511dceec8353350f9fe85cfeb.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 15:00:25','2019-04-10 14:49:27',NULL),(242,'10','20190409',2,'冀AFW619',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/648ae2dedfb8eb9f99c03f2e54ccfbdc.jpg','/image/get?name=parking/0a22d2eb40622704514ec8dd68936ffd.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 15:01:57','2019-04-10 14:50:59',NULL),(243,'10','20190409',2,'沪AF56059',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d3a6390e16a0b745b7fd5b0ea316c4ad.jpg','/image/get?name=parking/4b945ae7572c9fcba958b6e9f091def9.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 15:03:40','2019-04-10 14:52:41',NULL),(244,'10','20190409',2,'沪A8G291',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ac85342dd28a8ab7d823f9af4d300466.jpg','/image/get?name=parking/670c7ff3e72deb60233908a16c90bcf4.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 15:04:05','2019-04-10 14:53:06',NULL),(245,'10','20190409',2,'沪GR1338',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a3da22799260305c336332e2c5fc4fec.jpg','/image/get?name=parking/3cb698fc8117f0b0df4abb4a03ec5864.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 15:14:54','2019-04-10 15:03:54',NULL),(246,'10','20190409',2,'苏M8Q571',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/287f7c918acc64b7a3f639bd992853b5.jpg','/image/get?name=parking/89b0922f136b37cb361906e421f78623.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 15:16:08','2019-04-10 15:05:07',NULL),(247,'10','20190409',2,'沪AWS532',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9f91356e5c0780fdf01280f52718c7b7.jpg','/image/get?name=parking/a700c7ba176de842a0ea76d16603f9ed.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 15:20:54','2019-04-10 15:09:53',NULL),(248,'10','20190409',2,'苏E592MM',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/8281090bc067c28b6056fdd053cfc1fb.jpg','/image/get?name=parking/d9824181d738a4086570788cd8a54f82.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 15:30:42','2019-04-10 15:19:39',NULL),(249,'10','20190409',2,'沪N19793',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/36798b06cc731309d256702ed9c61472.jpg','/image/get?name=parking/56b0915d81fdcc16210827ac37ece6c6.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 15:33:18','2019-04-10 15:22:16',NULL),(250,'10','20190409',2,'沪FN8175',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a1f77dcc25fc15502f928f48cd3f2930.jpg','/image/get?name=parking/4cb6d51060e82fb68a3c36f1da85600f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 15:34:44','2019-04-10 15:23:41',NULL),(251,'10','20190409',2,'沪ALN508',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/cf81c5f9c15c7dd5ac7c5608268c2f93.jpg','/image/get?name=parking/0f5a7ac21b027a5ba783718558f6350b.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 15:34:49','2019-04-10 15:23:46',NULL),(252,'10','20190409',2,'沪ADB180',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/92a2775c882f034e66851549df69d6d9.jpg','/image/get?name=parking/3130d084e25fad0c6b500a9abde49398.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,92,1,'2019-04-10 15:35:04','2019-04-10 15:24:01',NULL),(253,'10','20190409',2,'沪AKY086',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/fe55f8a3fcdaef06b22c51620079e09a.jpg','/image/get?name=parking/bbe1ac5923e52bc4dc9d77eff0a822b3.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 15:39:37','2019-04-10 15:28:33',NULL),(254,'10','20190409',2,'沪AD03126',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/911d69309cb62921a0ca150a7e760946.jpg','/image/get?name=parking/cb6cd804d6a8d0e5a8b0f3b0b34e458f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,90,1,'2019-04-10 15:41:35','2019-04-10 15:30:31',NULL),(255,'10','20190409',2,'沪A50M63',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9bc8e25941ca4680b7ce41258f903735.jpg','/image/get?name=parking/61b3742778bd38c9f08f64fa8aa539b6.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 15:44:47','2019-04-10 15:33:44',NULL),(256,'10','20190409',2,'沪JD8051',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/66098b1f4b89a2833a78f6557febadeb.jpg','/image/get?name=parking/248b88d9937174186aab64a6e9859835.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 15:45:51','2019-04-10 15:34:47',NULL),(257,'10','20190409',2,'皖LF827W',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/11b9656b19029196fa38af7b97fc0b78.jpg','/image/get?name=parking/4945bec653f103601ce034eb06d9beba.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 15:53:08','2019-04-10 15:42:02',NULL),(258,'10','20190409',2,'沪B3M399',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/320565cfe890c723bbf609c5fedd6fc5.jpg','/image/get?name=parking/a9d4051b7bb43abac3e578a04f6d7350.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 16:11:59','2019-04-10 16:00:50',NULL),(259,'10','20190409',2,'沪B6G376',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2c566ecd6c97642a8f4d213232212b50.jpg','/image/get?name=parking/8e25df8e23202c851ce90229e2add0d8.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 16:21:19','2019-04-10 16:10:10',NULL),(260,'10','20190409',2,'沪AF23109',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/36f25668ea1c48de877d86cf4f1c9e20.jpg','/image/get?name=parking/60c5d178eccc023d34c2880eff239446.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 16:22:24','2019-04-10 16:11:14',NULL),(261,'10','20190409',2,'苏F312S2',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/3df04f84af45f404a29062bb293bf75e.jpg','/image/get?name=parking/a441bc100dfbcbd1e7e62e50bb10c32a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 16:24:45','2019-04-10 16:13:35',NULL),(262,'10','20190409',2,'沪AWG837',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2e965fbcc49f79229cc762748eb5d3f7.jpg','/image/get?name=parking/6b26be7f77cc0caf8629b43adc5d578c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 16:26:05','2019-04-10 16:14:55',NULL),(263,'10','20190409',2,'沪AFB728',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/8910964917c222a4e8406cd6cb719cdb.jpg','/image/get?name=parking/1a66f12fa97d2a139bb6c42a9db8bc74.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 16:34:17','2019-04-10 16:23:05',NULL),(264,'10','20190409',2,'苏AM59T9',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/4b59f359df55cbc6034ae5d53e207240.jpg','/image/get?name=parking/124e7619a29603adfcdc693d57042edf.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 16:35:07','2019-04-10 16:23:55',NULL),(265,'10','20190409',2,'沪AD10069',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/0c6f154d59c9c916bdf5ee84cd545eea.jpg','/image/get?name=parking/d3e5127f3069c20ba275430d01b5439c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 16:35:40','2019-04-10 16:24:29',NULL),(266,'10','20190409',2,'皖BYZ213',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/25619a69df6d1f3aae139493c5fc4a16.jpg','/image/get?name=parking/1444556c631c7f4d90c3226bdf714989.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 16:41:05','2019-04-10 16:29:53',NULL),(267,'10','20190409',2,'沪B8N250',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7944851bcd7803a4f69b046c60409aa4.jpg','/image/get?name=parking/c7d224c370a9c8508392e7ea3e792281.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 16:44:22','2019-04-10 16:33:09',NULL),(268,'10','20190409',2,'鲁NAQ622',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/766ed21f148e5f713287c59ed78925b7.jpg','/image/get?name=parking/2f72cc7dfedba8dedace813013bc63f4.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 16:47:03','2019-04-10 16:35:49',NULL),(269,'10','20190409',2,'沪A216G4',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/251c2d2e3be4250acf08e39d0604d7ec.jpg','/image/get?name=parking/f6c8a4f0a7507cebc75f7c8936b7160b.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 16:49:30','2019-04-10 16:38:17',NULL),(270,'10','20190409',2,'辽B83EP7',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/3a229decf9ed9c8cdc13329fca46e614.jpg','/image/get?name=parking/c87756d41d7953badb0d91fd8c1b50c9.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 16:51:12','2019-04-10 16:39:58',NULL),(271,'10','20190409',2,'皖DP5035',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9997d5a071c03c284c8ffff5717d5b52.jpg','/image/get?name=parking/6d3a544fe0842b5dfefafbeb98e7b1b7.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 16:58:24','2019-04-10 16:47:09',NULL),(272,'10','20190409',2,'皖DP5035',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/0be5ad22e05ef1f2cbab932ac25d7dc4.jpg','/image/get?name=parking/b23585960f91e1af6d5b22b9d6e10750.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 16:58:36','2019-04-10 16:47:21',NULL),(273,'10','20190409',2,'苏C59P93',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9bb1399505c5012d8f807129b6eae0c0.jpg','/image/get?name=parking/68d120a785fa76b8267a514615fb00ad.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 17:09:30','2019-04-10 16:58:14',NULL),(274,'10','20190409',2,'沪BLD252',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/5a601515504d57b332f923e35c5b4250.jpg','/image/get?name=parking/c00c1f286df43c62f4f3cdff125827b7.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 17:15:09','2019-04-10 17:03:52',NULL),(275,'10','20190409',2,'沪A58U79',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b84e11f297974c8491a2d8a3065ef7e8.jpg','/image/get?name=parking/830d6535f11d8e3c0148a81adb0263ad.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 17:15:21','2019-04-10 17:04:04',NULL),(276,'10','20190409',2,'苏C8703K',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/cd3f4151f15fc630addf06585f5fca9b.jpg','/image/get?name=parking/633ee1246738c0178afb9322aaa17139.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 17:17:11','2019-04-10 17:05:54',NULL),(277,'10','20190409',2,'沪B6G177',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/e56cf31f06a39b08901dd6bc899fb13d.jpg','/image/get?name=parking/c07f0e605a207422b485c96f775dd561.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 17:28:50','2019-04-10 17:17:31',NULL),(278,'10','20190409',2,'苏J0Y918',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b80027690508071072ac42f3d0b604ff.jpg','/image/get?name=parking/e4d59dba241cc94d2dc639780bea48f7.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 17:33:37','2019-04-10 17:22:18',NULL),(279,'10','20190409',2,'沪A1K308',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/89ae1f93dfb2e5146e70454cb908747b.jpg','/image/get?name=parking/cd1218cf56c6695f23c8d7a34b630624.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 17:40:17','2019-04-10 17:28:56',NULL),(280,'10','20190409',2,'沪G97917',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/dfd501166ad76ce99eb8bc4a425a3c69.jpg','/image/get?name=parking/74ec743a2f5de66994d4ad9a6df28ccc.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 17:51:12','2019-04-10 17:39:49',NULL),(281,'10','20190409',2,'沪B107G6',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/197b95fe5f8a6aad5acab4b15ad4ccc4.jpg','/image/get?name=parking/86427dc3f6012a7ef6dad8d37efd8a1b.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 17:55:33','2019-04-10 17:44:11',NULL),(282,'10','20190409',2,'沪A4P523',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ec0a06ab5b6c2108453ba6d50d1ab396.jpg','/image/get?name=parking/627a2ab4d8ffd98d8b0b9e6e813fc074.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 18:05:30','2019-04-10 17:54:06',NULL),(283,'10','20190409',2,'沪B9A669',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/0177e6a255d3ae195225e6cba13581a7.jpg','/image/get?name=parking/364bc406198b14de6fe9c2592fbefffa.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 18:12:07','2019-04-10 18:00:42',NULL),(284,'10','20190409',2,'沪BAH060',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/4b1e8830636beb1dc8773fcdbd34af57.jpg','/image/get?name=parking/a800e87c00865958679ad6b0914472de.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 18:22:44','2019-04-10 18:11:17',NULL),(285,'10','20190409',2,'苏M8V331',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/e902b29028abbeacc02ebb6442b63e95.jpg','/image/get?name=parking/43681d000848174c27f3dce01cbe52b1.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 18:28:06','2019-04-10 18:16:38',NULL),(286,'10','20190409',2,'皖GH3515',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d1d4f714cffe7420c45787416779c06c.jpg','/image/get?name=parking/d278c87ee936dde61620d95c65ca1cb7.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,92,1,'2019-04-10 18:31:21','2019-04-10 18:19:53',NULL),(287,'10','20190409',2,'沪FB1768',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/3bd5efd6dc62203c1329cce292893802.jpg','/image/get?name=parking/859ec1ca88f44bf3815b4ca008089c29.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 18:33:26','2019-04-10 18:21:58',NULL),(288,'10','20190409',2,'皖BYZ213',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/363ff9569b59febb08edf8f49b6c8d15.jpg','/image/get?name=parking/407eb2c3e7f2ef0b94cf4587dddc73fc.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 18:44:25','2019-04-10 18:32:55',NULL),(289,'10','20190409',2,'川A0BE15',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/8118433feb761933b17d0d99b86ed32e.jpg','/image/get?name=parking/26803fb2aa49cc2a33b23441420e9644.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,92,1,'2019-04-10 18:54:03','2019-04-10 18:42:32',NULL),(290,'10','20190409',2,'苏D78E12',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b336efdbef6f7296ca10a8ebbd273526.jpg','/image/get?name=parking/121635cdde3aa98d369409518cd72c78.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 19:00:01','2019-04-10 18:48:29',NULL),(291,'10','20190409',2,'沪A570Q9',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/26ac7c33740939d3a3fca37f97030b38.jpg','/image/get?name=parking/22acaca1d98345a0f98184cc2ff8b713.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 19:02:07','2019-04-10 18:50:35',NULL),(292,'10','20190409',2,'皖AV761K',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f68e6d534e78fc43e4815bc2a372d019.jpg','/image/get?name=parking/7b3c0a2afb9da76903d104977a7682ff.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 19:05:47','2019-04-10 18:54:14',NULL),(293,'10','20190409',2,'沪GZ1233',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/1e9ce2475ee94dcf4463949fb57e42a9.jpg','/image/get?name=parking/69f33dbe2ad2288cbee002ea7c1c00ce.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 19:12:27','2019-04-10 19:00:53',NULL),(294,'10','20190409',2,'沪FB1768',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/313271737f8e245afb9473d1654f7b1a.jpg','/image/get?name=parking/13625af841fad9e9da759573ce8ee99b.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 19:16:19','2019-04-10 19:04:45',NULL),(295,'10','20190409',2,'沪J69360',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/6d227f0137a4a908bb16ea9390fbcb45.jpg','/image/get?name=parking/f1329b2e83bd5a708dffaebf88029530.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 19:30:53','2019-04-10 19:19:16',NULL),(296,'10','20190409',2,'沪B1B168',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7c447f7a1e13d7c72949030a307d9627.jpg','/image/get?name=parking/a8b29ac02e9a0690afddec948b13c057.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 19:35:25','2019-04-10 19:23:48',NULL),(297,'10','20190409',2,'沪A7S583',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/82713694f4c77a64577b06cb1f357ed8.jpg','/image/get?name=parking/49cd35f80babbf6e1a280337bc2f1df1.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 19:38:26','2019-04-10 19:26:49',NULL),(298,'10','20190409',2,'豫SV7408',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/e1df823c9898eebd14375762e98941e6.jpg','/image/get?name=parking/efc5ced9cdcae736c7b092c0827b4a04.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,89,1,'2019-04-10 19:52:18','2019-04-10 19:40:39',NULL),(299,'10','20190409',2,'沪ML2333',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/05a06e0b7c7ea2ba7cd4932fefdd5c81.jpg','/image/get?name=parking/7882571258e5a5ff569110174db891aa.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,89,1,'2019-04-10 19:57:34','2019-04-10 19:45:54',NULL),(300,'10','20190409',2,'皖S2E516',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b928d6398034dc96d6a1a6fdbef4c09a.jpg','/image/get?name=parking/0d3b9fbca004d5668360439c02ccbc96.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 20:00:58','2019-04-10 19:49:18',NULL),(301,'10','20190409',2,'豫A0S53M',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b0fafb5c95aa94a9b7a74f4caf27b982.jpg','/image/get?name=parking/856ddf502d504f1a6323400e554aed28.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 20:01:21','2019-04-10 19:49:41',NULL),(302,'10','20190409',2,'苏BQ9M19',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f9f6241e380dd5f82281be8e710d8f5a.jpg','/image/get?name=parking/2b38e0ef1fe458683b29a5580881514e.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 20:04:48','2019-04-10 19:53:07',NULL),(303,'10','20190409',2,'沪JY7985',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/65e437022db4c02d09f161f9061a5892.jpg','/image/get?name=parking/95be4b1bbbf4cc31c59c969dd72d147f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 20:12:21','2019-04-10 20:00:39',NULL),(304,'10','20190409',2,'沪B1Q100',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/03151851908d77d7303a825143dd0ab1.jpg','/image/get?name=parking/33c40f84482c2eea9423ec4abb992cdd.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 20:21:32','2019-04-10 20:09:48',NULL),(305,'10','20190409',2,'沪B765K7',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a77c6fef55cff7e35bb72665cfdd7ad5.jpg','/image/get?name=parking/7130861d08dfd189fde9ed0eaf42b8c9.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 20:35:00','2019-04-10 20:23:15',NULL),(306,'10','20190409',2,'苏F79R15',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/5a6773341fb298df6c3f0252e4af89ab.jpg','/image/get?name=parking/eeaaa607b9a21ee09309353560dc5b88.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 20:49:37','2019-04-10 20:37:50',NULL),(307,'10','20190409',2,'沪G97917',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/756d4cdd271f8913ff11905d78b91510.jpg','/image/get?name=parking/fbb3c88a5436d10b9dfbf3b3aa7f937f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 20:53:45','2019-04-10 20:41:57',NULL),(308,'10','20190409',2,'沪EG8666',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/cfe545be411f3e5e4ecc2dadaa157cd9.jpg','/image/get?name=parking/ae5a1777a298dba9e8e14b73884d6318.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 20:57:56','2019-04-10 20:46:08',NULL),(309,'10','20190409',2,'甘M3P076',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/4229e8ef435f8bef5f0971476bd22849.jpg','/image/get?name=parking/927566e4022dc93c29816fe611021f05.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 21:00:34','2019-04-10 20:48:46',NULL),(310,'10','20190409',2,'沪A8X862',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2724487b20d1881dd8085b5900309c3d.jpg','/image/get?name=parking/f092687af06c295ffc43132528ae737d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 21:08:35','2019-04-10 20:56:44',NULL),(311,'10','20190409',2,'沪B6G376',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c9bfe095e0208b5cf1f4fcad452b942f.jpg','/image/get?name=parking/3227bb2265b2ea77708e2be5c53d74c6.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 21:27:21','2019-04-10 21:15:28',NULL),(312,'10','20190409',2,'苏BM569N',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d24618ee82c36984cbb97ced04bfd78f.jpg','/image/get?name=parking/4974c8209769cc0940d2273e77a80f18.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,67,1,'2019-04-10 21:34:54','2019-04-10 21:23:00',NULL),(313,'10','20190409',2,'沪GZ1233',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/8ea796021a553df5a3436eee79812d54.jpg','/image/get?name=parking/508bd3937060552a5f65861a08d46120.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-10 21:41:13','2019-04-10 21:29:19',NULL),(314,'10','20190409',2,'沪AF63687',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/4d9f09b97f6826927f366566c55c6d12.jpg','/image/get?name=parking/cac980575ea8f64ba45e80390c3058f7.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-10 22:19:03','2019-04-10 22:07:03',NULL),(315,'10','20190409',2,'鄂A58U8M',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/171f69efeef3027cfd1aba4c1c3c9832.jpg','/image/get?name=parking/b30dc46ffad86fef4b549742ee71dc12.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,89,1,'2019-04-10 22:30:01','2019-04-10 22:17:59',NULL),(316,'10','20190409',2,'沪GU6653',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ae5d320cf1d810b6ed777d6da359ef27.jpg','/image/get?name=parking/07d8b5e88a361b031c874163af8d23d3.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 00:33:37','2019-04-11 00:21:18',NULL),(317,'10','20190409',2,'沪G97917',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/94241a16ff36edfaa600dc2f65d70a56.jpg','/image/get?name=parking/eefaec60fe3d38a75d28240829e7bc51.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 00:53:15','2019-04-11 00:40:53',NULL),(318,'10','20190409',2,'沪DR0712',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c1a663180e3d43baed7e282ee0d7171a.jpg','/image/get?name=parking/67aff27b3652cc1352f0a141ff3bca37.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,92,1,'2019-04-11 02:06:48','2019-04-11 01:54:16',NULL),(319,'10','20190409',2,'沪A823K2',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/8be493354437d069887dbc337e4964e6.jpg','/image/get?name=parking/1e8c1999d1c3dea510516e1ccab4def5.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 02:25:17','2019-04-11 02:12:42',NULL),(320,'10','20190409',2,'沪A83Q68',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a3ebc7c3859180a5d40198f0289ce749.jpg','/image/get?name=parking/ba775c835229a41431a9604e241bb3bc.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 05:51:28','2019-04-11 05:38:24',NULL),(321,'10','20190409',2,'沪HY6889',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/795d8cbbe24d3010797e00821d2e8d10.jpg','/image/get?name=parking/451eb2aab04a9e8566e48ef3d6ba71a4.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 05:51:40','2019-04-11 05:38:36',NULL),(322,'10','20190409',2,'沪BSN937',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/709383ab7e44ab69085476e0b86d9ddc.jpg','/image/get?name=parking/8fd14a92b81c633069d8fba07e15bf99.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 05:57:35','2019-04-11 05:44:31',NULL),(323,'10','20190409',2,'沪BMT989',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7dc2ae30e7cac9f5372534c61ca5b30c.jpg','/image/get?name=parking/ab04c0fa2e02313f1f39b164ad0bdd3f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 06:11:22','2019-04-11 05:58:15',NULL),(324,'10','20190409',2,'沪AFC069',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/3bc9b3c56ce5db47254f73a06bcdf503.jpg','/image/get?name=parking/a27aa58cf6723a625ac4165f7892e6ce.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 06:17:36','2019-04-11 06:04:29',NULL),(325,'10','20190409',2,'沪BVN716',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7a2cc4b69fa56da23a5229464b51788b.jpg','/image/get?name=parking/55439fd0d991c61f67647b302d215e59.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 06:18:00','2019-04-11 06:04:53',NULL),(326,'10','20190409',2,'沪DBC109',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f3c758b853fd02c29726f75516d00f93.jpg','/image/get?name=parking/5106b2150caf1e7a95d106f5559fba80.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 06:27:35','2019-04-11 06:14:26',NULL),(327,'10','20190409',2,'浙GDS191',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/de674ea23a9574b0675ecc012a02330f.jpg','/image/get?name=parking/640b83eb866b0f863203707b2f718ed5.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 06:31:55','2019-04-11 06:18:46',NULL),(328,'10','20190409',2,'鲁R1H686',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/39f0f135071bbd38c2fee3e82eda9480.jpg','/image/get?name=parking/649a60619223cf996e8bfa295d7f9096.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 06:32:04','2019-04-11 06:18:55',NULL),(329,'10','20190409',2,'沪A71K97',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c503536ab3ab06f262bd86696f9b4feb.jpg','/image/get?name=parking/224217bdc8f090d924bc96ae210a90a5.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 06:37:51','2019-04-11 06:24:41',NULL),(330,'10','20190409',2,'沪AF23109',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/8609e2592d04e58769ddaf6b031173fc.jpg','/image/get?name=parking/e5941def91828e030bf3b8ba9af68405.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 06:39:49','2019-04-11 06:26:38',NULL),(331,'10','20190409',2,'苏CW319A',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/dd45397e0f0c5d3767ac58abcc950ec4.jpg','/image/get?name=parking/1f18cdf7a1f8f61753fd18dc9fd4d220.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 06:40:13','2019-04-11 06:27:02',NULL),(332,'10','20190409',2,'沪B8N250',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/366bf699a7299ee4c02bac702b97ae55.jpg','/image/get?name=parking/26bd45c8ebdf11c1064367bae7a8b6ba.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 06:46:09','2019-04-11 06:32:57',NULL),(333,'10','20190409',2,'苏M8Q571',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/17a341154a4ad2df13f543d008cff8f9.jpg','/image/get?name=parking/d031652298023ff694c4c2634acf2166.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 06:53:29','2019-04-11 06:40:17',NULL),(334,'10','20190409',2,'沪A093V8',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c5dd4eddc78a7dca626667f2fa60b389.jpg','/image/get?name=parking/db3e0379da27337990b74a39803ad20a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 06:57:49','2019-04-11 06:44:36',NULL),(335,'10','20190409',2,'陕GSZ208',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/533cca9e22a6bb9f3353467b8bb7c43f.jpg','/image/get?name=parking/5ad947275ee5fce8936a7bc5e62358fb.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:00:04','2019-04-11 06:46:50',NULL),(336,'10','20190409',2,'沪A531J6',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b81aebf8989ddc5a7bace10d06466e4f.jpg','/image/get?name=parking/1ab7e3795e64b148172d3de9c65e744c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 07:00:22','2019-04-11 06:47:09',NULL),(337,'10','20190409',2,'沪BDR935',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b08aaca33822a2e7614eef6eaf665add.jpg','/image/get?name=parking/cd385cc777c2584b8c41dad5ba19aa8c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:00:58','2019-04-11 06:47:44',NULL),(338,'10','20190409',2,'浙B69R17',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/140428b0584e11a41fa0b2d320397121.jpg','/image/get?name=parking/06189f29ae7a31c1ca5fc4937074bd7d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 07:01:11','2019-04-11 06:47:58',NULL),(339,'10','20190409',2,'沪K13717',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/dc4fc177e4e966357ce153fecd253b31.jpg','/image/get?name=parking/0e797ff3355e025efcbfc7470ecdb60f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:01:32','2019-04-11 06:48:19',NULL),(340,'10','20190409',2,'沪B69Q91',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a7300e86e414e414a570fed83363fc86.jpg','/image/get?name=parking/dc01955a75086b627c5f9d55bc915872.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:02:33','2019-04-11 06:49:19',NULL),(341,'10','20190409',2,'苏HT5095',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/19266a26b2d606758a70bccf476d971a.jpg','/image/get?name=parking/450333c44362eff256fc3e47e56ce443.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:03:09','2019-04-11 06:49:55',NULL),(342,'10','20190409',2,'沪A5J993',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/990f93900aa6780b17cb5d14ab6ac6e9.jpg','/image/get?name=parking/5dfa5da1fe0517347fdd7acc3693d6bc.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 07:04:49','2019-04-11 06:51:35',NULL),(343,'10','20190409',2,'皖EDF521',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ae8f4f2582004be99c3caea62f8116cb.jpg','/image/get?name=parking/492de966d22b71d244ab9c4949fcc42f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:06:02','2019-04-11 06:52:48',NULL),(344,'10','20190409',2,'沪A37K68',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f51d32fda5cf95db57214a5eda554ddd.jpg','/image/get?name=parking/02b22c87a0d5fbb3003c80e5c99e5154.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:06:42','2019-04-11 06:53:28',NULL),(345,'10','20190409',2,'沪DGV562',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/4068034b2474ae6739a696ded8fa660f.jpg','/image/get?name=parking/0e685420ccfc37ef28a431773e06a340.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:08:06','2019-04-11 06:54:52',NULL),(346,'10','20190409',2,'苏B652K7',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a6d06ff86242e7de8bd5e37c5577e860.jpg','/image/get?name=parking/ec334c64a15aa1912780b88df799ca51.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:08:59','2019-04-11 06:55:45',NULL),(347,'10','20190409',2,'苏KR9512',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9443b1a5bebffde9b58391ab5f354024.jpg','/image/get?name=parking/aa66bd09512252b54eb147bd4b0230b3.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 07:11:01','2019-04-11 06:57:46',NULL),(348,'10','20190409',2,'苏BM569N',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/33f2791604f859f735167694dccaec53.jpg','/image/get?name=parking/e5550dd16f85adbb5810481b4b3d72ec.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:11:06','2019-04-11 06:57:51',NULL),(349,'10','20190409',2,'沪GE6293',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/07fd4d510a11089bac801eed7cb57e93.jpg','/image/get?name=parking/a9640d55aa3c80f8458173e34e066aa3.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:13:12','2019-04-11 06:59:57',NULL),(350,'10','20190409',2,'皖GE4889',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c87b958f3cab7f6363405378dc35aaf8.jpg','/image/get?name=parking/9474e319921d93cba39b5d17a53f01c8.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:13:40','2019-04-11 07:00:25',NULL),(351,'10','20190409',2,'沪B5B939',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/4709ae051eea66767feb1dfb254255e3.jpg','/image/get?name=parking/5f5be7f78b945f498f99dc31b20ad88e.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:14:34','2019-04-11 07:01:19',NULL),(352,'10','20190409',2,'沪EH7635',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/59f94951a9d46d05046ba46f01ba8b97.jpg','/image/get?name=parking/3814e28c3726eb5a690ab340f0e8bd77.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:16:06','2019-04-11 07:02:51',NULL),(353,'10','20190409',2,'沪B626P2',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b8faea7d387f72d68f3ddd00c7c933bd.jpg','/image/get?name=parking/f506b6de4dea34b0e30066d8fa5e8f85.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:16:28','2019-04-11 07:03:13',NULL),(354,'10','20190409',2,'沪B1Q100',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/fabeb353c57c6f8764e597d8191fdb96.jpg','/image/get?name=parking/0deb61f4e7c48f2be96d84c28f36aa41.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:19:26','2019-04-11 07:06:10',NULL),(355,'10','20190409',2,'赣FL5550',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2dd3cf118f0ed0de09912e4fafb681f3.jpg','/image/get?name=parking/662e2db596f1672aad2933e7803ee754.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 07:20:20','2019-04-11 07:07:03',NULL),(356,'10','20190409',2,'沪G97917',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2c1bcbdaf44ec4746ed4311749ddcf2e.jpg','/image/get?name=parking/e3bfb84418361b337c95ec0bd896c047.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:23:43','2019-04-11 07:10:26',NULL),(357,'10','20190409',2,'苏D78E12',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/6b1eaf3b9981c5f57bd4933e7a7a2cd1.jpg','/image/get?name=parking/e80f8d346b0f4947e29a6870cfe2f92b.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 07:23:55','2019-04-11 07:10:39',NULL),(358,'10','20190409',2,'沪B7Q518',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b957b4f09b6e8e05e841716f809d04ea.jpg','/image/get?name=parking/535678b8c290f2537e8c6c328f4c68bc.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:30:37','2019-04-11 07:17:20',NULL),(359,'10','20190409',2,'沪BUM561',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/1f6da3412f469bf146c6434a3b4a9fb8.jpg','/image/get?name=parking/4c4f5f192c50941e229db71fdb6414d0.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:33:56','2019-04-11 07:20:38',NULL),(360,'10','20190409',2,'沪A37C67',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/de25bcc9ccd896c5caf2a6784a4bbcc2.jpg','/image/get?name=parking/d6bf6528dca6ab6c93f62339c33922a1.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:34:26','2019-04-11 07:21:08',NULL),(361,'10','20190409',2,'京N1EK18',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ea7a8dc2b0024e50bf3be2106cdb1a55.jpg','/image/get?name=parking/491f90009319b1f41221570b50daff93.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:35:59','2019-04-11 07:22:41',NULL),(362,'10','20190409',2,'沪A654L1',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/83f58ca54d28c7585f5457076ca1eb6b.jpg','/image/get?name=parking/658fa90858507df2fd18aa4ed040b2c9.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:36:47','2019-04-11 07:23:29',NULL),(363,'10','20190409',2,'沪JY7985',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/fc6b048cda69db0bdbc9523257081d5d.jpg','/image/get?name=parking/ba66bf9bc32af4b8681c67a44a306545.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:38:29','2019-04-11 07:25:10',NULL),(364,'10','20190409',2,'陕AG318A',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7916b3728e1aff460b93f8b619bb3319.jpg','/image/get?name=parking/e8a4b9a16642481e599ceb44be4d173e.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:39:21','2019-04-11 07:26:02',NULL),(365,'10','20190409',2,'苏K31755',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/72c58786531e2fb4bfcdfdae07383bbc.jpg','/image/get?name=parking/b82b158079f0907f9d8b8025975668f0.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,92,1,'2019-04-11 07:41:05','2019-04-11 07:27:46',NULL),(366,'10','20190409',2,'浙AY9U50',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/999d5b5b0c3689da97deb6f5220938b9.jpg','/image/get?name=parking/503e451254b7468a0d76cc944b48fe99.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:47:32','2019-04-11 07:34:12',NULL),(367,'10','20190409',2,'沪A500W7',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c5dfc27d386799ff42e0822cd0441df9.jpg','/image/get?name=parking/2ab5b87bf67984bbd4b4a777d6fc0d53.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 07:47:40','2019-04-11 07:34:20',NULL),(368,'10','20190409',2,'沪A978Q5',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f6b04688ef9699867252cae3853b79d6.jpg','/image/get?name=parking/d95190ecd00b39dbeb13585c49dfbb92.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:50:08','2019-04-11 07:36:48',NULL),(369,'10','20190409',2,'苏EN9X37',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/5871ac9e52bc0307926c2d56b42257fb.jpg','/image/get?name=parking/905c8ae4d93e9ce7fcabe058eedb985b.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 07:50:10','2019-04-11 07:36:50',NULL),(370,'10','20190409',2,'苏E592MM',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7954af9b875d6cc3721d0af6afdc9ee8.jpg','/image/get?name=parking/5cdb9e5afddda9bb3f674d34d56d7b3d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:53:40','2019-04-11 07:40:20',NULL),(371,'10','20190409',2,'沪BAH060',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9b2ffa759945b80dcc1c54d61dc95923.jpg','/image/get?name=parking/3bcb1acb0e4c806d0ce79619fd3809db.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:55:32','2019-04-11 07:42:11',NULL),(372,'10','20190409',2,'沪AF97709',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/4f57bee0493c516448c619b7acbb6913.jpg','/image/get?name=parking/9ea707571e726a70eeecc0c871b6864f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:55:37','2019-04-11 07:42:16',NULL),(373,'10','20190409',2,'苏A63C53',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/83f431aed3369e0f027ee4d9e592585a.jpg','/image/get?name=parking/1f60823312c2811d77843866c3b03c37.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:57:29','2019-04-11 07:44:07',NULL),(374,'10','20190409',2,'浙AM602D',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/1143bc56fac9921bdf8fc70fa3aff18e.jpg','/image/get?name=parking/5ac89b25a3908ba4cbf83a647c1eadfa.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 07:58:15','2019-04-11 07:44:54',NULL),(375,'10','20190409',2,'苏K7601R',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/6d5413ef4c70f61567973680f0fbd5fc.jpg','/image/get?name=parking/1db8dfcb9bfd40e18b4802df223e2af9.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:00:11','2019-04-11 07:46:49',NULL),(376,'10','20190409',2,'沪KZ5151',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a81d2206dbd3aaeb5ef349131c1f207c.jpg','/image/get?name=parking/f75521b81a4166f9441a7dbaee4a1733.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:03:05','2019-04-11 07:49:43',NULL),(377,'10','20190409',2,'沪AFF535',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/44badef8ed42393a7f1c94f95720d8de.jpg','/image/get?name=parking/0f0b365f9a44fc613b8a4f6833f44c8e.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 08:03:14','2019-04-11 07:49:52',NULL),(378,'10','20190409',2,'沪EE5519',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9b9a86501d193be6d5788ff1ade7d4d9.jpg','/image/get?name=parking/56782dd407c6e046b05237ec9336f61a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:06:19','2019-04-11 07:52:56',NULL),(379,'10','20190409',2,'苏FGU756',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/035d1a2abe3f842f2d4752d3111085d6.jpg','/image/get?name=parking/44fa93d199160e5b9a97faf4740b1226.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:09:34','2019-04-11 07:56:11',NULL),(380,'10','20190409',2,'沪BXX930',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a68714e317960516f204926b02f3e14b.jpg','/image/get?name=parking/89eb0e12d951e74f47e35ead02e32245.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:10:12','2019-04-11 07:56:49',NULL),(381,'10','20190409',2,'沪A028P0',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a79d3e487175295bd596d70e319e842a.jpg','/image/get?name=parking/00ca3a5d92d5b77cbe94569a89316b6a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:19:38','2019-04-11 08:06:14',NULL),(382,'10','20190409',2,'浙LD5381',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b2b78a82a2988e292ffc966ecea834b4.jpg','/image/get?name=parking/21a175f38e72e7a7608e4fb49574c0ae.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:19:52','2019-04-11 08:06:28',NULL),(383,'10','20190409',2,'晋L66P02',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/0340837044b2b2471b99aa82dfdbad6b.jpg','/image/get?name=parking/72626d07e9d2dcbcfcac4d5bdb4b3d19.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:20:33','2019-04-11 08:07:08',NULL),(384,'10','20190409',2,'苏M8V331',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/07ceddf4a7ed024f995feac4e00216b0.jpg','/image/get?name=parking/fe776decaf844ff044507cf4d107000f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:21:36','2019-04-11 08:08:11',NULL),(385,'10','20190409',2,'沪DAL006',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d56bd8f6d792eea35f72d633752b2f7f.jpg','/image/get?name=parking/1e31eb5a30a9ece19330f59a347a7868.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:22:09','2019-04-11 08:08:44',NULL),(386,'10','20190409',2,'沪AWG837',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/e14d1577dc238822772ddb10c67b5252.jpg','/image/get?name=parking/5be73820028cf7de052b7a3b351b31de.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:22:41','2019-04-11 08:09:16',NULL),(387,'10','20190409',2,'沪BNZ570',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/689ec5500b73fc905c549093f98ac730.jpg','/image/get?name=parking/aa01d8bf57b2b7ba42a9d38b1394e51c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:27:03','2019-04-11 08:13:37',NULL),(388,'10','20190409',2,'沪EG1525',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7e04f1f6c3725a7dff4af78441975c4e.jpg','/image/get?name=parking/224b2cea9101a531e5534cb8d4e118fb.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:31:21','2019-04-11 08:17:55',NULL),(389,'10','20190409',2,'沪A3D535',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f33799af82da900e4863f86b234241cf.jpg','/image/get?name=parking/8b92b6506b536a477274a6a25bba9e8d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:31:31','2019-04-11 08:18:05',NULL),(390,'10','20190409',2,'沪DKD033',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/92f7eec82ce7be5fde33a793490c0a38.jpg','/image/get?name=parking/e5ebb19ef6a9fefdb8f6b3684621c5e7.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:33:55','2019-04-11 08:20:29',NULL),(391,'10','20190409',2,'沪BHU690',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c469066992ab06af2e40bacd1ae00eda.jpg','/image/get?name=parking/e87633871b2b6a503172033ec862ba16.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:35:38','2019-04-11 08:22:11',NULL),(392,'10','20190409',2,'沪A7Q562',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/8433f347a934ece8fed13da7d2265b62.jpg','/image/get?name=parking/42e613032098c71bfe4e264fba2efc75.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:38:20','2019-04-11 08:24:53',NULL),(393,'10','20190409',2,'沪EJ0353',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/864141318d548a166f123db09007c7e1.jpg','/image/get?name=parking/6e95243e42e4411e93c2234e548e0ad4.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:39:14','2019-04-11 08:25:47',NULL),(394,'10','20190409',2,'苏FRF881',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f33c80191761982e68cef71b23b2190f.jpg','/image/get?name=parking/40705e5f8dc4becd7bd0643adce38996.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:42:34','2019-04-11 08:29:07',NULL),(395,'10','20190409',2,'皖AV761K',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b37ae59275282c8451eefaf03a7b4b1c.jpg','/image/get?name=parking/efd0bd0a4335c08c10ad365e4396ce0a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:49:03','2019-04-11 08:35:35',NULL),(396,'10','20190409',2,'沪A132K6',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9bde9f5d743d245467d1fe7c626beb71.jpg','/image/get?name=parking/a0773ef82ef7bb1d10c7216712d2d45e.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 08:54:20','2019-04-11 08:40:51',NULL),(397,'10','20190409',2,'粤JF1278',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ac6a4bb29096c94739bfcc2ba3539a85.jpg','/image/get?name=parking/ba5ffe95cff4cad8352e37139cbe3f55.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,71,1,'2019-04-11 08:54:34','2019-04-11 08:41:05',NULL),(398,'10','20190409',2,'沪BRT044',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/e0aac43f2051e972493a9fd7a8e304c5.jpg','/image/get?name=parking/ecdbd9f0ae1dd6b3ddbc04fccb28082a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:55:04','2019-04-11 08:41:35',NULL),(399,'10','20190409',2,'沪LB9330',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/71edcff5c8748d7dc671b1c7a08a2e0d.jpg','/image/get?name=parking/1206cb9d9ee7437e81401d3e57d48232.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 08:58:50','2019-04-11 08:45:21',NULL),(400,'10','20190409',2,'沪A32G31',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/8240b60d705da32b56f44385fc43969b.jpg','/image/get?name=parking/404cc9e78c2caebb7cd98b130302862f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 09:03:06','2019-04-11 08:49:35',NULL),(401,'10','20190409',2,'沪EJ2689',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7493c65e1aa2bdf77c6531eac58a7378.jpg','/image/get?name=parking/3bfb0cc80ad7d083e318b685b926b44f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 09:06:45','2019-04-11 08:53:14',NULL),(402,'10','20190409',2,'沪A370Q6',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/3a8e60206aca96cf5f3cd133077b8d79.jpg','/image/get?name=parking/e151bb32c54aef65d092036be3008f79.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 09:10:38','2019-04-11 08:57:06',NULL),(403,'10','20190409',2,'沪B602D9',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a9b19fbe7cc0f4fa84329de3c0be44b8.jpg','/image/get?name=parking/c37ffdc746ebe81cfda66553f4f8a9d0.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 09:12:42','2019-04-11 08:59:10',NULL),(404,'10','20190409',2,'苏AR2233',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/141da0354362a253a70d6385d1166ec2.jpg','/image/get?name=parking/a0ce48a16cb0cd152db117b5e0b991ff.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 09:15:29','2019-04-11 09:01:57',NULL),(405,'10','20190409',2,'沪B027F8',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b91e5c70ba27b31553c5e7ebe13e29bc.jpg','/image/get?name=parking/8e18e80f464cd0d77c1df8289b5ae8cc.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 09:16:52','2019-04-11 09:03:20',NULL),(406,'10','20190409',2,'沪DL2398',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/e573dee1538ed8c84cf92457820f4ab0.jpg','/image/get?name=parking/a7fbbdb049f5dedbf14e8543f31b19e0.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 09:19:53','2019-04-11 09:06:20',NULL),(407,'10','20190409',2,'沪B6G177',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7c0b3006449c18b42b698c1adac6427a.jpg','/image/get?name=parking/7fe4d900d0216da2678e7fe3b5023cf2.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 09:20:19','2019-04-11 09:06:46',NULL),(408,'10','20190409',2,'浙BA885W',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/3b5b7315bb2fabaa3d66c193590d66a3.jpg','/image/get?name=parking/3c2aacd8a6dd8630d6ec62826796898c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 09:35:57','2019-04-11 09:22:22',NULL),(409,'10','20190409',2,'沪B997P2',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b911d2e61ad209422bff904146266675.jpg','/image/get?name=parking/e7c9eebd089cff5846d697c99df96ceb.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 09:36:07','2019-04-11 09:22:32',NULL),(410,'10','20190409',2,'苏DJ587Y',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/55d861f06a10ae42ed4a73210463b733.jpg','/image/get?name=parking/74e3c361f4a5c6157c3ee62fb3f1fab9.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 09:40:52','2019-04-11 09:27:16',NULL),(411,'10','20190409',2,'晋LP5662',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/63553c13081384a2cf5f01579a623222.jpg','/image/get?name=parking/b9570f5f68762143ba353ac7bd42431b.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 09:41:37','2019-04-11 09:28:01',NULL),(412,'10','20190409',2,'沪NB9775',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/243a806dfe190ae07ca472a0405924fe.jpg','/image/get?name=parking/8b31f4fae797a94718abb80968164854.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 09:42:44','2019-04-11 09:29:08',NULL),(413,'10','20190409',2,'苏J9Y256',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2b55b3f5204872fcbd07bd633e71df64.jpg','/image/get?name=parking/ea8eefe43ad936c6e5ab3f3d31c18609.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 10:03:32','2019-04-11 09:49:53',NULL),(414,'10','20190409',2,'苏E6SZ33',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/34b224e098f4a62cea4922790e1a997a.jpg','/image/get?name=parking/5611d53cc3a34c75acfa39b7cf5e4236.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 10:12:14','2019-04-11 09:58:34',NULL),(415,'10','20190409',2,'湘FA5992',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/cc238e87bd5e0608faebdf8e154e2bc4.jpg','/image/get?name=parking/3d16fa51c3a7ac505aec947a3fd92c16.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,82,1,'2019-04-11 10:16:36','2019-04-11 10:02:55',NULL),(416,'10','20190409',2,'沪BVE538',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/cf785240c7ca465c9ea1c19f59b6f7e2.jpg','/image/get?name=parking/30dd6f505d12f954031205ffae674d91.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 10:18:30','2019-04-11 10:04:49',NULL),(417,'10','20190409',2,'浙DN77P8',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ae0ff77e13a7864c15373533575470e3.jpg','/image/get?name=parking/611350d9b7e796ae1995f062f0c3f3fd.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 10:21:09','2019-04-11 10:07:28',NULL),(418,'10','20190409',2,'沪A71K97',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/3ef576f2c91dabafbc944b11e5eb55b4.jpg','/image/get?name=parking/9cb7a9f26089371b1c4d4311ccff3394.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 10:24:38','2019-04-11 10:10:56',NULL),(419,'10','20190409',2,'沪AF56553',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/6906699044364c42b30419609b60926a.jpg','/image/get?name=parking/2d92799bc4852872f35c01cb0a71f38a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 10:32:17','2019-04-11 10:18:34',NULL),(420,'10','20190409',2,'沪B07B08',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/13f06db4b45c68e4fc99a21c81d1b53c.jpg','/image/get?name=parking/330732fe4a1542266d9226a06075764d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 10:48:10','2019-04-11 10:34:25',NULL),(421,'10','20190409',2,'沪EG1525',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2ef2f1d229802185a5930b9ddf7bbddb.jpg','/image/get?name=parking/fcaf7d5e1f3aa0ed54a0198659f1f447.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 10:51:14','2019-04-11 10:37:28',NULL),(422,'10','20190409',2,'辽MAC586',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/291eb470b22f5a653dbad92f547a8bb4.jpg','/image/get?name=parking/583e2820fd1e320d6abf61dd136713c0.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 10:54:14','2019-04-11 10:40:28',NULL),(423,'10','20190409',2,'沪EE5519',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/6fe139dd42db5d073726a37100c74bc6.jpg','/image/get?name=parking/4b42f40dc2c86653aea7e10cc11d1b86.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 10:56:03','2019-04-11 10:42:16',NULL),(424,'10','20190409',2,'沪MB9293',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/1716dda42afef4a9ce7b15a2574af4d9.jpg','/image/get?name=parking/7b982519d1786b16fbb38bc76c64717a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 10:57:56','2019-04-11 10:44:09',NULL),(425,'10','20190409',2,'沪DL2398',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ff39aa3320d54b1d585f5dadaf9a3991.jpg','/image/get?name=parking/08a2a6178092b4e8b7bdfc9e17d216c9.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 11:13:09','2019-04-11 10:59:20',NULL),(426,'10','20190409',2,'沪G23676',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/e053e585c846d13f210fcaf880732b6d.jpg','/image/get?name=parking/35873f7b1902b24a3dfd2dbac15ef29f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 11:21:17','2019-04-11 11:07:27',NULL),(427,'10','20190409',2,'苏C635LL',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/5f1a10bf99247440c43f51d947cf0a01.jpg','/image/get?name=parking/884d3751d53d46faf5b91aba57f222c7.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,57,1,'2019-04-11 11:22:24','2019-04-11 11:08:34',NULL),(428,'10','20190409',2,'沪BCG700',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/0879f74c4eb7126b481a5e8d9d2484ae.jpg','/image/get?name=parking/77085533b8788697aa59415ca892dc95.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 11:30:00','2019-04-11 11:16:09',NULL),(429,'10','20190409',2,'京Q3C635',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f8e662fa2384c35dd3d44f58127e1ae4.jpg','/image/get?name=parking/eaf013f573789e214581c5186b9806fe.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 11:37:47','2019-04-11 11:23:55',NULL),(430,'10','20190409',2,'沪EFM522',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/abfd57906d5190cae9a2a1e3f67bb901.jpg','/image/get?name=parking/72fdb11a472bb863c67f45beb781246a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 11:39:18','2019-04-11 11:25:25',NULL),(431,'10','20190409',2,'皖EDF521',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b15c2af797849d2bd0b1b98c06255dcd.jpg','/image/get?name=parking/009ed35335752b5be7c4a34c83165ff5.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 11:40:49','2019-04-11 11:26:57',NULL),(432,'10','20190409',2,'浙G7E622',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f6dd5de7e16619a7074834397a661f05.jpg','/image/get?name=parking/f7b1220217d47095311ed913ca3c1394.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 11:45:07','2019-04-11 11:31:13',NULL),(433,'10','20190409',2,'沪AGM297',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7df8fbf7c09ab77ac2871e8b509c685f.jpg','/image/get?name=parking/c93f45c2082f5284a18ae023a4ef8bde.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 11:55:51','2019-04-11 11:41:57',NULL),(434,'10','20190409',2,'甘M3P076',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/1a4490d0695e74efec1960979fa4f3f7.jpg','/image/get?name=parking/3b486990577c851de62b37ce92ae71d8.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 12:14:07','2019-04-11 12:00:10',NULL),(435,'10','20190409',2,'甘M3P076',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d65389193ffd1f312ccc99020358e280.jpg','/image/get?name=parking/205edd6a5c83ecdbc0d649a78ea4b0b3.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 12:14:18','2019-04-11 12:00:21',NULL),(436,'10','20190409',2,'皖GE4889',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/0393a1f546759cb361c91c504b0a27b5.jpg','/image/get?name=parking/7ecf492e30652d1a2e832ac2315dd3b3.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 12:15:27','2019-04-11 12:01:29',NULL),(437,'10','20190409',2,'沪BBS235',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c501c0764161ba986ca7b8686ffd802e.jpg','/image/get?name=parking/de4fd7cb36bbb1514d175976dcb56c04.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 12:25:47','2019-04-11 12:11:47',NULL),(438,'10','20190409',2,'皖CHC869',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d4fdcea3fe41cac74e94ae6ab8966388.jpg','/image/get?name=parking/3cf46b60cd8b4c67dbab3f9b3675b03b.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 12:42:29','2019-04-11 12:28:28',NULL),(439,'10','20190409',2,'沪EJ2689',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/eae2e2aa7eb46513ce2c67ecb9c1f174.jpg','/image/get?name=parking/3a1f8e8fca7bbeafd78e30f6ea6bb10f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 12:43:40','2019-04-11 12:29:38',NULL),(440,'10','20190409',2,'沪EG8666',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/79dc3b21c0fdb730e6147fc901a7d957.jpg','/image/get?name=parking/0997ff82c6c59d107912daacacc941fb.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 12:54:23','2019-04-11 12:40:20',NULL),(441,'10','20190409',2,'沪G02551',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f352c4849d9dc242cd6b0ba95fcc5c7e.jpg','/image/get?name=parking/5a464d5ea0f4cbea488d7fab5138377f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 13:01:00','2019-04-11 12:46:56',NULL),(442,'10','20190409',2,'沪BLZ562',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a0cca24159a29dd6d7dd26490979de64.jpg','/image/get?name=parking/1ca8abc09f9a934e6bb8a4f948d27312.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 13:04:29','2019-04-11 12:50:25',NULL),(443,'10','20190409',2,'沪ALN508',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a0566d5db14960cad9534c908c8d81f1.jpg','/image/get?name=parking/1f9ac09158ce974103d40adba40da3e6.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 13:07:05','2019-04-11 12:53:00',NULL),(444,'10','20190409',2,'沪BEM083',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a84f99710b3226a3ee03d24b697126d7.jpg','/image/get?name=parking/273adea92cf021718fcaa74e8fa7c145.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 13:11:07','2019-04-11 12:57:01',NULL),(445,'10','20190409',2,'沪J69360',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/60a7fce15b616183b826782906202846.jpg','/image/get?name=parking/5347989c02e50ec37da66104c97f0c98.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 13:11:48','2019-04-11 12:57:43',NULL),(446,'10','20190409',2,'沪B6M377',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/8f3112511ac032c4f8484fdeab8aa126.jpg','/image/get?name=parking/a7be030992841fcb2f46a0a357e36194.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 13:16:08','2019-04-11 13:02:02',NULL),(447,'10','20190409',2,'沪AYW562',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f496e01a4075fb650d41de3d45f70457.jpg','/image/get?name=parking/5cb3ba95d894a08435cbb265c74e4961.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 13:18:29','2019-04-11 13:04:22',NULL),(448,'10','20190409',2,'沪EG1525',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/61e4bed496351993c2a306ac0272ed7d.jpg','/image/get?name=parking/c12d8549b8a89266c92e3e8c12c8eadd.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 13:22:02','2019-04-11 13:07:55',NULL),(449,'10','20190409',2,'苏N17H28',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/269abc031a1909236d1b649603958aac.jpg','/image/get?name=parking/7163df15409a9e4d5101d2ae09879b46.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 13:25:48','2019-04-11 13:11:41',NULL),(450,'10','20190409',2,'沪AWG837',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/28bf884335ba554ded14a5a37b4b2568.jpg','/image/get?name=parking/c0e06df1d3779a99a9737b729761adb2.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 13:26:13','2019-04-11 13:12:06',NULL),(451,'10','20190409',2,'苏EN9X37',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ae402281933abd3657c5865dc59ab08e.jpg','/image/get?name=parking/84c8dc64b36a33cc74d5b6a3a1264e5b.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 13:33:01','2019-04-11 13:18:53',NULL),(452,'10','20190409',2,'沪D37367',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f97f9a230e450be50db205f2b7ab40d3.jpg','/image/get?name=parking/09739f3bab54577da6ead3445f7d268f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 13:35:06','2019-04-11 13:20:57',NULL),(453,'10','20190409',2,'沪JT7709',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7f3605c22c68515e60e06c19dd4b7460.jpg','/image/get?name=parking/203aed9bdfb19e99e17535948377b731.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 18:10:04','2019-04-11 17:55:16',NULL),(454,'10','20190409',2,'苏J9Y256',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/760803040b0ffb7534911c3659f51c26.jpg','/image/get?name=parking/18dde31695bc0f8d959a1906354b0108.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 18:11:45','2019-04-11 17:56:58',NULL),(455,'10','20190409',2,'桂KNX188',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/8f9a4031dfd27db1b3abe489cd5b8e1c.jpg','/image/get?name=parking/dcce950315d930cc7f8ddc51208e6f93.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 18:12:31','2019-04-11 17:57:43',NULL),(456,'10','20190409',2,'皖HC895E',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d18ccf9e9fabad1d0b637b1f5b4028bf.jpg','/image/get?name=parking/b7e77f58ff8690a2e91738a37a0ca8b7.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 18:16:16','2019-04-11 18:01:28',NULL),(457,'10','20190409',2,'沪N10952',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/62e9b7ed57798935feec1f99c3b8ba31.jpg','/image/get?name=parking/eb57dd2c2d1739e8abaa479f594c0b93.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 18:17:36','2019-04-11 18:02:47',NULL),(458,'10','20190409',2,'沪A4P523',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/79fe219eb57787383386d4216ba51702.jpg','/image/get?name=parking/ef3db7a318c05c9338b6520cd86e085c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 18:23:17','2019-04-11 18:08:28',NULL),(459,'10','20190409',2,'沪AVN718',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/75d4c61f1d93267977bf1c9f20c41e5d.jpg','/image/get?name=parking/5001ebc8c0ea472948cc36b82bad0875.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 18:23:50','2019-04-11 18:09:01',NULL),(460,'10','20190409',2,'沪A3J929',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/adfda7619fadaec72b4668e9093293bb.jpg','/image/get?name=parking/e705c336c8e382f4e81e9069f5706440.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 18:25:36','2019-04-11 18:10:46',NULL),(461,'10','20190409',2,'浙DN77P8',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/6148cddb8f0e2b3c8cd001945e4586bc.jpg','/image/get?name=parking/fd205c51c80ed9b09e60c666630b8253.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 18:28:45','2019-04-11 18:13:55',NULL),(462,'10','20190409',2,'赣LN9368',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2cc6abee1a354558abb829ef4032317e.jpg','/image/get?name=parking/b65f1e0681e1c070c4d681e776d83e09.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,92,1,'2019-04-11 18:32:54','2019-04-11 18:18:03',NULL),(463,'10','20190409',2,'苏D78E12',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d83114810435d436266c1c27255f3ffe.jpg','/image/get?name=parking/5a0d1a63a988d182897394a04a9c6b73.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 18:34:56','2019-04-11 18:20:05',NULL),(464,'10','20190409',2,'沪L69255',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/82c605b6ed1172dbd0daebf29c2d8342.jpg','/image/get?name=parking/b1a5578503b3f9a0c242e5cde16babe2.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 18:38:28','2019-04-11 18:23:36',NULL),(465,'10','20190409',2,'沪B9A669',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/82a321035a384a15dfa68f0787a33de7.jpg','/image/get?name=parking/60c7152b9df6f308d2a9462c8e26d3da.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 18:42:17','2019-04-11 18:27:25',NULL),(466,'10','20190409',2,'京Q3C635',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/989a129bb48e2f8070f218aaabd49c19.jpg','/image/get?name=parking/f5e21a883f030a57df21150ae442a728.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 18:44:54','2019-04-11 18:30:01',NULL),(467,'10','20190409',2,'皖GH3515',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/6c36026a46110f45bb9e2ca0ecece14d.jpg','/image/get?name=parking/bb77a34ac31e6073cfda4990e296a2ca.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 18:45:40','2019-04-11 18:30:47',NULL),(468,'10','20190409',2,'闽JP6088',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/610129e6a8b6ab99a1d1d9e2c8ec479b.jpg','/image/get?name=parking/a40b6f5f7b0b69acd5d23c5545d710f1.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 18:52:29','2019-04-11 18:37:35',NULL),(469,'10','20190409',2,'苏EN9X37',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/3fac51d7d4ee704a35e635b0a48259d0.jpg','/image/get?name=parking/0e69d407b4f5e4f1b4ade9a5fcd962cc.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 18:55:31','2019-04-11 18:40:37',NULL),(470,'10','20190409',2,'沪GT8687',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/cdefbfc93ea2a42a0dadbb282ed9c205.jpg','/image/get?name=parking/6efd05cd6a70f667cde03eaffa4c698f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 19:05:02','2019-04-11 18:50:07',NULL),(471,'10','20190409',2,'沪DF4205',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a9e0aab29a845d359c99bdf0afd56f70.jpg','/image/get?name=parking/4c8652cdc8c4469fe17d9c3805a6fea9.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 19:09:39','2019-04-11 18:54:43',NULL),(472,'10','20190409',2,'皖L5R975',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/8f4bfbf5f07a00ddb8696e55c5e4cbdd.jpg','/image/get?name=parking/79f68fe8c4e9e498e54967caa99d0462.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 19:29:16','2019-04-11 19:14:18',NULL),(473,'10','20190409',2,'豫NGM273',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/445e1be4263e31b2eedfbe13647bb856.jpg','/image/get?name=parking/82572d0eac713fa2227c6ff86bcda260.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 19:31:58','2019-04-11 19:16:59',NULL),(474,'10','20190409',2,'苏NA992T',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/bbe74697cea41d2246a935ab7cd49c5d.jpg','/image/get?name=parking/4e5733177f59391845267af0d81032c4.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 19:38:10','2019-04-11 19:23:10',NULL),(475,'10','20190409',2,'皖S2E516',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/8f9a52f94f995b12a6686cef7ac8105f.jpg','/image/get?name=parking/149418e36d04a086f9c72dbcb86d8fb2.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 19:38:45','2019-04-11 19:23:45',NULL),(476,'10','20190409',2,'沪J69360',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/df66a8c726e5225e17bffec25563d415.jpg','/image/get?name=parking/006f4ed5f22cc19dc12f6e5a3b8ad77f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 20:01:39','2019-04-11 19:46:36',NULL),(477,'10','20190409',2,'沪EG8666',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2333408bef17cb4eeb175d1bbdecb1db.jpg','/image/get?name=parking/1b9ff8948271d6aa8183d341da0c0825.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 20:06:14','2019-04-11 19:51:10',NULL),(478,'10','20190409',2,'沪AFC628',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/6e4d056b2bbf84c377248b84df5f0f1e.jpg','/image/get?name=parking/ded5d568dcd5b6efd479fd46a51ccd54.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 20:10:12','2019-04-11 19:55:08',NULL),(479,'10','20190409',2,'沪AFL871',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ab21ed2ec81799641fc7a2840d60f565.jpg','/image/get?name=parking/0c84648693ee54c15fc70ab07e9ee777.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 20:11:03','2019-04-11 19:55:58',NULL),(480,'10','20190409',2,'沪AF63687',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/843fd2b761760c358adcf413dacdbd00.jpg','/image/get?name=parking/21e462991bf260dc21623393817129dd.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-11 20:39:44','2019-04-11 20:24:35',NULL),(481,'10','20190409',2,'沪B8Q877',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/6208518b34bc8bba564fc69edcd29efa.jpg','/image/get?name=parking/b39eb36c6fd99844c2664c8eb94a64e6.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 20:47:00','2019-04-11 20:31:51',NULL),(482,'10','20190409',2,'沪GH5780',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/05190f5c6254b896085dbe917e122e27.jpg','/image/get?name=parking/ac2e6364807a3955e1e2d6572a7983cb.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 22:19:57','2019-04-11 22:04:34',NULL),(483,'10','20190409',2,'川A0BE15',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9ee2aa2d5ce562d800eee75feda38e68.jpg','/image/get?name=parking/c37bee6eca2cfbb549e9dd5cad8bac70.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,89,1,'2019-04-11 22:36:41','2019-04-11 22:21:16',NULL),(484,'10','20190409',2,'沪A7S583',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/865011d43d7ef8e42c3b882710f7853d.jpg','/image/get?name=parking/0b5780bf71cf741879fab52ef3dabe54.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 23:26:25','2019-04-11 23:10:53',NULL),(485,'10','20190409',2,'苏DMA195',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/10b19a745b1c2b79df254949068c5d36.jpg','/image/get?name=parking/959db84a744dec013fcdc896737a2d2d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-11 23:59:10','2019-04-11 23:43:33',NULL),(486,'10','20190409',2,'沪BZQ917',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/08cd9079d683dcdc3b28943bb1204741.jpg','/image/get?name=parking/cb582ae425232a0e845d93ec89f52ff4.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 00:46:21','2019-04-12 00:30:38',NULL),(487,'10','20190409',2,'沪HM7180',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ff420e901b3f5fd1a5e644b8defd8f03.jpg','/image/get?name=parking/d0ca36c88185e445fba2856f89242842.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-12 01:54:33','2019-04-12 01:38:40',NULL),(488,'10','20190409',2,'沪BCL221',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/fb1c3f837b05ddda2226aae775650fb9.jpg','/image/get?name=parking/dfd22831bb1fc5d64f891dc21051fed2.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,92,1,'2019-04-12 05:09:52','2019-04-12 04:53:32',NULL),(489,'10','20190409',2,'沪BMT989',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/6f83b0482d84ada44f24fd6bb78986ed.jpg','/image/get?name=parking/55183b244fac751ab72e9123ccc4fc7b.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 06:09:57','2019-04-12 05:53:28',NULL),(490,'10','20190409',2,'沪G97917',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/dcfa7f8be015c33f830eeb9075746cde.jpg','/image/get?name=parking/039d2ace63954c429848089361ca3bf5.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 06:11:03','2019-04-12 05:54:34',NULL),(491,'10','20190409',2,'沪A71K97',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/e1ad257749da3a941fa1449877beba7e.jpg','/image/get?name=parking/4b6a93be4901e3dd660b370f0a965390.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 06:14:14','2019-04-12 05:57:45',NULL),(492,'10','20190409',2,'沪BVN716',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/30103075be5afc8981c67fd65e9993b5.jpg','/image/get?name=parking/fd5dc7a2f00003ea9b92fa65630aad61.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 06:17:15','2019-04-12 06:00:45',NULL),(493,'10','20190409',2,'沪AFC069',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7a7d2ca25f7817171dcc1451c29d99da.jpg','/image/get?name=parking/515258410d090aa87a08aefd5a68be75.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-12 06:20:14','2019-04-12 06:03:43',NULL),(494,'10','20190409',2,'鲁R1H686',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/bc6d9913f294415c9eb4c2c58ddfafa2.jpg','/image/get?name=parking/d987a06675d601482eaf5718fee7e46d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 06:32:33','2019-04-12 06:16:01',NULL),(495,'10','20190409',2,'浙GDS191',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/bf255b963238fd40ae0d656a467e7f29.jpg','/image/get?name=parking/7200c38a5c0f8ac32e9c8708883258e9.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 06:33:43','2019-04-12 06:17:11',NULL),(496,'10','20190409',2,'沪AF23109',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/6f5005131cc87f375350870cac735ce6.jpg','/image/get?name=parking/4547a1ca35e5cce8dce119c155a8282c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 06:36:04','2019-04-12 06:19:31',NULL),(497,'10','20190409',2,'闽JS0183',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/abd7a52892da46ed4202301629159c1f.jpg','/image/get?name=parking/33d01fd64ba0036e358bf05069bb4f3f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 06:37:48','2019-04-12 06:21:16',NULL),(498,'10','20190409',2,'沪A996D3',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/6944ce754f46ace4ae05e2ceaff0a42e.jpg','/image/get?name=parking/ddce03bb01a964e4a15073347e1e1a56.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 06:41:23','2019-04-12 06:24:50',NULL),(499,'10','20190409',2,'沪BSU275',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b28dc6b10c991a49ba822d0ca0e9313e.jpg','/image/get?name=parking/d5b31de6b238d4042ffad3c645ad2a15.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 06:50:13','2019-04-12 06:33:39',NULL),(500,'10','20190409',2,'苏HT5095',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/6e9ff60c32ed61a73392d5a07463cd09.jpg','/image/get?name=parking/a3eb23dd40f0d1c3db5a7788ebbfaf13.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 06:55:58','2019-04-12 06:39:23',NULL),(501,'10','20190409',2,'沪B8N250',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2de11bd7693d4f5b5b0ecc5213452b70.jpg','/image/get?name=parking/fc00b10543fb5e5b4f734164efe15a99.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 06:56:29','2019-04-12 06:39:54',NULL),(502,'10','20190409',2,'沪A093V8',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2299bd3e0e542aff8a008edece45ec3a.jpg','/image/get?name=parking/3fa0ad044b1e11e1234684aeab06ea3d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 06:59:20','2019-04-12 06:42:44',NULL),(503,'10','20190409',2,'沪DGV562',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/66cede80c2b757653f464a7b17287360.jpg','/image/get?name=parking/19087fd2fc8d37c6a7eb7c303953e5ce.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:00:03','2019-04-12 06:43:27',NULL),(504,'10','20190409',2,'沪DDN092',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9db2daa2041b34157b748fb5fb24a4bd.jpg','/image/get?name=parking/a7d53153b948a5a3e3d830d765e5b779.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:00:12','2019-04-12 06:43:36',NULL),(505,'10','20190409',2,'沪B69Q91',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c709e6ff3c67753b1f765e2d7e5a0239.jpg','/image/get?name=parking/df58d974a392f1ec9275f091fc8702e3.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:00:32','2019-04-12 06:43:56',NULL),(506,'10','20190409',2,'沪A5J993',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/aa0046ad4442afcac46eac386aa3c959.jpg','/image/get?name=parking/e11650393b2e313f85f9971d0ba815df.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-12 07:03:31','2019-04-12 06:46:55',NULL),(507,'10','20190409',2,'沪K13717',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2f786ea75da195e68090a6711ac5cd97.jpg','/image/get?name=parking/e2288e358d415f1f9c9feb0f0efbe17a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:04:15','2019-04-12 06:47:38',NULL),(508,'10','20190409',2,'陕GSZ208',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/182b7f1d2cba088c8600b0fdf6597bb5.jpg','/image/get?name=parking/39179cd1b018c2729633d2e4674874b3.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:04:35','2019-04-12 06:47:58',NULL),(509,'10','20190409',2,'沪A37K68',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ef2bcfc87592949e55aaafe84623fcb5.jpg','/image/get?name=parking/c7344a38b0038b51046a0cd724ee5e5a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:05:15','2019-04-12 06:48:38',NULL),(510,'10','20190409',2,'皖EDF521',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c79e3959800eb22d6a24ea2e6e9b60f2.jpg','/image/get?name=parking/09ec3a7b18b4e79f0c2304c940bec570.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-12 07:07:09','2019-04-12 06:50:32',NULL),(511,'10','20190409',2,'沪A654L1',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a9d20a3f790c62b41a51f409b9adedda.jpg','/image/get?name=parking/c6435004cf487e38b824c6b5e5708261.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:07:45','2019-04-12 06:51:08',NULL),(512,'10','20190409',2,'沪AEJ818',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7668cc66ce2ae6454d1fb8cb65d89d97.jpg','/image/get?name=parking/ea3f1d3e23ff08286609d4acf153bba2.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:09:01','2019-04-12 06:52:24',NULL),(513,'10','20190409',2,'京Q3C635',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/05814e8bb01827f8e675b18911f3afd1.jpg','/image/get?name=parking/8c69928f661a5426f5f529a2dd68e1f6.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:09:11','2019-04-12 06:52:34',NULL),(514,'10','20190409',2,'苏BM569N',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2674c213050d5aab592978683e34d9dc.jpg','/image/get?name=parking/35e9669bc5148d9c6bb2e74ff3fb880d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:09:42','2019-04-12 06:53:05',NULL),(515,'10','20190409',2,'苏B652K7',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d63d5057c58ad0cf9bcdbfe63b7a99e4.jpg','/image/get?name=parking/6e1a7d0428e1199235b0d6bd53aba692.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:10:00','2019-04-12 06:53:23',NULL),(516,'10','20190409',2,'苏M8V331',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/f1f992a3acfd81234e151b75e9001231.jpg','/image/get?name=parking/ac5fcfb637b7e98d2906674c6604f009.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:10:13','2019-04-12 06:53:36',NULL),(517,'10','20190409',2,'沪EH7635',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/4e4cf891fbea06b8047e357ea59bf5d4.jpg','/image/get?name=parking/afd15887524165ba9d1cbc3572f100e3.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:14:06','2019-04-12 06:57:28',NULL),(518,'10','20190409',2,'沪B626P2',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/6316e9635472ebbe690ea5896ed7efc1.jpg','/image/get?name=parking/f4354458278ac344df0f4e0da49a966b.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:15:49','2019-04-12 06:59:11',NULL),(519,'10','20190409',2,'沪BDR935',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a73f7aeca8ec62cb0db20211a8637ccc.jpg','/image/get?name=parking/857fcad71ac3295d1a8519e7e7584cf6.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:16:40','2019-04-12 07:00:02',NULL),(520,'10','20190409',2,'沪B5B939',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/4a5d60665d05c7850da8177a70d44365.jpg','/image/get?name=parking/987d3b7de69b3af22f56cb80ac49b934.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:20:25','2019-04-12 07:03:46',NULL),(521,'10','20190409',2,'沪K81921',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/3b75810ea5dfba994478dd707652031a.jpg','/image/get?name=parking/637abf894af7f2343c8130de22aa8bd8.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:27:21','2019-04-12 07:10:41',NULL),(522,'10','20190409',2,'沪B1Q100',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/9b03595786333b048e38eec0d09a98c3.jpg','/image/get?name=parking/d0b4d0e5156c2bd5d7fa0e54e7dc4fd3.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:30:35','2019-04-12 07:13:55',NULL),(523,'10','20190409',2,'陕AG318A',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/55a6ace0308964d7bb9c40bc6ea994df.jpg','/image/get?name=parking/fa52ad01a83a0c0ba1434657a4193fb3.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:36:01','2019-04-12 07:19:20',NULL),(524,'10','20190409',2,'沪JY7985',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/53e933099ad38943cf23644835a5646f.jpg','/image/get?name=parking/dfbb6b75f1ddb9b0a08252acc08e4eb9.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:36:06','2019-04-12 07:19:25',NULL),(525,'10','20190409',2,'京N1EK18',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/227eb8b31d032e81a4629d97391d7609.jpg','/image/get?name=parking/1bc91ae68beb22f93bc4d2d771249169.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:36:44','2019-04-12 07:20:04',NULL),(526,'10','20190409',2,'沪B7Q518',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/54f5a70e0001484d1737bef5f09ae82a.jpg','/image/get?name=parking/04df5f7242fe57759dca67ca89ea27e5.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:37:31','2019-04-12 07:20:50',NULL),(527,'10','20190409',2,'苏K3175U',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/e05f8569c2445f41413be9e2762c5f71.jpg','/image/get?name=parking/06e9001c5d5d3fad675633901f317fb3.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:40:15','2019-04-12 07:23:34',NULL),(528,'10','20190409',2,'沪B6B659',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/14e61451db3731a28c57f81fe54b00ad.jpg','/image/get?name=parking/c07a023d15854f8317ea1e82db5fc11f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:42:34','2019-04-12 07:25:52',NULL),(529,'10','20190409',2,'沪A37C67',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/1c65098f97111304ccabf2e6de028fc2.jpg','/image/get?name=parking/42f2bd4a282fdf051982c67f26e4b33d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:42:39','2019-04-12 07:25:57',NULL),(530,'10','20190409',2,'沪AF97709',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/3dbaaaa54ff3055fb2f4fbbc9bf46366.jpg','/image/get?name=parking/240a4769a63bc13da875115f2b957098.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:44:16','2019-04-12 07:27:34',NULL),(531,'10','20190409',2,'沪A978Q5',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/969384505d5baa5cb677e5723ad2c003.jpg','/image/get?name=parking/8a08ba13befa092819c00f4c3da33567.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:48:55','2019-04-12 07:32:12',NULL),(532,'10','20190409',2,'浙AY9U50',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/985345bbc9940fe95abf40cefd9b57e9.jpg','/image/get?name=parking/85ec1992909e4114bf78f9527238e553.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:49:42','2019-04-12 07:33:00',NULL),(533,'10','20190409',2,'沪AFF535',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2af37f837495c0e1e53be93998bebf6a.jpg','/image/get?name=parking/7a991d1f78731991bf36faf5a6cc1a82.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:57:31','2019-04-12 07:40:47',NULL),(534,'10','20190409',2,'浙AM602D',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/aa731e89ea0cba221a32530be1e332ba.jpg','/image/get?name=parking/51c10fba891a3645f062740fb62ac11e.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:58:09','2019-04-12 07:41:25',NULL),(535,'10','20190409',2,'沪BBD390',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/90714c83a03cbda0346193077b96609c.jpg','/image/get?name=parking/1fd40a06d11e17e26b0459e86cb339cb.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-12 07:58:46','2019-04-12 07:42:02',NULL),(536,'10','20190409',2,'苏K7601R',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2c656b0442ad3dfeed5eba0294fced2d.jpg','/image/get?name=parking/afaa55838a214107d16158f1c2f64626.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 07:59:08','2019-04-12 07:42:24',NULL),(537,'10','20190409',2,'沪BXX930',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/07a79304baca4067e5362a586c184d5a.jpg','/image/get?name=parking/f516cb66b91074f9a166c8889d7b5409.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:05:41','2019-04-12 07:48:56',NULL),(538,'10','20190409',2,'沪A028P0',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/4c14e44ce2c5dbf9421486ea61dacd04.jpg','/image/get?name=parking/aaa7cc584ae6a195b2db93a6d1f10e1a.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:08:20','2019-04-12 07:51:34',NULL),(539,'10','20190409',2,'沪KZ5151',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2fff1b931217bfc5d2d22d1114d3197a.jpg','/image/get?name=parking/6fcd02c2e6629ba7e6cb7d37d2d0bb62.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-12 08:08:53','2019-04-12 07:52:08',NULL),(540,'10','20190409',2,'沪A500W7',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/5f2b0c1d6d59a79a7981d33251abc531.jpg','/image/get?name=parking/2070b6e35b822521c5d11a6b103742ff.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:10:50','2019-04-12 07:54:04',NULL),(541,'10','20190409',2,'沪GU8551',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/8d21822f1e63c7ee4f3929207a63d280.jpg','/image/get?name=parking/fe51a9dbca7c0d58996ce0a34024c02e.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:11:01','2019-04-12 07:54:15',NULL),(542,'10','20190409',2,'沪B00Q78',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/94057362470a0bf8926097b73da37105.jpg','/image/get?name=parking/60888159c4cdbf38399db06fdc6e3770.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:13:22','2019-04-12 07:56:36',NULL),(543,'10','20190409',2,'沪AWG837',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/61254806b5ae9e0691466c35a7ebeea0.jpg','/image/get?name=parking/0ca28172fb519e2d7344b7c718cea2bc.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:18:16','2019-04-12 08:01:30',NULL),(544,'10','20190409',2,'苏FGU756',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/dc53474f1050409979e555dcbf217115.jpg','/image/get?name=parking/c31151571fc441a537bf0ab4df0ee2ef.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-12 08:21:42','2019-04-12 08:04:54',NULL),(545,'10','20190409',2,'沪DAL006',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/40170ee935363c5056a79093d35eba6e.jpg','/image/get?name=parking/41ced142036b5d1c0deb8b3f94981d42.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:24:55','2019-04-12 08:08:07',NULL),(546,'10','20190409',2,'晋L66P02',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/b0b75620ec26421affbe8bfcf0656d91.jpg','/image/get?name=parking/df2149e85770de1ce417a1a1fecf0a62.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:24:59','2019-04-12 08:08:11',NULL),(547,'10','20190409',2,'皖BYZ213',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/eebdc721e823bb3cb1e439c085a5ce66.jpg','/image/get?name=parking/660f40e0cad8f5c5a77add1cd40927ed.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:26:30','2019-04-12 08:09:42',NULL),(548,'10','20190409',2,'苏FRF881',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/6f88ca4147fd3fbac5531d66867f2371.jpg','/image/get?name=parking/73083f21ff835d1c501686b7c6ca77ab.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:27:01','2019-04-12 08:10:13',NULL),(549,'10','20190409',2,'苏E592MM',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/8de5683381c085da142387d528ad2d31.jpg','/image/get?name=parking/fbe6339a14af9efa503c482e2dd15987.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:28:22','2019-04-12 08:11:34',NULL),(550,'10','20190409',2,'沪EJ0353',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/45f67fc05683b4fb81ab53b8502b617c.jpg','/image/get?name=parking/2dcd392c1dd666e5fdd3edb57354b86c.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:30:11','2019-04-12 08:13:22',NULL),(551,'10','20190409',2,'沪A32G31',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/fd42e0371603175b422d73a5a892b11d.jpg','/image/get?name=parking/6a35a52bb26d6cbdf1b3dc092a799574.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-12 08:31:51','2019-04-12 08:15:03',NULL),(552,'10','20190409',2,'沪A3D535',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/e4dfd44782ad0b63aa807dc0eb187247.jpg','/image/get?name=parking/2ba65553fd725426e8d54d2b3c2360a9.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:34:27','2019-04-12 08:17:37',NULL),(553,'10','20190409',2,'苏A63C53',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/7d4c98534eef29b8ded0fce39603409d.jpg','/image/get?name=parking/9022417c3dd1e35ba792c0650f8ea11f.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:36:36','2019-04-12 08:19:46',NULL),(554,'10','20190409',2,'沪AF09498',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/188489663f6125d13e45be2d1abf95b7.jpg','/image/get?name=parking/088b2628a5e6618e19bae1e8bdc785e4.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:38:53','2019-04-12 08:22:04',NULL),(555,'10','20190409',2,'皖AV761K',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/8a3ad7bd09953dc69e4a3c8110712de7.jpg','/image/get?name=parking/ebeb85de5c87fb639f84c7701f5338a8.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:40:19','2019-04-12 08:23:29',NULL),(556,'10','20190409',2,'沪A132K6',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ec1bb7dd9d8beb495043d00ec90cb9a3.jpg','/image/get?name=parking/d3b18f57a8ea0e273ebdbf1ee0a35cf3.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:42:08','2019-04-12 08:25:18',NULL),(557,'10','20190409',2,'沪BHU690',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/84a5ed8cc5235c718355aac20c6aab35.jpg','/image/get?name=parking/0c43b215e0575b1d5782c2b94dbb26c1.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:46:52','2019-04-12 08:30:01',NULL),(558,'10','20190409',2,'沪BNZ570',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/31b3a5c486d5662945fd48ddb4cec6b1.jpg','/image/get?name=parking/9ea9ae6c9608df449e38f0c13ffdbbe0.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:52:10','2019-04-12 08:35:19',NULL),(559,'10','20190409',2,'苏DJ587Y',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/a03e671042f88f265c7a1e48f9251143.jpg','/image/get?name=parking/a6619e4fa8e12a1b8971ca74b9ac06bd.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:54:20','2019-04-12 08:37:28',NULL),(560,'10','20190409',2,'沪LB9330',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/938c17dc0e7ef60bcae470437762b92f.jpg','/image/get?name=parking/ad9daadfab315c01fa62e4ea81c5032b.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:57:08','2019-04-12 08:40:15',NULL),(561,'10','20190409',2,'沪DT8315',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/efe276834c79681dee00e4f6353459a1.jpg','/image/get?name=parking/3a8b5bbdb4ada2a12255978db422f1b0.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:58:06','2019-04-12 08:41:13',NULL),(562,'10','20190409',2,'沪KC6530',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/c55deeceb19176370f27bdcb0b057e84.jpg','/image/get?name=parking/9cec3b148ec4ca2d71880a46ffa5200d.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 08:58:42','2019-04-12 08:41:49',NULL),(563,'10','20190409',2,'苏E5A25H',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/8b53a2f84684270281158aa2a9164787.jpg','/image/get?name=parking/596253d6bcdc8a6ece0e7f6ab28daf59.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 09:04:49','2019-04-12 08:47:56',NULL),(564,'10','20190409',2,'沪BQG130',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2c9f7195dd52e63e463405919a6586db.jpg','/image/get?name=parking/52f24464af7842e3a331662a698f48ed.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 09:07:11','2019-04-12 08:50:19',NULL),(565,'10','20190409',2,'沪B6M377',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/4689e2d80a09f66739528e1a79e48445.jpg','/image/get?name=parking/6c8ca311c67fce8b063e8ea8370c17a8.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-12 09:07:58','2019-04-12 08:51:05',NULL),(566,'10','20190409',2,'晋LP5662',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/2d21f8c607ae571e256b5158882c6f78.jpg','/image/get?name=parking/974ee91560b3c558f7e900bd22b6c2ac.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-12 09:09:38','2019-04-12 08:52:44',NULL),(567,'10','20190409',2,'沪JD8051',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/d0b8d170617d6376c8922294471fb8d1.jpg','/image/get?name=parking/cc6c70c1be37eaeb2f2e27925ddfb99e.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 09:17:39','2019-04-12 09:00:43',NULL),(568,'10','20190409',2,'苏AR2233',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/1d20c9d197554e4fa9f03cde73fd11c1.jpg','/image/get?name=parking/8e5f396ce6e789d099abdcf67a5715c1.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 09:23:57','2019-04-12 09:07:01',NULL),(569,'10','20190409',2,'沪AGL113',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/ce85142ce519b5850dc2be1cce2dfc1f.jpg','/image/get?name=parking/d32518c184c36e9bc766192d2bfac65b.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,100,1,'2019-04-12 09:31:31','2019-04-12 09:14:34',NULL),(570,'10','20190409',2,'浙DN77P8',1,'1',1,NULL,'f2c8592b-a313-4767-bfb7-3f991e025dda',NULL,NULL,'8','/image/get?name=parking/fd4af17c72d43a5761c696a7d20cdeb6.jpg','/image/get?name=parking/4f3dad05c3bc2f6d24e09e43a004f0dd.jpg',NULL,NULL,'车辆出场',NULL,NULL,NULL,NULL,NULL,NULL,96,1,'2019-04-12 09:32:03','2019-04-12 09:15:06',NULL);
/*!40000 ALTER TABLE `parkingEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `peopleId` int(30) NOT NULL AUTO_INCREMENT,
  `villageId` int(30) DEFAULT NULL COMMENT '小区表主键',
  `villageCode` varchar(64) DEFAULT NULL COMMENT '小区编码',
  `peopleName` varchar(64) DEFAULT NULL,
  `peopleTypeCode` int(11) DEFAULT NULL COMMENT '人员类别 1 户籍人员 2 来沪人员 3 境外人员',
  `credentialType` int(11) DEFAULT NULL COMMENT '证件类型',
  `credentialNo` varchar(64) DEFAULT NULL COMMENT '证件号码',
  `genderCode` int(1) DEFAULT NULL COMMENT '性别 1-男 2-女',
  `domicileNationCode` int(11) DEFAULT NULL COMMENT '户籍民族',
  `domicileProvinceCode` varchar(255) DEFAULT NULL,
  `domicileBirthDate` datetime DEFAULT NULL COMMENT '户籍出生日期',
  `domicileCityCode` varchar(255) DEFAULT NULL COMMENT '户籍市编码',
  `origin` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `typeCode` int(10) DEFAULT NULL,
  `domicileDistrictCode` varchar(255) DEFAULT NULL COMMENT '户籍地行政区',
  `domicileStreetCode` varchar(255) DEFAULT NULL COMMENT '户籍所在街道',
  `domicileRoadCode` varchar(255) DEFAULT NULL COMMENT '户籍地路名',
  `domicileIDPicUrl` varchar(255) DEFAULT NULL COMMENT '户籍照',
  `residenceProvinceCode` varchar(255) DEFAULT NULL,
  `residenceCityCode` varchar(255) DEFAULT NULL COMMENT '居住市级编码',
  `domicileAddress` varchar(255) DEFAULT NULL COMMENT '户籍地详址',
  `residenceDistrictCode` varchar(255) DEFAULT NULL COMMENT '居住地行政区',
  `residenceStreetCode` varchar(255) DEFAULT NULL COMMENT '居住地街道代码',
  `residenceRoadCode` varchar(255) DEFAULT NULL COMMENT '居住地路名代码',
  `residenceAddress` varchar(256) DEFAULT NULL COMMENT '居住地址',
  `educationCode` int(11) DEFAULT NULL COMMENT '文化程度代码',
  `maritalStatusCode` int(11) DEFAULT NULL COMMENT '婚姻状况代码',
  `spouseName` varchar(64) DEFAULT NULL COMMENT '配偶姓名',
  `spouseType` int(11) DEFAULT NULL COMMENT '配偶证件类型',
  `spouseNO` varchar(64) DEFAULT NULL COMMENT '配偶证件号码',
  `nationalityCode` varchar(255) DEFAULT NULL COMMENT '国家代码',
  `entryTime` datetime DEFAULT NULL COMMENT '入境时间',
  `surnameEng` varchar(256) DEFAULT NULL COMMENT '外文姓',
  `nameEng` varchar(256) DEFAULT NULL COMMENT '外文名',
  `phoneNoOne` varchar(64) DEFAULT NULL COMMENT '手机号码1',
  `phoneNoOnePerson` varchar(64) DEFAULT NULL COMMENT '手机号码1归属人',
  `phoneNoOnePersonType` int(11) DEFAULT NULL COMMENT '手机号码1归属人证件类型',
  `phoneNoOnePersonID` varchar(64) DEFAULT NULL COMMENT '手机号码1归属人证件号码',
  `phoneNoTwo` varchar(64) DEFAULT NULL COMMENT '手机号码2',
  `phoneNoTwoPerson` varchar(64) DEFAULT NULL COMMENT '手机号码2归属人',
  `phoneNoTwoPersonType` int(11) DEFAULT NULL COMMENT '手机号码2归属人证件类型',
  `phoneNoTwoPersonID` varchar(64) DEFAULT NULL COMMENT '手机号码2归属人证件号码',
  `phoneNoThree` varchar(64) DEFAULT NULL COMMENT '手机号码3',
  `phoneNoThreePerson` varchar(64) DEFAULT NULL COMMENT '手机号码3归属人',
  `phoneNoThreePersonType` int(11) DEFAULT NULL COMMENT '手机号码3归属人证件类型',
  `phoneNoThreePersonID` varchar(64) DEFAULT NULL COMMENT '手机号码3归属人证件号码',
  `securityCardNo` varchar(255) DEFAULT NULL COMMENT '保安人员卡号',
  `entranceTypeCode` int(10) DEFAULT NULL COMMENT '出入类型',
  `idCardPicUrl` varchar(256) DEFAULT NULL COMMENT '证件照',
  `source` int(11) DEFAULT NULL COMMENT '来源 1 市局人口库 2 门禁系统 3 网络采集',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`peopleId`),
  UNIQUE KEY `unique_people_index` (`credentialType`,`credentialNo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='人员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,NULL,NULL,'管虎',1,111,'310104197111062031',1,1,'310000000000','1971-11-06 00:00:00','310100000000','浙江杭州',2,'310109000000','310109010000','010898',NULL,'310000000000','310100000000','中山路 100 号','310109000000','310109010000','010898','淮海路 100 号',2,1,'王五',1,'310104200001012039','CN','2012-01-01 00:00:00','Patel','Allen','139033445566','6.5',1,'310104200001012039','139033445567','6.7',1,'310104200001012039',NULL,NULL,NULL,NULL,'31033301034',1,NULL,4,'2019-03-28 14:58:39','2019-03-28 14:58:39'),(2,NULL,NULL,'y',1,111,'346273685578',NULL,NULL,'310000000000',NULL,'310100000000',NULL,NULL,'310109000000','310109010000',NULL,'/image/get?name=people/c164abd1f3c61699d1d63ab00502b480.jpg','310000000000','310100000000',NULL,'310109000000',NULL,NULL,'1栋1室',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'135676555','346273685578',1,'310104200001012039',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'31033301034',1,NULL,4,'2019-04-09 15:15:34','2019-04-09 15:15:34');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peoplehouseRelation`
--

DROP TABLE IF EXISTS `peoplehouseRelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peoplehouseRelation` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `peopleId` int(30) DEFAULT NULL,
  `villageId` int(30) DEFAULT NULL,
  `buildingId` int(30) DEFAULT NULL,
  `houseId` int(30) DEFAULT NULL,
  `villageCode` varchar(64) DEFAULT NULL,
  `buildingCode` varchar(64) DEFAULT NULL,
  `houseCode` varchar(64) DEFAULT NULL,
  `housePeopleRel` int(2) DEFAULT NULL COMMENT '人屋关系代码',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peoplehouseRelation`
--

LOCK TABLES `peoplehouseRelation` WRITE;
/*!40000 ALTER TABLE `peoplehouseRelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `peoplehouseRelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perceptinEvent`
--

DROP TABLE IF EXISTS `perceptinEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perceptinEvent` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `deviceId` varchar(255) DEFAULT NULL,
  `deviceCode` varchar(64) DEFAULT NULL,
  `channel` int(10) DEFAULT NULL COMMENT '设备通道',
  `eventType` int(11) DEFAULT NULL,
  `eventCode` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `lon` double(11,6) DEFAULT NULL COMMENT '经度',
  `lat` double(11,6) DEFAULT NULL COMMENT '纬度',
  `alt` double(11,2) DEFAULT NULL COMMENT '高度',
  `floor` varchar(64) DEFAULT NULL COMMENT '楼层',
  `gisType` int(10) DEFAULT NULL COMMENT '坐标系代码',
  `infoSource` varchar(64) DEFAULT NULL COMMENT '信息来源',
  `triggerTime` datetime DEFAULT NULL COMMENT '触发时间',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `diviceId` (`deviceId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='泛感知事件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perceptinEvent`
--

LOCK TABLES `perceptinEvent` WRITE;
/*!40000 ALTER TABLE `perceptinEvent` DISABLE KEYS */;
/*!40000 ALTER TABLE `perceptinEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `powerBox`
--

DROP TABLE IF EXISTS `powerBox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `powerBox` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `PowerBoxId` varchar(30) NOT NULL COMMENT '电源箱编号 填的编号',
  `PowerBoxCode` varchar(64) DEFAULT NULL COMMENT '电源箱编码 填的编码',
  `PowerBoxType` tinyint(1) DEFAULT NULL COMMENT '1-普通电源箱 2-其他电源箱',
  `address` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT '1' COMMENT '设备状态 1-可用 2-禁用',
  `temperature` varchar(50) DEFAULT NULL COMMENT '温度',
  `humidity` varchar(10) DEFAULT NULL COMMENT '湿度',
  `V_12` varchar(10) DEFAULT NULL COMMENT '电压12v',
  `V_24` varchar(10) DEFAULT NULL COMMENT '电压24v',
  `V_220` varchar(10) DEFAULT NULL COMMENT '电压220v',
  `lon` double DEFAULT NULL COMMENT '经度',
  `lat` double DEFAULT NULL COMMENT '纬度',
  `alt` double DEFAULT NULL COMMENT '高度',
  `note` varchar(255) DEFAULT '' COMMENT '备注',
  `Lighting_V12` tinyint(4) DEFAULT NULL COMMENT '防雷器12 1- true 0-false',
  `Lighting_V24` tinyint(4) DEFAULT NULL COMMENT '防雷器24 1- true 0-false',
  `Lighting_V220` tinyint(4) DEFAULT NULL COMMENT '防雷220 1- true 0-false',
  `Electrical_First` tinyint(4) DEFAULT NULL COMMENT '外接输入口电频1 1- true 0-false',
  `Electrical_Second` tinyint(4) DEFAULT NULL COMMENT '外接输入口电频2 1- true 0-false',
  `Electrical_Third` tinyint(4) DEFAULT NULL COMMENT '外接输入口电频3 1- true 0-false',
  `Electrical_Fourth` tinyint(4) DEFAULT NULL COMMENT '外接输入口电频4 1- true 0-false',
  `Output_First` tinyint(4) DEFAULT '0' COMMENT '外接输出口电频1 1- true 0-false',
  `Output_Second` tinyint(4) DEFAULT '0' COMMENT '外接输出口电频2 1- true 0-false',
  `Output_Third` tinyint(4) DEFAULT '0' COMMENT '外接输出口电频3 1- true 0-false',
  `Output_Fourth` tinyint(4) DEFAULT '0' COMMENT '外接输出口电频4 1- true 0-false',
  `online` tinyint(4) NOT NULL COMMENT '是否在线 1-在线 2-不在线',
  `client_ip` varchar(255) DEFAULT NULL,
  `uid` varchar(64) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `PowerBoxId` (`PowerBoxId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COMMENT='电源箱表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `powerBox`
--

LOCK TABLES `powerBox` WRITE;
/*!40000 ALTER TABLE `powerBox` DISABLE KEYS */;
INSERT INTO `powerBox` VALUES (15,'YT1906268077','',1,'江湾',1,'31','59','11','23','216',95,54,10,'yyt',0,0,0,0,1,1,1,1,1,1,1,2,'192.168.36.10:1000','','2019-07-05 08:36:56','2019-07-05 10:00:02'),(17,'YT1907058111','',1,'殷高西路',1,'29','52','12','0','1',1,1,1,'1',0,0,0,1,1,0,1,1,0,0,0,2,'192.168.36.18:1000','','2019-07-11 14:14:29','2019-07-26 16:32:01'),(18,'YT1907058222','',1,'江杨南路',1,'29','60','11','24','214',2,2,2,'2',0,0,0,1,1,1,1,1,1,1,0,1,'192.168.36.19:1037','YT1907058222','2019-07-11 14:15:09','2019-07-26 17:57:33'),(19,'YT1907050000','',1,'国权北路',1,'27','48','11','0','3',0,0,0,'123',0,0,0,0,1,0,1,1,1,1,1,2,'192.168.36.58:1000','','2019-07-12 15:54:57','2019-07-24 11:07:22');
/*!40000 ALTER TABLE `powerBox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `powerBoxSystem`
--

DROP TABLE IF EXISTS `powerBoxSystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `powerBoxSystem` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `Server_id` varchar(255) NOT NULL COMMENT '平台ID',
  `address` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='电源箱平台配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `powerBoxSystem`
--

LOCK TABLES `powerBoxSystem` WRITE;
/*!40000 ALTER TABLE `powerBoxSystem` DISABLE KEYS */;
/*!40000 ALTER TABLE `powerBoxSystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `powerBoxput`
--

DROP TABLE IF EXISTS `powerBoxput`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `powerBoxput` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `input1` varchar(255) DEFAULT '' COMMENT '外部输入口1',
  `input2` varchar(255) DEFAULT '' COMMENT '外部输入口2',
  `input3` varchar(255) DEFAULT '' COMMENT '外部输入口3',
  `input4` varchar(255) DEFAULT '' COMMENT '外部输入口4',
  `output1` varchar(255) DEFAULT '' COMMENT '外部输出口1',
  `output2` varchar(255) DEFAULT '' COMMENT '外部输出口2',
  `output3` varchar(255) DEFAULT '' COMMENT '外部输出口3',
  `output4` varchar(255) DEFAULT '' COMMENT '外部输出口4',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='电源箱输入输出口定义表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `powerBoxput`
--

LOCK TABLES `powerBoxput` WRITE;
/*!40000 ALTER TABLE `powerBoxput` DISABLE KEYS */;
INSERT INTO `powerBoxput` VALUES (1,'电源箱外接输入口1','电源箱外接输入口2','电源箱外接输入口3','箱门','电源箱外接输出口1','电源箱外接输出口2','电源箱外接输出口3','电源箱外接输出口4');
/*!40000 ALTER TABLE `powerBoxput` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `powerBoxreport`
--

DROP TABLE IF EXISTS `powerBoxreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `powerBoxreport` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `V12_report` tinyint(4) DEFAULT '0' COMMENT '12v电压报警值',
  `V24_report` tinyint(4) DEFAULT '0' COMMENT '24v电压报警值',
  `V220_report` tinyint(4) DEFAULT '0' COMMENT '220v电压报警值',
  `V12_scope` tinyint(4) DEFAULT '0' COMMENT '12v电压报警值正负范围',
  `V24_scope` tinyint(4) DEFAULT '0' COMMENT '24v电压报警值正负范围',
  `V220_scope` tinyint(4) DEFAULT '0' COMMENT '220v电压报警值正负范围',
  `temperature_report` tinyint(4) DEFAULT '0' COMMENT '温度报警值',
  `humidity_report` tinyint(4) DEFAULT '0' COMMENT '湿度报警值',
  `temperature_scope` tinyint(4) DEFAULT '0' COMMENT '温度报警值正负范围',
  `humidity_scope` tinyint(4) DEFAULT '0' COMMENT '湿度报警值正负范围',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='电源箱自定义报警值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `powerBoxreport`
--

LOCK TABLES `powerBoxreport` WRITE;
/*!40000 ALTER TABLE `powerBoxreport` DISABLE KEYS */;
INSERT INTO `powerBoxreport` VALUES (1,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `powerBoxreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `powerBoxstatus`
--

DROP TABLE IF EXISTS `powerBoxstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `powerBoxstatus` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `PowerBoxId` varchar(30) NOT NULL COMMENT '电源箱编号',
  `V12_status` tinyint(4) DEFAULT '0' COMMENT '电压12v 1- 报警 0-解除',
  `V24_status` tinyint(4) DEFAULT '0' COMMENT '电压24v 1- 报警 0-解除',
  `V220_status` tinyint(4) DEFAULT '0' COMMENT '电压220v 1- 报警 0-解除',
  `LightingV12_status` tinyint(4) DEFAULT '0' COMMENT '防雷器12 1- 报警 0-解除',
  `LightingV24_status` tinyint(4) DEFAULT '0' COMMENT '防雷器24 1- 报警 0-解除',
  `LightingV220_status` tinyint(4) DEFAULT '0' COMMENT '防雷220 1- 报警 0-解除',
  `ElectricalFirst_status` tinyint(4) DEFAULT '0' COMMENT '外部输入口1 1- 报警 0-解除',
  `ElectricalSecond_status` tinyint(4) DEFAULT '0' COMMENT '外部输入口2 1- 报警 0-解除',
  `ElectricalThird_status` tinyint(4) DEFAULT '0' COMMENT '外部输入口3 1- 报警 0-解除',
  `ElectricalFourth_status` tinyint(4) DEFAULT '0' COMMENT '外部输入口4 1- 报警 0-解除',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `PowerBoxId` (`PowerBoxId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COMMENT='电源箱部件状态表';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `powerboxEvent`
--

DROP TABLE IF EXISTS `powerboxEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `powerboxEvent` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `PowerBoxId` varchar(30) NOT NULL COMMENT '设备编号',
  `PowerBoxCode` varchar(64) DEFAULT NULL COMMENT '电源箱编码',
  `address` varchar(255) DEFAULT NULL,
  `channel` int(10) DEFAULT NULL COMMENT '通道号',
  `eventCode` int(10) DEFAULT NULL COMMENT '事件编码',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `triggerTime` datetime DEFAULT NULL COMMENT '触发时间',
  `dealPerson` varchar(64) DEFAULT NULL COMMENT '处置人员',
  `alert` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-未报警 2-已报警',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1-已读 0-未读',
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `PowerBoxId` (`PowerBoxId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='电源箱事件表';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `usbEvent`
--

DROP TABLE IF EXISTS `usbEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usbEvent` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `deviceId` int(30) DEFAULT NULL COMMENT '设备id',
  `deviceCode` varchar(64) DEFAULT NULL COMMENT '设备编号',
  `eventType` int(11) DEFAULT NULL COMMENT '事件类型',
  `eventTime` datetime DEFAULT NULL COMMENT '发生时间',
  `dataTime` datetime DEFAULT NULL COMMENT '数据接收时间',
  `channel` varchar(255) DEFAULT NULL,
  `cardNo` varchar(64) DEFAULT NULL COMMENT '卡号 编号',
  `note` varchar(256) DEFAULT NULL COMMENT '消息备注',
  `lon` double DEFAULT NULL COMMENT '经度',
  `lat` double DEFAULT NULL COMMENT '纬度',
  `alt` double DEFAULT NULL COMMENT '高度',
  `floor` varchar(64) DEFAULT NULL COMMENT '楼层',
  `gisType` int(11) DEFAULT NULL,
  `infoSource` varchar(64) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `deviceId` (`deviceId`) USING BTREE,
  KEY `deviceCode` (`deviceCode`) USING BTREE,
  KEY `eventType` (`eventType`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='USB防插拔信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usbEvent`
--

LOCK TABLES `usbEvent` WRITE;
/*!40000 ALTER TABLE `usbEvent` DISABLE KEYS */;
INSERT INTO `usbEvent` VALUES (1,4,'AU20190328',4,NULL,'2019-03-28 14:56:42','10','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-28 14:56:42',NULL);
/*!40000 ALTER TABLE `usbEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_client`
--

DROP TABLE IF EXISTS `user_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_client` (
  `uid` int(30) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `client_id` varchar(200) DEFAULT NULL COMMENT '该用户的客户端id',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `videoSecurityEvent`
--

DROP TABLE IF EXISTS `videoSecurityEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videoSecurityEvent` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `deviceId` int(30) NOT NULL COMMENT '设备id',
  `deviceCode` varchar(64) NOT NULL COMMENT '设备编号',
  `channel` int(10) NOT NULL COMMENT '设备通道  0为主机/控制器  >0为摄像机通道',
  `eventType` int(11) NOT NULL COMMENT '事件类型',
  `eventTime` datetime NOT NULL COMMENT '发生时间',
  `dataTime` datetime NOT NULL COMMENT '数据接收时间',
  `localPicUrl` varchar(256) DEFAULT NULL COMMENT '本地图片路径',
  `picUrl` varchar(256) NOT NULL COMMENT '传来的图片路径',
  `note` varchar(256) DEFAULT NULL COMMENT '消息备注',
  `lon` double NOT NULL COMMENT '经度',
  `lat` double NOT NULL COMMENT '纬度',
  `alt` double DEFAULT NULL COMMENT '高度',
  `floor` varchar(64) DEFAULT NULL COMMENT '楼层',
  `gisType` int(11) NOT NULL,
  `infoGroup` varchar(64) DEFAULT NULL COMMENT '一组联动照片采用用一个编号',
  `infoSource` varchar(64) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `deviceId` (`deviceId`) USING BTREE,
  KEY `deviceCode` (`deviceCode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='视频安防监控信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videoSecurityEvent`
--

LOCK TABLES `videoSecurityEvent` WRITE;
/*!40000 ALTER TABLE `videoSecurityEvent` DISABLE KEYS */;
/*!40000 ALTER TABLE `videoSecurityEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `village`
--

DROP TABLE IF EXISTS `village`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `village` (
  `villageId` int(30) NOT NULL AUTO_INCREMENT,
  `villageCode` varchar(64) DEFAULT NULL COMMENT '小区编码',
  `villageName` varchar(64) DEFAULT NULL COMMENT '小区名称',
  `provinceCode` int(11) DEFAULT NULL COMMENT '省份编码',
  `cityCode` int(11) DEFAULT NULL COMMENT '城市编码',
  `districtCode` int(11) DEFAULT NULL COMMENT '区域编码',
  `streetCode` int(11) DEFAULT NULL COMMENT '街道编码',
  `roadCode` int(11) DEFAULT NULL COMMENT '道理编码',
  `address` varchar(64) DEFAULT NULL COMMENT '地址',
  `policeStation` int(11) DEFAULT NULL COMMENT '所属派出所',
  `picUrl` varchar(256) DEFAULT NULL COMMENT '小区图片',
  `lon` double(11,6) DEFAULT NULL COMMENT '经度',
  `lat` double(11,6) DEFAULT NULL COMMENT '纬度',
  `alt` double DEFAULT NULL COMMENT '高度',
  `gisArea` varchar(1024) DEFAULT NULL COMMENT '坐标',
  `gisType` int(11) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`villageId`),
  UNIQUE KEY `indexvillagecode` (`villageCode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='小区信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `village`
--

LOCK TABLES `village` WRITE;
/*!40000 ALTER TABLE `village` DISABLE KEYS */;
INSERT INTO `village` VALUES (1,'7b0b476d-5e5c-44af-a9f7-77a5e8f38f67','小区名称',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-08 00:09:38','2019-02-24 23:45:47');
/*!40000 ALTER TABLE `village` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-26 17:58:10
