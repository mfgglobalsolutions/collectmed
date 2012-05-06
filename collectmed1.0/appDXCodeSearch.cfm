<!---- appDXCodeSearch.cfm ---->



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formname" default="searchDX">
	<cfset formname = attributes.formname>
		
	
				
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	<cfif NOT IsDefined("form.Submitted")>

		<cfoutput>
			<div align="left">
				<table border="0" width="85%" cellpadding="0" cellspacing="10">
					<tr>
						<td>
							<cf_gcBorderedTable	title="Search&nbsp;DX&nbsp;Codes" tablealign="left" tableWidth="100%">	
								<form name="#trim(formName)#" method="post">
									<input type="Hidden" name="Submitted" value="yes">			
									<input type="Hidden" name="callerFormName" value="#trim(url.callerFormName)#">	
									<input type="Hidden" name="callerFieldName" value="#trim(url.callerFieldName)#">	
									<cfif IsDefined("url.callerDiagName") AND url.callerDiagName NEQ "">
										<input type="Hidden" name="callerDiagName" value="#trim(url.callerDiagName)#">		
									</cfif>			
									<table align="left" cellpadding="5" cellspacing="0" border="0">				
										<tr>					
											<td valign="top">			   
								   			
												<table cellspacing="4" cellpadding="3" border="0">															
													
													<tr>
													    <td align="right" class="siteLabel">
															DX&nbsp;Code:
														</td>	
														<td class="siteLabel">
															<input type="Text" size="25" class="siteTextBox" name="dxCode">
														</td>							   
													</tr>
													
													<tr>
													    <td align="right" class="siteLabel">
															DX&nbsp;Description:
														</td>	
														<td class="siteLabel">
															<input type="Text" size="50" class="siteTextBox" name="dxDescription">
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
		</cfoutput>
	
		
		<!------------------------------------------------------------------>
		<!--- Set the focus on this form to the highest editable field.  --->
		<!------------------------------------------------------------------>		
		<cfoutput>
			<script language="JavaScript">
				document.getElementById("dxCode").focus();					
			</script>
		</cfoutput>	
	
	
	<cfelse>
		
		<cfoutput>
			<script language="JavaScript">
				function setClose(code, desc){					
					window.opener.document.#trim(form.callerFormName)#.#trim(form.callerFieldName)#.value = code;
					<cfif IsDefined("form.callerDiagName") AND form.callerDiagName NEQ "">
						window.opener.document.#trim(form.callerFormName)#.#trim(form.callerDiagName)#.value = desc;	
					</cfif>
					self.close();				
				};
			</script>
		</cfoutput>
				
		<cfsavecontent variable="sqlStatement">			
			<cfoutput>
				SELECT recordID, Code, Description
				FROM pa_master.EOB_MEDICARE_DXCode
				<cfif form.dxCode NEQ "" OR form.dxDescription NEQ "">
					WHERE							
					<cfif form.dxCode NEQ "">
						Code LIKE '%#trim(form.dxCode)#%'
					</cfif> 
					
					<cfif form.dxDescription NEQ "">
						<cfif form.dxCode NEQ "">AND </cfif> Description LIKE '%#trim(form.dxDescription)#%'
					</cfif> 
				
				</cfif> 	
			</cfoutput>			
		</cfsavecontent>	
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Run the query that was just built.                                             --->
		<!-------------------------------------------------------------------------------------->			
		<cfquery name="getDXCodes" datasource="#trim(request.datasource)#">
			#PreserveSingleQuotes(sqlStatement)#
		</cfquery>
				
						
		<cfoutput>
			<div align="left">
				<table border="0" width="85%" cellpadding="0" cellspacing="10">
					<tr>
						<td>
							<cf_gcBorderedTable	title="#trim(getDXCodes.RecordCount)# Codes Found" tablealign="left" tableWidth="100%">	
								<table align=center border="0" cellpadding="6" cellspacing="0">			
									<thead>						
										<td nowrap valign="bottom">Code</td>
										<td nowrap valign="bottom">Description</td>			
									</thead>
									
									<cfset count = 0>
									
									<cfloop query="getDXCodes">
										
										<cfset count = count + 1>								
										
										<!---<cfif count MOD 2 EQ 0> class="TblRow"</cfif>--->
										<cfif currentrow MOD 2 EQ 0> 
											<cfset rowColor = "F4F2F2">
										<cfelse>
											<cfset rowColor = "FFFFFF">	
										</cfif>
										<cfset thisDescription = Replace(Description, "'", "\'", "ALL")>															
										<cfoutput>
											<tr  style="cursor: hand;" onmouseover="this.style.backgroundColor='DCE3EB';" onmouseout="this.style.backgroundColor='#trim(rowColor)#';" onclick="setClose('#trim(Code)#', '#trim(thisDescription)#');" bgcolor="#trim(rowColor)#">							
												<td class="siteLabel" nowrap align="left">#trim(Code)#</td>
												<td class="siteLabel" nowrap>#trim(Description)#</td>			
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
	
	
