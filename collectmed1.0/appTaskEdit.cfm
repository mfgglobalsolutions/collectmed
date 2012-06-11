<!---- appTaskEdit.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formname" default="editTaskForm">
	<cfset formname = attributes.formname>
	
	<cfparam name="attributes.taskID" default="">
	<cfset taskID = attributes.taskID>
		
	<cfif IsDefined("form.taskID") AND form.taskID NEQ "">
		<cfset taskID = form.taskID>
	<cfelseif IsDefined("url.taskID") AND url.taskID NEQ "">
		<cfset taskID = url.taskID>	
	</cfif>
		
	<cfparam name="attributes.AssignedToUserID" default="">
	<cfset AssignedToUserID = attributes.AssignedToUserID>
	
	<cfif IsDefined("form.AssignedToUserID") AND form.AssignedToUserID NEQ "">
		<cfset AssignedToUserID = form.AssignedToUserID>
	<cfelseif IsDefined("url.AssignedToUserID") AND url.AssignedToUserID NEQ "">
		<cfset AssignedToUserID = url.AssignedToUserID>	
	</cfif>
		
	
	
<!-------------------------------------------------------------------------------------->
<!--- Javascripts for this page.                                                     --->
<!-------------------------------------------------------------------------------------->	
	<cfif NOT IsDefined("form.submitted")>
	
		
		<cf_gcVerifyFields
			fields="taskID"
			fieldnames="Task ID"
			datatypes="numeric">		
	
	
		<cfoutput>
			<script language="JavaScript">
				
				function validateForm(){	
					
					beforeSubmit();
												
					var msg  = "";					
						
					if(document.#formName#.reassign.checked && (document.#formName#.note.value == "" || document.#formName#.note.value.length < 5 || document.#formName#.note.value == "Enter Note Here")){
						msg = msg + "You must enter a note atleast 5 characters in length when you re-assign a task.\n\n";		
					};	
					
					checkNote();
																	
					if(msg.length >= 1){
						alert(msg);
						resetSubmitButtons();
						return false;
					}
					else{
						return true;
					};	
				};	
				
				function openCalender(formName, dateFieldName){				
					var xCordinate =  event.screenX;
				    var yCordinate =  event.screenY + 10;
				    var rxCordinate = event.offsetX;
				    var temp = 10*5 - rxCordinate;				
				    xCordinate = xCordinate  + temp;
					Calender=window.open('appCalendar.cfm?formname='+formName+'&dateFieldName='+dateFieldName, 'Calender', 'top='+yCordinate+',left='+xCordinate+',dependent=no,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=155,height=195');
	     			Calender.focus(0);
				};
								
				function checkNote(){
					if(document.#formName#.note.value == "Enter Note Here"){
						document.#formName#.note.value = "";
					};
				};
						
			</script>
		</cfoutput>
	</cfif>
	
		
		
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	<cfif NOT IsDefined("form.Submitted")>
	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Create the task Object.                                                        --->
		<!-------------------------------------------------------------------------------------->	
		<cfset request.Task = CreateObject("component", "com.common.Task").init(taskID)>
		
		<!-------------------------------------------------------------------------------------->
		<!--- Find out if this user has viewed this task if not add the record that they     --->
		<!--- have opened it.                                                                --->
		<!-------------------------------------------------------------------------------------->		
		<cfif request.Task.taskHasBeenViewed(usersID: trim(session.User.getUsersID()), taskID: trim(taskID)) EQ 0>
			<cfset request.Task.updateTaskStatus(taskID, 169, trim(session.user.getUsersID()), 'System Note: User Viewed Task')>			
		</cfif>
		
		<!-------------------------------------------------------------------------------------->
		<!--- Re-Init after any changes to the task.                                         --->
		<!-------------------------------------------------------------------------------------->		
		<cfset request.Task.init(taskID)>
		
				
		<!-------------------------------------------------------------------------------------->
		<!--- Get the current status of this task.                                           --->
		<!-------------------------------------------------------------------------------------->		
		<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="20" standardlistitemid="#request.Task.getStatusID()#" active="1" returnvariable="getDisplay">
		<cfset displayStatus = getDisplay.ItemNameDisplay>
	
	
				
		<!-------------------------------------------------------------------------------------->
		<!--- Get all the entitys that are from this client.                                 --->
		<!--- An ADMINISTRATOR can reassign this task to themselves.                         --->
		<!-------------------------------------------------------------------------------------->	
		<!---I beleive this is wrong if you are an admin you should be able to reassing to yourself 01/02/06 GC
		<cfif NOT ListFind(session.User.getRoleIDs(), 8) AND NOT ListFind(session.User.getRoleIDs(), 2)>					
			<cfset NotInUsersID = trim(session.User.getUsersID())>
		<cfelse>
			<cfset NotInUsersID = "">	
		</cfif>	--->
		
		<cfif ListFind(session.User.getRoleIDs(), 8) OR ListFind(session.User.getRoleIDs(), 2) OR ListFind(session.User.getRoleIDs(), 3) OR ListFind(session.User.getRoleIDs(), 5) OR ListFind(session.User.getRoleIDs(), 6)>					
			<cfset NotInUsersID = "">
		<cfelse>
			<cfset NotInUsersID = trim(session.User.getUsersID())>				
		</cfif>	
		<cfset getClientsEntities = session.Client.getClientsUsers(ClientID: session.ClientID, NotInUsersIDList: trim(NotInUsersID))>

		
				
		<!-------------------------------------------------------------------------------------->
		<!--- Get the creator information                                                    --->
		<!-------------------------------------------------------------------------------------->			
		<cfquery name="getCreatorInfo" datasource="#trim(request.datasource)#">
			SELECT CONCAT(e.FName, ' ', e.LName) AS Fullname
			FROM entity e LEFT JOIN pa_master.Users u ON e.EntityID = u.EntityID
			WHERE u.UsersID = #trim(request.Task.getCreatorID())#			
		</cfquery>
		
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Setup the number of notes currently on this task used in multiple places.      --->
		<!-------------------------------------------------------------------------------------->		
		<cfset noteXML = XMLParse(trim(request.Task.getNote()))>	
		<cfset numberOfEntries = Arraylen(noteXML.task.entry)>
		<cfset returnNoteXML = "">	
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Needed CSS for this page.                                                      --->
		<!-------------------------------------------------------------------------------------->	
		<cfoutput>
			<style type="text/css">
			<!--
				div.scroll {
					height: 150px;	
					width: 100%;	
					overflow: auto;	
					border: 1px solid FFFFFF;
					background-color: ffffff;	
					padding: 0px;
				}
			-->
			</style>
		</cfoutput>	
				
		

		<cfoutput>
			<div align="left">
			<table border="0" width="85%" cellpadding="0" cellspacing="10"><tr><td width="100%">
			<cfif request.Task.getStatusID() EQ 175>
				<cfset titleRight = "">
			<cfelse>
				<cfset titleRight = "<span class=siteLabel onclick=""if(noteNoShow.style.display=='none') {noteNoShow.style.display='block'} else {noteNoShow.style.display='none'};""><u>Add&nbsp;Note</u></span>">
			</cfif>
			
			<cf_gcBorderedTable	title="Edit&nbsp;Task" titleRight="#trim(titleRight)#" tablealign="left" tableWidth="100%">	
				<form name="#trim(formName)#" method="post" onsubmit="return validateForm();">
					<input type="Hidden" name="Submitted" value="yes">		
					<input type="Hidden" name="taskID" value="#trim(taskID)#">			
					<table align="left" cellpadding="5" cellspacing="0" border="0" width="100%">				
						<tr>
							<td colspan="2">
								<span class="SiteRequiredLabel" style="cursor: hand" onclick="if(historyNoShow.style.display=='none') {historyNoShow.style.display='block'} else {historyNoShow.style.display='none'};"><strong>Current&nbsp;Status/History</strong>:&nbsp;#displayStatus#</span>
							</td>							
							<td colspan="1" align="right">								
								<span id="spAction" class="SiteRequiredLabel" style="display: 'inline';">
									<cfif request.Task.getStatusID() NEQ 175>
										<strong>Action</strong>:&nbsp;<select class="SiteSelectBox" name="StatusID">
											<option value="">
											<cfif request.Task.getStatusID() NEQ 174 AND numberOfEntries GTE 1>
												<cfif (trim(session.User.getUsersID()) EQ request.Task.getAssignedToUserID()) OR (ListFind(session.User.getRoleIDs(), 8) OR ListFind(session.User.getRoleIDs(), 2))>
													<option value="174">Close
												</cfif>	
											</cfif>
											<cfif request.Task.getStatusID() NEQ 172>
												<option value="172">Hold	
											</cfif>
											<!--- If the task is closed or on hold then give the ability to re-open. --->
											<cfif request.Task.getStatusID() EQ 172 OR request.Task.getStatusID() EQ 174>
												<option value="173">Re-Open
											</cfif>
											<!--- Task must be closed in order to archive. --->
											<cfif request.Task.getStatusID() EQ 174 AND ListFind(session.User.getRoleIDs(), 8) OR ListFind(session.User.getRoleIDs(), 2)>												
												<option value="175">Archive
											</cfif>			
										</select>
									<cfelse>
										&nbsp;
									</cfif>		
								</span>										
							</td>											
						</tr>							
						<tr id="historyNoShow" style="display: 'none';">	
						    <td class="SiteLabel" colspan="3">
								<cfset taskStatuses = request.Task.taskStatuses(taskID)>
								<cfset statusString = "">
								<cfloop query="taskStatuses">			
									<cfset fontcolor = "#IIF(currentRow MOD 2, DE("000000"), DE("000000"))#">		
									<cfset statusString = statusString & "<tr><td class=sitelabel><strong><font color=#trim(fontColor)#>" & trim(FullName) & " " & DateFormat(trim(DateCreated), 'm/d/yy') & " " & TimeFormat(trim(DateCreated), 'h:mm:ss tt') & "</font></strong><br>" & Note & "</td></tr>">
								</cfloop>	
								<cfset statusString = "<table border=0 cellpadding=2 cellspacing=0>" & statusString & "</table>">	
								<div class="scroll">
									#trim(statusString)#	
								</div>
							</td>
						</tr>					
						
						
						<tr>					
							<td colspan="3" valign="top" width="100%">			   
							
					   			<table cellspacing="4" cellpadding="3" border="0" width="100%">										
									<tr>			
																				
										<td nowrap>
										
											<!--- Priority --->		
											<table cellspacing="0" cellpadding="0" border="0">										
												<tr>													
													<cfif request.Task.getStatusID() NEQ 175 AND ListFind(session.User.getRoleIDs(), 8) OR ListFind(session.User.getRoleIDs(), 2)>												
														<cfswitch expression="#trim(request.Task.getPriority())#">
															<cfcase value="1"><cfset selectNum = 0></cfcase>
															<cfcase value="2"><cfset selectNum = 1></cfcase>
															<cfcase value="3"><cfset selectNum = 2></cfcase>
															<cfcase value="4"><cfset selectNum = 3></cfcase>
														</cfswitch>
														<td nowrap><input type="checkbox" name="priorityReassign" onclick="if (this.checked) {priorityDisplay.style.display='none';prioritySelect.style.display='block';} else {priorityDisplay.style.display='block'; prioritySelect.style.display='none'; document.all.priority.options[#trim(selectNum)#].selected = true;};"></td>	
													</cfif>	
													
													<td nowrap>
														<span class="SiteRequiredLabel">Priority:&nbsp;</span>
													</td>	
													<td nowrap>	
														<span id="priorityDisplay" style="display: 'block';" class="SiteLabel"><cfswitch expression="#trim(request.Task.getPriority())#"><cfcase value="1"><font face="Arial Black" size="3" color="FF0000">URGENT</font></cfcase><cfcase value="2"><font face="Arial Black" size="3">HIGH</font></cfcase><cfcase value="3">MEDIUM</cfcase><cfcase value="4">LOW</cfcase></cfswitch></span>
													</td>
														
													<cfif request.Task.getStatusID() NEQ 175 AND ListFind(session.User.getRoleIDs(), 8) OR ListFind(session.User.getRoleIDs(), 2)>
														<td nowrap>
															<span id="prioritySelect" style="display: 'none';" class="SiteLabel">													
																<select class="SiteSelectBox" name="priority">
																	<option value="">
																	<cfif NOT trim(request.Task.getPriority()) EQ 1><option value="1">Urgent</cfif>
																	<cfif NOT trim(request.Task.getPriority()) EQ 2><option value="2">High</cfif>
																	<cfif NOT trim(request.Task.getPriority()) EQ 3><option value="3">Medium</cfif>
																	<cfif NOT trim(request.Task.getPriority()) EQ 4><option value="4">Low</cfif>
																</select>	
															</span>
														</td>																						
													</cfif>											
												</tr>
											</table>	
											
										</td>			
										
										
										<!--- Assign To --->
										<td class="SiteRequiredLabel" nowrap>												
											<cfif request.Task.getStatusID() NEQ 175>
												<input type="checkbox" name="reassign" onclick="if(spAction.style.display=='none') {spAction.style.display='block'; document.all.StatusID.options[0].selected = true; } else {spAction.style.display='none'}; if (this.checked) {reassignNoShow.style.display='inline';noteNoShow.style.display='block';} else {reassignNoShow.style.display='none';document.all.AssignedToUserID.options[0].selected = true;};">
												Re-Assign&nbsp;
												<span id="reassignNoShow" style="display: 'none';">
													to:																
													<select class="SiteSelectBox" name="AssignedToUserID">
														<option value="">
														<cfloop query="getClientsEntities">
															<!---<cfif UsersID NEQ request.Task.getAssignedToUserID()>--->
																<option value="#trim(UsersID)#">#trim(Fullname)# 
															<!---</cfif>--->	
														</cfloop>			
													</select>
												</span>
											<cfelse>
												&nbsp;
											</cfif>												
										</td>				
																															
										<!---Show Date--->											
										<td nowrap align="right">											
											<span class="SiteRequiredLabel">Due&nbsp;Date:</span>	
											<cfif request.Task.getStatusID() NEQ 175 AND ListFind(session.User.getRoleIDs(), 8) OR ListFind(session.User.getRoleIDs(), 2)>
												
												<input type="hidden" name="dueDate">
												<span class="SiteLabel" id="span_dueDate" title="Click to select a date" style="display: 'inline'; position:relative; cursor:hand; color:990000;" onClick="openCalender('#trim(formname)#', 'dueDate');"><u>#DateFormat(request.Task.getDueDate(), "mm/dd/yy")#</u></span>
											
											<cfelse>
												
												<span class="SiteLabel" style="position:relative; color:990000;" class="siteLabel">#DateFormat(request.Task.getDueDate(), "mm/dd/yy")#</span>
											
											</cfif>										
											
										</td>										
											
									</tr>	
																												
									<!--- New Note --->		
									<tr>
									    <td colspan="6" class="SiteLabel" valign="top">				
																					
											<cfset count = 0>
											<cfloop from="#trim(numberOfEntries)#" to="1" step="-1" index="i">
												<cfset fontcolor = "#IIF(i MOD 2, DE("0000ff"), DE("000000"))#">		
												<cfset thisUserID = noteXML.task.entry[i].UserID.xmlText>
												<cfset thisUserFName = noteXML.task.entry[i].UserFName.xmlText>
												<cfset thisUserLName = noteXML.task.entry[i].UserLName.xmlText>
												<cfset thisEntryDate = noteXML.task.entry[i].EntryDate.xmlText>
												<cfset thisEntryTime = noteXML.task.entry[i].EntryTime.xmlText>		
												<cfset thisEntryNote = noteXML.task.entry[i].EntryTask.xmlText>	
												
												<cfif thisEntryNote NEQ "">
													<cfset returnNoteXML = returnNoteXML & "<tr><td class=sitelabel><strong><font color=#trim(fontColor)#>" & trim(thisUserFName) & " " & trim(thisUserLName) & " " & DateFormat(trim(thisEntryDate), 'm/d/yy') & " " & TimeFormat(trim(thisEntryTime), 'h:mm:ss tt') & "</font></strong><br>" & thisEntryNote & "</td></tr>">
												</cfif>	
												
											</cfloop>
																							
											<cfset taskXMLDisplay = "<table border=0 cellpadding=2 cellspacing=0>" & returnNoteXML & "</table>">				
											
											<div class="scroll">
												#taskXMLDisplay#
											</div>
													
										</td>
									</tr>																	
									
									<!--- Note --->									
									<tr id="noteNoShow" style="display: 'none';">	
									    <td class="SiteLabel" colspan="6">
											<cf_gcHTMLNoteEditor form_name="#trim(formname)#" field_name="note" verbage="" editHeight="60">		
										</td>
									</tr>
									
									<tr>
									    <td colspan="6" align="center"><cfif request.Task.getStatusID() NEQ 175><cf_gcSubmitButton value="Save&nbsp;Changes">&nbsp;&nbsp;</cfif><input type="Button" class="SiteSubmitbox" value="Close" name="closeTD" onclick="window.close();"></td><!--- var tempOpener = 'window.opener';if (typeof(eval(tempOpener)) != 'undefined'){//window.opener.location.reload();window.opener.location.href = window.opener.location.href;};--->							   
									</tr>
								</table>							
								
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
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Verify that the needed parameters have been sent in.                           --->
		<!-------------------------------------------------------------------------------------->
		<cf_gcVerifyFields
			fields="form.taskid"
			fieldnames="Task ID"
			datatypes="numeric">
			
			
		<cfset request.Task = CreateObject("component", "com.common.Task").init(form.taskID)>
	
		<cfif IsDefined("form.Priority") AND IsNumeric(form.Priority)>	
			<cfset request.Task.setPriority(trim(form.Priority))>
		</cfif>
	
		<cfif IsDefined("form.dueDate") AND IsDate(form.dueDate)>	
			<cfset request.Task.setDueDate(trim(form.dueDate))>
		</cfif>
		
		<cfset request.Task.commit()>
		
		<cfif IsDefined("form.Note") AND form.Note NEQ "">
			<cfset request.Task.addTaskEntry(taskID: taskID, userID: trim(session.user.getUsersID()), userFName: trim(session.user.getFName()), userLName: trim(session.user.getLName()), taskEntry: trim(form.Note))>
			<cfset request.Task.updateTaskStatus(taskID, 170, trim(session.user.getUsersID()), 'System Note: Commented')>
		</cfif>
		
		<cfif IsDefined("form.AssignedToUserID") AND IsNumeric(form.AssignedToUserID)>
			<cfset request.Task.assignTask(clientID: trim(session.clientID), assignorID: trim(session.user.getUsersID()), usersID: trim(form.AssignedToUserID), taskID: taskID)>
			<cfset request.Task.updateTaskStatus(taskID, 171, trim(session.user.getUsersID()), 'System Note: Re-Assigned Task')>
		</cfif>
		
		<cfif IsDefined("form.StatusID") AND IsNumeric(form.StatusID)>
			<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="20" standardlistitemid="#trim(form.StatusID)#" active="1" returnvariable="getDisplay">
			<cfset request.Task.updateTaskStatus(taskID, trim(StatusID), trim(session.user.getUsersID()), 'System Note: #getDisplay.ItemNameDisplay#')>
		</cfif>
				
		<cfoutput>
			<br>
			<div align="left">
				<table border="0" width="85%" cellpadding="0" cellspacing="10">
					<tr>
						<td>
							<cf_gcBorderedTable	title="Reminder" tableWidth="100%">	
								<p><font size="2" color="000000"><strong>Task has been saved.<br>This window will now close.</strong></font></p>
							</cf_gcBorderedTable>
						</td>
					</tr>
				</table>	
			</div>		
		</cfoutput>
		
		<!-------------------------------------------------------------------------------------->
		<!--- Pause the page to let them know they have been logged out.                     --->
		<!-------------------------------------------------------------------------------------->
		<cfoutput>
			
			<script language="JavaScript">
				var tempOpener = 'window.opener';		
				if (typeof(eval(tempOpener)) != "undefined"){	
					//window.opener.location.reload();
					window.opener.location.href = window.opener.location.href;
				};				
			</script>			
					
			<script language="JavaScript">
				<!--					
				self.setTimeout('winClose()', 1500) 					
				function winClose(){
					self.close();
				};							
				// -->
			</script>
		
		</cfoutput>
				
						
	</cfif>		

	

