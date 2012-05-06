 	

<cfcomponent displayname="VerificationPatientInsuranceSVC" output="false" hint="I am the VerificationPatientInsuranceSVC Class used to interact with the VerificationPatientInsurance package.">

		

	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.VerificationPatientInsuranceDAO = '' />
	<cfset variables.instance.VerificationPatientInsuranceGateway = '' />	

	<cffunction name="init" access="public"	output="false" returntype="any" hint="I am the constructor method for the VerificationPatientInsuranceSVC Class.">
			
		<cfargument name="VerificationPatientInsuranceDAO" required="true" type="Components.service.VerificationPatientInsuranceDAO" hint="I am the DAO object." />
		<cfargument name="VerificationPatientInsuranceGateway" required="true" type="Components.service.VerificationPatientInsuranceGateway" hint="I am the Gateway object." />
			
			<cfset StructAppend(variables.instance, arguments) />
			
		<cfreturn this />
		
	</cffunction>	

	
	
	<!-------------------------------------------------------------------------------------->
	<!--- DAO METHODS                                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="save" access="public" output="false" hint="I save or update an VerificationPatientInsurance into the database.">
		<cfargument name="VerificationPatientInsurance" required="true" type="cmComponents.com.common.model.VerificationPatientInsurance" hint="I am the VerificationPatientInsurance bean." />
		<cfreturn variables.instance.VerificationPatientInsuranceDAO.save(arguments.VerificationPatientInsurance) />
	</cffunction>
	
	<cffunction name="read" access="public" output="false" hint="I obtain details for a specific VerificationPatientInsurance from the database.">
		<cfargument name="VerificationPatientInsurance" required="true" type="cmComponents.com.common.model.VerificationPatientInsurance" hint="I am the VerificationPatientInsurance you wish to search for." />
		<cfreturn variables.instance.VerificationPatientInsuranceDAO.read(arguments.VerificationPatientInsurance) />
	</cffunction>
	
	<cffunction name="delete" access="public" output="false" hint="I delete a specific VerificationPatientInsurance from the database.">
		<cfargument name="VerificationPatientInsuranceID" required="true" type="numeric" hint="I am the ID of the VerificationPatientInsurance you wish to delete." />
		<cfreturn variables.instance.VerificationPatientInsuranceDAO.delete(arguments.VerificationPatientInsuranceID) />
	</cffunction>	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GATEWAY METHODS                                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAllVerificationPatientInsurances" access="public" output="false" hint="I run a query of all VerificationPatientInsurances within the database table.">		
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />		
		<cfreturn variables.instance.VerificationPatientInsuranceGateway.getAllVerificationPatientInsurances(arguments.filter) />		
	</cffunction>
	
	<cffunction name="filterByVerificationPatientInsuranceID" access="public" output="false" hint="I run a query of all VerificationPatientInsurances within the database table based upon a filter.">
					
        <cfargument name="VerificationPatientInsuranceID" required="true" type="string" hint="I am the VerificationPatientInsuranceID to filter." />
		       
       	<cfset strFilter = StructNew() />
		<cfset strFilter.VerificationPatientInsuranceID = arguments.VerificationPatientInsuranceID />		
		
		<cfreturn variables.instance.VerificationPatientInsuranceGateway.filterAllVerificationPatientInsurances(strFilter) />
		
    </cffunction>	



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
	
		
	
</cfcomponent>


