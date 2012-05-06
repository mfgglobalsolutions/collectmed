 	

<cfcomponent displayname="VerificationPatientInsuranceElectronicSVC" output="false" hint="I am the VerificationPatientInsuranceElectronicSVC Class used to interact with the VerificationPatientInsuranceElectronic package.">

		

	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.VerificationPatientInsuranceElectronicDAO = '' />
	<cfset variables.instance.VerificationPatientInsuranceElectronicGateway = '' />	

	<cffunction name="init" access="public"	output="false" returntype="any" hint="I am the constructor method for the VerificationPatientInsuranceElectronicSVC Class.">
			
		<cfargument name="VerificationPatientInsuranceElectronicDAO" required="true" type="Components.service.VerificationPatientInsuranceElectronicDAO" hint="I am the DAO object." />
		<cfargument name="VerificationPatientInsuranceElectronicGateway" required="true" type="Components.service.VerificationPatientInsuranceElectronicGateway" hint="I am the Gateway object." />
			
			<cfset StructAppend(variables.instance, arguments) />
			
		<cfreturn this />
		
	</cffunction>	

	
	
	<!-------------------------------------------------------------------------------------->
	<!--- DAO METHODS                                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="save" access="public" output="false" hint="I save or update an VerificationPatientInsuranceElectronic into the database.">
		<cfargument name="VerificationPatientInsuranceElectronic" required="true" type="cmComponents.com.common.model.VerificationPatientInsuranceElectronic" hint="I am the VerificationPatientInsuranceElectronic bean." />
		<cfreturn variables.instance.VerificationPatientInsuranceElectronicDAO.save(arguments.VerificationPatientInsuranceElectronic) />
	</cffunction>
	
	<cffunction name="read" access="public" output="false" hint="I obtain details for a specific VerificationPatientInsuranceElectronic from the database.">
		<cfargument name="VerificationPatientInsuranceElectronic" required="true" type="cmComponents.com.common.model.VerificationPatientInsuranceElectronic" hint="I am the VerificationPatientInsuranceElectronic you wish to search for." />
		<cfreturn variables.instance.VerificationPatientInsuranceElectronicDAO.read(arguments.VerificationPatientInsuranceElectronic) />
	</cffunction>
	
	<cffunction name="delete" access="public" output="false" hint="I delete a specific VerificationPatientInsuranceElectronic from the database.">
		<cfargument name="VerificationPatientInsuranceElectronicID" required="true" type="numeric" hint="I am the ID of the VerificationPatientInsuranceElectronic you wish to delete." />
		<cfreturn variables.instance.VerificationPatientInsuranceElectronicDAO.delete(arguments.VerificationPatientInsuranceElectronicID) />
	</cffunction>	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GATEWAY METHODS                                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAllVerificationPatientInsuranceElectronics" access="public" output="false" hint="I run a query of all VerificationPatientInsuranceElectronics within the database table.">		
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />				
		<cfreturn variables.instance.VerificationPatientInsuranceElectronicGateway.getAllVerificationPatientInsuranceElectronics(arguments.filter) />		
	</cffunction>
	
	<cffunction name="filterByVerificationPatientInsuranceElectronicID" access="public" output="false" hint="I run a query of all VerificationPatientInsuranceElectronics within the database table based upon a filter.">
					
        <cfargument name="VerificationPatientInsuranceElectronicID" required="true" type="string" hint="I am the VerificationPatientInsuranceElectronicID to filter." />
		       
       	<cfset strFilter = StructNew() />
		<cfset strFilter.VerificationPatientInsuranceElectronicID = arguments.VerificationPatientInsuranceElectronicID />		
		
		<cfreturn variables.instance.VerificationPatientInsuranceElectronicGateway.filterAllVerificationPatientInsuranceElectronics(strFilter) />
		
    </cffunction>	



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
	
		
	
</cfcomponent>


