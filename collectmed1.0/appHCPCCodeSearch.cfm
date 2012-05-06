<!---- appHCPCCodeSearch.cfm ---->



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formname" default="searchHCPC">
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
							<cf_gcBorderedTable	title="Search&nbsp;HCPC&nbsp;Codes" tablealign="left" tableWidth="100%">	
								<form name="#trim(formName)#" method="post">
									<input type="Hidden" name="Submitted" value="yes">			
									<input type="Hidden" name="callerFormName" value="#trim(url.callerFormName)#">	
									<input type="Hidden" name="callerFieldName" value="#trim(url.callerFieldName)#">	
									<input type="Hidden" name="callerProdName" value="#trim(url.callerProdName)#">													
									<table align="left" cellpadding="5" cellspacing="0" border="0">				
										<tr>					
											<td valign="top">			   
								   			
												<table cellspacing="4" cellpadding="3" border="0">															
													
													<tr>
													    <td align="right" class="siteLabel">
															HCPC&nbsp;Code:
														</td>	
														<td class="siteLabel">
															<input type="Text" size="25" class="siteTextBox" name="hcpcCode">
														</td>							   
													</tr>
													
													<tr>
													    <td align="right" class="siteLabel">
															HCPC&nbsp;Description:
														</td>	
														<td class="siteLabel">
															<input type="Text" size="50" class="siteTextBox" name="hcpcDescription">
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
				document.getElementById("hcpcCode").focus();					
			</script>
		</cfoutput>	
	
	
	
	<cfelse>
		
		<cfoutput>
			<script language="JavaScript">
				function setClose(code, desc){					
					window.opener.document.#trim(form.callerFormName)#.#trim(form.callerFieldName)#.value = code;
					window.opener.document.#trim(form.callerFormName)#.#trim(form.callerProdName)#.value = desc + "; " + window.opener.document.#trim(form.callerFormName)#.#trim(form.callerProdName)#.value;	
					self.close();				
				};
			</script>
		</cfoutput>
				
		<cfsavecontent variable="sqlStatement">			
			<cfoutput>
				SELECT recordID, HCPC, LEFT(LongDescription,100) AS Description
				FROM pa_master.EOB_MEDICARE_PROCEDURECode
				<cfif form.hcpcCode NEQ "" OR form.hcpcDescription NEQ "">
					WHERE							
					<cfif form.hcpcCode NEQ "">
						HCPC LIKE '%#trim(form.hcpcCode)#%'
					</cfif> 
					
					<cfif form.hcpcDescription NEQ "">
						<cfif form.hcpcCode NEQ "">AND </cfif> LongDescription LIKE '%#trim(form.hcpcDescription)#%'
					</cfif> 
				
				</cfif> 	
			</cfoutput>			
		</cfsavecontent>	
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Run the query that was just built.                                             --->
		<!-------------------------------------------------------------------------------------->			
		<cfquery name="getHCPCCodes" datasource="#trim(request.datasource)#">
			#PreserveSingleQuotes(sqlStatement)#
		</cfquery>
				
						
		<cfoutput>
			<div align="left">
				<table border="0" width="85%" cellpadding="0" cellspacing="10">
					<tr>
						<td>
							<cf_gcBorderedTable	title="#trim(getHCPCCodes.RecordCount)# Codes Found" tablealign="left" tableWidth="100%">	
								<table align=center border="0" cellpadding="6" cellspacing="0">			
									<thead>						
										<td nowrap valign="bottom">Code</td>
										<td nowrap valign="bottom">Description</td>			
									</thead>
									
									<cfset count = 0>
									
									<cfloop query="getHCPCCodes">
										
										<cfset count = count + 1>								
										
										<!---<cfif count MOD 2 EQ 0> class="TblRow"</cfif>--->
										<cfif currentrow MOD 2 EQ 0> 
											<cfset rowColor = "F4F2F2">
										<cfelse>
											<cfset rowColor = "FFFFFF">	
										</cfif>
										<cfset thisDescription = ReplaceNoCase(Description, "'", "\'", "ALL")>	
										<cfset thisDescription = ReplaceNoCase(thisDescription, CHR(34), " inch", "ALL")>																
										<cfset thisDescription = REQUEST.fullLeft(thisDescription, 98)>																	
										<cfoutput>
											<tr style="cursor: hand;" onmouseover="this.style.backgroundColor='DCE3EB';" onmouseout="this.style.backgroundColor='#trim(rowColor)#';" onclick="setClose('#trim(HCPC)#', '#trim(thisDescription)#');" bgcolor="#trim(rowColor)#">							
												<td class="siteLabel" nowrap align="left">#trim(HCPC)#</td>
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
	
	
