 	

<cfcomponent output="false">

	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.configBean = '' />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the InsuranceCompany DAO Class.">
		<cfargument name="configBean" required="true" type="com.utility.configBean" hint="I am the config object." />
			<cfscript>
				variables.instance.configBean = arguments.configBean;
			</cfscript>
		<cfreturn this />
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="save" access="public" output="false" returntype="any" hint="I handle saving a InsuranceCompany, either by creating a new entry or updating an existing one.">
		<cfargument name="InsuranceCompany" required="true" type="com.model.InsuranceCompany" hint="I am the InsuranceCompany bean." />
		
		<cfset var success = "" />
		
		<cfif exists(arguments.InsuranceCompany)>
			<cfset success = update(arguments.InsuranceCompany) />
		<cfelse>
			<cfset success = create(arguments.InsuranceCompany) />
		</cfif>
		
		<cfreturn success />
	
	</cffunction>	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function search for a record.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="exists" access="public" output="false" returntype="boolean" hint="I check to see if a specific InsuranceCompany exists within the database, using the ID as a check.">
		<cfargument name="InsuranceCompany" required="true" type="com.model.InsuranceCompany" hint="I am the InsuranceCompany bean." />

		<cfset var qExists = "" />
		
		<cfquery name="qExists" datasource="#variables.instance.configBean.getDSN().client#" maxrows="1">
			SELECT count(1) as idexists
			FROM InsuranceCompany
			WHERE InsuranceCompanyID = <cfqueryparam value="#arguments.InsuranceCompany.getInsuranceCompanyID()#" CFSQLType="cf_sql_integer" />
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
				
		<cfargument name="InsuranceCompany" required="true" type="com.model.InsuranceCompany" />
		
		<cfset var qCreateInsuranceCompany = "" />		
									
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateInsuranceCompany" datasource="#variables.instance.configBean.getDSN().client#">
				INSERT INTO InsuranceCompany (ClientID,OCNANumber,InsuranceCompanyName,InsuranceCompanyDBA,EntityID,InsuranceCompanyURL,LoginInstructionsXML,Active,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(arguments.InsuranceCompany.getClientID()))>						
						<cfqueryparam value="#trim(arguments.InsuranceCompany.getClientID())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(arguments.InsuranceCompany.getOCNANumber()) NEQ "" AND trim(arguments.InsuranceCompany.getOCNANumber()) NEQ "@@" AND trim(arguments.InsuranceCompany.getOCNANumber()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.InsuranceCompany.getOCNANumber())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.InsuranceCompany.getInsuranceCompanyName()) NEQ "" AND trim(arguments.InsuranceCompany.getInsuranceCompanyName()) NEQ "@@" AND trim(arguments.InsuranceCompany.getInsuranceCompanyName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.InsuranceCompany.getInsuranceCompanyName())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.InsuranceCompany.getInsuranceCompanyDBA()) NEQ "" AND trim(arguments.InsuranceCompany.getInsuranceCompanyDBA()) NEQ "@@" AND trim(arguments.InsuranceCompany.getInsuranceCompanyDBA()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.InsuranceCompany.getInsuranceCompanyDBA())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(arguments.InsuranceCompany.getEntityID()))>						
						<cfqueryparam value="#trim(arguments.InsuranceCompany.getEntityID())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(arguments.InsuranceCompany.getInsuranceCompanyURL()) NEQ "" AND trim(arguments.InsuranceCompany.getInsuranceCompanyURL()) NEQ "@@" AND trim(arguments.InsuranceCompany.getInsuranceCompanyURL()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.InsuranceCompany.getInsuranceCompanyURL())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.InsuranceCompany.getLoginInstructionsXML()) NEQ "" AND trim(arguments.InsuranceCompany.getLoginInstructionsXML()) NEQ "@@" AND trim(arguments.InsuranceCompany.getLoginInstructionsXML()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.InsuranceCompany.getLoginInstructionsXML())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(arguments.InsuranceCompany.getActive())#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(arguments.InsuranceCompany.getInactiveCode()))>						
						<cfqueryparam value="#trim(arguments.InsuranceCompany.getInactiveCode())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				)
				SELECT SCOPE_IDENTITY() AS InsuranceCompanyID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.InsuranceCompany.setInsuranceCompanyID(qCreateInsuranceCompany.InsuranceCompanyID);
		</cfscript>
		
		<cfreturn arguments.InsuranceCompany />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="void">
		
		<cfargument name="InsuranceCompany" type="com.model.InsuranceCompany" required="true" />
				
		<cfset var qGetInsuranceCompany = "" />
				
		<cfset qGetInsuranceCompany = getInsuranceCompanyByID(trim(arguments.InsuranceCompany.getInsuranceCompanyID())) />
				
		<cfif qGetInsuranceCompany.Recordcount GT 0>	

			<!-------------------------------------------------------------------------------------->
			<!--- Initialize the OBJ with the current values from DB.                            --->
			<!-------------------------------------------------------------------------------------->			
			<cfif qGetInsuranceCompany.recordCount>
				<cfset variables.qRow = QueryToStruct(qGetInsuranceCompany, 1)>
				<cfset arguments.InsuranceCompany.init(argumentCollection=variables.qRow)>
			</cfif>	
				
		</cfif>	
		
	</cffunction>		
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function update a record.    -private use save                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="update" output="false" access="private" returntype="any">
				
		<cfargument name="InsuranceCompany" required="true" type="com.model.InsuranceCompany" />
		<cfset var qUpdateInsuranceCompany = "" />
		<cfset var boolSuccess = true />
			
		<cftry>
		
			<cfquery name="qUpdateInsuranceCompany" datasource="#variables.instance.configBean.getDSN().client#">
				UPDATE InsuranceCompany  SET
					DateModified =	<cfqueryparam value="#trim(CreateODBCDateTIME(NOW()))#" cfsqltype="CF_SQL_TIMESTAMP" />,
					
					ClientID =				
					<cfif IsNumeric(trim(arguments.InsuranceCompany.getClientID()))>						
						<cfqueryparam value="#trim(arguments.InsuranceCompany.getClientID())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					OCNANumber =	
					<cfif trim(arguments.InsuranceCompany.getOCNANumber()) NEQ "" AND trim(arguments.InsuranceCompany.getOCNANumber()) NEQ "@@" AND trim(arguments.InsuranceCompany.getOCNANumber()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.InsuranceCompany.getOCNANumber())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					InsuranceCompanyName =	
					<cfif trim(arguments.InsuranceCompany.getInsuranceCompanyName()) NEQ "" AND trim(arguments.InsuranceCompany.getInsuranceCompanyName()) NEQ "@@" AND trim(arguments.InsuranceCompany.getInsuranceCompanyName()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.InsuranceCompany.getInsuranceCompanyName())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					InsuranceCompanyDBA =	
					<cfif trim(arguments.InsuranceCompany.getInsuranceCompanyDBA()) NEQ "" AND trim(arguments.InsuranceCompany.getInsuranceCompanyDBA()) NEQ "@@" AND trim(arguments.InsuranceCompany.getInsuranceCompanyDBA()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.InsuranceCompany.getInsuranceCompanyDBA())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					EntityID =				
					<cfif IsNumeric(trim(arguments.InsuranceCompany.getEntityID()))>						
						<cfqueryparam value="#trim(arguments.InsuranceCompany.getEntityID())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					InsuranceCompanyURL =	
					<cfif trim(arguments.InsuranceCompany.getInsuranceCompanyURL()) NEQ "" AND trim(arguments.InsuranceCompany.getInsuranceCompanyURL()) NEQ "@@" AND trim(arguments.InsuranceCompany.getInsuranceCompanyURL()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.InsuranceCompany.getInsuranceCompanyURL())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LoginInstructionsXML =	
					<cfif trim(arguments.InsuranceCompany.getLoginInstructionsXML()) NEQ "" AND trim(arguments.InsuranceCompany.getLoginInstructionsXML()) NEQ "@@" AND trim(arguments.InsuranceCompany.getLoginInstructionsXML()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.InsuranceCompany.getLoginInstructionsXML())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Active =						
						<cfqueryparam value="#trim(arguments.InsuranceCompany.getActive())#" cfsqltype="CF_SQL_VARCHAR" />,
					
					InactiveCode =				
					<cfif IsNumeric(trim(arguments.InsuranceCompany.getInactiveCode()))>						
						<cfqueryparam value="#trim(arguments.InsuranceCompany.getInactiveCode())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>					
				WHERE InsuranceCompanyID = <cfqueryparam value="#trim(arguments.InsuranceCompany.getInsuranceCompanyID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">		
				<cfset boolSuccess = false />
			</cfcatch>
		
		</cftry>
		
		<cfreturn boolSuccess />
		
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="InsuranceCompanyID" required="true" type="String" />
		
		<cfset var qDeleteInsuranceCompany = "">

		<cfquery name="qDeleteInsuranceCompany" datasource="#variables.instance.configBean.getDSN().client#" result="status">
			DELETE
			FROM InsuranceCompany
			WHERE InsuranceCompanyID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.InsuranceCompanyID)#" /> 
		</cfquery>

	</cffunction>



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInsuranceCompanyByID" output="false" access="public" returntype="query">
		
		<cfargument name="InsuranceCompanyID" required="yes" type="numeric" />		
		
		<cfset var qGetInsuranceCompany = "" />		
	
		<cfquery name="qGetInsuranceCompany" datasource="#variables.instance.configBean.getDSN().client#">
	  		SELECT InsuranceCompanyID,ClientID,OCNANumber,InsuranceCompanyName,InsuranceCompanyDBA,EntityID,InsuranceCompanyURL,LoginInstructionsXML,Active,InactiveCode,DateCreated,DateModified
			FROM InsuranceCompany  
			WHERE InsuranceCompanyID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.InsuranceCompanyID)#" /> 
		</cfquery>
		
		<cfreturn qGetInsuranceCompany>
		
	</cffunction>	
	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GATEWAY PUBLIC METHODS                                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAllInsuranceCompanys"  access="public" output="false" hint="I run a query of all InsuranceCompanys within the database table.">
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />							
		<cfreturn filterAllInsuranceCompanys(arguments.filter) />	
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- GATEWAY PRIVATE METHODS                                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="filterAllInsuranceCompanys" returntype="any" access="public" output="false" hint="I run a query and will return all InsuranceCompany records. If a filter has been supplied, I will refine the search using the filter information sent to me.">
					
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />
			
			<cfset var qSearch = "" />
		
			<cfquery name="qSearch"	 datasource="#variables.instance.configBean.getDSN().client#">
				SELECT InsuranceCompanyID,ClientID,OCNANumber,InsuranceCompanyName,InsuranceCompanyDBA,EntityID,InsuranceCompanyURL,LoginInstructionsXML,Active,InactiveCode,DateCreated,DateModified
				FROM InsuranceCompany
				WHERE 1 = 1
				<cfif NOT structIsEmpty(arguments.filter)>				
					<cfif structKeyExists(arguments.filter, "InsuranceCompanyID")>				
						AND InsuranceCompanyID IN(#arguments.filter.InsuranceCompanyID#)
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ClientID")>				
						AND ClientID = <cfqueryparam value="#arguments.filter.ClientID#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "OCNANumber")>				
						AND OCNANumber = <cfqueryparam value="#arguments.filter.OCNANumber#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "InsuranceCompanyName")>				
						AND InsuranceCompanyName = <cfqueryparam value="#arguments.filter.InsuranceCompanyName#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "InsuranceCompanyDBA")>				
						AND InsuranceCompanyDBA = <cfqueryparam value="#arguments.filter.InsuranceCompanyDBA#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "EntityID")>				
						AND EntityID = <cfqueryparam value="#arguments.filter.EntityID#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "InsuranceCompanyURL")>				
						AND InsuranceCompanyURL = <cfqueryparam value="#arguments.filter.InsuranceCompanyURL#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "LoginInstructionsXML")>				
						AND LoginInstructionsXML = <cfqueryparam value="#arguments.filter.LoginInstructionsXML#" cfsqltype="CF_SQL_VARCHAR" />
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


