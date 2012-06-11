<!---- appAdminUsersWorkGroupsUpdate.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.UsersID" default="">
	<cfset UsersID = attributes.UsersID>
	
	<cfif IsDefined("form.UsersID") AND form.UsersID NEQ "">
		<cfset UsersID = form.UsersID>
	<cfelseif IsDefined("url.UsersID") AND url.UsersID NEQ "">
		<cfset UsersID = url.UsersID>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="UsersID"
		fieldnames="Users ID"
		datatypes="numeric">	
	
	
		
<!-------------------------------------------------------------------------------------->
<!--- Decide what the page will do.                                                  --->
<!-------------------------------------------------------------------------------------->	

	<cftry>
		
			<cftransaction>
												
				<!-------------------------------------------------------------------------------------->
				<!--- delete the users of this group.                                                --->
				<!-------------------------------------------------------------------------------------->		
				<cfquery name="delUsersWorkGroup" datasource="#trim(request.datasource)#">
					DELETE FROM usersworkgroup 
					WHERE UsersID = #trim(UsersID)# 		
				</cfquery>
				
				<!-------------------------------------------------------------------------------------->
				<!--- Loop the form fields and add the records back as stated.                       --->
				<!-------------------------------------------------------------------------------------->					
				<cfloop list="#form.FieldNames#" index="i">		
												
					<cfif FindNoCase("GroupCheckbox_", i) NEQ 0 AND IsNumeric(ListLast(i, "_"))>
						
						<cfset thisGroupID = ListLast(i, "_")>
						
						<cfquery name="insertRecord" datasource="#trim(request.datasource)#">
							INSERT INTO usersworkgroup (UsersID, WorkGroupID)
							VALUES(#trim(UsersID)#, #trim(thisGroupID)#)
						</cfquery>							
						
					</cfif> 
					
				</cfloop>				
				
				<cfset msg = "<font size=2 face=Verdana><strong>Users Groups Updated Successfully</strong></font>">
								
			
			</cftransaction>
			
			
			
			<cflocation addtoken="No" url="appAdminUsersWorkGroups.cfm?UsersID=#trim(UsersID)#&msg=#URLEncodedFormat(trim(msg))#"> 		
				
				
		
		
		<cfcatch type="Any">
			
			<cfoutput>
			
				<p>Caught an exception, type = #CFCATCH.TYPE#</p>
				<p>#cfcatch.message# #cfcatch.detail#</p>			             
				<cfabort>
			</cfoutput>
			
		</cfcatch>
		
	</cftry>
		
		
		
	

