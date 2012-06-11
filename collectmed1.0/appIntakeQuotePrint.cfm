<!---- appIntakeQuotePrint.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.fileDateTimeStamp" default="#DateFormat(NOW(), 'mmddyy')##TimeFormat(NOW(), 'hhmmss')#">
	<cfset fileDateTimeStamp = attributes.fileDateTimeStamp>
	
	<cfparam name="attributes.intakeID" default="">
	<cfset intakeID = attributes.intakeID>
	
	<cfif IsDefined("form.intakeID") AND form.intakeID NEQ "">
		<cfset intakeID = form.intakeID>
	<cfelseif IsDefined("url.intakeID") AND url.intakeID NEQ "">
		<cfset intakeID = url.intakeID>	
	</cfif>
	
	<cfparam name="attributes.formName" default="printQuoteForm">
	<cfset formName = attributes.formName>
	
	<cfparam name="Submitted" default="no">
	
	<cfparam name="attributes.listOfFiles" default="">
	<cfset listOfFiles = attributes.listOfFiles>

	
		
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="intakeID"
		fieldnames="Quote ID"
		datatypes="numeric">	
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Create the quote object.                                                       --->
<!-------------------------------------------------------------------------------------->
	<cfset request.Intake = CreateObject("component", "com.common.Intake")>		
	<cfset request.Intake.init(trim(intakeID))>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- The page starts here with the page not being submitted so it is the first      --->
<!--- screen that the user will see.                                                 --->
<!-------------------------------------------------------------------------------------->   
	<cfif NOT IsDefined("form.Submitted")>	
	
		<cfoutput>
		
			<script language="JavaScript">				
				function showCoverSheetInput(){
					faxCoverSheet_tr2.style.display='inline';
					faxCoverSheet_tr3.style.display='inline';
					faxCoverSheet_tr4.style.display='inline';
					faxCoverSheet_tr5.style.display='inline';
					faxCoverSheet_tr6.style.display='inline';
					faxCoverSheet_tr7.style.display='inline';
					faxCoverSheet_tr8.style.display='inline';
					faxCoverSheet_tr9.style.display='inline';
					faxCoverSheet_tr10.style.display='inline';				
				};			
			</script>
		
			&nbsp;<br><br>
			<cf_gcBorderedTable title="Printed&nbsp;Quote&nbsp;Information" tableAlign="center">	
			
				<form name="#trim(formName)#" method="post">
					
					<input type="hidden" name="Submitted" value="yes">			
					
					<table border="0" cellpadding="4" cellspacing="2"> 
						<tr>
							<td valign="top" nowrap><strong><u><font size="2">On Quote Page</font></u></strong></td>
						</tr>						
						<tr>
							<td class="siteLabel" valign="top" nowrap>			   
					   			Quote Visible Note:&nbsp;								
							</td>
							<td>
								<textarea class="SiteTextArea" name="quoteNote" cols="60" rows="4"></textarea>								
							</td>
						</tr>
						
						<tr><td colspan="2"><br><br></td></tr>
						<tr>
							<td valign="top" nowrap><strong><u><font size="2">Fax Cover Sheet</font></u></strong></td>
						</tr>						
						<tr>
							<td class="siteLabel" valign="top" nowrap>Fax Cover Sheet:&nbsp;</td>
							<td class="siteLabel" valign="top">
								<input type="Radio" name="faxSheet" value="no" checked onclick="faxCoverSheet_tr2.style.display='none';"> No
								<input type="Radio" name="faxSheet" value="yes" onclick="showCoverSheetInput();"> Yes<br>
							</td>
						</tr>
						<tr id="faxCoverSheet_tr3" style="display:'none';">
							<td class="siteLabel" align="right" valign="top" nowrap>Attn:&nbsp;</td>
							<td><input type="Text" class="siteTextBox" name="attention" size="40" maxlength="40" onChange="capitalizeMe(this)"></td>
						</tr>
						<tr id="faxCoverSheet_tr4" style="display:'none';">
							<td class="siteLabel" align="right" valign="top" nowrap>Company&nbsp;Name:&nbsp;</td>
							<td><input type="Text" class="siteTextBox" name="toCompanyName" size="40" maxlength="40" onChange="capitalizeMe(this)"></td>
						</tr>
						<tr id="faxCoverSheet_tr7" style="display:'none';">
							<td class="siteLabel" align="right" valign="top" nowrap>Fax ##:&nbsp;</td>
							<td><input type="Text" class="siteTextBox" name="faxNumber" size="20" maxlength="40" onkeyup="this.value=formatPhoneUS_JS(this.value);"></td>
						</tr>
						<tr id="faxCoverSheet_tr8" style="display:'none';">
							<td class="siteLabel" align="right" valign="top" nowrap>Phone ##:&nbsp;</td>
							<td><input type="Text" class="siteTextBox" name="phoneNumber" size="20" maxlength="40" onkeyup="this.value=formatPhoneUS_JS(this.value);"></td>
						</tr>
						<tr id="faxCoverSheet_tr10" style="display:'none';">
							<td class="siteLabel" align="right" valign="top" nowrap>From:&nbsp;</td>
							<td><input type="Text" onChange="capitalizeMe(this)" class="siteTextBox" name="from" size="40" maxlength="40" value="#trim(session.Entity.getFName())# #trim(session.Entity.getLName())#"></td>
						</tr>
						<tr id="faxCoverSheet_tr6" style="display:'none';">
							<td class="siteLabel" align="right" valign="top" nowrap>Date:&nbsp;</td>
							<td><input type="Text" class="siteTextBox" name="date" size="20" maxlength="40" value="#DateFormat(NOW(), 'mm/dd/yy')# #TimeFormat(NOW(), 'hh:mm tt')#"></td>
						</tr>						
						<tr id="faxCoverSheet_tr5" style="display:'none';">
							<td class="siteLabel" align="right" valign="top" nowrap>Re&nbsp;Patient:&nbsp;</td>
							<td><input type="Text" onChange="capitalizeMe(this)" class="siteTextBox" name="regarding" size="40" maxlength="40" value="#REQUEST.capitalizeEveryFirstLetter(trim(request.Intake.getPatientFNameTBox()))# #REQUEST.capitalizeEveryFirstLetter(trim(request.Intake.getPatientLNameTBox()))#"></td>
						</tr>
						<tr id="faxCoverSheet_tr9" style="display:'none';">
							<td class="siteLabel" align="right" valign="top" nowrap>Pages:&nbsp;</td>
							<td><input type="Text" class="siteTextBox" name="pages" size="5" maxlength="40" value="2"></td>
						</tr>						
						<tr id="faxCoverSheet_tr2" style="display:'none';">
							<td class="siteLabel" valign="top" nowrap>Fax Cover Page Note:&nbsp;</td>
							<td><textarea class="SiteTextArea" name="faxNote" cols="60" rows="4"></textarea></td>
						</tr>	
						
						<tr>
							<td class="siteLabel" align="center" nowrap colspan="2">
								<br><br>
							</td>							
						</tr>	
						<tr>
							<td class="siteLabel" align="center" nowrap colspan="2">
								<input type="Submit" class="siteSubmitBox" value="Print Quote"><!--- onclick="printQuote();"--->							
							</td>							
						</tr>						
						
					</table>			
				
				</form>
			
			</cf_gcBorderedTable>	
		
		</cfoutput>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- The page has been submitted now push to the PDF.                               --->
<!-------------------------------------------------------------------------------------->	
	<cfelse>
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Create the address object to work with addresses with.                         --->
		<!-------------------------------------------------------------------------------------->
		<cfset request.EntityObj = CreateObject("component", "com.common.Entity")>	
		<cfset clientAddress = request.EntityObj.getEntityDefaultFullAddress(clientID: trim(session.clientID), EntityID: session.Client.getEntityID(), Active: 1)>					
			
		<cfset defaultPhone = request.EntityObj.getEntityDefaultPhoneFull(clientID: trim(session.clientID), entityID: trim(session.Client.getEntityID()))>
		<cfset faxPhone = request.EntityObj.getEntityFaxPhoneFull(clientID: trim(session.clientID), entityID: trim(session.Client.getEntityID()))>
		
		
		
		<cfif IsDefined("form.faxSheet") AND form.faxSheet>					
			
			<cfsavecontent variable="CoverSheetPrintVariable">	
				
				<cfoutput>
				
					<style>	
				
						table.EOBList {
							border-collapse: collapse;
							font: x-small verdana, helvetica, sans-serif;
							margin: 10px;
						}
						table.EOBList caption {
							background-color: ##DCE3EB;
							color: ##003399;
							font-weight: bold;
							padding: 3px 10px 3px 10px;				
						}
						table.EOBList td {
							border: 0px solid ##DCE3EB;
							font-size: 95%;
							padding: 5px 5px 1px 5px;				
							/*vertical-align: top;	*/			
						}
						table.EOBList th {
							border: 0px solid ##DCE3EB;
							color: ##606060;
							font-weight: normal;
							padding: 2px 10px 1px 5px;				
						}					
						.EOBquoteTableBody TABLE{
						    font-size: 1em; 
						}
						.EOBquoteTableBody A:link, .EOBquoteTableBody A:visited{
						    color:##003399;
						    text-decoration:underline; 
						}
						.EOBquoteTableBody A:hover{
						    color:red;
						    text-decoration:none; 
						}
						.EOBquoteTableBody th{
						    font-weight:bold; 
						}
						.EOBquoteTableBody td {
						    font-size: 8pt; 
						    font-family: verdana, arial, helvetica, sans-serif; 
						}					
					</style>
			
				
					<span class="EOBquoteTableBody">							
							
						<!-------------------------------------------------------------------------------------->
						<!--- Start the Cover page code.                                                     --->
						<!-------------------------------------------------------------------------------------->						
						<table width="700" cellspacing="2" cellpadding="2" border="0">
							<tr>
							    <td class="siteLabel" valign="top">									
									<strong>
										#trim(clientAddress.AddressLine1)#
										<cfif trim(clientAddress.AddressLine2) NEQ ""><br>#trim(clientAddress.AddressLine2)#</cfif>
										<br>#trim(clientAddress.City)#, #trim(clientAddress.StateFull)# #trim(clientAddress.ZipCode)#
										<br>Office: #request.formatPhoneUS(defaultPhone)#
										<br>Fax: #request.formatPhoneUS(faxPhone)#
									</strong>									
								</td>
								<td class="siteLabel" valign="top" align="right">
									<font face="Arial Black" size="3" color="000000">
										#trim(session.Client.getClientName())#&nbsp;
									</font>
								</td>							
							</tr>
							<tr><td colspan="2">&nbsp;</td></tr>
							<tr>
							    <td valign="top" colspan="2">
									<font face="Arial Black" size="8" color="000000">
										Fax
									</font>
								</td>
							</tr>
							<tr>
							    <td valign="top">
									<strong>To:</strong> #trim(form.Attention)#
								</td>
								<td align="right">
									<strong>From:</strong> #trim(form.from)#
								</td>
							</tr>
							<tr>
							    <td valign="top">
									<strong>Company:</strong> #trim(form.toCompanyName)#
								</td>
								<td align="right">
									<strong>Pages:</strong> #trim(form.Pages)#
								</td>
							</tr>
							<tr>
							    <td valign="top">
									<strong>Fax:</strong> #trim(form.faxNumber)#
								</td>								
								<td align="right">
									<strong>Date:</strong> #DateFormat(NOW(), 'mm/dd/yyyy')#
								</td>
							</tr>
							<tr>
							    <td valign="top">
									<strong>Phone:</strong> #trim(form.phoneNumber)#
								</td>								
								<td align="right">&nbsp;</td>
							</tr>
							<tr>							   
								<td valign="top">
									<strong>Re:</strong> #trim(form.regarding)#<!---#request.Intake.getPatientFNameTBox()#&nbsp;#request.Intake.getPatientLNameTBox()#--->
								</td>
								<td align="right">&nbsp;</td>
							</tr>
							<td colspan="2">
								<span width="100%" class="EOBclaimTableBody">
									<hr color="000000" style="margin:0px;padding:0px;border-bottom:1px solid 777;border-top:0px;border-left:0px;border-right:0px;line-height:0px;height:1px;display:block;">
								</span>
							</td>
							<tr><td colspan="2">&nbsp;</td></tr>
							<tr>
							    <td colspan="2" align="center">
									<table width="600" cellspacing="2" cellpadding="2" border="0">
										<tr>
											<td><strong>NOTE:</strong> #trim(form.faxNote)#</td>
										</tr>
									</table>													
								</td>							
							</tr>
						</table>						
						
					</span>	
													
				</cfoutput>
			
			</cfsavecontent>
			
		</cfif>	
		
			
			
			
			
			
			
		<cf_tagQuotePrint
			ClientID="#trim(session.ClientID)#"
			clientAddressAddressLine1="#trim(clientAddress.AddressLine1)#"
			clientAddressAddressLine2="#trim(clientAddress.AddressLine2)#"
			clientAddressCity="#trim(clientAddress.City)#"
			clientAddressStateFull="#trim(clientAddress.StateFull)#"
			clientAddressZipCode="#trim(clientAddress.ZipCode)#"
			defaultPhone="#request.formatPhoneUS(defaultPhone)#"
			faxPhone="#request.formatPhoneUS(faxPhone)#"					
			intakeID="#request.Intake.getintakeID()#"			
			PatientFNameTBox="#request.CapitalizeFirstLetter(request.Intake.getPatientFNameTBox())#"
			PatientLNameTBox="#request.CapitalizeFirstLetter(request.Intake.getPatientLNameTBox())#"
			PatientPhoneTBox="#request.formatPhoneUS(request.Intake.getPatientPhoneTBox())#"		
			patientDOBMM="#request.Intake.getpatientDOBMM()#"
			patientDOBDD="#request.Intake.getpatientDOBDD()#"
			patientDOBYY="#request.Intake.getpatientDOBYY()#"
			hcpcCode1TBox="#request.Intake.gethcpcCode1TBox()#"
			hcpcQty1TBox="#request.Intake.gethcpcQty1TBox()#"
			hcpcProduct1TBox="#request.Intake.gethcpcProduct1TBox()#"
			hcpcCost1TBox="#request.Intake.gethcpcCost1TBox()#"
			hcpcDX1TBox="#request.Intake.gethcpcDX1TBox()#"
			hcpcDiagnosis1TBox="#request.Intake.gethcpcDiagnosis1TBox()#"
			hcpcCode2TBox="#request.Intake.gethcpcCode2TBox()#"
			hcpcQty2TBox="#request.Intake.gethcpcQty2TBox()#"
			hcpcProduct2TBox="#request.Intake.gethcpcProduct2TBox()#"
			hcpcCost2TBox="#request.Intake.gethcpcCost2TBox()#"
			hcpcDX2TBox="#request.Intake.gethcpcDX2TBox()#"
			hcpcDiagnosis2TBox="#request.Intake.gethcpcDiagnosis2TBox()#"
			hcpcCode3TBox="#request.Intake.gethcpcCode3TBox()#"
			hcpcQty3TBox="#request.Intake.gethcpcQty3TBox()#"
			hcpcProduct3TBox="#request.Intake.gethcpcProduct3TBox()#"
			hcpcCost3TBox="#request.Intake.gethcpcCost3TBox()#"
			hcpcDX3TBox="#request.Intake.gethcpcDX3TBox()#"
			hcpcDiagnosis3TBox="#request.Intake.gethcpcDiagnosis3TBox()#"
			hcpcCode4TBox="#request.Intake.gethcpcCode4TBox()#"
			hcpcQty4TBox="#request.Intake.gethcpcQty4TBox()#"
			hcpcProduct4TBox="#request.Intake.gethcpcProduct4TBox()#"
			hcpcCost4TBox="#request.Intake.gethcpcCost4TBox()#"
			hcpcDX4TBox="#request.Intake.gethcpcDX4TBox()#"
			hcpcDiagnosis4TBox="#request.Intake.gethcpcDiagnosis4TBox()#"
			hcpcCode5TBox="#request.Intake.gethcpcCode5TBox()#"
			hcpcQty5TBox="#request.Intake.gethcpcQty5TBox()#"
			hcpcProduct5TBox="#request.Intake.gethcpcProduct5TBox()#"
			hcpcCost5TBox="#request.Intake.gethcpcCost5TBox()#"
			hcpcDX5TBox="#request.Intake.gethcpcDX5TBox()#"
			hcpcDiagnosis5TBox="#request.Intake.gethcpcDiagnosis5TBox()#"
			hcpcCode6TBox="#request.Intake.gethcpcCode6TBox()#"
			hcpcQty6TBox="#request.Intake.gethcpcQty6TBox()#"
			hcpcProduct6TBox="#request.Intake.gethcpcProduct6TBox()#"
			hcpcCost6TBox="#request.Intake.gethcpcCost6TBox()#"
			hcpcDX6TBox="#request.Intake.gethcpcDX6TBox()#"
			hcpcDiagnosis6TBox="#request.Intake.gethcpcDiagnosis6TBox()#"
			hcpcCode7TBox="#request.Intake.gethcpcCode7TBox()#"
			hcpcQty7TBox="#request.Intake.gethcpcQty7TBox()#"
			hcpcProduct7TBox="#request.Intake.gethcpcProduct7TBox()#"
			hcpcCost7TBox="#request.Intake.gethcpcCost7TBox()#"
			hcpcDX7TBox="#request.Intake.gethcpcDX7TBox()#"
			hcpcDiagnosis7TBox="#request.Intake.gethcpcDiagnosis7TBox()#"
			hcpcCode8TBox="#request.Intake.gethcpcCode8TBox()#"
			hcpcQty8TBox="#request.Intake.gethcpcQty8TBox()#"
			hcpcProduct8TBox="#request.Intake.gethcpcProduct8TBox()#"
			hcpcCost8TBox="#request.Intake.gethcpcCost8TBox()#"
			hcpcDX8TBox="#request.Intake.gethcpcDX8TBox()#"
			hcpcDiagnosis8TBox="#request.Intake.gethcpcDiagnosis8TBox()#"
			hcpcCode9TBox="#request.Intake.gethcpcCode9TBox()#"
			hcpcQty9TBox="#request.Intake.gethcpcQty9TBox()#"
			hcpcProduct9TBox="#request.Intake.gethcpcProduct9TBox()#"
			hcpcCost9TBox="#request.Intake.gethcpcCost9TBox()#"
			hcpcDX9TBox="#request.Intake.gethcpcDX9TBox()#"
			hcpcDiagnosis9TBox="#request.Intake.gethcpcDiagnosis9TBox()#"
			hcpcCode10TBox="#request.Intake.gethcpcCode10TBox()#"
			hcpcQty10TBox="#request.Intake.gethcpcQty10TBox()#"
			hcpcProduct10TBox="#request.Intake.gethcpcProduct10TBox()#"
			hcpcCost10TBox="#request.Intake.gethcpcCost10TBox()#"
			hcpcDX10TBox="#request.Intake.gethcpcDX10TBox()#"
			hcpcDiagnosis10TBox="#request.Intake.gethcpcDiagnosis10TBox()#"
			quoteNote="#trim(form.quoteNote)#">	
			
			
			
				
			<!-------------------------------------------------------------------------------------->
			<!--- Create the Quote print file PDF. Placing pagetype="A4" keeps everything on     --->
			<!--- the same page.                                                                 --->
			<!-------------------------------------------------------------------------------------->
			<cfif IsDefined("form.faxSheet") AND form.faxSheet>					
				
				<cfdocument marginbottom=".05" marginleft=".15" marginright=".15" margintop=".15" format="PDF" filename="#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\IntakeQuoteCoverSheetVariable_#session.Client.getClientID()#_#trim(fileDateTimeStamp)#_#trim(intakeID)#.pdf" overwrite="yes">
					<cfoutput>							
						#CoverSheetPrintVariable#
					</cfoutput>
				</cfdocument>
				<cfset listOfFiles = listAppend(listOfFiles,"#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\IntakeQuoteCoverSheetVariable_#session.Client.getClientID()#_#trim(fileDateTimeStamp)#_#trim(intakeID)#.pdf")>
			
			</cfif>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Create the Quote print file PDF. Placing pagetype="A4" keeps everything on     --->
			<!--- the same page.                                                                 --->
			<!-------------------------------------------------------------------------------------->
			<cfdocument marginbottom=".05" marginleft=".15" marginright=".15" margintop=".15" format="PDF" filename="#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\IntakeQuotePrintVariable_#session.Client.getClientID()#_#trim(fileDateTimeStamp)#_#trim(intakeID)#.pdf" overwrite="yes">
				<cfoutput>							
					#QuotePrintVariable#
				</cfoutput>
			</cfdocument>
			<cfset listOfFiles = listAppend(listOfFiles,"#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\IntakeQuotePrintVariable_#session.Client.getClientID()#_#trim(fileDateTimeStamp)#_#trim(intakeID)#.pdf")>
									
				
			<!-------------------------------------------------------------------------------------->
			<!--- Create the actual pdf that will be printed.                                    --->
			<!-------------------------------------------------------------------------------------->			
			<cfif ListLen(listOfFiles) GTE 1>
				
				<cfset finalFileName = "IntakeQuotePrintFinal_#session.Client.getClientID()#_#trim(fileDateTimeStamp)#_#trim(intakeID)#.pdf">
			
				<cf_gcConcatenatePDFs 
					listofPDFs="#trim(listOfFiles)#"
					finalOutPutFile="#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\#trim(finalFileName)#">
				
					

				<!-------------------------------------------------------------------------------------->
				<!--- Now that we know the print was done lets log it.                               --->
				<!-------------------------------------------------------------------------------------->
				<cfset newPrinted = ListAppend(request.Intake.getPrinted(), "#DateFormat(NOW(), 'mm/dd/yyyy')#|#TimeFormat(NOW(), 'hh:mm:ss tt')#|#trim(session.User.getUsersID())#|#trim(session.Entity.getFName())# #trim(session.Entity.getLName())#|#trim(request.fmsPath)#\#trim(request.tempDocsFolder)#\#trim(finalFileName)#")>
				
				<cfquery name="updateQuote" datasource="#request.datasource#">
					UPDATE intake
					SET printed = '#trim(newPrinted)#'
					WHERE intakeID = #trim(intakeID)#
				</cfquery>
				
					
										
				<!-------------------------------------------------------------------------------------->
				<!--- Locate the user to where they will be able to print it.                        --->
				<!-------------------------------------------------------------------------------------->		
				<cfoutput>		
					<script language="JavaScript">
						location = '#trim(request.tempDocsURL)#/#trim(finalFileName)#';							
					</script>
				</cfoutput>				
			
			</cfif>
	
			
			
					
			
		<!---<cfoutput>#CoverSheetPrintVariable#</cfoutput>	
		<br><br><br><br><br><br><br><br><br><br><br>
		<cfoutput>#QuotePrintVariable#</cfoutput>--->
		
	
	</cfif>		

