

<cfparam name="PageName1" default="#trim(CGI.SCRIPT_NAME)#">

<cfif FindNoCase("/", PageName1)>		
	<cfset request.pageName = ListLast(PageName1, "/")>			
<cfelse>
	<cfset request.pageName = PageName1>		
</cfif>

<cfset randRangeNum = randRange(1001, 2252)>
<cfset randRangeNum2 = randRange(1001, 2252)>
<Cfset phoneFirst = "(222) " & left(randRangeNum, 3) & "-" & left(randRangeNum2, 2)>

<cfquery name="getWord" datasource="PA_Master">
	SELECT word 
	FROM randomword  
	WHERE randomwordid = #trim(randRangeNum)#
</cfquery>



<cfoutput>		

	<script type="text/javascript">
		
		function prefill(){

		
			<cfif findNoCase("appFormPatientIntakeForm.cfm", trim(request.pageName))>					
			
				$("input[name='otherTBox']").val('Testing Other'); 
				$("input[name='callerFNameTBox']").val('Test#getWord.word#'); 
				$("input[name='callerMInitialTBox']").val('#left(getWord.word, 1)#');
				$("input[name='callerLNameTBox']").val('Tester#getWord.word#');
				$("input[name='callerPhoneTBox']").val('#phoneFirst#11');
				$("input[name='patientFNameTBox']").val('Pat#getWord.word#');
				$("input[name='patientMInitialTBox']").val('P');
				$("input[name='patientLNameTBox']").val('Patl#getWord.word#');
				$("input[name='patientDOBMM']").val('10');
				$("input[name='patientDOBDD']").val('02');
				$("input[name='patientDOBYY']").val('1972');
				$("input[name='patientSSNTBox']").val('444-#left(randRangeNum, 2)#-#randRangeNum#');
				$("input[name='patientHeightInches']").val('67');
				$("input[name='patientWeightTBox']").val('190');
				$("input[name='patientAddressTBox']").val('#randRangeNum# Campbell Drive');
				$("input[name='patientCityTBox']").val('Bryan');
				$("input[name='patientZipTBox']").val('75071');
				$("input[name='patientPhoneTBox']").val('#phoneFirst#22');
				$("input[name='alternateContactFNameTBox']").val('Alt#getWord.word#');
				$("input[name='alternateContactMInitialTBox']").val('A');
				$("input[name='alternateContactLNameTBox']").val('Altl#getWord.word#');
				$("input[name='alternateContactRelationshipTBox']").val('Unknown');
				$("input[name='alternateContactPhoneTBox']").val('#phoneFirst#33');
				$("input[name='alternateContactWorkPhoneTBox']").val('#phoneFirst#44');
				$("input[name='poNumberTBox']").val('');
				$("input[name='creditCardTypeTBox']").val('');
				$("input[name='creditCardNumberTBox']").val('');
				$("input[name='ccDateMM']").val('');
				$("input[name='ccDateDD']").val('');
				$("input[name='ccDateYY']").val('');
				$("input[name='hcpcCode1TBox']").val('E0163');
				$("input[name='hcpcQty1TBox']").val('1');
				$("input[name='hcpcProduct1TBox']").val('COMMODE CHAIR, MOBILE OR STATIONARY, WITH FIXED ARMS');
				$("input[name='hcpcCost1TBox']").val('500.00');
				$("input[name='hcpcDX1TBox']").val('780.79');
				$("input[name='hcpcDiagnosis1TBox']").val('OTH MALAISE/FATIGUE');
				$("input[name='hcpcLengthOfNeedYear1TBox']").val('1');
				$("input[name='hcpcLengthOfNeedMonth1TBox']").val('6');
				$("input[name='primaryInsuranceNameTBox']").val('Greater America Insurance');
				$("input[name='primaryPolicyNumberTBox']").val('#randRangeNum##randRangeNum2#b');
				$("input[name='primaryGroupNumberTBox']").val('U34564');
				$("input[name='primaryPhoneNumberTBox']").val('#phoneFirst#55');
				$("input[name='primaryFaxNumberTBox']").val('#phoneFirst#66');
				$("input[name='primarySendToAddress1TBox']").val('PO BOX 345');
				$("input[name='primarySendToAddress2TBox']").val('SUITE 300');
				$("input[name='primarySendToCityTBox']").val('ENNIS');
				$("input[name='primarySendToZipcodeTBox']").val('75071');
				$("input[name='primaryPolicyHolderFNameTBox']").val('Pol#getWord.word#');
				$("input[name='primaryPolicyHolderMInitialTBox']").val('P');
				$("input[name='primaryPolicyHolderLNameTBox']").val('Poll#getWord.word#');
				$("input[name='primaryHoldersDOBMM']").val('11');
				$("input[name='primaryHoldersDOBDD']").val('02');
				$("input[name='primaryHoldersDOBYY']").val('1970');
				$("input[name='primaryPolicyHolderEmployerTBox']").val('');
				$("input[name='primaryNoteTBox']").val('');
				$("input[name='primaryVerificationRepFNameTBox']").val('Bright');
				$("input[name='primaryVerificationRepLNameTBox']").val('Tree');
				$("input[name='primaryVerificationDateMM']").val('#DateFormat(NOW(), "MM")#');
				$("input[name='primaryVerificationDateDD']").val('#DateFormat(NOW(), "DD")#');
				$("input[name='primaryVerificationDateYY']").val('#DateFormat(NOW(), "YY")#');
				$("input[name='primaryVerificationTimeTBox']").val('12:46 PM');
				$("input[name='primaryVerificationHaveInsFromMM']").val('#DateFormat(NOW(), "MM")#');
				$("input[name='primaryVerificationHaveInsFromDD']").val('#DateFormat(NOW(), "DD")#');
				$("input[name='primaryVerificationHaveInsFromYY']").val('#DateFormat(DateAdd("yyyy", -1, NOW()), "YYYY")#');
				$("input[name='primaryVerificationHaveInsToMM']").val('#DateFormat(NOW(), "MM")#');
				$("input[name='primaryVerificationHaveInsToDD']").val('#DateFormat(NOW(), "DD")#');
				$("input[name='primaryVerificationHaveInsToYY']").val('#DateFormat(DateAdd("yyyy", 1, NOW()), "YYYY")#');
				$("input[name='primaryVerificationDeductibleAmountTBox']").val('');
				$("input[name='primaryVerificationDeductibleAmountMetTBox']").val('');
				$("input[name='primaryVerificationPercentagePayAfterDeductibleTBox']").val('');
				$("input[name='primaryVerificationAuthNumberTBox']").val('');
				$("input[name='primaryVerificationAuthPhoneNumberTBox']").val('');
				$("input[name='primaryVerificationTypeBasePlanTBox']").val('');
				$("input[name='orderingPhysicianFNameTBox']").val('John');
				$("input[name='orderingPhysicianMInitialTBox']").val('E');
				$("input[name='orderingPhysicianLNameTBox']").val('Welby');
				$("input[name='orderingPhysicianPhoneTBox']").val('#phoneFirst#77');
				$("input[name='orderingPhysicianUPINTBox']").val('#randRangeNum#');
				$("input[name='orderingPhysicianFaxTBox']").val('#phoneFirst#88');
				$("input[name='orderingPhysicianAddressTBox']").val('1234 Doctor Way');
				$("input[name='orderingPhysicianCityTBox']").val('Medicine');
				$("input[name='orderingPhysicianZipTBox']").val('75071');
				$("input[name='Equipment1TypeTBox']").val('Wheelchair');
				$("input[name='Equipment1NoteTBox']").val('Returned');
				$("input[name='Equipment1FromMM']").val('#DateFormat(NOW(), "MM")#');
				$("input[name='Equipment1FromDD']").val('#DateFormat(NOW(), "DD")#');
				$("input[name='Equipment1FromYY']").val('#DateFormat(DateAdd("yyyy", -1, NOW()), "YYYY")#');
				$("input[name='Equipment1ToMM']").val('#DateFormat(DateAdd("m", -2, NOW()), "MM")#');
				$("input[name='Equipment1ToDD']").val('#DateFormat(NOW(), "DD")#');
				$("input[name='Equipment1ToYY']").val('#DateFormat(NOW(), "YYYY")#');
				$("input[name='Equipment1SupplierNameTBox']").val('Acme DME');
				$("input[name='Equipment1SupplierTelephoneTBox']").val('#phoneFirst#99');																																		
				
				checkBoxRadio('td_delivery', 'CheckUncheckPic_1', 'OPTION_1_CBox_Delivery');
				checkBoxRadio('', 'CheckUncheckPic_2', 'OPTION_2_CBox_Other');
				checkBoxRadio('td_typeOfInsurance', 'CheckUncheckPic_3', 'OPTION_3_CBox_Medicare');
				checkBoxRadio('td_patientSex', 'CheckUncheckPic_3a', 'OPTION_3a_CBox_PatientSexMale');
				checkBoxRadio('', 'CheckUncheckPic_primaryVerificationHaveIns', 'primaryVerificationHaveInsYes');
				checkBoxRadio('', 'CheckUncheckPic_primaryVerificationHaveDMECov', 'primaryVerificationHaveDMECovYes');
				checkBoxRadio('', 'CheckUncheckPic_primaryVerificationDeductible', 'primaryVerificationDeductibleNo');
				checkBoxRadio('', 'CheckUncheckPic_primaryVerificationPPOPolicy', 'primaryVerificationPPOPolicyNo');
				checkBoxRadio('', 'CheckUncheckPic_primaryVerificationPriorAuth', 'primaryVerificationPriorAuthNo');
				checkBoxRadio('', 'CheckUncheckPic_primaryVerificationLifetimeBenefitMet', 'primaryVerificationLifetimeBenefitMetNo');
				checkBoxRadio('', 'CheckUncheckPic_primaryMedicareSupplement', 'primaryMedicareSupplementNo');
				checkBoxRadio('', 'CheckUncheckPic_primaryCoordinateBenefits', 'primaryCoordinateBenefitsNo');
				checkBoxRadio('', 'CheckUncheckPic_primaryPaidMedicareDeductible', 'primaryPaidMedicareDeductibleYes');
				checkBoxRadio('', 'CheckUncheckPic_primaryVerificationMedicaidPlan', 'primaryVerificationMedicaidPlanMQMB');
				checkBoxRadio('td_OPTION_13_CBox_PastEquipment', 'CheckUncheckPic_13', 'OPTION_13_CBox_PastEquipmentYes');
				checkBoxRadio('td_OPTION_SkilledNursing', 'CheckUncheckPic_SkilledNursing', 'OPTION_SkilledNursingNo');
				 
				$("select[name='patientAddressStateID'] option[value='59']").attr('selected', 'selected'); 
				$("select[name='patientMaritalStatus'] option[value='231']").attr('selected', 'selected'); 
				$("select[name='orderingPhysicianStateTBox'] option[value='59']").attr('selected', 'selected'); 
				$("select[name='primarySendToStateTBox'] option[value='59']").attr('selected', 'selected'); 
				$("select[name='Equipment1RentPurchasedSelect'] option[value='R']").attr('selected', 'selected'); 
			
			</cfif>
			
			<cfif findNoCase("appQuoteCreateForm.cfm", trim(request.pageName))>					
				
				<!--- NEW QUOTE --->
				$("input[name='callerFNameTBox']").val('Connie');
				$("input[name='callerMInitialTBox']").val('M');
				$("input[name='callerLNameTBox']").val('HugoTest');
				$("input[name='callerPhoneTBox']").val('972-521-4562');
				$("input[name='patientFNameTBox']").val('Connie');
				$("input[name='patientMInitialTBox']").val('N');
				$("input[name='patientLNameTBox']").val('HugoTest');
				$("input[name='patientDOBMM']").val('10');
				$("input[name='patientDOBDD']").val('02');
				$("input[name='patientDOBYY']").val('1972');
				$("input[name='patientAddressTBox']").val('1009 Campbell Drive');
				$("input[name='patientCityTBox']").val('McKinney');
				$("select[name='patientStateTBox'] option[value='59']").attr('selected', 'selected'); 
				checkBoxRadio('td_patientSex', 'CheckUncheckPic_3a', 'OPTION_3a_CBox_PatientSexMale');
				$("input[name='patientZipTBox']").val('75071');
				$("input[name='patientPhoneTBox']").val('972-632-4522');
				$("input[name='patientSSNTBox']").val('612-85-4522');
				$("input[name='patientHeightInches']").val('67');
				$("input[name='patientWeightTBox']").val('185');
				$("input[name='alternateContactFNameTBox']").val('Jerry');
				$("input[name='alternateContactMInitialTBox']").val('J');
				$("input[name='alternateContactLNameTBox']").val('James');
				$("input[name='alternateContactRelationshipTBox']").val('Brother');
				$("input[name='alternateContactPhoneTBox']").val('972-555-1223');
				$("input[name='alternateContactWorkPhoneTBox']").val('852-784-8555');
				$("input[name='hcpcCode1TBox']").val('E1399');
				$("input[name='hcpcQty1TBox']").val('1');
				$("input[name='hcpcProduct1TBox']").val('Wheeled Walker With Seat Basket');
				$("input[name='hcpcCost1TBox']").val('252.00');
				$("input[name='hcpcDX1TBox']").val('DX 1');
				$("input[name='hcpcDiagnosis1TBox']").val('hcpc Diagnosis 1 Box');
				$("input[name='hcpcCode2TBox']").val('E1399');
				$("input[name='hcpcQty2TBox']").val('1');
				$("input[name='hcpcProduct2TBox']").val('Allergy Asthma Mattress Encasement');
				$("input[name='hcpcCost2TBox']").val('78.00');
				$("input[name='hcpcDX2TBox']").val('DX 2');
				$("input[name='hcpcDiagnosis2TBox']").val('hcpc Diagnosis 2 Box');
				$("input[name='primaryInsuranceNameTBox']").val('Tx Hh');
				$("input[name='secondaryInsuranceNameTBox']").val('Tx Hh 2');
				$("input[name='primaryPolicyNumberTBox']").val('99TEXASHOMEHEALTH');
				$("input[name='secondaryPolicyNumberTBox']").val('852133-2');
				$("input[name='orderingPhysicianFNameTBox']").val('James');
				$("input[name='orderingPhysicianMInitialTBox']").val('B');
				$("input[name='orderingPhysicianLNameTBox']").val('Zeuss');
				$("input[name='orderingPhysicianPhoneTBox']").val('972-654-1214');			
			
			</cfif>
					
						
		}
	</script>
</cfoutput>




<cfoutput>
	<input type="Button" value="Fill fields?" onclick="prefill();">
</cfoutput>


