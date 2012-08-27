

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->						
	<cfparam name="attributes.patientID" default="">
	<cfset patientID = attributes.patientID>
	
	<cfparam name="attributes.clientID" default="">
	<cfset clientID = attributes.clientID>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="patientID, clientID"
		fieldnames="Patient ID, Client ID">		
	
	

<!-------------------------------------------------------------------------------------->
<!--- get the insurance companies.                                                   --->
<!-------------------------------------------------------------------------------------->	
	<cfquery name="PatientIns" datasource="PAClient_#ClientID#">
		SELECT pic.Deductible, pic.GroupName, pic.GroupNumber, ic.InsuranceCompanyDBA, pic.InsuranceCompanyID, 
		ic.InsuranceCompanyName, pic.PayPercentage, pic.PolicyHoldersAddressLine1, pic.PolicyHoldersAddressLine2, 
		pic.PolicyHoldersCity, pic.PolicyHoldersDOB, 
		pic.PolicyHoldersEmployerSchoolName, pic.PolicyHoldersFirstName, pic.PolicyHoldersLastName, pic.PolicyHoldersMiddleInitial, 
		pic.PolicyHoldersPhone, pic.PolicyHoldersPhoneExtension, pic.PolicyHoldersSex, pic.PolicyHoldersStateID, 
		pic.PolicyHoldersZipCode, pic.PolicyNumber, pic.PrimSecTer, pic.Relationship, ic.EntityID, pic.recordID 
		FROM patientinsurancecompany pic
		INNER JOIN insurancecompany ic ON pic.InsuranceCompanyID = ic.InsuranceCompanyID
		WHERE  pic.patientID = #trim(patientID)# 
		Order By  pic.PrimSecTer
	</cfquery> 					
	
	<cfset request.thisInsuranceEntity = application.beanFactory.getBean("Entity") />	
	

	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of the page.                                                 --->
<!-------------------------------------------------------------------------------------->
<cfoutput>	
	
	
	<cfloop query="PatientIns">
		
		<cfset faxPhone = "">
		<cfset thisPhone = "">
		
		<cfset Phones = request.thisInsuranceEntity.getEntityPhones(clientID: trim(session.clientID), EntityID: entityID, Active: 1)>				
		<cfset FaxPhone = REQUEST.formatPhoneUS(request.thisInsuranceEntity.getEntityFaxPhoneFull(clientID: trim(session.clientID), EntityID: entityID))>				
		
		<cfset Address = request.thisInsuranceEntity.getEntityDefaultFullAddress(clientID: trim(session.clientID), EntityID: entityID)>				
										
		<cfloop query="Phones">						
			<cfset PhoneNumberD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(PhoneNumber)) />			
			<cfset PhoneExtensionD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(PhoneExtension)) />
			<cfset thisPhone = REQUEST.formatPhoneUS(PhoneNumberD & PhoneExtensionD)>						
		</cfloop>			
					
		
		<cfif PrimSecTer EQ 1>
			<cfset thisPrimSecTer = "Primary">
		<cfelseif PrimSecTer EQ 2>
			<cfset thisPrimSecTer = "Secondary">
		<cfelseif PrimSecTer EQ 3>
			<cfset thisPrimSecTer = "Tertiary">	
		<cfelse>
			<cfset thisPrimSecTer = "">		
		</cfif> 
		
		<!--- INSURANCE INFORMATION --->							
		<tr>
       		<td bgcolor="DCE3EB" align="center" colspan="7" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
         		<font face="Arial" size="2"><strong>#UCASE(thisPrimSecTer)#&nbsp;INSURANCE&nbsp;INFORMATION</strong></font>
        	</td>
        </tr>
		<tr>
       		<td colspan="7" class="siteLabel" style="margin-top:6px; border-Top: 1px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">

		
		
			<table cellpadding="4" cellspacing="0" border="0" align="center">
				<tr>
		        	<td id="td_priNoteTBox" colspan="6" class="siteLabel">&nbsp;</td>
		       	</tr>
			   	<tr>
					<td bgcolor="DCE3EB" align="center" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">
						<font face="Arial" size="2"><strong>#UCASE(thisPrimSecTer)#&nbsp;INSURANCE</strong></font>
					</td>		
					<td bgcolor="DCE3EB" colspan="3" align="right" nowrap class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">
						&nbsp;					
					</td>						
				</tr>											   
			  	
				<cfset InsuranceNameTBox = "InsuranceCompanyName">
				<cfset PolicyNumberTBox = "PolicyNumber">
			   	<tr>	        	
				   	<td id="td_PrimaryInsuranceNameTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>INSURANCE&nbsp;NAME:</strong>&nbsp;#trim(evaluate(InsuranceNameTBox))#</td>
		       	   	<td id="td_PrimaryPolicyNumberTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>POLICY&nbsp;##:</strong>&nbsp;#trim(evaluate(PolicyNumberTBox))#</td>
		       	</tr>
		       	
				<cfset GroupNumberTBox = "GroupNumber">				
				<tr>		   		
		           	<td nowrap id="td_PrimaryGroupNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>GROUP&nbsp;##:</strong>&nbsp;#trim(evaluate(GroupNumberTBox))#</td>
		           	<td nowrap id="td_PrimaryPhoneNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">
						&nbsp;<strong>PHONE&nbsp;##:</strong>&nbsp;#trim(thisPhone)#&nbsp;&nbsp;<strong>FAX&nbsp;##:</strong>&nbsp;#trim(faxPhone)#
					</td>
		       	</tr>
				
				<tr>
		        	<td id="td_PrimarySendToAddress1TBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						<strong>SEND&nbsp;CLAIMS&nbsp;TO&nbsp;ADDRESS&nbsp;LINE&nbsp;1:</strong>&nbsp;#trim(Address.AddressLine1)#
						&nbsp;<strong>ADDRESS&nbsp;LINE&nbsp;2:</strong>&nbsp;#trim(Address.AddressLine2)#
					</td>
		       	</tr>	
				<tr>
		        	<td id="td_PrimarySendToCityTBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						&nbsp;<strong>CITY:</strong>&nbsp;#trim(Address.City)#
						&nbsp;<strong>STATE:</strong>&nbsp;#trim(Address.StateFull)#
						&nbsp;<strong>ZIP&nbsp;CODE:</strong>&nbsp;#trim(Address.ZipCode)#
					</td>
		       	</tr>
				
				<tr>
		        	<td id="td_PrimaryPolicyHolderNameTBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>POLICY&nbsp;HOLDERS&nbsp;FIRST:</strong>&nbsp;#trim(PolicyHoldersFirstName)#&nbsp;<strong>M:</strong>&nbsp;#trim(PolicyHoldersMiddleInitial)#&nbsp;<strong>LAST:</strong>&nbsp;#trim(PolicyHoldersLastName)#</td>
		       	</tr>	       
			  					   
			   	<tr>
		        	<td id="td_PrimaryHoldersDOB" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>POLICY&nbsp;HOLDERS&nbsp;DOB:</strong><cfif IsDate(PolicyHoldersDOB)>&nbsp;#trim(MONTH(PolicyHoldersDOB))#/#trim(DAY(PolicyHoldersDOB))#/#trim(YEAR(PolicyHoldersDOB))#</cfif>
					</td>
		       	   	<td id="td_PrimaryPolicyHolderEmployerTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>POLICY&nbsp;HOLDERS&nbsp;EMPLOYER:</strong>&nbsp;#trim(PolicyHoldersEmployerSchoolName)#</td>
		       	</tr>	  
			    
				<cfset request.VerificationPIC = application.beanFactory.getBean("VerificationPIC") />
			  	<cfset verifications = request.VerificationPIC.getVerificationPatientInsuranceQuery(picID: recordid, fields: "VerificationPatientInsuranceID, usersID, picID, VerificationRepFName, VerificationRepLName, VerificationDate, VerificationTime, VerificationHaveIns, VerificationHaveInsFromDate, VerificationHaveInsToDate, VerificationHaveDMECov, VerificationDeductible, VerificationDeductibleAmount, VerificationDeductibleAmountMet, VerificationPPOPolicy, VerificationPercentagePayAfterDeductible, VerificationPriorAuth, VerificationAuthNumber, VerificationLifetimeBenefitMet, VerificationAuthPhoneNumber, VerificationMedicareSupplement, VerificationCoordinateBenefits, VerificationPaidMedicareDeductible, VerificationMedicaidPlan, VerificationTypeBasePlan, Active, InactiveCode, DateCreated, DateModified")>
				
				<cfloop query="verifications">
				
				    <tr>
					    <td bgcolor="DCE3EB" align="center" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
							<font face="Arial" size="2"><strong> INSURANCE&nbsp;VERIFICATION&nbsp;PROCESS</strong></font>
						</td>								
					</tr>	
				   							 
					<tr>
						<td nowrap id="td_PrimaryVerificationRepNameTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">
							<strong>REP&nbsp;FIRST:</strong>#trim(VerificationRepFName)#&nbsp;<strong>LAST:</strong>#trim(VerificationRepLName)#
						</td>
		  				<td id="td_PrimaryVerificationDate" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>DATE:</strong>&nbsp;<cfif IsDate(VerificationDate)>#trim(MONTH(VerificationDate))#/#trim(DAY(VerificationDate))#/#trim(YEAR(VerificationDate))#</cfif></td>
						<td id="td_PrimaryVerificationTimeTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>TIME:</strong>&nbsp;<cfif IsDate(VerificationTime)>#trim(TimeFormat(VerificationTime, "HH:MM:SS"))#</cfif></td>
					</tr>
					<tr>														   
		  				<td nowrap id="td_PrimaryCBox_VerificationHaveIns" colspan="6" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
							&nbsp;<strong>DOES&nbsp;THE&nbsp;PATIENT&nbsp;HAVE&nbsp;INSURANCE&nbsp;WITH&nbsp;YOU?:</strong>&nbsp;
							<cfif trim(VerificationHaveIns) EQ 0><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>YES</strong>&nbsp;&nbsp;
							<cfif trim(VerificationHaveIns) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>NO</strong>&nbsp;&nbsp;&nbsp;<strong>EFFECTIVE&nbsp;DATES&nbsp;OF&nbsp;INSURANCE:</strong>&nbsp;<strong>FROM:</strong>&nbsp;<cfif IsDate(VerificationHaveInsFromDate)>#trim(MONTH(VerificationHaveInsFromDate))#/#trim(DAY(VerificationHaveInsFromDate))#/#trim(YEAR(VerificationHaveInsFromDate))#</cfif>&nbsp;&nbsp;<strong>TO:</strong>&nbsp;<cfif IsDate(VerificationHaveInsToDate)>#trim(MONTH(VerificationHaveInsToDate))#/#trim(DAY(VerificationHaveInsToDate))#/#trim(YEAR(VerificationHaveInsToDate))#</cfif>
						</td>
					</tr>
					<tr>														   
						<td id="td_PrimaryCBox_VerificationHaveDMECov" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
							&nbsp;<strong>DOES&nbsp;THE&nbsp;PATIENT&nbsp;HAVE&nbsp;DME&nbsp;COVERAGE?:</strong>&nbsp;&nbsp;&nbsp;
							<cfif trim(VerificationHaveDMECov) EQ 0><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;
							<cfif trim(VerificationHaveDMECov) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO
						</td>
						<td id="td_PrimaryCBox_VerificationDeductible" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">
							&nbsp;<strong>IS&nbsp;THERE&nbsp;A&nbsp;DEDUCTIBLE?:</strong>&nbsp;&nbsp;&nbsp;
							<cfif trim(VerificationDeductible) EQ 0><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<cfif trim(VerificationDeductible) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO
						</td>
					</tr>
					<tr>														   
						<td id="td_PrimaryVerificationDeductibleAmountTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>AMOUNT&nbsp;OF&nbsp;DEDUCTIBLE:</strong>&nbsp;#trim(VerificationDeductibleAmount)#</td>
						<td id="td_PrimaryVerificationDeductibleAmountMetTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>HOW&nbsp;MUCH&nbsp;OF&nbsp;DEDUCTIBLE&nbsp;HAS&nbsp;BEEN&nbsp;MET?:</strong>&nbsp;#trim(VerificationDeductibleAmountMet)#</td>
					</tr>
					<tr>														   
						<td id="td_PrimaryVerificationPercentagePayAfterDeductibleTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>%&nbsp;OF&nbsp;PAY&nbsp;AFTER&nbsp;DEDUCTABLE:</strong>&nbsp;#trim(VerificationPercentagePayAfterDeductible)#</td>
						<td id="td_PrimaryCBox_VerificationPPOPolicy" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>IS&nbsp;THIS&nbsp;A&nbsp;PPO/HMO&nbsp;POLICY?:</strong>&nbsp;&nbsp;
							<cfif trim(VerificationPPOPolicy) EQ 0><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;
							<cfif trim(VerificationPPOPolicy) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO
						</td>
					</tr>
					<tr>														   
						<td id="td_PrimaryCBox_VerificationPriorAuthorization" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>IS&nbsp;PRIOR&nbsp;AUTHORIZATION&nbsp;NECESSARY?:</strong>&nbsp;&nbsp;&nbsp;
							<cfif trim(VerificationPriorAuth) EQ 0><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;
							<cfif trim(VerificationPriorAuth) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO
						</td>
						<td id="td_PrimaryVerificationAuthNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>Auth&nbsp;##:</strong>&nbsp;#trim(VerificationAuthNumber)#</td>
					</tr>
					<tr>														   
					 	<td id="td_PrimaryVerificationAuthPhoneNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>CONTACT&nbsp;NUMBER&nbsp;FOR&nbsp;AUTH:</strong>&nbsp;#trim(request.formatPhoneUS(VerificationAuthPhoneNumber))#</td>
					 	<td id="td_PrimaryCBox_VerificationLifetimeBenefitMet" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>HAS&nbsp;LIFETIME&nbsp;BENEFIT&nbsp;BEEN&nbsp;MET?:</strong>&nbsp;&nbsp;&nbsp;
							<cfif trim(VerificationLifetimeBenefitMet) EQ 0><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;&nbsp;
							<cfif trim(VerificationLifetimeBenefitMet) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO
						</td>
					</tr>
					<tr>														   
						<td id="td_PrimaryMedicareSupplement" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
							&nbsp;<strong>MEDICARE&nbsp;SUPPLEMENT:</strong>&nbsp;&nbsp;&nbsp;
							<cfif trim(VerificationMedicareSupplement) EQ 0><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;&nbsp;
							<cfif trim(VerificationMedicareSupplement) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO&nbsp;&nbsp;&nbsp;
							<strong>COORDINATE&nbsp;BENEFITS:</strong>&nbsp;&nbsp;&nbsp;					
							<cfif trim(VerificationCoordinateBenefits) EQ 0><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;&nbsp;
							<cfif trim(VerificationCoordinateBenefits) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO&nbsp;&nbsp;&nbsp;
							<strong>PAID&nbsp;MEDICARE&nbsp;DEDUCTIBLE:</strong>&nbsp;&nbsp;&nbsp;					
							<cfif trim(VerificationPaidMedicareDeductible) EQ 0><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;&nbsp;					
							<cfif trim(VerificationPaidMedicareDeductible) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO								
						</td>
					</tr>
					
					<tr>														   
						<td id="td_PrimaryVerificationTypeBasePlanTBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
							&nbsp;<strong>MEDICAID&nbsp;PLAN:</strong>&nbsp;&nbsp;&nbsp;					
							<cfif trim(VerificationMedicaidPlan) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;MQMB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;					
							<cfif trim(VerificationMedicaidPlan) EQ 2><font color="FF0000">&radic;</font></cfif>&nbsp;QMB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;					
							<cfif trim(VerificationMedicaidPlan) EQ 3><font color="FF0000">&radic;</font></cfif>&nbsp;TRADITIONAL&nbsp;&nbsp;&nbsp;&nbsp;**&nbsp;TYPE&nbsp;OF&nbsp;BASE&nbsp;PLAN:&nbsp;#trim(VerificationTypeBasePlan)#
						</td>
					</tr>	
					<tr>
			        	<td colspan="6" class="siteLabel">&nbsp;</td>
			       	</tr>	
				
				</cfloop>
							
			</table> 		
		
								
			</td>
		</tr>
		
		<tr>
		    <td align="center" colspan="7" class="siteLabel">&nbsp;</td>
		</tr>
		
	</cfloop>
								
									
	
</cfoutput>

















<!---<!---**************************************************** Primary Insurance Below ********************************************--->							
		<tr><td align="center" colspan="7"><font color="c0c0c0" face="Arial" size="3"><strong>INTAKE&nbsp;ID:&nbsp;#trim(intakeID)#<cfif InactiveCode EQ 298>&nbsp;[PENDING]</cfif>&nbsp;&nbsp;<cfif NOT Active>STATUS: CANCELLED</cfif></strong></font></td></tr>	
		<tr><td align="center" colspan="7" class="siteLabel">&nbsp;</td></tr>
		<!--- INSURANCE INFORMATION --->							
		<tr>
       		<td bgcolor="DCE3EB" align="center" colspan="7" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
         		<font face="Arial" size="2"><strong>PRIMARY&nbsp;INSURANCE&nbsp;INFORMATION</strong></font>
        	</td>
        </tr>
		<tr>
       		<td colspan="7" class="siteLabel" style="margin-top:6px; border-Top: 1px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">

		
		
			<table cellpadding="4" cellspacing="0" border="0" align="center">
				<tr>
		        	<td id="td_priNoteTBox" colspan="6" class="siteLabel">&nbsp;</td>
		       	</tr>
			   	<tr>
					<td bgcolor="DCE3EB" align="center" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">
						<font face="Arial" size="2"><strong>PRIMARY&nbsp;INSURANCE</strong></font>
					</td>		
					<td bgcolor="DCE3EB" colspan="3" align="right" nowrap class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">
						&nbsp;					
					</td>						
				</tr>											   
			  	
				<cfset InsuranceNameTBox = "PrimaryInsuranceNameTBox">
				<cfset PolicyNumberTBox = "PrimaryPolicyNumberTBox">
			   	<tr>	        	
				   	<td id="td_PrimaryInsuranceNameTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>INSURANCE&nbsp;NAME:</strong>&nbsp;#trim(evaluate(InsuranceNameTBox))#</td>
		       	   	<td id="td_PrimaryPolicyNumberTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>POLICY&nbsp;##:</strong>&nbsp;#trim(evaluate(PolicyNumberTBox))#</td>
		       	</tr>
		       	
				<cfset GroupNumberTBox = "PrimaryGroupNumberTBox">
				<cfset PhoneNumberTBox = "PrimaryPhoneNumberTBox">
				<cfset FaxNumberTBox = "PrimaryFaxNumberTBox">
				<tr>		   		
		           	<td id="td_PrimaryGroupNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>GROUP&nbsp;##:</strong>&nbsp;#trim(evaluate(GroupNumberTBox))#</td>
		           	<td id="td_PrimaryPhoneNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">
						&nbsp;<strong>PHONE&nbsp;##:</strong>&nbsp;#trim(evaluate(PhoneNumberTBox))#
						&nbsp;<strong>FAX&nbsp;##:</strong>&nbsp;#trim(evaluate(FaxNumberTBox))#
					</td>
		       	</tr>
				
				<cfset SendToAddress1TBox = "PrimarySendToAddress1TBox">
				<cfset SendToAddress2TBox = "PrimarySendToAddress2TBox">			
			   	<tr>
		        	<td id="td_PrimarySendToAddress1TBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						<strong>SEND&nbsp;CLAIMS&nbsp;TO&nbsp;ADDRESS&nbsp;LINE&nbsp;1:</strong>&nbsp;#trim(evaluate(SendToAddress1TBox))#
						&nbsp;<strong>ADDRESS&nbsp;LINE&nbsp;2:</strong>&nbsp;#trim(evaluate(SendToAddress2TBox))#
					</td>
		       	</tr>	
				
				<cfset SendToCityTBox = "PrimarySendToCityTBox">
				<cfset SendToStateTBox = "PrimarySendToStateTBox">			
				<cfset SendToZipCodeTBox = "PrimarySendToZipCodeTBox">			
			   	<tr>
		        	<td id="td_PrimarySendToCityTBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						&nbsp;<strong>CITY:</strong>&nbsp;#trim(evaluate(SendToCityTBox))#
						&nbsp;<strong>STATE:</strong>&nbsp;#trim(evaluate(SendToStateTBox))#
						&nbsp;<strong>ZIP&nbsp;CODE:</strong>&nbsp;#trim(evaluate(SendToZipCodeTBox))#
					</td>
		       	</tr>
				
							
				<cfset EffectiveDateMM = "PrimaryEffectiveDateMM">
				<cfset EffectiveDateDD = "PrimaryEffectiveDateDD">
				<cfset EffectiveDateYY = "PrimaryEffectiveDateYY">
				<cfset PolicyHolderFNameTBox = "PrimaryPolicyHolderFNameTBox">
				<cfset PolicyHolderMInitialTBox = "PrimaryPolicyHolderMInitialTBox">
				<cfset PolicyHolderLNameTBox = "PrimaryPolicyHolderLNameTBox">
				<tr>
		        	<td id="td_PrimaryEffectiveDate" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>EFFECTIVE&nbsp;DATE:</strong>&nbsp;&nbsp;#trim(evaluate(EffectiveDateMM))#/#trim(evaluate(EffectiveDateDD))#/#trim(evaluate(EffectiveDateYY))#</td>
		           	<td id="td_PrimaryPolicyHolderNameTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>POLICY&nbsp;HOLDERS&nbsp;FIRST:</strong>&nbsp;#trim(evaluate(PolicyHolderFNameTBox))#&nbsp;<strong>M:</strong>&nbsp;#trim(evaluate(PolicyHolderMInitialTBox))#&nbsp;<strong>LAST:</strong>&nbsp;#trim(evaluate(PolicyHolderLNameTBox))#</td>
		       	</tr>	       
			   
			   	<cfset HoldersDOBMM = "PrimaryHoldersDOBMM">
				<cfset HoldersDOBDD = "PrimaryHoldersDOBDD">
				<cfset HoldersDOBYY = "PrimaryHoldersDOBYY">
			   	<cfset PolicyHolderEmployerTBox = "PrimaryPolicyHolderEmployerTBox">
			   	<tr>
		        	<td id="td_PrimaryHoldersDOB" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>POLICY&nbsp;HOLDERS&nbsp;DOB:</strong>&nbsp;#trim(evaluate(HoldersDOBMM))#/#trim(evaluate(HoldersDOBDD))#/#trim(evaluate(HoldersDOBYY))#</td>
		       	   	<td id="td_PrimaryPolicyHolderEmployerTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>POLICY&nbsp;HOLDERS&nbsp;EMPLOYER:</strong>&nbsp;#trim(evaluate(PolicyHolderEmployerTBox))#</td>
		       	</tr>	  
			  
			 	<cfset NoteTBox = "PrimaryNoteTBox">
			   	<tr>
		        	<td id="td_PrimaryNoteTBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>NOTE:</strong>&nbsp;#trim(evaluate(NoteTBox))#</td>
		       	</tr>		   
			  
			    <tr>
				    <td bgcolor="DCE3EB" align="center" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						<font face="Arial" size="2"><strong>PRIMARY&nbsp;INSURANCE&nbsp;VERIFICATION&nbsp;PROCESS</strong></font>
					</td>								
				</tr>	
			   		
				<cfset VerificationRepFNameTBox = "PrimaryVerificationRepFNameTBox">	
				<cfset VerificationRepLNameTBox = "PrimaryVerificationRepLNameTBox">	
				<cfset VerificationDateMM = "PrimaryVerificationDateMM">
				<cfset VerificationDateDD = "PrimaryVerificationDateDD">
				<cfset VerificationDateYY = "PrimaryVerificationDateYY">
				<cfset VerificationTimeTBox = "PrimaryVerificationTimeTBox">			 
				<tr>
					<td nowrap id="td_PrimaryVerificationRepNameTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">
						<strong>REP&nbsp;FIRST:</strong>#trim(evaluate(VerificationRepFNameTBox))#
						&nbsp;<strong>LAST:</strong>#trim(evaluate(VerificationRepLNameTBox))#
					</td>
	  				<td id="td_PrimaryVerificationDate" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>DATE:</strong>&nbsp;#trim(evaluate(VerificationDateMM))#/#trim(evaluate(VerificationDateDD))#/#trim(evaluate(VerificationDateYY))#</td>
					<td id="td_PrimaryVerificationTimeTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>TIME:</strong>&nbsp;#trim(evaluate(VerificationTimeTBox))#</td>
				</tr>
				
				
				<cfset verificationHaveInsFromMM = "PrimaryVerificationHaveInsFromMM">
				<cfset verificationHaveInsFromDD = "PrimaryVerificationHaveInsFromDD">
				<cfset verificationHaveInsFromYY = "PrimaryVerificationHaveInsFromYY">
				<cfset verificationHaveInsToMM = "PrimaryVerificationHaveInsToMM">
				<cfset verificationHaveInsToDD = "PrimaryVerificationHaveInsToDD">
				<cfset verificationHaveInsToYY = "PrimaryVerificationHaveInsToYY">			
				<tr>														   
	  				<td id="td_PrimaryCBox_VerificationHaveIns" colspan="6" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						&nbsp;<strong>DOES&nbsp;THE&nbsp;PATIENT&nbsp;HAVE&nbsp;INSURANCE&nbsp;WITH&nbsp;YOU?:</strong>&nbsp;
						<cfif trim(PrimaryCBox_VerificationHaveInsYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>YES</strong>&nbsp;&nbsp;
						<cfif trim(PrimaryCBox_VerificationHaveInsNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>NO</strong>&nbsp;&nbsp;&nbsp;<strong>EFFECTIVE&nbsp;DATES&nbsp;OF&nbsp;INSURANCE:</strong>&nbsp;<strong>FROM:</strong>&nbsp;#trim(evaluate(VerificationHaveInsFromMM))#/#trim(evaluate(VerificationHaveInsFromDD))#/#trim(evaluate(VerificationHaveInsFromYY))#&nbsp;&nbsp;<strong>TO:</strong>&nbsp;#trim(evaluate(VerificationHaveInsToMM))#/#trim(evaluate(verificationHaveInsToDD))#/#trim(evaluate(verificationHaveInsToYY))#
					</td>
				</tr>
				<cfset VerificationHaveInsYes = "PrimaryCBox_VerificationHaveInsYes">
				<cfset VerificationHaveInsNo = "PrimaryCBox_VerificationHaveInsNo">
				<tr>														   
					<td id="td_PrimaryCBox_VerificationHaveDMECov" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						&nbsp;<strong>DOES&nbsp;THE&nbsp;PATIENT&nbsp;HAVE&nbsp;DME&nbsp;COVERAGE?:</strong>&nbsp;&nbsp;&nbsp;
						<cfif trim(PrimaryCBox_VerificationHaveDMECovYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;
						<cfif trim(PrimaryCBox_VerificationHaveDMECovNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO
					</td>
					<td id="td_PrimaryCBox_VerificationDeductible" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">
						&nbsp;<strong>IS&nbsp;THERE&nbsp;A&nbsp;DEDUCTIBLE?:</strong>&nbsp;&nbsp;&nbsp;
						<cfif trim(PrimaryCBox_VerificationDeductibleYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<cfif trim(PrimaryCBox_VerificationDeductibleNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO
					</td>
				</tr>										
				<cfset VerificationHaveDMECovYes = "PrimaryCBox_VerificationHaveDMECovYes">
				<cfset VerificationHaveDMECovNo = "PrimaryCBox_VerificationHaveDMECovNo">			
				<cfset VerificationDeductibleYes = "PrimaryCBox_VerificationDeductibleYes">
				<cfset VerificationDeductibleNo = "PrimaryCBox_VerificationDeductibleNo">				
				<cfset VerificationDeductibleAmountTBox = "PrimaryVerificationDeductibleAmountTBox">
				<cfset VerificationDeductibleAmountMetTBox = "PrimaryVerificationDeductibleAmountMetTBox">
				<tr>														   
					<td id="td_PrimaryVerificationDeductibleAmountTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>AMOUNT&nbsp;OF&nbsp;DEDUCTIBLE:</strong>&nbsp;#trim(evaluate(VerificationDeductibleAmountTBox))#</td>
					<td id="td_PrimaryVerificationDeductibleAmountMetTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>HOW&nbsp;MUCH&nbsp;OF&nbsp;DEDUCTIBLE&nbsp;HAS&nbsp;BEEN&nbsp;MET?:</strong>&nbsp;#trim(evaluate(VerificationDeductibleAmountMetTBox))#</td>
				</tr>
	
				<cfset VerificationPercentagePayAfterDeductibleTBox = "PrimaryVerificationPercentagePayAfterDeductibleTBox">	
				<tr>														   
					<td id="td_PrimaryVerificationPercentagePayAfterDeductibleTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>%&nbsp;OF&nbsp;PAY&nbsp;AFTER&nbsp;DEDUCTABLE:</strong>&nbsp;#trim(evaluate(VerificationPercentagePayAfterDeductibleTBox))#</td>
				  	<td id="td_PrimaryCBox_VerificationPPOPolicy" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>IS&nbsp;THIS&nbsp;A&nbsp;PPO/HMO&nbsp;POLICY?:</strong>&nbsp;&nbsp;
					<cfif trim(PrimaryCBox_VerificationPPOPolicyYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;
					<cfif trim(PrimaryCBox_VerificationPPOPolicyNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO
				</td>
				</tr>
				<cfset VerificationPPOPolicyYes = "PrimaryCBox_VerificationPPOPolicyYes">
				<cfset VerificationPPOPolicyNo = "PrimaryCBox_VerificationPPOPolicyNo">	
				
				<cfset VerificationAuthNumberTBox = "PrimaryVerificationAuthNumberTBox">	
				<tr>														   
					<td id="td_PrimaryCBox_VerificationPriorAuthorization" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>IS&nbsp;PRIOR&nbsp;AUTHORIZATION&nbsp;NECESSARY?:</strong>&nbsp;&nbsp;&nbsp;
					<cfif trim(PrimaryCBox_VerificationPriorAuthYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;
					<cfif trim(PrimaryCBox_VerificationPriorAuthNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO
				</td>
					<td id="td_PrimaryVerificationAuthNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>Auth&nbsp;##:</strong>&nbsp;#trim(evaluate(VerificationAuthNumberTBox))#</td>
				</tr>
				<cfset VerificationPriorAuthYes = "PrimaryCBox_VerificationPriorAuthYes">
				<cfset VerificationPriorAuthNo = "PrimaryCBox_VerificationPriorAuthNo">	
				
				<cfset VerificationAuthPhoneNumberTBox = "PrimaryVerificationAuthPhoneNumberTBox">	
				<tr>														   
				 	<td id="td_PrimaryVerificationAuthPhoneNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>CONTACT&nbsp;NUMBER&nbsp;FOR&nbsp;AUTH:</strong>&nbsp;#trim(request.formatPhoneUS(evaluate(VerificationAuthPhoneNumberTBox)))#</td>
				 	<td id="td_PrimaryCBox_VerificationLifetimeBenefitMet" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>HAS&nbsp;LIFETIME&nbsp;BENEFIT&nbsp;BEEN&nbsp;MET?:</strong>&nbsp;&nbsp;&nbsp;
					<cfif trim(PrimaryCBox_VerificationLifetimeBenefitMetYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;&nbsp;
					<cfif trim(PrimaryCBox_VerificationLifetimeBenefitMetNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO
				</td>
				</tr>
				<cfset VerificationLifetimeBenefitMetYes = "PrimaryCBox_VerificationLifetimeBenefitMetYes">
				<cfset VerificationLifetimeBenefitMetNo = "PrimaryCBox_VerificationLifetimeBenefitMetNo">	
				
				<tr>														   
					<td id="td_PrimaryMedicareSupplement" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						&nbsp;<strong>MEDICARE&nbsp;SUPPLEMENT:</strong>&nbsp;&nbsp;&nbsp;
						<cfif trim(PrimaryCBox_MedicareSupplementYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;&nbsp;
						<cfif trim(PrimaryCBox_MedicareSupplementNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO&nbsp;&nbsp;&nbsp;
						<strong>COORDINATE&nbsp;BENEFITS:</strong>&nbsp;&nbsp;&nbsp;					
						<cfif trim(PrimaryCBox_CoordinateBenefitsYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;&nbsp;
						<cfif trim(PrimaryCBox_CoordinateBenefitsNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO&nbsp;&nbsp;&nbsp;
						<strong>PAID&nbsp;MEDICARE&nbsp;DEDUCTIBLE:</strong>&nbsp;&nbsp;&nbsp;					
						<cfif trim(PrimaryCBox_PaidMedicareDeductibleYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;&nbsp;					
						<cfif trim(PrimaryCBox_PaidMedicareDeductibleNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO								
					</td>
				</tr>
					
				<cfset MedicareSupplementYes = "PrimaryCBox_MedicareSupplementYes">
				<cfset MedicareSupplementNo = "PrimaryCBox_MedicareSupplementNo">				
				<cfset CoordinateBenefitsYes = "PrimaryCBox_CoordinateBenefitsYes">
				<cfset CoordinateBenefitsNo = "PrimaryCBox_CoordinateBenefitsNo">			
				<cfset PaidMedicareDeductibleYes = "PrimaryCBox_PaidMedicareDeductibleYes">
				<cfset PaidMedicareDeductibleNo = "PrimaryCBox_PaidMedicareDeductibleNo">	
				<cfset VerificationTypeBasePlanTBox = "PrimaryVerificationTypeBasePlanTBox">									
				<tr>														   
					<td id="td_PrimaryVerificationTypeBasePlanTBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						&nbsp;<strong>MEDICAID&nbsp;PLAN:</strong>&nbsp;&nbsp;&nbsp;					
						<cfif trim(PrimaryCBox_VerificationMedicaidPlanMQMB) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;MQMB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;					
						<cfif trim(PrimaryCBox_VerificationMedicaidPlanQMB) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;QMB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;					
						<cfif trim(PrimaryCBox_VerificationMedicaidPlanTraditional) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;TRADITIONAL&nbsp;&nbsp;&nbsp;&nbsp;**&nbsp;TYPE&nbsp;OF&nbsp;BASE&nbsp;PLAN:&nbsp;#trim(evaluate(VerificationTypeBasePlanTBox))#
					</td>
				</tr>	
				
				<cfset VerificationMedicaidPlanMQMB = "PrimaryCBox_VerificationMedicaidPlanMQMB">
				<cfset VerificationMedicaidPlanQMB = "PrimaryCBox_VerificationMedicaidPlanQMB">
				<cfset VerificationMedicaidPlanTraditional = "PrimaryCBox_VerificationMedicaidPlanTraditional">				
				<tr>
		        	<td colspan="6" class="siteLabel">&nbsp;</td>
		       	</tr>	
			
			</table> 		
		
		
						
			</td>
		</tr>
		
		<tr>
		    <td align="center" colspan="7" class="siteLabel">&nbsp;</td>
		</tr>
	<!---****************************************************Primary Insurance Above*********************************************--->
	
	
	
	<!---**************************************************** Secondary Insurance Below ********************************************--->
		<tr><td align="center" colspan="7"><font color="c0c0c0" face="Arial" size="3"><strong>INTAKE&nbsp;ID:&nbsp;#trim(intakeID)#<cfif InactiveCode EQ 298>&nbsp;[PENDING]</cfif>&nbsp;&nbsp;<cfif NOT Active>STATUS: CANCELLED</cfif></strong></font></td></tr>	
		<tr><td align="center" colspan="7" class="siteLabel">&nbsp;</td></tr>
		<!--- INSURANCE INFORMATION --->							
		<tr>
       		<td bgcolor="DCE3EB" align="center" colspan="7" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
         		<font face="Arial" size="2"><strong>INSURANCE&nbsp;INFORMATION</strong></font>
        	</td>
        </tr>
		<tr>
       		<td colspan="7" class="siteLabel" style="margin-top:6px; border-Top: 1px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">
  

		
		
			<table cellpadding="4" cellspacing="0" border="0" align="center">
				<tr>
		        	<td id="td_priNoteTBox" colspan="6" class="siteLabel">&nbsp;</td>
		       	</tr>
			   	<tr>
					<td bgcolor="DCE3EB" align="center" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">
						<font face="Arial" size="2"><strong>SECODARY&nbsp;INSURANCE</strong></font>
					</td>		
					<td bgcolor="DCE3EB" colspan="3" align="right" nowrap class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">
						&nbsp;					
					</td>						
				</tr>											   
			  	
				<cfset InsuranceNameTBox = "SecondaryInsuranceNameTBox">
				<cfset PolicyNumberTBox = "SecondaryPolicyNumberTBox">
			   	<tr>	        	
				   	<td id="td_SecondaryInsuranceNameTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>INSURANCE&nbsp;NAME:</strong>&nbsp;#trim(evaluate(InsuranceNameTBox))#</td>
		       	   	<td id="td_SecondaryPolicyNumberTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>POLICY&nbsp;##:</strong>&nbsp;#trim(evaluate(PolicyNumberTBox))#</td>
		       	</tr>
		       	
				<cfset GroupNumberTBox = "SecondaryGroupNumberTBox">
				<cfset PhoneNumberTBox = "SecondaryPhoneNumberTBox">
				<cfset FaxNumberTBox = "SecondaryFaxNumberTBox">
				<tr>		   		
		           	<td id="td_SecondaryGroupNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>GROUP&nbsp;##:</strong>&nbsp;#trim(evaluate(GroupNumberTBox))#</td>
		           	<td id="td_SecondaryPhoneNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">
						&nbsp;<strong>PHONE&nbsp;##:</strong>&nbsp;#trim(evaluate(PhoneNumberTBox))#
						&nbsp;<strong>FAX&nbsp;##:</strong>&nbsp;#trim(evaluate(FaxNumberTBox))#
					</td>
		       	</tr>
				
				<cfset SendToAddress1TBox = "SecondarySendToAddress1TBox">
				<cfset SendToAddress2TBox = "SecondarySendToAddress2TBox">			
			   	<tr>
		        	<td id="td_SecondarySendToAddress1TBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						<strong>SEND&nbsp;CLAIMS&nbsp;TO&nbsp;ADDRESS&nbsp;LINE&nbsp;1:</strong>&nbsp;#trim(evaluate(SendToAddress1TBox))#
						&nbsp;<strong>ADDRESS&nbsp;LINE&nbsp;2:</strong>&nbsp;#trim(evaluate(SendToAddress2TBox))#
					</td>
		       	</tr>	
				
				<cfset SendToCityTBox = "SecondarySendToCityTBox">
				<cfset SendToStateTBox = "SecondarySendToStateTBox">			
				<cfset SendToZipCodeTBox = "SecondarySendToZipCodeTBox">			
			   	<tr>
		        	<td id="td_SecondarySendToCityTBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						&nbsp;<strong>CITY:</strong>&nbsp;#trim(evaluate(SendToCityTBox))#
						&nbsp;<strong>STATE:</strong>&nbsp;#trim(evaluate(SendToStateTBox))#
						&nbsp;<strong>ZIP&nbsp;CODE:</strong>&nbsp;#trim(evaluate(SendToZipCodeTBox))#
					</td>
		       	</tr>
				
							
				<cfset EffectiveDateMM = "SecondaryEffectiveDateMM">
				<cfset EffectiveDateDD = "SecondaryEffectiveDateDD">
				<cfset EffectiveDateYY = "SecondaryEffectiveDateYY">
				<cfset PolicyHolderFNameTBox = "SecondaryPolicyHolderFNameTBox">
				<cfset PolicyHolderMInitialTBox = "SecondaryPolicyHolderMInitialTBox">
				<cfset PolicyHolderLNameTBox = "SecondaryPolicyHolderLNameTBox">
				<tr>
		        	<td id="td_SecondaryEffectiveDate" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>EFFECTIVE&nbsp;DATE:</strong>&nbsp;&nbsp;#trim(evaluate(EffectiveDateMM))#/#trim(evaluate(EffectiveDateDD))#/#trim(evaluate(EffectiveDateYY))#</td>
		           	<td id="td_SecondaryPolicyHolderNameTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>POLICY&nbsp;HOLDERS&nbsp;FIRST:</strong>&nbsp;#trim(evaluate(PolicyHolderFNameTBox))#&nbsp;<strong>M:</strong>&nbsp;#trim(evaluate(PolicyHolderMInitialTBox))#&nbsp;<strong>LAST:</strong>&nbsp;#trim(evaluate(PolicyHolderLNameTBox))#</td>
		       	</tr>	       
			   
			   	<cfset HoldersDOBMM = "SecondaryHoldersDOBMM">
				<cfset HoldersDOBDD = "SecondaryHoldersDOBDD">
				<cfset HoldersDOBYY = "SecondaryHoldersDOBYY">
			   	<cfset PolicyHolderEmployerTBox = "SecondaryPolicyHolderEmployerTBox">
			   	<tr>
		        	<td id="td_SecondaryHoldersDOB" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>POLICY&nbsp;HOLDERS&nbsp;DOB:</strong>&nbsp;#trim(evaluate(HoldersDOBMM))#/#trim(evaluate(HoldersDOBDD))#/#trim(evaluate(HoldersDOBYY))#</td>
		       	   	<td id="td_SecondaryPolicyHolderEmployerTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>POLICY&nbsp;HOLDERS&nbsp;EMPLOYER:</strong>&nbsp;#trim(evaluate(PolicyHolderEmployerTBox))#</td>
		       	</tr>	  
			  
			 	<cfset NoteTBox = "SecondaryNoteTBox">
			   	<tr>
		        	<td id="td_SecondaryNoteTBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>NOTE:</strong>&nbsp;#trim(evaluate(NoteTBox))#</td>
		       	</tr>		   
			  
			    <tr>
				    <td bgcolor="DCE3EB" align="center" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						<font face="Arial" size="2"><strong>SECONDARY&nbsp;INSURANCE&nbsp;VERIFICATION&nbsp;PROCESS</strong></font>
					</td>								
				</tr>	
			   		
				<cfset VerificationRepFNameTBox = "SecondaryVerificationRepFNameTBox">	
				<cfset VerificationRepLNameTBox = "SecondaryVerificationRepLNameTBox">	
				<cfset VerificationDateMM = "SecondaryVerificationDateMM">
				<cfset VerificationDateDD = "SecondaryVerificationDateDD">
				<cfset VerificationDateYY = "SecondaryVerificationDateYY">
				<cfset VerificationTimeTBox = "SecondaryVerificationTimeTBox">			 
				<tr>
					<td nowrap id="td_SecondaryVerificationRepNameTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">
						<strong>REP&nbsp;FIRST:</strong>#trim(evaluate(VerificationRepFNameTBox))#
						&nbsp;<strong>LAST:</strong>#trim(evaluate(VerificationRepLNameTBox))#
					</td>
	  				<td id="td_SecondaryVerificationDate" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>DATE:</strong>&nbsp;#trim(evaluate(VerificationDateMM))#/#trim(evaluate(VerificationDateDD))#/#trim(evaluate(VerificationDateYY))#</td>
					<td id="td_SecondaryVerificationTimeTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>TIME:</strong>&nbsp;#trim(evaluate(VerificationTimeTBox))#</td>
				</tr>
				
				
				<cfset verificationHaveInsFromMM = "SecondaryVerificationHaveInsFromMM">
				<cfset verificationHaveInsFromDD = "SecondaryVerificationHaveInsFromDD">
				<cfset verificationHaveInsFromYY = "SecondaryVerificationHaveInsFromYY">
				<cfset verificationHaveInsToMM = "SecondaryVerificationHaveInsToMM">
				<cfset verificationHaveInsToDD = "SecondaryVerificationHaveInsToDD">
				<cfset verificationHaveInsToYY = "SecondaryVerificationHaveInsToYY">			
				<tr>														   
	  				<td id="td_SecondaryCBox_VerificationHaveIns" colspan="6" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						&nbsp;<strong>DOES&nbsp;THE&nbsp;PATIENT&nbsp;HAVE&nbsp;INSURANCE&nbsp;WITH&nbsp;YOU?:</strong>&nbsp;
						<cfif trim(SecondaryCBox_VerificationHaveInsYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>YES</strong>&nbsp;&nbsp;
						<cfif trim(SecondaryCBox_VerificationHaveInsNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>NO</strong>&nbsp;&nbsp;&nbsp;<strong>EFFECTIVE&nbsp;DATES&nbsp;OF&nbsp;INSURANCE:</strong>&nbsp;<strong>FROM:</strong>&nbsp;#trim(evaluate(VerificationHaveInsFromMM))#/#trim(evaluate(VerificationHaveInsFromDD))#/#trim(evaluate(VerificationHaveInsFromYY))#&nbsp;&nbsp;<strong>TO:</strong>&nbsp;#trim(evaluate(VerificationHaveInsToMM))#/#trim(evaluate(verificationHaveInsToDD))#/#trim(evaluate(verificationHaveInsToYY))#
					</td>
				</tr>
				<cfset VerificationHaveInsYes = "SecondaryCBox_VerificationHaveInsYes">
				<cfset VerificationHaveInsNo = "SecondaryCBox_VerificationHaveInsNo">
				<tr>														   
					<td id="td_SecondaryCBox_VerificationHaveDMECov" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						&nbsp;<strong>DOES&nbsp;THE&nbsp;PATIENT&nbsp;HAVE&nbsp;DME&nbsp;COVERAGE?:</strong>&nbsp;&nbsp;&nbsp;
						<cfif trim(SecondaryCBox_VerificationHaveDMECovYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;
						<cfif trim(SecondaryCBox_VerificationHaveDMECovNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO
					</td>
					<td id="td_SecondaryCBox_VerificationDeductible" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">
						&nbsp;<strong>IS&nbsp;THERE&nbsp;A&nbsp;DEDUCTIBLE?:</strong>&nbsp;&nbsp;&nbsp;
						<cfif trim(SecondaryCBox_VerificationDeductibleYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<cfif trim(SecondaryCBox_VerificationDeductibleNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO
					</td>
				</tr>										
				<cfset VerificationHaveDMECovYes = "SecondaryCBox_VerificationHaveDMECovYes">
				<cfset VerificationHaveDMECovNo = "SecondaryCBox_VerificationHaveDMECovNo">			
				<cfset VerificationDeductibleYes = "SecondaryCBox_VerificationDeductibleYes">
				<cfset VerificationDeductibleNo = "SecondaryCBox_VerificationDeductibleNo">				
				<cfset VerificationDeductibleAmountTBox = "SecondaryVerificationDeductibleAmountTBox">
				<cfset VerificationDeductibleAmountMetTBox = "SecondaryVerificationDeductibleAmountMetTBox">
				<tr>														   
					<td id="td_SecondaryVerificationDeductibleAmountTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>AMOUNT&nbsp;OF&nbsp;DEDUCTIBLE:</strong>&nbsp;#trim(evaluate(VerificationDeductibleAmountTBox))#</td>
					<td id="td_SecondaryVerificationDeductibleAmountMetTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>HOW&nbsp;MUCH&nbsp;OF&nbsp;DEDUCTIBLE&nbsp;HAS&nbsp;BEEN&nbsp;MET?:</strong>&nbsp;#trim(evaluate(VerificationDeductibleAmountMetTBox))#</td>
				</tr>
	
				<cfset VerificationPercentagePayAfterDeductibleTBox = "SecondaryVerificationPercentagePayAfterDeductibleTBox">	
				<tr>														   
					<td id="td_SecondaryVerificationPercentagePayAfterDeductibleTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>%&nbsp;OF&nbsp;PAY&nbsp;AFTER&nbsp;DEDUCTABLE:</strong>&nbsp;#trim(evaluate(VerificationPercentagePayAfterDeductibleTBox))#</td>
				  	<td id="td_SecondaryCBox_VerificationPPOPolicy" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>IS&nbsp;THIS&nbsp;A&nbsp;PPO/HMO&nbsp;POLICY?:</strong>&nbsp;&nbsp;
					<cfif trim(SecondaryCBox_VerificationPPOPolicyYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;
					<cfif trim(SecondaryCBox_VerificationPPOPolicyNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO
				</td>
				</tr>
				<cfset VerificationPPOPolicyYes = "SecondaryCBox_VerificationPPOPolicyYes">
				<cfset VerificationPPOPolicyNo = "SecondaryCBox_VerificationPPOPolicyNo">	
				
				<cfset VerificationAuthNumberTBox = "SecondaryVerificationAuthNumberTBox">	
				<tr>														   
					<td id="td_SecondaryCBox_VerificationPriorAuthorization" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>IS&nbsp;PRIOR&nbsp;AUTHORIZATION&nbsp;NECESSARY?:</strong>&nbsp;&nbsp;&nbsp;
					<cfif trim(SecondaryCBox_VerificationPriorAuthYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;
					<cfif trim(SecondaryCBox_VerificationPriorAuthNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO
				</td>
					<td id="td_SecondaryVerificationAuthNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>Auth&nbsp;##:</strong>&nbsp;#trim(evaluate(VerificationAuthNumberTBox))#</td>
				</tr>
				<cfset VerificationPriorAuthYes = "SecondaryCBox_VerificationPriorAuthYes">
				<cfset VerificationPriorAuthNo = "SecondaryCBox_VerificationPriorAuthNo">	
				
				<cfset VerificationAuthPhoneNumberTBox = "SecondaryVerificationAuthPhoneNumberTBox">	
				<tr>														   
				 	<td id="td_SecondaryVerificationAuthPhoneNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>CONTACT&nbsp;NUMBER&nbsp;FOR&nbsp;AUTH:</strong>&nbsp;#trim(request.formatPhoneUS(evaluate(VerificationAuthPhoneNumberTBox)))#</td>
				 	<td id="td_SecondaryCBox_VerificationLifetimeBenefitMet" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>HAS&nbsp;LIFETIME&nbsp;BENEFIT&nbsp;BEEN&nbsp;MET?:</strong>&nbsp;&nbsp;&nbsp;
					<cfif trim(SecondaryCBox_VerificationLifetimeBenefitMetYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;&nbsp;
					<cfif trim(SecondaryCBox_VerificationLifetimeBenefitMetNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO
				</td>
				</tr>
				<cfset VerificationLifetimeBenefitMetYes = "SecondaryCBox_VerificationLifetimeBenefitMetYes">
				<cfset VerificationLifetimeBenefitMetNo = "SecondaryCBox_VerificationLifetimeBenefitMetNo">	
				
				<tr>														   
					<td id="td_SecondaryMedicareSupplement" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						&nbsp;<strong>MEDICARE&nbsp;SUPPLEMENT:</strong>&nbsp;&nbsp;&nbsp;
						<cfif trim(SecondaryCBox_MedicareSupplementYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;&nbsp;
						<cfif trim(SecondaryCBox_MedicareSupplementNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO&nbsp;&nbsp;&nbsp;
						<strong>COORDINATE&nbsp;BENEFITS:</strong>&nbsp;&nbsp;&nbsp;					
						<cfif trim(SecondaryCBox_CoordinateBenefitsYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;&nbsp;
						<cfif trim(SecondaryCBox_CoordinateBenefitsNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO&nbsp;&nbsp;&nbsp;
						<strong>PAID&nbsp;MEDICARE&nbsp;DEDUCTIBLE:</strong>&nbsp;&nbsp;&nbsp;					
						<cfif trim(SecondaryCBox_PaidMedicareDeductibleYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;&nbsp;					
						<cfif trim(SecondaryCBox_PaidMedicareDeductibleNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO								
					</td>
				</tr>
					
				<cfset MedicareSupplementYes = "SecondaryCBox_MedicareSupplementYes">
				<cfset MedicareSupplementNo = "SecondaryCBox_MedicareSupplementNo">				
				<cfset CoordinateBenefitsYes = "SecondaryCBox_CoordinateBenefitsYes">
				<cfset CoordinateBenefitsNo = "SecondaryCBox_CoordinateBenefitsNo">			
				<cfset PaidMedicareDeductibleYes = "SecondaryCBox_PaidMedicareDeductibleYes">
				<cfset PaidMedicareDeductibleNo = "SecondaryCBox_PaidMedicareDeductibleNo">	
				<cfset VerificationTypeBasePlanTBox = "SecondaryVerificationTypeBasePlanTBox">									
				<tr>														   
					<td id="td_SecondaryVerificationTypeBasePlanTBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						&nbsp;<strong>MEDICAID&nbsp;PLAN:</strong>&nbsp;&nbsp;&nbsp;					
						<cfif trim(SecondaryCBox_VerificationMedicaidPlanMQMB) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;MQMB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;					
						<cfif trim(SecondaryCBox_VerificationMedicaidPlanQMB) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;QMB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;					
						<cfif trim(SecondaryCBox_VerificationMedicaidPlanTraditional) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;TRADITIONAL&nbsp;&nbsp;&nbsp;&nbsp;**&nbsp;TYPE&nbsp;OF&nbsp;BASE&nbsp;PLAN:&nbsp;#trim(evaluate(VerificationTypeBasePlanTBox))#
					</td>
				</tr>	
				
				<cfset VerificationMedicaidPlanMQMB = "SecondaryCBox_VerificationMedicaidPlanMQMB">
				<cfset VerificationMedicaidPlanQMB = "SecondaryCBox_VerificationMedicaidPlanQMB">
				<cfset VerificationMedicaidPlanTraditional = "SecondaryCBox_VerificationMedicaidPlanTraditional">				
				<tr>
		        	<td colspan="6" class="siteLabel">&nbsp;</td>
		       	</tr>	
			
			</table> 		
		
		
							
			</td>
		</tr>
		
		<tr>
		    <td align="center" colspan="7" class="siteLabel">&nbsp;</td>
		</tr>
								
	<!---****************************************************Secondary Insurance Above*********************************************--->	
	
	<!---**************************************************** Tertiary Insurance Below ********************************************--->									
		<tr><td align="center" colspan="7"><font color="c0c0c0" face="Arial" size="3"><strong>INTAKE&nbsp;ID:&nbsp;#trim(intakeID)#<cfif InactiveCode EQ 298>&nbsp;[PENDING]</cfif>&nbsp;&nbsp;<cfif NOT Active>STATUS: CANCELLED</cfif></strong></font></td></tr>	
		<tr><td align="center" colspan="7" class="siteLabel">&nbsp;</td></tr><!--- INSURANCE INFORMATION --->							
		<tr>
       		<td bgcolor="DCE3EB" align="center" colspan="7" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
         		<font face="Arial" size="2"><strong>TERTIARY&nbsp;INSURANCE&nbsp;INFORMATION</strong></font>
        	</td>
        </tr>
		<tr>
       		<td colspan="7" class="siteLabel" style="margin-top:6px; border-Top: 1px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">

		
		
			<table cellpadding="4" cellspacing="0" border="0" align="center">
				<tr>
		        	<td id="td_priNoteTBox" colspan="6" class="siteLabel">&nbsp;</td>
		       	</tr>
			   	<tr>
					<td bgcolor="DCE3EB" align="center" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">
						<font face="Arial" size="2"><strong>TERTIARY&nbsp;INSURANCE</strong></font>
					</td>		
					<td bgcolor="DCE3EB" colspan="3" align="right" nowrap class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">
						&nbsp;					
					</td>						
				</tr>											   
			  	
				<cfset InsuranceNameTBox = "TertiaryInsuranceNameTBox">
				<cfset PolicyNumberTBox = "TertiaryPolicyNumberTBox">
			   	<tr>	        	
				   	<td id="td_TertiaryInsuranceNameTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>INSURANCE&nbsp;NAME:</strong>&nbsp;#trim(evaluate(InsuranceNameTBox))#</td>
		       	   	<td id="td_TertiaryPolicyNumberTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>POLICY&nbsp;##:</strong>&nbsp;#trim(evaluate(PolicyNumberTBox))#</td>
		       	</tr>
		       	
				<cfset GroupNumberTBox = "TertiaryGroupNumberTBox">
				<cfset PhoneNumberTBox = "TertiaryPhoneNumberTBox">
				<cfset FaxNumberTBox = "TertiaryFaxNumberTBox">
				<tr>		   		
		           	<td id="td_TertiaryGroupNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>GROUP&nbsp;##:</strong>&nbsp;#trim(evaluate(GroupNumberTBox))#</td>
		           	<td id="td_TertiaryPhoneNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">
						&nbsp;<strong>PHONE&nbsp;##:</strong>&nbsp;#trim(evaluate(PhoneNumberTBox))#
						&nbsp;<strong>FAX&nbsp;##:</strong>&nbsp;#trim(evaluate(FaxNumberTBox))#
					</td>
		       	</tr>
				
				<cfset SendToAddress1TBox = "TertiarySendToAddress1TBox">
				<cfset SendToAddress2TBox = "TertiarySendToAddress2TBox">			
			   	<tr>
		        	<td id="td_TertiarySendToAddress1TBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						<strong>SEND&nbsp;CLAIMS&nbsp;TO&nbsp;ADDRESS&nbsp;LINE&nbsp;1:</strong>&nbsp;#trim(evaluate(SendToAddress1TBox))#
						&nbsp;<strong>ADDRESS&nbsp;LINE&nbsp;2:</strong>&nbsp;#trim(evaluate(SendToAddress2TBox))#
					</td>
		       	</tr>	
				
				<cfset SendToCityTBox = "TertiarySendToCityTBox">
				<cfset SendToStateTBox = "TertiarySendToStateTBox">			
				<cfset SendToZipCodeTBox = "TertiarySendToZipCodeTBox">			
			   	<tr>
		        	<td id="td_TertiarySendToCityTBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						&nbsp;<strong>CITY:</strong>&nbsp;#trim(evaluate(SendToCityTBox))#
						&nbsp;<strong>STATE:</strong>&nbsp;#trim(evaluate(SendToStateTBox))#
						&nbsp;<strong>ZIP&nbsp;CODE:</strong>&nbsp;#trim(evaluate(SendToZipCodeTBox))#
					</td>
		       	</tr>
				
							
				<cfset EffectiveDateMM = "TertiaryEffectiveDateMM">
				<cfset EffectiveDateDD = "TertiaryEffectiveDateDD">
				<cfset EffectiveDateYY = "TertiaryEffectiveDateYY">
				<cfset PolicyHolderFNameTBox = "TertiaryPolicyHolderFNameTBox">
				<cfset PolicyHolderMInitialTBox = "TertiaryPolicyHolderMInitialTBox">
				<cfset PolicyHolderLNameTBox = "TertiaryPolicyHolderLNameTBox">
				<tr>
		        	<td id="td_TertiaryEffectiveDate" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>EFFECTIVE&nbsp;DATE:</strong>&nbsp;&nbsp;#trim(evaluate(EffectiveDateMM))#/#trim(evaluate(EffectiveDateDD))#/#trim(evaluate(EffectiveDateYY))#</td>
		           	<td id="td_TertiaryPolicyHolderNameTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>POLICY&nbsp;HOLDERS&nbsp;FIRST:</strong>&nbsp;#trim(evaluate(PolicyHolderFNameTBox))#&nbsp;<strong>M:</strong>&nbsp;#trim(evaluate(PolicyHolderMInitialTBox))#&nbsp;<strong>LAST:</strong>&nbsp;#trim(evaluate(PolicyHolderLNameTBox))#</td>
		       	</tr>	       
			   
			   	<cfset HoldersDOBMM = "TertiaryHoldersDOBMM">
				<cfset HoldersDOBDD = "TertiaryHoldersDOBDD">
				<cfset HoldersDOBYY = "TertiaryHoldersDOBYY">
			   	<cfset PolicyHolderEmployerTBox = "TertiaryPolicyHolderEmployerTBox">
			   	<tr>
		        	<td id="td_TertiaryHoldersDOB" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>POLICY&nbsp;HOLDERS&nbsp;DOB:</strong>&nbsp;#trim(evaluate(HoldersDOBMM))#/#trim(evaluate(HoldersDOBDD))#/#trim(evaluate(HoldersDOBYY))#</td>
		       	   	<td id="td_TertiaryPolicyHolderEmployerTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>POLICY&nbsp;HOLDERS&nbsp;EMPLOYER:</strong>&nbsp;#trim(evaluate(PolicyHolderEmployerTBox))#</td>
		       	</tr>	  
			  
			 	<cfset NoteTBox = "TertiaryNoteTBox">
			   	<tr>
		        	<td id="td_TertiaryNoteTBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>NOTE:</strong>&nbsp;#trim(evaluate(NoteTBox))#</td>
		       	</tr>		   
			  
			    <tr>
				    <td bgcolor="DCE3EB" align="center" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						<font face="Arial" size="2"><strong>TERTIARY&nbsp;INSURANCE&nbsp;VERIFICATION&nbsp;PROCESS</strong></font>
					</td>								
				</tr>	
			   		
				<cfset VerificationRepFNameTBox = "TertiaryVerificationRepFNameTBox">	
				<cfset VerificationRepLNameTBox = "TertiaryVerificationRepLNameTBox">	
				<cfset VerificationDateMM = "TertiaryVerificationDateMM">
				<cfset VerificationDateDD = "TertiaryVerificationDateDD">
				<cfset VerificationDateYY = "TertiaryVerificationDateYY">
				<cfset VerificationTimeTBox = "TertiaryVerificationTimeTBox">			 
				<tr>
					<td nowrap id="td_TertiaryVerificationRepNameTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">
						<strong>REP&nbsp;FIRST:</strong>#trim(evaluate(VerificationRepFNameTBox))#
						&nbsp;<strong>LAST:</strong>#trim(evaluate(VerificationRepLNameTBox))#
					</td>
	  				<td id="td_TertiaryVerificationDate" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>DATE:</strong>&nbsp;#trim(evaluate(VerificationDateMM))#/#trim(evaluate(VerificationDateDD))#/#trim(evaluate(VerificationDateYY))#</td>
					<td id="td_TertiaryVerificationTimeTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>TIME:</strong>&nbsp;#trim(evaluate(VerificationTimeTBox))#</td>
				</tr>
				
				
				<cfset verificationHaveInsFromMM = "TertiaryVerificationHaveInsFromMM">
				<cfset verificationHaveInsFromDD = "TertiaryVerificationHaveInsFromDD">
				<cfset verificationHaveInsFromYY = "TertiaryVerificationHaveInsFromYY">
				<cfset verificationHaveInsToMM = "TertiaryVerificationHaveInsToMM">
				<cfset verificationHaveInsToDD = "TertiaryVerificationHaveInsToDD">
				<cfset verificationHaveInsToYY = "TertiaryVerificationHaveInsToYY">			
				<tr>														   
	  				<td id="td_TertiaryCBox_VerificationHaveIns" colspan="6" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						&nbsp;<strong>DOES&nbsp;THE&nbsp;PATIENT&nbsp;HAVE&nbsp;INSURANCE&nbsp;WITH&nbsp;YOU?:</strong>&nbsp;
						<cfif trim(TertiaryCBox_VerificationHaveInsYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>YES</strong>&nbsp;&nbsp;
						<cfif trim(TertiaryCBox_VerificationHaveInsNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>NO</strong>&nbsp;&nbsp;&nbsp;<strong>EFFECTIVE&nbsp;DATES&nbsp;OF&nbsp;INSURANCE:</strong>&nbsp;<strong>FROM:</strong>&nbsp;#trim(evaluate(VerificationHaveInsFromMM))#/#trim(evaluate(VerificationHaveInsFromDD))#/#trim(evaluate(VerificationHaveInsFromYY))#&nbsp;&nbsp;<strong>TO:</strong>&nbsp;#trim(evaluate(VerificationHaveInsToMM))#/#trim(evaluate(verificationHaveInsToDD))#/#trim(evaluate(verificationHaveInsToYY))#
					</td>
				</tr>
				<cfset VerificationHaveInsYes = "TertiaryCBox_VerificationHaveInsYes">
				<cfset VerificationHaveInsNo = "TertiaryCBox_VerificationHaveInsNo">
				<tr>														   
					<td id="td_TertiaryCBox_VerificationHaveDMECov" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						&nbsp;<strong>DOES&nbsp;THE&nbsp;PATIENT&nbsp;HAVE&nbsp;DME&nbsp;COVERAGE?:</strong>&nbsp;&nbsp;&nbsp;
						<cfif trim(TertiaryCBox_VerificationHaveDMECovYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;
						<cfif trim(TertiaryCBox_VerificationHaveDMECovNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO
					</td>
					<td id="td_TertiaryCBox_VerificationDeductible" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">
						&nbsp;<strong>IS&nbsp;THERE&nbsp;A&nbsp;DEDUCTIBLE?:</strong>&nbsp;&nbsp;&nbsp;
						<cfif trim(TertiaryCBox_VerificationDeductibleYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<cfif trim(TertiaryCBox_VerificationDeductibleNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO
					</td>
				</tr>										
				<cfset VerificationHaveDMECovYes = "TertiaryCBox_VerificationHaveDMECovYes">
				<cfset VerificationHaveDMECovNo = "TertiaryCBox_VerificationHaveDMECovNo">			
				<cfset VerificationDeductibleYes = "TertiaryCBox_VerificationDeductibleYes">
				<cfset VerificationDeductibleNo = "TertiaryCBox_VerificationDeductibleNo">				
				<cfset VerificationDeductibleAmountTBox = "TertiaryVerificationDeductibleAmountTBox">
				<cfset VerificationDeductibleAmountMetTBox = "TertiaryVerificationDeductibleAmountMetTBox">
				<tr>														   
					<td id="td_TertiaryVerificationDeductibleAmountTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>AMOUNT&nbsp;OF&nbsp;DEDUCTIBLE:</strong>&nbsp;#trim(evaluate(VerificationDeductibleAmountTBox))#</td>
					<td id="td_TertiaryVerificationDeductibleAmountMetTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>HOW&nbsp;MUCH&nbsp;OF&nbsp;DEDUCTIBLE&nbsp;HAS&nbsp;BEEN&nbsp;MET?:</strong>&nbsp;#trim(evaluate(VerificationDeductibleAmountMetTBox))#</td>
				</tr>
	
				<cfset VerificationPercentagePayAfterDeductibleTBox = "TertiaryVerificationPercentagePayAfterDeductibleTBox">	
				<tr>														   
					<td id="td_TertiaryVerificationPercentagePayAfterDeductibleTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>%&nbsp;OF&nbsp;PAY&nbsp;AFTER&nbsp;DEDUCTABLE:</strong>&nbsp;#trim(evaluate(VerificationPercentagePayAfterDeductibleTBox))#</td>
				  	<td id="td_TertiaryCBox_VerificationPPOPolicy" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>IS&nbsp;THIS&nbsp;A&nbsp;PPO/HMO&nbsp;POLICY?:</strong>&nbsp;&nbsp;
					<cfif trim(TertiaryCBox_VerificationPPOPolicyYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;
					<cfif trim(TertiaryCBox_VerificationPPOPolicyNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO
				</td>
				</tr>
				<cfset VerificationPPOPolicyYes = "TertiaryCBox_VerificationPPOPolicyYes">
				<cfset VerificationPPOPolicyNo = "TertiaryCBox_VerificationPPOPolicyNo">	
				
				<cfset VerificationAuthNumberTBox = "TertiaryVerificationAuthNumberTBox">	
				<tr>														   
					<td id="td_TertiaryCBox_VerificationPriorAuthorization" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>IS&nbsp;PRIOR&nbsp;AUTHORIZATION&nbsp;NECESSARY?:</strong>&nbsp;&nbsp;&nbsp;
					<cfif trim(TertiaryCBox_VerificationPriorAuthYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;
					<cfif trim(TertiaryCBox_VerificationPriorAuthNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO
				</td>
					<td id="td_TertiaryVerificationAuthNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>Auth&nbsp;##:</strong>&nbsp;#trim(evaluate(VerificationAuthNumberTBox))#</td>
				</tr>
				<cfset VerificationPriorAuthYes = "TertiaryCBox_VerificationPriorAuthYes">
				<cfset VerificationPriorAuthNo = "TertiaryCBox_VerificationPriorAuthNo">	
				
				<cfset VerificationAuthPhoneNumberTBox = "TertiaryVerificationAuthPhoneNumberTBox">	
				<tr>														   
				 	<td id="td_TertiaryVerificationAuthPhoneNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>CONTACT&nbsp;NUMBER&nbsp;FOR&nbsp;AUTH:</strong>&nbsp;#trim(request.formatPhoneUS(evaluate(VerificationAuthPhoneNumberTBox)))#</td>
				 	<td id="td_TertiaryCBox_VerificationLifetimeBenefitMet" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>HAS&nbsp;LIFETIME&nbsp;BENEFIT&nbsp;BEEN&nbsp;MET?:</strong>&nbsp;&nbsp;&nbsp;
					<cfif trim(TertiaryCBox_VerificationLifetimeBenefitMetYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;&nbsp;
					<cfif trim(TertiaryCBox_VerificationLifetimeBenefitMetNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO
				</td>
				</tr>
				<cfset VerificationLifetimeBenefitMetYes = "TertiaryCBox_VerificationLifetimeBenefitMetYes">
				<cfset VerificationLifetimeBenefitMetNo = "TertiaryCBox_VerificationLifetimeBenefitMetNo">	
				
				<tr>														   
					<td id="td_TertiaryMedicareSupplement" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						&nbsp;<strong>MEDICARE&nbsp;SUPPLEMENT:</strong>&nbsp;&nbsp;&nbsp;
						<cfif trim(TertiaryCBox_MedicareSupplementYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;&nbsp;
						<cfif trim(TertiaryCBox_MedicareSupplementNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO&nbsp;&nbsp;&nbsp;
						<strong>COORDINATE&nbsp;BENEFITS:</strong>&nbsp;&nbsp;&nbsp;					
						<cfif trim(TertiaryCBox_CoordinateBenefitsYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;&nbsp;
						<cfif trim(TertiaryCBox_CoordinateBenefitsNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO&nbsp;&nbsp;&nbsp;
						<strong>PAID&nbsp;MEDICARE&nbsp;DEDUCTIBLE:</strong>&nbsp;&nbsp;&nbsp;					
						<cfif trim(TertiaryCBox_PaidMedicareDeductibleYes) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;YES&nbsp;&nbsp;&nbsp;					
						<cfif trim(TertiaryCBox_PaidMedicareDeductibleNo) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;NO								
					</td>
				</tr>
					
				<cfset MedicareSupplementYes = "TertiaryCBox_MedicareSupplementYes">
				<cfset MedicareSupplementNo = "TertiaryCBox_MedicareSupplementNo">				
				<cfset CoordinateBenefitsYes = "TertiaryCBox_CoordinateBenefitsYes">
				<cfset CoordinateBenefitsNo = "TertiaryCBox_CoordinateBenefitsNo">			
				<cfset PaidMedicareDeductibleYes = "TertiaryCBox_PaidMedicareDeductibleYes">
				<cfset PaidMedicareDeductibleNo = "TertiaryCBox_PaidMedicareDeductibleNo">	
				<cfset VerificationTypeBasePlanTBox = "TertiaryVerificationTypeBasePlanTBox">									
				<tr>														   
					<td id="td_TertiaryVerificationTypeBasePlanTBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						&nbsp;<strong>MEDICAID&nbsp;PLAN:</strong>&nbsp;&nbsp;&nbsp;					
						<cfif trim(TertiaryCBox_VerificationMedicaidPlanMQMB) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;MQMB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;					
						<cfif trim(TertiaryCBox_VerificationMedicaidPlanQMB) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;QMB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;					
						<cfif trim(TertiaryCBox_VerificationMedicaidPlanTraditional) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;TRADITIONAL&nbsp;&nbsp;&nbsp;&nbsp;**&nbsp;TYPE&nbsp;OF&nbsp;BASE&nbsp;PLAN:&nbsp;#trim(evaluate(VerificationTypeBasePlanTBox))#
					</td>
				</tr>	
				
				<cfset VerificationMedicaidPlanMQMB = "TertiaryCBox_VerificationMedicaidPlanMQMB">
				<cfset VerificationMedicaidPlanQMB = "TertiaryCBox_VerificationMedicaidPlanQMB">
				<cfset VerificationMedicaidPlanTraditional = "TertiaryCBox_VerificationMedicaidPlanTraditional">				
				<tr>
		        	<td colspan="6" class="siteLabel">&nbsp;</td>
		       	</tr>	
			
			</table> 		
		
			
												
									
			</td>
		</tr>
		
		<tr>
		    <td align="center" colspan="7" class="siteLabel">&nbsp;</td>
		</tr>
								--->
								
	<!---****************************************************Tertiary Insurance Above*********************************************--->		
												
	



