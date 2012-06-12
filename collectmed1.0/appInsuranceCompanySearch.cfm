<!---- appInsuranceCompanySearch.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formname" default="searchInsCo">
	<cfset formname = attributes.formname>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create an insurance object.                                                    --->
<!-------------------------------------------------------------------------------------->	
	<cfset request.InsuranceCompany = CreateObject("component", "com.common.InsuranceCompany")>			
	
		
					
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	<cfif NOT IsDefined("form.Submitted")>
		
		<cfset insuranceCompanies = request.InsuranceCompany.getInsuranceCompanies(session.Client.getClientID())>		
		
		<cfoutput>
			<div align="left">
				<table border="0" width="85%" cellpadding="0" cellspacing="10">
					<tr>
						<td>
							<cf_gcBorderedTable	title="Search&nbsp;Insurance&nbsp;Companies" tablealign="left" tableWidth="100%">	
								<form name="#trim(formName)#" method="post">
									<input type="Hidden" name="Submitted" value="yes">			
									<input type="Hidden" name="callerFormName" value="#trim(url.callerFormName)#">
									<input type="Hidden" name="callerInsuranceNumber" value="#trim(url.num)#">		
																		
									<table align="left" cellpadding="5" cellspacing="0" border="0">				
										<tr>					
											<td valign="top">			   
								   			
												<table cellspacing="4" cellpadding="3" border="0">															
													
													<tr>
													    <td align="right" class="siteLabel">
															Insurance&nbsp;Company&nbsp;Name:
														</td>	
														<td class="siteLabel">
															<input type="Text" size="25" class="siteTextBox" name="InsComName">&nbsp;&nbsp;<cf_gcSubmitButton value="Search">
														</td>							   
													</tr>
													
													<tr>
													    <td align="right" class="siteLabel">
															Select&nbsp;Insurance&nbsp;Company:
														</td>	
														<td class="siteLabel">
															<select class="SiteSelectBox" name="primPatientInsCom" onchange="window.opener.changeinsurance#trim(url.num)#(this.value); self.close();">
																<option value="">
																<cfloop query="insuranceCompanies">
																	<option value="#InsuranceCompanyID#">###InsuranceCompanyID# - #InsuranceCompanyName#
																</cfloop>	
															</select>
														</td>							   
													</tr>
													
													<tr>
													    <td colspan="2" align="center"><input type="Button" class="SiteSubmitbox" value="Close&nbsp;Page" name="closeTD" onclick="window.close();"></td>							   
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
		</cfoutput>
	
	
	
	<cfelse>
		
				
		<cfoutput>
			<script language="JavaScript">
				function setClose(ID){					
					window.opener.changeinsurance#trim(form.callerInsuranceNumber)#(ID);					
					self.close();				
				};
			</script>
		</cfoutput>	
			
								
		<cfif form.InsComName NEQ "">
			
			<cfquery name="insuranceCompanies" datasource="#trim(request.datasource)#">
				SELECT  IC.InsuranceCompanyID, IC.InsuranceCompanyName, A.AddressLine1, A.AddressLine2, A.City, sli.ItemNameDisplay AS State, A.ZipCode
				FROM insurancecompany IC 
				LEFT JOIN EntityAddress EA ON IC.EntityID = EA.EntityID
				LEFT JOIN ADDRESS A ON EA.AddressID = A.AddressID  
				LEFT JOIN pa_master.standardlistitem sli ON A.StateID = sli.StandardListItemID
				WHERE IC.ClientID = #session.Client.getClientID()#
				AND IC.InsuranceCompanyName LIKE '%#trim(form.InsComName)#%'
			</cfquery>
			
		</cfif> 
		
								
		<cfoutput>
			<div align="left">
				<table border="0" width="85%" cellpadding="0" cellspacing="10">
					<tr>
						<td>
							<cf_gcBorderedTable	title="#trim(insuranceCompanies.RecordCount)# Records Found" tablealign="left" tableWidth="100%">	
								<table align=center border="0" cellpadding="6" cellspacing="0">			
									<thead>						
										<td nowrap valign="bottom">ID</td>
										<td nowrap valign="bottom">Name&nbsp;&&nbsp;Address</td>			
									</thead>
									
									<cfset count = 0>
									
									<cfloop query="insuranceCompanies">
										
										<cfset count = count + 1>											
										
										<cfif currentrow MOD 2 EQ 0> 
											<cfset rowColor = "F4F2F2">
										<cfelse>
											<cfset rowColor = "FFFFFF">	
										</cfif>
										<cfset thisDescription = Replace('Description', "'", "\'", "ALL")>															
										<cfoutput>
											<tr  style="cursor: hand;" onmouseover="this.style.backgroundColor='DCE3EB';" onmouseout="this.style.backgroundColor='#trim(rowColor)#';" onclick="setClose('#trim(InsuranceCompanyID)#', '#trim(thisDescription)#');" bgcolor="#trim(rowColor)#">							
												<td class="siteLabel" nowrap align="left">#trim(InsuranceCompanyID)#</td>
												<td class="siteLabel" nowrap><strong>#trim(InsuranceCompanyname)#</strong> #trim(AddressLine1)# #trim(AddressLine2)# #trim(City)#, #trim(State)# #trim(ZipCode)#</td>			
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
	
	

