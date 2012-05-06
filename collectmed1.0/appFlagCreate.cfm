<!---- appFlagCreate.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.wholeNumbers" default="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50">
 	<cfset wholeNumbers = attributes.wholeNumbers>
 
	<cfparam name="attributes.numberOfItemsPerRow" default="4">
 	<cfset numberOfItemsPerRow = attributes.numberOfItemsPerRow>
	
	<cfparam name="attributes.formname" default="createFlagForm">
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
						msg = msg + "Please choose an individual to assign flag to";		
					};
					
					if(document.#formName#.dueDate.value == ""){
						msg = msg + "\n\n Please choose a due date for this flag.";		
					};
					
					if(document.#formName#.note.value == "" || document.#formName#.note.value.length <= 2){
						msg = msg + "\n\n Please enter a flag note (minimum 5 characters).";		
					};
											
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
			<cf_gcBorderedTable	title="Create&nbsp;Flag" tablealign="left" tableWidth="100%">	
				<form name="#trim(formName)#" method="post" onsubmit="return validateForm();">
					<input type="Hidden" name="Submitted" value="yes">					
					<table align="left" cellpadding="5" cellspacing="0" border="0">				
						<tr>					
							<td valign="top">			   
				   			
								<table cellspacing="4" cellpadding="3" border="0">
									
									<!---Tie--->
									<cfif IsNumeric(ObjectID) AND IsNumeric(InstanceID)>
										
										<!---<cfset request.ObjectType = CreateObject("component","com.common.db.ObjectIO")>
										<cfset request.ObjectType.init(trim(ObjectID))>
										
										<tr>			
											<td colspan="2" class="SiteLabel" nowrap align="left">
												<input type="Checkbox" name="tieToObject" CHECKED>Tie flag to this #trim(request.ObjectType.getObjectName())#
											</td>															
										</tr>--->
										
										<cfif ObjectID EQ 5>
											<cfset request.instance = CreateObject("component","com.common.db.ClaimIO")>
											<cfset parametersList = "InterchangeClaimID,ClientAssignedClaimID,InterchangeID,EntityID,ClaimPreviousPaidAmount,ClaimPaidAmount,PatientResponsibilityAmount,AssignedToUserID,DueDate,FacilityCode,DateCreated,CrossoverEntityTypeQualifier2,CrossoverNameLastorOrganizationName3">
											<cfset parametersListDisplay = "Claim&nbsp;ID,Assigned&nbsp;Claim&nbsp;ID,Interchange&nbsp;ID,Entity&nbsp;ID,Previous&nbsp;Paid&nbsp;Amount,Paid&nbsp;Amount,Patient&nbsp;Resp&nbsp;Amount,Assigned&nbsp;To&nbsp;User&nbsp;ID,Due&nbsp;Date,Facility&nbsp;Code,Date&nbsp;Created,Crossover&nbsp;Entity&nbsp;Qualifier,Crossover&nbsp;Name">
										<cfelseif ObjectID EQ 3>
											<cfset request.instance = CreateObject("component","com.common.db.PatientIO")>
											<cfset parametersList = "PatientID,PatientType,InsuranceID,DateCreated">
											<cfset parametersListDisplay = "Patient&nbsp;ID,Patient&nbsp;Type,Insurance&nbsp;ID,Date&nbsp;Created">
										<cfelseif ObjectID EQ 6>
											<cfset request.instance = CreateObject("component","com.common.db.ProcedureIO")>
											<cfset parametersList = "ProcedureID,ProcedureCode,PriorProcedureCode,ServiceDateFrom,ServiceDateTo,BilledQuantity,BilledAmount,PaidQuantity,PaidAmount">
											<cfset parametersListDisplay = "Procedure&nbsp;ID,Procedure&nbsp;Code,Prior&nbsp;Procedure&nbsp;Code,Service&nbsp;Date&nbsp;From,Service&nbsp;Date&nbsp;To,Billed&nbsp;Quantity,Billed&nbsp;Amount,Paid&nbsp;Quantity,Paid&nbsp;Amount">
										</cfif>	
										
										<cfif IsNumeric(ObjectID) AND IsNumeric(InstanceID)>																				
																							
											<cfset request.instance.init(trim(InstanceID))>
											
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
																<cfelseif FindNoCase("Amount", i)>
																	<cfset thisParameter = "NumberFormat(" & thisParameter & ", '___.__')">	
																</cfif>
																
																<cfset thisParameterValue = evaluate(thisParameter)>
																<cfset thisParameterDisplay = ListGetAt(parametersListDisplay, count)>
																
																<cfif i EQ "InterchangeClaimID">
																	<cfset thisParameterValue = "<span onclick=&quot;editClaim=window.open(\'appClaimEditMedicare.cfm?claimid=#trim(request.instance.getClaimID())#\',\'editClaim\',\'top=80,left=100,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=900,height=480\');&quot; style=&quot;cursor: hand;&quot;><u>#trim(thisParameterValue)#</u></span>">
																</cfif>
																
																<cfif thisParameterValue NEQ "" AND thisParameterValue NEQ "NULL">
																	<td class="SiteLabel"><u><span unselectable="on" style="cursor:hand;" onclick="AddNoteText('#trim(thisParameterValue)#');">#trim(thisParameterDisplay)#</span></u></td>
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
															<span id="span_dueDate" title="Click to select a date" style="display: 'inline'; position:relative; cursor:hand; color:990000;" onClick="openCalender('#trim(formname)#', 'dueDate');" class="siteLabel"><u>Choose&nbsp;Date</u></span>
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
									<input type="Hidden" name="parameter" value="">
									<tr>
										<td colspan="2">														
											<cf_gcHTMLNoteEditor form_name="#trim(formname)#" field_name="note" verbage="">								
										</td>									  
									</tr>
															
									<tr>
									    <td colspan="2" align="center"><input type="Submit" value="Create&nbsp;Flag" class="SiteSubmitBox">&nbsp;&nbsp;<input type="Button" class="SiteSubmitbox" value="Close" name="closeTD" onclick="window.close();"></td>							   
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
		
		<cfset request.Flag = CreateObject("component", "com.common.Flag")>
		<cfset request.Flag.setClientID(trim(session.clientID))>
		<cfset request.Flag.setCreatorID(trim(session.user.getUsersID()))>
		
		<cfif IsDefined("form.tieToObject")>
			<cfset request.Flag.setObjectID(trim(ObjectID))>
			<cfset request.Flag.setInstanceID(trim(InstanceID))>
		</cfif>
			
		<cfset request.Flag.setPriority(trim(form.Priority))>
		<cfset request.Flag.setDueDate(trim(form.dueDate))>			
		<cfset flagID = request.Flag.commit()>		
		
		<cfset request.Flag.assignFlag(clientID: trim(session.clientID), assignorID: trim(session.user.getUsersID()), usersID: trim(form.AssignedToUserID), flagID: flagID)>
		<cfset request.Flag.addFlagEntry(flagID: flagID, userID: trim(session.user.getUsersID()), userFName: trim(session.user.getFName()), userLName: trim(session.user.getLName()), flagEntry: trim(form.Note))>
		<cfset request.Flag.updateFlagStatus(flagID, 168, trim(session.user.getUsersID()), 'INITAL FLAG CREATION')>
				
		
		<cfoutput>
			<br>
			<div align="left">
				<table border="0" width="75%" cellpadding="0" cellspacing="10">
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
			
			<cfif IsDefined("form.action") AND form.action EQ "edit" AND IsDefined("form.reminderID") AND IsNumeric(reminderID)>
				<script language="JavaScript">
					window.opener.location.reload();
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
	
	