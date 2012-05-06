<!---- tagQuotePrint.cfm ---->


	
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.ClientID" default="">
	<cfset ClientID = attributes.ClientID>
	
	<cfparam name="attributes.clientAddressAddressLine1" default="">
	<cfset clientAddressAddressLine1 = attributes.clientAddressAddressLine1>
	
	<cfparam name="attributes.clientAddressAddressLine2" default="">
	<cfset clientAddressAddressLine2 = attributes.clientAddressAddressLine2>
	
	<cfparam name="attributes.clientAddressCity" default="">
	<cfset clientAddressCity = attributes.clientAddressCity>
	
	<cfparam name="attributes.clientAddressStateFull" default="">
	<cfset clientAddressStateFull = attributes.clientAddressStateFull>
	
	<cfparam name="attributes.clientAddressZipCode" default="">
	<cfset clientAddressZipCode = attributes.clientAddressZipCode>
	
	<cfparam name="attributes.defaultPhone" default="">
	<cfset defaultPhone = attributes.defaultPhone>
	
	<cfparam name="attributes.faxPhone" default="">
	<cfset faxPhone = attributes.faxPhone>
				
	<cfif IsDefined("attributes.IntakeID") AND attributes.IntakeID NEQ "">
		<cfset ID = attributes.IntakeID>	
	<cfelseif IsDefined("attributes.QuoteID") AND attributes.QuoteID NEQ "">
		<cfset ID = attributes.QuoteID>		
	</cfif>
		
	<cfparam name="attributes.PatientFNameTBox" default="">
	<cfset PatientFNameTBox = attributes.PatientFNameTBox>
	
	<cfparam name="attributes.PatientLNameTBox" default="">
	<cfset PatientLNameTBox = attributes.PatientLNameTBox>
	
	<cfparam name="attributes.PatientPhoneTBox" default="">
	<cfset PatientPhoneTBox = attributes.PatientPhoneTBox>
	
	<cfparam name="attributes.PatientDOBMM" default="">
	<cfset PatientDOBMM = attributes.PatientDOBMM>
	
	<cfparam name="attributes.PatientDOBDD" default="">
	<cfset PatientDOBDD = attributes.PatientDOBDD>
	
	<cfparam name="attributes.PatientDOBYY" default="">
	<cfset PatientDOBYY = attributes.PatientDOBYY>
	
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
	
	<cfparam name="attributes.quoteNote" default="">
	<cfset quoteNote = attributes.quoteNote>	
		
	<cfparam name="attributes.faxCoverSheet" default="no">
	<cfset faxCoverSheet = attributes.faxCoverSheet>

				
	<!-------------------------------------------------------------------------------------->
	<!--- Start the display of the page.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cfsavecontent variable="caller.QuotePrintVariable">	
		
		<cfoutput>
		
			<style>	
		
				table.EOBList {
					border-collapse: collapse;
					font: x-small verdana, helvetica, sans-serif;
					margin: 10px;
				}
				table.EOBList caption {
					background-color: ##DCE3EB;
					color: ##003399;
					font-weight: bold;
					padding: 3px 10px 3px 10px;				
				}
				table.EOBList td {
					border: 0px solid ##DCE3EB;
					font-size: 95%;
					padding: 8px 4px 8px 8px;				
					/*vertical-align: top;	*/			
				}
				table.EOBList th {
					border: 0px solid ##DCE3EB;
					color: ##606060;
					font-weight: normal;
					padding: 2px 10px 1px 5px;				
				}					
				.EOBquoteTableBody TABLE{
				    font-size: 1em; 
				}
				.EOBquoteTableBody A:link, .EOBquoteTableBody A:visited{
				    color:##003399;
				    text-decoration:underline; 
				}
				.EOBquoteTableBody A:hover{
				    color:red;
				    text-decoration:none; 
				}
				.EOBquoteTableBody th{
				    font-weight:bold; 
				}
				.EOBquoteTableBody td {
				    font-size: 10pt; 
				    font-family: verdana, arial, helvetica, sans-serif; 
				}					
			</style>
					
			<span width="100%" class="EOBquoteTableBody">	
								
				<!-------------------------------------------------------------------------------------->
				<!--- Start the actual page for the quote.                                           --->
				<!-------------------------------------------------------------------------------------->						
				<table width="800" cellspacing="2" cellpadding="2" border="0">							
					<cfif trim(faxCoverSheet) EQ "no">
						<tr>
						    <td>
								<img src=file:///#trim(request.fmsPath)#/images/logo_#trim(ClientID)#.gif border="0" alt="">								
							</td>
							<td class="siteLabel" align="right" valign="top">									
								#trim(clientAddressAddressLine1)#
								<cfif trim(clientAddressAddressLine2) NEQ ""><br>#trim(clientAddressAddressLine2)#</cfif>
								<br>#trim(clientAddressCity)#, #trim(clientAddressStateFull)# #trim(clientAddressZipCode)#
								<cfif trim(defaultPhone) NEQ ""><br>Office: #request.formatPhoneUS(defaultPhone)#</cfif>
								<cfif trim(faxPhone) NEQ ""><br>Fax: #request.formatPhoneUS(faxPhone)#</cfif>									
							</td>
						</tr>
					<cfelse>
						<tr>
						    <td colspan="2" align="center">
								&nbsp;							
							</td>							
						</tr>								
					</cfif>						
					<tr>
					    <td colspan="2" align="center">
							<font face="Arial Black" size="4">QUOTE</font>							
						</td>							
					</tr>
					
					<tr>
					    <td colspan="2" align="center">
							<table width="600" cellspacing="2" cellpadding="2" border="0">
								<tr>
									<td>
										<span width="100%" class="EOBquoteTableBody">	
											<table cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td align="center">												
														<table class="EOBList" border="0" cellpadding="0" cellspacing="0">					
															<tr>
																<td colspan="2" style="background-color: ##DCE3EB;color: ##003399;font-weight: bold;font-size: 12px; padding: 3px 10px 3px 4px; border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: c0c0c0;">
																	Quote&nbsp;Information
																</td>
															</tr>
															<tr>
																<td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: c0c0c0;" align="right"><strong><cfif IsDefined("attributes.IntakeID") AND attributes.IntakeID NEQ "">Intake<cfelseif IsDefined("attributes.QuoteID") AND attributes.QuoteID NEQ "">Quote</cfif>&nbsp;ID:</strong></td>	
																<td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: c0c0c0;">#trim(ID)#</td>							
															</tr>
															<tr>
																<td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: c0c0c0;" align="right"><strong>Date:</strong></td>	
																<td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: c0c0c0;">#DateFormat(NOW(), 'mm/dd/yyyy')#</td>							
															</tr>																															
														</table>										
													</td>
												</tr>					
											</table>				
										</span>
									</td>
									<td align="right">
										<span width="100%" class="EOBquoteTableBody">	
											<table cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td align="center">												
														<table class="EOBList" border="0" cellpadding="0" cellspacing="0">					
															<tr>
																<td colspan="2" style="background-color: ##DCE3EB;color: ##003399;font-weight: bold;font-size: 12px; padding: 3px 10px 3px 4px; border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: c0c0c0;">
																	Patient&nbsp;Information
																</td>
															</tr>
															<tr>
																<td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: c0c0c0;" align="right"><strong>Name:</strong></td>	
																<td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: c0c0c0;">#request.CapitalizeFirstLetter(PatientFNameTBox)#&nbsp;#request.CapitalizeFirstLetter(PatientLNameTBox)#</td>							
															</tr>
															<tr>
																<td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: c0c0c0;" align="right"><strong>Phone:</strong></td>	
																<td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: c0c0c0;">#request.formatPhoneUS(PatientPhoneTBox)#</td>							
															</tr>
															<tr>
																<td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: c0c0c0;" align="right"><strong>DOB:</strong></td>	
																<td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: c0c0c0;">#PatientDOBMM#/#PatientDOBDD#/#PatientDOBYY#</td>							
															</tr>															
														</table>										
													</td>
												</tr>					
											</table>				
										</span>
									</td>										
								</tr>
							</table>													
						</td>				
					</tr>		
					
					<tr>
						<td colspan="2" valign="top" align="center">		
							<span width="100%" class="EOBquoteTableBody">	
								<table cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td align="center">	
											
											<table class="EOBList" border="0" cellpadding="0" cellspacing="0">					
												<tr>
													<td style="background-color: ##DCE3EB;color: ##003399;font-weight: bold;font-size: 12px; padding: 3px 10px 3px 4px; border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: c0c0c0;">
														DESCRIPTION
													</td>
													<td style="background-color: ##DCE3EB;color: ##003399;font-weight: bold;font-size: 12px; padding: 3px 10px 3px 4px; border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: c0c0c0;">
														QTY
													</td>
													<td style="background-color: ##DCE3EB;color: ##003399;font-weight: bold;font-size: 12px; padding: 3px 10px 3px 4px; border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: c0c0c0;">
														COST
													</td>
													<td align="center" style="background-color: ##DCE3EB;color: ##003399;font-weight: bold;font-size: 12px; padding: 3px 10px 3px 4px; border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: c0c0c0;">
														AMOUNT
													</td>
												</tr>	
												
												<cfset subTotal = 0>
												
												<cfloop from="1" to="40" index="i">
													
													<cfset methodhcpcCodeTBox = "hcpcCode#trim(i)#TBox">
													<cfset methodhcpcQtyTBox = "hcpcQty#trim(i)#TBox">
													<cfset methodhcpcProductTBox = "hcpcProduct#trim(i)#TBox">
													<cfset methodhcpcCostTBox = "hcpcCost#trim(i)#TBox">
													<cfset methodhcpcDXTBox = "hcpcDX#trim(i)#TBox">
													<cfset methodhcpcDiagnosisTBox = "hcpcDiagnosis#trim(i)#TBox">
													
													<cfset hcpcCodeTBox = evaluate(methodhcpcCodeTBox)>
													<cfset hcpcQtyTBox = evaluate(methodhcpcQtyTBox)>
													<cfset hcpcProductTBox = evaluate(methodhcpcProductTBox)> 
													<cfset hcpcCostTBox = evaluate(methodhcpcCostTBox)>
													<cfset hcpcDXTBox = evaluate(methodhcpcDXTBox)>
													<cfset hcpcDiagnosisTBox = evaluate(methodhcpcDiagnosisTBox)>
													
													<cfif trim(hcpcProductTBox) NEQ "" AND trim(hcpcCostTBox) NEQ "" AND trim(hcpcQtyTBox) NEQ "">
														
														<cfset extended = evaluate(trim(hcpcCostTBox) * trim(hcpcQtyTBox))>
														
														<cfset subTotal = evaluate(subTotal + extended)> 
														
														<tr>
															<td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: c0c0c0;">#trim(hcpcProductTBox)#</td>	
															<td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: c0c0c0;" align="center">#trim(hcpcQtyTBox)#</td>	
															<td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: c0c0c0;" align="right">#DollarFormat(trim(hcpcCostTBox))#</td>	
															<td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: c0c0c0;" align="right">#DollarFormat(trim(extended))#</td>							
														</tr>
													</cfif>
														
												</cfloop>													
													
												<tr>
													<td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: c0c0c0;" colspan="3" align="right"><strong>Total:</strong></td>	
													<td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: c0c0c0;" align="right">#DollarFormat(trim(subTotal))#</td>							
												</tr>
												<!---<tr>
													<td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: c0c0c0;" colspan="3" align="right"><strong>Tax:</strong></td>	
													<td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: c0c0c0;" align="right">&nbsp;</td>							
												</tr>
												<tr>
													<td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: c0c0c0;" colspan="3" align="right"><strong>Total:</strong></td>	
													<td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: c0c0c0;" align="right">&nbsp;</td>							
												</tr>		--->										
																													
											</table>
																								
										</td>
									</tr>					
								</table>				
							</span>
						</td>			
					</tr>
												
					<tr>
					    <td colspan="2">&nbsp;</td>							
					</tr>	
					
					<tr>
					    <td colspan="2" align="center">
							<table width="600" cellspacing="2" cellpadding="2" border="0">
								<tr>
									<td><strong>NOTE:</strong> #trim(quoteNote)#</td>
								</tr>
							</table>													
						</td>							
					</tr>												
					
				</table>
			</span>									
		
		</cfoutput>
	
	</cfsavecontent>
	
	
	
	