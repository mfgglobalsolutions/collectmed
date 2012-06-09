

<cfcomponent>

	<cfset variables.objToXML = application.beanFactory.getBean("old_toXML") />
	
	<cffunction name="wsGetEntityAddPhoXML" access="remote" returnType="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="An ID" required="true">
				
		<cfset ClientID = Data1>
		<cfset EntityID = Data2>
		
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
<cfdump var="IN Entity 22" output="console">						
			<!-------------------------------------------------------------------------------------->
			<!--- Call the get Addresses                                                         --->
			<!-------------------------------------------------------------------------------------->
			<cfset local.Addresses = wsGetEntityAddressesXML(trim(ClientID), trim(EntityID), "false")>	
<cfdump var="#local.Addresses#" output="console">	
			<!-------------------------------------------------------------------------------------->
			<!--- Call the get Phones                                                            --->
			<!-------------------------------------------------------------------------------------->
			<cfset local.Phones = wsGetEntityPhonesXML(trim(ClientID), trim(EntityID), "false")>
<cfdump var="#local.Phones#" output="console">										
			<!-------------------------------------------------------------------------------------->
			<!--- Combine the two Phones and Addresses.                                          --->
			<!-------------------------------------------------------------------------------------->				
			<cfset local.xmlAddressesPhones = variables.objToXML.stringToXML(
																	data: "#local.Addresses##local.Phones#",
																	rootelement: "ENTITY",
																	itemelement: "ADDRESSESPHONES"
																) />	
<cfdump var="#local.xmlAddressesPhones#" output="console">																										
			<cfif local.xmlAddressesPhones NEQ "">				
				<cfreturn local.xmlAddressesPhones>
			<cfelse>
				<cfreturn false>	
			</cfif>
			
								
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	


	<cffunction name="wsGetEntityAddressesXML" access="remote" returnType="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="An ID" required="true">
		<cfargument name="Data3" type="string" hint="Include XML Header" required="false" default="true">
		
		<cfset ClientID = Data1>
		<cfset EntityID = Data2>
		<cfset IncludeHeader = Data3>
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
							
			<!--- <cfset local.Entity = CreateObject("component", "com.common.Entity")> --->
			<cfset local.Entity = application.beanFactory.getBean("Entity")>	
			<cfset local.qAddresses = local.Entity.getEntityAddresses(
																		clientID: "#trim(ClientID)#",
																		entityid: "#trim(entityID)#"
																	  ) />
				
			<cfset local.xmlAddresses = variables.objToXML.queryToXML(
																		data: "#local.qAddresses#",
																		rootelement: "ADDRESSES",
																		itemelement: "ADDRESS",
																		includeheader: "#trim(IncludeHeader)#"	
																	 ) />
										
			<cfif local.xmlAddresses NEQ "">				
				<cfreturn local.xmlAddresses>
			<cfelse>
				<cfreturn false>	
			</cfif>
			
								
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>



	<cffunction name="wsGetEntityPhonesXML" access="remote" returnType="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="An ID" required="true">
		<cfargument name="Data3" type="string" hint="Include XML Header" required="false" default="true">
		
		<cfset ClientID = Data1>
		<cfset EntityID = Data2>
		<cfset IncludeHeader = Data3>
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
							
			<cfset local.Entity = application.beanFactory.getBean("Entity")>
			<cfset local.qPhones = local.Entity.getEntityPhones(
																	clientID: "#trim(ClientID)#",
																	entityid: "#trim(entityID)#"			
																)>
			
			<cfset ds = "PAClient_" & trim(ClientID)> 	
				
			<cfset count = 1>
			<cfloop query="local.qPhones">
				<cfset temp = QuerySetCell(local.qPhones, "PhoneExtension", "#REQUEST.cleanAlphaNumeric(REQUEST.StringGlobalFooterD(PhoneExtension, ds))#", count)>
				<cfset temp = QuerySetCell(local.qPhones, "PhoneNumber", "#REQUEST.cleanAlphaNumeric(REQUEST.StringGlobalFooterD(PhoneNumber, ds))#", count)>
				<cfset count = count + 1>
			</cfloop>	
	
			<cfset local.xmlPhones = variables.objToXML.queryToXML(
																		data: "#local.qPhones#",
																		rootelement: "PHONES",
																		itemelement: "PHONE",
																		includeheader: "#trim(IncludeHeader)#"	
																	 ) />
										
			<cfif local.xmlPhones NEQ "">				
				<cfreturn local.xmlPhones>
			<cfelse>
				<cfreturn false>	
			</cfif>
			
								
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>



	<cffunction name="wsGetEntityAddressPhoneString" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="An ID" required="true">
		
		<cfset ClientID = Data1>
		<cfset EntityID = Data2>
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
							
			<cfset local.Entity = application.beanFactory.getBean("Entity")>
			<cfset local.str = local.Entity.getEntityAddressPhoneString(
																			clientID: "#trim(ClientID)#",
																			entityid: "#trim(entityID)#"			
																		)>			
									
			<cfif local.str NEQ "">				
				<cfreturn local.str>
			<cfelse>
				<cfreturn false>	
			</cfif>
			
								
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 

	
	
	<cffunction name="wsGetEntityWithRoleXML" access="remote" returnType="xml" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="User ID" required="true">
		<cfargument name="Data3" type="string" hint="Roles" required="false" default="1,2,3,5,6,8"><!---Managers--->
		
		<cfscript>
			var ClientID = arguments.Data1;
			var UserID = arguments.Data2;
			var Roles = arguments.Data3;	
			var UserIDs = "";		
		</cfscript>
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>

			<cfinvoke component="com.common.role" method="getUsersWithSpecificRole" clientID="#trim(clientID)#" roleID="#trim(Roles)#" returnvariable="UserIDs">
			
			<cfif UserIDs NEQ "">				
				<cfquery name="temp" datasource="PAClient_#trim(ClientID)#">
					SELECT entityID, fname, lname 
					FROM Entity 
					WHERE EntityID IN ( SELECT EntityID FROM pa_master.Users WHERE usersID IN(#trim(UserIDs)#) )					
				</cfquery>						
			</cfif>
			
			<cfif NOT IsQuery(temp)>
				<cfset temp = querynew("entityid,fname,lname")>
			</cfif>
			
			<cfinvoke component="com.common.toXML" method="queryToXML" data="#temp#" rootelement="ENTITIES" itemelement="ENTITY" returnvariable="xmlEntities">
																		
			<cfif xmlEntities NEQ "">				
				<cfreturn xmlEntities>
			<cfelse>
				<cfreturn false>	
			</cfif>
			
								
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
	
	
	<cffunction name="wsBooleanEntityPass" access="remote" returnType="xml" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="User ID" required="true">
		<cfargument name="Data3" type="string" hint="Pass" required="true">
		<cfargument name="Data4" type="string" hint="Roles" required="false" default="1,2,3,5,6,8"><!---Managers--->
		
		<cfscript>
			var ClientID = arguments.Data1;
			var UserID = arguments.Data2;
			var managerPassword = arguments.Data3;
			var Roles = arguments.Data4;	
			var UserIDs = "";		
		</cfscript>
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>

			<cfinvoke component="com.common.role" method="getUsersWithSpecificRole" clientID="#trim(clientID)#" roleID="#trim(Roles)#" returnvariable="UserIDs">
			<cfset managerPasswordE = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(managerPassword))>
				
			<cfset tempBool = false>
			
			<cfif UserIDs NEQ "">				
				
				<cfquery name="temp" datasource="pa_master">
					SELECT EntityID 
					FROM Users 
					WHERE usersID IN(#trim(UserIDs)#) 
					AND EntryPoint = '#trim(managerPasswordE)#'					
				</cfquery>	
				
				<cfif temp.recordCount gte 1>
					<cfset tempBool = true>
				</cfif>
				
			</cfif>		
			
			<cfinvoke component="com.common.toXML" method="stringToXML" data="<BOOL>#tempBool#</BOOL>" rootelement="MANAGERPASS" itemelement="BOOLEANPASS" returnvariable="xmlVerification">
														
			<cfif isXML(xmlVerification)>	
				<cfreturn xmlVerification>
			<cfelse>
				<cfreturn false>	
			</cfif>
			
								
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
		
	
		
</cfcomponent>

	