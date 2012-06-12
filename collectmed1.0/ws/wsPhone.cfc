

<cfcomponent>

	<!-------------------------------------------------------------------------------------->
	<!--- Update an Phone                                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="wsPhoneU" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client ID" required="true">
		<cfargument name="Data2" type="string" hint="Phone DB ID" required="true">
		<cfargument name="Data3" type="string" hint="Phone String" required="true">
		
		<cfset ClientID = arguments.Data1>
		<cfset PhoneID = arguments.Data2>
		<cfset PhoneString = arguments.Data3>
				
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfset PhoneString = Replace(PhoneString, "||", "|@@|", "ALL")>
						
			<cfset PhoneTypeID = "">
			<cfset PhoneNumber = "">
			<cfset PhoneExtension = "">
			<cfset active = "">
			<cfset IsDefault = "">
			<cfset EntityID = "">
		
			<cfif PhoneString NEQ "">		
				<cfif IsNumeric(ListGetAt(PhoneString, 1, "|"))><cfset PhoneTypeID = ListGetAt(PhoneString, 1, "|")></cfif>
				<cfif ListLen(PhoneString, "|") GTE 2><cfset PhoneNumber = ListGetAt(PhoneString, 2, "|")></cfif>
				<cfif ListLen(PhoneString, "|") GTE 3><cfset PhoneExtension = ListGetAt(PhoneString, 3, "|")></cfif>
				<cfif ListLen(PhoneString, "|") GTE 4><cfset Active = ListGetAt(PhoneString, 4, "|")></cfif>
				<cfif ListLen(PhoneString, "|") GTE 5><cfset IsDefault = ListGetAt(PhoneString, 5, "|")></cfif>
				<cfif ListLen(PhoneString, "|") GTE 6><cfset EntityID = ListGetAt(PhoneString, 6, "|")></cfif>				
			</cfif>			
			
			<cfset PhoneNumber = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(PhoneNumber))>
			<cfset PhoneExtension = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(PhoneExtension))>
										
			<cfset stPhone = structNew()>
			<cfset stPhone.PhoneID = trim(PhoneID)>
			<cfset stPhone.PhoneTypeID = trim(PhoneTypeID)>
			<cfset stPhone.PhoneNumber = trim(PhoneNumber)>
			<cfset stPhone.PhoneExtension = trim(PhoneExtension)>
			<cfset request.Phone = Createobject("component", "PhoneActive")>
			<cfset request.Phone.init('PAClient_#trim(ClientID)#', stPhone)>				
			<cfset request.Phone.update(request.Phone)>	
			
			
			<cfif trim(IsDefault) EQ 1>			
				<cfset request.EntityPhone = Createobject("component", "EntityPhoneActive")>
				<cfset request.EntityPhone.init('PAClient_#trim(ClientID)#')>
				<cfset request.EntityPhone.setEntityPhoneDefault(EntityID: trim(EntityID), PhoneID: trim(request.Phone.getPhoneID()))>
			</cfif>
			
			<cfreturn true>			
								
								
			<cfcatch type="Any">
				
				<cfreturn false>				
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Create an Phone                                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="wsPhoneC" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client ID" required="true">
		<cfargument name="Data2" type="string" hint="Phone DB ID" required="true">
		<cfargument name="Data3" type="string" hint="Phone String" required="true">
		
		<cfset ClientID = arguments.Data1>
		<cfset PhoneID = arguments.Data2>
		<cfset PhoneString = arguments.Data3>
				
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfset PhoneString = Replace(PhoneString, "||", "|@@|", "ALL")>
						
			<cfset PhoneTypeID = "">
			<cfset PhoneNumber = "">
			<cfset PhoneExtension = "">
			<cfset active = "">
			<cfset IsDefault = "">
			<cfset EntityID = "">
	
			<cfif PhoneString NEQ "">		
				<cfif IsNumeric(ListGetAt(PhoneString, 1, "|"))><cfset PhoneTypeID = ListGetAt(PhoneString, 1, "|")></cfif>
				<cfif ListLen(PhoneString, "|") GTE 2><cfset PhoneNumber = ListGetAt(PhoneString, 2, "|")></cfif>
				<cfif ListLen(PhoneString, "|") GTE 3><cfset PhoneExtension = ListGetAt(PhoneString, 3, "|")></cfif>
				<cfif ListLen(PhoneString, "|") GTE 4><cfset Active = ListGetAt(PhoneString, 4, "|")></cfif>
				<cfif ListLen(PhoneString, "|") GTE 5><cfset IsDefault = ListGetAt(PhoneString, 5, "|")></cfif>
				<cfif ListLen(PhoneString, "|") GTE 6><cfset EntityID = ListGetAt(PhoneString, 6, "|")></cfif>
			</cfif>		
			
			<cfset PhoneNumber = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(PhoneNumber))>
			<cfset PhoneExtension = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(PhoneExtension))>
										
			<cfset stPhone = structNew()>
			<cfset stPhone.PhoneID = trim(PhoneID)>
			<cfset stPhone.PhoneTypeID = trim(PhoneTypeID)>
			<cfset stPhone.PhoneNumber = trim(PhoneNumber)>
			<cfset stPhone.PhoneExtension = trim(PhoneExtension)>						
			<cfset request.Phone = Createobject("component", "PhoneActive")>
			<cfset request.Phone.init('PAClient_#trim(ClientID)#', stPhone)>				
			<cfset request.Phone.Create(request.Phone)>	
			
			<!-------------------------------------------------------------------------------------->
			<!--- Bind the Phone to the Entity                                                 --->
			<!-------------------------------------------------------------------------------------->			
			<cfset stEntityPhone = structNew()>			
			<cfset stEntityPhone.EntityID = trim(EntityID)>		
			<cfset stEntityPhone.PhoneID = trim(request.Phone.getPhoneID())>					
			<cfset request.EntityPhone = Createobject("component", "EntityPhoneActive")>
			<cfset request.EntityPhone.init('PAClient_#trim(ClientID)#', stEntityPhone)>				
			<cfset request.EntityPhone.Create(request.EntityPhone)>				
			
			<cfif trim(IsDefault) EQ 1>
				<cfset request.EntityPhone.setEntityPhoneDefault(EntityID: trim(EntityID), PhoneID: trim(request.Phone.getPhoneID()))>
			</cfif>
			
			<cfreturn true>			
								
								
			<cfcatch type="Any">
				
				<cfreturn false>				
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>	














<!------>











	<cffunction name="wsPhoneUpdate" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client ID" required="true">
		<cfargument name="Data2" type="string" hint="Phone DB ID" required="true">
		<cfargument name="Data3" type="string" hint="Phone String" required="true">
		
		<cfset ClientID = Data1>
		<cfset PhoneID = Data2>
		<cfset PhoneString = Data3>
				
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfset PhoneString = Replace(PhoneString, "||", "|@@|", "ALL")>
						
			<cfset PhoneTypeID = "">
			<cfset PhoneNumber = "">
			
			
			<cfif PhoneString NEQ "">		
				<cfif IsNumeric(ListGetAt(PhoneString, 1, "|"))><cfset PhoneTypeID = ListGetAt(PhoneString, 1, "|")></cfif>
				<cfif ListLen(PhoneString, "|") GTE 2>
					<cfset PhoneNumber = request.cleanNumericString(ListGetAt(PhoneString, 2, "|"))>
					<cfset PhoneNumber = REQUEST.StringGlobalFooterE(PhoneNumber)>
				</cfif>				
			</cfif>			
						
			<cfquery name="updatePhone" datasource="PAClient_#trim(ClientID)#">
				UPDATE phone
				SET dateModified = now()
				<cfif IsNumeric(PhoneTypeID)>, PhoneTypeID = #trim(PhoneTypeID)#</cfif> 
				<cfif trim(PhoneNumber) NEQ "" AND trim(PhoneNumber) NEQ "@@">, PhoneNumber = '#trim(PhoneNumber)#'</cfif>						
				WHERE PhoneID = #trim(PhoneID)#
			</cfquery>
			
			<cfreturn true>			
								
								
			<cfcatch type="Any">
				
				<cfreturn false>				
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 

	
	
	
	
	<cffunction name="wsPhoneAdd" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client ID" required="true">
		<cfargument name="Data2" type="string" hint="EntityID" required="true">
		<cfargument name="Data3" type="string" hint="Phone String" required="true">
		
		<cfset ClientID = Data1>
		<cfset EntityID = Data2>
		<cfset PhoneString = Data3>
				
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfset PhoneString = Replace(PhoneString, "||", "|@@|", "ALL")>
						
			<cfset PhoneTypeID = "">
			<cfset PhoneNumber = "">			
			
			<cfif PhoneString NEQ "">		
				<cfif IsNumeric(ListGetAt(PhoneString, 1, "|"))><cfset PhoneTypeID = ListGetAt(PhoneString, 1, "|")></cfif>
				<cfset PhoneNumber = request.cleanNumericString(ListGetAt(PhoneString, 2, "|"))>
				<cfset PhoneNumber = REQUEST.StringGlobalFooterE(PhoneNumber)>		
			</cfif>			
						
			<cfquery name="addPhone" datasource="PAClient_#trim(ClientID)#">
				INSERT INTO phone(
				<cfif IsNumeric(PhoneTypeID)>PhoneTypeID</cfif> 
				<cfif trim(PhoneNumber) NEQ "" AND trim(PhoneNumber) NEQ "@@">, PhoneNumber</cfif>				
				)	
				VALUES(
				<cfif IsNumeric(PhoneTypeID)>#trim(PhoneTypeID)#</cfif> 
				<cfif trim(PhoneNumber) NEQ "" AND trim(PhoneNumber) NEQ "@@">, '#trim(PhoneNumber)#'</cfif>				
				);	
				SELECT LAST_INSERT_ID() AS PhoneID 					
			</cfquery>			
			
			<cfquery name="bindPhone" datasource="PAClient_#trim(ClientID)#">
				INSERT INTO entityphone(PhoneID, EntityID)	
				VALUES(#trim(addPhone.PhoneID)#, #trim(EntityID)#)						
			</cfquery>			
			
			<cfreturn trim(addPhone.PhoneID)>			
								
								
			<cfcatch type="Any">
				
				<cfreturn false>				
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
	
</cfcomponent>

	
