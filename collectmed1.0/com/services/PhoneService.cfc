 	

<cfcomponent displayname="PhoneSVC" output="false" hint="I am the PhoneSVC Class used to interact with the Phone package.">
	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.systemDAO = '' />

	<cffunction name="init" access="public"	output="false" returntype="any" hint="I am the constructor method for the PhoneSVC Class.">			
		<cfargument name="systemDAO" required="true" type="com.persistence.SystemDAO" hint="I am the systemDAO object." />
			
		<cfset StructAppend(variables.instance, arguments) />
			
		<cfreturn this />
		
	</cffunction>	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- DAO METHODS                                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="save" access="public" output="false" hint="I save or update an Phone into the database.">
		<cfargument name="Phone" required="true" type="com.model.Phone" hint="I am the Phone bean." />
		<cfreturn variables.instance.systemDAO.getPhoneDAO().save(arguments.Phone) />
	</cffunction>
	
	<cffunction name="read" access="public" output="false" hint="I obtain details for a specific Phone from the database.">
		<cfargument name="Phone" required="true" type="com.model.Phone" hint="I am the Phone you wish to search for." />
		<cfreturn variables.instance.systemDAO.getPhoneDAO().read(arguments.Phone) />
	</cffunction>
	
	<cffunction name="delete" access="public" output="false" hint="I delete a specific Phone from the database.">
		<cfargument name="PhoneID" required="true" type="numeric" hint="I am the ID of the Phone you wish to delete." />
		<cfreturn variables.instance.systemDAO.getPhoneDAO().delete(arguments.PhoneID) />
	</cffunction>	
	
	<cffunction name="getAllPhones" access="public" output="false" hint="I run a query of all Phones within the database table.">		
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />		
		<cfreturn variables.instance.systemDAO.getPhoneDAO().getAllPhones(arguments.filter) />		
	</cffunction>
	
	<cffunction name="filterByPhoneID" access="public" output="false" hint="I run a query of all Phones within the database table based upon a filter.">
        <cfargument name="PhoneID" required="true" type="string" hint="I am the PhoneID to filter." />
		       
       	<cfset strFilter = StructNew() />
		<cfset strFilter.PhoneID = arguments.PhoneID />		
		
		<cfreturn variables.instance.systemDAO.getPhoneDAO().filterAllPhones(strFilter) />
		
    </cffunction>	



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
	
		
	
</cfcomponent>


