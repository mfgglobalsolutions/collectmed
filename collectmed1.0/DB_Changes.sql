
SELECT * INTO SystemUserMessage1 FROM SystemUserMessage
SELECT * INTO SystemUserMessage2 FROM SystemUserMessage
SELECT * INTO SystemUserMessage3 FROM SystemUserMessage
SELECT * INTO SystemUserMessage4 FROM SystemUserMessage
SELECT * INTO SystemUserMessage5 FROM SystemUserMessage
SELECT * INTO SystemUserMessage6 FROM SystemUserMessage
SELECT * INTO SystemUserMessage7 FROM SystemUserMessage
SELECT * INTO SystemUserMessage8 FROM SystemUserMessage

DELETE FROM SystemUserMessage1
WHERE     (SystemUserMessageID > 8000)

DELETE FROM SystemUserMessage2
WHERE     (SystemUserMessageID < 8001)
DELETE FROM SystemUserMessage2
WHERE     (SystemUserMessageID > 12000)

DELETE FROM SystemUserMessage3
WHERE     (SystemUserMessageID < 12001)
DELETE FROM SystemUserMessage3
WHERE     (SystemUserMessageID > 16000)

DELETE FROM SystemUserMessage4
WHERE     (SystemUserMessageID < 16001)
DELETE FROM SystemUserMessage4
WHERE     (SystemUserMessageID > 18000)

DELETE FROM SystemUserMessage5
WHERE     (SystemUserMessageID < 18001)
DELETE FROM SystemUserMessage5
WHERE     (SystemUserMessageID > 20000)

DELETE FROM SystemUserMessage6
WHERE     (SystemUserMessageID < 20001) 
DELETE FROM SystemUserMessage6
WHERE     (SystemUserMessageID > 21500)

DELETE FROM SystemUserMessage7
WHERE     (SystemUserMessageID < 21501) 
DELETE FROM SystemUserMessage7
WHERE     (SystemUserMessageID > 22500)

DELETE FROM SystemUserMessage8
WHERE     (SystemUserMessageID < 22501)



UPDATE `pa_master`.`EntityKS`
SET ColA = 'd*ert'
Where EntityKSID = 1   


/****** MYSQL Object:  View dbo.view_UserAccountParameters    Script Date: 11/3/2007 1:49:24 PM ******/
CREATE VIEW `paclient_1084`.`view_UserAccountParameters` AS
SELECT pa_master.Users.UsersID, paclient_1084.Entity.Fname, paclient_1084.Entity.Mname, paclient_1084.Entity.Lname
FROM PA_Master.Users INNER JOIN paclient_1084.Entity ON pa_master.Users.EntityID = paclient_1084.Entity.EntityID






/*************************************************************************************************************************************************
 
CREATE PROCEDURE GetAllTableSizes
AS
/*
    Obtains spaced used data for ALL user tables in the database
*/
DECLARE @TableName VARCHAR(100)    --For storing values in the cursor

--Cursor to get the name of all user tables from the sysobjects listing
DECLARE tableCursor CURSOR
FOR 
select [name]
from dbo.sysobjects 
where  OBJECTPROPERTY(id, N'IsUserTable') = 1
FOR READ ONLY

--A procedure level temp table to store the results
CREATE TABLE #TempTable
(
    tableName varchar(100),
    numberofRows varchar(100),
    reservedSize varchar(50),
    dataSize varchar(50),
    indexSize varchar(50),
    unusedSize varchar(50)
)

--Open the cursor
OPEN tableCursor

--Get the first table name from the cursor
FETCH NEXT FROM tableCursor INTO @TableName

--Loop until the cursor was not able to fetch
WHILE (@@Fetch_Status >= 0)
BEGIN
    --Dump the results of the sp_spaceused query to the temp table
    INSERT  #TempTable
        EXEC sp_spaceused @TableName

    --Get the next table name
    FETCH NEXT FROM tableCursor INTO @TableName
END

--Get rid of the cursor
CLOSE tableCursor
DEALLOCATE tableCursor

--Select all records so we can use the reults
SELECT * 
FROM #TempTable

--Final cleanup!
DROP TABLE #TempTable


GO
 
 
****************************************************************************************************************************************************/







































/********************* Checked 05/27/2011       **********************/
/********************* ALL DONE BELOW THIS LINE **********************/





/********************************/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VerificationPatientInsuranceElectronic]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[VerificationPatientInsuranceElectronic]
GO

CREATE TABLE [dbo].[VerificationPatientInsuranceElectronic] (
	[VerificationPatientInsuranceElectronicID] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[vpicID] [int] NOT NULL ,
	[mashFileID] [int] NOT NULL ,
	[indexInFile] [int] NOT NULL ,
	[Active] [int] NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[VerificationPatientInsuranceElectronic] ADD 
	CONSTRAINT [DF_VerificationPatientInsuranceElectronic_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_VerificationPatientInsuranceElectronic_DateCreated] DEFAULT (getdate()) FOR [DateCreated],
	CONSTRAINT [PK_VerificationPatientInsuranceElectronic] PRIMARY KEY  CLUSTERED 
	(
		[VerificationPatientInsuranceElectronicID]
	)  ON [PRIMARY] 
GO







/********************************/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Route]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Route]
GO

CREATE TABLE [dbo].[Route] (
	[RouteID] [int] IDENTITY (1001, 1) NOT NULL ,
	[UserID] [int] NULL ,	
	[Name] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,	
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Route] ADD 
	CONSTRAINT [DF_Route_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_Route_DateCreated] DEFAULT (getdate()) FOR [DateCreated],
	CONSTRAINT [PK_Route] PRIMARY KEY  CLUSTERED 
	(
		[RouteID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO












/******************************/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RoutePatient]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RoutePatient]
GO

CREATE TABLE [dbo].[RoutePatient] (
	[RoutePatientID] [int] IDENTITY (1001, 1) NOT NULL ,
	[RouteID] [int] NOT NULL ,
	[SubRoute] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PatientID] [int] NULL ,
	[FName] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LName] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[City] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[IDtext] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SuppliesText] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Checked] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[RoutePatient] ADD 
	CONSTRAINT [DF_RoutePatient_Checked] DEFAULT (0) FOR [Checked],
	CONSTRAINT [DF_RoutePatient_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_RoutePatient_DateCreated] DEFAULT (getdate()) FOR [DateCreated],
	CONSTRAINT [PK_RoutePatient] PRIMARY KEY  CLUSTERED 
	(
		[RoutePatientID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO








/******************************/
INSERT INTO Page(SiteID, CategoryID, PageName, Title, Security, ShowPageLink, LeftNavigation, RightNavigation, Header, Footer, Active)
VALUES(1002, 1, 'appRoutes.cfm', 'Routes', 1, 'N', 'N', 'N',  'Y', 'Y', 1)
INSERT INTO PageRole(PageID, RoleID, SiteID, Active)
VALUES(3400000000, 1, 1002, 1)

INSERT INTO Page(SiteID, CategoryID, PageName, Title, Security, ShowPageLink, LeftNavigation, RightNavigation, Header, Footer, Active)
VALUES(1002, 1, 'appRoute.cfm', 'Route', 1, 'N', 'N', 'N',  'Y', 'Y', 1)
INSERT INTO PageRole(PageID, RoleID, SiteID, Active)
VALUES(3400000000, 1, 1002, 1)

INSERT INTO Page(SiteID, CategoryID, PageName, Title, Security, ShowPageLink, LeftNavigation, RightNavigation, Header, Footer, Active)
VALUES(1002, 1, 'wsRoute.cfc', 'wsRoute', 1, 'N', 'N', 'N',  'N', 'N', 1)
INSERT INTO PageRole(PageID, RoleID, SiteID, Active)
VALUES(342, 1, 1002, 1)








UPDATE InsuranceCompany SET LoginInstructionsXML = '<?xml version="1.0" encoding="UTF-8"?><connection><type>ftp</type><url>edi.tmhp.com</url><folder>Medicaid_Texas</folder><username>BCF0FF11D7A9C106957515D028DF2F25</username><password>90655C14BBAF4EA07EC74F069F5A437B</password></connection>'
WHERE insuranceCompanyID = 44584

INSERT COLUMN INTO InsuranceCompany
LoginInstructionsXML varchar 4000
	
/******************************/

INSERT COLUMN INTO File
attributesXML varchar 8000








/*****************************/
INSERT INTO Page(SiteID, CategoryID, PageName, Title, Security, ShowPageLink, LeftNavigation, RightNavigation, Header, Footer, Active)
VALUES(1002, 1, 'appVerifications.cfm', 'Verification', 1, 'N', 'N', 'N',  'Y', 'Y', 1)
INSERT INTO PageRole(PageID, RoleID, SiteID, Active)
VALUES(3400000000, 1, 1002, 1)

/*****************************/
INSERT INTO Page(SiteID, CategoryID, PageName, Title, Security, ShowPageLink, LeftNavigation, RightNavigation, Header, Footer, Active)
VALUES(1002, 1, 'appVerificationProcess.cfm', 'Verification Create', 1, 'N', 'N', 'N',  'Y', 'Y', 1)
INSERT INTO PageRole(PageID, RoleID, SiteID, Active)
VALUES(33000000009, 1, 1002, 1)

/*****************************/
INSERT INTO Page(SiteID, CategoryID, PageName, Title, Security, ShowPageLink, LeftNavigation, RightNavigation, Header, Footer, Active)
VALUES(1002, 1, 'appVerificationCreate.cfm', 'Verification Create', 1, 'N', 'N', 'N',  'Y', 'Y', 1)
INSERT INTO PageRole(PageID, RoleID, SiteID, Active)
VALUES(330000000008, 1, 1002, 1)

/*****************************/
INSERT INTO Page(SiteID, CategoryID, PageName, Title, Security, ShowPageLink, LeftNavigation, RightNavigation, Header, Footer, Active)
VALUES(1002, 1, 'appVerification.cfm', 'Verification', 1, 'N', 'N', 'N',  'Y', 'Y', 1)
INSERT INTO PageRole(PageID, RoleID, SiteID, Active)
VALUES(340000000000, 1, 1002, 1)





/*****************************/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VerificationFile]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[VerificationFile]
GO

CREATE TABLE [dbo].[VerificationFile] (
	[VerificationFileID] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[InsuranceCompanyID] [int] NULL ,
	[UsersID] [int] NULL ,
	[xmlFileID] [int] NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[VerificationFile] ADD 
	CONSTRAINT [DF_VerificationFile_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_VerificationFile_DateCreated] DEFAULT (getdate()) FOR [DateCreated],
	CONSTRAINT [PK_VerificationFile] PRIMARY KEY  CLUSTERED 
	(
		[VerificationFileID]
	)  ON [PRIMARY] 
GO





INSERT INTO [PA_Master].[dbo].[StandardListItem](ItemNameDisplay, ItemDescription, ListID, Active)
VALUES('Medicaid Verification XML', 'Format XML', 12, 1)

INSERT INTO [PA_Master].[dbo].[StandardListItem](ItemNameDisplay, ItemDescription, ListID, Active)
VALUES('Medicaid Verification 270', 'Format 270', 12, 1)





UPDATE InsuranceCompany
SET Active = 0
WHERE InsuranceCompanyName IN('MEDICAID (TEXAS)', 'MEDCAID','MEDICIAD','TRADITIONAL MEDICAD','MQMB MEDICAID','Medicaid Region C','MEDICAID HOMEHEALTH','Medicaid Home Health ','Medicaid Home Health','medicaide','MEDICAID QMB','HMO BLUE-MEDICAID','MEDICAID MQMB','MEDICAID NHIC','MEDICAID QMB ONLY -KEEP CHECKING','Medicaid','MEDICAID NHIC STAR PLAN','MEDICAID/TMHP','MEDICAID TRADITIONAL','Medicaid TMHP','Medicaid (traditional)','MEDICAID CCP','MEDICAID (MQMB)','MEDICAID/NHIC','MEDICAID QMB ONLY','TRADITIONAL MEDICAID','MEDICAID ONLY','MEDICAID HOMEHEALTH DIV','Medicad MQMB','MEDICAID (CHILDREN)','MEDICAD','MEDICAID/MQMB','Medicaid MQMB DM2','Medicaid-Terminated','Medicaid/ TMHP','MEDICAID - TRADITIONAL')

UPDATE InsuranceCompany
SET Active = 1,
InsuranceCompanyName = 'MEDICAID (TEXAS)'
WHERE InsuranceCompanyID = 44584

UPDATE PatientInsuranceCompany
SET InsuranceCompanyID = 44584
WHERE     InsuranceCompanyID IN
(
	SELECT InsuranceCompanyID
	FROM   InsuranceCompany
	WHERE InsuranceCompanyName IN('MEDCAID','MEDICIAD','TRADITIONAL MEDICAD','MQMB MEDICAID','Medicaid Region C','MEDICAID HOMEHEALTH','Medicaid Home Health ','Medicaid Home Health','medicaide','MEDICAID QMB','HMO BLUE-MEDICAID','MEDICAID MQMB','MEDICAID NHIC','MEDICAID QMB ONLY -KEEP CHECKING','Medicaid','MEDICAID NHIC STAR PLAN','MEDICAID/TMHP','MEDICAID TRADITIONAL','Medicaid TMHP','Medicaid (traditional)','MEDICAID CCP','MEDICAID (MQMB)','MEDICAID/NHIC','MEDICAID QMB ONLY','TRADITIONAL MEDICAID','MEDICAID ONLY','MEDICAID HOMEHEALTH DIV','Medicad MQMB','MEDICAID (CHILDREN)','MEDICAD','MEDICAID/MQMB','Medicaid MQMB DM2','Medicaid-Terminated','Medicaid/ TMHP','MEDICAID - TRADITIONAL')
)


UPDATE InsuranceCompany
SET Active = 0
WHERE InsuranceCompanyName IN('MEDI-CARE EQUIPMENT','Medicare Part A','MEDICARE HMO/HUMANA/PCA','MEDICARE REGION D','MEDICARE REGION C`','MEDICARE REGION C','MEDICARE REGION B','Medicare Part A and Part B','MEDICARE (CARE IMPROVEMENT)','Medicare DMERC','Medicare DMERC C','Medicaid OMB','Medicare Part A Only','Medicare','MEDICARE/CARE IMPROVEMENT','Medicare Part B')

UPDATE InsuranceCompany
SET Active = 1,
InsuranceCompanyName = 'MEDICARE'
WHERE InsuranceCompanyID = 44583

UPDATE PatientInsuranceCompany
SET InsuranceCompanyID = 44583
WHERE     InsuranceCompanyID IN
(
	SELECT InsuranceCompanyID
	FROM   InsuranceCompany
	WHERE InsuranceCompanyName IN('MEDI-CARE EQUIPMENT','Medicare Part A','MEDICARE HMO/HUMANA/PCA','MEDICARE REGION D','MEDICARE REGION C`','MEDICARE REGION C','MEDICARE REGION B','Medicare Part A and Part B','MEDICARE (CARE IMPROVEMENT)','Medicare DMERC','Medicare DMERC C','Medicaid OMB','Medicare Part A Only','Medicare','MEDICARE/CARE IMPROVEMENT','Medicare Part B')
)



SELECT *
FROM   InsuranceCompany
WHERE InsuranceCompanyName IN('MEDCAID','MEDICIAD','TRADITIONAL MEDICAD','MQMB MEDICAID','Medicaid Region C','MEDICAID HOMEHEALTH','Medicaid Home Health ','Medicaid Home Health','medicaide','MEDICAID QMB','HMO BLUE-MEDICAID','MEDICAID MQMB','MEDICAID NHIC','MEDICAID QMB ONLY -KEEP CHECKING','Medicaid','MEDICAID NHIC STAR PLAN','MEDICAID/TMHP','MEDICAID TRADITIONAL','Medicaid TMHP','Medicaid (traditional)','MEDICAID CCP','MEDICAID (MQMB)','MEDICAID/NHIC','MEDICAID QMB ONLY','TRADITIONAL MEDICAID','MEDICAID ONLY','MEDICAID HOMEHEALTH DIV','Medicad MQMB','MEDICAID (CHILDREN)','MEDICAD','MEDICAID/MQMB','Medicaid MQMB DM2','Medicaid-Terminated','Medicaid/ TMHP','MEDICAID - TRADITIONAL', 'MEDICAID (TEXAS)')
AND Active = 1

SELECT *
FROM   InsuranceCompany
WHERE InsuranceCompanyName IN('MEDI-CARE EQUIPMENT','Medicare Part A','MEDICARE HMO/HUMANA/PCA','MEDICARE REGION D','MEDICARE REGION C`','MEDICARE REGION C','MEDICARE REGION B','Medicare Part A and Part B','MEDICARE (CARE IMPROVEMENT)','Medicare DMERC','Medicare DMERC C','Medicaid OMB','Medicare Part A Only','Medicare','MEDICARE/CARE IMPROVEMENT','Medicare Part B')
AND Active = 1



















/*
INSERT INTO Page(SiteID, CategoryID, PageName, Title, Security, ShowPageLink, LeftNavigation, RightNavigation, Header, Footer, Active)
VALUES(1002, 1, 'appVerifications.cfm', 'Verifications', 1, 'N', 'N', 'Y',  'Y', 'Y', 1)


INSERT INTO PageRole(PageID, RoleID, SiteID, Active)
VALUES(320, 1, 1002, 1)
*/


























INSERT INTO StandardListItem (ItemNameDisplay, ItemDescription, ListID, Active)
VALUES('KE', 'Bid Under Round I of the DMEPOS Competitive Bid Program For Use With Non-Competitive Bid Base Equipment KF--Class III device', 26, 1)


INSERT INTO StandardListItem (ItemNameDisplay, ItemDescription, ListID, Active)
VALUES('KL', 'DMEPOS Item Delivered Via Mail', 26, 1)



/****** Object:  Table [dbo].[EOB_MEDICARE_2008_A_PROCEDURECodeFeeSchedule]    Script Date: 5/25/2009 8:00:18 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EOB_MEDICARE_2008_A_PROCEDURECodeFeeSchedule]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EOB_MEDICARE_2008_A_PROCEDURECodeFeeSchedule]
GO

/****** Object:  Table [dbo].[EOB_MEDICARE_2008_A_PROCEDURECodeFeeSchedule]    Script Date: 5/25/2009 8:00:18 PM ******/
CREATE TABLE [dbo].[EOB_MEDICARE_2008_A_PROCEDURECodeFeeSchedule] (
	[RecordID] [int] IDENTITY (1, 1) NOT NULL ,
	[HCPCRecordID] [int] NOT NULL ,
	[CategoryID] [int] NULL ,
	[MOD1] [int] NULL ,
	[MOD2] [int] NULL ,
	[MOD3] [int] NULL ,
	[MOD4] [int] NULL ,
	[Ceiling] [money] NULL ,
	[Floor] [money] NULL ,
	[Fee_AL_16] [money] NULL ,
	[Fee_AK_17] [money] NULL ,
	[Fee_AZ_18] [money] NULL ,
	[Fee_AR_19] [money] NULL ,
	[Fee_CA_20] [money] NULL ,
	[Fee_CO_21] [money] NULL ,
	[Fee_CT_22] [money] NULL ,
	[Fee_DE_23] [money] NULL ,
	[Fee_DC_24] [money] NULL ,
	[Fee_FL_25] [money] NULL ,
	[Fee_GA_26] [money] NULL ,
	[Fee_HI_27] [money] NULL ,
	[Fee_ID_28] [money] NULL ,
	[Fee_IL_29] [money] NULL ,
	[Fee_IN_30] [money] NULL ,
	[Fee_IA_31] [money] NULL ,
	[Fee_KS_32] [money] NULL ,
	[Fee_KY_33] [money] NULL ,
	[Fee_LA_34] [money] NULL ,
	[Fee_ME_35] [money] NULL ,
	[Fee_MD_36] [money] NULL ,
	[Fee_MA_37] [money] NULL ,
	[Fee_MI_38] [money] NULL ,
	[Fee_MN_39] [money] NULL ,
	[Fee_MS_40] [money] NULL ,
	[Fee_MO_41] [money] NULL ,
	[Fee_MT_42] [money] NULL ,
	[Fee_NE_43] [money] NULL ,
	[Fee_NV_44] [money] NULL ,
	[Fee_NE_45] [money] NULL ,
	[Fee_NJ_46] [money] NULL ,
	[Fee_NM_47] [money] NULL ,
	[Fee_NY_48] [money] NULL ,
	[Fee_NC_49] [money] NULL ,
	[Fee_ND_50] [money] NULL ,
	[Fee_OH_51] [money] NULL ,
	[Fee_OK_52] [money] NULL ,
	[Fee_OR_53] [money] NULL ,
	[Fee_PA_54] [money] NULL ,
	[Fee_RI_55] [money] NULL ,
	[Fee_SC_56] [money] NULL ,
	[Fee_SD_57] [money] NULL ,
	[Fee_TN_58] [money] NULL ,
	[Fee_TX_59] [money] NULL ,
	[Fee_UT_60] [money] NULL ,
	[Fee_VT_61] [money] NULL ,
	[Fee_VA_62] [money] NULL ,
	[Fee_WA_63] [money] NULL ,
	[Fee_WV_64] [money] NULL ,
	[Fee_WI_65] [money] NULL ,
	[Fee_WY_66] [money] NULL ,
	[Fee_PR_229] [money] NULL ,
	[Fee_VI_238] [money] NULL ,
	[Description] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EOB_MEDICARE_2008_A_PROCEDURECodeFeeSchedule] WITH NOCHECK ADD 
	CONSTRAINT [PK_EOB_MEDICARE_2008_A_PROCEDURECodeFeeSchedule] PRIMARY KEY  CLUSTERED 
	(
		[RecordID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EOB_MEDICARE_2008_A_PROCEDURECodeFeeSchedule] ADD 
	CONSTRAINT [DF_EOB_MEDICARE_2008_A_PROCEDURECodeFeeSchedule_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_EOB_MEDICARE_2008_A_PROCEDURECodeFeeSchedule_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO






/****** Object:  Table [dbo].[EOB_MEDICARE_2008_B_PROCEDURECodeFeeSchedule]    Script Date: 5/25/2009 8:00:18 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EOB_MEDICARE_2008_B_PROCEDURECodeFeeSchedule]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EOB_MEDICARE_2008_B_PROCEDURECodeFeeSchedule]
GO

/****** Object:  Table [dbo].[EOB_MEDICARE_2008_B_PROCEDURECodeFeeSchedule]    Script Date: 5/25/2009 8:00:18 PM ******/
CREATE TABLE [dbo].[EOB_MEDICARE_2008_B_PROCEDURECodeFeeSchedule] (
	[RecordID] [int] IDENTITY (1, 1) NOT NULL ,
	[HCPCRecordID] [int] NOT NULL ,
	[CategoryID] [int] NULL ,
	[MOD1] [int] NULL ,
	[MOD2] [int] NULL ,
	[MOD3] [int] NULL ,
	[MOD4] [int] NULL ,
	[Ceiling] [money] NULL ,
	[Floor] [money] NULL ,
	[Fee_AL_16] [money] NULL ,
	[Fee_AK_17] [money] NULL ,
	[Fee_AZ_18] [money] NULL ,
	[Fee_AR_19] [money] NULL ,
	[Fee_CA_20] [money] NULL ,
	[Fee_CO_21] [money] NULL ,
	[Fee_CT_22] [money] NULL ,
	[Fee_DE_23] [money] NULL ,
	[Fee_DC_24] [money] NULL ,
	[Fee_FL_25] [money] NULL ,
	[Fee_GA_26] [money] NULL ,
	[Fee_HI_27] [money] NULL ,
	[Fee_ID_28] [money] NULL ,
	[Fee_IL_29] [money] NULL ,
	[Fee_IN_30] [money] NULL ,
	[Fee_IA_31] [money] NULL ,
	[Fee_KS_32] [money] NULL ,
	[Fee_KY_33] [money] NULL ,
	[Fee_LA_34] [money] NULL ,
	[Fee_ME_35] [money] NULL ,
	[Fee_MD_36] [money] NULL ,
	[Fee_MA_37] [money] NULL ,
	[Fee_MI_38] [money] NULL ,
	[Fee_MN_39] [money] NULL ,
	[Fee_MS_40] [money] NULL ,
	[Fee_MO_41] [money] NULL ,
	[Fee_MT_42] [money] NULL ,
	[Fee_NE_43] [money] NULL ,
	[Fee_NV_44] [money] NULL ,
	[Fee_NE_45] [money] NULL ,
	[Fee_NJ_46] [money] NULL ,
	[Fee_NM_47] [money] NULL ,
	[Fee_NY_48] [money] NULL ,
	[Fee_NC_49] [money] NULL ,
	[Fee_ND_50] [money] NULL ,
	[Fee_OH_51] [money] NULL ,
	[Fee_OK_52] [money] NULL ,
	[Fee_OR_53] [money] NULL ,
	[Fee_PA_54] [money] NULL ,
	[Fee_RI_55] [money] NULL ,
	[Fee_SC_56] [money] NULL ,
	[Fee_SD_57] [money] NULL ,
	[Fee_TN_58] [money] NULL ,
	[Fee_TX_59] [money] NULL ,
	[Fee_UT_60] [money] NULL ,
	[Fee_VT_61] [money] NULL ,
	[Fee_VA_62] [money] NULL ,
	[Fee_WA_63] [money] NULL ,
	[Fee_WV_64] [money] NULL ,
	[Fee_WI_65] [money] NULL ,
	[Fee_WY_66] [money] NULL ,
	[Fee_PR_229] [money] NULL ,
	[Fee_VI_238] [money] NULL ,
	[Description] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EOB_MEDICARE_2008_B_PROCEDURECodeFeeSchedule] WITH NOCHECK ADD 
	CONSTRAINT [PK_EOB_MEDICARE_2008_B_PROCEDURECodeFeeSchedule] PRIMARY KEY  CLUSTERED 
	(
		[RecordID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EOB_MEDICARE_2008_B_PROCEDURECodeFeeSchedule] ADD 
	CONSTRAINT [DF_EOB_MEDICARE_2008_B_PROCEDURECodeFeeSchedule_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_EOB_MEDICARE_2008_B_PROCEDURECodeFeeSchedule_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO




/****** Object:  Table [dbo].[EOB_MEDICARE_2008_C_PROCEDURECodeFeeSchedule]    Script Date: 5/25/2009 8:00:18 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EOB_MEDICARE_2008_C_PROCEDURECodeFeeSchedule]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EOB_MEDICARE_2008_C_PROCEDURECodeFeeSchedule]
GO

/****** Object:  Table [dbo].[EOB_MEDICARE_2008_C_PROCEDURECodeFeeSchedule]    Script Date: 5/25/2009 8:00:18 PM ******/
CREATE TABLE [dbo].[EOB_MEDICARE_2008_C_PROCEDURECodeFeeSchedule] (
	[RecordID] [int] IDENTITY (1, 1) NOT NULL ,
	[HCPCRecordID] [int] NOT NULL ,
	[CategoryID] [int] NULL ,
	[MOD1] [int] NULL ,
	[MOD2] [int] NULL ,
	[MOD3] [int] NULL ,
	[MOD4] [int] NULL ,
	[Ceiling] [money] NULL ,
	[Floor] [money] NULL ,
	[Fee_AL_16] [money] NULL ,
	[Fee_AK_17] [money] NULL ,
	[Fee_AZ_18] [money] NULL ,
	[Fee_AR_19] [money] NULL ,
	[Fee_CA_20] [money] NULL ,
	[Fee_CO_21] [money] NULL ,
	[Fee_CT_22] [money] NULL ,
	[Fee_DE_23] [money] NULL ,
	[Fee_DC_24] [money] NULL ,
	[Fee_FL_25] [money] NULL ,
	[Fee_GA_26] [money] NULL ,
	[Fee_HI_27] [money] NULL ,
	[Fee_ID_28] [money] NULL ,
	[Fee_IL_29] [money] NULL ,
	[Fee_IN_30] [money] NULL ,
	[Fee_IA_31] [money] NULL ,
	[Fee_KS_32] [money] NULL ,
	[Fee_KY_33] [money] NULL ,
	[Fee_LA_34] [money] NULL ,
	[Fee_ME_35] [money] NULL ,
	[Fee_MD_36] [money] NULL ,
	[Fee_MA_37] [money] NULL ,
	[Fee_MI_38] [money] NULL ,
	[Fee_MN_39] [money] NULL ,
	[Fee_MS_40] [money] NULL ,
	[Fee_MO_41] [money] NULL ,
	[Fee_MT_42] [money] NULL ,
	[Fee_NE_43] [money] NULL ,
	[Fee_NV_44] [money] NULL ,
	[Fee_NE_45] [money] NULL ,
	[Fee_NJ_46] [money] NULL ,
	[Fee_NM_47] [money] NULL ,
	[Fee_NY_48] [money] NULL ,
	[Fee_NC_49] [money] NULL ,
	[Fee_ND_50] [money] NULL ,
	[Fee_OH_51] [money] NULL ,
	[Fee_OK_52] [money] NULL ,
	[Fee_OR_53] [money] NULL ,
	[Fee_PA_54] [money] NULL ,
	[Fee_RI_55] [money] NULL ,
	[Fee_SC_56] [money] NULL ,
	[Fee_SD_57] [money] NULL ,
	[Fee_TN_58] [money] NULL ,
	[Fee_TX_59] [money] NULL ,
	[Fee_UT_60] [money] NULL ,
	[Fee_VT_61] [money] NULL ,
	[Fee_VA_62] [money] NULL ,
	[Fee_WA_63] [money] NULL ,
	[Fee_WV_64] [money] NULL ,
	[Fee_WI_65] [money] NULL ,
	[Fee_WY_66] [money] NULL ,
	[Fee_PR_229] [money] NULL ,
	[Fee_VI_238] [money] NULL ,
	[Description] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EOB_MEDICARE_2008_C_PROCEDURECodeFeeSchedule] WITH NOCHECK ADD 
	CONSTRAINT [PK_EOB_MEDICARE_2008_C_PROCEDURECodeFeeSchedule] PRIMARY KEY  CLUSTERED 
	(
		[RecordID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EOB_MEDICARE_2008_C_PROCEDURECodeFeeSchedule] ADD 
	CONSTRAINT [DF_EOB_MEDICARE_2008_C_PROCEDURECodeFeeSchedule_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_EOB_MEDICARE_2008_C_PROCEDURECodeFeeSchedule_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO





/****** Object:  Table [dbo].[EOB_MEDICARE_2008_D_PROCEDURECodeFeeSchedule]    Script Date: 5/25/2009 8:00:18 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EOB_MEDICARE_2008_D_PROCEDURECodeFeeSchedule]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EOB_MEDICARE_2008_D_PROCEDURECodeFeeSchedule]
GO

/****** Object:  Table [dbo].[EOB_MEDICARE_2008_D_PROCEDURECodeFeeSchedule]    Script Date: 5/25/2009 8:00:18 PM ******/
CREATE TABLE [dbo].[EOB_MEDICARE_2008_D_PROCEDURECodeFeeSchedule] (
	[RecordID] [int] IDENTITY (1, 1) NOT NULL ,
	[HCPCRecordID] [int] NOT NULL ,
	[CategoryID] [int] NULL ,
	[MOD1] [int] NULL ,
	[MOD2] [int] NULL ,
	[MOD3] [int] NULL ,
	[MOD4] [int] NULL ,
	[Ceiling] [money] NULL ,
	[Floor] [money] NULL ,
	[Fee_AL_16] [money] NULL ,
	[Fee_AK_17] [money] NULL ,
	[Fee_AZ_18] [money] NULL ,
	[Fee_AR_19] [money] NULL ,
	[Fee_CA_20] [money] NULL ,
	[Fee_CO_21] [money] NULL ,
	[Fee_CT_22] [money] NULL ,
	[Fee_DE_23] [money] NULL ,
	[Fee_DC_24] [money] NULL ,
	[Fee_FL_25] [money] NULL ,
	[Fee_GA_26] [money] NULL ,
	[Fee_HI_27] [money] NULL ,
	[Fee_ID_28] [money] NULL ,
	[Fee_IL_29] [money] NULL ,
	[Fee_IN_30] [money] NULL ,
	[Fee_IA_31] [money] NULL ,
	[Fee_KS_32] [money] NULL ,
	[Fee_KY_33] [money] NULL ,
	[Fee_LA_34] [money] NULL ,
	[Fee_ME_35] [money] NULL ,
	[Fee_MD_36] [money] NULL ,
	[Fee_MA_37] [money] NULL ,
	[Fee_MI_38] [money] NULL ,
	[Fee_MN_39] [money] NULL ,
	[Fee_MS_40] [money] NULL ,
	[Fee_MO_41] [money] NULL ,
	[Fee_MT_42] [money] NULL ,
	[Fee_NE_43] [money] NULL ,
	[Fee_NV_44] [money] NULL ,
	[Fee_NE_45] [money] NULL ,
	[Fee_NJ_46] [money] NULL ,
	[Fee_NM_47] [money] NULL ,
	[Fee_NY_48] [money] NULL ,
	[Fee_NC_49] [money] NULL ,
	[Fee_ND_50] [money] NULL ,
	[Fee_OH_51] [money] NULL ,
	[Fee_OK_52] [money] NULL ,
	[Fee_OR_53] [money] NULL ,
	[Fee_PA_54] [money] NULL ,
	[Fee_RI_55] [money] NULL ,
	[Fee_SC_56] [money] NULL ,
	[Fee_SD_57] [money] NULL ,
	[Fee_TN_58] [money] NULL ,
	[Fee_TX_59] [money] NULL ,
	[Fee_UT_60] [money] NULL ,
	[Fee_VT_61] [money] NULL ,
	[Fee_VA_62] [money] NULL ,
	[Fee_WA_63] [money] NULL ,
	[Fee_WV_64] [money] NULL ,
	[Fee_WI_65] [money] NULL ,
	[Fee_WY_66] [money] NULL ,
	[Fee_PR_229] [money] NULL ,
	[Fee_VI_238] [money] NULL ,
	[Description] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EOB_MEDICARE_2008_D_PROCEDURECodeFeeSchedule] WITH NOCHECK ADD 
	CONSTRAINT [PK_EOB_MEDICARE_2008_D_PROCEDURECodeFeeSchedule] PRIMARY KEY  CLUSTERED 
	(
		[RecordID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EOB_MEDICARE_2008_D_PROCEDURECodeFeeSchedule] ADD 
	CONSTRAINT [DF_EOB_MEDICARE_2008_D_PROCEDURECodeFeeSchedule_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_EOB_MEDICARE_2008_D_PROCEDURECodeFeeSchedule_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO






/****** Object:  Table [dbo].[EOB_MEDICARE_2009_A_PROCEDURECodeFeeSchedule]    Script Date: 5/25/2009 8:00:18 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EOB_MEDICARE_2009_A_PROCEDURECodeFeeSchedule]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EOB_MEDICARE_2009_A_PROCEDURECodeFeeSchedule]
GO

/****** Object:  Table [dbo].[EOB_MEDICARE_2009_A_PROCEDURECodeFeeSchedule]    Script Date: 5/25/2009 8:00:18 PM ******/
CREATE TABLE [dbo].[EOB_MEDICARE_2009_A_PROCEDURECodeFeeSchedule] (
	[RecordID] [int] IDENTITY (1, 1) NOT NULL ,
	[HCPCRecordID] [int] NOT NULL ,
	[CategoryID] [int] NULL ,
	[MOD1] [int] NULL ,
	[MOD2] [int] NULL ,
	[MOD3] [int] NULL ,
	[MOD4] [int] NULL ,
	[Ceiling] [money] NULL ,
	[Floor] [money] NULL ,
	[Fee_AL_16] [money] NULL ,
	[Fee_AK_17] [money] NULL ,
	[Fee_AZ_18] [money] NULL ,
	[Fee_AR_19] [money] NULL ,
	[Fee_CA_20] [money] NULL ,
	[Fee_CO_21] [money] NULL ,
	[Fee_CT_22] [money] NULL ,
	[Fee_DE_23] [money] NULL ,
	[Fee_DC_24] [money] NULL ,
	[Fee_FL_25] [money] NULL ,
	[Fee_GA_26] [money] NULL ,
	[Fee_HI_27] [money] NULL ,
	[Fee_ID_28] [money] NULL ,
	[Fee_IL_29] [money] NULL ,
	[Fee_IN_30] [money] NULL ,
	[Fee_IA_31] [money] NULL ,
	[Fee_KS_32] [money] NULL ,
	[Fee_KY_33] [money] NULL ,
	[Fee_LA_34] [money] NULL ,
	[Fee_ME_35] [money] NULL ,
	[Fee_MD_36] [money] NULL ,
	[Fee_MA_37] [money] NULL ,
	[Fee_MI_38] [money] NULL ,
	[Fee_MN_39] [money] NULL ,
	[Fee_MS_40] [money] NULL ,
	[Fee_MO_41] [money] NULL ,
	[Fee_MT_42] [money] NULL ,
	[Fee_NE_43] [money] NULL ,
	[Fee_NV_44] [money] NULL ,
	[Fee_NE_45] [money] NULL ,
	[Fee_NJ_46] [money] NULL ,
	[Fee_NM_47] [money] NULL ,
	[Fee_NY_48] [money] NULL ,
	[Fee_NC_49] [money] NULL ,
	[Fee_ND_50] [money] NULL ,
	[Fee_OH_51] [money] NULL ,
	[Fee_OK_52] [money] NULL ,
	[Fee_OR_53] [money] NULL ,
	[Fee_PA_54] [money] NULL ,
	[Fee_RI_55] [money] NULL ,
	[Fee_SC_56] [money] NULL ,
	[Fee_SD_57] [money] NULL ,
	[Fee_TN_58] [money] NULL ,
	[Fee_TX_59] [money] NULL ,
	[Fee_UT_60] [money] NULL ,
	[Fee_VT_61] [money] NULL ,
	[Fee_VA_62] [money] NULL ,
	[Fee_WA_63] [money] NULL ,
	[Fee_WV_64] [money] NULL ,
	[Fee_WI_65] [money] NULL ,
	[Fee_WY_66] [money] NULL ,
	[Fee_PR_229] [money] NULL ,
	[Fee_VI_238] [money] NULL ,
	[Description] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EOB_MEDICARE_2009_A_PROCEDURECodeFeeSchedule] WITH NOCHECK ADD 
	CONSTRAINT [PK_EOB_MEDICARE_2009_A_PROCEDURECodeFeeSchedule] PRIMARY KEY  CLUSTERED 
	(
		[RecordID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EOB_MEDICARE_2009_A_PROCEDURECodeFeeSchedule] ADD 
	CONSTRAINT [DF_EOB_MEDICARE_2009_A_PROCEDURECodeFeeSchedule_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_EOB_MEDICARE_2009_A_PROCEDURECodeFeeSchedule_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO






/****** Object:  Table [dbo].[EOB_MEDICARE_2009_B_PROCEDURECodeFeeSchedule]    Script Date: 5/25/2009 8:00:18 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EOB_MEDICARE_2009_B_PROCEDURECodeFeeSchedule]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EOB_MEDICARE_2009_B_PROCEDURECodeFeeSchedule]
GO

/****** Object:  Table [dbo].[EOB_MEDICARE_2009_B_PROCEDURECodeFeeSchedule]    Script Date: 5/25/2009 8:00:18 PM ******/
CREATE TABLE [dbo].[EOB_MEDICARE_2009_B_PROCEDURECodeFeeSchedule] (
	[RecordID] [int] IDENTITY (1, 1) NOT NULL ,
	[HCPCRecordID] [int] NOT NULL ,
	[CategoryID] [int] NULL ,
	[MOD1] [int] NULL ,
	[MOD2] [int] NULL ,
	[MOD3] [int] NULL ,
	[MOD4] [int] NULL ,
	[Ceiling] [money] NULL ,
	[Floor] [money] NULL ,
	[Fee_AL_16] [money] NULL ,
	[Fee_AK_17] [money] NULL ,
	[Fee_AZ_18] [money] NULL ,
	[Fee_AR_19] [money] NULL ,
	[Fee_CA_20] [money] NULL ,
	[Fee_CO_21] [money] NULL ,
	[Fee_CT_22] [money] NULL ,
	[Fee_DE_23] [money] NULL ,
	[Fee_DC_24] [money] NULL ,
	[Fee_FL_25] [money] NULL ,
	[Fee_GA_26] [money] NULL ,
	[Fee_HI_27] [money] NULL ,
	[Fee_ID_28] [money] NULL ,
	[Fee_IL_29] [money] NULL ,
	[Fee_IN_30] [money] NULL ,
	[Fee_IA_31] [money] NULL ,
	[Fee_KS_32] [money] NULL ,
	[Fee_KY_33] [money] NULL ,
	[Fee_LA_34] [money] NULL ,
	[Fee_ME_35] [money] NULL ,
	[Fee_MD_36] [money] NULL ,
	[Fee_MA_37] [money] NULL ,
	[Fee_MI_38] [money] NULL ,
	[Fee_MN_39] [money] NULL ,
	[Fee_MS_40] [money] NULL ,
	[Fee_MO_41] [money] NULL ,
	[Fee_MT_42] [money] NULL ,
	[Fee_NE_43] [money] NULL ,
	[Fee_NV_44] [money] NULL ,
	[Fee_NE_45] [money] NULL ,
	[Fee_NJ_46] [money] NULL ,
	[Fee_NM_47] [money] NULL ,
	[Fee_NY_48] [money] NULL ,
	[Fee_NC_49] [money] NULL ,
	[Fee_ND_50] [money] NULL ,
	[Fee_OH_51] [money] NULL ,
	[Fee_OK_52] [money] NULL ,
	[Fee_OR_53] [money] NULL ,
	[Fee_PA_54] [money] NULL ,
	[Fee_RI_55] [money] NULL ,
	[Fee_SC_56] [money] NULL ,
	[Fee_SD_57] [money] NULL ,
	[Fee_TN_58] [money] NULL ,
	[Fee_TX_59] [money] NULL ,
	[Fee_UT_60] [money] NULL ,
	[Fee_VT_61] [money] NULL ,
	[Fee_VA_62] [money] NULL ,
	[Fee_WA_63] [money] NULL ,
	[Fee_WV_64] [money] NULL ,
	[Fee_WI_65] [money] NULL ,
	[Fee_WY_66] [money] NULL ,
	[Fee_PR_229] [money] NULL ,
	[Fee_VI_238] [money] NULL ,
	[Description] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EOB_MEDICARE_2009_B_PROCEDURECodeFeeSchedule] WITH NOCHECK ADD 
	CONSTRAINT [PK_EOB_MEDICARE_2009_B_PROCEDURECodeFeeSchedule] PRIMARY KEY  CLUSTERED 
	(
		[RecordID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EOB_MEDICARE_2009_B_PROCEDURECodeFeeSchedule] ADD 
	CONSTRAINT [DF_EOB_MEDICARE_2009_B_PROCEDURECodeFeeSchedule_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_EOB_MEDICARE_2009_B_PROCEDURECodeFeeSchedule_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

--->		
		
		
		
		
		
		
		
		
		
		
		

