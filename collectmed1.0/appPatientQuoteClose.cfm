<!---- appPatientQuoteClose.cfm ---->



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formName" default="quoteForm">
	<cfset formName = attributes.formName>
	
	<cfparam name="attributes.quoteID" default="">
	<cfset quoteID = attributes.quoteID>

	<cfif IsDefined("form.quoteID") AND form.quoteID NEQ "">
		<cfset quoteID = form.quoteID>
	<cfelseif IsDefined("url.quoteID") AND url.quoteID NEQ "">
		<cfset quoteID = url.quoteID>
	</cfif>

	<cfparam name="attributes.cancel" default="0">
	<cfset cancel = attributes.cancel>
	
	<cfif IsDefined("form.cancel") AND form.cancel NEQ "">
		<cfset cancel = form.cancel>
	<cfelseif IsDefined("url.cancel") AND url.cancel NEQ "">
		<cfset cancel = url.cancel>
	</cfif>

	<cfparam name="attributes.objectID" default="9">
	<cfset objectID = attributes.objectID>
	
	<cfparam name="Submitted" default="no">
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="quoteID"
		fieldnames="Quote ID"
		datatypes="numeric">	
	


<!------------------------------------------------------------------>
<!--- The page starts here with the page not being submitted     --->
<!--- so it is the first screen that the user will see.          --->
<!------------------------------------------------------------------>	
	<cfif NOT IsDefined("form.Submitted")>	
		
		<cfif cancel>
			<cfset title = "Cancel A Quote">
		<cfelse>
			<cfset title = "Mark Quote As Completed">	
		</cfif>
		
		<cf_gcBorderedTable title="#trim(title)#" width="100%">		
				
			<cfoutput>
			
				<script language="JavaScript">
					function validateForm(){
		
						beforeSubmit();
		
						if(document.#trim(formName)#.note.value == ""){
							alert('You must provide a note.');
							resetSubmitButtons();
							return false;
						};
		
						return true;
					};
		
				</script>
			
				<form method="post" name="#trim(formName)#" onsubmit="return validateForm();">
					<input type="hidden" name="Submitted" value="yes">
					<input type="hidden" name="quoteID" value="#trim(quoteID)#">
					<input type="hidden" name="cancel" value="#trim(cancel)#">
					<table border="0" cellpadding="2" cellspacing="2" align="center">
						<tr>
							<td class="siteLabel" nowrap>		
								<cfif cancel>
									Are you sure you want to mark this claim as cancelled?<br>
									Take this action only if this quote must go into the "Cancelled" tab.<br>
									You must provide a note explaining why you are cancelling this quote.<br><br>
								<cfelse>
									Are you sure you want to mark this quote as completed?<br>
									Take this action only if this quote was accepted and must go into the "Completed" tab.<br>
									You must provide a note explaining why you are marking this quote as completed.<br><br>
								</cfif>
							</td>
						</tr>
						<tr>
							<td class="SiteLabel" colspan="2">
								<cf_gcHTMLNoteEditor form_name="#trim(formName)#" field_name="note" editWidthPercent="100" editHeight="45" verbage="">
							</td>
						</tr>	
						<tr><td colspan="2"><img src="images/transparent.gif" width="530" height="2" border="0"></td></tr>																					
						<tr>
							<td align="center" colspan="2">
								<cfif cancel>
									<cfset buttonValue = "Cancel Quote">
								<cfelse>
									<cfset buttonValue = "Mark Quote as Completed">	
								</cfif>
								<cf_gcSubmitButton value="#trim(buttonValue)#">&nbsp;&nbsp;&nbsp;<input type="Button" value="Close Window" onclick="self.close();" class="SiteSubmitbox">								
							</td>
						</tr>														
					</table>
				</form>
								
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
					
		</cf_gcBorderedTable>
		
	
	<cfelse>
	
	
		<!-------------------------------------------------------------------------------------->
		<!--- query for the quote.                                                           --->
		<!-------------------------------------------------------------------------------------->
		<cfquery name="updateQuote" datasource="#trim(request.datasource)#">
			UPDATE quote
			SET Active = 0, dateModified = now()
			<cfif cancel>, Cancelled = 1</cfif>
			WHERE quoteID = #trim(quoteID)#
		</cfquery>
	
	
		<!-------------------------------------------------------------------------------------->
		<!--- Add the note that the user input.                                              --->
		<!-------------------------------------------------------------------------------------->		
		<cfset request.Note = CreateObject("component","com.common.Note")>
		<cfset NoteID = request.Note.getNoteID(clientid: trim(session.ClientID), objectID: trim(objectID), instanceID: trim(quoteID))>

		<cfif NOT IsNumeric(NoteID) AND IsNumeric(objectID) AND IsNumeric(quoteID)>
			<cfset NoteID = request.Note.addNote(clientID: trim(session.clientID), objectID: trim(objectID), instanceID: trim(quoteID))>
		</cfif>
		
		<cfset request.Note.addNoteEntry(clientID: trim(session.clientID), NoteID: NoteID, noteEntry: '#trim(form.note)#', userID: trim(session.user.getUsersID()), userFName: '#trim(session.user.getFName())#', userLName: '#trim(session.user.getLName())#')>
					
		<cfif cancel>	
			<cfset msg = "Quote ID: #trim(QuoteID)# has been cancelled.">
			<cfset note = "System Input Note: Quote was cancelled on #DateFormat(NOW(), 'mm/dd/yy')# #TimeFormat(NOW(), 'hh:mm:ss tt')#">
			<cfset request.Note.addNoteEntry(clientID: trim(session.clientID), NoteID: NoteID, noteEntry: '#trim(note)#', userID: trim(session.user.getUsersID()), userFName: '#trim(session.user.getFName())#', userLName: '#trim(session.user.getLName())#')>	
		<cfelse>
			<cfset msg = "Quote ID: #trim(QuoteID)# has been completed.">
			<cfset note = "System Input Note: Quote was marked as completed on #DateFormat(NOW(), 'mm/dd/yy')# #TimeFormat(NOW(), 'hh:mm:ss tt')#">
			<cfset request.Note.addNoteEntry(clientID: trim(session.clientID), NoteID: NoteID, noteEntry: '#trim(note)#', userID: trim(session.user.getUsersID()), userFName: '#trim(session.user.getFName())#', userLName: '#trim(session.user.getLName())#')>
		</cfif>
	
		<cfoutput>
			<script language="JavaScript">
				var tempOpener = 'window.opener';		
				if (typeof(eval(tempOpener)) != "undefined"){						
					window.opener.location.href = 'appQuoteSearch.cfm?msg=#URLEncodedFormat(trim(msg))#';
				};		
				self.close();
			</script>
		</cfoutput>
	
	
	</cfif>
	
		

