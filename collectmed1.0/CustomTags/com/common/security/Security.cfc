
<cfcomponent name="Security">

	
	<cffunction name="AuthenticateUserToClient" access="public" returntype="boolean" output="No" hint="This function will authenticate a user to a client.">
  	
		<!------------------------------------------------------------------>
		<!--- Arguments needed for this method.                          --->
		<!------------------------------------------------------------------>	
		<cfargument name="clientID" required="true" type="string">
		<cfargument name="userID" required="true" type="string">
		<cfargument name="Client" required="true" type="any">	
			
		<cfset variables.ClientUsers = arguments.Client.getClientUsers(arguments.clientID)>

		<cfquery name="getThisID" dbtype="query">
			SELECT usersID
			FROM variables.ClientUsers
			WHERE usersID = #arguments.userID#
		</cfquery>
											
		<!------------------------------------------------------------------>
		<!--- Return.                                                    --->
		<!------------------------------------------------------------------>
		<cfif getThisID.recordCount GTE 1>
			<cfreturn true>
		<cfelse>
			<cfreturn false>	
		</cfif>	
	
	</cffunction>	
		

</cfcomponent>

	