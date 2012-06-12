<!---- appFlagsCreated.cfm ---->

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
					window.opener.location.reload();
				};
				
				window.close();
				
			}

			
			function resetForm(textObject) {   
				
				document.FlagSearch.reset();
				
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
					FlagSearch.showDate.value = '';
					FlagSearch.showDateBetween.value = '';
					
				}
				else{
					span_showDate.style.display = '';
					FlagSearch.showDateBetween.value = '';
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
<!--- Query for the flags to show.                                                   --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getFlags" datasource="#trim(request.datasource)#">
		SELECT f.FlagID, f.ObjectID, f.InstanceID, f.AssignedtoUserID, f.priority, f.statusID, f.Note, f.dueDate, f.Active, 
		f.DateCreated, sli.ItemNameDisplay, CONCAT(vuap.FName, ' ', vuap.LName) AS Fullname 
		FROM Flag f JOIN view_useraccountparameters vuap ON f.AssignedtoUserID = vuap.UsersID
		LEFT JOIN pa_master.standardlistitem sli ON f.statusID = sli.StandardListItemID
		WHERE f.CreatorID = #trim(session.user.getUsersID())#
		ORDER BY PRIORITY, dueDate									
	</cfquery>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Code Needed to run the Next N records view of claims query.                    --->
<!-------------------------------------------------------------------------------------->
	<cfparam name="startRow" default="1" type="numeric">	
	<cfif IsDefined("form.startRow") AND form.startRow NEQ "">
		<cfset startRow = form.startRow>
	<cfelseif IsDefined("url.startRow") AND url.startRow NEQ "">
		<cfset startRow = url.startRow>	
	</cfif>
	
	<cfparam name="showAll" type="boolean" default="No">
	<cfif IsDefined("form.showAll") AND form.showAll NEQ "">
		<cfset showAll = form.showAll>
	<cfelseif IsDefined("url.showAll") AND url.showAll NEQ "">
		<cfset showAll = url.showAll>	
	</cfif>			
	
	<cfif IsDefined("form.rowsPerPage") AND form.rowsPerPage NEQ "">
		<cfset session.rowsPerPage = form.rowsPerPage>
	<cfelseif IsDefined("url.rowsPerPage") AND url.rowsPerPage NEQ "">
		<cfset session.rowsPerPage = url.rowsPerPage>	
	<cfelseif IsDefined("session.rowsPerPage") AND IsNumeric(session.rowsPerPage)>
		<cfset session.rowsPerPage = session.rowsPerPage>	
	<cfelse>
		<cfset session.rowsPerPage = 10><!---session.Client.getRecordsPerPage()--->
	</cfif>
				
	<cfset totalRows = getFlags.recordCount>
	<cfif showAll>
		<cfset rowsPerPage = totalRows>
	</cfif>
	<cfset endRow = min(startRow + session.rowsPerPage - 1, totalRows)>
	<cfset startRowNext = endRow + 1>
	<cfset startRowBack = startRow - session.rowsPerPage>	
	
			
			
<!-------------------------------------------------------------------------------------->
<!--- Show the flags.                                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<cftry>	
			
			<cfset titleRight = "<span class=siteLabel onclick=""closeWindow();""><u>Close&nbsp;Window</u></span>">
								
			<cfif getFlags.RecordCount LTE 0>
				<cfset title = "No Flags I Have Created Found">			
			<cfelseif getFlags.RecordCount GTE 2>
				<cfset title = getFlags.recordcount & " Flags I Have Created Found">	
			<cfelse>
				<cfset title = getFlags.recordcount & " Flag I Have Created Found">
			</cfif> 
			<br>
			<cf_gcBorderedTable	title="#title#" tableWidth="100%" titleright="#trim(titleRight)#" tablealign="center">	
							
				<cfif getFlags.Recordcount GTE 1>
					
					<cf_gcNextNRecords>
					
						<table border="0" cellpadding="4" cellspacing="0" width="100%">
							<thead>			
								<td align="center">ID</td>	
								<td align="center">Priority</td>
								<td align="center">Status</td>
								<td align="center">Assigned&nbsp;To</td>
								<td align="center">Date&nbsp;Created</td>
								<td align="center">Due&nbsp;Date</td>
								<td align="center">Notes</td>
								<td colspan="2">Note</td>	
							</thead>								
							<cfloop query="getFlags" startRow="#trim(startRow)#" endRow="#trim(endRow)#">							
								
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
								<cfset thisNoteXML = noteXML.flag.entry[1].EntryFlag.xmlText>	
								<cfset numberOfNotes = Arraylen(noteXML.flag.entry)>
																					
								<cfoutput>							
									<tr #classRow#>			
										<td class="SiteLabel" nowrap>#trim(FlagID)#</td>
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
										<td class="SiteLabel" align="left" nowrap><span class="SiteRequiredLabel" style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, '#stripHTML(trim(thisNote))#');" onmouseout="hideTip();">#fullLeft(stripHTML(thisNoteXML), 45)#</span></td>									
										<td class="SiteLabel"><span onclick="flag=window.open('appFlagEdit.cfm?action=edit&flagID=#trim(flagID)#', 'flag', 'top=150,left=150,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=640,height=425'); flag.focus(0);" style="cursor: hand;"><u>View</u></span></td>
									</tr>
								</cfoutput>
								
							</cfloop>
							
						</table>
					
					</cf_gcNextNRecords>
					
				<cfelse>
					
					<table align="left" cellpadding="5" cellspacing="0" border="0">				
						<tr>
							<td class="SiteLabel" valign="top">
								There are no flags to show.
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
		
		