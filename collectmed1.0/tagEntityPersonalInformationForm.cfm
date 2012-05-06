<!--- tagEntityPersonalInformationForm.cfm --->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formName" default="PerosnalInformationForm">
	<cfset formName = attributes.formName>

	
						
<!-------------------------------------------------------------------------------------->
<!--- Insurance section of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
	
		<script language="JavaScript">		
			
			function validatePerosnalInformationForm(){
				
				var msg  = false;
				
				if (document.#trim(formname)#.EntityFName.value == ""){
					document.#trim(formname)#.EntityFName.className = 'SiteTextboxALERT'; 						
					msg = true;
				}
				
				if (document.#trim(formname)#.EntityLName.value == ""){
					document.#trim(formname)#.EntityLName.className = 'SiteTextboxALERT'; 						
					msg = true;
				}
				
				//Fields that cannot be left blank
				if(msg){
					msg = "Please review the highlighted fields.";
				};
								
				if(msg.length >= 1){
					sp_errorMsg.className = 'SiteErrorLabelLarge';
					sp_errorMsg.innerHTML = msg;
					//tr_errorMsg.style.display = 'inline';
					resetSubmitButtons();					
					return false;
				}
				else{					
					return true;
				};	
				
			}	
				
		</script>
	
		<style type="text/css">
			.personalInfo{				
				margin: 10px auto;
			}
		</style>
	
	</cfoutput>
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->		
	<cfoutput>
			
		<div class="personalInfo" align="center">	
			<cf_gcBorderedTable title="Patients'&nbsp;Personal&nbsp;Information" width="50%">	
				
			<form method="post" name="#trim(formName)#" action="appPatientProcess.cfm" onsubmit="return validatePerosnalInformationForm();reloadMain();">
				
				<input type="Hidden" name="formname" value="#trim(formName)#">							
				<input type="Hidden" name="PatientID" value="#trim(PatientID)#">			
				<input type="Hidden" name="reload" value="#trim(caller.reload)#">
				<input type="Hidden" name="func" value="#trim(caller.func)#">
				<input type="Hidden" name="resetA" value="#trim(caller.resetA)#">
				<input type="Hidden" name="resetP" value="#trim(caller.resetP)#">
														
					<table cellpadding="4" cellspacing="0" border="0" width="50%">																
						
						<tr id="tr_errorMsg">
							<td colspan="2" align="center">
								<div id="errorAlert" class="clErrorAlert">
									<span class="SiteLabelLarge" id="sp_errorMsg">Please provide the following information.</span>										
								</div>
							</td>
						</tr>
						
					<tr>
						    <td class="SiteLabelMedium" align="right"><strong>EOB&nbsp;Patient&nbsp;ID:&nbsp;</strong></td>
						    <td class="SiteLabelMedium" colspan="5">
							#trim(request.Patient.getPatientID())#								
						</td>
					</tr>	
															
					<!--- Patient Account Number --->
					<tr>
						    <td class="SiteLabelMedium" align="right" valign="top">
								Account&nbsp;Number:&nbsp;
						</td>
						    <td id="accountNumberDisplay" class="SiteLabelMedium" style="display:block" colspan="5">
								<input class="SiteTextBox" type="Text" id="patientAccountNumber_ID" name="patientAccountNumber" value="#trim(request.Patient.getAccountNumber())#">															
						</td>
					</tr>		
					
					<!--- Patient SSN --->
					<tr>
						    <td class="SiteLabelMedium" align="right" valign="top">
								SSN:&nbsp;
						</td>
						    <td id="ssnDisplay" class="SiteLabelMedium" style="display:block" colspan="5">
								<input class="SiteTextBox" type="Text" id="entitySSN_ID" name="entitySSN" value="#REQUEST.formatSSN(trim(request.Entity.getSSN()))#">						
						</td>
							 
					</tr>	
										
					<tr>					    
							<!--- Name --->
							<td class="SiteLabelMediumRequired" align="right">
								Patient&nbsp;Name:
						</td>
						    <td id="pNameDisplay" class="SiteLabelMedium" style="display:block" nowrap>
								<input size="10" class="SiteTextBox" type="Text" id="EntityFName_ID" name="EntityFName" maxlength="15" value="#trim(request.Entity.getFName())#">&nbsp;<input class="SiteTextBox" size="5" maxlength="15" type="Text" id="EntityMName_ID" name="EntityMName" value="#trim(request.Entity.getmName())#">&nbsp;<input size="10" maxlength="15" class="SiteTextBox" type="Text" id="EntityLName_ID" name="EntityLName" value="#trim(request.Entity.getlName())#">
						</td>
					</tr>									
					
					<!--- Languages --->
					<cfset languages = "">
					<cfif trim(request.Entity.getLanguages()) NEQ "">
						<cfloop list="#trim(request.Entity.getLanguages())#" index="l">
							<cfif l EQ 1>
								<cfset languages = ListAppend(languages, " English")>
							<cfelseif l EQ 2>
								<cfset languages = ListAppend(languages, " Spanish")>
							</cfif>
						</cfloop> 
					</cfif>
					<tr>
						    <td class="SiteLabelMedium" align="right" valign="top">
								Languages:&nbsp;
						</td>
					    <td id="languageDisplay" class="SiteLabel" style="display:block" colspan="5" nowrap>
								<input type="Checkbox" name="language" value="1" <cfif ListFind(trim(request.Entity.getLanguages()), 1)>CHECKED</cfif>>English&nbsp;&nbsp;<input type="Checkbox" name="language" value="2" <cfif ListFind(trim(request.Entity.getLanguages()), 2)>CHECKED</cfif>>Spanish&nbsp;
						 </td>								
					</tr>		
					
					<!--- DOB --->
					<tr>
						    <td class="SiteLabelMedium" align="right" valign="top">
								DOB:&nbsp;
						</td>
						     <td id="dobDisplay" class="SiteLabelMedium" style="display:block" colspan="5">						
							<table cellspacing="0" cellpadding="0" border="0">
								<tr>
									    <td><input class="SiteTextBox" type="Text" size="15" name="Entitydob" value="#DateFormat(trim(request.Entity.getDOB()), 'mm/dd/yyyy')#" onblur="checkIsDate('#trim(formname)#', 'Entitydob',this.value);"></td>
								</tr>
								<tr>
								    <td><span class="CopyGrey">&nbsp;(ex.&nbsp;01/31/1972)</span></td>
								</tr>
							</table>												
						</td>
					</tr>		
					
					
					<!--- Sex --->
					<tr>
						    <td class="SiteLabelMedium" align="right" valign="top" style="cursor:hand;" onclick="patientSex();">
								Sex:&nbsp;
						</td>
					    <td id="sexDisplay" class="SiteLabel" style="display:block" colspan="5">
								<input type="Radio" name="Entitysex" value="0" <cfif trim(request.Entity.getSex()) EQ 0>checked</cfif>>&nbsp;Male&nbsp;<input type="Radio" name="Entitysex" value="1"<cfif trim(request.Entity.getSex()) EQ 1>checked</cfif>>&nbsp;Female
						</td>
					</tr>
					
					
					
					<!--- Marital Status --->
					<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" fields="StandardListItemID, ItemNameDisplay" listid="25" active="1" returnvariable="getAllMaritalStatuses">
					<tr>
						    <td class="SiteLabelMedium" align="right" valign="top">
								Marital&nbsp;Status:&nbsp;
						</td>
						
							<td id="maritalstatusDisplay" class="SiteLabelMedium" style="display:block" colspan="5">																
										<cfif trim(request.Entity.getMaritalStatus()) EQ "" OR trim(request.Entity.getMaritalStatus()) EQ "NULL">
											<cfset MaritalStatus = 236>
										<cfelse>
											<cfset MaritalStatus = trim(request.Entity.getMaritalStatus())>
										</cfif>											
								<select class="SiteSelectBox" name="selectMaritalStatus">
											<cfloop query="getAllMaritalStatuses">
												<option value="#trim(StandardListItemID)#" <cfif trim(MaritalStatus) EQ StandardListItemID>SELECTED</cfif>>#ItemNameDisplay#
											</cfloop>														
										</select>
									</td>
									
								</tr>								
						
					
					<!--- Patient Height --->
					<cfif trim(request.Entity.getHeightInInches()) EQ "NULL">
						<cfset getHeightInInches = "">
					<cfelse>
						<cfset getHeightInInches = trim(request.Entity.getHeightInInches())>	
					</cfif>
					<tr>
						    <td class="SiteLabelMedium" align="right" valign="top" style="cursor:hand;" onclick="if(document.all.heightEdit.style.display == 'block'){sp_heightDisplay.innerHTML = document.all.patientHeightInInches.value; document.all.heightEdit.style.display = 'none'; document.all.heightDisplay.style.display = 'block'} else{document.all.heightEdit.style.display = 'block', document.all.heightDisplay.style.display = 'none'}">
								Height&nbsp;In&nbsp;Inches:&nbsp;
						</td>
					    <td id="heightDisplay" class="SiteLabel" style="display:block" colspan="5">
								<input class="SiteTextBox" size="4" type="Text" name="patientHeightInInches" value="#trim(getHeightInInches)#"> inches
						</td>
					</tr>	
					
												
					<!--- Patient Weight --->
					<cfif trim(request.Entity.getWeight()) EQ "NULL">
						<cfset getWeight = "">
					<cfelse>
						<cfset getWeight = trim(request.Entity.getWeight())>	
					</cfif>
					<tr>
						    <td class="SiteLabelMedium" align="right" valign="top" style="cursor:hand;" onclick="if(document.all.weightEdit.style.display == 'block'){sp_weightDisplay.innerHTML = document.all.patientWeight.value; document.all.weightEdit.style.display = 'none'; document.all.weightDisplay.style.display = 'block'} else{document.all.weightEdit.style.display = 'block', document.all.weightDisplay.style.display = 'none'}">
								Weight:&nbsp;
						</td>
					    <td id="weightDisplay" class="SiteLabel" style="display:block" colspan="5">
								<input class="SiteTextBox" size="4" type="Text" name="patientWeight" value="#trim(getWeight)#"> lbs.
						</td>
					</tr>
					
										
					<!--- Employer --->
					<cfset employerName = "">	
					<cfset employerAddressID = "">
					<cfset employerAddressLine1 = "">
					<cfset employerAddressLine2 = "">
					<cfset employerAddressCity = "">
					<cfset employerAddressStateID = "">
					<cfset employerAddressZipCode = "">	
					
					<cfset employerPhoneID = "">
					<cfset employerPhoneNumber = "">					
					
					<cfif IsNumeric(request.Entity.getEmployerID())>
					
						<cfset request.Employer = CreateObject("component", "com.common.Employer").init(request.Entity.getEmployerID())>		
						<cfset request.employerEntity = CreateObject("component", "com.common.Entity").init(request.Employer.getEntityID())>		
						<cfset employerName = "#request.Employer.getEmployerName()#">	
						
						<cfset request.employerAddresses = request.employerEntity.getEntityAddresses(clientID: trim(session.clientID), entityID: request.Employer.getEntityID(), Active: 1)>				
						
						<cfif request.employerAddresses.recordCount GT 0>							
							<cfset employerAddressID = "#request.employerAddresses.AddressID[1]#">
							<cfset employerAddressLine1 = "#request.employerAddresses.AddressLine1[1]#">
							<cfset employerAddressLine2 = "#request.employerAddresses.AddressLine2[1]#">
							<cfset employerAddressCity = "#request.employerAddresses.City[1]#">
							<cfset employerAddressStateID = "#request.employerAddresses.StateID[1]#">
							<cfset employerAddressZipCode = "#request.employerAddresses.ZipCode[1]#">	
						</cfif>
						
						<cfset request.employerPhones = request.employerEntity.getEntityPhones(clientID: trim(session.clientID), entityID: request.Employer.getEntityID(), Active: 1)>				
						
						<cfif request.employerPhones.recordCount GT 0>
							<cfset EmployerPhoneNumberD = application.beanFactory.getBean('globalFooter').GlobalFooterD(request.employerPhones.PhoneNumber[1]) />
							<cfset EmployerPhoneExtensionD = application.beanFactory.getBean('globalFooter').GlobalFooterD(request.employerPhones.PhoneExtension[1]) />
								
							<cfset employerPhoneID = "#request.employerPhones.PhoneID[1]#">							
							<cfset employerPhoneNumber = "#trim(EmployerPhoneNumberD)##trim(EmployerPhoneExtensionD)#">					
							<cfset employerPhoneNumber = "#REQUEST.FormatPhoneUS(trim(employerPhoneNumber))#">										
						</cfif>	
										
					</cfif>							
										
					
					<!---Needed Hidden Vars--->
					<input type="Hidden" name="HIDDEN_employerName" value="#trim(employerName)#">
					<input type="Hidden" name="HIDDEN_EmployerID" value="#request.Entity.getEmployerID()#">
					<input type="Hidden" name="HIDDEN_employerAddressID" value="#trim(employerAddressID)#">
					<input type="Hidden" name="HIDDEN_employerPhoneID" value="#trim(employerPhoneID)#">	
							
					<tr>
						    <td class="SiteLabelMedium" align="right" valign="top">
								Employer:&nbsp;
						</td>
						    <td id="employerDisplay" class="SiteLabelMedium" style="display:block" colspan="5">
								<table cellspacing="2" cellpadding="0" border="0" style="background-color: f5f5f5;"><!---f7f4f4--->									
								<tr>									
										<td class="SiteLabelMedium">Name:</td>									
									<td>
									   <input class="SiteTextbox" type="text" name="employerName" size="35" maxlength="45" value="#trim(employerName)#">
									</td>
								</tr>									
								<tr>
										<td class="SiteLabelMedium">Address&nbsp;1:&nbsp;</td>
									<td>
									   <input class="SiteTextbox" type="text" name="employerAddressLine1" size="35" maxlength="80" value="#trim(employerAddressLine1)#">
									</td>
								</tr>
								<tr>
										<td class="SiteLabelMedium">Address&nbsp;2:&nbsp;</td>
									<td>
									   <input class="SiteTextbox" type="text" name="employerAddressLine2" size="35" maxlength="80" value="#trim(employerAddressLine2)#">
									</td>
								</tr>
								<tr>
										<td class="SiteLabelMedium">City&nbsp;</td>
									<td>
										<input class="SiteTextbox" type="text" name="employerAddressCity" size="15" maxlength="50" value="#trim(employerAddressCity)#">
									</td>
								</tr>
								<tr>
										<td class="SiteLabelMedium">State&nbsp;</td>
									<td>
										<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" active="1" returnvariable="getAllStates"><select class="SiteSelectBox" name="employerAddressStateID"><option value=""><cfloop query="getAllStates"><option value="#StandardListItemID#" <cfif StandardListItemID EQ employerAddressStateID>SELECTED</cfif>>#ItemNameDisplay#</cfloop></select>
									</td>
								</tr>
								<tr>
										<td class="SiteLabelMedium">Zip&nbsp;Code</td>
									<td>
										<input class="SiteTextbox" type="Text" name="employerAddressZipCode" size="11" maxlength="15" value="#trim(employerAddressZipCode)#"> 					
									</td>
								</tr>
								<tr>
										<td class="SiteLabelMedium">Phone&nbsp;</td>
									<td nowrap>		
										<input onkeyup="this.value=formatPhoneUS_JS(this.value);"  type="Text" class="SiteTextbox" name="employerPhoneNumber" size="25" maxlength="25" value="#trim(employerPhoneNumber)#">							
									</td>
								</tr>				
							</table>
							
						</td>
					</tr>	
					
					
					
					
					<tr>
						<td colspan="6" align="center" nowrap>			
							&nbsp;
						</td>
					</tr>	
					
					<tr>
						<td colspan="6" align="center" nowrap>			
							<div align="center"><cf_gcSubmitButton value="Save&nbsp;Changes"></div>							
						</td>
					</tr>	
					
				</table>	
			
			</form>								
		
		</cf_gcBorderedTable>		
		
		</div>
		
		
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
		
	
	</cfoutput>