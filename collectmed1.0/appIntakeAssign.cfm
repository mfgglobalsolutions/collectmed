<!---- appIntakeAssign.cfm ---->



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formname" default="assignIntake">
	<cfset formname = attributes.formname>

	<cfparam name="attributes.IntakeID" default="">
	<cfset IntakeID = attributes.IntakeID>

	<cfif IsDefined("form.IntakeID") AND form.IntakeID NEQ "">
		<cfset IntakeID = form.IntakeID>
	<cfelseif IsDefined("url.IntakeID") AND url.IntakeID NEQ "">
		<cfset IntakeID = url.IntakeID>
	</cfif>

	<cfparam name="attributes.reassign" default="">
	<cfset reassign = attributes.reassign>

	<cfif IsDefined("form.reassign") AND form.reassign NEQ "">
		<cfset reassign = form.reassign>
	<cfelseif IsDefined("url.reassign") AND url.reassign NEQ "">
		<cfset reassign = url.reassign>
	</cfif>

	<cfparam name="attributes.assignToUserID" default="">
	<cfset assignToUserID = attributes.assignToUserID>

	<cfif IsDefined("form.assignToUserID") AND form.assignToUserID NEQ "">
		<cfset assignToUserID = form.assignToUserID>
	<cfelseif IsDefined("url.assignToUserID") AND url.assignToUserID NEQ "">
		<cfset assignToUserID = url.assignToUserID>
	</cfif>

	<cfparam name="attributes.note" default="">
	<cfset note = attributes.note>

	<cfif IsDefined("form.note") AND form.note NEQ "">
		<cfset note = form.note>
	<cfelseif IsDefined("url.note") AND url.note NEQ "">
		<cfset note = url.note>
	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="IntakeID"
		fieldnames="Intake ID"
		datatypes="numeric">



<!-------------------------------------------------------------------------------------->
<!--- Make sure that the userID is sent in.                                          --->
<!-------------------------------------------------------------------------------------->
	<cfif isDefined("form.submitted")>

		<cf_gcVerifyFields
			fields="assignToUserID"
			fieldnames="Assign to User ID"
			datatypes="numeric">

	</cfif>


<!-------------------------------------------------------------------------------------->
<!--- Make sure that the Note is sent in.                                            --->
<!-------------------------------------------------------------------------------------->
	<cfif isDefined("form.submitted") AND reassign EQ 1>

		<cf_gcVerifyFields
			fields="note"
			fieldnames="Note">

	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- get the assigned user.                                                         --->
<!-------------------------------------------------------------------------------------->
	<cfif reassign EQ 1>

		<cfquery name="getUsersID" datasource="#request.datasource#">
			SELECT AssignedToUserID
			FROM Intake
			WHERE IntakeID = #trim(IntakeID)#
		</cfquery>

		<cfset AssignedToUserID = getUsersID.AssignedToUserID>

		<cfquery name="getIntake" datasource="#request.datasource#">
			SELECT CONCAT(FName, ' ', LName) AS Fullname
			FROM view_UserAccountParameters
			WHERE UsersID = #trim(AssignedToUserID)#
		</cfquery>

		<cfset userFullName = getIntake.FullName>

		<!---<cfset request.IntakeObject = CreateObject("component","com.common.Intake")>
		<cfset request.IntakeObject.init(IntakeID: trim(IntakeID))>
		<cfset AssignedToUserID = request.IntakeObject.getAssignedToUserID()>

		<cfset request.AssignedUser = CreateObject("component","com.common.User")>
		<cfset request.AssignedUser.init(usersID: trim(AssignedToUserID))>
		<cfset userFullName = request.AssignedUser.getFullName()>	--->

	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Javascripts for this page.                                                     --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<script language="JavaScript">

			function validateForm(){

				var msg  = "";

				beforeSubmit();

				if(document.#formName#.assignToUserID.value == ""){
					msg = msg + "Please choose an individual to assign Intake to";
				};

				<cfif reassign EQ 1>
					if(document.#formName#.note.value == "" || document.#formName#.note.value.length <= 2){
						msg = msg + "\n\n Please enter a note (minimum 5 characters) on why this Intake is being re-assigned.";
					};
				</cfif>

				if(msg.length >= 1){
					alert(msg);
					resetSubmitButtons();
					return false;
				}
				else{
					return true;
				};
			};

		</script>
	</cfoutput>



<!-------------------------------------------------------------------------------------->
<!--- If the assigned user of this intake is logged in and the person trying         --->
<!--- to re-assign is an agent then they cannot re-assign.                           --->
<!-------------------------------------------------------------------------------------->
<cfset assignedLoggedIn = 0>
<cfif reassign EQ 1>
	<cfloop collection="#evaluate(request.structName)#" item="UsersID">
		<cfif trim(AssignedToUserID) EQ UsersID>
			<cfset assignedLoggedIn = 1>
			<cfbreak>
		</cfif>
	</cfloop>
</cfif>

<cfif NOT ListContains(session.User.getRoleIDs(), "5") AND NOT ListContains(session.User.getRoleIDs(), "6") AND assignedLoggedIn>
	<cfquery name="getUsersName" datasource="#trim(request.datasource)#">
		SELECT FName, LName
		FROM view_UserAccountParameters
		WHERE UsersID = #trim(AssignedToUserID)#
	</cfquery>
	<cfoutput>
		<div align="left">
			<table border="1" width="420" cellpadding="0" cellspacing="10">
				<tr>
					<td>
						<span id="spCheckIntakeExists" class="TextWarning" style="font-size: medium;">
							This Intake cannot be re-assigned currently the assigned user (#getUsersName.FName#. #getUsersName.LName#) is logged in. Please contact a supervisor if you need this intake re-assigned to you.
						</span>
					</td>
				</tr>
			</table>
		</div>
	</cfoutput>
	<cfexit>
</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Get all the entitys that are from this client.                                 --->
<!-------------------------------------------------------------------------------------->
<cfif reassign EQ 1>
	<cfset NotInUsersID = trim(AssignedToUserID)>
<cfelse>
	<cfset NotInUsersID = "">
</cfif>

<cfif NOT ListContains(session.User.getRoleIDs(), "5") AND NOT ListContains(session.User.getRoleIDs(), "6")>
	<cfset getClientsEntities = session.Client.getClientsUsers(distinct: "yes", ClientID: session.ClientID, InUsersIDList: session.User.getUsersID(), NotInUsersIDList: trim(NotInUsersID), haveRoleList: "5,6,7")>
<cfelse>
	<cfset getClientsEntities = session.Client.getClientsUsers(distinct: "yes", ClientID: session.ClientID, NotInUsersIDList: trim(NotInUsersID), haveRoleList: "5,6,7")>
</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->

	<cfif NOT IsDefined("form.Submitted")>

		<cfoutput>

			<div align="left">
			<table border="0" width="248" cellpadding="0" cellspacing="10"><tr><td>
			<cf_gcBorderedTable	title="Assign Intake: #trim(IntakeID)#" tablealign="left">
				<form name="#trim(formName)#" method="post" onsubmit="return validateForm();">
					<input type="Hidden" name="Submitted" value="yes">
					<input type="Hidden" name="reassgin" value="#trim(reassign)#">
					<input type="Hidden" name="IntakeID" value="#trim(IntakeID)#">
					<table border="0" width="100%" cellpadding="0" cellspacing="10">

						<!---Last Assigned To--->
						<cfif reassign EQ 1>

							<tr>
								<td colspan="2" class="SiteLabel" nowrap>
									<strong>Currently assigned to:</strong><br>#userFullName# on #DateFormat(now(), "mm/dd/yyyy")#
								</td>
							</tr>

						</cfif>


						<!---Assign To--->
						<tr>
							<td class="SiteRequiredLabel" nowrap valign="middle">
								Assign to:&nbsp;&nbsp;
								<select class="SiteSelectBox" name="assignToUserID">
									<cfif getClientsEntities.RecordCount GTE 2>
										<option value="">
									</cfif>
									<cfloop query="getClientsEntities">
										<option value="#trim(UsersID)#">#trim(Fullname)#
									</cfloop>
								</select>
							</td>
						</tr>

						<!--- Note --->
						<cfif reassign EQ 1>
							<cfset class = "SiteRequiredLabel">
						<cfelse>
							<cfset class = "SiteLabel">
						</cfif>

						<!---<tr>
							<td bgcolor="FFFFFF" width="20%" class="#trim(class)#" valign="top">
					   			Note:
							</td>
							<td>
								<textarea class="SiteTextArea" name="note" cols="40" rows="5"></textarea>
							</td>
						</tr>--->
						<tr>
							<td colspan="2" nowrap align="center"><cf_gcHTMLNoteEditor form_name="#trim(formName)#" field_name="note" editWidthPercent="100" editHeight="35" verbage=""></td>
						</tr>


						<!---Submit Button--->
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td align="center" colspan="2">
								<cf_gcSubmitButton value="Assign & Close">&nbsp;&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Cancel" onclick="self.close();">
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
				function resetSubmitButtons(){
					document.#formName#.SubmitButton#trim(submitButtonID)#.style.display='inline';
					spSubmitButton#trim(submitButtonID)#.innerText='';
				};
			</script>


		</cfoutput>


	<cfelse>

		<cf_tagIntakeAssign 
			clientid="#trim(session.ClientID)#"
			assignToUserID="#trim(assignToUserID)#"
			IntakeID="#trim(IntakeID)#"
			assignorID="#session.User.getUsersID()#"
			note="#trim(note)#"
			userFName="#trim(session.user.getFName())#"
			userLName="#trim(session.user.getLName())#">

		<script language="JavaScript">
			//window.opener.location.reload();
			var tempOpener = 'window.opener';
			if (typeof(eval(tempOpener)) != "undefined"){
				window.opener.location.href = window.opener.location.href;
			};
			self.close();
		</script>

	</cfif>