<!---- appTasksCreated.cfm ---->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	


<!-------------------------------------------------------------------------------------->
<!--- CFScript needed for this page.                                                 --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>	
		<cfscript>			
									
			function stripHTML(str) {		
				newStr = ReReplaceNoCase(str, "<[^>]*>", "", "ALL");
				return newStr;
			}
						
			/**
			 * An enhanced version of left() that doesn't cut words off in the middle.
			 * Minor edits by Rob Brooks-Bilson (rbils@amkor.com) and Raymond Camden (ray@camdenfamily.com)
			 * @author Marc Esher (jonnycattt@aol.com) 
			 * @version 2, April 16, 2002 
			 */
			function fullLeft(str, count) {
				if (not refind("[[:space:]]", str) or (count gte len(str)))
					return Left(str, count);
				else if(reFind("[[:space:]]",mid(str,count+1,1))) {
				  	return left(str,count);
				} else { 
					if(count-refind("[[:space:]]", reverse(mid(str,1,count)))) return Left(str, (count-refind("[[:space:]]", reverse(mid(str,1,count))))); 
					else return(left(str,1));
				}
			}
			
		</cfscript>
	</cfoutput>

	
	
<!-------------------------------------------------------------------------------------->
<!--- Javascript needed for this page.                                               --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<script language="JavaScript">		
							
			function closeWindow(){
				
				var tempOpener = 'window.opener';		
				if (typeof(eval(tempOpener)) != "undefined"){	
					//window.opener.location.reload();
					window.opener.location.href = window.opener.location.href;
				};
				
				window.close();
				
			}

			
			function resetForm(textObject) {   
				
				document.TaskSearch.reset();
				
				span_showDate.innerText = 'Choose Date';
				span_showDate.style.display = 'none';
				
				span_showDateBetween.innerText = 'Choose Date';
				span_showDateBetweenShow.style.display = 'none';
										
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
<!--- Query for the tasks to show.                                                   --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getTasks" datasource="#trim(request.datasource)#">
		SELECT f.TaskID, f.ObjectID, f.InstanceID, f.AssignedtoUserID, f.priority, f.statusID, f.Note, f.dueDate, f.Active, 
		f.DateCreated, sli.ItemNameDisplay, CONCAT(vuap.FName, ' ', vuap.LName) AS Fullname 
		FROM task f JOIN view_UserAccountParameters vuap ON f.AssignedtoUserID = vuap.UsersID
		LEFT JOIN pa_master.standardlistitem sli ON f.statusID = sli.StandardListItemID
		WHERE f.CreatorID = #trim(session.user.getUsersID())#
		ORDER BY PRIORITY, dueDate									
	</cfquery>	
	
	
	
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
		<cfset session.rowsPerPage_Task = 10><!---session.Client.getRecordsPerPage()--->
	</cfif>
				
	<cfset totalRows = getTasks.recordCount>
	<cfif showAll>
		<cfset rowsPerPage_Task = totalRows>
	</cfif>
	<cfset endRow_Task = min(startRow_Task + session.rowsPerPage_Task - 1, totalRows)>
	<cfset startRowNext = endRow_Task + 1>
	<cfset startRowBack = startRow_Task - session.rowsPerPage_Task>	
	
			
			
<!-------------------------------------------------------------------------------------->
<!--- Show the tasks.                                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<cftry>	
			
			<cfset titleRight = "<span class=siteLabel onclick=""closeWindow();""><u>Close&nbsp;Window</u></span>">
								
			<cfif getTasks.RecordCount LTE 0>
				<cfset title = "No Tasks I Have Created Found">			
			<cfelseif getTasks.RecordCount GTE 2>
				<cfset title = getTasks.recordcount & " Tasks I Have Created Found">	
			<cfelse>
				<cfset title = getTasks.recordcount & " Task I Have Created Found">
			</cfif> 
			<br>
			<cf_gcBorderedTable	title="#title#" tableWidth="100%" titleright="#trim(titleRight)#" tablealign="center">	
							
				<cfif getTasks.Recordcount GTE 1>
					
					<cf_gcNextNRecords type="Task">
					
						<table border="0" cellpadding="4" cellspacing="0" width="100%">
							<thead>			
								<td align="center">ID</td>	
								<td align="center">Priority</td>
								<td align="center">Status</td>
								<td align="center">Assigned&nbsp;To</td>
								<td align="center">Date&nbsp;Created</td>
								<td align="center">Due&nbsp;Date</td>
								<td align="center">Notes</td>
								<td>Note</td>	
							</thead>								
							<cfloop query="getTasks" startRow="#trim(startRow_Task)#" endRow="#trim(endRow_Task)#">							
								
								<cfif Priority EQ 1>
									<cfset classRow = "bgcolor=ff6666">
								<cfelseif Priority EQ 2>
									<cfset classRow = "bgcolor=FFFF66">
								<cfelse>
									<cfif currentrow MOD 2 EQ 0> 
										<cfset classRow = "class=TblRow">
									<cfelse>
										<cfset classRow = "">	
									</cfif>
								</cfif>
								
								
								<cfset noteXML = XMLParse(trim(Note))>	
								<cfset thisNoteXML = noteXML.task.entry[1].EntryTask.xmlText>	
								<cfset numberOfNotes = Arraylen(noteXML.task.entry)>
																					
								<cfoutput>							
									<tr #classRow# onclick="task=window.open('appTaskEdit.cfm?action=edit&taskID=#trim(taskID)#', 'task', 'top=150,left=150,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=640,height=425'); task.focus(0);" style="cursor: hand;">			
										<td class="SiteLabel" nowrap>#trim(TaskID)#</td>
										<td class="SiteLabel" nowrap align="center">
											<cfswitch expression="#trim(Priority)#">
												<cfcase value="1">URGENT</cfcase>
												<cfcase value="2">HIGH</cfcase>
												<cfcase value="3">MEDIUM</cfcase>
												<cfcase value="4">LOW</cfcase>
											</cfswitch>
										</td>
										<td class="SiteLabel" nowrap align="center">#trim(ItemNameDisplay)#</td>
										<td class="SiteLabel" nowrap align="center">#trim(FullName)#</td>
										<td class="SiteLabel" nowrap align="center">#DateFormat(trim(DateCreated), "mm/dd/yy")#</td>
										<td class="SiteLabel" nowrap align="center">#DateFormat(trim(dueDate), "mm/dd/yy")#</td>
										<td class="SiteLabel" nowrap align="center">#trim(numberOfNotes)#</td>
										<cfset thisNote = Replace(thisNoteXML, "'", "\'", "ALL")>		
										<cfset thisNote = Replace(thisNote, "#CHR(34)#", "\'", "ALL")>									
										<td class="SiteLabel" align="left" nowrap><span class="SiteRequiredLabel" style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, '#stripHTML(trim(thisNote))#');" onmouseout="hideTip(this);">#fullLeft(stripHTML(thisNoteXML), 45)#</span></td>									
									</tr>
								</cfoutput>
								
							</cfloop>
							
						</table>
					
					</cf_gcNextNRecords>
					
				<cfelse>
					
					<table align="left" cellpadding="5" cellspacing="0" border="0">				
						<tr>
							<td class="SiteLabel" valign="top">
								There are no tasks to show.
							</td>															
						</tr>
					</table>
						
				</cfif>
					
				<br>
					
			</cf_gcBorderedTable>
	
						
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
		
		
