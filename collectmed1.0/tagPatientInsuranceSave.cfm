<!---tagPatientInsuranceSave--->



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.action" default="">
	<cfset action = attributes.action>
	
	<cfparam name="attributes.newRecordIdentity" default="picID">
	<cfset newRecordIdentity = attributes.newRecordIdentity>
	
	<cfparam name="attributes.insuranceCompanyID" default="">
	<cfset insuranceCompanyID = attributes.insuranceCompanyID>

	<cfparam name="attributes.patientID" default="">
	<cfset patientID = attributes.patientID>
	
	<cfparam name="attributes.recordID" default="">
	<cfset recordID = attributes.recordID>
	
	<cfparam name="attributes.PolicyNumber" default="">
	<cfset PolicyNumber = attributes.PolicyNumber>
	
	<cfparam name="attributes.PrimSecTer" default="">
	<cfset PrimSecTer = attributes.PrimSecTer>
	
	<cfparam name="attributes.PolicyNumberTBox" default="">
	<cfset PolicyNumberTBox = attributes.PolicyNumberTBox>
	
	<cfparam name="attributes.GroupNumberTBox" default="">
	<cfset GroupNumberTBox = attributes.GroupNumberTBox>
	
	<cfparam name="attributes.PolicyHoldersSexMale" default="">
	<cfset PolicyHoldersSexMale = attributes.PolicyHoldersSexMale>
	
	<cfparam name="attributes.PolicyHoldersSexFemale" default="">
	<cfset PolicyHoldersSexFemale = attributes.PolicyHoldersSexFemale>
	
	<cfparam name="attributes.PolicyHoldersFirstName" default="">
	<cfset PolicyHoldersFirstName = attributes.PolicyHoldersFirstName>
	
	<cfparam name="attributes.PolicyHoldersMiddleInitial" default="">
	<cfset PolicyHoldersMiddleInitial = attributes.PolicyHoldersMiddleInitial>
	
	<cfparam name="attributes.PolicyHoldersLastName" default="">
	<cfset PolicyHoldersLastName = attributes.PolicyHoldersLastName>
	
	<cfparam name="attributes.PolicyHoldersStateID" default="">
	<cfset PolicyHoldersStateID = attributes.PolicyHoldersStateID>
	
	<cfparam name="attributes.PolicyHoldersDOBMM" default="">
	<cfset PolicyHoldersDOBMM = attributes.PolicyHoldersDOBMM>
	
	<cfparam name="attributes.PolicyHoldersDOBDD" default="">
	<cfset PolicyHoldersDOBDD = attributes.PolicyHoldersDOBDD>
	
	<cfparam name="attributes.PolicyHoldersDOBYY" default="">
	<cfset PolicyHoldersDOBYY = attributes.PolicyHoldersDOBYY>
	
	<cfparam name="attributes.RelationshipSelf" default="">
	<cfset RelationshipSelf = attributes.RelationshipSelf>
	
	<cfparam name="attributes.RelationshipSpouse" default="">
	<cfset RelationshipSpouse = attributes.RelationshipSpouse>
	
	<cfparam name="attributes.RelationshipChild" default="">
	<cfset RelationshipChild = attributes.RelationshipChild>
	
	<cfparam name="attributes.RelationshipOther" default="">
	<cfset RelationshipOther = attributes.RelationshipOther>
	
	<cfparam name="attributes.PolicyHoldersEmployerSchoolNameTBox" default="">
	<cfset PolicyHoldersEmployerSchoolNameTBox = attributes.PolicyHoldersEmployerSchoolNameTBox>
	
	<cfparam name="attributes.PolicyHoldersAddressLine1TBox" default="">
	<cfset PolicyHoldersAddressLine1TBox = attributes.PolicyHoldersAddressLine1TBox>
	
	<cfparam name="attributes.PolicyHoldersAddressLine2TBox" default="">
	<cfset PolicyHoldersAddressLine2TBox = attributes.PolicyHoldersAddressLine2TBox>
	
	<cfparam name="attributes.PolicyHoldersCityTBox" default="">
	<cfset PolicyHoldersCityTBox = attributes.PolicyHoldersCityTBox>
	
	<cfparam name="attributes.PolicyHoldersZipCodeTBox" default="">
	<cfset PolicyHoldersZipCodeTBox = attributes.PolicyHoldersZipCodeTBox>
	
	<cfparam name="attributes.PolicyHoldersPhone" default="">
	<cfset PolicyHoldersPhone = attributes.PolicyHoldersPhone>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create the object that will be used.                                           --->
<!--------------------------------------------------------------------------------------> 		
<cfset request.PatientInsuranceCompany = CreateObject("component", "com.common.db.PatientInsuranceCompanyIO")>	


	
<!-------------------------------------------------------------------------------------->
<!--- The record already exists.                                                     --->
<!-------------------------------------------------------------------------------------->	
<cfif action EQ "update">	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Verify that the needed parameters have been sent in.                           --->
	<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="patientID,recordID"
		fieldnames="Patient ID,Patient Insurance Company Record ID">	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- init the object that will be updated.                                          --->
	<!--------------------------------------------------------------------------------------> 		
	<cfset request.PatientInsuranceCompany.init(recordID)><!---request.PatientInsuranceCompany = --->
	
	<cfif trim(PrimSecTer) NEQ "" AND request.PatientInsuranceCompany.getPrimSecTer() NEQ trim(PrimSecTer)>
		<cfset request.PatientInsuranceCompany.setPrimSecTer(trim(PrimSecTer))> 
	</cfif>
	<cfif trim(PolicyNumberTBox) NEQ "" AND COMPARE(request.PatientInsuranceCompany.getPolicyNumber(), trim(PolicyNumberTBox)) NEQ 0>
		<cfset request.PatientInsuranceCompany.setPolicyNumber(trim(PolicyNumberTBox))> 
	</cfif>
	<cfif trim(GroupNumberTBox) NEQ "" AND COMPARE(request.PatientInsuranceCompany.getGroupNumber(), trim(GroupNumberTBox)) NEQ 0>
		<cfset request.PatientInsuranceCompany.setGroupNumber(trim(GroupNumberTBox))> 
	</cfif>
	<cfif IsNumeric(PolicyHoldersSexMale)>
		<cfset request.PatientInsuranceCompany.setPolicyHoldersSex(0)>
	</cfif>
	<cfif IsNumeric(PolicyHoldersSexFemale)>
		<cfset request.PatientInsuranceCompany.setPolicyHoldersSex(1)>
	</cfif>
	<cfif trim(PolicyHoldersFirstName) NEQ "" AND COMPARE(request.PatientInsuranceCompany.getPolicyHoldersFirstName(), trim(PolicyHoldersFirstName)) NEQ 0>
		<cfset request.PatientInsuranceCompany.setPolicyHoldersFirstName(trim(PolicyHoldersFirstName))>
	</cfif>
	<cfif trim(PolicyHoldersMiddleInitial) NEQ "" AND COMPARE(request.PatientInsuranceCompany.getPolicyHoldersMiddleInitial(), trim(PolicyHoldersMiddleInitial)) NEQ 0>
		<cfset request.PatientInsuranceCompany.setPolicyHoldersMiddleInitial(trim(PolicyHoldersMiddleInitial))>
	</cfif>
	<cfif trim(PolicyHoldersLastName) NEQ "" AND COMPARE(request.PatientInsuranceCompany.getPolicyHoldersLastName(), trim(PolicyHoldersLastName)) NEQ 0>
		<cfset request.PatientInsuranceCompany.setPolicyHoldersLastName(trim(PolicyHoldersLastName))>
	</cfif>
	<cfif IsNumeric(PolicyHoldersStateID) AND COMPARE(request.PatientInsuranceCompany.getPolicyHoldersStateID(), trim(PolicyHoldersStateID)) NEQ 0>
		<cfset request.PatientInsuranceCompany.setPolicyHoldersStateID(trim(PolicyHoldersStateID))>
	</cfif>
	
	<cfset PolicyHoldersDOB = "#trim(PolicyHoldersDOBMM)#/#trim(PolicyHoldersDOBDD)#/#trim(PolicyHoldersDOBYY)#">
	<cfif IsDate(PolicyHoldersDOB)>
		<cfset request.PatientInsuranceCompany.setPolicyHoldersDOB(trim(PolicyHoldersDOB))>
	</cfif>
	
	<cfif IsNumeric(RelationshipSelf)>
		<cfset request.PatientInsuranceCompany.setRelationship(203)>
	<cfelseif IsNumeric(RelationshipSpouse)>
		<cfset request.PatientInsuranceCompany.setRelationship(204)>
	<cfelseif IsNumeric(RelationshipChild)>
		<cfset request.PatientInsuranceCompany.setRelationship(205)>
	<cfelseif IsNumeric(RelationshipOther)>
		<cfset request.PatientInsuranceCompany.setRelationship(206)>		
	</cfif>
	
	<cfif trim(PolicyHoldersEmployerSchoolNameTBox) NEQ "" AND COMPARE(request.PatientInsuranceCompany.getPolicyHoldersEmployerSchoolName(), trim(PolicyHoldersEmployerSchoolNameTBox)) NEQ 0>
		<cfset request.PatientInsuranceCompany.setPolicyHoldersEmployerSchoolName(trim(PolicyHoldersEmployerSchoolNameTBox))>
	</cfif>
			
	<cfif trim(PolicyHoldersAddressLine1TBox) NEQ "" AND COMPARE(request.PatientInsuranceCompany.getPolicyHoldersAddressLine1(), trim(PolicyHoldersAddressLine1TBox)) NEQ 0>
		<cfset request.PatientInsuranceCompany.setPolicyHoldersAddressLine1(trim(PolicyHoldersAddressLine1TBox))>
	</cfif>			
	
	<cfif trim(PolicyHoldersAddressLine2TBox) NEQ "" AND COMPARE(request.PatientInsuranceCompany.getPolicyHoldersAddressLine2(), trim(PolicyHoldersAddressLine2TBox)) NEQ 0>
		<cfset request.PatientInsuranceCompany.setPolicyHoldersAddressLine2(trim(PolicyHoldersAddressLine2TBox))>
	</cfif>			
	
	<cfif trim(PolicyHoldersCityTBox)NEQ "" AND COMPARE(request.PatientInsuranceCompany.getPolicyHoldersCity(), trim(PolicyHoldersCityTBox)) NEQ 0>
		<cfset request.PatientInsuranceCompany.setPolicyHoldersCity(trim(PolicyHoldersCityTBox))>
	</cfif>
	
	<cfif trim(PolicyHoldersZipCodeTBox) NEQ "" AND COMPARE(request.PatientInsuranceCompany.getPolicyHoldersZipCode(), trim(PolicyHoldersZipCodeTBox)) NEQ 0>
		<cfset request.PatientInsuranceCompany.setPolicyHoldersZipCode(trim(PolicyHoldersZipCodeTBox))>
	</cfif>
	
	<cfif trim(PolicyHoldersPhone) NEQ "" AND COMPARE(request.PatientInsuranceCompany.getPolicyHoldersPhone(), REQUEST.CleanNumericString(trim(PolicyHoldersPhone))) NEQ 0>
		<cfset request.PatientInsuranceCompany.setPolicyHoldersPhone(REQUEST.CleanNumericString(trim(PolicyHoldersPhone)))>
	</cfif>
	
	<cfset request.PatientInsuranceCompany.commit()>




<!-------------------------------------------------------------------------------------->
<!--- Create the record and return the ID.                                           --->
<!-------------------------------------------------------------------------------------->
<cfelseif action EQ "create">
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Verify that the needed parameters have been sent in.                           --->
	<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="patientID"
		fieldnames="Patient ID">	
		
		
	<!-------------------------------------------------------------------------------------->
	<!--- Set the fields for this new record.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cfset request.PatientInsuranceCompany.setInsuranceCompanyID(trim(insuranceCompanyID))>
	<cfset request.PatientInsuranceCompany.setPatientID(trim(patientID))>
	<cfset request.PatientInsuranceCompany.setPrimSecTer(trim(PrimSecTer))> 
	<cfset request.PatientInsuranceCompany.setPolicyNumber(trim(PolicyNumber))> 
	<cfset request.PatientInsuranceCompany.setGroupNumber(trim(GroupNumberTBox))> 
	<cfif IsNumeric(PolicyHoldersSexMale)>
		<cfset request.PatientInsuranceCompany.setPolicyHoldersSex(0)>
	</cfif>
	<cfif IsNumeric(PolicyHoldersSexFemale)>
		<cfset request.PatientInsuranceCompany.setPolicyHoldersSex(1)>
	</cfif>
	<cfset request.PatientInsuranceCompany.setPolicyHoldersFirstName(trim(PolicyHoldersFirstName))>
	<cfset request.PatientInsuranceCompany.setPolicyHoldersMiddleInitial(trim(PolicyHoldersMiddleInitial))>
	<cfset request.PatientInsuranceCompany.setPolicyHoldersLastName(trim(PolicyHoldersLastName))>
	<cfset request.PatientInsuranceCompany.setPolicyHoldersStateID(trim(PolicyHoldersStateID))>	
	<cfset PolicyHoldersDOB = "#trim(PolicyHoldersDOBMM)#/#trim(PolicyHoldersDOBDD)#/#trim(PolicyHoldersDOBYY)#">
	<cfif IsDate(PolicyHoldersDOB)>
		<cfset request.PatientInsuranceCompany.setPolicyHoldersDOB(trim(PolicyHoldersDOB))>
	</cfif>	
	<cfif IsNumeric(RelationshipSelf)>
		<cfset request.PatientInsuranceCompany.setRelationship(203)>
	<cfelseif IsNumeric(RelationshipSpouse)>
		<cfset request.PatientInsuranceCompany.setRelationship(204)>
	<cfelseif IsNumeric(RelationshipChild)>
		<cfset request.PatientInsuranceCompany.setRelationship(205)>
	<cfelseif IsNumeric(RelationshipOther)>
		<cfset request.PatientInsuranceCompany.setRelationship(206)>		
	</cfif>
	<cfset request.PatientInsuranceCompany.setPolicyHoldersEmployerSchoolName(trim(PolicyHoldersEmployerSchoolNameTBox))>
	<cfset request.PatientInsuranceCompany.setPolicyHoldersAddressLine1(trim(PolicyHoldersAddressLine1TBox))>
	<cfset request.PatientInsuranceCompany.setPolicyHoldersAddressLine2(trim(PolicyHoldersAddressLine2TBox))>
	<cfset request.PatientInsuranceCompany.setPolicyHoldersCity(trim(PolicyHoldersCityTBox))>
	<cfset request.PatientInsuranceCompany.setPolicyHoldersZipCode(trim(PolicyHoldersZipCodeTBox))>
	<cfset request.PatientInsuranceCompany.setPolicyHoldersPhone(REQUEST.CleanNumericString(trim(PolicyHoldersPhone)))>
	
	<cfset "caller.#newRecordIdentity#" = request.PatientInsuranceCompany.commit()>

</cfif>

	