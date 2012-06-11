<!---- tagQuoteForm.cfm ---->

		
		
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
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formName" default="PatientQuoteForm">
	<cfset formName = attributes.formName>
	
	<cfparam name="attributes.msg" default="">
	<cfset msg = attributes.msg>
	
	<cfparam name="attributes.quoteID" default="">
	<cfset quoteID = attributes.quoteID>
	
	<cfparam name="attributes.active" default="0">
	<cfset active = attributes.active>
	
	<cfparam name="attributes.hidden_UsersID" default="">
	<cfset hidden_UsersID = attributes.hidden_UsersID>
	
	<cfparam name="attributes.dateCreated" default="">
	<cfset dateCreated = attributes.dateCreated>
	
	<cfparam name="attributes.hidden_TimeStart" default="#TimeFormat(NOW(), 'hh:mm:ss tt')#">
	<cfset hidden_TimeStart = attributes.hidden_TimeStart>
	
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
	
	<cfparam name="attributes.primaryInsuranceNameTBox" default="">
	<cfset primaryInsuranceNameTBox = attributes.primaryInsuranceNameTBox>
	
	<cfparam name="attributes.secondaryInsuranceNameTBox" default="">
	<cfset secondaryInsuranceNameTBox = attributes.secondaryInsuranceNameTBox>
															   
	<cfparam name="attributes.primaryPolicyNumberTBox" default="">
	<cfset primaryPolicyNumberTBox = attributes.primaryPolicyNumberTBox>
	
	<cfparam name="attributes.secondaryPolicyNumberTBox" default="">
	<cfset secondaryPolicyNumberTBox = attributes.secondaryPolicyNumberTBox>
														   
	<cfparam name="attributes.orderingPhysicianPhoneTBox" default="">
	<cfset orderingPhysicianPhoneTBox = attributes.orderingPhysicianPhoneTBox>
	
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
	
										
										
<!-------------------------------------------------------------------------------------->
<!--- Javascripts needed for this page.                                              --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		
		<style>				
							
			##yellowAlert{
				background-color:ffffcc; 
				display:none; 
				width:540; 
				border:1px solid ccc889; 
				color:616161; 
				padding:10px; 
				margin-bottom:1em; 
			}
			
		</style>		
		
		<script language="JavaScript">
			
			function addLine(){
				for(var i=1; i < 41; i++){										
					tempTRRow = 'document.all.tr_hcpc' + i + '.style.display';
					if(eval(tempTRRow) == 'none'){
						temp = 'document.all.tr_hcpc' + i + '.style.display = \'inline\''
						eval(temp);
						temp2 = 'document.getElementById(\"hcpcCode" + i + "TBox\").focus();';			
						eval(temp2);	
						break;
					};												
				};								
			};
			
			function bgColorRequired(obj){
				if(obj.value == ''){
					obj.style.backgroundColor='ffffcc';
				}
				else{
					obj.style.backgroundColor='ffffff'
				};
			};
								
			function createTask(){				
				leftVal = (screen.width - 640) / 2;
				topVal = (screen.height - 425) / 2;				
				assign=window.open('appTaskCreate.cfm?objectid=9&instanceid=#trim(quoteID)#','create','dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=640,height=425,left='+leftVal+',top='+topVal);
			};
						
			function launchDXPage(linkToGoTo){			
				var rand_no = Math.floor(Math.random()*101)
				var winName = 'loginwindow_' + rand_no;  			
				var wOpen;
			   	var sOptions;			   		
			   	sOptions = 'status=yes,hotkeys=no,menubar=no,scrollbars=yes,resizable=yes,toolbar=no,width=650,height=400,screenX=0,screenY=0,left=20,top=20';
			   	wOpen = window.open( '', winName, sOptions );
			   	wOpen.location = linkToGoTo;
			   	wOpen.focus();			   	
			    return wOpen;
			}		
			
			function keyUp(obj, diag){				
	    		
				if(obj.value.indexOf('?') > -1){
					launchDXPage('appDXCodeSearch.cfm?callerformname=#trim(formname)#&callerfieldName='+obj.name+'&callerdiagName='+diag);
					x = 'document.#trim(formName)#.' + obj.name + '.value = "";'
					eval(x);
					y = 'document.#trim(formName)#.' + diag + '.value = "";'
					eval(y);
	     		};			
				
			};
									
			// Utility function to fetch text from a URL
		    // A wrapper around the appropriate objects exposed by Netscape 6 or IE
		    function _wddxSelectListGetFromURL(strURL) {
		        var objHTTP, result;
		    
		        // For Netscape 6+ (or other browsers that support XMLHttpRequest)
		        if (window.XMLHttpRequest) {
		          objHTTP=new XMLHttpRequest();
		          objHTTP.open("GET", strURL, false);  
		          objHTTP.send(null);
		          result=objHTTP.responseText;
		    
		        // For IE browsers under Windows    
		        } else if (window.ActiveXObject) {
		          objHTTP=new ActiveXObject("Microsoft.XMLHTTP");
		          objHTTP.open("GET", strURL, false);  
		          objHTTP.send(null);
		          result=objHTTP.responseText;
		        }
		  
		        // Return result
		        return result;
		    }
	  			
		
			function getDXDescription(data1){						
						
				var url = "#trim(request.urlReconstructed)#/ws/wsDXDescription.cfc?method=wsDXDescription&Data1=" + escape(data1);				 
				var packet = _wddxSelectListGetFromURL(url);												
				var wddxDes = new WddxDeserializer;				
				var result = wddxDes.deserialize(packet);				
				
				if (result != null) {					
					return result;
				};
				else{					
					return false;
				}	
			};
						
			function dxOnBlur(obj, diag){				
				
				if(obj.value != '' && obj.value.indexOf('?') < 0){												
					desc = getDXDescription(obj.value);	
					if(desc != "false"){				
						x = 'document.#trim(formName)#.' + diag + '.value = desc';
						eval(x);
					}
					else{
						alert("The code you typed in (" + obj.value + ") cannot be found. Please check the code and try again.")
						obj.value = "";						
						x = 'document.#trim(formName)#.' + diag + '.value = ""';
						y = 'document.#trim(formName)#.' + obj.name + '.focus()';
						eval(x);
						eval(y);
					}				
	     		};		
			};
			
			function keyUpHCPC(obj, prod){				
	    		
				if(obj.value.indexOf('?') > -1){
					launchDXPage('appHCPCCodeSearch.cfm?callerformname=#trim(formname)#&callerfieldName='+obj.name+'&callerprodName='+prod);
					x = 'document.#trim(formName)#.' + obj.name + '.value = "";'
					eval(x);	
					y = 'document.#trim(formName)#.' + prod + '.value = "";'
					eval(y);									
	     		};				
			};
			
			function getHCPCDescription(data1){						
						
				var url = "#trim(request.urlReconstructed)#/ws/wsHCPCDescription.cfc?method=wsHCPCDescription&Data1=" + escape(data1);				 
				var packet = _wddxSelectListGetFromURL(url);												
				var wddxDes = new WddxDeserializer;				
				var result = wddxDes.deserialize(packet);				
				
				if (result != null) {					
					return result;
				};
				else{					
					return false;
				}	
			};
			
			function hcpcOnBlur(obj, prod){					
				if(obj.value != '' && obj.value.indexOf('?') < 0){												
					desc = getHCPCDescription(obj.value);	
					if(desc != "false"){				
						x = 'document.#trim(formName)#.' + prod + '.value = desc';
						eval(x);
					}
					else{
						alert("The code you typed in (" + obj.value + ") cannot be found. Please check the code and try again.")
						obj.value = "";						
						x = 'document.#trim(formName)#.' + prod + '.value = ""';
						y = 'document.#trim(formName)#.' + obj.name + '.focus()';
						eval(x);
						eval(y);
					}				
	     		};						
			};
											
			function createNote(){				
				if(tr_newQuoteNote.style.display == "none"){				
					tr_newQuoteNote.style.display = "inline";
					DHTMLEditor100.focus();
				}
				else{
					tr_newQuoteNote.style.display = "none";
				};				
			};
						
			function createViewNotes(){
				leftVal = (screen.width - 600) / 2;
				topVal = (screen.height - 350) / 2;
				claimnote=window.open('appQuoteNote.cfm?objectid=9&instanceid=#trim(quoteID)#', 'claimnote', 'dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=600,height=350,left='+leftVal+',top='+topVal); claimnote.focus(0);
			};			
						
			function checkBoxRadio(elementOB, elementName, checkValue){				
				/*if(checkValue != ''){	var cv = 'document.all.'+ checkValue +'.disabled'; alert(eval(cv)); }*/	
				var uncheckAll = true;
				if((checkValue != '' && eval('document.all.'+ checkValue +'.disabled') != true) || checkValue == ''){
												
					for(var i = 0; i < document.images.length; i++){				
						if(document.images[i].name == elementName){	
							if(document.images[i].name == elementName && document.images[i].alt == checkValue){
								array = eval('document.images['+ i +'].src.split("/")');					
								if(array[array.length-1] == 'Checkbox2.gif'){
									uncheckAll = false;
								};									
							};								
							if(elementOB != ""){
								//var thisEl = elementOB + '.style.backgroundColor = \'ffffcc\';';
								eval(thisEl);
							};
							document.images[i].src='images/Checkbox1.gif';
							altName = document.images[i].alt;
							temp = eval('document.all.'+ altName +'.value = ""');									
						};			
					};
					
					if(uncheckAll){
						for(var i = 0; i < document.images.length; i++){				
							if(document.images[i].name == elementName && document.images[i].alt == checkValue){					
								array = eval('document.images['+ i +'].src.split("/")');					
								if(array[array.length-1] == 'Checkbox1.gif'){				
									if(elementOB != ""){	
										var thisEl = elementOB + '.style.backgroundColor = \'ffffff\';';
										eval(thisEl);
									};	
									document.images[i].src='images/Checkbox2.gif';		
									temp = eval('document.all.'+ checkValue +'.value = 1');											
								};				
							};						
						};
					};						
				};
			};
			
			
			function validateForm(){	
				
				<cfif NOT Isnumeric(quoteID)>
					beforeSubmit();
				</cfif>	
				
				var msg  = "";
									
				if(document.#trim(formname)#.patientFNameTBox.value == "" || document.#trim(formname)#.patientLNameTBox.value == "" || document.#formName#.patientDOBMM.value == "" || document.#formName#.patientDOBDD.value == "" || document.#formName#.patientDOBYY.value == ""){
					msg = msg + "<li>You must provide at a minimum the patients <br>&nbsp;&nbsp;First Name,<br>&nbsp;&nbsp;Last Name,<br>&nbsp;&nbsp;and Date of Birth.</strong></li>";			
				};
						 							
				if(msg.length >= 1){
					sp_errorMsg.innerHTML = msg;
					tr_errorMsg.style.display = 'inline';
					location.hash=1;
					resetSubmitButtons();					
					return false;
				}
				else{						
					return true;
				};	
				
			};	
						
			function printQuote_JS(){						
				launchPrintPage('appQuotePrint.cfm?quoteid=#trim(quoteID)#');
			};	
			
			function launchPrintPage(linkToGoTo){			
				<!-------------------------------------------------------------------------------------->
				<!--- Issue with multiple windows for login is right here. while this script will    --->
				<!--- work fine it opens another window while the is two other windows open. when    --->
				<!--- you get back to this script all windows should probably close and only the     --->
				<!--- login window stay open. Quasi fixed 3/1/06 GC COPIED FROM appHeader.cfm        --->
				<!-------------------------------------------------------------------------------------->				
				var rand_no = Math.floor(Math.random()*101)
				var winName = 'loginwindow_' + rand_no;  			
				f_open_printwindow_max(linkToGoTo, winName);
			};
			
			function f_open_printwindow_max(aURL, aWinName){
			   var wOpen;
			   var sOptions;			   		
			   sOptions = 'dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=#trim(session.screenWidth)#,height=#trim(session.screenHeight)#,left=0,top=0';
			   wOpen = window.open( '', aWinName, sOptions );
			   wOpen.location = aURL;
			   wOpen.focus();			  
			   return wOpen;
			}
						
			function cancelIntake(){
				leftVal = (screen.width - 600) / 2;
				topVal = (screen.height - 350) / 2;
				claimcancel=window.open('appPatientQuoteClose.cfm?quoteid=#trim(quoteid)#&cancel=yes', 'claimcancel', 'dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=553,height=225,left='+leftVal+',top='+topVal); claimcancel.focus(0);
			};		
									
			function closeIntake(){
				leftVal = (screen.width - 600) / 2;
				topVal = (screen.height - 350) / 2;
				claimclose=window.open('appPatientQuoteClose.cfm?quoteid=#trim(quoteid)#', 'claimclose', 'dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=553,height=225,left='+leftVal+',top='+topVal); claimclose.focus(0);
			};						
					
			function checkQuoteExists(){				
			
				if(document.#trim(formname)#.patientFNameTBox.value != "" && document.#trim(formname)#.patientLNameTBox.value != "" && document.#trim(formname)#.patientDOBMM.value != "" && document.#trim(formname)#.patientDOBDD.value != "" && document.#trim(formname)#.patientDOBYY.value != ""){
					var exists = checkQuoteWS(document.#trim(formname)#.patientFNameTBox.value, document.#trim(formname)#.patientLNameTBox.value, document.#trim(formname)#.patientDOBMM.value, document.#trim(formname)#.patientDOBDD.value, document.#trim(formname)#.patientDOBYY.value);
					
					if(exists != "true"){
						var existsArray = exists.split("|");							
						if(existsArray.length == 2){
							if(existsArray[0] == "intake"){
								innerString = '<span style=cursor:hand onclick=location.href=\'appPatientIntakeSearch.cfm?id='+cleanNumericStringJS(document.#trim(formname)#.patientSSNTBox.value)+'\'>Please check the active intake(s) <font color=000000>[' + existsArray[1] + ']</font> before continuing.</span>';
							}
							else if(existsArray[0] == "quote"){
								spCheckQuoteExists.innerHTML = '<span style=cursor:hand onclick=location.href=\'appQuoteSearch.cfm?id='+cleanNumericStringJS(document.#trim(formname)#.patientSSNTBox.value)+'\'>Please check the active quote(s) <font color=000000>[' + existsArray[1] + ']</font> before continuing.</span>';
							};
						}
						else if(existsArray.length == 4){
							var innerString = '';
							if(existsArray[0] == "intake"){
								innerString = '<span style=cursor:hand onclick=location.href=\'appPatientIntakeSearch.cfm?id='+cleanNumericStringJS(document.#trim(formname)#.patientSSNTBox.value)+'\'>Please check the active intake(s) <font color=000000>[' + existsArray[1] + ']</font> before continuing.</span>';
							};
							if(existsArray[2] == "quote"){
								innerString = innerString + '<br><span style=cursor:hand onclick=location.href=\'appQuoteSearch.cfm?id='+cleanNumericStringJS(document.#trim(formname)#.patientSSNTBox.value)+'\'>Please check the active quote(s) <font color=000000>[' + existsArray[3] + ']</font> before continuing.</span>';
							};
							spCheckQuoteExists.innerHTML = innerString;						
						};	
						
					} 
					else {
						spCheckQuoteExists.innerHTML = '';
					};								
				};				
			};	
			
			function checkQuoteWS(fname, lname, month, day, year){				
				var url = "#trim(request.urlReconstructed)#/ws/wsEOB.cfc?method=wsCheckQuoteExists&Data1=#trim(session.ClientID)#&Data2=" + escape(fname) + "&Data3=" + escape(lname) + "&Data4=" + escape(month) + "&Data5=1" + "&Data6=" + escape(day) + "&Data7=" + escape(year);
				var packet = _wddxSelectListGetFromURL(url);												
				var wddxDes = new WddxDeserializer;				
				var result = wddxDes.deserialize(packet);				
				if (result != null) {					
					return result;
				}
				else{					
					return false;
				};	
			};				
						
		</script>
		
				
	</cfoutput>	

	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		<a name="1"></a>								
		<form name="#trim(formName)#" action="appQuoteCreate.cfm" method="post" onsubmit="return validateForm();">
				
			<input type="Hidden" name="printQuote" value="0">	
							
			<table width=750 border="0" cellpadding="0" cellspacing="0"> 				
				<tr>
					<td align="center" colspan="3">
						<cfif msg NEQ "">
							<cfoutput>
								<p><font face="Verdana" size="4" color="FF0000">#trim(msg)#</font></p>			
							</cfoutput>
						</cfif>
					</td>
				</tr>
				<tr>
				   	<td style="padding-top:8px; padding-bottom:8px;">
						&nbsp;&nbsp;<font color="c0c0c0" face="Arial" size="3"><strong>PATIENT&nbsp;QUOTE&nbsp;FORM<cfif IsNumeric(quoteID)>: #trim(quoteID)#</cfif></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfif NOT Active AND IsNumeric(quoteID)><strong>STATUS: COMPLETED</strong></cfif></font>
					</td>
				   
				    <cfif Isnumeric(quoteID)>
						<cfif ListLen(trim(printed)) GTE 1>
							<cfset printedBy = "">
							<cfloop list="#trim(printed)#" index="i">
								<cfset printedBy = printedBY & "<strong>Printed by:</strong><br>#ListGetAt(i, 4, '|')# on #ListGetAt(i, 1, '|')# #ListGetAt(i, 2, '|')#<br>">
							</cfloop>
						</cfif>
					</cfif>	
						
				    <td colspan="2" align="right" style="padding-top:10px;padding-right:15px;">
						<cfif Isnumeric(quoteID) AND Active>
							<cfif IsDefined("printedBy")>
								<span class="siteLabel" style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, '#trim(printedBy)#');" onmouseout="hideTip(this);"><u>Printed</u></span>&nbsp;&nbsp;
							</cfif>
							<input type="button" class="SiteSubmitbox" value="Print&nbsp;Quote" onclick="printQuote_JS();">
						</cfif>
						<cfif NOT Isnumeric(quoteID)>
							<input type="reset" class="SiteSubmitbox" value="Clear&nbsp;Form">
						</cfif>
						<cfif IsNumeric(quoteID) AND Active>
							<!---&nbsp;&nbsp;&nbsp;<input type="button" class="SiteSubmitBox" value="Promote To Intake" onclick="promoteToIntake();">--->
							&nbsp;&nbsp;&nbsp;<input type="button" class="SiteSubmitBox" value="Mark as Complete" onclick="closeIntake();">
						</cfif>
						<cfif Isnumeric(quoteID) AND Active>
							&nbsp;&nbsp;&nbsp;<input type="button" class="SiteSubmitBox" value="Cancel Quote" onclick="cancelIntake();">
						</cfif>
						&nbsp;&nbsp;&nbsp;<input type="button" class="SiteSubmitBox" value="Back" onclick="history.back()">
					</td>							   
				</tr>
							
				<tr>						
					<td colspan="2" style="padding-top:8px; padding-bottom:8px;">
						<cfif Isnumeric(quoteID)>
							<cfinvoke component="com.common.note" method="getNumberOfNotes" clientID="#trim(session.ClientID)#" objectID="9" instanceID="#trim(quoteID)#" returnvariable="numOfNotes">  
							<span class="siteLabel" style="cursor:hand" onclick="createViewNotes();">
								&nbsp;&nbsp;<u>View/Add&nbsp;Quote&nbsp;Notes</u> (#trim(numOfNotes)#)
							</span>							
						<cfelse>
							<span class="siteLabel" style="cursor:hand" onclick="createNote();">
								&nbsp;&nbsp;<u>Add&nbsp;Quote&nbsp;Note</u>
							</span>
						</cfif>
						<span class="siteLabel" style="cursor:hand;" onclick="createTask();">&nbsp;|&nbsp;<u>Create&nbsp;Task</u></span>
						&nbsp;&nbsp;<span id="last_auto" class="siteLabel"></span>
					</td>
					<td colspan="1" align="right" valign="top">
						&nbsp;											
					</td>
				</tr>
											
				<cfif NOT Isnumeric(quoteID)>
					<tr id="tr_newQuoteNote" style="display:none">
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
										<b>Please correct the entries highlighted in yellow.</b>
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
				
				<cfif IsNumeric(trim(hidden_UsersID))>
					<cfquery name="getUserName" datasource="#trim(request.datasource)#">
						SELECT FName, LName
						FROM view_useraccountparameters 
						WHERE UsersID = #trim(hidden_UsersID)#
					</cfquery>					
					<cfset empFName = trim(getUserName.FName)>
					<cfset empLName = trim(getUserName.LName)>
				<cfelse>
					<cfset empFName = trim(session.Entity.getFName())>
					<cfset empLName = trim(session.Entity.getLName())>
				</cfif>
				
				
				<tr>
					<input type="Hidden" name="quoteID" value="#trim(quoteID)#">
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
														
							<!---CUSTOMER INFORMATION--->
							<tr>
							    <td align="center" bgcolor="DCE3EB" colspan="6" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
									<font face="Arial" size="2"><strong>CUSTOMER&nbsp;INFORMATION</strong></font>
								</td>
							</tr>						
							<tr>
							    <td id="td_callerNameTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">
									&nbsp;CALLER&nbsp;FIRST:&nbsp;<input tabindex="1" type="Text" size="15" maxlength="45" name="callerFNameTBox" onblur="bgColorRequired(this);" onChange="capitalizeMe(this)" value="#trim(callerFNameTBox)#" class="siteTextBox">&nbsp;M:&nbsp;<input tabindex="2" type="Text" size="1" maxlength="1" name="callerMInitialTBox" onChange="capitalizeMe(this)" value="#trim(callerMInitialTBox)#" class="siteTextBox">&nbsp;LAST:&nbsp;&nbsp;<input tabindex="3" type="Text" size="15" maxlength="45" onChange="capitalizeMe(this)" name="callerLNameTBox" onblur="bgColorRequired(this);" value="#trim(callerLNameTBox)#" class="siteTextBox">
								</td>
							    <td id="td_callerPhoneTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;CALLER&nbsp;PHONE:&nbsp;<input tabindex="4" type="Text" size="35" maxlength="24" name="callerPhoneTBox" onblur="bgColorRequired(this);" value="#trim(callerPhoneTBox)#" class="siteTextBox" onkeyup="this.value=formatPhoneUS_JS(this.value);"></td>
							</tr>
							<tr>														   
							    <td id="td_patientNameTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">
									&nbsp;PATIENT&nbsp;FIRST:&nbsp;<input tabindex="5" type="Text" size="15" maxlength="45" name="patientFNameTBox" onblur="bgColorRequired(this);checkQuoteExists();" onChange="capitalizeMe(this)" value="#trim(patientFNameTBox)#" class="siteTextBox">&nbsp;M:&nbsp;<input tabindex="6" type="Text" size="1" maxlength="1" name="patientMInitialTBox" value="#trim(patientMInitialTBox)#" class="siteTextBox">&nbsp;LAST:&nbsp;<input tabindex="7" type="Text" size="15" maxlength="45" onChange="capitalizeMe(this)" name="patientLNameTBox" onblur="bgColorRequired(this);checkQuoteExists();" value="#trim(patientLNameTBox)#" class="siteTextBox">
								</td>
							    <td id="td_patientDOB" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
									&nbsp;DOB:&nbsp;&nbsp;<input tabindex="8" type="Text" name="patientDOBMM" onblur="bgColorRequired(this);checkQuoteExists();" value="#trim(patientDOBMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">&nbsp;/&nbsp;<input tabindex="9" type="Text" name="patientDOBDD" onblur="bgColorRequired(this);checkQuoteExists();" value="#trim(patientDOBDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">&nbsp;/&nbsp;<input tabindex="10" type="Text" name="patientDOBYY" onblur="bgColorRequired(this);checkQuoteExists();" value="#trim(patientDOBYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox">
								</td>
							</tr>								
							<tr>							  		
								<td id="td_patientAddressTBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;PATIENT&nbsp;ADDRESS:&nbsp;<input tabindex="11" type="Text" onChange="capitalizeMe(this)" name="patientAddressTBox" onblur="bgColorRequired(this);" value="#trim(patientAddressTBox)#" size="100" maxlength="75" class="siteTextBox"></td>
							</tr>
							<script language="JavaScript">
								function changeSelColor(temp){
									if(temp == ''){
										document.all.patientStateTBox.style.backgroundColor = 'ffffcc';
									}
									else{
										document.all.patientStateTBox.style.backgroundColor = 'ffffff';
									}	
								}								
							</script>		
							<tr>
							    <td id="td_patientCityTBox" colspan="1" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;CITY:&nbsp;<input tabindex="12" type="Text" size="25" maxlength="30" name="patientCityTBox" onblur="bgColorRequired(this);" onChange="capitalizeMe(this)" value="#trim(patientCityTBox)#" class="siteTextBox"></td>
							    <td id="td_patientStateTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;STATE:&nbsp;
								<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" active="1" returnvariable="getAllStates"><!---style="background-color: blue"--->
								<select tabindex="13" class="SiteSelectBox" name="patientStateTBox" onchange="changeSelColor(this.selectedIndex);">
									<option value="">
									<cfloop query="getAllStates">
										<option value="#StandardListItemID#" <cfif StandardListItemID EQ patientStateTBox>SELECTED</cfif>> #ItemNameDisplay#
									</cfloop>
								</select>
								<!---<input tabindex="13" type="Text" size="15" maxlength="15" name="patientStateTBox" onblur="bgColorRequired(this);" onChange="capitalizeMe(this)" value="#trim(patientStateTBox)#" class="siteTextBox">--->
								</td>
								
								<td id="td_patientZipTBox" colspan="1" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;ZIP:&nbsp;<input tabindex="14" type="Text" size="10" maxlength="10" name="patientZipTBox" onblur="bgColorRequired(this);" value="#trim(patientZipTBox)#" class="siteTextBox"></td>
								<td id="td_patientPhoneTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;PHONE&nbsp;##:&nbsp;<input tabindex="15" type="Text" size="25" maxlength="24" name="patientPhoneTBox" onblur="bgColorRequired(this);" value="#trim(patientPhoneTBox)#" class="siteTextBox" onkeyup="this.value=formatPhoneUS_JS(this.value);" onblur="if(this.value != '' && this.value == document.#formname#.alternateContactPhoneTBox.value){this.value = ''; alert('Patient\'s phone number cannot be the same as the Alternate Contacts phone number.'); this.focus(); };"></td>
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
							<input type="Hidden" name="OPTION_3a_CBox_PatientSexMale" value="">
							<input type="Hidden" name="OPTION_3a_CBox_PatientSexFemale" value="">	
							<tr>							  		
								<td nowrap id="td_patientSSNTBox" colspan="1" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;PATIENT&nbsp;SSN:&nbsp;<input tabindex="18" type="Text" size="13" maxlength="13" name="patientSSNTBox" onblur="bgColorRequired(this);" value="#trim(patientSSNTBox)#" class="siteTextBox" onkeyup="this.value=formatSSN_JS(this.value);"></td>
							    <td id="td_patientSex" style="background-color:ffffcc" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;Sex:&nbsp;&nbsp;<img src="images/Checkbox1.gif" tabindex="18" name="CheckUncheckPic_3a" alt="OPTION_3a_CBox_PatientSexMale" onkeypress="checkSex(0);" onclick="checkBoxRadio('td_patientSex', 'CheckUncheckPic_3a', 'OPTION_3a_CBox_PatientSexMale')">&nbsp;M&nbsp;&nbsp;<img src="images/Checkbox1.gif" tabindex="18" name="CheckUncheckPic_3a" alt="OPTION_3a_CBox_PatientSexFemale" onkeypress="checkSex(1);" onclick="checkBoxRadio('td_patientSex', 'CheckUncheckPic_3a', 'OPTION_3a_CBox_PatientSexFemale')">&nbsp;F</td>
								<td id="td_patientHeight" colspan="1" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;HEIGHT:&nbsp;&nbsp;<input tabindex="21" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" type="Text" name="patientHeightInches" onblur="bgColorRequired(this);" value="#trim(patientHeightInches)#" size="2" maxlength="2" class="siteTextBox">&nbsp;in&nbsp;inches.&nbsp;</td>
								<td id="td_patientWeightTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;WEIGHT:&nbsp;<input tabindex="24" type="Text" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="3" name="patientWeightTBox" onblur="bgColorRequired(this);" value="#trim(patientWeightTBox)#" class="siteTextBox">&nbsp;lbs.</td>
							</tr>				
							<script language="JavaScript">	
								if(#trim(OPTION_3a_CBox_PatientSexMale)# == 1){checkBoxRadio('td_patientSex', 'CheckUncheckPic_3a', 'OPTION_3a_CBox_PatientSexMale')}				
								else if(#trim(OPTION_3a_CBox_PatientSexFemale)# == 1){checkBoxRadio('td_patientSex', 'CheckUncheckPic_3a', 'OPTION_3a_CBox_PatientSexFemale')}
							</script>	
																				
							<tr>							  		
								<td id="td_alternateContactNameTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">
									&nbsp;ALTERNATE&nbsp;CONTACT:<input tabindex="25" type="Text" name="alternateContactFNameTBox" onblur="bgColorRequired(this);" onChange="capitalizeMe(this)" value="#trim(alternateContactFNameTBox)#" size="15" maxlength="40" class="siteTextBox">
									M:<input tabindex="26" type="Text" name="alternateContactMInitialTBox" value="#trim(alternateContactMInitialTBox)#" size="1" maxlength="1" class="siteTextBox">
									LAST:<input tabindex="27" type="Text" name="alternateContactLNameTBox" onblur="bgColorRequired(this);" onChange="capitalizeMe(this)" value="#trim(alternateContactLNameTBox)#" size="15" maxlength="40" class="siteTextBox">
								</td>
							    <td id="td_alternateContactRelationshipTBox" colspan="1" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 2px solid; border-left: 1px solid; border-color: 000000;">&nbsp;RELATIONSHIP:&nbsp;<input tabindex="28" type="Text" size="13" maxlength="13" name="alternateContactRelationshipTBox" onblur="bgColorRequired(this);" onChange="capitalizeMe(this)" value="#trim(alternateContactRelationshipTBox)#" class="siteTextBox"></td>
								<td nowrap id="td_alternateContactPhoneTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 0px solid; border-color: 000000;">
									H:<input tabindex="29" type="Text" size="15" maxlength="24" name="alternateContactPhoneTBox" onblur="bgColorRequired(this);" value="#trim(alternateContactPhoneTBox)#" class="siteTextBox" onkeyup="this.value=formatPhoneUS_JS(this.value);" onblur="if(this.value != '' && this.value == document.#formname#.patientPhoneTBox.value){this.value = ''; alert('Alternate contact phone number cannot be the same as the Patient\'s phone number.'); this.focus(); };">
									W:<input tabindex="30" type="Text" size="15" maxlength="24" name="alternateContactWorkPhoneTBox" value="#trim(alternateContactWorkPhoneTBox)#" class="siteTextBox" onkeyup="this.value=formatPhoneUS_JS(this.value);">
								</td>
							</tr>							
							
							<tr>								
								<td colspan="6" align="center">
									<table>
										<tr>
											<td>
												<span id="spCheckQuoteExists" class="TextWarning" style="font-size: medium;"></span>
											</td>
										</tr>
									</table>
								</td>
							</tr>	
							
							<tr>
							    <td align="center" colspan="6" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">&nbsp;</td>
							</tr>									
							
				
							
							<!---HCPC INFORMATION--->
							<tr>
							    <td bgcolor="DCE3EB" align="center" colspan="6" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">
									<table cellpadding="0" cellspacing="0" border="0" width="100%">
										<td align="center" class="siteLabel">
											<font face="Arial" size="2"><strong>HCPC&nbsp;Codes</strong></font>
										</td>
										<td align="right" nowrap class="siteLabel">&nbsp;</td>
									</table>									
								</td>
							</tr>
							<tr>
							    <td align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><font face="Arial" size="2"><strong>HCPC&nbsp;CODE</strong></font></td>
								<td align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><font face="Arial" size="2"><strong>QTY</strong></font></td>
								<td align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><font face="Arial" size="2"><strong>PRODUCT</strong></font></td>
								<td align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><font face="Arial" size="2"><strong>COST</strong></font></td>
								<td align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><font face="Arial" size="2"><strong>DX&nbsp;(Code)</strong></font></td>
								<td align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><font face="Arial" size="2"><strong>Diagnosis</strong></font></td>
							</tr>							
							 
							<tr id="tr_hcpc1" style="display: 'inline';">
							<td id="td_hcpcCode1TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="90" type="Text" size="7" maxlength="7" name="hcpcCode1TBox" value="#trim(hcpcCode1TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct1TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct1TBox')"></td>
							<td id="td_hcpcQty1TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="91" type="Text" size="3" maxlength="3" name="hcpcQty1TBox" value="#trim(hcpcQty1TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct1TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="92" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct1TBox" value="#trim(hcpcProduct1TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost1TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="93" type="Text" size="10" maxlength="10" name="hcpcCost1TBox" value="#trim(hcpcCost1TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX1TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="94" type="Text" size="7" maxlength="7" name="hcpcDX1TBox" value="#trim(hcpcDX1TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis1TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis1TBox')"></td>
							<td id="td_hcpcDiagnosis1TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="95" type="Text" size="25" maxlength="35" name="hcpcDiagnosis1TBox" value="#trim(hcpcDiagnosis1TBox)#" class="siteTextBox"></td>
							</tr>
							
							<tr id="tr_hcpc2" style="display: 'inline';">
							<td id="td_hcpcCode2TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="96" type="Text" size="7" maxlength="7" name="hcpcCode2TBox" value="#trim(hcpcCode2TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct2TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct2TBox')"></td>
							<td id="td_hcpcQty2TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="97" type="Text" size="3" maxlength="3" name="hcpcQty2TBox" value="#trim(hcpcQty2TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct2TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="98" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct2TBox" value="#trim(hcpcProduct2TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost2TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="99" type="Text" size="10" maxlength="10" name="hcpcCost2TBox" value="#trim(hcpcCost2TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX2TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="100" type="Text" size="7" maxlength="7" name="hcpcDX2TBox" value="#trim(hcpcDX2TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis2TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis2TBox')"></td>
							<td id="td_hcpcDiagnosis2TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="101" type="Text" size="25" maxlength="35" name="hcpcDiagnosis2TBox" value="#trim(hcpcDiagnosis2TBox)#" class="siteTextBox"></td>
							</tr>
							
							<tr id="tr_hcpc3" style="display: 'inline';">
							<td id="td_hcpcCode3TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="102" type="Text" size="7" maxlength="7" name="hcpcCode3TBox" value="#trim(hcpcCode3TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct3TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct3TBox')"></td>
							<td id="td_hcpcQty3TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="103" type="Text" size="3" maxlength="3" name="hcpcQty3TBox" value="#trim(hcpcQty3TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct3TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="104" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct3TBox" value="#trim(hcpcProduct3TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost3TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="105" type="Text" size="10" maxlength="10" name="hcpcCost3TBox" value="#trim(hcpcCost3TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX3TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="106" type="Text" size="7" maxlength="7" name="hcpcDX3TBox" value="#trim(hcpcDX3TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis3TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis3TBox')"></td>
							<td id="td_hcpcDiagnosis3TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="107" type="Text" size="25" maxlength="35" name="hcpcDiagnosis3TBox" value="#trim(hcpcDiagnosis3TBox)#" class="siteTextBox"></td>
							</tr>							
							 
							<tr id="tr_hcpc4" style="display: 'inline';">
							<td id="td_hcpcCode4TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="108" type="Text" size="7" maxlength="7" name="hcpcCode4TBox" value="#trim(hcpcCode4TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct4TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct4TBox')"></td>
							<td id="td_hcpcQty4TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="109" type="Text" size="3" maxlength="3" name="hcpcQty4TBox" value="#trim(hcpcQty4TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct4TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="110" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct4TBox" value="#trim(hcpcProduct4TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost4TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="111" type="Text" size="10" maxlength="10" name="hcpcCost4TBox" value="#trim(hcpcCost4TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX4TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="112" type="Text" size="7" maxlength="7" name="hcpcDX4TBox" value="#trim(hcpcDX4TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis4TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis4TBox')"></td>
							<td id="td_hcpcDiagnosis4TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="113" type="Text" size="25" maxlength="35" name="hcpcDiagnosis4TBox" value="#trim(hcpcDiagnosis4TBox)#" class="siteTextBox"></td>
							</tr>
							
							<tr id="tr_hcpc5" style="display: 'inline';">
							<td id="td_hcpcCode5TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="114" type="Text" size="7" maxlength="7" name="hcpcCode5TBox" value="#trim(hcpcCode5TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct5TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct5TBox')"></td>
							<td id="td_hcpcQty5TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="115" type="Text" size="3" maxlength="3" name="hcpcQty5TBox" value="#trim(hcpcQty5TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct5TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="116" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct5TBox" value="#trim(hcpcProduct5TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost5TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="117" type="Text" size="10" maxlength="10" name="hcpcCost5TBox" value="#trim(hcpcCost5TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX5TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="118" type="Text" size="7" maxlength="7" name="hcpcDX5TBox" value="#trim(hcpcDX5TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis5TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis5TBox')"></td>
							<td id="td_hcpcDiagnosis5TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="119" type="Text" size="25" maxlength="35" name="hcpcDiagnosis5TBox" value="#trim(hcpcDiagnosis5TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode6TBox) NEQ "" OR trim(hcpcQty6TBox) NEQ "" OR trim(hcpcProduct6TBox) NEQ "" OR trim(hcpcCost6TBox) NEQ "" OR trim(hcpcDX6TBox) NEQ "" OR trim(hcpcDiagnosis6TBox) NEQ "">
							<cfset visibility6 = "inline">
							<cfelse> 
							<cfset visibility6 = "none">
							</cfif> 
							<tr id="tr_hcpc6" style="display: '#trim(visibility6)#';">
							<td id="td_hcpcCode6TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="130" type="Text" size="7" maxlength="7" name="hcpcCode6TBox" value="#trim(hcpcCode6TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct6TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct6TBox')"></td>
							<td id="td_hcpcQty6TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="132" type="Text" size="3" maxlength="3" name="hcpcQty6TBox" value="#trim(hcpcQty6TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct6TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="133" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct6TBox" value="#trim(hcpcProduct6TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost6TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="134" type="Text" size="10" maxlength="10" name="hcpcCost6TBox" value="#trim(hcpcCost6TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX6TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="135" type="Text" size="7" maxlength="7" name="hcpcDX6TBox" value="#trim(hcpcDX6TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis6TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis6TBox')"></td>
							<td id="td_hcpcDiagnosis6TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="136" type="Text" size="25" maxlength="35" name="hcpcDiagnosis6TBox" value="#trim(hcpcDiagnosis6TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode7TBox) NEQ "" OR trim(hcpcQty7TBox) NEQ "" OR trim(hcpcProduct7TBox) NEQ "" OR trim(hcpcCost7TBox) NEQ "" OR trim(hcpcDX7TBox) NEQ "" OR trim(hcpcDiagnosis7TBox) NEQ "">
							<cfset visibility7 = "inline">
							<cfelse> 
							<cfset visibility7 = "none">
							</cfif> 
							<tr id="tr_hcpc7" style="display: '#trim(visibility7)#';">
							<td id="td_hcpcCode7TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="137" type="Text" size="7" maxlength="7" name="hcpcCode7TBox" value="#trim(hcpcCode7TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct7TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct7TBox')"></td>
							<td id="td_hcpcQty7TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="138" type="Text" size="3" maxlength="3" name="hcpcQty7TBox" value="#trim(hcpcQty7TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct7TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="139" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct7TBox" value="#trim(hcpcProduct7TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost7TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="140" type="Text" size="10" maxlength="10" name="hcpcCost7TBox" value="#trim(hcpcCost7TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX7TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="141" type="Text" size="7" maxlength="7" name="hcpcDX7TBox" value="#trim(hcpcDX7TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis7TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis7TBox')"></td>
							<td id="td_hcpcDiagnosis7TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="142" type="Text" size="25" maxlength="35" name="hcpcDiagnosis7TBox" value="#trim(hcpcDiagnosis7TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode8TBox) NEQ "" OR trim(hcpcQty8TBox) NEQ "" OR trim(hcpcProduct8TBox) NEQ "" OR trim(hcpcCost8TBox) NEQ "" OR trim(hcpcDX8TBox) NEQ "" OR trim(hcpcDiagnosis8TBox) NEQ "">
							<cfset visibility8 = "inline">
							<cfelse> 
							<cfset visibility8 = "none">
							</cfif> 
							<tr id="tr_hcpc8" style="display: '#trim(visibility8)#';">
							<td id="td_hcpcCode8TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="143" type="Text" size="7" maxlength="7" name="hcpcCode8TBox" value="#trim(hcpcCode8TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct8TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct8TBox')"></td>
							<td id="td_hcpcQty8TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="144" type="Text" size="3" maxlength="3" name="hcpcQty8TBox" value="#trim(hcpcQty8TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct8TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="145" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct8TBox" value="#trim(hcpcProduct8TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost8TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="146" type="Text" size="10" maxlength="10" name="hcpcCost8TBox" value="#trim(hcpcCost8TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX8TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="147" type="Text" size="7" maxlength="7" name="hcpcDX8TBox" value="#trim(hcpcDX8TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis8TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis8TBox')"></td>
							<td id="td_hcpcDiagnosis8TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="148" type="Text" size="25" maxlength="35" name="hcpcDiagnosis8TBox" value="#trim(hcpcDiagnosis8TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode9TBox) NEQ "" OR trim(hcpcQty9TBox) NEQ "" OR trim(hcpcProduct9TBox) NEQ "" OR trim(hcpcCost9TBox) NEQ "" OR trim(hcpcDX9TBox) NEQ "" OR trim(hcpcDiagnosis9TBox) NEQ "">
							<cfset visibility9 = "inline">
							<cfelse> 
							<cfset visibility9 = "none">
							</cfif> 
							<tr id="tr_hcpc9" style="display: '#trim(visibility9)#';">
							<td id="td_hcpcCode9TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="149" type="Text" size="7" maxlength="7" name="hcpcCode9TBox" value="#trim(hcpcCode9TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct9TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct9TBox')"></td>
							<td id="td_hcpcQty9TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="150" type="Text" size="3" maxlength="3" name="hcpcQty9TBox" value="#trim(hcpcQty9TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct9TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="151" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct9TBox" value="#trim(hcpcProduct9TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost9TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="152" type="Text" size="10" maxlength="10" name="hcpcCost9TBox" value="#trim(hcpcCost9TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX9TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="153" type="Text" size="7" maxlength="7" name="hcpcDX9TBox" value="#trim(hcpcDX9TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis9TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis9TBox')"></td>
							<td id="td_hcpcDiagnosis9TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="154" type="Text" size="25" maxlength="35" name="hcpcDiagnosis9TBox" value="#trim(hcpcDiagnosis9TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode10TBox) NEQ "" OR trim(hcpcQty10TBox) NEQ "" OR trim(hcpcProduct10TBox) NEQ "" OR trim(hcpcCost10TBox) NEQ "" OR trim(hcpcDX10TBox) NEQ "" OR trim(hcpcDiagnosis10TBox) NEQ "">
							<cfset visibility10 = "inline">
							<cfelse> 
							<cfset visibility10 = "none">
							</cfif> 
							<tr id="tr_hcpc10" style="display: '#trim(visibility10)#';">
							<td id="td_hcpcCode10TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="155" type="Text" size="7" maxlength="7" name="hcpcCode10TBox" value="#trim(hcpcCode10TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct10TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct10TBox')"></td>
							<td id="td_hcpcQty10TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="156" type="Text" size="3" maxlength="3" name="hcpcQty10TBox" value="#trim(hcpcQty10TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct10TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="157" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct10TBox" value="#trim(hcpcProduct10TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost10TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="158" type="Text" size="10" maxlength="10" name="hcpcCost10TBox" value="#trim(hcpcCost10TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX10TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="159" type="Text" size="7" maxlength="7" name="hcpcDX10TBox" value="#trim(hcpcDX10TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis10TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis10TBox')"></td>
							<td id="td_hcpcDiagnosis10TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="160" type="Text" size="25" maxlength="35" name="hcpcDiagnosis10TBox" value="#trim(hcpcDiagnosis10TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode11TBox) NEQ "" OR trim(hcpcQty11TBox) NEQ "" OR trim(hcpcProduct11TBox) NEQ "" OR trim(hcpcCost11TBox) NEQ "" OR trim(hcpcDX11TBox) NEQ "" OR trim(hcpcDiagnosis11TBox) NEQ "">
							<cfset visibility11 = "inline">
							<cfelse> 
							<cfset visibility11 = "none">
							</cfif> 
							<tr id="tr_hcpc11" style="display: '#trim(visibility11)#';">
							<td id="td_hcpcCode11TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="161" type="Text" size="7" maxlength="7" name="hcpcCode11TBox" value="#trim(hcpcCode11TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct11TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct11TBox')"></td>
							<td id="td_hcpcQty11TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="162" type="Text" size="3" maxlength="3" name="hcpcQty11TBox" value="#trim(hcpcQty11TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct11TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="163" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct11TBox" value="#trim(hcpcProduct11TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost11TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="164" type="Text" size="10" maxlength="10" name="hcpcCost11TBox" value="#trim(hcpcCost11TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX11TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="165" type="Text" size="7" maxlength="7" name="hcpcDX11TBox" value="#trim(hcpcDX11TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis11TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis11TBox')"></td>
							<td id="td_hcpcDiagnosis11TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="166" type="Text" size="25" maxlength="35" name="hcpcDiagnosis11TBox" value="#trim(hcpcDiagnosis11TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode12TBox) NEQ "" OR trim(hcpcQty12TBox) NEQ "" OR trim(hcpcProduct12TBox) NEQ "" OR trim(hcpcCost12TBox) NEQ "" OR trim(hcpcDX12TBox) NEQ "" OR trim(hcpcDiagnosis12TBox) NEQ "">
							<cfset visibility12 = "inline">
							<cfelse> 
							<cfset visibility12 = "none">
							</cfif> 
							<tr id="tr_hcpc12" style="display: '#trim(visibility12)#';">
							<td id="td_hcpcCode12TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="167" type="Text" size="7" maxlength="7" name="hcpcCode12TBox" value="#trim(hcpcCode12TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct12TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct12TBox')"></td>
							<td id="td_hcpcQty12TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="168" type="Text" size="3" maxlength="3" name="hcpcQty12TBox" value="#trim(hcpcQty12TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct12TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="169" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct12TBox" value="#trim(hcpcProduct12TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost12TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="170" type="Text" size="10" maxlength="10" name="hcpcCost12TBox" value="#trim(hcpcCost12TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX12TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="171" type="Text" size="7" maxlength="7" name="hcpcDX12TBox" value="#trim(hcpcDX12TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis12TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis12TBox')"></td>
							<td id="td_hcpcDiagnosis12TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="172" type="Text" size="25" maxlength="35" name="hcpcDiagnosis12TBox" value="#trim(hcpcDiagnosis12TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode13TBox) NEQ "" OR trim(hcpcQty13TBox) NEQ "" OR trim(hcpcProduct13TBox) NEQ "" OR trim(hcpcCost13TBox) NEQ "" OR trim(hcpcDX13TBox) NEQ "" OR trim(hcpcDiagnosis13TBox) NEQ "">
							<cfset visibility13 = "inline">
							<cfelse> 
							<cfset visibility13 = "none">
							</cfif> 
							<tr id="tr_hcpc13" style="display: '#trim(visibility13)#';">
							<td id="td_hcpcCode13TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="173" type="Text" size="7" maxlength="7" name="hcpcCode13TBox" value="#trim(hcpcCode13TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct13TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct13TBox')"></td>
							<td id="td_hcpcQty13TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="174" type="Text" size="3" maxlength="3" name="hcpcQty13TBox" value="#trim(hcpcQty13TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct13TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="175" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct13TBox" value="#trim(hcpcProduct13TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost13TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="176" type="Text" size="10" maxlength="10" name="hcpcCost13TBox" value="#trim(hcpcCost13TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX13TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="177" type="Text" size="7" maxlength="7" name="hcpcDX13TBox" value="#trim(hcpcDX13TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis13TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis13TBox')"></td>
							<td id="td_hcpcDiagnosis13TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="178" type="Text" size="25" maxlength="35" name="hcpcDiagnosis13TBox" value="#trim(hcpcDiagnosis13TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode14TBox) NEQ "" OR trim(hcpcQty14TBox) NEQ "" OR trim(hcpcProduct14TBox) NEQ "" OR trim(hcpcCost14TBox) NEQ "" OR trim(hcpcDX14TBox) NEQ "" OR trim(hcpcDiagnosis14TBox) NEQ "">
							<cfset visibility14 = "inline">
							<cfelse> 
							<cfset visibility14 = "none">
							</cfif> 
							<tr id="tr_hcpc14" style="display: '#trim(visibility14)#';">
							<td id="td_hcpcCode14TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="179" type="Text" size="7" maxlength="7" name="hcpcCode14TBox" value="#trim(hcpcCode14TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct14TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct14TBox')"></td>
							<td id="td_hcpcQty14TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="180" type="Text" size="3" maxlength="3" name="hcpcQty14TBox" value="#trim(hcpcQty14TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct14TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="181" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct14TBox" value="#trim(hcpcProduct14TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost14TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="182" type="Text" size="10" maxlength="10" name="hcpcCost14TBox" value="#trim(hcpcCost14TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX14TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="183" type="Text" size="7" maxlength="7" name="hcpcDX14TBox" value="#trim(hcpcDX14TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis14TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis14TBox')"></td>
							<td id="td_hcpcDiagnosis14TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="184" type="Text" size="25" maxlength="35" name="hcpcDiagnosis14TBox" value="#trim(hcpcDiagnosis14TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode15TBox) NEQ "" OR trim(hcpcQty15TBox) NEQ "" OR trim(hcpcProduct15TBox) NEQ "" OR trim(hcpcCost15TBox) NEQ "" OR trim(hcpcDX15TBox) NEQ "" OR trim(hcpcDiagnosis15TBox) NEQ "">
							<cfset visibility15 = "inline">
							<cfelse> 
							<cfset visibility15 = "none">
							</cfif> 
							<tr id="tr_hcpc15" style="display: '#trim(visibility15)#';">
							<td id="td_hcpcCode15TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="185" type="Text" size="7" maxlength="7" name="hcpcCode15TBox" value="#trim(hcpcCode15TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct15TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct15TBox')"></td>
							<td id="td_hcpcQty15TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="186" type="Text" size="3" maxlength="3" name="hcpcQty15TBox" value="#trim(hcpcQty15TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct15TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="187" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct15TBox" value="#trim(hcpcProduct15TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost15TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="188" type="Text" size="10" maxlength="10" name="hcpcCost15TBox" value="#trim(hcpcCost15TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX15TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="189" type="Text" size="7" maxlength="7" name="hcpcDX15TBox" value="#trim(hcpcDX15TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis15TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis15TBox')"></td>
							<td id="td_hcpcDiagnosis15TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="190" type="Text" size="25" maxlength="35" name="hcpcDiagnosis15TBox" value="#trim(hcpcDiagnosis15TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode16TBox) NEQ "" OR trim(hcpcQty16TBox) NEQ "" OR trim(hcpcProduct16TBox) NEQ "" OR trim(hcpcCost16TBox) NEQ "" OR trim(hcpcDX16TBox) NEQ "" OR trim(hcpcDiagnosis16TBox) NEQ "">
							<cfset visibility16 = "inline">
							<cfelse> 
							<cfset visibility16 = "none">
							</cfif> 
							<tr id="tr_hcpc16" style="display: '#trim(visibility16)#';">
							<td id="td_hcpcCode16TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="191" type="Text" size="7" maxlength="7" name="hcpcCode16TBox" value="#trim(hcpcCode16TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct16TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct16TBox')"></td>
							<td id="td_hcpcQty16TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="192" type="Text" size="3" maxlength="3" name="hcpcQty16TBox" value="#trim(hcpcQty16TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct16TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="193" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct16TBox" value="#trim(hcpcProduct16TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost16TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="194" type="Text" size="10" maxlength="10" name="hcpcCost16TBox" value="#trim(hcpcCost16TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX16TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="195" type="Text" size="7" maxlength="7" name="hcpcDX16TBox" value="#trim(hcpcDX16TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis16TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis16TBox')"></td>
							<td id="td_hcpcDiagnosis16TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="196" type="Text" size="25" maxlength="35" name="hcpcDiagnosis16TBox" value="#trim(hcpcDiagnosis16TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode17TBox) NEQ "" OR trim(hcpcQty17TBox) NEQ "" OR trim(hcpcProduct17TBox) NEQ "" OR trim(hcpcCost17TBox) NEQ "" OR trim(hcpcDX17TBox) NEQ "" OR trim(hcpcDiagnosis17TBox) NEQ "">
							<cfset visibility17 = "inline">
							<cfelse> 
							<cfset visibility17 = "none">
							</cfif> 
							<tr id="tr_hcpc17" style="display: '#trim(visibility17)#';">
							<td id="td_hcpcCode17TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="197" type="Text" size="7" maxlength="7" name="hcpcCode17TBox" value="#trim(hcpcCode17TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct17TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct17TBox')"></td>
							<td id="td_hcpcQty17TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="198" type="Text" size="3" maxlength="3" name="hcpcQty17TBox" value="#trim(hcpcQty17TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct17TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="199" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct17TBox" value="#trim(hcpcProduct17TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost17TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="200" type="Text" size="10" maxlength="10" name="hcpcCost17TBox" value="#trim(hcpcCost17TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX17TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="201" type="Text" size="7" maxlength="7" name="hcpcDX17TBox" value="#trim(hcpcDX17TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis17TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis17TBox')"></td>
							<td id="td_hcpcDiagnosis17TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="202" type="Text" size="25" maxlength="35" name="hcpcDiagnosis17TBox" value="#trim(hcpcDiagnosis17TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode18TBox) NEQ "" OR trim(hcpcQty18TBox) NEQ "" OR trim(hcpcProduct18TBox) NEQ "" OR trim(hcpcCost18TBox) NEQ "" OR trim(hcpcDX18TBox) NEQ "" OR trim(hcpcDiagnosis18TBox) NEQ "">
							<cfset visibility18 = "inline">
							<cfelse> 
							<cfset visibility18 = "none">
							</cfif> 
							<tr id="tr_hcpc18" style="display: '#trim(visibility18)#';">
							<td id="td_hcpcCode18TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="203" type="Text" size="7" maxlength="7" name="hcpcCode18TBox" value="#trim(hcpcCode18TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct18TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct18TBox')"></td>
							<td id="td_hcpcQty18TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="204" type="Text" size="3" maxlength="3" name="hcpcQty18TBox" value="#trim(hcpcQty18TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct18TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="205" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct18TBox" value="#trim(hcpcProduct18TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost18TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="206" type="Text" size="10" maxlength="10" name="hcpcCost18TBox" value="#trim(hcpcCost18TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX18TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="207" type="Text" size="7" maxlength="7" name="hcpcDX18TBox" value="#trim(hcpcDX18TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis18TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis18TBox')"></td>
							<td id="td_hcpcDiagnosis18TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="208" type="Text" size="25" maxlength="35" name="hcpcDiagnosis18TBox" value="#trim(hcpcDiagnosis18TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode19TBox) NEQ "" OR trim(hcpcQty19TBox) NEQ "" OR trim(hcpcProduct19TBox) NEQ "" OR trim(hcpcCost19TBox) NEQ "" OR trim(hcpcDX19TBox) NEQ "" OR trim(hcpcDiagnosis19TBox) NEQ "">
							<cfset visibility19 = "inline">
							<cfelse> 
							<cfset visibility19 = "none">
							</cfif> 
							<tr id="tr_hcpc19" style="display: '#trim(visibility19)#';">
							<td id="td_hcpcCode19TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="209" type="Text" size="7" maxlength="7" name="hcpcCode19TBox" value="#trim(hcpcCode19TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct19TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct19TBox')"></td>
							<td id="td_hcpcQty19TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="210" type="Text" size="3" maxlength="3" name="hcpcQty19TBox" value="#trim(hcpcQty19TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct19TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="211" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct19TBox" value="#trim(hcpcProduct19TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost19TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="212" type="Text" size="10" maxlength="10" name="hcpcCost19TBox" value="#trim(hcpcCost19TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX19TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="213" type="Text" size="7" maxlength="7" name="hcpcDX19TBox" value="#trim(hcpcDX19TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis19TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis19TBox')"></td>
							<td id="td_hcpcDiagnosis19TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="214" type="Text" size="25" maxlength="35" name="hcpcDiagnosis19TBox" value="#trim(hcpcDiagnosis19TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode20TBox) NEQ "" OR trim(hcpcQty20TBox) NEQ "" OR trim(hcpcProduct20TBox) NEQ "" OR trim(hcpcCost20TBox) NEQ "" OR trim(hcpcDX20TBox) NEQ "" OR trim(hcpcDiagnosis20TBox) NEQ "">
							<cfset visibility20 = "inline">
							<cfelse> 
							<cfset visibility20 = "none">
							</cfif> 
							<tr id="tr_hcpc20" style="display: '#trim(visibility20)#';">
							<td id="td_hcpcCode20TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="215" type="Text" size="7" maxlength="7" name="hcpcCode20TBox" value="#trim(hcpcCode20TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct20TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct20TBox')"></td>
							<td id="td_hcpcQty20TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="216" type="Text" size="3" maxlength="3" name="hcpcQty20TBox" value="#trim(hcpcQty20TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct20TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="217" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct20TBox" value="#trim(hcpcProduct20TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost20TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="218" type="Text" size="10" maxlength="10" name="hcpcCost20TBox" value="#trim(hcpcCost20TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX20TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="219" type="Text" size="7" maxlength="7" name="hcpcDX20TBox" value="#trim(hcpcDX20TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis20TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis20TBox')"></td>
							<td id="td_hcpcDiagnosis20TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="220" type="Text" size="25" maxlength="35" name="hcpcDiagnosis20TBox" value="#trim(hcpcDiagnosis20TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode21TBox) NEQ "" OR trim(hcpcQty21TBox) NEQ "" OR trim(hcpcProduct21TBox) NEQ "" OR trim(hcpcCost21TBox) NEQ "" OR trim(hcpcDX21TBox) NEQ "" OR trim(hcpcDiagnosis21TBox) NEQ "">
							<cfset visibility21 = "inline">
							<cfelse> 
							<cfset visibility21 = "none">
							</cfif> 
							<tr id="tr_hcpc21" style="display: '#trim(visibility21)#';">
							<td id="td_hcpcCode21TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="221" type="Text" size="7" maxlength="7" name="hcpcCode21TBox" value="#trim(hcpcCode21TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct21TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct21TBox')"></td>
							<td id="td_hcpcQty21TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="222" type="Text" size="3" maxlength="3" name="hcpcQty21TBox" value="#trim(hcpcQty21TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct21TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="223" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct21TBox" value="#trim(hcpcProduct21TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost21TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="224" type="Text" size="10" maxlength="10" name="hcpcCost21TBox" value="#trim(hcpcCost21TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX21TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="225" type="Text" size="7" maxlength="7" name="hcpcDX21TBox" value="#trim(hcpcDX21TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis21TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis21TBox')"></td>
							<td id="td_hcpcDiagnosis21TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="226" type="Text" size="25" maxlength="35" name="hcpcDiagnosis21TBox" value="#trim(hcpcDiagnosis21TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode22TBox) NEQ "" OR trim(hcpcQty22TBox) NEQ "" OR trim(hcpcProduct22TBox) NEQ "" OR trim(hcpcCost22TBox) NEQ "" OR trim(hcpcDX22TBox) NEQ "" OR trim(hcpcDiagnosis22TBox) NEQ "">
							<cfset visibility22 = "inline">
							<cfelse> 
							<cfset visibility22 = "none">
							</cfif> 
							<tr id="tr_hcpc22" style="display: '#trim(visibility22)#';">
							<td id="td_hcpcCode22TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="227" type="Text" size="7" maxlength="7" name="hcpcCode22TBox" value="#trim(hcpcCode22TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct22TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct22TBox')"></td>
							<td id="td_hcpcQty22TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="228" type="Text" size="3" maxlength="3" name="hcpcQty22TBox" value="#trim(hcpcQty22TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct22TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="229" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct22TBox" value="#trim(hcpcProduct22TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost22TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="230" type="Text" size="10" maxlength="10" name="hcpcCost22TBox" value="#trim(hcpcCost22TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX22TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="231" type="Text" size="7" maxlength="7" name="hcpcDX22TBox" value="#trim(hcpcDX22TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis22TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis22TBox')"></td>
							<td id="td_hcpcDiagnosis22TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="232" type="Text" size="25" maxlength="35" name="hcpcDiagnosis22TBox" value="#trim(hcpcDiagnosis22TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode23TBox) NEQ "" OR trim(hcpcQty23TBox) NEQ "" OR trim(hcpcProduct23TBox) NEQ "" OR trim(hcpcCost23TBox) NEQ "" OR trim(hcpcDX23TBox) NEQ "" OR trim(hcpcDiagnosis23TBox) NEQ "">
							<cfset visibility23 = "inline">
							<cfelse> 
							<cfset visibility23 = "none">
							</cfif> 
							<tr id="tr_hcpc23" style="display: '#trim(visibility23)#';">
							<td id="td_hcpcCode23TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="233" type="Text" size="7" maxlength="7" name="hcpcCode23TBox" value="#trim(hcpcCode23TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct23TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct23TBox')"></td>
							<td id="td_hcpcQty23TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="234" type="Text" size="3" maxlength="3" name="hcpcQty23TBox" value="#trim(hcpcQty23TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct23TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="235" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct23TBox" value="#trim(hcpcProduct23TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost23TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="236" type="Text" size="10" maxlength="10" name="hcpcCost23TBox" value="#trim(hcpcCost23TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX23TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="237" type="Text" size="7" maxlength="7" name="hcpcDX23TBox" value="#trim(hcpcDX23TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis23TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis23TBox')"></td>
							<td id="td_hcpcDiagnosis23TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="238" type="Text" size="25" maxlength="35" name="hcpcDiagnosis23TBox" value="#trim(hcpcDiagnosis23TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode24TBox) NEQ "" OR trim(hcpcQty24TBox) NEQ "" OR trim(hcpcProduct24TBox) NEQ "" OR trim(hcpcCost24TBox) NEQ "" OR trim(hcpcDX24TBox) NEQ "" OR trim(hcpcDiagnosis24TBox) NEQ "">
							<cfset visibility24 = "inline">
							<cfelse> 
							<cfset visibility24 = "none">
							</cfif> 
							<tr id="tr_hcpc24" style="display: '#trim(visibility24)#';">
							<td id="td_hcpcCode24TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="239" type="Text" size="7" maxlength="7" name="hcpcCode24TBox" value="#trim(hcpcCode24TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct24TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct24TBox')"></td>
							<td id="td_hcpcQty24TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="240" type="Text" size="3" maxlength="3" name="hcpcQty24TBox" value="#trim(hcpcQty24TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct24TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="241" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct24TBox" value="#trim(hcpcProduct24TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost24TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="242" type="Text" size="10" maxlength="10" name="hcpcCost24TBox" value="#trim(hcpcCost24TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX24TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="243" type="Text" size="7" maxlength="7" name="hcpcDX24TBox" value="#trim(hcpcDX24TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis24TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis24TBox')"></td>
							<td id="td_hcpcDiagnosis24TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="244" type="Text" size="25" maxlength="35" name="hcpcDiagnosis24TBox" value="#trim(hcpcDiagnosis24TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode25TBox) NEQ "" OR trim(hcpcQty25TBox) NEQ "" OR trim(hcpcProduct25TBox) NEQ "" OR trim(hcpcCost25TBox) NEQ "" OR trim(hcpcDX25TBox) NEQ "" OR trim(hcpcDiagnosis25TBox) NEQ "">
							<cfset visibility25 = "inline">
							<cfelse> 
							<cfset visibility25 = "none">
							</cfif> 
							<tr id="tr_hcpc25" style="display: '#trim(visibility25)#';">
							<td id="td_hcpcCode25TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="245" type="Text" size="7" maxlength="7" name="hcpcCode25TBox" value="#trim(hcpcCode25TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct25TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct25TBox')"></td>
							<td id="td_hcpcQty25TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="246" type="Text" size="3" maxlength="3" name="hcpcQty25TBox" value="#trim(hcpcQty25TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct25TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="247" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct25TBox" value="#trim(hcpcProduct25TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost25TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="248" type="Text" size="10" maxlength="10" name="hcpcCost25TBox" value="#trim(hcpcCost25TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX25TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="249" type="Text" size="7" maxlength="7" name="hcpcDX25TBox" value="#trim(hcpcDX25TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis25TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis25TBox')"></td>
							<td id="td_hcpcDiagnosis25TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="250" type="Text" size="25" maxlength="35" name="hcpcDiagnosis25TBox" value="#trim(hcpcDiagnosis25TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode26TBox) NEQ "" OR trim(hcpcQty26TBox) NEQ "" OR trim(hcpcProduct26TBox) NEQ "" OR trim(hcpcCost26TBox) NEQ "" OR trim(hcpcDX26TBox) NEQ "" OR trim(hcpcDiagnosis26TBox) NEQ "">
							<cfset visibility26 = "inline">
							<cfelse> 
							<cfset visibility26 = "none">
							</cfif> 
							<tr id="tr_hcpc26" style="display: '#trim(visibility26)#';">
							<td id="td_hcpcCode26TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="250" type="Text" size="7" maxlength="7" name="hcpcCode26TBox" value="#trim(hcpcCode26TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct26TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct26TBox')"></td>
							<td id="td_hcpcQty26TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="251" type="Text" size="3" maxlength="3" name="hcpcQty26TBox" value="#trim(hcpcQty26TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct26TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="252" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct26TBox" value="#trim(hcpcProduct26TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost26TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="253" type="Text" size="10" maxlength="10" name="hcpcCost26TBox" value="#trim(hcpcCost26TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX26TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="254" type="Text" size="7" maxlength="7" name="hcpcDX26TBox" value="#trim(hcpcDX26TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis26TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis26TBox')"></td>
							<td id="td_hcpcDiagnosis26TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="255" type="Text" size="25" maxlength="35" name="hcpcDiagnosis26TBox" value="#trim(hcpcDiagnosis26TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode27TBox) NEQ "" OR trim(hcpcQty27TBox) NEQ "" OR trim(hcpcProduct27TBox) NEQ "" OR trim(hcpcCost27TBox) NEQ "" OR trim(hcpcDX27TBox) NEQ "" OR trim(hcpcDiagnosis27TBox) NEQ "">
							<cfset visibility27 = "inline">
							<cfelse> 
							<cfset visibility27 = "none">
							</cfif> 
							<tr id="tr_hcpc27" style="display: '#trim(visibility27)#';">
							<td id="td_hcpcCode27TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="256" type="Text" size="7" maxlength="7" name="hcpcCode27TBox" value="#trim(hcpcCode27TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct27TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct27TBox')"></td>
							<td id="td_hcpcQty27TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="257" type="Text" size="3" maxlength="3" name="hcpcQty27TBox" value="#trim(hcpcQty27TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct27TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="258" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct27TBox" value="#trim(hcpcProduct27TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost27TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="259" type="Text" size="10" maxlength="10" name="hcpcCost27TBox" value="#trim(hcpcCost27TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX27TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="260" type="Text" size="7" maxlength="7" name="hcpcDX27TBox" value="#trim(hcpcDX27TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis27TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis27TBox')"></td>
							<td id="td_hcpcDiagnosis27TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="261" type="Text" size="25" maxlength="35" name="hcpcDiagnosis27TBox" value="#trim(hcpcDiagnosis27TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode28TBox) NEQ "" OR trim(hcpcQty28TBox) NEQ "" OR trim(hcpcProduct28TBox) NEQ "" OR trim(hcpcCost28TBox) NEQ "" OR trim(hcpcDX28TBox) NEQ "" OR trim(hcpcDiagnosis28TBox) NEQ "">
							<cfset visibility28 = "inline">
							<cfelse> 
							<cfset visibility28 = "none">
							</cfif> 
							<tr id="tr_hcpc28" style="display: '#trim(visibility28)#';">
							<td id="td_hcpcCode28TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="262" type="Text" size="7" maxlength="7" name="hcpcCode28TBox" value="#trim(hcpcCode28TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct28TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct28TBox')"></td>
							<td id="td_hcpcQty28TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="263" type="Text" size="3" maxlength="3" name="hcpcQty28TBox" value="#trim(hcpcQty28TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct28TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="264" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct28TBox" value="#trim(hcpcProduct28TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost28TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="265" type="Text" size="10" maxlength="10" name="hcpcCost28TBox" value="#trim(hcpcCost28TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX28TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="266" type="Text" size="7" maxlength="7" name="hcpcDX28TBox" value="#trim(hcpcDX28TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis28TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis28TBox')"></td>
							<td id="td_hcpcDiagnosis28TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="267" type="Text" size="25" maxlength="35" name="hcpcDiagnosis28TBox" value="#trim(hcpcDiagnosis28TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode29TBox) NEQ "" OR trim(hcpcQty29TBox) NEQ "" OR trim(hcpcProduct29TBox) NEQ "" OR trim(hcpcCost29TBox) NEQ "" OR trim(hcpcDX29TBox) NEQ "" OR trim(hcpcDiagnosis29TBox) NEQ "">
							<cfset visibility29 = "inline">
							<cfelse> 
							<cfset visibility29 = "none">
							</cfif> 
							<tr id="tr_hcpc29" style="display: '#trim(visibility29)#';">
							<td id="td_hcpcCode29TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="268" type="Text" size="7" maxlength="7" name="hcpcCode29TBox" value="#trim(hcpcCode29TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct29TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct29TBox')"></td>
							<td id="td_hcpcQty29TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="269" type="Text" size="3" maxlength="3" name="hcpcQty29TBox" value="#trim(hcpcQty29TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct29TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="270" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct29TBox" value="#trim(hcpcProduct29TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost29TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="271" type="Text" size="10" maxlength="10" name="hcpcCost29TBox" value="#trim(hcpcCost29TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX29TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="272" type="Text" size="7" maxlength="7" name="hcpcDX29TBox" value="#trim(hcpcDX29TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis29TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis29TBox')"></td>
							<td id="td_hcpcDiagnosis29TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="273" type="Text" size="25" maxlength="35" name="hcpcDiagnosis29TBox" value="#trim(hcpcDiagnosis29TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode30TBox) NEQ "" OR trim(hcpcQty30TBox) NEQ "" OR trim(hcpcProduct30TBox) NEQ "" OR trim(hcpcCost30TBox) NEQ "" OR trim(hcpcDX30TBox) NEQ "" OR trim(hcpcDiagnosis30TBox) NEQ "">
							<cfset visibility30 = "inline">
							<cfelse> 
							<cfset visibility30 = "none">
							</cfif> 
							<tr id="tr_hcpc30" style="display: '#trim(visibility30)#';">
							<td id="td_hcpcCode30TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="274" type="Text" size="7" maxlength="7" name="hcpcCode30TBox" value="#trim(hcpcCode30TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct30TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct30TBox')"></td>
							<td id="td_hcpcQty30TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="275" type="Text" size="3" maxlength="3" name="hcpcQty30TBox" value="#trim(hcpcQty30TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct30TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="276" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct30TBox" value="#trim(hcpcProduct30TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost30TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="277" type="Text" size="10" maxlength="10" name="hcpcCost30TBox" value="#trim(hcpcCost30TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX30TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="278" type="Text" size="7" maxlength="7" name="hcpcDX30TBox" value="#trim(hcpcDX30TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis30TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis30TBox')"></td>
							<td id="td_hcpcDiagnosis30TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="279" type="Text" size="25" maxlength="35" name="hcpcDiagnosis30TBox" value="#trim(hcpcDiagnosis30TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode31TBox) NEQ "" OR trim(hcpcQty31TBox) NEQ "" OR trim(hcpcProduct31TBox) NEQ "" OR trim(hcpcCost31TBox) NEQ "" OR trim(hcpcDX31TBox) NEQ "" OR trim(hcpcDiagnosis31TBox) NEQ "">
							<cfset visibility31 = "inline">
							<cfelse> 
							<cfset visibility31 = "none">
							</cfif> 
							<tr id="tr_hcpc31" style="display: '#trim(visibility31)#';">
							<td id="td_hcpcCode31TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="280" type="Text" size="7" maxlength="7" name="hcpcCode31TBox" value="#trim(hcpcCode31TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct31TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct31TBox')"></td>
							<td id="td_hcpcQty31TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="281" type="Text" size="3" maxlength="3" name="hcpcQty31TBox" value="#trim(hcpcQty31TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct31TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="282" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct31TBox" value="#trim(hcpcProduct31TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost31TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="283" type="Text" size="10" maxlength="10" name="hcpcCost31TBox" value="#trim(hcpcCost31TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX31TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="284" type="Text" size="7" maxlength="7" name="hcpcDX31TBox" value="#trim(hcpcDX31TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis31TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis31TBox')"></td>
							<td id="td_hcpcDiagnosis31TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="285" type="Text" size="25" maxlength="35" name="hcpcDiagnosis31TBox" value="#trim(hcpcDiagnosis31TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode32TBox) NEQ "" OR trim(hcpcQty32TBox) NEQ "" OR trim(hcpcProduct32TBox) NEQ "" OR trim(hcpcCost32TBox) NEQ "" OR trim(hcpcDX32TBox) NEQ "" OR trim(hcpcDiagnosis32TBox) NEQ "">
							<cfset visibility32 = "inline">
							<cfelse> 
							<cfset visibility32 = "none">
							</cfif> 
							<tr id="tr_hcpc32" style="display: '#trim(visibility32)#';">
							<td id="td_hcpcCode32TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="286" type="Text" size="7" maxlength="7" name="hcpcCode32TBox" value="#trim(hcpcCode32TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct32TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct32TBox')"></td>
							<td id="td_hcpcQty32TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="287" type="Text" size="3" maxlength="3" name="hcpcQty32TBox" value="#trim(hcpcQty32TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct32TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="288" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct32TBox" value="#trim(hcpcProduct32TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost32TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="289" type="Text" size="10" maxlength="10" name="hcpcCost32TBox" value="#trim(hcpcCost32TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX32TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="290" type="Text" size="7" maxlength="7" name="hcpcDX32TBox" value="#trim(hcpcDX32TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis32TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis32TBox')"></td>
							<td id="td_hcpcDiagnosis32TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="291" type="Text" size="25" maxlength="35" name="hcpcDiagnosis32TBox" value="#trim(hcpcDiagnosis32TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode33TBox) NEQ "" OR trim(hcpcQty33TBox) NEQ "" OR trim(hcpcProduct33TBox) NEQ "" OR trim(hcpcCost33TBox) NEQ "" OR trim(hcpcDX33TBox) NEQ "" OR trim(hcpcDiagnosis33TBox) NEQ "">
							<cfset visibility33 = "inline">
							<cfelse> 
							<cfset visibility33 = "none">
							</cfif> 
							<tr id="tr_hcpc33" style="display: '#trim(visibility33)#';">
							<td id="td_hcpcCode33TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="292" type="Text" size="7" maxlength="7" name="hcpcCode33TBox" value="#trim(hcpcCode33TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct33TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct33TBox')"></td>
							<td id="td_hcpcQty33TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="293" type="Text" size="3" maxlength="3" name="hcpcQty33TBox" value="#trim(hcpcQty33TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct33TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="294" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct33TBox" value="#trim(hcpcProduct33TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost33TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="295" type="Text" size="10" maxlength="10" name="hcpcCost33TBox" value="#trim(hcpcCost33TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX33TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="296" type="Text" size="7" maxlength="7" name="hcpcDX33TBox" value="#trim(hcpcDX33TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis33TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis33TBox')"></td>
							<td id="td_hcpcDiagnosis33TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="297" type="Text" size="25" maxlength="35" name="hcpcDiagnosis33TBox" value="#trim(hcpcDiagnosis33TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode34TBox) NEQ "" OR trim(hcpcQty34TBox) NEQ "" OR trim(hcpcProduct34TBox) NEQ "" OR trim(hcpcCost34TBox) NEQ "" OR trim(hcpcDX34TBox) NEQ "" OR trim(hcpcDiagnosis34TBox) NEQ "">
							<cfset visibility34 = "inline">
							<cfelse> 
							<cfset visibility34 = "none">
							</cfif> 
							<tr id="tr_hcpc34" style="display: '#trim(visibility34)#';">
							<td id="td_hcpcCode34TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="298" type="Text" size="7" maxlength="7" name="hcpcCode34TBox" value="#trim(hcpcCode34TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct34TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct34TBox')"></td>
							<td id="td_hcpcQty34TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="299" type="Text" size="3" maxlength="3" name="hcpcQty34TBox" value="#trim(hcpcQty34TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct34TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="300" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct34TBox" value="#trim(hcpcProduct34TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost34TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="301" type="Text" size="10" maxlength="10" name="hcpcCost34TBox" value="#trim(hcpcCost34TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX34TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="302" type="Text" size="7" maxlength="7" name="hcpcDX34TBox" value="#trim(hcpcDX34TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis34TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis34TBox')"></td>
							<td id="td_hcpcDiagnosis34TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="303" type="Text" size="25" maxlength="35" name="hcpcDiagnosis34TBox" value="#trim(hcpcDiagnosis34TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode35TBox) NEQ "" OR trim(hcpcQty35TBox) NEQ "" OR trim(hcpcProduct35TBox) NEQ "" OR trim(hcpcCost35TBox) NEQ "" OR trim(hcpcDX35TBox) NEQ "" OR trim(hcpcDiagnosis35TBox) NEQ "">
							<cfset visibility35 = "inline">
							<cfelse> 
							<cfset visibility35 = "none">
							</cfif> 
							<tr id="tr_hcpc35" style="display: '#trim(visibility35)#';">
							<td id="td_hcpcCode35TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="304" type="Text" size="7" maxlength="7" name="hcpcCode35TBox" value="#trim(hcpcCode35TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct35TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct35TBox')"></td>
							<td id="td_hcpcQty35TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="305" type="Text" size="3" maxlength="3" name="hcpcQty35TBox" value="#trim(hcpcQty35TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct35TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="306" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct35TBox" value="#trim(hcpcProduct35TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost35TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="307" type="Text" size="10" maxlength="10" name="hcpcCost35TBox" value="#trim(hcpcCost35TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX35TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="308" type="Text" size="7" maxlength="7" name="hcpcDX35TBox" value="#trim(hcpcDX35TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis35TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis35TBox')"></td>
							<td id="td_hcpcDiagnosis35TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="309" type="Text" size="25" maxlength="35" name="hcpcDiagnosis35TBox" value="#trim(hcpcDiagnosis35TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode36TBox) NEQ "" OR trim(hcpcQty36TBox) NEQ "" OR trim(hcpcProduct36TBox) NEQ "" OR trim(hcpcCost36TBox) NEQ "" OR trim(hcpcDX36TBox) NEQ "" OR trim(hcpcDiagnosis36TBox) NEQ "">
							<cfset visibility36 = "inline">
							<cfelse> 
							<cfset visibility36 = "none">
							</cfif> 
							<tr id="tr_hcpc36" style="display: '#trim(visibility36)#';">
							<td id="td_hcpcCode36TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="310" type="Text" size="7" maxlength="7" name="hcpcCode36TBox" value="#trim(hcpcCode36TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct36TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct36TBox')"></td>
							<td id="td_hcpcQty36TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="311" type="Text" size="3" maxlength="3" name="hcpcQty36TBox" value="#trim(hcpcQty36TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct36TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="312" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct36TBox" value="#trim(hcpcProduct36TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost36TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="313" type="Text" size="10" maxlength="10" name="hcpcCost36TBox" value="#trim(hcpcCost36TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX36TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="314" type="Text" size="7" maxlength="7" name="hcpcDX36TBox" value="#trim(hcpcDX36TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis36TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis36TBox')"></td>
							<td id="td_hcpcDiagnosis36TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="315" type="Text" size="25" maxlength="35" name="hcpcDiagnosis36TBox" value="#trim(hcpcDiagnosis36TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode37TBox) NEQ "" OR trim(hcpcQty37TBox) NEQ "" OR trim(hcpcProduct37TBox) NEQ "" OR trim(hcpcCost37TBox) NEQ "" OR trim(hcpcDX37TBox) NEQ "" OR trim(hcpcDiagnosis37TBox) NEQ "">
							<cfset visibility37 = "inline">
							<cfelse> 
							<cfset visibility37 = "none">
							</cfif> 
							<tr id="tr_hcpc37" style="display: '#trim(visibility37)#';">
							<td id="td_hcpcCode37TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="316" type="Text" size="7" maxlength="7" name="hcpcCode37TBox" value="#trim(hcpcCode37TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct37TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct37TBox')"></td>
							<td id="td_hcpcQty37TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="317" type="Text" size="3" maxlength="3" name="hcpcQty37TBox" value="#trim(hcpcQty37TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct37TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="318" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct37TBox" value="#trim(hcpcProduct37TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost37TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="319" type="Text" size="10" maxlength="10" name="hcpcCost37TBox" value="#trim(hcpcCost37TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX37TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="320" type="Text" size="7" maxlength="7" name="hcpcDX37TBox" value="#trim(hcpcDX37TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis37TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis37TBox')"></td>
							<td id="td_hcpcDiagnosis37TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="321" type="Text" size="25" maxlength="35" name="hcpcDiagnosis37TBox" value="#trim(hcpcDiagnosis37TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode38TBox) NEQ "" OR trim(hcpcQty38TBox) NEQ "" OR trim(hcpcProduct38TBox) NEQ "" OR trim(hcpcCost38TBox) NEQ "" OR trim(hcpcDX38TBox) NEQ "" OR trim(hcpcDiagnosis38TBox) NEQ "">
							<cfset visibility38 = "inline">
							<cfelse> 
							<cfset visibility38 = "none">
							</cfif> 
							<tr id="tr_hcpc38" style="display: '#trim(visibility38)#';">
							<td id="td_hcpcCode38TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="322" type="Text" size="7" maxlength="7" name="hcpcCode38TBox" value="#trim(hcpcCode38TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct38TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct38TBox')"></td>
							<td id="td_hcpcQty38TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="323" type="Text" size="3" maxlength="3" name="hcpcQty38TBox" value="#trim(hcpcQty38TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct38TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="324" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct38TBox" value="#trim(hcpcProduct38TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost38TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="325" type="Text" size="10" maxlength="10" name="hcpcCost38TBox" value="#trim(hcpcCost38TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX38TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="326" type="Text" size="7" maxlength="7" name="hcpcDX38TBox" value="#trim(hcpcDX38TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis38TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis38TBox')"></td>
							<td id="td_hcpcDiagnosis38TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="327" type="Text" size="25" maxlength="35" name="hcpcDiagnosis38TBox" value="#trim(hcpcDiagnosis38TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode39TBox) NEQ "" OR trim(hcpcQty39TBox) NEQ "" OR trim(hcpcProduct39TBox) NEQ "" OR trim(hcpcCost39TBox) NEQ "" OR trim(hcpcDX39TBox) NEQ "" OR trim(hcpcDiagnosis39TBox) NEQ "">
							<cfset visibility39 = "inline">
							<cfelse> 
							<cfset visibility39 = "none">
							</cfif> 
							<tr id="tr_hcpc39" style="display: '#trim(visibility39)#';">
							<td id="td_hcpcCode39TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="328" type="Text" size="7" maxlength="7" name="hcpcCode39TBox" value="#trim(hcpcCode39TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct39TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct39TBox')"></td>
							<td id="td_hcpcQty39TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="329" type="Text" size="3" maxlength="3" name="hcpcQty39TBox" value="#trim(hcpcQty39TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct39TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="330" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct39TBox" value="#trim(hcpcProduct39TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost39TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="331" type="Text" size="10" maxlength="10" name="hcpcCost39TBox" value="#trim(hcpcCost39TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX39TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="332" type="Text" size="7" maxlength="7" name="hcpcDX39TBox" value="#trim(hcpcDX39TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis39TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis39TBox')"></td>
							<td id="td_hcpcDiagnosis39TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="333" type="Text" size="25" maxlength="35" name="hcpcDiagnosis39TBox" value="#trim(hcpcDiagnosis39TBox)#" class="siteTextBox"></td>
							</tr>
							
							<cfif trim(hcpcCode40TBox) NEQ "" OR trim(hcpcQty40TBox) NEQ "" OR trim(hcpcProduct40TBox) NEQ "" OR trim(hcpcCost40TBox) NEQ "" OR trim(hcpcDX40TBox) NEQ "" OR trim(hcpcDiagnosis40TBox) NEQ "">
							<cfset visibility40 = "inline">
							<cfelse> 
							<cfset visibility40 = "none">
							</cfif> 
							<tr id="tr_hcpc40" style="display: '#trim(visibility40)#';">
							<td id="td_hcpcCode40TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><input tabindex="334" type="Text" size="7" maxlength="7" name="hcpcCode40TBox" value="#trim(hcpcCode40TBox)#" class="siteTextBox" onChange="capitalizeMe(this)" onkeyup="keyUpHCPC(this, 'hcpcProduct40TBox');" onblur="hcpcOnBlur(this, 'hcpcProduct40TBox')"></td>
							<td id="td_hcpcQty40TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="335" type="Text" size="3" maxlength="3" name="hcpcQty40TBox" value="#trim(hcpcQty40TBox)#" class="siteTextBox" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcProduct40TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="336" type="Text" size="35" maxlength="35" onChange="capitalizeMe(this)" name="hcpcProduct40TBox" value="#trim(hcpcProduct40TBox)#" class="siteTextBox"></td>
							<td id="td_hcpcCost40TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="337" type="Text" size="10" maxlength="10" name="hcpcCost40TBox" value="#trim(hcpcCost40TBox)#" class="siteTextBox" onchange="this.value=decimalFormat_JS(this.value);" style="text-align:right;padding-right:3px"></td>
							<td id="td_hcpcDX40TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="338" type="Text" size="7" maxlength="7" name="hcpcDX40TBox" value="#trim(hcpcDX40TBox)#" class="siteTextBox" onkeyup="keyUp(this, 'hcpcDiagnosis40TBox');" onblur="dxOnBlur(this, 'hcpcDiagnosis40TBox')"></td>
							<td id="td_hcpcDiagnosis40TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><input tabindex="339" type="Text" size="25" maxlength="35" name="hcpcDiagnosis40TBox" value="#trim(hcpcDiagnosis40TBox)#" class="siteTextBox"></td>
							</tr>
							
							
							<tr>
							    <td align="center" class="siteLabel" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;</td>
								<td align="center" class="siteLabel" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;</td>
								<td align="center" class="siteLabel" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;</td>
								<td align="center" class="siteLabel" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;</td>
								<td align="center" class="siteLabel" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;</td>
								<td align="center" class="siteLabel" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;</td>
							</tr>							
							<tr>
							    <td align="center" colspan="6" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">
									<input tabindex="120" type="Button" class="siteSubmitBox" value="Add HCPC Line" onclick="addLine();">
									<input type="Hidden" name="currentInlineRow" value="">
								</td>
							</tr>
																				
							<tr>
							    <td align="center" colspan="6" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">&nbsp;</td>
							</tr>
							
														
							
							<!---INSURANCE INFORMATION--->
					       	<tr>
					        	<td bgcolor="DCE3EB" align="center" colspan="6" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
					         	<font face="Arial" size="2"><strong>INSURANCE&nbsp;INFORMATION</strong></font>
					        	</td>
					       	</tr>
					       <tr>
					           <td id="td_primaryInsuranceNameTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;PRIMARY&nbsp;INSURANCE:&nbsp;<input tabindex="352" type="Text" size="35" maxlength="45" onChange="capitalizeMe(this)" name="primaryInsuranceNameTBox" onblur="bgColorRequired(this);" value="#trim(primaryInsuranceNameTBox)#" class="siteTextBox"></td>
					           <td id="td_secondaryInsuranceNameTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;SECONDARY&nbsp;INSURANCE:&nbsp;<input tabindex="375" type="Text" size="35" maxlength="45" onChange="capitalizeMe(this)" name="secondaryInsuranceNameTBox" value="#trim(secondaryInsuranceNameTBox)#" class="siteTextBox"></td>
					       </tr>
					       <tr>
					           <td id="td_primaryPolicyNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">&nbsp;POLICY&nbsp;##:&nbsp;<input tabindex="355" type="Text" size="45" maxlength="35" name="primaryPolicyNumberTBox" onblur="bgColorRequired(this);" value="#trim(primaryPolicyNumberTBox)#" class="siteTextBox"></td>
					           <td id="td_secondaryPolicyNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 1px solid; border-color: 000000;">&nbsp;POLICY&nbsp;##:&nbsp;<input tabindex="378" type="Text" size="45" maxlength="35" name="secondaryPolicyNumberTBox" value="#trim(secondaryPolicyNumberTBox)#" class="siteTextBox"></td>
					       </tr>				      
					       <tr>
					           <td align="center" colspan="6" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">&nbsp;</td>
					       </tr>	
							
							
							<!---PHYSICIAN INFORMATION--->
							<tr>
							    <td bgcolor="DCE3EB" align="center" colspan="6" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
									<table cellpadding="0" cellspacing="0" border="0" width="100%">
										<td align="center" class="siteLabel">
											<font face="Arial" size="2"><strong>ORDERING&nbsp;PHYSICIAN&nbsp;INFORMATION</strong></font>
										</td>
										<td align="right" nowrap class="siteLabel">&nbsp;</td>
									</table>									
								</td>
							</tr>
							<tr>														   
							    <td id="td_orderingPhysicianNameTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">
									&nbsp;PHYSICIAN&nbsp;FIRST:&nbsp;<input tabindex="414" type="Text" size="15" maxlength="45" onChange="capitalizeMe(this)" name="orderingPhysicianFNameTBox" onblur="bgColorRequired(this);" value="#trim(orderingPhysicianFNameTBox)#" class="siteTextBox">
									&nbsp;M:&nbsp;<input tabindex="415" type="Text" size="1" maxlength="1" name="orderingPhysicianMInitialTBox" value="#trim(orderingPhysicianMInitialTBox)#" class="siteTextBox">
									&nbsp;LAST:&nbsp;<input tabindex="416" type="Text" size="15" maxlength="45" onChange="capitalizeMe(this)" name="orderingPhysicianLNameTBox" onblur="bgColorRequired(this);" value="#trim(orderingPhysicianLNameTBox)#" class="siteTextBox">
								</td>
							    <td id="td_orderingPhysicianPhoneTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 1px solid; border-color: 000000;">&nbsp;PHYSICIAN&nbsp;PHONE&nbsp;##:&nbsp;<input tabindex="417" type="Text" size="35" maxlength="24" name="orderingPhysicianPhoneTBox" onblur="bgColorRequired(this);" value="#trim(orderingPhysicianPhoneTBox)#" class="siteTextBox" onkeyup="this.value=formatPhoneUS_JS(this.value);"></td>
							</tr>																																														
							<tr>
							    <td align="center" colspan="6" class="siteLabel" style="border-bottom: 0px solid; border-color: 000000;">&nbsp;</td>
							</tr>
																																						
							<tr>
							    <td align="center" colspan="6" class="siteLabel" style="border-bottom: 0px solid; border-color: 000000;">&nbsp;</td>
							</tr>						
							
								
						</table>
					</td>
				</tr>	
				
				<tr>
				    <td colspan="10" align="center">
						<cfif Active AND IsNumeric(quoteID)>
							<cf_gcSubmitButton tabindex="577" value="Update&nbsp;Quote" onclick="if(document.forms[0].patientFNameTBox.value == '' || document.#trim(formname)#.patientLNameTBox.value == '' || document.#formName#.patientDOBMM.value == '' || document.#formName#.patientDOBDD.value == '' || document.#formName#.patientDOBYY.value == ''){this.disabled = false;alert('You must have at a minimum the patient\'s\n\nFirst Name\nLast Name\nDate of Birth\n\nin order to save this page.');};">
						<cfelseif Active OR NOT IsNumeric(quoteID)>
							<cf_gcSubmitButton tabindex="577" value="Submit&nbsp;Quote" onclick="if(document.forms[0].patientFNameTBox.value == '' || document.#trim(formname)#.patientLNameTBox.value == '' || document.#formName#.patientDOBMM.value == '' || document.#formName#.patientDOBDD.value == '' || document.#formName#.patientDOBYY.value == ''){this.disabled = false;alert('You must have at a minimum the patient\'s\n\nFirst Name\nLast Name\nDate of Birth\n\nin order to save this page.');};">
						</cfif>
						<cfif NOT Isnumeric(quoteID)>
							&nbsp;&nbsp;&nbsp;<input tabindex="578" type="reset" class="SiteSubmitbox" value="Clear&nbsp;Form">
						</cfif>
						&nbsp;&nbsp;&nbsp;<input type="button" class="SiteSubmitBox" value="Back" onclick="history.back()">
					</td>							   
				</tr>	
				<tr>
				    <td align="center" colspan="10" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">&nbsp;</td>
				</tr>		
									
			</table>	
		     	
		</form>
		
		<script language="JavaScript">
			if(document.#formName#.callerFNameTBox.value == ""){document.#formName#.callerFNameTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.callerFNameTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.callerLNameTBox.value == ""){document.#formName#.callerLNameTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.callerLNameTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.callerPhoneTBox.value == ""){document.#formName#.callerPhoneTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.callerPhoneTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientFNameTBox.value == ""){document.#formName#.patientFNameTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientFNameTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientLNameTBox.value == ""){document.#formName#.patientLNameTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientLNameTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientDOBMM.value == ""){document.#formName#.patientDOBMM.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientDOBMM.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientDOBDD.value == ""){document.#formName#.patientDOBDD.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientDOBDD.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientDOBYY.value == ""){document.#formName#.patientDOBYY.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientDOBYY.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientAddressTBox.value == ""){document.#formName#.patientAddressTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientAddressTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientCityTBox.value == ""){document.#formName#.patientCityTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientCityTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientStateTBox.value == ""){document.#formName#.patientStateTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientStateTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientZipTBox.value == ""){document.#formName#.patientZipTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientZipTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientPhoneTBox.value == ""){document.#formName#.patientPhoneTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientPhoneTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientSSNTBox.value == ""){document.#formName#.patientSSNTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientSSNTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientHeightInches.value == ""){document.#formName#.patientHeightInches.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientHeightInches.style.backgroundColor = 'ffffff';};
			if(document.#formName#.patientWeightTBox.value == ""){document.#formName#.patientWeightTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.patientWeightTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.alternateContactFNameTBox.value == ""){document.#formName#.alternateContactFNameTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.alternateContactFNameTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.alternateContactLNameTBox.value == ""){document.#formName#.alternateContactLNameTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.alternateContactLNameTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.alternateContactRelationshipTBox.value == ""){document.#formName#.alternateContactRelationshipTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.alternateContactRelationshipTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.alternateContactPhoneTBox.value == ""){document.#formName#.alternateContactPhoneTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.alternateContactPhoneTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.primaryInsuranceNameTBox.value == ""){document.#formName#.primaryInsuranceNameTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.primaryInsuranceNameTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.primaryPolicyNumberTBox.value == ""){document.#formName#.primaryPolicyNumberTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.primaryPolicyNumberTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.orderingPhysicianFNameTBox.value == ""){document.#formName#.orderingPhysicianFNameTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.orderingPhysicianFNameTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.orderingPhysicianLNameTBox.value == ""){document.#formName#.orderingPhysicianLNameTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.orderingPhysicianLNameTBox.style.backgroundColor = 'ffffff';};
			if(document.#formName#.orderingPhysicianPhoneTBox.value == ""){document.#formName#.orderingPhysicianPhoneTBox.style.backgroundColor = 'ffffcc';}else{document.#formName#.orderingPhysicianPhoneTBox.style.backgroundColor = 'ffffff';};
		</script>
		
	</cfoutput>

	
	
<!--------------------------------------------------------------------------------------->
<!--- When you have a validate form and the msg is not black this function will have  --->
<!--- to be called below the gcSubmitButton custom tag. This tag will set             --->
<!--- caller.submitButtonID allowing this code to work.                               --->
<!--------------------------------------------------------------------------------------->		
	<cfif Active OR NOT Isnumeric(quoteID)>
		<cfoutput>
			<script language="JavaScript">
				function resetSubmitButtons(){
					document.#formName#.SubmitButton#trim(submitButtonID)#.style.display='inline'; 
					spSubmitButton#trim(submitButtonID)#.innerText='';			
				};
			</script>
		</cfoutput>
	</cfif>		
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the focus on this form to the highest editable field.                      --->
<!-------------------------------------------------------------------------------------->		
	<cfoutput>
		<script language="JavaScript">				
			document.getElementById("callerFNameTBox").focus();						
		</script>
	</cfoutput>		
	
	
	
	
	
	
	
	
	
		
	
	
	
	
	
<!---
callerFNameTBox
callerLNameTBox
callerPhoneTBox
patientFNameTBox
patientLNameTBox
patientDOBMM
patientDOBDD
patientDOBYY
patientAddressTBox
patientCityTBox
patientStateTBox
patientZipTBox
patientPhoneTBox
patientSSNTBox
patientHeightInches
patientWeightTBox
alternateContactFNameTBox
alternateContactLNameTBox
alternateContactRelationshipTBox
alternateContactPhoneTBox
primaryInsuranceNameTBox
primaryPolicyNumberTBox
orderingPhysicianFNameTBox
orderingPhysicianLNameTBox
orderingPhysicianPhoneTBox


	<script language="JavaScript">
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
		if(document.#formName#..value == ""){document.#formName#..style.backgroundColor = 'ffffcc';}else{document.#formName#..style.backgroundColor = 'ffffff';};
	</script>
--->

<!---
quoteID
hidden_UsersID
hidden_TimeStart
callerFNameTBox
callerMInitialTBox
callerLNameTBox
callerPhoneTBox
patientFNameTBox
patientMInitialTBox
patientLNameTBox
roomNumberTBox
bedNumberTBox
patientAddressTBox
patientCityTBox
patientStateTBox
patientZipTBox
patientPhoneTBox
OPTION_3a_CBox_PatientSexMale
OPTION_3a_CBox_PatientSexFemale
patientDOBMM
patientDOBDD
patientDOBYY
patientSSNTBox
patientHeightInches
patientWeightTBox
alternateContactFNameTBox
alternateContactMInitialTBox
alternateContactLNameTBox
alternateContactRelationshipTBox
alternateContactPhoneTBox
alternateContactWorkPhoneTBox
hcpcCode1TBox
hcpcQty1TBox
hcpcProduct1TBox
hcpcDX1TBox
hcpcCode2TBox
hcpcQty2TBox
hcpcProduct2TBox
hcpcDX2TBox
hcpcCode3TBox
hcpcQty3TBox
hcpcProduct3TBox
hcpcDX3TBox
hcpcCode4TBox
hcpcQty4TBox
hcpcProduct4TBox
hcpcDX4TBox
hcpcCode5TBox
hcpcQty5TBox
hcpcProduct5TBox
hcpcDX5TBox
hcpcCode6TBox
hcpcQty6TBox
hcpcProduct6TBox
hcpcDX6TBox
hcpcCode7TBox
hcpcQty7TBox
hcpcProduct7TBox
hcpcDX7TBox
hcpcCode8TBox
hcpcQty8TBox
hcpcProduct8TBox
hcpcDX8TBox
hcpcCode9TBox
hcpcQty9TBox
hcpcProduct9TBox
hcpcDX9TBox							
hcpcCode10TBox
hcpcQty10TBox
hcpcProduct10TBox
hcpcDX10TBox														
primaryInsuranceNameTBox
secondaryInsuranceNameTBox
primaryPolicyNumberTBox
secondaryPolicyNumberTBox
orderingPhysicianFNameTBox
orderingPhysicianMInitialTBox
orderingPhysicianLNameTBox
orderingPhysicianPhoneTBox

--->		
