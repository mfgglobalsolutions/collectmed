 	

<cfcomponent output="false">

	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.configBean = '' />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the Phone DAO Class.">
		<cfargument name="configBean" required="true" type="com.utility.configBean" hint="I am the config object." />
			<cfscript>
				variables.instance.configBean = arguments.configBean;
			</cfscript>
		<cfreturn this />
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="save" access="public" output="false" returntype="any" hint="I handle saving a Phone, either by creating a new entry or updating an existing one.">
		<cfargument name="Phone" required="true" type="com.model.Phone" hint="I am the Phone bean." />
		
		<cfset var success = "" />
		
		<cfif exists(arguments.Phone)>
			<cfset success = update(arguments.Phone) />
		<cfelse>
			<cfset success = create(arguments.Phone) />
		</cfif>
		
		<cfreturn success />
	
	</cffunction>	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function search for a record.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="exists" access="public" output="false" returntype="boolean" hint="I check to see if a specific Phone exists within the database, using the ID as a check.">
		<cfargument name="Phone" required="true" type="com.model.Phone" hint="I am the Phone bean." />

		<cfset var qExists = "" />
		
		<cfquery name="qExists" datasource="#variables.instance.configBean.getDSN().client#" maxrows="1">
			SELECT count(1) as idexists
			FROM phone
			WHERE PhoneID = <cfqueryparam value="#arguments.Phone.getPhoneID()#" CFSQLType="cf_sql_integer" />
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
				
		<cfargument name="Phone" required="true" type="com.model.Phone" />
		
		<cfset var qCreatePhone = "" />		
									
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreatePhone" datasource="#variables.instance.configBean.getDSN().client#">
				INSERT INTO phone (SiteID,PhoneTypeID,PhoneNumber,PhoneExtension,Active,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(arguments.Phone.getSiteID()))>						
						<cfqueryparam value="#trim(arguments.Phone.getSiteID())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(arguments.Phone.getPhoneTypeID()) NEQ "" AND trim(arguments.Phone.getPhoneTypeID()) NEQ "@@" AND trim(arguments.Phone.getPhoneTypeID()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.Phone.getPhoneTypeID())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.Phone.getPhoneNumber()) NEQ "" AND trim(arguments.Phone.getPhoneNumber()) NEQ "@@" AND trim(arguments.Phone.getPhoneNumber()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.Phone.getPhoneNumber())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.Phone.getPhoneExtension()) NEQ "" AND trim(arguments.Phone.getPhoneExtension()) NEQ "@@" AND trim(arguments.Phone.getPhoneExtension()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.Phone.getPhoneExtension())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(arguments.Phone.getActive())#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(arguments.Phone.getInactiveCode()))>						
						<cfqueryparam value="#trim(arguments.Phone.getInactiveCode())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS PhoneID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.Phone.setPhoneID(qCreatePhone.PhoneID);
		</cfscript>
		
		<cfreturn arguments.Phone />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="void">
		
		<cfargument name="Phone" type="com.model.Phone" required="true" />
				
		<cfset var qGetPhone = "" />
				
		<cfset qGetPhone = getPhoneByID(trim(arguments.Phone.getPhoneID())) />
				
		<cfif qGetPhone.Recordcount GT 0>	

			<!-------------------------------------------------------------------------------------->
			<!--- Initialize the OBJ with the current values from DB.                            --->
			<!-------------------------------------------------------------------------------------->			
			<cfif qGetPhone.recordCount>
				<cfset variables.qRow = QueryToStruct(qGetPhone, 1)>
				<cfset arguments.Phone.init(argumentCollection=variables.qRow)>
			</cfif>	
				
		</cfif>	
		
	</cffunction>		
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function update a record.    -private use save                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="update" output="false" access="private" returntype="any">
				
		<cfargument name="Phone" required="true" type="com.model.Phone" />
		<cfset var qUpdatePhone = "" />
		<cfset var boolSuccess = true />
			
		<cftry>
		
			<cfquery name="qUpdatePhone" datasource="#variables.instance.configBean.getDSN().client#">
				UPDATE phone  SET
					DateModified =	<cfqueryparam value="#trim(CreateODBCDateTIME(NOW()))#" cfsqltype="CF_SQL_TIMESTAMP" />,
					
					SiteID =				
					<cfif IsNumeric(trim(arguments.Phone.getSiteID()))>						
						<cfqueryparam value="#trim(arguments.Phone.getSiteID())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					PhoneTypeID =	
					<cfif trim(arguments.Phone.getPhoneTypeID()) NEQ "" AND trim(arguments.Phone.getPhoneTypeID()) NEQ "@@" AND trim(arguments.Phone.getPhoneTypeID()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.Phone.getPhoneTypeID())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PhoneNumber =	
					<cfif trim(arguments.Phone.getPhoneNumber()) NEQ "" AND trim(arguments.Phone.getPhoneNumber()) NEQ "@@" AND trim(arguments.Phone.getPhoneNumber()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.Phone.getPhoneNumber())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					PhoneExtension =	
					<cfif trim(arguments.Phone.getPhoneExtension()) NEQ "" AND trim(arguments.Phone.getPhoneExtension()) NEQ "@@" AND trim(arguments.Phone.getPhoneExtension()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.Phone.getPhoneExtension())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Active =						
						<cfqueryparam value="#trim(arguments.Phone.getActive())#" cfsqltype="CF_SQL_VARCHAR" />,
					
					InactiveCode =				
					<cfif IsNumeric(trim(arguments.Phone.getInactiveCode()))>						
						<cfqueryparam value="#trim(arguments.Phone.getInactiveCode())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>					
				WHERE PhoneID = <cfqueryparam value="#trim(arguments.Phone.getPhoneID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">		
				<cfset boolSuccess = false />
			</cfcatch>
		
		</cftry>
		
		<cfreturn boolSuccess />
		
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="PhoneID" required="true" type="String" />
		
		<cfset var qDeletePhone = "">

		<cfquery name="qDeletePhone" datasource="#variables.instance.configBean.getDSN().client#" result="status">
			DELETE
			FROM phone
			WHERE PhoneID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.PhoneID)#" /> 
		</cfquery>

	</cffunction>



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPhoneByID" output="false" access="public" returntype="query">
		
		<cfargument name="PhoneID" required="yes" type="numeric" />		
		
		<cfset var qGetPhone = "" />		
	
		<cfquery name="qGetPhone" datasource="#variables.instance.configBean.getDSN().client#">
	  		SELECT PhoneID,SiteID,PhoneTypeID,PhoneNumber,PhoneExtension,Active,InactiveCode,DateCreated,DateModified
			FROM phone  
			WHERE PhoneID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.PhoneID)#" /> 
		</cfquery>
		
		<cfreturn qGetPhone>
		
	</cffunction>	
	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GATEWAY PUBLIC METHODS                                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAllPhones" access="public" output="false" hint="I run a query of all Phones within the database table.">
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />							
		<cfreturn filterAllPhones(arguments.filter) />	
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- GATEWAY PRIVATE METHODS                                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="filterAllPhones" returntype="any" access="public" output="false" hint="I run a query and will return all Phone records. If a filter has been supplied, I will refine the search using the filter information sent to me.">
					
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />
			
			<cfset var qSearch = "" />
		
			<cfquery name="qSearch"	 datasource="#variables.instance.configBean.getDSN().client#">
				SELECT PhoneID,SiteID,PhoneTypeID,PhoneNumber,PhoneExtension,Active,InactiveCode,DateCreated,DateModified
				FROM phone
				WHERE 1 = 1
				<cfif NOT structIsEmpty(arguments.filter)>				
					<cfif structKeyExists(arguments.filter, "PhoneID")>				
						AND PhoneID IN(#arguments.filter.PhoneID#)
					</cfif>				
					<cfif structKeyExists(arguments.filter, "SiteID")>				
						AND SiteID = <cfqueryparam value="#arguments.filter.SiteID#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PhoneTypeID")>				
						AND PhoneTypeID = <cfqueryparam value="#arguments.filter.PhoneTypeID#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PhoneNumber")>				
						AND PhoneNumber = <cfqueryparam value="#arguments.filter.PhoneNumber#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "PhoneExtension")>				
						AND PhoneExtension = <cfqueryparam value="#arguments.filter.PhoneExtension#" cfsqltype="CF_SQL_VARCHAR" />
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

		
		<!-------------------------------------------------------------------------------------->
		<!--- This function will be called to get addresses belonging to an entity.          --->
		<!-------------------------------------------------------------------------------------->		
		<cffunction name="getPhonesByEntityId">		
			
			<cfargument name="ds" required="yes" type="string">
			<cfargument name="clientID" required="yes" type="numeric">
			<cfargument name="EntityID" required="yes" type="numeric">
			<cfargument name="Active" required="no" default="">
												
			<cftry>			
				
				<cfquery name="getPhones" datasource="#trim(arguments.ds)#">
					SELECT p.PhoneID, p.PhoneTypeID, p.PhoneNumber, p.PhoneExtension, p.PhoneID, p.SiteID, p.PhoneTypeID, p.PhoneNumber, p.PhoneExtension, p.Active, p.DateCreated, sli.ItemNameDisplay AS PhoneType, ep.IsDefault
					FROM entityphone ep INNER JOIN phone p ON ep.PhoneID = p.PhoneID						
					INNER JOIN pa_master.standardlistitem sli ON p.PhoneTypeID = sli.StandardListItemID 				
					WHERE ep.EntityID = <cfqueryparam value="#trim(arguments.EntityID)#" cfsqltype="CF_SQL_INTEGER" />  				
					<cfif IsNumeric(Active)>
						AND ep.Active = <cfqueryparam value="#trim(arguments.Active)#" cfsqltype="CF_SQL_INTEGER" /> 	
					</cfif>		
					Order BY ep.IsDefault DESC		
				</cfquery>
							
				<cfreturn getPhones>						
						
				<cfcatch type="Any">				
					<cfthrow message="Caught Exception: #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#">						
				</cfcatch>
				
			</cftry>
			
		</cffunction>
		
		<!-------------------------------------------------------------------------------------->
		<!--- This function will be called to bind a phone to an entity.                     --->
		<!-------------------------------------------------------------------------------------->		
		<cffunction name="bindPhoneEntity">		
			
			<cfargument name="ds" required="yes" type="string">
			<cfargument name="EntityID" required="yes" type="numeric">
			<cfargument name="PhoneID" required="yes" type="numeric">
			<cfargument name="IsDefault" required="no" type="numeric" default="0">
								
			<cftry>			
				
				<cfquery name="getEntityPhone" datasource="#trim(arguments.ds)#">
					SELECT * 
					FROM entityphone  
					WHERE EntityID = #trim(arguments.EntityID)# AND PhoneID = #trim(arguments.PhoneID)#					
				</cfquery>		
				<cfif getEntityPhone.recordCount LTE 0>
					<cfquery name="insertEntityPhone" datasource="#trim(arguments.ds)#">
						INSERT INTO entityphone  (EntityID, PhoneID, IsDefault)
						VALUES(
							<cfqueryparam value="#trim(arguments.EntityID)#" cfsqltype="CF_SQL_INTEGER" />, 
							<cfqueryparam value="#trim(arguments.PhoneID)#" cfsqltype="CF_SQL_INTEGER" />, 
							<cfqueryparam value="#trim(arguments.IsDefault)#" cfsqltype="CF_SQL_INTEGER" /> 	
						)					
					</cfquery>							
				</cfif>
						
				<cfcatch type="Any">				
					<cfthrow message="Caught Exception: #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#">						
				</cfcatch>
				
			</cftry>
			
		</cffunction>	
		
		
			
		<!-------------------------------------------------------------------------------------->
		<!--- This function will be called to ARCHIVE an Phone from the db.                  --->
		<!-------------------------------------------------------------------------------------->		
		<cffunction name="archivePhone">		
			
			<cfargument name="ds" required="yes" type="string">
			<cfargument name="PhoneID" required="yes" type="numeric">
								
			<cftry>
											
				<cfquery name="archiveEntityPhone" datasource="#trim(arguments.ds)#">
					UPDATE entityphone 
					SET Active = 0, InactiveCode = 68
					WHERE PhoneID = <cfqueryparam value="#trim(arguments.PhoneID)#" cfsqltype="CF_SQL_INTEGER" /> 		
				</cfquery>	
						
				<cfquery name="archivePhone" datasource="#trim(arguments.ds)#">
					UPDATE phone 
					SET Active = 0, InactiveCode = 68
					WHERE PhoneID = <cfqueryparam value="#trim(arguments.PhoneID)#" cfsqltype="CF_SQL_INTEGER" /> 	 	
				</cfquery>
				
															
				<cfcatch type="Any">				
					<cfthrow message="Caught Exception: #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#">										
				</cfcatch>
				
			</cftry>
			
		</cffunction>
	
		
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


