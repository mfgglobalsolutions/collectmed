<!---- appObjectNote.cfm ---->



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formName" default="addObjectNote">
	<cfset formName = attributes.formName>

	<cfparam name="attributes.ObjectNoteID" default="">
	<cfset ObjectNoteID = attributes.ObjectNoteID>

	<cfif IsDefined("form.ObjectNoteID") AND form.ObjectNoteID NEQ "">
		<cfset ObjectNoteID = form.ObjectNoteID>
	<cfelseif IsDefined("url.ObjectNoteID") AND url.ObjectNoteID NEQ "">
		<cfset ObjectNoteID = url.ObjectNoteID>
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

	<cfparam name="attributes.clientID" default="#trim(session.ClientID)#">
	<cfset clientID = attributes.clientID>

	<cfif IsDefined("form.clientID") AND form.clientID NEQ "">
		<cfset clientID = form.clientID>
	<cfelseif IsDefined("url.clientID") AND url.clientID NEQ "">
		<cfset clientID = url.clientID>
	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Needed CSS for this page.                                                      --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<style type="text/css">
		<!--
			div.scroll {
				height: 100px;
				width: 100%;
				overflow: auto;
				border: 1px solid FFFFFF;
				background-color: ffffff;
				padding: 0px;
			}
		-->
		</style>
	</cfoutput>



<!-------------------------------------------------------------------------------------->
<!--- Create the note object and populate it with the DB parameters.                 --->
<!-------------------------------------------------------------------------------------->
	<cfset request.ObjectNote = application.beanFactory.getBean("Note") />



<!-------------------------------------------------------------------------------------->
<!--- If the noteid was not sent in but other parameters were get the NoteID.        --->
<!-------------------------------------------------------------------------------------->
	<cfif (NOT IsNumeric(ObjectNoteID) OR ObjectNoteID LTE 0) AND IsNumeric(objectID) AND IsNumeric(instanceID)>
		<cfset ObjectNoteID = request.ObjectNote.getNoteID(clientid: trim(session.ClientID), objectID: trim(objectID), instanceID: trim(instanceID))>
	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Get the formatted note entries.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfif ObjectNoteID GTE 1>

		<cfset getObjectNoteXML = request.ObjectNote.getNoteDB(clientid: trim(session.ClientID), noteID: trim(ObjectNoteID))>
		<cfset ObjectNoteXML = XMLParse(getObjectNoteXML.Note)>
		<cfset numberOfObjectNotes = Arraylen(ObjectNoteXML.note.entry)>
		<cfset returnObjectNoteXML = "">
		<cfset newObjectIDAssigned = 0>

		<cfoutput>
			<cfloop from="#trim(numberOfObjectNotes)#" to="1" step="-1" index="i">

				<cfset thisUserID = ObjectNoteXML.note.entry[i].UserID.xmlText>
				<cfset thisUserFName = ObjectNoteXML.note.entry[i].UserFName.xmlText>
				<cfset thisUserLName = ObjectNoteXML.note.entry[i].UserLName.xmlText>
				<cfset thisEntryDate = ObjectNoteXML.note.entry[i].EntryDate.xmlText>
				<cfset thisEntryTime = ObjectNoteXML.note.entry[i].EntryTime.xmlText>
				<cfset thisEntryNote = ObjectNoteXML.note.entry[i].EntryNote.xmlText>

				<cfif thisEntryNote NEQ "">
					<cfset returnObjectNoteXML = returnObjectNoteXML & "<tr><td class=sitelabel><span style=""cursor: hand"" onmouseover=""doTooltip(1, this, event, '" & trim(thisUserFName) & " " & trim(thisUserLName) & " " & trim(thisEntryDate) & " " & trim(thisEntryTime) & "');"" onmouseout=""hideTip();""><strong>" & LEFT(trim(thisUserFName), 1) & ". " & trim(thisUserLName) & " " & DateFormat(trim(thisEntryDate), 'mm/dd/yy') & "</strong></span><br>" & thisEntryNote & "</td></tr>">
				</cfif>

			</cfloop>
		</cfoutput>
		
		<cfif returnObjectNoteXML NEQ ""> 
			<cfset returnObjectNoteXML = "<table border=0 cellpadding=2 cellspacing=0>" & returnObjectNoteXML & "</table>">
		</cfif>
		
		<cfset getObjectNote = returnObjectNoteXML>

	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
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

		<div align="left">
			<table border="0" width=570 cellpadding="0" cellspacing="10">
				<tr>
					<td>

						<cf_gcBorderedTable	title="Add&nbsp;Note" tablealign="Right" spanLink="yes" spanLinkTitle="Add&nbsp;Note" view="none">

							<table align="left" cellpadding="5" cellspacing="0" border="0" width="550">
								<tr>
									<td valign="top">
							   			<form name="#trim(formName)#" method="post" action="appObjectNoteAdd.cfm" onsubmit="return validateForm();">
											<input type="Hidden" name="NoteID" value="#trim(ObjectNoteID)#">
											<input type="Hidden" name="clientID" value="#trim(clientID)#">
											<input type="Hidden" name="objectID" value="#trim(objectID)#">
											<input type="Hidden" name="InstanceID" value="#trim(InstanceID)#">

											<table cellspacing="4" cellpadding="0" border="0" width="100%">
												<tr>
													<td class="SiteLabel" colspan="2">
														<cf_gcHTMLNoteEditor form_name="#trim(formName)#" field_name="note" editWidthPercent="100" editHeight="35" verbage="">
													</td>
												</tr>
												<tr>
												    <td colspan="2" align="center"><cf_gcSubmitButton value="Add&nbsp;Note"></td>
												</tr>
											</table>
										</form>
									</td>
								</tr>
							</table>

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

						</cf_gcBorderedTable>

					</td>
				</tr>

				<!-------------------------------------------------------------------------------------->
				<!--- Show only if the Object has at least one note.                                  --->
				<!-------------------------------------------------------------------------------------->
				<tr>
					<td>

						<cf_gcBorderedTable	title="Notes" tablealign="Left" tableWidth="100%">

							<table align="left" cellpadding="5" cellspacing="0" border="0" width="550">
								<tr>
									<td class="SiteLabel" valign="top">
										<cfif ObjectNoteID LT 1 OR ObjectNoteID EQ "" OR LEN(getObjectNote) LTE 0>
											There are no notes to show.
										<cfelseif IsDefined("getObjectNote") AND getObjectNote NEQ "">
											<div class="scroll">
												#getObjectNote#
											</div>
										</cfif>
									</td>
								</tr>
							</table>

						</cf_gcBorderedTable>

					</td>
				</tr>

			</table>

		</div>


	</cfoutput>
	

