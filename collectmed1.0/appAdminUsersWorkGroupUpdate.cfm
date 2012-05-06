<!---- appAdminUsersWorkGroupUpdate.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.workGroupID" default="">
	<cfset workGroupID = attributes.workGroupID>
	
	<cfif IsDefined("form.workGroupID") AND form.workGroupID NEQ "">
		<cfset workGroupID = form.workGroupID>
	<cfelseif IsDefined("url.workGroupID") AND url.workGroupID NEQ "">
		<cfset workGroupID = url.workGroupID>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="workGroupID"
		fieldnames="Work Group ID"
		datatypes="numeric">	
	
	
		
<!-------------------------------------------------------------------------------------->
<!--- Decide what the page will do.                                                  --->
<!-------------------------------------------------------------------------------------->	

	<cftry>
		
			<cftransaction>
				
				<cfquery name="getWorkGroup" datasource="#trim(request.datasource)#">
					SELECT WorkGroupID, WorkGroupName
					FROM WorkGroup 
					WHERE WorkGroupID = #trim(WorkGroupID)#					
				</cfquery>
				
				<cfif getWorkGroup.RecordCount NEQ 1>
					<cfthrow message="The Work Group ID sent in does not exist.">
				</cfif>
				
				<!-------------------------------------------------------------------------------------->
				<!--- delete the users of this group.                                                --->
				<!-------------------------------------------------------------------------------------->		
				<cfquery name="delUsersWorkGroup" datasource="#trim(request.datasource)#">
					DELETE FROM UsersWorkGroup 
					WHERE WorkGroupID = #trim(WorkGroupID)# 		
				</cfquery>
				
				<!-------------------------------------------------------------------------------------->
				<!--- Loop the form fields and add the records back as stated.                       --->
				<!-------------------------------------------------------------------------------------->					
				<cfloop list="#form.FieldNames#" index="i">		
												
					<cfif FindNoCase("UserCheckbox_", i) NEQ 0 AND IsNumeric(ListLast(i, "_"))>
						
						<cfset thisUsersID = ListLast(i, "_")>
						
						<cfquery name="insertRecord" datasource="#trim(request.datasource)#">
							INSERT INTO UsersWorkGroup (UsersID, WorkGroupID)
							VALUES(#trim(thisUsersID)#, #trim(WorkGroupID)#)
						</cfquery>							
						
					</cfif> 
					
				</cfloop>				
				
				<cfset msg = "<font size=2 face=Verdana><strong>Work Group ""#trim(getWorkGroup.WorkGroupName)#"" Users Updated Successfully</strong></font>">
								
			
			</cftransaction>

			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Locate the user based on the view.                                             --->
			<!-------------------------------------------------------------------------------------->		
			<cfif IsDefined("form.view") AND form.view EQ "all">
				<cflocation addtoken="No" url="appAdminUsersWorkGroup.cfm?msg=#URLEncodedFormat(trim(msg))#"> 
			<cfelse>
				<cflocation addtoken="No" url="appAdminUsersWorkGroup.cfm?workgroupID=#trim(WorkGroupID)#&msg=#URLEncodedFormat(trim(msg))#"> 		
			</cfif>			
		
		
		
		
		<cfcatch type="Any">
			
			<cfoutput>
			
				<p>Caught an exception, type = #CFCATCH.TYPE#</p>
				<p>#cfcatch.message# #cfcatch.detail#</p>			             
				<cfabort>
			</cfoutput>
			
		</cfcatch>
		
	</cftry>
		
		
		
	