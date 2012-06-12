<!-------------------------------------------------------------------------------------->
<!--- NAME:                                                                          --->
<!--- @@Name@@                                                                       --->
<!--- IntakeIO.cfc                                                                   --->
<!--- @@Name@@                                                                       --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- CATEGORY:                                                                      --->
<!--- @@CATEGORY@@                                                                   --->
<!--- CFC                                                                            --->
<!--- @@CATEGORY@@                                                                   --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- AUTHOR:                                                                        --->
<!--- @@AUTHOR@@                                                                     --->
<!--- Guillermo Cruz                                                                 --->
<!--- @@AUTHOR@@                                                                     --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- DESCRIPTION:                                                                   ---> 
<!--- @@DESCRIPTION@@                                                                --->
<!--- This tag is a CFC tag tied to the Intake table in the dB.                      --->  
<!--- @@DESCRIPTION@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- EXAMPLE CALL:                                                                  --->
<!--- @@ExampleCall@@                                                                --->
<!--- &lt;cf_db_Get_IntakeTable                                                      --->  
<!--- @@ExampleCall@@                                                                --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- REQUIRED PARAMETERS:                                                           --->
<!--- @@RequiredParameters@@                                                         --->
<!--- [None]                                                                         --->  
<!--- @@RequiredParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- OPTIONAL PARAMETERS:                                                           --->
<!--- @@OptionalParameters@@                                                         --->
<!--- Queryname<br>                                                                  --->
<!--- fields<br>                                                                     --->
<!--- orderby<br>                                                                    --->
<!--- groupby (same as fields contents maybe different order)<br>                    --->
<!--- andclause example.... (CN1= Column Name)                                       --->
<!--- [ andclause="RTRIM(CN1)+''+RTRIM(CN2)='#Var#'" ]<br>                           --->
<!--- IntakeID<br>                                                                   --->
<!--- ClientID<br>                                                                   --->
<!--- AssignedToUserID<br>                                                           --->
<!--- hidden_Step<br>                                                                --->
<!--- hidden_UsersID<br>                                                             --->
<!--- hidden_TimeStart<br>                                                           --->
<!--- OPTION_1_CBox_Delivery<br>                                                     --->
<!--- OPTION_1_CBox_Pickup<br>                                                       --->
<!--- OPTION_1_CBox_Repair<br>                                                       --->
<!--- OPTION_1_CBox_Switch<br>                                                       --->
<!--- OPTION_1_CBox_Existing<br>                                                     --->
<!--- OPTION_2_CBox_Other<br>                                                        --->
<!--- OPTION_2_CBox_Hospice<br>                                                      --->
<!--- OPTION_2_CBox_Hospital<br>                                                     --->
<!--- otherTBox<br>                                                                  --->
<!--- hospiceTBox<br>                                                                --->
<!--- OPTION_3_CBox_Medicare<br>                                                     --->
<!--- OPTION_3_CBox_PrivateInsurance<br>                                             --->
<!--- OPTION_3_CBox_Medicaid<br>                                                     --->
<!--- OPTION_3_CBox_PrivatePay<br>                                                   --->
<!--- hospitalTBox<br>                                                               --->
<!--- DischargeDateMM<br>                                                            --->
<!--- DischargeDateDD<br>                                                            --->
<!--- DischargeDateYY<br>                                                            --->
<!--- typeOfPay_Radio<br>                                                            --->
<!--- callerFNameTBox<br>                                                            --->
<!--- callerMInitialTBox<br>                                                         --->
<!--- callerLNameTBox<br>                                                            --->
<!--- callerPhoneTBox<br>                                                            --->
<!--- patientXML<br>                                                                 --->
<!--- patientID<br>                                                                  --->
<!--- patientAddressID<br>                                                           --->
<!--- patientPhoneID<br>                                                             --->
<!--- roomNumberTBox<br>                                                             --->
<!--- bedNumberTBox<br>                                                              --->
<!--- alternateContactFNameTBox<br>                                                  --->
<!--- alternateContactMInitialTBox<br>                                               --->
<!--- alternateContactLNameTBox<br>                                                  --->
<!--- alternateContactRelationshipTBox<br>                                           --->
<!--- alternateContactPhoneTBox<br>                                                  --->
<!--- alternateContactWorkPhoneTBox<br>                                              --->
<!--- poNumberTBox<br>                                                               --->
<!--- creditCardTypeTBox<br>                                                         --->
<!--- creditCardNumberTBox<br>                                                       --->
<!--- ccDateMM<br>                                                                   --->
<!--- ccDateDD<br>                                                                   --->
<!--- ccDateYY<br>                                                                   --->
<!--- orderingPhysicianFNameTBox<br>                                                 --->
<!--- orderingPhysicianMInitialTBox<br>                                              --->
<!--- orderingPhysicianLNameTBox<br>                                                 --->
<!--- orderingPhysicianPhoneTBox<br>                                                 --->
<!--- orderingPhysicianUPINTBox<br>                                                  --->
<!--- orderingPhysicianFaxTBox<br>                                                   --->
<!--- orderingPhysicianAddressTBox<br>                                               --->
<!--- orderingPhysicianCityTBox<br>                                                  --->
<!--- orderingPhysicianStateTBox<br>                                                 --->
<!--- orderingPhysicianZipTBox<br>                                                   --->
<!--- OPTION_13_CBox_PastEquipmentYes<br>                                            --->
<!--- OPTION_13_CBox_PastEquipmentNo<br>                                             --->
<!--- Equipment1TypeTBox<br>                                                         --->
<!--- Equipment1RentPurchasedSelect<br>                                              --->
<!--- Equipment1FromMM<br>                                                           --->
<!--- Equipment1FromDD<br>                                                           --->
<!--- Equipment1FromYY<br>                                                           --->
<!--- Equipment1ToMM<br>                                                             --->
<!--- Equipment1ToDD<br>                                                             --->
<!--- Equipment1ToYY<br>                                                             --->
<!--- Equipment1SupplierNameTBox<br>                                                 --->
<!--- Equipment1SupplierTelephoneTBox<br>                                            --->
<!--- Equipment2TypeTBox<br>                                                         --->
<!--- Equipment2RentPurchasedSelect<br>                                              --->
<!--- Equipment2FromMM<br>                                                           --->
<!--- Equipment2FromDD<br>                                                           --->
<!--- Equipment2FromYY<br>                                                           --->
<!--- Equipment2ToMM<br>                                                             --->
<!--- Equipment2ToDD<br>                                                             --->
<!--- Equipment2ToYY<br>                                                             --->
<!--- Equipment2SupplierNameTBox<br>                                                 --->
<!--- Equipment2SupplierTelephoneTBox<br>                                            --->
<!--- Equipment3TypeTBox<br>                                                         --->
<!--- Equipment3RentPurchasedSelect<br>                                              --->
<!--- Equipment3FromMM<br>                                                           --->
<!--- Equipment3FromDD<br>                                                           --->
<!--- Equipment3FromYY<br>                                                           --->
<!--- Equipment3ToMM<br>                                                             --->
<!--- Equipment3ToDD<br>                                                             --->
<!--- Equipment3ToYY<br>                                                             --->
<!--- Equipment3SupplierNameTBox<br>                                                 --->
<!--- Equipment3SupplierTelephoneTBox<br>                                            --->
<!--- Equipment4TypeTBox<br>                                                         --->
<!--- Equipment4RentPurchasedSelect<br>                                              --->
<!--- Equipment4FromMM<br>                                                           --->
<!--- Equipment4FromDD<br>                                                           --->
<!--- Equipment4FromYY<br>                                                           --->
<!--- Equipment4ToMM<br>                                                             --->
<!--- Equipment4ToDD<br>                                                             --->
<!--- Equipment4ToYY<br>                                                             --->
<!--- Equipment4SupplierNameTBox<br>                                                 --->
<!--- Equipment4SupplierTelephoneTBox<br>                                            --->
<!--- Equipment5TypeTBox<br>                                                         --->
<!--- Equipment5RentPurchasedSelect<br>                                              --->
<!--- Equipment5FromMM<br>                                                           --->
<!--- Equipment5FromDD<br>                                                           --->
<!--- Equipment5FromYY<br>                                                           --->
<!--- Equipment5ToMM<br>                                                             --->
<!--- Equipment5ToDD<br>                                                             --->
<!--- Equipment5ToYY<br>                                                             --->
<!--- Equipment5SupplierNameTBox<br>                                                 --->
<!--- Equipment5SupplierTelephoneTBox<br>                                            --->
<!--- Equipment1NoteTBox<br>                                                         --->
<!--- Equipment2NoteTBox<br>                                                         --->
<!--- Equipment3NoteTBox<br>                                                         --->
<!--- Equipment4NoteTBox<br>                                                         --->
<!--- Equipment5NoteTBox<br>                                                         --->
<!--- OPTION_14_CBox_OxygenPAo2<br>                                                  --->
<!--- OPTION_14_CBox_OxygenSAo2<br>                                                  --->
<!--- OPTION_14_CBox_OxygenSPo2<br>                                                  --->
<!--- OxygenPAO2TBox<br>                                                             --->
<!--- OxygenSAO2TBox<br>                                                             --->
<!--- CPAPStudy_CBox<br>                                                             --->
<!--- CPAPStudyNote<br>                                                              --->
<!--- OxygenSPO2TBox<br>                                                             --->
<!--- CPAPStudyOnFile_CBox<br>                                                       --->
<!--- CPAPStudyOnFileNote<br>                                                        --->
<!--- LabTestDateMM<br>                                                              --->
<!--- LabTestDateDD<br>                                                              --->
<!--- LabTestDateYY<br>                                                              --->
<!--- CPAPStudyPerformedAt<br>                                                       --->
<!--- LabTestFacilityTBox<br>                                                        --->
<!--- CPAPStudyPerformedAt2<br>                                                      --->
<!--- CPAPStudyPerformedAt3<br>                                                      --->
<!--- ClosingInvoiceNumber<br>                                                       --->
<!--- OPTION_SkilledNursing<br>                                                      --->
<!--- SkilledNursingName<br>                                                         --->
<!--- SkilledNursingTelephone<br>                                                    --->
<!--- Printed<br>                                                                    --->
<!--- Active<br>                                                                     --->
<!--- InactiveCode<br>                                                               --->
<!--- DateCreated<br>                                                                --->
<!--- DateModified<br>                                                               --->  
<!--- @@OptionalParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- RETURNED PARAMETERS:                                                           --->
<!--- @@ReturnedParameters@@                                                         --->
<!--- recordID                                                                       --->  
<!--- @@ReturnedParameters@@                                                         --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->
<!--- HISTORY:                                                                       --->
<!--- @@HISTORY@@                                                                    ---> 	
<!--- Created 02/18/2009                                                             --->
<!--- @@HISTORY@@                                                                    --->
<!---                                                                                --->
<!-------------------------------------------------------------------------------------->


<cfcomponent name="IntakeIO">

	<cfset reset()>
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function when creating the obejct and anytime you need to clear the   --->
	<!--- object to work with another instance while using the same object.              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="reset" access="public" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- Creat instance variables for each of the column names                          --->
		<!--- that will have a GET and SET method.                                           --->
		<!-------------------------------------------------------------------------------------->
		<cfscript>
			variables.instance.changedVariables = "";
			variables.instance.IntakeID = "NULL";
			variables.instance.ClientID = "NULL";
			variables.instance.AssignedToUserID = "NULL";
			variables.instance.hidden_Step = "";
			variables.instance.hidden_UsersID = "";
			variables.instance.hidden_TimeStart = "";
			variables.instance.OPTION_1_CBox_Delivery = "";
			variables.instance.OPTION_1_CBox_Pickup = "";
			variables.instance.OPTION_1_CBox_Repair = "";
			variables.instance.OPTION_1_CBox_Switch = "";
			variables.instance.OPTION_1_CBox_Existing = "";
			variables.instance.OPTION_2_CBox_Other = "";
			variables.instance.OPTION_2_CBox_Hospice = "";
			variables.instance.OPTION_2_CBox_Hospital = "";
			variables.instance.otherTBox = "";
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
			variables.instance.callerFNameTBox = "";
			variables.instance.callerMInitialTBox = "";
			variables.instance.callerLNameTBox = "";
			variables.instance.callerPhoneTBox = "";
			variables.instance.patientXML = "";
			variables.instance.patientID = "NULL";
			variables.instance.patientAddressID = "NULL";
			variables.instance.patientPhoneID = "NULL";
			variables.instance.roomNumberTBox = "";
			variables.instance.bedNumberTBox = "";
			variables.instance.alternateContactFNameTBox = "";
			variables.instance.alternateContactMInitialTBox = "";
			variables.instance.alternateContactLNameTBox = "";
			variables.instance.alternateContactRelationshipTBox = "";
			variables.instance.alternateContactPhoneTBox = "";
			variables.instance.alternateContactWorkPhoneTBox = "";
			variables.instance.poNumberTBox = "";
			variables.instance.creditCardTypeTBox = "";
			variables.instance.creditCardNumberTBox = "";
			variables.instance.ccDateMM = "";
			variables.instance.ccDateDD = "";
			variables.instance.ccDateYY = "";
			variables.instance.orderingPhysicianFNameTBox = "";
			variables.instance.orderingPhysicianMInitialTBox = "";
			variables.instance.orderingPhysicianLNameTBox = "";
			variables.instance.orderingPhysicianPhoneTBox = "";
			variables.instance.orderingPhysicianUPINTBox = "";
			variables.instance.orderingPhysicianFaxTBox = "";
			variables.instance.orderingPhysicianAddressTBox = "";
			variables.instance.orderingPhysicianCityTBox = "";
			variables.instance.orderingPhysicianStateTBox = "";
			variables.instance.orderingPhysicianZipTBox = "";
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
			variables.instance.Equipment1NoteTBox = "";
			variables.instance.Equipment2NoteTBox = "";
			variables.instance.Equipment3NoteTBox = "";
			variables.instance.Equipment4NoteTBox = "";
			variables.instance.Equipment5NoteTBox = "";
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
			variables.instance.ClosingInvoiceNumber = "";
			variables.instance.OPTION_SkilledNursing = "";
			variables.instance.SkilledNursingName = "";
			variables.instance.SkilledNursingTelephone = "";
			variables.instance.Printed = "";
			variables.instance.Active = "";
			variables.instance.InactiveCode = "NULL";
			variables.instance.DateCreated = "";
			variables.instance.DateModified = "";		
		</cfscript>
		
	</cffunction>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create a query that will hold the defualt values of the                        --->
<!--- columns in the table.                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfset defaultsQuery = QueryNew("COLUMN_NAME,IS_NULLABLE,COLUMN_DEFAULT,DATA_TYPE")>
	<cfset temp = QueryAddRow(defaultsQuery, 140)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INTAKEID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLIENTID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CALLERMINITIALTBOX", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CALLERLNAMETBOX", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CALLERPHONETBOX", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTXML", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTID", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTADDRESSID", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PATIENTPHONEID", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ROOMNUMBERTBOX", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "BEDNUMBERTBOX", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ALTERNATECONTACTFNAMETBOX", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ALTERNATECONTACTMINITIALTBOX", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ALTERNATECONTACTLNAMETBOX", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 14)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ALTERNATECONTACTRELATIONSHIPTBOX", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 15)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ALTERNATECONTACTPHONETBOX", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 16)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ALTERNATECONTACTWORKPHONETBOX", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 17)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PONUMBERTBOX", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 18)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 18)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CREDITCARDTYPETBOX", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 19)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 19)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CREDITCARDNUMBERTBOX", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 20)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 20)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CCDATEMM", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 21)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 21)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CCDATEDD", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 22)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 22)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CCDATEYY", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 23)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 23)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANFNAMETBOX", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 24)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 24)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANMINITIALTBOX", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 25)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 25)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANLNAMETBOX", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 26)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 26)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANPHONETBOX", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 27)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 27)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANUPINTBOX", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 28)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 28)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANFAXTBOX", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 29)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 29)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANADDRESSTBOX", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 30)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 30)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANCITYTBOX", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 31)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 31)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANSTATETBOX", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 32)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 32)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ORDERINGPHYSICIANZIPTBOX", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 33)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 33)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_13_CBOX_PASTEQUIPMENTYES", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 34)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 34)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_13_CBOX_PASTEQUIPMENTNO", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 35)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 35)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1TYPETBOX", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 36)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 36)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1RENTPURCHASEDSELECT", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 37)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 37)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1FROMMM", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 38)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 38)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1FROMDD", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 39)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 39)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1FROMYY", 40)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 40)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 40)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 40)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1TOMM", 41)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 41)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 41)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 41)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1TODD", 42)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 42)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 42)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 42)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1TOYY", 43)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 43)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 43)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 43)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1SUPPLIERNAMETBOX", 44)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 44)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 44)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 44)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1SUPPLIERTELEPHONETBOX", 45)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 45)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 45)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 45)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2TYPETBOX", 46)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 46)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 46)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 46)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2RENTPURCHASEDSELECT", 47)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 47)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 47)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 47)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2FROMMM", 48)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 48)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 48)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 48)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2FROMDD", 49)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 49)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 49)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 49)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2FROMYY", 50)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 50)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 50)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 50)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2TOMM", 51)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 51)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 51)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 51)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2TODD", 52)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 52)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 52)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 52)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2TOYY", 53)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 53)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 53)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 53)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2SUPPLIERNAMETBOX", 54)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 54)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 54)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 54)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2SUPPLIERTELEPHONETBOX", 55)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 55)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 55)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 55)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3TYPETBOX", 56)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 56)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 56)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 56)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3RENTPURCHASEDSELECT", 57)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 57)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 57)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 57)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3FROMMM", 58)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 58)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 58)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 58)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3FROMDD", 59)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 59)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 59)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 59)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3FROMYY", 60)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 60)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 60)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 60)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3TOMM", 61)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 61)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 61)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 61)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3TODD", 62)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 62)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 62)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 62)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3TOYY", 63)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 63)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 63)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 63)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3SUPPLIERNAMETBOX", 64)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 64)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 64)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 64)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3SUPPLIERTELEPHONETBOX", 65)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 65)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 65)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 65)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4TYPETBOX", 66)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 66)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 66)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 66)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4RENTPURCHASEDSELECT", 67)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 67)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 67)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 67)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4FROMMM", 68)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 68)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 68)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 68)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4FROMDD", 69)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 69)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 69)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 69)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4FROMYY", 70)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 70)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 70)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 70)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4TOMM", 71)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 71)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 71)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 71)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4TODD", 72)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 72)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 72)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 72)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4TOYY", 73)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 73)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 73)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 73)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4SUPPLIERNAMETBOX", 74)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 74)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 74)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 74)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4SUPPLIERTELEPHONETBOX", 75)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 75)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 75)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 75)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5TYPETBOX", 76)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 76)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 76)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 76)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5RENTPURCHASEDSELECT", 77)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 77)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 77)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 77)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5FROMMM", 78)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 78)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 78)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 78)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5FROMDD", 79)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 79)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 79)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 79)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5FROMYY", 80)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 80)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 80)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 80)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5TOMM", 81)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 81)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 81)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 81)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5TODD", 82)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 82)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 82)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 82)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5TOYY", 83)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 83)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 83)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 83)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5SUPPLIERNAMETBOX", 84)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 84)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 84)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 84)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5SUPPLIERTELEPHONETBOX", 85)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 85)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 85)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 85)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT1NOTETBOX", 86)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 86)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 86)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 86)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT2NOTETBOX", 87)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 87)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 87)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 87)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT3NOTETBOX", 88)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 88)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 88)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 88)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT4NOTETBOX", 89)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 89)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 89)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 89)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "EQUIPMENT5NOTETBOX", 90)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 90)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 90)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 90)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_14_CBOX_OXYGENPAO2", 91)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 91)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 91)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 91)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_14_CBOX_OXYGENSAO2", 92)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 92)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 92)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 92)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_14_CBOX_OXYGENSPO2", 93)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 93)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 93)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 93)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OXYGENPAO2TBOX", 94)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 94)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 94)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 94)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OXYGENSAO2TBOX", 95)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 95)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 95)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 95)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CPAPSTUDY_CBOX", 96)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 96)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 96)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 96)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CPAPSTUDYNOTE", 97)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 97)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 97)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 97)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OXYGENSPO2TBOX", 98)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 98)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 98)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 98)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CPAPSTUDYONFILE_CBOX", 99)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 99)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 99)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 99)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CPAPSTUDYONFILENOTE", 100)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 100)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 100)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 100)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LABTESTDATEMM", 101)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 101)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 101)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 101)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LABTESTDATEDD", 102)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 102)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 102)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 102)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LABTESTDATEYY", 103)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 103)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 103)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 103)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CPAPSTUDYPERFORMEDAT", 104)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 104)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 104)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 104)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LABTESTFACILITYTBOX", 105)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 105)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 105)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 105)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CPAPSTUDYPERFORMEDAT2", 106)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 106)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 106)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 106)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CPAPSTUDYPERFORMEDAT3", 107)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 107)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 107)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 107)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLOSINGINVOICENUMBER", 108)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 108)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 108)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 108)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_SKILLEDNURSING", 109)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 109)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 109)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 109)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SKILLEDNURSINGNAME", 110)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 110)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 110)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 110)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SKILLEDNURSINGTELEPHONE", 111)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 111)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 111)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 111)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "PRINTED", 112)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 112)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 112)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 112)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 113)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 113)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 113)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 113)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 114)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 114)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 114)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 114)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 115)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 115)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 115)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 115)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 116)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 116)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 116)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 116)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ASSIGNEDTOUSERID", 117)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 117)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 117)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 117)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HIDDEN_STEP", 118)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 118)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 118)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 118)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HIDDEN_USERSID", 119)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 119)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 119)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 119)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HIDDEN_TIMESTART", 120)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 120)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 120)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 120)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_1_CBOX_DELIVERY", 121)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 121)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 121)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 121)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_1_CBOX_PICKUP", 122)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 122)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 122)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 122)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_1_CBOX_REPAIR", 123)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 123)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 123)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 123)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_1_CBOX_SWITCH", 124)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 124)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 124)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 124)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_1_CBOX_EXISTING", 125)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 125)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 125)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 125)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_2_CBOX_OTHER", 126)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 126)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 126)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 126)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_2_CBOX_HOSPICE", 127)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 127)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 127)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 127)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_2_CBOX_HOSPITAL", 128)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 128)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 128)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 128)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OTHERTBOX", 129)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 129)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 129)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 129)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HOSPICETBOX", 130)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 130)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 130)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 130)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_3_CBOX_MEDICARE", 131)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 131)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 131)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 131)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_3_CBOX_PRIVATEINSURANCE", 132)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 132)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 132)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 132)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_3_CBOX_MEDICAID", 133)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 133)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 133)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 133)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "OPTION_3_CBOX_PRIVATEPAY", 134)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 134)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 134)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 134)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "HOSPITALTBOX", 135)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 135)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 135)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 135)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DISCHARGEDATEMM", 136)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 136)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 136)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 136)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DISCHARGEDATEDD", 137)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 137)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 137)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 137)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DISCHARGEDATEYY", 138)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 138)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 138)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 138)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "TYPEOFPAY_RADIO", 139)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 139)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 139)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 139)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CALLERFNAMETBOX", 140)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 140)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 140)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 140)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for IntakeID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getIntakeID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.IntakeID>
	</cffunction>
	 
	<cffunction name="setIntakeID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="IntakeID" required="Yes" type="String">
		
		<cfif IntakeID NEQ "NULL">	
			
			<cfif arguments.IntakeID EQ "@@" OR arguments.IntakeID EQ "">
				
				<cfset arguments.IntakeID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(IntakeID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>IntakeID</strong> (#IntakeID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.IntakeID = arguments.IntakeID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClientID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClientID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClientID>
	</cffunction>
	 
	<cffunction name="setClientID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClientID" required="Yes" type="String">
		
		<cfif ClientID NEQ "NULL">	
			
			<cfif arguments.ClientID EQ "@@" OR arguments.ClientID EQ "">
				
				<cfset arguments.ClientID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClientID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClientID</strong> (#ClientID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClientID = arguments.ClientID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClientID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for AssignedToUserID.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAssignedToUserID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AssignedToUserID>
	</cffunction>
	 
	<cffunction name="setAssignedToUserID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AssignedToUserID" required="Yes" type="String">
		
		<cfif AssignedToUserID NEQ "NULL">	
			
			<cfif arguments.AssignedToUserID EQ "@@" OR arguments.AssignedToUserID EQ "">
				
				<cfset arguments.AssignedToUserID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(AssignedToUserID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AssignedToUserID</strong> (#AssignedToUserID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AssignedToUserID = arguments.AssignedToUserID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AssignedToUserID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hidden_Step.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHidden_Step" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Hidden_Step>
	</cffunction>
	 
	<cffunction name="setHidden_Step" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Hidden_Step" required="Yes" type="String">
		
		<cfif Hidden_Step NEQ "NULL">	
			
			<cfif arguments.hidden_Step EQ "@@" OR arguments.hidden_Step EQ "">
				
				<cfset arguments.hidden_Step = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Hidden_Step)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Hidden_Step</strong> (#Hidden_Step#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hidden_Step) GT 1000>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Hidden_Step</strong> cannot be greater than 1000 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Hidden_Step = arguments.Hidden_Step>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Hidden_Step")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hidden_UsersID.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHidden_UsersID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Hidden_UsersID>
	</cffunction>
	 
	<cffunction name="setHidden_UsersID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Hidden_UsersID" required="Yes" type="String">
		
		<cfif Hidden_UsersID NEQ "NULL">	
			
			<cfif arguments.hidden_UsersID EQ "@@" OR arguments.hidden_UsersID EQ "">
				
				<cfset arguments.hidden_UsersID = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Hidden_UsersID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Hidden_UsersID</strong> (#Hidden_UsersID#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hidden_UsersID) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Hidden_UsersID</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Hidden_UsersID = arguments.Hidden_UsersID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Hidden_UsersID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for hidden_TimeStart.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getHidden_TimeStart" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Hidden_TimeStart>
	</cffunction>
	 
	<cffunction name="setHidden_TimeStart" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Hidden_TimeStart" required="Yes" type="String">
		
		<cfif Hidden_TimeStart NEQ "NULL">	
			
			<cfif arguments.hidden_TimeStart EQ "@@" OR arguments.hidden_TimeStart EQ "">
				
				<cfset arguments.hidden_TimeStart = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Hidden_TimeStart)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Hidden_TimeStart</strong> (#Hidden_TimeStart#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hidden_TimeStart) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Hidden_TimeStart</strong> cannot be greater than 20 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Hidden_TimeStart = arguments.Hidden_TimeStart>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Hidden_TimeStart")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_1_CBox_Delivery.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_1_CBox_Delivery" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_1_CBox_Delivery>
	</cffunction>
	 
	<cffunction name="setOPTION_1_CBox_Delivery" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_1_CBox_Delivery" required="Yes" type="String">
		
		<cfif OPTION_1_CBox_Delivery NEQ "NULL">	
			
			<cfif arguments.OPTION_1_CBox_Delivery EQ "@@" OR arguments.OPTION_1_CBox_Delivery EQ "">
				
				<cfset arguments.OPTION_1_CBox_Delivery = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OPTION_1_CBox_Delivery)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_1_CBox_Delivery</strong> (#OPTION_1_CBox_Delivery#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_1_CBox_Delivery) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_1_CBox_Delivery</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.OPTION_1_CBox_Delivery = arguments.OPTION_1_CBox_Delivery>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_1_CBox_Delivery")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_1_CBox_Pickup.                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_1_CBox_Pickup" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_1_CBox_Pickup>
	</cffunction>
	 
	<cffunction name="setOPTION_1_CBox_Pickup" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_1_CBox_Pickup" required="Yes" type="String">
		
		<cfif OPTION_1_CBox_Pickup NEQ "NULL">	
			
			<cfif arguments.OPTION_1_CBox_Pickup EQ "@@" OR arguments.OPTION_1_CBox_Pickup EQ "">
				
				<cfset arguments.OPTION_1_CBox_Pickup = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OPTION_1_CBox_Pickup)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_1_CBox_Pickup</strong> (#OPTION_1_CBox_Pickup#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_1_CBox_Pickup) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_1_CBox_Pickup</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.OPTION_1_CBox_Pickup = arguments.OPTION_1_CBox_Pickup>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_1_CBox_Pickup")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_1_CBox_Repair.                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_1_CBox_Repair" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_1_CBox_Repair>
	</cffunction>
	 
	<cffunction name="setOPTION_1_CBox_Repair" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_1_CBox_Repair" required="Yes" type="String">
		
		<cfif OPTION_1_CBox_Repair NEQ "NULL">	
			
			<cfif arguments.OPTION_1_CBox_Repair EQ "@@" OR arguments.OPTION_1_CBox_Repair EQ "">
				
				<cfset arguments.OPTION_1_CBox_Repair = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OPTION_1_CBox_Repair)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_1_CBox_Repair</strong> (#OPTION_1_CBox_Repair#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_1_CBox_Repair) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_1_CBox_Repair</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.OPTION_1_CBox_Repair = arguments.OPTION_1_CBox_Repair>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_1_CBox_Repair")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_1_CBox_Switch.                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_1_CBox_Switch" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_1_CBox_Switch>
	</cffunction>
	 
	<cffunction name="setOPTION_1_CBox_Switch" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_1_CBox_Switch" required="Yes" type="String">
		
		<cfif OPTION_1_CBox_Switch NEQ "NULL">	
			
			<cfif arguments.OPTION_1_CBox_Switch EQ "@@" OR arguments.OPTION_1_CBox_Switch EQ "">
				
				<cfset arguments.OPTION_1_CBox_Switch = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OPTION_1_CBox_Switch)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_1_CBox_Switch</strong> (#OPTION_1_CBox_Switch#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_1_CBox_Switch) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_1_CBox_Switch</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.OPTION_1_CBox_Switch = arguments.OPTION_1_CBox_Switch>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_1_CBox_Switch")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_1_CBox_Existing.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_1_CBox_Existing" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_1_CBox_Existing>
	</cffunction>
	 
	<cffunction name="setOPTION_1_CBox_Existing" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_1_CBox_Existing" required="Yes" type="String">
		
		<cfif OPTION_1_CBox_Existing NEQ "NULL">	
			
			<cfif arguments.OPTION_1_CBox_Existing EQ "@@" OR arguments.OPTION_1_CBox_Existing EQ "">
				
				<cfset arguments.OPTION_1_CBox_Existing = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OPTION_1_CBox_Existing)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_1_CBox_Existing</strong> (#OPTION_1_CBox_Existing#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_1_CBox_Existing) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_1_CBox_Existing</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.OPTION_1_CBox_Existing = arguments.OPTION_1_CBox_Existing>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_1_CBox_Existing")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_2_CBox_Other.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_2_CBox_Other" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_2_CBox_Other>
	</cffunction>
	 
	<cffunction name="setOPTION_2_CBox_Other" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_2_CBox_Other" required="Yes" type="String">
		
		<cfif OPTION_2_CBox_Other NEQ "NULL">	
			
			<cfif arguments.OPTION_2_CBox_Other EQ "@@" OR arguments.OPTION_2_CBox_Other EQ "">
				
				<cfset arguments.OPTION_2_CBox_Other = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OPTION_2_CBox_Other)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_2_CBox_Other</strong> (#OPTION_2_CBox_Other#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_2_CBox_Other) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_2_CBox_Other</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.OPTION_2_CBox_Other = arguments.OPTION_2_CBox_Other>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_2_CBox_Other")>			
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
			
			<cfif arguments.OPTION_2_CBox_Hospice EQ "@@" OR arguments.OPTION_2_CBox_Hospice EQ "">
				
				<cfset arguments.OPTION_2_CBox_Hospice = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OPTION_2_CBox_Hospice)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_2_CBox_Hospice</strong> (#OPTION_2_CBox_Hospice#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_2_CBox_Hospice) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_2_CBox_Hospice</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.OPTION_2_CBox_Hospital EQ "@@" OR arguments.OPTION_2_CBox_Hospital EQ "">
				
				<cfset arguments.OPTION_2_CBox_Hospital = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OPTION_2_CBox_Hospital)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_2_CBox_Hospital</strong> (#OPTION_2_CBox_Hospital#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_2_CBox_Hospital) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_2_CBox_Hospital</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.OPTION_2_CBox_Hospital = arguments.OPTION_2_CBox_Hospital>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_2_CBox_Hospital")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for otherTBox.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOtherTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OtherTBox>
	</cffunction>
	 
	<cffunction name="setOtherTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OtherTBox" required="Yes" type="String">
		
		<cfif OtherTBox NEQ "NULL">	
			
			<cfif arguments.otherTBox EQ "@@" OR arguments.otherTBox EQ "">
				
				<cfset arguments.otherTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OtherTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OtherTBox</strong> (#OtherTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(otherTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OtherTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.OtherTBox = arguments.OtherTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OtherTBox")>			
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
			
			<cfif arguments.hospiceTBox EQ "@@" OR arguments.hospiceTBox EQ "">
				
				<cfset arguments.hospiceTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HospiceTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HospiceTBox</strong> (#HospiceTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hospiceTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HospiceTBox</strong> cannot be greater than 100 character(s).">
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
			
			<cfif arguments.OPTION_3_CBox_Medicare EQ "@@" OR arguments.OPTION_3_CBox_Medicare EQ "">
				
				<cfset arguments.OPTION_3_CBox_Medicare = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OPTION_3_CBox_Medicare)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_3_CBox_Medicare</strong> (#OPTION_3_CBox_Medicare#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_3_CBox_Medicare) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_3_CBox_Medicare</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.OPTION_3_CBox_PrivateInsurance EQ "@@" OR arguments.OPTION_3_CBox_PrivateInsurance EQ "">
				
				<cfset arguments.OPTION_3_CBox_PrivateInsurance = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OPTION_3_CBox_PrivateInsurance)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_3_CBox_PrivateInsurance</strong> (#OPTION_3_CBox_PrivateInsurance#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_3_CBox_PrivateInsurance) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_3_CBox_PrivateInsurance</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.OPTION_3_CBox_Medicaid EQ "@@" OR arguments.OPTION_3_CBox_Medicaid EQ "">
				
				<cfset arguments.OPTION_3_CBox_Medicaid = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OPTION_3_CBox_Medicaid)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_3_CBox_Medicaid</strong> (#OPTION_3_CBox_Medicaid#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_3_CBox_Medicaid) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_3_CBox_Medicaid</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.OPTION_3_CBox_PrivatePay EQ "@@" OR arguments.OPTION_3_CBox_PrivatePay EQ "">
				
				<cfset arguments.OPTION_3_CBox_PrivatePay = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OPTION_3_CBox_PrivatePay)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_3_CBox_PrivatePay</strong> (#OPTION_3_CBox_PrivatePay#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_3_CBox_PrivatePay) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_3_CBox_PrivatePay</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.hospitalTBox EQ "@@" OR arguments.hospitalTBox EQ "">
				
				<cfset arguments.hospitalTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(HospitalTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>HospitalTBox</strong> (#HospitalTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(hospitalTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>HospitalTBox</strong> cannot be greater than 100 character(s).">
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
			
			<cfif arguments.DischargeDateMM EQ "@@" OR arguments.DischargeDateMM EQ "">
				
				<cfset arguments.DischargeDateMM = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(DischargeDateMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DischargeDateMM</strong> (#DischargeDateMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(DischargeDateMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>DischargeDateMM</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.DischargeDateDD EQ "@@" OR arguments.DischargeDateDD EQ "">
				
				<cfset arguments.DischargeDateDD = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(DischargeDateDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DischargeDateDD</strong> (#DischargeDateDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(DischargeDateDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>DischargeDateDD</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.DischargeDateYY EQ "@@" OR arguments.DischargeDateYY EQ "">
				
				<cfset arguments.DischargeDateYY = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(DischargeDateYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DischargeDateYY</strong> (#DischargeDateYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(DischargeDateYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>DischargeDateYY</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.typeOfPay_Radio EQ "@@" OR arguments.typeOfPay_Radio EQ "">
				
				<cfset arguments.typeOfPay_Radio = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(TypeOfPay_Radio)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>TypeOfPay_Radio</strong> (#TypeOfPay_Radio#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(typeOfPay_Radio) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>TypeOfPay_Radio</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.TypeOfPay_Radio = arguments.TypeOfPay_Radio>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "TypeOfPay_Radio")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for callerFNameTBox.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCallerFNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CallerFNameTBox>
	</cffunction>
	 
	<cffunction name="setCallerFNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CallerFNameTBox" required="Yes" type="String">
		
		<cfif CallerFNameTBox NEQ "NULL">	
			
			<cfif arguments.callerFNameTBox EQ "@@" OR arguments.callerFNameTBox EQ "">
				
				<cfset arguments.callerFNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CallerFNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CallerFNameTBox</strong> (#CallerFNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(callerFNameTBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CallerFNameTBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CallerFNameTBox = arguments.CallerFNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CallerFNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for callerMInitialTBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCallerMInitialTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CallerMInitialTBox>
	</cffunction>
	 
	<cffunction name="setCallerMInitialTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CallerMInitialTBox" required="Yes" type="String">
		
		<cfif CallerMInitialTBox NEQ "NULL">	
			
			<cfif arguments.callerMInitialTBox EQ "@@" OR arguments.callerMInitialTBox EQ "">
				
				<cfset arguments.callerMInitialTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CallerMInitialTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CallerMInitialTBox</strong> (#CallerMInitialTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(callerMInitialTBox) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CallerMInitialTBox</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CallerMInitialTBox = arguments.CallerMInitialTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CallerMInitialTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for callerLNameTBox.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCallerLNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CallerLNameTBox>
	</cffunction>
	 
	<cffunction name="setCallerLNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CallerLNameTBox" required="Yes" type="String">
		
		<cfif CallerLNameTBox NEQ "NULL">	
			
			<cfif arguments.callerLNameTBox EQ "@@" OR arguments.callerLNameTBox EQ "">
				
				<cfset arguments.callerLNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CallerLNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CallerLNameTBox</strong> (#CallerLNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(callerLNameTBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CallerLNameTBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CallerLNameTBox = arguments.CallerLNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CallerLNameTBox")>			
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
			
			<cfif arguments.callerPhoneTBox EQ "@@" OR arguments.callerPhoneTBox EQ "">
				
				<cfset arguments.callerPhoneTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CallerPhoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CallerPhoneTBox</strong> (#CallerPhoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(callerPhoneTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CallerPhoneTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CallerPhoneTBox = arguments.CallerPhoneTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CallerPhoneTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientXML.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientXML" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientXML>
	</cffunction>
	 
	<cffunction name="setPatientXML" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientXML" required="Yes" type="String">
		
		<cfif PatientXML NEQ "NULL">	
			
			<cfif arguments.patientXML EQ "@@" OR arguments.patientXML EQ "">
				
				<cfset arguments.patientXML = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PatientXML)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientXML</strong> (#PatientXML#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(patientXML) GT 8000>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PatientXML</strong> cannot be greater than 8000 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientXML = arguments.PatientXML>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientXML")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientID.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientID>
	</cffunction>
	 
	<cffunction name="setPatientID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientID" required="Yes" type="String">
		
		<cfif PatientID NEQ "NULL">	
			
			<cfif arguments.patientID EQ "@@" OR arguments.patientID EQ "">
				
				<cfset arguments.patientID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(PatientID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientID</strong> (#PatientID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientID = arguments.PatientID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientAddressID.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientAddressID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientAddressID>
	</cffunction>
	 
	<cffunction name="setPatientAddressID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientAddressID" required="Yes" type="String">
		
		<cfif PatientAddressID NEQ "NULL">	
			
			<cfif arguments.patientAddressID EQ "@@" OR arguments.patientAddressID EQ "">
				
				<cfset arguments.patientAddressID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(PatientAddressID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientAddressID</strong> (#PatientAddressID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientAddressID = arguments.PatientAddressID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientAddressID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for patientPhoneID.                                         --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPatientPhoneID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.PatientPhoneID>
	</cffunction>
	 
	<cffunction name="setPatientPhoneID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="PatientPhoneID" required="Yes" type="String">
		
		<cfif PatientPhoneID NEQ "NULL">	
			
			<cfif arguments.patientPhoneID EQ "@@" OR arguments.patientPhoneID EQ "">
				
				<cfset arguments.patientPhoneID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(PatientPhoneID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PatientPhoneID</strong> (#PatientPhoneID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.PatientPhoneID = arguments.PatientPhoneID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "PatientPhoneID")>			
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
			
			<cfif arguments.roomNumberTBox EQ "@@" OR arguments.roomNumberTBox EQ "">
				
				<cfset arguments.roomNumberTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(RoomNumberTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>RoomNumberTBox</strong> (#RoomNumberTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(roomNumberTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>RoomNumberTBox</strong> cannot be greater than 100 character(s).">
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
			
			<cfif arguments.bedNumberTBox EQ "@@" OR arguments.bedNumberTBox EQ "">
				
				<cfset arguments.bedNumberTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(BedNumberTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>BedNumberTBox</strong> (#BedNumberTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(bedNumberTBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>BedNumberTBox</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.BedNumberTBox = arguments.BedNumberTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "BedNumberTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for alternateContactFNameTBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAlternateContactFNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AlternateContactFNameTBox>
	</cffunction>
	 
	<cffunction name="setAlternateContactFNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AlternateContactFNameTBox" required="Yes" type="String">
		
		<cfif AlternateContactFNameTBox NEQ "NULL">	
			
			<cfif arguments.alternateContactFNameTBox EQ "@@" OR arguments.alternateContactFNameTBox EQ "">
				
				<cfset arguments.alternateContactFNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(AlternateContactFNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AlternateContactFNameTBox</strong> (#AlternateContactFNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(alternateContactFNameTBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>AlternateContactFNameTBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AlternateContactFNameTBox = arguments.AlternateContactFNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AlternateContactFNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for alternateContactMInitialTBox.                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAlternateContactMInitialTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AlternateContactMInitialTBox>
	</cffunction>
	 
	<cffunction name="setAlternateContactMInitialTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AlternateContactMInitialTBox" required="Yes" type="String">
		
		<cfif AlternateContactMInitialTBox NEQ "NULL">	
			
			<cfif arguments.alternateContactMInitialTBox EQ "@@" OR arguments.alternateContactMInitialTBox EQ "">
				
				<cfset arguments.alternateContactMInitialTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(AlternateContactMInitialTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AlternateContactMInitialTBox</strong> (#AlternateContactMInitialTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(alternateContactMInitialTBox) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>AlternateContactMInitialTBox</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AlternateContactMInitialTBox = arguments.AlternateContactMInitialTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AlternateContactMInitialTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for alternateContactLNameTBox.                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAlternateContactLNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AlternateContactLNameTBox>
	</cffunction>
	 
	<cffunction name="setAlternateContactLNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AlternateContactLNameTBox" required="Yes" type="String">
		
		<cfif AlternateContactLNameTBox NEQ "NULL">	
			
			<cfif arguments.alternateContactLNameTBox EQ "@@" OR arguments.alternateContactLNameTBox EQ "">
				
				<cfset arguments.alternateContactLNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(AlternateContactLNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AlternateContactLNameTBox</strong> (#AlternateContactLNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(alternateContactLNameTBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>AlternateContactLNameTBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AlternateContactLNameTBox = arguments.AlternateContactLNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AlternateContactLNameTBox")>			
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
			
			<cfif arguments.alternateContactRelationshipTBox EQ "@@" OR arguments.alternateContactRelationshipTBox EQ "">
				
				<cfset arguments.alternateContactRelationshipTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(AlternateContactRelationshipTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AlternateContactRelationshipTBox</strong> (#AlternateContactRelationshipTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(alternateContactRelationshipTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>AlternateContactRelationshipTBox</strong> cannot be greater than 100 character(s).">
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
			
			<cfif arguments.alternateContactPhoneTBox EQ "@@" OR arguments.alternateContactPhoneTBox EQ "">
				
				<cfset arguments.alternateContactPhoneTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(AlternateContactPhoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AlternateContactPhoneTBox</strong> (#AlternateContactPhoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(alternateContactPhoneTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>AlternateContactPhoneTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AlternateContactPhoneTBox = arguments.AlternateContactPhoneTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AlternateContactPhoneTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for alternateContactWorkPhoneTBox.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getAlternateContactWorkPhoneTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.AlternateContactWorkPhoneTBox>
	</cffunction>
	 
	<cffunction name="setAlternateContactWorkPhoneTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="AlternateContactWorkPhoneTBox" required="Yes" type="String">
		
		<cfif AlternateContactWorkPhoneTBox NEQ "NULL">	
			
			<cfif arguments.alternateContactWorkPhoneTBox EQ "@@" OR arguments.alternateContactWorkPhoneTBox EQ "">
				
				<cfset arguments.alternateContactWorkPhoneTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(AlternateContactWorkPhoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>AlternateContactWorkPhoneTBox</strong> (#AlternateContactWorkPhoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(alternateContactWorkPhoneTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>AlternateContactWorkPhoneTBox</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.AlternateContactWorkPhoneTBox = arguments.AlternateContactWorkPhoneTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "AlternateContactWorkPhoneTBox")>			
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
			
			<cfif arguments.poNumberTBox EQ "@@" OR arguments.poNumberTBox EQ "">
				
				<cfset arguments.poNumberTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(PoNumberTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>PoNumberTBox</strong> (#PoNumberTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(poNumberTBox) GT 25>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>PoNumberTBox</strong> cannot be greater than 25 character(s).">
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
			
			<cfif arguments.creditCardTypeTBox EQ "@@" OR arguments.creditCardTypeTBox EQ "">
				
				<cfset arguments.creditCardTypeTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CreditCardTypeTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CreditCardTypeTBox</strong> (#CreditCardTypeTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(creditCardTypeTBox) GT 30>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CreditCardTypeTBox</strong> cannot be greater than 30 character(s).">
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
			
			<cfif arguments.creditCardNumberTBox EQ "@@" OR arguments.creditCardNumberTBox EQ "">
				
				<cfset arguments.creditCardNumberTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CreditCardNumberTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CreditCardNumberTBox</strong> (#CreditCardNumberTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(creditCardNumberTBox) GT 22>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CreditCardNumberTBox</strong> cannot be greater than 22 character(s).">
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
			
			<cfif arguments.ccDateMM EQ "@@" OR arguments.ccDateMM EQ "">
				
				<cfset arguments.ccDateMM = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CcDateMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CcDateMM</strong> (#CcDateMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ccDateMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CcDateMM</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.ccDateDD EQ "@@" OR arguments.ccDateDD EQ "">
				
				<cfset arguments.ccDateDD = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CcDateDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CcDateDD</strong> (#CcDateDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ccDateDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CcDateDD</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.ccDateYY EQ "@@" OR arguments.ccDateYY EQ "">
				
				<cfset arguments.ccDateYY = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CcDateYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CcDateYY</strong> (#CcDateYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ccDateYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CcDateYY</strong> cannot be greater than 10 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CcDateYY = arguments.CcDateYY>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CcDateYY")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for orderingPhysicianFNameTBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOrderingPhysicianFNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianFNameTBox>
	</cffunction>
	 
	<cffunction name="setOrderingPhysicianFNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OrderingPhysicianFNameTBox" required="Yes" type="String">
		
		<cfif OrderingPhysicianFNameTBox NEQ "NULL">	
			
			<cfif arguments.orderingPhysicianFNameTBox EQ "@@" OR arguments.orderingPhysicianFNameTBox EQ "">
				
				<cfset arguments.orderingPhysicianFNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OrderingPhysicianFNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianFNameTBox</strong> (#OrderingPhysicianFNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianFNameTBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianFNameTBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.OrderingPhysicianFNameTBox = arguments.OrderingPhysicianFNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OrderingPhysicianFNameTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for orderingPhysicianMInitialTBox.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOrderingPhysicianMInitialTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianMInitialTBox>
	</cffunction>
	 
	<cffunction name="setOrderingPhysicianMInitialTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OrderingPhysicianMInitialTBox" required="Yes" type="String">
		
		<cfif OrderingPhysicianMInitialTBox NEQ "NULL">	
			
			<cfif arguments.orderingPhysicianMInitialTBox EQ "@@" OR arguments.orderingPhysicianMInitialTBox EQ "">
				
				<cfset arguments.orderingPhysicianMInitialTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OrderingPhysicianMInitialTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianMInitialTBox</strong> (#OrderingPhysicianMInitialTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianMInitialTBox) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianMInitialTBox</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.OrderingPhysicianMInitialTBox = arguments.OrderingPhysicianMInitialTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OrderingPhysicianMInitialTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for orderingPhysicianLNameTBox.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOrderingPhysicianLNameTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OrderingPhysicianLNameTBox>
	</cffunction>
	 
	<cffunction name="setOrderingPhysicianLNameTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OrderingPhysicianLNameTBox" required="Yes" type="String">
		
		<cfif OrderingPhysicianLNameTBox NEQ "NULL">	
			
			<cfif arguments.orderingPhysicianLNameTBox EQ "@@" OR arguments.orderingPhysicianLNameTBox EQ "">
				
				<cfset arguments.orderingPhysicianLNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OrderingPhysicianLNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianLNameTBox</strong> (#OrderingPhysicianLNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianLNameTBox) GT 50>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianLNameTBox</strong> cannot be greater than 50 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.OrderingPhysicianLNameTBox = arguments.OrderingPhysicianLNameTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OrderingPhysicianLNameTBox")>			
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
			
			<cfif arguments.orderingPhysicianPhoneTBox EQ "@@" OR arguments.orderingPhysicianPhoneTBox EQ "">
				
				<cfset arguments.orderingPhysicianPhoneTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OrderingPhysicianPhoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianPhoneTBox</strong> (#OrderingPhysicianPhoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianPhoneTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianPhoneTBox</strong> cannot be greater than 20 character(s).">
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
			
			<cfif arguments.orderingPhysicianUPINTBox EQ "@@" OR arguments.orderingPhysicianUPINTBox EQ "">
				
				<cfset arguments.orderingPhysicianUPINTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OrderingPhysicianUPINTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianUPINTBox</strong> (#OrderingPhysicianUPINTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianUPINTBox) GT 30>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianUPINTBox</strong> cannot be greater than 30 character(s).">
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
			
			<cfif arguments.orderingPhysicianFaxTBox EQ "@@" OR arguments.orderingPhysicianFaxTBox EQ "">
				
				<cfset arguments.orderingPhysicianFaxTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OrderingPhysicianFaxTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianFaxTBox</strong> (#OrderingPhysicianFaxTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianFaxTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianFaxTBox</strong> cannot be greater than 20 character(s).">
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
			
			<cfif arguments.orderingPhysicianAddressTBox EQ "@@" OR arguments.orderingPhysicianAddressTBox EQ "">
				
				<cfset arguments.orderingPhysicianAddressTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OrderingPhysicianAddressTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianAddressTBox</strong> (#OrderingPhysicianAddressTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianAddressTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianAddressTBox</strong> cannot be greater than 100 character(s).">
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
			
			<cfif arguments.orderingPhysicianCityTBox EQ "@@" OR arguments.orderingPhysicianCityTBox EQ "">
				
				<cfset arguments.orderingPhysicianCityTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OrderingPhysicianCityTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianCityTBox</strong> (#OrderingPhysicianCityTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianCityTBox) GT 30>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianCityTBox</strong> cannot be greater than 30 character(s).">
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
			
			<cfif arguments.orderingPhysicianStateTBox EQ "@@" OR arguments.orderingPhysicianStateTBox EQ "">
				
				<cfset arguments.orderingPhysicianStateTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OrderingPhysicianStateTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianStateTBox</strong> (#OrderingPhysicianStateTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianStateTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianStateTBox</strong> cannot be greater than 20 character(s).">
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
			
			<cfif arguments.orderingPhysicianZipTBox EQ "@@" OR arguments.orderingPhysicianZipTBox EQ "">
				
				<cfset arguments.orderingPhysicianZipTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OrderingPhysicianZipTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OrderingPhysicianZipTBox</strong> (#OrderingPhysicianZipTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(orderingPhysicianZipTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OrderingPhysicianZipTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.OrderingPhysicianZipTBox = arguments.OrderingPhysicianZipTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OrderingPhysicianZipTBox")>			
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
			
			<cfif arguments.OPTION_13_CBox_PastEquipmentYes EQ "@@" OR arguments.OPTION_13_CBox_PastEquipmentYes EQ "">
				
				<cfset arguments.OPTION_13_CBox_PastEquipmentYes = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OPTION_13_CBox_PastEquipmentYes)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_13_CBox_PastEquipmentYes</strong> (#OPTION_13_CBox_PastEquipmentYes#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_13_CBox_PastEquipmentYes) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_13_CBox_PastEquipmentYes</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.OPTION_13_CBox_PastEquipmentNo EQ "@@" OR arguments.OPTION_13_CBox_PastEquipmentNo EQ "">
				
				<cfset arguments.OPTION_13_CBox_PastEquipmentNo = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OPTION_13_CBox_PastEquipmentNo)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_13_CBox_PastEquipmentNo</strong> (#OPTION_13_CBox_PastEquipmentNo#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_13_CBox_PastEquipmentNo) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_13_CBox_PastEquipmentNo</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment1TypeTBox EQ "@@" OR arguments.Equipment1TypeTBox EQ "">
				
				<cfset arguments.Equipment1TypeTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment1TypeTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1TypeTBox</strong> (#Equipment1TypeTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1TypeTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1TypeTBox</strong> cannot be greater than 100 character(s).">
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
			
			<cfif arguments.Equipment1RentPurchasedSelect EQ "@@" OR arguments.Equipment1RentPurchasedSelect EQ "">
				
				<cfset arguments.Equipment1RentPurchasedSelect = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment1RentPurchasedSelect)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1RentPurchasedSelect</strong> (#Equipment1RentPurchasedSelect#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1RentPurchasedSelect) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1RentPurchasedSelect</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment1FromMM EQ "@@" OR arguments.Equipment1FromMM EQ "">
				
				<cfset arguments.Equipment1FromMM = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment1FromMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1FromMM</strong> (#Equipment1FromMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1FromMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1FromMM</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment1FromDD EQ "@@" OR arguments.Equipment1FromDD EQ "">
				
				<cfset arguments.Equipment1FromDD = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment1FromDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1FromDD</strong> (#Equipment1FromDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1FromDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1FromDD</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment1FromYY EQ "@@" OR arguments.Equipment1FromYY EQ "">
				
				<cfset arguments.Equipment1FromYY = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment1FromYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1FromYY</strong> (#Equipment1FromYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1FromYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1FromYY</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment1ToMM EQ "@@" OR arguments.Equipment1ToMM EQ "">
				
				<cfset arguments.Equipment1ToMM = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment1ToMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1ToMM</strong> (#Equipment1ToMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1ToMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1ToMM</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment1ToDD EQ "@@" OR arguments.Equipment1ToDD EQ "">
				
				<cfset arguments.Equipment1ToDD = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment1ToDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1ToDD</strong> (#Equipment1ToDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1ToDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1ToDD</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment1ToYY EQ "@@" OR arguments.Equipment1ToYY EQ "">
				
				<cfset arguments.Equipment1ToYY = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment1ToYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1ToYY</strong> (#Equipment1ToYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1ToYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1ToYY</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment1SupplierNameTBox EQ "@@" OR arguments.Equipment1SupplierNameTBox EQ "">
				
				<cfset arguments.Equipment1SupplierNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment1SupplierNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1SupplierNameTBox</strong> (#Equipment1SupplierNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1SupplierNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1SupplierNameTBox</strong> cannot be greater than 100 character(s).">
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
			
			<cfif arguments.Equipment1SupplierTelephoneTBox EQ "@@" OR arguments.Equipment1SupplierTelephoneTBox EQ "">
				
				<cfset arguments.Equipment1SupplierTelephoneTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment1SupplierTelephoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1SupplierTelephoneTBox</strong> (#Equipment1SupplierTelephoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1SupplierTelephoneTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1SupplierTelephoneTBox</strong> cannot be greater than 20 character(s).">
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
			
			<cfif arguments.Equipment2TypeTBox EQ "@@" OR arguments.Equipment2TypeTBox EQ "">
				
				<cfset arguments.Equipment2TypeTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment2TypeTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2TypeTBox</strong> (#Equipment2TypeTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2TypeTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2TypeTBox</strong> cannot be greater than 100 character(s).">
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
			
			<cfif arguments.Equipment2RentPurchasedSelect EQ "@@" OR arguments.Equipment2RentPurchasedSelect EQ "">
				
				<cfset arguments.Equipment2RentPurchasedSelect = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment2RentPurchasedSelect)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2RentPurchasedSelect</strong> (#Equipment2RentPurchasedSelect#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2RentPurchasedSelect) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2RentPurchasedSelect</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment2FromMM EQ "@@" OR arguments.Equipment2FromMM EQ "">
				
				<cfset arguments.Equipment2FromMM = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment2FromMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2FromMM</strong> (#Equipment2FromMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2FromMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2FromMM</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment2FromDD EQ "@@" OR arguments.Equipment2FromDD EQ "">
				
				<cfset arguments.Equipment2FromDD = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment2FromDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2FromDD</strong> (#Equipment2FromDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2FromDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2FromDD</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment2FromYY EQ "@@" OR arguments.Equipment2FromYY EQ "">
				
				<cfset arguments.Equipment2FromYY = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment2FromYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2FromYY</strong> (#Equipment2FromYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2FromYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2FromYY</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment2ToMM EQ "@@" OR arguments.Equipment2ToMM EQ "">
				
				<cfset arguments.Equipment2ToMM = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment2ToMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2ToMM</strong> (#Equipment2ToMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2ToMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2ToMM</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment2ToDD EQ "@@" OR arguments.Equipment2ToDD EQ "">
				
				<cfset arguments.Equipment2ToDD = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment2ToDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2ToDD</strong> (#Equipment2ToDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2ToDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2ToDD</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment2ToYY EQ "@@" OR arguments.Equipment2ToYY EQ "">
				
				<cfset arguments.Equipment2ToYY = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment2ToYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2ToYY</strong> (#Equipment2ToYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2ToYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2ToYY</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment2SupplierNameTBox EQ "@@" OR arguments.Equipment2SupplierNameTBox EQ "">
				
				<cfset arguments.Equipment2SupplierNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment2SupplierNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2SupplierNameTBox</strong> (#Equipment2SupplierNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2SupplierNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2SupplierNameTBox</strong> cannot be greater than 100 character(s).">
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
			
			<cfif arguments.Equipment2SupplierTelephoneTBox EQ "@@" OR arguments.Equipment2SupplierTelephoneTBox EQ "">
				
				<cfset arguments.Equipment2SupplierTelephoneTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment2SupplierTelephoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2SupplierTelephoneTBox</strong> (#Equipment2SupplierTelephoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2SupplierTelephoneTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2SupplierTelephoneTBox</strong> cannot be greater than 20 character(s).">
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
			
			<cfif arguments.Equipment3TypeTBox EQ "@@" OR arguments.Equipment3TypeTBox EQ "">
				
				<cfset arguments.Equipment3TypeTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment3TypeTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3TypeTBox</strong> (#Equipment3TypeTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3TypeTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3TypeTBox</strong> cannot be greater than 100 character(s).">
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
			
			<cfif arguments.Equipment3RentPurchasedSelect EQ "@@" OR arguments.Equipment3RentPurchasedSelect EQ "">
				
				<cfset arguments.Equipment3RentPurchasedSelect = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment3RentPurchasedSelect)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3RentPurchasedSelect</strong> (#Equipment3RentPurchasedSelect#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3RentPurchasedSelect) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3RentPurchasedSelect</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment3FromMM EQ "@@" OR arguments.Equipment3FromMM EQ "">
				
				<cfset arguments.Equipment3FromMM = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment3FromMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3FromMM</strong> (#Equipment3FromMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3FromMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3FromMM</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment3FromDD EQ "@@" OR arguments.Equipment3FromDD EQ "">
				
				<cfset arguments.Equipment3FromDD = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment3FromDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3FromDD</strong> (#Equipment3FromDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3FromDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3FromDD</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment3FromYY EQ "@@" OR arguments.Equipment3FromYY EQ "">
				
				<cfset arguments.Equipment3FromYY = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment3FromYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3FromYY</strong> (#Equipment3FromYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3FromYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3FromYY</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment3ToMM EQ "@@" OR arguments.Equipment3ToMM EQ "">
				
				<cfset arguments.Equipment3ToMM = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment3ToMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3ToMM</strong> (#Equipment3ToMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3ToMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3ToMM</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment3ToDD EQ "@@" OR arguments.Equipment3ToDD EQ "">
				
				<cfset arguments.Equipment3ToDD = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment3ToDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3ToDD</strong> (#Equipment3ToDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3ToDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3ToDD</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment3ToYY EQ "@@" OR arguments.Equipment3ToYY EQ "">
				
				<cfset arguments.Equipment3ToYY = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment3ToYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3ToYY</strong> (#Equipment3ToYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3ToYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3ToYY</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment3SupplierNameTBox EQ "@@" OR arguments.Equipment3SupplierNameTBox EQ "">
				
				<cfset arguments.Equipment3SupplierNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment3SupplierNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3SupplierNameTBox</strong> (#Equipment3SupplierNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3SupplierNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3SupplierNameTBox</strong> cannot be greater than 100 character(s).">
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
			
			<cfif arguments.Equipment3SupplierTelephoneTBox EQ "@@" OR arguments.Equipment3SupplierTelephoneTBox EQ "">
				
				<cfset arguments.Equipment3SupplierTelephoneTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment3SupplierTelephoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3SupplierTelephoneTBox</strong> (#Equipment3SupplierTelephoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3SupplierTelephoneTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3SupplierTelephoneTBox</strong> cannot be greater than 20 character(s).">
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
			
			<cfif arguments.Equipment4TypeTBox EQ "@@" OR arguments.Equipment4TypeTBox EQ "">
				
				<cfset arguments.Equipment4TypeTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment4TypeTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4TypeTBox</strong> (#Equipment4TypeTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4TypeTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4TypeTBox</strong> cannot be greater than 100 character(s).">
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
			
			<cfif arguments.Equipment4RentPurchasedSelect EQ "@@" OR arguments.Equipment4RentPurchasedSelect EQ "">
				
				<cfset arguments.Equipment4RentPurchasedSelect = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment4RentPurchasedSelect)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4RentPurchasedSelect</strong> (#Equipment4RentPurchasedSelect#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4RentPurchasedSelect) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4RentPurchasedSelect</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment4FromMM EQ "@@" OR arguments.Equipment4FromMM EQ "">
				
				<cfset arguments.Equipment4FromMM = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment4FromMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4FromMM</strong> (#Equipment4FromMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4FromMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4FromMM</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment4FromDD EQ "@@" OR arguments.Equipment4FromDD EQ "">
				
				<cfset arguments.Equipment4FromDD = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment4FromDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4FromDD</strong> (#Equipment4FromDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4FromDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4FromDD</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment4FromYY EQ "@@" OR arguments.Equipment4FromYY EQ "">
				
				<cfset arguments.Equipment4FromYY = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment4FromYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4FromYY</strong> (#Equipment4FromYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4FromYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4FromYY</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment4ToMM EQ "@@" OR arguments.Equipment4ToMM EQ "">
				
				<cfset arguments.Equipment4ToMM = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment4ToMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4ToMM</strong> (#Equipment4ToMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4ToMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4ToMM</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment4ToDD EQ "@@" OR arguments.Equipment4ToDD EQ "">
				
				<cfset arguments.Equipment4ToDD = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment4ToDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4ToDD</strong> (#Equipment4ToDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4ToDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4ToDD</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment4ToYY EQ "@@" OR arguments.Equipment4ToYY EQ "">
				
				<cfset arguments.Equipment4ToYY = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment4ToYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4ToYY</strong> (#Equipment4ToYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4ToYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4ToYY</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment4SupplierNameTBox EQ "@@" OR arguments.Equipment4SupplierNameTBox EQ "">
				
				<cfset arguments.Equipment4SupplierNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment4SupplierNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4SupplierNameTBox</strong> (#Equipment4SupplierNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4SupplierNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4SupplierNameTBox</strong> cannot be greater than 100 character(s).">
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
			
			<cfif arguments.Equipment4SupplierTelephoneTBox EQ "@@" OR arguments.Equipment4SupplierTelephoneTBox EQ "">
				
				<cfset arguments.Equipment4SupplierTelephoneTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment4SupplierTelephoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4SupplierTelephoneTBox</strong> (#Equipment4SupplierTelephoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4SupplierTelephoneTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4SupplierTelephoneTBox</strong> cannot be greater than 20 character(s).">
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
			
			<cfif arguments.Equipment5TypeTBox EQ "@@" OR arguments.Equipment5TypeTBox EQ "">
				
				<cfset arguments.Equipment5TypeTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment5TypeTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5TypeTBox</strong> (#Equipment5TypeTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5TypeTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5TypeTBox</strong> cannot be greater than 100 character(s).">
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
			
			<cfif arguments.Equipment5RentPurchasedSelect EQ "@@" OR arguments.Equipment5RentPurchasedSelect EQ "">
				
				<cfset arguments.Equipment5RentPurchasedSelect = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment5RentPurchasedSelect)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5RentPurchasedSelect</strong> (#Equipment5RentPurchasedSelect#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5RentPurchasedSelect) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5RentPurchasedSelect</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment5FromMM EQ "@@" OR arguments.Equipment5FromMM EQ "">
				
				<cfset arguments.Equipment5FromMM = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment5FromMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5FromMM</strong> (#Equipment5FromMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5FromMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5FromMM</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment5FromDD EQ "@@" OR arguments.Equipment5FromDD EQ "">
				
				<cfset arguments.Equipment5FromDD = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment5FromDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5FromDD</strong> (#Equipment5FromDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5FromDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5FromDD</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment5FromYY EQ "@@" OR arguments.Equipment5FromYY EQ "">
				
				<cfset arguments.Equipment5FromYY = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment5FromYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5FromYY</strong> (#Equipment5FromYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5FromYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5FromYY</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment5ToMM EQ "@@" OR arguments.Equipment5ToMM EQ "">
				
				<cfset arguments.Equipment5ToMM = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment5ToMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5ToMM</strong> (#Equipment5ToMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5ToMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5ToMM</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment5ToDD EQ "@@" OR arguments.Equipment5ToDD EQ "">
				
				<cfset arguments.Equipment5ToDD = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment5ToDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5ToDD</strong> (#Equipment5ToDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5ToDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5ToDD</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment5ToYY EQ "@@" OR arguments.Equipment5ToYY EQ "">
				
				<cfset arguments.Equipment5ToYY = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment5ToYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5ToYY</strong> (#Equipment5ToYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5ToYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5ToYY</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.Equipment5SupplierNameTBox EQ "@@" OR arguments.Equipment5SupplierNameTBox EQ "">
				
				<cfset arguments.Equipment5SupplierNameTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment5SupplierNameTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5SupplierNameTBox</strong> (#Equipment5SupplierNameTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5SupplierNameTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5SupplierNameTBox</strong> cannot be greater than 100 character(s).">
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
			
			<cfif arguments.Equipment5SupplierTelephoneTBox EQ "@@" OR arguments.Equipment5SupplierTelephoneTBox EQ "">
				
				<cfset arguments.Equipment5SupplierTelephoneTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment5SupplierTelephoneTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5SupplierTelephoneTBox</strong> (#Equipment5SupplierTelephoneTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5SupplierTelephoneTBox) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5SupplierTelephoneTBox</strong> cannot be greater than 20 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Equipment5SupplierTelephoneTBox = arguments.Equipment5SupplierTelephoneTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment5SupplierTelephoneTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment1NoteTBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment1NoteTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment1NoteTBox>
	</cffunction>
	 
	<cffunction name="setEquipment1NoteTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment1NoteTBox" required="Yes" type="String">
		
		<cfif Equipment1NoteTBox NEQ "NULL">	
			
			<cfif arguments.Equipment1NoteTBox EQ "@@" OR arguments.Equipment1NoteTBox EQ "">
				
				<cfset arguments.Equipment1NoteTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment1NoteTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment1NoteTBox</strong> (#Equipment1NoteTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment1NoteTBox) GT 200>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment1NoteTBox</strong> cannot be greater than 200 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Equipment1NoteTBox = arguments.Equipment1NoteTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment1NoteTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment2NoteTBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment2NoteTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment2NoteTBox>
	</cffunction>
	 
	<cffunction name="setEquipment2NoteTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment2NoteTBox" required="Yes" type="String">
		
		<cfif Equipment2NoteTBox NEQ "NULL">	
			
			<cfif arguments.Equipment2NoteTBox EQ "@@" OR arguments.Equipment2NoteTBox EQ "">
				
				<cfset arguments.Equipment2NoteTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment2NoteTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment2NoteTBox</strong> (#Equipment2NoteTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment2NoteTBox) GT 200>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment2NoteTBox</strong> cannot be greater than 200 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Equipment2NoteTBox = arguments.Equipment2NoteTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment2NoteTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment3NoteTBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment3NoteTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment3NoteTBox>
	</cffunction>
	 
	<cffunction name="setEquipment3NoteTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment3NoteTBox" required="Yes" type="String">
		
		<cfif Equipment3NoteTBox NEQ "NULL">	
			
			<cfif arguments.Equipment3NoteTBox EQ "@@" OR arguments.Equipment3NoteTBox EQ "">
				
				<cfset arguments.Equipment3NoteTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment3NoteTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment3NoteTBox</strong> (#Equipment3NoteTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment3NoteTBox) GT 200>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment3NoteTBox</strong> cannot be greater than 200 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Equipment3NoteTBox = arguments.Equipment3NoteTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment3NoteTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment4NoteTBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment4NoteTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment4NoteTBox>
	</cffunction>
	 
	<cffunction name="setEquipment4NoteTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment4NoteTBox" required="Yes" type="String">
		
		<cfif Equipment4NoteTBox NEQ "NULL">	
			
			<cfif arguments.Equipment4NoteTBox EQ "@@" OR arguments.Equipment4NoteTBox EQ "">
				
				<cfset arguments.Equipment4NoteTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment4NoteTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment4NoteTBox</strong> (#Equipment4NoteTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment4NoteTBox) GT 200>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment4NoteTBox</strong> cannot be greater than 200 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Equipment4NoteTBox = arguments.Equipment4NoteTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment4NoteTBox")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Equipment5NoteTBox.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEquipment5NoteTBox" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Equipment5NoteTBox>
	</cffunction>
	 
	<cffunction name="setEquipment5NoteTBox" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Equipment5NoteTBox" required="Yes" type="String">
		
		<cfif Equipment5NoteTBox NEQ "NULL">	
			
			<cfif arguments.Equipment5NoteTBox EQ "@@" OR arguments.Equipment5NoteTBox EQ "">
				
				<cfset arguments.Equipment5NoteTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Equipment5NoteTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Equipment5NoteTBox</strong> (#Equipment5NoteTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Equipment5NoteTBox) GT 200>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Equipment5NoteTBox</strong> cannot be greater than 200 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Equipment5NoteTBox = arguments.Equipment5NoteTBox>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Equipment5NoteTBox")>			
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
			
			<cfif arguments.OPTION_14_CBox_OxygenPAo2 EQ "@@" OR arguments.OPTION_14_CBox_OxygenPAo2 EQ "">
				
				<cfset arguments.OPTION_14_CBox_OxygenPAo2 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OPTION_14_CBox_OxygenPAo2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_14_CBox_OxygenPAo2</strong> (#OPTION_14_CBox_OxygenPAo2#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_14_CBox_OxygenPAo2) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_14_CBox_OxygenPAo2</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.OPTION_14_CBox_OxygenSAo2 EQ "@@" OR arguments.OPTION_14_CBox_OxygenSAo2 EQ "">
				
				<cfset arguments.OPTION_14_CBox_OxygenSAo2 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OPTION_14_CBox_OxygenSAo2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_14_CBox_OxygenSAo2</strong> (#OPTION_14_CBox_OxygenSAo2#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_14_CBox_OxygenSAo2) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_14_CBox_OxygenSAo2</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.OPTION_14_CBox_OxygenSPo2 EQ "@@" OR arguments.OPTION_14_CBox_OxygenSPo2 EQ "">
				
				<cfset arguments.OPTION_14_CBox_OxygenSPo2 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OPTION_14_CBox_OxygenSPo2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_14_CBox_OxygenSPo2</strong> (#OPTION_14_CBox_OxygenSPo2#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OPTION_14_CBox_OxygenSPo2) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_14_CBox_OxygenSPo2</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.OxygenPAO2TBox EQ "@@" OR arguments.OxygenPAO2TBox EQ "">
				
				<cfset arguments.OxygenPAO2TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OxygenPAO2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OxygenPAO2TBox</strong> (#OxygenPAO2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OxygenPAO2TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OxygenPAO2TBox</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.OxygenSAO2TBox EQ "@@" OR arguments.OxygenSAO2TBox EQ "">
				
				<cfset arguments.OxygenSAO2TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OxygenSAO2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OxygenSAO2TBox</strong> (#OxygenSAO2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OxygenSAO2TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OxygenSAO2TBox</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.CPAPStudy_CBox EQ "@@" OR arguments.CPAPStudy_CBox EQ "">
				
				<cfset arguments.CPAPStudy_CBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CPAPStudy_CBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CPAPStudy_CBox</strong> (#CPAPStudy_CBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CPAPStudy_CBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CPAPStudy_CBox</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.CPAPStudyNote EQ "@@" OR arguments.CPAPStudyNote EQ "">
				
				<cfset arguments.CPAPStudyNote = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CPAPStudyNote)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CPAPStudyNote</strong> (#CPAPStudyNote#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CPAPStudyNote) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CPAPStudyNote</strong> cannot be greater than 100 character(s).">
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
			
			<cfif arguments.OxygenSPO2TBox EQ "@@" OR arguments.OxygenSPO2TBox EQ "">
				
				<cfset arguments.OxygenSPO2TBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(OxygenSPO2TBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OxygenSPO2TBox</strong> (#OxygenSPO2TBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(OxygenSPO2TBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OxygenSPO2TBox</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.CPAPStudyOnFile_CBox EQ "@@" OR arguments.CPAPStudyOnFile_CBox EQ "">
				
				<cfset arguments.CPAPStudyOnFile_CBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CPAPStudyOnFile_CBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CPAPStudyOnFile_CBox</strong> (#CPAPStudyOnFile_CBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CPAPStudyOnFile_CBox) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CPAPStudyOnFile_CBox</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.CPAPStudyOnFileNote EQ "@@" OR arguments.CPAPStudyOnFileNote EQ "">
				
				<cfset arguments.CPAPStudyOnFileNote = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CPAPStudyOnFileNote)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CPAPStudyOnFileNote</strong> (#CPAPStudyOnFileNote#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CPAPStudyOnFileNote) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CPAPStudyOnFileNote</strong> cannot be greater than 100 character(s).">
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
			
			<cfif arguments.LabTestDateMM EQ "@@" OR arguments.LabTestDateMM EQ "">
				
				<cfset arguments.LabTestDateMM = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(LabTestDateMM)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LabTestDateMM</strong> (#LabTestDateMM#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LabTestDateMM) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LabTestDateMM</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.LabTestDateDD EQ "@@" OR arguments.LabTestDateDD EQ "">
				
				<cfset arguments.LabTestDateDD = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(LabTestDateDD)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LabTestDateDD</strong> (#LabTestDateDD#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LabTestDateDD) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LabTestDateDD</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.LabTestDateYY EQ "@@" OR arguments.LabTestDateYY EQ "">
				
				<cfset arguments.LabTestDateYY = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(LabTestDateYY)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LabTestDateYY</strong> (#LabTestDateYY#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LabTestDateYY) GT 10>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LabTestDateYY</strong> cannot be greater than 10 character(s).">
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
			
			<cfif arguments.CPAPStudyPerformedAt EQ "@@" OR arguments.CPAPStudyPerformedAt EQ "">
				
				<cfset arguments.CPAPStudyPerformedAt = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CPAPStudyPerformedAt)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CPAPStudyPerformedAt</strong> (#CPAPStudyPerformedAt#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CPAPStudyPerformedAt) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CPAPStudyPerformedAt</strong> cannot be greater than 100 character(s).">
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
			
			<cfif arguments.LabTestFacilityTBox EQ "@@" OR arguments.LabTestFacilityTBox EQ "">
				
				<cfset arguments.LabTestFacilityTBox = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(LabTestFacilityTBox)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LabTestFacilityTBox</strong> (#LabTestFacilityTBox#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(LabTestFacilityTBox) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>LabTestFacilityTBox</strong> cannot be greater than 100 character(s).">
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
			
			<cfif arguments.CPAPStudyPerformedAt2 EQ "@@" OR arguments.CPAPStudyPerformedAt2 EQ "">
				
				<cfset arguments.CPAPStudyPerformedAt2 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CPAPStudyPerformedAt2)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CPAPStudyPerformedAt2</strong> (#CPAPStudyPerformedAt2#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CPAPStudyPerformedAt2) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CPAPStudyPerformedAt2</strong> cannot be greater than 100 character(s).">
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
			
			<cfif arguments.CPAPStudyPerformedAt3 EQ "@@" OR arguments.CPAPStudyPerformedAt3 EQ "">
				
				<cfset arguments.CPAPStudyPerformedAt3 = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(CPAPStudyPerformedAt3)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>CPAPStudyPerformedAt3</strong> (#CPAPStudyPerformedAt3#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(CPAPStudyPerformedAt3) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>CPAPStudyPerformedAt3</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.CPAPStudyPerformedAt3 = arguments.CPAPStudyPerformedAt3>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "CPAPStudyPerformedAt3")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClosingInvoiceNumber.                                   --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClosingInvoiceNumber" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClosingInvoiceNumber>
	</cffunction>
	 
	<cffunction name="setClosingInvoiceNumber" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClosingInvoiceNumber" required="Yes" type="String">
		
		<cfif ClosingInvoiceNumber NEQ "NULL">	
			
			<cfif arguments.ClosingInvoiceNumber EQ "@@" OR arguments.ClosingInvoiceNumber EQ "">
				
				<cfset arguments.ClosingInvoiceNumber = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(ClosingInvoiceNumber)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClosingInvoiceNumber</strong> (#ClosingInvoiceNumber#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(ClosingInvoiceNumber) GT 15>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ClosingInvoiceNumber</strong> cannot be greater than 15 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClosingInvoiceNumber = arguments.ClosingInvoiceNumber>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClosingInvoiceNumber")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for OPTION_SkilledNursing.                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getOPTION_SkilledNursing" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.OPTION_SkilledNursing>
	</cffunction>
	 
	<cffunction name="setOPTION_SkilledNursing" access="public" returntype="boolean" output="No">
 		
		<cfargument name="OPTION_SkilledNursing" required="Yes" type="String">
		
		<cfif OPTION_SkilledNursing NEQ "NULL">	
			
			<cfif arguments.OPTION_SkilledNursing EQ "@@" OR arguments.OPTION_SkilledNursing EQ "">
				
				<cfset arguments.OPTION_SkilledNursing = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(OPTION_SkilledNursing)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>OPTION_SkilledNursing</strong> (#OPTION_SkilledNursing#) is not of type <strong>char</strong>.">	
			<cfelseif len(OPTION_SkilledNursing) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>OPTION_SkilledNursing</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.OPTION_SkilledNursing = arguments.OPTION_SkilledNursing>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "OPTION_SkilledNursing")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for SkilledNursingName.                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSkilledNursingName" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SkilledNursingName>
	</cffunction>
	 
	<cffunction name="setSkilledNursingName" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SkilledNursingName" required="Yes" type="String">
		
		<cfif SkilledNursingName NEQ "NULL">	
			
			<cfif arguments.SkilledNursingName EQ "@@" OR arguments.SkilledNursingName EQ "">
				
				<cfset arguments.SkilledNursingName = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(SkilledNursingName)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SkilledNursingName</strong> (#SkilledNursingName#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(SkilledNursingName) GT 80>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SkilledNursingName</strong> cannot be greater than 80 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SkilledNursingName = arguments.SkilledNursingName>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SkilledNursingName")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for SkilledNursingTelephone.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSkilledNursingTelephone" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SkilledNursingTelephone>
	</cffunction>
	 
	<cffunction name="setSkilledNursingTelephone" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SkilledNursingTelephone" required="Yes" type="String">
		
		<cfif SkilledNursingTelephone NEQ "NULL">	
			
			<cfif arguments.SkilledNursingTelephone EQ "@@" OR arguments.SkilledNursingTelephone EQ "">
				
				<cfset arguments.SkilledNursingTelephone = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(SkilledNursingTelephone)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SkilledNursingTelephone</strong> (#SkilledNursingTelephone#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(SkilledNursingTelephone) GT 20>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>SkilledNursingTelephone</strong> cannot be greater than 20 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SkilledNursingTelephone = arguments.SkilledNursingTelephone>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SkilledNursingTelephone")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Printed.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPrinted" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Printed>
	</cffunction>
	 
	<cffunction name="setPrinted" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Printed" required="Yes" type="String">
		
		<cfif Printed NEQ "NULL">	
			
			<cfif arguments.Printed EQ "@@" OR arguments.Printed EQ "">
				
				<cfset arguments.Printed = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Printed)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Printed</strong> (#Printed#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Printed) GT 4000>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Printed</strong> cannot be greater than 4000 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Printed = arguments.Printed>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Printed")>			
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
			
			<cfif arguments.Active EQ "@@" OR arguments.Active EQ "">
				
				<cfset arguments.Active = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(Active)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Active</strong> (#Active#) is not of type <strong>char</strong>.">	
			<cfelseif len(Active) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Active</strong> cannot be greater than 1 character(s).">
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
			
			<cfif arguments.InactiveCode EQ "@@" OR arguments.InactiveCode EQ "">
				
				<cfset arguments.InactiveCode = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(InactiveCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InactiveCode</strong> (#InactiveCode#) is not of type <strong>int</strong>.">
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
			
			<cfif arguments.DateCreated EQ "@@" OR arguments.DateCreated EQ "">
				
				<cfset arguments.DateCreated = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateCreated)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateCreated</strong> (#DateCreated#) is not of type <strong>datetime</strong>.">
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
			
			<cfif arguments.DateModified EQ "@@" OR arguments.DateModified EQ "">
				
				<cfset arguments.DateModified = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateModified)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateModified</strong> (#DateModified#) is not of type <strong>datetime</strong>.">
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

		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="AssignedToUserID" required="No" type="String" default="">
		<cfargument name="hidden_Step" required="No" type="String" default="">
		<cfargument name="hidden_UsersID" required="No" type="String" default="">
		<cfargument name="hidden_TimeStart" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Delivery" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Pickup" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Repair" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Switch" required="No" type="String" default="">
		<cfargument name="OPTION_1_CBox_Existing" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Other" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Hospice" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Hospital" required="No" type="String" default="">
		<cfargument name="otherTBox" required="No" type="String" default="">
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
		<cfargument name="callerFNameTBox" required="No" type="String" default="">
		<cfargument name="callerMInitialTBox" required="No" type="String" default="">
		<cfargument name="callerLNameTBox" required="No" type="String" default="">
		<cfargument name="callerPhoneTBox" required="No" type="String" default="">
		<cfargument name="patientXML" required="No" type="String" default="">
		<cfargument name="patientID" required="No" type="String" default="">
		<cfargument name="patientAddressID" required="No" type="String" default="">
		<cfargument name="patientPhoneID" required="No" type="String" default="">
		<cfargument name="roomNumberTBox" required="No" type="String" default="">
		<cfargument name="bedNumberTBox" required="No" type="String" default="">
		<cfargument name="alternateContactFNameTBox" required="No" type="String" default="">
		<cfargument name="alternateContactMInitialTBox" required="No" type="String" default="">
		<cfargument name="alternateContactLNameTBox" required="No" type="String" default="">
		<cfargument name="alternateContactRelationshipTBox" required="No" type="String" default="">
		<cfargument name="alternateContactPhoneTBox" required="No" type="String" default="">
		<cfargument name="alternateContactWorkPhoneTBox" required="No" type="String" default="">
		<cfargument name="poNumberTBox" required="No" type="String" default="">
		<cfargument name="creditCardTypeTBox" required="No" type="String" default="">
		<cfargument name="creditCardNumberTBox" required="No" type="String" default="">
		<cfargument name="ccDateMM" required="No" type="String" default="">
		<cfargument name="ccDateDD" required="No" type="String" default="">
		<cfargument name="ccDateYY" required="No" type="String" default="">
		<cfargument name="orderingPhysicianFNameTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianMInitialTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianLNameTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianPhoneTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianUPINTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianFaxTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianAddressTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianCityTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianStateTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianZipTBox" required="No" type="String" default="">
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
		<cfargument name="Equipment1NoteTBox" required="No" type="String" default="">
		<cfargument name="Equipment2NoteTBox" required="No" type="String" default="">
		<cfargument name="Equipment3NoteTBox" required="No" type="String" default="">
		<cfargument name="Equipment4NoteTBox" required="No" type="String" default="">
		<cfargument name="Equipment5NoteTBox" required="No" type="String" default="">
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
		<cfargument name="ClosingInvoiceNumber" required="No" type="String" default="">
		<cfargument name="OPTION_SkilledNursing" required="No" type="String" default="">
		<cfargument name="SkilledNursingName" required="No" type="String" default="">
		<cfargument name="SkilledNursingTelephone" required="No" type="String" default="">
		<cfargument name="Printed" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.ClientID = arguments.ClientID>
		<cfset variables.instance.AssignedToUserID = arguments.AssignedToUserID>
		<cfset variables.instance.hidden_Step = arguments.hidden_Step>
		<cfset variables.instance.hidden_UsersID = arguments.hidden_UsersID>
		<cfset variables.instance.hidden_TimeStart = arguments.hidden_TimeStart>
		<cfset variables.instance.OPTION_1_CBox_Delivery = arguments.OPTION_1_CBox_Delivery>
		<cfset variables.instance.OPTION_1_CBox_Pickup = arguments.OPTION_1_CBox_Pickup>
		<cfset variables.instance.OPTION_1_CBox_Repair = arguments.OPTION_1_CBox_Repair>
		<cfset variables.instance.OPTION_1_CBox_Switch = arguments.OPTION_1_CBox_Switch>
		<cfset variables.instance.OPTION_1_CBox_Existing = arguments.OPTION_1_CBox_Existing>
		<cfset variables.instance.OPTION_2_CBox_Other = arguments.OPTION_2_CBox_Other>
		<cfset variables.instance.OPTION_2_CBox_Hospice = arguments.OPTION_2_CBox_Hospice>
		<cfset variables.instance.OPTION_2_CBox_Hospital = arguments.OPTION_2_CBox_Hospital>
		<cfset variables.instance.otherTBox = arguments.otherTBox>
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
		<cfset variables.instance.callerFNameTBox = arguments.callerFNameTBox>
		<cfset variables.instance.callerMInitialTBox = arguments.callerMInitialTBox>
		<cfset variables.instance.callerLNameTBox = arguments.callerLNameTBox>
		<cfset variables.instance.callerPhoneTBox = arguments.callerPhoneTBox>
		<cfset variables.instance.patientXML = arguments.patientXML>
		<cfset variables.instance.patientID = arguments.patientID>
		<cfset variables.instance.patientAddressID = arguments.patientAddressID>
		<cfset variables.instance.patientPhoneID = arguments.patientPhoneID>
		<cfset variables.instance.roomNumberTBox = arguments.roomNumberTBox>
		<cfset variables.instance.bedNumberTBox = arguments.bedNumberTBox>
		<cfset variables.instance.alternateContactFNameTBox = arguments.alternateContactFNameTBox>
		<cfset variables.instance.alternateContactMInitialTBox = arguments.alternateContactMInitialTBox>
		<cfset variables.instance.alternateContactLNameTBox = arguments.alternateContactLNameTBox>
		<cfset variables.instance.alternateContactRelationshipTBox = arguments.alternateContactRelationshipTBox>
		<cfset variables.instance.alternateContactPhoneTBox = arguments.alternateContactPhoneTBox>
		<cfset variables.instance.alternateContactWorkPhoneTBox = arguments.alternateContactWorkPhoneTBox>
		<cfset variables.instance.poNumberTBox = arguments.poNumberTBox>
		<cfset variables.instance.creditCardTypeTBox = arguments.creditCardTypeTBox>
		<cfset variables.instance.creditCardNumberTBox = arguments.creditCardNumberTBox>
		<cfset variables.instance.ccDateMM = arguments.ccDateMM>
		<cfset variables.instance.ccDateDD = arguments.ccDateDD>
		<cfset variables.instance.ccDateYY = arguments.ccDateYY>
		<cfset variables.instance.orderingPhysicianFNameTBox = arguments.orderingPhysicianFNameTBox>
		<cfset variables.instance.orderingPhysicianMInitialTBox = arguments.orderingPhysicianMInitialTBox>
		<cfset variables.instance.orderingPhysicianLNameTBox = arguments.orderingPhysicianLNameTBox>
		<cfset variables.instance.orderingPhysicianPhoneTBox = arguments.orderingPhysicianPhoneTBox>
		<cfset variables.instance.orderingPhysicianUPINTBox = arguments.orderingPhysicianUPINTBox>
		<cfset variables.instance.orderingPhysicianFaxTBox = arguments.orderingPhysicianFaxTBox>
		<cfset variables.instance.orderingPhysicianAddressTBox = arguments.orderingPhysicianAddressTBox>
		<cfset variables.instance.orderingPhysicianCityTBox = arguments.orderingPhysicianCityTBox>
		<cfset variables.instance.orderingPhysicianStateTBox = arguments.orderingPhysicianStateTBox>
		<cfset variables.instance.orderingPhysicianZipTBox = arguments.orderingPhysicianZipTBox>
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
		<cfset variables.instance.Equipment1NoteTBox = arguments.Equipment1NoteTBox>
		<cfset variables.instance.Equipment2NoteTBox = arguments.Equipment2NoteTBox>
		<cfset variables.instance.Equipment3NoteTBox = arguments.Equipment3NoteTBox>
		<cfset variables.instance.Equipment4NoteTBox = arguments.Equipment4NoteTBox>
		<cfset variables.instance.Equipment5NoteTBox = arguments.Equipment5NoteTBox>
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
		<cfset variables.instance.ClosingInvoiceNumber = arguments.ClosingInvoiceNumber>
		<cfset variables.instance.OPTION_SkilledNursing = arguments.OPTION_SkilledNursing>
		<cfset variables.instance.SkilledNursingName = arguments.SkilledNursingName>
		<cfset variables.instance.SkilledNursingTelephone = arguments.SkilledNursingTelephone>
		<cfset variables.instance.Printed = arguments.Printed>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Init" access="public" returntype="IntakeIO" output="No">
		
		<cfargument name="IntakeID" required="yes" type="numeric">		
		<cfset var qGetIntake = "">
		
		<cfset preInit(IntakeID)>
	
		<cfquery name="qGetIntake" datasource="#trim(request.datasource)#">
	  		SELECT IntakeID,ClientID,AssignedToUserID,hidden_Step,hidden_UsersID,hidden_TimeStart,OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing,OPTION_2_CBox_Other,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital,otherTBox,hospiceTBox,OPTION_3_CBox_Medicare,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay,hospitalTBox,DischargeDateMM,DischargeDateDD,DischargeDateYY,typeOfPay_Radio,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientXML,patientID,patientAddressID,patientPhoneID,roomNumberTBox,bedNumberTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,poNumberTBox,creditCardTypeTBox,creditCardNumberTBox,ccDateMM,ccDateDD,ccDateYY,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,orderingPhysicianUPINTBox,orderingPhysicianFaxTBox,orderingPhysicianAddressTBox,orderingPhysicianCityTBox,orderingPhysicianStateTBox,orderingPhysicianZipTBox,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo,Equipment1TypeTBox,Equipment1RentPurchasedSelect,Equipment1FromMM,Equipment1FromDD,Equipment1FromYY,Equipment1ToMM,Equipment1ToDD,Equipment1ToYY,Equipment1SupplierNameTBox,Equipment1SupplierTelephoneTBox,Equipment2TypeTBox,Equipment2RentPurchasedSelect,Equipment2FromMM,Equipment2FromDD,Equipment2FromYY,Equipment2ToMM,Equipment2ToDD,Equipment2ToYY,Equipment2SupplierNameTBox,Equipment2SupplierTelephoneTBox,Equipment3TypeTBox,Equipment3RentPurchasedSelect,Equipment3FromMM,Equipment3FromDD,Equipment3FromYY,Equipment3ToMM,Equipment3ToDD,Equipment3ToYY,Equipment3SupplierNameTBox,Equipment3SupplierTelephoneTBox,Equipment4TypeTBox,Equipment4RentPurchasedSelect,Equipment4FromMM,Equipment4FromDD,Equipment4FromYY,Equipment4ToMM,Equipment4ToDD,Equipment4ToYY,Equipment4SupplierNameTBox,Equipment4SupplierTelephoneTBox,Equipment5TypeTBox,Equipment5RentPurchasedSelect,Equipment5FromMM,Equipment5FromDD,Equipment5FromYY,Equipment5ToMM,Equipment5ToDD,Equipment5ToYY,Equipment5SupplierNameTBox,Equipment5SupplierTelephoneTBox,Equipment1NoteTBox,Equipment2NoteTBox,Equipment3NoteTBox,Equipment4NoteTBox,Equipment5NoteTBox,OPTION_14_CBox_OxygenPAo2,OPTION_14_CBox_OxygenSAo2,OPTION_14_CBox_OxygenSPo2,OxygenPAO2TBox,OxygenSAO2TBox,CPAPStudy_CBox,CPAPStudyNote,OxygenSPO2TBox,CPAPStudyOnFile_CBox,CPAPStudyOnFileNote,LabTestDateMM,LabTestDateDD,LabTestDateYY,CPAPStudyPerformedAt,LabTestFacilityTBox,CPAPStudyPerformedAt2,CPAPStudyPerformedAt3,ClosingInvoiceNumber,OPTION_SkilledNursing,SkilledNursingName,SkilledNursingTelephone,Printed,Active,InactiveCode,DateCreated,DateModified
			FROM intake  
			WHERE IntakeID = #trim(arguments.IntakeID)# 
		</cfquery>
		
		<cfif qGetIntake.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetIntake.IntakeID EQ "" OR qGetIntake.IntakeID EQ "NULL") 
				variables.instance.IntakeID = "NULL"; 
			ELSE 
				variables.instance.IntakeID = qGetIntake.IntakeID;
				
			IF(qGetIntake.ClientID EQ "" OR qGetIntake.ClientID EQ "NULL") 
				variables.instance.ClientID = "NULL"; 
			ELSE 
				variables.instance.ClientID = qGetIntake.ClientID;
				
			IF(qGetIntake.AssignedToUserID EQ "" OR qGetIntake.AssignedToUserID EQ "NULL") 
				variables.instance.AssignedToUserID = "NULL"; 
			ELSE 
				variables.instance.AssignedToUserID = qGetIntake.AssignedToUserID;
							
				variables.instance.hidden_Step = qGetIntake.hidden_Step;
							
				variables.instance.hidden_UsersID = qGetIntake.hidden_UsersID;
							
				variables.instance.hidden_TimeStart = qGetIntake.hidden_TimeStart;
							
				variables.instance.OPTION_1_CBox_Delivery = qGetIntake.OPTION_1_CBox_Delivery;
							
				variables.instance.OPTION_1_CBox_Pickup = qGetIntake.OPTION_1_CBox_Pickup;
							
				variables.instance.OPTION_1_CBox_Repair = qGetIntake.OPTION_1_CBox_Repair;
							
				variables.instance.OPTION_1_CBox_Switch = qGetIntake.OPTION_1_CBox_Switch;
							
				variables.instance.OPTION_1_CBox_Existing = qGetIntake.OPTION_1_CBox_Existing;
							
				variables.instance.OPTION_2_CBox_Other = qGetIntake.OPTION_2_CBox_Other;
							
				variables.instance.OPTION_2_CBox_Hospice = qGetIntake.OPTION_2_CBox_Hospice;
							
				variables.instance.OPTION_2_CBox_Hospital = qGetIntake.OPTION_2_CBox_Hospital;
							
				variables.instance.otherTBox = qGetIntake.otherTBox;
							
				variables.instance.hospiceTBox = qGetIntake.hospiceTBox;
							
				variables.instance.OPTION_3_CBox_Medicare = qGetIntake.OPTION_3_CBox_Medicare;
							
				variables.instance.OPTION_3_CBox_PrivateInsurance = qGetIntake.OPTION_3_CBox_PrivateInsurance;
							
				variables.instance.OPTION_3_CBox_Medicaid = qGetIntake.OPTION_3_CBox_Medicaid;
							
				variables.instance.OPTION_3_CBox_PrivatePay = qGetIntake.OPTION_3_CBox_PrivatePay;
							
				variables.instance.hospitalTBox = qGetIntake.hospitalTBox;
							
				variables.instance.DischargeDateMM = qGetIntake.DischargeDateMM;
							
				variables.instance.DischargeDateDD = qGetIntake.DischargeDateDD;
							
				variables.instance.DischargeDateYY = qGetIntake.DischargeDateYY;
							
				variables.instance.typeOfPay_Radio = qGetIntake.typeOfPay_Radio;
							
				variables.instance.callerFNameTBox = qGetIntake.callerFNameTBox;
							
				variables.instance.callerMInitialTBox = qGetIntake.callerMInitialTBox;
							
				variables.instance.callerLNameTBox = qGetIntake.callerLNameTBox;
							
				variables.instance.callerPhoneTBox = qGetIntake.callerPhoneTBox;
							
				variables.instance.patientXML = qGetIntake.patientXML;
				
			IF(qGetIntake.patientID EQ "" OR qGetIntake.patientID EQ "NULL") 
				variables.instance.patientID = "NULL"; 
			ELSE 
				variables.instance.patientID = qGetIntake.patientID;
				
			IF(qGetIntake.patientAddressID EQ "" OR qGetIntake.patientAddressID EQ "NULL") 
				variables.instance.patientAddressID = "NULL"; 
			ELSE 
				variables.instance.patientAddressID = qGetIntake.patientAddressID;
				
			IF(qGetIntake.patientPhoneID EQ "" OR qGetIntake.patientPhoneID EQ "NULL") 
				variables.instance.patientPhoneID = "NULL"; 
			ELSE 
				variables.instance.patientPhoneID = qGetIntake.patientPhoneID;
							
				variables.instance.roomNumberTBox = qGetIntake.roomNumberTBox;
							
				variables.instance.bedNumberTBox = qGetIntake.bedNumberTBox;
							
				variables.instance.alternateContactFNameTBox = qGetIntake.alternateContactFNameTBox;
							
				variables.instance.alternateContactMInitialTBox = qGetIntake.alternateContactMInitialTBox;
							
				variables.instance.alternateContactLNameTBox = qGetIntake.alternateContactLNameTBox;
							
				variables.instance.alternateContactRelationshipTBox = qGetIntake.alternateContactRelationshipTBox;
							
				variables.instance.alternateContactPhoneTBox = qGetIntake.alternateContactPhoneTBox;
							
				variables.instance.alternateContactWorkPhoneTBox = qGetIntake.alternateContactWorkPhoneTBox;
							
				variables.instance.poNumberTBox = qGetIntake.poNumberTBox;
							
				variables.instance.creditCardTypeTBox = qGetIntake.creditCardTypeTBox;
							
				variables.instance.creditCardNumberTBox = qGetIntake.creditCardNumberTBox;
							
				variables.instance.ccDateMM = qGetIntake.ccDateMM;
							
				variables.instance.ccDateDD = qGetIntake.ccDateDD;
							
				variables.instance.ccDateYY = qGetIntake.ccDateYY;
							
				variables.instance.orderingPhysicianFNameTBox = qGetIntake.orderingPhysicianFNameTBox;
							
				variables.instance.orderingPhysicianMInitialTBox = qGetIntake.orderingPhysicianMInitialTBox;
							
				variables.instance.orderingPhysicianLNameTBox = qGetIntake.orderingPhysicianLNameTBox;
							
				variables.instance.orderingPhysicianPhoneTBox = qGetIntake.orderingPhysicianPhoneTBox;
							
				variables.instance.orderingPhysicianUPINTBox = qGetIntake.orderingPhysicianUPINTBox;
							
				variables.instance.orderingPhysicianFaxTBox = qGetIntake.orderingPhysicianFaxTBox;
							
				variables.instance.orderingPhysicianAddressTBox = qGetIntake.orderingPhysicianAddressTBox;
							
				variables.instance.orderingPhysicianCityTBox = qGetIntake.orderingPhysicianCityTBox;
							
				variables.instance.orderingPhysicianStateTBox = qGetIntake.orderingPhysicianStateTBox;
							
				variables.instance.orderingPhysicianZipTBox = qGetIntake.orderingPhysicianZipTBox;
							
				variables.instance.OPTION_13_CBox_PastEquipmentYes = qGetIntake.OPTION_13_CBox_PastEquipmentYes;
							
				variables.instance.OPTION_13_CBox_PastEquipmentNo = qGetIntake.OPTION_13_CBox_PastEquipmentNo;
							
				variables.instance.Equipment1TypeTBox = qGetIntake.Equipment1TypeTBox;
							
				variables.instance.Equipment1RentPurchasedSelect = qGetIntake.Equipment1RentPurchasedSelect;
							
				variables.instance.Equipment1FromMM = qGetIntake.Equipment1FromMM;
							
				variables.instance.Equipment1FromDD = qGetIntake.Equipment1FromDD;
							
				variables.instance.Equipment1FromYY = qGetIntake.Equipment1FromYY;
							
				variables.instance.Equipment1ToMM = qGetIntake.Equipment1ToMM;
							
				variables.instance.Equipment1ToDD = qGetIntake.Equipment1ToDD;
							
				variables.instance.Equipment1ToYY = qGetIntake.Equipment1ToYY;
							
				variables.instance.Equipment1SupplierNameTBox = qGetIntake.Equipment1SupplierNameTBox;
							
				variables.instance.Equipment1SupplierTelephoneTBox = qGetIntake.Equipment1SupplierTelephoneTBox;
							
				variables.instance.Equipment2TypeTBox = qGetIntake.Equipment2TypeTBox;
							
				variables.instance.Equipment2RentPurchasedSelect = qGetIntake.Equipment2RentPurchasedSelect;
							
				variables.instance.Equipment2FromMM = qGetIntake.Equipment2FromMM;
							
				variables.instance.Equipment2FromDD = qGetIntake.Equipment2FromDD;
							
				variables.instance.Equipment2FromYY = qGetIntake.Equipment2FromYY;
							
				variables.instance.Equipment2ToMM = qGetIntake.Equipment2ToMM;
							
				variables.instance.Equipment2ToDD = qGetIntake.Equipment2ToDD;
							
				variables.instance.Equipment2ToYY = qGetIntake.Equipment2ToYY;
							
				variables.instance.Equipment2SupplierNameTBox = qGetIntake.Equipment2SupplierNameTBox;
							
				variables.instance.Equipment2SupplierTelephoneTBox = qGetIntake.Equipment2SupplierTelephoneTBox;
							
				variables.instance.Equipment3TypeTBox = qGetIntake.Equipment3TypeTBox;
							
				variables.instance.Equipment3RentPurchasedSelect = qGetIntake.Equipment3RentPurchasedSelect;
							
				variables.instance.Equipment3FromMM = qGetIntake.Equipment3FromMM;
							
				variables.instance.Equipment3FromDD = qGetIntake.Equipment3FromDD;
							
				variables.instance.Equipment3FromYY = qGetIntake.Equipment3FromYY;
							
				variables.instance.Equipment3ToMM = qGetIntake.Equipment3ToMM;
							
				variables.instance.Equipment3ToDD = qGetIntake.Equipment3ToDD;
							
				variables.instance.Equipment3ToYY = qGetIntake.Equipment3ToYY;
							
				variables.instance.Equipment3SupplierNameTBox = qGetIntake.Equipment3SupplierNameTBox;
							
				variables.instance.Equipment3SupplierTelephoneTBox = qGetIntake.Equipment3SupplierTelephoneTBox;
							
				variables.instance.Equipment4TypeTBox = qGetIntake.Equipment4TypeTBox;
							
				variables.instance.Equipment4RentPurchasedSelect = qGetIntake.Equipment4RentPurchasedSelect;
							
				variables.instance.Equipment4FromMM = qGetIntake.Equipment4FromMM;
							
				variables.instance.Equipment4FromDD = qGetIntake.Equipment4FromDD;
							
				variables.instance.Equipment4FromYY = qGetIntake.Equipment4FromYY;
							
				variables.instance.Equipment4ToMM = qGetIntake.Equipment4ToMM;
							
				variables.instance.Equipment4ToDD = qGetIntake.Equipment4ToDD;
							
				variables.instance.Equipment4ToYY = qGetIntake.Equipment4ToYY;
							
				variables.instance.Equipment4SupplierNameTBox = qGetIntake.Equipment4SupplierNameTBox;
							
				variables.instance.Equipment4SupplierTelephoneTBox = qGetIntake.Equipment4SupplierTelephoneTBox;
							
				variables.instance.Equipment5TypeTBox = qGetIntake.Equipment5TypeTBox;
							
				variables.instance.Equipment5RentPurchasedSelect = qGetIntake.Equipment5RentPurchasedSelect;
							
				variables.instance.Equipment5FromMM = qGetIntake.Equipment5FromMM;
							
				variables.instance.Equipment5FromDD = qGetIntake.Equipment5FromDD;
							
				variables.instance.Equipment5FromYY = qGetIntake.Equipment5FromYY;
							
				variables.instance.Equipment5ToMM = qGetIntake.Equipment5ToMM;
							
				variables.instance.Equipment5ToDD = qGetIntake.Equipment5ToDD;
							
				variables.instance.Equipment5ToYY = qGetIntake.Equipment5ToYY;
							
				variables.instance.Equipment5SupplierNameTBox = qGetIntake.Equipment5SupplierNameTBox;
							
				variables.instance.Equipment5SupplierTelephoneTBox = qGetIntake.Equipment5SupplierTelephoneTBox;
							
				variables.instance.Equipment1NoteTBox = qGetIntake.Equipment1NoteTBox;
							
				variables.instance.Equipment2NoteTBox = qGetIntake.Equipment2NoteTBox;
							
				variables.instance.Equipment3NoteTBox = qGetIntake.Equipment3NoteTBox;
							
				variables.instance.Equipment4NoteTBox = qGetIntake.Equipment4NoteTBox;
							
				variables.instance.Equipment5NoteTBox = qGetIntake.Equipment5NoteTBox;
							
				variables.instance.OPTION_14_CBox_OxygenPAo2 = qGetIntake.OPTION_14_CBox_OxygenPAo2;
							
				variables.instance.OPTION_14_CBox_OxygenSAo2 = qGetIntake.OPTION_14_CBox_OxygenSAo2;
							
				variables.instance.OPTION_14_CBox_OxygenSPo2 = qGetIntake.OPTION_14_CBox_OxygenSPo2;
							
				variables.instance.OxygenPAO2TBox = qGetIntake.OxygenPAO2TBox;
							
				variables.instance.OxygenSAO2TBox = qGetIntake.OxygenSAO2TBox;
							
				variables.instance.CPAPStudy_CBox = qGetIntake.CPAPStudy_CBox;
							
				variables.instance.CPAPStudyNote = qGetIntake.CPAPStudyNote;
							
				variables.instance.OxygenSPO2TBox = qGetIntake.OxygenSPO2TBox;
							
				variables.instance.CPAPStudyOnFile_CBox = qGetIntake.CPAPStudyOnFile_CBox;
							
				variables.instance.CPAPStudyOnFileNote = qGetIntake.CPAPStudyOnFileNote;
							
				variables.instance.LabTestDateMM = qGetIntake.LabTestDateMM;
							
				variables.instance.LabTestDateDD = qGetIntake.LabTestDateDD;
							
				variables.instance.LabTestDateYY = qGetIntake.LabTestDateYY;
							
				variables.instance.CPAPStudyPerformedAt = qGetIntake.CPAPStudyPerformedAt;
							
				variables.instance.LabTestFacilityTBox = qGetIntake.LabTestFacilityTBox;
							
				variables.instance.CPAPStudyPerformedAt2 = qGetIntake.CPAPStudyPerformedAt2;
							
				variables.instance.CPAPStudyPerformedAt3 = qGetIntake.CPAPStudyPerformedAt3;
							
				variables.instance.ClosingInvoiceNumber = qGetIntake.ClosingInvoiceNumber;
							
				variables.instance.OPTION_SkilledNursing = qGetIntake.OPTION_SkilledNursing;
							
				variables.instance.SkilledNursingName = qGetIntake.SkilledNursingName;
							
				variables.instance.SkilledNursingTelephone = qGetIntake.SkilledNursingTelephone;
							
				variables.instance.Printed = qGetIntake.Printed;
							
				variables.instance.Active = qGetIntake.Active;
				
			IF(qGetIntake.InactiveCode EQ "" OR qGetIntake.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetIntake.InactiveCode;
							
				variables.instance.DateCreated = qGetIntake.DateCreated;
							
				variables.instance.DateModified = qGetIntake.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(IntakeID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitIntake = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.IntakeID) AND variables.instance.IntakeID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitIntake" datasource="#trim(request.datasource)#">
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
			
				<cfquery name="qInsertCommitIntake" datasource="#trim(request.datasource)#">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.IntakeID = qInsertCommitIntake.IntakeID>
				
				<cfreturn qInsertCommitIntake.IntakeID>
			
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
			<cfset tableColumns = "IntakeID,ClientID,AssignedToUserID,hidden_Step,hidden_UsersID,hidden_TimeStart,OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing,OPTION_2_CBox_Other,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital,otherTBox,hospiceTBox,OPTION_3_CBox_Medicare,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay,hospitalTBox,DischargeDateMM,DischargeDateDD,DischargeDateYY,typeOfPay_Radio,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientXML,patientID,patientAddressID,patientPhoneID,roomNumberTBox,bedNumberTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,poNumberTBox,creditCardTypeTBox,creditCardNumberTBox,ccDateMM,ccDateDD,ccDateYY,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,orderingPhysicianUPINTBox,orderingPhysicianFaxTBox,orderingPhysicianAddressTBox,orderingPhysicianCityTBox,orderingPhysicianStateTBox,orderingPhysicianZipTBox,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo,Equipment1TypeTBox,Equipment1RentPurchasedSelect,Equipment1FromMM,Equipment1FromDD,Equipment1FromYY,Equipment1ToMM,Equipment1ToDD,Equipment1ToYY,Equipment1SupplierNameTBox,Equipment1SupplierTelephoneTBox,Equipment2TypeTBox,Equipment2RentPurchasedSelect,Equipment2FromMM,Equipment2FromDD,Equipment2FromYY,Equipment2ToMM,Equipment2ToDD,Equipment2ToYY,Equipment2SupplierNameTBox,Equipment2SupplierTelephoneTBox,Equipment3TypeTBox,Equipment3RentPurchasedSelect,Equipment3FromMM,Equipment3FromDD,Equipment3FromYY,Equipment3ToMM,Equipment3ToDD,Equipment3ToYY,Equipment3SupplierNameTBox,Equipment3SupplierTelephoneTBox,Equipment4TypeTBox,Equipment4RentPurchasedSelect,Equipment4FromMM,Equipment4FromDD,Equipment4FromYY,Equipment4ToMM,Equipment4ToDD,Equipment4ToYY,Equipment4SupplierNameTBox,Equipment4SupplierTelephoneTBox,Equipment5TypeTBox,Equipment5RentPurchasedSelect,Equipment5FromMM,Equipment5FromDD,Equipment5FromYY,Equipment5ToMM,Equipment5ToDD,Equipment5ToYY,Equipment5SupplierNameTBox,Equipment5SupplierTelephoneTBox,Equipment1NoteTBox,Equipment2NoteTBox,Equipment3NoteTBox,Equipment4NoteTBox,Equipment5NoteTBox,OPTION_14_CBox_OxygenPAo2,OPTION_14_CBox_OxygenSAo2,OPTION_14_CBox_OxygenSPo2,OxygenPAO2TBox,OxygenSAO2TBox,CPAPStudy_CBox,CPAPStudyNote,OxygenSPO2TBox,CPAPStudyOnFile_CBox,CPAPStudyOnFileNote,LabTestDateMM,LabTestDateDD,LabTestDateYY,CPAPStudyPerformedAt,LabTestFacilityTBox,CPAPStudyPerformedAt2,CPAPStudyPerformedAt3,ClosingInvoiceNumber,OPTION_SkilledNursing,SkilledNursingName,SkilledNursingTelephone,Printed,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "hidden_Step,hidden_UsersID,hidden_TimeStart,OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing,OPTION_2_CBox_Other,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital,otherTBox,hospiceTBox,OPTION_3_CBox_Medicare,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay,hospitalTBox,DischargeDateMM,DischargeDateDD,DischargeDateYY,typeOfPay_Radio,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientXML,roomNumberTBox,bedNumberTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,poNumberTBox,creditCardTypeTBox,creditCardNumberTBox,ccDateMM,ccDateDD,ccDateYY,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,orderingPhysicianUPINTBox,orderingPhysicianFaxTBox,orderingPhysicianAddressTBox,orderingPhysicianCityTBox,orderingPhysicianStateTBox,orderingPhysicianZipTBox,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo,Equipment1TypeTBox,Equipment1RentPurchasedSelect,Equipment1FromMM,Equipment1FromDD,Equipment1FromYY,Equipment1ToMM,Equipment1ToDD,Equipment1ToYY,Equipment1SupplierNameTBox,Equipment1SupplierTelephoneTBox,Equipment2TypeTBox,Equipment2RentPurchasedSelect,Equipment2FromMM,Equipment2FromDD,Equipment2FromYY,Equipment2ToMM,Equipment2ToDD,Equipment2ToYY,Equipment2SupplierNameTBox,Equipment2SupplierTelephoneTBox,Equipment3TypeTBox,Equipment3RentPurchasedSelect,Equipment3FromMM,Equipment3FromDD,Equipment3FromYY,Equipment3ToMM,Equipment3ToDD,Equipment3ToYY,Equipment3SupplierNameTBox,Equipment3SupplierTelephoneTBox,Equipment4TypeTBox,Equipment4RentPurchasedSelect,Equipment4FromMM,Equipment4FromDD,Equipment4FromYY,Equipment4ToMM,Equipment4ToDD,Equipment4ToYY,Equipment4SupplierNameTBox,Equipment4SupplierTelephoneTBox,Equipment5TypeTBox,Equipment5RentPurchasedSelect,Equipment5FromMM,Equipment5FromDD,Equipment5FromYY,Equipment5ToMM,Equipment5ToDD,Equipment5ToYY,Equipment5SupplierNameTBox,Equipment5SupplierTelephoneTBox,Equipment1NoteTBox,Equipment2NoteTBox,Equipment3NoteTBox,Equipment4NoteTBox,Equipment5NoteTBox,OPTION_14_CBox_OxygenPAo2,OPTION_14_CBox_OxygenSAo2,OPTION_14_CBox_OxygenSPo2,OxygenPAO2TBox,OxygenSAO2TBox,CPAPStudy_CBox,CPAPStudyNote,OxygenSPO2TBox,CPAPStudyOnFile_CBox,CPAPStudyOnFileNote,LabTestDateMM,LabTestDateDD,LabTestDateYY,CPAPStudyPerformedAt,LabTestFacilityTBox,CPAPStudyPerformedAt2,CPAPStudyPerformedAt3,ClosingInvoiceNumber,OPTION_SkilledNursing,SkilledNursingName,SkilledNursingTelephone,Printed,Active">	
			
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
				<!--- Only put the colunm if it is not already there.                                --->
				<!-------------------------------------------------------------------------------------->				
				<cfif NOT FindNoCase("#currentVar# =", columnsToUpdate)>
				
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
							
							<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
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
				
				</cfif>
			
			</cfloop>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "UPDATE intake  SET #columnsToUpdate# WHERE IntakeID = #trim(variables.instance.IntakeID)#">
				
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
			<cfset stringTableColumns = "hidden_Step,hidden_UsersID,hidden_TimeStart,OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing,OPTION_2_CBox_Other,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital,otherTBox,hospiceTBox,OPTION_3_CBox_Medicare,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay,hospitalTBox,DischargeDateMM,DischargeDateDD,DischargeDateYY,typeOfPay_Radio,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientXML,roomNumberTBox,bedNumberTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,poNumberTBox,creditCardTypeTBox,creditCardNumberTBox,ccDateMM,ccDateDD,ccDateYY,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,orderingPhysicianUPINTBox,orderingPhysicianFaxTBox,orderingPhysicianAddressTBox,orderingPhysicianCityTBox,orderingPhysicianStateTBox,orderingPhysicianZipTBox,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo,Equipment1TypeTBox,Equipment1RentPurchasedSelect,Equipment1FromMM,Equipment1FromDD,Equipment1FromYY,Equipment1ToMM,Equipment1ToDD,Equipment1ToYY,Equipment1SupplierNameTBox,Equipment1SupplierTelephoneTBox,Equipment2TypeTBox,Equipment2RentPurchasedSelect,Equipment2FromMM,Equipment2FromDD,Equipment2FromYY,Equipment2ToMM,Equipment2ToDD,Equipment2ToYY,Equipment2SupplierNameTBox,Equipment2SupplierTelephoneTBox,Equipment3TypeTBox,Equipment3RentPurchasedSelect,Equipment3FromMM,Equipment3FromDD,Equipment3FromYY,Equipment3ToMM,Equipment3ToDD,Equipment3ToYY,Equipment3SupplierNameTBox,Equipment3SupplierTelephoneTBox,Equipment4TypeTBox,Equipment4RentPurchasedSelect,Equipment4FromMM,Equipment4FromDD,Equipment4FromYY,Equipment4ToMM,Equipment4ToDD,Equipment4ToYY,Equipment4SupplierNameTBox,Equipment4SupplierTelephoneTBox,Equipment5TypeTBox,Equipment5RentPurchasedSelect,Equipment5FromMM,Equipment5FromDD,Equipment5FromYY,Equipment5ToMM,Equipment5ToDD,Equipment5ToYY,Equipment5SupplierNameTBox,Equipment5SupplierTelephoneTBox,Equipment1NoteTBox,Equipment2NoteTBox,Equipment3NoteTBox,Equipment4NoteTBox,Equipment5NoteTBox,OPTION_14_CBox_OxygenPAo2,OPTION_14_CBox_OxygenSAo2,OPTION_14_CBox_OxygenSPo2,OxygenPAO2TBox,OxygenSAO2TBox,CPAPStudy_CBox,CPAPStudyNote,OxygenSPO2TBox,CPAPStudyOnFile_CBox,CPAPStudyOnFileNote,LabTestDateMM,LabTestDateDD,LabTestDateYY,CPAPStudyPerformedAt,LabTestFacilityTBox,CPAPStudyPerformedAt2,CPAPStudyPerformedAt3,ClosingInvoiceNumber,OPTION_SkilledNursing,SkilledNursingName,SkilledNursingTelephone,Printed,Active">	
			
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
			<cfloop list="ClientID,AssignedToUserID,hidden_Step,hidden_UsersID,hidden_TimeStart,OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing,OPTION_2_CBox_Other,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital,otherTBox,hospiceTBox,OPTION_3_CBox_Medicare,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay,hospitalTBox,DischargeDateMM,DischargeDateDD,DischargeDateYY,typeOfPay_Radio,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientXML,patientID,patientAddressID,patientPhoneID,roomNumberTBox,bedNumberTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,poNumberTBox,creditCardTypeTBox,creditCardNumberTBox,ccDateMM,ccDateDD,ccDateYY,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,orderingPhysicianUPINTBox,orderingPhysicianFaxTBox,orderingPhysicianAddressTBox,orderingPhysicianCityTBox,orderingPhysicianStateTBox,orderingPhysicianZipTBox,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo,Equipment1TypeTBox,Equipment1RentPurchasedSelect,Equipment1FromMM,Equipment1FromDD,Equipment1FromYY,Equipment1ToMM,Equipment1ToDD,Equipment1ToYY,Equipment1SupplierNameTBox,Equipment1SupplierTelephoneTBox,Equipment2TypeTBox,Equipment2RentPurchasedSelect,Equipment2FromMM,Equipment2FromDD,Equipment2FromYY,Equipment2ToMM,Equipment2ToDD,Equipment2ToYY,Equipment2SupplierNameTBox,Equipment2SupplierTelephoneTBox,Equipment3TypeTBox,Equipment3RentPurchasedSelect,Equipment3FromMM,Equipment3FromDD,Equipment3FromYY,Equipment3ToMM,Equipment3ToDD,Equipment3ToYY,Equipment3SupplierNameTBox,Equipment3SupplierTelephoneTBox,Equipment4TypeTBox,Equipment4RentPurchasedSelect,Equipment4FromMM,Equipment4FromDD,Equipment4FromYY,Equipment4ToMM,Equipment4ToDD,Equipment4ToYY,Equipment4SupplierNameTBox,Equipment4SupplierTelephoneTBox,Equipment5TypeTBox,Equipment5RentPurchasedSelect,Equipment5FromMM,Equipment5FromDD,Equipment5FromYY,Equipment5ToMM,Equipment5ToDD,Equipment5ToYY,Equipment5SupplierNameTBox,Equipment5SupplierTelephoneTBox,Equipment1NoteTBox,Equipment2NoteTBox,Equipment3NoteTBox,Equipment4NoteTBox,Equipment5NoteTBox,OPTION_14_CBox_OxygenPAo2,OPTION_14_CBox_OxygenSAo2,OPTION_14_CBox_OxygenSPo2,OxygenPAO2TBox,OxygenSAO2TBox,CPAPStudy_CBox,CPAPStudyNote,OxygenSPO2TBox,CPAPStudyOnFile_CBox,CPAPStudyOnFileNote,LabTestDateMM,LabTestDateDD,LabTestDateYY,CPAPStudyPerformedAt,LabTestFacilityTBox,CPAPStudyPerformedAt2,CPAPStudyPerformedAt3,ClosingInvoiceNumber,OPTION_SkilledNursing,SkilledNursingName,SkilledNursingTelephone,Printed,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
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
						
						<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
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
				<cfset sqlStatement = "INSERT INTO intake  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS IntakeID ">
				
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
	<cffunction name="getIntakeQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getIntakeQuery">						
		<cfargument name="Fields" required="No" type="String" default="IntakeID,ClientID,AssignedToUserID,hidden_Step,hidden_UsersID,hidden_TimeStart,OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing,OPTION_2_CBox_Other,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital,otherTBox,hospiceTBox,OPTION_3_CBox_Medicare,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay,hospitalTBox,DischargeDateMM,DischargeDateDD,DischargeDateYY,typeOfPay_Radio,callerFNameTBox,callerMInitialTBox,callerLNameTBox,callerPhoneTBox,patientXML,patientID,patientAddressID,patientPhoneID,roomNumberTBox,bedNumberTBox,alternateContactFNameTBox,alternateContactMInitialTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,alternateContactWorkPhoneTBox,poNumberTBox,creditCardTypeTBox,creditCardNumberTBox,ccDateMM,ccDateDD,ccDateYY,orderingPhysicianFNameTBox,orderingPhysicianMInitialTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,orderingPhysicianUPINTBox,orderingPhysicianFaxTBox,orderingPhysicianAddressTBox,orderingPhysicianCityTBox,orderingPhysicianStateTBox,orderingPhysicianZipTBox,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo,Equipment1TypeTBox,Equipment1RentPurchasedSelect,Equipment1FromMM,Equipment1FromDD,Equipment1FromYY,Equipment1ToMM,Equipment1ToDD,Equipment1ToYY,Equipment1SupplierNameTBox,Equipment1SupplierTelephoneTBox,Equipment2TypeTBox,Equipment2RentPurchasedSelect,Equipment2FromMM,Equipment2FromDD,Equipment2FromYY,Equipment2ToMM,Equipment2ToDD,Equipment2ToYY,Equipment2SupplierNameTBox,Equipment2SupplierTelephoneTBox,Equipment3TypeTBox,Equipment3RentPurchasedSelect,Equipment3FromMM,Equipment3FromDD,Equipment3FromYY,Equipment3ToMM,Equipment3ToDD,Equipment3ToYY,Equipment3SupplierNameTBox,Equipment3SupplierTelephoneTBox,Equipment4TypeTBox,Equipment4RentPurchasedSelect,Equipment4FromMM,Equipment4FromDD,Equipment4FromYY,Equipment4ToMM,Equipment4ToDD,Equipment4ToYY,Equipment4SupplierNameTBox,Equipment4SupplierTelephoneTBox,Equipment5TypeTBox,Equipment5RentPurchasedSelect,Equipment5FromMM,Equipment5FromDD,Equipment5FromYY,Equipment5ToMM,Equipment5ToDD,Equipment5ToYY,Equipment5SupplierNameTBox,Equipment5SupplierTelephoneTBox,Equipment1NoteTBox,Equipment2NoteTBox,Equipment3NoteTBox,Equipment4NoteTBox,Equipment5NoteTBox,OPTION_14_CBox_OxygenPAo2,OPTION_14_CBox_OxygenSAo2,OPTION_14_CBox_OxygenSPo2,OxygenPAO2TBox,OxygenSAO2TBox,CPAPStudy_CBox,CPAPStudyNote,OxygenSPO2TBox,CPAPStudyOnFile_CBox,CPAPStudyOnFileNote,LabTestDateMM,LabTestDateDD,LabTestDateYY,CPAPStudyPerformedAt,LabTestFacilityTBox,CPAPStudyPerformedAt2,CPAPStudyPerformedAt3,ClosingInvoiceNumber,OPTION_SkilledNursing,SkilledNursingName,SkilledNursingTelephone,Printed,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="IntakeID" required="No" type="String" default="">
		<cfargument name="IntakeID_IN" required="No" type="String" default="">
		<cfargument name="IntakeID_LIKE" required="No" type="String" default="">
		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="ClientID_IN" required="No" type="String" default="">
		<cfargument name="ClientID_LIKE" required="No" type="String" default="">
		<cfargument name="AssignedToUserID" required="No" type="String" default="">
		<cfargument name="AssignedToUserID_IN" required="No" type="String" default="">
		<cfargument name="AssignedToUserID_LIKE" required="No" type="String" default="">
		<cfargument name="hidden_Step" required="No" type="String" default="">
		<cfargument name="hidden_Step_IN" required="No" type="String" default="">
		<cfargument name="hidden_Step_LIKE" required="No" type="String" default="">
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
		<cfargument name="OPTION_2_CBox_Other" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Other_IN" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Other_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Hospice" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Hospice_IN" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Hospice_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Hospital" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Hospital_IN" required="No" type="String" default="">
		<cfargument name="OPTION_2_CBox_Hospital_LIKE" required="No" type="String" default="">
		<cfargument name="otherTBox" required="No" type="String" default="">
		<cfargument name="otherTBox_IN" required="No" type="String" default="">
		<cfargument name="otherTBox_LIKE" required="No" type="String" default="">
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
		<cfargument name="callerFNameTBox" required="No" type="String" default="">
		<cfargument name="callerFNameTBox_IN" required="No" type="String" default="">
		<cfargument name="callerFNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="callerMInitialTBox" required="No" type="String" default="">
		<cfargument name="callerMInitialTBox_IN" required="No" type="String" default="">
		<cfargument name="callerMInitialTBox_LIKE" required="No" type="String" default="">
		<cfargument name="callerLNameTBox" required="No" type="String" default="">
		<cfargument name="callerLNameTBox_IN" required="No" type="String" default="">
		<cfargument name="callerLNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="callerPhoneTBox" required="No" type="String" default="">
		<cfargument name="callerPhoneTBox_IN" required="No" type="String" default="">
		<cfargument name="callerPhoneTBox_LIKE" required="No" type="String" default="">
		<cfargument name="patientXML" required="No" type="String" default="">
		<cfargument name="patientXML_IN" required="No" type="String" default="">
		<cfargument name="patientXML_LIKE" required="No" type="String" default="">
		<cfargument name="patientID" required="No" type="String" default="">
		<cfargument name="patientID_IN" required="No" type="String" default="">
		<cfargument name="patientID_LIKE" required="No" type="String" default="">
		<cfargument name="patientAddressID" required="No" type="String" default="">
		<cfargument name="patientAddressID_IN" required="No" type="String" default="">
		<cfargument name="patientAddressID_LIKE" required="No" type="String" default="">
		<cfargument name="patientPhoneID" required="No" type="String" default="">
		<cfargument name="patientPhoneID_IN" required="No" type="String" default="">
		<cfargument name="patientPhoneID_LIKE" required="No" type="String" default="">
		<cfargument name="roomNumberTBox" required="No" type="String" default="">
		<cfargument name="roomNumberTBox_IN" required="No" type="String" default="">
		<cfargument name="roomNumberTBox_LIKE" required="No" type="String" default="">
		<cfargument name="bedNumberTBox" required="No" type="String" default="">
		<cfargument name="bedNumberTBox_IN" required="No" type="String" default="">
		<cfargument name="bedNumberTBox_LIKE" required="No" type="String" default="">
		<cfargument name="alternateContactFNameTBox" required="No" type="String" default="">
		<cfargument name="alternateContactFNameTBox_IN" required="No" type="String" default="">
		<cfargument name="alternateContactFNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="alternateContactMInitialTBox" required="No" type="String" default="">
		<cfargument name="alternateContactMInitialTBox_IN" required="No" type="String" default="">
		<cfargument name="alternateContactMInitialTBox_LIKE" required="No" type="String" default="">
		<cfargument name="alternateContactLNameTBox" required="No" type="String" default="">
		<cfargument name="alternateContactLNameTBox_IN" required="No" type="String" default="">
		<cfargument name="alternateContactLNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="alternateContactRelationshipTBox" required="No" type="String" default="">
		<cfargument name="alternateContactRelationshipTBox_IN" required="No" type="String" default="">
		<cfargument name="alternateContactRelationshipTBox_LIKE" required="No" type="String" default="">
		<cfargument name="alternateContactPhoneTBox" required="No" type="String" default="">
		<cfargument name="alternateContactPhoneTBox_IN" required="No" type="String" default="">
		<cfargument name="alternateContactPhoneTBox_LIKE" required="No" type="String" default="">
		<cfargument name="alternateContactWorkPhoneTBox" required="No" type="String" default="">
		<cfargument name="alternateContactWorkPhoneTBox_IN" required="No" type="String" default="">
		<cfargument name="alternateContactWorkPhoneTBox_LIKE" required="No" type="String" default="">
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
		<cfargument name="orderingPhysicianFNameTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianFNameTBox_IN" required="No" type="String" default="">
		<cfargument name="orderingPhysicianFNameTBox_LIKE" required="No" type="String" default="">
		<cfargument name="orderingPhysicianMInitialTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianMInitialTBox_IN" required="No" type="String" default="">
		<cfargument name="orderingPhysicianMInitialTBox_LIKE" required="No" type="String" default="">
		<cfargument name="orderingPhysicianLNameTBox" required="No" type="String" default="">
		<cfargument name="orderingPhysicianLNameTBox_IN" required="No" type="String" default="">
		<cfargument name="orderingPhysicianLNameTBox_LIKE" required="No" type="String" default="">
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
		<cfargument name="Equipment1NoteTBox" required="No" type="String" default="">
		<cfargument name="Equipment1NoteTBox_IN" required="No" type="String" default="">
		<cfargument name="Equipment1NoteTBox_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment2NoteTBox" required="No" type="String" default="">
		<cfargument name="Equipment2NoteTBox_IN" required="No" type="String" default="">
		<cfargument name="Equipment2NoteTBox_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment3NoteTBox" required="No" type="String" default="">
		<cfargument name="Equipment3NoteTBox_IN" required="No" type="String" default="">
		<cfargument name="Equipment3NoteTBox_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment4NoteTBox" required="No" type="String" default="">
		<cfargument name="Equipment4NoteTBox_IN" required="No" type="String" default="">
		<cfargument name="Equipment4NoteTBox_LIKE" required="No" type="String" default="">
		<cfargument name="Equipment5NoteTBox" required="No" type="String" default="">
		<cfargument name="Equipment5NoteTBox_IN" required="No" type="String" default="">
		<cfargument name="Equipment5NoteTBox_LIKE" required="No" type="String" default="">
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
		<cfargument name="ClosingInvoiceNumber" required="No" type="String" default="">
		<cfargument name="ClosingInvoiceNumber_IN" required="No" type="String" default="">
		<cfargument name="ClosingInvoiceNumber_LIKE" required="No" type="String" default="">
		<cfargument name="OPTION_SkilledNursing" required="No" type="String" default="">
		<cfargument name="OPTION_SkilledNursing_IN" required="No" type="String" default="">
		<cfargument name="OPTION_SkilledNursing_LIKE" required="No" type="String" default="">
		<cfargument name="SkilledNursingName" required="No" type="String" default="">
		<cfargument name="SkilledNursingName_IN" required="No" type="String" default="">
		<cfargument name="SkilledNursingName_LIKE" required="No" type="String" default="">
		<cfargument name="SkilledNursingTelephone" required="No" type="String" default="">
		<cfargument name="SkilledNursingTelephone_IN" required="No" type="String" default="">
		<cfargument name="SkilledNursingTelephone_LIKE" required="No" type="String" default="">
		<cfargument name="Printed" required="No" type="String" default="">
		<cfargument name="Printed_IN" required="No" type="String" default="">
		<cfargument name="Printed_LIKE" required="No" type="String" default="">
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
			<cfset availableColumns = "IntakeID,IntakeID_IN,IntakeID_LIKE,ClientID,ClientID_IN,ClientID_LIKE,AssignedToUserID,AssignedToUserID_IN,AssignedToUserID_LIKE,hidden_Step,hidden_Step_IN,hidden_Step_LIKE,hidden_UsersID,hidden_UsersID_IN,hidden_UsersID_LIKE,hidden_TimeStart,hidden_TimeStart_IN,hidden_TimeStart_LIKE,OPTION_1_CBox_Delivery,OPTION_1_CBox_Delivery_IN,OPTION_1_CBox_Delivery_LIKE,OPTION_1_CBox_Pickup,OPTION_1_CBox_Pickup_IN,OPTION_1_CBox_Pickup_LIKE,OPTION_1_CBox_Repair,OPTION_1_CBox_Repair_IN,OPTION_1_CBox_Repair_LIKE,OPTION_1_CBox_Switch,OPTION_1_CBox_Switch_IN,OPTION_1_CBox_Switch_LIKE,OPTION_1_CBox_Existing,OPTION_1_CBox_Existing_IN,OPTION_1_CBox_Existing_LIKE,OPTION_2_CBox_Other,OPTION_2_CBox_Other_IN,OPTION_2_CBox_Other_LIKE,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospice_IN,OPTION_2_CBox_Hospice_LIKE,OPTION_2_CBox_Hospital,OPTION_2_CBox_Hospital_IN,OPTION_2_CBox_Hospital_LIKE,otherTBox,otherTBox_IN,otherTBox_LIKE,hospiceTBox,hospiceTBox_IN,hospiceTBox_LIKE,OPTION_3_CBox_Medicare,OPTION_3_CBox_Medicare_IN,OPTION_3_CBox_Medicare_LIKE,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_PrivateInsurance_IN,OPTION_3_CBox_PrivateInsurance_LIKE,OPTION_3_CBox_Medicaid,OPTION_3_CBox_Medicaid_IN,OPTION_3_CBox_Medicaid_LIKE,OPTION_3_CBox_PrivatePay,OPTION_3_CBox_PrivatePay_IN,OPTION_3_CBox_PrivatePay_LIKE,hospitalTBox,hospitalTBox_IN,hospitalTBox_LIKE,DischargeDateMM,DischargeDateMM_IN,DischargeDateMM_LIKE,DischargeDateDD,DischargeDateDD_IN,DischargeDateDD_LIKE,DischargeDateYY,DischargeDateYY_IN,DischargeDateYY_LIKE,typeOfPay_Radio,typeOfPay_Radio_IN,typeOfPay_Radio_LIKE,callerFNameTBox,callerFNameTBox_IN,callerFNameTBox_LIKE,callerMInitialTBox,callerMInitialTBox_IN,callerMInitialTBox_LIKE,callerLNameTBox,callerLNameTBox_IN,callerLNameTBox_LIKE,callerPhoneTBox,callerPhoneTBox_IN,callerPhoneTBox_LIKE,patientXML,patientXML_IN,patientXML_LIKE,patientID,patientID_IN,patientID_LIKE,patientAddressID,patientAddressID_IN,patientAddressID_LIKE,patientPhoneID,patientPhoneID_IN,patientPhoneID_LIKE,roomNumberTBox,roomNumberTBox_IN,roomNumberTBox_LIKE,bedNumberTBox,bedNumberTBox_IN,bedNumberTBox_LIKE,alternateContactFNameTBox,alternateContactFNameTBox_IN,alternateContactFNameTBox_LIKE,alternateContactMInitialTBox,alternateContactMInitialTBox_IN,alternateContactMInitialTBox_LIKE,alternateContactLNameTBox,alternateContactLNameTBox_IN,alternateContactLNameTBox_LIKE,alternateContactRelationshipTBox,alternateContactRelationshipTBox_IN,alternateContactRelationshipTBox_LIKE,alternateContactPhoneTBox,alternateContactPhoneTBox_IN,alternateContactPhoneTBox_LIKE,alternateContactWorkPhoneTBox,alternateContactWorkPhoneTBox_IN,alternateContactWorkPhoneTBox_LIKE,poNumberTBox,poNumberTBox_IN,poNumberTBox_LIKE,creditCardTypeTBox,creditCardTypeTBox_IN,creditCardTypeTBox_LIKE,creditCardNumberTBox,creditCardNumberTBox_IN,creditCardNumberTBox_LIKE,ccDateMM,ccDateMM_IN,ccDateMM_LIKE,ccDateDD,ccDateDD_IN,ccDateDD_LIKE,ccDateYY,ccDateYY_IN,ccDateYY_LIKE,orderingPhysicianFNameTBox,orderingPhysicianFNameTBox_IN,orderingPhysicianFNameTBox_LIKE,orderingPhysicianMInitialTBox,orderingPhysicianMInitialTBox_IN,orderingPhysicianMInitialTBox_LIKE,orderingPhysicianLNameTBox,orderingPhysicianLNameTBox_IN,orderingPhysicianLNameTBox_LIKE,orderingPhysicianPhoneTBox,orderingPhysicianPhoneTBox_IN,orderingPhysicianPhoneTBox_LIKE,orderingPhysicianUPINTBox,orderingPhysicianUPINTBox_IN,orderingPhysicianUPINTBox_LIKE,orderingPhysicianFaxTBox,orderingPhysicianFaxTBox_IN,orderingPhysicianFaxTBox_LIKE,orderingPhysicianAddressTBox,orderingPhysicianAddressTBox_IN,orderingPhysicianAddressTBox_LIKE,orderingPhysicianCityTBox,orderingPhysicianCityTBox_IN,orderingPhysicianCityTBox_LIKE,orderingPhysicianStateTBox,orderingPhysicianStateTBox_IN,orderingPhysicianStateTBox_LIKE,orderingPhysicianZipTBox,orderingPhysicianZipTBox_IN,orderingPhysicianZipTBox_LIKE,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentYes_IN,OPTION_13_CBox_PastEquipmentYes_LIKE,OPTION_13_CBox_PastEquipmentNo,OPTION_13_CBox_PastEquipmentNo_IN,OPTION_13_CBox_PastEquipmentNo_LIKE,Equipment1TypeTBox,Equipment1TypeTBox_IN,Equipment1TypeTBox_LIKE,Equipment1RentPurchasedSelect,Equipment1RentPurchasedSelect_IN,Equipment1RentPurchasedSelect_LIKE,Equipment1FromMM,Equipment1FromMM_IN,Equipment1FromMM_LIKE,Equipment1FromDD,Equipment1FromDD_IN,Equipment1FromDD_LIKE,Equipment1FromYY,Equipment1FromYY_IN,Equipment1FromYY_LIKE,Equipment1ToMM,Equipment1ToMM_IN,Equipment1ToMM_LIKE,Equipment1ToDD,Equipment1ToDD_IN,Equipment1ToDD_LIKE,Equipment1ToYY,Equipment1ToYY_IN,Equipment1ToYY_LIKE,Equipment1SupplierNameTBox,Equipment1SupplierNameTBox_IN,Equipment1SupplierNameTBox_LIKE,Equipment1SupplierTelephoneTBox,Equipment1SupplierTelephoneTBox_IN,Equipment1SupplierTelephoneTBox_LIKE,Equipment2TypeTBox,Equipment2TypeTBox_IN,Equipment2TypeTBox_LIKE,Equipment2RentPurchasedSelect,Equipment2RentPurchasedSelect_IN,Equipment2RentPurchasedSelect_LIKE,Equipment2FromMM,Equipment2FromMM_IN,Equipment2FromMM_LIKE,Equipment2FromDD,Equipment2FromDD_IN,Equipment2FromDD_LIKE,Equipment2FromYY,Equipment2FromYY_IN,Equipment2FromYY_LIKE,Equipment2ToMM,Equipment2ToMM_IN,Equipment2ToMM_LIKE,Equipment2ToDD,Equipment2ToDD_IN,Equipment2ToDD_LIKE,Equipment2ToYY,Equipment2ToYY_IN,Equipment2ToYY_LIKE,Equipment2SupplierNameTBox,Equipment2SupplierNameTBox_IN,Equipment2SupplierNameTBox_LIKE,Equipment2SupplierTelephoneTBox,Equipment2SupplierTelephoneTBox_IN,Equipment2SupplierTelephoneTBox_LIKE,Equipment3TypeTBox,Equipment3TypeTBox_IN,Equipment3TypeTBox_LIKE,Equipment3RentPurchasedSelect,Equipment3RentPurchasedSelect_IN,Equipment3RentPurchasedSelect_LIKE,Equipment3FromMM,Equipment3FromMM_IN,Equipment3FromMM_LIKE,Equipment3FromDD,Equipment3FromDD_IN,Equipment3FromDD_LIKE,Equipment3FromYY,Equipment3FromYY_IN,Equipment3FromYY_LIKE,Equipment3ToMM,Equipment3ToMM_IN,Equipment3ToMM_LIKE,Equipment3ToDD,Equipment3ToDD_IN,Equipment3ToDD_LIKE,Equipment3ToYY,Equipment3ToYY_IN,Equipment3ToYY_LIKE,Equipment3SupplierNameTBox,Equipment3SupplierNameTBox_IN,Equipment3SupplierNameTBox_LIKE,Equipment3SupplierTelephoneTBox,Equipment3SupplierTelephoneTBox_IN,Equipment3SupplierTelephoneTBox_LIKE,Equipment4TypeTBox,Equipment4TypeTBox_IN,Equipment4TypeTBox_LIKE,Equipment4RentPurchasedSelect,Equipment4RentPurchasedSelect_IN,Equipment4RentPurchasedSelect_LIKE,Equipment4FromMM,Equipment4FromMM_IN,Equipment4FromMM_LIKE,Equipment4FromDD,Equipment4FromDD_IN,Equipment4FromDD_LIKE,Equipment4FromYY,Equipment4FromYY_IN,Equipment4FromYY_LIKE,Equipment4ToMM,Equipment4ToMM_IN,Equipment4ToMM_LIKE,Equipment4ToDD,Equipment4ToDD_IN,Equipment4ToDD_LIKE,Equipment4ToYY,Equipment4ToYY_IN,Equipment4ToYY_LIKE,Equipment4SupplierNameTBox,Equipment4SupplierNameTBox_IN,Equipment4SupplierNameTBox_LIKE,Equipment4SupplierTelephoneTBox,Equipment4SupplierTelephoneTBox_IN,Equipment4SupplierTelephoneTBox_LIKE,Equipment5TypeTBox,Equipment5TypeTBox_IN,Equipment5TypeTBox_LIKE,Equipment5RentPurchasedSelect,Equipment5RentPurchasedSelect_IN,Equipment5RentPurchasedSelect_LIKE,Equipment5FromMM,Equipment5FromMM_IN,Equipment5FromMM_LIKE,Equipment5FromDD,Equipment5FromDD_IN,Equipment5FromDD_LIKE,Equipment5FromYY,Equipment5FromYY_IN,Equipment5FromYY_LIKE,Equipment5ToMM,Equipment5ToMM_IN,Equipment5ToMM_LIKE,Equipment5ToDD,Equipment5ToDD_IN,Equipment5ToDD_LIKE,Equipment5ToYY,Equipment5ToYY_IN,Equipment5ToYY_LIKE,Equipment5SupplierNameTBox,Equipment5SupplierNameTBox_IN,Equipment5SupplierNameTBox_LIKE,Equipment5SupplierTelephoneTBox,Equipment5SupplierTelephoneTBox_IN,Equipment5SupplierTelephoneTBox_LIKE,Equipment1NoteTBox,Equipment1NoteTBox_IN,Equipment1NoteTBox_LIKE,Equipment2NoteTBox,Equipment2NoteTBox_IN,Equipment2NoteTBox_LIKE,Equipment3NoteTBox,Equipment3NoteTBox_IN,Equipment3NoteTBox_LIKE,Equipment4NoteTBox,Equipment4NoteTBox_IN,Equipment4NoteTBox_LIKE,Equipment5NoteTBox,Equipment5NoteTBox_IN,Equipment5NoteTBox_LIKE,OPTION_14_CBox_OxygenPAo2,OPTION_14_CBox_OxygenPAo2_IN,OPTION_14_CBox_OxygenPAo2_LIKE,OPTION_14_CBox_OxygenSAo2,OPTION_14_CBox_OxygenSAo2_IN,OPTION_14_CBox_OxygenSAo2_LIKE,OPTION_14_CBox_OxygenSPo2,OPTION_14_CBox_OxygenSPo2_IN,OPTION_14_CBox_OxygenSPo2_LIKE,OxygenPAO2TBox,OxygenPAO2TBox_IN,OxygenPAO2TBox_LIKE,OxygenSAO2TBox,OxygenSAO2TBox_IN,OxygenSAO2TBox_LIKE,CPAPStudy_CBox,CPAPStudy_CBox_IN,CPAPStudy_CBox_LIKE,CPAPStudyNote,CPAPStudyNote_IN,CPAPStudyNote_LIKE,OxygenSPO2TBox,OxygenSPO2TBox_IN,OxygenSPO2TBox_LIKE,CPAPStudyOnFile_CBox,CPAPStudyOnFile_CBox_IN,CPAPStudyOnFile_CBox_LIKE,CPAPStudyOnFileNote,CPAPStudyOnFileNote_IN,CPAPStudyOnFileNote_LIKE,LabTestDateMM,LabTestDateMM_IN,LabTestDateMM_LIKE,LabTestDateDD,LabTestDateDD_IN,LabTestDateDD_LIKE,LabTestDateYY,LabTestDateYY_IN,LabTestDateYY_LIKE,CPAPStudyPerformedAt,CPAPStudyPerformedAt_IN,CPAPStudyPerformedAt_LIKE,LabTestFacilityTBox,LabTestFacilityTBox_IN,LabTestFacilityTBox_LIKE,CPAPStudyPerformedAt2,CPAPStudyPerformedAt2_IN,CPAPStudyPerformedAt2_LIKE,CPAPStudyPerformedAt3,CPAPStudyPerformedAt3_IN,CPAPStudyPerformedAt3_LIKE,ClosingInvoiceNumber,ClosingInvoiceNumber_IN,ClosingInvoiceNumber_LIKE,OPTION_SkilledNursing,OPTION_SkilledNursing_IN,OPTION_SkilledNursing_LIKE,SkilledNursingName,SkilledNursingName_IN,SkilledNursingName_LIKE,SkilledNursingTelephone,SkilledNursingTelephone_IN,SkilledNursingTelephone_LIKE,Printed,Printed_IN,Printed_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="Intake"
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
			<cfquery Name="getIntakeQuery" datasource="#trim(request.datasource)#">
				SELECT #trim(Fields)#
				FROM intake   
				WHERE 1=1
					<cfif IntakeID NEQ "" AND IsNumeric(IntakeID)>AND IntakeID = #IntakeID#</cfif>
					<cfif IntakeID_IN NEQ "">AND IntakeID IN(#trim(IntakeID_IN)#)</cfif>
					<cfif IntakeID_LIKE NEQ "">AND IntakeID LIKE '%#trim(IntakeID_LIKE)#%'</cfif>
					<cfif ClientID NEQ "" AND IsNumeric(ClientID)>AND ClientID = #ClientID#</cfif>
					<cfif ClientID_IN NEQ "">AND ClientID IN(#trim(ClientID_IN)#)</cfif>
					<cfif ClientID_LIKE NEQ "">AND ClientID LIKE '%#trim(ClientID_LIKE)#%'</cfif>
					<cfif AssignedToUserID NEQ "" AND IsNumeric(AssignedToUserID)>AND AssignedToUserID = #AssignedToUserID#</cfif>
					<cfif AssignedToUserID_IN NEQ "">AND AssignedToUserID IN(#trim(AssignedToUserID_IN)#)</cfif>
					<cfif AssignedToUserID_LIKE NEQ "">AND AssignedToUserID LIKE '%#trim(AssignedToUserID_LIKE)#%'</cfif>
					<cfif hidden_Step NEQ "">AND hidden_Step = '#hidden_Step#'</cfif>
					<cfif hidden_Step_IN NEQ "">AND hidden_Step IN(#trim(hidden_Step_IN)#)</cfif>
					<cfif hidden_Step_LIKE NEQ "">AND hidden_Step LIKE '%#trim(hidden_Step_LIKE)#%'</cfif>
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
					<cfif OPTION_2_CBox_Other NEQ "">AND OPTION_2_CBox_Other = '#OPTION_2_CBox_Other#'</cfif>
					<cfif OPTION_2_CBox_Other_IN NEQ "">AND OPTION_2_CBox_Other IN(#trim(OPTION_2_CBox_Other_IN)#)</cfif>
					<cfif OPTION_2_CBox_Other_LIKE NEQ "">AND OPTION_2_CBox_Other LIKE '%#trim(OPTION_2_CBox_Other_LIKE)#%'</cfif>
					<cfif OPTION_2_CBox_Hospice NEQ "">AND OPTION_2_CBox_Hospice = '#OPTION_2_CBox_Hospice#'</cfif>
					<cfif OPTION_2_CBox_Hospice_IN NEQ "">AND OPTION_2_CBox_Hospice IN(#trim(OPTION_2_CBox_Hospice_IN)#)</cfif>
					<cfif OPTION_2_CBox_Hospice_LIKE NEQ "">AND OPTION_2_CBox_Hospice LIKE '%#trim(OPTION_2_CBox_Hospice_LIKE)#%'</cfif>
					<cfif OPTION_2_CBox_Hospital NEQ "">AND OPTION_2_CBox_Hospital = '#OPTION_2_CBox_Hospital#'</cfif>
					<cfif OPTION_2_CBox_Hospital_IN NEQ "">AND OPTION_2_CBox_Hospital IN(#trim(OPTION_2_CBox_Hospital_IN)#)</cfif>
					<cfif OPTION_2_CBox_Hospital_LIKE NEQ "">AND OPTION_2_CBox_Hospital LIKE '%#trim(OPTION_2_CBox_Hospital_LIKE)#%'</cfif>
					<cfif otherTBox NEQ "">AND otherTBox = '#otherTBox#'</cfif>
					<cfif otherTBox_IN NEQ "">AND otherTBox IN(#trim(otherTBox_IN)#)</cfif>
					<cfif otherTBox_LIKE NEQ "">AND otherTBox LIKE '%#trim(otherTBox_LIKE)#%'</cfif>
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
					<cfif callerFNameTBox NEQ "">AND callerFNameTBox = '#callerFNameTBox#'</cfif>
					<cfif callerFNameTBox_IN NEQ "">AND callerFNameTBox IN(#trim(callerFNameTBox_IN)#)</cfif>
					<cfif callerFNameTBox_LIKE NEQ "">AND callerFNameTBox LIKE '%#trim(callerFNameTBox_LIKE)#%'</cfif>
					<cfif callerMInitialTBox NEQ "">AND callerMInitialTBox = '#callerMInitialTBox#'</cfif>
					<cfif callerMInitialTBox_IN NEQ "">AND callerMInitialTBox IN(#trim(callerMInitialTBox_IN)#)</cfif>
					<cfif callerMInitialTBox_LIKE NEQ "">AND callerMInitialTBox LIKE '%#trim(callerMInitialTBox_LIKE)#%'</cfif>
					<cfif callerLNameTBox NEQ "">AND callerLNameTBox = '#callerLNameTBox#'</cfif>
					<cfif callerLNameTBox_IN NEQ "">AND callerLNameTBox IN(#trim(callerLNameTBox_IN)#)</cfif>
					<cfif callerLNameTBox_LIKE NEQ "">AND callerLNameTBox LIKE '%#trim(callerLNameTBox_LIKE)#%'</cfif>
					<cfif callerPhoneTBox NEQ "">AND callerPhoneTBox = '#callerPhoneTBox#'</cfif>
					<cfif callerPhoneTBox_IN NEQ "">AND callerPhoneTBox IN(#trim(callerPhoneTBox_IN)#)</cfif>
					<cfif callerPhoneTBox_LIKE NEQ "">AND callerPhoneTBox LIKE '%#trim(callerPhoneTBox_LIKE)#%'</cfif>
					<cfif patientXML NEQ "">AND patientXML = '#patientXML#'</cfif>
					<cfif patientXML_IN NEQ "">AND patientXML IN(#trim(patientXML_IN)#)</cfif>
					<cfif patientXML_LIKE NEQ "">AND patientXML LIKE '%#trim(patientXML_LIKE)#%'</cfif>
					<cfif patientID NEQ "" AND IsNumeric(patientID)>AND patientID = #patientID#</cfif>
					<cfif patientID_IN NEQ "">AND patientID IN(#trim(patientID_IN)#)</cfif>
					<cfif patientID_LIKE NEQ "">AND patientID LIKE '%#trim(patientID_LIKE)#%'</cfif>
					<cfif patientAddressID NEQ "" AND IsNumeric(patientAddressID)>AND patientAddressID = #patientAddressID#</cfif>
					<cfif patientAddressID_IN NEQ "">AND patientAddressID IN(#trim(patientAddressID_IN)#)</cfif>
					<cfif patientAddressID_LIKE NEQ "">AND patientAddressID LIKE '%#trim(patientAddressID_LIKE)#%'</cfif>
					<cfif patientPhoneID NEQ "" AND IsNumeric(patientPhoneID)>AND patientPhoneID = #patientPhoneID#</cfif>
					<cfif patientPhoneID_IN NEQ "">AND patientPhoneID IN(#trim(patientPhoneID_IN)#)</cfif>
					<cfif patientPhoneID_LIKE NEQ "">AND patientPhoneID LIKE '%#trim(patientPhoneID_LIKE)#%'</cfif>
					<cfif roomNumberTBox NEQ "">AND roomNumberTBox = '#roomNumberTBox#'</cfif>
					<cfif roomNumberTBox_IN NEQ "">AND roomNumberTBox IN(#trim(roomNumberTBox_IN)#)</cfif>
					<cfif roomNumberTBox_LIKE NEQ "">AND roomNumberTBox LIKE '%#trim(roomNumberTBox_LIKE)#%'</cfif>
					<cfif bedNumberTBox NEQ "">AND bedNumberTBox = '#bedNumberTBox#'</cfif>
					<cfif bedNumberTBox_IN NEQ "">AND bedNumberTBox IN(#trim(bedNumberTBox_IN)#)</cfif>
					<cfif bedNumberTBox_LIKE NEQ "">AND bedNumberTBox LIKE '%#trim(bedNumberTBox_LIKE)#%'</cfif>
					<cfif alternateContactFNameTBox NEQ "">AND alternateContactFNameTBox = '#alternateContactFNameTBox#'</cfif>
					<cfif alternateContactFNameTBox_IN NEQ "">AND alternateContactFNameTBox IN(#trim(alternateContactFNameTBox_IN)#)</cfif>
					<cfif alternateContactFNameTBox_LIKE NEQ "">AND alternateContactFNameTBox LIKE '%#trim(alternateContactFNameTBox_LIKE)#%'</cfif>
					<cfif alternateContactMInitialTBox NEQ "">AND alternateContactMInitialTBox = '#alternateContactMInitialTBox#'</cfif>
					<cfif alternateContactMInitialTBox_IN NEQ "">AND alternateContactMInitialTBox IN(#trim(alternateContactMInitialTBox_IN)#)</cfif>
					<cfif alternateContactMInitialTBox_LIKE NEQ "">AND alternateContactMInitialTBox LIKE '%#trim(alternateContactMInitialTBox_LIKE)#%'</cfif>
					<cfif alternateContactLNameTBox NEQ "">AND alternateContactLNameTBox = '#alternateContactLNameTBox#'</cfif>
					<cfif alternateContactLNameTBox_IN NEQ "">AND alternateContactLNameTBox IN(#trim(alternateContactLNameTBox_IN)#)</cfif>
					<cfif alternateContactLNameTBox_LIKE NEQ "">AND alternateContactLNameTBox LIKE '%#trim(alternateContactLNameTBox_LIKE)#%'</cfif>
					<cfif alternateContactRelationshipTBox NEQ "">AND alternateContactRelationshipTBox = '#alternateContactRelationshipTBox#'</cfif>
					<cfif alternateContactRelationshipTBox_IN NEQ "">AND alternateContactRelationshipTBox IN(#trim(alternateContactRelationshipTBox_IN)#)</cfif>
					<cfif alternateContactRelationshipTBox_LIKE NEQ "">AND alternateContactRelationshipTBox LIKE '%#trim(alternateContactRelationshipTBox_LIKE)#%'</cfif>
					<cfif alternateContactPhoneTBox NEQ "">AND alternateContactPhoneTBox = '#alternateContactPhoneTBox#'</cfif>
					<cfif alternateContactPhoneTBox_IN NEQ "">AND alternateContactPhoneTBox IN(#trim(alternateContactPhoneTBox_IN)#)</cfif>
					<cfif alternateContactPhoneTBox_LIKE NEQ "">AND alternateContactPhoneTBox LIKE '%#trim(alternateContactPhoneTBox_LIKE)#%'</cfif>
					<cfif alternateContactWorkPhoneTBox NEQ "">AND alternateContactWorkPhoneTBox = '#alternateContactWorkPhoneTBox#'</cfif>
					<cfif alternateContactWorkPhoneTBox_IN NEQ "">AND alternateContactWorkPhoneTBox IN(#trim(alternateContactWorkPhoneTBox_IN)#)</cfif>
					<cfif alternateContactWorkPhoneTBox_LIKE NEQ "">AND alternateContactWorkPhoneTBox LIKE '%#trim(alternateContactWorkPhoneTBox_LIKE)#%'</cfif>
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
					<cfif orderingPhysicianFNameTBox NEQ "">AND orderingPhysicianFNameTBox = '#orderingPhysicianFNameTBox#'</cfif>
					<cfif orderingPhysicianFNameTBox_IN NEQ "">AND orderingPhysicianFNameTBox IN(#trim(orderingPhysicianFNameTBox_IN)#)</cfif>
					<cfif orderingPhysicianFNameTBox_LIKE NEQ "">AND orderingPhysicianFNameTBox LIKE '%#trim(orderingPhysicianFNameTBox_LIKE)#%'</cfif>
					<cfif orderingPhysicianMInitialTBox NEQ "">AND orderingPhysicianMInitialTBox = '#orderingPhysicianMInitialTBox#'</cfif>
					<cfif orderingPhysicianMInitialTBox_IN NEQ "">AND orderingPhysicianMInitialTBox IN(#trim(orderingPhysicianMInitialTBox_IN)#)</cfif>
					<cfif orderingPhysicianMInitialTBox_LIKE NEQ "">AND orderingPhysicianMInitialTBox LIKE '%#trim(orderingPhysicianMInitialTBox_LIKE)#%'</cfif>
					<cfif orderingPhysicianLNameTBox NEQ "">AND orderingPhysicianLNameTBox = '#orderingPhysicianLNameTBox#'</cfif>
					<cfif orderingPhysicianLNameTBox_IN NEQ "">AND orderingPhysicianLNameTBox IN(#trim(orderingPhysicianLNameTBox_IN)#)</cfif>
					<cfif orderingPhysicianLNameTBox_LIKE NEQ "">AND orderingPhysicianLNameTBox LIKE '%#trim(orderingPhysicianLNameTBox_LIKE)#%'</cfif>
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
					<cfif Equipment1NoteTBox NEQ "">AND Equipment1NoteTBox = '#Equipment1NoteTBox#'</cfif>
					<cfif Equipment1NoteTBox_IN NEQ "">AND Equipment1NoteTBox IN(#trim(Equipment1NoteTBox_IN)#)</cfif>
					<cfif Equipment1NoteTBox_LIKE NEQ "">AND Equipment1NoteTBox LIKE '%#trim(Equipment1NoteTBox_LIKE)#%'</cfif>
					<cfif Equipment2NoteTBox NEQ "">AND Equipment2NoteTBox = '#Equipment2NoteTBox#'</cfif>
					<cfif Equipment2NoteTBox_IN NEQ "">AND Equipment2NoteTBox IN(#trim(Equipment2NoteTBox_IN)#)</cfif>
					<cfif Equipment2NoteTBox_LIKE NEQ "">AND Equipment2NoteTBox LIKE '%#trim(Equipment2NoteTBox_LIKE)#%'</cfif>
					<cfif Equipment3NoteTBox NEQ "">AND Equipment3NoteTBox = '#Equipment3NoteTBox#'</cfif>
					<cfif Equipment3NoteTBox_IN NEQ "">AND Equipment3NoteTBox IN(#trim(Equipment3NoteTBox_IN)#)</cfif>
					<cfif Equipment3NoteTBox_LIKE NEQ "">AND Equipment3NoteTBox LIKE '%#trim(Equipment3NoteTBox_LIKE)#%'</cfif>
					<cfif Equipment4NoteTBox NEQ "">AND Equipment4NoteTBox = '#Equipment4NoteTBox#'</cfif>
					<cfif Equipment4NoteTBox_IN NEQ "">AND Equipment4NoteTBox IN(#trim(Equipment4NoteTBox_IN)#)</cfif>
					<cfif Equipment4NoteTBox_LIKE NEQ "">AND Equipment4NoteTBox LIKE '%#trim(Equipment4NoteTBox_LIKE)#%'</cfif>
					<cfif Equipment5NoteTBox NEQ "">AND Equipment5NoteTBox = '#Equipment5NoteTBox#'</cfif>
					<cfif Equipment5NoteTBox_IN NEQ "">AND Equipment5NoteTBox IN(#trim(Equipment5NoteTBox_IN)#)</cfif>
					<cfif Equipment5NoteTBox_LIKE NEQ "">AND Equipment5NoteTBox LIKE '%#trim(Equipment5NoteTBox_LIKE)#%'</cfif>
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
					<cfif ClosingInvoiceNumber NEQ "">AND ClosingInvoiceNumber = '#ClosingInvoiceNumber#'</cfif>
					<cfif ClosingInvoiceNumber_IN NEQ "">AND ClosingInvoiceNumber IN(#trim(ClosingInvoiceNumber_IN)#)</cfif>
					<cfif ClosingInvoiceNumber_LIKE NEQ "">AND ClosingInvoiceNumber LIKE '%#trim(ClosingInvoiceNumber_LIKE)#%'</cfif>
					<cfif OPTION_SkilledNursing NEQ "">AND OPTION_SkilledNursing = '#OPTION_SkilledNursing#'</cfif>
					<cfif OPTION_SkilledNursing_IN NEQ "">AND OPTION_SkilledNursing IN(#trim(OPTION_SkilledNursing_IN)#)</cfif>
					<cfif OPTION_SkilledNursing_LIKE NEQ "">AND OPTION_SkilledNursing LIKE '%#trim(OPTION_SkilledNursing_LIKE)#%'</cfif>
					<cfif SkilledNursingName NEQ "">AND SkilledNursingName = '#SkilledNursingName#'</cfif>
					<cfif SkilledNursingName_IN NEQ "">AND SkilledNursingName IN(#trim(SkilledNursingName_IN)#)</cfif>
					<cfif SkilledNursingName_LIKE NEQ "">AND SkilledNursingName LIKE '%#trim(SkilledNursingName_LIKE)#%'</cfif>
					<cfif SkilledNursingTelephone NEQ "">AND SkilledNursingTelephone = '#SkilledNursingTelephone#'</cfif>
					<cfif SkilledNursingTelephone_IN NEQ "">AND SkilledNursingTelephone IN(#trim(SkilledNursingTelephone_IN)#)</cfif>
					<cfif SkilledNursingTelephone_LIKE NEQ "">AND SkilledNursingTelephone LIKE '%#trim(SkilledNursingTelephone_LIKE)#%'</cfif>
					<cfif Printed NEQ "">AND Printed = '#Printed#'</cfif>
					<cfif Printed_IN NEQ "">AND Printed IN(#trim(Printed_IN)#)</cfif>
					<cfif Printed_LIKE NEQ "">AND Printed LIKE '%#trim(Printed_LIKE)#%'</cfif>
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
			
			<cfreturn getIntakeQuery>
		
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




