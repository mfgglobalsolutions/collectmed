<!---- tagFormPatientIntakeForm.cfm ---->



<!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
<!--- SEND new step like this                                                                                                                                                                      --->
<!--- hidden_step="1|#DateFormat(NOW(), 'mm/dd/yyyy')#|#TimeFormat(NOW(), 'hh:mm:ss tt')#|#trim(session.User.getUsersID())#|#trim(session.Entity.getFName())# #trim(session.Entity.getLName())#~"> --->
<!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->


<link rel="stylesheet" href="styles/tagFormPatientIntakeForm.css" type="text/css" media="screen" />

		
		
<!-------------------------------------------------------------------------------------->
<!--- Include the file that WDDX needs to do it's job. Taken from the CFIDE folder.  --->
<!--------------------------------------------------------------------------------------> 		
	<cfoutput>		
		
		<script type="text/javascript" language="JavaScript" src="includes/wddx.js"></script>		
		
		<cfif (CGI.HTTP_USER_AGENT contains "MSIE") AND (CGI.HTTP_USER_AGENT contains "Win")>
	    	<script type="text/javascript" language="JavaScript" src="includes/wddxDesIE.js"></script>
	    <cfelse>
	    	<script type="text/javascript" language="JavaScript" src="includes/wddxDes.js"></script>
	    </cfif>
		
	</cfoutput>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Code for tabs to work.                                                         --->
<!-------------------------------------------------------------------------------------->
	<script type="text/javascript" src="/includes/jquery/ui/jquery.ui.core.js"></script>
	<script type="text/javascript" src="/includes/jquery/ui/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="/includes/jquery/ui/jquery.ui.position.js"></script>
	<script type="text/javascript" src="/includes/jquery/ui/jquery.ui.autocomplete.js"></script>

	
	
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.formName" default="PatientIntakeForm">
	<cfset formName = attributes.formName>
	
	<cfparam name="attributes.mainSearchContainer" default="searchP">
	<cfset mainSearchContainer = attributes.mainSearchContainer>
	
	<cfparam name="attributes.mainSearchContainerHeight" default="400">
	<cfset mainSearchContainerHeight = attributes.mainSearchContainerHeight>
	
	<cfparam name="attributes.mainSearchContainerWidth" default="450">
	<cfset mainSearchContainerWidth = attributes.mainSearchContainerWidth>		
				
	<cfparam name="attributes.clearedList" default="">
	<cfset clearedList = attributes.clearedList>
	
	<cfparam name="attributes.inactiveCode" default="">
	<cfset inactiveCode = attributes.inactiveCode>
	
	<cfparam name="attributes.intakeAutoSaveID" default="">
	<cfset intakeAutoSaveID = attributes.intakeAutoSaveID>
	
	<cfparam name="attributes.intakeID" default="">
	<cfset intakeID = attributes.intakeID>
	
	<cfparam name="attributes.patientID" default="">
	<cfset patientID = attributes.patientID>
	
	<cfparam name="attributes.patientMaritalStatus" default="">
	<cfset patientMaritalStatus = attributes.patientMaritalStatus>
	
	<cfparam name="attributes.patientAddressID" default="">
	<cfset patientAddressID = attributes.patientAddressID>
	
	<cfparam name="attributes.patientPhoneID" default="">
	<cfset patientPhoneID = attributes.patientPhoneID>
	
	<cfparam name="attributes.patientXML" default="">
	<cfset patientXML = attributes.patientXML>
	
	<cfparam name="attributes.closingInvoiceNumber" default="">
	<cfset closingInvoiceNumber = attributes.closingInvoiceNumber>
	
	<cfparam name="attributes.AssignedTouserID" default="">
	<cfset AssignedTouserID = attributes.AssignedTouserID>
	
	<cfparam name="attributes.hidden_Step" default="">
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
		
	<cfparam name="attributes.OPTION_SkilledNursing" default="">
	<cfset OPTION_SkilledNursing = attributes.OPTION_SkilledNursing>
	
	<cfparam name="attributes.SkilledNursingName" default="">
	<cfset SkilledNursingName = attributes.SkilledNursingName>
	
	<cfparam name="attributes.SkilledNursingTelephone" default="">
	<cfset SkilledNursingTelephone = attributes.SkilledNursingTelephone>
															
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
		
	<cfparam name="attributes.OPTION_3a_CBox_PatientSex" default="-1">
	<cfset OPTION_3a_CBox_PatientSex = attributes.OPTION_3a_CBox_PatientSex>
		
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

	<cfparam name="attributes.typeOfPay_Radio" default="">
	<cfset typeOfPay_Radio = attributes.typeOfPay_Radio>
			
	<cfparam name="attributes.Equipment1NoteTBox" default="">
	<cfset Equipment1NoteTBox = attributes.Equipment1NoteTBox>
	
	<cfparam name="attributes.Equipment2NoteTBox" default="">
	<cfset Equipment2NoteTBox = attributes.Equipment2NoteTBox>
	
	<cfparam name="attributes.Equipment3NoteTBox" default="">
	<cfset Equipment3NoteTBox = attributes.Equipment3NoteTBox>
	
	<cfparam name="attributes.Equipment4NoteTBox" default="">
	<cfset Equipment4NoteTBox = attributes.Equipment4NoteTBox>
	
	<cfparam name="attributes.Equipment5NoteTBox" default="">
	<cfset Equipment5NoteTBox = attributes.Equipment5NoteTBox>
	
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
	
	<cfparam name="attributes.primaryFaxNumberTBox" default="">
	<cfset primaryFaxNumberTBox = attributes.primaryFaxNumberTBox>
	
	<cfparam name="attributes.primarySendToAddress1TBox" default="">
	<cfset primarySendToAddress1TBox = attributes.primarySendToAddress1TBox>

	<cfparam name="attributes.primarySendToAddress2TBox" default="">
	<cfset primarySendToAddress2TBox = attributes.primarySendToAddress2TBox>
	
	<cfparam name="attributes.primarySendToCityTBox" default="">
	<cfset primarySendToCityTBox = attributes.primarySendToCityTBox>
	
	<cfparam name="attributes.primarySendToStateTBox" default="">
	<cfset primarySendToStateTBox = attributes.primarySendToStateTBox>
	
	<cfparam name="attributes.primarySendToZipCodeTBox" default="">
	<cfset primarySendToZipCodeTBox = attributes.primarySendToZipCodeTBox>
	
	<cfparam name="attributes.secondaryFaxNumberTBox" default="">
	<cfset secondaryFaxNumberTBox = attributes.secondaryFaxNumberTBox>
	
	<cfparam name="attributes.secondarySendToAddress1TBox" default="">
	<cfset secondarySendToAddress1TBox = attributes.secondarySendToAddress1TBox>
	
	<cfparam name="attributes.secondarySendToAddress2TBox" default="">
	<cfset secondarySendToAddress2TBox = attributes.secondarySendToAddress2TBox>
	
	<cfparam name="attributes.secondarySendToCityTBox" default="">
	<cfset secondarySendToCityTBox = attributes.secondarySendToCityTBox>
	
	<cfparam name="attributes.secondarySendToStateTBox" default="">
	<cfset secondarySendToStateTBox = attributes.secondarySendToStateTBox>
	
	<cfparam name="attributes.secondarySendToZipCodeTBox" default="">
	<cfset secondarySendToZipCodeTBox = attributes.secondarySendToZipCodeTBox>
	
	<cfparam name="attributes.tertiaryFaxNumberTBox" default="">
	<cfset tertiaryFaxNumberTBox = attributes.tertiaryFaxNumberTBox>
	
	<cfparam name="attributes.tertiarySendToAddress1TBox" default="">
	<cfset tertiarySendToAddress1TBox = attributes.tertiarySendToAddress1TBox>
	
	<cfparam name="attributes.tertiarySendToAddress2TBox" default="">
	<cfset tertiarySendToAddress2TBox = attributes.tertiarySendToAddress2TBox>
	
	<cfparam name="attributes.tertiarySendToCityTBox" default="">
	<cfset tertiarySendToCityTBox = attributes.tertiarySendToCityTBox>
	
	<cfparam name="attributes.tertiarySendToStateTBox" default="">
	<cfset tertiarySendToStateTBox = attributes.tertiarySendToStateTBox>
	
	<cfparam name="attributes.tertiarySendToZipCodeTBox" default="">
	<cfset tertiarySendToZipCodeTBox = attributes.tertiarySendToZipCodeTBox>
	
	<cfparam name="attributes.active" default="1">
	<cfset active = attributes.active>

	<cfparam name="attributes.printed" default="">
	<cfset printed = attributes.printed>	
	
	<cfparam name="attributes.hcpcCode1TBox" default="">
	<cfset hcpcCode1TBox = attributes.hcpcCode1TBox>

	<cfparam name="attributes.hcpcQty1TBox" default="">
	<cfset hcpcQty1TBox = attributes.hcpcQty1TBox>
	
	<cfparam name="attributes.hcpcProduct1TBox" default="">
	<cfset hcpcProduct1TBox = attributes.hcpcProduct1TBox>
	
	<cfparam name="attributes.hcpcCost1TBox" default="">
	<cfset hcpcCost1TBox = attributes.hcpcCost1TBox>
	
	<cfparam name="attributes.hcpcDX1TBox" default="">
	<cfset hcpcDX1TBox = attributes.hcpcDX1TBox>
	
	<cfparam name="attributes.hcpcDiagnosis1TBox" default="">
	<cfset hcpcDiagnosis1TBox = attributes.hcpcDiagnosis1TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear1TBox" default="">
	<cfset hcpcLengthOfNeedYear1TBox = attributes.hcpcLengthOfNeedYear1TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth1TBox" default="">
	<cfset hcpcLengthOfNeedMonth1TBox = attributes.hcpcLengthOfNeedMonth1TBox>
	
	<cfparam name="attributes.hcpcCode2TBox" default="">
	<cfset hcpcCode2TBox = attributes.hcpcCode2TBox>
	
	<cfparam name="attributes.hcpcQty2TBox" default="">
	<cfset hcpcQty2TBox = attributes.hcpcQty2TBox>
	
	<cfparam name="attributes.hcpcProduct2TBox" default="">
	<cfset hcpcProduct2TBox = attributes.hcpcProduct2TBox>
	
	<cfparam name="attributes.hcpcCost2TBox" default="">
	<cfset hcpcCost2TBox = attributes.hcpcCost2TBox>
	
	<cfparam name="attributes.hcpcDX2TBox" default="">
	<cfset hcpcDX2TBox = attributes.hcpcDX2TBox>
	
	<cfparam name="attributes.hcpcDiagnosis2TBox" default="">
	<cfset hcpcDiagnosis2TBox = attributes.hcpcDiagnosis2TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear2TBox" default="">
	<cfset hcpcLengthOfNeedYear2TBox = attributes.hcpcLengthOfNeedYear2TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth2TBox" default="">
	<cfset hcpcLengthOfNeedMonth2TBox = attributes.hcpcLengthOfNeedMonth2TBox>
	
	<cfparam name="attributes.hcpcCode3TBox" default="">
	<cfset hcpcCode3TBox = attributes.hcpcCode3TBox>
	
	<cfparam name="attributes.hcpcQty3TBox" default="">
	<cfset hcpcQty3TBox = attributes.hcpcQty3TBox>
	
	<cfparam name="attributes.hcpcProduct3TBox" default="">
	<cfset hcpcProduct3TBox = attributes.hcpcProduct3TBox>
	
	<cfparam name="attributes.hcpcCost3TBox" default="">
	<cfset hcpcCost3TBox = attributes.hcpcCost3TBox>
	
	<cfparam name="attributes.hcpcDX3TBox" default="">
	<cfset hcpcDX3TBox = attributes.hcpcDX3TBox>
	
	<cfparam name="attributes.hcpcDiagnosis3TBox" default="">
	<cfset hcpcDiagnosis3TBox = attributes.hcpcDiagnosis3TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear3TBox" default="">
	<cfset hcpcLengthOfNeedYear3TBox = attributes.hcpcLengthOfNeedYear3TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth3TBox" default="">
	<cfset hcpcLengthOfNeedMonth3TBox = attributes.hcpcLengthOfNeedMonth3TBox>
	
	<cfparam name="attributes.hcpcCode4TBox" default="">
	<cfset hcpcCode4TBox = attributes.hcpcCode4TBox>
	
	<cfparam name="attributes.hcpcQty4TBox" default="">
	<cfset hcpcQty4TBox = attributes.hcpcQty4TBox>
	
	<cfparam name="attributes.hcpcProduct4TBox" default="">
	<cfset hcpcProduct4TBox = attributes.hcpcProduct4TBox>
	
	<cfparam name="attributes.hcpcCost4TBox" default="">
	<cfset hcpcCost4TBox = attributes.hcpcCost4TBox>
	
	<cfparam name="attributes.hcpcDX4TBox" default="">
	<cfset hcpcDX4TBox = attributes.hcpcDX4TBox>
	
	<cfparam name="attributes.hcpcDiagnosis4TBox" default="">
	<cfset hcpcDiagnosis4TBox = attributes.hcpcDiagnosis4TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear4TBox" default="">
	<cfset hcpcLengthOfNeedYear4TBox = attributes.hcpcLengthOfNeedYear4TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth4TBox" default="">
	<cfset hcpcLengthOfNeedMonth4TBox = attributes.hcpcLengthOfNeedMonth4TBox>
	
	<cfparam name="attributes.hcpcCode5TBox" default="">
	<cfset hcpcCode5TBox = attributes.hcpcCode5TBox>
	
	<cfparam name="attributes.hcpcQty5TBox" default="">
	<cfset hcpcQty5TBox = attributes.hcpcQty5TBox>
	
	<cfparam name="attributes.hcpcProduct5TBox" default="">
	<cfset hcpcProduct5TBox = attributes.hcpcProduct5TBox>
	
	<cfparam name="attributes.hcpcCost5TBox" default="">
	<cfset hcpcCost5TBox = attributes.hcpcCost5TBox>
	
	<cfparam name="attributes.hcpcDX5TBox" default="">
	<cfset hcpcDX5TBox = attributes.hcpcDX5TBox>
	
	<cfparam name="attributes.hcpcDiagnosis5TBox" default="">
	<cfset hcpcDiagnosis5TBox = attributes.hcpcDiagnosis5TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear5TBox" default="">
	<cfset hcpcLengthOfNeedYear5TBox = attributes.hcpcLengthOfNeedYear5TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth5TBox" default="">
	<cfset hcpcLengthOfNeedMonth5TBox = attributes.hcpcLengthOfNeedMonth5TBox>
	
	<cfparam name="attributes.hcpcCode6TBox" default="">
	<cfset hcpcCode6TBox = attributes.hcpcCode6TBox>
	
	<cfparam name="attributes.hcpcQty6TBox" default="">
	<cfset hcpcQty6TBox = attributes.hcpcQty6TBox>
	
	<cfparam name="attributes.hcpcProduct6TBox" default="">
	<cfset hcpcProduct6TBox = attributes.hcpcProduct6TBox>
	
	<cfparam name="attributes.hcpcCost6TBox" default="">
	<cfset hcpcCost6TBox = attributes.hcpcCost6TBox>
	
	<cfparam name="attributes.hcpcDX6TBox" default="">
	<cfset hcpcDX6TBox = attributes.hcpcDX6TBox>
	
	<cfparam name="attributes.hcpcDiagnosis6TBox" default="">
	<cfset hcpcDiagnosis6TBox = attributes.hcpcDiagnosis6TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear6TBox" default="">
	<cfset hcpcLengthOfNeedYear6TBox = attributes.hcpcLengthOfNeedYear6TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth6TBox" default="">
	<cfset hcpcLengthOfNeedMonth6TBox = attributes.hcpcLengthOfNeedMonth6TBox>
	
	<cfparam name="attributes.hcpcCode7TBox" default="">
	<cfset hcpcCode7TBox = attributes.hcpcCode7TBox>
	
	<cfparam name="attributes.hcpcQty7TBox" default="">
	<cfset hcpcQty7TBox = attributes.hcpcQty7TBox>
	
	<cfparam name="attributes.hcpcProduct7TBox" default="">
	<cfset hcpcProduct7TBox = attributes.hcpcProduct7TBox>
	
	<cfparam name="attributes.hcpcCost7TBox" default="">
	<cfset hcpcCost7TBox = attributes.hcpcCost7TBox>
	
	<cfparam name="attributes.hcpcDX7TBox" default="">
	<cfset hcpcDX7TBox = attributes.hcpcDX7TBox>
	
	<cfparam name="attributes.hcpcDiagnosis7TBox" default="">
	<cfset hcpcDiagnosis7TBox = attributes.hcpcDiagnosis7TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear7TBox" default="">
	<cfset hcpcLengthOfNeedYear7TBox = attributes.hcpcLengthOfNeedYear7TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth7TBox" default="">
	<cfset hcpcLengthOfNeedMonth7TBox = attributes.hcpcLengthOfNeedMonth7TBox>
	
	<cfparam name="attributes.hcpcCode8TBox" default="">
	<cfset hcpcCode8TBox = attributes.hcpcCode8TBox>
	
	<cfparam name="attributes.hcpcQty8TBox" default="">
	<cfset hcpcQty8TBox = attributes.hcpcQty8TBox>
	
	<cfparam name="attributes.hcpcProduct8TBox" default="">
	<cfset hcpcProduct8TBox = attributes.hcpcProduct8TBox>
	
	<cfparam name="attributes.hcpcCost8TBox" default="">
	<cfset hcpcCost8TBox = attributes.hcpcCost8TBox>
	
	<cfparam name="attributes.hcpcDX8TBox" default="">
	<cfset hcpcDX8TBox = attributes.hcpcDX8TBox>
	
	<cfparam name="attributes.hcpcDiagnosis8TBox" default="">
	<cfset hcpcDiagnosis8TBox = attributes.hcpcDiagnosis8TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear8TBox" default="">
	<cfset hcpcLengthOfNeedYear8TBox = attributes.hcpcLengthOfNeedYear8TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth8TBox" default="">
	<cfset hcpcLengthOfNeedMonth8TBox = attributes.hcpcLengthOfNeedMonth8TBox>
	
	<cfparam name="attributes.hcpcCode9TBox" default="">
	<cfset hcpcCode9TBox = attributes.hcpcCode9TBox>
	
	<cfparam name="attributes.hcpcQty9TBox" default="">
	<cfset hcpcQty9TBox = attributes.hcpcQty9TBox>
	
	<cfparam name="attributes.hcpcProduct9TBox" default="">
	<cfset hcpcProduct9TBox = attributes.hcpcProduct9TBox>
	
	<cfparam name="attributes.hcpcCost9TBox" default="">
	<cfset hcpcCost9TBox = attributes.hcpcCost9TBox>
	
	<cfparam name="attributes.hcpcDX9TBox" default="">
	<cfset hcpcDX9TBox = attributes.hcpcDX9TBox>
	
	<cfparam name="attributes.hcpcDiagnosis9TBox" default="">
	<cfset hcpcDiagnosis9TBox = attributes.hcpcDiagnosis9TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear9TBox" default="">
	<cfset hcpcLengthOfNeedYear9TBox = attributes.hcpcLengthOfNeedYear9TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth9TBox" default="">
	<cfset hcpcLengthOfNeedMonth9TBox = attributes.hcpcLengthOfNeedMonth9TBox>
	
	<cfparam name="attributes.hcpcCode10TBox" default="">
	<cfset hcpcCode10TBox = attributes.hcpcCode10TBox>
	
	<cfparam name="attributes.hcpcQty10TBox" default="">
	<cfset hcpcQty10TBox = attributes.hcpcQty10TBox>
	
	<cfparam name="attributes.hcpcProduct10TBox" default="">
	<cfset hcpcProduct10TBox = attributes.hcpcProduct10TBox>
	
	<cfparam name="attributes.hcpcCost10TBox" default="">
	<cfset hcpcCost10TBox = attributes.hcpcCost10TBox>
	
	<cfparam name="attributes.hcpcDX10TBox" default="">
	<cfset hcpcDX10TBox = attributes.hcpcDX10TBox>
	
	<cfparam name="attributes.hcpcDiagnosis10TBox" default="">
	<cfset hcpcDiagnosis10TBox = attributes.hcpcDiagnosis10TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear10TBox" default="">
	<cfset hcpcLengthOfNeedYear10TBox = attributes.hcpcLengthOfNeedYear10TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth10TBox" default="">
	<cfset hcpcLengthOfNeedMonth10TBox = attributes.hcpcLengthOfNeedMonth10TBox>
	
	<cfparam name="attributes.hcpcCode11TBox" default="">
	<cfset hcpcCode11TBox = attributes.hcpcCode11TBox>
	
	<cfparam name="attributes.hcpcQty11TBox" default="">
	<cfset hcpcQty11TBox = attributes.hcpcQty11TBox>
	
	<cfparam name="attributes.hcpcProduct11TBox" default="">
	<cfset hcpcProduct11TBox = attributes.hcpcProduct11TBox>
	
	<cfparam name="attributes.hcpcCost11TBox" default="">
	<cfset hcpcCost11TBox = attributes.hcpcCost11TBox>
	
	<cfparam name="attributes.hcpcDX11TBox" default="">
	<cfset hcpcDX11TBox = attributes.hcpcDX11TBox>
	
	<cfparam name="attributes.hcpcDiagnosis11TBox" default="">
	<cfset hcpcDiagnosis11TBox = attributes.hcpcDiagnosis11TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear11TBox" default="">
	<cfset hcpcLengthOfNeedYear11TBox = attributes.hcpcLengthOfNeedYear11TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth11TBox" default="">
	<cfset hcpcLengthOfNeedMonth11TBox = attributes.hcpcLengthOfNeedMonth11TBox>
	
	<cfparam name="attributes.hcpcCode12TBox" default="">
	<cfset hcpcCode12TBox = attributes.hcpcCode12TBox>
	
	<cfparam name="attributes.hcpcQty12TBox" default="">
	<cfset hcpcQty12TBox = attributes.hcpcQty12TBox>
	
	<cfparam name="attributes.hcpcProduct12TBox" default="">
	<cfset hcpcProduct12TBox = attributes.hcpcProduct12TBox>
	
	<cfparam name="attributes.hcpcCost12TBox" default="">
	<cfset hcpcCost12TBox = attributes.hcpcCost12TBox>
	
	<cfparam name="attributes.hcpcDX12TBox" default="">
	<cfset hcpcDX12TBox = attributes.hcpcDX12TBox>
	
	<cfparam name="attributes.hcpcDiagnosis12TBox" default="">
	<cfset hcpcDiagnosis12TBox = attributes.hcpcDiagnosis12TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear12TBox" default="">
	<cfset hcpcLengthOfNeedYear12TBox = attributes.hcpcLengthOfNeedYear12TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth12TBox" default="">
	<cfset hcpcLengthOfNeedMonth12TBox = attributes.hcpcLengthOfNeedMonth12TBox>
	
	<cfparam name="attributes.hcpcCode13TBox" default="">
	<cfset hcpcCode13TBox = attributes.hcpcCode13TBox>
	
	<cfparam name="attributes.hcpcQty13TBox" default="">
	<cfset hcpcQty13TBox = attributes.hcpcQty13TBox>
	
	<cfparam name="attributes.hcpcProduct13TBox" default="">
	<cfset hcpcProduct13TBox = attributes.hcpcProduct13TBox>
	
	<cfparam name="attributes.hcpcCost13TBox" default="">
	<cfset hcpcCost13TBox = attributes.hcpcCost13TBox>
	
	<cfparam name="attributes.hcpcDX13TBox" default="">
	<cfset hcpcDX13TBox = attributes.hcpcDX13TBox>
	
	<cfparam name="attributes.hcpcDiagnosis13TBox" default="">
	<cfset hcpcDiagnosis13TBox = attributes.hcpcDiagnosis13TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear13TBox" default="">
	<cfset hcpcLengthOfNeedYear13TBox = attributes.hcpcLengthOfNeedYear13TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth13TBox" default="">
	<cfset hcpcLengthOfNeedMonth13TBox = attributes.hcpcLengthOfNeedMonth13TBox>
	
	<cfparam name="attributes.hcpcCode14TBox" default="">
	<cfset hcpcCode14TBox = attributes.hcpcCode14TBox>
	
	<cfparam name="attributes.hcpcQty14TBox" default="">
	<cfset hcpcQty14TBox = attributes.hcpcQty14TBox>
	
	<cfparam name="attributes.hcpcProduct14TBox" default="">
	<cfset hcpcProduct14TBox = attributes.hcpcProduct14TBox>
	
	<cfparam name="attributes.hcpcCost14TBox" default="">
	<cfset hcpcCost14TBox = attributes.hcpcCost14TBox>
	
	<cfparam name="attributes.hcpcDX14TBox" default="">
	<cfset hcpcDX14TBox = attributes.hcpcDX14TBox>
	
	<cfparam name="attributes.hcpcDiagnosis14TBox" default="">
	<cfset hcpcDiagnosis14TBox = attributes.hcpcDiagnosis14TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear14TBox" default="">
	<cfset hcpcLengthOfNeedYear14TBox = attributes.hcpcLengthOfNeedYear14TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth14TBox" default="">
	<cfset hcpcLengthOfNeedMonth14TBox = attributes.hcpcLengthOfNeedMonth14TBox>
	
	<cfparam name="attributes.hcpcCode15TBox" default="">
	<cfset hcpcCode15TBox = attributes.hcpcCode15TBox>
	
	<cfparam name="attributes.hcpcQty15TBox" default="">
	<cfset hcpcQty15TBox = attributes.hcpcQty15TBox>
	
	<cfparam name="attributes.hcpcProduct15TBox" default="">
	<cfset hcpcProduct15TBox = attributes.hcpcProduct15TBox>
	
	<cfparam name="attributes.hcpcCost15TBox" default="">
	<cfset hcpcCost15TBox = attributes.hcpcCost15TBox>
	
	<cfparam name="attributes.hcpcDX15TBox" default="">
	<cfset hcpcDX15TBox = attributes.hcpcDX15TBox>
	
	<cfparam name="attributes.hcpcDiagnosis15TBox" default="">
	<cfset hcpcDiagnosis15TBox = attributes.hcpcDiagnosis15TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear15TBox" default="">
	<cfset hcpcLengthOfNeedYear15TBox = attributes.hcpcLengthOfNeedYear15TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth15TBox" default="">
	<cfset hcpcLengthOfNeedMonth15TBox = attributes.hcpcLengthOfNeedMonth15TBox>
	
	<cfparam name="attributes.hcpcCode16TBox" default="">
	<cfset hcpcCode16TBox = attributes.hcpcCode16TBox>
	
	<cfparam name="attributes.hcpcQty16TBox" default="">
	<cfset hcpcQty16TBox = attributes.hcpcQty16TBox>
	
	<cfparam name="attributes.hcpcProduct16TBox" default="">
	<cfset hcpcProduct16TBox = attributes.hcpcProduct16TBox>
	
	<cfparam name="attributes.hcpcCost16TBox" default="">
	<cfset hcpcCost16TBox = attributes.hcpcCost16TBox>
	
	<cfparam name="attributes.hcpcDX16TBox" default="">
	<cfset hcpcDX16TBox = attributes.hcpcDX16TBox>
	
	<cfparam name="attributes.hcpcDiagnosis16TBox" default="">
	<cfset hcpcDiagnosis16TBox = attributes.hcpcDiagnosis16TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear16TBox" default="">
	<cfset hcpcLengthOfNeedYear16TBox = attributes.hcpcLengthOfNeedYear16TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth16TBox" default="">
	<cfset hcpcLengthOfNeedMonth16TBox = attributes.hcpcLengthOfNeedMonth16TBox>
	
	<cfparam name="attributes.hcpcCode17TBox" default="">
	<cfset hcpcCode17TBox = attributes.hcpcCode17TBox>
	
	<cfparam name="attributes.hcpcQty17TBox" default="">
	<cfset hcpcQty17TBox = attributes.hcpcQty17TBox>
	
	<cfparam name="attributes.hcpcProduct17TBox" default="">
	<cfset hcpcProduct17TBox = attributes.hcpcProduct17TBox>
	
	<cfparam name="attributes.hcpcCost17TBox" default="">
	<cfset hcpcCost17TBox = attributes.hcpcCost17TBox>
	
	<cfparam name="attributes.hcpcDX17TBox" default="">
	<cfset hcpcDX17TBox = attributes.hcpcDX17TBox>
	
	<cfparam name="attributes.hcpcDiagnosis17TBox" default="">
	<cfset hcpcDiagnosis17TBox = attributes.hcpcDiagnosis17TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear17TBox" default="">
	<cfset hcpcLengthOfNeedYear17TBox = attributes.hcpcLengthOfNeedYear17TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth17TBox" default="">
	<cfset hcpcLengthOfNeedMonth17TBox = attributes.hcpcLengthOfNeedMonth17TBox>
	
	<cfparam name="attributes.hcpcCode18TBox" default="">
	<cfset hcpcCode18TBox = attributes.hcpcCode18TBox>
	
	<cfparam name="attributes.hcpcQty18TBox" default="">
	<cfset hcpcQty18TBox = attributes.hcpcQty18TBox>
	
	<cfparam name="attributes.hcpcProduct18TBox" default="">
	<cfset hcpcProduct18TBox = attributes.hcpcProduct18TBox>
	
	<cfparam name="attributes.hcpcCost18TBox" default="">
	<cfset hcpcCost18TBox = attributes.hcpcCost18TBox>
	
	<cfparam name="attributes.hcpcDX18TBox" default="">
	<cfset hcpcDX18TBox = attributes.hcpcDX18TBox>
	
	<cfparam name="attributes.hcpcDiagnosis18TBox" default="">
	<cfset hcpcDiagnosis18TBox = attributes.hcpcDiagnosis18TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear18TBox" default="">
	<cfset hcpcLengthOfNeedYear18TBox = attributes.hcpcLengthOfNeedYear18TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth18TBox" default="">
	<cfset hcpcLengthOfNeedMonth18TBox = attributes.hcpcLengthOfNeedMonth18TBox>
	
	<cfparam name="attributes.hcpcCode19TBox" default="">
	<cfset hcpcCode19TBox = attributes.hcpcCode19TBox>
	
	<cfparam name="attributes.hcpcQty19TBox" default="">
	<cfset hcpcQty19TBox = attributes.hcpcQty19TBox>
	
	<cfparam name="attributes.hcpcProduct19TBox" default="">
	<cfset hcpcProduct19TBox = attributes.hcpcProduct19TBox>
	
	<cfparam name="attributes.hcpcCost19TBox" default="">
	<cfset hcpcCost19TBox = attributes.hcpcCost19TBox>
	
	<cfparam name="attributes.hcpcDX19TBox" default="">
	<cfset hcpcDX19TBox = attributes.hcpcDX19TBox>
	
	<cfparam name="attributes.hcpcDiagnosis19TBox" default="">
	<cfset hcpcDiagnosis19TBox = attributes.hcpcDiagnosis19TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear19TBox" default="">
	<cfset hcpcLengthOfNeedYear19TBox = attributes.hcpcLengthOfNeedYear19TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth19TBox" default="">
	<cfset hcpcLengthOfNeedMonth19TBox = attributes.hcpcLengthOfNeedMonth19TBox>
	
	<cfparam name="attributes.hcpcCode20TBox" default="">
	<cfset hcpcCode20TBox = attributes.hcpcCode20TBox>
	
	<cfparam name="attributes.hcpcQty20TBox" default="">
	<cfset hcpcQty20TBox = attributes.hcpcQty20TBox>
	
	<cfparam name="attributes.hcpcProduct20TBox" default="">
	<cfset hcpcProduct20TBox = attributes.hcpcProduct20TBox>
	
	<cfparam name="attributes.hcpcCost20TBox" default="">
	<cfset hcpcCost20TBox = attributes.hcpcCost20TBox>
	
	<cfparam name="attributes.hcpcDX20TBox" default="">
	<cfset hcpcDX20TBox = attributes.hcpcDX20TBox>
	
	<cfparam name="attributes.hcpcDiagnosis20TBox" default="">
	<cfset hcpcDiagnosis20TBox = attributes.hcpcDiagnosis20TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear20TBox" default="">
	<cfset hcpcLengthOfNeedYear20TBox = attributes.hcpcLengthOfNeedYear20TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth20TBox" default="">
	<cfset hcpcLengthOfNeedMonth20TBox = attributes.hcpcLengthOfNeedMonth20TBox>
	
	<cfparam name="attributes.hcpcCode21TBox" default="">
	<cfset hcpcCode21TBox = attributes.hcpcCode21TBox>
	
	<cfparam name="attributes.hcpcQty21TBox" default="">
	<cfset hcpcQty21TBox = attributes.hcpcQty21TBox>
	
	<cfparam name="attributes.hcpcProduct21TBox" default="">
	<cfset hcpcProduct21TBox = attributes.hcpcProduct21TBox>
	
	<cfparam name="attributes.hcpcCost21TBox" default="">
	<cfset hcpcCost21TBox = attributes.hcpcCost21TBox>
	
	<cfparam name="attributes.hcpcDX21TBox" default="">
	<cfset hcpcDX21TBox = attributes.hcpcDX21TBox>
	
	<cfparam name="attributes.hcpcDiagnosis21TBox" default="">
	<cfset hcpcDiagnosis21TBox = attributes.hcpcDiagnosis21TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear21TBox" default="">
	<cfset hcpcLengthOfNeedYear21TBox = attributes.hcpcLengthOfNeedYear21TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth21TBox" default="">
	<cfset hcpcLengthOfNeedMonth21TBox = attributes.hcpcLengthOfNeedMonth21TBox>
	
	<cfparam name="attributes.hcpcCode22TBox" default="">
	<cfset hcpcCode22TBox = attributes.hcpcCode22TBox>
	
	<cfparam name="attributes.hcpcQty22TBox" default="">
	<cfset hcpcQty22TBox = attributes.hcpcQty22TBox>
	
	<cfparam name="attributes.hcpcProduct22TBox" default="">
	<cfset hcpcProduct22TBox = attributes.hcpcProduct22TBox>
	
	<cfparam name="attributes.hcpcCost22TBox" default="">
	<cfset hcpcCost22TBox = attributes.hcpcCost22TBox>
	
	<cfparam name="attributes.hcpcDX22TBox" default="">
	<cfset hcpcDX22TBox = attributes.hcpcDX22TBox>
	
	<cfparam name="attributes.hcpcDiagnosis22TBox" default="">
	<cfset hcpcDiagnosis22TBox = attributes.hcpcDiagnosis22TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear22TBox" default="">
	<cfset hcpcLengthOfNeedYear22TBox = attributes.hcpcLengthOfNeedYear22TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth22TBox" default="">
	<cfset hcpcLengthOfNeedMonth22TBox = attributes.hcpcLengthOfNeedMonth22TBox>
	
	<cfparam name="attributes.hcpcCode23TBox" default="">
	<cfset hcpcCode23TBox = attributes.hcpcCode23TBox>
	
	<cfparam name="attributes.hcpcQty23TBox" default="">
	<cfset hcpcQty23TBox = attributes.hcpcQty23TBox>
	
	<cfparam name="attributes.hcpcProduct23TBox" default="">
	<cfset hcpcProduct23TBox = attributes.hcpcProduct23TBox>
	
	<cfparam name="attributes.hcpcCost23TBox" default="">
	<cfset hcpcCost23TBox = attributes.hcpcCost23TBox>
	
	<cfparam name="attributes.hcpcDX23TBox" default="">
	<cfset hcpcDX23TBox = attributes.hcpcDX23TBox>
	
	<cfparam name="attributes.hcpcDiagnosis23TBox" default="">
	<cfset hcpcDiagnosis23TBox = attributes.hcpcDiagnosis23TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear23TBox" default="">
	<cfset hcpcLengthOfNeedYear23TBox = attributes.hcpcLengthOfNeedYear23TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth23TBox" default="">
	<cfset hcpcLengthOfNeedMonth23TBox = attributes.hcpcLengthOfNeedMonth23TBox>
	
	<cfparam name="attributes.hcpcCode24TBox" default="">
	<cfset hcpcCode24TBox = attributes.hcpcCode24TBox>
	
	<cfparam name="attributes.hcpcQty24TBox" default="">
	<cfset hcpcQty24TBox = attributes.hcpcQty24TBox>
	
	<cfparam name="attributes.hcpcProduct24TBox" default="">
	<cfset hcpcProduct24TBox = attributes.hcpcProduct24TBox>
	
	<cfparam name="attributes.hcpcCost24TBox" default="">
	<cfset hcpcCost24TBox = attributes.hcpcCost24TBox>
	
	<cfparam name="attributes.hcpcDX24TBox" default="">
	<cfset hcpcDX24TBox = attributes.hcpcDX24TBox>
	
	<cfparam name="attributes.hcpcDiagnosis24TBox" default="">
	<cfset hcpcDiagnosis24TBox = attributes.hcpcDiagnosis24TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear24TBox" default="">
	<cfset hcpcLengthOfNeedYear24TBox = attributes.hcpcLengthOfNeedYear24TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth24TBox" default="">
	<cfset hcpcLengthOfNeedMonth24TBox = attributes.hcpcLengthOfNeedMonth24TBox>
	
	<cfparam name="attributes.hcpcCode25TBox" default="">
	<cfset hcpcCode25TBox = attributes.hcpcCode25TBox>
	
	<cfparam name="attributes.hcpcQty25TBox" default="">
	<cfset hcpcQty25TBox = attributes.hcpcQty25TBox>
	
	<cfparam name="attributes.hcpcProduct25TBox" default="">
	<cfset hcpcProduct25TBox = attributes.hcpcProduct25TBox>
	
	<cfparam name="attributes.hcpcCost25TBox" default="">
	<cfset hcpcCost25TBox = attributes.hcpcCost25TBox>
	
	<cfparam name="attributes.hcpcDX25TBox" default="">
	<cfset hcpcDX25TBox = attributes.hcpcDX25TBox>
	
	<cfparam name="attributes.hcpcDiagnosis25TBox" default="">
	<cfset hcpcDiagnosis25TBox = attributes.hcpcDiagnosis25TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear25TBox" default="">
	<cfset hcpcLengthOfNeedYear25TBox = attributes.hcpcLengthOfNeedYear25TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth25TBox" default="">
	<cfset hcpcLengthOfNeedMonth25TBox = attributes.hcpcLengthOfNeedMonth25TBox>
	
	<cfparam name="attributes.hcpcCode26TBox" default="">
	<cfset hcpcCode26TBox = attributes.hcpcCode26TBox>
	
	<cfparam name="attributes.hcpcQty26TBox" default="">
	<cfset hcpcQty26TBox = attributes.hcpcQty26TBox>
	
	<cfparam name="attributes.hcpcProduct26TBox" default="">
	<cfset hcpcProduct26TBox = attributes.hcpcProduct26TBox>
	
	<cfparam name="attributes.hcpcCost26TBox" default="">
	<cfset hcpcCost26TBox = attributes.hcpcCost26TBox>
	
	<cfparam name="attributes.hcpcDX26TBox" default="">
	<cfset hcpcDX26TBox = attributes.hcpcDX26TBox>
	
	<cfparam name="attributes.hcpcDiagnosis26TBox" default="">
	<cfset hcpcDiagnosis26TBox = attributes.hcpcDiagnosis26TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear26TBox" default="">
	<cfset hcpcLengthOfNeedYear26TBox = attributes.hcpcLengthOfNeedYear26TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth26TBox" default="">
	<cfset hcpcLengthOfNeedMonth26TBox = attributes.hcpcLengthOfNeedMonth26TBox>
	
	<cfparam name="attributes.hcpcCode27TBox" default="">
	<cfset hcpcCode27TBox = attributes.hcpcCode27TBox>
	
	<cfparam name="attributes.hcpcQty27TBox" default="">
	<cfset hcpcQty27TBox = attributes.hcpcQty27TBox>
	
	<cfparam name="attributes.hcpcProduct27TBox" default="">
	<cfset hcpcProduct27TBox = attributes.hcpcProduct27TBox>
	
	<cfparam name="attributes.hcpcCost27TBox" default="">
	<cfset hcpcCost27TBox = attributes.hcpcCost27TBox>
	
	<cfparam name="attributes.hcpcDX27TBox" default="">
	<cfset hcpcDX27TBox = attributes.hcpcDX27TBox>
	
	<cfparam name="attributes.hcpcDiagnosis27TBox" default="">
	<cfset hcpcDiagnosis27TBox = attributes.hcpcDiagnosis27TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear27TBox" default="">
	<cfset hcpcLengthOfNeedYear27TBox = attributes.hcpcLengthOfNeedYear27TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth27TBox" default="">
	<cfset hcpcLengthOfNeedMonth27TBox = attributes.hcpcLengthOfNeedMonth27TBox>
	
	<cfparam name="attributes.hcpcCode28TBox" default="">
	<cfset hcpcCode28TBox = attributes.hcpcCode28TBox>
	
	<cfparam name="attributes.hcpcQty28TBox" default="">
	<cfset hcpcQty28TBox = attributes.hcpcQty28TBox>
	
	<cfparam name="attributes.hcpcProduct28TBox" default="">
	<cfset hcpcProduct28TBox = attributes.hcpcProduct28TBox>
	
	<cfparam name="attributes.hcpcCost28TBox" default="">
	<cfset hcpcCost28TBox = attributes.hcpcCost28TBox>
	
	<cfparam name="attributes.hcpcDX28TBox" default="">
	<cfset hcpcDX28TBox = attributes.hcpcDX28TBox>
	
	<cfparam name="attributes.hcpcDiagnosis28TBox" default="">
	<cfset hcpcDiagnosis28TBox = attributes.hcpcDiagnosis28TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear28TBox" default="">
	<cfset hcpcLengthOfNeedYear28TBox = attributes.hcpcLengthOfNeedYear28TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth28TBox" default="">
	<cfset hcpcLengthOfNeedMonth28TBox = attributes.hcpcLengthOfNeedMonth28TBox>
	
	<cfparam name="attributes.hcpcCode29TBox" default="">
	<cfset hcpcCode29TBox = attributes.hcpcCode29TBox>
	
	<cfparam name="attributes.hcpcQty29TBox" default="">
	<cfset hcpcQty29TBox = attributes.hcpcQty29TBox>
	
	<cfparam name="attributes.hcpcProduct29TBox" default="">
	<cfset hcpcProduct29TBox = attributes.hcpcProduct29TBox>
	
	<cfparam name="attributes.hcpcCost29TBox" default="">
	<cfset hcpcCost29TBox = attributes.hcpcCost29TBox>
	
	<cfparam name="attributes.hcpcDX29TBox" default="">
	<cfset hcpcDX29TBox = attributes.hcpcDX29TBox>
	
	<cfparam name="attributes.hcpcDiagnosis29TBox" default="">
	<cfset hcpcDiagnosis29TBox = attributes.hcpcDiagnosis29TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear29TBox" default="">
	<cfset hcpcLengthOfNeedYear29TBox = attributes.hcpcLengthOfNeedYear29TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth29TBox" default="">
	<cfset hcpcLengthOfNeedMonth29TBox = attributes.hcpcLengthOfNeedMonth29TBox>
	
	<cfparam name="attributes.hcpcCode30TBox" default="">
	<cfset hcpcCode30TBox = attributes.hcpcCode30TBox>
	
	<cfparam name="attributes.hcpcQty30TBox" default="">
	<cfset hcpcQty30TBox = attributes.hcpcQty30TBox>
	
	<cfparam name="attributes.hcpcProduct30TBox" default="">
	<cfset hcpcProduct30TBox = attributes.hcpcProduct30TBox>
	
	<cfparam name="attributes.hcpcCost30TBox" default="">
	<cfset hcpcCost30TBox = attributes.hcpcCost30TBox>
	
	<cfparam name="attributes.hcpcDX30TBox" default="">
	<cfset hcpcDX30TBox = attributes.hcpcDX30TBox>
	
	<cfparam name="attributes.hcpcDiagnosis30TBox" default="">
	<cfset hcpcDiagnosis30TBox = attributes.hcpcDiagnosis30TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear30TBox" default="">
	<cfset hcpcLengthOfNeedYear30TBox = attributes.hcpcLengthOfNeedYear30TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth30TBox" default="">
	<cfset hcpcLengthOfNeedMonth30TBox = attributes.hcpcLengthOfNeedMonth30TBox>
	
	<cfparam name="attributes.hcpcCode31TBox" default="">
	<cfset hcpcCode31TBox = attributes.hcpcCode31TBox>
	
	<cfparam name="attributes.hcpcQty31TBox" default="">
	<cfset hcpcQty31TBox = attributes.hcpcQty31TBox>
	
	<cfparam name="attributes.hcpcProduct31TBox" default="">
	<cfset hcpcProduct31TBox = attributes.hcpcProduct31TBox>
	
	<cfparam name="attributes.hcpcCost31TBox" default="">
	<cfset hcpcCost31TBox = attributes.hcpcCost31TBox>
	
	<cfparam name="attributes.hcpcDX31TBox" default="">
	<cfset hcpcDX31TBox = attributes.hcpcDX31TBox>
	
	<cfparam name="attributes.hcpcDiagnosis31TBox" default="">
	<cfset hcpcDiagnosis31TBox = attributes.hcpcDiagnosis31TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear31TBox" default="">
	<cfset hcpcLengthOfNeedYear31TBox = attributes.hcpcLengthOfNeedYear31TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth31TBox" default="">
	<cfset hcpcLengthOfNeedMonth31TBox = attributes.hcpcLengthOfNeedMonth31TBox>
	
	<cfparam name="attributes.hcpcCode32TBox" default="">
	<cfset hcpcCode32TBox = attributes.hcpcCode32TBox>
	
	<cfparam name="attributes.hcpcQty32TBox" default="">
	<cfset hcpcQty32TBox = attributes.hcpcQty32TBox>
	
	<cfparam name="attributes.hcpcProduct32TBox" default="">
	<cfset hcpcProduct32TBox = attributes.hcpcProduct32TBox>
	
	<cfparam name="attributes.hcpcCost32TBox" default="">
	<cfset hcpcCost32TBox = attributes.hcpcCost32TBox>
	
	<cfparam name="attributes.hcpcDX32TBox" default="">
	<cfset hcpcDX32TBox = attributes.hcpcDX32TBox>
	
	<cfparam name="attributes.hcpcDiagnosis32TBox" default="">
	<cfset hcpcDiagnosis32TBox = attributes.hcpcDiagnosis32TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear32TBox" default="">
	<cfset hcpcLengthOfNeedYear32TBox = attributes.hcpcLengthOfNeedYear32TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth32TBox" default="">
	<cfset hcpcLengthOfNeedMonth32TBox = attributes.hcpcLengthOfNeedMonth32TBox>
	
	<cfparam name="attributes.hcpcCode33TBox" default="">
	<cfset hcpcCode33TBox = attributes.hcpcCode33TBox>
	
	<cfparam name="attributes.hcpcQty33TBox" default="">
	<cfset hcpcQty33TBox = attributes.hcpcQty33TBox>
	
	<cfparam name="attributes.hcpcProduct33TBox" default="">
	<cfset hcpcProduct33TBox = attributes.hcpcProduct33TBox>
	
	<cfparam name="attributes.hcpcCost33TBox" default="">
	<cfset hcpcCost33TBox = attributes.hcpcCost33TBox>
	
	<cfparam name="attributes.hcpcDX33TBox" default="">
	<cfset hcpcDX33TBox = attributes.hcpcDX33TBox>
	
	<cfparam name="attributes.hcpcDiagnosis33TBox" default="">
	<cfset hcpcDiagnosis33TBox = attributes.hcpcDiagnosis33TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear33TBox" default="">
	<cfset hcpcLengthOfNeedYear33TBox = attributes.hcpcLengthOfNeedYear33TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth33TBox" default="">
	<cfset hcpcLengthOfNeedMonth33TBox = attributes.hcpcLengthOfNeedMonth33TBox>
	
	<cfparam name="attributes.hcpcCode34TBox" default="">
	<cfset hcpcCode34TBox = attributes.hcpcCode34TBox>
	
	<cfparam name="attributes.hcpcQty34TBox" default="">
	<cfset hcpcQty34TBox = attributes.hcpcQty34TBox>
	
	<cfparam name="attributes.hcpcProduct34TBox" default="">
	<cfset hcpcProduct34TBox = attributes.hcpcProduct34TBox>
	
	<cfparam name="attributes.hcpcCost34TBox" default="">
	<cfset hcpcCost34TBox = attributes.hcpcCost34TBox>
	
	<cfparam name="attributes.hcpcDX34TBox" default="">
	<cfset hcpcDX34TBox = attributes.hcpcDX34TBox>
	
	<cfparam name="attributes.hcpcDiagnosis34TBox" default="">
	<cfset hcpcDiagnosis34TBox = attributes.hcpcDiagnosis34TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear34TBox" default="">
	<cfset hcpcLengthOfNeedYear34TBox = attributes.hcpcLengthOfNeedYear34TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth34TBox" default="">
	<cfset hcpcLengthOfNeedMonth34TBox = attributes.hcpcLengthOfNeedMonth34TBox>
	
	<cfparam name="attributes.hcpcCode35TBox" default="">
	<cfset hcpcCode35TBox = attributes.hcpcCode35TBox>
	
	<cfparam name="attributes.hcpcQty35TBox" default="">
	<cfset hcpcQty35TBox = attributes.hcpcQty35TBox>
	
	<cfparam name="attributes.hcpcProduct35TBox" default="">
	<cfset hcpcProduct35TBox = attributes.hcpcProduct35TBox>
	
	<cfparam name="attributes.hcpcCost35TBox" default="">
	<cfset hcpcCost35TBox = attributes.hcpcCost35TBox>
	
	<cfparam name="attributes.hcpcDX35TBox" default="">
	<cfset hcpcDX35TBox = attributes.hcpcDX35TBox>
	
	<cfparam name="attributes.hcpcDiagnosis35TBox" default="">
	<cfset hcpcDiagnosis35TBox = attributes.hcpcDiagnosis35TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear35TBox" default="">
	<cfset hcpcLengthOfNeedYear35TBox = attributes.hcpcLengthOfNeedYear35TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth35TBox" default="">
	<cfset hcpcLengthOfNeedMonth35TBox = attributes.hcpcLengthOfNeedMonth35TBox>
	
	<cfparam name="attributes.hcpcCode36TBox" default="">
	<cfset hcpcCode36TBox = attributes.hcpcCode36TBox>
	
	<cfparam name="attributes.hcpcQty36TBox" default="">
	<cfset hcpcQty36TBox = attributes.hcpcQty36TBox>
	
	<cfparam name="attributes.hcpcProduct36TBox" default="">
	<cfset hcpcProduct36TBox = attributes.hcpcProduct36TBox>
	
	<cfparam name="attributes.hcpcCost36TBox" default="">
	<cfset hcpcCost36TBox = attributes.hcpcCost36TBox>
	
	<cfparam name="attributes.hcpcDX36TBox" default="">
	<cfset hcpcDX36TBox = attributes.hcpcDX36TBox>
	
	<cfparam name="attributes.hcpcDiagnosis36TBox" default="">
	<cfset hcpcDiagnosis36TBox = attributes.hcpcDiagnosis36TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear36TBox" default="">
	<cfset hcpcLengthOfNeedYear36TBox = attributes.hcpcLengthOfNeedYear36TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth36TBox" default="">
	<cfset hcpcLengthOfNeedMonth36TBox = attributes.hcpcLengthOfNeedMonth36TBox>
	
	<cfparam name="attributes.hcpcCode37TBox" default="">
	<cfset hcpcCode37TBox = attributes.hcpcCode37TBox>
	
	<cfparam name="attributes.hcpcQty37TBox" default="">
	<cfset hcpcQty37TBox = attributes.hcpcQty37TBox>
	
	<cfparam name="attributes.hcpcProduct37TBox" default="">
	<cfset hcpcProduct37TBox = attributes.hcpcProduct37TBox>
	
	<cfparam name="attributes.hcpcCost37TBox" default="">
	<cfset hcpcCost37TBox = attributes.hcpcCost37TBox>
	
	<cfparam name="attributes.hcpcDX37TBox" default="">
	<cfset hcpcDX37TBox = attributes.hcpcDX37TBox>
	
	<cfparam name="attributes.hcpcDiagnosis37TBox" default="">
	<cfset hcpcDiagnosis37TBox = attributes.hcpcDiagnosis37TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear37TBox" default="">
	<cfset hcpcLengthOfNeedYear37TBox = attributes.hcpcLengthOfNeedYear37TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth37TBox" default="">
	<cfset hcpcLengthOfNeedMonth37TBox = attributes.hcpcLengthOfNeedMonth37TBox>
	
	<cfparam name="attributes.hcpcCode38TBox" default="">
	<cfset hcpcCode38TBox = attributes.hcpcCode38TBox>
	
	<cfparam name="attributes.hcpcQty38TBox" default="">
	<cfset hcpcQty38TBox = attributes.hcpcQty38TBox>
	
	<cfparam name="attributes.hcpcProduct38TBox" default="">
	<cfset hcpcProduct38TBox = attributes.hcpcProduct38TBox>
	
	<cfparam name="attributes.hcpcCost38TBox" default="">
	<cfset hcpcCost38TBox = attributes.hcpcCost38TBox>
	
	<cfparam name="attributes.hcpcDX38TBox" default="">
	<cfset hcpcDX38TBox = attributes.hcpcDX38TBox>
	
	<cfparam name="attributes.hcpcDiagnosis38TBox" default="">
	<cfset hcpcDiagnosis38TBox = attributes.hcpcDiagnosis38TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear38TBox" default="">
	<cfset hcpcLengthOfNeedYear38TBox = attributes.hcpcLengthOfNeedYear38TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth38TBox" default="">
	<cfset hcpcLengthOfNeedMonth38TBox = attributes.hcpcLengthOfNeedMonth38TBox>
	
	<cfparam name="attributes.hcpcCode39TBox" default="">
	<cfset hcpcCode39TBox = attributes.hcpcCode39TBox>
	
	<cfparam name="attributes.hcpcQty39TBox" default="">
	<cfset hcpcQty39TBox = attributes.hcpcQty39TBox>
	
	<cfparam name="attributes.hcpcProduct39TBox" default="">
	<cfset hcpcProduct39TBox = attributes.hcpcProduct39TBox>
	
	<cfparam name="attributes.hcpcCost39TBox" default="">
	<cfset hcpcCost39TBox = attributes.hcpcCost39TBox>
	
	<cfparam name="attributes.hcpcDX39TBox" default="">
	<cfset hcpcDX39TBox = attributes.hcpcDX39TBox>
	
	<cfparam name="attributes.hcpcDiagnosis39TBox" default="">
	<cfset hcpcDiagnosis39TBox = attributes.hcpcDiagnosis39TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear39TBox" default="">
	<cfset hcpcLengthOfNeedYear39TBox = attributes.hcpcLengthOfNeedYear39TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth39TBox" default="">
	<cfset hcpcLengthOfNeedMonth39TBox = attributes.hcpcLengthOfNeedMonth39TBox>
	
	<cfparam name="attributes.hcpcCode40TBox" default="">
	<cfset hcpcCode40TBox = attributes.hcpcCode40TBox>
	
	<cfparam name="attributes.hcpcQty40TBox" default="">
	<cfset hcpcQty40TBox = attributes.hcpcQty40TBox>
	
	<cfparam name="attributes.hcpcProduct40TBox" default="">
	<cfset hcpcProduct40TBox = attributes.hcpcProduct40TBox>
	
	<cfparam name="attributes.hcpcCost40TBox" default="">
	<cfset hcpcCost40TBox = attributes.hcpcCost40TBox>
	
	<cfparam name="attributes.hcpcDX40TBox" default="">
	<cfset hcpcDX40TBox = attributes.hcpcDX40TBox>
	
	<cfparam name="attributes.hcpcDiagnosis40TBox" default="">
	<cfset hcpcDiagnosis40TBox = attributes.hcpcDiagnosis40TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedYear40TBox" default="">
	<cfset hcpcLengthOfNeedYear40TBox = attributes.hcpcLengthOfNeedYear40TBox>
	
	<cfparam name="attributes.hcpcLengthOfNeedMonth40TBox" default="">
	<cfset hcpcLengthOfNeedMonth40TBox = attributes.hcpcLengthOfNeedMonth40TBox>
	
	<cfparam name="attributes.msg" default="">
	<cfset msg = attributes.msg>	
	
	<cfif IsDefined("form.msg") AND form.msg NEQ "">
		<cfset msg = form.msg>
	<cfelseif IsDefined("url.msg") AND url.msg NEQ "">
		<cfset msg = url.msg>	
	</cfif>

	<cfif NOT IsNumeric(patientAddressID)>
		<cfset patientAddressID = 0>
	</cfif>
	<cfif NOT IsNumeric(patientPhoneID)>
		<cfset patientPhoneID = 0>
	</cfif>
		
	<cfset clearedStepList = "">
	
	<cfset intakeClearedBy = "">
	<cfset equipmentClearedBy = "">
	<cfset verifyClearedBy = "">
	<cfset physicianClearedBy = "">
	<cfset hcpcClearedBy = "">
	
	<cfset intakeLine = "white">
	<cfset intakeText = "dkGreyText">
	<cfset intakeSpacer = "ltGrey">
	<cfset intakeDiv = "gtd">															

	<cfset equipmentLine = "white">
	<cfset equipmentText = "dkGreyText">	
	<cfset equipmentSpacer = "ltGrey">
	<cfset equipmentDiv = "gtd">															

	<cfset verifyLine = "white">
	<cfset verifyText = "dkGreyText">	
	<cfset verifySpacer = "ltGrey">
	<cfset verifyDiv = "gtd">												

	<cfset physicianLine = "white">
	<cfset physicianText = "dkGreyText">	
	<cfset physicianSpacer = "ltGrey">
	<cfset physicianDiv = "gtd">													

	<cfset hcpcLine = "white">
	<cfset hcpcText = "dkGreyText">		
	<cfset hcpcSpacer = "ltGrey">
	<cfset hcpcDiv = "gtd">	
	
	<cfset isIntakeAdmin = 0>
	
	
<!-------------------------------------------------------------------------------------->
<!--- if the user viewing an admin?                                                 --->
<!-------------------------------------------------------------------------------------->
	<cfif ListContains(session.User.getRoleIDs(), "5") OR ListContains(session.User.getRoleIDs(), "6")>
		<cfset isIntakeAdmin = 1>
	</cfif>		
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the verbiage that the submit button will show.                             --->
<!-------------------------------------------------------------------------------------->
	<cfif active AND IsNumeric(IntakeID) AND (AssignedTouserID EQ session.User.getUsersID() OR isIntakeAdmin)>
		<cfset submitButtonVerbiage="Update&nbsp;Intake">
	<cfelseif active AND NOT IsNumeric(intakeID)>
		<cfset submitButtonVerbiage="Submit&nbsp;Intake&nbsp;Form">
	<cfelse>
		<cfset submitButtonVerbiage="Restore&nbsp;Intake">	
	</cfif>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Setup the tables to show step clearance.                                       --->
<!-------------------------------------------------------------------------------------->
	<cfif IsNumeric(intakeID)>
								
		<cfloop list="#trim(hidden_Step)#" index="i" delimiters="~">
			
			<cfset stepNumber = ListGetAt(i, 1, "|")>								
			
			<cfset clearedStepList = ListAppend(clearedStepList, stepNumber)> 
			
			<cfif stepNumber EQ 1>
				<cfset intakeClearedBy = "<strong>Cleared by:</strong> #ListGetAt(i, 5, '|')# on #ListGetAt(i, 2, '|')# #ListGetAt(i, 3, '|')#">
				<cfset intakeLine = "white">
				<cfset intakeText = "blackText">
				<cfset intakeSpacer = "white">
				<cfset intakeDiv = "percent">
			<cfelseif stepNumber EQ 2>
				<cfset equipmentClearedBy = "<strong>Cleared by:</strong> #ListGetAt(i, 5, '|')# on #ListGetAt(i, 2, '|')# #ListGetAt(i, 3, '|')#">
				<cfset equipmentLine = "white">
				<cfset equipmentText = "blackText">
				<cfset equipmentSpacer = "white">
				<cfset equipmentDiv = "percent">
			<cfelseif stepNumber EQ 3>
				<cfset verifyClearedBy = "<strong>Cleared by:</strong> #ListGetAt(i, 5, '|')# on #ListGetAt(i, 2, '|')# #ListGetAt(i, 3, '|')#">
				<cfset verifyLine = "white">
				<cfset verifyText = "blackText">
				<cfset verifySpacer = "white">
				<cfset verifyDiv = "percent">
			<cfelseif stepNumber EQ 4>
				<cfset physicianClearedBy = "<strong>Cleared by:</strong> #ListGetAt(i, 5, '|')# on #ListGetAt(i, 2, '|')# #ListGetAt(i, 3, '|')#">
				<cfset physicianLine = "white">
				<cfset physicianText = "blackText">
				<cfset physicianSpacer = "white">
				<cfset physicianDiv = "percent">
			<cfelseif stepNumber EQ 5>									
				<cfset hcpcClearedBy = "<strong>Cleared by:</strong> #ListGetAt(i, 5, '|')# on #ListGetAt(i, 2, '|')# #ListGetAt(i, 3, '|')#">
				<cfset hcpcLine = "white">
				<cfset hcpcText = "blackText">
				<cfset hcpcSpacer = "white">
				<cfset hcpcDiv = "percent">
			</cfif>							
			
		</cfloop>
	
	</cfif>
	
											
	
<!-------------------------------------------------------------------------------------->
<!--- If the intakeID exists we have to check to see if the patientXML is available. --->
<!-------------------------------------------------------------------------------------->
	<cfif IsNumeric(intakeID) AND NOT IsNumeric(patientID) AND patientXML NEQ "" AND IsXML(patientXML)>
		<cfset pXML = XMLParse(patientXML)>				
		<cfset patientid = trim(pXML.Patient.patientid.xmlText)>
		<cfset patientaddressid = trim(pXML.Patient.patientaddressid.xmlText)>
		<cfset patientphoneid =trim(pXML.Patient.patientphoneid.xmlText)>
		<cfif NOT ISNumeric(patientID)>
			<cfset patientfnametbox = trim(pXML.Patient.patientfnametbox.xmlText)>
			<cfset patientminitialtbox = trim(pXML.Patient.patientminitialtbox.xmlText)>
			<cfset patientlnametbox = trim(pXML.Patient.patientlnametbox.xmlText)>
			<cfset patientdobmm = trim(pXML.Patient.patientdobmm.xmlText)>
			<cfset patientdobdd = trim(pXML.Patient.patientdobdd.xmlText)>
			<cfset patientdobyy = trim(pXML.Patient.patientdobyy.xmlText)>
			<cfset patientssntbox = trim(pXML.Patient.patientssntbox.xmlText)>		
			<cfif trim(pXML.Patient.option_3a_cbox_patientsexmale.xmlText) NEQ "">
				<cfset option_3a_cbox_patientsex = 0>
			</cfif>	
			<cfif trim(pXML.Patient.option_3a_cbox_patientsexfemale.xmlText) NEQ "">
				<cfset option_3a_cbox_patientsex = 1>
			</cfif>	
			<cfset patientheightinches = trim(pXML.Patient.patientheightinches.xmlText)>
			<cfset patientweighttbox = trim(pXML.Patient.patientweighttbox.xmlText)>		
		</cfif>
		
		<cfset patientaddresstbox = trim(pXML.Patient.patientaddresstbox.xmlText)>
		<cfset patientcitytbox = trim(pXML.Patient.patientcitytbox.xmlText)>
		<cfset patientaddressstateid = trim(pXML.Patient.patientaddressstateid.xmlText)>
		<cfset patientStateTBox = trim(pXML.Patient.patientaddressstateid.xmlText)>		
		<cfset patientziptbox = trim(pXML.Patient.patientziptbox.xmlText)>
		<cfset patientphonetbox = trim(pXML.Patient.patientphonetbox.xmlText)>	
		<cfif StructKeyExists(pXML.Patient, 'patientmaritalstatus') AND pXML.Patient.patientmaritalstatus.xmlText GT "">
			<cfset patientmaritalstatus = trim(pXML.Patient.patientmaritalstatus.xmlText)>	
		</cfif>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- set the addresses of the patient.                                              --->
<!-------------------------------------------------------------------------------------->
	<cfif IsNumeric(patientID)>
		
		<cfset request.Patient = CreateObject("component", "com.common.Patient").init(patientID)>	
		<cfset entityID = request.Patient.getEntityID()>
		<cfset request.Entity = CreateObject("component", "com.common.Entity").init(entityID)>	
		
		<cfset patientfnametbox = trim(request.Entity.getFName())>
		<cfset patientminitialtbox = trim(request.Entity.getMName())>
		<cfset patientlnametbox = trim(request.Entity.getLName())>
		
		<cfif IsDate(request.Entity.getDOB())>
			<cfset patientdobmm = NumberFormat(MONTH(request.Entity.getDOB()), "00")>
			<cfset patientdobdd = NumberFormat(DAY(request.Entity.getDOB()), "00")>
			<cfset patientdobyy = YEAR(request.Entity.getDOB())>
		</cfif>
		
		<cfset patientssntbox = trim(request.Entity.getSSN())>		
		<cfif IsNumeric(trim(request.Entity.getSex()))>
			<cfset option_3a_cbox_patientsex = trim(request.Entity.getSex())>	
		</cfif>
		<cfif IsNumeric(trim(request.Entity.getHeightInInches()))>
			<cfset patientheightinches = trim(request.Entity.getHeightInInches())>
		</cfif>
		<cfif IsNumeric(trim(request.Entity.getWeight()))>
			<cfset patientweighttbox = trim(request.Entity.getWeight())>		
		</cfif>
		
		<cfset patientAddresses = request.Entity.getEntityAddresses(clientID: trim(session.clientID), entityID: entityID, Active: 1)>					
		<cfset patientPhones = request.Entity.getEntityPhones(clientID: trim(session.clientID), entityID: entityID, Active: 1)>		
		
		<cfinvoke component="com.common.PatientInsuranceCompany" method="reorderPrimSecTer" clientID="#trim(session.ClientID)#" patientID="#trim(patientID)#"> 			
	
	</cfif>				
	

	
<!-------------------------------------------------------------------------------------->
<!--- Javascripts needed for this page.                                              --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
			
		<script language="JavaScript">
			var clientid = #trim(session.clientID)#;		
			var formName = '#trim(formName)#';			
			var dateNow = '#DateFormat(NOW(), "mm/dd/yyyy")#';
			var timeNow = '#TimeFormat(NOW(), "hh:mm:ss tt")#';
			var usersID = #trim(session.User.getUsersID())#;
			var usersFName = '#trim(session.Entity.getFName())#'; 
			var usersLName = '#trim(session.Entity.getLName())#';
			var clearedStepList = '#ListLen(clearedStepList)#';
			var intakeID = '#trim(intakeID)#';
			var screenWidth = #trim(session.screenWidth)#;
			var screenHeight = #trim(session.screenHeight)#;
			var urlReconstructed = '#trim(request.urlReconstructed)#';
			var patientAddressID = '#trim(patientAddressID)#';
			var patientPhoneID = '#trim(patientPhoneID)#';
		</script>
		
		<script type="text/javascript" src="scripts/tagFormPatientIntakeForm.js"></script>
						
	</cfoutput>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- If the intake ID is there then we just need to update the intake not verify it --->
<!-------------------------------------------------------------------------------------->
<cfif NOT IsNumeric(IntakeID)>
	<cfset actionPage = "appFormPatientIntakeForm_PreProcess.cfm">
<cfelse>
	<cfset actionPage = "appFormPatientIntakeForm_Process.cfm">	
</cfif>


<cfif IsNumeric(intakeID)>
	<cfif ListLen(trim(printed)) GTE 1>
		<cfset printedBy = "">
		<cfloop list="#trim(printed)#" index="i">
			<cfset printedBy = printedBY & "<strong>Printed by:</strong><br>#ListGetAt(i, 4, '|')# on #ListGetAt(i, 1, '|')# #ListGetAt(i, 2, '|')#<br>">
		</cfloop>
	</cfif>
</cfif>	

	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		
		<cfif msg NEQ "">
			<cfoutput>
				<p><font face="Verdana" size="4" color="FF0000">#trim(msg)#</font></p>			
			</cfoutput>
		</cfif>
			
		<a name="1"></a>								
		<form name="#trim(formName)#" action="#trim(actionPage)#" method="post" onsubmit="return validateForm();">
					
			<input type="Hidden" name="autoSaveOn" value="0">		
			<input type="Hidden" name="intakeAutoSaveID" value="#trim(intakeAutoSaveID)#">
			<input type="Hidden" name="clientID" id="clientID" value="#trim(session.ClientID)#">
			<input type="Hidden" name="userID" id="userID" value="#trim(session.User.getUsersID())#">
			<input type="Hidden" name="urlReconstructed" id="urlReconstructed" value="#trim(request.urlReconstructed)#">
			<input type="Hidden" name="PatientID" value="#trim(PatientID)#">
			<input type="Hidden" name="PatientAddressID" value="#trim(PatientAddressID)#">
			<input type="Hidden" name="PatientPhoneID" value="#trim(PatientPhoneID)#">
			<input type="Hidden" name="allowClearVerify" value="0">
			<input type="Hidden" name="badAddress" value="0">
			
					
			<table width=750 border="0" cellpadding="0" cellspacing="0"> 
				<tr>
				   	<td style="padding-top:8px; padding-bottom:8px;">
						&nbsp;&nbsp;<font color="c0c0c0" face="Arial" size="3"><strong>PATIENT&nbsp;INTAKE&nbsp;FORM
						<span id="sp_IntakeID"><cfif IsNumeric(intakeID)>&nbsp;ID:&nbsp;#trim(intakeID)#</cfif></span><cfif InactiveCode EQ 298>&nbsp;[PENDING]</cfif>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfif NOT Active>STATUS: CANCELLED</cfif></strong></font>						
					</td>
				    <td colspan="2" align="right" style="padding-top:10px;padding-right:15px;">
						<cfif NOT Isnumeric(intakeID)><input type="reset" class="SiteSubmitbox" value="Clear&nbsp;Form"></cfif>
						<cfif IsNumeric(intakeID)>							
							<cfif IsDefined("printedBy")>
								&nbsp;&nbsp;&nbsp;<span class="siteLabel" style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, '#trim(printedBy)#');" onmouseout="hideTip(this);"><u>Printed</u></span>
							</cfif>
							&nbsp;&nbsp;&nbsp;<input type="button" class="SiteSubmitbox" value="Print&nbsp;Hard&nbsp;Copy" onclick="printIntake_JS();">
							<!---&nbsp;&nbsp;&nbsp;<input type="button" class="SiteSubmitbox" value="Print&nbsp;Intake&nbsp;Quote" onclick="printQuote_JS();">--->
							
							<!--- Show Reassignment --->
							<cfif ListLen(clearedStepList) GTE 5>
								&nbsp;&nbsp;&nbsp;<input type="button" class="SiteSubmitbox" value="Re-assign&nbsp;To&nbsp;Manager" onclick="if(allowClose()){intakeAutoAssignToManager();};">
							</cfif>
							
							<cfif ListContains(session.User.getRoleIDs(), "5") GTE 1 OR ListContains(session.User.getRoleIDs(), "6") GTE 1>
								<cfif Active>
									&nbsp;&nbsp;&nbsp;<input type="button" class="SiteSubmitbox" value="Cancel&nbsp;Intake" onclick="cancelQuote_JS();">
								<cfelseif NOT Active>
									&nbsp;&nbsp;&nbsp;<input type="button" class="SiteSubmitbox" value="Restore&nbsp;Intake" onclick="restoreIntake_JS();">
								</cfif>
							</cfif>
							
						</cfif>
						&nbsp;&nbsp;&nbsp;<input type="button" class="SiteSubmitBox" value="Back" onclick="history.back()">
					</td>							   
				</tr>
				<tr>						
					<td class="siteLabel" colspan="2" style="padding-top:8px; padding-bottom:8px;">
						&nbsp;&nbsp;<span style=cursor:hand class=siteLabel onclick="location.href='appPatientIntakeSearch.cfm?clear=1'"><u>Search&nbsp;Intakes</u></span>&nbsp;|
						<cfif IsNumeric(intakeID)>
							<cfinvoke component="com.common.note" method="getNumberOfNotes" clientID="#trim(session.ClientID)#" objectID="8" instanceID="#trim(intakeID)#" returnvariable="numOfNotes">  
							<span class="siteLabel" style="cursor:hand" onclick="createViewNotes();">
								&nbsp;<u>View/Add&nbsp;Intake&nbsp;Notes</u> (#trim(numOfNotes)#)
							</span>							
						<cfelse>
							<span class="siteLabel" style="cursor:hand" onclick="createNote();">
								&nbsp;<u>Add&nbsp;Intake&nbsp;Note</u>
							</span>
						</cfif>
						<span class="siteLabel" style="cursor:hand;" onclick="searchPatientOpenClose();">&nbsp;|&nbsp;<u>Search&nbsp;Patients</u></span>
						<span class="siteLabel" style="cursor:hand;" onclick="createTask();">&nbsp;|&nbsp;<u>Create&nbsp;Task</u></span>
						&nbsp;&nbsp;<span id="last_auto" class="siteLabel"></span>
					</td>
					<td colspan="1" align="right" valign="top">
						
						<cfif IsNumeric(intakeID)>
																								

							<table border="0" cellspacing="0" cellpadding="0" class="tableIntake" width="100%">
								<tr>
									<td align="right" style="padding-top:10px;padding-right:15px;">
										<table border="0" cellspacing="0" cellpadding="0" class="tableIntake">
											<tr class="title">											
												
												<td class="#trim(intakeLine)#"><div class="spacer">&nbsp;</div></td>
												<td class="#trim(intakeText)#" width="50" align="center"><span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, 'This step is complete when an initial intake entry is submitted to be saved.');" onmouseout="hideTip(this);">Intake</span>&nbsp;</td>												
												
												<td class="#trim(equipmentLine)#"><div class="spacer">&nbsp;</div></td>
												<td class="#trim(equipmentText)#" width="50" align="center"><span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, 'This step is complete when pateint has been asked of prior equipment and prior equipment fields are completed as necessary.');" onmouseout="hideTip(this);">Equipment</span>&nbsp;</td>
												
												<td class="#trim(verifyLine)#"><div class="spacer">&nbsp;</div></td>
												<td class="#trim(verifyText)#" width="50" align="center"><span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, 'This step is complete when insurance has been verified.');" onmouseout="hideTip(this);">Verify</span>&nbsp;</td>
												
												<td class="#trim(physicianLine)#"><div class="spacer">&nbsp;</div></td>
												<td class="#trim(physicianText)#" width="50" align="center"><span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, 'This step is complete when the patient\'s doctor has been contacted to complete a Certificate of Medical Necessity.');" onmouseout="hideTip(this);">Physician</span>&nbsp;</td>									
												
												<td class="#trim(hcpcLine)#"><div class="spacer">&nbsp;</div></td>
												<td class="#trim(hcpcText)#" width="50" align="center"><span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, 'This step is complete when the accurate HCPC codes have been entered for each procedure.');" onmouseout="hideTip(this);">HCPC</span>&nbsp;</td>														
												
											</tr>
											<tr class="title">
												
												<td class="#trim(intakeSpacer)#"><div class="spacer">&nbsp;</div></td>
												<td><div style="width:100%; height:13px;" class="#trim(intakeDiv)#" <cfif trim(intakeClearedBy) NEQ "">onmouseover="doTooltip(1, this, event, '#trim(intakeClearedBy)#');" onmouseout="hideTip(this);"</cfif>></div></td>
												
												<td class="#trim(equipmentSpacer)#"><div class="spacer">&nbsp;</div></td>
												<td><div style="width:100%; height:13px;" class="#trim(equipmentDiv)#" <cfif trim(equipmentClearedBy) NEQ "">onmouseover="doTooltip(1, this, event, '#trim(equipmentClearedBy)#');" onmouseout="hideTip(this);"</cfif>></div></td>
																								
												<td class="#trim(verifySpacer)#"><div class="spacer">&nbsp;</div></td>
												<td><div style="width:100%; height:13px;" class="#trim(verifyDiv)#" <cfif trim(verifyClearedBy) NEQ "">onmouseover="doTooltip(1, this, event, '#trim(verifyClearedBy)#');" onmouseout="hideTip(this);"</cfif>></div></td>		
												
												<td class="#trim(physicianSpacer)#"><div class="spacer">&nbsp;</div></td>
												<td><div style="width:100%; height:13px;" class="#trim(physicianDiv)#" <cfif trim(physicianClearedBy) NEQ "">onmouseover="doTooltip(1, this, event, '#trim(physicianClearedBy)#');" onmouseout="hideTip(this);"</cfif>></div></td>
												
												<td class="#trim(hcpcSpacer)#"><div class="spacer">&nbsp;</div></td>
												<td><div style="width:100%; height:13px;" class="#trim(hcpcDiv)#" <cfif trim(hcpcClearedBy) NEQ "">onmouseover="doTooltip(1, this, event, '#trim(hcpcClearedBy)#');" onmouseout="hideTip(this);"</cfif>></div></td>
																								
											</tr>										
											
										</table>
									</td>
								</tr>
							</table>							
							
						<cfelse>
							&nbsp;
						</cfif>	
						
					</td>
				</tr>
				
				<cfif ListLen(clearedStepList) GTE 5>
					<tr>
						<td colspan="3" nowrap class="siteRequiredLabel">
							<span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, 'Close Intake by supplying an invoice number that has been provided by the system which will keep track of the intake.');" onmouseout="hideTip(this);">&nbsp;Closing Invoice Number:</span> <input type="Text" size="15" maxlength="20" name="closingInvoiceNumber" value="#trim(closingInvoiceNumber)#" class="siteTextBox" onblur="if(this.value != ''){if(!allowClose()){this.value = '';};}">
						</td>
					</tr>
				</cfif>
							
				<cfif NOT Isnumeric(intakeID)>
					<tr id="tr_newIntakeNote" style="display:none">
						<td colspan="3" nowrap align="center"><cf_gcHTMLNoteEditor identifier="100" form_name="#trim(formName)#" field_name="note" editWidthPercent="50" editHeight="35" verbage=""></td>
					</tr>
				</cfif>
				<tr>
					<td colspan="3" nowrap align="center"><br></td>
				</tr>
				<tr id="tr_errorMsg" style="display:none">
					<td colspan="3" align="center">
						<div id="yellowAlert" class="yecerrbg" style="display:block">
							<table cellpadding="2" cellspacing="0" border="0" width="540">
								<tr valign="top">
									<td>
										<img src="images/alert.gif" alt="Alert" border="0" width="41" height="42" align="middle">
									</td>
									<td valign="top" class="siteLabel">
										<b>Please correct the following entries.</b>
										<ul>
											<span id="sp_errorMsg"></span>										
							 			</ul>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				
				<tr>
					<td colspan="3" nowrap align="center"><br></td>
				</tr>
				<tr>
					
					<cfif IsNumeric(trim(hidden_UsersID))>
						<cfquery name="getUserName" datasource="#trim(request.datasource)#">
							SELECT FName, LName
							FROM view_UserAccountParameters 
							WHERE UsersID = #trim(hidden_UsersID)#
						</cfquery>					
						<cfset empFName = trim(getUserName.FName)>
						<cfset empLName = trim(getUserName.LName)>
					<cfelse>
						<cfset empFName = trim(session.Entity.getFName())>
						<cfset empLName = trim(session.Entity.getLName())>
					</cfif>
					
					<input type="Hidden" name="intakeID" value="#trim(intakeID)#">
					<input type="Hidden" name="hidden_Step_OLD" value="#trim(hidden_Step)#">
					<input type="Hidden" name="hidden_UsersID" value="#session.User.getUsersID()#">
					<input type="Hidden" name="hidden_TimeStart" value="#hidden_TimeStart#">
					<td nowrap class="siteLabel" align="center">DATE:<u>&nbsp;&nbsp;&nbsp;&nbsp;<cfif IsDate(DateCreated)>#DateFormat(DateCreated, 'mm/dd/yyyy')#<cfelse>#DateFormat(NOW(), 'mm/dd/yyyy')#</cfif>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
					<td nowrap class="siteLabel" align="center">TIME:<u>&nbsp;&nbsp;&nbsp;&nbsp;<cfif hidden_TimeStart NEQ "">#trim(hidden_TimeStart)#<cfelse>#TimeFormat(NOW(), 'hh:mm:ss')#</cfif>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
					<td nowrap class="siteLabel" align="center">EMPLOYEE:<u>&nbsp;&nbsp;&nbsp;&nbsp;#trim(empFName)#&nbsp;#trim(empLName)#&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
				</tr>				
				<tr>
					<td colspan="3" nowrap align="center" width="100%">
						<table align="center" cellspacing="0" cellpadding="4" border="0" width="100%">
							<tr>
							    <td align="center" colspan="10" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">&nbsp;</td>
							</tr>							
							
							<tr>
							    <td bgcolor="DCE3EB" align="left" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
									<input type="button" id="Delivery" class="SiteSubmitbox" style="display: 'inline';" value="#trim(submitButtonVerbiage)#" onclick="submitFunction(this, #trim(Active)#, #trim(formName)#);"><span id="spSubmitButtonDelivery" class="TextWarning" style="font-size: x-small;"></span><span id="spSubmitButtonDeliveryLogo" style="display:inline"></span>
								</td>
								<td bgcolor="DCE3EB" align="center" colspan="6" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">
									<font face="Arial" size="2"><strong>DELIVERY&nbsp;METHOD</strong></font>			
								</td>
							</tr>		
								
								
							<script language="JavaScript">						
								function checkDelivery(sel){										
									if((event.type == "keydown" || event.type == "keypress") && (event.keyCode=="32" || event.keyCode=="96")){									
										if(sel == 1){checkBoxRadio('td_delivery', 'CheckUncheckPic_1', 'OPTION_1_CBox_Delivery');}
										else if(sel == 2){checkBoxRadio('td_delivery', 'CheckUncheckPic_1', 'OPTION_1_CBox_Pickup');}	
										else if(sel == 3){checkBoxRadio('td_delivery', 'CheckUncheckPic_1', 'OPTION_1_CBox_Repair');}	
										else if(sel == 4){checkBoxRadio('td_delivery', 'CheckUncheckPic_1', 'OPTION_1_CBox_Switch');}	
										else if(sel == 5){checkBoxRadio('td_delivery', 'CheckUncheckPic_1', 'OPTION_1_CBox_Existing');}									
										window.event.returnValue = false;						
									};									
								};
							</script>	
							<tr>
							    <td id="td_delivery" style="background-color:ffffcc" align="center" colspan="7" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
									<input type="Hidden" name="OPTION_1_CBox_Delivery" value="">
									<input type="Hidden" name="OPTION_1_CBox_Pickup" value="">
									<input type="Hidden" name="OPTION_1_CBox_Repair" value="">
									<input type="Hidden" name="OPTION_1_CBox_Switch" value="">
									<input type="Hidden" name="OPTION_1_CBox_Existing" value="">
									
									<img tabindex="1" src="images/Checkbox1.gif" name="CheckUncheckPic_1" alt="OPTION_1_CBox_Delivery" onkeypress="checkDelivery(1);" onclick="checkBoxRadio('td_delivery', 'CheckUncheckPic_1', 'OPTION_1_CBox_Delivery')">&nbsp;DELIVERY
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<img tabindex="1" src="images/Checkbox1.gif" name="CheckUncheckPic_1" alt="OPTION_1_CBox_Pickup" onkeypress="checkDelivery(2);" onclick="checkBoxRadio('td_delivery', 'CheckUncheckPic_1', 'OPTION_1_CBox_Pickup')">&nbsp;PICKUP
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<img tabindex="1" src="images/Checkbox1.gif" name="CheckUncheckPic_1" alt="OPTION_1_CBox_Repair" onkeypress="checkDelivery(3);" onclick="checkBoxRadio('td_delivery', 'CheckUncheckPic_1', 'OPTION_1_CBox_Repair')">&nbsp;REPAIR
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<img tabindex="1" src="images/Checkbox1.gif" name="CheckUncheckPic_1" alt="OPTION_1_CBox_Switch" onkeypress="checkDelivery(4);" onclick="checkBoxRadio('td_delivery', 'CheckUncheckPic_1', 'OPTION_1_CBox_Switch')">&nbsp;SWITCH
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<img tabindex="1" src="images/Checkbox1.gif" name="CheckUncheckPic_1" alt="OPTION_1_CBox_Existing" onkeypress="checkDelivery(5);" onclick="checkBoxRadio('td_delivery', 'CheckUncheckPic_1', 'OPTION_1_CBox_Existing')">&nbsp;EXISTING
								
								</td>
							</tr>							
							<script language="JavaScript">	
								if(#trim(OPTION_1_CBox_Delivery)# == 1){checkBoxRadio('td_delivery', 'CheckUncheckPic_1', 'OPTION_1_CBox_Delivery')}				
								else if(#trim(OPTION_1_CBox_Pickup)# == 1){checkBoxRadio('td_delivery', 'CheckUncheckPic_1', 'OPTION_1_CBox_Pickup')}
								else if(#trim(OPTION_1_CBox_Repair)# == 1){checkBoxRadio('td_delivery', 'CheckUncheckPic_1', 'OPTION_1_CBox_Repair')}
								else if(#trim(OPTION_1_CBox_Switch)# == 1){checkBoxRadio('td_delivery', 'CheckUncheckPic_1', 'OPTION_1_CBox_Switch')}
								else if(#trim(OPTION_1_CBox_Existing)# == 1){checkBoxRadio('td_delivery', 'CheckUncheckPic_1', 'OPTION_1_CBox_Existing')}						
							
								function checkOption2(){
									if(document.#formName#.hospiceTBox.value != '' || document.#formName#.otherTBox.value != '' || document.#formName#.hospitalTBox.value != ''){
										document.#formName#.hospiceTBox.style.backgroundColor='ffffff'
										document.#formName#.hospitalTBox.style.backgroundColor='ffffff'
										document.#formName#.otherTBox.style.backgroundColor='ffffff'
									}
									else{
										document.#formName#.hospiceTBox.style.backgroundColor='ffffcc'
										document.#formName#.otherTBox.style.backgroundColor='ffffcc'
										document.#formName#.hospitalTBox.style.backgroundColor='ffffcc'
									};													
								};							
							</script>								
							
							
							<script language="JavaScript">						
								function checkHospice(sel){										
									if((event.type == "keydown" || event.type == "keypress") && (event.keyCode=="32" || event.keyCode=="96")){									
										if(sel == 1){checkBoxRadio('', 'CheckUncheckPic_2', 'OPTION_2_CBox_Other');}
										else if(sel == 2){checkBoxRadio('', 'CheckUncheckPic_2', 'OPTION_2_CBox_Hospice');}	
										else if(sel == 3){checkBoxRadio('', 'CheckUncheckPic_2', 'OPTION_2_CBox_Hospital');}															
										window.event.returnValue = false;						
									};									
								};
							</script>	
							<tr>
								<input type="Hidden" name="OPTION_2_CBox_Other" value="">
								<input type="Hidden" name="OPTION_2_CBox_Hospice" value="">		
								<input type="Hidden" name="OPTION_2_CBox_Hospital" value="">							   
							    <td id="td_otherTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;"><img tabindex="2" src="images/Checkbox1.gif" name="CheckUncheckPic_2" alt="OPTION_2_CBox_Other" onkeypress="checkHospice(1);" onclick="checkBoxRadio('', 'CheckUncheckPic_2', 'OPTION_2_CBox_Other')">&nbsp;OTHER:&nbsp;<input tabindex="3" type="Text" size="35" maxlength="45" name="otherTBox" class="siteTextBox" value="#trim(otherTBox)#" onblur="checkOption2();"></td>
							    <td id="td_hospiceTBox" colspan="4" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;"><img tabindex="4" src="images/Checkbox1.gif" name="CheckUncheckPic_2" alt="OPTION_2_CBox_Hospice" onkeypress="checkHospice(2);" onclick="checkBoxRadio('', 'CheckUncheckPic_2', 'OPTION_2_CBox_Hospice')">&nbsp;HOSPICE:&nbsp;<input tabindex="5" type="Text" size="35" maxlength="45" name="hospiceTBox" class="siteTextBox" value="#trim(hospiceTBox)#" onblur="checkOption2();"></td>
							</tr>
							
							<script language="JavaScript">						
								function checkInsurance(sel){										
									if((event.type == "keydown" || event.type == "keypress") && (event.keyCode=="32" || event.keyCode=="96")){									
										if(sel == 1){checkBoxRadio('td_typeOfInsurance', 'CheckUncheckPic_3', 'OPTION_3_CBox_Medicare');}
										else if(sel == 2){checkBoxRadio('td_typeOfInsurance', 'CheckUncheckPic_3', 'OPTION_3_CBox_PrivateInsurance');}	
										else if(sel == 3){checkBoxRadio('td_typeOfInsurance', 'CheckUncheckPic_3', 'OPTION_3_CBox_Medicaid');}		
										else if(sel == 4){checkBoxRadio('td_typeOfInsurance', 'CheckUncheckPic_3', 'OPTION_3_CBox_PrivatePay');}															
										window.event.returnValue = false;						
									};									
								};
							</script>																    
							<tr>
							    <input type="Hidden" name="OPTION_3_CBox_Medicare" value="">
								<input type="Hidden" name="OPTION_3_CBox_PrivateInsurance" value="">		
								<input type="Hidden" name="OPTION_3_CBox_Medicaid" value="">
								<input type="Hidden" name="OPTION_3_CBox_PrivatePay" value="">			
								<td id="td_hospitalTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;"><img tabindex="6" src="images/Checkbox1.gif" name="CheckUncheckPic_2" alt="OPTION_2_CBox_Hospital" onkeypress="checkHospice(3);" onclick="checkBoxRadio('', 'CheckUncheckPic_2', 'OPTION_2_CBox_Hospital')">&nbsp;FACILITY\HOSPITAL:&nbsp;<input tabindex="7" type="Text" size="35" maxlength="45" name="hospitalTBox" class="siteTextBox" value="#trim(hospitalTBox)#" onblur="checkOption2();"></td>
							    <td id="td_typeOfInsurance" style="background-color:ffffcc" colspan="4" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
									<img tabindex="7" src="images/Checkbox1.gif" name="CheckUncheckPic_3" alt="OPTION_3_CBox_Medicare" onkeypress="checkInsurance(1);" onclick="checkBoxRadio('td_typeOfInsurance', 'CheckUncheckPic_3', 'OPTION_3_CBox_Medicare'); sp_typeOfPayment.style.display = 'none';">&nbsp;MEDICARE&nbsp;&nbsp;
									<img tabindex="8" src="images/Checkbox1.gif" name="CheckUncheckPic_3" alt="OPTION_3_CBox_PrivateInsurance" onkeypress="checkInsurance(2);" onclick="checkBoxRadio('td_typeOfInsurance', 'CheckUncheckPic_3', 'OPTION_3_CBox_PrivateInsurance'); sp_typeOfPayment.style.display = 'none';">&nbsp;PRIVATE&nbsp;INSURANCE&nbsp;&nbsp;
									<img tabindex="9" src="images/Checkbox1.gif" name="CheckUncheckPic_3" alt="OPTION_3_CBox_Medicaid" onkeypress="checkInsurance(3);" onclick="checkBoxRadio('td_typeOfInsurance', 'CheckUncheckPic_3', 'OPTION_3_CBox_Medicaid'); sp_typeOfPayment.style.display = 'none';">&nbsp;MEDICAID&nbsp;&nbsp;
									<img tabindex="10" src="images/Checkbox1.gif" name="CheckUncheckPic_3" alt="OPTION_3_CBox_PrivatePay" onkeypress="checkInsurance(4);" onclick="checkBoxRadio('td_typeOfInsurance', 'CheckUncheckPic_3', 'OPTION_3_CBox_PrivatePay'); sp_typeOfPayment.style.display = '';">&nbsp;PRIVATE&nbsp;PAY
								</td>
							</tr>
							
							<script language="JavaScript">	
								if(#trim(OPTION_2_CBox_Other)# == 1){checkBoxRadio('', 'CheckUncheckPic_2', 'OPTION_2_CBox_Other')}				
								else if(#trim(OPTION_2_CBox_Hospice)# == 1){checkBoxRadio('', 'CheckUncheckPic_2', 'OPTION_2_CBox_Hospice')}
								else if(#trim(OPTION_2_CBox_Hospital)# == 1){checkBoxRadio('', 'CheckUncheckPic_2', 'OPTION_2_CBox_Hospital')}	
								
								if(#trim(OPTION_3_CBox_Medicare)# == 1){checkBoxRadio('td_typeOfInsurance', 'CheckUncheckPic_3', 'OPTION_3_CBox_Medicare')}				
								else if(#trim(OPTION_3_CBox_PrivateInsurance)# == 1){checkBoxRadio('td_typeOfInsurance', 'CheckUncheckPic_3', 'OPTION_3_CBox_PrivateInsurance')}
								else if(#trim(OPTION_3_CBox_Medicaid)# == 1){checkBoxRadio('td_typeOfInsurance', 'CheckUncheckPic_3', 'OPTION_3_CBox_Medicaid')}		
								else if(#trim(OPTION_3_CBox_PrivatePay)# == 1){checkBoxRadio('td_typeOfInsurance', 'CheckUncheckPic_3', 'OPTION_3_CBox_PrivatePay')}													
							</script>	
							
							<cfif trim(OPTION_3_CBox_PrivatePay) EQ 1>
								<cfset sp_typeOfPay = "inline">
							<cfelse>
								<cfset sp_typeOfPay = "none">
							</cfif>
							
							<tr>							  		
								<td id="td_anticipatedDate" nowrap colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">&nbsp;DISCHARGE&nbsp;DATE:&nbsp;&nbsp;<input tabindex="12" type="Text" name="DischargeDateMM" value="#trim(DischargeDateMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox" value="" onblur="checkMonth_JS(this);">&nbsp;/&nbsp;<input tabindex="15" type="Text" name="DischargeDateDD" value="#trim(DischargeDateDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox" value="" onblur="checkDay_JS(this);">&nbsp;/&nbsp;<input tabindex="18" type="Text" name="DischargeDateYY" value="#trim(DischargeDateYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox" value="" onblur="checkYear_JS(this);">&nbsp;&nbsp;&nbsp;ROOM##:&nbsp;<input tabindex="19" type="Text" size="5" maxlength="5" name="roomNumberTBox" value="#trim(roomNumberTBox)#" class="siteTextBox">&nbsp;BED##:&nbsp;<input tabindex="20" type="Text" size="5" maxlength="5" name="bedNumberTBox" value="#trim(bedNumberTBox)#" class="siteTextBox"></td>
							    <td id="td_typeOfPay" colspan="4" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 1px solid; border-color: 000000;"><span id="sp_typeOfPayment" style="display='#trim(sp_typeOfPay)#'"><input type="Radio" name="typeOfPay_Radio" <cfif typeOfPay_Radio EQ "Cash">Checked</cfif> value="Cash">Cash&nbsp;&nbsp;<input type="Radio" name="typeOfPay_Radio" value="Check" <cfif typeOfPay_Radio EQ "Check">Checked</cfif>>Check&nbsp;&nbsp;<input type="Radio" name="typeOfPay_Radio" value="CreditCard" <cfif typeOfPay_Radio EQ "CreditCard">Checked</cfif>>Credit Card&nbsp;&nbsp;<input type="Radio" name="typeOfPay_Radio" value="BillAcct" <cfif typeOfPay_Radio EQ "BillAcct">Checked</cfif>>Bill To Account&nbsp;&nbsp;</span>&nbsp;</td>
							</tr>
							<tr>
							    <td align="center" colspan="7" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">&nbsp;</td>
							</tr>	
							
							
							
							
							<!---CUSTOMER INFORMATION--->
							<tr>								
								<td colspan="7" align="center">
									<span id="spCheckIntakeExists" class="TextWarning" style="font-size: medium;"></span>
								</td>
							</tr>	
							<tr>
							    <td bgcolor="DCE3EB" align="left" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
									<input type="button" id="Customer" class="SiteSubmitbox" style="display: 'inline';" value="#trim(submitButtonVerbiage)#" onclick="submitFunction(this, #trim(Active)#, #trim(formName)#);"><span id="spSubmitButtonCustomer" class="TextWarning" style="font-size: x-small;"></span><span id="spSubmitButtonCustomerLogo" style="display:inline"></span>
								</td>
								<td align="center" bgcolor="DCE3EB" colspan="6" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">
									<font face="Arial" size="2"><strong>CUSTOMER&nbsp;INFORMATION</strong></font>
								</td>
							</tr>						
							<tr>														   
							    <td id="td_callerNameTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">
									&nbsp;CALLER&nbsp;FIRST:&nbsp;<input tabindex="21" type="Text" size="15" maxlength="45" name="callerFNameTBox" onChange="capitalizeMe(this)" value="#trim(callerFNameTBox)#" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};checkIntakeExists();">&nbsp;M:&nbsp;<input tabindex="22" type="Text" size="1" maxlength="1" name="callerMInitialTBox" value="#trim(callerMInitialTBox)#" onChange="capitalizeMe(this)" class="siteTextBox">&nbsp;LAST:&nbsp;&nbsp;<input tabindex="23" type="Text" size="15" maxlength="45" name="callerLNameTBox" onChange="capitalizeMe(this)" value="#trim(callerLNameTBox)#" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};checkIntakeExists();">
								</td>
							    <td id="td_callerPhoneTBox" colspan="4" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;CALLER&nbsp;PHONE:&nbsp;<input tabindex="24" type="Text" size="45" maxlength="24" name="callerPhoneTBox" value="#trim(callerPhoneTBox)#" class="siteTextBox" onkeyup="this.value=formatPhoneUS_JS(this.value);" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};"></td>
							</tr>								    
							<tr>
							    <td id="td_patientNameTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">
								&nbsp;<span id="spPatient">PATIENT</span>&nbsp;FIRST:&nbsp;<input tabindex="27" type="Text" size="15" maxlength="45" name="patientFNameTBox" onChange="capitalizeMe(this)" value="#trim(patientFNameTBox)#" class="siteTextBox" onkeyup="keyUpPatient(this);" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'}; allowSave();">&nbsp;M:&nbsp;<input tabindex="28" type="Text" size="1" maxlength="1" name="patientMInitialTBox" onChange="capitalizeMe(this)" value="#trim(patientMInitialTBox)#" class="siteTextBox">&nbsp;LAST:&nbsp;<input tabindex="29" type="Text" size="15" maxlength="45" name="patientLNameTBox" onChange="capitalizeMe(this)" value="#trim(patientLNameTBox)#" class="siteTextBox" onkeyup="keyUpPatient(this);" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'}; allowSave();"><!---<span id="changePatient" style="visibility:hidden">&nbsp;&nbsp;<input type="Button" onclick="changePatient();" class="SiteSubmitbox" value="Change"></span>---></td>
							    <td nowrap id="td_patientDOB" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 0px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
									&nbsp;DOB:&nbsp;&nbsp;<input tabindex="30" type="Text" name="patientDOBMM" value="#trim(patientDOBMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox" onblur="checkMonth_JS(this); if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'}; allowSave();">&nbsp;/&nbsp;<input tabindex="30" type="Text" name="patientDOBDD" value="#trim(patientDOBDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox" onblur="checkDay_JS(this); if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'}; allowSave();">&nbsp;/&nbsp;<input tabindex="30" type="Text" name="patientDOBYY" value="#trim(patientDOBYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox" onblur="checkYear_JS(this); if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'}; checkIntakeExists(); allowSave();">
								</td>
								<td id="td_patientSSNTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
									&nbsp;SSN:&nbsp;<input tabindex="34" type="Text" size="13" maxlength="13" name="patientSSNTBox" value="#trim(patientSSNTBox)#" class="siteTextBox" onkeyup="this.value=formatSSN_JS(this.value);" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};">
								</td>
							</tr>
							
							<script language="JavaScript">						
								function checkSex(mf){										
									if((event.type == "keydown" || event.type == "keypress") && (event.keyCode=="32" || event.keyCode=="96")){									
										if(mf == 0){
											checkBoxRadio('td_patientSex', 'CheckUncheckPic_3a', 'OPTION_3a_CBox_PatientSexMale');											
										}
										else if(mf == 1){
											checkBoxRadio('td_patientSex', 'CheckUncheckPic_3a', 'OPTION_3a_CBox_PatientSexFemale');
										};	
										window.event.returnValue = false;						
									};									
								};
							</script>
							
							<!--- Marital Status --->							  
							<cfset getAllMaritalStatuses = application.beanFactory.getBean('StandardListItemIO').getStandardListItemQuery(fields: 'StandardListItemID, ItemNameDisplay', listid: '25', active: '1') />
								
							<script language="JavaScript">
								function changeSelColorMarital(temp){
									if(temp == ''){
										document.all.patientMaritalStatus.style.backgroundColor = 'ffffcc';
									}
									else{
										document.all.patientMaritalStatus.style.backgroundColor = 'ffffff';
									}	
								}
							</script>
							<input type="Hidden" name="OPTION_3a_CBox_PatientSexMale" value="">
							<input type="Hidden" name="OPTION_3a_CBox_PatientSexFemale" value="">	
							<tr>							  		
								<td id="td_patientSex" colspan="3" style="background-color:ffffcc" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">
									SEX:&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_3a" alt="OPTION_3a_CBox_PatientSexMale" tabindex="35" onkeypress="checkSex(0);" onclick="checkBoxRadio('td_patientSex', 'CheckUncheckPic_3a', 'OPTION_3a_CBox_PatientSexMale');">
									&nbsp;M&nbsp;&nbsp;
									<img src="images/Checkbox1.gif" tabindex="36" name="CheckUncheckPic_3a" alt="OPTION_3a_CBox_PatientSexFemale" onkeypress="checkSex(1);" onclick="checkBoxRadio('td_patientSex', 'CheckUncheckPic_3a', 'OPTION_3a_CBox_PatientSexFemale');">&nbsp;F&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									MARITAL&nbsp;STATUS:&nbsp;<select class="SiteSelectBox" name="patientMaritalStatus" onchange="changeSelColorMarital(this.selectedIndex);">
										<option value="">
										<cfloop query="getAllMaritalStatuses">											
											<option value="#trim(StandardListItemID)#" <cfif trim(patientMaritalStatus) EQ StandardListItemID>SELECTED</cfif>>#ItemNameDisplay#
										</cfloop>														
									</select>
								</td>
								<td id="td_patientHeight" colspan="1" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;HEIGHT:&nbsp;&nbsp;<input tabindex="36" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" type="Text" name="patientHeightInches" value="#trim(patientHeightInches)#" size="2" maxlength="2" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};">&nbsp;in&nbsp;inches.&nbsp;</td>
								<td id="td_patientWeightTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;WEIGHT:&nbsp;<input tabindex="37" type="Text" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="3" name="patientWeightTBox" value="#trim(patientWeightTBox)#" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};">&nbsp;lbs.</td>
							</tr>						
							<script language="JavaScript">	
								if(#trim(OPTION_3a_CBox_PatientSex)# == 0){checkBoxRadio('td_patientSex', 'CheckUncheckPic_3a', 'OPTION_3a_CBox_PatientSexMale')}				
								else if(#trim(OPTION_3a_CBox_PatientSex)# == 1){checkBoxRadio('td_patientSex', 'CheckUncheckPic_3a', 'OPTION_3a_CBox_PatientSexFemale')}
							</script>
							
							<cfif IsNumeric(PatientID)>
								<cfset tr_patientAddressPhoneSelectView = "inline">
							<cfelse>
								<cfset tr_patientAddressPhoneSelectView = "none">	
							</cfif> 
							<tr id="tr_patientAddressPhoneSelect" style="display:#trim(tr_patientAddressPhoneSelectView)#">							  		
								<td id="td_patientAddressIDSelect" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">
									&nbsp;ADDRESS:&nbsp;
									<select class="siteSelectBox" name="patientAddressIDSelect" id="id_patientAddressIDSelect" onchange="changePatientAddressID(this.selectedIndex);"></select><span id="sp_patientAddressIDSelect"></span>									
								</td>
								<td id="td_patientPhoneIDSelect" colspan="4" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
									&nbsp;PHONE:&nbsp;
									<select class="siteSelectBox" name="patientPhoneIDSelect" id="id_patientPhoneIDSelect" onchange="changePatientPhoneID(this.selectedIndex);"></select><span id="sp_patientPhoneIDSelect"></span>										
								</td>
							</tr>
							
							
							<tr id="tr_patientAddress" style="display:inline">							  		
								<td id="td_patientAddressTBox" colspan="7" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;PATIENT&nbsp;ADDRESS:&nbsp;<input tabindex="38" type="Text" name="patientAddressTBox" value="#trim(patientAddressTBox)#" size="100" maxlength="75" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};"></td>
							</tr>							
							<script language="JavaScript">
								function changeSelColor(temp){
									if(temp == ''){
										document.all.patientAddressStateID.style.backgroundColor = 'ffffcc';
									}
									else{
										document.all.patientAddressStateID.style.backgroundColor = 'ffffff';
									}	
								}								
							</script>							
							<tr id="tr_patientAddressPhone" style="display:inline">
							    <td id="td_patientCityTBox" colspan="1" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;CITY:&nbsp;<input tabindex="39" type="Text" size="25" maxlength="30" name="patientCityTBox" onChange="capitalizeMe(this)" value="#trim(patientCityTBox)#" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};"></td>
							    <td id="td_patientStateTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">
									&nbsp;STATE:&nbsp;
									<cfset getAllStates = application.beanFactory.getBean('StandardListItemIO').getStandardListItemQuery(listid: '4', active: '1') />
									<select tabindex="40" class="SiteSelectBox" name="patientAddressStateID" onchange="changeSelColor(this.selectedIndex);">
										<option value="">
										<cfloop query="getAllStates">
											<option value="#StandardListItemID#" <cfif StandardListItemID EQ patientStateTBox>SELECTED</cfif>> #ItemNameDisplay#
										</cfloop>
									</select>	
									<!---<input tabindex="42" type="Text" size="15" maxlength="15" name="patientStateTBox" onChange="capitalizeMe(this)" value="#trim(patientStateTBox)#" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};">--->
								</td>
								<td id="td_patientZipTBox" colspan="1" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;ZIP:&nbsp;<input tabindex="45" type="Text" size="10" maxlength="10" name="patientZipTBox" value="#trim(patientZipTBox)#" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};"></td>
								<td id="td_patientPhoneTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;PHONE&nbsp;##:&nbsp;<input tabindex="48" type="Text" size="25" maxlength="24" name="patientPhoneTBox" value="#trim(patientPhoneTBox)#" class="siteTextBox" onkeyup="this.value=formatPhoneUS_JS(this.value);" onblur="if(this.value != '' && this.value == document.#formname#.alternateContactPhoneTBox.value){this.value = ''; alert('Patient\'s phone number cannot be the same as the Alternate Contacts phone number.'); this.focus(); }; if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};"></td>
							</tr>							
																									
							<tr>							  		
								<td id="td_alternateContactNameTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">
									&nbsp;ALTERNATE&nbsp;CONTACT:<input tabindex="63" type="Text" name="alternateContactFNameTBox" onChange="capitalizeMe(this)" value="#trim(alternateContactFNameTBox)#" size="15" maxlength="40" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};">
									M:<input tabindex="64" type="Text" name="alternateContactMInitialTBox" value="#trim(alternateContactMInitialTBox)#" onChange="capitalizeMe(this)" size="1" maxlength="1" class="siteTextBox">
									LAST:<input tabindex="65" type="Text" name="alternateContactLNameTBox" onChange="capitalizeMe(this)" value="#trim(alternateContactLNameTBox)#" size="15" maxlength="40" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};">
								</td>
							    <td id="td_alternateContactRelationshipTBox" colspan="1" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;RELATIONSHIP:&nbsp;<input tabindex="66" type="Text" size="13" maxlength="13" name="alternateContactRelationshipTBox" value="#trim(alternateContactRelationshipTBox)#" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};"></td>
								<td nowrap id="td_alternateContactPhoneTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">
									HOME:<input tabindex="69" type="Text" size="15" maxlength="24" name="alternateContactPhoneTBox" value="#trim(alternateContactPhoneTBox)#" class="siteTextBox" onkeyup="this.value=formatPhoneUS_JS(this.value);" onblur="if(this.value != '' && this.value == document.#formname#.patientPhoneTBox.value){this.value = ''; alert('Alternate contact phone number cannot be the same as the Patient\'s phone number.'); this.focus(); }; if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};">
									&nbsp;WORK:<input tabindex="70" type="Text" size="15" maxlength="24" name="alternateContactWorkPhoneTBox" value="#trim(alternateContactWorkPhoneTBox)#" class="siteTextBox" onkeyup="this.value=formatPhoneUS_JS(this.value);">
								</td>
							</tr>	
							<tr>
					           	<td id="td_PO" colspan="1" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">&nbsp;PO&nbsp;##:&nbsp;<input tabindex="71" type="Text" size="15" maxlength="20" name="poNumberTBox" value="#trim(poNumberTBox)#" class="siteTextBox"></td>
					           	<td id="td_CCType" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 0px solid; border-color: 000000;">&nbsp;CREDIT&nbsp;CARD&nbsp;TYPE:&nbsp;<input tabindex="71" type="Text" size="15" maxlength="20" name="creditCardTypeTBox" value="#trim(creditCardTypeTBox)#" class="siteTextBox"></td>
					        	<td id="td_CCNum" colspan="1" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 2px solid; border-left: 1px solid; border-color: 000000;">&nbsp;CREDIT&nbsp;CARD&nbsp;##:&nbsp;<input tabindex="71" type="Text" size="15" maxlength="20" name="creditCardNumberTBox" value="#trim(creditCardNumberTBox)#" class="siteTextBox"></td>
					        	<td id="td_expireCCDate" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 0px solid; border-color: 000000;">&nbsp;EXP&nbsp;DATE:&nbsp;<input tabindex="71" type="Text" name="ccDateMM" value="#trim(ccDateMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox" onblur="checkMonth_JS(this);">&nbsp;/&nbsp;<input tabindex="71" type="Text" name="ccDateDD" value="#trim(ccDateDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox" onblur="checkDay_JS(this);">&nbsp;/&nbsp;<input tabindex="71" type="Text" name="ccDateYY" value="#trim(ccDateYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox" onblur="checkYear_JS(this);"></td>
					       	</tr>												
							<tr>
							    <td align="center" colspan="7" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">&nbsp;</td>
							</tr>	
											
							
							
							<!---HCPC INFORMATION--->
							<tr>
							    <td bgcolor="DCE3EB" align="left" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">
									<input type="button" id="HCPCInformation" class="SiteSubmitbox" style="display: 'inline';" value="#trim(submitButtonVerbiage)#" onclick="submitFunction(this, #trim(Active)#, #trim(formName)#);"><span id="spSubmitButtonHCPCInformation" class="TextWarning" style="font-size: x-small;"></span><span id="spSubmitButtonHCPCInformationLogo" style="display:inline"></span>
								</td>
								<td bgcolor="DCE3EB" align="center" colspan="7" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 0px solid; border-color: 000000;">
									<table cellpadding="0" cellspacing="0" border="0" width="100%">
										<td align="center" class="siteLabel">
											<font face="Arial" size="2"><strong>HCPC&nbsp;Codes</strong></font>
										</td>
										<td align="right" nowrap class="siteLabel">
											<cfif NOT ListFind(clearedStepList, 5)> 	
												<input type="Checkbox" name="clearStepHCPC" onclick="hcpcVerification();">&nbsp;Clear&nbsp;HCPC&nbsp;Codes&nbsp;Step
											<cfelseif ListFind(clearedStepList, 5)>	
												<strong>NOTE:</strong>&nbsp;Step&nbsp;Cleared
											<cfelse>	
												<strong>NOTE:</strong>&nbsp;Step&nbsp;<strong>NOT</strong>&nbsp;Cleared
											</cfif>
										</td>
									</table>									
								</td>
							</tr>
							<tr>
							    <td align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><font face="Arial" size="2"><strong>HCPC&nbsp;CODE</strong></font></td>
								<td align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><font face="Arial" size="2"><strong>QTY</strong></font></td>
								<td align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><font face="Arial" size="2"><strong>PRODUCT</strong></font></td>
								<td align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><font face="Arial" size="2"><strong>COST</strong></font></td>
								<td align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><font face="Arial" size="2"><strong>DX&nbsp;(Code)</strong></font></td>
								<td align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><font face="Arial" size="2"><strong>Diagnosis</strong></font></td>
								<td align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><font face="Arial" size="2"><strong>Length&nbsp;Of&nbsp;Need</strong></font></td>
							</tr>	
														
							<tr id="tr_hcpc1" style="display: 'inline';">
								<td id="td_hcpcCode1TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode1TBox" value="#trim(hcpcCode1TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct1TBox', 'hcpcQty1TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct1TBox')"></td>
								<td id="td_hcpcQty1TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty1TBox" value="#trim(hcpcQty1TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct1TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct1TBox" value="#trim(hcpcProduct1TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost1TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost1TBox" value="#trim(hcpcCost1TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX1TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX1TBox" value="#trim(hcpcDX1TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis1TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis1TBox')"></td>
								<td id="td_hcpcDiagnosis1TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis1TBox" value="#trim(hcpcDiagnosis1TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed1TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear1TBox" value="#trim(hcpcLengthOfNeedYear1TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth1TBox" value="#trim(hcpcLengthOfNeedMonth1TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							
							<tr id="tr_hcpc2" style="display: 'inline';">
								<td id="td_hcpcCode2TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode2TBox" value="#trim(hcpcCode2TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct2TBox', 'hcpcQty2TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct2TBox')"></td>
								<td id="td_hcpcQty2TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty2TBox" value="#trim(hcpcQty2TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct2TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct2TBox" value="#trim(hcpcProduct2TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost2TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost2TBox" value="#trim(hcpcCost2TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX2TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX2TBox" value="#trim(hcpcDX2TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis2TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis2TBox')"></td>
								<td id="td_hcpcDiagnosis2TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis2TBox" value="#trim(hcpcDiagnosis2TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed2TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear2TBox" value="#trim(hcpcLengthOfNeedYear2TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth2TBox" value="#trim(hcpcLengthOfNeedMonth2TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							
							<tr id="tr_hcpc3" style="display: 'inline';">
								<td id="td_hcpcCode3TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode3TBox" value="#trim(hcpcCode3TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct3TBox', 'hcpcQty3TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct3TBox')"></td>
								<td id="td_hcpcQty3TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty3TBox" value="#trim(hcpcQty3TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct3TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct3TBox" value="#trim(hcpcProduct3TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost3TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost3TBox" value="#trim(hcpcCost3TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX3TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX3TBox" value="#trim(hcpcDX3TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis3TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis3TBox')"></td>
								<td id="td_hcpcDiagnosis3TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis3TBox" value="#trim(hcpcDiagnosis3TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed3TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear3TBox" value="#trim(hcpcLengthOfNeedYear3TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth3TBox" value="#trim(hcpcLengthOfNeedMonth3TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							
							<tr id="tr_hcpc4" style="display: 'inline';">
								<td id="td_hcpcCode4TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode4TBox" value="#trim(hcpcCode4TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct4TBox', 'hcpcQty4TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct4TBox')"></td>
								<td id="td_hcpcQty4TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty4TBox" value="#trim(hcpcQty4TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct4TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct4TBox" value="#trim(hcpcProduct4TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost4TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost4TBox" value="#trim(hcpcCost4TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX4TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX4TBox" value="#trim(hcpcDX4TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis4TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis4TBox')"></td>
								<td id="td_hcpcDiagnosis4TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis4TBox" value="#trim(hcpcDiagnosis4TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed4TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear4TBox" value="#trim(hcpcLengthOfNeedYear4TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth4TBox" value="#trim(hcpcLengthOfNeedMonth4TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							
							<tr id="tr_hcpc5" style="display: 'inline';">
								<td id="td_hcpcCode5TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode5TBox" value="#trim(hcpcCode5TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct5TBox', 'hcpcQty5TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct5TBox')"></td>
								<td id="td_hcpcQty5TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty5TBox" value="#trim(hcpcQty5TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct5TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct5TBox" value="#trim(hcpcProduct5TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost5TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost5TBox" value="#trim(hcpcCost5TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX5TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX5TBox" value="#trim(hcpcDX5TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis5TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis5TBox')"></td>
								<td id="td_hcpcDiagnosis5TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis5TBox" value="#trim(hcpcDiagnosis5TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed5TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear5TBox" value="#trim(hcpcLengthOfNeedYear5TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth5TBox" value="#trim(hcpcLengthOfNeedMonth5TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode6TBox) NEQ "" OR trim(hcpcQty6TBox) NEQ "" OR trim(hcpcProduct6TBox) NEQ "" OR trim(hcpcCost6TBox) NEQ "" OR trim(hcpcDX6TBox) NEQ "" OR trim(hcpcDiagnosis6TBox) NEQ "">
								<cfset visibility6 = "inline">
							<cfelse>
								<cfset visibility6 = "none">
							</cfif>
							<tr id="tr_hcpc6" style="display: '#trim(visibility6)#';">
								<td id="td_hcpcCode6TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode6TBox" value="#trim(hcpcCode6TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct6TBox', 'hcpcQty6TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct6TBox')"></td>
								<td id="td_hcpcQty6TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty6TBox" value="#trim(hcpcQty6TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct6TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct6TBox" value="#trim(hcpcProduct6TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost6TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost6TBox" value="#trim(hcpcCost6TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX6TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX6TBox" value="#trim(hcpcDX6TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis6TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis6TBox')"></td>
								<td id="td_hcpcDiagnosis6TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis6TBox" value="#trim(hcpcDiagnosis6TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed6TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear6TBox" value="#trim(hcpcLengthOfNeedYear6TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth6TBox" value="#trim(hcpcLengthOfNeedMonth6TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode7TBox) NEQ "" OR trim(hcpcQty7TBox) NEQ "" OR trim(hcpcProduct7TBox) NEQ "" OR trim(hcpcCost7TBox) NEQ "" OR trim(hcpcDX7TBox) NEQ "" OR trim(hcpcDiagnosis7TBox) NEQ "">
								<cfset visibility7 = "inline">
							<cfelse>
								<cfset visibility7 = "none">
							</cfif>
							<tr id="tr_hcpc7" style="display: '#trim(visibility7)#';">
								<td id="td_hcpcCode7TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode7TBox" value="#trim(hcpcCode7TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct7TBox', 'hcpcQty7TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct7TBox')"></td>
								<td id="td_hcpcQty7TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty7TBox" value="#trim(hcpcQty7TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct7TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct7TBox" value="#trim(hcpcProduct7TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost7TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost7TBox" value="#trim(hcpcCost7TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX7TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX7TBox" value="#trim(hcpcDX7TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis7TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis7TBox')"></td>
								<td id="td_hcpcDiagnosis7TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis7TBox" value="#trim(hcpcDiagnosis7TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed7TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear7TBox" value="#trim(hcpcLengthOfNeedYear7TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth7TBox" value="#trim(hcpcLengthOfNeedMonth7TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode8TBox) NEQ "" OR trim(hcpcQty8TBox) NEQ "" OR trim(hcpcProduct8TBox) NEQ "" OR trim(hcpcCost8TBox) NEQ "" OR trim(hcpcDX8TBox) NEQ "" OR trim(hcpcDiagnosis8TBox) NEQ "">
								<cfset visibility8 = "inline">
							<cfelse>
								<cfset visibility8 = "none">
							</cfif>
							<tr id="tr_hcpc8" style="display: '#trim(visibility8)#';">
								<td id="td_hcpcCode8TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode8TBox" value="#trim(hcpcCode8TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct8TBox', 'hcpcQty8TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct8TBox')"></td>
								<td id="td_hcpcQty8TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty8TBox" value="#trim(hcpcQty8TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct8TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct8TBox" value="#trim(hcpcProduct8TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost8TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost8TBox" value="#trim(hcpcCost8TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX8TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX8TBox" value="#trim(hcpcDX8TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis8TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis8TBox')"></td>
								<td id="td_hcpcDiagnosis8TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis8TBox" value="#trim(hcpcDiagnosis8TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed8TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear8TBox" value="#trim(hcpcLengthOfNeedYear8TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth8TBox" value="#trim(hcpcLengthOfNeedMonth8TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode9TBox) NEQ "" OR trim(hcpcQty9TBox) NEQ "" OR trim(hcpcProduct9TBox) NEQ "" OR trim(hcpcCost9TBox) NEQ "" OR trim(hcpcDX9TBox) NEQ "" OR trim(hcpcDiagnosis9TBox) NEQ "">
								<cfset visibility9 = "inline">
							<cfelse>
								<cfset visibility9 = "none">
							</cfif>
							<tr id="tr_hcpc9" style="display: '#trim(visibility9)#';">
								<td id="td_hcpcCode9TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode9TBox" value="#trim(hcpcCode9TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct9TBox', 'hcpcQty9TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct9TBox')"></td>
								<td id="td_hcpcQty9TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty9TBox" value="#trim(hcpcQty9TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct9TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct9TBox" value="#trim(hcpcProduct9TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost9TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost9TBox" value="#trim(hcpcCost9TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX9TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX9TBox" value="#trim(hcpcDX9TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis9TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis9TBox')"></td>
								<td id="td_hcpcDiagnosis9TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis9TBox" value="#trim(hcpcDiagnosis9TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed9TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear9TBox" value="#trim(hcpcLengthOfNeedYear9TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth9TBox" value="#trim(hcpcLengthOfNeedMonth9TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode10TBox) NEQ "" OR trim(hcpcQty10TBox) NEQ "" OR trim(hcpcProduct10TBox) NEQ "" OR trim(hcpcCost10TBox) NEQ "" OR trim(hcpcDX10TBox) NEQ "" OR trim(hcpcDiagnosis10TBox) NEQ "">
								<cfset visibility10 = "inline">
							<cfelse>
								<cfset visibility10 = "none">
							</cfif>
							<tr id="tr_hcpc10" style="display: '#trim(visibility10)#';">
								<td id="td_hcpcCode10TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode10TBox" value="#trim(hcpcCode10TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct10TBox', 'hcpcQty10TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct10TBox')"></td>
								<td id="td_hcpcQty10TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty10TBox" value="#trim(hcpcQty10TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct10TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct10TBox" value="#trim(hcpcProduct10TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost10TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost10TBox" value="#trim(hcpcCost10TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX10TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX10TBox" value="#trim(hcpcDX10TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis10TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis10TBox')"></td>
								<td id="td_hcpcDiagnosis10TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis10TBox" value="#trim(hcpcDiagnosis10TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed10TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear10TBox" value="#trim(hcpcLengthOfNeedYear10TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth10TBox" value="#trim(hcpcLengthOfNeedMonth10TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode11TBox) NEQ "" OR trim(hcpcQty11TBox) NEQ "" OR trim(hcpcProduct11TBox) NEQ "" OR trim(hcpcCost11TBox) NEQ "" OR trim(hcpcDX11TBox) NEQ "" OR trim(hcpcDiagnosis11TBox) NEQ "">
								<cfset visibility11 = "inline">
							<cfelse>
								<cfset visibility11 = "none">
							</cfif>
							<tr id="tr_hcpc11" style="display: '#trim(visibility11)#';">
								<td id="td_hcpcCode11TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode11TBox" value="#trim(hcpcCode11TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct11TBox', 'hcpcQty11TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct11TBox')"></td>
								<td id="td_hcpcQty11TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty11TBox" value="#trim(hcpcQty11TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct11TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct11TBox" value="#trim(hcpcProduct11TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost11TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost11TBox" value="#trim(hcpcCost11TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX11TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX11TBox" value="#trim(hcpcDX11TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis11TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis11TBox')"></td>
								<td id="td_hcpcDiagnosis11TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis11TBox" value="#trim(hcpcDiagnosis11TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed11TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear11TBox" value="#trim(hcpcLengthOfNeedYear11TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth11TBox" value="#trim(hcpcLengthOfNeedMonth11TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode12TBox) NEQ "" OR trim(hcpcQty12TBox) NEQ "" OR trim(hcpcProduct12TBox) NEQ "" OR trim(hcpcCost12TBox) NEQ "" OR trim(hcpcDX12TBox) NEQ "" OR trim(hcpcDiagnosis12TBox) NEQ "">
								<cfset visibility12 = "inline">
							<cfelse>
								<cfset visibility12 = "none">
							</cfif>
							<tr id="tr_hcpc12" style="display: '#trim(visibility12)#';">
								<td id="td_hcpcCode12TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode12TBox" value="#trim(hcpcCode12TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct12TBox', 'hcpcQty12TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct12TBox')"></td>
								<td id="td_hcpcQty12TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty12TBox" value="#trim(hcpcQty12TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct12TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct12TBox" value="#trim(hcpcProduct12TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost12TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost12TBox" value="#trim(hcpcCost12TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX12TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX12TBox" value="#trim(hcpcDX12TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis12TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis12TBox')"></td>
								<td id="td_hcpcDiagnosis12TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis12TBox" value="#trim(hcpcDiagnosis12TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed12TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear12TBox" value="#trim(hcpcLengthOfNeedYear12TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth12TBox" value="#trim(hcpcLengthOfNeedMonth12TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode13TBox) NEQ "" OR trim(hcpcQty13TBox) NEQ "" OR trim(hcpcProduct13TBox) NEQ "" OR trim(hcpcCost13TBox) NEQ "" OR trim(hcpcDX13TBox) NEQ "" OR trim(hcpcDiagnosis13TBox) NEQ "">
								<cfset visibility13 = "inline">
							<cfelse>
								<cfset visibility13 = "none">
							</cfif>
							<tr id="tr_hcpc13" style="display: '#trim(visibility13)#';">
								<td id="td_hcpcCode13TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode13TBox" value="#trim(hcpcCode13TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct13TBox', 'hcpcQty13TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct13TBox')"></td>
								<td id="td_hcpcQty13TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty13TBox" value="#trim(hcpcQty13TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct13TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct13TBox" value="#trim(hcpcProduct13TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost13TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost13TBox" value="#trim(hcpcCost13TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX13TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX13TBox" value="#trim(hcpcDX13TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis13TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis13TBox')"></td>
								<td id="td_hcpcDiagnosis13TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis13TBox" value="#trim(hcpcDiagnosis13TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed13TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear13TBox" value="#trim(hcpcLengthOfNeedYear13TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth13TBox" value="#trim(hcpcLengthOfNeedMonth13TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode14TBox) NEQ "" OR trim(hcpcQty14TBox) NEQ "" OR trim(hcpcProduct14TBox) NEQ "" OR trim(hcpcCost14TBox) NEQ "" OR trim(hcpcDX14TBox) NEQ "" OR trim(hcpcDiagnosis14TBox) NEQ "">
								<cfset visibility14 = "inline">
							<cfelse>
								<cfset visibility14 = "none">
							</cfif>
							<tr id="tr_hcpc14" style="display: '#trim(visibility14)#';">
								<td id="td_hcpcCode14TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode14TBox" value="#trim(hcpcCode14TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct14TBox', 'hcpcQty14TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct14TBox')"></td>
								<td id="td_hcpcQty14TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty14TBox" value="#trim(hcpcQty14TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct14TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct14TBox" value="#trim(hcpcProduct14TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost14TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost14TBox" value="#trim(hcpcCost14TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX14TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX14TBox" value="#trim(hcpcDX14TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis14TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis14TBox')"></td>
								<td id="td_hcpcDiagnosis14TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis14TBox" value="#trim(hcpcDiagnosis14TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed14TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear14TBox" value="#trim(hcpcLengthOfNeedYear14TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth14TBox" value="#trim(hcpcLengthOfNeedMonth14TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode15TBox) NEQ "" OR trim(hcpcQty15TBox) NEQ "" OR trim(hcpcProduct15TBox) NEQ "" OR trim(hcpcCost15TBox) NEQ "" OR trim(hcpcDX15TBox) NEQ "" OR trim(hcpcDiagnosis15TBox) NEQ "">
								<cfset visibility15 = "inline">
							<cfelse>
								<cfset visibility15 = "none">
							</cfif>
							<tr id="tr_hcpc15" style="display: '#trim(visibility15)#';">
								<td id="td_hcpcCode15TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode15TBox" value="#trim(hcpcCode15TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct15TBox', 'hcpcQty15TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct15TBox')"></td>
								<td id="td_hcpcQty15TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty15TBox" value="#trim(hcpcQty15TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct15TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct15TBox" value="#trim(hcpcProduct15TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost15TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost15TBox" value="#trim(hcpcCost15TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX15TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX15TBox" value="#trim(hcpcDX15TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis15TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis15TBox')"></td>
								<td id="td_hcpcDiagnosis15TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis15TBox" value="#trim(hcpcDiagnosis15TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed15TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear15TBox" value="#trim(hcpcLengthOfNeedYear15TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth15TBox" value="#trim(hcpcLengthOfNeedMonth15TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode16TBox) NEQ "" OR trim(hcpcQty16TBox) NEQ "" OR trim(hcpcProduct16TBox) NEQ "" OR trim(hcpcCost16TBox) NEQ "" OR trim(hcpcDX16TBox) NEQ "" OR trim(hcpcDiagnosis16TBox) NEQ "">
								<cfset visibility16 = "inline">
							<cfelse>
								<cfset visibility16 = "none">
							</cfif>
							<tr id="tr_hcpc16" style="display: '#trim(visibility16)#';">
								<td id="td_hcpcCode16TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode16TBox" value="#trim(hcpcCode16TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct16TBox', 'hcpcQty16TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct16TBox')"></td>
								<td id="td_hcpcQty16TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty16TBox" value="#trim(hcpcQty16TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct16TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct16TBox" value="#trim(hcpcProduct16TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost16TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost16TBox" value="#trim(hcpcCost16TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX16TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX16TBox" value="#trim(hcpcDX16TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis16TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis16TBox')"></td>
								<td id="td_hcpcDiagnosis16TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis16TBox" value="#trim(hcpcDiagnosis16TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed16TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear16TBox" value="#trim(hcpcLengthOfNeedYear16TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth16TBox" value="#trim(hcpcLengthOfNeedMonth16TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode17TBox) NEQ "" OR trim(hcpcQty17TBox) NEQ "" OR trim(hcpcProduct17TBox) NEQ "" OR trim(hcpcCost17TBox) NEQ "" OR trim(hcpcDX17TBox) NEQ "" OR trim(hcpcDiagnosis17TBox) NEQ "">
								<cfset visibility17 = "inline">
							<cfelse>
								<cfset visibility17 = "none">
							</cfif>
							<tr id="tr_hcpc17" style="display: '#trim(visibility17)#';">
								<td id="td_hcpcCode17TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode17TBox" value="#trim(hcpcCode17TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct17TBox', 'hcpcQty17TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct17TBox')"></td>
								<td id="td_hcpcQty17TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty17TBox" value="#trim(hcpcQty17TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct17TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct17TBox" value="#trim(hcpcProduct17TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost17TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost17TBox" value="#trim(hcpcCost17TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX17TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX17TBox" value="#trim(hcpcDX17TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis17TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis17TBox')"></td>
								<td id="td_hcpcDiagnosis17TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis17TBox" value="#trim(hcpcDiagnosis17TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed17TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear17TBox" value="#trim(hcpcLengthOfNeedYear17TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth17TBox" value="#trim(hcpcLengthOfNeedMonth17TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode18TBox) NEQ "" OR trim(hcpcQty18TBox) NEQ "" OR trim(hcpcProduct18TBox) NEQ "" OR trim(hcpcCost18TBox) NEQ "" OR trim(hcpcDX18TBox) NEQ "" OR trim(hcpcDiagnosis18TBox) NEQ "">
								<cfset visibility18 = "inline">
							<cfelse>
								<cfset visibility18 = "none">
							</cfif>
							<tr id="tr_hcpc18" style="display: '#trim(visibility18)#';">
								<td id="td_hcpcCode18TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode18TBox" value="#trim(hcpcCode18TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct18TBox', 'hcpcQty18TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct18TBox')"></td>
								<td id="td_hcpcQty18TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty18TBox" value="#trim(hcpcQty18TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct18TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct18TBox" value="#trim(hcpcProduct18TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost18TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost18TBox" value="#trim(hcpcCost18TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX18TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX18TBox" value="#trim(hcpcDX18TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis18TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis18TBox')"></td>
								<td id="td_hcpcDiagnosis18TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis18TBox" value="#trim(hcpcDiagnosis18TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed18TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear18TBox" value="#trim(hcpcLengthOfNeedYear18TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth18TBox" value="#trim(hcpcLengthOfNeedMonth18TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode19TBox) NEQ "" OR trim(hcpcQty19TBox) NEQ "" OR trim(hcpcProduct19TBox) NEQ "" OR trim(hcpcCost19TBox) NEQ "" OR trim(hcpcDX19TBox) NEQ "" OR trim(hcpcDiagnosis19TBox) NEQ "">
								<cfset visibility19 = "inline">
							<cfelse>
								<cfset visibility19 = "none">
							</cfif>
							<tr id="tr_hcpc19" style="display: '#trim(visibility19)#';">
								<td id="td_hcpcCode19TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode19TBox" value="#trim(hcpcCode19TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct19TBox', 'hcpcQty19TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct19TBox')"></td>
								<td id="td_hcpcQty19TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty19TBox" value="#trim(hcpcQty19TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct19TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct19TBox" value="#trim(hcpcProduct19TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost19TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost19TBox" value="#trim(hcpcCost19TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX19TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX19TBox" value="#trim(hcpcDX19TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis19TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis19TBox')"></td>
								<td id="td_hcpcDiagnosis19TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis19TBox" value="#trim(hcpcDiagnosis19TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed19TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear19TBox" value="#trim(hcpcLengthOfNeedYear19TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth19TBox" value="#trim(hcpcLengthOfNeedMonth19TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode20TBox) NEQ "" OR trim(hcpcQty20TBox) NEQ "" OR trim(hcpcProduct20TBox) NEQ "" OR trim(hcpcCost20TBox) NEQ "" OR trim(hcpcDX20TBox) NEQ "" OR trim(hcpcDiagnosis20TBox) NEQ "">
								<cfset visibility20 = "inline">
							<cfelse>
								<cfset visibility20 = "none">
							</cfif>
							<tr id="tr_hcpc20" style="display: '#trim(visibility20)#';">
								<td id="td_hcpcCode20TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode20TBox" value="#trim(hcpcCode20TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct20TBox', 'hcpcQty20TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct20TBox')"></td>
								<td id="td_hcpcQty20TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty20TBox" value="#trim(hcpcQty20TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct20TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct20TBox" value="#trim(hcpcProduct20TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost20TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost20TBox" value="#trim(hcpcCost20TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX20TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX20TBox" value="#trim(hcpcDX20TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis20TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis20TBox')"></td>
								<td id="td_hcpcDiagnosis20TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis20TBox" value="#trim(hcpcDiagnosis20TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed20TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear20TBox" value="#trim(hcpcLengthOfNeedYear20TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth20TBox" value="#trim(hcpcLengthOfNeedMonth20TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode21TBox) NEQ "" OR trim(hcpcQty21TBox) NEQ "" OR trim(hcpcProduct21TBox) NEQ "" OR trim(hcpcCost21TBox) NEQ "" OR trim(hcpcDX21TBox) NEQ "" OR trim(hcpcDiagnosis21TBox) NEQ "">
								<cfset visibility21 = "inline">
							<cfelse>
								<cfset visibility21 = "none">
							</cfif>
							<tr id="tr_hcpc21" style="display: '#trim(visibility21)#';">
								<td id="td_hcpcCode21TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode21TBox" value="#trim(hcpcCode21TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct21TBox', 'hcpcQty21TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct21TBox')"></td>
								<td id="td_hcpcQty21TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty21TBox" value="#trim(hcpcQty21TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct21TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct21TBox" value="#trim(hcpcProduct21TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost21TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost21TBox" value="#trim(hcpcCost21TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX21TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX21TBox" value="#trim(hcpcDX21TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis21TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis21TBox')"></td>
								<td id="td_hcpcDiagnosis21TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis21TBox" value="#trim(hcpcDiagnosis21TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed21TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear21TBox" value="#trim(hcpcLengthOfNeedYear21TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth21TBox" value="#trim(hcpcLengthOfNeedMonth21TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode22TBox) NEQ "" OR trim(hcpcQty22TBox) NEQ "" OR trim(hcpcProduct22TBox) NEQ "" OR trim(hcpcCost22TBox) NEQ "" OR trim(hcpcDX22TBox) NEQ "" OR trim(hcpcDiagnosis22TBox) NEQ "">
								<cfset visibility22 = "inline">
							<cfelse>
								<cfset visibility22 = "none">
							</cfif>
							<tr id="tr_hcpc22" style="display: '#trim(visibility22)#';">
								<td id="td_hcpcCode22TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode22TBox" value="#trim(hcpcCode22TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct22TBox', 'hcpcQty22TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct22TBox')"></td>
								<td id="td_hcpcQty22TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty22TBox" value="#trim(hcpcQty22TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct22TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct22TBox" value="#trim(hcpcProduct22TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost22TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost22TBox" value="#trim(hcpcCost22TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX22TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX22TBox" value="#trim(hcpcDX22TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis22TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis22TBox')"></td>
								<td id="td_hcpcDiagnosis22TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis22TBox" value="#trim(hcpcDiagnosis22TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed22TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear22TBox" value="#trim(hcpcLengthOfNeedYear22TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth22TBox" value="#trim(hcpcLengthOfNeedMonth22TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode23TBox) NEQ "" OR trim(hcpcQty23TBox) NEQ "" OR trim(hcpcProduct23TBox) NEQ "" OR trim(hcpcCost23TBox) NEQ "" OR trim(hcpcDX23TBox) NEQ "" OR trim(hcpcDiagnosis23TBox) NEQ "">
								<cfset visibility23 = "inline">
							<cfelse>
								<cfset visibility23 = "none">
							</cfif>
							<tr id="tr_hcpc23" style="display: '#trim(visibility23)#';">
								<td id="td_hcpcCode23TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode23TBox" value="#trim(hcpcCode23TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct23TBox', 'hcpcQty23TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct23TBox')"></td>
								<td id="td_hcpcQty23TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty23TBox" value="#trim(hcpcQty23TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct23TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct23TBox" value="#trim(hcpcProduct23TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost23TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost23TBox" value="#trim(hcpcCost23TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX23TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX23TBox" value="#trim(hcpcDX23TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis23TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis23TBox')"></td>
								<td id="td_hcpcDiagnosis23TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis23TBox" value="#trim(hcpcDiagnosis23TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed23TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear23TBox" value="#trim(hcpcLengthOfNeedYear23TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth23TBox" value="#trim(hcpcLengthOfNeedMonth23TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode24TBox) NEQ "" OR trim(hcpcQty24TBox) NEQ "" OR trim(hcpcProduct24TBox) NEQ "" OR trim(hcpcCost24TBox) NEQ "" OR trim(hcpcDX24TBox) NEQ "" OR trim(hcpcDiagnosis24TBox) NEQ "">
								<cfset visibility24 = "inline">
							<cfelse>
								<cfset visibility24 = "none">
							</cfif>
							<tr id="tr_hcpc24" style="display: '#trim(visibility24)#';">
								<td id="td_hcpcCode24TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode24TBox" value="#trim(hcpcCode24TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct24TBox', 'hcpcQty24TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct24TBox')"></td>
								<td id="td_hcpcQty24TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty24TBox" value="#trim(hcpcQty24TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct24TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct24TBox" value="#trim(hcpcProduct24TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost24TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost24TBox" value="#trim(hcpcCost24TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX24TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX24TBox" value="#trim(hcpcDX24TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis24TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis24TBox')"></td>
								<td id="td_hcpcDiagnosis24TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis24TBox" value="#trim(hcpcDiagnosis24TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed24TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear24TBox" value="#trim(hcpcLengthOfNeedYear24TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth24TBox" value="#trim(hcpcLengthOfNeedMonth24TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode25TBox) NEQ "" OR trim(hcpcQty25TBox) NEQ "" OR trim(hcpcProduct25TBox) NEQ "" OR trim(hcpcCost25TBox) NEQ "" OR trim(hcpcDX25TBox) NEQ "" OR trim(hcpcDiagnosis25TBox) NEQ "">
								<cfset visibility25 = "inline">
							<cfelse>
								<cfset visibility25 = "none">
							</cfif>
							<tr id="tr_hcpc25" style="display: '#trim(visibility25)#';">
								<td id="td_hcpcCode25TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode25TBox" value="#trim(hcpcCode25TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct25TBox', 'hcpcQty25TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct25TBox')"></td>
								<td id="td_hcpcQty25TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty25TBox" value="#trim(hcpcQty25TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct25TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct25TBox" value="#trim(hcpcProduct25TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost25TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost25TBox" value="#trim(hcpcCost25TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX25TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX25TBox" value="#trim(hcpcDX25TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis25TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis25TBox')"></td>
								<td id="td_hcpcDiagnosis25TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis25TBox" value="#trim(hcpcDiagnosis25TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed25TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear25TBox" value="#trim(hcpcLengthOfNeedYear25TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth25TBox" value="#trim(hcpcLengthOfNeedMonth25TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode26TBox) NEQ "" OR trim(hcpcQty26TBox) NEQ "" OR trim(hcpcProduct26TBox) NEQ "" OR trim(hcpcCost26TBox) NEQ "" OR trim(hcpcDX26TBox) NEQ "" OR trim(hcpcDiagnosis26TBox) NEQ "">
								<cfset visibility26 = "inline">
							<cfelse>
								<cfset visibility26 = "none">
							</cfif>
							<tr id="tr_hcpc26" style="display: '#trim(visibility26)#';">
								<td id="td_hcpcCode26TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode26TBox" value="#trim(hcpcCode26TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct26TBox', 'hcpcQty26TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct26TBox')"></td>
								<td id="td_hcpcQty26TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty26TBox" value="#trim(hcpcQty26TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct26TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct26TBox" value="#trim(hcpcProduct26TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost26TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost26TBox" value="#trim(hcpcCost26TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX26TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX26TBox" value="#trim(hcpcDX26TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis26TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis26TBox')"></td>
								<td id="td_hcpcDiagnosis26TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis26TBox" value="#trim(hcpcDiagnosis26TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed26TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear26TBox" value="#trim(hcpcLengthOfNeedYear26TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth26TBox" value="#trim(hcpcLengthOfNeedMonth26TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode27TBox) NEQ "" OR trim(hcpcQty27TBox) NEQ "" OR trim(hcpcProduct27TBox) NEQ "" OR trim(hcpcCost27TBox) NEQ "" OR trim(hcpcDX27TBox) NEQ "" OR trim(hcpcDiagnosis27TBox) NEQ "">
								<cfset visibility27 = "inline">
							<cfelse>
								<cfset visibility27 = "none">
							</cfif>
							<tr id="tr_hcpc27" style="display: '#trim(visibility27)#';">
								<td id="td_hcpcCode27TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode27TBox" value="#trim(hcpcCode27TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct27TBox', 'hcpcQty27TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct27TBox')"></td>
								<td id="td_hcpcQty27TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty27TBox" value="#trim(hcpcQty27TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct27TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct27TBox" value="#trim(hcpcProduct27TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost27TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost27TBox" value="#trim(hcpcCost27TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX27TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX27TBox" value="#trim(hcpcDX27TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis27TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis27TBox')"></td>
								<td id="td_hcpcDiagnosis27TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis27TBox" value="#trim(hcpcDiagnosis27TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed27TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear27TBox" value="#trim(hcpcLengthOfNeedYear27TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth27TBox" value="#trim(hcpcLengthOfNeedMonth27TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode28TBox) NEQ "" OR trim(hcpcQty28TBox) NEQ "" OR trim(hcpcProduct28TBox) NEQ "" OR trim(hcpcCost28TBox) NEQ "" OR trim(hcpcDX28TBox) NEQ "" OR trim(hcpcDiagnosis28TBox) NEQ "">
								<cfset visibility28 = "inline">
							<cfelse>
								<cfset visibility28 = "none">
							</cfif>
							<tr id="tr_hcpc28" style="display: '#trim(visibility28)#';">
								<td id="td_hcpcCode28TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode28TBox" value="#trim(hcpcCode28TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct28TBox', 'hcpcQty28TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct28TBox')"></td>
								<td id="td_hcpcQty28TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty28TBox" value="#trim(hcpcQty28TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct28TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct28TBox" value="#trim(hcpcProduct28TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost28TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost28TBox" value="#trim(hcpcCost28TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX28TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX28TBox" value="#trim(hcpcDX28TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis28TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis28TBox')"></td>
								<td id="td_hcpcDiagnosis28TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis28TBox" value="#trim(hcpcDiagnosis28TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed28TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear28TBox" value="#trim(hcpcLengthOfNeedYear28TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth28TBox" value="#trim(hcpcLengthOfNeedMonth28TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode29TBox) NEQ "" OR trim(hcpcQty29TBox) NEQ "" OR trim(hcpcProduct29TBox) NEQ "" OR trim(hcpcCost29TBox) NEQ "" OR trim(hcpcDX29TBox) NEQ "" OR trim(hcpcDiagnosis29TBox) NEQ "">
								<cfset visibility29 = "inline">
							<cfelse>
								<cfset visibility29 = "none">
							</cfif>
							<tr id="tr_hcpc29" style="display: '#trim(visibility29)#';">
								<td id="td_hcpcCode29TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode29TBox" value="#trim(hcpcCode29TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct29TBox', 'hcpcQty29TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct29TBox')"></td>
								<td id="td_hcpcQty29TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty29TBox" value="#trim(hcpcQty29TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct29TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct29TBox" value="#trim(hcpcProduct29TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost29TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost29TBox" value="#trim(hcpcCost29TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX29TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX29TBox" value="#trim(hcpcDX29TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis29TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis29TBox')"></td>
								<td id="td_hcpcDiagnosis29TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis29TBox" value="#trim(hcpcDiagnosis29TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed29TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear29TBox" value="#trim(hcpcLengthOfNeedYear29TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth29TBox" value="#trim(hcpcLengthOfNeedMonth29TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode30TBox) NEQ "" OR trim(hcpcQty30TBox) NEQ "" OR trim(hcpcProduct30TBox) NEQ "" OR trim(hcpcCost30TBox) NEQ "" OR trim(hcpcDX30TBox) NEQ "" OR trim(hcpcDiagnosis30TBox) NEQ "">
								<cfset visibility30 = "inline">
							<cfelse>
								<cfset visibility30 = "none">
							</cfif>
							<tr id="tr_hcpc30" style="display: '#trim(visibility30)#';">
								<td id="td_hcpcCode30TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode30TBox" value="#trim(hcpcCode30TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct30TBox', 'hcpcQty30TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct30TBox')"></td>
								<td id="td_hcpcQty30TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty30TBox" value="#trim(hcpcQty30TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct30TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct30TBox" value="#trim(hcpcProduct30TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost30TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost30TBox" value="#trim(hcpcCost30TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX30TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX30TBox" value="#trim(hcpcDX30TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis30TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis30TBox')"></td>
								<td id="td_hcpcDiagnosis30TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis30TBox" value="#trim(hcpcDiagnosis30TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed30TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear30TBox" value="#trim(hcpcLengthOfNeedYear30TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth30TBox" value="#trim(hcpcLengthOfNeedMonth30TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode31TBox) NEQ "" OR trim(hcpcQty31TBox) NEQ "" OR trim(hcpcProduct31TBox) NEQ "" OR trim(hcpcCost31TBox) NEQ "" OR trim(hcpcDX31TBox) NEQ "" OR trim(hcpcDiagnosis31TBox) NEQ "">
								<cfset visibility31 = "inline">
							<cfelse>
								<cfset visibility31 = "none">
							</cfif>
							<tr id="tr_hcpc31" style="display: '#trim(visibility31)#';">
								<td id="td_hcpcCode31TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode31TBox" value="#trim(hcpcCode31TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct31TBox', 'hcpcQty31TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct31TBox')"></td>
								<td id="td_hcpcQty31TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty31TBox" value="#trim(hcpcQty31TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct31TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct31TBox" value="#trim(hcpcProduct31TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost31TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost31TBox" value="#trim(hcpcCost31TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX31TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX31TBox" value="#trim(hcpcDX31TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis31TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis31TBox')"></td>
								<td id="td_hcpcDiagnosis31TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis31TBox" value="#trim(hcpcDiagnosis31TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed31TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear31TBox" value="#trim(hcpcLengthOfNeedYear31TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth31TBox" value="#trim(hcpcLengthOfNeedMonth31TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode32TBox) NEQ "" OR trim(hcpcQty32TBox) NEQ "" OR trim(hcpcProduct32TBox) NEQ "" OR trim(hcpcCost32TBox) NEQ "" OR trim(hcpcDX32TBox) NEQ "" OR trim(hcpcDiagnosis32TBox) NEQ "">
								<cfset visibility32 = "inline">
							<cfelse>
								<cfset visibility32 = "none">
							</cfif>
							<tr id="tr_hcpc32" style="display: '#trim(visibility32)#';">
								<td id="td_hcpcCode32TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode32TBox" value="#trim(hcpcCode32TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct32TBox', 'hcpcQty32TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct32TBox')"></td>
								<td id="td_hcpcQty32TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty32TBox" value="#trim(hcpcQty32TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct32TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct32TBox" value="#trim(hcpcProduct32TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost32TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost32TBox" value="#trim(hcpcCost32TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX32TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX32TBox" value="#trim(hcpcDX32TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis32TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis32TBox')"></td>
								<td id="td_hcpcDiagnosis32TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis32TBox" value="#trim(hcpcDiagnosis32TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed32TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear32TBox" value="#trim(hcpcLengthOfNeedYear32TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth32TBox" value="#trim(hcpcLengthOfNeedMonth32TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode33TBox) NEQ "" OR trim(hcpcQty33TBox) NEQ "" OR trim(hcpcProduct33TBox) NEQ "" OR trim(hcpcCost33TBox) NEQ "" OR trim(hcpcDX33TBox) NEQ "" OR trim(hcpcDiagnosis33TBox) NEQ "">
								<cfset visibility33 = "inline">
							<cfelse>
								<cfset visibility33 = "none">
							</cfif>
							<tr id="tr_hcpc33" style="display: '#trim(visibility33)#';">
								<td id="td_hcpcCode33TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode33TBox" value="#trim(hcpcCode33TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct33TBox', 'hcpcQty33TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct33TBox')"></td>
								<td id="td_hcpcQty33TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty33TBox" value="#trim(hcpcQty33TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct33TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct33TBox" value="#trim(hcpcProduct33TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost33TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost33TBox" value="#trim(hcpcCost33TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX33TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX33TBox" value="#trim(hcpcDX33TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis33TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis33TBox')"></td>
								<td id="td_hcpcDiagnosis33TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis33TBox" value="#trim(hcpcDiagnosis33TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed33TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear33TBox" value="#trim(hcpcLengthOfNeedYear33TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth33TBox" value="#trim(hcpcLengthOfNeedMonth33TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode34TBox) NEQ "" OR trim(hcpcQty34TBox) NEQ "" OR trim(hcpcProduct34TBox) NEQ "" OR trim(hcpcCost34TBox) NEQ "" OR trim(hcpcDX34TBox) NEQ "" OR trim(hcpcDiagnosis34TBox) NEQ "">
								<cfset visibility34 = "inline">
							<cfelse>
								<cfset visibility34 = "none">
							</cfif>
							<tr id="tr_hcpc34" style="display: '#trim(visibility34)#';">
								<td id="td_hcpcCode34TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode34TBox" value="#trim(hcpcCode34TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct34TBox', 'hcpcQty34TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct34TBox')"></td>
								<td id="td_hcpcQty34TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty34TBox" value="#trim(hcpcQty34TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct34TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct34TBox" value="#trim(hcpcProduct34TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost34TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost34TBox" value="#trim(hcpcCost34TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX34TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX34TBox" value="#trim(hcpcDX34TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis34TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis34TBox')"></td>
								<td id="td_hcpcDiagnosis34TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis34TBox" value="#trim(hcpcDiagnosis34TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed34TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear34TBox" value="#trim(hcpcLengthOfNeedYear34TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth34TBox" value="#trim(hcpcLengthOfNeedMonth34TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode35TBox) NEQ "" OR trim(hcpcQty35TBox) NEQ "" OR trim(hcpcProduct35TBox) NEQ "" OR trim(hcpcCost35TBox) NEQ "" OR trim(hcpcDX35TBox) NEQ "" OR trim(hcpcDiagnosis35TBox) NEQ "">
								<cfset visibility35 = "inline">
							<cfelse>
								<cfset visibility35 = "none">
							</cfif>
							<tr id="tr_hcpc35" style="display: '#trim(visibility35)#';">
								<td id="td_hcpcCode35TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode35TBox" value="#trim(hcpcCode35TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct35TBox', 'hcpcQty35TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct35TBox')"></td>
								<td id="td_hcpcQty35TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty35TBox" value="#trim(hcpcQty35TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct35TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct35TBox" value="#trim(hcpcProduct35TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost35TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost35TBox" value="#trim(hcpcCost35TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX35TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX35TBox" value="#trim(hcpcDX35TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis35TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis35TBox')"></td>
								<td id="td_hcpcDiagnosis35TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis35TBox" value="#trim(hcpcDiagnosis35TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed35TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear35TBox" value="#trim(hcpcLengthOfNeedYear35TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth35TBox" value="#trim(hcpcLengthOfNeedMonth35TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode36TBox) NEQ "" OR trim(hcpcQty36TBox) NEQ "" OR trim(hcpcProduct36TBox) NEQ "" OR trim(hcpcCost36TBox) NEQ "" OR trim(hcpcDX36TBox) NEQ "" OR trim(hcpcDiagnosis36TBox) NEQ "">
								<cfset visibility36 = "inline">
							<cfelse>
								<cfset visibility36 = "none">
							</cfif>
							<tr id="tr_hcpc36" style="display: '#trim(visibility36)#';">
								<td id="td_hcpcCode36TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode36TBox" value="#trim(hcpcCode36TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct36TBox', 'hcpcQty36TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct36TBox')"></td>
								<td id="td_hcpcQty36TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty36TBox" value="#trim(hcpcQty36TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct36TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct36TBox" value="#trim(hcpcProduct36TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost36TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost36TBox" value="#trim(hcpcCost36TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX36TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX36TBox" value="#trim(hcpcDX36TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis36TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis36TBox')"></td>
								<td id="td_hcpcDiagnosis36TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis36TBox" value="#trim(hcpcDiagnosis36TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed36TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear36TBox" value="#trim(hcpcLengthOfNeedYear36TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth36TBox" value="#trim(hcpcLengthOfNeedMonth36TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode37TBox) NEQ "" OR trim(hcpcQty37TBox) NEQ "" OR trim(hcpcProduct37TBox) NEQ "" OR trim(hcpcCost37TBox) NEQ "" OR trim(hcpcDX37TBox) NEQ "" OR trim(hcpcDiagnosis37TBox) NEQ "">
								<cfset visibility37 = "inline">
							<cfelse>
								<cfset visibility37 = "none">
							</cfif>
							<tr id="tr_hcpc37" style="display: '#trim(visibility37)#';">
								<td id="td_hcpcCode37TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode37TBox" value="#trim(hcpcCode37TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct37TBox', 'hcpcQty37TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct37TBox')"></td>
								<td id="td_hcpcQty37TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty37TBox" value="#trim(hcpcQty37TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct37TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct37TBox" value="#trim(hcpcProduct37TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost37TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost37TBox" value="#trim(hcpcCost37TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX37TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX37TBox" value="#trim(hcpcDX37TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis37TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis37TBox')"></td>
								<td id="td_hcpcDiagnosis37TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis37TBox" value="#trim(hcpcDiagnosis37TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed37TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear37TBox" value="#trim(hcpcLengthOfNeedYear37TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth37TBox" value="#trim(hcpcLengthOfNeedMonth37TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode38TBox) NEQ "" OR trim(hcpcQty38TBox) NEQ "" OR trim(hcpcProduct38TBox) NEQ "" OR trim(hcpcCost38TBox) NEQ "" OR trim(hcpcDX38TBox) NEQ "" OR trim(hcpcDiagnosis38TBox) NEQ "">
								<cfset visibility38 = "inline">
							<cfelse>
								<cfset visibility38 = "none">
							</cfif>
							<tr id="tr_hcpc38" style="display: '#trim(visibility38)#';">
								<td id="td_hcpcCode38TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode38TBox" value="#trim(hcpcCode38TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct38TBox', 'hcpcQty38TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct38TBox')"></td>
								<td id="td_hcpcQty38TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty38TBox" value="#trim(hcpcQty38TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct38TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct38TBox" value="#trim(hcpcProduct38TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost38TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost38TBox" value="#trim(hcpcCost38TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX38TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX38TBox" value="#trim(hcpcDX38TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis38TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis38TBox')"></td>
								<td id="td_hcpcDiagnosis38TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis38TBox" value="#trim(hcpcDiagnosis38TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed38TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear38TBox" value="#trim(hcpcLengthOfNeedYear38TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth38TBox" value="#trim(hcpcLengthOfNeedMonth38TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode39TBox) NEQ "" OR trim(hcpcQty39TBox) NEQ "" OR trim(hcpcProduct39TBox) NEQ "" OR trim(hcpcCost39TBox) NEQ "" OR trim(hcpcDX39TBox) NEQ "" OR trim(hcpcDiagnosis39TBox) NEQ "">
								<cfset visibility39 = "inline">
							<cfelse>
								<cfset visibility39 = "none">
							</cfif>
							<tr id="tr_hcpc39" style="display: '#trim(visibility39)#';">
								<td id="td_hcpcCode39TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode39TBox" value="#trim(hcpcCode39TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct39TBox', 'hcpcQty39TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct39TBox')"></td>
								<td id="td_hcpcQty39TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty39TBox" value="#trim(hcpcQty39TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct39TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct39TBox" value="#trim(hcpcProduct39TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost39TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost39TBox" value="#trim(hcpcCost39TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX39TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX39TBox" value="#trim(hcpcDX39TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis39TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis39TBox')"></td>
								<td id="td_hcpcDiagnosis39TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis39TBox" value="#trim(hcpcDiagnosis39TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed39TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear39TBox" value="#trim(hcpcLengthOfNeedYear39TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth39TBox" value="#trim(hcpcLengthOfNeedMonth39TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>
							<cfif trim(hcpcCode40TBox) NEQ "" OR trim(hcpcQty40TBox) NEQ "" OR trim(hcpcProduct40TBox) NEQ "" OR trim(hcpcCost40TBox) NEQ "" OR trim(hcpcDX40TBox) NEQ "" OR trim(hcpcDiagnosis40TBox) NEQ "">
								<cfset visibility40 = "inline">
							<cfelse>
								<cfset visibility40 = "none">
							</cfif>
							<tr id="tr_hcpc40" style="display: '#trim(visibility40)#';">
								<td id="td_hcpcCode40TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcCode40TBox" value="#trim(hcpcCode40TBox)#" class="siteTextBox" onkeyup="keyUpHCPC(this, 'hcpcProduct40TBox', 'hcpcQty40TBox');" onChange="capitalizeMe(this)" onblur="hcpcOnBlur(this, 'hcpcProduct40TBox')"></td>
								<td id="td_hcpcQty40TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="3" maxlength="3" name="hcpcQty40TBox" value="#trim(hcpcQty40TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcProduct40TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="35" maxlength="99" name="hcpcProduct40TBox" value="#trim(hcpcProduct40TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcCost40TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="10" maxlength="10" name="hcpcCost40TBox" value="#trim(hcpcCost40TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
								<td id="td_hcpcDX40TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="7" maxlength="7" name="hcpcDX40TBox" value="#trim(hcpcDX40TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis40TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis40TBox')"></td>
								<td id="td_hcpcDiagnosis40TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="25" maxlength="35" name="hcpcDiagnosis40TBox" value="#trim(hcpcDiagnosis40TBox)#" class="siteTextBox"></td>
								<td id="td_hcpcLengthOfNeed40TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedYear40TBox" value="#trim(hcpcLengthOfNeedYear40TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> y <input tabindex="72" type="Text" size="2" maxlength="3" name="hcpcLengthOfNeedMonth40TBox" value="#trim(hcpcLengthOfNeedMonth40TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"> m</td>
							</tr>							
							<tr>
							    <td align="center" class="siteLabel" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;</td>
								<td align="center" class="siteLabel" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;</td>
								<td align="center" class="siteLabel" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;</td>
								<td align="center" class="siteLabel" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;</td>
								<td align="center" class="siteLabel" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;</td>
								<td align="center" class="siteLabel" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;</td>
								<td align="center" class="siteLabel" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;</td>
							</tr>							
							<tr>
							    <td align="center" colspan="7" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">
									<input type="Button" class="siteSubmitBox" value="Add HCPC Line" onclick="addLine();">
									<input type="Hidden" name="currentInlineRow" value="">
								</td>
							</tr>							
							<tr>
							    <td align="center" colspan="7" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">&nbsp;</td>
							</tr>
							
																
															
							<!--- INSURANCE INFORMATION --->						
							<tr>
							    <td bgcolor="DCE3EB" align="left" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
									<input type="button" id="InsuranceInformation" class="SiteSubmitbox" style="display: 'inline';" value="#trim(submitButtonVerbiage)#" onclick="submitFunction(this, #trim(Active)#, #trim(formName)#);"><span id="spSubmitButtonInsuranceInformation" class="TextWarning" style="font-size: x-small;"></span><span id="spSubmitButtonInsuranceInformationLogo" style="display:inline"></span>
								</td>
								<td bgcolor="DCE3EB" align="center" colspan="7" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">
									<table cellpadding="0" cellspacing="0" border="0" width="100%">
										<td align="center" class="siteLabel">
											<font face="Arial" size="2"><strong>INSURANCE&nbsp;INFORMATION</strong></font>
										</td>
										<td align="right" nowrap class="siteLabel">											
											<cfif NOT ListFind(clearedStepList, 3)> 	
												<input type="Checkbox" name="clearStepVerify" onclick="insuranceVerification();">&nbsp;Clear&nbsp;Insurance&nbsp;Verification&nbsp;Step
											<cfelseif ListFind(clearedStepList, 3)>	
												<strong>NOTE:</strong>&nbsp;Step&nbsp;Cleared
											<cfelse>	
												<strong>NOTE:</strong>&nbsp;Step&nbsp;<strong>NOT</strong>&nbsp;Cleared
											</cfif>					
										</td>
									</table>									
								</td>
							</tr>																			
							
							<cfset variables.insuranceToShow = "primary,secondary,tertiary">
							<script language="JavaScript">												
								$(function() {
									$("##insurance_tabs").tabs();
								});
								function editPIC(patientID, picID, ev){				
									pic=window.open('appPatientInsuranceCompanyEdit.cfm?patientid=' + patientID + '&picid=' + picID + '&ev=' + ev,'picEdit','dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=950,height=700,left=' + newWindowGetX(900) + ',top=' + newWindowGetY(700));
								};					
							</script>							
							<tr>
					       		<td colspan="7" class="siteLabel" style="margin-top:6px; border-Top: 1px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">
					         		<div id="insurance_tabs">
										<ul>		
											<cfloop list="#trim(variables.insuranceToShow)#" index="i">
												<li><a id="tabVerbage_#trim(i)#" href="##insurance_tabs_#trim(i)#">#REQUEST.capitalizeFirstLetter(trim(i))# Insurance</a></li>
											</cfloop>
										</ul>
										<cfloop list="#trim(variables.insuranceToShow)#" index="i">
											<div id="insurance_tabs_#trim(i)#">
												<cf_tagformpatientintakeforminsurance number="#trim(i)#" patientid="#trim(patientid)#">
											</div>
										</cfloop>
									</div>								
								</td>
							</tr>	
														
							<tr>
							    <td align="center" colspan="7" class="siteLabel">&nbsp;</td>
							</tr>
															
							
							<!---PHYSICIAN INFORMATION--->
							<tr>
							    <td bgcolor="DCE3EB" align="left" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
									<input type="button" id="Physician" class="SiteSubmitbox" style="display: 'inline';" value="#trim(submitButtonVerbiage)#" onclick="submitFunction(this, #trim(Active)#, #trim(formName)#);"><span id="spSubmitButtonPhysician" class="TextWarning" style="font-size: x-small;"></span><span id="spSubmitButtonPhysicianLogo" style="display:inline"></span>
								</td>
								<td bgcolor="DCE3EB" align="center" colspan="7" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">
									<table cellpadding="0" cellspacing="0" border="0" width="100%">
										<td align="center" class="siteLabel">
											<font face="Arial" size="2"><strong>ORDERING&nbsp;PHYSICIAN&nbsp;INFORMATION</strong></font>
										</td>
										<td align="right" nowrap class="siteLabel">
											<cfif NOT ListFind(clearedStepList, 4)> 	
												<input type="Checkbox" name="clearStepPhysician" onclick="orderingPhysicianVerification();">&nbsp;Clear&nbsp;Physician&nbsp;Verification&nbsp;Step
											<cfelseif ListFind(clearedStepList, 4)>	
												<strong>NOTE:</strong>&nbsp;Step&nbsp;Cleared
											<cfelse>	
												<strong>NOTE:</strong>&nbsp;Step&nbsp;<strong>NOT</strong>&nbsp;Cleared
											</cfif>
										</td>
									</table>									
								</td>
							</tr>
							<tr>														   
							    <td id="td_orderingPhysicianNameTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">
									&nbsp;PHYSICIAN&nbsp;FIRST:&nbsp;<input tabindex="414" type="Text" size="15" maxlength="45" onChange="capitalizeMe(this)" name="orderingPhysicianFNameTBox" value="#trim(orderingPhysicianFNameTBox)#" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};" onkeyup="keyUpUpin(this, 'orderingPhysicianFNameTBox');">
									&nbsp;M:&nbsp;<input tabindex="415" type="Text" size="1" maxlength="1" name="orderingPhysicianMInitialTBox" onChange="capitalizeMe(this)" value="#trim(orderingPhysicianMInitialTBox)#" class="siteTextBox">
									&nbsp;LAST:&nbsp;<input tabindex="416" type="Text" size="15" maxlength="45" onChange="capitalizeMe(this)" name="orderingPhysicianLNameTBox" value="#trim(orderingPhysicianLNameTBox)#" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};" onkeyup="keyUpUpin(this, 'orderingPhysicianLNameTBox');">
								</td>
							    <td id="td_orderingPhysicianPhoneTBox" colspan="4" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;PHYSICIAN&nbsp;PHONE&nbsp;##:&nbsp;<input tabindex="417" type="Text" size="35" maxlength="24" name="orderingPhysicianPhoneTBox" value="#trim(orderingPhysicianPhoneTBox)#" class="siteTextBox" onkeyup="this.value=formatPhoneUS_JS(this.value);" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};"></td>
							</tr>	
							<cfset upinOnclick = "upinWindow=window.open('https://nppes.cms.hhs.gov/NPPES/NPIRegistryHome.do','upinWindow','top=0,left=0,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=yes,menubar=yes,resizable=yes,width=#trim(session.screenWidth)#,height=#trim(session.screenHeight)#'); upinWindow.focus(0);">
							<tr>														   
							    <td id="td_orderingPhysicianUPINTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;UPIN&nbsp;##:&nbsp;<input tabindex="420" type="Text" size="35" maxlength="29" name="orderingPhysicianUPINTBox" value="#trim(orderingPhysicianUPINTBox)#" class="siteTextBox" onkeyup="keyUpUpin(this, 'orderingPhysicianUPINTBox');" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};">&nbsp;&nbsp;<span class="sitelabel" style="cursor:hand" onclick="#trim(upinOnclick)#"><u>UPIN Registry</u></span></td>
							    <td id="td_orderingPhysicianFaxTBox" colspan="4" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;PHYSICIAN&nbsp;FAX&nbsp;##:&nbsp;<input tabindex="423" type="Text" size="35" maxlength="24" name="orderingPhysicianFaxTBox" value="#trim(orderingPhysicianFaxTBox)#" class="siteTextBox" onkeyup="this.value=formatPhoneUS_JS(this.value);" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};"></td>
							</tr>
							<tr>														   
							    <td id="td_orderingPhysicianAddressTBox" colspan="7" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;ADDRESS:&nbsp;<input tabindex="426" type="Text" size="70" maxlength="70" name="orderingPhysicianAddressTBox" value="#trim(orderingPhysicianAddressTBox)#" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};"></td>
							</tr>
							
							<tr>
							    <td id="td_orderingPhysicianCityTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">&nbsp;CITY:&nbsp;<input tabindex="429" type="Text" size="20" maxlength="30" name="orderingPhysicianCityTBox" onChange="capitalizeMe(this)" value="#trim(orderingPhysicianCityTBox)#" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};"></td>
							    <td id="td_orderingPhysicianStateTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 0px solid; border-bottom: 2px solid; border-left: 0px solid; border-color: 000000;">&nbsp;STATE:&nbsp;
								<cfset getAllStates = application.beanFactory.getBean('StandardListItemIO').getStandardListItemQuery(listid: '4', active: '1') />
															
								<select tabindex="430" class="SiteSelectBox" name="orderingPhysicianStateTBox" onchange="changeSelColor(this.selectedIndex);">
									<option value="">
									<cfloop query="getAllStates">
										<option value="#StandardListItemID#" <cfif StandardListItemID EQ trim(orderingPhysicianStateTBox)>SELECTED</cfif>> #ItemNameDisplay#
									</cfloop>
								</select>	
								</td>
								<td id="td_orderingPhysicianZipTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 1px solid; border-color: 000000;">&nbsp;ZIP:&nbsp;<input tabindex="435" type="Text" size="10" maxlength="10" name="orderingPhysicianZipTBox" value="#trim(orderingPhysicianZipTBox)#" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};"></td>
							</tr>
																																						
							<tr>
							    <td align="center" colspan="7" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">&nbsp;</td>
							</tr>
													
														
							<!---SAME OR SIMILIAR EQUIPMENT--->							
							<tr>
							    <td bgcolor="DCE3EB" align="left" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
									<input type="button" id="SameOrSimiliar" class="SiteSubmitbox" style="display: 'inline';" value="#trim(submitButtonVerbiage)#" onclick="submitFunction(this, #trim(Active)#, #trim(formName)#);"><span id="spSubmitButtonSameOrSimiliar" class="TextWarning" style="font-size: x-small;"></span><span id="spSubmitButtonSameOrSimiliarLogo" style="display:inline"></span>
								</td>
							    <td bgcolor="DCE3EB" align="center" nowrap colspan="4" class="siteLabel" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">
									<font face="Arial" size="2"><strong>SAME&nbsp;OR&nbsp;SIMILIAR&nbsp;EQUIPMENT</strong></font>
								</td>
								<td bgcolor="DCE3EB" align="center" nowrap colspan="2" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">
									<cfif NOT ListFind(clearedStepList, 2)> 	
										<input type="Checkbox" name="clearStepEquipment" onclick="sameEquipment();">&nbsp;Clear&nbsp;Equipment&nbsp;Step
									<cfelse>	
										<strong>NOTE:</strong>&nbsp;Step&nbsp;Cleared
									</cfif>
								</td>
							</tr>							
							<tr>														   
							    <td align="center" colspan="7" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;**&nbsp;These&nbsp;questions&nbsp;should&nbsp;be&nbsp;asked&nbsp;to&nbsp;patient,&nbsp;caregiver,&nbsp;family,&nbsp;or&nbsp;emergency&nbsp;contact&nbsp;to&nbsp;assist&nbsp;in&nbsp;determining&nbsp;reimbursement</td>
							</tr>		
							<script language="JavaScript">						
								function checkPastEquipment(sel){					
									if((event.type == "keydown" || event.type == "keypress") && (event.keyCode=="32" || event.keyCode=="96")){
										if(sel == 1){checkBoxRadio('td_OPTION_13_CBox_PastEquipment', 'CheckUncheckPic_13', 'OPTION_13_CBox_PastEquipmentYes');}
										else if(sel == 2){checkBoxRadio('td_OPTION_13_CBox_PastEquipment', 'CheckUncheckPic_13', 'OPTION_13_CBox_PastEquipmentNo');}	
										window.event.returnValue = false;						
									};									
								};							
							</script>															
							<input type="Hidden" name="OPTION_13_CBox_PastEquipmentYes" value="">
							<input type="Hidden" name="OPTION_13_CBox_PastEquipmentNo" value="">		
							<tr>														   
							    <td id="td_OPTION_13_CBox_PastEquipment" style="background-color:ffffcc" colspan="7" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;HAS&nbsp;PATIENT&nbsp;EVER&nbsp;HAD&nbsp;MEDICAL&nbsp;EQUIPMENT&nbsp;IN&nbsp;THE&nbsp;PAST?:&nbsp;&nbsp;&nbsp;<img tabindex="468" onkeypress="checkPastEquipment(1);" src="images/Checkbox1.gif" name="CheckUncheckPic_13" alt="OPTION_13_CBox_PastEquipmentYes" onclick="checkBoxRadio('td_OPTION_13_CBox_PastEquipment', 'CheckUncheckPic_13', 'OPTION_13_CBox_PastEquipmentYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="468" onkeypress="checkPastEquipment(2);" src="images/Checkbox1.gif" name="CheckUncheckPic_13" alt="OPTION_13_CBox_PastEquipmentNo" onclick="checkBoxRadio('td_OPTION_13_CBox_PastEquipment', 'CheckUncheckPic_13', 'OPTION_13_CBox_PastEquipmentNo')">&nbsp;NO&nbsp;&nbsp;&nbsp;&nbsp;IF&nbsp;SO,&nbsp;LIST&nbsp;BELOW:</td>
							</tr>
							<script language="JavaScript">	
								if(#trim(OPTION_13_CBox_PastEquipmentYes)# == 1){checkBoxRadio('td_OPTION_13_CBox_PastEquipment', 'CheckUncheckPic_13', 'OPTION_13_CBox_PastEquipmentYes')}				
								else if(#trim(OPTION_13_CBox_PastEquipmentNo)# == 1){checkBoxRadio('td_OPTION_13_CBox_PastEquipment', 'CheckUncheckPic_13', 'OPTION_13_CBox_PastEquipmentNo')}
							</script>	
															
							<tr>														   
							    <td colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;"><strong>EQUIPMENT&nbsp;TYPE&nbsp;/&nbsp;NOTE</strong></td>
							    <td colspan="2" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;"><strong>RENTAL/PURCHASE</strong></td>
								<td colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;"><strong>DATES</strong></td>
							    <td colspan="3" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;"><strong>NAME/PHONE&nbsp;OF&nbsp;SUPPLIER</strong></td>
							</tr>		
							<tr>														   
							    <td id="td_Equipment1TypeTBox" colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="469" class="siteTextBox" type="text" name="Equipment1TypeTBox" value="#trim(Equipment1TypeTBox)#" size="15" maxlength="40">&nbsp;<input tabindex="469" class="siteTextBox" type="text" name="Equipment1NoteTBox" value="#trim(Equipment1NoteTBox)#" size="20" maxlength="199"></td>
							    <td id="td_Equipment1RentPurchasedSelect" colspan="2" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;"><select tabindex="470" class="siteSelectBox" name="Equipment1RentPurchasedSelect"><option value=""><option value="R" <cfif trim(Equipment1RentPurchasedSelect) EQ 'R'>SELECTED</cfif>>Rented<option value="P" <cfif trim(Equipment1RentPurchasedSelect) EQ 'P'>SELECTED</cfif>>Purchased</select></td>
								<td id="td_Equipment1Dates" colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;" nowrap><input tabindex="472" type="Text" name="Equipment1FromMM" onblur="checkMonth_JS(this);" value="#trim(Equipment1FromMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="473" type="Text" name="Equipment1FromDD" onblur="checkDay_JS(this);" value="#trim(Equipment1FromDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="474" type="Text" name="Equipment1FromYY" onblur="checkYear_JS(this);" value="#trim(Equipment1FromYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox">&nbsp;TO&nbsp;<input tabindex="475" type="Text" name="Equipment1ToMM" onblur="checkMonth_JS(this);" value="#trim(Equipment1ToMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="476" type="Text" name="Equipment1ToDD" onblur="checkDay_JS(this);" value="#trim(Equipment1ToDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="477" type="Text" name="Equipment1ToYY" onblur="checkYear_JS(this);" value="#trim(Equipment1ToYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox"></td>
							    <td id="td_Equipment1SupplierTelephoneTBox" colspan="3" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;" nowrap><input tabindex="478" class="siteTextBox" type="text" name="Equipment1SupplierNameTBox" value="#trim(Equipment1SupplierNameTBox)#" size="15" maxlength="30"> / <input tabindex="481" class="siteTextBox" type="text" name="Equipment1SupplierTelephoneTBox" value="#trim(Equipment1SupplierTelephoneTBox)#" size="15" maxlength="24" onkeyup="this.value=formatPhoneUS_JS(this.value);"></td>
							</tr>
							<tr>														   
							    <td id="td_Equipment2TypeTBox" colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="482" class="siteTextBox" type="text" name="Equipment2TypeTBox" value="#trim(Equipment2TypeTBox)#" size="15" maxlength="40">&nbsp;<input tabindex="482" class="siteTextBox" type="text" name="Equipment2NoteTBox" value="#trim(Equipment2NoteTBox)#" size="20" maxlength="199"></td>
							    <td id="td_Equipment2RentPurchasedSelect" colspan="2" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;"><select tabindex="483" class="siteSelectBox" name="Equipment2RentPurchasedSelect"><option value=""><option value="R" <cfif trim(Equipment2RentPurchasedSelect) EQ 'R'>SELECTED</cfif>>Rented<option value="P" <cfif trim(Equipment2RentPurchasedSelect) EQ 'P'>SELECTED</cfif>>Purchased</select></td>
								<td id="td_Equipment2Dates" colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;" nowrap><input tabindex="485" type="Text" name="Equipment2FromMM" onblur="checkMonth_JS(this);" value="#trim(Equipment2FromMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="486" type="Text" name="Equipment2FromDD" onblur="checkDay_JS(this);" value="#trim(Equipment2FromDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="487" type="Text" name="Equipment2FromYY" onblur="checkYear_JS(this);" value="#trim(Equipment2FromYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox">&nbsp;TO&nbsp;<input tabindex="488" type="Text" name="Equipment2ToMM" onblur="checkMonth_JS(this);" value="#trim(Equipment2ToMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="489" type="Text" name="Equipment2ToDD" onblur="checkDay_JS(this);" value="#trim(Equipment2ToDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="490" type="Text" name="Equipment2ToYY" onblur="checkYear_JS(this);" value="#trim(Equipment2ToYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox"></td>
							    <td id="td_Equipment2SupplierTelephoneTBox" colspan="3" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;" nowrap><input tabindex="493" class="siteTextBox" type="text" name="Equipment2SupplierNameTBox" value="#trim(Equipment2SupplierNameTBox)#" size="15" maxlength="30"> / <input tabindex="496" class="siteTextBox" type="text" name="Equipment2SupplierTelephoneTBox" value="#trim(Equipment2SupplierTelephoneTBox)#" size="15" maxlength="24" onkeyup="this.value=formatPhoneUS_JS(this.value);"></td>
							</tr>	
							<tr>														   
							    <td id="td_Equipment3TypeTBox" colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="496" class="siteTextBox" type="text" name="Equipment3TypeTBox" value="#trim(Equipment3TypeTBox)#" size="15" maxlength="40">&nbsp;<input tabindex="496" class="siteTextBox" type="text" name="Equipment3NoteTBox" value="#trim(Equipment3NoteTBox)#" size="20" maxlength="199"></td>
							    <td id="td_Equipment3RentPurchasedSelect" colspan="2" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;"><select tabindex="497" class="siteSelectBox" name="Equipment3RentPurchasedSelect"><option value=""><option value="R" <cfif trim(Equipment3RentPurchasedSelect) EQ 'R'>SELECTED</cfif>>Rented<option value="P" <cfif trim(Equipment3RentPurchasedSelect) EQ 'P'>SELECTED</cfif>>Purchased</select></td>
								<td id="td_Equipment3Dates" colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;" nowrap><input tabindex="499" type="Text" name="Equipment3FromMM" onblur="checkMonth_JS(this);" value="#trim(Equipment3FromMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="500" type="Text" name="Equipment3FromDD" onblur="checkDay_JS(this);" value="#trim(Equipment3FromDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="501" type="Text" name="Equipment3FromYY" onblur="checkYear_JS(this);" value="#trim(Equipment3FromYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox">&nbsp;TO&nbsp;<input tabindex="502" type="Text" name="Equipment3ToMM" onblur="checkMonth_JS(this);" value="#trim(Equipment3ToMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="503" type="Text" name="Equipment3ToDD" onblur="checkDay_JS(this);" value="#trim(Equipment3ToDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="504" type="Text" name="Equipment3ToYY" onblur="checkYear_JS(this);" value="#trim(Equipment3ToYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox"></td>
							    <td id="td_Equipment3SupplierTelephoneTBox" colspan="3" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;" nowrap><input tabindex="505" class="siteTextBox" type="text" name="Equipment3SupplierNameTBox" value="#trim(Equipment3SupplierNameTBox)#" size="15" maxlength="30"> / <input tabindex="508" class="siteTextBox" type="text" name="Equipment3SupplierTelephoneTBox" value="#trim(Equipment3SupplierTelephoneTBox)#" value="#trim(Equipment3SupplierTelephoneTBox)#" size="15" maxlength="24" onkeyup="this.value=formatPhoneUS_JS(this.value);"></td>
							</tr>
							<tr>														   
							    <td id="td_Equipment4TypeTBox" colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="509" class="siteTextBox" type="text" name="Equipment4TypeTBox" value="#trim(Equipment4TypeTBox)#" size="15" maxlength="40">&nbsp;<input tabindex="509" class="siteTextBox" type="text" name="Equipment4NoteTBox" value="#trim(Equipment4NoteTBox)#" size="20" maxlength="199"></td>
							    <td id="td_Equipment4RentPurchasedSelect" colspan="2" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;"><select tabindex="510" class="siteSelectBox" name="Equipment4RentPurchasedSelect"><option value=""><option value="R" <cfif trim(Equipment4RentPurchasedSelect) EQ 'R'>SELECTED</cfif>>Rented<option value="P"<cfif trim(Equipment4RentPurchasedSelect) EQ 'P'>SELECTED</cfif>>Purchased</select></td>
								<td id="td_Equipment4Dates" colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;" nowrap><input tabindex="510" type="Text" name="Equipment4FromMM" onblur="checkMonth_JS(this);" value="#trim(Equipment4FromMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="511" type="Text" name="Equipment4FromDD" onblur="checkDay_JS(this);" value="#trim(Equipment4FromDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="512" type="Text" name="Equipment4FromYY" onblur="checkYear_JS(this);" value="#trim(Equipment4FromYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox">&nbsp;TO&nbsp;<input tabindex="513" type="Text" name="Equipment4ToMM" onblur="checkMonth_JS(this);" value="#trim(Equipment4ToMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="514" type="Text" name="Equipment4ToDD" onblur="checkDay_JS(this);" value="#trim(Equipment4ToDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="515" type="Text" name="Equipment4ToYY" onblur="checkYear_JS(this);" value="#trim(Equipment4ToYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox"></td>
							    <td id="td_Equipment4SupplierTelephoneTBox" colspan="3" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;" nowrap><input tabindex="518" class="siteTextBox" type="text" name="Equipment4SupplierNameTBox" value="#trim(Equipment4SupplierNameTBox)#" size="15" maxlength="30"> / <input tabindex="521" class="siteTextBox" type="text" name="Equipment4SupplierTelephoneTBox" value="#trim(Equipment4SupplierTelephoneTBox)#" size="15" maxlength="24" onkeyup="this.value=formatPhoneUS_JS(this.value);"></td>
							</tr>
							<tr>														   
							    <td id="td_Equipment5TypeTBox" colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="524" class="siteTextBox" type="text" name="Equipment5TypeTBox" value="#trim(Equipment5TypeTBox)#" size="15" maxlength="40">&nbsp;<input tabindex="524" class="siteTextBox" type="text" name="Equipment5NoteTBox" value="#trim(Equipment5NoteTBox)#" size="20" maxlength="199"></td>
							    <td id="td_Equipment5RentPurchasedSelect" colspan="2" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 2px solid; border-left: 0px solid; border-color: 000000;"><select tabindex="525" class="siteSelectBox" name="Equipment5RentPurchasedSelect"><option value=""><option value="R" <cfif trim(Equipment5RentPurchasedSelect) EQ 'R'>SELECTED</cfif>>Rented<option value="P" <cfif trim(Equipment5RentPurchasedSelect) EQ 'P'>SELECTED</cfif>>Purchased</select></td>
								<td id="td_Equipment5Dates" colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 2px solid; border-left: 0px solid; border-color: 000000;" nowrap><input tabindex="527" type="Text" name="Equipment5FromMM" onblur="checkMonth_JS(this);" value="#trim(Equipment5FromMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="528" type="Text" name="Equipment5FromDD" onblur="checkDay_JS(this);" value="#trim(Equipment5FromDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="529" type="Text" name="Equipment5FromYY" onblur="checkYear_JS(this);" value="#trim(Equipment5FromYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox">&nbsp;TO&nbsp;<input tabindex="530" type="Text" name="Equipment5ToMM" onblur="checkMonth_JS(this);" value="#trim(Equipment5ToMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="531" type="Text" name="Equipment5ToDD" onblur="checkDay_JS(this);" value="#trim(Equipment5ToDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="532" type="Text" name="Equipment5ToYY" onblur="checkYear_JS(this);" value="#trim(Equipment5ToYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox"></td>
							    <td id="td_Equipment5SupplierTelephoneTBox" colspan="3" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 0px solid; border-color: 000000;" nowrap><input tabindex="535" class="siteTextBox" type="text" name="Equipment5SupplierNameTBox" value="#trim(Equipment5SupplierNameTBox)#" size="15" maxlength="30"> / <input tabindex="538" class="siteTextBox" type="text" name="Equipment5SupplierTelephoneTBox" value="#trim(Equipment5SupplierTelephoneTBox)#" size="15" maxlength="24" onkeyup="this.value=formatPhoneUS_JS(this.value);"></td>
							</tr>																																						
							<tr>
							    <td align="center" colspan="7" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">&nbsp;</td>
							</tr>
								
							
							
													
							
							<!---OTHER QUALIFYING INFORMATION--->							
							<tr>
							    <td bgcolor="DCE3EB" align="left" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
									<input type="button" id="OtherQualifying" class="SiteSubmitbox" style="display: 'inline';" value="#trim(submitButtonVerbiage)#" onclick="submitFunction(this, #trim(Active)#, #trim(formName)#);"><span id="spSubmitButtonOtherQualifying" class="TextWarning" style="font-size: x-small;"></span><span id="spSubmitButtonOtherQualifyingLogo" style="display:inline"></span>
								</td>
							    <td bgcolor="DCE3EB" align="center" nowrap colspan="6" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">
									<font face="Arial" size="2"><strong>OTHER&nbsp;QUALIFYING&nbsp;INFORMATION</strong></font>
								</td>								
							</tr>							
							<tr>														   
							    <td align="center" colspan="7" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;**&nbsp;These&nbsp;questions&nbsp;should&nbsp;be&nbsp;asked&nbsp;to&nbsp;patient,&nbsp;caregiver,&nbsp;family,&nbsp;or&nbsp;emergency&nbsp;contact&nbsp;to&nbsp;assist&nbsp;in&nbsp;determining&nbsp;reimbursement</td>
							</tr>	
							<script language="JavaScript">						
								function checkSkilledNursing(sel){					
									if((event.type == "keydown" || event.type == "keypress") && (event.keyCode=="32" || event.keyCode=="96")){
										if(sel == 1){checkBoxRadio('td_OPTION_SkilledNursing', 'CheckUncheckPic_SkilledNursing', 'OPTION_SkilledNursingYes');}
										else if(sel == 2){checkBoxRadio('td_OPTION_SkilledNursing', 'CheckUncheckPic_SkilledNursing', 'OPTION_SkilledNursingNo');}	
										window.event.returnValue = false;						
									};									
								};							
							</script>															
							<input type="Hidden" name="OPTION_SkilledNursingYes" value="">
							<input type="Hidden" name="OPTION_SkilledNursingNo" value="">		
							<tr>														   
							    <td id="td_OPTION_SkilledNursing" style="background-color:ffffcc" colspan="7" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">
									&nbsp;IS&nbsp;THE&nbsp;PATIENT&nbsp;RECEIVING&nbsp;SKILLED&nbsp;NURSING&nbsp;SERVICE?:&nbsp;&nbsp;&nbsp;<img tabindex="536" onkeypress="checkSkilledNursing(1);" src="images/Checkbox1.gif" name="CheckUncheckPic_SkilledNursing" alt="OPTION_SkilledNursingYes" onclick="checkBoxRadio('td_OPTION_SkilledNursing', 'CheckUncheckPic_SkilledNursing', 'OPTION_SkilledNursingYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="536" onkeypress="checkSkilledNursing(2);" src="images/Checkbox1.gif" name="CheckUncheckPic_SkilledNursing" alt="OPTION_SkilledNursingNo" onclick="checkBoxRadio('td_OPTION_SkilledNursing', 'CheckUncheckPic_SkilledNursing', 'OPTION_SkilledNursingNo')">&nbsp;NO&nbsp;&nbsp;&nbsp;&nbsp;IF&nbsp;YES:
									COMPANY&nbsp;NAME:&nbsp;<input tabindex="536" class="siteTextBox" type="text" name="SkilledNursingName" value="#trim(SkilledNursingName)#" size="25" maxlength="80"> &nbsp;&nbsp; 
									TELEPHONE:&nbsp;<input tabindex="536" class="siteTextBox" type="text" name="SkilledNursingTelephone" value="#trim(SkilledNursingTelephone)#" size="20" maxlength="24" onkeyup="this.value=formatPhoneUS_JS(this.value);">
								</td>
								<cfif IsNumeric(OPTION_SkilledNursing)>
									<script language="JavaScript">	
										if(#trim(OPTION_SkilledNursing)# == 0){checkBoxRadio('td_OPTION_SkilledNursing', 'CheckUncheckPic_SkilledNursing', 'OPTION_SkilledNursingYes')}				
										else if(#trim(OPTION_SkilledNursing)# == 1){checkBoxRadio('td_OPTION_SkilledNursing', 'CheckUncheckPic_SkilledNursing', 'OPTION_SkilledNursingNo')}
									</script>	
								</cfif>										
							</tr>	
							<tr>
							    <td align="center" colspan="7" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">&nbsp;</td>
							</tr>
							
							
							
													
							<!---LAB DATA--->
							<tr>
							    <td bgcolor="DCE3EB" align="left" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
									<input type="button" id="LabData" class="SiteSubmitbox" style="display: 'inline';" value="#trim(submitButtonVerbiage)#" onclick="submitFunction(this, #trim(Active)#, #trim(formName)#);"><span id="spSubmitButtonLabData" class="TextWarning" style="font-size: x-small;"></span><span id="spSubmitButtonLabDataLogo" style="display:inline"></span>
								</td>
								<td bgcolor="DCE3EB" align="center" colspan="6" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">
									<font face="Arial" size="2"><strong>LAB&nbsp;DATA</strong></font>
								</td>
							</tr>							
							<tr>														   
							    <td align="center" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;"><strong>OXYGEN&nbsp;DATA</strong></td>
							    <td align="center" colspan="4" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;"><strong>CPAP&nbsp;DATA</strong></td>
							</tr>
							<script language="JavaScript">						
								function checkOxy(sel){					
									if((event.type == "keydown" || event.type == "keypress") && (event.keyCode=="32" || event.keyCode=="96")){
										if(sel == 1){checkBoxRadio('', 'CheckUncheckPic_14', 'OPTION_14_CBox_OxygenPAo2');}
										else if(sel == 2){checkBoxRadio('', 'CheckUncheckPic_14', 'OPTION_14_CBox_OxygenSAo2');}	
										else if(sel == 3){checkBoxRadio('', 'CheckUncheckPic_14', 'OPTION_14_CBox_OxygenSPo2');}	
										window.event.returnValue = false;						
									};									
								};							
							</script>	
							<input type="Hidden" name="OPTION_14_CBox_OxygenPAo2" value="">
							<input type="Hidden" name="OPTION_14_CBox_OxygenSAo2" value="">		
							<input type="Hidden" name="OPTION_14_CBox_OxygenSPo2" value="">															
							<tr>														   
							    <td colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;<img tabindex="541" onkeypress="checkOxy(1);" src="images/Checkbox1.gif" name="CheckUncheckPic_14" alt="OPTION_14_CBox_OxygenPAo2" onclick="checkBoxRadio('', 'CheckUncheckPic_14', 'OPTION_14_CBox_OxygenPAo2')">&nbsp;PaO<sub>2</sub>&nbsp;&nbsp;<input tabindex="541" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" type="Text" name="OxygenPAO2TBox" value="#trim(OxygenPAO2TBox)#" class="siteTextBox" size="3" maxlength="3">&nbsp;mmHg&nbsp;&nbsp;OR&nbsp;&nbsp;&nbsp;<img tabindex="541" onkeypress="checkOxy(2);" src="images/Checkbox1.gif" name="CheckUncheckPic_14" alt="OPTION_14_CBox_OxygenSAo2" onclick="checkBoxRadio('', 'CheckUncheckPic_14', 'OPTION_14_CBox_OxygenSAo2')">&nbsp;SaO<sub>2</sub>&nbsp;&nbsp;<input tabindex="541" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" type="Text" name="OxygenSAO2TBox" value="#trim(OxygenSAO2TBox)#" class="siteTextBox" size="3" maxlength="3">&nbsp;%&nbsp;via&nbsp;ABG</td>
							    <td colspan="4" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<input tabindex="558" type="Checkbox" name="CPAPStudy_CBox" <cfif trim(CPAPStudy_CBox) EQ 1>CHECKED</cfif>>&nbsp;SLEEP&nbsp;STUDY&nbsp;IS&nbsp;PENDING:&nbsp;<input tabindex="561" type="Text" name="CPAPStudyNote" value="#trim(CPAPStudyNote)#" size="40" maxlength="50" class="siteTextBox"></td>
							</tr>
							<tr>														   
							    <td colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;OR&nbsp;<img tabindex="541" onkeypress="checkOxy(3);" src="images/Checkbox1.gif" name="CheckUncheckPic_14" alt="OPTION_14_CBox_OxygenSPo2" onclick="checkBoxRadio('', 'CheckUncheckPic_14', 'OPTION_14_CBox_OxygenSPo2')">&nbsp;SPO<sub>2</sub>&nbsp;<input tabindex="547" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" type="Text" name="OxygenSPO2TBox" value="#trim(OxygenSPO2TBox)#" class="siteTextBox" size="3" maxlength="3">&nbsp;%&nbsp;via&nbsp;Pulse&nbsp;Oximetry</td>
							    <td colspan="4" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<input tabindex="564" type="Checkbox" name="CPAPStudyOnFile_CBox" <cfif trim(CPAPStudyOnFile_CBox) EQ 1>CHECKED</cfif>>&nbsp;SLEEP&nbsp;STUDY&nbsp;ON&nbsp;FILE:&nbsp;<input tabindex="567" type="Text" name="CPAPStudyOnFileNote" value="#trim(CPAPStudyOnFileNote)#" size="40" maxlength="50" class="siteTextBox"></td>
							</tr>
							<script language="JavaScript">	
								if(#trim(OPTION_14_CBox_OxygenPAo2)# == 1){checkBoxRadio('', 'CheckUncheckPic_14', 'OPTION_14_CBox_OxygenPAo2')}				
								else if(#trim(OPTION_14_CBox_OxygenSAo2)# == 1){checkBoxRadio('', 'CheckUncheckPic_14', 'OPTION_14_CBox_OxygenSAo2')}
								else if(#trim(OPTION_14_CBox_OxygenSPo2)# == 1){checkBoxRadio('', 'CheckUncheckPic_14', 'OPTION_14_CBox_OxygenSPo2')}
							</script>	
							
							<tr>														   
							    <td colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;TEST&nbsp;DATE:&nbsp;<input tabindex="550" type="Text" name="LabTestDateMM" onblur="checkMonth_JS(this);" value="#trim(LabTestDateMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="551" type="Text" name="LabTestDateDD" onblur="checkDay_JS(this);" value="#trim(LabTestDateDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">/<input tabindex="552" type="Text" name="LabTestDateYY" onblur="checkYear_JS(this);" value="#trim(LabTestDateYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox"></td>
								<td colspan="4" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;SLEEP&nbsp;STUDY&nbsp;PERFORMED&nbsp;AT:&nbsp;<input tabindex="570" type="Text" name="CPAPStudyPerformedAt" value="#trim(CPAPStudyPerformedAt)#" size="40" maxlength="50" class="siteTextBox"></td>
							</tr>
							<tr>														   
							   	<td colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;TEST&nbsp;FACILITY:&nbsp;<input tabindex="555" type="Text" size="45" maxlength="40" name="LabTestFacilityTBox" value="#trim(LabTestFacilityTBox)#" class="siteTextBox"></td>
							   	<td colspan="4" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;OTHER&nbsp;(LIST&nbsp;BELOW):</td>
							</tr>																	
							<tr>														   
							   	<td colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;</td>
							   	<td colspan="4" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;"><input tabindex="573" type="Text" size="45" maxlength="40" name="CPAPStudyPerformedAt2" value="#trim(CPAPStudyPerformedAt2)#" class="siteTextBox"></td>
							</tr>
							<tr>														   
							   	<td colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">&nbsp;</td>
							   	<td colspan="4" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 1px solid; border-color: 000000;"><input tabindex="576" type="Text" size="45" maxlength="40" name="CPAPStudyPerformedAt3" value="#trim(CPAPStudyPerformedAt3)#" class="siteTextBox"></td>
							</tr>		
																																						
							<tr>
							    <td align="center" colspan="7" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">&nbsp;</td>
							</tr>						
															
						</table>
					</td>
				</tr>	
				
				<tr>
				    <td colspan="10" align="center">												
						<cfif NOT Isnumeric(intakeID)>&nbsp;&nbsp;&nbsp;<input tabindex="578" type="reset" class="SiteSubmitbox" value="Clear&nbsp;Form"></cfif>
						&nbsp;&nbsp;&nbsp;<input type="button" class="SiteSubmitBox" value="Back" onclick="history.back()">
					</td>							   
				</tr>	
				<tr>
				    <td align="center" colspan="10" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">&nbsp;</td>
				</tr>		
									
			</table>	
		     	
		</form>
		
		
		<script language="JavaScript">			
			if(document.#formName#.otherTBox.value == ""){document.#formName#.otherTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.otherTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.hospiceTBox.value == ""){document.#formName#.hospiceTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.hospiceTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.hospitalTBox.value == ""){document.#formName#.hospitalTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.hospitalTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.callerFNameTBox.value == ""){document.#formName#.callerFNameTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.callerFNameTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.callerLNameTBox.value == ""){document.#formName#.callerLNameTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.callerLNameTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.callerPhoneTBox.value == ""){document.#formName#.callerPhoneTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.callerPhoneTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientFNameTBox.value == ""){document.#formName#.patientFNameTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientFNameTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientLNameTBox.value == ""){document.#formName#.patientLNameTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientLNameTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientSSNTBox.value == ""){document.#formName#.patientSSNTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientSSNTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientAddressTBox.value == ""){document.#formName#.patientAddressTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientAddressTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientCityTBox.value == ""){document.#formName#.patientCityTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientCityTBox.style.backgroundColor = 'ffffff';};
			<cfif IsDefined("patientStateTBox") AND IsNumeric(patientStateTBox)>
				if(#trim(patientStateTBox)# != ""){changeSelColor(#trim(patientStateTBox)#);};
			<cfelse>
				changeSelColor('');
			</cfif>	
			<cfif IsDefined("patientMaritalStatus") AND IsNumeric(patientMaritalStatus)>
				if(#trim(patientMaritalStatus)# != ""){changeSelColorMarital(#trim(patientMaritalStatus)#);};
			<cfelse>
				changeSelColorMarital('');
			</cfif>			
			if(document.#formName#.patientZipTBox.value == ""){document.#formName#.patientZipTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientZipTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientPhoneTBox.value == ""){document.#formName#.patientPhoneTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientPhoneTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientDOBMM.value == ""){document.#formName#.patientDOBMM.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientDOBMM.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientDOBDD.value == ""){document.#formName#.patientDOBDD.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientDOBDD.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientDOBYY.value == ""){document.#formName#.patientDOBYY.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientDOBYY.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientHeightInches.value == ""){document.#formName#.patientHeightInches.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientHeightInches.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientWeightTBox.value == ""){document.#formName#.patientWeightTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientWeightTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.alternateContactFNameTBox.value == ""){document.#formName#.alternateContactFNameTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.alternateContactFNameTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.alternateContactLNameTBox.value == ""){document.#formName#.alternateContactLNameTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.alternateContactLNameTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.alternateContactRelationshipTBox.value == ""){document.#formName#.alternateContactRelationshipTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.alternateContactRelationshipTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.alternateContactPhoneTBox.value == ""){document.#formName#.alternateContactPhoneTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.alternateContactPhoneTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.orderingPhysicianFNameTBox.value == ""){document.#formName#.orderingPhysicianFNameTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.orderingPhysicianFNameTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.orderingPhysicianLNameTBox.value == ""){document.#formName#.orderingPhysicianLNameTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.orderingPhysicianLNameTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.orderingPhysicianPhoneTBox.value == ""){document.#formName#.orderingPhysicianPhoneTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.orderingPhysicianPhoneTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.orderingPhysicianUPINTBox.value == ""){document.#formName#.orderingPhysicianUPINTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.orderingPhysicianUPINTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.orderingPhysicianFaxTBox.value == ""){document.#formName#.orderingPhysicianFaxTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.orderingPhysicianFaxTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.orderingPhysicianAddressTBox.value == ""){document.#formName#.orderingPhysicianAddressTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.orderingPhysicianAddressTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.orderingPhysicianCityTBox.value == ""){document.#formName#.orderingPhysicianCityTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.orderingPhysicianCityTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.orderingPhysicianStateTBox.value == ""){document.#formName#.orderingPhysicianStateTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.orderingPhysicianStateTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.orderingPhysicianZipTBox.value == ""){document.#formName#.orderingPhysicianZipTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.orderingPhysicianZipTBox.style.backgroundColor = 'ffffff';};
		
			<cfif IsNumeric(PatientID)>
				disablePatient(1);
				<!---showChange();--->
				<cfset patientOnclick = "editPatient=window.open(\'appPatient.cfm?reload=no&patientid=#trim(patientID)#&resetA=1&resetP=1&func=resetPatientInfo(#session.clientID#,#trim(patientID)#)\',\'editPatient\',\'top=' + newWindowGetY(600) + ',left=' + newWindowGetX(825) + ',dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=950,height=700\'); editPatient.focus(0);"> 
				spPatient.innerHTML = '<u style=cursor:hand onclick=#trim(patientOnclick)#>PATIENT</u>';			
			</cfif>
			<cfif IsNumeric(PatientAddressID) AND PatientAddressID GT 0>	
				disablePatientAddress(1);
			</cfif>
			<cfif IsNumeric(patientPhoneID) AND patientPhoneID GT 0>		
				disablePatientPhone(1);
			</cfif>
							
		</script>
		
	</cfoutput>

	

	<cfif Active AND IsNumeric(IntakeID) AND AssignedTouserID NEQ session.User.getUsersID() AND NOT isIntakeAdmin>
		<cfoutput>
			<script language="JavaScript">				
				alert("If you need to edit this intake please speak to a supervisor about re-assigning this intake to you.");
			</script>
		</cfoutput>
	</cfif>	
	

	
<!-------------------------------------------------------------------------------------->
<!--- Frame to submit the data for AutoSave                                          --->
<!-------------------------------------------------------------------------------------->	
	<iFrame name="autoSaveFrame" src="appIntakeAutoSave.cfm" frameborder="1" contenteditable HEIGHT=0 id="AutoSave" style="border:1;width:0;height:0;"></iFrame>
	

	
<!-------------------------------------------------------------------------------------->
<!--- Set the focus on this form to the highest editable field.                      --->
<!-------------------------------------------------------------------------------------->		
	<cfoutput>
		<script language="JavaScript">				
			document.getElementById("CheckUncheckPic_1").focus();						
		</script>
	</cfoutput>		
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the patients Insurances if the intake has a patientID.                     --->
<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("patientID") AND IsNumeric(patientID)>
		
		<cfif NOT IsNumeric(patientaddressid) AND patientAddresses.RecordCount GT 0>
			<cfset patientaddressid = patientAddresses.AddressDBID[1]>
		</cfif>
		
		<cfif NOT IsNumeric(trim(patientphoneid)) AND patientPhones.RecordCount GT 0>				
			<cfset patientphoneid = trim(patientPhones.PhoneID[1])>									
		</cfif>	
		
		<cfoutput>
			
			<script language="JavaScript">			
											
				<!-------------------------------------------------------------------------------------->
				<!--- Address section                                                                --->
				<!-------------------------------------------------------------------------------------->				
				<cfset count = 0>
						
				<cfloop query="patientAddresses">					
					<cfset count = count + 1>					
					AddressIDs[#trim(count)#] = "#trim(count)#";
					AddressDBID[#trim(count)#] = "#trim(AddressID)#";		
					AddressTypeID[#trim(count)#] = "#trim(AddressTypeID)#";
					AddressLine1[#trim(count)#] = "#trim(AddressLine1)#";	
					AddressLine2[#trim(count)#] = "#trim(AddressLine2)#";	
					AddressCity[#trim(count)#] = "#trim(city)#";
					AddressStateID[#trim(count)#] = "#trim(stateID)#";		
					AddressZipCode[#trim(count)#] = "#trim(zipcode)#";	
					AddressIsDefault[#trim(count)#] = "#trim(IsDefault)#";
					AddressActive[#trim(count)#] = "#trim(Active)#";					
				</cfloop> 			
								
				loadAddressArrayDisplay(0, #patientaddressid#);		
				
				tr_patientAddress.style.display='none';
				tr_patientAddressPhone.style.display='none';	
				
				<!-------------------------------------------------------------------------------------->
				<!--- Phone section                                                                  --->
				<!-------------------------------------------------------------------------------------->		
				<cfset count = 0>
			
				<cfloop query="patientPhones">
					
					<cfset count = count + 1>
					<cfset PhoneD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(PhoneNumber)) />
					<cfset PhoneExtensionD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(PhoneExtension)) />
					PhoneIDs[#trim(count)#] = "#trim(count)#";				
					phoneNumberDBID[#trim(count)#] = "#trim(PhoneID)#";		
					phoneNumberTypeID[#trim(count)#] = "#trim(PhoneTypeID)#";
					phoneNumber[#trim(count)#] = "#trim(PhoneD)#";
					phoneExtension[#trim(count)#] = "#trim(PhoneExtensionD)#";					
					phoneNumberIsDefault[#trim(count)#] = "#trim(IsDefault)#";
									
				</cfloop> 
				
				loadPhoneNumberArrayDisplay(0, #trim(patientphoneid)#);		
				
				setInsurance(#trim(PatientID)#);
				
			</script>
			
		</cfoutput>
		
	</cfif>

	
	
<!-------------------------------------------------------------------------------------->
<!--- Open the patient search screen.                                                --->
<!--------------------------------------------------------------------------------------> 		
	<cfif NOT IsDefined("IntakeID") OR NOT IsNumeric(IntakeID)>
		<cfoutput>

			<cf_tagInputFormSearchPatient>
			
			<script type='text/javascript'>		
				searchPatientOpenClose();	
			</script>
	
		</cfoutput>
	</cfif>	
	
	
	
<script>

	$(document).ready(function() {	
		
		//if close button is clicked
		$('.window .close').click(function (e) {
			//Cancel the link behavior
			e.preventDefault();			
			closeMask();
		});		
		
	});

	location.hash = window.pageXOffset; 

</script>	
	
<style>
	#managerApproval #mask{
	  position:absolute;
	  left:0;
	  top:0;
	  z-index:9000;
	  background-color:#000;
	  display:none;
	}  
	#managerApproval .window{
	  position:absolute;
	  left:0;
	  top:0;
	  display:none;
	  z-index:9999;
	  padding:20px;
	  background-color:#ffffff;
	}
	#managerApproval #managerApprovalContainer{
	  width:375px; 
	  height:203px;
	  padding: 0px;
	  margin: 0px;
	  border: 0px dashed red;	
	  background: #ffffff; 		
	}
	#managerApproval #managerApprovalHeaderTitle{
		float: left;
		width: 100%; 
		margin: 0px;
		padding: 0px 0px 0px 0px; 		
		list-style: none;
		background: #CBD9E9; 				
	}
	#managerApproval #managerApprovalTitle{
		float: left;
		margin: 0px; 			
		padding: 5px 5px; 		
		font-weight: bold; 				
		font-family: Arial, sans-serif; 
		font-size: x-small; 
		text-align: left;					
	}		
	#managerApproval #managerApprovalCloseImage{
		float: right;
		margin: 0px; 			
		padding: 5px 5px; 			
	}

	#div_errorMsgManagerApproval{
		float: left;
		width: 100%;		
		display: none; 			
		border: 0px solid ccc889;		
		padding: 5px; 			
	}
	#sp_errorMsgManagerApproval{			
		vertical-align: bottom; 	
		text-align: left;		
		font-weight: bold; 
		font-family: Arial, sans-serif; 
		font-size: x-small; 
		color: FF0000;
		padding: 0px 5px 0px 0px; 
		border: 0px dashed green;
		width: 100%;		
	}		
	#managersList_UL{
		border: 0px dashed red;
		text-align: left;				
		font-family: Arial, sans-serif; 
		font-size: x-small; 
		color: 000000;
		clear: both;
	}
	#notice_UL{		
		width: 100%;
		padding: 10px;
		margin: 0px;
		background-color: ffffcc;
	}
	#notice_UL li{		
		border: 0px dashed green;		
	}
</style>	


<cfoutput>

	<div id="managerApproval">
	
		<div id="managerApprovalContainer" class="window">	
			<ul id="managerApprovalHeaderTitle">
				<li id="managerApprovalTitle">Manager Approval</li>
				<li id="managerApprovalCloseImage"><img class="close" src="images/hd_btn_close.gif"></li>
			</ul>		
			<div id="div_errorMsgManagerApproval" class="mediumInput">
				<ul id="notice_UL">
					<li style="float: left;"><img src="images/alert.gif" alt="Alert" border="0" align="middle"></li>
					<li style="float: right;"><span id="sp_errorMsgManagerApproval"></span></li>
				</ul>		
				<ul id="managersList_UL"></ul>			 
			</div>			
			<div id="editableArea2">
				<div class="inputForm">			
					<div>
						<div class="mediumInput">
							<ol style="list-style: none;">
								<li style="float: left; width: 65px; text-align: right;"><label for="managerpassword" class="siteLabel">Manager&nbsp;Password:</label></li>
								<li><input type="Password" class="siteTextBox" maxLength="15" name="ManagerEntry" id="ManagerEntry"></li>
							</ol>					 
						</div>				
					</div>			
					<div>
						<div class="inputButton">
							<ol style="list-style: none;">
								<li style="text-align: center;">
									<input type="Button" name="submitButton" class="SiteSubmitBox" value="Submit" onclick="submitPassFunc();">
								</li>
							</ol>					 
						</div>				
					</div>																					
				</div>
			</div>	
		</div>		
			
		<div id="mask"></div>
	
	</div>
	
</cfoutput>


