<!---- appPatientQuotePromoteToIntake.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.quoteID" default="">
	<cfset quoteID = attributes.quoteID>
	
	<cfif IsDefined("form.quoteID") AND form.quoteID NEQ "">
		<cfset quoteID = form.quoteID>
	<cfelseif IsDefined("url.quoteID") AND url.quoteID NEQ "">
		<cfset quoteID = url.quoteID>	
	</cfif>
	

	
<!-------------------------------------------------------------------------------------->
<!--- query for the quote.                                                           --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getQuote" datasource="#trim(request.datasource)#"> 
		SELECT QuoteID, ClientID, AssignedToUserID, hidden_UsersID, hidden_TimeStart, callerFNameTBox, callerMInitialTBox, callerLNameTBox, callerPhoneTBox, patientFNameTBox, patientMInitialTBox, patientLNameTBox, roomNumberTBox, bedNumberTBox, patientAddressTBox, patientCityTBox, patientStateTBox, patientZipTBox, patientPhoneTBox, patientDOBMM, patientDOBDD, patientDOBYY, IFNULL(OPTION_3a_CBox_PatientSexMale, 0) AS OPTION_3a_CBox_PatientSexMale, IFNULL(OPTION_3a_CBox_PatientSexFemale, 0) AS OPTION_3a_CBox_PatientSexFemale, patientSSNTBox, patientHeightFeet, patientHeightInches, patientWeightTBox, alternateContactFNameTBox, alternateContactMInitialTBox, alternateContactLNameTBox, alternateContactRelationshipTBox, alternateContactPhoneTBox, alternateContactWorkPhoneTBox, hcpcCode1TBox, hcpcQty1TBox, hcpcProduct1TBox, hcpcDX1TBox, hcpcDiagnosis1TBox, hcpcCost1TBox, hcpcCode2TBox, hcpcQty2TBox, hcpcProduct2TBox, hcpcDX2TBox, hcpcDiagnosis2TBox, hcpcCost2TBox, hcpcCode3TBox, hcpcQty3TBox, hcpcProduct3TBox, hcpcDX3TBox, hcpcDiagnosis3TBox, hcpcCost3TBox, hcpcCode4TBox, hcpcQty4TBox, hcpcProduct4TBox, hcpcDX4TBox, hcpcDiagnosis4TBox, hcpcCost4TBox, hcpcCode5TBox, hcpcQty5TBox, hcpcProduct5TBox, hcpcDX5TBox, hcpcDiagnosis5TBox, hcpcCost5TBox, hcpcCode6TBox, hcpcQty6TBox, hcpcProduct6TBox, hcpcDX6TBox, hcpcDiagnosis6TBox, hcpcCost6TBox, hcpcCode7TBox, hcpcQty7TBox, hcpcProduct7TBox, hcpcDX7TBox, hcpcDiagnosis7TBox, hcpcCost7TBox, hcpcCode8TBox, hcpcQty8TBox, hcpcProduct8TBox, hcpcDX8TBox, hcpcDiagnosis8TBox, hcpcCost8TBox, hcpcCode9TBox, hcpcQty9TBox, hcpcProduct9TBox, hcpcDX9TBox, hcpcDiagnosis9TBox, hcpcCost9TBox, hcpcCode10TBox, hcpcQty10TBox, hcpcProduct10TBox, hcpcDX10TBox, hcpcDiagnosis10TBox, hcpcCost10TBox, primaryInsuranceNameTBox, secondaryInsuranceNameTBox, primaryPolicyNumberTBox, secondaryPolicyNumberTBox,	orderingPhysicianFNameTBox,	orderingPhysicianMInitialTBox, orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox, DateCreated, DateModified 
		FROM Quote		
		WHERE quoteID = #trim(quoteID)#
	</cfquery>	

	<cfquery name="updateQuote" datasource="#trim(request.datasource)#"> 
		UPDATE Quote		
		SET Active = 0
		WHERE quoteID = #trim(quoteID)#
	</cfquery>	
	

	
<!-------------------------------------------------------------------------------------->
<!--- Call the tag to show the Intake                                                --->
<!-------------------------------------------------------------------------------------->
	<cf_tagFormPatientIntakeForm 
		hidden_usersid="#trim(getQuote.hidden_UsersID)#"
		dateCreated="#trim(getQuote.DateCreated)#"
		hidden_timestart="#trim(getQuote.hidden_TimeStart)#"		
		callerFNameTBox="#trim(getQuote.callerFNameTBox)#"
		callerMInitialTBox="#trim(getQuote.callerMInitialTBox)#"
		callerLNameTBox="#trim(getQuote.callerLNameTBox)#"
		callerPhoneTBox="#trim(getQuote.callerPhoneTBox)#"
		patientFNameTBox="#trim(getQuote.patientFNameTBox)#"
		patientMInitialTBox="#trim(getQuote.patientMInitialTBox)#"
		patientLNameTBox="#trim(getQuote.patientLNameTBox)#"
		roomNumberTBox="#trim(getQuote.roomNumberTBox)#"
		bedNumberTBox="#trim(getQuote.bedNumberTBox)#"
		patientAddressTBox="#trim(getQuote.patientAddressTBox)#"
		patientCityTBox="#trim(getQuote.patientCityTBox)#"
		patientStateTBox="#trim(getQuote.patientStateTBox)#"
		patientZipTBox="#trim(getQuote.patientZipTBox)#"
		patientPhoneTBox="#trim(getQuote.patientPhoneTBox)#"
		patientDOBMM="#trim(getQuote.patientDOBMM)#"
		patientDOBDD="#trim(getQuote.patientDOBDD)#"
		patientDOBYY="#trim(getQuote.patientDOBYY)#"
		OPTION_3a_CBox_PatientSexMale="#trim(getQuote.OPTION_3a_CBox_PatientSexMale)#"
		OPTION_3a_CBox_PatientSexFemale="#trim(getQuote.OPTION_3a_CBox_PatientSexFemale)#"
		patientSSNTBox="#trim(getQuote.patientSSNTBox)#"
		patientHeightFeet="#trim(getQuote.patientHeightFeet)#"
		patientHeightInches="#trim(getQuote.patientHeightInches)#"
		patientWeightTBox="#trim(getQuote.patientWeightTBox)#"
		alternateContactFNameTBox="#trim(getQuote.alternateContactFNameTBox)#"
		alternateContactMInitialTBox="#trim(getQuote.alternateContactMInitialTBox)#"
		alternateContactLNameTBox="#trim(getQuote.alternateContactLNameTBox)#"
		alternateContactRelationshipTBox="#trim(getQuote.alternateContactRelationshipTBox)#"
		alternateContactPhoneTBox="#trim(getQuote.alternateContactPhoneTBox)#"
		alternateContactWorkPhoneTBox="#trim(getQuote.alternateContactWorkPhoneTBox)#"
		hcpcCode1TBox="#trim(getQuote.hcpcCode1TBox)#"
		hcpcQty1TBox="#trim(getQuote.hcpcQty1TBox)#"
		hcpcProduct1TBox="#trim(getQuote.hcpcProduct1TBox)#"
		hcpcDX1TBox="#trim(getQuote.hcpcDX1TBox)#"
		hcpcDiagnosis1TBox="#trim(getQuote.hcpcDiagnosis1TBox)#"
		hcpcCost1TBox="#trim(getQuote.hcpcCost1TBox)#"
		hcpcCode2TBox="#trim(getQuote.hcpcCode2TBox)#"
		hcpcQty2TBox="#trim(getQuote.hcpcQty2TBox)#"
		hcpcProduct2TBox="#trim(getQuote.hcpcProduct2TBox)#"
		hcpcDX2TBox="#trim(getQuote.hcpcDX2TBox)#"
		hcpcDiagnosis2TBox="#trim(getQuote.hcpcDiagnosis2TBox)#"
		hcpcCost2TBox="#trim(getQuote.hcpcCost2TBox)#"
		hcpcCode3TBox="#trim(getQuote.hcpcCode3TBox)#"
		hcpcQty3TBox="#trim(getQuote.hcpcQty3TBox)#"
		hcpcProduct3TBox="#trim(getQuote.hcpcProduct3TBox)#"
		hcpcDX3TBox="#trim(getQuote.hcpcDX3TBox)#"
		hcpcDiagnosis3TBox="#trim(getQuote.hcpcDiagnosis3TBox)#"
		hcpcCost3TBox="#trim(getQuote.hcpcCost3TBox)#"
		hcpcCode4TBox="#trim(getQuote.hcpcCode4TBox)#"
		hcpcQty4TBox="#trim(getQuote.hcpcQty4TBox)#"
		hcpcProduct4TBox="#trim(getQuote.hcpcProduct4TBox)#"
		hcpcDX4TBox="#trim(getQuote.hcpcDX4TBox)#"
		hcpcDiagnosis4TBox="#trim(getQuote.hcpcDiagnosis4TBox)#"
		hcpcCost4TBox="#trim(getQuote.hcpcCost4TBox)#"
		hcpcCode5TBox="#trim(getQuote.hcpcCode5TBox)#"
		hcpcQty5TBox="#trim(getQuote.hcpcQty5TBox)#"
		hcpcProduct5TBox="#trim(getQuote.hcpcProduct5TBox)#"
		hcpcDX5TBox="#trim(getQuote.hcpcDX5TBox)#"
		hcpcDiagnosis5TBox="#trim(getQuote.hcpcDiagnosis5TBox)#"
		hcpcCost5TBox="#trim(getQuote.hcpcCost5TBox)#"
		hcpcCode6TBox="#trim(getQuote.hcpcCode6TBox)#"
		hcpcQty6TBox="#trim(getQuote.hcpcQty6TBox)#"
		hcpcProduct6TBox="#trim(getQuote.hcpcProduct6TBox)#"
		hcpcDX6TBox="#trim(getQuote.hcpcDX6TBox)#"
		hcpcDiagnosis6TBox="#trim(getQuote.hcpcDiagnosis6TBox)#"
		hcpcCost6TBox="#trim(getQuote.hcpcCost6TBox)#"
		hcpcCode7TBox="#trim(getQuote.hcpcCode7TBox)#"
		hcpcQty7TBox="#trim(getQuote.hcpcQty7TBox)#"
		hcpcProduct7TBox="#trim(getQuote.hcpcProduct7TBox)#"
		hcpcDX7TBox="#trim(getQuote.hcpcDX7TBox)#"
		hcpcDiagnosis7TBox="#trim(getQuote.hcpcDiagnosis7TBox)#"
		hcpcCost7TBox="#trim(getQuote.hcpcCost7TBox)#"
		hcpcCode8TBox="#trim(getQuote.hcpcCode8TBox)#"
		hcpcQty8TBox="#trim(getQuote.hcpcQty8TBox)#"
		hcpcProduct8TBox="#trim(getQuote.hcpcProduct8TBox)#"
		hcpcDX8TBox="#trim(getQuote.hcpcDX8TBox)#"
		hcpcDiagnosis8TBox="#trim(getQuote.hcpcDiagnosis8TBox)#"
		hcpcCost8TBox="#trim(getQuote.hcpcCost8TBox)#"
		hcpcCode9TBox="#trim(getQuote.hcpcCode9TBox)#"
		hcpcQty9TBox="#trim(getQuote.hcpcQty9TBox)#"
		hcpcProduct9TBox="#trim(getQuote.hcpcProduct9TBox)#"
		hcpcDX9TBox="#trim(getQuote.hcpcDX9TBox)#"
		hcpcDiagnosis9TBox="#trim(getQuote.hcpcDiagnosis9TBox)#"
		hcpcCost9TBox="#trim(getQuote.hcpcCost9TBox)#"
		hcpcCode10TBox="#trim(getQuote.hcpcCode10TBox)#"
		hcpcQty10TBox="#trim(getQuote.hcpcQty10TBox)#"
		hcpcProduct10TBox="#trim(getQuote.hcpcProduct10TBox)#"
		hcpcDX10TBox="#trim(getQuote.hcpcDX10TBox)#"
		hcpcDiagnosis10TBox="#trim(getQuote.hcpcDiagnosis10TBox)#"
		hcpcCost10TBox="#trim(getQuote.hcpcCost10TBox)#"
		primaryInsuranceNameTBox="#trim(getQuote.primaryInsuranceNameTBox)#"
		secondaryInsuranceNameTBox="#trim(getQuote.secondaryInsuranceNameTBox)#"
		primaryPolicyNumberTBox="#trim(getQuote.primaryPolicyNumberTBox)#"
		secondaryPolicyNumberTBox="#trim(getQuote.secondaryPolicyNumberTBox)#"
		orderingPhysicianFNameTBox="#trim(getQuote.orderingPhysicianFNameTBox)#"
		orderingPhysicianMInitialTBox="#trim(getQuote.orderingPhysicianMInitialTBox)#"
		orderingPhysicianLNameTBox="#trim(getQuote.orderingPhysicianLNameTBox)#"
		orderingPhysicianPhoneTBox="#trim(getQuote.orderingPhysicianPhoneTBox)#">
			
			