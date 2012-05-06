
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formname" default="">
	<cfset formname = attributes.formname>
	
	<cfparam name="attributes.recordid" default="">
	<cfset recordid = attributes.recordid>
	
	<cfparam name="attributes.tabstart" default="1">
	<cfset tabstart = attributes.tabstart>

	<cfparam name="attributes.VerificationRepFName" default="">
	<cfset VerificationRepFName = attributes.VerificationRepFName>

	<cfparam name="attributes.VerificationRepLName" default="">
	<cfset VerificationRepLName = attributes.VerificationRepLName>

	<cfparam name="attributes.VerificationDate" default="">
	<cfset VerificationDate = attributes.VerificationDate>
	
	<cfparam name="attributes.VerificationTime" default="">
	<cfset VerificationTime = attributes.VerificationTime>

	<cfparam name="attributes.VerificationHaveIns" default="-1">
	<cfset VerificationHaveIns = attributes.VerificationHaveIns>
					
	<cfparam name="attributes.VerificationHaveInsFromDate" default="">
	<cfset VerificationHaveInsFromDate = attributes.VerificationHaveInsFromDate>
		
	<cfparam name="attributes.VerificationHaveInsToDate" default="">
	<cfset VerificationHaveInsToDate = attributes.VerificationHaveInsToDate>
		
	<cfparam name="attributes.VerificationHaveDMECov" default="-1">
	<cfset VerificationHaveDMECov = attributes.VerificationHaveDMECov>
	
	<cfparam name="attributes.VerificationDeductible" default="-1">
	<cfset VerificationDeductible = attributes.VerificationDeductible>	
	
	<cfparam name="attributes.VerificationDeductibleAmount" default="">
	<cfset VerificationDeductibleAmount = attributes.VerificationDeductibleAmount>
	
	<cfparam name="attributes.VerificationDeductibleAmountMet" default="">
	<cfset VerificationDeductibleAmountMet = attributes.VerificationDeductibleAmountMet>
	
	<cfparam name="attributes.VerificationPPOPolicy" default="-1">
	<cfset VerificationPPOPolicy = attributes.VerificationPPOPolicy>
	
	<cfparam name="attributes.VerificationPercentagePayAfterDeductible" default="">
	<cfset VerificationPercentagePayAfterDeductible = attributes.VerificationPercentagePayAfterDeductible>
	
	<cfparam name="attributes.VerificationPriorAuth" default="-1">
	<cfset VerificationPriorAuth = attributes.VerificationPriorAuth>
	
	<cfparam name="attributes.VerificationAuthNumber" default="">
	<cfset VerificationAuthNumber = attributes.VerificationAuthNumber>
	
	<cfparam name="attributes.VerificationLifetimeBenefitMet" default="-1">
	<cfset VerificationLifetimeBenefitMet = attributes.VerificationLifetimeBenefitMet>
	
	<cfparam name="attributes.VerificationAuthPhoneNumber" default="">
	<cfset VerificationAuthPhoneNumber = attributes.VerificationAuthPhoneNumber>
	
	<cfparam name="attributes.VerificationMedicareSupplement" default="-1">
	<cfset VerificationMedicareSupplement = attributes.VerificationMedicareSupplement>
	
	<cfparam name="attributes.VerificationCoordinateBenefits" default="-1">
	<cfset VerificationCoordinateBenefits = attributes.VerificationCoordinateBenefits>
	
	<cfparam name="attributes.VerificationPaidMedicareDeductible" default="-1">
	<cfset VerificationPaidMedicareDeductible = attributes.VerificationPaidMedicareDeductible>
	
	<cfparam name="attributes.VerificationMedicaidPlanMQMB" default="-1">
	<cfset VerificationMedicaidPlanMQMB = attributes.VerificationMedicaidPlanMQMB>
	
	<cfparam name="attributes.VerificationMedicaidPlanQMB" default="-1">
	<cfset VerificationMedicaidPlanQMB = attributes.VerificationMedicaidPlanQMB>
	
	<cfparam name="attributes.VerificationMedicaidPlanTraditional" default="-1">
	<cfset VerificationMedicaidPlanTraditional = attributes.VerificationMedicaidPlanTraditional>							
	
	<cfparam name="attributes.VerificationTypeBasePlan" default="">
	<cfset VerificationTypeBasePlan = attributes.VerificationTypeBasePlan>
	
	<cfparam name="attributes.verificationID" default="">
	<cfset verificationID = attributes.verificationID>
	
	<cfset VerificationDateMM = "">
	<cfset VerificationDateDD = "">
	<cfset VerificationDateYY = "">	
	<cfset VerificationHaveInsFromDateMM = "">
	<cfset VerificationHaveInsFromDateDD = "">
	<cfset VerificationHaveInsFromDateYY = "">			
	<cfset VerificationHaveInsToDateMM = "">
	<cfset VerificationHaveInsToDateDD = "">
	<cfset VerificationHaveInsToDateYY = "">	
	
	<cfset verifications = "">
	<cfset showSubmit = true>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Javascripts needed for this page.                                              --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		
		<script language="JavaScript">
			
			
			function createViewVerificationNotes(instanceID){				
				objectNote=window.open('appObjectNote.cfm?objectid=11&instanceid=' + instanceID, 'objectNote', 'dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=600,height=350,left='+ newWindowGetX(600) +',top='+ newWindowGetY(350)); objectNote.focus(0);
			};
					
			function clearVerification(){
				document.all.VerificationPatientInsuranceID.value = '';
				document.all.VerificationRepFName.value = '';
				document.all.VerificationRepLName.value = '';
				document.all.VerificationDateMM.value = '';
				document.all.verificationDateDD.value = '';
				document.all.VerificationDateYY.value = '';
				document.all.VerificationTime.value = '';
				document.all.VerificationHaveInsYes.value = '';
				document.all.VerificationHaveInsNo.value = '';		
				document.all.VerificationHaveInsFromDateMM.value = '';
				document.all.VerificationHaveInsFromDateDD.value = '';
				document.all.VerificationHaveInsFromDateYY.value = '';
				document.all.VerificationHaveInsToDateMM.value = '';
				document.all.VerificationHaveInsToDateDD.value = '';
				document.all.VerificationHaveInsToDateYY.value = '';
				document.all.VerificationHaveDMECovYes.value = '';
				document.all.VerificationHaveDMECovNo.value = '';	
				document.all.VerificationDeductibleYes.value = '';
				document.all.VerificationDeductibleNo.value = '';	
				document.all.VerificationDeductibleAmount.value = '';
				document.all.VerificationDeductibleAmountMet.value = '';
				document.all.VerificationPPOPolicyYes.value = '';
				document.all.VerificationPPOPolicyNo.value = '';	
				document.all.VerificationPercentagePayAfterDeductible.value = '';
				document.all.VerificationPriorAuthYes.value = '';
				document.all.VerificationPriorAuthNo.value = '';
				document.all.VerificationAuthNumber.value = '';
				document.all.VerificationLifetimeBenefitMetYes.value = '';
				document.all.VerificationLifetimeBenefitMetNo.value = '';	
				document.all.VerificationAuthPhoneNumber.value = '';
				document.all.VerificationMedicareSupplementYes.value = '';
				document.all.VerificationMedicareSupplementNo.value = '';	
				document.all.VerificationCoordinateBenefitsYes.value = '';
				document.all.VerificationCoordinateBenefitsNo.value = '';
				document.all.VerificationPaidMedicareDeductibleYes.value = '';
				document.all.VerificationPaidMedicareDeductibleNo.value = '';	
				document.all.VerificationMedicaidPlanMQMB.value = '';
				document.all.VerificationMedicaidPlanQMB.value = '';
				document.all.VerificationMedicaidPlanTraditional.value = '';
				document.all.VerificationTypeBasePlan.value = '';	
				checkBoxRadio('', 'CheckUncheckPic_VerificationHaveIns', '');
				checkBoxRadio('', 'CheckUncheckPic_VerificationHaveDMECov', '');
				checkBoxRadio('', 'CheckUncheckPic_VerificationHaveDMECov', '');
				checkBoxRadio('', 'CheckUncheckPic_VerificationDeductible', '');
				checkBoxRadio('', 'CheckUncheckPic_VerificationDeductible', '');
				checkBoxRadio('', 'CheckUncheckPic_VerificationPPOPolicy', '');
				checkBoxRadio('', 'CheckUncheckPic_VerificationPPOPolicy', '');
				checkBoxRadio('', 'CheckUncheckPic_VerificationPriorAuth', '');
				checkBoxRadio('', 'CheckUncheckPic_VerificationPriorAuth', '');
				checkBoxRadio('', 'CheckUncheckPic_VerificationLifetimeBenefitMet', '');
				checkBoxRadio('', 'CheckUncheckPic_VerificationLifetimeBenefitMet', '');
				checkBoxRadio('', 'CheckUncheckPic_MedicareSupplement', '');
				checkBoxRadio('', 'CheckUncheckPic_MedicareSupplement', '');
				checkBoxRadio('', 'CheckUncheckPic_CoordinateBenefits', '');
				checkBoxRadio('', 'CheckUncheckPic_CoordinateBenefits', '');
				checkBoxRadio('', 'CheckUncheckPic_PaidMedicareDeductible', '');
				checkBoxRadio('', 'CheckUncheckPic_PaidMedicareDeductible', '');
				checkBoxRadio('', 'CheckUncheckPic_VerificationMedicaidPlan', '');
				checkBoxRadio('', 'CheckUncheckPic_VerificationMedicaidPlan', '');
				checkBoxRadio('', 'CheckUncheckPic_VerificationMedicaidPlan', '');
				resetVerificationButton();	
				<cfif IsNumeric(verificationID)>
					verificationNotes.style.display = 'none';
				</cfif>
			};		
			
		</script>
	
	</cfoutput>

<!-------------------------------------------------------------------------------------->
<!--- We want this object so we can get the verifications                            --->
<!-------------------------------------------------------------------------------------->	
	<cfif IsNumeric(recordID) OR IsNumeric(verificationID)>		
		<cfset request.VerificationPIC = CreateObject("component","com.common.VerificationPIC")>	
	</cfif>
	

<!-------------------------------------------------------------------------------------->
<!--- If a verificationID has been sent in set the variables to show.                --->
<!-------------------------------------------------------------------------------------->
	<cfif IsNumeric(verificationID)>
		<cfset request.VerificationPIC.init(verificationID)>		
		<cfset VerificationRepFName = request.VerificationPIC.getVerificationRepFName()>
		<cfset VerificationRepLName = request.VerificationPIC.getVerificationRepLName()>
		<cfset VerificationTime = request.VerificationPIC.getVerificationTime()>	
		<cfset VerificationDate = request.VerificationPIC.getVerificationDate()>		
		<cfif request.VerificationPIC.getVerificationHaveIns() NEQ ""><cfset VerificationHaveIns = request.VerificationPIC.getVerificationHaveIns()></cfif>			
		<cfset VerificationHaveInsFromDate = request.VerificationPIC.getVerificationHaveInsFromDate()>
		<cfset VerificationHaveInsToDate = request.VerificationPIC.getVerificationHaveInsToDate()>
		<cfif request.VerificationPIC.getVerificationHaveDMECov() NEQ ""><cfset VerificationHaveDMECov = request.VerificationPIC.getVerificationHaveDMECov()></cfif>
		<cfif request.VerificationPIC.getVerificationDeductible() NEQ ""><cfset VerificationDeductible = request.VerificationPIC.getVerificationDeductible()></cfif>
		<cfset VerificationDeductibleAmount = request.VerificationPIC.getVerificationDeductibleAmount()>
		<cfset VerificationDeductibleAmountMet = request.VerificationPIC.getVerificationDeductibleAmountMet()>
		<cfif request.VerificationPIC.getVerificationPPOPolicy() NEQ ""><cfset VerificationPPOPolicy = request.VerificationPIC.getVerificationPPOPolicy()></cfif>
		<cfset VerificationPercentagePayAfterDeductible = request.VerificationPIC.getVerificationPercentagePayAfterDeductible()>
		<cfif request.VerificationPIC.getVerificationPriorAuth() NEQ ""><cfset VerificationPriorAuth = request.VerificationPIC.getVerificationPriorAuth()></cfif>
		<cfset VerificationAuthNumber = request.VerificationPIC.getVerificationAuthNumber()>
		<cfif request.VerificationPIC.getVerificationLifetimeBenefitMet() NEQ ""><cfset VerificationLifetimeBenefitMet = request.VerificationPIC.getVerificationLifetimeBenefitMet()></cfif>
		<cfset VerificationAuthPhoneNumber = request.VerificationPIC.getVerificationAuthPhoneNumber()>
		<cfif request.VerificationPIC.getVerificationMedicareSupplement() NEQ ""><cfset VerificationMedicareSupplement = request.VerificationPIC.getVerificationMedicareSupplement()></cfif>
		<cfif request.VerificationPIC.getVerificationCoordinateBenefits() NEQ ""><cfset VerificationCoordinateBenefits = request.VerificationPIC.getVerificationCoordinateBenefits()></cfif>
		<cfif request.VerificationPIC.getVerificationPaidMedicareDeductible() NEQ ""><cfset VerificationPaidMedicareDeductible = request.VerificationPIC.getVerificationPaidMedicareDeductible()></cfif>
		<cfif request.VerificationPIC.getVerificationMedicaidPlan() NEQ "">
			<cfset VerificationMedicaidPlanMQMB = request.VerificationPIC.getVerificationMedicaidPlan()>
			<cfset VerificationMedicaidPlanQMB = request.VerificationPIC.getVerificationMedicaidPlan()>
			<cfset VerificationMedicaidPlanTraditional = request.VerificationPIC.getVerificationMedicaidPlan()>
		</cfif>	
		<cfset VerificationTypeBasePlan = request.VerificationPIC.getVerificationTypeBasePlan()>
		<cfset showSubmit = false>
	</cfif>
		
	
<!-------------------------------------------------------------------------------------->
<!--- Find out if this record has any verifications to show in history               --->
<!-------------------------------------------------------------------------------------->
	<cfif IsNumeric(recordID)>		
		
		<cfset verifications = request.VerificationPIC.getVerificationPatientInsuranceQuery(picID: recordid, fields: "VerificationHaveInsFromDate, VerificationHaveInsToDate, UsersID, VerificationRepFName, VerificationRepLName, VerificationTime, VerificationDate, DateCreated, VerificationPatientInsuranceID")>	
		
		<cfoutput>
			<script language="JavaScript">
				function swapTables(){				
					if(tbl_verificationNew.style.display == "none"){				
						tbl_verificationNew.style.display = "inline";
						tbl_verificationHistory.style.display = "none";
					}
					else{
						tbl_verificationNew.style.display = "none";
						tbl_verificationHistory.style.display = "inline";
					};				
				};		
			</script>
		</cfoutput>
					
	</cfif>		
	
	
		
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<input type="Hidden" name="VerificationPatientInsuranceID" value="#trim(verificationID)#"> 
		
		<table id="tbl_verificationNew" style="display: 'inline';" cellpadding="4" cellspacing="0" border="0" align="center">	  
		  
			<tr>
			   	<td bgcolor="DCE3EB" style="border-Top: 1px solid; border-right: 0px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
					<cfif showSubmit>
						<cfset displayButton = "inline">
						<cfset displaybuttonWords = "Save Verification">
					<cfelse>
						<cfset displayButton = "none">
						<cfset displaybuttonWords = "Update Verification">
					</cfif>	
					<cf_gcSubmitButton value="#trim(displaybuttonWords)#" display="inline"><!---#trim(displayButton)#--->
				</td>
			    <td bgcolor="DCE3EB" align="center" colspan="5" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">
					<font face="Arial" size="2"><strong>INSURANCE&nbsp;VERIFICATION</strong></font>
					<cfif IsQuery(verifications)>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfif verifications.RecordCount GTE 1><span onclick="swapTables();" class="siteLabel" style="cursor:hand"><u>History</u></span></cfif>&nbsp;&nbsp;&nbsp;<span onclick="clearVerification();" class="siteLabel" style="cursor:hand"><u>New&nbsp;Verification</u></span><cfif IsNumeric(verificationID)>&nbsp;&nbsp;<span id="verificationNotes" class=sitelabel style=cursor:hand onclick=createViewVerificationNotes(#trim(verificationID)#);><u>View/Add&nbsp;Notes</u></span></cfif></cfif>
				</td>								
			</tr>	
		   		
			<script language="JavaScript">
				function resetVerificationButton(){
					document.all.SubmitButton#trim(submitButtonID)#.style.display='inline'; 
					spSubmitButton#trim(submitButtonID)#.innerText='';			
				};
			</script>
			
			<cfif IsDate(VerificationDate)>
				<cfset VerificationDateMM = NumberFormat(Month(VerificationDate), "00")>
				<cfset VerificationDateDD = NumberFormat(Day(VerificationDate), "00")>
				<cfset VerificationDateYY = Year(VerificationDate)>			
			</cfif>		 
			<tr>
				<td nowrap id="td_VerificationRepName" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">
					REP&nbsp;FIRST:&nbsp;<input tabindex="#trim(tabStart)#" type="Text" size="15" maxlength="30" onChange="capitalizeMe(this)" name="VerificationRepFName" value="#trim(VerificationRepFName)#" class="siteTextBox">
					&nbsp;LAST:&nbsp;<input tabindex="#evaluate(trim(tabStart) + 1)#" type="Text" size="15" maxlength="30" onChange="capitalizeMe(this)" name="VerificationRepLName" value="#trim(VerificationRepLName)#" class="siteTextBox">
				</td>
  				<td id="td_VerificationDate" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;DATE:&nbsp;<input tabindex="#evaluate(trim(tabStart) + 1)#" type="Text" name="VerificationDateMM" onblur="checkMonth_JS(this);" value="#trim(VerificationDateMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">&nbsp;/&nbsp;<input tabindex="#evaluate(trim(tabStart) + 1)#" type="Text" name="verificationDateDD" onblur="checkDay_JS(this);" value="#trim(VerificationDateDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">&nbsp;/&nbsp;<input tabindex="#evaluate(trim(tabStart) + 1)#" type="Text" name="VerificationDateYY" onblur="checkYear_JS(this);" value="#trim(VerificationDateYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox"></td>
				<td id="td_VerificationTime" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">&nbsp;TIME:&nbsp;<input tabindex="#evaluate(trim(tabStart) + 1)#" type="Text" size="10" maxlength="10" name="VerificationTime" value="#trim(VerificationTime)#" class="siteTextBox">&nbsp;<span class="copyGreySmall">(09:46 PM)</span></td>
			</tr>
			
			
			<cfif IsDate(VerificationHaveInsFromDate)>
				<cfset VerificationHaveInsFromDateMM = NumberFormat(Month(VerificationHaveInsFromDate), "00")>
				<cfset VerificationHaveInsFromDateDD = NumberFormat(Day(VerificationHaveInsFromDate), "00")>
				<cfset VerificationHaveInsFromDateYY = Year(VerificationHaveInsFromDate)>			
			</cfif>
			<cfif IsDate(VerificationHaveInsToDate)>
				<cfset VerificationHaveInsToDateMM = NumberFormat(Month(VerificationHaveInsToDate), "00")>
				<cfset VerificationHaveInsToDateDD = NumberFormat(Day(VerificationHaveInsToDate), "00")>
				<cfset VerificationHaveInsToDateYY = Year(VerificationHaveInsToDate)>			
			</cfif>			
			<input type="Hidden" name="VerificationHaveInsYes" value="">
			<input type="Hidden" name="VerificationHaveInsNo" value="">		
			<tr>														   
  				<td id="td_VerificationHaveIns" colspan="6" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
					&nbsp;DOES&nbsp;THE&nbsp;PATIENT&nbsp;HAVE&nbsp;INSURANCE&nbsp;WITH&nbsp;YOU?:&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_VerificationHaveIns" alt="VerificationHaveInsYes" onclick="checkBoxRadio('', 'CheckUncheckPic_VerificationHaveIns', 'VerificationHaveInsYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_VerificationHaveIns" alt="VerificationHaveInsNo" onclick="checkBoxRadio('', 'CheckUncheckPic_VerificationHaveIns', 'VerificationHaveInsNo')">&nbsp;NO&nbsp;&nbsp;&nbsp;&nbsp;EFFECTIVE&nbsp;DATES&nbsp;OF&nbsp;INSURANCE:&nbsp;&nbsp;FROM:<input tabindex="#evaluate(trim(tabStart) + 1)#" type="Text" name="VerificationHaveInsFromDateMM" onblur="checkMonth_JS(this);" value="#trim(VerificationHaveInsFromDateMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">&nbsp;/&nbsp;<input tabindex="#evaluate(trim(tabStart) + 1)#" type="Text" name="VerificationHaveInsFromDateDD" onblur="checkDay_JS(this);" value="#trim(VerificationHaveInsFromDateDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">&nbsp;/&nbsp;<input tabindex="#evaluate(trim(tabStart) + 1)#" type="Text" name="VerificationHaveInsFromDateYY" onblur="checkYear_JS(this);" value="#trim(VerificationHaveInsFromDateYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox">&nbsp;&nbsp;TO:&nbsp;<input tabindex="#evaluate(trim(tabStart) + 1)#" type="Text" name="VerificationHaveInsToDateMM" onblur="checkMonth_JS(this);" value="#trim(VerificationHaveInsToDateMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">&nbsp;/&nbsp;<input tabindex="#evaluate(trim(tabStart) + 1)#" type="Text" name="VerificationHaveInsToDateDD" onblur="checkDay_JS(this);" value="#trim(VerificationHaveInsToDateDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">&nbsp;/&nbsp;<input tabindex="#evaluate(trim(tabStart) + 1)#" type="Text" name="VerificationHaveInsToDateYY" onblur="checkYear_JS(this);" value="#trim(VerificationHaveInsToDateYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox">
				</td>
			</tr>
			
			<script language="JavaScript">	
				if(#trim(VerificationHaveIns)# == 0){checkBoxRadio('', 'CheckUncheckPic_VerificationHaveIns', 'VerificationHaveInsYes')}				
				else if(#trim(VerificationHaveIns)# == 1){checkBoxRadio('', 'CheckUncheckPic_VerificationHaveIns', 'VerificationHaveInsNo')}
			</script>	
	
	
			<input type="Hidden" name="VerificationHaveDMECovYes" value="">
			<input type="Hidden" name="VerificationHaveDMECovNo" value="">	
			<input type="Hidden" name="VerificationDeductibleYes" value="">
			<input type="Hidden" name="VerificationDeductibleNo" value="">	
			<tr>														   
				<td id="td_VerificationHaveDMECov" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;DOES&nbsp;THE&nbsp;PATIENT&nbsp;HAVE&nbsp;DME&nbsp;COVERAGE?:&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_VerificationHaveDMECov" alt="VerificationHaveDMECovYes" onclick="checkBoxRadio('', 'CheckUncheckPic_VerificationHaveDMECov', 'VerificationHaveDMECovYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_VerificationHaveDMECov" alt="VerificationHaveDMECovNo" onclick="checkBoxRadio('', 'CheckUncheckPic_VerificationHaveDMECov', 'VerificationHaveDMECovNo')">&nbsp;NO</td>
				<td id="td_VerificationDeductible" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;IS&nbsp;THERE&nbsp;A&nbsp;DEDUCTIBLE?:&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_VerificationDeductible" alt="VerificationDeductibleYes" onclick="checkBoxRadio('', 'CheckUncheckPic_VerificationDeductible', 'VerificationDeductibleYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_VerificationDeductible" alt="VerificationDeductibleNo" onclick="checkBoxRadio('', 'CheckUncheckPic_VerificationDeductible', 'VerificationDeductibleNo')">&nbsp;NO</td>
			</tr>				
			<script language="JavaScript">	
				if(#trim(VerificationHaveDMECov)# == 0){checkBoxRadio('', 'CheckUncheckPic_VerificationHaveDMECov', 'VerificationHaveDMECovYes')}				
		   		else if(#trim(VerificationHaveDMECov)# == 1){checkBoxRadio('', 'CheckUncheckPic_VerificationHaveDMECov', 'VerificationHaveDMECovNo')}

				if(#trim(VerificationDeductible)# == 0){checkBoxRadio('', 'CheckUncheckPic_VerificationDeductible', 'VerificationDeductibleYes')}
				else if(#trim(VerificationDeductible)# == 1){checkBoxRadio('', 'CheckUncheckPic_VerificationDeductible', 'VerificationDeductibleNo')}
			</script>		
				
			<tr>														   
				<td id="td_VerificationDeductibleAmount" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;AMOUNT&nbsp;OF&nbsp;DEDUCTIBLE:&nbsp;<input tabindex="#evaluate(trim(tabStart) + 1)#" type="Text" size="10" maxlength="10" name="VerificationDeductibleAmount" value="#trim(VerificationDeductibleAmount)#" class="siteTextBox"></td>
				<td id="td_VerificationDeductibleAmountMet" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;HOW&nbsp;MUCH&nbsp;OF&nbsp;DEDUCTIBLE&nbsp;HAS&nbsp;BEEN&nbsp;MET?:&nbsp;<input tabindex="#evaluate(trim(tabStart) + 1)#" type="Text" size="10" maxlength="10" name="VerificationDeductibleAmountMet" value="#trim(VerificationDeductibleAmountMet)#" class="siteTextBox"></td>
			</tr>

			<input type="Hidden" name="VerificationPPOPolicyYes" value="">
			<input type="Hidden" name="VerificationPPOPolicyNo" value="">	
			<tr>														   
				<td id="td_VerificationPercentagePayAfterDeductible" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;%&nbsp;OF&nbsp;PAY&nbsp;AFTER&nbsp;DEDUCTABLE:&nbsp;<input tabindex="#evaluate(trim(tabStart) + 1)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" type="Text" size="10" maxlength="10" name="VerificationPercentagePayAfterDeductible" value="#trim(VerificationPercentagePayAfterDeductible)#" class="siteTextBox"></td>
			  	<td id="td_VerificationPPOPolicy" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;IS&nbsp;THIS&nbsp;A&nbsp;PPO/HMO&nbsp;POLICY?:&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_VerificationPPOPolicy" alt="VerificationPPOPolicyYes" onclick="checkBoxRadio('', 'CheckUncheckPic_VerificationPPOPolicy', 'VerificationPPOPolicyYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_VerificationPPOPolicy" alt="VerificationPPOPolicyNo" onclick="checkBoxRadio('', 'CheckUncheckPic_VerificationPPOPolicy', 'VerificationPPOPolicyNo')">&nbsp;NO</td>
			</tr>
			<script language="JavaScript">	
				if(#trim(VerificationPPOPolicy)# == 0){checkBoxRadio('', 'CheckUncheckPic_VerificationPPOPolicy', 'VerificationPPOPolicyYes')}				
				else if(#trim(VerificationPPOPolicy)# == 1){checkBoxRadio('', 'CheckUncheckPic_VerificationPPOPolicy', 'VerificationPPOPolicyNo')}
			</script>
			
			<input type="Hidden" name="VerificationPriorAuthYes" value="">
			<input type="Hidden" name="VerificationPriorAuthNo" value="">	
			<tr>														   
				<td id="td_VerificationPriorAuthorization" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;IS&nbsp;PRIOR&nbsp;AUTHORIZATION&nbsp;NECESSARY?:&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_VerificationPriorAuth" alt="VerificationPriorAuthYes" onclick="checkBoxRadio('', 'CheckUncheckPic_VerificationPriorAuth', 'VerificationPriorAuthYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_VerificationPriorAuth" alt="VerificationPriorAuthNo" onclick="checkBoxRadio('', 'CheckUncheckPic_VerificationPriorAuth', 'VerificationPriorAuthNo')">&nbsp;NO</td>
				<td id="td_VerificationAuthNumber" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;Auth&nbsp;##:&nbsp;<input tabindex="#evaluate(trim(tabStart) + 1)#" type="Text" size="20" maxlength="20" name="VerificationAuthNumber" value="#trim(VerificationAuthNumber)#" class="siteTextBox"></td>
			</tr>
			<script language="JavaScript">	
				if(#trim(VerificationPriorAuth)# == 0){checkBoxRadio('', 'CheckUncheckPic_VerificationPriorAuth', 'VerificationPriorAuthYes')}				
				else if(#trim(VerificationPriorAuth)# == 1){checkBoxRadio('', 'CheckUncheckPic_VerificationPriorAuth', 'VerificationPriorAuthNo')}
			</script>

			
			<input type="Hidden" name="VerificationLifetimeBenefitMetYes" value="">
			<input type="Hidden" name="VerificationLifetimeBenefitMetNo" value="">	
			<tr>														   
			 	<td id="td_VerificationAuthPhoneNumber" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;CONTACT&nbsp;NUMBER&nbsp;FOR&nbsp;AUTH:&nbsp;<input tabindex="#evaluate(trim(tabStart) + 1)#" type="Text" size="25" maxlength="24" name="VerificationAuthPhoneNumber" value="#request.formatPhoneUS(trim(VerificationAuthPhoneNumber))#" class="siteTextBox" onkeyup="this.value=formatPhoneUS_JS(this.value);"></td>
			 	<td id="td_VerificationLifetimeBenefitMet" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;HAS&nbsp;LIFETIME&nbsp;BENEFIT&nbsp;BEEN&nbsp;MET?:&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_VerificationLifetimeBenefitMet" alt="VerificationLifetimeBenefitMetYes" onclick="checkBoxRadio('', 'CheckUncheckPic_VerificationLifetimeBenefitMet', 'VerificationLifetimeBenefitMetYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_VerificationLifetimeBenefitMet" alt="VerificationLifetimeBenefitMetNo" onclick="checkBoxRadio('', 'CheckUncheckPic_VerificationLifetimeBenefitMet', 'VerificationLifetimeBenefitMetNo')">&nbsp;NO</td>
			</tr>
			<script language="JavaScript">	
				if(#trim(VerificationLifetimeBenefitMet)# == 0){checkBoxRadio('', 'CheckUncheckPic_VerificationLifetimeBenefitMet', 'VerificationLifetimeBenefitMetYes')}				
				else if(#trim(VerificationLifetimeBenefitMet)# == 1){checkBoxRadio('', 'CheckUncheckPic_VerificationLifetimeBenefitMet', 'VerificationLifetimeBenefitMetNo')}
			</script>
					

			<input type="Hidden" name="VerificationMedicareSupplementYes" value="">
			<input type="Hidden" name="VerificationMedicareSupplementNo" value="">	
			<input type="Hidden" name="VerificationCoordinateBenefitsYes" value="">
			<input type="Hidden" name="VerificationCoordinateBenefitsNo" value="">
			<input type="Hidden" name="VerificationPaidMedicareDeductibleYes" value="">
			<input type="Hidden" name="VerificationPaidMedicareDeductibleNo" value="">	
			<tr>														   
				<td id="td_MedicareSupplement" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;MEDICARE&nbsp;SUPPLEMENT:&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_MedicareSupplement" alt="VerificationMedicareSupplementYes" onclick="checkBoxRadio('', 'CheckUncheckPic_MedicareSupplement', 'VerificationMedicareSupplementYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_MedicareSupplement" alt="VerificationMedicareSupplementNo" onclick="checkBoxRadio('', 'CheckUncheckPic_MedicareSupplement', 'VerificationMedicareSupplementNo')">&nbsp;NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;COORDINATE&nbsp;BENEFITS:&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_CoordinateBenefits" alt="VerificationCoordinateBenefitsYes" onclick="checkBoxRadio('', 'CheckUncheckPic_CoordinateBenefits', 'VerificationCoordinateBenefitsYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_CoordinateBenefits" alt="VerificationCoordinateBenefitsNo" onclick="checkBoxRadio('', 'CheckUncheckPic_CoordinateBenefits', 'VerificationCoordinateBenefitsNo')">&nbsp;NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PAID&nbsp;MEDICARE&nbsp;DEDUCTIBLE:&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_PaidMedicareDeductible" alt="VerificationPaidMedicareDeductibleYes" onclick="checkBoxRadio('', 'CheckUncheckPic_PaidMedicareDeductible', 'VerificationPaidMedicareDeductibleYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_PaidMedicareDeductible" alt="VerificationPaidMedicareDeductibleNo" onclick="checkBoxRadio('', 'CheckUncheckPic_PaidMedicareDeductible', 'VerificationPaidMedicareDeductibleNo')">&nbsp;NO								
				</td>
			</tr>
				
			<script language="JavaScript">	
				if(#trim(VerificationMedicareSupplement)# == 0){checkBoxRadio('', 'CheckUncheckPic_MedicareSupplement', 'VerificationMedicareSupplementYes')}				
				else if(#trim(VerificationMedicareSupplement)# == 1){checkBoxRadio('', 'CheckUncheckPic_MedicareSupplement', 'VerificationMedicareSupplementNo')};
				
				if(#trim(VerificationCoordinateBenefits)# == 0){checkBoxRadio('', 'CheckUncheckPic_CoordinateBenefits', 'VerificationCoordinateBenefitsYes')}				
				else if(#trim(VerificationCoordinateBenefits)# == 1){checkBoxRadio('', 'CheckUncheckPic_CoordinateBenefits', 'VerificationCoordinateBenefitsNo')};
				
				if(#trim(VerificationPaidMedicareDeductible)# == 0){checkBoxRadio('', 'CheckUncheckPic_PaidMedicareDeductible', 'VerificationPaidMedicareDeductibleYes')}				
				else if(#trim(VerificationPaidMedicareDeductible)# == 1){checkBoxRadio('', 'CheckUncheckPic_PaidMedicareDeductible', 'VerificationPaidMedicareDeductibleNo')}
			</script>	
										
			<input type="Hidden" name="VerificationMedicaidPlanMQMB" value="">
			<input type="Hidden" name="VerificationMedicaidPlanQMB" value="">
			<input type="Hidden" name="VerificationMedicaidPlanTraditional" value="">							
			<tr>														   
				<td id="td_VerificationTypeBasePlan" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;MEDICAID&nbsp;PLAN:&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_VerificationMedicaidPlan" alt="VerificationMedicaidPlanMQMB" onclick="checkBoxRadio('', 'CheckUncheckPic_VerificationMedicaidPlan', 'VerificationMedicaidPlanMQMB')">&nbsp;MQMB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_VerificationMedicaidPlan" alt="VerificationMedicaidPlanQMB" onclick="checkBoxRadio('', 'CheckUncheckPic_VerificationMedicaidPlan', 'VerificationMedicaidPlanQMB')">&nbsp;QMB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img tabindex="#evaluate(trim(tabStart) + 1)#" src="images/Checkbox1.gif" name="CheckUncheckPic_VerificationMedicaidPlan" alt="VerificationMedicaidPlanTraditional" onclick="checkBoxRadio('', 'CheckUncheckPic_VerificationMedicaidPlan', 'VerificationMedicaidPlanTraditional')">&nbsp;TRADITIONAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**&nbsp;TYPE&nbsp;OF&nbsp;BASE&nbsp;PLAN:&nbsp;<input tabindex="#evaluate(trim(tabStart) + 1)#" type="Text" name="VerificationTypeBasePlan" value="#trim(VerificationTypeBasePlan)#" class="siteTextBox" size="35" maxlength="49"></td>
			</tr>	
			
			<script language="JavaScript">	
				if(#trim(VerificationMedicaidPlanMQMB)# == 0){checkBoxRadio('', 'CheckUncheckPic_VerificationMedicaidPlan', 'VerificationMedicaidPlanMQMB')}				
				else if(#trim(VerificationMedicaidPlanQMB)# == 1){checkBoxRadio('', 'CheckUncheckPic_VerificationMedicaidPlan', 'VerificationMedicaidPlanQMB')}
				else if(#trim(VerificationMedicaidPlanTraditional)# == 2){checkBoxRadio('', 'CheckUncheckPic_VerificationMedicaidPlan', 'VerificationMedicaidPlanTraditional')}
			</script>			   
		   
			<tr>
	        	<td colspan="6" class="siteLabel">&nbsp;</td>
	       	</tr>	
		
		</table> 		
		
		<cfif IsQuery(verifications) AND verifications.RecordCount GTE 1>		
			<table id="tbl_verificationHistory" style="display: 'none';" cellpadding="4" cellspacing="0" border="0" align="center">
				<tr>			   	
				    <td bgcolor="DCE3EB" align="center" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
						<font face="Arial" size="2"><strong>INSURANCE&nbsp;VERIFICATION&nbsp;HISTORY</strong></font><cfif IsQuery(verifications)>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span onclick="clearVerification();swapTables();" class="siteLabel" style="cursor:hand"><u>New&nbsp;Verification</u></span></cfif>
					</td>											
				</tr>
				<cfif IsQuery(verifications)>
					<tr>			   	
					    <td class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
							<table align="center" cellpadding="6" cellspacing="0" border="0">
								<tr>					
									<td class="siteLabel" align="center"><strong>Date Verified</strong></td>
									<td class="siteLabel" align="center"><strong>Time Verified</strong></td>
									<td class="siteLabel" align="center"><strong>Verified By</strong></td>
									<td class="siteLabel" align="center"><strong>Rep Name</strong></td>
									<td class="siteLabel" align="center"><strong>Effective Date From</strong></td>
									<td class="siteLabel" align="center"><strong>Effective Date To</strong></td>
								</tr>
								<!---<cfloop query="verifications">
									<cfquery name="getUsersName" datasource="#trim(request.datasource)#">
										SELECT CONCAT(FName, ' ', LName) AS Fullname 
										FROM view_UserAccountParameters 
										WHERE UsersID = #trim(UsersID)#
									</cfquery>									
									<tr onclick="showVerification(#trim(VerificationPatientInsuranceID)#);" style="cursor:hand" onmouseover="this.style.backgroundColor='DCE3EB'" onmouseout="this.style.backgroundColor='FFFFFF'">
										<td class="siteLabel">#DateFormat(VerificationDate, "MM/DD/YYYY")#</td>
										<td class="siteLabel" align="center">#trim(VerificationTime)#</td>
										<td class="siteLabel">#getUsersName.Fullname#</td>
										<td class="siteLabel">#VerificationRepFName# #VerificationRepLName#</td>	
										<td class="siteLabel" align="center"><cfif IsDate(VerificationHaveInsFromDate)>#DateFormat(VerificationHaveInsFromDate, "MM/DD/YYYY")#</cfif></td>
										<td class="siteLabel" align="center"><cfif IsDate(VerificationHaveInsToDate)>#DateFormat(VerificationHaveInsToDate, "MM/DD/YYYY")#</cfif></td>							
									</tr>	
								</cfloop>--->
							</table>
						</td>
					</tr>	
				</cfif>
				
				<tr><td><img src="images/transparent.gif" width="750" height="2" border="0"></td></tr>	
			</table>		
		</cfif>
		
		
	</cfoutput>
	
	