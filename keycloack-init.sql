/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: database
-- ------------------------------------------------------
-- Server version	5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
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
  `DETAILS_JSON` longtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  KEY `IDX_ADMIN_EVENT_TIME` (`REALM_ID`,`ADMIN_EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `AUTHENTICATOR_FLOW` tinyint(4) NOT NULL DEFAULT '0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES
('03142bb9-cdf9-4451-9e8d-85d2b7cfdf89',NULL,'conditional-user-configured','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','e00f4ad9-09ba-49a7-88b2-ef4a5d7bdcfd',0,10,0,NULL,NULL),
('0709a1ad-74ff-4de8-9afa-4ffedb0e2363',NULL,'idp-username-password-form','b1a77210-c7ee-43b5-b50d-620366c5ffd4','65ddfc22-0299-433c-bd33-2ac36db55025',0,10,0,NULL,NULL),
('0742ba52-63c7-4fdd-beeb-63a6ff722f4f',NULL,'conditional-user-configured','b1a77210-c7ee-43b5-b50d-620366c5ffd4','d1e1183d-6886-449b-98b1-a321304036af',0,10,0,NULL,NULL),
('090a08ee-42fc-4350-9698-3a97b5f49615',NULL,'idp-add-organization-member','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a1590564-2057-4cb5-b232-04f28b16e651',0,20,0,NULL,NULL),
('0b30c2da-d11c-48c4-83f7-768f33545ff7',NULL,NULL,'b1a77210-c7ee-43b5-b50d-620366c5ffd4','dce44159-093a-4a72-a6f1-c7978acc403a',2,20,1,'65ddfc22-0299-433c-bd33-2ac36db55025',NULL),
('17848c05-72a0-4d95-8790-58e17a0a4473',NULL,'conditional-user-configured','b1a77210-c7ee-43b5-b50d-620366c5ffd4','66ca8a5f-d447-41ae-9aa2-18d5993fcb2f',0,10,0,NULL,NULL),
('18b0b1ef-5f0c-48f5-a629-8e40b570d726',NULL,'registration-recaptcha-action','b1a77210-c7ee-43b5-b50d-620366c5ffd4','627debb4-435a-41a3-a9ba-c25304963fc7',3,60,0,NULL,NULL),
('19b120dd-50d3-43f8-b70f-6f0bc28f9e72',NULL,'direct-grant-validate-username','b1a77210-c7ee-43b5-b50d-620366c5ffd4','4390d5c0-d3de-449f-abd7-220a4fe1baf0',0,10,0,NULL,NULL),
('19fcc9e1-7298-436c-a572-a42798fd02fa',NULL,'direct-grant-validate-username','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','c64a6554-8b71-45d6-9922-e5b660af0aa8',0,10,0,NULL,NULL),
('1b182a45-c7f5-425d-8fc7-302c7347067d',NULL,'docker-http-basic-authenticator','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','2393fbe5-75d7-4eeb-972d-2004f9af4da8',0,10,0,NULL,NULL),
('1d998a29-f86f-4996-9857-ce1984259eb0',NULL,'auth-username-password-form','b1a77210-c7ee-43b5-b50d-620366c5ffd4','d27e9c3a-8951-4ad3-8cf5-6ba93bd04b6f',0,10,0,NULL,NULL),
('214fcd8a-643b-45eb-a0b3-11a33d0dfc93',NULL,'reset-credentials-choose-user','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','7022adce-6435-47df-a72e-6012fb681de6',0,10,0,NULL,NULL),
('2478c75c-8160-442d-acbf-652380196ae3',NULL,'conditional-user-configured','b1a77210-c7ee-43b5-b50d-620366c5ffd4','c505b7d5-0fb3-4cd1-9ef5-5406efba3623',0,10,0,NULL,NULL),
('2a5346f3-059b-4421-a0a4-13cd719f4b0f',NULL,NULL,'b1a77210-c7ee-43b5-b50d-620366c5ffd4','97fa366c-2aa1-4fe4-a983-da9db5d0a3ec',2,30,1,'d27e9c3a-8951-4ad3-8cf5-6ba93bd04b6f',NULL),
('2a7eeb22-89a2-44c6-a350-6844a52a4e2c',NULL,'direct-grant-validate-otp','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','e00f4ad9-09ba-49a7-88b2-ef4a5d7bdcfd',0,20,0,NULL,NULL),
('2d148008-9f78-41b4-ae30-db7f85f6bf03',NULL,'auth-spnego','b1a77210-c7ee-43b5-b50d-620366c5ffd4','97fa366c-2aa1-4fe4-a983-da9db5d0a3ec',3,20,0,NULL,NULL),
('2e7b8716-d305-4e28-8726-14a40a23e69b',NULL,'idp-email-verification','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','38a3a97c-4550-481e-8db9-2bf5e24daf21',2,10,0,NULL,NULL),
('30d18a74-1d3f-428d-92fa-00a27f6c498d',NULL,'http-basic-authenticator','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','34dffdb3-b264-4563-93e8-9420474f59b5',0,10,0,NULL,NULL),
('32c7a8b7-2b3d-4ffa-a4ab-510273b7c1ee',NULL,'client-x509','b1a77210-c7ee-43b5-b50d-620366c5ffd4','1f25beab-ee5c-42d4-8ccf-97a851baaf6d',2,40,0,NULL,NULL),
('35f20c94-9c5a-4cd3-8519-a3f95a072817',NULL,NULL,'4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','38a3a97c-4550-481e-8db9-2bf5e24daf21',2,20,1,'04e9b767-5cf4-4302-b24b-6a3d1cbd07f8',NULL),
('3762be17-de0e-4451-8373-a8ff301a494c',NULL,NULL,'4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','04e9b767-5cf4-4302-b24b-6a3d1cbd07f8',1,20,1,'1091a1c4-056d-4d52-9898-6e459ed766f7',NULL),
('39c178f2-62bc-459e-bc5c-5ddef43e8eb9',NULL,'conditional-user-configured','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','1091a1c4-056d-4d52-9898-6e459ed766f7',0,10,0,NULL,NULL),
('3a865865-c787-4269-9a4e-ec79a35524eb',NULL,NULL,'4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','c64a6554-8b71-45d6-9922-e5b660af0aa8',1,30,1,'e00f4ad9-09ba-49a7-88b2-ef4a5d7bdcfd',NULL),
('3b787acd-17ab-47ca-ad1f-4db5daeaf1e0',NULL,'auth-spnego','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','6cbda524-79d2-47eb-969f-dd99ed1011fd',3,20,0,NULL,NULL),
('40c3393a-a7d0-49ab-9035-14cd1fa51588',NULL,'reset-credential-email','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','7022adce-6435-47df-a72e-6012fb681de6',0,20,0,NULL,NULL),
('41fec3fd-0183-4f0f-8f6a-eb49572b3cc5',NULL,'idp-confirm-link','b1a77210-c7ee-43b5-b50d-620366c5ffd4','b7922f95-5758-4fea-93bd-b21f46eca416',0,10,0,NULL,NULL),
('45129356-2cb5-4c8f-98e7-cbaa995a888d',NULL,NULL,'b1a77210-c7ee-43b5-b50d-620366c5ffd4','035946f5-5d48-4d2f-ad13-19f72b90321a',0,20,1,'cccc458a-9e02-4e96-bfd2-38634f0a55b7',NULL),
('45da8e20-7a06-4822-92f0-886a78b5340d',NULL,'auth-cookie','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','6cbda524-79d2-47eb-969f-dd99ed1011fd',2,10,0,NULL,NULL),
('49a9b937-9432-480d-8bdb-1c6c4effa577',NULL,'idp-confirm-link','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','3d0daf6f-d3cd-4a7d-bb53-653100371b39',0,10,0,NULL,NULL),
('4cf40b70-bb9f-462e-a17f-7612bb28f216',NULL,'docker-http-basic-authenticator','b1a77210-c7ee-43b5-b50d-620366c5ffd4','2c063396-7f2f-4598-b9bb-b55f412e630c',0,10,0,NULL,NULL),
('4fe4b289-cdeb-4e04-aebb-0d93df179fdc',NULL,'conditional-user-configured','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a1590564-2057-4cb5-b232-04f28b16e651',0,10,0,NULL,NULL),
('52059c5c-887a-47a7-96c9-0676d6d2e21e',NULL,'identity-provider-redirector','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','6cbda524-79d2-47eb-969f-dd99ed1011fd',2,25,0,NULL,NULL),
('52fcf539-2134-4ec7-b60e-e533c198d332',NULL,'idp-review-profile','b1a77210-c7ee-43b5-b50d-620366c5ffd4','035946f5-5d48-4d2f-ad13-19f72b90321a',0,10,0,NULL,'d83fd09e-7564-4295-bb08-37809686cb8d'),
('591f13a2-e005-44b2-93d3-6e860e35300d',NULL,'registration-terms-and-conditions','b1a77210-c7ee-43b5-b50d-620366c5ffd4','627debb4-435a-41a3-a9ba-c25304963fc7',3,70,0,NULL,NULL),
('5a657d14-bb94-4868-bbdc-0c5c15946ace',NULL,'registration-user-creation','b1a77210-c7ee-43b5-b50d-620366c5ffd4','627debb4-435a-41a3-a9ba-c25304963fc7',0,20,0,NULL,NULL),
('615bc415-4aab-400f-abe1-896fec5f1e60',NULL,'conditional-user-configured','b1a77210-c7ee-43b5-b50d-620366c5ffd4','05a0a264-960a-4ad2-8a29-77a1035e7998',0,10,0,NULL,NULL),
('63e297c0-9f59-4b82-913c-a2eae6b40712',NULL,'reset-credentials-choose-user','b1a77210-c7ee-43b5-b50d-620366c5ffd4','94d6e301-e593-4d14-a685-aae625f94d55',0,10,0,NULL,NULL),
('6765b4be-66a8-4f9f-a503-b53a2b1cb7aa',NULL,NULL,'b1a77210-c7ee-43b5-b50d-620366c5ffd4','65ddfc22-0299-433c-bd33-2ac36db55025',1,20,1,'66ca8a5f-d447-41ae-9aa2-18d5993fcb2f',NULL),
('6965f240-ef4a-4e7f-9ca0-ee2bd8ad199e',NULL,'direct-grant-validate-password','b1a77210-c7ee-43b5-b50d-620366c5ffd4','4390d5c0-d3de-449f-abd7-220a4fe1baf0',0,20,0,NULL,NULL),
('6cabdb56-5378-4272-9025-8240f4a88bf0',NULL,'client-secret','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','cbacc7e3-dd4b-4c7d-a94d-8a487f93b176',2,10,0,NULL,NULL),
('6cc9119d-41a6-42e5-9fa9-9eea58fa3174',NULL,'registration-password-action','b1a77210-c7ee-43b5-b50d-620366c5ffd4','627debb4-435a-41a3-a9ba-c25304963fc7',0,50,0,NULL,NULL),
('6e1a3228-2fd7-431d-beca-57834405c095',NULL,'conditional-user-configured','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','f32f1d01-cb9e-4660-a59e-d7cfba35d19b',0,10,0,NULL,NULL),
('6f5976b0-45ac-478b-bd4c-a19ecb83a2a9',NULL,'idp-email-verification','b1a77210-c7ee-43b5-b50d-620366c5ffd4','dce44159-093a-4a72-a6f1-c7978acc403a',2,10,0,NULL,NULL),
('70b4b42c-a8bb-466c-8029-59dae9147367',NULL,'reset-credential-email','b1a77210-c7ee-43b5-b50d-620366c5ffd4','94d6e301-e593-4d14-a685-aae625f94d55',0,20,0,NULL,NULL),
('75391e3f-5c58-46eb-ab16-ec3c80ac1c34',NULL,'reset-password','b1a77210-c7ee-43b5-b50d-620366c5ffd4','94d6e301-e593-4d14-a685-aae625f94d55',0,30,0,NULL,NULL),
('764a2b13-59fb-47bd-a50c-778a5ad0cdfb',NULL,'direct-grant-validate-password','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','c64a6554-8b71-45d6-9922-e5b660af0aa8',0,20,0,NULL,NULL),
('79039ddb-5a7c-4059-be26-5c467a05bbc7',NULL,'auth-otp-form','b1a77210-c7ee-43b5-b50d-620366c5ffd4','66ca8a5f-d447-41ae-9aa2-18d5993fcb2f',0,20,0,NULL,NULL),
('79f7a10a-bb05-46d6-81e6-2dd281beb387',NULL,'client-jwt','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','cbacc7e3-dd4b-4c7d-a94d-8a487f93b176',2,20,0,NULL,NULL),
('7a1ea401-36e9-4586-b088-9c3f6fefe993',NULL,'auth-username-password-form','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','9094f67f-b6cd-4837-a3ac-e5ec1dc48cb5',0,10,0,NULL,NULL),
('7e484ee5-3c46-4436-8a2f-d5f861c22358',NULL,'auth-cookie','b1a77210-c7ee-43b5-b50d-620366c5ffd4','97fa366c-2aa1-4fe4-a983-da9db5d0a3ec',2,10,0,NULL,NULL),
('7e8683be-e380-4513-a2bc-84264dca6c0a',NULL,'direct-grant-validate-otp','b1a77210-c7ee-43b5-b50d-620366c5ffd4','d1e1183d-6886-449b-98b1-a321304036af',0,20,0,NULL,NULL),
('83375612-a7fe-4a7c-bdbc-111f14ddac89',NULL,'idp-create-user-if-unique','b1a77210-c7ee-43b5-b50d-620366c5ffd4','cccc458a-9e02-4e96-bfd2-38634f0a55b7',2,10,0,NULL,'156c2873-cb24-493d-99f2-1a4419746e6d'),
('852214be-2f49-4957-bdb5-ed1dfddb74f7',NULL,'auth-otp-form','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','f32f1d01-cb9e-4660-a59e-d7cfba35d19b',0,20,0,NULL,NULL),
('8623c56a-946b-4449-a52a-c51ccd4be6ef',NULL,NULL,'b1a77210-c7ee-43b5-b50d-620366c5ffd4','4390d5c0-d3de-449f-abd7-220a4fe1baf0',1,30,1,'d1e1183d-6886-449b-98b1-a321304036af',NULL),
('86332f94-32d1-41f1-a078-14d78f49efcf',NULL,'client-x509','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','cbacc7e3-dd4b-4c7d-a94d-8a487f93b176',2,40,0,NULL,NULL),
('866ab72e-f357-4d16-ada6-9741b02c6327',NULL,'conditional-user-configured','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','8ceb73b1-a899-494f-835e-64a9d2918d0a',0,10,0,NULL,NULL),
('8705e6ed-a762-4a7d-951f-8cc68b175e33',NULL,NULL,'b1a77210-c7ee-43b5-b50d-620366c5ffd4','97fa366c-2aa1-4fe4-a983-da9db5d0a3ec',2,26,1,'125d4e66-69d4-4d2c-a148-42c26d6875ea',NULL),
('8fde28d3-bdd6-4f8a-9fb0-d293ea8c9eb3',NULL,'client-secret-jwt','b1a77210-c7ee-43b5-b50d-620366c5ffd4','1f25beab-ee5c-42d4-8ccf-97a851baaf6d',2,30,0,NULL,NULL),
('941165f3-e3e6-4e41-a670-9d91363d6284',NULL,NULL,'b1a77210-c7ee-43b5-b50d-620366c5ffd4','d27e9c3a-8951-4ad3-8cf5-6ba93bd04b6f',1,20,1,'c505b7d5-0fb3-4cd1-9ef5-5406efba3623',NULL),
('976c0ece-888b-4e13-a425-96b604804210',NULL,'client-jwt','b1a77210-c7ee-43b5-b50d-620366c5ffd4','1f25beab-ee5c-42d4-8ccf-97a851baaf6d',2,20,0,NULL,NULL),
('99a078c0-fb25-4752-9b6b-26022405846d',NULL,'client-secret-jwt','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','cbacc7e3-dd4b-4c7d-a94d-8a487f93b176',2,30,0,NULL,NULL),
('9be105b0-e197-4739-87c8-00d14300cb2b',NULL,'identity-provider-redirector','b1a77210-c7ee-43b5-b50d-620366c5ffd4','97fa366c-2aa1-4fe4-a983-da9db5d0a3ec',2,25,0,NULL,NULL),
('9c5dab6b-2b8d-41a8-8204-96eddf70077d',NULL,'registration-terms-and-conditions','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','ca86de54-3359-47fc-957c-e10af5f9d88b',3,70,0,NULL,NULL),
('9dccc3b7-f08d-4aba-9bbe-844f2a2fb843',NULL,'auth-otp-form','b1a77210-c7ee-43b5-b50d-620366c5ffd4','c505b7d5-0fb3-4cd1-9ef5-5406efba3623',0,20,0,NULL,NULL),
('9e9b3ea4-e806-4eb3-8e8e-5a1b7fe1f0eb',NULL,'registration-page-form','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','d5f1a3b0-5e4c-4940-ac44-5ba4ef37d53d',0,10,1,'ca86de54-3359-47fc-957c-e10af5f9d88b',NULL),
('9efc7574-b507-4673-9b66-ec91fe731515',NULL,'registration-password-action','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','ca86de54-3359-47fc-957c-e10af5f9d88b',0,50,0,NULL,NULL),
('a19e8e57-6bd1-46e6-b719-409afea1b1ab',NULL,'idp-username-password-form','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','04e9b767-5cf4-4302-b24b-6a3d1cbd07f8',0,10,0,NULL,NULL),
('ae6fa138-467b-4672-826d-9c54d2a1abd0',NULL,NULL,'4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','9094f67f-b6cd-4837-a3ac-e5ec1dc48cb5',1,20,1,'f32f1d01-cb9e-4660-a59e-d7cfba35d19b',NULL),
('b15760d5-3fb6-4a0a-85a0-478ec0fe128e',NULL,'idp-review-profile','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','33dc6da8-d357-400a-baaf-46b61b159151',0,10,0,NULL,'47997987-9c21-44ae-aefa-1d160a5ae4bf'),
('b1fb006a-b128-4a9b-80a4-048f5ee18032',NULL,NULL,'b1a77210-c7ee-43b5-b50d-620366c5ffd4','94d6e301-e593-4d14-a685-aae625f94d55',1,40,1,'1f9610b4-a7e3-43ab-b0b4-9650721ce46f',NULL),
('b313e975-a78e-4448-ada4-24293ab95f9e',NULL,'reset-otp','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','8ceb73b1-a899-494f-835e-64a9d2918d0a',0,20,0,NULL,NULL),
('b428b2e6-c48f-4ce6-8832-01062befdbbd',NULL,'registration-recaptcha-action','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','ca86de54-3359-47fc-957c-e10af5f9d88b',3,60,0,NULL,NULL),
('b49ad35a-c220-428f-9821-3931fdeeb9c9',NULL,'organization','b1a77210-c7ee-43b5-b50d-620366c5ffd4','05a0a264-960a-4ad2-8a29-77a1035e7998',2,20,0,NULL,NULL),
('b6d371cc-47de-4d32-83a4-5a4ae4ae4940',NULL,'registration-page-form','b1a77210-c7ee-43b5-b50d-620366c5ffd4','82207a4e-9de6-4606-8197-68c90cfcc0bc',0,10,1,'627debb4-435a-41a3-a9ba-c25304963fc7',NULL),
('b9594971-5ed8-453b-96dc-9c78838c82dd',NULL,NULL,'b1a77210-c7ee-43b5-b50d-620366c5ffd4','cccc458a-9e02-4e96-bfd2-38634f0a55b7',2,20,1,'b7922f95-5758-4fea-93bd-b21f46eca416',NULL),
('bb3028d9-7e96-494f-bf6f-edf3ddfaf775',NULL,NULL,'b1a77210-c7ee-43b5-b50d-620366c5ffd4','035946f5-5d48-4d2f-ad13-19f72b90321a',1,50,1,'a1590564-2057-4cb5-b232-04f28b16e651',NULL),
('c12763df-2a9a-43b5-a593-87f44b32e581',NULL,NULL,'4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','3d0daf6f-d3cd-4a7d-bb53-653100371b39',0,20,1,'38a3a97c-4550-481e-8db9-2bf5e24daf21',NULL),
('c3e7d047-a161-4812-8e46-b7db91d63e5b',NULL,NULL,'4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','6cbda524-79d2-47eb-969f-dd99ed1011fd',2,30,1,'9094f67f-b6cd-4837-a3ac-e5ec1dc48cb5',NULL),
('c8497907-ad93-4cb4-ada3-9f282a2b34a5',NULL,NULL,'4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','33dc6da8-d357-400a-baaf-46b61b159151',0,20,1,'29e551a0-3797-42a4-a630-13f632e9d22a',NULL),
('c918bf6a-523a-4e2c-9e67-a9c5f6fa1c63',NULL,'registration-user-creation','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','ca86de54-3359-47fc-957c-e10af5f9d88b',0,20,0,NULL,NULL),
('d5577f52-ddf6-4713-a9c6-23fb01fbd9f8',NULL,'reset-password','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','7022adce-6435-47df-a72e-6012fb681de6',0,30,0,NULL,NULL),
('e2a00413-92dc-4774-9d57-40f00861e06c',NULL,'client-secret','b1a77210-c7ee-43b5-b50d-620366c5ffd4','1f25beab-ee5c-42d4-8ccf-97a851baaf6d',2,10,0,NULL,NULL),
('e5bdf83e-4d96-49ba-8996-fcc097cfc615',NULL,NULL,'b1a77210-c7ee-43b5-b50d-620366c5ffd4','b7922f95-5758-4fea-93bd-b21f46eca416',0,20,1,'dce44159-093a-4a72-a6f1-c7978acc403a',NULL),
('ef408510-778e-4d97-a562-53f7df6eb0c3',NULL,'http-basic-authenticator','b1a77210-c7ee-43b5-b50d-620366c5ffd4','461dc6a6-38b1-4a87-b2e3-53d03b2d132e',0,10,0,NULL,NULL),
('ef944c41-62ff-4b9a-a4ae-928d1ff09055',NULL,'auth-otp-form','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','1091a1c4-056d-4d52-9898-6e459ed766f7',0,20,0,NULL,NULL),
('f07903e2-02fc-47fc-bddd-0ef334bc084f',NULL,'conditional-user-configured','b1a77210-c7ee-43b5-b50d-620366c5ffd4','1f9610b4-a7e3-43ab-b0b4-9650721ce46f',0,10,0,NULL,NULL),
('f1cc71c5-011c-4abe-ad8e-ed3a34ddf16f',NULL,NULL,'b1a77210-c7ee-43b5-b50d-620366c5ffd4','125d4e66-69d4-4d2c-a148-42c26d6875ea',1,10,1,'05a0a264-960a-4ad2-8a29-77a1035e7998',NULL),
('f43c2012-30a2-47da-b29a-c6e5745e5df2',NULL,NULL,'4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','29e551a0-3797-42a4-a630-13f632e9d22a',2,20,1,'3d0daf6f-d3cd-4a7d-bb53-653100371b39',NULL),
('fb4f5e6e-1d3c-49bf-b672-d3e859f6ff29',NULL,NULL,'4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','7022adce-6435-47df-a72e-6012fb681de6',1,40,1,'8ceb73b1-a899-494f-835e-64a9d2918d0a',NULL),
('fdcda977-dd89-4d13-8dd9-9039245db009',NULL,'reset-otp','b1a77210-c7ee-43b5-b50d-620366c5ffd4','1f9610b4-a7e3-43ab-b0b4-9650721ce46f',0,20,0,NULL,NULL),
('feb6162b-7c6a-4c99-943d-1bce52d2cb6c',NULL,'idp-create-user-if-unique','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','29e551a0-3797-42a4-a630-13f632e9d22a',2,10,0,NULL,'197b3c3d-ccb7-45b2-b7d3-73dc6a8a9a50');
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` tinyint(4) NOT NULL DEFAULT '0',
  `BUILT_IN` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES
('035946f5-5d48-4d2f-ad13-19f72b90321a','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','b1a77210-c7ee-43b5-b50d-620366c5ffd4','basic-flow',1,1),
('04e9b767-5cf4-4302-b24b-6a3d1cbd07f8','Verify Existing Account by Re-authentication','Reauthentication of existing account','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','basic-flow',0,1),
('05a0a264-960a-4ad2-8a29-77a1035e7998','Browser - Conditional Organization','Flow to determine if the organization identity-first login is to be used','b1a77210-c7ee-43b5-b50d-620366c5ffd4','basic-flow',0,1),
('1091a1c4-056d-4d52-9898-6e459ed766f7','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','basic-flow',0,1),
('125d4e66-69d4-4d2c-a148-42c26d6875ea','Organization',NULL,'b1a77210-c7ee-43b5-b50d-620366c5ffd4','basic-flow',0,1),
('1f25beab-ee5c-42d4-8ccf-97a851baaf6d','clients','Base authentication for clients','b1a77210-c7ee-43b5-b50d-620366c5ffd4','client-flow',1,1),
('1f9610b4-a7e3-43ab-b0b4-9650721ce46f','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','b1a77210-c7ee-43b5-b50d-620366c5ffd4','basic-flow',0,1),
('2393fbe5-75d7-4eeb-972d-2004f9af4da8','docker auth','Used by Docker clients to authenticate against the IDP','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','basic-flow',1,1),
('29e551a0-3797-42a4-a630-13f632e9d22a','User creation or linking','Flow for the existing/non-existing user alternatives','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','basic-flow',0,1),
('2c063396-7f2f-4598-b9bb-b55f412e630c','docker auth','Used by Docker clients to authenticate against the IDP','b1a77210-c7ee-43b5-b50d-620366c5ffd4','basic-flow',1,1),
('33dc6da8-d357-400a-baaf-46b61b159151','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','basic-flow',1,1),
('34dffdb3-b264-4563-93e8-9420474f59b5','saml ecp','SAML ECP Profile Authentication Flow','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','basic-flow',1,1),
('38a3a97c-4550-481e-8db9-2bf5e24daf21','Account verification options','Method with which to verity the existing account','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','basic-flow',0,1),
('3d0daf6f-d3cd-4a7d-bb53-653100371b39','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','basic-flow',0,1),
('4390d5c0-d3de-449f-abd7-220a4fe1baf0','direct grant','OpenID Connect Resource Owner Grant','b1a77210-c7ee-43b5-b50d-620366c5ffd4','basic-flow',1,1),
('461dc6a6-38b1-4a87-b2e3-53d03b2d132e','saml ecp','SAML ECP Profile Authentication Flow','b1a77210-c7ee-43b5-b50d-620366c5ffd4','basic-flow',1,1),
('627debb4-435a-41a3-a9ba-c25304963fc7','registration form','Registration form','b1a77210-c7ee-43b5-b50d-620366c5ffd4','form-flow',0,1),
('65ddfc22-0299-433c-bd33-2ac36db55025','Verify Existing Account by Re-authentication','Reauthentication of existing account','b1a77210-c7ee-43b5-b50d-620366c5ffd4','basic-flow',0,1),
('66ca8a5f-d447-41ae-9aa2-18d5993fcb2f','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','b1a77210-c7ee-43b5-b50d-620366c5ffd4','basic-flow',0,1),
('6cbda524-79d2-47eb-969f-dd99ed1011fd','browser','Browser based authentication','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','basic-flow',1,1),
('7022adce-6435-47df-a72e-6012fb681de6','reset credentials','Reset credentials for a user if they forgot their password or something','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','basic-flow',1,1),
('82207a4e-9de6-4606-8197-68c90cfcc0bc','registration','Registration flow','b1a77210-c7ee-43b5-b50d-620366c5ffd4','basic-flow',1,1),
('8ceb73b1-a899-494f-835e-64a9d2918d0a','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','basic-flow',0,1),
('9094f67f-b6cd-4837-a3ac-e5ec1dc48cb5','forms','Username, password, otp and other auth forms.','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','basic-flow',0,1),
('94d6e301-e593-4d14-a685-aae625f94d55','reset credentials','Reset credentials for a user if they forgot their password or something','b1a77210-c7ee-43b5-b50d-620366c5ffd4','basic-flow',1,1),
('97fa366c-2aa1-4fe4-a983-da9db5d0a3ec','browser','Browser based authentication','b1a77210-c7ee-43b5-b50d-620366c5ffd4','basic-flow',1,1),
('a1590564-2057-4cb5-b232-04f28b16e651','First Broker Login - Conditional Organization','Flow to determine if the authenticator that adds organization members is to be used','b1a77210-c7ee-43b5-b50d-620366c5ffd4','basic-flow',0,1),
('b7922f95-5758-4fea-93bd-b21f46eca416','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','b1a77210-c7ee-43b5-b50d-620366c5ffd4','basic-flow',0,1),
('c505b7d5-0fb3-4cd1-9ef5-5406efba3623','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','b1a77210-c7ee-43b5-b50d-620366c5ffd4','basic-flow',0,1),
('c64a6554-8b71-45d6-9922-e5b660af0aa8','direct grant','OpenID Connect Resource Owner Grant','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','basic-flow',1,1),
('ca86de54-3359-47fc-957c-e10af5f9d88b','registration form','Registration form','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','form-flow',0,1),
('cbacc7e3-dd4b-4c7d-a94d-8a487f93b176','clients','Base authentication for clients','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','client-flow',1,1),
('cccc458a-9e02-4e96-bfd2-38634f0a55b7','User creation or linking','Flow for the existing/non-existing user alternatives','b1a77210-c7ee-43b5-b50d-620366c5ffd4','basic-flow',0,1),
('d1e1183d-6886-449b-98b1-a321304036af','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','b1a77210-c7ee-43b5-b50d-620366c5ffd4','basic-flow',0,1),
('d27e9c3a-8951-4ad3-8cf5-6ba93bd04b6f','forms','Username, password, otp and other auth forms.','b1a77210-c7ee-43b5-b50d-620366c5ffd4','basic-flow',0,1),
('d5f1a3b0-5e4c-4940-ac44-5ba4ef37d53d','registration','Registration flow','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','basic-flow',1,1),
('dce44159-093a-4a72-a6f1-c7978acc403a','Account verification options','Method with which to verity the existing account','b1a77210-c7ee-43b5-b50d-620366c5ffd4','basic-flow',0,1),
('e00f4ad9-09ba-49a7-88b2-ef4a5d7bdcfd','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','basic-flow',0,1),
('f32f1d01-cb9e-4660-a59e-d7cfba35d19b','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','basic-flow',0,1);
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES
('156c2873-cb24-493d-99f2-1a4419746e6d','create unique user config','b1a77210-c7ee-43b5-b50d-620366c5ffd4'),
('197b3c3d-ccb7-45b2-b7d3-73dc6a8a9a50','create unique user config','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a'),
('47997987-9c21-44ae-aefa-1d160a5ae4bf','review profile config','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a'),
('d83fd09e-7564-4295-bb08-37809686cb8d','review profile config','b1a77210-c7ee-43b5-b50d-620366c5ffd4');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES
('156c2873-cb24-493d-99f2-1a4419746e6d','false','require.password.update.after.registration'),
('197b3c3d-ccb7-45b2-b7d3-73dc6a8a9a50','false','require.password.update.after.registration'),
('47997987-9c21-44ae-aefa-1d160a5ae4bf','missing','update.profile.on.first.login'),
('d83fd09e-7564-4295-bb08-37809686cb8d','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` tinyint(4) NOT NULL DEFAULT '0',
  `FULL_SCOPE_ALLOWED` tinyint(4) NOT NULL DEFAULT '0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PUBLIC_CLIENT` tinyint(4) NOT NULL DEFAULT '0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` tinyint(4) NOT NULL DEFAULT '0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` tinyint(4) NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int(11) DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` tinyint(4) NOT NULL DEFAULT '0',
  `CONSENT_REQUIRED` tinyint(4) NOT NULL DEFAULT '0',
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` tinyint(4) NOT NULL DEFAULT '0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` tinyint(4) NOT NULL DEFAULT '1',
  `IMPLICIT_FLOW_ENABLED` tinyint(4) NOT NULL DEFAULT '0',
  `DIRECT_ACCESS_GRANTS_ENABLED` tinyint(4) NOT NULL DEFAULT '0',
  `ALWAYS_DISPLAY_IN_CONSOLE` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES
('09b71159-4aa6-446f-852b-ead526fb5577',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'b1a77210-c7ee-43b5-b50d-620366c5ffd4','openid-connect',0,0,0,'${client_broker}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),
('1041f61b-95d7-40cc-b290-3c344e6ddbcc',1,0,'account-console',0,1,NULL,'/realms/qualite-logicielle/account/',0,NULL,0,'b1a77210-c7ee-43b5-b50d-620366c5ffd4','openid-connect',0,0,0,'${client_account-console}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),
('48083b3d-ab85-42e2-b58b-e2a77ebbce41',1,1,'security-admin-console',0,1,NULL,'/admin/qualite-logicielle/console/',0,NULL,0,'b1a77210-c7ee-43b5-b50d-620366c5ffd4','openid-connect',0,0,0,'${client_security-admin-console}',0,'client-secret','${authAdminUrl}',NULL,NULL,1,0,0,0),
('623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad',1,0,'account',0,1,NULL,'/realms/master/account/',0,NULL,0,'4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','openid-connect',0,0,0,'${client_account}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),
('8356c5b1-09d7-42ac-8224-ebacd8e1bdee',1,1,'admin-cli',0,1,NULL,NULL,0,NULL,0,'4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','openid-connect',0,0,0,'${client_admin-cli}',0,'client-secret',NULL,NULL,NULL,0,0,1,0),
('921fe5ab-c238-47e1-b045-c62ae715c822',1,1,'security-admin-console',0,1,NULL,'/admin/master/console/',0,NULL,0,'4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','openid-connect',0,0,0,'${client_security-admin-console}',0,'client-secret','${authAdminUrl}',NULL,NULL,1,0,0,0),
('983e49d2-9da2-4752-a0ac-17f5a724c755',1,1,'API',0,1,NULL,'',0,'',0,'b1a77210-c7ee-43b5-b50d-620366c5ffd4','openid-connect',-1,1,0,'API',0,'client-secret','','',NULL,0,0,1,0),
('a00f7cca-2385-4f44-8360-df5da1ff1878',1,0,'account-console',0,1,NULL,'/realms/master/account/',0,NULL,0,'4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','openid-connect',0,0,0,'${client_account-console}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),
('a24b8455-d8ea-4265-8f91-b1b93a316dfa',1,0,'realm-management',0,0,NULL,NULL,1,NULL,0,'b1a77210-c7ee-43b5-b50d-620366c5ffd4','openid-connect',0,0,0,'${client_realm-management}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),
('a288d0a4-2c9e-4542-b484-20a8f0fbcb8d',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','openid-connect',0,0,0,'${client_broker}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),
('b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',1,0,'qualite-logicielle-realm',0,0,NULL,NULL,1,NULL,0,'4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',NULL,0,0,0,'qualite-logicielle Realm',0,'client-secret',NULL,NULL,NULL,1,0,0,0),
('ef2c4b8c-5453-47cb-b963-2c4ffa19b2e9',1,1,'admin-cli',0,1,NULL,NULL,0,NULL,0,'b1a77210-c7ee-43b5-b50d-620366c5ffd4','openid-connect',0,0,0,'${client_admin-cli}',0,'client-secret',NULL,NULL,NULL,0,0,1,0),
('f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',1,0,'master-realm',0,0,NULL,NULL,1,NULL,0,'4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',NULL,0,0,0,'master Realm',0,'client-secret',NULL,NULL,NULL,1,0,0,0),
('fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6',1,0,'account',0,1,NULL,'/realms/qualite-logicielle/account/',0,NULL,0,'b1a77210-c7ee-43b5-b50d-620366c5ffd4','openid-connect',0,0,0,'${client_account}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0);
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES
('09b71159-4aa6-446f-852b-ead526fb5577','post.logout.redirect.uris','+'),
('09b71159-4aa6-446f-852b-ead526fb5577','realm_client','true'),
('1041f61b-95d7-40cc-b290-3c344e6ddbcc','pkce.code.challenge.method','S256'),
('1041f61b-95d7-40cc-b290-3c344e6ddbcc','post.logout.redirect.uris','+'),
('1041f61b-95d7-40cc-b290-3c344e6ddbcc','realm_client','false'),
('48083b3d-ab85-42e2-b58b-e2a77ebbce41','client.use.lightweight.access.token.enabled','true'),
('48083b3d-ab85-42e2-b58b-e2a77ebbce41','pkce.code.challenge.method','S256'),
('48083b3d-ab85-42e2-b58b-e2a77ebbce41','post.logout.redirect.uris','+'),
('48083b3d-ab85-42e2-b58b-e2a77ebbce41','realm_client','false'),
('623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad','post.logout.redirect.uris','+'),
('8356c5b1-09d7-42ac-8224-ebacd8e1bdee','client.use.lightweight.access.token.enabled','true'),
('921fe5ab-c238-47e1-b045-c62ae715c822','client.use.lightweight.access.token.enabled','true'),
('921fe5ab-c238-47e1-b045-c62ae715c822','pkce.code.challenge.method','S256'),
('921fe5ab-c238-47e1-b045-c62ae715c822','post.logout.redirect.uris','+'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','acr.loa.map','{}'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','backchannel.logout.revoke.offline.tokens','false'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','backchannel.logout.session.required','true'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','client.introspection.response.allow.jwt.claim.enabled','false'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','client.secret.creation.time','1744319236'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','client.use.lightweight.access.token.enabled','false'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','client_credentials.use_refresh_token','false'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','display.on.consent.screen','false'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','frontchannel.logout.session.required','true'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','oauth2.device.authorization.grant.enabled','false'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','oidc.ciba.grant.enabled','false'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','post.logout.redirect.uris','+'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','realm_client','false'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','request.object.encryption.alg','any'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','request.object.encryption.enc','any'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','request.object.required','not required'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','request.object.signature.alg','any'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','require.pushed.authorization.requests','false'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','tls.client.certificate.bound.access.tokens','false'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','token.response.type.bearer.lower-case','false'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','use.jwks.url','false'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','use.refresh.tokens','true'),
('a00f7cca-2385-4f44-8360-df5da1ff1878','pkce.code.challenge.method','S256'),
('a00f7cca-2385-4f44-8360-df5da1ff1878','post.logout.redirect.uris','+'),
('a24b8455-d8ea-4265-8f91-b1b93a316dfa','post.logout.redirect.uris','+'),
('a24b8455-d8ea-4265-8f91-b1b93a316dfa','realm_client','true'),
('ef2c4b8c-5453-47cb-b963-2c4ffa19b2e9','client.use.lightweight.access.token.enabled','true'),
('ef2c4b8c-5453-47cb-b963-2c4ffa19b2e9','post.logout.redirect.uris','+'),
('ef2c4b8c-5453-47cb-b963-2c4ffa19b2e9','realm_client','false'),
('fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6','post.logout.redirect.uris','+'),
('fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6','realm_client','false');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `EXPIRATION` int(11) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  `REMAINING_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES
('11f9e67b-c3b4-4a25-ba38-b64754f90b7c','service_account','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','Specific scope for a client enabled for service accounts','openid-connect'),
('1739edec-8d4a-4330-ac98-c67390be1091','phone','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','OpenID Connect built-in scope: phone','openid-connect'),
('1894c44f-4305-4208-9fcf-4af8d5c041d5','acr','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),
('2f9efd55-e428-4b82-a7a0-ade74a1cdb93','email','b1a77210-c7ee-43b5-b50d-620366c5ffd4','OpenID Connect built-in scope: email','openid-connect'),
('32afa067-3577-40f2-a76d-d32cd73bf361','offline_access','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','OpenID Connect built-in scope: offline_access','openid-connect'),
('37946409-175b-486f-a55f-959c32c28d68','phone','b1a77210-c7ee-43b5-b50d-620366c5ffd4','OpenID Connect built-in scope: phone','openid-connect'),
('3873c462-bf8d-473c-8e66-d645ecffe77b','web-origins','b1a77210-c7ee-43b5-b50d-620366c5ffd4','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),
('4acb56d8-f3d6-4df3-9142-460514615d73','offline_access','b1a77210-c7ee-43b5-b50d-620366c5ffd4','OpenID Connect built-in scope: offline_access','openid-connect'),
('64a91ad0-8efc-4470-8621-ed15e7e8ca5e','service_account','b1a77210-c7ee-43b5-b50d-620366c5ffd4','Specific scope for a client enabled for service accounts','openid-connect'),
('64b3295a-5f99-4c9a-bce4-31ceb0d272e7','basic','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','OpenID Connect scope for add all basic claims to the token','openid-connect'),
('6747ad30-9cd1-4b70-990a-4af23e29e153','email','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','OpenID Connect built-in scope: email','openid-connect'),
('70a3f165-a7db-4f60-b53c-2350a70d933d','roles','b1a77210-c7ee-43b5-b50d-620366c5ffd4','OpenID Connect scope for add user roles to the access token','openid-connect'),
('7136d1d8-9596-4a7e-9843-d6b7fb0b7b19','acr','b1a77210-c7ee-43b5-b50d-620366c5ffd4','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),
('7948c893-a9da-413f-90c8-966d9eb01323','basic','b1a77210-c7ee-43b5-b50d-620366c5ffd4','OpenID Connect scope for add all basic claims to the token','openid-connect'),
('9953f399-6e23-48db-96b3-10b8aff0a7e6','profile','b1a77210-c7ee-43b5-b50d-620366c5ffd4','OpenID Connect built-in scope: profile','openid-connect'),
('a5ecba62-5dc4-4582-af48-a952c3cbc778','role_list','b1a77210-c7ee-43b5-b50d-620366c5ffd4','SAML role list','saml'),
('ab578b8b-a434-4cfd-ae4a-4529f9cad8af','microprofile-jwt','b1a77210-c7ee-43b5-b50d-620366c5ffd4','Microprofile - JWT built-in scope','openid-connect'),
('b7c6002a-3960-408a-9949-337715e0e406','address','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','OpenID Connect built-in scope: address','openid-connect'),
('d134c583-e475-4ae8-a973-2042540036d5','organization','b1a77210-c7ee-43b5-b50d-620366c5ffd4','Additional claims about the organization a subject belongs to','openid-connect'),
('d28afb2d-aee5-4aaf-b62e-4e02a89dfdf5','role_list','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','SAML role list','saml'),
('d661f2a0-295d-4533-8034-1ae27d7c47a3','address','b1a77210-c7ee-43b5-b50d-620366c5ffd4','OpenID Connect built-in scope: address','openid-connect'),
('d6cb0d13-02cb-4c1e-b889-ac27edb55f24','saml_organization','b1a77210-c7ee-43b5-b50d-620366c5ffd4','Organization Membership','saml'),
('d77698a7-4c19-4b42-92d7-b3fecf8dda46','web-origins','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),
('df8e24fb-c092-4e3f-8a7c-d0e9c9100716','roles','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','OpenID Connect scope for add user roles to the access token','openid-connect'),
('e29de210-7ce6-49fd-a200-6e78d1f0b044','microprofile-jwt','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','Microprofile - JWT built-in scope','openid-connect'),
('e323ef15-de0b-4a41-acbb-5a3b9324f572','organization','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','Additional claims about the organization a subject belongs to','openid-connect'),
('e3e88111-c498-4b28-b739-0e92903f8d75','saml_organization','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','Organization Membership','saml'),
('fbeead1c-cd5a-48c9-b28c-78b773462c25','profile','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','OpenID Connect built-in scope: profile','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES
('11f9e67b-c3b4-4a25-ba38-b64754f90b7c','false','display.on.consent.screen'),
('11f9e67b-c3b4-4a25-ba38-b64754f90b7c','false','include.in.token.scope'),
('1739edec-8d4a-4330-ac98-c67390be1091','${phoneScopeConsentText}','consent.screen.text'),
('1739edec-8d4a-4330-ac98-c67390be1091','true','display.on.consent.screen'),
('1739edec-8d4a-4330-ac98-c67390be1091','true','include.in.token.scope'),
('1894c44f-4305-4208-9fcf-4af8d5c041d5','false','display.on.consent.screen'),
('1894c44f-4305-4208-9fcf-4af8d5c041d5','false','include.in.token.scope'),
('2f9efd55-e428-4b82-a7a0-ade74a1cdb93','${emailScopeConsentText}','consent.screen.text'),
('2f9efd55-e428-4b82-a7a0-ade74a1cdb93','true','display.on.consent.screen'),
('2f9efd55-e428-4b82-a7a0-ade74a1cdb93','true','include.in.token.scope'),
('32afa067-3577-40f2-a76d-d32cd73bf361','${offlineAccessScopeConsentText}','consent.screen.text'),
('32afa067-3577-40f2-a76d-d32cd73bf361','true','display.on.consent.screen'),
('37946409-175b-486f-a55f-959c32c28d68','${phoneScopeConsentText}','consent.screen.text'),
('37946409-175b-486f-a55f-959c32c28d68','true','display.on.consent.screen'),
('37946409-175b-486f-a55f-959c32c28d68','true','include.in.token.scope'),
('3873c462-bf8d-473c-8e66-d645ecffe77b','','consent.screen.text'),
('3873c462-bf8d-473c-8e66-d645ecffe77b','false','display.on.consent.screen'),
('3873c462-bf8d-473c-8e66-d645ecffe77b','false','include.in.token.scope'),
('4acb56d8-f3d6-4df3-9142-460514615d73','${offlineAccessScopeConsentText}','consent.screen.text'),
('4acb56d8-f3d6-4df3-9142-460514615d73','true','display.on.consent.screen'),
('64a91ad0-8efc-4470-8621-ed15e7e8ca5e','false','display.on.consent.screen'),
('64a91ad0-8efc-4470-8621-ed15e7e8ca5e','false','include.in.token.scope'),
('64b3295a-5f99-4c9a-bce4-31ceb0d272e7','false','display.on.consent.screen'),
('64b3295a-5f99-4c9a-bce4-31ceb0d272e7','false','include.in.token.scope'),
('6747ad30-9cd1-4b70-990a-4af23e29e153','${emailScopeConsentText}','consent.screen.text'),
('6747ad30-9cd1-4b70-990a-4af23e29e153','true','display.on.consent.screen'),
('6747ad30-9cd1-4b70-990a-4af23e29e153','true','include.in.token.scope'),
('70a3f165-a7db-4f60-b53c-2350a70d933d','${rolesScopeConsentText}','consent.screen.text'),
('70a3f165-a7db-4f60-b53c-2350a70d933d','true','display.on.consent.screen'),
('70a3f165-a7db-4f60-b53c-2350a70d933d','false','include.in.token.scope'),
('7136d1d8-9596-4a7e-9843-d6b7fb0b7b19','false','display.on.consent.screen'),
('7136d1d8-9596-4a7e-9843-d6b7fb0b7b19','false','include.in.token.scope'),
('7948c893-a9da-413f-90c8-966d9eb01323','false','display.on.consent.screen'),
('7948c893-a9da-413f-90c8-966d9eb01323','false','include.in.token.scope'),
('9953f399-6e23-48db-96b3-10b8aff0a7e6','${profileScopeConsentText}','consent.screen.text'),
('9953f399-6e23-48db-96b3-10b8aff0a7e6','true','display.on.consent.screen'),
('9953f399-6e23-48db-96b3-10b8aff0a7e6','true','include.in.token.scope'),
('a5ecba62-5dc4-4582-af48-a952c3cbc778','${samlRoleListScopeConsentText}','consent.screen.text'),
('a5ecba62-5dc4-4582-af48-a952c3cbc778','true','display.on.consent.screen'),
('ab578b8b-a434-4cfd-ae4a-4529f9cad8af','false','display.on.consent.screen'),
('ab578b8b-a434-4cfd-ae4a-4529f9cad8af','true','include.in.token.scope'),
('b7c6002a-3960-408a-9949-337715e0e406','${addressScopeConsentText}','consent.screen.text'),
('b7c6002a-3960-408a-9949-337715e0e406','true','display.on.consent.screen'),
('b7c6002a-3960-408a-9949-337715e0e406','true','include.in.token.scope'),
('d134c583-e475-4ae8-a973-2042540036d5','${organizationScopeConsentText}','consent.screen.text'),
('d134c583-e475-4ae8-a973-2042540036d5','true','display.on.consent.screen'),
('d134c583-e475-4ae8-a973-2042540036d5','true','include.in.token.scope'),
('d28afb2d-aee5-4aaf-b62e-4e02a89dfdf5','${samlRoleListScopeConsentText}','consent.screen.text'),
('d28afb2d-aee5-4aaf-b62e-4e02a89dfdf5','true','display.on.consent.screen'),
('d661f2a0-295d-4533-8034-1ae27d7c47a3','${addressScopeConsentText}','consent.screen.text'),
('d661f2a0-295d-4533-8034-1ae27d7c47a3','true','display.on.consent.screen'),
('d661f2a0-295d-4533-8034-1ae27d7c47a3','true','include.in.token.scope'),
('d6cb0d13-02cb-4c1e-b889-ac27edb55f24','false','display.on.consent.screen'),
('d77698a7-4c19-4b42-92d7-b3fecf8dda46','','consent.screen.text'),
('d77698a7-4c19-4b42-92d7-b3fecf8dda46','false','display.on.consent.screen'),
('d77698a7-4c19-4b42-92d7-b3fecf8dda46','false','include.in.token.scope'),
('df8e24fb-c092-4e3f-8a7c-d0e9c9100716','${rolesScopeConsentText}','consent.screen.text'),
('df8e24fb-c092-4e3f-8a7c-d0e9c9100716','true','display.on.consent.screen'),
('df8e24fb-c092-4e3f-8a7c-d0e9c9100716','false','include.in.token.scope'),
('e29de210-7ce6-49fd-a200-6e78d1f0b044','false','display.on.consent.screen'),
('e29de210-7ce6-49fd-a200-6e78d1f0b044','true','include.in.token.scope'),
('e323ef15-de0b-4a41-acbb-5a3b9324f572','${organizationScopeConsentText}','consent.screen.text'),
('e323ef15-de0b-4a41-acbb-5a3b9324f572','true','display.on.consent.screen'),
('e323ef15-de0b-4a41-acbb-5a3b9324f572','true','include.in.token.scope'),
('e3e88111-c498-4b28-b739-0e92903f8d75','false','display.on.consent.screen'),
('fbeead1c-cd5a-48c9-b28c-78b773462c25','${profileScopeConsentText}','consent.screen.text'),
('fbeead1c-cd5a-48c9-b28c-78b773462c25','true','display.on.consent.screen'),
('fbeead1c-cd5a-48c9-b28c-78b773462c25','true','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES
('09b71159-4aa6-446f-852b-ead526fb5577','2f9efd55-e428-4b82-a7a0-ade74a1cdb93',1),
('09b71159-4aa6-446f-852b-ead526fb5577','37946409-175b-486f-a55f-959c32c28d68',0),
('09b71159-4aa6-446f-852b-ead526fb5577','3873c462-bf8d-473c-8e66-d645ecffe77b',1),
('09b71159-4aa6-446f-852b-ead526fb5577','4acb56d8-f3d6-4df3-9142-460514615d73',0),
('09b71159-4aa6-446f-852b-ead526fb5577','70a3f165-a7db-4f60-b53c-2350a70d933d',1),
('09b71159-4aa6-446f-852b-ead526fb5577','7136d1d8-9596-4a7e-9843-d6b7fb0b7b19',1),
('09b71159-4aa6-446f-852b-ead526fb5577','7948c893-a9da-413f-90c8-966d9eb01323',1),
('09b71159-4aa6-446f-852b-ead526fb5577','9953f399-6e23-48db-96b3-10b8aff0a7e6',1),
('09b71159-4aa6-446f-852b-ead526fb5577','ab578b8b-a434-4cfd-ae4a-4529f9cad8af',0),
('09b71159-4aa6-446f-852b-ead526fb5577','d134c583-e475-4ae8-a973-2042540036d5',0),
('09b71159-4aa6-446f-852b-ead526fb5577','d661f2a0-295d-4533-8034-1ae27d7c47a3',0),
('1041f61b-95d7-40cc-b290-3c344e6ddbcc','2f9efd55-e428-4b82-a7a0-ade74a1cdb93',1),
('1041f61b-95d7-40cc-b290-3c344e6ddbcc','37946409-175b-486f-a55f-959c32c28d68',0),
('1041f61b-95d7-40cc-b290-3c344e6ddbcc','3873c462-bf8d-473c-8e66-d645ecffe77b',1),
('1041f61b-95d7-40cc-b290-3c344e6ddbcc','4acb56d8-f3d6-4df3-9142-460514615d73',0),
('1041f61b-95d7-40cc-b290-3c344e6ddbcc','70a3f165-a7db-4f60-b53c-2350a70d933d',1),
('1041f61b-95d7-40cc-b290-3c344e6ddbcc','7136d1d8-9596-4a7e-9843-d6b7fb0b7b19',1),
('1041f61b-95d7-40cc-b290-3c344e6ddbcc','7948c893-a9da-413f-90c8-966d9eb01323',1),
('1041f61b-95d7-40cc-b290-3c344e6ddbcc','9953f399-6e23-48db-96b3-10b8aff0a7e6',1),
('1041f61b-95d7-40cc-b290-3c344e6ddbcc','ab578b8b-a434-4cfd-ae4a-4529f9cad8af',0),
('1041f61b-95d7-40cc-b290-3c344e6ddbcc','d134c583-e475-4ae8-a973-2042540036d5',0),
('1041f61b-95d7-40cc-b290-3c344e6ddbcc','d661f2a0-295d-4533-8034-1ae27d7c47a3',0),
('48083b3d-ab85-42e2-b58b-e2a77ebbce41','2f9efd55-e428-4b82-a7a0-ade74a1cdb93',1),
('48083b3d-ab85-42e2-b58b-e2a77ebbce41','37946409-175b-486f-a55f-959c32c28d68',0),
('48083b3d-ab85-42e2-b58b-e2a77ebbce41','3873c462-bf8d-473c-8e66-d645ecffe77b',1),
('48083b3d-ab85-42e2-b58b-e2a77ebbce41','4acb56d8-f3d6-4df3-9142-460514615d73',0),
('48083b3d-ab85-42e2-b58b-e2a77ebbce41','70a3f165-a7db-4f60-b53c-2350a70d933d',1),
('48083b3d-ab85-42e2-b58b-e2a77ebbce41','7136d1d8-9596-4a7e-9843-d6b7fb0b7b19',1),
('48083b3d-ab85-42e2-b58b-e2a77ebbce41','7948c893-a9da-413f-90c8-966d9eb01323',1),
('48083b3d-ab85-42e2-b58b-e2a77ebbce41','9953f399-6e23-48db-96b3-10b8aff0a7e6',1),
('48083b3d-ab85-42e2-b58b-e2a77ebbce41','ab578b8b-a434-4cfd-ae4a-4529f9cad8af',0),
('48083b3d-ab85-42e2-b58b-e2a77ebbce41','d134c583-e475-4ae8-a973-2042540036d5',0),
('48083b3d-ab85-42e2-b58b-e2a77ebbce41','d661f2a0-295d-4533-8034-1ae27d7c47a3',0),
('623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad','1739edec-8d4a-4330-ac98-c67390be1091',0),
('623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad','1894c44f-4305-4208-9fcf-4af8d5c041d5',1),
('623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad','32afa067-3577-40f2-a76d-d32cd73bf361',0),
('623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad','64b3295a-5f99-4c9a-bce4-31ceb0d272e7',1),
('623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad','6747ad30-9cd1-4b70-990a-4af23e29e153',1),
('623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad','b7c6002a-3960-408a-9949-337715e0e406',0),
('623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad','d77698a7-4c19-4b42-92d7-b3fecf8dda46',1),
('623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad','df8e24fb-c092-4e3f-8a7c-d0e9c9100716',1),
('623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad','e29de210-7ce6-49fd-a200-6e78d1f0b044',0),
('623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad','e323ef15-de0b-4a41-acbb-5a3b9324f572',0),
('623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad','fbeead1c-cd5a-48c9-b28c-78b773462c25',1),
('8356c5b1-09d7-42ac-8224-ebacd8e1bdee','1739edec-8d4a-4330-ac98-c67390be1091',0),
('8356c5b1-09d7-42ac-8224-ebacd8e1bdee','1894c44f-4305-4208-9fcf-4af8d5c041d5',1),
('8356c5b1-09d7-42ac-8224-ebacd8e1bdee','32afa067-3577-40f2-a76d-d32cd73bf361',0),
('8356c5b1-09d7-42ac-8224-ebacd8e1bdee','64b3295a-5f99-4c9a-bce4-31ceb0d272e7',1),
('8356c5b1-09d7-42ac-8224-ebacd8e1bdee','6747ad30-9cd1-4b70-990a-4af23e29e153',1),
('8356c5b1-09d7-42ac-8224-ebacd8e1bdee','b7c6002a-3960-408a-9949-337715e0e406',0),
('8356c5b1-09d7-42ac-8224-ebacd8e1bdee','d77698a7-4c19-4b42-92d7-b3fecf8dda46',1),
('8356c5b1-09d7-42ac-8224-ebacd8e1bdee','df8e24fb-c092-4e3f-8a7c-d0e9c9100716',1),
('8356c5b1-09d7-42ac-8224-ebacd8e1bdee','e29de210-7ce6-49fd-a200-6e78d1f0b044',0),
('8356c5b1-09d7-42ac-8224-ebacd8e1bdee','e323ef15-de0b-4a41-acbb-5a3b9324f572',0),
('8356c5b1-09d7-42ac-8224-ebacd8e1bdee','fbeead1c-cd5a-48c9-b28c-78b773462c25',1),
('921fe5ab-c238-47e1-b045-c62ae715c822','1739edec-8d4a-4330-ac98-c67390be1091',0),
('921fe5ab-c238-47e1-b045-c62ae715c822','1894c44f-4305-4208-9fcf-4af8d5c041d5',1),
('921fe5ab-c238-47e1-b045-c62ae715c822','32afa067-3577-40f2-a76d-d32cd73bf361',0),
('921fe5ab-c238-47e1-b045-c62ae715c822','64b3295a-5f99-4c9a-bce4-31ceb0d272e7',1),
('921fe5ab-c238-47e1-b045-c62ae715c822','6747ad30-9cd1-4b70-990a-4af23e29e153',1),
('921fe5ab-c238-47e1-b045-c62ae715c822','b7c6002a-3960-408a-9949-337715e0e406',0),
('921fe5ab-c238-47e1-b045-c62ae715c822','d77698a7-4c19-4b42-92d7-b3fecf8dda46',1),
('921fe5ab-c238-47e1-b045-c62ae715c822','df8e24fb-c092-4e3f-8a7c-d0e9c9100716',1),
('921fe5ab-c238-47e1-b045-c62ae715c822','e29de210-7ce6-49fd-a200-6e78d1f0b044',0),
('921fe5ab-c238-47e1-b045-c62ae715c822','e323ef15-de0b-4a41-acbb-5a3b9324f572',0),
('921fe5ab-c238-47e1-b045-c62ae715c822','fbeead1c-cd5a-48c9-b28c-78b773462c25',1),
('983e49d2-9da2-4752-a0ac-17f5a724c755','2f9efd55-e428-4b82-a7a0-ade74a1cdb93',1),
('983e49d2-9da2-4752-a0ac-17f5a724c755','37946409-175b-486f-a55f-959c32c28d68',0),
('983e49d2-9da2-4752-a0ac-17f5a724c755','3873c462-bf8d-473c-8e66-d645ecffe77b',1),
('983e49d2-9da2-4752-a0ac-17f5a724c755','4acb56d8-f3d6-4df3-9142-460514615d73',0),
('983e49d2-9da2-4752-a0ac-17f5a724c755','70a3f165-a7db-4f60-b53c-2350a70d933d',1),
('983e49d2-9da2-4752-a0ac-17f5a724c755','7136d1d8-9596-4a7e-9843-d6b7fb0b7b19',1),
('983e49d2-9da2-4752-a0ac-17f5a724c755','7948c893-a9da-413f-90c8-966d9eb01323',1),
('983e49d2-9da2-4752-a0ac-17f5a724c755','9953f399-6e23-48db-96b3-10b8aff0a7e6',1),
('983e49d2-9da2-4752-a0ac-17f5a724c755','ab578b8b-a434-4cfd-ae4a-4529f9cad8af',0),
('983e49d2-9da2-4752-a0ac-17f5a724c755','d134c583-e475-4ae8-a973-2042540036d5',0),
('983e49d2-9da2-4752-a0ac-17f5a724c755','d661f2a0-295d-4533-8034-1ae27d7c47a3',0),
('a00f7cca-2385-4f44-8360-df5da1ff1878','1739edec-8d4a-4330-ac98-c67390be1091',0),
('a00f7cca-2385-4f44-8360-df5da1ff1878','1894c44f-4305-4208-9fcf-4af8d5c041d5',1),
('a00f7cca-2385-4f44-8360-df5da1ff1878','32afa067-3577-40f2-a76d-d32cd73bf361',0),
('a00f7cca-2385-4f44-8360-df5da1ff1878','64b3295a-5f99-4c9a-bce4-31ceb0d272e7',1),
('a00f7cca-2385-4f44-8360-df5da1ff1878','6747ad30-9cd1-4b70-990a-4af23e29e153',1),
('a00f7cca-2385-4f44-8360-df5da1ff1878','b7c6002a-3960-408a-9949-337715e0e406',0),
('a00f7cca-2385-4f44-8360-df5da1ff1878','d77698a7-4c19-4b42-92d7-b3fecf8dda46',1),
('a00f7cca-2385-4f44-8360-df5da1ff1878','df8e24fb-c092-4e3f-8a7c-d0e9c9100716',1),
('a00f7cca-2385-4f44-8360-df5da1ff1878','e29de210-7ce6-49fd-a200-6e78d1f0b044',0),
('a00f7cca-2385-4f44-8360-df5da1ff1878','e323ef15-de0b-4a41-acbb-5a3b9324f572',0),
('a00f7cca-2385-4f44-8360-df5da1ff1878','fbeead1c-cd5a-48c9-b28c-78b773462c25',1),
('a24b8455-d8ea-4265-8f91-b1b93a316dfa','2f9efd55-e428-4b82-a7a0-ade74a1cdb93',1),
('a24b8455-d8ea-4265-8f91-b1b93a316dfa','37946409-175b-486f-a55f-959c32c28d68',0),
('a24b8455-d8ea-4265-8f91-b1b93a316dfa','3873c462-bf8d-473c-8e66-d645ecffe77b',1),
('a24b8455-d8ea-4265-8f91-b1b93a316dfa','4acb56d8-f3d6-4df3-9142-460514615d73',0),
('a24b8455-d8ea-4265-8f91-b1b93a316dfa','70a3f165-a7db-4f60-b53c-2350a70d933d',1),
('a24b8455-d8ea-4265-8f91-b1b93a316dfa','7136d1d8-9596-4a7e-9843-d6b7fb0b7b19',1),
('a24b8455-d8ea-4265-8f91-b1b93a316dfa','7948c893-a9da-413f-90c8-966d9eb01323',1),
('a24b8455-d8ea-4265-8f91-b1b93a316dfa','9953f399-6e23-48db-96b3-10b8aff0a7e6',1),
('a24b8455-d8ea-4265-8f91-b1b93a316dfa','ab578b8b-a434-4cfd-ae4a-4529f9cad8af',0),
('a24b8455-d8ea-4265-8f91-b1b93a316dfa','d134c583-e475-4ae8-a973-2042540036d5',0),
('a24b8455-d8ea-4265-8f91-b1b93a316dfa','d661f2a0-295d-4533-8034-1ae27d7c47a3',0),
('a288d0a4-2c9e-4542-b484-20a8f0fbcb8d','1739edec-8d4a-4330-ac98-c67390be1091',0),
('a288d0a4-2c9e-4542-b484-20a8f0fbcb8d','1894c44f-4305-4208-9fcf-4af8d5c041d5',1),
('a288d0a4-2c9e-4542-b484-20a8f0fbcb8d','32afa067-3577-40f2-a76d-d32cd73bf361',0),
('a288d0a4-2c9e-4542-b484-20a8f0fbcb8d','64b3295a-5f99-4c9a-bce4-31ceb0d272e7',1),
('a288d0a4-2c9e-4542-b484-20a8f0fbcb8d','6747ad30-9cd1-4b70-990a-4af23e29e153',1),
('a288d0a4-2c9e-4542-b484-20a8f0fbcb8d','b7c6002a-3960-408a-9949-337715e0e406',0),
('a288d0a4-2c9e-4542-b484-20a8f0fbcb8d','d77698a7-4c19-4b42-92d7-b3fecf8dda46',1),
('a288d0a4-2c9e-4542-b484-20a8f0fbcb8d','df8e24fb-c092-4e3f-8a7c-d0e9c9100716',1),
('a288d0a4-2c9e-4542-b484-20a8f0fbcb8d','e29de210-7ce6-49fd-a200-6e78d1f0b044',0),
('a288d0a4-2c9e-4542-b484-20a8f0fbcb8d','e323ef15-de0b-4a41-acbb-5a3b9324f572',0),
('a288d0a4-2c9e-4542-b484-20a8f0fbcb8d','fbeead1c-cd5a-48c9-b28c-78b773462c25',1),
('ef2c4b8c-5453-47cb-b963-2c4ffa19b2e9','2f9efd55-e428-4b82-a7a0-ade74a1cdb93',1),
('ef2c4b8c-5453-47cb-b963-2c4ffa19b2e9','37946409-175b-486f-a55f-959c32c28d68',0),
('ef2c4b8c-5453-47cb-b963-2c4ffa19b2e9','3873c462-bf8d-473c-8e66-d645ecffe77b',1),
('ef2c4b8c-5453-47cb-b963-2c4ffa19b2e9','4acb56d8-f3d6-4df3-9142-460514615d73',0),
('ef2c4b8c-5453-47cb-b963-2c4ffa19b2e9','70a3f165-a7db-4f60-b53c-2350a70d933d',1),
('ef2c4b8c-5453-47cb-b963-2c4ffa19b2e9','7136d1d8-9596-4a7e-9843-d6b7fb0b7b19',1),
('ef2c4b8c-5453-47cb-b963-2c4ffa19b2e9','7948c893-a9da-413f-90c8-966d9eb01323',1),
('ef2c4b8c-5453-47cb-b963-2c4ffa19b2e9','9953f399-6e23-48db-96b3-10b8aff0a7e6',1),
('ef2c4b8c-5453-47cb-b963-2c4ffa19b2e9','ab578b8b-a434-4cfd-ae4a-4529f9cad8af',0),
('ef2c4b8c-5453-47cb-b963-2c4ffa19b2e9','d134c583-e475-4ae8-a973-2042540036d5',0),
('ef2c4b8c-5453-47cb-b963-2c4ffa19b2e9','d661f2a0-295d-4533-8034-1ae27d7c47a3',0),
('f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba','1739edec-8d4a-4330-ac98-c67390be1091',0),
('f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba','1894c44f-4305-4208-9fcf-4af8d5c041d5',1),
('f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba','32afa067-3577-40f2-a76d-d32cd73bf361',0),
('f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba','64b3295a-5f99-4c9a-bce4-31ceb0d272e7',1),
('f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba','6747ad30-9cd1-4b70-990a-4af23e29e153',1),
('f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba','b7c6002a-3960-408a-9949-337715e0e406',0),
('f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba','d77698a7-4c19-4b42-92d7-b3fecf8dda46',1),
('f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba','df8e24fb-c092-4e3f-8a7c-d0e9c9100716',1),
('f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba','e29de210-7ce6-49fd-a200-6e78d1f0b044',0),
('f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba','e323ef15-de0b-4a41-acbb-5a3b9324f572',0),
('f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba','fbeead1c-cd5a-48c9-b28c-78b773462c25',1),
('fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6','2f9efd55-e428-4b82-a7a0-ade74a1cdb93',1),
('fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6','37946409-175b-486f-a55f-959c32c28d68',0),
('fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6','3873c462-bf8d-473c-8e66-d645ecffe77b',1),
('fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6','4acb56d8-f3d6-4df3-9142-460514615d73',0),
('fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6','70a3f165-a7db-4f60-b53c-2350a70d933d',1),
('fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6','7136d1d8-9596-4a7e-9843-d6b7fb0b7b19',1),
('fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6','7948c893-a9da-413f-90c8-966d9eb01323',1),
('fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6','9953f399-6e23-48db-96b3-10b8aff0a7e6',1),
('fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6','ab578b8b-a434-4cfd-ae4a-4529f9cad8af',0),
('fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6','d134c583-e475-4ae8-a973-2042540036d5',0),
('fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6','d661f2a0-295d-4533-8034-1ae27d7c47a3',0);
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES
('32afa067-3577-40f2-a76d-d32cd73bf361','4416fc71-bc5b-4170-8bbc-ba6a15731cd1'),
('4acb56d8-f3d6-4df3-9142-460514615d73','b73bbd7c-04a9-4a8a-896e-3f8c58af41f1');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES
('0248236d-cff2-4b42-8bc8-80b17c934dc9','Consent Required','b1a77210-c7ee-43b5-b50d-620366c5ffd4','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','b1a77210-c7ee-43b5-b50d-620366c5ffd4','anonymous'),
('0a21e824-7c4d-4d88-8927-8d843223186a','Allowed Client Scopes','b1a77210-c7ee-43b5-b50d-620366c5ffd4','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','b1a77210-c7ee-43b5-b50d-620366c5ffd4','anonymous'),
('26910bde-b330-45c1-9423-f3d98a4d68fd','aes-generated','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','aes-generated','org.keycloak.keys.KeyProvider','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',NULL),
('27f2e159-563c-4bf3-aa59-43e8ba50c8a9','Trusted Hosts','b1a77210-c7ee-43b5-b50d-620366c5ffd4','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','b1a77210-c7ee-43b5-b50d-620366c5ffd4','anonymous'),
('2bca2936-bd95-43b0-b627-a281e24f2b36','Max Clients Limit','b1a77210-c7ee-43b5-b50d-620366c5ffd4','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','b1a77210-c7ee-43b5-b50d-620366c5ffd4','anonymous'),
('341106b8-40f4-40d4-a113-c8295d037848','Max Clients Limit','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','anonymous'),
('35a1ce9b-34d8-4762-a8f8-764a0ea831b6','rsa-enc-generated','b1a77210-c7ee-43b5-b50d-620366c5ffd4','rsa-enc-generated','org.keycloak.keys.KeyProvider','b1a77210-c7ee-43b5-b50d-620366c5ffd4',NULL),
('374e6f8d-e79e-4608-baa3-3131af9be5ef','Full Scope Disabled','b1a77210-c7ee-43b5-b50d-620366c5ffd4','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','b1a77210-c7ee-43b5-b50d-620366c5ffd4','anonymous'),
('3c8d7365-c4ea-47e7-902e-fea7f31cb144','hmac-generated-hs512','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','hmac-generated','org.keycloak.keys.KeyProvider','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',NULL),
('46582e93-4f73-4f73-9adf-1a979a9271c0','Allowed Client Scopes','b1a77210-c7ee-43b5-b50d-620366c5ffd4','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','b1a77210-c7ee-43b5-b50d-620366c5ffd4','authenticated'),
('50529f82-f40f-4a00-8e71-5e74114bc89d','Allowed Protocol Mapper Types','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','anonymous'),
('5e0d8aae-e27e-4f87-8106-ee710e29f0d0','Consent Required','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','anonymous'),
('6c5665a0-91f6-4f2f-8728-1a7be6e81e84','Trusted Hosts','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','anonymous'),
('7b9a213c-cfed-4bd7-bf3f-ce5a12776085','Full Scope Disabled','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','anonymous'),
('878738ad-b25d-4c43-bdde-1d9417d30721','rsa-generated','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','rsa-generated','org.keycloak.keys.KeyProvider','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',NULL),
('90fa46d9-3b57-4fdc-8c6e-ad2cba686b1b','Allowed Client Scopes','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','anonymous'),
('a41be408-193a-4fa6-88e9-a9bbd8348a71','Allowed Protocol Mapper Types','b1a77210-c7ee-43b5-b50d-620366c5ffd4','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','b1a77210-c7ee-43b5-b50d-620366c5ffd4','authenticated'),
('a90d1c38-1ade-4bd2-b70e-c4be92cc1d80','aes-generated','b1a77210-c7ee-43b5-b50d-620366c5ffd4','aes-generated','org.keycloak.keys.KeyProvider','b1a77210-c7ee-43b5-b50d-620366c5ffd4',NULL),
('b4d69a32-a595-438d-9033-41a5fde61668',NULL,'4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',NULL),
('baf3a7c3-7a80-4f4b-a00b-caf5d0a49079','rsa-generated','b1a77210-c7ee-43b5-b50d-620366c5ffd4','rsa-generated','org.keycloak.keys.KeyProvider','b1a77210-c7ee-43b5-b50d-620366c5ffd4',NULL),
('bbb7be7f-bf8c-44b4-9c92-ee1dd58794c0','Allowed Protocol Mapper Types','b1a77210-c7ee-43b5-b50d-620366c5ffd4','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','b1a77210-c7ee-43b5-b50d-620366c5ffd4','anonymous'),
('e336b254-00ce-4699-9787-bf70f7937ef6','Allowed Protocol Mapper Types','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','authenticated'),
('e7388f26-e8ec-46a8-9f12-42f8a0d664cd','hmac-generated-hs512','b1a77210-c7ee-43b5-b50d-620366c5ffd4','hmac-generated','org.keycloak.keys.KeyProvider','b1a77210-c7ee-43b5-b50d-620366c5ffd4',NULL),
('ed9cb380-e209-4ac7-be02-9c1263da2789','Allowed Client Scopes','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','authenticated'),
('ff368d33-cd3b-4e90-a6d0-4ba3cf0a37ed','rsa-enc-generated','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','rsa-enc-generated','org.keycloak.keys.KeyProvider','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',NULL);
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES
('0045084f-da10-43f9-8077-5ef5ce59e30c','878738ad-b25d-4c43-bdde-1d9417d30721','priority','100'),
('0e0bcd22-9e68-40e5-a707-f96905c6b4b3','a41be408-193a-4fa6-88e9-a9bbd8348a71','allowed-protocol-mapper-types','oidc-address-mapper'),
('0ed05c50-989e-4ac5-aadb-99441552850d','a41be408-193a-4fa6-88e9-a9bbd8348a71','allowed-protocol-mapper-types','saml-user-property-mapper'),
('0f890e3a-bf0e-4090-9216-a831806a5ee9','e7388f26-e8ec-46a8-9f12-42f8a0d664cd','priority','100'),
('1331ac65-5514-4cbd-b538-2950ea20d637','6c5665a0-91f6-4f2f-8728-1a7be6e81e84','host-sending-registration-request-must-match','true'),
('160bb423-021a-4085-bc8b-5abbd0ff6ec6','878738ad-b25d-4c43-bdde-1d9417d30721','keyUse','SIG'),
('17b69803-0692-4adf-a1d1-4e5fd0644b02','e336b254-00ce-4699-9787-bf70f7937ef6','allowed-protocol-mapper-types','saml-user-property-mapper'),
('188a0e04-4f93-4954-85f3-143518dee811','a90d1c38-1ade-4bd2-b70e-c4be92cc1d80','secret','8WSDiCtvLwW3UdrWizMYOQ'),
('1a2316f1-92b6-44d8-ab62-96e0c927577a','ff368d33-cd3b-4e90-a6d0-4ba3cf0a37ed','certificate','MIICmzCCAYMCBgGWK64m0DANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwNDEyMjAyNDE1WhcNMzUwNDEyMjAyNTU1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCrR9LebtZRH+XaxPtlggSa+b3g1Pf97w1Yf9Usn67rCF2mzYrSEA7tessbabym8aqrd5lcLK6srsZF1V4SEixmDq9MV4CC3uERDba4XXPPUZtsZ8byKI+Rsgep+cXPIPXX9r4m322GCuK/EDn+2KXmMO88xdRyqOL/zxXwzATXeNFbgWUWJBIlWN2Fbktxsi6tPpQ388nBsyObcaSljIAzpSVeeGSv6ECpC66kD78LzYnAO9f/Xh7FflZ5HKzs3ld4VvvIZQTdOCglOkSvjtEhF56zyKHLOR7RcEzm4S+XRDc0sV6D9Mx5oYlQMSGRaeuDlPE3grMwEFBo8NyBwJKrAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHUCoi00Wgz7+jDLQ7N4bq7c5Ox/vHRa7NVKwXJoYDuh2Vl1ddlCfynK5dnBqIyDQnlbJ7k5pPgPLG0Plfst1nQ9MNAITnuI0M0pw0Nwpt8jwWYmFjOQWSDhCeGJVBSElNYXNTEscbqLjAJRnSFxNl2TGbPxr4sct/G3zTSk/GaLW92yByVEtVzheCqOAlA3Fgt6nsSGKToOd52ZXhJ2UsXHJu4JPKXo3bIZUlFUICjl9y9/j/SOvVf0hYxqA9YqDNmVX0ubYms/Hvxhq4PzdF2EIIZYOYgP+Yi9rBVZOn0YmXgDypuZ2HdFa0W/JbTVqAN23dwLNTEqdRUJluSOPHg='),
('1b322310-1ace-43c8-8b39-08c149c2e23a','2bca2936-bd95-43b0-b627-a281e24f2b36','max-clients','200'),
('1f2600ab-2962-4e83-b415-dd6457f290fa','6c5665a0-91f6-4f2f-8728-1a7be6e81e84','client-uris-must-match','true'),
('20ac5900-521b-4995-8bcf-3fb7a36b6e2f','e7388f26-e8ec-46a8-9f12-42f8a0d664cd','algorithm','HS512'),
('2736cef7-e4cf-440c-a16d-9fd94b939051','3c8d7365-c4ea-47e7-902e-fea7f31cb144','priority','100'),
('2a76457f-2342-415f-a9de-785ebd16ce7f','ed9cb380-e209-4ac7-be02-9c1263da2789','allow-default-scopes','true'),
('2f041ea2-f878-4633-b58c-6f729803a7ac','bbb7be7f-bf8c-44b4-9c92-ee1dd58794c0','allowed-protocol-mapper-types','oidc-address-mapper'),
('311727c5-2802-4649-8457-cf19019be4a8','baf3a7c3-7a80-4f4b-a00b-caf5d0a49079','certificate','MIICszCCAZsCBgGWK7BY7zANBgkqhkiG9w0BAQsFADAdMRswGQYDVQQDDBJxdWFsaXRlLWxvZ2ljaWVsbGUwHhcNMjUwNDEyMjAyNjM5WhcNMzUwNDEyMjAyODE5WjAdMRswGQYDVQQDDBJxdWFsaXRlLWxvZ2ljaWVsbGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDJYnln0OIoAk/HuHzvq5lztpASSVh7o6y0XFR0IyW7TszVzwC94qiQjlCrEwVywAvK5/f650Rzvy+q1FNXihLM3rBE0pCTU15ILrx6yqteGSw7c4qKzqKj5hwW8zjNZ5ZgrEfj9U/jZImgx3ful18VWJrGoD218sMnq8TkgPwAD1S6cwIzHD0UnnoJAqtGoEe90hL1Ft5qpxmMKXag4Ie3HdsRZEeBX3TIo1x2TRjoYL73wlpP7BVcBOxj12vQMyZqoCt2EFGedcuUmtTIb5jxJlS9ndzJhuv36pyBICIwxdVbvj2VOICl8dInBzRxg0vzAh+i7h11axxuEikxI2KfAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGt9szY8Ge4C+E+lvGc4ZUmlgZEhz2Gdp6wZv+2+O1cqAymFgIuKAjCveMgMNLWNqx3p7ewWStPWU3I2Ti+Ag94ajhdY61se7TsjJlnOFkBRZvApKQa21DR+Q6OcdOcPJzTF0NvQiivW7WJ+/y3zpDrAavh6v3EqHIV064OkWEFklTB1HliBjLBc87jHi2r9ShsLQwABIJ6ujD/oLqj1i4loLg1KoyQMr/Hxt+hyjJINl8bu0dMS/HGd0Vnt4wbKmlceQ71T6SlBE1CJWogJgdJek9IbILL/Mg/FCm9FZpwJ2KCzedFlpiq82Kr8NcbNcU/KmyJ0o+RIWbyAHR3J4yQ='),
('33b66150-a60e-41b5-8429-0b2cfd0c37f2','a41be408-193a-4fa6-88e9-a9bbd8348a71','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),
('3541931f-09d5-4f3e-9d78-ff3a3023ed43','50529f82-f40f-4a00-8e71-5e74114bc89d','allowed-protocol-mapper-types','oidc-full-name-mapper'),
('36186e88-6384-46d2-9ca4-f9db3b8dfb4d','3c8d7365-c4ea-47e7-902e-fea7f31cb144','secret','98nSCjxwhEal-wuzbyBJxibMLESuElTlCrKcdvc2_H-qRhXaOc_1GqHtX5wKcF2Qz5elJ1HtCG8dy-fPwLDsPGttwYRW4xibiBrRaeVC3SJCknrWHgk_J8cDz0i743lL9qxPS8oxlAh26rFPDH31PJjn6xka-Lf4j6yQCgW5mFI'),
('3c2be6f8-b240-47ac-a89f-7606c0312588','27f2e159-563c-4bf3-aa59-43e8ba50c8a9','host-sending-registration-request-must-match','true'),
('46b8d9b4-d62c-4a1d-99a2-743f426efb6c','35a1ce9b-34d8-4762-a8f8-764a0ea831b6','priority','100'),
('483a774c-23ab-41f0-aae3-2dae765d1475','878738ad-b25d-4c43-bdde-1d9417d30721','privateKey','MIIEowIBAAKCAQEAwMcS125ezNCGNv5VLS8rp9WWnPP7QbL7GaWMLsrlTANYmzpHLCJcv9TuPyYnOE28w1xJcvOFdyZ7YZGYlNNVz6vs2E4s/Yj5GN3tr2HJkk9A5Y+wjw+Ppjqotu6qUSYbMoUjt+CrHDTvRz+GsidR1TzbjyK7EkL4Xz7HzLFIC1wDMBn31ljg/OOK8/JBTU/xtoIOvGmMaQCp/nd6ecpOoEL8qEtBDoeRswY1uJGlet5+qKcncmVBxBmtMn1ut/xfYL+cyfx49Dz9YQ8VUey27sPzkNSXM/nsvAvZr/qoTXcuRZtfCOfu+JI7qGP+b/XIMj1nw1PFVJMEcuRpnlKMewIDAQABAoIBABLvWs6V6jIu5zKen599Cx+Emghs6d3QUTFPMpTkBqAFPMjzxqAzTdiPzHOfxpQVWqL2Z8Z73JJRUXwfZhUe1EZo1NjYMOYZnpyj1nVMDcBVEC2cLqjr9ohK1F3c1RYnFTPMoloCHiclRz1rJB/6lGNKribXL/hsDeOjvHyYCy4GSIWtd0chb5RCQokOtvFnqKsupp6GCaBPmYokle+jcXI1HcOD2U0webKyglt8phPXi+wV3SsnPFPbwPz5O6KmAeRlQj5VJUU31+90XOevB9WT7fyz6M86AaqgpCw+7DFK/PQZczwRANXXf7DSXpmdeu488UxcOpMkrrHnWd3WBR0CgYEA+oaa/8ZETz+d3BfOwW8yRdMTMMGlIno0Loe1PCZRKEApXAuo3eWk1PbhHvjDBN7fH/4WiaQncV3eTeUskGin5TLuU8Q2vzsrb1AeXRBn/VGLs44iBafZVMfb3smuZhGHKsbKFc43tnpexyapDGOfqqSJiXRoU7dGeemH4GDGmTUCgYEAxP1vhvFKZR4LF27qkfAbezDe3wvf/Nh/zNyK6+wclYYd6QvDs4L1TPUIa3o0VYuv8nZzDtQeKlA8hLc0mEtoNS1Js008MYGPSQqw+2/wKRG4I1oHIVwvuSs/qeUAaIlSKRY/ptoAFmP62xdui67qa0YBCe30fmzX6xDdtV639O8CgYAbE28vE5OQaRS7k8shts3dJAnf7B3X0xNOsBYTUSTWT9DohM4UZVxiM+hyu3oATcIZqBFxgM9OflGnY4xkcxsqN03wubUdB90S47rUXhCPHUAXANaGe/SOKCeINY3mtCBCrEdtAeOdki4qIfCFSUMZYz0GIRGhcp5oUKgBxRPRvQKBgQC6P1ASCtKm9hfQiQr4/kZNXDBsPGMDQYLbo20pkCyaZpqi+3+FmvzoTQgv7fPLKe4p1ToFvCHlKcV+SWVN1IXrOS1kfFK8D930VkptADHV8q3hpr31GZ75eN2ReTXAoIzw0dtOmvDYOqE0Qlw/bxquYBqdU8EFQ02GL4UfdTWCOwKBgGWoLSLpYgGB9rXlwNO2InK3cV7mOEuqojF91lpVB51FkWaP9bGB2C6MqU78E2VK4zulYQYi1Fx+OWllSeU6LyVShmcy1T/x/UMVwNKB6lITAwXbjTWLYfYbRCvRTnO0oD2UGbico00qWBiqvCU82Ivu+5+TNrsBDuzgsQoQ4BrD'),
('4b6300c9-ead9-4622-96ba-7093bae5cf3b','bbb7be7f-bf8c-44b4-9c92-ee1dd58794c0','allowed-protocol-mapper-types','saml-role-list-mapper'),
('4c84c199-8f76-4491-a54c-2fbd5edb20f0','26910bde-b330-45c1-9423-f3d98a4d68fd','kid','474c3e2c-1b1b-46e4-b4c0-b47a6a7cdbaa'),
('4e5c974c-e4aa-498e-b875-8ad261be3591','b4d69a32-a595-438d-9033-41a5fde61668','kc.user.profile.config','{\"attributes\":[{\"name\":\"username\",\"displayName\":\"${username}\",\"validations\":{\"length\":{\"min\":3,\"max\":255},\"username-prohibited-characters\":{},\"up-username-not-idn-homograph\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"email\",\"displayName\":\"${email}\",\"validations\":{\"email\":{},\"length\":{\"max\":255}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"firstName\",\"displayName\":\"${firstName}\",\"validations\":{\"length\":{\"max\":255},\"person-name-prohibited-characters\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"lastName\",\"displayName\":\"${lastName}\",\"validations\":{\"length\":{\"max\":255},\"person-name-prohibited-characters\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false}],\"groups\":[{\"name\":\"user-metadata\",\"displayHeader\":\"User metadata\",\"displayDescription\":\"Attributes, which refer to user metadata\"}]}'),
('52a062b1-fa6b-42b3-ac6b-1ec5593757d6','a41be408-193a-4fa6-88e9-a9bbd8348a71','allowed-protocol-mapper-types','saml-user-attribute-mapper'),
('530a0325-9cf2-43ce-ac09-521c6aee202c','a41be408-193a-4fa6-88e9-a9bbd8348a71','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),
('54e4fb53-1a82-4f10-aae0-b3b735c32687','baf3a7c3-7a80-4f4b-a00b-caf5d0a49079','privateKey','MIIEowIBAAKCAQEAyWJ5Z9DiKAJPx7h876uZc7aQEklYe6OstFxUdCMlu07M1c8AveKokI5QqxMFcsALyuf3+udEc78vqtRTV4oSzN6wRNKQk1NeSC68esqrXhksO3OKis6io+YcFvM4zWeWYKxH4/VP42SJoMd37pdfFViaxqA9tfLDJ6vE5ID8AA9UunMCMxw9FJ56CQKrRqBHvdIS9RbeaqcZjCl2oOCHtx3bEWRHgV90yKNcdk0Y6GC+98JaT+wVXATsY9dr0DMmaqArdhBRnnXLlJrUyG+Y8SZUvZ3cyYbr9+qcgSAiMMXVW749lTiApfHSJwc0cYNL8wIfou4ddWscbhIpMSNinwIDAQABAoIBAFJ9iNdyo8DZuY5Izrxp4RCZ/ofPDXSPxeWXUGzGHOWN0K/f/CDL4FpeQULiJsArVGlH/bcD1nFHJiJmmMDp6OuMaE24psoCQ0N0CXaO4AVKcGjl2iEjpVFXp7fq5yCURu/Qgh4pVREDFLEMI99Sl/spcTTdXInUKAZvANbM0uy+oOOsiQ2Kb8Lnz2o4JiIOqZJcbw1Ij0hneHRfp9ek5Ip/WKLj/HzndzpL1expFHmdMz2KfuGbTUSMTr4sXXoSeULWrFE5BSPpmUf1FVK3FHMUnXs7da3SxsKYz5z327xQRQisyvUA+OFqmfUWRmwqpDKpsPvxKkV2v57Xlk09RCkCgYEA5RapgNSdKsoqZWCElVyJHAmm4+Ga22Okpw/5msXyPwM6rAw4z4eEjpf24zu0DrSJmWaSDhNTu8BHsMEKNDGhHnL4O2uzV+FPeCiLog4n1KAD1GR7Cn1Jqy9nCUXAM9XfNaTjdJMtkgZwOQlOIceQosaF1hJvMowpxkXbCseIntMCgYEA4Qqt0JOIPg8Q301+Epzn/6CLB1AP7q/cPxYZwHRrPEODfIJiUUKM2ApnfIQ8jJDNenh7mfJJfwU5M3zHmB8yDiwpwLkEFbzlDG3btZrRBSvY9lARUFXd0/iqnUt1NY95Wr+yRO7lBtdkuneeZS02pCBPDQW+BEzVEiruYAX+RYUCgYA8sJ5DJRBmD5zfsowtTZB9PwlZgaEW0fUC1TaZDCu7Cc33Wl2KjSpO5G9hj6WJ58Y0P3oeBHzAVpYne1yKq0M139tnUob2lxgIiyVCz2E58RJSqDP4eWyUz0AKstHSaaxyd7ZSYdNGxjHgylhKlqX4mYNHTSbsSzmd70+yMV4+RQKBgCQKkcvV1PwbbZhV0NsqRf2quJlzORoBEEUKRRWNj58XMPe/6f8ZqXTwNaK7ivb4OfBjW2hMZXjyXTbhxRWX6WxbplQ3TXAt0IEtFwL+yHsLirPoHt2+4sgQC0Ml0p/BWq4uBV8E46k01e0HO1b45sdiZUawpL4LkBRYy9SVISQBAoGBANFXQgZiOHvkDEIzKfrIXBLRR+24qBxxSWVZyWdgw64olkEcjgTZegjcDKeX9iDo0ZQx6E7X854rfSnxl/ECcH3BJPWOcKg9hZ19tm7jnAQafYZX5ycdcEB+AUJZtaArBw6tjsSiEolvwQ1vuLj2CeANAm2QzeU1b+wd+C55YWvx'),
('55e797a9-9d53-4841-a51f-f6c5e6ec10f5','e336b254-00ce-4699-9787-bf70f7937ef6','allowed-protocol-mapper-types','saml-role-list-mapper'),
('57b18ee5-2a2d-45b9-94cb-6639148a7329','35a1ce9b-34d8-4762-a8f8-764a0ea831b6','privateKey','MIIEpAIBAAKCAQEAyO/0+VhdZdK5OoZ8mLX+Sd+4kSKc8nUzVOUppdyMzqJTikh++Vgz8/RxTS+jqugSQVilJwfO/tUbNsq0wd3j41phaA8HK1naQTb9nrGn1AzTNhg4qXOpk+tj+nfe83XN1+xOGjUzvPiXFVoNYXIpDVY3ZbxNK4lcF12Iwykqr+kPpB/x4ESzZLIqDYGCSjiegj4S5ZDo9xq2UQbsSxY1GYVIUrtUSLbihISvc5r+ka54m7bNFQevlo347TUCJoV1x9OMYsOXVe9h7eqA0oT4eadG1TYNCnHrv1Vm/h00qbgHWeNY7R2CvaT3mQHhCohhHfiNNJEgskjXJ7puIlqPGwIDAQABAoIBACS/BSzIRSRG2gri50xCFAPMfwNDsjIAzudalTg40iNDukVSpq3QvIeDj2jPKn4pvJTosiMmIWum6zgk79N4UaGVOLT/8o6x+uDsPotT794ujj2ZRltuxHdBl+IJI+OgConPNCVEz3Zie7ay5jmI2AsRVkYrnm00zHuVZlpSX/UVNdKf2F17/Z2MBDsDMHDWPliMUs0pLKJf/j3C4nGohK9S2jKTm06oVCj3oi8vPggwoIih3sqylpXoclW8raY36t4SQaexESkLsM1yMLeOS/RfTjONeb876aO6tOS76v4L4c1O1lhG7mVpCGgDowRAGKj5jiLRMVYwyU+y8qS/yskCgYEA9BCHjjSNnr8Ieeb0HviYnl+QBW2wY/KbZZ+kHnbfqW4jxfbiaL8cqrrjGcrRvPCCR9HDtj5rhrcWajOJuM5E3GlDnPOcdD7Jfv5btFKNjaDnSuDmGOM/wrFrltrtjzphp9KC2AKF2j2lR+wJ/hRxPBQRMN+07i5QUwMgNc8DvY0CgYEA0sODTqU8R5nF7klLzZAnDl2eiaqhBUXYeu1MVDF+Pm9ZBKVUfYcW9uO3WOTXaddezGQjlrrl3flazT3+hK9joLI0mwqz3DGuKq5jdLG2tPka1mgMQeNy/aMVm/IKa+nBIkOhcgwfLFkivfFymWvNmp/IUnn/i35D16EE4nxtMUcCgYEArhTwKy0u6lDF4fUqoMCeUzBEUKrpSpDr6DNS42vUokvt9jDfUuklsF02yNnSedpugn2LA/1HwsHqmfuCuy9dDH2EfXmBWaTDIfKZRGgxkRh4gP8jABNvEhZscCBdm3B/4S0UqLA7+utHbaJdij3YeoqxrFOUAONF5b/wBJFQ0K0CgYBp9LZnbDRAvrK914VPQ4AO/cu849XtY66wJenwja0s0CeNaVxveuF1nwdGnk0ZPZe/4zvtA+qZzEj004zHwbCxUcWWiCvhr+wiMud2+/yhQHZYgZhf62uczUcIzgalN6/LfPqF7kghsHIB0YdOT97eNCOuKvzocMLEfYOKJQlz8wKBgQCECaXojZ0OTGLuoDPFHkuOTKbHzPQeyuCwTFO6M9KYRsUQdOAqJDC5oLfBYfIvog8hudqqIkDKsbVRhNM6TPqH4PktX8/D++/fSeXFpXDhaCVjzyxwCT1kr4jcrrtZ9t4H92GHY4M6EZeQUU/QbZFjwRkmSuO4PDo6B3ptI2mKSw=='),
('5922ebec-bf07-465c-9ad6-d3be2197d5d2','bbb7be7f-bf8c-44b4-9c92-ee1dd58794c0','allowed-protocol-mapper-types','saml-user-attribute-mapper'),
('5ad72c49-563d-4ad7-8794-99abfcf1af24','50529f82-f40f-4a00-8e71-5e74114bc89d','allowed-protocol-mapper-types','saml-role-list-mapper'),
('5dcc5263-d9dd-4004-951f-acbaad0f04cb','ff368d33-cd3b-4e90-a6d0-4ba3cf0a37ed','keyUse','ENC'),
('6e864c9f-3275-4b4f-b15a-19618b213796','878738ad-b25d-4c43-bdde-1d9417d30721','certificate','MIICmzCCAYMCBgGWK64mdjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwNDEyMjAyNDE1WhcNMzUwNDEyMjAyNTU1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDAxxLXbl7M0IY2/lUtLyun1Zac8/tBsvsZpYwuyuVMA1ibOkcsIly/1O4/Jic4TbzDXEly84V3JnthkZiU01XPq+zYTiz9iPkY3e2vYcmST0Dlj7CPD4+mOqi27qpRJhsyhSO34KscNO9HP4ayJ1HVPNuPIrsSQvhfPsfMsUgLXAMwGffWWOD844rz8kFNT/G2gg68aYxpAKn+d3p5yk6gQvyoS0EOh5GzBjW4kaV63n6opydyZUHEGa0yfW63/F9gv5zJ/Hj0PP1hDxVR7Lbuw/OQ1Jcz+ey8C9mv+qhNdy5Fm18I5+74kjuoY/5v9cgyPWfDU8VUkwRy5GmeUox7AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHh8jYkIYScEECZdTpEaNdYDnAamY7/KvpO3x+YVQZLXQlNO53b7XJTTUI9syJVZ4NZBh0yibe/S47x/757YGKMSArhrtYyBxItknm4py/xxMj4LT0tWSmUSvmGEobugcRGwLkvSUa/QwHu01LfDghCpxxIbZvDYQfzus1dmaZEaf0oh3rfOY3Nb9SyyZH49aRhTSU65+wPYjY8/u7cxQjdIzooepgivkmpAfnCSysGjqxNJz+B78NaPwKe8tvfzIFPrgnzc0x/hr2/n5s8z6GnkGPR3YeiApq6HIjs8VJMS+D/YHbXusbWGK9jBpLq0fyCYwXrTobmXDBSEqUCh6sU='),
('73072250-7681-45d2-b905-f1cab8076a47','50529f82-f40f-4a00-8e71-5e74114bc89d','allowed-protocol-mapper-types','oidc-address-mapper'),
('7307d216-9108-4979-9626-5b13da6b6196','50529f82-f40f-4a00-8e71-5e74114bc89d','allowed-protocol-mapper-types','saml-user-attribute-mapper'),
('76dec10a-d7e3-4618-b186-6036d187fa7d','a41be408-193a-4fa6-88e9-a9bbd8348a71','allowed-protocol-mapper-types','oidc-full-name-mapper'),
('7bec8307-5e8d-488c-87f2-b910100dcd70','ff368d33-cd3b-4e90-a6d0-4ba3cf0a37ed','priority','100'),
('85893533-b5cb-4aea-982d-3576353f1f64','50529f82-f40f-4a00-8e71-5e74114bc89d','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),
('8801dc41-fabc-4610-b6f4-6f5586ef9bce','baf3a7c3-7a80-4f4b-a00b-caf5d0a49079','priority','100'),
('8a46e8bf-a9a6-4e05-838b-967e38afbaac','e336b254-00ce-4699-9787-bf70f7937ef6','allowed-protocol-mapper-types','oidc-full-name-mapper'),
('8d4fb36c-8ca0-438c-990c-7a176b7271ca','a41be408-193a-4fa6-88e9-a9bbd8348a71','allowed-protocol-mapper-types','saml-role-list-mapper'),
('8fe3859c-3d20-4a4b-8cf9-8c6d7ccbcdbe','26910bde-b330-45c1-9423-f3d98a4d68fd','priority','100'),
('90268794-ada4-48df-ae6c-17f80a238c6d','3c8d7365-c4ea-47e7-902e-fea7f31cb144','algorithm','HS512'),
('9197bc88-699c-4215-ba7c-bdee35cde34b','e336b254-00ce-4699-9787-bf70f7937ef6','allowed-protocol-mapper-types','saml-user-attribute-mapper'),
('9242e0c6-092a-422e-8f76-4e24a697f2b0','50529f82-f40f-4a00-8e71-5e74114bc89d','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),
('978b466d-2742-452e-b9a0-b73f5855e2f5','0a21e824-7c4d-4d88-8927-8d843223186a','allow-default-scopes','true'),
('995926a5-ffd3-47fa-af44-6f1fdce3ae32','a90d1c38-1ade-4bd2-b70e-c4be92cc1d80','kid','2f549e9c-52fc-4fc2-867b-7eec291286fa'),
('9c7980ee-c3b9-4f65-9a10-cdb48128a775','e336b254-00ce-4699-9787-bf70f7937ef6','allowed-protocol-mapper-types','oidc-address-mapper'),
('9ddcf2bc-7059-4954-bf63-3e42472811cd','341106b8-40f4-40d4-a113-c8295d037848','max-clients','200'),
('9f6164a0-7d2f-4209-8bcb-c131f4509e31','50529f82-f40f-4a00-8e71-5e74114bc89d','allowed-protocol-mapper-types','saml-user-property-mapper'),
('a17832a3-7130-40af-8698-973336f63422','e336b254-00ce-4699-9787-bf70f7937ef6','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),
('a2822d6f-9d12-4e5a-866e-0a267aead20d','bbb7be7f-bf8c-44b4-9c92-ee1dd58794c0','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),
('a852576b-079f-4795-86ad-90e5b839a952','3c8d7365-c4ea-47e7-902e-fea7f31cb144','kid','f6f5099a-65b3-43e3-8de9-7a3f74e79efe'),
('abce4c9e-1a2a-43d1-abb2-34fdd16ff194','26910bde-b330-45c1-9423-f3d98a4d68fd','secret','BQTgkQy_WSUE5eK02_rngA'),
('b0623687-6335-4865-81a0-3c42b37c1547','46582e93-4f73-4f73-9adf-1a979a9271c0','allow-default-scopes','true'),
('b4341e22-45d2-4ef3-981e-a1b65b21f660','e336b254-00ce-4699-9787-bf70f7937ef6','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),
('b7a5ae09-078a-43b2-8cca-bfcc2196106b','27f2e159-563c-4bf3-aa59-43e8ba50c8a9','client-uris-must-match','true'),
('b8c0904f-0628-489a-863c-6634dc7d6b29','bbb7be7f-bf8c-44b4-9c92-ee1dd58794c0','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),
('bb0815d0-8ac3-4376-9d67-dc94549cec98','e7388f26-e8ec-46a8-9f12-42f8a0d664cd','kid','944ad61f-db22-473b-b49c-43022eee568b'),
('bfed193e-2997-4c21-9ba1-b2a91d006d5e','e7388f26-e8ec-46a8-9f12-42f8a0d664cd','secret','Yt_WJFiebYLNhZ8nTy4cywdGF15h-e7wCtTwoq-YwI9EmvxLZ2iydGyCaa6NEz9c8I8e_2NV0GIQZDtOeMgq011snz9kqAOe2F5XJfbX0cbcIyhZhMXFqSMSeD2R6QVPkyRb1YxTT08K84gG-0msWL6QK412usnhFgpejIJUytM'),
('d27ebc8f-7eb9-412d-aff7-bb3738bb085a','50529f82-f40f-4a00-8e71-5e74114bc89d','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),
('d5c0c518-06c8-48b7-a1ec-399cef6de827','e336b254-00ce-4699-9787-bf70f7937ef6','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),
('d6f17324-b7ab-4435-8ac8-92e98ffd801c','90fa46d9-3b57-4fdc-8c6e-ad2cba686b1b','allow-default-scopes','true'),
('de6ad117-19e7-42ef-a7cd-1d8fffe07ded','bbb7be7f-bf8c-44b4-9c92-ee1dd58794c0','allowed-protocol-mapper-types','saml-user-property-mapper'),
('e0730208-4060-4916-af7c-ec3cdb640d1b','35a1ce9b-34d8-4762-a8f8-764a0ea831b6','certificate','MIICszCCAZsCBgGWK7BZlDANBgkqhkiG9w0BAQsFADAdMRswGQYDVQQDDBJxdWFsaXRlLWxvZ2ljaWVsbGUwHhcNMjUwNDEyMjAyNjM5WhcNMzUwNDEyMjAyODE5WjAdMRswGQYDVQQDDBJxdWFsaXRlLWxvZ2ljaWVsbGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDI7/T5WF1l0rk6hnyYtf5J37iRIpzydTNU5Sml3IzOolOKSH75WDPz9HFNL6Oq6BJBWKUnB87+1Rs2yrTB3ePjWmFoDwcrWdpBNv2esafUDNM2GDipc6mT62P6d97zdc3X7E4aNTO8+JcVWg1hcikNVjdlvE0riVwXXYjDKSqv6Q+kH/HgRLNksioNgYJKOJ6CPhLlkOj3GrZRBuxLFjUZhUhSu1RItuKEhK9zmv6Rrnibts0VB6+WjfjtNQImhXXH04xiw5dV72Ht6oDShPh5p0bVNg0Kceu/VWb+HTSpuAdZ41jtHYK9pPeZAeEKiGEd+I00kSCySNcnum4iWo8bAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAJ7c/vgdDnEnmQsDcoSbttDl4qr6l63nEaR4Td1KgFuoLPmwab9dezdnwE6EATCoMcumsCiq4ZXJWEuR8VGP5+yfUfe2vjUk3XGJDRvIdhDmDCsb0iaZ6DgAxNxmUvbtp1HX7B4bRqr1DqI3ntfEaExV6AtH5c6RfG5ImGfIefwYM6ouFu9B/40WOFRBJX5SqPid8QpCkVvD04F9+AaUrNrfqJ2h72pGueDo4gcFleBz/47SyPGxNu0v+zYFKewGqkzx1i3TcmAX5wqQhpEYwgj5n45DXlZGSQSdHq7UQhSaCfuyounOWFIVXIWFqOKkS2wjLiWUorKW7x/B4oyhFZw='),
('e3d95169-0659-4427-a051-9ada2db85083','a41be408-193a-4fa6-88e9-a9bbd8348a71','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),
('e6b60661-24ee-4f4a-8a27-377adde64e5c','ff368d33-cd3b-4e90-a6d0-4ba3cf0a37ed','privateKey','MIIEowIBAAKCAQEAq0fS3m7WUR/l2sT7ZYIEmvm94NT3/e8NWH/VLJ+u6whdps2K0hAO7XrLG2m8pvGqq3eZXCyurK7GRdVeEhIsZg6vTFeAgt7hEQ22uF1zz1GbbGfG8iiPkbIHqfnFzyD11/a+Jt9thgrivxA5/til5jDvPMXUcqji/88V8MwE13jRW4FlFiQSJVjdhW5LcbIurT6UN/PJwbMjm3GkpYyAM6UlXnhkr+hAqQuupA+/C82JwDvX/14exX5WeRys7N5XeFb7yGUE3TgoJTpEr47RIRees8ihyzke0XBM5uEvl0Q3NLFeg/TMeaGJUDEhkWnrg5TxN4KzMBBQaPDcgcCSqwIDAQABAoIBAEkFDDlm0DhynFfpXXG3fcYiDViCAp1/4dUmXlexVe1+OgrIGtQWI38Lt/YeXF5hrcx+5uMca3VT51RTM9EJbWMvBH3L2g4w/Yt7KLgtoxcx58xN68tGDnrjBpBo2vNETnq9BvDklLkt/9/Lh6YFb6iUmRF0F2+wX2IGQ4jOOYwwEsD667PF3QR+5jw0KNLiTpRBQ/TJ1EnuWe7t49kJkNOcB+K5evYq75wjGDxoEApnYh57MIZ9LhvxvR2Hjj7b4QOlITimaSNSASw0+YXUZ0cw29P/fJgPEMHae/F551v1mpHO24G4JKqTEJFMP5quCVO9ykkf1kZwb8zwNghXPDECgYEA56I606dOz7TTtajgUpSp6Qd+IwQ3ytasnZBUqyxzU27sU4SGJrNvYsE6VAvwBJTcXlIMhbSZhc3Znl+a59kf+hDWiRf7Au/visxotayjE8YiBvW9hDCrhPfJAgrp8JH8HvFAymTa+RrfMEd5qQqol5UvTd0Ym1kdB4qjRrADfXsCgYEAvUxQ+/9XXKs+jiqNeiJjSPkS4ZmR8EA38+oxgWbVWFEi6NoTZT8w4eiw4fHpH7+4w55nsv9nOqszZ28J6krCd2ApQLj8Czq9JTV3vCqxKW2O66HiOfiL+MH6xB0U5LlS1BzHUroXJF20Dq0ADJFsfs9W0Te23jC12Mq7RYpLgJECgYBRZ3o1F/9ij7I3jXoIi6aK9s8ljz3sUzWmyip3Xc/J6pmzYEelIjprAm11TBy1/3rSyxMLikTJ+WYZeo/+GxhZ0cETvRHCHoCYzu2dq2ZEdMVQnNxVsKUWvd4ukZdVrHhmh3K1rmwmT4NQfE4NUmmdnBhbzO/w6IiDNf3bwc/4MQKBgQCvDio+QC3MFtispBFdhvuF+kBJvLjHErwrpsHNRwm4uJ+t8i3JjZxo7cTVzd6ma6gzzwNa9vHBwZyx5G+o6SXZO2Yq4mbDA7jy9fUaX+ihxR1MLtKEhaL7kneScMpnkjJU0aBKkqjgCn9+quHGvZ010AwbQoisBSPFrgVtE60q4QKBgBkWHW0+JJq4TzhiXYmSCriteVoyAkGoR7w70/4ooVL1+LYNuuKBBHf4xbH3VooyBfgZLR2RzYzMzVNOFb29ZiBgK9Tn58ybWOnYrLodNR3JhvI7Ln+QMzRJvgKbf3pgb+AxUitghJ2njWitz2L7M9AtK79Qp335Z3aRWTCvoRzs'),
('e76c09b1-8621-4949-a931-c16a0160d46d','a90d1c38-1ade-4bd2-b70e-c4be92cc1d80','priority','100'),
('eb1874c4-82ea-49e8-b311-9808fe79bfd8','bbb7be7f-bf8c-44b4-9c92-ee1dd58794c0','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),
('ed16d3f1-15ba-4cb7-9821-39429f081291','35a1ce9b-34d8-4762-a8f8-764a0ea831b6','algorithm','RSA-OAEP'),
('f5ce64e1-5237-4048-b5e3-a842a75f5474','ff368d33-cd3b-4e90-a6d0-4ba3cf0a37ed','algorithm','RSA-OAEP'),
('f800a4e8-2315-4b92-adc0-469d753a5ddd','bbb7be7f-bf8c-44b4-9c92-ee1dd58794c0','allowed-protocol-mapper-types','oidc-full-name-mapper');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES
('103793d3-aad2-4dbb-bd9e-eadfd654a277','0a0a9835-d8e8-4ab3-a941-bfbe6bcb08fd'),
('103793d3-aad2-4dbb-bd9e-eadfd654a277','1285e7cf-bb8c-468d-b4a7-a0b1bc623143'),
('103793d3-aad2-4dbb-bd9e-eadfd654a277','301f8206-3e5e-4d68-9b43-2d99627cac7c'),
('103793d3-aad2-4dbb-bd9e-eadfd654a277','31db89a2-7400-45ea-8170-90ca6aaed992'),
('103793d3-aad2-4dbb-bd9e-eadfd654a277','39abaf7d-ca9d-46c6-a974-180eb852993c'),
('103793d3-aad2-4dbb-bd9e-eadfd654a277','49e7d4ea-641c-4b33-ac69-16ade211c009'),
('103793d3-aad2-4dbb-bd9e-eadfd654a277','52f5bbd7-1f18-4233-a9c2-6622a6c50d5a'),
('103793d3-aad2-4dbb-bd9e-eadfd654a277','7ac7ef17-47cf-4f86-a0db-4a440497d08f'),
('103793d3-aad2-4dbb-bd9e-eadfd654a277','9b71a7c0-6cea-441b-934c-dcbe8e578c12'),
('103793d3-aad2-4dbb-bd9e-eadfd654a277','bd0497ed-ef4f-477b-98be-7c191de6005b'),
('103793d3-aad2-4dbb-bd9e-eadfd654a277','c039fffe-e9a7-48fa-ba3a-96b9bbc88a43'),
('103793d3-aad2-4dbb-bd9e-eadfd654a277','d01ef694-8862-47fe-9ffc-dccdc019e53f'),
('103793d3-aad2-4dbb-bd9e-eadfd654a277','d4eb4ff6-d173-428a-9ef9-65a0ef61f2cb'),
('103793d3-aad2-4dbb-bd9e-eadfd654a277','ddc06e4c-3fe1-447b-9773-e6365cd9c4c7'),
('103793d3-aad2-4dbb-bd9e-eadfd654a277','de7e74b1-08eb-4a60-bd32-6854205bf981'),
('103793d3-aad2-4dbb-bd9e-eadfd654a277','e4b4ff5d-cba6-4a1d-a56b-b357084d8ac5'),
('103793d3-aad2-4dbb-bd9e-eadfd654a277','edb1d7f6-6ba8-420d-9dde-7c707304109b'),
('103793d3-aad2-4dbb-bd9e-eadfd654a277','fadf1ba6-b82e-4a49-80d8-bc49f5d3ad51'),
('1529843a-dc30-4676-a80e-53c7d79af538','07a973d6-f34d-438e-ba0d-457f32f11b7c'),
('1529843a-dc30-4676-a80e-53c7d79af538','092f076f-6f12-4998-8cfa-5934aa3cd73c'),
('1529843a-dc30-4676-a80e-53c7d79af538','0bc3eb49-fd69-403b-bd64-10cba49f97bc'),
('1529843a-dc30-4676-a80e-53c7d79af538','0ef8a022-cc9a-48a3-ab9c-fe3eb3411863'),
('1529843a-dc30-4676-a80e-53c7d79af538','2588a48d-b813-454e-9f02-fbf8c8e793a2'),
('1529843a-dc30-4676-a80e-53c7d79af538','33d67b6e-53d7-4309-ab82-e0ca59ecb6f1'),
('1529843a-dc30-4676-a80e-53c7d79af538','35d81fd6-4951-460e-8d11-bbb954ffd4ff'),
('1529843a-dc30-4676-a80e-53c7d79af538','3cda6b5a-f800-4e6c-b409-8243c7d4646c'),
('1529843a-dc30-4676-a80e-53c7d79af538','40a1524b-93e0-4e8f-80ea-ef475eba87bb'),
('1529843a-dc30-4676-a80e-53c7d79af538','559552a5-585d-4c69-b892-71f5d4da2f18'),
('1529843a-dc30-4676-a80e-53c7d79af538','6d90e606-43e4-4540-b5e4-c555b7758e77'),
('1529843a-dc30-4676-a80e-53c7d79af538','70acd12a-6526-4461-94bf-ede86b114c10'),
('1529843a-dc30-4676-a80e-53c7d79af538','74a6f444-f972-4c1f-a7ad-f369375df2fa'),
('1529843a-dc30-4676-a80e-53c7d79af538','75d4ea1c-5d31-4c4a-bbb5-3327ad0b12f6'),
('1529843a-dc30-4676-a80e-53c7d79af538','7f932d34-56cd-460a-9b19-2a305fc2eea6'),
('1529843a-dc30-4676-a80e-53c7d79af538','8e1b234a-e7c3-4aef-937d-3357a81dcf8d'),
('1529843a-dc30-4676-a80e-53c7d79af538','92389f6b-514b-42c8-9a60-4f3987625570'),
('1529843a-dc30-4676-a80e-53c7d79af538','95e4fa49-b485-4654-b211-5781e575cfb0'),
('1529843a-dc30-4676-a80e-53c7d79af538','9679a38a-4112-485f-b442-0075c7c3978d'),
('1529843a-dc30-4676-a80e-53c7d79af538','990a3d5d-2eba-463c-9aca-7e86edde26bb'),
('1529843a-dc30-4676-a80e-53c7d79af538','a6d6de7f-7311-4f2f-9f4d-f74f486fc638'),
('1529843a-dc30-4676-a80e-53c7d79af538','a92fbc41-55dd-40e5-af65-ba2dc8540e46'),
('1529843a-dc30-4676-a80e-53c7d79af538','aa8f7f18-a298-475c-8196-43f546f13600'),
('1529843a-dc30-4676-a80e-53c7d79af538','b474edb6-6404-43e7-ae7d-3c3f8597309c'),
('1529843a-dc30-4676-a80e-53c7d79af538','b76384ae-67cb-4371-9517-bd8b4c52edbb'),
('1529843a-dc30-4676-a80e-53c7d79af538','b83b0c53-8314-4d78-a92c-8e159cdc36ad'),
('1529843a-dc30-4676-a80e-53c7d79af538','bbead62d-08c1-46fa-afea-5e7e2583b352'),
('1529843a-dc30-4676-a80e-53c7d79af538','bcf4e92f-37f3-4efc-b894-8b4e103ea06c'),
('1529843a-dc30-4676-a80e-53c7d79af538','bdf09ded-7a2f-48db-a785-f4a08e1e886f'),
('1529843a-dc30-4676-a80e-53c7d79af538','c112fcf9-8bc0-4a7a-980e-b81b2dd993fa'),
('1529843a-dc30-4676-a80e-53c7d79af538','d389be8b-6f69-4826-9bc2-5096fed86eae'),
('1529843a-dc30-4676-a80e-53c7d79af538','d559265c-99ac-4ce9-ae00-3b5cf5ba5842'),
('1529843a-dc30-4676-a80e-53c7d79af538','dad006ba-a065-4e4e-96dc-e2d58561ece9'),
('1529843a-dc30-4676-a80e-53c7d79af538','ddc655fc-21b2-4cf2-a50e-0c4548b590b2'),
('1529843a-dc30-4676-a80e-53c7d79af538','eb7cf88d-45d0-4507-8d07-046f6505e670'),
('1529843a-dc30-4676-a80e-53c7d79af538','f2de3dd3-20aa-4e15-b027-5468881f669d'),
('1529843a-dc30-4676-a80e-53c7d79af538','f369dd34-91f6-45e2-bbfe-f7b4a5f31b93'),
('2085d621-eedb-4b8d-b737-8a5e679c9020','4416fc71-bc5b-4170-8bbc-ba6a15731cd1'),
('2085d621-eedb-4b8d-b737-8a5e679c9020','6006296c-09ed-4d47-bbdc-1d8cc8dbc62d'),
('2085d621-eedb-4b8d-b737-8a5e679c9020','74da31e9-a7e2-4090-b8dd-f675df60f30b'),
('2085d621-eedb-4b8d-b737-8a5e679c9020','9271f8bd-2a0d-45aa-8621-f29db4a470a3'),
('559552a5-585d-4c69-b892-71f5d4da2f18','bbead62d-08c1-46fa-afea-5e7e2583b352'),
('559552a5-585d-4c69-b892-71f5d4da2f18','ddc655fc-21b2-4cf2-a50e-0c4548b590b2'),
('74da31e9-a7e2-4090-b8dd-f675df60f30b','fc076564-cf76-4a7d-acc0-46f36d9028f2'),
('78340209-e663-44e6-9897-7ca22787da07','edb39f1d-4e5f-496b-b94b-7c8500642c5b'),
('9afa08a5-f590-4e1b-97ec-47cb0f4aca86','96559c6e-a16e-458d-86ec-9c7189da58c2'),
('a505c039-db07-4ce7-b040-3ed1c145cf2f','bd04d7d4-4018-436a-a3f3-c0d616bea5b0'),
('a92fbc41-55dd-40e5-af65-ba2dc8540e46','07a973d6-f34d-438e-ba0d-457f32f11b7c'),
('a92fbc41-55dd-40e5-af65-ba2dc8540e46','990a3d5d-2eba-463c-9aca-7e86edde26bb'),
('c039fffe-e9a7-48fa-ba3a-96b9bbc88a43','9b71a7c0-6cea-441b-934c-dcbe8e578c12'),
('c50dfbaf-934b-4c85-b5f7-26601953a16b','c54ab7a4-800d-4653-b8d4-8698e99dd2ce'),
('d559265c-99ac-4ce9-ae00-3b5cf5ba5842','33d67b6e-53d7-4309-ab82-e0ca59ecb6f1'),
('d66d287d-8b39-476f-b4f9-8a0976ee2618','841a6a82-e388-43b5-a94e-f76df662fd6e'),
('d66d287d-8b39-476f-b4f9-8a0976ee2618','b73bbd7c-04a9-4a8a-896e-3f8c58af41f1'),
('d66d287d-8b39-476f-b4f9-8a0976ee2618','c50dfbaf-934b-4c85-b5f7-26601953a16b'),
('d66d287d-8b39-476f-b4f9-8a0976ee2618','d79f97c6-9895-412c-a6a1-35ffe1aeb0f5'),
('de7e74b1-08eb-4a60-bd32-6854205bf981','1285e7cf-bb8c-468d-b4a7-a0b1bc623143'),
('de7e74b1-08eb-4a60-bd32-6854205bf981','fadf1ba6-b82e-4a49-80d8-bc49f5d3ad51'),
('f2de3dd3-20aa-4e15-b027-5468881f669d','8e1b234a-e7c3-4aef-937d-3357a81dcf8d');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES
('5807b2d6-cc1d-4248-81a0-57403231f965',NULL,'password','52cd6e09-872e-4beb-9e83-88bafd95c172',1744489555953,NULL,'{\"value\":\"uyWoBWCrE6NYcTR8ZX+1kusrwdVB+Aqx0I2wsVaoJKU=\",\"salt\":\"/TRN3hIrexiVNABgWOI/LA==\",\"additionalParameters\":{}}','{\"hashIterations\":5,\"algorithm\":\"argon2\",\"additionalParameters\":{\"hashLength\":[\"32\"],\"memory\":[\"7168\"],\"type\":[\"id\"],\"version\":[\"1.3\"],\"parallelism\":[\"1\"]}}',10),
('64aa86ae-a356-4976-b12a-d3c3d7ce4320',NULL,'password','d88a7029-8a4c-44e5-bc38-cd7ca625dd12',1744489858420,'My password','{\"value\":\"uQTwlD4MVyWpdfwn6EiXXiyY7ZwtApBK87T8Xb9NHzs=\",\"salt\":\"J0w1TDPXzw/mof5uqkfYXw==\",\"additionalParameters\":{}}','{\"hashIterations\":5,\"algorithm\":\"argon2\",\"additionalParameters\":{\"hashLength\":[\"32\"],\"memory\":[\"7168\"],\"type\":[\"id\"],\"version\":[\"1.3\"],\"parallelism\":[\"1\"]}}',10),
('c4871601-284d-4ee0-a575-3b8788f3bcc9',NULL,'password','e425945d-648f-4a12-8e63-bc8224b2af66',1744489913082,'My password','{\"value\":\"pWeZDHh1+4lPUweeOOctHRJZioFcw4eZfajWMvW9cJA=\",\"salt\":\"TDhjO+gGYMSWJ1755RtxDQ==\",\"additionalParameters\":{}}','{\"hashIterations\":5,\"algorithm\":\"argon2\",\"additionalParameters\":{\"hashLength\":[\"32\"],\"memory\":[\"7168\"],\"type\":[\"id\"],\"version\":[\"1.3\"],\"parallelism\":[\"1\"]}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
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
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES
('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2025-04-12 20:23:28',1,'EXECUTED','9:6f1016664e21e16d26517a4418f5e3df','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2025-04-12 20:23:28',2,'MARK_RAN','9:828775b1596a07d1200ba1d49e5e3941','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2025-04-12 20:23:28',3,'EXECUTED','9:5f090e44a7d595883c1fb61f4b41fd38','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2025-04-12 20:23:28',4,'EXECUTED','9:c07e577387a3d2c04d1adc9aaad8730e','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2025-04-12 20:23:29',5,'EXECUTED','9:b68ce996c655922dbcd2fe6b6ae72686','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2025-04-12 20:23:29',6,'MARK_RAN','9:543b5c9989f024fe35c6f6c5a97de88e','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2025-04-12 20:23:30',7,'EXECUTED','9:765afebbe21cf5bbca048e632df38336','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2025-04-12 20:23:30',8,'MARK_RAN','9:db4a145ba11a6fdaefb397f6dbf829a1','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2025-04-12 20:23:30',9,'EXECUTED','9:9d05c7be10cdb873f8bcb41bc3a8ab23','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2025-04-12 20:23:31',10,'EXECUTED','9:18593702353128d53111f9b1ff0b82b8','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2025-04-12 20:23:32',11,'EXECUTED','9:6122efe5f090e41a85c0f1c9e52cbb62','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2025-04-12 20:23:32',12,'MARK_RAN','9:e1ff28bf7568451453f844c5d54bb0b5','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2025-04-12 20:23:32',13,'EXECUTED','9:7af32cd8957fbc069f796b61217483fd','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2025-04-12 20:23:32',14,'EXECUTED','9:6005e15e84714cd83226bf7879f54190','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2025-04-12 20:23:32',15,'MARK_RAN','9:bf656f5a2b055d07f314431cae76f06c','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2025-04-12 20:23:32',16,'MARK_RAN','9:f8dadc9284440469dcf71e25ca6ab99b','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2025-04-12 20:23:32',17,'EXECUTED','9:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2025-04-12 20:23:33',18,'EXECUTED','9:3368ff0be4c2855ee2dd9ca813b38d8e','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2025-04-12 20:23:34',19,'EXECUTED','9:8ac2fb5dd030b24c0570a763ed75ed20','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2025-04-12 20:23:34',20,'EXECUTED','9:f91ddca9b19743db60e3057679810e6c','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2025-04-12 20:23:34',21,'MARK_RAN','9:831e82914316dc8a57dc09d755f23c51','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2025-04-12 20:23:34',22,'MARK_RAN','9:f91ddca9b19743db60e3057679810e6c','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2025-04-12 20:23:34',23,'EXECUTED','9:bc3d0f9e823a69dc21e23e94c7a94bb1','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2025-04-12 20:23:34',24,'EXECUTED','9:c9999da42f543575ab790e76439a2679','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2025-04-12 20:23:34',25,'MARK_RAN','9:0d6c65c6f58732d81569e77b10ba301d','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2025-04-12 20:23:34',26,'EXECUTED','9:fc576660fc016ae53d2d4778d84d86d0','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2025-04-12 20:23:35',27,'EXECUTED','9:43ed6b0da89ff77206289e87eaa9c024','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2025-04-12 20:23:35',28,'EXECUTED','9:44bae577f551b3738740281eceb4ea70','update tableName=RESOURCE_SERVER_POLICY','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2025-04-12 20:23:35',29,'EXECUTED','9:bd88e1f833df0420b01e114533aee5e8','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2025-04-12 20:23:35',30,'EXECUTED','9:a7022af5267f019d020edfe316ef4371','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2025-04-12 20:23:36',31,'EXECUTED','9:fc155c394040654d6a79227e56f5e25a','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2025-04-12 20:23:36',32,'EXECUTED','9:eac4ffb2a14795e5dc7b426063e54d88','customChange','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2025-04-12 20:23:36',33,'EXECUTED','9:54937c05672568c4c64fc9524c1e9462','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2025-04-12 20:23:36',34,'MARK_RAN','9:3a32bace77c84d7678d035a7f5a8084e','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2025-04-12 20:23:37',35,'EXECUTED','9:33d72168746f81f98ae3a1e8e0ca3554','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2025-04-12 20:23:37',36,'EXECUTED','9:61b6d3d7a4c0e0024b0c839da283da0c','addColumn tableName=REALM','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2025-04-12 20:23:37',37,'EXECUTED','9:8dcac7bdf7378e7d823cdfddebf72fda','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2025-04-12 20:23:37',38,'EXECUTED','9:a2b870802540cb3faa72098db5388af3','addColumn tableName=FED_USER_CONSENT','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2025-04-12 20:23:37',39,'EXECUTED','9:132a67499ba24bcc54fb5cbdcfe7e4c0','addColumn tableName=IDENTITY_PROVIDER','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2025-04-12 20:23:37',40,'MARK_RAN','9:938f894c032f5430f2b0fafb1a243462','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2025-04-12 20:23:37',41,'MARK_RAN','9:845c332ff1874dc5d35974b0babf3006','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2025-04-12 20:23:37',42,'EXECUTED','9:fc86359c079781adc577c5a217e4d04c','customChange','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2025-04-12 20:23:38',43,'EXECUTED','9:59a64800e3c0d09b825f8a3b444fa8f4','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2025-04-12 20:23:38',44,'EXECUTED','9:d48d6da5c6ccf667807f633fe489ce88','addColumn tableName=USER_ENTITY','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2025-04-12 20:23:38',45,'EXECUTED','9:dde36f7973e80d71fceee683bc5d2951','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2025-04-12 20:23:38',46,'EXECUTED','9:b855e9b0a406b34fa323235a0cf4f640','customChange','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2025-04-12 20:23:38',47,'MARK_RAN','9:51abbacd7b416c50c4421a8cabf7927e','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2025-04-12 20:23:39',48,'EXECUTED','9:bdc99e567b3398bac83263d375aad143','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2025-04-12 20:23:39',49,'EXECUTED','9:d198654156881c46bfba39abd7769e69','addColumn tableName=REALM','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2025-04-12 20:23:39',50,'EXECUTED','9:cfdd8736332ccdd72c5256ccb42335db','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2025-04-12 20:23:39',51,'EXECUTED','9:7c84de3d9bd84d7f077607c1a4dcb714','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2025-04-12 20:23:40',52,'EXECUTED','9:5a6bb36cbefb6a9d6928452c0852af2d','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2025-04-12 20:23:40',53,'EXECUTED','9:8f23e334dbc59f82e0a328373ca6ced0','update tableName=REALM','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2025-04-12 20:23:40',54,'EXECUTED','9:9156214268f09d970cdf0e1564d866af','update tableName=CLIENT','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2025-04-12 20:23:40',55,'EXECUTED','9:db806613b1ed154826c02610b7dbdf74','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2025-04-12 20:23:40',56,'EXECUTED','9:229a041fb72d5beac76bb94a5fa709de','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2025-04-12 20:23:40',57,'EXECUTED','9:079899dade9c1e683f26b2aa9ca6ff04','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2025-04-12 20:23:41',58,'EXECUTED','9:139b79bcbbfe903bb1c2d2a4dbf001d9','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2025-04-12 20:23:42',59,'EXECUTED','9:b55738ad889860c625ba2bf483495a04','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2025-04-12 20:23:42',60,'EXECUTED','9:e0057eac39aa8fc8e09ac6cfa4ae15fe','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2025-04-12 20:23:42',61,'EXECUTED','9:42a33806f3a0443fe0e7feeec821326c','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2025-04-12 20:23:42',62,'EXECUTED','9:9968206fca46eecc1f51db9c024bfe56','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2025-04-12 20:23:42',63,'EXECUTED','9:92143a6daea0a3f3b8f598c97ce55c3d','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2025-04-12 20:23:42',64,'EXECUTED','9:82bab26a27195d889fb0429003b18f40','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2025-04-12 20:23:42',65,'EXECUTED','9:e590c88ddc0b38b0ae4249bbfcb5abc3','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2025-04-12 20:23:42',66,'EXECUTED','9:5c1f475536118dbdc38d5d7977950cc0','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2025-04-12 20:23:42',67,'EXECUTED','9:e7c9f5f9c4d67ccbbcc215440c718a17','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2025-04-12 20:23:42',68,'EXECUTED','9:88e0bfdda924690d6f4e430c53447dd5','addColumn tableName=REALM','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2025-04-12 20:23:42',69,'EXECUTED','9:f53177f137e1c46b6a88c59ec1cb5218','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2025-04-12 20:23:42',70,'EXECUTED','9:a74d33da4dc42a37ec27121580d1459f','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2025-04-12 20:23:42',71,'EXECUTED','9:fd4ade7b90c3b67fae0bfcfcb42dfb5f','addColumn tableName=RESOURCE_SERVER','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2025-04-12 20:23:42',72,'EXECUTED','9:aa072ad090bbba210d8f18781b8cebf4','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2025-04-12 20:23:42',73,'EXECUTED','9:1ae6be29bab7c2aa376f6983b932be37','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2025-04-12 20:23:42',74,'MARK_RAN','9:14706f286953fc9a25286dbd8fb30d97','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2025-04-12 20:23:43',75,'EXECUTED','9:2b9cc12779be32c5b40e2e67711a218b','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2025-04-12 20:23:43',76,'EXECUTED','9:91fa186ce7a5af127a2d7a91ee083cc5','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2025-04-12 20:23:43',77,'EXECUTED','9:6335e5c94e83a2639ccd68dd24e2e5ad','addColumn tableName=CLIENT','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2025-04-12 20:23:43',78,'MARK_RAN','9:6bdb5658951e028bfe16fa0a8228b530','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2025-04-12 20:23:43',79,'EXECUTED','9:d5bc15a64117ccad481ce8792d4c608f','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2025-04-12 20:23:43',80,'MARK_RAN','9:077cba51999515f4d3e7ad5619ab592c','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2025-04-12 20:23:43',81,'EXECUTED','9:be969f08a163bf47c6b9e9ead8ac2afb','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2025-04-12 20:23:43',82,'MARK_RAN','9:6d3bb4408ba5a72f39bd8a0b301ec6e3','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2025-04-12 20:23:43',83,'EXECUTED','9:966bda61e46bebf3cc39518fbed52fa7','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2025-04-12 20:23:43',84,'MARK_RAN','9:8dcac7bdf7378e7d823cdfddebf72fda','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2025-04-12 20:23:43',85,'EXECUTED','9:7d93d602352a30c0c317e6a609b56599','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2025-04-12 20:23:43',86,'EXECUTED','9:71c5969e6cdd8d7b6f47cebc86d37627','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2025-04-12 20:23:43',87,'EXECUTED','9:a9ba7d47f065f041b7da856a81762021','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2025-04-12 20:23:43',88,'EXECUTED','9:fffabce2bc01e1a8f5110d5278500065','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2025-04-12 20:23:43',89,'EXECUTED','9:fa8a5b5445e3857f4b010bafb5009957','addColumn tableName=REALM; customChange','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2025-04-12 20:23:43',90,'EXECUTED','9:67ac3241df9a8582d591c5ed87125f39','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2025-04-12 20:23:43',91,'EXECUTED','9:ad1194d66c937e3ffc82386c050ba089','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2025-04-12 20:23:43',92,'EXECUTED','9:d9be619d94af5a2f5d07b9f003543b91','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2025-04-12 20:23:43',93,'MARK_RAN','9:544d201116a0fcc5a5da0925fbbc3bde','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2025-04-12 20:23:43',94,'EXECUTED','9:43c0c1055b6761b4b3e89de76d612ccf','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2025-04-12 20:23:43',95,'MARK_RAN','9:8bd711fd0330f4fe980494ca43ab1139','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2025-04-12 20:23:43',96,'EXECUTED','9:e07d2bc0970c348bb06fb63b1f82ddbf','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2025-04-12 20:23:44',97,'EXECUTED','9:24fb8611e97f29989bea412aa38d12b7','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2025-04-12 20:23:44',98,'MARK_RAN','9:259f89014ce2506ee84740cbf7163aa7','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2025-04-12 20:23:44',99,'MARK_RAN','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2025-04-12 20:23:44',100,'EXECUTED','9:bd2bd0fc7768cf0845ac96a8786fa735','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2025-04-12 20:23:44',101,'MARK_RAN','9:d3d977031d431db16e2c181ce49d73e9','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2025-04-12 20:23:44',102,'EXECUTED','9:0b305d8d1277f3a89a0a53a659ad274c','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2025-04-12 20:23:44',103,'EXECUTED','9:2c374ad2cdfe20e2905a84c8fac48460','customChange','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2025-04-12 20:23:44',104,'EXECUTED','9:47a760639ac597360a8219f5b768b4de','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('17.0.0-9562','keycloak','META-INF/jpa-changelog-17.0.0.xml','2025-04-12 20:23:44',105,'EXECUTED','9:a6272f0576727dd8cad2522335f5d99e','createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('18.0.0-10625-IDX_ADMIN_EVENT_TIME','keycloak','META-INF/jpa-changelog-18.0.0.xml','2025-04-12 20:23:44',106,'EXECUTED','9:015479dbd691d9cc8669282f4828c41d','createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('18.0.15-30992-index-consent','keycloak','META-INF/jpa-changelog-18.0.15.xml','2025-04-12 20:23:44',107,'EXECUTED','9:80071ede7a05604b1f4906f3bf3b00f0','createIndex indexName=IDX_USCONSENT_SCOPE_ID, tableName=USER_CONSENT_CLIENT_SCOPE','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('19.0.0-10135','keycloak','META-INF/jpa-changelog-19.0.0.xml','2025-04-12 20:23:44',108,'EXECUTED','9:9518e495fdd22f78ad6425cc30630221','customChange','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('20.0.0-12964-supported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2025-04-12 20:23:44',109,'EXECUTED','9:f2e1331a71e0aa85e5608fe42f7f681c','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('20.0.0-12964-unsupported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2025-04-12 20:23:44',110,'MARK_RAN','9:1a6fcaa85e20bdeae0a9ce49b41946a5','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('client-attributes-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-20.0.0.xml','2025-04-12 20:23:44',111,'EXECUTED','9:3f332e13e90739ed0c35b0b25b7822ca','addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('21.0.2-17277','keycloak','META-INF/jpa-changelog-21.0.2.xml','2025-04-12 20:23:44',112,'EXECUTED','9:7ee1f7a3fb8f5588f171fb9a6ab623c0','customChange','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('21.1.0-19404','keycloak','META-INF/jpa-changelog-21.1.0.xml','2025-04-12 20:23:44',113,'EXECUTED','9:3d7e830b52f33676b9d64f7f2b2ea634','modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('21.1.0-19404-2','keycloak','META-INF/jpa-changelog-21.1.0.xml','2025-04-12 20:23:44',114,'MARK_RAN','9:627d032e3ef2c06c0e1f73d2ae25c26c','addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('22.0.0-17484-updated','keycloak','META-INF/jpa-changelog-22.0.0.xml','2025-04-12 20:23:44',115,'EXECUTED','9:90af0bfd30cafc17b9f4d6eccd92b8b3','customChange','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('22.0.5-24031','keycloak','META-INF/jpa-changelog-22.0.0.xml','2025-04-12 20:23:44',116,'MARK_RAN','9:a60d2d7b315ec2d3eba9e2f145f9df28','customChange','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('23.0.0-12062','keycloak','META-INF/jpa-changelog-23.0.0.xml','2025-04-12 20:23:44',117,'EXECUTED','9:2168fbe728fec46ae9baf15bf80927b8','addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('23.0.0-17258','keycloak','META-INF/jpa-changelog-23.0.0.xml','2025-04-12 20:23:44',118,'EXECUTED','9:36506d679a83bbfda85a27ea1864dca8','addColumn tableName=EVENT_ENTITY','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('24.0.0-9758','keycloak','META-INF/jpa-changelog-24.0.0.xml','2025-04-12 20:23:44',119,'EXECUTED','9:502c557a5189f600f0f445a9b49ebbce','addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('24.0.0-9758-2','keycloak','META-INF/jpa-changelog-24.0.0.xml','2025-04-12 20:23:44',120,'EXECUTED','9:bf0fdee10afdf597a987adbf291db7b2','customChange','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('24.0.0-26618-drop-index-if-present','keycloak','META-INF/jpa-changelog-24.0.0.xml','2025-04-12 20:23:44',121,'EXECUTED','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('24.0.0-26618-reindex','keycloak','META-INF/jpa-changelog-24.0.0.xml','2025-04-12 20:23:44',122,'EXECUTED','9:bd2bd0fc7768cf0845ac96a8786fa735','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('24.0.2-27228','keycloak','META-INF/jpa-changelog-24.0.2.xml','2025-04-12 20:23:44',123,'EXECUTED','9:eaee11f6b8aa25d2cc6a84fb86fc6238','customChange','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('24.0.2-27967-drop-index-if-present','keycloak','META-INF/jpa-changelog-24.0.2.xml','2025-04-12 20:23:44',124,'MARK_RAN','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('24.0.2-27967-reindex','keycloak','META-INF/jpa-changelog-24.0.2.xml','2025-04-12 20:23:44',125,'MARK_RAN','9:d3d977031d431db16e2c181ce49d73e9','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('25.0.0-28265-tables','keycloak','META-INF/jpa-changelog-25.0.0.xml','2025-04-12 20:23:44',126,'EXECUTED','9:deda2df035df23388af95bbd36c17cef','addColumn tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_CLIENT_SESSION','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('25.0.0-28265-index-creation','keycloak','META-INF/jpa-changelog-25.0.0.xml','2025-04-12 20:23:44',127,'EXECUTED','9:3e96709818458ae49f3c679ae58d263a','createIndex indexName=IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('25.0.0-28265-index-cleanup-uss-createdon','keycloak','META-INF/jpa-changelog-25.0.0.xml','2025-04-12 20:23:44',128,'EXECUTED','9:78ab4fc129ed5e8265dbcc3485fba92f','dropIndex indexName=IDX_OFFLINE_USS_CREATEDON, tableName=OFFLINE_USER_SESSION','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('25.0.0-28265-index-cleanup-uss-preload','keycloak','META-INF/jpa-changelog-25.0.0.xml','2025-04-12 20:23:44',129,'EXECUTED','9:de5f7c1f7e10994ed8b62e621d20eaab','dropIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('25.0.0-28265-index-cleanup-uss-by-usersess','keycloak','META-INF/jpa-changelog-25.0.0.xml','2025-04-12 20:23:44',130,'EXECUTED','9:6eee220d024e38e89c799417ec33667f','dropIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('25.0.0-28265-index-cleanup-css-preload','keycloak','META-INF/jpa-changelog-25.0.0.xml','2025-04-12 20:23:44',131,'EXECUTED','9:5411d2fb2891d3e8d63ddb55dfa3c0c9','dropIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('25.0.0-28265-index-2-mysql','keycloak','META-INF/jpa-changelog-25.0.0.xml','2025-04-12 20:23:44',132,'EXECUTED','9:b7ef76036d3126bb83c2423bf4d449d6','createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('25.0.0-28265-index-2-not-mysql','keycloak','META-INF/jpa-changelog-25.0.0.xml','2025-04-12 20:23:44',133,'MARK_RAN','9:23396cf51ab8bc1ae6f0cac7f9f6fcf7','createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('25.0.0-org','keycloak','META-INF/jpa-changelog-25.0.0.xml','2025-04-12 20:23:45',134,'EXECUTED','9:5c859965c2c9b9c72136c360649af157','createTable tableName=ORG; addUniqueConstraint constraintName=UK_ORG_NAME, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_GROUP, tableName=ORG; createTable tableName=ORG_DOMAIN','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('unique-consentuser','keycloak','META-INF/jpa-changelog-25.0.0.xml','2025-04-12 20:23:45',135,'MARK_RAN','9:5857626a2ea8767e9a6c66bf3a2cb32f','customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('unique-consentuser-mysql','keycloak','META-INF/jpa-changelog-25.0.0.xml','2025-04-12 20:23:45',136,'EXECUTED','9:b79478aad5adaa1bc428e31563f55e8e','customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('25.0.0-28861-index-creation','keycloak','META-INF/jpa-changelog-25.0.0.xml','2025-04-12 20:23:45',137,'EXECUTED','9:b9acb58ac958d9ada0fe12a5d4794ab1','createIndex indexName=IDX_PERM_TICKET_REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; createIndex indexName=IDX_PERM_TICKET_OWNER, tableName=RESOURCE_SERVER_PERM_TICKET','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('26.0.0-org-alias','keycloak','META-INF/jpa-changelog-26.0.0.xml','2025-04-12 20:23:45',138,'EXECUTED','9:6ef7d63e4412b3c2d66ed179159886a4','addColumn tableName=ORG; update tableName=ORG; addNotNullConstraint columnName=ALIAS, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_ALIAS, tableName=ORG','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('26.0.0-org-group','keycloak','META-INF/jpa-changelog-26.0.0.xml','2025-04-12 20:23:45',139,'EXECUTED','9:da8e8087d80ef2ace4f89d8c5b9ca223','addColumn tableName=KEYCLOAK_GROUP; update tableName=KEYCLOAK_GROUP; addNotNullConstraint columnName=TYPE, tableName=KEYCLOAK_GROUP; customChange','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('26.0.0-org-indexes','keycloak','META-INF/jpa-changelog-26.0.0.xml','2025-04-12 20:23:45',140,'EXECUTED','9:79b05dcd610a8c7f25ec05135eec0857','createIndex indexName=IDX_ORG_DOMAIN_ORG_ID, tableName=ORG_DOMAIN','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('26.0.0-org-group-membership','keycloak','META-INF/jpa-changelog-26.0.0.xml','2025-04-12 20:23:45',141,'EXECUTED','9:a6ace2ce583a421d89b01ba2a28dc2d4','addColumn tableName=USER_GROUP_MEMBERSHIP; update tableName=USER_GROUP_MEMBERSHIP; addNotNullConstraint columnName=MEMBERSHIP_TYPE, tableName=USER_GROUP_MEMBERSHIP','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('31296-persist-revoked-access-tokens','keycloak','META-INF/jpa-changelog-26.0.0.xml','2025-04-12 20:23:45',142,'EXECUTED','9:64ef94489d42a358e8304b0e245f0ed4','createTable tableName=REVOKED_TOKEN; addPrimaryKey constraintName=CONSTRAINT_RT, tableName=REVOKED_TOKEN','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('31725-index-persist-revoked-access-tokens','keycloak','META-INF/jpa-changelog-26.0.0.xml','2025-04-12 20:23:45',143,'EXECUTED','9:b994246ec2bf7c94da881e1d28782c7b','createIndex indexName=IDX_REV_TOKEN_ON_EXPIRE, tableName=REVOKED_TOKEN','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('26.0.0-idps-for-login','keycloak','META-INF/jpa-changelog-26.0.0.xml','2025-04-12 20:23:45',144,'EXECUTED','9:51f5fffadf986983d4bd59582c6c1604','addColumn tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_REALM_ORG, tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_FOR_LOGIN, tableName=IDENTITY_PROVIDER; customChange','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('26.0.0-32583-drop-redundant-index-on-client-session','keycloak','META-INF/jpa-changelog-26.0.0.xml','2025-04-12 20:23:45',145,'EXECUTED','9:24972d83bf27317a055d234187bb4af9','dropIndex indexName=IDX_US_SESS_ID_ON_CL_SESS, tableName=OFFLINE_CLIENT_SESSION','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('26.0.0.32582-remove-tables-user-session-user-session-note-and-client-session','keycloak','META-INF/jpa-changelog-26.0.0.xml','2025-04-12 20:23:45',146,'EXECUTED','9:febdc0f47f2ed241c59e60f58c3ceea5','dropTable tableName=CLIENT_SESSION_ROLE; dropTable tableName=CLIENT_SESSION_NOTE; dropTable tableName=CLIENT_SESSION_PROT_MAPPER; dropTable tableName=CLIENT_SESSION_AUTH_STATUS; dropTable tableName=CLIENT_USER_SESSION_NOTE; dropTable tableName=CLI...','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('26.0.0-33201-org-redirect-url','keycloak','META-INF/jpa-changelog-26.0.0.xml','2025-04-12 20:23:45',147,'EXECUTED','9:4d0e22b0ac68ebe9794fa9cb752ea660','addColumn tableName=ORG','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('29399-jdbc-ping-default','keycloak','META-INF/jpa-changelog-26.1.0.xml','2025-04-12 20:23:45',148,'EXECUTED','9:007dbe99d7203fca403b89d4edfdf21e','createTable tableName=JGROUPS_PING; addPrimaryKey constraintName=CONSTRAINT_JGROUPS_PING, tableName=JGROUPS_PING','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('26.1.0-34013','keycloak','META-INF/jpa-changelog-26.1.0.xml','2025-04-12 20:23:45',149,'EXECUTED','9:e6b686a15759aef99a6d758a5c4c6a26','addColumn tableName=ADMIN_EVENT_ENTITY','',NULL,'4.29.1',NULL,NULL,'4489405557'),
('26.1.0-34380','keycloak','META-INF/jpa-changelog-26.1.0.xml','2025-04-12 20:23:45',150,'EXECUTED','9:ac8b9edb7c2b6c17a1c7a11fcf5ccf01','dropTable tableName=USERNAME_LOGIN_FAILURE','',NULL,'4.29.1',NULL,NULL,'4489405557');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` tinyint(4) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES
(1,0,NULL,NULL),
(1000,0,NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES
('4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','1739edec-8d4a-4330-ac98-c67390be1091',0),
('4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','1894c44f-4305-4208-9fcf-4af8d5c041d5',1),
('4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','32afa067-3577-40f2-a76d-d32cd73bf361',0),
('4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','64b3295a-5f99-4c9a-bce4-31ceb0d272e7',1),
('4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','6747ad30-9cd1-4b70-990a-4af23e29e153',1),
('4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','b7c6002a-3960-408a-9949-337715e0e406',0),
('4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','d28afb2d-aee5-4aaf-b62e-4e02a89dfdf5',1),
('4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','d77698a7-4c19-4b42-92d7-b3fecf8dda46',1),
('4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','df8e24fb-c092-4e3f-8a7c-d0e9c9100716',1),
('4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','e29de210-7ce6-49fd-a200-6e78d1f0b044',0),
('4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','e323ef15-de0b-4a41-acbb-5a3b9324f572',0),
('4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','e3e88111-c498-4b28-b739-0e92903f8d75',1),
('4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','fbeead1c-cd5a-48c9-b28c-78b773462c25',1),
('b1a77210-c7ee-43b5-b50d-620366c5ffd4','2f9efd55-e428-4b82-a7a0-ade74a1cdb93',1),
('b1a77210-c7ee-43b5-b50d-620366c5ffd4','37946409-175b-486f-a55f-959c32c28d68',0),
('b1a77210-c7ee-43b5-b50d-620366c5ffd4','3873c462-bf8d-473c-8e66-d645ecffe77b',1),
('b1a77210-c7ee-43b5-b50d-620366c5ffd4','4acb56d8-f3d6-4df3-9142-460514615d73',0),
('b1a77210-c7ee-43b5-b50d-620366c5ffd4','70a3f165-a7db-4f60-b53c-2350a70d933d',1),
('b1a77210-c7ee-43b5-b50d-620366c5ffd4','7136d1d8-9596-4a7e-9843-d6b7fb0b7b19',1),
('b1a77210-c7ee-43b5-b50d-620366c5ffd4','7948c893-a9da-413f-90c8-966d9eb01323',1),
('b1a77210-c7ee-43b5-b50d-620366c5ffd4','9953f399-6e23-48db-96b3-10b8aff0a7e6',1),
('b1a77210-c7ee-43b5-b50d-620366c5ffd4','a5ecba62-5dc4-4582-af48-a952c3cbc778',1),
('b1a77210-c7ee-43b5-b50d-620366c5ffd4','ab578b8b-a434-4cfd-ae4a-4529f9cad8af',0),
('b1a77210-c7ee-43b5-b50d-620366c5ffd4','d134c583-e475-4ae8-a973-2042540036d5',0),
('b1a77210-c7ee-43b5-b50d-620366c5ffd4','d661f2a0-295d-4533-8034-1ae27d7c47a3',0),
('b1a77210-c7ee-43b5-b50d-620366c5ffd4','d6cb0d13-02cb-4c1e-b889-ac27edb55f24',1);
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
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
  `DETAILS_JSON_LONG_VALUE` longtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` varchar(2024) DEFAULT NULL,
  `LONG_VALUE_HASH` binary(64) DEFAULT NULL,
  `LONG_VALUE_HASH_LOWER_CASE` binary(64) DEFAULT NULL,
  `LONG_VALUE` longtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`),
  KEY `FED_USER_ATTR_LONG_VALUES` (`LONG_VALUE_HASH`,`NAME`),
  KEY `FED_USER_ATTR_LONG_VALUES_LOWER_CASE` (`LONG_VALUE_HASH_LOWER_CASE`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  KEY `IDX_GROUP_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` tinyint(4) NOT NULL DEFAULT '0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` tinyint(4) NOT NULL DEFAULT '0',
  `AUTHENTICATE_BY_DEFAULT` tinyint(4) NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` tinyint(4) NOT NULL DEFAULT '1',
  `TRUST_EMAIL` tinyint(4) NOT NULL DEFAULT '0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` tinyint(4) NOT NULL DEFAULT '0',
  `ORGANIZATION_ID` varchar(255) DEFAULT NULL,
  `HIDE_ON_LOGIN` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  KEY `IDX_IDP_REALM_ORG` (`REALM_ID`,`ORGANIZATION_ID`),
  KEY `IDX_IDP_FOR_LOGIN` (`REALM_ID`,`ENABLED`,`LINK_ONLY`,`HIDE_ON_LOGIN`,`ORGANIZATION_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JGROUPS_PING`
--

DROP TABLE IF EXISTS `JGROUPS_PING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `JGROUPS_PING` (
  `address` varchar(200) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `cluster_name` varchar(200) NOT NULL,
  `ip` varchar(200) NOT NULL,
  `coord` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JGROUPS_PING`
--

LOCK TABLES `JGROUPS_PING` WRITE;
/*!40000 ALTER TABLE `JGROUPS_PING` DISABLE KEYS */;
/*!40000 ALTER TABLE `JGROUPS_PING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `TYPE` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_GROUP` VALUES
('8a0c3ac7-0b54-4f8e-ba89-a28fd0d85e87','custommer',' ','b1a77210-c7ee-43b5-b50d-620366c5ffd4',0);
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` tinyint(4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES
('07a973d6-f34d-438e-ba0d-457f32f11b7c','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',1,'${role_query-groups}','query-groups','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',NULL),
('092f076f-6f12-4998-8cfa-5934aa3cd73c','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',1,'${role_manage-events}','manage-events','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',NULL),
('0a0a9835-d8e8-4ab3-a941-bfbe6bcb08fd','a24b8455-d8ea-4265-8f91-b1b93a316dfa',1,'${role_manage-clients}','manage-clients','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a24b8455-d8ea-4265-8f91-b1b93a316dfa',NULL),
('0bc3eb49-fd69-403b-bd64-10cba49f97bc','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',1,'${role_manage-identity-providers}','manage-identity-providers','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',NULL),
('0ef8a022-cc9a-48a3-ab9c-fe3eb3411863','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',1,'${role_manage-realm}','manage-realm','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',NULL),
('103793d3-aad2-4dbb-bd9e-eadfd654a277','a24b8455-d8ea-4265-8f91-b1b93a316dfa',1,'${role_realm-admin}','realm-admin','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a24b8455-d8ea-4265-8f91-b1b93a316dfa',NULL),
('1285e7cf-bb8c-468d-b4a7-a0b1bc623143','a24b8455-d8ea-4265-8f91-b1b93a316dfa',1,'${role_query-users}','query-users','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a24b8455-d8ea-4265-8f91-b1b93a316dfa',NULL),
('1529843a-dc30-4676-a80e-53c7d79af538','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',0,'${role_admin}','admin','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',NULL,NULL),
('16971ddf-226f-41cf-a880-1cf8c17b8e82','623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad',1,'${role_view-groups}','view-groups','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad',NULL),
('1e873e27-26cf-4a9e-9466-6d96f9304cd7','fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6',1,'${role_view-applications}','view-applications','b1a77210-c7ee-43b5-b50d-620366c5ffd4','fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6',NULL),
('2085d621-eedb-4b8d-b737-8a5e679c9020','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',0,'${role_default-roles}','default-roles-master','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',NULL,NULL),
('2588a48d-b813-454e-9f02-fbf8c8e793a2','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',1,'${role_create-client}','create-client','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',NULL),
('301f8206-3e5e-4d68-9b43-2d99627cac7c','a24b8455-d8ea-4265-8f91-b1b93a316dfa',1,'${role_view-realm}','view-realm','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a24b8455-d8ea-4265-8f91-b1b93a316dfa',NULL),
('31db89a2-7400-45ea-8170-90ca6aaed992','a24b8455-d8ea-4265-8f91-b1b93a316dfa',1,'${role_manage-realm}','manage-realm','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a24b8455-d8ea-4265-8f91-b1b93a316dfa',NULL),
('33d67b6e-53d7-4309-ab82-e0ca59ecb6f1','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',1,'${role_query-clients}','query-clients','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',NULL),
('3538ef66-4b69-4186-9b05-e67c903d38d8','623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad',1,'${role_view-applications}','view-applications','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad',NULL),
('35d81fd6-4951-460e-8d11-bbb954ffd4ff','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',1,'${role_view-realm}','view-realm','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',NULL),
('39abaf7d-ca9d-46c6-a974-180eb852993c','a24b8455-d8ea-4265-8f91-b1b93a316dfa',1,'${role_query-realms}','query-realms','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a24b8455-d8ea-4265-8f91-b1b93a316dfa',NULL),
('3cda6b5a-f800-4e6c-b409-8243c7d4646c','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',1,'${role_manage-authorization}','manage-authorization','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',NULL),
('40a1524b-93e0-4e8f-80ea-ef475eba87bb','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',1,'${role_manage-identity-providers}','manage-identity-providers','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',NULL),
('4416fc71-bc5b-4170-8bbc-ba6a15731cd1','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',0,'${role_offline-access}','offline_access','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',NULL,NULL),
('49e7d4ea-641c-4b33-ac69-16ade211c009','a24b8455-d8ea-4265-8f91-b1b93a316dfa',1,'${role_manage-authorization}','manage-authorization','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a24b8455-d8ea-4265-8f91-b1b93a316dfa',NULL),
('52f5bbd7-1f18-4233-a9c2-6622a6c50d5a','a24b8455-d8ea-4265-8f91-b1b93a316dfa',1,'${role_create-client}','create-client','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a24b8455-d8ea-4265-8f91-b1b93a316dfa',NULL),
('559552a5-585d-4c69-b892-71f5d4da2f18','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',1,'${role_view-users}','view-users','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',NULL),
('6006296c-09ed-4d47-bbdc-1d8cc8dbc62d','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',0,'${role_uma_authorization}','uma_authorization','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',NULL,NULL),
('65a0b217-80d2-4134-abc3-c034e34ad2e7','623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad',1,'${role_delete-account}','delete-account','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad',NULL),
('6d90e606-43e4-4540-b5e4-c555b7758e77','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',1,'${role_manage-authorization}','manage-authorization','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',NULL),
('70acd12a-6526-4461-94bf-ede86b114c10','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',1,'${role_view-events}','view-events','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',NULL),
('74a6f444-f972-4c1f-a7ad-f369375df2fa','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',0,'${role_create-realm}','create-realm','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',NULL,NULL),
('74da31e9-a7e2-4090-b8dd-f675df60f30b','623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad',1,'${role_manage-account}','manage-account','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad',NULL),
('75d4ea1c-5d31-4c4a-bbb5-3327ad0b12f6','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',1,'${role_query-realms}','query-realms','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',NULL),
('78340209-e663-44e6-9897-7ca22787da07','623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad',1,'${role_manage-consent}','manage-consent','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad',NULL),
('7ac7ef17-47cf-4f86-a0db-4a440497d08f','a24b8455-d8ea-4265-8f91-b1b93a316dfa',1,'${role_manage-users}','manage-users','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a24b8455-d8ea-4265-8f91-b1b93a316dfa',NULL),
('7f932d34-56cd-460a-9b19-2a305fc2eea6','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',1,'${role_manage-clients}','manage-clients','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',NULL),
('841a6a82-e388-43b5-a94e-f76df662fd6e','fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6',1,'${role_view-profile}','view-profile','b1a77210-c7ee-43b5-b50d-620366c5ffd4','fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6',NULL),
('8e1b234a-e7c3-4aef-937d-3357a81dcf8d','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',1,'${role_query-clients}','query-clients','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',NULL),
('92389f6b-514b-42c8-9a60-4f3987625570','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',1,'${role_view-events}','view-events','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',NULL),
('9271f8bd-2a0d-45aa-8621-f29db4a470a3','623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad',1,'${role_view-profile}','view-profile','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad',NULL),
('95e4fa49-b485-4654-b211-5781e575cfb0','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',1,'${role_view-identity-providers}','view-identity-providers','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',NULL),
('96559c6e-a16e-458d-86ec-9c7189da58c2','fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6',1,'${role_view-consent}','view-consent','b1a77210-c7ee-43b5-b50d-620366c5ffd4','fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6',NULL),
('9679a38a-4112-485f-b442-0075c7c3978d','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',1,'${role_impersonation}','impersonation','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',NULL),
('990a3d5d-2eba-463c-9aca-7e86edde26bb','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',1,'${role_query-users}','query-users','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',NULL),
('9afa08a5-f590-4e1b-97ec-47cb0f4aca86','fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6',1,'${role_manage-consent}','manage-consent','b1a77210-c7ee-43b5-b50d-620366c5ffd4','fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6',NULL),
('9b71a7c0-6cea-441b-934c-dcbe8e578c12','a24b8455-d8ea-4265-8f91-b1b93a316dfa',1,'${role_query-clients}','query-clients','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a24b8455-d8ea-4265-8f91-b1b93a316dfa',NULL),
('a505c039-db07-4ce7-b040-3ed1c145cf2f','b1a77210-c7ee-43b5-b50d-620366c5ffd4',0,'','ADMINISTRATOR','b1a77210-c7ee-43b5-b50d-620366c5ffd4',NULL,NULL),
('a6d6de7f-7311-4f2f-9f4d-f74f486fc638','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',1,'${role_manage-realm}','manage-realm','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',NULL),
('a92fbc41-55dd-40e5-af65-ba2dc8540e46','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',1,'${role_view-users}','view-users','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',NULL),
('aa8f7f18-a298-475c-8196-43f546f13600','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',1,'${role_manage-users}','manage-users','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',NULL),
('ae0f12a4-59cd-4b5e-a49e-57a79b359eb8','fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6',1,'${role_delete-account}','delete-account','b1a77210-c7ee-43b5-b50d-620366c5ffd4','fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6',NULL),
('b474edb6-6404-43e7-ae7d-3c3f8597309c','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',1,'${role_view-authorization}','view-authorization','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',NULL),
('b73bbd7c-04a9-4a8a-896e-3f8c58af41f1','b1a77210-c7ee-43b5-b50d-620366c5ffd4',0,'${role_offline-access}','offline_access','b1a77210-c7ee-43b5-b50d-620366c5ffd4',NULL,NULL),
('b76384ae-67cb-4371-9517-bd8b4c52edbb','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',1,'${role_view-realm}','view-realm','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',NULL),
('b83b0c53-8314-4d78-a92c-8e159cdc36ad','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',1,'${role_manage-users}','manage-users','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',NULL),
('b9601a95-d7ad-48b5-b3eb-0fc46eb45f49','09b71159-4aa6-446f-852b-ead526fb5577',1,'${role_read-token}','read-token','b1a77210-c7ee-43b5-b50d-620366c5ffd4','09b71159-4aa6-446f-852b-ead526fb5577',NULL),
('bbead62d-08c1-46fa-afea-5e7e2583b352','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',1,'${role_query-users}','query-users','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',NULL),
('bcf4e92f-37f3-4efc-b894-8b4e103ea06c','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',1,'${role_manage-events}','manage-events','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',NULL),
('bd0497ed-ef4f-477b-98be-7c191de6005b','a24b8455-d8ea-4265-8f91-b1b93a316dfa',1,'${role_view-authorization}','view-authorization','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a24b8455-d8ea-4265-8f91-b1b93a316dfa',NULL),
('bd04d7d4-4018-436a-a3f3-c0d616bea5b0','b1a77210-c7ee-43b5-b50d-620366c5ffd4',0,'','CUSTOMMER','b1a77210-c7ee-43b5-b50d-620366c5ffd4',NULL,NULL),
('bdf09ded-7a2f-48db-a785-f4a08e1e886f','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',1,'${role_view-authorization}','view-authorization','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',NULL),
('c039fffe-e9a7-48fa-ba3a-96b9bbc88a43','a24b8455-d8ea-4265-8f91-b1b93a316dfa',1,'${role_view-clients}','view-clients','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a24b8455-d8ea-4265-8f91-b1b93a316dfa',NULL),
('c112fcf9-8bc0-4a7a-980e-b81b2dd993fa','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',1,'${role_query-realms}','query-realms','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',NULL),
('c50dfbaf-934b-4c85-b5f7-26601953a16b','fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6',1,'${role_manage-account}','manage-account','b1a77210-c7ee-43b5-b50d-620366c5ffd4','fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6',NULL),
('c54ab7a4-800d-4653-b8d4-8698e99dd2ce','fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6',1,'${role_manage-account-links}','manage-account-links','b1a77210-c7ee-43b5-b50d-620366c5ffd4','fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6',NULL),
('cc3ba7cc-afc6-45d0-b0e2-022acef8d075','fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6',1,'${role_view-groups}','view-groups','b1a77210-c7ee-43b5-b50d-620366c5ffd4','fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6',NULL),
('d01ef694-8862-47fe-9ffc-dccdc019e53f','a24b8455-d8ea-4265-8f91-b1b93a316dfa',1,'${role_manage-identity-providers}','manage-identity-providers','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a24b8455-d8ea-4265-8f91-b1b93a316dfa',NULL),
('d389be8b-6f69-4826-9bc2-5096fed86eae','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',1,'${role_impersonation}','impersonation','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',NULL),
('d4eb4ff6-d173-428a-9ef9-65a0ef61f2cb','a24b8455-d8ea-4265-8f91-b1b93a316dfa',1,'${role_view-events}','view-events','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a24b8455-d8ea-4265-8f91-b1b93a316dfa',NULL),
('d559265c-99ac-4ce9-ae00-3b5cf5ba5842','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',1,'${role_view-clients}','view-clients','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',NULL),
('d66d287d-8b39-476f-b4f9-8a0976ee2618','b1a77210-c7ee-43b5-b50d-620366c5ffd4',0,'${role_default-roles}','default-roles-qualite-logicielle','b1a77210-c7ee-43b5-b50d-620366c5ffd4',NULL,NULL),
('d79f97c6-9895-412c-a6a1-35ffe1aeb0f5','b1a77210-c7ee-43b5-b50d-620366c5ffd4',0,'${role_uma_authorization}','uma_authorization','b1a77210-c7ee-43b5-b50d-620366c5ffd4',NULL,NULL),
('dad006ba-a065-4e4e-96dc-e2d58561ece9','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',1,'${role_create-client}','create-client','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',NULL),
('ddc06e4c-3fe1-447b-9773-e6365cd9c4c7','a24b8455-d8ea-4265-8f91-b1b93a316dfa',1,'${role_manage-events}','manage-events','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a24b8455-d8ea-4265-8f91-b1b93a316dfa',NULL),
('ddc655fc-21b2-4cf2-a50e-0c4548b590b2','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',1,'${role_query-groups}','query-groups','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',NULL),
('de7e74b1-08eb-4a60-bd32-6854205bf981','a24b8455-d8ea-4265-8f91-b1b93a316dfa',1,'${role_view-users}','view-users','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a24b8455-d8ea-4265-8f91-b1b93a316dfa',NULL),
('dec5abe5-4bd3-4917-a137-3735d600a13c','a288d0a4-2c9e-4542-b484-20a8f0fbcb8d',1,'${role_read-token}','read-token','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','a288d0a4-2c9e-4542-b484-20a8f0fbcb8d',NULL),
('e4b4ff5d-cba6-4a1d-a56b-b357084d8ac5','a24b8455-d8ea-4265-8f91-b1b93a316dfa',1,'${role_impersonation}','impersonation','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a24b8455-d8ea-4265-8f91-b1b93a316dfa',NULL),
('eb7cf88d-45d0-4507-8d07-046f6505e670','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',1,'${role_manage-clients}','manage-clients','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',NULL),
('edb1d7f6-6ba8-420d-9dde-7c707304109b','a24b8455-d8ea-4265-8f91-b1b93a316dfa',1,'${role_view-identity-providers}','view-identity-providers','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a24b8455-d8ea-4265-8f91-b1b93a316dfa',NULL),
('edb39f1d-4e5f-496b-b94b-7c8500642c5b','623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad',1,'${role_view-consent}','view-consent','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad',NULL),
('f2de3dd3-20aa-4e15-b027-5468881f669d','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',1,'${role_view-clients}','view-clients','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',NULL),
('f369dd34-91f6-45e2-bbfe-f7b4a5f31b93','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',1,'${role_view-identity-providers}','view-identity-providers','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',NULL),
('fadf1ba6-b82e-4a49-80d8-bc49f5d3ad51','a24b8455-d8ea-4265-8f91-b1b93a316dfa',1,'${role_query-groups}','query-groups','b1a77210-c7ee-43b5-b50d-620366c5ffd4','a24b8455-d8ea-4265-8f91-b1b93a316dfa',NULL),
('fc076564-cf76-4a7d-acc0-46f36d9028f2','623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad',1,'${role_manage-account-links}','manage-account-links','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES
('unuoj','26.1.4',1744489426);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  `VERSION` int(11) DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
INSERT INTO `OFFLINE_CLIENT_SESSION` VALUES
('21e66eac-4736-4386-a11f-a7108665ecfb','983e49d2-9da2-4752-a0ac-17f5a724c755','0',1744491887,'{\"authMethod\":\"openid-connect\",\"notes\":{\"clientId\":\"983e49d2-9da2-4752-a0ac-17f5a724c755\",\"userSessionStartedAt\":\"1744491887\",\"iss\":\"http://localhost:8000/realms/qualite-logicielle\",\"startedAt\":\"1744491887\",\"level-of-authentication\":\"-1\"}}','local','local',0),
('d2529c2f-6dec-4a89-98bb-d101e3595a9f','921fe5ab-c238-47e1-b045-c62ae715c822','0',1744491875,'{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://localhost:8000/admin/master/console/\",\"notes\":{\"clientId\":\"921fe5ab-c238-47e1-b045-c62ae715c822\",\"iss\":\"http://localhost:8000/realms/master\",\"startedAt\":\"1744489728\",\"response_type\":\"code\",\"level-of-authentication\":\"-1\",\"code_challenge_method\":\"S256\",\"nonce\":\"dbd6c806-1fef-4c02-b5e4-0c65500e294a\",\"response_mode\":\"query\",\"scope\":\"openid\",\"userSessionStartedAt\":\"1744489728\",\"redirect_uri\":\"http://localhost:8000/admin/master/console/\",\"state\":\"637d1770-52e3-4988-b000-77d100734b90\",\"code_challenge\":\"3IST09d_MVlg9cTIUXtJSEKEqgvEr4W00y3rYGrdd60\",\"SSO_AUTH\":\"true\",\"prompt\":\"none\"}}','local','local',11);
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int(11) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int(11) NOT NULL DEFAULT '0',
  `BROKER_SESSION_ID` varchar(1024) DEFAULT NULL,
  `VERSION` int(11) DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH` (`REALM_ID`,`OFFLINE_FLAG`,`LAST_SESSION_REFRESH`),
  KEY `IDX_OFFLINE_USS_BY_BROKER_SESSION_ID` (`BROKER_SESSION_ID`(255),`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
INSERT INTO `OFFLINE_USER_SESSION` VALUES
('21e66eac-4736-4386-a11f-a7108665ecfb','e425945d-648f-4a12-8e63-bc8224b2af66','b1a77210-c7ee-43b5-b50d-620366c5ffd4',1744491887,'0','{\"ipAddress\":\"172.18.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMTguMC4xIiwib3MiOiJPdGhlciIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiT3RoZXIvVW5rbm93biIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"authenticators-completed\":\"{\\\"19b120dd-50d3-43f8-b70f-6f0bc28f9e72\\\":1744491887,\\\"6965f240-ef4a-4e7f-9ca0-ee2bd8ad199e\\\":1744491887}\"},\"state\":\"LOGGED_IN\"}',1744491887,NULL,0),
('d2529c2f-6dec-4a89-98bb-d101e3595a9f','52cd6e09-872e-4beb-9e83-88bafd95c172','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',1744489728,'0','{\"ipAddress\":\"172.18.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMTguMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiRmlyZWZveC8xMzcuMCIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1744489728\",\"authenticators-completed\":\"{\\\"7a1ea401-36e9-4586-b088-9c3f6fefe993\\\":1744489728,\\\"45da8e20-7a06-4822-92f0-886a78b5340d\\\":1744491763}\"},\"state\":\"LOGGED_IN\"}',1744491875,NULL,11);
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORG`
--

DROP TABLE IF EXISTS `ORG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORG` (
  `ID` varchar(255) NOT NULL,
  `ENABLED` tinyint(4) NOT NULL,
  `REALM_ID` varchar(255) NOT NULL,
  `GROUP_ID` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `ALIAS` varchar(255) NOT NULL,
  `REDIRECT_URL` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORG_NAME` (`REALM_ID`,`NAME`),
  UNIQUE KEY `UK_ORG_GROUP` (`GROUP_ID`),
  UNIQUE KEY `UK_ORG_ALIAS` (`REALM_ID`,`ALIAS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORG`
--

LOCK TABLES `ORG` WRITE;
/*!40000 ALTER TABLE `ORG` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORG_DOMAIN`
--

DROP TABLE IF EXISTS `ORG_DOMAIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORG_DOMAIN` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VERIFIED` tinyint(4) NOT NULL,
  `ORG_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`,`NAME`),
  KEY `IDX_ORG_DOMAIN_ORG_ID` (`ORG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORG_DOMAIN`
--

LOCK TABLES `ORG_DOMAIN` WRITE;
/*!40000 ALTER TABLE `ORG_DOMAIN` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORG_DOMAIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES
('07ec69e3-26fe-4461-97b5-e022ca1e2fc1','realm roles','openid-connect','oidc-usermodel-realm-role-mapper','983e49d2-9da2-4752-a0ac-17f5a724c755',NULL),
('0b79b38b-9ea5-45df-8779-896d5eb96fe8','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fbeead1c-cd5a-48c9-b28c-78b773462c25'),
('11b1bbe7-e0aa-4a67-8e3c-c650e0aacefb','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e29de210-7ce6-49fd-a200-6e78d1f0b044'),
('159549c4-4c4a-4210-aabf-907692ac09f6','address','openid-connect','oidc-address-mapper',NULL,'b7c6002a-3960-408a-9949-337715e0e406'),
('1bd16a42-c973-42ee-bd10-065b148a31dd','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9953f399-6e23-48db-96b3-10b8aff0a7e6'),
('1f45c01d-a529-469e-831e-2e7f3ee63b9f','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'ab578b8b-a434-4cfd-ae4a-4529f9cad8af'),
('25d5413c-614c-40fe-8399-437e027be582','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6747ad30-9cd1-4b70-990a-4af23e29e153'),
('25efeda7-9b89-4226-bc6b-a1f871a54317','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9953f399-6e23-48db-96b3-10b8aff0a7e6'),
('2f4c5b71-6f13-4075-9b0e-ab5ce286684a','locale','openid-connect','oidc-usermodel-attribute-mapper','48083b3d-ab85-42e2-b58b-e2a77ebbce41',NULL),
('3341896a-aa31-440d-9e1a-1e4b09cf11e1','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9953f399-6e23-48db-96b3-10b8aff0a7e6'),
('3458127d-772b-4cbc-8c3b-090e420134d1','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'df8e24fb-c092-4e3f-8a7c-d0e9c9100716'),
('35dd5b04-874b-42f5-984d-e21015912a1b','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fbeead1c-cd5a-48c9-b28c-78b773462c25'),
('39838dd1-1ddc-49dd-9758-3bf8698a78f1','auth_time','openid-connect','oidc-usersessionmodel-note-mapper',NULL,'64b3295a-5f99-4c9a-bce4-31ceb0d272e7'),
('3a864391-0b81-4979-9382-5d25a5c42c98','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fbeead1c-cd5a-48c9-b28c-78b773462c25'),
('3b7e70ce-dc7c-4e5e-ba55-e9a435451bc6','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'70a3f165-a7db-4f60-b53c-2350a70d933d'),
('41489abb-c0f6-4f61-a5bf-b54427f239a8','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9953f399-6e23-48db-96b3-10b8aff0a7e6'),
('44674462-2233-4c1c-b154-280276319d73','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fbeead1c-cd5a-48c9-b28c-78b773462c25'),
('44a7cde1-dd4a-43d3-91b2-36bfcd271960','Client Host','openid-connect','oidc-usersessionmodel-note-mapper',NULL,'64a91ad0-8efc-4470-8621-ed15e7e8ca5e'),
('45d83910-50f7-4f9a-84da-d7a473773661','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'37946409-175b-486f-a55f-959c32c28d68'),
('469eae7c-239f-463f-b2fd-80d1429180a6','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'70a3f165-a7db-4f60-b53c-2350a70d933d'),
('4735f265-0a45-42be-ba74-377fa2f20d17','organization','saml','saml-organization-membership-mapper',NULL,'e3e88111-c498-4b28-b739-0e92903f8d75'),
('49135a27-a6bf-4e39-b64b-1eb4ed2274e7','audience resolve','openid-connect','oidc-audience-resolve-mapper','1041f61b-95d7-40cc-b290-3c344e6ddbcc',NULL),
('4aafc591-75a9-4510-ba7a-caca47e35f18','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fbeead1c-cd5a-48c9-b28c-78b773462c25'),
('4b96a7ae-26ce-4826-9cac-e2d0765a0400','audience resolve','openid-connect','oidc-audience-resolve-mapper','a00f7cca-2385-4f44-8360-df5da1ff1878',NULL),
('5111a8ae-02c4-442b-85d6-82a2b2b42691','locale','openid-connect','oidc-usermodel-attribute-mapper','921fe5ab-c238-47e1-b045-c62ae715c822',NULL),
('520a6aa7-09e7-40b6-bf96-0d31aa847399','role list','saml','saml-role-list-mapper',NULL,'d28afb2d-aee5-4aaf-b62e-4e02a89dfdf5'),
('52f45545-5900-4501-9362-858f6c323493','sub','openid-connect','oidc-sub-mapper',NULL,'7948c893-a9da-413f-90c8-966d9eb01323'),
('57c1ff0f-3685-445a-9ee3-38a3bac04e1b','Client ID','openid-connect','oidc-usersessionmodel-note-mapper',NULL,'64a91ad0-8efc-4470-8621-ed15e7e8ca5e'),
('58ff3e6e-92e4-4277-8046-f78e1c02de95','organization','openid-connect','oidc-organization-membership-mapper',NULL,'d134c583-e475-4ae8-a973-2042540036d5'),
('5f7a978c-9736-4005-8554-e5715a477b74','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9953f399-6e23-48db-96b3-10b8aff0a7e6'),
('61e47594-3e39-4c27-8a38-cf7f1aa4df8f','acr loa level','openid-connect','oidc-acr-mapper',NULL,'7136d1d8-9596-4a7e-9843-d6b7fb0b7b19'),
('72fc59ed-fa77-465f-acb1-41ffcb9cca0b','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1739edec-8d4a-4330-ac98-c67390be1091'),
('760b1c96-57f8-4c06-8a3f-cfb6382e37ad','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9953f399-6e23-48db-96b3-10b8aff0a7e6'),
('7a8ba57a-bd45-4847-b447-d4554ab4985d','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9953f399-6e23-48db-96b3-10b8aff0a7e6'),
('7c3e73d0-b93e-4308-a60f-2c3a22ea0547','role list','saml','saml-role-list-mapper',NULL,'a5ecba62-5dc4-4582-af48-a952c3cbc778'),
('8006dc68-6705-4667-a0da-655fad817e88','Client Host','openid-connect','oidc-usersessionmodel-note-mapper',NULL,'11f9e67b-c3b4-4a25-ba38-b64754f90b7c'),
('8085c304-8fc3-4951-9826-42bade803c3f','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1739edec-8d4a-4330-ac98-c67390be1091'),
('85ec1171-4cc6-4ad5-9001-d2a0b319fbfc','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'6747ad30-9cd1-4b70-990a-4af23e29e153'),
('879a6503-1528-458d-9ff3-0abff452f806','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'e29de210-7ce6-49fd-a200-6e78d1f0b044'),
('8d9c58f9-ec24-4263-b5e9-3fe61890745e','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9953f399-6e23-48db-96b3-10b8aff0a7e6'),
('8f658466-843f-4461-a328-fb094c1eb9d4','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'df8e24fb-c092-4e3f-8a7c-d0e9c9100716'),
('9367fbc4-deff-4ffc-83f2-1fd2b6fd8b53','Client ID','openid-connect','oidc-usersessionmodel-note-mapper',NULL,'11f9e67b-c3b4-4a25-ba38-b64754f90b7c'),
('9b699740-9bca-43a4-9055-e6de2b688e8d','auth_time','openid-connect','oidc-usersessionmodel-note-mapper',NULL,'7948c893-a9da-413f-90c8-966d9eb01323'),
('9c6931ba-391c-46dd-97b5-158de234663d','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fbeead1c-cd5a-48c9-b28c-78b773462c25'),
('9d69f22b-f866-4239-9683-f8bd1e1aeba0','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fbeead1c-cd5a-48c9-b28c-78b773462c25'),
('9e3357dc-daf0-4f69-9069-35496d008a73','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper',NULL,'11f9e67b-c3b4-4a25-ba38-b64754f90b7c'),
('a0804720-4d7f-4b95-a66a-490d36b23948','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper',NULL,'64a91ad0-8efc-4470-8621-ed15e7e8ca5e'),
('a32ad7df-35ff-4351-831f-e302b771baa4','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fbeead1c-cd5a-48c9-b28c-78b773462c25'),
('a39410fd-069a-4123-810a-5a297b0c6fe5','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9953f399-6e23-48db-96b3-10b8aff0a7e6'),
('a4b06e55-3dea-4c3f-8bf7-c3c2a82eb26f','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'37946409-175b-486f-a55f-959c32c28d68'),
('a7bb2703-5375-46ef-b2f2-14cfa5cf4f84','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9953f399-6e23-48db-96b3-10b8aff0a7e6'),
('b40b3260-83e9-4060-8cb4-be129b114c3b','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fbeead1c-cd5a-48c9-b28c-78b773462c25'),
('b728fa11-2f71-4066-ab00-b20c27a712f8','full name','openid-connect','oidc-full-name-mapper',NULL,'fbeead1c-cd5a-48c9-b28c-78b773462c25'),
('b821615d-98f0-4bb0-95c8-423d648dd917','organization','saml','saml-organization-membership-mapper',NULL,'d6cb0d13-02cb-4c1e-b889-ac27edb55f24'),
('bc5e3dc3-dda7-4d0a-8f9e-3e9aa952d612','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9953f399-6e23-48db-96b3-10b8aff0a7e6'),
('bc627aa8-a6c7-425f-a4b4-cdcab8fd3d48','full name','openid-connect','oidc-full-name-mapper',NULL,'9953f399-6e23-48db-96b3-10b8aff0a7e6'),
('c88bc2ea-a483-4268-9752-df6f6ce6a825','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'2f9efd55-e428-4b82-a7a0-ade74a1cdb93'),
('c9c6e76a-914e-488b-ba5f-b514db8da83c','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'3873c462-bf8d-473c-8e66-d645ecffe77b'),
('cfa06ea4-5ac7-4cba-9de4-c0bd0b7282b4','organization','openid-connect','oidc-organization-membership-mapper',NULL,'e323ef15-de0b-4a41-acbb-5a3b9324f572'),
('d117e117-14db-45b6-9c4a-c7a565bf0f0f','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fbeead1c-cd5a-48c9-b28c-78b773462c25'),
('d214ca3a-3300-42d1-8d68-942dc49d7586','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9953f399-6e23-48db-96b3-10b8aff0a7e6'),
('da2db54b-7dad-41eb-92ae-85576b06311a','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'9953f399-6e23-48db-96b3-10b8aff0a7e6'),
('da37585c-d0f1-4002-acfc-b06227a91f70','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'d77698a7-4c19-4b42-92d7-b3fecf8dda46'),
('db6ad068-e29a-41d6-8311-4b01a6ac62b3','sub','openid-connect','oidc-sub-mapper',NULL,'64b3295a-5f99-4c9a-bce4-31ceb0d272e7'),
('dc50f355-d560-4ad8-afb0-ff97ab5ead12','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fbeead1c-cd5a-48c9-b28c-78b773462c25'),
('e500078a-6672-4076-be41-d2de3f2a7626','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'70a3f165-a7db-4f60-b53c-2350a70d933d'),
('e7ce80dc-3032-4b60-91fd-74f46012d81f','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fbeead1c-cd5a-48c9-b28c-78b773462c25'),
('e92d94fb-95c0-4acd-8adc-0350e19b2452','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fbeead1c-cd5a-48c9-b28c-78b773462c25'),
('ebdbdd00-5965-41bc-af92-9b851247600e','acr loa level','openid-connect','oidc-acr-mapper',NULL,'1894c44f-4305-4208-9fcf-4af8d5c041d5'),
('f0847123-b2cc-4256-b794-c57a01f66248','address','openid-connect','oidc-address-mapper',NULL,'d661f2a0-295d-4533-8034-1ae27d7c47a3'),
('f3236178-0b08-4527-8725-7256ef39e164','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'df8e24fb-c092-4e3f-8a7c-d0e9c9100716'),
('f3f1a482-c704-4f28-94e2-e41005a0f370','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ab578b8b-a434-4cfd-ae4a-4529f9cad8af'),
('fe9d38a6-a89a-4fad-85d9-d542b7b5d5a0','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2f9efd55-e428-4b82-a7a0-ade74a1cdb93');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES
('07ec69e3-26fe-4461-97b5-e022ca1e2fc1','true','access.token.claim'),
('07ec69e3-26fe-4461-97b5-e022ca1e2fc1','realm_access.roles','claim.name'),
('07ec69e3-26fe-4461-97b5-e022ca1e2fc1','true','id.token.claim'),
('07ec69e3-26fe-4461-97b5-e022ca1e2fc1','true','introspection.token.claim'),
('07ec69e3-26fe-4461-97b5-e022ca1e2fc1','String','jsonType.label'),
('07ec69e3-26fe-4461-97b5-e022ca1e2fc1','false','lightweight.claim'),
('07ec69e3-26fe-4461-97b5-e022ca1e2fc1','true','multivalued'),
('07ec69e3-26fe-4461-97b5-e022ca1e2fc1','foo','user.attribute'),
('07ec69e3-26fe-4461-97b5-e022ca1e2fc1','false','userinfo.token.claim'),
('0b79b38b-9ea5-45df-8779-896d5eb96fe8','true','access.token.claim'),
('0b79b38b-9ea5-45df-8779-896d5eb96fe8','website','claim.name'),
('0b79b38b-9ea5-45df-8779-896d5eb96fe8','true','id.token.claim'),
('0b79b38b-9ea5-45df-8779-896d5eb96fe8','true','introspection.token.claim'),
('0b79b38b-9ea5-45df-8779-896d5eb96fe8','String','jsonType.label'),
('0b79b38b-9ea5-45df-8779-896d5eb96fe8','website','user.attribute'),
('0b79b38b-9ea5-45df-8779-896d5eb96fe8','true','userinfo.token.claim'),
('11b1bbe7-e0aa-4a67-8e3c-c650e0aacefb','true','access.token.claim'),
('11b1bbe7-e0aa-4a67-8e3c-c650e0aacefb','upn','claim.name'),
('11b1bbe7-e0aa-4a67-8e3c-c650e0aacefb','true','id.token.claim'),
('11b1bbe7-e0aa-4a67-8e3c-c650e0aacefb','true','introspection.token.claim'),
('11b1bbe7-e0aa-4a67-8e3c-c650e0aacefb','String','jsonType.label'),
('11b1bbe7-e0aa-4a67-8e3c-c650e0aacefb','username','user.attribute'),
('11b1bbe7-e0aa-4a67-8e3c-c650e0aacefb','true','userinfo.token.claim'),
('159549c4-4c4a-4210-aabf-907692ac09f6','true','access.token.claim'),
('159549c4-4c4a-4210-aabf-907692ac09f6','true','id.token.claim'),
('159549c4-4c4a-4210-aabf-907692ac09f6','true','introspection.token.claim'),
('159549c4-4c4a-4210-aabf-907692ac09f6','country','user.attribute.country'),
('159549c4-4c4a-4210-aabf-907692ac09f6','formatted','user.attribute.formatted'),
('159549c4-4c4a-4210-aabf-907692ac09f6','locality','user.attribute.locality'),
('159549c4-4c4a-4210-aabf-907692ac09f6','postal_code','user.attribute.postal_code'),
('159549c4-4c4a-4210-aabf-907692ac09f6','region','user.attribute.region'),
('159549c4-4c4a-4210-aabf-907692ac09f6','street','user.attribute.street'),
('159549c4-4c4a-4210-aabf-907692ac09f6','true','userinfo.token.claim'),
('1bd16a42-c973-42ee-bd10-065b148a31dd','true','access.token.claim'),
('1bd16a42-c973-42ee-bd10-065b148a31dd','preferred_username','claim.name'),
('1bd16a42-c973-42ee-bd10-065b148a31dd','true','id.token.claim'),
('1bd16a42-c973-42ee-bd10-065b148a31dd','true','introspection.token.claim'),
('1bd16a42-c973-42ee-bd10-065b148a31dd','String','jsonType.label'),
('1bd16a42-c973-42ee-bd10-065b148a31dd','username','user.attribute'),
('1bd16a42-c973-42ee-bd10-065b148a31dd','true','userinfo.token.claim'),
('1f45c01d-a529-469e-831e-2e7f3ee63b9f','true','access.token.claim'),
('1f45c01d-a529-469e-831e-2e7f3ee63b9f','groups','claim.name'),
('1f45c01d-a529-469e-831e-2e7f3ee63b9f','true','id.token.claim'),
('1f45c01d-a529-469e-831e-2e7f3ee63b9f','true','introspection.token.claim'),
('1f45c01d-a529-469e-831e-2e7f3ee63b9f','String','jsonType.label'),
('1f45c01d-a529-469e-831e-2e7f3ee63b9f','true','multivalued'),
('1f45c01d-a529-469e-831e-2e7f3ee63b9f','foo','user.attribute'),
('1f45c01d-a529-469e-831e-2e7f3ee63b9f','true','userinfo.token.claim'),
('25d5413c-614c-40fe-8399-437e027be582','true','access.token.claim'),
('25d5413c-614c-40fe-8399-437e027be582','email','claim.name'),
('25d5413c-614c-40fe-8399-437e027be582','true','id.token.claim'),
('25d5413c-614c-40fe-8399-437e027be582','true','introspection.token.claim'),
('25d5413c-614c-40fe-8399-437e027be582','String','jsonType.label'),
('25d5413c-614c-40fe-8399-437e027be582','email','user.attribute'),
('25d5413c-614c-40fe-8399-437e027be582','true','userinfo.token.claim'),
('25efeda7-9b89-4226-bc6b-a1f871a54317','true','access.token.claim'),
('25efeda7-9b89-4226-bc6b-a1f871a54317','zoneinfo','claim.name'),
('25efeda7-9b89-4226-bc6b-a1f871a54317','true','id.token.claim'),
('25efeda7-9b89-4226-bc6b-a1f871a54317','true','introspection.token.claim'),
('25efeda7-9b89-4226-bc6b-a1f871a54317','String','jsonType.label'),
('25efeda7-9b89-4226-bc6b-a1f871a54317','zoneinfo','user.attribute'),
('25efeda7-9b89-4226-bc6b-a1f871a54317','true','userinfo.token.claim'),
('2f4c5b71-6f13-4075-9b0e-ab5ce286684a','true','access.token.claim'),
('2f4c5b71-6f13-4075-9b0e-ab5ce286684a','locale','claim.name'),
('2f4c5b71-6f13-4075-9b0e-ab5ce286684a','true','id.token.claim'),
('2f4c5b71-6f13-4075-9b0e-ab5ce286684a','true','introspection.token.claim'),
('2f4c5b71-6f13-4075-9b0e-ab5ce286684a','String','jsonType.label'),
('2f4c5b71-6f13-4075-9b0e-ab5ce286684a','locale','user.attribute'),
('2f4c5b71-6f13-4075-9b0e-ab5ce286684a','true','userinfo.token.claim'),
('3341896a-aa31-440d-9e1a-1e4b09cf11e1','true','access.token.claim'),
('3341896a-aa31-440d-9e1a-1e4b09cf11e1','updated_at','claim.name'),
('3341896a-aa31-440d-9e1a-1e4b09cf11e1','true','id.token.claim'),
('3341896a-aa31-440d-9e1a-1e4b09cf11e1','true','introspection.token.claim'),
('3341896a-aa31-440d-9e1a-1e4b09cf11e1','long','jsonType.label'),
('3341896a-aa31-440d-9e1a-1e4b09cf11e1','updatedAt','user.attribute'),
('3341896a-aa31-440d-9e1a-1e4b09cf11e1','true','userinfo.token.claim'),
('3458127d-772b-4cbc-8c3b-090e420134d1','true','access.token.claim'),
('3458127d-772b-4cbc-8c3b-090e420134d1','true','introspection.token.claim'),
('35dd5b04-874b-42f5-984d-e21015912a1b','true','access.token.claim'),
('35dd5b04-874b-42f5-984d-e21015912a1b','preferred_username','claim.name'),
('35dd5b04-874b-42f5-984d-e21015912a1b','true','id.token.claim'),
('35dd5b04-874b-42f5-984d-e21015912a1b','true','introspection.token.claim'),
('35dd5b04-874b-42f5-984d-e21015912a1b','String','jsonType.label'),
('35dd5b04-874b-42f5-984d-e21015912a1b','username','user.attribute'),
('35dd5b04-874b-42f5-984d-e21015912a1b','true','userinfo.token.claim'),
('39838dd1-1ddc-49dd-9758-3bf8698a78f1','true','access.token.claim'),
('39838dd1-1ddc-49dd-9758-3bf8698a78f1','auth_time','claim.name'),
('39838dd1-1ddc-49dd-9758-3bf8698a78f1','true','id.token.claim'),
('39838dd1-1ddc-49dd-9758-3bf8698a78f1','true','introspection.token.claim'),
('39838dd1-1ddc-49dd-9758-3bf8698a78f1','long','jsonType.label'),
('39838dd1-1ddc-49dd-9758-3bf8698a78f1','AUTH_TIME','user.session.note'),
('3a864391-0b81-4979-9382-5d25a5c42c98','true','access.token.claim'),
('3a864391-0b81-4979-9382-5d25a5c42c98','updated_at','claim.name'),
('3a864391-0b81-4979-9382-5d25a5c42c98','true','id.token.claim'),
('3a864391-0b81-4979-9382-5d25a5c42c98','true','introspection.token.claim'),
('3a864391-0b81-4979-9382-5d25a5c42c98','long','jsonType.label'),
('3a864391-0b81-4979-9382-5d25a5c42c98','updatedAt','user.attribute'),
('3a864391-0b81-4979-9382-5d25a5c42c98','true','userinfo.token.claim'),
('3b7e70ce-dc7c-4e5e-ba55-e9a435451bc6','true','access.token.claim'),
('3b7e70ce-dc7c-4e5e-ba55-e9a435451bc6','realm_access.roles','claim.name'),
('3b7e70ce-dc7c-4e5e-ba55-e9a435451bc6','true','introspection.token.claim'),
('3b7e70ce-dc7c-4e5e-ba55-e9a435451bc6','String','jsonType.label'),
('3b7e70ce-dc7c-4e5e-ba55-e9a435451bc6','true','multivalued'),
('3b7e70ce-dc7c-4e5e-ba55-e9a435451bc6','foo','user.attribute'),
('41489abb-c0f6-4f61-a5bf-b54427f239a8','true','access.token.claim'),
('41489abb-c0f6-4f61-a5bf-b54427f239a8','given_name','claim.name'),
('41489abb-c0f6-4f61-a5bf-b54427f239a8','true','id.token.claim'),
('41489abb-c0f6-4f61-a5bf-b54427f239a8','true','introspection.token.claim'),
('41489abb-c0f6-4f61-a5bf-b54427f239a8','String','jsonType.label'),
('41489abb-c0f6-4f61-a5bf-b54427f239a8','firstName','user.attribute'),
('41489abb-c0f6-4f61-a5bf-b54427f239a8','true','userinfo.token.claim'),
('44674462-2233-4c1c-b154-280276319d73','true','access.token.claim'),
('44674462-2233-4c1c-b154-280276319d73','family_name','claim.name'),
('44674462-2233-4c1c-b154-280276319d73','true','id.token.claim'),
('44674462-2233-4c1c-b154-280276319d73','true','introspection.token.claim'),
('44674462-2233-4c1c-b154-280276319d73','String','jsonType.label'),
('44674462-2233-4c1c-b154-280276319d73','lastName','user.attribute'),
('44674462-2233-4c1c-b154-280276319d73','true','userinfo.token.claim'),
('44a7cde1-dd4a-43d3-91b2-36bfcd271960','true','access.token.claim'),
('44a7cde1-dd4a-43d3-91b2-36bfcd271960','clientHost','claim.name'),
('44a7cde1-dd4a-43d3-91b2-36bfcd271960','true','id.token.claim'),
('44a7cde1-dd4a-43d3-91b2-36bfcd271960','true','introspection.token.claim'),
('44a7cde1-dd4a-43d3-91b2-36bfcd271960','String','jsonType.label'),
('44a7cde1-dd4a-43d3-91b2-36bfcd271960','clientHost','user.session.note'),
('44a7cde1-dd4a-43d3-91b2-36bfcd271960','true','userinfo.token.claim'),
('45d83910-50f7-4f9a-84da-d7a473773661','true','access.token.claim'),
('45d83910-50f7-4f9a-84da-d7a473773661','phone_number','claim.name'),
('45d83910-50f7-4f9a-84da-d7a473773661','true','id.token.claim'),
('45d83910-50f7-4f9a-84da-d7a473773661','true','introspection.token.claim'),
('45d83910-50f7-4f9a-84da-d7a473773661','String','jsonType.label'),
('45d83910-50f7-4f9a-84da-d7a473773661','phoneNumber','user.attribute'),
('45d83910-50f7-4f9a-84da-d7a473773661','true','userinfo.token.claim'),
('469eae7c-239f-463f-b2fd-80d1429180a6','true','access.token.claim'),
('469eae7c-239f-463f-b2fd-80d1429180a6','resource_access.${client_id}.roles','claim.name'),
('469eae7c-239f-463f-b2fd-80d1429180a6','true','introspection.token.claim'),
('469eae7c-239f-463f-b2fd-80d1429180a6','String','jsonType.label'),
('469eae7c-239f-463f-b2fd-80d1429180a6','true','multivalued'),
('469eae7c-239f-463f-b2fd-80d1429180a6','foo','user.attribute'),
('4aafc591-75a9-4510-ba7a-caca47e35f18','true','access.token.claim'),
('4aafc591-75a9-4510-ba7a-caca47e35f18','given_name','claim.name'),
('4aafc591-75a9-4510-ba7a-caca47e35f18','true','id.token.claim'),
('4aafc591-75a9-4510-ba7a-caca47e35f18','true','introspection.token.claim'),
('4aafc591-75a9-4510-ba7a-caca47e35f18','String','jsonType.label'),
('4aafc591-75a9-4510-ba7a-caca47e35f18','firstName','user.attribute'),
('4aafc591-75a9-4510-ba7a-caca47e35f18','true','userinfo.token.claim'),
('5111a8ae-02c4-442b-85d6-82a2b2b42691','true','access.token.claim'),
('5111a8ae-02c4-442b-85d6-82a2b2b42691','locale','claim.name'),
('5111a8ae-02c4-442b-85d6-82a2b2b42691','true','id.token.claim'),
('5111a8ae-02c4-442b-85d6-82a2b2b42691','true','introspection.token.claim'),
('5111a8ae-02c4-442b-85d6-82a2b2b42691','String','jsonType.label'),
('5111a8ae-02c4-442b-85d6-82a2b2b42691','locale','user.attribute'),
('5111a8ae-02c4-442b-85d6-82a2b2b42691','true','userinfo.token.claim'),
('520a6aa7-09e7-40b6-bf96-0d31aa847399','Role','attribute.name'),
('520a6aa7-09e7-40b6-bf96-0d31aa847399','Basic','attribute.nameformat'),
('520a6aa7-09e7-40b6-bf96-0d31aa847399','false','single'),
('52f45545-5900-4501-9362-858f6c323493','true','access.token.claim'),
('52f45545-5900-4501-9362-858f6c323493','true','introspection.token.claim'),
('57c1ff0f-3685-445a-9ee3-38a3bac04e1b','true','access.token.claim'),
('57c1ff0f-3685-445a-9ee3-38a3bac04e1b','client_id','claim.name'),
('57c1ff0f-3685-445a-9ee3-38a3bac04e1b','true','id.token.claim'),
('57c1ff0f-3685-445a-9ee3-38a3bac04e1b','true','introspection.token.claim'),
('57c1ff0f-3685-445a-9ee3-38a3bac04e1b','String','jsonType.label'),
('57c1ff0f-3685-445a-9ee3-38a3bac04e1b','client_id','user.session.note'),
('57c1ff0f-3685-445a-9ee3-38a3bac04e1b','true','userinfo.token.claim'),
('58ff3e6e-92e4-4277-8046-f78e1c02de95','true','access.token.claim'),
('58ff3e6e-92e4-4277-8046-f78e1c02de95','organization','claim.name'),
('58ff3e6e-92e4-4277-8046-f78e1c02de95','true','id.token.claim'),
('58ff3e6e-92e4-4277-8046-f78e1c02de95','true','introspection.token.claim'),
('58ff3e6e-92e4-4277-8046-f78e1c02de95','String','jsonType.label'),
('58ff3e6e-92e4-4277-8046-f78e1c02de95','true','multivalued'),
('58ff3e6e-92e4-4277-8046-f78e1c02de95','true','userinfo.token.claim'),
('5f7a978c-9736-4005-8554-e5715a477b74','true','access.token.claim'),
('5f7a978c-9736-4005-8554-e5715a477b74','gender','claim.name'),
('5f7a978c-9736-4005-8554-e5715a477b74','true','id.token.claim'),
('5f7a978c-9736-4005-8554-e5715a477b74','true','introspection.token.claim'),
('5f7a978c-9736-4005-8554-e5715a477b74','String','jsonType.label'),
('5f7a978c-9736-4005-8554-e5715a477b74','gender','user.attribute'),
('5f7a978c-9736-4005-8554-e5715a477b74','true','userinfo.token.claim'),
('61e47594-3e39-4c27-8a38-cf7f1aa4df8f','true','access.token.claim'),
('61e47594-3e39-4c27-8a38-cf7f1aa4df8f','true','id.token.claim'),
('61e47594-3e39-4c27-8a38-cf7f1aa4df8f','true','introspection.token.claim'),
('61e47594-3e39-4c27-8a38-cf7f1aa4df8f','true','userinfo.token.claim'),
('72fc59ed-fa77-465f-acb1-41ffcb9cca0b','true','access.token.claim'),
('72fc59ed-fa77-465f-acb1-41ffcb9cca0b','phone_number_verified','claim.name'),
('72fc59ed-fa77-465f-acb1-41ffcb9cca0b','true','id.token.claim'),
('72fc59ed-fa77-465f-acb1-41ffcb9cca0b','true','introspection.token.claim'),
('72fc59ed-fa77-465f-acb1-41ffcb9cca0b','boolean','jsonType.label'),
('72fc59ed-fa77-465f-acb1-41ffcb9cca0b','phoneNumberVerified','user.attribute'),
('72fc59ed-fa77-465f-acb1-41ffcb9cca0b','true','userinfo.token.claim'),
('760b1c96-57f8-4c06-8a3f-cfb6382e37ad','true','access.token.claim'),
('760b1c96-57f8-4c06-8a3f-cfb6382e37ad','locale','claim.name'),
('760b1c96-57f8-4c06-8a3f-cfb6382e37ad','true','id.token.claim'),
('760b1c96-57f8-4c06-8a3f-cfb6382e37ad','true','introspection.token.claim'),
('760b1c96-57f8-4c06-8a3f-cfb6382e37ad','String','jsonType.label'),
('760b1c96-57f8-4c06-8a3f-cfb6382e37ad','locale','user.attribute'),
('760b1c96-57f8-4c06-8a3f-cfb6382e37ad','true','userinfo.token.claim'),
('7a8ba57a-bd45-4847-b447-d4554ab4985d','true','access.token.claim'),
('7a8ba57a-bd45-4847-b447-d4554ab4985d','profile','claim.name'),
('7a8ba57a-bd45-4847-b447-d4554ab4985d','true','id.token.claim'),
('7a8ba57a-bd45-4847-b447-d4554ab4985d','true','introspection.token.claim'),
('7a8ba57a-bd45-4847-b447-d4554ab4985d','String','jsonType.label'),
('7a8ba57a-bd45-4847-b447-d4554ab4985d','profile','user.attribute'),
('7a8ba57a-bd45-4847-b447-d4554ab4985d','true','userinfo.token.claim'),
('7c3e73d0-b93e-4308-a60f-2c3a22ea0547','Role','attribute.name'),
('7c3e73d0-b93e-4308-a60f-2c3a22ea0547','Basic','attribute.nameformat'),
('7c3e73d0-b93e-4308-a60f-2c3a22ea0547','false','single'),
('8006dc68-6705-4667-a0da-655fad817e88','true','access.token.claim'),
('8006dc68-6705-4667-a0da-655fad817e88','clientHost','claim.name'),
('8006dc68-6705-4667-a0da-655fad817e88','true','id.token.claim'),
('8006dc68-6705-4667-a0da-655fad817e88','true','introspection.token.claim'),
('8006dc68-6705-4667-a0da-655fad817e88','String','jsonType.label'),
('8006dc68-6705-4667-a0da-655fad817e88','clientHost','user.session.note'),
('8085c304-8fc3-4951-9826-42bade803c3f','true','access.token.claim'),
('8085c304-8fc3-4951-9826-42bade803c3f','phone_number','claim.name'),
('8085c304-8fc3-4951-9826-42bade803c3f','true','id.token.claim'),
('8085c304-8fc3-4951-9826-42bade803c3f','true','introspection.token.claim'),
('8085c304-8fc3-4951-9826-42bade803c3f','String','jsonType.label'),
('8085c304-8fc3-4951-9826-42bade803c3f','phoneNumber','user.attribute'),
('8085c304-8fc3-4951-9826-42bade803c3f','true','userinfo.token.claim'),
('85ec1171-4cc6-4ad5-9001-d2a0b319fbfc','true','access.token.claim'),
('85ec1171-4cc6-4ad5-9001-d2a0b319fbfc','email_verified','claim.name'),
('85ec1171-4cc6-4ad5-9001-d2a0b319fbfc','true','id.token.claim'),
('85ec1171-4cc6-4ad5-9001-d2a0b319fbfc','true','introspection.token.claim'),
('85ec1171-4cc6-4ad5-9001-d2a0b319fbfc','boolean','jsonType.label'),
('85ec1171-4cc6-4ad5-9001-d2a0b319fbfc','emailVerified','user.attribute'),
('85ec1171-4cc6-4ad5-9001-d2a0b319fbfc','true','userinfo.token.claim'),
('879a6503-1528-458d-9ff3-0abff452f806','true','access.token.claim'),
('879a6503-1528-458d-9ff3-0abff452f806','groups','claim.name'),
('879a6503-1528-458d-9ff3-0abff452f806','true','id.token.claim'),
('879a6503-1528-458d-9ff3-0abff452f806','true','introspection.token.claim'),
('879a6503-1528-458d-9ff3-0abff452f806','String','jsonType.label'),
('879a6503-1528-458d-9ff3-0abff452f806','true','multivalued'),
('879a6503-1528-458d-9ff3-0abff452f806','foo','user.attribute'),
('8d9c58f9-ec24-4263-b5e9-3fe61890745e','true','access.token.claim'),
('8d9c58f9-ec24-4263-b5e9-3fe61890745e','nickname','claim.name'),
('8d9c58f9-ec24-4263-b5e9-3fe61890745e','true','id.token.claim'),
('8d9c58f9-ec24-4263-b5e9-3fe61890745e','true','introspection.token.claim'),
('8d9c58f9-ec24-4263-b5e9-3fe61890745e','String','jsonType.label'),
('8d9c58f9-ec24-4263-b5e9-3fe61890745e','nickname','user.attribute'),
('8d9c58f9-ec24-4263-b5e9-3fe61890745e','true','userinfo.token.claim'),
('8f658466-843f-4461-a328-fb094c1eb9d4','true','access.token.claim'),
('8f658466-843f-4461-a328-fb094c1eb9d4','resource_access.${client_id}.roles','claim.name'),
('8f658466-843f-4461-a328-fb094c1eb9d4','true','introspection.token.claim'),
('8f658466-843f-4461-a328-fb094c1eb9d4','String','jsonType.label'),
('8f658466-843f-4461-a328-fb094c1eb9d4','true','multivalued'),
('8f658466-843f-4461-a328-fb094c1eb9d4','foo','user.attribute'),
('9367fbc4-deff-4ffc-83f2-1fd2b6fd8b53','true','access.token.claim'),
('9367fbc4-deff-4ffc-83f2-1fd2b6fd8b53','client_id','claim.name'),
('9367fbc4-deff-4ffc-83f2-1fd2b6fd8b53','true','id.token.claim'),
('9367fbc4-deff-4ffc-83f2-1fd2b6fd8b53','true','introspection.token.claim'),
('9367fbc4-deff-4ffc-83f2-1fd2b6fd8b53','String','jsonType.label'),
('9367fbc4-deff-4ffc-83f2-1fd2b6fd8b53','client_id','user.session.note'),
('9b699740-9bca-43a4-9055-e6de2b688e8d','true','access.token.claim'),
('9b699740-9bca-43a4-9055-e6de2b688e8d','auth_time','claim.name'),
('9b699740-9bca-43a4-9055-e6de2b688e8d','true','id.token.claim'),
('9b699740-9bca-43a4-9055-e6de2b688e8d','true','introspection.token.claim'),
('9b699740-9bca-43a4-9055-e6de2b688e8d','long','jsonType.label'),
('9b699740-9bca-43a4-9055-e6de2b688e8d','AUTH_TIME','user.session.note'),
('9b699740-9bca-43a4-9055-e6de2b688e8d','true','userinfo.token.claim'),
('9c6931ba-391c-46dd-97b5-158de234663d','true','access.token.claim'),
('9c6931ba-391c-46dd-97b5-158de234663d','zoneinfo','claim.name'),
('9c6931ba-391c-46dd-97b5-158de234663d','true','id.token.claim'),
('9c6931ba-391c-46dd-97b5-158de234663d','true','introspection.token.claim'),
('9c6931ba-391c-46dd-97b5-158de234663d','String','jsonType.label'),
('9c6931ba-391c-46dd-97b5-158de234663d','zoneinfo','user.attribute'),
('9c6931ba-391c-46dd-97b5-158de234663d','true','userinfo.token.claim'),
('9d69f22b-f866-4239-9683-f8bd1e1aeba0','true','access.token.claim'),
('9d69f22b-f866-4239-9683-f8bd1e1aeba0','profile','claim.name'),
('9d69f22b-f866-4239-9683-f8bd1e1aeba0','true','id.token.claim'),
('9d69f22b-f866-4239-9683-f8bd1e1aeba0','true','introspection.token.claim'),
('9d69f22b-f866-4239-9683-f8bd1e1aeba0','String','jsonType.label'),
('9d69f22b-f866-4239-9683-f8bd1e1aeba0','profile','user.attribute'),
('9d69f22b-f866-4239-9683-f8bd1e1aeba0','true','userinfo.token.claim'),
('9e3357dc-daf0-4f69-9069-35496d008a73','true','access.token.claim'),
('9e3357dc-daf0-4f69-9069-35496d008a73','clientAddress','claim.name'),
('9e3357dc-daf0-4f69-9069-35496d008a73','true','id.token.claim'),
('9e3357dc-daf0-4f69-9069-35496d008a73','true','introspection.token.claim'),
('9e3357dc-daf0-4f69-9069-35496d008a73','String','jsonType.label'),
('9e3357dc-daf0-4f69-9069-35496d008a73','clientAddress','user.session.note'),
('a0804720-4d7f-4b95-a66a-490d36b23948','true','access.token.claim'),
('a0804720-4d7f-4b95-a66a-490d36b23948','clientAddress','claim.name'),
('a0804720-4d7f-4b95-a66a-490d36b23948','true','id.token.claim'),
('a0804720-4d7f-4b95-a66a-490d36b23948','true','introspection.token.claim'),
('a0804720-4d7f-4b95-a66a-490d36b23948','String','jsonType.label'),
('a0804720-4d7f-4b95-a66a-490d36b23948','clientAddress','user.session.note'),
('a0804720-4d7f-4b95-a66a-490d36b23948','true','userinfo.token.claim'),
('a32ad7df-35ff-4351-831f-e302b771baa4','true','access.token.claim'),
('a32ad7df-35ff-4351-831f-e302b771baa4','nickname','claim.name'),
('a32ad7df-35ff-4351-831f-e302b771baa4','true','id.token.claim'),
('a32ad7df-35ff-4351-831f-e302b771baa4','true','introspection.token.claim'),
('a32ad7df-35ff-4351-831f-e302b771baa4','String','jsonType.label'),
('a32ad7df-35ff-4351-831f-e302b771baa4','nickname','user.attribute'),
('a32ad7df-35ff-4351-831f-e302b771baa4','true','userinfo.token.claim'),
('a39410fd-069a-4123-810a-5a297b0c6fe5','true','access.token.claim'),
('a39410fd-069a-4123-810a-5a297b0c6fe5','birthdate','claim.name'),
('a39410fd-069a-4123-810a-5a297b0c6fe5','true','id.token.claim'),
('a39410fd-069a-4123-810a-5a297b0c6fe5','true','introspection.token.claim'),
('a39410fd-069a-4123-810a-5a297b0c6fe5','String','jsonType.label'),
('a39410fd-069a-4123-810a-5a297b0c6fe5','birthdate','user.attribute'),
('a39410fd-069a-4123-810a-5a297b0c6fe5','true','userinfo.token.claim'),
('a4b06e55-3dea-4c3f-8bf7-c3c2a82eb26f','true','access.token.claim'),
('a4b06e55-3dea-4c3f-8bf7-c3c2a82eb26f','phone_number_verified','claim.name'),
('a4b06e55-3dea-4c3f-8bf7-c3c2a82eb26f','true','id.token.claim'),
('a4b06e55-3dea-4c3f-8bf7-c3c2a82eb26f','true','introspection.token.claim'),
('a4b06e55-3dea-4c3f-8bf7-c3c2a82eb26f','boolean','jsonType.label'),
('a4b06e55-3dea-4c3f-8bf7-c3c2a82eb26f','phoneNumberVerified','user.attribute'),
('a4b06e55-3dea-4c3f-8bf7-c3c2a82eb26f','true','userinfo.token.claim'),
('a7bb2703-5375-46ef-b2f2-14cfa5cf4f84','true','access.token.claim'),
('a7bb2703-5375-46ef-b2f2-14cfa5cf4f84','family_name','claim.name'),
('a7bb2703-5375-46ef-b2f2-14cfa5cf4f84','true','id.token.claim'),
('a7bb2703-5375-46ef-b2f2-14cfa5cf4f84','true','introspection.token.claim'),
('a7bb2703-5375-46ef-b2f2-14cfa5cf4f84','String','jsonType.label'),
('a7bb2703-5375-46ef-b2f2-14cfa5cf4f84','lastName','user.attribute'),
('a7bb2703-5375-46ef-b2f2-14cfa5cf4f84','true','userinfo.token.claim'),
('b40b3260-83e9-4060-8cb4-be129b114c3b','true','access.token.claim'),
('b40b3260-83e9-4060-8cb4-be129b114c3b','gender','claim.name'),
('b40b3260-83e9-4060-8cb4-be129b114c3b','true','id.token.claim'),
('b40b3260-83e9-4060-8cb4-be129b114c3b','true','introspection.token.claim'),
('b40b3260-83e9-4060-8cb4-be129b114c3b','String','jsonType.label'),
('b40b3260-83e9-4060-8cb4-be129b114c3b','gender','user.attribute'),
('b40b3260-83e9-4060-8cb4-be129b114c3b','true','userinfo.token.claim'),
('b728fa11-2f71-4066-ab00-b20c27a712f8','true','access.token.claim'),
('b728fa11-2f71-4066-ab00-b20c27a712f8','true','id.token.claim'),
('b728fa11-2f71-4066-ab00-b20c27a712f8','true','introspection.token.claim'),
('b728fa11-2f71-4066-ab00-b20c27a712f8','true','userinfo.token.claim'),
('bc5e3dc3-dda7-4d0a-8f9e-3e9aa952d612','true','access.token.claim'),
('bc5e3dc3-dda7-4d0a-8f9e-3e9aa952d612','middle_name','claim.name'),
('bc5e3dc3-dda7-4d0a-8f9e-3e9aa952d612','true','id.token.claim'),
('bc5e3dc3-dda7-4d0a-8f9e-3e9aa952d612','true','introspection.token.claim'),
('bc5e3dc3-dda7-4d0a-8f9e-3e9aa952d612','String','jsonType.label'),
('bc5e3dc3-dda7-4d0a-8f9e-3e9aa952d612','middleName','user.attribute'),
('bc5e3dc3-dda7-4d0a-8f9e-3e9aa952d612','true','userinfo.token.claim'),
('bc627aa8-a6c7-425f-a4b4-cdcab8fd3d48','true','access.token.claim'),
('bc627aa8-a6c7-425f-a4b4-cdcab8fd3d48','true','id.token.claim'),
('bc627aa8-a6c7-425f-a4b4-cdcab8fd3d48','true','introspection.token.claim'),
('bc627aa8-a6c7-425f-a4b4-cdcab8fd3d48','true','userinfo.token.claim'),
('c88bc2ea-a483-4268-9752-df6f6ce6a825','true','access.token.claim'),
('c88bc2ea-a483-4268-9752-df6f6ce6a825','email_verified','claim.name'),
('c88bc2ea-a483-4268-9752-df6f6ce6a825','true','id.token.claim'),
('c88bc2ea-a483-4268-9752-df6f6ce6a825','true','introspection.token.claim'),
('c88bc2ea-a483-4268-9752-df6f6ce6a825','boolean','jsonType.label'),
('c88bc2ea-a483-4268-9752-df6f6ce6a825','emailVerified','user.attribute'),
('c88bc2ea-a483-4268-9752-df6f6ce6a825','true','userinfo.token.claim'),
('c9c6e76a-914e-488b-ba5f-b514db8da83c','true','access.token.claim'),
('c9c6e76a-914e-488b-ba5f-b514db8da83c','true','introspection.token.claim'),
('cfa06ea4-5ac7-4cba-9de4-c0bd0b7282b4','true','access.token.claim'),
('cfa06ea4-5ac7-4cba-9de4-c0bd0b7282b4','organization','claim.name'),
('cfa06ea4-5ac7-4cba-9de4-c0bd0b7282b4','true','id.token.claim'),
('cfa06ea4-5ac7-4cba-9de4-c0bd0b7282b4','true','introspection.token.claim'),
('cfa06ea4-5ac7-4cba-9de4-c0bd0b7282b4','String','jsonType.label'),
('cfa06ea4-5ac7-4cba-9de4-c0bd0b7282b4','true','multivalued'),
('d117e117-14db-45b6-9c4a-c7a565bf0f0f','true','access.token.claim'),
('d117e117-14db-45b6-9c4a-c7a565bf0f0f','locale','claim.name'),
('d117e117-14db-45b6-9c4a-c7a565bf0f0f','true','id.token.claim'),
('d117e117-14db-45b6-9c4a-c7a565bf0f0f','true','introspection.token.claim'),
('d117e117-14db-45b6-9c4a-c7a565bf0f0f','String','jsonType.label'),
('d117e117-14db-45b6-9c4a-c7a565bf0f0f','locale','user.attribute'),
('d117e117-14db-45b6-9c4a-c7a565bf0f0f','true','userinfo.token.claim'),
('d214ca3a-3300-42d1-8d68-942dc49d7586','true','access.token.claim'),
('d214ca3a-3300-42d1-8d68-942dc49d7586','picture','claim.name'),
('d214ca3a-3300-42d1-8d68-942dc49d7586','true','id.token.claim'),
('d214ca3a-3300-42d1-8d68-942dc49d7586','true','introspection.token.claim'),
('d214ca3a-3300-42d1-8d68-942dc49d7586','String','jsonType.label'),
('d214ca3a-3300-42d1-8d68-942dc49d7586','picture','user.attribute'),
('d214ca3a-3300-42d1-8d68-942dc49d7586','true','userinfo.token.claim'),
('da2db54b-7dad-41eb-92ae-85576b06311a','true','access.token.claim'),
('da2db54b-7dad-41eb-92ae-85576b06311a','website','claim.name'),
('da2db54b-7dad-41eb-92ae-85576b06311a','true','id.token.claim'),
('da2db54b-7dad-41eb-92ae-85576b06311a','true','introspection.token.claim'),
('da2db54b-7dad-41eb-92ae-85576b06311a','String','jsonType.label'),
('da2db54b-7dad-41eb-92ae-85576b06311a','website','user.attribute'),
('da2db54b-7dad-41eb-92ae-85576b06311a','true','userinfo.token.claim'),
('da37585c-d0f1-4002-acfc-b06227a91f70','true','access.token.claim'),
('da37585c-d0f1-4002-acfc-b06227a91f70','true','introspection.token.claim'),
('db6ad068-e29a-41d6-8311-4b01a6ac62b3','true','access.token.claim'),
('db6ad068-e29a-41d6-8311-4b01a6ac62b3','true','introspection.token.claim'),
('dc50f355-d560-4ad8-afb0-ff97ab5ead12','true','access.token.claim'),
('dc50f355-d560-4ad8-afb0-ff97ab5ead12','middle_name','claim.name'),
('dc50f355-d560-4ad8-afb0-ff97ab5ead12','true','id.token.claim'),
('dc50f355-d560-4ad8-afb0-ff97ab5ead12','true','introspection.token.claim'),
('dc50f355-d560-4ad8-afb0-ff97ab5ead12','String','jsonType.label'),
('dc50f355-d560-4ad8-afb0-ff97ab5ead12','middleName','user.attribute'),
('dc50f355-d560-4ad8-afb0-ff97ab5ead12','true','userinfo.token.claim'),
('e500078a-6672-4076-be41-d2de3f2a7626','true','access.token.claim'),
('e500078a-6672-4076-be41-d2de3f2a7626','true','introspection.token.claim'),
('e7ce80dc-3032-4b60-91fd-74f46012d81f','true','access.token.claim'),
('e7ce80dc-3032-4b60-91fd-74f46012d81f','birthdate','claim.name'),
('e7ce80dc-3032-4b60-91fd-74f46012d81f','true','id.token.claim'),
('e7ce80dc-3032-4b60-91fd-74f46012d81f','true','introspection.token.claim'),
('e7ce80dc-3032-4b60-91fd-74f46012d81f','String','jsonType.label'),
('e7ce80dc-3032-4b60-91fd-74f46012d81f','birthdate','user.attribute'),
('e7ce80dc-3032-4b60-91fd-74f46012d81f','true','userinfo.token.claim'),
('e92d94fb-95c0-4acd-8adc-0350e19b2452','true','access.token.claim'),
('e92d94fb-95c0-4acd-8adc-0350e19b2452','picture','claim.name'),
('e92d94fb-95c0-4acd-8adc-0350e19b2452','true','id.token.claim'),
('e92d94fb-95c0-4acd-8adc-0350e19b2452','true','introspection.token.claim'),
('e92d94fb-95c0-4acd-8adc-0350e19b2452','String','jsonType.label'),
('e92d94fb-95c0-4acd-8adc-0350e19b2452','picture','user.attribute'),
('e92d94fb-95c0-4acd-8adc-0350e19b2452','true','userinfo.token.claim'),
('ebdbdd00-5965-41bc-af92-9b851247600e','true','access.token.claim'),
('ebdbdd00-5965-41bc-af92-9b851247600e','true','id.token.claim'),
('ebdbdd00-5965-41bc-af92-9b851247600e','true','introspection.token.claim'),
('f0847123-b2cc-4256-b794-c57a01f66248','true','access.token.claim'),
('f0847123-b2cc-4256-b794-c57a01f66248','true','id.token.claim'),
('f0847123-b2cc-4256-b794-c57a01f66248','true','introspection.token.claim'),
('f0847123-b2cc-4256-b794-c57a01f66248','country','user.attribute.country'),
('f0847123-b2cc-4256-b794-c57a01f66248','formatted','user.attribute.formatted'),
('f0847123-b2cc-4256-b794-c57a01f66248','locality','user.attribute.locality'),
('f0847123-b2cc-4256-b794-c57a01f66248','postal_code','user.attribute.postal_code'),
('f0847123-b2cc-4256-b794-c57a01f66248','region','user.attribute.region'),
('f0847123-b2cc-4256-b794-c57a01f66248','street','user.attribute.street'),
('f0847123-b2cc-4256-b794-c57a01f66248','true','userinfo.token.claim'),
('f3236178-0b08-4527-8725-7256ef39e164','true','access.token.claim'),
('f3236178-0b08-4527-8725-7256ef39e164','realm_access.roles','claim.name'),
('f3236178-0b08-4527-8725-7256ef39e164','true','introspection.token.claim'),
('f3236178-0b08-4527-8725-7256ef39e164','String','jsonType.label'),
('f3236178-0b08-4527-8725-7256ef39e164','true','multivalued'),
('f3236178-0b08-4527-8725-7256ef39e164','foo','user.attribute'),
('f3f1a482-c704-4f28-94e2-e41005a0f370','true','access.token.claim'),
('f3f1a482-c704-4f28-94e2-e41005a0f370','upn','claim.name'),
('f3f1a482-c704-4f28-94e2-e41005a0f370','true','id.token.claim'),
('f3f1a482-c704-4f28-94e2-e41005a0f370','true','introspection.token.claim'),
('f3f1a482-c704-4f28-94e2-e41005a0f370','String','jsonType.label'),
('f3f1a482-c704-4f28-94e2-e41005a0f370','username','user.attribute'),
('f3f1a482-c704-4f28-94e2-e41005a0f370','true','userinfo.token.claim'),
('fe9d38a6-a89a-4fad-85d9-d542b7b5d5a0','true','access.token.claim'),
('fe9d38a6-a89a-4fad-85d9-d542b7b5d5a0','email','claim.name'),
('fe9d38a6-a89a-4fad-85d9-d542b7b5d5a0','true','id.token.claim'),
('fe9d38a6-a89a-4fad-85d9-d542b7b5d5a0','true','introspection.token.claim'),
('fe9d38a6-a89a-4fad-85d9-d542b7b5d5a0','String','jsonType.label'),
('fe9d38a6-a89a-4fad-85d9-d542b7b5d5a0','email','user.attribute'),
('fe9d38a6-a89a-4fad-85d9-d542b7b5d5a0','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` tinyint(4) NOT NULL DEFAULT '0',
  `EVENTS_ENABLED` tinyint(4) NOT NULL DEFAULT '0',
  `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PASSWORD_POLICY` varchar(2550) DEFAULT NULL,
  `REGISTRATION_ALLOWED` tinyint(4) NOT NULL DEFAULT '0',
  `REMEMBER_ME` tinyint(4) NOT NULL DEFAULT '0',
  `RESET_PASSWORD_ALLOWED` tinyint(4) NOT NULL DEFAULT '0',
  `SOCIAL` tinyint(4) NOT NULL DEFAULT '0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` tinyint(4) NOT NULL DEFAULT '0',
  `VERIFY_EMAIL` tinyint(4) NOT NULL DEFAULT '0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` tinyint(4) NOT NULL DEFAULT '0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` tinyint(4) NOT NULL DEFAULT '0',
  `ADMIN_EVENTS_ENABLED` tinyint(4) NOT NULL DEFAULT '0',
  `ADMIN_EVENTS_DETAILS_ENABLED` tinyint(4) NOT NULL DEFAULT '0',
  `EDIT_USERNAME_ALLOWED` tinyint(4) NOT NULL DEFAULT '0',
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
  `REVOKE_REFRESH_TOKEN` tinyint(4) NOT NULL DEFAULT '0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` tinyint(4) NOT NULL DEFAULT '1',
  `DUPLICATE_EMAILS_ALLOWED` tinyint(4) NOT NULL DEFAULT '0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int(11) DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` tinyint(4) NOT NULL DEFAULT '0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int(11) NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int(11) NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES
('4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',60,300,60,NULL,NULL,NULL,1,0,0,NULL,'master',0,NULL,0,0,0,0,'EXTERNAL',1800,36000,0,0,'f6b8ecfc-5750-4b0c-94d4-eb44e8f149ba',1800,0,NULL,0,0,0,0,0,1,30,6,'HmacSHA1','totp','6cbda524-79d2-47eb-969f-dd99ed1011fd','d5f1a3b0-5e4c-4940-ac44-5ba4ef37d53d','c64a6554-8b71-45d6-9922-e5b660af0aa8','7022adce-6435-47df-a72e-6012fb681de6','cbacc7e3-dd4b-4c7d-a94d-8a487f93b176',2592000,0,900,1,0,'2393fbe5-75d7-4eeb-972d-2004f9af4da8',0,0,0,0,'2085d621-eedb-4b8d-b737-8a5e679c9020'),
('b1a77210-c7ee-43b5-b50d-620366c5ffd4',60,300,300,NULL,NULL,NULL,1,0,0,NULL,'qualite-logicielle',0,NULL,0,0,0,0,'EXTERNAL',1800,36000,0,0,'b02ae539-fd67-41c8-ba2b-2fb3a13da1c5',1800,0,NULL,0,0,0,0,0,1,30,6,'HmacSHA1','totp','97fa366c-2aa1-4fe4-a983-da9db5d0a3ec','82207a4e-9de6-4606-8197-68c90cfcc0bc','4390d5c0-d3de-449f-abd7-220a4fe1baf0','94d6e301-e593-4d14-a685-aae625f94d55','1f25beab-ee5c-42d4-8ccf-97a851baaf6d',2592000,0,900,1,0,'2c063396-7f2f-4598-b9bb-b55f412e630c',0,0,0,0,'d66d287d-8b39-476f-b4f9-8a0976ee2618');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES
('actionTokenGeneratedByAdminLifespan','b1a77210-c7ee-43b5-b50d-620366c5ffd4','43200'),
('actionTokenGeneratedByUserLifespan','b1a77210-c7ee-43b5-b50d-620366c5ffd4','300'),
('adminPermissionsEnabled','b1a77210-c7ee-43b5-b50d-620366c5ffd4','false'),
('bruteForceProtected','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','false'),
('bruteForceProtected','b1a77210-c7ee-43b5-b50d-620366c5ffd4','false'),
('bruteForceStrategy','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','MULTIPLE'),
('bruteForceStrategy','b1a77210-c7ee-43b5-b50d-620366c5ffd4','MULTIPLE'),
('cibaAuthRequestedUserHint','b1a77210-c7ee-43b5-b50d-620366c5ffd4','login_hint'),
('cibaBackchannelTokenDeliveryMode','b1a77210-c7ee-43b5-b50d-620366c5ffd4','poll'),
('cibaExpiresIn','b1a77210-c7ee-43b5-b50d-620366c5ffd4','120'),
('cibaInterval','b1a77210-c7ee-43b5-b50d-620366c5ffd4','5'),
('client-policies.policies','b1a77210-c7ee-43b5-b50d-620366c5ffd4','{\"policies\":[]}'),
('client-policies.profiles','b1a77210-c7ee-43b5-b50d-620366c5ffd4','{\"profiles\":[]}'),
('clientOfflineSessionIdleTimeout','b1a77210-c7ee-43b5-b50d-620366c5ffd4','0'),
('clientOfflineSessionMaxLifespan','b1a77210-c7ee-43b5-b50d-620366c5ffd4','0'),
('clientSessionIdleTimeout','b1a77210-c7ee-43b5-b50d-620366c5ffd4','0'),
('clientSessionMaxLifespan','b1a77210-c7ee-43b5-b50d-620366c5ffd4','0'),
('defaultSignatureAlgorithm','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','RS256'),
('defaultSignatureAlgorithm','b1a77210-c7ee-43b5-b50d-620366c5ffd4','RS256'),
('displayName','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','Keycloak'),
('displayNameHtml','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),
('failureFactor','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','30'),
('failureFactor','b1a77210-c7ee-43b5-b50d-620366c5ffd4','30'),
('firstBrokerLoginFlowId','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','33dc6da8-d357-400a-baaf-46b61b159151'),
('firstBrokerLoginFlowId','b1a77210-c7ee-43b5-b50d-620366c5ffd4','035946f5-5d48-4d2f-ad13-19f72b90321a'),
('maxDeltaTimeSeconds','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','43200'),
('maxDeltaTimeSeconds','b1a77210-c7ee-43b5-b50d-620366c5ffd4','43200'),
('maxFailureWaitSeconds','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','900'),
('maxFailureWaitSeconds','b1a77210-c7ee-43b5-b50d-620366c5ffd4','900'),
('maxTemporaryLockouts','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','0'),
('maxTemporaryLockouts','b1a77210-c7ee-43b5-b50d-620366c5ffd4','0'),
('minimumQuickLoginWaitSeconds','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','60'),
('minimumQuickLoginWaitSeconds','b1a77210-c7ee-43b5-b50d-620366c5ffd4','60'),
('oauth2DeviceCodeLifespan','b1a77210-c7ee-43b5-b50d-620366c5ffd4','600'),
('oauth2DevicePollingInterval','b1a77210-c7ee-43b5-b50d-620366c5ffd4','5'),
('offlineSessionMaxLifespan','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','5184000'),
('offlineSessionMaxLifespan','b1a77210-c7ee-43b5-b50d-620366c5ffd4','5184000'),
('offlineSessionMaxLifespanEnabled','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','false'),
('offlineSessionMaxLifespanEnabled','b1a77210-c7ee-43b5-b50d-620366c5ffd4','false'),
('organizationsEnabled','b1a77210-c7ee-43b5-b50d-620366c5ffd4','false'),
('parRequestUriLifespan','b1a77210-c7ee-43b5-b50d-620366c5ffd4','60'),
('permanentLockout','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','false'),
('permanentLockout','b1a77210-c7ee-43b5-b50d-620366c5ffd4','false'),
('quickLoginCheckMilliSeconds','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','1000'),
('quickLoginCheckMilliSeconds','b1a77210-c7ee-43b5-b50d-620366c5ffd4','1000'),
('realmReusableOtpCode','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','false'),
('realmReusableOtpCode','b1a77210-c7ee-43b5-b50d-620366c5ffd4','false'),
('verifiableCredentialsEnabled','b1a77210-c7ee-43b5-b50d-620366c5ffd4','false'),
('waitIncrementSeconds','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','60'),
('waitIncrementSeconds','b1a77210-c7ee-43b5-b50d-620366c5ffd4','60'),
('webAuthnPolicyAttestationConveyancePreference','b1a77210-c7ee-43b5-b50d-620366c5ffd4','not specified'),
('webAuthnPolicyAttestationConveyancePreferencePasswordless','b1a77210-c7ee-43b5-b50d-620366c5ffd4','not specified'),
('webAuthnPolicyAuthenticatorAttachment','b1a77210-c7ee-43b5-b50d-620366c5ffd4','not specified'),
('webAuthnPolicyAuthenticatorAttachmentPasswordless','b1a77210-c7ee-43b5-b50d-620366c5ffd4','not specified'),
('webAuthnPolicyAvoidSameAuthenticatorRegister','b1a77210-c7ee-43b5-b50d-620366c5ffd4','false'),
('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','b1a77210-c7ee-43b5-b50d-620366c5ffd4','false'),
('webAuthnPolicyCreateTimeout','b1a77210-c7ee-43b5-b50d-620366c5ffd4','0'),
('webAuthnPolicyCreateTimeoutPasswordless','b1a77210-c7ee-43b5-b50d-620366c5ffd4','0'),
('webAuthnPolicyRequireResidentKey','b1a77210-c7ee-43b5-b50d-620366c5ffd4','not specified'),
('webAuthnPolicyRequireResidentKeyPasswordless','b1a77210-c7ee-43b5-b50d-620366c5ffd4','not specified'),
('webAuthnPolicyRpEntityName','b1a77210-c7ee-43b5-b50d-620366c5ffd4','keycloak'),
('webAuthnPolicyRpEntityNamePasswordless','b1a77210-c7ee-43b5-b50d-620366c5ffd4','keycloak'),
('webAuthnPolicyRpId','b1a77210-c7ee-43b5-b50d-620366c5ffd4',''),
('webAuthnPolicyRpIdPasswordless','b1a77210-c7ee-43b5-b50d-620366c5ffd4',''),
('webAuthnPolicySignatureAlgorithms','b1a77210-c7ee-43b5-b50d-620366c5ffd4','ES256,RS256'),
('webAuthnPolicySignatureAlgorithmsPasswordless','b1a77210-c7ee-43b5-b50d-620366c5ffd4','ES256,RS256'),
('webAuthnPolicyUserVerificationRequirement','b1a77210-c7ee-43b5-b50d-620366c5ffd4','not specified'),
('webAuthnPolicyUserVerificationRequirementPasswordless','b1a77210-c7ee-43b5-b50d-620366c5ffd4','not specified'),
('_browser_header.contentSecurityPolicy','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),
('_browser_header.contentSecurityPolicy','b1a77210-c7ee-43b5-b50d-620366c5ffd4','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),
('_browser_header.contentSecurityPolicyReportOnly','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',''),
('_browser_header.contentSecurityPolicyReportOnly','b1a77210-c7ee-43b5-b50d-620366c5ffd4',''),
('_browser_header.referrerPolicy','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','no-referrer'),
('_browser_header.referrerPolicy','b1a77210-c7ee-43b5-b50d-620366c5ffd4','no-referrer'),
('_browser_header.strictTransportSecurity','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','max-age=31536000; includeSubDomains'),
('_browser_header.strictTransportSecurity','b1a77210-c7ee-43b5-b50d-620366c5ffd4','max-age=31536000; includeSubDomains'),
('_browser_header.xContentTypeOptions','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','nosniff'),
('_browser_header.xContentTypeOptions','b1a77210-c7ee-43b5-b50d-620366c5ffd4','nosniff'),
('_browser_header.xFrameOptions','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','SAMEORIGIN'),
('_browser_header.xFrameOptions','b1a77210-c7ee-43b5-b50d-620366c5ffd4','SAMEORIGIN'),
('_browser_header.xRobotsTag','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','none'),
('_browser_header.xRobotsTag','b1a77210-c7ee-43b5-b50d-620366c5ffd4','none'),
('_browser_header.xXSSProtection','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','1; mode=block'),
('_browser_header.xXSSProtection','b1a77210-c7ee-43b5-b50d-620366c5ffd4','1; mode=block');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES
('4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','jboss-logging'),
('b1a77210-c7ee-43b5-b50d-620366c5ffd4','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` tinyint(4) NOT NULL DEFAULT '0',
  `SECRET` tinyint(4) NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES
('password','password',1,1,'4d5e8bb7-85bb-425c-88a8-479cd3b14e0a'),
('password','password',1,1,'b1a77210-c7ee-43b5-b50d-620366c5ffd4');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES
('1041f61b-95d7-40cc-b290-3c344e6ddbcc','/realms/qualite-logicielle/account/*'),
('48083b3d-ab85-42e2-b58b-e2a77ebbce41','/admin/qualite-logicielle/console/*'),
('623ace0a-1fea-43c7-a2ea-cb1c3fcb50ad','/realms/master/account/*'),
('921fe5ab-c238-47e1-b045-c62ae715c822','/admin/master/console/*'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','/*'),
('a00f7cca-2385-4f44-8360-df5da1ff1878','/realms/master/account/*'),
('fa9442fd-fa8f-4c2a-9ff0-64c7032b41a6','/realms/qualite-logicielle/account/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` tinyint(4) NOT NULL DEFAULT '0',
  `DEFAULT_ACTION` tinyint(4) NOT NULL DEFAULT '0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES
('066a4836-2cf4-4e35-9ff1-a7c8708231b2','VERIFY_PROFILE','Verify Profile','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',1,0,'VERIFY_PROFILE',90),
('18cd0c61-61c8-4b77-8622-4e79d4634a42','delete_account','Delete Account','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',0,0,'delete_account',60),
('3b7b05a8-1af2-4f53-b26e-1f837e57ca17','VERIFY_EMAIL','Verify Email','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',1,0,'VERIFY_EMAIL',50),
('3d66be57-45c8-4178-80fc-4c4a83a07b2b','VERIFY_PROFILE','Verify Profile','b1a77210-c7ee-43b5-b50d-620366c5ffd4',1,0,'VERIFY_PROFILE',90),
('57a1ad31-664f-4cb9-ab6f-9ff086880a3f','webauthn-register-passwordless','Webauthn Register Passwordless','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',1,0,'webauthn-register-passwordless',80),
('58388030-bb90-4f18-ae13-773f87258630','webauthn-register','Webauthn Register','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',1,0,'webauthn-register',70),
('66371747-cce6-4d23-bac5-88f9eae941d1','delete_credential','Delete Credential','b1a77210-c7ee-43b5-b50d-620366c5ffd4',1,0,'delete_credential',100),
('6883ab5b-25ad-4b6a-b687-6656dd373c14','UPDATE_PROFILE','Update Profile','b1a77210-c7ee-43b5-b50d-620366c5ffd4',1,0,'UPDATE_PROFILE',40),
('6d150f64-e17b-4c2d-8202-e6e640b14c78','UPDATE_PASSWORD','Update Password','b1a77210-c7ee-43b5-b50d-620366c5ffd4',1,0,'UPDATE_PASSWORD',30),
('79b148c8-79cc-4549-a5e4-47460eba3f3d','UPDATE_PASSWORD','Update Password','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',1,0,'UPDATE_PASSWORD',30),
('86163dc0-4839-4f26-9f3b-734a777c02bb','TERMS_AND_CONDITIONS','Terms and Conditions','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',0,0,'TERMS_AND_CONDITIONS',20),
('8e41626e-9008-4728-9442-2f8871e94d8b','UPDATE_PROFILE','Update Profile','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',1,0,'UPDATE_PROFILE',40),
('9bd6f824-9e30-40f7-9d25-0cee1eec55e1','update_user_locale','Update User Locale','b1a77210-c7ee-43b5-b50d-620366c5ffd4',1,0,'update_user_locale',1000),
('a1a37679-8f26-4b23-a3a4-9395f43e1a92','VERIFY_EMAIL','Verify Email','b1a77210-c7ee-43b5-b50d-620366c5ffd4',1,0,'VERIFY_EMAIL',50),
('a5e277e9-ac08-4299-9e14-72203ba03a29','update_user_locale','Update User Locale','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',1,0,'update_user_locale',1000),
('a9aef926-c642-4de6-a1f8-d13dbd8e827b','TERMS_AND_CONDITIONS','Terms and Conditions','b1a77210-c7ee-43b5-b50d-620366c5ffd4',0,0,'TERMS_AND_CONDITIONS',20),
('afab5049-cdd2-4b03-bece-c3e083bf5d54','webauthn-register-passwordless','Webauthn Register Passwordless','b1a77210-c7ee-43b5-b50d-620366c5ffd4',1,0,'webauthn-register-passwordless',80),
('b0166cca-bb8d-43ea-8b77-94f7389b8d5c','delete_credential','Delete Credential','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',1,0,'delete_credential',100),
('b1634dc7-f36c-4719-8825-108457864cf5','CONFIGURE_TOTP','Configure OTP','b1a77210-c7ee-43b5-b50d-620366c5ffd4',1,0,'CONFIGURE_TOTP',10),
('c1086b39-babc-4b90-9e7e-5ae04eb383aa','delete_account','Delete Account','b1a77210-c7ee-43b5-b50d-620366c5ffd4',0,0,'delete_account',60),
('da6d618e-0b22-402e-8345-d2ff7ce605c3','CONFIGURE_TOTP','Configure OTP','4d5e8bb7-85bb-425c-88a8-479cd3b14e0a',1,0,'CONFIGURE_TOTP',10),
('e11729b2-ed06-470f-878c-d47441623df6','webauthn-register','Webauthn Register','b1a77210-c7ee-43b5-b50d-620366c5ffd4',1,0,'webauthn-register',70);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` tinyint(4) NOT NULL DEFAULT '0',
  `POLICY_ENFORCE_MODE` tinyint(4) DEFAULT NULL,
  `DECISION_STRATEGY` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) NOT NULL,
  `GRANTED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  KEY `IDX_PERM_TICKET_REQUESTER` (`REQUESTER`),
  KEY `IDX_PERM_TICKET_OWNER` (`OWNER`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` tinyint(4) DEFAULT NULL,
  `LOGIC` tinyint(4) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` tinyint(4) NOT NULL DEFAULT '0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REVOKED_TOKEN`
--

DROP TABLE IF EXISTS `REVOKED_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `REVOKED_TOKEN` (
  `ID` varchar(255) NOT NULL,
  `EXPIRE` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REV_TOKEN_ON_EXPIRE` (`EXPIRE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REVOKED_TOKEN`
--

LOCK TABLES `REVOKED_TOKEN` WRITE;
/*!40000 ALTER TABLE `REVOKED_TOKEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `REVOKED_TOKEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES
('a00f7cca-2385-4f44-8360-df5da1ff1878','16971ddf-226f-41cf-a880-1cf8c17b8e82'),
('a00f7cca-2385-4f44-8360-df5da1ff1878','74da31e9-a7e2-4090-b8dd-f675df60f30b'),
('1041f61b-95d7-40cc-b290-3c344e6ddbcc','c50dfbaf-934b-4c85-b5f7-26601953a16b'),
('1041f61b-95d7-40cc-b290-3c344e6ddbcc','cc3ba7cc-afc6-45d0-b0e2-022acef8d075');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `LONG_VALUE_HASH` binary(64) DEFAULT NULL,
  `LONG_VALUE_HASH_LOWER_CASE` binary(64) DEFAULT NULL,
  `LONG_VALUE` longtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  KEY `USER_ATTR_LONG_VALUES` (`LONG_VALUE_HASH`,`NAME`),
  KEY `USER_ATTR_LONG_VALUES_LOWER_CASE` (`LONG_VALUE_HASH_LOWER_CASE`,`NAME`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `USER_ATTRIBUTE` VALUES
('is_temporary_admin','true','52cd6e09-872e-4beb-9e83-88bafd95c172','d0233310-1439-44a1-8faa-903ae60efc11',NULL,NULL,NULL);
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_LOCAL_CONSENT` (`CLIENT_ID`,`USER_ID`),
  UNIQUE KEY `UK_EXTERNAL_CONSENT` (`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  KEY `IDX_USCONSENT_SCOPE_ID` (`SCOPE_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` tinyint(4) NOT NULL DEFAULT '0',
  `ENABLED` tinyint(4) NOT NULL DEFAULT '0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`),
  KEY `IDX_USER_SERVICE_ACCOUNT` (`REALM_ID`,`SERVICE_ACCOUNT_CLIENT_LINK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES
('52cd6e09-872e-4beb-9e83-88bafd95c172',NULL,'339b3d89-5c06-47d1-b22c-c04b13083a50',0,1,NULL,NULL,NULL,'4d5e8bb7-85bb-425c-88a8-479cd3b14e0a','username',1744489555744,NULL,0),
('d88a7029-8a4c-44e5-bc38-cd7ca625dd12','leonardo.dicaprio@gmail.com','leonardo.dicaprio@gmail.com',1,1,NULL,'Leonardo','Dicaprio','b1a77210-c7ee-43b5-b50d-620366c5ffd4','leonardo',1744489842741,NULL,0),
('e425945d-648f-4a12-8e63-bc8224b2af66','margot.robbie@gmail.com','margot.robbie@gmail.com',1,1,NULL,'Margot','Robbie','b1a77210-c7ee-43b5-b50d-620366c5ffd4','margot',1744489898079,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
  `LAST_SYNC` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `MEMBERSHIP_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES
('1529843a-dc30-4676-a80e-53c7d79af538','52cd6e09-872e-4beb-9e83-88bafd95c172'),
('2085d621-eedb-4b8d-b737-8a5e679c9020','52cd6e09-872e-4beb-9e83-88bafd95c172'),
('a505c039-db07-4ce7-b040-3ed1c145cf2f','d88a7029-8a4c-44e5-bc38-cd7ca625dd12'),
('d66d287d-8b39-476f-b4f9-8a0976ee2618','d88a7029-8a4c-44e5-bc38-cd7ca625dd12'),
('bd04d7d4-4018-436a-a3f3-c0d616bea5b0','e425945d-648f-4a12-8e63-bc8224b2af66'),
('d66d287d-8b39-476f-b4f9-8a0976ee2618','e425945d-648f-4a12-8e63-bc8224b2af66');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES
('48083b3d-ab85-42e2-b58b-e2a77ebbce41','+'),
('921fe5ab-c238-47e1-b045-c62ae715c822','+'),
('983e49d2-9da2-4752-a0ac-17f5a724c755','/*');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-04-12 23:07:46
