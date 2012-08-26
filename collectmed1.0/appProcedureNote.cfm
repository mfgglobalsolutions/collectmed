<!---- appProcedureNote.cfm ---->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formName" default="addNote">
	<cfset formName = attributes.formName>

	<cfparam name="attributes.added" default="">
	<cfset added = attributes.added>

	<cfif IsDefined("form.added") AND form.added NEQ "">
		<cfset added = form.added>
	<cfelseif IsDefined("url.added") AND url.added NEQ "">
		<cfset added = url.added>
	</cfif>

	<cfparam name="attributes.reloadp" default="">
	<cfset reloadp = attributes.reloadp>

	<cfif IsDefined("form.reloadp") AND form.reloadp NEQ "">
		<cfset reloadp = form.reloadp>
	<cfelseif IsDefined("url.reloadp") AND url.reloadp NEQ "">
		<cfset reloadp = url.reloadp>
	</cfif>

	<cfparam name="attributes.noteID" default="">
	<cfset noteID = attributes.noteID>

	<cfif IsDefined("form.noteID") AND form.noteID NEQ "">
		<cfset noteID = form.noteID>
	<cfelseif IsDefined("url.noteID") AND url.noteID NEQ "">
		<cfset noteID = url.noteID>
	</cfif>

	<cfparam name="attributes.trtdID" default="">
	<cfset trtdID = attributes.trtdID>

	<cfif IsDefined("form.trtdID") AND form.trtdID NEQ "">
		<cfset trtdID = form.trtdID>
	<cfelseif IsDefined("url.trtdID") AND url.trtdID NEQ "">
		<cfset trtdID = url.trtdID>
	</cfif>

	<cfparam name="attributes.objectID" default="">
	<cfset objectID = attributes.objectID>

	<cfif IsDefined("form.objectID") AND form.objectID NEQ "">
		<cfset objectID = form.objectID>
	<cfelseif IsDefined("url.objectID") AND url.objectID NEQ "">
		<cfset objectID = url.objectID>
	</cfif>

	<cfparam name="attributes.instanceID" default="">
	<cfset instanceID = attributes.instanceID>

	<cfif IsDefined("form.instanceID") AND form.instanceID NEQ "">
		<cfset instanceID = form.instanceID>
	<cfelseif IsDefined("url.instanceID") AND url.instanceID NEQ "">
		<cfset instanceID = url.instanceID>
	</cfif>

	<cfparam name="attributes.clientID" default="">
	<cfset clientID = attributes.clientID>

	<cfif IsDefined("form.clientID") AND form.clientID NEQ "">
		<cfset clientID = form.clientID>
	<cfelseif IsDefined("url.clientID") AND url.clientID NEQ "">
		<cfset clientID = url.clientID>
	</cfif>

	<cfparam name="attributes.noteRequired" default="0">
	<cfset noteRequired = attributes.noteRequired>

	<cfif IsDefined("form.noteRequired") AND form.noteRequired NEQ "">
		<cfset noteRequired = form.noteRequired>
	<cfelseif IsDefined("url.noteRequired") AND url.noteRequired NEQ "">
		<cfset noteRequired = url.noteRequired>
	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- if the note was added and the parent is set to be reloaded go ahead and do it. --->
<!-------------------------------------------------------------------------------------->
	<cfif reloadp EQ "yes" AND added EQ "yes">
		<script language="JavaScript">
			var tempParent = 'parent';
			if (typeof(eval(tempParent)) != "undefined"){
				parent.location.reload();
			};
		</script>
	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Create the note object and populate it with the DB parameters.                 --->
<!-------------------------------------------------------------------------------------->
	<cfset request.Note = application.beanFactory.getBean("Note") />

<!-------------------------------------------------------------------------------------->
<!--- If the noteid was not sent in but other parameters were get the NoteID.        --->
<!-------------------------------------------------------------------------------------->
	<cfif (NOT IsNumeric(NoteID) OR NoteID LTE 0) AND Isnumeric(objectID) AND IsNumeric(instanceID)>
		<cfset noteID = request.Note.getNoteID(clientid: trim(session.ClientID), objectID: trim(objectID), instanceID: trim(instanceID))>
	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Get the formatted note entries.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfif noteID GTE 1>

		<cfset getNoteXML = request.Note.getNoteDB(clientid: trim(session.ClientID), noteID: trim(noteID))>
		<cfset noteXML = XMLParse(getNoteXML.Note)>
		<cfset numberOfNotes = Arraylen(noteXML.note.entry)>
		<cfset returnNoteXML = "">
		<cfset newClaimIDAssigned = 0>

		<cfoutput>
			<cfloop from="#trim(numberOfNotes)#" to="1" step="-1" index="i">

				<cfset thisUserID = noteXML.note.entry[i].UserID.xmlText>
				<cfset thisUserFName = noteXML.note.entry[i].UserFName.xmlText>
				<cfset thisUserLName = noteXML.note.entry[i].UserLName.xmlText>
				<cfset thisEntryDate = noteXML.note.entry[i].EntryDate.xmlText>
				<cfset thisEntryTime = noteXML.note.entry[i].EntryTime.xmlText>
				<cfset thisEntryNote = noteXML.note.entry[i].EntryNote.xmlText>
				<cfset thisNewClaimID = noteXML.note.entry[i].NewClaimID.xmlText>

				<cfif thisEntryNote NEQ "">
					<cfset returnNoteXML = returnNoteXML & "<tr><td class=sitelabel><span style=""cursor: hand"" onmouseover=""doTooltip(1, this, event, '" & trim(thisUserFName) & " " & trim(thisUserLName) & " " & trim(thisEntryDate) & " " & trim(thisEntryTime) & "');"" onmouseout=""hideTip();""><strong>" & LEFT(trim(thisUserFName), 1) & ". " & trim(thisUserLName) & " " & DateFormat(trim(thisEntryDate), 'mm/dd/yy') & "</strong></span><br>" & thisEntryNote & "</td></tr>">
				</cfif>

				<cfif thisNewClaimID NEQ "">

					<cfif newClaimIDAssigned EQ 0>
						<cfset newClaimIDAssigned = 1>
					</cfif>

					<cfquery name="getClaimID" datasource="#trim(request.datasource)#">
						SELECT ClaimID
						FROM claim  
						WHERE InterchangeClaimID = '#trim(thisNewClaimID)#'
					</cfquery>

					<cfif getClaimID.Recordcount EQ 1>
						<cfset returnNoteXML = returnNoteXML & "<tr><td class=siteLabel><span class=siteRequiredLabel><strong>New Claim ID:</strong></span><br><span onclick=""editClaim1=window.open('appClaimEdit.cfm?claimid=#trim(getClaimID.ClaimID)#','editClaim1','top=80,left=100,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=850,height=480'); editClaim1.focus(0);"" style=""cursor: hand;""><u>" & thisNewClaimID & "</u></span></td></tr>">
					<cfelse>
						<cfset returnNoteXML = returnNoteXML & "<tr><td class=siteLabel><span class=siteRequiredLabel><strong>New Claim ID:</strong></span><br><span style=""cursor: pointer;"" onmouseover=""doTooltip(1, this, event, 'Claim ID: #trim(thisNewClaimID)# cannot be found in the database. The Claim ID may not have been returned in an R&S Report yet.')"" onmouseout=""hideTip();"">" & thisNewClaimID & "</span></td></tr>">
					</cfif>

				</cfif>

			</cfloop>
		</cfoutput>

		<cfif newClaimIDAssigned EQ 1>
			<cfset returnNoteXML = "<tr><td class=siteRequiredLabel>NEW&nbsp;CLAIM&nbsp;ID&nbsp;ASSIGNED&nbsp;BELOW</td></tr>" & returnNoteXML>
		</cfif>

		<cfset returnNoteXML = "<table border=0 cellpadding=2 cellspacing=0>" & returnNoteXML & "</table>">

		<cfset getNote = returnNoteXML>

	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>

		<style>	
			body{ 
				font-family:arial, helvetica, sans-serif;
				background-color:##FFFFFF;					
			} 
		</style>
	
		<script language="JavaScript">
			function validateForm(){

				beforeSubmit();

				if(document.#trim(formName)#.note.value == ""){
					<cfif noteRequired EQ 1>
						alert('You must provide a note.');
					</cfif>
					return false;
				};

				var tempHidden = 'parent.document.all.HIDDEN_ClearProc_#trim(trtdID)#';

				if (typeof(eval(tempHidden)) != "undefined"){
					eval('parent.document.all.HIDDEN_ClearProc_#trim(trtdID)#').value = 1;
				};

				//alert(eval('parent.document.all.HIDDEN_ClearProc_#trim(trtdID)#').value);

				return true;
			};

			function closeCommands(){
				var tempTR = 'parent.tr#trim(trtdID)#';
				var tempTD = 'parent.td#trim(trtdID)#';

				if (typeof(eval(tempTR)) != "undefined" && typeof(eval(tempTD)) != "undefined"){
					eval('parent.td'+#trim(trtdID)#).style.border = '0';
					eval('parent.tr'+#trim(trtdID)#).style.display = 'none';
				};
			};

		</script>

		<!--- Note Required--->
		<cfif noteRequired EQ 1>
			<cfset class = "SiteRequiredLabel">
		<cfelse>
			<cfset class = "SiteLabel">
		</cfif>

		<table align="left" cellpadding="5" cellspacing="0" border="0"  width="100%">
			<tr>
				<td class="#trim(class)#" valign="top">
					<cfif IsDefined("getNote")>#getNote#</cfif>
				</td>
				<td valign="top">
		   			<form name="#trim(formName)#" method="post" action="appProcedureNoteAdd.cfm" onsubmit="return validateForm();">
						<input type="Hidden" name="reloadp" value="#trim(reloadp)#">
						<input type="Hidden" name="NoteID" value="#trim(noteID)#">
						<input type="Hidden" name="clientID" value="#trim(clientID)#">
						<input type="Hidden" name="objectID" value="#trim(objectID)#">
						<input type="Hidden" name="InstanceID" value="#trim(InstanceID)#">
						<input type="Hidden" name="trtdID" value="#trim(trtdID)#">
						<input type="Hidden" name="HIDDEN_State_AddNewClaimID" value="0">
						<table cellspacing="4" cellpadding="0" border="0" width="100%">

							<tr>
							    <!---<td class="#trim(class)#" valign="top" align="right">Add&nbsp;Note:</td>--->
							    <td class="SiteLabel" colspan="2"><cf_gcHTMLNoteEditor form_name="#trim(formname)#" field_name="note" editWidthPercent="100" editHeight="35" verbage=""></td>
								<!---<textarea class="SiteTextArea" name="note" cols="50" rows="3"></textarea>--->
							</tr>

							<!---<tr id="tr_NewClaimIDSpan">
							    <td>&nbsp;</td>
								<td class="SiteLabel"><span onclick="if (HIDDEN_State_AddNewClaimID.value==0) {HIDDEN_State_AddNewClaimID.value=1; tr_NewClaimID.style.display='inline'; tr_NewClaimIDSpan.style.display='none';};" style="cursor: hand;"><u>Add&nbsp;New&nbsp;Claim&nbsp;ID</u></span></td>
							</tr>--->

							<tr id="tr_NewClaimID" style="display: none">
							    <td class="SiteLabel">New&nbsp;Claim&nbsp;ID:</td>
							    <td class="SiteLabel"><input class="SiteTextBox" type="Text" name="NewClaimID" size="35" maxlength="35"></td>
							</tr>

							<tr>
							    <td colspan="2" align="center"><cf_gcSubmitButton value="Add Note">&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Close" name="closeTD" onclick="closeCommands();"></td>
							</tr>

						</table>
					</form>
				</td>
			</tr>
		</table>
	</cfoutput>








	<!---
	--UPDATE NOTE SET NOTE = '<note><entry><UserID>55</UserID><UserFName>Fisher</UserFName><UserLName>King</UserLName><EntryDate>09/15/2005</EntryDate><EntryTime>09:14:40 PM</EntryTime><EntryNote>March of the penguins.</EntryNote></entry><entry><UserID>4</UserID><UserFName>Lenny</UserFName><UserLName>Kravitz</UserLName><EntryDate>09/15/2005</EntryDate><EntryTime>09:29:27 PM</EntryTime><EntryNote>Coming to the Los Angeles Staples Center in August.</EntryNote></entry><entry><UserID>26</UserID><UserFName>Guillermo</UserFName><UserLName>Cruz</UserLName><EntryDate>01/08/2006</EntryDate><EntryTime>10:24:16 AM</EntryTime><EntryNote>Howard Stern began his new satellite radio show on Monday by putting to rest rumors that he got married to his longtime girlfriend, model Beth Ostrosky - in a comment complete with a federally banned expletive.</EntryNote></entry></note>'



	--->