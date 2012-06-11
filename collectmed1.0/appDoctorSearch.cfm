<!---- appDoctorSearch.cfm ---->


<!---- appDXCodeSearch.cfm ---->



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formname" default="searchDoctor">
	<cfset formname = attributes.formname>
		
	
				
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	<cfif NOT IsDefined("form.Submitted")>

		<cfoutput>
		
			<script language="JavaScript">
				function validateForm(){				
					
					if(document.#trim(formname)#.FName.value == "" && document.#trim(formname)#.LName.value == ""){		
						var blankSearch = confirm("Are you sure you want to search all doctors?\n\nThis will take a few moments to run.");
				
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
							<cf_gcBorderedTable	title="Search&nbsp;Doctors" tablealign="left" tableWidth="100%">	
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
				document.getElementById("LName").focus();					
			</script>
		</cfoutput>	
	
	
	<cfelse>
		
		<cfoutput>
			<script language="JavaScript">
				function setClose(FName, MInitial, LName, Phone, Upin, Fax, Address, City, State, Zip){					
					
					window.opener.setPhysician(FName, MInitial, LName, Phone, Upin, Fax, Address, City, State, Zip);
					/*<!---window.opener.document.#trim(form.callerFormName)#.orderingPhysicianFNameTBox.value = FName;
					window.opener.document.#trim(form.callerFormName)#.orderingPhysicianMInitialTBox.value = MInitial;
					window.opener.document.#trim(form.callerFormName)#.orderingPhysicianLNameTBox.value = LName;
					window.opener.document.#trim(form.callerFormName)#.orderingPhysicianPhoneTBox.value = Phone;
					window.opener.document.#trim(form.callerFormName)#.orderingPhysicianUPINTBox.value = Upin;
					window.opener.document.#trim(form.callerFormName)#.orderingPhysicianFaxTBox.value = Fax;
					window.opener.document.#trim(form.callerFormName)#.orderingPhysicianAddressTBox.value = Address;
					window.opener.document.#trim(form.callerFormName)#.orderingPhysicianCityTBox.value = City;
					window.opener.document.#trim(form.callerFormName)#.orderingPhysicianStateTBox.value = State;
					window.opener.document.#trim(form.callerFormName)#.orderingPhysicianZipTBox.value = Zip;--->*/
					self.close();				
				};
			</script>
		</cfoutput>
				
		<cfsavecontent variable="sqlStatement">			
			<cfoutput>
				SELECT d.EntityID, d.DoctorID, d.Upin, e.PrefixName, e.FName, e.Mname, e.LName <!---, a.addressline1, a.addressline2, City, StateID, sli.ItemNameDisplay, ZipCode--->   
				FROM doctor d
				INNER JOIN entity e ON d.EntityID = e.EntityID				
				WHERE 1 =1 
				<cfif form.LName NEQ "">
					AND e.LName LIKE '%#trim(form.LName)#%'
				</cfif>
				<cfif form.FName NEQ "">
					AND e.FName LIKE '%#trim(form.FName)#%'
				</cfif>								
			</cfoutput>			
		</cfsavecontent>	
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Run the query that was just built.                                             --->
		<!-------------------------------------------------------------------------------------->			
		<cfquery name="getDoctors" datasource="#trim(request.datasource)#">
			#PreserveSingleQuotes(sqlStatement)#
		</cfquery>
				
				
		<cfset request.Entity = CreateobJect("component", "com.common.Entity")>
				
						
		<cfoutput>
			<div align="left">
				<table border="0" width="85%" cellpadding="0" cellspacing="10">
					<tr>
						<td>
							<cf_gcBorderedTable	title="#trim(getDoctors.RecordCount)# Records Found" tablealign="left" tableWidth="100%">	
								<table align=center border="0" cellpadding="6" cellspacing="0">			
									<thead>						
										<td nowrap valign="bottom">ID</td>
										<td nowrap valign="bottom">Full&nbsp;Name</td>			
										<td nowrap valign="bottom">UPIN</td>			
										<td nowrap valign="bottom">Address</td>			
										<td nowrap valign="bottom">Phone</td>			
										<td nowrap valign="bottom">Fax</td>			
									</thead>
									
									<cfset count = 0>
									
									<cfloop query="getDoctors">
										
										<cfset count = count + 1>											
										<cfset addressQuery = request.Entity.getEntityDefaultFullAddress(clientid: session.clientID, entityID: entityID)>
										<cfset PhoneNum = request.Entity.getEntityDefaultPhoneFull(clientid: trim(session.clientID), entityID: entityID)>										
										<cfset FaxNum = request.Entity.getEntityFaxPhoneFull(clientid: trim(session.clientID), entityID: entityID)>																																
										
										<cfif currentrow MOD 2 EQ 0> 
											<cfset rowColor = "F4F2F2">
										<cfelse>
											<cfset rowColor = "FFFFFF">	
										</cfif>
										
										<cfoutput>
											<tr  style="cursor: hand;" onmouseover="this.style.backgroundColor='DCE3EB';" onmouseout="this.style.backgroundColor='#trim(rowColor)#';" onclick="setClose('#trim(FName)#', '#trim(Mname)#', '#trim(LName)#', '#request.formatPhoneUS(trim(PhoneNum))#', '#trim(Upin)#', '#request.formatPhoneUS(trim(FaxNum))#', '#trim(addressQuery.AddressLine1)# #trim(addressQuery.AddressLine2)#', '#trim(addressQuery.City)#', '#trim(addressQuery.StateID)#', '#trim(addressQuery.ZipCode)#');" bgcolor="#trim(rowColor)#">							
												<td class="siteLabel" nowrap align="left">#trim(DoctorID)#</td>
												<td class="siteLabel" nowrap>#trim(PrefixName)# #trim(FName)# #LEFT(trim(Mname), 1)# #trim(LName)#</td>		
												<td class="siteLabel" nowrap>#trim(UPIN)#</td>
												<td class="siteLabel" nowrap>#trim(addressQuery.addressline1)# #trim(addressQuery.addressline2)# <cfif trim(addressQuery.City) NEQ "">#trim(addressQuery.City)#,</cfif> #trim(addressQuery.StateFull)# #trim(addressQuery.ZipCode)#</td>		
												<td class="siteLabel" nowrap>#request.formatPhoneUS(trim(PhoneNum))#</td>		
												<td class="siteLabel" nowrap>#request.formatPhoneUS(trim(FaxNum))#</td>					
											</tr>
										</cfoutput>
										
									</cfloop>
									
								</table>
							</cf_gcBorderedTable>
						</td>
					</tr>
				</table>	
			</div>		
		</cfoutput>
						
	</cfif>		
	
	


