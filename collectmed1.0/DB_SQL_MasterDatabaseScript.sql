/****** Object:  Database PAClient_MASTER    Script Date: 1/22/2008 5:58:33 PM ******/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'PAClient_MASTER')
	DROP DATABASE [PAClient_MASTER]
GO

CREATE DATABASE [PAClient_MASTER]  ON (NAME = N'PAClient_MASTER_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL$EOB\data\PAClient_MASTER_Data.MDF' , SIZE = 95, FILEGROWTH = 10%) LOG ON (NAME = N'PAClient_MASTER_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL$EOB\data\PAClient_MASTER_Log.LDF' , SIZE = 42, FILEGROWTH = 10%)
 COLLATE SQL_Latin1_General_CP1_CI_AS
GO

exec sp_dboption N'PAClient_MASTER', N'autoclose', N'false'
GO

exec sp_dboption N'PAClient_MASTER', N'bulkcopy', N'false'
GO

exec sp_dboption N'PAClient_MASTER', N'trunc. log', N'false'
GO

exec sp_dboption N'PAClient_MASTER', N'torn page detection', N'true'
GO

exec sp_dboption N'PAClient_MASTER', N'read only', N'false'
GO

exec sp_dboption N'PAClient_MASTER', N'dbo use', N'false'
GO

exec sp_dboption N'PAClient_MASTER', N'single', N'false'
GO

exec sp_dboption N'PAClient_MASTER', N'autoshrink', N'false'
GO

exec sp_dboption N'PAClient_MASTER', N'ANSI null default', N'false'
GO

exec sp_dboption N'PAClient_MASTER', N'recursive triggers', N'false'
GO

exec sp_dboption N'PAClient_MASTER', N'ANSI nulls', N'false'
GO

exec sp_dboption N'PAClient_MASTER', N'concat null yields null', N'false'
GO

exec sp_dboption N'PAClient_MASTER', N'cursor close on commit', N'false'
GO

exec sp_dboption N'PAClient_MASTER', N'default to local cursor', N'false'
GO

exec sp_dboption N'PAClient_MASTER', N'quoted identifier', N'false'
GO

exec sp_dboption N'PAClient_MASTER', N'ANSI warnings', N'false'
GO

exec sp_dboption N'PAClient_MASTER', N'auto create statistics', N'true'
GO

exec sp_dboption N'PAClient_MASTER', N'auto update statistics', N'true'
GO

if( ( (@@microsoftversion / power(2, 24) = 8) and (@@microsoftversion & 0xffff >= 724) ) or ( (@@microsoftversion / power(2, 24) = 7) and (@@microsoftversion & 0xffff >= 1082) ) )
	exec sp_dboption N'PAClient_MASTER', N'db chaining', N'false'
GO

use [PAClient_MASTER]
GO

/****** Object:  Stored Procedure dbo.sp_GetAdministratorInformation    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetAdministratorInformation]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetAdministratorInformation]
GO

/****** Object:  Stored Procedure dbo.sp_GetUserInformation    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetUserInformation]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetUserInformation]
GO

/****** Object:  Stored Procedure dbo.sp_GetUsersLastSession    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GetUsersLastSession]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GetUsersLastSession]
GO

/****** Object:  Stored Procedure dbo.sp_InvalidateUsersPriorSessions    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InvalidateUsersPriorSessions]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InvalidateUsersPriorSessions]
GO

/****** Object:  Stored Procedure dbo.sp_UpdateClaimAssignedToUsersID    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdateClaimAssignedToUsersID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdateClaimAssignedToUsersID]
GO

/****** Object:  Stored Procedure dbo.sp_UpdateClaimStatus    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdateClaimStatus]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdateClaimStatus]
GO

/****** Object:  Stored Procedure dbo.sp_UpdateIntakeAssignedToUsersID    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdateIntakeAssignedToUsersID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdateIntakeAssignedToUsersID]
GO

/****** Object:  Stored Procedure dbo.sp_UpdateTaskAssignedToUsersID    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdateTaskAssignedToUsersID]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdateTaskAssignedToUsersID]
GO

/****** Object:  Stored Procedure dbo.sp_UpdateTaskStatus    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UpdateTaskStatus]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UpdateTaskStatus]
GO

/****** Object:  Stored Procedure dbo.sp_GlobalFooterGet    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_GlobalFooterGet]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_GlobalFooterGet]
GO

/****** Object:  Stored Procedure dbo.sp_UserValidLoginTime    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_UserValidLoginTime]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_UserValidLoginTime]
GO

/****** Object:  View dbo.view_UserAccountParameters    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[view_UserAccountParameters]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[view_UserAccountParameters]
GO

/****** Object:  Table [dbo].[Address]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Address]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Address]
GO

/****** Object:  Table [dbo].[Category]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Category]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Category]
GO

/****** Object:  Table [dbo].[Claim]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Claim]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Claim]
GO

/****** Object:  Table [dbo].[ClaimAssignment]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ClaimAssignment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ClaimAssignment]
GO

/****** Object:  Table [dbo].[ClaimStatus]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ClaimStatus]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ClaimStatus]
GO

/****** Object:  Table [dbo].[Claim_MEDICARE_MOA]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Claim_MEDICARE_MOA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Claim_MEDICARE_MOA]
GO

/****** Object:  Table [dbo].[Claim_MEDICARE_SUPPLEMENTAL_AMOUNT]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Claim_MEDICARE_SUPPLEMENTAL_AMOUNT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Claim_MEDICARE_SUPPLEMENTAL_AMOUNT]
GO

/****** Object:  Table [dbo].[Claim_ProcessXMLToDB]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Claim_ProcessXMLToDB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Claim_ProcessXMLToDB]
GO

/****** Object:  Table [dbo].[ClientProvider]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ClientProvider]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ClientProvider]
GO

/****** Object:  Table [dbo].[Debug]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Debug]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Debug]
GO

/****** Object:  Table [dbo].[Doctor]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Doctor]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Doctor]
GO

/****** Object:  Table [dbo].[EmailAddress]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EmailAddress]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EmailAddress]
GO

/****** Object:  Table [dbo].[Employer]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Employer]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Employer]
GO

/****** Object:  Table [dbo].[Entity]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Entity]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Entity]
GO

/****** Object:  Table [dbo].[EntityAddress]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EntityAddress]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EntityAddress]
GO

/****** Object:  Table [dbo].[EntityPhone]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EntityPhone]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EntityPhone]
GO

/****** Object:  Table [dbo].[EntityRS]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EntityRS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EntityRS]
GO

/****** Object:  Table [dbo].[EntitySS]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EntitySS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EntitySS]
GO

/****** Object:  Table [dbo].[EntityTS]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EntityTS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EntityTS]
GO

/****** Object:  Table [dbo].[File]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[File]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[File]
GO

/****** Object:  Table [dbo].[FileProcess]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FileProcess]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FileProcess]
GO

/****** Object:  Table [dbo].[IMChat]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IMChat]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[IMChat]
GO

/****** Object:  Table [dbo].[InsuranceCompany]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InsuranceCompany]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[InsuranceCompany]
GO

/****** Object:  Table [dbo].[Intake]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Intake]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Intake]
GO

/****** Object:  Table [dbo].[IntakeAssignment]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IntakeAssignment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[IntakeAssignment]
GO

/****** Object:  Table [dbo].[IntakeAutoSave]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IntakeAutoSave]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[IntakeAutoSave]
GO

/****** Object:  Table [dbo].[IntakeHCPC]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IntakeHCPC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[IntakeHCPC]
GO

/****** Object:  Table [dbo].[Interchange]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Interchange]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Interchange]
GO

/****** Object:  Table [dbo].[Log]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Log]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Log]
GO

/****** Object:  Table [dbo].[Note]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Note]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Note]
GO

/****** Object:  Table [dbo].[PageHit]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PageHit]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PageHit]
GO

/****** Object:  Table [dbo].[Patient]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Patient]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Patient]
GO

/****** Object:  Table [dbo].[PatientInsuranceCompany]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PatientInsuranceCompany]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PatientInsuranceCompany]
GO

/****** Object:  Table [dbo].[Phone]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Phone]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Phone]
GO

/****** Object:  Table [dbo].[Procedure]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Procedure]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Procedure]
GO

/****** Object:  Table [dbo].[ProcedureEOBcode]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ProcedureEOBcode]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ProcedureEOBcode]
GO

/****** Object:  Table [dbo].[ProcedureEOPScode]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ProcedureEOPScode]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ProcedureEOPScode]
GO

/****** Object:  Table [dbo].[ProcedureOpenClose]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ProcedureOpenClose]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ProcedureOpenClose]
GO

/****** Object:  Table [dbo].[Procedure_MEDICARE_CLAIMADJUSTMENT]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Procedure_MEDICARE_CLAIMADJUSTMENT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Procedure_MEDICARE_CLAIMADJUSTMENT]
GO

/****** Object:  Table [dbo].[Procedure_MEDICARE_MODIFIER]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Procedure_MEDICARE_MODIFIER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Procedure_MEDICARE_MODIFIER]
GO

/****** Object:  Table [dbo].[Procedure_MEDICARE_REMARK_CODE]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Procedure_MEDICARE_REMARK_CODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Procedure_MEDICARE_REMARK_CODE]
GO

/****** Object:  Table [dbo].[Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT]
GO

/****** Object:  Table [dbo].[Quote]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Quote]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Quote]
GO

/****** Object:  Table [dbo].[QuoteHCPC]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[QuoteHCPC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[QuoteHCPC]
GO

/****** Object:  Table [dbo].[Reminder]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Reminder]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Reminder]
GO

/****** Object:  Table [dbo].[Role]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Role]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Role]
GO

/****** Object:  Table [dbo].[SubCategory]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SubCategory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubCategory]
GO

/****** Object:  Table [dbo].[SystemUserMessage]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SystemUserMessage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SystemUserMessage]
GO

/****** Object:  Table [dbo].[Task]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Task]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Task]
GO

/****** Object:  Table [dbo].[TaskAssignment]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TaskAssignment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TaskAssignment]
GO

/****** Object:  Table [dbo].[TaskStatus]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TaskStatus]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TaskStatus]
GO

/****** Object:  Table [dbo].[UsersRole]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UsersRole]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[UsersRole]
GO

/****** Object:  Table [dbo].[UsersSession]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UsersSession]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[UsersSession]
GO

/****** Object:  Table [dbo].[UsersWorkGroup]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UsersWorkGroup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[UsersWorkGroup]
GO

/****** Object:  Table [dbo].[VerificationPatientInsurance]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VerificationPatientInsurance]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[VerificationPatientInsurance]
GO

/****** Object:  Table [dbo].[WorkGroup]    Script Date: 1/22/2008 5:58:35 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[WorkGroup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[WorkGroup]
GO

/****** Object:  Login EOBManager    Script Date: 1/22/2008 5:58:33 PM ******/
if not exists (select * from master.dbo.syslogins where loginname = N'EOBManager')
BEGIN
	declare @logindb nvarchar(132), @loginlang nvarchar(132) select @logindb = N'master', @loginlang = N'us_english'
	if @logindb is null or not exists (select * from master.dbo.sysdatabases where name = @logindb)
		select @logindb = N'master'
	if @loginlang is null or (not exists (select * from master.dbo.syslanguages where name = @loginlang) and @loginlang <> N'us_english')
		select @loginlang = @@language
	exec sp_addlogin N'EOBManager', null, @logindb, @loginlang
END
GO

/****** Object:  Login EOBWIN2K\Administrator    Script Date: 1/22/2008 5:58:33 PM ******/
if not exists (select * from master.dbo.syslogins where loginname = N'EOBWIN2K\Administrator')
	exec sp_grantlogin N'EOBWIN2K\Administrator'
	exec sp_defaultdb N'EOBWIN2K\Administrator', N'master'
	exec sp_defaultlanguage N'EOBWIN2K\Administrator', N'us_english'
GO

/****** Object:  Login EOBManager    Script Date: 1/22/2008 5:58:33 PM ******/
exec sp_addsrvrolemember N'EOBManager', sysadmin
GO

/****** Object:  Login EOBWIN2K\Administrator    Script Date: 1/22/2008 5:58:33 PM ******/
exec sp_addsrvrolemember N'EOBWIN2K\Administrator', sysadmin
GO

/****** Object:  User dbo    Script Date: 1/22/2008 5:58:33 PM ******/
/****** Object:  User EOBManager    Script Date: 1/22/2008 5:58:33 PM ******/
if not exists (select * from dbo.sysusers where name = N'EOBManager' and uid < 16382)
	EXEC sp_grantdbaccess N'EOBManager'
GO

/****** Object:  User EOBManager    Script Date: 1/22/2008 5:58:33 PM ******/
exec sp_addrolemember N'db_owner', N'EOBManager'
GO

/****** Object:  Table [dbo].[Address]    Script Date: 1/22/2008 5:58:36 PM ******/
CREATE TABLE [dbo].[Address] (
	[AddressID] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[SiteID] [int] NULL ,
	[AddressTypeID] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Attention] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AddressLine1] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AddressLine2] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[City] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[StateID] [int] NULL ,
	[ZipCode] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CountryID] [int] NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Category]    Script Date: 1/22/2008 5:58:36 PM ******/
CREATE TABLE [dbo].[Category] (
	[CategoryID] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[SiteID] [int] NOT NULL ,
	[CategoryName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CategoryURL] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CategorySortOrder] [int] NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Claim]    Script Date: 1/22/2008 5:58:37 PM ******/
CREATE TABLE [dbo].[Claim] (
	[ClaimID] [int] IDENTITY (1, 1) NOT NULL ,
	[InterchangeClaimID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ClientAssignedClaimID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InterchangeID] [int] NOT NULL ,
	[ProviderID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ClaimType] [int] NOT NULL ,
	[ClientID] [int] NOT NULL ,
	[EntityID] [int] NULL ,
	[HICNumber] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ClaimStatusCode] [int] NULL ,
	[StatusID] [int] NULL ,
	[ClaimPreviousPaidAmount] [money] NULL ,
	[ClaimPaidAmount] [money] NULL ,
	[PatientResponsibilityAmount] [money] NULL ,
	[AssignedToUserID] [int] NULL ,
	[DueDate] [datetime] NULL ,
	[FacilityCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CrossoverEntityTypeQualifier2] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CrossoverNameLastorOrganizationName3] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CrossoverIdentificationCode9] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ClaimAssignment]    Script Date: 1/22/2008 5:58:37 PM ******/
CREATE TABLE [dbo].[ClaimAssignment] (
	[ClaimAssignmentID] [int] IDENTITY (1, 1) NOT NULL ,
	[ClaimID] [int] NOT NULL ,
	[UserID] [int] NOT NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[AssignorID] [int] NULL ,
	[Note] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ClaimStatus]    Script Date: 1/22/2008 5:58:37 PM ******/
CREATE TABLE [dbo].[ClaimStatus] (
	[ClaimStatusID] [int] IDENTITY (1, 1) NOT NULL ,
	[ClaimID] [int] NOT NULL ,
	[StatusID] [int] NOT NULL ,
	[UsersID] [int] NOT NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[Note] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Claim_MEDICARE_MOA]    Script Date: 1/22/2008 5:58:37 PM ******/
CREATE TABLE [dbo].[Claim_MEDICARE_MOA] (
	[Claim_MEDICARE_MOAID] [int] IDENTITY (1, 1) NOT NULL ,
	[ClaimID] [int] NOT NULL ,
	[ReimbursementRate] [float] NULL ,
	[MOACode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DateCreated] [datetime] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Claim_MEDICARE_SUPPLEMENTAL_AMOUNT]    Script Date: 1/22/2008 5:58:37 PM ******/
CREATE TABLE [dbo].[Claim_MEDICARE_SUPPLEMENTAL_AMOUNT] (
	[Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID] [int] IDENTITY (1, 1) NOT NULL ,
	[ClaimID] [int] NOT NULL ,
	[QualifierCode] [int] NOT NULL ,
	[MonetaryAmount2] [money] NOT NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Claim_ProcessXMLToDB]    Script Date: 1/22/2008 5:58:37 PM ******/
CREATE TABLE [dbo].[Claim_ProcessXMLToDB] (
	[Claim_ProcessXMLToDBID] [int] IDENTITY (100, 1) NOT NULL ,
	[InterchangeID] [int] NOT NULL ,
	[ClaimXML] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ProviderID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PatientID] [int] NULL ,
	[interchangeClaimID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PossiblePatientID] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ClientProvider]    Script Date: 1/22/2008 5:58:37 PM ******/
CREATE TABLE [dbo].[ClientProvider] (
	[ClientProviderID] [int] IDENTITY (1, 1) NOT NULL ,
	[ClientID] [int] NOT NULL ,
	[ProviderID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Debug]    Script Date: 1/22/2008 5:58:38 PM ******/
CREATE TABLE [dbo].[Debug] (
	[DebugID] [int] IDENTITY (1, 1) NOT NULL ,
	[referenceID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Note] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TS] [datetime] NOT NULL ,
	[tesst] [float] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Doctor]    Script Date: 1/22/2008 5:58:38 PM ******/
CREATE TABLE [dbo].[Doctor] (
	[DoctorID] [int] IDENTITY (1001, 1) NOT NULL ,
	[EntityID] [int] NULL ,
	[ClientDoctorID] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DoctorCategory] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[UPIN] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MedicareNumber] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MedicaidNumber] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[GroupName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SpecialInstructions] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EmailAddress]    Script Date: 1/22/2008 5:58:38 PM ******/
CREATE TABLE [dbo].[EmailAddress] (
	[EmailAddressID] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[SiteID] [int] NULL ,
	[EntityID] [int] NOT NULL ,
	[EmailTypeID] [int] NULL ,
	[Email] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[IsDefault] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Employer]    Script Date: 1/22/2008 5:58:38 PM ******/
CREATE TABLE [dbo].[Employer] (
	[EmployerID] [int] IDENTITY (1001, 1) NOT NULL ,
	[EmployerName] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[EmployerDBA] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[EntityID] [int] NULL ,
	[EmployerURL] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Entity]    Script Date: 1/22/2008 5:58:38 PM ******/
CREATE TABLE [dbo].[Entity] (
	[EntityID] [int] IDENTITY (1, 1) NOT NULL ,
	[SiteID] [int] NULL ,
	[ClientID] [int] NULL ,
	[ObjectTypeID] [int] NOT NULL ,
	[PrefixName] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Fname] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Mname] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Lname] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SuffixName] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DOB] [datetime] NULL ,
	[Sex] [int] NULL ,
	[SSN] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MaritalStatus] [int] NULL ,
	[EmployerID] [int] NULL ,
	[Languages] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Weight] [int] NULL ,
	[HeightInInches] [int] NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EntityAddress]    Script Date: 1/22/2008 5:58:38 PM ******/
CREATE TABLE [dbo].[EntityAddress] (
	[recordID] [int] IDENTITY (1, 1) NOT NULL ,
	[EntityID] [int] NOT NULL ,
	[AddressID] [int] NOT NULL ,
	[IsDefault] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EntityPhone]    Script Date: 1/22/2008 5:58:38 PM ******/
CREATE TABLE [dbo].[EntityPhone] (
	[recordID] [int] IDENTITY (1, 1) NOT NULL ,
	[EntityID] [int] NOT NULL ,
	[PhoneID] [int] NOT NULL ,
	[IsDefault] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EntityRS]    Script Date: 1/22/2008 5:58:39 PM ******/
CREATE TABLE [dbo].[EntityRS] (
	[EntityRSID] [int] IDENTITY (1, 1) NOT NULL ,
	[EntityID] [int] NOT NULL ,
	[ColM] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ColE] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ColL] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ColI] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ColA] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ColC] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ColR] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[IsDefault] [int] NOT NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EntitySS]    Script Date: 1/22/2008 5:58:39 PM ******/
CREATE TABLE [dbo].[EntitySS] (
	[EntitySSID] [int] IDENTITY (1, 1) NOT NULL ,
	[EntityID] [int] NOT NULL ,
	[ColM] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ColE] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ColR] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[IsDefault] [int] NOT NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EntityTS]    Script Date: 1/22/2008 5:58:39 PM ******/
CREATE TABLE [dbo].[EntityTS] (
	[EntityTSID] [int] IDENTITY (1, 1) NOT NULL ,
	[EntityID] [int] NOT NULL ,
	[ColM] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ColR] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[IsDefault] [int] NOT NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[File]    Script Date: 1/22/2008 5:58:39 PM ******/
CREATE TABLE [dbo].[File] (
	[FileID] [int] IDENTITY (100, 1) NOT NULL ,
	[FileType] [int] NULL ,
	[ClientID] [int] NOT NULL ,
	[DisplayInGUID] [int] NULL ,
	[ParentFileID] [int] NULL ,
	[UsersID] [int] NULL ,
	[FilePlacementDirectory] [varchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AttemptedServerFile] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ClientDirectory] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ClientFile] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ClientFileExt] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ClientFileName] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ContentSubType] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ContentType] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DateLastAccessed] [datetime] NULL ,
	[FileExisted] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FileSize] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FileWasAppended] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FileWasOverwritten] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FileWasRenamed] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FileWasSaved] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OldFileSize] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ServerDirectory] [varchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ServerFile] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ServerFileExt] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ServerFileName] [varchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TimeCreated] [datetime] NULL ,
	[TimeLastModified] [datetime] NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FileProcess]    Script Date: 1/22/2008 5:58:39 PM ******/
CREATE TABLE [dbo].[FileProcess] (
	[FileProcessID] [int] IDENTITY (100, 1) NOT NULL ,
	[FileID] [int] NOT NULL ,
	[StatusID] [int] NOT NULL ,
	[Note] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[IMChat]    Script Date: 1/22/2008 5:58:39 PM ******/
CREATE TABLE [dbo].[IMChat] (
	[RecordID] [int] IDENTITY (1, 1) NOT NULL ,
	[UsersIDFrom] [int] NOT NULL ,
	[FromActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[UsersIDTo] [int] NOT NULL ,
	[ToActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[UsersIDJoined1] [int] NULL ,
	[Joined1Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[UsersIDJoined2] [int] NULL ,
	[Joined2Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[UsersIDJoined3] [int] NULL ,
	[Joined3Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[IMChatXML] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[InsuranceCompany]    Script Date: 1/22/2008 5:58:39 PM ******/
CREATE TABLE [dbo].[InsuranceCompany] (
	[InsuranceCompanyID] [int] IDENTITY (1001, 1) NOT NULL ,
	[ClientID] [int] NULL ,
	[OCNANumber] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InsuranceCompanyName] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InsuranceCompanyDBA] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[EntityID] [int] NULL ,
	[InsuranceCompanyURL] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Intake]    Script Date: 1/22/2008 5:58:40 PM ******/
CREATE TABLE [dbo].[Intake] (
	[IntakeID] [int] IDENTITY (1, 1) NOT NULL ,
	[ClientID] [int] NOT NULL ,
	[AssignedToUserID] [int] NULL ,
	[hidden_Step] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hidden_UsersID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hidden_TimeStart] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OPTION_1_CBox_Delivery] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OPTION_1_CBox_Pickup] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OPTION_1_CBox_Repair] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OPTION_1_CBox_Switch] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OPTION_1_CBox_Existing] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OPTION_2_CBox_Other] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OPTION_2_CBox_Hospice] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OPTION_2_CBox_Hospital] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[otherTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hospiceTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OPTION_3_CBox_Medicare] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OPTION_3_CBox_PrivateInsurance] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OPTION_3_CBox_Medicaid] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OPTION_3_CBox_PrivatePay] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hospitalTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DischargeDateMM] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DischargeDateDD] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DischargeDateYY] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[typeOfPay_Radio] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[callerFNameTBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[callerMInitialTBox] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[callerLNameTBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[callerPhoneTBox] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[patientXML] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[patientID] [int] NULL ,
	[patientAddressID] [int] NULL ,
	[patientPhoneID] [int] NULL ,
	[roomNumberTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bedNumberTBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[alternateContactFNameTBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[alternateContactMInitialTBox] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[alternateContactLNameTBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[alternateContactRelationshipTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[alternateContactPhoneTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[alternateContactWorkPhoneTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[poNumberTBox] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[creditCardTypeTBox] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[creditCardNumberTBox] [varchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ccDateMM] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ccDateDD] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ccDateYY] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[orderingPhysicianFNameTBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[orderingPhysicianMInitialTBox] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[orderingPhysicianLNameTBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[orderingPhysicianPhoneTBox] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[orderingPhysicianUPINTBox] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[orderingPhysicianFaxTBox] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[orderingPhysicianAddressTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[orderingPhysicianCityTBox] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[orderingPhysicianStateTBox] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[orderingPhysicianZipTBox] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OPTION_13_CBox_PastEquipmentYes] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OPTION_13_CBox_PastEquipmentNo] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment1TypeTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment1RentPurchasedSelect] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment1FromMM] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment1FromDD] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment1FromYY] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment1ToMM] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment1ToDD] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment1ToYY] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment1SupplierNameTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment1SupplierTelephoneTBox] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment2TypeTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment2RentPurchasedSelect] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment2FromMM] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment2FromDD] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment2FromYY] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment2ToMM] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment2ToDD] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment2ToYY] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment2SupplierNameTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment2SupplierTelephoneTBox] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment3TypeTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment3RentPurchasedSelect] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment3FromMM] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment3FromDD] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment3FromYY] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment3ToMM] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment3ToDD] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment3ToYY] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment3SupplierNameTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment3SupplierTelephoneTBox] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment4TypeTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment4RentPurchasedSelect] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment4FromMM] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment4FromDD] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment4FromYY] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment4ToMM] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment4ToDD] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment4ToYY] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment4SupplierNameTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment4SupplierTelephoneTBox] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment5TypeTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment5RentPurchasedSelect] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment5FromMM] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment5FromDD] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment5FromYY] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment5ToMM] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment5ToDD] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment5ToYY] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment5SupplierNameTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment5SupplierTelephoneTBox] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment1NoteTBox] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment2NoteTBox] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment3NoteTBox] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment4NoteTBox] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Equipment5NoteTBox] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OPTION_14_CBox_OxygenPAo2] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OPTION_14_CBox_OxygenSAo2] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OPTION_14_CBox_OxygenSPo2] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OxygenPAO2TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OxygenSAO2TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CPAPStudy_CBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CPAPStudyNote] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OxygenSPO2TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CPAPStudyOnFile_CBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CPAPStudyOnFileNote] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LabTestDateMM] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LabTestDateDD] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LabTestDateYY] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CPAPStudyPerformedAt] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LabTestFacilityTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CPAPStudyPerformedAt2] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CPAPStudyPerformedAt3] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ClosingInvoiceNumber] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OPTION_SkilledNursing] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SkilledNursingName] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SkilledNursingTelephone] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Printed] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[IntakeAssignment]    Script Date: 1/22/2008 5:58:40 PM ******/
CREATE TABLE [dbo].[IntakeAssignment] (
	[INTAKE_AssignmentID] [int] IDENTITY (1, 1) NOT NULL ,
	[IntakeID] [int] NOT NULL ,
	[UserID] [int] NOT NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[AssignorID] [int] NULL ,
	[Note] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[IntakeAutoSave]    Script Date: 1/22/2008 5:58:40 PM ******/
CREATE TABLE [dbo].[IntakeAutoSave] (
	[RecordID] [int] IDENTITY (1, 1) NOT NULL ,
	[UsersID] [int] NOT NULL ,
	[PatientFName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[PatientLName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[IntakeXML] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[IntakeHCPC]    Script Date: 1/22/2008 5:58:40 PM ******/
CREATE TABLE [dbo].[IntakeHCPC] (
	[IntakeHCPCID] [int] IDENTITY (1, 1) NOT NULL ,
	[IntakeID] [int] NOT NULL ,
	[hcpcCode1TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty1TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct1TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX1TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis1TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost1TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear1TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth1TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode2TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty2TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct2TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX2TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis2TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost2TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear2TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth2TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode3TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty3TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct3TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX3TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis3TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost3TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear3TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth3TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode4TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty4TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct4TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX4TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis4TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost4TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear4TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth4TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode5TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty5TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct5TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX5TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis5TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost5TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear5TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth5TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode6TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty6TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct6TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX6TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis6TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost6TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear6TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth6TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode7TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty7TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct7TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX7TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis7TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost7TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear7TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth7TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode8TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty8TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct8TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX8TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis8TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost8TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear8TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth8TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode9TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty9TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct9TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX9TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis9TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost9TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear9TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth9TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode10TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty10TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct10TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX10TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis10TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost10TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear10TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth10TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode11TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty11TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct11TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX11TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis11TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost11TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear11TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth11TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode12TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty12TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct12TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX12TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis12TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost12TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear12TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth12TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode13TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty13TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct13TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX13TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis13TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost13TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear13TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth13TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode14TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty14TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct14TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX14TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis14TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost14TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear14TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth14TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode15TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty15TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct15TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX15TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis15TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost15TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear15TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth15TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode16TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty16TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct16TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX16TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis16TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost16TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear16TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth16TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode17TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty17TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct17TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX17TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis17TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost17TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear17TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth17TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode18TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty18TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct18TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX18TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis18TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost18TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear18TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth18TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode19TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty19TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct19TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX19TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis19TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost19TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear19TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth19TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode20TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty20TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct20TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX20TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis20TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost20TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear20TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth20TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode21TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty21TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct21TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX21TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis21TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost21TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear21TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth21TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode22TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty22TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct22TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX22TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis22TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost22TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear22TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth22TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode23TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty23TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct23TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX23TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis23TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost23TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear23TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth23TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode24TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty24TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct24TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX24TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis24TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost24TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear24TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth24TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode25TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty25TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct25TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX25TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis25TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost25TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear25TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth25TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode26TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty26TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct26TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX26TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis26TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost26TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear26TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth26TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode27TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty27TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct27TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX27TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis27TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost27TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear27TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth27TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode28TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty28TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct28TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX28TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis28TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost28TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear28TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth28TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode29TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty29TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct29TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX29TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis29TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost29TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear29TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth29TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode30TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty30TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct30TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX30TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis30TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost30TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear30TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth30TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode31TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty31TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct31TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX31TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis31TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost31TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear31TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth31TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode32TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty32TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct32TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX32TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis32TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost32TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear32TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth32TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode33TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty33TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct33TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX33TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis33TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost33TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear33TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth33TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode34TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty34TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct34TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX34TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis34TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost34TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear34TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth34TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode35TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty35TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct35TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX35TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis35TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost35TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear35TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth35TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode36TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty36TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct36TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX36TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis36TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost36TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear36TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth36TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode37TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty37TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct37TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX37TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis37TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost37TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear37TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth37TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode38TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty38TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct38TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX38TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis38TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost38TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear38TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth38TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode39TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty39TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct39TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX39TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis39TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost39TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear39TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth39TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode40TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty40TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct40TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX40TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis40TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost40TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear40TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth40TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Interchange]    Script Date: 1/22/2008 5:58:40 PM ******/
CREATE TABLE [dbo].[Interchange] (
	[InterchangeID] [int] IDENTITY (1, 1) NOT NULL ,
	[FileID] [int] NOT NULL ,
	[InterchangeFileID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InterchangeDate] [datetime] NOT NULL ,
	[ClientID] [int] NOT NULL ,
	[InterchangeClientName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InterchangeClientAddressLine1] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InterchangeClientAddressLine2] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InterchangeClientCity] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InterchangeClientState] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InterchangeClientZipcode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LXAssignedNumber] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ReassociationTraceNumber] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InterchangeSenderIDQualifier] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InterchangeSenderID] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InterchangeReceiverIDQualifier] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InterchangeReceiverID] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Log]    Script Date: 1/22/2008 5:58:41 PM ******/
CREATE TABLE [dbo].[Log] (
	[LogID] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[Code] [int] NULL ,
	[IPaddress] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LogText] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Note]    Script Date: 1/22/2008 5:58:41 PM ******/
CREATE TABLE [dbo].[Note] (
	[NoteID] [int] IDENTITY (1000, 1) NOT NULL ,
	[ClientID] [int] NOT NULL ,
	[ObjectID] [int] NOT NULL ,
	[InstanceID] [int] NULL ,
	[Note] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PageHit]    Script Date: 1/22/2008 5:58:41 PM ******/
CREATE TABLE [dbo].[PageHit] (
	[PageHitID] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[PageID] [int] NULL ,
	[SiteID] [int] NULL ,
	[UsersID] [int] NULL ,
	[IPAddress] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[BrowserType] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[BrowserVersion] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OperatingSystem] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Patient]    Script Date: 1/22/2008 5:58:41 PM ******/
CREATE TABLE [dbo].[Patient] (
	[PatientID] [int] IDENTITY (100, 1) NOT NULL ,
	[EntityID] [int] NULL ,
	[ClaimSubmitterIdentifier] [varchar] (38) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NM1IdentificationCode9] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AccountNumber] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PatientInsuranceCompany]    Script Date: 1/22/2008 5:58:41 PM ******/
CREATE TABLE [dbo].[PatientInsuranceCompany] (
	[recordID] [int] IDENTITY (1, 1) NOT NULL ,
	[PatientID] [int] NOT NULL ,
	[InsuranceCompanyID] [int] NOT NULL ,
	[PrimSecTer] [int] NULL ,
	[PolicyNumber] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PolicyHoldersFirstName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PolicyHoldersLastName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PolicyHoldersMiddleInitial] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PolicyHoldersDOB] [datetime] NULL ,
	[PolicyHoldersSex] [int] NULL ,
	[PolicyHoldersAddressLine1] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PolicyHoldersAddressLine2] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PolicyHoldersCity] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PolicyHoldersStateID] [int] NULL ,
	[PolicyHoldersZipCode] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PolicyHoldersPhone] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PolicyHoldersPhoneExtension] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PolicyHoldersEmployerSchoolName] [varchar] (45) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PolicyHoldersEffectiveDateFrom] [datetime] NULL ,
	[PolicyHoldersEffectiveDateTo] [datetime] NULL ,
	[GroupNumber] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[GroupName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Deductible] [money] NULL ,
	[PayPercentage] [int] NULL ,
	[Relationship] [int] NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Phone]    Script Date: 1/22/2008 5:58:41 PM ******/
CREATE TABLE [dbo].[Phone] (
	[PhoneID] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[SiteID] [int] NULL ,
	[PhoneTypeID] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PhoneNumber] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PhoneExtension] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Procedure]    Script Date: 1/22/2008 5:58:41 PM ******/
CREATE TABLE [dbo].[Procedure] (
	[ProcedureID] [int] IDENTITY (1, 1) NOT NULL ,
	[ClaimID] [int] NOT NULL ,
	[ProcedureCode] [int] NOT NULL ,
	[PriorProcedureCode] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ServiceDateFrom] [datetime] NULL ,
	[ServiceDateTo] [datetime] NULL ,
	[BilledQuantity] [float] NULL ,
	[BilledAmount] [money] NULL ,
	[PaidQuantity] [float] NULL ,
	[PaidAmount] [money] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ProcedureEOBcode]    Script Date: 1/22/2008 5:58:42 PM ******/
CREATE TABLE [dbo].[ProcedureEOBcode] (
	[ClaimEOBCodeID] [int] IDENTITY (1, 1) NOT NULL ,
	[ProcedureID] [int] NOT NULL ,
	[EOBCode] [int] NOT NULL ,
	[Status] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ClosingUserID] [int] NULL ,
	[CloseDate] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ProcedureEOPScode]    Script Date: 1/22/2008 5:58:42 PM ******/
CREATE TABLE [dbo].[ProcedureEOPScode] (
	[ClaimEOPSCodeID] [int] IDENTITY (1, 1) NOT NULL ,
	[ProcedureID] [int] NOT NULL ,
	[EOPSCode] [int] NOT NULL ,
	[Status] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ClosingUserID] [int] NULL ,
	[CloseDate] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ProcedureOpenClose]    Script Date: 1/22/2008 5:58:42 PM ******/
CREATE TABLE [dbo].[ProcedureOpenClose] (
	[ProcedureOpenCloseID] [int] IDENTITY (100, 1) NOT FOR REPLICATION  NOT NULL ,
	[ProcedureID] [int] NULL ,
	[OpenOrClose] [int] NOT NULL ,
	[UsersID] [int] NOT NULL ,
	[Note] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Procedure_MEDICARE_CLAIMADJUSTMENT]    Script Date: 1/22/2008 5:58:42 PM ******/
CREATE TABLE [dbo].[Procedure_MEDICARE_CLAIMADJUSTMENT] (
	[Procedure_MEDICARE_CLAIMADJUSTMENTID] [int] IDENTITY (1, 1) NOT NULL ,
	[ProcedureID] [int] NOT NULL ,
	[ClaimAdjustmentGroupCode1] [int] NOT NULL ,
	[ClaimAdjustmentReasonCode2] [int] NOT NULL ,
	[MonetaryAmount3] [money] NOT NULL ,
	[Quantity4] [float] NULL ,
	[ClaimAdjustmentReasonCode5] [int] NULL ,
	[MonetaryAmount6] [money] NULL ,
	[Quantity7] [float] NULL ,
	[ClaimAdjustmentReasonCode8] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MonetaryAmount9] [money] NULL ,
	[Quantity10] [float] NULL ,
	[ClaimAdjustmentReasonCode11] [int] NULL ,
	[MonetaryAmount12] [money] NULL ,
	[Quantity13] [float] NULL ,
	[ClaimAdjustmentReasonCode14] [int] NULL ,
	[MonetaryAmount15] [money] NULL ,
	[Quantity16] [float] NULL ,
	[ClaimAdjustmentReasonCode17] [int] NULL ,
	[MonetaryAmount18] [money] NULL ,
	[Quantity19] [float] NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Procedure_MEDICARE_MODIFIER]    Script Date: 1/22/2008 5:58:42 PM ******/
CREATE TABLE [dbo].[Procedure_MEDICARE_MODIFIER] (
	[Procedure_MEDICARE_MODIFIERID] [int] IDENTITY (1, 1) NOT NULL ,
	[ProcedureID] [int] NOT NULL ,
	[ModifierCode] [int] NULL ,
	[Description] [varchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DateCreated] [datetime] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Procedure_MEDICARE_REMARK_CODE]    Script Date: 1/22/2008 5:58:42 PM ******/
CREATE TABLE [dbo].[Procedure_MEDICARE_REMARK_CODE] (
	[Procedure_MEDICARE_REMARK_CODEID] [int] IDENTITY (1, 1) NOT NULL ,
	[ProcedureID] [int] NOT NULL ,
	[QualifierCode] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[IndustryCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT]    Script Date: 1/22/2008 5:58:42 PM ******/
CREATE TABLE [dbo].[Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT] (
	[Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID] [int] IDENTITY (1, 1) NOT NULL ,
	[ProcedureID] [int] NOT NULL ,
	[QualifierCode] [int] NOT NULL ,
	[MonetaryAmount2] [money] NOT NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Quote]    Script Date: 1/22/2008 5:58:42 PM ******/
CREATE TABLE [dbo].[Quote] (
	[QuoteID] [int] IDENTITY (1, 1) NOT NULL ,
	[ClientID] [int] NOT NULL ,
	[AssignedToUserID] [int] NULL ,
	[hidden_UsersID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hidden_TimeStart] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[callerFNameTBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[callerMInitialTBox] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[callerLNameTBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[callerPhoneTBox] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[patientFNameTBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[patientMInitialTBox] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[patientLNameTBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[roomNumberTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[bedNumberTBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[patientAddressTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[patientCityTBox] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[patientStateTBox] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[patientZipTBox] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[patientPhoneTBox] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[patientDOBMM] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[patientDOBDD] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[patientDOBYY] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OPTION_3a_CBox_PatientSexMale] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OPTION_3a_CBox_PatientSexFemale] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[patientSSNTBox] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[patientHeightFeet] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[patientHeightInches] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[patientWeightTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[alternateContactFNameTBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[alternateContactMInitialTBox] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[alternateContactLNameTBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[alternateContactRelationshipTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[alternateContactPhoneTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[alternateContactWorkPhoneTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[primaryInsuranceNameTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[secondaryInsuranceNameTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[primaryPolicyNumberTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[secondaryPolicyNumberTBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[orderingPhysicianFNameTBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[orderingPhysicianMInitialTBox] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[orderingPhysicianLNameTBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[orderingPhysicianPhoneTBox] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[printed] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Cancelled] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[QuoteHCPC]    Script Date: 1/22/2008 5:58:43 PM ******/
CREATE TABLE [dbo].[QuoteHCPC] (
	[QuoteHCPCID] [int] IDENTITY (1, 1) NOT NULL ,
	[QuoteID] [int] NOT NULL ,
	[hcpcCode1TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty1TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct1TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX1TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis1TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost1TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear1TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth1TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode2TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty2TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct2TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX2TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis2TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost2TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear2TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth2TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode3TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty3TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct3TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX3TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis3TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost3TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear3TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth3TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode4TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty4TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct4TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX4TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis4TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost4TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear4TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth4TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode5TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty5TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct5TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX5TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis5TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost5TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear5TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth5TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode6TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty6TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct6TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX6TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis6TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost6TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear6TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth6TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode7TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty7TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct7TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX7TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis7TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost7TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear7TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth7TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode8TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty8TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct8TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX8TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis8TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost8TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear8TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth8TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode9TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty9TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct9TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX9TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis9TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost9TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear9TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth9TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode10TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty10TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct10TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX10TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis10TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost10TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear10TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth10TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode11TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty11TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct11TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX11TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis11TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost11TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear11TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth11TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode12TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty12TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct12TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX12TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis12TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost12TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear12TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth12TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode13TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty13TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct13TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX13TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis13TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost13TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear13TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth13TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode14TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty14TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct14TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX14TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis14TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost14TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear14TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth14TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode15TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty15TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct15TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX15TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis15TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost15TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear15TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth15TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode16TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty16TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct16TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX16TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis16TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost16TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear16TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth16TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode17TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty17TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct17TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX17TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis17TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost17TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear17TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth17TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode18TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty18TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct18TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX18TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis18TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost18TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear18TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth18TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode19TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty19TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct19TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX19TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis19TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost19TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear19TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth19TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode20TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty20TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct20TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX20TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis20TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost20TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear20TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth20TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode21TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty21TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct21TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX21TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis21TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost21TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear21TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth21TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode22TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty22TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct22TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX22TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis22TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost22TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear22TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth22TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode23TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty23TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct23TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX23TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis23TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost23TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear23TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth23TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode24TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty24TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct24TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX24TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis24TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost24TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear24TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth24TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode25TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty25TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct25TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX25TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis25TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost25TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear25TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth25TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode26TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty26TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct26TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX26TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis26TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost26TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear26TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth26TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode27TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty27TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct27TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX27TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis27TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost27TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear27TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth27TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode28TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty28TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct28TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX28TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis28TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost28TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear28TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth28TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode29TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty29TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct29TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX29TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis29TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost29TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear29TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth29TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode30TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty30TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct30TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX30TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis30TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost30TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear30TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth30TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode31TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty31TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct31TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX31TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis31TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost31TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear31TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth31TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode32TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty32TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct32TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX32TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis32TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost32TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear32TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth32TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode33TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty33TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct33TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX33TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis33TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost33TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear33TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth33TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode34TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty34TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct34TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX34TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis34TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost34TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear34TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth34TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode35TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty35TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct35TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX35TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis35TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost35TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear35TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth35TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode36TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty36TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct36TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX36TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis36TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost36TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear36TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth36TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode37TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty37TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct37TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX37TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis37TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost37TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear37TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth37TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode38TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty38TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct38TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX38TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis38TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost38TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear38TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth38TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode39TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty39TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct39TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX39TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis39TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost39TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear39TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth39TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCode40TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcQty40TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcProduct40TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDX40TBox] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcDiagnosis40TBox] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcCost40TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedYear40TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[hcpcLengthOfNeedMonth40TBox] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Reminder]    Script Date: 1/22/2008 5:58:43 PM ******/
CREATE TABLE [dbo].[Reminder] (
	[ReminderID] [int] IDENTITY (100, 1) NOT NULL ,
	[UsersID] [int] NOT NULL ,
	[ObjectID] [int] NULL ,
	[InstanceID] [int] NULL ,
	[showDate] [datetime] NOT NULL ,
	[Dismissed] [int] NOT NULL ,
	[Note] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Role]    Script Date: 1/22/2008 5:58:43 PM ******/
CREATE TABLE [dbo].[Role] (
	[RoleID] [int] IDENTITY (500, 1) NOT NULL ,
	[RoleName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[SiteID] [int] NOT NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SubCategory]    Script Date: 1/22/2008 5:58:43 PM ******/
CREATE TABLE [dbo].[SubCategory] (
	[SubCategoryID] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[CategoryID] [int] NOT NULL ,
	[SubCategoryName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[SubCategoryURL] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SubCategorySortOrder] [int] NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SystemUserMessage]    Script Date: 1/22/2008 5:58:43 PM ******/
CREATE TABLE [dbo].[SystemUserMessage] (
	[SystemUserMessageID] [int] IDENTITY (100, 1) NOT NULL ,
	[UsersID] [int] NOT NULL ,
	[Dismissed] [int] NOT NULL ,
	[Note] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Task]    Script Date: 1/22/2008 5:58:43 PM ******/
CREATE TABLE [dbo].[Task] (
	[TaskID] [int] IDENTITY (1, 1) NOT NULL ,
	[ClientID] [int] NOT NULL ,
	[CreatorID] [int] NULL ,
	[ObjectID] [int] NULL ,
	[InstanceID] [int] NULL ,
	[Priority] [int] NULL ,
	[AssignedToUserID] [int] NULL ,
	[StatusID] [int] NULL ,
	[DueDate] [datetime] NULL ,
	[Note] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TaskAssignment]    Script Date: 1/22/2008 5:58:44 PM ******/
CREATE TABLE [dbo].[TaskAssignment] (
	[TaskAssignmentID] [int] IDENTITY (1, 1) NOT NULL ,
	[TaskID] [int] NOT NULL ,
	[UsersID] [int] NOT NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[AssignorID] [int] NULL ,
	[Note] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TaskStatus]    Script Date: 1/22/2008 5:58:44 PM ******/
CREATE TABLE [dbo].[TaskStatus] (
	[TaskStatusID] [int] IDENTITY (1, 1) NOT NULL ,
	[TaskID] [int] NOT NULL ,
	[StatusID] [int] NOT NULL ,
	[UsersID] [int] NOT NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[Note] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[UsersRole]    Script Date: 1/22/2008 5:58:44 PM ******/
CREATE TABLE [dbo].[UsersRole] (
	[UsersRoleID] [int] IDENTITY (1, 1) NOT NULL ,
	[UsersID] [int] NOT NULL ,
	[SiteID] [int] NOT NULL ,
	[RoleID] [int] NOT NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[UsersSession]    Script Date: 1/22/2008 5:58:44 PM ******/
CREATE TABLE [dbo].[UsersSession] (
	[UsersSessionID] [int] IDENTITY (1, 1) NOT NULL ,
	[UsersSessionIdentification] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[UsersID] [int] NOT NULL ,
	[IPAddress] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SiteID] [int] NOT NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[UsersWorkGroup]    Script Date: 1/22/2008 5:58:44 PM ******/
CREATE TABLE [dbo].[UsersWorkGroup] (
	[UsersWorkGroupID] [int] IDENTITY (1, 1) NOT FOR REPLICATION  NOT NULL ,
	[UsersID] [int] NOT NULL ,
	[WorkGroupID] [int] NOT NULL ,
	[DateCreated] [datetime] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[VerificationPatientInsurance]    Script Date: 1/22/2008 5:58:44 PM ******/
CREATE TABLE [dbo].[VerificationPatientInsurance] (
	[VerificationPatientInsuranceID] [int] IDENTITY (1, 1) NOT NULL ,
	[usersID] [int] NOT NULL ,
	[picID] [int] NOT NULL ,
	[VerificationRepFName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[VerificationRepLName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[VerificationDate] [datetime] NULL ,
	[VerificationTime] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[VerificationHaveIns] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[VerificationHaveInsFromDate] [datetime] NULL ,
	[VerificationHaveInsToDate] [datetime] NULL ,
	[VerificationHaveDMECov] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[VerificationDeductible] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[VerificationDeductibleAmount] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[VerificationDeductibleAmountMet] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[VerificationPPOPolicy] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[VerificationPercentagePayAfterDeductible] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[VerificationPriorAuth] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[VerificationAuthNumber] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[VerificationLifetimeBenefitMet] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[VerificationAuthPhoneNumber] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[VerificationMedicareSupplement] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[VerificationCoordinateBenefits] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[VerificationPaidMedicareDeductible] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[VerificationMedicaidPlan] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[VerificationTypeBasePlan] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[WorkGroup]    Script Date: 1/22/2008 5:58:44 PM ******/
CREATE TABLE [dbo].[WorkGroup] (
	[WorkGroupID] [int] IDENTITY (100, 1) NOT NULL ,
	[ClientID] [int] NULL ,
	[WorkGroupName] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL ,
	[Description] [varchar] (750) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MondayStart] [datetime] NULL ,
	[MondayEnd] [datetime] NULL ,
	[TuesdayStart] [datetime] NULL ,
	[TuesdayEnd] [datetime] NULL ,
	[WednesdayStart] [datetime] NULL ,
	[WednesdayEnd] [datetime] NULL ,
	[ThursdayStart] [datetime] NULL ,
	[ThursdayEnd] [datetime] NULL ,
	[FridayStart] [datetime] NULL ,
	[FridayEnd] [datetime] NULL ,
	[SaturdayStart] [datetime] NULL ,
	[SaturdayEnd] [datetime] NULL ,
	[SundayStart] [datetime] NULL ,
	[SundayEnd] [datetime] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Address] WITH NOCHECK ADD 
	CONSTRAINT [PK_Address] PRIMARY KEY  CLUSTERED 
	(
		[AddressID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Category] WITH NOCHECK ADD 
	CONSTRAINT [PK_Categories] PRIMARY KEY  CLUSTERED 
	(
		[CategoryID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Claim] WITH NOCHECK ADD 
	CONSTRAINT [PK_WorkItem] PRIMARY KEY  CLUSTERED 
	(
		[ClaimID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ClaimAssignment] WITH NOCHECK ADD 
	CONSTRAINT [PK_ClaimAssignment] PRIMARY KEY  CLUSTERED 
	(
		[ClaimAssignmentID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ClaimStatus] WITH NOCHECK ADD 
	CONSTRAINT [PK_ClaimStatus] PRIMARY KEY  CLUSTERED 
	(
		[ClaimStatusID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Claim_MEDICARE_MOA] WITH NOCHECK ADD 
	CONSTRAINT [PK_MEDICARE_ClaimMOA] PRIMARY KEY  CLUSTERED 
	(
		[Claim_MEDICARE_MOAID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Claim_MEDICARE_SUPPLEMENTAL_AMOUNT] WITH NOCHECK ADD 
	CONSTRAINT [PK_Claim_MEDICARE_SUPPLEMENTAL_AMOUNT] PRIMARY KEY  CLUSTERED 
	(
		[Claim_MEDICARE_SUPPLEMENTAL_AMOUNTID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Claim_ProcessXMLToDB] WITH NOCHECK ADD 
	CONSTRAINT [PK_Claim_ProcessXMLToDB] PRIMARY KEY  CLUSTERED 
	(
		[Claim_ProcessXMLToDBID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ClientProvider] WITH NOCHECK ADD 
	CONSTRAINT [PK_ClientProvider] PRIMARY KEY  CLUSTERED 
	(
		[ClientProviderID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Debug] WITH NOCHECK ADD 
	CONSTRAINT [PK_Debug] PRIMARY KEY  CLUSTERED 
	(
		[DebugID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Doctor] WITH NOCHECK ADD 
	CONSTRAINT [PK_Doctor] PRIMARY KEY  CLUSTERED 
	(
		[DoctorID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EmailAddress] WITH NOCHECK ADD 
	CONSTRAINT [PK_EmailAddress] PRIMARY KEY  CLUSTERED 
	(
		[EmailAddressID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Employer] WITH NOCHECK ADD 
	CONSTRAINT [PK_Employer] PRIMARY KEY  CLUSTERED 
	(
		[EmployerID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Entity] WITH NOCHECK ADD 
	CONSTRAINT [PK_Person] PRIMARY KEY  CLUSTERED 
	(
		[EntityID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EntityAddress] WITH NOCHECK ADD 
	CONSTRAINT [PK_EntityAddress] PRIMARY KEY  CLUSTERED 
	(
		[recordID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EntityPhone] WITH NOCHECK ADD 
	CONSTRAINT [PK_EntityPhone] PRIMARY KEY  CLUSTERED 
	(
		[recordID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EntityRS] WITH NOCHECK ADD 
	CONSTRAINT [PK_EntityRS] PRIMARY KEY  CLUSTERED 
	(
		[EntityRSID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EntitySS] WITH NOCHECK ADD 
	CONSTRAINT [PK_EntitySS] PRIMARY KEY  CLUSTERED 
	(
		[EntitySSID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EntityTS] WITH NOCHECK ADD 
	CONSTRAINT [PK_EntityTS] PRIMARY KEY  CLUSTERED 
	(
		[EntityTSID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[File] WITH NOCHECK ADD 
	CONSTRAINT [PK_File] PRIMARY KEY  CLUSTERED 
	(
		[FileID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[FileProcess] WITH NOCHECK ADD 
	CONSTRAINT [PK_FileProcess] PRIMARY KEY  CLUSTERED 
	(
		[FileProcessID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[IMChat] WITH NOCHECK ADD 
	CONSTRAINT [PK_IMChat] PRIMARY KEY  CLUSTERED 
	(
		[RecordID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[InsuranceCompany] WITH NOCHECK ADD 
	CONSTRAINT [PK_InsuranceCompany] PRIMARY KEY  CLUSTERED 
	(
		[InsuranceCompanyID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Intake] WITH NOCHECK ADD 
	CONSTRAINT [PK_INTAKE_PatientIntakeForm] PRIMARY KEY  CLUSTERED 
	(
		[IntakeID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[IntakeAssignment] WITH NOCHECK ADD 
	CONSTRAINT [PK_INTAKE_Assignment] PRIMARY KEY  CLUSTERED 
	(
		[INTAKE_AssignmentID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[IntakeAutoSave] WITH NOCHECK ADD 
	CONSTRAINT [PK_IntakeAutoSave] PRIMARY KEY  CLUSTERED 
	(
		[RecordID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[IntakeHCPC] WITH NOCHECK ADD 
	CONSTRAINT [PK_IntakeHCPC] PRIMARY KEY  CLUSTERED 
	(
		[IntakeHCPCID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Interchange] WITH NOCHECK ADD 
	CONSTRAINT [PK_Interchange] PRIMARY KEY  CLUSTERED 
	(
		[InterchangeID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Log] WITH NOCHECK ADD 
	CONSTRAINT [PK_LogTable] PRIMARY KEY  CLUSTERED 
	(
		[LogID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Note] WITH NOCHECK ADD 
	CONSTRAINT [PK_Note] PRIMARY KEY  CLUSTERED 
	(
		[NoteID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PageHit] WITH NOCHECK ADD 
	CONSTRAINT [PK_PageHit] PRIMARY KEY  CLUSTERED 
	(
		[PageHitID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Patient] WITH NOCHECK ADD 
	CONSTRAINT [PK_Patient] PRIMARY KEY  CLUSTERED 
	(
		[PatientID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PatientInsuranceCompany] WITH NOCHECK ADD 
	CONSTRAINT [PK_PatientInsuranceCompany] PRIMARY KEY  CLUSTERED 
	(
		[recordID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Phone] WITH NOCHECK ADD 
	CONSTRAINT [PK_Phone] PRIMARY KEY  CLUSTERED 
	(
		[PhoneID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Procedure] WITH NOCHECK ADD 
	CONSTRAINT [PK_ClaimProcedure] PRIMARY KEY  CLUSTERED 
	(
		[ProcedureID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ProcedureEOBcode] WITH NOCHECK ADD 
	CONSTRAINT [PK_ClaimEOBcode] PRIMARY KEY  CLUSTERED 
	(
		[ClaimEOBCodeID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ProcedureEOPScode] WITH NOCHECK ADD 
	CONSTRAINT [PK_ClaimEOPScode] PRIMARY KEY  CLUSTERED 
	(
		[ClaimEOPSCodeID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ProcedureOpenClose] WITH NOCHECK ADD 
	CONSTRAINT [PK_ProcedureOpenClose] PRIMARY KEY  CLUSTERED 
	(
		[ProcedureOpenCloseID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Procedure_MEDICARE_CLAIMADJUSTMENT] WITH NOCHECK ADD 
	CONSTRAINT [PK_Procedure_MEDICARE_CLAIMADJUSTMENT] PRIMARY KEY  CLUSTERED 
	(
		[Procedure_MEDICARE_CLAIMADJUSTMENTID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Procedure_MEDICARE_MODIFIER] WITH NOCHECK ADD 
	CONSTRAINT [PK_MEDICARE_ClaimMODIFIER] PRIMARY KEY  CLUSTERED 
	(
		[Procedure_MEDICARE_MODIFIERID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Procedure_MEDICARE_REMARK_CODE] WITH NOCHECK ADD 
	CONSTRAINT [PK_Procedure_MEDICARE_REMARK_CODE] PRIMARY KEY  CLUSTERED 
	(
		[Procedure_MEDICARE_REMARK_CODEID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT] WITH NOCHECK ADD 
	CONSTRAINT [PK_Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT] PRIMARY KEY  CLUSTERED 
	(
		[Procedure_MEDICARE_SUPPLEMENTAL_AMOUNTID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Quote] WITH NOCHECK ADD 
	CONSTRAINT [PK_Quote] PRIMARY KEY  CLUSTERED 
	(
		[QuoteID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[QuoteHCPC] WITH NOCHECK ADD 
	CONSTRAINT [PK_QuoteHCPC] PRIMARY KEY  CLUSTERED 
	(
		[QuoteHCPCID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Reminder] WITH NOCHECK ADD 
	CONSTRAINT [PK_Reminder] PRIMARY KEY  CLUSTERED 
	(
		[ReminderID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[SubCategory] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubCategories] PRIMARY KEY  CLUSTERED 
	(
		[SubCategoryID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[SystemUserMessage] WITH NOCHECK ADD 
	CONSTRAINT [PK_SystemUserMessage] PRIMARY KEY  CLUSTERED 
	(
		[SystemUserMessageID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Task] WITH NOCHECK ADD 
	CONSTRAINT [PK_Flag] PRIMARY KEY  CLUSTERED 
	(
		[TaskID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TaskAssignment] WITH NOCHECK ADD 
	CONSTRAINT [PK_FlagAssignment] PRIMARY KEY  CLUSTERED 
	(
		[TaskAssignmentID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TaskStatus] WITH NOCHECK ADD 
	CONSTRAINT [PK_FlagStatus] PRIMARY KEY  CLUSTERED 
	(
		[TaskStatusID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[UsersRole] WITH NOCHECK ADD 
	CONSTRAINT [PK_UsersGroups] PRIMARY KEY  CLUSTERED 
	(
		[UsersRoleID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[UsersSession] WITH NOCHECK ADD 
	CONSTRAINT [PK_UsersSession] PRIMARY KEY  CLUSTERED 
	(
		[UsersSessionID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[VerificationPatientInsurance] WITH NOCHECK ADD 
	CONSTRAINT [PK_VerificationPatientInsurance] PRIMARY KEY  CLUSTERED 
	(
		[VerificationPatientInsuranceID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[WorkGroup] WITH NOCHECK ADD 
	CONSTRAINT [PK_WorkGroup] PRIMARY KEY  CLUSTERED 
	(
		[WorkGroupID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Address] ADD 
	CONSTRAINT [DF_Address_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_Address_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Category] ADD 
	CONSTRAINT [DF_Categories_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_Categories_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Claim] ADD 
	CONSTRAINT [DF_WorkItem_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_WorkItem_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[ClaimAssignment] ADD 
	CONSTRAINT [DF_ClaimAssignment_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[ClaimStatus] ADD 
	CONSTRAINT [DF_ClaimStatus_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Claim_MEDICARE_MOA] ADD 
	CONSTRAINT [DF_MEDICARE_ClaimMOA_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Claim_MEDICARE_SUPPLEMENTAL_AMOUNT] ADD 
	CONSTRAINT [DF_Claim_MEDICARE_SUPPLEMENTAL_AMOUNT_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_Claim_MEDICARE_SUPPLEMENTAL_AMOUNT_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Claim_ProcessXMLToDB] ADD 
	CONSTRAINT [DF_Claim_ProcessXMLToDB_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_Claim_ProcessXMLToDB_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[ClientProvider] ADD 
	CONSTRAINT [DF_ClientProvider_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_ClientProvider_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Debug] ADD 
	CONSTRAINT [DF_Debug_TS] DEFAULT (getdate()) FOR [TS]
GO

ALTER TABLE [dbo].[Doctor] ADD 
	CONSTRAINT [DF_Doctor_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_Doctor_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[EmailAddress] ADD 
	CONSTRAINT [DF_EmailAddress_IsDefault] DEFAULT (0) FOR [IsDefault],
	CONSTRAINT [DF_EmailAddress_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_EmailAddress_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Employer] ADD 
	CONSTRAINT [DF_Employer_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_Employer_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Entity] ADD 
	CONSTRAINT [DF_Person_EntityOrPerson] DEFAULT (0) FOR [ObjectTypeID],
	CONSTRAINT [DF_Person_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_Person_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[EntityAddress] ADD 
	CONSTRAINT [DF_EntityAddress_IsDefault] DEFAULT (0) FOR [IsDefault],
	CONSTRAINT [DF_EntityAddress_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_EntityAddress_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[EntityPhone] ADD 
	CONSTRAINT [DF_EntityPhone_IsDefault] DEFAULT (0) FOR [IsDefault],
	CONSTRAINT [DF_EntityPhone_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_EntityPhone_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[EntityRS] ADD 
	CONSTRAINT [DF_EntityRS_IsDefault] DEFAULT (0) FOR [IsDefault],
	CONSTRAINT [DF_EntityRS_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_EntityRS_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[EntitySS] ADD 
	CONSTRAINT [DF_EntitySS_IsDefault] DEFAULT (0) FOR [IsDefault],
	CONSTRAINT [DF_EntitySS_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_EntitySS_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[EntityTS] ADD 
	CONSTRAINT [DF_EntityTS_IsDefault] DEFAULT (0) FOR [IsDefault],
	CONSTRAINT [DF_EntityTS_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_EntityTS_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[File] ADD 
	CONSTRAINT [DF_File_DisplayInGUID] DEFAULT (1) FOR [DisplayInGUID],
	CONSTRAINT [DF_File_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_File_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[FileProcess] ADD 
	CONSTRAINT [DF_FileProcess_StatusID] DEFAULT (94) FOR [StatusID],
	CONSTRAINT [DF_FileProcess_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_FileProcess_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[IMChat] ADD 
	CONSTRAINT [DF_IMChat_FromActive] DEFAULT (1) FOR [FromActive],
	CONSTRAINT [DF_IMChat_ToActive] DEFAULT (1) FOR [ToActive],
	CONSTRAINT [DF_IMChat_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_IMChat_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[InsuranceCompany] ADD 
	CONSTRAINT [DF_InsuranceCompany_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_InsuranceCompany_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Intake] ADD 
	CONSTRAINT [DF_INTAKE_PatientIntakeForm_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_INTAKE_PatientIntakeForm_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[IntakeAssignment] ADD 
	CONSTRAINT [DF_INTAKE_Assignment_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[IntakeAutoSave] ADD 
	CONSTRAINT [DF_IntakeAutoSave_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_IntakeAutoSave_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[IntakeHCPC] ADD 
	CONSTRAINT [DF_IntakeHCPC_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_IntakeHCPC_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Interchange] ADD 
	CONSTRAINT [DF_Interchange_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_Interchange_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Log] ADD 
	CONSTRAINT [DF_LogTable_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_LogTable_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Note] ADD 
	CONSTRAINT [DF_Note_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_Note_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[PageHit] ADD 
	CONSTRAINT [DF_PageHit_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_PageHit_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Patient] ADD 
	CONSTRAINT [DF_Patient_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_Patient_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[PatientInsuranceCompany] ADD 
	CONSTRAINT [DF_PatientInsuranceCompany_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_PatientInsuranceCompany_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Phone] ADD 
	CONSTRAINT [DF_Phone_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_Phone_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[ProcedureOpenClose] ADD 
	CONSTRAINT [DF_ProcedureOpenClose_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_ProcedureOpenClose_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Procedure_MEDICARE_CLAIMADJUSTMENT] ADD 
	CONSTRAINT [DF_Procedure_MEDICARE_CLAIMADJUSTMENT_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_Procedure_MEDICARE_CLAIMADJUSTMENT_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Procedure_MEDICARE_MODIFIER] ADD 
	CONSTRAINT [DF_MEDICARE_ClaimMODIFIER_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Procedure_MEDICARE_REMARK_CODE] ADD 
	CONSTRAINT [DF_Procedure_MEDICARE_REMARK_CODE_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_Procedure_MEDICARE_REMARK_CODE_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT] ADD 
	CONSTRAINT [DF_Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_Procedure_MEDICARE_SUPPLEMENTAL_AMOUNT_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Quote] ADD 
	CONSTRAINT [DF_Quote_Cancelled] DEFAULT (0) FOR [Cancelled],
	CONSTRAINT [DF_Quote_PatientQuoteForm_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_Quote_PatientQuoteForm_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[QuoteHCPC] ADD 
	CONSTRAINT [DF_QuoteHCPC_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_QuoteHCPC_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Reminder] ADD 
	CONSTRAINT [DF_Reminder_Dismissed] DEFAULT (0) FOR [Dismissed],
	CONSTRAINT [DF_Reminder_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_Reminder_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Role] ADD 
	CONSTRAINT [DF_Role_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_Role_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[SubCategory] ADD 
	CONSTRAINT [DF_SubCategories_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_SubCategories_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[SystemUserMessage] ADD 
	CONSTRAINT [DF_SystemUserMessage_Dismissed] DEFAULT (0) FOR [Dismissed],
	CONSTRAINT [DF_SystemUserMessage_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_SystemUserMessage_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Task] ADD 
	CONSTRAINT [DF_Flag_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_Flag_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[TaskAssignment] ADD 
	CONSTRAINT [DF_FlagAssignment_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[TaskStatus] ADD 
	CONSTRAINT [DF_FlagStatus_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[UsersRole] ADD 
	CONSTRAINT [DF_UsersGroups_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_UsersGroups_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[UsersSession] ADD 
	CONSTRAINT [DF_UsersSession_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_UsersSession_DateCreated_1] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[UsersWorkGroup] ADD 
	CONSTRAINT [DF_UsersWorkGroup_DateCreated] DEFAULT (getdate()) FOR [DateCreated],
	CONSTRAINT [PK_UsersWorkGroup] PRIMARY KEY  NONCLUSTERED 
	(
		[UsersWorkGroupID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[VerificationPatientInsurance] ADD 
	CONSTRAINT [DF_VerificationPatientInsurance_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_VerificationPatientInsurance_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[WorkGroup] ADD 
	CONSTRAINT [DF_WorkGroup_DateCreated] DEFAULT (getdate()) FOR [DateCreated]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  View dbo.view_UserAccountParameters    Script Date: 1/22/2008 5:58:45 PM ******/

/****** Object:  View dbo.view_UserAccountParameters    Script Date: 11/3/2007 1:49:24 PM ******/
CREATE VIEW dbo.view_UserAccountParameters
AS
SELECT     u.UsersID, e.Fname, e.Mname, e.Lname
FROM         PA_Master.dbo.Users u INNER JOIN
                      dbo.Entity e ON u.EntityID = e.EntityID


GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

/****** Object:  Stored Procedure dbo.sp_GlobalFooterGet    Script Date: 1/22/2008 5:58:45 PM ******/

/****** Object:  Stored Procedure dbo.sp_GlobalFooterGet    Script Date: 11/3/2007 1:27:27 PM ******/
CREATE PROC sp_GlobalFooterGet 
(
	@GlobalFooterFinal  VARCHAR(8000) OUTPUT
)
AS

DECLARE @Id int
EXEC [PA_Master].[dbo].sp_GlobalFooterGet  @GlobalFooterFinal OUTPUT

RETURN

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Stored Procedure dbo.sp_UserValidLoginTime    Script Date: 1/22/2008 5:58:45 PM ******/

/****** Object:  Stored Procedure dbo.sp_UserValidLoginTime    Script Date: 11/3/2007 1:27:27 PM ******/


CREATE PROC sp_UserValidLoginTime(
	@usersID int,
	@ValidLogin VARCHAR(30) OUTPUT
)
AS

DECLARE @WorkGroupIDs int
DECLARE @DayNumber int
DECLARE @getColStart VARCHAR(15)
DECLARE @getColEnd VARCHAR(15)
DECLARE @CurrentStart DATETIME
DECLARE @CurrentEnd DATETIME

SET @ValidLogin = CONVERT(VARCHAR(30), '0|0')

-- Determine the current day for login
SELECT @DayNumber = DATEPART(dw, getdate())
SELECT @getColStart = CASE @DayNumber WHEN 1 then 'SundayStart' WHEN 2 then 'MondayStart' WHEN 3 then 'TuesdayStart' WHEN 4 then 'WednesdayStart' WHEN 5 then 'ThursdayStart' WHEN 6 then 'FridayStart' WHEN 7 then 'SaturdayStart' END
SELECT @getColEnd = CASE @DayNumber WHEN 1 then 'SundayEnd' WHEN 2 then 'MondayEnd' WHEN 3 then 'TuesdayEnd' WHEN 4 then 'WednesdayEnd' WHEN 5 then 'ThursdayEnd' WHEN 6 then 'FridayEnd' WHEN 7 then 'SaturdayEnd' END

--Cursor 
DECLARE @StartTime DATETIME
DECLARE @EndTime DATETIME
DECLARE @sql nvarchar(4000)
DECLARE @chvDesc varchar(255)
SET @sql = N'SELECT ' + @getColStart + ', ' + @getColEnd + ' FROM WorkGroup WHERE WorkGroupID IN(SELECT WorkGroupID FROM UsersWorkGroup WHERE usersID = ' + CAST(@UsersID AS nVarchar(10)) + ')'
create table #tmptbl (Starts DATETIME, Ends DATETIME)
insert into #tmptbl exec sp_executesql @sql
DECLARE workgroup_cursor CURSOR FOR 
	Select * FROM #tmptbl
OPEN workgroup_cursor
FETCH NEXT FROM workgroup_cursor INTO @StartTime, @EndTime
WHILE @@FETCH_STATUS = 0
BEGIN
	

	--Start the looping of the records to find the start and end
	
	IF IsDate(@CurrentStart) = 0
	BEGIN	
		SET @CurrentStart = @StartTime					
	END
	ELSE IF IsDate(@CurrentStart) = 1 
	BEGIN
		IF @CurrentStart > @StartTime
		BEGIN	
			SET @CurrentStart = @StartTime	
		END
	END 

	IF IsDate(@CurrentEnd) = 0
	BEGIN	
		SET @CurrentEnd = @EndTime				
	END
	ELSE IF IsDate(@CurrentEnd) = 1 
	BEGIN
		IF @CurrentEnd < @EndTime
		BEGIN	
			SET @CurrentEnd = @EndTime	
		END
	END 
	
	--End the looping of the records to find the start and end

	
FETCH NEXT FROM workgroup_cursor INTO @StartTime, @EndTime
END
CLOSE workgroup_cursor
DEALLOCATE workgroup_cursor


/**************************************************************************************************/
/*** After checking the groups for their allowed login time check the users allowed login time. ***/
/**************************************************************************************************/
DECLARE @UsersLoginStart DATETIME
DECLARE @UsersLoginEnd DATETIME
SELECT @UsersLoginStart = LoginStart, @UsersLoginEnd = LoginEnd 
FROM [PA_Master].[dbo].Users
WHERE UsersID = @UsersID

IF IsDate(@CurrentStart) = 0
BEGIN	
	SET @CurrentStart = @UsersLoginStart	
END
ELSE IF IsDate(@CurrentStart) = 1 
BEGIN
	IF @CurrentStart > @UsersLoginStart
	BEGIN	
		SET @CurrentStart = @UsersLoginStart
	END
END 

IF IsDate(@CurrentEnd) = 0
BEGIN	
	SET @CurrentEnd = @UsersLoginEnd			
END
ELSE IF IsDate(@CurrentEnd) = 1 
BEGIN
	IF @CurrentEnd < @UsersLoginEnd
	BEGIN	
		SET @CurrentEnd = @UsersLoginEnd
	END
END   




/**************************************************************************************************/
/*** We have the final dates we have to check that the current time is within the dates.        ***/
/**************************************************************************************************/
IF IsDate(@CurrentStart) = 1 AND IsDate(@CurrentEnd) = 1
BEGIN
	
	DECLARE @CurrentHour varchar(2)
	DECLARE @CurrentHourStart varchar(2)
	DECLARE @CurrentHourEnd varchar(2)
	DECLARE @CurrentHourMinute varchar(2)
	DECLARE @CurrentHourStartMinute varchar(2)
	DECLARE @CurrentHourEndMinute varchar(2)
	DECLARE @tempStart DATETIME
	DECLARE @tempEnd DATETIME
	DECLARE @tempStartDayTime VARCHAR(25)
	DECLARE @tempEndDayTime VARCHAR(25)
	DECLARE @tempYear VARCHAR(4) 
	DECLARE @tempMonth VARCHAR(2)
	DECLARE @tempDay VARCHAR(2)

	SET @CurrentHour = DATEPART(hour, Getdate())
	SET @CurrentHourStart = DATEPART(hour, @CurrentStart)
	SET @CurrentHourEnd = DATEPART(hour, @CurrentEnd)	
	SET @CurrentHourMinute = DATEPART(Minute, Getdate())
	SET @CurrentHourStartMinute = DATEPART(Minute, @CurrentStart)
	SET @CurrentHourEndMinute = DATEPART(Minute, @CurrentEnd)		
	SET @tempYear = YEAR(getDate())
	SET @tempMonth = MONTH(getDate())
	SET @tempDay = DAY(getDate())
	SET @tempStartDayTime = @tempYear + '-' + @tempMonth + '-' + @tempDay + ' ' + @CurrentHourStart + ':' + @CurrentHourStartMinute + ':' + '00.998'
	SET @tempEndDayTime = @tempYear + '-' + @tempMonth + '-' + @tempDay + ' ' + @CurrentHourEnd + ':' + @CurrentHourEndMinute + ':' + '00.998'
	SET @tempStart = CAST(@tempStartDayTime AS DateTime) 
	SET @tempEnd = CAST(@tempEndDayTime AS DateTime) 


--DEBUG
--PRINT @tempStart
--PRINT @tempEnd
	
	IF getDate() BETWEEN @tempStart AND @tempEnd 
	BEGIN
		SET @ValidLogin = CONVERT(VARCHAR(1), '1') + '|' + CONVERT(VARCHAR(28), @tempEnd)
	END

END

--DEBUG
--PRINT @ValidLogin

--To RUN call this line
--exec sp_UserValidLoginTime 55, 0

RETURN 



GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Stored Procedure dbo.sp_GetAdministratorInformation    Script Date: 1/22/2008 5:58:45 PM ******/

/****** Object:  Stored Procedure dbo.sp_GetAdministratorInformation    Script Date: 11/3/2007 1:27:27 PM ******/





CREATE PROCEDURE sp_GetAdministratorInformation @ClientID int AS

SELECT u.UsersID, E.EntityID, E.Fname, E. Lname, E.Mname, E.DOB, E.SSN, E.Sex, E.Active 
FROM [PA_Master].[dbo].Users AS u INNER JOIN Entity AS E ON u.EntityID = E.EntityID 
WHERE E.EntityID = (SELECT AdministratorEntityID FROM [PA_Master].[dbo].[Client] WHERE ClientID = @ClientID)




GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Stored Procedure dbo.sp_GetUserInformation    Script Date: 1/22/2008 5:58:45 PM ******/

/****** Object:  Stored Procedure dbo.sp_GetUserInformation    Script Date: 11/3/2007 1:27:27 PM ******/
CREATE PROCEDURE sp_GetUserInformation @usersID int AS

SELECT E.EntityID, E.Fname, E. Lname, E.Mname, E.DOB, E.SSN, E.Sex, E.Active 
FROM [PA_Master].[dbo].[Users] AS MedU INNER JOIN Entity AS E ON MedU.EntityID = E.EntityID 
WHERE MedU.UsersID = @USersID 



GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

/****** Object:  Stored Procedure dbo.sp_GetUsersLastSession    Script Date: 1/22/2008 5:58:45 PM ******/

/****** Object:  Stored Procedure dbo.sp_GetUsersLastSession    Script Date: 11/3/2007 1:27:27 PM ******/
CREATE PROC sp_GetUsersLastSession @usersID int, @lastLogin DATETIME = NULL OUTPUT
AS
--DECLARE @lastLogin datetime
--11/24/2005 9:40:53 AM
/* Get the users last login before the current one. */
SELECT TOP 1 @lastLogin = DateCreated
FROM usersSession WITH (NOLOCK)
WHERE UsersID = @usersID  AND DateCreated < (SELECT max(DateCreated) FROM usersSession WITH (NOLOCK) WHERE UsersID = @usersID)
ORDER BY DateCreated DESC
RETURN CONVERT(CHAR(22), @LastLogin, 112)


GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

/****** Object:  Stored Procedure dbo.sp_InvalidateUsersPriorSessions    Script Date: 1/22/2008 5:58:45 PM ******/

/****** Object:  Stored Procedure dbo.sp_InvalidateUsersPriorSessions    Script Date: 11/3/2007 1:27:27 PM ******/
CREATE PROC sp_InvalidateUsersPriorSessions  @usersID int
AS
/* Select the users records where the mofied date is null because that means that the user just logged in but  */
/* never navigated in the site. this would be the latest record and that is the record their session is based on.  */
DECLARE @excludedID int, @tempVar int
SELECT TOP 1 @tempVar =  UsersSessionID FROM usersSession WITH (NOLOCK) WHERE usersID = @usersID AND DateModified IS NULL ORDER BY DATECreated DESC
/* If a record was found it means that the users other records must be updated.                                                */  
IF (@tempVar > 1) 
    BEGIN
       SET @excludedID = @tempVar  
    END 
/* If no records were found with a null DateModified then we must get the last record ID that was inserted.       */
ELSE IF  (@tempVar IS NULL) 
    BEGIN
          SELECT TOP 1 @excludedID = UsersSessionID FROM usersSession WITH (NOLOCK) WHERE usersID = @usersID ORDER BY DATEMODIFIED DESC		
    END
UPDATE usersSession WITH (ROWLOCK)
SET Active = 0, InactiveCode = 68
WHERE usersID = @usersID AND UsersSessionID != @excludedID


GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

/****** Object:  Stored Procedure dbo.sp_UpdateClaimAssignedToUsersID    Script Date: 1/22/2008 5:58:45 PM ******/

/****** Object:  Stored Procedure dbo.sp_UpdateClaimAssignedToUsersID    Script Date: 11/3/2007 1:27:27 PM ******/
CREATE PROC sp_UpdateClaimAssignedToUsersID @claimID int
AS
DECLARE @currentID INT
/* Get the users last login before the current one. */
SELECT TOP 1 @currentID = UserID
FROM ClaimAssignment WITH (NOLOCK)
WHERE claimID = @claimID -- AND DateCreated < (SELECT max(DateCreated) FROM ClaimAssignment WITH (NOLOCK) WHERE claimID = @claimID)
ORDER BY DateCreated DESC
UPDATE Claim WITH (ROWLOCK)
SET AssignedToUserID = @currentID
WHERE ClaimID = @claimID


GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

/****** Object:  Stored Procedure dbo.sp_UpdateClaimStatus    Script Date: 1/22/2008 5:58:45 PM ******/

/****** Object:  Stored Procedure dbo.sp_UpdateClaimStatus    Script Date: 11/3/2007 1:27:27 PM ******/
CREATE PROC sp_UpdateClaimStatus @ClaimID int
 
AS
 
DECLARE @currentID INT
 
SELECT TOP 1 @currentID = statusID
FROM ClaimStatus WITH (NOLOCK)
WHERE ClaimID = @ClaimID 
ORDER BY DateCreated DESC
 
UPDATE Claim WITH (ROWLOCK)
SET statusID = @currentID
WHERE ClaimID = @ClaimID


GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Stored Procedure dbo.sp_UpdateIntakeAssignedToUsersID    Script Date: 1/22/2008 5:58:45 PM ******/

/****** Object:  Stored Procedure dbo.sp_UpdateIntakeAssignedToUsersID    Script Date: 11/3/2007 1:27:27 PM ******/
CREATE PROC sp_UpdateIntakeAssignedToUsersID @IntakeID int
AS
DECLARE @currentID INT
/* Get the users last login before the current one. */
SELECT TOP 1 @currentID = UserID
FROM IntakeAssignment WITH (NOLOCK)
WHERE IntakeID = @IntakeID -- AND DateCreated < (SELECT max(DateCreated) FROM IntakeAssignment WITH (NOLOCK) WHERE IntakeID = @IntakeID)
ORDER BY DateCreated DESC
UPDATE Intake WITH (ROWLOCK)
SET AssignedToUserID = @currentID
WHERE IntakeID = @IntakeID


GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

/****** Object:  Stored Procedure dbo.sp_UpdateTaskAssignedToUsersID    Script Date: 1/22/2008 5:58:45 PM ******/

/****** Object:  Stored Procedure dbo.sp_UpdateTaskAssignedToUsersID    Script Date: 11/3/2007 1:27:27 PM ******/
CREATE PROC sp_UpdateTaskAssignedToUsersID @TaskID int
AS
DECLARE @currentID INT
SELECT TOP 1 @currentID = UsersID
FROM TaskAssignment WITH (NOLOCK)
WHERE TaskID = @TaskID 
ORDER BY DateCreated DESC
UPDATE Task WITH (ROWLOCK)
SET AssignedToUserID = @currentID
WHERE TaskID = @TaskID


GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

/****** Object:  Stored Procedure dbo.sp_UpdateTaskStatus    Script Date: 1/22/2008 5:58:45 PM ******/

/****** Object:  Stored Procedure dbo.sp_UpdateTaskStatus    Script Date: 11/3/2007 1:27:27 PM ******/
CREATE PROC sp_UpdateTaskStatus @TaskID int
AS
DECLARE @currentID INT
SELECT TOP 1 @currentID = statusID
FROM TaskStatus WITH (NOLOCK)
WHERE TaskID = @TaskID 
ORDER BY DateCreated DESC
UPDATE Task WITH (ROWLOCK)
SET statusID = @currentID
WHERE TaskID = @TaskID


GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


exec sp_addextendedproperty N'MS_Description', N'leave this here but find out why it is here.', N'user', N'dbo', N'table', N'Claim', N'column', N'ClientID'
GO
exec sp_addextendedproperty N'MS_Description', N'(835 CLPs.FacilityCodeValue8.XMLText) Code identifying the type of facility where services were performed; the first and second positions of the Uniform Bill Type code or the Place of Service code from the Electronic Media Claims National Standard Format', N'user', N'dbo', N'table', N'Claim', N'column', N'FacilityCode'


GO


exec sp_addextendedproperty N'MS_Description', N'0=Male 1=Female', N'user', N'dbo', N'table', N'Entity', N'column', N'Sex'


GO


exec sp_addextendedproperty N'MS_Description', N'Will this display for the user to see. If the file is a child of another you may not want to show it.', N'user', N'dbo', N'table', N'File', N'column', N'DisplayInGUID'
GO
exec sp_addextendedproperty N'MS_Description', N'Users Id that uploaded this file', N'user', N'dbo', N'table', N'File', N'column', N'UsersID'
GO
exec sp_addextendedproperty N'MS_Description', N'Directory that file was placed in starting from root.', N'user', N'dbo', N'table', N'File', N'column', N'FilePlacementDirectory'
GO
exec sp_addextendedproperty N'MS_Description', N'Initial name ColdFusion used attempting to save a file, for example, myfile.txt.', N'user', N'dbo', N'table', N'File', N'column', N'AttemptedServerFile'
GO
exec sp_addextendedproperty N'MS_Description', N'Directory location of the file uploaded from the client''s system.', N'user', N'dbo', N'table', N'File', N'column', N'ClientDirectory'
GO
exec sp_addextendedproperty N'MS_Description', N'Name of the file uploaded from the client''s system.', N'user', N'dbo', N'table', N'File', N'column', N'ClientFile'
GO
exec sp_addextendedproperty N'MS_Description', N'Extension of the uploaded file on the client''s system without a period, for example, txt not .txt.', N'user', N'dbo', N'table', N'File', N'column', N'ClientFileExt'
GO
exec sp_addextendedproperty N'MS_Description', N'Filename without an extension of the uploaded file on the client''s system.', N'user', N'dbo', N'table', N'File', N'column', N'ClientFileName'
GO
exec sp_addextendedproperty N'MS_Description', N'MIME content subtype of the saved file.', N'user', N'dbo', N'table', N'File', N'column', N'ContentSubType'
GO
exec sp_addextendedproperty N'MS_Description', N'MIME content type of the saved file.', N'user', N'dbo', N'table', N'File', N'column', N'ContentType'
GO
exec sp_addextendedproperty N'MS_Description', N'Date and time the uploaded file was last accessed.', N'user', N'dbo', N'table', N'File', N'column', N'DateLastAccessed'
GO
exec sp_addextendedproperty N'MS_Description', N'Indicates (Yes or No) whether or not the file already existed with the same path.', N'user', N'dbo', N'table', N'File', N'column', N'FileExisted'
GO
exec sp_addextendedproperty N'MS_Description', N'Size of the uploaded file.', N'user', N'dbo', N'table', N'File', N'column', N'FileSize'
GO
exec sp_addextendedproperty N'MS_Description', N'Indicates (Yes or No) whether or not ColdFusion appended the uploaded file to an existing file.', N'user', N'dbo', N'table', N'File', N'column', N'FileWasAppended'
GO
exec sp_addextendedproperty N'MS_Description', N'Indicates (Yes or No) whether or not ColdFusion overwrote a file.', N'user', N'dbo', N'table', N'File', N'column', N'FileWasOverwritten'
GO
exec sp_addextendedproperty N'MS_Description', N'Indicates (Yes or No) whether or not the uploaded file was renamed to avoid a name conflict.', N'user', N'dbo', N'table', N'File', N'column', N'FileWasRenamed'
GO
exec sp_addextendedproperty N'MS_Description', N'Indicates (Yes or No) whether or not Cold Fusion saved a file.', N'user', N'dbo', N'table', N'File', N'column', N'FileWasSaved'
GO
exec sp_addextendedproperty N'MS_Description', N'Size of a file that was overwritten in the file upload operation.', N'user', N'dbo', N'table', N'File', N'column', N'OldFileSize'
GO
exec sp_addextendedproperty N'MS_Description', N'Directory of the file actually saved on the server.', N'user', N'dbo', N'table', N'File', N'column', N'ServerDirectory'
GO
exec sp_addextendedproperty N'MS_Description', N'Filename of the file actually saved on the server.', N'user', N'dbo', N'table', N'File', N'column', N'ServerFile'
GO
exec sp_addextendedproperty N'MS_Description', N'Extension of the uploaded file on the server, without a period, for example, txt not .txt.', N'user', N'dbo', N'table', N'File', N'column', N'ServerFileExt'
GO
exec sp_addextendedproperty N'MS_Description', N'Filename, without an extension, of the uploaded file on the server.', N'user', N'dbo', N'table', N'File', N'column', N'ServerFileName'
GO
exec sp_addextendedproperty N'MS_Description', N'Time the uploaded file was created.', N'user', N'dbo', N'table', N'File', N'column', N'TimeCreated'
GO
exec sp_addextendedproperty N'MS_Description', N'Time the uploaded file was last modified.', N'user', N'dbo', N'table', N'File', N'column', N'TimeLastModified'


GO


exec sp_addextendedproperty N'MS_Description', N'This is the XML element ISA.GS.LX.AssignedNumber1.XMLText', N'user', N'dbo', N'table', N'Interchange', N'column', N'LXAssignedNumber'


GO


exec sp_addextendedproperty N'MS_Description', N'Use this column to place the ID of the record to which it is bound. Fir instance in the note is on a person what person ID does it belong to.', N'user', N'dbo', N'table', N'Note', N'column', N'InstanceID'


GO


exec sp_addextendedproperty N'MS_Description', N'XML element CLPs[i].SVC[SVCi].CompositeMedicalProcedureIdentifier6.XMLText', N'user', N'dbo', N'table', N'Procedure', N'column', N'PriorProcedureCode'


GO


exec sp_addextendedproperty N'MS_Description', N'0=Close 1=Open', N'user', N'dbo', N'table', N'ProcedureOpenClose', N'column', N'OpenOrClose'


GO


exec sp_addextendedproperty N'MS_Description', N'StandartListItemID = 13', N'user', N'dbo', N'table', N'Procedure_MEDICARE_CLAIMADJUSTMENT', N'column', N'ClaimAdjustmentGroupCode1'
GO
exec sp_addextendedproperty N'MS_Description', N'Taken from EOB_MEDICARE_CLAIMADJUSTMENTCode table', N'user', N'dbo', N'table', N'Procedure_MEDICARE_CLAIMADJUSTMENT', N'column', N'ClaimAdjustmentReasonCode2'
GO
exec sp_addextendedproperty N'MS_Description', N'Taken from EOB_MEDICARE_CLAIMADJUSTMENTCode table', N'user', N'dbo', N'table', N'Procedure_MEDICARE_CLAIMADJUSTMENT', N'column', N'ClaimAdjustmentReasonCode5'
GO
exec sp_addextendedproperty N'MS_Description', N'Taken from EOB_MEDICARE_CLAIMADJUSTMENTCode table', N'user', N'dbo', N'table', N'Procedure_MEDICARE_CLAIMADJUSTMENT', N'column', N'ClaimAdjustmentReasonCode8'
GO
exec sp_addextendedproperty N'MS_Description', N'Taken from EOB_MEDICARE_CLAIMADJUSTMENTCode table', N'user', N'dbo', N'table', N'Procedure_MEDICARE_CLAIMADJUSTMENT', N'column', N'ClaimAdjustmentReasonCode11'
GO
exec sp_addextendedproperty N'MS_Description', N'Taken from EOB_MEDICARE_CLAIMADJUSTMENTCode table', N'user', N'dbo', N'table', N'Procedure_MEDICARE_CLAIMADJUSTMENT', N'column', N'ClaimAdjustmentReasonCode14'
GO
exec sp_addextendedproperty N'MS_Description', N'Taken from EOB_MEDICARE_CLAIMADJUSTMENTCode table', N'user', N'dbo', N'table', N'Procedure_MEDICARE_CLAIMADJUSTMENT', N'column', N'ClaimAdjustmentReasonCode17'


GO


exec sp_addextendedproperty N'MS_Description', N'Modifier Code passed in SVC01-3-6', N'user', N'dbo', N'table', N'Procedure_MEDICARE_MODIFIER', N'column', N'ModifierCode'
GO
exec sp_addextendedproperty N'MS_Description', N'This is the description passed in the 835 implementation guide SVC01-7', N'user', N'dbo', N'table', N'Procedure_MEDICARE_MODIFIER', N'column', N'Description'


GO


exec sp_addextendedproperty N'MS_Description', N'Dismissed: 1=yes 0=no', N'user', N'dbo', N'table', N'Reminder', N'column', N'Dismissed'


GO


exec sp_addextendedproperty N'MS_Description', N'Date the flag must be cleared.', N'user', N'dbo', N'table', N'Task', N'column', N'DueDate'


GO


exec sp_addextendedproperty N'MS_Description', N'StandardList = 20', N'user', N'dbo', N'table', N'TaskStatus', N'column', N'StatusID'


GO

