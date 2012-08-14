-- MySQL dump 10.13  Distrib 5.5.22, for Win64 (x86)
--
-- Host: 127.0.0.1    Database: paclient_1084
-- ------------------------------------------------------
-- Server version	5.5.22

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `AddressID` int(10) NOT NULL AUTO_INCREMENT,
  `SiteID` int(10) DEFAULT NULL,
  `AddressTypeID` char(10) DEFAULT NULL,
  `Attention` varchar(80) DEFAULT NULL,
  `AddressLine1` varchar(80) DEFAULT NULL,
  `AddressLine2` varchar(80) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `StateID` int(10) DEFAULT NULL,
  `ZipCode` varchar(25) DEFAULT NULL,
  `CountryID` int(10) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `CategoryID` int(10) NOT NULL AUTO_INCREMENT,
  `SiteID` int(10) NOT NULL,
  `CategoryName` varchar(100) NOT NULL,
  `CategoryURL` varchar(100) DEFAULT NULL,
  `CategorySortOrder` int(10) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`CategoryID`),
  KEY `AddressType` (`SiteID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claim`
--

DROP TABLE IF EXISTS `claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claim` (
  `ClaimID` int(10) NOT NULL AUTO_INCREMENT,
  `InterchangeClaimID` varchar(50) NOT NULL,
  `ClientAssignedClaimID` varchar(50) DEFAULT NULL,
  `InterchangeID` int(10) NOT NULL,
  `ProviderID` varchar(20) DEFAULT NULL,
  `ClaimType` int(10) NOT NULL,
  `ClientID` int(10) NOT NULL,
  `EntityID` int(10) DEFAULT NULL,
  `HICNumber` varchar(25) DEFAULT NULL,
  `ClaimStatusCode` int(10) DEFAULT NULL,
  `StatusID` int(10) DEFAULT NULL,
  `ClaimPreviousPaidAmount` decimal(19,4) DEFAULT NULL,
  `ClaimPaidAmount` decimal(19,4) DEFAULT NULL,
  `PatientResponsibilityAmount` decimal(19,4) DEFAULT NULL,
  `AssignedToUserID` int(10) DEFAULT NULL,
  `DueDate` datetime DEFAULT NULL,
  `FacilityCode` varchar(10) DEFAULT NULL,
  `CrossoverEntityTypeQualifier2` varchar(2) DEFAULT NULL,
  `CrossoverNameLastorOrganizationName3` varchar(36) DEFAULT NULL,
  `CrossoverIdentificationCode9` varchar(80) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ClaimID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claim_medicare_moa`
--

DROP TABLE IF EXISTS `claim_medicare_moa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claim_medicare_moa` (
  `Claim_MEDICARE_MOAID` int(10) NOT NULL AUTO_INCREMENT,
  `ClaimID` int(10) NOT NULL,
  `ReimbursementRate` double DEFAULT NULL,
  `MOACode` varchar(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Claim_MEDICARE_MOAID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claim_medicare_supplemental_amount`
--

DROP TABLE IF EXISTS `claim_medicare_supplemental_amount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claim_medicare_supplemental_amount` (
  `Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID` int(10) NOT NULL AUTO_INCREMENT,
  `ClaimID` int(10) NOT NULL,
  `QualifierCode` int(10) NOT NULL,
  `MonetaryAmount2` decimal(19,4) NOT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claim_processxmltodb`
--

DROP TABLE IF EXISTS `claim_processxmltodb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claim_processxmltodb` (
  `Claim_ProcessXMLToDBID` int(10) NOT NULL AUTO_INCREMENT,
  `InterchangeID` int(10) NOT NULL,
  `ClaimXML` longtext NOT NULL,
  `ProviderID` varchar(20) DEFAULT NULL,
  `PatientID` int(10) DEFAULT NULL,
  `interchangeClaimID` varchar(50) DEFAULT NULL,
  `PossiblePatientID` varchar(75) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`Claim_ProcessXMLToDBID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claimassignment`
--

DROP TABLE IF EXISTS `claimassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claimassignment` (
  `ClaimAssignmentID` int(10) NOT NULL AUTO_INCREMENT,
  `ClaimID` int(10) NOT NULL,
  `UserID` int(10) NOT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AssignorID` int(10) DEFAULT NULL,
  `Note` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`ClaimAssignmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `claimstatus`
--

DROP TABLE IF EXISTS `claimstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `claimstatus` (
  `ClaimStatusID` int(10) NOT NULL AUTO_INCREMENT,
  `ClaimID` int(10) NOT NULL,
  `StatusID` int(10) NOT NULL,
  `UsersID` int(10) NOT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Note` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`ClaimStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientprovider`
--

DROP TABLE IF EXISTS `clientprovider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientprovider` (
  `ClientProviderID` int(10) NOT NULL AUTO_INCREMENT,
  `ClientID` int(10) NOT NULL,
  `ProviderID` varchar(50) NOT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`ClientProviderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `debug`
--

DROP TABLE IF EXISTS `debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debug` (
  `DebugID` int(10) NOT NULL AUTO_INCREMENT,
  `referenceID` varchar(50) DEFAULT NULL,
  `Note` varchar(8000) DEFAULT NULL,
  `TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tesst` double DEFAULT NULL,
  PRIMARY KEY (`DebugID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `DoctorID` int(10) NOT NULL AUTO_INCREMENT,
  `EntityID` int(10) DEFAULT NULL,
  `ClientDoctorID` varchar(30) DEFAULT NULL,
  `DoctorCategory` varchar(30) DEFAULT NULL,
  `UPIN` varchar(30) DEFAULT NULL,
  `MedicareNumber` varchar(30) DEFAULT NULL,
  `MedicaidNumber` varchar(30) DEFAULT NULL,
  `GroupName` varchar(30) DEFAULT NULL,
  `SpecialInstructions` varchar(1000) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`DoctorID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dtproperties`
--

DROP TABLE IF EXISTS `dtproperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dtproperties` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `objectid` int(10) DEFAULT NULL,
  `property` varchar(64) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `uvalue` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lvalue` longblob,
  `version` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`property`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emailaddress`
--

DROP TABLE IF EXISTS `emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailaddress` (
  `EmailAddressID` int(10) NOT NULL AUTO_INCREMENT,
  `SiteID` int(10) DEFAULT NULL,
  `EntityID` int(10) NOT NULL,
  `EmailTypeID` int(10) DEFAULT NULL,
  `Email` varchar(120) NOT NULL,
  `IsDefault` char(1) NOT NULL DEFAULT '0',
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`EmailAddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employer`
--

DROP TABLE IF EXISTS `employer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employer` (
  `EmployerID` int(10) NOT NULL AUTO_INCREMENT,
  `EmployerName` varchar(80) DEFAULT NULL,
  `EmployerDBA` varchar(80) DEFAULT NULL,
  `EntityID` int(10) DEFAULT NULL,
  `EmployerURL` varchar(150) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`EmployerID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entity`
--

DROP TABLE IF EXISTS `entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity` (
  `EntityID` int(10) NOT NULL AUTO_INCREMENT,
  `SiteID` int(10) DEFAULT NULL,
  `ClientID` int(10) DEFAULT NULL,
  `ObjectTypeID` int(10) NOT NULL DEFAULT '0',
  `PrefixName` varchar(10) DEFAULT NULL,
  `Fname` varchar(50) DEFAULT NULL,
  `Mname` varchar(50) DEFAULT NULL,
  `Lname` varchar(50) DEFAULT NULL,
  `SuffixName` varchar(10) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `Sex` int(10) DEFAULT NULL,
  `SSN` varchar(20) DEFAULT NULL,
  `MaritalStatus` int(10) DEFAULT NULL,
  `EmployerID` int(10) DEFAULT NULL,
  `Languages` varchar(15) DEFAULT NULL,
  `Weight` int(10) DEFAULT NULL,
  `HeightInInches` int(10) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`EntityID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entityaddress`
--

DROP TABLE IF EXISTS `entityaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityaddress` (
  `recordID` int(10) NOT NULL AUTO_INCREMENT,
  `EntityID` int(10) NOT NULL,
  `AddressID` int(10) NOT NULL,
  `IsDefault` char(1) NOT NULL DEFAULT '0',
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`recordID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entityphone`
--

DROP TABLE IF EXISTS `entityphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityphone` (
  `recordID` int(10) NOT NULL AUTO_INCREMENT,
  `EntityID` int(10) NOT NULL,
  `PhoneID` int(10) NOT NULL,
  `IsDefault` char(1) NOT NULL DEFAULT '0',
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`recordID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entityrs`
--

DROP TABLE IF EXISTS `entityrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityrs` (
  `EntityRSID` int(10) NOT NULL AUTO_INCREMENT,
  `EntityID` int(10) NOT NULL,
  `ColM` varchar(50) NOT NULL,
  `ColE` varchar(120) DEFAULT NULL,
  `ColL` varchar(120) DEFAULT NULL,
  `ColI` varchar(40) DEFAULT NULL,
  `ColA` varchar(40) DEFAULT NULL,
  `ColC` varchar(40) DEFAULT NULL,
  `ColR` varchar(50) DEFAULT NULL,
  `IsDefault` int(10) NOT NULL DEFAULT '0',
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`EntityRSID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entityss`
--

DROP TABLE IF EXISTS `entityss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityss` (
  `EntitySSID` int(10) NOT NULL AUTO_INCREMENT,
  `EntityID` int(10) NOT NULL,
  `ColM` varchar(120) DEFAULT NULL,
  `ColE` varchar(120) DEFAULT NULL,
  `ColR` varchar(50) DEFAULT NULL,
  `IsDefault` int(10) NOT NULL DEFAULT '0',
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`EntitySSID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entityts`
--

DROP TABLE IF EXISTS `entityts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityts` (
  `EntityTSID` int(10) NOT NULL AUTO_INCREMENT,
  `EntityID` int(10) NOT NULL,
  `ColM` varchar(120) DEFAULT NULL,
  `ColR` varchar(50) DEFAULT NULL,
  `IsDefault` int(10) NOT NULL DEFAULT '0',
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`EntityTSID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `FileID` int(10) NOT NULL AUTO_INCREMENT,
  `FileType` int(10) DEFAULT NULL,
  `ClientID` int(10) NOT NULL,
  `DisplayInGUID` int(10) DEFAULT '1',
  `ParentFileID` int(10) DEFAULT NULL,
  `UsersID` int(10) DEFAULT NULL,
  `FilePlacementDirectory` varchar(400) DEFAULT NULL,
  `AttemptedServerFile` varchar(200) DEFAULT NULL,
  `ClientDirectory` varchar(200) DEFAULT NULL,
  `ClientFile` varchar(200) DEFAULT NULL,
  `ClientFileExt` varchar(50) DEFAULT NULL,
  `ClientFileName` varchar(200) DEFAULT NULL,
  `ContentSubType` varchar(200) DEFAULT NULL,
  `ContentType` varchar(200) DEFAULT NULL,
  `DateLastAccessed` datetime DEFAULT NULL,
  `FileExisted` varchar(5) DEFAULT NULL,
  `FileSize` varchar(50) DEFAULT NULL,
  `FileWasAppended` varchar(5) DEFAULT NULL,
  `FileWasOverwritten` varchar(5) DEFAULT NULL,
  `FileWasRenamed` varchar(5) DEFAULT NULL,
  `FileWasSaved` varchar(5) DEFAULT NULL,
  `OldFileSize` varchar(50) DEFAULT NULL,
  `ServerDirectory` varchar(400) DEFAULT NULL,
  `ServerFile` varchar(100) DEFAULT NULL,
  `ServerFileExt` varchar(50) DEFAULT NULL,
  `ServerFileName` varchar(400) DEFAULT NULL,
  `TimeCreated` datetime DEFAULT NULL,
  `TimeLastModified` datetime DEFAULT NULL,
  `attributesXML` varchar(8000) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`FileID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fileprocess`
--

DROP TABLE IF EXISTS `fileprocess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fileprocess` (
  `FileProcessID` int(10) NOT NULL AUTO_INCREMENT,
  `FileID` int(10) NOT NULL,
  `StatusID` int(10) NOT NULL DEFAULT '94',
  `Note` varchar(4000) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`FileProcessID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imchat`
--

DROP TABLE IF EXISTS `imchat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imchat` (
  `RecordID` int(10) NOT NULL AUTO_INCREMENT,
  `UsersIDFrom` int(10) NOT NULL,
  `FromActive` char(1) NOT NULL DEFAULT '1',
  `UsersIDTo` int(10) NOT NULL,
  `ToActive` char(1) NOT NULL DEFAULT '1',
  `UsersIDJoined1` int(10) DEFAULT NULL,
  `Joined1Active` char(1) DEFAULT NULL,
  `UsersIDJoined2` int(10) DEFAULT NULL,
  `Joined2Active` char(1) DEFAULT NULL,
  `UsersIDJoined3` int(10) DEFAULT NULL,
  `Joined3Active` char(1) DEFAULT NULL,
  `IMChatXML` longtext,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`RecordID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insurancecompany`
--

DROP TABLE IF EXISTS `insurancecompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurancecompany` (
  `InsuranceCompanyID` int(10) NOT NULL AUTO_INCREMENT,
  `ClientID` int(10) DEFAULT NULL,
  `OCNANumber` varchar(30) DEFAULT NULL,
  `InsuranceCompanyName` varchar(80) DEFAULT NULL,
  `InsuranceCompanyDBA` varchar(80) DEFAULT NULL,
  `EntityID` int(10) DEFAULT NULL,
  `InsuranceCompanyURL` varchar(150) DEFAULT NULL,
  `LoginInstructionsXML` varchar(4000) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`InsuranceCompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `intake`
--

DROP TABLE IF EXISTS `intake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intake` (
  `IntakeID` int(10) NOT NULL AUTO_INCREMENT,
  `ClientID` int(10) NOT NULL,
  `AssignedToUserID` int(10) DEFAULT NULL,
  `hidden_Step` varchar(1000) DEFAULT NULL,
  `hidden_UsersID` varchar(10) DEFAULT NULL,
  `hidden_TimeStart` varchar(20) DEFAULT NULL,
  `OPTION_1_CBox_Delivery` varchar(10) DEFAULT NULL,
  `OPTION_1_CBox_Pickup` varchar(10) DEFAULT NULL,
  `OPTION_1_CBox_Repair` varchar(10) DEFAULT NULL,
  `OPTION_1_CBox_Switch` varchar(10) DEFAULT NULL,
  `OPTION_1_CBox_Existing` varchar(10) DEFAULT NULL,
  `OPTION_2_CBox_Other` varchar(10) DEFAULT NULL,
  `OPTION_2_CBox_Hospice` varchar(10) DEFAULT NULL,
  `OPTION_2_CBox_Hospital` varchar(10) DEFAULT NULL,
  `otherTBox` varchar(100) DEFAULT NULL,
  `hospiceTBox` varchar(100) DEFAULT NULL,
  `OPTION_3_CBox_Medicare` varchar(10) DEFAULT NULL,
  `OPTION_3_CBox_PrivateInsurance` varchar(10) DEFAULT NULL,
  `OPTION_3_CBox_Medicaid` varchar(10) DEFAULT NULL,
  `OPTION_3_CBox_PrivatePay` varchar(10) DEFAULT NULL,
  `hospitalTBox` varchar(100) DEFAULT NULL,
  `DischargeDateMM` varchar(10) DEFAULT NULL,
  `DischargeDateDD` varchar(10) DEFAULT NULL,
  `DischargeDateYY` varchar(10) DEFAULT NULL,
  `typeOfPay_Radio` varchar(10) DEFAULT NULL,
  `callerFNameTBox` varchar(50) DEFAULT NULL,
  `callerMInitialTBox` varchar(1) DEFAULT NULL,
  `callerLNameTBox` varchar(50) DEFAULT NULL,
  `callerPhoneTBox` varchar(20) DEFAULT NULL,
  `patientXML` varchar(8000) DEFAULT NULL,
  `patientID` int(10) DEFAULT NULL,
  `patientAddressID` int(10) DEFAULT NULL,
  `patientPhoneID` int(10) DEFAULT NULL,
  `roomNumberTBox` varchar(100) DEFAULT NULL,
  `bedNumberTBox` varchar(10) DEFAULT NULL,
  `alternateContactFNameTBox` varchar(50) DEFAULT NULL,
  `alternateContactMInitialTBox` varchar(1) DEFAULT NULL,
  `alternateContactLNameTBox` varchar(50) DEFAULT NULL,
  `alternateContactRelationshipTBox` varchar(100) DEFAULT NULL,
  `alternateContactPhoneTBox` varchar(100) DEFAULT NULL,
  `alternateContactWorkPhoneTBox` varchar(100) DEFAULT NULL,
  `poNumberTBox` varchar(25) DEFAULT NULL,
  `creditCardTypeTBox` varchar(30) DEFAULT NULL,
  `creditCardNumberTBox` varchar(22) DEFAULT NULL,
  `ccDateMM` varchar(10) DEFAULT NULL,
  `ccDateDD` varchar(10) DEFAULT NULL,
  `ccDateYY` varchar(10) DEFAULT NULL,
  `orderingPhysicianFNameTBox` varchar(50) DEFAULT NULL,
  `orderingPhysicianMInitialTBox` varchar(1) DEFAULT NULL,
  `orderingPhysicianLNameTBox` varchar(50) DEFAULT NULL,
  `orderingPhysicianPhoneTBox` varchar(20) DEFAULT NULL,
  `orderingPhysicianUPINTBox` varchar(30) DEFAULT NULL,
  `orderingPhysicianFaxTBox` varchar(20) DEFAULT NULL,
  `orderingPhysicianAddressTBox` varchar(100) DEFAULT NULL,
  `orderingPhysicianCityTBox` varchar(30) DEFAULT NULL,
  `orderingPhysicianStateTBox` varchar(20) DEFAULT NULL,
  `orderingPhysicianZipTBox` varchar(20) DEFAULT NULL,
  `OPTION_13_CBox_PastEquipmentYes` varchar(10) DEFAULT NULL,
  `OPTION_13_CBox_PastEquipmentNo` varchar(10) DEFAULT NULL,
  `Equipment1TypeTBox` varchar(100) DEFAULT NULL,
  `Equipment1RentPurchasedSelect` varchar(10) DEFAULT NULL,
  `Equipment1FromMM` varchar(10) DEFAULT NULL,
  `Equipment1FromDD` varchar(10) DEFAULT NULL,
  `Equipment1FromYY` varchar(10) DEFAULT NULL,
  `Equipment1ToMM` varchar(10) DEFAULT NULL,
  `Equipment1ToDD` varchar(10) DEFAULT NULL,
  `Equipment1ToYY` varchar(10) DEFAULT NULL,
  `Equipment1SupplierNameTBox` varchar(100) DEFAULT NULL,
  `Equipment1SupplierTelephoneTBox` varchar(20) DEFAULT NULL,
  `Equipment2TypeTBox` varchar(100) DEFAULT NULL,
  `Equipment2RentPurchasedSelect` varchar(10) DEFAULT NULL,
  `Equipment2FromMM` varchar(10) DEFAULT NULL,
  `Equipment2FromDD` varchar(10) DEFAULT NULL,
  `Equipment2FromYY` varchar(10) DEFAULT NULL,
  `Equipment2ToMM` varchar(10) DEFAULT NULL,
  `Equipment2ToDD` varchar(10) DEFAULT NULL,
  `Equipment2ToYY` varchar(10) DEFAULT NULL,
  `Equipment2SupplierNameTBox` varchar(100) DEFAULT NULL,
  `Equipment2SupplierTelephoneTBox` varchar(20) DEFAULT NULL,
  `Equipment3TypeTBox` varchar(100) DEFAULT NULL,
  `Equipment3RentPurchasedSelect` varchar(10) DEFAULT NULL,
  `Equipment3FromMM` varchar(10) DEFAULT NULL,
  `Equipment3FromDD` varchar(10) DEFAULT NULL,
  `Equipment3FromYY` varchar(10) DEFAULT NULL,
  `Equipment3ToMM` varchar(10) DEFAULT NULL,
  `Equipment3ToDD` varchar(10) DEFAULT NULL,
  `Equipment3ToYY` varchar(10) DEFAULT NULL,
  `Equipment3SupplierNameTBox` varchar(100) DEFAULT NULL,
  `Equipment3SupplierTelephoneTBox` varchar(20) DEFAULT NULL,
  `Equipment4TypeTBox` varchar(100) DEFAULT NULL,
  `Equipment4RentPurchasedSelect` varchar(10) DEFAULT NULL,
  `Equipment4FromMM` varchar(10) DEFAULT NULL,
  `Equipment4FromDD` varchar(10) DEFAULT NULL,
  `Equipment4FromYY` varchar(10) DEFAULT NULL,
  `Equipment4ToMM` varchar(10) DEFAULT NULL,
  `Equipment4ToDD` varchar(10) DEFAULT NULL,
  `Equipment4ToYY` varchar(10) DEFAULT NULL,
  `Equipment4SupplierNameTBox` varchar(100) DEFAULT NULL,
  `Equipment4SupplierTelephoneTBox` varchar(20) DEFAULT NULL,
  `Equipment5TypeTBox` varchar(100) DEFAULT NULL,
  `Equipment5RentPurchasedSelect` varchar(10) DEFAULT NULL,
  `Equipment5FromMM` varchar(10) DEFAULT NULL,
  `Equipment5FromDD` varchar(10) DEFAULT NULL,
  `Equipment5FromYY` varchar(10) DEFAULT NULL,
  `Equipment5ToMM` varchar(10) DEFAULT NULL,
  `Equipment5ToDD` varchar(10) DEFAULT NULL,
  `Equipment5ToYY` varchar(10) DEFAULT NULL,
  `Equipment5SupplierNameTBox` varchar(100) DEFAULT NULL,
  `Equipment5SupplierTelephoneTBox` varchar(20) DEFAULT NULL,
  `Equipment1NoteTBox` varchar(200) DEFAULT NULL,
  `Equipment2NoteTBox` varchar(200) DEFAULT NULL,
  `Equipment3NoteTBox` varchar(200) DEFAULT NULL,
  `Equipment4NoteTBox` varchar(200) DEFAULT NULL,
  `Equipment5NoteTBox` varchar(200) DEFAULT NULL,
  `OPTION_14_CBox_OxygenPAo2` varchar(10) DEFAULT NULL,
  `OPTION_14_CBox_OxygenSAo2` varchar(10) DEFAULT NULL,
  `OPTION_14_CBox_OxygenSPo2` varchar(10) DEFAULT NULL,
  `OxygenPAO2TBox` varchar(10) DEFAULT NULL,
  `OxygenSAO2TBox` varchar(10) DEFAULT NULL,
  `CPAPStudy_CBox` varchar(10) DEFAULT NULL,
  `CPAPStudyNote` varchar(100) DEFAULT NULL,
  `OxygenSPO2TBox` varchar(10) DEFAULT NULL,
  `CPAPStudyOnFile_CBox` varchar(10) DEFAULT NULL,
  `CPAPStudyOnFileNote` varchar(100) DEFAULT NULL,
  `LabTestDateMM` varchar(10) DEFAULT NULL,
  `LabTestDateDD` varchar(10) DEFAULT NULL,
  `LabTestDateYY` varchar(10) DEFAULT NULL,
  `CPAPStudyPerformedAt` varchar(100) DEFAULT NULL,
  `LabTestFacilityTBox` varchar(100) DEFAULT NULL,
  `CPAPStudyPerformedAt2` varchar(100) DEFAULT NULL,
  `CPAPStudyPerformedAt3` varchar(100) DEFAULT NULL,
  `ClosingInvoiceNumber` varchar(15) DEFAULT NULL,
  `OPTION_SkilledNursing` char(1) DEFAULT NULL,
  `SkilledNursingName` varchar(80) DEFAULT NULL,
  `SkilledNursingTelephone` varchar(20) DEFAULT NULL,
  `Printed` varchar(4000) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`IntakeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `intakeassignment`
--

DROP TABLE IF EXISTS `intakeassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intakeassignment` (
  `INTAKE_AssignmentID` int(10) NOT NULL AUTO_INCREMENT,
  `IntakeID` int(10) NOT NULL,
  `UserID` int(10) NOT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AssignorID` int(10) DEFAULT NULL,
  `Note` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`INTAKE_AssignmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `intakeautosave`
--

DROP TABLE IF EXISTS `intakeautosave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intakeautosave` (
  `RecordID` int(10) NOT NULL AUTO_INCREMENT,
  `UsersID` int(10) NOT NULL,
  `PatientFName` varchar(30) NOT NULL,
  `PatientLName` varchar(30) NOT NULL,
  `IntakeXML` longtext,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`RecordID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `intakehcpc`
--

DROP TABLE IF EXISTS `intakehcpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intakehcpc` (
  `IntakeHCPCID` int(10) NOT NULL AUTO_INCREMENT,
  `IntakeID` int(10) NOT NULL,
  `hcpcCode1TBox` varchar(100) DEFAULT NULL,
  `hcpcQty1TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct1TBox` varchar(100) DEFAULT NULL,
  `hcpcDX1TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis1TBox` varchar(100) DEFAULT NULL,
  `hcpcCost1TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear1TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth1TBox` varchar(10) DEFAULT NULL,
  `hcpcCode2TBox` varchar(100) DEFAULT NULL,
  `hcpcQty2TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct2TBox` varchar(100) DEFAULT NULL,
  `hcpcDX2TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis2TBox` varchar(100) DEFAULT NULL,
  `hcpcCost2TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear2TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth2TBox` varchar(10) DEFAULT NULL,
  `hcpcCode3TBox` varchar(100) DEFAULT NULL,
  `hcpcQty3TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct3TBox` varchar(100) DEFAULT NULL,
  `hcpcDX3TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis3TBox` varchar(100) DEFAULT NULL,
  `hcpcCost3TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear3TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth3TBox` varchar(10) DEFAULT NULL,
  `hcpcCode4TBox` varchar(100) DEFAULT NULL,
  `hcpcQty4TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct4TBox` varchar(100) DEFAULT NULL,
  `hcpcDX4TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis4TBox` varchar(100) DEFAULT NULL,
  `hcpcCost4TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear4TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth4TBox` varchar(10) DEFAULT NULL,
  `hcpcCode5TBox` varchar(100) DEFAULT NULL,
  `hcpcQty5TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct5TBox` varchar(100) DEFAULT NULL,
  `hcpcDX5TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis5TBox` varchar(100) DEFAULT NULL,
  `hcpcCost5TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear5TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth5TBox` varchar(10) DEFAULT NULL,
  `hcpcCode6TBox` varchar(100) DEFAULT NULL,
  `hcpcQty6TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct6TBox` varchar(100) DEFAULT NULL,
  `hcpcDX6TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis6TBox` varchar(100) DEFAULT NULL,
  `hcpcCost6TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear6TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth6TBox` varchar(10) DEFAULT NULL,
  `hcpcCode7TBox` varchar(100) DEFAULT NULL,
  `hcpcQty7TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct7TBox` varchar(100) DEFAULT NULL,
  `hcpcDX7TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis7TBox` varchar(100) DEFAULT NULL,
  `hcpcCost7TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear7TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth7TBox` varchar(10) DEFAULT NULL,
  `hcpcCode8TBox` varchar(100) DEFAULT NULL,
  `hcpcQty8TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct8TBox` varchar(100) DEFAULT NULL,
  `hcpcDX8TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis8TBox` varchar(100) DEFAULT NULL,
  `hcpcCost8TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear8TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth8TBox` varchar(10) DEFAULT NULL,
  `hcpcCode9TBox` varchar(100) DEFAULT NULL,
  `hcpcQty9TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct9TBox` varchar(100) DEFAULT NULL,
  `hcpcDX9TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis9TBox` varchar(100) DEFAULT NULL,
  `hcpcCost9TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear9TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth9TBox` varchar(10) DEFAULT NULL,
  `hcpcCode10TBox` varchar(100) DEFAULT NULL,
  `hcpcQty10TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct10TBox` varchar(100) DEFAULT NULL,
  `hcpcDX10TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis10TBox` varchar(100) DEFAULT NULL,
  `hcpcCost10TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear10TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth10TBox` varchar(10) DEFAULT NULL,
  `hcpcCode11TBox` varchar(100) DEFAULT NULL,
  `hcpcQty11TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct11TBox` varchar(100) DEFAULT NULL,
  `hcpcDX11TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis11TBox` varchar(100) DEFAULT NULL,
  `hcpcCost11TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear11TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth11TBox` varchar(10) DEFAULT NULL,
  `hcpcCode12TBox` varchar(100) DEFAULT NULL,
  `hcpcQty12TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct12TBox` varchar(100) DEFAULT NULL,
  `hcpcDX12TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis12TBox` varchar(100) DEFAULT NULL,
  `hcpcCost12TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear12TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth12TBox` varchar(10) DEFAULT NULL,
  `hcpcCode13TBox` varchar(100) DEFAULT NULL,
  `hcpcQty13TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct13TBox` varchar(100) DEFAULT NULL,
  `hcpcDX13TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis13TBox` varchar(100) DEFAULT NULL,
  `hcpcCost13TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear13TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth13TBox` varchar(10) DEFAULT NULL,
  `hcpcCode14TBox` varchar(100) DEFAULT NULL,
  `hcpcQty14TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct14TBox` varchar(100) DEFAULT NULL,
  `hcpcDX14TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis14TBox` varchar(100) DEFAULT NULL,
  `hcpcCost14TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear14TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth14TBox` varchar(10) DEFAULT NULL,
  `hcpcCode15TBox` varchar(100) DEFAULT NULL,
  `hcpcQty15TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct15TBox` varchar(100) DEFAULT NULL,
  `hcpcDX15TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis15TBox` varchar(100) DEFAULT NULL,
  `hcpcCost15TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear15TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth15TBox` varchar(10) DEFAULT NULL,
  `hcpcCode16TBox` varchar(100) DEFAULT NULL,
  `hcpcQty16TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct16TBox` varchar(100) DEFAULT NULL,
  `hcpcDX16TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis16TBox` varchar(100) DEFAULT NULL,
  `hcpcCost16TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear16TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth16TBox` varchar(10) DEFAULT NULL,
  `hcpcCode17TBox` varchar(100) DEFAULT NULL,
  `hcpcQty17TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct17TBox` varchar(100) DEFAULT NULL,
  `hcpcDX17TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis17TBox` varchar(100) DEFAULT NULL,
  `hcpcCost17TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear17TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth17TBox` varchar(10) DEFAULT NULL,
  `hcpcCode18TBox` varchar(100) DEFAULT NULL,
  `hcpcQty18TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct18TBox` varchar(100) DEFAULT NULL,
  `hcpcDX18TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis18TBox` varchar(100) DEFAULT NULL,
  `hcpcCost18TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear18TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth18TBox` varchar(10) DEFAULT NULL,
  `hcpcCode19TBox` varchar(100) DEFAULT NULL,
  `hcpcQty19TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct19TBox` varchar(100) DEFAULT NULL,
  `hcpcDX19TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis19TBox` varchar(100) DEFAULT NULL,
  `hcpcCost19TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear19TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth19TBox` varchar(10) DEFAULT NULL,
  `hcpcCode20TBox` varchar(100) DEFAULT NULL,
  `hcpcQty20TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct20TBox` varchar(100) DEFAULT NULL,
  `hcpcDX20TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis20TBox` varchar(100) DEFAULT NULL,
  `hcpcCost20TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear20TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth20TBox` varchar(10) DEFAULT NULL,
  `hcpcCode21TBox` varchar(100) DEFAULT NULL,
  `hcpcQty21TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct21TBox` varchar(100) DEFAULT NULL,
  `hcpcDX21TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis21TBox` varchar(100) DEFAULT NULL,
  `hcpcCost21TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear21TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth21TBox` varchar(10) DEFAULT NULL,
  `hcpcCode22TBox` varchar(100) DEFAULT NULL,
  `hcpcQty22TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct22TBox` varchar(100) DEFAULT NULL,
  `hcpcDX22TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis22TBox` varchar(100) DEFAULT NULL,
  `hcpcCost22TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear22TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth22TBox` varchar(10) DEFAULT NULL,
  `hcpcCode23TBox` varchar(100) DEFAULT NULL,
  `hcpcQty23TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct23TBox` varchar(100) DEFAULT NULL,
  `hcpcDX23TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis23TBox` varchar(100) DEFAULT NULL,
  `hcpcCost23TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear23TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth23TBox` varchar(10) DEFAULT NULL,
  `hcpcCode24TBox` varchar(100) DEFAULT NULL,
  `hcpcQty24TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct24TBox` varchar(100) DEFAULT NULL,
  `hcpcDX24TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis24TBox` varchar(100) DEFAULT NULL,
  `hcpcCost24TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear24TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth24TBox` varchar(10) DEFAULT NULL,
  `hcpcCode25TBox` varchar(100) DEFAULT NULL,
  `hcpcQty25TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct25TBox` varchar(100) DEFAULT NULL,
  `hcpcDX25TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis25TBox` varchar(100) DEFAULT NULL,
  `hcpcCost25TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear25TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth25TBox` varchar(10) DEFAULT NULL,
  `hcpcCode26TBox` varchar(100) DEFAULT NULL,
  `hcpcQty26TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct26TBox` varchar(100) DEFAULT NULL,
  `hcpcDX26TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis26TBox` varchar(100) DEFAULT NULL,
  `hcpcCost26TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear26TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth26TBox` varchar(10) DEFAULT NULL,
  `hcpcCode27TBox` varchar(100) DEFAULT NULL,
  `hcpcQty27TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct27TBox` varchar(100) DEFAULT NULL,
  `hcpcDX27TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis27TBox` varchar(100) DEFAULT NULL,
  `hcpcCost27TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear27TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth27TBox` varchar(10) DEFAULT NULL,
  `hcpcCode28TBox` varchar(100) DEFAULT NULL,
  `hcpcQty28TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct28TBox` varchar(100) DEFAULT NULL,
  `hcpcDX28TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis28TBox` varchar(100) DEFAULT NULL,
  `hcpcCost28TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear28TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth28TBox` varchar(10) DEFAULT NULL,
  `hcpcCode29TBox` varchar(100) DEFAULT NULL,
  `hcpcQty29TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct29TBox` varchar(100) DEFAULT NULL,
  `hcpcDX29TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis29TBox` varchar(100) DEFAULT NULL,
  `hcpcCost29TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear29TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth29TBox` varchar(10) DEFAULT NULL,
  `hcpcCode30TBox` varchar(100) DEFAULT NULL,
  `hcpcQty30TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct30TBox` varchar(100) DEFAULT NULL,
  `hcpcDX30TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis30TBox` varchar(100) DEFAULT NULL,
  `hcpcCost30TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear30TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth30TBox` varchar(10) DEFAULT NULL,
  `hcpcCode31TBox` varchar(100) DEFAULT NULL,
  `hcpcQty31TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct31TBox` varchar(100) DEFAULT NULL,
  `hcpcDX31TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis31TBox` varchar(100) DEFAULT NULL,
  `hcpcCost31TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear31TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth31TBox` varchar(10) DEFAULT NULL,
  `hcpcCode32TBox` varchar(100) DEFAULT NULL,
  `hcpcQty32TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct32TBox` varchar(100) DEFAULT NULL,
  `hcpcDX32TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis32TBox` varchar(100) DEFAULT NULL,
  `hcpcCost32TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear32TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth32TBox` varchar(10) DEFAULT NULL,
  `hcpcCode33TBox` varchar(100) DEFAULT NULL,
  `hcpcQty33TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct33TBox` varchar(100) DEFAULT NULL,
  `hcpcDX33TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis33TBox` varchar(100) DEFAULT NULL,
  `hcpcCost33TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear33TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth33TBox` varchar(10) DEFAULT NULL,
  `hcpcCode34TBox` varchar(100) DEFAULT NULL,
  `hcpcQty34TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct34TBox` varchar(100) DEFAULT NULL,
  `hcpcDX34TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis34TBox` varchar(100) DEFAULT NULL,
  `hcpcCost34TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear34TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth34TBox` varchar(10) DEFAULT NULL,
  `hcpcCode35TBox` varchar(100) DEFAULT NULL,
  `hcpcQty35TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct35TBox` varchar(100) DEFAULT NULL,
  `hcpcDX35TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis35TBox` varchar(100) DEFAULT NULL,
  `hcpcCost35TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear35TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth35TBox` varchar(10) DEFAULT NULL,
  `hcpcCode36TBox` varchar(100) DEFAULT NULL,
  `hcpcQty36TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct36TBox` varchar(100) DEFAULT NULL,
  `hcpcDX36TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis36TBox` varchar(100) DEFAULT NULL,
  `hcpcCost36TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear36TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth36TBox` varchar(10) DEFAULT NULL,
  `hcpcCode37TBox` varchar(100) DEFAULT NULL,
  `hcpcQty37TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct37TBox` varchar(100) DEFAULT NULL,
  `hcpcDX37TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis37TBox` varchar(100) DEFAULT NULL,
  `hcpcCost37TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear37TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth37TBox` varchar(10) DEFAULT NULL,
  `hcpcCode38TBox` varchar(100) DEFAULT NULL,
  `hcpcQty38TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct38TBox` varchar(100) DEFAULT NULL,
  `hcpcDX38TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis38TBox` varchar(100) DEFAULT NULL,
  `hcpcCost38TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear38TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth38TBox` varchar(10) DEFAULT NULL,
  `hcpcCode39TBox` varchar(100) DEFAULT NULL,
  `hcpcQty39TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct39TBox` varchar(100) DEFAULT NULL,
  `hcpcDX39TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis39TBox` varchar(100) DEFAULT NULL,
  `hcpcCost39TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear39TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth39TBox` varchar(10) DEFAULT NULL,
  `hcpcCode40TBox` varchar(100) DEFAULT NULL,
  `hcpcQty40TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct40TBox` varchar(100) DEFAULT NULL,
  `hcpcDX40TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis40TBox` varchar(100) DEFAULT NULL,
  `hcpcCost40TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear40TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth40TBox` varchar(10) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`IntakeHCPCID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `interchange`
--

DROP TABLE IF EXISTS `interchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interchange` (
  `InterchangeID` int(10) NOT NULL AUTO_INCREMENT,
  `FileID` int(10) NOT NULL,
  `InterchangeFileID` varchar(50) NOT NULL,
  `InterchangeDate` datetime NOT NULL,
  `ClientID` int(10) NOT NULL,
  `InterchangeClientName` varchar(50) DEFAULT NULL,
  `InterchangeClientAddressLine1` varchar(80) DEFAULT NULL,
  `InterchangeClientAddressLine2` varchar(50) DEFAULT NULL,
  `InterchangeClientCity` varchar(50) DEFAULT NULL,
  `InterchangeClientState` varchar(25) DEFAULT NULL,
  `InterchangeClientZipcode` varchar(10) DEFAULT NULL,
  `LXAssignedNumber` varchar(5) DEFAULT NULL,
  `ReassociationTraceNumber` varchar(30) DEFAULT NULL,
  `InterchangeSenderIDQualifier` varchar(2) DEFAULT NULL,
  `InterchangeSenderID` varchar(15) DEFAULT NULL,
  `InterchangeReceiverIDQualifier` varchar(2) DEFAULT NULL,
  `InterchangeReceiverID` varchar(15) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`InterchangeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `LogID` int(10) NOT NULL AUTO_INCREMENT,
  `Code` int(10) DEFAULT NULL,
  `IPaddress` varchar(25) DEFAULT NULL,
  `LogText` longtext,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`LogID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `NoteID` int(10) NOT NULL AUTO_INCREMENT,
  `ClientID` int(10) NOT NULL,
  `ObjectID` int(10) NOT NULL,
  `InstanceID` int(10) DEFAULT NULL,
  `Note` longtext,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`NoteID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pagehit`
--

DROP TABLE IF EXISTS `pagehit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagehit` (
  `PageHitID` int(10) NOT NULL AUTO_INCREMENT,
  `PageID` int(10) DEFAULT NULL,
  `SiteID` int(10) DEFAULT NULL,
  `UsersID` int(10) DEFAULT NULL,
  `IPAddress` varchar(16) DEFAULT NULL,
  `BrowserType` varchar(100) DEFAULT NULL,
  `BrowserVersion` varchar(100) DEFAULT NULL,
  `OperatingSystem` varchar(100) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`PageHitID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `PatientID` int(10) NOT NULL AUTO_INCREMENT,
  `EntityID` int(10) DEFAULT NULL,
  `ClaimSubmitterIdentifier` varchar(38) DEFAULT NULL,
  `NM1IdentificationCode9` varchar(80) DEFAULT NULL,
  `AccountNumber` varchar(25) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`PatientID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patientinsurancecompany`
--

DROP TABLE IF EXISTS `patientinsurancecompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientinsurancecompany` (
  `recordID` int(10) NOT NULL AUTO_INCREMENT,
  `PatientID` int(10) NOT NULL,
  `InsuranceCompanyID` int(10) NOT NULL,
  `PrimSecTer` int(10) DEFAULT NULL,
  `PolicyNumber` varchar(50) DEFAULT NULL,
  `PolicyHoldersFirstName` varchar(30) DEFAULT NULL,
  `PolicyHoldersLastName` varchar(30) DEFAULT NULL,
  `PolicyHoldersMiddleInitial` varchar(1) DEFAULT NULL,
  `PolicyHoldersDOB` datetime DEFAULT NULL,
  `PolicyHoldersSex` int(10) DEFAULT NULL,
  `PolicyHoldersAddressLine1` varchar(50) DEFAULT NULL,
  `PolicyHoldersAddressLine2` varchar(50) DEFAULT NULL,
  `PolicyHoldersCity` varchar(25) DEFAULT NULL,
  `PolicyHoldersStateID` int(10) DEFAULT NULL,
  `PolicyHoldersZipCode` varchar(15) DEFAULT NULL,
  `PolicyHoldersPhone` varchar(15) DEFAULT NULL,
  `PolicyHoldersPhoneExtension` varchar(5) DEFAULT NULL,
  `PolicyHoldersEmployerSchoolName` varchar(45) DEFAULT NULL,
  `PolicyHoldersEffectiveDateFrom` datetime DEFAULT NULL,
  `PolicyHoldersEffectiveDateTo` datetime DEFAULT NULL,
  `GroupNumber` varchar(50) DEFAULT NULL,
  `GroupName` varchar(50) DEFAULT NULL,
  `Deductible` decimal(19,4) DEFAULT NULL,
  `PayPercentage` int(10) DEFAULT NULL,
  `Relationship` int(10) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`recordID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone` (
  `PhoneID` int(10) NOT NULL AUTO_INCREMENT,
  `SiteID` int(10) DEFAULT NULL,
  `PhoneTypeID` char(10) DEFAULT NULL,
  `PhoneNumber` varchar(100) DEFAULT NULL,
  `PhoneExtension` varchar(50) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`PhoneID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `procedure`
--

DROP TABLE IF EXISTS `procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedure` (
  `ProcedureID` int(10) NOT NULL AUTO_INCREMENT,
  `ClaimID` int(10) NOT NULL,
  `ProcedureCode` int(10) NOT NULL,
  `PriorProcedureCode` varchar(75) DEFAULT NULL,
  `ServiceDateFrom` datetime DEFAULT NULL,
  `ServiceDateTo` datetime DEFAULT NULL,
  `BilledQuantity` double DEFAULT NULL,
  `BilledAmount` decimal(19,4) DEFAULT NULL,
  `PaidQuantity` double DEFAULT NULL,
  `PaidAmount` decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (`ProcedureID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `procedure_medicare_claimadjustment`
--

DROP TABLE IF EXISTS `procedure_medicare_claimadjustment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedure_medicare_claimadjustment` (
  `Procedure_MEDICARE_CLAIMADJUSTMENTID` int(10) NOT NULL AUTO_INCREMENT,
  `ProcedureID` int(10) NOT NULL,
  `ClaimAdjustmentGroupCode1` int(10) NOT NULL,
  `ClaimAdjustmentReasonCode2` int(10) NOT NULL,
  `MonetaryAmount3` decimal(19,4) NOT NULL,
  `Quantity4` double DEFAULT NULL,
  `ClaimAdjustmentReasonCode5` int(10) DEFAULT NULL,
  `MonetaryAmount6` decimal(19,4) DEFAULT NULL,
  `Quantity7` double DEFAULT NULL,
  `ClaimAdjustmentReasonCode8` char(10) DEFAULT NULL,
  `MonetaryAmount9` decimal(19,4) DEFAULT NULL,
  `Quantity10` double DEFAULT NULL,
  `ClaimAdjustmentReasonCode11` int(10) DEFAULT NULL,
  `MonetaryAmount12` decimal(19,4) DEFAULT NULL,
  `Quantity13` double DEFAULT NULL,
  `ClaimAdjustmentReasonCode14` int(10) DEFAULT NULL,
  `MonetaryAmount15` decimal(19,4) DEFAULT NULL,
  `Quantity16` double DEFAULT NULL,
  `ClaimAdjustmentReasonCode17` int(10) DEFAULT NULL,
  `MonetaryAmount18` decimal(19,4) DEFAULT NULL,
  `Quantity19` double DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`Procedure_MEDICARE_CLAIMADJUSTMENTID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `procedure_medicare_modifier`
--

DROP TABLE IF EXISTS `procedure_medicare_modifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedure_medicare_modifier` (
  `Procedure_MEDICARE_MODIFIERID` int(10) NOT NULL AUTO_INCREMENT,
  `ProcedureID` int(10) NOT NULL,
  `ModifierCode` int(10) DEFAULT NULL,
  `Description` varchar(2000) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Procedure_MEDICARE_MODIFIERID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `procedure_medicare_remark_code`
--

DROP TABLE IF EXISTS `procedure_medicare_remark_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedure_medicare_remark_code` (
  `Procedure_MEDICARE_REMARK_CODEID` int(10) NOT NULL AUTO_INCREMENT,
  `ProcedureID` int(10) NOT NULL,
  `QualifierCode` varchar(5) NOT NULL,
  `IndustryCode` varchar(10) NOT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`Procedure_MEDICARE_REMARK_CODEID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `procedure_medicare_supplemental_amount`
--

DROP TABLE IF EXISTS `procedure_medicare_supplemental_amount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedure_medicare_supplemental_amount` (
  `Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID` int(10) NOT NULL AUTO_INCREMENT,
  `ProcedureID` int(10) NOT NULL,
  `QualifierCode` int(10) NOT NULL,
  `MonetaryAmount2` decimal(19,4) NOT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `procedureeobcode`
--

DROP TABLE IF EXISTS `procedureeobcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedureeobcode` (
  `ClaimEOBCodeID` int(10) NOT NULL AUTO_INCREMENT,
  `ProcedureID` int(10) NOT NULL,
  `EOBCode` int(10) NOT NULL,
  `Status` char(10) DEFAULT NULL,
  `ClosingUserID` int(10) DEFAULT NULL,
  `CloseDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ClaimEOBCodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `procedureeopscode`
--

DROP TABLE IF EXISTS `procedureeopscode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedureeopscode` (
  `ClaimEOPSCodeID` int(10) NOT NULL AUTO_INCREMENT,
  `ProcedureID` int(10) NOT NULL,
  `EOPSCode` int(10) NOT NULL,
  `Status` char(10) DEFAULT NULL,
  `ClosingUserID` int(10) DEFAULT NULL,
  `CloseDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ClaimEOPSCodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `procedureopenclose`
--

DROP TABLE IF EXISTS `procedureopenclose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedureopenclose` (
  `ProcedureOpenCloseID` int(10) NOT NULL AUTO_INCREMENT,
  `ProcedureID` int(10) DEFAULT NULL,
  `OpenOrClose` int(10) NOT NULL,
  `UsersID` int(10) NOT NULL,
  `Note` varchar(4000) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`ProcedureOpenCloseID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quote`
--

DROP TABLE IF EXISTS `quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote` (
  `QuoteID` int(10) NOT NULL AUTO_INCREMENT,
  `ClientID` int(10) NOT NULL,
  `AssignedToUserID` int(10) DEFAULT NULL,
  `hidden_UsersID` varchar(10) DEFAULT NULL,
  `hidden_TimeStart` varchar(20) DEFAULT NULL,
  `callerFNameTBox` varchar(50) DEFAULT NULL,
  `callerMInitialTBox` varchar(1) DEFAULT NULL,
  `callerLNameTBox` varchar(50) DEFAULT NULL,
  `callerPhoneTBox` varchar(20) DEFAULT NULL,
  `patientFNameTBox` varchar(50) DEFAULT NULL,
  `patientMInitialTBox` varchar(1) DEFAULT NULL,
  `patientLNameTBox` varchar(50) DEFAULT NULL,
  `roomNumberTBox` varchar(100) DEFAULT NULL,
  `bedNumberTBox` varchar(10) DEFAULT NULL,
  `patientAddressTBox` varchar(100) DEFAULT NULL,
  `patientCityTBox` varchar(30) DEFAULT NULL,
  `patientStateTBox` varchar(20) DEFAULT NULL,
  `patientZipTBox` varchar(20) DEFAULT NULL,
  `patientPhoneTBox` varchar(20) DEFAULT NULL,
  `patientDOBMM` varchar(10) DEFAULT NULL,
  `patientDOBDD` varchar(10) DEFAULT NULL,
  `patientDOBYY` varchar(10) DEFAULT NULL,
  `OPTION_3a_CBox_PatientSexMale` varchar(10) DEFAULT NULL,
  `OPTION_3a_CBox_PatientSexFemale` varchar(10) DEFAULT NULL,
  `patientSSNTBox` varchar(20) DEFAULT NULL,
  `patientHeightFeet` varchar(10) DEFAULT NULL,
  `patientHeightInches` varchar(10) DEFAULT NULL,
  `patientWeightTBox` varchar(100) DEFAULT NULL,
  `alternateContactFNameTBox` varchar(50) DEFAULT NULL,
  `alternateContactMInitialTBox` varchar(1) DEFAULT NULL,
  `alternateContactLNameTBox` varchar(50) DEFAULT NULL,
  `alternateContactRelationshipTBox` varchar(100) DEFAULT NULL,
  `alternateContactPhoneTBox` varchar(100) DEFAULT NULL,
  `alternateContactWorkPhoneTBox` varchar(100) DEFAULT NULL,
  `primaryInsuranceNameTBox` varchar(100) DEFAULT NULL,
  `secondaryInsuranceNameTBox` varchar(100) DEFAULT NULL,
  `primaryPolicyNumberTBox` varchar(100) DEFAULT NULL,
  `secondaryPolicyNumberTBox` varchar(100) DEFAULT NULL,
  `orderingPhysicianFNameTBox` varchar(50) DEFAULT NULL,
  `orderingPhysicianMInitialTBox` varchar(1) DEFAULT NULL,
  `orderingPhysicianLNameTBox` varchar(50) DEFAULT NULL,
  `orderingPhysicianPhoneTBox` varchar(20) DEFAULT NULL,
  `printed` varchar(4000) DEFAULT NULL,
  `Cancelled` char(1) DEFAULT '0',
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`QuoteID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quotehcpc`
--

DROP TABLE IF EXISTS `quotehcpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotehcpc` (
  `QuoteHCPCID` int(10) NOT NULL AUTO_INCREMENT,
  `QuoteID` int(10) NOT NULL,
  `hcpcCode1TBox` varchar(100) DEFAULT NULL,
  `hcpcQty1TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct1TBox` varchar(100) DEFAULT NULL,
  `hcpcDX1TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis1TBox` varchar(100) DEFAULT NULL,
  `hcpcCost1TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear1TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth1TBox` varchar(10) DEFAULT NULL,
  `hcpcCode2TBox` varchar(100) DEFAULT NULL,
  `hcpcQty2TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct2TBox` varchar(100) DEFAULT NULL,
  `hcpcDX2TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis2TBox` varchar(100) DEFAULT NULL,
  `hcpcCost2TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear2TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth2TBox` varchar(10) DEFAULT NULL,
  `hcpcCode3TBox` varchar(100) DEFAULT NULL,
  `hcpcQty3TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct3TBox` varchar(100) DEFAULT NULL,
  `hcpcDX3TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis3TBox` varchar(100) DEFAULT NULL,
  `hcpcCost3TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear3TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth3TBox` varchar(10) DEFAULT NULL,
  `hcpcCode4TBox` varchar(100) DEFAULT NULL,
  `hcpcQty4TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct4TBox` varchar(100) DEFAULT NULL,
  `hcpcDX4TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis4TBox` varchar(100) DEFAULT NULL,
  `hcpcCost4TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear4TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth4TBox` varchar(10) DEFAULT NULL,
  `hcpcCode5TBox` varchar(100) DEFAULT NULL,
  `hcpcQty5TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct5TBox` varchar(100) DEFAULT NULL,
  `hcpcDX5TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis5TBox` varchar(100) DEFAULT NULL,
  `hcpcCost5TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear5TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth5TBox` varchar(10) DEFAULT NULL,
  `hcpcCode6TBox` varchar(100) DEFAULT NULL,
  `hcpcQty6TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct6TBox` varchar(100) DEFAULT NULL,
  `hcpcDX6TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis6TBox` varchar(100) DEFAULT NULL,
  `hcpcCost6TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear6TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth6TBox` varchar(10) DEFAULT NULL,
  `hcpcCode7TBox` varchar(100) DEFAULT NULL,
  `hcpcQty7TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct7TBox` varchar(100) DEFAULT NULL,
  `hcpcDX7TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis7TBox` varchar(100) DEFAULT NULL,
  `hcpcCost7TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear7TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth7TBox` varchar(10) DEFAULT NULL,
  `hcpcCode8TBox` varchar(100) DEFAULT NULL,
  `hcpcQty8TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct8TBox` varchar(100) DEFAULT NULL,
  `hcpcDX8TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis8TBox` varchar(100) DEFAULT NULL,
  `hcpcCost8TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear8TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth8TBox` varchar(10) DEFAULT NULL,
  `hcpcCode9TBox` varchar(100) DEFAULT NULL,
  `hcpcQty9TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct9TBox` varchar(100) DEFAULT NULL,
  `hcpcDX9TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis9TBox` varchar(100) DEFAULT NULL,
  `hcpcCost9TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear9TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth9TBox` varchar(10) DEFAULT NULL,
  `hcpcCode10TBox` varchar(100) DEFAULT NULL,
  `hcpcQty10TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct10TBox` varchar(100) DEFAULT NULL,
  `hcpcDX10TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis10TBox` varchar(100) DEFAULT NULL,
  `hcpcCost10TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear10TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth10TBox` varchar(10) DEFAULT NULL,
  `hcpcCode11TBox` varchar(100) DEFAULT NULL,
  `hcpcQty11TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct11TBox` varchar(100) DEFAULT NULL,
  `hcpcDX11TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis11TBox` varchar(100) DEFAULT NULL,
  `hcpcCost11TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear11TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth11TBox` varchar(10) DEFAULT NULL,
  `hcpcCode12TBox` varchar(100) DEFAULT NULL,
  `hcpcQty12TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct12TBox` varchar(100) DEFAULT NULL,
  `hcpcDX12TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis12TBox` varchar(100) DEFAULT NULL,
  `hcpcCost12TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear12TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth12TBox` varchar(10) DEFAULT NULL,
  `hcpcCode13TBox` varchar(100) DEFAULT NULL,
  `hcpcQty13TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct13TBox` varchar(100) DEFAULT NULL,
  `hcpcDX13TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis13TBox` varchar(100) DEFAULT NULL,
  `hcpcCost13TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear13TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth13TBox` varchar(10) DEFAULT NULL,
  `hcpcCode14TBox` varchar(100) DEFAULT NULL,
  `hcpcQty14TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct14TBox` varchar(100) DEFAULT NULL,
  `hcpcDX14TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis14TBox` varchar(100) DEFAULT NULL,
  `hcpcCost14TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear14TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth14TBox` varchar(10) DEFAULT NULL,
  `hcpcCode15TBox` varchar(100) DEFAULT NULL,
  `hcpcQty15TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct15TBox` varchar(100) DEFAULT NULL,
  `hcpcDX15TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis15TBox` varchar(100) DEFAULT NULL,
  `hcpcCost15TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear15TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth15TBox` varchar(10) DEFAULT NULL,
  `hcpcCode16TBox` varchar(100) DEFAULT NULL,
  `hcpcQty16TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct16TBox` varchar(100) DEFAULT NULL,
  `hcpcDX16TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis16TBox` varchar(100) DEFAULT NULL,
  `hcpcCost16TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear16TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth16TBox` varchar(10) DEFAULT NULL,
  `hcpcCode17TBox` varchar(100) DEFAULT NULL,
  `hcpcQty17TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct17TBox` varchar(100) DEFAULT NULL,
  `hcpcDX17TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis17TBox` varchar(100) DEFAULT NULL,
  `hcpcCost17TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear17TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth17TBox` varchar(10) DEFAULT NULL,
  `hcpcCode18TBox` varchar(100) DEFAULT NULL,
  `hcpcQty18TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct18TBox` varchar(100) DEFAULT NULL,
  `hcpcDX18TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis18TBox` varchar(100) DEFAULT NULL,
  `hcpcCost18TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear18TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth18TBox` varchar(10) DEFAULT NULL,
  `hcpcCode19TBox` varchar(100) DEFAULT NULL,
  `hcpcQty19TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct19TBox` varchar(100) DEFAULT NULL,
  `hcpcDX19TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis19TBox` varchar(100) DEFAULT NULL,
  `hcpcCost19TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear19TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth19TBox` varchar(10) DEFAULT NULL,
  `hcpcCode20TBox` varchar(100) DEFAULT NULL,
  `hcpcQty20TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct20TBox` varchar(100) DEFAULT NULL,
  `hcpcDX20TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis20TBox` varchar(100) DEFAULT NULL,
  `hcpcCost20TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear20TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth20TBox` varchar(10) DEFAULT NULL,
  `hcpcCode21TBox` varchar(100) DEFAULT NULL,
  `hcpcQty21TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct21TBox` varchar(100) DEFAULT NULL,
  `hcpcDX21TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis21TBox` varchar(100) DEFAULT NULL,
  `hcpcCost21TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear21TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth21TBox` varchar(10) DEFAULT NULL,
  `hcpcCode22TBox` varchar(100) DEFAULT NULL,
  `hcpcQty22TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct22TBox` varchar(100) DEFAULT NULL,
  `hcpcDX22TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis22TBox` varchar(100) DEFAULT NULL,
  `hcpcCost22TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear22TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth22TBox` varchar(10) DEFAULT NULL,
  `hcpcCode23TBox` varchar(100) DEFAULT NULL,
  `hcpcQty23TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct23TBox` varchar(100) DEFAULT NULL,
  `hcpcDX23TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis23TBox` varchar(100) DEFAULT NULL,
  `hcpcCost23TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear23TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth23TBox` varchar(10) DEFAULT NULL,
  `hcpcCode24TBox` varchar(100) DEFAULT NULL,
  `hcpcQty24TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct24TBox` varchar(100) DEFAULT NULL,
  `hcpcDX24TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis24TBox` varchar(100) DEFAULT NULL,
  `hcpcCost24TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear24TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth24TBox` varchar(10) DEFAULT NULL,
  `hcpcCode25TBox` varchar(100) DEFAULT NULL,
  `hcpcQty25TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct25TBox` varchar(100) DEFAULT NULL,
  `hcpcDX25TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis25TBox` varchar(100) DEFAULT NULL,
  `hcpcCost25TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear25TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth25TBox` varchar(10) DEFAULT NULL,
  `hcpcCode26TBox` varchar(100) DEFAULT NULL,
  `hcpcQty26TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct26TBox` varchar(100) DEFAULT NULL,
  `hcpcDX26TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis26TBox` varchar(100) DEFAULT NULL,
  `hcpcCost26TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear26TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth26TBox` varchar(10) DEFAULT NULL,
  `hcpcCode27TBox` varchar(100) DEFAULT NULL,
  `hcpcQty27TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct27TBox` varchar(100) DEFAULT NULL,
  `hcpcDX27TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis27TBox` varchar(100) DEFAULT NULL,
  `hcpcCost27TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear27TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth27TBox` varchar(10) DEFAULT NULL,
  `hcpcCode28TBox` varchar(100) DEFAULT NULL,
  `hcpcQty28TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct28TBox` varchar(100) DEFAULT NULL,
  `hcpcDX28TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis28TBox` varchar(100) DEFAULT NULL,
  `hcpcCost28TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear28TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth28TBox` varchar(10) DEFAULT NULL,
  `hcpcCode29TBox` varchar(100) DEFAULT NULL,
  `hcpcQty29TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct29TBox` varchar(100) DEFAULT NULL,
  `hcpcDX29TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis29TBox` varchar(100) DEFAULT NULL,
  `hcpcCost29TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear29TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth29TBox` varchar(10) DEFAULT NULL,
  `hcpcCode30TBox` varchar(100) DEFAULT NULL,
  `hcpcQty30TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct30TBox` varchar(100) DEFAULT NULL,
  `hcpcDX30TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis30TBox` varchar(100) DEFAULT NULL,
  `hcpcCost30TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear30TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth30TBox` varchar(10) DEFAULT NULL,
  `hcpcCode31TBox` varchar(100) DEFAULT NULL,
  `hcpcQty31TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct31TBox` varchar(100) DEFAULT NULL,
  `hcpcDX31TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis31TBox` varchar(100) DEFAULT NULL,
  `hcpcCost31TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear31TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth31TBox` varchar(10) DEFAULT NULL,
  `hcpcCode32TBox` varchar(100) DEFAULT NULL,
  `hcpcQty32TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct32TBox` varchar(100) DEFAULT NULL,
  `hcpcDX32TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis32TBox` varchar(100) DEFAULT NULL,
  `hcpcCost32TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear32TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth32TBox` varchar(10) DEFAULT NULL,
  `hcpcCode33TBox` varchar(100) DEFAULT NULL,
  `hcpcQty33TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct33TBox` varchar(100) DEFAULT NULL,
  `hcpcDX33TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis33TBox` varchar(100) DEFAULT NULL,
  `hcpcCost33TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear33TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth33TBox` varchar(10) DEFAULT NULL,
  `hcpcCode34TBox` varchar(100) DEFAULT NULL,
  `hcpcQty34TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct34TBox` varchar(100) DEFAULT NULL,
  `hcpcDX34TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis34TBox` varchar(100) DEFAULT NULL,
  `hcpcCost34TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear34TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth34TBox` varchar(10) DEFAULT NULL,
  `hcpcCode35TBox` varchar(100) DEFAULT NULL,
  `hcpcQty35TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct35TBox` varchar(100) DEFAULT NULL,
  `hcpcDX35TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis35TBox` varchar(100) DEFAULT NULL,
  `hcpcCost35TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear35TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth35TBox` varchar(10) DEFAULT NULL,
  `hcpcCode36TBox` varchar(100) DEFAULT NULL,
  `hcpcQty36TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct36TBox` varchar(100) DEFAULT NULL,
  `hcpcDX36TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis36TBox` varchar(100) DEFAULT NULL,
  `hcpcCost36TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear36TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth36TBox` varchar(10) DEFAULT NULL,
  `hcpcCode37TBox` varchar(100) DEFAULT NULL,
  `hcpcQty37TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct37TBox` varchar(100) DEFAULT NULL,
  `hcpcDX37TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis37TBox` varchar(100) DEFAULT NULL,
  `hcpcCost37TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear37TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth37TBox` varchar(10) DEFAULT NULL,
  `hcpcCode38TBox` varchar(100) DEFAULT NULL,
  `hcpcQty38TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct38TBox` varchar(100) DEFAULT NULL,
  `hcpcDX38TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis38TBox` varchar(100) DEFAULT NULL,
  `hcpcCost38TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear38TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth38TBox` varchar(10) DEFAULT NULL,
  `hcpcCode39TBox` varchar(100) DEFAULT NULL,
  `hcpcQty39TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct39TBox` varchar(100) DEFAULT NULL,
  `hcpcDX39TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis39TBox` varchar(100) DEFAULT NULL,
  `hcpcCost39TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear39TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth39TBox` varchar(10) DEFAULT NULL,
  `hcpcCode40TBox` varchar(100) DEFAULT NULL,
  `hcpcQty40TBox` varchar(10) DEFAULT NULL,
  `hcpcProduct40TBox` varchar(100) DEFAULT NULL,
  `hcpcDX40TBox` varchar(50) DEFAULT NULL,
  `hcpcDiagnosis40TBox` varchar(100) DEFAULT NULL,
  `hcpcCost40TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedYear40TBox` varchar(10) DEFAULT NULL,
  `hcpcLengthOfNeedMonth40TBox` varchar(10) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`QuoteHCPCID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reminder`
--

DROP TABLE IF EXISTS `reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminder` (
  `ReminderID` int(10) NOT NULL AUTO_INCREMENT,
  `UsersID` int(10) NOT NULL,
  `ObjectID` int(10) DEFAULT NULL,
  `InstanceID` int(10) DEFAULT NULL,
  `showDate` datetime NOT NULL,
  `Dismissed` int(10) NOT NULL DEFAULT '0',
  `Note` varchar(4000) NOT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`ReminderID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `RoleID` int(10) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(50) NOT NULL,
  `SiteID` int(10) NOT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `RouteID` int(10) NOT NULL AUTO_INCREMENT,
  `UserID` int(10) DEFAULT NULL,
  `Name` varchar(80) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`RouteID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `routepatient`
--

DROP TABLE IF EXISTS `routepatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routepatient` (
  `RoutePatientID` int(10) NOT NULL AUTO_INCREMENT,
  `RouteID` int(10) NOT NULL,
  `SubRoute` varchar(50) DEFAULT NULL,
  `PatientID` int(10) DEFAULT NULL,
  `FName` varchar(25) DEFAULT NULL,
  `LName` varchar(25) DEFAULT NULL,
  `City` varchar(25) DEFAULT NULL,
  `IDtext` varchar(40) DEFAULT NULL,
  `SuppliesText` varchar(4000) DEFAULT NULL,
  `Checked` char(1) NOT NULL DEFAULT '0',
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`RoutePatientID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategory` (
  `SubCategoryID` int(10) NOT NULL AUTO_INCREMENT,
  `CategoryID` int(10) NOT NULL,
  `SubCategoryName` varchar(100) NOT NULL,
  `SubCategoryURL` varchar(100) DEFAULT NULL,
  `SubCategorySortOrder` int(10) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`SubCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemusermessage`
--

DROP TABLE IF EXISTS `systemusermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemusermessage` (
  `SystemUserMessageID` int(10) NOT NULL AUTO_INCREMENT,
  `UsersID` int(10) NOT NULL,
  `Dismissed` int(10) NOT NULL DEFAULT '0',
  `Note` longtext NOT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`SystemUserMessageID`),
  KEY `Dismissed` (`UsersID`,`Dismissed`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemusermessage1`
--

DROP TABLE IF EXISTS `systemusermessage1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemusermessage1` (
  `SystemUserMessageID` int(10) NOT NULL AUTO_INCREMENT,
  `UsersID` int(10) NOT NULL,
  `Dismissed` int(10) NOT NULL,
  `Note` longtext NOT NULL,
  `Active` char(1) NOT NULL,
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` datetime NOT NULL,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`SystemUserMessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemusermessage2`
--

DROP TABLE IF EXISTS `systemusermessage2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemusermessage2` (
  `SystemUserMessageID` int(10) NOT NULL AUTO_INCREMENT,
  `UsersID` int(10) NOT NULL,
  `Dismissed` int(10) NOT NULL,
  `Note` longtext NOT NULL,
  `Active` char(1) NOT NULL,
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` datetime NOT NULL,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`SystemUserMessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemusermessage3`
--

DROP TABLE IF EXISTS `systemusermessage3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemusermessage3` (
  `SystemUserMessageID` int(10) NOT NULL AUTO_INCREMENT,
  `UsersID` int(10) NOT NULL,
  `Dismissed` int(10) NOT NULL,
  `Note` longtext NOT NULL,
  `Active` char(1) NOT NULL,
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` datetime NOT NULL,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`SystemUserMessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemusermessage4`
--

DROP TABLE IF EXISTS `systemusermessage4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemusermessage4` (
  `SystemUserMessageID` int(10) NOT NULL AUTO_INCREMENT,
  `UsersID` int(10) NOT NULL,
  `Dismissed` int(10) NOT NULL,
  `Note` longtext NOT NULL,
  `Active` char(1) NOT NULL,
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` datetime NOT NULL,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`SystemUserMessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemusermessage5`
--

DROP TABLE IF EXISTS `systemusermessage5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemusermessage5` (
  `SystemUserMessageID` int(10) NOT NULL AUTO_INCREMENT,
  `UsersID` int(10) NOT NULL,
  `Dismissed` int(10) NOT NULL,
  `Note` longtext NOT NULL,
  `Active` char(1) NOT NULL,
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` datetime NOT NULL,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`SystemUserMessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemusermessage6`
--

DROP TABLE IF EXISTS `systemusermessage6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemusermessage6` (
  `SystemUserMessageID` int(10) NOT NULL AUTO_INCREMENT,
  `UsersID` int(10) NOT NULL,
  `Dismissed` int(10) NOT NULL,
  `Note` longtext NOT NULL,
  `Active` char(1) NOT NULL,
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` datetime NOT NULL,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`SystemUserMessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemusermessage7`
--

DROP TABLE IF EXISTS `systemusermessage7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemusermessage7` (
  `SystemUserMessageID` int(10) NOT NULL AUTO_INCREMENT,
  `UsersID` int(10) NOT NULL,
  `Dismissed` int(10) NOT NULL,
  `Note` longtext NOT NULL,
  `Active` char(1) NOT NULL,
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` datetime NOT NULL,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`SystemUserMessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `TaskID` int(10) NOT NULL AUTO_INCREMENT,
  `ClientID` int(10) NOT NULL,
  `CreatorID` int(10) DEFAULT NULL,
  `ObjectID` int(10) DEFAULT NULL,
  `InstanceID` int(10) DEFAULT NULL,
  `Priority` int(10) DEFAULT NULL,
  `AssignedToUserID` int(10) DEFAULT NULL,
  `StatusID` int(10) DEFAULT NULL,
  `DueDate` datetime DEFAULT NULL,
  `Note` longtext,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`TaskID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taskassignment`
--

DROP TABLE IF EXISTS `taskassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taskassignment` (
  `TaskAssignmentID` int(10) NOT NULL AUTO_INCREMENT,
  `TaskID` int(10) NOT NULL,
  `UsersID` int(10) NOT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AssignorID` int(10) DEFAULT NULL,
  `Note` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`TaskAssignmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taskstatus`
--

DROP TABLE IF EXISTS `taskstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taskstatus` (
  `TaskStatusID` int(10) NOT NULL AUTO_INCREMENT,
  `TaskID` int(10) NOT NULL,
  `StatusID` int(10) NOT NULL,
  `UsersID` int(10) NOT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Note` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`TaskStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usersrole`
--

DROP TABLE IF EXISTS `usersrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersrole` (
  `UsersRoleID` int(10) NOT NULL AUTO_INCREMENT,
  `UsersID` int(10) NOT NULL,
  `SiteID` int(10) NOT NULL,
  `RoleID` int(10) NOT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`UsersRoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userssession`
--

DROP TABLE IF EXISTS `userssession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userssession` (
  `UsersSessionID` int(10) NOT NULL AUTO_INCREMENT,
  `UsersSessionIdentification` varchar(80) DEFAULT NULL,
  `UsersID` int(10) NOT NULL,
  `IPAddress` varchar(20) DEFAULT NULL,
  `SiteID` int(10) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`UsersSessionID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usersworkgroup`
--

DROP TABLE IF EXISTS `usersworkgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersworkgroup` (
  `UsersWorkGroupID` int(10) NOT NULL AUTO_INCREMENT,
  `UsersID` int(10) NOT NULL,
  `WorkGroupID` int(10) NOT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`UsersWorkGroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `verificationfile`
--

DROP TABLE IF EXISTS `verificationfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verificationfile` (
  `VerificationFileID` int(10) NOT NULL AUTO_INCREMENT,
  `InsuranceCompanyID` int(10) DEFAULT NULL,
  `UsersID` int(10) DEFAULT NULL,
  `xmlFileID` int(10) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`VerificationFileID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `verificationpatientinsurance`
--

DROP TABLE IF EXISTS `verificationpatientinsurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verificationpatientinsurance` (
  `VerificationPatientInsuranceID` int(10) NOT NULL AUTO_INCREMENT,
  `usersID` int(10) NOT NULL,
  `picID` int(10) NOT NULL,
  `VerificationRepFName` varchar(50) DEFAULT NULL,
  `VerificationRepLName` varchar(50) DEFAULT NULL,
  `VerificationDate` datetime DEFAULT NULL,
  `VerificationTime` varchar(20) DEFAULT NULL,
  `VerificationHaveIns` char(1) DEFAULT NULL,
  `VerificationHaveInsFromDate` datetime DEFAULT NULL,
  `VerificationHaveInsToDate` datetime DEFAULT NULL,
  `VerificationHaveDMECov` char(1) DEFAULT NULL,
  `VerificationDeductible` char(1) DEFAULT NULL,
  `VerificationDeductibleAmount` varchar(10) DEFAULT NULL,
  `VerificationDeductibleAmountMet` varchar(10) DEFAULT NULL,
  `VerificationPPOPolicy` char(1) DEFAULT NULL,
  `VerificationPercentagePayAfterDeductible` varchar(3) DEFAULT NULL,
  `VerificationPriorAuth` char(1) DEFAULT NULL,
  `VerificationAuthNumber` varchar(25) DEFAULT NULL,
  `VerificationLifetimeBenefitMet` char(1) DEFAULT NULL,
  `VerificationAuthPhoneNumber` varchar(80) DEFAULT NULL,
  `VerificationMedicareSupplement` char(1) DEFAULT NULL,
  `VerificationCoordinateBenefits` char(1) DEFAULT NULL,
  `VerificationPaidMedicareDeductible` char(1) DEFAULT NULL,
  `VerificationMedicaidPlan` char(1) DEFAULT NULL,
  `VerificationTypeBasePlan` varchar(50) DEFAULT NULL,
  `Active` char(1) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`VerificationPatientInsuranceID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `verificationpatientinsuranceelectronic`
--

DROP TABLE IF EXISTS `verificationpatientinsuranceelectronic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verificationpatientinsuranceelectronic` (
  `VerificationPatientInsuranceElectronicID` int(10) NOT NULL AUTO_INCREMENT,
  `vpicID` int(10) NOT NULL,
  `mashFileID` int(10) NOT NULL,
  `indexInFile` int(10) NOT NULL,
  `Active` int(10) NOT NULL DEFAULT '1',
  `InactiveCode` int(10) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`VerificationPatientInsuranceElectronicID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `view_useraccountparameters`
--

DROP TABLE IF EXISTS `view_useraccountparameters`;
/*!50001 DROP VIEW IF EXISTS `view_useraccountparameters`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_useraccountparameters` (
  `UsersID` int(10),
  `Fname` varchar(50),
  `Mname` varchar(50),
  `Lname` varchar(50)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `workgroup`
--

DROP TABLE IF EXISTS `workgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workgroup` (
  `WorkGroupID` int(10) NOT NULL AUTO_INCREMENT,
  `ClientID` int(10) DEFAULT NULL,
  `WorkGroupName` varchar(120) NOT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  `Description` varchar(750) DEFAULT NULL,
  `MondayStart` datetime DEFAULT NULL,
  `MondayEnd` datetime DEFAULT NULL,
  `TuesdayStart` datetime DEFAULT NULL,
  `TuesdayEnd` datetime DEFAULT NULL,
  `WednesdayStart` datetime DEFAULT NULL,
  `WednesdayEnd` datetime DEFAULT NULL,
  `ThursdayStart` datetime DEFAULT NULL,
  `ThursdayEnd` datetime DEFAULT NULL,
  `FridayStart` datetime DEFAULT NULL,
  `FridayEnd` datetime DEFAULT NULL,
  `SaturdayStart` datetime DEFAULT NULL,
  `SaturdayEnd` datetime DEFAULT NULL,
  `SundayStart` datetime DEFAULT NULL,
  `SundayEnd` datetime DEFAULT NULL,
  PRIMARY KEY (`WorkGroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `view_useraccountparameters`
--

/*!50001 DROP TABLE IF EXISTS `view_useraccountparameters`*/;
/*!50001 DROP VIEW IF EXISTS `view_useraccountparameters`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_useraccountparameters` AS select `pa_master`.`users`.`UsersID` AS `UsersID`,`paclient_1084`.`entity`.`Fname` AS `Fname`,`paclient_1084`.`entity`.`Mname` AS `Mname`,`paclient_1084`.`entity`.`Lname` AS `Lname` from (`pa_master`.`users` join `paclient_1084`.`entity` on((`pa_master`.`users`.`EntityID` = `paclient_1084`.`entity`.`EntityID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-08-13 23:46:10

