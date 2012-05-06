<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---  ei_1002_InsertUpdateDMEFeeCodes.cfm                       --->
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
<!--- DMEFEESCHEDULE_PRCR409C.txt                                --->
<!--- Downloaded from tmhp                                       --->
<!--- This tag will read the file above and place the DME Fees   --->
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
<!---  &lt;cf_ei_1002_InsertUpdateDMEFeeCodes<br>                --->
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
<!--- wwwroot\eobmanager\eob_1002_Codes_Import)<br>              --->
<!--- <b>filename</b> (DMEFEESCHEDULE_PRCR409C.txt)<br>          --->
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



<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="attributes.testmode" default="yes">
	<cfset testmode = attributes.testmode> 
	
	<cfparam name="attributes.filepath" default="#trim(request.applicationPath)#\eobmanager\eob_1002_Codes_Import">
	<cfset filepath = attributes.filepath>

	<cfparam name="attributes.filename" default="DMEFEESCHEDULE_PRCR409C.txt">
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
		<font size="5" color="FF0000">RUNNING IN TEST MODE</font><p>
	<cfelse>
		<font size="5" color="FF0000">RAN IN LIVE MODE</font><p>	
	</cfif>
	
	<cf_gcModal 
		gcModalLink="Page Output Explanation" 		
		gcModalVerbiage="Prior to running this page you must download the new DME Fee Codes from the TMHP website. <p>You will see UPDATE or INSERT for each row. <p>Ouput in black is what was gathered from the actual file. Ouput in red is what Cold Fusion has parsed out. <p>NOTE: BOTH THE RED AND BLACK LINES SHOULD MATCH ENTIRELY. <p>When you feel confident in this output then and only then call this tag with testmode=no<p>File Called: #trim(filepath)#\#trim(fileName)#"><p>
		
		
		
<!------------------------------------------------------------------>
<!--- Start the parsing of the TOS codes that will be used.      --->
<!--- Check to make sure it is not in the db already and if      --->
<!--- it is then go ahead and update it.                         --->
<!------------------------------------------------------------------>		
	<cfloop list="#trim(fileContent)#" delimiters="#chr(13)##chr(10)#" index="i">
		
		<cfif FindNoCase("TOS:", trim(i)) AND FindNoCase("-", trim(i)) AND NOT FindNoCase("Type of service", trim(i))>				
										
			<cfset tempStringTOS = mid(trim(i), REQUEST.nextSpace(0, trim(i)), len(trim(i)))>
			<cfset nextSpaceTOS = REQUEST.nextSpace(0, trim(tempStringTOS))>
			<cfset codeTOS = mid(tempStringTOS, 1, nextSpaceTOS)>
								
			<cfquery name="getCodeTOS" datasource="#trim(request.datasource)#">
				SELECT recordID 
				FROM ei_2_DMEFEETOSCode  
				WHERE code = '#trim(codeTOS)#' 
			</cfquery>
			
														
			<cfset tempStringTOS = "">
			<cfset nextSpaceTOS = "">
			<cfset codeTOS = "">				
		
		</cfif>
		
	</cfloop>	

	
	

		
<!------------------------------------------------------------------>
<!--- Loop through the file content that was read in and use     --->
<!--- the newline and line feed as the delimeter and put each    --->
<!--- line item into the database depending on the code. If      --->
<!--- the code already exists then simply the description may    --->
<!--- have changed. so update the description. If the code       --->
<!--- does not exist then enter into the database.               --->
<!------------------------------------------------------------------>
	
	<cfset count1 = 1>
	
	<cfloop list="#trim(fileContent)#" delimiters="#chr(13)##chr(10)#" index="i">
		
		<cfif FindNoCase("TOS:", trim(i)) AND FindNoCase("-", trim(i)) AND NOT FindNoCase("Type of service", trim(i))>				
										
			<cfset tempStringTOS = mid(trim(i), REQUEST.nextSpace(0, trim(i)), len(trim(i)))>
			<cfset nextSpaceTOS = REQUEST.nextSpace(0, trim(tempStringTOS))>
			<cfset codeTOS = trim(mid(tempStringTOS, 1, nextSpaceTOS))>
								
			<cfquery name="getCodeTOS" datasource="#trim(request.datasource)#">
				SELECT recordID 
				FROM ei_2_DMEFEETOSCode  
				WHERE code = '#trim(codeTOS)#' 
			</cfquery>			
			
			<cfif getCodeTOS.recordCount LTE 0>
				<cfset alertNote = "Missing TOS code scroll down to see error.\n\n Look for the string:\n\'The TOS code (#trim(codeTOS)#) you are trying to attach does not exist\'\n\nType the string out before dismissing this notice.">
				
				<cfoutput>
					<script language="JavaScript">
						alert('#alertNote#');
					</script>
				</cfoutput>
				
				<cf_gcGeneralErrorTemplate
					message="The TOS code (#trim(codeTOS)#) you are trying to attach does not exist you must first run the template to populate the DME Fee TOS codes. If you see this error you should still be in testmode. If you are not in testmode the records you input prior to the error will be ok. They will be tested upon on next run and updated if necessary. <br><br><strong>Go back to test mode until errors do not appear.</strong>">
			</cfif>
			
		</cfif>
		
		
		<cfif (ListLen(i, chr(9)) EQ 6 OR listLen(i, chr(9)) EQ 7) AND (IsNumeric(REQUEST.cleanNumericString(ListGetAt(i, 3, chr(9)))) OR ListGetAt(i, 3, chr(9)) EQ 0) AND (IsNumeric(REQUEST.cleanNumericString(ListGetAt(i, 4, chr(9)))) OR ListGetAt(i, 4, chr(9)) EQ 0) AND (IsNumeric(REQUEST.cleanNumericString(ListGetAt(i, 5, chr(9)))) OR ListGetAt(i, 5, chr(9)) EQ 0) AND (IsNumeric(REQUEST.cleanNumericString(ListGetAt(i, 6, chr(9)))) OR ListGetAt(i, 6, chr(9)) EQ 0)>
									
			<cfset code = listGetAt(i, 1, chr(9))>			
			<cfset description = listGetAt(i, 2, chr(9))>
			<cfset description = Replace(description, chr(34), "", "ALL")>
			
			<cfset TMRMpayable = listGetAt(i, 3, chr(9))>	
			<cfset TMRMpayable = ReReplaceNoCase(trim(TMRMpayable), '[^.0123456789]', '', 'ALL')>		
			
			<cfset TotalRVUs = listGetAt(i, 4, chr(9))>	
			<cfset TotalRVUs = ReReplaceNoCase(trim(TotalRVUs), '[^.0123456789]', '', 'ALL')>	
			
			<cfset ConversionFactor = listGetAt(i, 5, chr(9))>	
			<cfset ConversionFactor = ReReplaceNoCase(trim(ConversionFactor), '[^.0123456789]', '', 'ALL')>	
			
			<cfset AccessBasedMaxFee = listGetAt(i, 6, chr(9))>	
			<cfset AccessBasedMaxFee = ReReplaceNoCase(trim(AccessBasedMaxFee), '[^.0123456789]', '', 'ALL')>
			
			<cfif ListLen(i, chr(9)) EQ 7>
				<cfset NoteCode = listGetAt(i, 7, chr(9))>
				<cfset NoteCode = Replace(NoteCode, chr(34), "", "ALL")>
			<cfelse>
				<cfset NoteCode = "">		
			</cfif>
			
			
			<cfquery name="getCode" datasource="#trim(request.datasource)#">
				SELECT recordID 
				FROM ei_2_DMEFEECode  
				WHERE code = '#trim(code)#' AND TOSCode = '#trim(codeTOS)#'
			</cfquery>
			
			
			
			<cfif getCode.RecordCount GTE 1>
				
				<!------------------------------------------------------------------>
				<!--- show to the screen the query that will be run to insert.   --->
				<!------------------------------------------------------------------>				
				<cfoutput>
					<font size="1">
						[#count1#][UPDATE]<br>
						[TOScode: #trim(codeTOS)#]<br>
						[#trim(i)#]<br>
						<font color="FF0000">
							[#trim(code)# #trim(description)# #trim(TMRMpayable)# #trim(TotalRVUs)# #trim(ConversionFactor)# #trim(AccessBasedMaxFee)# #trim(NoteCode)#]<br>
						</font>
				
						&lt;cfquery name="update" datasource="#trim(request.datasource)#"&gt;<br>
							UPDATE ei_2_DMEFEECode <br> 												
							SET dateModified = NOW(), TOSCode = '#trim(codeTOS)#', code = '#trim(code)#', description = '#trim(description)#', TMRMpayable = #trim(TMRMpayable)#, TotalRVUs = #trim(TotalRVUs)#, ConversionFactor = #trim(ConversionFactor)#, AccessBasedMaxFee = #trim(AccessBasedMaxFee)#, NoteCode = '#trim(NoteCode)#'<br>
							WHERE recordID = #trim(getCode.recordID)#<br>
						&lt;/cfquery&gt;		
					</font>
				</cfoutput>
				
				
				<cfif NOT testmode>					
					<cfquery name="update" datasource="#trim(request.datasource)#">
						UPDATE ei_2_DMEFEECode  												
						SET dateModified = NOW(), TOSCode = '#trim(codeTOS)#', code = '#trim(code)#', description = '#trim(description)#', TMRMpayable = #trim(TMRMpayable)#, TotalRVUs = #trim(TotalRVUs)#, ConversionFactor = #trim(ConversionFactor)#, AccessBasedMaxFee = #trim(AccessBasedMaxFee)#, NoteCode = '#trim(NoteCode)#'
						WHERE recordID = #trim(getCode.recordID)#
					</cfquery>					
				</cfif>
				
			<cfelse>
				
				<!------------------------------------------------------------------>
				<!--- show to the screen the query that will be run to insert.   --->
				<!------------------------------------------------------------------>				
				<cfoutput>
					<font size="1">
						[#count1#][INSERT NEW]<br>
						[TOScode: #trim(codeTOS)#]<br>
						[#trim(i)#]<br>
						<font color="FF0000">
							[#trim(code)# #trim(description)# #trim(TMRMpayable)# #trim(TotalRVUs)# #trim(ConversionFactor)# #trim(AccessBasedMaxFee)# #trim(NoteCode)#]<br>
						</font>
				
						&lt;cfquery name="insertCode" datasource="#trim(request.datasource)#"&gt;<br>
							INSERT INTO ei_2_DMEFEECode  (TOSCode, code, description, TMRMpayable, TotalRVUs, ConversionFactor, AccessBasedMaxFee, NoteCode)<br>
							VALUES('#trim(codeTOS)#', '#trim(code)#', '#trim(description)#', #trim(TMRMpayable)#, #trim(TotalRVUs)#, #trim(ConversionFactor)#, #trim(AccessBasedMaxFee)#, '#trim(NoteCode)#')<br>
						&lt;/cfquery&gt;<p>
					</font>
				</cfoutput>
				
				<cfif NOT testmode>	
					<cfquery name="insertCode" datasource="#trim(request.datasource)#">
						INSERT INTO ei_2_DMEFEECode  (TOSCode, code, description, TMRMpayable, TotalRVUs, ConversionFactor, AccessBasedMaxFee, NoteCode)
						VALUES('#trim(codeTOS)#', '#trim(code)#', '#trim(description)#', #trim(TMRMpayable)#, #trim(TotalRVUs)#, #trim(ConversionFactor)#, #trim(AccessBasedMaxFee)#, '#trim(NoteCode)#')
					</cfquery>				
				</cfif>
				
			</cfif>
											
			<cfset code = "">
			<cfset description = "">				
			<cfset TMRMpayable = "">		
			<cfset TotalRVUs = "">	
			<cfset ConversionFactor = "">	
			<cfset AccessBasedMaxFee = "">	
			<cfset NoteCode = "">			
			
			<cfset count1 = count1 + 1> 
			
		</cfif>
					
	</cfloop>

		
