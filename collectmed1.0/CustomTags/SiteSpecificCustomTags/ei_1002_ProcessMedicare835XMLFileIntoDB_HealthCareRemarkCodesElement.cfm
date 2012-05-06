<!-------------------------------------------------------------------------------------->
<!--- This tag is dependant on the CLP XML being available along with the current    --->
<!--- iteration number. Tags that call this are:                                     --->
<!--- ei_1002_ProcessMedicare835XMLFileIntoDB_ServiceElement.cfm                     --->
<!-------------------------------------------------------------------------------------->



	<!-------------------------------------------------------------------------------------->
	<!--- First find out if the actual elment exists that has the claim adjustments.     --->
	<!--------------------------------------------------------------------------------------> 
	<cfif StructKeyExists(ClaimXML.CLP.SVC[iii], 'LQ')>
		
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- Create the Claim Remark Object                                                 --->
			<!-------------------------------------------------------------------------------------->
			<cfset request.Procedure_MEDICARE_REMARK_CODE = CreateObject("component","com.common.db.Procedure_MEDICARE_REMARK_CODEIO")>
								
			<!-------------------------------------------------------------------------------------->
			<!--- Start the loop of the actual Remarks in the claim.                             --->
			<!-------------------------------------------------------------------------------------->				
			<cfloop from="1" to="#trim(ArrayLen(ClaimXML.CLP.SVC[iii].LQ))#" index="lqi">				
				
				<cfset procedureQualifierCode = ClaimXML.CLP.SVC[iii].LQ[lqi].CodeListQualifierCode1.XMLText>
				<cfset procedureIndustryCode = ClaimXML.CLP.SVC[iii].LQ[lqi].IndustryCode2.XMLText>
				
				<cfset request.Procedure_MEDICARE_REMARK_CODE.reset()>		
				<cfset request.Procedure_MEDICARE_REMARK_CODE.setProcedureID(ProcedureID)>
				<cfset request.Procedure_MEDICARE_REMARK_CODE.setQualifierCode(procedureQualifierCode)>
				<cfinvoke component="com.common.db.EOB_MEDICARE_REMITTANCEADVICEREMARKCodeIO" method="getEOB_MEDICARE_REMITTANCEADVICEREMARKCodeQuery" fields="RecordID" code="#trim(procedureIndustryCode)#" active="1" returnvariable="getMOACode">
				
				<cfif getMOACode.RecordCount NEQ 1>
					<cf_gcGatewayLogger	datasource="#trim(request.datasource)#" code="115" logtext="115 There was an issue with the file processing. <p> ei_1002_ProcessMedicare835XMLFileIntoDB_HealthCareRemarkCodesElement.cfm <p> When searching for the code #trim(procedureIndustryCode)# in the pa_master.EOB_MEDICARE_REMITTANCEADVICEREMARKCode table it was not found. <p>Records Found: #getMOACode.RecordCount#">	
					<cfset codeID = 643><!---HardCoded record that was placed in table as a catchall.--->
				<cfelse>
					<cfset codeID = getMOACode.RecordID>
				</cfif>
				
				<cfset request.Procedure_MEDICARE_REMARK_CODE.setindustryCode(trim(codeID))>
				<cfset request.Procedure_MEDICARE_REMARK_CODE.commit()>		
							
			</cfloop>
		
		
			<cfcatch type="Any">
				
				<cf_gcGatewayLogger	datasource="#trim(request.datasource)#" code="115" logtext="115 There was an issue with the file processing. <p> ei_1002_ProcessMedicare835XMLFileIntoDB_HealthCareRemarkCodesElement.cfm <p> #cfcatch.type# #cfcatch.message# #cfcatch.detail#">	
												
			</cfcatch>
		
		
		</cftry>
				
	</cfif>


