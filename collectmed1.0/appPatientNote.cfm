<!---- appPatientNote.cfm ---->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.wholeNumbers" default="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50">
 	<cfset wholeNumbers = attributes.wholeNumbers>

	<cfparam name="attributes.numberOfItemsPerRow" default="4">
 	<cfset numberOfItemsPerRow = attributes.numberOfItemsPerRow>

	<cfparam name="attributes.formName" default="addPatientNote">
	<cfset formName = attributes.formName>

	<cfparam name="attributes.patientNotes" default="">
	<cfset patientNotes = attributes.patientNotes>

	<cfif IsDefined("form.patientNotes") AND form.patientNotes NEQ "">
		<cfset patientNotes = form.patientNotes>
	<cfelseif IsDefined("url.patientNotes") AND url.patientNotes NEQ "">
		<cfset patientNotes = url.patientNotes>
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
				height: 270px;
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
	<cfset request.patientNotes = CreateObject("component","com.common.Note")>



<!-------------------------------------------------------------------------------------->
<!--- If the noteid was not sent in but other parameters were get the notes.         --->
<!-------------------------------------------------------------------------------------->
	<cfset patientNotes = request.patientNotes.getNotes(clientID: trim(clientID), objectID: trim(objectID), instanceID: trim(instanceID), orderascdesc: 'desc')>



<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>

		<script language="JavaScript">
			function validateForm(){

				if(document.#trim(formName)#.note.value == ""){
					alert('You must provide a note.');
					return false;
				};

				return true;
			};

		</script>

		<div align="left">
			<table border="0" width=570 cellpadding="0" cellspacing="10">

				<!-------------------------------------------------------------------------------------->
				<!--- Show only if the patient has at least one note.                                --->
				<!-------------------------------------------------------------------------------------->
				<tr>
					<td>

						<cf_gcBorderedTable	title="Patient&nbsp;Notes" titleright="<span style=cursor:hand class=sitelabel onclick=if(document.all.addPatientNote.style.display=='none'){document.all.addPatientNote.style.display='block';}else{document.all.addPatientNote.style.display='none';};if(document.all.addNoteEntry_0.style.display=='none'){document.all.addNoteEntry_0.style.display='block';document.getElementById('DHTMLEditor0').focus();}else{document.all.addNoteEntry_0.style.display='none';};><u>Add&nbsp;New Note</u></span>" tablealign="Left" tableWidth="100%">

							<table align="left" cellpadding="5" cellspacing="0" border="0" width="550">


								<!------>
								<tr id="addPatientNote" style="display:none">
									<td valign="top">
										<table cellspacing="4" cellpadding="0" border="0">
											<tr><td><cf_gcPatientAddNoteEntry id="0" objectID="#trim(objectID)#" instanceID="#trim(instanceID)#"></td></tr>
										</table>
									</td>
								</tr>
								<!------>


								<tr>
									<td class="SiteLabel" valign="top">

										<cfif patientNotes.RecordCount LTE 0>
											There are no patient notes to show.
										<cfelse>

											<div class="scroll">

												<cfif patientNotes.RecordCount GTE 1>

														<cfloop query="patientNotes">

															<cfset getPatientNoteXML = request.patientNotes.getNoteDB(clientID: trim(clientID), noteID: NoteID)>
															<cfset patientNoteXML = XMLParse(getPatientNoteXML.Note)>
															<cfset numberOfPatientNotes = Arraylen(patientNoteXML.note.entry)>
															<cfset returnPatientNoteXML = "">
															<cfset newPatientIDAssigned = 0>
															<cfset thisNote = "">
															<cfset CreatedUserFName = "UserFName">
															<cfset CreatedUserLName = "UserLName">
															<cfset CreatedEntryDate = NOW()>
															<cfset CreatedEntryTime = NOW()>

															<cfloop from="#trim(numberOfPatientNotes)#" to="1" step="-1" index="i">
																<cfset fontcolor = "#IIF(i MOD 2, DE("0000ff"), DE("000000"))#">
																<cfset thisUserID = patientNoteXML.note.entry[i].UserID.xmlText>
																<cfset thisUserFName = patientNoteXML.note.entry[i].UserFName.xmlText>
																<cfset thisUserLName = patientNoteXML.note.entry[i].UserLName.xmlText>
																<cfset thisEntryDate = patientNoteXML.note.entry[i].EntryDate.xmlText>
																<cfset thisEntryTime = patientNoteXML.note.entry[i].EntryTime.xmlText>
																<cfset thisEntryNote = patientNoteXML.note.entry[i].EntryNote.xmlText>

																<!---Remember the first slot is blank the notes start in position 2--->
																<cfif i EQ 2>
																	<cfset CreatedUserFName = patientNoteXML.note.entry[i].UserFName.xmlText>
																	<cfset CreatedUserLName = patientNoteXML.note.entry[i].UserLName.xmlText>
																	<cfset CreatedEntryDate = patientNoteXML.note.entry[i].EntryDate.xmlText>
																	<cfset CreatedEntryTime = patientNoteXML.note.entry[i].EntryTime.xmlText>
																</cfif>

																<cfif thisEntryNote NEQ "">
																	<cfset thisNote = thisNote & "<strong> <font color=#trim(fontcolor)#>" & trim(thisUserFName) & " " & trim(thisUserLName) & " " & DateFormat(trim(thisEntryDate), 'mm/dd/yy') & " " & TimeFormat(trim(thisEntryTime), 'hh:mm:ss tt') & "</font></strong><br>" & thisEntryNote & "<br><br>">
																</cfif>

															</cfloop>

															<cfset header = "&nbsp;<strong>Created By: <font color=ff0000>" & trim(createdUserFName) & " " & trim(createdUserLName) & " " & DateFormat(trim(createdEntryDate), 'mm/dd/yy') & " " & TimeFormat(trim(createdEntryTime), 'hh:mm:ss tt') & "</font></strong>">

															<script language="JavaScript">
																function ImageSwap_#trim(currentRow)#(){array=document.images.PlusMinus_#trim(currentRow)#.src.split("/");if (array[array.length-1] == 'minus.gif'){document.images.PlusMinus_#trim(currentRow)#.src='images/plus.gif';}else{document.images.PlusMinus_#trim(currentRow)#.src='images/minus.gif';}}
																function toggle_#trim(currentRow)#(){if(document.all.hidden_#trim(currentRow)#.style.display=='none') {document.all.hidden_#trim(currentRow)#.style.display='block';}else {document.all.hidden_#trim(currentRow)#.style.display='none';}}
															</script>

															<table cellspacing="0" cellpadding="4" border="0">
																<tr>
																    <td colspan="2" class="sitelabel"><img height=9 alt="" src="images/plus.gif" name="PlusMinus_#trim(currentRow)#" width=9 border=0 id="toggleImage_#trim(currentRow)#" onclick="ImageSwap_#trim(currentRow)#(),toggle_#trim(currentRow)#()">#trim(header)#</td>
																</tr>

																<tr style="display:none" id="hidden_#trim(currentRow)#">
																    <td class="sitelabel">&nbsp;&nbsp;</td><td class="sitelabel"><span style="cursor:hand" class="sitelabel" onclick="if(document.all.addNoteEntry_#trim(noteID)#.style.display=='none') {document.all.addNoteEntry_#trim(noteID)#.style.display='block';}else {document.all.addNoteEntry_#trim(noteID)#.style.display='none';};"><u>add&nbsp;entry</u></span><cf_gcPatientAddNoteEntry id="#noteID#" objectID="#trim(objectID)#" instanceID="#trim(instanceID)#"><br>#trim(thisNote)#</td>
																</tr>
															</table>

														</cfloop>



												</cfif>

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















<!---<tr>
					<td>

						<cf_gcBorderedTable	title="Add&nbsp;Patient&nbsp;Note" tablealign="Right" spanLink="yes" spanLinkTitle="Add&nbsp;Patient&nbsp;Note" view="none">

							<table align="left" cellpadding="5" cellspacing="0" border="0" width="550">
								<tr>
									<td valign="top">
							   			<form name="#trim(formName)#" method="post" action="appPatientNoteAdd.cfm" onsubmit="return validateForm();">
											<input type="Hidden" name="NoteID" value="#trim(patientNotes)#">
											<input type="Hidden" name="clientID" value="#trim(clientID)#">
											<input type="Hidden" name="objectID" value="#trim(objectID)#">
											<input type="Hidden" name="InstanceID" value="#trim(InstanceID)#">
											<input type="Hidden" name="HIDDEN_State_AddNewPatientID" value="0">
											<table cellspacing="4" cellpadding="0" border="0">
												<tr>
												    <td class="SiteRequiredLabel" valign="top" align="right">Add&nbsp;Note:</td>
												    <td class="SiteLabel"><textarea class="SiteTextArea" name="note" cols="50" rows="3"></textarea></td>
												</tr>
												<tr>
												    <td colspan="2" align="center"><cf_gcSubmitButton value="Add Note"></td>
												</tr>
											</table>
										</form>
									</td>
								</tr>
							</table>

						</cf_gcBorderedTable>

					</td>
				</tr>--->