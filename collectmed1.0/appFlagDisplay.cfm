<!---- appFlagDisplay.cfm ---->

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
						
			function createFlag(){
				assign=window.open('appFlagCreate.cfm','create','top=150,left=150,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=640,height=350');
			};				
					
			function createdFlags(){
				assign=window.open('appFlagsCreated.cfm','created','top=150,left=150,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=850,height=425');
			};				
						
			function resetForm(textObject) {   
				
				document.FlagSearch.reset();
				
				span_showDate.innerText = 'Choose Date';
				span_showDate.style.display = 'none';
				
				span_showDateBetween.innerText = 'Choose Date';
				span_showDateBetweenShow.style.display = 'none';
										
			};
			
			function submitFlagDismiss(id){				
				var dismissFlag = confirm("Are you sure you want to dismiss this flag?");
			
				if(dismissFlag){	
					document.FlagDismiss.dismissFlagID.value = id; 
					FlagDismiss.submit();
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
<!--- Query to get the flags.                                                        --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getFlags" datasource="#trim(request.datasource)#">
		SELECT f.FlagID, f.ObjectID, f.InstanceID, f.priority, f.Note, f.dueDate, f.Active, f.DateCreated, f.statusID
		FROM Flag f
		WHERE f.AssignedtoUserID = #trim(session.User.GetUsersID())# 
		ORDER BY f.PRIORITY, f.dueDate									
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
					
			<cfif getFlags.RecordCount LTE 0>
				<cfset title = "No&nbsp;Flags&nbsp;Found">			
			<cfelseif getFlags.RecordCount GTE 2>
				<cfset title = getFlags.recordcount & "&nbsp;Flags&nbsp;Found">
			<cfelse>
				<cfset title = getFlags.recordcount & "&nbsp;Flag&nbsp;Found">
			</cfif> 
			
			<cf_gcBorderedTable	title="#title#" titleRight="<span  class=siteLabel style=""cursor: hand;"" onclick=""createFlag();""><u>Create&nbsp;Flag</u></span>&nbsp;&nbsp;&nbsp;<span class=siteLabel onclick=""createdFlags();""><u>View&nbsp;Flags&nbsp;Created</u></span>" tablewidth="75%" tablealign="center">	
							
				<cfif getFlags.Recordcount GTE 1>
					
					<cf_gcNextNRecords>
					
						<table border="0" cellpadding="4" cellspacing="0" width="100%">
							<thead>			
								<td align="center">ID</td>	
								<td align="center">Priority</td>
								<td align="center">Due&nbsp;Date</td>
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
								
								<cfif ListFind("168,171,173", StatusID) GTE 1>
									<cfset boldThis = 1>
								<cfelse>
										<cfset boldThis = 0>	
								</cfif>
																					
								<cfoutput>							
									<tr #classRow#>			
										<td class="SiteLabel" nowrap><!---[#statusID#]---><cfif boldThis><strong></cfif>#trim(FlagID)#<cfif boldThis></strong></cfif></td>
										<td class="SiteLabel" nowrap align="center">
											<cfswitch expression="#trim(Priority)#">
												<cfcase value="1"><cfif boldThis><strong></cfif>URGENT<cfif boldThis></strong></cfif></cfcase>
												<cfcase value="2"><cfif boldThis><strong></cfif>HIGH<cfif boldThis></strong></cfif></cfcase>
												<cfcase value="3"><cfif boldThis><strong></cfif>MEDIUM<cfif boldThis></strong></cfif></cfcase>
												<cfcase value="4"><cfif boldThis><strong></cfif>LOW<cfif boldThis></strong></cfif></cfcase>
											</cfswitch>
										</td>
										<td class="SiteLabel" nowrap align="center"><cfif boldThis><strong></cfif>#DateFormat(trim(dueDate), "mm/dd/yy")#<cfif boldThis></strong></cfif></td>
										<cfset thisNote = Replace(thisNoteXML, "'", "\'", "ALL")>
										<td class="SiteLabel" align="left" nowrap><span class="SiteLabel" style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, '#stripHTML(trim(thisNote))#');" onmouseout="hideTip();"><cfif boldThis><strong></cfif>#fullLeft(stripHTML(thisNoteXML), 45)#<cfif boldThis></strong></cfif></span></td>									
										<td class="SiteLabel"><span onclick="flag=window.open('appFlagEdit.cfm?action=edit&flagID=#trim(flagID)#', 'flag', 'top=150,left=150,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=no,toolbar=no,menubar=no,resizable=yes,width=640,height=460'); flag.focus(0);" style="cursor: hand;"><u>View</u></span></td>
									</tr>
								</cfoutput>
								
							</cfloop>
							
						</table>
				
					</cf_gcNextNrecords>
				
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
		
		