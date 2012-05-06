 	

<cfcomponent displayname="InsuranceCompanySVC" output="false" hint="I am the InsuranceCompanySVC Class used to interact with the InsuranceCompany package.">
	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.systemDAO = '' />

	<cffunction name="init" access="public"	output="false" returntype="any" hint="I am the constructor method for the InsuranceCompanySVC Class.">			
		<cfargument name="systemDAO" required="true" type="com.persistence.SystemDAO" hint="I am the systemDAO object." />
			
		<cfset StructAppend(variables.instance, arguments) />
			
		<cfreturn this />
		
	</cffunction>	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- DAO METHODS                                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="save" access="public" output="false" hint="I save or update an InsuranceCompany into the database.">
		<cfargument name="InsuranceCompany" required="true" type="com.model.InsuranceCompany" hint="I am the InsuranceCompany bean." />
		<cfreturn variables.instance.systemDAO.getInsuranceCompanyDAO().save(arguments.InsuranceCompany) />
	</cffunction>
	
	<cffunction name="read" access="public" output="false" hint="I obtain details for a specific InsuranceCompany from the database.">
		<cfargument name="InsuranceCompany" required="true" type="com.model.InsuranceCompany" hint="I am the InsuranceCompany you wish to search for." />
		<cfreturn variables.instance.systemDAO.getInsuranceCompanyDAO().read(arguments.InsuranceCompany) />
	</cffunction>
	
	<cffunction name="delete" access="public" output="false" hint="I delete a specific InsuranceCompany from the database.">
		<cfargument name="InsuranceCompanyID" required="true" type="numeric" hint="I am the ID of the InsuranceCompany you wish to delete." />
		<cfreturn variables.instance.systemDAO.getInsuranceCompanyDAO().delete(arguments.InsuranceCompanyID) />
	</cffunction>	
	
	<cffunction name="getAllInsuranceCompanys" access="public" output="false" hint="I run a query of all InsuranceCompanys within the database table.">		
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />		
		<cfreturn variables.instance.systemDAO.getInsuranceCompanyDAO().getAllInsuranceCompanys(arguments.filter) />		
	</cffunction>
	
	<cffunction name="filterByInsuranceCompanyID" access="public" output="false" hint="I run a query of all InsuranceCompanys within the database table based upon a filter.">
        <cfargument name="InsuranceCompanyID" required="true" type="string" hint="I am the InsuranceCompanyID to filter." />
		       
       	<cfset strFilter = StructNew() />
		<cfset strFilter.InsuranceCompanyID = arguments.InsuranceCompanyID />		
		
		<cfreturn variables.instance.systemDAO.getInsuranceCompanyDAO().filterAllInsuranceCompanys(strFilter) />
		
    </cffunction>	



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
	
		
	
</cfcomponent>


