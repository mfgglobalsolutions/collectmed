<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---  ei_1002_InsertUpdateDMEFeeTOSCodes.cfm                    --->
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
<!---  &lt;cf_ei_1002_InsertUpdateDMEFeeTOSCodes<br>             --->
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
										
			<cfset tempString = mid(trim(i), REQUEST.nextSpace(0, trim(i)), len(trim(i)))>
			<cfset nextSpace = REQUEST.nextSpace(0, trim(tempString))>
			<cfset code = mid(tempString, 1, nextSpace)>
			<cfset nonDescription = "TOS: " & trim(code) & " -">
			<cfset start = len(trim(nonDescription)) + 2>
			<cfset end = len(trim(i)) - trim(start) + 1>
			<cfset description = mid(trim(i), trim(start), trim(end))>
					
			<cfquery name="getCode" datasource="#trim(request.datasource)#">
				SELECT recordID 
				FROM ei_2_DMEFEETOSCode  
				WHERE code = '#trim(code)#' 
			</cfquery>
			
			<cfif getCode.RecordCount GTE 1>
				
				<!------------------------------------------------------------------>
				<!--- show to the screen the query that will be run to insert.   --->
				<!------------------------------------------------------------------>				
				<cfoutput>
					<font size="1">
						[UPDATE]<br>
						[#trim(i)#]<br>
						<font color="FF0000">
							[#trim(code)# #trim(description)#]<br>
						</font>
				
						&lt;cfquery name="update" datasource="#trim(request.datasource)#"&gt;<br>
							UPDATE ei_2_DMEFEETOSCode <br> 												
							SET dateModified = NOW(), code = '#trim(code)#', description = '#trim(description)#'<br>
							WHERE recordID = #trim(getCode.recordID)#<br>
						&lt;/cfquery&gt;		
					</font>
				</cfoutput>
				
				
				<cfif NOT testmode>					
					<cfquery name="update" datasource="#trim(request.datasource)#">
						UPDATE ei_2_DMEFEETOSCode  												
						SET dateModified = NOW(), code = '#trim(code)#', description = '#trim(description)#'
						WHERE recordID = #trim(getCode.recordID)#
					</cfquery>					
				</cfif>
				
			<cfelse>
				
				<!------------------------------------------------------------------>
				<!--- show to the screen the query that will be run to insert.   --->
				<!------------------------------------------------------------------>				
				<cfoutput>
					<font size="1">
						[INSERT NEW]<br>
						[#trim(i)#]<br>
						<font color="FF0000">
							[#trim(code)# #trim(description)#]<br>
						</font>
				
						&lt;cfquery name="insertCode" datasource="#trim(request.datasource)#"&gt;<br>
							INSERT INTO ei_2_DMEFEETOSCode  (code, description)<br>
							VALUES('#trim(code)#', '#trim(description)#')<br>
						&lt;/cfquery&gt;<p>
					</font>
				</cfoutput>
				
				<cfif NOT testmode>	
					<cfquery name="insertCode" datasource="#trim(request.datasource)#">
						INSERT INTO ei_2_DMEFEETOSCode  (code, description)
						VALUES('#trim(code)#', '#trim(description)#')
					</cfquery>				
				</cfif>
				
			</cfif>
											
			<cfset tempString = "">
			<cfset nextSpace = "">
			<cfset code = "">
			<cfset nonDescription = "">
			<cfset start = "">
			<cfset end = "">
			<cfset description = "">				
		
		</cfif>
		
	</cfloop>	
	
	