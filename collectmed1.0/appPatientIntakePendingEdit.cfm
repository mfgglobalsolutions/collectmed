<!---- appPatientIntakePendingEdit.cfm ---->



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.recordID" default="">
	<cfset recordID = attributes.recordID>
	
	<cfif IsDefined("form.recordID") AND form.recordID NEQ "">
		<cfset recordID = form.recordID>
	<cfelseif IsDefined("url.recordID") AND url.recordID NEQ "">
		<cfset recordID = url.recordID>	
	</cfif>
	
	<cfparam name="attributes.hidden_Step" default="1|#DateFormat(NOW(), 'mm/dd/yyyy')#|#TimeFormat(NOW(), 'hh:mm:ss tt')#|#trim(session.User.getUsersID())#|#trim(session.Entity.getFName())# #trim(session.Entity.getLName())#~">
	<cfset hidden_Step = attributes.hidden_Step>
	
	<cfparam name="attributes.hidden_UsersID" default="">
	<cfset hidden_UsersID = attributes.hidden_UsersID>
	
	<cfparam name="attributes.dateCreated" default="">
	<cfset dateCreated = attributes.dateCreated>
	
	<cfparam name="attributes.hidden_TimeStart" default="">
	<cfset hidden_TimeStart = attributes.hidden_TimeStart>
	
	<cfparam name="attributes.OPTION_1_CBox_Delivery" default="0">
	<cfset OPTION_1_CBox_Delivery = attributes.OPTION_1_CBox_Delivery>
	
	<cfparam name="attributes.OPTION_1_CBox_Pickup" default="0">
	<cfset OPTION_1_CBox_Pickup = attributes.OPTION_1_CBox_Pickup>
	
	<cfparam name="attributes.OPTION_1_CBox_Repair" default="0">
	<cfset OPTION_1_CBox_Repair = attributes.OPTION_1_CBox_Repair>
	
	<cfparam name="attributes.OPTION_1_CBox_Switch" default="0">
	<cfset OPTION_1_CBox_Switch = attributes.OPTION_1_CBox_Switch>
	
	<cfparam name="attributes.OPTION_1_CBox_Existing" default="0">
	<cfset OPTION_1_CBox_Existing = attributes.OPTION_1_CBox_Existing>
	
	<cfparam name="attributes.OPTION_2_CBox_Other" default="0">
	<cfset OPTION_2_CBox_Other = attributes.OPTION_2_CBox_Other>
	
	<cfparam name="attributes.OPTION_2_CBox_Hospice" default="0">
	<cfset OPTION_2_CBox_Hospice = attributes.OPTION_2_CBox_Hospice>
	
	<cfparam name="attributes.OPTION_2_CBox_Hospital" default="0">
	<cfset OPTION_2_CBox_Hospital = attributes.OPTION_2_CBox_Hospital>
	
	<cfparam name="attributes.otherTBox" default="">
	<cfset otherTBox = attributes.otherTBox>
	
	<cfparam name="attributes.hospiceTBox" default="">
	<cfset hospiceTBox = attributes.hospiceTBox>
	
	<cfparam name="attributes.OPTION_3_CBox_Medicare" default="0">
	<cfset OPTION_3_CBox_Medicare = attributes.OPTION_3_CBox_Medicare>
	
	<cfparam name="attributes.OPTION_3_CBox_PrivateInsurance" default="0">
	<cfset OPTION_3_CBox_PrivateInsurance = attributes.OPTION_3_CBox_PrivateInsurance>
	
	<cfparam name="attributes.OPTION_3_CBox_Medicaid" default="0">
	<cfset OPTION_3_CBox_Medicaid = attributes.OPTION_3_CBox_Medicaid>
	
	<cfparam name="attributes.OPTION_3_CBox_PrivatePay" default="0">
	<cfset OPTION_3_CBox_PrivatePay = attributes.OPTION_3_CBox_PrivatePay>
	
	<cfparam name="attributes.hospitalTBox" default="">
	<cfset hospitalTBox = attributes.hospitalTBox>
	
	<cfparam name="attributes.DischargeDateMM" default="">
	<cfset DischargeDateMM = attributes.DischargeDateMM>
	
	<cfparam name="attributes.DischargeDateDD" default="">
	<cfset DischargeDateDD = attributes.DischargeDateDD>
	
	<cfparam name="attributes.DischargeDateYY" default="">
	<cfset DischargeDateYY = attributes.DischargeDateYY>
	
	<cfparam name="attributes.callerPhoneTBox" default="">
	<cfset callerPhoneTBox = attributes.callerPhoneTBox>
	
	<cfparam name="attributes.roomNumberTBox" default="">
	<cfset roomNumberTBox = attributes.roomNumberTBox>
	
	<cfparam name="attributes.bedNumberTBox" default="">
	<cfset bedNumberTBox = attributes.bedNumberTBox>
	
	<cfparam name="attributes.patientAddressTBox" default="">
	<cfset patientAddressTBox = attributes.patientAddressTBox>
	
	<cfparam name="attributes.patientCityTBox" default="">
	<cfset patientCityTBox = attributes.patientCityTBox>
	
	<cfparam name="attributes.patientStateTBox" default="">
	<cfset patientStateTBox = attributes.patientStateTBox>
	
	<cfparam name="attributes.patientZipTBox" default="">
	<cfset patientZipTBox = attributes.patientZipTBox>
	
	<cfparam name="attributes.patientPhoneTBox" default="">
	<cfset patientPhoneTBox = attributes.patientPhoneTBox>
	
	<cfparam name="attributes.patientDOBMM" default="">
	<cfset patientDOBMM = attributes.patientDOBMM>
	
	<cfparam name="attributes.patientDOBDD" default="">
	<cfset patientDOBDD = attributes.patientDOBDD>
	
	<cfparam name="attributes.patientDOBYY" default="">
	<cfset patientDOBYY = attributes.patientDOBYY>
	
	<cfparam name="attributes.patientSSNTBox" default="">
	<cfset patientSSNTBox = attributes.patientSSNTBox>
	
	<cfparam name="attributes.patientHeightInches" default="">
	<cfset patientHeightInches = attributes.patientHeightInches>
	
	<cfparam name="attributes.patientWeightTBox" default="">
	<cfset patientWeightTBox = attributes.patientWeightTBox>
	
	<cfparam name="attributes.alternateContactRelationshipTBox" default="">
	<cfset alternateContactRelationshipTBox = attributes.alternateContactRelationshipTBox>
	
	<cfparam name="attributes.alternateContactPhoneTBox" default="">
	<cfset alternateContactPhoneTBox = attributes.alternateContactPhoneTBox>
	
	<cfparam name="attributes.hcpcCode1TBox" default="">
	<cfset hcpcCode1TBox = attributes.hcpcCode1TBox>
	
	<cfparam name="attributes.hcpcQty1TBox" default="">
	<cfset hcpcQty1TBox = attributes.hcpcQty1TBox>
	
	<cfparam name="attributes.hcpcProduct1TBox" default="">
	<cfset hcpcProduct1TBox = attributes.hcpcProduct1TBox>
	
	<cfparam name="attributes.hcpcDX1TBox" default="">
	<cfset hcpcDX1TBox = attributes.hcpcDX1TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear1TBox" default="">
	<cfset hcpcLengthOfNeedYear1TBox = attributes.hcpcLengthOfNeedYear1TBox>
	
	<cfparam name="attributes.hcpcCode6TBox" default="">
	<cfset hcpcCode6TBox = attributes.hcpcCode6TBox>
	
	<cfparam name="attributes.hcpcQty6TBox" default="">
	<cfset hcpcQty6TBox = attributes.hcpcQty6TBox>
	
	<cfparam name="attributes.hcpcProduct6TBox" default="">
	<cfset hcpcProduct6TBox = attributes.hcpcProduct6TBox>
	
	<cfparam name="attributes.hcpcDX6TBox" default="">
	<cfset hcpcDX6TBox = attributes.hcpcDX6TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear6TBox" default="">
	<cfset hcpcLengthOfNeedYear6TBox = attributes.hcpcLengthOfNeedYear6TBox>
	
	<cfparam name="attributes.hcpcCode2TBox" default="">
	<cfset hcpcCode2TBox = attributes.hcpcCode2TBox>
	
	<cfparam name="attributes.hcpcQty2TBox" default="">
	<cfset hcpcQty2TBox = attributes.hcpcQty2TBox>
	
	<cfparam name="attributes.hcpcProduct2TBox" default="">
	<cfset hcpcProduct2TBox = attributes.hcpcProduct2TBox>
	
	<cfparam name="attributes.hcpcDX2TBox" default="">
	<cfset hcpcDX2TBox = attributes.hcpcDX2TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear2TBox" default="">
	<cfset hcpcLengthOfNeedYear2TBox = attributes.hcpcLengthOfNeedYear2TBox>
	
	<cfparam name="attributes.hcpcCode7TBox" default="">
	<cfset hcpcCode7TBox = attributes.hcpcCode7TBox>
	
	<cfparam name="attributes.hcpcQty7TBox" default="">
	<cfset hcpcQty7TBox = attributes.hcpcQty7TBox>
	
	<cfparam name="attributes.hcpcProduct7TBox" default="">
	<cfset hcpcProduct7TBox = attributes.hcpcProduct7TBox>
	
	<cfparam name="attributes.hcpcDX7TBox" default="">
	<cfset hcpcDX7TBox = attributes.hcpcDX7TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear7TBox" default="">
	<cfset hcpcLengthOfNeedYear7TBox = attributes.hcpcLengthOfNeedYear7TBox>
		
	<cfparam name="attributes.hcpcCode3TBox" default="">
	<cfset hcpcCode3TBox = attributes.hcpcCode3TBox>
	
	<cfparam name="attributes.hcpcQty3TBox" default="">
	<cfset hcpcQty3TBox = attributes.hcpcQty3TBox>
	
	<cfparam name="attributes.hcpcProduct3TBox" default="">
	<cfset hcpcProduct3TBox = attributes.hcpcProduct3TBox>
	
	<cfparam name="attributes.hcpcDX3TBox" default="">
	<cfset hcpcDX3TBox = attributes.hcpcDX3TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear3TBox" default="">
	<cfset hcpcLengthOfNeedYear3TBox = attributes.hcpcLengthOfNeedYear3TBox>
	
	<cfparam name="attributes.hcpcCode8TBox" default="">
	<cfset hcpcCode8TBox = attributes.hcpcCode8TBox>
	
	<cfparam name="attributes.hcpcQty8TBox" default="">
	<cfset hcpcQty8TBox = attributes.hcpcQty8TBox>
	
	<cfparam name="attributes.hcpcProduct8TBox" default="">
	<cfset hcpcProduct8TBox = attributes.hcpcProduct8TBox>
	
	<cfparam name="attributes.hcpcDX8TBox" default="">
	<cfset hcpcDX8TBox = attributes.hcpcDX8TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear8TBox" default="">
	<cfset hcpcLengthOfNeedYear8TBox = attributes.hcpcLengthOfNeedYear8TBox>
	
	<cfparam name="attributes.hcpcCode4TBox" default="">
	<cfset hcpcCode4TBox = attributes.hcpcCode4TBox>
	
	<cfparam name="attributes.hcpcQty4TBox" default="">
	<cfset hcpcQty4TBox = attributes.hcpcQty4TBox>
	
	<cfparam name="attributes.hcpcProduct4TBox" default="">
	<cfset hcpcProduct4TBox = attributes.hcpcProduct4TBox>
	
	<cfparam name="attributes.hcpcDX4TBox" default="">
	<cfset hcpcDX4TBox = attributes.hcpcDX4TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear4TBox" default="">
	<cfset hcpcLengthOfNeedYear4TBox = attributes.hcpcLengthOfNeedYear4TBox>
	
	<cfparam name="attributes.hcpcCode9TBox" default="">
	<cfset hcpcCode9TBox = attributes.hcpcCode9TBox>
	
	<cfparam name="attributes.hcpcQty9TBox" default="">
	<cfset hcpcQty9TBox = attributes.hcpcQty9TBox>
	
	<cfparam name="attributes.hcpcProduct9TBox" default="">
	<cfset hcpcProduct9TBox = attributes.hcpcProduct9TBox>
	
	<cfparam name="attributes.hcpcDX9TBox" default="">
	<cfset hcpcDX9TBox = attributes.hcpcDX9TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear9TBox" default="">
	<cfset hcpcLengthOfNeedYear9TBox = attributes.hcpcLengthOfNeedYear9TBox>
	
	<cfparam name="attributes.hcpcCode5TBox" default="">
	<cfset hcpcCode5TBox = attributes.hcpcCode5TBox>
	
	<cfparam name="attributes.hcpcQty5TBox" default="">
	<cfset hcpcQty5TBox = attributes.hcpcQty5TBox>
	
	<cfparam name="attributes.hcpcProduct5TBox" default="">
	<cfset hcpcProduct5TBox = attributes.hcpcProduct5TBox>
	
	<cfparam name="attributes.hcpcDX5TBox" default="">
	<cfset hcpcDX5TBox = attributes.hcpcDX5TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear5TBox" default="">
	<cfset hcpcLengthOfNeedYear5TBox = attributes.hcpcLengthOfNeedYear5TBox>
	
	<cfparam name="attributes.hcpcCode10TBox" default="">
	<cfset hcpcCode10TBox = attributes.hcpcCode10TBox>
	
	<cfparam name="attributes.hcpcQty10TBox" default="">
	<cfset hcpcQty10TBox = attributes.hcpcQty10TBox>
	
	<cfparam name="attributes.hcpcProduct10TBox" default="">
	<cfset hcpcProduct10TBox = attributes.hcpcProduct10TBox>
	
	<cfparam name="attributes.hcpcDX10TBox" default="">
	<cfset hcpcDX10TBox = attributes.hcpcDX10TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear10TBox" default="">
	<cfset hcpcLengthOfNeedYear10TBox = attributes.hcpcLengthOfNeedYear10TBox>
																	   
	<cfparam name="attributes.poNumberTBox" default="">
	<cfset poNumberTBox = attributes.poNumberTBox>
	
	<cfparam name="attributes.creditCardTypeTBox" default="">
	<cfset creditCardTypeTBox = attributes.creditCardTypeTBox>
	
	<cfparam name="attributes.creditCardNumberTBox" default="">
	<cfset creditCardNumberTBox = attributes.creditCardNumberTBox>
	
	<cfparam name="attributes.ccDateMM" default="">
	<cfset ccDateMM = attributes.ccDateMM>
	
	<cfparam name="attributes.ccDateDD" default="">
	<cfset ccDateDD = attributes.ccDateDD>
	
	<cfparam name="attributes.ccDateYY" default="">
	<cfset ccDateYY = attributes.ccDateYY>
		
	<cfparam name="attributes.orderingPhysicianPhoneTBox" default="">
	<cfset orderingPhysicianPhoneTBox = attributes.orderingPhysicianPhoneTBox>
															   
	<cfparam name="attributes.orderingPhysicianUPINTBox" default="">
	<cfset orderingPhysicianUPINTBox = attributes.orderingPhysicianUPINTBox>
	
	<cfparam name="attributes.orderingPhysicianFaxTBox" default="">
	<cfset orderingPhysicianFaxTBox = attributes.orderingPhysicianFaxTBox>
															   
	<cfparam name="attributes.orderingPhysicianAddressTBox" default="">
	<cfset orderingPhysicianAddressTBox = attributes.orderingPhysicianAddressTBox>
	
	<cfparam name="attributes.orderingPhysicianCityTBox" default="">
	<cfset orderingPhysicianCityTBox = attributes.orderingPhysicianCityTBox>
	
	<cfparam name="attributes.orderingPhysicianStateTBox" default="">
	<cfset orderingPhysicianStateTBox = attributes.orderingPhysicianStateTBox>
	
	<cfparam name="attributes.orderingPhysicianZipTBox" default="">
	<cfset orderingPhysicianZipTBox = attributes.orderingPhysicianZipTBox>
		
	<cfparam name="attributes.verificationDateMM" default="">
	<cfset verificationDateMM = attributes.verificationDateMM>
	
	<cfparam name="attributes.verificationDateDD" default="">
	<cfset verificationDateDD = attributes.verificationDateDD>
	
	<cfparam name="attributes.verificationDateYY" default="">
	<cfset verificationDateYY = attributes.verificationDateYY>
	
	<cfparam name="attributes.verificationTimeTBox" default="">
	<cfset verificationTimeTBox = attributes.verificationTimeTBox>
	
	<cfparam name="attributes.OPTION_4_CBox_VerificationHaveInsYes" default="0">
	<cfset OPTION_4_CBox_VerificationHaveInsYes = attributes.OPTION_4_CBox_VerificationHaveInsYes>
	
	<cfparam name="attributes.OPTION_4_CBox_VerificationHaveInsNo" default="0">
	<cfset OPTION_4_CBox_VerificationHaveInsNo = attributes.OPTION_4_CBox_VerificationHaveInsNo>
																	   
	<cfparam name="attributes.verificationHaveInsFromMM" default="">
	<cfset verificationHaveInsFromMM = attributes.verificationHaveInsFromMM>
	
	<cfparam name="attributes.verificationHaveInsFromDD" default="">
	<cfset verificationHaveInsFromDD = attributes.verificationHaveInsFromDD>
	
	<cfparam name="attributes.verificationHaveInsFromYY" default="">
	<cfset verificationHaveInsFromYY = attributes.verificationHaveInsFromYY>
	
	<cfparam name="attributes.verificationHaveInsToMM" default="">
	<cfset verificationHaveInsToMM = attributes.verificationHaveInsToMM>
	
	<cfparam name="attributes.verificationHaveInsToDD" default="">
	<cfset verificationHaveInsToDD = attributes.verificationHaveInsToDD>
	
	<cfparam name="attributes.verificationHaveInsToYY" default="">
	<cfset verificationHaveInsToYY = attributes.verificationHaveInsToYY>
		
	<cfparam name="attributes.OPTION_5_CBox_VerificationHaveDMECovYes" default="0">
	<cfset OPTION_5_CBox_VerificationHaveDMECovYes = attributes.OPTION_5_CBox_VerificationHaveDMECovYes>
	
	<cfparam name="attributes.OPTION_5_CBox_VerificationHaveDMECovNo" default="0">
	<cfset OPTION_5_CBox_VerificationHaveDMECovNo = attributes.OPTION_5_CBox_VerificationHaveDMECovNo>
		
	<cfparam name="attributes.OPTION_6_CBox_VerificationDeductibleYes" default="0">
	<cfset OPTION_6_CBox_VerificationDeductibleYes = attributes.OPTION_6_CBox_VerificationDeductibleYes>
	
	<cfparam name="attributes.OPTION_6_CBox_VerificationDeductibleNo" default="0">
	<cfset OPTION_6_CBox_VerificationDeductibleNo = attributes.OPTION_6_CBox_VerificationDeductibleNo>
			
	<cfparam name="attributes.OPTION_7_CBox_VerificationDeductibleMetYes" default="0">
	<cfset OPTION_7_CBox_VerificationDeductibleMetYes = attributes.OPTION_7_CBox_VerificationDeductibleMetYes>
	
	<cfparam name="attributes.OPTION_7_CBox_VerificationDeductibleMetNo" default="0">
	<cfset OPTION_7_CBox_VerificationDeductibleMetNo = attributes.OPTION_7_CBox_VerificationDeductibleMetNo>
																   
	<cfparam name="attributes.verificationDeductibleAmountTBox" default="">
	<cfset verificationDeductibleAmountTBox = attributes.verificationDeductibleAmountTBox>
	
	<cfparam name="attributes.OPTION_8_CBox_VerificationPPOPolicyYes" default="0">
	<cfset OPTION_8_CBox_VerificationPPOPolicyYes = attributes.OPTION_8_CBox_VerificationPPOPolicyYes>
	
	<cfparam name="attributes.OPTION_8_CBox_VerificationPPOPolicyNo" default="0">
	<cfset OPTION_8_CBox_VerificationPPOPolicyNo = attributes.OPTION_8_CBox_VerificationPPOPolicyNo>
															   
	<cfparam name="attributes.verificationPercentagePayAfterDeductibleTBox" default="">
	<cfset verificationPercentagePayAfterDeductibleTBox = attributes.verificationPercentagePayAfterDeductibleTBox>
	
	<cfparam name="attributes.OPTION_9_CBox_VerificationPriorAuthYes" default="0">
	<cfset OPTION_9_CBox_VerificationPriorAuthYes = attributes.OPTION_9_CBox_VerificationPriorAuthYes>
	
	<cfparam name="attributes.OPTION_9_CBox_VerificationPriorAuthNo" default="0">
	<cfset OPTION_9_CBox_VerificationPriorAuthNo = attributes.OPTION_9_CBox_VerificationPriorAuthNo>
																   
	<cfparam name="attributes.verificationAuthNumberTBox" default="">
	<cfset verificationAuthNumberTBox = attributes.verificationAuthNumberTBox>
	
	<cfparam name="attributes.OPTION_10_CBox_VerificationLifetimeBenefitMetYes" default="0">
	<cfset OPTION_10_CBox_VerificationLifetimeBenefitMetYes = attributes.OPTION_10_CBox_VerificationLifetimeBenefitMetYes>
	
	<cfparam name="attributes.OPTION_10_CBox_VerificationLifetimeBenefitMetNo" default="0">
	<cfset OPTION_10_CBox_VerificationLifetimeBenefitMetNo = attributes.OPTION_10_CBox_VerificationLifetimeBenefitMetNo>
															   
	<cfparam name="attributes.verificationAuthPhoneNumberTBox" default="">
	<cfset verificationAuthPhoneNumberTBox = attributes.verificationAuthPhoneNumberTBox>
	
	<cfparam name="attributes.OPTION_11_CBox_VerificationInsFollowMedicareYes" default="0">
	<cfset OPTION_11_CBox_VerificationInsFollowMedicareYes = attributes.OPTION_11_CBox_VerificationInsFollowMedicareYes>
	
	<cfparam name="attributes.OPTION_11_CBox_VerificationInsFollowMedicareNo" default="0">
	<cfset OPTION_11_CBox_VerificationInsFollowMedicareNo = attributes.OPTION_11_CBox_VerificationInsFollowMedicareNo>
						
	<cfparam name="attributes.OPTION_12_CBox_VerificationMedicaidPlanMQMB" default="0">
	<cfset OPTION_12_CBox_VerificationMedicaidPlanMQMB = attributes.OPTION_12_CBox_VerificationMedicaidPlanMQMB>
	
	<cfparam name="attributes.OPTION_12_CBox_VerificationMedicaidPlanQMB" default="0">
	<cfset OPTION_12_CBox_VerificationMedicaidPlanQMB = attributes.OPTION_12_CBox_VerificationMedicaidPlanQMB>
	
	<cfparam name="attributes.OPTION_12_CBox_VerificationMedicaidPlanTraditional" default="0">
	<cfset OPTION_12_CBox_VerificationMedicaidPlanTraditional = attributes.OPTION_12_CBox_VerificationMedicaidPlanTraditional>
		
	<cfparam name="attributes.VerificationTypeBasePlanTBox" default="">
	<cfset VerificationTypeBasePlanTBox = attributes.VerificationTypeBasePlanTBox>
															
	<cfparam name="attributes.OPTION_13_CBox_PastEquipmentYes" default="0">
	<cfset OPTION_13_CBox_PastEquipmentYes = attributes.OPTION_13_CBox_PastEquipmentYes>
	
	<cfparam name="attributes.OPTION_13_CBox_PastEquipmentNo" default="0">
	<cfset OPTION_13_CBox_PastEquipmentNo = attributes.OPTION_13_CBox_PastEquipmentNo>
			   
	<cfparam name="attributes.Equipment1TypeTBox" default="">
	<cfset Equipment1TypeTBox = attributes.Equipment1TypeTBox>
	
	<cfparam name="attributes.Equipment1RentPurchasedSelect" default="">
	<cfset Equipment1RentPurchasedSelect = attributes.Equipment1RentPurchasedSelect>
	
	<cfparam name="attributes.Equipment1FromMM" default="">
	<cfset Equipment1FromMM = attributes.Equipment1FromMM>
	
	<cfparam name="attributes.Equipment1FromDD" default="">
	<cfset Equipment1FromDD = attributes.Equipment1FromDD>
	
	<cfparam name="attributes.Equipment1FromYY" default="">
	<cfset Equipment1FromYY = attributes.Equipment1FromYY>
	
	<cfparam name="attributes.Equipment1ToMM" default="">
	<cfset Equipment1ToMM = attributes.Equipment1ToMM>
	
	<cfparam name="attributes.Equipment1ToDD" default="">
	<cfset Equipment1ToDD = attributes.Equipment1ToDD>
	
	<cfparam name="attributes.Equipment1ToYY" default="">
	<cfset Equipment1ToYY = attributes.Equipment1ToYY>
	
	<cfparam name="attributes.Equipment1SupplierNameTBox" default="">
	<cfset Equipment1SupplierNameTBox = attributes.Equipment1SupplierNameTBox>
	
	<cfparam name="attributes.Equipment1SupplierTelephoneTBox" default="">
	<cfset Equipment1SupplierTelephoneTBox = attributes.Equipment1SupplierTelephoneTBox>
															   
	<cfparam name="attributes.Equipment2TypeTBox" default="">
	<cfset Equipment2TypeTBox = attributes.Equipment2TypeTBox>
	
	<cfparam name="attributes.Equipment2RentPurchasedSelect" default="">
	<cfset Equipment2RentPurchasedSelect = attributes.Equipment2RentPurchasedSelect>
	
	<cfparam name="attributes.Equipment2FromMM" default="">
	<cfset Equipment2FromMM = attributes.Equipment2FromMM>
	
	<cfparam name="attributes.Equipment2FromDD" default="">
	<cfset Equipment2FromDD = attributes.Equipment2FromDD>
	
	<cfparam name="attributes.Equipment2FromYY" default="">
	<cfset Equipment2FromYY = attributes.Equipment2FromYY>
	
	<cfparam name="attributes.Equipment2ToMM" default="">
	<cfset Equipment2ToMM = attributes.Equipment2ToMM>
	
	<cfparam name="attributes.Equipment2ToDD" default="">
	<cfset Equipment2ToDD = attributes.Equipment2ToDD>
	
	<cfparam name="attributes.Equipment2ToYY" default="">
	<cfset Equipment2ToYY = attributes.Equipment2ToYY>
	
	<cfparam name="attributes.Equipment2SupplierNameTBox" default="">
	<cfset Equipment2SupplierNameTBox = attributes.Equipment2SupplierNameTBox>
	
	<cfparam name="attributes.Equipment2SupplierTelephoneTBox" default="">
	<cfset Equipment2SupplierTelephoneTBox = attributes.Equipment2SupplierTelephoneTBox>
															   
	<cfparam name="attributes.Equipment3TypeTBox" default="">
	<cfset Equipment3TypeTBox = attributes.Equipment3TypeTBox>
	
	<cfparam name="attributes.Equipment3RentPurchasedSelect" default="">
	<cfset Equipment3RentPurchasedSelect = attributes.Equipment3RentPurchasedSelect>
	
	<cfparam name="attributes.Equipment3FromMM" default="">
	<cfset Equipment3FromMM = attributes.Equipment3FromMM>
	
	<cfparam name="attributes.Equipment3FromDD" default="">
	<cfset Equipment3FromDD = attributes.Equipment3FromDD>
	
	<cfparam name="attributes.Equipment3FromYY" default="">
	<cfset Equipment3FromYY = attributes.Equipment3FromYY>
	
	<cfparam name="attributes.Equipment3ToMM" default="">
	<cfset Equipment3ToMM = attributes.Equipment3ToMM>
	
	<cfparam name="attributes.Equipment3ToDD" default="">
	<cfset Equipment3ToDD = attributes.Equipment3ToDD>
	
	<cfparam name="attributes.Equipment3ToYY" default="">
	<cfset Equipment3ToYY = attributes.Equipment3ToYY>
	
	<cfparam name="attributes.Equipment3SupplierNameTBox" default="">
	<cfset Equipment3SupplierNameTBox = attributes.Equipment3SupplierNameTBox>
	
	<cfparam name="attributes.Equipment3SupplierTelephoneTBox" default="">
	<cfset Equipment3SupplierTelephoneTBox = attributes.Equipment3SupplierTelephoneTBox>
															   
	<cfparam name="attributes.Equipment4TypeTBox" default="">
	<cfset Equipment4TypeTBox = attributes.Equipment4TypeTBox>
	
	<cfparam name="attributes.Equipment4RentPurchasedSelect" default="">
	<cfset Equipment4RentPurchasedSelect = attributes.Equipment4RentPurchasedSelect>
	
	<cfparam name="attributes.Equipment4FromMM" default="">
	<cfset Equipment4FromMM = attributes.Equipment4FromMM>
	
	<cfparam name="attributes.Equipment4FromDD" default="">
	<cfset Equipment4FromDD = attributes.Equipment4FromDD>
	
	<cfparam name="attributes.Equipment4FromYY" default="">
	<cfset Equipment4FromYY = attributes.Equipment4FromYY>
	
	<cfparam name="attributes.Equipment4ToMM" default="">
	<cfset Equipment4ToMM = attributes.Equipment4ToMM>
	
	<cfparam name="attributes.Equipment4ToDD" default="">
	<cfset Equipment4ToDD = attributes.Equipment4ToDD>
	
	<cfparam name="attributes.Equipment4ToYY" default="">
	<cfset Equipment4ToYY = attributes.Equipment4ToYY>
	
	<cfparam name="attributes.Equipment4SupplierNameTBox" default="">
	<cfset Equipment4SupplierNameTBox = attributes.Equipment4SupplierNameTBox>
	
	<cfparam name="attributes.Equipment4SupplierTelephoneTBox" default="">
	<cfset Equipment4SupplierTelephoneTBox = attributes.Equipment4SupplierTelephoneTBox>
														   
	<cfparam name="attributes.Equipment5TypeTBox" default="">
	<cfset Equipment5TypeTBox = attributes.Equipment5TypeTBox>
	
	<cfparam name="attributes.Equipment5RentPurchasedSelect" default="">
	<cfset Equipment5RentPurchasedSelect = attributes.Equipment5RentPurchasedSelect>
	
	<cfparam name="attributes.Equipment5FromMM" default="">
	<cfset Equipment5FromMM = attributes.Equipment5FromMM>
	
	<cfparam name="attributes.Equipment5FromDD" default="">
	<cfset Equipment5FromDD = attributes.Equipment5FromDD>
	
	<cfparam name="attributes.Equipment5FromYY" default="">
	<cfset Equipment5FromYY = attributes.Equipment5FromYY>
	
	<cfparam name="attributes.Equipment5ToMM" default="">
	<cfset Equipment5ToMM = attributes.Equipment5ToMM>
	
	<cfparam name="attributes.Equipment5ToDD" default="">
	<cfset Equipment5ToDD = attributes.Equipment5ToDD>
	
	<cfparam name="attributes.Equipment5ToYY" default="">
	<cfset Equipment5ToYY = attributes.Equipment5ToYY>
	
	<cfparam name="attributes.Equipment5SupplierNameTBox" default="">
	<cfset Equipment5SupplierNameTBox = attributes.Equipment5SupplierNameTBox>
	
	<cfparam name="attributes.Equipment5SupplierTelephoneTBox" default="">
	<cfset Equipment5SupplierTelephoneTBox = attributes.Equipment5SupplierTelephoneTBox>
	
	<cfparam name="attributes.OPTION_14_CBox_OxygenPAo2" default="0">
	<cfset OPTION_14_CBox_OxygenPAo2 = attributes.OPTION_14_CBox_OxygenPAo2>
	
	<cfparam name="attributes.OPTION_14_CBox_OxygenSAo2" default="0">
	<cfset OPTION_14_CBox_OxygenSAo2 = attributes.OPTION_14_CBox_OxygenSAo2>
			
	<cfparam name="attributes.OPTION_14_CBox_OxygenSPo2" default="0">
	<cfset OPTION_14_CBox_OxygenSPo2 = attributes.OPTION_14_CBox_OxygenSPo2>
			
	<cfparam name="attributes.OPTION_15_CBox_CPAPStudy" default="0">
	<cfset OPTION_15_CBox_CPAPStudy = attributes.OPTION_15_CBox_CPAPStudy>
																	   
	<cfparam name="attributes.OxygenPAO2TBox" default="">
	<cfset OxygenPAO2TBox = attributes.OxygenPAO2TBox>
	
	<cfparam name="attributes.OxygenSAO2TBox" default="">
	<cfset OxygenSAO2TBox = attributes.OxygenSAO2TBox>
	
	<cfparam name="attributes.CPAPStudy_CBox" default="0">
	<cfset CPAPStudy_CBox = attributes.CPAPStudy_CBox>
	
	<cfparam name="attributes.CPAPStudyNote" default="">
	<cfset CPAPStudyNote = attributes.CPAPStudyNote>
															   
	<cfparam name="attributes.OxygenSPO2TBox" default="">
	<cfset OxygenSPO2TBox = attributes.OxygenSPO2TBox>
	
	<cfparam name="attributes.CPAPStudyOnFile_CBox" default="0">
	<cfset CPAPStudyOnFile_CBox = attributes.CPAPStudyOnFile_CBox>
	
	<cfparam name="attributes.CPAPStudyOnFileNote" default="">
	<cfset CPAPStudyOnFileNote = attributes.CPAPStudyOnFileNote>
															   
	<cfparam name="attributes.LabTestDateMM" default="">
	<cfset LabTestDateMM = attributes.LabTestDateMM>
	
	<cfparam name="attributes.LabTestDateDD" default="">
	<cfset LabTestDateDD = attributes.LabTestDateDD>
	
	<cfparam name="attributes.LabTestDateYY" default="">
	<cfset LabTestDateYY = attributes.LabTestDateYY>
	
	<cfparam name="attributes.CPAPStudyPerformedAt" default="">
	<cfset CPAPStudyPerformedAt = attributes.CPAPStudyPerformedAt>
													   
	<cfparam name="attributes.LabTestFacilityTBox" default="">
	<cfset LabTestFacilityTBox = attributes.LabTestFacilityTBox>
	
	<cfparam name="attributes.CPAPStudyPerformedAt2" default="">
	<cfset CPAPStudyPerformedAt2 = attributes.CPAPStudyPerformedAt2>
	
	<cfparam name="attributes.CPAPStudyPerformedAt3" default="">
	<cfset CPAPStudyPerformedAt3 = attributes.CPAPStudyPerformedAt3>
	
	<cfparam name="attributes.hcpcDiagnosis1TBox" default="">
	<cfset hcpcDiagnosis1TBox = attributes.hcpcDiagnosis1TBox>
		
	<cfparam name="attributes.hcpcDiagnosis2TBox" default="">
	<cfset hcpcDiagnosis2TBox = attributes.hcpcDiagnosis2TBox>
	
	<cfparam name="attributes.hcpcDiagnosis3TBox" default="">
	<cfset hcpcDiagnosis3TBox = attributes.hcpcDiagnosis3TBox>
		
	<cfparam name="attributes.hcpcDiagnosis4TBox" default="">
	<cfset hcpcDiagnosis4TBox = attributes.hcpcDiagnosis4TBox>
		
	<cfparam name="attributes.hcpcDiagnosis5TBox" default="">
	<cfset hcpcDiagnosis5TBox = attributes.hcpcDiagnosis5TBox>
		
	<cfparam name="attributes.hcpcDiagnosis6TBox" default="">
	<cfset hcpcDiagnosis6TBox = attributes.hcpcDiagnosis6TBox>
		
	<cfparam name="attributes.hcpcDiagnosis7TBox" default="">
	<cfset hcpcDiagnosis7TBox = attributes.hcpcDiagnosis7TBox>
		
	<cfparam name="attributes.hcpcDiagnosis8TBox" default="">
	<cfset hcpcDiagnosis8TBox = attributes.hcpcDiagnosis8TBox>
		
	<cfparam name="attributes.hcpcDiagnosis9TBox" default="">
	<cfset hcpcDiagnosis9TBox = attributes.hcpcDiagnosis9TBox>
		
	<cfparam name="attributes.hcpcDiagnosis10TBox" default="">
	<cfset hcpcDiagnosis10TBox = attributes.hcpcDiagnosis10TBox>	
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth1TBox" default="">
	<cfset hcpcLengthOfNeedMonth1TBox = attributes.hcpcLengthOfNeedMonth1TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth2TBox" default="">
	<cfset hcpcLengthOfNeedMonth2TBox = attributes.hcpcLengthOfNeedMonth2TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth3TBox" default="">
	<cfset hcpcLengthOfNeedMonth3TBox = attributes.hcpcLengthOfNeedMonth3TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth4TBox" default="">
	<cfset hcpcLengthOfNeedMonth4TBox = attributes.hcpcLengthOfNeedMonth4TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth5TBox" default="">
	<cfset hcpcLengthOfNeedMonth5TBox = attributes.hcpcLengthOfNeedMonth5TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth6TBox" default="">
	<cfset hcpcLengthOfNeedMonth6TBox = attributes.hcpcLengthOfNeedMonth6TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth7TBox" default="">
	<cfset hcpcLengthOfNeedMonth7TBox = attributes.hcpcLengthOfNeedMonth7TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth8TBox" default="">
	<cfset hcpcLengthOfNeedMonth8TBox = attributes.hcpcLengthOfNeedMonth8TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth9TBox" default="">
	<cfset hcpcLengthOfNeedMonth9TBox = attributes.hcpcLengthOfNeedMonth9TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth10TBox" default="">
	<cfset hcpcLengthOfNeedMonth10TBox = attributes.hcpcLengthOfNeedMonth10TBox>
	
	<cfparam name="attributes.OPTION_3a_CBox_PatientSexMale" default="0">
	<cfset OPTION_3a_CBox_PatientSexMale = attributes.OPTION_3a_CBox_PatientSexMale>
	
	<cfparam name="attributes.OPTION_3a_CBox_PatientSexFemale" default="0">
	<cfset OPTION_3a_CBox_PatientSexFemale = attributes.OPTION_3a_CBox_PatientSexFemale>
		
	<cfparam name="attributes.callerFNameTBox" default="">
	<cfset callerFNameTBox = attributes.callerFNameTBox>
	
	<cfparam name="attributes.callerMInitialTBox" default="">
	<cfset callerMInitialTBox = attributes.callerMInitialTBox>
	
	<cfparam name="attributes.callerLNameTBox" default="">
	<cfset callerLNameTBox = attributes.callerLNameTBox>
	
	<cfparam name="attributes.patientFNameTBox" default="">
	<cfset patientFNameTBox = attributes.patientFNameTBox>
	
	<cfparam name="attributes.patientMInitialTBox" default="">
	<cfset patientMInitialTBox = attributes.patientMInitialTBox>
	
	<cfparam name="attributes.patientLNameTBox" default="">
	<cfset patientLNameTBox = attributes.patientLNameTBox>

	<cfparam name="attributes.alternateContactFNameTBox" default="">
	<cfset alternateContactFNameTBox = attributes.alternateContactFNameTBox>
	
	<cfparam name="attributes.alternateContactMInitialTBox" default="">
	<cfset alternateContactMInitialTBox = attributes.alternateContactMInitialTBox>
	
	<cfparam name="attributes.alternateContactLNameTBox" default="">
	<cfset alternateContactLNameTBox = attributes.alternateContactLNameTBox>
	
	<cfparam name="attributes.alternateContactWorkPhoneTBox" default="">
	<cfset alternateContactWorkPhoneTBox = attributes.alternateContactWorkPhoneTBox>

	<cfparam name="attributes.orderingPhysicianFNameTBox" default="">
	<cfset orderingPhysicianFNameTBox = attributes.orderingPhysicianFNameTBox>
	
	<cfparam name="attributes.orderingPhysicianMInitialTBox" default="">
	<cfset orderingPhysicianMInitialTBox = attributes.orderingPhysicianMInitialTBox>
	
	<cfparam name="attributes.orderingPhysicianLNameTBox" default="">
	<cfset orderingPhysicianLNameTBox = attributes.orderingPhysicianLNameTBox>

	<cfparam name="attributes.verificationRepFNameTBox" default="">
	<cfset verificationRepFNameTBox = attributes.verificationRepFNameTBox>
	
	<cfparam name="attributes.verificationRepLNameTBox" default="">
	<cfset verificationRepLNameTBox = attributes.verificationRepLNameTBox>
	
	<cfparam name="attributes.typeOfPay_Radio" default="">
	<cfset typeOfPay_Radio = attributes.typeOfPay_Radio>
	
	<cfparam name="attributes.primaryInsuranceNameTBox" default="">
	<cfset primaryInsuranceNameTBox = attributes.primaryInsuranceNameTBox>
		
	<cfparam name="attributes.primaryPolicyNumberTBox" default="">
	<cfset primaryPolicyNumberTBox = attributes.primaryPolicyNumberTBox>
	
	<cfparam name="attributes.primaryGroupNumberTBox" default="">
	<cfset primaryGroupNumberTBox = attributes.primaryGroupNumberTBox>
	
	<cfparam name="attributes.primaryPhoneNumberTBox" default="">
	<cfset primaryPhoneNumberTBox = attributes.primaryPhoneNumberTBox>
	
	<cfparam name="attributes.primaryEffectiveDateMM" default="">
	<cfset primaryEffectiveDateMM = attributes.primaryEffectiveDateMM>
	
	<cfparam name="attributes.primaryEffectiveDateDD" default="">
	<cfset primaryEffectiveDateDD = attributes.primaryEffectiveDateDD>
	
	<cfparam name="attributes.primaryEffectiveDateYY" default="">
	<cfset primaryEffectiveDateYY = attributes.primaryEffectiveDateYY>
	
	<cfparam name="attributes.primaryPolicyHolderFNameTBox" default="">
	<cfset primaryPolicyHolderFNameTBox = attributes.primaryPolicyHolderFNameTBox>
	
	<cfparam name="attributes.primaryPolicyHolderMInitialTBox" default="">
	<cfset primaryPolicyHolderMInitialTBox = attributes.primaryPolicyHolderMInitialTBox>
	
	<cfparam name="attributes.primaryPolicyHolderLNameTBox" default="">
	<cfset primaryPolicyHolderLNameTBox = attributes.primaryPolicyHolderLNameTBox>
	
	<cfparam name="attributes.primaryHoldersDOBMM" default="">
	<cfset primaryHoldersDOBMM = attributes.primaryHoldersDOBMM>
	
	<cfparam name="attributes.primaryHoldersDOBDD" default="">
	<cfset primaryHoldersDOBDD = attributes.primaryHoldersDOBDD>
	
	<cfparam name="attributes.primaryHoldersDOBYY" default="">
	<cfset primaryHoldersDOBYY = attributes.primaryHoldersDOBYY>
	
	<cfparam name="attributes.primaryPolicyHolderEmployerTBox" default="">
	<cfset primaryPolicyHolderEmployerTBox = attributes.primaryPolicyHolderEmployerTBox>
	
	<cfparam name="attributes.primaryNoteTBox" default="">
	<cfset primaryNoteTBox = attributes.primaryNoteTBox>
	
	<cfparam name="attributes.primaryVerificationRepFNameTBox" default="">
	<cfset primaryVerificationRepFNameTBox = attributes.primaryVerificationRepFNameTBox>
	
	<cfparam name="attributes.primaryVerificationRepLNameTBox" default="">
	<cfset primaryVerificationRepLNameTBox = attributes.primaryVerificationRepLNameTBox>
	
	<cfparam name="attributes.primaryVerificationDateMM" default="">
	<cfset primaryVerificationDateMM = attributes.primaryVerificationDateMM>
	
	<cfparam name="attributes.primaryVerificationDateDD" default="">
	<cfset primaryVerificationDateDD = attributes.primaryVerificationDateDD>
	
	<cfparam name="attributes.primaryVerificationDateYY" default="">
	<cfset primaryVerificationDateYY = attributes.primaryVerificationDateYY>
	
	<cfparam name="attributes.primaryVerificationTimeTBox" default="">
	<cfset primaryVerificationTimeTBox = attributes.primaryVerificationTimeTBox>										
	
	<cfparam name="attributes.primaryVerificationHaveInsFromMM" default="">
	<cfset primaryVerificationHaveInsFromMM = attributes.primaryVerificationHaveInsFromMM>
	
	<cfparam name="attributes.primaryVerificationHaveInsFromDD" default="">
	<cfset primaryVerificationHaveInsFromDD = attributes.primaryVerificationHaveInsFromDD>
	
	<cfparam name="attributes.primaryVerificationHaveInsFromYY" default="">
	<cfset primaryVerificationHaveInsFromYY = attributes.primaryVerificationHaveInsFromYY>
	
	<cfparam name="attributes.primaryVerificationHaveInsToMM" default="">
	<cfset primaryVerificationHaveInsToMM = attributes.primaryVerificationHaveInsToMM>
	
	<cfparam name="attributes.primaryVerificationHaveInsToDD" default="">
	<cfset primaryVerificationHaveInsToDD = attributes.primaryVerificationHaveInsToDD>
	
	<cfparam name="attributes.primaryVerificationHaveInsToYY" default="">
	<cfset primaryVerificationHaveInsToYY = attributes.primaryVerificationHaveInsToYY>
	
	<cfparam name="attributes.primaryCBox_VerificationHaveInsYes" default="0">
	<cfset primaryCBox_VerificationHaveInsYes = attributes.primaryCBox_VerificationHaveInsYes>
	
	<cfparam name="attributes.primaryCBox_VerificationHaveInsNo" default="0">
	<cfset primaryCBox_VerificationHaveInsNo = attributes.primaryCBox_VerificationHaveInsNo>
	
	<cfparam name="attributes.primaryCBox_VerificationHaveDMECovYes" default="0">
	<cfset primaryCBox_VerificationHaveDMECovYes = attributes.primaryCBox_VerificationHaveDMECovYes>
	
	<cfparam name="attributes.primaryCBox_VerificationHaveDMECovNo" default="0">
	<cfset primaryCBox_VerificationHaveDMECovNo = attributes.primaryCBox_VerificationHaveDMECovNo>
	
	<cfparam name="attributes.primaryCBox_VerificationDeductibleYes" default="0">
	<cfset primaryCBox_VerificationDeductibleYes = attributes.primaryCBox_VerificationDeductibleYes>
	
	<cfparam name="attributes.primaryCBox_VerificationDeductibleNo" default="0">
	<cfset primaryCBox_VerificationDeductibleNo = attributes.primaryCBox_VerificationDeductibleNo>
	
	<cfparam name="attributes.primaryVerificationDeductibleAmountTBox" default="">
	<cfset primaryVerificationDeductibleAmountTBox = attributes.primaryVerificationDeductibleAmountTBox>
	
	<cfparam name="attributes.primaryVerificationDeductibleAmountMetTBox" default="">
	<cfset primaryVerificationDeductibleAmountMetTBox = attributes.primaryVerificationDeductibleAmountMetTBox>
	
	<cfparam name="attributes.primaryVerificationPercentagePayAfterDeductibleTBox" default="">
	<cfset primaryVerificationPercentagePayAfterDeductibleTBox = attributes.primaryVerificationPercentagePayAfterDeductibleTBox>									
	
	<cfparam name="attributes.primaryCBox_VerificationPPOPolicyYes" default="0">
	<cfset primaryCBox_VerificationPPOPolicyYes = attributes.primaryCBox_VerificationPPOPolicyYes>
	
	<cfparam name="attributes.primaryCBox_VerificationPPOPolicyNo" default="0">
	<cfset primaryCBox_VerificationPPOPolicyNo = attributes.primaryCBox_VerificationPPOPolicyNo>										
	
	<cfparam name="attributes.primaryVerificationAuthNumberTBox" default="">
	<cfset primaryVerificationAuthNumberTBox = attributes.primaryVerificationAuthNumberTBox>							
	
	<cfparam name="attributes.primaryCBox_VerificationPriorAuthYes" default="0">
	<cfset primaryCBox_VerificationPriorAuthYes = attributes.primaryCBox_VerificationPriorAuthYes>
	
	<cfparam name="attributes.primaryCBox_VerificationPriorAuthNo" default="0">
	<cfset primaryCBox_VerificationPriorAuthNo = attributes.primaryCBox_VerificationPriorAuthNo>										
	
	<cfparam name="attributes.primaryVerificationAuthPhoneNumberTBox" default="">
	<cfset primaryVerificationAuthPhoneNumberTBox = attributes.primaryVerificationAuthPhoneNumberTBox>			
	
	<cfparam name="attributes.primaryCBox_VerificationLifetimeBenefitMetYes" default="0">
	<cfset primaryCBox_VerificationLifetimeBenefitMetYes = attributes.primaryCBox_VerificationLifetimeBenefitMetYes>
	
	<cfparam name="attributes.primaryCBox_VerificationLifetimeBenefitMetNo" default="0">
	<cfset primaryCBox_VerificationLifetimeBenefitMetNo = attributes.primaryCBox_VerificationLifetimeBenefitMetNo>												
	
	<cfparam name="attributes.primaryCBox_MedicareSupplementYes" default="0">
	<cfset primaryCBox_MedicareSupplementYes = attributes.primaryCBox_MedicareSupplementYes>
	
	<cfparam name="attributes.primaryCBox_MedicareSupplementNo" default="0">
	<cfset primaryCBox_MedicareSupplementNo = attributes.primaryCBox_MedicareSupplementNo>				
	
	<cfparam name="attributes.primaryCBox_CoordinateBenefitsYes" default="0">
	<cfset primaryCBox_CoordinateBenefitsYes = attributes.primaryCBox_CoordinateBenefitsYes>
	
	<cfparam name="attributes.primaryCBox_CoordinateBenefitsNo" default="0">
	<cfset primaryCBox_CoordinateBenefitsNo = attributes.primaryCBox_CoordinateBenefitsNo>			
	
	<cfparam name="attributes.primaryCBox_PaidMedicareDeductibleYes" default="0">
	<cfset primaryCBox_PaidMedicareDeductibleYes = attributes.primaryCBox_PaidMedicareDeductibleYes>
	
	<cfparam name="attributes.primaryCBox_PaidMedicareDeductibleNo" default="0">
	<cfset primaryCBox_PaidMedicareDeductibleNo = attributes.primaryCBox_PaidMedicareDeductibleNo>											
	
	<cfparam name="attributes.primaryVerificationTypeBasePlanTBox" default="">
	<cfset primaryVerificationTypeBasePlanTBox = attributes.primaryVerificationTypeBasePlanTBox>			
	
	<cfparam name="attributes.primaryCBox_VerificationMedicaidPlanMQMB" default="0">
	<cfset primaryCBox_VerificationMedicaidPlanMQMB = attributes.primaryCBox_VerificationMedicaidPlanMQMB>
	
	<cfparam name="attributes.primaryCBox_VerificationMedicaidPlanQMB" default="0">
	<cfset primaryCBox_VerificationMedicaidPlanQMB = attributes.primaryCBox_VerificationMedicaidPlanQMB>
	
	<cfparam name="attributes.primaryCBox_VerificationMedicaidPlanTraditional" default="0">
	<cfset primaryCBox_VerificationMedicaidPlanTraditional = attributes.primaryCBox_VerificationMedicaidPlanTraditional>
	
	<cfparam name="attributes.secondaryInsuranceNameTBox" default="">
	<cfset secondaryInsuranceNameTBox = attributes.secondaryInsuranceNameTBox>
		
	<cfparam name="attributes.secondaryPolicyNumberTBox" default="">
	<cfset secondaryPolicyNumberTBox = attributes.secondaryPolicyNumberTBox>
	
	<cfparam name="attributes.secondaryGroupNumberTBox" default="">
	<cfset secondaryGroupNumberTBox = attributes.secondaryGroupNumberTBox>
	
	<cfparam name="attributes.secondaryPhoneNumberTBox" default="">
	<cfset secondaryPhoneNumberTBox = attributes.secondaryPhoneNumberTBox>
	
	<cfparam name="attributes.secondaryEffectiveDateMM" default="">
	<cfset secondaryEffectiveDateMM = attributes.secondaryEffectiveDateMM>
	
	<cfparam name="attributes.secondaryEffectiveDateDD" default="">
	<cfset secondaryEffectiveDateDD = attributes.secondaryEffectiveDateDD>
	
	<cfparam name="attributes.secondaryEffectiveDateYY" default="">
	<cfset secondaryEffectiveDateYY = attributes.secondaryEffectiveDateYY>
	
	<cfparam name="attributes.secondaryPolicyHolderFNameTBox" default="">
	<cfset secondaryPolicyHolderFNameTBox = attributes.secondaryPolicyHolderFNameTBox>
	
	<cfparam name="attributes.secondaryPolicyHolderMInitialTBox" default="">
	<cfset secondaryPolicyHolderMInitialTBox = attributes.secondaryPolicyHolderMInitialTBox>
	
	<cfparam name="attributes.secondaryPolicyHolderLNameTBox" default="">
	<cfset secondaryPolicyHolderLNameTBox = attributes.secondaryPolicyHolderLNameTBox>
	
	<cfparam name="attributes.secondaryHoldersDOBMM" default="">
	<cfset secondaryHoldersDOBMM = attributes.secondaryHoldersDOBMM>
	
	<cfparam name="attributes.secondaryHoldersDOBDD" default="">
	<cfset secondaryHoldersDOBDD = attributes.secondaryHoldersDOBDD>
	
	<cfparam name="attributes.secondaryHoldersDOBYY" default="">
	<cfset secondaryHoldersDOBYY = attributes.secondaryHoldersDOBYY>
	
	<cfparam name="attributes.secondaryPolicyHolderEmployerTBox" default="">
	<cfset secondaryPolicyHolderEmployerTBox = attributes.secondaryPolicyHolderEmployerTBox>
	
	<cfparam name="attributes.secondaryNoteTBox" default="">
	<cfset secondaryNoteTBox = attributes.secondaryNoteTBox>
	
	<cfparam name="attributes.secondaryVerificationRepFNameTBox" default="">
	<cfset secondaryVerificationRepFNameTBox = attributes.secondaryVerificationRepFNameTBox>
	
	<cfparam name="attributes.secondaryVerificationRepLNameTBox" default="">
	<cfset secondaryVerificationRepLNameTBox = attributes.secondaryVerificationRepLNameTBox>
	
	<cfparam name="attributes.secondaryVerificationDateMM" default="">
	<cfset secondaryVerificationDateMM = attributes.secondaryVerificationDateMM>
	
	<cfparam name="attributes.secondaryVerificationDateDD" default="">
	<cfset secondaryVerificationDateDD = attributes.secondaryVerificationDateDD>
	
	<cfparam name="attributes.secondaryVerificationDateYY" default="">
	<cfset secondaryVerificationDateYY = attributes.secondaryVerificationDateYY>
	
	<cfparam name="attributes.secondaryVerificationTimeTBox" default="">
	<cfset secondaryVerificationTimeTBox = attributes.secondaryVerificationTimeTBox>										
	
	<cfparam name="attributes.secondaryVerificationHaveInsFromMM" default="">
	<cfset secondaryVerificationHaveInsFromMM = attributes.secondaryVerificationHaveInsFromMM>
	
	<cfparam name="attributes.secondaryVerificationHaveInsFromDD" default="">
	<cfset secondaryVerificationHaveInsFromDD = attributes.secondaryVerificationHaveInsFromDD>
	
	<cfparam name="attributes.secondaryVerificationHaveInsFromYY" default="">
	<cfset secondaryVerificationHaveInsFromYY = attributes.secondaryVerificationHaveInsFromYY>
	
	<cfparam name="attributes.secondaryVerificationHaveInsToMM" default="">
	<cfset secondaryVerificationHaveInsToMM = attributes.secondaryVerificationHaveInsToMM>
	
	<cfparam name="attributes.secondaryVerificationHaveInsToDD" default="">
	<cfset secondaryVerificationHaveInsToDD = attributes.secondaryVerificationHaveInsToDD>
	
	<cfparam name="attributes.secondaryVerificationHaveInsToYY" default="">
	<cfset secondaryVerificationHaveInsToYY = attributes.secondaryVerificationHaveInsToYY>
	
	<cfparam name="attributes.secondaryCBox_VerificationHaveInsYes" default="0">
	<cfset secondaryCBox_VerificationHaveInsYes = attributes.secondaryCBox_VerificationHaveInsYes>
	
	<cfparam name="attributes.secondaryCBox_VerificationHaveInsNo" default="0">
	<cfset secondaryCBox_VerificationHaveInsNo = attributes.secondaryCBox_VerificationHaveInsNo>
	
	<cfparam name="attributes.secondaryCBox_VerificationHaveDMECovYes" default="0">
	<cfset secondaryCBox_VerificationHaveDMECovYes = attributes.secondaryCBox_VerificationHaveDMECovYes>
	
	<cfparam name="attributes.secondaryCBox_VerificationHaveDMECovNo" default="0">
	<cfset secondaryCBox_VerificationHaveDMECovNo = attributes.secondaryCBox_VerificationHaveDMECovNo>
	
	<cfparam name="attributes.secondaryCBox_VerificationDeductibleYes" default="0">
	<cfset secondaryCBox_VerificationDeductibleYes = attributes.secondaryCBox_VerificationDeductibleYes>
	
	<cfparam name="attributes.secondaryCBox_VerificationDeductibleNo" default="0">
	<cfset secondaryCBox_VerificationDeductibleNo = attributes.secondaryCBox_VerificationDeductibleNo>
	
	<cfparam name="attributes.secondaryVerificationDeductibleAmountTBox" default="">
	<cfset secondaryVerificationDeductibleAmountTBox = attributes.secondaryVerificationDeductibleAmountTBox>
	
	<cfparam name="attributes.secondaryVerificationDeductibleAmountMetTBox" default="">
	<cfset secondaryVerificationDeductibleAmountMetTBox = attributes.secondaryVerificationDeductibleAmountMetTBox>
	
	<cfparam name="attributes.secondaryVerificationPercentagePayAfterDeductibleTBox" default="">
	<cfset secondaryVerificationPercentagePayAfterDeductibleTBox = attributes.secondaryVerificationPercentagePayAfterDeductibleTBox>									
	
	<cfparam name="attributes.secondaryCBox_VerificationPPOPolicyYes" default="0">
	<cfset secondaryCBox_VerificationPPOPolicyYes = attributes.secondaryCBox_VerificationPPOPolicyYes>
	
	<cfparam name="attributes.secondaryCBox_VerificationPPOPolicyNo" default="0">
	<cfset secondaryCBox_VerificationPPOPolicyNo = attributes.secondaryCBox_VerificationPPOPolicyNo>										
	
	<cfparam name="attributes.secondaryVerificationAuthNumberTBox" default="">
	<cfset secondaryVerificationAuthNumberTBox = attributes.secondaryVerificationAuthNumberTBox>							
	
	<cfparam name="attributes.secondaryCBox_VerificationPriorAuthYes" default="0">
	<cfset secondaryCBox_VerificationPriorAuthYes = attributes.secondaryCBox_VerificationPriorAuthYes>
	
	<cfparam name="attributes.secondaryCBox_VerificationPriorAuthNo" default="0">
	<cfset secondaryCBox_VerificationPriorAuthNo = attributes.secondaryCBox_VerificationPriorAuthNo>										
	
	<cfparam name="attributes.secondaryVerificationAuthPhoneNumberTBox" default="">
	<cfset secondaryVerificationAuthPhoneNumberTBox = attributes.secondaryVerificationAuthPhoneNumberTBox>			
	
	<cfparam name="attributes.secondaryCBox_VerificationLifetimeBenefitMetYes" default="0">
	<cfset secondaryCBox_VerificationLifetimeBenefitMetYes = attributes.secondaryCBox_VerificationLifetimeBenefitMetYes>
	
	<cfparam name="attributes.secondaryCBox_VerificationLifetimeBenefitMetNo" default="0">
	<cfset secondaryCBox_VerificationLifetimeBenefitMetNo = attributes.secondaryCBox_VerificationLifetimeBenefitMetNo>												
	
	<cfparam name="attributes.secondaryCBox_MedicareSupplementYes" default="0">
	<cfset secondaryCBox_MedicareSupplementYes = attributes.secondaryCBox_MedicareSupplementYes>
	
	<cfparam name="attributes.secondaryCBox_MedicareSupplementNo" default="0">
	<cfset secondaryCBox_MedicareSupplementNo = attributes.secondaryCBox_MedicareSupplementNo>				
	
	<cfparam name="attributes.secondaryCBox_CoordinateBenefitsYes" default="0">
	<cfset secondaryCBox_CoordinateBenefitsYes = attributes.secondaryCBox_CoordinateBenefitsYes>
	
	<cfparam name="attributes.secondaryCBox_CoordinateBenefitsNo" default="0">
	<cfset secondaryCBox_CoordinateBenefitsNo = attributes.secondaryCBox_CoordinateBenefitsNo>			
	
	<cfparam name="attributes.secondaryCBox_PaidMedicareDeductibleYes" default="0">
	<cfset secondaryCBox_PaidMedicareDeductibleYes = attributes.secondaryCBox_PaidMedicareDeductibleYes>
	
	<cfparam name="attributes.secondaryCBox_PaidMedicareDeductibleNo" default="0">
	<cfset secondaryCBox_PaidMedicareDeductibleNo = attributes.secondaryCBox_PaidMedicareDeductibleNo>											
	
	<cfparam name="attributes.secondaryVerificationTypeBasePlanTBox" default="">
	<cfset secondaryVerificationTypeBasePlanTBox = attributes.secondaryVerificationTypeBasePlanTBox>			
	
	<cfparam name="attributes.secondaryCBox_VerificationMedicaidPlanMQMB" default="0">
	<cfset secondaryCBox_VerificationMedicaidPlanMQMB = attributes.secondaryCBox_VerificationMedicaidPlanMQMB>
	
	<cfparam name="attributes.secondaryCBox_VerificationMedicaidPlanQMB" default="0">
	<cfset secondaryCBox_VerificationMedicaidPlanQMB = attributes.secondaryCBox_VerificationMedicaidPlanQMB>
	
	<cfparam name="attributes.secondaryCBox_VerificationMedicaidPlanTraditional" default="0">
	<cfset secondaryCBox_VerificationMedicaidPlanTraditional = attributes.secondaryCBox_VerificationMedicaidPlanTraditional>
	
	<cfparam name="attributes.tertiaryInsuranceNameTBox" default="">
	<cfset tertiaryInsuranceNameTBox = attributes.tertiaryInsuranceNameTBox>
		
	<cfparam name="attributes.tertiaryPolicyNumberTBox" default="">
	<cfset tertiaryPolicyNumberTBox = attributes.tertiaryPolicyNumberTBox>
	
	<cfparam name="attributes.tertiaryGroupNumberTBox" default="">
	<cfset tertiaryGroupNumberTBox = attributes.tertiaryGroupNumberTBox>
	
	<cfparam name="attributes.tertiaryPhoneNumberTBox" default="">
	<cfset tertiaryPhoneNumberTBox = attributes.tertiaryPhoneNumberTBox>
	
	<cfparam name="attributes.tertiaryEffectiveDateMM" default="">
	<cfset tertiaryEffectiveDateMM = attributes.tertiaryEffectiveDateMM>
	
	<cfparam name="attributes.tertiaryEffectiveDateDD" default="">
	<cfset tertiaryEffectiveDateDD = attributes.tertiaryEffectiveDateDD>
	
	<cfparam name="attributes.tertiaryEffectiveDateYY" default="">
	<cfset tertiaryEffectiveDateYY = attributes.tertiaryEffectiveDateYY>
	
	<cfparam name="attributes.tertiaryPolicyHolderFNameTBox" default="">
	<cfset tertiaryPolicyHolderFNameTBox = attributes.tertiaryPolicyHolderFNameTBox>
	
	<cfparam name="attributes.tertiaryPolicyHolderMInitialTBox" default="">
	<cfset tertiaryPolicyHolderMInitialTBox = attributes.tertiaryPolicyHolderMInitialTBox>
	
	<cfparam name="attributes.tertiaryPolicyHolderLNameTBox" default="">
	<cfset tertiaryPolicyHolderLNameTBox = attributes.tertiaryPolicyHolderLNameTBox>
	
	<cfparam name="attributes.tertiaryHoldersDOBMM" default="">
	<cfset tertiaryHoldersDOBMM = attributes.tertiaryHoldersDOBMM>
	
	<cfparam name="attributes.tertiaryHoldersDOBDD" default="">
	<cfset tertiaryHoldersDOBDD = attributes.tertiaryHoldersDOBDD>
	
	<cfparam name="attributes.tertiaryHoldersDOBYY" default="">
	<cfset tertiaryHoldersDOBYY = attributes.tertiaryHoldersDOBYY>
	
	<cfparam name="attributes.tertiaryPolicyHolderEmployerTBox" default="">
	<cfset tertiaryPolicyHolderEmployerTBox = attributes.tertiaryPolicyHolderEmployerTBox>
	
	<cfparam name="attributes.tertiaryNoteTBox" default="">
	<cfset tertiaryNoteTBox = attributes.tertiaryNoteTBox>
	
	<cfparam name="attributes.tertiaryVerificationRepFNameTBox" default="">
	<cfset tertiaryVerificationRepFNameTBox = attributes.tertiaryVerificationRepFNameTBox>
	
	<cfparam name="attributes.tertiaryVerificationRepLNameTBox" default="">
	<cfset tertiaryVerificationRepLNameTBox = attributes.tertiaryVerificationRepLNameTBox>
	
	<cfparam name="attributes.tertiaryVerificationDateMM" default="">
	<cfset tertiaryVerificationDateMM = attributes.tertiaryVerificationDateMM>
	
	<cfparam name="attributes.tertiaryVerificationDateDD" default="">
	<cfset tertiaryVerificationDateDD = attributes.tertiaryVerificationDateDD>
	
	<cfparam name="attributes.tertiaryVerificationDateYY" default="">
	<cfset tertiaryVerificationDateYY = attributes.tertiaryVerificationDateYY>
	
	<cfparam name="attributes.tertiaryVerificationTimeTBox" default="">
	<cfset tertiaryVerificationTimeTBox = attributes.tertiaryVerificationTimeTBox>										
	
	<cfparam name="attributes.tertiaryVerificationHaveInsFromMM" default="">
	<cfset tertiaryVerificationHaveInsFromMM = attributes.tertiaryVerificationHaveInsFromMM>
	
	<cfparam name="attributes.tertiaryVerificationHaveInsFromDD" default="">
	<cfset tertiaryVerificationHaveInsFromDD = attributes.tertiaryVerificationHaveInsFromDD>
	
	<cfparam name="attributes.tertiaryVerificationHaveInsFromYY" default="">
	<cfset tertiaryVerificationHaveInsFromYY = attributes.tertiaryVerificationHaveInsFromYY>
	
	<cfparam name="attributes.tertiaryVerificationHaveInsToMM" default="">
	<cfset tertiaryVerificationHaveInsToMM = attributes.tertiaryVerificationHaveInsToMM>
	
	<cfparam name="attributes.tertiaryVerificationHaveInsToDD" default="">
	<cfset tertiaryVerificationHaveInsToDD = attributes.tertiaryVerificationHaveInsToDD>
	
	<cfparam name="attributes.tertiaryVerificationHaveInsToYY" default="">
	<cfset tertiaryVerificationHaveInsToYY = attributes.tertiaryVerificationHaveInsToYY>
	
	<cfparam name="attributes.tertiaryCBox_VerificationHaveInsYes" default="0">
	<cfset tertiaryCBox_VerificationHaveInsYes = attributes.tertiaryCBox_VerificationHaveInsYes>
	
	<cfparam name="attributes.tertiaryCBox_VerificationHaveInsNo" default="0">
	<cfset tertiaryCBox_VerificationHaveInsNo = attributes.tertiaryCBox_VerificationHaveInsNo>
	
	<cfparam name="attributes.tertiaryCBox_VerificationHaveDMECovYes" default="0">
	<cfset tertiaryCBox_VerificationHaveDMECovYes = attributes.tertiaryCBox_VerificationHaveDMECovYes>
	
	<cfparam name="attributes.tertiaryCBox_VerificationHaveDMECovNo" default="0">
	<cfset tertiaryCBox_VerificationHaveDMECovNo = attributes.tertiaryCBox_VerificationHaveDMECovNo>
	
	<cfparam name="attributes.tertiaryCBox_VerificationDeductibleYes" default="0">
	<cfset tertiaryCBox_VerificationDeductibleYes = attributes.tertiaryCBox_VerificationDeductibleYes>
	
	<cfparam name="attributes.tertiaryCBox_VerificationDeductibleNo" default="0">
	<cfset tertiaryCBox_VerificationDeductibleNo = attributes.tertiaryCBox_VerificationDeductibleNo>
	
	<cfparam name="attributes.tertiaryVerificationDeductibleAmountTBox" default="">
	<cfset tertiaryVerificationDeductibleAmountTBox = attributes.tertiaryVerificationDeductibleAmountTBox>
	
	<cfparam name="attributes.tertiaryVerificationDeductibleAmountMetTBox" default="">
	<cfset tertiaryVerificationDeductibleAmountMetTBox = attributes.tertiaryVerificationDeductibleAmountMetTBox>
	
	<cfparam name="attributes.tertiaryVerificationPercentagePayAfterDeductibleTBox" default="">
	<cfset tertiaryVerificationPercentagePayAfterDeductibleTBox = attributes.tertiaryVerificationPercentagePayAfterDeductibleTBox>									
	
	<cfparam name="attributes.tertiaryCBox_VerificationPPOPolicyYes" default="0">
	<cfset tertiaryCBox_VerificationPPOPolicyYes = attributes.tertiaryCBox_VerificationPPOPolicyYes>
	
	<cfparam name="attributes.tertiaryCBox_VerificationPPOPolicyNo" default="0">
	<cfset tertiaryCBox_VerificationPPOPolicyNo = attributes.tertiaryCBox_VerificationPPOPolicyNo>										
	
	<cfparam name="attributes.tertiaryVerificationAuthNumberTBox" default="">
	<cfset tertiaryVerificationAuthNumberTBox = attributes.tertiaryVerificationAuthNumberTBox>							
	
	<cfparam name="attributes.tertiaryCBox_VerificationPriorAuthYes" default="0">
	<cfset tertiaryCBox_VerificationPriorAuthYes = attributes.tertiaryCBox_VerificationPriorAuthYes>
	
	<cfparam name="attributes.tertiaryCBox_VerificationPriorAuthNo" default="0">
	<cfset tertiaryCBox_VerificationPriorAuthNo = attributes.tertiaryCBox_VerificationPriorAuthNo>										
	
	<cfparam name="attributes.tertiaryVerificationAuthPhoneNumberTBox" default="">
	<cfset tertiaryVerificationAuthPhoneNumberTBox = attributes.tertiaryVerificationAuthPhoneNumberTBox>			
	
	<cfparam name="attributes.tertiaryCBox_VerificationLifetimeBenefitMetYes" default="0">
	<cfset tertiaryCBox_VerificationLifetimeBenefitMetYes = attributes.tertiaryCBox_VerificationLifetimeBenefitMetYes>
	
	<cfparam name="attributes.tertiaryCBox_VerificationLifetimeBenefitMetNo" default="0">
	<cfset tertiaryCBox_VerificationLifetimeBenefitMetNo = attributes.tertiaryCBox_VerificationLifetimeBenefitMetNo>												
	
	<cfparam name="attributes.tertiaryCBox_MedicareSupplementYes" default="0">
	<cfset tertiaryCBox_MedicareSupplementYes = attributes.tertiaryCBox_MedicareSupplementYes>
	
	<cfparam name="attributes.tertiaryCBox_MedicareSupplementNo" default="0">
	<cfset tertiaryCBox_MedicareSupplementNo = attributes.tertiaryCBox_MedicareSupplementNo>				
	
	<cfparam name="attributes.tertiaryCBox_CoordinateBenefitsYes" default="0">
	<cfset tertiaryCBox_CoordinateBenefitsYes = attributes.tertiaryCBox_CoordinateBenefitsYes>
	
	<cfparam name="attributes.tertiaryCBox_CoordinateBenefitsNo" default="0">
	<cfset tertiaryCBox_CoordinateBenefitsNo = attributes.tertiaryCBox_CoordinateBenefitsNo>			
	
	<cfparam name="attributes.tertiaryCBox_PaidMedicareDeductibleYes" default="0">
	<cfset tertiaryCBox_PaidMedicareDeductibleYes = attributes.tertiaryCBox_PaidMedicareDeductibleYes>
	
	<cfparam name="attributes.tertiaryCBox_PaidMedicareDeductibleNo" default="0">
	<cfset tertiaryCBox_PaidMedicareDeductibleNo = attributes.tertiaryCBox_PaidMedicareDeductibleNo>											
	
	<cfparam name="attributes.tertiaryVerificationTypeBasePlanTBox" default="">
	<cfset tertiaryVerificationTypeBasePlanTBox = attributes.tertiaryVerificationTypeBasePlanTBox>			
	
	<cfparam name="attributes.tertiaryCBox_VerificationMedicaidPlanMQMB" default="0">
	<cfset tertiaryCBox_VerificationMedicaidPlanMQMB = attributes.tertiaryCBox_VerificationMedicaidPlanMQMB>
	
	<cfparam name="attributes.tertiaryCBox_VerificationMedicaidPlanQMB" default="0">
	<cfset tertiaryCBox_VerificationMedicaidPlanQMB = attributes.tertiaryCBox_VerificationMedicaidPlanQMB>
	
	<cfparam name="attributes.tertiaryCBox_VerificationMedicaidPlanTraditional" default="0">
	<cfset tertiaryCBox_VerificationMedicaidPlanTraditional = attributes.tertiaryCBox_VerificationMedicaidPlanTraditional>
	
	<cfparam name="attributes.hcpcCost1TBox" default="">
	<cfset hcpcCost1TBox = attributes.hcpcCost1TBox>
	
	<cfparam name="attributes.hcpcCost2TBox" default="">
	<cfset hcpcCost2TBox = attributes.hcpcCost2TBox>
	
	<cfparam name="attributes.hcpcCost3TBox" default="">
	<cfset hcpcCost3TBox = attributes.hcpcCost3TBox>
	
	<cfparam name="attributes.hcpcCost4TBox" default="">
	<cfset hcpcCost4TBox = attributes.hcpcCost4TBox>
	
	<cfparam name="attributes.hcpcCost5TBox" default="">
	<cfset hcpcCost5TBox = attributes.hcpcCost5TBox>
	
	<cfparam name="attributes.hcpcCost6TBox" default="">
	<cfset hcpcCost6TBox = attributes.hcpcCost6TBox>
	
	<cfparam name="attributes.hcpcCost7TBox" default="">
	<cfset hcpcCost7TBox = attributes.hcpcCost7TBox>
	
	<cfparam name="attributes.hcpcCost8TBox" default="">
	<cfset hcpcCost8TBox = attributes.hcpcCost8TBox>
	
	<cfparam name="attributes.hcpcCost9TBox" default="">
	<cfset hcpcCost9TBox = attributes.hcpcCost9TBox>
	
	<cfparam name="attributes.hcpcCost10TBox" default="">
	<cfset hcpcCost10TBox = attributes.hcpcCost10TBox>	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="recordID"
		fieldnames="Intake Auto Save Record ID"
		datatypes="numeric">	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- get the pending intake and loop the XML.                                       --->
<!-------------------------------------------------------------------------------------->	
	<cfquery name="getPendingIntake" datasource="#request.datasource#">
		SELECT patientFName, patientLName, RecordID, UsersID, intakeXML
		FROM intakeautosave
		WHERE RecordID = #trim(recordID)#
	</cfquery>
	
	<cfset thisIntake = XmlParse(getPendingIntake.intakeXML)>
	
	<cfloop index="i" from = "1" to="#Arraylen(thisIntake.intakes.intake.XmlChildren)#">
	   	<cfset nodeName = thisIntake.intakes.intake.XmlChildren[i].XMLName> 
	   	<cfset xmlElementName = "thisIntake.intakes.intake." & trim(nodeName) & ".XmlText">   
		<cfset "#trim(nodeName)#" = evaluate(xmlElementName)> 
	</cfloop>	
	


<!-------------------------------------------------------------------------------------->
<!--- Call the tag to show the Intake                                                --->
<!-------------------------------------------------------------------------------------->
	<cf_tagFormPatientIntakeForm 		
		intakeautosaveid="#trim(recordID)#"
		hidden_step="#trim(hidden_step)#"
		hidden_usersid="#trim(hidden_UsersID)#"
		dateCreated="#trim(DateCreated)#"
		hidden_timestart="#trim(hidden_TimeStart)#"
		option_1_cbox_delivery="#trim(OPTION_1_CBox_Delivery)#"
		option_1_cbox_pickup="#trim(OPTION_1_CBox_Pickup)#"
		option_1_cbox_repair="#trim(OPTION_1_CBox_Repair)#"
		option_1_cbox_switch="#trim(OPTION_1_CBox_Switch)#"
		option_1_cbox_existing="#trim(OPTION_1_CBox_Existing)#"
		OPTION_2_CBox_Other="#trim(OPTION_2_CBox_Other)#"
		option_2_cbox_hospice="#trim(OPTION_2_CBox_Hospice)#"
		option_2_cbox_hospital="#trim(OPTION_2_CBox_Hospital)#"		
		othertbox="#trim(otherTBox)#"
		hospicetbox="#trim(hospiceTBox)#"
		option_3_cbox_medicare="#trim(OPTION_3_CBox_Medicare)#"
		option_3_cbox_privateinsurance="#trim(OPTION_3_CBox_PrivateInsurance)#"
		option_3_cbox_medicaid="#trim(OPTION_3_CBox_Medicaid)#"
		option_3_cbox_privatepay="#trim(OPTION_3_CBox_PrivatePay)#"
		hospitaltbox="#trim(hospitalTBox)#"
		dischargedatemm="#trim(DischargeDateMM)#"
		dischargedatedd="#trim(DischargeDateDD)#"
		dischargedateyy="#trim(DischargeDateYY)#"
		typeofpay_radio="#trim(typeOfPay_Radio)#"
		callerfnametbox="#trim(callerFNameTBox)#"
		callerminitialtbox="#trim(callerMInitialTBox)#"
		callerlnametbox="#trim(callerLNameTBox)#"
		callerphonetbox="#request.formatPhoneUS(trim(callerPhoneTBox))#"
		patientfnametbox="#trim(patientFNameTBox)#"
		patientMInitialtbox="#trim(patientMInitialTBox)#"
		patientlnametbox="#trim(patientLNameTBox)#"
		roomnumbertbox="#trim(roomNumberTBox)#"
		bednumbertbox="#trim(bedNumberTBox)#"
		patientaddresstbox="#trim(patientAddressTBox)#"
		patientcitytbox="#trim(patientCityTBox)#"
		patientstatetbox="#trim(patientStateTBox)#"
		patientziptbox="#trim(patientZipTBox)#"
		patientphonetbox="#request.formatPhoneUS(trim(patientPhoneTBox))#"
		option_3a_cbox_patientsexmale="#trim(OPTION_3a_CBox_PatientSexMale)#"
		option_3a_cbox_patientsexfemale="#trim(OPTION_3a_CBox_PatientSexFemale)#"
		patientdobmm="#trim(patientDOBMM)#"
		patientdobdd="#trim(patientDOBDD)#"
		patientdobyy="#trim(patientDOBYY)#"
		patientssntbox="#REQUEST.formatSSN(trim(patientSSNTBox))#"		
		patientheightinches="#trim(patientHeightInches)#"
		patientweighttbox="#trim(patientWeightTBox)#"
		alternatecontactfnametbox="#trim(alternateContactFNameTBox)#"
		alternatecontactminitialtbox="#trim(alternateContactminitialTBox)#"
		alternatecontactlnametbox="#trim(alternateContactlNameTBox)#"
		alternatecontactrelationshiptbox="#trim(alternateContactRelationshipTBox)#"
		alternatecontactphonetbox="#request.formatPhoneUS(trim(alternateContactPhoneTBox))#"
		alternatecontactworkphonetbox="#request.formatPhoneUS(trim(alternateContactWorkPhoneTBox))#"
		hcpccode1tbox="#trim(hcpcCode1TBox)#"
		hcpcqty1tbox="#trim(hcpcQty1TBox)#"
		hcpcproduct1tbox="#trim(hcpcProduct1TBox)#"
		hcpcdx1tbox="#trim(hcpcDX1TBox)#"
		hcpcdiagnosis1tbox="#trim(hcpcDiagnosis1TBox)#"
		hcpclengthofneedyear1tbox="#trim(hcpcLengthOfNeedYear1TBox)#"
		hcpclengthofneedmonth1tbox="#trim(hcpcLengthOfNeedMonth1TBox)#"
		hcpccode2tbox="#trim(hcpcCode2TBox)#"
		hcpcqty2tbox="#trim(hcpcQty2TBox)#"
		hcpcproduct2tbox="#trim(hcpcProduct2TBox)#"
		hcpcdx2tbox="#trim(hcpcDX2TBox)#"
		hcpcdiagnosis2tbox="#trim(hcpcDiagnosis2TBox)#"
		hcpclengthofneedyear2tbox="#trim(hcpcLengthOfNeedYear2TBox)#"
		hcpclengthofneedmonth2tbox="#trim(hcpcLengthOfNeedMonth2TBox)#"
		hcpccode3tbox="#trim(hcpcCode3TBox)#"
		hcpcqty3tbox="#trim(hcpcQty3TBox)#"
		hcpcproduct3tbox="#trim(hcpcProduct3TBox)#"
		hcpcdx3tbox="#trim(hcpcDX3TBox)#"
		hcpcdiagnosis3tbox="#trim(hcpcDiagnosis3TBox)#"
		hcpclengthofneedyear3tbox="#trim(hcpcLengthOfNeedYear3TBox)#"
		hcpclengthofneedmonth3tbox="#trim(hcpcLengthOfNeedMonth3TBox)#"
		hcpccode4tbox="#trim(hcpcCode4TBox)#"
		hcpcqty4tbox="#trim(hcpcQty4TBox)#"
		hcpcproduct4tbox="#trim(hcpcProduct4TBox)#"
		hcpcdx4tbox="#trim(hcpcDX4TBox)#"
		hcpcdiagnosis4tbox="#trim(hcpcDiagnosis4TBox)#"
		hcpclengthofneedyear4tbox="#trim(hcpcLengthOfNeedYear4TBox)#"
		hcpclengthofneedmonth4tbox="#trim(hcpcLengthOfNeedMonth4TBox)#"
		hcpccode5tbox="#trim(hcpcCode5TBox)#"
		hcpcqty5tbox="#trim(hcpcQty5TBox)#"
		hcpcproduct5tbox="#trim(hcpcProduct5TBox)#"
		hcpcdx5tbox="#trim(hcpcDX5TBox)#"
		hcpcdiagnosis5tbox="#trim(hcpcDiagnosis5TBox)#"
		hcpclengthofneedyear5tbox="#trim(hcpcLengthOfNeedYear5TBox)#"
		hcpclengthofneedmonth5tbox="#trim(hcpcLengthOfNeedMonth5TBox)#"
		hcpccode6tbox="#trim(hcpcCode6TBox)#"
		hcpcqty6tbox="#trim(hcpcQty6TBox)#"
		hcpcproduct6tbox="#trim(hcpcProduct6TBox)#"
		hcpcdx6tbox="#trim(hcpcDX6TBox)#"
		hcpcdiagnosis6tbox="#trim(hcpcDiagnosis6TBox)#"
		hcpclengthofneedyear6tbox="#trim(hcpcLengthOfNeedYear6TBox)#"
		hcpclengthofneedmonth6tbox="#trim(hcpcLengthOfNeedMonth6TBox)#"
		hcpccode7tbox="#trim(hcpcCode7TBox)#"
		hcpcqty7tbox="#trim(hcpcQty7TBox)#"
		hcpcproduct7tbox="#trim(hcpcProduct7TBox)#"
		hcpcdx7tbox="#trim(hcpcDX7TBox)#"
		hcpcdiagnosis7tbox="#trim(hcpcDiagnosis7TBox)#"
		hcpclengthofneedyear7tbox="#trim(hcpcLengthOfNeedYear7TBox)#"
		hcpclengthofneedmonth7tbox="#trim(hcpcLengthOfNeedMonth7TBox)#"
		hcpccode8tbox="#trim(hcpcCode8TBox)#"
		hcpcqty8tbox="#trim(hcpcQty8TBox)#"
		hcpcproduct8tbox="#trim(hcpcProduct8TBox)#"
		hcpcdx8tbox="#trim(hcpcDX8TBox)#"
		hcpcdiagnosis8tbox="#trim(hcpcDiagnosis8TBox)#"
		hcpclengthofneedyear8tbox="#trim(hcpcLengthOfNeedYear8TBox)#"
		hcpclengthofneedmonth8tbox="#trim(hcpcLengthOfNeedMonth8TBox)#"
		hcpccode9tbox="#trim(hcpcCode9TBox)#"
		hcpcqty9tbox="#trim(hcpcQty9TBox)#"
		hcpcproduct9tbox="#trim(hcpcProduct9TBox)#"
		hcpcdx9tbox="#trim(hcpcDX9TBox)#"
		hcpcdiagnosis9tbox="#trim(hcpcDiagnosis9TBox)#"
		hcpclengthofneedyear9tbox="#trim(hcpcLengthOfNeedYear9TBox)#"
		hcpclengthofneedmonth9tbox="#trim(hcpcLengthOfNeedMonth9TBox)#"
		hcpccode10tbox="#trim(hcpcCode10TBox)#"
		hcpcqty10tbox="#trim(hcpcQty10TBox)#"
		hcpcproduct10tbox="#trim(hcpcProduct10TBox)#"
		hcpcdx10tbox="#trim(hcpcDX10TBox)#"
		hcpcdiagnosis10tbox="#trim(hcpcDiagnosis10TBox)#"
		hcpclengthofneedyear10tbox="#trim(hcpcLengthOfNeedYear10TBox)#"
		hcpclengthofneedmonth10tbox="#trim(hcpcLengthOfNeedMonth10TBox)#"
		ponumbertbox="#trim(poNumberTBox)#"
		creditcardtypetbox="#trim(creditCardTypeTBox)#"
		creditcardnumbertbox="#trim(creditCardNumberTBox)#"
		ccdatemm="#trim(ccDateMM)#"
		ccdatedd="#trim(ccDateDD)#"
		ccdateyy="#trim(ccDateYY)#"
		orderingphysicianfnametbox="#trim(orderingPhysicianFNameTBox)#"
		orderingphysicianminitialtbox="#trim(orderingPhysicianMInitialTBox)#"
		orderingphysicianlnametbox="#trim(orderingPhysicianLNameTBox)#"
		orderingphysicianphonetbox="#request.formatPhoneUS(trim(orderingPhysicianPhoneTBox))#"
		orderingphysicianupintbox="#trim(orderingPhysicianUPINTBox)#"
		orderingphysicianfaxtbox="#request.formatPhoneUS(trim(orderingPhysicianFaxTBox))#"
		orderingphysicianaddresstbox="#trim(orderingPhysicianAddressTBox)#"
		orderingphysiciancitytbox="#trim(orderingPhysicianCityTBox)#"
		orderingphysicianstatetbox="#trim(orderingPhysicianStateTBox)#"
		orderingphysicianziptbox="#trim(orderingPhysicianZipTBox)#"
		option_13_cbox_pastequipmentyes="#trim(OPTION_13_CBox_PastEquipmentYes)#"
		option_13_cbox_pastequipmentno="#trim(OPTION_13_CBox_PastEquipmentNo)#"
		equipment1typetbox="#trim(Equipment1TypeTBox)#"
		equipment1rentpurchasedselect="#trim(Equipment1RentPurchasedSelect)#"
		equipment1frommm="#trim(Equipment1FromMM)#"
		equipment1fromdd="#trim(Equipment1FromDD)#"
		equipment1fromyy="#trim(Equipment1FromYY)#"
		equipment1tomm="#trim(Equipment1ToMM)#"
		equipment1todd="#trim(Equipment1ToDD)#"
		equipment1toyy="#trim(Equipment1ToYY)#"
		equipment1suppliernametbox="#trim(Equipment1SupplierNameTBox)#"
		equipment1suppliertelephonetbox="#request.formatPhoneUS(trim(Equipment1SupplierTelephoneTBox))#"
		equipment2typetbox="#trim(Equipment2TypeTBox)#"
		equipment2rentpurchasedselect="#trim(Equipment2RentPurchasedSelect)#"
		equipment2frommm="#trim(Equipment2FromMM)#"
		equipment2fromdd="#trim(Equipment2FromDD)#"
		equipment2fromyy="#trim(Equipment2FromYY)#"
		equipment2tomm="#trim(Equipment2ToMM)#"
		equipment2todd="#trim(Equipment2ToDD)#"
		equipment2toyy="#trim(Equipment2ToYY)#"
		equipment2suppliernametbox="#trim(Equipment2SupplierNameTBox)#"
		equipment2suppliertelephonetbox="#request.formatPhoneUS(trim(Equipment2SupplierTelephoneTBox))#"
		equipment3typetbox="#trim(Equipment3TypeTBox)#"
		equipment3rentpurchasedselect="#trim(Equipment3RentPurchasedSelect)#"
		equipment3frommm="#trim(Equipment3FromMM)#"
		equipment3fromdd="#trim(Equipment3FromDD)#"
		equipment3fromyy="#trim(Equipment3FromYY)#"
		equipment3tomm="#trim(Equipment3ToMM)#"
		equipment3todd="#trim(Equipment3ToDD)#"
		equipment3toyy="#trim(Equipment3ToYY)#"
		equipment3suppliernametbox="#trim(Equipment3SupplierNameTBox)#"
		equipment3suppliertelephonetbox="#request.formatPhoneUS(trim(Equipment3SupplierTelephoneTBox))#"
		equipment4typetbox="#trim(Equipment4TypeTBox)#"
		equipment4rentpurchasedselect="#trim(Equipment4RentPurchasedSelect)#"
		equipment4frommm="#trim(Equipment4FromMM)#"
		equipment4fromdd="#trim(Equipment4FromDD)#"
		equipment4fromyy="#trim(Equipment4FromYY)#"
		equipment4tomm="#trim(Equipment4ToMM)#"
		equipment4todd="#trim(Equipment4ToDD)#"
		equipment4toyy="#trim(Equipment4ToYY)#"
		equipment4suppliernametbox="#trim(Equipment4SupplierNameTBox)#"
		equipment4suppliertelephonetbox="#request.formatPhoneUS(trim(Equipment4SupplierTelephoneTBox))#"
		equipment5typetbox="#trim(Equipment5TypeTBox)#"
		equipment5rentpurchasedselect="#trim(Equipment5RentPurchasedSelect)#"
		equipment5frommm="#trim(Equipment5FromMM)#"
		equipment5fromdd="#trim(Equipment5FromDD)#"
		equipment5fromyy="#trim(Equipment5FromYY)#"
		equipment5tomm="#trim(Equipment5ToMM)#"
		equipment5todd="#trim(Equipment5ToDD)#"
		equipment5toyy="#trim(Equipment5ToYY)#"
		equipment5suppliernametbox="#trim(Equipment5SupplierNameTBox)#"
		equipment5suppliertelephonetbox="#request.formatPhoneUS(trim(Equipment5SupplierTelephoneTBox))#"
		option_14_cbox_oxygenpao2="#trim(OPTION_14_CBox_OxygenPAo2)#"
		option_14_cbox_oxygensao2="#trim(OPTION_14_CBox_OxygenSAo2)#"
		option_14_cbox_oxygenspo2="#trim(OPTION_14_CBox_OxygenSPo2)#"
		oxygenpao2tbox="#trim(OxygenPAO2TBox)#"
		oxygensao2tbox="#trim(OxygenSAO2TBox)#"
		cpapstudy_cbox="#trim(CPAPStudy_CBox)#"
		cpapstudynote="#trim(CPAPStudyNote)#"
		oxygenspo2tbox="#trim(OxygenSPO2TBox)#"
		cpapstudyonfile_cbox="#trim(CPAPStudyOnFile_CBox)#"
		cpapstudyonfilenote="#trim(CPAPStudyOnFileNote)#"
		labtestdatemm="#trim(LabTestDateMM)#"
		labtestdatedd="#trim(LabTestDateDD)#"
		labtestdateyy="#trim(LabTestDateYY)#"
		cpapstudyperformedat="#trim(CPAPStudyPerformedAt)#"
		labtestfacilitytbox="#trim(LabTestFacilityTBox)#"
		cpapstudyperformedat2="#trim(CPAPStudyPerformedAt2)#"
		cpapstudyperformedat3="#trim(CPAPStudyPerformedAt3)#"
		primaryInsuranceNameTBox="#trim(primaryInsuranceNameTBox)#"
		primaryPolicyNumberTBox="#trim(primaryPolicyNumberTBox)#"
		primaryGroupNumberTBox="#trim(primaryGroupNumberTBox)#"
		primaryPhoneNumberTBox="#request.formatPhoneUS(trim(primaryPhoneNumberTBox))#"
		primaryEffectiveDateMM="#trim(primaryEffectiveDateMM)#"
		primaryEffectiveDateDD="#trim(primaryEffectiveDateDD)#"
		primaryEffectiveDateYY="#trim(primaryEffectiveDateYY)#"
		primaryPolicyHolderFNameTBox="#trim(primaryPolicyHolderFNameTBox)#"
		primaryPolicyHolderMInitialTBox="#trim(primaryPolicyHolderMInitialTBox)#"
		primaryPolicyHolderLNameTBox="#trim(primaryPolicyHolderLNameTBox)#"
		primaryHoldersDOBMM="#trim(primaryHoldersDOBMM)#"
		primaryHoldersDOBDD="#trim(primaryHoldersDOBDD)#"
		primaryHoldersDOBYY="#trim(primaryHoldersDOBYY)#"
		primaryPolicyHolderEmployerTBox="#trim(primaryPolicyHolderEmployerTBox)#"
		primaryNoteTBox="#trim(primaryNoteTBox)#"
		primaryVerificationRepFNameTBox="#trim(primaryVerificationRepFNameTBox)#"
		primaryVerificationRepLNameTBox="#trim(primaryVerificationRepLNameTBox)#"
		primaryVerificationDateMM="#trim(primaryVerificationDateMM)#"
		primaryVerificationDateDD="#trim(primaryVerificationDateDD)#"
		primaryVerificationDateYY="#trim(primaryVerificationDateYY)#"
		primaryVerificationTimeTBox="#trim(primaryVerificationTimeTBox)#"
		primaryVerificationHaveInsFromMM="#trim(primaryVerificationHaveInsFromMM)#"
		primaryVerificationHaveInsFromDD="#trim(primaryVerificationHaveInsFromDD)#"
		primaryVerificationHaveInsFromYY="#trim(primaryVerificationHaveInsFromYY)#"
		primaryVerificationHaveInsToMM="#trim(primaryVerificationHaveInsToMM)#"
		primaryVerificationHaveInsToDD="#trim(primaryVerificationHaveInsToDD)#"
		primaryVerificationHaveInsToYY="#trim(primaryVerificationHaveInsToYY)#"
		primaryCBox_VerificationHaveInsYes="#trim(primaryCBox_VerificationHaveInsYes)#"
		primaryCBox_VerificationHaveInsNo="#trim(primaryCBox_VerificationHaveInsNo)#"
		primaryCBox_VerificationHaveDMECovYes="#trim(primaryCBox_VerificationHaveDMECovYes)#"
		primaryCBox_VerificationHaveDMECovNo="#trim(primaryCBox_VerificationHaveDMECovNo)#"
		primaryCBox_VerificationDeductibleYes="#trim(primaryCBox_VerificationDeductibleYes)#"
		primaryCBox_VerificationDeductibleNo="#trim(primaryCBox_VerificationDeductibleNo)#"
		primaryVerificationDeductibleAmountTBox="#trim(primaryVerificationDeductibleAmountTBox)#"
		primaryVerificationDeductibleAmountMetTBox="#trim(primaryVerificationDeductibleAmountMetTBox)#"
		primaryVerificationPercentagePayAfterDeductibleTBox="#trim(primaryVerificationPercentagePayAfterDeductibleTBox)#"
		primaryCBox_VerificationPPOPolicyYes="#trim(primaryCBox_VerificationPPOPolicyYes)#"
		primaryCBox_VerificationPPOPolicyNo="#trim(primaryCBox_VerificationPPOPolicyNo)#"
		primaryVerificationAuthNumberTBox="#trim(primaryVerificationAuthNumberTBox)#"
		primaryCBox_VerificationPriorAuthYes="#trim(primaryCBox_VerificationPriorAuthYes)#"
		primaryCBox_VerificationPriorAuthNo="#trim(primaryCBox_VerificationPriorAuthNo)#"
		primaryVerificationAuthPhoneNumberTBox="#request.formatPhoneUS(trim(primaryVerificationAuthPhoneNumberTBox))#"
		primaryCBox_VerificationLifetimeBenefitMetYes="#trim(primaryCBox_VerificationLifetimeBenefitMetYes)#"
		primaryCBox_VerificationLifetimeBenefitMetNo="#trim(primaryCBox_VerificationLifetimeBenefitMetNo)#"
		primaryCBox_MedicareSupplementYes="#trim(primaryCBox_MedicareSupplementYes)#"
		primaryCBox_MedicareSupplementNo="#trim(primaryCBox_MedicareSupplementNo)#"
		primaryCBox_CoordinateBenefitsYes="#trim(primaryCBox_CoordinateBenefitsYes)#"
		primaryCBox_CoordinateBenefitsNo="#trim(primaryCBox_CoordinateBenefitsNo)#"
		primaryCBox_PaidMedicareDeductibleYes="#trim(primaryCBox_PaidMedicareDeductibleYes)#"
		primaryCBox_PaidMedicareDeductibleNo="#trim(primaryCBox_PaidMedicareDeductibleNo)#"
		primaryVerificationTypeBasePlanTBox="#trim(primaryVerificationTypeBasePlanTBox)#"
		primaryCBox_VerificationMedicaidPlanMQMB="#trim(primaryCBox_VerificationMedicaidPlanMQMB)#"
		primaryCBox_VerificationMedicaidPlanQMB="#trim(primaryCBox_VerificationMedicaidPlanQMB)#"
		primaryCBox_VerificationMedicaidPlanTraditional="#trim(primaryCBox_VerificationMedicaidPlanTraditional)#"
		secondaryInsuranceNameTBox="#trim(secondaryInsuranceNameTBox)#"
		secondaryPolicyNumberTBox="#trim(secondaryPolicyNumberTBox)#"
		secondaryGroupNumberTBox="#trim(secondaryGroupNumberTBox)#"
		secondaryPhoneNumberTBox="#request.formatPhoneUS(trim(secondaryPhoneNumberTBox))#"
		secondaryEffectiveDateMM="#trim(secondaryEffectiveDateMM)#"
		secondaryEffectiveDateDD="#trim(secondaryEffectiveDateDD)#"
		secondaryEffectiveDateYY="#trim(secondaryEffectiveDateYY)#"
		secondaryPolicyHolderFNameTBox="#trim(secondaryPolicyHolderFNameTBox)#"
		secondaryPolicyHolderMInitialTBox="#trim(secondaryPolicyHolderMInitialTBox)#"
		secondaryPolicyHolderLNameTBox="#trim(secondaryPolicyHolderLNameTBox)#"
		secondaryHoldersDOBMM="#trim(secondaryHoldersDOBMM)#"
		secondaryHoldersDOBDD="#trim(secondaryHoldersDOBDD)#"
		secondaryHoldersDOBYY="#trim(secondaryHoldersDOBYY)#"
		secondaryPolicyHolderEmployerTBox="#trim(secondaryPolicyHolderEmployerTBox)#"
		secondaryNoteTBox="#trim(secondaryNoteTBox)#"
		secondaryVerificationRepFNameTBox="#trim(secondaryVerificationRepFNameTBox)#"
		secondaryVerificationRepLNameTBox="#trim(secondaryVerificationRepLNameTBox)#"
		secondaryVerificationDateMM="#trim(secondaryVerificationDateMM)#"
		secondaryVerificationDateDD="#trim(secondaryVerificationDateDD)#"
		secondaryVerificationDateYY="#trim(secondaryVerificationDateYY)#"
		secondaryVerificationTimeTBox="#trim(secondaryVerificationTimeTBox)#"
		secondaryVerificationHaveInsFromMM="#trim(secondaryVerificationHaveInsFromMM)#"
		secondaryVerificationHaveInsFromDD="#trim(secondaryVerificationHaveInsFromDD)#"
		secondaryVerificationHaveInsFromYY="#trim(secondaryVerificationHaveInsFromYY)#"
		secondaryVerificationHaveInsToMM="#trim(secondaryVerificationHaveInsToMM)#"
		secondaryVerificationHaveInsToDD="#trim(secondaryVerificationHaveInsToDD)#"
		secondaryVerificationHaveInsToYY="#trim(secondaryVerificationHaveInsToYY)#"
		secondaryCBox_VerificationHaveInsYes="#trim(secondaryCBox_VerificationHaveInsYes)#"
		secondaryCBox_VerificationHaveInsNo="#trim(secondaryCBox_VerificationHaveInsNo)#"
		secondaryCBox_VerificationHaveDMECovYes="#trim(secondaryCBox_VerificationHaveDMECovYes)#"
		secondaryCBox_VerificationHaveDMECovNo="#trim(secondaryCBox_VerificationHaveDMECovNo)#"
		secondaryCBox_VerificationDeductibleYes="#trim(secondaryCBox_VerificationDeductibleYes)#"
		secondaryCBox_VerificationDeductibleNo="#trim(secondaryCBox_VerificationDeductibleNo)#"
		secondaryVerificationDeductibleAmountTBox="#trim(secondaryVerificationDeductibleAmountTBox)#"
		secondaryVerificationDeductibleAmountMetTBox="#trim(secondaryVerificationDeductibleAmountMetTBox)#"
		secondaryVerificationPercentagePayAfterDeductibleTBox="#trim(secondaryVerificationPercentagePayAfterDeductibleTBox)#"
		secondaryCBox_VerificationPPOPolicyYes="#trim(secondaryCBox_VerificationPPOPolicyYes)#"
		secondaryCBox_VerificationPPOPolicyNo="#trim(secondaryCBox_VerificationPPOPolicyNo)#"
		secondaryVerificationAuthNumberTBox="#trim(secondaryVerificationAuthNumberTBox)#"
		secondaryCBox_VerificationPriorAuthYes="#trim(secondaryCBox_VerificationPriorAuthYes)#"
		secondaryCBox_VerificationPriorAuthNo="#trim(secondaryCBox_VerificationPriorAuthNo)#"
		secondaryVerificationAuthPhoneNumberTBox="#request.formatPhoneUS(trim(secondaryVerificationAuthPhoneNumberTBox))#"
		secondaryCBox_VerificationLifetimeBenefitMetYes="#trim(secondaryCBox_VerificationLifetimeBenefitMetYes)#"
		secondaryCBox_VerificationLifetimeBenefitMetNo="#trim(secondaryCBox_VerificationLifetimeBenefitMetNo)#"
		secondaryCBox_MedicareSupplementYes="#trim(secondaryCBox_MedicareSupplementYes)#"
		secondaryCBox_MedicareSupplementNo="#trim(secondaryCBox_MedicareSupplementNo)#"
		secondaryCBox_CoordinateBenefitsYes="#trim(secondaryCBox_CoordinateBenefitsYes)#"
		secondaryCBox_CoordinateBenefitsNo="#trim(secondaryCBox_CoordinateBenefitsNo)#"
		secondaryCBox_PaidMedicareDeductibleYes="#trim(secondaryCBox_PaidMedicareDeductibleYes)#"
		secondaryCBox_PaidMedicareDeductibleNo="#trim(secondaryCBox_PaidMedicareDeductibleNo)#"
		secondaryVerificationTypeBasePlanTBox="#trim(secondaryVerificationTypeBasePlanTBox)#"
		secondaryCBox_VerificationMedicaidPlanMQMB="#trim(secondaryCBox_VerificationMedicaidPlanMQMB)#"
		secondaryCBox_VerificationMedicaidPlanQMB="#trim(secondaryCBox_VerificationMedicaidPlanQMB)#"
		secondaryCBox_VerificationMedicaidPlanTraditional="#trim(secondaryCBox_VerificationMedicaidPlanTraditional)#"
		tertiaryInsuranceNameTBox="#trim(tertiaryInsuranceNameTBox)#"
		tertiaryPolicyNumberTBox="#trim(tertiaryPolicyNumberTBox)#"
		tertiaryGroupNumberTBox="#trim(tertiaryGroupNumberTBox)#"
		tertiaryPhoneNumberTBox="#request.formatPhoneUS(trim(tertiaryPhoneNumberTBox))#"
		tertiaryEffectiveDateMM="#trim(tertiaryEffectiveDateMM)#"
		tertiaryEffectiveDateDD="#trim(tertiaryEffectiveDateDD)#"
		tertiaryEffectiveDateYY="#trim(tertiaryEffectiveDateYY)#"
		tertiaryPolicyHolderFNameTBox="#trim(tertiaryPolicyHolderFNameTBox)#"
		tertiaryPolicyHolderMInitialTBox="#trim(tertiaryPolicyHolderMInitialTBox)#"
		tertiaryPolicyHolderLNameTBox="#trim(tertiaryPolicyHolderLNameTBox)#"
		tertiaryHoldersDOBMM="#trim(tertiaryHoldersDOBMM)#"
		tertiaryHoldersDOBDD="#trim(tertiaryHoldersDOBDD)#"
		tertiaryHoldersDOBYY="#trim(tertiaryHoldersDOBYY)#"
		tertiaryPolicyHolderEmployerTBox="#trim(tertiaryPolicyHolderEmployerTBox)#"
		tertiaryNoteTBox="#trim(tertiaryNoteTBox)#"
		tertiaryVerificationRepFNameTBox="#trim(tertiaryVerificationRepFNameTBox)#"
		tertiaryVerificationRepLNameTBox="#trim(tertiaryVerificationRepLNameTBox)#"
		tertiaryVerificationDateMM="#trim(tertiaryVerificationDateMM)#"
		tertiaryVerificationDateDD="#trim(tertiaryVerificationDateDD)#"
		tertiaryVerificationDateYY="#trim(tertiaryVerificationDateYY)#"
		tertiaryVerificationTimeTBox="#trim(tertiaryVerificationTimeTBox)#"
		tertiaryVerificationHaveInsFromMM="#trim(tertiaryVerificationHaveInsFromMM)#"
		tertiaryVerificationHaveInsFromDD="#trim(tertiaryVerificationHaveInsFromDD)#"
		tertiaryVerificationHaveInsFromYY="#trim(tertiaryVerificationHaveInsFromYY)#"
		tertiaryVerificationHaveInsToMM="#trim(tertiaryVerificationHaveInsToMM)#"
		tertiaryVerificationHaveInsToDD="#trim(tertiaryVerificationHaveInsToDD)#"
		tertiaryVerificationHaveInsToYY="#trim(tertiaryVerificationHaveInsToYY)#"
		tertiaryCBox_VerificationHaveInsYes="#trim(tertiaryCBox_VerificationHaveInsYes)#"
		tertiaryCBox_VerificationHaveInsNo="#trim(tertiaryCBox_VerificationHaveInsNo)#"
		tertiaryCBox_VerificationHaveDMECovYes="#trim(tertiaryCBox_VerificationHaveDMECovYes)#"
		tertiaryCBox_VerificationHaveDMECovNo="#trim(tertiaryCBox_VerificationHaveDMECovNo)#"
		tertiaryCBox_VerificationDeductibleYes="#trim(tertiaryCBox_VerificationDeductibleYes)#"
		tertiaryCBox_VerificationDeductibleNo="#trim(tertiaryCBox_VerificationDeductibleNo)#"
		tertiaryVerificationDeductibleAmountTBox="#trim(tertiaryVerificationDeductibleAmountTBox)#"
		tertiaryVerificationDeductibleAmountMetTBox="#trim(tertiaryVerificationDeductibleAmountMetTBox)#"
		tertiaryVerificationPercentagePayAfterDeductibleTBox="#trim(tertiaryVerificationPercentagePayAfterDeductibleTBox)#"
		tertiaryCBox_VerificationPPOPolicyYes="#trim(tertiaryCBox_VerificationPPOPolicyYes)#"
		tertiaryCBox_VerificationPPOPolicyNo="#trim(tertiaryCBox_VerificationPPOPolicyNo)#"
		tertiaryVerificationAuthNumberTBox="#trim(tertiaryVerificationAuthNumberTBox)#"
		tertiaryCBox_VerificationPriorAuthYes="#trim(tertiaryCBox_VerificationPriorAuthYes)#"
		tertiaryCBox_VerificationPriorAuthNo="#trim(tertiaryCBox_VerificationPriorAuthNo)#"
		tertiaryVerificationAuthPhoneNumberTBox="#request.formatPhoneUS(trim(tertiaryVerificationAuthPhoneNumberTBox))#"
		tertiaryCBox_VerificationLifetimeBenefitMetYes="#trim(tertiaryCBox_VerificationLifetimeBenefitMetYes)#"
		tertiaryCBox_VerificationLifetimeBenefitMetNo="#trim(tertiaryCBox_VerificationLifetimeBenefitMetNo)#"
		tertiaryCBox_MedicareSupplementYes="#trim(tertiaryCBox_MedicareSupplementYes)#"
		tertiaryCBox_MedicareSupplementNo="#trim(tertiaryCBox_MedicareSupplementNo)#"
		tertiaryCBox_CoordinateBenefitsYes="#trim(tertiaryCBox_CoordinateBenefitsYes)#"
		tertiaryCBox_CoordinateBenefitsNo="#trim(tertiaryCBox_CoordinateBenefitsNo)#"
		tertiaryCBox_PaidMedicareDeductibleYes="#trim(tertiaryCBox_PaidMedicareDeductibleYes)#"
		tertiaryCBox_PaidMedicareDeductibleNo="#trim(tertiaryCBox_PaidMedicareDeductibleNo)#"
		tertiaryVerificationTypeBasePlanTBox="#trim(tertiaryVerificationTypeBasePlanTBox)#"
		tertiaryCBox_VerificationMedicaidPlanMQMB="#trim(tertiaryCBox_VerificationMedicaidPlanMQMB)#"
		tertiaryCBox_VerificationMedicaidPlanQMB="#trim(tertiaryCBox_VerificationMedicaidPlanQMB)#"
		tertiaryCBox_VerificationMedicaidPlanTraditional="#trim(tertiaryCBox_VerificationMedicaidPlanTraditional)#"
		hcpcCost1TBox="#trim(hcpcCost1TBox)#"
		hcpcCost2TBox="#trim(hcpcCost2TBox)#"
		hcpcCost3TBox="#trim(hcpcCost3TBox)#"
		hcpcCost4TBox="#trim(hcpcCost4TBox)#"
		hcpcCost5TBox="#trim(hcpcCost5TBox)#"
		hcpcCost6TBox="#trim(hcpcCost6TBox)#"
		hcpcCost7TBox="#trim(hcpcCost7TBox)#"
		hcpcCost8TBox="#trim(hcpcCost8TBox)#"
		hcpcCost9TBox="#trim(hcpcCost9TBox)#"
		hcpcCost10TBox="#trim(hcpcCost10TBox)#">



