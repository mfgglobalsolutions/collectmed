 	

<cfcomponent displayname="FileSVC" output="false" hint="I am the FileSVC Class used to interact with the File package.">

		

	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.FileDAO = '' />
	<cfset variables.instance.FileGateway = '' />	

	<cffunction name="init" access="public"	output="false" returntype="any" hint="I am the constructor method for the FileSVC Class.">
			
		<cfargument name="FileDAO" required="true" type="Components.service.FileDAO" hint="I am the DAO object." />
		<cfargument name="FileGateway" required="true" type="Components.service.FileGateway" hint="I am the Gateway object." />
			
			<cfset StructAppend(variables.instance, arguments) />
			
		<cfreturn this />
		
	</cffunction>	

	
	
	<!-------------------------------------------------------------------------------------->
	<!--- DAO METHODS                                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="save" access="public" output="false" hint="I save or update an File into the database.">
		<cfargument name="File" required="true" type="cmComponents.com.common.model.File" hint="I am the File bean." />
		<cfreturn variables.instance.FileDAO.save(arguments.File) />
	</cffunction>
	
	<cffunction name="read" access="public" output="false" hint="I obtain details for a specific File from the database.">
		<cfargument name="File" required="true" type="cmComponents.com.common.model.File" hint="I am the File you wish to search for." />
		<cfreturn variables.instance.FileDAO.read(arguments.File) />
	</cffunction>
	
	<cffunction name="delete" access="public" output="false" hint="I delete a specific File from the database.">
		<cfargument name="FileID" required="true" type="numeric" hint="I am the ID of the File you wish to delete." />
		<cfreturn variables.instance.FileDAO.delete(arguments.FileID) />
	</cffunction>	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GATEWAY METHODS                                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAllFiles" access="public" output="false" hint="I run a query of all Files within the database table.">		
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />		
		<cfreturn variables.instance.FileGateway.getAllFiles(arguments.filter) />		
	</cffunction>
	
	<cffunction name="filterByFileID" access="public" output="false" hint="I run a query of all Files within the database table based upon a filter.">
					
        <cfargument name="FileID" required="true" type="string" hint="I am the FileID to filter." />
		       
       	<cfset strFilter = StructNew() />
		<cfset strFilter.FileID = arguments.FileID />		
		
		<cfreturn variables.instance.FileGateway.filterAllFiles(strFilter) />
		
    </cffunction>	



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
	
		
	
</cfcomponent>


