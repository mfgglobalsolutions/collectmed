<!---- appFlagEdit.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formname" default="editFlagForm">
	<cfset formname = attributes.formname>
	
	<cfparam name="attributes.flagID" default="">
	<cfset flagID = attributes.flagID>
		
	<cfif IsDefined("form.flagID") AND form.flagID NEQ "">
		<cfset flagID = form.flagID>
	<cfelseif IsDefined("url.flagID") AND url.flagID NEQ "">
		<cfset flagID = url.flagID>	
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
			fields="flagID"
			fieldnames="Flag ID"
			datatypes="numeric">		
	
	
		<cfoutput>
			<script language="JavaScript">
				
				function validateForm(){	
					
					beforeSubmit();
												
					var msg  = "";					
						
					if(document.#formName#.reassign.checked && (document.#formName#.note.value == "" || document.#formName#.note.value == "Enter Note Here")){
						msg = msg + "You must enter a note when you re-assign a flag.\n\n";		
					};	
					
					checkNote();
																	
					if(msg.length >= 1){
						alert(msg);
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
		<!--- Create the flag Object.                                                        --->
		<!-------------------------------------------------------------------------------------->	
		<cfset request.Flag = CreateObject("component", "com.common.Flag").init(flagID)>
		
		<!-------------------------------------------------------------------------------------->
		<!--- Find out if this user has viewed this flag if not add the record that they     --->
		<!--- have opened it.                                                                --->
		<!-------------------------------------------------------------------------------------->		
		<cfif request.Flag.flagHasBeenViewed(usersID: trim(session.User.getUsersID()), flagID: trim(flagID)) EQ 0>
			<cfset request.Flag.updateFlagStatus(flagID, 169, trim(session.user.getUsersID()), 'System Note: User Viewed Flag')>			
		</cfif>
		
		<!-------------------------------------------------------------------------------------->
		<!--- Re-Init after any changes to the flag.                                         --->
		<!-------------------------------------------------------------------------------------->		
		<cfset request.Flag.init(flagID)>
		
				
		<!-------------------------------------------------------------------------------------->
		<!--- Get the current status of this flag.                                           --->
		<!-------------------------------------------------------------------------------------->		
		<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="20" standardlistitemid="#request.Flag.getStatusID()#" active="1" returnvariable="getDisplay">
		<cfset displayStatus = getDisplay.ItemNameDisplay>
	
	
					
		<!-------------------------------------------------------------------------------------->
		<!--- Get all the entitys that are from this client.                                 --->
		<!-------------------------------------------------------------------------------------->	
		<cfif NOT ListFind(session.User.getRoleIDs(), 8) AND NOT ListFind(session.User.getRoleIDs(), 2)>					
			<cfset NotInUsersID = trim(session.User.getUsersID())>
		<cfelse>
			<cfset NotInUsersID = "">	
		</cfif>	
		<cfset getClientsEntities = session.Client.getClientsUsers(ClientID: session.ClientID, NotInUsersIDList: trim(NotInUsersID))>


		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Setup the number of notes currently on this flag used in multiple places.      --->
		<!-------------------------------------------------------------------------------------->		
		<cfset noteXML = XMLParse(trim(request.Flag.getNote()))>	
		<cfset numberOfEntries = Arraylen(noteXML.flag.entry)>
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
			<cfif request.Flag.getStatusID() EQ 175>
				<cfset titleRight = "">
			<cfelse>
				<cfset titleRight = "<span class=siteLabel onclick=""if(noteNoShow.style.display=='none') {noteNoShow.style.display='block'} else {noteNoShow.style.display='none'};"">Add&nbsp;Note</span>">
			</cfif>
			
			<cf_gcBorderedTable	title="Edit&nbsp;Flag" titleRight="#trim(titleRight)#" tablealign="left" tableWidth="100%">	
				<form name="#trim(formName)#" method="post" onsubmit="return validateForm();">
					<input type="Hidden" name="Submitted" value="yes">		
					<input type="Hidden" name="flagID" value="#trim(flagID)#">			
					<table align="left" cellpadding="5" cellspacing="0" border="0" width="100%">				
						<tr>
							<td colspan="2">
								<span class="SiteRequiredLabel" style="cursor: hand" onclick="if(historyNoShow.style.display=='none') {historyNoShow.style.display='block'} else {historyNoShow.style.display='none'};"><strong>Current&nbsp;Status/History</strong>:&nbsp;#displayStatus#</span>
							</td>
							<td colspan="1" align="right">								
								<span class="SiteRequiredLabel">
									<cfif request.Flag.getStatusID() NEQ 175>
										<strong>Action</strong>:&nbsp;<select class="SiteSelectBox" name="StatusID">
											<option value="">
											<cfif request.Flag.getStatusID() NEQ 174 AND numberOfEntries GTE 1>
												<cfif (trim(session.User.getUsersID()) EQ request.Flag.getAssignedToUserID()) OR (ListFind(session.User.getRoleIDs(), 8) OR ListFind(session.User.getRoleIDs(), 2))>
													<option value="174">Close
												</cfif>	
											</cfif>
											<cfif request.Flag.getStatusID() NEQ 172>
												<option value="172">Hold	
											</cfif>
											<!--- If the flag is closed or on hold then give the ability to re-open. --->
											<cfif request.Flag.getStatusID() EQ 172 OR request.Flag.getStatusID() EQ 174>
												<option value="173">Re-Open
											</cfif>
											<!--- Flag must be closed in order to archive. --->
											<cfif request.Flag.getStatusID() EQ 174 AND ListFind(session.User.getRoleIDs(), 8) OR ListFind(session.User.getRoleIDs(), 2)>												
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
								<cfset flagStatuses = request.Flag.flagStatuses(flagID)>
								<cfset statusString = "">
								<cfloop query="flagStatuses">			
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
													<cfif request.Flag.getStatusID() NEQ 175 AND ListFind(session.User.getRoleIDs(), 8) OR ListFind(session.User.getRoleIDs(), 2)>												
														<cfswitch expression="#trim(request.Flag.getPriority())#">
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
														<span id="priorityDisplay" style="display: 'block';" class="SiteLabel"><cfswitch expression="#trim(request.Flag.getPriority())#"><cfcase value="1"><font face="Arial Black" size="3" color="FF0000">URGENT</font></cfcase><cfcase value="2"><font face="Arial Black" size="3">HIGH</font></cfcase><cfcase value="3">MEDIUM</cfcase><cfcase value="4">LOW</cfcase></cfswitch></span>
													</td>
														
													<cfif request.Flag.getStatusID() NEQ 175 AND ListFind(session.User.getRoleIDs(), 8) OR ListFind(session.User.getRoleIDs(), 2)>
														<td nowrap>
															<span id="prioritySelect" style="display: 'none';" class="SiteLabel">													
																<select class="SiteSelectBox" name="priority">
																	<option value="1" <cfif trim(request.Flag.getPriority()) EQ 1>SELECTED</cfif>>Urgent
																	<option value="2" <cfif trim(request.Flag.getPriority()) EQ 2>SELECTED</cfif>>High
																	<option value="3" <cfif trim(request.Flag.getPriority()) EQ 3>SELECTED</cfif>>Medium
																	<option value="4" <cfif trim(request.Flag.getPriority()) EQ 4>SELECTED</cfif>>Low	
																</select>	
															</span>
														</td>																						
													</cfif>											
												</tr>
											</table>	
											
										</td>			
										
										
										<!--- Assign To --->
										<td class="SiteRequiredLabel" nowrap>												
											<cfif request.Flag.getStatusID() NEQ 175>
												<input type="checkbox" name="reassign" onclick="if (this.checked) {reassignNoShow.style.display='inline';noteNoShow.style.display='block';} else {reassignNoShow.style.display='none';document.all.AssignedToUserID.options[0].selected = true;};">
												Re-Assign&nbsp;
												<span id="reassignNoShow" style="display: 'none';">
													to:																
													<select class="SiteSelectBox" name="AssignedToUserID">
														<option value="">
														<cfloop query="getClientsEntities">
															<option value="#trim(UsersID)#">#trim(Fullname)# 
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
											<cfif request.Flag.getStatusID() NEQ 175 AND ListFind(session.User.getRoleIDs(), 8) OR ListFind(session.User.getRoleIDs(), 2)>
												
												<input type="hidden" name="dueDate">
												<span class="SiteLabel" id="span_dueDate" title="Click to select a date" style="display: 'inline'; position:relative; cursor:hand; color:990000;" onClick="openCalender('#trim(formname)#', 'dueDate');"><u>#DateFormat(request.Flag.getDueDate(), "mm/dd/yy")#</u></span>
											
											<cfelse>
												
												<span class="SiteLabel" style="position:relative; color:990000;" class="siteLabel">#DateFormat(request.Flag.getDueDate(), "mm/dd/yy")#</span>
											
											</cfif>										
											
										</td>										
											
									</tr>	
																												
									<!--- New Note --->		
									<tr>
									    <td colspan="6" class="SiteLabel" valign="top">				
																					
											<cfset count = 0>
											<cfloop from="#trim(numberOfEntries)#" to="1" step="-1" index="i">
												<cfset fontcolor = "#IIF(i MOD 2, DE("0000ff"), DE("000000"))#">		
												<cfset thisUserID = noteXML.flag.entry[i].UserID.xmlText>
												<cfset thisUserFName = noteXML.flag.entry[i].UserFName.xmlText>
												<cfset thisUserLName = noteXML.flag.entry[i].UserLName.xmlText>
												<cfset thisEntryDate = noteXML.flag.entry[i].EntryDate.xmlText>
												<cfset thisEntryTime = noteXML.flag.entry[i].EntryTime.xmlText>		
												<cfset thisEntryNote = noteXML.flag.entry[i].EntryFlag.xmlText>	
												
												<cfif thisEntryNote NEQ "">
													<cfset returnNoteXML = returnNoteXML & "<tr><td class=sitelabel><strong><font color=#trim(fontColor)#>" & trim(thisUserFName) & " " & trim(thisUserLName) & " " & DateFormat(trim(thisEntryDate), 'm/d/yy') & " " & TimeFormat(trim(thisEntryTime), 'h:mm:ss tt') & "</font></strong><br>" & thisEntryNote & "</td></tr>">
												</cfif>	
												
											</cfloop>
											
												
											<cfset flagXMLDisplay = "<table border=0 cellpadding=2 cellspacing=0>" & returnNoteXML & "</table>">				
											
											<div class="scroll">
												#flagXMLDisplay#
											</div>
													
										</td>
									</tr>																	
									
									<!--- Note --->									
									<tr id="noteNoShow" style="display: 'none';">	
									    <td class="SiteLabel" colspan="6">
											<cf_gcHTMLNoteEditor form_name="#trim(formname)#" field_name="note" verbage="">		
										</td>
									</tr>
									
									<tr>
									    <td colspan="6" align="center"><cfif request.Flag.getStatusID() NEQ 175><input type="Submit" value="Save&nbsp;Changes" class="SiteSubmitBox">&nbsp;&nbsp;</cfif><input type="Button" class="SiteSubmitbox" value="Close" name="closeTD" onclick="window.close();"></td>							   
									</tr>
								</table>							
								
							</td>						
						</tr>
					</table>			
							
				</form>
				</cf_gcBorderedTable>
				</td></tr></table>	
			</div>
		
		</cfoutput>
	
	
	<cfelse>
			
		<cfset request.Flag = CreateObject("component", "com.common.Flag").init(form.flagID)>
	
		<cfif IsDefined("form.Priority") AND IsNumeric(form.Priority)>	
			<cfset request.Flag.setPriority(trim(form.Priority))>
		</cfif>
	
		<cfif IsDefined("form.dueDate") AND IsDate(form.dueDate)>	
			<cfset request.Flag.setDueDate(trim(form.dueDate))>
		</cfif>
		
		<cfset request.Flag.commit()>
		
		<cfif IsDefined("form.Note") AND form.Note NEQ "">
			<cfset request.Flag.addFlagEntry(flagID: flagID, userID: trim(session.user.getUsersID()), userFName: trim(session.user.getFName()), userLName: trim(session.user.getLName()), flagEntry: trim(form.Note))>
			<cfset request.Flag.updateFlagStatus(flagID, 170, trim(session.user.getUsersID()), 'System Note: Commented')>
		</cfif>
		
		<cfif IsDefined("form.AssignedToUserID") AND IsNumeric(form.AssignedToUserID)>
			<cfset request.Flag.assignFlag(clientID: trim(session.clientID), assignorID: trim(session.user.getUsersID()), usersID: trim(form.AssignedToUserID), flagID: flagID)>
			<cfset request.Flag.updateFlagStatus(flagID, 171, trim(session.user.getUsersID()), 'System Note: Re-Assigned Flag')>
		</cfif>
		
		<cfif IsDefined("form.StatusID") AND IsNumeric(form.StatusID)>
			<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="20" standardlistitemid="#trim(form.StatusID)#" active="1" returnvariable="getDisplay">
			<cfset request.Flag.updateFlagStatus(flagID, trim(StatusID), trim(session.user.getUsersID()), 'System Note: #getDisplay.ItemNameDisplay#')>
		</cfif>
				
		<cfoutput>
			<br>
			<div align="left">
				<table border="0" width="85%" cellpadding="0" cellspacing="10">
					<tr>
						<td>
							<cf_gcBorderedTable	title="Reminder" tableWidth="100%">	
								<p><font size="2" color="000000"><strong>Flag has been saved.<br>This window will now close.</strong></font></p>
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
					window.opener.location.reload();
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

	
