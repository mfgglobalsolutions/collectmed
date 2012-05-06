 	

<cfcomponent displayname="RouteSVC" output="false" hint="I am the RouteSVC Class used to interact with the Route package.">

		

	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.RouteDAO = '' />
	<cfset variables.instance.RouteGateway = '' />	

	<cffunction name="init" access="public"	output="false" returntype="any" hint="I am the constructor method for the RouteSVC Class.">
			
		<cfargument name="RouteDAO" required="true" type="Components.service.RouteDAO" hint="I am the DAO object." />
		<cfargument name="RouteGateway" required="true" type="Components.service.RouteGateway" hint="I am the Gateway object." />
			
			<cfset StructAppend(variables.instance, arguments) />
			
		<cfreturn this />
		
	</cffunction>	

	
	
	<!-------------------------------------------------------------------------------------->
	<!--- DAO METHODS                                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="save" access="public" output="false" hint="I save or update an Route into the database.">
		<cfargument name="Route" required="true" type="cmComponents.com.common.model.Route" hint="I am the Route bean." />
		<cfreturn variables.instance.RouteDAO.save(arguments.Route) />
	</cffunction>
	
	<cffunction name="read" access="public" output="false" hint="I obtain details for a specific Route from the database.">
		<cfargument name="Route" required="true" type="cmComponents.com.common.model.Route" hint="I am the Route you wish to search for." />
		<cfreturn variables.instance.RouteDAO.read(arguments.Route) />
	</cffunction>
	
	<cffunction name="delete" access="public" output="false" hint="I delete a specific Route from the database.">
		<cfargument name="RouteID" required="true" type="numeric" hint="I am the ID of the Route you wish to delete." />
		<cfreturn variables.instance.RouteDAO.delete(arguments.RouteID) />
	</cffunction>	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GATEWAY METHODS                                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAllRoutes" access="public" output="false" hint="I run a query of all Routes within the database table.">		
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />		
		<cfreturn variables.instance.RouteGateway.getAllRoutes(arguments.filter) />		
	</cffunction>
	
	<cffunction name="filterByRouteID" access="public" output="false" hint="I run a query of all Routes within the database table based upon a filter.">
					
        <cfargument name="RouteID" required="true" type="string" hint="I am the RouteID to filter." />
		       
       	<cfset strFilter = StructNew() />
		<cfset strFilter.RouteID = arguments.RouteID />		
		
		<cfreturn variables.instance.RouteGateway.filterAllRoutes(strFilter) />
		
    </cffunction>	



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
	
		
	
</cfcomponent>


