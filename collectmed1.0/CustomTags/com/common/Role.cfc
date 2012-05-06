


<cfcomponent name="Role" extends="com.common.db.UsersRoleIO">		
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Get users with a specific role from a client.                                  --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getUsersWithSpecificRole" hint="Get users with a specific role from a client.">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="roleID" required="yes" type="string">
		
		<!---<cfquery name="getUsers" datasource="PAClient_#trim(ClientID)#">
			SELECT usersID
			FROM usersRole
			WHERE RoleID IN(#trim(roleID)#)			
		</cfquery>--->
		<cfquery name="getUsers" datasource="PAClient_#trim(ClientID)#">			
			SELECT usersID
			FROM pa_master.[usersRole]
			WHERE RoleID IN(#trim(roleID)#)	
			UNION
			SELECT usersID
			FROM usersRole
			WHERE RoleID IN(#trim(roleID)#)					
		</cfquery>
				
		<cf_gcListRemoveDuplicates 
			list="#valuelist(getUsers.usersID)#"
			name="usersIDs">
		
		<cfif getUsers.RecordCount GTE 1>
			<cfreturn trim(usersIDs)>
		<cfelse>
			<cfreturn 0>	
		</cfif>		
													
	</cffunction>	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Get users with a specific role from a client.                                  --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getRoles" returntype="Query" hint="Get all available roles from a client.">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="groupByEditable" required="no" type="boolean" default="no">
		
		<cftry>	
				
			<cfset getAllRoles = getRolesQuery(clientID: trim(ClientID))>
						
			<cfif groupByEditable NEQ "">
				<cfquery name="getAllRoles" dbtype="query">
					SELECT Editable, RoleID, RoleName, Active, InactiveCode, DateCreated, DateModified
					FROM getAllRoles		
					Group By Editable, RoleID, RoleName, Active, InactiveCode, DateCreated, DateModified
				</cfquery>				
			</cfif>			
			
			<cfreturn getAllRoles>
			
			<cfcatch type="Any">				
				
				<cf_gcGatewayLogger			
					datasource="PAClient_#trim(ClientID)#"
					code="115"
					logtext="<p>Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p>">	
					
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">			
					
			</cfcatch>
			
		</cftry>
																
	</cffunction>	
	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Get users with a specific role from a client.                                  --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getRolesQuery" returntype="Query" hint="Get all available roles from a client.">		
		
		<cfargument name="clientID" required="yes" type="numeric">
				
		<cftry>	
				
			<cfquery name="getAllRoles" datasource="PAClient_#trim(ClientID)#">
				SELECT RoleID, RoleName, Active, InactiveCode, DateCreated, DateModified, 0 as Editable
				FROM pa_master.[Role]
				UNION
				SELECT RoleID, RoleName, Active, InactiveCode, DateCreated, DateModified, 1 as Editable
				FROM Role					
			</cfquery>				
			
			<cfreturn getAllRoles>
			
			<cfcatch type="Any">				
				
				<cf_gcGatewayLogger			
					datasource="PAClient_#trim(ClientID)#"
					code="115"
					logtext="<p>Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p>">	
					
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">			
					
			</cfcatch>
			
		</cftry>
																
	</cffunction>	
	
	
</cfcomponent>


