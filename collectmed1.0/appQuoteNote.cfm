<!---- appQuoteNote.cfm ---->




<cfscript>
	include template="/collectmed1.0/CustomTags/appSiteApplicationTop.cfm";
</cfscript>



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.editorID" default="#randRange(1001, 2252)#">
	<cfset editorID = attributes.editorID>
	
	<cfparam name="attributes.formName" default="addQuoteNote">
	<cfset formName = attributes.formName>

	<cfparam name="attributes.quoteNoteID" default="">
	<cfset quoteNoteID = attributes.quoteNoteID>

	<cfif IsDefined("form.quoteNoteID") AND form.quoteNoteID NEQ "">
		<cfset quoteNoteID = form.quoteNoteID>
	<cfelseif IsDefined("url.quoteNoteID") AND url.quoteNoteID NEQ "">
		<cfset quoteNoteID = url.quoteNoteID>
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
	<!--- <cfset request.quoteNote = CreateObject("component","com.common.Note")> --->
	<cfset request.quoteNote = application.beanFactory.getBean("Note")>


<!-------------------------------------------------------------------------------------->
<!--- If the noteid was not sent in but other parameters were get the NoteID.        --->
<!-------------------------------------------------------------------------------------->
	<cfif (NOT IsNumeric(quoteNoteID) OR quoteNoteID LTE 0) AND Isnumeric(objectID) AND IsNumeric(instanceID)>
		<cfset quoteNoteID = request.quoteNote.getNoteID(clientid: trim(session.ClientID), objectID: trim(objectID), instanceID: trim(instanceID))>
	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Get the formatted note entries.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfif quoteNoteID GTE 1>

		<cfset getQuoteNoteXML = request.quoteNote.getNoteDB(clientid: trim(session.ClientID), noteID: trim(quoteNoteID))>
		<cfset quoteNoteXML = XMLParse(getQuoteNoteXML.Note)>
		<cfset numberOfQuoteNotes = Arraylen(quoteNoteXML.note.entry)>
		<cfset returnQuoteNoteXML = "">
		<cfset newQuoteIDAssigned = 0>

		<cfoutput>
			<cfloop from="#trim(numberOfQuoteNotes)#" to="1" step="-1" index="i">

				<cfset thisUserID = quoteNoteXML.note.entry[i].UserID.xmlText>
				<cfset thisUserFName = quoteNoteXML.note.entry[i].UserFName.xmlText>
				<cfset thisUserLName = quoteNoteXML.note.entry[i].UserLName.xmlText>
				<cfset thisEntryDate = quoteNoteXML.note.entry[i].EntryDate.xmlText>
				<cfset thisEntryTime = quoteNoteXML.note.entry[i].EntryTime.xmlText>
				<cfset thisEntryNote = quoteNoteXML.note.entry[i].EntryNote.xmlText>

				<cfif thisEntryNote NEQ "">
					<cfset returnQuoteNoteXML = returnQuoteNoteXML & "<tr><td class=sitelabel><span style=""cursor: hand"" onmouseover=""doTooltip(1, this, event, '" & trim(thisUserFName) & " " & trim(thisUserLName) & " " & trim(thisEntryDate) & " " & trim(thisEntryTime) & "');"" onmouseout=""hideTip();""><strong>" & LEFT(trim(thisUserFName), 1) & ". " & trim(thisUserLName) & " " & DateFormat(trim(thisEntryDate), 'mm/dd/yy') & "</strong></span><br>" & thisEntryNote & "</td></tr>">
				</cfif>

			</cfloop>
		</cfoutput>

		<cfset returnQuoteNoteXML = "<table border=0 cellpadding=2 cellspacing=0>" & returnQuoteNoteXML & "</table>">

		<cfset getQuoteNote = returnQuoteNoteXML>

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

						<cf_gcBorderedTable	title="Add&nbsp;Quote&nbsp;Note" tablealign="Right" spanLink="yes" spanLinkTitle="Add&nbsp;Quote&nbsp;Note" onclick="document.getElementById('DHTMLEditor#EditorID#').focus();" view="none">

							<table align="left" cellpadding="5" cellspacing="0" border="0" width="550">
								<tr>
									<td valign="top">
							   			<form name="#trim(formName)#" method="post" action="appQuoteNoteAdd.cfm" onsubmit="return validateForm();">
											<input type="Hidden" name="NoteID" value="#trim(quoteNoteID)#">
											<input type="Hidden" name="clientID" value="#trim(clientID)#">
											<input type="Hidden" name="objectID" value="#trim(objectID)#">
											<input type="Hidden" name="InstanceID" value="#trim(InstanceID)#">

											<table cellspacing="4" cellpadding="0" border="0" width="100%">
												<tr>
													<td class="SiteLabel" colspan="2">
														<cf_gcHTMLNoteEditor form_name="#trim(formName)#" field_name="note" identifier="#EditorID#" editWidthPercent="100" editHeight="35" verbage="">
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
				<!--- Show only if the quote has at least one note.                                  --->
				<!-------------------------------------------------------------------------------------->
				<tr>
					<td>

						<cf_gcBorderedTable	title="Quote&nbsp;Notes" tablealign="Left" tableWidth="100%">

							<table align="left" cellpadding="5" cellspacing="0" border="0" width="550">
								<tr>
									<td class="SiteLabel" valign="top">
										<cfif quoteNoteID LT 1 OR quoteNoteID EQ "">
											There are no quote notes to show.
										<cfelseif IsDefined("getQuoteNote") AND getQuoteNote NEQ "">
											<div class="scroll">
												#getQuoteNote#
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




<cfscript>
	include template="/collectmed1.0/CustomTags/appSiteApplicationBottom.cfm";
</cfscript>


