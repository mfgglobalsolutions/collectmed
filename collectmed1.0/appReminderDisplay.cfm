<!---- appReminderDisplay.cfm ---->


	
<!-------------------------------------------------------------------------------------->
<!--- Javascript needed for this page.                                               --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<script language="JavaScript">
		
			function resetForm(textObject) {   
				
				document.ReminderSearch.reset();
				
				span_showDate.innerText = 'Choose Date';
				span_showDate.style.display = 'none';
				
				span_showDateBetween.innerText = 'Choose Date';
				span_showDateBetweenShow.style.display = 'none';
										
			};
			
			function createReminder(){
				reminder=window.open('appReminder.cfm', 'reminder', 'top=150,left=150,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=480,height=215'); reminder.focus(0);
			};	
						
			function submitReminderDismiss(id){				
				var dismissReminder = confirm("Are you sure you want to dismiss this reminder?");
			
				if(dismissReminder){	
					document.ReminderDismiss.dismissReminderID.value = id; 
					ReminderDismiss.submit();
				};	
			};
			
			function showDateCreatedBetween(val){
				if(val == 'between'){
					span_showDate.style.display = '';
					span_showDateBetweenShow.style.display = '';
				}
				else if(val == ''){
					span_showDate.style.display = 'none';
					span_showDateBetweenShow.style.display = 'none';
					span_showDate.innerText = 'Choose Date';					
					ReminderSearch.showDate.value = '';
					ReminderSearch.showDateBetween.value = '';
					
				}
				else{
					span_showDate.style.display = '';
					ReminderSearch.showDateBetween.value = '';
					span_showDateBetweenShow.style.display = 'none';
					span_showDateBetween.innerText = 'Choose Date';
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
			
		</script>
		
	</cfoutput>
	
	
				
<!-------------------------------------------------------------------------------------->
<!--- If the url contains a dismiss remindderID then go ahead and process.           --->
<!-------------------------------------------------------------------------------------->	
	<cfif IsDefined("form.dismissReminderID") AND IsNumeric(form.dismissReminderID)>
		
		<cfquery name="getReminderUsersID" datasource="#trim(request.datasource)#">
			SELECT UsersID 
			FROM Reminder 
			WHERE ReminderID = #trim(form.dismissReminderID)#			 
		</cfquery>
		
		<cfif getReminderUsersID.RecordCount EQ 1 AND getReminderUsersID.UsersID EQ session.User.getUsersID()>
			
			<cfquery name="updateReminder" datasource="#trim(request.datasource)#">
				UPDATE Reminder
				SET Dismissed = 1 
				WHERE ReminderID = #trim(form.dismissReminderID)#			 
			</cfquery>
			
		</cfif>
	
	</cfif>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get all the users reminders.                                                   --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getReminders" datasource="#trim(request.datasource)#">
		SELECT ReminderID, UsersID, ObjectID, InstanceID, showDate,  LEFT(Note, 75) AS shortNote, Note, Active, DateCreated
		FROM Reminder  
		WHERE usersID = #trim(session.User.GetUsersID())# 
		
		<cfif NOT IsDefined("form.SubmittedReminder")>AND Dismissed = 0</cfif>
		
		<cfif isDefined("form.noteContains") AND form.noteContains NEQ "">
			AND Note LIKE '%#trim(form.noteContains)#%'
		</cfif> 
		
		
		<cfif IsDefined("form.showDate") AND IsDate(form.showDate) AND (NOT IsDefined("form.showDateBetween") OR NOT IsDate(form.showDateBetween))>
			AND  showDate <cfif form.showDateParameter EQ "GT"> > <cfelseif form.showDateParameter EQ "LT"> < </cfif> #CreateODBCDate(form.showDate)#				
		<cfelseif IsDefined("form.showDate") AND IsDate(form.showDate) AND IsDefined("form.showDateBetween") AND IsDate(form.showDateBetween)>
			AND  showDate > #CreateODBCDate(form.showDate)#
			AND  showDate < #CreateODBCDate(showDateBetween)#
		<cfelseif NOT IsDefined("form.SubmittedReminder")>
			AND showDate <= #CreateODBCDate(NOW())#	
		</cfif>				
		
		<cfif IsDefined("form.ReminderActive") AND form.ReminderActive NEQ "">
			AND Active = #trim(form.ReminderActive)#
		</cfif>
										
	</cfquery>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the reminder tab verbage.                                                  --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		<script language="JavaScript">
			var reminderElement = document.getElementById("tabReminerVerbage");
			if (reminderElement != null){
				document.getElementById("tabReminerVerbage").innerHTML = 'Reminders (#trim(getReminders.RecordCount)#)';		
			};	
		</script>
	</cfoutput>

	
	
<!-------------------------------------------------------------------------------------->
<!--- Code Needed to run the Next N records view of claims query.                    --->
<!-------------------------------------------------------------------------------------->
	<cfparam name="startRow_Reminder" default="1" type="numeric">	
	<cfif IsDefined("form.startRow_Reminder") AND form.startRow_Reminder NEQ "">
		<cfset startRow_Reminder = form.startRow_Reminder>
	<cfelseif IsDefined("url.startRow_Reminder") AND url.startRow_Reminder NEQ "">
		<cfset startRow_Reminder = url.startRow_Reminder>	
	</cfif>
	
	<cfparam name="showAll" type="boolean" default="No">
	<cfif IsDefined("form.showAll") AND form.showAll NEQ "">
		<cfset showAll = form.showAll>
	<cfelseif IsDefined("url.showAll") AND url.showAll NEQ "">
		<cfset showAll = url.showAll>	
	</cfif>			
	
	<cfparam name="session.rowsPerPage_Reminder" default="10">
	<cfif IsDefined("form.rowsPerPage_Reminder") AND form.rowsPerPage_Reminder NEQ "">
		<cfset session.rowsPerPage_Reminder = form.rowsPerPage_Reminder>
	<cfelseif IsDefined("url.rowsPerPage_Reminder") AND url.rowsPerPage_Reminder NEQ "">
		<cfset session.rowsPerPage_Reminder = url.rowsPerPage_Reminder>	
	<cfelseif IsDefined("session.rowsPerPage_Reminder") AND IsNumeric(session.rowsPerPage_Reminder)>
		<cfset session.rowsPerPage_Reminder = session.rowsPerPage_Reminder>	
	<cfelse>
		<cfset session.rowsPerPage_Reminder = 10>
	</cfif>
				
	<cfset totalRows = getReminders.recordCount>
	<cfif showAll>
		<cfset rowsPerPage = totalRows>
	</cfif>
	<cfset endRow_Reminder = min(startRow_Reminder + session.rowsPerPage_Reminder - 1, totalRows)>
	<cfset startRowNext = endRow_Reminder + 1>
	<cfset startRowBack = startRow_Reminder - session.rowsPerPage_Reminder>
		
		
				
<!-------------------------------------------------------------------------------------->
<!--- Show the reminders this has Current day and past if not dismissed.             --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<cftry>	
					
			<cfif getReminders.RecordCount LTE 0>
				<cfset title = "No&nbsp;Reminders&nbsp;Found">			
			<cfelseif getReminders.RecordCount GTE 2>
				<cfset title = getReminders.recordcount & "&nbsp;Reminders&nbsp;Found">
			<cfelse>
				<cfset title = getReminders.recordcount & "&nbsp;Reminder&nbsp;Found">
			</cfif> 
			
			<!---<cf_gcBorderedTable title="#title#" tableWidth="100%" tablealign="left" titleRight="<span class=siteLabel onclick=""if(showSearch.style.display=='none') {showSearch.style.display='block'} else {showSearch.style.display='none'};""><u>Search&nbsp;Reminders</u></span>&nbsp;<span class=siteLabel>|</span>&nbsp;<span class=siteLabel style=""cursor:hand"" onclick=""createReminder();""><u>Create&nbsp;Reminder</u></span>">	--->
			<table  border="0" cellspacing="1" cellpadding="1">				
				<tr>
					<td>
						<font color="003399" face="arial" size="2"><strong>#trim(title)#</strong></font>
					</td>
					<td align="right">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="cursor:hand;" class=siteLabel onclick="if(showSearch.style.display=='none') {showSearch.style.display='block'} else {showSearch.style.display='none'};"><u>Search</u></span>&nbsp;<span class=siteLabel>|</span>&nbsp;<span class=siteLabel style="cursor:hand" onclick="createReminder();"><u>Create</u></span>
					</td>
				</tr>		
				
				<tr><td colspan="2">
					
					<span id="showSearch" style="display:'none';">
						<form method="post" name="ReminderSearch">
							<input type="Hidden" name="SubmittedReminder" value="yes">
							<table border="0" cellpadding="0" cellspacing="5">					
								
								<!---Active--->
								<tr>			
									<td class="SiteLabel" nowrap align="right">
										Active: 
									</td>	
									<td>
										<select name="ReminderActive" class="SiteSelectBox">
											<option SELECTED value="1">Active						
											<option value="0">Inactive
											<option value="">Either Active or Inactive
										</select>
									</td>			
								</tr>
								
								<!---noteContains--->
								<tr>			
									<td class="SiteLabel" nowrap align="right">
										Note&nbsp;Contains: 
									</td>	
									<td><input type="Text" name="noteContains" value="" size="35" class="SiteTextBox"></td>			
								</tr>					
														
								<!---showDate--->
								<tr>							
									<td class="SiteLabel" nowrap align="right">
										Show Date: 
									</td>	
									<td>						
										<select name="showDateParameter" class="SiteSelectBox" onchange="showDateCreatedBetween(this.value);">
											<option value="" selected>
											<option value="LT">Before					
											<option value="GT">After
											<option value="between">Between
										</select>
										&nbsp;
										<span id="span_showDate" title="Click to select a date" style="display: 'none'; font:13px; position:relative; cursor:hand; color:990000;" onClick="openCalender('ReminderSearch', 'showDate');"><u>Choose&nbsp;Date</u></span>
										<span id="span_showDateBetweenShow" style="font:12px; display: 'none'">&nbsp;AND&nbsp;&nbsp;<span id="span_showDateBetween" title="Click to select a date" style="font:13px; position:relative; cursor:hand; color:990000;" onClick="openCalender('ReminderSearch', 'showDateBetween');"><u>Choose&nbsp;date</u></span></span>
										<input type="hidden" name="showDate">
										<input type="hidden" name="showDateBetween">
									</td>			
								</tr>						
																		
								<!---Submit Button--->
								<tr>
									<td colspan="2">&nbsp;</td>
								</tr>					
								<tr>
									<td align="center" colspan="2">			
										<cf_gcSubmitButton value="Search Reminders">&nbsp;&nbsp;&nbsp;<input type="button" onclick="resetForm(this);" value="Clear" class="SiteSubmitbox">							
									</td>
								</tr>					
							</table>			
						</form>				
					</span>
				
				</td></tr>	
			
				<cfif getReminders.Recordcount GTE 1>
						
					<tr><td colspan="2">	
						<cf_gcNextNRecords type="Reminder">
							
							<cf_gcTableScrollFixedHeader headers="Note,*" mainwidth="420">											
													
								<cfloop query="getReminders" startRow="#trim(startRow_Reminder)#" endRow="#trim(endRow_Reminder)#">							
																											
									<cfoutput>							
										<tr<cfif currentrow MOD 2 EQ 0> class="TblRow"</cfif>>			
											<!---<td class="SiteLabel" nowrap>#trim(ReminderID)#</td>--->						
											<!---<cfset thisNote = Replace(shortNote, "'", "\'", "ALL")>
											<cfset thisNote = ReplaceNoCase(trim(thisNote), "#CHR(13)##CHR(10)#", " ", "ALL")>--->
											<cfset thisNote = Replace(Note, "'", "\'", "ALL")>
											<cfset thisNote = Replace(thisNote, CHR(10), "", "ALL")>	
											<cfset thisNote = Replace(thisNote, CHR(13), "", "ALL")>	
											<td class="SiteLabel" align="left" nowrap><span class="SiteRequiredLabel" style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, '<strong>Reminder ID: #trim(ReminderID)#</strong> - #REQUEST.stripHTML(trim(thisNote))#');" onmouseout="hideTip(this);">#REQUEST.fullLeft(REQUEST.stripHTML(shortNote), 45)#</span></td>									
											<td class="SiteLabel" align="right" nowrap><span onclick="reminder=window.open('appReminder.cfm?action=view&reminderID=#trim(reminderID)#', 'reminder', 'top=150,left=150,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=415,height=295'); reminder.focus(0);" style="cursor: hand;"><u>view</u></span></td>
											<td class="SiteLabel" align="right" nowrap><span onclick="reminder=window.open('appReminder.cfm?action=edit&reminderID=#trim(reminderID)#', 'reminder', 'top=150,left=150,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=415,height=295'); reminder.focus(0);" style="cursor: hand;"><u>Edit</u></span></td>
											<td class="SiteLabel" align="right" nowrap><span style="cursor: hand;" onclick="submitReminderDismiss(#trim(ReminderID)#);"><u>Dismiss</u></span></td>
										</tr>
									</cfoutput>
									
								</cfloop>
								
							</cf_gcTableScrollFixedHeader>	
					
						</cf_gcNextNRecords>
					</td></tr>
					
				</cfif>		
				
					
				<cfif getReminders.Recordcount LTE 0>
					<tr><td colspan="2">
						<table cellpadding="5" cellspacing="0" border="0">				
							<tr>
								<td class="SiteLabel" valign="top">
									No reminders to show currently.
								</td>															
							</tr>
						</table>
					</td></tr>	
				</cfif>					
									
			<!---</cf_gcBorderedTable>--->
			</table>
				
			
			<!-------------------------------------------------------------------------------------->
			<!--- Form needed for dismissing.                                                    --->
			<!-------------------------------------------------------------------------------------->
			<span id="sp_ReminderDismiss" style="display:'none';">
				<cfoutput>
					<form name="ReminderDismiss" method="post">
						<input type="Hidden" name="dismissReminderID" value="">			
						<cf_gcEmbedFields except="dismissReminderID">
					</form>
				</cfoutput>	
			</span>
				 
			
			
			
			<!--- CFCATCH QUERY ERRORS--->			
			<cfcatch type="Any">
				
				<cfoutput>
					
					<p>Caught an exception, type = #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>	 		      
	
				</cfoutput>
				<cfexit>
				
			</cfcatch>
			
		</cftry>
		
	</cfoutput>
		
		