

<cfcomponent>

	<cffunction name="wsDeactivatePatientInsuranceCompany" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="Patient ID" required="false" default="">
		<cfargument name="Data3" type="string" hint="Insurance Company ID" required="false" default="">
		<cfargument name="Data4" type="string" hint="Record ID" required="false" default="">
		
		<cfset ClientID = Data1>
		<cfset PatientID = Data2>
		<cfset InsuranceCompanyID = Data3>
		<cfset RecordID = Data4>
				
				
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
						
			<cfinvoke 
				component="com.common.PatientInsuranceCompany" 
				method="DeactivatePatientInsuranceCompany" 
				clientID="#trim(ClientID)#"
				patientid="#trim(PatientID)#"
				recordid="#trim(recordID)#"
				insurancecompanyid="#trim(InsuranceCompanyID)#"				
				returnvariable="truefalse">
									
			<cfif truefalse NEQ "">				
				<cfreturn truefalse>
			<cfelse>
				<cfreturn false>	
			</cfif>
								
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 

</cfcomponent>

	