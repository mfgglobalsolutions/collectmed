<!--- tagQuoteSearch.cfm --->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formname" default="searchQuotes">
	<cfset formname = attributes.formname>
	
		
		
<!-------------------------------------------------------------------------------------->
<!--- Get all the entitys that are from this client. WE WANT INACTIVE USERS HERE     --->
<!-------------------------------------------------------------------------------------->
	<cfset getClientAgents = session.Client.getClientsUsers(ClientID: session.ClientID, ActiveInActive: "yes")>	
	
			

<!-------------------------------------------------------------------------------------->
<!--- Scripts needed for this page.                                                  --->
<!-------------------------------------------------------------------------------------->
<cfoutput>
	<script language="JavaScript">
		function showDateCreatedBetween(val){
			if(val == 'between'){
				span_dateCreated.style.display = '';
				span_dateCreatedBetweenShow.style.display = '';
			}
			else if(val == ''){
				span_dateCreated.style.display = 'none';
				span_dateCreatedBetweenShow.style.display = 'none';
				span_dateCreated.innerText = 'Choose Date';					
				#trim(formname)#.dateCreated.value = '';
				#trim(formname)#.dateCreatedBetween.value = '';
				
			}
			else{
				span_dateCreated.style.display = '';
				#trim(formname)#.dateCreatedBetween.value = '';
				span_dateCreatedBetweenShow.style.display = 'none';
				span_dateCreatedBetween.innerText = 'Choose Date';
			};	
		};
		
		function resetForm(textObject) {   
			document.#formName#.reset();
													
			span_dateCreated.innerText = 'Choose Date';
			span_dateCreated.style.display = 'none';				
			
			span_dateCreatedBetween.innerText = 'Choose Date';
			span_dateCreatedBetweenShow.style.display = 'none';		
									
		};
		
		function AssignedToUserIDFunction(value){				
			if(value!=0 && #trim(formname)#.AssignedToUserID.value.indexOf(value) < 0){									
				if (!#trim(formname)#.AssignedToUserID.value==''){
					#trim(formname)#.AssignedToUserID.value=#trim(formname)#.AssignedToUserID.value + ','
				}; 
				#trim(formname)#.AssignedToUserID.value=#trim(formname)#.AssignedToUserID.value + value					
			};
		};
		
		function checkUnassigned(){									
			if(#trim(formname)#.unassgined.checked){							 	
				#trim(formname)#.unassigned_Hidden.value = 1
				#trim(formname)#.AssignedToUserID.value = '';
				#trim(formname)#.AssignedToUserIDSelect[0].selected = true;
				document.getElementById("assigned_TR").style.display = 'none';					
			}
			else{
				#trim(formname)#.unassigned_Hidden.value = '';
				document.getElementById("assigned_TR").style.display = 'inline';					
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
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cf_gcBorderedTable	title="Search&nbsp;Query" tablealign="center">	
	
		<cfoutput>
			<form method="post" name="#trim(formname)#">
				<table border="0" cellpadding="0" cellspacing="10">					
						
					<!---QuoteIDs--->
					<tr>			
						<td class="SiteLabel" nowrap align="right">
							Quote&nbsp;IDs: 
						</td>	
						<td nowrap><input type="Text" name="quoteIDs" value="" size="25" class="SiteTextBox"  onkeyup="this.value=this.value.replace(/[^\d]+/g,',');">&nbsp;<span class="copyGreySmall">(comma delimited)</span></td>			
					</tr>	
								
					<!---LastNameContains--->
					<tr>			
						<td class="SiteLabel" nowrap align="right">
							Last&nbsp;Name&nbsp;Contains: 
						</td>	
						<td nowrap><input type="Text" name="lastNameContains" value="#trim(caller.lastNameContains)#" size="35" class="SiteTextBox"></td>			
					</tr>						
																	
					<!---Assigned To--->
					<tr id="assigned_TR" style="display: 'inline';">			
						<td class="SiteLabel" nowrap align="right">
							Assigned to:
						</td>	
						<td class="SiteLabel" nowrap>						
							<input name="AssignedToUserID" value="#trim(caller.AssignedToUserID)#" class="SiteTextBox" size="20" maxlength=250 style="text-align: right;" title="For more than one User ID, list IDs in a comma delimited list (NO SPACES)">&nbsp;
							<select class="SiteSelectBox" name="AssignedToUserIDSelect" onchange="AssignedToUserIDFunction(this.options.value);">
								<option value=0>
								<cfloop query="getClientAgents">
									<option value="#trim(UsersID)#">#trim(Fullname)# 
								</cfloop>			
							</select>
						</td>			
					</tr>					
															
					<!---Date Created--->
					<cfif IsDate(trim(caller.dateCreated))>
						<cfset span_dateCreatedDisplay = "inline">
					<cfelse>	
						<cfset span_dateCreatedDisplay = "none">
					</cfif>
					
					<cfif IsDate(trim(caller.dateCreatedBetween))>
						<cfset span_dateCreatedBetweenShowDisplay = "inline">
					<cfelse>	
						<cfset span_dateCreatedBetweenShowDisplay = "none">
					</cfif>
					
					<tr>							
						<td class="SiteLabel" nowrap align="right">
							Date Created:
						</td>	
						<td nowrap>						
							<select name="dateCreatedParameter" class="SiteSelectBox" onchange="showDateCreatedBetween(this.value);">
								<option value="" selected>
								<option value="LT" <cfif trim(caller.dateCreatedParameter) EQ "LT">SELECTED</cfif>>Before					
								<option value="GT" <cfif trim(caller.dateCreatedParameter) EQ "GT">SELECTED</cfif>>After
								<option value="between" <cfif trim(caller.dateCreatedParameter) EQ "between">SELECTED</cfif>>Between
							</select>
							&nbsp;
							<span id="span_dateCreated" title="Click to select a date" style="display: '#span_dateCreatedDisplay#'; font:13px; position:relative; cursor:hand; color:990000;" onClick="openCalender('#trim(formname)#', 'dateCreated');"><u><cfif IsDate(trim(caller.dateCreated))>#DateFormat(trim(caller.dateCreated), 'mmm dd, yyyy')#<cfelse>Choose&nbsp;Date</cfif></u></span>
							<span id="span_dateCreatedBetweenShow" style="font:12px; display: '#span_dateCreatedBetweenShowDisplay#'">&nbsp;AND&nbsp;&nbsp;<span id="span_dateCreatedBetween" title="Click to select a date" style="font:13px; position:relative; cursor:hand; color:990000;" onClick="openCalender('#trim(formname)#', 'dateCreatedBetween');"><u><cfif IsDate(trim(caller.dateCreatedBetween))>#DateFormat(trim(caller.dateCreatedBetween), 'mmm dd, yyyy')#<cfelse>Choose&nbsp;Date</cfif></u></span></span>
							<input type="hidden" name="dateCreated">
							<input type="hidden" name="dateCreatedBetween">
						</td>			
					</tr>						
																					
					<!---Submit Button--->									
					<tr>
						<td align="center" colspan="2" nowrap>			
							<cf_gcSubmitButton value="Search&nbsp;Quotes">&nbsp;&nbsp;&nbsp;<input type="button" onclick="resetForm(this);" value="Clear Form" class="SiteSubmitbox">							
						</td>
					</tr>					
				</table>			
			</form>
		</cfoutput>
	
	</cf_gcBorderedTable>	
	
	