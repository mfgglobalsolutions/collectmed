<!--- tagPatientInsuranceFormProcess.cfm --->

	
<!-------------------------------------------------------------------------------------->
<!--- Loop the form fields and add the records back as stated.                       --->
<!-------------------------------------------------------------------------------------->					
	<cfloop list="#form.FieldNames#" index="i">		
									
		<cfif FindNoCase("primsecter_", i) NEQ 0 AND IsNumeric(ListLast(i, "_"))>
			
			<cfset thisRecordID = ListLast(i, "_")>
			
			<cfquery name="updateRecord" datasource="#trim(request.datasource)#">
				UPDATE PatientInsuranceCompany
				SET PrimSecTer = #evaluate(i)#
				WHERE recordID = #trim(thisRecordID)#
			</cfquery>							
			
		</cfif> 
		
	</cfloop>	
	
	
