<!-------------------------------------------------------------------------------------->
<!--- NOTE: PLACE ALL TAG INFO YOU WANT DISPLAYED BETWEEN THE DOUBLE @@ SYMBOLS.     --->
<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@NAME@@                                                                       --->
<!---    appAdminWorkGroupsManage.cfm                                                --->
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
	<cfparam name="attributes.title" default="View Groups">
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
<!--- Query for the Groups of this client.                                           --->
<!-------------------------------------------------------------------------------------->	
	<cfquery name="getWorkGroups" datasource="#trim(request.datasource)#">
		SELECT COUNT(uwg.WorkGroupID) as NumOfUsers, wg.WorkGroupID, wg.WorkGroupName
		FROM workgroup AS wg LEFT JOIN UsersWorkGroup AS uwg ON wg.WorkGroupID = uwg.WorkGroupID		
		GROUP BY uwg.WorkGroupID, wg.WorkGroupID, wg.WorkGroupName		
	</cfquery>
		
	
		
<!------------------------------------------------------------------>
<!--- Set the header for this page.                              --->
<!------------------------------------------------------------------>
	<cfif action EQ "list">
		<cfset title = "Work&nbsp;Groups">
	</cfif>
	<cfset title = title & "&nbsp;&nbsp;&nbsp;&nbsp;<a href=""appAdminWorkGroupAdd.cfm"">Add&nbsp;Work&nbsp;Group</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=""appAdminUsersWorkGroup.cfm"">Edit&nbsp;Work&nbsp;Group&nbsp;Users</a>">		
	<br>
	<cfif msg NEQ "">
		<cfoutput>
			<p><font face="Verdana" size="5" color="FF0000">#trim(msg)#</font></p>			
		</cfoutput>
	</cfif>
	<cf_gcBorderedTable	title="#trim(title)#" tablewidth="75%" tablealign="center">	
		
		<table align=center border="0" cellpadding="4" cellspacing="0" class="Tbl">
			<br><br>
			<thead>			
				<td nowrap valign="bottom">ID</td>
				<td nowrap valign="bottom">Name</td>
				<td nowrap valign="bottom" align="center">Action</td>			
			</thead>
			
			<cfset count = 0>
			
			<cfloop query="getWorkGroups">
				
				<cfset count = count + 1>
								
				<cfoutput>
					<tr <cfif count MOD 2 EQ 0> class="TblRow"</cfif>>			
						<td class="SiteLabel" nowrap>#trim(WorkGroupID)#</td>
						<td class="SiteLabel" nowrap align="center">#trim(WorkGroupName)#</td>
						<td class="SiteLabel" nowrap>
							
							<table cellpadding="0" cellspacing="0" border="0" align="left">
								<tr>
									<td class="SiteLabel">
										<a href="appAdminWorkGroupEdit.cfm?workgroupID=#trim(WorkGroupID)#">Edit</a>
									</td>
									<td>&nbsp;&nbsp;</td>
									<td class="SiteLabel">										
										<cfif trim(NumOfUsers) EQ 0>
											<a href="javascript:VerifyDeleteAction('appAdminWorkGroupDelete.cfm?workgroupID=#trim(WorkGroupID)#', 'Are you sure you want to delete this Work Group?');">
												Delete								
											</a>
										<cfelse>
											<span style="cursor: hand" title="Number of users attached - #trim(NumOfUsers)#">Delete</span>	
										</cfif>											
									</td>
									<td>&nbsp;&nbsp;</td>
									<td class="SiteLabel">
										<a href="appAdminUsersWorkGroup.cfm?workgroupID=#trim(WorkGroupID)#">
											Users						
										</a>
									</td>
								</tr>
							</table>
							
						</td>			
					</tr>
				</cfoutput>
				
			</cfloop>
			
		</table>
		<br><br>
	</cf_gcBorderedTable>
	
	

