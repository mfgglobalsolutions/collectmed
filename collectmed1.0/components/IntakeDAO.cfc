 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="IntakeBean" />
		
		<cfset var qCreateIntake = "" />		
		
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localAssignedToUserID = arguments.bean.getAssignedToUserID() />
		<cfset var localhidden_Step = arguments.bean.gethidden_Step() />
		<cfset var localhidden_UsersID = arguments.bean.gethidden_UsersID() />
		<cfset var localhidden_TimeStart = arguments.bean.gethidden_TimeStart() />
		<cfset var localOPTION_1_CBox_Delivery = arguments.bean.getOPTION_1_CBox_Delivery() />
		<cfset var localOPTION_1_CBox_Pickup = arguments.bean.getOPTION_1_CBox_Pickup() />
		<cfset var localOPTION_1_CBox_Repair = arguments.bean.getOPTION_1_CBox_Repair() />
		<cfset var localOPTION_1_CBox_Switch = arguments.bean.getOPTION_1_CBox_Switch() />
		<cfset var localOPTION_1_CBox_Existing = arguments.bean.getOPTION_1_CBox_Existing() />
		<cfset var localOPTION_2_CBox_Other = arguments.bean.getOPTION_2_CBox_Other() />
		<cfset var localOPTION_2_CBox_Hospice = arguments.bean.getOPTION_2_CBox_Hospice() />
		<cfset var localOPTION_2_CBox_Hospital = arguments.bean.getOPTION_2_CBox_Hospital() />
		<cfset var localotherTBox = arguments.bean.getotherTBox() />
		<cfset var localhospiceTBox = arguments.bean.gethospiceTBox() />
		<cfset var localOPTION_3_CBox_Medicare = arguments.bean.getOPTION_3_CBox_Medicare() />
		<cfset var localOPTION_3_CBox_PrivateInsurance = arguments.bean.getOPTION_3_CBox_PrivateInsurance() />
		<cfset var localOPTION_3_CBox_Medicaid = arguments.bean.getOPTION_3_CBox_Medicaid() />
		<cfset var localOPTION_3_CBox_PrivatePay = arguments.bean.getOPTION_3_CBox_PrivatePay() />
		<cfset var localhospitalTBox = arguments.bean.gethospitalTBox() />
		<cfset var localDischargeDateMM = arguments.bean.getDischargeDateMM() />
		<cfset var localDischargeDateDD = arguments.bean.getDischargeDateDD() />
		<cfset var localDischargeDateYY = arguments.bean.getDischargeDateYY() />
		<cfset var localtypeOfPay_Radio = arguments.bean.gettypeOfPay_Radio() />
		<cfset var localcallerFNameTBox = arguments.bean.getcallerFNameTBox() />
		<cfset var localcallerMInitialTBox = arguments.bean.getcallerMInitialTBox() />
		<cfset var localcallerLNameTBox = arguments.bean.getcallerLNameTBox() />
		<cfset var localcallerPhoneTBox = arguments.bean.getcallerPhoneTBox() />
		<cfset var localpatientXML = arguments.bean.getpatientXML() />
		<cfset var localpatientID = arguments.bean.getpatientID() />
		<cfset var localpatientAddressID = arguments.bean.getpatientAddressID() />
		<cfset var localpatientPhoneID = arguments.bean.getpatientPhoneID() />
		<cfset var localroomNumberTBox = arguments.bean.getroomNumberTBox() />
		<cfset var localbedNumberTBox = arguments.bean.getbedNumberTBox() />
		<cfset var localalternateContactFNameTBox = arguments.bean.getalternateContactFNameTBox() />
		<cfset var localalternateContactMInitialTBox = arguments.bean.getalternateContactMInitialTBox() />
		<cfset var localalternateContactLNameTBox = arguments.bean.getalternateContactLNameTBox() />
		<cfset var localalternateContactRelationshipTBox = arguments.bean.getalternateContactRelationshipTBox() />
		<cfset var localalternateContactPhoneTBox = arguments.bean.getalternateContactPhoneTBox() />
		<cfset var localalternateContactWorkPhoneTBox = arguments.bean.getalternateContactWorkPhoneTBox() />
		<cfset var localpoNumberTBox = arguments.bean.getpoNumberTBox() />
		<cfset var localcreditCardTypeTBox = arguments.bean.getcreditCardTypeTBox() />
		<cfset var localcreditCardNumberTBox = arguments.bean.getcreditCardNumberTBox() />
		<cfset var localccDateMM = arguments.bean.getccDateMM() />
		<cfset var localccDateDD = arguments.bean.getccDateDD() />
		<cfset var localccDateYY = arguments.bean.getccDateYY() />
		<cfset var localorderingPhysicianFNameTBox = arguments.bean.getorderingPhysicianFNameTBox() />
		<cfset var localorderingPhysicianMInitialTBox = arguments.bean.getorderingPhysicianMInitialTBox() />
		<cfset var localorderingPhysicianLNameTBox = arguments.bean.getorderingPhysicianLNameTBox() />
		<cfset var localorderingPhysicianPhoneTBox = arguments.bean.getorderingPhysicianPhoneTBox() />
		<cfset var localorderingPhysicianUPINTBox = arguments.bean.getorderingPhysicianUPINTBox() />
		<cfset var localorderingPhysicianFaxTBox = arguments.bean.getorderingPhysicianFaxTBox() />
		<cfset var localorderingPhysicianAddressTBox = arguments.bean.getorderingPhysicianAddressTBox() />
		<cfset var localorderingPhysicianCityTBox = arguments.bean.getorderingPhysicianCityTBox() />
		<cfset var localorderingPhysicianStateTBox = arguments.bean.getorderingPhysicianStateTBox() />
		<cfset var localorderingPhysicianZipTBox = arguments.bean.getorderingPhysicianZipTBox() />
		<cfset var localOPTION_13_CBox_PastEquipmentYes = arguments.bean.getOPTION_13_CBox_PastEquipmentYes() />
		<cfset var localOPTION_13_CBox_PastEquipmentNo = arguments.bean.getOPTION_13_CBox_PastEquipmentNo() />
		<cfset var localEquipment1TypeTBox = arguments.bean.getEquipment1TypeTBox() />
		<cfset var localEquipment1RentPurchasedSelect = arguments.bean.getEquipment1RentPurchasedSelect() />
		<cfset var localEquipment1FromMM = arguments.bean.getEquipment1FromMM() />
		<cfset var localEquipment1FromDD = arguments.bean.getEquipment1FromDD() />
		<cfset var localEquipment1FromYY = arguments.bean.getEquipment1FromYY() />
		<cfset var localEquipment1ToMM = arguments.bean.getEquipment1ToMM() />
		<cfset var localEquipment1ToDD = arguments.bean.getEquipment1ToDD() />
		<cfset var localEquipment1ToYY = arguments.bean.getEquipment1ToYY() />
		<cfset var localEquipment1SupplierNameTBox = arguments.bean.getEquipment1SupplierNameTBox() />
		<cfset var localEquipment1SupplierTelephoneTBox = arguments.bean.getEquipment1SupplierTelephoneTBox() />
		<cfset var localEquipment2TypeTBox = arguments.bean.getEquipment2TypeTBox() />
		<cfset var localEquipment2RentPurchasedSelect = arguments.bean.getEquipment2RentPurchasedSelect() />
		<cfset var localEquipment2FromMM = arguments.bean.getEquipment2FromMM() />
		<cfset var localEquipment2FromDD = arguments.bean.getEquipment2FromDD() />
		<cfset var localEquipment2FromYY = arguments.bean.getEquipment2FromYY() />
		<cfset var localEquipment2ToMM = arguments.bean.getEquipment2ToMM() />
		<cfset var localEquipment2ToDD = arguments.bean.getEquipment2ToDD() />
		<cfset var localEquipment2ToYY = arguments.bean.getEquipment2ToYY() />
		<cfset var localEquipment2SupplierNameTBox = arguments.bean.getEquipment2SupplierNameTBox() />
		<cfset var localEquipment2SupplierTelephoneTBox = arguments.bean.getEquipment2SupplierTelephoneTBox() />
		<cfset var localEquipment3TypeTBox = arguments.bean.getEquipment3TypeTBox() />
		<cfset var localEquipment3RentPurchasedSelect = arguments.bean.getEquipment3RentPurchasedSelect() />
		<cfset var localEquipment3FromMM = arguments.bean.getEquipment3FromMM() />
		<cfset var localEquipment3FromDD = arguments.bean.getEquipment3FromDD() />
		<cfset var localEquipment3FromYY = arguments.bean.getEquipment3FromYY() />
		<cfset var localEquipment3ToMM = arguments.bean.getEquipment3ToMM() />
		<cfset var localEquipment3ToDD = arguments.bean.getEquipment3ToDD() />
		<cfset var localEquipment3ToYY = arguments.bean.getEquipment3ToYY() />
		<cfset var localEquipment3SupplierNameTBox = arguments.bean.getEquipment3SupplierNameTBox() />
		<cfset var localEquipment3SupplierTelephoneTBox = arguments.bean.getEquipment3SupplierTelephoneTBox() />
		<cfset var localEquipment4TypeTBox = arguments.bean.getEquipment4TypeTBox() />
		<cfset var localEquipment4RentPurchasedSelect = arguments.bean.getEquipment4RentPurchasedSelect() />
		<cfset var localEquipment4FromMM = arguments.bean.getEquipment4FromMM() />
		<cfset var localEquipment4FromDD = arguments.bean.getEquipment4FromDD() />
		<cfset var localEquipment4FromYY = arguments.bean.getEquipment4FromYY() />
		<cfset var localEquipment4ToMM = arguments.bean.getEquipment4ToMM() />
		<cfset var localEquipment4ToDD = arguments.bean.getEquipment4ToDD() />
		<cfset var localEquipment4ToYY = arguments.bean.getEquipment4ToYY() />
		<cfset var localEquipment4SupplierNameTBox = arguments.bean.getEquipment4SupplierNameTBox() />
		<cfset var localEquipment4SupplierTelephoneTBox = arguments.bean.getEquipment4SupplierTelephoneTBox() />
		<cfset var localEquipment5TypeTBox = arguments.bean.getEquipment5TypeTBox() />
		<cfset var localEquipment5RentPurchasedSelect = arguments.bean.getEquipment5RentPurchasedSelect() />
		<cfset var localEquipment5FromMM = arguments.bean.getEquipment5FromMM() />
		<cfset var localEquipment5FromDD = arguments.bean.getEquipment5FromDD() />
		<cfset var localEquipment5FromYY = arguments.bean.getEquipment5FromYY() />
		<cfset var localEquipment5ToMM = arguments.bean.getEquipment5ToMM() />
		<cfset var localEquipment5ToDD = arguments.bean.getEquipment5ToDD() />
		<cfset var localEquipment5ToYY = arguments.bean.getEquipment5ToYY() />
		<cfset var localEquipment5SupplierNameTBox = arguments.bean.getEquipment5SupplierNameTBox() />
		<cfset var localEquipment5SupplierTelephoneTBox = arguments.bean.getEquipment5SupplierTelephoneTBox() />
		<cfset var localEquipment1NoteTBox = arguments.bean.getEquipment1NoteTBox() />
		<cfset var localEquipment2NoteTBox = arguments.bean.getEquipment2NoteTBox() />
		<cfset var localEquipment3NoteTBox = arguments.bean.getEquipment3NoteTBox() />
		<cfset var localEquipment4NoteTBox = arguments.bean.getEquipment4NoteTBox() />
		<cfset var localEquipment5NoteTBox = arguments.bean.getEquipment5NoteTBox() />
		<cfset var localOPTION_14_CBox_OxygenPAo2 = arguments.bean.getOPTION_14_CBox_OxygenPAo2() />
		<cfset var localOPTION_14_CBox_OxygenSAo2 = arguments.bean.getOPTION_14_CBox_OxygenSAo2() />
		<cfset var localOPTION_14_CBox_OxygenSPo2 = arguments.bean.getOPTION_14_CBox_OxygenSPo2() />
		<cfset var localOxygenPAO2TBox = arguments.bean.getOxygenPAO2TBox() />
		<cfset var localOxygenSAO2TBox = arguments.bean.getOxygenSAO2TBox() />
		<cfset var localCPAPStudy_CBox = arguments.bean.getCPAPStudy_CBox() />
		<cfset var localCPAPStudyNote = arguments.bean.getCPAPStudyNote() />
		<cfset var localOxygenSPO2TBox = arguments.bean.getOxygenSPO2TBox() />
		<cfset var localCPAPStudyOnFile_CBox = arguments.bean.getCPAPStudyOnFile_CBox() />
		<cfset var localCPAPStudyOnFileNote = arguments.bean.getCPAPStudyOnFileNote() />
		<cfset var localLabTestDateMM = arguments.bean.getLabTestDateMM() />
		<cfset var localLabTestDateDD = arguments.bean.getLabTestDateDD() />
		<cfset var localLabTestDateYY = arguments.bean.getLabTestDateYY() />
		<cfset var localCPAPStudyPerformedAt = arguments.bean.getCPAPStudyPerformedAt() />
		<cfset var localLabTestFacilityTBox = arguments.bean.getLabTestFacilityTBox() />
		<cfset var localCPAPStudyPerformedAt2 = arguments.bean.getCPAPStudyPerformedAt2() />
		<cfset var localCPAPStudyPerformedAt3 = arguments.bean.getCPAPStudyPerformedAt3() />
		<cfset var localClosingInvoiceNumber = arguments.bean.getClosingInvoiceNumber() />
		<cfset var localOPTION_SkilledNursing = arguments.bean.getOPTION_SkilledNursing() />
		<cfset var localSkilledNursingName = arguments.bean.getSkilledNursingName() />
		<cfset var localSkilledNursingTelephone = arguments.bean.getSkilledNursingTelephone() />
		<cfset var localPrinted = arguments.bean.getPrinted() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateIntake" datasource="#trim(arguments.ds)#">
				INSERT INTO intake (ClientID,AssignedToUserID,hidden_Step,hidden_UsersID,hidden_TimeStart,OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing,OPTION_2_CBox_Other,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital,otherTBox,hospiceTBox,OPTION_3_CBox_Medicare,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay,hospitalTBox,DischargeDateMM,DischargeDateDD,DischargeDateYY,typeOfPay_Radio,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientXML,patientID,patientAddressID,patientPhoneID,roomNumberTBox,bedNumberTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,poNumberTBox,creditCardTypeTBox,creditCardNumberTBox,ccDateMM,ccDateDD,ccDateYY,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,orderingPhysicianUPINTBox,orderingPhysicianFaxTBox,orderingPhysicianAddressTBox,orderingPhysicianCityTBox,orderingPhysicianStateTBox,orderingPhysicianZipTBox,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo,Equipment1TypeTBox,Equipment1RentPurchasedSelect,Equipment1FromMM,Equipment1FromDD,Equipment1FromYY,Equipment1ToMM,Equipment1ToDD,Equipment1ToYY,Equipment1SupplierNameTBox,Equipment1SupplierTelephoneTBox,Equipment2TypeTBox,Equipment2RentPurchasedSelect,Equipment2FromMM,Equipment2FromDD,Equipment2FromYY,Equipment2ToMM,Equipment2ToDD,Equipment2ToYY,Equipment2SupplierNameTBox,Equipment2SupplierTelephoneTBox,Equipment3TypeTBox,Equipment3RentPurchasedSelect,Equipment3FromMM,Equipment3FromDD,Equipment3FromYY,Equipment3ToMM,Equipment3ToDD,Equipment3ToYY,Equipment3SupplierNameTBox,Equipment3SupplierTelephoneTBox,Equipment4TypeTBox,Equipment4RentPurchasedSelect,Equipment4FromMM,Equipment4FromDD,Equipment4FromYY,Equipment4ToMM,Equipment4ToDD,Equipment4ToYY,Equipment4SupplierNameTBox,Equipment4SupplierTelephoneTBox,Equipment5TypeTBox,Equipment5RentPurchasedSelect,Equipment5FromMM,Equipment5FromDD,Equipment5FromYY,Equipment5ToMM,Equipment5ToDD,Equipment5ToYY,Equipment5SupplierNameTBox,Equipment5SupplierTelephoneTBox,Equipment1NoteTBox,Equipment2NoteTBox,Equipment3NoteTBox,Equipment4NoteTBox,Equipment5NoteTBox,OPTION_14_CBox_OxygenPAo2,OPTION_14_CBox_OxygenSAo2,OPTION_14_CBox_OxygenSPo2,OxygenPAO2TBox,OxygenSAO2TBox,CPAPStudy_CBox,CPAPStudyNote,OxygenSPO2TBox,CPAPStudyOnFile_CBox,CPAPStudyOnFileNote,LabTestDateMM,LabTestDateDD,LabTestDateYY,CPAPStudyPerformedAt,LabTestFacilityTBox,CPAPStudyPerformedAt2,CPAPStudyPerformedAt3,ClosingInvoiceNumber,OPTION_SkilledNursing,SkilledNursingName,SkilledNursingTelephone,Printed,Active,InactiveCode)
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
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
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
			arguments.bean.setIntakeID(qCreateIntake.IntakeID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="IntakeBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="IntakeID" required="yes" type="numeric" />		
		<cfset var qGetIntake = "" />		
		
		<cfset qGetIntake = getIntake(trim(arguments.ds), trim(IntakeID)) />
				
		<cfif qGetIntake.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objIntake = createObject("component", "IntakeBean").init(arguments.ds);
			objIntake.setIntakeID(qGetIntake.IntakeID);
			objIntake.setClientID(qGetIntake.ClientID);
			objIntake.setAssignedToUserID(qGetIntake.AssignedToUserID);
			objIntake.sethidden_Step(qGetIntake.hidden_Step);
			objIntake.sethidden_UsersID(qGetIntake.hidden_UsersID);
			objIntake.sethidden_TimeStart(qGetIntake.hidden_TimeStart);
			objIntake.setOPTION_1_CBox_Delivery(qGetIntake.OPTION_1_CBox_Delivery);
			objIntake.setOPTION_1_CBox_Pickup(qGetIntake.OPTION_1_CBox_Pickup);
			objIntake.setOPTION_1_CBox_Repair(qGetIntake.OPTION_1_CBox_Repair);
			objIntake.setOPTION_1_CBox_Switch(qGetIntake.OPTION_1_CBox_Switch);
			objIntake.setOPTION_1_CBox_Existing(qGetIntake.OPTION_1_CBox_Existing);
			objIntake.setOPTION_2_CBox_Other(qGetIntake.OPTION_2_CBox_Other);
			objIntake.setOPTION_2_CBox_Hospice(qGetIntake.OPTION_2_CBox_Hospice);
			objIntake.setOPTION_2_CBox_Hospital(qGetIntake.OPTION_2_CBox_Hospital);
			objIntake.setotherTBox(qGetIntake.otherTBox);
			objIntake.sethospiceTBox(qGetIntake.hospiceTBox);
			objIntake.setOPTION_3_CBox_Medicare(qGetIntake.OPTION_3_CBox_Medicare);
			objIntake.setOPTION_3_CBox_PrivateInsurance(qGetIntake.OPTION_3_CBox_PrivateInsurance);
			objIntake.setOPTION_3_CBox_Medicaid(qGetIntake.OPTION_3_CBox_Medicaid);
			objIntake.setOPTION_3_CBox_PrivatePay(qGetIntake.OPTION_3_CBox_PrivatePay);
			objIntake.sethospitalTBox(qGetIntake.hospitalTBox);
			objIntake.setDischargeDateMM(qGetIntake.DischargeDateMM);
			objIntake.setDischargeDateDD(qGetIntake.DischargeDateDD);
			objIntake.setDischargeDateYY(qGetIntake.DischargeDateYY);
			objIntake.settypeOfPay_Radio(qGetIntake.typeOfPay_Radio);
			objIntake.setcallerFNameTBox(qGetIntake.callerFNameTBox);
			objIntake.setcallerMInitialTBox(qGetIntake.callerMInitialTBox);
			objIntake.setcallerLNameTBox(qGetIntake.callerLNameTBox);
			objIntake.setcallerPhoneTBox(qGetIntake.callerPhoneTBox);
			objIntake.setpatientXML(qGetIntake.patientXML);
			objIntake.setpatientID(qGetIntake.patientID);
			objIntake.setpatientAddressID(qGetIntake.patientAddressID);
			objIntake.setpatientPhoneID(qGetIntake.patientPhoneID);
			objIntake.setroomNumberTBox(qGetIntake.roomNumberTBox);
			objIntake.setbedNumberTBox(qGetIntake.bedNumberTBox);
			objIntake.setalternateContactFNameTBox(qGetIntake.alternateContactFNameTBox);
			objIntake.setalternateContactMInitialTBox(qGetIntake.alternateContactMInitialTBox);
			objIntake.setalternateContactLNameTBox(qGetIntake.alternateContactLNameTBox);
			objIntake.setalternateContactRelationshipTBox(qGetIntake.alternateContactRelationshipTBox);
			objIntake.setalternateContactPhoneTBox(qGetIntake.alternateContactPhoneTBox);
			objIntake.setalternateContactWorkPhoneTBox(qGetIntake.alternateContactWorkPhoneTBox);
			objIntake.setpoNumberTBox(qGetIntake.poNumberTBox);
			objIntake.setcreditCardTypeTBox(qGetIntake.creditCardTypeTBox);
			objIntake.setcreditCardNumberTBox(qGetIntake.creditCardNumberTBox);
			objIntake.setccDateMM(qGetIntake.ccDateMM);
			objIntake.setccDateDD(qGetIntake.ccDateDD);
			objIntake.setccDateYY(qGetIntake.ccDateYY);
			objIntake.setorderingPhysicianFNameTBox(qGetIntake.orderingPhysicianFNameTBox);
			objIntake.setorderingPhysicianMInitialTBox(qGetIntake.orderingPhysicianMInitialTBox);
			objIntake.setorderingPhysicianLNameTBox(qGetIntake.orderingPhysicianLNameTBox);
			objIntake.setorderingPhysicianPhoneTBox(qGetIntake.orderingPhysicianPhoneTBox);
			objIntake.setorderingPhysicianUPINTBox(qGetIntake.orderingPhysicianUPINTBox);
			objIntake.setorderingPhysicianFaxTBox(qGetIntake.orderingPhysicianFaxTBox);
			objIntake.setorderingPhysicianAddressTBox(qGetIntake.orderingPhysicianAddressTBox);
			objIntake.setorderingPhysicianCityTBox(qGetIntake.orderingPhysicianCityTBox);
			objIntake.setorderingPhysicianStateTBox(qGetIntake.orderingPhysicianStateTBox);
			objIntake.setorderingPhysicianZipTBox(qGetIntake.orderingPhysicianZipTBox);
			objIntake.setOPTION_13_CBox_PastEquipmentYes(qGetIntake.OPTION_13_CBox_PastEquipmentYes);
			objIntake.setOPTION_13_CBox_PastEquipmentNo(qGetIntake.OPTION_13_CBox_PastEquipmentNo);
			objIntake.setEquipment1TypeTBox(qGetIntake.Equipment1TypeTBox);
			objIntake.setEquipment1RentPurchasedSelect(qGetIntake.Equipment1RentPurchasedSelect);
			objIntake.setEquipment1FromMM(qGetIntake.Equipment1FromMM);
			objIntake.setEquipment1FromDD(qGetIntake.Equipment1FromDD);
			objIntake.setEquipment1FromYY(qGetIntake.Equipment1FromYY);
			objIntake.setEquipment1ToMM(qGetIntake.Equipment1ToMM);
			objIntake.setEquipment1ToDD(qGetIntake.Equipment1ToDD);
			objIntake.setEquipment1ToYY(qGetIntake.Equipment1ToYY);
			objIntake.setEquipment1SupplierNameTBox(qGetIntake.Equipment1SupplierNameTBox);
			objIntake.setEquipment1SupplierTelephoneTBox(qGetIntake.Equipment1SupplierTelephoneTBox);
			objIntake.setEquipment2TypeTBox(qGetIntake.Equipment2TypeTBox);
			objIntake.setEquipment2RentPurchasedSelect(qGetIntake.Equipment2RentPurchasedSelect);
			objIntake.setEquipment2FromMM(qGetIntake.Equipment2FromMM);
			objIntake.setEquipment2FromDD(qGetIntake.Equipment2FromDD);
			objIntake.setEquipment2FromYY(qGetIntake.Equipment2FromYY);
			objIntake.setEquipment2ToMM(qGetIntake.Equipment2ToMM);
			objIntake.setEquipment2ToDD(qGetIntake.Equipment2ToDD);
			objIntake.setEquipment2ToYY(qGetIntake.Equipment2ToYY);
			objIntake.setEquipment2SupplierNameTBox(qGetIntake.Equipment2SupplierNameTBox);
			objIntake.setEquipment2SupplierTelephoneTBox(qGetIntake.Equipment2SupplierTelephoneTBox);
			objIntake.setEquipment3TypeTBox(qGetIntake.Equipment3TypeTBox);
			objIntake.setEquipment3RentPurchasedSelect(qGetIntake.Equipment3RentPurchasedSelect);
			objIntake.setEquipment3FromMM(qGetIntake.Equipment3FromMM);
			objIntake.setEquipment3FromDD(qGetIntake.Equipment3FromDD);
			objIntake.setEquipment3FromYY(qGetIntake.Equipment3FromYY);
			objIntake.setEquipment3ToMM(qGetIntake.Equipment3ToMM);
			objIntake.setEquipment3ToDD(qGetIntake.Equipment3ToDD);
			objIntake.setEquipment3ToYY(qGetIntake.Equipment3ToYY);
			objIntake.setEquipment3SupplierNameTBox(qGetIntake.Equipment3SupplierNameTBox);
			objIntake.setEquipment3SupplierTelephoneTBox(qGetIntake.Equipment3SupplierTelephoneTBox);
			objIntake.setEquipment4TypeTBox(qGetIntake.Equipment4TypeTBox);
			objIntake.setEquipment4RentPurchasedSelect(qGetIntake.Equipment4RentPurchasedSelect);
			objIntake.setEquipment4FromMM(qGetIntake.Equipment4FromMM);
			objIntake.setEquipment4FromDD(qGetIntake.Equipment4FromDD);
			objIntake.setEquipment4FromYY(qGetIntake.Equipment4FromYY);
			objIntake.setEquipment4ToMM(qGetIntake.Equipment4ToMM);
			objIntake.setEquipment4ToDD(qGetIntake.Equipment4ToDD);
			objIntake.setEquipment4ToYY(qGetIntake.Equipment4ToYY);
			objIntake.setEquipment4SupplierNameTBox(qGetIntake.Equipment4SupplierNameTBox);
			objIntake.setEquipment4SupplierTelephoneTBox(qGetIntake.Equipment4SupplierTelephoneTBox);
			objIntake.setEquipment5TypeTBox(qGetIntake.Equipment5TypeTBox);
			objIntake.setEquipment5RentPurchasedSelect(qGetIntake.Equipment5RentPurchasedSelect);
			objIntake.setEquipment5FromMM(qGetIntake.Equipment5FromMM);
			objIntake.setEquipment5FromDD(qGetIntake.Equipment5FromDD);
			objIntake.setEquipment5FromYY(qGetIntake.Equipment5FromYY);
			objIntake.setEquipment5ToMM(qGetIntake.Equipment5ToMM);
			objIntake.setEquipment5ToDD(qGetIntake.Equipment5ToDD);
			objIntake.setEquipment5ToYY(qGetIntake.Equipment5ToYY);
			objIntake.setEquipment5SupplierNameTBox(qGetIntake.Equipment5SupplierNameTBox);
			objIntake.setEquipment5SupplierTelephoneTBox(qGetIntake.Equipment5SupplierTelephoneTBox);
			objIntake.setEquipment1NoteTBox(qGetIntake.Equipment1NoteTBox);
			objIntake.setEquipment2NoteTBox(qGetIntake.Equipment2NoteTBox);
			objIntake.setEquipment3NoteTBox(qGetIntake.Equipment3NoteTBox);
			objIntake.setEquipment4NoteTBox(qGetIntake.Equipment4NoteTBox);
			objIntake.setEquipment5NoteTBox(qGetIntake.Equipment5NoteTBox);
			objIntake.setOPTION_14_CBox_OxygenPAo2(qGetIntake.OPTION_14_CBox_OxygenPAo2);
			objIntake.setOPTION_14_CBox_OxygenSAo2(qGetIntake.OPTION_14_CBox_OxygenSAo2);
			objIntake.setOPTION_14_CBox_OxygenSPo2(qGetIntake.OPTION_14_CBox_OxygenSPo2);
			objIntake.setOxygenPAO2TBox(qGetIntake.OxygenPAO2TBox);
			objIntake.setOxygenSAO2TBox(qGetIntake.OxygenSAO2TBox);
			objIntake.setCPAPStudy_CBox(qGetIntake.CPAPStudy_CBox);
			objIntake.setCPAPStudyNote(qGetIntake.CPAPStudyNote);
			objIntake.setOxygenSPO2TBox(qGetIntake.OxygenSPO2TBox);
			objIntake.setCPAPStudyOnFile_CBox(qGetIntake.CPAPStudyOnFile_CBox);
			objIntake.setCPAPStudyOnFileNote(qGetIntake.CPAPStudyOnFileNote);
			objIntake.setLabTestDateMM(qGetIntake.LabTestDateMM);
			objIntake.setLabTestDateDD(qGetIntake.LabTestDateDD);
			objIntake.setLabTestDateYY(qGetIntake.LabTestDateYY);
			objIntake.setCPAPStudyPerformedAt(qGetIntake.CPAPStudyPerformedAt);
			objIntake.setLabTestFacilityTBox(qGetIntake.LabTestFacilityTBox);
			objIntake.setCPAPStudyPerformedAt2(qGetIntake.CPAPStudyPerformedAt2);
			objIntake.setCPAPStudyPerformedAt3(qGetIntake.CPAPStudyPerformedAt3);
			objIntake.setClosingInvoiceNumber(qGetIntake.ClosingInvoiceNumber);
			objIntake.setOPTION_SkilledNursing(qGetIntake.OPTION_SkilledNursing);
			objIntake.setSkilledNursingName(qGetIntake.SkilledNursingName);
			objIntake.setSkilledNursingTelephone(qGetIntake.SkilledNursingTelephone);
			objIntake.setPrinted(qGetIntake.Printed);
			objIntake.setActive(qGetIntake.Active);
			objIntake.setInactiveCode(qGetIntake.InactiveCode);
			objIntake.setDateCreated(qGetIntake.DateCreated);
			objIntake.setDateModified(qGetIntake.DateModified);				
			return objIntake;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="IntakeBean" />
		<cfset var qUpdateIntake = "" />
		<cfset var localClientID = arguments.bean.getClientID() />
		<cfset var localAssignedToUserID = arguments.bean.getAssignedToUserID() />
		<cfset var localhidden_Step = arguments.bean.gethidden_Step() />
		<cfset var localhidden_UsersID = arguments.bean.gethidden_UsersID() />
		<cfset var localhidden_TimeStart = arguments.bean.gethidden_TimeStart() />
		<cfset var localOPTION_1_CBox_Delivery = arguments.bean.getOPTION_1_CBox_Delivery() />
		<cfset var localOPTION_1_CBox_Pickup = arguments.bean.getOPTION_1_CBox_Pickup() />
		<cfset var localOPTION_1_CBox_Repair = arguments.bean.getOPTION_1_CBox_Repair() />
		<cfset var localOPTION_1_CBox_Switch = arguments.bean.getOPTION_1_CBox_Switch() />
		<cfset var localOPTION_1_CBox_Existing = arguments.bean.getOPTION_1_CBox_Existing() />
		<cfset var localOPTION_2_CBox_Other = arguments.bean.getOPTION_2_CBox_Other() />
		<cfset var localOPTION_2_CBox_Hospice = arguments.bean.getOPTION_2_CBox_Hospice() />
		<cfset var localOPTION_2_CBox_Hospital = arguments.bean.getOPTION_2_CBox_Hospital() />
		<cfset var localotherTBox = arguments.bean.getotherTBox() />
		<cfset var localhospiceTBox = arguments.bean.gethospiceTBox() />
		<cfset var localOPTION_3_CBox_Medicare = arguments.bean.getOPTION_3_CBox_Medicare() />
		<cfset var localOPTION_3_CBox_PrivateInsurance = arguments.bean.getOPTION_3_CBox_PrivateInsurance() />
		<cfset var localOPTION_3_CBox_Medicaid = arguments.bean.getOPTION_3_CBox_Medicaid() />
		<cfset var localOPTION_3_CBox_PrivatePay = arguments.bean.getOPTION_3_CBox_PrivatePay() />
		<cfset var localhospitalTBox = arguments.bean.gethospitalTBox() />
		<cfset var localDischargeDateMM = arguments.bean.getDischargeDateMM() />
		<cfset var localDischargeDateDD = arguments.bean.getDischargeDateDD() />
		<cfset var localDischargeDateYY = arguments.bean.getDischargeDateYY() />
		<cfset var localtypeOfPay_Radio = arguments.bean.gettypeOfPay_Radio() />
		<cfset var localcallerFNameTBox = arguments.bean.getcallerFNameTBox() />
		<cfset var localcallerMInitialTBox = arguments.bean.getcallerMInitialTBox() />
		<cfset var localcallerLNameTBox = arguments.bean.getcallerLNameTBox() />
		<cfset var localcallerPhoneTBox = arguments.bean.getcallerPhoneTBox() />
		<cfset var localpatientXML = arguments.bean.getpatientXML() />
		<cfset var localpatientID = arguments.bean.getpatientID() />
		<cfset var localpatientAddressID = arguments.bean.getpatientAddressID() />
		<cfset var localpatientPhoneID = arguments.bean.getpatientPhoneID() />
		<cfset var localroomNumberTBox = arguments.bean.getroomNumberTBox() />
		<cfset var localbedNumberTBox = arguments.bean.getbedNumberTBox() />
		<cfset var localalternateContactFNameTBox = arguments.bean.getalternateContactFNameTBox() />
		<cfset var localalternateContactMInitialTBox = arguments.bean.getalternateContactMInitialTBox() />
		<cfset var localalternateContactLNameTBox = arguments.bean.getalternateContactLNameTBox() />
		<cfset var localalternateContactRelationshipTBox = arguments.bean.getalternateContactRelationshipTBox() />
		<cfset var localalternateContactPhoneTBox = arguments.bean.getalternateContactPhoneTBox() />
		<cfset var localalternateContactWorkPhoneTBox = arguments.bean.getalternateContactWorkPhoneTBox() />
		<cfset var localpoNumberTBox = arguments.bean.getpoNumberTBox() />
		<cfset var localcreditCardTypeTBox = arguments.bean.getcreditCardTypeTBox() />
		<cfset var localcreditCardNumberTBox = arguments.bean.getcreditCardNumberTBox() />
		<cfset var localccDateMM = arguments.bean.getccDateMM() />
		<cfset var localccDateDD = arguments.bean.getccDateDD() />
		<cfset var localccDateYY = arguments.bean.getccDateYY() />
		<cfset var localorderingPhysicianFNameTBox = arguments.bean.getorderingPhysicianFNameTBox() />
		<cfset var localorderingPhysicianMInitialTBox = arguments.bean.getorderingPhysicianMInitialTBox() />
		<cfset var localorderingPhysicianLNameTBox = arguments.bean.getorderingPhysicianLNameTBox() />
		<cfset var localorderingPhysicianPhoneTBox = arguments.bean.getorderingPhysicianPhoneTBox() />
		<cfset var localorderingPhysicianUPINTBox = arguments.bean.getorderingPhysicianUPINTBox() />
		<cfset var localorderingPhysicianFaxTBox = arguments.bean.getorderingPhysicianFaxTBox() />
		<cfset var localorderingPhysicianAddressTBox = arguments.bean.getorderingPhysicianAddressTBox() />
		<cfset var localorderingPhysicianCityTBox = arguments.bean.getorderingPhysicianCityTBox() />
		<cfset var localorderingPhysicianStateTBox = arguments.bean.getorderingPhysicianStateTBox() />
		<cfset var localorderingPhysicianZipTBox = arguments.bean.getorderingPhysicianZipTBox() />
		<cfset var localOPTION_13_CBox_PastEquipmentYes = arguments.bean.getOPTION_13_CBox_PastEquipmentYes() />
		<cfset var localOPTION_13_CBox_PastEquipmentNo = arguments.bean.getOPTION_13_CBox_PastEquipmentNo() />
		<cfset var localEquipment1TypeTBox = arguments.bean.getEquipment1TypeTBox() />
		<cfset var localEquipment1RentPurchasedSelect = arguments.bean.getEquipment1RentPurchasedSelect() />
		<cfset var localEquipment1FromMM = arguments.bean.getEquipment1FromMM() />
		<cfset var localEquipment1FromDD = arguments.bean.getEquipment1FromDD() />
		<cfset var localEquipment1FromYY = arguments.bean.getEquipment1FromYY() />
		<cfset var localEquipment1ToMM = arguments.bean.getEquipment1ToMM() />
		<cfset var localEquipment1ToDD = arguments.bean.getEquipment1ToDD() />
		<cfset var localEquipment1ToYY = arguments.bean.getEquipment1ToYY() />
		<cfset var localEquipment1SupplierNameTBox = arguments.bean.getEquipment1SupplierNameTBox() />
		<cfset var localEquipment1SupplierTelephoneTBox = arguments.bean.getEquipment1SupplierTelephoneTBox() />
		<cfset var localEquipment2TypeTBox = arguments.bean.getEquipment2TypeTBox() />
		<cfset var localEquipment2RentPurchasedSelect = arguments.bean.getEquipment2RentPurchasedSelect() />
		<cfset var localEquipment2FromMM = arguments.bean.getEquipment2FromMM() />
		<cfset var localEquipment2FromDD = arguments.bean.getEquipment2FromDD() />
		<cfset var localEquipment2FromYY = arguments.bean.getEquipment2FromYY() />
		<cfset var localEquipment2ToMM = arguments.bean.getEquipment2ToMM() />
		<cfset var localEquipment2ToDD = arguments.bean.getEquipment2ToDD() />
		<cfset var localEquipment2ToYY = arguments.bean.getEquipment2ToYY() />
		<cfset var localEquipment2SupplierNameTBox = arguments.bean.getEquipment2SupplierNameTBox() />
		<cfset var localEquipment2SupplierTelephoneTBox = arguments.bean.getEquipment2SupplierTelephoneTBox() />
		<cfset var localEquipment3TypeTBox = arguments.bean.getEquipment3TypeTBox() />
		<cfset var localEquipment3RentPurchasedSelect = arguments.bean.getEquipment3RentPurchasedSelect() />
		<cfset var localEquipment3FromMM = arguments.bean.getEquipment3FromMM() />
		<cfset var localEquipment3FromDD = arguments.bean.getEquipment3FromDD() />
		<cfset var localEquipment3FromYY = arguments.bean.getEquipment3FromYY() />
		<cfset var localEquipment3ToMM = arguments.bean.getEquipment3ToMM() />
		<cfset var localEquipment3ToDD = arguments.bean.getEquipment3ToDD() />
		<cfset var localEquipment3ToYY = arguments.bean.getEquipment3ToYY() />
		<cfset var localEquipment3SupplierNameTBox = arguments.bean.getEquipment3SupplierNameTBox() />
		<cfset var localEquipment3SupplierTelephoneTBox = arguments.bean.getEquipment3SupplierTelephoneTBox() />
		<cfset var localEquipment4TypeTBox = arguments.bean.getEquipment4TypeTBox() />
		<cfset var localEquipment4RentPurchasedSelect = arguments.bean.getEquipment4RentPurchasedSelect() />
		<cfset var localEquipment4FromMM = arguments.bean.getEquipment4FromMM() />
		<cfset var localEquipment4FromDD = arguments.bean.getEquipment4FromDD() />
		<cfset var localEquipment4FromYY = arguments.bean.getEquipment4FromYY() />
		<cfset var localEquipment4ToMM = arguments.bean.getEquipment4ToMM() />
		<cfset var localEquipment4ToDD = arguments.bean.getEquipment4ToDD() />
		<cfset var localEquipment4ToYY = arguments.bean.getEquipment4ToYY() />
		<cfset var localEquipment4SupplierNameTBox = arguments.bean.getEquipment4SupplierNameTBox() />
		<cfset var localEquipment4SupplierTelephoneTBox = arguments.bean.getEquipment4SupplierTelephoneTBox() />
		<cfset var localEquipment5TypeTBox = arguments.bean.getEquipment5TypeTBox() />
		<cfset var localEquipment5RentPurchasedSelect = arguments.bean.getEquipment5RentPurchasedSelect() />
		<cfset var localEquipment5FromMM = arguments.bean.getEquipment5FromMM() />
		<cfset var localEquipment5FromDD = arguments.bean.getEquipment5FromDD() />
		<cfset var localEquipment5FromYY = arguments.bean.getEquipment5FromYY() />
		<cfset var localEquipment5ToMM = arguments.bean.getEquipment5ToMM() />
		<cfset var localEquipment5ToDD = arguments.bean.getEquipment5ToDD() />
		<cfset var localEquipment5ToYY = arguments.bean.getEquipment5ToYY() />
		<cfset var localEquipment5SupplierNameTBox = arguments.bean.getEquipment5SupplierNameTBox() />
		<cfset var localEquipment5SupplierTelephoneTBox = arguments.bean.getEquipment5SupplierTelephoneTBox() />
		<cfset var localEquipment1NoteTBox = arguments.bean.getEquipment1NoteTBox() />
		<cfset var localEquipment2NoteTBox = arguments.bean.getEquipment2NoteTBox() />
		<cfset var localEquipment3NoteTBox = arguments.bean.getEquipment3NoteTBox() />
		<cfset var localEquipment4NoteTBox = arguments.bean.getEquipment4NoteTBox() />
		<cfset var localEquipment5NoteTBox = arguments.bean.getEquipment5NoteTBox() />
		<cfset var localOPTION_14_CBox_OxygenPAo2 = arguments.bean.getOPTION_14_CBox_OxygenPAo2() />
		<cfset var localOPTION_14_CBox_OxygenSAo2 = arguments.bean.getOPTION_14_CBox_OxygenSAo2() />
		<cfset var localOPTION_14_CBox_OxygenSPo2 = arguments.bean.getOPTION_14_CBox_OxygenSPo2() />
		<cfset var localOxygenPAO2TBox = arguments.bean.getOxygenPAO2TBox() />
		<cfset var localOxygenSAO2TBox = arguments.bean.getOxygenSAO2TBox() />
		<cfset var localCPAPStudy_CBox = arguments.bean.getCPAPStudy_CBox() />
		<cfset var localCPAPStudyNote = arguments.bean.getCPAPStudyNote() />
		<cfset var localOxygenSPO2TBox = arguments.bean.getOxygenSPO2TBox() />
		<cfset var localCPAPStudyOnFile_CBox = arguments.bean.getCPAPStudyOnFile_CBox() />
		<cfset var localCPAPStudyOnFileNote = arguments.bean.getCPAPStudyOnFileNote() />
		<cfset var localLabTestDateMM = arguments.bean.getLabTestDateMM() />
		<cfset var localLabTestDateDD = arguments.bean.getLabTestDateDD() />
		<cfset var localLabTestDateYY = arguments.bean.getLabTestDateYY() />
		<cfset var localCPAPStudyPerformedAt = arguments.bean.getCPAPStudyPerformedAt() />
		<cfset var localLabTestFacilityTBox = arguments.bean.getLabTestFacilityTBox() />
		<cfset var localCPAPStudyPerformedAt2 = arguments.bean.getCPAPStudyPerformedAt2() />
		<cfset var localCPAPStudyPerformedAt3 = arguments.bean.getCPAPStudyPerformedAt3() />
		<cfset var localClosingInvoiceNumber = arguments.bean.getClosingInvoiceNumber() />
		<cfset var localOPTION_SkilledNursing = arguments.bean.getOPTION_SkilledNursing() />
		<cfset var localSkilledNursingName = arguments.bean.getSkilledNursingName() />
		<cfset var localSkilledNursingTelephone = arguments.bean.getSkilledNursingTelephone() />
		<cfset var localPrinted = arguments.bean.getPrinted() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateIntake" datasource="#trim(arguments.ds)#">
				UPDATE intake  SET
					
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
				WHERE IntakeID = <cfqueryparam value="#trim(arguments.bean.getIntakeID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="IntakeBean" />
		<cfset var qDeleteIntake = "">

		<cfquery name="qDeleteIntake" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM intake
			WHERE IntakeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getIntakeID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getIntake" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="IntakeID" required="yes" type="numeric" />		
		<cfset var qGetIntake = "" />		
	
		<cfquery name="qGetIntake" datasource="#trim(arguments.ds)#">
	  		SELECT IntakeID,ClientID,AssignedToUserID,hidden_Step,hidden_UsersID,hidden_TimeStart,OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing,OPTION_2_CBox_Other,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital,otherTBox,hospiceTBox,OPTION_3_CBox_Medicare,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay,hospitalTBox,DischargeDateMM,DischargeDateDD,DischargeDateYY,typeOfPay_Radio,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientXML,patientID,patientAddressID,patientPhoneID,roomNumberTBox,bedNumberTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,poNumberTBox,creditCardTypeTBox,creditCardNumberTBox,ccDateMM,ccDateDD,ccDateYY,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,orderingPhysicianUPINTBox,orderingPhysicianFaxTBox,orderingPhysicianAddressTBox,orderingPhysicianCityTBox,orderingPhysicianStateTBox,orderingPhysicianZipTBox,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo,Equipment1TypeTBox,Equipment1RentPurchasedSelect,Equipment1FromMM,Equipment1FromDD,Equipment1FromYY,Equipment1ToMM,Equipment1ToDD,Equipment1ToYY,Equipment1SupplierNameTBox,Equipment1SupplierTelephoneTBox,Equipment2TypeTBox,Equipment2RentPurchasedSelect,Equipment2FromMM,Equipment2FromDD,Equipment2FromYY,Equipment2ToMM,Equipment2ToDD,Equipment2ToYY,Equipment2SupplierNameTBox,Equipment2SupplierTelephoneTBox,Equipment3TypeTBox,Equipment3RentPurchasedSelect,Equipment3FromMM,Equipment3FromDD,Equipment3FromYY,Equipment3ToMM,Equipment3ToDD,Equipment3ToYY,Equipment3SupplierNameTBox,Equipment3SupplierTelephoneTBox,Equipment4TypeTBox,Equipment4RentPurchasedSelect,Equipment4FromMM,Equipment4FromDD,Equipment4FromYY,Equipment4ToMM,Equipment4ToDD,Equipment4ToYY,Equipment4SupplierNameTBox,Equipment4SupplierTelephoneTBox,Equipment5TypeTBox,Equipment5RentPurchasedSelect,Equipment5FromMM,Equipment5FromDD,Equipment5FromYY,Equipment5ToMM,Equipment5ToDD,Equipment5ToYY,Equipment5SupplierNameTBox,Equipment5SupplierTelephoneTBox,Equipment1NoteTBox,Equipment2NoteTBox,Equipment3NoteTBox,Equipment4NoteTBox,Equipment5NoteTBox,OPTION_14_CBox_OxygenPAo2,OPTION_14_CBox_OxygenSAo2,OPTION_14_CBox_OxygenSPo2,OxygenPAO2TBox,OxygenSAO2TBox,CPAPStudy_CBox,CPAPStudyNote,OxygenSPO2TBox,CPAPStudyOnFile_CBox,CPAPStudyOnFileNote,LabTestDateMM,LabTestDateDD,LabTestDateYY,CPAPStudyPerformedAt,LabTestFacilityTBox,CPAPStudyPerformedAt2,CPAPStudyPerformedAt3,ClosingInvoiceNumber,OPTION_SkilledNursing,SkilledNursingName,SkilledNursingTelephone,Printed,Active,InactiveCode,DateCreated,DateModified
			FROM intake  
			WHERE IntakeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.IntakeID)#" /> 
		</cfquery>
		
		<cfreturn qGetIntake>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





