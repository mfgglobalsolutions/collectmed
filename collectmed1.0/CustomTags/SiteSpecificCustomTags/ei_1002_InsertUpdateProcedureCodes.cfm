<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---   ei_1002_InsertUpdateProcedureCodes.cfm                   --->
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
<!--- NOTE: YOU WILL HAVE TO FIRST DOWNLOAD THIS FILE AND THEN   --->
<!--- SAVE IT IN A TAB DELIMITED TXT FILE. THIS WILL ALLOW THIS  --->
<!--- TAG WILL WORK.  Filename: PRCR409C.txt                     --->
<!--- File: #trim(request.applicationPath)#\                     --->
<!--- eobmanager\eob_1002_Codes_Import\PRCR409C.txt              --->
<!--- Downloaded from tmhp                                       --->
<!--- This tag will read the file above and place the OEB        --->
<!--- codes into the database.                                   --->
<!--- Loop through the file content that was read in and use     --->
<!--- the newline and line feed as the delimeter and put each    --->
<!--- line item into the database depending on the code. If      --->
<!--- the code already exists then simply the description may    --->
<!--- have changed. so update the description. If the code       --->
<!--- does not exist then enter into the database. upon update   --->
<!--- set update date.                                           --->
<!--- @@DESCRIPTION@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@EXAMPLECALL@@                                            --->
<!---  &lt;cf_ei_1002_InsertUpdateProcedureCodes<br>             --->
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
<!--- <strong>filename</strong> (PRCR409C.txt)<br>               --->
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
<!---    Created 01/13/06                                        --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->      
<!------------------------------------------------------------------> 



<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="attributes.testmode" default="yes">
	<cfset testmode = attributes.testmode> 
	
	<cfparam name="attributes.filepath" default="#trim(request.applicationPath)#\eobmanager\eob_1002_Codes_Import">
	<cfset filepath = attributes.filepath>

	<cfparam name="attributes.filename" default="PRCR409C.txt">
	<cfset filename = attributes.filename>



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
	
<!---<cf_gcModal 
		gcModalLink="Page Output Explanation" 		
		gcModalVerbiage="Prior to running this page you must download the new EOB Codes from the TMHP website. <p>You will see UPDATE or INSERT for each row. <p>Ouput in black is what was gathered from the actual file. Ouput in red is what Cold Fusion has parsed out. <p>NOTE: BOTH THE RED AND BLACK LINES SHOULD MATCH ENTIRELY. <p>When you feel confident in this output then and only then call this tag with testmode=no<p>File Called: #trim(filepath)#\#trim(fileName)#"><p>
--->

		
<!------------------------------------------------------------------>
<!--- Loop through the file content that was read in and use     --->
<!--- the newline and line feed as the delimeter and put each    --->
<!--- line item into the database depending on the code. If      --->
<!--- the code already exists then simply the description may    --->
<!--- have changed. so update the description. If the code       --->
<!--- does not exist then enter into the database.               --->
<!------------------------------------------------------------------>
	<cfset TOS = "">
	<cfset TOSList = "">
	<cfset count = 1>
		
	<cfloop list="#trim(fileContent)#" delimiters="#chr(13)##chr(10)#" index="i">
					
		<cfif LEN(i) GTE 10>
		
			<cfif FindNoCase("TOS:", i)>
				
				<cfset i = Replace(i, "TOS:", "", "ALL")>
				<cfset TOS = trim(ListGetAt(i, 1, "-"))>
				<cfset TOSDescription = trim(ListGetAt(i, 2, "-"))>
				
				<cfif NOT ListFindNoCase(TOSList, TOS)>
					
					<cfset TOSList = ListAppend(TOSList, TOS)>
					
					<cfquery name="getTOS" datasource="#request.datasource#">
						SELECT RecordID 
						FROM ei_1002_TOSCode
						WHERE Code = '#trim(TOS)#'
					</cfquery>
					
					<cfif getTOS.Recordcount EQ 1>
						
						<cfquery name="updateTOS" datasource="#request.datasource#">
							UPDATE ei_1002_TOSCode 
							SET Description = '#trim(TOSDescription)#', dateModified = now()
							WHERE RecordID = #getTOS.RecordID#
						</cfquery>
						
					<cfelse>
					
						<cfquery name="insertTOS" datasource="#request.datasource#">
							INSERT INTO ei_1002_TOSCode (Code, Description) 
							VALUES('#trim(TOS)#', '#trim(TOSDescription)#')
						</cfquery>
						
					</cfif>					
					
				</cfif>
				
				
			<cfelse>	
						
				
				<cfset i = Replace(i, CHR(9), CHR(124), "ALL")>
				<cfset i = Replace(i, "||", "|@@|", "ALL")>
				<cfset i = Replace(i, "|""", CHR(124), "ALL")>
				<cfset i = Replace(i, """|", CHR(124), "ALL")>
				<cfif Right(i, 1) EQ CHR(124)>
					<cfset i = i & "@@">
				<cfelseif Right(i, 1) EQ CHR(34)>
					<cfset i = LEFT(i, LEN(i) - 1)>	
				</cfif>
				
				<cfoutput><font color="FF0000">[#ListLen(i, CHR(124))#] [#i#]</font><br></cfoutput>
				
				<cfset Code = ListGetAt(i, 1, CHR(124))>
				
				<cfset Description = ListGetAt(i, 2, CHR(124))>		
				<cfif Description EQ "@@">
					<cfset Description = "">
				</cfif>	
				
				<cfset TMRMPayable = ListGetAt(i, 3, CHR(124))>
				<cfset TMRMPayable = Replace(TMRMPayable, ",", "", "ALL")>
				<cfif TMRMPayable EQ "@@">
					<cfset TMRMPayable = "">
				</cfif>	
				
				<cfset TotalRVUs = ListGetAt(i, 4, CHR(124))>
				<cfset TotalRVUs = Replace(TotalRVUs, ",", "", "ALL")>
				<cfif TotalRVUs EQ "@@">
					<cfset TotalRVUs = "">
				</cfif>	
				
				<cfset Conversionfactor = ListGetAt(i, 5, CHR(124))>
				<cfset Conversionfactor = Replace(Conversionfactor, ",", "", "ALL")>
				<cfif Conversionfactor EQ "@@">
					<cfset Conversionfactor = "">
				</cfif>	
				
				<cfset AccessBasedOrMaxFee = REPLACE(ListGetAt(i, 6, CHR(124)), CHR(44), "", "ALL")>	
				<cfset AccessBasedOrMaxFee = Replace(AccessBasedOrMaxFee, ",", "", "ALL")>				
				<cfif AccessBasedOrMaxFee EQ "@@">
					<cfset AccessBasedOrMaxFee = "">
				</cfif>	
				
				<cfif  ListLen(i, CHR(124)) EQ 7 AND ListGetAt(i, 7, CHR(124)) NEQ "@@">
					<cfset NoteCode = ListGetAt(i, 7, CHR(124))>
				<cfelse>
					<cfset NoteCode = "">		
				</cfif>				
				
								
				<cfquery name="getCode" datasource="#request.datasource#">
					SELECT RecordID 
					FROM ei_1002_PROCEDURECode
					WHERE TOScode = '#trim(TOS)#' AND Code = '#trim(Code)#'
				</cfquery>
				
				<cfif getCode.Recordcount EQ 1>
					
					<cfoutput>[UPDATE] [#trim(TOS)#] [#trim(Code)#] [#trim(Description)#] [#trim(TMRMPayable)#] [#trim(TotalRVUs)#] [#trim(Conversionfactor)#] [#trim(AccessBasedOrMaxFee)#] [#trim(NoteCode)#]<br></cfoutput>
					
					<cfif NOT testmode>
						<cfquery name="updateCode" datasource="#request.datasource#">
							UPDATE ei_1002_PROCEDURECode 
							SET TOSCode = '#trim(TOS)#', Code = '#trim(Code)#', Description = '#trim(Description)#', TMRMPayable = #trim(TMRMPayable)#, TotalRVUs = #trim(TotalRVUs)#, ConversionFactor = #trim(ConversionFactor)#, AccessBasedOrMaxFee = #trim(AccessBasedOrMaxFee)#, NoteCode = '#trim(NoteCode)#', dateModified = now()
							WHERE RecordID = #getCode.RecordID#
						</cfquery>
					</cfif>
					
				<cfelse>
					
					<cfoutput>[INSERT] [#trim(TOS)#] [#trim(Code)#] [#trim(Description)#] [#trim(TMRMPayable)#] [#trim(TotalRVUs)#] [#trim(Conversionfactor)#] [#trim(AccessBasedOrMaxFee)#] [#trim(NoteCode)#]<br></cfoutput>
					
					<cfif NOT testmode>
						<cfquery name="insertCode" datasource="#request.datasource#">
							INSERT INTO ei_1002_PROCEDURECode (TOSCode, Code, Description, TMRMPayable, TotalRVUs, ConversionFactor, AccessBasedOrMaxFee, NoteCode) 
							VALUES('#trim(TOS)#', '#trim(Code)#', '#trim(Description)#', #trim(TMRMPayable)#, #trim(TotalRVUs)#, #trim(ConversionFactor)#, #trim(AccessBasedOrMaxFee)#, '#trim(NoteCode)#')
						</cfquery>
					</cfif>
					
				</cfif>							
						
			</cfif>
			
		</cfif>		
		
		<cfset count = count + 1>
		
	</cfloop>
	
	