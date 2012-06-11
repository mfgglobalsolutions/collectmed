<!---- appPatientSearchIntake.cfm ---->



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formname" default="searchPatient">
	<cfset formname = attributes.formname>
		
	
				
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	<cfif NOT IsDefined("form.Submitted")>

		<cfoutput>
		
			<script language="JavaScript">
				function validateForm(){				
					
					if(document.#trim(formname)#.FName.value == "" && document.#trim(formname)#.LName.value == "" && document.#trim(formname)#.SSN.value == "" && document.#trim(formname)#.patientDOBMM.value == "" && document.#trim(formname)#.patientDOBDD.value == "" && document.#trim(formname)#.patientDOBYY.value == ""){		
						var blankSearch = confirm("Are you sure you want to perform a blank search on all Patients?\n\nThis might take a few moments to run.");
				
						if(blankSearch){	
							return true;
						}
						else{
							resetSubmitButtons();
							return false;
						};
					}
					else{
						return true;					
					};	
				}	
			</script>
		
			<div align="left">
				<table border="0" width="85%" cellpadding="0" cellspacing="10">
					<tr>
						<td>
							<cf_gcBorderedTable	title="Search&nbsp;Patients" tablealign="left" tableWidth="100%">	
								<form name="#trim(formName)#" method="post" onsubmit="return validateForm();">
									<input type="Hidden" name="Submitted" value="yes">	
									<input type="Hidden" name="callerFormName" value="#trim(url.callerFormName)#">											
									<table align="left" cellpadding="5" cellspacing="0" border="0">				
										<tr>					
											<td valign="top">			   
								   			
												<table cellspacing="4" cellpadding="3" border="0">															
													
													<tr>
													    <td align="right" class="siteLabel">
															First&nbsp;Name:
														</td>	
														<td class="siteLabel">
															<input type="Text" size="25" class="siteTextBox" name="FName">
														</td>							   
													</tr>
													<tr>
													    <td align="right" class="siteLabel">
															Last&nbsp;Name:
														</td>	
														<td class="siteLabel">
															<input type="Text" size="25" class="siteTextBox" name="LName">
														</td>							   
													</tr>
													<tr>
													    <td align="right" class="siteLabel">
															SSN:
														</td>	
														<td class="siteLabel">
															<input type="Text" size="25" class="siteTextBox" name="SSN">
														</td>							   
													</tr>														
													<tr>
													    <td align="right" class="siteLabel">
															DOB:
														</td>	
														<td class="siteLabel">
															<input type="Text" name="patientDOBMM" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox" onblur="checkMonth_JS(this);">&nbsp;/&nbsp;<input type="Text" name="patientDOBDD" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="2" maxlength="2" class="siteTextBox" onblur="checkDay_JS(this);">&nbsp;/&nbsp;<input tabindex="30" type="Text" name="patientDOBYY" onkeyup="this.value=this.value.replace(/[^\d]+/g,'');" size="4" maxlength="4" class="siteTextBox" onblur="checkYear_JS(this);">
														</td>							   
													</tr>																								
													<tr>
													    <td colspan="2" align="center"><cf_gcSubmitButton value="Search">&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Close" name="closeTD" onclick="window.close();"></td>							   
													</tr>
													
												</table>							
											
											</td>						
										</tr>
									</table>										
								</form>
							</cf_gcBorderedTable>
						</td>
					</tr>
				</table>	
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
		
		
		<!------------------------------------------------------------------>
		<!--- Set the focus on this form to the highest editable field.  --->
		<!------------------------------------------------------------------>		
		<cfoutput>
			<script language="JavaScript">				
				//setTimeout('self.focus()', 1000);
				document.getElementById("LName").focus();						
			</script>
		</cfoutput>	
	
	
	
	<cfelse>
		
		<cfoutput>
			<script language="JavaScript">
				
				function setClose(PatientID, FName, MInitial, LName, MM, DD, YY, SSN, Sex, Weight, Height, AddressID, PhoneID, EntityID, MaritalStatus){	
					window.opener.setPatient(PatientID, FName, MInitial, LName, MM, DD, YY, SSN, Sex, Weight, Height, AddressID, PhoneID, EntityID, MaritalStatus, PhoneID, AddressID, #trim(session.clientID)#);					
					self.close();				
				};
				
				function toggle(ele, Obj){										
					action = ImageSwap(Obj.name);										
					temp = 'document.all.' + ele + '.style.display="' + action + '"';										
					eval(temp);							
				};
						
				function ImageSwap(Objname){
					
					str = 'document.images.' + Objname + '.src.split("/")'
					array=eval(str);									
					if (array[array.length-1] == 'minus.gif'){									
						ImagePlus(Objname);
						action = "none";
					}
					else{						
						ImageMinus(Objname);
						action = "block";
					}
					
					return action;				
				}	
				
				function ImagePlus(Objname){
					str = 'document.images.' + Objname + '.src="images/plus.gif"'						
					eval(str);					
				};
				
				function ImageMinus(Objname){
					str = 'document.images.' + Objname + '.src="images/minus.gif"'						
					eval(str);						
				};
			</script>
		</cfoutput>
				
		<cfsavecontent variable="sqlStatement">			
			<cfoutput>
				SELECT p.EntityID, p.PatientID, e.PrefixName, e.FName, LEFT(e.Mname, 1) AS Mname, e.LName, e.SSN, e.DOB, e.Sex, e.Weight, e.HeightinInches, e.MaritalStatus <!---, a.addressline1, a.addressline2, City, StateID, sli.ItemNameDisplay, ZipCode--->   
				FROM patient p
				INNER JOIN entity e ON p.EntityID = e.EntityID				
				WHERE 1 =1 
				<cfif form.LName NEQ "">
					AND e.LName LIKE '#trim(form.LName)#%'
				</cfif>
				<cfif form.FName NEQ "">
					AND e.FName LIKE '#trim(form.FName)#%'
				</cfif>		
				<cfif form.SSN NEQ "">
					AND e.SSN LIKE '%#trim(form.SSN)#%'
				</cfif>	
				<cfif form.patientDOBMM NEQ "" AND form.patientDOBDD NEQ "" AND form.patientDOBYY NEQ "">					
					<cfset DOB = CreateDateTime(trim(form.patientDOBYY), trim(form.patientDOBMM), trim(form.patientDOBDD), 0, 0, 0)>	
					<cfif DOB NEQ ""> AND e.DOB BETWEEN '#DateFormat(trim(DOB), "YYYY-MM-DD")#' AND '#DateFormat(trim(DOB), "YYYY-MM-DD")# 23:59:59.997'</cfif>						
				<cfelseif form.patientDOBYY NEQ "">					
					AND DATEPART(year, e.DOB) = #trim(form.patientDOBYY)#
				</cfif>								
			</cfoutput>			
		</cfsavecontent>	
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Run the query that was just built.                                             --->
		<!-------------------------------------------------------------------------------------->			
		<cfquery name="getPatients" datasource="#trim(request.datasource)#">
			#PreserveSingleQuotes(sqlStatement)#
		</cfquery>
				
				
		<cfset request.Entity = CreateobJect("component", "com.common.Entity")>
				
						
		<cfoutput>		
			<form name="#trim(formName)#">
				<div align="left">
					<table border="0" width="85%" cellpadding="0" cellspacing="10">
						<tr>
							<td>
								<cf_gcBorderedTable	title="#trim(getPatients.RecordCount)# Records Found" tablealign="left" tableWidth="100%">	
									<table align=center border="0" cellpadding="6" cellspacing="0">			
										<thead>						
											<td nowrap valign="bottom">&nbsp;</td>
											<td nowrap valign="bottom">ID</td>
											<td nowrap valign="bottom">Full&nbsp;Name</td>												
											<td nowrap valign="bottom" align="center">DOB</td>			
											<td nowrap valign="bottom" align="center">SSN</td>												
										</thead>
										
										<cfset count = 0>
										
										<cfloop query="getPatients">
											
											<cfset count = count + 1>											
											<cfset addressQuery = request.Entity.getEntityAddresses(clientID: trim(session.clientID), entityID: entityID)>
											<cfset phoneQuery = request.Entity.getEntityPhones(clientID: trim(session.clientID), entityID: entityID)>										
																						
											<cfif currentrow MOD 2 EQ 0> 
												<cfset rowColor = "F4F2F2">
											<cfelse>
												<cfset rowColor = "FFFFFF">	
											</cfif>
											
											<cfif IsDate(DOB)>
												<cfif MONTH(trim(DOB)) LTE 9>	
													<cfset thisDOBMM = "0" & MONTH(trim(DOB))>	
												<cfelse>
													<cfset thisDOBMM = MONTH(trim(DOB))>
												</cfif>
												<cfif DAY(trim(DOB)) LTE 9>	
													<cfset thisDOBDD = "0" & DAY(trim(DOB))>	
												<cfelse>
													<cfset thisDOBDD = DAY(trim(DOB))>
												</cfif>
												<cfset thisDOBYY = YEAR(trim(DOB))>
											<cfelse>
												<cfset thisDOBMM = "">	
												<cfset thisDOBDD = "">													
												<cfset thisDOBYY = "">	
											</cfif>
											
											<cfoutput>
												<tr style="cursor: hand;" id="toprow_#trim(patientID)#" onmouseover="this.style.backgroundColor='DCE3EB'; row_#trim(patientID)#.style.backgroundColor='DCE3EB';" onmouseout="this.style.backgroundColor='#trim(rowColor)#'; row_#trim(patientID)#.style.backgroundColor='#trim(rowColor)#';" bgcolor="#trim(rowColor)#">							
													<td colspan="1" class="siteLabel"><img height=9 src="images/plus.gif" name="image_#trim(patientID)#" onclick="toggle('row_#trim(patientID)#', this)" width=9 border=0></td>
													<td class="siteLabel" nowrap onclick="setClose(#trim(patientID)#, '#trim(FName)#', '#trim(Mname)#', '#Replace(LName, "'", "\'", "ALL")#', '#trim(thisDOBMM)#', '#trim(thisDOBDD)#', '#trim(thisDOBYY)#', '#trim(SSN)#', '#trim(Sex)#', '#trim(Weight)#', '#trim(HeightinInches)#', document.#formName#.EntityAddress_#trim(patientID)#.value, document.#formName#.EntityPhone_#trim(patientID)#.value, #entityID#, '#MaritalStatus#');">#trim(PatientID)#</td>
													<td class="siteLabel" nowrap onclick="setClose(#trim(patientID)#, '#trim(FName)#', '#trim(Mname)#', '#Replace(LName, "'", "\'", "ALL")#', '#trim(thisDOBMM)#', '#trim(thisDOBDD)#', '#trim(thisDOBYY)#', '#trim(SSN)#', '#trim(Sex)#', '#trim(Weight)#', '#trim(HeightinInches)#', document.#formName#.EntityAddress_#trim(patientID)#.value, document.#formName#.EntityPhone_#trim(patientID)#.value, #entityID#, '#MaritalStatus#');">#trim(FName)# #LEFT(trim(Mname), 1)# #trim(LName)#</td>		
													<td class="siteLabel" nowrap onclick="setClose(#trim(patientID)#, '#trim(FName)#', '#trim(Mname)#', '#Replace(LName, "'", "\'", "ALL")#', '#trim(thisDOBMM)#', '#trim(thisDOBDD)#', '#trim(thisDOBYY)#', '#trim(SSN)#', '#trim(Sex)#', '#trim(Weight)#', '#trim(HeightinInches)#', document.#formName#.EntityAddress_#trim(patientID)#.value, document.#formName#.EntityPhone_#trim(patientID)#.value, #entityID#, '#MaritalStatus#');"><cfif IsDate(DOB)>#DateFormat(trim(DOB), "MM/DD/YYYY")#</cfif></td>		
													<td class="siteLabel" nowrap onclick="setClose(#trim(patientID)#, '#trim(FName)#', '#trim(Mname)#', '#Replace(LName, "'", "\'", "ALL")#', '#trim(thisDOBMM)#', '#trim(thisDOBDD)#', '#trim(thisDOBYY)#', '#trim(SSN)#', '#trim(Sex)#', '#trim(Weight)#', '#trim(HeightinInches)#', document.#formName#.EntityAddress_#trim(patientID)#.value, document.#formName#.EntityPhone_#trim(patientID)#.value, #entityID#, '#MaritalStatus#');">#trim(SSN)#</td>		
												</tr>											
												<tr style="display:none" id="row_#trim(patientID)#" style="cursor: hand;" onmouseover="this.style.backgroundColor='DCE3EB'; toprow_#trim(patientID)#.style.backgroundColor='DCE3EB';" onmouseout="this.style.backgroundColor='#trim(rowColor)#'; toprow_#trim(patientID)#.style.backgroundColor='#trim(rowColor)#';" bgcolor="#trim(rowColor)#">							
													<td colspan="5" class="siteLabel" nowrap>														
														<select name="EntityAddress_#trim(patientID)#" onchange="" class="SiteSelectBox">
															<option value=""> <cfif addressQuery.RecordCount GTE 1>Select an address....<cfelse>No address on file</cfif>
															<cfif addressQuery.RecordCount GTE 1>
																<cfloop query="addressQuery">
																	<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" standardlistitemID="#trim(stateID)#" listid="4" active="1" returnvariable="getState">
																	<option value="#trim(AddressID)#" <cfif IsDefault>SELECTED</cfif>> #trim(AddressLine1)# #trim(AddressLine2)# #trim(city)#, #trim(getState.ItemNameDisplay)# #trim(zipcode)#
																</cfloop>
															</cfif>
														</select>													
														<select name="EntityPhone_#trim(patientID)#" onchange="" class="SiteSelectBox">
															<option value=""> <cfif phoneQuery.RecordCount GTE 1>Select a phone....<cfelse>No phone on file</cfif>
															<cfif phoneQuery.RecordCount GTE 1>
																<cfloop query="phoneQuery">
																	<cfset PhoneD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(PhoneNumber)) />
																	<option value="#trim(PhoneID)#" <cfif IsDefault>SELECTED</cfif>> #REQUEST.formatPhoneUS(PhoneD)#
																</cfloop>
															</cfif>
														</select>														
													</td>		
												</tr>
											</cfoutput>
											
										</cfloop>
										
									</table>
								</cf_gcBorderedTable>
							</td>
						</tr>
					</table>	
				</div>	
			</form>		
		</cfoutput>
						
	</cfif>		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<!---
/*window.opener.document.#trim(form.callerFormName)#.PatientID.value = PatientID;				
					window.opener.document.#trim(form.callerFormName)#.patientFNameTBox.value = FName;					
					window.opener.document.#trim(form.callerFormName)#.patientMInitialTBox.value = MInitial;					
					window.opener.document.#trim(form.callerFormName)#.patientLNameTBox.value = LName;
					window.opener.document.#trim(form.callerFormName)#.patientDOBMM.value = MM;
					window.opener.document.#trim(form.callerFormName)#.patientDOBDD.value = DD;
					window.opener.document.#trim(form.callerFormName)#.patientDOBYY.value = YY;
					window.opener.document.#trim(form.callerFormName)#.patientSSNTBox.value = SSN;	
					window.opener.document.#trim(form.callerFormName)#.patientWeightTBox.value = Weight;
					window.opener.document.#trim(form.callerFormName)#.patientHeightInches.value = Height;																				
					if(Sex == 0){
						window.opener.checkBoxRadio('td_patientSex', 'CheckUncheckPic_3a', 'OPTION_3a_CBox_PatientSexMale');
					}
					else if(Sex == 1){
						window.opener.checkBoxRadio('td_patientSex', 'CheckUncheckPic_3a', 'OPTION_3a_CBox_PatientSexFemale');
					};	
					
					window.opener.disablePatient(1);
					window.opener.showChange();										
					
					if(AddressID != ""){
						window.opener.document.#trim(form.callerFormName)#.PatientAddressID.value = AddressID;
						window.opener.setPatientAddress(AddressID);
						window.opener.disablePatientAddress(1);								
					}
					if(PhoneID != ""){
						window.opener.document.#trim(form.callerFormName)#.PatientPhoneID.value = PhoneID;
						window.opener.setPatientPhone(PhoneID);	
						window.opener.disablePatientPhone(1);	
					}					
					window.opener.checkIntakeExists();*/
--->	


