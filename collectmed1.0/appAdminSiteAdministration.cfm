<!------------------------------------------------------------------>
<!--- PURPOSE:                                                   --->      
<!---                                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!---                                                            --->
<!---                                                            --->      
<!------------------------------------------------------------------>



<!------------------------------------------------------------------>
<!--- Start the display of this page.                            --->
<!------------------------------------------------------------------>
	<br>	
	<!---<table cellspacing="0" cellpadding="4" border="0">
		<tr>
		    <td rowspan="2" valign="top">
				
				<cfif session.Client.getClientID() EQ 1084>
					
					<cf_gcBorderedTable title="Administrator&nbsp;Links" tablealign="center">
					
						<table border="0" cellpadding="2" cellspacing="0" width="100%">
												
							<!------------------------------------------------------------------>
							<!--- This link will take the user to the main site reporting    --->
							<!--- page that will allow the user to see who has visited       --->
							<!--- what pages on the main site. This link should only be      --->
							<!--- used by the eobmanager administrator.                      --->
							<!------------------------------------------------------------------>						
														
									<cfif ListContains(session.User.getRoleIDs(), "8")>
										<tr>
											<td class="SiteLabel">		
												<a href="appAdminReporting.cfm">Site&nbsp;Visitors&nbsp;Reporting</a>
											</td>
										</tr>		
									</cfif>		
									<cfif ListContains(session.User.getRoleIDs(), "8")>
										<tr>
											<td class="SiteLabel">		
												<a href="appAdminStandardLists.cfm">Standard&nbsp;Lists</a>
											</td>
										</tr>		
									</cfif>
									<cfif ListContains(session.User.getRoleIDs(), "8")>
										<tr>
											<td class="SiteLabel">		
												<a href="appLogViewer.cfm">View&nbsp;Logs</a>
											</td>
										</tr>		
									</cfif>				
									<cfif session.User.getusersID() EQ 55 OR session.User.getusersID() EQ 100135>
										<tr>
											<td class="SiteLabel">		
												<a href="appAdminCreateSitePage.cfm">Create&nbsp;a&nbsp;site&nbsp;page</a>
											</td>
										</tr>			
										<tr>
											<td class="SiteLabel">		
												<a href="appAdminSite.cfm">Change&nbsp;Variables</a>	
											</td>
										</tr>		
									</cfif>		
									
									<tr>
										<td class="SiteLabel" nowrap>		
											<a href="appAdministratorSetClientIPAddresses.cfm">Set Valid IP Addresses</a>	
										</td>
									</tr>	
									  											
								</td>								
							</tr>	
							
						</table>
							
					</cf_gcBorderedTable>
			
				</cfif>
				
			</td>		   
		</tr>
	
	</table>--->
	
	
	
	<cfif session.User.getusersID() EQ 55 OR session.User.getusersID() EQ 100135 OR session.User.getusersID() EQ 100130>		






		<!-------------------------------------------------------------------------------------->
		<!--- Get the administrator information.                                             --->
		<!-------------------------------------------------------------------------------------->	
		<cfquery name="getAllClients" datasource="#trim(application.beanFactory.getBean('configBean').getDsn().master)#">
			SHOW Databases
		</cfquery>	
		<cfset clientList = "">
		<cfloop query="getAllClients">
			<cfif database_name neq "paclient_master" AND findNoCase("paclient_", database_name)>
				<cfset clientList = ListAppend(clientList, database_name)>
			</cfif>
		</cfloop>
		
		<cfloop list="#clientList#" index="thisDS">		
		
			<cftry>
				
		<cfquery name="tempGet" datasource="#trim(thisDS)#">
			SELECT u.usersid, u.entry, u.entrypoint, u.entryresponse, u.Active, e.clientID, e.entityID, c.clientName, e.fname, e.lname
			FROM pa_master.users u 
			LEFT JOIN entity e ON u.entityID = e.EntityID 
			JOIN pa_master.Client c ON e.clientID = c.clientID		
			WHERE e.objectTypeID = 2
		</cfquery>		
				<cfif tempGet.recordCount GTE 1>
		<cfoutput>				
						<table border="1" cellpadding="4" cellspacing="0" width="700">
				<tr><th class="SiteLabel" nowrap bgcolor="DCE3EB">Client Name</th><th class="SiteLabel" nowrap bgcolor="DCE3EB">UsersID</th><th class="SiteLabel" nowrap bgcolor="DCE3EB">Active</th> <th class="SiteLabel" nowrap bgcolor="DCE3EB">Name</th> <th class="SiteLabel" nowrap bgcolor="DCE3EB">Entry</th> <th class="SiteLabel" nowrap bgcolor="DCE3EB">Entry Point</th> <th class="SiteLabel" nowrap bgcolor="DCE3EB">Entry Response</th></tr>
				<cfloop query="tempGet">	
					<cfset Entry1 = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(entry)) />
					<cfset EntryPoint1 = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EntryPoint)) />
					<cfset EntryResponse1 = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EntryResponse)) />
					<tr><td nowrap class="SiteLabel">#ClientName#</td><td class="SiteLabel" title="#entityID#" nowrap>#UsersID#</td> <td class="SiteLabel"><cfif active>Yes<cfelse>No</cfif></td> <td class="SiteLabel" nowrap>#fname# #lname#</td> <td class="SiteLabel" nowrap><cfif entry1 EQ "">&nbsp;<cfelse>#trim(entry1)#</cfif></td> <td class="SiteLabel" nowrap><cfif entryPoint1 EQ "">&nbsp;<cfelse>#trim(entryPoint1)#</cfif></td> <td class="SiteLabel" nowrap><cfif entryResponse1 EQ "">&nbsp;<cfelse>#trim(entryResponse1)#</cfif></td></tr>
				</cfloop>					
			</table>				
		</cfoutput>
		<br><br>
				</cfif>
			
				<cfcatch>
					<cfoutput>					
						<p>Caught an exception, type = #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#</p>			
					</cfoutput>				
				</cfcatch>
			</cftry>
		
		</cfloop>
		
		<!---<br><br>
		<cfquery name="tempGet2" datasource="pa_master">
			SELECT u.usersid, u.entry, u.entrypoint, u.entryresponse, u.Active, u.clientID, u.datecreated 
			FROM users u 
			Order BY DateCreated DESC
		</cfquery>		
		<cfoutput>				
			<table border="1" cellpadding="4" cellspacing="0">
				<tr><th class="SiteLabel" nowrap bgcolor="DCE3EB">Created</th><th class="SiteLabel" nowrap bgcolor="DCE3EB">UsersID</th><th class="SiteLabel" nowrap bgcolor="DCE3EB">Entry</th> <th class="SiteLabel" nowrap bgcolor="DCE3EB">Entry Point</th> <th class="SiteLabel" nowrap bgcolor="DCE3EB">Entry Response</th></tr>
				<cfloop query="tempGet2">	
					<cfset Entry1 = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(entry)) />
					<cfset EntryPoint1 = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EntryPoint)) />
					<cfset EntryResponse1 = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EntryResponse)) />	
					<tr><td nowrap class="SiteLabel">#DateFormat(dateCreated, "MM/DD/YYYY")# #TimeFormat(dateCreated, "HH:MM:SS TT")#</td><td class="SiteLabel" nowrap>#UsersID#</td><td class="SiteLabel" nowrap><cfif entry1 EQ "">&nbsp;<cfelse>#trim(entry1)#</cfif></td> <td class="SiteLabel" nowrap><cfif entryPoint1 EQ "">&nbsp;<cfelse>#trim(entryPoint1)#</cfif></td> <td class="SiteLabel" nowrap><cfif entryResponse1 EQ "">&nbsp;<cfelse>#trim(entryResponse1)#</cfif></td></tr>
				</cfloop>					
			</table>				
		</cfoutput>--->
				
	</cfif>
	
	
	
	
	
