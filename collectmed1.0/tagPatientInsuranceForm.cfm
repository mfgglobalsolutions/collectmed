<!---- tagPatientInsuranceForm.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formName" default="insuranceForm">
	<cfset formName = attributes.formName>	
	

<!-------------------------------------------------------------------------------------->
<!--- Code for tabs to work.                                                         --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>	
		
		<script language="JavaScript">
					
			function editPIC(patientID, picID, ev){				
				pic=window.open('appPatientInsuranceCompanyEdit.cfm?patientid=' + patientID + '&picid=' + picID + '&ev=' + ev,'picEdit','dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=950,height=700,left=' + newWindowGetX(900) + ',top=' + newWindowGetY(700));
			};	
			
			function deletePIC(patientID, picID){				
				
				var delPatientInsuranceCompany = confirm("Are you sure you want to delete this Patient Insurance Company?");
			
				if(delPatientInsuranceCompany){	
					var url = "#trim(request.urlReconstructed)#/ws/wsPatientInsuranceCompany.cfc?method=wsDeactivatePatientInsuranceCompany&Data1=#trim(session.ClientID)#" + "&Data2=" + escape(patientID)  + "&Data4=" + escape(picID) + "&" + escape(randNum_JS());	
					var truefalse = ajaxCFWS(url);					
					if(truefalse == "true" || truefalse == true){
						 window.location.reload(true);
					};				
				};	
			};	
			
			function validateInsuranceInformationForm(){
				
				var theForm = document.#trim(formName)#;				
				var msg  = "";
				var thisStr = "";
				var thisVerify = "If the following order is correct click on \"OK\".\nOtherwise click \"Cancel\"\n\n";
				var ccount = 0;
				
				for(i=0; i < theForm.elements.length; i++){							 
					if(theForm.elements[i].type == "select-one" && theForm.elements[i].name.indexOf("primsecter_") >= 0 && theForm.elements[i].options.length > 0 && theForm.elements[i].options[theForm.elements[i].selectedIndex].value != ""){
						lookFor = theForm.elements[i].options[theForm.elements[i].selectedIndex].value+",";						
						if(thisStr.indexOf(lookFor) >= 0){
							var msg  = "One or more of the insurances have the same order please fix this before submitting.";
							break;
						};
							
						number = theForm.elements[i].options[theForm.elements[i].selectedIndex].value;						
						switch(number){
							case (number = "1"):
							  primSecTer = "PRIMARY";
							break
							case (number = "2"):
							  primSecTer = "SECONDARY";
							break
							case (number = "3"):
							 primSecTer = "TERTIARY";
							break
							default:
							  primSecTer = "IN-ACTIVE";
							break
						}; 
						
						thisStr = thisStr + theForm.elements[i].options[theForm.elements[i].selectedIndex].value + ",";
						thisVerify  = thisVerify + ListGetAt_JS(document.#formName#.names.value, ccount, ",") + " : " + primSecTer + "\n\n";
						ccount++;
					};									  
				};				
								
				if(msg.length >= 1){
					alert(msg);
					resetSubmitButtons();
					return false;
				}
				else{					
					var insuranceConfirm = confirm(thisVerify);
			
					if(insuranceConfirm){	
						return true;
					}
					else{
						resetSubmitButtons();
						return false;
					};	
				};					
			};	
	
		</script>
		
		
		
	</cfoutput>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create the patient object.                                                     --->
<!-------------------------------------------------------------------------------------->	
	<!---<cfset patientsInsuranceCompanies = request.patient.getPatientInsCom(patientID)>	--->				
	<cfquery name="patientsInsuranceCompanies" datasource="PAClient_#session.ClientID#">
		SELECT pic.recordID, pic.PrimSecTer, ic.InsuranceCompanyName, pic.PolicyHoldersLastName, pic.PolicyHoldersMiddleInitial, pic.PolicyHoldersFirstName, ic.InsuranceCompanyID
		FROM PatientInsuranceCompany pic 
		INNER JOIN InsuranceCompany ic ON pic.InsuranceCompanyID = ic.InsuranceCompanyID
		WHERE pic.PatientID = #trim(patientID)# AND pic.Active = 1
		ORDER BY pic.PrimSecTer
	</cfquery>
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->		
	<cfoutput>		
			
		<cf_gcBorderedTable title="Patients'&nbsp;Insurance&nbsp;Information" tablealign="center"  margin="25">	
										
			<cfif patientsInsuranceCompanies.RecordCount GTE 1>
				
				<form method="post" name="#trim(formName)#" action="appPatientProcess.cfm" onsubmit="return validateInsuranceInformationForm();reloadMain();">
					
					<input type="Hidden" name="formname" value="#trim(formName)#">							
					<input type="Hidden" name="PatientID" value="#trim(PatientID)#">			
					<input type="Hidden" name="reload" value="#trim(caller.reload)#">
					<input type="Hidden" name="func" value="#trim(caller.func)#">
					<input type="Hidden" name="resetA" value="#trim(caller.resetA)#">
					<input type="Hidden" name="resetP" value="#trim(caller.resetP)#">
					<input type="Hidden" name="names" value="#valuelist(patientsInsuranceCompanies.InsuranceCompanyName)#">
					
					<table cellpadding="2" cellspacing="2">					
						<tr>
							<td align="center" nowrap class="siteLabel"><u>Insurance Company</u></td>
							<td align="center" nowrap class="siteLabel"><u>Order</u></td>
							<td align="center" nowrap class="siteLabel"><u>Policy Holder</u></td>
							<td colspan="1">&nbsp;</td>
						</tr>
						<cfloop query="patientsInsuranceCompanies">
							<tr>
								<td class="siteLabel" nowrap>
									<li onclick="editPIC(#trim(patientID)#, #trim(recordID)#, 1)" style="cursor:hand" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration=''">#trim(InsuranceCompanyName)#</li>				
								</td>
								<td class="siteLabel" nowrap>
									<select name="primsecter_#trim(recordID)#" class="SiteSelectBox">
										<option value="1" <cfif PrimSecTer EQ 1>SELECTED</cfif>>1st - Primary
										<option value="2" <cfif PrimSecTer EQ 2>SELECTED</cfif>>2nd - Secondary
										<option value="3" <cfif PrimSecTer EQ 3>SELECTED</cfif>>3rd - Tertiary
										<option value="4" <cfif PrimSecTer EQ 4>SELECTED</cfif>>4th - Quaternary		
										<option value="5" <cfif PrimSecTer EQ 5>SELECTED</cfif>>5th - Quinary		
										<option value="6" <cfif PrimSecTer EQ 6>SELECTED</cfif>>6th - Senary		
										<option value="7" <cfif PrimSecTer EQ 7>SELECTED</cfif>>7th - Septenary		
										<option value="8" <cfif PrimSecTer EQ 8>SELECTED</cfif>>8th - Octonary		
										<option value="9" <cfif PrimSecTer EQ 9>SELECTED</cfif>>9th - Nonary		
										<option value="10" <cfif PrimSecTer EQ 10>SELECTED</cfif>>10th - Denary														
										<!---<option value="20">In-Active				--->					
									</select>
								</td>
								<td class="siteLabel" nowrap>&nbsp;#trim(PolicyHoldersLastName)#<cfif trim(PolicyHoldersLastName) NEQ "">,</cfif><cfif trim(PolicyHoldersMiddleInitial) NEQ ""> #trim(PolicyHoldersMiddleInitial)#</cfif> #PolicyHoldersFirstName#</td>
								<td class="siteLabel"><a href="##" onclick="editPIC(#trim(patientID)#, #trim(recordID)#, 1)">edit</a><!---&nbsp;<a href="##" onclick="editPIC(#trim(patientID)#, #trim(InsuranceCompanyID)#, 2)">verify</a>---></td>
								<td class="siteLabel"><a href="##" onclick="deletePIC(#trim(patientID)#, #trim(recordID)#, 1)">delete</a></td>
							</tr>	
						</cfloop>	
						<!---<tr><td colspan="6" align="center" nowrap>&nbsp;</td></tr>--->		
						<tr>
							<td colspan="6" align="center" nowrap>			
								<div align="center"><cf_gcSubmitButton value="Save&nbsp;Insurance&nbsp;Changes"></div>							
							</td>
						</tr>						
					</table>	
								
				</form>		
				
				<!--------------------------------------------------------------------------------------->
				<!--- When you have a validate form and the msg is not black this function will have  --->
				<!--- to be called below the gcSubmitButton custom tag. This tag will set             --->
				<!--- caller.submitButtonID allowing this code to work.                               --->
				<!--------------------------------------------------------------------------------------->
				<script language="JavaScript">
					function resetSubmitButtons(){
						document.#formName#.SubmitButton#trim(submitButtonID)#.style.display='inline';
						spSubmitButton#trim(submitButtonID)#.innerText='';
					};
				</script>		
					
					
			<cfelse>
				[Add Isurance Company Link]
			</cfif>			
		
		</cf_gcBorderedTable>		
				
	</cfoutput>	
		
	
	
	<!---<select class="siteSelectBox" name="position_#InsuranceCompanyID#">
									<cfloop from="1" to="#trim(patientsInsuranceCompanies.RecordCount)#" index="i">
										<option value="#trim(i)#"> 
											<cfswitch expression="#i#">
												<cfcase value="1">1st - Primary</cfcase>
												<cfcase value="2">2nd - Secondary</cfcase>
												<cfcase value="3">3rd - Tertiary</cfcase>
												<cfcase value="4">4th - Quaternary</cfcase>
												<cfcase value="5">5th - Quinary</cfcase>
												<cfcase value="6">6th - Senary</cfcase>
												<cfcase value="7">7th - Septenary</cfcase>
												<cfcase value="8">8th - Octonary</cfcase>
												<cfcase value="9">9th - Nonary</cfcase>
												<cfcase value="10">10th - Denary</cfcase>												
											</cfswitch>
									</cfloop>
								</select>--->