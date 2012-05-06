 	

<cfcomponent displayname="PatientSVC" output="false" hint="I am the PatientSVC Class used to interact with the Patient package.">

		

	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.PatientDAO = '' />
	<cfset variables.instance.PatientGateway = '' />	

	<cffunction name="init" access="public"	output="false" returntype="any" hint="I am the constructor method for the PatientSVC Class.">
			
		<cfargument name="PatientDAO" required="true" type="Components.service.PatientDAO" hint="I am the DAO object." />
		<cfargument name="PatientGateway" required="true" type="Components.service.PatientGateway" hint="I am the Gateway object." />
			
			<cfset StructAppend(variables.instance, arguments) />
			
		<cfreturn this />
		
	</cffunction>	

	
	
	<!-------------------------------------------------------------------------------------->
	<!--- DAO METHODS                                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="save" access="public" output="false" hint="I save or update an Patient into the database.">
		<cfargument name="Patient" required="true" type="cmComponents.com.common.model.Patient" hint="I am the Patient bean." />
		<cfreturn variables.instance.PatientDAO.save(arguments.Patient) />
	</cffunction>
	
	<cffunction name="read" access="public" output="false" hint="I obtain details for a specific Patient from the database.">
		<cfargument name="Patient" required="true" type="cmComponents.com.common.model.Patient" hint="I am the Patient you wish to search for." />
		<cfreturn variables.instance.PatientDAO.read(arguments.Patient) />
	</cffunction>
	
	<cffunction name="delete" access="public" output="false" hint="I delete a specific Patient from the database.">
		<cfargument name="PatientID" required="true" type="numeric" hint="I am the ID of the Patient you wish to delete." />
		<cfreturn variables.instance.PatientDAO.delete(arguments.PatientID) />
	</cffunction>	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GATEWAY METHODS                                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAllPatients" access="public" output="false" hint="I run a query of all Patients within the database table.">		
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />		
		<cfreturn variables.instance.PatientGateway.getAllPatients(arguments.filter) />		
	</cffunction>
	
	<cffunction name="filterByPatientID" access="public" output="false" hint="I run a query of all Patients within the database table based upon a filter.">
					
        <cfargument name="PatientID" required="true" type="string" hint="I am the PatientID to filter." />
		       
       	<cfset strFilter = StructNew() />
		<cfset strFilter.PatientID = arguments.PatientID />		
		
		<cfreturn variables.instance.PatientGateway.filterAllPatients(strFilter) />
		
    </cffunction>	



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
	
		
	
</cfcomponent>


