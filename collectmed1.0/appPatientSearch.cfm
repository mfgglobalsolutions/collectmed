<!---- appPatientSearch.cfm ---->


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
			
			<style>
				##yellowAlert{
					background-color:ffffcc; 
					display:none; 
					width:540; 
					border:1px solid ccc889; 
					color:616161; 
					padding:10px; 
					margin-bottom:1em; 
				}
			</style>
				
			<script language="JavaScript">
				function validateForm(){				
					
					if(document.#trim(formname)#.FName.value == "" && document.#trim(formname)#.LName.value == "" && document.#trim(formname)#.SSN.value == "" && document.#trim(formname)#.patientDOBMM.value == "" && document.#trim(formname)#.patientDOBDD.value == "" && document.#trim(formname)#.patientDOBYY.value == ""){		
						var blankSearch = confirm("NOTE: At least one field must be filled in order to search.");
						resetSubmitButtons();
						return false;
					};	
					
					if(document.#trim(formname)#.patientDOBMM.value != "" || document.#trim(formname)#.patientDOBDD.value != "" || document.#trim(formname)#.patientDOBYY.value != "" ){
						if(document.#trim(formname)#.patientDOBMM.value == "" || document.#trim(formname)#.patientDOBDD.value == "" || document.#trim(formname)#.patientDOBYY.value == "" ){
							msg = "You must provide the full date of birth.";
							sp_errorMsg.innerHTML = msg;
							tr_errorMsg.style.display = 'inline';
							resetSubmitButtons();
							return false;
						};	
					};
					
					if(document.#trim(formname)#.SSN.value != "" && document.#trim(formname)#.SSN.value.length < 3){
						msg = "You must provide at least 3 characters of the SSN to search on.";
						sp_errorMsg.innerHTML = msg;
						tr_errorMsg.style.display = 'inline';
						resetSubmitButtons();
						return false;						
					};
																			
				};	
			</script>
		
			<div align="center">
				
				<table border="0" width="50%" cellpadding="0" cellspacing="10">
										
					<tr id="tr_errorMsg" style="display:none">
						<td colspan="3" align="center">
							<div id="yellowAlert" class="yecerrbg" style="display:block">
								<table cellpadding="2" cellspacing="0" border="0" width="540">
									<tr valign="top">
										<td>
											<img src="images/alert.gif" alt="Alert" border="0" width="41" height="42" align="middle">
										</td>
										<td valign="top" class="siteLabel">
											<b>Please correct the following entries.</b>
											<ul>
												<span id="sp_errorMsg"></span>										
								 			</ul>
										</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
					
					<tr>
						<td>
							<cf_gcBorderedTable	title="Search&nbsp;Patients" tablealign="left" tableWidth="100%">	
								<form name="#trim(formName)#" method="post" onsubmit="return validateForm();">
									<input type="Hidden" name="Submitted" value="yes">																		
									<table align="center" cellpadding="5" cellspacing="0" border="0">				
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
				/*if(document.getElementById("LName")){				
					document.getElementById("LName").focus();						
				};*/
			</script>
		</cfoutput>	
	
	
	
	<cfelse>
		
		<cfoutput>
			<script language="JavaScript">
				
				function patientOnclick(id){
					editPatient = window.open('appPatient.cfm?reload=no&patientid=' + id, 'editPatient', 'top=' + newWindowGetY(600) + ',left=' + newWindowGetX(825) + ',dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=825,height=600'); 
					editPatient.focus(0); 
												
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
				<div align="center">
					<table border="0" width="50%" cellpadding="0" cellspacing="10">
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
												<cfif MONTH(trim(DOB)) LT 9>	
													<cfset thisDOBMM = "0" & MONTH(trim(DOB))>	
												<cfelse>
													<cfset thisDOBMM = MONTH(trim(DOB))>
												</cfif>
												<cfif DAY(trim(DOB)) LT 9>	
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
												
												<!---showChange();--->
												<tr style="cursor: hand;" id="toprow_#trim(patientID)#" onmouseover="this.style.backgroundColor='DCE3EB'; row_#trim(patientID)#.style.backgroundColor='DCE3EB';" onmouseout="this.style.backgroundColor='#trim(rowColor)#'; row_#trim(patientID)#.style.backgroundColor='#trim(rowColor)#';" bgcolor="#trim(rowColor)#">							
													<td colspan="1" class="siteLabel"><img height=9 src="images/plus.gif" name="image_#trim(patientID)#" onclick="toggle('row_#trim(patientID)#', this)" width=9 border=0></td>
													<td class="siteLabel" nowrap onclick="patientOnclick(#trim(patientID)#);">#trim(PatientID)#</td>
													<td class="siteLabel" nowrap onclick="patientOnclick(#trim(patientID)#);">#trim(FName)# #LEFT(trim(Mname), 1)# #trim(LName)#</td>		
													<td class="siteLabel" nowrap onclick="patientOnclick(#trim(patientID)#);"><cfif IsDate(DOB)>#DateFormat(trim(DOB), "MM/DD/YYYY")#</cfif></td>		
													<td class="siteLabel" nowrap onclick="patientOnclick(#trim(patientID)#);">#trim(SSN)#</td>		
												</tr>											
												<tr style="display:none" id="row_#trim(patientID)#" style="cursor: hand;" onmouseover="this.style.backgroundColor='DCE3EB'; toprow_#trim(patientID)#.style.backgroundColor='DCE3EB';" onmouseout="this.style.backgroundColor='#trim(rowColor)#'; toprow_#trim(patientID)#.style.backgroundColor='#trim(rowColor)#';" bgcolor="#trim(rowColor)#">							
													<td colspan="5" class="siteLabel" nowrap>														
														<select name="EntityAddress_#trim(patientID)#" onchange="" class="SiteSelectBox">
															<cfif addressQuery.RecordCount LTE 0><option value="">No address on file</cfif>
															<cfif addressQuery.RecordCount GTE 1>
																<cfloop query="addressQuery">
																	<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" standardlistitemID="#trim(stateID)#" listid="4" active="1" returnvariable="getState">
																	<option value="#trim(AddressID)#" <cfif IsDefault>SELECTED</cfif>> #trim(AddressLine1)# #trim(AddressLine2)# #trim(city)#, #trim(getState.ItemNameDisplay)# #trim(zipcode)#
																</cfloop>
															</cfif>
														</select>													
														<select name="EntityPhone_#trim(patientID)#" onchange="" class="SiteSelectBox">
															<cfif phoneQuery.RecordCount LTE 0><option value="">No phone on file</cfif>
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
	
	

