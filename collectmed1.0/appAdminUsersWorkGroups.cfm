<!---- appAdminUsersWorkGroups.cfm ---->
	  
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
	
	<cfparam name="attributes.msg" default="">
	<cfset msg = attributes.msg>
	
	<cfif IsDefined("form.msg") AND form.msg NEQ "">
		<cfset msg = form.msg>
	<cfelseif IsDefined("url.msg") AND url.msg NEQ "">
		<cfset msg = url.msg>	
	</cfif>
	
	
	

<!-------------------------------------------------------------------------------------->
<!--- Get all the WorkGroups available for this site.                                --->
<!-------------------------------------------------------------------------------------->			
	<cfset request.WorkGroup = CreateObject("component","com.common.WorkGroup")>	
	<cfset getWorkGroups = request.WorkGroup.getWorkGroups(clientID: trim(session.clientID))>	
		
	
	<cfif getWorkGroups.RecordCount LT 1>
		<cfthrow message="The are no work groups associated to this client.">
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Query for the userrecord.                                                      --->
<!-------------------------------------------------------------------------------------->	
	<cfquery name="getClientAccount" datasource="#trim(request.datasource)#">
		SELECT u.usersID, e.FName + ' '  + e.LName AS Fullname  
		FROM entity AS e   LEFT JOIN pa_master.users AS u   ON e.EntityID = u.EntityID
		WHERE u.UsersID = #trim(UsersID)# 			
	</cfquery>
	
	<cfif getClientAccount.RecordCount LT 1>
		<cf_gcGeneralErrorTemplate				
			message="The specified cannot be found.">
	</cfif>			
	


<!-------------------------------------------------------------------------------------->
<!--- Get the userss of this group.                                                  --->
<!-------------------------------------------------------------------------------------->		
	<cfquery name="getUsersWorkGroups" datasource="#trim(request.datasource)#">
		SELECT WorkGroupID
		FROM usersworkgroup  
		WHERE UsersID = #trim(UsersID)# 		
	</cfquery>
	
	<cfset groupUsers = valueList(getUsersWorkGroups.WorkGroupID)>	
	
	
		
<!-------------------------------------------------------------------------------------->
<!--- Show message if any.                                                           --->
<!-------------------------------------------------------------------------------------->
	<cfif msg NEQ "">
		<cfoutput>
			<br><br><font face="Verdana" size="5" color="FF0000">#trim(msg)#</font><br>	
		</cfoutput>
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Decide what the user will see.                                                 --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
			
		<br><br>
		<cf_gcBorderedTable	title="Edit&nbsp;Users&nbsp;Work&nbsp;Groups" tablewidth="50%" tablealign="center">			
			<form method="post" action="appAdminUsersWorkGroupsUpdate.cfm">				
				<input type="Hidden" name="UsersID" value="#trim(UsersID)#">				
				<table border="0" cellpadding="2" cellspacing="2" align="center">
					<tr>
						<td class="SiteLabel">		
							<strong>Groups Available to #trim(getClientAccount.FullName)#:</strong>											
						</td>							
					</tr>	
					<tr>
						<td class="SiteLabel">		
							<table>								
								<cfloop query="getWorkGroups">
									<tr><td class="SiteLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="Checkbox" <cfif ListFind(groupUsers, trim(WorkGroupID))> CHECKED</cfif> value="#trim(WorkGroupID)#" name="GroupCheckbox_#trim(WorkGroupID)#">&nbsp;#trim(WorkGroupName)#</td></tr>
								</cfloop>
							</table>													
						</td>							
					</tr>	
																
					<tr>
						<td align="center" colspan="2" class="SiteLabel">
							<br><br>	
							<cf_gcSubmitButton value="Update">
							<input type="hidden" name="Submitted" value="yes">								
						</td>
					</tr>														
				</table>
			</form>	
		</cf_gcBorderedTable>
		
	</cfoutput>
	
	

