<!---- appTaskCreate.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.wholeNumbers" default="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50">
 	<cfset wholeNumbers = attributes.wholeNumbers>
 
	<cfparam name="attributes.numberOfItemsPerRow" default="4">
 	<cfset numberOfItemsPerRow = attributes.numberOfItemsPerRow>
	
	<cfparam name="attributes.formname" default="createTaskForm">
	<cfset formname = attributes.formname>
		
	<cfparam name="attributes.AssignedToUserID" default="">
	<cfset AssignedToUserID = attributes.AssignedToUserID>
	
	<cfif IsDefined("form.AssignedToUserID") AND form.AssignedToUserID NEQ "">
		<cfset AssignedToUserID = form.AssignedToUserID>
	<cfelseif IsDefined("url.AssignedToUserID") AND url.AssignedToUserID NEQ "">
		<cfset AssignedToUserID = url.AssignedToUserID>	
	</cfif>	
	
	<cfparam name="attributes.note" default="">
	<cfset note = attributes.note>
	
	<cfif IsDefined("form.note") AND form.note NEQ "">
		<cfset note = form.note>
	<cfelseif IsDefined("url.note") AND url.note NEQ "">
		<cfset note = url.note>	
	</cfif>
	
	<cfparam name="attributes.ObjectID" default="">
	<cfset ObjectID = attributes.ObjectID>
	
	<cfif IsDefined("form.ObjectID") AND form.ObjectID NEQ "">
		<cfset ObjectID = form.ObjectID>
	<cfelseif IsDefined("url.ObjectID") AND url.ObjectID NEQ "">
		<cfset ObjectID = url.ObjectID>	
	</cfif>
	
	<cfparam name="attributes.InstanceID" default=""><!---8418 7703--->
	<cfset InstanceID = attributes.InstanceID>
	
	<cfif IsDefined("form.InstanceID") AND form.InstanceID NEQ "">
		<cfset InstanceID = form.InstanceID>
	<cfelseif IsDefined("url.InstanceID") AND url.InstanceID NEQ "">
		<cfset InstanceID = url.InstanceID>	
	</cfif>
	
	<cfparam name="attributes.submitbuttonID" default="0">
	<cfset submitbuttonID = attributes.submitbuttonID>
	
		

<!-------------------------------------------------------------------------------------->
<!--- Make sure that the userID is sent in.                                          --->
<!-------------------------------------------------------------------------------------->	
	<cfif isDefined("form.submitted")>
				
		<cf_gcVerifyFields
			fields="AssignedToUserID"
			fieldnames="Assign to User ID"
			datatypes="numeric">		
	
	</cfif>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Javascripts for this page.                                                     --->
<!-------------------------------------------------------------------------------------->	
	<cfif NOT IsDefined("form.submitted")>
		<cfoutput>
			<script language="JavaScript">
				
				function validateForm(){	
				
					beforeSubmit();
						
					var msg  = "";					
					
					if(document.#formName#.AssignedToUserID.value == ""){
						msg = msg + "Please choose an individual to assign task to";		
					};
					
					if(document.#formName#.dueDate.value == ""){
						msg = msg + "\n\n Please choose a due date for this task.";		
					};
					
					if(document.#formName#.note.value == "" || document.#formName#.note.value.length <= 2){
						msg = msg + "\n\n Please enter a task note (minimum 5 characters).";		
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
				
				function AddNoteText(pasteText){
					var sText = window.frames['DHTMLEditor1'].document.selection.createRange();
					sText.pasteHTML(pasteText);
				}
								
			</script>
		</cfoutput>
	</cfif>
	
		
		
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	<cfif NOT IsDefined("form.Submitted")>

	
		<!-------------------------------------------------------------------------------------->
		<!--- Get all the entitys that are from this client.                                 --->
		<!-------------------------------------------------------------------------------------->		
		<cfset getClientsEntities = session.Client.getClientsUsers(ClientID: session.ClientID, NotInUsersIDList: trim(session.User.getUsersID()))>

		

		<cfoutput>
			<div align="left">
			<table border="0" width="85%" cellpadding="0" cellspacing="10"><tr><td>
			<cf_gcBorderedTable	title="Create&nbsp;Task" tablealign="left" tableWidth="70%">	
				<form name="#trim(formName)#" method="post" onsubmit="return validateForm();">
					<input type="Hidden" name="Submitted" value="yes">					
					<table align="center" cellpadding="5" cellspacing="0" border="0">				
						<tr>					
							<td valign="top">			   
				   			
								<table cellspacing="4" cellpadding="3" border="0">
									
									<!---Tie--->
									<cfif IsNumeric(ObjectID) AND IsNumeric(InstanceID)>
										
										<cfif ObjectID EQ 5>
											<cfset request.instance = application.beanFactory.getBean("Claim") />
											<cfset request.instance.init(trim(InstanceID))>
											<cfset parametersList = "InterchangeClaimID,ClientAssignedClaimID,InterchangeID,EntityID,ClaimPreviousPaidAmount,ClaimPaidAmount,PatientResponsibilityAmount,AssignedToUserID,DueDate,FacilityCode,DateCreated,CrossoverEntityTypeQualifier2,CrossoverNameLastorOrganizationName3">
											<cfset parametersListDisplay = "ICN,Assigned&nbsp;Claim&nbsp;ID,Interchange&nbsp;ID,Entity&nbsp;ID,Previous&nbsp;Paid&nbsp;Amount,Paid&nbsp;Amount,Patient&nbsp;Resp&nbsp;Amount,Assigned&nbsp;To&nbsp;User&nbsp;ID,Due&nbsp;Date,Facility&nbsp;Code,Date&nbsp;Created,Crossover&nbsp;Entity&nbsp;Qualifier,Crossover&nbsp;Name">
											<cfset parameterListValues = "">
											<cfloop list="#trim(parametersList)#" index="i"> 												     																			
												<cfset thisParameter = "request.instance.get" & i & "()">																	
												<cfif FindNoCase("Date", i)>
													<cfset thisParameter = "DateFormat(" & thisParameter & ", 'mm/dd/yy')">
												<cfelseif FindNoCase("Amount", i)>
													<cfset thisParameter = "NumberFormat(" & thisParameter & ", '___.__')">	
												</cfif>																																	
												<cfset thisParameterValue = evaluate(thisParameter)>																	
												<cfif FindNoCase("Phone", i) AND  IsNumeric(thisParameterValue)>
													<cfset thisParameterValue = REQUEST.formatPhoneUS(thisParameterValue)>
												</cfif>
												<cfif thisParameterValue EQ "">
													<cfset thisParameterValue = "NULL">
												</cfif>																	
												<cfset parameterListValues = ListAppend(parameterListValues, thisParameterValue)>
											</cfloop>						
										<cfelseif ObjectID EQ 3>
											<cfset request.instance = application.beanFactory.getBean("Patient")>
											<cfset request.instance.init(trim(InstanceID))>
											<cfset parametersList = "PatientID,DateCreated">
											<cfset parametersListDisplay = "Patient&nbsp;ID,Date&nbsp;Created">
											<cfset parameterListValues = "">
											<cfloop list="#trim(parametersList)#" index="i"> 												     																			
												<cfset thisParameter = "request.instance.get" & i & "()">																	
												<cfif FindNoCase("Date", i)>
													<cfset thisParameter = "DateFormat(" & thisParameter & ", 'mm/dd/yy')">
												<cfelseif FindNoCase("Amount", i)>
													<cfset thisParameter = "NumberFormat(" & thisParameter & ", '___.__')">	
												</cfif>																																	
												<cfset thisParameterValue = evaluate(thisParameter)>																	
												<cfif FindNoCase("Phone", i) AND  IsNumeric(thisParameterValue)>
													<cfset thisParameterValue = REQUEST.formatPhoneUS(thisParameterValue)>
												</cfif>
												<cfif thisParameterValue EQ "">
													<cfset thisParameterValue = "NULL">
												</cfif>																	
												<cfset parameterListValues = ListAppend(parameterListValues, thisParameterValue)>
											</cfloop>
										<cfelseif ObjectID EQ 6>
											<cfset request.instance = application.beanFactory.getBean("Procedure")>
											<cfset request.instance.init(trim(InstanceID))>
											<cfset parametersList = "ProcedureID,ProcedureCode,PriorProcedureCode,ServiceDateFrom,ServiceDateTo,BilledQuantity,BilledAmount,PaidQuantity,PaidAmount">
											<cfset parametersListDisplay = "Procedure&nbsp;ID,Procedure&nbsp;Code,Prior&nbsp;Procedure&nbsp;Code,Service&nbsp;Date&nbsp;From,Service&nbsp;Date&nbsp;To,Billed&nbsp;Quantity,Billed&nbsp;Amount,Paid&nbsp;Quantity,Paid&nbsp;Amount">
											<cfset parameterListValues = "">
											<cfloop list="#trim(parametersList)#" index="i"> 												     																			
												<cfset thisParameter = "request.instance.get" & i & "()">																	
												<cfif FindNoCase("Date", i)>
													<cfset thisParameter = "DateFormat(" & thisParameter & ", 'mm/dd/yy')">
												<cfelseif FindNoCase("Amount", i)>
													<cfset thisParameter = "NumberFormat(" & thisParameter & ", '___.__')">	
												</cfif>																																	
												<cfset thisParameterValue = evaluate(thisParameter)>																	
												<cfif FindNoCase("Phone", i) AND  IsNumeric(thisParameterValue)>
													<cfset thisParameterValue = REQUEST.formatPhoneUS(thisParameterValue)>
												</cfif>
												<cfif thisParameterValue EQ "">
													<cfset thisParameterValue = "NULL">
												</cfif>																	
												<cfset parameterListValues = ListAppend(parameterListValues, thisParameterValue)>
											</cfloop>
										<cfelseif ObjectID EQ 8>
											<cfset request.instance = application.beanFactory.getBean("Intake")>
											<cfset request.instance.initIntakeIO(trim(InstanceID))>
											<cfset parametersList = "IntakeID,alternateContactFNameTBox,alternateContactLNameTBox,alternateContactPhoneTBox,orderingPhysicianFNameTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,DateCreated"><!---patientFNameTBox,patientLNameTBox,patientCityTBox,patientPhoneTBox,patientSSNTBox,primaryInsuranceNameTBox,primaryPolicyNumberTBox,primaryPhoneNumberTBox,--->
											<cfset parametersListDisplay = "Intake ID,Alternate First Name,Alternate Last Name,Alternate Phone,Physician First Name,Physician Last Name,Physician Phone,Date Created"><!---Patient First Name,Patient Last Name,Patient City,Patient Phone,Patient SSN,Primary Ins Name,Primary Policy ##,Primary Phone,--->
											<cfset parameterListValues = "">
											<cfloop list="#trim(parametersList)#" index="i"> 												     																			
												<cfset thisParameter = "request.instance.get" & i & "()">																	
												<cfif FindNoCase("Date", i)>
													<cfset thisParameter = "DateFormat(" & thisParameter & ", 'mm/dd/yy')">
												<cfelseif FindNoCase("Amount", i)>
													<cfset thisParameter = "NumberFormat(" & thisParameter & ", '___.__')">	
												</cfif>																																	
												<cfset thisParameterValue = evaluate(thisParameter)>																	
												<cfif FindNoCase("Phone", i) AND  IsNumeric(thisParameterValue)>
													<cfset thisParameterValue = REQUEST.formatPhoneUS(thisParameterValue)>
												</cfif>	
												<cfif thisParameterValue EQ "">
													<cfset thisParameterValue = "NULL">
												</cfif>																
												<cfset parameterListValues = ListAppend(parameterListValues, thisParameterValue)>
											</cfloop>
											
											<!-------------------------------------------------------------------------------------->
											<!--- if the patient is filled get the info.                                         --->
											<!-------------------------------------------------------------------------------------->
											<cfif IsNumeric(request.instance.getPatientID())>	
												<cfset request.Patient = application.beanFactory.getBean("Patient")>
												<cfset request.Patient.init(trim(request.instance.getPatientID()))>
												
												<cfset request.Entity = application.beanFactory.getBean("Entity")>
												<cfset request.Entity.init(trim(request.Patient.getEntityID()))>
												
												<cfset parametersList = parametersList & ",patientFNameTBox,patientLNameTBox,patientSSNTBox">
												<cfset parametersListDisplay = parametersListDisplay & ",Patient First Name,Patient Last Name,Patient SSN">
												<cfset parameterListValues = parameterListValues & ",#request.Entity.getFName()#,#request.Entity.getLName()#,#request.Entity.getSSN()#">
											</cfif>
																							
										<cfelseif ObjectID EQ 9>
											<cfset request.instance = application.beanFactory.getBean("Quote")>
											<cfset request.instance.init(trim(InstanceID))>
											<cfset parametersList = "">
											<cfset parametersListDisplay = "">
											<cfset parameterListValues = "">
											<cfloop list="#trim(parametersList)#" index="i"> 												     																			
												<cfset thisParameter = "request.instance.get" & i & "()">																	
												<cfif FindNoCase("Date", i)>
													<cfset thisParameter = "DateFormat(" & thisParameter & ", 'mm/dd/yy')">
												<cfelseif FindNoCase("Amount", i)>
													<cfset thisParameter = "NumberFormat(" & thisParameter & ", '___.__')">	
												</cfif>																																	
												<cfset thisParameterValue = evaluate(thisParameter)>																	
												<cfif FindNoCase("Phone", i) AND  IsNumeric(thisParameterValue)>
													<cfset thisParameterValue = REQUEST.formatPhoneUS(thisParameterValue)>
												</cfif>	
												<cfif thisParameterValue EQ "">
													<cfset thisParameterValue = "NULL">
												</cfif>																
												<cfset parameterListValues = ListAppend(parameterListValues, thisParameterValue)>
											</cfloop>
										</cfif>	
										
										<cfif IsNumeric(ObjectID) AND IsNumeric(InstanceID)>												
												
												
																
											<cfset parametersList = Replace(parametersList, CHR(9), CHR(124), "ALL")>
											<cfset parametersList = Replace(parametersList, ",,", ",@@,", "ALL")>											
											<cfif Right(parametersList, 1) EQ CHR(44)>
												<cfset parametersList = parametersList & "@@">
											<cfelseif Right(parametersList, 1) EQ CHR(44)>
												<cfset parametersList = LEFT(parametersList, LEN(parametersList) - 1)>	
											</cfif>
											
											<cfset parametersListDisplay = Replace(parametersListDisplay, CHR(9), CHR(124), "ALL")>
											<cfset parametersListDisplay = Replace(parametersListDisplay, ",,", ",@@,", "ALL")>											
											<cfif Right(parametersListDisplay, 1) EQ CHR(44)>
												<cfset parametersListDisplay = parametersListDisplay & "@@">
											<cfelseif Right(parametersListDisplay, 1) EQ CHR(44)>
												<cfset parametersListDisplay = LEFT(parametersListDisplay, LEN(parametersListDisplay) - 1)>	
											</cfif>
											
											<cfset parameterListValues = Replace(parameterListValues, CHR(9), CHR(124), "ALL")>
											<cfset parameterListValues = Replace(parameterListValues, ",,", ",@@,", "ALL")>											
											<cfif Right(parameterListValues, 1) EQ CHR(44)>
												<cfset parameterListValues = parameterListValues & "@@">
											<cfelseif Right(parameterListValues, 1) EQ CHR(44)>
												<cfset parameterListValues = LEFT(parameterListValues, LEN(parameterListValues) - 1)>	
											</cfif>
											
											
																															
											<tr id="showParameters">
												<td colspan="2" class="SiteLabel">	
													<div style="border: 1px solid; border-color: c0c0c0 c0c0c0 c0c0c0 c0c0c0; padding: 4px;">
						
														<table border="0" cellpadding="3" cellspacing="0">
												   			<tr>
															
															<cfset count = 1>
												    		
															<cfif ListLen(parametersList) GTE 1>
																
																<cfloop list="#trim(parametersList)#" index="i"> 													     				
																																															
																	<!---<cfset thisParameter = "request.instance.get" & i & "()">
																	
																	<cfif FindNoCase("Date", i)>
																		<cfset thisParameter = "DateFormat(" & thisParameter & ", 'mm/dd/yy')">
																	<cfelseif FindNoCase("Amount", i)>
																		<cfset thisParameter = "NumberFormat(" & thisParameter & ", '___.__')">	
																	</cfif>
																																	
																	<cfset thisParameterValue = evaluate(thisParameter)>
																	
																	<cfif FindNoCase("Phone", i) AND  IsNumeric(thisParameterValue)>
																		<cfset thisParameterValue = REQUEST.formatPhoneUS(thisParameterValue)>
																	</cfif>
																	--->
																	<cfset thisParameterDisplay = ListGetAt(parametersListDisplay, count)>																	
																	<cfset thisParameterValue = ListGetAt(parameterListValues, count)>
																	
																	<cfif i EQ "InterchangeClaimID">
																		<cfset thisParameterValue = "<span onclick=&quot;editClaim=window.open(\'appClaimEditMedicare.cfm?claimid=#trim(request.instance.getClaimID())#\',\'editClaim\',\'top=80,left=100,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=900,height=480\');&quot; style=&quot;cursor: hand;&quot;><u>#trim(thisParameterValue)#</u></span>">
																	</cfif>
																	
																	<cfif thisParameterValue NEQ "" AND thisParameterValue NEQ "NULL" AND thisParameterValue NEQ "@@">
																		<td class="SiteLabel" <cfif NOT ListFind(wholeNumbers,evaluate(count / numberOfItemsPerRow))>style="1px solid; border-right: 1px solid; border-color: c0c0c0;"</cfif>><u><span unselectable="on" style="cursor:hand;" onclick="AddNoteText('#trim(thisParameterValue)#');">#trim(thisParameterDisplay)#</span></u></td>
																	<cfelse>
																		<td class="SiteLabel" <cfif NOT ListFind(wholeNumbers,evaluate(count / numberOfItemsPerRow))>style="1px solid; border-right: 1px solid; border-color: c0c0c0;"</cfif>><span class="CopyGrey">#trim(thisParameterDisplay)#</span></td>
																	</cfif>
														     		
																	<cfif ListFind(wholeNumbers,evaluate(count / numberOfItemsPerRow))>
														      			</tr>     
														     		</cfif>
																	
																	<cfset count = count + 1>   
																	 																	 																	      
														    	</cfloop> 
																 
															</cfif>
															
														</table>	
													</div>														
												</td>
											</tr>
																																	
										</cfif>																	
										
									</cfif>
									
									
									<table>
										<tr>
											<td colspan="2" align="left">			
										
												<table border="0" cellpadding="3">									
													<!---Show Date--->
													<tr>			
														<td class="SiteRequiredLabel" nowrap align="right">
															Due&nbsp;Date:
														</td>	
														<td class="SiteLabel">						
															<span id="span_dueDate" title="Click to select a date" style="cursor:hand; color:990000;" onClick="openCalender('#trim(formname)#', 'dueDate');" class="siteLabel"><u>Choose&nbsp;Date</u></span>
															<input type="hidden" name="dueDate">
														</td>			
													</tr>	
																																	
													<!--- Assign To --->
													<tr>			
														<td class="SiteRequiredLabel" nowrap align="right">
															Assign to:
														</td>	
														<td class="SiteLabel">						
															<select class="SiteSelectBox" name="AssignedToUserID">
																<option value="">
																<cfloop query="getClientsEntities">
																	<option value="#trim(UsersID)#">#trim(Fullname)# 
																</cfloop>			
															</select>
														</td>			
													</tr>	
													
													<!--- Priority --->
													<tr>			
														<td class="SiteRequiredLabel" nowrap>
															Priority:
														</td>	
														<td class="SiteLabel">						
															<input type="Radio" name="priority" value="1">Urgent&nbsp;&nbsp;<input type="Radio" name="priority" value="2">High&nbsp;&nbsp;<input type="Radio" name="priority" value="3">Medium&nbsp;&nbsp;<input type="Radio" name="priority" value="4" checked>Low&nbsp;
														</td>			
													</tr>
													
												</table>								
									
											</td>
										</tr>
									</table>
										
									<!--- Note --->
									<cfset verbage = "">
									<input type="Hidden" name="parameter" value="">
									<cfif IsNumeric(ObjectID) AND IsNumeric(InstanceID)>	
										<cfif ObjectID EQ 5>
											<cfset verbage = "ICN: <span onclick=editClaim=window.open(\'appClaimEditMedicare.cfm?claimid=#trim(request.instance.getClaimID())#\',\'editClaim\',\'top=80,left=100,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=900,height=480\');><span style='cursor:hand';><u>#request.Instance.getInterchangeClaimID()#</u></span></span>">
										<cfelseif ObjectID EQ 3>
											<cfset verbage = "Patient ID: #trim(InstanceID)#">
										<cfelseif ObjectID EQ 6>
											<cfset verbage = "Procedure ID: #trim(InstanceID)#">
										<cfelseif ObjectID EQ 8>
											<cfset verbage = "Intake ID: #trim(InstanceID)#">
										<cfelseif ObjectID EQ 9>
											<cfset verbage = "Quote ID: #trim(InstanceID)#">
										</cfif>										
									</cfif>																					
										
									<tr>
										<td colspan="2">														
											<cf_gcHTMLNoteEditor form_name="#trim(formname)#" field_name="note" verbage="#verbage#">								
										</td>									  
									</tr>
															
									<tr>
									    <td colspan="2" align="center"><cf_gcSubmitButton value="Create&nbsp;Task">&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Close" name="closeTD" onclick="window.close();"></td>							   
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
		
		<cfset request.Task = application.beanFactory.getBean("Task") />
		<cfset request.Task.setClientID(trim(session.clientID))>
		<cfset request.Task.setCreatorID(trim(session.user.getUsersID()))>
		
		<cfif IsDefined("form.tieToObject")>
			<cfset request.Task.setObjectID(trim(ObjectID))>
			<cfset request.Task.setInstanceID(trim(InstanceID))>
		</cfif>
			
		<cfset request.Task.setPriority(trim(form.Priority))>
		<cfset request.Task.setDueDate(trim(form.dueDate))>			
		<cfset taskID = request.Task.commit()>		
		
		<cfset request.Task.assignTask(clientID: trim(session.clientID), assignorID: trim(session.user.getUsersID()), usersID: trim(form.AssignedToUserID), taskID: taskID)>
		<cfset request.Task.addTaskEntry(taskID: taskID, userID: trim(session.user.getUsersID()), userFName: trim(session.user.getFName()), userLName: trim(session.user.getLName()), taskEntry: trim(form.Note))>
		<cfset request.Task.updateTaskStatus(taskID, 168, trim(session.user.getUsersID()), 'INITAL TASK CREATION')>
				
		
		<cfoutput>
			<br>
			<div align="left">
				<table border="0" width="75%" cellpadding="0" cellspacing="10">
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
			
			<cfif IsDefined("form.action") AND form.action EQ "edit" AND IsDefined("form.reminderID") AND IsNumeric(reminderID)>
				<script language="JavaScript">
					//window.opener.location.reload();
					window.opener.location.href = window.opener.location.href;
				</script>	
			</cfif>
			
			
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
	
	