 	

<cfcomponent output="false">

	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.configBean = '' />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the Address DAO Class.">
		<cfargument name="configBean" required="true" type="com.utility.configBean" hint="I am the config object." />
			<cfscript>
				variables.instance.configBean = arguments.configBean;
			</cfscript>
		<cfreturn this />
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="save" access="public" output="false" returntype="any" hint="I handle saving a Address, either by creating a new entry or updating an existing one.">
		<cfargument name="Address" required="true" type="com.model.Address" hint="I am the Address bean." />
		
		<cfset var success = "" />
		
		<cfif exists(arguments.Address)>
			<cfset success = update(arguments.Address) />
		<cfelse>
			<cfset success = create(arguments.Address) />
		</cfif>
		
		<cfreturn success />
	
	</cffunction>	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function search for a record.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="exists" access="public" output="false" returntype="boolean" hint="I check to see if a specific Address exists within the database, using the ID as a check.">
		<cfargument name="Address" required="true" type="com.model.Address" hint="I am the Address bean." />

		<cfset var qExists = "" />
		
		<cfquery name="qExists" datasource="#variables.instance.configBean.getDSN().client#" maxrows="1">
			SELECT count(1) as idexists
			FROM Address
			WHERE AddressID = <cfqueryparam value="#arguments.Address.getAddressID()#" CFSQLType="cf_sql_integer" />
		</cfquery>
		
		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
		
	</cffunction>


										
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.    -private use save                        --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="private">
				
		<cfargument name="Address" required="true" type="com.model.Address" />
		
		<cfset var qCreateAddress = "" />		
									
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateAddress" datasource="#variables.instance.configBean.getDSN().client#">
				INSERT INTO Address (SiteID,AddressTypeID,Attention,AddressLine1,AddressLine2,City,StateID,ZipCode,CountryID,Active,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(arguments.Address.getSiteID()))>						
						<cfqueryparam value="#trim(arguments.Address.getSiteID())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(arguments.Address.getAddressTypeID()) NEQ "" AND trim(arguments.Address.getAddressTypeID()) NEQ "@@" AND trim(arguments.Address.getAddressTypeID()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.Address.getAddressTypeID())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.Address.getAttention()) NEQ "" AND trim(arguments.Address.getAttention()) NEQ "@@" AND trim(arguments.Address.getAttention()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.Address.getAttention())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.Address.getAddressLine1()) NEQ "" AND trim(arguments.Address.getAddressLine1()) NEQ "@@" AND trim(arguments.Address.getAddressLine1()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.Address.getAddressLine1())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.Address.getAddressLine2()) NEQ "" AND trim(arguments.Address.getAddressLine2()) NEQ "@@" AND trim(arguments.Address.getAddressLine2()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.Address.getAddressLine2())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.Address.getCity()) NEQ "" AND trim(arguments.Address.getCity()) NEQ "@@" AND trim(arguments.Address.getCity()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.Address.getCity())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(arguments.Address.getStateID()))>						
						<cfqueryparam value="#trim(arguments.Address.getStateID())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(arguments.Address.getZipCode()) NEQ "" AND trim(arguments.Address.getZipCode()) NEQ "@@" AND trim(arguments.Address.getZipCode()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.Address.getZipCode())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(arguments.Address.getCountryID()))>						
						<cfqueryparam value="#trim(arguments.Address.getCountryID())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,						
						<cfqueryparam value="#trim(arguments.Address.getActive())#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(arguments.Address.getInactiveCode()))>						
						<cfqueryparam value="#trim(arguments.Address.getInactiveCode())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS AddressID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.Address.setAddressID(qCreateAddress.AddressID);
		</cfscript>
		
		<cfreturn arguments.Address />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="void">
		
		<cfargument name="Address" type="com.model.Address" required="true" />
				
		<cfset var qGetAddress = "" />
				
		<cfset qGetAddress = getAddressByID(trim(arguments.Address.getAddressID())) />
				
		<cfif qGetAddress.Recordcount GT 0>	

			<!-------------------------------------------------------------------------------------->
			<!--- Initialize the OBJ with the current values from DB.                            --->
			<!-------------------------------------------------------------------------------------->			
			<cfif qGetAddress.recordCount>
				<cfset variables.qRow = QueryToStruct(qGetAddress, 1)>
				<cfset arguments.Address.init(argumentCollection=variables.qRow)>
			</cfif>	
				
		</cfif>	
		
	</cffunction>		
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function update a record.    -private use save                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="update" output="false" access="private" returntype="any">
				
		<cfargument name="Address" required="true" type="com.model.Address" />
		<cfset var qUpdateAddress = "" />
		<cfset var boolSuccess = true />
			
		<cftry>
		
			<cfquery name="qUpdateAddress" datasource="#variables.instance.configBean.getDSN().client#">
				UPDATE Address  SET
					DateModified =	<cfqueryparam value="#trim(CreateODBCDateTIME(NOW()))#" cfsqltype="CF_SQL_TIMESTAMP" />,
					
					SiteID =				
					<cfif IsNumeric(trim(arguments.Address.getSiteID()))>						
						<cfqueryparam value="#trim(arguments.Address.getSiteID())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					AddressTypeID =	
					<cfif trim(arguments.Address.getAddressTypeID()) NEQ "" AND trim(arguments.Address.getAddressTypeID()) NEQ "@@" AND trim(arguments.Address.getAddressTypeID()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.Address.getAddressTypeID())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Attention =	
					<cfif trim(arguments.Address.getAttention()) NEQ "" AND trim(arguments.Address.getAttention()) NEQ "@@" AND trim(arguments.Address.getAttention()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.Address.getAttention())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					AddressLine1 =	
					<cfif trim(arguments.Address.getAddressLine1()) NEQ "" AND trim(arguments.Address.getAddressLine1()) NEQ "@@" AND trim(arguments.Address.getAddressLine1()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.Address.getAddressLine1())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					AddressLine2 =	
					<cfif trim(arguments.Address.getAddressLine2()) NEQ "" AND trim(arguments.Address.getAddressLine2()) NEQ "@@" AND trim(arguments.Address.getAddressLine2()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.Address.getAddressLine2())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					City =	
					<cfif trim(arguments.Address.getCity()) NEQ "" AND trim(arguments.Address.getCity()) NEQ "@@" AND trim(arguments.Address.getCity()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.Address.getCity())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					StateID =				
					<cfif IsNumeric(trim(arguments.Address.getStateID()))>						
						<cfqueryparam value="#trim(arguments.Address.getStateID())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ZipCode =	
					<cfif trim(arguments.Address.getZipCode()) NEQ "" AND trim(arguments.Address.getZipCode()) NEQ "@@" AND trim(arguments.Address.getZipCode()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.Address.getZipCode())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					CountryID =				
					<cfif IsNumeric(trim(arguments.Address.getCountryID()))>						
						<cfqueryparam value="#trim(arguments.Address.getCountryID())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Active =						
						<cfqueryparam value="#trim(arguments.Address.getActive())#" cfsqltype="CF_SQL_VARCHAR" />,
					
					InactiveCode =				
					<cfif IsNumeric(trim(arguments.Address.getInactiveCode()))>						
						<cfqueryparam value="#trim(arguments.Address.getInactiveCode())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>					
				WHERE AddressID = <cfqueryparam value="#trim(arguments.Address.getAddressID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">		
				<cfset boolSuccess = false />
			</cfcatch>
		
		</cftry>
		
		<cfreturn boolSuccess />
		
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="AddressID" required="true" type="String" />
		
		<cfset var qDeleteAddress = "">

		<cfquery name="qDeleteAddress" datasource="#variables.instance.configBean.getDSN().client#" result="status">
			DELETE
			FROM Address
			WHERE AddressID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.AddressID)#" /> 
		</cfquery>

	</cffunction>



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAddressByID" output="false" access="public" returntype="query">
		
		<cfargument name="AddressID" required="yes" type="numeric" />		
		
		<cfset var qGetAddress = "" />		
	
		<cfquery name="qGetAddress" datasource="#variables.instance.configBean.getDSN().client#">
	  		SELECT AddressID,SiteID,AddressTypeID,Attention,AddressLine1,AddressLine2,City,StateID,ZipCode,CountryID,Active,InactiveCode,DateCreated,DateModified
			FROM Address  
			WHERE AddressID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.AddressID)#" /> 
		</cfquery>
		
		<cfreturn qGetAddress>
		
	</cffunction>	
	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GATEWAY PUBLIC METHODS                                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAllAddresss" access="public" output="false" hint="I run a query of all Addresss within the database table.">
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />							
		<cfreturn filterAllAddresss(arguments.filter) />	
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- GATEWAY PRIVATE METHODS                                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="filterAllAddresss" returntype="any" access="public" output="false" hint="I run a query and will return all Address records. If a filter has been supplied, I will refine the search using the filter information sent to me.">
					
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />
			
			<cfset var qSearch = "" />
		
			<cfquery name="qSearch"	 datasource="#variables.instance.configBean.getDSN().client#">
				SELECT AddressID,SiteID,AddressTypeID,Attention,AddressLine1,AddressLine2,City,StateID,ZipCode,CountryID,Active,InactiveCode,DateCreated,DateModified
				FROM Address
				WHERE 1 = 1
				<cfif NOT structIsEmpty(arguments.filter)>				
					<cfif structKeyExists(arguments.filter, "AddressID")>				
						AND AddressID IN(#arguments.filter.AddressID#)
					</cfif>				
					<cfif structKeyExists(arguments.filter, "SiteID")>				
						AND SiteID = <cfqueryparam value="#arguments.filter.SiteID#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "AddressTypeID")>				
						AND AddressTypeID = <cfqueryparam value="#arguments.filter.AddressTypeID#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "Attention")>				
						AND Attention = <cfqueryparam value="#arguments.filter.Attention#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "AddressLine1")>				
						AND AddressLine1 = <cfqueryparam value="#arguments.filter.AddressLine1#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "AddressLine2")>				
						AND AddressLine2 = <cfqueryparam value="#arguments.filter.AddressLine2#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "City")>				
						AND City = <cfqueryparam value="#arguments.filter.City#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "StateID")>				
						AND StateID = <cfqueryparam value="#arguments.filter.StateID#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ZipCode")>				
						AND ZipCode = <cfqueryparam value="#arguments.filter.ZipCode#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "CountryID")>				
						AND CountryID = <cfqueryparam value="#arguments.filter.CountryID#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "Active")>				
						AND Active = <cfqueryparam value="#arguments.filter.Active#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "InactiveCode")>				
						AND InactiveCode = <cfqueryparam value="#arguments.filter.InactiveCode#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "DateCreated")>				
						AND DateCreated = <cfqueryparam value="#arguments.filter.DateCreated#" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>
					<cfif structKeyExists(arguments.filter, "orderBy")>
						ORDER BY #arguments.filter.orderBy#		
					</cfif>
				</cfif>		
			</cfquery>
				
		<cfreturn qSearch />
		
	</cffunction>
		
		
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


