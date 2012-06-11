

<cfcomponent>
	
	
	<cffunction name="wsAddRoute" access="remote" returnType="xml" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="User ID" required="true">
		<cfargument name="Data3" type="string" hint="RouteName" required="true">
		
		<cfset variables.ClientID = arguments.Data1>
		<cfset variables.userID = arguments.Data2>	
		<cfset variables.RouteName = arguments.Data3>	
		
		<cfset variables.RouteName = ReplaceNoCase(variables.RouteName, '%20', ' ', 'ALL')>	
		
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<!--------------------------------------------------------------------------------------->
			<!--- Check that the userID sent in belongs to the Client                             --->
			<!--------------------------------------------------------------------------------------->			
			<cfif NOT AuthenticateUserToClient(variables.ClientID, variables.UserID)>
				<cfinvoke component="com.common.toXML" method="stringToXML" data="<error>You cannot change values under this client. Please contact an administrator if you feel you are receiving this message in error.</error>" rootelement="ran" itemelement="change" returnvariable="xmlFalse">
				<cfreturn xmlFalse>				
			</cfif>
	
			<cfquery name="addRoute" datasource="PAClient_#clientID#">
				INSERT INTO route (UserID, Name)
				VALUES (
					<cfqueryparam value="#variables.userID#" cfsqltype="CF_SQL_INTEGER" />,
					<cfqueryparam value="#variables.RouteName#" cfsqltype="CF_SQL_VARCHAR" />
				)				
			</cfquery>	
													
			<cfreturn "<?xml version=""1.0"" encoding=""UTF-8""?><ran>true</ran>">		

								
			<cfcatch type="Any">			
				<cflog file="testing" text="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				<cfreturn "<?xml version=""1.0"" encoding=""UTF-8""?><ran><change><error>#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#</error></change></ran>">				
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
	
	
	
	
	<cffunction name="wsUpdateRoutePatient" access="remote" returnType="xml" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="User ID" required="true">
		<cfargument name="Data3" type="string" hint="RoutePatientID" required="true">
		<cfargument name="Data4" type="string" hint="Uupdate Col" required="true">
		<cfargument name="Data5" type="string" hint="New Value" required="true">
		
		<cfset variables.ClientID = arguments.Data1>
		<cfset variables.userID = arguments.Data2>	
		<cfset variables.RoutePatientID = arguments.Data3>	
		<cfset variables.updateColumn = arguments.Data4>		
		<cfset variables.SuppliesText = arguments.Data5>			
		
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<!--------------------------------------------------------------------------------------->
			<!--- Check that the userID sent in belongs to the Client                             --->
			<!--------------------------------------------------------------------------------------->			
			<cfif NOT AuthenticateUserToClient(variables.ClientID, variables.UserID)>
				<cfinvoke component="com.common.toXML" method="stringToXML" data="<error>You cannot change values under this client. Please contact an administrator if you feel you are receiving this message in error.</error>" rootelement="ran" itemelement="change" returnvariable="xmlFalse">
				<cfreturn xmlFalse>				
			</cfif>
	
			<cfquery name="updateRoutePatient" datasource="PAClient_#clientID#">
				UPDATE routepatient
				SET #variables.updateColumn# = <cfqueryparam value="#URLDecode(trim(variables.SuppliesText))#" cfsqltype="CF_SQL_VARCHAR" />
				WHERE RoutePatientID = #variables.RoutePatientID#
			</cfquery>	
													
			<cfreturn "<?xml version=""1.0"" encoding=""UTF-8""?><ran>true</ran>">		

								
			<cfcatch type="Any">			
				<cflog file="testing" text="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				<cfreturn "<?xml version=""1.0"" encoding=""UTF-8""?><ran><change><error>#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#</error></change></ran>">				
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 
	
	
	<cffunction name="wsAddRoutePatient" access="remote" returnType="xml" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="User ID" required="true">
		<cfargument name="Data3" type="string" hint="RouteID" required="true">
		<cfargument name="Data4" type="string" hint="PatientID" required="true">
		
		<cfset variables.ClientID = arguments.Data1>
		<cfset variables.userID = arguments.Data2>	
		<cfset variables.RouteID = arguments.Data3>	
		<cfset variables.PatientID = arguments.Data4>	
		
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<!--------------------------------------------------------------------------------------->
			<!--- Check that the userID sent in belongs to the Client                             --->
			<!--------------------------------------------------------------------------------------->			
			<cfif NOT AuthenticateUserToClient(variables.ClientID, variables.UserID)>
				<cfinvoke component="com.common.toXML" method="stringToXML" data="<error>You cannot change values under this client. Please contact an administrator if you feel you are receiving this message in error.</error>" rootelement="ran" itemelement="change" returnvariable="xmlFalse">
				<cfreturn xmlFalse>				
			</cfif>
	
			<cfquery name="updateRoutePatient" datasource="PAClient_#clientID#">
				INSERT INTO routePatient(RouteID, PatientID)
				VALUES(
					<cfqueryparam value="#variables.RouteID#" cfsqltype="CF_SQL_INT" />,
					<cfqueryparam value="#variables.PatientID#" cfsqltype="CF_SQL_INT" /> 					
				)
			</cfquery>	
													
			<cfreturn "<?xml version=""1.0"" encoding=""UTF-8""?><ran>true</ran>">		

								
			<cfcatch type="Any">			
				
				<cfreturn "<?xml version=""1.0"" encoding=""UTF-8""?><ran><change><error>#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#</error></change></ran>">				
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 
	
	
	<cffunction name="AuthenticateUserToClient" returnType="boolean" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="User ID" required="true">
		
		<cfset variables.ClientID = arguments.Data1>
		<cfset variables.userID = arguments.Data2>	
					
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<!--------------------------------------------------------------------------------------->
			<!--- Check that the userID sent in belongs to the Client                             --->
			<!--------------------------------------------------------------------------------------->			
			<cfset variables.Security = application.beanFactory.getBean('old_Security')>
			<cfset variables.Client = application.beanFactory.getBean('old_Client')>
			<cfif NOT variables.Security.AuthenticateUserToClient(variables.ClientID, variables.UserID, variables.Client)>
				<cfreturn false>				
			</cfif>
			
			<cfreturn true>
								
			<cfcatch type="Any">			
				
				<cfreturn false>				
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 
	

	
	<cffunction name="wsDeleteRoutePatient" access="remote" returnType="xml" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="User ID" required="true">
		<cfargument name="Data3" type="string" hint="RoutePatientID" required="true">
		
		<cfset variables.ClientID = arguments.Data1>
		<cfset variables.userID = arguments.Data2>	
		<cfset variables.RoutePatientID = arguments.Data3>			
		
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<!--------------------------------------------------------------------------------------->
			<!--- Check that the userID sent in belongs to the Client                             --->
			<!--------------------------------------------------------------------------------------->			
			<cfif NOT AuthenticateUserToClient(variables.ClientID, variables.UserID)>
				<cfinvoke component="com.common.toXML" method="stringToXML" data="<error>You cannot change values under this client. Please contact an administrator if you feel you are receiving this message in error.</error>" rootelement="ran" itemelement="change" returnvariable="xmlFalse">
				<cfreturn xmlFalse>				
			</cfif>
	
			<cfquery name="updateRoutePatient" datasource="PAClient_#clientID#">
				DELETE FROM routepatient
				WHERE RoutePatientID = #variables.RoutePatientID#
			</cfquery>	
													
			<cfreturn "<?xml version=""1.0"" encoding=""UTF-8""?><ran>true</ran>">		

								
			<cfcatch type="Any">			
				<cflog file="testing" text="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				<cfreturn "<?xml version=""1.0"" encoding=""UTF-8""?><ran><change><error>#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#</error></change></ran>">				
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
	<cffunction name="wsCheckRoutePatient" access="remote" returnType="xml" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="User ID" required="true">
		<cfargument name="Data3" type="string" hint="RoutePatientID" required="true">
		<cfargument name="Data4" type="string" hint="Checked" required="true">
		
		<cfset variables.ClientID = arguments.Data1>
		<cfset variables.userID = arguments.Data2>	
		<cfset variables.RoutePatientID = arguments.Data3>	
		<cfset variables.checked = arguments.Data4>		
		
		
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<!--------------------------------------------------------------------------------------->
			<!--- Check that the userID sent in belongs to the Client                             --->
			<!--------------------------------------------------------------------------------------->			
			<cfif NOT AuthenticateUserToClient(variables.ClientID, variables.UserID)>
				<cfinvoke component="com.common.toXML" method="stringToXML" data="<error>You cannot change values under this client. Please contact an administrator if you feel you are receiving this message in error.</error>" rootelement="ran" itemelement="change" returnvariable="xmlFalse">
				<cfreturn xmlFalse>				
			</cfif>
	
			<cfquery name="updateRoutePatient" datasource="PAClient_#clientID#">
				UPDATE routepatient
				SET Checked = <cfqueryparam value="#URLDecode(trim(variables.checked))#" cfsqltype="CF_SQL_VARCHAR" />
				WHERE RoutePatientID = #variables.RoutePatientID#
			</cfquery>	
													
			<cfreturn "<?xml version=""1.0"" encoding=""UTF-8""?><ran>true</ran>">		

								
			<cfcatch type="Any">
						
				<cflog file="testing" text="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				<cfreturn "<?xml version=""1.0"" encoding=""UTF-8""?><ran><change><error>#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#</error></change></ran>">				
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 
	
		
</cfcomponent>

	


