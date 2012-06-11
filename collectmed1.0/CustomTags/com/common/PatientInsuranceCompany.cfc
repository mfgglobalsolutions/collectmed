

<cfcomponent extends="com.common.db.PatientInsuranceCompanyIO">		
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to Deactivate Patient Insurance Company.          --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="DeactivatePatientInsuranceCompany" returntype="string">		
		
		<cfargument name="clientID" required="Yes" type="numeric">		
		<cfargument name="PatientID" required="yes">
		<cfargument name="InsuranceCompanyID" required="yes">
		<cfargument name="recordID" required="yes">
							
		<cftry>			
			
			<cfif IsNumeric(InsuranceCompanyID) OR IsNumeric(recordID)>
						
				<cfquery name="DeactivatePatientInsuranceCompany" datasource="PAClient_#trim(ClientID)#">
					UPDATE patientinsurancecompany
					SET Active = 0, PrimSecTer = NULL
					WHERE PatientID = #trim(patientID)# AND <cfif IsNumeric(InsuranceCompanyID)>InsuranceCompanyID = #trim(InsuranceCompanyID)#<cfelseif IsNumeric(recordID)>recordID = #trim(recordID)#</cfif>
				</cfquery>
						
				<cfset reorderPrimSecTer(clientID: trim(ClientID), patientID: trim(patientID))>
									
			</cfif>	
						
			<cfreturn true>
						
			<cfcatch type="Any">
			
				<cfthrow message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">			
				
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
		
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to reorder PrimSecTer.                            --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="reorderPrimSecTer" returntype="string">		
		
		<cfargument name="clientID" required="Yes" type="numeric">		
		<cfargument name="PatientID" required="yes">		
							
		<cftry>			
			
			<cfquery name="getPatientInsuranceCompanies" datasource="PAClient_#trim(ClientID)#">
				SELECT recordID, PrimSecTer 
				FROM patientinsurancecompany	 
				WHERE PatientID = #trim(patientID)# AND Active = 1 AND PrimSecTer IS NOT NULL	
				ORDER BY PrimSecTer
			</cfquery>
			
			<cfloop query="getPatientInsuranceCompanies">	
				<cfquery name="DeactivatePatientInsuranceCompany" datasource="PAClient_#trim(ClientID)#">
					UPDATE patientinsurancecompany
					SET PrimSecTer = #trim(CurrentRow)#
					WHERE recordID = #trim(recordID)#
				</cfquery>
			</cfloop>
						
			<cfreturn true>
						
			<cfcatch type="Any">
			
				<cfthrow message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">			
				
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
		
		
</cfcomponent>
	
		
		
		
		
		
		

