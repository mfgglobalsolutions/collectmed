

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.title" default="">
	<cfset title = attributes.title>
	
	<cfparam name="attributes.checkRoleIDs" default="">
	<cfset checkRoleIDs = attributes.checkRoleIDs>



<!-------------------------------------------------------------------------------------->
<!--- Get all the Roles available for this site.                                     --->
<!-------------------------------------------------------------------------------------->			
	<cfset request.Role = CreateObject("component","com.common.Role")>	
	<cfset getRoles = request.Role.getRoles(clientID: trim(session.clientID))>

	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		<table>
			<tr>
				<cfif title NEQ "">
					<td align="right">		
						<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
							#trim(title)#				
						</font>		
					</td>
				</cfif>
				<td nowrap>
					<!---<cfloop query="getRoles">				
						<input type="Checkbox" name="RolesToAssociate" value="#RoleID#" <cfif ListFind(checkRoleIDs, RoleID) GT 0>checked</cfif>> 
						<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
							#RoleName#<cfif Active NEQ 1><font face="#request.Site.getFont#" size="1" color="red"> (currently not active)</font></cfif><br>								
						</font>	
					</cfloop>--->
					
					<cfset currentHeader = "no show">
					<cfloop query="getRoles">
						<cfif currentHeader NEQ Editable>
							<cfset currentHeader = "#Editable#">
							<cfif currentHeader EQ 0>
								<span style="background-color: c0c0c0;"><strong><li>Application Roles</li></strong></span><br>
							<cfelseif currentHeader EQ 1>
								<span style="background-color: c0c0c0;"><strong><li>Custom Roles</li></strong></span><br>	
							</cfif>
						</cfif>	
						<input type="Checkbox" name="RolesToAssociate" value="#RoleID#" <cfif ListFind(checkRoleIDs, RoleID) GT 0>checked</cfif>> 
						<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
							#RoleName#<cfif Active NEQ 1><font face="#request.Site.getFont#" size="1" color="red"> (currently not active)</font></cfif><br>								
						</font>	
					</cfloop>
					
				</td>
			</tr>
		</table>
	</cfoutput>
	
	