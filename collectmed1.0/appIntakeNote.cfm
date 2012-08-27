<!---- appIntakeNote.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.editorID" default="#randRange(1001, 2252)#">
	<cfset editorID = attributes.editorID>
	
	<cfparam name="attributes.formName" default="addIntakeNote">
	<cfset formName = attributes.formName>

	<cfparam name="attributes.intakeNoteID" default="">
	<cfset intakeNoteID = attributes.intakeNoteID>

	<cfif IsDefined("form.intakeNoteID") AND form.intakeNoteID NEQ "">
		<cfset intakeNoteID = form.intakeNoteID>
	<cfelseif IsDefined("url.intakeNoteID") AND url.intakeNoteID NEQ "">
		<cfset intakeNoteID = url.intakeNoteID>
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

	<cfparam name="attributes.return" default="0">
	<cfset return = attributes.return>

	<cfif IsDefined("form.return") AND form.return NEQ "">
		<cfset return = form.return>
	<cfelseif IsDefined("url.return") AND url.return NEQ "">
		<cfset return = url.return>
	</cfif>

	<cfset getIntakeNote = "" />

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
	<cfset request.intakeNote = application.beanFactory.getBean("Note") />



<!-------------------------------------------------------------------------------------->
<!--- If the noteid was not sent in but other parameters were get the NoteID.        --->
<!-------------------------------------------------------------------------------------->
	<cfif (NOT IsNumeric(intakeNoteID) OR intakeNoteID LTE 0) AND Isnumeric(objectID) AND IsNumeric(instanceID)>
		<cfset intakeNoteID = request.intakeNote.getNoteID(clientid: trim(session.ClientID), objectID: trim(objectID), instanceID: trim(instanceID))>
	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Get the formatted note entries.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfif intakeNoteID GTE 1>

		<cfset getIntakeNoteXML = request.intakeNote.getNoteDB(clientID: trim(session.clientID), noteID: intakeNoteID)>
		<cfset intakeNoteXML = XMLParse(getIntakeNoteXML.Note)>
		<cfset numberOfIntakeNotes = Arraylen(intakeNoteXML.note.entry)>
		<cfset returnIntakeNoteXML = "">
		<cfset newIntakeIDAssigned = 0>

		<cfoutput>
			<cfloop from="#trim(numberOfIntakeNotes)#" to="1" step="-1" index="i">

				<cfset thisUserID = intakeNoteXML.note.entry[i].UserID.xmlText>
				<cfset thisUserFName = intakeNoteXML.note.entry[i].UserFName.xmlText>
				<cfset thisUserLName = intakeNoteXML.note.entry[i].UserLName.xmlText>
				<cfset thisEntryDate = intakeNoteXML.note.entry[i].EntryDate.xmlText>
				<cfset thisEntryTime = intakeNoteXML.note.entry[i].EntryTime.xmlText>
				<cfset thisEntryNote = intakeNoteXML.note.entry[i].EntryNote.xmlText>

				<cfif thisEntryNote NEQ "">
					<cfif return>
						<cfset returnIntakeNoteXML = returnIntakeNoteXML & "<tr><td class=sitelabel><strong>#trim(thisUserFName)# #trim(thisUserLName)# #trim(thisEntryDate)# #trim(thisEntryTime)#</strong></span><br>" & thisEntryNote & "</td></tr>">
					<cfelse>
						<cfset returnIntakeNoteXML = returnIntakeNoteXML & "<tr><td class=sitelabel><span style=""cursor: hand"" onmouseover=""doTooltip(1, this, event, '" & trim(thisUserFName) & " " & trim(thisUserLName) & " " & trim(thisEntryDate) & " " & trim(thisEntryTime) & "');"" onmouseout=""hideTip();""><strong>" & LEFT(trim(thisUserFName), 1) & ". " & trim(thisUserLName) & " " & DateFormat(trim(thisEntryDate), 'mm/dd/yy') & "</strong></span><br>" & thisEntryNote & "</td></tr>">
					</cfif>
				</cfif>

			</cfloop>
		</cfoutput>
		
		<cfif returnIntakeNoteXML NEQ ""> 
			<cfset returnIntakeNoteXML = "<table border=0 cellpadding=2 cellspacing=0>" & returnIntakeNoteXML & "</table>">
		</cfif>
			
		<cfset getIntakeNote = returnIntakeNoteXML>

	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- If return is yes then just output the notes table and exit.                    --->
<!-------------------------------------------------------------------------------------->
	<cfif return>

		<cfoutput>#getIntakeNote#</cfoutput>

		<cfexit>

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
					
						<cf_gcBorderedTable	title="Add&nbsp;Intake&nbsp;Note" onclick="document.getElementById('DHTMLEditor#EditorID#').focus();" tablealign="Right" spanLink="yes" spanLinkTitle="<u>Add&nbsp;Intake&nbsp;Note</u>" view="none">

							<table align="left" cellpadding="5" cellspacing="0" border="0" width="550">
								<tr>
									<td valign="top">
							   			<form name="#trim(formName)#" method="post" action="appIntakeNoteAdd.cfm" onsubmit="return validateForm();">
											<input type="Hidden" name="NoteID" value="#trim(intakeNoteID)#">
											<input type="Hidden" name="clientID" value="#trim(clientID)#">
											<input type="Hidden" name="objectID" value="#trim(objectID)#">
											<input type="Hidden" name="InstanceID" value="#trim(InstanceID)#">

											<table cellspacing="4" cellpadding="0" border="0" width="100%">
												<tr>
													<td class="SiteLabel" colspan="2">
														<cf_gcHTMLNoteEditor form_name="#trim(formName)#" identifier="#trim(editorID)#" field_name="note" editWidthPercent="100" editHeight="35" verbage="">
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
				<!--- Show only if the intake has at least one note.                                  --->
				<!-------------------------------------------------------------------------------------->
				<tr>
					<td>

						<cf_gcBorderedTable	title="Intake&nbsp;Notes" tablealign="Left" tableWidth="100%">

							<table align="left" cellpadding="5" cellspacing="0" border="0" width="550">
								<tr>
									<td class="SiteLabel" valign="top">
										<cfif intakeNoteID LT 1 OR intakeNoteID EQ "" OR LEN(getIntakeNote) LTE 0>
											There are no intake notes to show.
										<cfelseif IsDefined("getIntakeNote") AND getIntakeNote NEQ "">
											<div class="scroll">
												#getIntakeNote#
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
	

