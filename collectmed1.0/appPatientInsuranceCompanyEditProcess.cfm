<!---- appPatientInsuranceCompanyEditProcess.cfm ---->


<cfset msg = "">


<cfif IsDefined("form.formname") AND form.formname EQ "policy">

	<cf_tagPatientInsuranceSave
		action="update"
		patientID="#trim(form.patientID)#"
		recordID="#trim(form.recordID)#"
		PolicyNumberTBox="#trim(form.PolicyNumberTBox)#"		
		GroupNumberTBox="#trim(form.GroupNumberTBox)#"
		PolicyHoldersSexMale="#trim(form.PolicyHoldersSexMale)#"
		PolicyHoldersSexFemale="#trim(form.PolicyHoldersSexFemale)#"
		PolicyHoldersFirstName="#trim(form.PolicyHoldersFirstName)#"
		PolicyHoldersMiddleInitial="#trim(form.PolicyHoldersMiddleInitial)#"
		PolicyHoldersLastName="#trim(form.PolicyHoldersLastName)#"
		PolicyHoldersStateID="#trim(form.PolicyHoldersStateID)#"
		PolicyHoldersDOBMM="#trim(form.PolicyHoldersDOBMM)#"
		PolicyHoldersDOBDD="#trim(form.PolicyHoldersDOBDD)#"
		PolicyHoldersDOBYY="#trim(form.PolicyHoldersDOBYY)#"
		RelationshipSelf="#trim(form.RelationshipSelf)#"
		RelationshipSpouse="#trim(form.RelationshipSpouse)#"
		RelationshipChild="#trim(form.RelationshipChild)#"
		RelationshipOther="#trim(form.RelationshipOther)#"
		PolicyHoldersEmployerSchoolNameTBox="#trim(form.PolicyHoldersEmployerSchoolNameTBox)#"
		PolicyHoldersAddressLine1TBox="#trim(form.PolicyHoldersAddressLine1TBox)#"
		PolicyHoldersAddressLine2TBox="#trim(form.PolicyHoldersAddressLine2TBox)#"
		PolicyHoldersCityTBox="#trim(form.PolicyHoldersCityTBox)#"
		PolicyHoldersZipCodeTBox="#trim(form.PolicyHoldersZipCodeTBox)#"
		PolicyHoldersPhone="#REQUEST.CleanNumericString(trim(form.PolicyHoldersPhone))#">
		
		<cfset msg = "The policy changes have been saved.">

<cfelseif IsDefined("form.formname") AND form.formname EQ "insurance">

	<cfif form.InsuranceCompanyNameTBox EQ "">
		<cf_gcGeneralErrorTemplate message="The name of the insurance company cannot be left blank.">	
	</cfif>
	
	<cfset request.InsuranceCompany = CreateObject("component", "com.common.db.InsuranceCompanyIO").init(icID)>
		
	<cfif request.InsuranceCompany.getInsuranceCompanyName() NEQ form.InsuranceCompanyNameTBox>
		<cfset request.InsuranceCompany.setInsuranceCompanyName(form.InsuranceCompanyNameTBox)>
	</cfif>	
	<cfif request.InsuranceCompany.getInsuranceCompanyDBA() NEQ form.InsuranceCompanyDBATBox>
		<cfset request.InsuranceCompany.setInsuranceCompanyDBA(form.InsuranceCompanyDBATBox)>
	</cfif>
	<cfif request.InsuranceCompany.getOCNANumber() NEQ form.OCNANumberTBox>
		<cfset request.InsuranceCompany.setOCNANumber(form.OCNANumberTBox)>
	</cfif>
	<cfif request.InsuranceCompany.getInsuranceCompanyURL() NEQ form.InsuranceCompanyURLTBox>
		<cfset request.InsuranceCompany.setInsuranceCompanyURL(form.InsuranceCompanyURLTBox)>
	</cfif>
	
	<cfset request.InsuranceCompany.commit()>		
	
	<cfset msg = "The insurance changes have been saved.">

<cfelseif IsDefined("form.formname") AND form.formname EQ "verification" AND form.VerificationPatientInsuranceID EQ "">

	<cfset request.VerificationPIC = CreateObject("component","com.common.VerificationPIC")>
	<cfset request.VerificationPIC.setpicID(form.recordID)>
	<cfset request.VerificationPIC.setUsersID(form.UsersID)>
	<cfset request.VerificationPIC.setVerificationRepFName(form.VerificationRepFName)>
	<cfset request.VerificationPIC.setVerificationRepLName(form.VerificationRepLName)>
	<cfset request.VerificationPIC.setVerificationTime(form.VerificationTime)>
	<cfset request.VerificationPIC.setVerificationDeductibleAmount(form.VerificationDeductibleAmount)>
	<cfset request.VerificationPIC.setVerificationDeductibleAmountMet(form.VerificationDeductibleAmountMet)>
	<cfset request.VerificationPIC.setVerificationPercentagePayAfterDeductible(form.VerificationPercentagePayAfterDeductible)>
	<cfset request.VerificationPIC.setVerificationAuthNumber(form.VerificationAuthNumber)>
	<cfset request.VerificationPIC.setVerificationAuthPhoneNumber(request.cleanNumericString(form.VerificationAuthPhoneNumber))>
	<cfset request.VerificationPIC.setVerificationTypeBasePlan(form.VerificationTypeBasePlan)>	
	<cfset VerificationDate = "#trim(form.VerificationDateMM)#/#trim(form.VerificationDateDD)#/#trim(form.VerificationDateYY)#">
	<cfif IsDate(VerificationDate)>	
		<cfset request.VerificationPIC.setVerificationDate(VerificationDate)>
	</cfif>
	<cfset VerificationHaveInsFromDate = "#trim(form.VerificationHaveInsFromDateMM)#/#trim(form.VerificationHaveInsFromDateDD)#/#trim(form.VerificationHaveInsFromDateYY)#">
	<cfif IsDate(VerificationHaveInsFromDate)>	
		<cfset request.VerificationPIC.setVerificationHaveInsFromDate(VerificationHaveInsFromDate)>
	</cfif>
	<cfset VerificationHaveInsToDate = "#trim(form.VerificationHaveInsToDateMM)#/#trim(form.VerificationHaveInsToDateDD)#/#trim(form.VerificationHaveInsToDateYY)#">
	<cfif IsDate(VerificationHaveInsToDate)>		
		<cfset request.VerificationPIC.setVerificationHaveInsToDate(VerificationHaveInsToDate)>
	</cfif>
	<cfif IsNumeric(VerificationHaveInsYes)>
		<cfset request.VerificationPIC.setVerificationHaveIns(0)>
	<cfelseif IsNumeric(VerificationHaveInsNo)>
		<cfset request.VerificationPIC.setVerificationHaveIns(1)>
	</cfif> 
	<cfif IsNumeric(VerificationHaveDMECovYes)>
		<cfset request.VerificationPIC.setVerificationHaveDMECov(0)>
	<cfelseif IsNumeric(VerificationHaveDMECovNo)>
		<cfset request.VerificationPIC.setVerificationHaveDMECov(1)>
	</cfif>	
	<cfif IsNumeric(VerificationDeductibleYes)>
		<cfset request.VerificationPIC.setVerificationDeductible(0)>
	<cfelseif IsNumeric(VerificationDeductibleNo)>
		<cfset request.VerificationPIC.setVerificationDeductible(1)>	
	</cfif>
	<cfif IsNumeric(VerificationPPOPolicyYes)>
		<cfset request.VerificationPIC.setVerificationPPOPolicy(0)>
	<cfelseif IsNumeric(VerificationPPOPolicyNo)>
		<cfset request.VerificationPIC.setVerificationPPOPolicy(1)>	
	</cfif>
	<cfif IsNumeric(VerificationPriorAuthYes)>
		<cfset request.VerificationPIC.setVerificationPriorAuth(0)>
	<cfelseif IsNumeric(VerificationPriorAuthNo)>
		<cfset request.VerificationPIC.setVerificationPriorAuth(1)>
	</cfif>
	<cfif IsNumeric(VerificationLifetimeBenefitMetYes)>
		<cfset request.VerificationPIC.setVerificationLifetimeBenefitMet(0)>
	<cfelseif IsNumeric(VerificationLifetimeBenefitMetNo)>	
		<cfset request.VerificationPIC.setVerificationLifetimeBenefitMet(1)>
	</cfif>
	<cfif IsNumeric(VerificationMedicareSupplementYes)>	
		<cfset request.VerificationPIC.setVerificationMedicareSupplement(0)>
	<cfelseif IsNumeric(VerificationMedicareSupplementNo)>	
		<cfset request.VerificationPIC.setVerificationMedicareSupplement(1)>
	</cfif>		
	<cfif IsNumeric(VerificationCoordinateBenefitsYes)>	
		<cfset request.VerificationPIC.setVerificationCoordinateBenefits(0)>
	<cfelseif IsNumeric(VerificationCoordinateBenefitsNo)>	
		<cfset request.VerificationPIC.setVerificationCoordinateBenefits(1)>
	</cfif>			
	<cfif IsNumeric(VerificationPaidMedicareDeductibleYes)>	
		<cfset request.VerificationPIC.setVerificationPaidMedicareDeductible(0)>
	<cfelseif IsNumeric(VerificationPaidMedicareDeductibleNo)>	
		<cfset request.VerificationPIC.setVerificationPaidMedicareDeductible(1)>
	</cfif>		
	<cfif IsNumeric(VerificationMedicaidPlanMQMB)>	
		<cfset request.VerificationPIC.setVerificationMedicaidPlan(0)>
	<cfelseif IsNumeric(VerificationMedicaidPlanQMB)>	
		<cfset request.VerificationPIC.setVerificationMedicaidPlan(1)>
	<cfelseif IsNumeric(VerificationMedicaidPlanTraditional)>	
		<cfset request.VerificationPIC.setVerificationMedicaidPlan(2)>	
	</cfif>	

	<cfset VerificationPatientInsuranceID = request.VerificationPIC.commit()>
	<cfset msg = "The verification has been saved (#trim(VerificationPatientInsuranceID)#).">


	
<cfelseif IsDefined("form.formname") AND form.formname EQ "verification" AND IsNumeric(form.VerificationPatientInsuranceID)>	

	<cfset request.VerificationPIC = CreateObject("component","com.common.VerificationPIC").init(form.VerificationPatientInsuranceID)>
	<cfset request.VerificationPIC.setpicID(form.recordID)>
	<cfset request.VerificationPIC.setUsersID(form.UsersID)>
	<cfset request.VerificationPIC.setVerificationRepFName(form.VerificationRepFName)>
	<cfset request.VerificationPIC.setVerificationRepLName(form.VerificationRepLName)>
	<cfset request.VerificationPIC.setVerificationTime(form.VerificationTime)>
	<cfset request.VerificationPIC.setVerificationDeductibleAmount(form.VerificationDeductibleAmount)>
	<cfset request.VerificationPIC.setVerificationDeductibleAmountMet(form.VerificationDeductibleAmountMet)>
	<cfset request.VerificationPIC.setVerificationPercentagePayAfterDeductible(form.VerificationPercentagePayAfterDeductible)>
	<cfset request.VerificationPIC.setVerificationAuthNumber(form.VerificationAuthNumber)>
	<cfset request.VerificationPIC.setVerificationAuthPhoneNumber(request.cleanNumericString(form.VerificationAuthPhoneNumber))>
	<cfset request.VerificationPIC.setVerificationTypeBasePlan(form.VerificationTypeBasePlan)>	
	<cfset VerificationDate = "#trim(form.VerificationDateMM)#/#trim(form.VerificationDateDD)#/#trim(form.VerificationDateYY)#">
	<cfif IsDate(VerificationDate)>	
		<cfset request.VerificationPIC.setVerificationDate(VerificationDate)>
	</cfif>
	<cfset VerificationHaveInsFromDate = "#trim(form.VerificationHaveInsFromDateMM)#/#trim(form.VerificationHaveInsFromDateDD)#/#trim(form.VerificationHaveInsFromDateYY)#">
	<cfif IsDate(VerificationHaveInsFromDate)>	
		<cfset request.VerificationPIC.setVerificationHaveInsFromDate(VerificationHaveInsFromDate)>
	</cfif>
	<cfset VerificationHaveInsToDate = "#trim(form.VerificationHaveInsToDateMM)#/#trim(form.VerificationHaveInsToDateDD)#/#trim(form.VerificationHaveInsToDateYY)#">
	<cfif IsDate(VerificationHaveInsToDate)>		
		<cfset request.VerificationPIC.setVerificationHaveInsToDate(VerificationHaveInsToDate)>
	</cfif>
	<cfif IsNumeric(VerificationHaveInsYes)>
		<cfset request.VerificationPIC.setVerificationHaveIns(0)>
	<cfelseif IsNumeric(VerificationHaveInsNo)>
		<cfset request.VerificationPIC.setVerificationHaveIns(1)>
	</cfif> 
	<cfif IsNumeric(VerificationHaveDMECovYes)>
		<cfset request.VerificationPIC.setVerificationHaveDMECov(0)>
	<cfelseif IsNumeric(VerificationHaveDMECovNo)>
		<cfset request.VerificationPIC.setVerificationHaveDMECov(1)>
	</cfif>	
	<cfif IsNumeric(VerificationDeductibleYes)>
		<cfset request.VerificationPIC.setVerificationDeductible(0)>
	<cfelseif IsNumeric(VerificationDeductibleNo)>
		<cfset request.VerificationPIC.setVerificationDeductible(1)>	
	</cfif>
	<cfif IsNumeric(VerificationPPOPolicyYes)>
		<cfset request.VerificationPIC.setVerificationPPOPolicy(0)>
	<cfelseif IsNumeric(VerificationPPOPolicyNo)>
		<cfset request.VerificationPIC.setVerificationPPOPolicy(1)>	
	</cfif>
	<cfif IsNumeric(VerificationPriorAuthYes)>
		<cfset request.VerificationPIC.setVerificationPriorAuth(0)>
	<cfelseif IsNumeric(VerificationPriorAuthNo)>
		<cfset request.VerificationPIC.setVerificationPriorAuth(1)>
	</cfif>
	<cfif IsNumeric(VerificationLifetimeBenefitMetYes)>
		<cfset request.VerificationPIC.setVerificationLifetimeBenefitMet(0)>
	<cfelseif IsNumeric(VerificationLifetimeBenefitMetNo)>	
		<cfset request.VerificationPIC.setVerificationLifetimeBenefitMet(1)>
	</cfif>
	<cfif IsNumeric(VerificationMedicareSupplementYes)>	
		<cfset request.VerificationPIC.setVerificationMedicareSupplement(0)>
	<cfelseif IsNumeric(VerificationMedicareSupplementNo)>	
		<cfset request.VerificationPIC.setVerificationMedicareSupplement(1)>
	</cfif>		
	<cfif IsNumeric(VerificationCoordinateBenefitsYes)>	
		<cfset request.VerificationPIC.setVerificationCoordinateBenefits(0)>
	<cfelseif IsNumeric(VerificationCoordinateBenefitsNo)>	
		<cfset request.VerificationPIC.setVerificationCoordinateBenefits(1)>
	</cfif>			
	<cfif IsNumeric(VerificationPaidMedicareDeductibleYes)>	
		<cfset request.VerificationPIC.setVerificationPaidMedicareDeductible(0)>
	<cfelseif IsNumeric(VerificationPaidMedicareDeductibleNo)>	
		<cfset request.VerificationPIC.setVerificationPaidMedicareDeductible(1)>
	</cfif>		
	<cfif IsNumeric(VerificationMedicaidPlanMQMB)>	
		<cfset request.VerificationPIC.setVerificationMedicaidPlan(0)>
	<cfelseif IsNumeric(VerificationMedicaidPlanQMB)>	
		<cfset request.VerificationPIC.setVerificationMedicaidPlan(1)>
	<cfelseif IsNumeric(VerificationMedicaidPlanTraditional)>	
		<cfset request.VerificationPIC.setVerificationMedicaidPlan(2)>	
	</cfif>	

	<cfset request.VerificationPIC.commit()>
	<cfset msg = "The verification has been updated (#trim(form.VerificationPatientInsuranceID)#).">	

			
</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Locate the user back to the original page.                                     --->
<!-------------------------------------------------------------------------------------->
	<cflocation addtoken="No" url="appPatientInsuranceCompanyEdit.cfm?patientid=#trim(form.patientID)#&picid=#trim(form.recordID)#&ev=1&msg=#URLEncodedFormat(trim(msg))#">
	
		