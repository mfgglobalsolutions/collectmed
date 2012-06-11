 	

<cfcomponent displayname="InsuranceCompanyGateway" output="false" hint="I am the InsuranceCompany Gateway Class.">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.datasource = '' />
	
	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the InsuranceCompany Gateway Class.">
		<cfargument name="datasource" required="true" type="cmComponents.com.common.model.Datasource" hint="I am the datasource object." />
			<cfscript>
				variables.instance.datasource = arguments.datasource;
			</cfscript>
		<cfreturn this />
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- PUBLIC METHODS                                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAllInsuranceCompanys" access="public" output="false" hint="I run a query of all InsuranceCompanys within the database table.">
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />							
		<cfreturn filterAllInsuranceCompanys(arguments.filter) />	
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- PRIVATE METHODS                                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="filterAllInsuranceCompanys" access="package" output="false" hint="I run a query and will return all InsuranceCompany records. If a filter has been supplied, I will refine the search using the filter information sent to me.">
					
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />
			
			<cfset var qSearch = "" />
		
			<cfquery name="qSearch"	 datasource="#variables.instance.datasource.getDSName()#">
				SELECT InsuranceCompanyID,ClientID,OCNANumber,InsuranceCompanyName,InsuranceCompanyDBA,EntityID,InsuranceCompanyURL,Active,InactiveCode,DateCreated,DateModified
				FROM insurancecompany
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
					<cfif structKeyExists(arguments.filter, "Active")>				
						AND Active = <cfqueryparam value="#arguments.filter.Active#" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "InactiveCode")>				
						AND InactiveCode = <cfqueryparam value="#arguments.filter.InactiveCode#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>				
					<cfif structKeyExists(arguments.filter, "DateCreated")>				
						AND DateCreated = <cfqueryparam value="#arguments.filter.DateCreated#" cfsqltype="CF_SQL_TIMESTAMP" />
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



