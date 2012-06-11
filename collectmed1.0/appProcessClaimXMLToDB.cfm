<!---- appProcessClaimXMLToDB.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formName" default="attachPatientID">
	<cfset formName = attributes.formName>
	
	<cfparam name="attributes.Submitted" default="no">
	<cfset Submitted = attributes.Submitted>
	
	<cfif IsDefined("form.Submitted") AND form.Submitted NEQ "">
		<cfset Submitted = form.Submitted>
	<cfelseif IsDefined("url.Submitted") AND url.Submitted NEQ "">
		<cfset Submitted = url.Submitted>	
	</cfif>

	<cfparam name="attributes.Claim_ProcessXMLToDBID" default="">
	<cfset Claim_ProcessXMLToDBID = attributes.Claim_ProcessXMLToDBID>
	
	<cfif IsDefined("form.Claim_ProcessXMLToDBID") AND form.Claim_ProcessXMLToDBID NEQ "">
		<cfset Claim_ProcessXMLToDBID = form.Claim_ProcessXMLToDBID>
	<cfelseif IsDefined("url.Claim_ProcessXMLToDBID") AND url.Claim_ProcessXMLToDBID NEQ "">
		<cfset Claim_ProcessXMLToDBID = url.Claim_ProcessXMLToDBID>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="Claim_ProcessXMLToDBID"
		fieldnames="Claim Process XML To DB ID"
		datatypes="numeric">
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Create an object of the claim to process.                                      --->
<!-------------------------------------------------------------------------------------->
	<cfset request.ClaimProcess = CreateObject("component", "com.common.db.Claim_ProcessXMLToDBIO")>	
	<cfset request.ClaimProcess.init(trim(Claim_ProcessXMLToDBID))>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Style for this page.                                                           --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<style>	
			body {
				background-color: ffffff;
			}		
			table.EOBList {
				border-collapse: collapse;
				font: x-small verdana, helvetica, sans-serif;
				margin: 10px;
			}						
			table.EOBList td {
				border: 1px solid ##DCE3EB;
				font-size: 90%;
				padding: 2px 10px 1px 5px;				
				vertical-align: top;				
			}
			table.EOBList th {
				border: 1px solid ##DCE3EB;
				color: ##606060;
				font-weight: normal;
				padding: 2px 10px 1px 5px;			
				background-color: ##DCE3EB;	
			}						
		</style>	
	</cfoutput>	



<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->								
	<cfif NOT submitted>
		
		
		<cfoutput>
			
			<script language="JavaScript">				
				
				function validateForm(){	
				
					var msg  = "";	
									
					if(document.#formName#.patientID.value == ""){
						msg = msg + "You must choose a patient to tie this claim to.";
					}; 
					
					if(msg.length >= 1){						
						alert(msg);
						resetSubmitButtons();
						return false;
					}
					else{						
						return true;
					};	
						
				};
				
				function resubmit(){					
					document.#formName#.Submitted.value = "no";
					<cfif isDefined("form.showAllPatients") and form.showAllPatients>						
						document.#formName#.showAllPatients.value = "no";
					<cfelse>						
						document.#formName#.showAllPatients.value = "yes";
					</cfif>							
					#formName#.submit();				
				};			
				
			</script>
			
		</cfoutput>
		
		
		<cfif request.ClaimProcess.getPossiblePatientID() NEQ "">
			
			<!-------------------------------------------------------------------------------------->
			<!--- Create the ClaimXML object.                                                    --->
			<!-------------------------------------------------------------------------------------->		
			<cfset ClaimXML = XMLParse(request.ClaimProcess.getClaimXML())>
			
			<cfloop from="1" to="#trim(ArrayLen(ClaimXML.CLP.NM1))#" index="namei">
			
				<cfif ClaimXML.CLP.NM1[namei].EntityIdentifierCode1.XMLText EQ "QC" AND ClaimXML.CLP.NM1[namei].EntityTypeQualifier2.XMLText EQ 1>
						
					<cfset LName = ClaimXML.CLP.NM1[namei].NameLastorOrganizationName3.XMLText>			
					<cfif LName NEQ ""><cfset LName = UCase(Mid(LName,1, 1)) & LCase(mid(LName, 2, len(LName)))></cfif>
					<cfset FName = ClaimXML.CLP.NM1[namei].NameFirst4.XMLText>
					<cfif FName NEQ ""><cfset FName = UCase(Mid(FName,1, 1)) & LCase(mid(FName, 2, len(FName)))></cfif>
					<cfset MName = ClaimXML.CLP.NM1[namei].NameMiddle5.XMLText>			
											
				<!--- loop in the CLP Name Element looking for the corrected name. --->
				<cfelseif ClaimXML.CLP.NM1[namei].EntityIdentifierCode1.XMLText EQ "74" AND ClaimXML.CLP.NM1[namei].EntityTypeQualifier2.XMLText EQ 1>
							
					<cfif StructKeyExists(ClaimXML.CLP.NM1[namei], 'NameLastorOrganizationName3') AND ClaimXML.CLP.NM1[namei].NameLastorOrganizationName3.XMLText NEQ "">				
						<cfset LName = ClaimXML.CLP.NM1[namei].NameLastorOrganizationName3.XMLText>			
						<cfif LName NEQ ""><cfset LName = UCase(Mid(LName,1, 1)) & LCase(mid(LName, 2, len(LName)))></cfif>				
					</cfif>				
					<cfif StructKeyExists(ClaimXML.CLP.NM1[namei], 'NameFirst4') AND ClaimXML.CLP.NM1[namei].NameFirst4.XMLText NEQ "">							
						<cfset FName = ClaimXML.CLP.NM1[namei].NameFirst4.XMLText>
						<cfif FName NEQ ""><cfset FName = UCase(Mid(FName,1, 1)) & LCase(mid(FName, 2, len(FName)))></cfif>				
					</cfif>			
					<cfif StructKeyExists(ClaimXML.CLP.NM1[namei], 'NameMiddle5') AND ClaimXML.CLP.NM1[namei].NameMiddle5.XMLText NEQ "">
						<cfset MName = ClaimXML.CLP.NM1[namei].NameMiddle5.XMLText>							
					</cfif>									
								
				</cfif>
				
			</cfloop>
			
			<cfquery name="getPatient" datasource="PAClient_#trim(session.clientID)#">
				SELECT p.PatientID, p.AccountNumber, e.entityID, e.FName, e.MName, e.LName 
				FROM patient p   INNER JOIN entity e ON p.EntityID = e.EntityID
				WHERE e.clientID = #trim(session.clientID)# AND (e.FName = '#trim(FName)#' OR e.FName = '#LEFT(trim(FName), 1)#') AND e.LName = '#trim(LName)#' 
				<cfif MName NEQ "">	AND e.MName = '#trim(MName)#' </cfif>
			</cfquery>	
			
			&nbsp;<br>											
			<cf_gcBorderedTable tableAlign="center" title="Possible Matches">	
				
				<cfoutput>
								
					<table cellspacing="2" cellpadding="2" border="0">
						<tr>
						    <td>
								<font color="FF0000"><strong>The following claim could not be processed, there are one or more possible patient matches. Please choose the correct patient and attach them to the claim.</strong></font>
							</td>
						</tr>						
					</table>						
				
					<form name="#trim(formName)#" method="post" onsubmit="return validateForm();">
						<input type="hidden" name="Submitted" value="yes">	
						<input type="hidden" name="showAllPatients" value="no">	
						<input type="hidden" name="Claim_ProcessXMLToDBID" value="#trim(Claim_ProcessXMLToDBID)#">	
						<input type="Hidden" name="patientID" value="">
						
						<table cellspacing="2" cellpadding="2" border="0">
							<tr>
							    <td class="siteLabel" align="center">
								
									<table cellspacing="4" cellpadding="2" border="0" style="border-Top: 1px solid; border-right: 1px solid; border-bottom: 1px solid; border-left: 1px solid; border-color: 000000;">
										<tr>
							   				<td class="siteLabel">	
												<strong>835 File Information</strong>
											</td>
										</tr>	
											
										<tr>
							   				<td class="siteLabel">										
												
												<strong>Name:</strong> #FName#<cfif MName NEQ ""> #MName#</cfif> #LName#<br>
												<strong>Patient Identification:</strong> #ClaimXML.CLP.ClaimSubmittersIdentifier1.XMLText#<br>
												<strong>ICN:</strong> #ClaimXML.CLP.ReferenceIdentification7.XMLText#					
												
												
												<!-------------------------------------------------------------------------------------->
												<!--- Get the Claim Dates.                                                           --->
												<!-------------------------------------------------------------------------------------->			
												<cfif ClaimXML.CLP.DTM[1].DateTimeQualifier1.XMLText EQ 232>
													<cfloop from="1" to="2" index="ii">
														<cfif ClaimXML.CLP.DTM[ii].DateTimeQualifier1.XMLText EQ 232 AND IsNumeric(ClaimXML.CLP.DTM[ii].Date2.XMLText) AND LEN(ClaimXML.CLP.DTM[ii].Date2.XMLText) EQ 8>
															<cfset fromYear = MID(ClaimXML.CLP.DTM[ii].Date2.XMLText, 1, 4)>
															<cfset fromMonth = MID(ClaimXML.CLP.DTM[ii].Date2.XMLText, 5, 2)>
															<cfset fromDay = MID(ClaimXML.CLP.DTM[ii].Date2.XMLText, 7, 2)>
															<cfset fromDate = CreateDate(fromYear, fromMonth, fromDay)>															
														<cfelseif ClaimXML.CLP.DTM[ii].DateTimeQualifier1.XMLText EQ 233 AND IsNumeric(ClaimXML.CLP.DTM[ii].Date2.XMLText) AND LEN(ClaimXML.CLP.DTM[ii].Date2.XMLText) EQ 8>
															<cfset toYear = MID(ClaimXML.CLP.DTM[ii].Date2.XMLText, 1, 4)>
															<cfset toMonth = MID(ClaimXML.CLP.DTM[ii].Date2.XMLText, 5, 2)>
															<cfset toDay = MID(ClaimXML.CLP.DTM[ii].Date2.XMLText, 7, 2)>
															<cfset toDate = CreateDate(toYear, toMonth, toDay)>	
														</cfif>
													</cfloop>					
												<cfelseif ClaimXML.CLP.DTM[1].DateTimeQualifier1.XMLText EQ 050>						
													<cfset fromYear = MID(ClaimXML.CLP.DTM[1].Date2.XMLText, 1, 4)>
													<cfset fromMonth = MID(ClaimXML.CLP.DTM[1].Date2.XMLText, 5, 2)>
													<cfset fromDay = MID(ClaimXML.CLP.DTM[1].Date2.XMLText, 7, 2)>
													<cfset fromDate = CreateDate(fromYear, fromMonth, fromDay)>	
													<cfset toYear = MID(ClaimXML.CLP.DTM[1].Date2.XMLText, 1, 4)>
													<cfset toMonth = MID(ClaimXML.CLP.DTM[1].Date2.XMLText, 5, 2)>
													<cfset toDay = MID(ClaimXML.CLP.DTM[1].Date2.XMLText, 7, 2)>
													<cfset toDate = CreateDate(toYear, toMonth, toDay)>	
												</cfif>					
																	
													<br>							
												<cfloop from="1" to="#trim(ArrayLen(ClaimXML.CLP.SVC))#" index="iii">
													<br>
																							
													<cfset procModifierList = ClaimXML.CLP.SVC[iii].CompositeMedicalProcedureIdentifier1.XMLText>
																		
													<cfset procedureCode = ListGetAt(procModifierList, 2, ">")>									
													
													<cfset svcPeriodStart = fromDate>
													<cfset svcPeriodEnd = toDate>
													
													<cfif StructKeyExists(ClaimXML.CLP.SVC[iii].DTM, 'DateTimeQualifier1')>
														
														<cfloop from="1" to="#trim(ArrayLen(ClaimXML.CLP.SVC[iii].DTM))#" index="svcdatei">
															
															<cfif ClaimXML.CLP.SVC[iii].DTM[svcdatei].DateTimeQualifier1.XMLText EQ 472>
																<cfset svcDateYear = MID(ClaimXML.CLP.SVC[iii].DTM[svcdatei].Date2.XMLText, 1, 4)>		
																<cfset svcDateMonth = MID(ClaimXML.CLP.SVC[iii].DTM[svcdatei].Date2.XMLText, 5, 2)>		
																<cfset svcDateDay = MID(ClaimXML.CLP.SVC[iii].DTM[svcdatei].Date2.XMLText, 7, 2)>
																<cfset svcDate = CreateDate(svcDateYear, svcDateMonth, svcDateDay)>	
																<cfset svcPeriodStart = svcDate>
																<cfset svcPeriodEnd = svcDate>
															<cfelseif ClaimXML.CLP.SVC[iii].DTM[svcdatei].DateTimeQualifier1.XMLText EQ 150>
																<cfset svcDateYear = MID(ClaimXML.CLP.SVC[iii].DTM[svcdatei].Date2.XMLText, 1, 4)>		
																<cfset svcDateMonth = MID(ClaimXML.CLP.SVC[iii].DTM[svcdatei].Date2.XMLText, 5, 2)>		
																<cfset svcDateDay = MID(ClaimXML.CLP.SVC[iii].DTM[svcdatei].Date2.XMLText, 7, 2)>
																<cfset svcStartDate = CreateDate(svcDateYear, svcDateMonth, svcDateDay)>	
																<cfset svcPeriodStart = svcStartDate>							
															<cfelseif ClaimXML.CLP.SVC[iii].DTM[svcdatei].DateTimeQualifier1.XMLText EQ 151>
																<cfset svcDateYear = MID(ClaimXML.CLP.SVC[iii].DTM[svcdatei].Date2.XMLText, 1, 4)>		
																<cfset svcDateMonth = MID(ClaimXML.CLP.SVC[iii].DTM[svcdatei].Date2.XMLText, 5, 2)>		
																<cfset svcDateDay = MID(ClaimXML.CLP.SVC[iii].DTM[svcdatei].Date2.XMLText, 7, 2)>
																<cfset svcDateEnd = CreateDate(svcDateYear, svcDateMonth, svcDateDay)>	
																<cfset svcPeriodEnd = svcDateEnd>	
															</cfif>	
														
														</cfloop>				
														
													</cfif>						
																
													&nbsp;&nbsp;&nbsp;<strong>Service:</strong> #procedureCode# <strong>From:</strong> #Dateformat(CreateODBCDate(svcPeriodStart), "MM/DD/YYYY")# <strong>To:</strong> #Dateformat(CreateODBCDate(svcPeriodEnd), "MM/DD/YYYY")#											
												
													<cfif ListLen(procModifierList, ">") GTE 3>											
														<strong>MOD:</strong>
														<cfloop from="3" to="#ListLen(procModifierList, '>')#" index="i_procModifierList">																				
															#ListGetAt(trim(procModifierList), i_procModifierList, ">")#							
														</cfloop>										
													</cfif>			
													
												</cfloop>	
									
											</td>
										</tr>
									</table>								
									
								</td>
							</tr>
							
							<tr><td align="center"><u><span id="span_viewPatients" onclick="resubmit();" style="cursor:hand" class="siteLabel">&nbsp;</span></u></td></tr>
							<tr>
								<td align="center">
									<table class="EOBList">		
										<tr>
											<th>&nbsp;</th>
											<th><strong>Patient ID</strong></th>
											<th><strong>Name</strong></th>
											<th><strong>Client Assigned Acct. ##</strong></th>
										</tr>							
										<cfloop query="getPatient">
											<tr>												
												<td class="siteLabel" <cfif isDefined("form.showAllPatients") and form.showAllPatients> style="background-color:ffffcc"</cfif> ><input type="Radio" name="radioPatientID" value="#trim(patientID)#" onclick="document.#formName#.patientID.value = this.value;"></td>
												<td class="siteLabel" align="center" <cfif isDefined("form.showAllPatients") and form.showAllPatients> style="background-color:ffffcc"</cfif>>#PatientID#</td>
												<td class="siteLabel" <cfif isDefined("form.showAllPatients") and form.showAllPatients> style="background-color:ffffcc"</cfif>>#LName#, #FName#<cfif MName NEQ ""> #MName#</cfif></td>
												<td class="siteLabel" <cfif isDefined("form.showAllPatients") and form.showAllPatients> style="background-color:ffffcc"</cfif>>#trim(AccountNumber)#</td>
											</tr>
										</cfloop>
										<cfif isDefined("form.showAllPatients") and form.showAllPatients>
											<cfquery name="getPatients" datasource="PAClient_#trim(session.clientID)#">
												SELECT p.PatientID, p.AccountNumber, e.entityID, e.FName, e.MName, e.LName 
												FROM patient p   INNER JOIN entity e ON p.EntityID = e.EntityID
												WHERE e.active = 1 AND p.active = 1
												ORDER BY e.LName 
											</cfquery>	
											<cfloop query="getPatients">
												<tr>												
													<td class="siteLabel"><input type="Radio" name="radioPatientID" value="#trim(patientID)#" onclick="document.#formName#.patientID.value = this.value;"></td>
													<td class="siteLabel" align="center">#PatientID#</td>
													<td class="siteLabel">#LName#, #FName#<cfif MName NEQ ""> #MName#</cfif></td>
													<td class="siteLabel">#trim(AccountNumber)#</td>
												</tr>
											</cfloop>											
										</cfif>	
									</table>									
								</td>
							</tr>
							
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td align="center">
									<cf_gcSubmitButton value="Submit">&nbsp;&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Cancel & Close" onclick="self.close();">	
								</td>
							</tr>
						</table>							
						
					</form>
				</cfoutput>
										
			</cf_gcBorderedTable>
				
			
			<cfoutput>
			
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
												
					<cfif isDefined("form.showAllPatients") and form.showAllPatients>
						span_viewPatients.innerHTML = 'View Matches Only';
					<cfelse>
						span_viewPatients.innerHTML = 'Show All Patients';	
					</cfif>				
				</script>
				
			</cfoutput>
			
			
		<cfelse>
		
			<cfoutput>
				<table cellspacing="2" cellpadding="2" border="0">
					<tr>
					    <td>
							<font color="FF0000" face="Arial"><strong>The following claim has been processed. If you came to this page from a system message you may dismiss the message.</strong></font>
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td align="center">
							<input type="Button" class="SiteSubmitbox" value="Close Window" onclick="self.close();">								
						</td>
					</tr>						
				</table>		
			</cfoutput>															
					
		</cfif>
	
	<cfelse>

		
		<!-------------------------------------------------------------------------------------->
		<!--- Verify that the needed parameters have been sent in.                           --->
		<!-------------------------------------------------------------------------------------->
			<cf_gcVerifyFields
				fields="patientID"
				fieldnames="Patient ID"
				datatypes="numeric">

		
		<cfset request.ClaimProcess.setPatientID(trim(form.patientID))>	
		<cfset request.ClaimProcess.setPossiblePatientID('')>	
		<cfset request.ClaimProcess.commit()>													
						
		<!-------------------------------------------------------------------------------------->
		<!--- actual call to process the single CLP by the gateway.                          --->
		<!-------------------------------------------------------------------------------------->
		<cfscript>	   
		   structParameters = structNew();	    
		   structParameters.Claim_ProcessXMLToDBID = #trim(Claim_ProcessXMLToDBID)#;
		   structParameters.datasource = #trim(request.datasource)#;
		   structParameters.siteID = 1002;			   
		   structParameters.clientID = #trim(session.Client.getClientID())#;     
		   structParameters.note = "#trim(session.user.getUsersID())#|#trim(session.user.getFName())#|#trim(session.user.getLName())#|System Input Message: User manually assigned this claim to patient.";	    
		</cfscript>		
		
		<cfset SendGatewayMessage("ProcessClaimXMLToDB", structParameters)>
	
		&nbsp;<br>														
		<cf_gcBorderedTable tableAlign="center" title="Claim Processed">	
			
			<cfoutput>		
				
				<table cellspacing="2" cellpadding="2" border="0">
					<tr><td>&nbsp;</td></tr>
					<tr>
					    <td nowrap>
							<font color="FF0000"><strong>The Claim was processed.</strong></font>
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr><td align="center"><input type="Button" class="SiteSubmitbox" value="Close Window" onclick="self.close();"></td></tr>
					<tr><td>&nbsp;</td></tr>
				</table>	
				
			</cfoutput>
									
		</cf_gcBorderedTable>	
		
		
	
	</cfif>		
	
	


