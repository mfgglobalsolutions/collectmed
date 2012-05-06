<!---------------------------------------------------------------------------------------------->
<!--- FROM pdf-Tools.com Form Filler pdf                                                     --->
<!--- 2.4 Add a text field (all editions)                                                    --->
<!--- PDFORM is capable to dynamically add a new text field. The command syntax is:          --->
<!--- +FIELDNAME@1,2,3,4,5,6,7=value                                                         --->
<!--- The numeric parameters 1 through 7 represent                                           --->
<!--- 1: the page number, on which the field is to be created                                --->
<!--- 2: the (left) x coordinate of the field                                                --->
<!--- 3: the (bottom) y coordinate of the field                                              --->
<!--- 4: the right x coordinate of the field                                                 --->
<!--- 5: the top (y) coordinate of the field                                                 --->
<!--- 6. the font number (0: Helvetica; 1: Helvetica Bold; Helvetica Oblique; Helvetica Bold --->
<!--- Oblique; Courier, Courier Bold, Courier Oblique, Courier Bold Oblique, Times Roman;    --->
<!--- Times Bold; Times Italic; Times Bold Italic; Zapf Dingbats; Symbol)                    --->
<!--- 7. the font size in points                                                             --->
<!---------------------------------------------------------------------------------------------->
<!------------------------------------------------------------------------------------------------------------------------------------------------>
<!--- +InsuranceCompanyName@ (1)Page_Number, (2)Left X Cor, (3)Bottom Y Cor, (4)Right X Cor, (5)Top Y Cor, (6)Font_Type, (7)Font_Size =[value] --->
<!------------------------------------------------------------------------------------------------------------------------------------------------>





<!-------------------------------------------------------------------------------------->
<!--- CFSCRIPT needed for RIGHT aligned text.                                        --->
<!-------------------------------------------------------------------------------------->
	<cfscript>
		function getHCFABoxLength(string){		
			number = 0;
			length = 0;							
			for(i=1; i LTE Len(string); i=i+1){			
				temp = REQUEST.getAt(string, i);				
				switch (#trim(temp)#){
					case "3": length = 5; break;
					case "5": length = 5; break;
					case "7": length = 4; break;
					case "1": length = 5; break;
					case "4": length = 5; break;
					case "6": length = 5; break;
					case "8": length = 5; break;
					case "9": length = 5; break;
					case "0": length = 5; break;
					case "2": length = 5; break;				
				}			
				number = number + length;			
			}	
			return number + 1;
		}		
	</cfscript>



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.HCFAPath" default="#trim(request.driveLetter)#:\#trim(request.applicationPathMainFolder)#\misc\HCFA-1500.pdf">
	<cfset HCFAPath = attributes.HCFAPath>
		
	<cfparam name="attributes.fileName" default="">
	<cfset fileName = attributes.fileName>
	
	<cfparam name="attributes.saveFilePath" default="">
	<cfset saveFilePath = attributes.saveFilePath>	
	
	<cfparam name="attributes.noteToPayer" default="">
	<cfset noteToPayer = attributes.noteToPayer>
		
	<cfparam name="attributes.InsuranceCompanyName" default="">
	<cfset InsuranceCompanyName = attributes.InsuranceCompanyName>
	
	<cfparam name="attributes.InsuranceCompanyAddressLine1" default="">
	<cfset InsuranceCompanyAddressLine1 = attributes.InsuranceCompanyAddressLine1>
	
	<cfparam name="attributes.InsuranceCompanyAddressLine2" default="">
	<cfset InsuranceCompanyAddressLine2 = attributes.InsuranceCompanyAddressLine2>
	
	<cfparam name="attributes.InsuranceCompanyCityStateZip" default="">
	<cfset InsuranceCompanyCityStateZip = attributes.InsuranceCompanyCityStateZip>
	
	<cfparam name="attributes.Medicare_1" default="">
	<cfset Medicare_1 = attributes.Medicare_1>
	
	<cfparam name="attributes.Medicaid_1" default="">
	<cfset Medicaid_1 = attributes.Medicaid_1>
	
	<cfparam name="attributes.Champus_1" default="">
	<cfset Champus_1 = attributes.Champus_1>
	
	<cfparam name="attributes.ChampVa_1" default="">
	<cfset ChampVa_1 = attributes.ChampVa_1>
	
	<cfparam name="attributes.GroupHealthPlan_1" default="">
	<cfset GroupHealthPlan_1 = attributes.GroupHealthPlan_1>
	
	<cfparam name="attributes.FecaBlkLung_1" default="">
	<cfset FecaBlkLung_1 = attributes.FecaBlkLung_1>
	
	<cfparam name="attributes.Other_1" default="">
	<cfset Other_1 = attributes.Other_1>
	
	<cfparam name="attributes.InsuredsIDNumber_1a" default="">
	<cfset InsuredsIDNumber_1a = attributes.InsuredsIDNumber_1a>
	
	<cfparam name="attributes.PatientsName_2" default="">
	<cfset PatientsName_2 = attributes.PatientsName_2>
	
	<cfparam name="attributes.PatientsBirthDate_MM_3" default="">
	<cfset PatientsBirthDate_MM_3 = attributes.PatientsBirthDate_MM_3>
	
	<cfparam name="attributes.PatientsBirthDate_DD_3" default="">
	<cfset PatientsBirthDate_DD_3 = attributes.PatientsBirthDate_DD_3>
	
	<cfparam name="attributes.PatientsBirthDate_YY_3" default="">
	<cfset PatientsBirthDate_YY_3 = attributes.PatientsBirthDate_YY_3>
	
	<cfparam name="attributes.PatientsBirthDate_Sex_M_3" default="">
	<cfset PatientsBirthDate_Sex_M_3 = attributes.PatientsBirthDate_Sex_M_3>
	
	<cfparam name="attributes.PatientsBirthDate_Sex_F_3" default="">
	<cfset PatientsBirthDate_Sex_F_3 = attributes.PatientsBirthDate_Sex_F_3>
	
	<cfparam name="attributes.InsuredsName_4" default="">
	<cfset InsuredsName_4 = attributes.InsuredsName_4>
	
	<cfparam name="attributes.PatientsAddress_StreetNo_5" default="">
	<cfset PatientsAddress_StreetNo_5 = attributes.PatientsAddress_StreetNo_5>
	
	<cfparam name="attributes.PatientsAddress_City_5" default="">
	<cfset PatientsAddress_City_5 = attributes.PatientsAddress_City_5>
	
	<cfparam name="attributes.PatientsAddress_State_5" default="">
	<cfset PatientsAddress_State_5 = attributes.PatientsAddress_State_5>
	
	<cfparam name="attributes.PatientsAddress_Zip_5" default="">
	<cfset PatientsAddress_Zip_5 = attributes.PatientsAddress_Zip_5>
	
	<cfparam name="attributes.PatientsAddress_PhoneAreaCode_5" default="">
	<cfset PatientsAddress_PhoneAreaCode_5 = attributes.PatientsAddress_PhoneAreaCode_5>
	
	<cfparam name="attributes.PatientsAddress_Phone_5" default="">
	<cfset PatientsAddress_Phone_5 = attributes.PatientsAddress_Phone_5>
	
	<cfparam name="attributes.PatientRelationshipToInsured_Self_6" default="">
	<cfset PatientRelationshipToInsured_Self_6 = attributes.PatientRelationshipToInsured_Self_6>
	
	<cfparam name="attributes.PatientRelationshipToInsured_Spouse_6" default="">
	<cfset PatientRelationshipToInsured_Spouse_6 = attributes.PatientRelationshipToInsured_Spouse_6>
	
	<cfparam name="attributes.PatientRelationshipToInsured_Child_6" default="">
	<cfset PatientRelationshipToInsured_Child_6 = attributes.PatientRelationshipToInsured_Child_6>
	
	<cfparam name="attributes.PatientRelationshipToInsured_Other_6" default="">
	<cfset PatientRelationshipToInsured_Other_6 = attributes.PatientRelationshipToInsured_Other_6>
	
	<cfparam name="attributes.InsuredAddress_StreetNo_7" default="">
	<cfset InsuredAddress_StreetNo_7 = attributes.InsuredAddress_StreetNo_7>
	
	<cfparam name="attributes.InsuredAddress_City_7" default="">
	<cfset InsuredAddress_City_7 = attributes.InsuredAddress_City_7>
	
	<cfparam name="attributes.InsuredAddress_State_7" default="">
	<cfset InsuredAddress_State_7 = attributes.InsuredAddress_State_7>
	
	<cfparam name="attributes.InsuredAddress_Zip_7" default="">
	<cfset InsuredAddress_Zip_7 = attributes.InsuredAddress_Zip_7>
	
	<cfparam name="attributes.InsuredAddress_PhoneAreaCode_7" default="">
	<cfset InsuredAddress_PhoneAreaCode_7 = attributes.InsuredAddress_PhoneAreaCode_7>
	
	<cfparam name="attributes.InsuredAddress_Phone_7" default="">
	<cfset InsuredAddress_Phone_7 = attributes.InsuredAddress_Phone_7>
	
	<cfparam name="attributes.PatientStatus_Single_8" default="">
	<cfset PatientStatus_Single_8 = attributes.PatientStatus_Single_8>
	
	<cfparam name="attributes.PatientStatus_Employed_8" default="">
	<cfset PatientStatus_Employed_8 = attributes.PatientStatus_Employed_8>
	
	<cfparam name="attributes.PatientStatus_Married_8" default="">
	<cfset PatientStatus_Married_8 = attributes.PatientStatus_Married_8>
	
	<cfparam name="attributes.PatientStatus_FullTimeStudent_8" default="">
	<cfset PatientStatus_FullTimeStudent_8 = attributes.PatientStatus_FullTimeStudent_8>
	
	<cfparam name="attributes.PatientStatus_Other_8" default="">
	<cfset PatientStatus_Other_8 = attributes.PatientStatus_Other_8>
	
	<cfparam name="attributes.PatientStatus_PartTimeStudent_8" default="">
	<cfset PatientStatus_PartTimeStudent_8 = attributes.PatientStatus_PartTimeStudent_8>
	
	<cfparam name="attributes.OtherInsuredsName_9" default="">
	<cfset OtherInsuredsName_9 = attributes.OtherInsuredsName_9>
	
	<cfparam name="attributes.OtherInsuredsPolicyOrGroupNumber_9a" default="">
	<cfset OtherInsuredsPolicyOrGroupNumber_9a = attributes.OtherInsuredsPolicyOrGroupNumber_9a>
	
	<cfparam name="attributes.OtherInsuredsDateOfBirth_MM_9b" default="">
	<cfset OtherInsuredsDateOfBirth_MM_9b = attributes.OtherInsuredsDateOfBirth_MM_9b>
	
	<cfparam name="attributes.OtherInsuredsDateOfBirth_DD_9b" default="">
	<cfset OtherInsuredsDateOfBirth_DD_9b = attributes.OtherInsuredsDateOfBirth_DD_9b>
	
	<cfparam name="attributes.OtherInsuredsDateOfBirth_YY_9b" default="">
	<cfset OtherInsuredsDateOfBirth_YY_9b = attributes.OtherInsuredsDateOfBirth_YY_9b>
	
	<cfparam name="attributes.OtherInsuredsDateOfBirth_Sex_M_9b" default="">
	<cfset OtherInsuredsDateOfBirth_Sex_M_9b = attributes.OtherInsuredsDateOfBirth_Sex_M_9b>
	
	<cfparam name="attributes.OtherInsuredsDateOfBirth_Sex_F_9b" default="">
	<cfset OtherInsuredsDateOfBirth_Sex_F_9b = attributes.OtherInsuredsDateOfBirth_Sex_F_9b>
	
	<cfparam name="attributes.EmployersNameOrSchoolName_9c" default="">
	<cfset EmployersNameOrSchoolName_9c = attributes.EmployersNameOrSchoolName_9c>
	
	<cfparam name="attributes.InsurancePlanNameOrProgramName_9d" default="">
	<cfset InsurancePlanNameOrProgramName_9d = attributes.InsurancePlanNameOrProgramName_9d>
	
	<cfparam name="attributes.IsPatientsConditionRelatedTo_Employment_Yes_10a" default="">
	<cfset IsPatientsConditionRelatedTo_Employment_Yes_10a = attributes.IsPatientsConditionRelatedTo_Employment_Yes_10a>
	
	<cfparam name="attributes.IsPatientsConditionRelatedTo_Employment_No_10a" default="">
	<cfset IsPatientsConditionRelatedTo_Employment_No_10a = attributes.IsPatientsConditionRelatedTo_Employment_No_10a>
	
	<cfparam name="attributes.IsPatientsConditionRelatedTo_AutoAccident_Yes_10b" default="">
	<cfset IsPatientsConditionRelatedTo_AutoAccident_Yes_10b = attributes.IsPatientsConditionRelatedTo_AutoAccident_Yes_10b>
	
	<cfparam name="attributes.IsPatientsConditionRelatedTo_AutoAccident_No_10b" default="">
	<cfset IsPatientsConditionRelatedTo_AutoAccident_No_10b = attributes.IsPatientsConditionRelatedTo_AutoAccident_No_10b>
	
	<cfparam name="attributes.IsPatientsConditionRelatedTo_PlaceState_10b" default="">
	<cfset IsPatientsConditionRelatedTo_PlaceState_10b = attributes.IsPatientsConditionRelatedTo_PlaceState_10b>
	
	<cfparam name="attributes.IsPatientsConditionRelatedTo_OtherAccident_Yes_10c" default="">
	<cfset IsPatientsConditionRelatedTo_OtherAccident_Yes_10c = attributes.IsPatientsConditionRelatedTo_OtherAccident_Yes_10c>
	
	<cfparam name="attributes.IsPatientsConditionRelatedTo_OtherAccident_No_10c" default="">
	<cfset IsPatientsConditionRelatedTo_OtherAccident_No_10c = attributes.IsPatientsConditionRelatedTo_OtherAccident_No_10c>
	
	<cfparam name="attributes.ReservedForLocalUse_10d" default="">
	<cfset ReservedForLocalUse_10d = attributes.ReservedForLocalUse_10d>
	
	<cfparam name="attributes.InsuredPolicyGroupOrFecaNumber_11a" default="">
	<cfset InsuredPolicyGroupOrFecaNumber_11a = attributes.InsuredPolicyGroupOrFecaNumber_11a>
	
	<cfparam name="attributes.InsuredDateOfBirth_MM_11a" default="">
	<cfset InsuredDateOfBirth_MM_11a = attributes.InsuredDateOfBirth_MM_11a>
	
	<cfparam name="attributes.InsuredDateOfBirth_DD_11a" default="">
	<cfset InsuredDateOfBirth_DD_11a = attributes.InsuredDateOfBirth_DD_11a>
	
	<cfparam name="attributes.InsuredDateOfBirth_YY_11a" default="">
	<cfset InsuredDateOfBirth_YY_11a = attributes.InsuredDateOfBirth_YY_11a>
	
	<cfparam name="attributes.InsuredDateOfBirth_Sex_M_11a" default="">
	<cfset InsuredDateOfBirth_Sex_M_11a = attributes.InsuredDateOfBirth_Sex_M_11a>
	
	<cfparam name="attributes.InsuredDateOfBirth_Sex_F_11a" default="">
	<cfset InsuredDateOfBirth_Sex_F_11a = attributes.InsuredDateOfBirth_Sex_F_11a>
	
	<cfparam name="attributes.EmployersSchoolOrSchoolName_11b" default="">
	<cfset EmployersSchoolOrSchoolName_11b = attributes.EmployersSchoolOrSchoolName_11b>
	
	<cfparam name="attributes.InsurancePlanNameOrProgramName_11c" default="">
	<cfset InsurancePlanNameOrProgramName_11c = attributes.InsurancePlanNameOrProgramName_11c>
	
	<cfparam name="attributes.IsThereAnotherHealthBenefitPlan_Yes_11d" default="">
	<cfset IsThereAnotherHealthBenefitPlan_Yes_11d = attributes.IsThereAnotherHealthBenefitPlan_Yes_11d>
	
	<cfparam name="attributes.IsThereAnotherHealthBenefitPlan_No_11d" default="">
	<cfset IsThereAnotherHealthBenefitPlan_No_11d = attributes.IsThereAnotherHealthBenefitPlan_No_11d>
	
	<cfparam name="attributes.PatientsOrAuthorizedSigniature_Signed_12" default="">
	<cfset PatientsOrAuthorizedSigniature_Signed_12 = attributes.PatientsOrAuthorizedSigniature_Signed_12>
	
	<cfparam name="attributes.PatientsOrAuthorizedSigniature_Date_MM_12" default="">
	<cfset PatientsOrAuthorizedSigniature_Date_MM_12 = attributes.PatientsOrAuthorizedSigniature_Date_MM_12>
	
	<cfparam name="attributes.PatientsOrAuthorizedSigniature_Date_DD_12" default="">
	<cfset PatientsOrAuthorizedSigniature_Date_DD_12 = attributes.PatientsOrAuthorizedSigniature_Date_DD_12>
	
	<cfparam name="attributes.PatientsOrAuthorizedSigniature_Date_YY_12" default="">
	<cfset PatientsOrAuthorizedSigniature_Date_YY_12 = attributes.PatientsOrAuthorizedSigniature_Date_YY_12>
	
	<cfparam name="attributes.PatientsOrAuthorizedSigniature_Date_12" default="">
	<cfset PatientsOrAuthorizedSigniature_Date_12 = attributes.PatientsOrAuthorizedSigniature_Date_12>
	
	<cfparam name="attributes.InsuredsOrAuthorizedSigniture_13" default="">
	<cfset InsuredsOrAuthorizedSigniture_13 = attributes.InsuredsOrAuthorizedSigniture_13>
	
	<cfparam name="attributes.DateOfCurrentIllness_MM_14" default="">
	<cfset DateOfCurrentIllness_MM_14 = attributes.DateOfCurrentIllness_MM_14>
	
	<cfparam name="attributes.DateOfCurrentIllness_DD_14" default="">
	<cfset DateOfCurrentIllness_DD_14 = attributes.DateOfCurrentIllness_DD_14>
	
	<cfparam name="attributes.DateOfCurrentIllness_YY_14" default="">
	<cfset DateOfCurrentIllness_YY_14 = attributes.DateOfCurrentIllness_YY_14>
	
	<cfparam name="attributes.PtHadSameOrSimularIllness_MM_15" default="">
	<cfset PtHadSameOrSimularIllness_MM_15 = attributes.PtHadSameOrSimularIllness_MM_15>
	
	<cfparam name="attributes.PtHadSameOrSimularIllness_DD_15" default="">
	<cfset PtHadSameOrSimularIllness_DD_15 = attributes.PtHadSameOrSimularIllness_DD_15>
	
	<cfparam name="attributes.PtHadSameOrSimularIllness_YY_15" default="">
	<cfset PtHadSameOrSimularIllness_YY_15 = attributes.PtHadSameOrSimularIllness_YY_15>
	
	<cfparam name="attributes.DatesPatientUnableToWorkFrom_MM_16" default="">
	<cfset DatesPatientUnableToWorkFrom_MM_16 = attributes.DatesPatientUnableToWorkFrom_MM_16>
	
	<cfparam name="attributes.DatesPatientUnableToWorkFrom_DD_16" default="">
	<cfset DatesPatientUnableToWorkFrom_DD_16 = attributes.DatesPatientUnableToWorkFrom_DD_16>
	
	<cfparam name="attributes.DatesPatientUnableToWorkFrom_YY_16" default="">
	<cfset DatesPatientUnableToWorkFrom_YY_16 = attributes.DatesPatientUnableToWorkFrom_YY_16>
	
	<cfparam name="attributes.DatesPatientUnableToWorkTo_MM_16" default="">
	<cfset DatesPatientUnableToWorkTo_MM_16 = attributes.DatesPatientUnableToWorkTo_MM_16>
	
	<cfparam name="attributes.DatesPatientUnableToWorkTo_DD_16" default="">
	<cfset DatesPatientUnableToWorkTo_DD_16 = attributes.DatesPatientUnableToWorkTo_DD_16>
	
	<cfparam name="attributes.DatesPatientUnableToWorkTo_YY_16" default="">
	<cfset DatesPatientUnableToWorkTo_YY_16 = attributes.DatesPatientUnableToWorkTo_YY_16>
	
	<cfparam name="attributes.NameOfReferringPhysician_17" default="">
	<cfset NameOfReferringPhysician_17 = attributes.NameOfReferringPhysician_17>
	
	<cfparam name="attributes.IdOfReferringPhysician_17a" default="">
	<cfset IdOfReferringPhysician_17a = attributes.IdOfReferringPhysician_17a>
	
	<cfparam name="attributes.HospitalizationDatesFrom_MM_18" default="">
	<cfset HospitalizationDatesFrom_MM_18 = attributes.HospitalizationDatesFrom_MM_18>
	
	<cfparam name="attributes.HospitalizationDatesFrom_DD_18" default="">
	<cfset HospitalizationDatesFrom_DD_18 = attributes.HospitalizationDatesFrom_DD_18>
	
	<cfparam name="attributes.HospitalizationDatesFrom_YY_18" default="">
	<cfset HospitalizationDatesFrom_YY_18 = attributes.HospitalizationDatesFrom_YY_18>
	
	<cfparam name="attributes.HospitalizationDatesTo_MM_18" default="">
	<cfset HospitalizationDatesTo_MM_18 = attributes.HospitalizationDatesTo_MM_18>
	
	<cfparam name="attributes.HospitalizationDatesTo_DD_18" default="">
	<cfset HospitalizationDatesTo_DD_18 = attributes.HospitalizationDatesTo_DD_18>
	
	<cfparam name="attributes.HospitalizationDatesTo_YY_18" default="">
	<cfset HospitalizationDatesTo_YY_18 = attributes.HospitalizationDatesTo_YY_18>
	
	<cfparam name="attributes.ReservedForLocalUse_19" default="">
	<cfset ReservedForLocalUse_19 = attributes.ReservedForLocalUse_19>
	
	<cfparam name="attributes.OutsideLabYes_20" default="">
	<cfset OutsideLabYes_20 = attributes.OutsideLabYes_20>
	
	<cfparam name="attributes.OutsideLabNo_20" default="">
	<cfset OutsideLabNo_20 = attributes.OutsideLabNo_20>
	
	<cfparam name="attributes.OutsideLabCharges_20" default="">
	<cfset OutsideLabCharges_20 = attributes.OutsideLabCharges_20>
	
	<cfparam name="attributes.OutsideLabChargesCents_20" default="">
	<cfset OutsideLabChargesCents_20 = attributes.OutsideLabChargesCents_20>
	
	<cfparam name="attributes.Diagnosis1_21" default="">
	<cfset Diagnosis1_21 = attributes.Diagnosis1_21>
	
	<cfparam name="attributes.Diagnosis2_21" default="">
	<cfset Diagnosis2_21 = attributes.Diagnosis2_21>
	
	<cfparam name="attributes.Diagnosis3_21" default="">
	<cfset Diagnosis3_21 = attributes.Diagnosis3_21>
	
	<cfparam name="attributes.Diagnosis4_21" default="">
	<cfset Diagnosis4_21 = attributes.Diagnosis4_21>
	
	<cfparam name="attributes.MedicaidResubmission_Code_22" default="">
	<cfset MedicaidResubmission_Code_22 = attributes.MedicaidResubmission_Code_22>
	
	<cfparam name="attributes.MedicaidResubmission_OrigRefNo_22" default="">
	<cfset MedicaidResubmission_OrigRefNo_22 = attributes.MedicaidResubmission_OrigRefNo_22>
	
	<cfparam name="attributes.PriorAuthNo_23" default="">
	<cfset PriorAuthNo_23 = attributes.PriorAuthNo_23>
	
	<cfparam name="attributes.DatesOfServiceFrom1_MM_24a_Line1" default="">
	<cfset DatesOfServiceFrom1_MM_24a_Line1 = attributes.DatesOfServiceFrom1_MM_24a_Line1>
	
	<cfparam name="attributes.DatesOfServiceFrom1_DD_24a_Line1" default="">
	<cfset DatesOfServiceFrom1_DD_24a_Line1 = attributes.DatesOfServiceFrom1_DD_24a_Line1>
	
	<cfparam name="attributes.DatesOfServiceFrom1_YY_24a_Line1" default="">
	<cfset DatesOfServiceFrom1_YY_24a_Line1 = attributes.DatesOfServiceFrom1_YY_24a_Line1>
	
	<cfparam name="attributes.DatesOfServiceTo1_MM_24a_Line1" default="">
	<cfset DatesOfServiceTo1_MM_24a_Line1 = attributes.DatesOfServiceTo1_MM_24a_Line1>
	
	<cfparam name="attributes.DatesOfServiceTo1_DD_24a_Line1" default="">
	<cfset DatesOfServiceTo1_DD_24a_Line1 = attributes.DatesOfServiceTo1_DD_24a_Line1>
	
	<cfparam name="attributes.DatesOfServiceTo1_YY_24a_Line1" default="">
	<cfset DatesOfServiceTo1_YY_24a_Line1 = attributes.DatesOfServiceTo1_YY_24a_Line1>
	
	<cfparam name="attributes.PlaceOfService1_24b_Line1" default="">
	<cfset PlaceOfService1_24b_Line1 = attributes.PlaceOfService1_24b_Line1>
	
	<cfparam name="attributes.TypeOfService1_24c_Line1" default="">
	<cfset TypeOfService1_24c_Line1 = attributes.TypeOfService1_24c_Line1>
	
	<cfparam name="attributes.Procedures_HCPCS1_24d_Line1" default="">
	<cfset Procedures_HCPCS1_24d_Line1 = attributes.Procedures_HCPCS1_24d_Line1>
	
	<cfparam name="attributes.Procedures_Modifier1_1_24d_Line1" default="">
	<cfset Procedures_Modifier1_1_24d_Line1 = attributes.Procedures_Modifier1_1_24d_Line1>
	
	<cfparam name="attributes.Procedures_Modifier1_2_24d_Line1" default="">
	<cfset Procedures_Modifier1_2_24d_Line1 = attributes.Procedures_Modifier1_2_24d_Line1>
	
	<cfparam name="attributes.Procedures_Modifier1_3_24d_Line1" default="">
	<cfset Procedures_Modifier1_3_24d_Line1 = attributes.Procedures_Modifier1_3_24d_Line1>
	
	<cfparam name="attributes.Procedures_Modifier1_4_24d_Line1" default="">
	<cfset Procedures_Modifier1_4_24d_Line1 = attributes.Procedures_Modifier1_4_24d_Line1>
	
	<cfparam name="attributes.DiagnosisCode1_24e_Line1" default="">
	<cfset DiagnosisCode1_24e_Line1 = attributes.DiagnosisCode1_24e_Line1>
	
	<cfparam name="attributes.Charges1_24f_Line1" default="">
	<cfset Charges1_24f_Line1 = attributes.Charges1_24f_Line1>
	
	<cfparam name="attributes.ChargesCents1_24f_Line1" default="">
	<cfset ChargesCents1_24f_Line1 = attributes.ChargesCents1_24f_Line1>
	
	<cfparam name="attributes.DaysOrUnits1_24g_Line1" default="">
	<cfset DaysOrUnits1_24g_Line1 = attributes.DaysOrUnits1_24g_Line1>
	
	<cfparam name="attributes.EpsdtFamilyPlan1_24h_Line1" default="">
	<cfset EpsdtFamilyPlan1_24h_Line1 = attributes.EpsdtFamilyPlan1_24h_Line1>
	
	<cfparam name="attributes.Emg1_24i_Line1" default="">
	<cfset Emg1_24i_Line1 = attributes.Emg1_24i_Line1>
	
	<cfparam name="attributes.Cob1_24j_Line1" default="">
	<cfset Cob1_24j_Line1 = attributes.Cob1_24j_Line1>
	
	<cfparam name="attributes.ReservedForLocalUse1_24k_Line1" default="">
	<cfset ReservedForLocalUse1_24k_Line1 = attributes.ReservedForLocalUse1_24k_Line1>
	
	<cfparam name="attributes.DatesOfServiceFrom1_MM_24a_Line2" default="">
	<cfset DatesOfServiceFrom1_MM_24a_Line2 = attributes.DatesOfServiceFrom1_MM_24a_Line2>
	
	<cfparam name="attributes.DatesOfServiceFrom1_DD_24a_Line2" default="">
	<cfset DatesOfServiceFrom1_DD_24a_Line2 = attributes.DatesOfServiceFrom1_DD_24a_Line2>
	
	<cfparam name="attributes.DatesOfServiceFrom1_YY_24a_Line2" default="">
	<cfset DatesOfServiceFrom1_YY_24a_Line2 = attributes.DatesOfServiceFrom1_YY_24a_Line2>
	
	<cfparam name="attributes.DatesOfServiceTo1_MM_24a_Line2" default="">
	<cfset DatesOfServiceTo1_MM_24a_Line2 = attributes.DatesOfServiceTo1_MM_24a_Line2>
	
	<cfparam name="attributes.DatesOfServiceTo1_DD_24a_Line2" default="">
	<cfset DatesOfServiceTo1_DD_24a_Line2 = attributes.DatesOfServiceTo1_DD_24a_Line2>
	
	<cfparam name="attributes.DatesOfServiceTo1_YY_24a_Line2" default="">
	<cfset DatesOfServiceTo1_YY_24a_Line2 = attributes.DatesOfServiceTo1_YY_24a_Line2>
	
	<cfparam name="attributes.PlaceOfService1_24b_Line2" default="">
	<cfset PlaceOfService1_24b_Line2 = attributes.PlaceOfService1_24b_Line2>
	
	<cfparam name="attributes.TypeOfService1_24c_Line2" default="">
	<cfset TypeOfService1_24c_Line2 = attributes.TypeOfService1_24c_Line2>
	
	<cfparam name="attributes.Procedures_HCPCS1_24d_Line2" default="">
	<cfset Procedures_HCPCS1_24d_Line2 = attributes.Procedures_HCPCS1_24d_Line2>
	
	<cfparam name="attributes.Procedures_Modifier1_1_24d_Line2" default="">
	<cfset Procedures_Modifier1_1_24d_Line2 = attributes.Procedures_Modifier1_1_24d_Line2>
	
	<cfparam name="attributes.Procedures_Modifier1_2_24d_Line2" default="">
	<cfset Procedures_Modifier1_2_24d_Line2 = attributes.Procedures_Modifier1_2_24d_Line2>
	
	<cfparam name="attributes.Procedures_Modifier1_3_24d_Line2" default="">
	<cfset Procedures_Modifier1_3_24d_Line2 = attributes.Procedures_Modifier1_3_24d_Line2>
	
	<cfparam name="attributes.Procedures_Modifier1_4_24d_Line2" default="">
	<cfset Procedures_Modifier1_4_24d_Line2 = attributes.Procedures_Modifier1_4_24d_Line2>
	
	<cfparam name="attributes.DiagnosisCode1_24e_Line2" default="">
	<cfset DiagnosisCode1_24e_Line2 = attributes.DiagnosisCode1_24e_Line2>
	
	<cfparam name="attributes.Charges1_24f_Line2" default="">
	<cfset Charges1_24f_Line2 = attributes.Charges1_24f_Line2>
	
	<cfparam name="attributes.ChargesCents1_24f_Line2" default="">
	<cfset ChargesCents1_24f_Line2 = attributes.ChargesCents1_24f_Line2>
	
	<cfparam name="attributes.DaysOrUnits1_24g_Line2" default="">
	<cfset DaysOrUnits1_24g_Line2 = attributes.DaysOrUnits1_24g_Line2>
	
	<cfparam name="attributes.EpsdtFamilyPlan1_24h_Line2" default="">
	<cfset EpsdtFamilyPlan1_24h_Line2 = attributes.EpsdtFamilyPlan1_24h_Line2>
	
	<cfparam name="attributes.Emg1_24i_Line2" default="">
	<cfset Emg1_24i_Line2 = attributes.Emg1_24i_Line2>
	
	<cfparam name="attributes.Cob1_24j_Line2" default="">
	<cfset Cob1_24j_Line2 = attributes.Cob1_24j_Line2>
	
	<cfparam name="attributes.ReservedForLocalUse1_24k_Line2" default="">
	<cfset ReservedForLocalUse1_24k_Line2 = attributes.ReservedForLocalUse1_24k_Line2>
	
	<cfparam name="attributes.DatesOfServiceFrom1_MM_24a_Line3" default="">
	<cfset DatesOfServiceFrom1_MM_24a_Line3 = attributes.DatesOfServiceFrom1_MM_24a_Line3>
	
	<cfparam name="attributes.DatesOfServiceFrom1_DD_24a_Line3" default="">
	<cfset DatesOfServiceFrom1_DD_24a_Line3 = attributes.DatesOfServiceFrom1_DD_24a_Line3>
	
	<cfparam name="attributes.DatesOfServiceFrom1_YY_24a_Line3" default="">
	<cfset DatesOfServiceFrom1_YY_24a_Line3 = attributes.DatesOfServiceFrom1_YY_24a_Line3>
	
	<cfparam name="attributes.DatesOfServiceTo1_MM_24a_Line3" default="">
	<cfset DatesOfServiceTo1_MM_24a_Line3 = attributes.DatesOfServiceTo1_MM_24a_Line3>
	
	<cfparam name="attributes.DatesOfServiceTo1_DD_24a_Line3" default="">
	<cfset DatesOfServiceTo1_DD_24a_Line3 = attributes.DatesOfServiceTo1_DD_24a_Line3>
	
	<cfparam name="attributes.DatesOfServiceTo1_YY_24a_Line3" default="">
	<cfset DatesOfServiceTo1_YY_24a_Line3 = attributes.DatesOfServiceTo1_YY_24a_Line3>
	
	<cfparam name="attributes.PlaceOfService1_24b_Line3" default="">
	<cfset PlaceOfService1_24b_Line3 = attributes.PlaceOfService1_24b_Line3>
	
	<cfparam name="attributes.TypeOfService1_24c_Line3" default="">
	<cfset TypeOfService1_24c_Line3 = attributes.TypeOfService1_24c_Line3>
	
	<cfparam name="attributes.Procedures_HCPCS1_24d_Line3" default="">
	<cfset Procedures_HCPCS1_24d_Line3 = attributes.Procedures_HCPCS1_24d_Line3>
	
	<cfparam name="attributes.Procedures_Modifier1_1_24d_Line3" default="">
	<cfset Procedures_Modifier1_1_24d_Line3 = attributes.Procedures_Modifier1_1_24d_Line3>
	
	<cfparam name="attributes.Procedures_Modifier1_2_24d_Line3" default="">
	<cfset Procedures_Modifier1_2_24d_Line3 = attributes.Procedures_Modifier1_2_24d_Line3>
	
	<cfparam name="attributes.Procedures_Modifier1_3_24d_Line3" default="">
	<cfset Procedures_Modifier1_3_24d_Line3 = attributes.Procedures_Modifier1_3_24d_Line3>
	
	<cfparam name="attributes.Procedures_Modifier1_4_24d_Line3" default="">
	<cfset Procedures_Modifier1_4_24d_Line3 = attributes.Procedures_Modifier1_4_24d_Line3>
	
	<cfparam name="attributes.DiagnosisCode1_24e_Line3" default="">
	<cfset DiagnosisCode1_24e_Line3 = attributes.DiagnosisCode1_24e_Line3>
	
	<cfparam name="attributes.Charges1_24f_Line3" default="">
	<cfset Charges1_24f_Line3 = attributes.Charges1_24f_Line3>
	
	<cfparam name="attributes.ChargesCents1_24f_Line3" default="">
	<cfset ChargesCents1_24f_Line3 = attributes.ChargesCents1_24f_Line3>
	
	<cfparam name="attributes.DaysOrUnits1_24g_Line3" default="">
	<cfset DaysOrUnits1_24g_Line3 = attributes.DaysOrUnits1_24g_Line3>
	
	<cfparam name="attributes.EpsdtFamilyPlan1_24h_Line3" default="">
	<cfset EpsdtFamilyPlan1_24h_Line3 = attributes.EpsdtFamilyPlan1_24h_Line3>
	
	<cfparam name="attributes.Emg1_24i_Line3" default="">
	<cfset Emg1_24i_Line3 = attributes.Emg1_24i_Line3>
	
	<cfparam name="attributes.Cob1_24j_Line3" default="">
	<cfset Cob1_24j_Line3 = attributes.Cob1_24j_Line3>
	
	<cfparam name="attributes.ReservedForLocalUse1_24k_Line3" default="">
	<cfset ReservedForLocalUse1_24k_Line3 = attributes.ReservedForLocalUse1_24k_Line3>
	
	<cfparam name="attributes.DatesOfServiceFrom1_MM_24a_Line4" default="">
	<cfset DatesOfServiceFrom1_MM_24a_Line4 = attributes.DatesOfServiceFrom1_MM_24a_Line4>
	
	<cfparam name="attributes.DatesOfServiceFrom1_DD_24a_Line4" default="">
	<cfset DatesOfServiceFrom1_DD_24a_Line4 = attributes.DatesOfServiceFrom1_DD_24a_Line4>
	
	<cfparam name="attributes.DatesOfServiceFrom1_YY_24a_Line4" default="">
	<cfset DatesOfServiceFrom1_YY_24a_Line4 = attributes.DatesOfServiceFrom1_YY_24a_Line4>
	
	<cfparam name="attributes.DatesOfServiceTo1_MM_24a_Line4" default="">
	<cfset DatesOfServiceTo1_MM_24a_Line4 = attributes.DatesOfServiceTo1_MM_24a_Line4>
	
	<cfparam name="attributes.DatesOfServiceTo1_DD_24a_Line4" default="">
	<cfset DatesOfServiceTo1_DD_24a_Line4 = attributes.DatesOfServiceTo1_DD_24a_Line4>
	
	<cfparam name="attributes.DatesOfServiceTo1_YY_24a_Line4" default="">
	<cfset DatesOfServiceTo1_YY_24a_Line4 = attributes.DatesOfServiceTo1_YY_24a_Line4>
	
	<cfparam name="attributes.PlaceOfService1_24b_Line4" default="">
	<cfset PlaceOfService1_24b_Line4 = attributes.PlaceOfService1_24b_Line4>
	
	<cfparam name="attributes.TypeOfService1_24c_Line4" default="">
	<cfset TypeOfService1_24c_Line4 = attributes.TypeOfService1_24c_Line4>
	
	<cfparam name="attributes.Procedures_HCPCS1_24d_Line4" default="">
	<cfset Procedures_HCPCS1_24d_Line4 = attributes.Procedures_HCPCS1_24d_Line4>
	
	<cfparam name="attributes.Procedures_Modifier1_1_24d_Line4" default="">
	<cfset Procedures_Modifier1_1_24d_Line4 = attributes.Procedures_Modifier1_1_24d_Line4>
	
	<cfparam name="attributes.Procedures_Modifier1_2_24d_Line4" default="">
	<cfset Procedures_Modifier1_2_24d_Line4 = attributes.Procedures_Modifier1_2_24d_Line4>
	
	<cfparam name="attributes.Procedures_Modifier1_3_24d_Line4" default="">
	<cfset Procedures_Modifier1_3_24d_Line4 = attributes.Procedures_Modifier1_3_24d_Line4>
	
	<cfparam name="attributes.Procedures_Modifier1_4_24d_Line4" default="">
	<cfset Procedures_Modifier1_4_24d_Line4 = attributes.Procedures_Modifier1_4_24d_Line4>
	
	<cfparam name="attributes.DiagnosisCode1_24e_Line4" default="">
	<cfset DiagnosisCode1_24e_Line4 = attributes.DiagnosisCode1_24e_Line4>
	
	<cfparam name="attributes.Charges1_24f_Line4" default="">
	<cfset Charges1_24f_Line4 = attributes.Charges1_24f_Line4>
	
	<cfparam name="attributes.ChargesCents1_24f_Line4" default="">
	<cfset ChargesCents1_24f_Line4 = attributes.ChargesCents1_24f_Line4>
	
	<cfparam name="attributes.DaysOrUnits1_24g_Line4" default="">
	<cfset DaysOrUnits1_24g_Line4 = attributes.DaysOrUnits1_24g_Line4>
	
	<cfparam name="attributes.EpsdtFamilyPlan1_24h_Line4" default="">
	<cfset EpsdtFamilyPlan1_24h_Line4 = attributes.EpsdtFamilyPlan1_24h_Line4>
	
	<cfparam name="attributes.Emg1_24i_Line4" default="">
	<cfset Emg1_24i_Line4 = attributes.Emg1_24i_Line4>
	
	<cfparam name="attributes.Cob1_24j_Line4" default="">
	<cfset Cob1_24j_Line4 = attributes.Cob1_24j_Line4>
	
	<cfparam name="attributes.ReservedForLocalUse1_24k_Line4" default="">
	<cfset ReservedForLocalUse1_24k_Line4 = attributes.ReservedForLocalUse1_24k_Line4>
	
	<cfparam name="attributes.DatesOfServiceFrom1_MM_24a_Line5" default="">
	<cfset DatesOfServiceFrom1_MM_24a_Line5 = attributes.DatesOfServiceFrom1_MM_24a_Line5>
	
	<cfparam name="attributes.DatesOfServiceFrom1_DD_24a_Line5" default="">
	<cfset DatesOfServiceFrom1_DD_24a_Line5 = attributes.DatesOfServiceFrom1_DD_24a_Line5>
	
	<cfparam name="attributes.DatesOfServiceFrom1_YY_24a_Line5" default="">
	<cfset DatesOfServiceFrom1_YY_24a_Line5 = attributes.DatesOfServiceFrom1_YY_24a_Line5>
	
	<cfparam name="attributes.DatesOfServiceTo1_MM_24a_Line5" default="">
	<cfset DatesOfServiceTo1_MM_24a_Line5 = attributes.DatesOfServiceTo1_MM_24a_Line5>
	
	<cfparam name="attributes.DatesOfServiceTo1_DD_24a_Line5" default="">
	<cfset DatesOfServiceTo1_DD_24a_Line5 = attributes.DatesOfServiceTo1_DD_24a_Line5>
	
	<cfparam name="attributes.DatesOfServiceTo1_YY_24a_Line5" default="">
	<cfset DatesOfServiceTo1_YY_24a_Line5 = attributes.DatesOfServiceTo1_YY_24a_Line5>
	
	<cfparam name="attributes.PlaceOfService1_24b_Line5" default="">
	<cfset PlaceOfService1_24b_Line5 = attributes.PlaceOfService1_24b_Line5>
	
	<cfparam name="attributes.TypeOfService1_24c_Line5" default="">
	<cfset TypeOfService1_24c_Line5 = attributes.TypeOfService1_24c_Line5>
	
	<cfparam name="attributes.Procedures_HCPCS1_24d_Line5" default="">
	<cfset Procedures_HCPCS1_24d_Line5 = attributes.Procedures_HCPCS1_24d_Line5>
	
	<cfparam name="attributes.Procedures_Modifier1_1_24d_Line5" default="">
	<cfset Procedures_Modifier1_1_24d_Line5 = attributes.Procedures_Modifier1_1_24d_Line5>
	
	<cfparam name="attributes.Procedures_Modifier1_2_24d_Line5" default="">
	<cfset Procedures_Modifier1_2_24d_Line5 = attributes.Procedures_Modifier1_2_24d_Line5>
	
	<cfparam name="attributes.Procedures_Modifier1_3_24d_Line5" default="">
	<cfset Procedures_Modifier1_3_24d_Line5 = attributes.Procedures_Modifier1_3_24d_Line5>
	
	<cfparam name="attributes.Procedures_Modifier1_4_24d_Line5" default="">
	<cfset Procedures_Modifier1_4_24d_Line5 = attributes.Procedures_Modifier1_4_24d_Line5>
	
	<cfparam name="attributes.DiagnosisCode1_24e_Line5" default="">
	<cfset DiagnosisCode1_24e_Line5 = attributes.DiagnosisCode1_24e_Line5>
	
	<cfparam name="attributes.Charges1_24f_Line5" default="">
	<cfset Charges1_24f_Line5 = attributes.Charges1_24f_Line5>
	
	<cfparam name="attributes.ChargesCents1_24f_Line5" default="">
	<cfset ChargesCents1_24f_Line5 = attributes.ChargesCents1_24f_Line5>
	
	<cfparam name="attributes.DaysOrUnits1_24g_Line5" default="">
	<cfset DaysOrUnits1_24g_Line5 = attributes.DaysOrUnits1_24g_Line5>
	
	<cfparam name="attributes.EpsdtFamilyPlan1_24h_Line5" default="">
	<cfset EpsdtFamilyPlan1_24h_Line5 = attributes.EpsdtFamilyPlan1_24h_Line5>
	
	<cfparam name="attributes.Emg1_24i_Line5" default="">
	<cfset Emg1_24i_Line5 = attributes.Emg1_24i_Line5>
	
	<cfparam name="attributes.Cob1_24j_Line5" default="">
	<cfset Cob1_24j_Line5 = attributes.Cob1_24j_Line5>
	
	<cfparam name="attributes.ReservedForLocalUse1_24k_Line5" default="">
	<cfset ReservedForLocalUse1_24k_Line5 = attributes.ReservedForLocalUse1_24k_Line5>
	
	<cfparam name="attributes.DatesOfServiceFrom1_MM_24a_Line6" default="">
	<cfset DatesOfServiceFrom1_MM_24a_Line6 = attributes.DatesOfServiceFrom1_MM_24a_Line6>
	
	<cfparam name="attributes.DatesOfServiceFrom1_DD_24a_Line6" default="">
	<cfset DatesOfServiceFrom1_DD_24a_Line6 = attributes.DatesOfServiceFrom1_DD_24a_Line6>
	
	<cfparam name="attributes.DatesOfServiceFrom1_YY_24a_Line6" default="">
	<cfset DatesOfServiceFrom1_YY_24a_Line6 = attributes.DatesOfServiceFrom1_YY_24a_Line6>
	
	<cfparam name="attributes.DatesOfServiceTo1_MM_24a_Line6" default="">
	<cfset DatesOfServiceTo1_MM_24a_Line6 = attributes.DatesOfServiceTo1_MM_24a_Line6>
	
	<cfparam name="attributes.DatesOfServiceTo1_DD_24a_Line6" default="">
	<cfset DatesOfServiceTo1_DD_24a_Line6 = attributes.DatesOfServiceTo1_DD_24a_Line6>
	
	<cfparam name="attributes.DatesOfServiceTo1_YY_24a_Line6" default="">
	<cfset DatesOfServiceTo1_YY_24a_Line6 = attributes.DatesOfServiceTo1_YY_24a_Line6>
	
	<cfparam name="attributes.PlaceOfService1_24b_Line6" default="">
	<cfset PlaceOfService1_24b_Line6 = attributes.PlaceOfService1_24b_Line6>
	
	<cfparam name="attributes.TypeOfService1_24c_Line6" default="">
	<cfset TypeOfService1_24c_Line6 = attributes.TypeOfService1_24c_Line6>
	
	<cfparam name="attributes.Procedures_HCPCS1_24d_Line6" default="">
	<cfset Procedures_HCPCS1_24d_Line6 = attributes.Procedures_HCPCS1_24d_Line6>
	
	<cfparam name="attributes.Procedures_Modifier1_1_24d_Line6" default="">
	<cfset Procedures_Modifier1_1_24d_Line6 = attributes.Procedures_Modifier1_1_24d_Line6>
	
	<cfparam name="attributes.Procedures_Modifier1_2_24d_Line6" default="">
	<cfset Procedures_Modifier1_2_24d_Line6 = attributes.Procedures_Modifier1_2_24d_Line6>
	
	<cfparam name="attributes.Procedures_Modifier1_3_24d_Line6" default="">
	<cfset Procedures_Modifier1_3_24d_Line6 = attributes.Procedures_Modifier1_3_24d_Line6>
	
	<cfparam name="attributes.Procedures_Modifier1_4_24d_Line6" default="">
	<cfset Procedures_Modifier1_4_24d_Line6 = attributes.Procedures_Modifier1_4_24d_Line6>
	
	<cfparam name="attributes.DiagnosisCode1_24e_Line6" default="">
	<cfset DiagnosisCode1_24e_Line6 = attributes.DiagnosisCode1_24e_Line6>
	
	<cfparam name="attributes.Charges1_24f_Line6" default="">
	<cfset Charges1_24f_Line6 = attributes.Charges1_24f_Line6>
	
	<cfparam name="attributes.ChargesCents1_24f_Line6" default="">
	<cfset ChargesCents1_24f_Line6 = attributes.ChargesCents1_24f_Line6>
	
	<cfparam name="attributes.DaysOrUnits1_24g_Line6" default="">
	<cfset DaysOrUnits1_24g_Line6 = attributes.DaysOrUnits1_24g_Line6>
	
	<cfparam name="attributes.EpsdtFamilyPlan1_24h_Line6" default="">
	<cfset EpsdtFamilyPlan1_24h_Line6 = attributes.EpsdtFamilyPlan1_24h_Line6>
	
	<cfparam name="attributes.Emg1_24i_Line6" default="">
	<cfset Emg1_24i_Line6 = attributes.Emg1_24i_Line6>
	
	<cfparam name="attributes.Cob1_24j_Line6" default="">
	<cfset Cob1_24j_Line6 = attributes.Cob1_24j_Line6>
	
	<cfparam name="attributes.ReservedForLocalUse1_24k_Line6" default="">
	<cfset ReservedForLocalUse1_24k_Line6 = attributes.ReservedForLocalUse1_24k_Line6>
	
	<cfparam name="attributes.FederalTaxIdNumber_25" default="">
	<cfset FederalTaxIdNumber_25 = attributes.FederalTaxIdNumber_25>
	
	<cfparam name="attributes.Ssn_25" default="">
	<cfset Ssn_25 = attributes.Ssn_25>
	
	<cfparam name="attributes.Ein_25" default="">
	<cfset Ein_25 = attributes.Ein_25>
	
	<cfparam name="attributes.PatientsAccountNo_26" default="">
	<cfset PatientsAccountNo_26 = attributes.PatientsAccountNo_26>
	
	<cfparam name="attributes.AcceptAssignmentYes_25" default="">
	<cfset AcceptAssignmentYes_25 = attributes.AcceptAssignmentYes_25>
	
	<cfparam name="attributes.AcceptAssignmentNo_25" default="">
	<cfset AcceptAssignmentNo_25 = attributes.AcceptAssignmentNo_25>
	
	<cfparam name="attributes.TotalChargesDollars_28" default="">
	<cfset TotalChargesDollars_28 = attributes.TotalChargesDollars_28>
	
	<cfparam name="attributes.TotalChargesCents_28" default="">
	<cfset TotalChargesCents_28 = attributes.TotalChargesCents_28>
	
	<cfparam name="attributes.AmountPaidDollars_29" default="">
	<cfset AmountPaidDollars_29 = attributes.AmountPaidDollars_29>
	
	<cfparam name="attributes.AmountPaidCents_29" default="">
	<cfset AmountPaidCents_29 = attributes.AmountPaidCents_29>
	
	<cfparam name="attributes.BalanceDueDollars_30" default="">
	<cfset BalanceDueDollars_30 = attributes.BalanceDueDollars_30>
	
	<cfparam name="attributes.BalanceDueCents_30" default="">
	<cfset BalanceDueCents_30 = attributes.BalanceDueCents_30>
	
	<cfparam name="attributes.Signature_Of_Physician_31" default="">
	<cfset Signature_Of_Physician_31 = attributes.Signature_Of_Physician_31>
	
	<cfparam name="attributes.Signature_Of_PhysicianDate_31" default="">
	<cfset Signature_Of_PhysicianDate_31 = attributes.Signature_Of_PhysicianDate_31>
	
	<cfparam name="attributes.NameAndAddressOfFacility_Name_32" default="">
	<cfset NameAndAddressOfFacility_Name_32 = attributes.NameAndAddressOfFacility_Name_32>
	
	<cfparam name="attributes.NameAndAddressOfFacility_Address_32" default="">
	<cfset NameAndAddressOfFacility_Address_32 = attributes.NameAndAddressOfFacility_Address_32>
	
	<cfparam name="attributes.NameAndAddressOfFacility_City_32" default="">
	<cfset NameAndAddressOfFacility_City_32 = attributes.NameAndAddressOfFacility_City_32>
	
	<cfparam name="attributes.NameAndAddressOfFacility_State_32" default="">
	<cfset NameAndAddressOfFacility_State_32 = attributes.NameAndAddressOfFacility_State_32>
	
	<cfparam name="attributes.NameAndAddressOfFacility_Zip_32" default="">
	<cfset NameAndAddressOfFacility_Zip_32 = attributes.NameAndAddressOfFacility_Zip_32>
	
	<cfparam name="attributes.PhysicianSupplierBillingName_33" default="">
	<cfset PhysicianSupplierBillingName_33 = attributes.PhysicianSupplierBillingName_33>
	
	<cfparam name="attributes.PhysicianSupplierBillingAddress_33" default="">
	<cfset PhysicianSupplierBillingAddress_33 = attributes.PhysicianSupplierBillingAddress_33>
	
	<cfparam name="attributes.PhysicianSupplierBillingCity_33" default="">
	<cfset PhysicianSupplierBillingCity_33 = attributes.PhysicianSupplierBillingCity_33>
	
	<cfparam name="attributes.PhysicianSupplierBillingState_33" default="">
	<cfset PhysicianSupplierBillingState_33 = attributes.PhysicianSupplierBillingState_33>
	
	<cfparam name="attributes.PhysicianSupplierBillingZip_33" default="">
	<cfset PhysicianSupplierBillingZip_33 = attributes.PhysicianSupplierBillingZip_33>
	
	<cfparam name="attributes.PhysicianSupplierBillingTelephone_33" default="">
	<cfset PhysicianSupplierBillingTelephone_33 = attributes.PhysicianSupplierBillingTelephone_33>
	
	<cfparam name="attributes.Pin_Num_33" default="">
	<cfset Pin_Num_33 = attributes.Pin_Num_33>
	
	<cfparam name="attributes.Grp_Num_33" default="">
	<cfset Grp_Num_33 = attributes.Grp_Num_33>
	
	<cfparam name="attributes.Pica4" default="">
	<cfset Pica4 = attributes.Pica4>
	
	<cfparam name="attributes.Pica42" default="">
	<cfset Pica42 = attributes.Pica42>


<!------------------------------------------------------------------------------------------------------------------------------------------------>
<!--- +InsuranceCompanyName@ (1)Page_Number, (2)Left X Cor, (3)Bottom Y Cor, (4)Right X Cor, (5)Top Y Cor, (6)Font_Type, (7)Font_Size =[value] --->
<!------------------------------------------------------------------------------------------------------------------------------------------------>
	
<!-------------------------------------------------------------------------------------->
<!--- Create the Control File that will be used to give the pdf tool the arguments.  --->
<!-------------------------------------------------------------------------------------->	
<cfoutput>
<cfsavecontent variable="fileData">
+InsuranceCompanyName@1,400,700,580,800,4,8=#trim(InsuranceCompanyName)#

+InsuranceCompanyAddressLine1@1,400,700,580,780,4,8=#trim(InsuranceCompanyAddressLine1)#

<cfif trim(InsuranceCompanyAddressLine2) NEQ "">
+InsuranceCompanyAddressLine2@1,400,700,580,760,4,8=#trim(InsuranceCompanyAddressLine2)#

+InsuranceCompanyCityStateZip@1,400,700,580,740,4,8=#trim(InsuranceCompanyCityStateZip)#
<cfelse>
+InsuranceCompanyCityStateZip@1,400,700,580,760,4,8=#trim(InsuranceCompanyCityStateZip)#
</cfif>

<cfif noteToPayer NEQ "">
	<cfset string1 = "*** #request.fullLeft(noteToPayer, 50)#">
	<cfset noteToPayer = ReplaceNoCase(noteToPayer, "#request.fullLeft(noteToPayer, 50)#", "", "ALL")>
	+NoteToPayer_1@1,77,700,338,825,4,11=#trim(string1)#
</cfif>
<cfif noteToPayer NEQ "" AND len(noteToPayer) GTE 1>
	<cfset string2 = "#request.fullLeft(noteToPayer, 50)#">
	<cfset noteToPayer = ReplaceNoCase(noteToPayer, "#request.fullLeft(noteToPayer, 50)#", "", "ALL")>
	+NoteToPayer_2@1,77,700,338,800,4,11=#trim(string2)#
</cfif>
<cfif noteToPayer NEQ "" AND len(noteToPayer) GTE 1>
	<cfset string3 = "#request.fullLeft(noteToPayer, 50)#">
	<cfset noteToPayer = ReplaceNoCase(noteToPayer, "#request.fullLeft(noteToPayer, 50)#", "", "ALL")>
	+NoteToPayer_3@1,77,700,338,775,4,11=#trim(string3)#
</cfif>
<cfif noteToPayer NEQ "" AND len(noteToPayer) GTE 1>
	<cfset string4 = "#request.fullLeft(noteToPayer, 50)#">
	<cfset noteToPayer = ReplaceNoCase(noteToPayer, "#request.fullLeft(noteToPayer, 50)#", "", "ALL")>
	+NoteToPayer_4@1,77,700,338,750,4,11=#trim(string4)#
</cfif>

+Medicare_1@1,26,668,38,681,4,8=#trim(Medicare_1)#

+Medicaid_1@1,77,668,85,681,4,8=#trim(Medicaid_1)#

+Champus_1@1,128,668,136,681,4,8=#trim(Champus_1)#

+ChampVa_1@1,192,668,200,681,4,8=#trim(ChampVa_1)#

+GroupHealthPlan_1@1,242,668,250,681,4,8=#trim(GroupHealthPlan_1)#

+FecaBlkLung_1@1,300,668,308,681,4,8=#trim(FecaBlkLung_1)#

+Other_1@1,344,668,352,681,4,8=#trim(Other_1)#

+InsuredsIDNumber_1a@1,380,673,592,681,4,8=#trim(InsuredsIDNumber_1a)#

+PatientsName_2@1,26,648,235,658,4,8=#trim(PatientsName_2)#

+PatientsBirthDate_MM_3@1,240,648,260,658,4,8=#trim(PatientsBirthDate_MM_3)#

+PatientsBirthDate_DD_3@1,262,648,279,658,4,8=#trim(PatientsBirthDate_DD_3)#

+PatientsBirthDate_YY_3@1,282,648,298,658,4,8=#trim(PatientsBirthDate_YY_3)#

+PatientsBirthDate_Sex_M_3@1,322,647,330,658,4,8=#trim(PatientsBirthDate_Sex_M_3)#

+PatientsBirthDate_Sex_F_3@1,358,647,367,658,4,8=#trim(PatientsBirthDate_Sex_F_3)#

+InsuredsName_4@1,380,647,592,658,4,8=#trim(InsuredsName_4)#

+PatientsAddress_StreetNo_5@1,26,623,225,633,4,8=#trim(PatientsAddress_StreetNo_5)#

+PatientsAddress_City_5@1,26,599,216,609,4,8=#trim(PatientsAddress_City_5)#

+PatientsAddress_State_5@1,210,599,230,609,4,8=#trim(PatientsAddress_State_5)#

+PatientsAddress_Zip_5@1,26,576,120,586,4,8=#trim(PatientsAddress_Zip_5)#

+PatientsAddress_PhoneAreaCode_5@1,130,576,149,586,4,8=#trim(PatientsAddress_PhoneAreaCode_5)#

+PatientsAddress_Phone_5@1,155,576,230,586,4,8=#trim(PatientsAddress_Phone_5)#

+PatientRelationshipToInsured_Self_6@1,256,623,266,633,4,8=#trim(PatientRelationshipToInsured_Self_6)#

+PatientRelationshipToInsured_Spouse_6@1,293,623,303,633,4,8=#trim(PatientRelationshipToInsured_Spouse_6)#

+PatientRelationshipToInsured_Child_6@1,322,623,332,633,4,8=#trim(PatientRelationshipToInsured_Child_6)#

+PatientRelationshipToInsured_Other_6@1,358,623,368,633,4,8=#trim(PatientRelationshipToInsured_Other_6)#

+InsuredAddress_StreetNo_7@1,380,623,592,633,4,8=#trim(InsuredAddress_StreetNo_7)#

+InsuredAddress_City_7@1,380,599,500,609,4,8=#trim(InsuredAddress_City_7)#

+InsuredAddress_State_7@1,556,599,576,609,4,8=#trim(InsuredAddress_State_7)#

+InsuredAddress_Zip_7@1,380,576,470,586,4,8=#trim(InsuredAddress_Zip_7)#

+InsuredAddress_PhoneAreaCode_7@1,492,576,514,586,4,8=#trim(InsuredAddress_PhoneAreaCode_7)#

+InsuredAddress_Phone_7@1,520,576,595,586,4,8=#trim(InsuredAddress_Phone_7)#

+PatientStatus_Single_8@1,271,599,281,609,4,8=#trim(PatientStatus_Single_8)#

+PatientStatus_Employed_8@1,271,575,281,585,4,8=#trim(PatientStatus_Employed_8)#

+PatientStatus_Married_8@1,315,599,325,609,4,8=#trim(PatientStatus_Married_8)#

+PatientStatus_FullTimeStudent_8@1,314,575,324,585,4,8=#trim(PatientStatus_FullTimeStudent_8)#

+PatientStatus_Other_8@1,358,599,368,609,4,8=#trim(PatientStatus_Other_8)#

+PatientStatus_PartTimeStudent_8@1,357,575,367,585,4,8=#trim(PatientStatus_PartTimeStudent_8)#

+OtherInsuredsName_9@1,26,553,225,563,4,8=#trim(OtherInsuredsName_9)#

+OtherInsuredsPolicyOrGroupNumber_9a@1,26,530,225,540,4,8=#trim(OtherInsuredsPolicyOrGroupNumber_9a)#

+OtherInsuredsDateOfBirth_MM_9b@1,30,502,48,512,4,8=#trim(OtherInsuredsDateOfBirth_MM_9b)#

+OtherInsuredsDateOfBirth_DD_9b@1,53,502,68,512,4,8=#trim(OtherInsuredsDateOfBirth_DD_9b)#

+OtherInsuredsDateOfBirth_YY_9b@1,74,502,89,512,4,8=#trim(OtherInsuredsDateOfBirth_YY_9b)#

+OtherInsuredsDateOfBirth_Sex_M_9b@1,149,502,159,512,4,8=#trim(OtherInsuredsDateOfBirth_Sex_M_9b)#

+OtherInsuredsDateOfBirth_Sex_F_9b@1,193,502,203,512,4,8=#trim(OtherInsuredsDateOfBirth_Sex_F_9b)#

+EmployersNameOrSchoolName_9c@1,26,480,225,490,4,8=#trim(EmployersNameOrSchoolName_9c)#

+InsurancePlanNameOrProgramName_9d@1,26,456,225,466,4,8=#trim(InsurancePlanNameOrProgramName_9d)#

+IsPatientsConditionRelatedTo_Employment_Yes_10a@1,272,525,282,537,4,8=#trim(IsPatientsConditionRelatedTo_Employment_Yes_10a)#

+IsPatientsConditionRelatedTo_Employment_No_10a@1,315,525,325,537,4,8=#trim(IsPatientsConditionRelatedTo_Employment_No_10a)#

+IsPatientsConditionRelatedTo_AutoAccident_Yes_10b@1,272,504,282,514,4,8=#trim(IsPatientsConditionRelatedTo_AutoAccident_Yes_10b)#

+IsPatientsConditionRelatedTo_AutoAccident_No_10b@1,315,504,325,514,4,8=#trim(IsPatientsConditionRelatedTo_AutoAccident_No_10b)#

+IsPatientsConditionRelatedTo_PlaceState_10b@1,344,504,364,514,4,8=#trim(IsPatientsConditionRelatedTo_PlaceState_10b)#

+IsPatientsConditionRelatedTo_OtherAccident_Yes_10c@1,272,480,282,490,4,8=#trim(IsPatientsConditionRelatedTo_OtherAccident_Yes_10c)#

+IsPatientsConditionRelatedTo_OtherAccident_No_10c@1,315,480,325,490,4,8=#trim(IsPatientsConditionRelatedTo_OtherAccident_No_10c)#

+ReservedForLocalUse_10d@1,242,456,368,466,4,8=#trim(ReservedForLocalUse_10d)#

+InsuredPolicyGroupOrFecaNumber_11a@1,380,553,575,563,4,8=#trim(InsuredPolicyGroupOrFecaNumber_11a)#

+InsuredDateOfBirth_MM_11a@1,407,528,429,538,4,8=#trim(InsuredDateOfBirth_MM_11a)#

+InsuredDateOfBirth_DD_11a@1,430,528,450,538,4,8=#trim(InsuredDateOfBirth_DD_11a)#

+InsuredDateOfBirth_YY_11a@1,453,528,473,538,4,8=#trim(InsuredDateOfBirth_YY_11a)#

+InsuredDateOfBirth_Sex_M_11a@1,510,527,520,537,4,8=#trim(InsuredDateOfBirth_Sex_M_11a)#

+InsuredDateOfBirth_Sex_F_11a@1,562,527,582,537,4,8=#trim(InsuredDateOfBirth_Sex_F_11a)#

+EmployersSchoolOrSchoolName_11b@1,380,504,592,514,4,8=#trim(EmployersSchoolOrSchoolName_11b)#

+InsurancePlanNameOrProgramName_11c@1,380,480,592,490,4,8=#trim(InsurancePlanNameOrProgramName_11c)#

+IsThereAnotherHealthBenefitPlan_Yes_11d@1,394,456,402,466,4,8=#trim(IsThereAnotherHealthBenefitPlan_Yes_11d)#

+IsThereAnotherHealthBenefitPlan_No_11d@1,431,456,439,466,4,8=#trim(IsThereAnotherHealthBenefitPlan_No_11d)#

+PatientsOrAuthorizedSigniature_Signed_12@1,70,410,252,420,4,8=#trim(PatientsOrAuthorizedSigniature_Signed_12)#


+PatientsOrAuthorizedSigniature_Date_MM_12@1,285,410,352,420,4,8=<cfif IsDate(trim(PatientsOrAuthorizedSigniature_Date_12))>#trim(PatientsOrAuthorizedSigniature_Date_12)#</cfif>
<!---+PatientsOrAuthorizedSigniature_Date_MM_12@1,285,410,306,420,4,8=#trim(PatientsOrAuthorizedSigniature_Date_MM_12)#
+PatientsOrAuthorizedSigniature_Date_DD_12@1,310,410,331,420,4,8=#trim(PatientsOrAuthorizedSigniature_Date_DD_12)#
+PatientsOrAuthorizedSigniature_Date_YY_12@1,332,410,352,420,4,8=#trim(PatientsOrAuthorizedSigniature_Date_YY_12)#--->

+InsuredsOrAuthorizedSigniture_13@1,430,410,550,420,4,8=#trim(InsuredsOrAuthorizedSigniture_13)#

+DateOfCurrentIllness_MM_14@1,30,375,54,401,4,8=#trim(DateOfCurrentIllness_MM_14)#

+DateOfCurrentIllness_DD_14@1,55,375,76,401,4,8=#trim(DateOfCurrentIllness_DD_14)#

+DateOfCurrentIllness_YY_14@1,77,375,98,401,4,8=#trim(DateOfCurrentIllness_YY_14)#

+PtHadSameOrSimularIllness_MM_15@1,285,375,306,401,4,8=#trim(PtHadSameOrSimularIllness_MM_15)#

+PtHadSameOrSimularIllness_DD_15@1,310,375,331,401,4,8=#trim(PtHadSameOrSimularIllness_DD_15)#

+PtHadSameOrSimularIllness_YY_15@1,332,375,352,401,4,8=#trim(PtHadSameOrSimularIllness_YY_15)#

+DatesPatientUnableToWorkFrom_MM_16@1,407,375,429,400,4,8=#trim(DatesPatientUnableToWorkFrom_MM_16)#

+DatesPatientUnableToWorkFrom_DD_16@1,430,375,450,400,4,8=#trim(DatesPatientUnableToWorkFrom_DD_16)#

+DatesPatientUnableToWorkFrom_YY_16@1,453,375,473,400,4,8=#trim(DatesPatientUnableToWorkFrom_YY_16)#

+DatesPatientUnableToWorkTo_MM_16@1,510,375,530,400,4,8=#trim(DatesPatientUnableToWorkTo_MM_16)#

+DatesPatientUnableToWorkTo_DD_16@1,533,375,553,400,4,8=#trim(DatesPatientUnableToWorkTo_DD_16)#

+DatesPatientUnableToWorkTo_YY_16@1,556,375,576,400,4,8=#trim(DatesPatientUnableToWorkTo_YY_16)#

+NameOfReferringPhysician_17@1,26,360,200,375,4,8=#trim(NameOfReferringPhysician_17)#

+IdOfReferringPhysician_17a@1,220,360,375,375,4,8=#trim(IdOfReferringPhysician_17a)#

+HospitalizationDatesFrom_MM_18@1,407,355,429,375,4,8=#trim(HospitalizationDatesFrom_MM_18)#

+HospitalizationDatesFrom_DD_18@1,430,355,450,375,4,8=#trim(HospitalizationDatesFrom_DD_18)#

+HospitalizationDatesFrom_YY_18@1,453,355,473,375,4,8=#trim(HospitalizationDatesFrom_YY_18)#

+HospitalizationDatesTo_MM_18@1,510,355,530,375,4,8=#trim(HospitalizationDatesTo_MM_18)#

+HospitalizationDatesTo_DD_18@1,533,355,553,375,4,8=#trim(HospitalizationDatesTo_DD_18)#

+HospitalizationDatesTo_YY_18@1,556,355,576,375,4,8=#trim(HospitalizationDatesTo_YY_18)#

+ReservedForLocalUse_19@1,26,338,375,353,4,8=#trim(ReservedForLocalUse_19)#

+OutsideLabYes_20@1,393,331,401,350,4,8=#trim(OutsideLabYes_20)#

+OutsideLabNo_20@1,430,331,438,350,4,8=#trim(OutsideLabNo_20)#

<cfset Charges_Line5Xstart = 528 - getHCFABoxLength(OutsideLabCharges_20)>	
+OutsideLabCharges_20@1,#trim(Charges_Line5Xstart)#,330,528,348,4,8=#trim(OutsideLabCharges_20)#

+OutsideLabChargesCents_20@1,535,330,575,348,4,8=#trim(OutsideLabChargesCents_20)#

+Diagnosis1_21@1,50,295,85,338,4,8=#trim(Diagnosis1_21)#

+Diagnosis2_21@1,50,290,85,298,4,8=#trim(Diagnosis2_21)#

+Diagnosis3_21@1,248,295,280,338,4,8=#trim(Diagnosis3_21)#

+Diagnosis4_21@1,248,290,280,298,4,8=#trim(Diagnosis4_21)#

+MedicaidResubmission_Code_22@1,393,296,453,339,4,8=#trim(MedicaidResubmission_Code_22)#

+MedicaidResubmission_OrigRefNo_22@1,469,296,587,339,4,8=#trim(MedicaidResubmission_OrigRefNo_22)#

+PriorAuthNo_23@1,393,290,587,298,4,8=#trim(PriorAuthNo_23)#

+DatesOfServiceFrom1_MM_24a_Line1@1,27,240,52,250,4,8=#trim(DatesOfServiceFrom1_MM_24a_Line1)#

+DatesOfServiceFrom1_DD_24a_Line1@1,51,240,74,250,4,8=#trim(DatesOfServiceFrom1_DD_24a_Line1)#

+DatesOfServiceFrom1_YY_24a_Line1@1,74,240,96,250,4,8=#trim(DatesOfServiceFrom1_YY_24a_Line1)#

+DatesOfServiceTo1_MM_24a_Line1@1,92,240,112,250,4,8=#trim(DatesOfServiceTo1_MM_24a_Line1)#

+DatesOfServiceTo1_DD_24a_Line1@1,114,240,135,250,4,8=#trim(DatesOfServiceTo1_DD_24a_Line1)#

+DatesOfServiceTo1_YY_24a_Line1@1,137,240,157,250,4,8=#trim(DatesOfServiceTo1_YY_24a_Line1)#

+PlaceOfService1_24b_Line1@1,159,240,179,250,4,8=#trim(PlaceOfService1_24b_Line1)#

+TypeOfService1_24c_Line1@1,181,240,191,250,4,8=#trim(TypeOfService1_24c_Line1)#

+Procedures_HCPCS1_24d_Line1@1,208,240,240,250,4,8=#trim(Procedures_HCPCS1_24d_Line1)#

+Procedures_Modifier1_1_24d_Line1@1,251,240,269,250,4,8=#trim(Procedures_Modifier1_1_24d_Line1)#

+Procedures_Modifier1_2_24d_Line1@1,270,240,286,250,4,8=#trim(Procedures_Modifier1_2_24d_Line1)#

+Procedures_Modifier1_3_24d_Line1@1,286,240,299,250,4,8=#trim(Procedures_Modifier1_3_24d_Line1)#

+Procedures_Modifier1_4_24d_Line1@1,300,240,317,250,4,8=#trim(Procedures_Modifier1_4_24d_Line1)#

+DiagnosisCode1_24e_Line1@1,331,240,363,250,4,8=#trim(DiagnosisCode1_24e_Line1)#

<cfset Charges_Line1Xstart = 418 - getHCFABoxLength(trim(Charges1_24f_Line1))>	
+Charges1_24f_Line1@1,#trim(Charges_Line1Xstart)#,240,418,250,4,8=#trim(Charges1_24f_Line1)#

+ChargesCents1_24f_Line1@1,421,240,446,250,4,8=#trim(ChargesCents1_24f_Line1)#

+DaysOrUnits1_24g_Line1@1,448,240,464,250,4,8=#trim(DaysOrUnits1_24g_Line1)#

+EpsdtFamilyPlan1_24h_Line1@1,473,240,481,250,4,8=#trim(EpsdtFamilyPlan1_24h_Line1)#

+Emg1_24i_Line1@1,491,240,505,250,4,8=#trim(Emg1_24i_Line1)#

+Cob1_24j_Line1@1,513,240,528,250,4,8=#trim(Cob1_24j_Line1)#

+ReservedForLocalUse1_24k_Line1@1,530,240,598,250,4,8=#trim(ReservedForLocalUse1_24k_Line1)#

+DatesOfServiceFrom1_MM_24a_Line2@1,27,215,52,225,4,8=#trim(DatesOfServiceFrom1_MM_24a_Line2)#

+DatesOfServiceFrom1_DD_24a_Line2@1,51,215,74,225,4,8=#trim(DatesOfServiceFrom1_DD_24a_Line2)#

+DatesOfServiceFrom1_YY_24a_Line2@1,74,215,96,225,4,8=#trim(DatesOfServiceFrom1_YY_24a_Line2)#

+DatesOfServiceTo1_MM_24a_Line2@1,92,215,112,225,4,8=#trim(DatesOfServiceTo1_MM_24a_Line2)#

+DatesOfServiceTo1_DD_24a_Line2@1,114,215,135,225,4,8=#trim(DatesOfServiceTo1_DD_24a_Line2)#

+DatesOfServiceTo1_YY_24a_Line2@1,137,215,157,225,4,8=#trim(DatesOfServiceTo1_YY_24a_Line2)#

+PlaceOfService1_24b_Line2@1,159,214,179,225,4,8=#trim(PlaceOfService1_24b_Line2)#

+TypeOfService1_24c_Line2@1,181,215,191,225,4,8=#trim(TypeOfService1_24c_Line2)#

+Procedures_HCPCS1_24d_Line2@1,208,215,240,225,4,8=#trim(Procedures_HCPCS1_24d_Line2)#

+Procedures_Modifier1_1_24d_Line2@1,251,215,269,225,4,8=#trim(Procedures_Modifier1_1_24d_Line2)#

+Procedures_Modifier1_2_24d_Line2@1,270,215,286,225,4,8=#trim(Procedures_Modifier1_2_24d_Line2)#

+Procedures_Modifier1_3_24d_Line2@1,286,215,299,225,4,8=#trim(Procedures_Modifier1_3_24d_Line2)#

+Procedures_Modifier1_4_24d_Line2@1,300,215,317,225,4,8=#trim(Procedures_Modifier1_4_24d_Line2)#

+DiagnosisCode1_24e_Line2@1,331,215,363,225,4,8=#trim(DiagnosisCode1_24e_Line2)#

<cfset Charges_Line2Xstart = 418 - getHCFABoxLength(trim(Charges1_24f_Line2))>	
+Charges1_24f_Line2@1,#trim(Charges_Line2Xstart)#,215,418,225,4,8=#trim(Charges1_24f_Line2)#
                         
+ChargesCents1_24f_Line2@1,421,215,440,225,4,8=#trim(ChargesCents1_24f_Line2)#

+DaysOrUnits1_24g_Line2@1,448,215,464,225,4,8=#trim(DaysOrUnits1_24g_Line2)#

+EpsdtFamilyPlan1_24h_Line2@1,473,215,481,225,4,8=#trim(EpsdtFamilyPlan1_24h_Line2)#

+Emg1_24i_Line2@1,491,215,505,225,4,8=#trim(Emg1_24i_Line2)#

+Cob1_24j_Line2@1,513,215,528,225,4,8=#trim(Cob1_24j_Line2)#

+ReservedForLocalUse1_24k_Line2@1,530,215,598,225,4,8=#trim(ReservedForLocalUse1_24k_Line2)#

+DatesOfServiceFrom1_MM_24a_Line3@1,27,192,52,202,4,8=#trim(DatesOfServiceFrom1_MM_24a_Line3)#

+DatesOfServiceFrom1_DD_24a_Line3@1,51,192,74,202,4,8=#trim(DatesOfServiceFrom1_DD_24a_Line3)#

+DatesOfServiceFrom1_YY_24a_Line3@1,74,192,96,202,4,8=#trim(DatesOfServiceFrom1_YY_24a_Line3)#

+DatesOfServiceTo1_MM_24a_Line3@1,92,192,112,202,4,8=#trim(DatesOfServiceTo1_MM_24a_Line3)#

+DatesOfServiceTo1_DD_24a_Line3@1,114,192,135,202,4,8=#trim(DatesOfServiceTo1_DD_24a_Line3)#

+DatesOfServiceTo1_YY_24a_Line3@1,137,192,157,202,4,8=#trim(DatesOfServiceTo1_YY_24a_Line3)#

+PlaceOfService1_24b_Line3@1,159,192,179,202,4,8=#trim(PlaceOfService1_24b_Line3)#

+TypeOfService1_24c_Line3@1,181,192,191,202,4,8=#trim(TypeOfService1_24c_Line3)#

+Procedures_HCPCS1_24d_Line3@1,208,192,240,202,4,8=#trim(Procedures_HCPCS1_24d_Line3)#

+Procedures_Modifier1_1_24d_Line3@1,251,192,269,202,4,8=#trim(Procedures_Modifier1_1_24d_Line3)#

+Procedures_Modifier1_2_24d_Line3@1,270,192,286,202,4,8=#trim(Procedures_Modifier1_2_24d_Line3)#

+Procedures_Modifier1_3_24d_Line3@1,286,192,299,202,4,8=#trim(Procedures_Modifier1_3_24d_Line3)#

+Procedures_Modifier1_4_24d_Line3@1,300,192,317,202,4,8=#trim(Procedures_Modifier1_4_24d_Line3)#

+DiagnosisCode1_24e_Line3@1,331,192,363,202,4,8=#trim(DiagnosisCode1_24e_Line3)#

<cfset Charges_Line3Xstart = 418 - getHCFABoxLength(trim(Charges1_24f_Line3))>	
+Charges1_24f_Line3@1,#trim(Charges_Line3Xstart)#,192,418,202,4,8=#trim(Charges1_24f_Line3)#
                         
+ChargesCents1_24f_Line3@1,421,192,440,202,4,8=#trim(ChargesCents1_24f_Line3)#

+DaysOrUnits1_24g_Line3@1,448,192,464,202,4,8=#trim(DaysOrUnits1_24g_Line3)#

+EpsdtFamilyPlan1_24h_Line3@1,473,192,481,202,4,8=#trim(EpsdtFamilyPlan1_24h_Line3)#

+Emg1_24i_Line3@1,491,192,505,202,4,8=#trim(Emg1_24i_Line3)#

+Cob1_24j_Line3@1,513,192,528,202,4,8=#trim(Cob1_24j_Line3)#

+ReservedForLocalUse1_24k_Line3@1,530,192,598,202,4,8=#trim(ReservedForLocalUse1_24k_Line3)#

+DatesOfServiceFrom1_MM_24a_Line4@1,27,169,52,179,4,8=#trim(DatesOfServiceFrom1_MM_24a_Line4)#

+DatesOfServiceFrom1_DD_24a_Line4@1,51,169,74,179,4,8=#trim(DatesOfServiceFrom1_DD_24a_Line4)#

+DatesOfServiceFrom1_YY_24a_Line4@1,74,169,96,179,4,8=#trim(DatesOfServiceFrom1_YY_24a_Line4)#

+DatesOfServiceTo1_MM_24a_Line4@1,92,169,112,179,4,8=#trim(DatesOfServiceTo1_MM_24a_Line4)#

+DatesOfServiceTo1_DD_24a_Line4@1,114,169,135,179,4,8=#trim(DatesOfServiceTo1_DD_24a_Line4)#

+DatesOfServiceTo1_YY_24a_Line4@1,137,169,157,179,4,8=#trim(DatesOfServiceTo1_YY_24a_Line4)#

+PlaceOfService1_24b_Line4@1,159,169,179,179,4,8=#trim(PlaceOfService1_24b_Line4)#

+TypeOfService1_24c_Line4@1,181,169,191,179,4,8=#trim(TypeOfService1_24c_Line4)#

+Procedures_HCPCS1_24d_Line4@1,208,169,240,179,4,8=#trim(Procedures_HCPCS1_24d_Line4)#

+Procedures_Modifier1_1_24d_Line4@1,251,169,269,179,4,8=#trim(Procedures_Modifier1_1_24d_Line4)#

+Procedures_Modifier1_2_24d_Line4@1,270,169,286,179,4,8=#trim(Procedures_Modifier1_2_24d_Line4)#

+Procedures_Modifier1_3_24d_Line4@1,286,169,299,179,4,8=#trim(Procedures_Modifier1_3_24d_Line4)#

+Procedures_Modifier1_4_24d_Line4@1,300,169,317,179,4,8=#trim(Procedures_Modifier1_4_24d_Line4)#

+DiagnosisCode1_24e_Line4@1,331,169,363,179,4,8=#trim(DiagnosisCode1_24e_Line4)#

<cfset Charges_Line4Xstart = 418 - getHCFABoxLength(trim(Charges1_24f_Line4))>	
+Charges1_24f_Line4@1,#trim(Charges_Line4Xstart)#,169,418,179,4,8=#trim(Charges1_24f_Line4)#
                         
+ChargesCents1_24f_Line4@1,421,169,440,179,4,8=#trim(ChargesCents1_24f_Line4)#

+DaysOrUnits1_24g_Line4@1,448,169,464,179,4,8=#trim(DaysOrUnits1_24g_Line4)#

+EpsdtFamilyPlan1_24h_Line4@1,473,169,481,179,4,8=#trim(EpsdtFamilyPlan1_24h_Line4)#

+Emg1_24i_Line4@1,491,169,505,179,4,8=#trim(Emg1_24i_Line4)#

+Cob1_24j_Line4@1,513,169,528,179,4,8=#trim(Cob1_24j_Line4)#

+ReservedForLocalUse1_24k_Line4@1,530,169,598,179,4,8=#trim(ReservedForLocalUse1_24k_Line4)#

+DatesOfServiceFrom1_MM_24a_Line5@1,27,146,52,156,4,8=#trim(DatesOfServiceFrom1_MM_24a_Line5)#

+DatesOfServiceFrom1_DD_24a_Line5@1,51,146,74,156,4,8=#trim(DatesOfServiceFrom1_DD_24a_Line5)#

+DatesOfServiceFrom1_YY_24a_Line5@1,74,146,96,156,4,8=#trim(DatesOfServiceFrom1_YY_24a_Line5)#

+DatesOfServiceTo1_MM_24a_Line5@1,92,146,112,156,4,8=#trim(DatesOfServiceTo1_MM_24a_Line5)#

+DatesOfServiceTo1_DD_24a_Line5@1,114,146,135,156,4,8=#trim(DatesOfServiceTo1_DD_24a_Line5)#

+DatesOfServiceTo1_YY_24a_Line5@1,137,146,157,156,4,8=#trim(DatesOfServiceTo1_YY_24a_Line5)#

+PlaceOfService1_24b_Line5@1,159,146,179,156,4,8=#trim(PlaceOfService1_24b_Line5)#

+TypeOfService1_24c_Line5@1,181,146,191,156,4,8=#trim(TypeOfService1_24c_Line5)#

+Procedures_HCPCS1_24d_Line5@1,208,146,240,156,4,8=#trim(Procedures_HCPCS1_24d_Line5)#

+Procedures_Modifier1_1_24d_Line5@1,251,146,269,156,4,8=#trim(Procedures_Modifier1_1_24d_Line5)#

+Procedures_Modifier1_2_24d_Line5@1,270,146,286,156,4,8=#trim(Procedures_Modifier1_2_24d_Line5)#

+Procedures_Modifier1_3_24d_Line5@1,286,146,299,156,4,8=#trim(Procedures_Modifier1_3_24d_Line5)#

+Procedures_Modifier1_4_24d_Line5@1,300,146,317,156,4,8=#trim(Procedures_Modifier1_4_24d_Line5)#

+DiagnosisCode1_24e_Line5@1,331,146,363,156,4,8=#trim(DiagnosisCode1_24e_Line5)#

<cfset Charges_Line5Xstart = 418 - getHCFABoxLength(trim(Charges1_24f_Line5))>	
+Charges1_24f_Line5@1,#trim(Charges_Line5Xstart)#,146,418,156,4,8=#trim(Charges1_24f_Line5)#
                         
+ChargesCents1_24f_Line5@1,421,146,440,156,4,8=#trim(ChargesCents1_24f_Line5)#

+DaysOrUnits1_24g_Line5@1,448,146,464,156,4,8=#trim(DaysOrUnits1_24g_Line5)#

+EpsdtFamilyPlan1_24h_Line5@1,473,146,481,156,4,8=#trim(EpsdtFamilyPlan1_24h_Line5)#

+Emg1_24i_Line5@1,491,146,505,156,4,8=#trim(Emg1_24i_Line5)#

+Cob1_24j_Line5@1,513,146,528,156,4,8=#trim(Cob1_24j_Line5)#

+ReservedForLocalUse1_24k_Line5@1,530,146,598,156,4,8=#trim(ReservedForLocalUse1_24k_Line5)#

+DatesOfServiceFrom1_MM_24a_Line6@1,27,123,52,133,4,8=#trim(DatesOfServiceFrom1_MM_24a_Line6)#

+DatesOfServiceFrom1_DD_24a_Line6@1,51,123,74,133,4,8=#trim(DatesOfServiceFrom1_DD_24a_Line6)#

+DatesOfServiceFrom1_YY_24a_Line6@1,74,123,96,133,4,8=#trim(DatesOfServiceFrom1_YY_24a_Line6)#

+DatesOfServiceTo1_MM_24a_Line6@1,92,123,112,133,4,8=#trim(DatesOfServiceTo1_MM_24a_Line6)#

+DatesOfServiceTo1_DD_24a_Line6@1,114,123,135,133,4,8=#trim(DatesOfServiceTo1_DD_24a_Line6)#

+DatesOfServiceTo1_YY_24a_Line6@1,137,123,157,133,4,8=#trim(DatesOfServiceTo1_YY_24a_Line6)#

+PlaceOfService1_24b_Line6@1,159,123,179,133,4,8=#trim(PlaceOfService1_24b_Line6)#

+TypeOfService1_24c_Line6@1,181,123,191,133,4,8=#trim(TypeOfService1_24c_Line6)#

+Procedures_HCPCS1_24d_Line6@1,208,123,240,133,4,8=#trim(Procedures_HCPCS1_24d_Line6)#

+Procedures_Modifier1_1_24d_Line6@1,251,123,269,133,4,8=#trim(Procedures_Modifier1_1_24d_Line6)#

+Procedures_Modifier1_2_24d_Line6@1,270,123,286,133,4,8=#trim(Procedures_Modifier1_2_24d_Line6)#

+Procedures_Modifier1_3_24d_Line6@1,286,123,299,133,4,8=#trim(Procedures_Modifier1_3_24d_Line6)#

+Procedures_Modifier1_4_24d_Line6@1,300,123,317,133,4,8=#trim(Procedures_Modifier1_4_24d_Line6)#

+DiagnosisCode1_24e_Line6@1,331,123,363,133,4,8=#trim(DiagnosisCode1_24e_Line6)#

<cfset Charges_Line6Xstart = 418 - getHCFABoxLength(trim(Charges1_24f_Line6))>	
+Charges1_24f_Line6@1,#trim(Charges_Line6Xstart)#,123,418,133,4,8=#trim(Charges1_24f_Line6)#
                         
+ChargesCents1_24f_Line6@1,421,123,440,133,4,8=#trim(ChargesCents1_24f_Line6)#

+DaysOrUnits1_24g_Line6@1,448,123,464,133,4,8=#trim(DaysOrUnits1_24g_Line6)#

+EpsdtFamilyPlan1_24h_Line6@1,473,123,481,133,4,8=#trim(EpsdtFamilyPlan1_24h_Line6)#

+Emg1_24i_Line6@1,491,123,505,133,4,8=#trim(Emg1_24i_Line6)#

+Cob1_24j_Line6@1,513,123,528,133,4,8=#trim(Cob1_24j_Line6)#

+ReservedForLocalUse1_24k_Line6@1,530,123,598,133,4,8=#trim(ReservedForLocalUse1_24k_Line6)#

+FederalTaxIdNumber_25@1,28,95,133,110,4,8=#trim(FederalTaxIdNumber_25)#

+Ssn_25@1,145,93,154,109,4,8=#trim(Ssn_25)#

+Ein_25@1,159,93,168,109,4,8=#trim(Ein_25)#

+PatientsAccountNo_26@1,185,95,285,110,4,8=#trim(PatientsAccountNo_26)#

+AcceptAssignmentYes_25@1,293,94,301,110,4,8=#trim(AcceptAssignmentYes_25)#

+AcceptAssignmentNo_25@1,329,94,340,110,4,8=#trim(AcceptAssignmentNo_25)#

<cfset TotalChargesDollarsXstart = 432 - getHCFABoxLength(TotalChargesDollars_28)>	
+TotalChargesDollars_28@1,#trim(TotalChargesDollarsXstart)#,94,432,107,4,8=#trim(TotalChargesDollars_28)#

+TotalChargesCents_28@1,440,94,455,107,4,8=#trim(TotalChargesCents_28)#

<cfset AmountPaidDollarsXstart = 503 - getHCFABoxLength(AmountPaidDollars_29)>	
+AmountPaidDollars_29@1,#trim(AmountPaidDollarsXstart)#,94,503,107,4,8=#trim(AmountPaidDollars_29)#

+AmountPaidCents_29@1,511,94,528,107,4,8=#trim(AmountPaidCents_29)#

<cfset BalanceDueDollarsXstart = 570 - getHCFABoxLength(BalanceDueDollars_30)>	
+BalanceDueDollars_30@1,#trim(BalanceDueDollarsXstart)#,94,570,107,4,8=#trim(BalanceDueDollars_30)#

+BalanceDueCents_30@1,575,94,586,107,4,8=#trim(BalanceDueCents_30)#

+Signature_Of_Physician_31@1,28,38,110,55,4,8=#trim(Signature_Of_Physician_31)#

+Signature_Of_PhysicianDate_31@1,138,38,175,55,4,8=#trim(Signature_Of_PhysicianDate_31)#

+NameAndAddressOfFacility_Name_32@1,185,70,375,79,4,8=#trim(NameAndAddressOfFacility_Name_32)#

+NameAndAddressOfFacility_Address_32@1,185,60,375,69,4,8=#trim(NameAndAddressOfFacility_Address_32)#

+NameAndAddressOfFacility_City_32@1,185,50,290,59,4,8=#trim(NameAndAddressOfFacility_City_32)#

+NameAndAddressOfFacility_State_32@1,295,50,310,59,4,8=#trim(NameAndAddressOfFacility_State_32)#

+NameAndAddressOfFacility_Zip_32@1,315,50,341,59,4,8=#trim(NameAndAddressOfFacility_Zip_32)#

+PhysicianSupplierBillingName_33@1,390,72,586,81,4,8=#trim(PhysicianSupplierBillingName_33)#

+PhysicianSupplierBillingAddress_33@1,390,62,586,71,4,8=#trim(PhysicianSupplierBillingAddress_33)#

+PhysicianSupplierBillingCity_33@1,390,52,495,61,4,8=#trim(PhysicianSupplierBillingCity_33)#

+PhysicianSupplierBillingState_33@1,500,52,515,61,4,8=#trim(PhysicianSupplierBillingState_33)#

+PhysicianSupplierBillingZip_33@1,520,52,551,61,4,8=#trim(PhysicianSupplierBillingZip_33)#

<!---+PhysicianSupplierBillingTelephone_33@1,390,42,586,51,4,8=#trim(PhysicianSupplierBillingTelephone_33)#--->

+Pin_Num_33@1,395,33,480,43,4,8=#trim(Pin_Num_33)#

+Grp_Num_33@1,500,33,593,43,4,8=#trim(Grp_Num_33)#

+Pica4@1,24,685,38,711,4,8=#trim(Pica4)#

+Pica42@1,587,685,600,711,4,8=#trim(Pica42)#
</cfsavecontent>
</cfoutput>		

	
	
<!-------------------------------------------------------------------------------------->
<!--- Write the control file to the system.                                          --->
<!-------------------------------------------------------------------------------------->	
	<cffile 
		action="write" 
		nameconflict="OVERWRITE" 
		file="#trim(savefilepath)#\#ListFirst(trim(fileName), ".")#.txt" 
		output="#fileData#">
		
	
	
<!-------------------------------------------------------------------------------------->
<!--- Creat the pdf with the parameters added to it.                                 --->
<!-------------------------------------------------------------------------------------->
	<cfexecute 
		name="#trim(request.driveLetter)#:\#trim(request.applicationPathMainFolder)#\pdf-tools\bin\pdformp.exe" 
		arguments="#trim(HCFAPath)# #trim(savefilepath)#\#trim(fileName)# @#trim(savefilepath)#\#ListFirst(trim(fileName), ".")#.txt"			
		timeout="60"></cfexecute>
		
		