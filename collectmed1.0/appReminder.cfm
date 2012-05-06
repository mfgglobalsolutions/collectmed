
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.wholeNumbers" default="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50">
 	<cfset wholeNumbers = attributes.wholeNumbers>
 
	<cfparam name="attributes.numberOfItemsPerRow" default="4">
 	<cfset numberOfItemsPerRow = attributes.numberOfItemsPerRow>
		
	<cfparam name="attributes.id" default="0">
	<cfset id = attributes.id>
	
	<cfparam name="attributes.action" default="edit">
	<cfset action = attributes.action>
	
	<cfif IsDefined("form.action") AND form.action NEQ "">
		<cfset action = form.action>
	<cfelseif IsDefined("url.action") AND url.action NEQ "">
		<cfset action = url.action>	
	</cfif>
	
	<cfparam name="attributes.formname" default="Reminder">
	<cfset formname = attributes.formname>
	
	<cfparam name="attributes.ReminderID" default="">
	<cfset ReminderID = attributes.ReminderID>
	
	<cfif IsDefined("form.ReminderID") AND form.ReminderID NEQ "">
		<cfset ReminderID = form.ReminderID>
	<cfelseif IsDefined("url.ReminderID") AND url.ReminderID NEQ "">
		<cfset ReminderID = url.ReminderID>	
	</cfif>
	
	<cfparam name="attributes.UsersID" default="">
	<cfset UsersID = attributes.UsersID>
	
	<cfif IsDefined("form.UsersID") AND form.UsersID NEQ "">
		<cfset UsersID = form.UsersID>
	<cfelseif IsDefined("url.UsersID") AND url.UsersID NEQ "">
		<cfset UsersID = url.UsersID>	
	</cfif>
	
	<cfparam name="attributes.ObjectID" default="">
	<cfset ObjectID = attributes.ObjectID>
	
	<cfif IsDefined("form.ObjectID") AND form.ObjectID NEQ "">
		<cfset ObjectID = form.ObjectID>
	<cfelseif IsDefined("url.ObjectID") AND url.ObjectID NEQ "">
		<cfset ObjectID = url.ObjectID>	
	</cfif>
	
	<cfparam name="attributes.InstanceID" default="">
	<cfset InstanceID = attributes.InstanceID>
	
	<cfif IsDefined("form.InstanceID") AND form.InstanceID NEQ "">
		<cfset InstanceID = form.InstanceID>
	<cfelseif IsDefined("url.InstanceID") AND url.InstanceID NEQ "">
		<cfset InstanceID = url.InstanceID>	
	</cfif>
	
	<cfparam name="attributes.showDate" default="">
	<cfset showDate = attributes.showDate>
	
	<cfif IsDefined("form.showDate") AND form.showDate NEQ "">
		<cfset showDate = form.showDate>
	<cfelseif IsDefined("url.showDate") AND url.showDate NEQ "">
		<cfset showDate = url.showDate>	
	</cfif>
	
	<cfparam name="attributes.editNote" default="">
	<cfset editNote = attributes.editNote>
	
	<cfparam name="attributes.editShowDate" default="">
	<cfset editShowDate = attributes.editShowDate>
	
	<cfset parametersList = "">
	<cfset parametersListDisplay = "">	
	<cfset editNote = "">
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Make sure that the userID is sent in.                                          --->
<!-------------------------------------------------------------------------------------->	
	<cfif IsDefined("form.submitted")>
				
		<cf_gcVerifyFields
			fields="UsersID"
			fieldnames="Users ID"
			datatypes="numeric">		
	
	</cfif>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Make sure that the Note is sent in.                                            --->
<!-------------------------------------------------------------------------------------->	
	<cfif IsDefined("form.submitted")>
				
		<cf_gcVerifyFields
			fields="Note"
			fieldnames="Note">		
	
	</cfif>		
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create the object that will be used for filling in variables.                  --->
<!-------------------------------------------------------------------------------------->	
	<cfif IsNumeric(ObjectID) AND IsNumeric(InstanceID) AND ObjectID EQ 5>																					
		<cfset request.instance = CreateObject("component","com.common.db.ClaimIO")>
	</cfif>				
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- If the action is edit and there is a reminderID then load for editing.         --->
<!-------------------------------------------------------------------------------------->
	<cfif Action EQ "edit" AND IsNumeric(reminderID)>
		
		<cfset request.Reminder = CreateObject("component","com.common.Reminder")>
		<cfset request.Reminder.init(trim(ReminderID))>
		<cfset ObjectID = request.Reminder.getObjectID()>
		<cfset InstanceID = request.Reminder.getInstanceID()>
		<cfset editInstanceID = InstanceID>
		<cfset editShowDate = request.Reminder.getShowDate()>
		<cfset editNote = request.Reminder.getNote()>	
		
	<cfelseif Action EQ "edit" AND IsNumeric(ObjectID) AND IsNumeric(InstanceID) AND ObjectID EQ 5>
		
		<cfset parametersList = "InterchangeClaimID,DateCreated,DueDate">
		<cfset parametersListDisplay = "ICN,DateCreated,DueDate">
		<cfset request.instance.init(trim(InstanceID))>
		<cfset editNote = "ICN: <span onclick=editClaim=window.open(\'appClaimEditMedicare.cfm?claimid=#trim(request.instance.getClaimID())#\',\'editClaim\',\'top=80,left=100,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=900,height=480\');><span style='cursor:hand';><u>#request.Instance.getInterchangeClaimID()#</u></span></span>">		
	
	<cfelseif Action EQ "view" AND IsNumeric(reminderID)>
		
		<cfset request.Reminder = CreateObject("component","com.common.Reminder")>
		<cfset request.Reminder.init(trim(ReminderID))>
				
	</cfif>		
	
						
						
<!-------------------------------------------------------------------------------------->
<!--- Javascripts for this page.                                                     --->
<!-------------------------------------------------------------------------------------->		
	<cfoutput>
		<script language="JavaScript">				
			function openCalender(formName, dateFieldName){				
				var xCordinate =  event.screenX;
			    var yCordinate =  event.screenY + 10;
			    var rxCordinate = event.offsetX;
			    var temp = 10*5 - rxCordinate;				
			    xCordinate = xCordinate  + temp;
				Calender=window.open('appCalendar.cfm?formname='+formName+'&dateFieldName='+dateFieldName, 'Calender', 'top='+yCordinate+',left='+xCordinate+',dependent=no,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=155,height=195');
     			Calender.focus(0);
			};
			
			function AddReminderText#trim(id)#(pasteText){
				var sText#id# = window.frames['DHTMLEditor#id#'].document.selection.createRange();
				sText#id#.pasteHTML(pasteText);
			}								
		</script>
	</cfoutput>
	
		
		
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	<cfif NOT IsDefined("form.Submitted") AND Action EQ "edit">
		
		<cfoutput>
			
			<div align="left">
			
				<table cellpadding="5" cellspacing="0" border="0">				
					<tr style="display:inline" id="addReminderEntry_#trim(id)#">					
						<td valign="top">			   
				  														
							<form name="#trim(formName)#" method="post" onsubmit="document.all.Note.value = document.frames('DHTMLEditor#ID#').document.body.innerHTML;"><!--- return validateForm();--->
								<input type="Hidden" name="Submitted" value="yes">
								<input type="Hidden" name="UsersID" value="#trim(session.User.getUsersID())#">
								<input type="Hidden" name="ReminderID" value="#trim(reminderID)#">
								<input type="Hidden" name="action" value="#trim(action)#">									
																			
								<table cellspacing="4" cellpadding="3" border="0">
									
									<!---Tie--->
									<cfif IsNumeric(ObjectID) AND IsNumeric(InstanceID) AND ObjectID EQ 5>																					
																			
										<cfset request.ObjectType = CreateObject("component","com.common.db.ObjectIO")>
										<cfset request.ObjectType.init(trim(ObjectID))>
										<cfset reminderTieToolTip = "If you tie this reminder to an object you will be able to search the reminders for a specific object."> 
																				
										<!---<tr>			
											<td colspan="2" class="SiteLabel" nowrap align="left">
												<input type="Checkbox" name="tieToObject" CHECKED>&nbsp;<span class="SiteLabel" style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, '#trim(reminderTieToolTip)#');" onmouseout="hideTip(this);">Tie reminder to this #trim(request.ObjectType.getObjectName())#</span>
											</td>															
										</tr>--->
										<input type="Hidden" name="tieToObject" value="1">
										<tr id="showParameters">
											<td colspan="2" class="SiteLabel">						
												<div style="border: 1px solid; border-color: c0c0c0 c0c0c0 c0c0c0 c0c0c0; padding: 4px;">
					
													<table border="0" cellpadding="3" cellspacing="0">
											   			<tr>
														<cfset count = 1>
											    		<cfloop list="#trim(parametersList)#" index="i">    
											     			
															<cfset thisParameter = "request.instance.get" & i & "()">
															<cfif FindNoCase("Date", i)>
																<cfset thisParameter = "DateFormat(" & thisParameter & ", 'mm/dd/yy')">
															</cfif>
															
															<cfset thisParameterValue = evaluate(thisParameter)>
															<cfset thisParameterDisplay = ListGetAt(parametersListDisplay, count)>
																										
															<cfif thisParameterValue NEQ "" AND thisParameterValue NEQ "NULL">
																<td class="SiteLabel"><u><span unselectable="on" style="cursor:hand;" onclick="AddReminderText#trim(id)#('#trim(thisParameterValue)#');">#trim(thisParameterDisplay)#</span></u></td>
															<cfelse>
																<td class="SiteLabel">#trim(thisParameterDisplay)#</td>
															</cfif>
												     		
															<cfif ListFind(wholeNumbers,evaluate(count / numberOfItemsPerRow))>
												      			</tr>     
												     		</cfif>
															
															<cfset count = count + 1>   
															      
												    	</cfloop>  
														
													</table>	
												</div>														
											</td>
										</tr>
									
									</cfif>					
										
									<!---Show Date--->
									<tr>			
										<td colspan="2" class="SiteRequiredLabel" nowrap>
											<span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, 'The day this reminder will show in your reminder box.');" onmouseout="hideTip(this);">Show&nbsp;Date:</span>
											<span id="span_showDate" title="Click to select a date" style="display: 'inline'; position:relative; cursor:hand; color:990000;" onClick="openCalender('#trim(formname)#', 'showDate');" class="siteLabel"><u><cfif IsDate(editShowDate)>#DateFormat(editShowDate, "mmm, dd yyyy")#<cfelse>Choose&nbsp;Date</cfif></u></span>
											<input type="hidden" name="showDate" value="#trim(editShowDate)#">
										</td>			
									</tr>	
																		
										
									<!--- Reminder --->									
									<tr>
										<td colspan="2">														
											<cf_gcHTMLNoteEditor form_name="AddReminderEntry_#trim(id)#" identifier="#trim(id)#" field_name="Note" verbage="#trim(editNote)#" editHeight="105">						
										</td>									  
									</tr>															
									<tr>
									    <td colspan="2" align="center"><cf_gcSubmitButton value="Submit">&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Close" name="closeTD" onclick="self.close();"></td>							   
									</tr>					
								</table>	
														
							</form>
											
						</td>						
					</tr>
				</table>
			
			</div>
			
		</cfoutput>

	
	<cfelseif IsDefined("form.Submitted")>
		
	
		<cftry>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Only tie the reminder to an object id the user decided to.                     --->
			<!-------------------------------------------------------------------------------------->			
			<cfif NOT IsDefined("form.tieToObject")>
				<cfset ObjectID = "">
				<cfset InstanceID = "">
			</cfif>
			
			<cfif IsDefined("form.action") AND form.action EQ "edit" AND IsDefined("form.reminderID") AND IsNumeric(reminderID)>
				
				<!-------------------------------------------------------------------------------------->
				<!--- Initialize the reminder object and commit it to the DB.                        --->
				<!-------------------------------------------------------------------------------------->			
				<cfset Reminder = CreateObject("component","com.common.Reminder")>
				<cfset Reminder.init(trim(form.reminderID))>
				
				<cfif IsDefined("form.tieToObject")>
					<cfset Reminder.setObjectID(trim(ObjectID))>
					<cfset Reminder.setInstanceID(trim(InstanceID))>
				<cfelse>
					<cfset Reminder.setObjectID('NULL')>
					<cfset Reminder.setInstanceID('NULL')>
				</cfif>
					
				<cfset Reminder.setShowDate('#trim(showDate)#')>
				<cfset Reminder.setNote('#trim(Note)#')>	
				<cfset Reminder.commit()>
			
			<cfelse>
			
				<!-------------------------------------------------------------------------------------->
				<!--- Create the reminder object and commit it to the DB.                            --->
				<!-------------------------------------------------------------------------------------->			
				<cfset Reminder = CreateObject("component","com.common.Reminder")>
				<cfset Reminder.new(UsersID: trim(UsersID), ObjectID: '#trim(ObjectID)#', InstanceID: '#trim(InstanceID)#', ShowDate: '#trim(showDate)#', Note: '#trim(Note)#')>	
				<cfset Reminder.commit()>
				
			</cfif>
			
			
			<cfoutput>
				<br>
				<div align="left">
					<table border="0" width="320" cellpadding="0" cellspacing="10">
						<tr>
							<td>
								<cf_gcBorderedTable	title="Reminder" tableWidth="100%">	
									<p><font size="2" color="000000"><strong>Your changes have been saved.<br>This window will now close.</strong></font></p>
								</cf_gcBorderedTable>
							</td>
						</tr>
					</table>	
				</div>
			
			</cfoutput>
			
			<cfoutput>
				
				<!---<cfif IsDefined("form.action") AND form.action EQ "edit" AND IsDefined("form.reminderID") AND IsNumeric(reminderID)>--->
					<script language="JavaScript">
						//window.opener.location.reload();						
						var tempOpener = 'window.opener';		
						if (typeof(eval(tempOpener)) != "undefined"){								
							window.opener.location.href = window.opener.location.href;
						};	
					</script>	
				<!---</cfif>--->
								
				<script language="JavaScript">
					<!--					
					self.setTimeout('winClose()', 1500) 					
					function winClose(){
						self.close();
					};							
					// -->
				</script>
				
			</cfoutput>
			
					
			
			<cfcatch type="Any">
				
				<cfoutput>			
					<p>Caught an exception, type = #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>
				<cfabort>
				
			</cfcatch> 
			
		</cftry>	
	
	
	
	
	<cfelseif Action EQ "view" AND IsNumeric(reminderID)>
	
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
				<cfset titleRight = ""><!---<span class=siteLabel onclick=""""><u>Edit&nbsp;Reminder</u></span>--->				
				<cf_gcBorderedTable	title="View&nbsp;Reminder" titleRight="#trim(titleRight)#" tablealign="left" tableWidth="54%">	
					<table cellpadding="5" cellspacing="0" border="0">				
						<tr style="display:inline" id="addReminderEntry_#trim(id)#">					
							<td valign="top" class="SiteLabel">		
								<div class="scroll">
									#request.Reminder.getNote()#
								</div>	
							</td>
						</tr>
					</table>
				</cf_gcBorderedTable>	
			</div>	
		</cfoutput>			
		
	
						
	</cfif>



























<!---<!---- appReminder.cfm ---->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.action" default="">
	<cfset action = attributes.action>
	
	<cfif IsDefined("form.action") AND form.action NEQ "">
		<cfset action = form.action>
	<cfelseif IsDefined("url.action") AND url.action NEQ "">
		<cfset action = url.action>	
	</cfif>
	
	<cfparam name="attributes.formname" default="Reminder">
	<cfset formname = attributes.formname>
	
	<cfparam name="attributes.ReminderID" default="">
	<cfset ReminderID = attributes.ReminderID>
	
	<cfif IsDefined("form.ReminderID") AND form.ReminderID NEQ "">
		<cfset ReminderID = form.ReminderID>
	<cfelseif IsDefined("url.ReminderID") AND url.ReminderID NEQ "">
		<cfset ReminderID = url.ReminderID>	
	</cfif>
	
	<cfparam name="attributes.UsersID" default="">
	<cfset UsersID = attributes.UsersID>
	
	<cfif IsDefined("form.UsersID") AND form.UsersID NEQ "">
		<cfset UsersID = form.UsersID>
	<cfelseif IsDefined("url.UsersID") AND url.UsersID NEQ "">
		<cfset UsersID = url.UsersID>	
	</cfif>
	
	<cfparam name="attributes.ObjectID" default="">
	<cfset ObjectID = attributes.ObjectID>
	
	<cfif IsDefined("form.ObjectID") AND form.ObjectID NEQ "">
		<cfset ObjectID = form.ObjectID>
	<cfelseif IsDefined("url.ObjectID") AND url.ObjectID NEQ "">
		<cfset ObjectID = url.ObjectID>	
	</cfif>
	
	<cfparam name="attributes.InstanceID" default="">
	<cfset InstanceID = attributes.InstanceID>
	
	<cfif IsDefined("form.InstanceID") AND form.InstanceID NEQ "">
		<cfset InstanceID = form.InstanceID>
	<cfelseif IsDefined("url.InstanceID") AND url.InstanceID NEQ "">
		<cfset InstanceID = url.InstanceID>	
	</cfif>
	
	<cfparam name="attributes.showDate" default="">
	<cfset showDate = attributes.showDate>
	
	<cfif IsDefined("form.showDate") AND form.showDate NEQ "">
		<cfset showDate = form.showDate>
	<cfelseif IsDefined("url.showDate") AND url.showDate NEQ "">
		<cfset showDate = url.showDate>	
	</cfif>
		
	<cfparam name="attributes.note" default="">
	<cfset note = attributes.note>
	
	<cfif IsDefined("form.note") AND form.note NEQ "">
		<cfset note = form.note>
	<cfelseif IsDefined("url.note") AND url.note NEQ "">
		<cfset note = url.note>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Make sure that the userID is sent in.                                          --->
<!-------------------------------------------------------------------------------------->	
	<cfif IsDefined("form.submitted")>
				
		<cf_gcVerifyFields
			fields="UsersID"
			fieldnames="Users ID"
			datatypes="numeric">		
	
	</cfif>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Make sure that the Note is sent in.                                            --->
<!-------------------------------------------------------------------------------------->	
	<cfif IsDefined("form.submitted")>
				
		<cf_gcVerifyFields
			fields="note"
			fieldnames="Note">		
	
	</cfif>		
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- If the action is edit and there is a reminderID then load for editing.         --->
<!-------------------------------------------------------------------------------------->
	<cfif Action EQ "edit" AND IsNumeric(reminderID)>
		
		<cfset request.Reminder = CreateObject("component","com.common.Reminder")>
		<cfset request.Reminder.init(trim(ReminderID))>
		<cfset ObjectID = request.Reminder.getObjectID()>
		<cfset InstanceID = request.Reminder.getInstanceID()>
		<cfset editInstanceID = InstanceID>
		<cfset editShowDate = request.Reminder.getShowDate()>
		<cfset editNote = request.Reminder.getNote()>
		<!---<cfset UsersID = request.Reminder.getUsersID()>		
		<cfset Dismissed = request.Reminder.getDismissed()>	--->
		
	</cfif>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Javascripts needed for this page.                                              --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<script language="JavaScript">
			
			function validateForm(){	
					
				var msg  = "";					
				
				if(document.#formName#.UsersID.value == ""){
					msg = msg + "Users ID is missing.\n\n";		
				};
					
				if(document.#formName#.showDate.value == ""){
					msg = msg + "Please choose a date to show the reminder.\n\n";		
				};	
								
				if(document.#formName#.note.value == "" || document.#formName#.note.value.length <= 2){
					msg = msg + "Please enter a note (minimum 5 characters) regarding this reminder.\n\n";		
				};
											
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
			
			function insert(entry){
				document.#trim(formName)#.parameter.value = entry;
			};
														
			function insertAtCursor(thisField, thisValue) {												
				if(thisValue != ""){
					//IE support
					if (document.selection) {
						thisField.focus();
						sel = document.selection.createRange();
						sel.text = " " + thisValue + " ";
					}
					//MOZILLA/NETSCAPE support
					else if (thisField.selectionStart || thisField.selectionStart == '0') {
						var startPos = thisField.selectionStart;
						var endPos = thisField.selectionEnd;
						thisField.value = thisField.value.substring(0, startPos)
						+ thisValue
						+ thisField.value.substring(endPos, thisField.value.length);
					} 
					else {
						thisField.value += thisValue;
					};
					
					document.#trim(formName)#.parameter.value = '';
				};
			};
			
		</script>
		
	</cfoutput>	

	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	<cfif NOT IsDefined("form.Submitted")>
	
		<cfoutput>
			
			<div align="left">
				<table border="0" width=330 height=295 cellpadding="0" cellspacing="10">
					<tr>
						<td>
							<cf_gcBorderedTable	title="Create Reminder" tablealign="center">	
								<form name="#trim(formName)#" method="post" onsubmit="return validateForm();">
									<input type="Hidden" name="Submitted" value="yes">
									<input type="Hidden" name="UsersID" value="#trim(session.User.getUsersID())#">
									<input type="Hidden" name="ReminderID" value="#trim(reminderID)#">
									<input type="Hidden" name="action" value="#trim(action)#">
									
									<table border="0" width="100%" cellpadding="0" cellspacing="10">					
										
										<!---Show Date--->
										<cfif IsNumeric(ObjectID) AND IsNumeric(InstanceID)>
											
											<cfset request.ObjectType = CreateObject("component","com.common.db.ObjectIO")>
											<cfset request.ObjectType.init(trim(ObjectID))>
											<cfset reminderTieToolTip = "If you tie this reminder to an object you will be able to search the reminders for a specific object."> 
											
											<tr>			
												<td colspan="2" class="SiteLabel" nowrap align="left">
													<input type="Checkbox" name="tieToObject" CHECKED><!---<cfif IsDefined("editInstanceID") AND IsNumeric(editInstanceID)>---> <span class="SiteLabel" style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, '#trim(reminderTieToolTip)#');" onmouseout="hideTip(this);">Tie reminder to this #trim(request.ObjectType.getObjectName())#</span>
												</td>															
											</tr>
											
											<cfif ObjectID EQ 5>																				
												
												<cfset request.instance = CreateObject("component","com.common.db.ClaimIO")>
												<cfset request.instance.init(trim(InstanceID))>
																								
												<tr id="showParameters">			
													<td colspan="2" class="SiteLabel" nowrap align="left">
														<table>
															<tr>
																<td class="SiteLabel"><span  style="cursor:hand;" onclick="insert('#trim(request.instance.getInterchangeClaimID())#');"><u>ClaimID</u></span>,</td>
																<td class="SiteLabel"><span style="cursor:hand;" onclick="insert('#DateFormat(trim(request.instance.getDateCreated()), 'mm/dd/yy')#');"><u>EOBDateCreated</u></span>,</td>
															</tr>
															<tr>
																<td class="SiteLabel" align="left" colspan="2"><span style="cursor:hand;" onclick="insert('#DateFormat(trim(request.instance.getDueDate()), 'mm/dd/yy')#');"><u>DueDate</u></span></td>
															</tr>
														</table>
													</td>																
												</tr>
											
											</cfif>
											
										</cfif>
																								
										<!---Show Date--->
										<tr>			
											<td class="SiteRequiredLabel" nowrap align="right">
												<span style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, 'The day this reminder will show in your reminder box.');" onmouseout="hideTip(this);">Date:</span>
											</td>	
											<td class="SiteLabel">						
												<span id="span_showDate" title="Click to select a date" style="display: 'inline'; position:relative; cursor:hand; color:990000;" onClick="openCalender('#trim(formname)#', 'showDate');" class="siteLabel"><u>Choose&nbsp;Date</u></span>
												<input type="hidden" name="showDate">
											</td>			
										</tr>	
																				
										<input type="Hidden" name="parameter" value="">
															
										<tr>
											<td bgcolor="FFFFFF" width="20%" class="SiteRequiredLabel" valign="top">			   
									   			Note:								
											</td>
											<td>
												<textarea class="SiteTextArea" name="note" cols="40" rows="3" onclick="insertAtCursor(document.#trim(formName)#.note, document.#trim(formName)#.parameter.value);"><cfif IsDefined("editNote")>#trim(editNote)#</cfif></textarea>								
											</td>
										</tr>
												
										
										<!---Submit Button--->														
										<tr>
											<td align="center" colspan="2">			
												<cf_gcSubmitButton value="Save">&nbsp;&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Close" onclick="self.close();">							
											</td>
										</tr>
										
									</table>			
											
								</form>
							</cf_gcBorderedTable>
						</td>
					</tr>
				</table>	
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
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- If the action is edit and there is a reminderID then load for editing.         --->
			<!-------------------------------------------------------------------------------------->
				<cfif IsDefined("editShowDate") AND IsDate(editShowDate)>			
					
					<script language="JavaScript">						
						var dateChosen = #month(editShowDate)# + "/" + #day(editShowDate)# + "/" + #year(editShowDate)#;				
						document.#trim(formName)#.showDate.value = dateChosen;				
						span_showDate.innerText = formatDate(dateChosen, "NNN d, y");
						
						function TimeFormat(x) {return(x<0||x>9?"":"0")+x}			
			
						function formatDate(thisDate,format) {
							var date = new Date(thisDate);
							format=format+"";
							var MONTH_NAMES=new Array('January','February','March','April','May','June','July','August','September','October','November','December','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');
							var DAY_NAMES=new Array('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sun','Mon','Tue','Wed','Thu','Fri','Sat');
							var result="";
							var i_format=0;
							var c="";
							var token="";
							var y=date.getYear()+"";
							var M=date.getMonth()+1;
							var d=date.getDate();
							var E=date.getDay();
							var H=date.getHours();
							var m=date.getMinutes();
							var s=date.getSeconds();
							var yyyy,yy,MMM,MM,dd,hh,h,mm,ss,ampm,HH,H,KK,K,kk,k;
							// Convert real date parts into formatted versions
							var value=new Object();
							if (y.length < 4) {y=""+(y-0+1900);}
							value["y"]=""+y;
							value["yyyy"]=y;
							value["yy"]=y.substring(2,4);
							value["M"]=M;
							value["MM"]=TimeFormat(M);
							value["MMM"]=MONTH_NAMES[M-1];
							value["NNN"]=MONTH_NAMES[M+11];
							value["d"]=d;
							value["dd"]=TimeFormat(d);
							value["E"]=DAY_NAMES[E+7];
							value["EE"]=DAY_NAMES[E];
							value["H"]=H;
							value["HH"]=TimeFormat(H);
							if (H==0){value["h"]=12;}
							else if (H>12){value["h"]=H-12;}
							else {value["h"]=H;}
							value["hh"]=TimeFormat(value["h"]);
							if (H>11){value["K"]=H-12;} else {value["K"]=H;}
							value["k"]=H+1;
							value["KK"]=TimeFormat(value["K"]);
							value["kk"]=TimeFormat(value["k"]);
							if (H > 11) { value["a"]="PM"; }
							else { value["a"]="AM"; }
							value["m"]=m;
							value["mm"]=TimeFormat(m);
							value["s"]=s;
							value["ss"]=TimeFormat(s);
							while (i_format < format.length) {
								c=format.charAt(i_format);
								token="";
								while ((format.charAt(i_format)==c) && (i_format < format.length)) {
									token += format.charAt(i_format++);
									}
								if (value[token] != null) { result=result + value[token]; }
								else { result=result + token; }
								}
							return result;
							}									
					</script>		
					
				</cfif>	
		
		</cfoutput>
	
	
	<cfelse>
		
		<cftry>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Only tie the reminder to an object id the user decided to.                     --->
			<!-------------------------------------------------------------------------------------->			
			<cfif NOT IsDefined("form.tieToObject")>
				<cfset ObjectID = "">
				<cfset InstanceID = "">
			</cfif>
			
			<cfif IsDefined("form.action") AND form.action EQ "edit" AND IsDefined("form.reminderID") AND IsNumeric(reminderID)>
				
				<!-------------------------------------------------------------------------------------->
				<!--- Initialize the reminder object and commit it to the DB.                        --->
				<!-------------------------------------------------------------------------------------->			
				<cfset Reminder = CreateObject("component","com.common.Reminder")>
				<cfset Reminder.init(trim(form.reminderID))>
				
				<cfif IsDefined("form.tieToObject")>
					<cfset Reminder.setObjectID(trim(ObjectID))>
					<cfset Reminder.setInstanceID(trim(InstanceID))>
				<cfelse>
					<cfset Reminder.setObjectID('NULL')>
					<cfset Reminder.setInstanceID('NULL')>
				</cfif>
					
				<cfset Reminder.setShowDate('#trim(showDate)#')>
				<cfset Reminder.setNote('#trim(Note)#')>	
				<cfset Reminder.commit()>
			
			<cfelse>
			
				<!-------------------------------------------------------------------------------------->
				<!--- Create the reminder object and commit it to the DB.                            --->
				<!-------------------------------------------------------------------------------------->			
				<cfset Reminder = CreateObject("component","com.common.Reminder")>
				<cfset Reminder.new(UsersID: trim(UsersID), ObjectID: '#trim(ObjectID)#', InstanceID: '#trim(InstanceID)#', ShowDate: '#trim(showDate)#', Note: '#trim(Note)#')>	
				<cfset Reminder.commit()>
				
			</cfif>
			
			
			<cfoutput>
				<br>
				<div align="left">
					<table border="0" width="320" cellpadding="0" cellspacing="10">
						<tr>
							<td>
								<cf_gcBorderedTable	title="Reminder" tableWidth="100%">	
									<p><font size="2" color="000000"><strong>Your changes have been saved.<br>This window will now close.</strong></font></p>
								</cf_gcBorderedTable>
							</td>
						</tr>
					</table>	
				</div>
			
			</cfoutput>
			
			<cfoutput>
				
				<!---<cfif IsDefined("form.action") AND form.action EQ "edit" AND IsDefined("form.reminderID") AND IsNumeric(reminderID)>--->
					<script language="JavaScript">
						//window.opener.location.reload();						
						var tempOpener = 'window.opener';		
						if (typeof(eval(tempOpener)) != "undefined"){								
							window.opener.location.href = window.opener.location.href;
						};	
					</script>	
				<!---</cfif>--->
								
				<script language="JavaScript">
					<!--					
					self.setTimeout('winClose()', 1500) 					
					function winClose(){
						self.close();
					};							
					// -->
				</script>
				
			</cfoutput>
			
					
			
			<cfcatch type="Any">
				
				<cfoutput>			
					<p>Caught an exception, type = #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>
				<cfabort>
				
			</cfcatch> 
			
		</cftry>	
						
	</cfif>		
	


	
	
	
	
	
	
<!---<cfoutput>
	
	<div align="left">
	
		<cfset Reminder = CreateObject("component","com.common.Reminder")>
		<!---<cfset Reminder.setUsersID(65)>
		<cfset Reminder.setNote("This is the note.")>	
		<cfset Reminder.commit()>--->
		
		<cfset Reminder.Init(104)>
		
		<cfoutput>
			<div align="left">
				[#Reminder.getReminderID()#]<br>
				[#Reminder.getUsersID()#]<br>
				[#isDate(Reminder.getShowDate())#]<br>
				[#Reminder.getNote()#]
			</div>
		</cfoutput>
				
		[#Reminder.getReminderID()#]<br>[#Reminder.getUsersID()#]<br>[#Reminder.getNote()#]
			
	</div>
	
</cfoutput>--->
		--->