<!---- appIntakeCancel.cfm ---->


<!------------------------------------------------------------------>
<!--- Initialize tag variables and verify required fields        --->
<!------------------------------------------------------------------>
	<cfparam name="Submitted" default="no">

	<cfparam name="attributes.formname" default="cancelIntake">
	<cfset formname = attributes.formname>

	<cfparam name="attributes.intakeID" default="">
	<cfset intakeID = attributes.intakeID>

	<cfif IsDefined("form.intakeID") AND form.intakeID NEQ "">
		<cfset intakeID = form.intakeID>
	<cfelseif IsDefined("url.intakeID") AND url.intakeID NEQ "">
		<cfset intakeID = url.intakeID>
	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="intakeID"
		fieldnames="Intake ID"
		datatypes="numeric">



<!-------------------------------------------------------------------------------------->
<!--- Javascripts for this page.                                                     --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<script language="JavaScript">

			function validateForm(){

				var msg  = "";

				if(document.#formName#.note.value == "" || document.#formName#.note.value.length <= 2){
					msg = msg + "\n\n Please enter a note (minimum 5 characters) on why this intake is being closed.";
				};

				if(msg.length >= 1){					
					resetSubmitButtons();
					document.#trim(formname)#.note.focus();
					alert(msg);
					return false;
				}
				else{
					return true;
				};
			};

		</script>
	</cfoutput>




<!-------------------------------------------------------------------------------------->
<!--- Start the disaply of this page.                                                --->
<!-------------------------------------------------------------------------------------->
<cfif NOT IsDefined("form.Submitted")>


	<cfoutput>

		<div align="left">
			<table border="0" width="248" cellpadding="0" cellspacing="10"><tr><td>
			<cf_gcBorderedTable	title="Cancel Intake" tablealign="left">
				<form name="#trim(formName)#" method="post" onsubmit="return validateForm();">
					<input type="Hidden" name="Submitted" value="yes">
					<input type="Hidden" name="intakeID" value="#trim(intakeID)#">
					<table border="0" width="100%" cellpadding="0" cellspacing="10">

						<!--- Note --->

						<cfset class = "SiteRequiredLabel">
						<tr>
							<td class="#trim(class)#" valign="top">
					   			Reason for Intake Cancellation:	#trim(intakeID)#
							</td>
						</tr>
						<tr>
							<td>
								<textarea class="SiteTextArea" name="note" cols="40" rows="5"></textarea>
							</td>
						</tr>

						<!---Submit Button--->
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td align="center">
								<cf_gcSubmitButton value="Cancel&nbsp;Intake">&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Close&nbsp;Window" onclick="self.close();">
							</td>
						</tr>

					</table>

				</form>
				</cf_gcBorderedTable>
				</td></tr></table>
			</div>


			<!--------------------------------------------------------------------------------------->
			<!--- When you have a validate form and the msg is not black this function will have  --->
			<!--- to be called below the gcSubmitButton custom tag. This tag will set             --->
			<!--- caller.submitButtonID allowing this code to work.                               --->
			<!--------------------------------------------------------------------------------------->
			<script language="JavaScript">
				document.#trim(formname)#.note.focus();
				function resetSubmitButtons(){
					document.#formName#.SubmitButton#trim(submitButtonID)#.style.display='inline';
					spSubmitButton#trim(submitButtonID)#.innerText='';
				};
			</script>


		</cfoutput>




<cfelseif IsDefined("form.Submitted")>


	<!-------------------------------------------------------------------------------------->
	<!--- If the variable intakeID and the the variable action are available in the      --->
	<!--- URL scope and the user logged in is the owner inactivate the intake            --->
	<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("intakeID") AND IsNumeric(intakeID)>

		<cfif ListContains(session.User.getRoleIDs(), "5") OR ListContains(session.User.getRoleIDs(), "6")>

			<cfquery name="cancelIntake" datasource="#trim(request.datasource)#">
				UPDATE intake
				SET Active = 0
				WHERE IntakeID = #trim(IntakeID)#
			</cfquery>

			<cfset request.intakeNote = application.beanFactory.getBean("Note") />
			<cfset intakeNoteID = request.intakeNote.getNoteID(objectID: 8, instanceID: trim(intakeID), clientID: trim(session.clientID))>
			<cfif NOT IsNumeric(intakeNoteID) AND IsNumeric(intakeID)>
				<cfset intakeNoteID = request.intakeNote.addNote(clientID: trim(session.clientID), objectID: 8, instanceID: trim(intakeID))>
			</cfif>
			<cfset request.intakeNote.addNoteEntry(clientID: trim(session.clientID), NoteID: intakeNoteID, noteEntry: '#trim(form.note)#', userID: #trim(session.user.getUsersID())#, userFName: '#trim(session.user.getFName())#', userLName: '#trim(session.user.getLName())#')>


			<cfoutput>
				<script language="JavaScript">
					var msg = "Intake (#trim(IntakeID)#) has been cancelled";
					var linkToGoTo = 'appPatientIntakeSearch.cfm?msg=' + msg;
					var tempOpener = 'window.opener';
					if (typeof(eval(tempOpener)) != "undefined"){
						window.opener.location.href = linkToGoTo;
					};
					self.close();
				</script>
			</cfoutput>

		</cfif>

	</cfif>


</cfif>
