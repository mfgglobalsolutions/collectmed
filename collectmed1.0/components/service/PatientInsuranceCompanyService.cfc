 	

<cfcomponent displayname="PatientInsuranceCompanySVC" output="false" hint="I am the PatientInsuranceCompanySVC Class used to interact with the PatientInsuranceCompany package.">

		

	
	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.PatientInsuranceCompanyDAO = '' />
	<cfset variables.instance.PatientInsuranceCompanyGateway = '' />	

	<cffunction name="init" access="public"	output="false" returntype="any" hint="I am the constructor method for the PatientInsuranceCompanySVC Class.">
			
		<cfargument name="PatientInsuranceCompanyDAO" required="true" type="Components.service.PatientInsuranceCompanyDAO" hint="I am the DAO object." />
		<cfargument name="PatientInsuranceCompanyGateway" required="true" type="Components.service.PatientInsuranceCompanyGateway" hint="I am the Gateway object." />
			
			<cfset StructAppend(variables.instance, arguments) />
			
		<cfreturn this />
		
	</cffunction>	

	
	
	<!-------------------------------------------------------------------------------------->
	<!--- DAO METHODS                                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="save" access="public" output="false" hint="I save or update an PatientInsuranceCompany into the database.">
		<cfargument name="PatientInsuranceCompany" required="true" type="cmComponents.com.common.model.PatientInsuranceCompany" hint="I am the PatientInsuranceCompany bean." />
		<cfreturn variables.instance.PatientInsuranceCompanyDAO.save(arguments.PatientInsuranceCompany) />
	</cffunction>
	
	<cffunction name="read" access="public" output="false" hint="I obtain details for a specific PatientInsuranceCompany from the database.">
		<cfargument name="PatientInsuranceCompany" required="true" type="cmComponents.com.common.model.PatientInsuranceCompany" hint="I am the PatientInsuranceCompany you wish to search for." />
		<cfreturn variables.instance.PatientInsuranceCompanyDAO.read(arguments.PatientInsuranceCompany) />
	</cffunction>
	
	<cffunction name="delete" access="public" output="false" hint="I delete a specific PatientInsuranceCompany from the database.">
		<cfargument name="PatientInsuranceCompanyID" required="true" type="numeric" hint="I am the ID of the PatientInsuranceCompany you wish to delete." />
		<cfreturn variables.instance.PatientInsuranceCompanyDAO.delete(arguments.PatientInsuranceCompanyID) />
	</cffunction>	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GATEWAY METHODS                                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAllPatientInsuranceCompanys" access="public" output="false" hint="I run a query of all PatientInsuranceCompanys within the database table.">		
		<cfargument name="filter" required="false" type="Struct" default="#structNew()#" hint="I am a structure used to filter the query." />		
		<cfreturn variables.instance.PatientInsuranceCompanyGateway.getAllPatientInsuranceCompanys(arguments.filter) />		
	</cffunction>
	
	<cffunction name="filterByPatientInsuranceCompanyID" access="public" output="false" hint="I run a query of all PatientInsuranceCompanys within the database table based upon a filter.">
					
        <cfargument name="PatientInsuranceCompanyID" required="true" type="string" hint="I am the PatientInsuranceCompanyID to filter." />
		       
       	<cfset strFilter = StructNew() />
		<cfset strFilter.PatientInsuranceCompanyID = arguments.PatientInsuranceCompanyID />		
		
		<cfreturn variables.instance.PatientInsuranceCompanyGateway.filterAllPatientInsuranceCompanys(strFilter) />
		
    </cffunction>	



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- AUTOGENERATE IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR THIS TABLE AND KNOW THAT THEY   --->
<!--- WILL BE COPIED WHEN AUTOGENERATE IS RERUN.                                                                             --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		<!-------------------------------------------------------------------------------------->
		<!--- This function will be called to get the patients Insurance companies.          --->
		<!-------------------------------------------------------------------------------------->	
		<cffunction name="getPatientInsuranceCompanies" hint="This function will be called to get the patients Insurance companies.">		
			<cfargument name="datasource" required="yes" type="string">
			<cfargument name="patientID" required="yes" type="numeric">
			<cfargument name="insuranceCompanyID" required="false" default="" type="string">
								
			<cftry>
			
				<cfquery name="getInsComs" datasource="#trim(arguments.datasource)#">
					SELECT pic.recordID, pic.InsuranceCompanyID, pic.PrimSecTer, pic.PolicyNumber, pic.PolicyHoldersFirstName, pic.PolicyHoldersLastName, pic.PolicyHoldersMiddleInitial, pic.PolicyHoldersDOB, pic.PolicyHoldersSex, pic.PolicyHoldersAddressLine1, pic.PolicyHoldersAddressLine2, pic.PolicyHoldersCity, pic.PolicyHoldersStateID, pic.PolicyHoldersZipCode, pic.PolicyHoldersPhone, pic.PolicyHoldersPhoneExtension, pic.PolicyHoldersEmployerSchoolName, pic.PolicyHoldersEffectiveDateFrom, pic.PolicyHoldersEffectiveDateTo, pic.GroupNumber, pic.GroupName, pic.Relationship, pic.Deductible, pic.PayPercentage, ic.InsuranceCompanyName
					FROM patientinsurancecompany pic
					INNER JOIN insurancecompany ic ON pic.InsuranceCompanyID = ic.InsuranceCompanyID
					WHERE pic.patientID = <cfqueryparam value="#trim(arguments.patientID)#" cfsqltype="CF_SQL_VARCHAR" />
					<cfif arguments.insuranceCompanyID>
						AND pic.insuranceCompanyID = <cfqueryparam value="#trim(arguments.insuranceCompanyID)#" cfsqltype="CF_SQL_INTEGER" />
					</cfif>
					Order By pic.PrimSecTer 
				</cfquery>			
				
				<cfreturn getInsComs>
							
				
				<cfcatch type="Any">											
					<cfthrow type="#cfcatch.type#" message="#cfcatch.message#" detail="#cfcatch.detail#">								
				</cfcatch>
				
			</cftry>		
			
		</cffunction>
	
	<!---End_Custom_Functions--->		
	
		
	
</cfcomponent>




