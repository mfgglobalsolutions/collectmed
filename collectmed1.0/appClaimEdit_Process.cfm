<!---- appClaimEdit_Process.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.claimID" default="">
	<cfset claimID = attributes.claimID>
	
	<cfif IsDefined("form.claimID") AND form.claimID NEQ "">
		<cfset claimID = form.claimID>
	<cfelseif IsDefined("url.claimID") AND url.claimID NEQ "">
		<cfset claimID = url.claimID>	
	</cfif>


<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="claimID"
		fieldnames="Claim ID"
		datatypes="numeric">
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Start the processing of this page.                                             --->
<!-------------------------------------------------------------------------------------->
	
	<!-------------------------------------------------------------------------------------->
	<!--- Loop the form fields and add the records back as stated.                       --->
	<!-------------------------------------------------------------------------------------->					
	<cfloop list="#form.FieldNames#" index="i">		
									
		<cfif FindNoCase("Checkbox_CloseProc_", i) NEQ 0 AND IsNumeric(ListLast(i, "_"))>
			
			<cfset thisProcedureID = ListLast(i, "_")>
			
			<cfquery name="InsertProcedureOpenClose" datasource="#trim(request.datasource)#">
				INSERT INTO procedureopenclose (ProcedureID, OpenOrClose, UsersID)
				VALUES(#trim(thisProcedureID)#, 0, #trim(session.user.getUsersID())#)
			</cfquery>						
			
		</cfif> 
		
	</cfloop>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Locate back to the Claim Edit screen.                                          --->
<!-------------------------------------------------------------------------------------->
	<cflocation addtoken="No" url="appClaimEdit.cfm?claimID=#trim(claimID)#">	
	
	
	
