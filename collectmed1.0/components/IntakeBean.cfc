 	


<cfcomponent name="intakeBean" output="false" alias="intakeBean" extends="IntakeDAO">

	<cfproperty name="IntakeID" type="numeric" default="0" />
	<cfproperty name="ClientID" type="numeric" default="" />
	<cfproperty name="AssignedToUserID" type="numeric" default="" />
	<cfproperty name="hidden_Step" type="string" default="" />
	<cfproperty name="hidden_UsersID" type="string" default="" />
	<cfproperty name="hidden_TimeStart" type="string" default="" />
	<cfproperty name="OPTION_1_CBox_Delivery" type="string" default="" />
	<cfproperty name="OPTION_1_CBox_Pickup" type="string" default="" />
	<cfproperty name="OPTION_1_CBox_Repair" type="string" default="" />
	<cfproperty name="OPTION_1_CBox_Switch" type="string" default="" />
	<cfproperty name="OPTION_1_CBox_Existing" type="string" default="" />
	<cfproperty name="OPTION_2_CBox_Other" type="string" default="" />
	<cfproperty name="OPTION_2_CBox_Hospice" type="string" default="" />
	<cfproperty name="OPTION_2_CBox_Hospital" type="string" default="" />
	<cfproperty name="otherTBox" type="string" default="" />
	<cfproperty name="hospiceTBox" type="string" default="" />
	<cfproperty name="OPTION_3_CBox_Medicare" type="string" default="" />
	<cfproperty name="OPTION_3_CBox_PrivateInsurance" type="string" default="" />
	<cfproperty name="OPTION_3_CBox_Medicaid" type="string" default="" />
	<cfproperty name="OPTION_3_CBox_PrivatePay" type="string" default="" />
	<cfproperty name="hospitalTBox" type="string" default="" />
	<cfproperty name="DischargeDateMM" type="string" default="" />
	<cfproperty name="DischargeDateDD" type="string" default="" />
	<cfproperty name="DischargeDateYY" type="string" default="" />
	<cfproperty name="typeOfPay_Radio" type="string" default="" />
	<cfproperty name="callerFNameTBox" type="string" default="" />
	<cfproperty name="callerMInitialTBox" type="string" default="" />
	<cfproperty name="callerLNameTBox" type="string" default="" />
	<cfproperty name="callerPhoneTBox" type="string" default="" />
	<cfproperty name="patientXML" type="string" default="" />
	<cfproperty name="patientID" type="numeric" default="" />
	<cfproperty name="patientAddressID" type="numeric" default="" />
	<cfproperty name="patientPhoneID" type="numeric" default="" />
	<cfproperty name="roomNumberTBox" type="string" default="" />
	<cfproperty name="bedNumberTBox" type="string" default="" />
	<cfproperty name="alternateContactFNameTBox" type="string" default="" />
	<cfproperty name="alternateContactMInitialTBox" type="string" default="" />
	<cfproperty name="alternateContactLNameTBox" type="string" default="" />
	<cfproperty name="alternateContactRelationshipTBox" type="string" default="" />
	<cfproperty name="alternateContactPhoneTBox" type="string" default="" />
	<cfproperty name="alternateContactWorkPhoneTBox" type="string" default="" />
	<cfproperty name="poNumberTBox" type="string" default="" />
	<cfproperty name="creditCardTypeTBox" type="string" default="" />
	<cfproperty name="creditCardNumberTBox" type="string" default="" />
	<cfproperty name="ccDateMM" type="string" default="" />
	<cfproperty name="ccDateDD" type="string" default="" />
	<cfproperty name="ccDateYY" type="string" default="" />
	<cfproperty name="orderingPhysicianFNameTBox" type="string" default="" />
	<cfproperty name="orderingPhysicianMInitialTBox" type="string" default="" />
	<cfproperty name="orderingPhysicianLNameTBox" type="string" default="" />
	<cfproperty name="orderingPhysicianPhoneTBox" type="string" default="" />
	<cfproperty name="orderingPhysicianUPINTBox" type="string" default="" />
	<cfproperty name="orderingPhysicianFaxTBox" type="string" default="" />
	<cfproperty name="orderingPhysicianAddressTBox" type="string" default="" />
	<cfproperty name="orderingPhysicianCityTBox" type="string" default="" />
	<cfproperty name="orderingPhysicianStateTBox" type="string" default="" />
	<cfproperty name="orderingPhysicianZipTBox" type="string" default="" />
	<cfproperty name="OPTION_13_CBox_PastEquipmentYes" type="string" default="" />
	<cfproperty name="OPTION_13_CBox_PastEquipmentNo" type="string" default="" />
	<cfproperty name="Equipment1TypeTBox" type="string" default="" />
	<cfproperty name="Equipment1RentPurchasedSelect" type="string" default="" />
	<cfproperty name="Equipment1FromMM" type="string" default="" />
	<cfproperty name="Equipment1FromDD" type="string" default="" />
	<cfproperty name="Equipment1FromYY" type="string" default="" />
	<cfproperty name="Equipment1ToMM" type="string" default="" />
	<cfproperty name="Equipment1ToDD" type="string" default="" />
	<cfproperty name="Equipment1ToYY" type="string" default="" />
	<cfproperty name="Equipment1SupplierNameTBox" type="string" default="" />
	<cfproperty name="Equipment1SupplierTelephoneTBox" type="string" default="" />
	<cfproperty name="Equipment2TypeTBox" type="string" default="" />
	<cfproperty name="Equipment2RentPurchasedSelect" type="string" default="" />
	<cfproperty name="Equipment2FromMM" type="string" default="" />
	<cfproperty name="Equipment2FromDD" type="string" default="" />
	<cfproperty name="Equipment2FromYY" type="string" default="" />
	<cfproperty name="Equipment2ToMM" type="string" default="" />
	<cfproperty name="Equipment2ToDD" type="string" default="" />
	<cfproperty name="Equipment2ToYY" type="string" default="" />
	<cfproperty name="Equipment2SupplierNameTBox" type="string" default="" />
	<cfproperty name="Equipment2SupplierTelephoneTBox" type="string" default="" />
	<cfproperty name="Equipment3TypeTBox" type="string" default="" />
	<cfproperty name="Equipment3RentPurchasedSelect" type="string" default="" />
	<cfproperty name="Equipment3FromMM" type="string" default="" />
	<cfproperty name="Equipment3FromDD" type="string" default="" />
	<cfproperty name="Equipment3FromYY" type="string" default="" />
	<cfproperty name="Equipment3ToMM" type="string" default="" />
	<cfproperty name="Equipment3ToDD" type="string" default="" />
	<cfproperty name="Equipment3ToYY" type="string" default="" />
	<cfproperty name="Equipment3SupplierNameTBox" type="string" default="" />
	<cfproperty name="Equipment3SupplierTelephoneTBox" type="string" default="" />
	<cfproperty name="Equipment4TypeTBox" type="string" default="" />
	<cfproperty name="Equipment4RentPurchasedSelect" type="string" default="" />
	<cfproperty name="Equipment4FromMM" type="string" default="" />
	<cfproperty name="Equipment4FromDD" type="string" default="" />
	<cfproperty name="Equipment4FromYY" type="string" default="" />
	<cfproperty name="Equipment4ToMM" type="string" default="" />
	<cfproperty name="Equipment4ToDD" type="string" default="" />
	<cfproperty name="Equipment4ToYY" type="string" default="" />
	<cfproperty name="Equipment4SupplierNameTBox" type="string" default="" />
	<cfproperty name="Equipment4SupplierTelephoneTBox" type="string" default="" />
	<cfproperty name="Equipment5TypeTBox" type="string" default="" />
	<cfproperty name="Equipment5RentPurchasedSelect" type="string" default="" />
	<cfproperty name="Equipment5FromMM" type="string" default="" />
	<cfproperty name="Equipment5FromDD" type="string" default="" />
	<cfproperty name="Equipment5FromYY" type="string" default="" />
	<cfproperty name="Equipment5ToMM" type="string" default="" />
	<cfproperty name="Equipment5ToDD" type="string" default="" />
	<cfproperty name="Equipment5ToYY" type="string" default="" />
	<cfproperty name="Equipment5SupplierNameTBox" type="string" default="" />
	<cfproperty name="Equipment5SupplierTelephoneTBox" type="string" default="" />
	<cfproperty name="Equipment1NoteTBox" type="string" default="" />
	<cfproperty name="Equipment2NoteTBox" type="string" default="" />
	<cfproperty name="Equipment3NoteTBox" type="string" default="" />
	<cfproperty name="Equipment4NoteTBox" type="string" default="" />
	<cfproperty name="Equipment5NoteTBox" type="string" default="" />
	<cfproperty name="OPTION_14_CBox_OxygenPAo2" type="string" default="" />
	<cfproperty name="OPTION_14_CBox_OxygenSAo2" type="string" default="" />
	<cfproperty name="OPTION_14_CBox_OxygenSPo2" type="string" default="" />
	<cfproperty name="OxygenPAO2TBox" type="string" default="" />
	<cfproperty name="OxygenSAO2TBox" type="string" default="" />
	<cfproperty name="CPAPStudy_CBox" type="string" default="" />
	<cfproperty name="CPAPStudyNote" type="string" default="" />
	<cfproperty name="OxygenSPO2TBox" type="string" default="" />
	<cfproperty name="CPAPStudyOnFile_CBox" type="string" default="" />
	<cfproperty name="CPAPStudyOnFileNote" type="string" default="" />
	<cfproperty name="LabTestDateMM" type="string" default="" />
	<cfproperty name="LabTestDateDD" type="string" default="" />
	<cfproperty name="LabTestDateYY" type="string" default="" />
	<cfproperty name="CPAPStudyPerformedAt" type="string" default="" />
	<cfproperty name="LabTestFacilityTBox" type="string" default="" />
	<cfproperty name="CPAPStudyPerformedAt2" type="string" default="" />
	<cfproperty name="CPAPStudyPerformedAt3" type="string" default="" />
	<cfproperty name="ClosingInvoiceNumber" type="string" default="" />
	<cfproperty name="OPTION_SkilledNursing" type="string" default="" />
	<cfproperty name="SkilledNursingName" type="string" default="" />
	<cfproperty name="SkilledNursingTelephone" type="string" default="" />
	<cfproperty name="Printed" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.IntakeID = 0;
		variables.ClientID = "";
		variables.AssignedToUserID = "";
		variables.hidden_Step = "";
		variables.hidden_UsersID = "";
		variables.hidden_TimeStart = "";
		variables.OPTION_1_CBox_Delivery = "";
		variables.OPTION_1_CBox_Pickup = "";
		variables.OPTION_1_CBox_Repair = "";
		variables.OPTION_1_CBox_Switch = "";
		variables.OPTION_1_CBox_Existing = "";
		variables.OPTION_2_CBox_Other = "";
		variables.OPTION_2_CBox_Hospice = "";
		variables.OPTION_2_CBox_Hospital = "";
		variables.otherTBox = "";
		variables.hospiceTBox = "";
		variables.OPTION_3_CBox_Medicare = "";
		variables.OPTION_3_CBox_PrivateInsurance = "";
		variables.OPTION_3_CBox_Medicaid = "";
		variables.OPTION_3_CBox_PrivatePay = "";
		variables.hospitalTBox = "";
		variables.DischargeDateMM = "";
		variables.DischargeDateDD = "";
		variables.DischargeDateYY = "";
		variables.typeOfPay_Radio = "";
		variables.callerFNameTBox = "";
		variables.callerMInitialTBox = "";
		variables.callerLNameTBox = "";
		variables.callerPhoneTBox = "";
		variables.patientXML = "";
		variables.patientID = "";
		variables.patientAddressID = "";
		variables.patientPhoneID = "";
		variables.roomNumberTBox = "";
		variables.bedNumberTBox = "";
		variables.alternateContactFNameTBox = "";
		variables.alternateContactMInitialTBox = "";
		variables.alternateContactLNameTBox = "";
		variables.alternateContactRelationshipTBox = "";
		variables.alternateContactPhoneTBox = "";
		variables.alternateContactWorkPhoneTBox = "";
		variables.poNumberTBox = "";
		variables.creditCardTypeTBox = "";
		variables.creditCardNumberTBox = "";
		variables.ccDateMM = "";
		variables.ccDateDD = "";
		variables.ccDateYY = "";
		variables.orderingPhysicianFNameTBox = "";
		variables.orderingPhysicianMInitialTBox = "";
		variables.orderingPhysicianLNameTBox = "";
		variables.orderingPhysicianPhoneTBox = "";
		variables.orderingPhysicianUPINTBox = "";
		variables.orderingPhysicianFaxTBox = "";
		variables.orderingPhysicianAddressTBox = "";
		variables.orderingPhysicianCityTBox = "";
		variables.orderingPhysicianStateTBox = "";
		variables.orderingPhysicianZipTBox = "";
		variables.OPTION_13_CBox_PastEquipmentYes = "";
		variables.OPTION_13_CBox_PastEquipmentNo = "";
		variables.Equipment1TypeTBox = "";
		variables.Equipment1RentPurchasedSelect = "";
		variables.Equipment1FromMM = "";
		variables.Equipment1FromDD = "";
		variables.Equipment1FromYY = "";
		variables.Equipment1ToMM = "";
		variables.Equipment1ToDD = "";
		variables.Equipment1ToYY = "";
		variables.Equipment1SupplierNameTBox = "";
		variables.Equipment1SupplierTelephoneTBox = "";
		variables.Equipment2TypeTBox = "";
		variables.Equipment2RentPurchasedSelect = "";
		variables.Equipment2FromMM = "";
		variables.Equipment2FromDD = "";
		variables.Equipment2FromYY = "";
		variables.Equipment2ToMM = "";
		variables.Equipment2ToDD = "";
		variables.Equipment2ToYY = "";
		variables.Equipment2SupplierNameTBox = "";
		variables.Equipment2SupplierTelephoneTBox = "";
		variables.Equipment3TypeTBox = "";
		variables.Equipment3RentPurchasedSelect = "";
		variables.Equipment3FromMM = "";
		variables.Equipment3FromDD = "";
		variables.Equipment3FromYY = "";
		variables.Equipment3ToMM = "";
		variables.Equipment3ToDD = "";
		variables.Equipment3ToYY = "";
		variables.Equipment3SupplierNameTBox = "";
		variables.Equipment3SupplierTelephoneTBox = "";
		variables.Equipment4TypeTBox = "";
		variables.Equipment4RentPurchasedSelect = "";
		variables.Equipment4FromMM = "";
		variables.Equipment4FromDD = "";
		variables.Equipment4FromYY = "";
		variables.Equipment4ToMM = "";
		variables.Equipment4ToDD = "";
		variables.Equipment4ToYY = "";
		variables.Equipment4SupplierNameTBox = "";
		variables.Equipment4SupplierTelephoneTBox = "";
		variables.Equipment5TypeTBox = "";
		variables.Equipment5RentPurchasedSelect = "";
		variables.Equipment5FromMM = "";
		variables.Equipment5FromDD = "";
		variables.Equipment5FromYY = "";
		variables.Equipment5ToMM = "";
		variables.Equipment5ToDD = "";
		variables.Equipment5ToYY = "";
		variables.Equipment5SupplierNameTBox = "";
		variables.Equipment5SupplierTelephoneTBox = "";
		variables.Equipment1NoteTBox = "";
		variables.Equipment2NoteTBox = "";
		variables.Equipment3NoteTBox = "";
		variables.Equipment4NoteTBox = "";
		variables.Equipment5NoteTBox = "";
		variables.OPTION_14_CBox_OxygenPAo2 = "";
		variables.OPTION_14_CBox_OxygenSAo2 = "";
		variables.OPTION_14_CBox_OxygenSPo2 = "";
		variables.OxygenPAO2TBox = "";
		variables.OxygenSAO2TBox = "";
		variables.CPAPStudy_CBox = "";
		variables.CPAPStudyNote = "";
		variables.OxygenSPO2TBox = "";
		variables.CPAPStudyOnFile_CBox = "";
		variables.CPAPStudyOnFileNote = "";
		variables.LabTestDateMM = "";
		variables.LabTestDateDD = "";
		variables.LabTestDateYY = "";
		variables.CPAPStudyPerformedAt = "";
		variables.LabTestFacilityTBox = "";
		variables.CPAPStudyPerformedAt2 = "";
		variables.CPAPStudyPerformedAt3 = "";
		variables.ClosingInvoiceNumber = "";
		variables.OPTION_SkilledNursing = "";
		variables.SkilledNursingName = "";
		variables.SkilledNursingTelephone = "";
		variables.Printed = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="intakeBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "IntakeID") AND stValues.IntakeID NEQ 0>
				<cfquery name="qGetIntake" datasource="#trim(arguments.ds)#">
			  		SELECT IntakeID,ClientID,AssignedToUserID,hidden_Step,hidden_UsersID,hidden_TimeStart,OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing,OPTION_2_CBox_Other,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital,otherTBox,hospiceTBox,OPTION_3_CBox_Medicare,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay,hospitalTBox,DischargeDateMM,DischargeDateDD,DischargeDateYY,typeOfPay_Radio,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientXML,patientID,patientAddressID,patientPhoneID,roomNumberTBox,bedNumberTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,poNumberTBox,creditCardTypeTBox,creditCardNumberTBox,ccDateMM,ccDateDD,ccDateYY,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,orderingPhysicianUPINTBox,orderingPhysicianFaxTBox,orderingPhysicianAddressTBox,orderingPhysicianCityTBox,orderingPhysicianStateTBox,orderingPhysicianZipTBox,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo,Equipment1TypeTBox,Equipment1RentPurchasedSelect,Equipment1FromMM,Equipment1FromDD,Equipment1FromYY,Equipment1ToMM,Equipment1ToDD,Equipment1ToYY,Equipment1SupplierNameTBox,Equipment1SupplierTelephoneTBox,Equipment2TypeTBox,Equipment2RentPurchasedSelect,Equipment2FromMM,Equipment2FromDD,Equipment2FromYY,Equipment2ToMM,Equipment2ToDD,Equipment2ToYY,Equipment2SupplierNameTBox,Equipment2SupplierTelephoneTBox,Equipment3TypeTBox,Equipment3RentPurchasedSelect,Equipment3FromMM,Equipment3FromDD,Equipment3FromYY,Equipment3ToMM,Equipment3ToDD,Equipment3ToYY,Equipment3SupplierNameTBox,Equipment3SupplierTelephoneTBox,Equipment4TypeTBox,Equipment4RentPurchasedSelect,Equipment4FromMM,Equipment4FromDD,Equipment4FromYY,Equipment4ToMM,Equipment4ToDD,Equipment4ToYY,Equipment4SupplierNameTBox,Equipment4SupplierTelephoneTBox,Equipment5TypeTBox,Equipment5RentPurchasedSelect,Equipment5FromMM,Equipment5FromDD,Equipment5FromYY,Equipment5ToMM,Equipment5ToDD,Equipment5ToYY,Equipment5SupplierNameTBox,Equipment5SupplierTelephoneTBox,Equipment1NoteTBox,Equipment2NoteTBox,Equipment3NoteTBox,Equipment4NoteTBox,Equipment5NoteTBox,OPTION_14_CBox_OxygenPAo2,OPTION_14_CBox_OxygenSAo2,OPTION_14_CBox_OxygenSPo2,OxygenPAO2TBox,OxygenSAO2TBox,CPAPStudy_CBox,CPAPStudyNote,OxygenSPO2TBox,CPAPStudyOnFile_CBox,CPAPStudyOnFileNote,LabTestDateMM,LabTestDateDD,LabTestDateYY,CPAPStudyPerformedAt,LabTestFacilityTBox,CPAPStudyPerformedAt2,CPAPStudyPerformedAt3,ClosingInvoiceNumber,OPTION_SkilledNursing,SkilledNursingName,SkilledNursingTelephone,Printed,Active,InactiveCode,DateCreated,DateModified
					FROM Intake  
					WHERE IntakeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.IntakeID#" /> 
				</cfquery>		
				<cfif qGetIntake.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ClientID = qGetIntake.ClientID;
					variables.AssignedToUserID = qGetIntake.AssignedToUserID;
					variables.hidden_Step = qGetIntake.hidden_Step;
					variables.hidden_UsersID = qGetIntake.hidden_UsersID;
					variables.hidden_TimeStart = qGetIntake.hidden_TimeStart;
					variables.OPTION_1_CBox_Delivery = qGetIntake.OPTION_1_CBox_Delivery;
					variables.OPTION_1_CBox_Pickup = qGetIntake.OPTION_1_CBox_Pickup;
					variables.OPTION_1_CBox_Repair = qGetIntake.OPTION_1_CBox_Repair;
					variables.OPTION_1_CBox_Switch = qGetIntake.OPTION_1_CBox_Switch;
					variables.OPTION_1_CBox_Existing = qGetIntake.OPTION_1_CBox_Existing;
					variables.OPTION_2_CBox_Other = qGetIntake.OPTION_2_CBox_Other;
					variables.OPTION_2_CBox_Hospice = qGetIntake.OPTION_2_CBox_Hospice;
					variables.OPTION_2_CBox_Hospital = qGetIntake.OPTION_2_CBox_Hospital;
					variables.otherTBox = qGetIntake.otherTBox;
					variables.hospiceTBox = qGetIntake.hospiceTBox;
					variables.OPTION_3_CBox_Medicare = qGetIntake.OPTION_3_CBox_Medicare;
					variables.OPTION_3_CBox_PrivateInsurance = qGetIntake.OPTION_3_CBox_PrivateInsurance;
					variables.OPTION_3_CBox_Medicaid = qGetIntake.OPTION_3_CBox_Medicaid;
					variables.OPTION_3_CBox_PrivatePay = qGetIntake.OPTION_3_CBox_PrivatePay;
					variables.hospitalTBox = qGetIntake.hospitalTBox;
					variables.DischargeDateMM = qGetIntake.DischargeDateMM;
					variables.DischargeDateDD = qGetIntake.DischargeDateDD;
					variables.DischargeDateYY = qGetIntake.DischargeDateYY;
					variables.typeOfPay_Radio = qGetIntake.typeOfPay_Radio;
					variables.callerFNameTBox = qGetIntake.callerFNameTBox;
					variables.callerMInitialTBox = qGetIntake.callerMInitialTBox;
					variables.callerLNameTBox = qGetIntake.callerLNameTBox;
					variables.callerPhoneTBox = qGetIntake.callerPhoneTBox;
					variables.patientXML = qGetIntake.patientXML;
					variables.patientID = qGetIntake.patientID;
					variables.patientAddressID = qGetIntake.patientAddressID;
					variables.patientPhoneID = qGetIntake.patientPhoneID;
					variables.roomNumberTBox = qGetIntake.roomNumberTBox;
					variables.bedNumberTBox = qGetIntake.bedNumberTBox;
					variables.alternateContactFNameTBox = qGetIntake.alternateContactFNameTBox;
					variables.alternateContactMInitialTBox = qGetIntake.alternateContactMInitialTBox;
					variables.alternateContactLNameTBox = qGetIntake.alternateContactLNameTBox;
					variables.alternateContactRelationshipTBox = qGetIntake.alternateContactRelationshipTBox;
					variables.alternateContactPhoneTBox = qGetIntake.alternateContactPhoneTBox;
					variables.alternateContactWorkPhoneTBox = qGetIntake.alternateContactWorkPhoneTBox;
					variables.poNumberTBox = qGetIntake.poNumberTBox;
					variables.creditCardTypeTBox = qGetIntake.creditCardTypeTBox;
					variables.creditCardNumberTBox = qGetIntake.creditCardNumberTBox;
					variables.ccDateMM = qGetIntake.ccDateMM;
					variables.ccDateDD = qGetIntake.ccDateDD;
					variables.ccDateYY = qGetIntake.ccDateYY;
					variables.orderingPhysicianFNameTBox = qGetIntake.orderingPhysicianFNameTBox;
					variables.orderingPhysicianMInitialTBox = qGetIntake.orderingPhysicianMInitialTBox;
					variables.orderingPhysicianLNameTBox = qGetIntake.orderingPhysicianLNameTBox;
					variables.orderingPhysicianPhoneTBox = qGetIntake.orderingPhysicianPhoneTBox;
					variables.orderingPhysicianUPINTBox = qGetIntake.orderingPhysicianUPINTBox;
					variables.orderingPhysicianFaxTBox = qGetIntake.orderingPhysicianFaxTBox;
					variables.orderingPhysicianAddressTBox = qGetIntake.orderingPhysicianAddressTBox;
					variables.orderingPhysicianCityTBox = qGetIntake.orderingPhysicianCityTBox;
					variables.orderingPhysicianStateTBox = qGetIntake.orderingPhysicianStateTBox;
					variables.orderingPhysicianZipTBox = qGetIntake.orderingPhysicianZipTBox;
					variables.OPTION_13_CBox_PastEquipmentYes = qGetIntake.OPTION_13_CBox_PastEquipmentYes;
					variables.OPTION_13_CBox_PastEquipmentNo = qGetIntake.OPTION_13_CBox_PastEquipmentNo;
					variables.Equipment1TypeTBox = qGetIntake.Equipment1TypeTBox;
					variables.Equipment1RentPurchasedSelect = qGetIntake.Equipment1RentPurchasedSelect;
					variables.Equipment1FromMM = qGetIntake.Equipment1FromMM;
					variables.Equipment1FromDD = qGetIntake.Equipment1FromDD;
					variables.Equipment1FromYY = qGetIntake.Equipment1FromYY;
					variables.Equipment1ToMM = qGetIntake.Equipment1ToMM;
					variables.Equipment1ToDD = qGetIntake.Equipment1ToDD;
					variables.Equipment1ToYY = qGetIntake.Equipment1ToYY;
					variables.Equipment1SupplierNameTBox = qGetIntake.Equipment1SupplierNameTBox;
					variables.Equipment1SupplierTelephoneTBox = qGetIntake.Equipment1SupplierTelephoneTBox;
					variables.Equipment2TypeTBox = qGetIntake.Equipment2TypeTBox;
					variables.Equipment2RentPurchasedSelect = qGetIntake.Equipment2RentPurchasedSelect;
					variables.Equipment2FromMM = qGetIntake.Equipment2FromMM;
					variables.Equipment2FromDD = qGetIntake.Equipment2FromDD;
					variables.Equipment2FromYY = qGetIntake.Equipment2FromYY;
					variables.Equipment2ToMM = qGetIntake.Equipment2ToMM;
					variables.Equipment2ToDD = qGetIntake.Equipment2ToDD;
					variables.Equipment2ToYY = qGetIntake.Equipment2ToYY;
					variables.Equipment2SupplierNameTBox = qGetIntake.Equipment2SupplierNameTBox;
					variables.Equipment2SupplierTelephoneTBox = qGetIntake.Equipment2SupplierTelephoneTBox;
					variables.Equipment3TypeTBox = qGetIntake.Equipment3TypeTBox;
					variables.Equipment3RentPurchasedSelect = qGetIntake.Equipment3RentPurchasedSelect;
					variables.Equipment3FromMM = qGetIntake.Equipment3FromMM;
					variables.Equipment3FromDD = qGetIntake.Equipment3FromDD;
					variables.Equipment3FromYY = qGetIntake.Equipment3FromYY;
					variables.Equipment3ToMM = qGetIntake.Equipment3ToMM;
					variables.Equipment3ToDD = qGetIntake.Equipment3ToDD;
					variables.Equipment3ToYY = qGetIntake.Equipment3ToYY;
					variables.Equipment3SupplierNameTBox = qGetIntake.Equipment3SupplierNameTBox;
					variables.Equipment3SupplierTelephoneTBox = qGetIntake.Equipment3SupplierTelephoneTBox;
					variables.Equipment4TypeTBox = qGetIntake.Equipment4TypeTBox;
					variables.Equipment4RentPurchasedSelect = qGetIntake.Equipment4RentPurchasedSelect;
					variables.Equipment4FromMM = qGetIntake.Equipment4FromMM;
					variables.Equipment4FromDD = qGetIntake.Equipment4FromDD;
					variables.Equipment4FromYY = qGetIntake.Equipment4FromYY;
					variables.Equipment4ToMM = qGetIntake.Equipment4ToMM;
					variables.Equipment4ToDD = qGetIntake.Equipment4ToDD;
					variables.Equipment4ToYY = qGetIntake.Equipment4ToYY;
					variables.Equipment4SupplierNameTBox = qGetIntake.Equipment4SupplierNameTBox;
					variables.Equipment4SupplierTelephoneTBox = qGetIntake.Equipment4SupplierTelephoneTBox;
					variables.Equipment5TypeTBox = qGetIntake.Equipment5TypeTBox;
					variables.Equipment5RentPurchasedSelect = qGetIntake.Equipment5RentPurchasedSelect;
					variables.Equipment5FromMM = qGetIntake.Equipment5FromMM;
					variables.Equipment5FromDD = qGetIntake.Equipment5FromDD;
					variables.Equipment5FromYY = qGetIntake.Equipment5FromYY;
					variables.Equipment5ToMM = qGetIntake.Equipment5ToMM;
					variables.Equipment5ToDD = qGetIntake.Equipment5ToDD;
					variables.Equipment5ToYY = qGetIntake.Equipment5ToYY;
					variables.Equipment5SupplierNameTBox = qGetIntake.Equipment5SupplierNameTBox;
					variables.Equipment5SupplierTelephoneTBox = qGetIntake.Equipment5SupplierTelephoneTBox;
					variables.Equipment1NoteTBox = qGetIntake.Equipment1NoteTBox;
					variables.Equipment2NoteTBox = qGetIntake.Equipment2NoteTBox;
					variables.Equipment3NoteTBox = qGetIntake.Equipment3NoteTBox;
					variables.Equipment4NoteTBox = qGetIntake.Equipment4NoteTBox;
					variables.Equipment5NoteTBox = qGetIntake.Equipment5NoteTBox;
					variables.OPTION_14_CBox_OxygenPAo2 = qGetIntake.OPTION_14_CBox_OxygenPAo2;
					variables.OPTION_14_CBox_OxygenSAo2 = qGetIntake.OPTION_14_CBox_OxygenSAo2;
					variables.OPTION_14_CBox_OxygenSPo2 = qGetIntake.OPTION_14_CBox_OxygenSPo2;
					variables.OxygenPAO2TBox = qGetIntake.OxygenPAO2TBox;
					variables.OxygenSAO2TBox = qGetIntake.OxygenSAO2TBox;
					variables.CPAPStudy_CBox = qGetIntake.CPAPStudy_CBox;
					variables.CPAPStudyNote = qGetIntake.CPAPStudyNote;
					variables.OxygenSPO2TBox = qGetIntake.OxygenSPO2TBox;
					variables.CPAPStudyOnFile_CBox = qGetIntake.CPAPStudyOnFile_CBox;
					variables.CPAPStudyOnFileNote = qGetIntake.CPAPStudyOnFileNote;
					variables.LabTestDateMM = qGetIntake.LabTestDateMM;
					variables.LabTestDateDD = qGetIntake.LabTestDateDD;
					variables.LabTestDateYY = qGetIntake.LabTestDateYY;
					variables.CPAPStudyPerformedAt = qGetIntake.CPAPStudyPerformedAt;
					variables.LabTestFacilityTBox = qGetIntake.LabTestFacilityTBox;
					variables.CPAPStudyPerformedAt2 = qGetIntake.CPAPStudyPerformedAt2;
					variables.CPAPStudyPerformedAt3 = qGetIntake.CPAPStudyPerformedAt3;
					variables.ClosingInvoiceNumber = qGetIntake.ClosingInvoiceNumber;
					variables.OPTION_SkilledNursing = qGetIntake.OPTION_SkilledNursing;
					variables.SkilledNursingName = qGetIntake.SkilledNursingName;
					variables.SkilledNursingTelephone = qGetIntake.SkilledNursingTelephone;
					variables.Printed = qGetIntake.Printed;
					variables.Active = qGetIntake.Active;
					variables.InactiveCode = qGetIntake.InactiveCode;
					variables.DateModified = qGetIntake.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "IntakeID")><cfset variables.IntakeID = stValues.IntakeID /></cfif>
			<cfif StructKeyExists(stValues, "ClientID")><cfset variables.ClientID = stValues.ClientID /></cfif>
			<cfif StructKeyExists(stValues, "AssignedToUserID")><cfset variables.AssignedToUserID = stValues.AssignedToUserID /></cfif>
			<cfif StructKeyExists(stValues, "hidden_Step")><cfset variables.hidden_Step = stValues.hidden_Step /></cfif>
			<cfif StructKeyExists(stValues, "hidden_UsersID")><cfset variables.hidden_UsersID = stValues.hidden_UsersID /></cfif>
			<cfif StructKeyExists(stValues, "hidden_TimeStart")><cfset variables.hidden_TimeStart = stValues.hidden_TimeStart /></cfif>
			<cfif StructKeyExists(stValues, "OPTION_1_CBox_Delivery")><cfset variables.OPTION_1_CBox_Delivery = stValues.OPTION_1_CBox_Delivery /></cfif>
			<cfif StructKeyExists(stValues, "OPTION_1_CBox_Pickup")><cfset variables.OPTION_1_CBox_Pickup = stValues.OPTION_1_CBox_Pickup /></cfif>
			<cfif StructKeyExists(stValues, "OPTION_1_CBox_Repair")><cfset variables.OPTION_1_CBox_Repair = stValues.OPTION_1_CBox_Repair /></cfif>
			<cfif StructKeyExists(stValues, "OPTION_1_CBox_Switch")><cfset variables.OPTION_1_CBox_Switch = stValues.OPTION_1_CBox_Switch /></cfif>
			<cfif StructKeyExists(stValues, "OPTION_1_CBox_Existing")><cfset variables.OPTION_1_CBox_Existing = stValues.OPTION_1_CBox_Existing /></cfif>
			<cfif StructKeyExists(stValues, "OPTION_2_CBox_Other")><cfset variables.OPTION_2_CBox_Other = stValues.OPTION_2_CBox_Other /></cfif>
			<cfif StructKeyExists(stValues, "OPTION_2_CBox_Hospice")><cfset variables.OPTION_2_CBox_Hospice = stValues.OPTION_2_CBox_Hospice /></cfif>
			<cfif StructKeyExists(stValues, "OPTION_2_CBox_Hospital")><cfset variables.OPTION_2_CBox_Hospital = stValues.OPTION_2_CBox_Hospital /></cfif>
			<cfif StructKeyExists(stValues, "otherTBox")><cfset variables.otherTBox = stValues.otherTBox /></cfif>
			<cfif StructKeyExists(stValues, "hospiceTBox")><cfset variables.hospiceTBox = stValues.hospiceTBox /></cfif>
			<cfif StructKeyExists(stValues, "OPTION_3_CBox_Medicare")><cfset variables.OPTION_3_CBox_Medicare = stValues.OPTION_3_CBox_Medicare /></cfif>
			<cfif StructKeyExists(stValues, "OPTION_3_CBox_PrivateInsurance")><cfset variables.OPTION_3_CBox_PrivateInsurance = stValues.OPTION_3_CBox_PrivateInsurance /></cfif>
			<cfif StructKeyExists(stValues, "OPTION_3_CBox_Medicaid")><cfset variables.OPTION_3_CBox_Medicaid = stValues.OPTION_3_CBox_Medicaid /></cfif>
			<cfif StructKeyExists(stValues, "OPTION_3_CBox_PrivatePay")><cfset variables.OPTION_3_CBox_PrivatePay = stValues.OPTION_3_CBox_PrivatePay /></cfif>
			<cfif StructKeyExists(stValues, "hospitalTBox")><cfset variables.hospitalTBox = stValues.hospitalTBox /></cfif>
			<cfif StructKeyExists(stValues, "DischargeDateMM")><cfset variables.DischargeDateMM = stValues.DischargeDateMM /></cfif>
			<cfif StructKeyExists(stValues, "DischargeDateDD")><cfset variables.DischargeDateDD = stValues.DischargeDateDD /></cfif>
			<cfif StructKeyExists(stValues, "DischargeDateYY")><cfset variables.DischargeDateYY = stValues.DischargeDateYY /></cfif>
			<cfif StructKeyExists(stValues, "typeOfPay_Radio")><cfset variables.typeOfPay_Radio = stValues.typeOfPay_Radio /></cfif>
			<cfif StructKeyExists(stValues, "callerFNameTBox")><cfset variables.callerFNameTBox = stValues.callerFNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "callerMInitialTBox")><cfset variables.callerMInitialTBox = stValues.callerMInitialTBox /></cfif>
			<cfif StructKeyExists(stValues, "callerLNameTBox")><cfset variables.callerLNameTBox = stValues.callerLNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "callerPhoneTBox")><cfset variables.callerPhoneTBox = stValues.callerPhoneTBox /></cfif>
			<cfif StructKeyExists(stValues, "patientXML")><cfset variables.patientXML = stValues.patientXML /></cfif>
			<cfif StructKeyExists(stValues, "patientID")><cfset variables.patientID = stValues.patientID /></cfif>
			<cfif StructKeyExists(stValues, "patientAddressID")><cfset variables.patientAddressID = stValues.patientAddressID /></cfif>
			<cfif StructKeyExists(stValues, "patientPhoneID")><cfset variables.patientPhoneID = stValues.patientPhoneID /></cfif>
			<cfif StructKeyExists(stValues, "roomNumberTBox")><cfset variables.roomNumberTBox = stValues.roomNumberTBox /></cfif>
			<cfif StructKeyExists(stValues, "bedNumberTBox")><cfset variables.bedNumberTBox = stValues.bedNumberTBox /></cfif>
			<cfif StructKeyExists(stValues, "alternateContactFNameTBox")><cfset variables.alternateContactFNameTBox = stValues.alternateContactFNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "alternateContactMInitialTBox")><cfset variables.alternateContactMInitialTBox = stValues.alternateContactMInitialTBox /></cfif>
			<cfif StructKeyExists(stValues, "alternateContactLNameTBox")><cfset variables.alternateContactLNameTBox = stValues.alternateContactLNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "alternateContactRelationshipTBox")><cfset variables.alternateContactRelationshipTBox = stValues.alternateContactRelationshipTBox /></cfif>
			<cfif StructKeyExists(stValues, "alternateContactPhoneTBox")><cfset variables.alternateContactPhoneTBox = stValues.alternateContactPhoneTBox /></cfif>
			<cfif StructKeyExists(stValues, "alternateContactWorkPhoneTBox")><cfset variables.alternateContactWorkPhoneTBox = stValues.alternateContactWorkPhoneTBox /></cfif>
			<cfif StructKeyExists(stValues, "poNumberTBox")><cfset variables.poNumberTBox = stValues.poNumberTBox /></cfif>
			<cfif StructKeyExists(stValues, "creditCardTypeTBox")><cfset variables.creditCardTypeTBox = stValues.creditCardTypeTBox /></cfif>
			<cfif StructKeyExists(stValues, "creditCardNumberTBox")><cfset variables.creditCardNumberTBox = stValues.creditCardNumberTBox /></cfif>
			<cfif StructKeyExists(stValues, "ccDateMM")><cfset variables.ccDateMM = stValues.ccDateMM /></cfif>
			<cfif StructKeyExists(stValues, "ccDateDD")><cfset variables.ccDateDD = stValues.ccDateDD /></cfif>
			<cfif StructKeyExists(stValues, "ccDateYY")><cfset variables.ccDateYY = stValues.ccDateYY /></cfif>
			<cfif StructKeyExists(stValues, "orderingPhysicianFNameTBox")><cfset variables.orderingPhysicianFNameTBox = stValues.orderingPhysicianFNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "orderingPhysicianMInitialTBox")><cfset variables.orderingPhysicianMInitialTBox = stValues.orderingPhysicianMInitialTBox /></cfif>
			<cfif StructKeyExists(stValues, "orderingPhysicianLNameTBox")><cfset variables.orderingPhysicianLNameTBox = stValues.orderingPhysicianLNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "orderingPhysicianPhoneTBox")><cfset variables.orderingPhysicianPhoneTBox = stValues.orderingPhysicianPhoneTBox /></cfif>
			<cfif StructKeyExists(stValues, "orderingPhysicianUPINTBox")><cfset variables.orderingPhysicianUPINTBox = stValues.orderingPhysicianUPINTBox /></cfif>
			<cfif StructKeyExists(stValues, "orderingPhysicianFaxTBox")><cfset variables.orderingPhysicianFaxTBox = stValues.orderingPhysicianFaxTBox /></cfif>
			<cfif StructKeyExists(stValues, "orderingPhysicianAddressTBox")><cfset variables.orderingPhysicianAddressTBox = stValues.orderingPhysicianAddressTBox /></cfif>
			<cfif StructKeyExists(stValues, "orderingPhysicianCityTBox")><cfset variables.orderingPhysicianCityTBox = stValues.orderingPhysicianCityTBox /></cfif>
			<cfif StructKeyExists(stValues, "orderingPhysicianStateTBox")><cfset variables.orderingPhysicianStateTBox = stValues.orderingPhysicianStateTBox /></cfif>
			<cfif StructKeyExists(stValues, "orderingPhysicianZipTBox")><cfset variables.orderingPhysicianZipTBox = stValues.orderingPhysicianZipTBox /></cfif>
			<cfif StructKeyExists(stValues, "OPTION_13_CBox_PastEquipmentYes")><cfset variables.OPTION_13_CBox_PastEquipmentYes = stValues.OPTION_13_CBox_PastEquipmentYes /></cfif>
			<cfif StructKeyExists(stValues, "OPTION_13_CBox_PastEquipmentNo")><cfset variables.OPTION_13_CBox_PastEquipmentNo = stValues.OPTION_13_CBox_PastEquipmentNo /></cfif>
			<cfif StructKeyExists(stValues, "Equipment1TypeTBox")><cfset variables.Equipment1TypeTBox = stValues.Equipment1TypeTBox /></cfif>
			<cfif StructKeyExists(stValues, "Equipment1RentPurchasedSelect")><cfset variables.Equipment1RentPurchasedSelect = stValues.Equipment1RentPurchasedSelect /></cfif>
			<cfif StructKeyExists(stValues, "Equipment1FromMM")><cfset variables.Equipment1FromMM = stValues.Equipment1FromMM /></cfif>
			<cfif StructKeyExists(stValues, "Equipment1FromDD")><cfset variables.Equipment1FromDD = stValues.Equipment1FromDD /></cfif>
			<cfif StructKeyExists(stValues, "Equipment1FromYY")><cfset variables.Equipment1FromYY = stValues.Equipment1FromYY /></cfif>
			<cfif StructKeyExists(stValues, "Equipment1ToMM")><cfset variables.Equipment1ToMM = stValues.Equipment1ToMM /></cfif>
			<cfif StructKeyExists(stValues, "Equipment1ToDD")><cfset variables.Equipment1ToDD = stValues.Equipment1ToDD /></cfif>
			<cfif StructKeyExists(stValues, "Equipment1ToYY")><cfset variables.Equipment1ToYY = stValues.Equipment1ToYY /></cfif>
			<cfif StructKeyExists(stValues, "Equipment1SupplierNameTBox")><cfset variables.Equipment1SupplierNameTBox = stValues.Equipment1SupplierNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "Equipment1SupplierTelephoneTBox")><cfset variables.Equipment1SupplierTelephoneTBox = stValues.Equipment1SupplierTelephoneTBox /></cfif>
			<cfif StructKeyExists(stValues, "Equipment2TypeTBox")><cfset variables.Equipment2TypeTBox = stValues.Equipment2TypeTBox /></cfif>
			<cfif StructKeyExists(stValues, "Equipment2RentPurchasedSelect")><cfset variables.Equipment2RentPurchasedSelect = stValues.Equipment2RentPurchasedSelect /></cfif>
			<cfif StructKeyExists(stValues, "Equipment2FromMM")><cfset variables.Equipment2FromMM = stValues.Equipment2FromMM /></cfif>
			<cfif StructKeyExists(stValues, "Equipment2FromDD")><cfset variables.Equipment2FromDD = stValues.Equipment2FromDD /></cfif>
			<cfif StructKeyExists(stValues, "Equipment2FromYY")><cfset variables.Equipment2FromYY = stValues.Equipment2FromYY /></cfif>
			<cfif StructKeyExists(stValues, "Equipment2ToMM")><cfset variables.Equipment2ToMM = stValues.Equipment2ToMM /></cfif>
			<cfif StructKeyExists(stValues, "Equipment2ToDD")><cfset variables.Equipment2ToDD = stValues.Equipment2ToDD /></cfif>
			<cfif StructKeyExists(stValues, "Equipment2ToYY")><cfset variables.Equipment2ToYY = stValues.Equipment2ToYY /></cfif>
			<cfif StructKeyExists(stValues, "Equipment2SupplierNameTBox")><cfset variables.Equipment2SupplierNameTBox = stValues.Equipment2SupplierNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "Equipment2SupplierTelephoneTBox")><cfset variables.Equipment2SupplierTelephoneTBox = stValues.Equipment2SupplierTelephoneTBox /></cfif>
			<cfif StructKeyExists(stValues, "Equipment3TypeTBox")><cfset variables.Equipment3TypeTBox = stValues.Equipment3TypeTBox /></cfif>
			<cfif StructKeyExists(stValues, "Equipment3RentPurchasedSelect")><cfset variables.Equipment3RentPurchasedSelect = stValues.Equipment3RentPurchasedSelect /></cfif>
			<cfif StructKeyExists(stValues, "Equipment3FromMM")><cfset variables.Equipment3FromMM = stValues.Equipment3FromMM /></cfif>
			<cfif StructKeyExists(stValues, "Equipment3FromDD")><cfset variables.Equipment3FromDD = stValues.Equipment3FromDD /></cfif>
			<cfif StructKeyExists(stValues, "Equipment3FromYY")><cfset variables.Equipment3FromYY = stValues.Equipment3FromYY /></cfif>
			<cfif StructKeyExists(stValues, "Equipment3ToMM")><cfset variables.Equipment3ToMM = stValues.Equipment3ToMM /></cfif>
			<cfif StructKeyExists(stValues, "Equipment3ToDD")><cfset variables.Equipment3ToDD = stValues.Equipment3ToDD /></cfif>
			<cfif StructKeyExists(stValues, "Equipment3ToYY")><cfset variables.Equipment3ToYY = stValues.Equipment3ToYY /></cfif>
			<cfif StructKeyExists(stValues, "Equipment3SupplierNameTBox")><cfset variables.Equipment3SupplierNameTBox = stValues.Equipment3SupplierNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "Equipment3SupplierTelephoneTBox")><cfset variables.Equipment3SupplierTelephoneTBox = stValues.Equipment3SupplierTelephoneTBox /></cfif>
			<cfif StructKeyExists(stValues, "Equipment4TypeTBox")><cfset variables.Equipment4TypeTBox = stValues.Equipment4TypeTBox /></cfif>
			<cfif StructKeyExists(stValues, "Equipment4RentPurchasedSelect")><cfset variables.Equipment4RentPurchasedSelect = stValues.Equipment4RentPurchasedSelect /></cfif>
			<cfif StructKeyExists(stValues, "Equipment4FromMM")><cfset variables.Equipment4FromMM = stValues.Equipment4FromMM /></cfif>
			<cfif StructKeyExists(stValues, "Equipment4FromDD")><cfset variables.Equipment4FromDD = stValues.Equipment4FromDD /></cfif>
			<cfif StructKeyExists(stValues, "Equipment4FromYY")><cfset variables.Equipment4FromYY = stValues.Equipment4FromYY /></cfif>
			<cfif StructKeyExists(stValues, "Equipment4ToMM")><cfset variables.Equipment4ToMM = stValues.Equipment4ToMM /></cfif>
			<cfif StructKeyExists(stValues, "Equipment4ToDD")><cfset variables.Equipment4ToDD = stValues.Equipment4ToDD /></cfif>
			<cfif StructKeyExists(stValues, "Equipment4ToYY")><cfset variables.Equipment4ToYY = stValues.Equipment4ToYY /></cfif>
			<cfif StructKeyExists(stValues, "Equipment4SupplierNameTBox")><cfset variables.Equipment4SupplierNameTBox = stValues.Equipment4SupplierNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "Equipment4SupplierTelephoneTBox")><cfset variables.Equipment4SupplierTelephoneTBox = stValues.Equipment4SupplierTelephoneTBox /></cfif>
			<cfif StructKeyExists(stValues, "Equipment5TypeTBox")><cfset variables.Equipment5TypeTBox = stValues.Equipment5TypeTBox /></cfif>
			<cfif StructKeyExists(stValues, "Equipment5RentPurchasedSelect")><cfset variables.Equipment5RentPurchasedSelect = stValues.Equipment5RentPurchasedSelect /></cfif>
			<cfif StructKeyExists(stValues, "Equipment5FromMM")><cfset variables.Equipment5FromMM = stValues.Equipment5FromMM /></cfif>
			<cfif StructKeyExists(stValues, "Equipment5FromDD")><cfset variables.Equipment5FromDD = stValues.Equipment5FromDD /></cfif>
			<cfif StructKeyExists(stValues, "Equipment5FromYY")><cfset variables.Equipment5FromYY = stValues.Equipment5FromYY /></cfif>
			<cfif StructKeyExists(stValues, "Equipment5ToMM")><cfset variables.Equipment5ToMM = stValues.Equipment5ToMM /></cfif>
			<cfif StructKeyExists(stValues, "Equipment5ToDD")><cfset variables.Equipment5ToDD = stValues.Equipment5ToDD /></cfif>
			<cfif StructKeyExists(stValues, "Equipment5ToYY")><cfset variables.Equipment5ToYY = stValues.Equipment5ToYY /></cfif>
			<cfif StructKeyExists(stValues, "Equipment5SupplierNameTBox")><cfset variables.Equipment5SupplierNameTBox = stValues.Equipment5SupplierNameTBox /></cfif>
			<cfif StructKeyExists(stValues, "Equipment5SupplierTelephoneTBox")><cfset variables.Equipment5SupplierTelephoneTBox = stValues.Equipment5SupplierTelephoneTBox /></cfif>
			<cfif StructKeyExists(stValues, "Equipment1NoteTBox")><cfset variables.Equipment1NoteTBox = stValues.Equipment1NoteTBox /></cfif>
			<cfif StructKeyExists(stValues, "Equipment2NoteTBox")><cfset variables.Equipment2NoteTBox = stValues.Equipment2NoteTBox /></cfif>
			<cfif StructKeyExists(stValues, "Equipment3NoteTBox")><cfset variables.Equipment3NoteTBox = stValues.Equipment3NoteTBox /></cfif>
			<cfif StructKeyExists(stValues, "Equipment4NoteTBox")><cfset variables.Equipment4NoteTBox = stValues.Equipment4NoteTBox /></cfif>
			<cfif StructKeyExists(stValues, "Equipment5NoteTBox")><cfset variables.Equipment5NoteTBox = stValues.Equipment5NoteTBox /></cfif>
			<cfif StructKeyExists(stValues, "OPTION_14_CBox_OxygenPAo2")><cfset variables.OPTION_14_CBox_OxygenPAo2 = stValues.OPTION_14_CBox_OxygenPAo2 /></cfif>
			<cfif StructKeyExists(stValues, "OPTION_14_CBox_OxygenSAo2")><cfset variables.OPTION_14_CBox_OxygenSAo2 = stValues.OPTION_14_CBox_OxygenSAo2 /></cfif>
			<cfif StructKeyExists(stValues, "OPTION_14_CBox_OxygenSPo2")><cfset variables.OPTION_14_CBox_OxygenSPo2 = stValues.OPTION_14_CBox_OxygenSPo2 /></cfif>
			<cfif StructKeyExists(stValues, "OxygenPAO2TBox")><cfset variables.OxygenPAO2TBox = stValues.OxygenPAO2TBox /></cfif>
			<cfif StructKeyExists(stValues, "OxygenSAO2TBox")><cfset variables.OxygenSAO2TBox = stValues.OxygenSAO2TBox /></cfif>
			<cfif StructKeyExists(stValues, "CPAPStudy_CBox")><cfset variables.CPAPStudy_CBox = stValues.CPAPStudy_CBox /></cfif>
			<cfif StructKeyExists(stValues, "CPAPStudyNote")><cfset variables.CPAPStudyNote = stValues.CPAPStudyNote /></cfif>
			<cfif StructKeyExists(stValues, "OxygenSPO2TBox")><cfset variables.OxygenSPO2TBox = stValues.OxygenSPO2TBox /></cfif>
			<cfif StructKeyExists(stValues, "CPAPStudyOnFile_CBox")><cfset variables.CPAPStudyOnFile_CBox = stValues.CPAPStudyOnFile_CBox /></cfif>
			<cfif StructKeyExists(stValues, "CPAPStudyOnFileNote")><cfset variables.CPAPStudyOnFileNote = stValues.CPAPStudyOnFileNote /></cfif>
			<cfif StructKeyExists(stValues, "LabTestDateMM")><cfset variables.LabTestDateMM = stValues.LabTestDateMM /></cfif>
			<cfif StructKeyExists(stValues, "LabTestDateDD")><cfset variables.LabTestDateDD = stValues.LabTestDateDD /></cfif>
			<cfif StructKeyExists(stValues, "LabTestDateYY")><cfset variables.LabTestDateYY = stValues.LabTestDateYY /></cfif>
			<cfif StructKeyExists(stValues, "CPAPStudyPerformedAt")><cfset variables.CPAPStudyPerformedAt = stValues.CPAPStudyPerformedAt /></cfif>
			<cfif StructKeyExists(stValues, "LabTestFacilityTBox")><cfset variables.LabTestFacilityTBox = stValues.LabTestFacilityTBox /></cfif>
			<cfif StructKeyExists(stValues, "CPAPStudyPerformedAt2")><cfset variables.CPAPStudyPerformedAt2 = stValues.CPAPStudyPerformedAt2 /></cfif>
			<cfif StructKeyExists(stValues, "CPAPStudyPerformedAt3")><cfset variables.CPAPStudyPerformedAt3 = stValues.CPAPStudyPerformedAt3 /></cfif>
			<cfif StructKeyExists(stValues, "ClosingInvoiceNumber")><cfset variables.ClosingInvoiceNumber = stValues.ClosingInvoiceNumber /></cfif>
			<cfif StructKeyExists(stValues, "OPTION_SkilledNursing")><cfset variables.OPTION_SkilledNursing = stValues.OPTION_SkilledNursing /></cfif>
			<cfif StructKeyExists(stValues, "SkilledNursingName")><cfset variables.SkilledNursingName = stValues.SkilledNursingName /></cfif>
			<cfif StructKeyExists(stValues, "SkilledNursingTelephone")><cfset variables.SkilledNursingTelephone = stValues.SkilledNursingTelephone /></cfif>
			<cfif StructKeyExists(stValues, "Printed")><cfset variables.Printed = stValues.Printed /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for IntakeID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getIntakeID" acess="public" output="false" returntype="any">
		<cfreturn variables.IntakeID>
	</cffunction>
	
	<cffunction name="setIntakeID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="IntakeID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.IntakeID)) OR trim(arguments.IntakeID) EQ "">
			<cfset variables.IntakeID = arguments.IntakeID />
		<cfelse>
			<cfthrow message="IntakeID (#arguments.IntakeID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "IntakeID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClientID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClientID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClientID>
	</cffunction>
	
	<cffunction name="setClientID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClientID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClientID)) OR trim(arguments.ClientID) EQ "">
			<cfset variables.ClientID = arguments.ClientID />
		<cfelse>
			<cfthrow message="ClientID (#arguments.ClientID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClientID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for AssignedToUserID.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getAssignedToUserID" acess="public" output="false" returntype="any">
		<cfreturn variables.AssignedToUserID>
	</cffunction>
	
	<cffunction name="setAssignedToUserID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="AssignedToUserID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.AssignedToUserID)) OR trim(arguments.AssignedToUserID) EQ "">
			<cfset variables.AssignedToUserID = arguments.AssignedToUserID />
		<cfelse>
			<cfthrow message="AssignedToUserID (#arguments.AssignedToUserID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "AssignedToUserID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for hidden_Step.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="gethidden_Step" acess="public" output="false" returntype="any">
		<cfreturn variables.hidden_Step>
	</cffunction>
	
	<cffunction name="sethidden_Step" acess="public" output="false" returntype="boolean">
		
		<cfargument name="hidden_Step" required="true" type="any" />
			
		<cfset variables.hidden_Step = arguments.hidden_Step />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "hidden_Step") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for hidden_UsersID.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="gethidden_UsersID" acess="public" output="false" returntype="any">
		<cfreturn variables.hidden_UsersID>
	</cffunction>
	
	<cffunction name="sethidden_UsersID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="hidden_UsersID" required="true" type="any" />
			
		<cfset variables.hidden_UsersID = arguments.hidden_UsersID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "hidden_UsersID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for hidden_TimeStart.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="gethidden_TimeStart" acess="public" output="false" returntype="any">
		<cfreturn variables.hidden_TimeStart>
	</cffunction>
	
	<cffunction name="sethidden_TimeStart" acess="public" output="false" returntype="boolean">
		
		<cfargument name="hidden_TimeStart" required="true" type="any" />
			
		<cfset variables.hidden_TimeStart = arguments.hidden_TimeStart />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "hidden_TimeStart") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OPTION_1_CBox_Delivery.                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOPTION_1_CBox_Delivery" acess="public" output="false" returntype="any">
		<cfreturn variables.OPTION_1_CBox_Delivery>
	</cffunction>
	
	<cffunction name="setOPTION_1_CBox_Delivery" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OPTION_1_CBox_Delivery" required="true" type="any" />
			
		<cfset variables.OPTION_1_CBox_Delivery = arguments.OPTION_1_CBox_Delivery />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OPTION_1_CBox_Delivery") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OPTION_1_CBox_Pickup.                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOPTION_1_CBox_Pickup" acess="public" output="false" returntype="any">
		<cfreturn variables.OPTION_1_CBox_Pickup>
	</cffunction>
	
	<cffunction name="setOPTION_1_CBox_Pickup" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OPTION_1_CBox_Pickup" required="true" type="any" />
			
		<cfset variables.OPTION_1_CBox_Pickup = arguments.OPTION_1_CBox_Pickup />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OPTION_1_CBox_Pickup") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OPTION_1_CBox_Repair.                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOPTION_1_CBox_Repair" acess="public" output="false" returntype="any">
		<cfreturn variables.OPTION_1_CBox_Repair>
	</cffunction>
	
	<cffunction name="setOPTION_1_CBox_Repair" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OPTION_1_CBox_Repair" required="true" type="any" />
			
		<cfset variables.OPTION_1_CBox_Repair = arguments.OPTION_1_CBox_Repair />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OPTION_1_CBox_Repair") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OPTION_1_CBox_Switch.                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOPTION_1_CBox_Switch" acess="public" output="false" returntype="any">
		<cfreturn variables.OPTION_1_CBox_Switch>
	</cffunction>
	
	<cffunction name="setOPTION_1_CBox_Switch" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OPTION_1_CBox_Switch" required="true" type="any" />
			
		<cfset variables.OPTION_1_CBox_Switch = arguments.OPTION_1_CBox_Switch />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OPTION_1_CBox_Switch") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OPTION_1_CBox_Existing.                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOPTION_1_CBox_Existing" acess="public" output="false" returntype="any">
		<cfreturn variables.OPTION_1_CBox_Existing>
	</cffunction>
	
	<cffunction name="setOPTION_1_CBox_Existing" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OPTION_1_CBox_Existing" required="true" type="any" />
			
		<cfset variables.OPTION_1_CBox_Existing = arguments.OPTION_1_CBox_Existing />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OPTION_1_CBox_Existing") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OPTION_2_CBox_Other.                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOPTION_2_CBox_Other" acess="public" output="false" returntype="any">
		<cfreturn variables.OPTION_2_CBox_Other>
	</cffunction>
	
	<cffunction name="setOPTION_2_CBox_Other" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OPTION_2_CBox_Other" required="true" type="any" />
			
		<cfset variables.OPTION_2_CBox_Other = arguments.OPTION_2_CBox_Other />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OPTION_2_CBox_Other") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OPTION_2_CBox_Hospice.                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOPTION_2_CBox_Hospice" acess="public" output="false" returntype="any">
		<cfreturn variables.OPTION_2_CBox_Hospice>
	</cffunction>
	
	<cffunction name="setOPTION_2_CBox_Hospice" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OPTION_2_CBox_Hospice" required="true" type="any" />
			
		<cfset variables.OPTION_2_CBox_Hospice = arguments.OPTION_2_CBox_Hospice />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OPTION_2_CBox_Hospice") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OPTION_2_CBox_Hospital.                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOPTION_2_CBox_Hospital" acess="public" output="false" returntype="any">
		<cfreturn variables.OPTION_2_CBox_Hospital>
	</cffunction>
	
	<cffunction name="setOPTION_2_CBox_Hospital" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OPTION_2_CBox_Hospital" required="true" type="any" />
			
		<cfset variables.OPTION_2_CBox_Hospital = arguments.OPTION_2_CBox_Hospital />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OPTION_2_CBox_Hospital") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for otherTBox.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getotherTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.otherTBox>
	</cffunction>
	
	<cffunction name="setotherTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="otherTBox" required="true" type="any" />
			
		<cfset variables.otherTBox = arguments.otherTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "otherTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for hospiceTBox.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="gethospiceTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.hospiceTBox>
	</cffunction>
	
	<cffunction name="sethospiceTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="hospiceTBox" required="true" type="any" />
			
		<cfset variables.hospiceTBox = arguments.hospiceTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "hospiceTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OPTION_3_CBox_Medicare.                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOPTION_3_CBox_Medicare" acess="public" output="false" returntype="any">
		<cfreturn variables.OPTION_3_CBox_Medicare>
	</cffunction>
	
	<cffunction name="setOPTION_3_CBox_Medicare" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OPTION_3_CBox_Medicare" required="true" type="any" />
			
		<cfset variables.OPTION_3_CBox_Medicare = arguments.OPTION_3_CBox_Medicare />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OPTION_3_CBox_Medicare") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OPTION_3_CBox_PrivateInsurance.                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOPTION_3_CBox_PrivateInsurance" acess="public" output="false" returntype="any">
		<cfreturn variables.OPTION_3_CBox_PrivateInsurance>
	</cffunction>
	
	<cffunction name="setOPTION_3_CBox_PrivateInsurance" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OPTION_3_CBox_PrivateInsurance" required="true" type="any" />
			
		<cfset variables.OPTION_3_CBox_PrivateInsurance = arguments.OPTION_3_CBox_PrivateInsurance />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OPTION_3_CBox_PrivateInsurance") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OPTION_3_CBox_Medicaid.                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOPTION_3_CBox_Medicaid" acess="public" output="false" returntype="any">
		<cfreturn variables.OPTION_3_CBox_Medicaid>
	</cffunction>
	
	<cffunction name="setOPTION_3_CBox_Medicaid" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OPTION_3_CBox_Medicaid" required="true" type="any" />
			
		<cfset variables.OPTION_3_CBox_Medicaid = arguments.OPTION_3_CBox_Medicaid />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OPTION_3_CBox_Medicaid") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OPTION_3_CBox_PrivatePay.                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOPTION_3_CBox_PrivatePay" acess="public" output="false" returntype="any">
		<cfreturn variables.OPTION_3_CBox_PrivatePay>
	</cffunction>
	
	<cffunction name="setOPTION_3_CBox_PrivatePay" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OPTION_3_CBox_PrivatePay" required="true" type="any" />
			
		<cfset variables.OPTION_3_CBox_PrivatePay = arguments.OPTION_3_CBox_PrivatePay />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OPTION_3_CBox_PrivatePay") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for hospitalTBox.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="gethospitalTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.hospitalTBox>
	</cffunction>
	
	<cffunction name="sethospitalTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="hospitalTBox" required="true" type="any" />
			
		<cfset variables.hospitalTBox = arguments.hospitalTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "hospitalTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DischargeDateMM.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDischargeDateMM" acess="public" output="false" returntype="any">
		<cfreturn variables.DischargeDateMM>
	</cffunction>
	
	<cffunction name="setDischargeDateMM" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DischargeDateMM" required="true" type="any" />
			
		<cfset variables.DischargeDateMM = arguments.DischargeDateMM />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DischargeDateMM") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DischargeDateDD.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDischargeDateDD" acess="public" output="false" returntype="any">
		<cfreturn variables.DischargeDateDD>
	</cffunction>
	
	<cffunction name="setDischargeDateDD" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DischargeDateDD" required="true" type="any" />
			
		<cfset variables.DischargeDateDD = arguments.DischargeDateDD />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DischargeDateDD") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DischargeDateYY.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDischargeDateYY" acess="public" output="false" returntype="any">
		<cfreturn variables.DischargeDateYY>
	</cffunction>
	
	<cffunction name="setDischargeDateYY" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DischargeDateYY" required="true" type="any" />
			
		<cfset variables.DischargeDateYY = arguments.DischargeDateYY />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DischargeDateYY") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for typeOfPay_Radio.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="gettypeOfPay_Radio" acess="public" output="false" returntype="any">
		<cfreturn variables.typeOfPay_Radio>
	</cffunction>
	
	<cffunction name="settypeOfPay_Radio" acess="public" output="false" returntype="boolean">
		
		<cfargument name="typeOfPay_Radio" required="true" type="any" />
			
		<cfset variables.typeOfPay_Radio = arguments.typeOfPay_Radio />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "typeOfPay_Radio") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for callerFNameTBox.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getcallerFNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.callerFNameTBox>
	</cffunction>
	
	<cffunction name="setcallerFNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="callerFNameTBox" required="true" type="any" />
			
		<cfset variables.callerFNameTBox = arguments.callerFNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "callerFNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for callerMInitialTBox.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getcallerMInitialTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.callerMInitialTBox>
	</cffunction>
	
	<cffunction name="setcallerMInitialTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="callerMInitialTBox" required="true" type="any" />
			
		<cfset variables.callerMInitialTBox = arguments.callerMInitialTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "callerMInitialTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for callerLNameTBox.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getcallerLNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.callerLNameTBox>
	</cffunction>
	
	<cffunction name="setcallerLNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="callerLNameTBox" required="true" type="any" />
			
		<cfset variables.callerLNameTBox = arguments.callerLNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "callerLNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for callerPhoneTBox.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getcallerPhoneTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.callerPhoneTBox>
	</cffunction>
	
	<cffunction name="setcallerPhoneTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="callerPhoneTBox" required="true" type="any" />
			
		<cfset variables.callerPhoneTBox = arguments.callerPhoneTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "callerPhoneTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for patientXML.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpatientXML" acess="public" output="false" returntype="any">
		<cfreturn variables.patientXML>
	</cffunction>
	
	<cffunction name="setpatientXML" acess="public" output="false" returntype="boolean">
		
		<cfargument name="patientXML" required="true" type="any" />
			
		<cfset variables.patientXML = arguments.patientXML />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "patientXML") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for patientID.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpatientID" acess="public" output="false" returntype="any">
		<cfreturn variables.patientID>
	</cffunction>
	
	<cffunction name="setpatientID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="patientID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.patientID)) OR trim(arguments.patientID) EQ "">
			<cfset variables.patientID = arguments.patientID />
		<cfelse>
			<cfthrow message="patientID (#arguments.patientID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "patientID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for patientAddressID.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpatientAddressID" acess="public" output="false" returntype="any">
		<cfreturn variables.patientAddressID>
	</cffunction>
	
	<cffunction name="setpatientAddressID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="patientAddressID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.patientAddressID)) OR trim(arguments.patientAddressID) EQ "">
			<cfset variables.patientAddressID = arguments.patientAddressID />
		<cfelse>
			<cfthrow message="patientAddressID (#arguments.patientAddressID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "patientAddressID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for patientPhoneID.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpatientPhoneID" acess="public" output="false" returntype="any">
		<cfreturn variables.patientPhoneID>
	</cffunction>
	
	<cffunction name="setpatientPhoneID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="patientPhoneID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.patientPhoneID)) OR trim(arguments.patientPhoneID) EQ "">
			<cfset variables.patientPhoneID = arguments.patientPhoneID />
		<cfelse>
			<cfthrow message="patientPhoneID (#arguments.patientPhoneID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "patientPhoneID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for roomNumberTBox.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getroomNumberTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.roomNumberTBox>
	</cffunction>
	
	<cffunction name="setroomNumberTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="roomNumberTBox" required="true" type="any" />
			
		<cfset variables.roomNumberTBox = arguments.roomNumberTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "roomNumberTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for bedNumberTBox.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getbedNumberTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.bedNumberTBox>
	</cffunction>
	
	<cffunction name="setbedNumberTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="bedNumberTBox" required="true" type="any" />
			
		<cfset variables.bedNumberTBox = arguments.bedNumberTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "bedNumberTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for alternateContactFNameTBox.                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getalternateContactFNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.alternateContactFNameTBox>
	</cffunction>
	
	<cffunction name="setalternateContactFNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="alternateContactFNameTBox" required="true" type="any" />
			
		<cfset variables.alternateContactFNameTBox = arguments.alternateContactFNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "alternateContactFNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for alternateContactMInitialTBox.                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getalternateContactMInitialTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.alternateContactMInitialTBox>
	</cffunction>
	
	<cffunction name="setalternateContactMInitialTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="alternateContactMInitialTBox" required="true" type="any" />
			
		<cfset variables.alternateContactMInitialTBox = arguments.alternateContactMInitialTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "alternateContactMInitialTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for alternateContactLNameTBox.                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getalternateContactLNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.alternateContactLNameTBox>
	</cffunction>
	
	<cffunction name="setalternateContactLNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="alternateContactLNameTBox" required="true" type="any" />
			
		<cfset variables.alternateContactLNameTBox = arguments.alternateContactLNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "alternateContactLNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for alternateContactRelationshipTBox.                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getalternateContactRelationshipTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.alternateContactRelationshipTBox>
	</cffunction>
	
	<cffunction name="setalternateContactRelationshipTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="alternateContactRelationshipTBox" required="true" type="any" />
			
		<cfset variables.alternateContactRelationshipTBox = arguments.alternateContactRelationshipTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "alternateContactRelationshipTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for alternateContactPhoneTBox.                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getalternateContactPhoneTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.alternateContactPhoneTBox>
	</cffunction>
	
	<cffunction name="setalternateContactPhoneTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="alternateContactPhoneTBox" required="true" type="any" />
			
		<cfset variables.alternateContactPhoneTBox = arguments.alternateContactPhoneTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "alternateContactPhoneTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for alternateContactWorkPhoneTBox.                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getalternateContactWorkPhoneTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.alternateContactWorkPhoneTBox>
	</cffunction>
	
	<cffunction name="setalternateContactWorkPhoneTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="alternateContactWorkPhoneTBox" required="true" type="any" />
			
		<cfset variables.alternateContactWorkPhoneTBox = arguments.alternateContactWorkPhoneTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "alternateContactWorkPhoneTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for poNumberTBox.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getpoNumberTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.poNumberTBox>
	</cffunction>
	
	<cffunction name="setpoNumberTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="poNumberTBox" required="true" type="any" />
			
		<cfset variables.poNumberTBox = arguments.poNumberTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "poNumberTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for creditCardTypeTBox.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getcreditCardTypeTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.creditCardTypeTBox>
	</cffunction>
	
	<cffunction name="setcreditCardTypeTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="creditCardTypeTBox" required="true" type="any" />
			
		<cfset variables.creditCardTypeTBox = arguments.creditCardTypeTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "creditCardTypeTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for creditCardNumberTBox.                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getcreditCardNumberTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.creditCardNumberTBox>
	</cffunction>
	
	<cffunction name="setcreditCardNumberTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="creditCardNumberTBox" required="true" type="any" />
			
		<cfset variables.creditCardNumberTBox = arguments.creditCardNumberTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "creditCardNumberTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ccDateMM.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getccDateMM" acess="public" output="false" returntype="any">
		<cfreturn variables.ccDateMM>
	</cffunction>
	
	<cffunction name="setccDateMM" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ccDateMM" required="true" type="any" />
			
		<cfset variables.ccDateMM = arguments.ccDateMM />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ccDateMM") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ccDateDD.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getccDateDD" acess="public" output="false" returntype="any">
		<cfreturn variables.ccDateDD>
	</cffunction>
	
	<cffunction name="setccDateDD" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ccDateDD" required="true" type="any" />
			
		<cfset variables.ccDateDD = arguments.ccDateDD />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ccDateDD") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ccDateYY.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getccDateYY" acess="public" output="false" returntype="any">
		<cfreturn variables.ccDateYY>
	</cffunction>
	
	<cffunction name="setccDateYY" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ccDateYY" required="true" type="any" />
			
		<cfset variables.ccDateYY = arguments.ccDateYY />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ccDateYY") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for orderingPhysicianFNameTBox.                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getorderingPhysicianFNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.orderingPhysicianFNameTBox>
	</cffunction>
	
	<cffunction name="setorderingPhysicianFNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="orderingPhysicianFNameTBox" required="true" type="any" />
			
		<cfset variables.orderingPhysicianFNameTBox = arguments.orderingPhysicianFNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "orderingPhysicianFNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for orderingPhysicianMInitialTBox.                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getorderingPhysicianMInitialTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.orderingPhysicianMInitialTBox>
	</cffunction>
	
	<cffunction name="setorderingPhysicianMInitialTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="orderingPhysicianMInitialTBox" required="true" type="any" />
			
		<cfset variables.orderingPhysicianMInitialTBox = arguments.orderingPhysicianMInitialTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "orderingPhysicianMInitialTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for orderingPhysicianLNameTBox.                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getorderingPhysicianLNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.orderingPhysicianLNameTBox>
	</cffunction>
	
	<cffunction name="setorderingPhysicianLNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="orderingPhysicianLNameTBox" required="true" type="any" />
			
		<cfset variables.orderingPhysicianLNameTBox = arguments.orderingPhysicianLNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "orderingPhysicianLNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for orderingPhysicianPhoneTBox.                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getorderingPhysicianPhoneTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.orderingPhysicianPhoneTBox>
	</cffunction>
	
	<cffunction name="setorderingPhysicianPhoneTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="orderingPhysicianPhoneTBox" required="true" type="any" />
			
		<cfset variables.orderingPhysicianPhoneTBox = arguments.orderingPhysicianPhoneTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "orderingPhysicianPhoneTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for orderingPhysicianUPINTBox.                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getorderingPhysicianUPINTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.orderingPhysicianUPINTBox>
	</cffunction>
	
	<cffunction name="setorderingPhysicianUPINTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="orderingPhysicianUPINTBox" required="true" type="any" />
			
		<cfset variables.orderingPhysicianUPINTBox = arguments.orderingPhysicianUPINTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "orderingPhysicianUPINTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for orderingPhysicianFaxTBox.                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getorderingPhysicianFaxTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.orderingPhysicianFaxTBox>
	</cffunction>
	
	<cffunction name="setorderingPhysicianFaxTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="orderingPhysicianFaxTBox" required="true" type="any" />
			
		<cfset variables.orderingPhysicianFaxTBox = arguments.orderingPhysicianFaxTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "orderingPhysicianFaxTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for orderingPhysicianAddressTBox.                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getorderingPhysicianAddressTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.orderingPhysicianAddressTBox>
	</cffunction>
	
	<cffunction name="setorderingPhysicianAddressTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="orderingPhysicianAddressTBox" required="true" type="any" />
			
		<cfset variables.orderingPhysicianAddressTBox = arguments.orderingPhysicianAddressTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "orderingPhysicianAddressTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for orderingPhysicianCityTBox.                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getorderingPhysicianCityTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.orderingPhysicianCityTBox>
	</cffunction>
	
	<cffunction name="setorderingPhysicianCityTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="orderingPhysicianCityTBox" required="true" type="any" />
			
		<cfset variables.orderingPhysicianCityTBox = arguments.orderingPhysicianCityTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "orderingPhysicianCityTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for orderingPhysicianStateTBox.                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getorderingPhysicianStateTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.orderingPhysicianStateTBox>
	</cffunction>
	
	<cffunction name="setorderingPhysicianStateTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="orderingPhysicianStateTBox" required="true" type="any" />
			
		<cfset variables.orderingPhysicianStateTBox = arguments.orderingPhysicianStateTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "orderingPhysicianStateTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for orderingPhysicianZipTBox.                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getorderingPhysicianZipTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.orderingPhysicianZipTBox>
	</cffunction>
	
	<cffunction name="setorderingPhysicianZipTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="orderingPhysicianZipTBox" required="true" type="any" />
			
		<cfset variables.orderingPhysicianZipTBox = arguments.orderingPhysicianZipTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "orderingPhysicianZipTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OPTION_13_CBox_PastEquipmentYes.                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOPTION_13_CBox_PastEquipmentYes" acess="public" output="false" returntype="any">
		<cfreturn variables.OPTION_13_CBox_PastEquipmentYes>
	</cffunction>
	
	<cffunction name="setOPTION_13_CBox_PastEquipmentYes" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OPTION_13_CBox_PastEquipmentYes" required="true" type="any" />
			
		<cfset variables.OPTION_13_CBox_PastEquipmentYes = arguments.OPTION_13_CBox_PastEquipmentYes />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OPTION_13_CBox_PastEquipmentYes") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OPTION_13_CBox_PastEquipmentNo.                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOPTION_13_CBox_PastEquipmentNo" acess="public" output="false" returntype="any">
		<cfreturn variables.OPTION_13_CBox_PastEquipmentNo>
	</cffunction>
	
	<cffunction name="setOPTION_13_CBox_PastEquipmentNo" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OPTION_13_CBox_PastEquipmentNo" required="true" type="any" />
			
		<cfset variables.OPTION_13_CBox_PastEquipmentNo = arguments.OPTION_13_CBox_PastEquipmentNo />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OPTION_13_CBox_PastEquipmentNo") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment1TypeTBox.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment1TypeTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment1TypeTBox>
	</cffunction>
	
	<cffunction name="setEquipment1TypeTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment1TypeTBox" required="true" type="any" />
			
		<cfset variables.Equipment1TypeTBox = arguments.Equipment1TypeTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment1TypeTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment1RentPurchasedSelect.                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment1RentPurchasedSelect" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment1RentPurchasedSelect>
	</cffunction>
	
	<cffunction name="setEquipment1RentPurchasedSelect" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment1RentPurchasedSelect" required="true" type="any" />
			
		<cfset variables.Equipment1RentPurchasedSelect = arguments.Equipment1RentPurchasedSelect />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment1RentPurchasedSelect") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment1FromMM.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment1FromMM" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment1FromMM>
	</cffunction>
	
	<cffunction name="setEquipment1FromMM" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment1FromMM" required="true" type="any" />
			
		<cfset variables.Equipment1FromMM = arguments.Equipment1FromMM />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment1FromMM") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment1FromDD.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment1FromDD" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment1FromDD>
	</cffunction>
	
	<cffunction name="setEquipment1FromDD" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment1FromDD" required="true" type="any" />
			
		<cfset variables.Equipment1FromDD = arguments.Equipment1FromDD />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment1FromDD") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment1FromYY.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment1FromYY" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment1FromYY>
	</cffunction>
	
	<cffunction name="setEquipment1FromYY" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment1FromYY" required="true" type="any" />
			
		<cfset variables.Equipment1FromYY = arguments.Equipment1FromYY />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment1FromYY") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment1ToMM.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment1ToMM" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment1ToMM>
	</cffunction>
	
	<cffunction name="setEquipment1ToMM" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment1ToMM" required="true" type="any" />
			
		<cfset variables.Equipment1ToMM = arguments.Equipment1ToMM />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment1ToMM") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment1ToDD.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment1ToDD" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment1ToDD>
	</cffunction>
	
	<cffunction name="setEquipment1ToDD" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment1ToDD" required="true" type="any" />
			
		<cfset variables.Equipment1ToDD = arguments.Equipment1ToDD />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment1ToDD") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment1ToYY.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment1ToYY" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment1ToYY>
	</cffunction>
	
	<cffunction name="setEquipment1ToYY" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment1ToYY" required="true" type="any" />
			
		<cfset variables.Equipment1ToYY = arguments.Equipment1ToYY />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment1ToYY") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment1SupplierNameTBox.                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment1SupplierNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment1SupplierNameTBox>
	</cffunction>
	
	<cffunction name="setEquipment1SupplierNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment1SupplierNameTBox" required="true" type="any" />
			
		<cfset variables.Equipment1SupplierNameTBox = arguments.Equipment1SupplierNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment1SupplierNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment1SupplierTelephoneTBox.                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment1SupplierTelephoneTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment1SupplierTelephoneTBox>
	</cffunction>
	
	<cffunction name="setEquipment1SupplierTelephoneTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment1SupplierTelephoneTBox" required="true" type="any" />
			
		<cfset variables.Equipment1SupplierTelephoneTBox = arguments.Equipment1SupplierTelephoneTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment1SupplierTelephoneTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment2TypeTBox.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment2TypeTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment2TypeTBox>
	</cffunction>
	
	<cffunction name="setEquipment2TypeTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment2TypeTBox" required="true" type="any" />
			
		<cfset variables.Equipment2TypeTBox = arguments.Equipment2TypeTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment2TypeTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment2RentPurchasedSelect.                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment2RentPurchasedSelect" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment2RentPurchasedSelect>
	</cffunction>
	
	<cffunction name="setEquipment2RentPurchasedSelect" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment2RentPurchasedSelect" required="true" type="any" />
			
		<cfset variables.Equipment2RentPurchasedSelect = arguments.Equipment2RentPurchasedSelect />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment2RentPurchasedSelect") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment2FromMM.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment2FromMM" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment2FromMM>
	</cffunction>
	
	<cffunction name="setEquipment2FromMM" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment2FromMM" required="true" type="any" />
			
		<cfset variables.Equipment2FromMM = arguments.Equipment2FromMM />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment2FromMM") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment2FromDD.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment2FromDD" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment2FromDD>
	</cffunction>
	
	<cffunction name="setEquipment2FromDD" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment2FromDD" required="true" type="any" />
			
		<cfset variables.Equipment2FromDD = arguments.Equipment2FromDD />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment2FromDD") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment2FromYY.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment2FromYY" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment2FromYY>
	</cffunction>
	
	<cffunction name="setEquipment2FromYY" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment2FromYY" required="true" type="any" />
			
		<cfset variables.Equipment2FromYY = arguments.Equipment2FromYY />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment2FromYY") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment2ToMM.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment2ToMM" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment2ToMM>
	</cffunction>
	
	<cffunction name="setEquipment2ToMM" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment2ToMM" required="true" type="any" />
			
		<cfset variables.Equipment2ToMM = arguments.Equipment2ToMM />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment2ToMM") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment2ToDD.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment2ToDD" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment2ToDD>
	</cffunction>
	
	<cffunction name="setEquipment2ToDD" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment2ToDD" required="true" type="any" />
			
		<cfset variables.Equipment2ToDD = arguments.Equipment2ToDD />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment2ToDD") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment2ToYY.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment2ToYY" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment2ToYY>
	</cffunction>
	
	<cffunction name="setEquipment2ToYY" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment2ToYY" required="true" type="any" />
			
		<cfset variables.Equipment2ToYY = arguments.Equipment2ToYY />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment2ToYY") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment2SupplierNameTBox.                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment2SupplierNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment2SupplierNameTBox>
	</cffunction>
	
	<cffunction name="setEquipment2SupplierNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment2SupplierNameTBox" required="true" type="any" />
			
		<cfset variables.Equipment2SupplierNameTBox = arguments.Equipment2SupplierNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment2SupplierNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment2SupplierTelephoneTBox.                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment2SupplierTelephoneTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment2SupplierTelephoneTBox>
	</cffunction>
	
	<cffunction name="setEquipment2SupplierTelephoneTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment2SupplierTelephoneTBox" required="true" type="any" />
			
		<cfset variables.Equipment2SupplierTelephoneTBox = arguments.Equipment2SupplierTelephoneTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment2SupplierTelephoneTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment3TypeTBox.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment3TypeTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment3TypeTBox>
	</cffunction>
	
	<cffunction name="setEquipment3TypeTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment3TypeTBox" required="true" type="any" />
			
		<cfset variables.Equipment3TypeTBox = arguments.Equipment3TypeTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment3TypeTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment3RentPurchasedSelect.                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment3RentPurchasedSelect" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment3RentPurchasedSelect>
	</cffunction>
	
	<cffunction name="setEquipment3RentPurchasedSelect" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment3RentPurchasedSelect" required="true" type="any" />
			
		<cfset variables.Equipment3RentPurchasedSelect = arguments.Equipment3RentPurchasedSelect />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment3RentPurchasedSelect") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment3FromMM.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment3FromMM" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment3FromMM>
	</cffunction>
	
	<cffunction name="setEquipment3FromMM" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment3FromMM" required="true" type="any" />
			
		<cfset variables.Equipment3FromMM = arguments.Equipment3FromMM />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment3FromMM") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment3FromDD.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment3FromDD" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment3FromDD>
	</cffunction>
	
	<cffunction name="setEquipment3FromDD" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment3FromDD" required="true" type="any" />
			
		<cfset variables.Equipment3FromDD = arguments.Equipment3FromDD />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment3FromDD") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment3FromYY.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment3FromYY" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment3FromYY>
	</cffunction>
	
	<cffunction name="setEquipment3FromYY" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment3FromYY" required="true" type="any" />
			
		<cfset variables.Equipment3FromYY = arguments.Equipment3FromYY />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment3FromYY") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment3ToMM.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment3ToMM" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment3ToMM>
	</cffunction>
	
	<cffunction name="setEquipment3ToMM" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment3ToMM" required="true" type="any" />
			
		<cfset variables.Equipment3ToMM = arguments.Equipment3ToMM />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment3ToMM") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment3ToDD.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment3ToDD" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment3ToDD>
	</cffunction>
	
	<cffunction name="setEquipment3ToDD" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment3ToDD" required="true" type="any" />
			
		<cfset variables.Equipment3ToDD = arguments.Equipment3ToDD />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment3ToDD") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment3ToYY.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment3ToYY" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment3ToYY>
	</cffunction>
	
	<cffunction name="setEquipment3ToYY" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment3ToYY" required="true" type="any" />
			
		<cfset variables.Equipment3ToYY = arguments.Equipment3ToYY />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment3ToYY") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment3SupplierNameTBox.                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment3SupplierNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment3SupplierNameTBox>
	</cffunction>
	
	<cffunction name="setEquipment3SupplierNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment3SupplierNameTBox" required="true" type="any" />
			
		<cfset variables.Equipment3SupplierNameTBox = arguments.Equipment3SupplierNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment3SupplierNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment3SupplierTelephoneTBox.                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment3SupplierTelephoneTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment3SupplierTelephoneTBox>
	</cffunction>
	
	<cffunction name="setEquipment3SupplierTelephoneTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment3SupplierTelephoneTBox" required="true" type="any" />
			
		<cfset variables.Equipment3SupplierTelephoneTBox = arguments.Equipment3SupplierTelephoneTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment3SupplierTelephoneTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment4TypeTBox.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment4TypeTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment4TypeTBox>
	</cffunction>
	
	<cffunction name="setEquipment4TypeTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment4TypeTBox" required="true" type="any" />
			
		<cfset variables.Equipment4TypeTBox = arguments.Equipment4TypeTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment4TypeTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment4RentPurchasedSelect.                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment4RentPurchasedSelect" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment4RentPurchasedSelect>
	</cffunction>
	
	<cffunction name="setEquipment4RentPurchasedSelect" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment4RentPurchasedSelect" required="true" type="any" />
			
		<cfset variables.Equipment4RentPurchasedSelect = arguments.Equipment4RentPurchasedSelect />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment4RentPurchasedSelect") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment4FromMM.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment4FromMM" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment4FromMM>
	</cffunction>
	
	<cffunction name="setEquipment4FromMM" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment4FromMM" required="true" type="any" />
			
		<cfset variables.Equipment4FromMM = arguments.Equipment4FromMM />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment4FromMM") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment4FromDD.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment4FromDD" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment4FromDD>
	</cffunction>
	
	<cffunction name="setEquipment4FromDD" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment4FromDD" required="true" type="any" />
			
		<cfset variables.Equipment4FromDD = arguments.Equipment4FromDD />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment4FromDD") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment4FromYY.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment4FromYY" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment4FromYY>
	</cffunction>
	
	<cffunction name="setEquipment4FromYY" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment4FromYY" required="true" type="any" />
			
		<cfset variables.Equipment4FromYY = arguments.Equipment4FromYY />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment4FromYY") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment4ToMM.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment4ToMM" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment4ToMM>
	</cffunction>
	
	<cffunction name="setEquipment4ToMM" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment4ToMM" required="true" type="any" />
			
		<cfset variables.Equipment4ToMM = arguments.Equipment4ToMM />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment4ToMM") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment4ToDD.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment4ToDD" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment4ToDD>
	</cffunction>
	
	<cffunction name="setEquipment4ToDD" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment4ToDD" required="true" type="any" />
			
		<cfset variables.Equipment4ToDD = arguments.Equipment4ToDD />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment4ToDD") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment4ToYY.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment4ToYY" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment4ToYY>
	</cffunction>
	
	<cffunction name="setEquipment4ToYY" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment4ToYY" required="true" type="any" />
			
		<cfset variables.Equipment4ToYY = arguments.Equipment4ToYY />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment4ToYY") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment4SupplierNameTBox.                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment4SupplierNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment4SupplierNameTBox>
	</cffunction>
	
	<cffunction name="setEquipment4SupplierNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment4SupplierNameTBox" required="true" type="any" />
			
		<cfset variables.Equipment4SupplierNameTBox = arguments.Equipment4SupplierNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment4SupplierNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment4SupplierTelephoneTBox.                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment4SupplierTelephoneTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment4SupplierTelephoneTBox>
	</cffunction>
	
	<cffunction name="setEquipment4SupplierTelephoneTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment4SupplierTelephoneTBox" required="true" type="any" />
			
		<cfset variables.Equipment4SupplierTelephoneTBox = arguments.Equipment4SupplierTelephoneTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment4SupplierTelephoneTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment5TypeTBox.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment5TypeTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment5TypeTBox>
	</cffunction>
	
	<cffunction name="setEquipment5TypeTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment5TypeTBox" required="true" type="any" />
			
		<cfset variables.Equipment5TypeTBox = arguments.Equipment5TypeTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment5TypeTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment5RentPurchasedSelect.                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment5RentPurchasedSelect" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment5RentPurchasedSelect>
	</cffunction>
	
	<cffunction name="setEquipment5RentPurchasedSelect" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment5RentPurchasedSelect" required="true" type="any" />
			
		<cfset variables.Equipment5RentPurchasedSelect = arguments.Equipment5RentPurchasedSelect />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment5RentPurchasedSelect") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment5FromMM.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment5FromMM" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment5FromMM>
	</cffunction>
	
	<cffunction name="setEquipment5FromMM" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment5FromMM" required="true" type="any" />
			
		<cfset variables.Equipment5FromMM = arguments.Equipment5FromMM />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment5FromMM") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment5FromDD.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment5FromDD" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment5FromDD>
	</cffunction>
	
	<cffunction name="setEquipment5FromDD" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment5FromDD" required="true" type="any" />
			
		<cfset variables.Equipment5FromDD = arguments.Equipment5FromDD />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment5FromDD") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment5FromYY.                                      --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment5FromYY" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment5FromYY>
	</cffunction>
	
	<cffunction name="setEquipment5FromYY" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment5FromYY" required="true" type="any" />
			
		<cfset variables.Equipment5FromYY = arguments.Equipment5FromYY />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment5FromYY") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment5ToMM.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment5ToMM" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment5ToMM>
	</cffunction>
	
	<cffunction name="setEquipment5ToMM" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment5ToMM" required="true" type="any" />
			
		<cfset variables.Equipment5ToMM = arguments.Equipment5ToMM />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment5ToMM") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment5ToDD.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment5ToDD" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment5ToDD>
	</cffunction>
	
	<cffunction name="setEquipment5ToDD" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment5ToDD" required="true" type="any" />
			
		<cfset variables.Equipment5ToDD = arguments.Equipment5ToDD />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment5ToDD") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment5ToYY.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment5ToYY" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment5ToYY>
	</cffunction>
	
	<cffunction name="setEquipment5ToYY" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment5ToYY" required="true" type="any" />
			
		<cfset variables.Equipment5ToYY = arguments.Equipment5ToYY />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment5ToYY") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment5SupplierNameTBox.                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment5SupplierNameTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment5SupplierNameTBox>
	</cffunction>
	
	<cffunction name="setEquipment5SupplierNameTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment5SupplierNameTBox" required="true" type="any" />
			
		<cfset variables.Equipment5SupplierNameTBox = arguments.Equipment5SupplierNameTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment5SupplierNameTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment5SupplierTelephoneTBox.                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment5SupplierTelephoneTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment5SupplierTelephoneTBox>
	</cffunction>
	
	<cffunction name="setEquipment5SupplierTelephoneTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment5SupplierTelephoneTBox" required="true" type="any" />
			
		<cfset variables.Equipment5SupplierTelephoneTBox = arguments.Equipment5SupplierTelephoneTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment5SupplierTelephoneTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment1NoteTBox.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment1NoteTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment1NoteTBox>
	</cffunction>
	
	<cffunction name="setEquipment1NoteTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment1NoteTBox" required="true" type="any" />
			
		<cfset variables.Equipment1NoteTBox = arguments.Equipment1NoteTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment1NoteTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment2NoteTBox.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment2NoteTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment2NoteTBox>
	</cffunction>
	
	<cffunction name="setEquipment2NoteTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment2NoteTBox" required="true" type="any" />
			
		<cfset variables.Equipment2NoteTBox = arguments.Equipment2NoteTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment2NoteTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment3NoteTBox.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment3NoteTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment3NoteTBox>
	</cffunction>
	
	<cffunction name="setEquipment3NoteTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment3NoteTBox" required="true" type="any" />
			
		<cfset variables.Equipment3NoteTBox = arguments.Equipment3NoteTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment3NoteTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment4NoteTBox.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment4NoteTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment4NoteTBox>
	</cffunction>
	
	<cffunction name="setEquipment4NoteTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment4NoteTBox" required="true" type="any" />
			
		<cfset variables.Equipment4NoteTBox = arguments.Equipment4NoteTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment4NoteTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Equipment5NoteTBox.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEquipment5NoteTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.Equipment5NoteTBox>
	</cffunction>
	
	<cffunction name="setEquipment5NoteTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Equipment5NoteTBox" required="true" type="any" />
			
		<cfset variables.Equipment5NoteTBox = arguments.Equipment5NoteTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Equipment5NoteTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OPTION_14_CBox_OxygenPAo2.                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOPTION_14_CBox_OxygenPAo2" acess="public" output="false" returntype="any">
		<cfreturn variables.OPTION_14_CBox_OxygenPAo2>
	</cffunction>
	
	<cffunction name="setOPTION_14_CBox_OxygenPAo2" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OPTION_14_CBox_OxygenPAo2" required="true" type="any" />
			
		<cfset variables.OPTION_14_CBox_OxygenPAo2 = arguments.OPTION_14_CBox_OxygenPAo2 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OPTION_14_CBox_OxygenPAo2") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OPTION_14_CBox_OxygenSAo2.                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOPTION_14_CBox_OxygenSAo2" acess="public" output="false" returntype="any">
		<cfreturn variables.OPTION_14_CBox_OxygenSAo2>
	</cffunction>
	
	<cffunction name="setOPTION_14_CBox_OxygenSAo2" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OPTION_14_CBox_OxygenSAo2" required="true" type="any" />
			
		<cfset variables.OPTION_14_CBox_OxygenSAo2 = arguments.OPTION_14_CBox_OxygenSAo2 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OPTION_14_CBox_OxygenSAo2") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OPTION_14_CBox_OxygenSPo2.                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOPTION_14_CBox_OxygenSPo2" acess="public" output="false" returntype="any">
		<cfreturn variables.OPTION_14_CBox_OxygenSPo2>
	</cffunction>
	
	<cffunction name="setOPTION_14_CBox_OxygenSPo2" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OPTION_14_CBox_OxygenSPo2" required="true" type="any" />
			
		<cfset variables.OPTION_14_CBox_OxygenSPo2 = arguments.OPTION_14_CBox_OxygenSPo2 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OPTION_14_CBox_OxygenSPo2") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OxygenPAO2TBox.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOxygenPAO2TBox" acess="public" output="false" returntype="any">
		<cfreturn variables.OxygenPAO2TBox>
	</cffunction>
	
	<cffunction name="setOxygenPAO2TBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OxygenPAO2TBox" required="true" type="any" />
			
		<cfset variables.OxygenPAO2TBox = arguments.OxygenPAO2TBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OxygenPAO2TBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OxygenSAO2TBox.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOxygenSAO2TBox" acess="public" output="false" returntype="any">
		<cfreturn variables.OxygenSAO2TBox>
	</cffunction>
	
	<cffunction name="setOxygenSAO2TBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OxygenSAO2TBox" required="true" type="any" />
			
		<cfset variables.OxygenSAO2TBox = arguments.OxygenSAO2TBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OxygenSAO2TBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CPAPStudy_CBox.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCPAPStudy_CBox" acess="public" output="false" returntype="any">
		<cfreturn variables.CPAPStudy_CBox>
	</cffunction>
	
	<cffunction name="setCPAPStudy_CBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CPAPStudy_CBox" required="true" type="any" />
			
		<cfset variables.CPAPStudy_CBox = arguments.CPAPStudy_CBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CPAPStudy_CBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CPAPStudyNote.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCPAPStudyNote" acess="public" output="false" returntype="any">
		<cfreturn variables.CPAPStudyNote>
	</cffunction>
	
	<cffunction name="setCPAPStudyNote" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CPAPStudyNote" required="true" type="any" />
			
		<cfset variables.CPAPStudyNote = arguments.CPAPStudyNote />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CPAPStudyNote") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OxygenSPO2TBox.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOxygenSPO2TBox" acess="public" output="false" returntype="any">
		<cfreturn variables.OxygenSPO2TBox>
	</cffunction>
	
	<cffunction name="setOxygenSPO2TBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OxygenSPO2TBox" required="true" type="any" />
			
		<cfset variables.OxygenSPO2TBox = arguments.OxygenSPO2TBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OxygenSPO2TBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CPAPStudyOnFile_CBox.                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCPAPStudyOnFile_CBox" acess="public" output="false" returntype="any">
		<cfreturn variables.CPAPStudyOnFile_CBox>
	</cffunction>
	
	<cffunction name="setCPAPStudyOnFile_CBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CPAPStudyOnFile_CBox" required="true" type="any" />
			
		<cfset variables.CPAPStudyOnFile_CBox = arguments.CPAPStudyOnFile_CBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CPAPStudyOnFile_CBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CPAPStudyOnFileNote.                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCPAPStudyOnFileNote" acess="public" output="false" returntype="any">
		<cfreturn variables.CPAPStudyOnFileNote>
	</cffunction>
	
	<cffunction name="setCPAPStudyOnFileNote" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CPAPStudyOnFileNote" required="true" type="any" />
			
		<cfset variables.CPAPStudyOnFileNote = arguments.CPAPStudyOnFileNote />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CPAPStudyOnFileNote") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LabTestDateMM.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLabTestDateMM" acess="public" output="false" returntype="any">
		<cfreturn variables.LabTestDateMM>
	</cffunction>
	
	<cffunction name="setLabTestDateMM" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LabTestDateMM" required="true" type="any" />
			
		<cfset variables.LabTestDateMM = arguments.LabTestDateMM />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LabTestDateMM") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LabTestDateDD.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLabTestDateDD" acess="public" output="false" returntype="any">
		<cfreturn variables.LabTestDateDD>
	</cffunction>
	
	<cffunction name="setLabTestDateDD" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LabTestDateDD" required="true" type="any" />
			
		<cfset variables.LabTestDateDD = arguments.LabTestDateDD />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LabTestDateDD") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LabTestDateYY.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLabTestDateYY" acess="public" output="false" returntype="any">
		<cfreturn variables.LabTestDateYY>
	</cffunction>
	
	<cffunction name="setLabTestDateYY" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LabTestDateYY" required="true" type="any" />
			
		<cfset variables.LabTestDateYY = arguments.LabTestDateYY />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LabTestDateYY") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CPAPStudyPerformedAt.                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCPAPStudyPerformedAt" acess="public" output="false" returntype="any">
		<cfreturn variables.CPAPStudyPerformedAt>
	</cffunction>
	
	<cffunction name="setCPAPStudyPerformedAt" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CPAPStudyPerformedAt" required="true" type="any" />
			
		<cfset variables.CPAPStudyPerformedAt = arguments.CPAPStudyPerformedAt />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CPAPStudyPerformedAt") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LabTestFacilityTBox.                                   --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLabTestFacilityTBox" acess="public" output="false" returntype="any">
		<cfreturn variables.LabTestFacilityTBox>
	</cffunction>
	
	<cffunction name="setLabTestFacilityTBox" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LabTestFacilityTBox" required="true" type="any" />
			
		<cfset variables.LabTestFacilityTBox = arguments.LabTestFacilityTBox />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LabTestFacilityTBox") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CPAPStudyPerformedAt2.                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCPAPStudyPerformedAt2" acess="public" output="false" returntype="any">
		<cfreturn variables.CPAPStudyPerformedAt2>
	</cffunction>
	
	<cffunction name="setCPAPStudyPerformedAt2" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CPAPStudyPerformedAt2" required="true" type="any" />
			
		<cfset variables.CPAPStudyPerformedAt2 = arguments.CPAPStudyPerformedAt2 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CPAPStudyPerformedAt2") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for CPAPStudyPerformedAt3.                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCPAPStudyPerformedAt3" acess="public" output="false" returntype="any">
		<cfreturn variables.CPAPStudyPerformedAt3>
	</cffunction>
	
	<cffunction name="setCPAPStudyPerformedAt3" acess="public" output="false" returntype="boolean">
		
		<cfargument name="CPAPStudyPerformedAt3" required="true" type="any" />
			
		<cfset variables.CPAPStudyPerformedAt3 = arguments.CPAPStudyPerformedAt3 />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "CPAPStudyPerformedAt3") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClosingInvoiceNumber.                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClosingInvoiceNumber" acess="public" output="false" returntype="any">
		<cfreturn variables.ClosingInvoiceNumber>
	</cffunction>
	
	<cffunction name="setClosingInvoiceNumber" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClosingInvoiceNumber" required="true" type="any" />
			
		<cfset variables.ClosingInvoiceNumber = arguments.ClosingInvoiceNumber />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClosingInvoiceNumber") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OPTION_SkilledNursing.                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOPTION_SkilledNursing" acess="public" output="false" returntype="any">
		<cfreturn variables.OPTION_SkilledNursing>
	</cffunction>
	
	<cffunction name="setOPTION_SkilledNursing" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OPTION_SkilledNursing" required="true" type="any" />
			
		<cfset variables.OPTION_SkilledNursing = arguments.OPTION_SkilledNursing />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OPTION_SkilledNursing") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SkilledNursingName.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSkilledNursingName" acess="public" output="false" returntype="any">
		<cfreturn variables.SkilledNursingName>
	</cffunction>
	
	<cffunction name="setSkilledNursingName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SkilledNursingName" required="true" type="any" />
			
		<cfset variables.SkilledNursingName = arguments.SkilledNursingName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SkilledNursingName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SkilledNursingTelephone.                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSkilledNursingTelephone" acess="public" output="false" returntype="any">
		<cfreturn variables.SkilledNursingTelephone>
	</cffunction>
	
	<cffunction name="setSkilledNursingTelephone" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SkilledNursingTelephone" required="true" type="any" />
			
		<cfset variables.SkilledNursingTelephone = arguments.SkilledNursingTelephone />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SkilledNursingTelephone") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Printed.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPrinted" acess="public" output="false" returntype="any">
		<cfreturn variables.Printed>
	</cffunction>
	
	<cffunction name="setPrinted" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Printed" required="true" type="any" />
			
		<cfset variables.Printed = arguments.Printed />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Printed") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Active.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getActive" acess="public" output="false" returntype="any">
		<cfreturn variables.Active>
	</cffunction>
	
	<cffunction name="setActive" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Active" required="true" type="any" />
			
		<cfset variables.Active = arguments.Active />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Active") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InactiveCode.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInactiveCode" acess="public" output="false" returntype="any">
		<cfreturn variables.InactiveCode>
	</cffunction>
	
	<cffunction name="setInactiveCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InactiveCode" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.InactiveCode)) OR trim(arguments.InactiveCode) EQ "">
			<cfset variables.InactiveCode = arguments.InactiveCode />
		<cfelse>
			<cfthrow message="InactiveCode (#arguments.InactiveCode#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InactiveCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateCreated.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateCreated" acess="public" output="false" returntype="any">
		<cfreturn variables.DateCreated>
	</cffunction>
	
	<cffunction name="setDateCreated" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateCreated" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateCreated)) OR trim(arguments.DateCreated) EQ "">
			<cfset variables.DateCreated = arguments.DateCreated />
		<cfelse>
			<cfthrow message="DateCreated (#arguments.DateCreated#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateCreated") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateModified.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateModified" acess="public" output="false" returntype="any">
		<cfreturn variables.DateModified>
	</cffunction>
	
	<cffunction name="setDateModified" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateModified" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateModified)) OR trim(arguments.DateModified) EQ "">
			<cfset variables.DateModified = arguments.DateModified />
		<cfelse>
			<cfthrow message="DateModified (#arguments.DateModified#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateModified") />		
		
		<cfreturn true>
		
	</cffunction>
		

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>


