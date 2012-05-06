
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.number" default="">
	<cfset number = attributes.number>
	
	<cfparam name="attributes.InsuranceNameTBox" default="">
	<cfset InsuranceNameTBox = attributes.InsuranceNameTBox>
		
	<cfparam name="attributes.PolicyNumberTBox" default="">
	<cfset PolicyNumberTBox = attributes.PolicyNumberTBox>
	
	<cfparam name="attributes.GroupNumberTBox" default="">
	<cfset GroupNumberTBox = attributes.GroupNumberTBox>
	
	<cfparam name="attributes.PhoneNumberTBox" default="">
	<cfset PhoneNumberTBox = attributes.PhoneNumberTBox>
	
	<cfparam name="attributes.FaxNumberTBox" default="">
	<cfset FaxNumberTBox = attributes.FaxNumberTBox>
	
	<cfparam name="attributes.EffectiveDateMM" default="">
	<cfset EffectiveDateMM = attributes.EffectiveDateMM>
	
	<cfparam name="attributes.EffectiveDateDD" default="">
	<cfset EffectiveDateDD = attributes.EffectiveDateDD>
	
	<cfparam name="attributes.EffectiveDateYY" default="">
	<cfset EffectiveDateYY = attributes.EffectiveDateYY>
	
	<cfparam name="attributes.PolicyHolderFNameTBox" default="">
	<cfset PolicyHolderFNameTBox = attributes.PolicyHolderFNameTBox>
	
	<cfparam name="attributes.PolicyHolderMInitialTBox" default="">
	<cfset PolicyHolderMInitialTBox = attributes.PolicyHolderMInitialTBox>
	
	<cfparam name="attributes.PolicyHolderLNameTBox" default="">
	<cfset PolicyHolderLNameTBox = attributes.PolicyHolderLNameTBox>
	
	<cfparam name="attributes.HoldersDOBMM" default="">
	<cfset HoldersDOBMM = attributes.HoldersDOBMM>
	
	<cfparam name="attributes.HoldersDOBDD" default="">
	<cfset HoldersDOBDD = attributes.HoldersDOBDD>
	
	<cfparam name="attributes.HoldersDOBYY" default="">
	<cfset HoldersDOBYY = attributes.HoldersDOBYY>
	
	<cfparam name="attributes.PolicyHolderEmployerTBox" default="">
	<cfset PolicyHolderEmployerTBox = attributes.PolicyHolderEmployerTBox>
	
	<cfparam name="attributes.NoteTBox" default="">
	<cfset NoteTBox = attributes.NoteTBox>
	
	<cfparam name="attributes.VerificationRepFNameTBox" default="">
	<cfset VerificationRepFNameTBox = attributes.VerificationRepFNameTBox>
	
	<cfparam name="attributes.VerificationRepLNameTBox" default="">
	<cfset VerificationRepLNameTBox = attributes.VerificationRepLNameTBox>
	
	<cfparam name="attributes.VerificationDateMM" default="">
	<cfset VerificationDateMM = attributes.VerificationDateMM>
	
	<cfparam name="attributes.VerificationDateDD" default="">
	<cfset VerificationDateDD = attributes.VerificationDateDD>
	
	<cfparam name="attributes.VerificationDateYY" default="">
	<cfset VerificationDateYY = attributes.VerificationDateYY>
	
	<cfparam name="attributes.VerificationTimeTBox" default="">
	<cfset VerificationTimeTBox = attributes.VerificationTimeTBox>										
	
	<cfparam name="attributes.VerificationHaveInsFromMM" default="">
	<cfset VerificationHaveInsFromMM = attributes.VerificationHaveInsFromMM>
	
	<cfparam name="attributes.VerificationHaveInsFromDD" default="">
	<cfset VerificationHaveInsFromDD = attributes.VerificationHaveInsFromDD>
	
	<cfparam name="attributes.VerificationHaveInsFromYY" default="">
	<cfset VerificationHaveInsFromYY = attributes.VerificationHaveInsFromYY>
	
	<cfparam name="attributes.VerificationHaveInsToMM" default="">
	<cfset VerificationHaveInsToMM = attributes.VerificationHaveInsToMM>
	
	<cfparam name="attributes.VerificationHaveInsToDD" default="">
	<cfset VerificationHaveInsToDD = attributes.VerificationHaveInsToDD>
	
	<cfparam name="attributes.VerificationHaveInsToYY" default="">
	<cfset VerificationHaveInsToYY = attributes.VerificationHaveInsToYY>
	
	<cfparam name="attributes.VerificationHaveInsYes" default="0">
	<cfset VerificationHaveInsYes = attributes.VerificationHaveInsYes>
	
	<cfparam name="attributes.VerificationHaveInsNo" default="0">
	<cfset VerificationHaveInsNo = attributes.VerificationHaveInsNo>
	
	<cfparam name="attributes.VerificationHaveDMECovYes" default="0">
	<cfset VerificationHaveDMECovYes = attributes.VerificationHaveDMECovYes>
	
	<cfparam name="attributes.VerificationHaveDMECovNo" default="0">
	<cfset VerificationHaveDMECovNo = attributes.VerificationHaveDMECovNo>
	
	<cfparam name="attributes.VerificationDeductibleYes" default="0">
	<cfset VerificationDeductibleYes = attributes.VerificationDeductibleYes>
	
	<cfparam name="attributes.VerificationDeductibleNo" default="0">
	<cfset VerificationDeductibleNo = attributes.VerificationDeductibleNo>
	
	<cfparam name="attributes.VerificationDeductibleAmountTBox" default="">
	<cfset VerificationDeductibleAmountTBox = attributes.VerificationDeductibleAmountTBox>
	
	<cfparam name="attributes.VerificationDeductibleAmountMetTBox" default="">
	<cfset VerificationDeductibleAmountMetTBox = attributes.VerificationDeductibleAmountMetTBox>
	
	<cfparam name="attributes.VerificationPercentagePayAfterDeductibleTBox" default="">
	<cfset VerificationPercentagePayAfterDeductibleTBox = attributes.VerificationPercentagePayAfterDeductibleTBox>									
	
	<cfparam name="attributes.VerificationPPOPolicyYes" default="0">
	<cfset VerificationPPOPolicyYes = attributes.VerificationPPOPolicyYes>
	
	<cfparam name="attributes.VerificationPPOPolicyNo" default="0">
	<cfset VerificationPPOPolicyNo = attributes.VerificationPPOPolicyNo>										
	
	<cfparam name="attributes.VerificationAuthNumberTBox" default="">
	<cfset VerificationAuthNumberTBox = attributes.VerificationAuthNumberTBox>							
	
	<cfparam name="attributes.VerificationPriorAuthYes" default="0">
	<cfset VerificationPriorAuthYes = attributes.VerificationPriorAuthYes>
	
	<cfparam name="attributes.VerificationPriorAuthNo" default="0">
	<cfset VerificationPriorAuthNo = attributes.VerificationPriorAuthNo>										
	
	<cfparam name="attributes.VerificationAuthPhoneNumberTBox" default="">
	<cfset VerificationAuthPhoneNumberTBox = attributes.VerificationAuthPhoneNumberTBox>			
	
	<cfparam name="attributes.VerificationLifetimeBenefitMetYes" default="0">
	<cfset VerificationLifetimeBenefitMetYes = attributes.VerificationLifetimeBenefitMetYes>
	
	<cfparam name="attributes.VerificationLifetimeBenefitMetNo" default="0">
	<cfset VerificationLifetimeBenefitMetNo = attributes.VerificationLifetimeBenefitMetNo>												
	
	<cfparam name="attributes.MedicareSupplementYes" default="0">
	<cfset MedicareSupplementYes = attributes.MedicareSupplementYes>
	
	<cfparam name="attributes.MedicareSupplementNo" default="0">
	<cfset MedicareSupplementNo = attributes.MedicareSupplementNo>				
	
	<cfparam name="attributes.CoordinateBenefitsYes" default="0">
	<cfset CoordinateBenefitsYes = attributes.CoordinateBenefitsYes>
	
	<cfparam name="attributes.CoordinateBenefitsNo" default="0">
	<cfset CoordinateBenefitsNo = attributes.CoordinateBenefitsNo>			
	
	<cfparam name="attributes.PaidMedicareDeductibleYes" default="0">
	<cfset PaidMedicareDeductibleYes = attributes.PaidMedicareDeductibleYes>
	
	<cfparam name="attributes.PaidMedicareDeductibleNo" default="0">
	<cfset PaidMedicareDeductibleNo = attributes.PaidMedicareDeductibleNo>											
	
	<cfparam name="attributes.VerificationTypeBasePlanTBox" default="">
	<cfset VerificationTypeBasePlanTBox = attributes.VerificationTypeBasePlanTBox>			
	
	<cfparam name="attributes.VerificationMedicaidPlanMQMB" default="0">
	<cfset VerificationMedicaidPlanMQMB = attributes.VerificationMedicaidPlanMQMB>
	
	<cfparam name="attributes.VerificationMedicaidPlanQMB" default="0">
	<cfset VerificationMedicaidPlanQMB = attributes.VerificationMedicaidPlanQMB>
	
	<cfparam name="attributes.VerificationMedicaidPlanTraditional" default="0">
	<cfset VerificationMedicaidPlanTraditional = attributes.VerificationMedicaidPlanTraditional>
	
	<cfparam name="attributes.SendToAddress1TBox" default="">
	<cfset SendToAddress1TBox = attributes.SendToAddress1TBox>
	
	<cfparam name="attributes.SendToAddress2TBox" default="">
	<cfset SendToAddress2TBox = attributes.SendToAddress2TBox>
	
	<cfparam name="attributes.SendToCityTBox" default="">
	<cfset SendToCityTBox = attributes.SendToCityTBox>
	
	<cfparam name="attributes.SendToStateTBox" default="">
	<cfset SendToStateTBox = attributes.SendToStateTBox>
	
	<cfparam name="attributes.SendToZipCodeTBox" default="">
	<cfset SendToZipCodeTBox = attributes.SendToZipCodeTBox>
	
	<cfparam name="attributes.picID" default="">
	<cfset picID = attributes.picID>
	
	<cfparam name="attributes.verificationID" default="">
	<cfset verificationID = attributes.verificationID>

	<cfparam name="attributes.patientID" default="">
	<cfset patientID = attributes.patientID>	
	

<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
	
<style>
###trim(number)#InsuranceNameTBox .ui-menu .ui-menu-item {
	margin:0;
	padding: 0;
	zoom: 1;
	float: left;
	clear: left;
	width: 450px;
	text-align : left;
	background-color : ##FFFFCC;
	border: 1px dotted red;
}
</style>	
	
	
		<input type="Hidden" name="hidden_#trim(number)#InsuranceID" id="hidden_#trim(number)#InsuranceID" value="">
		<input type="Hidden" name="hidden_#trim(number)#PICID" id="hidden_#trim(number)#PICID" value="">
		<input type="Hidden" name="hidden_#trim(number)#InsurancePatientID" id="hidden_#trim(number)#InsurancePatientID" value="#PatientID#">
		<input type="Hidden" name="hidden_#trim(number)#_AutoSuggestInsuranceID" id="hidden_#trim(number)#_AutoSuggestInsuranceID" value="">
		<input type="Hidden" name="hidden_#trim(number)#_InsuranceNameApproval" id="hidden_#trim(number)#_InsuranceNameApproval" value="">
		<table cellpadding="4" cellspacing="0" border="0" align="center">
			<tr>
	        	<td id="td_priNoteTBox" colspan="6" class="siteLabel">&nbsp;</td>
	       	</tr>
		   	<tr>
				<td bgcolor="DCE3EB" align="center" colspan="6" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">
					<font face="Arial" size="2"><strong>#UCase(trim(number))#&nbsp;INSURANCE</strong></font>					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span onclick="if(document.all.hidden_#trim(number)#InsurancePatientID.value != ''){editPIC(document.all.hidden_#trim(number)#InsurancePatientID.value, document.all.hidden_#trim(number)#PICID.value, 1);}" class="siteLabel" style="cursor:hand"><u>Edit&nbsp;Insurance</u></span>
				</td>					
			</tr>		  			
		   	<tr>	        	
			   	<td id="td_#trim(number)#InsuranceNameTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
					<table cellspacing="0" cellpadding="0" border="0">
						<tr>
						    <td class="siteLabel">&nbsp;INSURANCE&nbsp;NAME:&nbsp;</td>
						    <td class="siteLabel">
								<div id="div_AutoSuggestParent#trim(number)#">	
									<div id="div_AutoSuggestInput#trim(number)#" class="div_AutoSuggestInput#trim(number)#">											
										<input tabindex="352" type="Text" size="35" maxlength="45" name="#trim(number)#InsuranceNameTBox" id="#trim(number)#InsuranceNameTBox" value="#trim(InsuranceNameTBox)#" class="siteTextBox">
									</div>									
								</div>	
							</td>
						</tr>
					</table>
				</td>	       	   	
				<td id="td_#trim(number)#PolicyNumberTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;POLICY&nbsp;##:&nbsp;<input tabindex="355" type="Text" size="45" maxlength="35" name="#trim(number)#PolicyNumberTBox" value="#trim(PolicyNumberTBox)#" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};"></td>
	       	</tr>
			<tr>		   		
	           	<td id="td_#trim(number)#GroupNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;GROUP&nbsp;##:&nbsp;<input tabindex="358" type="Text" size="45" maxlength="35" name="#trim(number)#GroupNumberTBox" value="#trim(GroupNumberTBox)#" class="siteTextBox"></td>
	           	<td id="td_#trim(number)#PhoneNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">
					&nbsp;PHONE&nbsp;##:&nbsp;<input tabindex="359" type="Text" size="22" maxlength="15" name="#trim(number)#PhoneNumberTBox" value="#trim(PhoneNumberTBox)#" class="siteTextBox" onkeyup="this.value=formatPhoneUS_JS(this.value);" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};">
					&nbsp;FAX&nbsp;##:&nbsp;<input tabindex="359" type="Text" size="22" maxlength="15" name="#trim(number)#FaxNumberTBox" value="#trim(FaxNumberTBox)#" class="siteTextBox" onkeyup="this.value=formatPhoneUS_JS(this.value);" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};">
				</td>
	       	</tr>	
		   	<tr>
	        	<td id="td_#trim(number)#SendToAddress1TBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
					SEND&nbsp;CLAIMS&nbsp;TO&nbsp;ADDRESS&nbsp;LINE&nbsp;1:&nbsp;<input tabindex="360" type="Text" size="50" maxlength="98" name="#trim(number)#SendToAddress1TBox" value="#trim(SendToAddress1TBox)#" class="siteTextBox">
					&nbsp;ADDRESS&nbsp;LINE&nbsp;2:&nbsp;<input tabindex="360" type="Text" size="50" maxlength="98" name="#trim(number)#SendToAddress2TBox" value="#trim(SendToAddress2TBox)#" class="siteTextBox">
				</td>
	       	</tr>	
		   	<tr>
	        	<td id="td_#trim(number)#SendToCityTBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
					&nbsp;CITY:&nbsp;<input tabindex="360" type="Text" size="20" maxlength="30" onChange="capitalizeMe(this)" name="#trim(number)#SendToCityTBox" value="#trim(SendToCityTBox)#" class="siteTextBox">
					&nbsp;STATE:&nbsp;					
					<cfset getAllStates = application.beanFactory.getBean('StandardListItemIO').getStandardListItemQuery(listid: '4', active: '1') />
					<select tabindex="360" class="SiteSelectBox" name="#trim(number)#SendToStateTBox" onchange="changeSelColor(this.selectedIndex);">
						<option value="">
						<cfloop query="getAllStates">
							<option value="#StandardListItemID#" <cfif StandardListItemID EQ trim(SendToStateTBox)>SELECTED</cfif>> #ItemNameDisplay#
						</cfloop>
					</select>	
					<!---<input tabindex="360" type="Text" size="20" maxlength="20" onChange="capitalizeMe(this)" name="#trim(number)#SendToStateTBox" value="#trim(SendToStateTBox)#" class="siteTextBox">--->
					&nbsp;ZIP&nbsp;CODE:&nbsp;<input tabindex="360" type="Text" size="15" maxlength="15" name="#trim(number)#SendToZipcodeTBox" value="#trim(SendToZipCodeTBox)#" class="siteTextBox">
				</td>
	       	</tr>
			<tr>
	        	<!---<td id="td_#trim(number)#EffectiveDate" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;EFFECTIVE&nbsp;DATE:&nbsp;&nbsp;<input tabindex="362" type="Text" name="#trim(number)#EffectiveDateMM" onblur="checkMonth_JS(this);" value="#trim(EffectiveDateMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};">&nbsp;/&nbsp;<input tabindex="363" type="Text" name="#trim(number)#EffectiveDateDD" onblur="checkDay_JS(this);" value="#trim(EffectiveDateDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};">&nbsp;/&nbsp;<input tabindex="364" type="Text" name="#trim(number)#EffectiveDateYY" onblur="checkYear_JS(this);" value="#trim(EffectiveDateYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};"></td>--->
				<td id="td_#trim(number)#PolicyHolderNameTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;POLICY&nbsp;HOLDERS&nbsp;FIRST:&nbsp;<input tabindex="365" type="Text" size="15" maxlength="30" onChange="capitalizeMe(this)" name="#trim(number)#PolicyHolderFNameTBox" value="#trim(PolicyHolderFNameTBox)#" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};">&nbsp;M:&nbsp;<input tabindex="366" type="Text" size="1" maxlength="1" name="#trim(number)#PolicyHolderMInitialTBox" onChange="capitalizeMe(this)" value="#trim(PolicyHolderMInitialTBox)#" class="siteTextBox">&nbsp;LAST:&nbsp;<input tabindex="367" type="Text" size="15" maxlength="30" name="#trim(number)#PolicyHolderLNameTBox" onChange="capitalizeMe(this)" value="#trim(PolicyHolderLNameTBox)#" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};"></td>
				<td id="td_#trim(number)#HoldersDOB" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;POLICY&nbsp;HOLDERS&nbsp;DOB:&nbsp;<input tabindex="368" type="Text" name="#trim(number)#HoldersDOBMM" onblur="checkMonth_JS(this);" value="#trim(HoldersDOBMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};">&nbsp;/&nbsp;<input tabindex="369" type="Text" name="#trim(number)#HoldersDOBDD" onblur="checkDay_JS(this);" value="#trim(HoldersDOBDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};">&nbsp;/&nbsp;<input tabindex="370" type="Text" name="#trim(number)#HoldersDOBYY" onblur="checkYear_JS(this);" value="#trim(HoldersDOBYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};"></td>
	           	
	       	</tr>
		   	<tr>
	        	<td id="td_#trim(number)#PolicyHolderEmployerTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;POLICY&nbsp;HOLDERS&nbsp;EMPLOYER:&nbsp;<input tabindex="371" type="Text" size="30" maxlength="40" onChange="capitalizeMe(this)" name="#trim(number)#PolicyHolderEmployerTBox" value="#trim(PolicyHolderEmployerTBox)#" class="siteTextBox"></td>
	           	<td id="td_#trim(number)#NoteTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;NOTE:&nbsp;<input tabindex="372" type="Text" size="50" maxlength="98" name="#trim(number)#NoteTBox" value="#trim(NoteTBox)#" class="siteTextBox"></td>
	       	</tr>		   

			<tr>
	        	<td id="td_#trim(number)#InsuranceTBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">
	           		<cf_tagInsuranceVerification tabstart="373" number="#trim(number)#" picID="#trim(picID)#" verificationID="#trim(verificationID)#">
				</td>
			</tr>		
			
			<tr>
	        	<td colspan="6" class="siteLabel">&nbsp;</td>
	       	</tr>	
		
		</table> 		
	
		<script language="JavaScript">
			if(document.all.#trim(number)#InsuranceNameTBox.value == ""){document.all.#trim(number)#InsuranceNameTBox.style.backgroundColor = 'ffffcc';}else{document.all.#trim(number)#InsuranceNameTBox.style.backgroundColor = 'ffffff';};
			if(document.all.#trim(number)#PolicyNumberTBox.value == ""){document.all.#trim(number)#PolicyNumberTBox.style.backgroundColor = 'ffffcc';}else{document.all.#trim(number)#PolicyNumberTBox.style.backgroundColor = 'ffffff';};
			if(document.all.#trim(number)#PhoneNumberTBox.value == ""){document.all.#trim(number)#PhoneNumberTBox.style.backgroundColor = 'ffffcc';}else{document.all.#trim(number)#PhoneNumberTBox.style.backgroundColor = 'ffffff';};
			if(document.all.#trim(number)#FaxNumberTBox.value == ""){document.all.#trim(number)#FaxNumberTBox.style.backgroundColor = 'ffffcc';}else{document.all.#trim(number)#FaxNumberTBox.style.backgroundColor = 'ffffff';};
			/*<!---if(document.all.#trim(number)#EffectiveDateMM.value == ""){document.all.#trim(number)#EffectiveDateMM.style.backgroundColor = 'ffffcc';}else{document.all.#trim(number)#EffectiveDateMM.style.backgroundColor = 'ffffff';};
			if(document.all.#trim(number)#EffectiveDateDD.value == ""){document.all.#trim(number)#EffectiveDateDD.style.backgroundColor = 'ffffcc';}else{document.all.#trim(number)#EffectiveDateDD.style.backgroundColor = 'ffffff';};
			if(document.all.#trim(number)#EffectiveDateYY.value == ""){document.all.#trim(number)#EffectiveDateYY.style.backgroundColor = 'ffffcc';}else{document.all.#trim(number)#EffectiveDateYY.style.backgroundColor = 'ffffff';};
			--->*/
			if(document.all.#trim(number)#PolicyHolderFNameTBox.value == ""){document.all.#trim(number)#PolicyHolderFNameTBox.style.backgroundColor = 'ffffcc';}else{document.all.#trim(number)#PolicyHolderFNameTBox.style.backgroundColor = 'ffffff';};
			if(document.all.#trim(number)#PolicyHolderLNameTBox.value == ""){document.all.#trim(number)#PolicyHolderLNameTBox.style.backgroundColor = 'ffffcc';}else{document.all.#trim(number)#PolicyHolderLNameTBox.style.backgroundColor = 'ffffff';};
			if(document.all.#trim(number)#HoldersDOBMM.value == ""){document.all.#trim(number)#HoldersDOBMM.style.backgroundColor = 'ffffcc';}else{document.all.#trim(number)#HoldersDOBMM.style.backgroundColor = 'ffffff';};
			if(document.all.#trim(number)#HoldersDOBDD.value == ""){document.all.#trim(number)#HoldersDOBDD.style.backgroundColor = 'ffffcc';}else{document.all.#trim(number)#HoldersDOBDD.style.backgroundColor = 'ffffff';};
			if(document.all.#trim(number)#HoldersDOBYY.value == ""){document.all.#trim(number)#HoldersDOBYY.style.backgroundColor = 'ffffcc';}else{document.all.#trim(number)#HoldersDOBYY.style.backgroundColor = 'ffffff';};
		</script>

		<script type="text/javascript">		
			
			<cfif NOT IsDefined("variables.setICString")>
				<cfset variables.icString = "" />	
				<cfset variables.objIC = application.beanFactory.getBean('InsuranceCompany_Com') />					
					
				<cfset variables.xmlICs = xmlSearch(variables.objIC.InsuranceCompaniesAddressXML(clientID: trim(session.ClientID)), "INSURANCECOMPANIES/INSURANCECOMPANY")>
				<cfloop from="1" to="#ArrayLen(variables.xmlICs)#" index="ic">
					<cfset variables.thisINSURANCECOMPANYID = variables.xmlICs[ic].INSURANCECOMPANYID.xmlText />
					<cfset variables.thisINSURANCECOMPANYNAME = variables.xmlICs[ic].INSURANCECOMPANYNAME.xmlText />
					<cfset variables.thisINSURANCECOMPANYADDRESS = variables.xmlICs[ic].INSURANCECOMPANYADDRESS.xmlText />
					<cfset variables.desc = "<span class=copyBlackSmall>#variables.thisINSURANCECOMPANYNAME#</span>"> 
					<cfif variables.thisINSURANCECOMPANYADDRESS	NEQ "">
						<cfset variables.desc = "<span class=copyBlackSmall>#variables.thisINSURANCECOMPANYNAME#</span> - <span class=copyBlackXSmall>#variables.thisINSURANCECOMPANYADDRESS#</span>" />
					</cfif>					
					<cfset variables.icString = variables.icString & "{value: '#variables.thisINSURANCECOMPANYID#', label: '#JSStringFormat(variables.thisINSURANCECOMPANYNAME)#', desc: '#JSStringFormat(variables.desc)#'}" />
					<cfif ic neq ArrayLen(variables.xmlICs)>
						<cfset variables.icString = variables.icString & ",">
					</cfif>					
				</cfloop>				
				<cfset variables.setICString = true>
				var dataInsuranceCompaniesAddressXML_#trim(number)# = [#variables.icString#];
			</cfif>			

			$(function() {					
				$('###trim(number)#InsuranceNameTBox').autocomplete({
					minLength: 0,
					source: dataInsuranceCompaniesAddressXML_#trim(number)#,
					focus: function(event, ui) {
						clearInsuranceName('#trim(number)#')
						$('###trim(number)#InsuranceNameTBox').val(ui.item.label);
						return false;
					},
					select: function(event, ui) {										
						#trim(number)#populateSearchField(ui.item.value, ui.item.label); 
						return false;
					}
				})
				.data( "autocomplete" )._renderItem = function( ul, item ) {
					return $( "<li></li>" )
						.data( "item.autocomplete", item )
						.append( "<a>" + item.desc + "</a>" )
						.appendTo( ul );
				};
			});			
						
			function #trim(number)#populateSearchField(id, name) {				
				var thisSelectedID = id;
				clearInsuranceName('#trim(number)#');
				checkInsuranceName('#trim(number)#'); 						
				$('###trim(number)#InsuranceNameTBox').val(name);
				$('##hidden_#trim(number)#_AutoSuggestInsuranceID').val(thisSelectedID);
				$('##hidden_#trim(number)#_InsuranceNameApproval').val('approved'); 		   
								
				//start the GET of the IC info					
				$(document).ready(function(){			
				$.ajaxSetup({ 
					cache: false, 
					async: false 
				}); 		
				
				$.get("#trim(request.urlReconstructed)#/ws/wsInsuranceCompany.cfc",
					{
						method: "wsInsuranceCompanyXML",
						dataType: "xml",				
						Data1: escape(#trim(session.ClientID)#), 
						Data2: thisSelectedID
					},			
					function(data){					
						
						//this needs to stay so that the result will be converted to usable XML  **NEED TO FIND OUT WHY
						if (window.ActiveXObject){
							var doc=new ActiveXObject("Microsoft.XMLDOM");
						  	doc.async="false";
						  	doc.loadXML(data);
						}				
						var x=doc.documentElement;	
						
						var count = 0;																
						$(x).find('INSURANCECOMPANY').each(function(index){								
							count = count + 1;
							var $INSURANCECOMPANY = $(this);
							var InsuranceCompanyID = $INSURANCECOMPANY.find('INSURANCECOMPANYID').text();	
							var InsuranceCompanyName = $INSURANCECOMPANY.find('INSURANCECOMPANYNAME').text();																						
							$("input[name='#trim(number)#InsuranceNameTBox']").val(InsuranceCompanyName);
							
							$($INSURANCECOMPANY).find('ADDRESS').each(function(index){											
								var $ADDRESS = $(this);
								var ADDRESSLINE1 = $ADDRESS.find('ADDRESSLINE1').text();	
								var ADDRESSLINE2 = $ADDRESS.find('ADDRESSLINE2').text();
								var CITY = $ADDRESS.find('CITY').text();	
								var STATEID = $ADDRESS.find('STATEID').text();	
								var ZIPCODE = $ADDRESS.find('ZIPCODE').text();													
								$("input[name='#trim(number)#SendToAddress1TBox']").val(ADDRESSLINE1);			
								$("input[name='#trim(number)#SendToAddress2TBox']").val(ADDRESSLINE2);												
								$("input[name='#trim(number)#SendToCityTBox']").val(CITY);		
								$("input[name='#trim(number)#SendToZipcodeTBox']").val(ZIPCODE);		
								$("select[name='#trim(number)#SendToStateTBox'] option[value=" + STATEID + "]").attr('selected', 'selected');					
							})
							$("input[name='#trim(number)#SendToAddress1TBox']").attr("disabled","disabled");			
							$("input[name='#trim(number)#SendToAddress2TBox']").attr("disabled","disabled");												
							$("input[name='#trim(number)#SendToCityTBox']").attr("disabled","disabled");		
							$("input[name='#trim(number)#SendToZipcodeTBox']").attr("disabled","disabled");		
							$("select[name='#trim(number)#SendToStateTBox']").attr("disabled","disabled");
							
							
							$($INSURANCECOMPANY).find('PHONE').each(function(index){											
								var $PHONE = $(this);
								var PHONETYPEID = $PHONE.find('PHONETYPEID').text();
								var PHONENUMBER = $PHONE.find('PHONENUMBER').text();	
								var PHONEEXTENSION = $PHONE.find('PHONEEXTENSION').text();		
								var FINALPHONENUMBEREXTENSION = PHONENUMBER + PHONEEXTENSION;								
								if(PHONETYPEID == 74){
									$("input[name='#trim(number)#PhoneNumberTBox']").val(formatPhoneUS_JS(FINALPHONENUMBEREXTENSION));		
								}	
								else if(PHONETYPEID == 87){//fax
									$("input[name='#trim(number)#FaxNumberTBox']").val(formatPhoneUS_JS(FINALPHONENUMBEREXTENSION));		
								};																												
							})	
							$("input[name='#trim(number)#PhoneNumberTBox']").attr("disabled","disabled");
							$("input[name='#trim(number)#FaxNumberTBox']").attr("disabled","disabled");																					
																			
						});														
					
					//ends the callback function.											
					});
					$.ajaxSetup({ cache: true }); 			 			
				});
				
			};
			
		</script>	
		
	</cfoutput>
	

