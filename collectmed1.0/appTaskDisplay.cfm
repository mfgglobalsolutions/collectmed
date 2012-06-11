<!---- appTaskDisplay.cfm ---->


	
<!-------------------------------------------------------------------------------------->
<!--- Javascript needed for this page.                                               --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<script language="JavaScript">		
						
			function createTask(){
				assign=window.open('appTaskCreate.cfm','create','top=150,left=150,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=640,height=350');
			};				
					
			function createdTasks(){
				assign=window.open('appTaskCreated.cfm','created','top=150,left=150,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=850,height=425');
			};				
						
			function resetForm(textObject) {   
				
				document.TaskSearch.reset();
				
				span_showDate.innerText = 'Choose Date';
				span_showDate.style.display = 'none';
				
				span_showDateBetween.innerText = 'Choose Date';
				span_showDateBetweenShow.style.display = 'none';
										
			};
			
			function submitTaskDismiss(id){				
				var dismissTask = confirm("Are you sure you want to dismiss this task?");
			
				if(dismissTask){	
					document.TaskDismiss.dismissTaskID.value = id; 
					TaskDismiss.submit();
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
					TaskSearch.showDate.value = '';
					TaskSearch.showDateBetween.value = '';
					
				}
				else{
					span_showDate.style.display = '';
					TaskSearch.showDateBetween.value = '';
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
<!--- Create a task object to call the individually.                                 --->
<!-------------------------------------------------------------------------------------->
	<cfset request.Task = application.beanFactory.getBean('Task') />	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Query to get the tasks.                                                        --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getTasks" datasource="#trim(request.datasource)#">
		SELECT f.TaskID, f.ObjectID, f.InstanceID, f.priority, f.Note, f.dueDate, f.Active, f.DateCreated, f.statusID
		FROM task f
		WHERE f.AssignedtoUserID = #trim(session.User.GetUsersID())# 
		AND StatusID NOT IN(174,175)<!---Do not get Archived or Closed.--->
		ORDER BY f.PRIORITY, f.dueDate									
	</cfquery>
	
	

<!-------------------------------------------------------------------------------------->
<!--- Set the task tab verbage.                                                      --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		<script language="JavaScript">
			var taskElement = document.getElementById("tabTaskVerbage");
			if (taskElement != null){
				document.getElementById("tabTaskVerbage").innerHTML = 'Tasks (#trim(getTasks.RecordCount)#)';		
			};	
		</script>
	</cfoutput>	
		
	
		
<!-------------------------------------------------------------------------------------->
<!--- Code Needed to run the Next N records view of claims query.                    --->
<!-------------------------------------------------------------------------------------->
	<cfparam name="startRow_Task" default="1" type="numeric">	
	<cfif IsDefined("form.startRow_Task") AND form.startRow_Task NEQ "">
		<cfset startRow_Task = form.startRow_Task>
	<cfelseif IsDefined("url.startRow_Task") AND url.startRow_Task NEQ "">
		<cfset startRow_Task = url.startRow_Task>	
	</cfif>
	
	<cfparam name="showAll" type="boolean" default="No">
	<cfif IsDefined("form.showAll") AND form.showAll NEQ "">
		<cfset showAll = form.showAll>
	<cfelseif IsDefined("url.showAll") AND url.showAll NEQ "">
		<cfset showAll = url.showAll>	
	</cfif>			
	
	<cfif IsDefined("form.rowsPerPage_Task") AND form.rowsPerPage_Task NEQ "">
		<cfset session.rowsPerPage_Task = form.rowsPerPage_Task>
	<cfelseif IsDefined("url.rowsPerPage_Task") AND url.rowsPerPage_Task NEQ "">
		<cfset session.rowsPerPage_Task = url.rowsPerPage_Task>	
	<cfelseif IsDefined("session.rowsPerPage_Task") AND IsNumeric(session.rowsPerPage_Task)>
		<cfset session.rowsPerPage_Task = session.rowsPerPage_Task>	
	<cfelse>
		<cfset session.rowsPerPage_Task = 10>
	</cfif>
				
	<cfset totalRows = getTasks.recordCount>
	<cfif showAll>
		<cfset rowsPerPage = totalRows>
	</cfif>
	<cfset endRow_Task = min(startRow_Task + session.rowsPerPage_Task - 1, totalRows)>
	<cfset startRowNext = endRow_Task + 1>
	<cfset startRowBack = startRow_Task - session.rowsPerPage_Task>
		
	
			
			
<!-------------------------------------------------------------------------------------->
<!--- Show the tasks.                                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<cftry>	
					
			<cfif getTasks.RecordCount LTE 0>
				<cfset title = "No&nbsp;Tasks&nbsp;Found">			
			<cfelseif getTasks.RecordCount GTE 2>
				<cfset title = getTasks.recordcount & "&nbsp;Tasks&nbsp;Found">
			<cfelse>
				<cfset title = getTasks.recordcount & "&nbsp;Task&nbsp;Found">
			</cfif> 
							
			<!---<cf_gcBorderedTable title="#title#" tableWidth="100%" tablealign="left" titleRight="<span  class=siteLabel style=""cursor: hand;"" onclick=""createTask();""><u>Create&nbsp;Task</u></span>&nbsp;&nbsp;&nbsp;<span class=siteLabel onclick=""createdTasks();""><u>View&nbsp;Tasks&nbsp;Created</u></span>">	--->
			<table border="0" cellspacing="1" cellpadding="2">
				<tr>
					<td valign="bottom">
						<font color="003399" face="arial" size="2"><strong>#trim(title)#</strong></font>								
					</td>
					<td align="right" valign="middle">
						&nbsp;&nbsp;&nbsp;&nbsp;<span style="cursor:hand;"><span class=siteLabel style="cursor: hand;" onclick="createTask();"><u>Create</u></span>&nbsp;<span class=siteLabel>|</span>&nbsp;<span class=siteLabel onclick="createdTasks();"><u>View&nbsp;Created</u></span></span>
					</td>
				</tr>					
				
				<cfif getTasks.Recordcount GTE 1>
					
					<tr><td colspan="2">
					
					<cf_gcNextNRecords type="Task">
						
						<cf_gcTableScrollFixedHeader headers="Due,Assig.&nbsp;By,Note" mainwidth="420">
																				
							<cfloop query="getTasks" startRow="#trim(startRow_Task)#" endRow="#trim(endRow_Task)#">							
								
								<cfif Priority EQ 1>
									<cfset classRow = "bgcolor=ff6666">
								<cfelseif Priority EQ 2>
									<cfset classRow = "bgcolor=FFFF66">
								<cfelseif Priority EQ 3>
									<cfset classRow = "bgcolor=CCFFCC">
								<cfelse>
									<cfset classRow = "bgcolor=FFFFFF">									
								</cfif>								
								
								<cfset noteXML = XMLParse(trim(Note))>	
								<cfset thisNoteXML = noteXML.task.entry[1].EntryTask.xmlText>									
								
								<!-------------------------------------------------------------------------------------->
								<!--- Find out if this user has viewed this task if not add the record that they     --->
								<!--- have opened it.                                                                --->
								<!-------------------------------------------------------------------------------------->															
								<cfif request.Task.taskHasBeenViewed(usersID: trim(session.User.getUsersID()), taskID: trim(taskID)) LTE 0>
									<cfset boldThis = 1>
								<cfelse>
									<cfset boldThis = 0>	
								</cfif>
												
								<tr #classRow# onclick="task=window.open('appTaskEdit.cfm?action=edit&taskID=#trim(taskID)#', 'task', 'top=150,left=150,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=640,height=460'); task.focus(0);" style="cursor: hand;">			
									<!---<td class="SiteLabel" nowrap><cfif boldThis><strong></cfif>#trim(TaskID)#<cfif boldThis></strong></cfif></td>--->
									<td class="SiteLabel" nowrap align="center"><cfif boldThis><strong></cfif>#DateFormat(trim(dueDate), "m/d")#<cfif boldThis></strong></cfif></td>
									<cfset assignorName = request.task.getAssignedBy(trim(taskID))>
									<td class="SiteLabel" title="#assignorName.assignorFName# #trim(assignorName.assignorLName)#" nowrap><cfif boldThis><strong></cfif>#LEFT(trim(assignorName.assignorFName), 1)#. #trim(assignorName.assignorLName)#<cfif boldThis></strong></cfif></td>
									<cfset thisNote = Replace(thisNoteXML, "'", "\'", "ALL")>
									<cfset thisNote = Replace(thisNote, CHR(10), "", "ALL")>	
									<cfset thisNote = Replace(thisNote, CHR(13), "", "ALL")>
									<td class="SiteLabel" align="left" nowrap><span class="SiteLabel" style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, '<strong>Task ID: #trim(TaskID)#</strong> -  #REQUEST.stripHTML(trim(thisNote))#');" onmouseout="hideTip(this);"><cfif boldThis><strong></cfif>#REQUEST.fullLeft(REQUEST.stripHTML(thisNoteXML), 37)#<cfif boldThis></strong></cfif></span></td>									
								</tr>
												
								<tr>
								    <td bgcolor="000000" colspan="5" style="height: 1px; border: 0px solid FF0000; padding: 0px 0px 0px 0px;"></td>
								</tr>							
								
							</cfloop>
					
						</cf_gcTableScrollFixedHeader>	
						
						<table cellspacing="0" cellpadding="0" border="0">														
							<tr>
							    <td bgcolor="FFFFFF" colspan="11" style="height: 4px; border: 0px solid FFFFFF; padding: 0px 0px 0px 0px;"></td>
							</tr>	
							<tr>	   
								<td class="sitelabel" bgcolor="FF0000" style="display: block; border: 1px solid; border-color: 000000 000000 000000 000000; padding: 0px;"><font color="FF0000">m</font></td>
								<td class="sitelabel">&nbsp;Urgent</td>
								<td class="sitelabel">&nbsp;&nbsp;&nbsp;</td>	   				
								<td class="sitelabel" bgcolor="FFFF66" style="display: block; border: 1px solid; border-color: 000000 000000 000000 000000; padding: 0px;"><font color="FFFF66">m</font></td>
								<td class="sitelabel">&nbsp;High</td>   	
								<td class="sitelabel">&nbsp;&nbsp;&nbsp;</td>	   				
								<td class="sitelabel" bgcolor="CCFFCC" style="display: block; border: 1px solid; border-color: 000000 000000 000000 000000; padding: 0px;"><font color="CCFFCC">m</font></td>
								<td class="sitelabel">&nbsp;Medium</td>   	
								<td class="sitelabel">&nbsp;&nbsp;&nbsp;</td>	   				
								<td class="sitelabel" bgcolor="FFFFFF" style="display: block; border: 1px solid; border-color: 000000 000000 000000 000000; padding: 0px;"><font color="FFFFFF">m</font></td>
								<td class="sitelabel">&nbsp;Low</td>   	    
							</tr>
						</table>																		
									
					</cf_gcNextNrecords>
					
					</td></tr>
					
				<cfelse>
					
					<tr><td colspan="2">
					
						<table cellpadding="5" cellspacing="0" border="0">				
							<tr>
								<td class="SiteLabel" valign="top">
									No tasks assigned to your account currently.
								</td>															
							</tr>
						</table>
						
					</td></tr>	
						
				</cfif>					
							
			<!---</cf_gcBorderedTable>--->									
			</table>
			
						
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
		
		
