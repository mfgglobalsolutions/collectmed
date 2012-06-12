<cfcomponent name="INTAKE_PatientIntakeFormIO">

	<cfset reset()>
	

	<cffunction name="reset" access="public" output="no">

		<cfscript>
			variables.instance.changedVariables = "";
			variables.instance.recordID = "NULL";
			variables.instance.hidden_UsersID = "";
			variables.instance.hidden_TimeStart = "";
			variables.instance.OPTION_1_CBox_Delivery = "";
			variables.instance.OPTION_1_CBox_Pickup = "";
			variables.instance.OPTION_1_CBox_Repair = "";
			variables.instance.OPTION_1_CBox_Switch = "";
			variables.instance.OPTION_1_CBox_Existing = "";
			variables.instance.OPTION_2_CBox_Facility = "";
			variables.instance.OPTION_2_CBox_Hospice = "";
			variables.instance.OPTION_2_CBox_Hospital = "";
			variables.instance.facilityTBox = "";
			variables.instance.hospiceTBox = "";
			variables.instance.OPTION_3_CBox_Medicare = "";
			variables.instance.OPTION_3_CBox_PrivateInsurance = "";
			variables.instance.OPTION_3_CBox_Medicaid = "";
			variables.instance.OPTION_3_CBox_PrivatePay = "";
			variables.instance.hospitalTBox = "";
			variables.instance.DischargeDateMM = "";
			variables.instance.DischargeDateDD = "";
			variables.instance.DischargeDateYY = "";
			variables.instance.typeOfPay_Radio = "";
			variables.instance.callerNameTBox = "";
			variables.instance.callerPhoneTBox = "";
			variables.instance.patientNameTBox = "";
			variables.instance.roomNumberTBox = "";
			variables.instance.bedNumberTBox = "";
			variables.instance.patientAddressTBox = "";
			variables.instance.patientCityTBox = "";
			variables.instance.patientStateTBox = "";
			variables.instance.patientZipTBox = "";
			variables.instance.patientPhoneTBox = "";
			variables.instance.patientDOBMM = "";
			variables.instance.patientDOBDD = "";
			variables.instance.patientDOBYY = "";
			variables.instance.patientSSNTBox = "";
			variables.instance.patientHeightFeet = "";
			variables.instance.patientHeightInches = "";
			variables.instance.patientWeightTBox = "";
			variables.instance.alternateContactNameTBox = "";
			variables.instance.alternateContactRelationshipTBox = "";
			variables.instance.alternateContactPhoneTBox = "";
			variables.instance.hcpcCode1TBox = "";
			variables.instance.hcpcQty1TBox = "";
			variables.instance.hcpcProduct1TBox = "";
			variables.instance.hcpcDX1TBox = "";
			variables.instance.hcpcDiagnosis1TBox = "";
			variables.instance.hcpcLengthOfNeedYear1TBox = "";
			variables.instance.hcpcLengthOfNeedMonth1TBox = "";
			variables.instance.hcpcCode2TBox = "";
			variables.instance.hcpcQty2TBox = "";
			variables.instance.hcpcProduct2TBox = "";
			variables.instance.hcpcDX2TBox = "";
			variables.instance.hcpcDiagnosis2TBox = "";
			variables.instance.hcpcLengthOfNeedYear2TBox = "";
			variables.instance.hcpcLengthOfNeedMonth2TBox = "";
			variables.instance.hcpcCode3TBox = "";
			variables.instance.hcpcQty3TBox = "";
			variables.instance.hcpcProduct3TBox = "";
			variables.instance.hcpcDX3TBox = "";
			variables.instance.hcpcDiagnosis3TBox = "";
			variables.instance.hcpcLengthOfNeedYear3TBox = "";
			variables.instance.hcpcLengthOfNeedMonth3TBox = "";
			variables.instance.hcpcCode4TBox = "";
			variables.instance.hcpcQty4TBox = "";
			variables.instance.hcpcProduct4TBox = "";
			variables.instance.hcpcDX4TBox = "";
			variables.instance.hcpcDiagnosis4TBox = "";
			variables.instance.hcpcLengthOfNeedYear4TBox = "";
			variables.instance.hcpcLengthOfNeedMonth4TBox = "";
			variables.instance.hcpcCode5TBox = "";
			variables.instance.hcpcQty5TBox = "";
			variables.instance.hcpcProduct5TBox = "";
			variables.instance.hcpcDX5TBox = "";
			variables.instance.hcpcDiagnosis5TBox = "";
			variables.instance.hcpcLengthOfNeedYear5TBox = "";
			variables.instance.hcpcLengthOfNeedMonth5TBox = "";
			variables.instance.hcpcCode6TBox = "";
			variables.instance.hcpcQty6TBox = "";
			variables.instance.hcpcProduct6TBox = "";
			variables.instance.hcpcDX6TBox = "";
			variables.instance.hcpcDiagnosis6TBox = "";
			variables.instance.hcpcLengthOfNeedYear6TBox = "";
			variables.instance.hcpcLengthOfNeedMonth6TBox = "";
			variables.instance.hcpcCode7TBox = "";
			variables.instance.hcpcQty7TBox = "";
			variables.instance.hcpcProduct7TBox = "";
			variables.instance.hcpcDX7TBox = "";
			variables.instance.hcpcDiagnosis7TBox = "";
			variables.instance.hcpcLengthOfNeedYear7TBox = "";
			variables.instance.hcpcLengthOfNeedMonth7TBox = "";
			variables.instance.hcpcCode8TBox = "";
			variables.instance.hcpcQty8TBox = "";
			variables.instance.hcpcProduct8TBox = "";
			variables.instance.hcpcDX8TBox = "";
			variables.instance.hcpcDiagnosis8TBox = "";
			variables.instance.hcpcLengthOfNeedYear8TBox = "";
			variables.instance.hcpcLengthOfNeedMonth8TBox = "";
			variables.instance.hcpcCode9TBox = "";
			variables.instance.hcpcQty9TBox = "";
			variables.instance.hcpcProduct9TBox = "";
			variables.instance.hcpcDX9TBox = "";
			variables.instance.hcpcDiagnosis9TBox = "";
			variables.instance.hcpcLengthOfNeedYear9TBox = "";
			variables.instance.hcpcLengthOfNeedMonth9TBox = "";
			variables.instance.hcpcCode10TBox = "";
			variables.instance.hcpcQty10TBox = "";
			variables.instance.hcpcProduct10TBox = "";
			variables.instance.hcpcDX10TBox = "";
			variables.instance.hcpcDiagnosis10TBox = "";
			variables.instance.hcpcLengthOfNeedYear10TBox = "";
			variables.instance.hcpcLengthOfNeedMonth10TBox = "";
			variables.instance.primaryInsuranceNameTBox = "";
			variables.instance.secondaryInsuranceNameTBox = "";
			variables.instance.primaryPolicyNumberTBox = "";
			variables.instance.secondaryPolicyNumberTBox = "";
			variables.instance.primaryGroupNumberTBox = "";
			variables.instance.secondaryGroupNumberTBox = "";
			variables.instance.primaryPhoneNumberTBox = "";
			variables.instance.secondaryPhoneNumberTBox = "";
			variables.instance.priEffectiveDateMM = "";
			variables.instance.priEffectiveDateDD = "";
			variables.instance.priEffectiveDateYY = "";
			variables.instance.secEffectiveDateMM = "";
			variables.instance.secEffectiveDateDD = "";
			variables.instance.secEffectiveDateYY = "";
			variables.instance.priPolicyHolderNameTBox = "";
			variables.instance.secPolicyHolderNameTBox = "";
			variables.instance.priHoldersDOBMM = "";
			variables.instance.priHoldersDOBDD = "";
			variables.instance.priHoldersDOBYY = "";
			variables.instance.secHoldersDOBMM = "";
			variables.instance.secHoldersDOBDD = "";
			variables.instance.secHoldersDOBYY = "";
			variables.instance.priPolicyHolderEmployerTBox = "";
			variables.instance.secPolicyHolderEmployerTBox = "";
			variables.instance.priNoteTBox = "";
			variables.instance.secNoteTBox = "";
			variables.instance.poNumberTBox = "";
			variables.instance.creditCardTypeTBox = "";
			variables.instance.creditCardNumberTBox = "";
			variables.instance.ccDateMM = "";
			variables.instance.ccDateDD = "";
			variables.instance.ccDateYY = "";
			variables.instance.orderingPhysicianNameTBox = "";
			variables.instance.orderingPhysicianPhoneTBox = "";
			variables.instance.orderingPhysicianUPINTBox = "";
			variables.instance.orderingPhysicianFaxTBox = "";
			variables.instance.orderingPhysicianAddressTBox = "";
			variables.instance.orderingPhysicianCityTBox = "";
			variables.instance.orderingPhysicianStateTBox = "";
			variables.instance.orderingPhysicianZipTBox = "";
			variables.instance.verificationRepNameTBox = "";
			variables.instance.verificationDateMM = "";
			variables.instance.verificationDateDD = "";
			variables.instance.verificationDateYY = "";
			variables.instance.verificationTimeTBox = "";
			variables.instance.OPTION_4_CBox_VerificationHaveInsYes = "";
			variables.instance.OPTION_4_CBox_VerificationHaveInsNo = "";
			variables.instance.verificationHaveInsFromMM = "";
			variables.instance.verificationHaveInsFromDD = "";
			variables.instance.verificationHaveInsFromYY = "";
			variables.instance.verificationHaveInsToMM = "";
			variables.instance.verificationHaveInsToDD = "";
			variables.instance.verificationHaveInsToYY = "";
			variables.instance.OPTION_5_CBox_VerificationHaveDMECovYes = "";
			variables.instance.OPTION_5_CBox_VerificationHaveDMECovNo = "";
			variables.instance.OPTION_6_CBox_VerificationDeductibleYes = "";
			variables.instance.OPTION_6_CBox_VerificationDeductibleNo = "";
			variables.instance.OPTION_7_CBox_VerificationDeductibleMetYes = "";
			variables.instance.OPTION_7_CBox_VerificationDeductibleMetNo = "";
			variables.instance.verificationDeductibleAmountTBox = "";
			variables.instance.OPTION_8_CBox_VerificationPPOPolicyYes = "";
			variables.instance.OPTION_8_CBox_VerificationPPOPolicyNo = "";
			variables.instance.verificationPercentagePayAfterDeductibleTBox = "";
			variables.instance.OPTION_9_CBox_VerificationPriorAuthYes = "";
			variables.instance.OPTION_9_CBox_VerificationPriorAuthNo = "";
			variables.instance.verificationAuthNumberTBox = "";
			variables.instance.OPTION_10_CBox_VerificationLifetimeBenefitMetYes = "";
			variables.instance.OPTION_10_CBox_VerificationLifetimeBenefitMetNo = "";
			variables.instance.verificationAuthPhoneNumberTBox = "";
			variables.instance.OPTION_11_CBox_VerificationInsFollowMedicareYes = "";
			variables.instance.OPTION_11_CBox_VerificationInsFollowMedicareNo = "";
			variables.instance.OPTION_12_CBox_VerificationMedicaidPlanMQMB = "";
			variables.instance.OPTION_12_CBox_VerificationMedicaidPlanQMB = "";
			variables.instance.OPTION_12_CBox_VerificationMedicaidPlanTraditional = "";
			variables.instance.VerificationTypeBasePlanTBox = "";
			variables.instance.OPTION_13_CBox_PastEquipmentYes = "";
			variables.instance.OPTION_13_CBox_PastEquipmentNo = "";
			variables.instance.Equipment1TypeTBox = "";
			variables.instance.Equipment1RentPurchasedSelect = "";
			variables.instance.Equipment1FromMM = "";
			variables.instance.Equipment1FromDD = "";
			variables.instance.Equipment1FromYY = "";
			variables.instance.Equipment1ToMM = "";
			variables.instance.Equipment1ToDD = "";
			variables.instance.Equipment1ToYY = "";
			variables.instance.Equipment1SupplierNameTBox = "";
			variables.instance.Equipment1SupplierTelephoneTBox = "";
			variables.instance.Equipment2TypeTBox = "";
			variables.instance.Equipment2RentPurchasedSelect = "";
			variables.instance.Equipment2FromMM = "";
			variables.instance.Equipment2FromDD = "";
			variables.instance.Equipment2FromYY = "";
			variables.instance.Equipment2ToMM = "";
			variables.instance.Equipment2ToDD = "";
			variables.instance.Equipment2ToYY = "";
			variables.instance.Equipment2SupplierNameTBox = "";
			variables.instance.Equipment2SupplierTelephoneTBox = "";
			variables.instance.Equipment3TypeTBox = "";
			variables.instance.Equipment3RentPurchasedSelect = "";
			variables.instance.Equipment3FromMM = "";
			variables.instance.Equipment3FromDD = "";
			variables.instance.Equipment3FromYY = "";
			variables.instance.Equipment3ToMM = "";
			variables.instance.Equipment3ToDD = "";
			variables.instance.Equipment3ToYY = "";
			variables.instance.Equipment3SupplierNameTBox = "";
			variables.instance.Equipment3SupplierTelephoneTBox = "";
			variables.instance.Equipment4TypeTBox = "";
			variables.instance.Equipment4RentPurchasedSelect = "";
			variables.instance.Equipment4FromMM = "";
			variables.instance.Equipment4FromDD = "";
			variables.instance.Equipment4FromYY = "";
			variables.instance.Equipment4ToMM = "";
			variables.instance.Equipment4ToDD = "";
			variables.instance.Equipment4ToYY = "";
			variables.instance.Equipment4SupplierNameTBox = "";
			variables.instance.Equipment4SupplierTelephoneTBox = "";
			variables.instance.Equipment5TypeTBox = "";
			variables.instance.Equipment5RentPurchasedSelect = "";
			variables.instance.Equipment5FromMM = "";
			variables.instance.Equipment5FromDD = "";
			variables.instance.Equipment5FromYY = "";
			variables.instance.Equipment5ToMM = "";
			variables.instance.Equipment5ToDD = "";
			variables.instance.Equipment5ToYY = "";
			variables.instance.Equipment5SupplierNameTBox = "";
			variables.instance.Equipment5SupplierTelephoneTBox = "";
			variables.instance.OPTION_14_CBox_OxygenPAo2 = "";
			variables.instance.OPTION_14_CBox_OxygenSAo2 = "";
			variables.instance.OPTION_14_CBox_OxygenSPo2 = "";
			variables.instance.OxygenPAO2TBox = "";
			variables.instance.OxygenSAO2TBox = "";
			variables.instance.CPAPStudy_CBox = "";
			variables.instance.CPAPStudyNote = "";
			variables.instance.OxygenSPO2TBox = "";
			variables.instance.CPAPStudyOnFile_CBox = "";
			variables.instance.CPAPStudyOnFileNote = "";
			variables.instance.LabTestDateMM = "";
			variables.instance.LabTestDateDD = "";
			variables.instance.LabTestDateYY = "";
			variables.instance.CPAPStudyPerformedAt = "";
			variables.instance.LabTestFacilityTBox = "";
			variables.instance.CPAPStudyPerformedAt2 = "";
			variables.instance.CPAPStudyPerformedAt3 = "";
			variables.instance.Active = "";
			variables.instance.InactiveCode = "NULL";
			variables.instance.DateCreated = "";
			variables.instance.DateModified = "";		
		</cfscript>
		
	</cffunction>	
	
	

	<cfset defaultsQuery = QueryNew("COLUMN_NAME,IS_NULLABLE,COLUMN_DEFAULT,DATA_TYPE")>
	<cfset temp = QueryAddRow(defaultsQuery, 260)>
	
	

	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "RECORDID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HIDDEN_USERSID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "BEDNUMBERTBOX", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTADDRESSTBOX", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTCITYTBOX", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTSTATETBOX", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTZIPTBOX", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTPHONETBOX", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTDOBMM", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTDOBDD", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTDOBYY", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTSSNTBOX", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTHEIGHTFEET", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTHEIGHTINCHES", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 14)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTWEIGHTTBOX", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 15)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ALTERNATECONTACTNAMETBOX", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 16)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ALTERNATECONTACTRELATIONSHIPTBOX", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 17)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ALTERNATECONTACTPHONETBOX", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 18)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE1TBOX", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 19)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY1TBOX", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 20)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT1TBOX", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 21)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX1TBOX", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 22)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS1TBOX", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 23)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR1TBOX", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 24)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH1TBOX", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 25)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE2TBOX", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 26)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY2TBOX", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 27)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT2TBOX", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 28)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX2TBOX", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 29)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS2TBOX", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 30)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR2TBOX", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 31)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH2TBOX", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 32)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE3TBOX", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 33)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY3TBOX", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 34)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT3TBOX", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 35)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX3TBOX", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 36)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS3TBOX", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 37)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR3TBOX", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 38)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH3TBOX", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 39)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE4TBOX", 40)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 40)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 40)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 40)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY4TBOX", 41)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 41)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 41)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 41)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT4TBOX", 42)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 42)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 42)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 42)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX4TBOX", 43)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 43)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 43)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 43)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS4TBOX", 44)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 44)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 44)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 44)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR4TBOX", 45)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 45)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 45)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 45)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH4TBOX", 46)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 46)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 46)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 46)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE5TBOX", 47)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 47)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 47)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 47)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY5TBOX", 48)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 48)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 48)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 48)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT5TBOX", 49)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 49)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 49)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 49)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX5TBOX", 50)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 50)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 50)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 50)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS5TBOX", 51)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 51)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 51)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 51)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR5TBOX", 52)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 52)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 52)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 52)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH5TBOX", 53)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 53)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 53)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 53)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE6TBOX", 54)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 54)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 54)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 54)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY6TBOX", 55)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 55)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 55)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 55)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT6TBOX", 56)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 56)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 56)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 56)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX6TBOX", 57)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 57)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 57)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 57)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS6TBOX", 58)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 58)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 58)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 58)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR6TBOX", 59)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 59)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 59)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 59)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH6TBOX", 60)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 60)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 60)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 60)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE7TBOX", 61)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 61)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 61)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 61)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY7TBOX", 62)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 62)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 62)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 62)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT7TBOX", 63)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 63)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 63)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 63)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX7TBOX", 64)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 64)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 64)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 64)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS7TBOX", 65)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 65)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 65)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 65)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR7TBOX", 66)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 66)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 66)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 66)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH7TBOX", 67)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 67)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 67)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 67)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE8TBOX", 68)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 68)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 68)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 68)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY8TBOX", 69)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 69)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 69)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 69)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT8TBOX", 70)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 70)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 70)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 70)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX8TBOX", 71)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 71)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 71)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 71)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS8TBOX", 72)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 72)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 72)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 72)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR8TBOX", 73)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 73)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 73)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 73)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH8TBOX", 74)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 74)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 74)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 74)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE9TBOX", 75)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 75)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 75)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 75)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY9TBOX", 76)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 76)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 76)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 76)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT9TBOX", 77)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 77)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 77)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 77)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX9TBOX", 78)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 78)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 78)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 78)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS9TBOX", 79)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 79)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 79)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 79)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR9TBOX", 80)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 80)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 80)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 80)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH9TBOX", 81)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 81)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 81)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 81)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCCODE10TBOX", 82)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 82)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 82)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 82)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCQTY10TBOX", 83)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 83)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 83)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 83)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCPRODUCT10TBOX", 84)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 84)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 84)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 84)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDX10TBOX", 85)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 85)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 85)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 85)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCDIAGNOSIS10TBOX", 86)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 86)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 86)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 86)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDYEAR10TBOX", 87)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 87)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 87)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 87)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HCPCLENGTHOFNEEDMONTH10TBOX", 88)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 88)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 88)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 88)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PRIMARYINSURANCENAMETBOX", 89)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 89)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 89)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 89)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SECONDARYINSURANCENAMETBOX", 90)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 90)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 90)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 90)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PRIMARYPOLICYNUMBERTBOX", 91)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 91)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 91)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 91)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SECONDARYPOLICYNUMBERTBOX", 92)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 92)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 92)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 92)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PRIMARYGROUPNUMBERTBOX", 93)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 93)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 93)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 93)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SECONDARYGROUPNUMBERTBOX", 94)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 94)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 94)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 94)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PRIMARYPHONENUMBERTBOX", 95)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 95)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 95)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 95)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SECONDARYPHONENUMBERTBOX", 96)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 96)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 96)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 96)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PRIEFFECTIVEDATEMM", 97)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 97)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 97)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 97)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PRIEFFECTIVEDATEDD", 98)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 98)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 98)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 98)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PRIEFFECTIVEDATEYY", 99)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 99)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 99)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 99)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SECEFFECTIVEDATEMM", 100)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 100)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 100)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 100)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SECEFFECTIVEDATEDD", 101)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 101)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 101)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 101)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SECEFFECTIVEDATEYY", 102)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 102)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 102)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 102)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PRIPOLICYHOLDERNAMETBOX", 103)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 103)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 103)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 103)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SECPOLICYHOLDERNAMETBOX", 104)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 104)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 104)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 104)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PRIHOLDERSDOBMM", 105)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 105)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 105)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 105)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PRIHOLDERSDOBDD", 106)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 106)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 106)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 106)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PRIHOLDERSDOBYY", 107)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 107)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 107)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 107)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SECHOLDERSDOBMM", 108)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 108)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 108)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 108)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SECHOLDERSDOBDD", 109)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 109)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 109)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 109)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SECHOLDERSDOBYY", 110)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 110)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 110)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 110)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PRIPOLICYHOLDEREMPLOYERTBOX", 111)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 111)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 111)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 111)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SECPOLICYHOLDEREMPLOYERTBOX", 112)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 112)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 112)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 112)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PRINOTETBOX", 113)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 113)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 113)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 113)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SECNOTETBOX", 114)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 114)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 114)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 114)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PONUMBERTBOX", 115)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 115)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 115)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 115)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CREDITCARDTYPETBOX", 116)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 116)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 116)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 116)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CREDITCARDNUMBERTBOX", 117)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 117)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 117)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 117)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CCDATEMM", 118)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 118)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 118)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 118)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CCDATEDD", 119)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 119)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 119)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 119)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CCDATEYY", 120)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 120)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 120)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 120)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANNAMETBOX", 121)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 121)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 121)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 121)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANPHONETBOX", 122)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 122)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 122)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 122)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANUPINTBOX", 123)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 123)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 123)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 123)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANFAXTBOX", 124)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 124)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 124)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 124)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANADDRESSTBOX", 125)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 125)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 125)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 125)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANCITYTBOX", 126)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 126)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 126)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 126)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANSTATETBOX", 127)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 127)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 127)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 127)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANZIPTBOX", 128)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 128)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 128)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 128)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONREPNAMETBOX", 129)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 129)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 129)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 129)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONDATEMM", 130)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 130)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 130)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 130)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONDATEDD", 131)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 131)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 131)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 131)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONDATEYY", 132)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 132)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 132)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 132)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONTIMETBOX", 133)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 133)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 133)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 133)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_4_CBOX_VERIFICATIONHAVEINSYES", 134)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 134)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 134)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 134)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_4_CBOX_VERIFICATIONHAVEINSNO", 135)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 135)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 135)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 135)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONHAVEINSFROMMM", 136)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 136)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 136)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 136)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONHAVEINSFROMDD", 137)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 137)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 137)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 137)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONHAVEINSFROMYY", 138)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 138)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 138)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 138)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONHAVEINSTOMM", 139)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 139)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 139)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 139)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONHAVEINSTODD", 140)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 140)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 140)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 140)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONHAVEINSTOYY", 141)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 141)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 141)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 141)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_5_CBOX_VERIFICATIONHAVEDMECOVYES", 142)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 142)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 142)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 142)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_5_CBOX_VERIFICATIONHAVEDMECOVNO", 143)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 143)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 143)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 143)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_6_CBOX_VERIFICATIONDEDUCTIBLEYES", 144)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 144)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 144)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 144)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_6_CBOX_VERIFICATIONDEDUCTIBLENO", 145)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 145)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 145)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 145)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_7_CBOX_VERIFICATIONDEDUCTIBLEMETYES", 146)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 146)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 146)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 146)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_7_CBOX_VERIFICATIONDEDUCTIBLEMETNO", 147)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 147)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 147)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 147)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONDEDUCTIBLEAMOUNTTBOX", 148)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 148)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 148)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 148)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_8_CBOX_VERIFICATIONPPOPOLICYYES", 149)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 149)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 149)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 149)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_8_CBOX_VERIFICATIONPPOPOLICYNO", 150)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 150)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 150)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 150)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONPERCENTAGEPAYAFTERDEDUCTIBLETBOX", 151)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 151)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 151)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 151)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_9_CBOX_VERIFICATIONPRIORAUTHYES", 152)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 152)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 152)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 152)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_9_CBOX_VERIFICATIONPRIORAUTHNO", 153)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 153)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 153)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 153)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONAUTHNUMBERTBOX", 154)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 154)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 154)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 154)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_10_CBOX_VERIFICATIONLIFETIMEBENEFITMETYES", 155)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 155)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 155)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 155)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_10_CBOX_VERIFICATIONLIFETIMEBENEFITMETNO", 156)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 156)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 156)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 156)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONAUTHPHONENUMBERTBOX", 157)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 157)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 157)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 157)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_11_CBOX_VERIFICATIONINSFOLLOWMEDICAREYES", 158)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 158)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 158)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 158)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_11_CBOX_VERIFICATIONINSFOLLOWMEDICARENO", 159)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 159)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 159)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 159)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_12_CBOX_VERIFICATIONMEDICAIDPLANMQMB", 160)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 160)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 160)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 160)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_12_CBOX_VERIFICATIONMEDICAIDPLANQMB", 161)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 161)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 161)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 161)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_12_CBOX_VERIFICATIONMEDICAIDPLANTRADITIONAL", 162)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 162)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 162)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 162)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "VERIFICATIONTYPEBASEPLANTBOX", 163)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 163)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 163)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 163)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_13_CBOX_PASTEQUIPMENTYES", 164)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 164)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 164)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 164)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_13_CBOX_PASTEQUIPMENTNO", 165)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 165)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 165)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 165)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1TYPETBOX", 166)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 166)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 166)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 166)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1RENTPURCHASEDSELECT", 167)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 167)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 167)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 167)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1FROMMM", 168)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 168)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 168)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 168)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1FROMDD", 169)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 169)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 169)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 169)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1FROMYY", 170)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 170)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 170)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 170)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1TOMM", 171)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 171)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 171)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 171)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1TODD", 172)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 172)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 172)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 172)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1TOYY", 173)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 173)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 173)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 173)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1SUPPLIERNAMETBOX", 174)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 174)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 174)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 174)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1SUPPLIERTELEPHONETBOX", 175)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 175)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 175)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 175)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2TYPETBOX", 176)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 176)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 176)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 176)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2RENTPURCHASEDSELECT", 177)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 177)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 177)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 177)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2FROMMM", 178)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 178)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 178)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 178)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2FROMDD", 179)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 179)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 179)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 179)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2FROMYY", 180)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 180)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 180)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 180)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2TOMM", 181)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 181)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 181)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 181)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2TODD", 182)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 182)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 182)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 182)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2TOYY", 183)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 183)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 183)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 183)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2SUPPLIERNAMETBOX", 184)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 184)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 184)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 184)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2SUPPLIERTELEPHONETBOX", 185)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 185)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 185)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 185)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3TYPETBOX", 186)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 186)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 186)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 186)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3RENTPURCHASEDSELECT", 187)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 187)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 187)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 187)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3FROMMM", 188)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 188)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 188)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 188)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3FROMDD", 189)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 189)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 189)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 189)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3FROMYY", 190)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 190)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 190)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 190)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3TOMM", 191)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 191)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 191)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 191)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3TODD", 192)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 192)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 192)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 192)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3TOYY", 193)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 193)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 193)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 193)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3SUPPLIERNAMETBOX", 194)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 194)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 194)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 194)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3SUPPLIERTELEPHONETBOX", 195)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 195)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 195)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 195)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4TYPETBOX", 196)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 196)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 196)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 196)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4RENTPURCHASEDSELECT", 197)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 197)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 197)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 197)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4FROMMM", 198)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 198)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 198)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 198)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4FROMDD", 199)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 199)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 199)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 199)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4FROMYY", 200)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 200)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 200)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 200)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4TOMM", 201)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 201)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 201)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 201)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4TODD", 202)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 202)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 202)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 202)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4TOYY", 203)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 203)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 203)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 203)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4SUPPLIERNAMETBOX", 204)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 204)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 204)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 204)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4SUPPLIERTELEPHONETBOX", 205)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 205)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 205)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 205)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5TYPETBOX", 206)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 206)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 206)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 206)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5RENTPURCHASEDSELECT", 207)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 207)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 207)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 207)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5FROMMM", 208)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 208)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 208)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 208)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5FROMDD", 209)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 209)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 209)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 209)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5FROMYY", 210)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 210)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 210)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 210)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5TOMM", 211)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 211)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 211)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 211)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5TODD", 212)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 212)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 212)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 212)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5TOYY", 213)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 213)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 213)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 213)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5SUPPLIERNAMETBOX", 214)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 214)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 214)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 214)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5SUPPLIERTELEPHONETBOX", 215)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 215)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 215)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 215)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_14_CBOX_OXYGENPAO2", 216)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 216)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 216)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 216)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_14_CBOX_OXYGENSAO2", 217)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 217)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 217)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 217)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_14_CBOX_OXYGENSPO2", 218)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 218)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 218)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 218)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OXYGENPAO2TBOX", 219)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 219)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 219)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 219)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OXYGENSAO2TBOX", 220)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 220)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 220)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 220)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CPAPSTUDY_CBOX", 221)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 221)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 221)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 221)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CPAPSTUDYNOTE", 222)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 222)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 222)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 222)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OXYGENSPO2TBOX", 223)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 223)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 223)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 223)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CPAPSTUDYONFILE_CBOX", 224)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 224)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 224)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 224)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CPAPSTUDYONFILENOTE", 225)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 225)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 225)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 225)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LABTESTDATEMM", 226)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 226)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 226)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 226)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LABTESTDATEDD", 227)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 227)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 227)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 227)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LABTESTDATEYY", 228)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 228)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 228)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 228)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CPAPSTUDYPERFORMEDAT", 229)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 229)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 229)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 229)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LABTESTFACILITYTBOX", 230)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 230)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 230)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 230)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CPAPSTUDYPERFORMEDAT2", 231)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 231)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 231)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 231)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CPAPSTUDYPERFORMEDAT3", 232)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 232)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 232)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 232)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 233)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 233)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 233)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 233)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 234)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 234)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 234)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 234)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 235)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 235)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 235)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 235)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 236)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 236)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 236)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 236)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HIDDEN_TIMESTART", 237)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 237)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 237)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 237)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_1_CBOX_DELIVERY", 238)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 238)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 238)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 238)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_1_CBOX_PICKUP", 239)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 239)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 239)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 239)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_1_CBOX_REPAIR", 240)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 240)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 240)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 240)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_1_CBOX_SWITCH", 241)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 241)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 241)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 241)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_1_CBOX_EXISTING", 242)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 242)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 242)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 242)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_2_CBOX_FACILITY", 243)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 243)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 243)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 243)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_2_CBOX_HOSPICE", 244)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 244)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 244)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 244)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_2_CBOX_HOSPITAL", 245)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 245)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 245)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 245)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "FACILITYTBOX", 246)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 246)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 246)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 246)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HOSPICETBOX", 247)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 247)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 247)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 247)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_3_CBOX_MEDICARE", 248)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 248)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 248)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 248)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_3_CBOX_PRIVATEINSURANCE", 249)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 249)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 249)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 249)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_3_CBOX_MEDICAID", 250)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 250)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 250)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 250)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_3_CBOX_PRIVATEPAY", 251)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 251)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 251)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 251)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HOSPITALTBOX", 252)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 252)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 252)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 252)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DISCHARGEDATEMM", 253)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 253)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 253)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 253)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DISCHARGEDATEDD", 254)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 254)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 254)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 254)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DISCHARGEDATEYY", 255)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 255)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 255)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 255)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TYPEOFPAY_RADIO", 256)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 256)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 256)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 256)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CALLERNAMETBOX", 257)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 257)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 257)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 257)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CALLERPHONETBOX", 258)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 258)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 258)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 258)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTNAMETBOX", 259)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 259)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 259)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 259)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ROOMNUMBERTBOX", 260)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 260)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 260)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 260)>
	

	
	<cffunction name="getRecordID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.RecordID>
	</cffunction>
	 
	<cffunction name="setRecordID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="RecordID" required="Yes" type="String">
		
		<cfif RecordID NEQ "NULL">	
			
			<cfif NOT REQUEST.isintDataType(RecordID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>RecordID</strong> (#RecordID#) is not of type <strong>int</strong>.">
			</cfif>
						
			<cfif arguments.recordID EQ "@@">
				<cfset arguments.recordID = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.RecordID = arguments.RecordID>			
		<cfreturn true>
		
	</cffunction>
	
	

	
	<cffunction name="getHidden_UsersID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Hidden_UsersID>
	</cffunction>
	 
	<cffunction name="setHidden_UsersID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Hidden_UsersID" required="Yes" type="String">
		
		<cfif Hidden_UsersID NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Hidden_UsersID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Hidden_UsersID</strong> (#Hidden_UsersID#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hidden_UsersID) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Hidden_UsersID</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hidden_UsersID EQ "@@">
				<cfset arguments.hidden_UsersID = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Hidden_UsersID = arguments.Hidden_UsersID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Hidden_UsersID")>			
		<cfreturn true>
		
	</cffunction>
	
	
	
	<cffunction name="getHidden_TimeStart" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Hidden_TimeStart>
	</cffunction>
	 
	<cffunction name="setHidden_TimeStart" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Hidden_TimeStart" required="Yes" type="String">
		
		<cfif Hidden_TimeStart NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Hidden_TimeStart)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Hidden_TimeStart</strong> (#Hidden_TimeStart#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hidden_TimeStart) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Hidden_TimeStart</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hidden_TimeStart EQ "@@">
				<cfset arguments.hidden_TimeStart = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Hidden_TimeStart = arguments.Hidden_TimeStart>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Hidden_TimeStart")>			
		<cfreturn true>
		
	</cffunction>
	
	

	
	<cffunction name="getOPTION_1_CBox_Delivery" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_1_CBox_Delivery>
	</cffunction>
	 
	<cffunction name="setOPTION_1_CBox_Delivery" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_1_CBox_Delivery" required="Yes" type="String">
		
		<cfif OPTION_1_CBox_Delivery NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_1_CBox_Delivery)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_1_CBox_Delivery</strong> (#OPTION_1_CBox_Delivery#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_1_CBox_Delivery) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_1_CBox_Delivery</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_1_CBox_Delivery EQ "@@">
				<cfset arguments.OPTION_1_CBox_Delivery = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_1_CBox_Delivery = arguments.OPTION_1_CBox_Delivery>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_1_CBox_Delivery")>			
		<cfreturn true>
		
	</cffunction>

	<cffunction name="getOPTION_1_CBox_Pickup" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_1_CBox_Pickup>
	</cffunction>
	 
	<cffunction name="setOPTION_1_CBox_Pickup" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_1_CBox_Pickup" required="Yes" type="String">
		
		<cfif OPTION_1_CBox_Pickup NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_1_CBox_Pickup)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_1_CBox_Pickup</strong> (#OPTION_1_CBox_Pickup#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_1_CBox_Pickup) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_1_CBox_Pickup</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_1_CBox_Pickup EQ "@@">
				<cfset arguments.OPTION_1_CBox_Pickup = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_1_CBox_Pickup = arguments.OPTION_1_CBox_Pickup>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_1_CBox_Pickup")>			
		<cfreturn true>
		
	</cffunction>
	
	
	<cffunction name="getOPTION_1_CBox_Repair" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_1_CBox_Repair>
	</cffunction>
	 
	<cffunction name="setOPTION_1_CBox_Repair" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_1_CBox_Repair" required="Yes" type="String">
		
		<cfif OPTION_1_CBox_Repair NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_1_CBox_Repair)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_1_CBox_Repair</strong> (#OPTION_1_CBox_Repair#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_1_CBox_Repair) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_1_CBox_Repair</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_1_CBox_Repair EQ "@@">
				<cfset arguments.OPTION_1_CBox_Repair = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_1_CBox_Repair = arguments.OPTION_1_CBox_Repair>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_1_CBox_Repair")>			
		<cfreturn true>
		
	</cffunction>
	
	
	
	<cffunction name="getOPTION_1_CBox_Switch" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_1_CBox_Switch>
	</cffunction>
	 
	<cffunction name="setOPTION_1_CBox_Switch" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_1_CBox_Switch" required="Yes" type="String">
		
		<cfif OPTION_1_CBox_Switch NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_1_CBox_Switch)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_1_CBox_Switch</strong> (#OPTION_1_CBox_Switch#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_1_CBox_Switch) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_1_CBox_Switch</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_1_CBox_Switch EQ "@@">
				<cfset arguments.OPTION_1_CBox_Switch = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_1_CBox_Switch = arguments.OPTION_1_CBox_Switch>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_1_CBox_Switch")>			
		<cfreturn true>
		
	</cffunction>
	
	

	
	<cffunction name="getOPTION_1_CBox_Existing" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_1_CBox_Existing>
	</cffunction>
	 
	<cffunction name="setOPTION_1_CBox_Existing" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_1_CBox_Existing" required="Yes" type="String">
		
		<cfif OPTION_1_CBox_Existing NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_1_CBox_Existing)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_1_CBox_Existing</strong> (#OPTION_1_CBox_Existing#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_1_CBox_Existing) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_1_CBox_Existing</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_1_CBox_Existing EQ "@@">
				<cfset arguments.OPTION_1_CBox_Existing = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_1_CBox_Existing = arguments.OPTION_1_CBox_Existing>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_1_CBox_Existing")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_2_CBox_Facility.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_2_CBox_Facility" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_2_CBox_Facility>
	</cffunction>
	 
	<cffunction name="setOPTION_2_CBox_Facility" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_2_CBox_Facility" required="Yes" type="String">
		
		<cfif OPTION_2_CBox_Facility NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_2_CBox_Facility)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_2_CBox_Facility</strong> (#OPTION_2_CBox_Facility#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_2_CBox_Facility) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_2_CBox_Facility</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_2_CBox_Facility EQ "@@">
				<cfset arguments.OPTION_2_CBox_Facility = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_2_CBox_Facility = arguments.OPTION_2_CBox_Facility>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_2_CBox_Facility")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_2_CBox_Hospice.                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_2_CBox_Hospice" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_2_CBox_Hospice>
	</cffunction>
	 
	<cffunction name="setOPTION_2_CBox_Hospice" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_2_CBox_Hospice" required="Yes" type="String">
		
		<cfif OPTION_2_CBox_Hospice NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_2_CBox_Hospice)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_2_CBox_Hospice</strong> (#OPTION_2_CBox_Hospice#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_2_CBox_Hospice) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_2_CBox_Hospice</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_2_CBox_Hospice EQ "@@">
				<cfset arguments.OPTION_2_CBox_Hospice = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_2_CBox_Hospice = arguments.OPTION_2_CBox_Hospice>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_2_CBox_Hospice")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_2_CBox_Hospital.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_2_CBox_Hospital" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_2_CBox_Hospital>
	</cffunction>
	 
	<cffunction name="setOPTION_2_CBox_Hospital" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_2_CBox_Hospital" required="Yes" type="String">
		
		<cfif OPTION_2_CBox_Hospital NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_2_CBox_Hospital)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_2_CBox_Hospital</strong> (#OPTION_2_CBox_Hospital#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_2_CBox_Hospital) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_2_CBox_Hospital</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_2_CBox_Hospital EQ "@@">
				<cfset arguments.OPTION_2_CBox_Hospital = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_2_CBox_Hospital = arguments.OPTION_2_CBox_Hospital>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_2_CBox_Hospital")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for facilityTBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getFacilityTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.FacilityTBox>
	</cffunction>
	 
	<cffunction name="setFacilityTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="FacilityTBox" required="Yes" type="String">
		
		<cfif FacilityTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(FacilityTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>FacilityTBox</strong> (#FacilityTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(facilityTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>FacilityTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.facilityTBox EQ "@@">
				<cfset arguments.facilityTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.FacilityTBox = arguments.FacilityTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "FacilityTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hospiceTBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHospiceTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HospiceTBox>
	</cffunction>
	 
	<cffunction name="setHospiceTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HospiceTBox" required="Yes" type="String">
		
		<cfif HospiceTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HospiceTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HospiceTBox</strong> (#HospiceTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hospiceTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HospiceTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hospiceTBox EQ "@@">
				<cfset arguments.hospiceTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HospiceTBox = arguments.HospiceTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HospiceTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_3_CBox_Medicare.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_3_CBox_Medicare" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_3_CBox_Medicare>
	</cffunction>
	 
	<cffunction name="setOPTION_3_CBox_Medicare" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_3_CBox_Medicare" required="Yes" type="String">
		
		<cfif OPTION_3_CBox_Medicare NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_3_CBox_Medicare)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_3_CBox_Medicare</strong> (#OPTION_3_CBox_Medicare#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_3_CBox_Medicare) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_3_CBox_Medicare</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_3_CBox_Medicare EQ "@@">
				<cfset arguments.OPTION_3_CBox_Medicare = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_3_CBox_Medicare = arguments.OPTION_3_CBox_Medicare>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_3_CBox_Medicare")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_3_CBox_PrivateInsurance.                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_3_CBox_PrivateInsurance" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_3_CBox_PrivateInsurance>
	</cffunction>
	 
	<cffunction name="setOPTION_3_CBox_PrivateInsurance" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_3_CBox_PrivateInsurance" required="Yes" type="String">
		
		<cfif OPTION_3_CBox_PrivateInsurance NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_3_CBox_PrivateInsurance)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_3_CBox_PrivateInsurance</strong> (#OPTION_3_CBox_PrivateInsurance#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_3_CBox_PrivateInsurance) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_3_CBox_PrivateInsurance</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_3_CBox_PrivateInsurance EQ "@@">
				<cfset arguments.OPTION_3_CBox_PrivateInsurance = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_3_CBox_PrivateInsurance = arguments.OPTION_3_CBox_PrivateInsurance>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_3_CBox_PrivateInsurance")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_3_CBox_Medicaid.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_3_CBox_Medicaid" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_3_CBox_Medicaid>
	</cffunction>
	 
	<cffunction name="setOPTION_3_CBox_Medicaid" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_3_CBox_Medicaid" required="Yes" type="String">
		
		<cfif OPTION_3_CBox_Medicaid NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_3_CBox_Medicaid)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_3_CBox_Medicaid</strong> (#OPTION_3_CBox_Medicaid#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_3_CBox_Medicaid) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_3_CBox_Medicaid</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_3_CBox_Medicaid EQ "@@">
				<cfset arguments.OPTION_3_CBox_Medicaid = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_3_CBox_Medicaid = arguments.OPTION_3_CBox_Medicaid>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_3_CBox_Medicaid")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_3_CBox_PrivatePay.                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_3_CBox_PrivatePay" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_3_CBox_PrivatePay>
	</cffunction>
	 
	<cffunction name="setOPTION_3_CBox_PrivatePay" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_3_CBox_PrivatePay" required="Yes" type="String">
		
		<cfif OPTION_3_CBox_PrivatePay NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_3_CBox_PrivatePay)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_3_CBox_PrivatePay</strong> (#OPTION_3_CBox_PrivatePay#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_3_CBox_PrivatePay) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_3_CBox_PrivatePay</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_3_CBox_PrivatePay EQ "@@">
				<cfset arguments.OPTION_3_CBox_PrivatePay = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_3_CBox_PrivatePay = arguments.OPTION_3_CBox_PrivatePay>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_3_CBox_PrivatePay")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hospitalTBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHospitalTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HospitalTBox>
	</cffunction>
	 
	<cffunction name="setHospitalTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HospitalTBox" required="Yes" type="String">
		
		<cfif HospitalTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HospitalTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HospitalTBox</strong> (#HospitalTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hospitalTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HospitalTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hospitalTBox EQ "@@">
				<cfset arguments.hospitalTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HospitalTBox = arguments.HospitalTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HospitalTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DischargeDateMM.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDischargeDateMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DischargeDateMM>
	</cffunction>
	 
	<cffunction name="setDischargeDateMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DischargeDateMM" required="Yes" type="String">
		
		<cfif DischargeDateMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(DischargeDateMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DischargeDateMM</strong> (#DischargeDateMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(DischargeDateMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>DischargeDateMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.DischargeDateMM EQ "@@">
				<cfset arguments.DischargeDateMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.DischargeDateMM = arguments.DischargeDateMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DischargeDateMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DischargeDateDD.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDischargeDateDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DischargeDateDD>
	</cffunction>
	 
	<cffunction name="setDischargeDateDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DischargeDateDD" required="Yes" type="String">
		
		<cfif DischargeDateDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(DischargeDateDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DischargeDateDD</strong> (#DischargeDateDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(DischargeDateDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>DischargeDateDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.DischargeDateDD EQ "@@">
				<cfset arguments.DischargeDateDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.DischargeDateDD = arguments.DischargeDateDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DischargeDateDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DischargeDateYY.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDischargeDateYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DischargeDateYY>
	</cffunction>
	 
	<cffunction name="setDischargeDateYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DischargeDateYY" required="Yes" type="String">
		
		<cfif DischargeDateYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(DischargeDateYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DischargeDateYY</strong> (#DischargeDateYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(DischargeDateYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>DischargeDateYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.DischargeDateYY EQ "@@">
				<cfset arguments.DischargeDateYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.DischargeDateYY = arguments.DischargeDateYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DischargeDateYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for typeOfPay_Radio.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTypeOfPay_Radio" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.TypeOfPay_Radio>
	</cffunction>
	 
	<cffunction name="setTypeOfPay_Radio" access="public" returntype="boolean" output="No">
 		
		<cfargument name="TypeOfPay_Radio" required="Yes" type="String">
		
		<cfif TypeOfPay_Radio NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(TypeOfPay_Radio)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>TypeOfPay_Radio</strong> (#TypeOfPay_Radio#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(typeOfPay_Radio) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>TypeOfPay_Radio</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.typeOfPay_Radio EQ "@@">
				<cfset arguments.typeOfPay_Radio = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.TypeOfPay_Radio = arguments.TypeOfPay_Radio>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "TypeOfPay_Radio")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for callerNameTBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCallerNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CallerNameTBox>
	</cffunction>
	 
	<cffunction name="setCallerNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CallerNameTBox" required="Yes" type="String">
		
		<cfif CallerNameTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(CallerNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CallerNameTBox</strong> (#CallerNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(callerNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CallerNameTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.callerNameTBox EQ "@@">
				<cfset arguments.callerNameTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.CallerNameTBox = arguments.CallerNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CallerNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for callerPhoneTBox.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCallerPhoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CallerPhoneTBox>
	</cffunction>
	 
	<cffunction name="setCallerPhoneTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CallerPhoneTBox" required="Yes" type="String">
		
		<cfif CallerPhoneTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(CallerPhoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CallerPhoneTBox</strong> (#CallerPhoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(callerPhoneTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CallerPhoneTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
			<cfif arguments.callerPhoneTBox EQ "@@">
				<cfset arguments.callerPhoneTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.CallerPhoneTBox = arguments.CallerPhoneTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CallerPhoneTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientNameTBox.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientNameTBox>
	</cffunction>
	 
	<cffunction name="setPatientNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientNameTBox" required="Yes" type="String">
		
		<cfif PatientNameTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PatientNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientNameTBox</strong> (#PatientNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientNameTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.patientNameTBox EQ "@@">
				<cfset arguments.patientNameTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PatientNameTBox = arguments.PatientNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for roomNumberTBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRoomNumberTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.RoomNumberTBox>
	</cffunction>
	 
	<cffunction name="setRoomNumberTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="RoomNumberTBox" required="Yes" type="String">
		
		<cfif RoomNumberTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(RoomNumberTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>RoomNumberTBox</strong> (#RoomNumberTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(roomNumberTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>RoomNumberTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.roomNumberTBox EQ "@@">
				<cfset arguments.roomNumberTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.RoomNumberTBox = arguments.RoomNumberTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "RoomNumberTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for bedNumberTBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getBedNumberTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.BedNumberTBox>
	</cffunction>
	 
	<cffunction name="setBedNumberTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="BedNumberTBox" required="Yes" type="String">
		
		<cfif BedNumberTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(BedNumberTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>BedNumberTBox</strong> (#BedNumberTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(bedNumberTBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>BedNumberTBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.bedNumberTBox EQ "@@">
				<cfset arguments.bedNumberTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.BedNumberTBox = arguments.BedNumberTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "BedNumberTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientAddressTBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientAddressTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientAddressTBox>
	</cffunction>
	 
	<cffunction name="setPatientAddressTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientAddressTBox" required="Yes" type="String">
		
		<cfif PatientAddressTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PatientAddressTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientAddressTBox</strong> (#PatientAddressTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientAddressTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientAddressTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.patientAddressTBox EQ "@@">
				<cfset arguments.patientAddressTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PatientAddressTBox = arguments.PatientAddressTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientAddressTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientCityTBox.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientCityTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientCityTBox>
	</cffunction>
	 
	<cffunction name="setPatientCityTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientCityTBox" required="Yes" type="String">
		
		<cfif PatientCityTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PatientCityTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientCityTBox</strong> (#PatientCityTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientCityTBox) GT 30>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientCityTBox</strong> cannot be greater than 30 character(s).">
			</cfif>
						
			<cfif arguments.patientCityTBox EQ "@@">
				<cfset arguments.patientCityTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PatientCityTBox = arguments.PatientCityTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientCityTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientStateTBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientStateTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientStateTBox>
	</cffunction>
	 
	<cffunction name="setPatientStateTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientStateTBox" required="Yes" type="String">
		
		<cfif PatientStateTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PatientStateTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientStateTBox</strong> (#PatientStateTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientStateTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientStateTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
			<cfif arguments.patientStateTBox EQ "@@">
				<cfset arguments.patientStateTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PatientStateTBox = arguments.PatientStateTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientStateTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientZipTBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientZipTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientZipTBox>
	</cffunction>
	 
	<cffunction name="setPatientZipTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientZipTBox" required="Yes" type="String">
		
		<cfif PatientZipTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PatientZipTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientZipTBox</strong> (#PatientZipTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientZipTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientZipTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
			<cfif arguments.patientZipTBox EQ "@@">
				<cfset arguments.patientZipTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PatientZipTBox = arguments.PatientZipTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientZipTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientPhoneTBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientPhoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientPhoneTBox>
	</cffunction>
	 
	<cffunction name="setPatientPhoneTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientPhoneTBox" required="Yes" type="String">
		
		<cfif PatientPhoneTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PatientPhoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientPhoneTBox</strong> (#PatientPhoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientPhoneTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientPhoneTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
			<cfif arguments.patientPhoneTBox EQ "@@">
				<cfset arguments.patientPhoneTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PatientPhoneTBox = arguments.PatientPhoneTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientPhoneTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientDOBMM.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientDOBMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientDOBMM>
	</cffunction>
	 
	<cffunction name="setPatientDOBMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientDOBMM" required="Yes" type="String">
		
		<cfif PatientDOBMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PatientDOBMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientDOBMM</strong> (#PatientDOBMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientDOBMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientDOBMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.patientDOBMM EQ "@@">
				<cfset arguments.patientDOBMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PatientDOBMM = arguments.PatientDOBMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientDOBMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientDOBDD.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientDOBDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientDOBDD>
	</cffunction>
	 
	<cffunction name="setPatientDOBDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientDOBDD" required="Yes" type="String">
		
		<cfif PatientDOBDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PatientDOBDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientDOBDD</strong> (#PatientDOBDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientDOBDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientDOBDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.patientDOBDD EQ "@@">
				<cfset arguments.patientDOBDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PatientDOBDD = arguments.PatientDOBDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientDOBDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientDOBYY.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientDOBYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientDOBYY>
	</cffunction>
	 
	<cffunction name="setPatientDOBYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientDOBYY" required="Yes" type="String">
		
		<cfif PatientDOBYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PatientDOBYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientDOBYY</strong> (#PatientDOBYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientDOBYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientDOBYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.patientDOBYY EQ "@@">
				<cfset arguments.patientDOBYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PatientDOBYY = arguments.PatientDOBYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientDOBYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientSSNTBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientSSNTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientSSNTBox>
	</cffunction>
	 
	<cffunction name="setPatientSSNTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientSSNTBox" required="Yes" type="String">
		
		<cfif PatientSSNTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PatientSSNTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientSSNTBox</strong> (#PatientSSNTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientSSNTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientSSNTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
			<cfif arguments.patientSSNTBox EQ "@@">
				<cfset arguments.patientSSNTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PatientSSNTBox = arguments.PatientSSNTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientSSNTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientHeightFeet.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientHeightFeet" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientHeightFeet>
	</cffunction>
	 
	<cffunction name="setPatientHeightFeet" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientHeightFeet" required="Yes" type="String">
		
		<cfif PatientHeightFeet NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PatientHeightFeet)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientHeightFeet</strong> (#PatientHeightFeet#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientHeightFeet) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientHeightFeet</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.patientHeightFeet EQ "@@">
				<cfset arguments.patientHeightFeet = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PatientHeightFeet = arguments.PatientHeightFeet>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientHeightFeet")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientHeightInches.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientHeightInches" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientHeightInches>
	</cffunction>
	 
	<cffunction name="setPatientHeightInches" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientHeightInches" required="Yes" type="String">
		
		<cfif PatientHeightInches NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PatientHeightInches)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientHeightInches</strong> (#PatientHeightInches#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientHeightInches) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientHeightInches</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.patientHeightInches EQ "@@">
				<cfset arguments.patientHeightInches = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PatientHeightInches = arguments.PatientHeightInches>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientHeightInches")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientWeightTBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientWeightTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientWeightTBox>
	</cffunction>
	 
	<cffunction name="setPatientWeightTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientWeightTBox" required="Yes" type="String">
		
		<cfif PatientWeightTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PatientWeightTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientWeightTBox</strong> (#PatientWeightTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientWeightTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientWeightTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.patientWeightTBox EQ "@@">
				<cfset arguments.patientWeightTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PatientWeightTBox = arguments.PatientWeightTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientWeightTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for alternateContactNameTBox.                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAlternateContactNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AlternateContactNameTBox>
	</cffunction>
	 
	<cffunction name="setAlternateContactNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AlternateContactNameTBox" required="Yes" type="String">
		
		<cfif AlternateContactNameTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(AlternateContactNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AlternateContactNameTBox</strong> (#AlternateContactNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(alternateContactNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>AlternateContactNameTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.alternateContactNameTBox EQ "@@">
				<cfset arguments.alternateContactNameTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.AlternateContactNameTBox = arguments.AlternateContactNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AlternateContactNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for alternateContactRelationshipTBox.                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAlternateContactRelationshipTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AlternateContactRelationshipTBox>
	</cffunction>
	 
	<cffunction name="setAlternateContactRelationshipTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AlternateContactRelationshipTBox" required="Yes" type="String">
		
		<cfif AlternateContactRelationshipTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(AlternateContactRelationshipTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AlternateContactRelationshipTBox</strong> (#AlternateContactRelationshipTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(alternateContactRelationshipTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>AlternateContactRelationshipTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.alternateContactRelationshipTBox EQ "@@">
				<cfset arguments.alternateContactRelationshipTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.AlternateContactRelationshipTBox = arguments.AlternateContactRelationshipTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AlternateContactRelationshipTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for alternateContactPhoneTBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAlternateContactPhoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AlternateContactPhoneTBox>
	</cffunction>
	 
	<cffunction name="setAlternateContactPhoneTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AlternateContactPhoneTBox" required="Yes" type="String">
		
		<cfif AlternateContactPhoneTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(AlternateContactPhoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AlternateContactPhoneTBox</strong> (#AlternateContactPhoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(alternateContactPhoneTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>AlternateContactPhoneTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.alternateContactPhoneTBox EQ "@@">
				<cfset arguments.alternateContactPhoneTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.AlternateContactPhoneTBox = arguments.AlternateContactPhoneTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AlternateContactPhoneTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode1TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode1TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode1TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode1TBox" required="Yes" type="String">
		
		<cfif HcpcCode1TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcCode1TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode1TBox</strong> (#HcpcCode1TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode1TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode1TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcCode1TBox EQ "@@">
				<cfset arguments.hcpcCode1TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcCode1TBox = arguments.HcpcCode1TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode1TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty1TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty1TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty1TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty1TBox" required="Yes" type="String">
		
		<cfif HcpcQty1TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcQty1TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty1TBox</strong> (#HcpcQty1TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty1TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty1TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcQty1TBox EQ "@@">
				<cfset arguments.hcpcQty1TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcQty1TBox = arguments.HcpcQty1TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty1TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct1TBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct1TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct1TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct1TBox" required="Yes" type="String">
		
		<cfif HcpcProduct1TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcProduct1TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct1TBox</strong> (#HcpcProduct1TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct1TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct1TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcProduct1TBox EQ "@@">
				<cfset arguments.hcpcProduct1TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct1TBox = arguments.HcpcProduct1TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct1TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX1TBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX1TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX1TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX1TBox" required="Yes" type="String">
		
		<cfif HcpcDX1TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcDX1TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX1TBox</strong> (#HcpcDX1TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX1TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX1TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
			<cfif arguments.hcpcDX1TBox EQ "@@">
				<cfset arguments.hcpcDX1TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcDX1TBox = arguments.HcpcDX1TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX1TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis1TBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis1TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis1TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis1TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis1TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcDiagnosis1TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis1TBox</strong> (#HcpcDiagnosis1TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis1TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis1TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcDiagnosis1TBox EQ "@@">
				<cfset arguments.hcpcDiagnosis1TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis1TBox = arguments.HcpcDiagnosis1TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis1TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear1TBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear1TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear1TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear1TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear1TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear1TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear1TBox</strong> (#HcpcLengthOfNeedYear1TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear1TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear1TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcLengthOfNeedYear1TBox EQ "@@">
				<cfset arguments.hcpcLengthOfNeedYear1TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear1TBox = arguments.HcpcLengthOfNeedYear1TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear1TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth1TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth1TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth1TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth1TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth1TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth1TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth1TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth1TBox</strong> (#HcpcLengthOfNeedMonth1TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth1TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth1TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcLengthOfNeedMonth1TBox EQ "@@">
				<cfset arguments.hcpcLengthOfNeedMonth1TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth1TBox = arguments.HcpcLengthOfNeedMonth1TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth1TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode2TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode2TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode2TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode2TBox" required="Yes" type="String">
		
		<cfif HcpcCode2TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcCode2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode2TBox</strong> (#HcpcCode2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode2TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode2TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcCode2TBox EQ "@@">
				<cfset arguments.hcpcCode2TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcCode2TBox = arguments.HcpcCode2TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode2TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty2TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty2TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty2TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty2TBox" required="Yes" type="String">
		
		<cfif HcpcQty2TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcQty2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty2TBox</strong> (#HcpcQty2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty2TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty2TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcQty2TBox EQ "@@">
				<cfset arguments.hcpcQty2TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcQty2TBox = arguments.HcpcQty2TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty2TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct2TBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct2TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct2TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct2TBox" required="Yes" type="String">
		
		<cfif HcpcProduct2TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcProduct2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct2TBox</strong> (#HcpcProduct2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct2TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct2TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcProduct2TBox EQ "@@">
				<cfset arguments.hcpcProduct2TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct2TBox = arguments.HcpcProduct2TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct2TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX2TBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX2TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX2TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX2TBox" required="Yes" type="String">
		
		<cfif HcpcDX2TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcDX2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX2TBox</strong> (#HcpcDX2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX2TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX2TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
			<cfif arguments.hcpcDX2TBox EQ "@@">
				<cfset arguments.hcpcDX2TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcDX2TBox = arguments.HcpcDX2TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX2TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis2TBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis2TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis2TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis2TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis2TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcDiagnosis2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis2TBox</strong> (#HcpcDiagnosis2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis2TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis2TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcDiagnosis2TBox EQ "@@">
				<cfset arguments.hcpcDiagnosis2TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis2TBox = arguments.HcpcDiagnosis2TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis2TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear2TBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear2TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear2TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear2TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear2TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear2TBox</strong> (#HcpcLengthOfNeedYear2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear2TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear2TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcLengthOfNeedYear2TBox EQ "@@">
				<cfset arguments.hcpcLengthOfNeedYear2TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear2TBox = arguments.HcpcLengthOfNeedYear2TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear2TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth2TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth2TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth2TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth2TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth2TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth2TBox</strong> (#HcpcLengthOfNeedMonth2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth2TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth2TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcLengthOfNeedMonth2TBox EQ "@@">
				<cfset arguments.hcpcLengthOfNeedMonth2TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth2TBox = arguments.HcpcLengthOfNeedMonth2TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth2TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode3TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode3TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode3TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode3TBox" required="Yes" type="String">
		
		<cfif HcpcCode3TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcCode3TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode3TBox</strong> (#HcpcCode3TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode3TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode3TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcCode3TBox EQ "@@">
				<cfset arguments.hcpcCode3TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcCode3TBox = arguments.HcpcCode3TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode3TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty3TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty3TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty3TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty3TBox" required="Yes" type="String">
		
		<cfif HcpcQty3TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcQty3TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty3TBox</strong> (#HcpcQty3TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty3TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty3TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcQty3TBox EQ "@@">
				<cfset arguments.hcpcQty3TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcQty3TBox = arguments.HcpcQty3TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty3TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct3TBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct3TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct3TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct3TBox" required="Yes" type="String">
		
		<cfif HcpcProduct3TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcProduct3TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct3TBox</strong> (#HcpcProduct3TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct3TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct3TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcProduct3TBox EQ "@@">
				<cfset arguments.hcpcProduct3TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct3TBox = arguments.HcpcProduct3TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct3TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX3TBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX3TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX3TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX3TBox" required="Yes" type="String">
		
		<cfif HcpcDX3TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcDX3TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX3TBox</strong> (#HcpcDX3TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX3TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX3TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
			<cfif arguments.hcpcDX3TBox EQ "@@">
				<cfset arguments.hcpcDX3TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcDX3TBox = arguments.HcpcDX3TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX3TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis3TBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis3TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis3TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis3TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis3TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcDiagnosis3TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis3TBox</strong> (#HcpcDiagnosis3TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis3TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis3TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcDiagnosis3TBox EQ "@@">
				<cfset arguments.hcpcDiagnosis3TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis3TBox = arguments.HcpcDiagnosis3TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis3TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear3TBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear3TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear3TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear3TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear3TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear3TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear3TBox</strong> (#HcpcLengthOfNeedYear3TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear3TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear3TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcLengthOfNeedYear3TBox EQ "@@">
				<cfset arguments.hcpcLengthOfNeedYear3TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear3TBox = arguments.HcpcLengthOfNeedYear3TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear3TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth3TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth3TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth3TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth3TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth3TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth3TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth3TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth3TBox</strong> (#HcpcLengthOfNeedMonth3TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth3TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth3TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcLengthOfNeedMonth3TBox EQ "@@">
				<cfset arguments.hcpcLengthOfNeedMonth3TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth3TBox = arguments.HcpcLengthOfNeedMonth3TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth3TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode4TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode4TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode4TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode4TBox" required="Yes" type="String">
		
		<cfif HcpcCode4TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcCode4TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode4TBox</strong> (#HcpcCode4TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode4TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode4TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcCode4TBox EQ "@@">
				<cfset arguments.hcpcCode4TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcCode4TBox = arguments.HcpcCode4TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode4TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty4TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty4TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty4TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty4TBox" required="Yes" type="String">
		
		<cfif HcpcQty4TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcQty4TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty4TBox</strong> (#HcpcQty4TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty4TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty4TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcQty4TBox EQ "@@">
				<cfset arguments.hcpcQty4TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcQty4TBox = arguments.HcpcQty4TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty4TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct4TBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct4TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct4TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct4TBox" required="Yes" type="String">
		
		<cfif HcpcProduct4TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcProduct4TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct4TBox</strong> (#HcpcProduct4TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct4TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct4TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcProduct4TBox EQ "@@">
				<cfset arguments.hcpcProduct4TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct4TBox = arguments.HcpcProduct4TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct4TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX4TBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX4TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX4TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX4TBox" required="Yes" type="String">
		
		<cfif HcpcDX4TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcDX4TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX4TBox</strong> (#HcpcDX4TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX4TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX4TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
			<cfif arguments.hcpcDX4TBox EQ "@@">
				<cfset arguments.hcpcDX4TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcDX4TBox = arguments.HcpcDX4TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX4TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis4TBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis4TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis4TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis4TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis4TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcDiagnosis4TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis4TBox</strong> (#HcpcDiagnosis4TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis4TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis4TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcDiagnosis4TBox EQ "@@">
				<cfset arguments.hcpcDiagnosis4TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis4TBox = arguments.HcpcDiagnosis4TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis4TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear4TBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear4TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear4TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear4TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear4TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear4TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear4TBox</strong> (#HcpcLengthOfNeedYear4TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear4TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear4TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcLengthOfNeedYear4TBox EQ "@@">
				<cfset arguments.hcpcLengthOfNeedYear4TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear4TBox = arguments.HcpcLengthOfNeedYear4TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear4TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth4TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth4TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth4TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth4TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth4TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth4TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth4TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth4TBox</strong> (#HcpcLengthOfNeedMonth4TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth4TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth4TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcLengthOfNeedMonth4TBox EQ "@@">
				<cfset arguments.hcpcLengthOfNeedMonth4TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth4TBox = arguments.HcpcLengthOfNeedMonth4TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth4TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode5TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode5TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode5TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode5TBox" required="Yes" type="String">
		
		<cfif HcpcCode5TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcCode5TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode5TBox</strong> (#HcpcCode5TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode5TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode5TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcCode5TBox EQ "@@">
				<cfset arguments.hcpcCode5TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcCode5TBox = arguments.HcpcCode5TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode5TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty5TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty5TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty5TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty5TBox" required="Yes" type="String">
		
		<cfif HcpcQty5TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcQty5TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty5TBox</strong> (#HcpcQty5TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty5TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty5TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcQty5TBox EQ "@@">
				<cfset arguments.hcpcQty5TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcQty5TBox = arguments.HcpcQty5TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty5TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct5TBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct5TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct5TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct5TBox" required="Yes" type="String">
		
		<cfif HcpcProduct5TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcProduct5TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct5TBox</strong> (#HcpcProduct5TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct5TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct5TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcProduct5TBox EQ "@@">
				<cfset arguments.hcpcProduct5TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct5TBox = arguments.HcpcProduct5TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct5TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX5TBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX5TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX5TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX5TBox" required="Yes" type="String">
		
		<cfif HcpcDX5TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcDX5TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX5TBox</strong> (#HcpcDX5TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX5TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX5TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
			<cfif arguments.hcpcDX5TBox EQ "@@">
				<cfset arguments.hcpcDX5TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcDX5TBox = arguments.HcpcDX5TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX5TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis5TBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis5TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis5TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis5TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis5TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcDiagnosis5TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis5TBox</strong> (#HcpcDiagnosis5TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis5TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis5TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcDiagnosis5TBox EQ "@@">
				<cfset arguments.hcpcDiagnosis5TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis5TBox = arguments.HcpcDiagnosis5TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis5TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear5TBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear5TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear5TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear5TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear5TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear5TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear5TBox</strong> (#HcpcLengthOfNeedYear5TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear5TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear5TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcLengthOfNeedYear5TBox EQ "@@">
				<cfset arguments.hcpcLengthOfNeedYear5TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear5TBox = arguments.HcpcLengthOfNeedYear5TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear5TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth5TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth5TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth5TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth5TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth5TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth5TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth5TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth5TBox</strong> (#HcpcLengthOfNeedMonth5TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth5TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth5TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcLengthOfNeedMonth5TBox EQ "@@">
				<cfset arguments.hcpcLengthOfNeedMonth5TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth5TBox = arguments.HcpcLengthOfNeedMonth5TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth5TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode6TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode6TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode6TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode6TBox" required="Yes" type="String">
		
		<cfif HcpcCode6TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcCode6TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode6TBox</strong> (#HcpcCode6TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode6TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode6TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcCode6TBox EQ "@@">
				<cfset arguments.hcpcCode6TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcCode6TBox = arguments.HcpcCode6TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode6TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty6TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty6TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty6TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty6TBox" required="Yes" type="String">
		
		<cfif HcpcQty6TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcQty6TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty6TBox</strong> (#HcpcQty6TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty6TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty6TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcQty6TBox EQ "@@">
				<cfset arguments.hcpcQty6TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcQty6TBox = arguments.HcpcQty6TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty6TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct6TBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct6TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct6TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct6TBox" required="Yes" type="String">
		
		<cfif HcpcProduct6TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcProduct6TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct6TBox</strong> (#HcpcProduct6TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct6TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct6TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcProduct6TBox EQ "@@">
				<cfset arguments.hcpcProduct6TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct6TBox = arguments.HcpcProduct6TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct6TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX6TBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX6TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX6TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX6TBox" required="Yes" type="String">
		
		<cfif HcpcDX6TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcDX6TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX6TBox</strong> (#HcpcDX6TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX6TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX6TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
			<cfif arguments.hcpcDX6TBox EQ "@@">
				<cfset arguments.hcpcDX6TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcDX6TBox = arguments.HcpcDX6TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX6TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis6TBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis6TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis6TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis6TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis6TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcDiagnosis6TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis6TBox</strong> (#HcpcDiagnosis6TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis6TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis6TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcDiagnosis6TBox EQ "@@">
				<cfset arguments.hcpcDiagnosis6TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis6TBox = arguments.HcpcDiagnosis6TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis6TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear6TBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear6TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear6TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear6TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear6TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear6TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear6TBox</strong> (#HcpcLengthOfNeedYear6TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear6TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear6TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcLengthOfNeedYear6TBox EQ "@@">
				<cfset arguments.hcpcLengthOfNeedYear6TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear6TBox = arguments.HcpcLengthOfNeedYear6TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear6TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth6TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth6TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth6TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth6TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth6TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth6TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth6TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth6TBox</strong> (#HcpcLengthOfNeedMonth6TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth6TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth6TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcLengthOfNeedMonth6TBox EQ "@@">
				<cfset arguments.hcpcLengthOfNeedMonth6TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth6TBox = arguments.HcpcLengthOfNeedMonth6TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth6TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode7TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode7TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode7TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode7TBox" required="Yes" type="String">
		
		<cfif HcpcCode7TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcCode7TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode7TBox</strong> (#HcpcCode7TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode7TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode7TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcCode7TBox EQ "@@">
				<cfset arguments.hcpcCode7TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcCode7TBox = arguments.HcpcCode7TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode7TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty7TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty7TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty7TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty7TBox" required="Yes" type="String">
		
		<cfif HcpcQty7TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcQty7TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty7TBox</strong> (#HcpcQty7TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty7TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty7TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcQty7TBox EQ "@@">
				<cfset arguments.hcpcQty7TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcQty7TBox = arguments.HcpcQty7TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty7TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct7TBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct7TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct7TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct7TBox" required="Yes" type="String">
		
		<cfif HcpcProduct7TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcProduct7TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct7TBox</strong> (#HcpcProduct7TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct7TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct7TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcProduct7TBox EQ "@@">
				<cfset arguments.hcpcProduct7TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct7TBox = arguments.HcpcProduct7TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct7TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX7TBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX7TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX7TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX7TBox" required="Yes" type="String">
		
		<cfif HcpcDX7TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcDX7TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX7TBox</strong> (#HcpcDX7TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX7TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX7TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
			<cfif arguments.hcpcDX7TBox EQ "@@">
				<cfset arguments.hcpcDX7TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcDX7TBox = arguments.HcpcDX7TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX7TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis7TBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis7TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis7TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis7TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis7TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcDiagnosis7TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis7TBox</strong> (#HcpcDiagnosis7TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis7TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis7TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcDiagnosis7TBox EQ "@@">
				<cfset arguments.hcpcDiagnosis7TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis7TBox = arguments.HcpcDiagnosis7TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis7TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear7TBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear7TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear7TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear7TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear7TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear7TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear7TBox</strong> (#HcpcLengthOfNeedYear7TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear7TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear7TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcLengthOfNeedYear7TBox EQ "@@">
				<cfset arguments.hcpcLengthOfNeedYear7TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear7TBox = arguments.HcpcLengthOfNeedYear7TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear7TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth7TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth7TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth7TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth7TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth7TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth7TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth7TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth7TBox</strong> (#HcpcLengthOfNeedMonth7TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth7TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth7TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcLengthOfNeedMonth7TBox EQ "@@">
				<cfset arguments.hcpcLengthOfNeedMonth7TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth7TBox = arguments.HcpcLengthOfNeedMonth7TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth7TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode8TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode8TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode8TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode8TBox" required="Yes" type="String">
		
		<cfif HcpcCode8TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcCode8TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode8TBox</strong> (#HcpcCode8TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode8TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode8TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcCode8TBox EQ "@@">
				<cfset arguments.hcpcCode8TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcCode8TBox = arguments.HcpcCode8TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode8TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty8TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty8TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty8TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty8TBox" required="Yes" type="String">
		
		<cfif HcpcQty8TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcQty8TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty8TBox</strong> (#HcpcQty8TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty8TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty8TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcQty8TBox EQ "@@">
				<cfset arguments.hcpcQty8TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcQty8TBox = arguments.HcpcQty8TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty8TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct8TBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct8TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct8TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct8TBox" required="Yes" type="String">
		
		<cfif HcpcProduct8TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcProduct8TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct8TBox</strong> (#HcpcProduct8TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct8TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct8TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcProduct8TBox EQ "@@">
				<cfset arguments.hcpcProduct8TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct8TBox = arguments.HcpcProduct8TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct8TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX8TBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX8TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX8TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX8TBox" required="Yes" type="String">
		
		<cfif HcpcDX8TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcDX8TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX8TBox</strong> (#HcpcDX8TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX8TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX8TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
			<cfif arguments.hcpcDX8TBox EQ "@@">
				<cfset arguments.hcpcDX8TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcDX8TBox = arguments.HcpcDX8TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX8TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis8TBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis8TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis8TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis8TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis8TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcDiagnosis8TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis8TBox</strong> (#HcpcDiagnosis8TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis8TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis8TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcDiagnosis8TBox EQ "@@">
				<cfset arguments.hcpcDiagnosis8TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis8TBox = arguments.HcpcDiagnosis8TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis8TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear8TBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear8TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear8TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear8TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear8TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear8TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear8TBox</strong> (#HcpcLengthOfNeedYear8TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear8TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear8TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcLengthOfNeedYear8TBox EQ "@@">
				<cfset arguments.hcpcLengthOfNeedYear8TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear8TBox = arguments.HcpcLengthOfNeedYear8TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear8TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth8TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth8TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth8TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth8TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth8TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth8TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth8TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth8TBox</strong> (#HcpcLengthOfNeedMonth8TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth8TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth8TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcLengthOfNeedMonth8TBox EQ "@@">
				<cfset arguments.hcpcLengthOfNeedMonth8TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth8TBox = arguments.HcpcLengthOfNeedMonth8TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth8TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode9TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode9TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode9TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode9TBox" required="Yes" type="String">
		
		<cfif HcpcCode9TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcCode9TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode9TBox</strong> (#HcpcCode9TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode9TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode9TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcCode9TBox EQ "@@">
				<cfset arguments.hcpcCode9TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcCode9TBox = arguments.HcpcCode9TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode9TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty9TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty9TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty9TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty9TBox" required="Yes" type="String">
		
		<cfif HcpcQty9TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcQty9TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty9TBox</strong> (#HcpcQty9TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty9TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty9TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcQty9TBox EQ "@@">
				<cfset arguments.hcpcQty9TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcQty9TBox = arguments.HcpcQty9TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty9TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct9TBox.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct9TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct9TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct9TBox" required="Yes" type="String">
		
		<cfif HcpcProduct9TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcProduct9TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct9TBox</strong> (#HcpcProduct9TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct9TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct9TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcProduct9TBox EQ "@@">
				<cfset arguments.hcpcProduct9TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct9TBox = arguments.HcpcProduct9TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct9TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX9TBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX9TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX9TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX9TBox" required="Yes" type="String">
		
		<cfif HcpcDX9TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcDX9TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX9TBox</strong> (#HcpcDX9TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX9TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX9TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
			<cfif arguments.hcpcDX9TBox EQ "@@">
				<cfset arguments.hcpcDX9TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcDX9TBox = arguments.HcpcDX9TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX9TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis9TBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis9TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis9TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis9TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis9TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcDiagnosis9TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis9TBox</strong> (#HcpcDiagnosis9TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis9TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis9TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcDiagnosis9TBox EQ "@@">
				<cfset arguments.hcpcDiagnosis9TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis9TBox = arguments.HcpcDiagnosis9TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis9TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear9TBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear9TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear9TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear9TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear9TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear9TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear9TBox</strong> (#HcpcLengthOfNeedYear9TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear9TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear9TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcLengthOfNeedYear9TBox EQ "@@">
				<cfset arguments.hcpcLengthOfNeedYear9TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear9TBox = arguments.HcpcLengthOfNeedYear9TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear9TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth9TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth9TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth9TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth9TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth9TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth9TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth9TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth9TBox</strong> (#HcpcLengthOfNeedMonth9TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth9TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth9TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcLengthOfNeedMonth9TBox EQ "@@">
				<cfset arguments.hcpcLengthOfNeedMonth9TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth9TBox = arguments.HcpcLengthOfNeedMonth9TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth9TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcCode10TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcCode10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcCode10TBox>
	</cffunction>
	 
	<cffunction name="setHcpcCode10TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcCode10TBox" required="Yes" type="String">
		
		<cfif HcpcCode10TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcCode10TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcCode10TBox</strong> (#HcpcCode10TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcCode10TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcCode10TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcCode10TBox EQ "@@">
				<cfset arguments.hcpcCode10TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcCode10TBox = arguments.HcpcCode10TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcCode10TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcQty10TBox.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcQty10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcQty10TBox>
	</cffunction>
	 
	<cffunction name="setHcpcQty10TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcQty10TBox" required="Yes" type="String">
		
		<cfif HcpcQty10TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcQty10TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcQty10TBox</strong> (#HcpcQty10TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcQty10TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcQty10TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcQty10TBox EQ "@@">
				<cfset arguments.hcpcQty10TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcQty10TBox = arguments.HcpcQty10TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcQty10TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcProduct10TBox.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcProduct10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcProduct10TBox>
	</cffunction>
	 
	<cffunction name="setHcpcProduct10TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcProduct10TBox" required="Yes" type="String">
		
		<cfif HcpcProduct10TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcProduct10TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcProduct10TBox</strong> (#HcpcProduct10TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcProduct10TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcProduct10TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcProduct10TBox EQ "@@">
				<cfset arguments.hcpcProduct10TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcProduct10TBox = arguments.HcpcProduct10TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcProduct10TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDX10TBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDX10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDX10TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDX10TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDX10TBox" required="Yes" type="String">
		
		<cfif HcpcDX10TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcDX10TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDX10TBox</strong> (#HcpcDX10TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDX10TBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDX10TBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
			<cfif arguments.hcpcDX10TBox EQ "@@">
				<cfset arguments.hcpcDX10TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcDX10TBox = arguments.HcpcDX10TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDX10TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcDiagnosis10TBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcDiagnosis10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcDiagnosis10TBox>
	</cffunction>
	 
	<cffunction name="setHcpcDiagnosis10TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcDiagnosis10TBox" required="Yes" type="String">
		
		<cfif HcpcDiagnosis10TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcDiagnosis10TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcDiagnosis10TBox</strong> (#HcpcDiagnosis10TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcDiagnosis10TBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcDiagnosis10TBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.hcpcDiagnosis10TBox EQ "@@">
				<cfset arguments.hcpcDiagnosis10TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcDiagnosis10TBox = arguments.HcpcDiagnosis10TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcDiagnosis10TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedYear10TBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedYear10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedYear10TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedYear10TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedYear10TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedYear10TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedYear10TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedYear10TBox</strong> (#HcpcLengthOfNeedYear10TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedYear10TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedYear10TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcLengthOfNeedYear10TBox EQ "@@">
				<cfset arguments.hcpcLengthOfNeedYear10TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedYear10TBox = arguments.HcpcLengthOfNeedYear10TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedYear10TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hcpcLengthOfNeedMonth10TBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHcpcLengthOfNeedMonth10TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.HcpcLengthOfNeedMonth10TBox>
	</cffunction>
	 
	<cffunction name="setHcpcLengthOfNeedMonth10TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="HcpcLengthOfNeedMonth10TBox" required="Yes" type="String">
		
		<cfif HcpcLengthOfNeedMonth10TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(HcpcLengthOfNeedMonth10TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HcpcLengthOfNeedMonth10TBox</strong> (#HcpcLengthOfNeedMonth10TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hcpcLengthOfNeedMonth10TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HcpcLengthOfNeedMonth10TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.hcpcLengthOfNeedMonth10TBox EQ "@@">
				<cfset arguments.hcpcLengthOfNeedMonth10TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.HcpcLengthOfNeedMonth10TBox = arguments.HcpcLengthOfNeedMonth10TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "HcpcLengthOfNeedMonth10TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for primaryInsuranceNameTBox.                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPrimaryInsuranceNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PrimaryInsuranceNameTBox>
	</cffunction>
	 
	<cffunction name="setPrimaryInsuranceNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PrimaryInsuranceNameTBox" required="Yes" type="String">
		
		<cfif PrimaryInsuranceNameTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PrimaryInsuranceNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PrimaryInsuranceNameTBox</strong> (#PrimaryInsuranceNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(primaryInsuranceNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PrimaryInsuranceNameTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.primaryInsuranceNameTBox EQ "@@">
				<cfset arguments.primaryInsuranceNameTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PrimaryInsuranceNameTBox = arguments.PrimaryInsuranceNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PrimaryInsuranceNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for secondaryInsuranceNameTBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSecondaryInsuranceNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SecondaryInsuranceNameTBox>
	</cffunction>
	 
	<cffunction name="setSecondaryInsuranceNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SecondaryInsuranceNameTBox" required="Yes" type="String">
		
		<cfif SecondaryInsuranceNameTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(SecondaryInsuranceNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SecondaryInsuranceNameTBox</strong> (#SecondaryInsuranceNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(secondaryInsuranceNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SecondaryInsuranceNameTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.secondaryInsuranceNameTBox EQ "@@">
				<cfset arguments.secondaryInsuranceNameTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.SecondaryInsuranceNameTBox = arguments.SecondaryInsuranceNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SecondaryInsuranceNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for primaryPolicyNumberTBox.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPrimaryPolicyNumberTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PrimaryPolicyNumberTBox>
	</cffunction>
	 
	<cffunction name="setPrimaryPolicyNumberTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PrimaryPolicyNumberTBox" required="Yes" type="String">
		
		<cfif PrimaryPolicyNumberTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PrimaryPolicyNumberTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PrimaryPolicyNumberTBox</strong> (#PrimaryPolicyNumberTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(primaryPolicyNumberTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PrimaryPolicyNumberTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.primaryPolicyNumberTBox EQ "@@">
				<cfset arguments.primaryPolicyNumberTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PrimaryPolicyNumberTBox = arguments.PrimaryPolicyNumberTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PrimaryPolicyNumberTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for secondaryPolicyNumberTBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSecondaryPolicyNumberTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SecondaryPolicyNumberTBox>
	</cffunction>
	 
	<cffunction name="setSecondaryPolicyNumberTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SecondaryPolicyNumberTBox" required="Yes" type="String">
		
		<cfif SecondaryPolicyNumberTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(SecondaryPolicyNumberTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SecondaryPolicyNumberTBox</strong> (#SecondaryPolicyNumberTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(secondaryPolicyNumberTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SecondaryPolicyNumberTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.secondaryPolicyNumberTBox EQ "@@">
				<cfset arguments.secondaryPolicyNumberTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.SecondaryPolicyNumberTBox = arguments.SecondaryPolicyNumberTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SecondaryPolicyNumberTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for primaryGroupNumberTBox.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPrimaryGroupNumberTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PrimaryGroupNumberTBox>
	</cffunction>
	 
	<cffunction name="setPrimaryGroupNumberTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PrimaryGroupNumberTBox" required="Yes" type="String">
		
		<cfif PrimaryGroupNumberTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PrimaryGroupNumberTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PrimaryGroupNumberTBox</strong> (#PrimaryGroupNumberTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(primaryGroupNumberTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PrimaryGroupNumberTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.primaryGroupNumberTBox EQ "@@">
				<cfset arguments.primaryGroupNumberTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PrimaryGroupNumberTBox = arguments.PrimaryGroupNumberTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PrimaryGroupNumberTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for secondaryGroupNumberTBox.                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSecondaryGroupNumberTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SecondaryGroupNumberTBox>
	</cffunction>
	 
	<cffunction name="setSecondaryGroupNumberTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SecondaryGroupNumberTBox" required="Yes" type="String">
		
		<cfif SecondaryGroupNumberTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(SecondaryGroupNumberTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SecondaryGroupNumberTBox</strong> (#SecondaryGroupNumberTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(secondaryGroupNumberTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SecondaryGroupNumberTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.secondaryGroupNumberTBox EQ "@@">
				<cfset arguments.secondaryGroupNumberTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.SecondaryGroupNumberTBox = arguments.SecondaryGroupNumberTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SecondaryGroupNumberTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for primaryPhoneNumberTBox.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPrimaryPhoneNumberTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PrimaryPhoneNumberTBox>
	</cffunction>
	 
	<cffunction name="setPrimaryPhoneNumberTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PrimaryPhoneNumberTBox" required="Yes" type="String">
		
		<cfif PrimaryPhoneNumberTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PrimaryPhoneNumberTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PrimaryPhoneNumberTBox</strong> (#PrimaryPhoneNumberTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(primaryPhoneNumberTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PrimaryPhoneNumberTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
			<cfif arguments.primaryPhoneNumberTBox EQ "@@">
				<cfset arguments.primaryPhoneNumberTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PrimaryPhoneNumberTBox = arguments.PrimaryPhoneNumberTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PrimaryPhoneNumberTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for secondaryPhoneNumberTBox.                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSecondaryPhoneNumberTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SecondaryPhoneNumberTBox>
	</cffunction>
	 
	<cffunction name="setSecondaryPhoneNumberTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SecondaryPhoneNumberTBox" required="Yes" type="String">
		
		<cfif SecondaryPhoneNumberTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(SecondaryPhoneNumberTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SecondaryPhoneNumberTBox</strong> (#SecondaryPhoneNumberTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(secondaryPhoneNumberTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SecondaryPhoneNumberTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
			<cfif arguments.secondaryPhoneNumberTBox EQ "@@">
				<cfset arguments.secondaryPhoneNumberTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.SecondaryPhoneNumberTBox = arguments.SecondaryPhoneNumberTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SecondaryPhoneNumberTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for priEffectiveDateMM.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPriEffectiveDateMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PriEffectiveDateMM>
	</cffunction>
	 
	<cffunction name="setPriEffectiveDateMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PriEffectiveDateMM" required="Yes" type="String">
		
		<cfif PriEffectiveDateMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PriEffectiveDateMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PriEffectiveDateMM</strong> (#PriEffectiveDateMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(priEffectiveDateMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PriEffectiveDateMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.priEffectiveDateMM EQ "@@">
				<cfset arguments.priEffectiveDateMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PriEffectiveDateMM = arguments.PriEffectiveDateMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PriEffectiveDateMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for priEffectiveDateDD.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPriEffectiveDateDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PriEffectiveDateDD>
	</cffunction>
	 
	<cffunction name="setPriEffectiveDateDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PriEffectiveDateDD" required="Yes" type="String">
		
		<cfif PriEffectiveDateDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PriEffectiveDateDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PriEffectiveDateDD</strong> (#PriEffectiveDateDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(priEffectiveDateDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PriEffectiveDateDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.priEffectiveDateDD EQ "@@">
				<cfset arguments.priEffectiveDateDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PriEffectiveDateDD = arguments.PriEffectiveDateDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PriEffectiveDateDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for priEffectiveDateYY.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPriEffectiveDateYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PriEffectiveDateYY>
	</cffunction>
	 
	<cffunction name="setPriEffectiveDateYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PriEffectiveDateYY" required="Yes" type="String">
		
		<cfif PriEffectiveDateYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PriEffectiveDateYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PriEffectiveDateYY</strong> (#PriEffectiveDateYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(priEffectiveDateYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PriEffectiveDateYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.priEffectiveDateYY EQ "@@">
				<cfset arguments.priEffectiveDateYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PriEffectiveDateYY = arguments.PriEffectiveDateYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PriEffectiveDateYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for secEffectiveDateMM.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSecEffectiveDateMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SecEffectiveDateMM>
	</cffunction>
	 
	<cffunction name="setSecEffectiveDateMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SecEffectiveDateMM" required="Yes" type="String">
		
		<cfif SecEffectiveDateMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(SecEffectiveDateMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SecEffectiveDateMM</strong> (#SecEffectiveDateMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(secEffectiveDateMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SecEffectiveDateMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.secEffectiveDateMM EQ "@@">
				<cfset arguments.secEffectiveDateMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.SecEffectiveDateMM = arguments.SecEffectiveDateMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SecEffectiveDateMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for secEffectiveDateDD.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSecEffectiveDateDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SecEffectiveDateDD>
	</cffunction>
	 
	<cffunction name="setSecEffectiveDateDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SecEffectiveDateDD" required="Yes" type="String">
		
		<cfif SecEffectiveDateDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(SecEffectiveDateDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SecEffectiveDateDD</strong> (#SecEffectiveDateDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(secEffectiveDateDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SecEffectiveDateDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.secEffectiveDateDD EQ "@@">
				<cfset arguments.secEffectiveDateDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.SecEffectiveDateDD = arguments.SecEffectiveDateDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SecEffectiveDateDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for secEffectiveDateYY.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSecEffectiveDateYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SecEffectiveDateYY>
	</cffunction>
	 
	<cffunction name="setSecEffectiveDateYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SecEffectiveDateYY" required="Yes" type="String">
		
		<cfif SecEffectiveDateYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(SecEffectiveDateYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SecEffectiveDateYY</strong> (#SecEffectiveDateYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(secEffectiveDateYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SecEffectiveDateYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.secEffectiveDateYY EQ "@@">
				<cfset arguments.secEffectiveDateYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.SecEffectiveDateYY = arguments.SecEffectiveDateYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SecEffectiveDateYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for priPolicyHolderNameTBox.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPriPolicyHolderNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PriPolicyHolderNameTBox>
	</cffunction>
	 
	<cffunction name="setPriPolicyHolderNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PriPolicyHolderNameTBox" required="Yes" type="String">
		
		<cfif PriPolicyHolderNameTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PriPolicyHolderNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PriPolicyHolderNameTBox</strong> (#PriPolicyHolderNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(priPolicyHolderNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PriPolicyHolderNameTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.priPolicyHolderNameTBox EQ "@@">
				<cfset arguments.priPolicyHolderNameTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PriPolicyHolderNameTBox = arguments.PriPolicyHolderNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PriPolicyHolderNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for secPolicyHolderNameTBox.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSecPolicyHolderNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SecPolicyHolderNameTBox>
	</cffunction>
	 
	<cffunction name="setSecPolicyHolderNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SecPolicyHolderNameTBox" required="Yes" type="String">
		
		<cfif SecPolicyHolderNameTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(SecPolicyHolderNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SecPolicyHolderNameTBox</strong> (#SecPolicyHolderNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(secPolicyHolderNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SecPolicyHolderNameTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.secPolicyHolderNameTBox EQ "@@">
				<cfset arguments.secPolicyHolderNameTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.SecPolicyHolderNameTBox = arguments.SecPolicyHolderNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SecPolicyHolderNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for priHoldersDOBMM.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPriHoldersDOBMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PriHoldersDOBMM>
	</cffunction>
	 
	<cffunction name="setPriHoldersDOBMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PriHoldersDOBMM" required="Yes" type="String">
		
		<cfif PriHoldersDOBMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PriHoldersDOBMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PriHoldersDOBMM</strong> (#PriHoldersDOBMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(priHoldersDOBMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PriHoldersDOBMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.priHoldersDOBMM EQ "@@">
				<cfset arguments.priHoldersDOBMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PriHoldersDOBMM = arguments.PriHoldersDOBMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PriHoldersDOBMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for priHoldersDOBDD.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPriHoldersDOBDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PriHoldersDOBDD>
	</cffunction>
	 
	<cffunction name="setPriHoldersDOBDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PriHoldersDOBDD" required="Yes" type="String">
		
		<cfif PriHoldersDOBDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PriHoldersDOBDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PriHoldersDOBDD</strong> (#PriHoldersDOBDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(priHoldersDOBDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PriHoldersDOBDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.priHoldersDOBDD EQ "@@">
				<cfset arguments.priHoldersDOBDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PriHoldersDOBDD = arguments.PriHoldersDOBDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PriHoldersDOBDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for priHoldersDOBYY.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPriHoldersDOBYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PriHoldersDOBYY>
	</cffunction>
	 
	<cffunction name="setPriHoldersDOBYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PriHoldersDOBYY" required="Yes" type="String">
		
		<cfif PriHoldersDOBYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PriHoldersDOBYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PriHoldersDOBYY</strong> (#PriHoldersDOBYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(priHoldersDOBYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PriHoldersDOBYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.priHoldersDOBYY EQ "@@">
				<cfset arguments.priHoldersDOBYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PriHoldersDOBYY = arguments.PriHoldersDOBYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PriHoldersDOBYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for secHoldersDOBMM.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSecHoldersDOBMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SecHoldersDOBMM>
	</cffunction>
	 
	<cffunction name="setSecHoldersDOBMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SecHoldersDOBMM" required="Yes" type="String">
		
		<cfif SecHoldersDOBMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(SecHoldersDOBMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SecHoldersDOBMM</strong> (#SecHoldersDOBMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(secHoldersDOBMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SecHoldersDOBMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.secHoldersDOBMM EQ "@@">
				<cfset arguments.secHoldersDOBMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.SecHoldersDOBMM = arguments.SecHoldersDOBMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SecHoldersDOBMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for secHoldersDOBDD.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSecHoldersDOBDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SecHoldersDOBDD>
	</cffunction>
	 
	<cffunction name="setSecHoldersDOBDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SecHoldersDOBDD" required="Yes" type="String">
		
		<cfif SecHoldersDOBDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(SecHoldersDOBDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SecHoldersDOBDD</strong> (#SecHoldersDOBDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(secHoldersDOBDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SecHoldersDOBDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.secHoldersDOBDD EQ "@@">
				<cfset arguments.secHoldersDOBDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.SecHoldersDOBDD = arguments.SecHoldersDOBDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SecHoldersDOBDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for secHoldersDOBYY.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSecHoldersDOBYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SecHoldersDOBYY>
	</cffunction>
	 
	<cffunction name="setSecHoldersDOBYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SecHoldersDOBYY" required="Yes" type="String">
		
		<cfif SecHoldersDOBYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(SecHoldersDOBYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SecHoldersDOBYY</strong> (#SecHoldersDOBYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(secHoldersDOBYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SecHoldersDOBYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.secHoldersDOBYY EQ "@@">
				<cfset arguments.secHoldersDOBYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.SecHoldersDOBYY = arguments.SecHoldersDOBYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SecHoldersDOBYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for priPolicyHolderEmployerTBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPriPolicyHolderEmployerTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PriPolicyHolderEmployerTBox>
	</cffunction>
	 
	<cffunction name="setPriPolicyHolderEmployerTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PriPolicyHolderEmployerTBox" required="Yes" type="String">
		
		<cfif PriPolicyHolderEmployerTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PriPolicyHolderEmployerTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PriPolicyHolderEmployerTBox</strong> (#PriPolicyHolderEmployerTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(priPolicyHolderEmployerTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PriPolicyHolderEmployerTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.priPolicyHolderEmployerTBox EQ "@@">
				<cfset arguments.priPolicyHolderEmployerTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PriPolicyHolderEmployerTBox = arguments.PriPolicyHolderEmployerTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PriPolicyHolderEmployerTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for secPolicyHolderEmployerTBox.                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSecPolicyHolderEmployerTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SecPolicyHolderEmployerTBox>
	</cffunction>
	 
	<cffunction name="setSecPolicyHolderEmployerTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SecPolicyHolderEmployerTBox" required="Yes" type="String">
		
		<cfif SecPolicyHolderEmployerTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(SecPolicyHolderEmployerTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SecPolicyHolderEmployerTBox</strong> (#SecPolicyHolderEmployerTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(secPolicyHolderEmployerTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SecPolicyHolderEmployerTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.secPolicyHolderEmployerTBox EQ "@@">
				<cfset arguments.secPolicyHolderEmployerTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.SecPolicyHolderEmployerTBox = arguments.SecPolicyHolderEmployerTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SecPolicyHolderEmployerTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for priNoteTBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPriNoteTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PriNoteTBox>
	</cffunction>
	 
	<cffunction name="setPriNoteTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PriNoteTBox" required="Yes" type="String">
		
		<cfif PriNoteTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PriNoteTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PriNoteTBox</strong> (#PriNoteTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(priNoteTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PriNoteTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.priNoteTBox EQ "@@">
				<cfset arguments.priNoteTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PriNoteTBox = arguments.PriNoteTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PriNoteTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for secNoteTBox.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSecNoteTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SecNoteTBox>
	</cffunction>
	 
	<cffunction name="setSecNoteTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SecNoteTBox" required="Yes" type="String">
		
		<cfif SecNoteTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(SecNoteTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SecNoteTBox</strong> (#SecNoteTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(secNoteTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SecNoteTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.secNoteTBox EQ "@@">
				<cfset arguments.secNoteTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.SecNoteTBox = arguments.SecNoteTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SecNoteTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for poNumberTBox.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPoNumberTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PoNumberTBox>
	</cffunction>
	 
	<cffunction name="setPoNumberTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PoNumberTBox" required="Yes" type="String">
		
		<cfif PoNumberTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(PoNumberTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PoNumberTBox</strong> (#PoNumberTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(poNumberTBox) GT 25>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PoNumberTBox</strong> cannot be greater than 25 character(s).">
			</cfif>
						
			<cfif arguments.poNumberTBox EQ "@@">
				<cfset arguments.poNumberTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.PoNumberTBox = arguments.PoNumberTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PoNumberTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for creditCardTypeTBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCreditCardTypeTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CreditCardTypeTBox>
	</cffunction>
	 
	<cffunction name="setCreditCardTypeTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CreditCardTypeTBox" required="Yes" type="String">
		
		<cfif CreditCardTypeTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(CreditCardTypeTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CreditCardTypeTBox</strong> (#CreditCardTypeTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(creditCardTypeTBox) GT 30>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CreditCardTypeTBox</strong> cannot be greater than 30 character(s).">
			</cfif>
						
			<cfif arguments.creditCardTypeTBox EQ "@@">
				<cfset arguments.creditCardTypeTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.CreditCardTypeTBox = arguments.CreditCardTypeTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CreditCardTypeTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for creditCardNumberTBox.                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCreditCardNumberTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CreditCardNumberTBox>
	</cffunction>
	 
	<cffunction name="setCreditCardNumberTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CreditCardNumberTBox" required="Yes" type="String">
		
		<cfif CreditCardNumberTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(CreditCardNumberTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CreditCardNumberTBox</strong> (#CreditCardNumberTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(creditCardNumberTBox) GT 22>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CreditCardNumberTBox</strong> cannot be greater than 22 character(s).">
			</cfif>
						
			<cfif arguments.creditCardNumberTBox EQ "@@">
				<cfset arguments.creditCardNumberTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.CreditCardNumberTBox = arguments.CreditCardNumberTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CreditCardNumberTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ccDateMM.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCcDateMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CcDateMM>
	</cffunction>
	 
	<cffunction name="setCcDateMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CcDateMM" required="Yes" type="String">
		
		<cfif CcDateMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(CcDateMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CcDateMM</strong> (#CcDateMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ccDateMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CcDateMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.ccDateMM EQ "@@">
				<cfset arguments.ccDateMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.CcDateMM = arguments.CcDateMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CcDateMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ccDateDD.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCcDateDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CcDateDD>
	</cffunction>
	 
	<cffunction name="setCcDateDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CcDateDD" required="Yes" type="String">
		
		<cfif CcDateDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(CcDateDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CcDateDD</strong> (#CcDateDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ccDateDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CcDateDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.ccDateDD EQ "@@">
				<cfset arguments.ccDateDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.CcDateDD = arguments.CcDateDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CcDateDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ccDateYY.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCcDateYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CcDateYY>
	</cffunction>
	 
	<cffunction name="setCcDateYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CcDateYY" required="Yes" type="String">
		
		<cfif CcDateYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(CcDateYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CcDateYY</strong> (#CcDateYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ccDateYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CcDateYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.ccDateYY EQ "@@">
				<cfset arguments.ccDateYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.CcDateYY = arguments.CcDateYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CcDateYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for orderingPhysicianNameTBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOrderingPhysicianNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianNameTBox>
	</cffunction>
	 
	<cffunction name="setOrderingPhysicianNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OrderingPhysicianNameTBox" required="Yes" type="String">
		
		<cfif OrderingPhysicianNameTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OrderingPhysicianNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianNameTBox</strong> (#OrderingPhysicianNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianNameTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.orderingPhysicianNameTBox EQ "@@">
				<cfset arguments.orderingPhysicianNameTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OrderingPhysicianNameTBox = arguments.OrderingPhysicianNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OrderingPhysicianNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for orderingPhysicianPhoneTBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOrderingPhysicianPhoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianPhoneTBox>
	</cffunction>
	 
	<cffunction name="setOrderingPhysicianPhoneTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OrderingPhysicianPhoneTBox" required="Yes" type="String">
		
		<cfif OrderingPhysicianPhoneTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OrderingPhysicianPhoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianPhoneTBox</strong> (#OrderingPhysicianPhoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianPhoneTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianPhoneTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
			<cfif arguments.orderingPhysicianPhoneTBox EQ "@@">
				<cfset arguments.orderingPhysicianPhoneTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OrderingPhysicianPhoneTBox = arguments.OrderingPhysicianPhoneTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OrderingPhysicianPhoneTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for orderingPhysicianUPINTBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOrderingPhysicianUPINTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianUPINTBox>
	</cffunction>
	 
	<cffunction name="setOrderingPhysicianUPINTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OrderingPhysicianUPINTBox" required="Yes" type="String">
		
		<cfif OrderingPhysicianUPINTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OrderingPhysicianUPINTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianUPINTBox</strong> (#OrderingPhysicianUPINTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianUPINTBox) GT 30>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianUPINTBox</strong> cannot be greater than 30 character(s).">
			</cfif>
						
			<cfif arguments.orderingPhysicianUPINTBox EQ "@@">
				<cfset arguments.orderingPhysicianUPINTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OrderingPhysicianUPINTBox = arguments.OrderingPhysicianUPINTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OrderingPhysicianUPINTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for orderingPhysicianFaxTBox.                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOrderingPhysicianFaxTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianFaxTBox>
	</cffunction>
	 
	<cffunction name="setOrderingPhysicianFaxTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OrderingPhysicianFaxTBox" required="Yes" type="String">
		
		<cfif OrderingPhysicianFaxTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OrderingPhysicianFaxTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianFaxTBox</strong> (#OrderingPhysicianFaxTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianFaxTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianFaxTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
			<cfif arguments.orderingPhysicianFaxTBox EQ "@@">
				<cfset arguments.orderingPhysicianFaxTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OrderingPhysicianFaxTBox = arguments.OrderingPhysicianFaxTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OrderingPhysicianFaxTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for orderingPhysicianAddressTBox.                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOrderingPhysicianAddressTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianAddressTBox>
	</cffunction>
	 
	<cffunction name="setOrderingPhysicianAddressTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OrderingPhysicianAddressTBox" required="Yes" type="String">
		
		<cfif OrderingPhysicianAddressTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OrderingPhysicianAddressTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianAddressTBox</strong> (#OrderingPhysicianAddressTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianAddressTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianAddressTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.orderingPhysicianAddressTBox EQ "@@">
				<cfset arguments.orderingPhysicianAddressTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OrderingPhysicianAddressTBox = arguments.OrderingPhysicianAddressTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OrderingPhysicianAddressTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for orderingPhysicianCityTBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOrderingPhysicianCityTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianCityTBox>
	</cffunction>
	 
	<cffunction name="setOrderingPhysicianCityTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OrderingPhysicianCityTBox" required="Yes" type="String">
		
		<cfif OrderingPhysicianCityTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OrderingPhysicianCityTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianCityTBox</strong> (#OrderingPhysicianCityTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianCityTBox) GT 30>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianCityTBox</strong> cannot be greater than 30 character(s).">
			</cfif>
						
			<cfif arguments.orderingPhysicianCityTBox EQ "@@">
				<cfset arguments.orderingPhysicianCityTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OrderingPhysicianCityTBox = arguments.OrderingPhysicianCityTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OrderingPhysicianCityTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for orderingPhysicianStateTBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOrderingPhysicianStateTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianStateTBox>
	</cffunction>
	 
	<cffunction name="setOrderingPhysicianStateTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OrderingPhysicianStateTBox" required="Yes" type="String">
		
		<cfif OrderingPhysicianStateTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OrderingPhysicianStateTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianStateTBox</strong> (#OrderingPhysicianStateTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianStateTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianStateTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
			<cfif arguments.orderingPhysicianStateTBox EQ "@@">
				<cfset arguments.orderingPhysicianStateTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OrderingPhysicianStateTBox = arguments.OrderingPhysicianStateTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OrderingPhysicianStateTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for orderingPhysicianZipTBox.                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOrderingPhysicianZipTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianZipTBox>
	</cffunction>
	 
	<cffunction name="setOrderingPhysicianZipTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OrderingPhysicianZipTBox" required="Yes" type="String">
		
		<cfif OrderingPhysicianZipTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OrderingPhysicianZipTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianZipTBox</strong> (#OrderingPhysicianZipTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianZipTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianZipTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
			<cfif arguments.orderingPhysicianZipTBox EQ "@@">
				<cfset arguments.orderingPhysicianZipTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OrderingPhysicianZipTBox = arguments.OrderingPhysicianZipTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OrderingPhysicianZipTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for verificationRepNameTBox.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationRepNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationRepNameTBox>
	</cffunction>
	 
	<cffunction name="setVerificationRepNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationRepNameTBox" required="Yes" type="String">
		
		<cfif VerificationRepNameTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(VerificationRepNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationRepNameTBox</strong> (#VerificationRepNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(verificationRepNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationRepNameTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.verificationRepNameTBox EQ "@@">
				<cfset arguments.verificationRepNameTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.VerificationRepNameTBox = arguments.VerificationRepNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationRepNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for verificationDateMM.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationDateMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationDateMM>
	</cffunction>
	 
	<cffunction name="setVerificationDateMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationDateMM" required="Yes" type="String">
		
		<cfif VerificationDateMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(VerificationDateMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationDateMM</strong> (#VerificationDateMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(verificationDateMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationDateMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.verificationDateMM EQ "@@">
				<cfset arguments.verificationDateMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.VerificationDateMM = arguments.VerificationDateMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationDateMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for verificationDateDD.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationDateDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationDateDD>
	</cffunction>
	 
	<cffunction name="setVerificationDateDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationDateDD" required="Yes" type="String">
		
		<cfif VerificationDateDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(VerificationDateDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationDateDD</strong> (#VerificationDateDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(verificationDateDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationDateDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.verificationDateDD EQ "@@">
				<cfset arguments.verificationDateDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.VerificationDateDD = arguments.VerificationDateDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationDateDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for verificationDateYY.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationDateYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationDateYY>
	</cffunction>
	 
	<cffunction name="setVerificationDateYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationDateYY" required="Yes" type="String">
		
		<cfif VerificationDateYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(VerificationDateYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationDateYY</strong> (#VerificationDateYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(verificationDateYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationDateYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.verificationDateYY EQ "@@">
				<cfset arguments.verificationDateYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.VerificationDateYY = arguments.VerificationDateYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationDateYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for verificationTimeTBox.                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationTimeTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationTimeTBox>
	</cffunction>
	 
	<cffunction name="setVerificationTimeTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationTimeTBox" required="Yes" type="String">
		
		<cfif VerificationTimeTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(VerificationTimeTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationTimeTBox</strong> (#VerificationTimeTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(verificationTimeTBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationTimeTBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.verificationTimeTBox EQ "@@">
				<cfset arguments.verificationTimeTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.VerificationTimeTBox = arguments.VerificationTimeTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationTimeTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_4_CBox_VerificationHaveInsYes.                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_4_CBox_VerificationHaveInsYes" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_4_CBox_VerificationHaveInsYes>
	</cffunction>
	 
	<cffunction name="setOPTION_4_CBox_VerificationHaveInsYes" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_4_CBox_VerificationHaveInsYes" required="Yes" type="String">
		
		<cfif OPTION_4_CBox_VerificationHaveInsYes NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_4_CBox_VerificationHaveInsYes)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_4_CBox_VerificationHaveInsYes</strong> (#OPTION_4_CBox_VerificationHaveInsYes#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_4_CBox_VerificationHaveInsYes) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_4_CBox_VerificationHaveInsYes</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_4_CBox_VerificationHaveInsYes EQ "@@">
				<cfset arguments.OPTION_4_CBox_VerificationHaveInsYes = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_4_CBox_VerificationHaveInsYes = arguments.OPTION_4_CBox_VerificationHaveInsYes>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_4_CBox_VerificationHaveInsYes")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_4_CBox_VerificationHaveInsNo.                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_4_CBox_VerificationHaveInsNo" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_4_CBox_VerificationHaveInsNo>
	</cffunction>
	 
	<cffunction name="setOPTION_4_CBox_VerificationHaveInsNo" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_4_CBox_VerificationHaveInsNo" required="Yes" type="String">
		
		<cfif OPTION_4_CBox_VerificationHaveInsNo NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_4_CBox_VerificationHaveInsNo)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_4_CBox_VerificationHaveInsNo</strong> (#OPTION_4_CBox_VerificationHaveInsNo#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_4_CBox_VerificationHaveInsNo) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_4_CBox_VerificationHaveInsNo</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_4_CBox_VerificationHaveInsNo EQ "@@">
				<cfset arguments.OPTION_4_CBox_VerificationHaveInsNo = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_4_CBox_VerificationHaveInsNo = arguments.OPTION_4_CBox_VerificationHaveInsNo>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_4_CBox_VerificationHaveInsNo")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for verificationHaveInsFromMM.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationHaveInsFromMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationHaveInsFromMM>
	</cffunction>
	 
	<cffunction name="setVerificationHaveInsFromMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationHaveInsFromMM" required="Yes" type="String">
		
		<cfif VerificationHaveInsFromMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(VerificationHaveInsFromMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationHaveInsFromMM</strong> (#VerificationHaveInsFromMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(verificationHaveInsFromMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationHaveInsFromMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.verificationHaveInsFromMM EQ "@@">
				<cfset arguments.verificationHaveInsFromMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.VerificationHaveInsFromMM = arguments.VerificationHaveInsFromMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationHaveInsFromMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for verificationHaveInsFromDD.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationHaveInsFromDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationHaveInsFromDD>
	</cffunction>
	 
	<cffunction name="setVerificationHaveInsFromDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationHaveInsFromDD" required="Yes" type="String">
		
		<cfif VerificationHaveInsFromDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(VerificationHaveInsFromDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationHaveInsFromDD</strong> (#VerificationHaveInsFromDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(verificationHaveInsFromDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationHaveInsFromDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.verificationHaveInsFromDD EQ "@@">
				<cfset arguments.verificationHaveInsFromDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.VerificationHaveInsFromDD = arguments.VerificationHaveInsFromDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationHaveInsFromDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for verificationHaveInsFromYY.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationHaveInsFromYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationHaveInsFromYY>
	</cffunction>
	 
	<cffunction name="setVerificationHaveInsFromYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationHaveInsFromYY" required="Yes" type="String">
		
		<cfif VerificationHaveInsFromYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(VerificationHaveInsFromYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationHaveInsFromYY</strong> (#VerificationHaveInsFromYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(verificationHaveInsFromYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationHaveInsFromYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.verificationHaveInsFromYY EQ "@@">
				<cfset arguments.verificationHaveInsFromYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.VerificationHaveInsFromYY = arguments.VerificationHaveInsFromYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationHaveInsFromYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for verificationHaveInsToMM.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationHaveInsToMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationHaveInsToMM>
	</cffunction>
	 
	<cffunction name="setVerificationHaveInsToMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationHaveInsToMM" required="Yes" type="String">
		
		<cfif VerificationHaveInsToMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(VerificationHaveInsToMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationHaveInsToMM</strong> (#VerificationHaveInsToMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(verificationHaveInsToMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationHaveInsToMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.verificationHaveInsToMM EQ "@@">
				<cfset arguments.verificationHaveInsToMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.VerificationHaveInsToMM = arguments.VerificationHaveInsToMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationHaveInsToMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for verificationHaveInsToDD.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationHaveInsToDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationHaveInsToDD>
	</cffunction>
	 
	<cffunction name="setVerificationHaveInsToDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationHaveInsToDD" required="Yes" type="String">
		
		<cfif VerificationHaveInsToDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(VerificationHaveInsToDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationHaveInsToDD</strong> (#VerificationHaveInsToDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(verificationHaveInsToDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationHaveInsToDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.verificationHaveInsToDD EQ "@@">
				<cfset arguments.verificationHaveInsToDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.VerificationHaveInsToDD = arguments.VerificationHaveInsToDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationHaveInsToDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for verificationHaveInsToYY.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationHaveInsToYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationHaveInsToYY>
	</cffunction>
	 
	<cffunction name="setVerificationHaveInsToYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationHaveInsToYY" required="Yes" type="String">
		
		<cfif VerificationHaveInsToYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(VerificationHaveInsToYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationHaveInsToYY</strong> (#VerificationHaveInsToYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(verificationHaveInsToYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationHaveInsToYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.verificationHaveInsToYY EQ "@@">
				<cfset arguments.verificationHaveInsToYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.VerificationHaveInsToYY = arguments.VerificationHaveInsToYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationHaveInsToYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_5_CBox_VerificationHaveDMECovYes.                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_5_CBox_VerificationHaveDMECovYes" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_5_CBox_VerificationHaveDMECovYes>
	</cffunction>
	 
	<cffunction name="setOPTION_5_CBox_VerificationHaveDMECovYes" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_5_CBox_VerificationHaveDMECovYes" required="Yes" type="String">
		
		<cfif OPTION_5_CBox_VerificationHaveDMECovYes NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_5_CBox_VerificationHaveDMECovYes)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_5_CBox_VerificationHaveDMECovYes</strong> (#OPTION_5_CBox_VerificationHaveDMECovYes#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_5_CBox_VerificationHaveDMECovYes) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_5_CBox_VerificationHaveDMECovYes</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_5_CBox_VerificationHaveDMECovYes EQ "@@">
				<cfset arguments.OPTION_5_CBox_VerificationHaveDMECovYes = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_5_CBox_VerificationHaveDMECovYes = arguments.OPTION_5_CBox_VerificationHaveDMECovYes>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_5_CBox_VerificationHaveDMECovYes")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_5_CBox_VerificationHaveDMECovNo.                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_5_CBox_VerificationHaveDMECovNo" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_5_CBox_VerificationHaveDMECovNo>
	</cffunction>
	 
	<cffunction name="setOPTION_5_CBox_VerificationHaveDMECovNo" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_5_CBox_VerificationHaveDMECovNo" required="Yes" type="String">
		
		<cfif OPTION_5_CBox_VerificationHaveDMECovNo NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_5_CBox_VerificationHaveDMECovNo)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_5_CBox_VerificationHaveDMECovNo</strong> (#OPTION_5_CBox_VerificationHaveDMECovNo#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_5_CBox_VerificationHaveDMECovNo) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_5_CBox_VerificationHaveDMECovNo</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_5_CBox_VerificationHaveDMECovNo EQ "@@">
				<cfset arguments.OPTION_5_CBox_VerificationHaveDMECovNo = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_5_CBox_VerificationHaveDMECovNo = arguments.OPTION_5_CBox_VerificationHaveDMECovNo>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_5_CBox_VerificationHaveDMECovNo")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_6_CBox_VerificationDeductibleYes.                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_6_CBox_VerificationDeductibleYes" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_6_CBox_VerificationDeductibleYes>
	</cffunction>
	 
	<cffunction name="setOPTION_6_CBox_VerificationDeductibleYes" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_6_CBox_VerificationDeductibleYes" required="Yes" type="String">
		
		<cfif OPTION_6_CBox_VerificationDeductibleYes NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_6_CBox_VerificationDeductibleYes)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_6_CBox_VerificationDeductibleYes</strong> (#OPTION_6_CBox_VerificationDeductibleYes#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_6_CBox_VerificationDeductibleYes) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_6_CBox_VerificationDeductibleYes</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_6_CBox_VerificationDeductibleYes EQ "@@">
				<cfset arguments.OPTION_6_CBox_VerificationDeductibleYes = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_6_CBox_VerificationDeductibleYes = arguments.OPTION_6_CBox_VerificationDeductibleYes>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_6_CBox_VerificationDeductibleYes")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_6_CBox_VerificationDeductibleNo.                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_6_CBox_VerificationDeductibleNo" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_6_CBox_VerificationDeductibleNo>
	</cffunction>
	 
	<cffunction name="setOPTION_6_CBox_VerificationDeductibleNo" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_6_CBox_VerificationDeductibleNo" required="Yes" type="String">
		
		<cfif OPTION_6_CBox_VerificationDeductibleNo NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_6_CBox_VerificationDeductibleNo)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_6_CBox_VerificationDeductibleNo</strong> (#OPTION_6_CBox_VerificationDeductibleNo#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_6_CBox_VerificationDeductibleNo) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_6_CBox_VerificationDeductibleNo</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_6_CBox_VerificationDeductibleNo EQ "@@">
				<cfset arguments.OPTION_6_CBox_VerificationDeductibleNo = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_6_CBox_VerificationDeductibleNo = arguments.OPTION_6_CBox_VerificationDeductibleNo>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_6_CBox_VerificationDeductibleNo")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_7_CBox_VerificationDeductibleMetYes.             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_7_CBox_VerificationDeductibleMetYes" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_7_CBox_VerificationDeductibleMetYes>
	</cffunction>
	 
	<cffunction name="setOPTION_7_CBox_VerificationDeductibleMetYes" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_7_CBox_VerificationDeductibleMetYes" required="Yes" type="String">
		
		<cfif OPTION_7_CBox_VerificationDeductibleMetYes NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_7_CBox_VerificationDeductibleMetYes)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_7_CBox_VerificationDeductibleMetYes</strong> (#OPTION_7_CBox_VerificationDeductibleMetYes#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_7_CBox_VerificationDeductibleMetYes) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_7_CBox_VerificationDeductibleMetYes</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_7_CBox_VerificationDeductibleMetYes EQ "@@">
				<cfset arguments.OPTION_7_CBox_VerificationDeductibleMetYes = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_7_CBox_VerificationDeductibleMetYes = arguments.OPTION_7_CBox_VerificationDeductibleMetYes>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_7_CBox_VerificationDeductibleMetYes")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_7_CBox_VerificationDeductibleMetNo.              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_7_CBox_VerificationDeductibleMetNo" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_7_CBox_VerificationDeductibleMetNo>
	</cffunction>
	 
	<cffunction name="setOPTION_7_CBox_VerificationDeductibleMetNo" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_7_CBox_VerificationDeductibleMetNo" required="Yes" type="String">
		
		<cfif OPTION_7_CBox_VerificationDeductibleMetNo NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_7_CBox_VerificationDeductibleMetNo)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_7_CBox_VerificationDeductibleMetNo</strong> (#OPTION_7_CBox_VerificationDeductibleMetNo#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_7_CBox_VerificationDeductibleMetNo) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_7_CBox_VerificationDeductibleMetNo</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_7_CBox_VerificationDeductibleMetNo EQ "@@">
				<cfset arguments.OPTION_7_CBox_VerificationDeductibleMetNo = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_7_CBox_VerificationDeductibleMetNo = arguments.OPTION_7_CBox_VerificationDeductibleMetNo>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_7_CBox_VerificationDeductibleMetNo")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for verificationDeductibleAmountTBox.                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationDeductibleAmountTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationDeductibleAmountTBox>
	</cffunction>
	 
	<cffunction name="setVerificationDeductibleAmountTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationDeductibleAmountTBox" required="Yes" type="String">
		
		<cfif VerificationDeductibleAmountTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(VerificationDeductibleAmountTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationDeductibleAmountTBox</strong> (#VerificationDeductibleAmountTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(verificationDeductibleAmountTBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationDeductibleAmountTBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.verificationDeductibleAmountTBox EQ "@@">
				<cfset arguments.verificationDeductibleAmountTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.VerificationDeductibleAmountTBox = arguments.VerificationDeductibleAmountTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationDeductibleAmountTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_8_CBox_VerificationPPOPolicyYes.                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_8_CBox_VerificationPPOPolicyYes" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_8_CBox_VerificationPPOPolicyYes>
	</cffunction>
	 
	<cffunction name="setOPTION_8_CBox_VerificationPPOPolicyYes" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_8_CBox_VerificationPPOPolicyYes" required="Yes" type="String">
		
		<cfif OPTION_8_CBox_VerificationPPOPolicyYes NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_8_CBox_VerificationPPOPolicyYes)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_8_CBox_VerificationPPOPolicyYes</strong> (#OPTION_8_CBox_VerificationPPOPolicyYes#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_8_CBox_VerificationPPOPolicyYes) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_8_CBox_VerificationPPOPolicyYes</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_8_CBox_VerificationPPOPolicyYes EQ "@@">
				<cfset arguments.OPTION_8_CBox_VerificationPPOPolicyYes = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_8_CBox_VerificationPPOPolicyYes = arguments.OPTION_8_CBox_VerificationPPOPolicyYes>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_8_CBox_VerificationPPOPolicyYes")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_8_CBox_VerificationPPOPolicyNo.                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_8_CBox_VerificationPPOPolicyNo" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_8_CBox_VerificationPPOPolicyNo>
	</cffunction>
	 
	<cffunction name="setOPTION_8_CBox_VerificationPPOPolicyNo" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_8_CBox_VerificationPPOPolicyNo" required="Yes" type="String">
		
		<cfif OPTION_8_CBox_VerificationPPOPolicyNo NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_8_CBox_VerificationPPOPolicyNo)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_8_CBox_VerificationPPOPolicyNo</strong> (#OPTION_8_CBox_VerificationPPOPolicyNo#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_8_CBox_VerificationPPOPolicyNo) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_8_CBox_VerificationPPOPolicyNo</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_8_CBox_VerificationPPOPolicyNo EQ "@@">
				<cfset arguments.OPTION_8_CBox_VerificationPPOPolicyNo = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_8_CBox_VerificationPPOPolicyNo = arguments.OPTION_8_CBox_VerificationPPOPolicyNo>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_8_CBox_VerificationPPOPolicyNo")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for verificationPercentagePayAfterDeductibleTBox.           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationPercentagePayAfterDeductibleTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationPercentagePayAfterDeductibleTBox>
	</cffunction>
	 
	<cffunction name="setVerificationPercentagePayAfterDeductibleTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationPercentagePayAfterDeductibleTBox" required="Yes" type="String">
		
		<cfif VerificationPercentagePayAfterDeductibleTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(VerificationPercentagePayAfterDeductibleTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationPercentagePayAfterDeductibleTBox</strong> (#VerificationPercentagePayAfterDeductibleTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(verificationPercentagePayAfterDeductibleTBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationPercentagePayAfterDeductibleTBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.verificationPercentagePayAfterDeductibleTBox EQ "@@">
				<cfset arguments.verificationPercentagePayAfterDeductibleTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.VerificationPercentagePayAfterDeductibleTBox = arguments.VerificationPercentagePayAfterDeductibleTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationPercentagePayAfterDeductibleTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_9_CBox_VerificationPriorAuthYes.                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_9_CBox_VerificationPriorAuthYes" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_9_CBox_VerificationPriorAuthYes>
	</cffunction>
	 
	<cffunction name="setOPTION_9_CBox_VerificationPriorAuthYes" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_9_CBox_VerificationPriorAuthYes" required="Yes" type="String">
		
		<cfif OPTION_9_CBox_VerificationPriorAuthYes NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_9_CBox_VerificationPriorAuthYes)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_9_CBox_VerificationPriorAuthYes</strong> (#OPTION_9_CBox_VerificationPriorAuthYes#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_9_CBox_VerificationPriorAuthYes) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_9_CBox_VerificationPriorAuthYes</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_9_CBox_VerificationPriorAuthYes EQ "@@">
				<cfset arguments.OPTION_9_CBox_VerificationPriorAuthYes = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_9_CBox_VerificationPriorAuthYes = arguments.OPTION_9_CBox_VerificationPriorAuthYes>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_9_CBox_VerificationPriorAuthYes")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_9_CBox_VerificationPriorAuthNo.                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_9_CBox_VerificationPriorAuthNo" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_9_CBox_VerificationPriorAuthNo>
	</cffunction>
	 
	<cffunction name="setOPTION_9_CBox_VerificationPriorAuthNo" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_9_CBox_VerificationPriorAuthNo" required="Yes" type="String">
		
		<cfif OPTION_9_CBox_VerificationPriorAuthNo NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_9_CBox_VerificationPriorAuthNo)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_9_CBox_VerificationPriorAuthNo</strong> (#OPTION_9_CBox_VerificationPriorAuthNo#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_9_CBox_VerificationPriorAuthNo) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_9_CBox_VerificationPriorAuthNo</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_9_CBox_VerificationPriorAuthNo EQ "@@">
				<cfset arguments.OPTION_9_CBox_VerificationPriorAuthNo = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_9_CBox_VerificationPriorAuthNo = arguments.OPTION_9_CBox_VerificationPriorAuthNo>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_9_CBox_VerificationPriorAuthNo")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for verificationAuthNumberTBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationAuthNumberTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationAuthNumberTBox>
	</cffunction>
	 
	<cffunction name="setVerificationAuthNumberTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationAuthNumberTBox" required="Yes" type="String">
		
		<cfif VerificationAuthNumberTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(VerificationAuthNumberTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationAuthNumberTBox</strong> (#VerificationAuthNumberTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(verificationAuthNumberTBox) GT 25>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationAuthNumberTBox</strong> cannot be greater than 25 character(s).">
			</cfif>
						
			<cfif arguments.verificationAuthNumberTBox EQ "@@">
				<cfset arguments.verificationAuthNumberTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.VerificationAuthNumberTBox = arguments.VerificationAuthNumberTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationAuthNumberTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_10_CBox_VerificationLifetimeBenefitMetYes.       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_10_CBox_VerificationLifetimeBenefitMetYes" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_10_CBox_VerificationLifetimeBenefitMetYes>
	</cffunction>
	 
	<cffunction name="setOPTION_10_CBox_VerificationLifetimeBenefitMetYes" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_10_CBox_VerificationLifetimeBenefitMetYes" required="Yes" type="String">
		
		<cfif OPTION_10_CBox_VerificationLifetimeBenefitMetYes NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_10_CBox_VerificationLifetimeBenefitMetYes)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_10_CBox_VerificationLifetimeBenefitMetYes</strong> (#OPTION_10_CBox_VerificationLifetimeBenefitMetYes#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_10_CBox_VerificationLifetimeBenefitMetYes) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_10_CBox_VerificationLifetimeBenefitMetYes</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_10_CBox_VerificationLifetimeBenefitMetYes EQ "@@">
				<cfset arguments.OPTION_10_CBox_VerificationLifetimeBenefitMetYes = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_10_CBox_VerificationLifetimeBenefitMetYes = arguments.OPTION_10_CBox_VerificationLifetimeBenefitMetYes>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_10_CBox_VerificationLifetimeBenefitMetYes")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_10_CBox_VerificationLifetimeBenefitMetNo.        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_10_CBox_VerificationLifetimeBenefitMetNo" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_10_CBox_VerificationLifetimeBenefitMetNo>
	</cffunction>
	 
	<cffunction name="setOPTION_10_CBox_VerificationLifetimeBenefitMetNo" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_10_CBox_VerificationLifetimeBenefitMetNo" required="Yes" type="String">
		
		<cfif OPTION_10_CBox_VerificationLifetimeBenefitMetNo NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_10_CBox_VerificationLifetimeBenefitMetNo)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_10_CBox_VerificationLifetimeBenefitMetNo</strong> (#OPTION_10_CBox_VerificationLifetimeBenefitMetNo#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_10_CBox_VerificationLifetimeBenefitMetNo) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_10_CBox_VerificationLifetimeBenefitMetNo</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_10_CBox_VerificationLifetimeBenefitMetNo EQ "@@">
				<cfset arguments.OPTION_10_CBox_VerificationLifetimeBenefitMetNo = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_10_CBox_VerificationLifetimeBenefitMetNo = arguments.OPTION_10_CBox_VerificationLifetimeBenefitMetNo>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_10_CBox_VerificationLifetimeBenefitMetNo")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for verificationAuthPhoneNumberTBox.                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationAuthPhoneNumberTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationAuthPhoneNumberTBox>
	</cffunction>
	 
	<cffunction name="setVerificationAuthPhoneNumberTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationAuthPhoneNumberTBox" required="Yes" type="String">
		
		<cfif VerificationAuthPhoneNumberTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(VerificationAuthPhoneNumberTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationAuthPhoneNumberTBox</strong> (#VerificationAuthPhoneNumberTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(verificationAuthPhoneNumberTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationAuthPhoneNumberTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
			<cfif arguments.verificationAuthPhoneNumberTBox EQ "@@">
				<cfset arguments.verificationAuthPhoneNumberTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.VerificationAuthPhoneNumberTBox = arguments.VerificationAuthPhoneNumberTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationAuthPhoneNumberTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_11_CBox_VerificationInsFollowMedicareYes.        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_11_CBox_VerificationInsFollowMedicareYes" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_11_CBox_VerificationInsFollowMedicareYes>
	</cffunction>
	 
	<cffunction name="setOPTION_11_CBox_VerificationInsFollowMedicareYes" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_11_CBox_VerificationInsFollowMedicareYes" required="Yes" type="String">
		
		<cfif OPTION_11_CBox_VerificationInsFollowMedicareYes NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_11_CBox_VerificationInsFollowMedicareYes)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_11_CBox_VerificationInsFollowMedicareYes</strong> (#OPTION_11_CBox_VerificationInsFollowMedicareYes#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_11_CBox_VerificationInsFollowMedicareYes) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_11_CBox_VerificationInsFollowMedicareYes</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_11_CBox_VerificationInsFollowMedicareYes EQ "@@">
				<cfset arguments.OPTION_11_CBox_VerificationInsFollowMedicareYes = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_11_CBox_VerificationInsFollowMedicareYes = arguments.OPTION_11_CBox_VerificationInsFollowMedicareYes>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_11_CBox_VerificationInsFollowMedicareYes")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_11_CBox_VerificationInsFollowMedicareNo.         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_11_CBox_VerificationInsFollowMedicareNo" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_11_CBox_VerificationInsFollowMedicareNo>
	</cffunction>
	 
	<cffunction name="setOPTION_11_CBox_VerificationInsFollowMedicareNo" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_11_CBox_VerificationInsFollowMedicareNo" required="Yes" type="String">
		
		<cfif OPTION_11_CBox_VerificationInsFollowMedicareNo NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_11_CBox_VerificationInsFollowMedicareNo)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_11_CBox_VerificationInsFollowMedicareNo</strong> (#OPTION_11_CBox_VerificationInsFollowMedicareNo#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_11_CBox_VerificationInsFollowMedicareNo) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_11_CBox_VerificationInsFollowMedicareNo</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_11_CBox_VerificationInsFollowMedicareNo EQ "@@">
				<cfset arguments.OPTION_11_CBox_VerificationInsFollowMedicareNo = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_11_CBox_VerificationInsFollowMedicareNo = arguments.OPTION_11_CBox_VerificationInsFollowMedicareNo>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_11_CBox_VerificationInsFollowMedicareNo")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_12_CBox_VerificationMedicaidPlanMQMB.            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_12_CBox_VerificationMedicaidPlanMQMB" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_12_CBox_VerificationMedicaidPlanMQMB>
	</cffunction>
	 
	<cffunction name="setOPTION_12_CBox_VerificationMedicaidPlanMQMB" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_12_CBox_VerificationMedicaidPlanMQMB" required="Yes" type="String">
		
		<cfif OPTION_12_CBox_VerificationMedicaidPlanMQMB NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_12_CBox_VerificationMedicaidPlanMQMB)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_12_CBox_VerificationMedicaidPlanMQMB</strong> (#OPTION_12_CBox_VerificationMedicaidPlanMQMB#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_12_CBox_VerificationMedicaidPlanMQMB) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_12_CBox_VerificationMedicaidPlanMQMB</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_12_CBox_VerificationMedicaidPlanMQMB EQ "@@">
				<cfset arguments.OPTION_12_CBox_VerificationMedicaidPlanMQMB = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_12_CBox_VerificationMedicaidPlanMQMB = arguments.OPTION_12_CBox_VerificationMedicaidPlanMQMB>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_12_CBox_VerificationMedicaidPlanMQMB")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_12_CBox_VerificationMedicaidPlanQMB.             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_12_CBox_VerificationMedicaidPlanQMB" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_12_CBox_VerificationMedicaidPlanQMB>
	</cffunction>
	 
	<cffunction name="setOPTION_12_CBox_VerificationMedicaidPlanQMB" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_12_CBox_VerificationMedicaidPlanQMB" required="Yes" type="String">
		
		<cfif OPTION_12_CBox_VerificationMedicaidPlanQMB NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_12_CBox_VerificationMedicaidPlanQMB)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_12_CBox_VerificationMedicaidPlanQMB</strong> (#OPTION_12_CBox_VerificationMedicaidPlanQMB#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_12_CBox_VerificationMedicaidPlanQMB) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_12_CBox_VerificationMedicaidPlanQMB</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_12_CBox_VerificationMedicaidPlanQMB EQ "@@">
				<cfset arguments.OPTION_12_CBox_VerificationMedicaidPlanQMB = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_12_CBox_VerificationMedicaidPlanQMB = arguments.OPTION_12_CBox_VerificationMedicaidPlanQMB>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_12_CBox_VerificationMedicaidPlanQMB")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_12_CBox_VerificationMedicaidPlanTraditional.     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_12_CBox_VerificationMedicaidPlanTraditional" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_12_CBox_VerificationMedicaidPlanTraditional>
	</cffunction>
	 
	<cffunction name="setOPTION_12_CBox_VerificationMedicaidPlanTraditional" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_12_CBox_VerificationMedicaidPlanTraditional" required="Yes" type="String">
		
		<cfif OPTION_12_CBox_VerificationMedicaidPlanTraditional NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_12_CBox_VerificationMedicaidPlanTraditional)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_12_CBox_VerificationMedicaidPlanTraditional</strong> (#OPTION_12_CBox_VerificationMedicaidPlanTraditional#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_12_CBox_VerificationMedicaidPlanTraditional) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_12_CBox_VerificationMedicaidPlanTraditional</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_12_CBox_VerificationMedicaidPlanTraditional EQ "@@">
				<cfset arguments.OPTION_12_CBox_VerificationMedicaidPlanTraditional = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_12_CBox_VerificationMedicaidPlanTraditional = arguments.OPTION_12_CBox_VerificationMedicaidPlanTraditional>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_12_CBox_VerificationMedicaidPlanTraditional")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for VerificationTypeBasePlanTBox.                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getVerificationTypeBasePlanTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.VerificationTypeBasePlanTBox>
	</cffunction>
	 
	<cffunction name="setVerificationTypeBasePlanTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="VerificationTypeBasePlanTBox" required="Yes" type="String">
		
		<cfif VerificationTypeBasePlanTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(VerificationTypeBasePlanTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>VerificationTypeBasePlanTBox</strong> (#VerificationTypeBasePlanTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(VerificationTypeBasePlanTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>VerificationTypeBasePlanTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.VerificationTypeBasePlanTBox EQ "@@">
				<cfset arguments.VerificationTypeBasePlanTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.VerificationTypeBasePlanTBox = arguments.VerificationTypeBasePlanTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "VerificationTypeBasePlanTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_13_CBox_PastEquipmentYes.                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_13_CBox_PastEquipmentYes" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_13_CBox_PastEquipmentYes>
	</cffunction>
	 
	<cffunction name="setOPTION_13_CBox_PastEquipmentYes" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_13_CBox_PastEquipmentYes" required="Yes" type="String">
		
		<cfif OPTION_13_CBox_PastEquipmentYes NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_13_CBox_PastEquipmentYes)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_13_CBox_PastEquipmentYes</strong> (#OPTION_13_CBox_PastEquipmentYes#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_13_CBox_PastEquipmentYes) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_13_CBox_PastEquipmentYes</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_13_CBox_PastEquipmentYes EQ "@@">
				<cfset arguments.OPTION_13_CBox_PastEquipmentYes = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_13_CBox_PastEquipmentYes = arguments.OPTION_13_CBox_PastEquipmentYes>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_13_CBox_PastEquipmentYes")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_13_CBox_PastEquipmentNo.                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_13_CBox_PastEquipmentNo" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_13_CBox_PastEquipmentNo>
	</cffunction>
	 
	<cffunction name="setOPTION_13_CBox_PastEquipmentNo" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_13_CBox_PastEquipmentNo" required="Yes" type="String">
		
		<cfif OPTION_13_CBox_PastEquipmentNo NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_13_CBox_PastEquipmentNo)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_13_CBox_PastEquipmentNo</strong> (#OPTION_13_CBox_PastEquipmentNo#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_13_CBox_PastEquipmentNo) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_13_CBox_PastEquipmentNo</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_13_CBox_PastEquipmentNo EQ "@@">
				<cfset arguments.OPTION_13_CBox_PastEquipmentNo = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_13_CBox_PastEquipmentNo = arguments.OPTION_13_CBox_PastEquipmentNo>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_13_CBox_PastEquipmentNo")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment1TypeTBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment1TypeTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1TypeTBox>
	</cffunction>
	 
	<cffunction name="setEquipment1TypeTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment1TypeTBox" required="Yes" type="String">
		
		<cfif Equipment1TypeTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment1TypeTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1TypeTBox</strong> (#Equipment1TypeTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1TypeTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1TypeTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.Equipment1TypeTBox EQ "@@">
				<cfset arguments.Equipment1TypeTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment1TypeTBox = arguments.Equipment1TypeTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment1TypeTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment1RentPurchasedSelect.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment1RentPurchasedSelect" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1RentPurchasedSelect>
	</cffunction>
	 
	<cffunction name="setEquipment1RentPurchasedSelect" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment1RentPurchasedSelect" required="Yes" type="String">
		
		<cfif Equipment1RentPurchasedSelect NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment1RentPurchasedSelect)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1RentPurchasedSelect</strong> (#Equipment1RentPurchasedSelect#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1RentPurchasedSelect) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1RentPurchasedSelect</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment1RentPurchasedSelect EQ "@@">
				<cfset arguments.Equipment1RentPurchasedSelect = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment1RentPurchasedSelect = arguments.Equipment1RentPurchasedSelect>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment1RentPurchasedSelect")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment1FromMM.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment1FromMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1FromMM>
	</cffunction>
	 
	<cffunction name="setEquipment1FromMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment1FromMM" required="Yes" type="String">
		
		<cfif Equipment1FromMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment1FromMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1FromMM</strong> (#Equipment1FromMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1FromMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1FromMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment1FromMM EQ "@@">
				<cfset arguments.Equipment1FromMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment1FromMM = arguments.Equipment1FromMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment1FromMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment1FromDD.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment1FromDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1FromDD>
	</cffunction>
	 
	<cffunction name="setEquipment1FromDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment1FromDD" required="Yes" type="String">
		
		<cfif Equipment1FromDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment1FromDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1FromDD</strong> (#Equipment1FromDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1FromDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1FromDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment1FromDD EQ "@@">
				<cfset arguments.Equipment1FromDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment1FromDD = arguments.Equipment1FromDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment1FromDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment1FromYY.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment1FromYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1FromYY>
	</cffunction>
	 
	<cffunction name="setEquipment1FromYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment1FromYY" required="Yes" type="String">
		
		<cfif Equipment1FromYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment1FromYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1FromYY</strong> (#Equipment1FromYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1FromYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1FromYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment1FromYY EQ "@@">
				<cfset arguments.Equipment1FromYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment1FromYY = arguments.Equipment1FromYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment1FromYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment1ToMM.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment1ToMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1ToMM>
	</cffunction>
	 
	<cffunction name="setEquipment1ToMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment1ToMM" required="Yes" type="String">
		
		<cfif Equipment1ToMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment1ToMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1ToMM</strong> (#Equipment1ToMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1ToMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1ToMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment1ToMM EQ "@@">
				<cfset arguments.Equipment1ToMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment1ToMM = arguments.Equipment1ToMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment1ToMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment1ToDD.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment1ToDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1ToDD>
	</cffunction>
	 
	<cffunction name="setEquipment1ToDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment1ToDD" required="Yes" type="String">
		
		<cfif Equipment1ToDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment1ToDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1ToDD</strong> (#Equipment1ToDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1ToDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1ToDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment1ToDD EQ "@@">
				<cfset arguments.Equipment1ToDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment1ToDD = arguments.Equipment1ToDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment1ToDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment1ToYY.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment1ToYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1ToYY>
	</cffunction>
	 
	<cffunction name="setEquipment1ToYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment1ToYY" required="Yes" type="String">
		
		<cfif Equipment1ToYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment1ToYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1ToYY</strong> (#Equipment1ToYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1ToYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1ToYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment1ToYY EQ "@@">
				<cfset arguments.Equipment1ToYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment1ToYY = arguments.Equipment1ToYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment1ToYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment1SupplierNameTBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment1SupplierNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1SupplierNameTBox>
	</cffunction>
	 
	<cffunction name="setEquipment1SupplierNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment1SupplierNameTBox" required="Yes" type="String">
		
		<cfif Equipment1SupplierNameTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment1SupplierNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1SupplierNameTBox</strong> (#Equipment1SupplierNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1SupplierNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1SupplierNameTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.Equipment1SupplierNameTBox EQ "@@">
				<cfset arguments.Equipment1SupplierNameTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment1SupplierNameTBox = arguments.Equipment1SupplierNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment1SupplierNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment1SupplierTelephoneTBox.                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment1SupplierTelephoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1SupplierTelephoneTBox>
	</cffunction>
	 
	<cffunction name="setEquipment1SupplierTelephoneTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment1SupplierTelephoneTBox" required="Yes" type="String">
		
		<cfif Equipment1SupplierTelephoneTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment1SupplierTelephoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1SupplierTelephoneTBox</strong> (#Equipment1SupplierTelephoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1SupplierTelephoneTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1SupplierTelephoneTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
			<cfif arguments.Equipment1SupplierTelephoneTBox EQ "@@">
				<cfset arguments.Equipment1SupplierTelephoneTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment1SupplierTelephoneTBox = arguments.Equipment1SupplierTelephoneTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment1SupplierTelephoneTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment2TypeTBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment2TypeTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2TypeTBox>
	</cffunction>
	 
	<cffunction name="setEquipment2TypeTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment2TypeTBox" required="Yes" type="String">
		
		<cfif Equipment2TypeTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment2TypeTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2TypeTBox</strong> (#Equipment2TypeTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2TypeTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2TypeTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.Equipment2TypeTBox EQ "@@">
				<cfset arguments.Equipment2TypeTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment2TypeTBox = arguments.Equipment2TypeTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment2TypeTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment2RentPurchasedSelect.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment2RentPurchasedSelect" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2RentPurchasedSelect>
	</cffunction>
	 
	<cffunction name="setEquipment2RentPurchasedSelect" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment2RentPurchasedSelect" required="Yes" type="String">
		
		<cfif Equipment2RentPurchasedSelect NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment2RentPurchasedSelect)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2RentPurchasedSelect</strong> (#Equipment2RentPurchasedSelect#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2RentPurchasedSelect) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2RentPurchasedSelect</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment2RentPurchasedSelect EQ "@@">
				<cfset arguments.Equipment2RentPurchasedSelect = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment2RentPurchasedSelect = arguments.Equipment2RentPurchasedSelect>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment2RentPurchasedSelect")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment2FromMM.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment2FromMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2FromMM>
	</cffunction>
	 
	<cffunction name="setEquipment2FromMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment2FromMM" required="Yes" type="String">
		
		<cfif Equipment2FromMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment2FromMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2FromMM</strong> (#Equipment2FromMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2FromMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2FromMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment2FromMM EQ "@@">
				<cfset arguments.Equipment2FromMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment2FromMM = arguments.Equipment2FromMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment2FromMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment2FromDD.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment2FromDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2FromDD>
	</cffunction>
	 
	<cffunction name="setEquipment2FromDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment2FromDD" required="Yes" type="String">
		
		<cfif Equipment2FromDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment2FromDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2FromDD</strong> (#Equipment2FromDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2FromDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2FromDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment2FromDD EQ "@@">
				<cfset arguments.Equipment2FromDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment2FromDD = arguments.Equipment2FromDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment2FromDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment2FromYY.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment2FromYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2FromYY>
	</cffunction>
	 
	<cffunction name="setEquipment2FromYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment2FromYY" required="Yes" type="String">
		
		<cfif Equipment2FromYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment2FromYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2FromYY</strong> (#Equipment2FromYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2FromYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2FromYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment2FromYY EQ "@@">
				<cfset arguments.Equipment2FromYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment2FromYY = arguments.Equipment2FromYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment2FromYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment2ToMM.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment2ToMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2ToMM>
	</cffunction>
	 
	<cffunction name="setEquipment2ToMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment2ToMM" required="Yes" type="String">
		
		<cfif Equipment2ToMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment2ToMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2ToMM</strong> (#Equipment2ToMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2ToMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2ToMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment2ToMM EQ "@@">
				<cfset arguments.Equipment2ToMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment2ToMM = arguments.Equipment2ToMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment2ToMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment2ToDD.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment2ToDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2ToDD>
	</cffunction>
	 
	<cffunction name="setEquipment2ToDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment2ToDD" required="Yes" type="String">
		
		<cfif Equipment2ToDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment2ToDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2ToDD</strong> (#Equipment2ToDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2ToDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2ToDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment2ToDD EQ "@@">
				<cfset arguments.Equipment2ToDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment2ToDD = arguments.Equipment2ToDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment2ToDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment2ToYY.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment2ToYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2ToYY>
	</cffunction>
	 
	<cffunction name="setEquipment2ToYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment2ToYY" required="Yes" type="String">
		
		<cfif Equipment2ToYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment2ToYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2ToYY</strong> (#Equipment2ToYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2ToYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2ToYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment2ToYY EQ "@@">
				<cfset arguments.Equipment2ToYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment2ToYY = arguments.Equipment2ToYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment2ToYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment2SupplierNameTBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment2SupplierNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2SupplierNameTBox>
	</cffunction>
	 
	<cffunction name="setEquipment2SupplierNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment2SupplierNameTBox" required="Yes" type="String">
		
		<cfif Equipment2SupplierNameTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment2SupplierNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2SupplierNameTBox</strong> (#Equipment2SupplierNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2SupplierNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2SupplierNameTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.Equipment2SupplierNameTBox EQ "@@">
				<cfset arguments.Equipment2SupplierNameTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment2SupplierNameTBox = arguments.Equipment2SupplierNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment2SupplierNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment2SupplierTelephoneTBox.                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment2SupplierTelephoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2SupplierTelephoneTBox>
	</cffunction>
	 
	<cffunction name="setEquipment2SupplierTelephoneTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment2SupplierTelephoneTBox" required="Yes" type="String">
		
		<cfif Equipment2SupplierTelephoneTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment2SupplierTelephoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2SupplierTelephoneTBox</strong> (#Equipment2SupplierTelephoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2SupplierTelephoneTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2SupplierTelephoneTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
			<cfif arguments.Equipment2SupplierTelephoneTBox EQ "@@">
				<cfset arguments.Equipment2SupplierTelephoneTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment2SupplierTelephoneTBox = arguments.Equipment2SupplierTelephoneTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment2SupplierTelephoneTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment3TypeTBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment3TypeTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3TypeTBox>
	</cffunction>
	 
	<cffunction name="setEquipment3TypeTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment3TypeTBox" required="Yes" type="String">
		
		<cfif Equipment3TypeTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment3TypeTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3TypeTBox</strong> (#Equipment3TypeTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3TypeTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3TypeTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.Equipment3TypeTBox EQ "@@">
				<cfset arguments.Equipment3TypeTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment3TypeTBox = arguments.Equipment3TypeTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment3TypeTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment3RentPurchasedSelect.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment3RentPurchasedSelect" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3RentPurchasedSelect>
	</cffunction>
	 
	<cffunction name="setEquipment3RentPurchasedSelect" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment3RentPurchasedSelect" required="Yes" type="String">
		
		<cfif Equipment3RentPurchasedSelect NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment3RentPurchasedSelect)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3RentPurchasedSelect</strong> (#Equipment3RentPurchasedSelect#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3RentPurchasedSelect) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3RentPurchasedSelect</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment3RentPurchasedSelect EQ "@@">
				<cfset arguments.Equipment3RentPurchasedSelect = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment3RentPurchasedSelect = arguments.Equipment3RentPurchasedSelect>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment3RentPurchasedSelect")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment3FromMM.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment3FromMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3FromMM>
	</cffunction>
	 
	<cffunction name="setEquipment3FromMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment3FromMM" required="Yes" type="String">
		
		<cfif Equipment3FromMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment3FromMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3FromMM</strong> (#Equipment3FromMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3FromMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3FromMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment3FromMM EQ "@@">
				<cfset arguments.Equipment3FromMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment3FromMM = arguments.Equipment3FromMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment3FromMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment3FromDD.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment3FromDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3FromDD>
	</cffunction>
	 
	<cffunction name="setEquipment3FromDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment3FromDD" required="Yes" type="String">
		
		<cfif Equipment3FromDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment3FromDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3FromDD</strong> (#Equipment3FromDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3FromDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3FromDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment3FromDD EQ "@@">
				<cfset arguments.Equipment3FromDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment3FromDD = arguments.Equipment3FromDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment3FromDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment3FromYY.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment3FromYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3FromYY>
	</cffunction>
	 
	<cffunction name="setEquipment3FromYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment3FromYY" required="Yes" type="String">
		
		<cfif Equipment3FromYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment3FromYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3FromYY</strong> (#Equipment3FromYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3FromYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3FromYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment3FromYY EQ "@@">
				<cfset arguments.Equipment3FromYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment3FromYY = arguments.Equipment3FromYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment3FromYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment3ToMM.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment3ToMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3ToMM>
	</cffunction>
	 
	<cffunction name="setEquipment3ToMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment3ToMM" required="Yes" type="String">
		
		<cfif Equipment3ToMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment3ToMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3ToMM</strong> (#Equipment3ToMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3ToMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3ToMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment3ToMM EQ "@@">
				<cfset arguments.Equipment3ToMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment3ToMM = arguments.Equipment3ToMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment3ToMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment3ToDD.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment3ToDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3ToDD>
	</cffunction>
	 
	<cffunction name="setEquipment3ToDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment3ToDD" required="Yes" type="String">
		
		<cfif Equipment3ToDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment3ToDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3ToDD</strong> (#Equipment3ToDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3ToDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3ToDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment3ToDD EQ "@@">
				<cfset arguments.Equipment3ToDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment3ToDD = arguments.Equipment3ToDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment3ToDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment3ToYY.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment3ToYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3ToYY>
	</cffunction>
	 
	<cffunction name="setEquipment3ToYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment3ToYY" required="Yes" type="String">
		
		<cfif Equipment3ToYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment3ToYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3ToYY</strong> (#Equipment3ToYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3ToYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3ToYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment3ToYY EQ "@@">
				<cfset arguments.Equipment3ToYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment3ToYY = arguments.Equipment3ToYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment3ToYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment3SupplierNameTBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment3SupplierNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3SupplierNameTBox>
	</cffunction>
	 
	<cffunction name="setEquipment3SupplierNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment3SupplierNameTBox" required="Yes" type="String">
		
		<cfif Equipment3SupplierNameTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment3SupplierNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3SupplierNameTBox</strong> (#Equipment3SupplierNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3SupplierNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3SupplierNameTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.Equipment3SupplierNameTBox EQ "@@">
				<cfset arguments.Equipment3SupplierNameTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment3SupplierNameTBox = arguments.Equipment3SupplierNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment3SupplierNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment3SupplierTelephoneTBox.                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment3SupplierTelephoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3SupplierTelephoneTBox>
	</cffunction>
	 
	<cffunction name="setEquipment3SupplierTelephoneTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment3SupplierTelephoneTBox" required="Yes" type="String">
		
		<cfif Equipment3SupplierTelephoneTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment3SupplierTelephoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3SupplierTelephoneTBox</strong> (#Equipment3SupplierTelephoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3SupplierTelephoneTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3SupplierTelephoneTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
			<cfif arguments.Equipment3SupplierTelephoneTBox EQ "@@">
				<cfset arguments.Equipment3SupplierTelephoneTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment3SupplierTelephoneTBox = arguments.Equipment3SupplierTelephoneTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment3SupplierTelephoneTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment4TypeTBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment4TypeTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4TypeTBox>
	</cffunction>
	 
	<cffunction name="setEquipment4TypeTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment4TypeTBox" required="Yes" type="String">
		
		<cfif Equipment4TypeTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment4TypeTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4TypeTBox</strong> (#Equipment4TypeTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4TypeTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4TypeTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.Equipment4TypeTBox EQ "@@">
				<cfset arguments.Equipment4TypeTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment4TypeTBox = arguments.Equipment4TypeTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment4TypeTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment4RentPurchasedSelect.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment4RentPurchasedSelect" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4RentPurchasedSelect>
	</cffunction>
	 
	<cffunction name="setEquipment4RentPurchasedSelect" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment4RentPurchasedSelect" required="Yes" type="String">
		
		<cfif Equipment4RentPurchasedSelect NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment4RentPurchasedSelect)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4RentPurchasedSelect</strong> (#Equipment4RentPurchasedSelect#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4RentPurchasedSelect) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4RentPurchasedSelect</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment4RentPurchasedSelect EQ "@@">
				<cfset arguments.Equipment4RentPurchasedSelect = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment4RentPurchasedSelect = arguments.Equipment4RentPurchasedSelect>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment4RentPurchasedSelect")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment4FromMM.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment4FromMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4FromMM>
	</cffunction>
	 
	<cffunction name="setEquipment4FromMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment4FromMM" required="Yes" type="String">
		
		<cfif Equipment4FromMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment4FromMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4FromMM</strong> (#Equipment4FromMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4FromMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4FromMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment4FromMM EQ "@@">
				<cfset arguments.Equipment4FromMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment4FromMM = arguments.Equipment4FromMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment4FromMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment4FromDD.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment4FromDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4FromDD>
	</cffunction>
	 
	<cffunction name="setEquipment4FromDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment4FromDD" required="Yes" type="String">
		
		<cfif Equipment4FromDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment4FromDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4FromDD</strong> (#Equipment4FromDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4FromDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4FromDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment4FromDD EQ "@@">
				<cfset arguments.Equipment4FromDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment4FromDD = arguments.Equipment4FromDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment4FromDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment4FromYY.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment4FromYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4FromYY>
	</cffunction>
	 
	<cffunction name="setEquipment4FromYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment4FromYY" required="Yes" type="String">
		
		<cfif Equipment4FromYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment4FromYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4FromYY</strong> (#Equipment4FromYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4FromYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4FromYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment4FromYY EQ "@@">
				<cfset arguments.Equipment4FromYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment4FromYY = arguments.Equipment4FromYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment4FromYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment4ToMM.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment4ToMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4ToMM>
	</cffunction>
	 
	<cffunction name="setEquipment4ToMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment4ToMM" required="Yes" type="String">
		
		<cfif Equipment4ToMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment4ToMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4ToMM</strong> (#Equipment4ToMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4ToMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4ToMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment4ToMM EQ "@@">
				<cfset arguments.Equipment4ToMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment4ToMM = arguments.Equipment4ToMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment4ToMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment4ToDD.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment4ToDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4ToDD>
	</cffunction>
	 
	<cffunction name="setEquipment4ToDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment4ToDD" required="Yes" type="String">
		
		<cfif Equipment4ToDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment4ToDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4ToDD</strong> (#Equipment4ToDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4ToDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4ToDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment4ToDD EQ "@@">
				<cfset arguments.Equipment4ToDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment4ToDD = arguments.Equipment4ToDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment4ToDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment4ToYY.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment4ToYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4ToYY>
	</cffunction>
	 
	<cffunction name="setEquipment4ToYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment4ToYY" required="Yes" type="String">
		
		<cfif Equipment4ToYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment4ToYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4ToYY</strong> (#Equipment4ToYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4ToYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4ToYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment4ToYY EQ "@@">
				<cfset arguments.Equipment4ToYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment4ToYY = arguments.Equipment4ToYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment4ToYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment4SupplierNameTBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment4SupplierNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4SupplierNameTBox>
	</cffunction>
	 
	<cffunction name="setEquipment4SupplierNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment4SupplierNameTBox" required="Yes" type="String">
		
		<cfif Equipment4SupplierNameTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment4SupplierNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4SupplierNameTBox</strong> (#Equipment4SupplierNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4SupplierNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4SupplierNameTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.Equipment4SupplierNameTBox EQ "@@">
				<cfset arguments.Equipment4SupplierNameTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment4SupplierNameTBox = arguments.Equipment4SupplierNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment4SupplierNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment4SupplierTelephoneTBox.                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment4SupplierTelephoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4SupplierTelephoneTBox>
	</cffunction>
	 
	<cffunction name="setEquipment4SupplierTelephoneTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment4SupplierTelephoneTBox" required="Yes" type="String">
		
		<cfif Equipment4SupplierTelephoneTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment4SupplierTelephoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4SupplierTelephoneTBox</strong> (#Equipment4SupplierTelephoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4SupplierTelephoneTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4SupplierTelephoneTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
			<cfif arguments.Equipment4SupplierTelephoneTBox EQ "@@">
				<cfset arguments.Equipment4SupplierTelephoneTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment4SupplierTelephoneTBox = arguments.Equipment4SupplierTelephoneTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment4SupplierTelephoneTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment5TypeTBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment5TypeTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5TypeTBox>
	</cffunction>
	 
	<cffunction name="setEquipment5TypeTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment5TypeTBox" required="Yes" type="String">
		
		<cfif Equipment5TypeTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment5TypeTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5TypeTBox</strong> (#Equipment5TypeTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5TypeTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5TypeTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.Equipment5TypeTBox EQ "@@">
				<cfset arguments.Equipment5TypeTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment5TypeTBox = arguments.Equipment5TypeTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment5TypeTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment5RentPurchasedSelect.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment5RentPurchasedSelect" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5RentPurchasedSelect>
	</cffunction>
	 
	<cffunction name="setEquipment5RentPurchasedSelect" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment5RentPurchasedSelect" required="Yes" type="String">
		
		<cfif Equipment5RentPurchasedSelect NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment5RentPurchasedSelect)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5RentPurchasedSelect</strong> (#Equipment5RentPurchasedSelect#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5RentPurchasedSelect) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5RentPurchasedSelect</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment5RentPurchasedSelect EQ "@@">
				<cfset arguments.Equipment5RentPurchasedSelect = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment5RentPurchasedSelect = arguments.Equipment5RentPurchasedSelect>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment5RentPurchasedSelect")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment5FromMM.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment5FromMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5FromMM>
	</cffunction>
	 
	<cffunction name="setEquipment5FromMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment5FromMM" required="Yes" type="String">
		
		<cfif Equipment5FromMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment5FromMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5FromMM</strong> (#Equipment5FromMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5FromMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5FromMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment5FromMM EQ "@@">
				<cfset arguments.Equipment5FromMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment5FromMM = arguments.Equipment5FromMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment5FromMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment5FromDD.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment5FromDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5FromDD>
	</cffunction>
	 
	<cffunction name="setEquipment5FromDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment5FromDD" required="Yes" type="String">
		
		<cfif Equipment5FromDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment5FromDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5FromDD</strong> (#Equipment5FromDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5FromDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5FromDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment5FromDD EQ "@@">
				<cfset arguments.Equipment5FromDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment5FromDD = arguments.Equipment5FromDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment5FromDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment5FromYY.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment5FromYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5FromYY>
	</cffunction>
	 
	<cffunction name="setEquipment5FromYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment5FromYY" required="Yes" type="String">
		
		<cfif Equipment5FromYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment5FromYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5FromYY</strong> (#Equipment5FromYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5FromYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5FromYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment5FromYY EQ "@@">
				<cfset arguments.Equipment5FromYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment5FromYY = arguments.Equipment5FromYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment5FromYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment5ToMM.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment5ToMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5ToMM>
	</cffunction>
	 
	<cffunction name="setEquipment5ToMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment5ToMM" required="Yes" type="String">
		
		<cfif Equipment5ToMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment5ToMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5ToMM</strong> (#Equipment5ToMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5ToMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5ToMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment5ToMM EQ "@@">
				<cfset arguments.Equipment5ToMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment5ToMM = arguments.Equipment5ToMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment5ToMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment5ToDD.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment5ToDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5ToDD>
	</cffunction>
	 
	<cffunction name="setEquipment5ToDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment5ToDD" required="Yes" type="String">
		
		<cfif Equipment5ToDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment5ToDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5ToDD</strong> (#Equipment5ToDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5ToDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5ToDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment5ToDD EQ "@@">
				<cfset arguments.Equipment5ToDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment5ToDD = arguments.Equipment5ToDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment5ToDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment5ToYY.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment5ToYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5ToYY>
	</cffunction>
	 
	<cffunction name="setEquipment5ToYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment5ToYY" required="Yes" type="String">
		
		<cfif Equipment5ToYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment5ToYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5ToYY</strong> (#Equipment5ToYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5ToYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5ToYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.Equipment5ToYY EQ "@@">
				<cfset arguments.Equipment5ToYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment5ToYY = arguments.Equipment5ToYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment5ToYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment5SupplierNameTBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment5SupplierNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5SupplierNameTBox>
	</cffunction>
	 
	<cffunction name="setEquipment5SupplierNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment5SupplierNameTBox" required="Yes" type="String">
		
		<cfif Equipment5SupplierNameTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment5SupplierNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5SupplierNameTBox</strong> (#Equipment5SupplierNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5SupplierNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5SupplierNameTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.Equipment5SupplierNameTBox EQ "@@">
				<cfset arguments.Equipment5SupplierNameTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment5SupplierNameTBox = arguments.Equipment5SupplierNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment5SupplierNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment5SupplierTelephoneTBox.                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment5SupplierTelephoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5SupplierTelephoneTBox>
	</cffunction>
	 
	<cffunction name="setEquipment5SupplierTelephoneTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment5SupplierTelephoneTBox" required="Yes" type="String">
		
		<cfif Equipment5SupplierTelephoneTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(Equipment5SupplierTelephoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5SupplierTelephoneTBox</strong> (#Equipment5SupplierTelephoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5SupplierTelephoneTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5SupplierTelephoneTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
			<cfif arguments.Equipment5SupplierTelephoneTBox EQ "@@">
				<cfset arguments.Equipment5SupplierTelephoneTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Equipment5SupplierTelephoneTBox = arguments.Equipment5SupplierTelephoneTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment5SupplierTelephoneTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_14_CBox_OxygenPAo2.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_14_CBox_OxygenPAo2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_14_CBox_OxygenPAo2>
	</cffunction>
	 
	<cffunction name="setOPTION_14_CBox_OxygenPAo2" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_14_CBox_OxygenPAo2" required="Yes" type="String">
		
		<cfif OPTION_14_CBox_OxygenPAo2 NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_14_CBox_OxygenPAo2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_14_CBox_OxygenPAo2</strong> (#OPTION_14_CBox_OxygenPAo2#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_14_CBox_OxygenPAo2) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_14_CBox_OxygenPAo2</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_14_CBox_OxygenPAo2 EQ "@@">
				<cfset arguments.OPTION_14_CBox_OxygenPAo2 = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_14_CBox_OxygenPAo2 = arguments.OPTION_14_CBox_OxygenPAo2>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_14_CBox_OxygenPAo2")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_14_CBox_OxygenSAo2.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_14_CBox_OxygenSAo2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_14_CBox_OxygenSAo2>
	</cffunction>
	 
	<cffunction name="setOPTION_14_CBox_OxygenSAo2" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_14_CBox_OxygenSAo2" required="Yes" type="String">
		
		<cfif OPTION_14_CBox_OxygenSAo2 NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_14_CBox_OxygenSAo2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_14_CBox_OxygenSAo2</strong> (#OPTION_14_CBox_OxygenSAo2#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_14_CBox_OxygenSAo2) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_14_CBox_OxygenSAo2</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_14_CBox_OxygenSAo2 EQ "@@">
				<cfset arguments.OPTION_14_CBox_OxygenSAo2 = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_14_CBox_OxygenSAo2 = arguments.OPTION_14_CBox_OxygenSAo2>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_14_CBox_OxygenSAo2")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_14_CBox_OxygenSPo2.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_14_CBox_OxygenSPo2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_14_CBox_OxygenSPo2>
	</cffunction>
	 
	<cffunction name="setOPTION_14_CBox_OxygenSPo2" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_14_CBox_OxygenSPo2" required="Yes" type="String">
		
		<cfif OPTION_14_CBox_OxygenSPo2 NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OPTION_14_CBox_OxygenSPo2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_14_CBox_OxygenSPo2</strong> (#OPTION_14_CBox_OxygenSPo2#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_14_CBox_OxygenSPo2) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_14_CBox_OxygenSPo2</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OPTION_14_CBox_OxygenSPo2 EQ "@@">
				<cfset arguments.OPTION_14_CBox_OxygenSPo2 = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OPTION_14_CBox_OxygenSPo2 = arguments.OPTION_14_CBox_OxygenSPo2>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_14_CBox_OxygenSPo2")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OxygenPAO2TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOxygenPAO2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OxygenPAO2TBox>
	</cffunction>
	 
	<cffunction name="setOxygenPAO2TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OxygenPAO2TBox" required="Yes" type="String">
		
		<cfif OxygenPAO2TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OxygenPAO2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OxygenPAO2TBox</strong> (#OxygenPAO2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OxygenPAO2TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OxygenPAO2TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OxygenPAO2TBox EQ "@@">
				<cfset arguments.OxygenPAO2TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OxygenPAO2TBox = arguments.OxygenPAO2TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OxygenPAO2TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OxygenSAO2TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOxygenSAO2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OxygenSAO2TBox>
	</cffunction>
	 
	<cffunction name="setOxygenSAO2TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OxygenSAO2TBox" required="Yes" type="String">
		
		<cfif OxygenSAO2TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OxygenSAO2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OxygenSAO2TBox</strong> (#OxygenSAO2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OxygenSAO2TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OxygenSAO2TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OxygenSAO2TBox EQ "@@">
				<cfset arguments.OxygenSAO2TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OxygenSAO2TBox = arguments.OxygenSAO2TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OxygenSAO2TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CPAPStudy_CBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCPAPStudy_CBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CPAPStudy_CBox>
	</cffunction>
	 
	<cffunction name="setCPAPStudy_CBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CPAPStudy_CBox" required="Yes" type="String">
		
		<cfif CPAPStudy_CBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(CPAPStudy_CBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CPAPStudy_CBox</strong> (#CPAPStudy_CBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CPAPStudy_CBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CPAPStudy_CBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.CPAPStudy_CBox EQ "@@">
				<cfset arguments.CPAPStudy_CBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.CPAPStudy_CBox = arguments.CPAPStudy_CBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CPAPStudy_CBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CPAPStudyNote.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCPAPStudyNote" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CPAPStudyNote>
	</cffunction>
	 
	<cffunction name="setCPAPStudyNote" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CPAPStudyNote" required="Yes" type="String">
		
		<cfif CPAPStudyNote NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(CPAPStudyNote)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CPAPStudyNote</strong> (#CPAPStudyNote#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CPAPStudyNote) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CPAPStudyNote</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.CPAPStudyNote EQ "@@">
				<cfset arguments.CPAPStudyNote = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.CPAPStudyNote = arguments.CPAPStudyNote>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CPAPStudyNote")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OxygenSPO2TBox.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOxygenSPO2TBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OxygenSPO2TBox>
	</cffunction>
	 
	<cffunction name="setOxygenSPO2TBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OxygenSPO2TBox" required="Yes" type="String">
		
		<cfif OxygenSPO2TBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(OxygenSPO2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OxygenSPO2TBox</strong> (#OxygenSPO2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OxygenSPO2TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OxygenSPO2TBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.OxygenSPO2TBox EQ "@@">
				<cfset arguments.OxygenSPO2TBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.OxygenSPO2TBox = arguments.OxygenSPO2TBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OxygenSPO2TBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CPAPStudyOnFile_CBox.                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCPAPStudyOnFile_CBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CPAPStudyOnFile_CBox>
	</cffunction>
	 
	<cffunction name="setCPAPStudyOnFile_CBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CPAPStudyOnFile_CBox" required="Yes" type="String">
		
		<cfif CPAPStudyOnFile_CBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(CPAPStudyOnFile_CBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CPAPStudyOnFile_CBox</strong> (#CPAPStudyOnFile_CBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CPAPStudyOnFile_CBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CPAPStudyOnFile_CBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.CPAPStudyOnFile_CBox EQ "@@">
				<cfset arguments.CPAPStudyOnFile_CBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.CPAPStudyOnFile_CBox = arguments.CPAPStudyOnFile_CBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CPAPStudyOnFile_CBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CPAPStudyOnFileNote.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCPAPStudyOnFileNote" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CPAPStudyOnFileNote>
	</cffunction>
	 
	<cffunction name="setCPAPStudyOnFileNote" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CPAPStudyOnFileNote" required="Yes" type="String">
		
		<cfif CPAPStudyOnFileNote NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(CPAPStudyOnFileNote)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CPAPStudyOnFileNote</strong> (#CPAPStudyOnFileNote#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CPAPStudyOnFileNote) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CPAPStudyOnFileNote</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.CPAPStudyOnFileNote EQ "@@">
				<cfset arguments.CPAPStudyOnFileNote = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.CPAPStudyOnFileNote = arguments.CPAPStudyOnFileNote>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CPAPStudyOnFileNote")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LabTestDateMM.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLabTestDateMM" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LabTestDateMM>
	</cffunction>
	 
	<cffunction name="setLabTestDateMM" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LabTestDateMM" required="Yes" type="String">
		
		<cfif LabTestDateMM NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(LabTestDateMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LabTestDateMM</strong> (#LabTestDateMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LabTestDateMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LabTestDateMM</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.LabTestDateMM EQ "@@">
				<cfset arguments.LabTestDateMM = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.LabTestDateMM = arguments.LabTestDateMM>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LabTestDateMM")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LabTestDateDD.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLabTestDateDD" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LabTestDateDD>
	</cffunction>
	 
	<cffunction name="setLabTestDateDD" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LabTestDateDD" required="Yes" type="String">
		
		<cfif LabTestDateDD NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(LabTestDateDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LabTestDateDD</strong> (#LabTestDateDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LabTestDateDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LabTestDateDD</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.LabTestDateDD EQ "@@">
				<cfset arguments.LabTestDateDD = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.LabTestDateDD = arguments.LabTestDateDD>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LabTestDateDD")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LabTestDateYY.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLabTestDateYY" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LabTestDateYY>
	</cffunction>
	 
	<cffunction name="setLabTestDateYY" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LabTestDateYY" required="Yes" type="String">
		
		<cfif LabTestDateYY NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(LabTestDateYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LabTestDateYY</strong> (#LabTestDateYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LabTestDateYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LabTestDateYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
			<cfif arguments.LabTestDateYY EQ "@@">
				<cfset arguments.LabTestDateYY = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.LabTestDateYY = arguments.LabTestDateYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LabTestDateYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CPAPStudyPerformedAt.                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCPAPStudyPerformedAt" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CPAPStudyPerformedAt>
	</cffunction>
	 
	<cffunction name="setCPAPStudyPerformedAt" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CPAPStudyPerformedAt" required="Yes" type="String">
		
		<cfif CPAPStudyPerformedAt NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(CPAPStudyPerformedAt)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CPAPStudyPerformedAt</strong> (#CPAPStudyPerformedAt#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CPAPStudyPerformedAt) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CPAPStudyPerformedAt</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.CPAPStudyPerformedAt EQ "@@">
				<cfset arguments.CPAPStudyPerformedAt = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.CPAPStudyPerformedAt = arguments.CPAPStudyPerformedAt>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CPAPStudyPerformedAt")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LabTestFacilityTBox.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLabTestFacilityTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LabTestFacilityTBox>
	</cffunction>
	 
	<cffunction name="setLabTestFacilityTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LabTestFacilityTBox" required="Yes" type="String">
		
		<cfif LabTestFacilityTBox NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(LabTestFacilityTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LabTestFacilityTBox</strong> (#LabTestFacilityTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LabTestFacilityTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LabTestFacilityTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.LabTestFacilityTBox EQ "@@">
				<cfset arguments.LabTestFacilityTBox = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.LabTestFacilityTBox = arguments.LabTestFacilityTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LabTestFacilityTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CPAPStudyPerformedAt2.                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCPAPStudyPerformedAt2" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CPAPStudyPerformedAt2>
	</cffunction>
	 
	<cffunction name="setCPAPStudyPerformedAt2" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CPAPStudyPerformedAt2" required="Yes" type="String">
		
		<cfif CPAPStudyPerformedAt2 NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(CPAPStudyPerformedAt2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CPAPStudyPerformedAt2</strong> (#CPAPStudyPerformedAt2#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CPAPStudyPerformedAt2) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CPAPStudyPerformedAt2</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.CPAPStudyPerformedAt2 EQ "@@">
				<cfset arguments.CPAPStudyPerformedAt2 = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.CPAPStudyPerformedAt2 = arguments.CPAPStudyPerformedAt2>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CPAPStudyPerformedAt2")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CPAPStudyPerformedAt3.                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCPAPStudyPerformedAt3" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CPAPStudyPerformedAt3>
	</cffunction>
	 
	<cffunction name="setCPAPStudyPerformedAt3" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CPAPStudyPerformedAt3" required="Yes" type="String">
		
		<cfif CPAPStudyPerformedAt3 NEQ "NULL">	
			
			<cfif NOT REQUEST.isvarcharDataType(CPAPStudyPerformedAt3)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CPAPStudyPerformedAt3</strong> (#CPAPStudyPerformedAt3#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CPAPStudyPerformedAt3) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CPAPStudyPerformedAt3</strong> cannot be greater than 100 character(s).">
			</cfif>
						
			<cfif arguments.CPAPStudyPerformedAt3 EQ "@@">
				<cfset arguments.CPAPStudyPerformedAt3 = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.CPAPStudyPerformedAt3 = arguments.CPAPStudyPerformedAt3>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CPAPStudyPerformedAt3")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Active.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getActive" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Active>
	</cffunction>
	 
	<cffunction name="setActive" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Active" required="Yes" type="String">
		
		<cfif Active NEQ "NULL">	
			
			<cfif NOT REQUEST.ischarDataType(Active)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Active</strong> (#Active#) is not of type <strong>char</strong>.">	
			<cfelseif len(Active) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Active</strong> cannot be greater than 1 character(s).">
			</cfif>
						
			<cfif arguments.Active EQ "@@">
				<cfset arguments.Active = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.Active = arguments.Active>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Active")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InactiveCode.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInactiveCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InactiveCode>
	</cffunction>
	 
	<cffunction name="setInactiveCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InactiveCode" required="Yes" type="String">
		
		<cfif InactiveCode NEQ "NULL">	
			
			<cfif NOT REQUEST.isintDataType(InactiveCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InactiveCode</strong> (#InactiveCode#) is not of type <strong>int</strong>.">
			</cfif>
						
			<cfif arguments.InactiveCode EQ "@@">
				<cfset arguments.InactiveCode = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.InactiveCode = arguments.InactiveCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InactiveCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateCreated.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateCreated" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateCreated>
	</cffunction>
	 
	<cffunction name="setDateCreated" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateCreated" required="Yes" type="String">
		
		<cfif DateCreated NEQ "NULL" AND DateCreated NEQ "NOW">	
			
			<cfif NOT REQUEST.isdatetimeDataType(DateCreated)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateCreated</strong> (#DateCreated#) is not of type <strong>datetime</strong>.">
			</cfif>
						
			<cfif arguments.DateCreated EQ "@@">
				<cfset arguments.DateCreated = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.DateCreated = arguments.DateCreated>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateCreated")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateModified.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateModified" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateModified>
	</cffunction>
	 
	<cffunction name="setDateModified" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateModified" required="Yes" type="String">
		
		<cfif DateModified NEQ "NULL" AND DateModified NEQ "NOW">	
			
			<cfif NOT REQUEST.isdatetimeDataType(DateModified)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateModified</strong> (#DateModified#) is not of type <strong>datetime</strong>.">
			</cfif>
						
			<cfif arguments.DateModified EQ "@@">
				<cfset arguments.DateModified = "NULL">
			</cfif>
			
		</cfif>	
			
 		<cfset variables.instance.DateModified = arguments.DateModified>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateModified")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to instantiate a record you can then                         --->
	<!--- use the commit function to create the record which will                        --->
	<!--- return the recordID.                                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="new" access="public" output="no">

		<cfargument name="hidden_UsersID" required="No" type="String" default="">
		<cfargument name="hidden_TimeStart" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Delivery" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Pickup" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Repair" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Switch" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Existing" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Facility" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Hospice" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Hospital" required="No" type="String" default="">
		<cfargument name="facilityTBox" required="No" type="String" default="">
		<cfargument name="hospiceTBox" required="No" type="String" default="">
		<cfargument name="OPTION_3_CBox_Medicare" required="No" type="String" default="">
		<cfargument name="OPTION_3_CBox_PrivateInsurance" required="No" type="String" default="">
		<cfargument name="OPTION_3_CBox_Medicaid" required="No" type="String" default="">
		<cfargument name="OPTION_3_CBox_PrivatePay" required="No" type="String" default="">
		<cfargument name="hospitalTBox" required="No" type="String" default="">
		<cfargument name="DischargeDateMM" required="No" type="String" default="">
		<cfargument name="DischargeDateDD" required="No" type="String" default="">
		<cfargument name="DischargeDateYY" required="No" type="String" default="">
		<cfargument name="typeOfPay_Radio" required="No" type="String" default="">
		<cfargument name="callerNameTBox" required="No" type="String" default="">
		<cfargument name="callerPhoneTBox" required="No" type="String" default="">
		<cfargument name="patientNameTBox" required="No" type="String" default="">
		<cfargument name="roomNumberTBox" required="No" type="String" default="">
		<cfargument name="bedNumberTBox" required="No" type="String" default="">
		<cfargument name="patientAddressTBox" required="No" type="String" default="">
		<cfargument name="patientCityTBox" required="No" type="String" default="">
		<cfargument name="patientStateTBox" required="No" type="String" default="">
		<cfargument name="patientZipTBox" required="No" type="String" default="">
		<cfargument name="patientPhoneTBox" required="No" type="String" default="">
		<cfargument name="patientDOBMM" required="No" type="String" default="">
		<cfargument name="patientDOBDD" required="No" type="String" default="">
		<cfargument name="patientDOBYY" required="No" type="String" default="">
		<cfargument name="patientSSNTBox" required="No" type="String" default="">
		<cfargument name="patientHeightFeet" required="No" type="String" default="">
		<cfargument name="patientHeightInches" required="No" type="String" default="">
		<cfargument name="patientWeightTBox" required="No" type="String" default="">
		<cfargument name="alternateContactNameTBox" required="No" type="String" default="">
		<cfargument name="alternateContactRelationshipTBox" required="No" type="String" default="">
		<cfargument name="alternateContactPhoneTBox" required="No" type="String" default="">
		<cfargument name="hcpcCode1TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty1TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct1TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX1TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis1TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear1TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth1TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode2TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty2TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct2TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX2TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis2TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear2TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth2TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode3TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty3TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct3TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX3TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis3TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear3TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth3TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode4TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty4TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct4TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX4TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis4TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear4TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth4TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode5TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty5TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct5TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX5TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis5TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear5TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth5TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode6TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty6TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct6TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX6TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis6TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear6TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth6TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode7TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty7TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct7TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX7TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis7TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear7TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth7TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode8TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty8TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct8TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX8TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis8TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear8TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth8TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode9TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty9TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct9TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX9TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis9TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear9TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth9TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode10TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty10TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct10TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX10TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis10TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear10TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth10TBox" required="No" type="String" default="">
		<cfargument name="primaryInsuranceNameTBox" required="No" type="String" default="">
		<cfargument name="secondaryInsuranceNameTBox" required="No" type="String" default="">
		<cfargument name="primaryPolicyNumberTBox" required="No" type="String" default="">
		<cfargument name="secondaryPolicyNumberTBox" required="No" type="String" default="">
		<cfargument name="primaryGroupNumberTBox" required="No" type="String" default="">
		<cfargument name="secondaryGroupNumberTBox" required="No" type="String" default="">
		<cfargument name="primaryPhoneNumberTBox" required="No" type="String" default="">
		<cfargument name="secondaryPhoneNumberTBox" required="No" type="String" default="">
		<cfargument name="priEffectiveDateMM" required="No" type="String" default="">
		<cfargument name="priEffectiveDateDD" required="No" type="String" default="">
		<cfargument name="priEffectiveDateYY" required="No" type="String" default="">
		<cfargument name="secEffectiveDateMM" required="No" type="String" default="">
		<cfargument name="secEffectiveDateDD" required="No" type="String" default="">
		<cfargument name="secEffectiveDateYY" required="No" type="String" default="">
		<cfargument name="priPolicyHolderNameTBox" required="No" type="String" default="">
		<cfargument name="secPolicyHolderNameTBox" required="No" type="String" default="">
		<cfargument name="priHoldersDOBMM" required="No" type="String" default="">
		<cfargument name="priHoldersDOBDD" required="No" type="String" default="">
		<cfargument name="priHoldersDOBYY" required="No" type="String" default="">
		<cfargument name="secHoldersDOBMM" required="No" type="String" default="">
		<cfargument name="secHoldersDOBDD" required="No" type="String" default="">
		<cfargument name="secHoldersDOBYY" required="No" type="String" default="">
		<cfargument name="priPolicyHolderEmployerTBox" required="No" type="String" default="">
		<cfargument name="secPolicyHolderEmployerTBox" required="No" type="String" default="">
		<cfargument name="priNoteTBox" required="No" type="String" default="">
		<cfargument name="secNoteTBox" required="No" type="String" default="">
		<cfargument name="poNumberTBox" required="No" type="String" default="">
		<cfargument name="creditCardTypeTBox" required="No" type="String" default="">
		<cfargument name="creditCardNumberTBox" required="No" type="String" default="">
		<cfargument name="ccDateMM" required="No" type="String" default="">
		<cfargument name="ccDateDD" required="No" type="String" default="">
		<cfargument name="ccDateYY" required="No" type="String" default="">
		<cfargument name="orderingPhysicianNameTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianPhoneTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianUPINTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianFaxTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianAddressTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianCityTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianStateTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianZipTBox" required="No" type="String" default="">
		<cfargument name="verificationRepNameTBox" required="No" type="String" default="">
		<cfargument name="verificationDateMM" required="No" type="String" default="">
		<cfargument name="verificationDateDD" required="No" type="String" default="">
		<cfargument name="verificationDateYY" required="No" type="String" default="">
		<cfargument name="verificationTimeTBox" required="No" type="String" default="">
		<cfargument name="OPTION_4_CBox_VerificationHaveInsYes" required="No" type="String" default="">
		<cfargument name="OPTION_4_CBox_VerificationHaveInsNo" required="No" type="String" default="">
		<cfargument name="verificationHaveInsFromMM" required="No" type="String" default="">
		<cfargument name="verificationHaveInsFromDD" required="No" type="String" default="">
		<cfargument name="verificationHaveInsFromYY" required="No" type="String" default="">
		<cfargument name="verificationHaveInsToMM" required="No" type="String" default="">
		<cfargument name="verificationHaveInsToDD" required="No" type="String" default="">
		<cfargument name="verificationHaveInsToYY" required="No" type="String" default="">
		<cfargument name="OPTION_5_CBox_VerificationHaveDMECovYes" required="No" type="String" default="">
		<cfargument name="OPTION_5_CBox_VerificationHaveDMECovNo" required="No" type="String" default="">
		<cfargument name="OPTION_6_CBox_VerificationDeductibleYes" required="No" type="String" default="">
		<cfargument name="OPTION_6_CBox_VerificationDeductibleNo" required="No" type="String" default="">
		<cfargument name="OPTION_7_CBox_VerificationDeductibleMetYes" required="No" type="String" default="">
		<cfargument name="OPTION_7_CBox_VerificationDeductibleMetNo" required="No" type="String" default="">
		<cfargument name="verificationDeductibleAmountTBox" required="No" type="String" default="">
		<cfargument name="OPTION_8_CBox_VerificationPPOPolicyYes" required="No" type="String" default="">
		<cfargument name="OPTION_8_CBox_VerificationPPOPolicyNo" required="No" type="String" default="">
		<cfargument name="verificationPercentagePayAfterDeductibleTBox" required="No" type="String" default="">
		<cfargument name="OPTION_9_CBox_VerificationPriorAuthYes" required="No" type="String" default="">
		<cfargument name="OPTION_9_CBox_VerificationPriorAuthNo" required="No" type="String" default="">
		<cfargument name="verificationAuthNumberTBox" required="No" type="String" default="">
		<cfargument name="OPTION_10_CBox_VerificationLifetimeBenefitMetYes" required="No" type="String" default="">
		<cfargument name="OPTION_10_CBox_VerificationLifetimeBenefitMetNo" required="No" type="String" default="">
		<cfargument name="verificationAuthPhoneNumberTBox" required="No" type="String" default="">
		<cfargument name="OPTION_11_CBox_VerificationInsFollowMedicareYes" required="No" type="String" default="">
		<cfargument name="OPTION_11_CBox_VerificationInsFollowMedicareNo" required="No" type="String" default="">
		<cfargument name="OPTION_12_CBox_VerificationMedicaidPlanMQMB" required="No" type="String" default="">
		<cfargument name="OPTION_12_CBox_VerificationMedicaidPlanQMB" required="No" type="String" default="">
		<cfargument name="OPTION_12_CBox_VerificationMedicaidPlanTraditional" required="No" type="String" default="">
		<cfargument name="VerificationTypeBasePlanTBox" required="No" type="String" default="">
		<cfargument name="OPTION_13_CBox_PastEquipmentYes" required="No" type="String" default="">
		<cfargument name="OPTION_13_CBox_PastEquipmentNo" required="No" type="String" default="">
		<cfargument name="Equipment1TypeTBox" required="No" type="String" default="">
		<cfargument name="Equipment1RentPurchasedSelect" required="No" type="String" default="">
		<cfargument name="Equipment1FromMM" required="No" type="String" default="">
		<cfargument name="Equipment1FromDD" required="No" type="String" default="">
		<cfargument name="Equipment1FromYY" required="No" type="String" default="">
		<cfargument name="Equipment1ToMM" required="No" type="String" default="">
		<cfargument name="Equipment1ToDD" required="No" type="String" default="">
		<cfargument name="Equipment1ToYY" required="No" type="String" default="">
		<cfargument name="Equipment1SupplierNameTBox" required="No" type="String" default="">
		<cfargument name="Equipment1SupplierTelephoneTBox" required="No" type="String" default="">
		<cfargument name="Equipment2TypeTBox" required="No" type="String" default="">
		<cfargument name="Equipment2RentPurchasedSelect" required="No" type="String" default="">
		<cfargument name="Equipment2FromMM" required="No" type="String" default="">
		<cfargument name="Equipment2FromDD" required="No" type="String" default="">
		<cfargument name="Equipment2FromYY" required="No" type="String" default="">
		<cfargument name="Equipment2ToMM" required="No" type="String" default="">
		<cfargument name="Equipment2ToDD" required="No" type="String" default="">
		<cfargument name="Equipment2ToYY" required="No" type="String" default="">
		<cfargument name="Equipment2SupplierNameTBox" required="No" type="String" default="">
		<cfargument name="Equipment2SupplierTelephoneTBox" required="No" type="String" default="">
		<cfargument name="Equipment3TypeTBox" required="No" type="String" default="">
		<cfargument name="Equipment3RentPurchasedSelect" required="No" type="String" default="">
		<cfargument name="Equipment3FromMM" required="No" type="String" default="">
		<cfargument name="Equipment3FromDD" required="No" type="String" default="">
		<cfargument name="Equipment3FromYY" required="No" type="String" default="">
		<cfargument name="Equipment3ToMM" required="No" type="String" default="">
		<cfargument name="Equipment3ToDD" required="No" type="String" default="">
		<cfargument name="Equipment3ToYY" required="No" type="String" default="">
		<cfargument name="Equipment3SupplierNameTBox" required="No" type="String" default="">
		<cfargument name="Equipment3SupplierTelephoneTBox" required="No" type="String" default="">
		<cfargument name="Equipment4TypeTBox" required="No" type="String" default="">
		<cfargument name="Equipment4RentPurchasedSelect" required="No" type="String" default="">
		<cfargument name="Equipment4FromMM" required="No" type="String" default="">
		<cfargument name="Equipment4FromDD" required="No" type="String" default="">
		<cfargument name="Equipment4FromYY" required="No" type="String" default="">
		<cfargument name="Equipment4ToMM" required="No" type="String" default="">
		<cfargument name="Equipment4ToDD" required="No" type="String" default="">
		<cfargument name="Equipment4ToYY" required="No" type="String" default="">
		<cfargument name="Equipment4SupplierNameTBox" required="No" type="String" default="">
		<cfargument name="Equipment4SupplierTelephoneTBox" required="No" type="String" default="">
		<cfargument name="Equipment5TypeTBox" required="No" type="String" default="">
		<cfargument name="Equipment5RentPurchasedSelect" required="No" type="String" default="">
		<cfargument name="Equipment5FromMM" required="No" type="String" default="">
		<cfargument name="Equipment5FromDD" required="No" type="String" default="">
		<cfargument name="Equipment5FromYY" required="No" type="String" default="">
		<cfargument name="Equipment5ToMM" required="No" type="String" default="">
		<cfargument name="Equipment5ToDD" required="No" type="String" default="">
		<cfargument name="Equipment5ToYY" required="No" type="String" default="">
		<cfargument name="Equipment5SupplierNameTBox" required="No" type="String" default="">
		<cfargument name="Equipment5SupplierTelephoneTBox" required="No" type="String" default="">
		<cfargument name="OPTION_14_CBox_OxygenPAo2" required="No" type="String" default="">
		<cfargument name="OPTION_14_CBox_OxygenSAo2" required="No" type="String" default="">
		<cfargument name="OPTION_14_CBox_OxygenSPo2" required="No" type="String" default="">
		<cfargument name="OxygenPAO2TBox" required="No" type="String" default="">
		<cfargument name="OxygenSAO2TBox" required="No" type="String" default="">
		<cfargument name="CPAPStudy_CBox" required="No" type="String" default="">
		<cfargument name="CPAPStudyNote" required="No" type="String" default="">
		<cfargument name="OxygenSPO2TBox" required="No" type="String" default="">
		<cfargument name="CPAPStudyOnFile_CBox" required="No" type="String" default="">
		<cfargument name="CPAPStudyOnFileNote" required="No" type="String" default="">
		<cfargument name="LabTestDateMM" required="No" type="String" default="">
		<cfargument name="LabTestDateDD" required="No" type="String" default="">
		<cfargument name="LabTestDateYY" required="No" type="String" default="">
		<cfargument name="CPAPStudyPerformedAt" required="No" type="String" default="">
		<cfargument name="LabTestFacilityTBox" required="No" type="String" default="">
		<cfargument name="CPAPStudyPerformedAt2" required="No" type="String" default="">
		<cfargument name="CPAPStudyPerformedAt3" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.hidden_UsersID = arguments.hidden_UsersID>
		<cfset variables.instance.hidden_TimeStart = arguments.hidden_TimeStart>
		<cfset variables.instance.OPTION_1_CBox_Delivery = arguments.OPTION_1_CBox_Delivery>
		<cfset variables.instance.OPTION_1_CBox_Pickup = arguments.OPTION_1_CBox_Pickup>
		<cfset variables.instance.OPTION_1_CBox_Repair = arguments.OPTION_1_CBox_Repair>
		<cfset variables.instance.OPTION_1_CBox_Switch = arguments.OPTION_1_CBox_Switch>
		<cfset variables.instance.OPTION_1_CBox_Existing = arguments.OPTION_1_CBox_Existing>
		<cfset variables.instance.OPTION_2_CBox_Facility = arguments.OPTION_2_CBox_Facility>
		<cfset variables.instance.OPTION_2_CBox_Hospice = arguments.OPTION_2_CBox_Hospice>
		<cfset variables.instance.OPTION_2_CBox_Hospital = arguments.OPTION_2_CBox_Hospital>
		<cfset variables.instance.facilityTBox = arguments.facilityTBox>
		<cfset variables.instance.hospiceTBox = arguments.hospiceTBox>
		<cfset variables.instance.OPTION_3_CBox_Medicare = arguments.OPTION_3_CBox_Medicare>
		<cfset variables.instance.OPTION_3_CBox_PrivateInsurance = arguments.OPTION_3_CBox_PrivateInsurance>
		<cfset variables.instance.OPTION_3_CBox_Medicaid = arguments.OPTION_3_CBox_Medicaid>
		<cfset variables.instance.OPTION_3_CBox_PrivatePay = arguments.OPTION_3_CBox_PrivatePay>
		<cfset variables.instance.hospitalTBox = arguments.hospitalTBox>
		<cfset variables.instance.DischargeDateMM = arguments.DischargeDateMM>
		<cfset variables.instance.DischargeDateDD = arguments.DischargeDateDD>
		<cfset variables.instance.DischargeDateYY = arguments.DischargeDateYY>
		<cfset variables.instance.typeOfPay_Radio = arguments.typeOfPay_Radio>
		<cfset variables.instance.callerNameTBox = arguments.callerNameTBox>
		<cfset variables.instance.callerPhoneTBox = arguments.callerPhoneTBox>
		<cfset variables.instance.patientNameTBox = arguments.patientNameTBox>
		<cfset variables.instance.roomNumberTBox = arguments.roomNumberTBox>
		<cfset variables.instance.bedNumberTBox = arguments.bedNumberTBox>
		<cfset variables.instance.patientAddressTBox = arguments.patientAddressTBox>
		<cfset variables.instance.patientCityTBox = arguments.patientCityTBox>
		<cfset variables.instance.patientStateTBox = arguments.patientStateTBox>
		<cfset variables.instance.patientZipTBox = arguments.patientZipTBox>
		<cfset variables.instance.patientPhoneTBox = arguments.patientPhoneTBox>
		<cfset variables.instance.patientDOBMM = arguments.patientDOBMM>
		<cfset variables.instance.patientDOBDD = arguments.patientDOBDD>
		<cfset variables.instance.patientDOBYY = arguments.patientDOBYY>
		<cfset variables.instance.patientSSNTBox = arguments.patientSSNTBox>
		<cfset variables.instance.patientHeightFeet = arguments.patientHeightFeet>
		<cfset variables.instance.patientHeightInches = arguments.patientHeightInches>
		<cfset variables.instance.patientWeightTBox = arguments.patientWeightTBox>
		<cfset variables.instance.alternateContactNameTBox = arguments.alternateContactNameTBox>
		<cfset variables.instance.alternateContactRelationshipTBox = arguments.alternateContactRelationshipTBox>
		<cfset variables.instance.alternateContactPhoneTBox = arguments.alternateContactPhoneTBox>
		<cfset variables.instance.hcpcCode1TBox = arguments.hcpcCode1TBox>
		<cfset variables.instance.hcpcQty1TBox = arguments.hcpcQty1TBox>
		<cfset variables.instance.hcpcProduct1TBox = arguments.hcpcProduct1TBox>
		<cfset variables.instance.hcpcDX1TBox = arguments.hcpcDX1TBox>
		<cfset variables.instance.hcpcDiagnosis1TBox = arguments.hcpcDiagnosis1TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear1TBox = arguments.hcpcLengthOfNeedYear1TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth1TBox = arguments.hcpcLengthOfNeedMonth1TBox>
		<cfset variables.instance.hcpcCode2TBox = arguments.hcpcCode2TBox>
		<cfset variables.instance.hcpcQty2TBox = arguments.hcpcQty2TBox>
		<cfset variables.instance.hcpcProduct2TBox = arguments.hcpcProduct2TBox>
		<cfset variables.instance.hcpcDX2TBox = arguments.hcpcDX2TBox>
		<cfset variables.instance.hcpcDiagnosis2TBox = arguments.hcpcDiagnosis2TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear2TBox = arguments.hcpcLengthOfNeedYear2TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth2TBox = arguments.hcpcLengthOfNeedMonth2TBox>
		<cfset variables.instance.hcpcCode3TBox = arguments.hcpcCode3TBox>
		<cfset variables.instance.hcpcQty3TBox = arguments.hcpcQty3TBox>
		<cfset variables.instance.hcpcProduct3TBox = arguments.hcpcProduct3TBox>
		<cfset variables.instance.hcpcDX3TBox = arguments.hcpcDX3TBox>
		<cfset variables.instance.hcpcDiagnosis3TBox = arguments.hcpcDiagnosis3TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear3TBox = arguments.hcpcLengthOfNeedYear3TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth3TBox = arguments.hcpcLengthOfNeedMonth3TBox>
		<cfset variables.instance.hcpcCode4TBox = arguments.hcpcCode4TBox>
		<cfset variables.instance.hcpcQty4TBox = arguments.hcpcQty4TBox>
		<cfset variables.instance.hcpcProduct4TBox = arguments.hcpcProduct4TBox>
		<cfset variables.instance.hcpcDX4TBox = arguments.hcpcDX4TBox>
		<cfset variables.instance.hcpcDiagnosis4TBox = arguments.hcpcDiagnosis4TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear4TBox = arguments.hcpcLengthOfNeedYear4TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth4TBox = arguments.hcpcLengthOfNeedMonth4TBox>
		<cfset variables.instance.hcpcCode5TBox = arguments.hcpcCode5TBox>
		<cfset variables.instance.hcpcQty5TBox = arguments.hcpcQty5TBox>
		<cfset variables.instance.hcpcProduct5TBox = arguments.hcpcProduct5TBox>
		<cfset variables.instance.hcpcDX5TBox = arguments.hcpcDX5TBox>
		<cfset variables.instance.hcpcDiagnosis5TBox = arguments.hcpcDiagnosis5TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear5TBox = arguments.hcpcLengthOfNeedYear5TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth5TBox = arguments.hcpcLengthOfNeedMonth5TBox>
		<cfset variables.instance.hcpcCode6TBox = arguments.hcpcCode6TBox>
		<cfset variables.instance.hcpcQty6TBox = arguments.hcpcQty6TBox>
		<cfset variables.instance.hcpcProduct6TBox = arguments.hcpcProduct6TBox>
		<cfset variables.instance.hcpcDX6TBox = arguments.hcpcDX6TBox>
		<cfset variables.instance.hcpcDiagnosis6TBox = arguments.hcpcDiagnosis6TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear6TBox = arguments.hcpcLengthOfNeedYear6TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth6TBox = arguments.hcpcLengthOfNeedMonth6TBox>
		<cfset variables.instance.hcpcCode7TBox = arguments.hcpcCode7TBox>
		<cfset variables.instance.hcpcQty7TBox = arguments.hcpcQty7TBox>
		<cfset variables.instance.hcpcProduct7TBox = arguments.hcpcProduct7TBox>
		<cfset variables.instance.hcpcDX7TBox = arguments.hcpcDX7TBox>
		<cfset variables.instance.hcpcDiagnosis7TBox = arguments.hcpcDiagnosis7TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear7TBox = arguments.hcpcLengthOfNeedYear7TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth7TBox = arguments.hcpcLengthOfNeedMonth7TBox>
		<cfset variables.instance.hcpcCode8TBox = arguments.hcpcCode8TBox>
		<cfset variables.instance.hcpcQty8TBox = arguments.hcpcQty8TBox>
		<cfset variables.instance.hcpcProduct8TBox = arguments.hcpcProduct8TBox>
		<cfset variables.instance.hcpcDX8TBox = arguments.hcpcDX8TBox>
		<cfset variables.instance.hcpcDiagnosis8TBox = arguments.hcpcDiagnosis8TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear8TBox = arguments.hcpcLengthOfNeedYear8TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth8TBox = arguments.hcpcLengthOfNeedMonth8TBox>
		<cfset variables.instance.hcpcCode9TBox = arguments.hcpcCode9TBox>
		<cfset variables.instance.hcpcQty9TBox = arguments.hcpcQty9TBox>
		<cfset variables.instance.hcpcProduct9TBox = arguments.hcpcProduct9TBox>
		<cfset variables.instance.hcpcDX9TBox = arguments.hcpcDX9TBox>
		<cfset variables.instance.hcpcDiagnosis9TBox = arguments.hcpcDiagnosis9TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear9TBox = arguments.hcpcLengthOfNeedYear9TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth9TBox = arguments.hcpcLengthOfNeedMonth9TBox>
		<cfset variables.instance.hcpcCode10TBox = arguments.hcpcCode10TBox>
		<cfset variables.instance.hcpcQty10TBox = arguments.hcpcQty10TBox>
		<cfset variables.instance.hcpcProduct10TBox = arguments.hcpcProduct10TBox>
		<cfset variables.instance.hcpcDX10TBox = arguments.hcpcDX10TBox>
		<cfset variables.instance.hcpcDiagnosis10TBox = arguments.hcpcDiagnosis10TBox>
		<cfset variables.instance.hcpcLengthOfNeedYear10TBox = arguments.hcpcLengthOfNeedYear10TBox>
		<cfset variables.instance.hcpcLengthOfNeedMonth10TBox = arguments.hcpcLengthOfNeedMonth10TBox>
		<cfset variables.instance.primaryInsuranceNameTBox = arguments.primaryInsuranceNameTBox>
		<cfset variables.instance.secondaryInsuranceNameTBox = arguments.secondaryInsuranceNameTBox>
		<cfset variables.instance.primaryPolicyNumberTBox = arguments.primaryPolicyNumberTBox>
		<cfset variables.instance.secondaryPolicyNumberTBox = arguments.secondaryPolicyNumberTBox>
		<cfset variables.instance.primaryGroupNumberTBox = arguments.primaryGroupNumberTBox>
		<cfset variables.instance.secondaryGroupNumberTBox = arguments.secondaryGroupNumberTBox>
		<cfset variables.instance.primaryPhoneNumberTBox = arguments.primaryPhoneNumberTBox>
		<cfset variables.instance.secondaryPhoneNumberTBox = arguments.secondaryPhoneNumberTBox>
		<cfset variables.instance.priEffectiveDateMM = arguments.priEffectiveDateMM>
		<cfset variables.instance.priEffectiveDateDD = arguments.priEffectiveDateDD>
		<cfset variables.instance.priEffectiveDateYY = arguments.priEffectiveDateYY>
		<cfset variables.instance.secEffectiveDateMM = arguments.secEffectiveDateMM>
		<cfset variables.instance.secEffectiveDateDD = arguments.secEffectiveDateDD>
		<cfset variables.instance.secEffectiveDateYY = arguments.secEffectiveDateYY>
		<cfset variables.instance.priPolicyHolderNameTBox = arguments.priPolicyHolderNameTBox>
		<cfset variables.instance.secPolicyHolderNameTBox = arguments.secPolicyHolderNameTBox>
		<cfset variables.instance.priHoldersDOBMM = arguments.priHoldersDOBMM>
		<cfset variables.instance.priHoldersDOBDD = arguments.priHoldersDOBDD>
		<cfset variables.instance.priHoldersDOBYY = arguments.priHoldersDOBYY>
		<cfset variables.instance.secHoldersDOBMM = arguments.secHoldersDOBMM>
		<cfset variables.instance.secHoldersDOBDD = arguments.secHoldersDOBDD>
		<cfset variables.instance.secHoldersDOBYY = arguments.secHoldersDOBYY>
		<cfset variables.instance.priPolicyHolderEmployerTBox = arguments.priPolicyHolderEmployerTBox>
		<cfset variables.instance.secPolicyHolderEmployerTBox = arguments.secPolicyHolderEmployerTBox>
		<cfset variables.instance.priNoteTBox = arguments.priNoteTBox>
		<cfset variables.instance.secNoteTBox = arguments.secNoteTBox>
		<cfset variables.instance.poNumberTBox = arguments.poNumberTBox>
		<cfset variables.instance.creditCardTypeTBox = arguments.creditCardTypeTBox>
		<cfset variables.instance.creditCardNumberTBox = arguments.creditCardNumberTBox>
		<cfset variables.instance.ccDateMM = arguments.ccDateMM>
		<cfset variables.instance.ccDateDD = arguments.ccDateDD>
		<cfset variables.instance.ccDateYY = arguments.ccDateYY>
		<cfset variables.instance.orderingPhysicianNameTBox = arguments.orderingPhysicianNameTBox>
		<cfset variables.instance.orderingPhysicianPhoneTBox = arguments.orderingPhysicianPhoneTBox>
		<cfset variables.instance.orderingPhysicianUPINTBox = arguments.orderingPhysicianUPINTBox>
		<cfset variables.instance.orderingPhysicianFaxTBox = arguments.orderingPhysicianFaxTBox>
		<cfset variables.instance.orderingPhysicianAddressTBox = arguments.orderingPhysicianAddressTBox>
		<cfset variables.instance.orderingPhysicianCityTBox = arguments.orderingPhysicianCityTBox>
		<cfset variables.instance.orderingPhysicianStateTBox = arguments.orderingPhysicianStateTBox>
		<cfset variables.instance.orderingPhysicianZipTBox = arguments.orderingPhysicianZipTBox>
		<cfset variables.instance.verificationRepNameTBox = arguments.verificationRepNameTBox>
		<cfset variables.instance.verificationDateMM = arguments.verificationDateMM>
		<cfset variables.instance.verificationDateDD = arguments.verificationDateDD>
		<cfset variables.instance.verificationDateYY = arguments.verificationDateYY>
		<cfset variables.instance.verificationTimeTBox = arguments.verificationTimeTBox>
		<cfset variables.instance.OPTION_4_CBox_VerificationHaveInsYes = arguments.OPTION_4_CBox_VerificationHaveInsYes>
		<cfset variables.instance.OPTION_4_CBox_VerificationHaveInsNo = arguments.OPTION_4_CBox_VerificationHaveInsNo>
		<cfset variables.instance.verificationHaveInsFromMM = arguments.verificationHaveInsFromMM>
		<cfset variables.instance.verificationHaveInsFromDD = arguments.verificationHaveInsFromDD>
		<cfset variables.instance.verificationHaveInsFromYY = arguments.verificationHaveInsFromYY>
		<cfset variables.instance.verificationHaveInsToMM = arguments.verificationHaveInsToMM>
		<cfset variables.instance.verificationHaveInsToDD = arguments.verificationHaveInsToDD>
		<cfset variables.instance.verificationHaveInsToYY = arguments.verificationHaveInsToYY>
		<cfset variables.instance.OPTION_5_CBox_VerificationHaveDMECovYes = arguments.OPTION_5_CBox_VerificationHaveDMECovYes>
		<cfset variables.instance.OPTION_5_CBox_VerificationHaveDMECovNo = arguments.OPTION_5_CBox_VerificationHaveDMECovNo>
		<cfset variables.instance.OPTION_6_CBox_VerificationDeductibleYes = arguments.OPTION_6_CBox_VerificationDeductibleYes>
		<cfset variables.instance.OPTION_6_CBox_VerificationDeductibleNo = arguments.OPTION_6_CBox_VerificationDeductibleNo>
		<cfset variables.instance.OPTION_7_CBox_VerificationDeductibleMetYes = arguments.OPTION_7_CBox_VerificationDeductibleMetYes>
		<cfset variables.instance.OPTION_7_CBox_VerificationDeductibleMetNo = arguments.OPTION_7_CBox_VerificationDeductibleMetNo>
		<cfset variables.instance.verificationDeductibleAmountTBox = arguments.verificationDeductibleAmountTBox>
		<cfset variables.instance.OPTION_8_CBox_VerificationPPOPolicyYes = arguments.OPTION_8_CBox_VerificationPPOPolicyYes>
		<cfset variables.instance.OPTION_8_CBox_VerificationPPOPolicyNo = arguments.OPTION_8_CBox_VerificationPPOPolicyNo>
		<cfset variables.instance.verificationPercentagePayAfterDeductibleTBox = arguments.verificationPercentagePayAfterDeductibleTBox>
		<cfset variables.instance.OPTION_9_CBox_VerificationPriorAuthYes = arguments.OPTION_9_CBox_VerificationPriorAuthYes>
		<cfset variables.instance.OPTION_9_CBox_VerificationPriorAuthNo = arguments.OPTION_9_CBox_VerificationPriorAuthNo>
		<cfset variables.instance.verificationAuthNumberTBox = arguments.verificationAuthNumberTBox>
		<cfset variables.instance.OPTION_10_CBox_VerificationLifetimeBenefitMetYes = arguments.OPTION_10_CBox_VerificationLifetimeBenefitMetYes>
		<cfset variables.instance.OPTION_10_CBox_VerificationLifetimeBenefitMetNo = arguments.OPTION_10_CBox_VerificationLifetimeBenefitMetNo>
		<cfset variables.instance.verificationAuthPhoneNumberTBox = arguments.verificationAuthPhoneNumberTBox>
		<cfset variables.instance.OPTION_11_CBox_VerificationInsFollowMedicareYes = arguments.OPTION_11_CBox_VerificationInsFollowMedicareYes>
		<cfset variables.instance.OPTION_11_CBox_VerificationInsFollowMedicareNo = arguments.OPTION_11_CBox_VerificationInsFollowMedicareNo>
		<cfset variables.instance.OPTION_12_CBox_VerificationMedicaidPlanMQMB = arguments.OPTION_12_CBox_VerificationMedicaidPlanMQMB>
		<cfset variables.instance.OPTION_12_CBox_VerificationMedicaidPlanQMB = arguments.OPTION_12_CBox_VerificationMedicaidPlanQMB>
		<cfset variables.instance.OPTION_12_CBox_VerificationMedicaidPlanTraditional = arguments.OPTION_12_CBox_VerificationMedicaidPlanTraditional>
		<cfset variables.instance.VerificationTypeBasePlanTBox = arguments.VerificationTypeBasePlanTBox>
		<cfset variables.instance.OPTION_13_CBox_PastEquipmentYes = arguments.OPTION_13_CBox_PastEquipmentYes>
		<cfset variables.instance.OPTION_13_CBox_PastEquipmentNo = arguments.OPTION_13_CBox_PastEquipmentNo>
		<cfset variables.instance.Equipment1TypeTBox = arguments.Equipment1TypeTBox>
		<cfset variables.instance.Equipment1RentPurchasedSelect = arguments.Equipment1RentPurchasedSelect>
		<cfset variables.instance.Equipment1FromMM = arguments.Equipment1FromMM>
		<cfset variables.instance.Equipment1FromDD = arguments.Equipment1FromDD>
		<cfset variables.instance.Equipment1FromYY = arguments.Equipment1FromYY>
		<cfset variables.instance.Equipment1ToMM = arguments.Equipment1ToMM>
		<cfset variables.instance.Equipment1ToDD = arguments.Equipment1ToDD>
		<cfset variables.instance.Equipment1ToYY = arguments.Equipment1ToYY>
		<cfset variables.instance.Equipment1SupplierNameTBox = arguments.Equipment1SupplierNameTBox>
		<cfset variables.instance.Equipment1SupplierTelephoneTBox = arguments.Equipment1SupplierTelephoneTBox>
		<cfset variables.instance.Equipment2TypeTBox = arguments.Equipment2TypeTBox>
		<cfset variables.instance.Equipment2RentPurchasedSelect = arguments.Equipment2RentPurchasedSelect>
		<cfset variables.instance.Equipment2FromMM = arguments.Equipment2FromMM>
		<cfset variables.instance.Equipment2FromDD = arguments.Equipment2FromDD>
		<cfset variables.instance.Equipment2FromYY = arguments.Equipment2FromYY>
		<cfset variables.instance.Equipment2ToMM = arguments.Equipment2ToMM>
		<cfset variables.instance.Equipment2ToDD = arguments.Equipment2ToDD>
		<cfset variables.instance.Equipment2ToYY = arguments.Equipment2ToYY>
		<cfset variables.instance.Equipment2SupplierNameTBox = arguments.Equipment2SupplierNameTBox>
		<cfset variables.instance.Equipment2SupplierTelephoneTBox = arguments.Equipment2SupplierTelephoneTBox>
		<cfset variables.instance.Equipment3TypeTBox = arguments.Equipment3TypeTBox>
		<cfset variables.instance.Equipment3RentPurchasedSelect = arguments.Equipment3RentPurchasedSelect>
		<cfset variables.instance.Equipment3FromMM = arguments.Equipment3FromMM>
		<cfset variables.instance.Equipment3FromDD = arguments.Equipment3FromDD>
		<cfset variables.instance.Equipment3FromYY = arguments.Equipment3FromYY>
		<cfset variables.instance.Equipment3ToMM = arguments.Equipment3ToMM>
		<cfset variables.instance.Equipment3ToDD = arguments.Equipment3ToDD>
		<cfset variables.instance.Equipment3ToYY = arguments.Equipment3ToYY>
		<cfset variables.instance.Equipment3SupplierNameTBox = arguments.Equipment3SupplierNameTBox>
		<cfset variables.instance.Equipment3SupplierTelephoneTBox = arguments.Equipment3SupplierTelephoneTBox>
		<cfset variables.instance.Equipment4TypeTBox = arguments.Equipment4TypeTBox>
		<cfset variables.instance.Equipment4RentPurchasedSelect = arguments.Equipment4RentPurchasedSelect>
		<cfset variables.instance.Equipment4FromMM = arguments.Equipment4FromMM>
		<cfset variables.instance.Equipment4FromDD = arguments.Equipment4FromDD>
		<cfset variables.instance.Equipment4FromYY = arguments.Equipment4FromYY>
		<cfset variables.instance.Equipment4ToMM = arguments.Equipment4ToMM>
		<cfset variables.instance.Equipment4ToDD = arguments.Equipment4ToDD>
		<cfset variables.instance.Equipment4ToYY = arguments.Equipment4ToYY>
		<cfset variables.instance.Equipment4SupplierNameTBox = arguments.Equipment4SupplierNameTBox>
		<cfset variables.instance.Equipment4SupplierTelephoneTBox = arguments.Equipment4SupplierTelephoneTBox>
		<cfset variables.instance.Equipment5TypeTBox = arguments.Equipment5TypeTBox>
		<cfset variables.instance.Equipment5RentPurchasedSelect = arguments.Equipment5RentPurchasedSelect>
		<cfset variables.instance.Equipment5FromMM = arguments.Equipment5FromMM>
		<cfset variables.instance.Equipment5FromDD = arguments.Equipment5FromDD>
		<cfset variables.instance.Equipment5FromYY = arguments.Equipment5FromYY>
		<cfset variables.instance.Equipment5ToMM = arguments.Equipment5ToMM>
		<cfset variables.instance.Equipment5ToDD = arguments.Equipment5ToDD>
		<cfset variables.instance.Equipment5ToYY = arguments.Equipment5ToYY>
		<cfset variables.instance.Equipment5SupplierNameTBox = arguments.Equipment5SupplierNameTBox>
		<cfset variables.instance.Equipment5SupplierTelephoneTBox = arguments.Equipment5SupplierTelephoneTBox>
		<cfset variables.instance.OPTION_14_CBox_OxygenPAo2 = arguments.OPTION_14_CBox_OxygenPAo2>
		<cfset variables.instance.OPTION_14_CBox_OxygenSAo2 = arguments.OPTION_14_CBox_OxygenSAo2>
		<cfset variables.instance.OPTION_14_CBox_OxygenSPo2 = arguments.OPTION_14_CBox_OxygenSPo2>
		<cfset variables.instance.OxygenPAO2TBox = arguments.OxygenPAO2TBox>
		<cfset variables.instance.OxygenSAO2TBox = arguments.OxygenSAO2TBox>
		<cfset variables.instance.CPAPStudy_CBox = arguments.CPAPStudy_CBox>
		<cfset variables.instance.CPAPStudyNote = arguments.CPAPStudyNote>
		<cfset variables.instance.OxygenSPO2TBox = arguments.OxygenSPO2TBox>
		<cfset variables.instance.CPAPStudyOnFile_CBox = arguments.CPAPStudyOnFile_CBox>
		<cfset variables.instance.CPAPStudyOnFileNote = arguments.CPAPStudyOnFileNote>
		<cfset variables.instance.LabTestDateMM = arguments.LabTestDateMM>
		<cfset variables.instance.LabTestDateDD = arguments.LabTestDateDD>
		<cfset variables.instance.LabTestDateYY = arguments.LabTestDateYY>
		<cfset variables.instance.CPAPStudyPerformedAt = arguments.CPAPStudyPerformedAt>
		<cfset variables.instance.LabTestFacilityTBox = arguments.LabTestFacilityTBox>
		<cfset variables.instance.CPAPStudyPerformedAt2 = arguments.CPAPStudyPerformedAt2>
		<cfset variables.instance.CPAPStudyPerformedAt3 = arguments.CPAPStudyPerformedAt3>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="INTAKE_PatientIntakeFormIO" output="No">
		
		<cfargument name="recordID" required="yes" type="numeric">		
		<cfset var qGetINTAKE_PatientIntakeForm = "">
		
		<cfset preInit(recordID)>
	
		<cfquery name="qGetINTAKE_PatientIntakeForm" datasource="#request.datasource#">
	  		SELECT recordID,hidden_UsersID,hidden_TimeStart,OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing,OPTION_2_CBox_Facility,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital,facilityTBox,hospiceTBox,OPTION_3_CBox_Medicare,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay,hospitalTBox,DischargeDateMM,DischargeDateDD,DischargeDateYY,typeOfPay_Radio,callerNameTBox,callerPhoneTBox,patientNameTBox,roomNumberTBox,bedNumberTBox,patientAddressTBox,patientCityTBox,patientStateTBox,patientZipTBox,patientPhoneTBox,patientDOBMM,patientDOBDD,patientDOBYY,patientSSNTBox,patientHeightFeet,patientHeightInches,patientWeightTBox,alternateContactNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,hcpcCode1TBox,hcpcQty1TBox,hcpcProduct1TBox,hcpcDX1TBox,hcpcDiagnosis1TBox,hcpcLengthOfNeedYear1TBox,hcpcLengthOfNeedMonth1TBox,hcpcCode2TBox,hcpcQty2TBox,hcpcProduct2TBox,hcpcDX2TBox,hcpcDiagnosis2TBox,hcpcLengthOfNeedYear2TBox,hcpcLengthOfNeedMonth2TBox,hcpcCode3TBox,hcpcQty3TBox,hcpcProduct3TBox,hcpcDX3TBox,hcpcDiagnosis3TBox,hcpcLengthOfNeedYear3TBox,hcpcLengthOfNeedMonth3TBox,hcpcCode4TBox,hcpcQty4TBox,hcpcProduct4TBox,hcpcDX4TBox,hcpcDiagnosis4TBox,hcpcLengthOfNeedYear4TBox,hcpcLengthOfNeedMonth4TBox,hcpcCode5TBox,hcpcQty5TBox,hcpcProduct5TBox,hcpcDX5TBox,hcpcDiagnosis5TBox,hcpcLengthOfNeedYear5TBox,hcpcLengthOfNeedMonth5TBox,hcpcCode6TBox,hcpcQty6TBox,hcpcProduct6TBox,hcpcDX6TBox,hcpcDiagnosis6TBox,hcpcLengthOfNeedYear6TBox,hcpcLengthOfNeedMonth6TBox,hcpcCode7TBox,hcpcQty7TBox,hcpcProduct7TBox,hcpcDX7TBox,hcpcDiagnosis7TBox,hcpcLengthOfNeedYear7TBox,hcpcLengthOfNeedMonth7TBox,hcpcCode8TBox,hcpcQty8TBox,hcpcProduct8TBox,hcpcDX8TBox,hcpcDiagnosis8TBox,hcpcLengthOfNeedYear8TBox,hcpcLengthOfNeedMonth8TBox,hcpcCode9TBox,hcpcQty9TBox,hcpcProduct9TBox,hcpcDX9TBox,hcpcDiagnosis9TBox,hcpcLengthOfNeedYear9TBox,hcpcLengthOfNeedMonth9TBox,hcpcCode10TBox,hcpcQty10TBox,hcpcProduct10TBox,hcpcDX10TBox,hcpcDiagnosis10TBox,hcpcLengthOfNeedYear10TBox,hcpcLengthOfNeedMonth10TBox,primaryInsuranceNameTBox,secondaryInsuranceNameTBox,primaryPolicyNumberTBox,secondaryPolicyNumberTBox,primaryGroupNumberTBox,secondaryGroupNumberTBox,primaryPhoneNumberTBox,secondaryPhoneNumberTBox,priEffectiveDateMM,priEffectiveDateDD,priEffectiveDateYY,secEffectiveDateMM,secEffectiveDateDD,secEffectiveDateYY,priPolicyHolderNameTBox,secPolicyHolderNameTBox,priHoldersDOBMM,priHoldersDOBDD,priHoldersDOBYY,secHoldersDOBMM,secHoldersDOBDD,secHoldersDOBYY,priPolicyHolderEmployerTBox,secPolicyHolderEmployerTBox,priNoteTBox,secNoteTBox,poNumberTBox,creditCardTypeTBox,creditCardNumberTBox,ccDateMM,ccDateDD,ccDateYY,orderingPhysicianNameTBox,orderingPhysicianPhoneTBox,orderingPhysicianUPINTBox,orderingPhysicianFaxTBox,orderingPhysicianAddressTBox,orderingPhysicianCityTBox,orderingPhysicianStateTBox,orderingPhysicianZipTBox,verificationRepNameTBox,verificationDateMM,verificationDateDD,verificationDateYY,verificationTimeTBox,OPTION_4_CBox_VerificationHaveInsYes,OPTION_4_CBox_VerificationHaveInsNo,verificationHaveInsFromMM,verificationHaveInsFromDD,verificationHaveInsFromYY,verificationHaveInsToMM,verificationHaveInsToDD,verificationHaveInsToYY,OPTION_5_CBox_VerificationHaveDMECovYes,OPTION_5_CBox_VerificationHaveDMECovNo,OPTION_6_CBox_VerificationDeductibleYes,OPTION_6_CBox_VerificationDeductibleNo,OPTION_7_CBox_VerificationDeductibleMetYes,OPTION_7_CBox_VerificationDeductibleMetNo,verificationDeductibleAmountTBox,OPTION_8_CBox_VerificationPPOPolicyYes,OPTION_8_CBox_VerificationPPOPolicyNo,verificationPercentagePayAfterDeductibleTBox,OPTION_9_CBox_VerificationPriorAuthYes,OPTION_9_CBox_VerificationPriorAuthNo,verificationAuthNumberTBox,OPTION_10_CBox_VerificationLifetimeBenefitMetYes,OPTION_10_CBox_VerificationLifetimeBenefitMetNo,verificationAuthPhoneNumberTBox,OPTION_11_CBox_VerificationInsFollowMedicareYes,OPTION_11_CBox_VerificationInsFollowMedicareNo,OPTION_12_CBox_VerificationMedicaidPlanMQMB,OPTION_12_CBox_VerificationMedicaidPlanQMB,OPTION_12_CBox_VerificationMedicaidPlanTraditional,VerificationTypeBasePlanTBox,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo,Equipment1TypeTBox,Equipment1RentPurchasedSelect,Equipment1FromMM,Equipment1FromDD,Equipment1FromYY,Equipment1ToMM,Equipment1ToDD,Equipment1ToYY,Equipment1SupplierNameTBox,Equipment1SupplierTelephoneTBox,Equipment2TypeTBox,Equipment2RentPurchasedSelect,Equipment2FromMM,Equipment2FromDD,Equipment2FromYY,Equipment2ToMM,Equipment2ToDD,Equipment2ToYY,Equipment2SupplierNameTBox,Equipment2SupplierTelephoneTBox,Equipment3TypeTBox,Equipment3RentPurchasedSelect,Equipment3FromMM,Equipment3FromDD,Equipment3FromYY,Equipment3ToMM,Equipment3ToDD,Equipment3ToYY,Equipment3SupplierNameTBox,Equipment3SupplierTelephoneTBox,Equipment4TypeTBox,Equipment4RentPurchasedSelect,Equipment4FromMM,Equipment4FromDD,Equipment4FromYY,Equipment4ToMM,Equipment4ToDD,Equipment4ToYY,Equipment4SupplierNameTBox,Equipment4SupplierTelephoneTBox,Equipment5TypeTBox,Equipment5RentPurchasedSelect,Equipment5FromMM,Equipment5FromDD,Equipment5FromYY,Equipment5ToMM,Equipment5ToDD,Equipment5ToYY,Equipment5SupplierNameTBox,Equipment5SupplierTelephoneTBox,OPTION_14_CBox_OxygenPAo2,OPTION_14_CBox_OxygenSAo2,OPTION_14_CBox_OxygenSPo2,OxygenPAO2TBox,OxygenSAO2TBox,CPAPStudy_CBox,CPAPStudyNote,OxygenSPO2TBox,CPAPStudyOnFile_CBox,CPAPStudyOnFileNote,LabTestDateMM,LabTestDateDD,LabTestDateYY,CPAPStudyPerformedAt,LabTestFacilityTBox,CPAPStudyPerformedAt2,CPAPStudyPerformedAt3,Active,InactiveCode,DateCreated,DateModified
			FROM INTAKE_PatientIntakeForm  
			WHERE recordID = #trim(arguments.recordID)# 
		</cfquery>
		
		<cfif qGetINTAKE_PatientIntakeForm.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetINTAKE_PatientIntakeForm.recordID EQ "" OR qGetINTAKE_PatientIntakeForm.recordID EQ "NULL") 
				variables.instance.recordID = "NULL"; 
			ELSE 
				variables.instance.recordID = qGetINTAKE_PatientIntakeForm.recordID;
							
				variables.instance.hidden_UsersID = qGetINTAKE_PatientIntakeForm.hidden_UsersID;
							
				variables.instance.hidden_TimeStart = qGetINTAKE_PatientIntakeForm.hidden_TimeStart;
							
				variables.instance.OPTION_1_CBox_Delivery = qGetINTAKE_PatientIntakeForm.OPTION_1_CBox_Delivery;
							
				variables.instance.OPTION_1_CBox_Pickup = qGetINTAKE_PatientIntakeForm.OPTION_1_CBox_Pickup;
							
				variables.instance.OPTION_1_CBox_Repair = qGetINTAKE_PatientIntakeForm.OPTION_1_CBox_Repair;
							
				variables.instance.OPTION_1_CBox_Switch = qGetINTAKE_PatientIntakeForm.OPTION_1_CBox_Switch;
							
				variables.instance.OPTION_1_CBox_Existing = qGetINTAKE_PatientIntakeForm.OPTION_1_CBox_Existing;
							
				variables.instance.OPTION_2_CBox_Facility = qGetINTAKE_PatientIntakeForm.OPTION_2_CBox_Facility;
							
				variables.instance.OPTION_2_CBox_Hospice = qGetINTAKE_PatientIntakeForm.OPTION_2_CBox_Hospice;
							
				variables.instance.OPTION_2_CBox_Hospital = qGetINTAKE_PatientIntakeForm.OPTION_2_CBox_Hospital;
							
				variables.instance.facilityTBox = qGetINTAKE_PatientIntakeForm.facilityTBox;
							
				variables.instance.hospiceTBox = qGetINTAKE_PatientIntakeForm.hospiceTBox;
							
				variables.instance.OPTION_3_CBox_Medicare = qGetINTAKE_PatientIntakeForm.OPTION_3_CBox_Medicare;
							
				variables.instance.OPTION_3_CBox_PrivateInsurance = qGetINTAKE_PatientIntakeForm.OPTION_3_CBox_PrivateInsurance;
							
				variables.instance.OPTION_3_CBox_Medicaid = qGetINTAKE_PatientIntakeForm.OPTION_3_CBox_Medicaid;
							
				variables.instance.OPTION_3_CBox_PrivatePay = qGetINTAKE_PatientIntakeForm.OPTION_3_CBox_PrivatePay;
							
				variables.instance.hospitalTBox = qGetINTAKE_PatientIntakeForm.hospitalTBox;
							
				variables.instance.DischargeDateMM = qGetINTAKE_PatientIntakeForm.DischargeDateMM;
							
				variables.instance.DischargeDateDD = qGetINTAKE_PatientIntakeForm.DischargeDateDD;
							
				variables.instance.DischargeDateYY = qGetINTAKE_PatientIntakeForm.DischargeDateYY;
							
				variables.instance.typeOfPay_Radio = qGetINTAKE_PatientIntakeForm.typeOfPay_Radio;
							
				variables.instance.callerNameTBox = qGetINTAKE_PatientIntakeForm.callerNameTBox;
							
				variables.instance.callerPhoneTBox = qGetINTAKE_PatientIntakeForm.callerPhoneTBox;
							
				variables.instance.patientNameTBox = qGetINTAKE_PatientIntakeForm.patientNameTBox;
							
				variables.instance.roomNumberTBox = qGetINTAKE_PatientIntakeForm.roomNumberTBox;
							
				variables.instance.bedNumberTBox = qGetINTAKE_PatientIntakeForm.bedNumberTBox;
							
				variables.instance.patientAddressTBox = qGetINTAKE_PatientIntakeForm.patientAddressTBox;
							
				variables.instance.patientCityTBox = qGetINTAKE_PatientIntakeForm.patientCityTBox;
							
				variables.instance.patientStateTBox = qGetINTAKE_PatientIntakeForm.patientStateTBox;
							
				variables.instance.patientZipTBox = qGetINTAKE_PatientIntakeForm.patientZipTBox;
							
				variables.instance.patientPhoneTBox = qGetINTAKE_PatientIntakeForm.patientPhoneTBox;
							
				variables.instance.patientDOBMM = qGetINTAKE_PatientIntakeForm.patientDOBMM;
							
				variables.instance.patientDOBDD = qGetINTAKE_PatientIntakeForm.patientDOBDD;
							
				variables.instance.patientDOBYY = qGetINTAKE_PatientIntakeForm.patientDOBYY;
							
				variables.instance.patientSSNTBox = qGetINTAKE_PatientIntakeForm.patientSSNTBox;
							
				variables.instance.patientHeightFeet = qGetINTAKE_PatientIntakeForm.patientHeightFeet;
							
				variables.instance.patientHeightInches = qGetINTAKE_PatientIntakeForm.patientHeightInches;
							
				variables.instance.patientWeightTBox = qGetINTAKE_PatientIntakeForm.patientWeightTBox;
							
				variables.instance.alternateContactNameTBox = qGetINTAKE_PatientIntakeForm.alternateContactNameTBox;
							
				variables.instance.alternateContactRelationshipTBox = qGetINTAKE_PatientIntakeForm.alternateContactRelationshipTBox;
							
				variables.instance.alternateContactPhoneTBox = qGetINTAKE_PatientIntakeForm.alternateContactPhoneTBox;
							
				variables.instance.hcpcCode1TBox = qGetINTAKE_PatientIntakeForm.hcpcCode1TBox;
							
				variables.instance.hcpcQty1TBox = qGetINTAKE_PatientIntakeForm.hcpcQty1TBox;
							
				variables.instance.hcpcProduct1TBox = qGetINTAKE_PatientIntakeForm.hcpcProduct1TBox;
							
				variables.instance.hcpcDX1TBox = qGetINTAKE_PatientIntakeForm.hcpcDX1TBox;
							
				variables.instance.hcpcDiagnosis1TBox = qGetINTAKE_PatientIntakeForm.hcpcDiagnosis1TBox;
							
				variables.instance.hcpcLengthOfNeedYear1TBox = qGetINTAKE_PatientIntakeForm.hcpcLengthOfNeedYear1TBox;
							
				variables.instance.hcpcLengthOfNeedMonth1TBox = qGetINTAKE_PatientIntakeForm.hcpcLengthOfNeedMonth1TBox;
							
				variables.instance.hcpcCode2TBox = qGetINTAKE_PatientIntakeForm.hcpcCode2TBox;
							
				variables.instance.hcpcQty2TBox = qGetINTAKE_PatientIntakeForm.hcpcQty2TBox;
							
				variables.instance.hcpcProduct2TBox = qGetINTAKE_PatientIntakeForm.hcpcProduct2TBox;
							
				variables.instance.hcpcDX2TBox = qGetINTAKE_PatientIntakeForm.hcpcDX2TBox;
							
				variables.instance.hcpcDiagnosis2TBox = qGetINTAKE_PatientIntakeForm.hcpcDiagnosis2TBox;
							
				variables.instance.hcpcLengthOfNeedYear2TBox = qGetINTAKE_PatientIntakeForm.hcpcLengthOfNeedYear2TBox;
							
				variables.instance.hcpcLengthOfNeedMonth2TBox = qGetINTAKE_PatientIntakeForm.hcpcLengthOfNeedMonth2TBox;
							
				variables.instance.hcpcCode3TBox = qGetINTAKE_PatientIntakeForm.hcpcCode3TBox;
							
				variables.instance.hcpcQty3TBox = qGetINTAKE_PatientIntakeForm.hcpcQty3TBox;
							
				variables.instance.hcpcProduct3TBox = qGetINTAKE_PatientIntakeForm.hcpcProduct3TBox;
							
				variables.instance.hcpcDX3TBox = qGetINTAKE_PatientIntakeForm.hcpcDX3TBox;
							
				variables.instance.hcpcDiagnosis3TBox = qGetINTAKE_PatientIntakeForm.hcpcDiagnosis3TBox;
							
				variables.instance.hcpcLengthOfNeedYear3TBox = qGetINTAKE_PatientIntakeForm.hcpcLengthOfNeedYear3TBox;
							
				variables.instance.hcpcLengthOfNeedMonth3TBox = qGetINTAKE_PatientIntakeForm.hcpcLengthOfNeedMonth3TBox;
							
				variables.instance.hcpcCode4TBox = qGetINTAKE_PatientIntakeForm.hcpcCode4TBox;
							
				variables.instance.hcpcQty4TBox = qGetINTAKE_PatientIntakeForm.hcpcQty4TBox;
							
				variables.instance.hcpcProduct4TBox = qGetINTAKE_PatientIntakeForm.hcpcProduct4TBox;
							
				variables.instance.hcpcDX4TBox = qGetINTAKE_PatientIntakeForm.hcpcDX4TBox;
							
				variables.instance.hcpcDiagnosis4TBox = qGetINTAKE_PatientIntakeForm.hcpcDiagnosis4TBox;
							
				variables.instance.hcpcLengthOfNeedYear4TBox = qGetINTAKE_PatientIntakeForm.hcpcLengthOfNeedYear4TBox;
							
				variables.instance.hcpcLengthOfNeedMonth4TBox = qGetINTAKE_PatientIntakeForm.hcpcLengthOfNeedMonth4TBox;
							
				variables.instance.hcpcCode5TBox = qGetINTAKE_PatientIntakeForm.hcpcCode5TBox;
							
				variables.instance.hcpcQty5TBox = qGetINTAKE_PatientIntakeForm.hcpcQty5TBox;
							
				variables.instance.hcpcProduct5TBox = qGetINTAKE_PatientIntakeForm.hcpcProduct5TBox;
							
				variables.instance.hcpcDX5TBox = qGetINTAKE_PatientIntakeForm.hcpcDX5TBox;
							
				variables.instance.hcpcDiagnosis5TBox = qGetINTAKE_PatientIntakeForm.hcpcDiagnosis5TBox;
							
				variables.instance.hcpcLengthOfNeedYear5TBox = qGetINTAKE_PatientIntakeForm.hcpcLengthOfNeedYear5TBox;
							
				variables.instance.hcpcLengthOfNeedMonth5TBox = qGetINTAKE_PatientIntakeForm.hcpcLengthOfNeedMonth5TBox;
							
				variables.instance.hcpcCode6TBox = qGetINTAKE_PatientIntakeForm.hcpcCode6TBox;
							
				variables.instance.hcpcQty6TBox = qGetINTAKE_PatientIntakeForm.hcpcQty6TBox;
							
				variables.instance.hcpcProduct6TBox = qGetINTAKE_PatientIntakeForm.hcpcProduct6TBox;
							
				variables.instance.hcpcDX6TBox = qGetINTAKE_PatientIntakeForm.hcpcDX6TBox;
							
				variables.instance.hcpcDiagnosis6TBox = qGetINTAKE_PatientIntakeForm.hcpcDiagnosis6TBox;
							
				variables.instance.hcpcLengthOfNeedYear6TBox = qGetINTAKE_PatientIntakeForm.hcpcLengthOfNeedYear6TBox;
							
				variables.instance.hcpcLengthOfNeedMonth6TBox = qGetINTAKE_PatientIntakeForm.hcpcLengthOfNeedMonth6TBox;
							
				variables.instance.hcpcCode7TBox = qGetINTAKE_PatientIntakeForm.hcpcCode7TBox;
							
				variables.instance.hcpcQty7TBox = qGetINTAKE_PatientIntakeForm.hcpcQty7TBox;
							
				variables.instance.hcpcProduct7TBox = qGetINTAKE_PatientIntakeForm.hcpcProduct7TBox;
							
				variables.instance.hcpcDX7TBox = qGetINTAKE_PatientIntakeForm.hcpcDX7TBox;
							
				variables.instance.hcpcDiagnosis7TBox = qGetINTAKE_PatientIntakeForm.hcpcDiagnosis7TBox;
							
				variables.instance.hcpcLengthOfNeedYear7TBox = qGetINTAKE_PatientIntakeForm.hcpcLengthOfNeedYear7TBox;
							
				variables.instance.hcpcLengthOfNeedMonth7TBox = qGetINTAKE_PatientIntakeForm.hcpcLengthOfNeedMonth7TBox;
							
				variables.instance.hcpcCode8TBox = qGetINTAKE_PatientIntakeForm.hcpcCode8TBox;
							
				variables.instance.hcpcQty8TBox = qGetINTAKE_PatientIntakeForm.hcpcQty8TBox;
							
				variables.instance.hcpcProduct8TBox = qGetINTAKE_PatientIntakeForm.hcpcProduct8TBox;
							
				variables.instance.hcpcDX8TBox = qGetINTAKE_PatientIntakeForm.hcpcDX8TBox;
							
				variables.instance.hcpcDiagnosis8TBox = qGetINTAKE_PatientIntakeForm.hcpcDiagnosis8TBox;
							
				variables.instance.hcpcLengthOfNeedYear8TBox = qGetINTAKE_PatientIntakeForm.hcpcLengthOfNeedYear8TBox;
							
				variables.instance.hcpcLengthOfNeedMonth8TBox = qGetINTAKE_PatientIntakeForm.hcpcLengthOfNeedMonth8TBox;
							
				variables.instance.hcpcCode9TBox = qGetINTAKE_PatientIntakeForm.hcpcCode9TBox;
							
				variables.instance.hcpcQty9TBox = qGetINTAKE_PatientIntakeForm.hcpcQty9TBox;
							
				variables.instance.hcpcProduct9TBox = qGetINTAKE_PatientIntakeForm.hcpcProduct9TBox;
							
				variables.instance.hcpcDX9TBox = qGetINTAKE_PatientIntakeForm.hcpcDX9TBox;
							
				variables.instance.hcpcDiagnosis9TBox = qGetINTAKE_PatientIntakeForm.hcpcDiagnosis9TBox;
							
				variables.instance.hcpcLengthOfNeedYear9TBox = qGetINTAKE_PatientIntakeForm.hcpcLengthOfNeedYear9TBox;
							
				variables.instance.hcpcLengthOfNeedMonth9TBox = qGetINTAKE_PatientIntakeForm.hcpcLengthOfNeedMonth9TBox;
							
				variables.instance.hcpcCode10TBox = qGetINTAKE_PatientIntakeForm.hcpcCode10TBox;
							
				variables.instance.hcpcQty10TBox = qGetINTAKE_PatientIntakeForm.hcpcQty10TBox;
							
				variables.instance.hcpcProduct10TBox = qGetINTAKE_PatientIntakeForm.hcpcProduct10TBox;
							
				variables.instance.hcpcDX10TBox = qGetINTAKE_PatientIntakeForm.hcpcDX10TBox;
							
				variables.instance.hcpcDiagnosis10TBox = qGetINTAKE_PatientIntakeForm.hcpcDiagnosis10TBox;
							
				variables.instance.hcpcLengthOfNeedYear10TBox = qGetINTAKE_PatientIntakeForm.hcpcLengthOfNeedYear10TBox;
							
				variables.instance.hcpcLengthOfNeedMonth10TBox = qGetINTAKE_PatientIntakeForm.hcpcLengthOfNeedMonth10TBox;
							
				variables.instance.primaryInsuranceNameTBox = qGetINTAKE_PatientIntakeForm.primaryInsuranceNameTBox;
							
				variables.instance.secondaryInsuranceNameTBox = qGetINTAKE_PatientIntakeForm.secondaryInsuranceNameTBox;
							
				variables.instance.primaryPolicyNumberTBox = qGetINTAKE_PatientIntakeForm.primaryPolicyNumberTBox;
							
				variables.instance.secondaryPolicyNumberTBox = qGetINTAKE_PatientIntakeForm.secondaryPolicyNumberTBox;
							
				variables.instance.primaryGroupNumberTBox = qGetINTAKE_PatientIntakeForm.primaryGroupNumberTBox;
							
				variables.instance.secondaryGroupNumberTBox = qGetINTAKE_PatientIntakeForm.secondaryGroupNumberTBox;
							
				variables.instance.primaryPhoneNumberTBox = qGetINTAKE_PatientIntakeForm.primaryPhoneNumberTBox;
							
				variables.instance.secondaryPhoneNumberTBox = qGetINTAKE_PatientIntakeForm.secondaryPhoneNumberTBox;
							
				variables.instance.priEffectiveDateMM = qGetINTAKE_PatientIntakeForm.priEffectiveDateMM;
							
				variables.instance.priEffectiveDateDD = qGetINTAKE_PatientIntakeForm.priEffectiveDateDD;
							
				variables.instance.priEffectiveDateYY = qGetINTAKE_PatientIntakeForm.priEffectiveDateYY;
							
				variables.instance.secEffectiveDateMM = qGetINTAKE_PatientIntakeForm.secEffectiveDateMM;
							
				variables.instance.secEffectiveDateDD = qGetINTAKE_PatientIntakeForm.secEffectiveDateDD;
							
				variables.instance.secEffectiveDateYY = qGetINTAKE_PatientIntakeForm.secEffectiveDateYY;
							
				variables.instance.priPolicyHolderNameTBox = qGetINTAKE_PatientIntakeForm.priPolicyHolderNameTBox;
							
				variables.instance.secPolicyHolderNameTBox = qGetINTAKE_PatientIntakeForm.secPolicyHolderNameTBox;
							
				variables.instance.priHoldersDOBMM = qGetINTAKE_PatientIntakeForm.priHoldersDOBMM;
							
				variables.instance.priHoldersDOBDD = qGetINTAKE_PatientIntakeForm.priHoldersDOBDD;
							
				variables.instance.priHoldersDOBYY = qGetINTAKE_PatientIntakeForm.priHoldersDOBYY;
							
				variables.instance.secHoldersDOBMM = qGetINTAKE_PatientIntakeForm.secHoldersDOBMM;
							
				variables.instance.secHoldersDOBDD = qGetINTAKE_PatientIntakeForm.secHoldersDOBDD;
							
				variables.instance.secHoldersDOBYY = qGetINTAKE_PatientIntakeForm.secHoldersDOBYY;
							
				variables.instance.priPolicyHolderEmployerTBox = qGetINTAKE_PatientIntakeForm.priPolicyHolderEmployerTBox;
							
				variables.instance.secPolicyHolderEmployerTBox = qGetINTAKE_PatientIntakeForm.secPolicyHolderEmployerTBox;
							
				variables.instance.priNoteTBox = qGetINTAKE_PatientIntakeForm.priNoteTBox;
							
				variables.instance.secNoteTBox = qGetINTAKE_PatientIntakeForm.secNoteTBox;
							
				variables.instance.poNumberTBox = qGetINTAKE_PatientIntakeForm.poNumberTBox;
							
				variables.instance.creditCardTypeTBox = qGetINTAKE_PatientIntakeForm.creditCardTypeTBox;
							
				variables.instance.creditCardNumberTBox = qGetINTAKE_PatientIntakeForm.creditCardNumberTBox;
							
				variables.instance.ccDateMM = qGetINTAKE_PatientIntakeForm.ccDateMM;
							
				variables.instance.ccDateDD = qGetINTAKE_PatientIntakeForm.ccDateDD;
							
				variables.instance.ccDateYY = qGetINTAKE_PatientIntakeForm.ccDateYY;
							
				variables.instance.orderingPhysicianNameTBox = qGetINTAKE_PatientIntakeForm.orderingPhysicianNameTBox;
							
				variables.instance.orderingPhysicianPhoneTBox = qGetINTAKE_PatientIntakeForm.orderingPhysicianPhoneTBox;
							
				variables.instance.orderingPhysicianUPINTBox = qGetINTAKE_PatientIntakeForm.orderingPhysicianUPINTBox;
							
				variables.instance.orderingPhysicianFaxTBox = qGetINTAKE_PatientIntakeForm.orderingPhysicianFaxTBox;
							
				variables.instance.orderingPhysicianAddressTBox = qGetINTAKE_PatientIntakeForm.orderingPhysicianAddressTBox;
							
				variables.instance.orderingPhysicianCityTBox = qGetINTAKE_PatientIntakeForm.orderingPhysicianCityTBox;
							
				variables.instance.orderingPhysicianStateTBox = qGetINTAKE_PatientIntakeForm.orderingPhysicianStateTBox;
							
				variables.instance.orderingPhysicianZipTBox = qGetINTAKE_PatientIntakeForm.orderingPhysicianZipTBox;
							
				variables.instance.verificationRepNameTBox = qGetINTAKE_PatientIntakeForm.verificationRepNameTBox;
							
				variables.instance.verificationDateMM = qGetINTAKE_PatientIntakeForm.verificationDateMM;
							
				variables.instance.verificationDateDD = qGetINTAKE_PatientIntakeForm.verificationDateDD;
							
				variables.instance.verificationDateYY = qGetINTAKE_PatientIntakeForm.verificationDateYY;
							
				variables.instance.verificationTimeTBox = qGetINTAKE_PatientIntakeForm.verificationTimeTBox;
							
				variables.instance.OPTION_4_CBox_VerificationHaveInsYes = qGetINTAKE_PatientIntakeForm.OPTION_4_CBox_VerificationHaveInsYes;
							
				variables.instance.OPTION_4_CBox_VerificationHaveInsNo = qGetINTAKE_PatientIntakeForm.OPTION_4_CBox_VerificationHaveInsNo;
							
				variables.instance.verificationHaveInsFromMM = qGetINTAKE_PatientIntakeForm.verificationHaveInsFromMM;
							
				variables.instance.verificationHaveInsFromDD = qGetINTAKE_PatientIntakeForm.verificationHaveInsFromDD;
							
				variables.instance.verificationHaveInsFromYY = qGetINTAKE_PatientIntakeForm.verificationHaveInsFromYY;
							
				variables.instance.verificationHaveInsToMM = qGetINTAKE_PatientIntakeForm.verificationHaveInsToMM;
							
				variables.instance.verificationHaveInsToDD = qGetINTAKE_PatientIntakeForm.verificationHaveInsToDD;
							
				variables.instance.verificationHaveInsToYY = qGetINTAKE_PatientIntakeForm.verificationHaveInsToYY;
							
				variables.instance.OPTION_5_CBox_VerificationHaveDMECovYes = qGetINTAKE_PatientIntakeForm.OPTION_5_CBox_VerificationHaveDMECovYes;
							
				variables.instance.OPTION_5_CBox_VerificationHaveDMECovNo = qGetINTAKE_PatientIntakeForm.OPTION_5_CBox_VerificationHaveDMECovNo;
							
				variables.instance.OPTION_6_CBox_VerificationDeductibleYes = qGetINTAKE_PatientIntakeForm.OPTION_6_CBox_VerificationDeductibleYes;
							
				variables.instance.OPTION_6_CBox_VerificationDeductibleNo = qGetINTAKE_PatientIntakeForm.OPTION_6_CBox_VerificationDeductibleNo;
							
				variables.instance.OPTION_7_CBox_VerificationDeductibleMetYes = qGetINTAKE_PatientIntakeForm.OPTION_7_CBox_VerificationDeductibleMetYes;
							
				variables.instance.OPTION_7_CBox_VerificationDeductibleMetNo = qGetINTAKE_PatientIntakeForm.OPTION_7_CBox_VerificationDeductibleMetNo;
							
				variables.instance.verificationDeductibleAmountTBox = qGetINTAKE_PatientIntakeForm.verificationDeductibleAmountTBox;
							
				variables.instance.OPTION_8_CBox_VerificationPPOPolicyYes = qGetINTAKE_PatientIntakeForm.OPTION_8_CBox_VerificationPPOPolicyYes;
							
				variables.instance.OPTION_8_CBox_VerificationPPOPolicyNo = qGetINTAKE_PatientIntakeForm.OPTION_8_CBox_VerificationPPOPolicyNo;
							
				variables.instance.verificationPercentagePayAfterDeductibleTBox = qGetINTAKE_PatientIntakeForm.verificationPercentagePayAfterDeductibleTBox;
							
				variables.instance.OPTION_9_CBox_VerificationPriorAuthYes = qGetINTAKE_PatientIntakeForm.OPTION_9_CBox_VerificationPriorAuthYes;
							
				variables.instance.OPTION_9_CBox_VerificationPriorAuthNo = qGetINTAKE_PatientIntakeForm.OPTION_9_CBox_VerificationPriorAuthNo;
							
				variables.instance.verificationAuthNumberTBox = qGetINTAKE_PatientIntakeForm.verificationAuthNumberTBox;
							
				variables.instance.OPTION_10_CBox_VerificationLifetimeBenefitMetYes = qGetINTAKE_PatientIntakeForm.OPTION_10_CBox_VerificationLifetimeBenefitMetYes;
							
				variables.instance.OPTION_10_CBox_VerificationLifetimeBenefitMetNo = qGetINTAKE_PatientIntakeForm.OPTION_10_CBox_VerificationLifetimeBenefitMetNo;
							
				variables.instance.verificationAuthPhoneNumberTBox = qGetINTAKE_PatientIntakeForm.verificationAuthPhoneNumberTBox;
							
				variables.instance.OPTION_11_CBox_VerificationInsFollowMedicareYes = qGetINTAKE_PatientIntakeForm.OPTION_11_CBox_VerificationInsFollowMedicareYes;
							
				variables.instance.OPTION_11_CBox_VerificationInsFollowMedicareNo = qGetINTAKE_PatientIntakeForm.OPTION_11_CBox_VerificationInsFollowMedicareNo;
							
				variables.instance.OPTION_12_CBox_VerificationMedicaidPlanMQMB = qGetINTAKE_PatientIntakeForm.OPTION_12_CBox_VerificationMedicaidPlanMQMB;
							
				variables.instance.OPTION_12_CBox_VerificationMedicaidPlanQMB = qGetINTAKE_PatientIntakeForm.OPTION_12_CBox_VerificationMedicaidPlanQMB;
							
				variables.instance.OPTION_12_CBox_VerificationMedicaidPlanTraditional = qGetINTAKE_PatientIntakeForm.OPTION_12_CBox_VerificationMedicaidPlanTraditional;
							
				variables.instance.VerificationTypeBasePlanTBox = qGetINTAKE_PatientIntakeForm.VerificationTypeBasePlanTBox;
							
				variables.instance.OPTION_13_CBox_PastEquipmentYes = qGetINTAKE_PatientIntakeForm.OPTION_13_CBox_PastEquipmentYes;
							
				variables.instance.OPTION_13_CBox_PastEquipmentNo = qGetINTAKE_PatientIntakeForm.OPTION_13_CBox_PastEquipmentNo;
							
				variables.instance.Equipment1TypeTBox = qGetINTAKE_PatientIntakeForm.Equipment1TypeTBox;
							
				variables.instance.Equipment1RentPurchasedSelect = qGetINTAKE_PatientIntakeForm.Equipment1RentPurchasedSelect;
							
				variables.instance.Equipment1FromMM = qGetINTAKE_PatientIntakeForm.Equipment1FromMM;
							
				variables.instance.Equipment1FromDD = qGetINTAKE_PatientIntakeForm.Equipment1FromDD;
							
				variables.instance.Equipment1FromYY = qGetINTAKE_PatientIntakeForm.Equipment1FromYY;
							
				variables.instance.Equipment1ToMM = qGetINTAKE_PatientIntakeForm.Equipment1ToMM;
							
				variables.instance.Equipment1ToDD = qGetINTAKE_PatientIntakeForm.Equipment1ToDD;
							
				variables.instance.Equipment1ToYY = qGetINTAKE_PatientIntakeForm.Equipment1ToYY;
							
				variables.instance.Equipment1SupplierNameTBox = qGetINTAKE_PatientIntakeForm.Equipment1SupplierNameTBox;
							
				variables.instance.Equipment1SupplierTelephoneTBox = qGetINTAKE_PatientIntakeForm.Equipment1SupplierTelephoneTBox;
							
				variables.instance.Equipment2TypeTBox = qGetINTAKE_PatientIntakeForm.Equipment2TypeTBox;
							
				variables.instance.Equipment2RentPurchasedSelect = qGetINTAKE_PatientIntakeForm.Equipment2RentPurchasedSelect;
							
				variables.instance.Equipment2FromMM = qGetINTAKE_PatientIntakeForm.Equipment2FromMM;
							
				variables.instance.Equipment2FromDD = qGetINTAKE_PatientIntakeForm.Equipment2FromDD;
							
				variables.instance.Equipment2FromYY = qGetINTAKE_PatientIntakeForm.Equipment2FromYY;
							
				variables.instance.Equipment2ToMM = qGetINTAKE_PatientIntakeForm.Equipment2ToMM;
							
				variables.instance.Equipment2ToDD = qGetINTAKE_PatientIntakeForm.Equipment2ToDD;
							
				variables.instance.Equipment2ToYY = qGetINTAKE_PatientIntakeForm.Equipment2ToYY;
							
				variables.instance.Equipment2SupplierNameTBox = qGetINTAKE_PatientIntakeForm.Equipment2SupplierNameTBox;
							
				variables.instance.Equipment2SupplierTelephoneTBox = qGetINTAKE_PatientIntakeForm.Equipment2SupplierTelephoneTBox;
							
				variables.instance.Equipment3TypeTBox = qGetINTAKE_PatientIntakeForm.Equipment3TypeTBox;
							
				variables.instance.Equipment3RentPurchasedSelect = qGetINTAKE_PatientIntakeForm.Equipment3RentPurchasedSelect;
							
				variables.instance.Equipment3FromMM = qGetINTAKE_PatientIntakeForm.Equipment3FromMM;
							
				variables.instance.Equipment3FromDD = qGetINTAKE_PatientIntakeForm.Equipment3FromDD;
							
				variables.instance.Equipment3FromYY = qGetINTAKE_PatientIntakeForm.Equipment3FromYY;
							
				variables.instance.Equipment3ToMM = qGetINTAKE_PatientIntakeForm.Equipment3ToMM;
							
				variables.instance.Equipment3ToDD = qGetINTAKE_PatientIntakeForm.Equipment3ToDD;
							
				variables.instance.Equipment3ToYY = qGetINTAKE_PatientIntakeForm.Equipment3ToYY;
							
				variables.instance.Equipment3SupplierNameTBox = qGetINTAKE_PatientIntakeForm.Equipment3SupplierNameTBox;
							
				variables.instance.Equipment3SupplierTelephoneTBox = qGetINTAKE_PatientIntakeForm.Equipment3SupplierTelephoneTBox;
							
				variables.instance.Equipment4TypeTBox = qGetINTAKE_PatientIntakeForm.Equipment4TypeTBox;
							
				variables.instance.Equipment4RentPurchasedSelect = qGetINTAKE_PatientIntakeForm.Equipment4RentPurchasedSelect;
							
				variables.instance.Equipment4FromMM = qGetINTAKE_PatientIntakeForm.Equipment4FromMM;
							
				variables.instance.Equipment4FromDD = qGetINTAKE_PatientIntakeForm.Equipment4FromDD;
							
				variables.instance.Equipment4FromYY = qGetINTAKE_PatientIntakeForm.Equipment4FromYY;
							
				variables.instance.Equipment4ToMM = qGetINTAKE_PatientIntakeForm.Equipment4ToMM;
							
				variables.instance.Equipment4ToDD = qGetINTAKE_PatientIntakeForm.Equipment4ToDD;
							
				variables.instance.Equipment4ToYY = qGetINTAKE_PatientIntakeForm.Equipment4ToYY;
							
				variables.instance.Equipment4SupplierNameTBox = qGetINTAKE_PatientIntakeForm.Equipment4SupplierNameTBox;
							
				variables.instance.Equipment4SupplierTelephoneTBox = qGetINTAKE_PatientIntakeForm.Equipment4SupplierTelephoneTBox;
							
				variables.instance.Equipment5TypeTBox = qGetINTAKE_PatientIntakeForm.Equipment5TypeTBox;
							
				variables.instance.Equipment5RentPurchasedSelect = qGetINTAKE_PatientIntakeForm.Equipment5RentPurchasedSelect;
							
				variables.instance.Equipment5FromMM = qGetINTAKE_PatientIntakeForm.Equipment5FromMM;
							
				variables.instance.Equipment5FromDD = qGetINTAKE_PatientIntakeForm.Equipment5FromDD;
							
				variables.instance.Equipment5FromYY = qGetINTAKE_PatientIntakeForm.Equipment5FromYY;
							
				variables.instance.Equipment5ToMM = qGetINTAKE_PatientIntakeForm.Equipment5ToMM;
							
				variables.instance.Equipment5ToDD = qGetINTAKE_PatientIntakeForm.Equipment5ToDD;
							
				variables.instance.Equipment5ToYY = qGetINTAKE_PatientIntakeForm.Equipment5ToYY;
							
				variables.instance.Equipment5SupplierNameTBox = qGetINTAKE_PatientIntakeForm.Equipment5SupplierNameTBox;
							
				variables.instance.Equipment5SupplierTelephoneTBox = qGetINTAKE_PatientIntakeForm.Equipment5SupplierTelephoneTBox;
							
				variables.instance.OPTION_14_CBox_OxygenPAo2 = qGetINTAKE_PatientIntakeForm.OPTION_14_CBox_OxygenPAo2;
							
				variables.instance.OPTION_14_CBox_OxygenSAo2 = qGetINTAKE_PatientIntakeForm.OPTION_14_CBox_OxygenSAo2;
							
				variables.instance.OPTION_14_CBox_OxygenSPo2 = qGetINTAKE_PatientIntakeForm.OPTION_14_CBox_OxygenSPo2;
							
				variables.instance.OxygenPAO2TBox = qGetINTAKE_PatientIntakeForm.OxygenPAO2TBox;
							
				variables.instance.OxygenSAO2TBox = qGetINTAKE_PatientIntakeForm.OxygenSAO2TBox;
							
				variables.instance.CPAPStudy_CBox = qGetINTAKE_PatientIntakeForm.CPAPStudy_CBox;
							
				variables.instance.CPAPStudyNote = qGetINTAKE_PatientIntakeForm.CPAPStudyNote;
							
				variables.instance.OxygenSPO2TBox = qGetINTAKE_PatientIntakeForm.OxygenSPO2TBox;
							
				variables.instance.CPAPStudyOnFile_CBox = qGetINTAKE_PatientIntakeForm.CPAPStudyOnFile_CBox;
							
				variables.instance.CPAPStudyOnFileNote = qGetINTAKE_PatientIntakeForm.CPAPStudyOnFileNote;
							
				variables.instance.LabTestDateMM = qGetINTAKE_PatientIntakeForm.LabTestDateMM;
							
				variables.instance.LabTestDateDD = qGetINTAKE_PatientIntakeForm.LabTestDateDD;
							
				variables.instance.LabTestDateYY = qGetINTAKE_PatientIntakeForm.LabTestDateYY;
							
				variables.instance.CPAPStudyPerformedAt = qGetINTAKE_PatientIntakeForm.CPAPStudyPerformedAt;
							
				variables.instance.LabTestFacilityTBox = qGetINTAKE_PatientIntakeForm.LabTestFacilityTBox;
							
				variables.instance.CPAPStudyPerformedAt2 = qGetINTAKE_PatientIntakeForm.CPAPStudyPerformedAt2;
							
				variables.instance.CPAPStudyPerformedAt3 = qGetINTAKE_PatientIntakeForm.CPAPStudyPerformedAt3;
							
				variables.instance.Active = qGetINTAKE_PatientIntakeForm.Active;
				
			IF(qGetINTAKE_PatientIntakeForm.InactiveCode EQ "" OR qGetINTAKE_PatientIntakeForm.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetINTAKE_PatientIntakeForm.InactiveCode;
							
				variables.instance.DateCreated = qGetINTAKE_PatientIntakeForm.DateCreated;
							
				variables.instance.DateModified = qGetINTAKE_PatientIntakeForm.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(recordID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitINTAKE_PatientIntakeForm = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.recordID) AND variables.instance.recordID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitINTAKE_PatientIntakeForm" datasource="#request.datasource#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>
							
				<cfset postUpdateCommit()>
			
			</cfif>
			
		<cfelse>
			
			<cfset preInsertCommit()>
			
			<cfset sqlStatement = preInsertDataCheck()>				
			
			<cfif Find("Error:", sqlStatement)>
			
				<cf_gcGeneralErrorTemplate message="#trim(sqlStatement)#">
			
			<cfelse>
			
				<cfquery name="qInsertCommitINTAKE_PatientIntakeForm" datasource="#request.datasource#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.recordID = qInsertCommitINTAKE_PatientIntakeForm.recordID>
				
				<cfreturn qInsertCommitINTAKE_PatientIntakeForm.recordID>
			
			</cfif>	
			
		</cfif>
	 	
		<cfreturn true>
	
	</cffunction>
	

	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic update statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preUpdateDataCheck" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- List all the table columns.                                                    --->
		<!-------------------------------------------------------------------------------------->	
			<cfset tableColumns = "recordID,hidden_UsersID,hidden_TimeStart,OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing,OPTION_2_CBox_Facility,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital,facilityTBox,hospiceTBox,OPTION_3_CBox_Medicare,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay,hospitalTBox,DischargeDateMM,DischargeDateDD,DischargeDateYY,typeOfPay_Radio,callerNameTBox,callerPhoneTBox,patientNameTBox,roomNumberTBox,bedNumberTBox,patientAddressTBox,patientCityTBox,patientStateTBox,patientZipTBox,patientPhoneTBox,patientDOBMM,patientDOBDD,patientDOBYY,patientSSNTBox,patientHeightFeet,patientHeightInches,patientWeightTBox,alternateContactNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,hcpcCode1TBox,hcpcQty1TBox,hcpcProduct1TBox,hcpcDX1TBox,hcpcDiagnosis1TBox,hcpcLengthOfNeedYear1TBox,hcpcLengthOfNeedMonth1TBox,hcpcCode2TBox,hcpcQty2TBox,hcpcProduct2TBox,hcpcDX2TBox,hcpcDiagnosis2TBox,hcpcLengthOfNeedYear2TBox,hcpcLengthOfNeedMonth2TBox,hcpcCode3TBox,hcpcQty3TBox,hcpcProduct3TBox,hcpcDX3TBox,hcpcDiagnosis3TBox,hcpcLengthOfNeedYear3TBox,hcpcLengthOfNeedMonth3TBox,hcpcCode4TBox,hcpcQty4TBox,hcpcProduct4TBox,hcpcDX4TBox,hcpcDiagnosis4TBox,hcpcLengthOfNeedYear4TBox,hcpcLengthOfNeedMonth4TBox,hcpcCode5TBox,hcpcQty5TBox,hcpcProduct5TBox,hcpcDX5TBox,hcpcDiagnosis5TBox,hcpcLengthOfNeedYear5TBox,hcpcLengthOfNeedMonth5TBox,hcpcCode6TBox,hcpcQty6TBox,hcpcProduct6TBox,hcpcDX6TBox,hcpcDiagnosis6TBox,hcpcLengthOfNeedYear6TBox,hcpcLengthOfNeedMonth6TBox,hcpcCode7TBox,hcpcQty7TBox,hcpcProduct7TBox,hcpcDX7TBox,hcpcDiagnosis7TBox,hcpcLengthOfNeedYear7TBox,hcpcLengthOfNeedMonth7TBox,hcpcCode8TBox,hcpcQty8TBox,hcpcProduct8TBox,hcpcDX8TBox,hcpcDiagnosis8TBox,hcpcLengthOfNeedYear8TBox,hcpcLengthOfNeedMonth8TBox,hcpcCode9TBox,hcpcQty9TBox,hcpcProduct9TBox,hcpcDX9TBox,hcpcDiagnosis9TBox,hcpcLengthOfNeedYear9TBox,hcpcLengthOfNeedMonth9TBox,hcpcCode10TBox,hcpcQty10TBox,hcpcProduct10TBox,hcpcDX10TBox,hcpcDiagnosis10TBox,hcpcLengthOfNeedYear10TBox,hcpcLengthOfNeedMonth10TBox,primaryInsuranceNameTBox,secondaryInsuranceNameTBox,primaryPolicyNumberTBox,secondaryPolicyNumberTBox,primaryGroupNumberTBox,secondaryGroupNumberTBox,primaryPhoneNumberTBox,secondaryPhoneNumberTBox,priEffectiveDateMM,priEffectiveDateDD,priEffectiveDateYY,secEffectiveDateMM,secEffectiveDateDD,secEffectiveDateYY,priPolicyHolderNameTBox,secPolicyHolderNameTBox,priHoldersDOBMM,priHoldersDOBDD,priHoldersDOBYY,secHoldersDOBMM,secHoldersDOBDD,secHoldersDOBYY,priPolicyHolderEmployerTBox,secPolicyHolderEmployerTBox,priNoteTBox,secNoteTBox,poNumberTBox,creditCardTypeTBox,creditCardNumberTBox,ccDateMM,ccDateDD,ccDateYY,orderingPhysicianNameTBox,orderingPhysicianPhoneTBox,orderingPhysicianUPINTBox,orderingPhysicianFaxTBox,orderingPhysicianAddressTBox,orderingPhysicianCityTBox,orderingPhysicianStateTBox,orderingPhysicianZipTBox,verificationRepNameTBox,verificationDateMM,verificationDateDD,verificationDateYY,verificationTimeTBox,OPTION_4_CBox_VerificationHaveInsYes,OPTION_4_CBox_VerificationHaveInsNo,verificationHaveInsFromMM,verificationHaveInsFromDD,verificationHaveInsFromYY,verificationHaveInsToMM,verificationHaveInsToDD,verificationHaveInsToYY,OPTION_5_CBox_VerificationHaveDMECovYes,OPTION_5_CBox_VerificationHaveDMECovNo,OPTION_6_CBox_VerificationDeductibleYes,OPTION_6_CBox_VerificationDeductibleNo,OPTION_7_CBox_VerificationDeductibleMetYes,OPTION_7_CBox_VerificationDeductibleMetNo,verificationDeductibleAmountTBox,OPTION_8_CBox_VerificationPPOPolicyYes,OPTION_8_CBox_VerificationPPOPolicyNo,verificationPercentagePayAfterDeductibleTBox,OPTION_9_CBox_VerificationPriorAuthYes,OPTION_9_CBox_VerificationPriorAuthNo,verificationAuthNumberTBox,OPTION_10_CBox_VerificationLifetimeBenefitMetYes,OPTION_10_CBox_VerificationLifetimeBenefitMetNo,verificationAuthPhoneNumberTBox,OPTION_11_CBox_VerificationInsFollowMedicareYes,OPTION_11_CBox_VerificationInsFollowMedicareNo,OPTION_12_CBox_VerificationMedicaidPlanMQMB,OPTION_12_CBox_VerificationMedicaidPlanQMB,OPTION_12_CBox_VerificationMedicaidPlanTraditional,VerificationTypeBasePlanTBox,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo,Equipment1TypeTBox,Equipment1RentPurchasedSelect,Equipment1FromMM,Equipment1FromDD,Equipment1FromYY,Equipment1ToMM,Equipment1ToDD,Equipment1ToYY,Equipment1SupplierNameTBox,Equipment1SupplierTelephoneTBox,Equipment2TypeTBox,Equipment2RentPurchasedSelect,Equipment2FromMM,Equipment2FromDD,Equipment2FromYY,Equipment2ToMM,Equipment2ToDD,Equipment2ToYY,Equipment2SupplierNameTBox,Equipment2SupplierTelephoneTBox,Equipment3TypeTBox,Equipment3RentPurchasedSelect,Equipment3FromMM,Equipment3FromDD,Equipment3FromYY,Equipment3ToMM,Equipment3ToDD,Equipment3ToYY,Equipment3SupplierNameTBox,Equipment3SupplierTelephoneTBox,Equipment4TypeTBox,Equipment4RentPurchasedSelect,Equipment4FromMM,Equipment4FromDD,Equipment4FromYY,Equipment4ToMM,Equipment4ToDD,Equipment4ToYY,Equipment4SupplierNameTBox,Equipment4SupplierTelephoneTBox,Equipment5TypeTBox,Equipment5RentPurchasedSelect,Equipment5FromMM,Equipment5FromDD,Equipment5FromYY,Equipment5ToMM,Equipment5ToDD,Equipment5ToYY,Equipment5SupplierNameTBox,Equipment5SupplierTelephoneTBox,OPTION_14_CBox_OxygenPAo2,OPTION_14_CBox_OxygenSAo2,OPTION_14_CBox_OxygenSPo2,OxygenPAO2TBox,OxygenSAO2TBox,CPAPStudy_CBox,CPAPStudyNote,OxygenSPO2TBox,CPAPStudyOnFile_CBox,CPAPStudyOnFileNote,LabTestDateMM,LabTestDateDD,LabTestDateYY,CPAPStudyPerformedAt,LabTestFacilityTBox,CPAPStudyPerformedAt2,CPAPStudyPerformedAt3,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "hidden_UsersID,hidden_TimeStart,OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing,OPTION_2_CBox_Facility,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital,facilityTBox,hospiceTBox,OPTION_3_CBox_Medicare,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay,hospitalTBox,DischargeDateMM,DischargeDateDD,DischargeDateYY,typeOfPay_Radio,callerNameTBox,callerPhoneTBox,patientNameTBox,roomNumberTBox,bedNumberTBox,patientAddressTBox,patientCityTBox,patientStateTBox,patientZipTBox,patientPhoneTBox,patientDOBMM,patientDOBDD,patientDOBYY,patientSSNTBox,patientHeightFeet,patientHeightInches,patientWeightTBox,alternateContactNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,hcpcCode1TBox,hcpcQty1TBox,hcpcProduct1TBox,hcpcDX1TBox,hcpcDiagnosis1TBox,hcpcLengthOfNeedYear1TBox,hcpcLengthOfNeedMonth1TBox,hcpcCode2TBox,hcpcQty2TBox,hcpcProduct2TBox,hcpcDX2TBox,hcpcDiagnosis2TBox,hcpcLengthOfNeedYear2TBox,hcpcLengthOfNeedMonth2TBox,hcpcCode3TBox,hcpcQty3TBox,hcpcProduct3TBox,hcpcDX3TBox,hcpcDiagnosis3TBox,hcpcLengthOfNeedYear3TBox,hcpcLengthOfNeedMonth3TBox,hcpcCode4TBox,hcpcQty4TBox,hcpcProduct4TBox,hcpcDX4TBox,hcpcDiagnosis4TBox,hcpcLengthOfNeedYear4TBox,hcpcLengthOfNeedMonth4TBox,hcpcCode5TBox,hcpcQty5TBox,hcpcProduct5TBox,hcpcDX5TBox,hcpcDiagnosis5TBox,hcpcLengthOfNeedYear5TBox,hcpcLengthOfNeedMonth5TBox,hcpcCode6TBox,hcpcQty6TBox,hcpcProduct6TBox,hcpcDX6TBox,hcpcDiagnosis6TBox,hcpcLengthOfNeedYear6TBox,hcpcLengthOfNeedMonth6TBox,hcpcCode7TBox,hcpcQty7TBox,hcpcProduct7TBox,hcpcDX7TBox,hcpcDiagnosis7TBox,hcpcLengthOfNeedYear7TBox,hcpcLengthOfNeedMonth7TBox,hcpcCode8TBox,hcpcQty8TBox,hcpcProduct8TBox,hcpcDX8TBox,hcpcDiagnosis8TBox,hcpcLengthOfNeedYear8TBox,hcpcLengthOfNeedMonth8TBox,hcpcCode9TBox,hcpcQty9TBox,hcpcProduct9TBox,hcpcDX9TBox,hcpcDiagnosis9TBox,hcpcLengthOfNeedYear9TBox,hcpcLengthOfNeedMonth9TBox,hcpcCode10TBox,hcpcQty10TBox,hcpcProduct10TBox,hcpcDX10TBox,hcpcDiagnosis10TBox,hcpcLengthOfNeedYear10TBox,hcpcLengthOfNeedMonth10TBox,primaryInsuranceNameTBox,secondaryInsuranceNameTBox,primaryPolicyNumberTBox,secondaryPolicyNumberTBox,primaryGroupNumberTBox,secondaryGroupNumberTBox,primaryPhoneNumberTBox,secondaryPhoneNumberTBox,priEffectiveDateMM,priEffectiveDateDD,priEffectiveDateYY,secEffectiveDateMM,secEffectiveDateDD,secEffectiveDateYY,priPolicyHolderNameTBox,secPolicyHolderNameTBox,priHoldersDOBMM,priHoldersDOBDD,priHoldersDOBYY,secHoldersDOBMM,secHoldersDOBDD,secHoldersDOBYY,priPolicyHolderEmployerTBox,secPolicyHolderEmployerTBox,priNoteTBox,secNoteTBox,poNumberTBox,creditCardTypeTBox,creditCardNumberTBox,ccDateMM,ccDateDD,ccDateYY,orderingPhysicianNameTBox,orderingPhysicianPhoneTBox,orderingPhysicianUPINTBox,orderingPhysicianFaxTBox,orderingPhysicianAddressTBox,orderingPhysicianCityTBox,orderingPhysicianStateTBox,orderingPhysicianZipTBox,verificationRepNameTBox,verificationDateMM,verificationDateDD,verificationDateYY,verificationTimeTBox,OPTION_4_CBox_VerificationHaveInsYes,OPTION_4_CBox_VerificationHaveInsNo,verificationHaveInsFromMM,verificationHaveInsFromDD,verificationHaveInsFromYY,verificationHaveInsToMM,verificationHaveInsToDD,verificationHaveInsToYY,OPTION_5_CBox_VerificationHaveDMECovYes,OPTION_5_CBox_VerificationHaveDMECovNo,OPTION_6_CBox_VerificationDeductibleYes,OPTION_6_CBox_VerificationDeductibleNo,OPTION_7_CBox_VerificationDeductibleMetYes,OPTION_7_CBox_VerificationDeductibleMetNo,verificationDeductibleAmountTBox,OPTION_8_CBox_VerificationPPOPolicyYes,OPTION_8_CBox_VerificationPPOPolicyNo,verificationPercentagePayAfterDeductibleTBox,OPTION_9_CBox_VerificationPriorAuthYes,OPTION_9_CBox_VerificationPriorAuthNo,verificationAuthNumberTBox,OPTION_10_CBox_VerificationLifetimeBenefitMetYes,OPTION_10_CBox_VerificationLifetimeBenefitMetNo,verificationAuthPhoneNumberTBox,OPTION_11_CBox_VerificationInsFollowMedicareYes,OPTION_11_CBox_VerificationInsFollowMedicareNo,OPTION_12_CBox_VerificationMedicaidPlanMQMB,OPTION_12_CBox_VerificationMedicaidPlanQMB,OPTION_12_CBox_VerificationMedicaidPlanTraditional,VerificationTypeBasePlanTBox,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo,Equipment1TypeTBox,Equipment1RentPurchasedSelect,Equipment1FromMM,Equipment1FromDD,Equipment1FromYY,Equipment1ToMM,Equipment1ToDD,Equipment1ToYY,Equipment1SupplierNameTBox,Equipment1SupplierTelephoneTBox,Equipment2TypeTBox,Equipment2RentPurchasedSelect,Equipment2FromMM,Equipment2FromDD,Equipment2FromYY,Equipment2ToMM,Equipment2ToDD,Equipment2ToYY,Equipment2SupplierNameTBox,Equipment2SupplierTelephoneTBox,Equipment3TypeTBox,Equipment3RentPurchasedSelect,Equipment3FromMM,Equipment3FromDD,Equipment3FromYY,Equipment3ToMM,Equipment3ToDD,Equipment3ToYY,Equipment3SupplierNameTBox,Equipment3SupplierTelephoneTBox,Equipment4TypeTBox,Equipment4RentPurchasedSelect,Equipment4FromMM,Equipment4FromDD,Equipment4FromYY,Equipment4ToMM,Equipment4ToDD,Equipment4ToYY,Equipment4SupplierNameTBox,Equipment4SupplierTelephoneTBox,Equipment5TypeTBox,Equipment5RentPurchasedSelect,Equipment5FromMM,Equipment5FromDD,Equipment5FromYY,Equipment5ToMM,Equipment5ToDD,Equipment5ToYY,Equipment5SupplierNameTBox,Equipment5SupplierTelephoneTBox,OPTION_14_CBox_OxygenPAo2,OPTION_14_CBox_OxygenSAo2,OPTION_14_CBox_OxygenSPo2,OxygenPAO2TBox,OxygenSAO2TBox,CPAPStudy_CBox,CPAPStudyNote,OxygenSPO2TBox,CPAPStudyOnFile_CBox,CPAPStudyOnFileNote,LabTestDateMM,LabTestDateDD,LabTestDateYY,CPAPStudyPerformedAt,LabTestFacilityTBox,CPAPStudyPerformedAt2,CPAPStudyPerformedAt3,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToUpdate = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="#variables.instance.changedVariables#" index="currentVar">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Include the column in the query only if there is a value.                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfset currentrecord = "variables.instance.#currentVar#">								
				<cfif evaluate(currentRecord) NEQ "">				
					
					<!-------------------------------------------------------------------------------------->
					<!--- If the value came in with the value of null we must see                        --->
					<!--- if the column has a default value. If there is a default                       --->
					<!--- value that is what must go into the database.                                  --->
					<!-------------------------------------------------------------------------------------->
					<cfif evaluate(currentRecord) EQ "NULL"> 
						<cfquery name="getColumnDefault" dbtype="query">
							SELECT IS_NULLABLE, COLUMN_DEFAULT
							FROM defaultsQuery
							WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
						</cfquery>
					</cfif>
					
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value cannot be evaluated to a date error out.                          --->
						<!-------------------------------------------------------------------------------------->					
						<cfif NOT IsDate(evaluate(currentRecord))>						
							<cf_gcGeneralErrorTemplate				
								message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
						</cfif>		
						
						<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(NOW()) & ":" & Minute(NOW()) & ":" & SECOND(NOW())>
						<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #CreateODBCDateTime(currentDate)#">
						
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
					
						<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = NOW()">
						
					<!-------------------------------------------------------------------------------------->
					<!--- If the current column is a string then add the single                          --->
					<!--- quotes allowing to safely enter the dB.                                        --->
					<!-------------------------------------------------------------------------------------->				 
					<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
						<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = '#Replace(evaluate(currentRecord), "'", "''", "ALL")#'">
					
					<!-------------------------------------------------------------------------------------->
					<!--- When you send in a value of null and there is a default                        --->
					<!--- value for that column then add it to the query.                                --->
					<!-------------------------------------------------------------------------------------->			
					<cfelseif evaluate(currentRecord) EQ "NULL" AND IsDefined("getColumnDefault.COLUMN_DEFAULT") AND getColumnDefault.COLUMN_DEFAULT NEQ ""> 
						<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #getColumnDefault.COLUMN_DEFAULT#">						
					<cfelse>
						<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #evaluate(currentRecord)#">						
					</cfif>				  
				
				</cfif>
			
			</cfloop>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "UPDATE intake_patientintakeform  SET #columnsToUpdate# WHERE recordID = #trim(variables.instance.recordID)#">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase("SET ,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", "SET ,", "SET ", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>


	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic insert statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preInsertDataCheck" output="no">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "hidden_UsersID,hidden_TimeStart,OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing,OPTION_2_CBox_Facility,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital,facilityTBox,hospiceTBox,OPTION_3_CBox_Medicare,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay,hospitalTBox,DischargeDateMM,DischargeDateDD,DischargeDateYY,typeOfPay_Radio,callerNameTBox,callerPhoneTBox,patientNameTBox,roomNumberTBox,bedNumberTBox,patientAddressTBox,patientCityTBox,patientStateTBox,patientZipTBox,patientPhoneTBox,patientDOBMM,patientDOBDD,patientDOBYY,patientSSNTBox,patientHeightFeet,patientHeightInches,patientWeightTBox,alternateContactNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,hcpcCode1TBox,hcpcQty1TBox,hcpcProduct1TBox,hcpcDX1TBox,hcpcDiagnosis1TBox,hcpcLengthOfNeedYear1TBox,hcpcLengthOfNeedMonth1TBox,hcpcCode2TBox,hcpcQty2TBox,hcpcProduct2TBox,hcpcDX2TBox,hcpcDiagnosis2TBox,hcpcLengthOfNeedYear2TBox,hcpcLengthOfNeedMonth2TBox,hcpcCode3TBox,hcpcQty3TBox,hcpcProduct3TBox,hcpcDX3TBox,hcpcDiagnosis3TBox,hcpcLengthOfNeedYear3TBox,hcpcLengthOfNeedMonth3TBox,hcpcCode4TBox,hcpcQty4TBox,hcpcProduct4TBox,hcpcDX4TBox,hcpcDiagnosis4TBox,hcpcLengthOfNeedYear4TBox,hcpcLengthOfNeedMonth4TBox,hcpcCode5TBox,hcpcQty5TBox,hcpcProduct5TBox,hcpcDX5TBox,hcpcDiagnosis5TBox,hcpcLengthOfNeedYear5TBox,hcpcLengthOfNeedMonth5TBox,hcpcCode6TBox,hcpcQty6TBox,hcpcProduct6TBox,hcpcDX6TBox,hcpcDiagnosis6TBox,hcpcLengthOfNeedYear6TBox,hcpcLengthOfNeedMonth6TBox,hcpcCode7TBox,hcpcQty7TBox,hcpcProduct7TBox,hcpcDX7TBox,hcpcDiagnosis7TBox,hcpcLengthOfNeedYear7TBox,hcpcLengthOfNeedMonth7TBox,hcpcCode8TBox,hcpcQty8TBox,hcpcProduct8TBox,hcpcDX8TBox,hcpcDiagnosis8TBox,hcpcLengthOfNeedYear8TBox,hcpcLengthOfNeedMonth8TBox,hcpcCode9TBox,hcpcQty9TBox,hcpcProduct9TBox,hcpcDX9TBox,hcpcDiagnosis9TBox,hcpcLengthOfNeedYear9TBox,hcpcLengthOfNeedMonth9TBox,hcpcCode10TBox,hcpcQty10TBox,hcpcProduct10TBox,hcpcDX10TBox,hcpcDiagnosis10TBox,hcpcLengthOfNeedYear10TBox,hcpcLengthOfNeedMonth10TBox,primaryInsuranceNameTBox,secondaryInsuranceNameTBox,primaryPolicyNumberTBox,secondaryPolicyNumberTBox,primaryGroupNumberTBox,secondaryGroupNumberTBox,primaryPhoneNumberTBox,secondaryPhoneNumberTBox,priEffectiveDateMM,priEffectiveDateDD,priEffectiveDateYY,secEffectiveDateMM,secEffectiveDateDD,secEffectiveDateYY,priPolicyHolderNameTBox,secPolicyHolderNameTBox,priHoldersDOBMM,priHoldersDOBDD,priHoldersDOBYY,secHoldersDOBMM,secHoldersDOBDD,secHoldersDOBYY,priPolicyHolderEmployerTBox,secPolicyHolderEmployerTBox,priNoteTBox,secNoteTBox,poNumberTBox,creditCardTypeTBox,creditCardNumberTBox,ccDateMM,ccDateDD,ccDateYY,orderingPhysicianNameTBox,orderingPhysicianPhoneTBox,orderingPhysicianUPINTBox,orderingPhysicianFaxTBox,orderingPhysicianAddressTBox,orderingPhysicianCityTBox,orderingPhysicianStateTBox,orderingPhysicianZipTBox,verificationRepNameTBox,verificationDateMM,verificationDateDD,verificationDateYY,verificationTimeTBox,OPTION_4_CBox_VerificationHaveInsYes,OPTION_4_CBox_VerificationHaveInsNo,verificationHaveInsFromMM,verificationHaveInsFromDD,verificationHaveInsFromYY,verificationHaveInsToMM,verificationHaveInsToDD,verificationHaveInsToYY,OPTION_5_CBox_VerificationHaveDMECovYes,OPTION_5_CBox_VerificationHaveDMECovNo,OPTION_6_CBox_VerificationDeductibleYes,OPTION_6_CBox_VerificationDeductibleNo,OPTION_7_CBox_VerificationDeductibleMetYes,OPTION_7_CBox_VerificationDeductibleMetNo,verificationDeductibleAmountTBox,OPTION_8_CBox_VerificationPPOPolicyYes,OPTION_8_CBox_VerificationPPOPolicyNo,verificationPercentagePayAfterDeductibleTBox,OPTION_9_CBox_VerificationPriorAuthYes,OPTION_9_CBox_VerificationPriorAuthNo,verificationAuthNumberTBox,OPTION_10_CBox_VerificationLifetimeBenefitMetYes,OPTION_10_CBox_VerificationLifetimeBenefitMetNo,verificationAuthPhoneNumberTBox,OPTION_11_CBox_VerificationInsFollowMedicareYes,OPTION_11_CBox_VerificationInsFollowMedicareNo,OPTION_12_CBox_VerificationMedicaidPlanMQMB,OPTION_12_CBox_VerificationMedicaidPlanQMB,OPTION_12_CBox_VerificationMedicaidPlanTraditional,VerificationTypeBasePlanTBox,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo,Equipment1TypeTBox,Equipment1RentPurchasedSelect,Equipment1FromMM,Equipment1FromDD,Equipment1FromYY,Equipment1ToMM,Equipment1ToDD,Equipment1ToYY,Equipment1SupplierNameTBox,Equipment1SupplierTelephoneTBox,Equipment2TypeTBox,Equipment2RentPurchasedSelect,Equipment2FromMM,Equipment2FromDD,Equipment2FromYY,Equipment2ToMM,Equipment2ToDD,Equipment2ToYY,Equipment2SupplierNameTBox,Equipment2SupplierTelephoneTBox,Equipment3TypeTBox,Equipment3RentPurchasedSelect,Equipment3FromMM,Equipment3FromDD,Equipment3FromYY,Equipment3ToMM,Equipment3ToDD,Equipment3ToYY,Equipment3SupplierNameTBox,Equipment3SupplierTelephoneTBox,Equipment4TypeTBox,Equipment4RentPurchasedSelect,Equipment4FromMM,Equipment4FromDD,Equipment4FromYY,Equipment4ToMM,Equipment4ToDD,Equipment4ToYY,Equipment4SupplierNameTBox,Equipment4SupplierTelephoneTBox,Equipment5TypeTBox,Equipment5RentPurchasedSelect,Equipment5FromMM,Equipment5FromDD,Equipment5FromYY,Equipment5ToMM,Equipment5ToDD,Equipment5ToYY,Equipment5SupplierNameTBox,Equipment5SupplierTelephoneTBox,OPTION_14_CBox_OxygenPAo2,OPTION_14_CBox_OxygenSAo2,OPTION_14_CBox_OxygenSPo2,OxygenPAO2TBox,OxygenSAO2TBox,CPAPStudy_CBox,CPAPStudyNote,OxygenSPO2TBox,CPAPStudyOnFile_CBox,CPAPStudyOnFileNote,LabTestDateMM,LabTestDateDD,LabTestDateYY,CPAPStudyPerformedAt,LabTestFacilityTBox,CPAPStudyPerformedAt2,CPAPStudyPerformedAt3,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="hidden_UsersID,hidden_TimeStart,OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing,OPTION_2_CBox_Facility,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital,facilityTBox,hospiceTBox,OPTION_3_CBox_Medicare,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay,hospitalTBox,DischargeDateMM,DischargeDateDD,DischargeDateYY,typeOfPay_Radio,callerNameTBox,callerPhoneTBox,patientNameTBox,roomNumberTBox,bedNumberTBox,patientAddressTBox,patientCityTBox,patientStateTBox,patientZipTBox,patientPhoneTBox,patientDOBMM,patientDOBDD,patientDOBYY,patientSSNTBox,patientHeightFeet,patientHeightInches,patientWeightTBox,alternateContactNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,hcpcCode1TBox,hcpcQty1TBox,hcpcProduct1TBox,hcpcDX1TBox,hcpcDiagnosis1TBox,hcpcLengthOfNeedYear1TBox,hcpcLengthOfNeedMonth1TBox,hcpcCode2TBox,hcpcQty2TBox,hcpcProduct2TBox,hcpcDX2TBox,hcpcDiagnosis2TBox,hcpcLengthOfNeedYear2TBox,hcpcLengthOfNeedMonth2TBox,hcpcCode3TBox,hcpcQty3TBox,hcpcProduct3TBox,hcpcDX3TBox,hcpcDiagnosis3TBox,hcpcLengthOfNeedYear3TBox,hcpcLengthOfNeedMonth3TBox,hcpcCode4TBox,hcpcQty4TBox,hcpcProduct4TBox,hcpcDX4TBox,hcpcDiagnosis4TBox,hcpcLengthOfNeedYear4TBox,hcpcLengthOfNeedMonth4TBox,hcpcCode5TBox,hcpcQty5TBox,hcpcProduct5TBox,hcpcDX5TBox,hcpcDiagnosis5TBox,hcpcLengthOfNeedYear5TBox,hcpcLengthOfNeedMonth5TBox,hcpcCode6TBox,hcpcQty6TBox,hcpcProduct6TBox,hcpcDX6TBox,hcpcDiagnosis6TBox,hcpcLengthOfNeedYear6TBox,hcpcLengthOfNeedMonth6TBox,hcpcCode7TBox,hcpcQty7TBox,hcpcProduct7TBox,hcpcDX7TBox,hcpcDiagnosis7TBox,hcpcLengthOfNeedYear7TBox,hcpcLengthOfNeedMonth7TBox,hcpcCode8TBox,hcpcQty8TBox,hcpcProduct8TBox,hcpcDX8TBox,hcpcDiagnosis8TBox,hcpcLengthOfNeedYear8TBox,hcpcLengthOfNeedMonth8TBox,hcpcCode9TBox,hcpcQty9TBox,hcpcProduct9TBox,hcpcDX9TBox,hcpcDiagnosis9TBox,hcpcLengthOfNeedYear9TBox,hcpcLengthOfNeedMonth9TBox,hcpcCode10TBox,hcpcQty10TBox,hcpcProduct10TBox,hcpcDX10TBox,hcpcDiagnosis10TBox,hcpcLengthOfNeedYear10TBox,hcpcLengthOfNeedMonth10TBox,primaryInsuranceNameTBox,secondaryInsuranceNameTBox,primaryPolicyNumberTBox,secondaryPolicyNumberTBox,primaryGroupNumberTBox,secondaryGroupNumberTBox,primaryPhoneNumberTBox,secondaryPhoneNumberTBox,priEffectiveDateMM,priEffectiveDateDD,priEffectiveDateYY,secEffectiveDateMM,secEffectiveDateDD,secEffectiveDateYY,priPolicyHolderNameTBox,secPolicyHolderNameTBox,priHoldersDOBMM,priHoldersDOBDD,priHoldersDOBYY,secHoldersDOBMM,secHoldersDOBDD,secHoldersDOBYY,priPolicyHolderEmployerTBox,secPolicyHolderEmployerTBox,priNoteTBox,secNoteTBox,poNumberTBox,creditCardTypeTBox,creditCardNumberTBox,ccDateMM,ccDateDD,ccDateYY,orderingPhysicianNameTBox,orderingPhysicianPhoneTBox,orderingPhysicianUPINTBox,orderingPhysicianFaxTBox,orderingPhysicianAddressTBox,orderingPhysicianCityTBox,orderingPhysicianStateTBox,orderingPhysicianZipTBox,verificationRepNameTBox,verificationDateMM,verificationDateDD,verificationDateYY,verificationTimeTBox,OPTION_4_CBox_VerificationHaveInsYes,OPTION_4_CBox_VerificationHaveInsNo,verificationHaveInsFromMM,verificationHaveInsFromDD,verificationHaveInsFromYY,verificationHaveInsToMM,verificationHaveInsToDD,verificationHaveInsToYY,OPTION_5_CBox_VerificationHaveDMECovYes,OPTION_5_CBox_VerificationHaveDMECovNo,OPTION_6_CBox_VerificationDeductibleYes,OPTION_6_CBox_VerificationDeductibleNo,OPTION_7_CBox_VerificationDeductibleMetYes,OPTION_7_CBox_VerificationDeductibleMetNo,verificationDeductibleAmountTBox,OPTION_8_CBox_VerificationPPOPolicyYes,OPTION_8_CBox_VerificationPPOPolicyNo,verificationPercentagePayAfterDeductibleTBox,OPTION_9_CBox_VerificationPriorAuthYes,OPTION_9_CBox_VerificationPriorAuthNo,verificationAuthNumberTBox,OPTION_10_CBox_VerificationLifetimeBenefitMetYes,OPTION_10_CBox_VerificationLifetimeBenefitMetNo,verificationAuthPhoneNumberTBox,OPTION_11_CBox_VerificationInsFollowMedicareYes,OPTION_11_CBox_VerificationInsFollowMedicareNo,OPTION_12_CBox_VerificationMedicaidPlanMQMB,OPTION_12_CBox_VerificationMedicaidPlanQMB,OPTION_12_CBox_VerificationMedicaidPlanTraditional,VerificationTypeBasePlanTBox,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo,Equipment1TypeTBox,Equipment1RentPurchasedSelect,Equipment1FromMM,Equipment1FromDD,Equipment1FromYY,Equipment1ToMM,Equipment1ToDD,Equipment1ToYY,Equipment1SupplierNameTBox,Equipment1SupplierTelephoneTBox,Equipment2TypeTBox,Equipment2RentPurchasedSelect,Equipment2FromMM,Equipment2FromDD,Equipment2FromYY,Equipment2ToMM,Equipment2ToDD,Equipment2ToYY,Equipment2SupplierNameTBox,Equipment2SupplierTelephoneTBox,Equipment3TypeTBox,Equipment3RentPurchasedSelect,Equipment3FromMM,Equipment3FromDD,Equipment3FromYY,Equipment3ToMM,Equipment3ToDD,Equipment3ToYY,Equipment3SupplierNameTBox,Equipment3SupplierTelephoneTBox,Equipment4TypeTBox,Equipment4RentPurchasedSelect,Equipment4FromMM,Equipment4FromDD,Equipment4FromYY,Equipment4ToMM,Equipment4ToDD,Equipment4ToYY,Equipment4SupplierNameTBox,Equipment4SupplierTelephoneTBox,Equipment5TypeTBox,Equipment5RentPurchasedSelect,Equipment5FromMM,Equipment5FromDD,Equipment5FromYY,Equipment5ToMM,Equipment5ToDD,Equipment5ToYY,Equipment5SupplierNameTBox,Equipment5SupplierTelephoneTBox,OPTION_14_CBox_OxygenPAo2,OPTION_14_CBox_OxygenSAo2,OPTION_14_CBox_OxygenSPo2,OxygenPAO2TBox,OxygenSAO2TBox,CPAPStudy_CBox,CPAPStudyNote,OxygenSPO2TBox,CPAPStudyOnFile_CBox,CPAPStudyOnFileNote,LabTestDateMM,LabTestDateDD,LabTestDateYY,CPAPStudyPerformedAt,LabTestFacilityTBox,CPAPStudyPerformedAt2,CPAPStudyPerformedAt3,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Include the column in the query only if there is a value.                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfset currentrecord = "variables.instance.#currentVar#">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Check each column against the defaults query                                   --->
				<!--- (use UCASE() to find column) and see if there is a                             --->
				<!--- default on any column coming in as a blank and throw                           --->
				<!--- error on those that do not allow a blank.                                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfquery name="getColumnDefault" dbtype="query">
					SELECT IS_NULLABLE, COLUMN_DEFAULT
					FROM defaultsQuery
					WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
				</cfquery>
				
				<cfif evaluate(currentRecord) EQ "" AND getColumnDefault.IS_NULLABLE EQ "No" AND getColumnDefault.COLUMN_DEFAULT EQ ""> 
					<cfset message="Error: The parameter (""#CurrentVar#"") cannot be blank.">
					<cfreturn message>
				</cfif>
				
				<!-------------------------------------------------------------------------------------->
				<!--- If the column is not blank check to make sure the value                        --->
				<!--- is a valid one.                                                                --->
				<!-------------------------------------------------------------------------------------->
				<cfif evaluate(currentRecord) NEQ "" AND evaluate(currentRecord) NEQ "NULL">				
										
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value cannot be evaluated to a date error out.                          --->
						<!-------------------------------------------------------------------------------------->					
						<cfif NOT IsDate(evaluate(currentRecord))>						
							<cf_gcGeneralErrorTemplate				
								message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
						</cfif>		
						
						<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(NOW()) & ":" & Minute(NOW()) & ":" & SECOND(NOW())>
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#CreateODBCDateTime(currentDate)#")>
												
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "NOW()")>
						
					<!-------------------------------------------------------------------------------------->
					<!--- If the current column is a string then add the single                          --->
					<!--- quotes allowing to safely enter the dB.                                        --->
					<!-------------------------------------------------------------------------------------->				 
					<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "'#Replace(evaluate(currentRecord), "'", "''", "ALL")#'")>
										
					<!-------------------------------------------------------------------------------------->
                    <!--- When you send in a value of null and there is a default                        --->
                    <!--- value for that column then add it to the query.                                --->
                    <!-------------------------------------------------------------------------------------->                  
                    <cfelseif evaluate(currentRecord) NEQ "NULL" OR evaluate(currentRecord) NEQ "">
                    	
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#evaluate(currentRecord)#")>  
						                                         
                    </cfif>    				
							  
				
				</cfif>
			
			</cfloop>	
			
			<!-------------------------------------------------------------------------------------->
			<!--- If for some reason the list do not come out the same                           --->
			<!--- lengths or there is an issue throw back an error.                              --->
			<!-------------------------------------------------------------------------------------->			
			<cfif ListLen(columnsToInsert) EQ 0 OR ListLen(columnsToInsertValues) EQ 0><!--- OR ListLen(columnsToInsert) NEQ ListLen(columnsToInsertValues)--->
				<cfset message="Error: The elements in the Columns and the Values do match please check the variables.">
				<cfreturn message>		
			</cfif>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "INSERT INTO INTAKE_PatientIntakeForm  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS recordID ">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase(" (,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", " (,", " (", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Call this object by appending to the where clause the                          --->
	<!--- columns that match your search criteria returning a                            --->
	<!--- query.                                                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getINTAKE_PatientIntakeFormQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getINTAKE_PatientIntakeFormQuery">						
		<cfargument name="Fields" required="No" type="String" default="recordID,hidden_UsersID,hidden_TimeStart,OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing,OPTION_2_CBox_Facility,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital,facilityTBox,hospiceTBox,OPTION_3_CBox_Medicare,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay,hospitalTBox,DischargeDateMM,DischargeDateDD,DischargeDateYY,typeOfPay_Radio,callerNameTBox,callerPhoneTBox,patientNameTBox,roomNumberTBox,bedNumberTBox,patientAddressTBox,patientCityTBox,patientStateTBox,patientZipTBox,patientPhoneTBox,patientDOBMM,patientDOBDD,patientDOBYY,patientSSNTBox,patientHeightFeet,patientHeightInches,patientWeightTBox,alternateContactNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,hcpcCode1TBox,hcpcQty1TBox,hcpcProduct1TBox,hcpcDX1TBox,hcpcDiagnosis1TBox,hcpcLengthOfNeedYear1TBox,hcpcLengthOfNeedMonth1TBox,hcpcCode2TBox,hcpcQty2TBox,hcpcProduct2TBox,hcpcDX2TBox,hcpcDiagnosis2TBox,hcpcLengthOfNeedYear2TBox,hcpcLengthOfNeedMonth2TBox,hcpcCode3TBox,hcpcQty3TBox,hcpcProduct3TBox,hcpcDX3TBox,hcpcDiagnosis3TBox,hcpcLengthOfNeedYear3TBox,hcpcLengthOfNeedMonth3TBox,hcpcCode4TBox,hcpcQty4TBox,hcpcProduct4TBox,hcpcDX4TBox,hcpcDiagnosis4TBox,hcpcLengthOfNeedYear4TBox,hcpcLengthOfNeedMonth4TBox,hcpcCode5TBox,hcpcQty5TBox,hcpcProduct5TBox,hcpcDX5TBox,hcpcDiagnosis5TBox,hcpcLengthOfNeedYear5TBox,hcpcLengthOfNeedMonth5TBox,hcpcCode6TBox,hcpcQty6TBox,hcpcProduct6TBox,hcpcDX6TBox,hcpcDiagnosis6TBox,hcpcLengthOfNeedYear6TBox,hcpcLengthOfNeedMonth6TBox,hcpcCode7TBox,hcpcQty7TBox,hcpcProduct7TBox,hcpcDX7TBox,hcpcDiagnosis7TBox,hcpcLengthOfNeedYear7TBox,hcpcLengthOfNeedMonth7TBox,hcpcCode8TBox,hcpcQty8TBox,hcpcProduct8TBox,hcpcDX8TBox,hcpcDiagnosis8TBox,hcpcLengthOfNeedYear8TBox,hcpcLengthOfNeedMonth8TBox,hcpcCode9TBox,hcpcQty9TBox,hcpcProduct9TBox,hcpcDX9TBox,hcpcDiagnosis9TBox,hcpcLengthOfNeedYear9TBox,hcpcLengthOfNeedMonth9TBox,hcpcCode10TBox,hcpcQty10TBox,hcpcProduct10TBox,hcpcDX10TBox,hcpcDiagnosis10TBox,hcpcLengthOfNeedYear10TBox,hcpcLengthOfNeedMonth10TBox,primaryInsuranceNameTBox,secondaryInsuranceNameTBox,primaryPolicyNumberTBox,secondaryPolicyNumberTBox,primaryGroupNumberTBox,secondaryGroupNumberTBox,primaryPhoneNumberTBox,secondaryPhoneNumberTBox,priEffectiveDateMM,priEffectiveDateDD,priEffectiveDateYY,secEffectiveDateMM,secEffectiveDateDD,secEffectiveDateYY,priPolicyHolderNameTBox,secPolicyHolderNameTBox,priHoldersDOBMM,priHoldersDOBDD,priHoldersDOBYY,secHoldersDOBMM,secHoldersDOBDD,secHoldersDOBYY,priPolicyHolderEmployerTBox,secPolicyHolderEmployerTBox,priNoteTBox,secNoteTBox,poNumberTBox,creditCardTypeTBox,creditCardNumberTBox,ccDateMM,ccDateDD,ccDateYY,orderingPhysicianNameTBox,orderingPhysicianPhoneTBox,orderingPhysicianUPINTBox,orderingPhysicianFaxTBox,orderingPhysicianAddressTBox,orderingPhysicianCityTBox,orderingPhysicianStateTBox,orderingPhysicianZipTBox,verificationRepNameTBox,verificationDateMM,verificationDateDD,verificationDateYY,verificationTimeTBox,OPTION_4_CBox_VerificationHaveInsYes,OPTION_4_CBox_VerificationHaveInsNo,verificationHaveInsFromMM,verificationHaveInsFromDD,verificationHaveInsFromYY,verificationHaveInsToMM,verificationHaveInsToDD,verificationHaveInsToYY,OPTION_5_CBox_VerificationHaveDMECovYes,OPTION_5_CBox_VerificationHaveDMECovNo,OPTION_6_CBox_VerificationDeductibleYes,OPTION_6_CBox_VerificationDeductibleNo,OPTION_7_CBox_VerificationDeductibleMetYes,OPTION_7_CBox_VerificationDeductibleMetNo,verificationDeductibleAmountTBox,OPTION_8_CBox_VerificationPPOPolicyYes,OPTION_8_CBox_VerificationPPOPolicyNo,verificationPercentagePayAfterDeductibleTBox,OPTION_9_CBox_VerificationPriorAuthYes,OPTION_9_CBox_VerificationPriorAuthNo,verificationAuthNumberTBox,OPTION_10_CBox_VerificationLifetimeBenefitMetYes,OPTION_10_CBox_VerificationLifetimeBenefitMetNo,verificationAuthPhoneNumberTBox,OPTION_11_CBox_VerificationInsFollowMedicareYes,OPTION_11_CBox_VerificationInsFollowMedicareNo,OPTION_12_CBox_VerificationMedicaidPlanMQMB,OPTION_12_CBox_VerificationMedicaidPlanQMB,OPTION_12_CBox_VerificationMedicaidPlanTraditional,VerificationTypeBasePlanTBox,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo,Equipment1TypeTBox,Equipment1RentPurchasedSelect,Equipment1FromMM,Equipment1FromDD,Equipment1FromYY,Equipment1ToMM,Equipment1ToDD,Equipment1ToYY,Equipment1SupplierNameTBox,Equipment1SupplierTelephoneTBox,Equipment2TypeTBox,Equipment2RentPurchasedSelect,Equipment2FromMM,Equipment2FromDD,Equipment2FromYY,Equipment2ToMM,Equipment2ToDD,Equipment2ToYY,Equipment2SupplierNameTBox,Equipment2SupplierTelephoneTBox,Equipment3TypeTBox,Equipment3RentPurchasedSelect,Equipment3FromMM,Equipment3FromDD,Equipment3FromYY,Equipment3ToMM,Equipment3ToDD,Equipment3ToYY,Equipment3SupplierNameTBox,Equipment3SupplierTelephoneTBox,Equipment4TypeTBox,Equipment4RentPurchasedSelect,Equipment4FromMM,Equipment4FromDD,Equipment4FromYY,Equipment4ToMM,Equipment4ToDD,Equipment4ToYY,Equipment4SupplierNameTBox,Equipment4SupplierTelephoneTBox,Equipment5TypeTBox,Equipment5RentPurchasedSelect,Equipment5FromMM,Equipment5FromDD,Equipment5FromYY,Equipment5ToMM,Equipment5ToDD,Equipment5ToYY,Equipment5SupplierNameTBox,Equipment5SupplierTelephoneTBox,OPTION_14_CBox_OxygenPAo2,OPTION_14_CBox_OxygenSAo2,OPTION_14_CBox_OxygenSPo2,OxygenPAO2TBox,OxygenSAO2TBox,CPAPStudy_CBox,CPAPStudyNote,OxygenSPO2TBox,CPAPStudyOnFile_CBox,CPAPStudyOnFileNote,LabTestDateMM,LabTestDateDD,LabTestDateYY,CPAPStudyPerformedAt,LabTestFacilityTBox,CPAPStudyPerformedAt2,CPAPStudyPerformedAt3,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="recordID" required="No" type="String" default="">
		<cfargument name="recordID_IN" required="No" type="String" default="">
		<cfargument name="recordID_LIKE" required="No" type="String" default="">
		<cfargument name="hidden_UsersID" required="No" type="String" default="">
		<cfargument name="hidden_UsersID_IN" required="No" type="String" default="">
		<cfargument name="hidden_UsersID_LIKE" required="No" type="String" default="">
		<cfargument name="hidden_TimeStart" required="No" type="String" default="">
		<cfargument name="hidden_TimeStart_IN" required="No" type="String" default="">
		<cfargument name="hidden_TimeStart_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Delivery" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Delivery_IN" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Delivery_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Pickup" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Pickup_IN" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Pickup_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Repair" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Repair_IN" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Repair_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Switch" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Switch_IN" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Switch_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Existing" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Existing_IN" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Existing_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Facility" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Facility_IN" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Facility_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Hospice" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Hospice_IN" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Hospice_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Hospital" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Hospital_IN" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Hospital_LIKE" required="No" type="String" default="">
		<cfargument name="facilityTBox" required="No" type="String" default="">
		<cfargument name="facilityTBox_IN" required="No" type="String" default="">
		<cfargument name="facilityTBox_LIKE" required="No" type="String" default="">
		<cfargument name="hospiceTBox" required="No" type="String" default="">
		<cfargument name="hospiceTBox_IN" required="No" type="String" default="">
		<cfargument name="hospiceTBox_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_3_CBox_Medicare" required="No" type="String" default="">
		<cfargument name="OPTION_3_CBox_Medicare_IN" required="No" type="String" default="">
		<cfargument name="OPTION_3_CBox_Medicare_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_3_CBox_PrivateInsurance" required="No" type="String" default="">
		<cfargument name="OPTION_3_CBox_PrivateInsurance_IN" required="No" type="String" default="">
		<cfargument name="OPTION_3_CBox_PrivateInsurance_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_3_CBox_Medicaid" required="No" type="String" default="">
		<cfargument name="OPTION_3_CBox_Medicaid_IN" required="No" type="String" default="">
		<cfargument name="OPTION_3_CBox_Medicaid_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_3_CBox_PrivatePay" required="No" type="String" default="">
		<cfargument name="OPTION_3_CBox_PrivatePay_IN" required="No" type="String" default="">
		<cfargument name="OPTION_3_CBox_PrivatePay_LIKE" required="No" type="String" default="">
		<cfargument name="hospitalTBox" required="No" type="String" default="">
		<cfargument name="hospitalTBox_IN" required="No" type="String" default="">
		<cfargument name="hospitalTBox_LIKE" required="No" type="String" default="">
		<cfargument name="DischargeDateMM" required="No" type="String" default="">
		<cfargument name="DischargeDateMM_IN" required="No" type="String" default="">
		<cfargument name="DischargeDateMM_LIKE" required="No" type="String" default="">
		<cfargument name="DischargeDateDD" required="No" type="String" default="">
		<cfargument name="DischargeDateDD_IN" required="No" type="String" default="">
		<cfargument name="DischargeDateDD_LIKE" required="No" type="String" default="">
		<cfargument name="DischargeDateYY" required="No" type="String" default="">
		<cfargument name="DischargeDateYY_IN" required="No" type="String" default="">
		<cfargument name="DischargeDateYY_LIKE" required="No" type="String" default="">
		<cfargument name="typeOfPay_Radio" required="No" type="String" default="">
		<cfargument name="typeOfPay_Radio_IN" required="No" type="String" default="">
		<cfargument name="typeOfPay_Radio_LIKE" required="No" type="String" default="">
		<cfargument name="callerNameTBox" required="No" type="String" default="">
		<cfargument name="callerNameTBox_IN" required="No" type="String" default="">
		<cfargument name="callerNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="callerPhoneTBox" required="No" type="String" default="">
		<cfargument name="callerPhoneTBox_IN" required="No" type="String" default="">
		<cfargument name="callerPhoneTBox_LIKE" required="No" type="String" default="">
		<cfargument name="patientNameTBox" required="No" type="String" default="">
		<cfargument name="patientNameTBox_IN" required="No" type="String" default="">
		<cfargument name="patientNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="roomNumberTBox" required="No" type="String" default="">
		<cfargument name="roomNumberTBox_IN" required="No" type="String" default="">
		<cfargument name="roomNumberTBox_LIKE" required="No" type="String" default="">
		<cfargument name="bedNumberTBox" required="No" type="String" default="">
		<cfargument name="bedNumberTBox_IN" required="No" type="String" default="">
		<cfargument name="bedNumberTBox_LIKE" required="No" type="String" default="">
		<cfargument name="patientAddressTBox" required="No" type="String" default="">
		<cfargument name="patientAddressTBox_IN" required="No" type="String" default="">
		<cfargument name="patientAddressTBox_LIKE" required="No" type="String" default="">
		<cfargument name="patientCityTBox" required="No" type="String" default="">
		<cfargument name="patientCityTBox_IN" required="No" type="String" default="">
		<cfargument name="patientCityTBox_LIKE" required="No" type="String" default="">
		<cfargument name="patientStateTBox" required="No" type="String" default="">
		<cfargument name="patientStateTBox_IN" required="No" type="String" default="">
		<cfargument name="patientStateTBox_LIKE" required="No" type="String" default="">
		<cfargument name="patientZipTBox" required="No" type="String" default="">
		<cfargument name="patientZipTBox_IN" required="No" type="String" default="">
		<cfargument name="patientZipTBox_LIKE" required="No" type="String" default="">
		<cfargument name="patientPhoneTBox" required="No" type="String" default="">
		<cfargument name="patientPhoneTBox_IN" required="No" type="String" default="">
		<cfargument name="patientPhoneTBox_LIKE" required="No" type="String" default="">
		<cfargument name="patientDOBMM" required="No" type="String" default="">
		<cfargument name="patientDOBMM_IN" required="No" type="String" default="">
		<cfargument name="patientDOBMM_LIKE" required="No" type="String" default="">
		<cfargument name="patientDOBDD" required="No" type="String" default="">
		<cfargument name="patientDOBDD_IN" required="No" type="String" default="">
		<cfargument name="patientDOBDD_LIKE" required="No" type="String" default="">
		<cfargument name="patientDOBYY" required="No" type="String" default="">
		<cfargument name="patientDOBYY_IN" required="No" type="String" default="">
		<cfargument name="patientDOBYY_LIKE" required="No" type="String" default="">
		<cfargument name="patientSSNTBox" required="No" type="String" default="">
		<cfargument name="patientSSNTBox_IN" required="No" type="String" default="">
		<cfargument name="patientSSNTBox_LIKE" required="No" type="String" default="">
		<cfargument name="patientHeightFeet" required="No" type="String" default="">
		<cfargument name="patientHeightFeet_IN" required="No" type="String" default="">
		<cfargument name="patientHeightFeet_LIKE" required="No" type="String" default="">
		<cfargument name="patientHeightInches" required="No" type="String" default="">
		<cfargument name="patientHeightInches_IN" required="No" type="String" default="">
		<cfargument name="patientHeightInches_LIKE" required="No" type="String" default="">
		<cfargument name="patientWeightTBox" required="No" type="String" default="">
		<cfargument name="patientWeightTBox_IN" required="No" type="String" default="">
		<cfargument name="patientWeightTBox_LIKE" required="No" type="String" default="">
		<cfargument name="alternateContactNameTBox" required="No" type="String" default="">
		<cfargument name="alternateContactNameTBox_IN" required="No" type="String" default="">
		<cfargument name="alternateContactNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="alternateContactRelationshipTBox" required="No" type="String" default="">
		<cfargument name="alternateContactRelationshipTBox_IN" required="No" type="String" default="">
		<cfargument name="alternateContactRelationshipTBox_LIKE" required="No" type="String" default="">
		<cfargument name="alternateContactPhoneTBox" required="No" type="String" default="">
		<cfargument name="alternateContactPhoneTBox_IN" required="No" type="String" default="">
		<cfargument name="alternateContactPhoneTBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode1TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode1TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode1TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty1TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty1TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty1TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct1TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct1TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct1TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX1TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX1TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX1TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis1TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis1TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis1TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear1TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear1TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear1TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth1TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth1TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth1TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode2TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode2TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode2TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty2TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty2TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty2TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct2TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct2TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct2TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX2TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX2TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX2TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis2TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis2TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis2TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear2TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear2TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear2TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth2TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth2TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth2TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode3TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode3TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode3TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty3TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty3TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty3TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct3TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct3TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct3TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX3TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX3TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX3TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis3TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis3TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis3TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear3TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear3TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear3TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth3TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth3TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth3TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode4TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode4TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode4TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty4TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty4TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty4TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct4TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct4TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct4TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX4TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX4TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX4TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis4TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis4TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis4TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear4TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear4TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear4TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth4TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth4TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth4TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode5TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode5TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode5TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty5TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty5TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty5TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct5TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct5TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct5TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX5TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX5TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX5TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis5TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis5TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis5TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear5TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear5TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear5TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth5TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth5TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth5TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode6TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode6TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode6TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty6TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty6TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty6TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct6TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct6TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct6TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX6TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX6TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX6TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis6TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis6TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis6TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear6TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear6TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear6TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth6TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth6TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth6TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode7TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode7TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode7TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty7TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty7TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty7TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct7TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct7TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct7TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX7TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX7TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX7TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis7TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis7TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis7TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear7TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear7TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear7TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth7TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth7TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth7TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode8TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode8TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode8TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty8TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty8TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty8TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct8TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct8TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct8TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX8TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX8TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX8TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis8TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis8TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis8TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear8TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear8TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear8TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth8TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth8TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth8TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode9TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode9TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode9TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty9TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty9TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty9TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct9TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct9TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct9TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX9TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX9TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX9TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis9TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis9TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis9TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear9TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear9TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear9TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth9TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth9TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth9TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcCode10TBox" required="No" type="String" default="">
		<cfargument name="hcpcCode10TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcCode10TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcQty10TBox" required="No" type="String" default="">
		<cfargument name="hcpcQty10TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcQty10TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcProduct10TBox" required="No" type="String" default="">
		<cfargument name="hcpcProduct10TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcProduct10TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDX10TBox" required="No" type="String" default="">
		<cfargument name="hcpcDX10TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDX10TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis10TBox" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis10TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcDiagnosis10TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear10TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear10TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedYear10TBox_LIKE" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth10TBox" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth10TBox_IN" required="No" type="String" default="">
		<cfargument name="hcpcLengthOfNeedMonth10TBox_LIKE" required="No" type="String" default="">
		<cfargument name="primaryInsuranceNameTBox" required="No" type="String" default="">
		<cfargument name="primaryInsuranceNameTBox_IN" required="No" type="String" default="">
		<cfargument name="primaryInsuranceNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="secondaryInsuranceNameTBox" required="No" type="String" default="">
		<cfargument name="secondaryInsuranceNameTBox_IN" required="No" type="String" default="">
		<cfargument name="secondaryInsuranceNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="primaryPolicyNumberTBox" required="No" type="String" default="">
		<cfargument name="primaryPolicyNumberTBox_IN" required="No" type="String" default="">
		<cfargument name="primaryPolicyNumberTBox_LIKE" required="No" type="String" default="">
		<cfargument name="secondaryPolicyNumberTBox" required="No" type="String" default="">
		<cfargument name="secondaryPolicyNumberTBox_IN" required="No" type="String" default="">
		<cfargument name="secondaryPolicyNumberTBox_LIKE" required="No" type="String" default="">
		<cfargument name="primaryGroupNumberTBox" required="No" type="String" default="">
		<cfargument name="primaryGroupNumberTBox_IN" required="No" type="String" default="">
		<cfargument name="primaryGroupNumberTBox_LIKE" required="No" type="String" default="">
		<cfargument name="secondaryGroupNumberTBox" required="No" type="String" default="">
		<cfargument name="secondaryGroupNumberTBox_IN" required="No" type="String" default="">
		<cfargument name="secondaryGroupNumberTBox_LIKE" required="No" type="String" default="">
		<cfargument name="primaryPhoneNumberTBox" required="No" type="String" default="">
		<cfargument name="primaryPhoneNumberTBox_IN" required="No" type="String" default="">
		<cfargument name="primaryPhoneNumberTBox_LIKE" required="No" type="String" default="">
		<cfargument name="secondaryPhoneNumberTBox" required="No" type="String" default="">
		<cfargument name="secondaryPhoneNumberTBox_IN" required="No" type="String" default="">
		<cfargument name="secondaryPhoneNumberTBox_LIKE" required="No" type="String" default="">
		<cfargument name="priEffectiveDateMM" required="No" type="String" default="">
		<cfargument name="priEffectiveDateMM_IN" required="No" type="String" default="">
		<cfargument name="priEffectiveDateMM_LIKE" required="No" type="String" default="">
		<cfargument name="priEffectiveDateDD" required="No" type="String" default="">
		<cfargument name="priEffectiveDateDD_IN" required="No" type="String" default="">
		<cfargument name="priEffectiveDateDD_LIKE" required="No" type="String" default="">
		<cfargument name="priEffectiveDateYY" required="No" type="String" default="">
		<cfargument name="priEffectiveDateYY_IN" required="No" type="String" default="">
		<cfargument name="priEffectiveDateYY_LIKE" required="No" type="String" default="">
		<cfargument name="secEffectiveDateMM" required="No" type="String" default="">
		<cfargument name="secEffectiveDateMM_IN" required="No" type="String" default="">
		<cfargument name="secEffectiveDateMM_LIKE" required="No" type="String" default="">
		<cfargument name="secEffectiveDateDD" required="No" type="String" default="">
		<cfargument name="secEffectiveDateDD_IN" required="No" type="String" default="">
		<cfargument name="secEffectiveDateDD_LIKE" required="No" type="String" default="">
		<cfargument name="secEffectiveDateYY" required="No" type="String" default="">
		<cfargument name="secEffectiveDateYY_IN" required="No" type="String" default="">
		<cfargument name="secEffectiveDateYY_LIKE" required="No" type="String" default="">
		<cfargument name="priPolicyHolderNameTBox" required="No" type="String" default="">
		<cfargument name="priPolicyHolderNameTBox_IN" required="No" type="String" default="">
		<cfargument name="priPolicyHolderNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="secPolicyHolderNameTBox" required="No" type="String" default="">
		<cfargument name="secPolicyHolderNameTBox_IN" required="No" type="String" default="">
		<cfargument name="secPolicyHolderNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="priHoldersDOBMM" required="No" type="String" default="">
		<cfargument name="priHoldersDOBMM_IN" required="No" type="String" default="">
		<cfargument name="priHoldersDOBMM_LIKE" required="No" type="String" default="">
		<cfargument name="priHoldersDOBDD" required="No" type="String" default="">
		<cfargument name="priHoldersDOBDD_IN" required="No" type="String" default="">
		<cfargument name="priHoldersDOBDD_LIKE" required="No" type="String" default="">
		<cfargument name="priHoldersDOBYY" required="No" type="String" default="">
		<cfargument name="priHoldersDOBYY_IN" required="No" type="String" default="">
		<cfargument name="priHoldersDOBYY_LIKE" required="No" type="String" default="">
		<cfargument name="secHoldersDOBMM" required="No" type="String" default="">
		<cfargument name="secHoldersDOBMM_IN" required="No" type="String" default="">
		<cfargument name="secHoldersDOBMM_LIKE" required="No" type="String" default="">
		<cfargument name="secHoldersDOBDD" required="No" type="String" default="">
		<cfargument name="secHoldersDOBDD_IN" required="No" type="String" default="">
		<cfargument name="secHoldersDOBDD_LIKE" required="No" type="String" default="">
		<cfargument name="secHoldersDOBYY" required="No" type="String" default="">
		<cfargument name="secHoldersDOBYY_IN" required="No" type="String" default="">
		<cfargument name="secHoldersDOBYY_LIKE" required="No" type="String" default="">
		<cfargument name="priPolicyHolderEmployerTBox" required="No" type="String" default="">
		<cfargument name="priPolicyHolderEmployerTBox_IN" required="No" type="String" default="">
		<cfargument name="priPolicyHolderEmployerTBox_LIKE" required="No" type="String" default="">
		<cfargument name="secPolicyHolderEmployerTBox" required="No" type="String" default="">
		<cfargument name="secPolicyHolderEmployerTBox_IN" required="No" type="String" default="">
		<cfargument name="secPolicyHolderEmployerTBox_LIKE" required="No" type="String" default="">
		<cfargument name="priNoteTBox" required="No" type="String" default="">
		<cfargument name="priNoteTBox_IN" required="No" type="String" default="">
		<cfargument name="priNoteTBox_LIKE" required="No" type="String" default="">
		<cfargument name="secNoteTBox" required="No" type="String" default="">
		<cfargument name="secNoteTBox_IN" required="No" type="String" default="">
		<cfargument name="secNoteTBox_LIKE" required="No" type="String" default="">
		<cfargument name="poNumberTBox" required="No" type="String" default="">
		<cfargument name="poNumberTBox_IN" required="No" type="String" default="">
		<cfargument name="poNumberTBox_LIKE" required="No" type="String" default="">
		<cfargument name="creditCardTypeTBox" required="No" type="String" default="">
		<cfargument name="creditCardTypeTBox_IN" required="No" type="String" default="">
		<cfargument name="creditCardTypeTBox_LIKE" required="No" type="String" default="">
		<cfargument name="creditCardNumberTBox" required="No" type="String" default="">
		<cfargument name="creditCardNumberTBox_IN" required="No" type="String" default="">
		<cfargument name="creditCardNumberTBox_LIKE" required="No" type="String" default="">
		<cfargument name="ccDateMM" required="No" type="String" default="">
		<cfargument name="ccDateMM_IN" required="No" type="String" default="">
		<cfargument name="ccDateMM_LIKE" required="No" type="String" default="">
		<cfargument name="ccDateDD" required="No" type="String" default="">
		<cfargument name="ccDateDD_IN" required="No" type="String" default="">
		<cfargument name="ccDateDD_LIKE" required="No" type="String" default="">
		<cfargument name="ccDateYY" required="No" type="String" default="">
		<cfargument name="ccDateYY_IN" required="No" type="String" default="">
		<cfargument name="ccDateYY_LIKE" required="No" type="String" default="">
		<cfargument name="orderingPhysicianNameTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianNameTBox_IN" required="No" type="String" default="">
		<cfargument name="orderingPhysicianNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="orderingPhysicianPhoneTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianPhoneTBox_IN" required="No" type="String" default="">
		<cfargument name="orderingPhysicianPhoneTBox_LIKE" required="No" type="String" default="">
		<cfargument name="orderingPhysicianUPINTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianUPINTBox_IN" required="No" type="String" default="">
		<cfargument name="orderingPhysicianUPINTBox_LIKE" required="No" type="String" default="">
		<cfargument name="orderingPhysicianFaxTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianFaxTBox_IN" required="No" type="String" default="">
		<cfargument name="orderingPhysicianFaxTBox_LIKE" required="No" type="String" default="">
		<cfargument name="orderingPhysicianAddressTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianAddressTBox_IN" required="No" type="String" default="">
		<cfargument name="orderingPhysicianAddressTBox_LIKE" required="No" type="String" default="">
		<cfargument name="orderingPhysicianCityTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianCityTBox_IN" required="No" type="String" default="">
		<cfargument name="orderingPhysicianCityTBox_LIKE" required="No" type="String" default="">
		<cfargument name="orderingPhysicianStateTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianStateTBox_IN" required="No" type="String" default="">
		<cfargument name="orderingPhysicianStateTBox_LIKE" required="No" type="String" default="">
		<cfargument name="orderingPhysicianZipTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianZipTBox_IN" required="No" type="String" default="">
		<cfargument name="orderingPhysicianZipTBox_LIKE" required="No" type="String" default="">
		<cfargument name="verificationRepNameTBox" required="No" type="String" default="">
		<cfargument name="verificationRepNameTBox_IN" required="No" type="String" default="">
		<cfargument name="verificationRepNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="verificationDateMM" required="No" type="String" default="">
		<cfargument name="verificationDateMM_IN" required="No" type="String" default="">
		<cfargument name="verificationDateMM_LIKE" required="No" type="String" default="">
		<cfargument name="verificationDateDD" required="No" type="String" default="">
		<cfargument name="verificationDateDD_IN" required="No" type="String" default="">
		<cfargument name="verificationDateDD_LIKE" required="No" type="String" default="">
		<cfargument name="verificationDateYY" required="No" type="String" default="">
		<cfargument name="verificationDateYY_IN" required="No" type="String" default="">
		<cfargument name="verificationDateYY_LIKE" required="No" type="String" default="">
		<cfargument name="verificationTimeTBox" required="No" type="String" default="">
		<cfargument name="verificationTimeTBox_IN" required="No" type="String" default="">
		<cfargument name="verificationTimeTBox_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_4_CBox_VerificationHaveInsYes" required="No" type="String" default="">
		<cfargument name="OPTION_4_CBox_VerificationHaveInsYes_IN" required="No" type="String" default="">
		<cfargument name="OPTION_4_CBox_VerificationHaveInsYes_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_4_CBox_VerificationHaveInsNo" required="No" type="String" default="">
		<cfargument name="OPTION_4_CBox_VerificationHaveInsNo_IN" required="No" type="String" default="">
		<cfargument name="OPTION_4_CBox_VerificationHaveInsNo_LIKE" required="No" type="String" default="">
		<cfargument name="verificationHaveInsFromMM" required="No" type="String" default="">
		<cfargument name="verificationHaveInsFromMM_IN" required="No" type="String" default="">
		<cfargument name="verificationHaveInsFromMM_LIKE" required="No" type="String" default="">
		<cfargument name="verificationHaveInsFromDD" required="No" type="String" default="">
		<cfargument name="verificationHaveInsFromDD_IN" required="No" type="String" default="">
		<cfargument name="verificationHaveInsFromDD_LIKE" required="No" type="String" default="">
		<cfargument name="verificationHaveInsFromYY" required="No" type="String" default="">
		<cfargument name="verificationHaveInsFromYY_IN" required="No" type="String" default="">
		<cfargument name="verificationHaveInsFromYY_LIKE" required="No" type="String" default="">
		<cfargument name="verificationHaveInsToMM" required="No" type="String" default="">
		<cfargument name="verificationHaveInsToMM_IN" required="No" type="String" default="">
		<cfargument name="verificationHaveInsToMM_LIKE" required="No" type="String" default="">
		<cfargument name="verificationHaveInsToDD" required="No" type="String" default="">
		<cfargument name="verificationHaveInsToDD_IN" required="No" type="String" default="">
		<cfargument name="verificationHaveInsToDD_LIKE" required="No" type="String" default="">
		<cfargument name="verificationHaveInsToYY" required="No" type="String" default="">
		<cfargument name="verificationHaveInsToYY_IN" required="No" type="String" default="">
		<cfargument name="verificationHaveInsToYY_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_5_CBox_VerificationHaveDMECovYes" required="No" type="String" default="">
		<cfargument name="OPTION_5_CBox_VerificationHaveDMECovYes_IN" required="No" type="String" default="">
		<cfargument name="OPTION_5_CBox_VerificationHaveDMECovYes_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_5_CBox_VerificationHaveDMECovNo" required="No" type="String" default="">
		<cfargument name="OPTION_5_CBox_VerificationHaveDMECovNo_IN" required="No" type="String" default="">
		<cfargument name="OPTION_5_CBox_VerificationHaveDMECovNo_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_6_CBox_VerificationDeductibleYes" required="No" type="String" default="">
		<cfargument name="OPTION_6_CBox_VerificationDeductibleYes_IN" required="No" type="String" default="">
		<cfargument name="OPTION_6_CBox_VerificationDeductibleYes_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_6_CBox_VerificationDeductibleNo" required="No" type="String" default="">
		<cfargument name="OPTION_6_CBox_VerificationDeductibleNo_IN" required="No" type="String" default="">
		<cfargument name="OPTION_6_CBox_VerificationDeductibleNo_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_7_CBox_VerificationDeductibleMetYes" required="No" type="String" default="">
		<cfargument name="OPTION_7_CBox_VerificationDeductibleMetYes_IN" required="No" type="String" default="">
		<cfargument name="OPTION_7_CBox_VerificationDeductibleMetYes_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_7_CBox_VerificationDeductibleMetNo" required="No" type="String" default="">
		<cfargument name="OPTION_7_CBox_VerificationDeductibleMetNo_IN" required="No" type="String" default="">
		<cfargument name="OPTION_7_CBox_VerificationDeductibleMetNo_LIKE" required="No" type="String" default="">
		<cfargument name="verificationDeductibleAmountTBox" required="No" type="String" default="">
		<cfargument name="verificationDeductibleAmountTBox_IN" required="No" type="String" default="">
		<cfargument name="verificationDeductibleAmountTBox_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_8_CBox_VerificationPPOPolicyYes" required="No" type="String" default="">
		<cfargument name="OPTION_8_CBox_VerificationPPOPolicyYes_IN" required="No" type="String" default="">
		<cfargument name="OPTION_8_CBox_VerificationPPOPolicyYes_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_8_CBox_VerificationPPOPolicyNo" required="No" type="String" default="">
		<cfargument name="OPTION_8_CBox_VerificationPPOPolicyNo_IN" required="No" type="String" default="">
		<cfargument name="OPTION_8_CBox_VerificationPPOPolicyNo_LIKE" required="No" type="String" default="">
		<cfargument name="verificationPercentagePayAfterDeductibleTBox" required="No" type="String" default="">
		<cfargument name="verificationPercentagePayAfterDeductibleTBox_IN" required="No" type="String" default="">
		<cfargument name="verificationPercentagePayAfterDeductibleTBox_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_9_CBox_VerificationPriorAuthYes" required="No" type="String" default="">
		<cfargument name="OPTION_9_CBox_VerificationPriorAuthYes_IN" required="No" type="String" default="">
		<cfargument name="OPTION_9_CBox_VerificationPriorAuthYes_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_9_CBox_VerificationPriorAuthNo" required="No" type="String" default="">
		<cfargument name="OPTION_9_CBox_VerificationPriorAuthNo_IN" required="No" type="String" default="">
		<cfargument name="OPTION_9_CBox_VerificationPriorAuthNo_LIKE" required="No" type="String" default="">
		<cfargument name="verificationAuthNumberTBox" required="No" type="String" default="">
		<cfargument name="verificationAuthNumberTBox_IN" required="No" type="String" default="">
		<cfargument name="verificationAuthNumberTBox_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_10_CBox_VerificationLifetimeBenefitMetYes" required="No" type="String" default="">
		<cfargument name="OPTION_10_CBox_VerificationLifetimeBenefitMetYes_IN" required="No" type="String" default="">
		<cfargument name="OPTION_10_CBox_VerificationLifetimeBenefitMetYes_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_10_CBox_VerificationLifetimeBenefitMetNo" required="No" type="String" default="">
		<cfargument name="OPTION_10_CBox_VerificationLifetimeBenefitMetNo_IN" required="No" type="String" default="">
		<cfargument name="OPTION_10_CBox_VerificationLifetimeBenefitMetNo_LIKE" required="No" type="String" default="">
		<cfargument name="verificationAuthPhoneNumberTBox" required="No" type="String" default="">
		<cfargument name="verificationAuthPhoneNumberTBox_IN" required="No" type="String" default="">
		<cfargument name="verificationAuthPhoneNumberTBox_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_11_CBox_VerificationInsFollowMedicareYes" required="No" type="String" default="">
		<cfargument name="OPTION_11_CBox_VerificationInsFollowMedicareYes_IN" required="No" type="String" default="">
		<cfargument name="OPTION_11_CBox_VerificationInsFollowMedicareYes_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_11_CBox_VerificationInsFollowMedicareNo" required="No" type="String" default="">
		<cfargument name="OPTION_11_CBox_VerificationInsFollowMedicareNo_IN" required="No" type="String" default="">
		<cfargument name="OPTION_11_CBox_VerificationInsFollowMedicareNo_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_12_CBox_VerificationMedicaidPlanMQMB" required="No" type="String" default="">
		<cfargument name="OPTION_12_CBox_VerificationMedicaidPlanMQMB_IN" required="No" type="String" default="">
		<cfargument name="OPTION_12_CBox_VerificationMedicaidPlanMQMB_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_12_CBox_VerificationMedicaidPlanQMB" required="No" type="String" default="">
		<cfargument name="OPTION_12_CBox_VerificationMedicaidPlanQMB_IN" required="No" type="String" default="">
		<cfargument name="OPTION_12_CBox_VerificationMedicaidPlanQMB_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_12_CBox_VerificationMedicaidPlanTraditional" required="No" type="String" default="">
		<cfargument name="OPTION_12_CBox_VerificationMedicaidPlanTraditional_IN" required="No" type="String" default="">
		<cfargument name="OPTION_12_CBox_VerificationMedicaidPlanTraditional_LIKE" required="No" type="String" default="">
		<cfargument name="VerificationTypeBasePlanTBox" required="No" type="String" default="">
		<cfargument name="VerificationTypeBasePlanTBox_IN" required="No" type="String" default="">
		<cfargument name="VerificationTypeBasePlanTBox_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_13_CBox_PastEquipmentYes" required="No" type="String" default="">
		<cfargument name="OPTION_13_CBox_PastEquipmentYes_IN" required="No" type="String" default="">
		<cfargument name="OPTION_13_CBox_PastEquipmentYes_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_13_CBox_PastEquipmentNo" required="No" type="String" default="">
		<cfargument name="OPTION_13_CBox_PastEquipmentNo_IN" required="No" type="String" default="">
		<cfargument name="OPTION_13_CBox_PastEquipmentNo_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment1TypeTBox" required="No" type="String" default="">
		<cfargument name="Equipment1TypeTBox_IN" required="No" type="String" default="">
		<cfargument name="Equipment1TypeTBox_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment1RentPurchasedSelect" required="No" type="String" default="">
		<cfargument name="Equipment1RentPurchasedSelect_IN" required="No" type="String" default="">
		<cfargument name="Equipment1RentPurchasedSelect_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment1FromMM" required="No" type="String" default="">
		<cfargument name="Equipment1FromMM_IN" required="No" type="String" default="">
		<cfargument name="Equipment1FromMM_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment1FromDD" required="No" type="String" default="">
		<cfargument name="Equipment1FromDD_IN" required="No" type="String" default="">
		<cfargument name="Equipment1FromDD_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment1FromYY" required="No" type="String" default="">
		<cfargument name="Equipment1FromYY_IN" required="No" type="String" default="">
		<cfargument name="Equipment1FromYY_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment1ToMM" required="No" type="String" default="">
		<cfargument name="Equipment1ToMM_IN" required="No" type="String" default="">
		<cfargument name="Equipment1ToMM_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment1ToDD" required="No" type="String" default="">
		<cfargument name="Equipment1ToDD_IN" required="No" type="String" default="">
		<cfargument name="Equipment1ToDD_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment1ToYY" required="No" type="String" default="">
		<cfargument name="Equipment1ToYY_IN" required="No" type="String" default="">
		<cfargument name="Equipment1ToYY_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment1SupplierNameTBox" required="No" type="String" default="">
		<cfargument name="Equipment1SupplierNameTBox_IN" required="No" type="String" default="">
		<cfargument name="Equipment1SupplierNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment1SupplierTelephoneTBox" required="No" type="String" default="">
		<cfargument name="Equipment1SupplierTelephoneTBox_IN" required="No" type="String" default="">
		<cfargument name="Equipment1SupplierTelephoneTBox_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment2TypeTBox" required="No" type="String" default="">
		<cfargument name="Equipment2TypeTBox_IN" required="No" type="String" default="">
		<cfargument name="Equipment2TypeTBox_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment2RentPurchasedSelect" required="No" type="String" default="">
		<cfargument name="Equipment2RentPurchasedSelect_IN" required="No" type="String" default="">
		<cfargument name="Equipment2RentPurchasedSelect_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment2FromMM" required="No" type="String" default="">
		<cfargument name="Equipment2FromMM_IN" required="No" type="String" default="">
		<cfargument name="Equipment2FromMM_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment2FromDD" required="No" type="String" default="">
		<cfargument name="Equipment2FromDD_IN" required="No" type="String" default="">
		<cfargument name="Equipment2FromDD_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment2FromYY" required="No" type="String" default="">
		<cfargument name="Equipment2FromYY_IN" required="No" type="String" default="">
		<cfargument name="Equipment2FromYY_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment2ToMM" required="No" type="String" default="">
		<cfargument name="Equipment2ToMM_IN" required="No" type="String" default="">
		<cfargument name="Equipment2ToMM_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment2ToDD" required="No" type="String" default="">
		<cfargument name="Equipment2ToDD_IN" required="No" type="String" default="">
		<cfargument name="Equipment2ToDD_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment2ToYY" required="No" type="String" default="">
		<cfargument name="Equipment2ToYY_IN" required="No" type="String" default="">
		<cfargument name="Equipment2ToYY_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment2SupplierNameTBox" required="No" type="String" default="">
		<cfargument name="Equipment2SupplierNameTBox_IN" required="No" type="String" default="">
		<cfargument name="Equipment2SupplierNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment2SupplierTelephoneTBox" required="No" type="String" default="">
		<cfargument name="Equipment2SupplierTelephoneTBox_IN" required="No" type="String" default="">
		<cfargument name="Equipment2SupplierTelephoneTBox_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment3TypeTBox" required="No" type="String" default="">
		<cfargument name="Equipment3TypeTBox_IN" required="No" type="String" default="">
		<cfargument name="Equipment3TypeTBox_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment3RentPurchasedSelect" required="No" type="String" default="">
		<cfargument name="Equipment3RentPurchasedSelect_IN" required="No" type="String" default="">
		<cfargument name="Equipment3RentPurchasedSelect_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment3FromMM" required="No" type="String" default="">
		<cfargument name="Equipment3FromMM_IN" required="No" type="String" default="">
		<cfargument name="Equipment3FromMM_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment3FromDD" required="No" type="String" default="">
		<cfargument name="Equipment3FromDD_IN" required="No" type="String" default="">
		<cfargument name="Equipment3FromDD_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment3FromYY" required="No" type="String" default="">
		<cfargument name="Equipment3FromYY_IN" required="No" type="String" default="">
		<cfargument name="Equipment3FromYY_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment3ToMM" required="No" type="String" default="">
		<cfargument name="Equipment3ToMM_IN" required="No" type="String" default="">
		<cfargument name="Equipment3ToMM_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment3ToDD" required="No" type="String" default="">
		<cfargument name="Equipment3ToDD_IN" required="No" type="String" default="">
		<cfargument name="Equipment3ToDD_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment3ToYY" required="No" type="String" default="">
		<cfargument name="Equipment3ToYY_IN" required="No" type="String" default="">
		<cfargument name="Equipment3ToYY_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment3SupplierNameTBox" required="No" type="String" default="">
		<cfargument name="Equipment3SupplierNameTBox_IN" required="No" type="String" default="">
		<cfargument name="Equipment3SupplierNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment3SupplierTelephoneTBox" required="No" type="String" default="">
		<cfargument name="Equipment3SupplierTelephoneTBox_IN" required="No" type="String" default="">
		<cfargument name="Equipment3SupplierTelephoneTBox_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment4TypeTBox" required="No" type="String" default="">
		<cfargument name="Equipment4TypeTBox_IN" required="No" type="String" default="">
		<cfargument name="Equipment4TypeTBox_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment4RentPurchasedSelect" required="No" type="String" default="">
		<cfargument name="Equipment4RentPurchasedSelect_IN" required="No" type="String" default="">
		<cfargument name="Equipment4RentPurchasedSelect_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment4FromMM" required="No" type="String" default="">
		<cfargument name="Equipment4FromMM_IN" required="No" type="String" default="">
		<cfargument name="Equipment4FromMM_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment4FromDD" required="No" type="String" default="">
		<cfargument name="Equipment4FromDD_IN" required="No" type="String" default="">
		<cfargument name="Equipment4FromDD_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment4FromYY" required="No" type="String" default="">
		<cfargument name="Equipment4FromYY_IN" required="No" type="String" default="">
		<cfargument name="Equipment4FromYY_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment4ToMM" required="No" type="String" default="">
		<cfargument name="Equipment4ToMM_IN" required="No" type="String" default="">
		<cfargument name="Equipment4ToMM_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment4ToDD" required="No" type="String" default="">
		<cfargument name="Equipment4ToDD_IN" required="No" type="String" default="">
		<cfargument name="Equipment4ToDD_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment4ToYY" required="No" type="String" default="">
		<cfargument name="Equipment4ToYY_IN" required="No" type="String" default="">
		<cfargument name="Equipment4ToYY_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment4SupplierNameTBox" required="No" type="String" default="">
		<cfargument name="Equipment4SupplierNameTBox_IN" required="No" type="String" default="">
		<cfargument name="Equipment4SupplierNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment4SupplierTelephoneTBox" required="No" type="String" default="">
		<cfargument name="Equipment4SupplierTelephoneTBox_IN" required="No" type="String" default="">
		<cfargument name="Equipment4SupplierTelephoneTBox_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment5TypeTBox" required="No" type="String" default="">
		<cfargument name="Equipment5TypeTBox_IN" required="No" type="String" default="">
		<cfargument name="Equipment5TypeTBox_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment5RentPurchasedSelect" required="No" type="String" default="">
		<cfargument name="Equipment5RentPurchasedSelect_IN" required="No" type="String" default="">
		<cfargument name="Equipment5RentPurchasedSelect_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment5FromMM" required="No" type="String" default="">
		<cfargument name="Equipment5FromMM_IN" required="No" type="String" default="">
		<cfargument name="Equipment5FromMM_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment5FromDD" required="No" type="String" default="">
		<cfargument name="Equipment5FromDD_IN" required="No" type="String" default="">
		<cfargument name="Equipment5FromDD_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment5FromYY" required="No" type="String" default="">
		<cfargument name="Equipment5FromYY_IN" required="No" type="String" default="">
		<cfargument name="Equipment5FromYY_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment5ToMM" required="No" type="String" default="">
		<cfargument name="Equipment5ToMM_IN" required="No" type="String" default="">
		<cfargument name="Equipment5ToMM_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment5ToDD" required="No" type="String" default="">
		<cfargument name="Equipment5ToDD_IN" required="No" type="String" default="">
		<cfargument name="Equipment5ToDD_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment5ToYY" required="No" type="String" default="">
		<cfargument name="Equipment5ToYY_IN" required="No" type="String" default="">
		<cfargument name="Equipment5ToYY_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment5SupplierNameTBox" required="No" type="String" default="">
		<cfargument name="Equipment5SupplierNameTBox_IN" required="No" type="String" default="">
		<cfargument name="Equipment5SupplierNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment5SupplierTelephoneTBox" required="No" type="String" default="">
		<cfargument name="Equipment5SupplierTelephoneTBox_IN" required="No" type="String" default="">
		<cfargument name="Equipment5SupplierTelephoneTBox_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_14_CBox_OxygenPAo2" required="No" type="String" default="">
		<cfargument name="OPTION_14_CBox_OxygenPAo2_IN" required="No" type="String" default="">
		<cfargument name="OPTION_14_CBox_OxygenPAo2_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_14_CBox_OxygenSAo2" required="No" type="String" default="">
		<cfargument name="OPTION_14_CBox_OxygenSAo2_IN" required="No" type="String" default="">
		<cfargument name="OPTION_14_CBox_OxygenSAo2_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_14_CBox_OxygenSPo2" required="No" type="String" default="">
		<cfargument name="OPTION_14_CBox_OxygenSPo2_IN" required="No" type="String" default="">
		<cfargument name="OPTION_14_CBox_OxygenSPo2_LIKE" required="No" type="String" default="">
		<cfargument name="OxygenPAO2TBox" required="No" type="String" default="">
		<cfargument name="OxygenPAO2TBox_IN" required="No" type="String" default="">
		<cfargument name="OxygenPAO2TBox_LIKE" required="No" type="String" default="">
		<cfargument name="OxygenSAO2TBox" required="No" type="String" default="">
		<cfargument name="OxygenSAO2TBox_IN" required="No" type="String" default="">
		<cfargument name="OxygenSAO2TBox_LIKE" required="No" type="String" default="">
		<cfargument name="CPAPStudy_CBox" required="No" type="String" default="">
		<cfargument name="CPAPStudy_CBox_IN" required="No" type="String" default="">
		<cfargument name="CPAPStudy_CBox_LIKE" required="No" type="String" default="">
		<cfargument name="CPAPStudyNote" required="No" type="String" default="">
		<cfargument name="CPAPStudyNote_IN" required="No" type="String" default="">
		<cfargument name="CPAPStudyNote_LIKE" required="No" type="String" default="">
		<cfargument name="OxygenSPO2TBox" required="No" type="String" default="">
		<cfargument name="OxygenSPO2TBox_IN" required="No" type="String" default="">
		<cfargument name="OxygenSPO2TBox_LIKE" required="No" type="String" default="">
		<cfargument name="CPAPStudyOnFile_CBox" required="No" type="String" default="">
		<cfargument name="CPAPStudyOnFile_CBox_IN" required="No" type="String" default="">
		<cfargument name="CPAPStudyOnFile_CBox_LIKE" required="No" type="String" default="">
		<cfargument name="CPAPStudyOnFileNote" required="No" type="String" default="">
		<cfargument name="CPAPStudyOnFileNote_IN" required="No" type="String" default="">
		<cfargument name="CPAPStudyOnFileNote_LIKE" required="No" type="String" default="">
		<cfargument name="LabTestDateMM" required="No" type="String" default="">
		<cfargument name="LabTestDateMM_IN" required="No" type="String" default="">
		<cfargument name="LabTestDateMM_LIKE" required="No" type="String" default="">
		<cfargument name="LabTestDateDD" required="No" type="String" default="">
		<cfargument name="LabTestDateDD_IN" required="No" type="String" default="">
		<cfargument name="LabTestDateDD_LIKE" required="No" type="String" default="">
		<cfargument name="LabTestDateYY" required="No" type="String" default="">
		<cfargument name="LabTestDateYY_IN" required="No" type="String" default="">
		<cfargument name="LabTestDateYY_LIKE" required="No" type="String" default="">
		<cfargument name="CPAPStudyPerformedAt" required="No" type="String" default="">
		<cfargument name="CPAPStudyPerformedAt_IN" required="No" type="String" default="">
		<cfargument name="CPAPStudyPerformedAt_LIKE" required="No" type="String" default="">
		<cfargument name="LabTestFacilityTBox" required="No" type="String" default="">
		<cfargument name="LabTestFacilityTBox_IN" required="No" type="String" default="">
		<cfargument name="LabTestFacilityTBox_LIKE" required="No" type="String" default="">
		<cfargument name="CPAPStudyPerformedAt2" required="No" type="String" default="">
		<cfargument name="CPAPStudyPerformedAt2_IN" required="No" type="String" default="">
		<cfargument name="CPAPStudyPerformedAt2_LIKE" required="No" type="String" default="">
		<cfargument name="CPAPStudyPerformedAt3" required="No" type="String" default="">
		<cfargument name="CPAPStudyPerformedAt3_IN" required="No" type="String" default="">
		<cfargument name="CPAPStudyPerformedAt3_LIKE" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="Active_IN" required="No" type="String" default="">
		<cfargument name="Active_LIKE" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="InactiveCode_IN" required="No" type="String" default="">
		<cfargument name="InactiveCode_LIKE" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateCreated_IN" required="No" type="String" default="">
		<cfargument name="DateCreated_LIKE" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">
		<cfargument name="DateModified_IN" required="No" type="String" default="">
		<cfargument name="DateModified_LIKE" required="No" type="String" default="">

		
		<!-------------------------------------------------------------------------------------->
		<!--- The fields string cannot be blank.                                             --->
		<!-------------------------------------------------------------------------------------->
		<cfif listLen(Fields) LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="The parameter fields used is not valid. The parameter is empty.">
		</cfif>
				
		
		<!-------------------------------------------------------------------------------------->
		<!--- List the columns and loop through the arguments                                --->
		<!--- structure to make sure that the arguments that have                            --->
		<!--- been defined are available in this CFC. Although there are                     --->
		<!--- exceptions. If the argument being sent in contains "_IN"                       --->
		<!--- or "_LIKE" (case sensitive) then let it pass through.                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfset availableColumns = "recordID,recordID_IN,recordID_LIKE,hidden_UsersID,hidden_UsersID_IN,hidden_UsersID_LIKE,hidden_TimeStart,hidden_TimeStart_IN,hidden_TimeStart_LIKE,OPTION_1_CBox_Delivery,OPTION_1_CBox_Delivery_IN,OPTION_1_CBox_Delivery_LIKE,OPTION_1_CBox_Pickup,OPTION_1_CBox_Pickup_IN,OPTION_1_CBox_Pickup_LIKE,OPTION_1_CBox_Repair,OPTION_1_CBox_Repair_IN,OPTION_1_CBox_Repair_LIKE,OPTION_1_CBox_Switch,OPTION_1_CBox_Switch_IN,OPTION_1_CBox_Switch_LIKE,OPTION_1_CBox_Existing,OPTION_1_CBox_Existing_IN,OPTION_1_CBox_Existing_LIKE,OPTION_2_CBox_Facility,OPTION_2_CBox_Facility_IN,OPTION_2_CBox_Facility_LIKE,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospice_IN,OPTION_2_CBox_Hospice_LIKE,OPTION_2_CBox_Hospital,OPTION_2_CBox_Hospital_IN,OPTION_2_CBox_Hospital_LIKE,facilityTBox,facilityTBox_IN,facilityTBox_LIKE,hospiceTBox,hospiceTBox_IN,hospiceTBox_LIKE,OPTION_3_CBox_Medicare,OPTION_3_CBox_Medicare_IN,OPTION_3_CBox_Medicare_LIKE,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_PrivateInsurance_IN,OPTION_3_CBox_PrivateInsurance_LIKE,OPTION_3_CBox_Medicaid,OPTION_3_CBox_Medicaid_IN,OPTION_3_CBox_Medicaid_LIKE,OPTION_3_CBox_PrivatePay,OPTION_3_CBox_PrivatePay_IN,OPTION_3_CBox_PrivatePay_LIKE,hospitalTBox,hospitalTBox_IN,hospitalTBox_LIKE,DischargeDateMM,DischargeDateMM_IN,DischargeDateMM_LIKE,DischargeDateDD,DischargeDateDD_IN,DischargeDateDD_LIKE,DischargeDateYY,DischargeDateYY_IN,DischargeDateYY_LIKE,typeOfPay_Radio,typeOfPay_Radio_IN,typeOfPay_Radio_LIKE,callerNameTBox,callerNameTBox_IN,callerNameTBox_LIKE,callerPhoneTBox,callerPhoneTBox_IN,callerPhoneTBox_LIKE,patientNameTBox,patientNameTBox_IN,patientNameTBox_LIKE,roomNumberTBox,roomNumberTBox_IN,roomNumberTBox_LIKE,bedNumberTBox,bedNumberTBox_IN,bedNumberTBox_LIKE,patientAddressTBox,patientAddressTBox_IN,patientAddressTBox_LIKE,patientCityTBox,patientCityTBox_IN,patientCityTBox_LIKE,patientStateTBox,patientStateTBox_IN,patientStateTBox_LIKE,patientZipTBox,patientZipTBox_IN,patientZipTBox_LIKE,patientPhoneTBox,patientPhoneTBox_IN,patientPhoneTBox_LIKE,patientDOBMM,patientDOBMM_IN,patientDOBMM_LIKE,patientDOBDD,patientDOBDD_IN,patientDOBDD_LIKE,patientDOBYY,patientDOBYY_IN,patientDOBYY_LIKE,patientSSNTBox,patientSSNTBox_IN,patientSSNTBox_LIKE,patientHeightFeet,patientHeightFeet_IN,patientHeightFeet_LIKE,patientHeightInches,patientHeightInches_IN,patientHeightInches_LIKE,patientWeightTBox,patientWeightTBox_IN,patientWeightTBox_LIKE,alternateContactNameTBox,alternateContactNameTBox_IN,alternateContactNameTBox_LIKE,alternateContactRelationshipTBox,alternateContactRelationshipTBox_IN,alternateContactRelationshipTBox_LIKE,alternateContactPhoneTBox,alternateContactPhoneTBox_IN,alternateContactPhoneTBox_LIKE,hcpcCode1TBox,hcpcCode1TBox_IN,hcpcCode1TBox_LIKE,hcpcQty1TBox,hcpcQty1TBox_IN,hcpcQty1TBox_LIKE,hcpcProduct1TBox,hcpcProduct1TBox_IN,hcpcProduct1TBox_LIKE,hcpcDX1TBox,hcpcDX1TBox_IN,hcpcDX1TBox_LIKE,hcpcDiagnosis1TBox,hcpcDiagnosis1TBox_IN,hcpcDiagnosis1TBox_LIKE,hcpcLengthOfNeedYear1TBox,hcpcLengthOfNeedYear1TBox_IN,hcpcLengthOfNeedYear1TBox_LIKE,hcpcLengthOfNeedMonth1TBox,hcpcLengthOfNeedMonth1TBox_IN,hcpcLengthOfNeedMonth1TBox_LIKE,hcpcCode2TBox,hcpcCode2TBox_IN,hcpcCode2TBox_LIKE,hcpcQty2TBox,hcpcQty2TBox_IN,hcpcQty2TBox_LIKE,hcpcProduct2TBox,hcpcProduct2TBox_IN,hcpcProduct2TBox_LIKE,hcpcDX2TBox,hcpcDX2TBox_IN,hcpcDX2TBox_LIKE,hcpcDiagnosis2TBox,hcpcDiagnosis2TBox_IN,hcpcDiagnosis2TBox_LIKE,hcpcLengthOfNeedYear2TBox,hcpcLengthOfNeedYear2TBox_IN,hcpcLengthOfNeedYear2TBox_LIKE,hcpcLengthOfNeedMonth2TBox,hcpcLengthOfNeedMonth2TBox_IN,hcpcLengthOfNeedMonth2TBox_LIKE,hcpcCode3TBox,hcpcCode3TBox_IN,hcpcCode3TBox_LIKE,hcpcQty3TBox,hcpcQty3TBox_IN,hcpcQty3TBox_LIKE,hcpcProduct3TBox,hcpcProduct3TBox_IN,hcpcProduct3TBox_LIKE,hcpcDX3TBox,hcpcDX3TBox_IN,hcpcDX3TBox_LIKE,hcpcDiagnosis3TBox,hcpcDiagnosis3TBox_IN,hcpcDiagnosis3TBox_LIKE,hcpcLengthOfNeedYear3TBox,hcpcLengthOfNeedYear3TBox_IN,hcpcLengthOfNeedYear3TBox_LIKE,hcpcLengthOfNeedMonth3TBox,hcpcLengthOfNeedMonth3TBox_IN,hcpcLengthOfNeedMonth3TBox_LIKE,hcpcCode4TBox,hcpcCode4TBox_IN,hcpcCode4TBox_LIKE,hcpcQty4TBox,hcpcQty4TBox_IN,hcpcQty4TBox_LIKE,hcpcProduct4TBox,hcpcProduct4TBox_IN,hcpcProduct4TBox_LIKE,hcpcDX4TBox,hcpcDX4TBox_IN,hcpcDX4TBox_LIKE,hcpcDiagnosis4TBox,hcpcDiagnosis4TBox_IN,hcpcDiagnosis4TBox_LIKE,hcpcLengthOfNeedYear4TBox,hcpcLengthOfNeedYear4TBox_IN,hcpcLengthOfNeedYear4TBox_LIKE,hcpcLengthOfNeedMonth4TBox,hcpcLengthOfNeedMonth4TBox_IN,hcpcLengthOfNeedMonth4TBox_LIKE,hcpcCode5TBox,hcpcCode5TBox_IN,hcpcCode5TBox_LIKE,hcpcQty5TBox,hcpcQty5TBox_IN,hcpcQty5TBox_LIKE,hcpcProduct5TBox,hcpcProduct5TBox_IN,hcpcProduct5TBox_LIKE,hcpcDX5TBox,hcpcDX5TBox_IN,hcpcDX5TBox_LIKE,hcpcDiagnosis5TBox,hcpcDiagnosis5TBox_IN,hcpcDiagnosis5TBox_LIKE,hcpcLengthOfNeedYear5TBox,hcpcLengthOfNeedYear5TBox_IN,hcpcLengthOfNeedYear5TBox_LIKE,hcpcLengthOfNeedMonth5TBox,hcpcLengthOfNeedMonth5TBox_IN,hcpcLengthOfNeedMonth5TBox_LIKE,hcpcCode6TBox,hcpcCode6TBox_IN,hcpcCode6TBox_LIKE,hcpcQty6TBox,hcpcQty6TBox_IN,hcpcQty6TBox_LIKE,hcpcProduct6TBox,hcpcProduct6TBox_IN,hcpcProduct6TBox_LIKE,hcpcDX6TBox,hcpcDX6TBox_IN,hcpcDX6TBox_LIKE,hcpcDiagnosis6TBox,hcpcDiagnosis6TBox_IN,hcpcDiagnosis6TBox_LIKE,hcpcLengthOfNeedYear6TBox,hcpcLengthOfNeedYear6TBox_IN,hcpcLengthOfNeedYear6TBox_LIKE,hcpcLengthOfNeedMonth6TBox,hcpcLengthOfNeedMonth6TBox_IN,hcpcLengthOfNeedMonth6TBox_LIKE,hcpcCode7TBox,hcpcCode7TBox_IN,hcpcCode7TBox_LIKE,hcpcQty7TBox,hcpcQty7TBox_IN,hcpcQty7TBox_LIKE,hcpcProduct7TBox,hcpcProduct7TBox_IN,hcpcProduct7TBox_LIKE,hcpcDX7TBox,hcpcDX7TBox_IN,hcpcDX7TBox_LIKE,hcpcDiagnosis7TBox,hcpcDiagnosis7TBox_IN,hcpcDiagnosis7TBox_LIKE,hcpcLengthOfNeedYear7TBox,hcpcLengthOfNeedYear7TBox_IN,hcpcLengthOfNeedYear7TBox_LIKE,hcpcLengthOfNeedMonth7TBox,hcpcLengthOfNeedMonth7TBox_IN,hcpcLengthOfNeedMonth7TBox_LIKE,hcpcCode8TBox,hcpcCode8TBox_IN,hcpcCode8TBox_LIKE,hcpcQty8TBox,hcpcQty8TBox_IN,hcpcQty8TBox_LIKE,hcpcProduct8TBox,hcpcProduct8TBox_IN,hcpcProduct8TBox_LIKE,hcpcDX8TBox,hcpcDX8TBox_IN,hcpcDX8TBox_LIKE,hcpcDiagnosis8TBox,hcpcDiagnosis8TBox_IN,hcpcDiagnosis8TBox_LIKE,hcpcLengthOfNeedYear8TBox,hcpcLengthOfNeedYear8TBox_IN,hcpcLengthOfNeedYear8TBox_LIKE,hcpcLengthOfNeedMonth8TBox,hcpcLengthOfNeedMonth8TBox_IN,hcpcLengthOfNeedMonth8TBox_LIKE,hcpcCode9TBox,hcpcCode9TBox_IN,hcpcCode9TBox_LIKE,hcpcQty9TBox,hcpcQty9TBox_IN,hcpcQty9TBox_LIKE,hcpcProduct9TBox,hcpcProduct9TBox_IN,hcpcProduct9TBox_LIKE,hcpcDX9TBox,hcpcDX9TBox_IN,hcpcDX9TBox_LIKE,hcpcDiagnosis9TBox,hcpcDiagnosis9TBox_IN,hcpcDiagnosis9TBox_LIKE,hcpcLengthOfNeedYear9TBox,hcpcLengthOfNeedYear9TBox_IN,hcpcLengthOfNeedYear9TBox_LIKE,hcpcLengthOfNeedMonth9TBox,hcpcLengthOfNeedMonth9TBox_IN,hcpcLengthOfNeedMonth9TBox_LIKE,hcpcCode10TBox,hcpcCode10TBox_IN,hcpcCode10TBox_LIKE,hcpcQty10TBox,hcpcQty10TBox_IN,hcpcQty10TBox_LIKE,hcpcProduct10TBox,hcpcProduct10TBox_IN,hcpcProduct10TBox_LIKE,hcpcDX10TBox,hcpcDX10TBox_IN,hcpcDX10TBox_LIKE,hcpcDiagnosis10TBox,hcpcDiagnosis10TBox_IN,hcpcDiagnosis10TBox_LIKE,hcpcLengthOfNeedYear10TBox,hcpcLengthOfNeedYear10TBox_IN,hcpcLengthOfNeedYear10TBox_LIKE,hcpcLengthOfNeedMonth10TBox,hcpcLengthOfNeedMonth10TBox_IN,hcpcLengthOfNeedMonth10TBox_LIKE,primaryInsuranceNameTBox,primaryInsuranceNameTBox_IN,primaryInsuranceNameTBox_LIKE,secondaryInsuranceNameTBox,secondaryInsuranceNameTBox_IN,secondaryInsuranceNameTBox_LIKE,primaryPolicyNumberTBox,primaryPolicyNumberTBox_IN,primaryPolicyNumberTBox_LIKE,secondaryPolicyNumberTBox,secondaryPolicyNumberTBox_IN,secondaryPolicyNumberTBox_LIKE,primaryGroupNumberTBox,primaryGroupNumberTBox_IN,primaryGroupNumberTBox_LIKE,secondaryGroupNumberTBox,secondaryGroupNumberTBox_IN,secondaryGroupNumberTBox_LIKE,primaryPhoneNumberTBox,primaryPhoneNumberTBox_IN,primaryPhoneNumberTBox_LIKE,secondaryPhoneNumberTBox,secondaryPhoneNumberTBox_IN,secondaryPhoneNumberTBox_LIKE,priEffectiveDateMM,priEffectiveDateMM_IN,priEffectiveDateMM_LIKE,priEffectiveDateDD,priEffectiveDateDD_IN,priEffectiveDateDD_LIKE,priEffectiveDateYY,priEffectiveDateYY_IN,priEffectiveDateYY_LIKE,secEffectiveDateMM,secEffectiveDateMM_IN,secEffectiveDateMM_LIKE,secEffectiveDateDD,secEffectiveDateDD_IN,secEffectiveDateDD_LIKE,secEffectiveDateYY,secEffectiveDateYY_IN,secEffectiveDateYY_LIKE,priPolicyHolderNameTBox,priPolicyHolderNameTBox_IN,priPolicyHolderNameTBox_LIKE,secPolicyHolderNameTBox,secPolicyHolderNameTBox_IN,secPolicyHolderNameTBox_LIKE,priHoldersDOBMM,priHoldersDOBMM_IN,priHoldersDOBMM_LIKE,priHoldersDOBDD,priHoldersDOBDD_IN,priHoldersDOBDD_LIKE,priHoldersDOBYY,priHoldersDOBYY_IN,priHoldersDOBYY_LIKE,secHoldersDOBMM,secHoldersDOBMM_IN,secHoldersDOBMM_LIKE,secHoldersDOBDD,secHoldersDOBDD_IN,secHoldersDOBDD_LIKE,secHoldersDOBYY,secHoldersDOBYY_IN,secHoldersDOBYY_LIKE,priPolicyHolderEmployerTBox,priPolicyHolderEmployerTBox_IN,priPolicyHolderEmployerTBox_LIKE,secPolicyHolderEmployerTBox,secPolicyHolderEmployerTBox_IN,secPolicyHolderEmployerTBox_LIKE,priNoteTBox,priNoteTBox_IN,priNoteTBox_LIKE,secNoteTBox,secNoteTBox_IN,secNoteTBox_LIKE,poNumberTBox,poNumberTBox_IN,poNumberTBox_LIKE,creditCardTypeTBox,creditCardTypeTBox_IN,creditCardTypeTBox_LIKE,creditCardNumberTBox,creditCardNumberTBox_IN,creditCardNumberTBox_LIKE,ccDateMM,ccDateMM_IN,ccDateMM_LIKE,ccDateDD,ccDateDD_IN,ccDateDD_LIKE,ccDateYY,ccDateYY_IN,ccDateYY_LIKE,orderingPhysicianNameTBox,orderingPhysicianNameTBox_IN,orderingPhysicianNameTBox_LIKE,orderingPhysicianPhoneTBox,orderingPhysicianPhoneTBox_IN,orderingPhysicianPhoneTBox_LIKE,orderingPhysicianUPINTBox,orderingPhysicianUPINTBox_IN,orderingPhysicianUPINTBox_LIKE,orderingPhysicianFaxTBox,orderingPhysicianFaxTBox_IN,orderingPhysicianFaxTBox_LIKE,orderingPhysicianAddressTBox,orderingPhysicianAddressTBox_IN,orderingPhysicianAddressTBox_LIKE,orderingPhysicianCityTBox,orderingPhysicianCityTBox_IN,orderingPhysicianCityTBox_LIKE,orderingPhysicianStateTBox,orderingPhysicianStateTBox_IN,orderingPhysicianStateTBox_LIKE,orderingPhysicianZipTBox,orderingPhysicianZipTBox_IN,orderingPhysicianZipTBox_LIKE,verificationRepNameTBox,verificationRepNameTBox_IN,verificationRepNameTBox_LIKE,verificationDateMM,verificationDateMM_IN,verificationDateMM_LIKE,verificationDateDD,verificationDateDD_IN,verificationDateDD_LIKE,verificationDateYY,verificationDateYY_IN,verificationDateYY_LIKE,verificationTimeTBox,verificationTimeTBox_IN,verificationTimeTBox_LIKE,OPTION_4_CBox_VerificationHaveInsYes,OPTION_4_CBox_VerificationHaveInsYes_IN,OPTION_4_CBox_VerificationHaveInsYes_LIKE,OPTION_4_CBox_VerificationHaveInsNo,OPTION_4_CBox_VerificationHaveInsNo_IN,OPTION_4_CBox_VerificationHaveInsNo_LIKE,verificationHaveInsFromMM,verificationHaveInsFromMM_IN,verificationHaveInsFromMM_LIKE,verificationHaveInsFromDD,verificationHaveInsFromDD_IN,verificationHaveInsFromDD_LIKE,verificationHaveInsFromYY,verificationHaveInsFromYY_IN,verificationHaveInsFromYY_LIKE,verificationHaveInsToMM,verificationHaveInsToMM_IN,verificationHaveInsToMM_LIKE,verificationHaveInsToDD,verificationHaveInsToDD_IN,verificationHaveInsToDD_LIKE,verificationHaveInsToYY,verificationHaveInsToYY_IN,verificationHaveInsToYY_LIKE,OPTION_5_CBox_VerificationHaveDMECovYes,OPTION_5_CBox_VerificationHaveDMECovYes_IN,OPTION_5_CBox_VerificationHaveDMECovYes_LIKE,OPTION_5_CBox_VerificationHaveDMECovNo,OPTION_5_CBox_VerificationHaveDMECovNo_IN,OPTION_5_CBox_VerificationHaveDMECovNo_LIKE,OPTION_6_CBox_VerificationDeductibleYes,OPTION_6_CBox_VerificationDeductibleYes_IN,OPTION_6_CBox_VerificationDeductibleYes_LIKE,OPTION_6_CBox_VerificationDeductibleNo,OPTION_6_CBox_VerificationDeductibleNo_IN,OPTION_6_CBox_VerificationDeductibleNo_LIKE,OPTION_7_CBox_VerificationDeductibleMetYes,OPTION_7_CBox_VerificationDeductibleMetYes_IN,OPTION_7_CBox_VerificationDeductibleMetYes_LIKE,OPTION_7_CBox_VerificationDeductibleMetNo,OPTION_7_CBox_VerificationDeductibleMetNo_IN,OPTION_7_CBox_VerificationDeductibleMetNo_LIKE,verificationDeductibleAmountTBox,verificationDeductibleAmountTBox_IN,verificationDeductibleAmountTBox_LIKE,OPTION_8_CBox_VerificationPPOPolicyYes,OPTION_8_CBox_VerificationPPOPolicyYes_IN,OPTION_8_CBox_VerificationPPOPolicyYes_LIKE,OPTION_8_CBox_VerificationPPOPolicyNo,OPTION_8_CBox_VerificationPPOPolicyNo_IN,OPTION_8_CBox_VerificationPPOPolicyNo_LIKE,verificationPercentagePayAfterDeductibleTBox,verificationPercentagePayAfterDeductibleTBox_IN,verificationPercentagePayAfterDeductibleTBox_LIKE,OPTION_9_CBox_VerificationPriorAuthYes,OPTION_9_CBox_VerificationPriorAuthYes_IN,OPTION_9_CBox_VerificationPriorAuthYes_LIKE,OPTION_9_CBox_VerificationPriorAuthNo,OPTION_9_CBox_VerificationPriorAuthNo_IN,OPTION_9_CBox_VerificationPriorAuthNo_LIKE,verificationAuthNumberTBox,verificationAuthNumberTBox_IN,verificationAuthNumberTBox_LIKE,OPTION_10_CBox_VerificationLifetimeBenefitMetYes,OPTION_10_CBox_VerificationLifetimeBenefitMetYes_IN,OPTION_10_CBox_VerificationLifetimeBenefitMetYes_LIKE,OPTION_10_CBox_VerificationLifetimeBenefitMetNo,OPTION_10_CBox_VerificationLifetimeBenefitMetNo_IN,OPTION_10_CBox_VerificationLifetimeBenefitMetNo_LIKE,verificationAuthPhoneNumberTBox,verificationAuthPhoneNumberTBox_IN,verificationAuthPhoneNumberTBox_LIKE,OPTION_11_CBox_VerificationInsFollowMedicareYes,OPTION_11_CBox_VerificationInsFollowMedicareYes_IN,OPTION_11_CBox_VerificationInsFollowMedicareYes_LIKE,OPTION_11_CBox_VerificationInsFollowMedicareNo,OPTION_11_CBox_VerificationInsFollowMedicareNo_IN,OPTION_11_CBox_VerificationInsFollowMedicareNo_LIKE,OPTION_12_CBox_VerificationMedicaidPlanMQMB,OPTION_12_CBox_VerificationMedicaidPlanMQMB_IN,OPTION_12_CBox_VerificationMedicaidPlanMQMB_LIKE,OPTION_12_CBox_VerificationMedicaidPlanQMB,OPTION_12_CBox_VerificationMedicaidPlanQMB_IN,OPTION_12_CBox_VerificationMedicaidPlanQMB_LIKE,OPTION_12_CBox_VerificationMedicaidPlanTraditional,OPTION_12_CBox_VerificationMedicaidPlanTraditional_IN,OPTION_12_CBox_VerificationMedicaidPlanTraditional_LIKE,VerificationTypeBasePlanTBox,VerificationTypeBasePlanTBox_IN,VerificationTypeBasePlanTBox_LIKE,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentYes_IN,OPTION_13_CBox_PastEquipmentYes_LIKE,OPTION_13_CBox_PastEquipmentNo,OPTION_13_CBox_PastEquipmentNo_IN,OPTION_13_CBox_PastEquipmentNo_LIKE,Equipment1TypeTBox,Equipment1TypeTBox_IN,Equipment1TypeTBox_LIKE,Equipment1RentPurchasedSelect,Equipment1RentPurchasedSelect_IN,Equipment1RentPurchasedSelect_LIKE,Equipment1FromMM,Equipment1FromMM_IN,Equipment1FromMM_LIKE,Equipment1FromDD,Equipment1FromDD_IN,Equipment1FromDD_LIKE,Equipment1FromYY,Equipment1FromYY_IN,Equipment1FromYY_LIKE,Equipment1ToMM,Equipment1ToMM_IN,Equipment1ToMM_LIKE,Equipment1ToDD,Equipment1ToDD_IN,Equipment1ToDD_LIKE,Equipment1ToYY,Equipment1ToYY_IN,Equipment1ToYY_LIKE,Equipment1SupplierNameTBox,Equipment1SupplierNameTBox_IN,Equipment1SupplierNameTBox_LIKE,Equipment1SupplierTelephoneTBox,Equipment1SupplierTelephoneTBox_IN,Equipment1SupplierTelephoneTBox_LIKE,Equipment2TypeTBox,Equipment2TypeTBox_IN,Equipment2TypeTBox_LIKE,Equipment2RentPurchasedSelect,Equipment2RentPurchasedSelect_IN,Equipment2RentPurchasedSelect_LIKE,Equipment2FromMM,Equipment2FromMM_IN,Equipment2FromMM_LIKE,Equipment2FromDD,Equipment2FromDD_IN,Equipment2FromDD_LIKE,Equipment2FromYY,Equipment2FromYY_IN,Equipment2FromYY_LIKE,Equipment2ToMM,Equipment2ToMM_IN,Equipment2ToMM_LIKE,Equipment2ToDD,Equipment2ToDD_IN,Equipment2ToDD_LIKE,Equipment2ToYY,Equipment2ToYY_IN,Equipment2ToYY_LIKE,Equipment2SupplierNameTBox,Equipment2SupplierNameTBox_IN,Equipment2SupplierNameTBox_LIKE,Equipment2SupplierTelephoneTBox,Equipment2SupplierTelephoneTBox_IN,Equipment2SupplierTelephoneTBox_LIKE,Equipment3TypeTBox,Equipment3TypeTBox_IN,Equipment3TypeTBox_LIKE,Equipment3RentPurchasedSelect,Equipment3RentPurchasedSelect_IN,Equipment3RentPurchasedSelect_LIKE,Equipment3FromMM,Equipment3FromMM_IN,Equipment3FromMM_LIKE,Equipment3FromDD,Equipment3FromDD_IN,Equipment3FromDD_LIKE,Equipment3FromYY,Equipment3FromYY_IN,Equipment3FromYY_LIKE,Equipment3ToMM,Equipment3ToMM_IN,Equipment3ToMM_LIKE,Equipment3ToDD,Equipment3ToDD_IN,Equipment3ToDD_LIKE,Equipment3ToYY,Equipment3ToYY_IN,Equipment3ToYY_LIKE,Equipment3SupplierNameTBox,Equipment3SupplierNameTBox_IN,Equipment3SupplierNameTBox_LIKE,Equipment3SupplierTelephoneTBox,Equipment3SupplierTelephoneTBox_IN,Equipment3SupplierTelephoneTBox_LIKE,Equipment4TypeTBox,Equipment4TypeTBox_IN,Equipment4TypeTBox_LIKE,Equipment4RentPurchasedSelect,Equipment4RentPurchasedSelect_IN,Equipment4RentPurchasedSelect_LIKE,Equipment4FromMM,Equipment4FromMM_IN,Equipment4FromMM_LIKE,Equipment4FromDD,Equipment4FromDD_IN,Equipment4FromDD_LIKE,Equipment4FromYY,Equipment4FromYY_IN,Equipment4FromYY_LIKE,Equipment4ToMM,Equipment4ToMM_IN,Equipment4ToMM_LIKE,Equipment4ToDD,Equipment4ToDD_IN,Equipment4ToDD_LIKE,Equipment4ToYY,Equipment4ToYY_IN,Equipment4ToYY_LIKE,Equipment4SupplierNameTBox,Equipment4SupplierNameTBox_IN,Equipment4SupplierNameTBox_LIKE,Equipment4SupplierTelephoneTBox,Equipment4SupplierTelephoneTBox_IN,Equipment4SupplierTelephoneTBox_LIKE,Equipment5TypeTBox,Equipment5TypeTBox_IN,Equipment5TypeTBox_LIKE,Equipment5RentPurchasedSelect,Equipment5RentPurchasedSelect_IN,Equipment5RentPurchasedSelect_LIKE,Equipment5FromMM,Equipment5FromMM_IN,Equipment5FromMM_LIKE,Equipment5FromDD,Equipment5FromDD_IN,Equipment5FromDD_LIKE,Equipment5FromYY,Equipment5FromYY_IN,Equipment5FromYY_LIKE,Equipment5ToMM,Equipment5ToMM_IN,Equipment5ToMM_LIKE,Equipment5ToDD,Equipment5ToDD_IN,Equipment5ToDD_LIKE,Equipment5ToYY,Equipment5ToYY_IN,Equipment5ToYY_LIKE,Equipment5SupplierNameTBox,Equipment5SupplierNameTBox_IN,Equipment5SupplierNameTBox_LIKE,Equipment5SupplierTelephoneTBox,Equipment5SupplierTelephoneTBox_IN,Equipment5SupplierTelephoneTBox_LIKE,OPTION_14_CBox_OxygenPAo2,OPTION_14_CBox_OxygenPAo2_IN,OPTION_14_CBox_OxygenPAo2_LIKE,OPTION_14_CBox_OxygenSAo2,OPTION_14_CBox_OxygenSAo2_IN,OPTION_14_CBox_OxygenSAo2_LIKE,OPTION_14_CBox_OxygenSPo2,OPTION_14_CBox_OxygenSPo2_IN,OPTION_14_CBox_OxygenSPo2_LIKE,OxygenPAO2TBox,OxygenPAO2TBox_IN,OxygenPAO2TBox_LIKE,OxygenSAO2TBox,OxygenSAO2TBox_IN,OxygenSAO2TBox_LIKE,CPAPStudy_CBox,CPAPStudy_CBox_IN,CPAPStudy_CBox_LIKE,CPAPStudyNote,CPAPStudyNote_IN,CPAPStudyNote_LIKE,OxygenSPO2TBox,OxygenSPO2TBox_IN,OxygenSPO2TBox_LIKE,CPAPStudyOnFile_CBox,CPAPStudyOnFile_CBox_IN,CPAPStudyOnFile_CBox_LIKE,CPAPStudyOnFileNote,CPAPStudyOnFileNote_IN,CPAPStudyOnFileNote_LIKE,LabTestDateMM,LabTestDateMM_IN,LabTestDateMM_LIKE,LabTestDateDD,LabTestDateDD_IN,LabTestDateDD_LIKE,LabTestDateYY,LabTestDateYY_IN,LabTestDateYY_LIKE,CPAPStudyPerformedAt,CPAPStudyPerformedAt_IN,CPAPStudyPerformedAt_LIKE,LabTestFacilityTBox,LabTestFacilityTBox_IN,LabTestFacilityTBox_LIKE,CPAPStudyPerformedAt2,CPAPStudyPerformedAt2_IN,CPAPStudyPerformedAt2_LIKE,CPAPStudyPerformedAt3,CPAPStudyPerformedAt3_IN,CPAPStudyPerformedAt3_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							message="The parameter ""#keysToStruct[i]#"" used is not valid. The value of the parameter is ""#arguments[keysToStruct[i]]#"".">
					</cfif>				
				
					<cfif StructFind(arguments, keysToStruct[i]) NEQ "">
						
						<cfquery name="getThisDataType" dbtype="query">
							SELECT DATA_TYPE
							FROM defaultsQuery
							WHERE COLUMN_NAME = '#keysToStruct[i]#'
						</cfquery>						
						
						<cfswitch expression="#trim(getThisDataType.DATA_TYPE)#">
							<cfcase value="binary,varbinary,image,char,varchar,nchar,nvarchar">
								<cfset thisDateType = "String">
							</cfcase> 
							<cfcase value="ntextdatetime,smalldatetime,datetime">
								<cfset thisDateType = "Date">
							</cfcase> 						
							<cfcase value="bigint,Int,smallint,tinyint,bit,numeric,money,smallmoney,decimal,float,real">
								<cfset thisDateType = "Numeric">
							</cfcase>	
						    <cfdefaultcase>
								<cfset thisDateType = "String">
						    </cfdefaultcase>
						</cfswitch>	
									
						
						<cfif thisDateType EQ "Date">
							
							<cfif NOT IsDate(StructFind(arguments, keysToStruct[i]))>
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be a date. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
						
						<cfelseif thisDateType EQ "Numeric">					
							
							<cfif NOT IsNumeric(StructFind(arguments, keysToStruct[i]))>						
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be numeric. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
									
						</cfif> 
						
					</cfif>		
				
				</cfif>
				
			</cfloop>	
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- We must change the Group BY.                                                   --->
		<!-------------------------------------------------------------------------------------->
 		<cfif GroupBy NEQ "">
			
			<cfset GroupBy1 = "">
			
			<cfloop list="#trim(GroupBy)#" index="g">
				
				<cfif ListFindNoCase(fields, trim(g))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(g))>
				</cfif> 
			
			</cfloop>
			
			<cfloop list="#trim(fields)#" index="f">
				
				<cfif NOT ListFindNoCase(GroupBy, trim(f))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(f))>
				</cfif> 
			
			</cfloop>		
			
		</cfif>			
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- Complete the tag and build the query based on the                              --->
		<!--- variables from above.                                                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfquery Name="getINTAKE_PatientIntakeFormQuery" datasource="#trim(request.DataSource)#" cachedwithin="#CreateTimeSpan(0,0,0,0)#">
				SELECT #trim(Fields)#
				FROM INTAKE_PatientIntakeForm  WHERE 1=1
					<cfif recordID NEQ "" AND IsNumeric(recordID)>AND recordID = #recordID#</cfif>
					<cfif recordID_IN NEQ "">AND recordID IN(#trim(recordID_IN)#)</cfif>
					<cfif recordID_LIKE NEQ "">AND recordID LIKE '%#trim(recordID_LIKE)#%'</cfif>
					<cfif hidden_UsersID NEQ "">AND hidden_UsersID = '#hidden_UsersID#'</cfif>
					<cfif hidden_UsersID_IN NEQ "">AND hidden_UsersID IN(#trim(hidden_UsersID_IN)#)</cfif>
					<cfif hidden_UsersID_LIKE NEQ "">AND hidden_UsersID LIKE '%#trim(hidden_UsersID_LIKE)#%'</cfif>
					<cfif hidden_TimeStart NEQ "">AND hidden_TimeStart = '#hidden_TimeStart#'</cfif>
					<cfif hidden_TimeStart_IN NEQ "">AND hidden_TimeStart IN(#trim(hidden_TimeStart_IN)#)</cfif>
					<cfif hidden_TimeStart_LIKE NEQ "">AND hidden_TimeStart LIKE '%#trim(hidden_TimeStart_LIKE)#%'</cfif>
					<cfif OPTION_1_CBox_Delivery NEQ "">AND OPTION_1_CBox_Delivery = '#OPTION_1_CBox_Delivery#'</cfif>
					<cfif OPTION_1_CBox_Delivery_IN NEQ "">AND OPTION_1_CBox_Delivery IN(#trim(OPTION_1_CBox_Delivery_IN)#)</cfif>
					<cfif OPTION_1_CBox_Delivery_LIKE NEQ "">AND OPTION_1_CBox_Delivery LIKE '%#trim(OPTION_1_CBox_Delivery_LIKE)#%'</cfif>
					<cfif OPTION_1_CBox_Pickup NEQ "">AND OPTION_1_CBox_Pickup = '#OPTION_1_CBox_Pickup#'</cfif>
					<cfif OPTION_1_CBox_Pickup_IN NEQ "">AND OPTION_1_CBox_Pickup IN(#trim(OPTION_1_CBox_Pickup_IN)#)</cfif>
					<cfif OPTION_1_CBox_Pickup_LIKE NEQ "">AND OPTION_1_CBox_Pickup LIKE '%#trim(OPTION_1_CBox_Pickup_LIKE)#%'</cfif>
					<cfif OPTION_1_CBox_Repair NEQ "">AND OPTION_1_CBox_Repair = '#OPTION_1_CBox_Repair#'</cfif>
					<cfif OPTION_1_CBox_Repair_IN NEQ "">AND OPTION_1_CBox_Repair IN(#trim(OPTION_1_CBox_Repair_IN)#)</cfif>
					<cfif OPTION_1_CBox_Repair_LIKE NEQ "">AND OPTION_1_CBox_Repair LIKE '%#trim(OPTION_1_CBox_Repair_LIKE)#%'</cfif>
					<cfif OPTION_1_CBox_Switch NEQ "">AND OPTION_1_CBox_Switch = '#OPTION_1_CBox_Switch#'</cfif>
					<cfif OPTION_1_CBox_Switch_IN NEQ "">AND OPTION_1_CBox_Switch IN(#trim(OPTION_1_CBox_Switch_IN)#)</cfif>
					<cfif OPTION_1_CBox_Switch_LIKE NEQ "">AND OPTION_1_CBox_Switch LIKE '%#trim(OPTION_1_CBox_Switch_LIKE)#%'</cfif>
					<cfif OPTION_1_CBox_Existing NEQ "">AND OPTION_1_CBox_Existing = '#OPTION_1_CBox_Existing#'</cfif>
					<cfif OPTION_1_CBox_Existing_IN NEQ "">AND OPTION_1_CBox_Existing IN(#trim(OPTION_1_CBox_Existing_IN)#)</cfif>
					<cfif OPTION_1_CBox_Existing_LIKE NEQ "">AND OPTION_1_CBox_Existing LIKE '%#trim(OPTION_1_CBox_Existing_LIKE)#%'</cfif>
					<cfif OPTION_2_CBox_Facility NEQ "">AND OPTION_2_CBox_Facility = '#OPTION_2_CBox_Facility#'</cfif>
					<cfif OPTION_2_CBox_Facility_IN NEQ "">AND OPTION_2_CBox_Facility IN(#trim(OPTION_2_CBox_Facility_IN)#)</cfif>
					<cfif OPTION_2_CBox_Facility_LIKE NEQ "">AND OPTION_2_CBox_Facility LIKE '%#trim(OPTION_2_CBox_Facility_LIKE)#%'</cfif>
					<cfif OPTION_2_CBox_Hospice NEQ "">AND OPTION_2_CBox_Hospice = '#OPTION_2_CBox_Hospice#'</cfif>
					<cfif OPTION_2_CBox_Hospice_IN NEQ "">AND OPTION_2_CBox_Hospice IN(#trim(OPTION_2_CBox_Hospice_IN)#)</cfif>
					<cfif OPTION_2_CBox_Hospice_LIKE NEQ "">AND OPTION_2_CBox_Hospice LIKE '%#trim(OPTION_2_CBox_Hospice_LIKE)#%'</cfif>
					<cfif OPTION_2_CBox_Hospital NEQ "">AND OPTION_2_CBox_Hospital = '#OPTION_2_CBox_Hospital#'</cfif>
					<cfif OPTION_2_CBox_Hospital_IN NEQ "">AND OPTION_2_CBox_Hospital IN(#trim(OPTION_2_CBox_Hospital_IN)#)</cfif>
					<cfif OPTION_2_CBox_Hospital_LIKE NEQ "">AND OPTION_2_CBox_Hospital LIKE '%#trim(OPTION_2_CBox_Hospital_LIKE)#%'</cfif>
					<cfif facilityTBox NEQ "">AND facilityTBox = '#facilityTBox#'</cfif>
					<cfif facilityTBox_IN NEQ "">AND facilityTBox IN(#trim(facilityTBox_IN)#)</cfif>
					<cfif facilityTBox_LIKE NEQ "">AND facilityTBox LIKE '%#trim(facilityTBox_LIKE)#%'</cfif>
					<cfif hospiceTBox NEQ "">AND hospiceTBox = '#hospiceTBox#'</cfif>
					<cfif hospiceTBox_IN NEQ "">AND hospiceTBox IN(#trim(hospiceTBox_IN)#)</cfif>
					<cfif hospiceTBox_LIKE NEQ "">AND hospiceTBox LIKE '%#trim(hospiceTBox_LIKE)#%'</cfif>
					<cfif OPTION_3_CBox_Medicare NEQ "">AND OPTION_3_CBox_Medicare = '#OPTION_3_CBox_Medicare#'</cfif>
					<cfif OPTION_3_CBox_Medicare_IN NEQ "">AND OPTION_3_CBox_Medicare IN(#trim(OPTION_3_CBox_Medicare_IN)#)</cfif>
					<cfif OPTION_3_CBox_Medicare_LIKE NEQ "">AND OPTION_3_CBox_Medicare LIKE '%#trim(OPTION_3_CBox_Medicare_LIKE)#%'</cfif>
					<cfif OPTION_3_CBox_PrivateInsurance NEQ "">AND OPTION_3_CBox_PrivateInsurance = '#OPTION_3_CBox_PrivateInsurance#'</cfif>
					<cfif OPTION_3_CBox_PrivateInsurance_IN NEQ "">AND OPTION_3_CBox_PrivateInsurance IN(#trim(OPTION_3_CBox_PrivateInsurance_IN)#)</cfif>
					<cfif OPTION_3_CBox_PrivateInsurance_LIKE NEQ "">AND OPTION_3_CBox_PrivateInsurance LIKE '%#trim(OPTION_3_CBox_PrivateInsurance_LIKE)#%'</cfif>
					<cfif OPTION_3_CBox_Medicaid NEQ "">AND OPTION_3_CBox_Medicaid = '#OPTION_3_CBox_Medicaid#'</cfif>
					<cfif OPTION_3_CBox_Medicaid_IN NEQ "">AND OPTION_3_CBox_Medicaid IN(#trim(OPTION_3_CBox_Medicaid_IN)#)</cfif>
					<cfif OPTION_3_CBox_Medicaid_LIKE NEQ "">AND OPTION_3_CBox_Medicaid LIKE '%#trim(OPTION_3_CBox_Medicaid_LIKE)#%'</cfif>
					<cfif OPTION_3_CBox_PrivatePay NEQ "">AND OPTION_3_CBox_PrivatePay = '#OPTION_3_CBox_PrivatePay#'</cfif>
					<cfif OPTION_3_CBox_PrivatePay_IN NEQ "">AND OPTION_3_CBox_PrivatePay IN(#trim(OPTION_3_CBox_PrivatePay_IN)#)</cfif>
					<cfif OPTION_3_CBox_PrivatePay_LIKE NEQ "">AND OPTION_3_CBox_PrivatePay LIKE '%#trim(OPTION_3_CBox_PrivatePay_LIKE)#%'</cfif>
					<cfif hospitalTBox NEQ "">AND hospitalTBox = '#hospitalTBox#'</cfif>
					<cfif hospitalTBox_IN NEQ "">AND hospitalTBox IN(#trim(hospitalTBox_IN)#)</cfif>
					<cfif hospitalTBox_LIKE NEQ "">AND hospitalTBox LIKE '%#trim(hospitalTBox_LIKE)#%'</cfif>
					<cfif DischargeDateMM NEQ "">AND DischargeDateMM = '#DischargeDateMM#'</cfif>
					<cfif DischargeDateMM_IN NEQ "">AND DischargeDateMM IN(#trim(DischargeDateMM_IN)#)</cfif>
					<cfif DischargeDateMM_LIKE NEQ "">AND DischargeDateMM LIKE '%#trim(DischargeDateMM_LIKE)#%'</cfif>
					<cfif DischargeDateDD NEQ "">AND DischargeDateDD = '#DischargeDateDD#'</cfif>
					<cfif DischargeDateDD_IN NEQ "">AND DischargeDateDD IN(#trim(DischargeDateDD_IN)#)</cfif>
					<cfif DischargeDateDD_LIKE NEQ "">AND DischargeDateDD LIKE '%#trim(DischargeDateDD_LIKE)#%'</cfif>
					<cfif DischargeDateYY NEQ "">AND DischargeDateYY = '#DischargeDateYY#'</cfif>
					<cfif DischargeDateYY_IN NEQ "">AND DischargeDateYY IN(#trim(DischargeDateYY_IN)#)</cfif>
					<cfif DischargeDateYY_LIKE NEQ "">AND DischargeDateYY LIKE '%#trim(DischargeDateYY_LIKE)#%'</cfif>
					<cfif typeOfPay_Radio NEQ "">AND typeOfPay_Radio = '#typeOfPay_Radio#'</cfif>
					<cfif typeOfPay_Radio_IN NEQ "">AND typeOfPay_Radio IN(#trim(typeOfPay_Radio_IN)#)</cfif>
					<cfif typeOfPay_Radio_LIKE NEQ "">AND typeOfPay_Radio LIKE '%#trim(typeOfPay_Radio_LIKE)#%'</cfif>
					<cfif callerNameTBox NEQ "">AND callerNameTBox = '#callerNameTBox#'</cfif>
					<cfif callerNameTBox_IN NEQ "">AND callerNameTBox IN(#trim(callerNameTBox_IN)#)</cfif>
					<cfif callerNameTBox_LIKE NEQ "">AND callerNameTBox LIKE '%#trim(callerNameTBox_LIKE)#%'</cfif>
					<cfif callerPhoneTBox NEQ "">AND callerPhoneTBox = '#callerPhoneTBox#'</cfif>
					<cfif callerPhoneTBox_IN NEQ "">AND callerPhoneTBox IN(#trim(callerPhoneTBox_IN)#)</cfif>
					<cfif callerPhoneTBox_LIKE NEQ "">AND callerPhoneTBox LIKE '%#trim(callerPhoneTBox_LIKE)#%'</cfif>
					<cfif patientNameTBox NEQ "">AND patientNameTBox = '#patientNameTBox#'</cfif>
					<cfif patientNameTBox_IN NEQ "">AND patientNameTBox IN(#trim(patientNameTBox_IN)#)</cfif>
					<cfif patientNameTBox_LIKE NEQ "">AND patientNameTBox LIKE '%#trim(patientNameTBox_LIKE)#%'</cfif>
					<cfif roomNumberTBox NEQ "">AND roomNumberTBox = '#roomNumberTBox#'</cfif>
					<cfif roomNumberTBox_IN NEQ "">AND roomNumberTBox IN(#trim(roomNumberTBox_IN)#)</cfif>
					<cfif roomNumberTBox_LIKE NEQ "">AND roomNumberTBox LIKE '%#trim(roomNumberTBox_LIKE)#%'</cfif>
					<cfif bedNumberTBox NEQ "">AND bedNumberTBox = '#bedNumberTBox#'</cfif>
					<cfif bedNumberTBox_IN NEQ "">AND bedNumberTBox IN(#trim(bedNumberTBox_IN)#)</cfif>
					<cfif bedNumberTBox_LIKE NEQ "">AND bedNumberTBox LIKE '%#trim(bedNumberTBox_LIKE)#%'</cfif>
					<cfif patientAddressTBox NEQ "">AND patientAddressTBox = '#patientAddressTBox#'</cfif>
					<cfif patientAddressTBox_IN NEQ "">AND patientAddressTBox IN(#trim(patientAddressTBox_IN)#)</cfif>
					<cfif patientAddressTBox_LIKE NEQ "">AND patientAddressTBox LIKE '%#trim(patientAddressTBox_LIKE)#%'</cfif>
					<cfif patientCityTBox NEQ "">AND patientCityTBox = '#patientCityTBox#'</cfif>
					<cfif patientCityTBox_IN NEQ "">AND patientCityTBox IN(#trim(patientCityTBox_IN)#)</cfif>
					<cfif patientCityTBox_LIKE NEQ "">AND patientCityTBox LIKE '%#trim(patientCityTBox_LIKE)#%'</cfif>
					<cfif patientStateTBox NEQ "">AND patientStateTBox = '#patientStateTBox#'</cfif>
					<cfif patientStateTBox_IN NEQ "">AND patientStateTBox IN(#trim(patientStateTBox_IN)#)</cfif>
					<cfif patientStateTBox_LIKE NEQ "">AND patientStateTBox LIKE '%#trim(patientStateTBox_LIKE)#%'</cfif>
					<cfif patientZipTBox NEQ "">AND patientZipTBox = '#patientZipTBox#'</cfif>
					<cfif patientZipTBox_IN NEQ "">AND patientZipTBox IN(#trim(patientZipTBox_IN)#)</cfif>
					<cfif patientZipTBox_LIKE NEQ "">AND patientZipTBox LIKE '%#trim(patientZipTBox_LIKE)#%'</cfif>
					<cfif patientPhoneTBox NEQ "">AND patientPhoneTBox = '#patientPhoneTBox#'</cfif>
					<cfif patientPhoneTBox_IN NEQ "">AND patientPhoneTBox IN(#trim(patientPhoneTBox_IN)#)</cfif>
					<cfif patientPhoneTBox_LIKE NEQ "">AND patientPhoneTBox LIKE '%#trim(patientPhoneTBox_LIKE)#%'</cfif>
					<cfif patientDOBMM NEQ "">AND patientDOBMM = '#patientDOBMM#'</cfif>
					<cfif patientDOBMM_IN NEQ "">AND patientDOBMM IN(#trim(patientDOBMM_IN)#)</cfif>
					<cfif patientDOBMM_LIKE NEQ "">AND patientDOBMM LIKE '%#trim(patientDOBMM_LIKE)#%'</cfif>
					<cfif patientDOBDD NEQ "">AND patientDOBDD = '#patientDOBDD#'</cfif>
					<cfif patientDOBDD_IN NEQ "">AND patientDOBDD IN(#trim(patientDOBDD_IN)#)</cfif>
					<cfif patientDOBDD_LIKE NEQ "">AND patientDOBDD LIKE '%#trim(patientDOBDD_LIKE)#%'</cfif>
					<cfif patientDOBYY NEQ "">AND patientDOBYY = '#patientDOBYY#'</cfif>
					<cfif patientDOBYY_IN NEQ "">AND patientDOBYY IN(#trim(patientDOBYY_IN)#)</cfif>
					<cfif patientDOBYY_LIKE NEQ "">AND patientDOBYY LIKE '%#trim(patientDOBYY_LIKE)#%'</cfif>
					<cfif patientSSNTBox NEQ "">AND patientSSNTBox = '#patientSSNTBox#'</cfif>
					<cfif patientSSNTBox_IN NEQ "">AND patientSSNTBox IN(#trim(patientSSNTBox_IN)#)</cfif>
					<cfif patientSSNTBox_LIKE NEQ "">AND patientSSNTBox LIKE '%#trim(patientSSNTBox_LIKE)#%'</cfif>
					<cfif patientHeightFeet NEQ "">AND patientHeightFeet = '#patientHeightFeet#'</cfif>
					<cfif patientHeightFeet_IN NEQ "">AND patientHeightFeet IN(#trim(patientHeightFeet_IN)#)</cfif>
					<cfif patientHeightFeet_LIKE NEQ "">AND patientHeightFeet LIKE '%#trim(patientHeightFeet_LIKE)#%'</cfif>
					<cfif patientHeightInches NEQ "">AND patientHeightInches = '#patientHeightInches#'</cfif>
					<cfif patientHeightInches_IN NEQ "">AND patientHeightInches IN(#trim(patientHeightInches_IN)#)</cfif>
					<cfif patientHeightInches_LIKE NEQ "">AND patientHeightInches LIKE '%#trim(patientHeightInches_LIKE)#%'</cfif>
					<cfif patientWeightTBox NEQ "">AND patientWeightTBox = '#patientWeightTBox#'</cfif>
					<cfif patientWeightTBox_IN NEQ "">AND patientWeightTBox IN(#trim(patientWeightTBox_IN)#)</cfif>
					<cfif patientWeightTBox_LIKE NEQ "">AND patientWeightTBox LIKE '%#trim(patientWeightTBox_LIKE)#%'</cfif>
					<cfif alternateContactNameTBox NEQ "">AND alternateContactNameTBox = '#alternateContactNameTBox#'</cfif>
					<cfif alternateContactNameTBox_IN NEQ "">AND alternateContactNameTBox IN(#trim(alternateContactNameTBox_IN)#)</cfif>
					<cfif alternateContactNameTBox_LIKE NEQ "">AND alternateContactNameTBox LIKE '%#trim(alternateContactNameTBox_LIKE)#%'</cfif>
					<cfif alternateContactRelationshipTBox NEQ "">AND alternateContactRelationshipTBox = '#alternateContactRelationshipTBox#'</cfif>
					<cfif alternateContactRelationshipTBox_IN NEQ "">AND alternateContactRelationshipTBox IN(#trim(alternateContactRelationshipTBox_IN)#)</cfif>
					<cfif alternateContactRelationshipTBox_LIKE NEQ "">AND alternateContactRelationshipTBox LIKE '%#trim(alternateContactRelationshipTBox_LIKE)#%'</cfif>
					<cfif alternateContactPhoneTBox NEQ "">AND alternateContactPhoneTBox = '#alternateContactPhoneTBox#'</cfif>
					<cfif alternateContactPhoneTBox_IN NEQ "">AND alternateContactPhoneTBox IN(#trim(alternateContactPhoneTBox_IN)#)</cfif>
					<cfif alternateContactPhoneTBox_LIKE NEQ "">AND alternateContactPhoneTBox LIKE '%#trim(alternateContactPhoneTBox_LIKE)#%'</cfif>
					<cfif hcpcCode1TBox NEQ "">AND hcpcCode1TBox = '#hcpcCode1TBox#'</cfif>
					<cfif hcpcCode1TBox_IN NEQ "">AND hcpcCode1TBox IN(#trim(hcpcCode1TBox_IN)#)</cfif>
					<cfif hcpcCode1TBox_LIKE NEQ "">AND hcpcCode1TBox LIKE '%#trim(hcpcCode1TBox_LIKE)#%'</cfif>
					<cfif hcpcQty1TBox NEQ "">AND hcpcQty1TBox = '#hcpcQty1TBox#'</cfif>
					<cfif hcpcQty1TBox_IN NEQ "">AND hcpcQty1TBox IN(#trim(hcpcQty1TBox_IN)#)</cfif>
					<cfif hcpcQty1TBox_LIKE NEQ "">AND hcpcQty1TBox LIKE '%#trim(hcpcQty1TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct1TBox NEQ "">AND hcpcProduct1TBox = '#hcpcProduct1TBox#'</cfif>
					<cfif hcpcProduct1TBox_IN NEQ "">AND hcpcProduct1TBox IN(#trim(hcpcProduct1TBox_IN)#)</cfif>
					<cfif hcpcProduct1TBox_LIKE NEQ "">AND hcpcProduct1TBox LIKE '%#trim(hcpcProduct1TBox_LIKE)#%'</cfif>
					<cfif hcpcDX1TBox NEQ "">AND hcpcDX1TBox = '#hcpcDX1TBox#'</cfif>
					<cfif hcpcDX1TBox_IN NEQ "">AND hcpcDX1TBox IN(#trim(hcpcDX1TBox_IN)#)</cfif>
					<cfif hcpcDX1TBox_LIKE NEQ "">AND hcpcDX1TBox LIKE '%#trim(hcpcDX1TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis1TBox NEQ "">AND hcpcDiagnosis1TBox = '#hcpcDiagnosis1TBox#'</cfif>
					<cfif hcpcDiagnosis1TBox_IN NEQ "">AND hcpcDiagnosis1TBox IN(#trim(hcpcDiagnosis1TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis1TBox_LIKE NEQ "">AND hcpcDiagnosis1TBox LIKE '%#trim(hcpcDiagnosis1TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear1TBox NEQ "">AND hcpcLengthOfNeedYear1TBox = '#hcpcLengthOfNeedYear1TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear1TBox_IN NEQ "">AND hcpcLengthOfNeedYear1TBox IN(#trim(hcpcLengthOfNeedYear1TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear1TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear1TBox LIKE '%#trim(hcpcLengthOfNeedYear1TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth1TBox NEQ "">AND hcpcLengthOfNeedMonth1TBox = '#hcpcLengthOfNeedMonth1TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth1TBox_IN NEQ "">AND hcpcLengthOfNeedMonth1TBox IN(#trim(hcpcLengthOfNeedMonth1TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth1TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth1TBox LIKE '%#trim(hcpcLengthOfNeedMonth1TBox_LIKE)#%'</cfif>
					<cfif hcpcCode2TBox NEQ "">AND hcpcCode2TBox = '#hcpcCode2TBox#'</cfif>
					<cfif hcpcCode2TBox_IN NEQ "">AND hcpcCode2TBox IN(#trim(hcpcCode2TBox_IN)#)</cfif>
					<cfif hcpcCode2TBox_LIKE NEQ "">AND hcpcCode2TBox LIKE '%#trim(hcpcCode2TBox_LIKE)#%'</cfif>
					<cfif hcpcQty2TBox NEQ "">AND hcpcQty2TBox = '#hcpcQty2TBox#'</cfif>
					<cfif hcpcQty2TBox_IN NEQ "">AND hcpcQty2TBox IN(#trim(hcpcQty2TBox_IN)#)</cfif>
					<cfif hcpcQty2TBox_LIKE NEQ "">AND hcpcQty2TBox LIKE '%#trim(hcpcQty2TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct2TBox NEQ "">AND hcpcProduct2TBox = '#hcpcProduct2TBox#'</cfif>
					<cfif hcpcProduct2TBox_IN NEQ "">AND hcpcProduct2TBox IN(#trim(hcpcProduct2TBox_IN)#)</cfif>
					<cfif hcpcProduct2TBox_LIKE NEQ "">AND hcpcProduct2TBox LIKE '%#trim(hcpcProduct2TBox_LIKE)#%'</cfif>
					<cfif hcpcDX2TBox NEQ "">AND hcpcDX2TBox = '#hcpcDX2TBox#'</cfif>
					<cfif hcpcDX2TBox_IN NEQ "">AND hcpcDX2TBox IN(#trim(hcpcDX2TBox_IN)#)</cfif>
					<cfif hcpcDX2TBox_LIKE NEQ "">AND hcpcDX2TBox LIKE '%#trim(hcpcDX2TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis2TBox NEQ "">AND hcpcDiagnosis2TBox = '#hcpcDiagnosis2TBox#'</cfif>
					<cfif hcpcDiagnosis2TBox_IN NEQ "">AND hcpcDiagnosis2TBox IN(#trim(hcpcDiagnosis2TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis2TBox_LIKE NEQ "">AND hcpcDiagnosis2TBox LIKE '%#trim(hcpcDiagnosis2TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear2TBox NEQ "">AND hcpcLengthOfNeedYear2TBox = '#hcpcLengthOfNeedYear2TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear2TBox_IN NEQ "">AND hcpcLengthOfNeedYear2TBox IN(#trim(hcpcLengthOfNeedYear2TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear2TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear2TBox LIKE '%#trim(hcpcLengthOfNeedYear2TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth2TBox NEQ "">AND hcpcLengthOfNeedMonth2TBox = '#hcpcLengthOfNeedMonth2TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth2TBox_IN NEQ "">AND hcpcLengthOfNeedMonth2TBox IN(#trim(hcpcLengthOfNeedMonth2TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth2TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth2TBox LIKE '%#trim(hcpcLengthOfNeedMonth2TBox_LIKE)#%'</cfif>
					<cfif hcpcCode3TBox NEQ "">AND hcpcCode3TBox = '#hcpcCode3TBox#'</cfif>
					<cfif hcpcCode3TBox_IN NEQ "">AND hcpcCode3TBox IN(#trim(hcpcCode3TBox_IN)#)</cfif>
					<cfif hcpcCode3TBox_LIKE NEQ "">AND hcpcCode3TBox LIKE '%#trim(hcpcCode3TBox_LIKE)#%'</cfif>
					<cfif hcpcQty3TBox NEQ "">AND hcpcQty3TBox = '#hcpcQty3TBox#'</cfif>
					<cfif hcpcQty3TBox_IN NEQ "">AND hcpcQty3TBox IN(#trim(hcpcQty3TBox_IN)#)</cfif>
					<cfif hcpcQty3TBox_LIKE NEQ "">AND hcpcQty3TBox LIKE '%#trim(hcpcQty3TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct3TBox NEQ "">AND hcpcProduct3TBox = '#hcpcProduct3TBox#'</cfif>
					<cfif hcpcProduct3TBox_IN NEQ "">AND hcpcProduct3TBox IN(#trim(hcpcProduct3TBox_IN)#)</cfif>
					<cfif hcpcProduct3TBox_LIKE NEQ "">AND hcpcProduct3TBox LIKE '%#trim(hcpcProduct3TBox_LIKE)#%'</cfif>
					<cfif hcpcDX3TBox NEQ "">AND hcpcDX3TBox = '#hcpcDX3TBox#'</cfif>
					<cfif hcpcDX3TBox_IN NEQ "">AND hcpcDX3TBox IN(#trim(hcpcDX3TBox_IN)#)</cfif>
					<cfif hcpcDX3TBox_LIKE NEQ "">AND hcpcDX3TBox LIKE '%#trim(hcpcDX3TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis3TBox NEQ "">AND hcpcDiagnosis3TBox = '#hcpcDiagnosis3TBox#'</cfif>
					<cfif hcpcDiagnosis3TBox_IN NEQ "">AND hcpcDiagnosis3TBox IN(#trim(hcpcDiagnosis3TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis3TBox_LIKE NEQ "">AND hcpcDiagnosis3TBox LIKE '%#trim(hcpcDiagnosis3TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear3TBox NEQ "">AND hcpcLengthOfNeedYear3TBox = '#hcpcLengthOfNeedYear3TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear3TBox_IN NEQ "">AND hcpcLengthOfNeedYear3TBox IN(#trim(hcpcLengthOfNeedYear3TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear3TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear3TBox LIKE '%#trim(hcpcLengthOfNeedYear3TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth3TBox NEQ "">AND hcpcLengthOfNeedMonth3TBox = '#hcpcLengthOfNeedMonth3TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth3TBox_IN NEQ "">AND hcpcLengthOfNeedMonth3TBox IN(#trim(hcpcLengthOfNeedMonth3TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth3TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth3TBox LIKE '%#trim(hcpcLengthOfNeedMonth3TBox_LIKE)#%'</cfif>
					<cfif hcpcCode4TBox NEQ "">AND hcpcCode4TBox = '#hcpcCode4TBox#'</cfif>
					<cfif hcpcCode4TBox_IN NEQ "">AND hcpcCode4TBox IN(#trim(hcpcCode4TBox_IN)#)</cfif>
					<cfif hcpcCode4TBox_LIKE NEQ "">AND hcpcCode4TBox LIKE '%#trim(hcpcCode4TBox_LIKE)#%'</cfif>
					<cfif hcpcQty4TBox NEQ "">AND hcpcQty4TBox = '#hcpcQty4TBox#'</cfif>
					<cfif hcpcQty4TBox_IN NEQ "">AND hcpcQty4TBox IN(#trim(hcpcQty4TBox_IN)#)</cfif>
					<cfif hcpcQty4TBox_LIKE NEQ "">AND hcpcQty4TBox LIKE '%#trim(hcpcQty4TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct4TBox NEQ "">AND hcpcProduct4TBox = '#hcpcProduct4TBox#'</cfif>
					<cfif hcpcProduct4TBox_IN NEQ "">AND hcpcProduct4TBox IN(#trim(hcpcProduct4TBox_IN)#)</cfif>
					<cfif hcpcProduct4TBox_LIKE NEQ "">AND hcpcProduct4TBox LIKE '%#trim(hcpcProduct4TBox_LIKE)#%'</cfif>
					<cfif hcpcDX4TBox NEQ "">AND hcpcDX4TBox = '#hcpcDX4TBox#'</cfif>
					<cfif hcpcDX4TBox_IN NEQ "">AND hcpcDX4TBox IN(#trim(hcpcDX4TBox_IN)#)</cfif>
					<cfif hcpcDX4TBox_LIKE NEQ "">AND hcpcDX4TBox LIKE '%#trim(hcpcDX4TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis4TBox NEQ "">AND hcpcDiagnosis4TBox = '#hcpcDiagnosis4TBox#'</cfif>
					<cfif hcpcDiagnosis4TBox_IN NEQ "">AND hcpcDiagnosis4TBox IN(#trim(hcpcDiagnosis4TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis4TBox_LIKE NEQ "">AND hcpcDiagnosis4TBox LIKE '%#trim(hcpcDiagnosis4TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear4TBox NEQ "">AND hcpcLengthOfNeedYear4TBox = '#hcpcLengthOfNeedYear4TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear4TBox_IN NEQ "">AND hcpcLengthOfNeedYear4TBox IN(#trim(hcpcLengthOfNeedYear4TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear4TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear4TBox LIKE '%#trim(hcpcLengthOfNeedYear4TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth4TBox NEQ "">AND hcpcLengthOfNeedMonth4TBox = '#hcpcLengthOfNeedMonth4TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth4TBox_IN NEQ "">AND hcpcLengthOfNeedMonth4TBox IN(#trim(hcpcLengthOfNeedMonth4TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth4TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth4TBox LIKE '%#trim(hcpcLengthOfNeedMonth4TBox_LIKE)#%'</cfif>
					<cfif hcpcCode5TBox NEQ "">AND hcpcCode5TBox = '#hcpcCode5TBox#'</cfif>
					<cfif hcpcCode5TBox_IN NEQ "">AND hcpcCode5TBox IN(#trim(hcpcCode5TBox_IN)#)</cfif>
					<cfif hcpcCode5TBox_LIKE NEQ "">AND hcpcCode5TBox LIKE '%#trim(hcpcCode5TBox_LIKE)#%'</cfif>
					<cfif hcpcQty5TBox NEQ "">AND hcpcQty5TBox = '#hcpcQty5TBox#'</cfif>
					<cfif hcpcQty5TBox_IN NEQ "">AND hcpcQty5TBox IN(#trim(hcpcQty5TBox_IN)#)</cfif>
					<cfif hcpcQty5TBox_LIKE NEQ "">AND hcpcQty5TBox LIKE '%#trim(hcpcQty5TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct5TBox NEQ "">AND hcpcProduct5TBox = '#hcpcProduct5TBox#'</cfif>
					<cfif hcpcProduct5TBox_IN NEQ "">AND hcpcProduct5TBox IN(#trim(hcpcProduct5TBox_IN)#)</cfif>
					<cfif hcpcProduct5TBox_LIKE NEQ "">AND hcpcProduct5TBox LIKE '%#trim(hcpcProduct5TBox_LIKE)#%'</cfif>
					<cfif hcpcDX5TBox NEQ "">AND hcpcDX5TBox = '#hcpcDX5TBox#'</cfif>
					<cfif hcpcDX5TBox_IN NEQ "">AND hcpcDX5TBox IN(#trim(hcpcDX5TBox_IN)#)</cfif>
					<cfif hcpcDX5TBox_LIKE NEQ "">AND hcpcDX5TBox LIKE '%#trim(hcpcDX5TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis5TBox NEQ "">AND hcpcDiagnosis5TBox = '#hcpcDiagnosis5TBox#'</cfif>
					<cfif hcpcDiagnosis5TBox_IN NEQ "">AND hcpcDiagnosis5TBox IN(#trim(hcpcDiagnosis5TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis5TBox_LIKE NEQ "">AND hcpcDiagnosis5TBox LIKE '%#trim(hcpcDiagnosis5TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear5TBox NEQ "">AND hcpcLengthOfNeedYear5TBox = '#hcpcLengthOfNeedYear5TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear5TBox_IN NEQ "">AND hcpcLengthOfNeedYear5TBox IN(#trim(hcpcLengthOfNeedYear5TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear5TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear5TBox LIKE '%#trim(hcpcLengthOfNeedYear5TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth5TBox NEQ "">AND hcpcLengthOfNeedMonth5TBox = '#hcpcLengthOfNeedMonth5TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth5TBox_IN NEQ "">AND hcpcLengthOfNeedMonth5TBox IN(#trim(hcpcLengthOfNeedMonth5TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth5TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth5TBox LIKE '%#trim(hcpcLengthOfNeedMonth5TBox_LIKE)#%'</cfif>
					<cfif hcpcCode6TBox NEQ "">AND hcpcCode6TBox = '#hcpcCode6TBox#'</cfif>
					<cfif hcpcCode6TBox_IN NEQ "">AND hcpcCode6TBox IN(#trim(hcpcCode6TBox_IN)#)</cfif>
					<cfif hcpcCode6TBox_LIKE NEQ "">AND hcpcCode6TBox LIKE '%#trim(hcpcCode6TBox_LIKE)#%'</cfif>
					<cfif hcpcQty6TBox NEQ "">AND hcpcQty6TBox = '#hcpcQty6TBox#'</cfif>
					<cfif hcpcQty6TBox_IN NEQ "">AND hcpcQty6TBox IN(#trim(hcpcQty6TBox_IN)#)</cfif>
					<cfif hcpcQty6TBox_LIKE NEQ "">AND hcpcQty6TBox LIKE '%#trim(hcpcQty6TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct6TBox NEQ "">AND hcpcProduct6TBox = '#hcpcProduct6TBox#'</cfif>
					<cfif hcpcProduct6TBox_IN NEQ "">AND hcpcProduct6TBox IN(#trim(hcpcProduct6TBox_IN)#)</cfif>
					<cfif hcpcProduct6TBox_LIKE NEQ "">AND hcpcProduct6TBox LIKE '%#trim(hcpcProduct6TBox_LIKE)#%'</cfif>
					<cfif hcpcDX6TBox NEQ "">AND hcpcDX6TBox = '#hcpcDX6TBox#'</cfif>
					<cfif hcpcDX6TBox_IN NEQ "">AND hcpcDX6TBox IN(#trim(hcpcDX6TBox_IN)#)</cfif>
					<cfif hcpcDX6TBox_LIKE NEQ "">AND hcpcDX6TBox LIKE '%#trim(hcpcDX6TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis6TBox NEQ "">AND hcpcDiagnosis6TBox = '#hcpcDiagnosis6TBox#'</cfif>
					<cfif hcpcDiagnosis6TBox_IN NEQ "">AND hcpcDiagnosis6TBox IN(#trim(hcpcDiagnosis6TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis6TBox_LIKE NEQ "">AND hcpcDiagnosis6TBox LIKE '%#trim(hcpcDiagnosis6TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear6TBox NEQ "">AND hcpcLengthOfNeedYear6TBox = '#hcpcLengthOfNeedYear6TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear6TBox_IN NEQ "">AND hcpcLengthOfNeedYear6TBox IN(#trim(hcpcLengthOfNeedYear6TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear6TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear6TBox LIKE '%#trim(hcpcLengthOfNeedYear6TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth6TBox NEQ "">AND hcpcLengthOfNeedMonth6TBox = '#hcpcLengthOfNeedMonth6TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth6TBox_IN NEQ "">AND hcpcLengthOfNeedMonth6TBox IN(#trim(hcpcLengthOfNeedMonth6TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth6TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth6TBox LIKE '%#trim(hcpcLengthOfNeedMonth6TBox_LIKE)#%'</cfif>
					<cfif hcpcCode7TBox NEQ "">AND hcpcCode7TBox = '#hcpcCode7TBox#'</cfif>
					<cfif hcpcCode7TBox_IN NEQ "">AND hcpcCode7TBox IN(#trim(hcpcCode7TBox_IN)#)</cfif>
					<cfif hcpcCode7TBox_LIKE NEQ "">AND hcpcCode7TBox LIKE '%#trim(hcpcCode7TBox_LIKE)#%'</cfif>
					<cfif hcpcQty7TBox NEQ "">AND hcpcQty7TBox = '#hcpcQty7TBox#'</cfif>
					<cfif hcpcQty7TBox_IN NEQ "">AND hcpcQty7TBox IN(#trim(hcpcQty7TBox_IN)#)</cfif>
					<cfif hcpcQty7TBox_LIKE NEQ "">AND hcpcQty7TBox LIKE '%#trim(hcpcQty7TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct7TBox NEQ "">AND hcpcProduct7TBox = '#hcpcProduct7TBox#'</cfif>
					<cfif hcpcProduct7TBox_IN NEQ "">AND hcpcProduct7TBox IN(#trim(hcpcProduct7TBox_IN)#)</cfif>
					<cfif hcpcProduct7TBox_LIKE NEQ "">AND hcpcProduct7TBox LIKE '%#trim(hcpcProduct7TBox_LIKE)#%'</cfif>
					<cfif hcpcDX7TBox NEQ "">AND hcpcDX7TBox = '#hcpcDX7TBox#'</cfif>
					<cfif hcpcDX7TBox_IN NEQ "">AND hcpcDX7TBox IN(#trim(hcpcDX7TBox_IN)#)</cfif>
					<cfif hcpcDX7TBox_LIKE NEQ "">AND hcpcDX7TBox LIKE '%#trim(hcpcDX7TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis7TBox NEQ "">AND hcpcDiagnosis7TBox = '#hcpcDiagnosis7TBox#'</cfif>
					<cfif hcpcDiagnosis7TBox_IN NEQ "">AND hcpcDiagnosis7TBox IN(#trim(hcpcDiagnosis7TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis7TBox_LIKE NEQ "">AND hcpcDiagnosis7TBox LIKE '%#trim(hcpcDiagnosis7TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear7TBox NEQ "">AND hcpcLengthOfNeedYear7TBox = '#hcpcLengthOfNeedYear7TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear7TBox_IN NEQ "">AND hcpcLengthOfNeedYear7TBox IN(#trim(hcpcLengthOfNeedYear7TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear7TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear7TBox LIKE '%#trim(hcpcLengthOfNeedYear7TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth7TBox NEQ "">AND hcpcLengthOfNeedMonth7TBox = '#hcpcLengthOfNeedMonth7TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth7TBox_IN NEQ "">AND hcpcLengthOfNeedMonth7TBox IN(#trim(hcpcLengthOfNeedMonth7TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth7TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth7TBox LIKE '%#trim(hcpcLengthOfNeedMonth7TBox_LIKE)#%'</cfif>
					<cfif hcpcCode8TBox NEQ "">AND hcpcCode8TBox = '#hcpcCode8TBox#'</cfif>
					<cfif hcpcCode8TBox_IN NEQ "">AND hcpcCode8TBox IN(#trim(hcpcCode8TBox_IN)#)</cfif>
					<cfif hcpcCode8TBox_LIKE NEQ "">AND hcpcCode8TBox LIKE '%#trim(hcpcCode8TBox_LIKE)#%'</cfif>
					<cfif hcpcQty8TBox NEQ "">AND hcpcQty8TBox = '#hcpcQty8TBox#'</cfif>
					<cfif hcpcQty8TBox_IN NEQ "">AND hcpcQty8TBox IN(#trim(hcpcQty8TBox_IN)#)</cfif>
					<cfif hcpcQty8TBox_LIKE NEQ "">AND hcpcQty8TBox LIKE '%#trim(hcpcQty8TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct8TBox NEQ "">AND hcpcProduct8TBox = '#hcpcProduct8TBox#'</cfif>
					<cfif hcpcProduct8TBox_IN NEQ "">AND hcpcProduct8TBox IN(#trim(hcpcProduct8TBox_IN)#)</cfif>
					<cfif hcpcProduct8TBox_LIKE NEQ "">AND hcpcProduct8TBox LIKE '%#trim(hcpcProduct8TBox_LIKE)#%'</cfif>
					<cfif hcpcDX8TBox NEQ "">AND hcpcDX8TBox = '#hcpcDX8TBox#'</cfif>
					<cfif hcpcDX8TBox_IN NEQ "">AND hcpcDX8TBox IN(#trim(hcpcDX8TBox_IN)#)</cfif>
					<cfif hcpcDX8TBox_LIKE NEQ "">AND hcpcDX8TBox LIKE '%#trim(hcpcDX8TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis8TBox NEQ "">AND hcpcDiagnosis8TBox = '#hcpcDiagnosis8TBox#'</cfif>
					<cfif hcpcDiagnosis8TBox_IN NEQ "">AND hcpcDiagnosis8TBox IN(#trim(hcpcDiagnosis8TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis8TBox_LIKE NEQ "">AND hcpcDiagnosis8TBox LIKE '%#trim(hcpcDiagnosis8TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear8TBox NEQ "">AND hcpcLengthOfNeedYear8TBox = '#hcpcLengthOfNeedYear8TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear8TBox_IN NEQ "">AND hcpcLengthOfNeedYear8TBox IN(#trim(hcpcLengthOfNeedYear8TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear8TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear8TBox LIKE '%#trim(hcpcLengthOfNeedYear8TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth8TBox NEQ "">AND hcpcLengthOfNeedMonth8TBox = '#hcpcLengthOfNeedMonth8TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth8TBox_IN NEQ "">AND hcpcLengthOfNeedMonth8TBox IN(#trim(hcpcLengthOfNeedMonth8TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth8TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth8TBox LIKE '%#trim(hcpcLengthOfNeedMonth8TBox_LIKE)#%'</cfif>
					<cfif hcpcCode9TBox NEQ "">AND hcpcCode9TBox = '#hcpcCode9TBox#'</cfif>
					<cfif hcpcCode9TBox_IN NEQ "">AND hcpcCode9TBox IN(#trim(hcpcCode9TBox_IN)#)</cfif>
					<cfif hcpcCode9TBox_LIKE NEQ "">AND hcpcCode9TBox LIKE '%#trim(hcpcCode9TBox_LIKE)#%'</cfif>
					<cfif hcpcQty9TBox NEQ "">AND hcpcQty9TBox = '#hcpcQty9TBox#'</cfif>
					<cfif hcpcQty9TBox_IN NEQ "">AND hcpcQty9TBox IN(#trim(hcpcQty9TBox_IN)#)</cfif>
					<cfif hcpcQty9TBox_LIKE NEQ "">AND hcpcQty9TBox LIKE '%#trim(hcpcQty9TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct9TBox NEQ "">AND hcpcProduct9TBox = '#hcpcProduct9TBox#'</cfif>
					<cfif hcpcProduct9TBox_IN NEQ "">AND hcpcProduct9TBox IN(#trim(hcpcProduct9TBox_IN)#)</cfif>
					<cfif hcpcProduct9TBox_LIKE NEQ "">AND hcpcProduct9TBox LIKE '%#trim(hcpcProduct9TBox_LIKE)#%'</cfif>
					<cfif hcpcDX9TBox NEQ "">AND hcpcDX9TBox = '#hcpcDX9TBox#'</cfif>
					<cfif hcpcDX9TBox_IN NEQ "">AND hcpcDX9TBox IN(#trim(hcpcDX9TBox_IN)#)</cfif>
					<cfif hcpcDX9TBox_LIKE NEQ "">AND hcpcDX9TBox LIKE '%#trim(hcpcDX9TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis9TBox NEQ "">AND hcpcDiagnosis9TBox = '#hcpcDiagnosis9TBox#'</cfif>
					<cfif hcpcDiagnosis9TBox_IN NEQ "">AND hcpcDiagnosis9TBox IN(#trim(hcpcDiagnosis9TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis9TBox_LIKE NEQ "">AND hcpcDiagnosis9TBox LIKE '%#trim(hcpcDiagnosis9TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear9TBox NEQ "">AND hcpcLengthOfNeedYear9TBox = '#hcpcLengthOfNeedYear9TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear9TBox_IN NEQ "">AND hcpcLengthOfNeedYear9TBox IN(#trim(hcpcLengthOfNeedYear9TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear9TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear9TBox LIKE '%#trim(hcpcLengthOfNeedYear9TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth9TBox NEQ "">AND hcpcLengthOfNeedMonth9TBox = '#hcpcLengthOfNeedMonth9TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth9TBox_IN NEQ "">AND hcpcLengthOfNeedMonth9TBox IN(#trim(hcpcLengthOfNeedMonth9TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth9TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth9TBox LIKE '%#trim(hcpcLengthOfNeedMonth9TBox_LIKE)#%'</cfif>
					<cfif hcpcCode10TBox NEQ "">AND hcpcCode10TBox = '#hcpcCode10TBox#'</cfif>
					<cfif hcpcCode10TBox_IN NEQ "">AND hcpcCode10TBox IN(#trim(hcpcCode10TBox_IN)#)</cfif>
					<cfif hcpcCode10TBox_LIKE NEQ "">AND hcpcCode10TBox LIKE '%#trim(hcpcCode10TBox_LIKE)#%'</cfif>
					<cfif hcpcQty10TBox NEQ "">AND hcpcQty10TBox = '#hcpcQty10TBox#'</cfif>
					<cfif hcpcQty10TBox_IN NEQ "">AND hcpcQty10TBox IN(#trim(hcpcQty10TBox_IN)#)</cfif>
					<cfif hcpcQty10TBox_LIKE NEQ "">AND hcpcQty10TBox LIKE '%#trim(hcpcQty10TBox_LIKE)#%'</cfif>
					<cfif hcpcProduct10TBox NEQ "">AND hcpcProduct10TBox = '#hcpcProduct10TBox#'</cfif>
					<cfif hcpcProduct10TBox_IN NEQ "">AND hcpcProduct10TBox IN(#trim(hcpcProduct10TBox_IN)#)</cfif>
					<cfif hcpcProduct10TBox_LIKE NEQ "">AND hcpcProduct10TBox LIKE '%#trim(hcpcProduct10TBox_LIKE)#%'</cfif>
					<cfif hcpcDX10TBox NEQ "">AND hcpcDX10TBox = '#hcpcDX10TBox#'</cfif>
					<cfif hcpcDX10TBox_IN NEQ "">AND hcpcDX10TBox IN(#trim(hcpcDX10TBox_IN)#)</cfif>
					<cfif hcpcDX10TBox_LIKE NEQ "">AND hcpcDX10TBox LIKE '%#trim(hcpcDX10TBox_LIKE)#%'</cfif>
					<cfif hcpcDiagnosis10TBox NEQ "">AND hcpcDiagnosis10TBox = '#hcpcDiagnosis10TBox#'</cfif>
					<cfif hcpcDiagnosis10TBox_IN NEQ "">AND hcpcDiagnosis10TBox IN(#trim(hcpcDiagnosis10TBox_IN)#)</cfif>
					<cfif hcpcDiagnosis10TBox_LIKE NEQ "">AND hcpcDiagnosis10TBox LIKE '%#trim(hcpcDiagnosis10TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedYear10TBox NEQ "">AND hcpcLengthOfNeedYear10TBox = '#hcpcLengthOfNeedYear10TBox#'</cfif>
					<cfif hcpcLengthOfNeedYear10TBox_IN NEQ "">AND hcpcLengthOfNeedYear10TBox IN(#trim(hcpcLengthOfNeedYear10TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedYear10TBox_LIKE NEQ "">AND hcpcLengthOfNeedYear10TBox LIKE '%#trim(hcpcLengthOfNeedYear10TBox_LIKE)#%'</cfif>
					<cfif hcpcLengthOfNeedMonth10TBox NEQ "">AND hcpcLengthOfNeedMonth10TBox = '#hcpcLengthOfNeedMonth10TBox#'</cfif>
					<cfif hcpcLengthOfNeedMonth10TBox_IN NEQ "">AND hcpcLengthOfNeedMonth10TBox IN(#trim(hcpcLengthOfNeedMonth10TBox_IN)#)</cfif>
					<cfif hcpcLengthOfNeedMonth10TBox_LIKE NEQ "">AND hcpcLengthOfNeedMonth10TBox LIKE '%#trim(hcpcLengthOfNeedMonth10TBox_LIKE)#%'</cfif>
					<cfif primaryInsuranceNameTBox NEQ "">AND primaryInsuranceNameTBox = '#primaryInsuranceNameTBox#'</cfif>
					<cfif primaryInsuranceNameTBox_IN NEQ "">AND primaryInsuranceNameTBox IN(#trim(primaryInsuranceNameTBox_IN)#)</cfif>
					<cfif primaryInsuranceNameTBox_LIKE NEQ "">AND primaryInsuranceNameTBox LIKE '%#trim(primaryInsuranceNameTBox_LIKE)#%'</cfif>
					<cfif secondaryInsuranceNameTBox NEQ "">AND secondaryInsuranceNameTBox = '#secondaryInsuranceNameTBox#'</cfif>
					<cfif secondaryInsuranceNameTBox_IN NEQ "">AND secondaryInsuranceNameTBox IN(#trim(secondaryInsuranceNameTBox_IN)#)</cfif>
					<cfif secondaryInsuranceNameTBox_LIKE NEQ "">AND secondaryInsuranceNameTBox LIKE '%#trim(secondaryInsuranceNameTBox_LIKE)#%'</cfif>
					<cfif primaryPolicyNumberTBox NEQ "">AND primaryPolicyNumberTBox = '#primaryPolicyNumberTBox#'</cfif>
					<cfif primaryPolicyNumberTBox_IN NEQ "">AND primaryPolicyNumberTBox IN(#trim(primaryPolicyNumberTBox_IN)#)</cfif>
					<cfif primaryPolicyNumberTBox_LIKE NEQ "">AND primaryPolicyNumberTBox LIKE '%#trim(primaryPolicyNumberTBox_LIKE)#%'</cfif>
					<cfif secondaryPolicyNumberTBox NEQ "">AND secondaryPolicyNumberTBox = '#secondaryPolicyNumberTBox#'</cfif>
					<cfif secondaryPolicyNumberTBox_IN NEQ "">AND secondaryPolicyNumberTBox IN(#trim(secondaryPolicyNumberTBox_IN)#)</cfif>
					<cfif secondaryPolicyNumberTBox_LIKE NEQ "">AND secondaryPolicyNumberTBox LIKE '%#trim(secondaryPolicyNumberTBox_LIKE)#%'</cfif>
					<cfif primaryGroupNumberTBox NEQ "">AND primaryGroupNumberTBox = '#primaryGroupNumberTBox#'</cfif>
					<cfif primaryGroupNumberTBox_IN NEQ "">AND primaryGroupNumberTBox IN(#trim(primaryGroupNumberTBox_IN)#)</cfif>
					<cfif primaryGroupNumberTBox_LIKE NEQ "">AND primaryGroupNumberTBox LIKE '%#trim(primaryGroupNumberTBox_LIKE)#%'</cfif>
					<cfif secondaryGroupNumberTBox NEQ "">AND secondaryGroupNumberTBox = '#secondaryGroupNumberTBox#'</cfif>
					<cfif secondaryGroupNumberTBox_IN NEQ "">AND secondaryGroupNumberTBox IN(#trim(secondaryGroupNumberTBox_IN)#)</cfif>
					<cfif secondaryGroupNumberTBox_LIKE NEQ "">AND secondaryGroupNumberTBox LIKE '%#trim(secondaryGroupNumberTBox_LIKE)#%'</cfif>
					<cfif primaryPhoneNumberTBox NEQ "">AND primaryPhoneNumberTBox = '#primaryPhoneNumberTBox#'</cfif>
					<cfif primaryPhoneNumberTBox_IN NEQ "">AND primaryPhoneNumberTBox IN(#trim(primaryPhoneNumberTBox_IN)#)</cfif>
					<cfif primaryPhoneNumberTBox_LIKE NEQ "">AND primaryPhoneNumberTBox LIKE '%#trim(primaryPhoneNumberTBox_LIKE)#%'</cfif>
					<cfif secondaryPhoneNumberTBox NEQ "">AND secondaryPhoneNumberTBox = '#secondaryPhoneNumberTBox#'</cfif>
					<cfif secondaryPhoneNumberTBox_IN NEQ "">AND secondaryPhoneNumberTBox IN(#trim(secondaryPhoneNumberTBox_IN)#)</cfif>
					<cfif secondaryPhoneNumberTBox_LIKE NEQ "">AND secondaryPhoneNumberTBox LIKE '%#trim(secondaryPhoneNumberTBox_LIKE)#%'</cfif>
					<cfif priEffectiveDateMM NEQ "">AND priEffectiveDateMM = '#priEffectiveDateMM#'</cfif>
					<cfif priEffectiveDateMM_IN NEQ "">AND priEffectiveDateMM IN(#trim(priEffectiveDateMM_IN)#)</cfif>
					<cfif priEffectiveDateMM_LIKE NEQ "">AND priEffectiveDateMM LIKE '%#trim(priEffectiveDateMM_LIKE)#%'</cfif>
					<cfif priEffectiveDateDD NEQ "">AND priEffectiveDateDD = '#priEffectiveDateDD#'</cfif>
					<cfif priEffectiveDateDD_IN NEQ "">AND priEffectiveDateDD IN(#trim(priEffectiveDateDD_IN)#)</cfif>
					<cfif priEffectiveDateDD_LIKE NEQ "">AND priEffectiveDateDD LIKE '%#trim(priEffectiveDateDD_LIKE)#%'</cfif>
					<cfif priEffectiveDateYY NEQ "">AND priEffectiveDateYY = '#priEffectiveDateYY#'</cfif>
					<cfif priEffectiveDateYY_IN NEQ "">AND priEffectiveDateYY IN(#trim(priEffectiveDateYY_IN)#)</cfif>
					<cfif priEffectiveDateYY_LIKE NEQ "">AND priEffectiveDateYY LIKE '%#trim(priEffectiveDateYY_LIKE)#%'</cfif>
					<cfif secEffectiveDateMM NEQ "">AND secEffectiveDateMM = '#secEffectiveDateMM#'</cfif>
					<cfif secEffectiveDateMM_IN NEQ "">AND secEffectiveDateMM IN(#trim(secEffectiveDateMM_IN)#)</cfif>
					<cfif secEffectiveDateMM_LIKE NEQ "">AND secEffectiveDateMM LIKE '%#trim(secEffectiveDateMM_LIKE)#%'</cfif>
					<cfif secEffectiveDateDD NEQ "">AND secEffectiveDateDD = '#secEffectiveDateDD#'</cfif>
					<cfif secEffectiveDateDD_IN NEQ "">AND secEffectiveDateDD IN(#trim(secEffectiveDateDD_IN)#)</cfif>
					<cfif secEffectiveDateDD_LIKE NEQ "">AND secEffectiveDateDD LIKE '%#trim(secEffectiveDateDD_LIKE)#%'</cfif>
					<cfif secEffectiveDateYY NEQ "">AND secEffectiveDateYY = '#secEffectiveDateYY#'</cfif>
					<cfif secEffectiveDateYY_IN NEQ "">AND secEffectiveDateYY IN(#trim(secEffectiveDateYY_IN)#)</cfif>
					<cfif secEffectiveDateYY_LIKE NEQ "">AND secEffectiveDateYY LIKE '%#trim(secEffectiveDateYY_LIKE)#%'</cfif>
					<cfif priPolicyHolderNameTBox NEQ "">AND priPolicyHolderNameTBox = '#priPolicyHolderNameTBox#'</cfif>
					<cfif priPolicyHolderNameTBox_IN NEQ "">AND priPolicyHolderNameTBox IN(#trim(priPolicyHolderNameTBox_IN)#)</cfif>
					<cfif priPolicyHolderNameTBox_LIKE NEQ "">AND priPolicyHolderNameTBox LIKE '%#trim(priPolicyHolderNameTBox_LIKE)#%'</cfif>
					<cfif secPolicyHolderNameTBox NEQ "">AND secPolicyHolderNameTBox = '#secPolicyHolderNameTBox#'</cfif>
					<cfif secPolicyHolderNameTBox_IN NEQ "">AND secPolicyHolderNameTBox IN(#trim(secPolicyHolderNameTBox_IN)#)</cfif>
					<cfif secPolicyHolderNameTBox_LIKE NEQ "">AND secPolicyHolderNameTBox LIKE '%#trim(secPolicyHolderNameTBox_LIKE)#%'</cfif>
					<cfif priHoldersDOBMM NEQ "">AND priHoldersDOBMM = '#priHoldersDOBMM#'</cfif>
					<cfif priHoldersDOBMM_IN NEQ "">AND priHoldersDOBMM IN(#trim(priHoldersDOBMM_IN)#)</cfif>
					<cfif priHoldersDOBMM_LIKE NEQ "">AND priHoldersDOBMM LIKE '%#trim(priHoldersDOBMM_LIKE)#%'</cfif>
					<cfif priHoldersDOBDD NEQ "">AND priHoldersDOBDD = '#priHoldersDOBDD#'</cfif>
					<cfif priHoldersDOBDD_IN NEQ "">AND priHoldersDOBDD IN(#trim(priHoldersDOBDD_IN)#)</cfif>
					<cfif priHoldersDOBDD_LIKE NEQ "">AND priHoldersDOBDD LIKE '%#trim(priHoldersDOBDD_LIKE)#%'</cfif>
					<cfif priHoldersDOBYY NEQ "">AND priHoldersDOBYY = '#priHoldersDOBYY#'</cfif>
					<cfif priHoldersDOBYY_IN NEQ "">AND priHoldersDOBYY IN(#trim(priHoldersDOBYY_IN)#)</cfif>
					<cfif priHoldersDOBYY_LIKE NEQ "">AND priHoldersDOBYY LIKE '%#trim(priHoldersDOBYY_LIKE)#%'</cfif>
					<cfif secHoldersDOBMM NEQ "">AND secHoldersDOBMM = '#secHoldersDOBMM#'</cfif>
					<cfif secHoldersDOBMM_IN NEQ "">AND secHoldersDOBMM IN(#trim(secHoldersDOBMM_IN)#)</cfif>
					<cfif secHoldersDOBMM_LIKE NEQ "">AND secHoldersDOBMM LIKE '%#trim(secHoldersDOBMM_LIKE)#%'</cfif>
					<cfif secHoldersDOBDD NEQ "">AND secHoldersDOBDD = '#secHoldersDOBDD#'</cfif>
					<cfif secHoldersDOBDD_IN NEQ "">AND secHoldersDOBDD IN(#trim(secHoldersDOBDD_IN)#)</cfif>
					<cfif secHoldersDOBDD_LIKE NEQ "">AND secHoldersDOBDD LIKE '%#trim(secHoldersDOBDD_LIKE)#%'</cfif>
					<cfif secHoldersDOBYY NEQ "">AND secHoldersDOBYY = '#secHoldersDOBYY#'</cfif>
					<cfif secHoldersDOBYY_IN NEQ "">AND secHoldersDOBYY IN(#trim(secHoldersDOBYY_IN)#)</cfif>
					<cfif secHoldersDOBYY_LIKE NEQ "">AND secHoldersDOBYY LIKE '%#trim(secHoldersDOBYY_LIKE)#%'</cfif>
					<cfif priPolicyHolderEmployerTBox NEQ "">AND priPolicyHolderEmployerTBox = '#priPolicyHolderEmployerTBox#'</cfif>
					<cfif priPolicyHolderEmployerTBox_IN NEQ "">AND priPolicyHolderEmployerTBox IN(#trim(priPolicyHolderEmployerTBox_IN)#)</cfif>
					<cfif priPolicyHolderEmployerTBox_LIKE NEQ "">AND priPolicyHolderEmployerTBox LIKE '%#trim(priPolicyHolderEmployerTBox_LIKE)#%'</cfif>
					<cfif secPolicyHolderEmployerTBox NEQ "">AND secPolicyHolderEmployerTBox = '#secPolicyHolderEmployerTBox#'</cfif>
					<cfif secPolicyHolderEmployerTBox_IN NEQ "">AND secPolicyHolderEmployerTBox IN(#trim(secPolicyHolderEmployerTBox_IN)#)</cfif>
					<cfif secPolicyHolderEmployerTBox_LIKE NEQ "">AND secPolicyHolderEmployerTBox LIKE '%#trim(secPolicyHolderEmployerTBox_LIKE)#%'</cfif>
					<cfif priNoteTBox NEQ "">AND priNoteTBox = '#priNoteTBox#'</cfif>
					<cfif priNoteTBox_IN NEQ "">AND priNoteTBox IN(#trim(priNoteTBox_IN)#)</cfif>
					<cfif priNoteTBox_LIKE NEQ "">AND priNoteTBox LIKE '%#trim(priNoteTBox_LIKE)#%'</cfif>
					<cfif secNoteTBox NEQ "">AND secNoteTBox = '#secNoteTBox#'</cfif>
					<cfif secNoteTBox_IN NEQ "">AND secNoteTBox IN(#trim(secNoteTBox_IN)#)</cfif>
					<cfif secNoteTBox_LIKE NEQ "">AND secNoteTBox LIKE '%#trim(secNoteTBox_LIKE)#%'</cfif>
					<cfif poNumberTBox NEQ "">AND poNumberTBox = '#poNumberTBox#'</cfif>
					<cfif poNumberTBox_IN NEQ "">AND poNumberTBox IN(#trim(poNumberTBox_IN)#)</cfif>
					<cfif poNumberTBox_LIKE NEQ "">AND poNumberTBox LIKE '%#trim(poNumberTBox_LIKE)#%'</cfif>
					<cfif creditCardTypeTBox NEQ "">AND creditCardTypeTBox = '#creditCardTypeTBox#'</cfif>
					<cfif creditCardTypeTBox_IN NEQ "">AND creditCardTypeTBox IN(#trim(creditCardTypeTBox_IN)#)</cfif>
					<cfif creditCardTypeTBox_LIKE NEQ "">AND creditCardTypeTBox LIKE '%#trim(creditCardTypeTBox_LIKE)#%'</cfif>
					<cfif creditCardNumberTBox NEQ "">AND creditCardNumberTBox = '#creditCardNumberTBox#'</cfif>
					<cfif creditCardNumberTBox_IN NEQ "">AND creditCardNumberTBox IN(#trim(creditCardNumberTBox_IN)#)</cfif>
					<cfif creditCardNumberTBox_LIKE NEQ "">AND creditCardNumberTBox LIKE '%#trim(creditCardNumberTBox_LIKE)#%'</cfif>
					<cfif ccDateMM NEQ "">AND ccDateMM = '#ccDateMM#'</cfif>
					<cfif ccDateMM_IN NEQ "">AND ccDateMM IN(#trim(ccDateMM_IN)#)</cfif>
					<cfif ccDateMM_LIKE NEQ "">AND ccDateMM LIKE '%#trim(ccDateMM_LIKE)#%'</cfif>
					<cfif ccDateDD NEQ "">AND ccDateDD = '#ccDateDD#'</cfif>
					<cfif ccDateDD_IN NEQ "">AND ccDateDD IN(#trim(ccDateDD_IN)#)</cfif>
					<cfif ccDateDD_LIKE NEQ "">AND ccDateDD LIKE '%#trim(ccDateDD_LIKE)#%'</cfif>
					<cfif ccDateYY NEQ "">AND ccDateYY = '#ccDateYY#'</cfif>
					<cfif ccDateYY_IN NEQ "">AND ccDateYY IN(#trim(ccDateYY_IN)#)</cfif>
					<cfif ccDateYY_LIKE NEQ "">AND ccDateYY LIKE '%#trim(ccDateYY_LIKE)#%'</cfif>
					<cfif orderingPhysicianNameTBox NEQ "">AND orderingPhysicianNameTBox = '#orderingPhysicianNameTBox#'</cfif>
					<cfif orderingPhysicianNameTBox_IN NEQ "">AND orderingPhysicianNameTBox IN(#trim(orderingPhysicianNameTBox_IN)#)</cfif>
					<cfif orderingPhysicianNameTBox_LIKE NEQ "">AND orderingPhysicianNameTBox LIKE '%#trim(orderingPhysicianNameTBox_LIKE)#%'</cfif>
					<cfif orderingPhysicianPhoneTBox NEQ "">AND orderingPhysicianPhoneTBox = '#orderingPhysicianPhoneTBox#'</cfif>
					<cfif orderingPhysicianPhoneTBox_IN NEQ "">AND orderingPhysicianPhoneTBox IN(#trim(orderingPhysicianPhoneTBox_IN)#)</cfif>
					<cfif orderingPhysicianPhoneTBox_LIKE NEQ "">AND orderingPhysicianPhoneTBox LIKE '%#trim(orderingPhysicianPhoneTBox_LIKE)#%'</cfif>
					<cfif orderingPhysicianUPINTBox NEQ "">AND orderingPhysicianUPINTBox = '#orderingPhysicianUPINTBox#'</cfif>
					<cfif orderingPhysicianUPINTBox_IN NEQ "">AND orderingPhysicianUPINTBox IN(#trim(orderingPhysicianUPINTBox_IN)#)</cfif>
					<cfif orderingPhysicianUPINTBox_LIKE NEQ "">AND orderingPhysicianUPINTBox LIKE '%#trim(orderingPhysicianUPINTBox_LIKE)#%'</cfif>
					<cfif orderingPhysicianFaxTBox NEQ "">AND orderingPhysicianFaxTBox = '#orderingPhysicianFaxTBox#'</cfif>
					<cfif orderingPhysicianFaxTBox_IN NEQ "">AND orderingPhysicianFaxTBox IN(#trim(orderingPhysicianFaxTBox_IN)#)</cfif>
					<cfif orderingPhysicianFaxTBox_LIKE NEQ "">AND orderingPhysicianFaxTBox LIKE '%#trim(orderingPhysicianFaxTBox_LIKE)#%'</cfif>
					<cfif orderingPhysicianAddressTBox NEQ "">AND orderingPhysicianAddressTBox = '#orderingPhysicianAddressTBox#'</cfif>
					<cfif orderingPhysicianAddressTBox_IN NEQ "">AND orderingPhysicianAddressTBox IN(#trim(orderingPhysicianAddressTBox_IN)#)</cfif>
					<cfif orderingPhysicianAddressTBox_LIKE NEQ "">AND orderingPhysicianAddressTBox LIKE '%#trim(orderingPhysicianAddressTBox_LIKE)#%'</cfif>
					<cfif orderingPhysicianCityTBox NEQ "">AND orderingPhysicianCityTBox = '#orderingPhysicianCityTBox#'</cfif>
					<cfif orderingPhysicianCityTBox_IN NEQ "">AND orderingPhysicianCityTBox IN(#trim(orderingPhysicianCityTBox_IN)#)</cfif>
					<cfif orderingPhysicianCityTBox_LIKE NEQ "">AND orderingPhysicianCityTBox LIKE '%#trim(orderingPhysicianCityTBox_LIKE)#%'</cfif>
					<cfif orderingPhysicianStateTBox NEQ "">AND orderingPhysicianStateTBox = '#orderingPhysicianStateTBox#'</cfif>
					<cfif orderingPhysicianStateTBox_IN NEQ "">AND orderingPhysicianStateTBox IN(#trim(orderingPhysicianStateTBox_IN)#)</cfif>
					<cfif orderingPhysicianStateTBox_LIKE NEQ "">AND orderingPhysicianStateTBox LIKE '%#trim(orderingPhysicianStateTBox_LIKE)#%'</cfif>
					<cfif orderingPhysicianZipTBox NEQ "">AND orderingPhysicianZipTBox = '#orderingPhysicianZipTBox#'</cfif>
					<cfif orderingPhysicianZipTBox_IN NEQ "">AND orderingPhysicianZipTBox IN(#trim(orderingPhysicianZipTBox_IN)#)</cfif>
					<cfif orderingPhysicianZipTBox_LIKE NEQ "">AND orderingPhysicianZipTBox LIKE '%#trim(orderingPhysicianZipTBox_LIKE)#%'</cfif>
					<cfif verificationRepNameTBox NEQ "">AND verificationRepNameTBox = '#verificationRepNameTBox#'</cfif>
					<cfif verificationRepNameTBox_IN NEQ "">AND verificationRepNameTBox IN(#trim(verificationRepNameTBox_IN)#)</cfif>
					<cfif verificationRepNameTBox_LIKE NEQ "">AND verificationRepNameTBox LIKE '%#trim(verificationRepNameTBox_LIKE)#%'</cfif>
					<cfif verificationDateMM NEQ "">AND verificationDateMM = '#verificationDateMM#'</cfif>
					<cfif verificationDateMM_IN NEQ "">AND verificationDateMM IN(#trim(verificationDateMM_IN)#)</cfif>
					<cfif verificationDateMM_LIKE NEQ "">AND verificationDateMM LIKE '%#trim(verificationDateMM_LIKE)#%'</cfif>
					<cfif verificationDateDD NEQ "">AND verificationDateDD = '#verificationDateDD#'</cfif>
					<cfif verificationDateDD_IN NEQ "">AND verificationDateDD IN(#trim(verificationDateDD_IN)#)</cfif>
					<cfif verificationDateDD_LIKE NEQ "">AND verificationDateDD LIKE '%#trim(verificationDateDD_LIKE)#%'</cfif>
					<cfif verificationDateYY NEQ "">AND verificationDateYY = '#verificationDateYY#'</cfif>
					<cfif verificationDateYY_IN NEQ "">AND verificationDateYY IN(#trim(verificationDateYY_IN)#)</cfif>
					<cfif verificationDateYY_LIKE NEQ "">AND verificationDateYY LIKE '%#trim(verificationDateYY_LIKE)#%'</cfif>
					<cfif verificationTimeTBox NEQ "">AND verificationTimeTBox = '#verificationTimeTBox#'</cfif>
					<cfif verificationTimeTBox_IN NEQ "">AND verificationTimeTBox IN(#trim(verificationTimeTBox_IN)#)</cfif>
					<cfif verificationTimeTBox_LIKE NEQ "">AND verificationTimeTBox LIKE '%#trim(verificationTimeTBox_LIKE)#%'</cfif>
					<cfif OPTION_4_CBox_VerificationHaveInsYes NEQ "">AND OPTION_4_CBox_VerificationHaveInsYes = '#OPTION_4_CBox_VerificationHaveInsYes#'</cfif>
					<cfif OPTION_4_CBox_VerificationHaveInsYes_IN NEQ "">AND OPTION_4_CBox_VerificationHaveInsYes IN(#trim(OPTION_4_CBox_VerificationHaveInsYes_IN)#)</cfif>
					<cfif OPTION_4_CBox_VerificationHaveInsYes_LIKE NEQ "">AND OPTION_4_CBox_VerificationHaveInsYes LIKE '%#trim(OPTION_4_CBox_VerificationHaveInsYes_LIKE)#%'</cfif>
					<cfif OPTION_4_CBox_VerificationHaveInsNo NEQ "">AND OPTION_4_CBox_VerificationHaveInsNo = '#OPTION_4_CBox_VerificationHaveInsNo#'</cfif>
					<cfif OPTION_4_CBox_VerificationHaveInsNo_IN NEQ "">AND OPTION_4_CBox_VerificationHaveInsNo IN(#trim(OPTION_4_CBox_VerificationHaveInsNo_IN)#)</cfif>
					<cfif OPTION_4_CBox_VerificationHaveInsNo_LIKE NEQ "">AND OPTION_4_CBox_VerificationHaveInsNo LIKE '%#trim(OPTION_4_CBox_VerificationHaveInsNo_LIKE)#%'</cfif>
					<cfif verificationHaveInsFromMM NEQ "">AND verificationHaveInsFromMM = '#verificationHaveInsFromMM#'</cfif>
					<cfif verificationHaveInsFromMM_IN NEQ "">AND verificationHaveInsFromMM IN(#trim(verificationHaveInsFromMM_IN)#)</cfif>
					<cfif verificationHaveInsFromMM_LIKE NEQ "">AND verificationHaveInsFromMM LIKE '%#trim(verificationHaveInsFromMM_LIKE)#%'</cfif>
					<cfif verificationHaveInsFromDD NEQ "">AND verificationHaveInsFromDD = '#verificationHaveInsFromDD#'</cfif>
					<cfif verificationHaveInsFromDD_IN NEQ "">AND verificationHaveInsFromDD IN(#trim(verificationHaveInsFromDD_IN)#)</cfif>
					<cfif verificationHaveInsFromDD_LIKE NEQ "">AND verificationHaveInsFromDD LIKE '%#trim(verificationHaveInsFromDD_LIKE)#%'</cfif>
					<cfif verificationHaveInsFromYY NEQ "">AND verificationHaveInsFromYY = '#verificationHaveInsFromYY#'</cfif>
					<cfif verificationHaveInsFromYY_IN NEQ "">AND verificationHaveInsFromYY IN(#trim(verificationHaveInsFromYY_IN)#)</cfif>
					<cfif verificationHaveInsFromYY_LIKE NEQ "">AND verificationHaveInsFromYY LIKE '%#trim(verificationHaveInsFromYY_LIKE)#%'</cfif>
					<cfif verificationHaveInsToMM NEQ "">AND verificationHaveInsToMM = '#verificationHaveInsToMM#'</cfif>
					<cfif verificationHaveInsToMM_IN NEQ "">AND verificationHaveInsToMM IN(#trim(verificationHaveInsToMM_IN)#)</cfif>
					<cfif verificationHaveInsToMM_LIKE NEQ "">AND verificationHaveInsToMM LIKE '%#trim(verificationHaveInsToMM_LIKE)#%'</cfif>
					<cfif verificationHaveInsToDD NEQ "">AND verificationHaveInsToDD = '#verificationHaveInsToDD#'</cfif>
					<cfif verificationHaveInsToDD_IN NEQ "">AND verificationHaveInsToDD IN(#trim(verificationHaveInsToDD_IN)#)</cfif>
					<cfif verificationHaveInsToDD_LIKE NEQ "">AND verificationHaveInsToDD LIKE '%#trim(verificationHaveInsToDD_LIKE)#%'</cfif>
					<cfif verificationHaveInsToYY NEQ "">AND verificationHaveInsToYY = '#verificationHaveInsToYY#'</cfif>
					<cfif verificationHaveInsToYY_IN NEQ "">AND verificationHaveInsToYY IN(#trim(verificationHaveInsToYY_IN)#)</cfif>
					<cfif verificationHaveInsToYY_LIKE NEQ "">AND verificationHaveInsToYY LIKE '%#trim(verificationHaveInsToYY_LIKE)#%'</cfif>
					<cfif OPTION_5_CBox_VerificationHaveDMECovYes NEQ "">AND OPTION_5_CBox_VerificationHaveDMECovYes = '#OPTION_5_CBox_VerificationHaveDMECovYes#'</cfif>
					<cfif OPTION_5_CBox_VerificationHaveDMECovYes_IN NEQ "">AND OPTION_5_CBox_VerificationHaveDMECovYes IN(#trim(OPTION_5_CBox_VerificationHaveDMECovYes_IN)#)</cfif>
					<cfif OPTION_5_CBox_VerificationHaveDMECovYes_LIKE NEQ "">AND OPTION_5_CBox_VerificationHaveDMECovYes LIKE '%#trim(OPTION_5_CBox_VerificationHaveDMECovYes_LIKE)#%'</cfif>
					<cfif OPTION_5_CBox_VerificationHaveDMECovNo NEQ "">AND OPTION_5_CBox_VerificationHaveDMECovNo = '#OPTION_5_CBox_VerificationHaveDMECovNo#'</cfif>
					<cfif OPTION_5_CBox_VerificationHaveDMECovNo_IN NEQ "">AND OPTION_5_CBox_VerificationHaveDMECovNo IN(#trim(OPTION_5_CBox_VerificationHaveDMECovNo_IN)#)</cfif>
					<cfif OPTION_5_CBox_VerificationHaveDMECovNo_LIKE NEQ "">AND OPTION_5_CBox_VerificationHaveDMECovNo LIKE '%#trim(OPTION_5_CBox_VerificationHaveDMECovNo_LIKE)#%'</cfif>
					<cfif OPTION_6_CBox_VerificationDeductibleYes NEQ "">AND OPTION_6_CBox_VerificationDeductibleYes = '#OPTION_6_CBox_VerificationDeductibleYes#'</cfif>
					<cfif OPTION_6_CBox_VerificationDeductibleYes_IN NEQ "">AND OPTION_6_CBox_VerificationDeductibleYes IN(#trim(OPTION_6_CBox_VerificationDeductibleYes_IN)#)</cfif>
					<cfif OPTION_6_CBox_VerificationDeductibleYes_LIKE NEQ "">AND OPTION_6_CBox_VerificationDeductibleYes LIKE '%#trim(OPTION_6_CBox_VerificationDeductibleYes_LIKE)#%'</cfif>
					<cfif OPTION_6_CBox_VerificationDeductibleNo NEQ "">AND OPTION_6_CBox_VerificationDeductibleNo = '#OPTION_6_CBox_VerificationDeductibleNo#'</cfif>
					<cfif OPTION_6_CBox_VerificationDeductibleNo_IN NEQ "">AND OPTION_6_CBox_VerificationDeductibleNo IN(#trim(OPTION_6_CBox_VerificationDeductibleNo_IN)#)</cfif>
					<cfif OPTION_6_CBox_VerificationDeductibleNo_LIKE NEQ "">AND OPTION_6_CBox_VerificationDeductibleNo LIKE '%#trim(OPTION_6_CBox_VerificationDeductibleNo_LIKE)#%'</cfif>
					<cfif OPTION_7_CBox_VerificationDeductibleMetYes NEQ "">AND OPTION_7_CBox_VerificationDeductibleMetYes = '#OPTION_7_CBox_VerificationDeductibleMetYes#'</cfif>
					<cfif OPTION_7_CBox_VerificationDeductibleMetYes_IN NEQ "">AND OPTION_7_CBox_VerificationDeductibleMetYes IN(#trim(OPTION_7_CBox_VerificationDeductibleMetYes_IN)#)</cfif>
					<cfif OPTION_7_CBox_VerificationDeductibleMetYes_LIKE NEQ "">AND OPTION_7_CBox_VerificationDeductibleMetYes LIKE '%#trim(OPTION_7_CBox_VerificationDeductibleMetYes_LIKE)#%'</cfif>
					<cfif OPTION_7_CBox_VerificationDeductibleMetNo NEQ "">AND OPTION_7_CBox_VerificationDeductibleMetNo = '#OPTION_7_CBox_VerificationDeductibleMetNo#'</cfif>
					<cfif OPTION_7_CBox_VerificationDeductibleMetNo_IN NEQ "">AND OPTION_7_CBox_VerificationDeductibleMetNo IN(#trim(OPTION_7_CBox_VerificationDeductibleMetNo_IN)#)</cfif>
					<cfif OPTION_7_CBox_VerificationDeductibleMetNo_LIKE NEQ "">AND OPTION_7_CBox_VerificationDeductibleMetNo LIKE '%#trim(OPTION_7_CBox_VerificationDeductibleMetNo_LIKE)#%'</cfif>
					<cfif verificationDeductibleAmountTBox NEQ "">AND verificationDeductibleAmountTBox = '#verificationDeductibleAmountTBox#'</cfif>
					<cfif verificationDeductibleAmountTBox_IN NEQ "">AND verificationDeductibleAmountTBox IN(#trim(verificationDeductibleAmountTBox_IN)#)</cfif>
					<cfif verificationDeductibleAmountTBox_LIKE NEQ "">AND verificationDeductibleAmountTBox LIKE '%#trim(verificationDeductibleAmountTBox_LIKE)#%'</cfif>
					<cfif OPTION_8_CBox_VerificationPPOPolicyYes NEQ "">AND OPTION_8_CBox_VerificationPPOPolicyYes = '#OPTION_8_CBox_VerificationPPOPolicyYes#'</cfif>
					<cfif OPTION_8_CBox_VerificationPPOPolicyYes_IN NEQ "">AND OPTION_8_CBox_VerificationPPOPolicyYes IN(#trim(OPTION_8_CBox_VerificationPPOPolicyYes_IN)#)</cfif>
					<cfif OPTION_8_CBox_VerificationPPOPolicyYes_LIKE NEQ "">AND OPTION_8_CBox_VerificationPPOPolicyYes LIKE '%#trim(OPTION_8_CBox_VerificationPPOPolicyYes_LIKE)#%'</cfif>
					<cfif OPTION_8_CBox_VerificationPPOPolicyNo NEQ "">AND OPTION_8_CBox_VerificationPPOPolicyNo = '#OPTION_8_CBox_VerificationPPOPolicyNo#'</cfif>
					<cfif OPTION_8_CBox_VerificationPPOPolicyNo_IN NEQ "">AND OPTION_8_CBox_VerificationPPOPolicyNo IN(#trim(OPTION_8_CBox_VerificationPPOPolicyNo_IN)#)</cfif>
					<cfif OPTION_8_CBox_VerificationPPOPolicyNo_LIKE NEQ "">AND OPTION_8_CBox_VerificationPPOPolicyNo LIKE '%#trim(OPTION_8_CBox_VerificationPPOPolicyNo_LIKE)#%'</cfif>
					<cfif verificationPercentagePayAfterDeductibleTBox NEQ "">AND verificationPercentagePayAfterDeductibleTBox = '#verificationPercentagePayAfterDeductibleTBox#'</cfif>
					<cfif verificationPercentagePayAfterDeductibleTBox_IN NEQ "">AND verificationPercentagePayAfterDeductibleTBox IN(#trim(verificationPercentagePayAfterDeductibleTBox_IN)#)</cfif>
					<cfif verificationPercentagePayAfterDeductibleTBox_LIKE NEQ "">AND verificationPercentagePayAfterDeductibleTBox LIKE '%#trim(verificationPercentagePayAfterDeductibleTBox_LIKE)#%'</cfif>
					<cfif OPTION_9_CBox_VerificationPriorAuthYes NEQ "">AND OPTION_9_CBox_VerificationPriorAuthYes = '#OPTION_9_CBox_VerificationPriorAuthYes#'</cfif>
					<cfif OPTION_9_CBox_VerificationPriorAuthYes_IN NEQ "">AND OPTION_9_CBox_VerificationPriorAuthYes IN(#trim(OPTION_9_CBox_VerificationPriorAuthYes_IN)#)</cfif>
					<cfif OPTION_9_CBox_VerificationPriorAuthYes_LIKE NEQ "">AND OPTION_9_CBox_VerificationPriorAuthYes LIKE '%#trim(OPTION_9_CBox_VerificationPriorAuthYes_LIKE)#%'</cfif>
					<cfif OPTION_9_CBox_VerificationPriorAuthNo NEQ "">AND OPTION_9_CBox_VerificationPriorAuthNo = '#OPTION_9_CBox_VerificationPriorAuthNo#'</cfif>
					<cfif OPTION_9_CBox_VerificationPriorAuthNo_IN NEQ "">AND OPTION_9_CBox_VerificationPriorAuthNo IN(#trim(OPTION_9_CBox_VerificationPriorAuthNo_IN)#)</cfif>
					<cfif OPTION_9_CBox_VerificationPriorAuthNo_LIKE NEQ "">AND OPTION_9_CBox_VerificationPriorAuthNo LIKE '%#trim(OPTION_9_CBox_VerificationPriorAuthNo_LIKE)#%'</cfif>
					<cfif verificationAuthNumberTBox NEQ "">AND verificationAuthNumberTBox = '#verificationAuthNumberTBox#'</cfif>
					<cfif verificationAuthNumberTBox_IN NEQ "">AND verificationAuthNumberTBox IN(#trim(verificationAuthNumberTBox_IN)#)</cfif>
					<cfif verificationAuthNumberTBox_LIKE NEQ "">AND verificationAuthNumberTBox LIKE '%#trim(verificationAuthNumberTBox_LIKE)#%'</cfif>
					<cfif OPTION_10_CBox_VerificationLifetimeBenefitMetYes NEQ "">AND OPTION_10_CBox_VerificationLifetimeBenefitMetYes = '#OPTION_10_CBox_VerificationLifetimeBenefitMetYes#'</cfif>
					<cfif OPTION_10_CBox_VerificationLifetimeBenefitMetYes_IN NEQ "">AND OPTION_10_CBox_VerificationLifetimeBenefitMetYes IN(#trim(OPTION_10_CBox_VerificationLifetimeBenefitMetYes_IN)#)</cfif>
					<cfif OPTION_10_CBox_VerificationLifetimeBenefitMetYes_LIKE NEQ "">AND OPTION_10_CBox_VerificationLifetimeBenefitMetYes LIKE '%#trim(OPTION_10_CBox_VerificationLifetimeBenefitMetYes_LIKE)#%'</cfif>
					<cfif OPTION_10_CBox_VerificationLifetimeBenefitMetNo NEQ "">AND OPTION_10_CBox_VerificationLifetimeBenefitMetNo = '#OPTION_10_CBox_VerificationLifetimeBenefitMetNo#'</cfif>
					<cfif OPTION_10_CBox_VerificationLifetimeBenefitMetNo_IN NEQ "">AND OPTION_10_CBox_VerificationLifetimeBenefitMetNo IN(#trim(OPTION_10_CBox_VerificationLifetimeBenefitMetNo_IN)#)</cfif>
					<cfif OPTION_10_CBox_VerificationLifetimeBenefitMetNo_LIKE NEQ "">AND OPTION_10_CBox_VerificationLifetimeBenefitMetNo LIKE '%#trim(OPTION_10_CBox_VerificationLifetimeBenefitMetNo_LIKE)#%'</cfif>
					<cfif verificationAuthPhoneNumberTBox NEQ "">AND verificationAuthPhoneNumberTBox = '#verificationAuthPhoneNumberTBox#'</cfif>
					<cfif verificationAuthPhoneNumberTBox_IN NEQ "">AND verificationAuthPhoneNumberTBox IN(#trim(verificationAuthPhoneNumberTBox_IN)#)</cfif>
					<cfif verificationAuthPhoneNumberTBox_LIKE NEQ "">AND verificationAuthPhoneNumberTBox LIKE '%#trim(verificationAuthPhoneNumberTBox_LIKE)#%'</cfif>
					<cfif OPTION_11_CBox_VerificationInsFollowMedicareYes NEQ "">AND OPTION_11_CBox_VerificationInsFollowMedicareYes = '#OPTION_11_CBox_VerificationInsFollowMedicareYes#'</cfif>
					<cfif OPTION_11_CBox_VerificationInsFollowMedicareYes_IN NEQ "">AND OPTION_11_CBox_VerificationInsFollowMedicareYes IN(#trim(OPTION_11_CBox_VerificationInsFollowMedicareYes_IN)#)</cfif>
					<cfif OPTION_11_CBox_VerificationInsFollowMedicareYes_LIKE NEQ "">AND OPTION_11_CBox_VerificationInsFollowMedicareYes LIKE '%#trim(OPTION_11_CBox_VerificationInsFollowMedicareYes_LIKE)#%'</cfif>
					<cfif OPTION_11_CBox_VerificationInsFollowMedicareNo NEQ "">AND OPTION_11_CBox_VerificationInsFollowMedicareNo = '#OPTION_11_CBox_VerificationInsFollowMedicareNo#'</cfif>
					<cfif OPTION_11_CBox_VerificationInsFollowMedicareNo_IN NEQ "">AND OPTION_11_CBox_VerificationInsFollowMedicareNo IN(#trim(OPTION_11_CBox_VerificationInsFollowMedicareNo_IN)#)</cfif>
					<cfif OPTION_11_CBox_VerificationInsFollowMedicareNo_LIKE NEQ "">AND OPTION_11_CBox_VerificationInsFollowMedicareNo LIKE '%#trim(OPTION_11_CBox_VerificationInsFollowMedicareNo_LIKE)#%'</cfif>
					<cfif OPTION_12_CBox_VerificationMedicaidPlanMQMB NEQ "">AND OPTION_12_CBox_VerificationMedicaidPlanMQMB = '#OPTION_12_CBox_VerificationMedicaidPlanMQMB#'</cfif>
					<cfif OPTION_12_CBox_VerificationMedicaidPlanMQMB_IN NEQ "">AND OPTION_12_CBox_VerificationMedicaidPlanMQMB IN(#trim(OPTION_12_CBox_VerificationMedicaidPlanMQMB_IN)#)</cfif>
					<cfif OPTION_12_CBox_VerificationMedicaidPlanMQMB_LIKE NEQ "">AND OPTION_12_CBox_VerificationMedicaidPlanMQMB LIKE '%#trim(OPTION_12_CBox_VerificationMedicaidPlanMQMB_LIKE)#%'</cfif>
					<cfif OPTION_12_CBox_VerificationMedicaidPlanQMB NEQ "">AND OPTION_12_CBox_VerificationMedicaidPlanQMB = '#OPTION_12_CBox_VerificationMedicaidPlanQMB#'</cfif>
					<cfif OPTION_12_CBox_VerificationMedicaidPlanQMB_IN NEQ "">AND OPTION_12_CBox_VerificationMedicaidPlanQMB IN(#trim(OPTION_12_CBox_VerificationMedicaidPlanQMB_IN)#)</cfif>
					<cfif OPTION_12_CBox_VerificationMedicaidPlanQMB_LIKE NEQ "">AND OPTION_12_CBox_VerificationMedicaidPlanQMB LIKE '%#trim(OPTION_12_CBox_VerificationMedicaidPlanQMB_LIKE)#%'</cfif>
					<cfif OPTION_12_CBox_VerificationMedicaidPlanTraditional NEQ "">AND OPTION_12_CBox_VerificationMedicaidPlanTraditional = '#OPTION_12_CBox_VerificationMedicaidPlanTraditional#'</cfif>
					<cfif OPTION_12_CBox_VerificationMedicaidPlanTraditional_IN NEQ "">AND OPTION_12_CBox_VerificationMedicaidPlanTraditional IN(#trim(OPTION_12_CBox_VerificationMedicaidPlanTraditional_IN)#)</cfif>
					<cfif OPTION_12_CBox_VerificationMedicaidPlanTraditional_LIKE NEQ "">AND OPTION_12_CBox_VerificationMedicaidPlanTraditional LIKE '%#trim(OPTION_12_CBox_VerificationMedicaidPlanTraditional_LIKE)#%'</cfif>
					<cfif VerificationTypeBasePlanTBox NEQ "">AND VerificationTypeBasePlanTBox = '#VerificationTypeBasePlanTBox#'</cfif>
					<cfif VerificationTypeBasePlanTBox_IN NEQ "">AND VerificationTypeBasePlanTBox IN(#trim(VerificationTypeBasePlanTBox_IN)#)</cfif>
					<cfif VerificationTypeBasePlanTBox_LIKE NEQ "">AND VerificationTypeBasePlanTBox LIKE '%#trim(VerificationTypeBasePlanTBox_LIKE)#%'</cfif>
					<cfif OPTION_13_CBox_PastEquipmentYes NEQ "">AND OPTION_13_CBox_PastEquipmentYes = '#OPTION_13_CBox_PastEquipmentYes#'</cfif>
					<cfif OPTION_13_CBox_PastEquipmentYes_IN NEQ "">AND OPTION_13_CBox_PastEquipmentYes IN(#trim(OPTION_13_CBox_PastEquipmentYes_IN)#)</cfif>
					<cfif OPTION_13_CBox_PastEquipmentYes_LIKE NEQ "">AND OPTION_13_CBox_PastEquipmentYes LIKE '%#trim(OPTION_13_CBox_PastEquipmentYes_LIKE)#%'</cfif>
					<cfif OPTION_13_CBox_PastEquipmentNo NEQ "">AND OPTION_13_CBox_PastEquipmentNo = '#OPTION_13_CBox_PastEquipmentNo#'</cfif>
					<cfif OPTION_13_CBox_PastEquipmentNo_IN NEQ "">AND OPTION_13_CBox_PastEquipmentNo IN(#trim(OPTION_13_CBox_PastEquipmentNo_IN)#)</cfif>
					<cfif OPTION_13_CBox_PastEquipmentNo_LIKE NEQ "">AND OPTION_13_CBox_PastEquipmentNo LIKE '%#trim(OPTION_13_CBox_PastEquipmentNo_LIKE)#%'</cfif>
					<cfif Equipment1TypeTBox NEQ "">AND Equipment1TypeTBox = '#Equipment1TypeTBox#'</cfif>
					<cfif Equipment1TypeTBox_IN NEQ "">AND Equipment1TypeTBox IN(#trim(Equipment1TypeTBox_IN)#)</cfif>
					<cfif Equipment1TypeTBox_LIKE NEQ "">AND Equipment1TypeTBox LIKE '%#trim(Equipment1TypeTBox_LIKE)#%'</cfif>
					<cfif Equipment1RentPurchasedSelect NEQ "">AND Equipment1RentPurchasedSelect = '#Equipment1RentPurchasedSelect#'</cfif>
					<cfif Equipment1RentPurchasedSelect_IN NEQ "">AND Equipment1RentPurchasedSelect IN(#trim(Equipment1RentPurchasedSelect_IN)#)</cfif>
					<cfif Equipment1RentPurchasedSelect_LIKE NEQ "">AND Equipment1RentPurchasedSelect LIKE '%#trim(Equipment1RentPurchasedSelect_LIKE)#%'</cfif>
					<cfif Equipment1FromMM NEQ "">AND Equipment1FromMM = '#Equipment1FromMM#'</cfif>
					<cfif Equipment1FromMM_IN NEQ "">AND Equipment1FromMM IN(#trim(Equipment1FromMM_IN)#)</cfif>
					<cfif Equipment1FromMM_LIKE NEQ "">AND Equipment1FromMM LIKE '%#trim(Equipment1FromMM_LIKE)#%'</cfif>
					<cfif Equipment1FromDD NEQ "">AND Equipment1FromDD = '#Equipment1FromDD#'</cfif>
					<cfif Equipment1FromDD_IN NEQ "">AND Equipment1FromDD IN(#trim(Equipment1FromDD_IN)#)</cfif>
					<cfif Equipment1FromDD_LIKE NEQ "">AND Equipment1FromDD LIKE '%#trim(Equipment1FromDD_LIKE)#%'</cfif>
					<cfif Equipment1FromYY NEQ "">AND Equipment1FromYY = '#Equipment1FromYY#'</cfif>
					<cfif Equipment1FromYY_IN NEQ "">AND Equipment1FromYY IN(#trim(Equipment1FromYY_IN)#)</cfif>
					<cfif Equipment1FromYY_LIKE NEQ "">AND Equipment1FromYY LIKE '%#trim(Equipment1FromYY_LIKE)#%'</cfif>
					<cfif Equipment1ToMM NEQ "">AND Equipment1ToMM = '#Equipment1ToMM#'</cfif>
					<cfif Equipment1ToMM_IN NEQ "">AND Equipment1ToMM IN(#trim(Equipment1ToMM_IN)#)</cfif>
					<cfif Equipment1ToMM_LIKE NEQ "">AND Equipment1ToMM LIKE '%#trim(Equipment1ToMM_LIKE)#%'</cfif>
					<cfif Equipment1ToDD NEQ "">AND Equipment1ToDD = '#Equipment1ToDD#'</cfif>
					<cfif Equipment1ToDD_IN NEQ "">AND Equipment1ToDD IN(#trim(Equipment1ToDD_IN)#)</cfif>
					<cfif Equipment1ToDD_LIKE NEQ "">AND Equipment1ToDD LIKE '%#trim(Equipment1ToDD_LIKE)#%'</cfif>
					<cfif Equipment1ToYY NEQ "">AND Equipment1ToYY = '#Equipment1ToYY#'</cfif>
					<cfif Equipment1ToYY_IN NEQ "">AND Equipment1ToYY IN(#trim(Equipment1ToYY_IN)#)</cfif>
					<cfif Equipment1ToYY_LIKE NEQ "">AND Equipment1ToYY LIKE '%#trim(Equipment1ToYY_LIKE)#%'</cfif>
					<cfif Equipment1SupplierNameTBox NEQ "">AND Equipment1SupplierNameTBox = '#Equipment1SupplierNameTBox#'</cfif>
					<cfif Equipment1SupplierNameTBox_IN NEQ "">AND Equipment1SupplierNameTBox IN(#trim(Equipment1SupplierNameTBox_IN)#)</cfif>
					<cfif Equipment1SupplierNameTBox_LIKE NEQ "">AND Equipment1SupplierNameTBox LIKE '%#trim(Equipment1SupplierNameTBox_LIKE)#%'</cfif>
					<cfif Equipment1SupplierTelephoneTBox NEQ "">AND Equipment1SupplierTelephoneTBox = '#Equipment1SupplierTelephoneTBox#'</cfif>
					<cfif Equipment1SupplierTelephoneTBox_IN NEQ "">AND Equipment1SupplierTelephoneTBox IN(#trim(Equipment1SupplierTelephoneTBox_IN)#)</cfif>
					<cfif Equipment1SupplierTelephoneTBox_LIKE NEQ "">AND Equipment1SupplierTelephoneTBox LIKE '%#trim(Equipment1SupplierTelephoneTBox_LIKE)#%'</cfif>
					<cfif Equipment2TypeTBox NEQ "">AND Equipment2TypeTBox = '#Equipment2TypeTBox#'</cfif>
					<cfif Equipment2TypeTBox_IN NEQ "">AND Equipment2TypeTBox IN(#trim(Equipment2TypeTBox_IN)#)</cfif>
					<cfif Equipment2TypeTBox_LIKE NEQ "">AND Equipment2TypeTBox LIKE '%#trim(Equipment2TypeTBox_LIKE)#%'</cfif>
					<cfif Equipment2RentPurchasedSelect NEQ "">AND Equipment2RentPurchasedSelect = '#Equipment2RentPurchasedSelect#'</cfif>
					<cfif Equipment2RentPurchasedSelect_IN NEQ "">AND Equipment2RentPurchasedSelect IN(#trim(Equipment2RentPurchasedSelect_IN)#)</cfif>
					<cfif Equipment2RentPurchasedSelect_LIKE NEQ "">AND Equipment2RentPurchasedSelect LIKE '%#trim(Equipment2RentPurchasedSelect_LIKE)#%'</cfif>
					<cfif Equipment2FromMM NEQ "">AND Equipment2FromMM = '#Equipment2FromMM#'</cfif>
					<cfif Equipment2FromMM_IN NEQ "">AND Equipment2FromMM IN(#trim(Equipment2FromMM_IN)#)</cfif>
					<cfif Equipment2FromMM_LIKE NEQ "">AND Equipment2FromMM LIKE '%#trim(Equipment2FromMM_LIKE)#%'</cfif>
					<cfif Equipment2FromDD NEQ "">AND Equipment2FromDD = '#Equipment2FromDD#'</cfif>
					<cfif Equipment2FromDD_IN NEQ "">AND Equipment2FromDD IN(#trim(Equipment2FromDD_IN)#)</cfif>
					<cfif Equipment2FromDD_LIKE NEQ "">AND Equipment2FromDD LIKE '%#trim(Equipment2FromDD_LIKE)#%'</cfif>
					<cfif Equipment2FromYY NEQ "">AND Equipment2FromYY = '#Equipment2FromYY#'</cfif>
					<cfif Equipment2FromYY_IN NEQ "">AND Equipment2FromYY IN(#trim(Equipment2FromYY_IN)#)</cfif>
					<cfif Equipment2FromYY_LIKE NEQ "">AND Equipment2FromYY LIKE '%#trim(Equipment2FromYY_LIKE)#%'</cfif>
					<cfif Equipment2ToMM NEQ "">AND Equipment2ToMM = '#Equipment2ToMM#'</cfif>
					<cfif Equipment2ToMM_IN NEQ "">AND Equipment2ToMM IN(#trim(Equipment2ToMM_IN)#)</cfif>
					<cfif Equipment2ToMM_LIKE NEQ "">AND Equipment2ToMM LIKE '%#trim(Equipment2ToMM_LIKE)#%'</cfif>
					<cfif Equipment2ToDD NEQ "">AND Equipment2ToDD = '#Equipment2ToDD#'</cfif>
					<cfif Equipment2ToDD_IN NEQ "">AND Equipment2ToDD IN(#trim(Equipment2ToDD_IN)#)</cfif>
					<cfif Equipment2ToDD_LIKE NEQ "">AND Equipment2ToDD LIKE '%#trim(Equipment2ToDD_LIKE)#%'</cfif>
					<cfif Equipment2ToYY NEQ "">AND Equipment2ToYY = '#Equipment2ToYY#'</cfif>
					<cfif Equipment2ToYY_IN NEQ "">AND Equipment2ToYY IN(#trim(Equipment2ToYY_IN)#)</cfif>
					<cfif Equipment2ToYY_LIKE NEQ "">AND Equipment2ToYY LIKE '%#trim(Equipment2ToYY_LIKE)#%'</cfif>
					<cfif Equipment2SupplierNameTBox NEQ "">AND Equipment2SupplierNameTBox = '#Equipment2SupplierNameTBox#'</cfif>
					<cfif Equipment2SupplierNameTBox_IN NEQ "">AND Equipment2SupplierNameTBox IN(#trim(Equipment2SupplierNameTBox_IN)#)</cfif>
					<cfif Equipment2SupplierNameTBox_LIKE NEQ "">AND Equipment2SupplierNameTBox LIKE '%#trim(Equipment2SupplierNameTBox_LIKE)#%'</cfif>
					<cfif Equipment2SupplierTelephoneTBox NEQ "">AND Equipment2SupplierTelephoneTBox = '#Equipment2SupplierTelephoneTBox#'</cfif>
					<cfif Equipment2SupplierTelephoneTBox_IN NEQ "">AND Equipment2SupplierTelephoneTBox IN(#trim(Equipment2SupplierTelephoneTBox_IN)#)</cfif>
					<cfif Equipment2SupplierTelephoneTBox_LIKE NEQ "">AND Equipment2SupplierTelephoneTBox LIKE '%#trim(Equipment2SupplierTelephoneTBox_LIKE)#%'</cfif>
					<cfif Equipment3TypeTBox NEQ "">AND Equipment3TypeTBox = '#Equipment3TypeTBox#'</cfif>
					<cfif Equipment3TypeTBox_IN NEQ "">AND Equipment3TypeTBox IN(#trim(Equipment3TypeTBox_IN)#)</cfif>
					<cfif Equipment3TypeTBox_LIKE NEQ "">AND Equipment3TypeTBox LIKE '%#trim(Equipment3TypeTBox_LIKE)#%'</cfif>
					<cfif Equipment3RentPurchasedSelect NEQ "">AND Equipment3RentPurchasedSelect = '#Equipment3RentPurchasedSelect#'</cfif>
					<cfif Equipment3RentPurchasedSelect_IN NEQ "">AND Equipment3RentPurchasedSelect IN(#trim(Equipment3RentPurchasedSelect_IN)#)</cfif>
					<cfif Equipment3RentPurchasedSelect_LIKE NEQ "">AND Equipment3RentPurchasedSelect LIKE '%#trim(Equipment3RentPurchasedSelect_LIKE)#%'</cfif>
					<cfif Equipment3FromMM NEQ "">AND Equipment3FromMM = '#Equipment3FromMM#'</cfif>
					<cfif Equipment3FromMM_IN NEQ "">AND Equipment3FromMM IN(#trim(Equipment3FromMM_IN)#)</cfif>
					<cfif Equipment3FromMM_LIKE NEQ "">AND Equipment3FromMM LIKE '%#trim(Equipment3FromMM_LIKE)#%'</cfif>
					<cfif Equipment3FromDD NEQ "">AND Equipment3FromDD = '#Equipment3FromDD#'</cfif>
					<cfif Equipment3FromDD_IN NEQ "">AND Equipment3FromDD IN(#trim(Equipment3FromDD_IN)#)</cfif>
					<cfif Equipment3FromDD_LIKE NEQ "">AND Equipment3FromDD LIKE '%#trim(Equipment3FromDD_LIKE)#%'</cfif>
					<cfif Equipment3FromYY NEQ "">AND Equipment3FromYY = '#Equipment3FromYY#'</cfif>
					<cfif Equipment3FromYY_IN NEQ "">AND Equipment3FromYY IN(#trim(Equipment3FromYY_IN)#)</cfif>
					<cfif Equipment3FromYY_LIKE NEQ "">AND Equipment3FromYY LIKE '%#trim(Equipment3FromYY_LIKE)#%'</cfif>
					<cfif Equipment3ToMM NEQ "">AND Equipment3ToMM = '#Equipment3ToMM#'</cfif>
					<cfif Equipment3ToMM_IN NEQ "">AND Equipment3ToMM IN(#trim(Equipment3ToMM_IN)#)</cfif>
					<cfif Equipment3ToMM_LIKE NEQ "">AND Equipment3ToMM LIKE '%#trim(Equipment3ToMM_LIKE)#%'</cfif>
					<cfif Equipment3ToDD NEQ "">AND Equipment3ToDD = '#Equipment3ToDD#'</cfif>
					<cfif Equipment3ToDD_IN NEQ "">AND Equipment3ToDD IN(#trim(Equipment3ToDD_IN)#)</cfif>
					<cfif Equipment3ToDD_LIKE NEQ "">AND Equipment3ToDD LIKE '%#trim(Equipment3ToDD_LIKE)#%'</cfif>
					<cfif Equipment3ToYY NEQ "">AND Equipment3ToYY = '#Equipment3ToYY#'</cfif>
					<cfif Equipment3ToYY_IN NEQ "">AND Equipment3ToYY IN(#trim(Equipment3ToYY_IN)#)</cfif>
					<cfif Equipment3ToYY_LIKE NEQ "">AND Equipment3ToYY LIKE '%#trim(Equipment3ToYY_LIKE)#%'</cfif>
					<cfif Equipment3SupplierNameTBox NEQ "">AND Equipment3SupplierNameTBox = '#Equipment3SupplierNameTBox#'</cfif>
					<cfif Equipment3SupplierNameTBox_IN NEQ "">AND Equipment3SupplierNameTBox IN(#trim(Equipment3SupplierNameTBox_IN)#)</cfif>
					<cfif Equipment3SupplierNameTBox_LIKE NEQ "">AND Equipment3SupplierNameTBox LIKE '%#trim(Equipment3SupplierNameTBox_LIKE)#%'</cfif>
					<cfif Equipment3SupplierTelephoneTBox NEQ "">AND Equipment3SupplierTelephoneTBox = '#Equipment3SupplierTelephoneTBox#'</cfif>
					<cfif Equipment3SupplierTelephoneTBox_IN NEQ "">AND Equipment3SupplierTelephoneTBox IN(#trim(Equipment3SupplierTelephoneTBox_IN)#)</cfif>
					<cfif Equipment3SupplierTelephoneTBox_LIKE NEQ "">AND Equipment3SupplierTelephoneTBox LIKE '%#trim(Equipment3SupplierTelephoneTBox_LIKE)#%'</cfif>
					<cfif Equipment4TypeTBox NEQ "">AND Equipment4TypeTBox = '#Equipment4TypeTBox#'</cfif>
					<cfif Equipment4TypeTBox_IN NEQ "">AND Equipment4TypeTBox IN(#trim(Equipment4TypeTBox_IN)#)</cfif>
					<cfif Equipment4TypeTBox_LIKE NEQ "">AND Equipment4TypeTBox LIKE '%#trim(Equipment4TypeTBox_LIKE)#%'</cfif>
					<cfif Equipment4RentPurchasedSelect NEQ "">AND Equipment4RentPurchasedSelect = '#Equipment4RentPurchasedSelect#'</cfif>
					<cfif Equipment4RentPurchasedSelect_IN NEQ "">AND Equipment4RentPurchasedSelect IN(#trim(Equipment4RentPurchasedSelect_IN)#)</cfif>
					<cfif Equipment4RentPurchasedSelect_LIKE NEQ "">AND Equipment4RentPurchasedSelect LIKE '%#trim(Equipment4RentPurchasedSelect_LIKE)#%'</cfif>
					<cfif Equipment4FromMM NEQ "">AND Equipment4FromMM = '#Equipment4FromMM#'</cfif>
					<cfif Equipment4FromMM_IN NEQ "">AND Equipment4FromMM IN(#trim(Equipment4FromMM_IN)#)</cfif>
					<cfif Equipment4FromMM_LIKE NEQ "">AND Equipment4FromMM LIKE '%#trim(Equipment4FromMM_LIKE)#%'</cfif>
					<cfif Equipment4FromDD NEQ "">AND Equipment4FromDD = '#Equipment4FromDD#'</cfif>
					<cfif Equipment4FromDD_IN NEQ "">AND Equipment4FromDD IN(#trim(Equipment4FromDD_IN)#)</cfif>
					<cfif Equipment4FromDD_LIKE NEQ "">AND Equipment4FromDD LIKE '%#trim(Equipment4FromDD_LIKE)#%'</cfif>
					<cfif Equipment4FromYY NEQ "">AND Equipment4FromYY = '#Equipment4FromYY#'</cfif>
					<cfif Equipment4FromYY_IN NEQ "">AND Equipment4FromYY IN(#trim(Equipment4FromYY_IN)#)</cfif>
					<cfif Equipment4FromYY_LIKE NEQ "">AND Equipment4FromYY LIKE '%#trim(Equipment4FromYY_LIKE)#%'</cfif>
					<cfif Equipment4ToMM NEQ "">AND Equipment4ToMM = '#Equipment4ToMM#'</cfif>
					<cfif Equipment4ToMM_IN NEQ "">AND Equipment4ToMM IN(#trim(Equipment4ToMM_IN)#)</cfif>
					<cfif Equipment4ToMM_LIKE NEQ "">AND Equipment4ToMM LIKE '%#trim(Equipment4ToMM_LIKE)#%'</cfif>
					<cfif Equipment4ToDD NEQ "">AND Equipment4ToDD = '#Equipment4ToDD#'</cfif>
					<cfif Equipment4ToDD_IN NEQ "">AND Equipment4ToDD IN(#trim(Equipment4ToDD_IN)#)</cfif>
					<cfif Equipment4ToDD_LIKE NEQ "">AND Equipment4ToDD LIKE '%#trim(Equipment4ToDD_LIKE)#%'</cfif>
					<cfif Equipment4ToYY NEQ "">AND Equipment4ToYY = '#Equipment4ToYY#'</cfif>
					<cfif Equipment4ToYY_IN NEQ "">AND Equipment4ToYY IN(#trim(Equipment4ToYY_IN)#)</cfif>
					<cfif Equipment4ToYY_LIKE NEQ "">AND Equipment4ToYY LIKE '%#trim(Equipment4ToYY_LIKE)#%'</cfif>
					<cfif Equipment4SupplierNameTBox NEQ "">AND Equipment4SupplierNameTBox = '#Equipment4SupplierNameTBox#'</cfif>
					<cfif Equipment4SupplierNameTBox_IN NEQ "">AND Equipment4SupplierNameTBox IN(#trim(Equipment4SupplierNameTBox_IN)#)</cfif>
					<cfif Equipment4SupplierNameTBox_LIKE NEQ "">AND Equipment4SupplierNameTBox LIKE '%#trim(Equipment4SupplierNameTBox_LIKE)#%'</cfif>
					<cfif Equipment4SupplierTelephoneTBox NEQ "">AND Equipment4SupplierTelephoneTBox = '#Equipment4SupplierTelephoneTBox#'</cfif>
					<cfif Equipment4SupplierTelephoneTBox_IN NEQ "">AND Equipment4SupplierTelephoneTBox IN(#trim(Equipment4SupplierTelephoneTBox_IN)#)</cfif>
					<cfif Equipment4SupplierTelephoneTBox_LIKE NEQ "">AND Equipment4SupplierTelephoneTBox LIKE '%#trim(Equipment4SupplierTelephoneTBox_LIKE)#%'</cfif>
					<cfif Equipment5TypeTBox NEQ "">AND Equipment5TypeTBox = '#Equipment5TypeTBox#'</cfif>
					<cfif Equipment5TypeTBox_IN NEQ "">AND Equipment5TypeTBox IN(#trim(Equipment5TypeTBox_IN)#)</cfif>
					<cfif Equipment5TypeTBox_LIKE NEQ "">AND Equipment5TypeTBox LIKE '%#trim(Equipment5TypeTBox_LIKE)#%'</cfif>
					<cfif Equipment5RentPurchasedSelect NEQ "">AND Equipment5RentPurchasedSelect = '#Equipment5RentPurchasedSelect#'</cfif>
					<cfif Equipment5RentPurchasedSelect_IN NEQ "">AND Equipment5RentPurchasedSelect IN(#trim(Equipment5RentPurchasedSelect_IN)#)</cfif>
					<cfif Equipment5RentPurchasedSelect_LIKE NEQ "">AND Equipment5RentPurchasedSelect LIKE '%#trim(Equipment5RentPurchasedSelect_LIKE)#%'</cfif>
					<cfif Equipment5FromMM NEQ "">AND Equipment5FromMM = '#Equipment5FromMM#'</cfif>
					<cfif Equipment5FromMM_IN NEQ "">AND Equipment5FromMM IN(#trim(Equipment5FromMM_IN)#)</cfif>
					<cfif Equipment5FromMM_LIKE NEQ "">AND Equipment5FromMM LIKE '%#trim(Equipment5FromMM_LIKE)#%'</cfif>
					<cfif Equipment5FromDD NEQ "">AND Equipment5FromDD = '#Equipment5FromDD#'</cfif>
					<cfif Equipment5FromDD_IN NEQ "">AND Equipment5FromDD IN(#trim(Equipment5FromDD_IN)#)</cfif>
					<cfif Equipment5FromDD_LIKE NEQ "">AND Equipment5FromDD LIKE '%#trim(Equipment5FromDD_LIKE)#%'</cfif>
					<cfif Equipment5FromYY NEQ "">AND Equipment5FromYY = '#Equipment5FromYY#'</cfif>
					<cfif Equipment5FromYY_IN NEQ "">AND Equipment5FromYY IN(#trim(Equipment5FromYY_IN)#)</cfif>
					<cfif Equipment5FromYY_LIKE NEQ "">AND Equipment5FromYY LIKE '%#trim(Equipment5FromYY_LIKE)#%'</cfif>
					<cfif Equipment5ToMM NEQ "">AND Equipment5ToMM = '#Equipment5ToMM#'</cfif>
					<cfif Equipment5ToMM_IN NEQ "">AND Equipment5ToMM IN(#trim(Equipment5ToMM_IN)#)</cfif>
					<cfif Equipment5ToMM_LIKE NEQ "">AND Equipment5ToMM LIKE '%#trim(Equipment5ToMM_LIKE)#%'</cfif>
					<cfif Equipment5ToDD NEQ "">AND Equipment5ToDD = '#Equipment5ToDD#'</cfif>
					<cfif Equipment5ToDD_IN NEQ "">AND Equipment5ToDD IN(#trim(Equipment5ToDD_IN)#)</cfif>
					<cfif Equipment5ToDD_LIKE NEQ "">AND Equipment5ToDD LIKE '%#trim(Equipment5ToDD_LIKE)#%'</cfif>
					<cfif Equipment5ToYY NEQ "">AND Equipment5ToYY = '#Equipment5ToYY#'</cfif>
					<cfif Equipment5ToYY_IN NEQ "">AND Equipment5ToYY IN(#trim(Equipment5ToYY_IN)#)</cfif>
					<cfif Equipment5ToYY_LIKE NEQ "">AND Equipment5ToYY LIKE '%#trim(Equipment5ToYY_LIKE)#%'</cfif>
					<cfif Equipment5SupplierNameTBox NEQ "">AND Equipment5SupplierNameTBox = '#Equipment5SupplierNameTBox#'</cfif>
					<cfif Equipment5SupplierNameTBox_IN NEQ "">AND Equipment5SupplierNameTBox IN(#trim(Equipment5SupplierNameTBox_IN)#)</cfif>
					<cfif Equipment5SupplierNameTBox_LIKE NEQ "">AND Equipment5SupplierNameTBox LIKE '%#trim(Equipment5SupplierNameTBox_LIKE)#%'</cfif>
					<cfif Equipment5SupplierTelephoneTBox NEQ "">AND Equipment5SupplierTelephoneTBox = '#Equipment5SupplierTelephoneTBox#'</cfif>
					<cfif Equipment5SupplierTelephoneTBox_IN NEQ "">AND Equipment5SupplierTelephoneTBox IN(#trim(Equipment5SupplierTelephoneTBox_IN)#)</cfif>
					<cfif Equipment5SupplierTelephoneTBox_LIKE NEQ "">AND Equipment5SupplierTelephoneTBox LIKE '%#trim(Equipment5SupplierTelephoneTBox_LIKE)#%'</cfif>
					<cfif OPTION_14_CBox_OxygenPAo2 NEQ "">AND OPTION_14_CBox_OxygenPAo2 = '#OPTION_14_CBox_OxygenPAo2#'</cfif>
					<cfif OPTION_14_CBox_OxygenPAo2_IN NEQ "">AND OPTION_14_CBox_OxygenPAo2 IN(#trim(OPTION_14_CBox_OxygenPAo2_IN)#)</cfif>
					<cfif OPTION_14_CBox_OxygenPAo2_LIKE NEQ "">AND OPTION_14_CBox_OxygenPAo2 LIKE '%#trim(OPTION_14_CBox_OxygenPAo2_LIKE)#%'</cfif>
					<cfif OPTION_14_CBox_OxygenSAo2 NEQ "">AND OPTION_14_CBox_OxygenSAo2 = '#OPTION_14_CBox_OxygenSAo2#'</cfif>
					<cfif OPTION_14_CBox_OxygenSAo2_IN NEQ "">AND OPTION_14_CBox_OxygenSAo2 IN(#trim(OPTION_14_CBox_OxygenSAo2_IN)#)</cfif>
					<cfif OPTION_14_CBox_OxygenSAo2_LIKE NEQ "">AND OPTION_14_CBox_OxygenSAo2 LIKE '%#trim(OPTION_14_CBox_OxygenSAo2_LIKE)#%'</cfif>
					<cfif OPTION_14_CBox_OxygenSPo2 NEQ "">AND OPTION_14_CBox_OxygenSPo2 = '#OPTION_14_CBox_OxygenSPo2#'</cfif>
					<cfif OPTION_14_CBox_OxygenSPo2_IN NEQ "">AND OPTION_14_CBox_OxygenSPo2 IN(#trim(OPTION_14_CBox_OxygenSPo2_IN)#)</cfif>
					<cfif OPTION_14_CBox_OxygenSPo2_LIKE NEQ "">AND OPTION_14_CBox_OxygenSPo2 LIKE '%#trim(OPTION_14_CBox_OxygenSPo2_LIKE)#%'</cfif>
					<cfif OxygenPAO2TBox NEQ "">AND OxygenPAO2TBox = '#OxygenPAO2TBox#'</cfif>
					<cfif OxygenPAO2TBox_IN NEQ "">AND OxygenPAO2TBox IN(#trim(OxygenPAO2TBox_IN)#)</cfif>
					<cfif OxygenPAO2TBox_LIKE NEQ "">AND OxygenPAO2TBox LIKE '%#trim(OxygenPAO2TBox_LIKE)#%'</cfif>
					<cfif OxygenSAO2TBox NEQ "">AND OxygenSAO2TBox = '#OxygenSAO2TBox#'</cfif>
					<cfif OxygenSAO2TBox_IN NEQ "">AND OxygenSAO2TBox IN(#trim(OxygenSAO2TBox_IN)#)</cfif>
					<cfif OxygenSAO2TBox_LIKE NEQ "">AND OxygenSAO2TBox LIKE '%#trim(OxygenSAO2TBox_LIKE)#%'</cfif>
					<cfif CPAPStudy_CBox NEQ "">AND CPAPStudy_CBox = '#CPAPStudy_CBox#'</cfif>
					<cfif CPAPStudy_CBox_IN NEQ "">AND CPAPStudy_CBox IN(#trim(CPAPStudy_CBox_IN)#)</cfif>
					<cfif CPAPStudy_CBox_LIKE NEQ "">AND CPAPStudy_CBox LIKE '%#trim(CPAPStudy_CBox_LIKE)#%'</cfif>
					<cfif CPAPStudyNote NEQ "">AND CPAPStudyNote = '#CPAPStudyNote#'</cfif>
					<cfif CPAPStudyNote_IN NEQ "">AND CPAPStudyNote IN(#trim(CPAPStudyNote_IN)#)</cfif>
					<cfif CPAPStudyNote_LIKE NEQ "">AND CPAPStudyNote LIKE '%#trim(CPAPStudyNote_LIKE)#%'</cfif>
					<cfif OxygenSPO2TBox NEQ "">AND OxygenSPO2TBox = '#OxygenSPO2TBox#'</cfif>
					<cfif OxygenSPO2TBox_IN NEQ "">AND OxygenSPO2TBox IN(#trim(OxygenSPO2TBox_IN)#)</cfif>
					<cfif OxygenSPO2TBox_LIKE NEQ "">AND OxygenSPO2TBox LIKE '%#trim(OxygenSPO2TBox_LIKE)#%'</cfif>
					<cfif CPAPStudyOnFile_CBox NEQ "">AND CPAPStudyOnFile_CBox = '#CPAPStudyOnFile_CBox#'</cfif>
					<cfif CPAPStudyOnFile_CBox_IN NEQ "">AND CPAPStudyOnFile_CBox IN(#trim(CPAPStudyOnFile_CBox_IN)#)</cfif>
					<cfif CPAPStudyOnFile_CBox_LIKE NEQ "">AND CPAPStudyOnFile_CBox LIKE '%#trim(CPAPStudyOnFile_CBox_LIKE)#%'</cfif>
					<cfif CPAPStudyOnFileNote NEQ "">AND CPAPStudyOnFileNote = '#CPAPStudyOnFileNote#'</cfif>
					<cfif CPAPStudyOnFileNote_IN NEQ "">AND CPAPStudyOnFileNote IN(#trim(CPAPStudyOnFileNote_IN)#)</cfif>
					<cfif CPAPStudyOnFileNote_LIKE NEQ "">AND CPAPStudyOnFileNote LIKE '%#trim(CPAPStudyOnFileNote_LIKE)#%'</cfif>
					<cfif LabTestDateMM NEQ "">AND LabTestDateMM = '#LabTestDateMM#'</cfif>
					<cfif LabTestDateMM_IN NEQ "">AND LabTestDateMM IN(#trim(LabTestDateMM_IN)#)</cfif>
					<cfif LabTestDateMM_LIKE NEQ "">AND LabTestDateMM LIKE '%#trim(LabTestDateMM_LIKE)#%'</cfif>
					<cfif LabTestDateDD NEQ "">AND LabTestDateDD = '#LabTestDateDD#'</cfif>
					<cfif LabTestDateDD_IN NEQ "">AND LabTestDateDD IN(#trim(LabTestDateDD_IN)#)</cfif>
					<cfif LabTestDateDD_LIKE NEQ "">AND LabTestDateDD LIKE '%#trim(LabTestDateDD_LIKE)#%'</cfif>
					<cfif LabTestDateYY NEQ "">AND LabTestDateYY = '#LabTestDateYY#'</cfif>
					<cfif LabTestDateYY_IN NEQ "">AND LabTestDateYY IN(#trim(LabTestDateYY_IN)#)</cfif>
					<cfif LabTestDateYY_LIKE NEQ "">AND LabTestDateYY LIKE '%#trim(LabTestDateYY_LIKE)#%'</cfif>
					<cfif CPAPStudyPerformedAt NEQ "">AND CPAPStudyPerformedAt = '#CPAPStudyPerformedAt#'</cfif>
					<cfif CPAPStudyPerformedAt_IN NEQ "">AND CPAPStudyPerformedAt IN(#trim(CPAPStudyPerformedAt_IN)#)</cfif>
					<cfif CPAPStudyPerformedAt_LIKE NEQ "">AND CPAPStudyPerformedAt LIKE '%#trim(CPAPStudyPerformedAt_LIKE)#%'</cfif>
					<cfif LabTestFacilityTBox NEQ "">AND LabTestFacilityTBox = '#LabTestFacilityTBox#'</cfif>
					<cfif LabTestFacilityTBox_IN NEQ "">AND LabTestFacilityTBox IN(#trim(LabTestFacilityTBox_IN)#)</cfif>
					<cfif LabTestFacilityTBox_LIKE NEQ "">AND LabTestFacilityTBox LIKE '%#trim(LabTestFacilityTBox_LIKE)#%'</cfif>
					<cfif CPAPStudyPerformedAt2 NEQ "">AND CPAPStudyPerformedAt2 = '#CPAPStudyPerformedAt2#'</cfif>
					<cfif CPAPStudyPerformedAt2_IN NEQ "">AND CPAPStudyPerformedAt2 IN(#trim(CPAPStudyPerformedAt2_IN)#)</cfif>
					<cfif CPAPStudyPerformedAt2_LIKE NEQ "">AND CPAPStudyPerformedAt2 LIKE '%#trim(CPAPStudyPerformedAt2_LIKE)#%'</cfif>
					<cfif CPAPStudyPerformedAt3 NEQ "">AND CPAPStudyPerformedAt3 = '#CPAPStudyPerformedAt3#'</cfif>
					<cfif CPAPStudyPerformedAt3_IN NEQ "">AND CPAPStudyPerformedAt3 IN(#trim(CPAPStudyPerformedAt3_IN)#)</cfif>
					<cfif CPAPStudyPerformedAt3_LIKE NEQ "">AND CPAPStudyPerformedAt3 LIKE '%#trim(CPAPStudyPerformedAt3_LIKE)#%'</cfif>
					<cfif Active NEQ "">AND Active = '#Active#'</cfif>
					<cfif Active_IN NEQ "">AND Active IN(#trim(Active_IN)#)</cfif>
					<cfif Active_LIKE NEQ "">AND Active LIKE '%#trim(Active_LIKE)#%'</cfif>
					<cfif InactiveCode NEQ "" AND IsNumeric(InactiveCode)>AND InactiveCode = #InactiveCode#</cfif>
					<cfif InactiveCode_IN NEQ "">AND InactiveCode IN(#trim(InactiveCode_IN)#)</cfif>
					<cfif InactiveCode_LIKE NEQ "">AND InactiveCode LIKE '%#trim(InactiveCode_LIKE)#%'</cfif>
					<cfif DateCreated NEQ "">AND DateCreated = '#DateCreated#'</cfif>
					<cfif DateCreated_IN NEQ "">AND DateCreated IN(#trim(DateCreated_IN)#)</cfif>
					<cfif DateCreated_LIKE NEQ "">AND DateCreated LIKE '%#trim(DateCreated_LIKE)#%'</cfif>
					<cfif DateModified NEQ "">AND DateModified = '#DateModified#'</cfif>
					<cfif DateModified_IN NEQ "">AND DateModified IN(#trim(DateModified_IN)#)</cfif>
					<cfif DateModified_LIKE NEQ "">AND DateModified LIKE '%#trim(DateModified_LIKE)#%'</cfif>	
				<cfif OrderBy NEQ "">
					ORDER BY #trim(OrderBy)#
				</cfif>
				<cfif IsDefined("GroupBy1") AND GroupBy1 NEQ "" AND top1 EQ "no" AND (ListLen(fields) EQ ListLen(GroupBy1))>
					GROUP BY #trim(GroupBy1)#
				</cfif>
				<cfif top1 NEQ "no">LIMIT 1</cfif>
			</cfquery>
			
			<cfreturn getINTAKE_PatientIntakeFormQuery>
		
	</cffunction>
	
	
		
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->
		
				
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any Init to a record. If nothing is created in this   --->
		<!--- function then it just goes on.                                                 --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInit" hint="Called automatically before an Init occurs.">		
		</cffunction>
		
		<cffunction name="postInit" hint="Called automatically after an Init occurs.">		
		</cffunction>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any update to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!-------------------------------------------------------------------------------------->  
		<cffunction name="preUpdateCommit" hint="Called automatically before an update commit occurs.">		
		</cffunction>
		
		<cffunction name="postUpdateCommit" hint="Called automatically after an update commit occurs.">		
		</cffunction>
				
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any insert to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInsertCommit" hint="Called automatically before an insert commit occurs.">		
		</cffunction>
		
		<cffunction name="postInsertCommit" hint="Called automatically after an insert commit occurs.">		
		</cffunction>	
		
	
	<!---End_Custom_Functions--->


	
</cfcomponent>


