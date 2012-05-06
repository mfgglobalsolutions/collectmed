 	

<cfcomponent displayname="AddressSVC" output="false" hint="I am the AddressSVC Class used to interact with the Address package.">
	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.systemDAO = '' />

	<cffunction name="init" access="public"	output="false" returntype="any" hint="I am the constructor method for the AddressSVC Class.">			
		<cfargument name="systemDAO" required="true" type="com.persistence.SystemDAO" hint="I am the systemDAO object." />
			
		<cfset StructAppend(variables.instance, arguments) />
			
		<cfreturn this />
		
	</cffunction>	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- DAO METHODS                                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="save" access="public" output="false" hint="I save or update an Address into the database.">
		<cfargument name="Address" required="true" type="com.model.Address" hint="I am the Address bean." />
		<cfreturn variables.instance.systemDAO.getAddressDAO().save(arguments.Address) />
	</cffunction>
	
	<cffunction name="read" access="public" output="false" hint="I obtain details for a specific Address from the database.">
		<cfargument name="Address" required="true" type="com.model.Address" hint="I am the Address you wish to search for." />
		<cfreturn variables.instance.systemDAO.getAddressDAO().read(arguments.Address) />
	</cffunction>
	
	<cffunction name="delete" access="public" output="false" hint="I delete a specific Address from the database.">
		<cfargument name="AddressID" required="true" type="numeric" hint="I am the ID of the Address you wish to delete." />
		<cfreturn variables.instance.systemDAO.getAddressDAO().delete(arguments.AddressID) />
	</cffunction>	
	
	<cffunction name="getAllAddresss" access="public" output="false" hint="I run a query of all Addresss within the database table.">		
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />		
		<cfreturn variables.instance.systemDAO.getAddressDAO().getAllAddresss(arguments.filter) />		
	</cffunction>
	
	<cffunction name="filterByAddressID" access="public" output="false" hint="I run a query of all Addresss within the database table based upon a filter.">
        <cfargument name="AddressID" required="true" type="string" hint="I am the AddressID to filter." />
		       
       	<cfset strFilter = StructNew() />
		<cfset strFilter.AddressID = arguments.AddressID />		
		
		<cfreturn variables.instance.systemDAO.getAddressDAO().filterAllAddresss(strFilter) />
		
    </cffunction>	



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
	
		
	
</cfcomponent>


