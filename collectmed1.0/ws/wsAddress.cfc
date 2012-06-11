

<cfcomponent>

	<!-------------------------------------------------------------------------------------->
	<!--- Update an Address                                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="wsAddressU" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client ID" required="true">
		<cfargument name="Data2" type="string" hint="Address DB ID" required="true">
		<cfargument name="Data3" type="string" hint="Address String" required="true">
		
		<cfset ClientID = arguments.Data1>
		<cfset AddressID = arguments.Data2>
		<cfset AddressString = arguments.Data3>
				
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfset AddressString = Replace(AddressString, "||", "|@@|", "ALL")>
						
			<cfset AddressTypeID = "">
			<cfset AddressLine1 = "">
			<cfset AddressLine2 = "">
			<cfset City = "">
			<cfset StateID = "">
			<cfset ZipCode = "">
			<cfset active = "">
			<cfset Attention = "">
			<cfset IsDefault = "">
			<cfset EntityID = "">
		
			<cfif AddressString NEQ "">		
				<cfif IsNumeric(ListGetAt(AddressString, 1, "|"))><cfset AddressTypeID = ListGetAt(AddressString, 1, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 2><cfset AddressLine1 = ListGetAt(AddressString, 2, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 3><cfset AddressLine2 = ListGetAt(AddressString, 3, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 4><cfset City = ListGetAt(AddressString, 4, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 5 AND IsNumeric(ListGetAt(AddressString, 5, "|"))>
					<cfset StateID = ListGetAt(AddressString, 5, "|")>				
				<cfelseif ListLen(AddressString, "|") GTE 5 AND ListGetAt(AddressString, 5, "|") NEQ "">	
					<cfset State = ListGetAt(AddressString, 5, "|")>
					<cfset request.ObjStandardListItem = CreateObject("component", "StandardListItemActive")>
					<cfset request.ObjStandardListItem.init(trim(request.masterdatasource))>			
					<cfset StateID = request.ObjStandardListItem.getStateByDescriptionORDisplay(clientID: trim(ClientID), description: trim(State), display: trim(State))>
				</cfif>	
				<cfif ListLen(AddressString, "|") GTE 6><cfset ZipCode = ListGetAt(AddressString, 6, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 7><cfset Active = ListGetAt(AddressString, 7, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 8><cfset Attention = ListGetAt(AddressString, 8, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 9><cfset IsDefault = ListGetAt(AddressString, 9, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 10><cfset EntityID = ListGetAt(AddressString, 10, "|")></cfif>				
			</cfif>			
						
			<cfset stAddress = structNew()>
			<cfset stAddress.AddressID = trim(AddressID)>
			<cfset stAddress.AddressTypeID = trim(AddressTypeID)>
			<cfset stAddress.Attention = trim(Attention)>
			<cfset stAddress.AddressLine1 = trim(AddressLine1)>
			<cfset stAddress.AddressLine2 = trim(AddressLine2)>
			<cfset stAddress.City = trim(City)>
			<cfset stAddress.StateID = trim(StateID)>
			<cfset stAddress.ZipCode = trim(ZipCode)>	
			<cfset request.Address = Createobject("component", "AddressActive")>
			<cfset request.Address.init('PAClient_#trim(ClientID)#', stAddress)>				
			<cfset request.Address.update(request.Address)>	
			
			
			<cfif trim(IsDefault) EQ 1>			
				<cfset request.EntityAddress = Createobject("component", "EntityAddressActive")>
				<cfset request.EntityAddress.init('PAClient_#trim(ClientID)#')>
				<cfset request.EntityAddress.setEntityAddressDefault(EntityID: trim(EntityID), AddressID: trim(request.Address.getAddressID()))>
			</cfif>
			
			<cfreturn true>			
								
								
			<cfcatch type="Any">
				
				<cfreturn false>				
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Create an Address                                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="wsAddressC" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client ID" required="true">
		<cfargument name="Data2" type="string" hint="Address DB ID" required="true">
		<cfargument name="Data3" type="string" hint="Address String" required="true">
		
		<cfset ClientID = arguments.Data1>
		<cfset AddressID = arguments.Data2>
		<cfset AddressString = arguments.Data3>
				
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfset AddressString = Replace(AddressString, "||", "|@@|", "ALL")>
						
			<cfset AddressTypeID = "">
			<cfset AddressLine1 = "">
			<cfset AddressLine2 = "">
			<cfset City = "">
			<cfset StateID = "">
			<cfset ZipCode = "">
			<cfset active = "">
			<cfset Attention = "">
			<cfset IsDefault = "">
			<cfset EntityID = "">
	
			<cfif AddressString NEQ "">		
				<cfif IsNumeric(ListGetAt(AddressString, 1, "|"))><cfset AddressTypeID = ListGetAt(AddressString, 1, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 2><cfset AddressLine1 = ListGetAt(AddressString, 2, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 3><cfset AddressLine2 = ListGetAt(AddressString, 3, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 4><cfset City = ListGetAt(AddressString, 4, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 5 AND IsNumeric(ListGetAt(AddressString, 5, "|"))>
					<cfset StateID = ListGetAt(AddressString, 5, "|")>				
				<cfelseif ListLen(AddressString, "|") GTE 5 AND ListGetAt(AddressString, 5, "|") NEQ "">	
					<cfset State = ListGetAt(AddressString, 5, "|")>
					<cfset request.ObjStandardListItem = CreateObject("component", "StandardListItemActive")>
					<cfset request.ObjStandardListItem.init(trim(request.masterdatasource))>			
					<cfset StateID = request.ObjStandardListItem.getStateByDescriptionORDisplay(clientID: trim(ClientID), description: trim(State), display: trim(State))>
				</cfif>	
				<cfif ListLen(AddressString, "|") GTE 6><cfset ZipCode = ListGetAt(AddressString, 6, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 7><cfset Active = ListGetAt(AddressString, 7, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 8><cfset Attention = ListGetAt(AddressString, 8, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 9><cfset IsDefault = ListGetAt(AddressString, 9, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 10><cfset EntityID = ListGetAt(AddressString, 10, "|")></cfif>
			</cfif>			
						
			<cfset stAddress = structNew()>
			<cfset stAddress.AddressID = trim(AddressID)>
			<cfset stAddress.AddressTypeID = trim(AddressTypeID)>
			<cfset stAddress.Attention = trim(Attention)>
			<cfset stAddress.AddressLine1 = trim(AddressLine1)>
			<cfset stAddress.AddressLine2 = trim(AddressLine2)>
			<cfset stAddress.City = trim(City)>
			<cfset stAddress.StateID = trim(StateID)>
			<cfset stAddress.ZipCode = trim(ZipCode)>					
			<cfset request.Address = Createobject("component", "AddressActive")>
			<cfset request.Address.init('PAClient_#trim(ClientID)#', stAddress)>				
			<cfset request.Address.Create(request.Address)>	
			
			<!-------------------------------------------------------------------------------------->
			<!--- Bind the Address to the Entity                                                 --->
			<!-------------------------------------------------------------------------------------->			
			<cfset stEntityAddress = structNew()>			
			<cfset stEntityAddress.EntityID = trim(EntityID)>		
			<cfset stEntityAddress.AddressID = trim(request.Address.getAddressID())>					
			<cfset request.EntityAddress = Createobject("component", "EntityAddressActive")>
			<cfset request.EntityAddress.init('PAClient_#trim(ClientID)#', stEntityAddress)>				
			<cfset request.EntityAddress.Create(request.EntityAddress)>				
			
			<cfif trim(IsDefault) EQ 1>
				<cfset request.EntityAddress.setEntityAddressDefault(EntityID: trim(EntityID), AddressID: trim(request.Address.getAddressID()))>
			</cfif>
			
			<cfreturn true>			
								
								
			<cfcatch type="Any">
				
				<cfreturn false>				
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>	 

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!------>
	
	
	
	
	
	
	
	
	

	<cffunction name="wsAddressUpdate" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client ID" required="true">
		<cfargument name="Data2" type="string" hint="Address DB ID" required="true">
		<cfargument name="Data3" type="string" hint="Address String" required="true">
		
		<cfset ClientID = Data1>
		<cfset AddressID = Data2>
		<cfset AddressString = Data3>
				
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfset AddressString = Replace(AddressString, "||", "|@@|", "ALL")>
						
			<cfset AddressTypeID = "">
			<cfset AddressLine1 = "">
			<cfset AddressLine2 = "">
			<cfset City = "">
			<cfset StateID = "">
			<cfset ZipCode = "">
			<cfset active = "">
			
			
			<cfif AddressString NEQ "">		
				<cfif IsNumeric(ListGetAt(AddressString, 1, "|"))><cfset AddressTypeID = ListGetAt(AddressString, 1, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 2><cfset AddressLine1 = ListGetAt(AddressString, 2, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 3><cfset AddressLine2 = ListGetAt(AddressString, 3, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 4><cfset City = ListGetAt(AddressString, 4, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 5 AND IsNumeric(ListGetAt(AddressString, 5, "|"))>
					<cfset StateID = ListGetAt(AddressString, 5, "|")>
				<cfelseif ListLen(AddressString, "|") GTE 5 AND ListGetAt(AddressString, 5, "|") NEQ "">	
					<cfset State = ListGetAt(AddressString, 5, "|")>
					<cfquery name="getState" datasource="pa_master">
						SELECT StandardListItemID
						FROM standardlistitem
						WHERE ItemDescription = '#trim(State)#' OR ItemNameDisplay = '#trim(State)#'
					</cfquery>
					<cfif getState.RecordCount EQ 1>
						<cfset StateID = getState.StandardListItemID>
					</cfif>
				</cfif>	
				<cfif ListLen(AddressString, "|") GTE 6><cfset ZipCode = ListGetAt(AddressString, 6, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 7><cfset Active = ListGetAt(AddressString, 7, "|")></cfif>
			</cfif>			
						
			<cfquery name="updateAddress" datasource="PAClient_#trim(ClientID)#">
				UPDATE address
				SET dateModified = now()
				<cfif IsNumeric(AddressTypeID)>, AddressTypeID = #trim(AddressTypeID)#</cfif> 
				<cfif trim(AddressLine1) NEQ "" AND trim(AddressLine1) NEQ "@@">, AddressLine1 = '#trim(AddressLine1)#'</cfif>
				<cfif trim(AddressLine2) NEQ "" AND trim(AddressLine2) NEQ "@@">, AddressLine2 = '#trim(AddressLine2)#'</cfif>
				<cfif trim(City) NEQ "" AND trim(City) NEQ "@@">, City = '#trim(City)#'</cfif>
				<cfif IsNumeric(trim(StateID))>, StateID = #trim(StateID)#</cfif>
				<cfif trim(ZipCode) NEQ "" AND trim(ZipCode) NEQ "@@">, ZipCode = '#trim(ZipCode)#'</cfif>				
				<cfif IsNumeric(Active)>, Active = #trim(Active)#</cfif>				
				WHERE AddressID = #trim(AddressID)#
			</cfquery>
			
			<cfreturn true>			
								
								
			<cfcatch type="Any">
				
				<cfreturn false>				
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 

	
	
	
	
	<cffunction name="wsAddressAdd" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client ID" required="true">
		<cfargument name="Data2" type="string" hint="EntityID" required="true">
		<cfargument name="Data3" type="string" hint="Address String" required="true">
		
		<cfset ClientID = Data1>
		<cfset EntityID = Data2>
		<cfset AddressString = Data3>
				
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfset AddressString = Replace(AddressString, "||", "|@@|", "ALL")>
						
			<cfset AddressTypeID = "">
			<cfset AddressLine1 = "">
			<cfset AddressLine2 = "">
			<cfset City = "">
			<cfset StateID = "">
			<cfset ZipCode = "">
			<cfset active = "">
			
			
			<cfif AddressString NEQ "">		
				<cfif IsNumeric(ListGetAt(AddressString, 1, "|"))><cfset AddressTypeID = ListGetAt(AddressString, 1, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 2><cfset AddressLine1 = ListGetAt(AddressString, 2, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 3><cfset AddressLine2 = ListGetAt(AddressString, 3, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 4><cfset City = ListGetAt(AddressString, 4, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 5 AND IsNumeric(ListGetAt(AddressString, 5, "|"))>
					<cfset StateID = ListGetAt(AddressString, 5, "|")>
				<cfelseif ListLen(AddressString, "|") GTE 5 AND ListGetAt(AddressString, 5, "|") NEQ "">	
					<cfset State = ListGetAt(AddressString, 5, "|")>
					<cfquery name="getState" datasource="pa_master">
						SELECT StandardListItemID
						FROM standardlistitem
						WHERE ItemDescription = '#trim(State)#' OR ItemNameDisplay = '#trim(State)#'
					</cfquery>
					<cfif getState.RecordCount EQ 1>
						<cfset StateID = getState.StandardListItemID>
					</cfif>
				</cfif>	
				<cfif ListLen(AddressString, "|") GTE 6><cfset ZipCode = ListGetAt(AddressString, 6, "|")></cfif>
				<cfif ListLen(AddressString, "|") GTE 7><cfset Active = ListGetAt(AddressString, 7, "|")></cfif>
			</cfif>			
						
			<cfquery name="addAddress" datasource="PAClient_#trim(ClientID)#">
				INSERT INTO Address(
				<cfif IsNumeric(AddressTypeID)>AddressTypeID</cfif> 
				<cfif trim(AddressLine1) NEQ "" AND trim(AddressLine1) NEQ "@@">, AddressLine1</cfif>
				<cfif trim(AddressLine2) NEQ "" AND trim(AddressLine2) NEQ "@@">, AddressLine2</cfif>
				<cfif trim(City) NEQ "" AND trim(City) NEQ "@@">, City</cfif>
				<cfif IsNumeric(trim(StateID))>, StateID</cfif>
				<cfif trim(ZipCode) NEQ "" AND trim(ZipCode) NEQ "@@">, ZipCode</cfif>				
				<cfif IsNumeric(Active)>, Active</cfif>
				)	
				VALUES(
				<cfif IsNumeric(AddressTypeID)>#trim(AddressTypeID)#</cfif> 
				<cfif trim(AddressLine1) NEQ "" AND trim(AddressLine1) NEQ "@@">, '#trim(AddressLine1)#'</cfif>
				<cfif trim(AddressLine2) NEQ "" AND trim(AddressLine2) NEQ "@@">, '#trim(AddressLine2)#'</cfif>
				<cfif trim(City) NEQ "" AND trim(City) NEQ "@@">, '#trim(City)#'</cfif>
				<cfif IsNumeric(trim(StateID))>, #trim(StateID)#</cfif>
				<cfif trim(ZipCode) NEQ "" AND trim(ZipCode) NEQ "@@">, '#trim(ZipCode)#'</cfif>				
				<cfif IsNumeric(Active)>, #trim(Active)#</cfif>	
				);
				SELECT LAST_INSERT_ID() AS addressID 					
			</cfquery>
			
			
			<cfquery name="bindAddress" datasource="PAClient_#trim(ClientID)#">
				INSERT INTO EntityAddress(AddressID, EntityID)	
				VALUES(#trim(addAddress.addressID)#, #trim(EntityID)#)						
			</cfquery>
			
			
			<cfreturn trim(addAddress.addressID)>			
								
								
			<cfcatch type="Any">
				
				<cfreturn false>				
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
	
</cfcomponent>

	

