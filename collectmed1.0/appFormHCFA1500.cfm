<!---- appFormHCFA1500.cfm ---->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formName" default="HCFAForm">
	<cfset formName = attributes.formName>
		
	<cfparam name="attributes.claimID" default="">
	<cfset claimID = attributes.claimID>
	
	<cfif IsDefined("form.claimID") AND form.claimID NEQ "">
		<cfset claimID = form.claimID>
	<cfelseif IsDefined("url.claimID") AND url.claimID NEQ "">
		<cfset claimID = url.claimID>	
	</cfif>
	
	<cfset deductTotal = "0.00">
	
	<cfset monetaryColumns = "MonetaryAmount3,MonetaryAmount6,MonetaryAmount9,MonetaryAmount12,MonetaryAmount15,MonetaryAmount18">
	
	
	
	
		
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
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="claimID"
		fieldnames="Claim ID"
		datatypes="numeric">


				
<!-------------------------------------------------------------------------------------->
<!--- Get the ClaimID parameters.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cftry>
		
		<cfset request.thisClaim = CreateObject("component","com.common.Claim")>	
		<cfset request.thisClaim.Init(trim(claimID))>	
		
		<Cfset entityID = trim(request.thisClaim.getEntityID())>
		
		<cfset request.thisPatientEntity = CreateObject("component","com.common.Entity")>	
		<cfset request.thisPatientEntity.Init(trim(entityID))>
				
		<cfset HCFA_2_TBox_PatientName = request.thisPatientEntity.getLName() & ', ' & request.thisPatientEntity.getFName()>	
		<cfif request.thisPatientEntity.getMName() NEQ "">
			 <cfset HCFA_2_TBox_PatientName = HCFA_2_TBox_PatientName & ', ' & request.thisPatientEntity.getMName()>
		</cfif>
		
		<cfset HCFA_3_CBox_Sex = request.thisPatientEntity.getSex()>		
		<cfif HCFA_3_CBox_Sex EQ "NULL">
			<cfset HCFA_3_CBox_Sex = -1>
		</cfif>
		
		<cfset PatientMaritalStatus = trim(request.thisPatientEntity.getMaritalStatus())>
		<cfif PatientMaritalStatus EQ "NULL">
			<cfset PatientMaritalStatus = -1>
		</cfif>
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Address section                                                                --->
		<!-------------------------------------------------------------------------------------->		
		<cfset Addresses = request.thisPatientEntity.getEntityAddresses(clientID: trim(session.clientID), entityID: entityID, Active: 1)>				
		
		<cfset count = 0>
		
		<cfoutput>
			
			<script language="JavaScript">				
				var IsDefault = new Array();
				var AddressID = new Array();
				var AddressType = new Array();
				var AddressTypeID = new Array();
				var AddressLine1 = new Array();
				var AddressLine2 = new Array();
				var City = new Array();
				var StateID = new Array();
				var StateFull = new Array();
				var StateAbbr = new Array();
				var ZipCode = new Array();		
			</script>		
				
			<script language="JavaScript">
				<cfloop query="Addresses">						
					<cfset count = count + 1>							
					IsDefault[#trim(count)#] = "#trim(IsDefault)#";		
					AddressID[#trim(count)#] = "#trim(AddressID)#";		
					AddressType[#trim(count)#] = "#trim(AddressType)#";		
					AddressTypeID[#trim(count)#] = "#trim(AddressTypeID)#";		
					AddressLine1[#trim(count)#] = "#trim(AddressLine1)#";		
					AddressLine2[#trim(count)#] = "#trim(AddressLine2)#";		
					City[#trim(count)#] = "#trim(City)#";		
					StateID[#trim(count)#] = "#trim(StateID)#";		
					StateFull[#trim(count)#] = "#trim(StateFull)#";		
					StateAbbr[#trim(count)#] = "#trim(StateAbbr)#";		
					ZipCode[#trim(count)#] = "#trim(ZipCode)#";							
				</cfloop> 	
			</script>	
		</cfoutput>		
		
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Phone section                                                                  --->
		<!-------------------------------------------------------------------------------------->		
		<cfset Phones = request.thisPatientEntity.getEntityPhones(clientID: trim(session.clientID), EntityID: entityID, Active: 1)>				
		
		<cfset Patientcount = 0>
		
		<cfoutput>
			
			<script language="JavaScript">					
				var PatientPhoneID = new Array();
				var PatientPhoneArea = new Array();				
				var PatientPhoneNumber = new Array();				
			</script>		
				
			<script language="JavaScript">
				<cfloop query="Phones">						
					<cfset Patientcount = Patientcount + 1>
					
					PatientPhoneID[#trim(Patientcount)#] = "#trim(PhoneID)#";		
					
					<cfset PatientPhoneNumberD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(PhoneNumber)) />
					<cfset PatientPhoneExtensionD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(PhoneExtension)) />
					
					<cfset PatientphonePartsList = REQUEST.returnPhonePartsList(trim(PatientPhoneNumberD))>
						
					<cfif ListLen(PatientphonePartsList) GTE 2>
						<cfset PatientPhoneAreaCode = "#ListGetAt(PatientphonePartsList,2)#">	
					<cfelse>
						<cfset PatientPhoneAreaCode = "">	
					</cfif>
					PatientPhoneArea[#trim(Patientcount)#] = "#trim(PatientPhoneAreaCode)#";	
					
					<cfif ListLen(PatientphonePartsList) GTE 3>
						<cfset PatientPhonePre = "#ListGetAt(PatientphonePartsList,3)#">	
					<cfelse>
						<cfset PatientPhonePre = "">	
					</cfif>
					<cfif ListLen(PatientphonePartsList) GTE 4>
						<cfset PatientPhoneMain = "#ListGetAt(PatientphonePartsList,4)#">	
					<cfelse>
						<cfset PatientPhoneMain = "">	
					</cfif>
					
					<cfset PatientPhoneNumberNew = trim(PatientPhonePre) & "-" & trim(PatientPhoneMain)>
					<cfif PatientPhoneExtensionD NEQ "">
						<cfset PatientPhoneNumberNew = PatientPhoneNumberNew & " ext." & PatientPhoneExtensionD>
					</cfif>
					
					PatientPhoneNumber[#trim(Patientcount)#] = "#trim(PatientPhoneNumberNew)#"				
																							
				</cfloop> 	
			</script>	
		</cfoutput>		
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the information on this specific patient.                                  --->
		<!-------------------------------------------------------------------------------------->	
		<cfquery name="getPatientID" datasource="#trim(request.datasource)#">
			SELECT p.PatientID
			FROM patient p
			WHERE p.EntityID = #trim(request.thisClaim.getEntityID())#
		</cfquery>
						
		<cfset request.thisPatient = CreateObject("component", "com.common.Patient").init(getPatientID.patientID)>
		<cfset patientsInsuranceCompanies = request.thisPatient.getPatientInsCom(getPatientID.patientID)>
				
		
		<!-------------------------------------------------------------------------------------->
		<!--- Because the patient has insurance companies assigned to them we will create    --->
		<!--- an array that will hold them. This way we can dynamically fill the insurance   --->
		<!--- portion of the HCFA-1500                                                       --->
		<!-------------------------------------------------------------------------------------->			
		<cfif patientsInsuranceCompanies.RecordCount GTE 1>
			
			<script language="JavaScript">	
				var insuranceCompanyID = new Array();
				var insuranceCompanyName = new Array();
				var addressID = new Array();
				var addressID = new Array();
				var addressLine1 = new Array();
				var addressLine2 = new Array();
				var addressType = new Array();
				var addressTypeID = new Array();
				var city = new Array();
				var isDefault = new Array();
				var stateAbbr = new Array();
				var stateFull = new Array();
				var stateID = new Array();
				var zipCode = new Array();				
				var PolicyNumber = new Array();	
				var PolicyHoldersFirstName = new Array();	
				var PolicyHoldersLastName = new Array();	
				var PolicyHoldersMiddleInitial = new Array();	
				var PolicyHoldersDOB_MM = new Array();	
				var PolicyHoldersDOB_DD = new Array();	
				var PolicyHoldersDOB_YY = new Array();	
				var PolicyHoldersSex = new Array();	
				var PolicyHoldersAddressLine1 = new Array();	
				var PolicyHoldersAddressLine2 = new Array();	
				var PolicyHoldersCity = new Array();	
				var PolicyHoldersStateID = new Array();	
				var PolicyHoldersZipCode = new Array();									
				var PolicyHoldersPhoneNumber = new Array();	
				var PolicyHoldersPhoneAreaCode = new Array();					
				var PolicyHoldersPhoneExtension = new Array();	
				var PolicyHoldersEmployerSchoolName = new Array();					
				var GroupNumber = new Array();	
				var GroupName = new Array();	
				var Relationship = new Array();								
			</script>	
						
			<cfset request.InsuranceCompany = CreateObject("component","com.common.InsuranceCompany")>	
			
			<cfset count = 0>
			
			<cfloop query="patientsInsuranceCompanies">
									
				<cfset InsuranceCompany = request.InsuranceCompany.init(insuranceCompanyID)> 
				<cfset insuranceCompanyEntityID = InsuranceCompany.getEntityID()> 
				<cfset thisAddressQ = request.thisPatientEntity.getEntityDefaultFullAddress(clientID: trim(session.clientID), entityid: trim(insuranceCompanyEntityID))>
				<cfoutput>
					<script language="JavaScript">
						insuranceCompanyID[#trim(count)#] = "#trim(insuranceCompanyID)#"
						insuranceCompanyName[#trim(count)#] = "#trim(InsuranceCompany.getinsuranceCompanyName())#"
						addressID[#trim(count)#] = "#trim(thisAddressQ.addressID)#"					
						addressLine1[#trim(count)#] = "#trim(thisAddressQ.addressLine1)#"
						addressLine2[#trim(count)#] = "#trim(thisAddressQ.addressLine2)#"
						addressType[#trim(count)#] = "#trim(thisAddressQ.addressType)#"
						addressTypeID[#trim(count)#] = "#trim(thisAddressQ.addressTypeID)#"
						city[#trim(count)#] = "#trim(thisAddressQ.city)#"
						isDefault[#trim(count)#] = "#trim(thisAddressQ.isDefault)#"
						stateAbbr[#trim(count)#] = "#trim(thisAddressQ.stateAbbr)#"
						stateFull[#trim(count)#] = "#trim(thisAddressQ.stateFull)#"
						stateID[#trim(count)#] = "#trim(thisAddressQ.stateID)#"
						<cfif len(trim(thisAddressQ.zipCode)) GTE 6 AND NOT FindNoCase("-", thisAddressQ.zipCode)>
						<cfset ZipCode = REQUEST.InsertAt(thisAddressQ.zipCode, "-", 6)>												
						<cfelse>
						<cfset ZipCode = trim(thisAddressQ.zipCode)>	
						</cfif>
						zipCode[#trim(count)#] = "#trim(ZipCode)#"						
						PolicyNumber[#trim(count)#] = "#trim(PolicyNumber)#"
						PolicyHoldersFirstName[#trim(count)#] = "#trim(PolicyHoldersFirstName)#"	
						PolicyHoldersLastName[#trim(count)#] = "#trim(PolicyHoldersLastName)#"	
						PolicyHoldersMiddleInitial[#trim(count)#] = "#trim(PolicyHoldersMiddleInitial)#"	
						<cfif NOT IsDate(PolicyHoldersDOB)>
						PolicyHoldersDOB_MM[#trim(count)#] = ""	
						PolicyHoldersDOB_DD[#trim(count)#] = ""	
						PolicyHoldersDOB_YY[#trim(count)#] = ""
						<cfelse>
						PolicyHoldersDOB_MM[#trim(count)#] = "#DateFormat(trim(PolicyHoldersDOB), 'MM')#"	
						PolicyHoldersDOB_DD[#trim(count)#] = "#DateFormat(trim(PolicyHoldersDOB), 'DD')#"	
						PolicyHoldersDOB_YY[#trim(count)#] = "#DateFormat(trim(PolicyHoldersDOB), 'YY')#"	
						</cfif>
						PolicyHoldersSex[#trim(count)#] = "#trim(PolicyHoldersSex)#"	
						PolicyHoldersAddressLine1[#trim(count)#] = "#trim(PolicyHoldersAddressLine1)#"	
						PolicyHoldersAddressLine2[#trim(count)#] = "#trim(PolicyHoldersAddressLine2)#"	
						PolicyHoldersCity[#trim(count)#] = "#trim(PolicyHoldersCity)#"							
						
						<cfif isNumeric(#trim(PolicyHoldersStateID)#)>
							<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" fields="ItemDescription" standardlistItemID="#trim(PolicyHoldersStateID)#" listid="4" active="1" returnvariable="getStateDesc">
							PolicyHoldersStateID[#trim(count)#] = "#trim(getStateDesc.ItemDescription)#"							
						<cfelse>
							PolicyHoldersStateID[#trim(count)#] = ""			
						</cfif>
						
						PolicyHoldersZipCode[#trim(count)#] = "#trim(PolicyHoldersZipCode)#"						
						
						<cfset phonePartsList = REQUEST.returnPhonePartsList(trim(PolicyHoldersPhone))>
						
						<cfif ListLen(phonePartsList) GTE 2>
							<cfset PhoneAreaCode = "#ListGetAt(phonePartsList,2)#">	
						<cfelse>
							<cfset PhoneAreaCode = "">	
						</cfif>
						PolicyHoldersPhoneAreaCode[#trim(count)#] = "#trim(PhoneAreaCode)#"	
						
						<cfif ListLen(phonePartsList) GTE 3>
							<cfset PhonePre = "#ListGetAt(phonePartsList,3)#-">	
						<cfelse>
							<cfset PhonePre = "">	
						</cfif>
						<cfif ListLen(phonePartsList) GTE 4>
							<cfset PhoneMain = "#ListGetAt(phonePartsList,4)#">	
						<cfelse>
							<cfset PhoneMain = "">	
						</cfif>
						
						PolicyHoldersPhoneNumber[#trim(count)#] = "#trim(PhonePre)##trim(PhoneMain)#"	
																		
						PolicyHoldersPhoneExtension[#trim(count)#] = "#trim(PolicyHoldersPhoneExtension)#"
						PolicyHoldersEmployerSchoolName[#trim(count)#] = "#trim(PolicyHoldersEmployerSchoolName)#"							
						GroupNumber[#trim(count)#] = "#trim(GroupNumber)#"	
						GroupName[#trim(count)#] = "#trim(GroupName)#"	
						Relationship[#trim(count)#] = "#trim(Relationship)#"
				
					</script>
				</cfoutput>
				
				<cfset count = count + 1>
				
			</cfloop>	
				
		</cfif>		
		
		
			
					
		<!-------------------------------------------------------------------------------------->
		<!--- Get the information on this specific patient.                                  --->
		<!-------------------------------------------------------------------------------------->	
			<cfquery name="getClaimDetails" datasource="#trim(request.datasource)#">
				SELECT i.LXAssignedNumber, c.ClaimID, c.InterchangeClaimID, c.InterchangeID, c.clientAssignedClaimID, c.claimType, c.EntityID, 
				c.PatientResponsibilityAmount, c.claimpreviousPaidAmount, c.InterchangeID, c.assignedToUserID, c.Active, c.InactiveCode, c.DateCreated, 
				c.DueDate, c.FacilityCode, c.CrossoverNameLastorOrganizationName3, 		
				u.usersID, e.FName As userFName, e.LName AS userLName, TIMESTAMPDIFF(day, c.DateCreated, now()) AS days, 
				p.PatientID, c.HICNumber, patientEntity.FName AS patientFName, patientEntity.LName AS patientLName
				FROM claim c 
				LEFT JOIN pa_master.Users u ON c.AssignedToUserID = u.UsersID 
				LEFT JOIN Entity e ON u.EntityID = e.EntityID
				LEFT JOIN [Procedure] cp ON c.ClaimID = cp.ClaimID
				LEFT JOIN Entity patientEntity ON c.entityID = patientEntity.EntityID				
				LEFT JOIN Patient p ON c.entityID = p.EntityID
				LEFT JOIN Interchange i ON c.InterchangeID = i.InterchangeID						
				WHERE c.ClientID = #trim(session.ClientID)# AND c.Active = 1 AND c.claimID = #trim(claimID)#
			</cfquery>	
	
		<!---------------------------------------------------------------------------------------->
		<!--- Get all the Procedures for this Claim and put them in the query to loop through. --->
		<!---------------------------------------------------------------------------------------->			
			<cfquery name="getProcedures" datasource="#trim(request.datasource)#">
				SELECT cp.ProcedureID, cp.ProcedureCode, cp.PriorProcedureCode, cp.ServiceDateFrom, cp.ServiceDateTo, cp.BilledQuantity, cp.BilledAmount, 
				cp.PaidQuantity, cp.PaidAmount, pc.HCPC, c.FacilityCode		
				FROM [Procedure] cp
				LEFT JOIN pa_master.EOB_MEDICARE_PROCEDURECode pc ON cp.ProcedureCode = pc.RecordID
				JOIN Claim c ON cp.ClaimID = c.claimID
				WHERE cp.ClaimID = #trim(ClaimID)#				
			</cfquery>							
			
			<cfquery name="getClaimProceduresTotals" datasource="#trim(request.datasource)#">
				SELECT SUM(BilledAmount) AS ClaimTotalBilled, SUM(PaidAmount) AS ClaimTotalPaid					
				FROM [Procedure] 
				WHERE ClaimID = #trim(ClaimID)#		
			</cfquery>	
	
	
							
		<cfcatch type="Any">
			<cf_gcGeneralErrorTemplate
				message="There was an issue processing the page. If you continue to see this message please contact your site administrator. <p>Claim ID: 2</p><p> Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p>">
			<cfabort>
		</cfcatch>
				
	</cftry>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->		
<cfoutput>	

	<script language="JavaScript">				
		function changeInsuranceCompany(id){
			var temp = -1;
			for (i = 0; i < insuranceCompanyID.length; i++){
				if(insuranceCompanyID[i] == id){
					temp = i;
				}					
			};					
			if(temp > -1){
				document.#trim(formName)#.HCFA_0_TBox_NameAddressSendToInsurance_Name.value = insuranceCompanyName[temp];
				document.#trim(formName)#.HCFA_0_TBox_NameAddressSendToInsurance_AddressLine1.value = addressLine1[temp];
				document.#trim(formName)#.HCFA_0_TBox_NameAddressSendToInsurance_AddressLine2.value = addressLine2[temp];	
				document.#trim(formName)#.HCFA_0_TBox_NameAddressSendToInsurance_City.value = city[temp];	
				document.#trim(formName)#.HCFA_0_TBox_NameAddressSendToInsurance_State.value = stateAbbr[temp];
				document.#trim(formName)#.HCFA_0_TBox_NameAddressSendToInsurance_ZipCode.value = zipCode[temp];
			}
			else{
				document.#trim(formName)#.HCFA_0_TBox_NameAddressSendToInsurance_Name.value = "";
				document.#trim(formName)#.HCFA_0_TBox_NameAddressSendToInsurance_AddressLine1.value = "";
				document.#trim(formName)#.HCFA_0_TBox_NameAddressSendToInsurance_AddressLine2.value = "";	
				document.#trim(formName)#.HCFA_0_TBox_NameAddressSendToInsurance_City.value = "";	
				document.#trim(formName)#.HCFA_0_TBox_NameAddressSendToInsurance_State.value = "";
				document.#trim(formName)#.HCFA_0_TBox_NameAddressSendToInsurance_ZipCode.value = "";
			}
		};
		
		
		function changeInsuranceCompanyInsured(id){		
			var temp = -1;
			for (i = 0; i < insuranceCompanyID.length; i++){
				if(insuranceCompanyID[i] == id){
					temp = i;
				}					
			};					
			if(temp > -1){
				
				fullname = PolicyHoldersFirstName[temp];
				
				if(PolicyHoldersLastName[temp] != ''){
					fullname = PolicyHoldersLastName[temp] + ", " + fullname;	
				}
				if(PolicyHoldersMiddleInitial[temp] != ''){
					fullname = fullname +  ", " + PolicyHoldersMiddleInitial[temp];
				}				
				
				document.#trim(formName)#.HCFA_4_TBox_InsuredsName.value = fullname;				
				document.#trim(formName)#.HCFA_7_TBox_InsuredsAddressNoStreet.value = PolicyHoldersAddressLine1[temp] + " " + PolicyHoldersAddressLine2[temp];
				document.#trim(formName)#.HCFA_7_TBox_InsuredsAddressCity.value = PolicyHoldersCity[temp];
				document.#trim(formName)#.HCFA_7_TBox_InsuredsAddressState.value = PolicyHoldersStateID[temp];
				document.#trim(formName)#.HCFA_7_TBox_InsuredsAddressZipCode.value = PolicyHoldersZipCode[temp];
				document.#trim(formName)#.HCFA_7_TBox_InsuredsTelephoneAreaCode.value = PolicyHoldersPhoneAreaCode[temp];
				
				thisPolicyHoldersPhoneNumber = PolicyHoldersPhoneNumber[temp];
				if(PolicyHoldersPhoneExtension[temp] != ''){
					thisPolicyHoldersPhoneNumber = thisPolicyHoldersPhoneNumber + " ext." + PolicyHoldersPhoneExtension[temp];	
				}				
				document.#trim(formName)#.HCFA_7_TBox_InsuredsTelephoneNumber.value = thisPolicyHoldersPhoneNumber;	
				
				document.#trim(formName)#.HCFA_1a_TBox_InsuredsIDNumber.value = PolicyNumber[temp];
				document.#trim(formName)#.HCFA_26_TBox_PatientsAccountNumber.value = PolicyNumber[temp];
				document.#trim(formName)#.HCFA_11_TBox_InsuredsPolicyGroupFecaNumber.value = GroupNumber[temp];				
				document.#trim(formName)#.HCFA_11_TBox_a_InsuredsBirthDateMM.value = PolicyHoldersDOB_MM[temp];	
				document.#trim(formName)#.HCFA_11_TBox_a_InsuredsBirthDateDD.value = PolicyHoldersDOB_DD[temp];	
				document.#trim(formName)#.HCFA_11_TBox_a_InsuredsBirthDateYY.value = PolicyHoldersDOB_YY[temp];	
				document.#trim(formName)#.HCFA_11_TBox_b_EmployersNameOrSchoolName.value = PolicyHoldersEmployerSchoolName[temp];
				document.#trim(formName)#.HCFA_11_TBox_c_InsurancePlanNameOrProgramName.value = insuranceCompanyName[temp];					
				if(PolicyHoldersSex[temp] == 0){ 
					checkBoxRadio('CheckUncheckPic_11a', 'HCFA_11_CBox_a_Sex_Male')
				}				
				else if(PolicyHoldersSex[temp] == 1){	
					checkBoxRadio('CheckUncheckPic_11a', 'HCFA_11_CBox_a_Sex_Female')
		  		};	
								
				if(Relationship[temp] == 203){ 
					checkBoxRadio('CheckUncheckPic_6', 'HCFA_6_CBox_PATIENTRELTOINSURED_Self')
				}				
				else if(Relationship[temp] == 204){	
					checkBoxRadio('CheckUncheckPic_6', 'HCFA_6_CBox_PATIENTRELTOINSURED_Spouse')
  				}
				else if(Relationship[temp] == 205){	
					checkBoxRadio('CheckUncheckPic_6', 'HCFA_6_CBox_PATIENTRELTOINSURED_Child')
  				}
				else if(Relationship[temp] == 206){	
					checkBoxRadio('CheckUncheckPic_6', 'HCFA_6_CBox_PATIENTRELTOINSURED_Other')
  				};												
			}
			else{
				document.#trim(formName)#.HCFA_4_TBox_InsuredsName.value = "";	
				document.#trim(formName)#.HCFA_7_TBox_InsuredsAddressNoStreet.value = "";	
				document.#trim(formName)#.HCFA_7_TBox_InsuredsAddressCity.value = "";
				document.#trim(formName)#.HCFA_7_TBox_InsuredsAddressState.value = "";
				document.#trim(formName)#.HCFA_7_TBox_InsuredsAddressZipCode.value = "";
				document.#trim(formName)#.HCFA_7_TBox_InsuredsTelephoneAreaCode.value = "";
				document.#trim(formName)#.HCFA_7_TBox_InsuredsTelephoneNumber.value = "";		
				document.#trim(formName)#.HCFA_1a_TBox_InsuredsIDNumber.value = "";
				document.#trim(formName)#.HCFA_26_TBox_PatientsAccountNumber.value = "";				
				document.#trim(formName)#.HCFA_11_TBox_InsuredsPolicyGroupFecaNumber.value = "";
				document.#trim(formName)#.HCFA_11_TBox_a_InsuredsBirthDateMM.value = "";	
				document.#trim(formName)#.HCFA_11_TBox_a_InsuredsBirthDateDD.value = "";	
				document.#trim(formName)#.HCFA_11_TBox_a_InsuredsBirthDateYY.value = "";	
				document.#trim(formName)#.HCFA_11_TBox_b_EmployersNameOrSchoolName.value = "";
				document.#trim(formName)#.HCFA_11_TBox_c_InsurancePlanNameOrProgramName.value = "";	
				checkBoxRadio('CheckUncheckPic_11a', '')	
				checkBoxRadio('CheckUncheckPic_6', '')		
			}
		};		
		
		
		function changeInsuranceCompanyOther(id){		
			var temp = -1;
			for (i = 0; i < insuranceCompanyID.length; i++){
				if(insuranceCompanyID[i] == id){
					temp = i;
				}					
			};					
			if(temp > -1){
				fullname = PolicyHoldersLastName[temp] + ", " + PolicyHoldersFirstName[temp];	
				if(PolicyHoldersMiddleInitial[temp] != ''){
					fullname = fullname +  ", " + PolicyHoldersMiddleInitial[temp];
				}				
				document.#trim(formName)#.HCFA_9_TBox_a_OtherInsuredsPolicyGroupFecaNumber.value = PolicyNumber[temp];
				document.#trim(formName)#.HCFA_9_TBox_OtherInsuredsName.value = fullname;				
				//document.#trim(formName)#.HCFA_9_TBox_a_OtherInsuredsPolicyGroupFecaNumber.value = GroupNumber[temp];				
				document.#trim(formName)#.HCFA_9_TBox_b_OtherInsuredsBirthDateMM.value = PolicyHoldersDOB_MM[temp];	
				document.#trim(formName)#.HCFA_9_TBox_b_OtherInsuredsBirthDateDD.value = PolicyHoldersDOB_DD[temp];	
				document.#trim(formName)#.HCFA_9_TBox_b_OtherInsuredsBirthDateYY.value = PolicyHoldersDOB_YY[temp];	
				document.#trim(formName)#.HCFA_9_TBox_c_EmployersNameOrSchoolName.value = PolicyHoldersEmployerSchoolName[temp];
				document.#trim(formName)#.HCFA_9_TBox_d_InsurancePlanNameOrProgramName.value = insuranceCompanyName[temp];					
				if(PolicyHoldersSex[temp] == 0){ 
					checkBoxRadio('CheckUncheckPic_9b', 'HCFA_9_CBox_b_Sex_Male')
				}				
				else if(PolicyHoldersSex[temp] == 1){	
					checkBoxRadio('CheckUncheckPic_9b', 'HCFA_9_CBox_b_Sex_Female')
		  		};							
			}
			else{				
				document.#trim(formName)#.HCFA_9_TBox_OtherInsuredsName.value = "";					
				document.#trim(formName)#.HCFA_9_TBox_a_OtherInsuredsPolicyGroupFecaNumber.value = "";
				document.#trim(formName)#.HCFA_9_TBox_b_OtherInsuredsBirthDateMM.value = "";	
				document.#trim(formName)#.HCFA_9_TBox_b_OtherInsuredsBirthDateDD.value = "";	
				document.#trim(formName)#.HCFA_9_TBox_b_OtherInsuredsBirthDateYY.value = "";	
				document.#trim(formName)#.HCFA_9_TBox_c_EmployersNameOrSchoolName.value = "";
				document.#trim(formName)#.HCFA_9_TBox_d_InsurancePlanNameOrProgramName.value = "";	
				checkBoxRadio('CheckUncheckPic_9b', '')			
			}
		};		
			
		
		function changePatientAddress(id){
		
			var temp = -1;
			for (i = 0; i < AddressID.length; i++){
				if(AddressID[i] == id){
					temp = i;
				}					
			};					
			if(temp > -1){						
				document.#trim(formName)#.HCFA_5_TBox_PatientAddressNoStreet.value = AddressLine1[temp] + " " + AddressLine2[temp];
				document.#trim(formName)#.HCFA_5_TBox_PatientAddressCity.value = City[temp];
				document.#trim(formName)#.HCFA_5_TBox_PatientAddressState.value = StateAbbr[temp];
				document.#trim(formName)#.HCFA_5_TBox_PatientAddressZipCode.value = ZipCode[temp];
			}
			else{
				document.#trim(formName)#.HCFA_5_TBox_PatientAddressNoStreet.value = "";
				document.#trim(formName)#.HCFA_5_TBox_PatientAddressCity.value = "";
				document.#trim(formName)#.HCFA_5_TBox_PatientAddressState.value = "";
				document.#trim(formName)#.HCFA_5_TBox_PatientAddressZipCode.value = "";							
			};
		
		};
		
		
		function changePatientPhone(id){
			var temp = -1;
			for (i = 0; i < PatientPhoneID.length; i++){
				if(PatientPhoneID[i] == id){
					temp = i;
				}					
			};					
			if(temp > -1){						
				document.#trim(formName)#.HCFA_5_TBox_PatientTelephoneAreaCode.value = PatientPhoneArea[temp];
				document.#trim(formName)#.HCFA_5_TBox_PatientTelephoneNumber.value = PatientPhoneNumber[temp];	
			}
			else{
				document.#trim(formName)#.HCFA_5_TBox_PatientTelephoneAreaCode.value = "";
			    document.#trim(formName)#.HCFA_5_TBox_PatientTelephoneNumber.value = "";	
			};
		};
		
		
		function checkBoxRadio(elementName, checkValue){			
									
			for(var i = 0; i < document.images.length; i++){				
				if(document.images[i].name == elementName){					
					document.images[i].src='images/Checkbox1.gif';
					altName = document.images[i].alt;
					temp = eval('document.all.'+ altName +'.value = ""');									
				};			
			};
			
			for(var i = 0; i < document.images.length; i++){				
				if(document.images[i].name == elementName && document.images[i].alt == checkValue){					
					array = eval('document.images['+ i +'].src.split("/")');					
					if(array[array.length-1] == 'Checkbox1.gif'){				
						document.images[i].src='images/Checkbox2.gif';		
						temp = eval('document.all.'+ checkValue +'.value = 1');											
					};				
				};						
			};						
		};
		
		
		function changeTotalCharge(){
		
			var totalCharge = 0;
			var totalChargeCents = 0;
			
			if (isNaN(document.all.HCFA_24_TBox_Line1_Charges.value) != true && document.all.HCFA_24_TBox_Line1_Charges.value != ""){			
				var totalCharge = totalCharge + parseFloat(document.all.HCFA_24_TBox_Line1_Charges.value)};
			if (isNaN(document.all.HCFA_24_TBox_Line2_Charges.value) != true && document.all.HCFA_24_TBox_Line2_Charges.value != ""){			
				var totalCharge = totalCharge + parseFloat(document.all.HCFA_24_TBox_Line2_Charges.value)};
			if (isNaN(document.all.HCFA_24_TBox_Line3_Charges.value) != true && document.all.HCFA_24_TBox_Line3_Charges.value != ""){			
				var totalCharge = totalCharge + parseFloat(document.all.HCFA_24_TBox_Line3_Charges.value)};
			if (isNaN(document.all.HCFA_24_TBox_Line4_Charges.value) != true && document.all.HCFA_24_TBox_Line4_Charges.value != ""){			
				var totalCharge = totalCharge + parseFloat(document.all.HCFA_24_TBox_Line4_Charges.value)};
			if (isNaN(document.all.HCFA_24_TBox_Line5_Charges.value) != true && document.all.HCFA_24_TBox_Line5_Charges.value != ""){			
				var totalCharge = totalCharge + parseFloat(document.all.HCFA_24_TBox_Line5_Charges.value)};
			if (isNaN(document.all.HCFA_24_TBox_Line6_Charges.value) != true && document.all.HCFA_24_TBox_Line6_Charges.value != ""){			
				var totalCharge = totalCharge + parseFloat(document.all.HCFA_24_TBox_Line6_Charges.value)};			
		
			if (isNaN(document.all.HCFA_24_TBox_Line1_ChargesCents.value) != true && document.all.HCFA_24_TBox_Line1_ChargesCents.value != ""){			
				var totalChargeCents = totalChargeCents + parseFloat(document.all.HCFA_24_TBox_Line1_ChargesCents.value)};
			if (isNaN(document.all.HCFA_24_TBox_Line2_ChargesCents.value) != true && document.all.HCFA_24_TBox_Line2_ChargesCents.value != ""){			
				var totalChargeCents = totalChargeCents + parseFloat(document.all.HCFA_24_TBox_Line2_ChargesCents.value)};
			if (isNaN(document.all.HCFA_24_TBox_Line3_ChargesCents.value) != true && document.all.HCFA_24_TBox_Line3_ChargesCents.value != ""){			
				var totalChargeCents = totalChargeCents + parseFloat(document.all.HCFA_24_TBox_Line3_ChargesCents.value)};
			if (isNaN(document.all.HCFA_24_TBox_Line4_ChargesCents.value) != true && document.all.HCFA_24_TBox_Line4_ChargesCents.value != ""){			
				var totalChargeCents = totalChargeCents + parseFloat(document.all.HCFA_24_TBox_Line4_ChargesCents.value)};
			if (isNaN(document.all.HCFA_24_TBox_Line5_ChargesCents.value) != true && document.all.HCFA_24_TBox_Line5_ChargesCents.value != ""){			
				var totalChargeCents = totalChargeCents + parseFloat(document.all.HCFA_24_TBox_Line5_ChargesCents.value)};
			if (isNaN(document.all.HCFA_24_TBox_Line6_ChargesCents.value) != true && document.all.HCFA_24_TBox_Line6_ChargesCents.value != ""){			
				var totalChargeCents = totalChargeCents + parseFloat(document.all.HCFA_24_TBox_Line6_ChargesCents.value)};
			
			var len = totalChargeCents.toString().length;			
			var totalCents = totalChargeCents.toString().substring(0, len - 2) + "." + totalChargeCents.toString().substring(len - 2, len);
			var totalCharge = totalCharge + parseFloat(totalCents);			
			var totChargesArray = totalCharge.toString().split(".");							
			
			dollars = totChargesArray[0];										  
			
			if(totChargesArray.length == 2){				
				cents = totChargesArray[1];									
				if(cents.length == 1){
					cents = cents + "0";
				}
			}
			else{
				cents = "00";
			}	
			
			document.all.HCFA_28_TBox_TotalChargeDollars.value = dollars;
			document.all.HCFA_28_TBox_TotalChargeCents.value = cents;
			
		}
		
		
		function checkMaxLength(field, maxlimit) {
			var currentLeft = maxlimit - field.value.length;
			if(currentLeft > -1){
				lengthMessage.innerHTML = currentLeft + " characters left. No HTML or quotes.";
			}
			if (field.value.length > maxlimit)
				field.value = field.value.substring(0, maxlimit);
		}
		
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
		
		function keyUp(obj){				
    		
			if(obj.value.indexOf('?') > -1){
				launchDXPage('appDXCodeSearch.cfm?callerformname=#trim(formname)#&callerfieldName='+obj.name);
				x = 'document.#trim(formName)#.' + obj.name + '.value = "";'
				eval(x);
				//y = 'document.#trim(formName)#.' + diag + '.value = "";'
				//eval(y);
     		};			
			
		};
		
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
					//x = 'document.#trim(formName)#.' + diag + '.value = desc';
					//eval(x);
				}
				else{
					alert("The code you typed in (" + obj.value + ") cannot be found. Please check the code and try again.")
					obj.value = "";						
					//x = 'document.#trim(formName)#.' + diag + '.value = ""';
					y = 'document.#trim(formName)#.' + obj.name + '.focus()';
					//eval(x);
					eval(y);
				}				
     		};		
		};
					
	</script>
	
	
	<STYLE>
		td {
			FONT-SIZE: 10px; VERTICAL-ALIGN: top; COLOR: FF0000; FONT-FAMILY: Arial, Helvetica, sans-serif
		}
		.td_text {
			FONT-SIZE: 10px; VERTICAL-ALIGN: top; FONT-FAMILY: "Arial", "Helvetica", "sans-serif"
		}
		.td_text_bold {
			FONT-WEIGHT: bold; FONT-SIZE: 10px; VERTICAL-ALIGN: top; FONT-FAMILY: "Arial", "Helvetica", "sans-serif"
		}
		.pica_style {
			BORDER-RIGHT: FF0000 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: FF0000 1px solid; DISPLAY: block; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; BORDER-LEFT: FF0000 1px solid; PADDING-TOP: 0px; BORDER-BOTTOM: ffffff 1px solid
		}
		.box_style {
			BORDER-RIGHT: FF0000 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: FF0000 1px solid; DISPLAY: block; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; BORDER-LEFT: FF0000 1px solid; PADDING-TOP: 0px; BORDER-BOTTOM: FF0000 1px solid
		}
		INPUT {
			HEIGHT: 20px
		}
		
		.HCFATextbox {
			padding-left:3px;
			height: 17px;
			border-right: ##c0c0c0 1px solid; 
			border-top: ##c0c0c0 1px solid; 
			font-size: .65em; 
			border-left: ##c0c0c0 1px solid; 
			color: ##000000;
			border-bottom: ##c0c0c0 1px solid; 
			font-family: "MS Sans Serif", Verdana, Geneva, sans-serif;
		}
		
		.HCFAInvisibleTextbox {
			padding-left:3px;
			height: 17px;
			border-right: ##ffffff 1px solid; 
			border-top: ##ffffff 1px solid; 
			font-size: .65em; 
			border-left: ##ffffff 1px solid; 
			color: ##000000;
			border-bottom: ##c0c0c0 1px solid; 
			font-family: "MS Sans Serif", Verdana, Geneva, sans-serif;
		}
		
		.HCFAUnderlinedTextbox {
			padding-left:3px;
			height: 17px;
			border-right: ##ffffff 1px solid; 
			border-top: ##ffffff 1px solid; 
			font-size: .65em; 
			border-left: ##ffffff 1px solid; 
			color: ##000000;
			border-bottom: ##ff0000 1px solid; 
			font-family: "MS Sans Serif", Verdana, Geneva, sans-serif;
		}
		
	</STYLE>
	
<form name="#trim(formName)#">
<table width=920 border="0" cellpadding="0" cellspacing="0">
  <tbody>
  <tr>
    <td nowrap>
      <table width=40>
        <tbody>
        <tr>
          <td nowrap>PLEASE<br>DO NOT<br>STAPLE<br>IN THIS<br>AREA</td>
		</tr>
		</tbody>
	  </table>
	</td>
	<td nowrap>
      <table>
        <tbody>
        <tr>
           <td nowrap class="siteLabel" valign="top">&nbsp;</td>
		  <td nowrap class="siteLabel" valign="top">Note&nbsp;To&nbsp;Payer:</td>
		  <td nowrap class="siteLabel" valign="top"><textarea class="siteTextBox" name="noteToPayer" cols="50" rows="4" onchange="checkMaxLength(this,185)" onkeydown="checkMaxLength(this,185)" onkeyup="checkMaxLength(this,185)"></textarea><br><span class="siteLabel" id="lengthMessage">185 characters left. No HTML or quotes.</span></td>
		</tr>
		</tbody>
	  </table>
	</td>
    <td nowrap align=right colSpan=1>
      <table border="0">
        <tbody>
        <tr>
          <td nowrap align=right colspan="3">APPROVED&nbsp;OMB-0938-0008</td>		 
		</tr>
		
		<tr>
          <td valign="top">		  	  
			<cfif patientsInsuranceCompanies.RecordCount GTE 1>
				Send&nbsp;To:&nbsp;<span id="printToInsurancePrimSecTer">
					<select class="SiteSelectBox" name="selectToInsurancePrimSecTer" onchange="changeInsuranceCompany(this.value);">
						<option value="" selected>
						<cfloop query="patientsInsuranceCompanies">
							<option value="#trim(InsuranceCompanyID)#"><cfif PrimSecTer EQ 1>Primary<cfelseif PrimSecTer EQ 2>Secondary<cfelseif PrimSecTer EQ 3>Tertiary</cfif>
						</cfloop>														
					</select>
				</span>
			<cfelse>
				<span id="printToInsurancePrimSecTer" class="CopyGrey">&nbsp;(Patient has no insurance companies assigned to them.)</span>	
			</cfif>				  
		  </td>
		  <td nowrap>
		  	<table cellspacing="0" cellpadding="0" border="0" width="100%">
				<tr>
				    <td>&nbsp;</td>
				    <td><input type="Text" name="HCFA_0_TBox_NameAddressSendToInsurance_Name" size="45" maxlength="30" class="HCFATextBox"></td>
				</tr>	
				<tr>
				    <td>&nbsp;</td>
				    <td><input type="Text" name="HCFA_0_TBox_NameAddressSendToInsurance_AddressLine1" size="41" maxlength="30" class="HCFATextBox"></td>
				</tr>	
				<tr>
				    <td>&nbsp;</td>
				    <td><input type="Text" name="HCFA_0_TBox_NameAddressSendToInsurance_AddressLine2" size="41" maxlength="30" class="HCFATextBox"></td>
				</tr>
				<tr>
				    <td>&nbsp;</td>
				    <td>
						<input type="Text" name="HCFA_0_TBox_NameAddressSendToInsurance_City" size="20" maxlength="30" class="HCFATextBox">&nbsp;,&nbsp;
						<input type="Text" name="HCFA_0_TBox_NameAddressSendToInsurance_State" size="3" maxlength="2" class="HCFATextBox">
						<input type="Text" name="HCFA_0_TBox_NameAddressSendToInsurance_ZipCode" size="11" maxlength="10" class="HCFATextBox">
					</td>
				</tr>												
			</table>
		  </td>
		   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
		
		</tbody>
	  </table>
	</td>
  </tr> 
  </tbody>
</table>

<table cellSpacing=0 cellPadding=0 border=0><!-- 1 and 1a -->
  <tbody>
  <tr>
    <td nowrap valign=bottom border="0">
      <table border="0" cellSpacing=0 cellPadding=0>
        <tbody>        
			<td nowrap valign=bottom border="0">
		     	<table border="0" cellSpacing=0 cellPadding=0>
		        	<tbody>
		        		<tr>
		          			<td nowrap class=pica_style>&nbsp;&nbsp;&nbsp;</td>
		          			<td nowrap class=pica_style>&nbsp;&nbsp;&nbsp;</td>
		          			<td nowrap class=pica_style>&nbsp;&nbsp;&nbsp;</td>
		          			<td nowrap>PICA&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</td>	    	 	 
			<td nowrap valign=bottom border="0">
		     	<table align="center" border="0" cellSpacing="0" cellPadding="0">
		        	<tbody>
		        		<tr>		          			
		          			<td nowrap style="FONT-WEIGHT: bold; FONT-SIZE: 12px; FONT-FAMILY: Arial, Helvetica, sans-serif" align="middle">HEALTH INSURANCE CLAIM FORM</td>
						</tr>
					</tbody>
				</table>
			</td>
		 
		  <td nowrap valign=bottom align=right>
      <table border="0" cellSpacing=0 cellPadding=0>
        <tbody>
        <tr>
          <td nowrap>PICA&nbsp;</td>
          <td nowrap class=pica_style>&nbsp;&nbsp;&nbsp;</td>
          <td nowrap class=pica_style>&nbsp;&nbsp;&nbsp;</td>
          <td nowrap class=pica_style>&nbsp;&nbsp;&nbsp;</td></tr></tbody>
	  </table>
	 </td>
  </tr>
  <tr>
    <td nowrap colSpan=3>
      <table style="BORDER-RIGHT: ffffff 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: FF0000 1px solid; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; BORDER-LEFT: ffffff 1px solid; PADDING-TOP: 0px; BORDER-BOTTOM: FF0000 1px solid" borderColor=FF0000 cellSpacing=0 cellPadding=0 border=1>
        <tbody>
        <tr>
          <td nowrap colSpan=2>
            <table cellSpacing=0 cellPadding=0 border=0>
              <tbody>
              <tr onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Indicate the type of health insurance coverage applicable to this claim by placing an X in the appropriate box. Only one box can be marked.<br><br><strong>Description:</strong> Medicare, Medicaid, TRICARE CHAMPUS, CHAMPVA, Group Health Plan, FECA, Black Lung, or Other means the insurance type to whom the claim is being submitted. Other indicates health insurance including HMOs, commercial insurance, automobile accident, liability, or workers’ compensation. This information directs the claim to the correct program and may establish primary liability.<br><br><strong>Field Specifications:</strong> This field allows for entry of 1 character in any box within the field.');" onmouseout="hideTip(this);" style="cursor: hand">               
				<td nowrap>1.</td>
                <td nowrap width=75>MEDICARE</td>
                <td nowrap>&nbsp;</td>
                <td nowrap width=75>MEDICAID</td>
                <td nowrap>&nbsp;</td>
                <td nowrap width=90>CHAMPUS</td>
                <td nowrap>&nbsp;</td>
                <td nowrap width=70>CHAMPVA</td>
                <td nowrap>&nbsp;</td>
                <td nowrap width=80>GROUP<BR>HEALTH PLAN</td>
                <td nowrap>&nbsp;</td>
                <td nowrap width=50>FECA<BR>BLK&nbsp;LUNG</td>
                <td nowrap>&nbsp;</td>
                <td nowrap width=50>OTHER</td>
			  </tr>
             
			
				<input type="Hidden" name="HCFA_1_CBox_Medicare" value="">
				<input type="Hidden" name="HCFA_1_CBox_Medicaid" value="">
				<input type="Hidden" name="HCFA_1_CBox_Champus" value="">
				<input type="Hidden" name="HCFA_1_CBox_ChampVA" value="">
				<input type="Hidden" name="HCFA_1_CBox_GroupHealthPlan" value="">
				<input type="Hidden" name="HCFA_1_CBox_FecaBlkLung" value="">
				<input type="Hidden" name="HCFA_1_CBox_Other" value="">
	
			  <tr>
                <td nowrap><img src="images/Checkbox1.gif" name="CheckUncheckPic_1" alt="HCFA_1_CBox_Medicare" onclick="checkBoxRadio('CheckUncheckPic_1', 'HCFA_1_CBox_Medicare')"></td>
                <td nowrap align=middle width=75>(Medicare ##)</td>
                <td nowrap><img src="images/Checkbox1.gif" name="CheckUncheckPic_1" alt="HCFA_1_CBox_Medicaid" onclick="checkBoxRadio('CheckUncheckPic_1', 'HCFA_1_CBox_Medicaid')"></td>
                <td nowrap align=middle width=75>(Medicaid ##)</td>
                <td nowrap><img src="images/Checkbox1.gif" name="CheckUncheckPic_1" alt="HCFA_1_CBox_Champus" onclick="checkBoxRadio('CheckUncheckPic_1', 'HCFA_1_CBox_Champus')"></td>
                <td nowrap align=middle width=90>(Sponsor's SSN)</td>
                <td nowrap><img src="images/Checkbox1.gif" name="CheckUncheckPic_1" alt="HCFA_1_CBox_ChampVA" onclick="checkBoxRadio('CheckUncheckPic_1', 'HCFA_1_CBox_ChampVA')"></td>
                <td nowrap align=middle width=70>(VA File ##)</td>
                <td nowrap><img src="images/Checkbox1.gif" name="CheckUncheckPic_1" alt="HCFA_1_CBox_GroupHealthPlan" onclick="checkBoxRadio('CheckUncheckPic_1', 'HCFA_1_CBox_GroupHealthPlan')"></td>
                <td nowrap align=middle width=80>(SSN or ID)</td>
                <td nowrap><img src="images/Checkbox1.gif" name="CheckUncheckPic_1" alt="HCFA_1_CBox_FecaBlkLung" onclick="checkBoxRadio('CheckUncheckPic_1', 'HCFA_1_CBox_FecaBlkLung')"></td>
                <td nowrap align=middle width=50>(SSN)</td>
                <td nowrap><img src="images/Checkbox1.gif" name="CheckUncheckPic_1" alt="HCFA_1_CBox_Other" onclick="checkBoxRadio('CheckUncheckPic_1', 'HCFA_1_CBox_Other')"></td>
                <td nowrap align=middle width=50>(ID)</td></tr></tbody></table></td>
          		<td nowrap width=220>					
					<table cellspacing="0" cellpadding="2" border="0">
						<tr>
						    <td><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter insured’s ID number as shown on insured’s ID card for the payer to whom the claim is being submitted.<br><br><strong>Description:</strong> The insured’s ID number is the identification number of the person who holds the policy. This information identifies the patient to the payer.<br><br><strong>Field Specification:</strong> This field allows for entry of 29 characters.');" onmouseout="hideTip(this);">1a.&nbsp;INSURED'S&nbsp;I.D.&nbsp;NUMBER&nbsp;(FOR&nbsp;PROGRAM&nbsp;IN&nbsp;ITEM&nbsp;1)</span></td>
						</tr>
						<tr>
						    <td><input type="Text" name="HCFA_1a_TBox_InsuredsIDNumber" size="35" value="#trim(request.thisClaim.getHICNumber())#" maxlength="29" class="HCFATextBox"><cfif patientsInsuranceCompanies.RecordCount GTE 1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="printToInsurancePrimSecTer4"><select class="SiteSelectBox" name="selectToInsurancePrimSecTer4" onchange="changeInsuranceCompanyInsured(this.value);"><option value="" selected><cfloop query="patientsInsuranceCompanies"><option value="#trim(InsuranceCompanyID)#"><cfif PrimSecTer EQ 1>Primary<cfelseif PrimSecTer EQ 2>Secondary<cfelseif PrimSecTer EQ 3>Tertiary</cfif></cfloop></select></span></cfif></td>
						</tr>													
					</table>		
		  		</td>
			  </tr>
        <tr>
          <td nowrap><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter the patient’s full last name, first name, and middle initial. If the patient uses a last name suffix (e.g., Jr, Sr) enter it after the last name, and before the first name. Titles (e.g., Sister, Capt, Dr) and professional suffixes (e.g., PhD, MD, Esq) should not be included with the name. Use commas to separate the last name, first name, and middle initial. A hyphen can be used for hyphenated names. Do not use periods within the name.<br><br><strong>Description:</strong> The patient’s name is the name of the person who received the treatment or supplies.<br><br><strong>Field Specification:</strong> This field allows for the entry of 28 characters.');" onmouseout="hideTip(this);">2.&nbsp;PATIENT'S&nbsp;NAME&nbsp;(Last&nbsp;Name,&nbsp;First&nbsp;Name,&nbsp;Middle&nbsp;Initial)</span><BR>&nbsp;<input type="Text" name="HCFA_2_TBox_PatientName" size="35" maxlength="28" class="HCFATextbox" value="#trim(HCFA_2_TBox_PatientName)#"></td>
          <td nowrap width=200>
            <table cellSpacing=0 cellPadding=0 border=0>
              <tbody>
              <tr>
                <td nowrap colspan="2"><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter the patient’s 8-digit birth date (MM | DD | CCYY). Enter an X in the correct box to indicate sex of the patient. Only one box can be marked. If gender is unknown, leave blank.<br><br><strong>Description:</strong> The patient’s birth date and sex (gender) is information that will identify the patient and it distinguishes persons with similar names.<br><br><strong>Field Specification:</strong> This field allows for the entry of the following: 2 characters under MM, 2 characters under DD, 4 characters under YY, and 1 character in either box.');" onmouseout="hideTip(this);">3.&nbsp;PATIENT'S&nbsp;BIRTH&nbsp;DATE</span></td></tr>
              <tr>
                <td nowrap align=middle>
                  <table cellpadding="0" cellspacing="0" border="0">
                    <tbody>
                    <tr>
                      <td nowrap align=middle>MM&nbsp;</td>
                      <td nowrap>|</td>
                      <td nowrap align=middle>DD&nbsp;</td>
                      <td nowrap>|</td>
                      <td nowrap align=middle>YY&nbsp;</td></tr>
                    <tr>
                      <td nowrap><input type="Text" name="HCFA_3_TBox_PatientsBirthDateMM" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(request.thisPatientEntity.getDOB(), 'mm')#"></td>
                      <td nowrap valign="top">|</td>
                      <td nowrap><input type="Text" name="HCFA_3_TBox_PatientsBirthDateDD" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(request.thisPatientEntity.getDOB(), 'dd')#"></td>
                      <td nowrap valign="top">|</td>
                      <td nowrap><input type="Text" name="HCFA_3_TBox_PatientsBirthDateYY" size="4" maxlength="4" class="HCFATextBox" value="#DateFormat(request.thisPatientEntity.getDOB(), 'yy')#"></td></tr></tbody></table></td>
                <td nowrap align=middle width=70 colSpan=2>
                  <table>
                    <tbody>
                    <tr>
                      <td nowrap align=middle colSpan=4>SEX</td></tr>
                   
				   <input type="Hidden" name="HCFA_3_CBox_Sex_Male" value="">
				   <input type="Hidden" name="HCFA_3_CBox_Sex_Female" value="">
				   
				    <tr>
                      <td nowrap align=middle>M </td>
                      <td nowrap><img src="images/Checkbox1.gif" name="CheckUncheckPic_3" alt="HCFA_3_CBox_Sex_Male" onclick="checkBoxRadio('CheckUncheckPic_3', 'HCFA_3_CBox_Sex_Male')"></td>
                      <td nowrap align=middle>F </td>
                      <td nowrap><img src="images/Checkbox1.gif" name="CheckUncheckPic_3" alt="HCFA_3_CBox_Sex_Female" onclick="checkBoxRadio('CheckUncheckPic_3', 'HCFA_3_CBox_Sex_Female')"></td>
					</tr>
					
					<script language="JavaScript">	
						if(#trim(HCFA_3_CBox_Sex)# == 0){ 
							checkBoxRadio('CheckUncheckPic_3', 'HCFA_3_CBox_Sex_Male')
						}				
						else if(#trim(HCFA_3_CBox_Sex)# == 1){	
							checkBoxRadio('CheckUncheckPic_3', 'HCFA_3_CBox_Sex_Female')
			  			};						
					</script>	
					
					</tbody>
				  </table>
				</td>
				</tr>
				</tbody>
				</table>
				</td>
          			  <td nowrap width=200>					  
					  	<table cellspacing="0" cellpadding="2" border="0">
							<tr>
							    <td><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter the insured’s full last name, first name, and middle initial. If the insured uses a last name suffix (e.g., Jr, Sr) enter it after the last name, and before the first name. Titles (e.g., Sister, Capt, Dr) and professional suffixes (e.g., PhD, MD, Esq) should not be included with the name. Use commas to separate the last name, first name, and middle initial. A hyphen can be used for hyphenated names. Do not use periods within the name.<br><br><strong>Description:</strong> The insured’s name identifies the person who holds the policy, which would be the employee for employer-provided health insurance.<br><br><strong>Field Specification:</strong> This field allows for the entry of 29 characters.');" onmouseout="hideTip(this);">4.&nbsp;INSURED'S&nbsp;NAME&nbsp;(Last&nbsp;Name,&nbsp;First&nbsp;Name,&nbsp;Middle&nbsp;Initial)</span></td>
							</tr>
							<tr>
							    <td><input type="Text" name="HCFA_4_TBox_InsuredsName" size="35" maxlength="29" class="HCFATextbox"><!---<cfif patientsInsuranceCompanies.RecordCount GTE 1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="printToInsurancePrimSecTer4"><select class="SiteSelectBox" name="selectToInsurancePrimSecTer4" onchange="changeInsuranceCompanyInsured(this.value);"><option value="" selected><cfloop query="patientsInsuranceCompanies"><option value="#trim(InsuranceCompanyID)#"><cfif PrimSecTer EQ 1>Primary<cfelseif PrimSecTer EQ 2>Secondary<cfelseif PrimSecTer EQ 3>Tertiary</cfif></cfloop></select></span></cfif>---></td>
							</tr>													
						</table>					
					  </td>
					</tr>
        <tr>
          <td nowrap width=200>
		  	<table cellspacing="0" cellpadding="2" border="0">
				<tr>
				    <td><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter the patient’s mailing address and telephone number. The first line is for the street address; the second line, the city and state; the third line, the zip code and phone number. Patient’s Telephone does not exist in the electronic 837 Professional 4010A1. Do not use commas, periods, or other punctuation in the address (e.g., 123 N Main Street 101 instead of 123 N. Main Street, ##101). When entering a 9 digit zip code, include the hyphen. Do not use a hyphen or space as a separator within the telephone number.<br><br><strong>Description:</strong> The patient’s address refers to the patient’s permanent residence. A temporary address or school address should not be used.<br><br><strong>Field Specification:</strong> This field allows for the entry of the following: 28 characters for street address, 24 characters for city, 3 characters for state, 12 characters for zip code, 3 characters for area code, and 10 characters for phone number.');" onmouseout="hideTip(this);">5.&nbsp;PATIENT'S&nbsp;ADDRESS&nbsp;(No.,Street)</span></td>
				</tr>
				<tr>
				    <td><input type="Text" name="HCFA_5_TBox_PatientAddressNoStreet" size="45" maxlength="28" class="HCFATextBox"><cfif Addresses.RecordCount GTE 1>&nbsp;&nbsp;&nbsp;<cfset count = 0><select class="SiteSelectBox" name="selectPatinetAddress" onchange="changePatientAddress(this.value);"><option value="" selected><cfloop query="Addresses"><cfset count = count + 1><option value="#trim(AddressID)#"> Address #trim(count)#</cfloop></select></cfif></td>
				</tr>						
			</table>
		  </td>
          <td nowrap width=200>
            <table border="0">
              <tbody>
              <tr>
                <td nowrap colSpan=8><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter an X in the correct box to indicate the patient’s relationship to insured when Item Number 4 is completed. Only one box can be marked.<br><br><strong>Description:</strong> The patient relationship to insured refers to how the patient is related to the insured. Self would indicate that the insured is the patient. Spouse would indicate that the patient is the husband or wife or qualified partner as defined by the insured’s plan. Child would indicate that the patient is the minor dependent as defined by the insured’s plan. Other would indicate that the patient is other than the self, spouse, or child, which may include employee, ward, or dependent as defined by the insured’s plan.<br><br><strong>Field Specification:</strong> This field allows for entry of 1 character in any box within the field.');" onmouseout="hideTip(this);">6.&nbsp;PATIENT'S&nbsp;RELATIONSHIP&nbsp;TO&nbsp;INSURED</span></td></tr>
              <tr>
			  	 <input type="Hidden" name="HCFA_6_CBox_PATIENTRELTOINSURED_Self" value="">
				 <input type="Hidden" name="HCFA_6_CBox_PATIENTRELTOINSURED_Spouse" value="">
				 <input type="Hidden" name="HCFA_6_CBox_PATIENTRELTOINSURED_Child" value="">
				 <input type="Hidden" name="HCFA_6_CBox_PATIENTRELTOINSURED_Other" value="">				
                <td nowrap align="right">Self</td>
                <td nowrap><img src="images/Checkbox1.gif" name="CheckUncheckPic_6" alt="HCFA_6_CBox_PATIENTRELTOINSURED_Self" onclick="checkBoxRadio('CheckUncheckPic_6', 'HCFA_6_CBox_PATIENTRELTOINSURED_Self')"></td>
                <td nowrap align="right">Spouse</td>
                <td nowrap><img src="images/Checkbox1.gif" name="CheckUncheckPic_6" alt="HCFA_6_CBox_PATIENTRELTOINSURED_Spouse" onclick="checkBoxRadio('CheckUncheckPic_6', 'HCFA_6_CBox_PATIENTRELTOINSURED_Spouse')"></td>
                <td nowrap align="right">Child</td>
                <td nowrap><img src="images/Checkbox1.gif" name="CheckUncheckPic_6" alt="HCFA_6_CBox_PATIENTRELTOINSURED_Child" onclick="checkBoxRadio('CheckUncheckPic_6', 'HCFA_6_CBox_PATIENTRELTOINSURED_Child')"></td>
                <td nowrap align="right">Other</td>
                <td nowrap><img src="images/Checkbox1.gif" name="CheckUncheckPic_6" alt="HCFA_6_CBox_PATIENTRELTOINSURED_Other" onclick="checkBoxRadio('CheckUncheckPic_6', 'HCFA_6_CBox_PATIENTRELTOINSURED_Other')"></td>
			  </tr>			  
			 </tbody>
			</table>
		  </td>
          <td nowrap width=200><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter the insured’s address and telephone number. If Item Number 4 is completed then this field should be completed. The first line is for the street address; the second line, the city and state; the third line, the zip code and phone number. Patient’s Telephone does not exist in the electronic 837 Professional 4010A1.<br><br>Do not use commas, periods, or other punctuation in the address (e.g., 123 N Main Street 101 instead of 123 N. Main Street, ##101). When entering a 9 digit zip code, include the hyphen. Do not use a hyphen or space as a separator within the telephone number.<br><br><strong>Description:</strong> The insured’s address refers to the insured’s permanent residence, which may be different from the patient’s address in Item Number 5.<br><br><strong>Field Specification:</strong> This field allows for the entry of the following: 29 characters for street address, 23 characters for city, 4 characters for state, 12 characters for zip code, 3 characters for area code, and 10 characters for phone number');" onmouseout="hideTip(this);">7. INSURED'S ADDRESS (No.,Street)</span><BR><input type="Text" name="HCFA_7_TBox_InsuredsAddressNoStreet" size="50" maxlength="29" class="HCFATextBox" value="SAME"></td></tr><!--5 cont., 8, 7 cont.-->
        <tr>
          <td nowrap width=250>
            <table borderColor=FF0000 cellSpacing=0 cellPadding=0 border=0>
              <tbody>
              <tr>
                <td nowrap width=215 style="BORDER-RIGHT: FF0000 1px solid; BORDER-TOP: ffffff 0px solid; BORDER-LEFT: ffffff 0px solid; BORDER-BOTTOM: ffffff 0px solid">CITY<BR><input type="Text" name="HCFA_5_TBox_PatientAddressCity" size="40" maxlength="24" class="HCFATextBox"></td>
                <td nowrap style="BORDER-RIGHT: ffffff 0px solid; BORDER-TOP: ffffff 0px solid; BORDER-LEFT: ffffff 0px solid; BORDER-BOTTOM: ffffff 0px solid">&nbsp;STATE&nbsp;<BR><input type="Text" name="HCFA_5_TBox_PatientAddressState" size="4" maxlength="3" class="HCFATextBox"></td></tr></tbody></table></td>
          <td nowrap rowSpan=2>
            <table border="0">              
              <tr>
                <td nowrap colSpan=3><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Patient Status does not exist in the electronic 837 Professional 4010A1. Enter an X in the box for the patient’s marital status, and for the patient’s employment or student status. Only one box on each line can be marked.<br><br><strong>Description:</strong> The patient status indicates the patient’s marital and employment status. Employed would indicate that the patient has a job. Full-time student would indicate that the patient is registered as a full-time student as defined by the post-secondary school or university. Part-time student would indicate that the patient is registered as a part-time student as defined by the post-secondary school or university. This information is important for determination of liability and coordination of benefits (COB).<br><br><strong>Field Specification:</strong> This field allows for entry of 1 character in any box within the field.');" onmouseout="hideTip(this);">8. PATIENT STATUS</span></td></tr>
              <tr>
                
				<input type="Hidden" name="HCFA_8_CBox_PATIENTSTATUS_Single" value="">
				<input type="Hidden" name="HCFA_8_CBox_PATIENTSTATUS_Married" value="">
				<input type="Hidden" name="HCFA_8_CBox_PATIENTSTATUS_Other" value="">
				
				<td nowrap align=right>Single</td>
                <td nowrap width=8><img src="images/Checkbox1.gif" name="CheckUncheckPic_8" alt="HCFA_8_CBox_PATIENTSTATUS_Single" onclick="checkBoxRadio('CheckUncheckPic_8', 'HCFA_8_CBox_PATIENTSTATUS_Single')"></td>
                <td nowrap align=right>&nbsp;&nbsp;</td>
			    <td nowrap align=right>Married</td>
                <td nowrap width=8><img src="images/Checkbox1.gif" name="CheckUncheckPic_8" alt="HCFA_8_CBox_PATIENTSTATUS_Married" onclick="checkBoxRadio('CheckUncheckPic_8', 'HCFA_8_CBox_PATIENTSTATUS_Married')"></td>
                <td nowrap align=right>&nbsp;&nbsp;</td>
				<td nowrap align=right>Other</td>
                <td nowrap width=8><img src="images/Checkbox1.gif" name="CheckUncheckPic_8" alt="HCFA_8_CBox_PATIENTSTATUS_Other" onclick="checkBoxRadio('CheckUncheckPic_8', 'HCFA_8_CBox_PATIENTSTATUS_Other')"></td>
			  </tr>
             
			  <script language="JavaScript">	
			  	if(#trim(PatientMaritalStatus)# == 231){ 
					checkBoxRadio('CheckUncheckPic_8', 'HCFA_8_CBox_PATIENTSTATUS_Single')
				}				
				else if(#trim(PatientMaritalStatus)# == 232){	
					checkBoxRadio('CheckUncheckPic_8', 'HCFA_8_CBox_PATIENTSTATUS_Married')
		  		}
				else{	
					checkBoxRadio('CheckUncheckPic_8', 'HCFA_8_CBox_PATIENTSTATUS_Other')
		  		};						
			  </script>		
			 
			  <tr>
			  	<input type="Hidden" name="HCFA_8_CBox_PATIENTSTATUSEMPLOYMENT_Employed" value="">
			    <input type="Hidden" name="HCFA_8_CBox_PATIENTSTATUSEMPLOYMENT_FullTimeStudent" value="">
				<input type="Hidden" name="HCFA_8_CBox_PATIENTSTATUSEMPLOYMENT_PartTimeStudent" value="">
                <td nowrap align=right>Employed</td>
                <td nowrap width=8><img src="images/Checkbox1.gif" name="CheckUncheckPic_8_Employment" alt="HCFA_8_CBox_PATIENTSTATUSEMPLOYMENT_Employed" onclick="checkBoxRadio('CheckUncheckPic_8_Employment', 'HCFA_8_CBox_PATIENTSTATUSEMPLOYMENT_Employed')"></td>
				
				<cfif IsNumeric(trim(request.thisPatientEntity.getEmployerID()))>
					<script language="JavaScript">						  
						checkBoxRadio('CheckUncheckPic_8_Employment', 'HCFA_8_CBox_PATIENTSTATUSEMPLOYMENT_Employed')					
					</script>		
				</cfif>
				
				<td nowrap align=right>&nbsp;&nbsp;</td>
                <td nowrap align=right>Full&ndash;Time<br>Student</td>
                <td nowrap width=8><img src="images/Checkbox1.gif" name="CheckUncheckPic_8_Employment" alt="HCFA_8_CBox_PATIENTSTATUSEMPLOYMENT_FullTimeStudent" onclick="checkBoxRadio('CheckUncheckPic_8_Employment', 'HCFA_8_CBox_PATIENTSTATUSEMPLOYMENT_FullTimeStudent')"></td>
				<td nowrap align=right>&nbsp;&nbsp;</td>
                <td nowrap align=right>Part&ndash;Time<br>Student</td>
                <td nowrap width=8><img src="images/Checkbox1.gif" name="CheckUncheckPic_8_Employment" alt="HCFA_8_CBox_PATIENTSTATUSEMPLOYMENT_PartTimeStudent" onclick="checkBoxRadio('CheckUncheckPic_8_Employment', 'HCFA_8_CBox_PATIENTSTATUSEMPLOYMENT_PartTimeStudent')"></td></tr></table></td>
          <td nowrap width=250>
            <table borderColor=FF0000 cellSpacing=0 cellPadding=0 border=0>
              <tbody>
              <tr>
                <td nowrap width=215 style="BORDER-RIGHT: FF0000 1px solid; BORDER-TOP: ffffff 0px solid; BORDER-LEFT: ffffff 0px solid; BORDER-BOTTOM: ffffff 0px solid">CITY<BR><input type="Text" name="HCFA_7_TBox_InsuredsAddressCity" size="40" maxlength="23" class="HCFATextBox"></td>
                <td nowrap style="BORDER-RIGHT: ffffff 0px solid; BORDER-TOP: ffffff 0px solid; BORDER-LEFT: ffffff 0px solid; BORDER-BOTTOM: ffffff 0px solid">&nbsp;STATE&nbsp;<BR><input type="Text" name="HCFA_7_TBox_InsuredsAddressState" size="4" maxlength="4" class="HCFATextBox"></td></tr></tbody></table></td></tr><!--zip, telephone row-->
        <tr>
          <td nowrap width=220 height=30>
            <table border=0 cellpadding="0" cellspacing="0" borderColor=FF0000>
              <tbody>
              <tr>
                <td nowrap width=60 style="BORDER-RIGHT: ffffff 0px solid; BORDER-TOP: ffffff 0px solid; BORDER-LEFT: ffffff 0px solid; BORDER-BOTTOM: ffffff 0px solid">ZIP CODE<BR><input type="Text" name="HCFA_5_TBox_PatientAddressZipCode" size="10" maxlength="12" class="HCFATextBox"></td>
                <td nowrap style="BORDER-RIGHT: ffffff 0px solid; BORDER-TOP: ffffff 0px solid; BORDER-LEFT: FF0000 1px solid; BORDER-BOTTOM: ffffff 0px solid">
				<!---TELEPHONE (Include Area Code)<BR>&nbsp;(&nbsp;<input type="Text" name="HCFA_5_TBox_PatientTelephoneAreaCode" size="3" maxlength="3" class="HCFATextBox">&nbsp;)&nbsp;<input type="Text" name="HCFA_5_TBox_PatientTelephoneNumber" size="20" maxlength="10" class="HCFATextBox">--->
				<table cellspacing="0" cellpadding="2" border="0">
					<tr>
					    <td></td>
					</tr>
					<tr>
					    <td>TELEPHONE&nbsp;(Include&nbsp;Area&nbsp;Code)<br>(&nbsp;<input type="Text" name="HCFA_5_TBox_PatientTelephoneAreaCode" size="3" maxlength="3" class="HCFATextBox">&nbsp;)&nbsp;<input type="Text" name="HCFA_5_TBox_PatientTelephoneNumber" size="20" maxlength="10" class="HCFATextBox"><cfif Phones.RecordCount GTE 1>&nbsp;<cfset count = 0><select class="SiteSelectBox" name="selectPatientPhone" onchange="changePatientPhone(this.value);"><option value="" selected><cfloop query="Phones"><cfset count = count + 1><option value="#trim(PhoneID)#"> Phone #trim(count)#</cfloop></select></cfif></td>
					</tr>						
				</table>
				
				</td>
			  </tr>
			  </tbody>
			</table>
		  </td>
          <td nowrap width=240>
            <table border=0 cellpadding="0" cellspacing="0" borderColor=FF0000>
              <tbody>
              <tr>
                <td nowrap width=60 style="BORDER-RIGHT: ffffff 0px solid; BORDER-TOP: ffffff 0px solid; BORDER-LEFT: ffffff 0px solid; BORDER-BOTTOM: ffffff 0px solid">ZIP CODE<BR><input type="Text" name="HCFA_7_TBox_InsuredsAddressZipCode" size="10" maxlength="12" class="HCFATextBox"></td>
                <td nowrap style="BORDER-RIGHT: ffffff 0px solid; BORDER-TOP: ffffff 0px solid; BORDER-LEFT: FF0000 1px solid; BORDER-BOTTOM: ffffff 0px solid">TELEPHONE (Include Area Code)<BR>&nbsp;(&nbsp;<input type="Text" name="HCFA_7_TBox_InsuredsTelephoneAreaCode" size="3" maxlength="3" class="HCFATextBox">&nbsp;)&nbsp;<input type="Text" name="HCFA_7_TBox_InsuredsTelephoneNumber" size="20" maxlength="10" class="HCFATextBox"></td>
			  </tr>
			  </tbody>
			</table>
			</td>
		</tr>
        <tr>
          <td nowrap>		  	
		 	<table cellspacing="0" cellpadding="2" border="0">
				<tr>
				    <td><span style="cursor: hand" onclick="doTooltip(1, this, event, '<br><br><strong>Instructions:</strong> If Item Number 11d is marked, complete fields 9 and 9a-d, otherwise leave blank. When additional group health coverage exists, enter other insured’s full last name, first name, and middle initial of the enrollee in another health plan if it is different from that shown in Item Number 2. If the insured uses a last name suffix (e.g., Jr, Sr) enter it after the last name, and before the first name. Titles (e.g., Sister, Capt, Dr) and professional suffixes (e.g., PhD, MD, Esq) should not be included with the name. Use commas to separate the last name, first name, and middle initial. A hyphen can be used for hyphenated names. Do not use periods within the name.<br><br><strong>Description:</strong> The other insured’s name indicates that there is a holder of another policy that may cover the patient.<br><br><strong>Field Specification:</strong> This field allows for the entry of 28 characters.');" onmouseout="hideTip(this);">9.&nbsp;OTHER&nbsp;INSURED'S&nbsp;NAME&nbsp;(Last&nbsp;Name,&nbsp;First&nbsp;Name,&nbsp;MI)</span></td>
				</tr>
				<tr>
				    <td><input type="Text" name="HCFA_9_TBox_OtherInsuredsName" size="35" maxlength="28" class="HCFATextbox"><cfif patientsInsuranceCompanies.RecordCount GTE 1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="printToInsurancePrimSecTer4"><select class="SiteSelectBox" name="selectToInsurancePrimSecTer4" onchange="changeInsuranceCompanyOther(this.value);"><option value="" selected><cfloop query="patientsInsuranceCompanies"><option value="#trim(InsuranceCompanyID)#"><cfif PrimSecTer EQ 1>Primary<cfelseif PrimSecTer EQ 2>Secondary<cfelseif PrimSecTer EQ 3>Tertiary</cfif></cfloop></select></span></cfif></td>
				</tr>						
			</table>		 
		  </td>
          
		  
		  <td nowrap width=240 rowSpan=4>           
			<table border="0" cellpadding="0" cellspacing="5">              
              <tr>
                <td nowrap colSpan=8><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> When appropriate, enter an X in the correct box to indicate whether one or more of the services described in Item Number 24 are for a condition or injury that occurred on the job or as a result of an automobile or other accident. Only one box on each line can be marked. The state postal code must be shown if \'YES\' is marked in 10b for \'Auto Accident\'. Any item marked \'YES\' indicates there may be other applicable insurance coverage that would be primary, such as automobile liability insurance. Primary insurance information must then be shown in Item Number 11.<br><br><strong>Description:</strong> This information indicates whether the patient\'s illness or injury is related to employment, auto accident, or other accident. Employment (current or previous) would indicate that the condition is related to the patient\'s job or workplace. Auto accident would indicate that the condition is the result of an automobile accident. Other accident would indicate that the condition is the result of any other type of accident.<br><br><strong>Field Specification:</strong> This field allows for the entry of the following: 1 character in either box per each line and 2 characters in the Place/State field');" onmouseout="hideTip(this);">10. IS PATIENT'S CONDITION RELATED TO:</span></td>
			  </tr>
			  <tr>
                <td nowrap colSpan=8>&nbsp;</td>
			  </tr>
              <tr>
                <td nowrap colSpan=8>a. EMPLOYMENT?&nbsp;&nbsp;(CURRENT OR PREVIOUS)</td>
			  </tr>
			  <tr>                
				<input type="Hidden" name="HCFA_10_CBox_a_PATIENTSCONDITIONEMPLOYMENT_Yes" value="">
				<input type="Hidden" name="HCFA_10_CBox_a_PATIENTSCONDITIONEMPLOYMENT_No" value="">							
                <td nowrap align="right"><img src="images/Checkbox1.gif" name="CheckUncheckPic_10_Employment" alt="HCFA_10_CBox_a_PATIENTSCONDITIONEMPLOYMENT_Yes" onclick="checkBoxRadio('CheckUncheckPic_10_Employment', 'HCFA_10_CBox_a_PATIENTSCONDITIONEMPLOYMENT_Yes')"></td>
                <td nowrap>Yes</td>
				<td nowrap align=right>&nbsp;&nbsp;</td>
			    <td nowrap align="right"><img src="images/Checkbox1.gif" name="CheckUncheckPic_10_Employment" alt="HCFA_10_CBox_a_PATIENTSCONDITIONEMPLOYMENT_No" onclick="checkBoxRadio('CheckUncheckPic_10_Employment', 'HCFA_10_CBox_a_PATIENTSCONDITIONEMPLOYMENT_No')"></td>
               	<td nowrap colspan="4">No</td>			   
			  </tr>
			  <tr>
                <td nowrap colSpan=7>b. AUTO&nbsp;ACCIDENT?</td>
				<td nowrap colSpan=1 align="center">Place&nbsp;(State)</td>
			  </tr>
              <tr>                
				<input type="Hidden" name="HCFA_10_CBox_b_PATIENTSCONDITIONAUTOACCIDENT_Yes" value="">
				<input type="Hidden" name="HCFA_10_CBox_b_PATIENTSCONDITIONAUTOACCIDENT_No" value="">							
                <td nowrap align="right"><img src="images/Checkbox1.gif" name="CheckUncheckPic_10_AutoAccident" alt="HCFA_10_CBox_b_PATIENTSCONDITIONAUTOACCIDENT_Yes" onclick="checkBoxRadio('CheckUncheckPic_10_AutoAccident', 'HCFA_10_CBox_b_PATIENTSCONDITIONAUTOACCIDENT_Yes')"></td>
                <td nowrap>Yes</td>
				<td nowrap align=right>&nbsp;&nbsp;</td>
			    <td nowrap align="right"><img src="images/Checkbox1.gif" name="CheckUncheckPic_10_AutoAccident" alt="HCFA_10_CBox_b_PATIENTSCONDITIONAUTOACCIDENT_No" onclick="checkBoxRadio('CheckUncheckPic_10_AutoAccident', 'HCFA_10_CBox_b_PATIENTSCONDITIONAUTOACCIDENT_No')"></td>
               	<td nowrap colspan="3">No</td>	
				<td nowrap colSpan=1 align="center"><u><input type="Text" name="HCFA_10_TBox_PatientConditionAutoAccidentState" size="3" maxlength="2" class="HCFATextBox"></u></td>		   
			  </tr>			  
			  <tr>
                <td nowrap colSpan=7>c. OTHER&nbsp;ACCIDENT?</td>				
			  </tr>			  
			  <tr>                
				<input type="Hidden" name="HCFA_10_CBox_c_PATIENTSCONDITIONOTHERACCIDENT_Yes" value="">
				<input type="Hidden" name="HCFA_10_CBox_c_PATIENTSCONDITIONOTHERACCIDENT_No" value="">							
                <td nowrap align="right"><img src="images/Checkbox1.gif" name="CheckUncheckPic_10_OtherAccident" alt="HCFA_10_CBox_c_PATIENTSCONDITIONOTHERACCIDENT_Yes" onclick="checkBoxRadio('CheckUncheckPic_10_OtherAccident', 'HCFA_10_CBox_c_PATIENTSCONDITIONOTHERACCIDENT_Yes')"></td>
                <td nowrap>Yes</td>
				<td nowrap align=right>&nbsp;&nbsp;</td>
			    <td nowrap align="right"><img src="images/Checkbox1.gif" name="CheckUncheckPic_10_OtherAccident" alt="HCFA_10_CBox_c_PATIENTSCONDITIONOTHERACCIDENT_No" onclick="checkBoxRadio('CheckUncheckPic_10_OtherAccident', 'HCFA_10_CBox_c_PATIENTSCONDITIONOTHERACCIDENT_No')"></td>
               	<td nowrap colspan="4">No</td>	
				</tr>			  
			  </table>
			  
			  <script language="JavaScript">						  
				checkBoxRadio('CheckUncheckPic_10_Employment', 'HCFA_10_CBox_a_PATIENTSCONDITIONEMPLOYMENT_No')			
				checkBoxRadio('CheckUncheckPic_10_AutoAccident', 'HCFA_10_CBox_b_PATIENTSCONDITIONAUTOACCIDENT_No')			
				checkBoxRadio('CheckUncheckPic_10_OtherAccident', 'HCFA_10_CBox_c_PATIENTSCONDITIONOTHERACCIDENT_No')					
			  </script>		
			  			
		  </td>
          <td nowrap><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter the insured\'s policy or group number as it appears on the insured’s health care identification card. If Item Number 4 is completed, then this field should be completed. Do not use a hyphen or space as a separator within the policy or group number.<br><br><strong>Description:</strong> The insured\'s policy, group, or FECA number refers to the alphanumeric identifier for the health, auto, or other insurance plan coverage. For worker\'s compensation claims the worker\'s compensation carrier\'s alphanumeric identifier would be used. The FECA number is the 9-digit alphanumeric identifier assigned to a patient claiming work-related condition(s) under the Federal Employees Compensation Act 5 USC 8101.<br><br><strong>Field Specification:</strong> This field allows for the entry of 29 characters.');" onmouseout="hideTip(this);">11. INSURED'S POLICY GROUP OR FECA NUMBER</span><BR><input type="Text" name="HCFA_11_TBox_InsuredsPolicyGroupFecaNumber" size="45" maxlength="29" class="HCFATextBox"></td>
		</tr>
        <tr>
          <td nowrap width=200><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter the policy or group number of the other insured. Do not use a hyphen or space as a separator within the policy or group number.<br><br><strong>Description:</strong> The other insured’s policy or group number identifies the policy or group number for coverage of the insured as indicated in Item Number 9.<br><br><strong>Field Specification:</strong> This field allows for the entry of 28 characters.');" onmouseout="hideTip(this);">a.&nbsp;OTHER&nbsp;INSURED'S&nbsp;POLICY&nbsp;OR&nbsp;GROUP&nbsp;NUMBER</span><br><input type="Text" name="HCFA_9_TBox_a_OtherInsuredsPolicyGroupFecaNumber" value="" size="50" maxlength="28" class="HCFATextBox"></td>
          <td nowrap>
         
		  	<table cellSpacing=0 cellPadding=0 border=0>
              <tbody>
              <tr>
                <td nowrap colspan="2"><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter the 8-digit date of birth (MM | DD | CCYY) of the insured and an X to indicate the sex of the insured. Only one box can be marked. If gender is unknown, leave blank.<br><br><strong>Description:</strong> The insured’s date of birth and sex (gender) refers to the birth date and gender of the insured as indicated in Item Number 1a.<br><br><strong>Field Specification:</strong> This field allows for the entry of the following: 2 characters under MM, 2 characters under DD, 4 characters under YY, and 1 character in either box.');" onmouseout="hideTip(this);">a.&nbsp;INSURED'S&nbsp;BIRTH&nbsp;DATE</span></td></tr>
              <tr>
                <td nowrap align=middle>
                  <table cellpadding="0" cellspacing="0" border="0">
                    <tbody>
                    <tr>
                      <td nowrap align=middle>MM&nbsp;</td>
                      <td nowrap>|</td>
                      <td nowrap align=middle>DD&nbsp;</td>
                      <td nowrap>|</td>
                      <td nowrap align=middle>YY&nbsp;</td></tr>
                    <tr>
                      <td nowrap><input type="Text" name="HCFA_11_TBox_a_InsuredsBirthDateMM" size="2" maxlength="2" class="HCFATextBox"></td>
                      <td nowrap valign="top">|</td>
                      <td nowrap><input type="Text" name="HCFA_11_TBox_a_InsuredsBirthDateDD" size="2" maxlength="2" class="HCFATextBox"></td>
                      <td nowrap valign="top">|</td>
                      <td nowrap><input type="Text" name="HCFA_11_TBox_a_InsuredsBirthDateYY" size="4" maxlength="4" class="HCFATextBox"></td></tr></tbody></table></td>
                <td nowrap align=middle width=70 colSpan=2>
                  <table>
                    <tbody>
                    <tr>
                      <td nowrap align=middle colSpan=4>SEX</td></tr>
                   
				   <input type="Hidden" name="HCFA_11_CBox_a_Sex_Male" value="">
				   <input type="Hidden" name="HCFA_11_CBox_a_Sex_Female" value="">
				   
				    <tr>
                      <td nowrap align=middle>M </td>
                      <td nowrap><img src="images/Checkbox1.gif" name="CheckUncheckPic_11a" alt="HCFA_11_CBox_a_Sex_Male" onclick="checkBoxRadio('CheckUncheckPic_11a', 'HCFA_11_CBox_a_Sex_Male')"></td>
                      <td nowrap align=middle>F </td>
                      <td nowrap><img src="images/Checkbox1.gif" name="CheckUncheckPic_11a" alt="HCFA_11_CBox_a_Sex_Female" onclick="checkBoxRadio('CheckUncheckPic_11a', 'HCFA_11_CBox_a_Sex_Female')"></td></tr></tbody></table></td></tr></tbody></table>
		  
		  
		  </td>
		</tr><!-- b -->
        <tr>
          <td nowrap>
          
		  <table cellSpacing=0 cellPadding=0 border=0>
              <tbody>
              <tr>
                <td nowrap colspan="2"><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter the 8-digit date of birth (MM | DD | CCYY) of the other insured and an X to indicate the sex of the other insured. Only one box can be marked. If gender is unknown, leave blank.<br><br><strong>Description:</strong> The other insured’s date of birth and sex (gender) identifies the birth date and gender of the insured as indicated in Item Number 9.<br><br><strong>Field Specification:</strong> This field allows for the entry of the following: 2 characters under MM, 2 characters under DD, 4 characters under YY, and 1 character in either box.');" onmouseout="hideTip(this);">b.&nbsp;OTHER&nbsp;INSURED'S&nbsp;BIRTH&nbsp;DATE</span></td></tr>
              <tr>
                <td nowrap align=middle>
                  <table cellpadding="0" cellspacing="0" border="0">
                    <tbody>
                    <tr>
                      <td nowrap align=middle>MM&nbsp;</td>
                      <td nowrap>|</td>
                      <td nowrap align=middle>DD&nbsp;</td>
                      <td nowrap>|</td>
                      <td nowrap align=middle>YY&nbsp;</td></tr>
                    <tr>
                      <td nowrap><input type="Text" name="HCFA_9_TBox_b_OtherInsuredsBirthDateMM" size="2" maxlength="2" class="HCFATextBox"></td>
                      <td nowrap valign="top">|</td>
                      <td nowrap><input type="Text" name="HCFA_9_TBox_b_OtherInsuredsBirthDateDD" size="2" maxlength="2" class="HCFATextBox"></td>
                      <td nowrap valign="top">|</td>
                      <td nowrap><input type="Text" name="HCFA_9_TBox_b_OtherInsuredsBirthDateYY" size="4" maxlength="4" class="HCFATextBox"></td></tr></tbody></table></td>
                <td nowrap align=middle width=70 colSpan=2>
                  <table>
                    <tbody>
                    <tr>
                      <td nowrap align=middle colSpan=4>SEX</td></tr>
                   
				   <input type="Hidden" name="HCFA_9_CBox_b_Sex_Male" value="">
				   <input type="Hidden" name="HCFA_9_CBox_b_Sex_Female" value="">
				   
				    <tr>
                      <td nowrap align=middle>M </td>
                      <td nowrap><img src="images/Checkbox1.gif" name="CheckUncheckPic_9b" alt="HCFA_9_CBox_b_Sex_Male" onclick="checkBoxRadio('CheckUncheckPic_9b', 'HCFA_9_CBox_b_Sex_Male')"></td>
                      <td nowrap align=middle>F </td>
                      <td nowrap><img src="images/Checkbox1.gif" name="CheckUncheckPic_9b" alt="HCFA_9_CBox_b_Sex_Female" onclick="checkBoxRadio('CheckUncheckPic_9b', 'HCFA_9_CBox_b_Sex_Female')"></td></tr></tbody></table></td></tr></tbody></table>
		  	  
		  </td>
          <td nowrap width=200><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Employer\'s Name and School Name do not exist in the electronic 837 Professional 4010A1. Enter the name of the insured\'s employer or school.<br><br><strong>Description:</strong> The insured’s employer\'s name or school name refers to the name of the employer or school attended by the insured as indicated in Item Number 1a.<br><br><strong>Field Specification:</strong> This field allows for the entry of 29 characters.');" onmouseout="hideTip(this);">b.&nbsp;EMPLOYER'S&nbsp;NAME&nbsp;OR&nbsp;SCHOOL&nbsp;NAME&nbsp;</span><BR><input type="Text" name="HCFA_11_TBox_b_EmployersNameOrSchoolName" size="45" maxlength="29" class="HCFATextBox"></td></tr><!-- c -->
        <tr>
          <td nowrap><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Employer’s Name and School Name do not exist in the electronic 837 Professional 4010A1. Enter the name of the other insured’s employer or school.<br><br><strong>Description:</strong> The employer’s name or school name identifies the name of the employer or school attended by the other insured as indicated in Item Number 9.<br><br><strong>Field Specification:</strong> This field allows for the entry of 28 characters.');" onmouseout="hideTip(this);">c.&nbsp;EMPLOYER'S&nbsp;NAME&nbsp;OR&nbsp;SCHOOL&nbsp;NAME</span><BR><input type="Text" name="HCFA_9_TBox_c_EmployersNameOrSchoolName" size="50" maxlength="28" class="HCFATextBox"></td>
          <td nowrap><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter the insurance plan or program name of the insured. Some payers require an identification number of the primary insurer rather than the name in this field.<br><br><strong>Description:</strong> The insurance plan name or program name refers to the name of the plan or program of the insured as indicated in Item Number 1a.<br><br><strong>Field Specification:</strong> This field allows for the entry of 29 characters.');" onmouseout="hideTip(this);">c.&nbsp;INSURANCE&nbsp;PLAN&nbsp;NAME&nbsp;OR&nbsp;PROGRAM&nbsp;NAME</span><BR><input type="Text" name="HCFA_11_TBox_c_InsurancePlanNameOrProgramName" size="45" maxlength="29" class="HCFATextBox"></td></tr><!-- d -->
        <tr>
          <td nowrap><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter the other insured’s insurance plan or program name.<br><br><strong>Description:</strong> The insurance plan name or program name identifies the name of the plan or program of the other insured as indicated in Item Number 9.<br><br><strong>Field Specification:</strong> This field allows for the entry of 28 characters.');" onmouseout="hideTip(this);">d.&nbsp;INSURANCE&nbsp;PLAN&nbsp;NAME&nbsp;OR&nbsp;PROGRAM&nbsp;NAME</span><BR><input type="Text" name="HCFA_9_TBox_d_InsurancePlanNameOrProgramName" size="50" maxlength="28" class="HCFATextBox"></td>
          <td nowrap><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Please refer to the most current instructions from the applicable public or private payer regarding the use of this field.<br>When required by payers to provide the sub-set of Condition Codes approved by the NUCC, enter the Condition Code in this field. The Condition Codes approved for use on the 1500 Claim Form are available at www.nucc.org under Code Sets.<br><br><strong>Field Specification:</strong> This field allows for the entry of 19 characters.');" onmouseout="hideTip(this);">10d.&nbsp;RESERVED&nbsp;FOR&nbsp;LOCAL&nbsp;USE</span><BR><input type="Text" name="HCFA_10_TBox_d_ReservedForLocalUse" size="50" maxlength="19" class="HCFATextBox"></td>
          <td nowrap>
            <table>
              <tbody>
              <tr>
                <td nowrap colSpan=6><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> When appropriate, enter an X in the correct box. If marked \'YES\', complete 9 and 9a–d. Only one box can be marked.<br><br><strong>Description:</strong> \'Is there another health benefit plan\' indicates that the patient has insurance coverage other than the plan indicated in Item Number 1.<br><br><strong>Field Specification:</strong> This field allows for the entry of 1 character in either box.');" onmouseout="hideTip(this);">d. IS THERE ANOTHER HEALTH BENEFIT PLAN</span></td>
			  </tr>
              <input type="Hidden" name="HCFA_11_CBox_d_OtherHealthBenefitPlan_Yes" value="">
			  <input type="Hidden" name="HCFA_11_CBox_d_OtherHealthBenefitPlan_No" value="">				   
		      <tr>
            	<td nowrap><img src="images/Checkbox1.gif" name="CheckUncheckPic_11d" alt="HCFA_11_CBox_d_OtherHealthBenefitPlan_Yes" onclick="checkBoxRadio('CheckUncheckPic_11d', 'HCFA_11_CBox_d_OtherHealthBenefitPlan_Yes')"></td>
                <td nowrap align=middle>Yes</td>
                <td nowrap><img src="images/Checkbox1.gif" name="CheckUncheckPic_11d" alt="HCFA_11_CBox_d_OtherHealthBenefitPlan_No" onclick="checkBoxRadio('CheckUncheckPic_11d', 'HCFA_11_CBox_d_OtherHealthBenefitPlan_No')"></td>
			  	<td nowrap align=middle>No</td>
				 <td nowrap align=right>If Yes, return to complet 9 a-d.</td>
			  </tr>
			  		  
			  </tbody>
			</table>
		 </td>
		</tr><!--12,13-->
        <tr>
          <td nowrap colSpan=2>		  	
			<table cellspacing="0" cellpadding="0" border="0">
				<tr>
				    <td align="center" colspan="5">READ BACK OF FORM BEFORE COMPLETING &amp; SIGNING THIS FORM</td>
				</tr>	
				<tr>
				    <td colspan="5"><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter \'Signature on File,\' \'SOF,\' or legal signature. When legal signature, enter date signed in 6 digit format (MMDDYY) or 8-digit format (MMDDCCYY). If there is no signature on file, leave blank or enter \'No Signature on File.\'<br><br><strong>Description:</strong> The patient\'s or authorized person\'s signature indicates there is an authorization on file for the release of any medical or other information necessary to process and/or adjudicate the claim.<br><br><strong>Field Specification:</strong> Use the space available to enter signature/information and date.');" onmouseout="hideTip(this);">12. PATIENT’S OR AUTHORIZED PERSON’S SIGNATURE I authorize the release of any medical or other<br>information necessaryto process this claim. I also request payment of government benefits either to myself or to the<br>party who accepts assignment below.</span></td>
				</tr>
				<tr>
				    <td colspan="5" class="siteTextLabel">&nbsp;</td>
				</tr>	
				<tr>				    
				    <td valign="bottom" align="right"><br>SIGNED</td>
				    <td valign="bottom">&nbsp;&nbsp;<input type="Text" name="HCFA_12_TBox_SignatureOnFile" class="HCFAUnderlinedTextbox" size="60" maxlength="100" value="SIGNATURE ON FILE"></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>				   
				  	<td valign="bottom" align="right"><br>DATE</td>
				    <td valign="bottom">&nbsp;&nbsp;<input type="Text" name="HCFA_12_TBox_SignatureOnFileDateMM" size="2" maxlength="2" class="HCFAUnderlinedTextbox" value="#DateFormat(NOW(), 'MM')#"><input type="Text" size="1" disabled class="HCFAUnderlinedTextbox" value="/"><input type="Text" name="HCFA_12_TBox_SignatureOnFileDateDD" size="2" maxlength="2" class="HCFAUnderlinedTextbox" value="#DateFormat(NOW(), 'DD')#"><input type="Text" size="1" disabled class="HCFAUnderlinedTextbox" value="/"><input type="Text" name="HCFA_12_TBox_SignatureOnFileDateYY" size="2" maxlength="2" class="HCFAUnderlinedTextbox" value="#DateFormat(NOW(), 'YY')#"></td>
				</tr>				
			</table>			  
		  </td>
		  
		  <td nowrap colSpan=2>		  	
			<table cellspacing="0" cellpadding="0" border="0">				
				<tr>
				    <td colspan="2"><span style="cursor: hand" onclick="doTooltip(1, this, event, 'Instructions: Enter \'Signature on File,\' \'SOF,\' or legal signature. If there is no signature on file, leave blank or enter \'No Signature on File.\'<br><br><strong>Description:</strong> The insured\'s or authorized person\'s signature indicates that there is a signature on file authorizing payment of medical benefits.<br><br><strong>Field Specification:</strong> Use the space available to enter signature/information.');" onmouseout="hideTip(this);">13. INSURED OR AUTHORIZED PERSON SIGNATURE I authorize<br>payment of medical benefits to the undersigned physician or supplier<br>for services described below.</span></td>
				</tr>
				<tr>
				    <td colspan="5" class="siteTextLabel">&nbsp;</td>
				</tr>	
				<tr>
				    <td colspan="2" class="siteTextLabel">&nbsp;</td>
				</tr>	
				<tr>
				    <td valign="bottom" align="right"><br>SIGNED</td>
				    <td valign="bottom">&nbsp;&nbsp;<input type="Text" name="HCFA_13_TBox_SignatureOnFile" class="HCFAUnderlinedTextbox" size="40" maxlength="100" value="SIGNATURE ON FILE"></td>
				</tr>				
			</table>			  
		  </td>         
        <tr>
          <td nowrap width=210>
		  	<table cellpadding="0" cellspacing="0" border="0">
              <tbody>
                <tr>
                  <td nowrap colSpan=5><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter the 6-digit (MM | DD | YY) or 8-digit (MM | DD | CCYY) date of the first date of the present illness, injury, or pregnancy. For pregnancy, use the date of the last menstrual period (LMP) as the first date.<br><br><strong>Description:</strong> The date of current illness, injury, pregnancy refers to the first date of onset of illness, the actual date of injury, or the LMP for pregnancy.<br><br><strong>Field Specification:</strong> This field allows for the entry of the following: 2 characters under MM, 2 characters under DD, and 4 characters under YY.');" onmouseout="hideTip(this);">14. Date of Current</span></td>
                  <td>&nbsp;&nbsp;</td>
				  <td nowrap rowspan="4" width=6 valign="middle">					  
					<br><table border="0" cellpadding="0" cellspacing="0" align="left">
						<tr valign="top">
							<td bgcolor="ff00000" width="1" height="30"></td>
						</tr>
					  </table>	
					 <br> 			  
				  </td>
				   <td>&nbsp;&nbsp;</td>
                  <td nowrap rowspan="3">ILLNESS (First Symtom) OR<br>INJURY (Accident) OR<br>PREGNANCY (LMP)</td>
				</tr>
			    <tr>
                     <td nowrap align=middle>MM&nbsp;</td>
                     <td nowrap>|</td>
                     <td nowrap align=middle>DD&nbsp;</td>
                     <td nowrap>|</td>
                     <td nowrap align=middle>YY&nbsp;</td></tr>
                   <tr>				
					 <td nowrap><input type="Text" name="HCFA_14_TBox_DateOfCurrentIllnessMM" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom, 'MM')#"></td>
                     <td nowrap valign="top">|</td>
                     <td nowrap><input type="Text" name="HCFA_14_TBox_DateOfCurrentIllnessDD" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom, 'DD')#"></td>
                     <td nowrap valign="top">|</td>
                     <td nowrap><input type="Text" name="HCFA_14_TBox_DateOfCurrentIllnessYY" size="4" maxlength="4" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom, 'YYYY')#"></td>
				 </tr>
				</tbody>
				</table>
          </td>
          <td nowrap width=230>
            <table cellSpacing=0 cellPadding=0>
              <tbody>
              <tr style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter the first date the patient had the same or a similar illness. Enter the date in the 6-digit format (MM | DD | YY) or 8-digit format (MM | DD | CCYY). Previous pregnancies are not a similar illness. Leave blank if unknown.<br><br><strong>Description:</strong> A patient having had same or similar illness would indicate that the patient had a previously related condition.<br><br><strong>Field Specification:</strong> This field allows for the entry of the following: 2 characters under MM, 2 characters under DD, and 4 characters under YY.');" onmouseout="hideTip(this);">
                <td nowrap>15.</td>
			  	<td colspan="2">If Patient Has Had Same Or Similar Illness.</td>
			  </tr>
              <tr>
                <td>&nbsp;</td>
				<td nowrap>Give First Date</td>
                <td nowrap align=right>
                  <table cellpadding="0" cellspacing="2">
                    <tbody>
                    <tr>
                      <td nowrap align=middle>MM</td>
                      <td nowrap>|</td>
                      <td nowrap align=middle>DD</td>
                      <td nowrap>|</td>
                      <td nowrap align=middle>YY</td>
					</tr>
                    <tr>
                     <td nowrap><input type="Text" name="HCFA_15_TBox_DateOfSimilarIllnessMM" size="2" maxlength="2" class="HCFATextBox"></td>
                     <td nowrap valign="top">|</td>
                     <td nowrap><input type="Text" name="HCFA_15_TBox_DateOfSimilarIllnessDD" size="2" maxlength="2" class="HCFATextBox"></td>
                     <td nowrap valign="top">|</td>
                     <td nowrap><input type="Text" name="HCFA_15_TBox_DateOfSimilarIllnessYY" size="4" maxlength="4" class="HCFATextBox"></td>
				 	</tr>
				    </tbody>
				 </table>
			  </td>
			 </tr>
			 </tbody>
			</table>
		  </td>
         
		  <td nowrap width=270>
            <table cellSpacing=0 cellPadding=0>
              <tbody>
              <tr>
                <td nowrap colSpan=3><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> If the patient is employed and is unable to work in current occupation, a 6-digit (MM | DD | YY) or 8-digit (MM | DD | CCYY) date must be shown for the \'from–to\' dates that the patient is unable to work. An entry in this field may indicate employment-related insurance coverage.<br><br><strong>Description:</strong> Dates patient unable to work in current occupation would refer to the time span the patient is or was unable to work.<br><br><strong>Field Specification:</strong> This field allows for the entry of the following in each of the date fields: 2 characters under MM, 2 characters under DD, and 4 characters under YY.');" onmouseout="hideTip(this);">16. Dates Patient Unable to Work in Current Occupation</span></td></tr>
              <tr>
                <td nowrap>
                  <table cellpadding="0" cellspacing="1">
                    <tbody>
                    <tr>
                      <td nowrap>&nbsp;</td>
                      <td nowrap align=middle>MM&nbsp;</td>
                      <td nowrap>|</td>
                      <td nowrap align=middle>DD&nbsp;</td>
                      <td nowrap>|</td>
                      <td nowrap align=middle>YY&nbsp;</td>
					</tr>
                    <tr>
					 <td nowrap>FROM:</td>
                     <td nowrap><input type="Text" name="HCFA_16_TBox_DatePatientUnableFromMM" size="2" maxlength="2" class="HCFATextBox"></td>
                     <td nowrap valign="top">|</td>
                     <td nowrap><input type="Text" name="HCFA_16_TBox_DatePatientUnableFromDD" size="2" maxlength="2" class="HCFATextBox"></td>
                     <td nowrap valign="top">|</td>
                     <td nowrap><input type="Text" name="HCFA_16_TBox_DatePatientUnableFromYY" size="4" maxlength="4" class="HCFATextBox"></td>
				 	</tr>
					</tbody></table></td>
                <td nowrap>&nbsp;</td>
                <td nowrap>
                  <table cellpadding="0" cellspacing="1">
                    <tbody>
                    <tr>
                      <td nowrap>&nbsp;</td>
                      <td nowrap align=middle>MM&nbsp;</td>
                      <td nowrap>|</td>
                      <td nowrap align=middle>DD&nbsp;</td>
                      <td nowrap>|</td>
                      <td nowrap align=middle>YY&nbsp;</td></tr>
                    <tr>
					 <td nowrap>TO:</td>
                     <td nowrap><input type="Text" name="HCFA_16_TBox_DatePatientUnableToMM" size="2" maxlength="2" class="HCFATextBox"></td>
                     <td nowrap valign="top">|</td>
                     <td nowrap><input type="Text" name="HCFA_16_TBox_DatePatientUnableToDD" size="2" maxlength="2" class="HCFATextBox"></td>
                     <td nowrap valign="top">|</td>
                     <td nowrap><input type="Text" name="HCFA_16_TBox_DatePatientUnableToYY" size="4" maxlength="4" class="HCFATextBox"></td>
				 	</tr>					  
				</tbody></table></td></tr></tbody></table></td></tr>
        <tr>
          
		  <cfset upinOnclick = "upinWindow=window.open('http://www.upinregistry.com','upinWindow','top=0,left=0,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=yes,menubar=yes,resizable=yes,width=#trim(session.screenWidth)#,height=#trim(session.screenHeight)#'); upinWindow.focus(0);"> 									
		  <td nowrap>
		  	<span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter the name (First Name, Middle Initial, Last Name) and credentials of the professional who referred or ordered the service(s) or supply(s) on the claim.<br><br><strong>Description:</strong> The name is the referring provider, ordering provider, or other source who referred or ordered the service(s) or supply(s) on the claim. Do not use periods or commas within the name. A hyphen can be used for hyphenated names.<br><br><strong>Field Specification:</strong> This field allows for the entry of 26 characters.');" onmouseout="hideTip(this);">17. Name Of Referring Physician Or Other Source</span><BR><input type="Text" name="HCFA_17_TBox_NameOfReferringPhysicianOrOtherSource" size="40" maxlength="26" class="HCFATextBox">
		 	&nbsp;&nbsp;<span class="sitelabel" style="cursor:hand" onclick="#trim(upinOnclick)#"><u>UPIN Registry</u></span>
		  </td>
          <td nowrap width=230><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions 17a:</strong> The Other ID number of the referring provider, ordering provider.<br><br><strong>Description:</strong> The non-NPI ID number of the referring provider, ordering provider or other source refers to the payer assigned unique identifier of the professional.<br><br><strong>Field Specification:</strong> This field allows for the entry of 17 characters in the Other ID## field.');" onmouseout="hideTip(this);">17a. I.D. Number of Referring Physician</span><BR><input type="Text" name="HCFA_17_TBox_a_IDNumberOfReferringPhysician" size="50" maxlength="17" class="HCFATextBox"></td>
          <td nowrap width=270>
            <table cellSpacing=0 cellPadding=0>
              <tbody>
              <tr>
                <td nowrap colSpan=3><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter the inpatient 6-digit (MM | DD | YY) or 8-digit (MM | DD | CCYY) hospital admission date followed by the discharge date (if discharge has occurred). If not discharged, leave discharge date blank. This date is when a medical service is furnished as a result of, or subsequent to, a related hospitalization.<br><br><strong>Description:</strong> The hospitalization dates related to current services would refer to an inpatient stay and indicates the admission and discharge dates associated with the service(s) on the claim.<br><br><strong>Field Specification:</strong> This field allows for the entry of the following in each of the date fields: 2 characters under MM, 2 characters under DD, and 4 characters under YY.');" onmouseout="hideTip(this);">18. Hospitalization Dates Related To Current Services</span></td></tr>
              <tr>
                <td nowrap>
                  <table cellpadding="0" cellspacing="1">
                    <tbody>
                    <tr>
                      <td nowrap>&nbsp;</td>
                      <td nowrap align=middle>MM&nbsp;</td>
                      <td nowrap>|</td>
                      <td nowrap align=middle>DD&nbsp;</td>
                      <td nowrap>|</td>
                      <td nowrap align=middle>YY&nbsp;</td></tr>
                    <tr>
					 <td nowrap>FROM:</td>
                     <td nowrap><input type="Text" name="HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesFromMM" size="2" maxlength="2" class="HCFATextBox"></td>
                     <td nowrap valign="top">|</td>
                     <td nowrap><input type="Text" name="HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesFromDD" size="2" maxlength="2" class="HCFATextBox"></td>
                     <td nowrap valign="top">|</td>
                     <td nowrap><input type="Text" name="HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesFromYY" size="4" maxlength="4" class="HCFATextBox"></td>
				 	</tr>
					</tbody></table></td>
                <td nowrap>&nbsp;</td>
                <td nowrap>
                  <table cellpadding="0" cellspacing="1">
                    <tbody>
                    <tr>
                      <td nowrap>&nbsp;</td>
                      <td nowrap align=middle>MM&nbsp;</td>
                      <td nowrap>|</td>
                      <td nowrap align=middle>DD&nbsp;</td>
                      <td nowrap>|</td>
                      <td nowrap align=middle>YY&nbsp;</td></tr>
                    <tr>
					 <td nowrap>To:</td>
                     <td nowrap><input type="Text" name="HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesToMM" size="2" maxlength="2" class="HCFATextBox"></td>
                     <td nowrap valign="top">|</td>
                     <td nowrap><input type="Text" name="HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesToDD" size="2" maxlength="2" class="HCFATextBox"></td>
                     <td nowrap valign="top">|</td>
                     <td nowrap><input type="Text" name="HCFA_18_TBox_HospitalizationDatesRelatedToCurrentServicesToYY" size="4" maxlength="4" class="HCFATextBox"></td>
				 	</tr>
					</tbody></table></td></tr></tbody></table></td></tr><!-- 19, 20-->
        <tr>
          <td nowrap width=440 colSpan=2><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Please refer to the most current instructions from the applicable public or private payer regarding the use of this field. Some payers ask for certain identifiers in this field. If identifiers are reported in this field, the appropriate qualifiers describing the identifier should be used. Do not enter a space, hyphen, or other separator between the qualifier code and the number.&nbsp;&nbsp;<strong>Field Specification:</strong> This field allows for the entry of 83 characters.');" onmouseout="hideTip(this);">19. Reserved For USER Use</span><BR><input type="Text" name="HCFA_19_TBox_ReservedForUSERUse" size="110" maxlength="83" class="HCFATextBox"></td>
          <td nowrap width=230>
            <table cellSpacing="0" cellPadding="0" border="0">
              <tbody>
              <tr>
                <td nowrap width=100 colSpan=5><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Complete this field when billing for purchased services. Enter an X in \'YES\' if the reported service(s) was performed by an entity other than the billing provider. If \'YES\', enter the purchased price under charges. A \'YES\' mark indicates that an entity other than the entity billing for the service performed the purchased services. A \'NO\' mark indicates that no purchased services are included on the claim. When \'YES\' is annotated, Item Number 32 must be completed. When billing for multiple purchased services, each service should be submitted on a separate claim form. Only one box can be marked.<br><br>When entering the charge amount, enter the dollar amount to the left of the vertical line and the cents to the right of the vertical line. Enter number right justified in the dollar area of the field and left justified in the cents area of the field. Do not use commas when reporting dollar amounts. Negative dollar amounts are not allowed. Dollar signs should not be entered. Enter 00 in the cents area if the amount is a whole number.<br><br><strong>Description:</strong> Outside lab? $Charges indicates that services have been rendered by an independent provider as indicated in Item Number 32 and the related costs.<br><br><strong>Field Specification:</strong> This field allows for the entry of the following: 1 character in either box in the Outside Lab area and 8 characters to the left of the vertical line and 2 characters to the right of the vertical line in the $Charges area.');" onmouseout="hideTip(this);">20. Outside Lab?</span></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td nowrap colspan="10">$ Charges</td></tr>
              <tr>                
				<input type="Hidden" name="HCFA_20_CBox_OUTSIDELAB_Yes" value="">
				<input type="Hidden" name="HCFA_20_CBox_OUTSIDELAB_No" value="">							
                <td nowrap align="right"><img src="images/Checkbox1.gif" name="CheckUncheckPic_20_OutsideLab" alt="HCFA_20_CBox_OUTSIDELAB_Yes" onclick="checkBoxRadio('CheckUncheckPic_20_OutsideLab', 'HCFA_20_CBox_OUTSIDELAB_Yes')"></td>
                <td nowrap>&nbsp;Yes</td>
				<td nowrap align=right>&nbsp;&nbsp;</td>
			    <td nowrap align="right"><img src="images/Checkbox1.gif" name="CheckUncheckPic_20_OutsideLab" alt="HCFA_20_CBox_OUTSIDELAB_No" onclick="checkBoxRadio('CheckUncheckPic_20_OutsideLab', 'HCFA_20_CBox_OUTSIDELAB_No')"></td>
               	<td nowrap colspan="1">&nbsp;No</td>	
				<td>&nbsp;</td>
				<td>
					<table border="0" cellpadding="0" cellspacing="0" align="left">
						<tr valign="top">
							<td bgcolor="ff00000" width="1" height="23"></td>
						</tr>
					</table>						 			  
				</td>	
				<td>&nbsp;</td>	
				<td><input type="Text" name="HCFA_20_TBox_OutsideLabCharges1" size="15" maxlength="8" class="HCFATextBox" style="text-align:right;padding-right:3px"></td>
				<td>&nbsp;</td>	
				<td>
					<table border="0" cellpadding="0" cellspacing="0" align="left">
						<tr valign="top">
							<td bgcolor="ff00000" width="1" height="23"></td>
						</tr>
					</table>	
				</td>
				<td>&nbsp;</td>	
				<td><input type="Text" name="HCFA_20_TBox_OutsideLabCharges2" size="15" maxlength="8" class="HCFATextBox"></td>				
			  </tr>			  
			  </tbody></table></td></tr><!-- 21, 22, 23 -->
        <tr>
          <td nowrap width=440 colSpan=2>
            <table cellSpacing=0 cellPadding=0>
              <tbody>
              <tr>
                <td nowrap colSpan=2><span style="cursor: hand" onclick="doTooltip(1, this, event, 'Instructions: Enter the patient\'s diagnosis/condition. List up to four ICD-9-CM diagnosis codes. Relate lines 1, 2, 3, 4 to the lines of service in 24E by line number. Use the highest level of specificity. Do not provide narrative description in this field.<br>When entering the number, include a space (accommodated by the period) between the two sets of numbers. If entering a code with more than 3 beginning digits (e.g., E codes), enter the fourth digit on top of the period.<br><br><strong>Description:</strong> The diagnosis or nature of illness or injury refers to the sign, symptom, complaint, or condition of the patient relating to the service(s) on the claim.<br><br><strong>Field Specification:</strong> This field allows for the entry 3 characters prior to the period, 1 character above the period, and 4 characters after the period in each of the four line areas.');" onmouseout="hideTip(this);">21. Diagnosis Or Nature Of Illness Or Injury. (Related Items 1,2,3,or 4 To Item 24E By Line)</span></td></tr>
              <tr>
                <td nowrap>&nbsp;</td></tr>
              <tr>
                <td nowrap>1.&nbsp;&nbsp;<input type="Text" name="HCFA_21_TBox_Diagnosis1" size="15" maxlength="8" class="HCFATextBox" onkeyup="keyUp(this);" onblur="dxOnBlur(this)" style="padding-left:3px;height: 17px;border-right: ##ffffff 1px solid;border-top: ##ffffff 1px solid;font-size: .65em;border-left: ##ff0000 1px solid;color: ##000000;border-bottom: ##ff0000 1px solid;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.&nbsp;&nbsp;<input type="Text" name="HCFA_21_TBox_Diagnosis3" size="15" maxlength="8" class="HCFATextBox" onkeyup="keyUp(this);" onblur="dxOnBlur(this)" style="padding-left:3px;height: 17px;border-right: ##ffffff 1px solid;border-top: ##ffffff 1px solid;font-size: .65em;border-left: ##ff0000 1px solid;color: ##000000;border-bottom: ##ff0000 1px solid;"></td>
			  </tr>
              <tr>
                <td nowrap>2.&nbsp;&nbsp;<input type="Text" name="HCFA_21_TBox_Diagnosis2" size="15" maxlength="8" class="HCFATextBox" onkeyup="keyUp(this);" onblur="dxOnBlur(this)" style="padding-left:3px;height: 17px;border-right: ##ffffff 1px solid;border-top: ##ffffff 1px solid;font-size: .65em;border-left: ##ff0000 1px solid;color: ##000000;border-bottom: ##ff0000 1px solid;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.&nbsp;&nbsp;<input type="Text" name="HCFA_21_TBox_Diagnosis4" size="15" maxlength="8" class="HCFATextBox" onkeyup="keyUp(this);" onblur="dxOnBlur(this)" style="padding-left:3px;height: 17px;border-right: ##ffffff 1px solid;border-top: ##ffffff 1px solid;font-size: .65em;border-left: ##ff0000 1px solid;color: ##000000;border-bottom: ##ff0000 1px solid;"></td>
			  </tr>
				</tbody></table></td>
          <td nowrap>
            <table cellSpacing=0 cellPadding=0 border="0" width="100%">
              <tbody>
              <tr>
                <td nowrap width=230 colspan="2">
					<table cellspacing="0" cellpadding="1" border="0" width="100%">
					<tr>
					    <td colspan="3"><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> List the original reference number for resubmitted claims. Please refer to the most current instructions from the applicable public or private payer regarding the use of this field (e.g., code).<br><br><strong>Description:</strong> Medicaid resubmission means the code and original reference number assigned by the destination payer or receiver to indicate a previously submitted claim or encounter.<br><br><strong>Field Specification:</strong> This field allows for the entry of 11 characters in the Code area and 18 characters in the Original Ref. No. area.');" onmouseout="hideTip(this);">22. Medicaid Resubmission</span></td>
					</tr>
					<tr>
					    <td>CODE</td>
					    <td>&nbsp;</td>
					    <td>ORIGINAL REF. NO.</td>
					</tr>
					<tr>
					    <td><input type="Text" name="HCFA_22_TBox_MedicaidResubmission1" size="25" maxlength="11" class="HCFATextBox"></td>
					    <td>
							<table border="0" cellpadding="0" cellspacing="0" align="left">
								<tr valign="top">
									<td bgcolor="ff00000" width="1" height="18"></td>
								</tr>
							</table>
						</td>
					    <td><input type="Text" name="HCFA_22_TBox_MedicaidResubmission2" size="25" maxlength="18" class="HCFATextBox"></td>
					</tr>
				</table>
				</td>                
			  </tr>              
              <tr>
                <td nowrap width=230 colspan="2" style="border-top: ff0000 2px;border-style: solid; border-bottom: 0px;border-left: 0px;border-right: 0px;"><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter any of the following: prior authorization number, referral number, mammography precertification number, or Clinical Laboratory Improvement Amendments (CLIA) number, as assigned by the payer for the current service. Do not enter hyphens or spaces within the number.<br><br><strong>Description:</strong> The prior authorization number refers to the payer assigned number authorizing the service(s).<br><br><strong>Field Specification:</strong> This field allows for the entry of 29 characters.');" onmouseout="hideTip(this);">23. Prior Authorization Number</span><BR><input type="Text" name="HCFA_23_TBox_PriorAuthorizationNumber" size="60" maxlength="29" class="HCFATextBox"></td>                
			  </tr>
			  </tbody>
			</table>
		 </td>
		</tr><!--</table>-->
        <tr>
          <td nowrap colSpan=3>
            <table borderColor="FF0000" cellSpacing="0" cellPadding="0" width="100%" border="1" style="BORDER-RIGHT: ffffff 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: ffffff 1px solid; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; BORDER-LEFT: ffffff 1px solid; PADDING-TOP: 0px; BORDER-BOTTOM: ffffff 1px solid">
			  <tbody>
              <tr>
                <td nowrap colSpan=3>24.A</td>
                <td nowrap align=middle width=30>B</td>
                <td nowrap align=middle width=26>C</td>
                <td nowrap align=middle colSpan=2>D</td>
                <td nowrap align=middle width=67>E</td>
                <td nowrap align=middle width=55>F</td>
                <td nowrap align=middle width=34>G</td>
                <td nowrap align=middle width=28>H</td>
                <td nowrap align=middle width=23>I</td>
                <td nowrap align=middle width=22>J</td>
                <td nowrap align=middle width=62>K</td>
			 </tr>
             <tr>
                <td nowrap align=middle colSpan=3><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter date(s) of service, from and to: If one date of service only, enter that date under \'From.\' Leave \'To\' blank or re-enter \'From\' date. If grouping services, the place of service, procedure code, charges, and individual provider for each line must be identical for that service line. Grouping is allowed only for services on consecutive days. The number of days must correspond to the number of units in 24G.<br><br><strong>Description:</strong> Date(s) of service indicate the actual month, day, and year the service(s) was provided. Grouping services refers to a charge for a series of identical services without listing each date of service.<br><br><strong>Field Specification:</strong> This field allows for the entry of the following in each of the unshaded date fields: 2 characters under MM, 2 characters under DD, and 2 characters under YY.');" onmouseout="hideTip(this);">Date(s)&nbsp;Of&nbsp;Service</span></td>
                <td nowrap align=middle width=30 rowSpan=2><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> In 24B, enter the appropriate two-digit code from the Place of Service Code list for each item used or service performed. The Place of Service Codes are available at: www.cms.hhs.gov/states/posdata.pdf.<br><br><strong>Description:</strong> The Place of Service Code identifies the location where the service was rendered.<br><br><strong>Field Specification:</strong> This field allows for the entry of 2 characters in the unshaded area.');" onmouseout="hideTip(this);">Place<BR>Of<br>Service</span></td>
                <td nowrap align=middle width=26 rowSpan=2><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Type of Service.');" onmouseout="hideTip(this);">Type<BR>Of<br>Service</span></td>
                <td nowrap align=middle colSpan=2><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter the CPT or HCPCS code(s) and modifier(s) (if applicable) from the appropriate code set in effect on the date of service. This field accommodates the entry of up to four two-digit modifiers. The specific procedure code(s) must be shown without a narrative description.<br><br>When required by payers to provide additional anesthesia services information (e.g., begin and end times) or a narrative description of an unspecified code, enter the information in the shaded line of this field. Since there are no identifiers for these types of information, enter two blank spaces at the beginning of 24D before entering the information. The information may extend to 24H. (See examples on page 39.)<br><br>When required by payers to provide the NDC, VP – HIBCC, or OZ – GTIN codes to support billing HCPCS codes for products such as drugs, DME or supplies, enter the applicable identifier and number/code starting with the first space in the shaded line of this field. Do not enter a space, hyphen, or other separator between the identifier code and the number. The number/code may extend into 24E through 24H if the length cannot be accommodated in field 24D.<br><br><strong>Description:</strong> The procedures, services or supplies refer to a listing of identifying codes for reporting medical services and procedures.<br><br><strong>Field Specification:</strong> This field allows for the entry of the following: 6 characters in the unshaded area of the CPT/HCPCS field and four sets of 2 characters in the Modifier area.');" onmouseout="hideTip(this);">Procedures,&nbsp;Services,&nbsp;Or&nbsp;Supplies<BR>(Explain&nbsp;Unusual&nbsp;Circumstances)</span></td>
                <td nowrap align=middle width=67 rowSpan=2><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> In 24E, enter the diagnosis code reference number (pointer) as shown in Item Number 21 to relate the date of service and the procedures performed to the primary diagnosis. When multiple services are performed, the primary reference number for each service should be listed first, other applicable services should follow. The reference number(s) should be a 1, or a 2, or a 3, or a 4; or multiple numbers as explained. (ICD-9-CM diagnosis codes must be entered in Item Number 21 only. Do not enter them in 24E.) Enter numbers left justified in the field. Do not use commas between the numbers.<br><br><strong>Description:</strong> The diagnosis pointer refers to the line number from Item Number 21 that relates to the reason the service(s) was performed.<br><br><strong>Field Specification:</strong> This field allows for the entry of 4 characters in the unshaded area.');" onmouseout="hideTip(this);">Diagnosis<BR>Code</span></td>
                <td nowrap align=middle width=55 rowSpan=2><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter the charge for each listed service. Enter number right justified in the dollar area of the field. Do not use commas when reporting dollar amounts. Negative dollar amounts are not allowed. Dollar signs should not be entered. Enter 00 in the cents area if the amount is a whole number.<br><br><strong>Description:</strong> $ charges refers to the total billed amount for each service line.<br><br><strong>Field Specification:</strong> This field allows for the entry of 6 characters to the left of the vertical line and 2 characters to the right of the vertical line in the unshaded area.');" onmouseout="hideTip(this);">&nbsp;&nbsp;$&nbsp;Charges</span></td>
                <td nowrap align=middle width=34 rowSpan=2><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Enter the number of days or units. This field is most commonly used for multiple visits, units of supplies, anesthesia units or minutes, or oxygen volume. If only one service is performed, the numeral 1 must be entered.<br><br>Enter numbers left justified in the field. No leading zeros are required. If reporting a fraction of a unit, use the decimal point.<br><br>When required by payers to provide the NDC to support billing HCPCS codes for drugs and the defined NDC units and HCPCS units are not the same, enter the applicable NDC related units in the shaded area of this field.<br><br><strong>Description:</strong> Days or units refers to the number of days corresponding to the dates entered in 24A or units as defined in CPT or HCPCS coding manual(s).<br><br><strong>Field Specification:</strong> This field allows for the entry of 3 characters in the unshaded area.');" onmouseout="hideTip(this);">Days<br>Or<br>Units</span></td>
                <td nowrap align=middle width=28 rowSpan=2><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> If the claim is Early & Periodic Screening, Diagnosis, and Treatment related, enter Y for \'YES\' or N for \'NO\' in the unshaded area of the field. When N (\'NO\') is entered and required by payers to provide additional codified information (e.g., reason codes), enter it right justified in the shaded area of the field.<br><br>If the claim is Family Planning, enter Y (\'YES\') or leave blank if \'NO\' in the bottom, unshaded area of the field.<br><br><strong>Description:</strong> The EPSDT/family plan identifies certain services that may be covered under some state plans.<br><br><strong>Field Specification:</strong> This field allows for the entry of 1 character in the unshaded area.');" onmouseout="hideTip(this);">EPSOT<br>FAMILY<br>PLAN</span></td>
                <td nowrap align=middle width=23 rowSpan=2 valign="middle"><span style="cursor: hand" onclick="doTooltip(1, this, event, '<strong>Instructions:</strong> Check with trading partner to determine if this element (emergency indicator) is necessary. If required, enter Y for \'YES\' or leave blank if \'NO\' in the bottom, unshaded area of the field. The definition of emergency would be either defined by federal or state regulations or programs, payer contracts, or as defined in the electronic 837 Professional 4010A1 implementation guide.<br><br><strong>Field Specification:</strong> This field allows for the entry of 2 characters in the unshaded area.');" onmouseout="hideTip(this);">EMG</span></td>
                <td nowrap align=middle width=22 rowSpan=2 valign="middle"><span style="cursor: hand" onclick="doTooltip(1, this, event, 'Coordination of Benefits');" onmouseout="hideTip(this);">COB</span></td>
                <td nowrap align=middle width=62 rowSpan=2>RESERVED&nbsp;FOR<BR>LOCAL&nbsp;USE</td>
			 </tr>
             <tr>
                <td nowrap align=middle colSpan=2>From</td>
                <td nowrap align=middle>To</td>
                <td nowrap width=46 align="center">CPT/HCPCS</td>
                <td nowrap width=48 align="center">Modifier</td>
			 </tr>
             
			 <tr>
                <td nowrap width=4>1</td>
                <td nowrap align=middle width=70>
					<table cellpadding="0" cellspacing="1" border="0">
						<tr>
						 <td nowrap><input type="Text" name="HCFA_24_TBox_Line1_DateOfserviceFromMM" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[1], 'MM')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line1_DateOfserviceFromDD" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[1], 'DD')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line1_DateOfserviceFromYY" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[1], 'YY')#"></td>
					 	</tr>
					</table>					
				</td>
                <td nowrap align=middle>
					<table cellpadding="0" cellspacing="1" border="0">
						<tr>
						 <td nowrap><input type="Text" name="HCFA_24_TBox_Line1_DateOfserviceToMM" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateTo[1], 'MM')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line1_DateOfserviceToDD" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateTo[1], 'DD')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line1_DateOfserviceToYY" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateTo[1], 'YY')#"></td>
					 	</tr>
					</table>
				</td>
                <td nowrap align=middle><input type="Text" name="HCFA_24_TBox_Line1_PlaceOfService" size="2" maxlength="2" class="HCFATextBox" value="#trim(getProcedures.FacilityCode[1])#"></td>
                <td nowrap align=middle><input type="Text" name="HCFA_24_TBox_Line1_TypeOfService" size="2" maxlength="2" class="HCFATextBox"></td>
                <td nowrap><input type="Text" name="HCFA_24_TBox_Line1_CPTHCPCS" size="10" maxlength="10" class="HCFATextBox" value="#trim(getProcedures.HCPC[1])#"></td>
                <td nowrap width=48>
					
					
				<cfif IsNumeric(trim(getProcedures.ProcedureID[1]))>	
					
					<cfquery name="getModifiers" datasource="#trim(request.datasource)#">
						SELECT e.Modifier, e.Description
						FROM procedure_medicare_modifier p LEFT JOIN pa_master.EOB_MEDICARE_CLAIMMODIFIERCode e ON p.ModifierCode = e.RecordID 
						WHERE p.ProcedureID = #trim(getProcedures.ProcedureID[1])#
					</cfquery>
					
					<cfif getModifiers.Modifier[1] EQ "RR">
						<script language="JavaScript">
							document.all.HCFA_24_TBox_Line1_TypeOfService.value = "R";
						</script>	
					<cfelse>
						<script language="JavaScript">
							document.all.HCFA_24_TBox_Line1_TypeOfService.value = "P";
						</script>	
					</cfif>
										
					<cfset HCFA_24_TBox_Line1_Modifier1 = getModifiers.Modifier[1]>			
					<cfset HCFA_24_TBox_Line1_Modifier2 = getModifiers.Modifier[2]>			
					<cfset HCFA_24_TBox_Line1_Modifier3 = getModifiers.Modifier[3]>			
					<cfset HCFA_24_TBox_Line1_Modifier4 = getModifiers.Modifier[4]>			
				<cfelse>
					<cfset HCFA_24_TBox_Line1_Modifier1 = "">			
					<cfset HCFA_24_TBox_Line1_Modifier2 = "">			
					<cfset HCFA_24_TBox_Line1_Modifier3 = "">			
					<cfset HCFA_24_TBox_Line1_Modifier4 = "">							
				</cfif>	
					
					<table cellspacing="1" cellpadding="0" border="0">
						<tr>
						    <td><input type="Text" name="HCFA_24_TBox_Line1_Modifier1" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line1_Modifier1)#"></td>
							<td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_24_TBox_Line1_Modifier2" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line1_Modifier2)#"></td>
							<td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_24_TBox_Line1_Modifier3" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line1_Modifier3)#"></td>
							<td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_24_TBox_Line1_Modifier4" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line1_Modifier4)#"></td>
						</tr>
					</table>
				</td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line1_DiagnosisCode" size="6" maxlength="6" class="HCFATextBox"></td>
                <td nowrap align="center">
					<input type="Text" name="HCFA_24_TBox_Line1_Charges" onblur="changeTotalCharge();" size="8" maxlength="8" class="HCFATextBox" style="text-align:right;padding-right:3px" <cfif getProcedures.BilledAmount[1] NEQ "">value="#ListFirst(trim(getProcedures.BilledAmount[1]), '.')#"</cfif>>&nbsp;.
					<input type="Text" name="HCFA_24_TBox_Line1_ChargesCents" onblur="changeTotalCharge();" size="2" maxlength="2" class="HCFATextBox" style="text-align:right;padding-right:3px" <cfif getProcedures.BilledAmount[1] NEQ "">value="#Left(ListLast(trim(getProcedures.BilledAmount[1]), '.'), 2)#"</cfif>>				
				</td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line1_DaysOrUnits" size="4" maxlength="4" class="HCFATextBox" style="text-align:center;padding-right:3px" value="#trim(getProcedures.BilledQuantity[1])#"></td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line1_EPSDTFamilyPlan" size="3" maxlength="1" class="HCFATextBox"></td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line1_EMG" size="4" maxlength="4" class="HCFATextBox"></td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line1_COB" size="4" maxlength="4" class="HCFATextBox"></td>
                <td nowrap><input type="Text" name="HCFA_24_TBox_Line1_ReservedForLocalUse" size="30" maxlength="30" class="HCFATextBox"></td>
			</tr>
             			  
			<tr>
                <td nowrap width=4>2</td>
                <td nowrap align=middle width=70>
					<table cellpadding="0" cellspacing="1" border="0">
						<tr>
						 <td nowrap><input type="Text" name="HCFA_24_TBox_Line2_DateOfserviceFromMM" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[2], 'MM')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line2_DateOfserviceFromDD" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[2], 'DD')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line2_DateOfserviceFromYY" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[2], 'YY')#"></td>
					 	</tr>
					</table>					
				</td>
                <td nowrap align=middle>
					<table cellpadding="0" cellspacing="1" border="0">
						<tr>
						 <td nowrap><input type="Text" name="HCFA_24_TBox_Line2_DateOfserviceToMM" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateTo[2], 'MM')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line2_DateOfserviceToDD" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateTo[2], 'DD')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line2_DateOfserviceToYY" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateTo[2], 'YY')#"></td>
					 	</tr>
					</table>
				</td>
                <td nowrap align=middle><input type="Text" name="HCFA_24_TBox_Line2_PlaceOfService" size="2" maxlength="2" class="HCFATextBox" value="#trim(getProcedures.FacilityCode[2])#"></td>
                <td nowrap align=middle><input type="Text" name="HCFA_24_TBox_Line2_TypeOfService" size="2" maxlength="2" class="HCFATextBox"></td>
                <td nowrap><input type="Text" name="HCFA_24_TBox_Line2_CPTHCPCS" size="10" maxlength="10" class="HCFATextBox" value="#trim(getProcedures.HCPC[2])#"></td>
                <td nowrap width=48>
					
				<cfif IsNumeric(trim(getProcedures.ProcedureID[2]))>	
					
					<cfquery name="getModifiers" datasource="#trim(request.datasource)#">
						SELECT e.Modifier, e.Description
						FROM procedure_medicare_modifier p LEFT JOIN pa_master.EOB_MEDICARE_CLAIMMODIFIERCode e ON p.ModifierCode = e.RecordID 
						WHERE p.ProcedureID = #trim(getProcedures.ProcedureID[2])#
					</cfquery>
					
					<cfif getModifiers.Modifier[1] EQ "RR">
						<script language="JavaScript">
							document.all.HCFA_24_TBox_Line2_TypeOfService.value = "R";
						</script>	
					<cfelse>
						<script language="JavaScript">
							document.all.HCFA_24_TBox_Line2_TypeOfService.value = "P";
						</script>	
					</cfif>
										
					<cfset HCFA_24_TBox_Line2_Modifier1 = getModifiers.Modifier[1]>			
					<cfset HCFA_24_TBox_Line2_Modifier2 = getModifiers.Modifier[2]>			
					<cfset HCFA_24_TBox_Line2_Modifier3 = getModifiers.Modifier[3]>			
					<cfset HCFA_24_TBox_Line2_Modifier4 = getModifiers.Modifier[4]>			
				<cfelse>
					<cfset HCFA_24_TBox_Line2_Modifier1 = "">			
					<cfset HCFA_24_TBox_Line2_Modifier2 = "">			
					<cfset HCFA_24_TBox_Line2_Modifier3 = "">			
					<cfset HCFA_24_TBox_Line2_Modifier4 = "">							
				</cfif>		
					
					
					<table cellspacing="1" cellpadding="0" border="0">
						<tr>
						    <td><input type="Text" name="HCFA_24_TBox_Line2_Modifier1" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line2_Modifier1)#"></td>
							<td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_24_TBox_Line2_Modifier2" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line2_Modifier2)#"></td>
							<td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_24_TBox_Line2_Modifier3" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line2_Modifier3)#"></td>
							<td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_24_TBox_Line2_Modifier4" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line2_Modifier4)#"></td>
						</tr>
					</table>
				</td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line2_DiagnosisCode" size="6" maxlength="6" class="HCFATextBox"></td>
                <td nowrap align="center">
					<input type="Text" name="HCFA_24_TBox_Line2_Charges" onblur="changeTotalCharge();" size="8" maxlength="8" class="HCFATextBox" style="text-align:right;padding-right:3px" <cfif getProcedures.BilledAmount[2] NEQ "">value="#ListFirst(trim(getProcedures.BilledAmount[2]), '.')#"</cfif>>&nbsp;.
					<input type="Text" name="HCFA_24_TBox_Line2_ChargesCents" onblur="changeTotalCharge();" size="2" maxlength="2" class="HCFATextBox" style="text-align:right;padding-right:3px" <cfif getProcedures.BilledAmount[2] NEQ "">value="#Left(ListLast(trim(getProcedures.BilledAmount[2]), '.'), 2)#"</cfif>>				
				</td>
				<td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line2_DaysOrUnits" size="4" maxlength="4" class="HCFATextBox" style="text-align:center;padding-right:3px" value="#trim(getProcedures.BilledQuantity[2])#"></td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line2_EPSDTFamilyPlan" size="3" maxlength="1" class="HCFATextBox"></td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line2_EMG" size="4" maxlength="4" class="HCFATextBox"></td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line2_COB" size="4" maxlength="4" class="HCFATextBox"></td>
                <td nowrap><input type="Text" name="HCFA_24_TBox_Line2_ReservedForLocalUse" size="30" maxlength="30" class="HCFATextBox"></td>
			</tr>  
			
			<tr>
                <td nowrap width=4>3</td>
                <td nowrap align=middle width=70>
					<table cellpadding="0" cellspacing="1" border="0">
						<tr>
						 <td nowrap><input type="Text" name="HCFA_24_TBox_Line3_DateOfserviceFromMM" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[3], 'MM')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line3_DateOfserviceFromDD" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[3], 'DD')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line3_DateOfserviceFromYY" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[3], 'YY')#"></td>
					 	</tr>
					</table>					
				</td>
                <td nowrap align=middle>
					<table cellpadding="0" cellspacing="1" border="0">
						<tr>
						 <td nowrap><input type="Text" name="HCFA_24_TBox_Line3_DateOfserviceToMM" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateTo[3], 'MM')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line3_DateOfserviceToDD" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateTo[3], 'DD')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line3_DateOfserviceToYY" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateTo[3], 'YY')#"></td>
					 	</tr>
					</table>
				</td>
                <td nowrap align=middle><input type="Text" name="HCFA_24_TBox_Line3_PlaceOfService" size="2" maxlength="2" class="HCFATextBox" value="#trim(getProcedures.FacilityCode[3])#"></td>
                <td nowrap align=middle><input type="Text" name="HCFA_24_TBox_Line3_TypeOfService" size="2" maxlength="2" class="HCFATextBox"></td>
                <td nowrap><input type="Text" name="HCFA_24_TBox_Line3_CPTHCPCS" size="10" maxlength="10" class="HCFATextBox" value="#trim(getProcedures.HCPC[3])#"></td>
                <td nowrap width=48>
					
				<cfif IsNumeric(trim(getProcedures.ProcedureID[3]))>	
					
					<cfquery name="getModifiers" datasource="#trim(request.datasource)#">
						SELECT e.Modifier, e.Description
						FROM procedure_medicare_modifier p LEFT JOIN pa_master.EOB_MEDICARE_CLAIMMODIFIERCode e ON p.ModifierCode = e.RecordID 
						WHERE p.ProcedureID = #trim(getProcedures.ProcedureID[3])#
					</cfquery>
					
					<cfif getModifiers.Modifier[1] EQ "RR">
						<script language="JavaScript">
							document.all.HCFA_24_TBox_Line3_TypeOfService.value = "R";
						</script>	
					<cfelse>
						<script language="JavaScript">
							document.all.HCFA_24_TBox_Line3_TypeOfService.value = "P";
						</script>	
					</cfif>
										
					<cfset HCFA_24_TBox_Line3_Modifier1 = getModifiers.Modifier[1]>			
					<cfset HCFA_24_TBox_Line3_Modifier2 = getModifiers.Modifier[2]>			
					<cfset HCFA_24_TBox_Line3_Modifier3 = getModifiers.Modifier[3]>			
					<cfset HCFA_24_TBox_Line3_Modifier4 = getModifiers.Modifier[4]>			
				<cfelse>
					<cfset HCFA_24_TBox_Line3_Modifier1 = "">			
					<cfset HCFA_24_TBox_Line3_Modifier2 = "">			
					<cfset HCFA_24_TBox_Line3_Modifier3 = "">			
					<cfset HCFA_24_TBox_Line3_Modifier4 = "">							
				</cfif>			
					
					
					<table cellspacing="1" cellpadding="0" border="0">
						<tr>
						    <td><input type="Text" name="HCFA_24_TBox_Line3_Modifier1" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line3_Modifier1)#"></td>
							<td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_24_TBox_Line3_Modifier2" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line3_Modifier2)#"></td>
							<td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_24_TBox_Line3_Modifier3" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line3_Modifier3)#"></td>
							<td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_24_TBox_Line3_Modifier4" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line3_Modifier4)#"></td>
						</tr>
					</table>
				</td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line3_DiagnosisCode" size="6" maxlength="6" class="HCFATextBox"></td>
                <td nowrap align="center">
					<input type="Text" name="HCFA_24_TBox_Line3_Charges" onblur="changeTotalCharge();" size="8" maxlength="8" class="HCFATextBox" style="text-align:right;padding-right:3px" <cfif getProcedures.BilledAmount[3] NEQ "">value="#ListFirst(trim(getProcedures.BilledAmount[3]), '.')#"</cfif>>&nbsp;.
					<input type="Text" name="HCFA_24_TBox_Line3_ChargesCents" onblur="changeTotalCharge();" size="2" maxlength="2" class="HCFATextBox" style="text-align:right;padding-right:3px" <cfif getProcedures.BilledAmount[3] NEQ "">value="#Left(ListLast(trim(getProcedures.BilledAmount[3]), '.'), 2)#"</cfif>>				
				</td>
				<td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line3_DaysOrUnits" size="4" maxlength="4" class="HCFATextBox" style="text-align:center;padding-right:3px" value="#trim(getProcedures.BilledQuantity[3])#"></td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line3_EPSDTFamilyPlan" size="3" maxlength="1" class="HCFATextBox"></td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line3_EMG" size="4" maxlength="4" class="HCFATextBox"></td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line3_COB" size="4" maxlength="4" class="HCFATextBox"></td>
                <td nowrap><input type="Text" name="HCFA_24_TBox_Line3_ReservedForLocalUse" size="30" maxlength="30" class="HCFATextBox"></td>
			</tr>  
			  
			<tr>
                <td nowrap width=4>4</td>
                <td nowrap align=middle width=70>
					<table cellpadding="0" cellspacing="1" border="0">
						<tr>
						 <td nowrap><input type="Text" name="HCFA_24_TBox_Line4_DateOfserviceFromMM" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[4], 'MM')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line4_DateOfserviceFromDD" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[4], 'DD')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line4_DateOfserviceFromYY" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[4], 'YY')#"></td>
					 	</tr>
					</table>					
				</td>
                <td nowrap align=middle>
					<table cellpadding="0" cellspacing="1" border="0">
						<tr>
						 <td nowrap><input type="Text" name="HCFA_24_TBox_Line4_DateOfserviceToMM" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[4], 'MM')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line4_DateOfserviceToDD" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[4], 'DD')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line4_DateOfserviceToYY" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[4], 'YY')#"></td>
					 	</tr>
					</table>
				</td>
                <td nowrap align=middle><input type="Text" name="HCFA_24_TBox_Line4_PlaceOfService" size="2" maxlength="2" class="HCFATextBox" value="#trim(getProcedures.FacilityCode[4])#"></td>
                <td nowrap align=middle><input type="Text" name="HCFA_24_TBox_Line4_TypeOfService" size="2" maxlength="2" class="HCFATextBox"></td>
                <td nowrap><input type="Text" name="HCFA_24_TBox_Line4_CPTHCPCS" size="10" maxlength="10" class="HCFATextBox" value="#trim(getProcedures.HCPC[4])#"></td>
                <td nowrap width=48>
					
					
				<cfif IsNumeric(trim(getProcedures.ProcedureID[4]))>	
					
					<cfquery name="getModifiers" datasource="#trim(request.datasource)#">
						SELECT e.Modifier, e.Description
						FROM procedure_medicare_modifier p LEFT JOIN pa_master.EOB_MEDICARE_CLAIMMODIFIERCode e ON p.ModifierCode = e.RecordID 
						WHERE p.ProcedureID = #trim(getProcedures.ProcedureID[4])#
					</cfquery>
					
					<cfif getModifiers.Modifier[1] EQ "RR">
						<script language="JavaScript">
							document.all.HCFA_24_TBox_Line4_TypeOfService.value = "R";
						</script>	
					<cfelse>
						<script language="JavaScript">
							document.all.HCFA_24_TBox_Line4_TypeOfService.value = "P";
						</script>	
					</cfif>
										
					<cfset HCFA_24_TBox_Line4_Modifier1 = getModifiers.Modifier[1]>			
					<cfset HCFA_24_TBox_Line4_Modifier2 = getModifiers.Modifier[2]>			
					<cfset HCFA_24_TBox_Line4_Modifier3 = getModifiers.Modifier[3]>			
					<cfset HCFA_24_TBox_Line4_Modifier4 = getModifiers.Modifier[4]>			
				<cfelse>
					<cfset HCFA_24_TBox_Line4_Modifier1 = "">			
					<cfset HCFA_24_TBox_Line4_Modifier2 = "">			
					<cfset HCFA_24_TBox_Line4_Modifier3 = "">			
					<cfset HCFA_24_TBox_Line4_Modifier4 = "">							
				</cfif>	
					
					<table cellspacing="1" cellpadding="0" border="0">
						<tr>
						    <td><input type="Text" name="HCFA_24_TBox_Line4_Modifier1" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line4_Modifier1)#"></td>
							<td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_24_TBox_Line4_Modifier2" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line4_Modifier2)#"></td>
							<td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_24_TBox_Line4_Modifier3" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line4_Modifier3)#"></td>
							<td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_24_TBox_Line4_Modifier4" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line4_Modifier4)#"></td>
						</tr>
					</table>
				</td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line4_DiagnosisCode" size="6" maxlength="6" class="HCFATextBox"></td>
                <td nowrap align="center">
					<input type="Text" name="HCFA_24_TBox_Line4_Charges" onblur="changeTotalCharge();" size="8" maxlength="8" class="HCFATextBox" style="text-align:right;padding-right:3px" <cfif getProcedures.BilledAmount[4] NEQ "">value="#ListFirst(trim(getProcedures.BilledAmount[4]), '.')#"</cfif>>&nbsp;.
					<input type="Text" name="HCFA_24_TBox_Line4_ChargesCents" onblur="changeTotalCharge();" size="2" maxlength="2" class="HCFATextBox" style="text-align:right;padding-right:3px" <cfif getProcedures.BilledAmount[4] NEQ "">value="#Left(ListLast(trim(getProcedures.BilledAmount[4]), '.'), 2)#"</cfif>>				
				</td>
			    <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line4_DaysOrUnits" size="4" maxlength="4" class="HCFATextBox" style="text-align:center;padding-right:3px" value="#trim(getProcedures.BilledQuantity[4])#"></td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line4_EPSDTFamilyPlan" size="3" maxlength="1" class="HCFATextBox"></td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line4_EMG" size="4" maxlength="4" class="HCFATextBox"></td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line4_COB" size="4" maxlength="4" class="HCFATextBox"></td>
                <td nowrap><input type="Text" name="HCFA_24_TBox_Line4_ReservedForLocalUse" size="30" maxlength="30" class="HCFATextBox"></td>
			</tr>  
			  
            <tr>
                <td nowrap width=4>5</td>
                <td nowrap align=middle width=70>
					<table cellpadding="0" cellspacing="1" border="0">
						<tr>
						 <td nowrap><input type="Text" name="HCFA_24_TBox_Line5_DateOfserviceFromMM" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[5], 'MM')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line5_DateOfserviceFromDD" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[5], 'DD')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line5_DateOfserviceFromYY" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[5], 'YY')#"></td>
					 	</tr>
					</table>					
				</td>
                <td nowrap align=middle>
					<table cellpadding="0" cellspacing="1" border="0">
						<tr>
						 <td nowrap><input type="Text" name="HCFA_24_TBox_Line5_DateOfserviceToMM" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[5], 'MM')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line5_DateOfserviceToDD" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[5], 'DD')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line5_DateOfserviceToYY" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[5], 'YY')#"></td>
					 	</tr>
					</table>
				</td>
                <td nowrap align=middle><input type="Text" name="HCFA_24_TBox_Line5_PlaceOfService" size="2" maxlength="2" class="HCFATextBox" value="#trim(getProcedures.FacilityCode[5])#"></td>
                <td nowrap align=middle><input type="Text" name="HCFA_24_TBox_Line5_TypeOfService" size="2" maxlength="2" class="HCFATextBox"></td>
                <td nowrap><input type="Text" name="HCFA_24_TBox_Line5_CPTHCPCS" size="10" maxlength="10" class="HCFATextBox" value="#trim(getProcedures.HCPC[5])#"></td>
                <td nowrap width=48>
					
				<cfif IsNumeric(trim(getProcedures.ProcedureID[5]))>	
					
					<cfquery name="getModifiers" datasource="#trim(request.datasource)#">
						SELECT e.Modifier, e.Description
						FROM procedure_medicare_modifier p LEFT JOIN pa_master.EOB_MEDICARE_CLAIMMODIFIERCode e ON p.ModifierCode = e.RecordID 
						WHERE p.ProcedureID = #trim(getProcedures.ProcedureID[5])#
					</cfquery>
						
					<cfif getModifiers.Modifier[1] EQ "RR">
						<script language="JavaScript">
							document.all.HCFA_24_TBox_Line5_TypeOfService.value = "R";
						</script>	
					<cfelse>
						<script language="JavaScript">
							document.all.HCFA_24_TBox_Line5_TypeOfService.value = "P";
						</script>	
					</cfif>
										
					<cfset HCFA_24_TBox_Line5_Modifier1 = getModifiers.Modifier[1]>			
					<cfset HCFA_24_TBox_Line5_Modifier2 = getModifiers.Modifier[2]>			
					<cfset HCFA_24_TBox_Line5_Modifier3 = getModifiers.Modifier[3]>			
					<cfset HCFA_24_TBox_Line5_Modifier4 = getModifiers.Modifier[4]>			
				<cfelse>
					<cfset HCFA_24_TBox_Line5_Modifier1 = "">			
					<cfset HCFA_24_TBox_Line5_Modifier2 = "">			
					<cfset HCFA_24_TBox_Line5_Modifier3 = "">			
					<cfset HCFA_24_TBox_Line5_Modifier4 = "">							
				</cfif>		
					
					<table cellspacing="1" cellpadding="0" border="0">
						<tr>
						    <td><input type="Text" name="HCFA_24_TBox_Line5_Modifier1" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line5_Modifier1)#"></td>
							<td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_24_TBox_Line5_Modifier2" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line5_Modifier2)#"></td>
							<td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_24_TBox_Line5_Modifier3" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line5_Modifier3)#"></td>
							<td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_24_TBox_Line5_Modifier4" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line5_Modifier4)#"></td>
						</tr>
					</table>
				</td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line5_DiagnosisCode" size="6" maxlength="6" class="HCFATextBox"></td>
                <td nowrap align="center">
					<input type="Text" name="HCFA_24_TBox_Line5_Charges" onblur="changeTotalCharge();" size="8" maxlength="8" class="HCFATextBox" style="text-align:right;padding-right:3px" <cfif getProcedures.BilledAmount[5] NEQ "">value="#ListFirst(trim(getProcedures.BilledAmount[5]), '.')#"</cfif>>&nbsp;.
					<input type="Text" name="HCFA_24_TBox_Line5_ChargesCents" onblur="changeTotalCharge();" size="2" maxlength="2" class="HCFATextBox" style="text-align:right;padding-right:3px" <cfif getProcedures.BilledAmount[5] NEQ "">value="#Left(ListLast(trim(getProcedures.BilledAmount[5]), '.'), 2)#"</cfif>>				
				</td>
			    <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line5_DaysOrUnits" size="4" maxlength="4" class="HCFATextBox" style="text-align:center;padding-right:3px" value="#trim(getProcedures.BilledQuantity[5])#"></td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line5_EPSDTFamilyPlan" size="3" maxlength="1" class="HCFATextBox"></td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line5_EMG" size="4" maxlength="4" class="HCFATextBox"></td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line5_COB" size="4" maxlength="4" class="HCFATextBox"></td>
                <td nowrap><input type="Text" name="HCFA_24_TBox_Line5_ReservedForLocalUse" size="30" maxlength="30" class="HCFATextBox"></td>
			</tr>  
              
            <tr>
                <td nowrap width=4>6</td>
                <td nowrap align=middle width=70>
					<table cellpadding="0" cellspacing="1" border="0">
						<tr>
						 <td nowrap><input type="Text" name="HCFA_24_TBox_Line6_DateOfserviceFromMM" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[6], 'MM')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line6_DateOfserviceFromDD" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[6], 'DD')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line6_DateOfserviceFromYY" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[6], 'YY')#"></td>
					 	</tr>
					</table>					
				</td>
                <td nowrap align=middle>
					<table cellpadding="0" cellspacing="1" border="0">
						<tr>
						 <td nowrap><input type="Text" name="HCFA_24_TBox_Line6_DateOfserviceToMM" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[6], 'MM')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line6_DateOfserviceToDD" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[6], 'DD')#"></td>
	                     <td nowrap valign="top">|</td>
	                     <td nowrap><input type="Text" name="HCFA_24_TBox_Line6_DateOfserviceToYY" size="2" maxlength="2" class="HCFATextBox" value="#DateFormat(getProcedures.ServiceDateFrom[6], 'YY')#"></td>
					 	</tr>
					</table>
				</td>
                <td nowrap align=middle><input type="Text" name="HCFA_24_TBox_Line6_PlaceOfService" size="2" maxlength="2" class="HCFATextBox" value="#trim(getProcedures.FacilityCode[6])#"></td>
                <td nowrap align=middle><input type="Text" name="HCFA_24_TBox_Line6_TypeOfService" size="2" maxlength="2" class="HCFATextBox"></td>
                <td nowrap><input type="Text" name="HCFA_24_TBox_Line6_CPTHCPCS" size="10" maxlength="10" class="HCFATextBox" value="#trim(getProcedures.HCPC[6])#"></td>
                <td nowrap width=48>
					
				<cfif IsNumeric(trim(getProcedures.ProcedureID[6]))>	
					
					<cfquery name="getModifiers" datasource="#trim(request.datasource)#">
						SELECT e.Modifier, e.Description
						FROM procedure_medicare_modifier p LEFT JOIN pa_master.EOB_MEDICARE_CLAIMMODIFIERCode e ON p.ModifierCode = e.RecordID 
						WHERE p.ProcedureID = #trim(getProcedures.ProcedureID[5])#
					</cfquery>
						
					<cfif getModifiers.Modifier[1] EQ "RR">
						<script language="JavaScript">
							document.all.HCFA_24_TBox_Line6_TypeOfService.value = "R";
						</script>	
					<cfelse>
						<script language="JavaScript">
							document.all.HCFA_24_TBox_Line6_TypeOfService.value = "P";
						</script>	
					</cfif>	
										
					<cfset HCFA_24_TBox_Line6_Modifier1 = getModifiers.Modifier[1]>			
					<cfset HCFA_24_TBox_Line6_Modifier2 = getModifiers.Modifier[2]>			
					<cfset HCFA_24_TBox_Line6_Modifier3 = getModifiers.Modifier[3]>			
					<cfset HCFA_24_TBox_Line6_Modifier4 = getModifiers.Modifier[4]>			
				<cfelse>
					<cfset HCFA_24_TBox_Line6_Modifier1 = "">			
					<cfset HCFA_24_TBox_Line6_Modifier2 = "">			
					<cfset HCFA_24_TBox_Line6_Modifier3 = "">			
					<cfset HCFA_24_TBox_Line6_Modifier4 = "">							
				</cfif>	
					
					
					<table cellspacing="1" cellpadding="0" border="0">
						<tr>
						    <td><input type="Text" name="HCFA_24_TBox_Line6_Modifier1" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line6_Modifier1)#"></td>
							<td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_24_TBox_Line6_Modifier2" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line6_Modifier2)#"></td>
							<td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_24_TBox_Line6_Modifier3" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line6_Modifier3)#"></td>
							<td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_24_TBox_Line6_Modifier4" size="4" maxlength="4" class="HCFATextBox" value="#trim(HCFA_24_TBox_Line6_Modifier4)#"></td>
						</tr>
					</table>
				</td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line6_DiagnosisCode" size="6" maxlength="6" class="HCFATextBox"></td>
                <td nowrap align="center">
					<input type="Text" name="HCFA_24_TBox_Line6_Charges" onblur="changeTotalCharge();" size="8" maxlength="8" class="HCFATextBox" style="text-align:right;padding-right:3px" <cfif getProcedures.BilledAmount[6] NEQ "">value="#ListFirst(trim(getProcedures.BilledAmount[6]), '.')#"</cfif>>&nbsp;.
					<input type="Text" name="HCFA_24_TBox_Line6_ChargesCents" onblur="changeTotalCharge();" size="2" maxlength="2" class="HCFATextBox" style="text-align:right;padding-right:3px" <cfif getProcedures.BilledAmount[6] NEQ "">value="#Left(ListLast(trim(getProcedures.BilledAmount[6]), '.'), 2)#"</cfif>>				
				</td>
			    <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line6_DaysOrUnits" size="4" maxlength="4" class="HCFATextBox" style="text-align:center;padding-right:3px" value="#trim(getProcedures.BilledQuantity[6])#"></td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line6_EPSDTFamilyPlan" size="3" maxlength="1" class="HCFATextBox"></td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line6_EMG" size="4" maxlength="4" class="HCFATextBox"></td>
                <td nowrap align="center"><input type="Text" name="HCFA_24_TBox_Line6_COB" size="4" maxlength="4" class="HCFATextBox"></td>
                <td nowrap><input type="Text" name="HCFA_24_TBox_Line6_ReservedForLocalUse" size="30" maxlength="30" class="HCFATextBox"></td>
			</tr> 			  
			 
		 </tbody></table></td></tr>
        <tr>
          <td nowrap colSpan=3>
            <table borderColor="FF0000" cellSpacing="0" cellPadding="0" width="100%" border="1" style="BORDER-RIGHT: ffffff 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: ffffff 1px solid; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; BORDER-LEFT: ffffff 1px solid; PADDING-TOP: 0px; BORDER-BOTTOM: ffffff 1px solid"><!-- 25 - 30-->
              <tbody>
              <tr>
                <td nowrap>
                  <table border="0" cellSpacing="0" cellPadding="0" width="100%">
                    <tbody>
                    <tr>
                      <td nowrap width=100>25.&nbsp;Federal&nbsp;Tax&nbsp;ID&nbsp;Number</td>
                      <td nowrap>SSN</td>
                      <td nowrap>&nbsp;</td>
                      <td nowrap>EIN&nbsp;&nbsp;</td></tr>
                    <tr>           
					  <input type="Hidden" name="HCFA_25_CBox_FederalTaxIDNumberSSNEIN_SSN" value="">
					  <input type="Hidden" name="HCFA_25_CBox_FederalTaxIDNumberSSNEIN_EIN" value="">
					  <td nowrap><input type="Text" name="HCFA_25_TBox_FederalTaxIDNumber" size="30" maxlength="30" class="HCFATextBox" value="#trim(session.Client.getFederalTaxID())#"></td>
                      <td nowrap align="center" valign="middle"><img src="images/Checkbox1.gif" name="CheckUncheckPic_25" alt="HCFA_25_CBox_FederalTaxIDNumberSSNEIN_SSN" onclick="checkBoxRadio('CheckUncheckPic_25', 'HCFA_25_CBox_FederalTaxIDNumberSSNEIN_SSN')"></td>
                      <td nowrap>&nbsp;</td>
                      <td nowrap align="center" valign="middle"><img src="images/Checkbox1.gif" name="CheckUncheckPic_25" alt="HCFA_25_CBox_FederalTaxIDNumberSSNEIN_EIN" onclick="checkBoxRadio('CheckUncheckPic_25', 'HCFA_25_CBox_FederalTaxIDNumberSSNEIN_EIN')">&nbsp;&nbsp;</td>
					</tr>
					
					 <script language="JavaScript">						  
						checkBoxRadio('CheckUncheckPic_25', 'HCFA_25_CBox_FederalTaxIDNumberSSNEIN_EIN')										
					 </script>		
					
					</tbody>
				 </table>
				</td>
				
				<cfif trim(request.thisPatient.getAccountNumber()) EQ "">
					<cfset PatientAccountNumber = trim(request.thisClaim.getHICNumber())>
				<cfelse>	
					<cfset PatientAccountNumber = trim(request.thisPatient.getAccountNumber())>
				</cfif>	

                <td nowrap>26.&nbsp;Patient's&nbsp;Account&nbsp;No.<BR><input type="Text" name="HCFA_26_TBox_PatientsAccountNumber" size="40" maxlength="30" class="HCFATextBox" value="#trim(PatientAccountNumber)#"></td>
                <td nowrap>
                  <table cellpadding="0" cellspacing="1" border="0" width="100%">
                    <tbody>
                    <tr>
                      <td nowrap align="center" colSpan=6>27. Accept Assignment?<br>(For&nbsp;govt.&nbsp;claims,&nbsp;see&nbsp;back)</td></tr>
                    <tr>
                      	<input type="Hidden" name="HCFA_27_CBox_ACCEPTASSIGNMENT_Yes" value="">
						<input type="Hidden" name="HCFA_27_CBox_ACCEPTASSIGNMENT_No" value="">							
		                <td nowrap align="right"><img src="images/Checkbox1.gif" name="CheckUncheckPic_27" alt="HCFA_27_CBox_ACCEPTASSIGNMENT_Yes" onclick="checkBoxRadio('CheckUncheckPic_27', 'HCFA_27_CBox_ACCEPTASSIGNMENT_Yes')"></td>
		                <td nowrap>Yes</td>
						<td nowrap align=right>&nbsp;</td>
					    <td nowrap align="right"><img src="images/Checkbox1.gif" name="CheckUncheckPic_27" alt="HCFA_27_CBox_ACCEPTASSIGNMENT_No" onclick="checkBoxRadio('CheckUncheckPic_27', 'HCFA_27_CBox_ACCEPTASSIGNMENT_No')"></td>
		               	<td nowrap>No</td>			
					 </tr>
					 
					 <script language="JavaScript">						  
						checkBoxRadio('CheckUncheckPic_27', 'HCFA_27_CBox_ACCEPTASSIGNMENT_Yes')										
					 </script>		
					 
					 </tbody>
				  </table>
				</td>
                <td nowrap>28.&nbsp;TOTAL&nbsp;CHARGE<BR>&nbsp;$&nbsp;<input type="Text" name="HCFA_28_TBox_TotalChargeDollars" size="8" maxlength="6" class="HCFATextBox" style="text-align:right;padding-right:3px">&nbsp;.&nbsp;<input type="Text" name="HCFA_28_TBox_TotalChargeCents" size="2" maxlength="2" class="HCFATextBox"></td>
                <td nowrap>29.&nbsp;AMOUNT&nbsp;PAID<BR>&nbsp;$&nbsp;<input type="Text" name="HCFA_29_TBox_AmountPaidDollars" size="8" maxlength="6" class="HCFATextBox" style="text-align:right;padding-right:3px" value="#ListFirst(getClaimProceduresTotals.ClaimTotalPaid, '.')#">&nbsp;.&nbsp;<input type="Text" name="HCFA_29_TBox_AmountPaidCents" size="2" maxlength="2" class="HCFATextBox" value=""></td>
                
				 <script language="JavaScript">												
					cents = "#LEFT(ListLast(getClaimProceduresTotals.ClaimTotalPaid, '.'), 2)#";								
					if(cents.length == 1){
						cents = cents + "0";
					}					
					document.all.HCFA_29_TBox_AmountPaidCents.value = cents;
				 </script>	
				
				<cfset coinsTotal = "0.00">
				<cfloop query="getProcedures">					
				
					<cfset patientResponsibilityDeductible = "0.00">
					<cfset patientResponsibilityCoInsurance = "0.00">
					<!-------------------------------------------------------------------------------------->
					<!--- Get all the PatientResponsibilities (PR) adjustments for this procedure.       --->
					<!-------------------------------------------------------------------------------------->										
					<cfquery name="getProcedurePRs" datasource="#trim(request.datasource)#">
						SELECT s.ItemNameDisplay, p.* 
						FROM procedure_medicare_claimadjustment p INNER JOIN pa_master.standardlistitem s ON p.ClaimAdjustmentGroupCode1 = s.StandardListItemID
						WHERE p.ClaimAdjustmentGroupCode1 = 107 AND p.ProcedureID = #trim(ProcedureID)# 
					</cfquery>
					
					<cfif getProcedurePRs.RecordCount EQ 1>
						<cfloop list="#getProcedurePRs.ColumnList#" index="i_col">
							<cfif FindNoCase("ClaimAdjustmentReasonCode", i_col)>																									
								<cfset column = "getProcedurePRs.#i_col#">																										
								<cfset numCol = "getProcedurePRs.MonetaryAmount" & evaluate(RIGHT(i_col, 1) + 1)>	
								<cfif ListFindNoCase(monetaryColumns, ListLast(numCol, "."))>								
									<cfif evaluate(column) EQ 1>												
										<cfset patientResponsibilityDeductible = patientResponsibilityDeductible + evaluate(numCol)> 	
										<cfset deductTotal = deductTotal + evaluate(numCol)>
									<cfelseif evaluate(column) EQ 2>											
										<cfset patientResponsibilityCoInsurance = patientResponsibilityCoInsurance + evaluate(numCol)>
										<cfset coinsTotal = coinsTotal + evaluate(numCol)> 															
									</cfif>	
								</cfif>														
							</cfif>
							
						</cfloop>	
					</cfif>

				</cfloop>					
				
				<cfset coinsTotal = coinsTotal + patientResponsibilityDeductible>
							 	
				<td nowrap>30.&nbsp;BALANCE&nbsp;DUE<BR>&nbsp;$&nbsp;<input type="Text" name="HCFA_30_TBox_BalanceDueDollars" size="8" maxlength="6" class="HCFATextBox" style="text-align:right;padding-right:3px" value="#ListFirst(coinsTotal, '.')#">&nbsp;.&nbsp;<input type="Text" name="HCFA_30_TBox_BalanceDueCents" size="2" maxlength="2" class="HCFATextBox" value="#ListLast(coinsTotal, '.')#"></td>
			    <script language="JavaScript">												
					cents = "#LEFT(ListLast(coinsTotal, '.'), 2)#";								
					if(cents.length == 1){
						cents = cents + "0";
					}					
					document.all.HCFA_30_TBox_BalanceDueCents.value = cents;
				 </script>	
				 
			  </tr>
			  
			  
			  <script language="JavaScript">						  
			  	var totalCharge = 0;
				
				<cfif getProcedures.BilledAmount[1] NEQ "">totalCharge = eval(totalCharge + #trim(getProcedures.BilledAmount[1])#);</cfif>
				<cfif getProcedures.BilledAmount[2] NEQ "">totalCharge = eval(totalCharge + #trim(getProcedures.BilledAmount[2])#);</cfif>
				<cfif getProcedures.BilledAmount[3] NEQ "">totalCharge = eval(totalCharge + #trim(getProcedures.BilledAmount[3])#);</cfif>
				<cfif getProcedures.BilledAmount[4] NEQ "">totalCharge = eval(totalCharge + #trim(getProcedures.BilledAmount[4])#);</cfif>
				<cfif getProcedures.BilledAmount[5] NEQ "">totalCharge = eval(totalCharge + #trim(getProcedures.BilledAmount[5])#);</cfif>
				<cfif getProcedures.BilledAmount[6] NEQ "">totalCharge = eval(totalCharge + #trim(getProcedures.BilledAmount[6])#);</cfif>				
			  	
				var totChargesArray = totalCharge.toString().split(".");							
				dollars = totChargesArray[0];										  
				
				if(totChargesArray.length == 2){				
					cents = totChargesArray[1];									
					if(cents.length == 1){
						cents = cents + "0";
					}
				}
				else{
					cents = "00";
				}	
				
				document.all.HCFA_28_TBox_TotalChargeDollars.value = dollars;
				document.all.HCFA_28_TBox_TotalChargeCents.value = cents;
			  </script>		
			  
			  
			  
              <tr>
                <td nowrap width="100%">					
					<table cellspacing="0" cellpadding="0" border="0" width="100%">
						<tr>
						    <td>31.</td>
							<td>&nbsp;</td>
						    <td colspan="2">Signature Of Physician Or Supplier Including<BR>Degrees Or Credentials (I certify that the statement<BR>on the reverse apply to this bill and are made a part thereof.)</td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td></tr>											
					</table>	
					<table cellspacing="0" cellpadding="0" border="0" width="100%">
						<tr>
						    <td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_31_TBox_SignatureOfPhysicianOrSupplier" class="HCFAUnderlinedTextbox" size="30" maxlength="40" value=""></td>
						    <td>&nbsp;</td>							
							<td valign="bottom"><input type="Text" name="HCFA_31_TBox_SignatureOfPhysicianOrSupplierDateMM" size="2" maxlength="2" class="HCFAUnderlinedTextbox" value=""><input type="Text" size="1" disabled class="HCFAUnderlinedTextbox" value="/"><input type="Text" name="HCFA_31_TBox_SignatureOfPhysicianOrSupplierDateDD" size="2" maxlength="2" class="HCFAUnderlinedTextbox" value=""><input type="Text" size="1" disabled class="HCFAUnderlinedTextbox" value="/"><input type="Text" name="HCFA_31_TBox_SignatureOfPhysicianOrSupplierDateYY" size="2" maxlength="2" class="HCFAUnderlinedTextbox" value=""></td>
						</tr>
						<tr>
						    <td>&nbsp;</td>
							<td>SIGNED</td>
						    <td>&nbsp;</td>
							<td>DATE</td>
						</tr>
					</table>		
				</td>                
				<td nowrap colSpan=2>				
					<table cellspacing="0" cellpadding="0" border="0" width="100%">
						<tr>
						    <td>32.</td>
							<td>&nbsp;</td>
						    <td colspan="2">Name and Address Of Facility Where Services Were<BR>Rendered (If other than home or office.)</td>
						</tr>															
					</table>	
					<table cellspacing="0" cellpadding="0" border="0" width="100%">
						<tr>
						    <td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_32_TBox_NameAddressFacilityServicesRendered_Name" size="45" maxlength="30" class="HCFATextBox"></td>
						</tr>	
						<tr>
						    <td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_32_TBox_NameAddressFacilityServicesRendered_AddressLine1" size="40" maxlength="30" class="HCFATextBox"></td>
						</tr>	
						<tr>
						    <td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_32_TBox_NameAddressFacilityServicesRendered_AddressLine2" size="40" maxlength="30" class="HCFATextBox"></td>
						</tr>
						<tr>
						    <td>&nbsp;</td>
						    <td>
								<input type="Text" name="HCFA_32_TBox_NameAddressFacilityServicesRendered_City" size="20" maxlength="30" class="HCFATextBox">&nbsp;,&nbsp;
								<input type="Text" name="HCFA_32_TBox_NameAddressFacilityServicesRendered_State" size="3" maxlength="2" class="HCFATextBox">
								<input type="Text" name="HCFA_32_TBox_NameAddressFacilityServicesRendered_ZipCode" size="10" maxlength="10" class="HCFATextBox">
							</td>
						</tr>							
					</table>
				</td>               
			  

				<cfset request.thisClientEntity = CreateObject("component","com.common.Entity")>	
				<cfset clientAddressQ = request.thisClientEntity.getEntityDefaultFullAddress(clientID: trim(session.clientID), entityID: trim(session.client.getEntityID()))>
							
				<cfif len(trim(clientAddressQ.zipCode)) GTE 6 AND NOT FindNoCase("-", clientAddressQ.zipCode)>
					<cfset clientZipCode = REQUEST.InsertAt(clientAddressQ.zipCode, "-", 6)>												
				<cfelse>
					<cfset clientZipCode = trim(clientAddressQ.zipCode)>	
				</cfif>
				
				<td nowrap colSpan=3>				
					<table cellspacing="0" cellpadding="0" border="0" width="100%">
						<tr>
						    <td>33.</td>
							<td>&nbsp;</td>
						    <td colspan="2">PHYSICIAN'S, SUPPLIER'S BILLING NAME, ADDRESS,<br>ZIP CODE &amp; PHONE ##</td>
						</tr>															
					</table>	
					<table cellspacing="0" cellpadding="0" border="0" width="100%">
						<tr>
						    <td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_33_TBox_NameAddressPhysiciansSupplierBilling_Name" size="45" maxlength="30" class="HCFATextBox" value="#trim(session.client.getClientName())#"></td>
						</tr>	
						<tr>
						    <td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_33_TBox_NameAddressPhysiciansSupplierBilling_AddressLine1" size="40" maxlength="45" class="HCFATextBox" value="#trim(clientAddressQ.addressLine1)# #trim(clientAddressQ.addressLine2)#"></td>
						</tr>					
						<tr>
						    <td>&nbsp;</td>
						    <td>
								<input type="Text" name="HCFA_33_TBox_NameAddressPhysiciansSupplierBilling_City" size="20" maxlength="30" class="HCFATextBox" value="#trim(clientAddressQ.city)#">&nbsp;,&nbsp;
								<input type="Text" name="HCFA_33_TBox_NameAddressPhysiciansSupplierBilling_State" size="3" maxlength="2" class="HCFATextBox" value="#trim(clientAddressQ.stateAbbr)#">
								<input type="Text" name="HCFA_33_TBox_NameAddressPhysiciansSupplierBilling_ZipCode" size="10" maxlength="10" class="HCFATextBox" value="#trim(clientZipCode)#">
							</td>
						</tr>	
						<!---<tr>
						    <td>&nbsp;</td>
						    <td><input type="Text" name="HCFA_33_TBox_NameAddressPhysiciansSupplierBilling_AddressLine2" size="40" maxlength="30" class="HCFATextBox" value="#trim(clientAddressQ.addressLine2)#"></td>
						</tr>--->
						<!---<tr>
							<td>&nbsp;</td>
						    <td>Telephone:&nbsp;(&nbsp;<input type="Text" name="HCFA_33_TBox_NameAddressPhysiciansSupplierBilling_TelephoneAreaCode" size="3" maxlength="3" class="HCFATextBox">&nbsp;)&nbsp;<input type="Text" name="HCFA_33_TBox_NameAddressPhysiciansSupplierBilling_TelephoneNumber" size="20" maxlength="20" class="HCFATextBox"></td>
						</tr>	--->
						
						
																	
					</table>
					<table>
						<tr>
						    <td>PIN&nbsp;##&nbsp;<input type="Text" name="HCFA_33_TBox_PinNumber" size="15" maxlength="15" class="HCFATextBox" value="#trim(session.client.getPinNumber())#"></td>
						    <td>
								<table border="0" cellpadding="0" cellspacing="0" align="left">
									<tr valign="top">
										<td bgcolor="ff00000" width="1" height="18"></td>
									</tr>
								</table>
							</td>
						    <td>GRP&nbsp;##<input type="Text" name="HCFA_33_TBox_GroupNumber" size="15" maxlength="15" class="HCFATextBox" value="#trim(session.client.getGroupNumber())#"></td>
						</tr>
					</table>
					
				</td>
				
              <!---  </td>--->
				
				</tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table>
				
				<table border="0" cellSpacing="0" cellPadding="0" width="100%">
				  <tbody>
				  <tr>
				    <td nowrap valign="middle">(APPROVED&nbsp;BY&nbsp;AMA&nbsp;COUNCIL,&nbsp;ON&nbsp;MEDICAL,&nbsp;SERVICE&nbsp;8/88)</td>
				    <td nowrap valign="middle" style="FONT-WEIGHT: bold">PLEASE PRINT OR TYPE</td>
				    <td nowrap><strong>A</strong>PPROVED&nbsp;OMB&ndash;0938&ndash;0008&nbsp;FORM&nbsp;CMS&ndash;1500&nbsp;(12/90),&nbsp;FORM&nbsp;RRB&ndash;1500,</td>
				  </tr>
				  <tr>
				    <td nowrap colSpan=2>&nbsp;</td>
				    <td nowrap><strong>A</strong>PPROVED&nbsp;OMB&ndash;1215&ndash;0055&nbsp;FORM&nbsp;OWCP&ndash;1500,&nbsp;APPROVED&nbsp;OMB&ndash;0720&ndash;0001&nbsp;(CHAMPUS)</td>
				  </tr>
				  </tbody>
				</table>

	
</form>
</cfoutput>

<cfsetting showdebugoutput="No">





