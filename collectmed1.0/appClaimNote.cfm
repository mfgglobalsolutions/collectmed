<!---- appClaimNote.cfm ---->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.editorID" default="#randRange(1001, 2252)#">
	<cfset editorID = attributes.editorID>
	
	<cfparam name="attributes.formName" default="addClaimNote">
	<cfset formName = attributes.formName>

	<cfparam name="attributes.claimNoteID" default="">
	<cfset claimNoteID = attributes.claimNoteID>

	<cfif IsDefined("form.claimNoteID") AND form.claimNoteID NEQ "">
		<cfset claimNoteID = form.claimNoteID>
	<cfelseif IsDefined("url.claimNoteID") AND url.claimNoteID NEQ "">
		<cfset claimNoteID = url.claimNoteID>
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
	<cfset request.claimNote = CreateObject("component","com.common.Note")>



<!-------------------------------------------------------------------------------------->
<!--- If the noteid was not sent in but other parameters were get the NoteID.        --->
<!-------------------------------------------------------------------------------------->
	<cfif (NOT IsNumeric(claimNoteID) OR claimNoteID LTE 0) AND Isnumeric(objectID) AND IsNumeric(instanceID)>
		<cfset claimNoteID = request.claimNote.getNoteID(clientID: trim(session.clientID), objectID: trim(objectID), instanceID: trim(instanceID))>
	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Get the formatted note entries.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfif claimNoteID GTE 1>

		<cfset getClaimNoteXML = request.claimNote.getNoteDB(clientID: trim(session.clientID), noteID: trim(claimNoteID))>
		<cfset claimNoteXML = XMLParse(getClaimNoteXML.Note)>
		<cfset numberOfClaimNotes = Arraylen(claimNoteXML.note.entry)>
		<cfset returnClaimNoteXML = "">
		<cfset newClaimIDAssigned = 0>

		<cfoutput>
			<cfloop from="#trim(numberOfClaimNotes)#" to="1" step="-1" index="i">

				<cfset thisUserID = claimNoteXML.note.entry[i].UserID.xmlText>
				<cfset thisUserFName = claimNoteXML.note.entry[i].UserFName.xmlText>
				<cfset thisUserLName = claimNoteXML.note.entry[i].UserLName.xmlText>
				<cfset thisEntryDate = claimNoteXML.note.entry[i].EntryDate.xmlText>
				<cfset thisEntryTime = claimNoteXML.note.entry[i].EntryTime.xmlText>
				<cfset thisEntryNote = claimNoteXML.note.entry[i].EntryNote.xmlText>

				<cfif thisEntryNote NEQ "">
					<cfset returnClaimNoteXML = returnClaimNoteXML & "<tr><td class=sitelabel><span style=""cursor: hand"" onmouseover=""doTooltip(1, this, event, '" & trim(thisUserFName) & " " & trim(thisUserLName) & " " & trim(thisEntryDate) & " " & trim(thisEntryTime) & "');"" onmouseout=""hideTip();""><strong>" & LEFT(trim(thisUserFName), 1) & ". " & trim(thisUserLName) & " " & DateFormat(trim(thisEntryDate), 'mm/dd/yy') & "</strong></span><br>" & thisEntryNote & "</td></tr>">
				</cfif>

			</cfloop>
		</cfoutput>

		<cfset returnClaimNoteXML = "<table border=0 cellpadding=2 cellspacing=0>" & returnClaimNoteXML & "</table>">

		<cfset getClaimNote = returnClaimNoteXML>

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

						<cf_gcBorderedTable	title="Add&nbsp;Claim&nbsp;Note" tablealign="Right" spanLink="yes" spanLinkTitle="Add&nbsp;Claim&nbsp;Note" onclick="document.getElementById('DHTMLEditor#EditorID#').focus();" view="none">

							<table align="left" cellpadding="5" cellspacing="0" border="0" width="550">
								<tr>
									<td valign="top">
							   			<form name="#trim(formName)#" method="post" action="appClaimNoteAdd.cfm" onsubmit="return validateForm();">
											<input type="Hidden" name="NoteID" value="#trim(claimNoteID)#">
											<input type="Hidden" name="clientID" value="#trim(clientID)#">
											<input type="Hidden" name="objectID" value="#trim(objectID)#">
											<input type="Hidden" name="InstanceID" value="#trim(InstanceID)#">
											<input type="Hidden" name="HIDDEN_State_AddNewClaimID" value="0">
											<table cellspacing="4" cellpadding="0" border="0" width="100%">
												<tr>
													<td class="SiteLabel" colspan="2">
														<cf_gcHTMLNoteEditor form_name="#trim(formName)#" identifier="#trim(editorID)#" field_name="note" editWidthPercent="100" editHeight="35" verbage="">
													</td>
												</tr>
												<!---<tr>
												    <td class="SiteRequiredLabel" valign="top" align="right">Add&nbsp;Note:</td>
												    <td class="SiteLabel"><textarea class="SiteTextArea" name="note" cols="50" rows="3"></textarea></td>
												</tr>--->
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
				<!--- Show only if the claim has at least one note.                                  --->
				<!-------------------------------------------------------------------------------------->
				<tr>
					<td>

						<cf_gcBorderedTable	title="Claim&nbsp;Notes" tablealign="Left" tableWidth="100%">

							<table align="left" cellpadding="5" cellspacing="0" border="0" width="550">
								<tr>
									<td class="SiteLabel" valign="top">
										<cfif claimNoteID LT 1 OR claimNoteID EQ "">
											There are no claim notes to show.
										<cfelseif IsDefined("getClaimNote") AND getClaimNote NEQ "">
											<div class="scroll">
												#getClaimNote#
											</div>
										</cfif>
									</td>
								</tr>
							</table>

						</cf_gcBorderedTable>

					</td>
				</tr>

				<!-------------------------------------------------------------------------------------->
				<!--- Show The notes for this the Procedures on this claim.                          --->
				<!-------------------------------------------------------------------------------------->
				<cfset request.Claim = CreateObject("component", "com.common.Claim")>
				<cfset request.Claim.init(trim(instanceID))>
				<cfset claimType = request.Claim.getClaimType()>
				<cfset showCodes = "">

				<cfif claimType EQ 108><!---Medicare--->

					<cfquery name="getProcedureCodes" datasource="#trim(request.datasource)#">
						SELECT cp.ProcedureID, cp.ProcedureCode, pc.HCPC AS Code, pc.LongDescription AS Description
						FROM [Procedure] cp
						LEFT JOIN pa_master.eob_medicare_procedurecode pc ON cp.ProcedureCode = pc.RecordID
						WHERE cp.ClaimID = #trim(instanceID)#
					</cfquery>

				<cfelseif claimType EQ 109><!---Medicaid--->

					<cfquery name="getProcedureCodes" datasource="#trim(request.datasource)#">
						SELECT cp.ProcedureID, cp.ProcedureCode, pc.Code, pc.Description
						FROM [Procedure] cp
						LEFT JOIN pa_master.eob_procedurecode pc ON cp.ProcedureCode = pc.RecordID
						WHERE cp.ClaimID = #trim(instanceID)#
					</cfquery>

				</cfif>

				<cfif getProcedureCodes.RecordCount GTE 1>

					<cfloop query="getProcedureCodes">

						<cfset showCodes = showCodes & "<span class=siteRequiredLabel><strong>Procedure Code " & getProcedureCodes.Code & "</strong>: " & getProcedureCodes.Description & "</span><br><br>">

						<cfif IsNumeric(ProcedureID)>

							<!-------------------------------------------------------------------------------------->
							<!--- Create the note object and populate it with the DB parameters.                 --->
							<!-------------------------------------------------------------------------------------->
							<cfset request.claimProcedureNote = CreateObject("component","com.common.Note")>
							<cfset claimProcedureNoteID = request.claimProcedureNote.getNoteID(clientID: trim(session.clientID), objectID: 6, instanceID: ProcedureID)>

							<!-------------------------------------------------------------------------------------->
							<!--- Get the formatted note entries.                                                --->
							<!-------------------------------------------------------------------------------------->
							<cfif claimProcedureNoteID GTE 1>

								<cfset getClaimProcedureNoteXML = request.claimProcedureNote.getNoteDB(clientID: trim(session.clientID), noteID: claimProcedureNoteID)>
								<cfset claimProcedureNoteXML = XMLParse(getClaimProcedureNoteXML.Note)>
								<cfset numberOfClaimProcedureNotes = Arraylen(claimProcedureNoteXML.note.entry)>
								<cfset returnClaimProcedureNoteXML = "">
								<cfset newProcedureIDAssigned = 0>

								<cfoutput>
									<cfloop from="#trim(numberOfClaimProcedureNotes)#" to="1" step="-1" index="i">

										<cfset thisUserID = claimProcedureNoteXML.note.entry[i].UserID.xmlText>
										<cfset thisUserFName = claimProcedureNoteXML.note.entry[i].UserFName.xmlText>
										<cfset thisUserLName = claimProcedureNoteXML.note.entry[i].UserLName.xmlText>
										<cfset thisEntryDate = claimProcedureNoteXML.note.entry[i].EntryDate.xmlText>
										<cfset thisEntryTime = claimProcedureNoteXML.note.entry[i].EntryTime.xmlText>
										<cfset thisEntryNote = claimProcedureNoteXML.note.entry[i].EntryNote.xmlText>

										<cfif thisEntryNote NEQ "">
											<cfset returnClaimProcedureNoteXML = returnClaimProcedureNoteXML & "<tr><td class=sitelabel><span style=""cursor: hand"" onmouseover=""doTooltip(1, this, event, '" & trim(thisUserFName) & " " & trim(thisUserLName) & " " & trim(thisEntryDate) & " " & trim(thisEntryTime) & "');"" onmouseout=""hideTip();""><strong>" & LEFT(trim(thisUserFName), 1) & ". " & trim(thisUserLName) & " " & DateFormat(trim(thisEntryDate), 'mm/dd/yy') & "</strong></span><br>" & thisEntryNote & "</td></tr>">
										</cfif>

									</cfloop>
								</cfoutput>

								<cfset returnClaimProcedureNoteXML = "<table border=0 cellpadding=2 cellspacing=0>" & returnClaimProcedureNoteXML & "</table>">

								<cfset getClaimProcedureNote = returnClaimProcedureNoteXML>

								<cfset showCodes = showCodes & "<table cellpadding=0 cellspacing=0><tr><td>&nbsp;&nbsp;&nbsp;</td><td><span class=sm>" & getClaimProcedureNote & "</span></td></tr></table><br>">

							<cfelse>

								<cfset showCodes = showCodes & "<table cellpadding=0 cellspacing=0><tr><td>&nbsp;&nbsp;&nbsp;</td><td><span class=sm>No Procedure notes to show.</span></td></tr></table><br>">

							</cfif>

						</cfif>

					</cfloop>

				</cfif>

				<tr>
					<td>

						<cf_gcBorderedTable	title="Claim&nbsp;Procedure&nbsp;Notes" tablealign="Left" tableWidth="100%">

							<table align="left" cellpadding="5" cellspacing="0" border="0" width="550">
								<tr>
									<td class="SiteLabel" valign="top">
										<cfif claimProcedureNoteID LT 1 OR claimProcedureNoteID EQ "">
											There are no claim notes to show.
										<cfelseif showCodes NEQ "">
											<div class="scroll">
												#showCodes#
											</scroll>
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

