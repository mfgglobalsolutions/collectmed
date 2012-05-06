

<cfcomponent>

	<cffunction name="wsCheckUserIDValid" access="remote" returntype="string" output="no">
		
		<cfargument name="UserID" type="string" hint="User ID" required="true">
		
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<!--------------------------------------------------------------------------------------->
		<!--- Looking for a numeric ID and the value sent in is not numeric just send back a  --->
		<!--- false.                                                                          --->
		<!--------------------------------------------------------------------------------------->				
		<cfif NOT IsNUmeric(UserID)>
									
			<cfreturn false>	
		
		</cfif>
		
		<!-------------------------------------------------------------------------------------->
		<!--- Run a cftry in case the query fails.                                           --->
		<!-------------------------------------------------------------------------------------->			
		<cftry>			
					
			<cfquery name="getUsersRecord" datasource="#trim(request.datasource)#">
				SELECT UsersID 
				FROM users
				WHERE usersid  = #trim(userID)#
			</cfquery>
									
			<cfif getUsersRecord.recordcount EQ 1>
				<cfreturn true>
			<cfelse>
				<cfreturn false>	
			</cfif>
								
			<cfcatch type="Any">
						
				<cf_gcGeneralErrorTemplate message="#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 
	
	
	
	
	
	<cffunction name="wsUserCurrentLoginModifiedTime" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client ID" required="true">
		<cfargument name="Data2" type="string" hint="Users ID" required="true">
		
		<cfset clientID = Data1>		
		<cfset usersID = Data2>	
				
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
							
			<cfset request.datasource = "PAClient_" & clientID>				
			<cfset request.User = createObject("component", "com.common.User")>
			<cfset thisDate = request.User.getUserCurrentLoginModifiedTime(usersID)>
			<cfreturn "#dateFormat(thisDate, 'mm/dd/yyyy')# #timeFormat(thisDate, 'hh:mm:ss tt')#">		
					
			<cfcatch type="Any">				
			
				<cf_gcGatewayLogger			
					datasource="#trim(request.datasource)#"
					code="115"
					logtext="<p>Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p>">	
					
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">			
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>	

</cfcomponent>

	