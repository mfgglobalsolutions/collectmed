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


<!----------------------------------------------------------------------------------->
<!--- Column Names                                                                --->
<!--- HCPCS|Mod|NULL|Category|AL|AR|CO|FL|GA|KY|LA|MS|NC|NM|OK|SC|TN|TX|PR|VI     --->
<!----------------------------------------------------------------------------------->
<!---HCPCS|Modifier 1|Modifier 2|Category|AL|AR|CO|FL|GA|KY|LA|MS|NC|NM|OK|SC|TN|TX|PR|VI--->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.testmode" default="yes">
	<cfset testmode = attributes.testmode> 
	
	<cfparam name="attributes.filepath" default="C:\EOBManager\eob_1002_Codes_Import\feeCodesFees\2002">
	<cfset filepath = attributes.filepath>

	<cfparam name="attributes.filename" default="DMEFeeSchedule_2002_PIPE.txt">
	<cfset filename = attributes.filename>
	
	<cfparam name="attributes.modifiers" default="AU,AV,AW,BA,KC,KF,KM,KN,NU,RR,UE,XA">
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
	<cfset addedHCPC = "">
			
	<cfloop list="#trim(fileContent)#" delimiters="#chr(13)##chr(10)#" index="i">
		
		<cfset HCPCS = ListGetAt(i,1,"|")>
		<cfset Mod1 = ListGetAt(i,2,"|")>
		<cfset Mod2 = ListGetAt(i,3,"|")>		
		<cfset Category = ListGetAt(i,4,"|")>
		<cfset AL = ListGetAt(i,5,"|")>
		<cfset AR = ListGetAt(i,6,"|")>		
		<cfset CO = ListGetAt(i,7,"|")>		
		<cfset FL = ListGetAt(i,8,"|")>
		<cfset GA = ListGetAt(i,9,"|")>		
		<cfset KY = ListGetAt(i,10,"|")>
		<cfset LA = ListGetAt(i,11,"|")>
		<cfset MS = ListGetAt(i,12,"|")>
		<cfset NC = ListGetAt(i,13,"|")>
		<cfset NM = ListGetAt(i,14,"|")>
		<cfset OK = ListGetAt(i,15,"|")>
		<cfset SC = ListGetAt(i,16,"|")>
		<cfset TN = ListGetAt(i,17,"|")>
		<cfset TX = ListGetAt(i,18,"|")>
		<cfset PR = ListGetAt(i,19,"|")>
		<cfset VI = ListGetAt(i,20,"|")>		
		
		<cfset Mods = "">	
		
		<cfquery name="getCode" datasource="#trim(request.datasource)#">
			SELECT RecordID 
			FROM pa_master.EOB_MEDICARE_PROCEDURECode
			WHERE HCPC = '#trim(HCPCS)#' 
		</cfquery>
		
		<cfif getCode.Recordcount LTE 0>
			
			<!---<cfquery name="insertCode" datasource="#trim(request.datasource)#">
				INSERT INTO pa_master.EOB_MEDICARE_PROCEDURECode  (HCPC, LongDescription, ShortDescription)
				VALUES('#trim(HCPCS)#', <cfif Description EQ "NULL">#trim(Description)#<cfelse>'#trim(Description)#'</cfif>, <cfif Description EQ "NULL">#trim(Description)#<cfelse>'#trim(Description)#'</cfif>)
			</cfquery>				
			<cfquery name="getCode" datasource="#trim(request.datasource)#">
				SELECT RecordID 
				FROM pa_master.EOB_MEDICARE_PROCEDURECode
				WHERE HCPC = '#trim(HCPCS)#' 
			</cfquery>		--->		
			<cfoutput>[Code Added: [#trim(HCPCS)#] <!---#trim(getCode.RecordID)#--->]<br></cfoutput>		
			<cfset HCPCRecordID = 99999>
			<cfset addedHCPC = ListAppend(addedHCPC, trim(HCPCS))>
		
		<cfelse>
			<cfset HCPCRecordID = getCode.RecordID>	
		</cfif>
		
		
		<cfquery name="getCategoryCodeID" datasource="#trim(request.datasource)#">
			SELECT StandardListItemID
			FROM pa_master.StandardListItem
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
				
			
		<!---<cfif NOT ISNumeric(trim(getCategoryCodeID.StandardListItemID))>--->		
			<cfoutput>
				[#MODS#][#trim(HCPCS)#][#trim(Category)#][#modsList#][#MOD1#][#MOD2#]<br>                                                                                                                                
				INSERT INTO pa_master.EOB_MEDICARE_2002_PROCEDURECodeFeeSchedule(HCPCRecordID, CategoryID, MOD1, MOD2, Fee_AL_16, Fee_AR_19, Fee_CO_21, Fee_FL_25, Fee_GA_26, Fee_KY_33, Fee_LA_34, Fee_MS_40, Fee_NM_47, Fee_NC_49, Fee_OK_52, Fee_SC_56, Fee_TN_58, Fee_TX_59, Fee_PR_229, Fee_VI_238)
				VALUES(#trim(HCPCRecordID)#,#trim(getCategoryCodeID.StandardListItemID)#, #trim(MOD1)#, #trim(MOD2)#, #trim(AL)#, #trim(AR)#, #trim(CO)#, #trim(FL)#, #trim(GA)#, #trim(KY)#, #trim(LA)#, #trim(MS)#, #trim(NM)#, #trim(NC)#, #trim(OK)#, #trim(SC)#, #trim(TN)#, #trim(TX)#, #trim(PR)#, #trim(VI)#)
				<br><br>
			</cfoutput>			
		<!---</cfif>		--->
																											
						
		<cfquery name="tempInsertFee" datasource="#request.datasource#">
			INSERT INTO pa_master.EOB_MEDICARE_2002_PROCEDURECodeFeeSchedule(HCPCRecordID, CategoryID, MOD1, MOD2, Fee_AL_16, Fee_AR_19, Fee_CO_21, Fee_FL_25, Fee_GA_26, Fee_KY_33, Fee_LA_34, Fee_MS_40, Fee_NM_47, Fee_NC_49, Fee_OK_52, Fee_SC_56, Fee_TN_58, Fee_TX_59, Fee_PR_229, Fee_VI_238)
			VALUES(#trim(HCPCRecordID)#,#trim(getCategoryCodeID.StandardListItemID)#, #trim(MOD1)#, #trim(MOD2)#, #trim(AL)#, #trim(AR)#, #trim(CO)#, #trim(FL)#, #trim(GA)#, #trim(KY)#, #trim(LA)#, #trim(MS)#, #trim(NM)#, #trim(NC)#, #trim(OK)#, #trim(SC)#, #trim(TN)#, #trim(TX)#, #trim(PR)#, #trim(VI)#)
		</cfquery>					
		
		<cfset modsList = "">
		<cfset MOD1 = "NULL">	
		<cfset MOD2 = "NULL">
		<cfset MOD3 = "NULL">
		<cfset MOD4 = "NULL">			
		<cfset count = count  + 1>
		
	</cfloop>
	
	<cfoutput>addedHCPC: #addedHCPC#</cfoutput>