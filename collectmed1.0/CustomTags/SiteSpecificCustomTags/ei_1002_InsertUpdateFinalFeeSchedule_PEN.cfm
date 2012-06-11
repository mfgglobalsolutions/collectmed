<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---   ei_1002_InsertUpdateFinalFeeSchedule_PEN.cfm             --->
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



<!-------------------------------------------------------------------------------------->
<!--- Column Names                                                                   --->
<!--- HCPCS|MODIFIER 1|MODIFIER 2|FEE SCHEDULE|SHORT DESCRIPTION                     --->
<!-------------------------------------------------------------------------------------->



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.testmode" default="yes">
	<cfset testmode = attributes.testmode> 
	
	<cfparam name="attributes.filepath" default="C:\EOBManager\eob_1002_Codes_Import\feeCodesFees\2006">
	<cfset filepath = attributes.filepath>

	<cfparam name="attributes.filename" default="DMEFeeSchedule_2006_PEN_PIPE.txt">
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
		<cfset AL = ListGetAt(i,4,"|")>
		<cfset AR = ListGetAt(i,4,"|")>
		<cfset AZ = ListGetAt(i,4,"|")>
		<cfset CA = ListGetAt(i,4,"|")>
		<cfset CO = ListGetAt(i,4,"|")>
		<cfset CT = ListGetAt(i,4,"|")>
		<cfset DC = ListGetAt(i,4,"|")>
		<cfset DE = ListGetAt(i,4,"|")>
		<cfset FL = ListGetAt(i,4,"|")>
		<cfset GA = ListGetAt(i,4,"|")>
		<cfset IA = ListGetAt(i,4,"|")>
		<cfset ID = ListGetAt(i,4,"|")>
		<cfset IL = ListGetAt(i,4,"|")>
		<cfset IN = ListGetAt(i,4,"|")>
		<cfset KS = ListGetAt(i,4,"|")>
		<cfset KY = ListGetAt(i,4,"|")>
		<cfset LA = ListGetAt(i,4,"|")>
		<cfset MA = ListGetAt(i,4,"|")>
		<cfset MD = ListGetAt(i,4,"|")>
		<cfset ME = ListGetAt(i,4,"|")>
		<cfset MI = ListGetAt(i,4,"|")>
		<cfset MN = ListGetAt(i,4,"|")>
		<cfset MO = ListGetAt(i,4,"|")>
		<cfset MS = ListGetAt(i,4,"|")>
		<cfset MT = ListGetAt(i,4,"|")>
		<cfset NC = ListGetAt(i,4,"|")>
		<cfset ND = ListGetAt(i,4,"|")>
		<cfset NE = ListGetAt(i,4,"|")>
		<cfset NH = ListGetAt(i,4,"|")>
		<cfset NJ = ListGetAt(i,4,"|")>
		<cfset NM = ListGetAt(i,4,"|")>
		<cfset NV = ListGetAt(i,4,"|")>
		<cfset NY = ListGetAt(i,4,"|")>
		<cfset OH = ListGetAt(i,4,"|")>
		<cfset OK = ListGetAt(i,4,"|")>
		<cfset ORe = ListGetAt(i,4,"|")>
		<cfset PA = ListGetAt(i,4,"|")>
		<cfset RI = ListGetAt(i,4,"|")>
		<cfset SC = ListGetAt(i,4,"|")>
		<cfset SD = ListGetAt(i,4,"|")>
		<cfset TN = ListGetAt(i,4,"|")>
		<cfset TX = ListGetAt(i,4,"|")>
		<cfset UT = ListGetAt(i,4,"|")>
		<cfset VA = ListGetAt(i,4,"|")>
		<cfset VT = ListGetAt(i,4,"|")>
		<cfset WA = ListGetAt(i,4,"|")>
		<cfset WI = ListGetAt(i,4,"|")>
		<cfset WV = ListGetAt(i,4,"|")>
		<cfset WY = ListGetAt(i,4,"|")>
		<cfset AK = ListGetAt(i,4,"|")>
		<cfset HI = ListGetAt(i,4,"|")>
		<cfset PR = ListGetAt(i,4,"|")>
		<cfset VI = ListGetAt(i,4,"|")>
		<cfset Description = ListGetAt(i,5,"|")>
		
		<cfset Mods = "">	
		
		<cfquery name="getCode" datasource="#trim(request.datasource)#">
			SELECT RecordID 
			FROM eob_medicare_procedurecode
			WHERE HCPC = '#trim(HCPCS)#' 
		</cfquery>
		
		<cfif getCode.Recordcount LTE 0>
			
			<cfquery name="insertCode" datasource="#trim(request.datasource)#">
				INSERT INTO eob_medicare_procedurecode  (HCPC, LongDescription, ShortDescription)
				VALUES('#trim(HCPCS)#', <cfif Description EQ "NULL">#trim(Description)#<cfelse>'#trim(Description)#'</cfif>, <cfif Description EQ "NULL">#trim(Description)#<cfelse>'#trim(Description)#'</cfif>)
			</cfquery>	
			
			<cfquery name="getCode" datasource="#trim(request.datasource)#">
				SELECT RecordID 
				FROM eob_medicare_procedurecode
				WHERE HCPC = '#trim(HCPCS)#' 
			</cfquery>	
			
			<cfoutput>[Code Added: #trim(getCode.RecordID)#]<br></cfoutput>		
			
		</cfif>
				
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
		
		<cfelseif modsList NEQ "NULL" AND modsList NEQ "NULL">
			
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
								
		<cfquery name="tempInsertFee" datasource="#request.datasource#">
			INSERT INTO EOB_MEDICARE_2006_PROCEDURECodeFeeSchedule(HCPCRecordID, MOD1, MOD2, MOD3, MOD4, Fee_AL_16, Fee_AK_17, Fee_AZ_18, Fee_AR_19, Fee_CA_20, Fee_CO_21, Fee_CT_22, Fee_DE_23, Fee_DC_24, Fee_FL_25, Fee_GA_26, Fee_HI_27, Fee_ID_28, Fee_IL_29, Fee_IN_30, Fee_IA_31, Fee_KS_32, Fee_KY_33, Fee_LA_34, Fee_ME_35, Fee_MD_36, Fee_MA_37, Fee_MI_38, Fee_MN_39, Fee_MS_40, Fee_MO_41, Fee_MT_42, Fee_NE_43, Fee_NV_44, Fee_NE_45, Fee_NJ_46, Fee_NM_47, Fee_NY_48, Fee_NC_49, Fee_ND_50, Fee_OH_51, Fee_OK_52, Fee_OR_53, Fee_PA_54, Fee_RI_55, Fee_SC_56, Fee_SD_57, Fee_TN_58, Fee_TX_59, Fee_UT_60, Fee_VT_61, Fee_VA_62, Fee_WA_63, Fee_WV_64, Fee_WI_65, Fee_WY_66, Fee_PR_229, Fee_VI_238)
			VALUES(#trim(getCode.RecordID)#, #trim(MOD1)#, #trim(MOD2)#, NULL, NULL, #trim(AL)#, #trim(AK)#, #trim(AZ)#, #trim(AR)#, #trim(CA)#, #trim(CO)#, #trim(CT)#, #trim(DE)#, #trim(DC)#, #trim(FL)#, #trim(GA)#, #trim(HI)#, #trim(ID)#, #trim(IL)#, #trim(IN)#, #trim(IA)#, #trim(KS)#, #trim(KY)#, #trim(LA)#, #trim(ME)#, #trim(MD)#, #trim(MA)#, #trim(MI)#, #trim(MN)#, #trim(MS)#, #trim(MO)#, #trim(MT)#, #trim(NE)#, #trim(NV)#, #trim(NE)#, #trim(NJ)#, #trim(NM)#, #trim(NY)#, #trim(NC)#, #trim(ND)#, #trim(OH)#, #trim(OK)#, #trim(ORe)#, #trim(PA)#, #trim(RI)#, #trim(SC)#, #trim(SD)#, #trim(TN)#, #trim(TX)#, #trim(UT)#, #trim(VT)#, #trim(VA)#, #trim(WA)#, #trim(WV)#, #trim(WI)#, #trim(WY)#, #trim(PR)#, #trim(VI)#)
		</cfquery>						
		
		<cfset modsList = "">
		<cfset MOD1 = "NULL">	
		<cfset MOD2 = "NULL">
		<cfset MOD3 = "NULL">
		<cfset MOD4 = "NULL">			
		<cfset count = count  + 1>
		
	</cfloop>
	
	

