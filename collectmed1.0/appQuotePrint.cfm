<!---- appQuotePrint.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.fileDateTimeStamp" default="#DateFormat(NOW(), 'mmddyy')##TimeFormat(NOW(), 'hhmmss')#">
	<cfset fileDateTimeStamp = attributes.fileDateTimeStamp>
	
	<cfparam name="attributes.quoteID" default="">
	<cfset quoteID = attributes.quoteID>
	
	<cfif IsDefined("form.quoteID") AND form.quoteID NEQ "">
		<cfset quoteID = form.quoteID>
	<cfelseif IsDefined("url.quoteID") AND url.quoteID NEQ "">
		<cfset quoteID = url.quoteID>	
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
		fields="quoteID"
		fieldnames="Quote ID"
		datatypes="numeric">	
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Create the quote object.                                                       --->
<!-------------------------------------------------------------------------------------->
	<cfset request.Quote = CreateObject("component", "com.common.quote")>		
	<cfset request.Quote.init(trim(quoteID))>
	
	
	
	
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
			
				<form name="#trim(formName)#" method="post" action="appQuotePrint_Process.cfm" target="_blank" onsubmit="document.all.quoteNote.value = document.frames('DHTMLEditor1').document.body.innerHTML; document.all.faxNote.value = document.frames('DHTMLEditor2').document.body.innerHTML;">
					<input type="Hidden" name="quoteID" value="#trim(quoteID)#">										
					<table border="0" cellpadding="4" cellspacing="2"> 
						<tr>
							<td valign="top" nowrap><strong><u><font size="2">On Quote Page</font></u></strong></td>
						</tr>						
						<tr>						
							<td class="siteLabel" valign="top" nowrap colspan="2">			   
					   			Quote Visible Note:&nbsp;	<br>						
								<cf_gcHTMLNoteEditor form_name="#trim(formName)#" field_name="quoteNote" editWidthPercent="100" editHeight="45" verbage="">
							</td>					
						</tr>								
						<tr>
							<td valign="top" nowrap><strong><u><font size="2">Fax Cover Sheet</font></u></strong></td>
						</tr>						
						<tr>
							<td class="siteLabel" valign="top" nowrap>Fax Cover Sheet:&nbsp;</td>
							<td class="siteLabel" valign="top">
								<input type="Radio" name="faxSheet" value="no" checked onclick="faxCoverSheet_tr2.style.display='none';faxCoverSheet_tr3.style.display='none';faxCoverSheet_tr4.style.display='none';faxCoverSheet_tr5.style.display='none';faxCoverSheet_tr6.style.display='none';faxCoverSheet_tr7.style.display='none';faxCoverSheet_tr8.style.display='none';faxCoverSheet_tr9.style.display='none';faxCoverSheet_tr10.style.display='none';"> No
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
							<td><input type="Text" onChange="capitalizeMe(this)" class="siteTextBox" name="regarding" size="40" maxlength="40" value="#REQUEST.capitalizeEveryFirstLetter(trim(request.Quote.getPatientFNameTBox()))# #REQUEST.capitalizeEveryFirstLetter(trim(request.Quote.getPatientLNameTBox()))#"></td>
						</tr>
						<tr id="faxCoverSheet_tr9" style="display:'none';">
							<td class="siteLabel" align="right" valign="top" nowrap>Pages:&nbsp;</td>
							<td><input type="Text" class="siteTextBox" name="pages" size="5" maxlength="40" value="2"></td>
						</tr>					
						<tr id="faxCoverSheet_tr2" style="display:'none';">						
							<td class="siteLabel" valign="top" nowrap colspan="2">			   
					   			Fax Cover Page Note:&nbsp;	<br>						
								<cf_gcHTMLNoteEditor form_name="#trim(formName)#" field_name="faxNote" identifier="2" editWidthPercent="100" editHeight="45" verbage="">
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
	
	