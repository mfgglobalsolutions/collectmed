<!-------------------------------------------------------------------------------------->
<!--- NOTE: PLACE ALL TAG INFO YOU WANT DISPLAYED BETWEEN THE DOUBLE @@ SYMBOLS.     --->
<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@NAME@@                                                                       --->
<!---    appAdminUsers.cfm                                                           --->
<!--- @@NAME@@                                                                       --->
<!-------------------------------------------------------------------------------------->
<!--- CATEGORY:                                                                      --->
<!--- @@CATEGORY@@                                                                   --->
<!---                                                                                --->
<!--- @@CATEGORY@@                                                                   --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- AUTHOR:                                                                        --->
<!--- @@AUTHOR@@                                                                     --->
<!---                                                                                --->
<!--- @@AUTHOR@@                                                                     --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- DESCRIPTION:                                                                   --->      
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@EXAMPLECALL@@                                                                --->
<!---   &lt;cf_&gt;                                                                  --->
<!--- @@EXAMPLECALL@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- REQUIRED PARAMETERS:                                                           --->
<!--- @@REQUIREDPARAMETERS@@                                                         --->
<!---                                                                                --->  
<!--- @@REQUIREDPARAMETERS@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- OPTIONAL PARAMETERS:                                                           --->
<!--- @@OPTIONALPARAMETERS@@                                                         --->
<!---                                                                                --->  
<!--- @@OPTIONALPARAMETERS@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- RETURNED PARAMETERS:                                                           --->
<!--- @@RETURNEDPARAMETERS@@                                                         --->
<!---                                                                                --->  
<!--- @@RETURNEDPARAMETERS@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- HISTORY:                                                                       --->
<!--- @@HISTORY@@                                                                    --->
<!---                                                                                --->
<!--- @@HISTORY@@                                                                    --->
<!---                                                                                --->      
<!-------------------------------------------------------------------------------------->



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.title" default="View&nbsp;Users">
	<cfset title = attributes.title>
	
	<cfparam name="attributes.ability" default="list">
	<cfset ability = attributes.ability>
	
	<cfparam name="attributes.action" default="">
	<cfset action = attributes.action>
	
	<cfif IsDefined("form.action") AND form.action NEQ "">
		<cfset action = form.action>
	<cfelseif IsDefined("url.action") AND url.action NEQ "">
		<cfset action = url.action>	
	</cfif>
		
	<cfparam name="attributes.msg" default="">
	<cfset msg = attributes.msg>
	
	<cfif IsDefined("form.msg") AND form.msg NEQ "">
		<cfset msg = form.msg>
	<cfelseif IsDefined("url.msg") AND url.msg NEQ "">
		<cfset msg = url.msg>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Query for the users of this client. Except for Client Account                  --->
<!-------------------------------------------------------------------------------------->	
	<cfquery name="getClientAccounts" datasource="#trim(request.datasource)#">
		SELECT e.EntityID, e.SiteID, e.ClientID, e.FName, e.MName, e.LName, e.ObjectTypeID, u.active, u.UsersID, u.Suspend
		FROM entity AS e   LEFT JOIN pa_master.Users AS u   ON e.EntityID = u.EntityID
		WHERE u.ClientID = #trim(session.ClientID)# AND e.ObjectTypeID = 2
		ORDER BY u.Active DESC, e.ObjectTypeID DESC
	</cfquery>
	<!---
	Changed it to u. on 3/3/07
	WHERE e.ClientID = #trim(session.ClientID)# AND e.ObjectTypeID = 2--->	
	
		
<!------------------------------------------------------------------>
<!--- Set the header for this page.                              --->
<!------------------------------------------------------------------>
	<cfif action EQ "list">
		<cfset title = "User&nbsp;Accounts">
	</cfif>
	<cfset title = title & "&nbsp;&nbsp;&nbsp;&nbsp;<a href=""appAdminUsersAdd.cfm"">Add&nbsp;User</a>">		
	<br>
	<cfif msg NEQ "">
		<cfoutput>
			<p><font face="Verdana" size="5" color="FF0000">#trim(msg)#</font></p>			
		</cfoutput>
	</cfif>
	<cf_gcBorderedTable	title="#trim(title)#" tablewidth="75%">	
		
		<table align=center border="0" cellpadding="4" cellspacing="0" class="Tbl">
			<br><br>
			<thead>			
				<td nowrap valign="bottom">ID</td>
				<td nowrap valign="bottom">Name</td>
				<td nowrap valign="bottom" align="center">Action</td>			
			</thead>
			
			<cfset count = 0>
			<cfset inactiveAccount = false>
			
			<cfloop query="getClientAccounts">
				
				<cfset count = count + 1>
				
				<cfif ObjectTypeID EQ 1>
					<cfquery name="getClientName" datasource="#trim(request.datasource)#">
						Select ClientName
						FROM pa_master.client  
						WHERE ClientID = #trim(session.ClientID)#
					</cfquery>					
				</cfif>
				
				<cfoutput>
					<tr <cfif count MOD 2 EQ 0> class="TblRow"</cfif>>			
						<cfif NOT inactiveAccount AND active EQ 0>
							<td class="SiteLabel" nowrap align="center" colspan="3"><strong><font size="2">INACTIVE ACCOUNTS</font></strong></td>	
							<cfset inactiveAccount = true>					
						<cfelse>
						
							<td class="SiteLabel" nowrap><cfif active NEQ 0>#trim(EntityID)#<cfelse><font color="c0c0c0">#trim(EntityID)#</font></cfif></td>
							<td class="SiteLabel" nowrap align="center"><cfif ObjectTypeID EQ 1>#trim(getClientName.ClientName)#<cfelse><cfif active NEQ 0>#trim(FName)# #trim(MName)# #trim(LName)#<cfelse><font color="c0c0c0">#trim(FName)# #trim(MName)# #trim(LName)#</font></cfif></cfif></td>
							<td class="SiteLabel" nowrap>
								
								<table cellpadding="0" cellspacing="0" border="0" align="left">
									<tr>
										<td class="SiteLabel">
											<cfif active NEQ 0><a href="appAdminUsersEdit.cfm?entityID=#trim(EntityID)#">Edit</a><cfelse><font color="c0c0c0">Edit</font></cfif>
										</td>
										<td>&nbsp;</td>
										<td class="SiteLabel">	
											<cfif suspend NEQ 1 and active neq 0>
												<a href="javascript:VerifyDeleteAction('appAdminUsersDelete.cfm?action=suspend&entityID=#trim(EntityID)#', 'Are you sure you want to suspend this user?\n\nSuspending a user means they wont be able to login, but their account will remain the same.\n\n');">
													Suspend					
												</a>
											<cfelse>
												<cfif suspend EQ 1>
													<a href="javascript:VerifyDeleteAction('appAdminUsersDelete.cfm?action=reinstate&entityID=#trim(EntityID)#', 'Are you sure you want to un-suspend this user?\n\nThis will allow the user to login as if nothing ever happened.\n\n');">
														Un-suspend					
													</a>
												<cfelse>
													<font color="c0c0c0">Suspend</font>
												</cfif>	
											</cfif>
										</td>
										<td>&nbsp;</td>
										<td class="SiteLabel">	
											<cfif active NEQ 0>
												<a href="javascript:VerifyDeleteAction('appAdminUsersDelete.cfm?entityID=#trim(EntityID)#', 'Are you sure you want to deactivate this user?\n\nThis will take the user account out of the system, to include all their settings. You will not be able to re-activate this account. \n\nIf you have any doubts it might be a better idea to suspend the account for the time being until you can decide.\n\n');">
													Deactivate										
												</a>
											<cfelse>
												<cfif active EQ 0>
													<font color="c0c0c0">Archived</font>
												<cfelse>
													<font color="c0c0c0">Deactivate</font>
												</cfif>	
											</cfif>
										</td>
										<td>&nbsp;</td>
										<td class="SiteLabel">
											<cfif active EQ 1>
											<a href="appAdminUsersWorkGroups.cfm?UsersID=#trim(getClientAccounts.UsersID)#">
												Groups					
											</a>
											<cfelse>
												<font color="c0c0c0">Groups</font>	
											</cfif>
										</td>
									</tr>
								</table>
								
							</td>	
							
						</cfif>	
							
					</tr>
					
				</cfoutput>
				
			</cfloop>
			
		</table>
		<br><br>
	</cf_gcBorderedTable>
	
	



