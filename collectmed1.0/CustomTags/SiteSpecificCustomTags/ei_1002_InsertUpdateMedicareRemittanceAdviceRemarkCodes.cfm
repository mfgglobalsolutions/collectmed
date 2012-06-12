<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---  ei_1002_InsertUpdateMedicareRemittanceAdviceRemarkCodes.cfm --->
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
<!--- MedicareRemittanceAdviceRemarkCodes .txt                   --->
<!--- Downloaded from tmhp                                       --->
<!--- This tag will read the file above and place the claim      --->
<!--- adjustment codes into the database.                        --->
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
<!---  &lt;cf_ei_1002_InsertUpdateMedicareRemittanceAdviceRemarkCodes<br> --->
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
<!--- <strong>filename</strong>                                  --->
<!--- (MedicareRemittanceAdviceRemarkCodes .txt)<br>             --->
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

	<cfparam name="attributes.filename" default="MedicareRemittanceAdviceRemarkCodes.txt">
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
	
	<cfoutput>
		<p>Prior to running this page you must download the new claim Adjustment Codes from the site http://www.wpc-edi.com/codes/remittanceadvice <p>You will see UPDATE or INSERT for each row. <p>Ouput in black is what was gathered from the actual file. Ouput in red is what Cold Fusion has parsed out. <p>NOTE: BOTH THE RED AND BLACK LINES SHOULD MATCH ENTIRELY. <p>When you feel confident in this output then and only then call this tag with testmode=no<p>File Called: #trim(filepath)#\#trim(fileName)#</p>
		<p><font color="FF0000">IMPORTANT: Once all codes have been added you must change the code 643 to "-X-". Reason: &lt;cfset codeID = 643&gt;&lt;!---HardCoded record that was placed in table as a catchall.---&gt;</font></p>
	</cfoutput>

		
<!------------------------------------------------------------------>
<!--- Loop through the file content that was read in and use     --->
<!--- the newline and line feed as the delimeter and put each    --->
<!--- line item into the database depending on the code. If      --->
<!--- the code already exists then simply the description may    --->
<!--- have changed. so update the description. If the code       --->
<!--- does not exist then enter into the database.               --->
<!------------------------------------------------------------------>
	<cfloop list="#trim(fileContent)#" delimiters="#chr(13)##chr(10)#" index="i">
		
		<cfset code =  ListFirst(i, "	")>
		<cfset description =  ListLast(i, "	")>
		
		<cfquery name="getCode" datasource="#trim(request.datasource)#">
			SELECT recordID 
			FROM pa_master.eob_medicare_remittanceadviceremarkcode  
			WHERE code = '#trim(code)#'
		</cfquery>
		
		<cfif getCode.RecordCount GTE 1>
			
			<cfoutput><font size="1">[UPDATE]<br>[#trim(i)#]<br><font color="FF0000">[#trim(code)##trim(description)#]</font><p></p></font></cfoutput>
			
			<cfif NOT testmode>
				
				<cfquery name="update" datasource="#trim(request.datasource)#">
					UPDATE pa_master.eob_medicare_remittanceadviceremarkcode  
					SET code = '#trim(code)#', description = '#trim(description)#', dateModified = now()
					WHERE recordID = #trim(getCode.recordID)#
				</cfquery>
				
			</cfif>
			
		<cfelse>
			
			<cfoutput><font size="1">[INSERT NEW]<br>[#trim(i)#]<br><font color="FF0000">[#trim(code)##trim(description)#]</font><p></p></font></cfoutput>
			
			<cfif NOT testmode>

				<cfquery name="insertCode" datasource="#trim(request.datasource)#">
					INSERT INTO pa_master.eob_medicare_remittanceadviceremarkcode  (code, description)
					VALUES('#trim(code)#', '#trim(description)#')
				</cfquery>
			
			</cfif>
			
		</cfif>
			
		<cfset code =  "">
		<cfset description =  "">
					
	</cfloop>

		



