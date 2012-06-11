<!---- appIntakeHardCopyPrint.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.fileDateTimeStamp" default="#DateFormat(NOW(), 'mmddyy')##TimeFormat(NOW(), 'hhmmss')#">
	<cfset fileDateTimeStamp = attributes.fileDateTimeStamp>
	
	<cfparam name="attributes.intakeID" default="">
	<cfset intakeID = attributes.intakeID>
	
	<cfif IsDefined("form.intakeID") AND form.intakeID NEQ "">
		<cfset intakeID = form.intakeID>
	<cfelseif IsDefined("url.intakeID") AND url.intakeID NEQ "">
		<cfset intakeID = url.intakeID>	
	</cfif>
	
	<cfset formname = "printCopy">

	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="intakeID"
		fieldnames="Intake ID"
		datatypes="numeric">
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- query for the intake                                                           --->
<!-------------------------------------------------------------------------------------->
	<cf_tagIntakeQuery>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Make all getIntake Query colums local.                                         --->
<!-------------------------------------------------------------------------------------->	
	<cfloop list="#getIntake.columnList#" index="i">
		<cfset column = "getIntake.#trim(i)#">		
		<cfset "#trim(i)#" = evaluate(column)>		
	</cfloop>	



<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
<cfsavecontent variable="ClaimPrintHardCopy">

	<cfoutput>
													
		<form name="printCopy" method="post">
								
			<table  border="0" cellpadding="0" cellspacing="0" align="center" width="750"> 								
				<tr><td align="center" colspan="7"><font color="c0c0c0" face="Arial" size="3"><strong>INTAKE&nbsp;ID:&nbsp;#trim(intakeID)#<cfif InactiveCode EQ 298>&nbsp;[PENDING]</cfif>&nbsp;&nbsp;<cfif NOT Active>STATUS: CANCELLED</cfif></strong></font></td></tr>	
				<tr><td align="center" colspan="7" class="siteLabel">&nbsp;</td></tr>
				<tr>
					
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
					<td nowrap class="siteLabel" align="center">DATE:<u>&nbsp;&nbsp;&nbsp;&nbsp;<cfif IsDate(DateCreated)>#DateFormat(DateCreated, 'mm/dd/yyyy')#<cfelse>#DateFormat(NOW(), 'mm/dd/yyyy')#</cfif>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
					<td nowrap class="siteLabel" align="center">TIME:<u>&nbsp;&nbsp;&nbsp;&nbsp;<cfif hidden_TimeStart NEQ "">#trim(hidden_TimeStart)#<cfelse>#TimeFormat(NOW(), 'hh:mm:ss tt')#</cfif>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
					<td nowrap class="siteLabel" align="center">EMPLOYEE:<u>&nbsp;&nbsp;&nbsp;&nbsp;#trim(empFName)#&nbsp;#trim(empLName)#&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
				</tr>				
				<tr>
					<td colspan="3" nowrap align="center" width="100%">
						<table align="center" cellspacing="0" cellpadding="4" border="0">
							<tr>
							    <td align="center" colspan="10" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">&nbsp;</td>
							</tr>							
							
							<tr>
							    <td bgcolor="DCE3EB" align="center" colspan="7" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
									<font face="Arial" size="2"><strong>DELIVERY&nbsp;METHOD</strong></font>			
								</td>
							</tr>		
								
							<tr>
							    <td id="td_delivery" align="center" colspan="7" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
									<cfif trim(OPTION_1_CBox_Delivery) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>DELIVERY</strong>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<cfif trim(OPTION_1_CBox_Pickup) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>PICKUP</strong>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<cfif trim(OPTION_1_CBox_Repair) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>REPAIR</strong>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<cfif trim(OPTION_1_CBox_Switch) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>SWITCH</strong>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<cfif trim(OPTION_1_CBox_Existing) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>EXISTING</strong>							
								</td>
							</tr>					
							<tr>
								<td id="td_otherTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(OPTION_2_CBox_Other) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>OTHER:</strong>&nbsp;#trim(otherTBox)#</td>
							    <td id="td_hospiceTBox" colspan="4" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;"><cfif trim(OPTION_2_CBox_Hospice) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>HOSPICE:</strong>&nbsp;#trim(hospiceTBox)#</td>
							</tr>
																						    
							<tr>
							   <td id="td_hospitalTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(OPTION_2_CBox_Hospital) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>FACILITY\HOSPITAL:</strong>&nbsp;#trim(hospitalTBox)#</td>
							    <td id="td_typeOfInsurance" colspan="4" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
									<cfif trim(OPTION_3_CBox_Medicare) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>MEDICARE</strong>&nbsp;&nbsp;
									<cfif trim(OPTION_3_CBox_PrivateInsurance) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>PRIVATE&nbsp;INSURANCE</strong>&nbsp;&nbsp;
									<cfif trim(OPTION_3_CBox_Medicaid) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>MEDICAID</strong>&nbsp;&nbsp;
									<cfif trim(OPTION_3_CBox_PrivatePay) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>PRIVATE&nbsp;PAY</strong>
								</td>
							</tr>
							<tr>							  		
								<td id="td_anticipatedDate" nowrap colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">&nbsp;<strong>DISCHARGE&nbsp;DATE:</strong>&nbsp;&nbsp;#trim(DischargeDateMM)#/#trim(DischargeDateDD)#/#trim(DischargeDateYY)#&nbsp;&nbsp;&nbsp;<strong>ROOM##:</strong>&nbsp;#trim(roomNumberTBox)#&nbsp;<strong>BED##:</strong>&nbsp;#trim(bedNumberTBox)#</td>
							    <td id="td_typeOfPay" colspan="4" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 1px solid; border-color: 000000;">
									<cfif typeOfPay_Radio EQ "Cash"><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>Cash</strong>&nbsp;&nbsp;
									<cfif typeOfPay_Radio EQ "Check"><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>Check</strong>&nbsp;&nbsp;
									<cfif typeOfPay_Radio EQ "CreditCard"><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>Credit Card</strong>&nbsp;&nbsp;
									<cfif typeOfPay_Radio EQ "BillAcct"><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>Bill To Account</strong>&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
							<tr>
							    <td align="center" colspan="7" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">&nbsp;</td>
							</tr>	
							
							
							<!---CUSTOMER INFORMATION--->
							<tr>
							    <td align="center" bgcolor="DCE3EB" colspan="7" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
									<font face="Arial" size="2"><strong>CUSTOMER&nbsp;INFORMATION</strong></font>
								</td>
							</tr>						
							<tr>														   
							    <td id="td_callerNameTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">
									&nbsp;<strong>CALLER&nbsp;FIRST:</strong>&nbsp;#trim(callerFNameTBox)#&nbsp;<strong>M:</strong>&nbsp;#trim(callerMInitialTBox)#&nbsp;<strong>LAST:</strong>&nbsp;&nbsp;#trim(callerLNameTBox)#
								</td>
							    <td id="td_callerPhoneTBox" colspan="4" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>CALLER&nbsp;PHONE:</strong>&nbsp;#request.formatPhoneUS(trim(callerPhoneTBox))#</td>
							</tr>								    
							<tr>
							    <td id="td_patientNameTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">
								&nbsp;<strong>PATIENT&nbsp;FIRST:</strong>&nbsp;#trim(patientFNameTBox)#&nbsp;<strong>M:</strong>&nbsp;#trim(patientMInitialTBox)#&nbsp;<strong>LAST:</strong>&nbsp;#trim(patientLNameTBox)#</td>
							    <td nowrap id="td_patientDOB" colspan="4" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
									&nbsp;<strong>DOB:</strong>&nbsp;&nbsp;#trim(patientDOBMM)#/#trim(patientDOBDD)#/#trim(patientDOBYY)#
								</td>
							</tr>
							<tr>							  		
								<td id="td_patientAddressTBox" colspan="7" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;PATIENT&nbsp;ADDRESS:&nbsp;#trim(patientAddressTBox)#</td>
							</tr>
							<tr>
							    <td id="td_patientCityTBox" colspan="1" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;<strong>CITY:</strong>&nbsp;#trim(patientCityTBox)#</td>
								
								
								<cfif IsNumeric(patientStateTBox)>
									<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" fields="itemNameDisplay" listid="4" standardlistitemid="#trim(patientStateTBox)#" active="1" returnvariable="getState">
									<cfset patientState = getState.itemNameDisplay>
								<cfelse>
									<cfset patientState = patientStateTBox>
								</cfif>
								
								<td id="td_patientStateTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>STATE:</strong>&nbsp;#trim(patientState)#</td>
								<td id="td_patientZipTBox" colspan="1" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>ZIP:</strong>&nbsp;#trim(patientZipTBox)#</td>
								<td id="td_patientPhoneTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>PHONE&nbsp;##:</strong>&nbsp;#request.formatPhoneUS(REQUEST.StringGlobalFooterD(trim(patientPhoneTBox), trim(request.datasource)))#</td>
							</tr>							
							<tr>							  		
								<td id="td_patientSSNTBox" colspan="1" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">
									&nbsp;<strong>SSN:</strong>&nbsp;#trim(patientSSNTBox)#
								</td>							
							    <td id="td_patientSex" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">
									<strong>SEX:</strong>&nbsp;&nbsp;<cfif OPTION_3a_CBox_PatientSex EQ 0><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>M</strong>&nbsp;&nbsp;<cfif OPTION_3a_CBox_PatientSex EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>F</strong>
								</td>
								<td id="td_patientHeight" colspan="1" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>HEIGHT:</strong>&nbsp;&nbsp;#trim(patientHeightInches)#&nbsp;in&nbsp;inches.&nbsp;</td>
								<td id="td_patientWeightTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>WEIGHT:</strong>&nbsp;#trim(patientWeightTBox)#&nbsp;lbs.</td>
							</tr>											
							<tr>							  		
								<td id="td_alternateContactNameTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">
									&nbsp;<strong>ALTERNATE&nbsp;CONTACT:</strong>#trim(alternateContactFNameTBox)#
									<strong>M:</strong>#trim(alternateContactMInitialTBox)#
									<strong>LAST:</strong>#trim(alternateContactLNameTBox)#
								</td>
							    <td id="td_alternateContactRelationshipTBox" colspan="1" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>RELATIONSHIP:</strong>&nbsp;#trim(alternateContactRelationshipTBox)#</td>
								<td nowrap id="td_alternateContactPhoneTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">
									<strong>H:</strong>&nbsp;#request.formatPhoneUS(trim(alternateContactPhoneTBox))#
									&nbsp;<strong>W:</strong>&nbsp;#request.formatPhoneUS(trim(alternateContactWorkPhoneTBox))#
								</td>
							</tr>	
							<tr>
					           	<td id="td_PO" colspan="1" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">&nbsp;<strong>PO&nbsp;##:</strong>&nbsp;#trim(poNumberTBox)#</td>
					           	<td id="td_CCType" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>CREDIT&nbsp;CARD&:</strong>&nbsp;#trim(creditCardTypeTBox)#</td>
					        	<td id="td_CCNum" colspan="1" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 2px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>CREDIT&nbsp;CARD&nbsp;##:</strong>&nbsp;#trim(creditCardNumberTBox)#</td>
					        	<td id="td_expireCCDate" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>EXP&nbsp;DATE:</strong>&nbsp;#trim(ccDateMM)#/#trim(ccDateDD)#/#trim(ccDateYY)#</td>
					       	</tr>	
															
							<tr>
							    <td align="center" colspan="7" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">&nbsp;</td>
							</tr>			
							
							
							<!---HCPC INFORMATION--->
							<tr>
							    <td bgcolor="DCE3EB" align="center" colspan="7" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">
									<table cellpadding="0" cellspacing="0" border="0" width="100%">
										<td colspan="2" align="center" class="siteLabel">
											<font face="Arial" size="2"><strong>HCPC&nbsp;Codes</strong></font>
										</td>										
									</table>									
								</td>
							</tr>
							<tr>
							    <td align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><font face="Arial" size="2"><strong>HCPC&nbsp;CODE</strong></font></td>
								<td align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><font face="Arial" size="2"><strong>QTY</strong></font></td>
								<td align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><font face="Arial" size="2"><strong>PRODUCT</strong></font></td>
								<td align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><font face="Arial" size="2"><strong>COST</strong></font></td>
								<td align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><font face="Arial" size="2"><strong>DX&nbsp;(Code)</strong></font></td>
								<td align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><font face="Arial" size="2"><strong>Diagnosis</strong></font></td>
								<td align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><font face="Arial" size="2"><strong>Length&nbsp;Of&nbsp;Need</strong></font></td>
							</tr>							
							
							<tr id="tr_hcpc1">
							<td id="td_hcpcCode1TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode1TBox) NEQ "">#trim(hcpcCode1TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty1TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty1TBox) NEQ "">#trim(hcpcQty1TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct1TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct1TBox) NEQ "">#trim(hcpcProduct1TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost1TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost1TBox) NEQ "">#trim(hcpcCost1TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX1TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX1TBox) NEQ "">#trim(hcpcDX1TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis1TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis1TBox) NEQ "">#trim(hcpcDiagnosis1TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed1TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear1TBox)# <cfif trim(hcpcLengthOfNeedYear1TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth1TBox)# <cfif trim(hcpcLengthOfNeedMonth1TBox) NEQ "">m</cfif></td>
							</tr>
							<tr id="tr_hcpc2">
							<td id="td_hcpcCode2TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode2TBox) NEQ "">#trim(hcpcCode2TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty2TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty2TBox) NEQ "">#trim(hcpcQty2TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct2TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct2TBox) NEQ "">#trim(hcpcProduct2TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost2TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost2TBox) NEQ "">#trim(hcpcCost2TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX2TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX2TBox) NEQ "">#trim(hcpcDX2TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis2TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis2TBox) NEQ "">#trim(hcpcDiagnosis2TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed2TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear2TBox)# <cfif trim(hcpcLengthOfNeedYear2TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth2TBox)# <cfif trim(hcpcLengthOfNeedMonth2TBox) NEQ "">m</cfif></td>
							</tr>
							<tr id="tr_hcpc3">
							<td id="td_hcpcCode3TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode3TBox) NEQ "">#trim(hcpcCode3TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty3TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty3TBox) NEQ "">#trim(hcpcQty3TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct3TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct3TBox) NEQ "">#trim(hcpcProduct3TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost3TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost3TBox) NEQ "">#trim(hcpcCost3TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX3TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX3TBox) NEQ "">#trim(hcpcDX3TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis3TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis3TBox) NEQ "">#trim(hcpcDiagnosis3TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed3TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear3TBox)# <cfif trim(hcpcLengthOfNeedYear3TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth3TBox)# <cfif trim(hcpcLengthOfNeedMonth3TBox) NEQ "">m</cfif></td>
							</tr>
							<tr id="tr_hcpc4">
							<td id="td_hcpcCode4TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode4TBox) NEQ "">#trim(hcpcCode4TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty4TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty4TBox) NEQ "">#trim(hcpcQty4TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct4TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct4TBox) NEQ "">#trim(hcpcProduct4TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost4TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost4TBox) NEQ "">#trim(hcpcCost4TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX4TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX4TBox) NEQ "">#trim(hcpcDX4TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis4TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis4TBox) NEQ "">#trim(hcpcDiagnosis4TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed4TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear4TBox)# <cfif trim(hcpcLengthOfNeedYear4TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth4TBox)# <cfif trim(hcpcLengthOfNeedMonth4TBox) NEQ "">m</cfif></td>
							</tr>
							<tr id="tr_hcpc5">
							<td id="td_hcpcCode5TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode5TBox) NEQ "">#trim(hcpcCode5TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty5TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty5TBox) NEQ "">#trim(hcpcQty5TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct5TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct5TBox) NEQ "">#trim(hcpcProduct5TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost5TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost5TBox) NEQ "">#trim(hcpcCost5TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX5TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX5TBox) NEQ "">#trim(hcpcDX5TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis5TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis5TBox) NEQ "">#trim(hcpcDiagnosis5TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed5TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear5TBox)# <cfif trim(hcpcLengthOfNeedYear5TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth5TBox)# <cfif trim(hcpcLengthOfNeedMonth5TBox) NEQ "">m</cfif></td>
							</tr>
							<cfif trim(hcpcCode6TBox) NEQ "" OR trim(hcpcQty6TBox) NEQ "" OR trim(hcpcProduct6TBox) NEQ "" OR trim(hcpcCost6TBox) NEQ "" OR trim(hcpcDX6TBox) NEQ "" OR trim(hcpcDiagnosis6TBox) NEQ "">
							<tr id="tr_hcpc6">
							<td id="td_hcpcCode6TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode6TBox) NEQ "">#trim(hcpcCode6TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty6TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty6TBox) NEQ "">#trim(hcpcQty6TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct6TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct6TBox) NEQ "">#trim(hcpcProduct6TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost6TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost6TBox) NEQ "">#trim(hcpcCost6TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX6TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX6TBox) NEQ "">#trim(hcpcDX6TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis6TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis6TBox) NEQ "">#trim(hcpcDiagnosis6TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed6TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear6TBox)# <cfif trim(hcpcLengthOfNeedYear6TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth6TBox)# <cfif trim(hcpcLengthOfNeedMonth6TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode7TBox) NEQ "" OR trim(hcpcQty7TBox) NEQ "" OR trim(hcpcProduct7TBox) NEQ "" OR trim(hcpcCost7TBox) NEQ "" OR trim(hcpcDX7TBox) NEQ "" OR trim(hcpcDiagnosis7TBox) NEQ "">
							<tr id="tr_hcpc7">
							<td id="td_hcpcCode7TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode7TBox) NEQ "">#trim(hcpcCode7TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty7TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty7TBox) NEQ "">#trim(hcpcQty7TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct7TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct7TBox) NEQ "">#trim(hcpcProduct7TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost7TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost7TBox) NEQ "">#trim(hcpcCost7TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX7TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX7TBox) NEQ "">#trim(hcpcDX7TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis7TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis7TBox) NEQ "">#trim(hcpcDiagnosis7TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed7TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear7TBox)# <cfif trim(hcpcLengthOfNeedYear7TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth7TBox)# <cfif trim(hcpcLengthOfNeedMonth7TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode8TBox) NEQ "" OR trim(hcpcQty8TBox) NEQ "" OR trim(hcpcProduct8TBox) NEQ "" OR trim(hcpcCost8TBox) NEQ "" OR trim(hcpcDX8TBox) NEQ "" OR trim(hcpcDiagnosis8TBox) NEQ "">
							<tr id="tr_hcpc8">
							<td id="td_hcpcCode8TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode8TBox) NEQ "">#trim(hcpcCode8TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty8TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty8TBox) NEQ "">#trim(hcpcQty8TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct8TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct8TBox) NEQ "">#trim(hcpcProduct8TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost8TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost8TBox) NEQ "">#trim(hcpcCost8TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX8TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX8TBox) NEQ "">#trim(hcpcDX8TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis8TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis8TBox) NEQ "">#trim(hcpcDiagnosis8TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed8TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear8TBox)# <cfif trim(hcpcLengthOfNeedYear8TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth8TBox)# <cfif trim(hcpcLengthOfNeedMonth8TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode9TBox) NEQ "" OR trim(hcpcQty9TBox) NEQ "" OR trim(hcpcProduct9TBox) NEQ "" OR trim(hcpcCost9TBox) NEQ "" OR trim(hcpcDX9TBox) NEQ "" OR trim(hcpcDiagnosis9TBox) NEQ "">
							<tr id="tr_hcpc9">
							<td id="td_hcpcCode9TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode9TBox) NEQ "">#trim(hcpcCode9TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty9TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty9TBox) NEQ "">#trim(hcpcQty9TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct9TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct9TBox) NEQ "">#trim(hcpcProduct9TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost9TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost9TBox) NEQ "">#trim(hcpcCost9TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX9TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX9TBox) NEQ "">#trim(hcpcDX9TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis9TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis9TBox) NEQ "">#trim(hcpcDiagnosis9TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed9TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear9TBox)# <cfif trim(hcpcLengthOfNeedYear9TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth9TBox)# <cfif trim(hcpcLengthOfNeedMonth9TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode10TBox) NEQ "" OR trim(hcpcQty10TBox) NEQ "" OR trim(hcpcProduct10TBox) NEQ "" OR trim(hcpcCost10TBox) NEQ "" OR trim(hcpcDX10TBox) NEQ "" OR trim(hcpcDiagnosis10TBox) NEQ "">
							<tr id="tr_hcpc10">
							<td id="td_hcpcCode10TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode10TBox) NEQ "">#trim(hcpcCode10TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty10TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty10TBox) NEQ "">#trim(hcpcQty10TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct10TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct10TBox) NEQ "">#trim(hcpcProduct10TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost10TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost10TBox) NEQ "">#trim(hcpcCost10TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX10TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX10TBox) NEQ "">#trim(hcpcDX10TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis10TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis10TBox) NEQ "">#trim(hcpcDiagnosis10TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed10TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear10TBox)# <cfif trim(hcpcLengthOfNeedYear10TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth10TBox)# <cfif trim(hcpcLengthOfNeedMonth10TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode11TBox) NEQ "" OR trim(hcpcQty11TBox) NEQ "" OR trim(hcpcProduct11TBox) NEQ "" OR trim(hcpcCost11TBox) NEQ "" OR trim(hcpcDX11TBox) NEQ "" OR trim(hcpcDiagnosis11TBox) NEQ "">
							<tr id="tr_hcpc11">
							<td id="td_hcpcCode11TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode11TBox) NEQ "">#trim(hcpcCode11TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty11TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty11TBox) NEQ "">#trim(hcpcQty11TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct11TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct11TBox) NEQ "">#trim(hcpcProduct11TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost11TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost11TBox) NEQ "">#trim(hcpcCost11TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX11TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX11TBox) NEQ "">#trim(hcpcDX11TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis11TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis11TBox) NEQ "">#trim(hcpcDiagnosis11TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed11TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear11TBox)# <cfif trim(hcpcLengthOfNeedYear11TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth11TBox)# <cfif trim(hcpcLengthOfNeedMonth11TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode12TBox) NEQ "" OR trim(hcpcQty12TBox) NEQ "" OR trim(hcpcProduct12TBox) NEQ "" OR trim(hcpcCost12TBox) NEQ "" OR trim(hcpcDX12TBox) NEQ "" OR trim(hcpcDiagnosis12TBox) NEQ "">
							<tr id="tr_hcpc12">
							<td id="td_hcpcCode12TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode12TBox) NEQ "">#trim(hcpcCode12TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty12TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty12TBox) NEQ "">#trim(hcpcQty12TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct12TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct12TBox) NEQ "">#trim(hcpcProduct12TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost12TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost12TBox) NEQ "">#trim(hcpcCost12TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX12TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX12TBox) NEQ "">#trim(hcpcDX12TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis12TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis12TBox) NEQ "">#trim(hcpcDiagnosis12TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed12TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear12TBox)# <cfif trim(hcpcLengthOfNeedYear12TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth12TBox)# <cfif trim(hcpcLengthOfNeedMonth12TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode13TBox) NEQ "" OR trim(hcpcQty13TBox) NEQ "" OR trim(hcpcProduct13TBox) NEQ "" OR trim(hcpcCost13TBox) NEQ "" OR trim(hcpcDX13TBox) NEQ "" OR trim(hcpcDiagnosis13TBox) NEQ "">
							<tr id="tr_hcpc13">
							<td id="td_hcpcCode13TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode13TBox) NEQ "">#trim(hcpcCode13TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty13TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty13TBox) NEQ "">#trim(hcpcQty13TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct13TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct13TBox) NEQ "">#trim(hcpcProduct13TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost13TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost13TBox) NEQ "">#trim(hcpcCost13TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX13TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX13TBox) NEQ "">#trim(hcpcDX13TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis13TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis13TBox) NEQ "">#trim(hcpcDiagnosis13TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed13TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear13TBox)# <cfif trim(hcpcLengthOfNeedYear13TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth13TBox)# <cfif trim(hcpcLengthOfNeedMonth13TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode14TBox) NEQ "" OR trim(hcpcQty14TBox) NEQ "" OR trim(hcpcProduct14TBox) NEQ "" OR trim(hcpcCost14TBox) NEQ "" OR trim(hcpcDX14TBox) NEQ "" OR trim(hcpcDiagnosis14TBox) NEQ "">
							<tr id="tr_hcpc14">
							<td id="td_hcpcCode14TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode14TBox) NEQ "">#trim(hcpcCode14TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty14TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty14TBox) NEQ "">#trim(hcpcQty14TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct14TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct14TBox) NEQ "">#trim(hcpcProduct14TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost14TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost14TBox) NEQ "">#trim(hcpcCost14TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX14TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX14TBox) NEQ "">#trim(hcpcDX14TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis14TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis14TBox) NEQ "">#trim(hcpcDiagnosis14TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed14TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear14TBox)# <cfif trim(hcpcLengthOfNeedYear14TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth14TBox)# <cfif trim(hcpcLengthOfNeedMonth14TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode15TBox) NEQ "" OR trim(hcpcQty15TBox) NEQ "" OR trim(hcpcProduct15TBox) NEQ "" OR trim(hcpcCost15TBox) NEQ "" OR trim(hcpcDX15TBox) NEQ "" OR trim(hcpcDiagnosis15TBox) NEQ "">
							<tr id="tr_hcpc15">
							<td id="td_hcpcCode15TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode15TBox) NEQ "">#trim(hcpcCode15TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty15TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty15TBox) NEQ "">#trim(hcpcQty15TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct15TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct15TBox) NEQ "">#trim(hcpcProduct15TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost15TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost15TBox) NEQ "">#trim(hcpcCost15TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX15TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX15TBox) NEQ "">#trim(hcpcDX15TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis15TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis15TBox) NEQ "">#trim(hcpcDiagnosis15TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed15TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear15TBox)# <cfif trim(hcpcLengthOfNeedYear15TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth15TBox)# <cfif trim(hcpcLengthOfNeedMonth15TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode16TBox) NEQ "" OR trim(hcpcQty16TBox) NEQ "" OR trim(hcpcProduct16TBox) NEQ "" OR trim(hcpcCost16TBox) NEQ "" OR trim(hcpcDX16TBox) NEQ "" OR trim(hcpcDiagnosis16TBox) NEQ "">
							<tr id="tr_hcpc16">
							<td id="td_hcpcCode16TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode16TBox) NEQ "">#trim(hcpcCode16TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty16TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty16TBox) NEQ "">#trim(hcpcQty16TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct16TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct16TBox) NEQ "">#trim(hcpcProduct16TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost16TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost16TBox) NEQ "">#trim(hcpcCost16TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX16TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX16TBox) NEQ "">#trim(hcpcDX16TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis16TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis16TBox) NEQ "">#trim(hcpcDiagnosis16TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed16TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear16TBox)# <cfif trim(hcpcLengthOfNeedYear16TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth16TBox)# <cfif trim(hcpcLengthOfNeedMonth16TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode17TBox) NEQ "" OR trim(hcpcQty17TBox) NEQ "" OR trim(hcpcProduct17TBox) NEQ "" OR trim(hcpcCost17TBox) NEQ "" OR trim(hcpcDX17TBox) NEQ "" OR trim(hcpcDiagnosis17TBox) NEQ "">
							<tr id="tr_hcpc17">
							<td id="td_hcpcCode17TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode17TBox) NEQ "">#trim(hcpcCode17TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty17TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty17TBox) NEQ "">#trim(hcpcQty17TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct17TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct17TBox) NEQ "">#trim(hcpcProduct17TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost17TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost17TBox) NEQ "">#trim(hcpcCost17TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX17TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX17TBox) NEQ "">#trim(hcpcDX17TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis17TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis17TBox) NEQ "">#trim(hcpcDiagnosis17TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed17TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear17TBox)# <cfif trim(hcpcLengthOfNeedYear17TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth17TBox)# <cfif trim(hcpcLengthOfNeedMonth17TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode18TBox) NEQ "" OR trim(hcpcQty18TBox) NEQ "" OR trim(hcpcProduct18TBox) NEQ "" OR trim(hcpcCost18TBox) NEQ "" OR trim(hcpcDX18TBox) NEQ "" OR trim(hcpcDiagnosis18TBox) NEQ "">
							<tr id="tr_hcpc18">
							<td id="td_hcpcCode18TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode18TBox) NEQ "">#trim(hcpcCode18TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty18TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty18TBox) NEQ "">#trim(hcpcQty18TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct18TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct18TBox) NEQ "">#trim(hcpcProduct18TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost18TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost18TBox) NEQ "">#trim(hcpcCost18TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX18TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX18TBox) NEQ "">#trim(hcpcDX18TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis18TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis18TBox) NEQ "">#trim(hcpcDiagnosis18TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed18TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear18TBox)# <cfif trim(hcpcLengthOfNeedYear18TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth18TBox)# <cfif trim(hcpcLengthOfNeedMonth18TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode19TBox) NEQ "" OR trim(hcpcQty19TBox) NEQ "" OR trim(hcpcProduct19TBox) NEQ "" OR trim(hcpcCost19TBox) NEQ "" OR trim(hcpcDX19TBox) NEQ "" OR trim(hcpcDiagnosis19TBox) NEQ "">
							<tr id="tr_hcpc19">
							<td id="td_hcpcCode19TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode19TBox) NEQ "">#trim(hcpcCode19TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty19TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty19TBox) NEQ "">#trim(hcpcQty19TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct19TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct19TBox) NEQ "">#trim(hcpcProduct19TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost19TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost19TBox) NEQ "">#trim(hcpcCost19TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX19TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX19TBox) NEQ "">#trim(hcpcDX19TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis19TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis19TBox) NEQ "">#trim(hcpcDiagnosis19TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed19TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear19TBox)# <cfif trim(hcpcLengthOfNeedYear19TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth19TBox)# <cfif trim(hcpcLengthOfNeedMonth19TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode20TBox) NEQ "" OR trim(hcpcQty20TBox) NEQ "" OR trim(hcpcProduct20TBox) NEQ "" OR trim(hcpcCost20TBox) NEQ "" OR trim(hcpcDX20TBox) NEQ "" OR trim(hcpcDiagnosis20TBox) NEQ "">
							<tr id="tr_hcpc20">
							<td id="td_hcpcCode20TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode20TBox) NEQ "">#trim(hcpcCode20TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty20TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty20TBox) NEQ "">#trim(hcpcQty20TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct20TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct20TBox) NEQ "">#trim(hcpcProduct20TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost20TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost20TBox) NEQ "">#trim(hcpcCost20TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX20TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX20TBox) NEQ "">#trim(hcpcDX20TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis20TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis20TBox) NEQ "">#trim(hcpcDiagnosis20TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed20TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear20TBox)# <cfif trim(hcpcLengthOfNeedYear20TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth20TBox)# <cfif trim(hcpcLengthOfNeedMonth20TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode21TBox) NEQ "" OR trim(hcpcQty21TBox) NEQ "" OR trim(hcpcProduct21TBox) NEQ "" OR trim(hcpcCost21TBox) NEQ "" OR trim(hcpcDX21TBox) NEQ "" OR trim(hcpcDiagnosis21TBox) NEQ "">
							<tr id="tr_hcpc21">
							<td id="td_hcpcCode21TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode21TBox) NEQ "">#trim(hcpcCode21TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty21TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty21TBox) NEQ "">#trim(hcpcQty21TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct21TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct21TBox) NEQ "">#trim(hcpcProduct21TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost21TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost21TBox) NEQ "">#trim(hcpcCost21TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX21TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX21TBox) NEQ "">#trim(hcpcDX21TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis21TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis21TBox) NEQ "">#trim(hcpcDiagnosis21TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed21TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear21TBox)# <cfif trim(hcpcLengthOfNeedYear21TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth21TBox)# <cfif trim(hcpcLengthOfNeedMonth21TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode22TBox) NEQ "" OR trim(hcpcQty22TBox) NEQ "" OR trim(hcpcProduct22TBox) NEQ "" OR trim(hcpcCost22TBox) NEQ "" OR trim(hcpcDX22TBox) NEQ "" OR trim(hcpcDiagnosis22TBox) NEQ "">
							<tr id="tr_hcpc22">
							<td id="td_hcpcCode22TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode22TBox) NEQ "">#trim(hcpcCode22TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty22TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty22TBox) NEQ "">#trim(hcpcQty22TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct22TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct22TBox) NEQ "">#trim(hcpcProduct22TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost22TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost22TBox) NEQ "">#trim(hcpcCost22TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX22TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX22TBox) NEQ "">#trim(hcpcDX22TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis22TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis22TBox) NEQ "">#trim(hcpcDiagnosis22TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed22TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear22TBox)# <cfif trim(hcpcLengthOfNeedYear22TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth22TBox)# <cfif trim(hcpcLengthOfNeedMonth22TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode23TBox) NEQ "" OR trim(hcpcQty23TBox) NEQ "" OR trim(hcpcProduct23TBox) NEQ "" OR trim(hcpcCost23TBox) NEQ "" OR trim(hcpcDX23TBox) NEQ "" OR trim(hcpcDiagnosis23TBox) NEQ "">
							<tr id="tr_hcpc23">
							<td id="td_hcpcCode23TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode23TBox) NEQ "">#trim(hcpcCode23TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty23TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty23TBox) NEQ "">#trim(hcpcQty23TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct23TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct23TBox) NEQ "">#trim(hcpcProduct23TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost23TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost23TBox) NEQ "">#trim(hcpcCost23TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX23TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX23TBox) NEQ "">#trim(hcpcDX23TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis23TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis23TBox) NEQ "">#trim(hcpcDiagnosis23TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed23TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear23TBox)# <cfif trim(hcpcLengthOfNeedYear23TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth23TBox)# <cfif trim(hcpcLengthOfNeedMonth23TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode24TBox) NEQ "" OR trim(hcpcQty24TBox) NEQ "" OR trim(hcpcProduct24TBox) NEQ "" OR trim(hcpcCost24TBox) NEQ "" OR trim(hcpcDX24TBox) NEQ "" OR trim(hcpcDiagnosis24TBox) NEQ "">
							<tr id="tr_hcpc24">
							<td id="td_hcpcCode24TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode24TBox) NEQ "">#trim(hcpcCode24TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty24TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty24TBox) NEQ "">#trim(hcpcQty24TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct24TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct24TBox) NEQ "">#trim(hcpcProduct24TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost24TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost24TBox) NEQ "">#trim(hcpcCost24TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX24TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX24TBox) NEQ "">#trim(hcpcDX24TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis24TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis24TBox) NEQ "">#trim(hcpcDiagnosis24TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed24TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear24TBox)# <cfif trim(hcpcLengthOfNeedYear24TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth24TBox)# <cfif trim(hcpcLengthOfNeedMonth24TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode25TBox) NEQ "" OR trim(hcpcQty25TBox) NEQ "" OR trim(hcpcProduct25TBox) NEQ "" OR trim(hcpcCost25TBox) NEQ "" OR trim(hcpcDX25TBox) NEQ "" OR trim(hcpcDiagnosis25TBox) NEQ "">
							<tr id="tr_hcpc25">
							<td id="td_hcpcCode25TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode25TBox) NEQ "">#trim(hcpcCode25TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty25TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty25TBox) NEQ "">#trim(hcpcQty25TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct25TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct25TBox) NEQ "">#trim(hcpcProduct25TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost25TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost25TBox) NEQ "">#trim(hcpcCost25TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX25TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX25TBox) NEQ "">#trim(hcpcDX25TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis25TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis25TBox) NEQ "">#trim(hcpcDiagnosis25TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed25TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear25TBox)# <cfif trim(hcpcLengthOfNeedYear25TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth25TBox)# <cfif trim(hcpcLengthOfNeedMonth25TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode26TBox) NEQ "" OR trim(hcpcQty26TBox) NEQ "" OR trim(hcpcProduct26TBox) NEQ "" OR trim(hcpcCost26TBox) NEQ "" OR trim(hcpcDX26TBox) NEQ "" OR trim(hcpcDiagnosis26TBox) NEQ "">
							<tr id="tr_hcpc26">
							<td id="td_hcpcCode26TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode26TBox) NEQ "">#trim(hcpcCode26TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty26TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty26TBox) NEQ "">#trim(hcpcQty26TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct26TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct26TBox) NEQ "">#trim(hcpcProduct26TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost26TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost26TBox) NEQ "">#trim(hcpcCost26TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX26TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX26TBox) NEQ "">#trim(hcpcDX26TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis26TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis26TBox) NEQ "">#trim(hcpcDiagnosis26TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed26TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear26TBox)# <cfif trim(hcpcLengthOfNeedYear26TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth26TBox)# <cfif trim(hcpcLengthOfNeedMonth26TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode27TBox) NEQ "" OR trim(hcpcQty27TBox) NEQ "" OR trim(hcpcProduct27TBox) NEQ "" OR trim(hcpcCost27TBox) NEQ "" OR trim(hcpcDX27TBox) NEQ "" OR trim(hcpcDiagnosis27TBox) NEQ "">
							<tr id="tr_hcpc27">
							<td id="td_hcpcCode27TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode27TBox) NEQ "">#trim(hcpcCode27TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty27TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty27TBox) NEQ "">#trim(hcpcQty27TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct27TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct27TBox) NEQ "">#trim(hcpcProduct27TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost27TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost27TBox) NEQ "">#trim(hcpcCost27TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX27TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX27TBox) NEQ "">#trim(hcpcDX27TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis27TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis27TBox) NEQ "">#trim(hcpcDiagnosis27TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed27TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear27TBox)# <cfif trim(hcpcLengthOfNeedYear27TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth27TBox)# <cfif trim(hcpcLengthOfNeedMonth27TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode28TBox) NEQ "" OR trim(hcpcQty28TBox) NEQ "" OR trim(hcpcProduct28TBox) NEQ "" OR trim(hcpcCost28TBox) NEQ "" OR trim(hcpcDX28TBox) NEQ "" OR trim(hcpcDiagnosis28TBox) NEQ "">
							<tr id="tr_hcpc28">
							<td id="td_hcpcCode28TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode28TBox) NEQ "">#trim(hcpcCode28TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty28TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty28TBox) NEQ "">#trim(hcpcQty28TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct28TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct28TBox) NEQ "">#trim(hcpcProduct28TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost28TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost28TBox) NEQ "">#trim(hcpcCost28TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX28TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX28TBox) NEQ "">#trim(hcpcDX28TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis28TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis28TBox) NEQ "">#trim(hcpcDiagnosis28TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed28TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear28TBox)# <cfif trim(hcpcLengthOfNeedYear28TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth28TBox)# <cfif trim(hcpcLengthOfNeedMonth28TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode29TBox) NEQ "" OR trim(hcpcQty29TBox) NEQ "" OR trim(hcpcProduct29TBox) NEQ "" OR trim(hcpcCost29TBox) NEQ "" OR trim(hcpcDX29TBox) NEQ "" OR trim(hcpcDiagnosis29TBox) NEQ "">
							<tr id="tr_hcpc29">
							<td id="td_hcpcCode29TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode29TBox) NEQ "">#trim(hcpcCode29TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty29TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty29TBox) NEQ "">#trim(hcpcQty29TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct29TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct29TBox) NEQ "">#trim(hcpcProduct29TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost29TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost29TBox) NEQ "">#trim(hcpcCost29TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX29TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX29TBox) NEQ "">#trim(hcpcDX29TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis29TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis29TBox) NEQ "">#trim(hcpcDiagnosis29TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed29TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear29TBox)# <cfif trim(hcpcLengthOfNeedYear29TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth29TBox)# <cfif trim(hcpcLengthOfNeedMonth29TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode30TBox) NEQ "" OR trim(hcpcQty30TBox) NEQ "" OR trim(hcpcProduct30TBox) NEQ "" OR trim(hcpcCost30TBox) NEQ "" OR trim(hcpcDX30TBox) NEQ "" OR trim(hcpcDiagnosis30TBox) NEQ "">
							<tr id="tr_hcpc30">
							<td id="td_hcpcCode30TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode30TBox) NEQ "">#trim(hcpcCode30TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty30TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty30TBox) NEQ "">#trim(hcpcQty30TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct30TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct30TBox) NEQ "">#trim(hcpcProduct30TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost30TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost30TBox) NEQ "">#trim(hcpcCost30TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX30TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX30TBox) NEQ "">#trim(hcpcDX30TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis30TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis30TBox) NEQ "">#trim(hcpcDiagnosis30TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed30TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear30TBox)# <cfif trim(hcpcLengthOfNeedYear30TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth30TBox)# <cfif trim(hcpcLengthOfNeedMonth30TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode31TBox) NEQ "" OR trim(hcpcQty31TBox) NEQ "" OR trim(hcpcProduct31TBox) NEQ "" OR trim(hcpcCost31TBox) NEQ "" OR trim(hcpcDX31TBox) NEQ "" OR trim(hcpcDiagnosis31TBox) NEQ "">
							<tr id="tr_hcpc31">
							<td id="td_hcpcCode31TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode31TBox) NEQ "">#trim(hcpcCode31TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty31TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty31TBox) NEQ "">#trim(hcpcQty31TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct31TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct31TBox) NEQ "">#trim(hcpcProduct31TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost31TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost31TBox) NEQ "">#trim(hcpcCost31TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX31TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX31TBox) NEQ "">#trim(hcpcDX31TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis31TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis31TBox) NEQ "">#trim(hcpcDiagnosis31TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed31TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear31TBox)# <cfif trim(hcpcLengthOfNeedYear31TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth31TBox)# <cfif trim(hcpcLengthOfNeedMonth31TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode32TBox) NEQ "" OR trim(hcpcQty32TBox) NEQ "" OR trim(hcpcProduct32TBox) NEQ "" OR trim(hcpcCost32TBox) NEQ "" OR trim(hcpcDX32TBox) NEQ "" OR trim(hcpcDiagnosis32TBox) NEQ "">
							<tr id="tr_hcpc32">
							<td id="td_hcpcCode32TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode32TBox) NEQ "">#trim(hcpcCode32TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty32TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty32TBox) NEQ "">#trim(hcpcQty32TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct32TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct32TBox) NEQ "">#trim(hcpcProduct32TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost32TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost32TBox) NEQ "">#trim(hcpcCost32TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX32TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX32TBox) NEQ "">#trim(hcpcDX32TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis32TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis32TBox) NEQ "">#trim(hcpcDiagnosis32TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed32TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear32TBox)# <cfif trim(hcpcLengthOfNeedYear32TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth32TBox)# <cfif trim(hcpcLengthOfNeedMonth32TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode33TBox) NEQ "" OR trim(hcpcQty33TBox) NEQ "" OR trim(hcpcProduct33TBox) NEQ "" OR trim(hcpcCost33TBox) NEQ "" OR trim(hcpcDX33TBox) NEQ "" OR trim(hcpcDiagnosis33TBox) NEQ "">
							<tr id="tr_hcpc33">
							<td id="td_hcpcCode33TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode33TBox) NEQ "">#trim(hcpcCode33TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty33TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty33TBox) NEQ "">#trim(hcpcQty33TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct33TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct33TBox) NEQ "">#trim(hcpcProduct33TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost33TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost33TBox) NEQ "">#trim(hcpcCost33TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX33TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX33TBox) NEQ "">#trim(hcpcDX33TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis33TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis33TBox) NEQ "">#trim(hcpcDiagnosis33TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed33TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear33TBox)# <cfif trim(hcpcLengthOfNeedYear33TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth33TBox)# <cfif trim(hcpcLengthOfNeedMonth33TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode34TBox) NEQ "" OR trim(hcpcQty34TBox) NEQ "" OR trim(hcpcProduct34TBox) NEQ "" OR trim(hcpcCost34TBox) NEQ "" OR trim(hcpcDX34TBox) NEQ "" OR trim(hcpcDiagnosis34TBox) NEQ "">
							<tr id="tr_hcpc34">
							<td id="td_hcpcCode34TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode34TBox) NEQ "">#trim(hcpcCode34TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty34TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty34TBox) NEQ "">#trim(hcpcQty34TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct34TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct34TBox) NEQ "">#trim(hcpcProduct34TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost34TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost34TBox) NEQ "">#trim(hcpcCost34TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX34TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX34TBox) NEQ "">#trim(hcpcDX34TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis34TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis34TBox) NEQ "">#trim(hcpcDiagnosis34TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed34TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear34TBox)# <cfif trim(hcpcLengthOfNeedYear34TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth34TBox)# <cfif trim(hcpcLengthOfNeedMonth34TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode35TBox) NEQ "" OR trim(hcpcQty35TBox) NEQ "" OR trim(hcpcProduct35TBox) NEQ "" OR trim(hcpcCost35TBox) NEQ "" OR trim(hcpcDX35TBox) NEQ "" OR trim(hcpcDiagnosis35TBox) NEQ "">
							<tr id="tr_hcpc35">
							<td id="td_hcpcCode35TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode35TBox) NEQ "">#trim(hcpcCode35TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty35TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty35TBox) NEQ "">#trim(hcpcQty35TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct35TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct35TBox) NEQ "">#trim(hcpcProduct35TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost35TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost35TBox) NEQ "">#trim(hcpcCost35TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX35TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX35TBox) NEQ "">#trim(hcpcDX35TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis35TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis35TBox) NEQ "">#trim(hcpcDiagnosis35TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed35TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear35TBox)# <cfif trim(hcpcLengthOfNeedYear35TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth35TBox)# <cfif trim(hcpcLengthOfNeedMonth35TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode36TBox) NEQ "" OR trim(hcpcQty36TBox) NEQ "" OR trim(hcpcProduct36TBox) NEQ "" OR trim(hcpcCost36TBox) NEQ "" OR trim(hcpcDX36TBox) NEQ "" OR trim(hcpcDiagnosis36TBox) NEQ "">
							<tr id="tr_hcpc36">
							<td id="td_hcpcCode36TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode36TBox) NEQ "">#trim(hcpcCode36TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty36TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty36TBox) NEQ "">#trim(hcpcQty36TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct36TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct36TBox) NEQ "">#trim(hcpcProduct36TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost36TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost36TBox) NEQ "">#trim(hcpcCost36TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX36TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX36TBox) NEQ "">#trim(hcpcDX36TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis36TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis36TBox) NEQ "">#trim(hcpcDiagnosis36TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed36TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear36TBox)# <cfif trim(hcpcLengthOfNeedYear36TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth36TBox)# <cfif trim(hcpcLengthOfNeedMonth36TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode37TBox) NEQ "" OR trim(hcpcQty37TBox) NEQ "" OR trim(hcpcProduct37TBox) NEQ "" OR trim(hcpcCost37TBox) NEQ "" OR trim(hcpcDX37TBox) NEQ "" OR trim(hcpcDiagnosis37TBox) NEQ "">
							<tr id="tr_hcpc37">
							<td id="td_hcpcCode37TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode37TBox) NEQ "">#trim(hcpcCode37TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty37TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty37TBox) NEQ "">#trim(hcpcQty37TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct37TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct37TBox) NEQ "">#trim(hcpcProduct37TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost37TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost37TBox) NEQ "">#trim(hcpcCost37TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX37TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX37TBox) NEQ "">#trim(hcpcDX37TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis37TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis37TBox) NEQ "">#trim(hcpcDiagnosis37TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed37TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear37TBox)# <cfif trim(hcpcLengthOfNeedYear37TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth37TBox)# <cfif trim(hcpcLengthOfNeedMonth37TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode38TBox) NEQ "" OR trim(hcpcQty38TBox) NEQ "" OR trim(hcpcProduct38TBox) NEQ "" OR trim(hcpcCost38TBox) NEQ "" OR trim(hcpcDX38TBox) NEQ "" OR trim(hcpcDiagnosis38TBox) NEQ "">
							<tr id="tr_hcpc38">
							<td id="td_hcpcCode38TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode38TBox) NEQ "">#trim(hcpcCode38TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty38TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty38TBox) NEQ "">#trim(hcpcQty38TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct38TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct38TBox) NEQ "">#trim(hcpcProduct38TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost38TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost38TBox) NEQ "">#trim(hcpcCost38TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX38TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX38TBox) NEQ "">#trim(hcpcDX38TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis38TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis38TBox) NEQ "">#trim(hcpcDiagnosis38TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed38TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear38TBox)# <cfif trim(hcpcLengthOfNeedYear38TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth38TBox)# <cfif trim(hcpcLengthOfNeedMonth38TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode39TBox) NEQ "" OR trim(hcpcQty39TBox) NEQ "" OR trim(hcpcProduct39TBox) NEQ "" OR trim(hcpcCost39TBox) NEQ "" OR trim(hcpcDX39TBox) NEQ "" OR trim(hcpcDiagnosis39TBox) NEQ "">
							<tr id="tr_hcpc39">
							<td id="td_hcpcCode39TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode39TBox) NEQ "">#trim(hcpcCode39TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty39TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty39TBox) NEQ "">#trim(hcpcQty39TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct39TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct39TBox) NEQ "">#trim(hcpcProduct39TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost39TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost39TBox) NEQ "">#trim(hcpcCost39TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX39TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX39TBox) NEQ "">#trim(hcpcDX39TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis39TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis39TBox) NEQ "">#trim(hcpcDiagnosis39TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed39TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear39TBox)# <cfif trim(hcpcLengthOfNeedYear39TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth39TBox)# <cfif trim(hcpcLengthOfNeedMonth39TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
							<cfif trim(hcpcCode40TBox) NEQ "" OR trim(hcpcQty40TBox) NEQ "" OR trim(hcpcProduct40TBox) NEQ "" OR trim(hcpcCost40TBox) NEQ "" OR trim(hcpcDX40TBox) NEQ "" OR trim(hcpcDiagnosis40TBox) NEQ "">
							<tr id="tr_hcpc40">
							<td id="td_hcpcCode40TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;"><cfif trim(hcpcCode40TBox) NEQ "">#trim(hcpcCode40TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcQty40TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcQty40TBox) NEQ "">#trim(hcpcQty40TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcProduct40TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcProduct40TBox) NEQ "">#trim(hcpcProduct40TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcCost40TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcCost40TBox) NEQ "">#trim(hcpcCost40TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDX40TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDX40TBox) NEQ "">#trim(hcpcDX40TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcDiagnosis40TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(hcpcDiagnosis40TBox) NEQ "">#trim(hcpcDiagnosis40TBox)#<cfelse>&nbsp;</cfif></td>
							<td id="td_hcpcLengthOfNeed40TBox" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">#trim(hcpcLengthOfNeedYear40TBox)# <cfif trim(hcpcLengthOfNeedYear40TBox) NEQ "">y</cfif> #trim(hcpcLengthOfNeedMonth40TBox)# <cfif trim(hcpcLengthOfNeedMonth40TBox) NEQ "">m</cfif></td>
							</tr>
							</cfif>
																			
							<tr>
							    <td align="center" colspan="7" class="siteLabel" style="border-Top: 2px solid; border-color: 000000;">&nbsp;</td>
							</tr>
							
							<!-------------------------------------------------------------------------------------->
							<!--- Insurances sections                                                            --->
							<!-------------------------------------------------------------------------------------->
							<cf_tagIntakeHardCopyPrintInsurances patientID="#trim(patientID)#" clientid="#session.clientID#">

															
							
							<!---PHYSICIAN INFORMATION--->
							<tr><td align="center" colspan="7"><font color="c0c0c0" face="Arial" size="3"><strong>INTAKE&nbsp;ID:&nbsp;#trim(intakeID)#<cfif InactiveCode EQ 298>&nbsp;[PENDING]</cfif>&nbsp;&nbsp;<cfif NOT Active>STATUS: CANCELLED</cfif></strong></font></td></tr>	
							<tr><td align="center" colspan="7" class="siteLabel">&nbsp;</td></tr>
							<tr>
							    <td bgcolor="DCE3EB" align="center" colspan="7" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
									<table cellpadding="0" cellspacing="0" border="0" width="100%">
										<td align="center" class="siteLabel">
											<font face="Arial" size="2"><strong>ORDERING&nbsp;PHYSICIAN&nbsp;INFORMATION</strong></font>
										</td>
										<td align="right" nowrap class="siteLabel">
											&nbsp;
										</td>
									</table>									
								</td>
							</tr>
							<tr>														   
							    <td id="td_orderingPhysicianNameTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">
									&nbsp;<strong>PHYSICIAN&nbsp;FIRST:</strong>&nbsp;#trim(orderingPhysicianFNameTBox)#
									&nbsp;<strong>M:</strong>&nbsp;#trim(orderingPhysicianMInitialTBox)#
									&nbsp;<strong>LAST:</strong>&nbsp;#trim(orderingPhysicianLNameTBox)#
								</td>
							    <td id="td_orderingPhysicianPhoneTBox" colspan="4" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>PHYSICIAN&nbsp;PHONE&nbsp;##:</strong>&nbsp;#request.formatPhoneUS(trim(orderingPhysicianPhoneTBox))#</td>
							</tr>	
							<cfset upinOnclick = "">
							<tr>														   
							    <td id="td_orderingPhysicianUPINTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;<strong>UPIN&nbsp;##:</strong>&nbsp;#trim(orderingPhysicianUPINTBox)#</td>
							    <td id="td_orderingPhysicianFaxTBox" colspan="4" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>PHYSICIAN&nbsp;FAX&nbsp;##:</strong>&nbsp;#request.formatPhoneUS(trim(orderingPhysicianFaxTBox))#</td>
							</tr>
							<tr>														   
							    <td id="td_orderingPhysicianAddressTBox" colspan="7" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;ADDRESS:&nbsp;#trim(orderingPhysicianAddressTBox)#</td>
							</tr>							
							
							<cfif IsNumeric(orderingPhysicianStateTBox)>
								<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" fields="itemNameDisplay" listid="4" standardlistitemid="#trim(orderingPhysicianStateTBox)#" active="1" returnvariable="getState">
								<cfset orderingPhysicianState = getState.itemNameDisplay>
							<cfelse>
								<cfset orderingPhysicianState = orderingPhysicianStateTBox>
							</cfif>
							<tr>
							    <td id="td_orderingPhysicianCityTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">&nbsp;<strong>CITY:</strong>&nbsp;#trim(orderingPhysicianCityTBox)#</td>
							    <td id="td_orderingPhysicianStateTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 0px solid; border-bottom: 2px solid; border-left: 0px solid; border-color: 000000;">&nbsp;<strong>STATE:</strong>&nbsp;#trim(orderingPhysicianState)#</td>
								<td id="td_orderingPhysicianZipTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>ZIP:</strong>&nbsp;#trim(orderingPhysicianZipTBox)#</td>
							</tr>
																																						
							<tr>
							    <td align="center" colspan="7" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">&nbsp;</td>
							</tr>
													
														
							<!---SAME OR SIMILIAR EQUIPMENT--->
							<tr><td align="center" colspan="7"><font color="c0c0c0" face="Arial" size="3"><strong>INTAKE&nbsp;ID:&nbsp;#trim(intakeID)#<cfif InactiveCode EQ 298>&nbsp;[PENDING]</cfif>&nbsp;&nbsp;<cfif NOT Active>STATUS: CANCELLED</cfif></strong></font></td></tr>	
							<tr><td align="center" colspan="7" class="siteLabel">&nbsp;</td></tr>
							<tr>
							    <td bgcolor="DCE3EB" align="center" nowrap colspan="5" class="siteLabel" style="border-Top: 2px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
									<font face="Arial" size="2"><strong>SAME&nbsp;OR&nbsp;SIMILIAR&nbsp;EQUIPMENT</strong></font>
								</td>
								<td bgcolor="DCE3EB" align="center" nowrap colspan="2" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">
									&nbsp;
								</td>
							</tr>							
							<tr>														   
							    <td align="center" colspan="7" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;**&nbsp;These&nbsp;questions&nbsp;should&nbsp;be&nbsp;asked&nbsp;to&nbsp;patient,&nbsp;caregiver,&nbsp;family,&nbsp;or&nbsp;emergency&nbsp;contact&nbsp;to&nbsp;assist&nbsp;in&nbsp;determining&nbsp;reimbursement</td>
							</tr>																
							<tr>														   
							    <td id="td_OPTION_13_CBox_PastEquipment" style="background-color:ffffcc" colspan="7" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">
									&nbsp;<strong>HAS&nbsp;PATIENT&nbsp;EVER&nbsp;HAD&nbsp;MEDICAL&nbsp;EQUIPMENT&nbsp;IN&nbsp;THE&nbsp;PAST?:</strong>&nbsp;&nbsp;&nbsp;
									<cfif trim(OPTION_13_CBox_PastEquipmentYes) EQ 1><font color="FF0000">&radic;</font></cfif>
									&nbsp;YES&nbsp;&nbsp;&nbsp;									
									<cfif trim(OPTION_13_CBox_PastEquipmentNo) EQ 1><font color="FF0000">&radic;</font></cfif>
									&nbsp;NO&nbsp;&nbsp;&nbsp;&nbsp;IF&nbsp;SO,&nbsp;LIST&nbsp;BELOW:
								</td>
							</tr>																						
							<tr>														   
							    <td colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;"><strong>EQUIPMENT&nbsp;TYPE&nbsp;/&nbsp;NOTE</strong></td>
							    <td colspan="2" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;"><strong>RENTAL/PURCHASE</strong></td>
								<td colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;"><strong>DATES</strong></td>
							    <td colspan="3" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;"><strong>NAME/PHONE&nbsp;OF&nbsp;SUPPLIER</strong></td>
							</tr>		
							<tr>														   
							    <td id="td_Equipment1TypeTBox" colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">#trim(Equipment1TypeTBox)#&nbsp;#trim(Equipment1NoteTBox)#</td>
							    <td id="td_Equipment1RentPurchasedSelect" colspan="2" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(Equipment1RentPurchasedSelect) EQ 'R'>RENTED</cfif><cfif trim(Equipment1RentPurchasedSelect) EQ 'P'>PURCHASED</cfif></td>
								<td id="td_Equipment1Dates" colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;" nowrap>#trim(Equipment1FromMM)#/#trim(Equipment1FromDD)#/#trim(Equipment1FromYY)#&nbsp;TO&nbsp;#trim(Equipment1ToMM)#/#trim(Equipment1ToDD)#/#trim(Equipment1ToYY)#</td>
							    <td id="td_Equipment1SupplierTelephoneTBox" colspan="3" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;" nowrap>#trim(Equipment1SupplierNameTBox)#&nbsp;/&nbsp;#request.formatPhoneUS(trim(Equipment1SupplierTelephoneTBox))#</td>
							</tr>
							<tr>														   
							    <td id="td_Equipment2TypeTBox" colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">#trim(Equipment2TypeTBox)#&nbsp;#trim(Equipment2NoteTBox)#</td>
							    <td id="td_Equipment2RentPurchasedSelect" colspan="2" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(Equipment2RentPurchasedSelect) EQ 'R'>RENTED</cfif><cfif trim(Equipment2RentPurchasedSelect) EQ 'P'>PURCHASED</cfif></td>
								<td id="td_Equipment2Dates" colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;" nowrap>#trim(Equipment2FromMM)#/#trim(Equipment2FromDD)#/#trim(Equipment2FromYY)#&nbsp;TO&nbsp;#trim(Equipment2ToMM)#/#trim(Equipment2ToDD)#/#trim(Equipment2ToYY)#</td>
							    <td id="td_Equipment2SupplierTelephoneTBox" colspan="3" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;" nowrap>#trim(Equipment2SupplierNameTBox)#&nbsp;/&nbsp;#request.formatPhoneUS(trim(Equipment2SupplierTelephoneTBox))#</td>
							</tr>
							<tr>														   
							    <td id="td_Equipment3TypeTBox" colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">#trim(Equipment3TypeTBox)#&nbsp;#trim(Equipment3NoteTBox)#</td>
							    <td id="td_Equipment3RentPurchasedSelect" colspan="2" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(Equipment3RentPurchasedSelect) EQ 'R'>RENTED</cfif><cfif trim(Equipment3RentPurchasedSelect) EQ 'P'>PURCHASED</cfif></td>
								<td id="td_Equipment3Dates" colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;" nowrap>#trim(Equipment3FromMM)#/#trim(Equipment3FromDD)#/#trim(Equipment3FromYY)#&nbsp;TO&nbsp;#trim(Equipment3ToMM)#/#trim(Equipment3ToDD)#/#trim(Equipment3ToYY)#</td>
							    <td id="td_Equipment3SupplierTelephoneTBox" colspan="3" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;" nowrap>#trim(Equipment3SupplierNameTBox)#&nbsp;/&nbsp;#request.formatPhoneUS(trim(Equipment3SupplierTelephoneTBox))#</td>
							</tr>
							<tr>														   
							    <td id="td_Equipment4TypeTBox" colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">#trim(Equipment4TypeTBox)#&nbsp;#trim(Equipment4NoteTBox)#</td>
							    <td id="td_Equipment4RentPurchasedSelect" colspan="2" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(Equipment4RentPurchasedSelect) EQ 'R'>RENTED</cfif><cfif trim(Equipment4RentPurchasedSelect) EQ 'P'>PURCHASED</cfif></td>
								<td id="td_Equipment4Dates" colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;" nowrap>#trim(Equipment4FromMM)#/#trim(Equipment4FromDD)#/#trim(Equipment4FromYY)#&nbsp;TO&nbsp;#trim(Equipment4ToMM)#/#trim(Equipment4ToDD)#/#trim(Equipment4ToYY)#</td>
							    <td id="td_Equipment4SupplierTelephoneTBox" colspan="3" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;" nowrap>#trim(Equipment4SupplierNameTBox)#&nbsp;/&nbsp;#request.formatPhoneUS(trim(Equipment4SupplierTelephoneTBox))#</td>
							</tr>							
							<tr>														   
							    <td id="td_Equipment5TypeTBox" colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">#trim(Equipment5TypeTBox)#&nbsp;#trim(Equipment5NoteTBox)#</td>
							    <td id="td_Equipment5RentPurchasedSelect" colspan="2" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 2px solid; border-left: 0px solid; border-color: 000000;"><cfif trim(Equipment5RentPurchasedSelect) EQ 'R'>RENTED</cfif><cfif trim(Equipment5RentPurchasedSelect) EQ 'P'>PURCHASED</cfif></td>
								<td id="td_Equipment5Dates" colspan="1" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 2px solid; border-left: 0px solid; border-color: 000000;" nowrap>#trim(Equipment5FromMM)#/#trim(Equipment5FromDD)#/#trim(Equipment5FromYY)#&nbsp;TO&nbsp;#trim(Equipment5ToMM)#/#trim(Equipment5ToDD)#/#trim(Equipment5ToYY)#</td>
							    <td id="td_Equipment5SupplierTelephoneTBox" colspan="3" align="center" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 0px solid; border-color: 000000;" nowrap>#trim(Equipment5SupplierNameTBox)#&nbsp;/&nbsp;#request.formatPhoneUS(trim(Equipment5SupplierTelephoneTBox))#</td>
							</tr>																																					
							<tr>
							    <td align="center" colspan="7" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">&nbsp;</td>
							</tr>
								
							
													
							<!---LAB DATA--->
							<tr><td align="center" colspan="7"><font color="c0c0c0" face="Arial" size="3"><strong>INTAKE&nbsp;ID:&nbsp;#trim(intakeID)#<cfif InactiveCode EQ 298>&nbsp;[PENDING]</cfif>&nbsp;&nbsp;<cfif NOT Active>STATUS: CANCELLED</cfif></strong></font></td></tr>	
							<tr><td align="center" colspan="7" class="siteLabel">&nbsp;</td></tr>
							<tr>
							    <td bgcolor="DCE3EB" align="center" colspan="7" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
									<font face="Arial" size="2"><strong>LAB&nbsp;DATA</strong></font>
								</td>
							</tr>							
							<tr>														   
							    <td align="center" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;"><strong>OXYGEN&nbsp;DATA</strong></td>
							    <td align="center" colspan="4" class="siteLabel" style="border-Top: 1px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;"><strong>CPAP&nbsp;DATA</strong></td>
							</tr>
							<tr>														   
							    <td colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">
									&nbsp;
									<cfif trim(OPTION_14_CBox_OxygenPAo2) EQ 1><font color="FF0000">&radic;</font></cfif>
									&nbsp;<strong>PaO<sub>2</sub></strong>&nbsp;&nbsp;#trim(OxygenPAO2TBox)#&nbsp;mmHg&nbsp;&nbsp;<strong>OR</strong>&nbsp;&nbsp;&nbsp;
									<cfif trim(OPTION_14_CBox_OxygenSAo2) EQ 1><font color="FF0000">&radic;</font></cfif>
									&nbsp;<strong>SaO<sub>2</sub></strong>&nbsp;&nbsp;#trim(OxygenSAO2TBox)#&nbsp;<strong>%&nbsp;via&nbsp;ABG</strong>
								</td>
							    <td colspan="4" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<cfif trim(CPAPStudy_CBox) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>SLEEP&nbsp;STUDY&nbsp;IS&nbsp;PENDING:</strong>&nbsp;#trim(CPAPStudyNote)#</td>
							</tr>
							<tr>														   
							    <td colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;<strong>OR</strong>&nbsp;
								<cfif trim(OPTION_14_CBox_OxygenSPo2) EQ 1><font color="FF0000">&radic;</font></cfif>
								&nbsp;<strong>SPO<sub>2</sub></strong>&nbsp;
								#trim(OxygenSPO2TBox)#
								&nbsp;<strong>%&nbsp;via&nbsp;Pulse&nbsp;Oximetry</strong>
								</td>
							    <td colspan="4" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
									&nbsp;<cfif trim(CPAPStudyOnFile_CBox) EQ 1><font color="FF0000">&radic;</font></cfif>&nbsp;<strong>SLEEP&nbsp;STUDY&nbsp;ON&nbsp;FILE:</strong>&nbsp;
									#trim(CPAPStudyOnFileNote)#
								</td>
							</tr>							
							<tr>														   
							    <td colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;<strong>TEST&nbsp;DATE:</strong>&nbsp;#trim(LabTestDateMM)#/#trim(LabTestDateDD)#/#trim(LabTestDateYY)#</td>
								<td colspan="4" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>SLEEP&nbsp;STUDY&nbsp;PERFORMED&nbsp;AT:</strong>&nbsp;#trim(CPAPStudyPerformedAt)#</td>
							</tr>
							<tr>														   
							   	<td colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;<strong>TEST&nbsp;FACILITY:</strong>&nbsp;#trim(LabTestFacilityTBox)#</td>
							   	<td colspan="4" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;<strong>OTHER&nbsp;(LIST&nbsp;BELOW):</strong></td>
							</tr>																	
							<tr>														   
							   	<td colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 2px solid; border-color: 000000;">&nbsp;</td>
							   	<td colspan="4" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">#trim(CPAPStudyPerformedAt2)#</td>
							</tr>
							<tr>														   
							   	<td colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">&nbsp;</td>
							   	<td colspan="4" class="siteLabel" style="border-Top: 0px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 1px solid; border-color: 000000;">#trim(CPAPStudyPerformedAt3)#</td>
							</tr>		
																																						
							<tr>
							    <td align="center" colspan="7" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">&nbsp;</td>
							</tr>						
															
						</table>
					</td>
				</tr>	
									
				<tr>
				    <td align="center" colspan="10" class="siteLabel" style="border-bottm: 1px solid; border-color: 000000;">&nbsp;</td>
				</tr>	
								
				<tr><td align="center" colspan="7"><font color="c0c0c0" face="Arial" size="3"><strong>INTAKE&nbsp;ID:&nbsp;#trim(intakeID)#<cfif InactiveCode EQ 298>&nbsp;[PENDING]</cfif>&nbsp;&nbsp;<cfif NOT Active>STATUS: CANCELLED</cfif></strong></font></td></tr>	
				<tr><td align="center" colspan="7" class="siteLabel">&nbsp;</td></tr>
					
				<tr>
		       		<td bgcolor="DCE3EB" align="center" colspan="7" class="siteLabel" style="border-Top: 2px solid; border-right: 2px solid; border-bottom: 0px solid; border-left: 2px solid; border-color: 000000;">
		         		<br><font face="Arial" size="2"><strong>INTAKE&nbsp;NOTES</strong></font><br>&nbsp;
		        	</td>
		        </tr>
				<tr>
		       		<td colspan="7" class="siteLabel" style="margin-top:6px; border-Top: 1px solid; border-right: 2px solid; border-bottom: 2px solid; border-left: 2px solid; border-color: 000000;">
						<cf_appIntakeNote objectid="8" instanceid="#trim(intakeID)#" return="yes">
					</td>
				</tr>									
									
			</table>	
		     	
		</form>		
		
	</cfoutput>
	
	
</cfsavecontent>
	
	<!---<cffile action="write" file="c:\temp\thisNOW.txt" output="#ClaimPrintHardCopy#" addnewline="no">	--->	
		
	<cfset finalFileName = "Intake_PrintHardCopyFinal_#session.Client.getClientID()#_#trim(fileDateTimeStamp)#_#trim(intakeID)#.pdf">
	
	<!-------------------------------------------------------------------------------------->
	<!--- Create the claim print file PDF. Placing pagetype="A4" keeps everything on     --->
	<!--- the same page.                                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cfdocument marginbottom=".07" marginleft=".07" marginright=".07" margintop=".07" format="PDF" filename="#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\#trim(finalFileName)#" overwrite="yes">
		<cfoutput>				
			#ClaimPrintHardCopy#
		</cfoutput>
	</cfdocument>	
						
	<!-------------------------------------------------------------------------------------->
	<!--- Locate the user to where they will be able to print it.                        --->
	<!-------------------------------------------------------------------------------------->		
	<cfoutput>		
		
		<script language="JavaScript">					
			reminder=window.open('#trim(request.tempDocsURL)#/#trim(finalFileName)#', 'reminder', 'top=0,left=0,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=#trim(session.screenWidth)#,height=#trim(session.screenHeight)#'); reminder.focus(0);
			setTimeout('self.close()',500); // close self after a seconds delay			
		</script>
		
	</cfoutput>	
	
	
