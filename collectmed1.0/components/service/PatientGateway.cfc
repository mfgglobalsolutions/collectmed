 	

<cfcomponent displayname="PatientGateway" output="false" hint="I am the Patient Gateway Class.">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.datasource = '' />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the Patient Gateway Class.">
		<cfargument name="datasource" required="true" type="cmComponents.com.common.model.Datasource" hint="I am the datasource object." />
			<cfscript>
				variables.instance.datasource = arguments.datasource;
			</cfscript>
		<cfreturn this />
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- PUBLIC METHODS                                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAllPatients" access="public" output="false" hint="I run a query of all Patients within the database table.">
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />							
		<cfreturn filterAllPatients(arguments.filter) />	
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- PRIVATE METHODS                                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="filterAllPatients" access="package" output="false" hint="I run a query and will return all Patient records. If a filter has been supplied, I will refine the search using the filter information sent to me.">
					
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />
			
			<cfset var qSearch = "" />
		
			<cfquery name="qSearch"	 datasource="#variables.instance.datasource.getDSName()#">
				SELECT PatientID,EntityID,ClaimSubmitterIdentifier,NM1IdentificationCode9,AccountNumber,Active,InactiveCode,DateCreated,DateModified
				FROM patient
				WHERE 1 = 1
				<cfif NOT structIsEmpty(arguments.filter)>				
					<cfif structKeyExists(arguments.filter, "PatientID")>				
						AND PatientID IN(#arguments.filter.PatientID#)
					</cfif>				
					<cfif structKeyExists(arguments.filter, "EntityID")>				
						AND EntityID = <cfqueryparam value="#arguments.filter.EntityID#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "ClaimSubmitterIdentifier")>				
						AND ClaimSubmitterIdentifier = <cfqueryparam value="#arguments.filter.ClaimSubmitterIdentifier#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "NM1IdentificationCode9")>				
						AND NM1IdentificationCode9 = <cfqueryparam value="#arguments.filter.NM1IdentificationCode9#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "AccountNumber")>				
						AND AccountNumber = <cfqueryparam value="#arguments.filter.AccountNumber#" cfsqltype="CF_SQL_VARCHAR" />
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



