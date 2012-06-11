<!---- appSystemMessageDisplay.cfm ---->

	
<!-------------------------------------------------------------------------------------->
<!--- Javascript needed for this page.                                               --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<script language="JavaScript">
		
			function resetForm(textObject) {   				
				document.SystemUserMessageSearch.reset();				
			};
												
			function submitSystemUserMessageDismiss(id){				
				var dismissSystemUserMessage = confirm("Are you sure you want to dismiss this Message?");
			
				if(dismissSystemUserMessage){	
					document.SystemUserMessageDismiss.dismissSystemUserMessageID.value = id; 
					SystemUserMessageDismiss.submit();
				};	
			};
			
			function checkAllMessages(){				
				for(var i=0; i < document.SystemUserMessages.elements.length; i++){
					name = document.SystemUserMessages.elements[i].name;
					type = document.SystemUserMessages.elements[i].type;					
					if(name.indexOf('sel_') > -1 && type == "checkbox"){						
						var Left = 'document.SystemUserMessages.'+name;										 		
						if(document.SystemUserMessages.checkAll.checked){ 
							eval(Left).checked = true;	
						}
						else{
							eval(Left).checked = false;	
						}		
					}					
				}
			}
				
			function dismissMessages(){			
				
				for(var i=0; i < document.SystemUserMessages.elements.length; i++){
					name = document.SystemUserMessages.elements[i].name;
					type = document.SystemUserMessages.elements[i].type;					
					if(name.indexOf('sel_') > -1 && type == "checkbox"){						
						var nameArray = name.split("_");	
						var id = nameArray[1];	
						var Left = 'document.SystemUserMessages.'+name+'.checked';										 		
						if(eval(Left)){			
							document.SystemUserMessageDismiss.dismissSystemUserMessageID.value = ListAppend_JS(document.SystemUserMessageDismiss.dismissSystemUserMessageID.value, id); 							
						}							
					}										
				}	
				
				var dismissSystemUserMessage = confirm("Are you sure you want to dismiss these messages?\n\n" + document.SystemUserMessageDismiss.dismissSystemUserMessageID.value + "\n\nIf you wish to dismiss these messages click \"OK\" otherwise click \"Cancel\"");
			
				if(dismissSystemUserMessage){							
					SystemUserMessageDismiss.submit();					
				}		
			}			
		</script>
		
	</cfoutput>
	
	
				
<!-------------------------------------------------------------------------------------->
<!--- If the url contains a dismiss remindderID then go ahead and process.           --->
<!-------------------------------------------------------------------------------------->	
	<cfif IsDefined("form.dismissSystemUserMessageID") AND form.dismissSystemUserMessageID NEQ "">
		
		<cfloop list="#trim(form.dismissSystemUserMessageID)#" index="i">
		
			<cfquery name="getSystemUserMessageUsersID" datasource="#trim(request.datasource)#">
				SELECT UsersID 
				FROM systemusermessage 
				WHERE SystemUserMessageID = #trim(i)#			 
			</cfquery>
			
			<cfif getSystemUserMessageUsersID.RecordCount EQ 1 AND getSystemUserMessageUsersID.UsersID EQ session.User.getUsersID()>
				
				<cfquery name="updateSystemUserMessage" datasource="#trim(request.datasource)#">
					UPDATE systemusermessage
					SET Dismissed = 1 
					WHERE SystemUserMessageID = #trim(i)#			 
				</cfquery>
				
			</cfif>
		
		</cfloop>
	
	</cfif>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get all the users SystemUserMessages.                                          --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getSystemUserMessages" datasource="#trim(request.datasource)#">
		SELECT SystemUserMessageID, UsersID, Note AS shortNote, Note, Active, DateCreated
		FROM systemusermessage  
		WHERE usersID = #trim(session.User.GetUsersID())# 
		
		<cfif NOT IsDefined("form.SubmittedSystemUserMessage")>AND Dismissed = 0</cfif>
		
		<cfif isDefined("form.noteContains") AND form.noteContains NEQ "">
			AND Note LIKE '%#trim(form.noteContains)#%'
		</cfif> 
			
		<!---<cfif IsDefined("form.SystemUserMessageActive") AND form.SystemUserMessageActive NEQ "">
			AND Active = #trim(form.SystemUserMessageActive)#
		</cfif>--->
										
	</cfquery>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- If there are messages then go ahead and set the session variable.              --->
<!-------------------------------------------------------------------------------------->
	<cfif getSystemUserMessages.RecordCount GTE 1>
		<cfset session.userSystemMessages = getSystemUserMessages.RecordCount>
	</cfif>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the SystemUserMessage tab verbage.                                         --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		<script language="JavaScript">
			var SystemUserMessageElement = document.getElementById("tabSystemMessageVerbage");
			if (SystemUserMessageElement != null){
				document.getElementById("tabSystemMessageVerbage").innerHTML = 'Messages (#trim(getSystemUserMessages.RecordCount)#)';		
			};				
		</script>
	</cfoutput>

	
	
<!-------------------------------------------------------------------------------------->
<!--- Code Needed to run the Next N records view of claims query.                    --->
<!-------------------------------------------------------------------------------------->
	<cfparam name="startRow_SystemUserMessage" default="1" type="numeric">	
	<cfif IsDefined("form.startRow_SystemUserMessage") AND form.startRow_SystemUserMessage NEQ "">
		<cfset startRow_SystemUserMessage = form.startRow_SystemUserMessage>
	<cfelseif IsDefined("url.startRow_SystemUserMessage") AND url.startRow_SystemUserMessage NEQ "">
		<cfset startRow_SystemUserMessage = url.startRow_SystemUserMessage>	
	</cfif>
	
	<cfparam name="showAll" type="boolean" default="No">
	<cfif IsDefined("form.showAll") AND form.showAll NEQ "">
		<cfset showAll = form.showAll>
	<cfelseif IsDefined("url.showAll") AND url.showAll NEQ "">
		<cfset showAll = url.showAll>	
	</cfif>			
	
	<cfparam name="session.rowsPerPage_SystemUserMessage" default="10">
	<cfif IsDefined("form.rowsPerPage_SystemUserMessage") AND form.rowsPerPage_SystemUserMessage NEQ "">
		<cfset session.rowsPerPage_SystemUserMessage = form.rowsPerPage_SystemUserMessage>
	<cfelseif IsDefined("url.rowsPerPage_SystemUserMessage") AND url.rowsPerPage_SystemUserMessage NEQ "">
		<cfset session.rowsPerPage_SystemUserMessage = url.rowsPerPage_SystemUserMessage>	
	<cfelseif IsDefined("session.rowsPerPage_SystemUserMessage") AND IsNumeric(session.rowsPerPage_SystemUserMessage)>
		<cfset session.rowsPerPage_SystemUserMessage = session.rowsPerPage_SystemUserMessage>	
	<cfelse>
		<cfset session.rowsPerPage_SystemUserMessage = 10>
	</cfif>
				
	<cfset totalRows = getSystemUserMessages.recordCount>
	<cfif showAll>
		<cfset rowsPerPage = totalRows>
	</cfif>
	<cfset endRow_SystemUserMessage = min(startRow_SystemUserMessage + session.rowsPerPage_SystemUserMessage - 1, totalRows)>
	<cfset startRowNext = endRow_SystemUserMessage + 1>
	<cfset startRowBack = startRow_SystemUserMessage - session.rowsPerPage_SystemUserMessage>
		
		
				
<!-------------------------------------------------------------------------------------->
<!--- Show the SystemUserMessages this has Current day and past if not dismissed.    --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<cftry>	
					
			<cfif getSystemUserMessages.RecordCount LTE 0>
				<cfset title = "No&nbsp;System&nbsp;Messages&nbsp;Found">			
			<cfelseif getSystemUserMessages.RecordCount GTE 2>
				<cfset title = getSystemUserMessages.recordcount & "&nbsp;System&nbsp;Messages&nbsp;Found">
			<cfelse>
				<cfset title = getSystemUserMessages.recordcount & "&nbsp;System&nbsp;Message&nbsp;Found">
			</cfif> 
			
			<table  border="0" cellspacing="1" cellpadding="1">				
				<tr>
					<td>
						<font color="003399" face="arial" size="2"><strong>#trim(title)#</strong></font>
					</td>
					<td align="right">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="cursor:hand;" class=siteLabel onclick="if(showMessagesSearch.style.display=='none') {showMessagesSearch.style.display='block'} else {showMessagesSearch.style.display='none'};"><u>Search</u></span>
					</td>
				</tr>		
				
				<tr><td colspan="2">
					
					<span id="showMessagesSearch" style="display:'none';">
						<form method="post" name="SystemUserMessageSearch">
							<input type="Hidden" name="SubmittedSystemUserMessage" value="yes">
							<table border="0" cellpadding="0" cellspacing="10">					
								
								<!---<!---Active--->
								<tr>			
									<td class="SiteLabel" nowrap align="right">
										Active: 
									</td>	
									<td>
										<select name="SystemUserMessageActive" class="SiteSelectBox">
											<option SELECTED value="1">Active						
											<option value="0">Inactive
											<option value="">Either Active or Inactive
										</select>
									</td>			
								</tr>--->
								
								<!---noteContains--->
								<tr>			
									<td class="SiteLabel" nowrap align="right">
										Note&nbsp;Contains: 
									</td>	
									<td><input type="Text" name="noteContains" value="" size="35" class="SiteTextBox"></td>			
								</tr>										
																		
								<!---Submit Button--->
								<tr>
									<td colspan="2">&nbsp;</td>
								</tr>					
								<tr>
									<td align="center" colspan="2">			
										<cf_gcSubmitButton value="Search Messages">&nbsp;&nbsp;&nbsp;<input type="button" onclick="resetForm(this);" value="Clear" class="SiteSubmitbox">							
									</td>
								</tr>					
							</table>			
						</form>				
					</span>
				
				</td></tr>	
			
				<cfif getSystemUserMessages.Recordcount GTE 1>
						
					<tr><td colspan="2">	
						<cf_gcNextNRecords type="SystemUserMessage">
							<form name="SystemUserMessages">	
								<cf_gcTableScrollFixedHeader headers="Note,<input type=button value=Dismiss class=siteSubmitBox onClick=dismissMessages()>&nbsp;&nbsp;check-all<input name=checkAll type=Checkbox onClick=checkAllMessages()>" headersalign="left,right" mainwidth="420">											
															
									<cfloop query="getSystemUserMessages" startRow="#trim(startRow_SystemUserMessage)#" endRow="#trim(endRow_SystemUserMessage)#">							
										<cfoutput>															
											<tr<cfif currentrow MOD 2 EQ 0> class="TblRow"</cfif>>			
												<cfset thisNote = Replace(LEFT(shortNote, 75), "'", "\'", "ALL")>
												<cfset thisNote = ReplaceNoCase(trim(thisNote), "#CHR(13)##CHR(10)#", " ", "ALL")>	
												<td class="SiteLabel" align="center" nowrap>#trim(SystemUserMessageID)#</td>
												<td class="SiteLabel" align="left" nowrap><span class="SiteRequiredLabel" style="cursor: hand; color:blue" onclick="SystemUserMessage=window.open('appSystemUserMessage.cfm?action=view&SystemUserMessageID=#trim(SystemUserMessageID)#', 'SystemUserMessage', 'top=150,left=150,dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=1,height=1'); SystemUserMessage.focus(0);">#REQUEST.fullLeft(REQUEST.stripHTML(shortNote), 50)#</span></td>									
												<!---<td class="SiteLabel" align="right" nowrap><span style="cursor: hand;" onclick="submitSystemUserMessageDismiss(#trim(SystemUserMessageID)#);"><u>Dismiss</u></span></td>--->
												<td class="SiteLabel" align="right" nowrap><input type="checkbox" name="sel_#trim(SystemUserMessageID)#"></td>
											</tr>											
										</cfoutput>										
									</cfloop>
									
								</cf_gcTableScrollFixedHeader>	
							</form>	
						</cf_gcNextNRecords>
					</td></tr>
					
				</cfif>		
				
					
				<cfif getSystemUserMessages.Recordcount LTE 0>
					<tr><td colspan="2">
						<table cellpadding="5" cellspacing="0" border="0">				
							<tr>
								<td class="SiteLabel" valign="top">
									No messages to show currently.
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
			<span id="sp_SystemUserMessageDismiss" style="display:'none';">
				<cfoutput>
					<form name="SystemUserMessageDismiss" method="post">
						<input type="Hidden" name="dismissSystemUserMessageID" value="">			
						<cf_gcEmbedFields except="dismissSystemUserMessageID">
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
		
		

