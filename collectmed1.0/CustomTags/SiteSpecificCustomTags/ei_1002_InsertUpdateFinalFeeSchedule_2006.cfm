<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---   ei_1002_InsertUpdateFinalFeeSchedule.cfm                 --->
<!--- @@NAME@@                                                   --->
<!------------------------------------------------------------------>
<!--- CATEGORY:                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---   Maintenance                                              --->
<!--- @@CATEGORY@@                                               --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- AUTHOR:                                                    --->
<!--- @@AUTHOR@@                                                 --->
<!---   Guillermo Cruz                                           --->
<!--- @@AUTHOR@@                                                 --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- DESCRIPTION:                                               --->      
<!--- @@DESCRIPTION@@                                            --->
<!--- File: #trim(request.applicationPath)#\                     --->
<!--- eobmanager\eob_1002_Codes_Import\                          --->
<!--- 2006FeeScheduleRegionC.txt                                 --->
<!--- @@DESCRIPTION@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@EXAMPLECALL@@                                            --->
<!---  &lt;cf_ei_1002_InsertUpdateFinalFeeSchedule<br>           --->
<!---  &nbsp;&nbsp;testmode="no"                                 --->
<!--- @@EXAMPLECALL@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- REQUIRED PARAMETERS:                                       --->
<!--- @@REQUIREDPARAMETERS@@                                     --->
<!---  [none]                                                    --->  
<!--- @@REQUIREDPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- OPTIONAL PARAMETERS:                                       --->
<!--- @@OPTIONALPARAMETERS@@                                     --->
<!--- <b>filepath</b> (#trim(request.driveLetter)#:\             --->
<!--- eobmanager\eob_1002_Codes_Import)<br>                      --->
<!--- <strong>filename</strong> (2006FeeScheduleRegionC.txt)     --->
<!---<br>                                                        --->
<!--- <strong>testmode</strong> <b>TRUE</b>|FALSE&nbsp;          --->
<!---          (allows test prior to actual action)              --->  
<!--- @@OPTIONALPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- RETURNED PARAMETERS:                                       --->
<!--- @@RETURNEDPARAMETERS@@                                     --->
<!---   output to screen row action.                             --->  
<!--- @@RETURNEDPARAMETERS@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!--- @@HISTORY@@                                                --->
<!---    Created 08/03/05                                        --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->      
<!------------------------------------------------------------------> 



<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------>
<!--- Column Names                                                                                                                                                                                                           --->
<!--- HCPCS|Mod|Mod2|JURIS|CATG|Ceiling|Floor|AL|AR|AZ|CA|CO|CT|DC|DE|FL|GA|IA|ID|IL|IN|KS|KY|LA|MA|MD|ME|MI|MN|MO|MS|MT|NC|ND|NE|NH|NJ|NM|NV|NY|OH|OK|OR|PA|RI|SC|SD|TN|TX|UT|VA|VT|WA|WI|WV|WY|AK|HI|PR|VI|Description     --->
<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------>



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.testmode" default="yes">
	<cfset testmode = attributes.testmode> 
	
	<cfparam name="attributes.filepath" default="C:\EOBManager\eob_1002_Codes_Import\feeCodesFees\2006">
	<cfset filepath = attributes.filepath>

	<cfparam name="attributes.filename" default="DMEFeeSchedule_2006_PIPE.txt">
	<cfset filename = attributes.filename>
	
	<cfparam name="attributes.modifiers" default="AU,AV,AW,BA,KC,KF,KM,KN,NU,RR,UE">
	<cfset modifiers = attributes.modifiers>
	
	<cfparam name="attributes.categories" default="CR,FS,IN,OS,OX,PO,SD,SU,TE,TS">
	<cfset categories = attributes.categories>
	
	<cfset count = 1>
	
	<cfset modsList = "">
	<cfset MOD1 = "NULL">	
	<cfset MOD2 = "NULL">
	<cfset MOD3 = "NULL">
	<cfset MOD4 = "NULL">
	


<!------------------------------------------------------------------>
<!--- Set the timeout for the code to be able to run throughly.  --->
<!------------------------------------------------------------------>
	<cfsetting requestTimeOut = "900">
	
	
	
<!------------------------------------------------------------------>
<!--- Verify the needed variables were passed in.                --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="filename,filepath"
		fieldnames="File Name,File Path">	


	
<!------------------------------------------------------------------>
<!--- Include the files that contain the necessary javascript    --->
<!--- and cfscripts to run this page.                            --->
<!------------------------------------------------------------------>
	<cf_gcCFScriptIncludes>
	<cf_gcJScriptIncludes>



<!------------------------------------------------------------------>
<!--- Check to make sure the directory actually exists.          --->
<!------------------------------------------------------------------>
	<cfif NOT DirectoryExists("#trim(filepath)#\")>
		<cf_gcGeneralErrorTemplate
			message="The specified path does not exist (#trim(filepath)#).">
	</cfif>



<!------------------------------------------------------------------>
<!--- Check to make sure the file actually exists.               --->
<!------------------------------------------------------------------>
	<cfif NOT FileExists("#trim(filepath)#\#trim(fileName)#")>
		<cf_gcGeneralErrorTemplate
			message="The file you are trying to view is not in the specified path (#trim(filepath)#\#trim(fileName)#).">
	</cfif>



<!------------------------------------------------------------------>
<!--- Read the file that has been sent in and set it ue.         --->
<!------------------------------------------------------------------>
	<cffile
		action="READ"
		file="#trim(filepath)#\#trim(fileName)#" variable="fileContent">
		
		
		
<!------------------------------------------------------------------>
<!--- Output to the screen.                                      --->
<!------------------------------------------------------------------>	
	
	<cfif testmode>
		<font size="5" color="FF0000">RAN IN TEST MODE</font><p>
	<cfelse>
		<font size="5" color="FF0000">RAN IN LIVE MODE</font><p>	
	</cfif>
	
	
		
<!------------------------------------------------------------------>
<!--- Loop through the file content that was read in and use     --->
<!--- the newline and line feed as the delimeter and put each    --->
<!--- line item into the database depending on the code. If      --->
<!--- the code already exists then simply the description may    --->
<!--- have changed. so update the description. If the code       --->
<!--- does not exist then enter into the database.               --->
<!------------------------------------------------------------------>

	<cfset newModlist ="">
			
	<cfloop list="#trim(fileContent)#" delimiters="#chr(13)##chr(10)#" index="i">
				
		<cfset HCPCS = ListGetAt(i,1,"|")>
		<cfset Mod1 = ListGetAt(i,2,"|")>
		<cfset Mod2 = ListGetAt(i,3,"|")>
		<cfset Juris = ListGetAt(i,4,"|")>
		<cfset Category = ListGetAt(i,5,"|")>
		<cfset Ceiling = ListGetAt(i,6,"|")>
		<cfset Floor = ListGetAt(i,7,"|")>
		<cfset AL = ListGetAt(i,8,"|")>
		<cfset AR = ListGetAt(i,9,"|")>
		<cfset AZ = ListGetAt(i,10,"|")>
		<cfset CA = ListGetAt(i,11,"|")>
		<cfset CO = ListGetAt(i,12,"|")>
		<cfset CT = ListGetAt(i,13,"|")>
		<cfset DC = ListGetAt(i,14,"|")>
		<cfset DE = ListGetAt(i,15,"|")>
		<cfset FL = ListGetAt(i,16,"|")>
		<cfset GA = ListGetAt(i,17,"|")>
		<cfset IA = ListGetAt(i,18,"|")>
		<cfset ID = ListGetAt(i,19,"|")>
		<cfset IL = ListGetAt(i,20,"|")>
		<cfset IN = ListGetAt(i,21,"|")>
		<cfset KS = ListGetAt(i,22,"|")>
		<cfset KY = ListGetAt(i,23,"|")>
		<cfset LA = ListGetAt(i,24,"|")>
		<cfset MA = ListGetAt(i,25,"|")>
		<cfset MD = ListGetAt(i,26,"|")>
		<cfset ME = ListGetAt(i,27,"|")>
		<cfset MI = ListGetAt(i,28,"|")>
		<cfset MN = ListGetAt(i,29,"|")>
		<cfset MO = ListGetAt(i,30,"|")>
		<cfset MS = ListGetAt(i,31,"|")>
		<cfset MT = ListGetAt(i,32,"|")>
		<cfset NC = ListGetAt(i,33,"|")>
		<cfset ND = ListGetAt(i,34,"|")>
		<cfset NE = ListGetAt(i,35,"|")>
		<cfset NH = ListGetAt(i,36,"|")>
		<cfset NJ = ListGetAt(i,37,"|")>
		<cfset NM = ListGetAt(i,38,"|")>
		<cfset NV = ListGetAt(i,39,"|")>
		<cfset NY = ListGetAt(i,40,"|")>
		<cfset OH = ListGetAt(i,41,"|")>
		<cfset OK = ListGetAt(i,42,"|")>
		<cfset ORe = ListGetAt(i,43,"|")>
		<cfset PA = ListGetAt(i,44,"|")>
		<cfset RI = ListGetAt(i,45,"|")>
		<cfset SC = ListGetAt(i,46,"|")>
		<cfset SD = ListGetAt(i,47,"|")>
		<cfset TN = ListGetAt(i,48,"|")>
		<cfset TX = ListGetAt(i,49,"|")>
		<cfset UT = ListGetAt(i,50,"|")>
		<cfset VA = ListGetAt(i,51,"|")>
		<cfset VT = ListGetAt(i,52,"|")>
		<cfset WA = ListGetAt(i,53,"|")>
		<cfset WI = ListGetAt(i,54,"|")>
		<cfset WV = ListGetAt(i,55,"|")>
		<cfset WY = ListGetAt(i,56,"|")>
		<cfset AK = ListGetAt(i,57,"|")>
		<cfset HI = ListGetAt(i,58,"|")>
		<cfset PR = ListGetAt(i,59,"|")>
		<cfset VI = ListGetAt(i,60,"|")>
		<cfset Description = ListGetAt(i,61,"|")>
		
		<cfset Mods = "">	
		
		<cfquery name="getCode" datasource="#trim(request.datasource)#">
			SELECT RecordID 
			FROM pa_master.eob_medicare_procedurecode
			WHERE HCPC = '#trim(HCPCS)#' 
		</cfquery>
		
		<cfif getCode.Recordcount LTE 0>
			
			<cfquery name="insertCode" datasource="#trim(request.datasource)#">
				INSERT INTO pa_master.eob_medicare_procedurecode  (HCPC, LongDescription, ShortDescription)
				VALUES('#trim(HCPCS)#', <cfif Description EQ "NULL">#trim(Description)#<cfelse>'#trim(Description)#'</cfif>, <cfif Description EQ "NULL">#trim(Description)#<cfelse>'#trim(Description)#'</cfif>)
			</cfquery>				
			<cfquery name="getCode" datasource="#trim(request.datasource)#">
				SELECT RecordID 
				FROM pa_master.eob_medicare_procedurecode
				WHERE HCPC = '#trim(HCPCS)#' 
			</cfquery>				
			<cfoutput>[Code Added: #trim(getCode.RecordID)#]<br></cfoutput>		
			
		</cfif>
		
		
		<cfquery name="getCategoryCodeID" datasource="#trim(request.datasource)#">
			SELECT StandardListItemID
			FROM [MedTap].[dbo].StandardListItem
			WHERE ListID = 23 AND itemnamedisplay = '#trim(Category)#' AND Active = 1
		</cfquery>	
		
				
		<cfif MOD1 NEQ "NULL">
			<cfset Mods = ListAppend(Mods, trim(MOD1))>
		</cfif>
		<cfif MOD2 NEQ "NULL">
			<cfset Mods = ListAppend(Mods, trim(MOD2))>
		</cfif>
					
		<cfif Len(Mods) GT 1 AND Mods NEQ "NULL">				
			<cfloop list="#trim(modifiers)#" index="i">					
				<cfif FindNoCase(i, Mods)>						
					<cfset modsList = ListAppend(modsList,i,"|")>
				</cfif>
			</cfloop>			
		</cfif>
			
		
		<cfif modsList EQ "">
			
			<cfset modsList = "NULL">
		
		<cfelseif modsList NEQ "NULL">
			
			<cfif listLen(trim(modsList), "|") GTE 1>
				<cfset MOD1Code = ListGetAt(modsList, 1, "|")>		
				<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" fields="StandardListItemID" listid="26" itemnamedisplay="#trim(MOD1Code)#" active="1" returnvariable="getModifier1ID">
				<cfset MOD1 = getModifier1ID.StandardListItemID>
			</cfif>
			
			<cfif listLen(trim(modsList), "|") GTE 2>
				<cfset MOD2Code = ListGetAt(modsList, 2, "|")>
				<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" fields="StandardListItemID" listid="26" itemnamedisplay="#trim(MOD2Code)#" active="1" returnvariable="getModifier2ID">
				<cfset MOD2 = getModifier2ID.StandardListItemID>
			</cfif>			
			
		</cfif>
				
			
		<cfif NOT ISNumeric(trim(getCategoryCodeID.StandardListItemID))>		
			<cfoutput>
				[#trim(HCPCS)#][#trim(Category)#]<br>
				INSERT INTO pa_master.EOB_MEDICARE_2006_PROCEDURECodeFeeSchedule(HCPCRecordID, CategoryID, MOD1, MOD2, MOD3, MOD4, Ceiling, Floor, Fee_AL_16, Fee_AK_17, Fee_AZ_18, Fee_AR_19, Fee_CA_20, Fee_CO_21, Fee_CT_22, Fee_DE_23, Fee_DC_24, Fee_FL_25, Fee_GA_26, Fee_HI_27, Fee_ID_28, Fee_IL_29, Fee_IN_30, Fee_IA_31, Fee_KS_32, Fee_KY_33, Fee_LA_34, Fee_ME_35, Fee_MD_36, Fee_MA_37, Fee_MI_38, Fee_MN_39, Fee_MS_40, Fee_MO_41, Fee_MT_42, Fee_NE_43, Fee_NV_44, Fee_NE_45, Fee_NJ_46, Fee_NM_47, Fee_NY_48, Fee_NC_49, Fee_ND_50, Fee_OH_51, Fee_OK_52, Fee_OR_53, Fee_PA_54, Fee_RI_55, Fee_SC_56, Fee_SD_57, Fee_TN_58, Fee_TX_59, Fee_UT_60, Fee_VT_61, Fee_VA_62, Fee_WA_63, Fee_WV_64, Fee_WI_65, Fee_WY_66, Fee_PR_229, Fee_VI_238)
				VALUES(#trim(getCode.RecordID)#,#trim(getCategoryCodeID.StandardListItemID)#, #trim(MOD1)#, #trim(MOD2)#, NULL, NULL, #trim(Ceiling)#, #trim(Floor)#, #trim(AL)#, #trim(AK)#, #trim(AZ)#, #trim(AR)#, #trim(CA)#, #trim(CO)#, #trim(CT)#, #trim(DE)#, #trim(DC)#, #trim(FL)#, #trim(GA)#, #trim(HI)#, #trim(ID)#, #trim(IL)#, #trim(IN)#, #trim(IA)#, #trim(KS)#, #trim(KY)#, #trim(LA)#, #trim(ME)#, #trim(MD)#, #trim(MA)#, #trim(MI)#, #trim(MN)#, #trim(MS)#, #trim(MO)#, #trim(MT)#, #trim(NE)#, #trim(NV)#, #trim(NE)#, #trim(NJ)#, #trim(NM)#, #trim(NY)#, #trim(NC)#, #trim(ND)#, #trim(OH)#, #trim(OK)#, #trim(ORe)#, #trim(PA)#, #trim(RI)#, #trim(SC)#, #trim(SD)#, #trim(TN)#, #trim(TX)#, #trim(UT)#, #trim(VT)#, #trim(VA)#, #trim(WA)#, #trim(WV)#, #trim(WI)#, #trim(WY)#, #trim(PR)#, #trim(VI)#)
				<br><br>
			</cfoutput>			
		</cfif>		
									
		<cfquery name="tempInsertFee" datasource="#request.datasource#">
			INSERT INTO pa_master.EOB_MEDICARE_2006_PROCEDURECodeFeeSchedule(HCPCRecordID, CategoryID, MOD1, MOD2, MOD3, MOD4, Ceiling, Floor, Fee_AL_16, Fee_AK_17, Fee_AZ_18, Fee_AR_19, Fee_CA_20, Fee_CO_21, Fee_CT_22, Fee_DE_23, Fee_DC_24, Fee_FL_25, Fee_GA_26, Fee_HI_27, Fee_ID_28, Fee_IL_29, Fee_IN_30, Fee_IA_31, Fee_KS_32, Fee_KY_33, Fee_LA_34, Fee_ME_35, Fee_MD_36, Fee_MA_37, Fee_MI_38, Fee_MN_39, Fee_MS_40, Fee_MO_41, Fee_MT_42, Fee_NE_43, Fee_NV_44, Fee_NE_45, Fee_NJ_46, Fee_NM_47, Fee_NY_48, Fee_NC_49, Fee_ND_50, Fee_OH_51, Fee_OK_52, Fee_OR_53, Fee_PA_54, Fee_RI_55, Fee_SC_56, Fee_SD_57, Fee_TN_58, Fee_TX_59, Fee_UT_60, Fee_VT_61, Fee_VA_62, Fee_WA_63, Fee_WV_64, Fee_WI_65, Fee_WY_66, Fee_PR_229, Fee_VI_238)
			VALUES(#trim(getCode.RecordID)#,#trim(getCategoryCodeID.StandardListItemID)#, #trim(MOD1)#, #trim(MOD2)#, NULL, NULL, #trim(Ceiling)#, #trim(Floor)#, #trim(AL)#, #trim(AK)#, #trim(AZ)#, #trim(AR)#, #trim(CA)#, #trim(CO)#, #trim(CT)#, #trim(DE)#, #trim(DC)#, #trim(FL)#, #trim(GA)#, #trim(HI)#, #trim(ID)#, #trim(IL)#, #trim(IN)#, #trim(IA)#, #trim(KS)#, #trim(KY)#, #trim(LA)#, #trim(ME)#, #trim(MD)#, #trim(MA)#, #trim(MI)#, #trim(MN)#, #trim(MS)#, #trim(MO)#, #trim(MT)#, #trim(NE)#, #trim(NV)#, #trim(NE)#, #trim(NJ)#, #trim(NM)#, #trim(NY)#, #trim(NC)#, #trim(ND)#, #trim(OH)#, #trim(OK)#, #trim(ORe)#, #trim(PA)#, #trim(RI)#, #trim(SC)#, #trim(SD)#, #trim(TN)#, #trim(TX)#, #trim(UT)#, #trim(VT)#, #trim(VA)#, #trim(WA)#, #trim(WV)#, #trim(WI)#, #trim(WY)#, #trim(PR)#, #trim(VI)#)
		</cfquery>						
		
		<cfset modsList = "">
		<cfset MOD1 = "NULL">	
		<cfset MOD2 = "NULL">
		<cfset MOD3 = "NULL">
		<cfset MOD4 = "NULL">			
		<cfset count = count  + 1>
		
	</cfloop>
			
	

	
	
	
	
	
	
	
		
		
		
		
		
		
		
		
<!---
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EOB_MEDICARE_2006_PROCEDURECodeFeeSchedule]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EOB_MEDICARE_2006_PROCEDURECodeFeeSchedule]
GO

CREATE TABLE [dbo].[EOB_MEDICARE_2006_PROCEDURECodeFeeSchedule] (
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
	[Fee_PR_229] [money] NULL,
	[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InactiveCode] [int] NULL ,
	[DateCreated] [datetime] NOT NULL ,
	[DateModified] [datetime] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EOB_MEDICARE_2006_PROCEDURECodeFeeSchedule] ADD 
	CONSTRAINT [DF_EOB_MEDICARE_2006_PROCEDURECodeFeeSchedule_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_EOB_MEDICARE_2006_PROCEDURECodeFeeSchedule_DateCreated] DEFAULT (now()) FOR [DateCreated],
	CONSTRAINT [PK_EOB_MEDICARE_2006_PROCEDURECodeFeeSchedule] PRIMARY KEY  CLUSTERED 
	(
		[RecordID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO
 
--->		
		


