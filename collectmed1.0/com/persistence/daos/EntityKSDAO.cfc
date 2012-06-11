 	

<cfcomponent output="false">

	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.configBean = '' />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the EntityKS DAO Class.">
		<cfargument name="configBean" required="true" type="com.utility.configBean" hint="I am the config object." />
			<cfscript>
				variables.instance.configBean = arguments.configBean;
			</cfscript>
		<cfreturn this />
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="save" access="public" output="false" returntype="any" hint="I handle saving a EntityKS, either by creating a new entry or updating an existing one.">
		<cfargument name="EntityKS" required="true" type="com.model.EntityKS" hint="I am the EntityKS bean." />
		
		<cfset var success = "" />
		
		<cfif exists(arguments.EntityKS)>
			<cfset success = update(arguments.EntityKS) />
		<cfelse>
			<cfset success = create(arguments.EntityKS) />
		</cfif>
		
		<cfreturn success />
	
	</cffunction>	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function search for a record.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="exists" access="public" output="false" returntype="boolean" hint="I check to see if a specific EntityKS exists within the database, using the ID as a check.">
		<cfargument name="EntityKS" required="true" type="com.model.EntityKS" hint="I am the EntityKS bean." />

		<cfset var qExists = "" />
		
		<cfquery name="qExists" datasource="#variables.instance.configBean.getDSN().client#" maxrows="1">
			SELECT count(1) as idexists
			FROM entityks
			WHERE EntityKSID = <cfqueryparam value="#arguments.EntityKS.getEntityKSID()#" CFSQLType="cf_sql_integer" />
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
				
		<cfargument name="EntityKS" required="true" type="com.model.EntityKS" />
		
		<cfset var qCreateEntityKS = "" />		
									
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEntityKS" datasource="#variables.instance.configBean.getDSN().client#">
				INSERT INTO entityks (ColM,ColE,ColL,ColI,ColA,ColC,Active,InactiveCode)
				VALUES (	
					<cfif trim(arguments.EntityKS.getColM()) NEQ "" AND trim(arguments.EntityKS.getColM()) NEQ "@@" AND trim(arguments.EntityKS.getColM()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.EntityKS.getColM())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.EntityKS.getColE()) NEQ "" AND trim(arguments.EntityKS.getColE()) NEQ "@@" AND trim(arguments.EntityKS.getColE()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.EntityKS.getColE())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.EntityKS.getColL()) NEQ "" AND trim(arguments.EntityKS.getColL()) NEQ "@@" AND trim(arguments.EntityKS.getColL()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.EntityKS.getColL())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.EntityKS.getColI()) NEQ "" AND trim(arguments.EntityKS.getColI()) NEQ "@@" AND trim(arguments.EntityKS.getColI()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.EntityKS.getColI())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.EntityKS.getColA()) NEQ "" AND trim(arguments.EntityKS.getColA()) NEQ "@@" AND trim(arguments.EntityKS.getColA()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.EntityKS.getColA())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(arguments.EntityKS.getColC()) NEQ "" AND trim(arguments.EntityKS.getColC()) NEQ "@@" AND trim(arguments.EntityKS.getColC()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.EntityKS.getColC())#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(arguments.EntityKS.getActive())#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(arguments.EntityKS.getInactiveCode()))>						
						<cfqueryparam value="#trim(arguments.EntityKS.getInactiveCode())#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS EntityKSID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.EntityKS.setEntityKSID(qCreateEntityKS.EntityKSID);
		</cfscript>
		
		<cfreturn arguments.EntityKS />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="void">
		
		<cfargument name="EntityKS" type="com.model.EntityKS" required="true" />
				
		<cfset var qGetEntityKS = "" />
				
		<cfset qGetEntityKS = getEntityKSByID(trim(arguments.EntityKS.getEntityKSID())) />
				
		<cfif qGetEntityKS.Recordcount GT 0>	

			<!-------------------------------------------------------------------------------------->
			<!--- Initialize the OBJ with the current values from DB.                            --->
			<!-------------------------------------------------------------------------------------->			
			<cfif qGetEntityKS.recordCount>
				<cfset variables.qRow = QueryToStruct(qGetEntityKS, 1)>
				<cfset arguments.EntityKS.init(argumentCollection=variables.qRow)>
			</cfif>	
				
		</cfif>	
		
	</cffunction>		
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function update a record.    -private use save                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="update" output="false" access="private" returntype="any">
				
		<cfargument name="EntityKS" required="true" type="com.model.EntityKS" />
		<cfset var qUpdateEntityKS = "" />
		<cfset var boolSuccess = true />
			
		<cftry>
		
			<cfquery name="qUpdateEntityKS" datasource="#variables.instance.configBean.getDSN().client#">
				UPDATE entityks  SET
					DateModified =	<cfqueryparam value="#trim(CreateODBCDateTIME(NOW()))#" cfsqltype="CF_SQL_TIMESTAMP" />,
					
					ColM =	
					<cfif trim(arguments.EntityKS.getColM()) NEQ "" AND trim(arguments.EntityKS.getColM()) NEQ "@@" AND trim(arguments.EntityKS.getColM()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.EntityKS.getColM())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ColE =	
					<cfif trim(arguments.EntityKS.getColE()) NEQ "" AND trim(arguments.EntityKS.getColE()) NEQ "@@" AND trim(arguments.EntityKS.getColE()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.EntityKS.getColE())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ColL =	
					<cfif trim(arguments.EntityKS.getColL()) NEQ "" AND trim(arguments.EntityKS.getColL()) NEQ "@@" AND trim(arguments.EntityKS.getColL()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.EntityKS.getColL())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ColI =	
					<cfif trim(arguments.EntityKS.getColI()) NEQ "" AND trim(arguments.EntityKS.getColI()) NEQ "@@" AND trim(arguments.EntityKS.getColI()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.EntityKS.getColI())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ColA =	
					<cfif trim(arguments.EntityKS.getColA()) NEQ "" AND trim(arguments.EntityKS.getColA()) NEQ "@@" AND trim(arguments.EntityKS.getColA()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.EntityKS.getColA())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ColC =	
					<cfif trim(arguments.EntityKS.getColC()) NEQ "" AND trim(arguments.EntityKS.getColC()) NEQ "@@" AND trim(arguments.EntityKS.getColC()) NEQ "NULL">						
						<cfqueryparam value="#trim(arguments.EntityKS.getColC())#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Active =						
						<cfqueryparam value="#trim(arguments.EntityKS.getActive())#" cfsqltype="CF_SQL_VARCHAR" />,
					
					InactiveCode =				
					<cfif IsNumeric(trim(arguments.EntityKS.getInactiveCode()))>						
						<cfqueryparam value="#trim(arguments.EntityKS.getInactiveCode())#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>					
				WHERE EntityKSID = <cfqueryparam value="#trim(arguments.EntityKS.getEntityKSID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">		
				<cfset boolSuccess = false />
			</cfcatch>
		
		</cftry>
		
		<cfreturn boolSuccess />
		
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="EntityKSID" required="true" type="String" />
		
		<cfset var qDeleteEntityKS = "">

		<cfquery name="qDeleteEntityKS" datasource="#variables.instance.configBean.getDSN().client#" result="status">
			DELETE
			FROM entityks
			WHERE EntityKSID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.EntityKSID)#" /> 
		</cfquery>

	</cffunction>



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEntityKSByID" output="false" access="public" returntype="query">
		
		<cfargument name="EntityKSID" required="yes" type="numeric" />		
		
		<cfset var qGetEntityKS = "" />		
	
		<cfquery name="qGetEntityKS" datasource="#variables.instance.configBean.getDSN().client#">
	  		SELECT EntityKSID,ColM,ColE,ColL,ColI,ColA,ColC,Active,InactiveCode,DateCreated,DateModified
			FROM entityks  
			WHERE EntityKSID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.EntityKSID)#" /> 
		</cfquery>
		
		<cfreturn qGetEntityKS>
		
	</cffunction>	
	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GATEWAY PUBLIC METHODS                                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAllEntityKSs" access="public" output="false" hint="I run a query of all EntityKSs within the database table.">
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />							
		<cfreturn filterAllEntityKSs(arguments.filter) />	
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- GATEWAY PRIVATE METHODS                                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="filterAllEntityKSs" returntype="any" access="public" output="false" hint="I run a query and will return all EntityKS records. If a filter has been supplied, I will refine the search using the filter information sent to me.">
					
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />
			
			<cfset var qSearch = "" />
		
			<cfquery name="qSearch"	 datasource="#variables.instance.configBean.getDSN().client#">
				SELECT EntityKSID,ColM,ColE,ColL,ColI,ColA,ColC,Active,InactiveCode,DateCreated,DateModified
				FROM entityks
				WHERE 1 = 1
				<cfif NOT structIsEmpty(arguments.filter)>				
					<cfif structKeyExists(arguments.filter, "EntityKSID")>				
						AND EntityKSID IN(#arguments.filter.EntityKSID#)
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ColM")>				
						AND ColM = <cfqueryparam value="#arguments.filter.ColM#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ColE")>				
						AND ColE = <cfqueryparam value="#arguments.filter.ColE#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ColL")>				
						AND ColL = <cfqueryparam value="#arguments.filter.ColL#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ColI")>				
						AND ColI = <cfqueryparam value="#arguments.filter.ColI#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ColA")>				
						AND ColA = <cfqueryparam value="#arguments.filter.ColA#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ColC")>				
						AND ColC = <cfqueryparam value="#arguments.filter.ColC#" cfsqltype="CF_SQL_VARCHAR" />
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

		<cffunction name="getColA" returntype="any" access="public" output="false" hint="I run a query and will return col A.">
			<cfquery name="getColA" datasource="#trim(variables.instance.configBean.getDSN().master)#"> 
				SELECT ColA
				FROM entityks 
				Where EntityKSID = 9
			</cfquery>				
			<cfreturn getColB.ColA />
		</cffunction>
		
		<cffunction name="getColB" returntype="any" access="public" output="false" hint="I run a query and will return col B.">
			<cfquery name="getColB" datasource="#trim(variables.instance.configBean.getDSN().master)#"> 
				SELECT ColI
				FROM entityks 
				Where EntityKSID = 9
			</cfquery>				
			<cfreturn getColB.ColI />
		</cffunction>

		<cffunction name="getColC" returntype="any" access="public" output="false" hint="I run a query and will return col C.">
			<cfquery name="getColC" datasource="#trim(variables.instance.configBean.getDSN().master)#"> 	
				SELECT ColL
				FROM entityks
				Where EntityKSID = 12
			</cfquery>
			<cfreturn getColC.ColL />
		</cffunction>

		<cffunction name="getColD" returntype="any" access="public" output="false" hint="I run a query and will return col D.">
			<cfquery name="getColD" datasource="#trim(variables.instance.configBean.getDSN().master)#"> 					
				SELECT ColE
				FROM entityks 
				Where EntityKSID = 5
			</cfquery>
			<cfreturn getColD.ColE />
		</cffunction>

		<cffunction name="getColE" returntype="any" access="public" output="false" hint="I run a query and will return col E.">
			<cfquery name="getColE" datasource="#trim(variables.instance.configBean.getDSN().master)#"> 					
				SELECT ColM
				FROM entityks
				Where EntityKSID = 14
			</cfquery>
			<cfreturn getColE.ColM />
		</cffunction>

		<cffunction name="getColF" returntype="any" access="public" output="false" hint="I run a query and will return col F.">				
			<cfquery name="getColF" datasource="#trim(variables.instance.configBean.getDSN().master)#"> 						
				SELECT ColC
				FROM entityks
				Where EntityKSID = 54
			</cfquery>	
			<cfreturn getColF.ColC />
		</cffunction>
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


