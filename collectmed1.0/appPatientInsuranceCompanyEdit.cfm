<!---- appPatientInsuranceCompanyEdit.cfm ---->





<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.patientID" default="">
	<cfset patientID = attributes.patientID>
	
	<cfif IsDefined("form.patientID") AND form.patientID NEQ "">
		<cfset patientID = form.patientID>
	<cfelseif IsDefined("url.patientID") AND url.patientID NEQ "">
		<cfset patientID = url.patientID>	
	</cfif>	
	
	<cfparam name="attributes.picID" default="">
	<cfset InsuranceCompanyID = attributes.picID>
	
	<cfif IsDefined("form.picID") AND form.picID NEQ "">
		<cfset InsuranceCompanyID = form.picID>
	<cfelseif IsDefined("url.picID") AND url.picID NEQ "">
		<cfset InsuranceCompanyID = url.picID>	
	</cfif>
	
	<cfparam name="attributes.recordID" default="">
	<cfset recordID = attributes.recordID>
	
	<cfif IsDefined("form.recordID") AND form.recordID NEQ "">
		<cfset recordID = form.recordID>
	<cfelseif IsDefined("url.recordID") AND url.recordID NEQ "">
		<cfset recordID = url.recordID>	
	</cfif>	
	
	<cfparam name="attributes.verificationID" default="">
	<cfset verificationID = attributes.verificationID>
	
	<cfif IsDefined("form.verificationID") AND form.verificationID NEQ "">
		<cfset verificationID = form.verificationID>
	<cfelseif IsDefined("url.verificationID") AND url.verificationID NEQ "">
		<cfset verificationID = url.verificationID>	
	</cfif>
	
	<cfset  PolicyHoldersDOBMM = "">
	<cfset  PolicyHoldersDOBDD = "">
	<cfset  PolicyHoldersDOBYY = "">


	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="PatientID,InsuranceCompanyID"
		fieldnames="Patient ID, Insurance Company ID">
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Get the information we need for this page.                                     --->
<!-------------------------------------------------------------------------------------->		
	<cfquery name="getPIC" datasource="#trim(request.datasource)#">
		SELECT pic.recordID AS picRecordID, pic.InsuranceCompanyID, pic.PrimSecTer, pic.PolicyNumber, pic.PolicyHoldersFirstName, pic.PolicyHoldersLastName, 
		pic.PolicyHoldersMiddleInitial, pic.PolicyHoldersDOB, IFNULL(pic.PolicyHoldersSex, -1) AS PolicyHoldersSex, pic.PolicyHoldersAddressLine1, 
		pic.PolicyHoldersAddressLine2, pic.PolicyHoldersCity, pic.PolicyHoldersStateID, pic.PolicyHoldersZipCode, 
		pic.PolicyHoldersPhone, pic.PolicyHoldersEmployerSchoolName, 
		pic.PolicyHoldersEffectiveDateFrom, pic.PolicyHoldersEffectiveDateTo, pic.GroupNumber, pic.GroupName, IFNULL(pic.Relationship, -1) AS Relationship, 
		pic.Deductible, pic.PayPercentage, 
		ic.InsuranceCompanyName, ic.InsuranceCompanyDBA, ic.OCNANumber, ic.InsuranceCompanyURL, ic.EntityID AS icEntityID
		FROM patientinsurancecompany pic
		INNER JOIN insurancecompany ic ON pic.InsuranceCompanyID = ic.InsuranceCompanyID
		WHERE pic.patientID = #trim(patientID)# AND pic.recordID = #trim(picID)#		
	</cfquery>	
	
	
		
<!-------------------------------------------------------------------------------------->
<!--- Javascripts needed for this page.                                              --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<script language="JavaScript">
		
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
			
			function checkSex(mf){										
				if((event.type == "keydown" || event.type == "keypress") && (event.keyCode=="32" || event.keyCode=="96")){									
					if(mf == 0){
						checkBoxRadio('td_patientSex', 'CheckUncheckPic_Sex', 'PolicyHoldersSexMale');											
					}
					else if(mf == 1){
						checkBoxRadio('td_patientSex', 'CheckUncheckPic_Sex', 'PolicyHoldersSexFemale');
					};	
					window.event.returnValue = false;						
				};									
			};
			
			function showVerification(id){					
				window.location = 'appPatientInsuranceCompanyEdit.cfm?patientid=#trim(patientID)#&picid=#trim(InsuranceCompanyID)#&ev=1&verificationid=' + id; 
			}
		
		</script>
		
	</cfoutput>			
	
	
		
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<style>	
			body{ 
				font-family:arial, helvetica, sans-serif;
				background-color:##FFFFFF;					
			} 
		</style>	
		
		<table cellpadding="4" cellspacing="8" border="0" align="center">			
						
			<tr id="policyInformation">
				<td width="100%">			
						
					<table cellpadding="4" cellspacing="0" border="0" align="center" width="100%">						
						
						<form name="policyForm" action="appPatientInsuranceCompanyEditProcess.cfm" method="post"> 	
							<input type="Hidden" name="formname" value="policy">
							<input type="Hidden" name="PatientID" value="#trim(PatientID)#">
							<input type="Hidden" name="RecordID" value="#trim(getPIC.picRecordID)#">
							<input type="Hidden" name="icID" value="#trim(getPIC.insuranceCompanyID)#">
							<tr>
								<td bgcolor="c0c0c0" style="border-Top: 1px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">
									<cf_gcSubmitButton value="Save Policy Changes">
								</td>
								<td bgcolor="c0c0c0" align="center" colspan="5" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">
									<font face="Arial" size="2"><strong>POLICY&nbsp;INFORMATION</strong></font>
								</td>										
							</tr>
							<tr>	        	
							   	<td id="td_PolicyNumberTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">
									<strong>&nbsp;POLICY&nbsp;##:&nbsp;</strong>
									<!---<cfif trim(getPIC.PolicyNumber) EQ "">--->
										<input tabindex="355" type="Text" size="45" maxlength="35" name="PolicyNumberTBox" value="#trim(getPIC.PolicyNumber)#" class="siteTextBox">
									<!---<cfelse>
										#trim(getPIC.PolicyNumber)#<input type="Hidden" name="PolicyNumberTBox" value="">
									</cfif>	--->
								</td>
								<td id="td_GroupNumberTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;GROUP&nbsp;##:&nbsp;<input tabindex="5" type="Text" size="45" maxlength="35" name="GroupNumberTBox" value="#trim(getPIC.GroupNumber)#" class="siteTextBox"></td>
					       	</tr>
							
							<cfif IsDate(getPIC.PolicyHoldersDOB)>
								<cfset  PolicyHoldersDOBMM = NumberFormat(MONTH(getPIC.PolicyHoldersDOB), "00")>
								<cfset  PolicyHoldersDOBDD = NumberFormat(DAY(getPIC.PolicyHoldersDOB), "00")>
								<cfset  PolicyHoldersDOBYY = YEAR(getPIC.PolicyHoldersDOB)>						
							</cfif>
							<input type="Hidden" name="PolicyHoldersSexMale" value="">
							<input type="Hidden" name="PolicyHoldersSexFemale" value="">	
							<tr>
					        	<td id="td_PolicyHolderNameTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">&nbsp;HOLDERS&nbsp;FIRST:&nbsp;<input tabindex="10" type="Text" size="15" maxlength="30" onChange="capitalizeMe(this)" name="PolicyHoldersFirstName" value="#trim(getPIC.PolicyHoldersFirstName)#" class="siteTextBox">&nbsp;M:&nbsp;<input tabindex="15" type="Text" size="1" maxlength="1" name="PolicyHoldersMiddleInitial" onChange="capitalizeMe(this)" value="#trim(getPIC.PolicyHoldersMiddleInitial)#" class="siteTextBox">&nbsp;LAST:&nbsp;<input tabindex="20" type="Text" size="15" maxlength="30" name="PolicyHoldersLastName" onChange="capitalizeMe(this)" value="#trim(getPIC.PolicyHoldersLastName)#" class="siteTextBox"></td>
					       		<td id="td_HoldersDOB" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">
									&nbsp;HOLDERS&nbsp;DOB:&nbsp;<input tabindex="25" type="Text" name="PolicyHoldersDOBMM" onblur="checkMonth_JS(this);" value="#trim(PolicyHoldersDOBMM)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">&nbsp;/&nbsp;<input tabindex="30" type="Text" name="PolicyHoldersDOBDD" onblur="checkDay_JS(this);" value="#trim(PolicyHoldersDOBDD)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">&nbsp;/&nbsp;<input tabindex="35" type="Text" name="PolicyHoldersDOBYY" onblur="checkYear_JS(this);" value="#trim(PolicyHoldersDOBYY)#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox">
									&nbsp;HOLDERS&nbsp;SEX:&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_Sex" alt="PolicyHoldersSexMale" tabindex="40" onkeypress="checkSex(0);" onclick="checkBoxRadio('td_HoldersDOB', 'CheckUncheckPic_Sex', 'PolicyHoldersSexMale');">
									&nbsp;M&nbsp;&nbsp;
									<img src="images/Checkbox1.gif" tabindex="45" name="CheckUncheckPic_Sex" alt="PolicyHoldersSexFemale" onkeypress="checkSex(1);" onclick="checkBoxRadio('td_HoldersDOB', 'CheckUncheckPic_Sex', 'PolicyHoldersSexFemale');">&nbsp;F
								</td>
					       	</tr>
							<script language="JavaScript">	
								if(#trim(getPIC.PolicyHoldersSex)# == 0){checkBoxRadio('td_HoldersDOB', 'CheckUncheckPic_Sex', 'PolicyHoldersSexMale')}				
								else if(#trim(getPIC.PolicyHoldersSex)# == 1){checkBoxRadio('td_HoldersDOB', 'CheckUncheckPic_Sex', 'PolicyHoldersSexFemale')}
							</script>		
							
							<input type="Hidden" name="RelationshipSelf" value="">
							<input type="Hidden" name="RelationshipSpouse" value="">
							<input type="Hidden" name="RelationshipChild" value="">
							<input type="Hidden" name="RelationshipOther" value="">						
							<tr>
					        	<td id="td_patientRelationship" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
									&nbsp;RELATIONSHIP&nbsp;TO&nbsp;PATIENT:&nbsp;<!---<input type="radio" name="Relationship" value="203">Self&nbsp;<input type="radio" name="Relationship" value="204">Spouse&nbsp;<input type="radio" name="Relationship" value="205">Child&nbsp;<input type="radio" name="Relationship" value="206">Other--->
									<img src="images/Checkbox1.gif" tabindex="45" name="CheckUncheckPic_Relationship" alt="RelationshipSelf" onclick="checkBoxRadio('td_patientRelationship', 'CheckUncheckPic_Relationship', 'RelationshipSelf');">&nbsp;Self&nbsp;&nbsp;
									<img src="images/Checkbox1.gif" tabindex="46" name="CheckUncheckPic_Relationship" alt="RelationshipSpouse" onclick="checkBoxRadio('td_patientRelationship', 'CheckUncheckPic_Relationship', 'RelationshipSpouse');">&nbsp;Spouse&nbsp;&nbsp;
									<img src="images/Checkbox1.gif" tabindex="47" name="CheckUncheckPic_Relationship" alt="RelationshipChild" onclick="checkBoxRadio('td_patientRelationship', 'CheckUncheckPic_Relationship', 'RelationshipChild');">&nbsp;Child&nbsp;&nbsp;
									<img src="images/Checkbox1.gif" tabindex="48" name="CheckUncheckPic_Relationship" alt="RelationshipOther" onclick="checkBoxRadio('td_patientRelationship', 'CheckUncheckPic_Relationship', 'RelationshipOther');">&nbsp;Other
								</td>
								<td id="td_PolicyHoldersEmployerSchoolName" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;HOLDERS&nbsp;EMPLOYER/SCHOOL:&nbsp;<input tabindex="49" type="Text" name="PolicyHoldersEmployerSchoolNameTBox" value="#trim(getPIC.PolicyHoldersEmployerSchoolName)#" size="25" maxlength="50" class="siteTextBox"></td>
					       	</tr>
							<script language="JavaScript">	
								if(#trim(getPIC.Relationship)# == 203){checkBoxRadio('td_patientRelationship', 'CheckUncheckPic_Relationship', 'RelationshipSelf')}				
								else if(#trim(getPIC.Relationship)# == 204){checkBoxRadio('td_patientRelationship', 'CheckUncheckPic_Relationship', 'RelationshipSpouse')}
								else if(#trim(getPIC.Relationship)# == 205){checkBoxRadio('td_patientRelationship', 'CheckUncheckPic_Relationship', 'RelationshipChild')}
								else if(#trim(getPIC.Relationship)# == 206){checkBoxRadio('td_patientRelationship', 'CheckUncheckPic_Relationship', 'RelationshipOther')}
							</script>	
													   			
						   	<tr>
					        	<td id="td_PolicyHoldersAddress1TBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
									HOLDERS&nbsp;ADDRESS&nbsp;LINE&nbsp;1:&nbsp;<input tabindex="50" type="Text" size="50" maxlength="98" name="PolicyHoldersAddressLine1TBox" value="#trim(getPIC.PolicyHoldersAddressLine1)#" class="siteTextBox">
									&nbsp;LINE&nbsp;2:&nbsp;<input tabindex="55" type="Text" size="30" maxlength="98" name="PolicyHoldersAddressLine2TBox" value="#trim(getPIC.PolicyHoldersAddressLine2)#" class="siteTextBox">
								</td>
					       	</tr>								
						   	<tr>
					        	<td id="td_PolicyHoldersCityTBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
									&nbsp;CITY:&nbsp;<input tabindex="60" type="Text" size="20" maxlength="30" onChange="capitalizeMe(this)" name="PolicyHoldersCityTBox" value="#trim(getPIC.PolicyHoldersCity)#" class="siteTextBox">
									&nbsp;STATE:&nbsp;								
									<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" active="1" returnvariable="getAllStates"><!---style="background-color: blue"--->
									<select tabindex="65" class="SiteSelectBox" name="PolicyHoldersStateID">
										<option value="">
										<cfloop query="getAllStates">
											<option value="#StandardListItemID#" <cfif StandardListItemID EQ getPIC.PolicyHoldersStateID>SELECTED</cfif>> #ItemNameDisplay#
										</cfloop>
									</select>	
									&nbsp;ZIP&nbsp;CODE:&nbsp;<input tabindex="70" type="Text" size="15" maxlength="15" name="PolicyHoldersZipCodeTBox" value="#trim(getPIC.PolicyHoldersZipCode)#" class="siteTextBox">
									&nbsp;PHONE&nbsp;##:&nbsp;<input tabindex="75" type="Text" size="25" maxlength="24" name="PolicyHoldersPhone" value="#request.formatPhoneUS(trim(getPIC.PolicyHoldersPhone))#" class="siteTextBox" onkeyup="this.value=formatPhoneUS_JS(this.value);">
								</td>
					       	</tr>	  
					   		
						</form>
					
					</table> 		
				
				</td>
			
			</tr>
			
			<tr>
				<td>	
		
					<table cellpadding="6" cellspacing="0" border="0" align="center" width="100%">			
					   	
						<form name="insuranceForm" action="appPatientInsuranceCompanyEditProcess.cfm" method="post"> 	
							<input type="Hidden" name="formname" value="insurance">
							<input type="Hidden" name="PatientID" value="#trim(PatientID)#">
							<input type="Hidden" name="icID" value="#trim(getPIC.insuranceCompanyID)#">
							<input type="Hidden" name="RecordID" value="#trim(getPIC.picRecordID)#">
							<tr>
								<td bgcolor="FFCC99" style="border-Top: 1px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">
									<cf_gcSubmitButton value="Save Insurance Changes">
								</td>
								<td bgcolor="FFCC99" align="center" colspan="5" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">
									<font face="Arial" size="2"><strong>#trim(getPIC.InsuranceCompanyName)#&nbsp;INSURANCE</strong></font>
								</td>										
							</tr>											   
						  	
							<tr>	        	
							   	<td id="td_InsuranceNameTBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;INSURANCE&nbsp;NAME:&nbsp;<input tabindex="80" type="Text" size="35" maxlength="80" name="InsuranceCompanyNameTBox" value="#trim(getPIC.InsuranceCompanyName)#" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};"></td>
								<td id="td_InsuranceDBATBox" colspan="3" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;INSURANCE&nbsp;DBA:&nbsp;<input tabindex="82" type="Text" size="35" maxlength="80" name="InsuranceCompanyDBATBox" value="#trim(getPIC.InsuranceCompanyDBA)#" class="siteTextBox" onblur="if(this.value == ''){this.style.backgroundColor='ffffcc'}else{this.style.backgroundColor='ffffff'};"></td>
					       	</tr>
					       
							<tr>		   		
					           	<td id="td_OCNANumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;OCNA&nbsp;##:&nbsp;<input tabindex="90" type="Text" size="45" maxlength="30" name="OCNANumberTBox" value="#trim(getPIC.OCNANumber)#" class="siteTextBox"></td>
					           	<td id="td_InsuranceCompanyURLTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;URL:&nbsp;<input tabindex="95" type="Text" size="45" maxlength="150" name="InsuranceCompanyURLTBox" value="#trim(getPIC.InsuranceCompanyURL)#" class="siteTextBox"></td>
					       	</tr>	
						
						</form>
							
						<tr>
				        	<td valign="top" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 0px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
								<cf_tagEntityAddressesList bgcolor="FFCC99" title="Insurance Company Address Information" tabstart="100" entityid="#trim(getPIC.icEntityID)#">
								<!---<cf_tagEntityAddressesForm bgcolor="FFCC99" title="Insurance Company Address Information" tabstart="100" entityid="#trim(getPIC.icEntityID)#">--->
							</td>
							<td valign="top" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">
								<cf_tagEntityPhonesList bgcolor="FFCC99" title="Insurance Company Phone Information" tabstart="100" entityid="#trim(getPIC.icEntityID)#">
								<!---<cf_tagEntityPhonesForm bgcolor="FFCC99" title="Insurance Company Phone Information" tabstart="110" entityid="#trim(getPIC.icEntityID)#">--->
							</td>	
						</tr>
												
					</table>
				
				</td>
			</tr>
			
			
				
			<tr>
				<td align="center" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">
					
					<form name="verificationForm" action="appPatientInsuranceCompanyEditProcess.cfm" method="post"> 	
						<input type="Hidden" name="formname" value="verification">
						<input type="Hidden" name="PatientID" value="#trim(PatientID)#">
						<input type="Hidden" name="icID" value="#trim(getPIC.insuranceCompanyID)#">
						<input type="Hidden" name="RecordID" value="#trim(getPIC.picRecordID)#">
						<input type="Hidden" name="usersID" value="#trim(session.User.getUsersID())#">
						<cf_tagPatientInsuranceVerification 
							tabstart="150" 
							recordID="#trim(getPIC.picRecordID)#"
							verificationID="#trim(verificationID)#"
							formname="insuranceForm">
					</form>	
						
				</td>	
													
			</tr>
						
		</table>	
						
	
	</cfoutput>
	
	<!------------------------------------------------------------------>
	<!--- Set the focus on this form to the highest editable field.  --->
	<!------------------------------------------------------------------>		
	<cfoutput>
		<script language="JavaScript">
			document.getElementById("GroupNumberTBox").focus();				
		</script>
	</cfoutput>	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<!---<script language="JavaScript">
				if(document.#caller.formName#.#trim(number)#InsuranceNameTBox.value == ""){document.#caller.formName#.#trim(number)#InsuranceNameTBox.style.backgroundColor = 'ffffcc';}else{document.#caller.formName#.#trim(number)#InsuranceNameTBox.style.backgroundColor = 'ffffff';};
				if(document.#caller.formName#.#trim(number)#PolicyNumberTBox.value == ""){document.#caller.formName#.#trim(number)#PolicyNumberTBox.style.backgroundColor = 'ffffcc';}else{document.#caller.formName#.#trim(number)#PolicyNumberTBox.style.backgroundColor = 'ffffff';};
				if(document.#caller.formName#.#trim(number)#PhoneNumberTBox.value == ""){document.#caller.formName#.#trim(number)#PhoneNumberTBox.style.backgroundColor = 'ffffcc';}else{document.#caller.formName#.#trim(number)#PhoneNumberTBox.style.backgroundColor = 'ffffff';};
				if(document.#caller.formName#.#trim(number)#FaxNumberTBox.value == ""){document.#caller.formName#.#trim(number)#FaxNumberTBox.style.backgroundColor = 'ffffcc';}else{document.#caller.formName#.#trim(number)#FaxNumberTBox.style.backgroundColor = 'ffffff';};
				if(document.#caller.formName#.#trim(number)#EffectiveDateMM.value == ""){document.#caller.formName#.#trim(number)#EffectiveDateMM.style.backgroundColor = 'ffffcc';}else{document.#caller.formName#.#trim(number)#EffectiveDateMM.style.backgroundColor = 'ffffff';};
				if(document.#caller.formName#.#trim(number)#EffectiveDateDD.value == ""){document.#caller.formName#.#trim(number)#EffectiveDateDD.style.backgroundColor = 'ffffcc';}else{document.#caller.formName#.#trim(number)#EffectiveDateDD.style.backgroundColor = 'ffffff';};
				if(document.#caller.formName#.#trim(number)#EffectiveDateYY.value == ""){document.#caller.formName#.#trim(number)#EffectiveDateYY.style.backgroundColor = 'ffffcc';}else{document.#caller.formName#.#trim(number)#EffectiveDateYY.style.backgroundColor = 'ffffff';};
				if(document.#caller.formName#.#trim(number)#PolicyHolderFNameTBox.value == ""){document.#caller.formName#.#trim(number)#PolicyHolderFNameTBox.style.backgroundColor = 'ffffcc';}else{document.#caller.formName#.#trim(number)#PolicyHolderFNameTBox.style.backgroundColor = 'ffffff';};
				if(document.#caller.formName#.#trim(number)#PolicyHolderLNameTBox.value == ""){document.#caller.formName#.#trim(number)#PolicyHolderLNameTBox.style.backgroundColor = 'ffffcc';}else{document.#caller.formName#.#trim(number)#PolicyHolderLNameTBox.style.backgroundColor = 'ffffff';};
				if(document.#caller.formName#.#trim(number)#HoldersDOBMM.value == ""){document.#caller.formName#.#trim(number)#HoldersDOBMM.style.backgroundColor = 'ffffcc';}else{document.#caller.formName#.#trim(number)#HoldersDOBMM.style.backgroundColor = 'ffffff';};
				if(document.#caller.formName#.#trim(number)#HoldersDOBDD.value == ""){document.#caller.formName#.#trim(number)#HoldersDOBDD.style.backgroundColor = 'ffffcc';}else{document.#caller.formName#.#trim(number)#HoldersDOBDD.style.backgroundColor = 'ffffff';};
				if(document.#caller.formName#.#trim(number)#HoldersDOBYY.value == ""){document.#caller.formName#.#trim(number)#HoldersDOBYY.style.backgroundColor = 'ffffcc';}else{document.#caller.formName#.#trim(number)#HoldersDOBYY.style.backgroundColor = 'ffffff';};
			</script>--->	
<!---
 <tr>
						    <td bgcolor="DCE3EB" align="center" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">
								<font face="Arial" size="2"><strong>#UCase(trim(number))#&nbsp;INSURANCE&nbsp;VERIFICATION&nbsp;PROCESS</strong></font>
							</td>								
						</tr>	
					   		
						<cfset VerificationRepFNameTBox = "caller." & number & "VerificationRepFNameTBox">	
						<cfset VerificationRepLNameTBox = "caller." & number & "VerificationRepLNameTBox">	
						<cfset VerificationDateMM = "caller." & number & "VerificationDateMM">
						<cfset VerificationDateDD = "caller." & number & "VerificationDateDD">
						<cfset VerificationDateYY = "caller." & number & "VerificationDateYY">
						<cfset VerificationTimeTBox = "caller." & number & "VerificationTimeTBox">			 
						<tr>
							<td nowrap id="td_#trim(number)#VerificationRepNameTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">
								REP&nbsp;FIRST:<input tabindex="438" type="Text" size="15" maxlength="30" onChange="capitalizeMe(this)" name="#trim(number)#VerificationRepFNameTBox" value="#trim(evaluate(VerificationRepFNameTBox))#" class="siteTextBox">
								&nbsp;LAST:<input tabindex="440" type="Text" size="15" maxlength="30" onChange="capitalizeMe(this)" name="#trim(number)#VerificationRepLNameTBox" value="#trim(evaluate(VerificationRepLNameTBox))#" class="siteTextBox">
							</td>
			  				<td id="td_#trim(number)#VerificationDate" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 0px solid; border-bottom: 0px solid; border-left: 0px solid; border-color: 000000;">&nbsp;DATE:&nbsp;<input tabindex="441" type="Text" name="#trim(number)#VerificationDateMM" onblur="checkMonth_JS(this);" value="#trim(evaluate(VerificationDateMM))#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">&nbsp;/&nbsp;<input tabindex="442" type="Text" name="#trim(number)#verificationDateDD" onblur="checkDay_JS(this);" value="#trim(evaluate(VerificationDateDD))#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">&nbsp;/&nbsp;<input tabindex="443" type="Text" name="#trim(number)#VerificationDateYY" onblur="checkYear_JS(this);" value="#trim(evaluate(VerificationDateYY))#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox"></td>
							<td id="td_#trim(number)#VerificationTimeTBox" colspan="2" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 0px solid; border-left: 1px solid; border-color: 000000;">&nbsp;TIME:&nbsp;<input tabindex="444" type="Text" size="10" maxlength="10" name="#trim(number)#VerificationTimeTBox" value="#trim(evaluate(VerificationTimeTBox))#" class="siteTextBox"></td>
						</tr>
						
						
						<cfset verificationHaveInsFromMM = "caller." & number & "VerificationHaveInsFromMM">
						<cfset verificationHaveInsFromDD = "caller." & number & "VerificationHaveInsFromDD">
						<cfset verificationHaveInsFromYY = "caller." & number & "VerificationHaveInsFromYY">
						<cfset verificationHaveInsToMM = "caller." & number & "VerificationHaveInsToMM">
						<cfset verificationHaveInsToDD = "caller." & number & "VerificationHaveInsToDD">
						<cfset verificationHaveInsToYY = "caller." & number & "VerificationHaveInsToYY">
						<input type="Hidden" name="#trim(number)#CBox_VerificationHaveInsYes" value="">
						<input type="Hidden" name="#trim(number)#CBox_VerificationHaveInsNo" value="">		
						<tr>														   
			  				<td id="td_#trim(number)#CBox_VerificationHaveIns" colspan="6" class="siteLabel" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
								&nbsp;DOES&nbsp;THE&nbsp;PATIENT&nbsp;HAVE&nbsp;INSURANCE&nbsp;WITH&nbsp;YOU?:&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_VerificationHaveIns" alt="#trim(number)#CBox_VerificationHaveInsYes" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationHaveIns', '#trim(number)#CBox_VerificationHaveInsYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_VerificationHaveIns" alt="#trim(number)#CBox_VerificationHaveInsNo" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationHaveIns', '#trim(number)#CBox_VerificationHaveInsNo')">&nbsp;NO&nbsp;&nbsp;&nbsp;&nbsp;EFFECTIVE&nbsp;DATES&nbsp;OF&nbsp;INSURANCE:&nbsp;&nbsp;FROM:<input tabindex="447" type="Text" name="#trim(number)#VerificationHaveInsFromMM" onblur="checkMonth_JS(this);" value="#trim(evaluate(VerificationHaveInsFromMM))#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">&nbsp;/&nbsp;<input tabindex="448" type="Text" name="#trim(number)#VerificationHaveInsFromDD" onblur="checkDay_JS(this);" value="#trim(evaluate(VerificationHaveInsFromDD))#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">&nbsp;/&nbsp;<input tabindex="449" type="Text" name="#trim(number)#VerificationHaveInsFromYY" onblur="checkYear_JS(this);" value="#trim(evaluate(VerificationHaveInsFromYY))#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox">&nbsp;&nbsp;TO:&nbsp;<input tabindex="450" type="Text" name="#trim(number)#VerificationHaveInsToMM" onblur="checkMonth_JS(this);" value="#trim(evaluate(VerificationHaveInsToMM))#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">&nbsp;/&nbsp;<input tabindex="451" type="Text" name="#trim(number)#VerificationHaveInsToDD" onblur="checkDay_JS(this);" value="#trim(evaluate(verificationHaveInsToDD))#" onkeyup="this.va			lue=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox">&nbsp;/&nbsp;<input tabindex="452" type="Text" name="#trim(number)#VerificationHaveInsToYY" onblur="checkYear_JS(this);" value="#trim(evaluate(verificationHaveInsToYY))#" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox">
							</td>
						</tr>
						<cfset VerificationHaveInsYes = "caller." & trim(number) & "CBox_VerificationHaveInsYes">
						<cfset VerificationHaveInsNo = "caller." & trim(number) & "CBox_VerificationHaveInsNo">
						<script language="JavaScript">	
							if(#evaluate(VerificationHaveInsYes)# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationHaveIns', '#trim(number)#CBox_VerificationHaveInsYes')}				
							else if(#evaluate(VerificationHaveInsNo)# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationHaveIns', '#trim(number)#CBox_VerificationHaveInsNo')}
						</script>	
				
				
			
						<input type="Hidden" name="#trim(number)#CBox_VerificationHaveDMECovYes" value="">
						<input type="Hidden" name="#trim(number)#CBox_VerificationHaveDMECovNo" value="">	
						<input type="Hidden" name="#trim(number)#CBox_VerificationDeductibleYes" value="">
						<input type="Hidden" name="#trim(number)#CBox_VerificationDeductibleNo" value="">	
						<tr>														   
							<td id="td_#trim(number)#CBox_VerificationHaveDMECov" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;DOES&nbsp;THE&nbsp;PATIENT&nbsp;HAVE&nbsp;DME&nbsp;COVERAGE?:&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_VerificationHaveDMECov" alt="#trim(number)#CBox_VerificationHaveDMECovYes" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationHaveDMECov', '#trim(number)#CBox_VerificationHaveDMECovYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_VerificationHaveDMECov" alt="#trim(number)#CBox_VerificationHaveDMECovNo" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationHaveDMECov', '#trim(number)#CBox_VerificationHaveDMECovNo')">&nbsp;NO</td>
							<td id="td_#trim(number)#CBox_VerificationDeductible" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;IS&nbsp;THERE&nbsp;A&nbsp;DEDUCTIBLE?:&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_VerificationDeductible" alt="#trim(number)#CBox_VerificationDeductibleYes" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationDeductible', '#trim(number)#CBox_VerificationDeductibleYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_VerificationDeductible" alt="#trim(number)#CBox_VerificationDeductibleNo" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationDeductible', '#trim(number)#CBox_VerificationDeductibleNo')">&nbsp;NO</td>
						</tr>										
						<cfset VerificationHaveDMECovYes = "caller." & trim(number) & "CBox_VerificationHaveDMECovYes">
						<cfset VerificationHaveDMECovNo = "caller." & trim(number) & "CBox_VerificationHaveDMECovNo">			
						<cfset VerificationDeductibleYes = "caller." & trim(number) & "CBox_VerificationDeductibleYes">
						<cfset VerificationDeductibleNo = "caller." & trim(number) & "CBox_VerificationDeductibleNo">			
						<script language="JavaScript">	
							if(#trim(evaluate(VerificationHaveDMECovYes))# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationHaveDMECov', '#trim(number)#CBox_VerificationHaveDMECovYes')}				
					   		else if(#trim(evaluate(VerificationHaveDMECovNo))# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationHaveDMECov', '#trim(number)#CBox_VerificationHaveDMECovNo')}
			
							if(#trim(evaluate(VerificationDeductibleYes))# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationDeductible', '#trim(number)#CBox_VerificationDeductibleYes')}
							else if(#trim(evaluate(VerificationDeductibleNo))# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationDeductible', '#trim(number)#CBox_VerificationDeductibleNo')}
						</script>		
						
						
						<cfset VerificationDeductibleAmountTBox = "caller." & number & "VerificationDeductibleAmountTBox">
						<cfset VerificationDeductibleAmountMetTBox = "caller." & number & "VerificationDeductibleAmountMetTBox">
						<tr>														   
							<td id="td_#trim(number)#VerificationDeductibleAmountTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;AMOUNT&nbsp;OF&nbsp;DEDUCTIBLE:&nbsp;<input tabindex="456" type="Text" size="10" maxlength="10" name="#trim(number)#VerificationDeductibleAmountTBox" value="#trim(evaluate(VerificationDeductibleAmountTBox))#" class="siteTextBox"></td>
							<td id="td_#trim(number)#VerificationDeductibleAmountMetTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;HOW&nbsp;MUCH&nbsp;OF&nbsp;DEDUCTIBLE&nbsp;HAS&nbsp;BEEN&nbsp;MET?:&nbsp;<input tabindex="457" type="Text" size="10" maxlength="10" name="#trim(number)#VerificationDeductibleAmountMetTBox" value="#trim(evaluate(VerificationDeductibleAmountMetTBox))#" class="siteTextBox"></td>
						</tr>
			
						<cfset VerificationPercentagePayAfterDeductibleTBox = "caller." & number & "VerificationPercentagePayAfterDeductibleTBox">	
						<input type="Hidden" name="#trim(number)#CBox_VerificationPPOPolicyYes" value="">
						<input type="Hidden" name="#trim(number)#CBox_VerificationPPOPolicyNo" value="">	
						<tr>														   
							<td id="td_#trim(number)#VerificationPercentagePayAfterDeductibleTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;%&nbsp;OF&nbsp;PAY&nbsp;AFTER&nbsp;DEDUCTABLE:&nbsp;<input tabindex="457" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" type="Text" size="10" maxlength="10" name="#trim(number)#VerificationPercentagePayAfterDeductibleTBox" value="#trim(evaluate(VerificationPercentagePayAfterDeductibleTBox))#" class="siteTextBox"></td>
						  	<td id="td_#trim(number)#CBox_VerificationPPOPolicy" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;IS&nbsp;THIS&nbsp;A&nbsp;PPO/HMO&nbsp;POLICY?:&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_VerificationPPOPolicy" alt="#trim(number)#CBox_VerificationPPOPolicyYes" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationPPOPolicy', '#trim(number)#CBox_VerificationPPOPolicyYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_VerificationPPOPolicy" alt="#trim(number)#CBox_VerificationPPOPolicyNo" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationPPOPolicy', '#trim(number)#CBox_VerificationPPOPolicyNo')">&nbsp;NO</td>
						</tr>
						<cfset VerificationPPOPolicyYes = "caller." & trim(number) & "CBox_VerificationPPOPolicyYes">
						<cfset VerificationPPOPolicyNo = "caller." & trim(number) & "CBox_VerificationPPOPolicyNo">	
						<script language="JavaScript">	
							if(#trim(evaluate(VerificationPPOPolicyYes))# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationPPOPolicy', '#trim(number)#CBox_VerificationPPOPolicyYes')}				
							else if(#trim(evaluate(VerificationPPOPolicyNo))# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationPPOPolicy', '#trim(number)#CBox_VerificationPPOPolicyNo')}
						</script>
						
						<cfset VerificationAuthNumberTBox = "caller." & number & "VerificationAuthNumberTBox">	
						<input type="Hidden" name="#trim(number)#CBox_VerificationPriorAuthYes" value="">
						<input type="Hidden" name="#trim(number)#CBox_VerificationPriorAuthNo" value="">	
						<tr>														   
							<td id="td_#trim(number)#CBox_VerificationPriorAuthorization" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;IS&nbsp;PRIOR&nbsp;AUTHORIZATION&nbsp;NECESSARY?:&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_VerificationPriorAuth" alt="#trim(number)#CBox_VerificationPriorAuthYes" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationPriorAuth', '#trim(number)#CBox_VerificationPriorAuthYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_VerificationPriorAuth" alt="#trim(number)#CBox_VerificationPriorAuthNo" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationPriorAuth', '#trim(number)#CBox_VerificationPriorAuthNo')">&nbsp;NO</td>
							<td id="td_#trim(number)#VerificationAuthNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;Auth&nbsp;##:&nbsp;<input tabindex="460" type="Text" size="20" maxlength="20" name="#trim(number)#VerificationAuthNumberTBox" value="#trim(evaluate(VerificationAuthNumberTBox))#" class="siteTextBox"></td>
						</tr>
						<cfset VerificationPriorAuthYes = "caller." & trim(number) & "CBox_VerificationPriorAuthYes">
						<cfset VerificationPriorAuthNo = "caller." & trim(number) & "CBox_VerificationPriorAuthNo">	
						<script language="JavaScript">	
							if(#trim(evaluate(VerificationPriorAuthYes))# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationPriorAuth', '#trim(number)#CBox_VerificationPriorAuthYes')}				
							else if(#trim(evaluate(VerificationPriorAuthNo))# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationPriorAuth', '#trim(number)#CBox_VerificationPriorAuthNo')}
						</script>
			
						
						<cfset VerificationAuthPhoneNumberTBox = "caller." & number & "VerificationAuthPhoneNumberTBox">	
						<input type="Hidden" name="#trim(number)#CBox_VerificationLifetimeBenefitMetYes" value="">
						<input type="Hidden" name="#trim(number)#CBox_VerificationLifetimeBenefitMetNo" value="">	
						<tr>														   
						 	<td id="td_#trim(number)#VerificationAuthPhoneNumberTBox" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;CONTACT&nbsp;NUMBER&nbsp;FOR&nbsp;AUTH:&nbsp;<input tabindex="463" type="Text" size="20" maxlength="24" name="#trim(number)#VerificationAuthPhoneNumberTBox" value="#trim(evaluate(VerificationAuthPhoneNumberTBox))#" class="siteTextBox" onkeyup="this.value=formatPhoneUS_JS(this.value);"></td>
						 	<td id="td_#trim(number)#CBox_VerificationLifetimeBenefitMet" colspan="3" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 0px solid; border-color: 000000;">&nbsp;HAS&nbsp;LIFETIME&nbsp;BENEFIT&nbsp;BEEN&nbsp;MET?:&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_VerificationLifetimeBenefitMet" alt="#trim(number)#CBox_VerificationLifetimeBenefitMetYes" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationLifetimeBenefitMet', '#trim(number)#CBox_VerificationLifetimeBenefitMetYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_VerificationLifetimeBenefitMet" alt="#trim(number)#CBox_VerificationLifetimeBenefitMetNo" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationLifetimeBenefitMet', '#trim(number)#CBox_VerificationLifetimeBenefitMetNo')">&nbsp;NO</td>
						</tr>
						<cfset VerificationLifetimeBenefitMetYes = "caller." & trim(number) & "CBox_VerificationLifetimeBenefitMetYes">
						<cfset VerificationLifetimeBenefitMetNo = "caller." & trim(number) & "CBox_VerificationLifetimeBenefitMetNo">	
						<script language="JavaScript">	
							if(#trim(evaluate(VerificationLifetimeBenefitMetYes))# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationLifetimeBenefitMet', '#trim(number)#CBox_VerificationLifetimeBenefitMetYes')}				
							else if(#trim(evaluate(VerificationLifetimeBenefitMetNo))# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationLifetimeBenefitMet', '#trim(number)#CBox_VerificationLifetimeBenefitMetNo')}
						</script>
								
			
						<input type="Hidden" name="#trim(number)#CBox_MedicareSupplementYes" value="">
						<input type="Hidden" name="#trim(number)#CBox_MedicareSupplementNo" value="">	
						<input type="Hidden" name="#trim(number)#CBox_CoordinateBenefitsYes" value="">
						<input type="Hidden" name="#trim(number)#CBox_CoordinateBenefitsNo" value="">
						<input type="Hidden" name="#trim(number)#CBox_PaidMedicareDeductibleYes" value="">
						<input type="Hidden" name="#trim(number)#CBox_PaidMedicareDeductibleNo" value="">	
						<tr>														   
							<td id="td_#trim(number)#MedicareSupplement" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;MEDICARE&nbsp;SUPPLEMENT:&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_MedicareSupplement" alt="#trim(number)#CBox_MedicareSupplementYes" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_MedicareSupplement', '#trim(number)#CBox_MedicareSupplementYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_MedicareSupplement" alt="#trim(number)#CBox_MedicareSupplementNo" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_MedicareSupplement', '#trim(number)#CBox_MedicareSupplementNo')">&nbsp;NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;COORDINATE&nbsp;BENEFITS:&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_CoordinateBenefits" alt="#trim(number)#CBox_CoordinateBenefitsYes" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_CoordinateBenefits', '#trim(number)#CBox_CoordinateBenefitsYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_CoordinateBenefits" alt="#trim(number)#CBox_CoordinateBenefitsNo" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_CoordinateBenefits', '#trim(number)#CBox_CoordinateBenefitsNo')">&nbsp;NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PAID&nbsp;MEDICARE&nbsp;DEDUCTIBLE:&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_PaidMedicareDeductible" alt="#trim(number)#CBox_PaidMedicareDeductibleYes" onclick="checkBoxRadio('', 'CheckUncheckPic_#number#CBox_PaidMedicareDeductible', '#trim(number)#CBox_PaidMedicareDeductibleYes')">&nbsp;YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_PaidMedicareDeduct			ible" alt="#trim(number)#CBox_PaidMedicareDeductibleNo" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_PaidMedicareDeductible', '#trim(number)#CBox_PaidMedicareDeductibleNo')">&nbsp;NO								
							</td>
						</tr>
							
						<cfset MedicareSupplementYes = "caller." & trim(number) & "CBox_MedicareSupplementYes">
						<cfset MedicareSupplementNo = "caller." & trim(number) & "CBox_MedicareSupplementNo">				
						<cfset CoordinateBenefitsYes = "caller." & trim(number) & "CBox_CoordinateBenefitsYes">
						<cfset CoordinateBenefitsNo = "caller." & trim(number) & "CBox_CoordinateBenefitsNo">			
						<cfset PaidMedicareDeductibleYes = "caller." & trim(number) & "CBox_PaidMedicareDeductibleYes">
						<cfset PaidMedicareDeductibleNo = "caller." & trim(number) & "CBox_PaidMedicareDeductibleNo">											
						<script language="JavaScript">	
							if(#trim(evaluate(MedicareSupplementYes))# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_MedicareSupplement', '#trim(number)#CBox_MedicareSupplementYes')}				
							else if(#trim(evaluate(MedicareSupplementNo))# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_MedicareSupplement', '#trim(number)#CBox_MedicareSupplementNo')};
							
							if(#trim(evaluate(CoordinateBenefitsYes))# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_CoordinateBenefits', '#trim(number)#CBox_CoordinateBenefitsYes')}				
							else if(#trim(evaluate(CoordinateBenefitsNo))# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_CoordinateBenefits', '#trim(number)#CBox_CoordinateBenefitsNo')};
							
							if(#trim(evaluate(PaidMedicareDeductibleYes))# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_PaidMedicareDeductible', '#trim(number)#CBox_PaidMedicareDeductibleYes')}				
							else if(#trim(evaluate(PaidMedicareDeductibleNo))# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_PaidMedicareDeductible', '#trim(number)#CBox_PaidMedicareDeductibleNo')}
						</script>	
										
										
						<cfset VerificationTypeBasePlanTBox = "caller." & number & "VerificationTypeBasePlanTBox">	
						<input type="Hidden" name="#trim(number)#CBox_VerificationMedicaidPlanMQMB" value="">
						<input type="Hidden" name="#trim(number)#CBox_VerificationMedicaidPlanQMB" value="">
						<input type="Hidden" name="#trim(number)#CBox_VerificationMedicaidPlanTraditional" value="">							
						<tr>														   
							<td id="td_#trim(number)#VerificationTypeBasePlanTBox" colspan="6" class="siteLabel" style="border-Top: 0px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">&nbsp;MEDICAID&nbsp;PLAN:&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_VerificationMedicaidPlan" alt="#trim(number)#CBox_VerificationMedicaidPlanMQMB" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationMedicaidPlan', '#trim(number)#CBox_VerificationMedicaidPlanMQMB')">&nbsp;MQMB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_VerificationMedicaidPlan" alt="#trim(number)#CBox_VerificationMedicaidPlanQMB" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationMedicaidPlan', '#trim(number)#CBox_VerificationMedicaidPlanQMB')">&nbsp;QMB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/Checkbox1.gif" name="CheckUncheckPic_#trim(number)#CBox_VerificationMedicaidPlan" alt="#trim(number)#CBox_VerificationMedicaidPlanTraditional" onclick="checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationMedicaidPlan', '#trim(number)#CBox_VerificationMedicaidPlanTraditional')">&nbsp;TRADITIONAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**&nbsp;TYPE&nbsp;OF&nbsp;BASE&nbsp;PLAN:&nbsp;<input tabindex="466" type="Text" name="#trim(number)#VerificationTypeBasePlanTBox" value="#trim(evaluate(VerificationTypeBasePlanTBox))#" class="siteTextBox" size="35" maxlength="49"></td>
						</tr>	
						
						<cfset VerificationMedicaidPlanMQMB = "caller." & trim(number) & "CBox_VerificationMedicaidPlanMQMB">
						<cfset VerificationMedicaidPlanQMB = "caller." & trim(number) & "CBox_VerificationMedicaidPlanQMB">
						<cfset VerificationMedicaidPlanTraditional = "caller." & trim(number) & "CBox_VerificationMedicaidPlanTraditional">					
						<script language="JavaScript">	
							if(#trim(evaluate(VerificationMedicaidPlanMQMB))# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationMedicaidPlan', '#trim(number)#CBox_VerificationMedicaidPlanMQMB')}				
							else if(#trim(evaluate(VerificationMedicaidPlanQMB))# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationMedicaidPlan', '#trim(number)#CBox_VerificationMedicaidPlanQMB')}
							else if(#trim(evaluate(VerificationMedicaidPlanTraditional))# == 1){checkBoxRadio('', 'CheckUncheckPic_#trim(number)#CBox_VerificationMedicaidPlan', '#trim(number)#CBox_VerificationMedicaidPlanTraditional')}
						</script>	
--->	
	
				


