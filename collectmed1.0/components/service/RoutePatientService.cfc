 	

<cfcomponent displayname="RoutePatientSVC" output="false" hint="I am the RoutePatientSVC Class used to interact with the RoutePatient package.">

		

	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.RoutePatientDAO = '' />
	<cfset variables.instance.RoutePatientGateway = '' />	

	<cffunction name="init" access="public"	output="false" returntype="any" hint="I am the constructor method for the RoutePatientSVC Class.">
			
		<cfargument name="RoutePatientDAO" required="true" type="Components.service.RoutePatientDAO" hint="I am the DAO object." />
		<cfargument name="RoutePatientGateway" required="true" type="Components.service.RoutePatientGateway" hint="I am the Gateway object." />
			
			<cfset StructAppend(variables.instance, arguments) />
			
		<cfreturn this />
		
	</cffunction>	

	
	
	<!-------------------------------------------------------------------------------------->
	<!--- DAO METHODS                                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="save" access="public" output="false" hint="I save or update an RoutePatient into the database.">
		<cfargument name="RoutePatient" required="true" type="cmComponents.com.common.model.RoutePatient" hint="I am the RoutePatient bean." />
		<cfreturn variables.instance.RoutePatientDAO.save(arguments.RoutePatient) />
	</cffunction>
	
	<cffunction name="read" access="public" output="false" hint="I obtain details for a specific RoutePatient from the database.">
		<cfargument name="RoutePatient" required="true" type="cmComponents.com.common.model.RoutePatient" hint="I am the RoutePatient you wish to search for." />
		<cfreturn variables.instance.RoutePatientDAO.read(arguments.RoutePatient) />
	</cffunction>
	
	<cffunction name="delete" access="public" output="false" hint="I delete a specific RoutePatient from the database.">
		<cfargument name="RoutePatientID" required="true" type="numeric" hint="I am the ID of the RoutePatient you wish to delete." />
		<cfreturn variables.instance.RoutePatientDAO.delete(arguments.RoutePatientID) />
	</cffunction>	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GATEWAY METHODS                                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAllRoutePatients" access="public" output="false" hint="I run a query of all RoutePatients within the database table.">		
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />		
		<cfreturn variables.instance.RoutePatientGateway.getAllRoutePatients(arguments.filter) />		
	</cffunction>
	
	<cffunction name="filterByRoutePatientID" access="public" output="false" hint="I run a query of all RoutePatients within the database table based upon a filter.">
					
        <cfargument name="RoutePatientID" required="true" type="string" hint="I am the RoutePatientID to filter." />
		       
       	<cfset strFilter = StructNew() />
		<cfset strFilter.RoutePatientID = arguments.RoutePatientID />		
		
		<cfreturn variables.instance.RoutePatientGateway.filterAllRoutePatients(strFilter) />
		
    </cffunction>	



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
	
		
	
</cfcomponent>


