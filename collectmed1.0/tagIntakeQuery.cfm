



<!-------------------------------------------------------------------------------------->
<!--- Query for the columns of the intake from the calling template. We have to do   --->
<!--- this because making an object and getting the data causes issues we believe    --->
<!--- because the number of columns.                                                 --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="caller.getIntake" datasource="#trim(request.datasource)#"> 
		SELECT i.patientXML, i.patientID, i.patientAddressID, i.patientPhoneID, i.InactiveCode, i.printed, i.AssignedTouserID, i.DateCreated, 
		i.hidden_Step, i.otherTBox, i.hidden_UsersID, i.hidden_TimeStart, IFNULL(i.OPTION_1_CBox_Delivery, 0) AS OPTION_1_CBox_Delivery, 	
		IFNULL(i.OPTION_1_CBox_Pickup, 0) AS OPTION_1_CBox_Pickup, IFNULL(i.OPTION_1_CBox_Repair, 0) AS OPTION_1_CBox_Repair, 	
		IFNULL(i.OPTION_1_CBox_Switch, 0) AS OPTION_1_CBox_Switch, IFNULL(i.OPTION_1_CBox_Existing, 0) AS OPTION_1_CBox_Existing, 	
		IFNULL(i.OPTION_2_CBox_Other, 0) AS OPTION_2_CBox_Other, IFNULL(i.OPTION_2_CBox_Hospice, 0) AS OPTION_2_CBox_Hospice, 	
		IFNULL(i.OPTION_2_CBox_Hospital, 0) AS OPTION_2_CBox_Hospital, i.hospiceTBox, 
		IFNULL(i.OPTION_3_CBox_Medicare, 0) AS OPTION_3_CBox_Medicare, 
		IFNULL(i.OPTION_3_CBox_PrivateInsurance, 0) AS OPTION_3_CBox_PrivateInsurance, 
		IFNULL(i.OPTION_3_CBox_Medicaid, 0) AS OPTION_3_CBox_Medicaid, 
		IFNULL(i.OPTION_3_CBox_PrivatePay, 0) AS OPTION_3_CBox_PrivatePay, i.hospitalTBox, i.DischargeDateMM, 	
		i.DischargeDateDD, i.DischargeDateYY, i.typeOfPay_Radio, i.callerFNameTBox, i.callerMInitialTBox, i.callerLNameTBox, 
		i.callerPhoneTBox, e.FName AS patientFNameTBox, LEFT(e.MName, 1) AS patientMInitialTBox, e.LName AS patientLNameTBox, 
		e.MaritalStatus, i.roomNumberTBox, i.bedNumberTBox, 	a.AddressLine1 AS patientAddressTBox, a.City AS patientCityTBox, 
		a.StateID AS patientStateTBox, a.ZipCode AS  patientZipTBox, ph.PhoneNumber AS patientPhoneTBox, 
		MONTH(e.DOB) AS patientDOBMM, DAY(e.DOB) AS patientDOBDD, YEAR(e.DOB) AS patientDOBYY, e.SSN AS patientSSNTBox,  
		e.HeightInInches AS patientHeightInches, e.Weight AS patientWeightTBox, i.alternateContactFNameTBox, i.alternateContactMInitialTBox, 
		i.alternateContactLNameTBox, i.alternateContactRelationshipTBox, i.alternateContactPhoneTBox, i.alternateContactWorkPhoneTBox, 
		i.poNumberTBox, i.creditCardTypeTBox, i.creditCardNumberTBox, i.ccDateMM, i.ccDateDD, i.ccDateYY, i.orderingPhysicianFNameTBox, 
		i.orderingPhysicianMInitialTBox, i.orderingPhysicianLNameTBox, i.orderingPhysicianPhoneTBox, i.orderingPhysicianUPINTBox, 
		i.orderingPhysicianFaxTBox, i.orderingPhysicianAddressTBox, i.orderingPhysicianCityTBox, i.orderingPhysicianStateTBox, i.orderingPhysicianZipTBox, 
		IFNULL(i.OPTION_13_CBox_PastEquipmentYes, 0) AS OPTION_13_CBox_PastEquipmentYes, 
		IFNULL(i.OPTION_13_CBox_PastEquipmentNo, 0) AS OPTION_13_CBox_PastEquipmentNo, i.Equipment1TypeTBox, i.Equipment1RentPurchasedSelect, 
		i.Equipment1FromMM, i.Equipment1FromDD, i.Equipment1FromYY, i.Equipment1ToMM, i.Equipment1ToDD, i.Equipment1ToYY, i.Equipment1SupplierNameTBox, 
		i.Equipment1SupplierTelephoneTBox, i.Equipment2TypeTBox, i.Equipment2RentPurchasedSelect, i.Equipment2FromMM, i.Equipment2FromDD, i.Equipment2FromYY, 
		i.Equipment2ToMM, i.Equipment2ToDD, i.Equipment2ToYY, i.Equipment2SupplierNameTBox, i.Equipment2SupplierTelephoneTBox, 	i.Equipment3TypeTBox, 
		i.Equipment3RentPurchasedSelect, i.Equipment3FromMM, i.Equipment3FromDD, i.Equipment3FromYY, i.Equipment3ToMM, i.Equipment3ToDD, 
		i.Equipment3ToYY, i.Equipment3SupplierNameTBox, i.Equipment3SupplierTelephoneTBox, i.Equipment4TypeTBox, i.Equipment4RentPurchasedSelect, 
		i.Equipment4FromMM, i.Equipment4FromDD, i.Equipment4FromYY, i.Equipment4ToMM, i.Equipment4ToDD, i.Equipment4ToYY, i.Equipment4SupplierNameTBox, 
		i.Equipment4SupplierTelephoneTBox, i.Equipment5TypeTBox, i.Equipment5RentPurchasedSelect, i.Equipment5FromMM, i.Equipment5FromDD, i.Equipment5FromYY, 
		i.Equipment5ToMM, i.Equipment5ToDD, i.Equipment5ToYY, i.Equipment5SupplierNameTBox, i.Equipment5SupplierTelephoneTBox, 
		IFNULL(i.OPTION_14_CBox_OxygenPAo2, 0) AS OPTION_14_CBox_OxygenPAo2, 
		IFNULL(i.OPTION_14_CBox_OxygenSAo2, 0) AS OPTION_14_CBox_OxygenSAo2, 
		IFNULL(i.OPTION_14_CBox_OxygenSPo2, 0) AS OPTION_14_CBox_OxygenSPo2, 
		i.OxygenPAO2TBox, i.OxygenSAO2TBox, 
		IFNULL(i.CPAPStudy_CBox, 0) AS CPAPStudy_CBox, i.CPAPStudyNote, i.OxygenSPO2TBox, 
		IFNULL(i.CPAPStudyOnFile_CBox, 0) AS CPAPStudyOnFile_CBox, 
		i.CPAPStudyOnFileNote, i.LabTestDateMM, i.LabTestDateDD, i.LabTestDateYY, i.CPAPStudyPerformedAt, i.LabTestFacilityTBox, i.CPAPStudyPerformedAt2, 
		i.CPAPStudyPerformedAt3, IFNULL(e.Sex,-1) AS OPTION_3a_CBox_PatientSex, i.Equipment1NoteTBox, i.Equipment2NoteTBox, i.Equipment3NoteTBox, 
		i.Equipment4NoteTBox, i.Equipment5NoteTBox, i.OPTION_SkilledNursing, i.SkilledNursingName, i.SkilledNursingTelephone, i.active, i.closingInvoiceNumber,	
		ih.*
		FROM Intake i 
		LEFT JOIN IntakeHCPC ih ON i.intakeID = ih.IntakeID	
		LEFT JOIN Patient p ON i.PatientID = p.PatientID
		LEFT JOIN Entity e ON e.EntityID = p.EntityID 		
		LEFT JOIN Address a ON i.PatientAddressID = a.AddressID
		LEFT JOIN Phone ph ON i.PatientPhoneID = ph.PhoneID   
		WHERE i.intakeID = #trim(caller.intakeID)#
	</cfquery>
	
	