

<cfcomponent>
	
	
	<cffunction name="wsGetVerificationQuery" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="An ID" required="true">
		
		<cfset ClientID = Data1>
		<cfset vpiID = Data2>			
		
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
					
			<!---<cfset request.Verification = CreateObject("component","com.common.db.VerificationPatientInsuranceIO")>	
			<cfset Verification = request.Verification.getVerificationPatientInsuranceQuery(VerificationPatientInsuranceID: trim(vpiID))>			
				--->	
			<cfquery name="Verification" datasource="PAClient_#clientID#">
				SELECT v.VerificationPatientInsuranceID, v.usersID, v.picID, v.VerificationRepFName, v.VerificationRepLName, 
				v.VerificationDate AS VerificationDate, v.VerificationTime, v.VerificationHaveIns,
				v.VerificationHaveInsFromDate AS VerificationHaveInsFromDate,
				v.VerificationHaveInsToDate AS VerificationHaveInsToDate,
				v.VerificationHaveDMECov, v.VerificationDeductible, v.VerificationDeductibleAmount,
				v.VerificationDeductibleAmountMet, v.VerificationPPOPolicy, v.VerificationPercentagePayAfterDeductible,
				v.VerificationPriorAuth, v.VerificationAuthNumber, v.VerificationLifetimeBenefitMet,
				v.VerificationAuthPhoneNumber, v.VerificationMedicareSupplement, v.VerificationCoordinateBenefits,
				v.VerificationPaidMedicareDeductible, v.VerificationMedicaidPlan, v.VerificationTypeBasePlan,
				v.Active, v.InactiveCode, v.DateCreated AS DateCreated, v.DateModified,
				CONCAT(vuap.FName, ' ', vuap.LName) AS verifiedByName
				FROM verificationpatientinsurance v  
				JOIN view_UserAccountParameters vuap ON v.UsersID = vuap.UsersID
				WHERE v.VerificationPatientInsuranceID = #trim(vpiID)#					
			</cfquery>	
													
			<cfif IsQuery(Verification) AND Verification.RecordCount GTE 1>									
				<cfreturn Verification>
			<cfelse>
				<cfreturn false>	
			</cfif>
								
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 
		
	
	<cffunction name="wsGetVerificationXML" access="remote" returnType="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="An ID" required="true">
		
		<cfset ClientID = Data1>
		<cfset vpiID = Data2>
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
							
			<cfset temp = wsGetVerificationQuery(data1: clientID, data2: vpiID)>			
				
			<cfinvoke component="com.common.toXML" method="queryToXML" data="#temp#" rootelement="VERIFICATIONS" itemelement="VERIFICATION" returnvariable="xmlVerification">
																			
			<cfif xmlVerification NEQ "">				
				<cfreturn xmlVerification>
			<cfelse>
				<cfreturn false>	
			</cfif>
			
								
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
		


	<cffunction name="wsGetMedicaidVerification" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="User ID" required="true">
		<cfargument name="Data3" type="string" hint="id" required="true">
		
		<cfset variables.ClientID = arguments.Data1>
		<cfset variables.UserID = arguments.Data2>
		<cfset variables.id = arguments.Data3>
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
						
			<cfscript>
				variables.VerificationPatientInsurance = CreateObject("component", "CustomTags.com.common.model.VerificationPatientInsurance");
				variables.VerificationPatientInsurance.setVerificationPatientInsuranceID(variables.id);
				variables.VerificationPatientInsuranceSVC = application.beanFactory.getBean("old_VerificationPatientInsuranceService");
				variables.VerificationPatientInsuranceSVC.read(variables.VerificationPatientInsurance);	
				variables.VerificationPatientInsuranceElectronicSVC = application.beanFactory.getBean("old_VerificationPatientInsuranceElectronicService");
				variables.filterF = structNew();
				variables.filterF.vpicID = trim(variables.VerificationPatientInsurance.getVerificationPatientInsuranceID());					
				variables.VPIE = variables.VerificationPatientInsuranceElectronicSVC.getAllVerificationPatientInsuranceElectronics(variables.filterF);	
				variables.File = CreateObject("component", "CustomTags.com.common.model.File");
				variables.File.setFileID(variables.VPIE.mashFileID[1]);
				variables.FileSVC = application.beanFactory.getBean("old_FileService");
				variables.FileSVC.read(variables.File);	
			</cfscript>
			
			<cffile action="READ" file="#trim(variables.File.getServerDirectory())#\#trim(variables.File.getServerFile())#" variable="variables.mashXMLContents">		
			
			<cfset retData = "#trim(variables.VPIE.indexInFile[1])#" & "@@" & "#trim(variables.mashXMLContents)#">
			
			<cfreturn retData>
								
			<cfcatch type="Any">				

				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">				
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 

	
</cfcomponent>

	
