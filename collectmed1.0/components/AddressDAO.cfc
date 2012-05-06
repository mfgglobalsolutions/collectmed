 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="AddressBean" />
		
		<cfset var qCreateAddress = "" />		
		
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localAddressTypeID = arguments.bean.getAddressTypeID() />
		<cfset var localAttention = arguments.bean.getAttention() />
		<cfset var localAddressLine1 = arguments.bean.getAddressLine1() />
		<cfset var localAddressLine2 = arguments.bean.getAddressLine2() />
		<cfset var localCity = arguments.bean.getCity() />
		<cfset var localStateID = arguments.bean.getStateID() />
		<cfset var localZipCode = arguments.bean.getZipCode() />
		<cfset var localCountryID = arguments.bean.getCountryID() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateAddress" datasource="#trim(arguments.ds)#">
				INSERT INTO Address (SiteID,AddressTypeID,Attention,AddressLine1,AddressLine2,City,StateID,ZipCode,CountryID,Active,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localAddressTypeID) NEQ "" AND trim(localAddressTypeID) NEQ "@@" AND trim(localAddressTypeID) NEQ "NULL">						
						<cfqueryparam value="#trim(localAddressTypeID)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localAttention) NEQ "" AND trim(localAttention) NEQ "@@" AND trim(localAttention) NEQ "NULL">						
						<cfqueryparam value="#trim(localAttention)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localAddressLine1) NEQ "" AND trim(localAddressLine1) NEQ "@@" AND trim(localAddressLine1) NEQ "NULL">						
						<cfqueryparam value="#trim(localAddressLine1)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localAddressLine2) NEQ "" AND trim(localAddressLine2) NEQ "@@" AND trim(localAddressLine2) NEQ "NULL">						
						<cfqueryparam value="#trim(localAddressLine2)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localCity) NEQ "" AND trim(localCity) NEQ "@@" AND trim(localCity) NEQ "NULL">						
						<cfqueryparam value="#trim(localCity)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localStateID))>						
						<cfqueryparam value="#trim(localStateID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localZipCode) NEQ "" AND trim(localZipCode) NEQ "@@" AND trim(localZipCode) NEQ "NULL">						
						<cfqueryparam value="#trim(localZipCode)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localCountryID))>						
						<cfqueryparam value="#trim(localCountryID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS AddressID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setAddressID(qCreateAddress.AddressID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="AddressBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="AddressID" required="yes" type="numeric" />		
		<cfset var qGetAddress = "" />		
		
		<cfset qGetAddress = getAddress(trim(arguments.ds), trim(AddressID)) />
				
		<cfif qGetAddress.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objAddress = createObject("component", "AddressBean").init(arguments.ds);
			objAddress.setAddressID(qGetAddress.AddressID);
			objAddress.setSiteID(qGetAddress.SiteID);
			objAddress.setAddressTypeID(qGetAddress.AddressTypeID);
			objAddress.setAttention(qGetAddress.Attention);
			objAddress.setAddressLine1(qGetAddress.AddressLine1);
			objAddress.setAddressLine2(qGetAddress.AddressLine2);
			objAddress.setCity(qGetAddress.City);
			objAddress.setStateID(qGetAddress.StateID);
			objAddress.setZipCode(qGetAddress.ZipCode);
			objAddress.setCountryID(qGetAddress.CountryID);
			objAddress.setActive(qGetAddress.Active);
			objAddress.setInactiveCode(qGetAddress.InactiveCode);
			objAddress.setDateCreated(qGetAddress.DateCreated);
			objAddress.setDateModified(qGetAddress.DateModified);				
			return objAddress;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="AddressBean" />
		<cfset var qUpdateAddress = "" />
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localAddressTypeID = arguments.bean.getAddressTypeID() />
		<cfset var localAttention = arguments.bean.getAttention() />
		<cfset var localAddressLine1 = arguments.bean.getAddressLine1() />
		<cfset var localAddressLine2 = arguments.bean.getAddressLine2() />
		<cfset var localCity = arguments.bean.getCity() />
		<cfset var localStateID = arguments.bean.getStateID() />
		<cfset var localZipCode = arguments.bean.getZipCode() />
		<cfset var localCountryID = arguments.bean.getCountryID() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateAddress" datasource="#trim(arguments.ds)#">
				UPDATE Address  SET
					
					SiteID =				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					AddressTypeID =	
					<cfif trim(localAddressTypeID) NEQ "" AND trim(localAddressTypeID) NEQ "@@" AND trim(localAddressTypeID) NEQ "NULL">						
						<cfqueryparam value="#trim(localAddressTypeID)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Attention =	
					<cfif trim(localAttention) NEQ "" AND trim(localAttention) NEQ "@@" AND trim(localAttention) NEQ "NULL">						
						<cfqueryparam value="#trim(localAttention)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					AddressLine1 =	
					<cfif trim(localAddressLine1) NEQ "" AND trim(localAddressLine1) NEQ "@@" AND trim(localAddressLine1) NEQ "NULL">						
						<cfqueryparam value="#trim(localAddressLine1)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					AddressLine2 =	
					<cfif trim(localAddressLine2) NEQ "" AND trim(localAddressLine2) NEQ "@@" AND trim(localAddressLine2) NEQ "NULL">						
						<cfqueryparam value="#trim(localAddressLine2)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					City =	
					<cfif trim(localCity) NEQ "" AND trim(localCity) NEQ "@@" AND trim(localCity) NEQ "NULL">						
						<cfqueryparam value="#trim(localCity)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					StateID =				
					<cfif IsNumeric(trim(localStateID))>						
						<cfqueryparam value="#trim(localStateID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ZipCode =	
					<cfif trim(localZipCode) NEQ "" AND trim(localZipCode) NEQ "@@" AND trim(localZipCode) NEQ "NULL">						
						<cfqueryparam value="#trim(localZipCode)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					CountryID =				
					<cfif IsNumeric(trim(localCountryID))>						
						<cfqueryparam value="#trim(localCountryID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Active =						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					InactiveCode =				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					DateModified =	
					<cfif IsDate(trim(localDateModified))>						
						<cfqueryparam value="#trim(localDateModified)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>					
				WHERE AddressID = <cfqueryparam value="#trim(arguments.bean.getAddressID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="AddressBean" />
		<cfset var qDeleteAddress = "">

		<cfquery name="qDeleteAddress" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM Address
			WHERE AddressID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getAddressID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAddress" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="AddressID" required="yes" type="numeric" />		
		<cfset var qGetAddress = "" />		
	
		<cfquery name="qGetAddress" datasource="#trim(arguments.ds)#">
	  		SELECT AddressID,SiteID,AddressTypeID,Attention,AddressLine1,AddressLine2,City,StateID,ZipCode,CountryID,Active,InactiveCode,DateCreated,DateModified
			FROM Address  
			WHERE AddressID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.AddressID)#" /> 
		</cfquery>
		
		<cfreturn qGetAddress>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		<!-------------------------------------------------------------------------------------->
		<!--- This function will be called to get addresses belonging to an entity.          --->
		<!-------------------------------------------------------------------------------------->		
		<cffunction name="getAddressesByEntityId">		
			
			<cfargument name="ds" required="yes" type="string">
			<cfargument name="clientID" required="yes" type="numeric">
			<cfargument name="EntityID" required="yes" type="numeric">
			<cfargument name="Active" required="no" default="">
												
			<cftry>			
				
				<cfquery name="getAddresses" datasource="#trim(arguments.ds)#">
					SELECT a.AddressID, a.SiteID, a.AddressTypeID, a.AddressLine1, a.AddressLine2, a.City, a.StateID, a.ZipCode, a.CountryID, a.Active, a.DateCreated, a.Attention, 
					sli2.ItemNameDisplay AS AddressType, sli.ItemNameDisplay AS StateFull, sli.ItemDescription AS StateAbbr,
					ea.IsDefault
					FROM EntityAddress ea INNER JOIN Address a ON ea.AddressID = a.AddressID
					INNER JOIN pa_master.StandardListItem sli ON a.stateID = sli.StandardListItemID		
					INNER JOIN pa_master.StandardListItem sli2 ON a.AddressTypeID = sli2.StandardListItemID 				
					WHERE ea.EntityID = <cfqueryparam value="#trim(arguments.EntityID)#" cfsqltype="CF_SQL_INTEGER" />  				
					<cfif IsNumeric(Active)>
						AND ea.Active = <cfqueryparam value="#trim(arguments.Active)#" cfsqltype="CF_SQL_INTEGER" /> 	
					</cfif>		
					Order BY ea.IsDefault DESC		
				</cfquery>
							
				<cfreturn getAddresses>						
						
				<cfcatch type="Any">				
					<cfthrow message="Caught Exception: #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#">						
				</cfcatch>
				
			</cftry>
			
		</cffunction>
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- This function will be called to bind an Address to an entity.                  --->
		<!-------------------------------------------------------------------------------------->		
		<cffunction name="bindAddressEntity">		
			
			<cfargument name="ds" required="yes" type="string">
			<cfargument name="EntityID" required="yes" type="numeric">
			<cfargument name="AddressID" required="yes" type="numeric">
								
			<cftry>			
				
				<cfquery name="getEntityAddress" datasource="#trim(arguments.ds)#">
					SELECT * 
					FROM EntityAddress  
					WHERE EntityID = #trim(EntityID)# AND AddressID = #trim(AddressID)#					
				</cfquery>		
				<cfif getEntityAddress.recordCount LTE 0>
					<cfquery name="insertEntityAddress" datasource="#trim(arguments.ds)#">
						INSERT INTO EntityAddress  (EntityID, AddressID)
						VALUES(#trim(EntityID)#, #trim(AddressID)#)					
					</cfquery>							
				</cfif>
						
				<cfcatch type="Any">				
					<cfthrow message="Caught Exception: #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#">						
				</cfcatch>
				
			</cftry>
			
		</cffunction>	
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- This function will be called to ARCHIVE an address from the db.                --->
		<!-------------------------------------------------------------------------------------->		
		<cffunction name="archiveAddress">		
			
			<cfargument name="ds" required="yes" type="string">
			<cfargument name="AddressID" required="yes" type="numeric">
								
			<cftry>			
							
				<cfquery name="archiveEntityAddress" datasource="#trim(arguments.ds)#">
					UPDATE EntityAddress 
					SET Active = 0, InactiveCode = 68
					WHERE AddressID = #trim(arguments.AddressID)#	
				</cfquery>	
						
				<cfquery name="archiveAddress" datasource="#trim(arguments.ds)#">
					UPDATE Address 
					SET Active = 0, InactiveCode = 68
					WHERE AddressID = #trim(arguments.AddressID)#	
				</cfquery>
									
						
				<cfcatch type="Any">				
					<cfthrow message="Caught Exception: #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#">						
				</cfcatch>
				
			</cftry>
			
		</cffunction>
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


