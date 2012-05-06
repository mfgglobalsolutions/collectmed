


<cfcomponent extends="cmComponents.com.common.db.AddressIO">		
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get address by addressID.                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getAddress">		
		
		<cfargument name="addressID" required="yes" type="string">
											
		<cftry>			
			
			<cfquery name="getAddress" datasource="#trim(request.datasource)#">
				SELECT a.AddressID, a.AddressTypeID, a.AddressLine1, a.AddressLine2, a.City, a.StateID, a.ZipCode, s.ItemNameDisplay AS State
				FROM Address a LEFT OUTER JOIN pa_master.StandardListItem s ON a.StateID = s.StandardListItemID
				WHERE a.AddressID = #trim(addressID)#					
			</cfquery>
			
			<cfif getAddress.RecordCount EQ 1>
				<cfreturn "#trim(getAddress.AddressID)#|#trim(getAddress.AddressTypeID)#|#trim(getAddress.AddressLine1)#|#trim(getAddress.AddressLine2)#|#trim(getAddress.City)#|#trim(getAddress.StateID)#|#trim(getAddress.ZipCode)#|#trim(getAddress.State)#">
			<cfelse>
				<cfreturn "ERROR: Address not found">	
			</cfif>
			
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get addresses by addressID.                    --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getAddresses">		
		
		<cfargument name="addressIDs" required="yes" type="string">
											
		<cftry>			
			
			<cfquery name="getAddresses" datasource="#trim(request.datasource)#">
				SELECT AddressID,SiteID,AddressTypeID,AddressLine1,AddressLine2,City,StateID,ZipCode,CountryID,Active,DateCreated
				FROM Address 
				WHERE AddressID IN(#trim(addressIDs)#)					
			</cfquery>
			
			<cfreturn getAddresses>			
			
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to delete an address from the db.                 --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="deleteAddress">		
		
		<cfargument name="AddressID" required="yes" type="numeric">
							
		<cftry>			
			
			<cfquery name="deleteEntityAddress" datasource="#trim(request.datasource)#">
				DELETE FROM EntityAddress 
				WHERE AddressID = #trim(AddressID)#	
			</cfquery>	
					
			<cfquery name="deleteAddress" datasource="#trim(request.datasource)#">
				DELETE FROM Address 
				WHERE AddressID = #trim(AddressID)#	
			</cfquery>				
			
						
					
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
		
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to ARCHIVE an address from the db.                --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="archiveAddress">		
		
		<cfargument name="AddressID" required="yes" type="numeric">
							
		<cftry>
			
						
			<cfquery name="archiveEntityAddress" datasource="#trim(request.datasource)#">
				UPDATE EntityAddress 
				SET Active = 0, InactiveCode = 68
				WHERE AddressID = #trim(AddressID)#	
			</cfquery>	
					
			<cfquery name="archiveAddress" datasource="#trim(request.datasource)#">
				UPDATE Address 
				SET Active = 0, InactiveCode = 68
				WHERE AddressID = #trim(AddressID)#	
			</cfquery>
			
								
					
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to bind a phone to an entity.                     --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="bindAddress">		
		
		<cfargument name="EntityID" required="yes" type="numeric">
		<cfargument name="AddressID" required="yes" type="numeric">
							
		<cftry>			
			
			<cfquery name="insertEntityAddress" datasource="#trim(request.datasource)#">
				INSERT INTO EntityAddress  (EntityID, AddressID)
				VALUES(#trim(EntityID)#, #trim(AddressID)#)					
			</cfquery>
						
					
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
	
		
				
</cfcomponent>

	
