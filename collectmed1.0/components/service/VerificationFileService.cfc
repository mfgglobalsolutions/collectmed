 	

<cfcomponent displayname="VerificationFileSVC" output="false" hint="I am the VerificationFileSVC Class used to interact with the VerificationFile package.">

		

	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.VerificationFileDAO = '' />
	<cfset variables.instance.VerificationFileGateway = '' />	

	<cffunction name="init" access="public"	output="false" returntype="any" hint="I am the constructor method for the VerificationFileSVC Class.">
			
		<cfargument name="VerificationFileDAO" required="true" type="Components.service.VerificationFileDAO" hint="I am the DAO object." />
		<cfargument name="VerificationFileGateway" required="true" type="Components.service.VerificationFileGateway" hint="I am the Gateway object." />
			
			<cfset StructAppend(variables.instance, arguments) />
			
		<cfreturn this />
		
	</cffunction>	

	
	
	<!-------------------------------------------------------------------------------------->
	<!--- DAO METHODS                                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="save" access="public" output="false" hint="I save or update an VerificationFile into the database.">
		<cfargument name="VerificationFile" required="true" type="cmComponents.com.common.model.VerificationFile" hint="I am the VerificationFile bean." />
		<cfreturn variables.instance.VerificationFileDAO.save(arguments.VerificationFile) />
	</cffunction>
	
	<cffunction name="read" access="public" output="false" hint="I obtain details for a specific VerificationFile from the database.">
		<cfargument name="VerificationFile" required="true" type="cmComponents.com.common.model.VerificationFile" hint="I am the VerificationFile you wish to search for." />
		<cfreturn variables.instance.VerificationFileDAO.read(arguments.VerificationFile) />
	</cffunction>
	
	<cffunction name="delete" access="public" output="false" hint="I delete a specific VerificationFile from the database.">
		<cfargument name="VerificationFileID" required="true" type="numeric" hint="I am the ID of the VerificationFile you wish to delete." />
		<cfreturn variables.instance.VerificationFileDAO.delete(arguments.VerificationFileID) />
	</cffunction>	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GATEWAY METHODS                                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAllVerificationFiles" access="public" output="false" hint="I run a query of all VerificationFiles within the database table.">		
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />		
		<cfreturn variables.instance.VerificationFileGateway.getAllVerificationFiles(arguments.filter) />		
	</cffunction>
	
	<cffunction name="filterByVerificationFileID" access="public" output="false" hint="I run a query of all VerificationFiles within the database table based upon a filter.">
					
        <cfargument name="VerificationFileID" required="true" type="string" hint="I am the VerificationFileID to filter." />
		       
       	<cfset strFilter = StructNew() />
		<cfset strFilter.VerificationFileID = arguments.VerificationFileID />		
		
		<cfreturn variables.instance.VerificationFileGateway.filterAllVerificationFiles(strFilter) />
		
    </cffunction>	



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
	
		
	
</cfcomponent>


