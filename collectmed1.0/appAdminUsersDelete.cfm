<!---- appAdminUsersDelete.cfm ---->




<!-------------------------------------------------------------------------------------->
<!--- First set the user record to inactive.                                         --->
<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("url.action") AND url.action EQ "suspend">
	
		<cfquery name="suspendUser" datasource="PA_Master">
			UPDATE Users 
			SET Suspend = 1
			WHERE EntityID = #trim(url.EntityID)#
		</cfquery>	
	
	<cfelseif IsDefined("url.action") AND url.action EQ "reinstate">
	
		<cfquery name="suspendUser" datasource="PA_Master">
			UPDATE Users 
			SET Suspend = 0
			WHERE EntityID = #trim(url.EntityID)#
		</cfquery>	
	
	<cfelse>
		
		<cfquery name="deleteUser" datasource="PA_Master">
			UPDATE Users 
			SET Active = 0, InactiveCode = 68
			WHERE EntityID = #trim(url.EntityID)#
		</cfquery>
	
	</cfif>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Locate back to the users screen.                                               --->
<!-------------------------------------------------------------------------------------->	
	<cflocation addtoken="No" url="appAdminUsers.cfm">	
