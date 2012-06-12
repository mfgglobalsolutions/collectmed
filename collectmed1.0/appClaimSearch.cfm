<!---- appClaimSearch.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.formname" default="searchClaims">
	<cfset formname = attributes.formname>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Blank out the order by that the following page uses in a session.              --->
<!-------------------------------------------------------------------------------------->
	 <cf_gcClearSessionVariables 
		SessionVarClearList="order,orderBy">
	
		
	
<!-------------------------------------------------------------------------------------->
<!--- Get all the entitys that are from this client. WE WANT INACTIVE USERS HERE     --->
<!-------------------------------------------------------------------------------------->
	<cfset getClientAgents = session.Client.getClientsUsers(ClientID: session.ClientID, ActiveInActive: "yes")>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Get the Available Procedure Codes to search by.                                --->
<!-------------------------------------------------------------------------------------->		
	<cfquery name="getProcedureCodes" datasource="#trim(request.datasource)#"><!---cachedwithin="#CreateTimeSpan(0,1,0,0)#"--->
		SELECT RecordID, HCPC AS Code, LEFT(CAST(ShortDescription AS VARCHAR), 30) AS Description
		FROM pa_master.eob_medicare_procedurecode
		WHERE RecordID IN(SELECT DISTINCT cp.ProcedureCode FROM [Procedure] cp JOIN Claim c ON cp.ClaimID = c.ClaimID WHERE c.ClientID = #trim(session.clientID)#)
	</cfquery>
	
	
		
<!-------------------------------------------------------------------------------------->
<!--- Get all the available EOB patients this client has.                            --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getClientEntities" datasource="#trim(request.datasource)#">
		SELECT EntityID, LName + ', ' +  FNAme AS eobFullname
		FROM entity
		WHERE ClientID = #trim(session.ClientID)# AND ObjectTypeID = 3
	</cfquery>		
	
				 
	
<!-------------------------------------------------------------------------------------->
<!--- Get all the available patients this client has.                                --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getClientPatients" datasource="#trim(request.datasource)#">
		SELECT e.EntityID, e.LName + ', ' +  e.FNAme AS patientFullname, p.patientID 
		FROM entity e INNER JOIN patient p ON e.entityID = p.entityID
		WHERE e.ClientID = #trim(session.ClientID)# AND e.ObjectTypeID = 2
	</cfquery>		
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Page Specific Javascripts                                                      --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		<script language="JavaScript">			
			
			function resetForm(textObject) {   
				document.#formName#.reset();
				
				span_dueDate.innerText = 'Choose Date';
				span_dueDate.style.display = 'none';
				
				span_dueDateBetween.innerText = 'Choose Date';
				span_dueDateBetweenShow.style.display = 'none';
									
				span_dateCreated.innerText = 'Choose Date';
				span_dateCreated.style.display = 'none';				
				
				span_dateCreatedBetween.innerText = 'Choose Date';
				span_dateCreatedBetweenShow.style.display = 'none';
				
				span_serviceDateCreated.innerText = 'Choose Date';
				span_serviceDateCreated.style.display = 'none';				
				
				span_serviceDateCreatedBetween.innerText = 'Choose Date';
				span_serviceDateCreatedBetweenShow.style.display = 'none';
										
			};
			
			function EntityIDFunction(value){					
				if(value!=0 && #trim(formname)#.EntityID.value.indexOf(value) < 0){									
					if (!#trim(formname)#.EntityID.value == ''){
						#trim(formname)#.EntityID.value = #trim(formname)#.EntityID.value + ','
					}; 
					#trim(formname)#.EntityID.value = #trim(formname)#.EntityID.value + value					
				};
			};
									
			function ProcedureCodeFunction(value){				
				if(value!=0 && #trim(formname)#.ProcedureCode.value.indexOf(value) < 0){									
					if (!#trim(formname)#.ProcedureCode.value==''){
						#trim(formname)#.ProcedureCode.value=#trim(formname)#.ProcedureCode.value + ','
					}; 
					#trim(formname)#.ProcedureCode.value=#trim(formname)#.ProcedureCode.value + value					
				};
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
			
			function showServiceDateCreatedBetween(val){
				if(val == 'between'){
					span_serviceDateCreated.style.display = '';
					span_serviceDateCreatedBetweenShow.style.display = '';
				}
				else if(val == ''){
					span_serviceDateCreated.style.display = 'none';
					span_serviceDateCreatedBetweenShow.style.display = 'none';
					span_serviceDateCreated.innerText = 'Choose Date';					
					#trim(formname)#.serviceDateCreated.value = '';
					#trim(formname)#.serviceDateCreatedBetween.value = '';
					
				}
				else{
					span_serviceDateCreated.style.display = '';
					#trim(formname)#.serviceDateCreatedBetween.value = '';
					span_serviceDateCreatedBetweenShow.style.display = 'none';
					span_serviceDateCreatedBetween.innerText = 'Choose Date';
				};	
			};
			
			function showDueDateSpan(val){
				if(val == 'LT' || val == 'GT'){
					span_dueDate.style.display = '';
					#trim(formname)#.dueDateBetween.value = '';
					span_dueDateBetweenShow.style.display = 'none';					
				}
				else if(val == 'between'){
					span_dueDate.style.display = '';
					span_dueDateBetweenShow.style.display = '';
				}
				else{
					#trim(formname)#.dueDate.value = '';
					#trim(formname)#.dueDateBetween.value = '';
					span_dueDate.style.display = 'none';
					span_dueDate.innerText = 'Choose Date';
					span_dueDateBetweenShow.style.display = 'none';
					span_dueDateBetween.innerText = 'Choose Date';
				};	
			};
			
			
			function setShowQuery(){
			
				/*if (#trim(formname)#.Active.value == 1){
					#trim(formname)#.showQuery_Active.value = "Active";
				}
				else if (#trim(formname)#.Active.value == 0){
					#trim(formname)#.showQuery_Active.value = "Inactive";
				};*/
												
				if (#trim(formname)#.claimType.value == 108){
					#trim(formname)#.showQuery_claimType.value = "Medicare";
				}
				else if (#trim(formname)#.claimType.value == 109){
					#trim(formname)#.showQuery_claimType.value = "Medicaid";
				}
				
			}
			
		</script>
		
	</cfoutput>


	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>&nbsp;<br><br></cfoutput>
	
	<cf_gcBorderedTable	title="Search&nbsp;Claims" tablealign="center">	
		<cfoutput>
			<form action="appClaimSearchProcess.cfm" method="post" name="#trim(formname)#" onsubmit="setShowQuery();">
				<input type="Hidden" name="clear_session.User.ClaimSearchQuery" value="1">
				<input type="Hidden" name="clear" value="1">
				<table border="0" cellpadding="0" cellspacing="10">					
					
					<!---Status ID IN--->
					<tr>			
						<td class="siteLabel" colspan="2" align="center" style="border: 1px solid c0c0c0; padding: 0px 0px 0px 0px;">
							
							<table cellspacing="0" cellpadding="1" border="0">
								<tr>
								    <td rowspan="9" class="siteLabel" nowrap><strong>Current&nbsp;Status&nbsp;IS:&nbsp;&nbsp;</strong></td>
								    <td class="siteLabel" nowrap><input name="isCreated" type="Checkbox" value="193" class="SiteCheckBox" onclick="if(this.checked == true){isNotCreated.checked = false;};">&nbsp;Created</td>
								    <td rowspan="9" class="siteLabel" nowrap>&nbsp;</td>
									<td rowspan="9" class="siteLabel" nowrap><strong><font color="FF0000">Current&nbsp;Status&nbsp;IS&nbsp;NOT:</font>&nbsp;&nbsp;</strong></td>
								    <td class="siteLabel" nowrap><input name="isNotCreated" type="Checkbox" value="193" class="SiteCheckBox" onclick="if(this.checked == true){isCreated.checked = false;};">&nbsp;Created</td>
								</tr>
								<tr>
								    <td class="siteLabel" nowrap><input name="isAssigned" type="Checkbox" value="194" class="SiteCheckBox" onclick="if(this.checked == true){isNotAssigned.checked = false;};">&nbsp;Assigned</td>
								    <td class="siteLabel" nowrap><input name="isNotAssigned" type="Checkbox" value="194" class="SiteCheckBox" onclick="if(this.checked == true){isAssigned.checked = false;};">&nbsp;Assigned</td>
								</tr>
								<tr>
								    <td class="siteLabel" nowrap><input name="isReAssigned" type="Checkbox" value="195" class="SiteCheckBox" onclick="if(this.checked == true){isNotReAssigned.checked = false;};">&nbsp;Re-Assigned</td>
								    <td class="siteLabel" nowrap><input name="isNotReAssigned" type="Checkbox" value="195" class="SiteCheckBox" onclick="if(this.checked == true){isReAssigned.checked = false;};">&nbsp;Re-Assigned</td>
								</tr>
								<tr>
								    <td class="siteLabel" nowrap><input name="isOpened" type="Checkbox" value="196" class="SiteCheckBox" onclick="if(this.checked == true){isNotOpened.checked = false;};">&nbsp;Opened</td>
								    <td class="siteLabel" nowrap><input name="isNotOpened" type="Checkbox" value="196" class="SiteCheckBox" onclick="if(this.checked == true){isOpened.checked = false;};">&nbsp;Opened</td>
								</tr>
								<tr>
								    <td class="siteLabel" nowrap><input name="isReOpened" type="Checkbox" value="197" class="SiteCheckBox" onclick="if(this.checked == true){isNotReOpened.checked = false;};">&nbsp;Re-Opened</td>
								    <td class="siteLabel" nowrap><input name="isNotReOpened" type="Checkbox" value="197" class="SiteCheckBox" onclick="if(this.checked == true){isReOpened.checked = false;};">&nbsp;Re-Opened</td>
								</tr>
								<tr>
								    <td class="siteLabel" nowrap><input name="isWorking" type="Checkbox" value="198" class="SiteCheckBox" onclick="if(this.checked == true){isNotWorking.checked = false;};">&nbsp;Working</td>
								    <td class="siteLabel" nowrap><input name="isNotWorking" type="Checkbox" value="198" class="SiteCheckBox" onclick="if(this.checked == true){isWorking.checked = false;};">&nbsp;Working</td>
								</tr>
								<tr>
								    <td class="siteLabel" nowrap><input name="isCompleted" type="Checkbox" value="199" class="SiteCheckBox" onclick="if(this.checked == true){isNotCompleted.checked = false;};">&nbsp;Completed</td>
								    <td class="siteLabel" nowrap><input name="isNotCompleted" type="Checkbox" value="199" class="SiteCheckBox" onclick="if(this.checked == true){isCompleted.checked = false;};">&nbsp;Completed</td>
								</tr>
								<tr>
								    <td class="siteLabel" nowrap><input name="isEscalated" type="Checkbox" value="200" class="SiteCheckBox" onclick="if(this.checked == true){isNotEscalated.checked = false;};">&nbsp;Escalated</td>
								    <td class="siteLabel" nowrap><input name="isNotEscalated" type="Checkbox" value="200" class="SiteCheckBox" onclick="if(this.checked == true){isEscalated.checked = false;};">&nbsp;Escalated</td>
								</tr>
								<tr>
								    <td class="siteLabel" nowrap><input name="isClosed" type="Checkbox" value="201" class="SiteCheckBox" onclick="if(this.checked == true){isNotClosed.checked = false;};">&nbsp;Closed</td>
								    <td class="siteLabel" nowrap><input name="isNotClosed" type="Checkbox" value="201" class="SiteCheckBox" onclick="if(this.checked == true){isClosed.checked = false;};">&nbsp;Closed</td>
								</tr>
							</table>
							
						</td>			
					</tr>
					
					
					<!---<!---Active--->
					<tr>			
						<td class="SiteLabel" nowrap align="right">
							Active: 
						</td>	
						<td>
							<input type="Hidden" name="showQuery_Active" value="">							
							<select name="Active" class="SiteSelectBox">
								<option SELECTED value="1">Active						
								<option value="0">Inactive
								<option value="">Either Active or Inactive
							</select>
						</td>			
					</tr>--->					
					
					<!---Type--->
					<input type="Hidden" name="showQuery_claimType" value="">
					<input type="Hidden" name="claimType" value="108">
					<!---
					<tr>			
						<td class="SiteLabel" nowrap align="right">
							Claim&nbsp;Type: 
						</td>	
						<td>							
							<select name="claimType" class="SiteSelectBox">
								<option SELECTED value="108">Medicare
								<option value="109">Medicaid									
								<option value="">All&nbsp;Types
							</select>
						</td>			
					</tr>
					--->						
					
					<!---LastNameContains--->
					<tr>			
						<td class="SiteLabel" nowrap align="right">
							Last&nbsp;Name&nbsp;Contains: 
						</td>	
						<td><input type="Text" name="lastNameContains" value="" size="35" class="SiteTextBox"></td>			
					</tr>						
							
					
					<!---ICN--->
					<tr>			
						<td class="SiteLabel" nowrap align="right">
							ICN: 
						</td>	
						<td><input type="Text" name="icn" value="" size="20" class="SiteTextBox"></td>			
					</tr>		
							
															
					<!---Patient ID--->
					<tr id="patientID_TR" style="display: 'inline';">			
						<td class="SiteLabel" nowrap align="right">
							EOB&nbsp;Patient&nbsp;ID:
						</td>	
						<td class="SiteLabel">						
							<input name="EntityID" class="SiteTextBox" size="20" maxlength=250 style="text-align: right;" title="For more than one Patient ID, list IDs in a comma delimited list (NO SPACES)">&nbsp;
							<select class="SiteSelectBox" name="EntityIDSelect" onchange="EntityIDFunction(this.options.value);">
								<option value=0>
								<cfloop query="getClientEntities">
									<option value="#trim(EntityID)#">#trim(eobFullname)# 
								</cfloop>			
							</select>
						</td>			
					</tr>			
					
					<!---Assigned To--->
					<tr id="assigned_TR" style="display: 'inline';">			
						<td class="SiteLabel" nowrap align="right">
							Assigned to:
						</td>	
						<td class="SiteLabel">						
							<input name="AssignedToUserID" class="SiteTextBox" size="20" maxlength=250 style="text-align: right;" title="For more than one User ID, list IDs in a comma delimited list (NO SPACES)">&nbsp;
							<select class="SiteSelectBox" name="AssignedToUserIDSelect" onchange="AssignedToUserIDFunction(this.options.value);">
								<option value=0>
								<cfloop query="getClientAgents">
									<option value="#trim(UsersID)#">#trim(Fullname)# 
								</cfloop>			
							</select>
						</td>			
					</tr>					
					
					<!---unassigned To--->
					<tr>
						<input type="Hidden" name="unassigned_Hidden" value="">			
						<td class="SiteLabel" nowrap align="right">
							Unassigned: 
						</td>	
						<td><input type="Checkbox" name="unassgined" onclick="checkUnassigned();" class="SiteCheckBox"></td>			
					</tr>
					
					<!---Service Dates--->
					<tr>							
						<td class="SiteLabel" nowrap align="right">
							Service Dates: 
						</td>	
						<td>						
							<select name="serviceDateCreatedParameter" class="SiteSelectBox" onchange="showServiceDateCreatedBetween(this.value);">
								<option value="" selected>
								<option value="LT">Before					
								<option value="GT">After
								<option value="between">Between
							</select>
							&nbsp;
							<span id="span_serviceDateCreated" title="Click to select a date" style="display: 'none'; font:13px; position:relative; cursor:hand; color:990000;" onClick="openCalender('#trim(formname)#', 'serviceDateCreated');"><u>Choose&nbsp;Date</u></span>
							<span id="span_serviceDateCreatedBetweenShow" style="font:12px; display: 'none'">&nbsp;AND&nbsp;&nbsp;<span id="span_serviceDateCreatedBetween" title="Click to select a date" style="font:13px; position:relative; cursor:hand; color:990000;" onClick="openCalender('#trim(formname)#', 'serviceDateCreatedBetween');"><u>Choose&nbsp;Date</u></span></span>
							<input type="hidden" name="serviceDateCreated">
							<input type="hidden" name="serviceDateCreatedBetween">
						</td>			
					</tr>	
										
					
					<!---Date Created--->
					<tr>							
						<td class="SiteLabel" nowrap align="right">
							Date Created: 
						</td>	
						<td>						
							<select name="dateCreatedParameter" class="SiteSelectBox" onchange="showDateCreatedBetween(this.value);">
								<option value="" selected>
								<option value="LT">Before					
								<option value="GT">After
								<option value="between">Between
							</select>
							&nbsp;
							<span id="span_dateCreated" title="Click to select a date" style="display: 'none'; font:13px; position:relative; cursor:hand; color:990000;" onClick="openCalender('#trim(formname)#', 'dateCreated');"><u>Choose&nbsp;Date</u></span>
							<span id="span_dateCreatedBetweenShow" style="font:12px; display: 'none'">&nbsp;AND&nbsp;&nbsp;<span id="span_dateCreatedBetween" title="Click to select a date" style="font:13px; position:relative; cursor:hand; color:990000;" onClick="openCalender('#trim(formname)#', 'dateCreatedBetween');"><u>Choose&nbsp;Date</u></span></span>
							<input type="hidden" name="dateCreated">
							<input type="hidden" name="dateCreatedBetween">
						</td>			
					</tr>						
					
					
					<!---Due Date--->
					<tr>							
						<td class="SiteLabel" nowrap align="right">
							Out of Time Filling Date: 
						</td>	
						<td>						
							<select name="dueDateParameter" class="SiteSelectBox" onchange="showDueDateSpan(this.value);">								
								<option value="" selected>
								<option value="LT">Before					
								<option value="GT">After
								<option value="between">Between
								<option value="1weeks">One Week Out
								<option value="2weeks">Two Weeks Out
								<option value="3weeks">Three Weeks Out
								<option value="1months">One Month Out
								<option value="2months">Two Months Out
								<option value="3months">Three Months Out
								<option value="NULL">No Due Date
							</select>
							&nbsp;
							<span id="span_dueDate" title="Click to select a date" style="display: 'none'; font:13px; position:relative; cursor:hand; color:990000;" onClick="openCalender('#trim(formname)#', 'dueDate');"><u>Choose&nbsp;Date</u></span>
							<span id="span_dueDateBetweenShow" style="font:12px; display: 'none'">&nbsp;AND&nbsp;&nbsp;<span id="span_dueDateBetween" title="Click to select a date" style="font:13px; position:relative; cursor:hand; color:990000;" onClick="openCalender('#trim(formname)#', 'dueDateBetween');"><u>Choose&nbsp;Date</u></span></span>
							<input type="hidden" name="dueDate">
							<input type="hidden" name="dueDateBetween">
						</td>			
					</tr>
										
					<!---Procedure Codes--->
					<tr id="assigned_TR" style="display: 'inline';">			
						<td class="SiteLabel" nowrap align="right">
							Procedure&nbsp;Code:
						</td>	
						<td class="SiteLabel">						
							<input name="ProcedureCode" class="SiteTextBox" size="20" maxlength=250 style="text-align: right;" title="For more than one Procedure Code, list codes in a comma delimited list (NO SPACES)">&nbsp;
							<select class="SiteSelectBox" name="ProcedureCodeSelect" onchange="ProcedureCodeFunction(this.options.value);">
								<option value=0>
								<cfloop query="getProcedureCodes">
									<option value="#trim(Code)#">#trim(Code)# - #trim(Description)# 
								</cfloop>			
							</select>
						</td>			
					</tr>
									
					<!---Submit Button--->
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>					
					<tr>
						<td align="center" colspan="2">			
							<cf_gcSubmitButton value="Search&nbsp;Claims">&nbsp;&nbsp;&nbsp;<input type="button" onclick="resetForm(this);" value="Clear Form" class="SiteSubmitbox">							
						</td>
					</tr>					
				</table>			
			</form>
		</cfoutput>
	</cf_gcBorderedTable>
	
	
	

<!------------------------------------------------------------------>
<!--- Set the focus on this form to the highest editable field.  --->
<!------------------------------------------------------------------>		
	<cfoutput>
		<script language="JavaScript">
			document.getElementById("lastNameContains").focus();					
		</script>
	</cfoutput>
	
		



