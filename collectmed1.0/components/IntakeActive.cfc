 	


<cfcomponent name="intakeActive" output="false" alias="intakeActive">

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
		variables.ds = "";
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
	<cffunction name="init" output="false" returntype="intakeActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "IntakeID") AND stValues.IntakeID NEQ 0>
				<cfquery name="qGetIntake" datasource="#trim(variables.ds)#">
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
		

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record by an ID.                                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="save" output="false" access="remote">
				 		
		<cfif this.getIntakeID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getIntakeID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getIntake" output="false" access="public" returntype="query">
				
		<cfargument name="IntakeID" required="yes" type="numeric" />		
		<cfset var qGetIntake = "" />		
	
		<cfquery name="qGetIntake" datasource="#trim(variables.ds)#">
	  		SELECT IntakeID,ClientID,AssignedToUserID,hidden_Step,hidden_UsersID,hidden_TimeStart,OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing,OPTION_2_CBox_Other,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital,otherTBox,hospiceTBox,OPTION_3_CBox_Medicare,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay,hospitalTBox,DischargeDateMM,DischargeDateDD,DischargeDateYY,typeOfPay_Radio,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientXML,patientID,patientAddressID,patientPhoneID,roomNumberTBox,bedNumberTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,poNumberTBox,creditCardTypeTBox,creditCardNumberTBox,ccDateMM,ccDateDD,ccDateYY,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,orderingPhysicianUPINTBox,orderingPhysicianFaxTBox,orderingPhysicianAddressTBox,orderingPhysicianCityTBox,orderingPhysicianStateTBox,orderingPhysicianZipTBox,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo,Equipment1TypeTBox,Equipment1RentPurchasedSelect,Equipment1FromMM,Equipment1FromDD,Equipment1FromYY,Equipment1ToMM,Equipment1ToDD,Equipment1ToYY,Equipment1SupplierNameTBox,Equipment1SupplierTelephoneTBox,Equipment2TypeTBox,Equipment2RentPurchasedSelect,Equipment2FromMM,Equipment2FromDD,Equipment2FromYY,Equipment2ToMM,Equipment2ToDD,Equipment2ToYY,Equipment2SupplierNameTBox,Equipment2SupplierTelephoneTBox,Equipment3TypeTBox,Equipment3RentPurchasedSelect,Equipment3FromMM,Equipment3FromDD,Equipment3FromYY,Equipment3ToMM,Equipment3ToDD,Equipment3ToYY,Equipment3SupplierNameTBox,Equipment3SupplierTelephoneTBox,Equipment4TypeTBox,Equipment4RentPurchasedSelect,Equipment4FromMM,Equipment4FromDD,Equipment4FromYY,Equipment4ToMM,Equipment4ToDD,Equipment4ToYY,Equipment4SupplierNameTBox,Equipment4SupplierTelephoneTBox,Equipment5TypeTBox,Equipment5RentPurchasedSelect,Equipment5FromMM,Equipment5FromDD,Equipment5FromYY,Equipment5ToMM,Equipment5ToDD,Equipment5ToYY,Equipment5SupplierNameTBox,Equipment5SupplierTelephoneTBox,Equipment1NoteTBox,Equipment2NoteTBox,Equipment3NoteTBox,Equipment4NoteTBox,Equipment5NoteTBox,OPTION_14_CBox_OxygenPAo2,OPTION_14_CBox_OxygenSAo2,OPTION_14_CBox_OxygenSPo2,OxygenPAO2TBox,OxygenSAO2TBox,CPAPStudy_CBox,CPAPStudyNote,OxygenSPO2TBox,CPAPStudyOnFile_CBox,CPAPStudyOnFileNote,LabTestDateMM,LabTestDateDD,LabTestDateYY,CPAPStudyPerformedAt,LabTestFacilityTBox,CPAPStudyPerformedAt2,CPAPStudyPerformedAt3,ClosingInvoiceNumber,OPTION_SkilledNursing,SkilledNursingName,SkilledNursingTelephone,Printed,Active,InactiveCode,DateCreated,DateModified
			FROM Intake  
			WHERE IntakeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.IntakeID)#" /> 
		</cfquery>
		
		<cfreturn qGetIntake>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="IntakeActive" />
		
		<cfset var qCreateIntake = "" />		
		
		<cfset var localClientID = arguments.obj.getClientID() />
		<cfset var localAssignedToUserID = arguments.obj.getAssignedToUserID() />
		<cfset var localhidden_Step = arguments.obj.gethidden_Step() />
		<cfset var localhidden_UsersID = arguments.obj.gethidden_UsersID() />
		<cfset var localhidden_TimeStart = arguments.obj.gethidden_TimeStart() />
		<cfset var localOPTION_1_CBox_Delivery = arguments.obj.getOPTION_1_CBox_Delivery() />
		<cfset var localOPTION_1_CBox_Pickup = arguments.obj.getOPTION_1_CBox_Pickup() />
		<cfset var localOPTION_1_CBox_Repair = arguments.obj.getOPTION_1_CBox_Repair() />
		<cfset var localOPTION_1_CBox_Switch = arguments.obj.getOPTION_1_CBox_Switch() />
		<cfset var localOPTION_1_CBox_Existing = arguments.obj.getOPTION_1_CBox_Existing() />
		<cfset var localOPTION_2_CBox_Other = arguments.obj.getOPTION_2_CBox_Other() />
		<cfset var localOPTION_2_CBox_Hospice = arguments.obj.getOPTION_2_CBox_Hospice() />
		<cfset var localOPTION_2_CBox_Hospital = arguments.obj.getOPTION_2_CBox_Hospital() />
		<cfset var localotherTBox = arguments.obj.getotherTBox() />
		<cfset var localhospiceTBox = arguments.obj.gethospiceTBox() />
		<cfset var localOPTION_3_CBox_Medicare = arguments.obj.getOPTION_3_CBox_Medicare() />
		<cfset var localOPTION_3_CBox_PrivateInsurance = arguments.obj.getOPTION_3_CBox_PrivateInsurance() />
		<cfset var localOPTION_3_CBox_Medicaid = arguments.obj.getOPTION_3_CBox_Medicaid() />
		<cfset var localOPTION_3_CBox_PrivatePay = arguments.obj.getOPTION_3_CBox_PrivatePay() />
		<cfset var localhospitalTBox = arguments.obj.gethospitalTBox() />
		<cfset var localDischargeDateMM = arguments.obj.getDischargeDateMM() />
		<cfset var localDischargeDateDD = arguments.obj.getDischargeDateDD() />
		<cfset var localDischargeDateYY = arguments.obj.getDischargeDateYY() />
		<cfset var localtypeOfPay_Radio = arguments.obj.gettypeOfPay_Radio() />
		<cfset var localcallerFNameTBox = arguments.obj.getcallerFNameTBox() />
		<cfset var localcallerMInitialTBox = arguments.obj.getcallerMInitialTBox() />
		<cfset var localcallerLNameTBox = arguments.obj.getcallerLNameTBox() />
		<cfset var localcallerPhoneTBox = arguments.obj.getcallerPhoneTBox() />
		<cfset var localpatientXML = arguments.obj.getpatientXML() />
		<cfset var localpatientID = arguments.obj.getpatientID() />
		<cfset var localpatientAddressID = arguments.obj.getpatientAddressID() />
		<cfset var localpatientPhoneID = arguments.obj.getpatientPhoneID() />
		<cfset var localroomNumberTBox = arguments.obj.getroomNumberTBox() />
		<cfset var localbedNumberTBox = arguments.obj.getbedNumberTBox() />
		<cfset var localalternateContactFNameTBox = arguments.obj.getalternateContactFNameTBox() />
		<cfset var localalternateContactMInitialTBox = arguments.obj.getalternateContactMInitialTBox() />
		<cfset var localalternateContactLNameTBox = arguments.obj.getalternateContactLNameTBox() />
		<cfset var localalternateContactRelationshipTBox = arguments.obj.getalternateContactRelationshipTBox() />
		<cfset var localalternateContactPhoneTBox = arguments.obj.getalternateContactPhoneTBox() />
		<cfset var localalternateContactWorkPhoneTBox = arguments.obj.getalternateContactWorkPhoneTBox() />
		<cfset var localpoNumberTBox = arguments.obj.getpoNumberTBox() />
		<cfset var localcreditCardTypeTBox = arguments.obj.getcreditCardTypeTBox() />
		<cfset var localcreditCardNumberTBox = arguments.obj.getcreditCardNumberTBox() />
		<cfset var localccDateMM = arguments.obj.getccDateMM() />
		<cfset var localccDateDD = arguments.obj.getccDateDD() />
		<cfset var localccDateYY = arguments.obj.getccDateYY() />
		<cfset var localorderingPhysicianFNameTBox = arguments.obj.getorderingPhysicianFNameTBox() />
		<cfset var localorderingPhysicianMInitialTBox = arguments.obj.getorderingPhysicianMInitialTBox() />
		<cfset var localorderingPhysicianLNameTBox = arguments.obj.getorderingPhysicianLNameTBox() />
		<cfset var localorderingPhysicianPhoneTBox = arguments.obj.getorderingPhysicianPhoneTBox() />
		<cfset var localorderingPhysicianUPINTBox = arguments.obj.getorderingPhysicianUPINTBox() />
		<cfset var localorderingPhysicianFaxTBox = arguments.obj.getorderingPhysicianFaxTBox() />
		<cfset var localorderingPhysicianAddressTBox = arguments.obj.getorderingPhysicianAddressTBox() />
		<cfset var localorderingPhysicianCityTBox = arguments.obj.getorderingPhysicianCityTBox() />
		<cfset var localorderingPhysicianStateTBox = arguments.obj.getorderingPhysicianStateTBox() />
		<cfset var localorderingPhysicianZipTBox = arguments.obj.getorderingPhysicianZipTBox() />
		<cfset var localOPTION_13_CBox_PastEquipmentYes = arguments.obj.getOPTION_13_CBox_PastEquipmentYes() />
		<cfset var localOPTION_13_CBox_PastEquipmentNo = arguments.obj.getOPTION_13_CBox_PastEquipmentNo() />
		<cfset var localEquipment1TypeTBox = arguments.obj.getEquipment1TypeTBox() />
		<cfset var localEquipment1RentPurchasedSelect = arguments.obj.getEquipment1RentPurchasedSelect() />
		<cfset var localEquipment1FromMM = arguments.obj.getEquipment1FromMM() />
		<cfset var localEquipment1FromDD = arguments.obj.getEquipment1FromDD() />
		<cfset var localEquipment1FromYY = arguments.obj.getEquipment1FromYY() />
		<cfset var localEquipment1ToMM = arguments.obj.getEquipment1ToMM() />
		<cfset var localEquipment1ToDD = arguments.obj.getEquipment1ToDD() />
		<cfset var localEquipment1ToYY = arguments.obj.getEquipment1ToYY() />
		<cfset var localEquipment1SupplierNameTBox = arguments.obj.getEquipment1SupplierNameTBox() />
		<cfset var localEquipment1SupplierTelephoneTBox = arguments.obj.getEquipment1SupplierTelephoneTBox() />
		<cfset var localEquipment2TypeTBox = arguments.obj.getEquipment2TypeTBox() />
		<cfset var localEquipment2RentPurchasedSelect = arguments.obj.getEquipment2RentPurchasedSelect() />
		<cfset var localEquipment2FromMM = arguments.obj.getEquipment2FromMM() />
		<cfset var localEquipment2FromDD = arguments.obj.getEquipment2FromDD() />
		<cfset var localEquipment2FromYY = arguments.obj.getEquipment2FromYY() />
		<cfset var localEquipment2ToMM = arguments.obj.getEquipment2ToMM() />
		<cfset var localEquipment2ToDD = arguments.obj.getEquipment2ToDD() />
		<cfset var localEquipment2ToYY = arguments.obj.getEquipment2ToYY() />
		<cfset var localEquipment2SupplierNameTBox = arguments.obj.getEquipment2SupplierNameTBox() />
		<cfset var localEquipment2SupplierTelephoneTBox = arguments.obj.getEquipment2SupplierTelephoneTBox() />
		<cfset var localEquipment3TypeTBox = arguments.obj.getEquipment3TypeTBox() />
		<cfset var localEquipment3RentPurchasedSelect = arguments.obj.getEquipment3RentPurchasedSelect() />
		<cfset var localEquipment3FromMM = arguments.obj.getEquipment3FromMM() />
		<cfset var localEquipment3FromDD = arguments.obj.getEquipment3FromDD() />
		<cfset var localEquipment3FromYY = arguments.obj.getEquipment3FromYY() />
		<cfset var localEquipment3ToMM = arguments.obj.getEquipment3ToMM() />
		<cfset var localEquipment3ToDD = arguments.obj.getEquipment3ToDD() />
		<cfset var localEquipment3ToYY = arguments.obj.getEquipment3ToYY() />
		<cfset var localEquipment3SupplierNameTBox = arguments.obj.getEquipment3SupplierNameTBox() />
		<cfset var localEquipment3SupplierTelephoneTBox = arguments.obj.getEquipment3SupplierTelephoneTBox() />
		<cfset var localEquipment4TypeTBox = arguments.obj.getEquipment4TypeTBox() />
		<cfset var localEquipment4RentPurchasedSelect = arguments.obj.getEquipment4RentPurchasedSelect() />
		<cfset var localEquipment4FromMM = arguments.obj.getEquipment4FromMM() />
		<cfset var localEquipment4FromDD = arguments.obj.getEquipment4FromDD() />
		<cfset var localEquipment4FromYY = arguments.obj.getEquipment4FromYY() />
		<cfset var localEquipment4ToMM = arguments.obj.getEquipment4ToMM() />
		<cfset var localEquipment4ToDD = arguments.obj.getEquipment4ToDD() />
		<cfset var localEquipment4ToYY = arguments.obj.getEquipment4ToYY() />
		<cfset var localEquipment4SupplierNameTBox = arguments.obj.getEquipment4SupplierNameTBox() />
		<cfset var localEquipment4SupplierTelephoneTBox = arguments.obj.getEquipment4SupplierTelephoneTBox() />
		<cfset var localEquipment5TypeTBox = arguments.obj.getEquipment5TypeTBox() />
		<cfset var localEquipment5RentPurchasedSelect = arguments.obj.getEquipment5RentPurchasedSelect() />
		<cfset var localEquipment5FromMM = arguments.obj.getEquipment5FromMM() />
		<cfset var localEquipment5FromDD = arguments.obj.getEquipment5FromDD() />
		<cfset var localEquipment5FromYY = arguments.obj.getEquipment5FromYY() />
		<cfset var localEquipment5ToMM = arguments.obj.getEquipment5ToMM() />
		<cfset var localEquipment5ToDD = arguments.obj.getEquipment5ToDD() />
		<cfset var localEquipment5ToYY = arguments.obj.getEquipment5ToYY() />
		<cfset var localEquipment5SupplierNameTBox = arguments.obj.getEquipment5SupplierNameTBox() />
		<cfset var localEquipment5SupplierTelephoneTBox = arguments.obj.getEquipment5SupplierTelephoneTBox() />
		<cfset var localEquipment1NoteTBox = arguments.obj.getEquipment1NoteTBox() />
		<cfset var localEquipment2NoteTBox = arguments.obj.getEquipment2NoteTBox() />
		<cfset var localEquipment3NoteTBox = arguments.obj.getEquipment3NoteTBox() />
		<cfset var localEquipment4NoteTBox = arguments.obj.getEquipment4NoteTBox() />
		<cfset var localEquipment5NoteTBox = arguments.obj.getEquipment5NoteTBox() />
		<cfset var localOPTION_14_CBox_OxygenPAo2 = arguments.obj.getOPTION_14_CBox_OxygenPAo2() />
		<cfset var localOPTION_14_CBox_OxygenSAo2 = arguments.obj.getOPTION_14_CBox_OxygenSAo2() />
		<cfset var localOPTION_14_CBox_OxygenSPo2 = arguments.obj.getOPTION_14_CBox_OxygenSPo2() />
		<cfset var localOxygenPAO2TBox = arguments.obj.getOxygenPAO2TBox() />
		<cfset var localOxygenSAO2TBox = arguments.obj.getOxygenSAO2TBox() />
		<cfset var localCPAPStudy_CBox = arguments.obj.getCPAPStudy_CBox() />
		<cfset var localCPAPStudyNote = arguments.obj.getCPAPStudyNote() />
		<cfset var localOxygenSPO2TBox = arguments.obj.getOxygenSPO2TBox() />
		<cfset var localCPAPStudyOnFile_CBox = arguments.obj.getCPAPStudyOnFile_CBox() />
		<cfset var localCPAPStudyOnFileNote = arguments.obj.getCPAPStudyOnFileNote() />
		<cfset var localLabTestDateMM = arguments.obj.getLabTestDateMM() />
		<cfset var localLabTestDateDD = arguments.obj.getLabTestDateDD() />
		<cfset var localLabTestDateYY = arguments.obj.getLabTestDateYY() />
		<cfset var localCPAPStudyPerformedAt = arguments.obj.getCPAPStudyPerformedAt() />
		<cfset var localLabTestFacilityTBox = arguments.obj.getLabTestFacilityTBox() />
		<cfset var localCPAPStudyPerformedAt2 = arguments.obj.getCPAPStudyPerformedAt2() />
		<cfset var localCPAPStudyPerformedAt3 = arguments.obj.getCPAPStudyPerformedAt3() />
		<cfset var localClosingInvoiceNumber = arguments.obj.getClosingInvoiceNumber() />
		<cfset var localOPTION_SkilledNursing = arguments.obj.getOPTION_SkilledNursing() />
		<cfset var localSkilledNursingName = arguments.obj.getSkilledNursingName() />
		<cfset var localSkilledNursingTelephone = arguments.obj.getSkilledNursingTelephone() />
		<cfset var localPrinted = arguments.obj.getPrinted() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateIntake" datasource="#trim(variables.ds)#">
				INSERT INTO Intake (ClientID,AssignedToUserID,hidden_Step,hidden_UsersID,hidden_TimeStart,OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing,OPTION_2_CBox_Other,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital,otherTBox,hospiceTBox,OPTION_3_CBox_Medicare,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay,hospitalTBox,DischargeDateMM,DischargeDateDD,DischargeDateYY,typeOfPay_Radio,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientXML,patientID,patientAddressID,patientPhoneID,roomNumberTBox,bedNumberTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,poNumberTBox,creditCardTypeTBox,creditCardNumberTBox,ccDateMM,ccDateDD,ccDateYY,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,orderingPhysicianUPINTBox,orderingPhysicianFaxTBox,orderingPhysicianAddressTBox,orderingPhysicianCityTBox,orderingPhysicianStateTBox,orderingPhysicianZipTBox,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo,Equipment1TypeTBox,Equipment1RentPurchasedSelect,Equipment1FromMM,Equipment1FromDD,Equipment1FromYY,Equipment1ToMM,Equipment1ToDD,Equipment1ToYY,Equipment1SupplierNameTBox,Equipment1SupplierTelephoneTBox,Equipment2TypeTBox,Equipment2RentPurchasedSelect,Equipment2FromMM,Equipment2FromDD,Equipment2FromYY,Equipment2ToMM,Equipment2ToDD,Equipment2ToYY,Equipment2SupplierNameTBox,Equipment2SupplierTelephoneTBox,Equipment3TypeTBox,Equipment3RentPurchasedSelect,Equipment3FromMM,Equipment3FromDD,Equipment3FromYY,Equipment3ToMM,Equipment3ToDD,Equipment3ToYY,Equipment3SupplierNameTBox,Equipment3SupplierTelephoneTBox,Equipment4TypeTBox,Equipment4RentPurchasedSelect,Equipment4FromMM,Equipment4FromDD,Equipment4FromYY,Equipment4ToMM,Equipment4ToDD,Equipment4ToYY,Equipment4SupplierNameTBox,Equipment4SupplierTelephoneTBox,Equipment5TypeTBox,Equipment5RentPurchasedSelect,Equipment5FromMM,Equipment5FromDD,Equipment5FromYY,Equipment5ToMM,Equipment5ToDD,Equipment5ToYY,Equipment5SupplierNameTBox,Equipment5SupplierTelephoneTBox,Equipment1NoteTBox,Equipment2NoteTBox,Equipment3NoteTBox,Equipment4NoteTBox,Equipment5NoteTBox,OPTION_14_CBox_OxygenPAo2,OPTION_14_CBox_OxygenSAo2,OPTION_14_CBox_OxygenSPo2,OxygenPAO2TBox,OxygenSAO2TBox,CPAPStudy_CBox,CPAPStudyNote,OxygenSPO2TBox,CPAPStudyOnFile_CBox,CPAPStudyOnFileNote,LabTestDateMM,LabTestDateDD,LabTestDateYY,CPAPStudyPerformedAt,LabTestFacilityTBox,CPAPStudyPerformedAt2,CPAPStudyPerformedAt3,ClosingInvoiceNumber,OPTION_SkilledNursing,SkilledNursingName,SkilledNursingTelephone,Printed,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />,				
					<cfif IsNumeric(trim(localAssignedToUserID))>						
						<cfqueryparam value="#trim(localAssignedToUserID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localhidden_Step) NEQ "" AND trim(localhidden_Step) NEQ "@@" AND trim(localhidden_Step) NEQ "NULL">						
						<cfqueryparam value="#trim(localhidden_Step)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhidden_UsersID) NEQ "" AND trim(localhidden_UsersID) NEQ "@@" AND trim(localhidden_UsersID) NEQ "NULL">						
						<cfqueryparam value="#trim(localhidden_UsersID)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhidden_TimeStart) NEQ "" AND trim(localhidden_TimeStart) NEQ "@@" AND trim(localhidden_TimeStart) NEQ "NULL">						
						<cfqueryparam value="#trim(localhidden_TimeStart)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOPTION_1_CBox_Delivery) NEQ "" AND trim(localOPTION_1_CBox_Delivery) NEQ "@@" AND trim(localOPTION_1_CBox_Delivery) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_1_CBox_Delivery)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOPTION_1_CBox_Pickup) NEQ "" AND trim(localOPTION_1_CBox_Pickup) NEQ "@@" AND trim(localOPTION_1_CBox_Pickup) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_1_CBox_Pickup)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOPTION_1_CBox_Repair) NEQ "" AND trim(localOPTION_1_CBox_Repair) NEQ "@@" AND trim(localOPTION_1_CBox_Repair) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_1_CBox_Repair)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOPTION_1_CBox_Switch) NEQ "" AND trim(localOPTION_1_CBox_Switch) NEQ "@@" AND trim(localOPTION_1_CBox_Switch) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_1_CBox_Switch)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOPTION_1_CBox_Existing) NEQ "" AND trim(localOPTION_1_CBox_Existing) NEQ "@@" AND trim(localOPTION_1_CBox_Existing) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_1_CBox_Existing)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOPTION_2_CBox_Other) NEQ "" AND trim(localOPTION_2_CBox_Other) NEQ "@@" AND trim(localOPTION_2_CBox_Other) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_2_CBox_Other)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOPTION_2_CBox_Hospice) NEQ "" AND trim(localOPTION_2_CBox_Hospice) NEQ "@@" AND trim(localOPTION_2_CBox_Hospice) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_2_CBox_Hospice)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOPTION_2_CBox_Hospital) NEQ "" AND trim(localOPTION_2_CBox_Hospital) NEQ "@@" AND trim(localOPTION_2_CBox_Hospital) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_2_CBox_Hospital)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localotherTBox) NEQ "" AND trim(localotherTBox) NEQ "@@" AND trim(localotherTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localotherTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhospiceTBox) NEQ "" AND trim(localhospiceTBox) NEQ "@@" AND trim(localhospiceTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhospiceTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOPTION_3_CBox_Medicare) NEQ "" AND trim(localOPTION_3_CBox_Medicare) NEQ "@@" AND trim(localOPTION_3_CBox_Medicare) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_3_CBox_Medicare)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOPTION_3_CBox_PrivateInsurance) NEQ "" AND trim(localOPTION_3_CBox_PrivateInsurance) NEQ "@@" AND trim(localOPTION_3_CBox_PrivateInsurance) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_3_CBox_PrivateInsurance)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOPTION_3_CBox_Medicaid) NEQ "" AND trim(localOPTION_3_CBox_Medicaid) NEQ "@@" AND trim(localOPTION_3_CBox_Medicaid) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_3_CBox_Medicaid)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOPTION_3_CBox_PrivatePay) NEQ "" AND trim(localOPTION_3_CBox_PrivatePay) NEQ "@@" AND trim(localOPTION_3_CBox_PrivatePay) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_3_CBox_PrivatePay)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localhospitalTBox) NEQ "" AND trim(localhospitalTBox) NEQ "@@" AND trim(localhospitalTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhospitalTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localDischargeDateMM) NEQ "" AND trim(localDischargeDateMM) NEQ "@@" AND trim(localDischargeDateMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localDischargeDateMM)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localDischargeDateDD) NEQ "" AND trim(localDischargeDateDD) NEQ "@@" AND trim(localDischargeDateDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localDischargeDateDD)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localDischargeDateYY) NEQ "" AND trim(localDischargeDateYY) NEQ "@@" AND trim(localDischargeDateYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localDischargeDateYY)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localtypeOfPay_Radio) NEQ "" AND trim(localtypeOfPay_Radio) NEQ "@@" AND trim(localtypeOfPay_Radio) NEQ "NULL">						
						<cfqueryparam value="#trim(localtypeOfPay_Radio)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localcallerFNameTBox) NEQ "" AND trim(localcallerFNameTBox) NEQ "@@" AND trim(localcallerFNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localcallerFNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localcallerMInitialTBox) NEQ "" AND trim(localcallerMInitialTBox) NEQ "@@" AND trim(localcallerMInitialTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localcallerMInitialTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localcallerLNameTBox) NEQ "" AND trim(localcallerLNameTBox) NEQ "@@" AND trim(localcallerLNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localcallerLNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localcallerPhoneTBox) NEQ "" AND trim(localcallerPhoneTBox) NEQ "@@" AND trim(localcallerPhoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localcallerPhoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localpatientXML) NEQ "" AND trim(localpatientXML) NEQ "@@" AND trim(localpatientXML) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientXML)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localpatientID))>						
						<cfqueryparam value="#trim(localpatientID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localpatientAddressID))>						
						<cfqueryparam value="#trim(localpatientAddressID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localpatientPhoneID))>						
						<cfqueryparam value="#trim(localpatientPhoneID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localroomNumberTBox) NEQ "" AND trim(localroomNumberTBox) NEQ "@@" AND trim(localroomNumberTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localroomNumberTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localbedNumberTBox) NEQ "" AND trim(localbedNumberTBox) NEQ "@@" AND trim(localbedNumberTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localbedNumberTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localalternateContactFNameTBox) NEQ "" AND trim(localalternateContactFNameTBox) NEQ "@@" AND trim(localalternateContactFNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactFNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localalternateContactMInitialTBox) NEQ "" AND trim(localalternateContactMInitialTBox) NEQ "@@" AND trim(localalternateContactMInitialTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactMInitialTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localalternateContactLNameTBox) NEQ "" AND trim(localalternateContactLNameTBox) NEQ "@@" AND trim(localalternateContactLNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactLNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localalternateContactRelationshipTBox) NEQ "" AND trim(localalternateContactRelationshipTBox) NEQ "@@" AND trim(localalternateContactRelationshipTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactRelationshipTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localalternateContactPhoneTBox) NEQ "" AND trim(localalternateContactPhoneTBox) NEQ "@@" AND trim(localalternateContactPhoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactPhoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localalternateContactWorkPhoneTBox) NEQ "" AND trim(localalternateContactWorkPhoneTBox) NEQ "@@" AND trim(localalternateContactWorkPhoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactWorkPhoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localpoNumberTBox) NEQ "" AND trim(localpoNumberTBox) NEQ "@@" AND trim(localpoNumberTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpoNumberTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localcreditCardTypeTBox) NEQ "" AND trim(localcreditCardTypeTBox) NEQ "@@" AND trim(localcreditCardTypeTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localcreditCardTypeTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localcreditCardNumberTBox) NEQ "" AND trim(localcreditCardNumberTBox) NEQ "@@" AND trim(localcreditCardNumberTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localcreditCardNumberTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localccDateMM) NEQ "" AND trim(localccDateMM) NEQ "@@" AND trim(localccDateMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localccDateMM)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localccDateDD) NEQ "" AND trim(localccDateDD) NEQ "@@" AND trim(localccDateDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localccDateDD)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localccDateYY) NEQ "" AND trim(localccDateYY) NEQ "@@" AND trim(localccDateYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localccDateYY)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localorderingPhysicianFNameTBox) NEQ "" AND trim(localorderingPhysicianFNameTBox) NEQ "@@" AND trim(localorderingPhysicianFNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianFNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localorderingPhysicianMInitialTBox) NEQ "" AND trim(localorderingPhysicianMInitialTBox) NEQ "@@" AND trim(localorderingPhysicianMInitialTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianMInitialTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localorderingPhysicianLNameTBox) NEQ "" AND trim(localorderingPhysicianLNameTBox) NEQ "@@" AND trim(localorderingPhysicianLNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianLNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localorderingPhysicianPhoneTBox) NEQ "" AND trim(localorderingPhysicianPhoneTBox) NEQ "@@" AND trim(localorderingPhysicianPhoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianPhoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localorderingPhysicianUPINTBox) NEQ "" AND trim(localorderingPhysicianUPINTBox) NEQ "@@" AND trim(localorderingPhysicianUPINTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianUPINTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localorderingPhysicianFaxTBox) NEQ "" AND trim(localorderingPhysicianFaxTBox) NEQ "@@" AND trim(localorderingPhysicianFaxTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianFaxTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localorderingPhysicianAddressTBox) NEQ "" AND trim(localorderingPhysicianAddressTBox) NEQ "@@" AND trim(localorderingPhysicianAddressTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianAddressTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localorderingPhysicianCityTBox) NEQ "" AND trim(localorderingPhysicianCityTBox) NEQ "@@" AND trim(localorderingPhysicianCityTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianCityTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localorderingPhysicianStateTBox) NEQ "" AND trim(localorderingPhysicianStateTBox) NEQ "@@" AND trim(localorderingPhysicianStateTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianStateTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localorderingPhysicianZipTBox) NEQ "" AND trim(localorderingPhysicianZipTBox) NEQ "@@" AND trim(localorderingPhysicianZipTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianZipTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOPTION_13_CBox_PastEquipmentYes) NEQ "" AND trim(localOPTION_13_CBox_PastEquipmentYes) NEQ "@@" AND trim(localOPTION_13_CBox_PastEquipmentYes) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_13_CBox_PastEquipmentYes)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOPTION_13_CBox_PastEquipmentNo) NEQ "" AND trim(localOPTION_13_CBox_PastEquipmentNo) NEQ "@@" AND trim(localOPTION_13_CBox_PastEquipmentNo) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_13_CBox_PastEquipmentNo)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment1TypeTBox) NEQ "" AND trim(localEquipment1TypeTBox) NEQ "@@" AND trim(localEquipment1TypeTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1TypeTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment1RentPurchasedSelect) NEQ "" AND trim(localEquipment1RentPurchasedSelect) NEQ "@@" AND trim(localEquipment1RentPurchasedSelect) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1RentPurchasedSelect)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment1FromMM) NEQ "" AND trim(localEquipment1FromMM) NEQ "@@" AND trim(localEquipment1FromMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1FromMM)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment1FromDD) NEQ "" AND trim(localEquipment1FromDD) NEQ "@@" AND trim(localEquipment1FromDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1FromDD)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment1FromYY) NEQ "" AND trim(localEquipment1FromYY) NEQ "@@" AND trim(localEquipment1FromYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1FromYY)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment1ToMM) NEQ "" AND trim(localEquipment1ToMM) NEQ "@@" AND trim(localEquipment1ToMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1ToMM)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment1ToDD) NEQ "" AND trim(localEquipment1ToDD) NEQ "@@" AND trim(localEquipment1ToDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1ToDD)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment1ToYY) NEQ "" AND trim(localEquipment1ToYY) NEQ "@@" AND trim(localEquipment1ToYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1ToYY)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment1SupplierNameTBox) NEQ "" AND trim(localEquipment1SupplierNameTBox) NEQ "@@" AND trim(localEquipment1SupplierNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1SupplierNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment1SupplierTelephoneTBox) NEQ "" AND trim(localEquipment1SupplierTelephoneTBox) NEQ "@@" AND trim(localEquipment1SupplierTelephoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1SupplierTelephoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment2TypeTBox) NEQ "" AND trim(localEquipment2TypeTBox) NEQ "@@" AND trim(localEquipment2TypeTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2TypeTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment2RentPurchasedSelect) NEQ "" AND trim(localEquipment2RentPurchasedSelect) NEQ "@@" AND trim(localEquipment2RentPurchasedSelect) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2RentPurchasedSelect)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment2FromMM) NEQ "" AND trim(localEquipment2FromMM) NEQ "@@" AND trim(localEquipment2FromMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2FromMM)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment2FromDD) NEQ "" AND trim(localEquipment2FromDD) NEQ "@@" AND trim(localEquipment2FromDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2FromDD)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment2FromYY) NEQ "" AND trim(localEquipment2FromYY) NEQ "@@" AND trim(localEquipment2FromYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2FromYY)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment2ToMM) NEQ "" AND trim(localEquipment2ToMM) NEQ "@@" AND trim(localEquipment2ToMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2ToMM)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment2ToDD) NEQ "" AND trim(localEquipment2ToDD) NEQ "@@" AND trim(localEquipment2ToDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2ToDD)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment2ToYY) NEQ "" AND trim(localEquipment2ToYY) NEQ "@@" AND trim(localEquipment2ToYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2ToYY)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment2SupplierNameTBox) NEQ "" AND trim(localEquipment2SupplierNameTBox) NEQ "@@" AND trim(localEquipment2SupplierNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2SupplierNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment2SupplierTelephoneTBox) NEQ "" AND trim(localEquipment2SupplierTelephoneTBox) NEQ "@@" AND trim(localEquipment2SupplierTelephoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2SupplierTelephoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment3TypeTBox) NEQ "" AND trim(localEquipment3TypeTBox) NEQ "@@" AND trim(localEquipment3TypeTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3TypeTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment3RentPurchasedSelect) NEQ "" AND trim(localEquipment3RentPurchasedSelect) NEQ "@@" AND trim(localEquipment3RentPurchasedSelect) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3RentPurchasedSelect)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment3FromMM) NEQ "" AND trim(localEquipment3FromMM) NEQ "@@" AND trim(localEquipment3FromMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3FromMM)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment3FromDD) NEQ "" AND trim(localEquipment3FromDD) NEQ "@@" AND trim(localEquipment3FromDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3FromDD)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment3FromYY) NEQ "" AND trim(localEquipment3FromYY) NEQ "@@" AND trim(localEquipment3FromYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3FromYY)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment3ToMM) NEQ "" AND trim(localEquipment3ToMM) NEQ "@@" AND trim(localEquipment3ToMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3ToMM)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment3ToDD) NEQ "" AND trim(localEquipment3ToDD) NEQ "@@" AND trim(localEquipment3ToDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3ToDD)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment3ToYY) NEQ "" AND trim(localEquipment3ToYY) NEQ "@@" AND trim(localEquipment3ToYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3ToYY)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment3SupplierNameTBox) NEQ "" AND trim(localEquipment3SupplierNameTBox) NEQ "@@" AND trim(localEquipment3SupplierNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3SupplierNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment3SupplierTelephoneTBox) NEQ "" AND trim(localEquipment3SupplierTelephoneTBox) NEQ "@@" AND trim(localEquipment3SupplierTelephoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3SupplierTelephoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment4TypeTBox) NEQ "" AND trim(localEquipment4TypeTBox) NEQ "@@" AND trim(localEquipment4TypeTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4TypeTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment4RentPurchasedSelect) NEQ "" AND trim(localEquipment4RentPurchasedSelect) NEQ "@@" AND trim(localEquipment4RentPurchasedSelect) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4RentPurchasedSelect)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment4FromMM) NEQ "" AND trim(localEquipment4FromMM) NEQ "@@" AND trim(localEquipment4FromMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4FromMM)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment4FromDD) NEQ "" AND trim(localEquipment4FromDD) NEQ "@@" AND trim(localEquipment4FromDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4FromDD)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment4FromYY) NEQ "" AND trim(localEquipment4FromYY) NEQ "@@" AND trim(localEquipment4FromYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4FromYY)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment4ToMM) NEQ "" AND trim(localEquipment4ToMM) NEQ "@@" AND trim(localEquipment4ToMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4ToMM)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment4ToDD) NEQ "" AND trim(localEquipment4ToDD) NEQ "@@" AND trim(localEquipment4ToDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4ToDD)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment4ToYY) NEQ "" AND trim(localEquipment4ToYY) NEQ "@@" AND trim(localEquipment4ToYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4ToYY)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment4SupplierNameTBox) NEQ "" AND trim(localEquipment4SupplierNameTBox) NEQ "@@" AND trim(localEquipment4SupplierNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4SupplierNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment4SupplierTelephoneTBox) NEQ "" AND trim(localEquipment4SupplierTelephoneTBox) NEQ "@@" AND trim(localEquipment4SupplierTelephoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4SupplierTelephoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment5TypeTBox) NEQ "" AND trim(localEquipment5TypeTBox) NEQ "@@" AND trim(localEquipment5TypeTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5TypeTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment5RentPurchasedSelect) NEQ "" AND trim(localEquipment5RentPurchasedSelect) NEQ "@@" AND trim(localEquipment5RentPurchasedSelect) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5RentPurchasedSelect)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment5FromMM) NEQ "" AND trim(localEquipment5FromMM) NEQ "@@" AND trim(localEquipment5FromMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5FromMM)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment5FromDD) NEQ "" AND trim(localEquipment5FromDD) NEQ "@@" AND trim(localEquipment5FromDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5FromDD)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment5FromYY) NEQ "" AND trim(localEquipment5FromYY) NEQ "@@" AND trim(localEquipment5FromYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5FromYY)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment5ToMM) NEQ "" AND trim(localEquipment5ToMM) NEQ "@@" AND trim(localEquipment5ToMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5ToMM)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment5ToDD) NEQ "" AND trim(localEquipment5ToDD) NEQ "@@" AND trim(localEquipment5ToDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5ToDD)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment5ToYY) NEQ "" AND trim(localEquipment5ToYY) NEQ "@@" AND trim(localEquipment5ToYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5ToYY)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment5SupplierNameTBox) NEQ "" AND trim(localEquipment5SupplierNameTBox) NEQ "@@" AND trim(localEquipment5SupplierNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5SupplierNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment5SupplierTelephoneTBox) NEQ "" AND trim(localEquipment5SupplierTelephoneTBox) NEQ "@@" AND trim(localEquipment5SupplierTelephoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5SupplierTelephoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment1NoteTBox) NEQ "" AND trim(localEquipment1NoteTBox) NEQ "@@" AND trim(localEquipment1NoteTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1NoteTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment2NoteTBox) NEQ "" AND trim(localEquipment2NoteTBox) NEQ "@@" AND trim(localEquipment2NoteTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2NoteTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment3NoteTBox) NEQ "" AND trim(localEquipment3NoteTBox) NEQ "@@" AND trim(localEquipment3NoteTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3NoteTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment4NoteTBox) NEQ "" AND trim(localEquipment4NoteTBox) NEQ "@@" AND trim(localEquipment4NoteTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4NoteTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEquipment5NoteTBox) NEQ "" AND trim(localEquipment5NoteTBox) NEQ "@@" AND trim(localEquipment5NoteTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5NoteTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOPTION_14_CBox_OxygenPAo2) NEQ "" AND trim(localOPTION_14_CBox_OxygenPAo2) NEQ "@@" AND trim(localOPTION_14_CBox_OxygenPAo2) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_14_CBox_OxygenPAo2)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOPTION_14_CBox_OxygenSAo2) NEQ "" AND trim(localOPTION_14_CBox_OxygenSAo2) NEQ "@@" AND trim(localOPTION_14_CBox_OxygenSAo2) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_14_CBox_OxygenSAo2)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOPTION_14_CBox_OxygenSPo2) NEQ "" AND trim(localOPTION_14_CBox_OxygenSPo2) NEQ "@@" AND trim(localOPTION_14_CBox_OxygenSPo2) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_14_CBox_OxygenSPo2)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOxygenPAO2TBox) NEQ "" AND trim(localOxygenPAO2TBox) NEQ "@@" AND trim(localOxygenPAO2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localOxygenPAO2TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOxygenSAO2TBox) NEQ "" AND trim(localOxygenSAO2TBox) NEQ "@@" AND trim(localOxygenSAO2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localOxygenSAO2TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localCPAPStudy_CBox) NEQ "" AND trim(localCPAPStudy_CBox) NEQ "@@" AND trim(localCPAPStudy_CBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localCPAPStudy_CBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localCPAPStudyNote) NEQ "" AND trim(localCPAPStudyNote) NEQ "@@" AND trim(localCPAPStudyNote) NEQ "NULL">						
						<cfqueryparam value="#trim(localCPAPStudyNote)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOxygenSPO2TBox) NEQ "" AND trim(localOxygenSPO2TBox) NEQ "@@" AND trim(localOxygenSPO2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localOxygenSPO2TBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localCPAPStudyOnFile_CBox) NEQ "" AND trim(localCPAPStudyOnFile_CBox) NEQ "@@" AND trim(localCPAPStudyOnFile_CBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localCPAPStudyOnFile_CBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localCPAPStudyOnFileNote) NEQ "" AND trim(localCPAPStudyOnFileNote) NEQ "@@" AND trim(localCPAPStudyOnFileNote) NEQ "NULL">						
						<cfqueryparam value="#trim(localCPAPStudyOnFileNote)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLabTestDateMM) NEQ "" AND trim(localLabTestDateMM) NEQ "@@" AND trim(localLabTestDateMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabTestDateMM)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLabTestDateDD) NEQ "" AND trim(localLabTestDateDD) NEQ "@@" AND trim(localLabTestDateDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabTestDateDD)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLabTestDateYY) NEQ "" AND trim(localLabTestDateYY) NEQ "@@" AND trim(localLabTestDateYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabTestDateYY)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localCPAPStudyPerformedAt) NEQ "" AND trim(localCPAPStudyPerformedAt) NEQ "@@" AND trim(localCPAPStudyPerformedAt) NEQ "NULL">						
						<cfqueryparam value="#trim(localCPAPStudyPerformedAt)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLabTestFacilityTBox) NEQ "" AND trim(localLabTestFacilityTBox) NEQ "@@" AND trim(localLabTestFacilityTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabTestFacilityTBox)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localCPAPStudyPerformedAt2) NEQ "" AND trim(localCPAPStudyPerformedAt2) NEQ "@@" AND trim(localCPAPStudyPerformedAt2) NEQ "NULL">						
						<cfqueryparam value="#trim(localCPAPStudyPerformedAt2)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localCPAPStudyPerformedAt3) NEQ "" AND trim(localCPAPStudyPerformedAt3) NEQ "@@" AND trim(localCPAPStudyPerformedAt3) NEQ "NULL">						
						<cfqueryparam value="#trim(localCPAPStudyPerformedAt3)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localClosingInvoiceNumber) NEQ "" AND trim(localClosingInvoiceNumber) NEQ "@@" AND trim(localClosingInvoiceNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localClosingInvoiceNumber)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOPTION_SkilledNursing) NEQ "" AND trim(localOPTION_SkilledNursing) NEQ "@@" AND trim(localOPTION_SkilledNursing) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_SkilledNursing)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localSkilledNursingName) NEQ "" AND trim(localSkilledNursingName) NEQ "@@" AND trim(localSkilledNursingName) NEQ "NULL">						
						<cfqueryparam value="#trim(localSkilledNursingName)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localSkilledNursingTelephone) NEQ "" AND trim(localSkilledNursingTelephone) NEQ "@@" AND trim(localSkilledNursingTelephone) NEQ "NULL">						
						<cfqueryparam value="#trim(localSkilledNursingTelephone)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localPrinted) NEQ "" AND trim(localPrinted) NEQ "@@" AND trim(localPrinted) NEQ "NULL">						
						<cfqueryparam value="#trim(localPrinted)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS IntakeID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateIntake.IntakeID);
			arguments.obj.setIntakeID(qCreateIntake.IntakeID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="IntakeActive">
				
		<cfargument name="IntakeID" required="yes" type="numeric" />		
		<cfset var qGetIntake = "" />		
		
		<cfset qGetIntake = getIntake(trim(IntakeID)) />
				
		<cfif qGetIntake.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setIntakeID(qGetIntake.IntakeID);
			this.setClientID(qGetIntake.ClientID);
			this.setAssignedToUserID(qGetIntake.AssignedToUserID);
			this.sethidden_Step(qGetIntake.hidden_Step);
			this.sethidden_UsersID(qGetIntake.hidden_UsersID);
			this.sethidden_TimeStart(qGetIntake.hidden_TimeStart);
			this.setOPTION_1_CBox_Delivery(qGetIntake.OPTION_1_CBox_Delivery);
			this.setOPTION_1_CBox_Pickup(qGetIntake.OPTION_1_CBox_Pickup);
			this.setOPTION_1_CBox_Repair(qGetIntake.OPTION_1_CBox_Repair);
			this.setOPTION_1_CBox_Switch(qGetIntake.OPTION_1_CBox_Switch);
			this.setOPTION_1_CBox_Existing(qGetIntake.OPTION_1_CBox_Existing);
			this.setOPTION_2_CBox_Other(qGetIntake.OPTION_2_CBox_Other);
			this.setOPTION_2_CBox_Hospice(qGetIntake.OPTION_2_CBox_Hospice);
			this.setOPTION_2_CBox_Hospital(qGetIntake.OPTION_2_CBox_Hospital);
			this.setotherTBox(qGetIntake.otherTBox);
			this.sethospiceTBox(qGetIntake.hospiceTBox);
			this.setOPTION_3_CBox_Medicare(qGetIntake.OPTION_3_CBox_Medicare);
			this.setOPTION_3_CBox_PrivateInsurance(qGetIntake.OPTION_3_CBox_PrivateInsurance);
			this.setOPTION_3_CBox_Medicaid(qGetIntake.OPTION_3_CBox_Medicaid);
			this.setOPTION_3_CBox_PrivatePay(qGetIntake.OPTION_3_CBox_PrivatePay);
			this.sethospitalTBox(qGetIntake.hospitalTBox);
			this.setDischargeDateMM(qGetIntake.DischargeDateMM);
			this.setDischargeDateDD(qGetIntake.DischargeDateDD);
			this.setDischargeDateYY(qGetIntake.DischargeDateYY);
			this.settypeOfPay_Radio(qGetIntake.typeOfPay_Radio);
			this.setcallerFNameTBox(qGetIntake.callerFNameTBox);
			this.setcallerMInitialTBox(qGetIntake.callerMInitialTBox);
			this.setcallerLNameTBox(qGetIntake.callerLNameTBox);
			this.setcallerPhoneTBox(qGetIntake.callerPhoneTBox);
			this.setpatientXML(qGetIntake.patientXML);
			this.setpatientID(qGetIntake.patientID);
			this.setpatientAddressID(qGetIntake.patientAddressID);
			this.setpatientPhoneID(qGetIntake.patientPhoneID);
			this.setroomNumberTBox(qGetIntake.roomNumberTBox);
			this.setbedNumberTBox(qGetIntake.bedNumberTBox);
			this.setalternateContactFNameTBox(qGetIntake.alternateContactFNameTBox);
			this.setalternateContactMInitialTBox(qGetIntake.alternateContactMInitialTBox);
			this.setalternateContactLNameTBox(qGetIntake.alternateContactLNameTBox);
			this.setalternateContactRelationshipTBox(qGetIntake.alternateContactRelationshipTBox);
			this.setalternateContactPhoneTBox(qGetIntake.alternateContactPhoneTBox);
			this.setalternateContactWorkPhoneTBox(qGetIntake.alternateContactWorkPhoneTBox);
			this.setpoNumberTBox(qGetIntake.poNumberTBox);
			this.setcreditCardTypeTBox(qGetIntake.creditCardTypeTBox);
			this.setcreditCardNumberTBox(qGetIntake.creditCardNumberTBox);
			this.setccDateMM(qGetIntake.ccDateMM);
			this.setccDateDD(qGetIntake.ccDateDD);
			this.setccDateYY(qGetIntake.ccDateYY);
			this.setorderingPhysicianFNameTBox(qGetIntake.orderingPhysicianFNameTBox);
			this.setorderingPhysicianMInitialTBox(qGetIntake.orderingPhysicianMInitialTBox);
			this.setorderingPhysicianLNameTBox(qGetIntake.orderingPhysicianLNameTBox);
			this.setorderingPhysicianPhoneTBox(qGetIntake.orderingPhysicianPhoneTBox);
			this.setorderingPhysicianUPINTBox(qGetIntake.orderingPhysicianUPINTBox);
			this.setorderingPhysicianFaxTBox(qGetIntake.orderingPhysicianFaxTBox);
			this.setorderingPhysicianAddressTBox(qGetIntake.orderingPhysicianAddressTBox);
			this.setorderingPhysicianCityTBox(qGetIntake.orderingPhysicianCityTBox);
			this.setorderingPhysicianStateTBox(qGetIntake.orderingPhysicianStateTBox);
			this.setorderingPhysicianZipTBox(qGetIntake.orderingPhysicianZipTBox);
			this.setOPTION_13_CBox_PastEquipmentYes(qGetIntake.OPTION_13_CBox_PastEquipmentYes);
			this.setOPTION_13_CBox_PastEquipmentNo(qGetIntake.OPTION_13_CBox_PastEquipmentNo);
			this.setEquipment1TypeTBox(qGetIntake.Equipment1TypeTBox);
			this.setEquipment1RentPurchasedSelect(qGetIntake.Equipment1RentPurchasedSelect);
			this.setEquipment1FromMM(qGetIntake.Equipment1FromMM);
			this.setEquipment1FromDD(qGetIntake.Equipment1FromDD);
			this.setEquipment1FromYY(qGetIntake.Equipment1FromYY);
			this.setEquipment1ToMM(qGetIntake.Equipment1ToMM);
			this.setEquipment1ToDD(qGetIntake.Equipment1ToDD);
			this.setEquipment1ToYY(qGetIntake.Equipment1ToYY);
			this.setEquipment1SupplierNameTBox(qGetIntake.Equipment1SupplierNameTBox);
			this.setEquipment1SupplierTelephoneTBox(qGetIntake.Equipment1SupplierTelephoneTBox);
			this.setEquipment2TypeTBox(qGetIntake.Equipment2TypeTBox);
			this.setEquipment2RentPurchasedSelect(qGetIntake.Equipment2RentPurchasedSelect);
			this.setEquipment2FromMM(qGetIntake.Equipment2FromMM);
			this.setEquipment2FromDD(qGetIntake.Equipment2FromDD);
			this.setEquipment2FromYY(qGetIntake.Equipment2FromYY);
			this.setEquipment2ToMM(qGetIntake.Equipment2ToMM);
			this.setEquipment2ToDD(qGetIntake.Equipment2ToDD);
			this.setEquipment2ToYY(qGetIntake.Equipment2ToYY);
			this.setEquipment2SupplierNameTBox(qGetIntake.Equipment2SupplierNameTBox);
			this.setEquipment2SupplierTelephoneTBox(qGetIntake.Equipment2SupplierTelephoneTBox);
			this.setEquipment3TypeTBox(qGetIntake.Equipment3TypeTBox);
			this.setEquipment3RentPurchasedSelect(qGetIntake.Equipment3RentPurchasedSelect);
			this.setEquipment3FromMM(qGetIntake.Equipment3FromMM);
			this.setEquipment3FromDD(qGetIntake.Equipment3FromDD);
			this.setEquipment3FromYY(qGetIntake.Equipment3FromYY);
			this.setEquipment3ToMM(qGetIntake.Equipment3ToMM);
			this.setEquipment3ToDD(qGetIntake.Equipment3ToDD);
			this.setEquipment3ToYY(qGetIntake.Equipment3ToYY);
			this.setEquipment3SupplierNameTBox(qGetIntake.Equipment3SupplierNameTBox);
			this.setEquipment3SupplierTelephoneTBox(qGetIntake.Equipment3SupplierTelephoneTBox);
			this.setEquipment4TypeTBox(qGetIntake.Equipment4TypeTBox);
			this.setEquipment4RentPurchasedSelect(qGetIntake.Equipment4RentPurchasedSelect);
			this.setEquipment4FromMM(qGetIntake.Equipment4FromMM);
			this.setEquipment4FromDD(qGetIntake.Equipment4FromDD);
			this.setEquipment4FromYY(qGetIntake.Equipment4FromYY);
			this.setEquipment4ToMM(qGetIntake.Equipment4ToMM);
			this.setEquipment4ToDD(qGetIntake.Equipment4ToDD);
			this.setEquipment4ToYY(qGetIntake.Equipment4ToYY);
			this.setEquipment4SupplierNameTBox(qGetIntake.Equipment4SupplierNameTBox);
			this.setEquipment4SupplierTelephoneTBox(qGetIntake.Equipment4SupplierTelephoneTBox);
			this.setEquipment5TypeTBox(qGetIntake.Equipment5TypeTBox);
			this.setEquipment5RentPurchasedSelect(qGetIntake.Equipment5RentPurchasedSelect);
			this.setEquipment5FromMM(qGetIntake.Equipment5FromMM);
			this.setEquipment5FromDD(qGetIntake.Equipment5FromDD);
			this.setEquipment5FromYY(qGetIntake.Equipment5FromYY);
			this.setEquipment5ToMM(qGetIntake.Equipment5ToMM);
			this.setEquipment5ToDD(qGetIntake.Equipment5ToDD);
			this.setEquipment5ToYY(qGetIntake.Equipment5ToYY);
			this.setEquipment5SupplierNameTBox(qGetIntake.Equipment5SupplierNameTBox);
			this.setEquipment5SupplierTelephoneTBox(qGetIntake.Equipment5SupplierTelephoneTBox);
			this.setEquipment1NoteTBox(qGetIntake.Equipment1NoteTBox);
			this.setEquipment2NoteTBox(qGetIntake.Equipment2NoteTBox);
			this.setEquipment3NoteTBox(qGetIntake.Equipment3NoteTBox);
			this.setEquipment4NoteTBox(qGetIntake.Equipment4NoteTBox);
			this.setEquipment5NoteTBox(qGetIntake.Equipment5NoteTBox);
			this.setOPTION_14_CBox_OxygenPAo2(qGetIntake.OPTION_14_CBox_OxygenPAo2);
			this.setOPTION_14_CBox_OxygenSAo2(qGetIntake.OPTION_14_CBox_OxygenSAo2);
			this.setOPTION_14_CBox_OxygenSPo2(qGetIntake.OPTION_14_CBox_OxygenSPo2);
			this.setOxygenPAO2TBox(qGetIntake.OxygenPAO2TBox);
			this.setOxygenSAO2TBox(qGetIntake.OxygenSAO2TBox);
			this.setCPAPStudy_CBox(qGetIntake.CPAPStudy_CBox);
			this.setCPAPStudyNote(qGetIntake.CPAPStudyNote);
			this.setOxygenSPO2TBox(qGetIntake.OxygenSPO2TBox);
			this.setCPAPStudyOnFile_CBox(qGetIntake.CPAPStudyOnFile_CBox);
			this.setCPAPStudyOnFileNote(qGetIntake.CPAPStudyOnFileNote);
			this.setLabTestDateMM(qGetIntake.LabTestDateMM);
			this.setLabTestDateDD(qGetIntake.LabTestDateDD);
			this.setLabTestDateYY(qGetIntake.LabTestDateYY);
			this.setCPAPStudyPerformedAt(qGetIntake.CPAPStudyPerformedAt);
			this.setLabTestFacilityTBox(qGetIntake.LabTestFacilityTBox);
			this.setCPAPStudyPerformedAt2(qGetIntake.CPAPStudyPerformedAt2);
			this.setCPAPStudyPerformedAt3(qGetIntake.CPAPStudyPerformedAt3);
			this.setClosingInvoiceNumber(qGetIntake.ClosingInvoiceNumber);
			this.setOPTION_SkilledNursing(qGetIntake.OPTION_SkilledNursing);
			this.setSkilledNursingName(qGetIntake.SkilledNursingName);
			this.setSkilledNursingTelephone(qGetIntake.SkilledNursingTelephone);
			this.setPrinted(qGetIntake.Printed);
			this.setActive(qGetIntake.Active);
			this.setInactiveCode(qGetIntake.InactiveCode);
			this.setDateCreated(qGetIntake.DateCreated);
			this.setDateModified(qGetIntake.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="IntakeActive" />
		<cfset var qUpdateIntake = "" />
		<cfset var localClientID = arguments.obj.getClientID() />
		<cfset var localAssignedToUserID = arguments.obj.getAssignedToUserID() />
		<cfset var localhidden_Step = arguments.obj.gethidden_Step() />
		<cfset var localhidden_UsersID = arguments.obj.gethidden_UsersID() />
		<cfset var localhidden_TimeStart = arguments.obj.gethidden_TimeStart() />
		<cfset var localOPTION_1_CBox_Delivery = arguments.obj.getOPTION_1_CBox_Delivery() />
		<cfset var localOPTION_1_CBox_Pickup = arguments.obj.getOPTION_1_CBox_Pickup() />
		<cfset var localOPTION_1_CBox_Repair = arguments.obj.getOPTION_1_CBox_Repair() />
		<cfset var localOPTION_1_CBox_Switch = arguments.obj.getOPTION_1_CBox_Switch() />
		<cfset var localOPTION_1_CBox_Existing = arguments.obj.getOPTION_1_CBox_Existing() />
		<cfset var localOPTION_2_CBox_Other = arguments.obj.getOPTION_2_CBox_Other() />
		<cfset var localOPTION_2_CBox_Hospice = arguments.obj.getOPTION_2_CBox_Hospice() />
		<cfset var localOPTION_2_CBox_Hospital = arguments.obj.getOPTION_2_CBox_Hospital() />
		<cfset var localotherTBox = arguments.obj.getotherTBox() />
		<cfset var localhospiceTBox = arguments.obj.gethospiceTBox() />
		<cfset var localOPTION_3_CBox_Medicare = arguments.obj.getOPTION_3_CBox_Medicare() />
		<cfset var localOPTION_3_CBox_PrivateInsurance = arguments.obj.getOPTION_3_CBox_PrivateInsurance() />
		<cfset var localOPTION_3_CBox_Medicaid = arguments.obj.getOPTION_3_CBox_Medicaid() />
		<cfset var localOPTION_3_CBox_PrivatePay = arguments.obj.getOPTION_3_CBox_PrivatePay() />
		<cfset var localhospitalTBox = arguments.obj.gethospitalTBox() />
		<cfset var localDischargeDateMM = arguments.obj.getDischargeDateMM() />
		<cfset var localDischargeDateDD = arguments.obj.getDischargeDateDD() />
		<cfset var localDischargeDateYY = arguments.obj.getDischargeDateYY() />
		<cfset var localtypeOfPay_Radio = arguments.obj.gettypeOfPay_Radio() />
		<cfset var localcallerFNameTBox = arguments.obj.getcallerFNameTBox() />
		<cfset var localcallerMInitialTBox = arguments.obj.getcallerMInitialTBox() />
		<cfset var localcallerLNameTBox = arguments.obj.getcallerLNameTBox() />
		<cfset var localcallerPhoneTBox = arguments.obj.getcallerPhoneTBox() />
		<cfset var localpatientXML = arguments.obj.getpatientXML() />
		<cfset var localpatientID = arguments.obj.getpatientID() />
		<cfset var localpatientAddressID = arguments.obj.getpatientAddressID() />
		<cfset var localpatientPhoneID = arguments.obj.getpatientPhoneID() />
		<cfset var localroomNumberTBox = arguments.obj.getroomNumberTBox() />
		<cfset var localbedNumberTBox = arguments.obj.getbedNumberTBox() />
		<cfset var localalternateContactFNameTBox = arguments.obj.getalternateContactFNameTBox() />
		<cfset var localalternateContactMInitialTBox = arguments.obj.getalternateContactMInitialTBox() />
		<cfset var localalternateContactLNameTBox = arguments.obj.getalternateContactLNameTBox() />
		<cfset var localalternateContactRelationshipTBox = arguments.obj.getalternateContactRelationshipTBox() />
		<cfset var localalternateContactPhoneTBox = arguments.obj.getalternateContactPhoneTBox() />
		<cfset var localalternateContactWorkPhoneTBox = arguments.obj.getalternateContactWorkPhoneTBox() />
		<cfset var localpoNumberTBox = arguments.obj.getpoNumberTBox() />
		<cfset var localcreditCardTypeTBox = arguments.obj.getcreditCardTypeTBox() />
		<cfset var localcreditCardNumberTBox = arguments.obj.getcreditCardNumberTBox() />
		<cfset var localccDateMM = arguments.obj.getccDateMM() />
		<cfset var localccDateDD = arguments.obj.getccDateDD() />
		<cfset var localccDateYY = arguments.obj.getccDateYY() />
		<cfset var localorderingPhysicianFNameTBox = arguments.obj.getorderingPhysicianFNameTBox() />
		<cfset var localorderingPhysicianMInitialTBox = arguments.obj.getorderingPhysicianMInitialTBox() />
		<cfset var localorderingPhysicianLNameTBox = arguments.obj.getorderingPhysicianLNameTBox() />
		<cfset var localorderingPhysicianPhoneTBox = arguments.obj.getorderingPhysicianPhoneTBox() />
		<cfset var localorderingPhysicianUPINTBox = arguments.obj.getorderingPhysicianUPINTBox() />
		<cfset var localorderingPhysicianFaxTBox = arguments.obj.getorderingPhysicianFaxTBox() />
		<cfset var localorderingPhysicianAddressTBox = arguments.obj.getorderingPhysicianAddressTBox() />
		<cfset var localorderingPhysicianCityTBox = arguments.obj.getorderingPhysicianCityTBox() />
		<cfset var localorderingPhysicianStateTBox = arguments.obj.getorderingPhysicianStateTBox() />
		<cfset var localorderingPhysicianZipTBox = arguments.obj.getorderingPhysicianZipTBox() />
		<cfset var localOPTION_13_CBox_PastEquipmentYes = arguments.obj.getOPTION_13_CBox_PastEquipmentYes() />
		<cfset var localOPTION_13_CBox_PastEquipmentNo = arguments.obj.getOPTION_13_CBox_PastEquipmentNo() />
		<cfset var localEquipment1TypeTBox = arguments.obj.getEquipment1TypeTBox() />
		<cfset var localEquipment1RentPurchasedSelect = arguments.obj.getEquipment1RentPurchasedSelect() />
		<cfset var localEquipment1FromMM = arguments.obj.getEquipment1FromMM() />
		<cfset var localEquipment1FromDD = arguments.obj.getEquipment1FromDD() />
		<cfset var localEquipment1FromYY = arguments.obj.getEquipment1FromYY() />
		<cfset var localEquipment1ToMM = arguments.obj.getEquipment1ToMM() />
		<cfset var localEquipment1ToDD = arguments.obj.getEquipment1ToDD() />
		<cfset var localEquipment1ToYY = arguments.obj.getEquipment1ToYY() />
		<cfset var localEquipment1SupplierNameTBox = arguments.obj.getEquipment1SupplierNameTBox() />
		<cfset var localEquipment1SupplierTelephoneTBox = arguments.obj.getEquipment1SupplierTelephoneTBox() />
		<cfset var localEquipment2TypeTBox = arguments.obj.getEquipment2TypeTBox() />
		<cfset var localEquipment2RentPurchasedSelect = arguments.obj.getEquipment2RentPurchasedSelect() />
		<cfset var localEquipment2FromMM = arguments.obj.getEquipment2FromMM() />
		<cfset var localEquipment2FromDD = arguments.obj.getEquipment2FromDD() />
		<cfset var localEquipment2FromYY = arguments.obj.getEquipment2FromYY() />
		<cfset var localEquipment2ToMM = arguments.obj.getEquipment2ToMM() />
		<cfset var localEquipment2ToDD = arguments.obj.getEquipment2ToDD() />
		<cfset var localEquipment2ToYY = arguments.obj.getEquipment2ToYY() />
		<cfset var localEquipment2SupplierNameTBox = arguments.obj.getEquipment2SupplierNameTBox() />
		<cfset var localEquipment2SupplierTelephoneTBox = arguments.obj.getEquipment2SupplierTelephoneTBox() />
		<cfset var localEquipment3TypeTBox = arguments.obj.getEquipment3TypeTBox() />
		<cfset var localEquipment3RentPurchasedSelect = arguments.obj.getEquipment3RentPurchasedSelect() />
		<cfset var localEquipment3FromMM = arguments.obj.getEquipment3FromMM() />
		<cfset var localEquipment3FromDD = arguments.obj.getEquipment3FromDD() />
		<cfset var localEquipment3FromYY = arguments.obj.getEquipment3FromYY() />
		<cfset var localEquipment3ToMM = arguments.obj.getEquipment3ToMM() />
		<cfset var localEquipment3ToDD = arguments.obj.getEquipment3ToDD() />
		<cfset var localEquipment3ToYY = arguments.obj.getEquipment3ToYY() />
		<cfset var localEquipment3SupplierNameTBox = arguments.obj.getEquipment3SupplierNameTBox() />
		<cfset var localEquipment3SupplierTelephoneTBox = arguments.obj.getEquipment3SupplierTelephoneTBox() />
		<cfset var localEquipment4TypeTBox = arguments.obj.getEquipment4TypeTBox() />
		<cfset var localEquipment4RentPurchasedSelect = arguments.obj.getEquipment4RentPurchasedSelect() />
		<cfset var localEquipment4FromMM = arguments.obj.getEquipment4FromMM() />
		<cfset var localEquipment4FromDD = arguments.obj.getEquipment4FromDD() />
		<cfset var localEquipment4FromYY = arguments.obj.getEquipment4FromYY() />
		<cfset var localEquipment4ToMM = arguments.obj.getEquipment4ToMM() />
		<cfset var localEquipment4ToDD = arguments.obj.getEquipment4ToDD() />
		<cfset var localEquipment4ToYY = arguments.obj.getEquipment4ToYY() />
		<cfset var localEquipment4SupplierNameTBox = arguments.obj.getEquipment4SupplierNameTBox() />
		<cfset var localEquipment4SupplierTelephoneTBox = arguments.obj.getEquipment4SupplierTelephoneTBox() />
		<cfset var localEquipment5TypeTBox = arguments.obj.getEquipment5TypeTBox() />
		<cfset var localEquipment5RentPurchasedSelect = arguments.obj.getEquipment5RentPurchasedSelect() />
		<cfset var localEquipment5FromMM = arguments.obj.getEquipment5FromMM() />
		<cfset var localEquipment5FromDD = arguments.obj.getEquipment5FromDD() />
		<cfset var localEquipment5FromYY = arguments.obj.getEquipment5FromYY() />
		<cfset var localEquipment5ToMM = arguments.obj.getEquipment5ToMM() />
		<cfset var localEquipment5ToDD = arguments.obj.getEquipment5ToDD() />
		<cfset var localEquipment5ToYY = arguments.obj.getEquipment5ToYY() />
		<cfset var localEquipment5SupplierNameTBox = arguments.obj.getEquipment5SupplierNameTBox() />
		<cfset var localEquipment5SupplierTelephoneTBox = arguments.obj.getEquipment5SupplierTelephoneTBox() />
		<cfset var localEquipment1NoteTBox = arguments.obj.getEquipment1NoteTBox() />
		<cfset var localEquipment2NoteTBox = arguments.obj.getEquipment2NoteTBox() />
		<cfset var localEquipment3NoteTBox = arguments.obj.getEquipment3NoteTBox() />
		<cfset var localEquipment4NoteTBox = arguments.obj.getEquipment4NoteTBox() />
		<cfset var localEquipment5NoteTBox = arguments.obj.getEquipment5NoteTBox() />
		<cfset var localOPTION_14_CBox_OxygenPAo2 = arguments.obj.getOPTION_14_CBox_OxygenPAo2() />
		<cfset var localOPTION_14_CBox_OxygenSAo2 = arguments.obj.getOPTION_14_CBox_OxygenSAo2() />
		<cfset var localOPTION_14_CBox_OxygenSPo2 = arguments.obj.getOPTION_14_CBox_OxygenSPo2() />
		<cfset var localOxygenPAO2TBox = arguments.obj.getOxygenPAO2TBox() />
		<cfset var localOxygenSAO2TBox = arguments.obj.getOxygenSAO2TBox() />
		<cfset var localCPAPStudy_CBox = arguments.obj.getCPAPStudy_CBox() />
		<cfset var localCPAPStudyNote = arguments.obj.getCPAPStudyNote() />
		<cfset var localOxygenSPO2TBox = arguments.obj.getOxygenSPO2TBox() />
		<cfset var localCPAPStudyOnFile_CBox = arguments.obj.getCPAPStudyOnFile_CBox() />
		<cfset var localCPAPStudyOnFileNote = arguments.obj.getCPAPStudyOnFileNote() />
		<cfset var localLabTestDateMM = arguments.obj.getLabTestDateMM() />
		<cfset var localLabTestDateDD = arguments.obj.getLabTestDateDD() />
		<cfset var localLabTestDateYY = arguments.obj.getLabTestDateYY() />
		<cfset var localCPAPStudyPerformedAt = arguments.obj.getCPAPStudyPerformedAt() />
		<cfset var localLabTestFacilityTBox = arguments.obj.getLabTestFacilityTBox() />
		<cfset var localCPAPStudyPerformedAt2 = arguments.obj.getCPAPStudyPerformedAt2() />
		<cfset var localCPAPStudyPerformedAt3 = arguments.obj.getCPAPStudyPerformedAt3() />
		<cfset var localClosingInvoiceNumber = arguments.obj.getClosingInvoiceNumber() />
		<cfset var localOPTION_SkilledNursing = arguments.obj.getOPTION_SkilledNursing() />
		<cfset var localSkilledNursingName = arguments.obj.getSkilledNursingName() />
		<cfset var localSkilledNursingTelephone = arguments.obj.getSkilledNursingTelephone() />
		<cfset var localPrinted = arguments.obj.getPrinted() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateIntake" datasource="#trim(variables.ds)#">
				UPDATE Intake  SET
					
					ClientID =						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					AssignedToUserID =				
					<cfif IsNumeric(trim(localAssignedToUserID))>						
						<cfqueryparam value="#trim(localAssignedToUserID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					hidden_Step =	
					<cfif trim(localhidden_Step) NEQ "" AND trim(localhidden_Step) NEQ "@@" AND trim(localhidden_Step) NEQ "NULL">						
						<cfqueryparam value="#trim(localhidden_Step)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hidden_UsersID =	
					<cfif trim(localhidden_UsersID) NEQ "" AND trim(localhidden_UsersID) NEQ "@@" AND trim(localhidden_UsersID) NEQ "NULL">						
						<cfqueryparam value="#trim(localhidden_UsersID)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hidden_TimeStart =	
					<cfif trim(localhidden_TimeStart) NEQ "" AND trim(localhidden_TimeStart) NEQ "@@" AND trim(localhidden_TimeStart) NEQ "NULL">						
						<cfqueryparam value="#trim(localhidden_TimeStart)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OPTION_1_CBox_Delivery =	
					<cfif trim(localOPTION_1_CBox_Delivery) NEQ "" AND trim(localOPTION_1_CBox_Delivery) NEQ "@@" AND trim(localOPTION_1_CBox_Delivery) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_1_CBox_Delivery)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OPTION_1_CBox_Pickup =	
					<cfif trim(localOPTION_1_CBox_Pickup) NEQ "" AND trim(localOPTION_1_CBox_Pickup) NEQ "@@" AND trim(localOPTION_1_CBox_Pickup) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_1_CBox_Pickup)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OPTION_1_CBox_Repair =	
					<cfif trim(localOPTION_1_CBox_Repair) NEQ "" AND trim(localOPTION_1_CBox_Repair) NEQ "@@" AND trim(localOPTION_1_CBox_Repair) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_1_CBox_Repair)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OPTION_1_CBox_Switch =	
					<cfif trim(localOPTION_1_CBox_Switch) NEQ "" AND trim(localOPTION_1_CBox_Switch) NEQ "@@" AND trim(localOPTION_1_CBox_Switch) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_1_CBox_Switch)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OPTION_1_CBox_Existing =	
					<cfif trim(localOPTION_1_CBox_Existing) NEQ "" AND trim(localOPTION_1_CBox_Existing) NEQ "@@" AND trim(localOPTION_1_CBox_Existing) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_1_CBox_Existing)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OPTION_2_CBox_Other =	
					<cfif trim(localOPTION_2_CBox_Other) NEQ "" AND trim(localOPTION_2_CBox_Other) NEQ "@@" AND trim(localOPTION_2_CBox_Other) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_2_CBox_Other)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OPTION_2_CBox_Hospice =	
					<cfif trim(localOPTION_2_CBox_Hospice) NEQ "" AND trim(localOPTION_2_CBox_Hospice) NEQ "@@" AND trim(localOPTION_2_CBox_Hospice) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_2_CBox_Hospice)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OPTION_2_CBox_Hospital =	
					<cfif trim(localOPTION_2_CBox_Hospital) NEQ "" AND trim(localOPTION_2_CBox_Hospital) NEQ "@@" AND trim(localOPTION_2_CBox_Hospital) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_2_CBox_Hospital)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					otherTBox =	
					<cfif trim(localotherTBox) NEQ "" AND trim(localotherTBox) NEQ "@@" AND trim(localotherTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localotherTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hospiceTBox =	
					<cfif trim(localhospiceTBox) NEQ "" AND trim(localhospiceTBox) NEQ "@@" AND trim(localhospiceTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhospiceTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OPTION_3_CBox_Medicare =	
					<cfif trim(localOPTION_3_CBox_Medicare) NEQ "" AND trim(localOPTION_3_CBox_Medicare) NEQ "@@" AND trim(localOPTION_3_CBox_Medicare) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_3_CBox_Medicare)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OPTION_3_CBox_PrivateInsurance =	
					<cfif trim(localOPTION_3_CBox_PrivateInsurance) NEQ "" AND trim(localOPTION_3_CBox_PrivateInsurance) NEQ "@@" AND trim(localOPTION_3_CBox_PrivateInsurance) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_3_CBox_PrivateInsurance)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OPTION_3_CBox_Medicaid =	
					<cfif trim(localOPTION_3_CBox_Medicaid) NEQ "" AND trim(localOPTION_3_CBox_Medicaid) NEQ "@@" AND trim(localOPTION_3_CBox_Medicaid) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_3_CBox_Medicaid)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OPTION_3_CBox_PrivatePay =	
					<cfif trim(localOPTION_3_CBox_PrivatePay) NEQ "" AND trim(localOPTION_3_CBox_PrivatePay) NEQ "@@" AND trim(localOPTION_3_CBox_PrivatePay) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_3_CBox_PrivatePay)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					hospitalTBox =	
					<cfif trim(localhospitalTBox) NEQ "" AND trim(localhospitalTBox) NEQ "@@" AND trim(localhospitalTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localhospitalTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					DischargeDateMM =	
					<cfif trim(localDischargeDateMM) NEQ "" AND trim(localDischargeDateMM) NEQ "@@" AND trim(localDischargeDateMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localDischargeDateMM)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					DischargeDateDD =	
					<cfif trim(localDischargeDateDD) NEQ "" AND trim(localDischargeDateDD) NEQ "@@" AND trim(localDischargeDateDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localDischargeDateDD)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					DischargeDateYY =	
					<cfif trim(localDischargeDateYY) NEQ "" AND trim(localDischargeDateYY) NEQ "@@" AND trim(localDischargeDateYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localDischargeDateYY)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					typeOfPay_Radio =	
					<cfif trim(localtypeOfPay_Radio) NEQ "" AND trim(localtypeOfPay_Radio) NEQ "@@" AND trim(localtypeOfPay_Radio) NEQ "NULL">						
						<cfqueryparam value="#trim(localtypeOfPay_Radio)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					callerFNameTBox =	
					<cfif trim(localcallerFNameTBox) NEQ "" AND trim(localcallerFNameTBox) NEQ "@@" AND trim(localcallerFNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localcallerFNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					callerMInitialTBox =	
					<cfif trim(localcallerMInitialTBox) NEQ "" AND trim(localcallerMInitialTBox) NEQ "@@" AND trim(localcallerMInitialTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localcallerMInitialTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					callerLNameTBox =	
					<cfif trim(localcallerLNameTBox) NEQ "" AND trim(localcallerLNameTBox) NEQ "@@" AND trim(localcallerLNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localcallerLNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					callerPhoneTBox =	
					<cfif trim(localcallerPhoneTBox) NEQ "" AND trim(localcallerPhoneTBox) NEQ "@@" AND trim(localcallerPhoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localcallerPhoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					patientXML =	
					<cfif trim(localpatientXML) NEQ "" AND trim(localpatientXML) NEQ "@@" AND trim(localpatientXML) NEQ "NULL">						
						<cfqueryparam value="#trim(localpatientXML)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					patientID =				
					<cfif IsNumeric(trim(localpatientID))>						
						<cfqueryparam value="#trim(localpatientID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					patientAddressID =				
					<cfif IsNumeric(trim(localpatientAddressID))>						
						<cfqueryparam value="#trim(localpatientAddressID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					patientPhoneID =				
					<cfif IsNumeric(trim(localpatientPhoneID))>						
						<cfqueryparam value="#trim(localpatientPhoneID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					roomNumberTBox =	
					<cfif trim(localroomNumberTBox) NEQ "" AND trim(localroomNumberTBox) NEQ "@@" AND trim(localroomNumberTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localroomNumberTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					bedNumberTBox =	
					<cfif trim(localbedNumberTBox) NEQ "" AND trim(localbedNumberTBox) NEQ "@@" AND trim(localbedNumberTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localbedNumberTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					alternateContactFNameTBox =	
					<cfif trim(localalternateContactFNameTBox) NEQ "" AND trim(localalternateContactFNameTBox) NEQ "@@" AND trim(localalternateContactFNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactFNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					alternateContactMInitialTBox =	
					<cfif trim(localalternateContactMInitialTBox) NEQ "" AND trim(localalternateContactMInitialTBox) NEQ "@@" AND trim(localalternateContactMInitialTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactMInitialTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					alternateContactLNameTBox =	
					<cfif trim(localalternateContactLNameTBox) NEQ "" AND trim(localalternateContactLNameTBox) NEQ "@@" AND trim(localalternateContactLNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactLNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					alternateContactRelationshipTBox =	
					<cfif trim(localalternateContactRelationshipTBox) NEQ "" AND trim(localalternateContactRelationshipTBox) NEQ "@@" AND trim(localalternateContactRelationshipTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactRelationshipTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					alternateContactPhoneTBox =	
					<cfif trim(localalternateContactPhoneTBox) NEQ "" AND trim(localalternateContactPhoneTBox) NEQ "@@" AND trim(localalternateContactPhoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactPhoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					alternateContactWorkPhoneTBox =	
					<cfif trim(localalternateContactWorkPhoneTBox) NEQ "" AND trim(localalternateContactWorkPhoneTBox) NEQ "@@" AND trim(localalternateContactWorkPhoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localalternateContactWorkPhoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					poNumberTBox =	
					<cfif trim(localpoNumberTBox) NEQ "" AND trim(localpoNumberTBox) NEQ "@@" AND trim(localpoNumberTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localpoNumberTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					creditCardTypeTBox =	
					<cfif trim(localcreditCardTypeTBox) NEQ "" AND trim(localcreditCardTypeTBox) NEQ "@@" AND trim(localcreditCardTypeTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localcreditCardTypeTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					creditCardNumberTBox =	
					<cfif trim(localcreditCardNumberTBox) NEQ "" AND trim(localcreditCardNumberTBox) NEQ "@@" AND trim(localcreditCardNumberTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localcreditCardNumberTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ccDateMM =	
					<cfif trim(localccDateMM) NEQ "" AND trim(localccDateMM) NEQ "@@" AND trim(localccDateMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localccDateMM)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ccDateDD =	
					<cfif trim(localccDateDD) NEQ "" AND trim(localccDateDD) NEQ "@@" AND trim(localccDateDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localccDateDD)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ccDateYY =	
					<cfif trim(localccDateYY) NEQ "" AND trim(localccDateYY) NEQ "@@" AND trim(localccDateYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localccDateYY)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					orderingPhysicianFNameTBox =	
					<cfif trim(localorderingPhysicianFNameTBox) NEQ "" AND trim(localorderingPhysicianFNameTBox) NEQ "@@" AND trim(localorderingPhysicianFNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianFNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					orderingPhysicianMInitialTBox =	
					<cfif trim(localorderingPhysicianMInitialTBox) NEQ "" AND trim(localorderingPhysicianMInitialTBox) NEQ "@@" AND trim(localorderingPhysicianMInitialTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianMInitialTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					orderingPhysicianLNameTBox =	
					<cfif trim(localorderingPhysicianLNameTBox) NEQ "" AND trim(localorderingPhysicianLNameTBox) NEQ "@@" AND trim(localorderingPhysicianLNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianLNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					orderingPhysicianPhoneTBox =	
					<cfif trim(localorderingPhysicianPhoneTBox) NEQ "" AND trim(localorderingPhysicianPhoneTBox) NEQ "@@" AND trim(localorderingPhysicianPhoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianPhoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					orderingPhysicianUPINTBox =	
					<cfif trim(localorderingPhysicianUPINTBox) NEQ "" AND trim(localorderingPhysicianUPINTBox) NEQ "@@" AND trim(localorderingPhysicianUPINTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianUPINTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					orderingPhysicianFaxTBox =	
					<cfif trim(localorderingPhysicianFaxTBox) NEQ "" AND trim(localorderingPhysicianFaxTBox) NEQ "@@" AND trim(localorderingPhysicianFaxTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianFaxTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					orderingPhysicianAddressTBox =	
					<cfif trim(localorderingPhysicianAddressTBox) NEQ "" AND trim(localorderingPhysicianAddressTBox) NEQ "@@" AND trim(localorderingPhysicianAddressTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianAddressTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					orderingPhysicianCityTBox =	
					<cfif trim(localorderingPhysicianCityTBox) NEQ "" AND trim(localorderingPhysicianCityTBox) NEQ "@@" AND trim(localorderingPhysicianCityTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianCityTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					orderingPhysicianStateTBox =	
					<cfif trim(localorderingPhysicianStateTBox) NEQ "" AND trim(localorderingPhysicianStateTBox) NEQ "@@" AND trim(localorderingPhysicianStateTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianStateTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					orderingPhysicianZipTBox =	
					<cfif trim(localorderingPhysicianZipTBox) NEQ "" AND trim(localorderingPhysicianZipTBox) NEQ "@@" AND trim(localorderingPhysicianZipTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localorderingPhysicianZipTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OPTION_13_CBox_PastEquipmentYes =	
					<cfif trim(localOPTION_13_CBox_PastEquipmentYes) NEQ "" AND trim(localOPTION_13_CBox_PastEquipmentYes) NEQ "@@" AND trim(localOPTION_13_CBox_PastEquipmentYes) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_13_CBox_PastEquipmentYes)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OPTION_13_CBox_PastEquipmentNo =	
					<cfif trim(localOPTION_13_CBox_PastEquipmentNo) NEQ "" AND trim(localOPTION_13_CBox_PastEquipmentNo) NEQ "@@" AND trim(localOPTION_13_CBox_PastEquipmentNo) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_13_CBox_PastEquipmentNo)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment1TypeTBox =	
					<cfif trim(localEquipment1TypeTBox) NEQ "" AND trim(localEquipment1TypeTBox) NEQ "@@" AND trim(localEquipment1TypeTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1TypeTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment1RentPurchasedSelect =	
					<cfif trim(localEquipment1RentPurchasedSelect) NEQ "" AND trim(localEquipment1RentPurchasedSelect) NEQ "@@" AND trim(localEquipment1RentPurchasedSelect) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1RentPurchasedSelect)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment1FromMM =	
					<cfif trim(localEquipment1FromMM) NEQ "" AND trim(localEquipment1FromMM) NEQ "@@" AND trim(localEquipment1FromMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1FromMM)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment1FromDD =	
					<cfif trim(localEquipment1FromDD) NEQ "" AND trim(localEquipment1FromDD) NEQ "@@" AND trim(localEquipment1FromDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1FromDD)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment1FromYY =	
					<cfif trim(localEquipment1FromYY) NEQ "" AND trim(localEquipment1FromYY) NEQ "@@" AND trim(localEquipment1FromYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1FromYY)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment1ToMM =	
					<cfif trim(localEquipment1ToMM) NEQ "" AND trim(localEquipment1ToMM) NEQ "@@" AND trim(localEquipment1ToMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1ToMM)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment1ToDD =	
					<cfif trim(localEquipment1ToDD) NEQ "" AND trim(localEquipment1ToDD) NEQ "@@" AND trim(localEquipment1ToDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1ToDD)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment1ToYY =	
					<cfif trim(localEquipment1ToYY) NEQ "" AND trim(localEquipment1ToYY) NEQ "@@" AND trim(localEquipment1ToYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1ToYY)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment1SupplierNameTBox =	
					<cfif trim(localEquipment1SupplierNameTBox) NEQ "" AND trim(localEquipment1SupplierNameTBox) NEQ "@@" AND trim(localEquipment1SupplierNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1SupplierNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment1SupplierTelephoneTBox =	
					<cfif trim(localEquipment1SupplierTelephoneTBox) NEQ "" AND trim(localEquipment1SupplierTelephoneTBox) NEQ "@@" AND trim(localEquipment1SupplierTelephoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1SupplierTelephoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment2TypeTBox =	
					<cfif trim(localEquipment2TypeTBox) NEQ "" AND trim(localEquipment2TypeTBox) NEQ "@@" AND trim(localEquipment2TypeTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2TypeTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment2RentPurchasedSelect =	
					<cfif trim(localEquipment2RentPurchasedSelect) NEQ "" AND trim(localEquipment2RentPurchasedSelect) NEQ "@@" AND trim(localEquipment2RentPurchasedSelect) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2RentPurchasedSelect)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment2FromMM =	
					<cfif trim(localEquipment2FromMM) NEQ "" AND trim(localEquipment2FromMM) NEQ "@@" AND trim(localEquipment2FromMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2FromMM)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment2FromDD =	
					<cfif trim(localEquipment2FromDD) NEQ "" AND trim(localEquipment2FromDD) NEQ "@@" AND trim(localEquipment2FromDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2FromDD)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment2FromYY =	
					<cfif trim(localEquipment2FromYY) NEQ "" AND trim(localEquipment2FromYY) NEQ "@@" AND trim(localEquipment2FromYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2FromYY)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment2ToMM =	
					<cfif trim(localEquipment2ToMM) NEQ "" AND trim(localEquipment2ToMM) NEQ "@@" AND trim(localEquipment2ToMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2ToMM)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment2ToDD =	
					<cfif trim(localEquipment2ToDD) NEQ "" AND trim(localEquipment2ToDD) NEQ "@@" AND trim(localEquipment2ToDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2ToDD)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment2ToYY =	
					<cfif trim(localEquipment2ToYY) NEQ "" AND trim(localEquipment2ToYY) NEQ "@@" AND trim(localEquipment2ToYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2ToYY)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment2SupplierNameTBox =	
					<cfif trim(localEquipment2SupplierNameTBox) NEQ "" AND trim(localEquipment2SupplierNameTBox) NEQ "@@" AND trim(localEquipment2SupplierNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2SupplierNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment2SupplierTelephoneTBox =	
					<cfif trim(localEquipment2SupplierTelephoneTBox) NEQ "" AND trim(localEquipment2SupplierTelephoneTBox) NEQ "@@" AND trim(localEquipment2SupplierTelephoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2SupplierTelephoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment3TypeTBox =	
					<cfif trim(localEquipment3TypeTBox) NEQ "" AND trim(localEquipment3TypeTBox) NEQ "@@" AND trim(localEquipment3TypeTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3TypeTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment3RentPurchasedSelect =	
					<cfif trim(localEquipment3RentPurchasedSelect) NEQ "" AND trim(localEquipment3RentPurchasedSelect) NEQ "@@" AND trim(localEquipment3RentPurchasedSelect) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3RentPurchasedSelect)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment3FromMM =	
					<cfif trim(localEquipment3FromMM) NEQ "" AND trim(localEquipment3FromMM) NEQ "@@" AND trim(localEquipment3FromMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3FromMM)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment3FromDD =	
					<cfif trim(localEquipment3FromDD) NEQ "" AND trim(localEquipment3FromDD) NEQ "@@" AND trim(localEquipment3FromDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3FromDD)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment3FromYY =	
					<cfif trim(localEquipment3FromYY) NEQ "" AND trim(localEquipment3FromYY) NEQ "@@" AND trim(localEquipment3FromYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3FromYY)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment3ToMM =	
					<cfif trim(localEquipment3ToMM) NEQ "" AND trim(localEquipment3ToMM) NEQ "@@" AND trim(localEquipment3ToMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3ToMM)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment3ToDD =	
					<cfif trim(localEquipment3ToDD) NEQ "" AND trim(localEquipment3ToDD) NEQ "@@" AND trim(localEquipment3ToDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3ToDD)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment3ToYY =	
					<cfif trim(localEquipment3ToYY) NEQ "" AND trim(localEquipment3ToYY) NEQ "@@" AND trim(localEquipment3ToYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3ToYY)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment3SupplierNameTBox =	
					<cfif trim(localEquipment3SupplierNameTBox) NEQ "" AND trim(localEquipment3SupplierNameTBox) NEQ "@@" AND trim(localEquipment3SupplierNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3SupplierNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment3SupplierTelephoneTBox =	
					<cfif trim(localEquipment3SupplierTelephoneTBox) NEQ "" AND trim(localEquipment3SupplierTelephoneTBox) NEQ "@@" AND trim(localEquipment3SupplierTelephoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3SupplierTelephoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment4TypeTBox =	
					<cfif trim(localEquipment4TypeTBox) NEQ "" AND trim(localEquipment4TypeTBox) NEQ "@@" AND trim(localEquipment4TypeTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4TypeTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment4RentPurchasedSelect =	
					<cfif trim(localEquipment4RentPurchasedSelect) NEQ "" AND trim(localEquipment4RentPurchasedSelect) NEQ "@@" AND trim(localEquipment4RentPurchasedSelect) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4RentPurchasedSelect)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment4FromMM =	
					<cfif trim(localEquipment4FromMM) NEQ "" AND trim(localEquipment4FromMM) NEQ "@@" AND trim(localEquipment4FromMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4FromMM)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment4FromDD =	
					<cfif trim(localEquipment4FromDD) NEQ "" AND trim(localEquipment4FromDD) NEQ "@@" AND trim(localEquipment4FromDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4FromDD)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment4FromYY =	
					<cfif trim(localEquipment4FromYY) NEQ "" AND trim(localEquipment4FromYY) NEQ "@@" AND trim(localEquipment4FromYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4FromYY)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment4ToMM =	
					<cfif trim(localEquipment4ToMM) NEQ "" AND trim(localEquipment4ToMM) NEQ "@@" AND trim(localEquipment4ToMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4ToMM)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment4ToDD =	
					<cfif trim(localEquipment4ToDD) NEQ "" AND trim(localEquipment4ToDD) NEQ "@@" AND trim(localEquipment4ToDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4ToDD)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment4ToYY =	
					<cfif trim(localEquipment4ToYY) NEQ "" AND trim(localEquipment4ToYY) NEQ "@@" AND trim(localEquipment4ToYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4ToYY)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment4SupplierNameTBox =	
					<cfif trim(localEquipment4SupplierNameTBox) NEQ "" AND trim(localEquipment4SupplierNameTBox) NEQ "@@" AND trim(localEquipment4SupplierNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4SupplierNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment4SupplierTelephoneTBox =	
					<cfif trim(localEquipment4SupplierTelephoneTBox) NEQ "" AND trim(localEquipment4SupplierTelephoneTBox) NEQ "@@" AND trim(localEquipment4SupplierTelephoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4SupplierTelephoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment5TypeTBox =	
					<cfif trim(localEquipment5TypeTBox) NEQ "" AND trim(localEquipment5TypeTBox) NEQ "@@" AND trim(localEquipment5TypeTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5TypeTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment5RentPurchasedSelect =	
					<cfif trim(localEquipment5RentPurchasedSelect) NEQ "" AND trim(localEquipment5RentPurchasedSelect) NEQ "@@" AND trim(localEquipment5RentPurchasedSelect) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5RentPurchasedSelect)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment5FromMM =	
					<cfif trim(localEquipment5FromMM) NEQ "" AND trim(localEquipment5FromMM) NEQ "@@" AND trim(localEquipment5FromMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5FromMM)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment5FromDD =	
					<cfif trim(localEquipment5FromDD) NEQ "" AND trim(localEquipment5FromDD) NEQ "@@" AND trim(localEquipment5FromDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5FromDD)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment5FromYY =	
					<cfif trim(localEquipment5FromYY) NEQ "" AND trim(localEquipment5FromYY) NEQ "@@" AND trim(localEquipment5FromYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5FromYY)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment5ToMM =	
					<cfif trim(localEquipment5ToMM) NEQ "" AND trim(localEquipment5ToMM) NEQ "@@" AND trim(localEquipment5ToMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5ToMM)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment5ToDD =	
					<cfif trim(localEquipment5ToDD) NEQ "" AND trim(localEquipment5ToDD) NEQ "@@" AND trim(localEquipment5ToDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5ToDD)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment5ToYY =	
					<cfif trim(localEquipment5ToYY) NEQ "" AND trim(localEquipment5ToYY) NEQ "@@" AND trim(localEquipment5ToYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5ToYY)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment5SupplierNameTBox =	
					<cfif trim(localEquipment5SupplierNameTBox) NEQ "" AND trim(localEquipment5SupplierNameTBox) NEQ "@@" AND trim(localEquipment5SupplierNameTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5SupplierNameTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment5SupplierTelephoneTBox =	
					<cfif trim(localEquipment5SupplierTelephoneTBox) NEQ "" AND trim(localEquipment5SupplierTelephoneTBox) NEQ "@@" AND trim(localEquipment5SupplierTelephoneTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5SupplierTelephoneTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment1NoteTBox =	
					<cfif trim(localEquipment1NoteTBox) NEQ "" AND trim(localEquipment1NoteTBox) NEQ "@@" AND trim(localEquipment1NoteTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment1NoteTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment2NoteTBox =	
					<cfif trim(localEquipment2NoteTBox) NEQ "" AND trim(localEquipment2NoteTBox) NEQ "@@" AND trim(localEquipment2NoteTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment2NoteTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment3NoteTBox =	
					<cfif trim(localEquipment3NoteTBox) NEQ "" AND trim(localEquipment3NoteTBox) NEQ "@@" AND trim(localEquipment3NoteTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment3NoteTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment4NoteTBox =	
					<cfif trim(localEquipment4NoteTBox) NEQ "" AND trim(localEquipment4NoteTBox) NEQ "@@" AND trim(localEquipment4NoteTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment4NoteTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Equipment5NoteTBox =	
					<cfif trim(localEquipment5NoteTBox) NEQ "" AND trim(localEquipment5NoteTBox) NEQ "@@" AND trim(localEquipment5NoteTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localEquipment5NoteTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OPTION_14_CBox_OxygenPAo2 =	
					<cfif trim(localOPTION_14_CBox_OxygenPAo2) NEQ "" AND trim(localOPTION_14_CBox_OxygenPAo2) NEQ "@@" AND trim(localOPTION_14_CBox_OxygenPAo2) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_14_CBox_OxygenPAo2)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OPTION_14_CBox_OxygenSAo2 =	
					<cfif trim(localOPTION_14_CBox_OxygenSAo2) NEQ "" AND trim(localOPTION_14_CBox_OxygenSAo2) NEQ "@@" AND trim(localOPTION_14_CBox_OxygenSAo2) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_14_CBox_OxygenSAo2)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OPTION_14_CBox_OxygenSPo2 =	
					<cfif trim(localOPTION_14_CBox_OxygenSPo2) NEQ "" AND trim(localOPTION_14_CBox_OxygenSPo2) NEQ "@@" AND trim(localOPTION_14_CBox_OxygenSPo2) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_14_CBox_OxygenSPo2)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OxygenPAO2TBox =	
					<cfif trim(localOxygenPAO2TBox) NEQ "" AND trim(localOxygenPAO2TBox) NEQ "@@" AND trim(localOxygenPAO2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localOxygenPAO2TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OxygenSAO2TBox =	
					<cfif trim(localOxygenSAO2TBox) NEQ "" AND trim(localOxygenSAO2TBox) NEQ "@@" AND trim(localOxygenSAO2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localOxygenSAO2TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					CPAPStudy_CBox =	
					<cfif trim(localCPAPStudy_CBox) NEQ "" AND trim(localCPAPStudy_CBox) NEQ "@@" AND trim(localCPAPStudy_CBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localCPAPStudy_CBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					CPAPStudyNote =	
					<cfif trim(localCPAPStudyNote) NEQ "" AND trim(localCPAPStudyNote) NEQ "@@" AND trim(localCPAPStudyNote) NEQ "NULL">						
						<cfqueryparam value="#trim(localCPAPStudyNote)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OxygenSPO2TBox =	
					<cfif trim(localOxygenSPO2TBox) NEQ "" AND trim(localOxygenSPO2TBox) NEQ "@@" AND trim(localOxygenSPO2TBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localOxygenSPO2TBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					CPAPStudyOnFile_CBox =	
					<cfif trim(localCPAPStudyOnFile_CBox) NEQ "" AND trim(localCPAPStudyOnFile_CBox) NEQ "@@" AND trim(localCPAPStudyOnFile_CBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localCPAPStudyOnFile_CBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					CPAPStudyOnFileNote =	
					<cfif trim(localCPAPStudyOnFileNote) NEQ "" AND trim(localCPAPStudyOnFileNote) NEQ "@@" AND trim(localCPAPStudyOnFileNote) NEQ "NULL">						
						<cfqueryparam value="#trim(localCPAPStudyOnFileNote)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LabTestDateMM =	
					<cfif trim(localLabTestDateMM) NEQ "" AND trim(localLabTestDateMM) NEQ "@@" AND trim(localLabTestDateMM) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabTestDateMM)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LabTestDateDD =	
					<cfif trim(localLabTestDateDD) NEQ "" AND trim(localLabTestDateDD) NEQ "@@" AND trim(localLabTestDateDD) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabTestDateDD)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LabTestDateYY =	
					<cfif trim(localLabTestDateYY) NEQ "" AND trim(localLabTestDateYY) NEQ "@@" AND trim(localLabTestDateYY) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabTestDateYY)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					CPAPStudyPerformedAt =	
					<cfif trim(localCPAPStudyPerformedAt) NEQ "" AND trim(localCPAPStudyPerformedAt) NEQ "@@" AND trim(localCPAPStudyPerformedAt) NEQ "NULL">						
						<cfqueryparam value="#trim(localCPAPStudyPerformedAt)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LabTestFacilityTBox =	
					<cfif trim(localLabTestFacilityTBox) NEQ "" AND trim(localLabTestFacilityTBox) NEQ "@@" AND trim(localLabTestFacilityTBox) NEQ "NULL">						
						<cfqueryparam value="#trim(localLabTestFacilityTBox)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					CPAPStudyPerformedAt2 =	
					<cfif trim(localCPAPStudyPerformedAt2) NEQ "" AND trim(localCPAPStudyPerformedAt2) NEQ "@@" AND trim(localCPAPStudyPerformedAt2) NEQ "NULL">						
						<cfqueryparam value="#trim(localCPAPStudyPerformedAt2)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					CPAPStudyPerformedAt3 =	
					<cfif trim(localCPAPStudyPerformedAt3) NEQ "" AND trim(localCPAPStudyPerformedAt3) NEQ "@@" AND trim(localCPAPStudyPerformedAt3) NEQ "NULL">						
						<cfqueryparam value="#trim(localCPAPStudyPerformedAt3)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ClosingInvoiceNumber =	
					<cfif trim(localClosingInvoiceNumber) NEQ "" AND trim(localClosingInvoiceNumber) NEQ "@@" AND trim(localClosingInvoiceNumber) NEQ "NULL">						
						<cfqueryparam value="#trim(localClosingInvoiceNumber)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OPTION_SkilledNursing =	
					<cfif trim(localOPTION_SkilledNursing) NEQ "" AND trim(localOPTION_SkilledNursing) NEQ "@@" AND trim(localOPTION_SkilledNursing) NEQ "NULL">						
						<cfqueryparam value="#trim(localOPTION_SkilledNursing)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					SkilledNursingName =	
					<cfif trim(localSkilledNursingName) NEQ "" AND trim(localSkilledNursingName) NEQ "@@" AND trim(localSkilledNursingName) NEQ "NULL">						
						<cfqueryparam value="#trim(localSkilledNursingName)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					SkilledNursingTelephone =	
					<cfif trim(localSkilledNursingTelephone) NEQ "" AND trim(localSkilledNursingTelephone) NEQ "@@" AND trim(localSkilledNursingTelephone) NEQ "NULL">						
						<cfqueryparam value="#trim(localSkilledNursingTelephone)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Printed =	
					<cfif trim(localPrinted) NEQ "" AND trim(localPrinted) NEQ "@@" AND trim(localPrinted) NEQ "NULL">						
						<cfqueryparam value="#trim(localPrinted)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					Active =						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					InactiveCode =				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					DateModified =	
					<cfif IsDate(trim(localDateModified))>						
						<cfqueryparam value="#trim(localDateModified)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>					
				WHERE IntakeID = <cfqueryparam value="#trim(arguments.obj.getIntakeID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="IntakeActive" />
		<cfset var qDeleteIntake = "">

		<cfquery name="qDeleteIntake" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM Intake
			WHERE IntakeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getIntakeID())#" /> 
		</cfquery>

	</cffunction>



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>


