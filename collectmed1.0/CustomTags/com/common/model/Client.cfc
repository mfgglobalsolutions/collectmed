


<cfcomponent name="Client">		
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will get the clients.                                            --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getClientIDs" returntype="string">		
		
		<cfset var clientIDs = "">
		<cfset var getClientIDs = "">
						
		<cfquery name="getClientIDs" datasource="pa_master">
			SELECT ClientID FROM Client
		</cfquery>
		
		<cfset clientIDs = valuelist(getClientIDs.ClientID)>
		
		<cfreturn clientIDs>
		
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will get the clients available users.                            --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getClientUsers" returntype="query">		
		
		<!------------------------------------------------------------------>
		<!--- Arguments needed for this method.                          --->
		<!------------------------------------------------------------------>	
		<cfargument name="clientID" required="true" type="numeric">
						
		<cfquery name="getClientUsers" datasource="pa_master">
			SELECT UsersID 
			FROM Users
			WHERE ClientID = #arguments.clientID#
		</cfquery>		
				
		<cfreturn getClientUsers>
		
	</cffunction>
	
		
</cfcomponent>

	
