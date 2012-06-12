<!---- appClaimEditMedicarePrintProcess.cfm ---->




<!-------------------------------------------------------------------------------------->
<!--- IMPORTANT NOTE!!!!!!!                                                          --->
<!--- ANYTHING DONE TO THIS PAGE IN THE CLAIM DATA PRINT AREA MUST ALSO BE PLACED    --->
<!--- IN "appClaimEditMedicare.cfm" FILE.                                            --->
<!-------------------------------------------------------------------------------------->



<!---
<cfdump var="#form#"><cfabort>--->








<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.listOfFiles" default="">
	<cfset listOfFiles = attributes.listOfFiles>
	
	<cfparam name="attributes.fileDateTimeStamp" default="#DateFormat(NOW(), 'mmddyy')##TimeFormat(NOW(), 'hhmmss')#">
	<cfset fileDateTimeStamp = attributes.fileDateTimeStamp>
	
	<cfparam name="attributes.claimID" default="">
	<cfset claimID = attributes.claimID>
	
	<cfif IsDefined("form.claimID") AND form.claimID NEQ "">
		<cfset claimID = form.claimID>
	<cfelseif IsDefined("url.claimID") AND url.claimID NEQ "">
		<cfset claimID = url.claimID>	
	</cfif>
	
	<cfparam name="attributes.formName" default="updateClaim">
	<cfset formName = attributes.formName>
	
	<cfset allowedTotal = "0.00">
	
	<cfset deductTotal = "0.00">
	
	<cfset coinsTotal = "0.00">
	
	<cfset grprcTotal = "0.00">
	
	<cfset lateFilingFee = "0.00">
	
	<cfset interestAmount = "0.00">
	
	<cfset netAmount = "0.00">
	
	<cfset disable = "disabled">
	
	<cfset glossaryCodes = "">
	
	<cfset arrayGlossary = ArrayNew(1)>
	
	<cfset arrayRemarkGlossary = ArrayNew(1)>
	
	<cfset monetaryColumns = "MonetaryAmount3,MonetaryAmount6,MonetaryAmount9,MonetaryAmount12,MonetaryAmount15,MonetaryAmount18">
		
	
		
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="claimID"
		fieldnames="Claim ID"
		datatypes="numeric">		
	
				
		
<!-------------------------------------------------------------------------------------->
<!--- Get the ClaimID parameters.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cftry>
		
		<cfset request.thisClaim = CreateObject("component","com.common.Claim")>	
		<cfset request.thisClaim.Init(trim(claimID))>	
		
		<cfset request.thisPatientEntity = CreateObject("component","com.common.Entity")>	
		<cfset request.thisPatientEntity.Init(trim(request.thisClaim.getEntityID()))>
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the information on this specific patient.                                  --->
		<!-------------------------------------------------------------------------------------->	
		<cfquery name="getPatientID" datasource="#trim(request.datasource)#">
			SELECT p.PatientID
			FROM patient p
			WHERE p.EntityID = #trim(request.thisClaim.getEntityID())#
		</cfquery>
						
		<cfset request.thisPatient = CreateObject("component", "com.common.Patient").init(getPatientID.patientID)>
		<cfset patientsInsuranceCompanies = request.thisPatient.getPatientInsCom(getPatientID.patientID)>
							
		<cfcatch type="Any">
			<cf_gcGeneralErrorTemplate
				message="There was an issue processing the page. If you continue to see this message please contact your site administrator. <p>Claim ID: 2</p><p> Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p>">
			<cfabort>
		</cfcatch>
				
	</cftry>
	
	
	

<!-------------------------------------------------------------------------------------->
<!--- if the user wants to print the HCFA form.                                      --->
<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("form.hcfa")>
		
		<cfset PolicyNumber = "">
		<cfset GroupNumber = "">
		<cfset Relationship = "">
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Loop over all the fields in the form structure if the name of the formfield    --->
		<!--- contains "_CBox_" and is equal to one is gets changed to an "X"                --->
		<!-------------------------------------------------------------------------------------->	
		<cfif IsDefined("FORM.fieldnames")>

			<cfloop list="#trim(form.FieldNames)#" index="i">
		
				<cfif REQUEST.FindOccurrences(i,"_CBox_") GTE 1 AND IsNumeric(evaluate(i)) AND evaluate(i) EQ 1>
						
					<cfset "form.#trim(i)#" = "X">
					
				</cfif>
		
			</cfloop>
		
		</cfif>
		
	
	
		<!-------------------------------------------------------------------------------------->
		<!--- Fields needed to be proccessed first.                                          --->
		<!-------------------------------------------------------------------------------------->		
		<cfset PatientName = "#trim(form.HCFA_2_TBox_PatientName)#">		
				
		<cfset InsuredsName = "#trim(form.HCFA_4_TBox_InsuredsName)#">		
				
		<cfset OtherInsuredsName = "#trim(form.HCFA_9_TBox_OtherInsuredsName)#">		
						
		<cfset PatientDOB = "#trim(form.HCFA_3_TBox_PatientsBirthDateMM)#/#trim(form.HCFA_3_TBox_PatientsBirthDateDD)#/#trim(form.HCFA_3_TBox_PatientsBirthDateYY)#">
		<cfif NOT IsDate(PatientDOB)>
			<cfset form.HCFA_3_TBox_PatientsBirthDateMM = "">
			<cfset form.HCFA_3_TBox_PatientsBirthDateDD = "">
			<cfset form.HCFA_3_TBox_PatientsBirthDateYY = "">
		</cfif>
		
		<cfset OtherInsuredsDOB = "#trim(form.HCFA_9_TBox_b_OtherInsuredsBirthDateMM)#/#trim(form.HCFA_9_TBox_b_OtherInsuredsBirthDateDD)#/#trim(form.HCFA_9_TBox_b_OtherInsuredsBirthDateYY)#">
		<cfif NOT IsDate(OtherInsuredsDOB)>
			<cfset form.HCFA_9_TBox_b_OtherInsuredsBirthDateMM = "">
			<cfset form.HCFA_9_TBox_b_OtherInsuredsBirthDateDD = "">
			<cfset form.HCFA_9_TBox_b_OtherInsuredsBirthDateYY = "">
		</cfif>
		
		<cfset InsuredsDOB = "#trim(form.HCFA_11_TBox_a_InsuredsBirthDateMM)#/#trim(form.HCFA_11_TBox_a_InsuredsBirthDateDD)#/#trim(form.HCFA_11_TBox_a_InsuredsBirthDateYY)#">
		<cfif NOT IsDate(InsuredsDOB)>
			<cfset form.HCFA_11_TBox_a_InsuredsBirthDateMM = "">
			<cfset form.HCFA_11_TBox_a_InsuredsBirthDateDD = "">
			<cfset form.HCFA_11_TBox_a_InsuredsBirthDateYY = "">
		</cfif>
		
		<cfset InsuredsDOB = "#trim(form.HCFA_11_TBox_a_InsuredsBirthDateMM)#/#trim(form.HCFA_11_TBox_a_InsuredsBirthDateDD)#/#trim(form.HCFA_11_TBox_a_InsuredsBirthDateYY)#">
		<cfif NOT IsDate(InsuredsDOB)>
			<cfset form.HCFA_11_TBox_a_InsuredsBirthDateMM = "">
			<cfset form.HCFA_11_TBox_a_InsuredsBirthDateDD = "">
			<cfset form.HCFA_11_TBox_a_InsuredsBirthDateYY = "">
		</cfif>
		
		<cfset SignatureOnFileDate12 = "#trim(form.HCFA_12_TBox_SignatureOnFileDateMM)#/#trim(form.HCFA_12_TBox_SignatureOnFileDateDD)#/#trim(form.HCFA_12_TBox_SignatureOnFileDateYY)#">
		<cfif NOT IsDate(SignatureOnFileDate12)>
			<cfset form.HCFA_12_TBox_SignatureOnFileDateMM = "">
			<cfset form.HCFA_12_TBox_SignatureOnFileDateDD = "">
			<cfset form.HCFA_12_TBox_SignatureOnFileDateYY = "">
		</cfif>
		
		<cfset DateOfCurrentIllness14 = "#trim(form.HCFA_14_TBox_DateOfCurrentIllnessMM)#/#trim(form.HCFA_14_TBox_DateOfCurrentIllnessDD)#/#trim(form.HCFA_14_TBox_DateOfCurrentIllnessYY)#">
		<cfif NOT IsDate(DateOfCurrentIllness14)>
			<cfset form.HCFA_14_TBox_DateOfCurrentIllnessMM = "">
			<cfset form.HCFA_14_TBox_DateOfCurrentIllnessDD = "">
			<cfset form.HCFA_14_TBox_DateOfCurrentIllnessYY = "">
		</cfif>
				
		<cfset DateOfSimilarIllness15 = "#trim(form.HCFA_15_TBox_DateOfSimilarIllnessMM)#/#trim(form.HCFA_15_TBox_DateOfSimilarIllnessDD)#/#trim(form.HCFA_15_TBox_DateOfSimilarIllnessYY)#">
		<cfif NOT IsDate(DateOfSimilarIllness15)>
			<cfset form.HCFA_15_TBox_DateOfSimilarIllnessMM = "">
			<cfset form.HCFA_15_TBox_DateOfSimilarIllnessDD = "">
			<cfset form.HCFA_15_TBox_DateOfSimilarIllnessYY = "">
		</cfif>
		
		<cfset DatePatientUnableFrom = "#trim(form.HCFA_16_TBox_DatePatientUnableFromMM)#/#trim(form.HCFA_16_TBox_DatePatientUnableFromDD)#/#trim(form.HCFA_16_TBox_DatePatientUnableFromYY)#">
		<cfif NOT IsDate(DatePatientUnableFrom)>
			<cfset form.HCFA_16_TBox_DatePatientUnableFromMM = "">
			<cfset form.HCFA_16_TBox_DatePatientUnableFromDD = "">
			<cfset form.HCFA_16_TBox_DatePatientUnableFromYY = "">
		</cfif>
		
		<cfset DatePatientUnableTo = "#trim(form.HCFA_16_TBox_DatePatientUnableToMM)#/#trim(form.HCFA_16_TBox_DatePatientUnableToDD)#/#trim(form.HCFA_16_TBox_DatePatientUnableToYY)#">
		<cfif NOT IsDate(DatePatientUnableTo)>
			<cfset form.HCFA_16_TBox_DatePatientUnableToMM = "">
			<cfset form.HCFA_16_TBox_DatePatientUnableToDD = "">
			<cfset form.HCFA_16_TBox_DatePatientUnableToYY = "">
		</cfif>
		
		<cfset HospitalizationDatesRelatedToCurrentServicesFrom = "#trim(form.HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesToMM)#/#trim(form.HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesToDD)#/#trim(form.HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesToYY)#">
		<cfif NOT IsDate(HospitalizationDatesRelatedToCurrentServicesFrom)>
			<cfset form.HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesToMM = "">
			<cfset form.HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesToDD = "">
			<cfset form.HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesToYY = "">
		</cfif>
		
		<cfset HospitalizationDatesRelatedToCurrentServicesTo = "#trim(form.HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesToMM)#/#trim(form.HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesToDD)#/#trim(form.HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesToYY)#">
		<cfif NOT IsDate(HospitalizationDatesRelatedToCurrentServicesTo)>
			<cfset form.HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesToMM = "">
			<cfset form.HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesToDD = "">
			<cfset form.HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesToYY = "">
		</cfif>
		
		<cfset HCFA_24_TBox_Line1_DateOfserviceFrom = "#trim(form.HCFA_24_TBox_Line1_DateOfserviceToMM)#/#trim(form.HCFA_24_TBox_Line1_DateOfserviceToDD)#/#trim(form.HCFA_24_TBox_Line1_DateOfserviceToYY)#">
		<cfif NOT IsDate(HCFA_24_TBox_Line1_DateOfserviceFrom)>
			<cfset form.HCFA_24_TBox_Line1_DateOfserviceToMM = "">
			<cfset form.HCFA_24_TBox_Line1_DateOfserviceToDD = "">
			<cfset form.HCFA_24_TBox_Line1_DateOfserviceToYY = "">
		</cfif>
		
		<cfset HCFA_24_TBox_Line1_DateOfserviceTo = "#trim(form.HCFA_24_TBox_Line1_DateOfserviceToMM)#/#trim(form.HCFA_24_TBox_Line1_DateOfserviceToDD)#/#trim(form.HCFA_24_TBox_Line1_DateOfserviceToYY)#">
		<cfif NOT IsDate(HCFA_24_TBox_Line1_DateOfserviceTo)>
			<cfset form.HCFA_24_TBox_Line1_DateOfserviceToMM = "">
			<cfset form.HCFA_24_TBox_Line1_DateOfserviceToDD = "">
			<cfset form.HCFA_24_TBox_Line1_DateOfserviceToYY = "">
		</cfif>
		
		<cfset HCFA_24_TBox_Line2_DateOfserviceFrom = "#trim(form.HCFA_24_TBox_Line2_DateOfserviceToMM)#/#trim(form.HCFA_24_TBox_Line2_DateOfserviceToDD)#/#trim(form.HCFA_24_TBox_Line2_DateOfserviceToYY)#">
		<cfif NOT IsDate(HCFA_24_TBox_Line2_DateOfserviceFrom)>
			<cfset form.HCFA_24_TBox_Line2_DateOfserviceToMM = "">
			<cfset form.HCFA_24_TBox_Line2_DateOfserviceToDD = "">
			<cfset form.HCFA_24_TBox_Line2_DateOfserviceToYY = "">
		</cfif>
		
		<cfset HCFA_24_TBox_Line2_DateOfserviceTo = "#trim(form.HCFA_24_TBox_Line2_DateOfserviceToMM)#/#trim(form.HCFA_24_TBox_Line2_DateOfserviceToDD)#/#trim(form.HCFA_24_TBox_Line2_DateOfserviceToYY)#">
		<cfif NOT IsDate(HCFA_24_TBox_Line2_DateOfserviceTo)>
			<cfset form.HCFA_24_TBox_Line2_DateOfserviceToMM = "">
			<cfset form.HCFA_24_TBox_Line2_DateOfserviceToDD = "">
			<cfset form.HCFA_24_TBox_Line2_DateOfserviceToYY = "">
		</cfif>
		
		<cfset HCFA_24_TBox_Line3_DateOfserviceFrom = "#trim(form.HCFA_24_TBox_Line3_DateOfserviceToMM)#/#trim(form.HCFA_24_TBox_Line3_DateOfserviceToDD)#/#trim(form.HCFA_24_TBox_Line3_DateOfserviceToYY)#">
		<cfif NOT IsDate(HCFA_24_TBox_Line3_DateOfserviceFrom)>
			<cfset form.HCFA_24_TBox_Line3_DateOfserviceToMM = "">
			<cfset form.HCFA_24_TBox_Line3_DateOfserviceToDD = "">
			<cfset form.HCFA_24_TBox_Line3_DateOfserviceToYY = "">
		</cfif>
		
		<cfset HCFA_24_TBox_Line3_DateOfserviceTo = "#trim(form.HCFA_24_TBox_Line3_DateOfserviceToMM)#/#trim(form.HCFA_24_TBox_Line3_DateOfserviceToDD)#/#trim(form.HCFA_24_TBox_Line3_DateOfserviceToYY)#">
		<cfif NOT IsDate(HCFA_24_TBox_Line3_DateOfserviceTo)>
			<cfset form.HCFA_24_TBox_Line3_DateOfserviceToMM = "">
			<cfset form.HCFA_24_TBox_Line3_DateOfserviceToDD = "">
			<cfset form.HCFA_24_TBox_Line3_DateOfserviceToYY = "">
		</cfif>
		
		<cfset HCFA_24_TBox_Line4_DateOfserviceFrom = "#trim(form.HCFA_24_TBox_Line4_DateOfserviceToMM)#/#trim(form.HCFA_24_TBox_Line4_DateOfserviceToDD)#/#trim(form.HCFA_24_TBox_Line4_DateOfserviceToYY)#">
		<cfif NOT IsDate(HCFA_24_TBox_Line4_DateOfserviceFrom)>
			<cfset form.HCFA_24_TBox_Line4_DateOfserviceToMM = "">
			<cfset form.HCFA_24_TBox_Line4_DateOfserviceToDD = "">
			<cfset form.HCFA_24_TBox_Line4_DateOfserviceToYY = "">
		</cfif>
		
		<cfset HCFA_24_TBox_Line4_DateOfserviceTo = "#trim(form.HCFA_24_TBox_Line4_DateOfserviceToMM)#/#trim(form.HCFA_24_TBox_Line4_DateOfserviceToDD)#/#trim(form.HCFA_24_TBox_Line4_DateOfserviceToYY)#">
		<cfif NOT IsDate(HCFA_24_TBox_Line4_DateOfserviceTo)>
			<cfset form.HCFA_24_TBox_Line4_DateOfserviceToMM = "">
			<cfset form.HCFA_24_TBox_Line4_DateOfserviceToDD = "">
			<cfset form.HCFA_24_TBox_Line4_DateOfserviceToYY = "">
		</cfif>
		
		<cfset HCFA_24_TBox_Line5_DateOfserviceFrom = "#trim(form.HCFA_24_TBox_Line5_DateOfserviceToMM)#/#trim(form.HCFA_24_TBox_Line5_DateOfserviceToDD)#/#trim(form.HCFA_24_TBox_Line5_DateOfserviceToYY)#">
		<cfif NOT IsDate(HCFA_24_TBox_Line5_DateOfserviceFrom)>
			<cfset form.HCFA_24_TBox_Line5_DateOfserviceToMM = "">
			<cfset form.HCFA_24_TBox_Line5_DateOfserviceToDD = "">
			<cfset form.HCFA_24_TBox_Line5_DateOfserviceToYY = "">
		</cfif>
		
		<cfset HCFA_24_TBox_Line5_DateOfserviceTo = "#trim(form.HCFA_24_TBox_Line5_DateOfserviceToMM)#/#trim(form.HCFA_24_TBox_Line5_DateOfserviceToDD)#/#trim(form.HCFA_24_TBox_Line5_DateOfserviceToYY)#">
		<cfif NOT IsDate(HCFA_24_TBox_Line5_DateOfserviceTo)>
			<cfset form.HCFA_24_TBox_Line5_DateOfserviceToMM = "">
			<cfset form.HCFA_24_TBox_Line5_DateOfserviceToDD = "">
			<cfset form.HCFA_24_TBox_Line5_DateOfserviceToYY = "">
		</cfif>
		
		<cfset HCFA_24_TBox_Line6_DateOfserviceFrom = "#trim(form.HCFA_24_TBox_Line6_DateOfserviceToMM)#/#trim(form.HCFA_24_TBox_Line6_DateOfserviceToDD)#/#trim(form.HCFA_24_TBox_Line6_DateOfserviceToYY)#">
		<cfif NOT IsDate(HCFA_24_TBox_Line6_DateOfserviceFrom)>
			<cfset form.HCFA_24_TBox_Line6_DateOfserviceToMM = "">
			<cfset form.HCFA_24_TBox_Line6_DateOfserviceToDD = "">
			<cfset form.HCFA_24_TBox_Line6_DateOfserviceToYY = "">
		</cfif>
		
		<cfset HCFA_24_TBox_Line6_DateOfserviceTo = "#trim(form.HCFA_24_TBox_Line6_DateOfserviceToMM)#/#trim(form.HCFA_24_TBox_Line6_DateOfserviceToDD)#/#trim(form.HCFA_24_TBox_Line6_DateOfserviceToYY)#">
		<cfif NOT IsDate(HCFA_24_TBox_Line6_DateOfserviceTo)>
			<cfset form.HCFA_24_TBox_Line6_DateOfserviceToMM = "">
			<cfset form.HCFA_24_TBox_Line6_DateOfserviceToDD = "">
			<cfset form.HCFA_24_TBox_Line6_DateOfserviceToYY = "">
		</cfif>
		
		<cfif trim(form.HCFA_0_TBox_NameAddressSendToInsurance_City) NEQ "">
			<cfset InsuranceCompanyCityStateZip = "#trim(form.HCFA_0_TBox_NameAddressSendToInsurance_City)#, #trim(form.HCFA_0_TBox_NameAddressSendToInsurance_State)# #trim(form.HCFA_0_TBox_NameAddressSendToInsurance_ZipCode)#">
		<cfelse>
			<cfset InsuranceCompanyCityStateZip = "#trim(form.HCFA_0_TBox_NameAddressSendToInsurance_State)# #trim(form.HCFA_0_TBox_NameAddressSendToInsurance_ZipCode)#">
		</cfif>
		
		<cfif trim(form.HCFA_31_TBox_SignatureOfPhysicianOrSupplierDateMM) EQ "" OR trim(form.HCFA_31_TBox_SignatureOfPhysicianOrSupplierDateDD) EQ "" OR trim(form.HCFA_31_TBox_SignatureOfPhysicianOrSupplierDateYY) EQ "">
			<cfset Signature_Of_PhysicianDate_31 = "">
		<cfelse>	
			<cfset Signature_Of_PhysicianDate_31 = "#trim(form.HCFA_31_TBox_SignatureOfPhysicianOrSupplierDateMM)#/#trim(form.HCFA_31_TBox_SignatureOfPhysicianOrSupplierDateDD)#/#trim(form.HCFA_31_TBox_SignatureOfPhysicianOrSupplierDateYY)#">
		</cfif>
												
		<cf_gcCreatePopulatedHCFA1500PDF			
			filename="ClaimPrintHCFA_#session.Client.getClientID()#_#trim(fileDateTimeStamp)#_#trim(ClaimID)#.pdf"
			savefilepath="#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#"
			notetopayer="#trim(form.noteToPayer)#"
			InsuranceCompanyName="#trim(form.HCFA_0_TBox_NameAddressSendToInsurance_Name)#"
			InsuranceCompanyAddressLine1="#trim(form.HCFA_0_TBox_NameAddressSendToInsurance_AddressLine1)#"
			InsuranceCompanyAddressLine2="#trim(form.HCFA_0_TBox_NameAddressSendToInsurance_AddressLine2)#"
			InsuranceCompanyCityStateZip="#trim(InsuranceCompanyCityStateZip)#"
			Medicare_1="#trim(form.HCFA_1_CBox_Medicare)#"
			Medicaid_1="#trim(form.HCFA_1_CBox_Medicaid)#"
			Champus_1="#trim(form.HCFA_1_CBox_Champus)#"
			ChampVa_1="#trim(form.HCFA_1_CBox_ChampVA)#"
			GroupHealthPlan_1="#trim(form.HCFA_1_CBox_GroupHealthPlan)#"
			FecaBlkLung_1="#trim(form.HCFA_1_CBox_FecaBlkLung)#"
			Other_1="#trim(form.HCFA_1_CBox_Other)#"
			InsuredsIDNumber_1a="#trim(form.HCFA_1a_TBox_InsuredsIDNumber)#"
			PatientsName_2="#trim(PatientName)#"
			PatientsBirthDate_MM_3="#trim(form.HCFA_3_TBox_PatientsBirthDateMM)#"
			PatientsBirthDate_DD_3="#trim(form.HCFA_3_TBox_PatientsBirthDateDD)#"
			PatientsBirthDate_YY_3="#trim(form.HCFA_3_TBox_PatientsBirthDateYY)#"
			PatientsBirthDate_Sex_M_3="#trim(form.HCFA_3_CBox_Sex_Male)#"
			PatientsBirthDate_Sex_F_3="#trim(form.HCFA_3_CBox_Sex_Female)#"
			InsuredsName_4="#trim(InsuredsName)#"
			PatientsAddress_StreetNo_5="#trim(form.HCFA_5_TBox_PatientAddressNoStreet)#"
			PatientsAddress_City_5="#trim(form.HCFA_5_TBox_PatientAddressCity)#"
			PatientsAddress_State_5="#trim(form.HCFA_5_TBox_PatientAddressState)#"
			PatientsAddress_Zip_5="#trim(form.HCFA_5_TBox_PatientAddressZipCode)#"
			PatientsAddress_PhoneAreaCode_5="#trim(form.HCFA_5_TBox_PatientTelephoneAreaCode)#"
			PatientsAddress_Phone_5="#trim(form.HCFA_5_TBox_PatientTelephoneNumber)#"
			PatientRelationshipToInsured_Self_6="#trim(form.HCFA_6_CBox_PATIENTRELTOINSURED_Self)#"
			PatientRelationshipToInsured_Spouse_6="#trim(form.HCFA_6_CBox_PATIENTRELTOINSURED_Spouse)#"
			PatientRelationshipToInsured_Child_6="#trim(form.HCFA_6_CBox_PATIENTRELTOINSURED_Child)#"
			PatientRelationshipToInsured_Other_6="#trim(form.HCFA_6_CBox_PATIENTRELTOINSURED_Other)#"
			InsuredAddress_StreetNo_7="#trim(form.HCFA_7_TBox_InsuredsAddressNoStreet)#"
			InsuredAddress_City_7="#trim(form.HCFA_7_TBox_InsuredsAddressCity)#"
			InsuredAddress_State_7="#trim(form.HCFA_7_TBox_InsuredsAddressState)#"
			InsuredAddress_Zip_7="#trim(form.HCFA_7_TBox_InsuredsAddressZipCode)#"
			InsuredAddress_PhoneAreaCode_7="#trim(form.HCFA_7_TBox_InsuredsTelephoneAreaCode)#"
			InsuredAddress_Phone_7="#trim(form.HCFA_7_TBox_InsuredsTelephoneNumber)#"
			PatientStatus_Single_8="#trim(form.HCFA_8_CBox_PATIENTSTATUS_Single)#"
			PatientStatus_Employed_8="#trim(form.HCFA_8_CBox_PATIENTSTATUSEMPLOYMENT_Employed)#"
			PatientStatus_Married_8="#trim(form.HCFA_8_CBox_PATIENTSTATUS_Married)#"
			PatientStatus_FullTimeStudent_8="#trim(form.HCFA_8_CBox_PATIENTSTATUSEMPLOYMENT_FullTimeStudent)#"
			PatientStatus_Other_8="#trim(form.HCFA_8_CBox_PATIENTSTATUS_Other)#"
			PatientStatus_PartTimeStudent_8="#trim(form.HCFA_8_CBox_PATIENTSTATUSEMPLOYMENT_PartTimeStudent)#"
			OtherInsuredsName_9="#trim(OtherInsuredsName)#"
			OtherInsuredsPolicyOrGroupNumber_9a="#trim(form.HCFA_9_TBox_a_OtherInsuredsPolicyGroupFecaNumber)#"
			OtherInsuredsDateOfBirth_MM_9b="#trim(form.HCFA_9_TBox_b_OtherInsuredsBirthDateMM)#"
			OtherInsuredsDateOfBirth_DD_9b="#trim(form.HCFA_9_TBox_b_OtherInsuredsBirthDateDD)#"
			OtherInsuredsDateOfBirth_YY_9b="#trim(form.HCFA_9_TBox_b_OtherInsuredsBirthDateYY)#"
			OtherInsuredsDateOfBirth_Sex_M_9b="#trim(form.HCFA_9_CBox_b_Sex_Male)#"
			OtherInsuredsDateOfBirth_Sex_F_9b="#trim(form.HCFA_9_CBox_b_Sex_Female)#"
			EmployersNameOrSchoolName_9c="#trim(form.HCFA_9_TBox_c_EmployersNameOrSchoolName)#"
			InsurancePlanNameOrProgramName_9d="#trim(form.HCFA_9_TBox_d_InsurancePlanNameOrProgramName)#"
			IsPatientsConditionRelatedTo_Employment_Yes_10a="#trim(form.HCFA_10_CBox_a_PATIENTSCONDITIONEMPLOYMENT_Yes)#"
			IsPatientsConditionRelatedTo_Employment_No_10a="#trim(form.HCFA_10_CBox_a_PATIENTSCONDITIONEMPLOYMENT_No)#"
			IsPatientsConditionRelatedTo_AutoAccident_Yes_10b="#trim(form.HCFA_10_CBox_b_PATIENTSCONDITIONAUTOACCIDENT_Yes)#"
			IsPatientsConditionRelatedTo_AutoAccident_No_10b="#trim(form.HCFA_10_CBox_b_PATIENTSCONDITIONAUTOACCIDENT_No)#"
			IsPatientsConditionRelatedTo_PlaceState_10b="#trim(form.HCFA_10_TBox_PatientConditionAutoAccidentState)#"
			IsPatientsConditionRelatedTo_OtherAccident_Yes_10c="#trim(form.HCFA_10_CBox_c_PATIENTSCONDITIONOTHERACCIDENT_Yes)#"
			IsPatientsConditionRelatedTo_OtherAccident_No_10c="#trim(form.HCFA_10_CBox_c_PATIENTSCONDITIONOTHERACCIDENT_No)#"
			ReservedForLocalUse_10d="#trim(form.HCFA_10_TBox_d_ReservedForLocalUse)#"
			InsuredPolicyGroupOrFecaNumber_11a="#trim(form.HCFA_11_TBox_InsuredsPolicyGroupFecaNumber)#"
			InsuredDateOfBirth_MM_11a="#trim(form.HCFA_11_TBox_a_InsuredsBirthDateMM)#"
			InsuredDateOfBirth_DD_11a="#trim(form.HCFA_11_TBox_a_InsuredsBirthDateDD)#"
			InsuredDateOfBirth_YY_11a="#trim(form.HCFA_11_TBox_a_InsuredsBirthDateYY)#"
			InsuredDateOfBirth_Sex_M_11a="#trim(form.HCFA_11_CBox_a_Sex_Male)#"
			InsuredDateOfBirth_Sex_F_11a="#trim(form.HCFA_11_CBox_a_Sex_Female)#"
			EmployersSchoolOrSchoolName_11b="#trim(form.HCFA_11_TBox_b_EmployersNameOrSchoolName)#"
			InsurancePlanNameOrProgramName_11c="#trim(form.HCFA_11_TBox_c_InsurancePlanNameOrProgramName)#"
			IsThereAnotherHealthBenefitPlan_Yes_11d="#trim(form.HCFA_11_CBox_d_OtherHealthBenefitPlan_Yes)#"
			IsThereAnotherHealthBenefitPlan_No_11d="#trim(form.HCFA_11_CBox_d_OtherHealthBenefitPlan_No)#"
			PatientsOrAuthorizedSigniature_Signed_12="#trim(form.HCFA_12_TBox_SignatureOnFile)#"
			PatientsOrAuthorizedSigniature_Date_MM_12="#trim(form.HCFA_12_TBox_SignatureOnFileDateMM)#"
			PatientsOrAuthorizedSigniature_Date_DD_12="#trim(form.HCFA_12_TBox_SignatureOnFileDateDD)#"
			PatientsOrAuthorizedSigniature_Date_YY_12="#trim(form.HCFA_12_TBox_SignatureOnFileDateYY)#"
			PatientsOrAuthorizedSigniature_Date_12="#trim(form.HCFA_12_TBox_SignatureOnFileDateMM)#/#trim(form.HCFA_12_TBox_SignatureOnFileDateDD)#/#trim(form.HCFA_12_TBox_SignatureOnFileDateYY)#"
			InsuredsOrAuthorizedSigniture_13="#trim(form.HCFA_13_TBox_SignatureOnFile)#"
			DateOfCurrentIllness_MM_14="#trim(form.HCFA_14_TBox_DateOfCurrentIllnessMM)#"
			DateOfCurrentIllness_DD_14="#trim(form.HCFA_14_TBox_DateOfCurrentIllnessDD)#"
			DateOfCurrentIllness_YY_14="#trim(form.HCFA_14_TBox_DateOfCurrentIllnessYY)#"
			PtHadSameOrSimularIllness_MM_15="#trim(form.HCFA_15_TBox_DateOfSimilarIllnessMM)#"
			PtHadSameOrSimularIllness_DD_15="#trim(form.HCFA_15_TBox_DateOfSimilarIllnessDD)#"
			PtHadSameOrSimularIllness_YY_15="#trim(form.HCFA_15_TBox_DateOfSimilarIllnessYY)#"
			DatesPatientUnableToWorkFrom_MM_16="#trim(form.HCFA_16_TBox_DatePatientUnableFromMM)#"
			DatesPatientUnableToWorkFrom_DD_16="#trim(form.HCFA_16_TBox_DatePatientUnableFromDD)#"
			DatesPatientUnableToWorkFrom_YY_16="#trim(form.HCFA_16_TBox_DatePatientUnableFromYY)#"
			DatesPatientUnableToWorkTo_MM_16="#trim(form.HCFA_16_TBox_DatePatientUnableToMM)#"
			DatesPatientUnableToWorkTo_DD_16="#trim(form.HCFA_16_TBox_DatePatientUnableToDD)#"
			DatesPatientUnableToWorkTo_YY_16="#trim(form.HCFA_16_TBox_DatePatientUnableToYY)#"
			NameOfReferringPhysician_17="#trim(form.HCFA_17_TBox_NameOfReferringPhysicianOrOtherSource)#"
			IdOfReferringPhysician_17a="#trim(form.HCFA_17_TBox_a_IDNumberOfReferringPhysician)#"
			HospitalizationDatesFrom_MM_18="#trim(form.HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesFromMM)#"
			HospitalizationDatesFrom_DD_18="#trim(form.HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesFromDD)#"
			HospitalizationDatesFrom_YY_18="#trim(form.HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesFromYY)#"
			HospitalizationDatesTo_MM_18="#trim(form.HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesToMM)#"
			HospitalizationDatesTo_DD_18="#trim(form.HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesToDD)#"
			HospitalizationDatesTo_YY_18="#trim(form.HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesToYY)#"
			ReservedForLocalUse_19="#trim(form.HCFA_19_TBox_ReservedForUSERUse)#"
			OutsideLabYes_20="#trim(form.HCFA_20_CBox_OUTSIDELAB_Yes)#"
			OutsideLabNo_20="#trim(form.HCFA_20_CBox_OUTSIDELAB_No)#"
			OutsideLabCharges_20="#trim(form.HCFA_20_TBox_OutsideLabCharges1)#"
			OutsideLabChargesCents_20="#trim(form.HCFA_20_TBox_OutsideLabCharges2)#"
			Diagnosis1_21="#trim(form.HCFA_21_TBox_Diagnosis1)#"
			Diagnosis2_21="#trim(form.HCFA_21_TBox_Diagnosis2)#"
			Diagnosis3_21="#trim(form.HCFA_21_TBox_Diagnosis3)#"
			Diagnosis4_21="#trim(form.HCFA_21_TBox_Diagnosis4)#"
			MedicaidResubmission_Code_22="#trim(form.HCFA_22_TBox_MedicaidResubmission1)#"
			MedicaidResubmission_OrigRefNo_22="#trim(form.HCFA_22_TBox_MedicaidResubmission2)#"
			PriorAuthNo_23="#trim(form.HCFA_23_TBox_PriorAuthorizationNumber)#"			
			DatesOfServiceFrom1_MM_24a_Line1="#trim(form.HCFA_24_TBox_Line1_DateOfserviceFromMM)#"
			DatesOfServiceFrom1_DD_24a_Line1="#trim(form.HCFA_24_TBox_Line1_DateOfserviceFromDD)#"
			DatesOfServiceFrom1_YY_24a_Line1="#trim(form.HCFA_24_TBox_Line1_DateOfserviceFromYY)#"
			DatesOfServiceTo1_MM_24a_Line1="#trim(form.HCFA_24_TBox_Line1_DateOfserviceToMM)#"
			DatesOfServiceTo1_DD_24a_Line1="#trim(form.HCFA_24_TBox_Line1_DateOfserviceToDD)#"
			DatesOfServiceTo1_YY_24a_Line1="#trim(form.HCFA_24_TBox_Line1_DateOfserviceToYY)#"
			PlaceOfService1_24b_Line1="#trim(form.HCFA_24_TBox_Line1_PlaceOfService)#"
			TypeOfService1_24c_Line1="#trim(form.HCFA_24_TBox_Line1_TypeOfService)#"
			Procedures_HCPCS1_24d_Line1="#trim(form.HCFA_24_TBox_Line1_CPTHCPCS)#"
			Procedures_Modifier1_1_24d_Line1="#trim(form.HCFA_24_TBox_Line1_Modifier1)#"
			Procedures_Modifier1_2_24d_Line1="#trim(form.HCFA_24_TBox_Line1_Modifier2)#"
			Procedures_Modifier1_3_24d_Line1="#trim(form.HCFA_24_TBox_Line1_Modifier3)#"
			Procedures_Modifier1_4_24d_Line1="#trim(form.HCFA_24_TBox_Line1_Modifier4)#"
			DiagnosisCode1_24e_Line1="#trim(form.HCFA_24_TBox_Line1_DiagnosisCode)#"
			Charges1_24f_Line1="#trim(form.HCFA_24_TBox_Line1_Charges)#"
			ChargesCents1_24f_Line1="#trim(form.HCFA_24_TBox_Line1_ChargesCents)#"
			DaysOrUnits1_24g_Line1="#trim(form.HCFA_24_TBox_Line1_DaysOrUnits)#"
			EpsdtFamilyPlan1_24h_Line1="#trim(form.HCFA_24_TBox_Line1_EPSDTFamilyPlan)#"
			Emg1_24i_Line1="#trim(form.HCFA_24_TBox_Line1_EMG)#"
			Cob1_24j_Line1="#trim(form.HCFA_24_TBox_Line1_COB)#"
			ReservedForLocalUse1_24k_Line1="#trim(form.HCFA_24_TBox_Line1_ReservedForLocalUse)#"			
			DatesOfServiceFrom1_MM_24a_Line2="#trim(form.HCFA_24_TBox_Line2_DateOfserviceFromMM)#"
			DatesOfServiceFrom1_DD_24a_Line2="#trim(form.HCFA_24_TBox_Line2_DateOfserviceFromDD)#"
			DatesOfServiceFrom1_YY_24a_Line2="#trim(form.HCFA_24_TBox_Line2_DateOfserviceFromYY)#"
			DatesOfServiceTo1_MM_24a_Line2="#trim(form.HCFA_24_TBox_Line2_DateOfserviceToMM)#"
			DatesOfServiceTo1_DD_24a_Line2="#trim(form.HCFA_24_TBox_Line2_DateOfserviceToDD)#"
			DatesOfServiceTo1_YY_24a_Line2="#trim(form.HCFA_24_TBox_Line2_DateOfserviceToYY)#"
			PlaceOfService1_24b_Line2="#trim(form.HCFA_24_TBox_Line2_PlaceOfService)#"
			TypeOfService1_24c_Line2="#trim(form.HCFA_24_TBox_Line2_TypeOfService)#"
			Procedures_HCPCS1_24d_Line2="#trim(form.HCFA_24_TBox_Line2_CPTHCPCS)#"
			Procedures_Modifier1_1_24d_Line2="#trim(form.HCFA_24_TBox_Line2_Modifier1)#"
			Procedures_Modifier1_2_24d_Line2="#trim(form.HCFA_24_TBox_Line2_Modifier2)#"
			Procedures_Modifier1_3_24d_Line2="#trim(form.HCFA_24_TBox_Line2_Modifier3)#"
			Procedures_Modifier1_4_24d_Line2="#trim(form.HCFA_24_TBox_Line2_Modifier4)#"
			DiagnosisCode1_24e_Line2="#trim(form.HCFA_24_TBox_Line2_DiagnosisCode)#"
			Charges1_24f_Line2="#trim(form.HCFA_24_TBox_Line2_Charges)#"
			ChargesCents1_24f_Line2="#trim(form.HCFA_24_TBox_Line2_ChargesCents)#"
			DaysOrUnits1_24g_Line2="#trim(form.HCFA_24_TBox_Line2_DaysOrUnits)#"
			EpsdtFamilyPlan1_24h_Line2="#trim(form.HCFA_24_TBox_Line2_EPSDTFamilyPlan)#"
			Emg1_24i_Line2="#trim(form.HCFA_24_TBox_Line2_EMG)#"
			Cob1_24j_Line2="#trim(form.HCFA_24_TBox_Line2_COB)#"
			ReservedForLocalUse1_24k_Line2="#trim(form.HCFA_24_TBox_Line2_ReservedForLocalUse)#"						
			DatesOfServiceFrom1_MM_24a_Line3="#trim(form.HCFA_24_TBox_Line3_DateOfserviceFromMM)#"
			DatesOfServiceFrom1_DD_24a_Line3="#trim(form.HCFA_24_TBox_Line3_DateOfserviceFromDD)#"
			DatesOfServiceFrom1_YY_24a_Line3="#trim(form.HCFA_24_TBox_Line3_DateOfserviceFromYY)#"
			DatesOfServiceTo1_MM_24a_Line3="#trim(form.HCFA_24_TBox_Line3_DateOfserviceToMM)#"
			DatesOfServiceTo1_DD_24a_Line3="#trim(form.HCFA_24_TBox_Line3_DateOfserviceToDD)#"
			DatesOfServiceTo1_YY_24a_Line3="#trim(form.HCFA_24_TBox_Line3_DateOfserviceToYY)#"
			PlaceOfService1_24b_Line3="#trim(form.HCFA_24_TBox_Line3_PlaceOfService)#"
			TypeOfService1_24c_Line3="#trim(form.HCFA_24_TBox_Line3_TypeOfService)#"
			Procedures_HCPCS1_24d_Line3="#trim(form.HCFA_24_TBox_Line3_CPTHCPCS)#"
			Procedures_Modifier1_1_24d_Line3="#trim(form.HCFA_24_TBox_Line3_Modifier1)#"
			Procedures_Modifier1_2_24d_Line3="#trim(form.HCFA_24_TBox_Line3_Modifier2)#"
			Procedures_Modifier1_3_24d_Line3="#trim(form.HCFA_24_TBox_Line3_Modifier3)#"
			Procedures_Modifier1_4_24d_Line3="#trim(form.HCFA_24_TBox_Line3_Modifier4)#"
			DiagnosisCode1_24e_Line3="#trim(form.HCFA_24_TBox_Line3_DiagnosisCode)#"
			Charges1_24f_Line3="#trim(form.HCFA_24_TBox_Line3_Charges)#"
			ChargesCents1_24f_Line3="#trim(form.HCFA_24_TBox_Line3_ChargesCents)#"
			DaysOrUnits1_24g_Line3="#trim(form.HCFA_24_TBox_Line3_DaysOrUnits)#"
			EpsdtFamilyPlan1_24h_Line3="#trim(form.HCFA_24_TBox_Line3_EPSDTFamilyPlan)#"
			Emg1_24i_Line3="#trim(form.HCFA_24_TBox_Line3_EMG)#"
			Cob1_24j_Line3="#trim(form.HCFA_24_TBox_Line3_COB)#"
			ReservedForLocalUse1_24k_Line3="#trim(form.HCFA_24_TBox_Line3_ReservedForLocalUse)#"			
			DatesOfServiceFrom1_MM_24a_Line4="#trim(form.HCFA_24_TBox_Line4_DateOfserviceFromMM)#"
			DatesOfServiceFrom1_DD_24a_Line4="#trim(form.HCFA_24_TBox_Line4_DateOfserviceFromDD)#"
			DatesOfServiceFrom1_YY_24a_Line4="#trim(form.HCFA_24_TBox_Line4_DateOfserviceFromYY)#"
			DatesOfServiceTo1_MM_24a_Line4="#trim(form.HCFA_24_TBox_Line4_DateOfserviceToMM)#"
			DatesOfServiceTo1_DD_24a_Line4="#trim(form.HCFA_24_TBox_Line4_DateOfserviceToDD)#"
			DatesOfServiceTo1_YY_24a_Line4="#trim(form.HCFA_24_TBox_Line4_DateOfserviceToYY)#"
			PlaceOfService1_24b_Line4="#trim(form.HCFA_24_TBox_Line4_PlaceOfService)#"
			TypeOfService1_24c_Line4="#trim(form.HCFA_24_TBox_Line4_TypeOfService)#"
			Procedures_HCPCS1_24d_Line4="#trim(form.HCFA_24_TBox_Line4_CPTHCPCS)#"
			Procedures_Modifier1_1_24d_Line4="#trim(form.HCFA_24_TBox_Line4_Modifier1)#"
			Procedures_Modifier1_2_24d_Line4="#trim(form.HCFA_24_TBox_Line4_Modifier2)#"
			Procedures_Modifier1_3_24d_Line4="#trim(form.HCFA_24_TBox_Line4_Modifier3)#"
			Procedures_Modifier1_4_24d_Line4="#trim(form.HCFA_24_TBox_Line4_Modifier4)#"
			DiagnosisCode1_24e_Line4="#trim(form.HCFA_24_TBox_Line4_DiagnosisCode)#"
			Charges1_24f_Line4="#trim(form.HCFA_24_TBox_Line4_Charges)#"
			ChargesCents1_24f_Line4="#trim(form.HCFA_24_TBox_Line4_ChargesCents)#"
			DaysOrUnits1_24g_Line4="#trim(form.HCFA_24_TBox_Line4_DaysOrUnits)#"
			EpsdtFamilyPlan1_24h_Line4="#trim(form.HCFA_24_TBox_Line4_EPSDTFamilyPlan)#"
			Emg1_24i_Line4="#trim(form.HCFA_24_TBox_Line4_EMG)#"
			Cob1_24j_Line4="#trim(form.HCFA_24_TBox_Line4_COB)#"
			ReservedForLocalUse1_24k_Line4="#trim(form.HCFA_24_TBox_Line4_ReservedForLocalUse)#"			
			DatesOfServiceFrom1_MM_24a_Line5="#trim(form.HCFA_24_TBox_Line5_DateOfserviceFromMM)#"
			DatesOfServiceFrom1_DD_24a_Line5="#trim(form.HCFA_24_TBox_Line5_DateOfserviceFromDD)#"
			DatesOfServiceFrom1_YY_24a_Line5="#trim(form.HCFA_24_TBox_Line5_DateOfserviceFromYY)#"
			DatesOfServiceTo1_MM_24a_Line5="#trim(form.HCFA_24_TBox_Line5_DateOfserviceToMM)#"
			DatesOfServiceTo1_DD_24a_Line5="#trim(form.HCFA_24_TBox_Line5_DateOfserviceToDD)#"
			DatesOfServiceTo1_YY_24a_Line5="#trim(form.HCFA_24_TBox_Line5_DateOfserviceToYY)#"
			PlaceOfService1_24b_Line5="#trim(form.HCFA_24_TBox_Line5_PlaceOfService)#"
			TypeOfService1_24c_Line5="#trim(form.HCFA_24_TBox_Line5_TypeOfService)#"
			Procedures_HCPCS1_24d_Line5="#trim(form.HCFA_24_TBox_Line5_CPTHCPCS)#"
			Procedures_Modifier1_1_24d_Line5="#trim(form.HCFA_24_TBox_Line5_Modifier1)#"
			Procedures_Modifier1_2_24d_Line5="#trim(form.HCFA_24_TBox_Line5_Modifier2)#"
			Procedures_Modifier1_3_24d_Line5="#trim(form.HCFA_24_TBox_Line5_Modifier3)#"
			Procedures_Modifier1_4_24d_Line5="#trim(form.HCFA_24_TBox_Line5_Modifier4)#"
			DiagnosisCode1_24e_Line5="#trim(form.HCFA_24_TBox_Line5_DiagnosisCode)#"
			Charges1_24f_Line5="#trim(form.HCFA_24_TBox_Line5_Charges)#"
			ChargesCents1_24f_Line5="#trim(form.HCFA_24_TBox_Line5_ChargesCents)#"
			DaysOrUnits1_24g_Line5="#trim(form.HCFA_24_TBox_Line5_DaysOrUnits)#"
			EpsdtFamilyPlan1_24h_Line5="#trim(form.HCFA_24_TBox_Line5_EPSDTFamilyPlan)#"
			Emg1_24i_Line5="#trim(form.HCFA_24_TBox_Line5_EMG)#"
			Cob1_24j_Line5="#trim(form.HCFA_24_TBox_Line5_COB)#"
			ReservedForLocalUse1_24k_Line5="#trim(form.HCFA_24_TBox_Line5_ReservedForLocalUse)#"			
			DatesOfServiceFrom1_MM_24a_Line6="#trim(form.HCFA_24_TBox_Line6_DateOfserviceFromMM)#"
			DatesOfServiceFrom1_DD_24a_Line6="#trim(form.HCFA_24_TBox_Line6_DateOfserviceFromDD)#"
			DatesOfServiceFrom1_YY_24a_Line6="#trim(form.HCFA_24_TBox_Line6_DateOfserviceFromYY)#"
			DatesOfServiceTo1_MM_24a_Line6="#trim(form.HCFA_24_TBox_Line6_DateOfserviceToMM)#"
			DatesOfServiceTo1_DD_24a_Line6="#trim(form.HCFA_24_TBox_Line6_DateOfserviceToDD)#"
			DatesOfServiceTo1_YY_24a_Line6="#trim(form.HCFA_24_TBox_Line6_DateOfserviceToYY)#"
			PlaceOfService1_24b_Line6="#trim(form.HCFA_24_TBox_Line6_PlaceOfService)#"
			TypeOfService1_24c_Line6="#trim(form.HCFA_24_TBox_Line6_TypeOfService)#"
			Procedures_HCPCS1_24d_Line6="#trim(form.HCFA_24_TBox_Line6_CPTHCPCS)#"
			Procedures_Modifier1_1_24d_Line6="#trim(form.HCFA_24_TBox_Line6_Modifier1)#"
			Procedures_Modifier1_2_24d_Line6="#trim(form.HCFA_24_TBox_Line6_Modifier2)#"
			Procedures_Modifier1_3_24d_Line6="#trim(form.HCFA_24_TBox_Line6_Modifier3)#"
			Procedures_Modifier1_4_24d_Line6="#trim(form.HCFA_24_TBox_Line6_Modifier4)#"
			DiagnosisCode1_24e_Line6="#trim(form.HCFA_24_TBox_Line6_DiagnosisCode)#"
			Charges1_24f_Line6="#trim(form.HCFA_24_TBox_Line6_Charges)#"
			ChargesCents1_24f_Line6="#trim(form.HCFA_24_TBox_Line6_ChargesCents)#"
			DaysOrUnits1_24g_Line6="#trim(form.HCFA_24_TBox_Line6_DaysOrUnits)#"
			EpsdtFamilyPlan1_24h_Line6="#trim(form.HCFA_24_TBox_Line6_EPSDTFamilyPlan)#"
			Emg1_24i_Line6="#trim(form.HCFA_24_TBox_Line6_EMG)#"
			Cob1_24j_Line6="#trim(form.HCFA_24_TBox_Line6_COB)#"
			ReservedForLocalUse1_24k_Line6="#trim(form.HCFA_24_TBox_Line6_ReservedForLocalUse)#"			
			FederalTaxIdNumber_25="#trim(form.HCFA_25_TBox_FederalTaxIDNumber)#"
			Ssn_25="#trim(form.HCFA_25_CBox_FederalTaxIDNumberSSNEIN_SSN)#"
			Ein_25="#trim(form.HCFA_25_CBox_FederalTaxIDNumberSSNEIN_EIN)#"
			PatientsAccountNo_26="#trim(form.HCFA_26_TBox_PatientsAccountNumber)#"
			AcceptAssignmentYes_25="#trim(form.HCFA_27_CBox_ACCEPTASSIGNMENT_Yes)#"
			AcceptAssignmentNo_25="#trim(form.HCFA_27_CBox_ACCEPTASSIGNMENT_No)#"
			TotalChargesDollars_28="#trim(form.HCFA_28_TBox_TotalChargeDollars)#"
			TotalChargesCents_28="#trim(form.HCFA_28_TBox_TotalChargeCents)#"
			AmountPaidDollars_29="#trim(HCFA_29_TBox_AmountPaidDollars)#"
			AmountPaidCents_29="#trim(HCFA_29_TBox_AmountPaidCents)#"
			BalanceDueDollars_30="#trim(HCFA_30_TBox_BalanceDueDollars)#"
			BalanceDueCents_30="#trim(HCFA_30_TBox_BalanceDueCents)#"
			Signature_Of_Physician_31="#trim(form.HCFA_31_TBox_SignatureOfPhysicianOrSupplier)#"
			Signature_Of_PhysicianDate_31="#trim(Signature_Of_PhysicianDate_31)#"
			NameAndAddressOfFacility_Name_32="#trim(form.HCFA_32_TBox_NameAddressFacilityServicesRendered_Name)#"
			NameAndAddressOfFacility_Address_32="#trim(form.HCFA_32_TBox_NameAddressFacilityServicesRendered_AddressLine1)# #trim(form.HCFA_32_TBox_NameAddressFacilityServicesRendered_AddressLine2)#"
			NameAndAddressOfFacility_City_32="#trim(form.HCFA_32_TBox_NameAddressFacilityServicesRendered_City)#"
			NameAndAddressOfFacility_State_32="#trim(form.HCFA_32_TBox_NameAddressFacilityServicesRendered_State)#"
			NameAndAddressOfFacility_Zip_32="#trim(form.HCFA_32_TBox_NameAddressFacilityServicesRendered_ZipCode)#"
			PhysicianSupplierBillingName_33="#trim(form.HCFA_33_TBox_NameAddressPhysiciansSupplierBilling_Name)#"
			PhysicianSupplierBillingAddress_33="#trim(form.HCFA_33_TBox_NameAddressPhysiciansSupplierBilling_AddressLine1)#"
			<!---PhysicianSupplierBillingTelephone_33="(#trim(form.HCFA_33_TBox_NameAddressPhysiciansSupplierBilling_TelephoneAreaCode)#) #trim(form.HCFA_33_TBox_NameAddressPhysiciansSupplierBilling_TelephoneNumber)#"--->
			PhysicianSupplierBillingCity_33="#trim(form.HCFA_33_TBox_NameAddressPhysiciansSupplierBilling_City)#"
			PhysicianSupplierBillingState_33="#trim(form.HCFA_33_TBox_NameAddressPhysiciansSupplierBilling_State)#"
			PhysicianSupplierBillingZip_33="#trim(form.HCFA_33_TBox_NameAddressPhysiciansSupplierBilling_ZipCode)#"
			Pin_Num_33="#trim(form.HCFA_33_TBox_PinNumber)#"
			Grp_Num_33="#trim(form.HCFA_33_TBox_GroupNumber)#">
					
		<cfset listOfFiles = listAppend(listOfFiles, "#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\ClaimPrintHCFA_#session.Client.getClientID()#_#trim(fileDateTimeStamp)#_#trim(ClaimID)#.pdf")>
		
	</cfif>


	
	

	
<!-------------------------------------------------------------------------------------->
<!--- We only want to create the pdf file if the user chose to print it.             --->
<!-------------------------------------------------------------------------------------->	
<cfif IsDefined("form.claimData")>	
		
		
	<!-------------------------------------------------------------------------------------->
	<!--- Get the information on this specific patient.                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cfquery name="getClaimDetails" datasource="#trim(request.datasource)#">
		SELECT i.LXAssignedNumber, c.ClaimID, c.InterchangeClaimID, c.InterchangeID, c.clientAssignedClaimID, c.claimType, c.EntityID, 
		c.PatientResponsibilityAmount, c.claimpreviousPaidAmount, c.InterchangeID, c.assignedToUserID, c.Active, c.InactiveCode, c.DateCreated, 
		c.DueDate, c.FacilityCode, c.CrossoverNameLastorOrganizationName3, 		
		u.usersID, e.FName As userFName, e.LName AS userLName, TIMESTAMPDIFF(day, c.DateCreated, now()) AS days, 
		p.PatientID, patientEntity.FName AS patientFName, patientEntity.LName AS patientLName, c.HICNumber
		FROM claim c 
		LEFT JOIN pa_master.users u ON c.AssignedToUserID = u.UsersID 
		LEFT JOIN Entity e ON u.EntityID = e.EntityID
		LEFT JOIN [Procedure] cp ON c.ClaimID = cp.ClaimID
		LEFT JOIN Entity patientEntity ON c.entityID = patientEntity.EntityID				
		LEFT JOIN Patient p ON c.entityID = p.EntityID
		LEFT JOIN Interchange i ON c.InterchangeID = i.InterchangeID						
		WHERE c.ClientID = #trim(session.ClientID)# AND c.Active = 1 AND c.claimID = #trim(claimID)#
	</cfquery>
	
		
		
	<!-------------------------------------------------------------------------------------->
	<!--- Get the Claim MOA information.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cfquery name="getMOA" datasource="#trim(request.datasource)#">
		SELECT e.Code AS MOACode, e.Description AS MOADescription
		FROM claim_medicare_moa cmm INNER JOIN pa_master.eob_medicare_remittanceadviceremarkcode e ON cmm.MOACode = e.RecordID
		WHERE cmm.ClaimID = #trim(claimID)# AND cmm.MOACode IS NOT NULL
		ORDER BY cmm.DateCreated ASC
	</cfquery>
	
		
		
	<!-------------------------------------------------------------------------------------->
	<!--- Gather all the interest fees charged for this claim.                           --->
	<!-------------------------------------------------------------------------------------->																		
	<cfquery name="getClaimInterestAmount" datasource="#trim(request.datasource)#">
		SELECT s.ItemNameDisplay, c.* 
		FROM claim_medicare_supplemental_amount c INNER JOIN pa_master.standardlistitem s ON c.QualifierCode = s.StandardListItemID
		WHERE c.QualifierCode = 158 AND c.ClaimID = #trim(claimID)#
	</cfquery>
	
	<cfif getClaimInterestAmount.Recordcount GTE 1>
		<cfloop query="getClaimInterestAmount">
			<cfset interestAmount = interestAmount + getClaimInterestAmount.MonetaryAmount2>
		</cfloop>
	</cfif>	

		
		
	<!---------------------------------------------------------------------------------------->
	<!--- Get all the Procedures for this Claim and put them in the query to loop through. --->
	<!---------------------------------------------------------------------------------------->			
	<cfquery name="getProcedures" datasource="#trim(request.datasource)#">
		SELECT cp.ProcedureID, cp.ProcedureCode, cp.PriorProcedureCode, cp.ServiceDateFrom, cp.ServiceDateTo, cp.BilledQuantity, cp.BilledAmount, 
		cp.PaidQuantity, cp.PaidAmount, 
		pc.HCPC, pc.LongDescription, pc.ShortDescription,  
		IFNULL(n.noteID, 0) AS noteID							
		FROM [Procedure] cp
		LEFT JOIN pa_master.eob_medicare_procedurecode pc ON cp.ProcedureCode = pc.RecordID
		LEFT JOIN Note n ON cp.ProcedureID = n.instanceID AND n.objectID = 6
		WHERE cp.ClaimID = #trim(ClaimID)#		
	</cfquery>							
	
	<cfquery name="getClaimProceduresTotals" datasource="#trim(request.datasource)#">
		SELECT SUM(BilledAmount) AS ClaimTotalBilled, SUM(PaidAmount) AS ClaimTotalPaid					
		FROM [Procedure] 
		WHERE ClaimID = #trim(ClaimID)#		
	</cfquery>	
	
		
		
	<!--------------------------------------------------------------------------------------->
	<!--- when you have the procedures for this claim we need to valuelist them to check  --->
	<!--- against the eligibility to claose this cliam. This list will be sent to a       --->
	<!--- javascript function to check all procs have been closed to send to close.       --->
	<!--------------------------------------------------------------------------------------->	
	<cfset proceduresList = valueList(getProcedures.ProcedureID)>
		
		
	<!-------------------------------------------------------------------------------------->
	<!--- Create an Interchange Object.                                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cfset request.Interchange = CreateObject("component", "com.common.Interchange").init(getClaimDetails.InterchangeID)>	
		
		
		
	<!-------------------------------------------------------------------------------------->
	<!--- Start the display of this page.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cfsavecontent variable="ClaimPrintVariable">	
	
		<cfoutput>
		
			<style>	
			
				table.EOBList {
					border-collapse: collapse;
					font: x-small verdana, helvetica, sans-serif;
					margin: 10px;
				}
				table.EOBList caption {
					background-color: ##DCE3EB;
					color: ##003399;
					font-weight: bold;
					padding: 3px 10px 3px 10px;				
				}
				table.EOBList td {
					border: 0px solid ##DCE3EB;
					font-size: 90%;
					padding: 2px 10px 1px 5px;				
					/*vertical-align: top;	*/			
				}
				table.EOBList th {
					border: 0px solid ##DCE3EB;
					color: ##606060;
					font-weight: normal;
					padding: 2px 10px 1px 5px;				
				}
				
				.EOBclaimTableBody TABLE{
				    font-size: 1em; 
				}
				.EOBclaimTableBody A:link, .EOBclaimTableBody A:visited{
				    color:##003399;
				    text-decoration:underline; 
				}
				.EOBclaimTableBody A:hover{
				    color:red;
				    text-decoration:none; 
				}
				.EOBclaimTableBody th{
				    font-weight:bold; 
				}
				.EOBclaimTableBody td {
				    font-size: 8pt; 
				    font-family: verdana, arial, helvetica, sans-serif; 
				}
				
			</style>
					
						
			<table width="800" border="0">
				
				
				<tr>
					<td align="left">		
						<span width="100%" class="EOBclaimTableBody">	
							<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td align="center">	
										
										<table class="EOBList" border="0" cellpadding="0" cellspacing="0">					
											<tr>
												<td><span class="sitelabel">Palmetto&nbsp;Government&nbsp;Benefits&nbsp;Administrators</span></td>							
											</tr>	
											<tr>
												<td><span class="sitelabel">Durable&nbsp;Medical&nbsp;Equipment&nbsp;Regional&nbsp;Carrier</span></td>							
											</tr>												
											<tr>
												<td><span class="sitelabel">P.O&nbsp;Box&nbsp;100107</span></td>							
											</tr>																					
											<tr>												
												<td><span class="sitelabel">Columbia,&nbsp;South&nbsp;Carolina&nbsp;29202-3147</span></td>							
											</tr>												
											<tr>												
												<td valign="top"><span class="sitelabel">1-866-270-4900</span></td>							
											</tr>
											<tr>												
												<td><span class="sitelabel">&nbsp;</span></td>							
											</tr>												
										</table>
																							
									</td>
								</tr>					
							</table>				
						</span>
					</td>				
					<td valign="top">		
						<span width="100%" class="EOBclaimTableBody">	
							<table cellpadding="0" cellspacing="0" border="0" align="right">
								<tr>
									<td align="center">	
										
										<table class="EOBList" border="0" cellpadding="0" cellspacing="0">					
											<tr>
												<td><span class="sitelabel">MEDICARE</span></td>							
											</tr>	
											<tr>
												<td><span class="sitelabel">REMITTANCE</span></td>							
											</tr>		
											<tr>
												<td><span class="sitelabel">NOTICE</span></td>							
											</tr>											
										</table>
																							
									</td>
								</tr>					
							</table>				
						</span>
					</td>
				</tr>
								
				<tr>
					<td align="left">		
						<span width="100%" class="EOBclaimTableBody">	
							<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td align="center">	
										
										<table class="EOBList" border="0" cellpadding="0" cellspacing="0">					
											<tr>
												<td><span class="sitelabel">#request.Interchange.getInterchangeClientName()#</span></td>							
											</tr>	
											<tr>
												<td><span class="sitelabel">#request.Interchange.getInterchangeClientAddressLine1()#</span></td>							
											</tr>	
											<cfif request.Interchange.getInterchangeClientAddressLine2() GT "">
											<tr>
												<td><span class="sitelabel">#request.Interchange.getInterchangeClientAddressLine2()#</span></td>							
											</tr>	
											</cfif>											
											<tr>
												<cfset InterchangeClientZipCode = request.Interchange.getInterchangeClientZipCode()>
												<cfif len(trim(InterchangeClientZipCode)) GTE 6 AND NOT FindNoCase("-", InterchangeClientZipCode)>
													<cfset InterchangeClientZipCode = REQUEST.InsertAt(InterchangeClientZipCode, "-", 6)>												
												</cfif>
												<td><span class="sitelabel">#request.Interchange.getInterchangeClientCity()#<cfif request.Interchange.getInterchangeClientCity() GT "">,&nbsp;</cfif>#request.Interchange.getInterchangeClientState()#&nbsp;#trim(InterchangeClientZipCode)#</span></td>							
											</tr>											
										</table>
																							
									</td>
								</tr>					
							</table>				
						</span>
					</td>				
					<td>		
						<span width="100%" class="EOBclaimTableBody">	
							<table cellpadding="0" cellspacing="0" border="0" align="right">
								<tr>
									<td align="center">	
										
										<table class="EOBList" border="0" cellpadding="0" cellspacing="0">					
											<tr>
												<td><span class="sitelabel">Provider&nbsp;##:</span></td>	
												<td><span class="sitelabel">#trim(request.thisClaim.GetProviderID())#</span></td>							
											</tr>	
											<tr>
												<td><span class="sitelabel">Date:</span></td>	
												<td><span class="sitelabel">#DateFormat(trim(request.Interchange.getInterchangeDate()), 'mm/dd/yy')#</span></td>							
											</tr>		
											<tr>
												<td><span class="sitelabel">Check/EFT&nbsp;##:</span></td>	
												<td><span class="sitelabel">#trim(request.Interchange.getReassociationTraceNumber())#</span></td>							
											</tr>											
										</table>
																							
									</td>
								</tr>					
							</table>				
						</span>
					</td>
				</tr>
						
				
				<tr>
					<td colspan="2">
					
						<span width="100%" class="EOBclaimTableBody">
																
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
									<tr>
										<td align="center">							
											<!------>
											<table class="EOBList" border="0" align="center" cellpadding="0" cellspacing="0" width="100%">					
												<tr>
													<td colspan="13">
														<span width="100%" class="EOBclaimTableBody">
															<hr color="c0c0c0" style="margin:0px;padding:0px;border-bottom:1px solid 777;border-top:0px;border-left:0px;border-right:0px;line-height:0px;height:1px;display:block;">
														</span>
													</td>
												</tr>
																								
												<tr>
													<td><span class="xsm"><u>PERF&nbsp;PROV</u></span></td>
													<td><span class="xsm"><u>SERV&nbsp;DATE</u></span></td>
													<td><span class="xsm"><u>POS</u></span></td>
													<td><span class="xsm"><u>NOS</u></span></td>
													<td align="center"><span class="xsm"><u>PROC</u></span></td>
													<td><span class="xsm"><u>MODS</u></span></td>
													<td><span class="xsm"><u>BILLED</u></span></td>
													<td><span class="xsm"><u>ALLOWED</u></span></td>
													<td><span class="xsm"><u>DEDUCT</u></span></td>
													<td><span class="xsm"><u>COINS</u></span></td>
													<td><span class="xsm"><u>GRP/RC&middot;AMT</u></span></td>
													<td><span class="xsm">&nbsp;</span></td>
													<td><span class="xsm"><u>PROV&nbsp;PD</u></span></td>												
												</tr>	
													
												<tr><td colspan="13" valign="bottom"><hr color="000000" style="margin:0px;padding:0px;border-bottom:1px ;border-top:0px;border-left:0px;border-right:0px;line-height:0px;height:1px;display:block;"></td></tr>											
																																	
												<tr>													
													<td colspan="6" class="SiteLabel" nowrap>
														NAME&nbsp;&nbsp;#UCASE(trim(getClaimDetails.patientLname))#,&nbsp;#UCASE(trim(getClaimDetails.patientFname))#&nbsp;HIC #trim(getClaimDetails.HICNumber)#&nbsp;ACNT #trim(getClaimDetails.clientAssignedClaimID)#
													</td>
												    <td colspan="7" class="SiteLabel" align="right" nowrap>
														ICN&nbsp;#trim(getClaimDetails.InterchangeClaimID)#																											
														&nbsp;
														ASG <cfif getClaimDetails.LXAssignedNumber EQ 1>Y<cfelseif getClaimDetails.LXAssignedNumber EQ 0>N<cfelse> - </cfif>
														&nbsp;
														MOA 	
														<cfloop query="getMOA">															
															&nbsp;#trim(MOACode)#
														</cfloop>		
													</td>														
												</tr>								
																							
												<cfloop query="getProcedures">											
																						
													<!-------------------------------------------------------------------------------------->
													<!--- Gather all the late filing fees charged for this claim.                        --->
													<!-------------------------------------------------------------------------------------->																		
													<cfquery name="getProcedureDeductLateFee" datasource="#trim(request.datasource)#">
														SELECT s.ItemNameDisplay, p.* 
														FROM procedure_medicare_supplemental_amount p INNER JOIN pa_master.standardlistitem s ON p.QualifierCode = s.StandardListItemID
														WHERE p.QualifierCode = 144 AND p.ProcedureID = #trim(ProcedureID)# 
													</cfquery>
													
													<cfif getProcedureDeductLateFee.Recordcount GTE 1>
														<cfloop query="getProcedureDeductLateFee">
															<cfset lateFilingFee = lateFilingFee + getProcedureDeductLateFee.MonetaryAmount2>
														</cfloop>
													</cfif>
																																		
													<!-------------------------------------------------------------------------------------->
													<!--- Get all the ContractualObligations (CO) for this procedure that will be broken --->
													<!--- up into multiple lines.                                                        --->
													<!-------------------------------------------------------------------------------------->
													<cfset arrayProcedureRows = ArrayNew(1)>
																														
													<cfquery name="getProcedureCOs" datasource="#trim(request.datasource)#">
														SELECT s.ItemNameDisplay, p.* 
														FROM procedure_medicare_claimadjustment p INNER JOIN pa_master.standardlistitem s ON p.ClaimAdjustmentGroupCode1 = s.StandardListItemID
														WHERE p.ClaimAdjustmentGroupCode1 = 103 AND p.ProcedureID = #trim(ProcedureID)# 
													</cfquery>
																																							
													<cfif getProcedureCOs.RecordCount EQ 1>
														
														<cfset addGlossCode = "yes">
														
														<cfloop list="#getProcedureCOs.ColumnList#" index="i_col">
															<cfif FindNoCase("ClaimAdjustmentReasonCode", i_col)>																									
																<cfset column = "getProcedureCOs.#i_col#">																										
																<cfif evaluate(column) NEQ "">														
																	<cfset numCol = "getProcedureCOs.MonetaryAmount" & evaluate(RIGHT(i_col, 1) + 1)>																								 	
																	<cfinvoke component="com.common.db.EOB_MEDICARE_CLAIMADJUSTMENTCodeIO" method="getEOB_MEDICARE_CLAIMADJUSTMENTCodeQuery" fields="Code,Description" RecordID="#evaluate(column)#" active="1" returnvariable="getAdjustmentCode">
																	<cfset currentArrayLen = Arraylen(arrayProcedureRows) + 1>													
																	<cfset arrayProcedureRows[currentArrayLen] = StructNew()>
																	<cfset arrayProcedureRows[currentArrayLen].Remarks = "">
																	<cfset arrayProcedureRows[currentArrayLen].PriorProcedureCode = "">
																	<cfset arrayProcedureRows[currentArrayLen].AdjustmentGroupCode = "#trim(getProcedureCOs.ItemNameDisplay)#">			
																	<cfset arrayProcedureRows[currentArrayLen].AdjustmentCode = "#trim(getAdjustmentCode.Code)#">													
																	<cfset arrayProcedureRows[currentArrayLen].AdjustmentDescription = "#trim(getAdjustmentCode.Description)#">
																	
																	<cfif ListFindNoCase(monetaryColumns, ListLast(numCol, "."))> 
																		<cfset arrayProcedureRows[currentArrayLen].AdjustmentMonetaryAmount = evaluate(numCol)>		
																	<cfelse>
																		<cfset arrayProcedureRows[currentArrayLen].AdjustmentMonetaryAmount = "">		
																	</cfif>																	
																																	
																	<cfloop from="1" to="#Arraylen(arrayGlossary)#" index="glossCheck">
																		<cfif arrayGlossary[glossCheck].Code EQ trim(getProcedureCOs.ItemNameDisplay)>
																			<cfset addGlossCode = "no">
																			<cfbreak>
																		</cfif>
																	</cfloop>
													
																	<cfif addGlossCode>																	
																		<cfset currentGlossaryArrayLen = Arraylen(arrayGlossary) + 1>													
																		<cfset arrayGlossary[currentGlossaryArrayLen] = StructNew()>
																		<cfset arrayGlossary[currentGlossaryArrayLen].Code = "#trim(getProcedureCOs.ItemNameDisplay)#">
																		<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="13" itemnamedisplay="#trim(getProcedureCOs.ItemNameDisplay)#" active="1" fields="ItemDescription" returnvariable="getCodeDescription">
																		<cfset arrayGlossary[currentGlossaryArrayLen].Description = "#trim(getCodeDescription.ItemDescription)#">
																	</cfif>
																	
																	<cfset currentGlossaryArrayLen = Arraylen(arrayGlossary) + 1>													
																	<cfset arrayGlossary[currentGlossaryArrayLen] = StructNew()>
																	<cfset arrayGlossary[currentGlossaryArrayLen].Code = "#trim(getAdjustmentCode.Code)#">
																	<cfset arrayGlossary[currentGlossaryArrayLen].Description = "#trim(getAdjustmentCode.Description)#">
																																																																																																							
																</cfif>													
															</cfif>												
														</cfloop>
																						
													</cfif>		
																									
													<cfquery name="getProcedurePRs" datasource="#trim(request.datasource)#">
														SELECT s.ItemNameDisplay, p.* 
														FROM procedure_medicare_claimadjustment p INNER JOIN pa_master.standardlistitem s ON p.ClaimAdjustmentGroupCode1 = s.StandardListItemID
														WHERE p.ClaimAdjustmentGroupCode1 = 107 AND p.ProcedureID = #trim(ProcedureID)# 
													</cfquery>
													
													<cfif getProcedurePRs.RecordCount EQ 1>
														
														<cfloop list="#getProcedurePRs.ColumnList#" index="i_col">
															<cfif FindNoCase("ClaimAdjustmentReasonCode", i_col)>																									
																<cfset column = "getProcedurePRs.#i_col#">																										
																<cfif evaluate(column) NEQ "" AND evaluate(column) NEQ 1 AND evaluate(column) NEQ 2><!---Do not show the reason code 2 because it is being shown in the COINS Column already.--->														
																	<cfset numCol = "getProcedurePRs.MonetaryAmount" & evaluate(RIGHT(i_col, 1) + 1)>																								 	
																	<cfinvoke component="com.common.db.EOB_MEDICARE_CLAIMADJUSTMENTCodeIO" method="getEOB_MEDICARE_CLAIMADJUSTMENTCodeQuery" fields="Code" RecordID="#evaluate(column)#" active="1" returnvariable="getAdjustmentCode">
																	<cfset currentArrayLen = Arraylen(arrayProcedureRows) + 1>													
																	<cfset arrayProcedureRows[currentArrayLen] = StructNew()>
																	<cfset arrayProcedureRows[currentArrayLen].Remarks = "">
																	<cfset arrayProcedureRows[currentArrayLen].PriorProcedureCode = "">
																	<cfset arrayProcedureRows[currentArrayLen].AdjustmentGroupCode = "#trim(getProcedurePRs.ItemNameDisplay)#">			
																	<cfset arrayProcedureRows[currentArrayLen].AdjustmentCode = "#trim(getAdjustmentCode.Code)#">
																	<cfset arrayProcedureRows[currentArrayLen].AdjustmentDescription = "">
																	
																	<cfif ListFindNoCase(monetaryColumns, ListLast(numCol, "."))> 
																		<cfset arrayProcedureRows[currentArrayLen].AdjustmentMonetaryAmount = evaluate(numCol)>
																	<cfelse>
																		<cfset arrayProcedureRows[currentArrayLen].AdjustmentMonetaryAmount = "">
																	</cfif>			
																																																																																														
																</cfif>													
															</cfif>												
														</cfloop>
														
													</cfif>
													
													
													
													<!-------------------------------------------------------------------------------------->
													<!--- if the array created has no records then we add the default one in.            --->
													<!-------------------------------------------------------------------------------------->									
													<cfif ArrayLen(arrayProcedureRows) LTE 0>										
														<cfset currentArrayLen = Arraylen(arrayProcedureRows) + 1>													
														<cfset arrayProcedureRows[currentArrayLen] = StructNew()>
														<cfset arrayProcedureRows[currentArrayLen].Remarks = "">
														<cfset arrayProcedureRows[currentArrayLen].PriorProcedureCode = "">
														<cfset arrayProcedureRows[currentArrayLen].AdjustmentCode = "">
														<cfset arrayProcedureRows[currentArrayLen].AdjustmentDescription = "">													
														<cfset arrayProcedureRows[currentArrayLen].AdjustmentMonetaryAmount = "">
													</cfif>
																									
													<tr>  
														<td><span class="SiteLabel">#trim(request.thisClaim.GetProviderID())#</span></td>
														<td>
															<span class="SiteLabel">												
																#DateFormat(ServiceDateFrom, "mm")##DateFormat(ServiceDateFrom, "dd")#&nbsp;#DateFormat(ServiceDateTo, "mm")##DateFormat(ServiceDateTo, "dd")##DateFormat(ServiceDateTo, "yy")#																		
															</span>
														</td>									
														<td>
															<span class="SiteLabel">
																#trim(getClaimDetails.FacilityCode)#
															</span>
														</td>
														<td align="center">
															<span class="SiteLabel">
																#trim(BilledQuantity)#
															</span>
														</td>
														
														<td>
															<span class="SiteLabel">															
																#trim(HCPC)#
															</span>
														</td>
														
														<!-------------------------------------------------------------------------------------->
														<!--- Query to get all the modifiers for this procedure.                             --->
														<!-------------------------------------------------------------------------------------->										
														<cfquery name="getModifiers" datasource="#trim(request.datasource)#">
															SELECT e.Modifier
															FROM procedure_medicare_modifier p LEFT JOIN pa_master.eob_medicare_claimmodifiercode e ON p.ModifierCode = e.RecordID 
															WHERE p.ProcedureID = #trim(ProcedureID)#
														</cfquery>
														
														<td><span class="SiteLabel"><cfloop query="getModifiers">#trim(Modifier)#</cfloop></span></td>								
														<td align="right"><span class="SiteLabel" style="white-space: nowrap;">#NumberFormat(trim(BilledAmount), "___.__")#</span></td>
																												
														<!-------------------------------------------------------------------------------------->
														<!--- Query to get all the supplemental amounts for this procedure.                  --->
														<!-------------------------------------------------------------------------------------->										
														<cfquery name="getProcedureAmounts" datasource="#trim(request.datasource)#">
															SELECT SUM(p.MonetaryAmount2) AS ProcedureAmounts 
															FROM procedure_medicare_supplemental_amount p LEFT JOIN pa_master.standardlistitem s ON p.QualifierCode = s.StandardListItemID 
															WHERE p.ProcedureID = #trim(ProcedureID)# AND p.QualifierCode = 142 <!---142 is the  list id for allowed-actual--->
														</cfquery>
														
														<cfif getProcedureAmounts.Recordcount GT 0 AND IsNumeric(getProcedureAmounts.ProcedureAmounts)>
															<cfset allowedTotal = allowedTotal + getProcedureAmounts.ProcedureAmounts>
														</cfif>
														
														<td align="right"><span class="SiteLabel" style="white-space: nowrap;">#NumberFormat(trim(getProcedureAmounts.ProcedureAmounts), "___.__")#</span></td>
							
														<cfset patientResponsibilityDeductible = "0.00">
														<cfset patientResponsibilityCoInsurance = "0.00">
														<!-------------------------------------------------------------------------------------->
														<!--- Get all the PatientResponsibilities (PR) adjustments for this procedure.       --->
														<!-------------------------------------------------------------------------------------->										
														<cfquery name="getProcedurePRs" datasource="#trim(request.datasource)#">
															SELECT s.ItemNameDisplay, p.* 
															FROM procedure_medicare_claimadjustment p INNER JOIN pa_master.standardlistitem s ON p.ClaimAdjustmentGroupCode1 = s.StandardListItemID
															WHERE p.ClaimAdjustmentGroupCode1 = 107 AND p.ProcedureID = #trim(ProcedureID)# 
														</cfquery>
														
														<cfif getProcedurePRs.RecordCount EQ 1>
															<cfloop list="#getProcedurePRs.ColumnList#" index="i_col">
																<cfif FindNoCase("ClaimAdjustmentReasonCode", i_col)>																									
																	<cfset column = "getProcedurePRs.#i_col#">	
																	<cfset numCol = "getProcedurePRs.MonetaryAmount" & evaluate(RIGHT(i_col, 1) + 1)>																	
																	<cfif ListFindNoCase(monetaryColumns, ListLast(numCol, "."))>
																		<cfif evaluate(column) EQ 1>																				
																			<cfset patientResponsibilityDeductible = patientResponsibilityDeductible + evaluate(numCol)> 	
																			<cfset deductTotal = deductTotal + evaluate(numCol)>
																		<cfelseif evaluate(column) EQ 2>																					
																			<cfset patientResponsibilityCoInsurance = patientResponsibilityCoInsurance + evaluate(numCol)>
																			<cfset coinsTotal = coinsTotal + evaluate(numCol)> 															
																		</cfif>	
																	</cfif>														
																</cfif>
																
															</cfloop>	
														</cfif>
														
														<td class="SiteLabel" align="right"><span style="white-space: nowrap;">#trim(NumberFormat(trim(patientResponsibilityDeductible), "___.__"))#</span></td>
														<td class="SiteLabel" align="right"><span style="white-space: nowrap;">#trim(NumberFormat(trim(patientResponsibilityCoInsurance), "___.__"))#</span></td>
														
														
														<!---COs--->
														<td align="center">
															<span class="SiteLabel">
																<cfif Arraylen(arrayProcedureRows) GTE 1 AND arrayProcedureRows[1].AdjustmentCode NEQ "">																		
																	#arrayProcedureRows[1].AdjustmentGroupCode#&middot;#arrayProcedureRows[1].AdjustmentCode#															
																<cfelse>											
																	&nbsp;
																</cfif>
															</span>
														</td>
														
														<td align="right"><span class="SiteLabel" style="white-space: nowrap;"><cfif Arraylen(arrayProcedureRows) GTE 1>#trim(NumberFormat(arrayProcedureRows[1].AdjustmentMonetaryAmount, "___.__"))#<cfelse>#trim(NumberFormat(0.00, "___.__"))#</cfif></span></td>																	
														<td align="right"><span class="SiteLabel" style="white-space: nowrap;">#trim(NumberFormat(trim(PaidAmount), "___.__"))#</span></td>
													</tr>
															
													<!-------------------------------------------------------------------------------------->
													<!--- If the procedure has any remarks go ahead and put them in the array.           --->
													<!-------------------------------------------------------------------------------------->									
													<cfset remarkIndustryCodes = "">
													<cfquery name="getRemarks" datasource="#trim(request.datasource)#">
														SELECT e.Code AS IndustryCode, e.Description AS IndustryCodeDescription
														FROM procedure_medicare_remark_code pmrc INNER JOIN pa_master.eob_medicare_remittanceadviceremarkcode e ON pmrc.IndustryCode = e.RecordID
														WHERE pmrc.ProcedureID = #trim(ProcedureID)# 								
													</cfquery>
													
													<cfif getRemarks.RecordCount GTE 1>
														<cfloop query="getRemarks">
															<cfset thisDescription = Replace(IndustryCodeDescription, "'", "\'", "ALL")>
															<cfset remarkIndustryCodes =  remarkIndustryCodes & "#trim(IndustryCode)#">
																													
															<cfset addGlossCode = "yes">													
																										
															<cfloop from="1" to="#Arraylen(arrayRemarkGlossary)#" index="glossRemarkCheck">
																<cfif arrayRemarkGlossary[glossRemarkCheck].Code EQ trim(IndustryCode)>
																	<cfset addGlossCode = "no">
																	<cfbreak>
																</cfif>
															</cfloop>
											
															<cfif addGlossCode>																	
																<cfset currentRemarkGlossaryArrayLen = Arraylen(arrayRemarkGlossary) + 1>													
																<cfset arrayRemarkGlossary[currentRemarkGlossaryArrayLen] = StructNew()>
																<cfset arrayRemarkGlossary[currentRemarkGlossaryArrayLen].Code = "#trim(IndustryCode)#">
																<cfset arrayRemarkGlossary[currentRemarkGlossaryArrayLen].Description = "#trim(IndustryCodeDescription)#">
															</cfif>														
															
														</cfloop>
													</cfif>
													
													<cfif remarkIndustryCodes NEQ "">
														<cfif Arraylen(arrayProcedureRows) LTE 1>																							
															<cfset arrayProcedureRows[2] = StructNew()>
															<cfset arrayProcedureRows[2].PriorProcedureCode = "">
															<cfset arrayProcedureRows[2].AdjustmentCode = "">		
															<cfset arrayProcedureRows[2].AdjustmentDescription = "">											
															<cfset arrayProcedureRows[2].AdjustmentMonetaryAmount = "">	
														</cfif>
														<cfset arrayProcedureRows[2].Remarks = "REM: #trim(remarkIndustryCodes)#">											
													</cfif>
													
													
													<cfif PriorProcedureCode NEQ "">
														
														<cfif Arraylen(arrayProcedureRows) LTE 1>																							
															<cfset arrayProcedureRows[2] = StructNew()>
															<cfset arrayProcedureRows[2].Remarks = "">	
															<cfset arrayProcedureRows[2].AdjustmentCode = "">	
															<cfset arrayProcedureRows[2].AdjustmentDescription = "">												
															<cfset arrayProcedureRows[2].AdjustmentMonetaryAmount = "">	
														</cfif>										
														
														<cfset arrayProcedureRows[2].PriorProcedureCode = "#PriorProcedureCode#">	
																							
													</cfif>
													
													<!-------------------------------------------------------------------------------------->
													<!--- Output the next rows.                                                          --->
													<!-------------------------------------------------------------------------------------->
													<cfloop from="2" to="#Arraylen(arrayProcedureRows)#" index="groupi">
														<tr>
															<td colspan="3"><span class="SiteLabel"><cfif groupi EQ 2>#arrayProcedureRows[2].Remarks#<cfelse>&nbsp;</cfif></span></td>											
															<td align="right"><span class="SiteLabel"><cfif arrayProcedureRows[groupi].PriorProcedureCode NEQ "">[<cfelse>&nbsp;</cfif></span></td>											
															<td colspan="1"><span class="SiteLabel"><cfif groupi EQ 2 AND arrayProcedureRows[2].PriorProcedureCode NEQ "">#ListGetAt(arrayProcedureRows[2].PriorProcedureCode, 2, ">")#<cfelse>&nbsp;</cfif></span></td>
															<td><span class="SiteLabel"><cfif arrayProcedureRows[groupi].PriorProcedureCode NEQ "">]<cfelse>&nbsp;</cfif></span></td>
															<td align="right"><span class="SiteLabel">&nbsp;</span></td>
															<td align="right"><span class="SiteLabel">&nbsp;</span></td>
															<td align="right"><span class="SiteLabel">&nbsp;</span></td>
															<td align="right"><span class="SiteLabel">&nbsp;</span></td>
															<td align="center">
																<span class="SiteLabel">
																	<cfif arrayProcedureRows[groupi].AdjustmentCode NEQ "">#arrayProcedureRows[groupi].AdjustmentGroupCode#&middot;#arrayProcedureRows[groupi].AdjustmentCode#<cfelse>&nbsp;</cfif>											
																</span>
															</td>
															<td align="right">
																<span class="SiteLabel" style="white-space: nowrap;">
																	<cfif IsNumeric(arrayProcedureRows[groupi].AdjustmentMonetaryAmount)>#NumberFormat(arrayProcedureRows[groupi].AdjustmentMonetaryAmount, "___.__")#<cfelse>&nbsp;</cfif>													
																</span>
															</td>																									
														</tr>
													</cfloop>
													
													
													<!---total all the procedures adjusments.--->
													<cfloop from="1" to="#Arraylen(arrayProcedureRows)#" index="provi">
														<cfif IsNumeric(arrayProcedureRows[provi].AdjustmentMonetaryAmount)>
															<cfset grprcTotal = grprcTotal + arrayProcedureRows[provi].AdjustmentMonetaryAmount>
														</cfif>
													</cfloop>
													
																								
												</cfloop>
												
												
												<!-------------------------------------------------------------------------------------->
												<!--- Start the claim totals                                                         --->
												<!-------------------------------------------------------------------------------------->																
												<tr>
													<td><span class="SiteLabel">PT&nbsp;RESP:</span></td>
													<td><span class="SiteLabel" style="white-space: nowrap;">#NumberFormat(getClaimDetails.PatientResponsibilityAmount, "___.__")#</span></td>
													<td><span class="SiteLabel">&nbsp;</span></td>
													<td><span class="SiteLabel">&nbsp;</span></td>
													<td colspan="2"><span class="SiteLabel">CLAIM&nbsp;TOTALS</span></td>
													<td align="right"><span class="SiteLabel" style="white-space: nowrap;">#NumberFormat(trim(getClaimProceduresTotals.ClaimTotalBilled), "___.__")#</span></td>
													<td align="right"><span class="SiteLabel" style="white-space: nowrap;">#NumberFormat(allowedTotal, "___.__")#</span></td>
													<td align="right"><span class="SiteLabel" style="white-space: nowrap;">#NumberFormat(deductTotal, "___.__")#</span></td>
													<td align="right"><span class="SiteLabel" style="white-space: nowrap;">#NumberFormat(coinsTotal, "___.__")#</span></td>
													<td><span class="SiteLabel">&nbsp;</span></td>
													<td align="right"><span class="SiteLabel" style="white-space: nowrap;">#NumberFormat(grprcTotal, "___.__")#</span></td>
													<td align="right"><span class="SiteLabel" style="white-space: nowrap;">#NumberFormat(getClaimProceduresTotals.ClaimTotalPaid, "___.__")#</span></td>
												</tr>
												
												<cfset netAmount = trim(getClaimProceduresTotals.ClaimTotalPaid) - ABS(trim(getClaimDetails.claimpreviousPaidAmount))>
												
												<cfset netAmount = netAmount + interestAmount>
												
												<tr>
													<td colspan="13">
				
														<table cellspacing="0" cellpadding="0" width="100%" border="0">
															<tr style="border: 0px solid FF0000; padding: 0px 0px 0px 0px;">
															    <td style="border: 0px solid FF0000; padding: 0px 0px 0px 0px;">
																	<span class="SiteLabel" style="white-space: nowrap;">
																		ADJ&nbsp;TO&nbsp;TOTALS:&nbsp;PREV&nbsp;PD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#NumberFormat(ABS(getClaimDetails.claimpreviousPaidAmount), "___.__")#	
																	</span>
																</td>
																<td style="border: 0px solid FF0000; padding: 0px 0px 0px 0px;">
																	<span class="SiteLabel" style="white-space: nowrap;">
																		INTEREST&nbsp;&nbsp;#NumberFormat(interestAmount, "___.__")#	
																	</span>	
																</td>
																<td style="border: 0px solid FF0000; padding: 0px 0px 0px 0px;">
																	<span class="SiteLabel" style="white-space: nowrap;">
																		LATE&nbsp;FILING&nbsp;CHARGE&nbsp;&nbsp;#NumberFormat(lateFilingFee, "___.__")#
																	</span>	
																</td>
															    <td align="right" style="border: 0px solid FF0000; padding: 0px 0px 0px 0px;">
																	<span class="SiteLabel" style="white-space: nowrap;">
																		NET&nbsp;&nbsp;#NumberFormat(netAmount, "___.__")#&nbsp;		
																	</span>	
																</td>												
															</tr>
														</table>
				
													</td>
													
												</tr>
												
												<!-------------------------------------------------------------------------------------->
												<!--- Show the croossover name if defined.                                           --->
												<!-------------------------------------------------------------------------------------->								
												<cfif getClaimDetails.CrossoverNameLastorOrganizationName3 NEQ "">
												<tr>
													<td colspan="13">
														<span class="SiteLabel" style="white-space: nowrap;">
															CLAIM&nbsp;INFORMATION&nbsp;FORWARDED&nbsp;TO:&nbsp;&nbsp;&nbsp;#trim(getClaimDetails.CrossoverNameLastorOrganizationName3)#
														</span>
													</td>												
												</tr>
												</cfif>										
												
												<tr>
													<td colspan="13">
														<span width="100%" class="EOBclaimTableBody">
															<hr color="c0c0c0" style="margin:0px;padding:0px;border-bottom:1px solid 777;border-top:0px;border-left:0px;border-right:0px;line-height:0px;height:1px;display:block;">
														</span>
													</td>
												</tr>	
																																				
												
												<cfloop query="getMOA">	
														
													<cfset addGlossCode = "yes">													
																										
													<cfloop from="1" to="#Arraylen(arrayGlossary)#" index="glossCheck">
														<cfif arrayGlossary[glossCheck].Code EQ trim(MOACode)>
															<cfset addGlossCode = "no">
															<cfbreak>
														</cfif>
													</cfloop>
									
													<cfif addGlossCode>																	
														<cfset currentGlossaryArrayLen = Arraylen(arrayGlossary) + 1>													
														<cfset arrayGlossary[currentGlossaryArrayLen] = StructNew()>
														<cfset arrayGlossary[currentGlossaryArrayLen].Code = "#trim(MOACode)#">
														<cfset arrayGlossary[currentGlossaryArrayLen].Description = "#trim(MOADescription)#">
													</cfif>
																								
												</cfloop>												
												
												<tr>
													<td colspan="13">
														<table cellpadding="2" cellspacing="0" border="0">											
															
															<tr><td align="center" colspan="2">&nbsp;</td></tr>		
															<tr><td align="center" colspan="2">&nbsp;</td></tr>							
															<tr><td colspan="2" class="SiteLabel" nowrap>GLOSSARY: GROUP, REASON, MOA, REMARK, AND REASON CODES</td></tr>							
															<tr><td align="center" colspan="2">&nbsp;</td></tr>		
															
															<cfloop from="1" to="#Arraylen(arrayGlossary)#" index="gloss">
																<tr>
																	<td class="siteLabel" valign="top">#trim(arrayGlossary[gloss].Code)#</td>
																	<td class="siteLabel" valign="top">#trim(arrayGlossary[gloss].Description)#</td>
																</tr>														
															</cfloop>	
															
															<cfloop from="1" to="#Arraylen(arrayRemarkGlossary)#" index="gloss">
																<tr>
																	<td class="siteLabel" valign="top">#trim(arrayRemarkGlossary[gloss].Code)#</td>
																	<td class="siteLabel" valign="top">#trim(arrayRemarkGlossary[gloss].Description)#</td>
																</tr>														
															</cfloop>															
														</table>
													</td>	
												</tr>
															
											</table>			
																		
										</td>
									</tr>	
									
								</table>					
							
						</span>
			
					</td>
				</tr>
			</table>
			
		</cfoutput>
	
	</cfsavecontent>
	
	
		
	<!-------------------------------------------------------------------------------------->
	<!--- Create the claim print file PDF. Placing pagetype="A4" keeps everything on     --->
	<!--- the same page.                                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cfdocument marginbottom=".05" marginleft=".05" marginright=".05" margintop=".05" format="PDF" filename="#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\ClaimPrint_#session.Client.getClientID()#_#trim(fileDateTimeStamp)#_#trim(ClaimID)#.pdf" overwrite="yes">
		<cfoutput>				
			#ClaimPrintVariable#
		</cfoutput>
	</cfdocument>	
			
	<cfset listOfFiles = listAppend(listOfFiles,"#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\ClaimPrint_#session.Client.getClientID()#_#trim(fileDateTimeStamp)#_#trim(ClaimID)#.pdf")>
		
</cfif>



<!-------------------------------------------------------------------------------------->
<!--- If the user wants to print a redetermination form.                             --->
<!-------------------------------------------------------------------------------------->	
	<cfif IsDefined("form.redetermination")>
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Loop over all the fields in the form structure if the name of the formfield    --->
		<!--- contains "_CBox_" and is equal to one is gets changed to an "X"                --->
		<!-------------------------------------------------------------------------------------->	
		<cfif IsDefined("FORM.fieldnames")>

			<cfloop list="#trim(form.FieldNames)#" index="i">
		
				<cfif REQUEST.FindOccurrences(i,"_CBox_") GTE 1 AND IsNumeric(evaluate(i)) AND evaluate(i) EQ 1>
						
					<cfset "form.#trim(i)#" = "X">
					
				</cfif>
		
			</cfloop>
		
		</cfif>	
		
		
		<cf_gcCreatePopulatedRedeterminationRequestFormPDF
			filename="ClaimPrintRedterminationForm_#session.Client.getClientID()#_#trim(fileDateTimeStamp)#_#trim(ClaimID)#.pdf"
			savefilepath="#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#"
			errorMessageCode_CBox_MA130Yes="#trim(form.errorMessageCode_CBox_MA130Yes)#"
			errorMessageCode_CBox_MA130No="#trim(form.errorMessageCode_CBox_MA130No)#"
			date="#trim(form.date)#"
			from="#trim(form.from)#"
			patientName="#trim(form.patientName)#"
			HICN="#trim(form.HICN)#"
			nscSupplierNumber="#trim(form.nscSupplierNumber)#"
			contactPerson="#trim(form.contactPerson)#"
			telephoneNumber="#trim(form.telephoneNumber)#"
			reasonForRequest_CBox_ClaimDenied="#trim(form.reasonForRequest_CBox_ClaimDenied)#"
			reasonForRequest_CBox_ClaimPaymentReduced="#trim(form.reasonForRequest_CBox_ClaimPaymentReduced)#"
			reasonForRequest_CBox_ClaimCorrection="#trim(form.reasonForRequest_CBox_ClaimCorrection)#"
			reasonForRequest_CBox_ClaimReopened="#trim(form.reasonForRequest_CBox_ClaimReopened)#"
			ClaimNumber_TBox_Line1="#trim(form.ClaimNumber_TBox_Line1)#"
			ClaimDateOfService_TBox_Line1="#trim(form.ClaimDateOfService_TBox_Line1)#"
			ClaimHCPCS_TBox_Line1="#trim(form.ClaimHCPCS_TBox_Line1)#"
			ClaimRemittanceDate_TBox_Line1="#trim(form.ClaimRemittanceDate_TBox_Line1)#"
			ClaimNumber_TBox_Line2="#trim(form.ClaimNumber_TBox_Line2)#"
			ClaimDateOfService_TBox_Line2="#trim(form.ClaimDateOfService_TBox_Line2)#"
			ClaimHCPCS_TBox_Line2="#trim(form.ClaimHCPCS_TBox_Line2)#"
			ClaimRemittanceDate_TBox_Line2="#trim(form.ClaimRemittanceDate_TBox_Line2)#"
			ClaimNumber_TBox_Line3="#trim(form.ClaimNumber_TBox_Line3)#"
			ClaimDateOfService_TBox_Line3="#trim(form.ClaimDateOfService_TBox_Line3)#"
			ClaimHCPCS_TBox_Line3="#trim(form.ClaimHCPCS_TBox_Line3)#"
			ClaimRemittanceDate_TBox_Line3="#trim(form.ClaimRemittanceDate_TBox_Line3)#"
			ClaimNumber_TBox_Line4="#trim(form.ClaimNumber_TBox_Line4)#"
			ClaimDateOfService_TBox_Line4="#trim(form.ClaimDateOfService_TBox_Line4)#"
			ClaimHCPCS_TBox_Line4="#trim(form.ClaimHCPCS_TBox_Line4)#"
			ClaimRemittanceDate_TBox_Line4="#trim(form.ClaimRemittanceDate_TBox_Line4)#"
			Explanation_TBox_Line1="#trim(form.Explanation_TBox_Line1)#"
			Explanation_TBox_Line2="#trim(form.Explanation_TBox_Line2)#"
			Explanation_TBox_Line3="#trim(form.Explanation_TBox_Line3)#"
			Explanation_TBox_Line4="#trim(form.Explanation_TBox_Line4)#"
			Explanation_TBox_Line5="#trim(form.Explanation_TBox_Line5)#"			
			Attachment_CBox_ClaimCopy="#trim(form.Attachment_CBox_ClaimCopy)#"
			Attachment_CBox_RemittanceAdviceCopy="#trim(form.Attachment_CBox_RemittanceAdviceCopy)#"
			Attachment_CBox_CMN="#trim(form.Attachment_CBox_CMN)#"
			Attachment_CBox_Medical="#trim(form.Attachment_CBox_Medical)#"
			Attachment_CBox_PhysicianDocumentation="#trim(form.Attachment_CBox_PhysicianDocumentation)#"
			Attachment_CBox_CheckCopies="#trim(form.Attachment_CBox_CheckCopies)#"
			Attachment_CBox_OtherCarrier="#trim(form.Attachment_CBox_OtherCarrier)#"
			Attachment_CBox_Other="#trim(form.Attachment_CBox_Other)#"
			OtherExplanation_TBox="#trim(form.OtherExplanation_TBox)#">
			
		<cfset listOfFiles = listAppend(listOfFiles, "#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\ClaimPrintRedterminationForm_#session.Client.getClientID()#_#trim(fileDateTimeStamp)#_#trim(ClaimID)#.pdf")>
		
	</cfif>
	

	
<!-------------------------------------------------------------------------------------->
<!--- If the user wants to print a Hearing Request form.                             --->
<!-------------------------------------------------------------------------------------->	
	<cfif IsDefined("form.hearingRequest")>
		<cfset listOfFiles = listAppend(listOfFiles, "#trim(request.fmsPath)#\misc\HearingRequest.pdf")>
	</cfif>
	
		
	
<!-------------------------------------------------------------------------------------->
<!--- Create the actual pdf that will be printed.                                    --->
<!-------------------------------------------------------------------------------------->			
	<cfif ListLen(listOfFiles) GTE 1>
		
		<cfset finalFileName = "ClaimPrintFinal_#session.Client.getClientID()#_#trim(fileDateTimeStamp)#_#trim(ClaimID)#.pdf">
	
		<cf_gcConcatenatePDFs 
			listofPDFs="#trim(listOfFiles)#"
			finalOutPutFile="#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\#trim(finalFileName)#">
			
					
		<!-------------------------------------------------------------------------------------->
		<!--- Locate the user to where they will be able to print it.                        --->
		<!-------------------------------------------------------------------------------------->		
		<cfoutput>		
			<!---<script language="JavaScript">
				location = '#trim(request.tempDocsURL)#/#trim(finalFileName)#';							
			</script>--->			
			
			<script language="JavaScript">					
				reminder=window.open('#trim(request.tempDocsURL)#/#trim(session.Client.getClientID())#/#trim(finalFileName)#', 'reminder', 'top=0,left=0,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=#trim(session.screenWidth)#,height=#trim(session.screenHeight)#'); reminder.focus(0);
				setTimeout('self.close()',500); // close self after a seconds delay			
			</script>
			
		</cfoutput>	
			
	
	</cfif>
	
	





