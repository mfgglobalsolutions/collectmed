<!---- appAdminWorkGroupEdit.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="Submitted" default="no">
	
	<cfparam name="attributes.formName" default="AccessFrom">
	<cfset formName = attributes.formName>
	
	<cfparam name="attributes.workGroupID" default="">
	<cfset workGroupID = attributes.workGroupID>
	
	<cfif IsDefined("form.workGroupID") AND form.workGroupID NEQ "">
		<cfset workGroupID = form.workGroupID>
	<cfelseif IsDefined("url.workGroupID") AND url.workGroupID NEQ "">
		<cfset workGroupID = url.workGroupID>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="workGroupID"
		fieldnames="Work Group ID"
		datatypes="numeric">
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Check to make sure that the work group exists.                                 --->
<!-------------------------------------------------------------------------------------->								
	<cfquery name="getWorkGroup" datasource="#trim(request.datasource)#">
		SELECT WorkGroupID, WorkGroupName, Description,	MondayStart, MondayEnd, TuesdayStart, TuesdayEnd, WednesdayStart, WednesdayEnd, ThursdayStart, ThursdayEnd, FridayStart, FridayEnd, SaturdayStart, SaturdayEnd, SundayStart, SundayEnd
		FROM WorkGroup
		WHERE WorkGroupID = #trim(WorkGroupID)#
	</cfquery>		
		
	<cfif getWorkGroup.RecordCount NEQ 1>
		<cf_gcGeneralErrorTemplate				
			message="The Work Group cannot be located. Please go back and provide another Work Group to edit.">
	</cfif>		
		
		
				
<!------------------------------------------------------------------>
<!--- The page starts here with the page not being submitted     --->
<!--- so it is the first screen that the user will see.          --->
<!------------------------------------------------------------------>	
	<cfif NOT IsDefined("form.Submitted")>
		
		<cfoutput>
			
			<style>
				##yellowAlert{
					background-color:ffffcc; 
					display:none; 
					width:540; 
					border:1px solid ccc889; 
					color:616161; 
					padding:10px; 
					margin-bottom:1em; 
				}
			</style>
			
			<script language="JavaScript">
				
				function validateForm(){	
					
					var msg  = "";			
					
					msg = msg + accessCheck();	
															
					if(msg.length >= 1){
						sp_errorMsg.innerHTML = msg;
						tr_errorMsg.style.display = 'inline';
						resetSubmitButtons();						
						return false;
					}
					else{						
						return true;
					};	
				};	
												
				function accessCheck(){				
					
					var msg = "";
					var day = "";
					
					for(i=1; i <= 7; i++){
						
						if(i == 1){day = "Monday";}
						else if(i == 2){day = "Tuesday";}
						else if(i == 3){day = "Wednesday";}
						else if(i == 4){day = "Thursday";}
						else if(i == 5){day = "Friday";}
						else if(i == 6){day = "Saturday";}
						else if(i == 7){day = "Sunday";};		
						
						check = "access" + day;
						
						if(eval('document.#trim(formname)#.' + check + '.checked')){						
							accessStartHour = "document.#trim(formname)#.access" + day + "StartHour.value";
							accessStartMinute = "document.#trim(formname)#.access" + day + "StartMinute.value";						
							accessStartAMPM = "document.#trim(formname)#.access" + day + "StartAMPM.value";
							accessEndHour = "document.#trim(formname)#.access" + day + "EndHour.value";
							accessEndMinute = "document.#trim(formname)#.access" + day + "EndMinute.value";						
							accessEndAMPM = "document.#trim(formname)#.access" + day + "EndAMPM.value";
							
							var StartDate = Date.parse("Jan 01, 1970 " + eval(accessStartHour) + ":" + eval(accessStartMinute) + ":00 " + eval(accessStartAMPM))
							var EndDate = Date.parse("Jan 01, 1970 " + eval(accessEndHour) + ":" + eval(accessEndMinute) + ":00 " + eval(accessEndAMPM))
							if(StartDate.toString() != "NaN" && StartDate.toString() != "NaN"){
								startD = new Date(StartDate);
								endD = new Date(EndDate);	
								if(startD > endD){
									msg = msg + '<br><b>' + day + ':</b> Start time cannot be after End time.';		
								};							
							}
							else{
								msg = msg + '<br><b>' + day + ':</b> Cannot determine time.';							
							};
						};									
					};
					
					return msg;
					
				};		
			
			</script>
			
			<br><br>
		
		</cfoutput>
		
		<!------------------------------------------------------------------>
		<!--- Set the header for this page.                              --->
		<!------------------------------------------------------------------>		
			<cf_gcBorderedTable	title="Edit Work Group" tablewidth="50%" tablealign="center">		
					
				 
				<!------------------------------------------------------------------>
				<!--- Output the form that the admin will use to                 --->
				<!--- create the page.                                           --->
				<!------------------------------------------------------------------>
				<cfoutput>
					
					<form name="#trim(formName)#" method="post" onsubmit="return validateForm();">
						<input type="Hidden" name="WorkGroupID" value="#trim(WorkGroupID)#">
						<table border="0" cellpadding="2" cellspacing="2" align="center">							
							
							<tr id="tr_errorMsg" style="display:none">
								<td colspan="3" align="center">
									<div id="yellowAlert" class="yecerrbg" style="display:block">
										<table cellpadding="2" cellspacing="0" border="0" width="540">
											<tr valign="top">
												<td>
													<img src="images/alert.gif" alt="Alert" border="0" width="41" height="42" align="middle">
												</td>
												<td valign="top" class="siteLabel">
													<b>Please correct the entries highlighted in yellow.</b>
													<ul>
														<span id="sp_errorMsg"></span>										
										 			</ul>
												</td>
											</tr>
										</table>
									</div>
								</td>
							</tr>
							<tr>
								<td align="right">		
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
										Work Group Name:
									</font>								
								</td>
								<td>		
									<input type="Text" class="SiteTextbox" name="WorkGroupName" size="20" maxlength="119" value="#trim(getWorkGroup.WorkGroupName)#">		
								</td>
							</tr>
							<tr>
								<td align="right">		
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
										Description
									</font>								
								</td>
								<td nowrap>		
									<textarea class="SiteTextArea" name="description" cols="40" rows="5">#trim(getWorkGroup.Description)#</textarea>
								</td>
							</tr>
							<tr><td nowrap>&nbsp;</td></tr>
							<tr>
								<td colspan="2" align="center">		
									
									<strong>Day of Week and Time of Day Access</strong><br><br>
									<table cellspacing="0" cellpadding="4" border="0">
										<tr bgcolor="DCE3EB">
											<td colspan="2" align="center">
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													<strong>Day</strong>
												</font>
											</td>
											<td>&nbsp;</td>
											<td colspan="6" align="center">
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													<strong>Start Access Time</strong>
												</font>
											</td>
											<td>&nbsp;</td>
											<td colspan="6" align="center">
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													<strong>End Access Time</strong>
												</font>
											</td>
											<td>&nbsp;</td>
										</tr>
										
										<!--- Mon --->
										<cfif IsDate(getWorkGroup.MondayStart) AND IsDate(getWorkGroup.MondayEnd)>											
											<cfset mondayChecked = "checked">
											
											<cfif hour(getWorkGroup.MondayStart) LTE 0>							
												<cfset accessMondayStartHour = 12>					
											<cfelse>
												<cfset accessMondayStartHour = hour(getWorkGroup.MondayStart)>
											</cfif>
											<cfset accessMondayStartMinute = minute(getWorkGroup.MondayStart)>
											<cfif datePart("h", getWorkGroup.MondayStart) GTE 12>
												<cfset accessMondayStartAMPM = "PM">
											<cfelse>
												<cfset accessMondayStartAMPM = "AM"> 
											</cfif>
											
											<cfset accessMondayEndHour = hour(getWorkGroup.MondayEnd)>
											<cfset accessMondayEndMinute = minute(getWorkGroup.MondayEnd)>
											<cfif datePart("h", getWorkGroup.MondayEnd) GTE 12>
												<cfset accessMondayEndAMPM = "PM">
											<cfelse>
												<cfset accessMondayEndAMPM = "AM"> 
											</cfif>
											
										<cfelse>
											<cfset mondayChecked = "">	
											<cfset accessMondayStartHour = "7">
											<cfset accessMondayStartMinute = "30">
											<cfset accessMondayStartAMPM = "AM">
											<cfset accessMondayEndHour = "5">
											<cfset accessMondayEndMinute = "00">
											<cfset accessMondayEndAMPM = "PM">
										</cfif>										
										<tr>
										    <td nowrap><input type="Checkbox" name="accessMonday" #trim(mondayChecked)#></td>										    
											<td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													<strong>Monday</strong>
												</font>
												<!---<font size="1" color="FF0000">[#getWorkGroup.MondayStart# - #getWorkGroup.MondayEnd#]</font>--->
											</td>
										    <td nowrap>&nbsp;</td>
											<td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													Start:
												</font>
											</td>											
										    <td nowrap>
												<select class="SiteSelectBox" name="accessMondayStartHour">
													<option value="01" <cfif accessMondayStartHour EQ 01>SELECTED</cfif>>01<option value="02" <cfif accessMondayStartHour EQ 02>SELECTED</cfif>>02<option value="03" <cfif accessMondayStartHour EQ 03>SELECTED</cfif>>03<option value="04" <cfif accessMondayStartHour EQ 04>SELECTED</cfif>>04<option value="05" <cfif accessMondayStartHour EQ 05>SELECTED</cfif>>05<option value="06" <cfif accessMondayStartHour EQ 06>SELECTED</cfif>>06<option value="07" <cfif accessMondayStartHour EQ 07>SELECTED</cfif>>07<option value="08" <cfif accessMondayStartHour EQ 08>SELECTED</cfif>>08<option value="09" <cfif accessMondayStartHour EQ 09>SELECTED</cfif>>09<option value="10" <cfif accessMondayStartHour EQ 10>SELECTED</cfif>>10<option value="11" <cfif accessMondayStartHour EQ 11>SELECTED</cfif>>11<option value="12" <cfif accessMondayStartHour EQ 12 OR accessMondayStartHour LTE 0>SELECTED</cfif>>12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessMondayStartMinute">
													<option value="00" <cfif accessMondayStartMinute EQ 00>SELECTED</cfif>>00<option value="05" <cfif accessMondayStartMinute EQ 05>SELECTED</cfif>>05<option value="10" <cfif accessMondayStartMinute EQ 10>SELECTED</cfif>>10<option value="15" <cfif accessMondayStartMinute EQ 15>SELECTED</cfif>>15<option value="20" <cfif accessMondayStartMinute EQ 20>SELECTED</cfif>>20<option value="25" <cfif accessMondayStartMinute EQ 25>SELECTED</cfif>>25<option value="30" <cfif accessMondayStartMinute EQ 30>SELECTED</cfif>>30<option value="35" <cfif accessMondayStartMinute EQ 35>SELECTED</cfif>>35<option value="40" <cfif accessMondayStartMinute EQ 40>SELECTED</cfif>>40<option value="45" <cfif accessMondayStartMinute EQ 45>SELECTED</cfif>>45<option value="50" <cfif accessMondayStartMinute EQ 50>SELECTED</cfif>>50<option value="55" <cfif accessMondayStartMinute EQ 55>SELECTED</cfif>>55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessMondayStartAMPM">
													<option value="AM" <cfif accessMondayStartAMPM EQ "AM">SELECTED</cfif>>AM<option value="PM"  <cfif accessMondayStartAMPM EQ "PM">SELECTED</cfif>>PM																							
												</select>
											</td>
										    <td nowrap>&nbsp;</td>
										    <td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													End:
												</font>
											</td>											   
											<td nowrap>
												<select class="SiteSelectBox" name="accessMondayEndHour">
													<option value="01" <cfif accessMondayEndHour EQ 01 OR accessMondayEndHour EQ 13>SELECTED</cfif>>01<option value="02" <cfif accessMondayEndHour EQ 02 OR accessMondayEndHour EQ 14>SELECTED</cfif>>02<option value="03" <cfif accessMondayEndHour EQ 03 OR accessMondayEndHour EQ 15>SELECTED</cfif>>03<option value="04" <cfif accessMondayEndHour EQ 04 OR accessMondayEndHour EQ 16>SELECTED</cfif>>04<option value="05" <cfif accessMondayEndHour EQ 05 OR accessMondayEndHour EQ 17>SELECTED</cfif>>05<option value="06" <cfif accessMondayEndHour EQ 06 OR accessMondayEndHour EQ 18>SELECTED</cfif>>06<option value="07" <cfif accessMondayEndHour EQ 07 OR accessMondayEndHour EQ 19>SELECTED</cfif>>07<option value="08" <cfif accessMondayEndHour EQ 08 OR accessMondayEndHour EQ 20>SELECTED</cfif>>08<option value="09" <cfif accessMondayEndHour EQ 09 OR accessMondayEndHour EQ 21>SELECTED</cfif>>09<option value="10" <cfif accessMondayEndHour EQ 10 OR accessMondayEndHour EQ 22>SELECTED</cfif>>10<option value="11" <cfif accessMondayEndHour EQ 11 OR accessMondayEndHour EQ 23>SELECTED</cfif>>11<option value="12" <cfif accessMondayEndHour EQ 12 OR accessMondayEndHour EQ 24 or accessMondayEndHour LTE 0>SELECTED</cfif>>12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessMondayEndMinute">
													<option value="00" <cfif accessMondayEndMinute EQ 00>SELECTED</cfif>>00<option value="05" <cfif accessMondayEndMinute EQ 05>SELECTED</cfif>>05<option value="10" <cfif accessMondayEndMinute EQ 10>SELECTED</cfif>>10<option value="15" <cfif accessMondayEndMinute EQ 15>SELECTED</cfif>>15<option value="20" <cfif accessMondayEndMinute EQ 20>SELECTED</cfif>>20<option value="25" <cfif accessMondayEndMinute EQ 25>SELECTED</cfif>>25<option value="30" <cfif accessMondayEndMinute EQ 30>SELECTED</cfif>>30<option value="35" <cfif accessMondayEndMinute EQ 35>SELECTED</cfif>>35<option value="40" <cfif accessMondayEndMinute EQ 40>SELECTED</cfif>>40<option value="45" <cfif accessMondayEndMinute EQ 45>SELECTED</cfif>>45<option value="50" <cfif accessMondayEndMinute EQ 50>SELECTED</cfif>>50<option value="55" <cfif accessMondayEndMinute EQ 55>SELECTED</cfif>>55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessMondayEndAMPM">
													<option value="AM" <cfif accessMondayEndAMPM EQ "AM">SELECTED</cfif>>AM<option value="PM"  <cfif accessMondayEndAMPM EQ "PM">SELECTED</cfif>>PM																							
												</select>
											</td>
										</tr>
										
										<!--- Tuesday --->
										<cfif IsDate(getWorkGroup.TuesdayStart) AND IsDate(getWorkGroup.TuesdayEnd)>											
											<cfset TuesdayChecked = "checked">
											
											<cfif hour(getWorkGroup.TuesdayStart) LTE 0>							
												<cfset accessTuesdayStartHour = 12>					
											<cfelse>
												<cfset accessTuesdayStartHour = hour(getWorkGroup.TuesdayStart)>
											</cfif>
											<cfset accessTuesdayStartMinute = minute(getWorkGroup.TuesdayStart)>
											<cfif datePart("h", getWorkGroup.TuesdayStart) GTE 12>
												<cfset accessTuesdayStartAMPM = "PM">
											<cfelse>
												<cfset accessTuesdayStartAMPM = "AM"> 
											</cfif>
											
											<cfset accessTuesdayEndHour = hour(getWorkGroup.TuesdayEnd)>
											<cfset accessTuesdayEndMinute = minute(getWorkGroup.TuesdayEnd)>
											<cfif datePart("h", getWorkGroup.TuesdayEnd) GTE 12>
												<cfset accessTuesdayEndAMPM = "PM">
											<cfelse>
												<cfset accessTuesdayEndAMPM = "AM"> 
											</cfif>
											
										<cfelse>
											<cfset TuesdayChecked = "">	
											<cfset accessTuesdayStartHour = "7">
											<cfset accessTuesdayStartMinute = "30">
											<cfset accessTuesdayStartAMPM = "AM">
											<cfset accessTuesdayEndHour = "5">
											<cfset accessTuesdayEndMinute = "00">
											<cfset accessTuesdayEndAMPM = "PM">
										</cfif>										
										<tr bgcolor="lightgrey">
										    <td nowrap><input type="Checkbox" name="accessTuesday" #trim(TuesdayChecked)#></td>										    
											<td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													<strong>Tuesday</strong>
												</font>
											</td>
										    <td nowrap>&nbsp;</td>
											<td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													Start:
												</font>
											</td>											
										    <td nowrap>
												<select class="SiteSelectBox" name="accessTuesdayStartHour">
													<option value="01" <cfif accessTuesdayStartHour EQ 01>SELECTED</cfif>>01<option value="02" <cfif accessTuesdayStartHour EQ 02>SELECTED</cfif>>02<option value="03" <cfif accessTuesdayStartHour EQ 03>SELECTED</cfif>>03<option value="04" <cfif accessTuesdayStartHour EQ 04>SELECTED</cfif>>04<option value="05" <cfif accessTuesdayStartHour EQ 05>SELECTED</cfif>>05<option value="06" <cfif accessTuesdayStartHour EQ 06>SELECTED</cfif>>06<option value="07" <cfif accessTuesdayStartHour EQ 07>SELECTED</cfif>>07<option value="08" <cfif accessTuesdayStartHour EQ 08>SELECTED</cfif>>08<option value="09" <cfif accessTuesdayStartHour EQ 09>SELECTED</cfif>>09<option value="10" <cfif accessTuesdayStartHour EQ 10>SELECTED</cfif>>10<option value="11" <cfif accessTuesdayStartHour EQ 11>SELECTED</cfif>>11<option value="12" <cfif accessTuesdayStartHour EQ 12>SELECTED</cfif>>12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessTuesdayStartMinute">
													<option value="00" <cfif accessTuesdayStartMinute EQ 00>SELECTED</cfif>>00<option value="05" <cfif accessTuesdayStartMinute EQ 05>SELECTED</cfif>>05<option value="10" <cfif accessTuesdayStartMinute EQ 10>SELECTED</cfif>>10<option value="15" <cfif accessTuesdayStartMinute EQ 15>SELECTED</cfif>>15<option value="20" <cfif accessTuesdayStartMinute EQ 20>SELECTED</cfif>>20<option value="25" <cfif accessTuesdayStartMinute EQ 25>SELECTED</cfif>>25<option value="30" <cfif accessTuesdayStartMinute EQ 30>SELECTED</cfif>>30<option value="35" <cfif accessTuesdayStartMinute EQ 35>SELECTED</cfif>>35<option value="40" <cfif accessTuesdayStartMinute EQ 40>SELECTED</cfif>>40<option value="45" <cfif accessTuesdayStartMinute EQ 45>SELECTED</cfif>>45<option value="50" <cfif accessTuesdayStartMinute EQ 50>SELECTED</cfif>>50<option value="55" <cfif accessTuesdayStartMinute EQ 55>SELECTED</cfif>>55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessTuesdayStartAMPM">
													<option value="AM" <cfif accessTuesdayStartAMPM EQ "AM">SELECTED</cfif>>AM<option value="PM"  <cfif accessTuesdayStartAMPM EQ "PM">SELECTED</cfif>>PM																							
												</select>
											</td>
										    <td nowrap>&nbsp;</td>
										    <td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													End:
												</font>
											</td>											   
											<td nowrap>
												<select class="SiteSelectBox" name="accessTuesdayEndHour">
													<option value="01" <cfif accessTuesdayEndHour EQ 01 OR accessTuesdayEndHour EQ 13>SELECTED</cfif>>01<option value="02" <cfif accessTuesdayEndHour EQ 02 OR accessTuesdayEndHour EQ 14>SELECTED</cfif>>02<option value="03" <cfif accessTuesdayEndHour EQ 03 OR accessTuesdayEndHour EQ 15>SELECTED</cfif>>03<option value="04" <cfif accessTuesdayEndHour EQ 04 OR accessTuesdayEndHour EQ 16>SELECTED</cfif>>04<option value="05" <cfif accessTuesdayEndHour EQ 05 OR accessTuesdayEndHour EQ 17>SELECTED</cfif>>05<option value="06" <cfif accessTuesdayEndHour EQ 06 OR accessTuesdayEndHour EQ 18>SELECTED</cfif>>06<option value="07" <cfif accessTuesdayEndHour EQ 07 OR accessTuesdayEndHour EQ 19>SELECTED</cfif>>07<option value="08" <cfif accessTuesdayEndHour EQ 08 OR accessTuesdayEndHour EQ 20>SELECTED</cfif>>08<option value="09" <cfif accessTuesdayEndHour EQ 09 OR accessTuesdayEndHour EQ 21>SELECTED</cfif>>09<option value="10" <cfif accessTuesdayEndHour EQ 10 OR accessTuesdayEndHour EQ 22>SELECTED</cfif>>10<option value="11" <cfif accessTuesdayEndHour EQ 11 OR accessTuesdayEndHour EQ 23>SELECTED</cfif>>11<option value="12" <cfif accessTuesdayEndHour EQ 12 OR accessTuesdayEndHour EQ 24>SELECTED</cfif>>12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessTuesdayEndMinute">
													<option value="00" <cfif accessTuesdayEndMinute EQ 00>SELECTED</cfif>>00<option value="05" <cfif accessTuesdayEndMinute EQ 05>SELECTED</cfif>>05<option value="10" <cfif accessTuesdayEndMinute EQ 10>SELECTED</cfif>>10<option value="15" <cfif accessTuesdayEndMinute EQ 15>SELECTED</cfif>>15<option value="20" <cfif accessTuesdayEndMinute EQ 20>SELECTED</cfif>>20<option value="25" <cfif accessTuesdayEndMinute EQ 25>SELECTED</cfif>>25<option value="30" <cfif accessTuesdayEndMinute EQ 30>SELECTED</cfif>>30<option value="35" <cfif accessTuesdayEndMinute EQ 35>SELECTED</cfif>>35<option value="40" <cfif accessTuesdayEndMinute EQ 40>SELECTED</cfif>>40<option value="45" <cfif accessTuesdayEndMinute EQ 45>SELECTED</cfif>>45<option value="50" <cfif accessTuesdayEndMinute EQ 50>SELECTED</cfif>>50<option value="55" <cfif accessTuesdayEndMinute EQ 55>SELECTED</cfif>>55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessTuesdayEndAMPM">
													<option value="AM" <cfif accessTuesdayEndAMPM EQ "AM">SELECTED</cfif>>AM<option value="PM"  <cfif accessTuesdayEndAMPM EQ "PM">SELECTED</cfif>>PM																							
												</select>
											</td>
										</tr>
																				
										<!--- Wednesday --->
										<cfif IsDate(getWorkGroup.WednesdayStart) AND IsDate(getWorkGroup.WednesdayEnd)>											
											<cfset WednesdayChecked = "checked">
											
											<cfif hour(getWorkGroup.WednesdayStart) LTE 0>							
												<cfset accessWednesdayStartHour = 12>					
											<cfelse>
												<cfset accessWednesdayStartHour = hour(getWorkGroup.WednesdayStart)>
											</cfif>
											<cfset accessWednesdayStartMinute = minute(getWorkGroup.WednesdayStart)>
											<cfif datePart("h", getWorkGroup.WednesdayStart) GTE 12>
												<cfset accessWednesdayStartAMPM = "PM">
											<cfelse>
												<cfset accessWednesdayStartAMPM = "AM"> 
											</cfif>
											
											<cfset accessWednesdayEndHour = hour(getWorkGroup.WednesdayEnd)>
											<cfset accessWednesdayEndMinute = minute(getWorkGroup.WednesdayEnd)>
											<cfif datePart("h", getWorkGroup.WednesdayEnd) GTE 12>
												<cfset accessWednesdayEndAMPM = "PM">
											<cfelse>
												<cfset accessWednesdayEndAMPM = "AM"> 
											</cfif>
											
										<cfelse>
											<cfset WednesdayChecked = "">	
											<cfset accessWednesdayStartHour = "7">
											<cfset accessWednesdayStartMinute = "30">
											<cfset accessWednesdayStartAMPM = "AM">
											<cfset accessWednesdayEndHour = "5">
											<cfset accessWednesdayEndMinute = "00">
											<cfset accessWednesdayEndAMPM = "PM">
										</cfif>										
										<tr>
										    <td nowrap><input type="Checkbox" name="accessWednesday" #trim(WednesdayChecked)#></td>										    
											<td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													<strong>Wednesday</strong>
												</font>
											</td>
										    <td nowrap>&nbsp;</td>
											<td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													Start:
												</font>
											</td>											
										    <td nowrap>
												<select class="SiteSelectBox" name="accessWednesdayStartHour">
													<option value="01" <cfif accessWednesdayStartHour EQ 01>SELECTED</cfif>>01<option value="02" <cfif accessWednesdayStartHour EQ 02>SELECTED</cfif>>02<option value="03" <cfif accessWednesdayStartHour EQ 03>SELECTED</cfif>>03<option value="04" <cfif accessWednesdayStartHour EQ 04>SELECTED</cfif>>04<option value="05" <cfif accessWednesdayStartHour EQ 05>SELECTED</cfif>>05<option value="06" <cfif accessWednesdayStartHour EQ 06>SELECTED</cfif>>06<option value="07" <cfif accessWednesdayStartHour EQ 07>SELECTED</cfif>>07<option value="08" <cfif accessWednesdayStartHour EQ 08>SELECTED</cfif>>08<option value="09" <cfif accessWednesdayStartHour EQ 09>SELECTED</cfif>>09<option value="10" <cfif accessWednesdayStartHour EQ 10>SELECTED</cfif>>10<option value="11" <cfif accessWednesdayStartHour EQ 11>SELECTED</cfif>>11<option value="12" <cfif accessWednesdayStartHour EQ 12>SELECTED</cfif>>12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessWednesdayStartMinute">
													<option value="00" <cfif accessWednesdayStartMinute EQ 00>SELECTED</cfif>>00<option value="05" <cfif accessWednesdayStartMinute EQ 05>SELECTED</cfif>>05<option value="10" <cfif accessWednesdayStartMinute EQ 10>SELECTED</cfif>>10<option value="15" <cfif accessWednesdayStartMinute EQ 15>SELECTED</cfif>>15<option value="20" <cfif accessWednesdayStartMinute EQ 20>SELECTED</cfif>>20<option value="25" <cfif accessWednesdayStartMinute EQ 25>SELECTED</cfif>>25<option value="30" <cfif accessWednesdayStartMinute EQ 30>SELECTED</cfif>>30<option value="35" <cfif accessWednesdayStartMinute EQ 35>SELECTED</cfif>>35<option value="40" <cfif accessWednesdayStartMinute EQ 40>SELECTED</cfif>>40<option value="45" <cfif accessWednesdayStartMinute EQ 45>SELECTED</cfif>>45<option value="50" <cfif accessWednesdayStartMinute EQ 50>SELECTED</cfif>>50<option value="55" <cfif accessWednesdayStartMinute EQ 55>SELECTED</cfif>>55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessWednesdayStartAMPM">
													<option value="AM" <cfif accessWednesdayStartAMPM EQ "AM">SELECTED</cfif>>AM<option value="PM"  <cfif accessWednesdayStartAMPM EQ "PM">SELECTED</cfif>>PM																							
												</select>
											</td>
										    <td nowrap>&nbsp;</td>
										    <td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													End:
												</font>
											</td>											   
											<td nowrap>
												<select class="SiteSelectBox" name="accessWednesdayEndHour">
													<option value="01" <cfif accessWednesdayEndHour EQ 01 OR accessWednesdayEndHour EQ 13>SELECTED</cfif>>01<option value="02" <cfif accessWednesdayEndHour EQ 02 OR accessWednesdayEndHour EQ 14>SELECTED</cfif>>02<option value="03" <cfif accessWednesdayEndHour EQ 03 OR accessWednesdayEndHour EQ 15>SELECTED</cfif>>03<option value="04" <cfif accessWednesdayEndHour EQ 04 OR accessWednesdayEndHour EQ 16>SELECTED</cfif>>04<option value="05" <cfif accessWednesdayEndHour EQ 05 OR accessWednesdayEndHour EQ 17>SELECTED</cfif>>05<option value="06" <cfif accessWednesdayEndHour EQ 06 OR accessWednesdayEndHour EQ 18>SELECTED</cfif>>06<option value="07" <cfif accessWednesdayEndHour EQ 07 OR accessWednesdayEndHour EQ 19>SELECTED</cfif>>07<option value="08" <cfif accessWednesdayEndHour EQ 08 OR accessWednesdayEndHour EQ 20>SELECTED</cfif>>08<option value="09" <cfif accessWednesdayEndHour EQ 09 OR accessWednesdayEndHour EQ 21>SELECTED</cfif>>09<option value="10" <cfif accessWednesdayEndHour EQ 10 OR accessWednesdayEndHour EQ 22>SELECTED</cfif>>10<option value="11" <cfif accessWednesdayEndHour EQ 11 OR accessWednesdayEndHour EQ 23>SELECTED</cfif>>11<option value="12" <cfif accessWednesdayEndHour EQ 12 OR accessWednesdayEndHour EQ 24>SELECTED</cfif>>12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessWednesdayEndMinute">
													<option value="00" <cfif accessWednesdayEndMinute EQ 00>SELECTED</cfif>>00<option value="05" <cfif accessWednesdayEndMinute EQ 05>SELECTED</cfif>>05<option value="10" <cfif accessWednesdayEndMinute EQ 10>SELECTED</cfif>>10<option value="15" <cfif accessWednesdayEndMinute EQ 15>SELECTED</cfif>>15<option value="20" <cfif accessWednesdayEndMinute EQ 20>SELECTED</cfif>>20<option value="25" <cfif accessWednesdayEndMinute EQ 25>SELECTED</cfif>>25<option value="30" <cfif accessWednesdayEndMinute EQ 30>SELECTED</cfif>>30<option value="35" <cfif accessWednesdayEndMinute EQ 35>SELECTED</cfif>>35<option value="40" <cfif accessWednesdayEndMinute EQ 40>SELECTED</cfif>>40<option value="45" <cfif accessWednesdayEndMinute EQ 45>SELECTED</cfif>>45<option value="50" <cfif accessWednesdayEndMinute EQ 50>SELECTED</cfif>>50<option value="55" <cfif accessWednesdayEndMinute EQ 55>SELECTED</cfif>>55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessWednesdayEndAMPM">
													<option value="AM" <cfif accessWednesdayEndAMPM EQ "AM">SELECTED</cfif>>AM<option value="PM"  <cfif accessWednesdayEndAMPM EQ "PM">SELECTED</cfif>>PM																							
												</select>
											</td>
										</tr>
																				
										<!--- Thursday --->
										<cfif IsDate(getWorkGroup.ThursdayStart) AND IsDate(getWorkGroup.ThursdayEnd)>											
											<cfset ThursdayChecked = "checked">
											
											<cfif hour(getWorkGroup.ThursdayStart) LTE 0>							
												<cfset accessThursdayStartHour = 12>					
											<cfelse>
												<cfset accessThursdayStartHour = hour(getWorkGroup.ThursdayStart)>
											</cfif>
											<cfset accessThursdayStartMinute = minute(getWorkGroup.ThursdayStart)>
											<cfif datePart("h", getWorkGroup.ThursdayStart) GTE 12>
												<cfset accessThursdayStartAMPM = "PM">
											<cfelse>
												<cfset accessThursdayStartAMPM = "AM"> 
											</cfif>
											
											<cfset accessThursdayEndHour = hour(getWorkGroup.ThursdayEnd)>
											<cfset accessThursdayEndMinute = minute(getWorkGroup.ThursdayEnd)>
											<cfif datePart("h", getWorkGroup.ThursdayEnd) GTE 12>
												<cfset accessThursdayEndAMPM = "PM">
											<cfelse>
												<cfset accessThursdayEndAMPM = "AM"> 
											</cfif>
											
										<cfelse>
											<cfset ThursdayChecked = "">	
											<cfset accessThursdayStartHour = "7">
											<cfset accessThursdayStartMinute = "30">
											<cfset accessThursdayStartAMPM = "AM">
											<cfset accessThursdayEndHour = "5">
											<cfset accessThursdayEndMinute = "00">
											<cfset accessThursdayEndAMPM = "PM">
										</cfif>						
										<tr bgcolor="lightgrey">
										    <td nowrap><input type="Checkbox" name="accessThursday" #trim(ThursdayChecked)#></td>										    
											<td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													<strong>Thursday</strong>
												</font>
											</td>
										    <td nowrap>&nbsp;</td>
											<td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													Start:
												</font>
											</td>											
										    <td nowrap>
												<select class="SiteSelectBox" name="accessThursdayStartHour">
													<option value="01" <cfif accessThursdayStartHour EQ 01>SELECTED</cfif>>01<option value="02" <cfif accessThursdayStartHour EQ 02>SELECTED</cfif>>02<option value="03" <cfif accessThursdayStartHour EQ 03>SELECTED</cfif>>03<option value="04" <cfif accessThursdayStartHour EQ 04>SELECTED</cfif>>04<option value="05" <cfif accessThursdayStartHour EQ 05>SELECTED</cfif>>05<option value="06" <cfif accessThursdayStartHour EQ 06>SELECTED</cfif>>06<option value="07" <cfif accessThursdayStartHour EQ 07>SELECTED</cfif>>07<option value="08" <cfif accessThursdayStartHour EQ 08>SELECTED</cfif>>08<option value="09" <cfif accessThursdayStartHour EQ 09>SELECTED</cfif>>09<option value="10" <cfif accessThursdayStartHour EQ 10>SELECTED</cfif>>10<option value="11" <cfif accessThursdayStartHour EQ 11>SELECTED</cfif>>11<option value="12" <cfif accessThursdayStartHour EQ 12>SELECTED</cfif>>12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessThursdayStartMinute">
													<option value="00" <cfif accessThursdayStartMinute EQ 00>SELECTED</cfif>>00<option value="05" <cfif accessThursdayStartMinute EQ 05>SELECTED</cfif>>05<option value="10" <cfif accessThursdayStartMinute EQ 10>SELECTED</cfif>>10<option value="15" <cfif accessThursdayStartMinute EQ 15>SELECTED</cfif>>15<option value="20" <cfif accessThursdayStartMinute EQ 20>SELECTED</cfif>>20<option value="25" <cfif accessThursdayStartMinute EQ 25>SELECTED</cfif>>25<option value="30" <cfif accessThursdayStartMinute EQ 30>SELECTED</cfif>>30<option value="35" <cfif accessThursdayStartMinute EQ 35>SELECTED</cfif>>35<option value="40" <cfif accessThursdayStartMinute EQ 40>SELECTED</cfif>>40<option value="45" <cfif accessThursdayStartMinute EQ 45>SELECTED</cfif>>45<option value="50" <cfif accessThursdayStartMinute EQ 50>SELECTED</cfif>>50<option value="55" <cfif accessThursdayStartMinute EQ 55>SELECTED</cfif>>55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessThursdayStartAMPM">
													<option value="AM" <cfif accessThursdayStartAMPM EQ "AM">SELECTED</cfif>>AM<option value="PM"  <cfif accessThursdayStartAMPM EQ "PM">SELECTED</cfif>>PM																							
												</select>
											</td>
										    <td nowrap>&nbsp;</td>
										    <td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													End:
												</font>
											</td>											   
											<td nowrap>
												<select class="SiteSelectBox" name="accessThursdayEndHour">
													<option value="01" <cfif accessThursdayEndHour EQ 01 OR accessThursdayEndHour EQ 13>SELECTED</cfif>>01<option value="02" <cfif accessThursdayEndHour EQ 02 OR accessThursdayEndHour EQ 14>SELECTED</cfif>>02<option value="03" <cfif accessThursdayEndHour EQ 03 OR accessThursdayEndHour EQ 15>SELECTED</cfif>>03<option value="04" <cfif accessThursdayEndHour EQ 04 OR accessThursdayEndHour EQ 16>SELECTED</cfif>>04<option value="05" <cfif accessThursdayEndHour EQ 05 OR accessThursdayEndHour EQ 17>SELECTED</cfif>>05<option value="06" <cfif accessThursdayEndHour EQ 06 OR accessThursdayEndHour EQ 18>SELECTED</cfif>>06<option value="07" <cfif accessThursdayEndHour EQ 07 OR accessThursdayEndHour EQ 19>SELECTED</cfif>>07<option value="08" <cfif accessThursdayEndHour EQ 08 OR accessThursdayEndHour EQ 20>SELECTED</cfif>>08<option value="09" <cfif accessThursdayEndHour EQ 09 OR accessThursdayEndHour EQ 21>SELECTED</cfif>>09<option value="10" <cfif accessThursdayEndHour EQ 10 OR accessThursdayEndHour EQ 22>SELECTED</cfif>>10<option value="11" <cfif accessThursdayEndHour EQ 11 OR accessThursdayEndHour EQ 23>SELECTED</cfif>>11<option value="12" <cfif accessThursdayEndHour EQ 12 OR accessThursdayEndHour EQ 24>SELECTED</cfif>>12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessThursdayEndMinute">
													<option value="00" <cfif accessThursdayEndMinute EQ 00>SELECTED</cfif>>00<option value="05" <cfif accessThursdayEndMinute EQ 05>SELECTED</cfif>>05<option value="10" <cfif accessThursdayEndMinute EQ 10>SELECTED</cfif>>10<option value="15" <cfif accessThursdayEndMinute EQ 15>SELECTED</cfif>>15<option value="20" <cfif accessThursdayEndMinute EQ 20>SELECTED</cfif>>20<option value="25" <cfif accessThursdayEndMinute EQ 25>SELECTED</cfif>>25<option value="30" <cfif accessThursdayEndMinute EQ 30>SELECTED</cfif>>30<option value="35" <cfif accessThursdayEndMinute EQ 35>SELECTED</cfif>>35<option value="40" <cfif accessThursdayEndMinute EQ 40>SELECTED</cfif>>40<option value="45" <cfif accessThursdayEndMinute EQ 45>SELECTED</cfif>>45<option value="50" <cfif accessThursdayEndMinute EQ 50>SELECTED</cfif>>50<option value="55" <cfif accessThursdayEndMinute EQ 55>SELECTED</cfif>>55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessThursdayEndAMPM">
													<option value="AM" <cfif accessThursdayEndAMPM EQ "AM">SELECTED</cfif>>AM<option value="PM"  <cfif accessThursdayEndAMPM EQ "PM">SELECTED</cfif>>PM																							
												</select>
											</td>
										</tr>
										
										<!--- Friday --->
										<cfif IsDate(getWorkGroup.FridayStart) AND IsDate(getWorkGroup.FridayEnd)>											
											<cfset FridayChecked = "checked">
											
											<cfif hour(getWorkGroup.FridayStart) LTE 0>							
												<cfset accessFridayStartHour = 12>					
											<cfelse>
												<cfset accessFridayStartHour = hour(getWorkGroup.FridayStart)>
											</cfif>
											<cfset accessFridayStartMinute = minute(getWorkGroup.FridayStart)>
											<cfif datePart("h", getWorkGroup.FridayStart) GTE 12>
												<cfset accessFridayStartAMPM = "PM">
											<cfelse>
												<cfset accessFridayStartAMPM = "AM"> 
											</cfif>
											
											<cfset accessFridayEndHour = hour(getWorkGroup.FridayEnd)>
											<cfset accessFridayEndMinute = minute(getWorkGroup.FridayEnd)>
											<cfif datePart("h", getWorkGroup.FridayEnd) GTE 12>
												<cfset accessFridayEndAMPM = "PM">
											<cfelse>
												<cfset accessFridayEndAMPM = "AM"> 
											</cfif>
											
										<cfelse>
											<cfset FridayChecked = "">	
											<cfset accessFridayStartHour = "7">
											<cfset accessFridayStartMinute = "30">
											<cfset accessFridayStartAMPM = "AM">
											<cfset accessFridayEndHour = "5">
											<cfset accessFridayEndMinute = "00">
											<cfset accessFridayEndAMPM = "PM">
										</cfif>						
										<tr>
										    <td nowrap><input type="Checkbox" name="accessFriday" #trim(FridayChecked)#></td>										    
											<td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													<strong>Friday</strong>
												</font>
											</td>
										    <td nowrap>&nbsp;</td>
											<td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													Start:
												</font>
											</td>											
										    <td nowrap>
												<select class="SiteSelectBox" name="accessFridayStartHour">
													<option value="01" <cfif accessFridayStartHour EQ 01>SELECTED</cfif>>01<option value="02" <cfif accessFridayStartHour EQ 02>SELECTED</cfif>>02<option value="03" <cfif accessFridayStartHour EQ 03>SELECTED</cfif>>03<option value="04" <cfif accessFridayStartHour EQ 04>SELECTED</cfif>>04<option value="05" <cfif accessFridayStartHour EQ 05>SELECTED</cfif>>05<option value="06" <cfif accessFridayStartHour EQ 06>SELECTED</cfif>>06<option value="07" <cfif accessFridayStartHour EQ 07>SELECTED</cfif>>07<option value="08" <cfif accessFridayStartHour EQ 08>SELECTED</cfif>>08<option value="09" <cfif accessFridayStartHour EQ 09>SELECTED</cfif>>09<option value="10" <cfif accessFridayStartHour EQ 10>SELECTED</cfif>>10<option value="11" <cfif accessFridayStartHour EQ 11>SELECTED</cfif>>11<option value="12" <cfif accessFridayStartHour EQ 12>SELECTED</cfif>>12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessFridayStartMinute">
													<option value="00" <cfif accessFridayStartMinute EQ 00>SELECTED</cfif>>00<option value="05" <cfif accessFridayStartMinute EQ 05>SELECTED</cfif>>05<option value="10" <cfif accessFridayStartMinute EQ 10>SELECTED</cfif>>10<option value="15" <cfif accessFridayStartMinute EQ 15>SELECTED</cfif>>15<option value="20" <cfif accessFridayStartMinute EQ 20>SELECTED</cfif>>20<option value="25" <cfif accessFridayStartMinute EQ 25>SELECTED</cfif>>25<option value="30" <cfif accessFridayStartMinute EQ 30>SELECTED</cfif>>30<option value="35" <cfif accessFridayStartMinute EQ 35>SELECTED</cfif>>35<option value="40" <cfif accessFridayStartMinute EQ 40>SELECTED</cfif>>40<option value="45" <cfif accessFridayStartMinute EQ 45>SELECTED</cfif>>45<option value="50" <cfif accessFridayStartMinute EQ 50>SELECTED</cfif>>50<option value="55" <cfif accessFridayStartMinute EQ 55>SELECTED</cfif>>55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessFridayStartAMPM">
													<option value="AM" <cfif accessFridayStartAMPM EQ "AM">SELECTED</cfif>>AM<option value="PM"  <cfif accessFridayStartAMPM EQ "PM">SELECTED</cfif>>PM																							
												</select>
											</td>
										    <td nowrap>&nbsp;</td>
										    <td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													End:
												</font>
											</td>											   
											<td nowrap>
												<select class="SiteSelectBox" name="accessFridayEndHour">
													<option value="01" <cfif accessFridayEndHour EQ 01 OR accessFridayEndHour EQ 13>SELECTED</cfif>>01<option value="02" <cfif accessFridayEndHour EQ 02 OR accessFridayEndHour EQ 14>SELECTED</cfif>>02<option value="03" <cfif accessFridayEndHour EQ 03 OR accessFridayEndHour EQ 15>SELECTED</cfif>>03<option value="04" <cfif accessFridayEndHour EQ 04 OR accessFridayEndHour EQ 16>SELECTED</cfif>>04<option value="05" <cfif accessFridayEndHour EQ 05 OR accessFridayEndHour EQ 17>SELECTED</cfif>>05<option value="06" <cfif accessFridayEndHour EQ 06 OR accessFridayEndHour EQ 18>SELECTED</cfif>>06<option value="07" <cfif accessFridayEndHour EQ 07 OR accessFridayEndHour EQ 19>SELECTED</cfif>>07<option value="08" <cfif accessFridayEndHour EQ 08 OR accessFridayEndHour EQ 20>SELECTED</cfif>>08<option value="09" <cfif accessFridayEndHour EQ 09 OR accessFridayEndHour EQ 21>SELECTED</cfif>>09<option value="10" <cfif accessFridayEndHour EQ 10 OR accessFridayEndHour EQ 22>SELECTED</cfif>>10<option value="11" <cfif accessFridayEndHour EQ 11 OR accessFridayEndHour EQ 23>SELECTED</cfif>>11<option value="12" <cfif accessFridayEndHour EQ 12 OR accessFridayEndHour EQ 24>SELECTED</cfif>>12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessFridayEndMinute">
													<option value="00" <cfif accessFridayEndMinute EQ 00>SELECTED</cfif>>00<option value="05" <cfif accessFridayEndMinute EQ 05>SELECTED</cfif>>05<option value="10" <cfif accessFridayEndMinute EQ 10>SELECTED</cfif>>10<option value="15" <cfif accessFridayEndMinute EQ 15>SELECTED</cfif>>15<option value="20" <cfif accessFridayEndMinute EQ 20>SELECTED</cfif>>20<option value="25" <cfif accessFridayEndMinute EQ 25>SELECTED</cfif>>25<option value="30" <cfif accessFridayEndMinute EQ 30>SELECTED</cfif>>30<option value="35" <cfif accessFridayEndMinute EQ 35>SELECTED</cfif>>35<option value="40" <cfif accessFridayEndMinute EQ 40>SELECTED</cfif>>40<option value="45" <cfif accessFridayEndMinute EQ 45>SELECTED</cfif>>45<option value="50" <cfif accessFridayEndMinute EQ 50>SELECTED</cfif>>50<option value="55" <cfif accessFridayEndMinute EQ 55>SELECTED</cfif>>55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessFridayEndAMPM">
													<option value="AM" <cfif accessFridayEndAMPM EQ "AM">SELECTED</cfif>>AM<option value="PM"  <cfif accessFridayEndAMPM EQ "PM">SELECTED</cfif>>PM																							
												</select>
											</td>
										</tr>
										
										<!--- Saturday --->
										<cfif IsDate(getWorkGroup.SaturdayStart) AND IsDate(getWorkGroup.SaturdayEnd)>											
											<cfset SaturdayChecked = "checked">
											
											<cfif hour(getWorkGroup.SaturdayStart) LTE 0>							
												<cfset accessSaturdayStartHour = 12>					
											<cfelse>
												<cfset accessSaturdayStartHour = hour(getWorkGroup.SaturdayStart)>
											</cfif>
											<cfset accessSaturdayStartMinute = minute(getWorkGroup.SaturdayStart)>
											<cfif datePart("h", getWorkGroup.SaturdayStart) GTE 12>
												<cfset accessSaturdayStartAMPM = "PM">
											<cfelse>
												<cfset accessSaturdayStartAMPM = "AM"> 
											</cfif>
											
											<cfset accessSaturdayEndHour = hour(getWorkGroup.SaturdayEnd)>
											<cfset accessSaturdayEndMinute = minute(getWorkGroup.SaturdayEnd)>
											<cfif datePart("h", getWorkGroup.SaturdayEnd) GTE 12>
												<cfset accessSaturdayEndAMPM = "PM">
											<cfelse>
												<cfset accessSaturdayEndAMPM = "AM"> 
											</cfif>
											
										<cfelse>
											<cfset SaturdayChecked = "">	
											<cfset accessSaturdayStartHour = "7">
											<cfset accessSaturdayStartMinute = "30">
											<cfset accessSaturdayStartAMPM = "AM">
											<cfset accessSaturdayEndHour = "5">
											<cfset accessSaturdayEndMinute = "00">
											<cfset accessSaturdayEndAMPM = "PM">
										</cfif>							
										<tr bgcolor="lightgrey">
										    <td nowrap><input type="Checkbox" name="accessSaturday" #trim(SaturdayChecked)#></td>										    
											<td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													<strong>Saturday</strong>
												</font>
											</td>
										    <td nowrap>&nbsp;</td>
											<td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													Start:
												</font>
											</td>											
										    <td nowrap>
												<select class="SiteSelectBox" name="accessSaturdayStartHour">
													<option value="01" <cfif accessSaturdayStartHour EQ 01>SELECTED</cfif>>01<option value="02" <cfif accessSaturdayStartHour EQ 02>SELECTED</cfif>>02<option value="03" <cfif accessSaturdayStartHour EQ 03>SELECTED</cfif>>03<option value="04" <cfif accessSaturdayStartHour EQ 04>SELECTED</cfif>>04<option value="05" <cfif accessSaturdayStartHour EQ 05>SELECTED</cfif>>05<option value="06" <cfif accessSaturdayStartHour EQ 06>SELECTED</cfif>>06<option value="07" <cfif accessSaturdayStartHour EQ 07>SELECTED</cfif>>07<option value="08" <cfif accessSaturdayStartHour EQ 08>SELECTED</cfif>>08<option value="09" <cfif accessSaturdayStartHour EQ 09>SELECTED</cfif>>09<option value="10" <cfif accessSaturdayStartHour EQ 10>SELECTED</cfif>>10<option value="11" <cfif accessSaturdayStartHour EQ 11>SELECTED</cfif>>11<option value="12" <cfif accessSaturdayStartHour EQ 12>SELECTED</cfif>>12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessSaturdayStartMinute">
													<option value="00" <cfif accessSaturdayStartMinute EQ 00>SELECTED</cfif>>00<option value="05" <cfif accessSaturdayStartMinute EQ 05>SELECTED</cfif>>05<option value="10" <cfif accessSaturdayStartMinute EQ 10>SELECTED</cfif>>10<option value="15" <cfif accessSaturdayStartMinute EQ 15>SELECTED</cfif>>15<option value="20" <cfif accessSaturdayStartMinute EQ 20>SELECTED</cfif>>20<option value="25" <cfif accessSaturdayStartMinute EQ 25>SELECTED</cfif>>25<option value="30" <cfif accessSaturdayStartMinute EQ 30>SELECTED</cfif>>30<option value="35" <cfif accessSaturdayStartMinute EQ 35>SELECTED</cfif>>35<option value="40" <cfif accessSaturdayStartMinute EQ 40>SELECTED</cfif>>40<option value="45" <cfif accessSaturdayStartMinute EQ 45>SELECTED</cfif>>45<option value="50" <cfif accessSaturdayStartMinute EQ 50>SELECTED</cfif>>50<option value="55" <cfif accessSaturdayStartMinute EQ 55>SELECTED</cfif>>55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessSaturdayStartAMPM">
													<option value="AM" <cfif accessSaturdayStartAMPM EQ "AM">SELECTED</cfif>>AM<option value="PM"  <cfif accessSaturdayStartAMPM EQ "PM">SELECTED</cfif>>PM																							
												</select>
											</td>
										    <td nowrap>&nbsp;</td>
										    <td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													End:
												</font>
											</td>											   
											<td nowrap>
												<select class="SiteSelectBox" name="accessSaturdayEndHour">
													<option value="01" <cfif accessSaturdayEndHour EQ 01 OR accessSaturdayEndHour EQ 13>SELECTED</cfif>>01<option value="02" <cfif accessSaturdayEndHour EQ 02 OR accessSaturdayEndHour EQ 14>SELECTED</cfif>>02<option value="03" <cfif accessSaturdayEndHour EQ 03 OR accessSaturdayEndHour EQ 15>SELECTED</cfif>>03<option value="04" <cfif accessSaturdayEndHour EQ 04 OR accessSaturdayEndHour EQ 16>SELECTED</cfif>>04<option value="05" <cfif accessSaturdayEndHour EQ 05 OR accessSaturdayEndHour EQ 17>SELECTED</cfif>>05<option value="06" <cfif accessSaturdayEndHour EQ 06 OR accessSaturdayEndHour EQ 18>SELECTED</cfif>>06<option value="07" <cfif accessSaturdayEndHour EQ 07 OR accessSaturdayEndHour EQ 19>SELECTED</cfif>>07<option value="08" <cfif accessSaturdayEndHour EQ 08 OR accessSaturdayEndHour EQ 20>SELECTED</cfif>>08<option value="09" <cfif accessSaturdayEndHour EQ 09 OR accessSaturdayEndHour EQ 21>SELECTED</cfif>>09<option value="10" <cfif accessSaturdayEndHour EQ 10 OR accessSaturdayEndHour EQ 22>SELECTED</cfif>>10<option value="11" <cfif accessSaturdayEndHour EQ 11 OR accessSaturdayEndHour EQ 23>SELECTED</cfif>>11<option value="12" <cfif accessSaturdayEndHour EQ 12 OR accessSaturdayEndHour EQ 24>SELECTED</cfif>>12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessSaturdayEndMinute">
													<option value="00" <cfif accessSaturdayEndMinute EQ 00>SELECTED</cfif>>00<option value="05" <cfif accessSaturdayEndMinute EQ 05>SELECTED</cfif>>05<option value="10" <cfif accessSaturdayEndMinute EQ 10>SELECTED</cfif>>10<option value="15" <cfif accessSaturdayEndMinute EQ 15>SELECTED</cfif>>15<option value="20" <cfif accessSaturdayEndMinute EQ 20>SELECTED</cfif>>20<option value="25" <cfif accessSaturdayEndMinute EQ 25>SELECTED</cfif>>25<option value="30" <cfif accessSaturdayEndMinute EQ 30>SELECTED</cfif>>30<option value="35" <cfif accessSaturdayEndMinute EQ 35>SELECTED</cfif>>35<option value="40" <cfif accessSaturdayEndMinute EQ 40>SELECTED</cfif>>40<option value="45" <cfif accessSaturdayEndMinute EQ 45>SELECTED</cfif>>45<option value="50" <cfif accessSaturdayEndMinute EQ 50>SELECTED</cfif>>50<option value="55" <cfif accessSaturdayEndMinute EQ 55>SELECTED</cfif>>55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessSaturdayEndAMPM">
													<option value="AM" <cfif accessSaturdayEndAMPM EQ "AM">SELECTED</cfif>>AM<option value="PM"  <cfif accessSaturdayEndAMPM EQ "PM">SELECTED</cfif>>PM																							
												</select>
											</td>
										</tr>
										
										<!--- Sunday --->
										<cfif IsDate(getWorkGroup.SundayStart) AND IsDate(getWorkGroup.SundayEnd)>											
											<cfset SundayChecked = "checked">
											
											<cfif hour(getWorkGroup.SundayStart) LTE 0>							
												<cfset accessSundayStartHour = 12>					
											<cfelse>
												<cfset accessSundayStartHour = hour(getWorkGroup.SundayStart)>
											</cfif>
											<cfset accessSundayStartMinute = minute(getWorkGroup.SundayStart)>
											<cfif datePart("h", getWorkGroup.SundayStart) GTE 12>
												<cfset accessSundayStartAMPM = "PM">
											<cfelse>
												<cfset accessSundayStartAMPM = "AM"> 
											</cfif>
											
											<cfset accessSundayEndHour = hour(getWorkGroup.SundayEnd)>
											<cfset accessSundayEndMinute = minute(getWorkGroup.SundayEnd)>
											<cfif datePart("h", getWorkGroup.SundayEnd) GTE 12>
												<cfset accessSundayEndAMPM = "PM">
											<cfelse>
												<cfset accessSundayEndAMPM = "AM"> 
											</cfif>
											
										<cfelse>
											<cfset SundayChecked = "">	
											<cfset accessSundayStartHour = "7">
											<cfset accessSundayStartMinute = "30">
											<cfset accessSundayStartAMPM = "AM">
											<cfset accessSundayEndHour = "5">
											<cfset accessSundayEndMinute = "00">
											<cfset accessSundayEndAMPM = "PM">
										</cfif>										
										<tr>
										    <td nowrap><input type="Checkbox" name="accessSunday" #trim(SundayChecked)#></td>										    
											<td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													<strong>Sunday</strong>
												</font>
											</td>
										    <td nowrap>&nbsp;</td>
											<td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													Start:
												</font>
											</td>											
										    <td nowrap>
												<select class="SiteSelectBox" name="accessSundayStartHour">
													<option value="01" <cfif accessSundayStartHour EQ 01>SELECTED</cfif>>01<option value="02" <cfif accessSundayStartHour EQ 02>SELECTED</cfif>>02<option value="03" <cfif accessSundayStartHour EQ 03>SELECTED</cfif>>03<option value="04" <cfif accessSundayStartHour EQ 04>SELECTED</cfif>>04<option value="05" <cfif accessSundayStartHour EQ 05>SELECTED</cfif>>05<option value="06" <cfif accessSundayStartHour EQ 06>SELECTED</cfif>>06<option value="07" <cfif accessSundayStartHour EQ 07>SELECTED</cfif>>07<option value="08" <cfif accessSundayStartHour EQ 08>SELECTED</cfif>>08<option value="09" <cfif accessSundayStartHour EQ 09>SELECTED</cfif>>09<option value="10" <cfif accessSundayStartHour EQ 10>SELECTED</cfif>>10<option value="11" <cfif accessSundayStartHour EQ 11>SELECTED</cfif>>11<option value="12" <cfif accessSundayStartHour EQ 12>SELECTED</cfif>>12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessSundayStartMinute">
													<option value="00" <cfif accessSundayStartMinute EQ 00>SELECTED</cfif>>00<option value="05" <cfif accessSundayStartMinute EQ 05>SELECTED</cfif>>05<option value="10" <cfif accessSundayStartMinute EQ 10>SELECTED</cfif>>10<option value="15" <cfif accessSundayStartMinute EQ 15>SELECTED</cfif>>15<option value="20" <cfif accessSundayStartMinute EQ 20>SELECTED</cfif>>20<option value="25" <cfif accessSundayStartMinute EQ 25>SELECTED</cfif>>25<option value="30" <cfif accessSundayStartMinute EQ 30>SELECTED</cfif>>30<option value="35" <cfif accessSundayStartMinute EQ 35>SELECTED</cfif>>35<option value="40" <cfif accessSundayStartMinute EQ 40>SELECTED</cfif>>40<option value="45" <cfif accessSundayStartMinute EQ 45>SELECTED</cfif>>45<option value="50" <cfif accessSundayStartMinute EQ 50>SELECTED</cfif>>50<option value="55" <cfif accessSundayStartMinute EQ 55>SELECTED</cfif>>55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessSundayStartAMPM">
													<option value="AM" <cfif accessSundayStartAMPM EQ "AM">SELECTED</cfif>>AM<option value="PM"  <cfif accessSundayStartAMPM EQ "PM">SELECTED</cfif>>PM																							
												</select>
											</td>
										    <td nowrap>&nbsp;</td>
										    <td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													End:
												</font>
											</td>											   
											<td nowrap>
												<select class="SiteSelectBox" name="accessSundayEndHour">
													<option value="01" <cfif accessSundayEndHour EQ 01 OR accessSundayEndHour EQ 13>SELECTED</cfif>>01<option value="02" <cfif accessSundayEndHour EQ 02 OR accessSundayEndHour EQ 14>SELECTED</cfif>>02<option value="03" <cfif accessSundayEndHour EQ 03 OR accessSundayEndHour EQ 15>SELECTED</cfif>>03<option value="04" <cfif accessSundayEndHour EQ 04 OR accessSundayEndHour EQ 16>SELECTED</cfif>>04<option value="05" <cfif accessSundayEndHour EQ 05 OR accessSundayEndHour EQ 17>SELECTED</cfif>>05<option value="06" <cfif accessSundayEndHour EQ 06 OR accessSundayEndHour EQ 18>SELECTED</cfif>>06<option value="07" <cfif accessSundayEndHour EQ 07 OR accessSundayEndHour EQ 19>SELECTED</cfif>>07<option value="08" <cfif accessSundayEndHour EQ 08 OR accessSundayEndHour EQ 20>SELECTED</cfif>>08<option value="09" <cfif accessSundayEndHour EQ 09 OR accessSundayEndHour EQ 21>SELECTED</cfif>>09<option value="10" <cfif accessSundayEndHour EQ 10 OR accessSundayEndHour EQ 22>SELECTED</cfif>>10<option value="11" <cfif accessSundayEndHour EQ 11 OR accessSundayEndHour EQ 23>SELECTED</cfif>>11<option value="12" <cfif accessSundayEndHour EQ 12 OR accessSundayEndHour EQ 24>SELECTED</cfif>>12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessSundayEndMinute">
													<option value="00" <cfif accessSundayEndMinute EQ 00>SELECTED</cfif>>00<option value="05" <cfif accessSundayEndMinute EQ 05>SELECTED</cfif>>05<option value="10" <cfif accessSundayEndMinute EQ 10>SELECTED</cfif>>10<option value="15" <cfif accessSundayEndMinute EQ 15>SELECTED</cfif>>15<option value="20" <cfif accessSundayEndMinute EQ 20>SELECTED</cfif>>20<option value="25" <cfif accessSundayEndMinute EQ 25>SELECTED</cfif>>25<option value="30" <cfif accessSundayEndMinute EQ 30>SELECTED</cfif>>30<option value="35" <cfif accessSundayEndMinute EQ 35>SELECTED</cfif>>35<option value="40" <cfif accessSundayEndMinute EQ 40>SELECTED</cfif>>40<option value="45" <cfif accessSundayEndMinute EQ 45>SELECTED</cfif>>45<option value="50" <cfif accessSundayEndMinute EQ 50>SELECTED</cfif>>50<option value="55" <cfif accessSundayEndMinute EQ 55>SELECTED</cfif>>55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessSundayEndAMPM">
													<option value="AM" <cfif accessSundayEndAMPM EQ "AM">SELECTED</cfif>>AM<option value="PM"  <cfif accessSundayEndAMPM EQ "PM">SELECTED</cfif>>PM																							
												</select>
											</td>
										</tr>
										
									</table>

								</td>
							</tr>												
							<tr>
								<td align="center" colspan="2">	<br><br>	
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
										<cf_gcSubmitButton value="Update">
										<input type="hidden" name="Submitted" value="yes">									
									</font>		
								</td>
							</tr>														
						</table>
					</form>
				</cfoutput>		
	
			</cf_gcBorderedTable>
		
		
	<!------------------------------------------------------------------>
	<!--- This else will save the Work Group.                        --->
	<!------------------------------------------------------------------>
	<cfelse>
	
		<!-------------------------------------------------------------------------------------->
		<!--- Verify that the needed parameters have been sent in.                           --->
		<!-------------------------------------------------------------------------------------->
		<cf_gcVerifyFields
			fields="form.WorkGroupName,WorkGroupID"
			fieldnames="Work Group Name, Work Group ID">
			

					
		<!-------------------------------------------------------------------------------------->
		<!--- Update the record                                                              --->
		<!-------------------------------------------------------------------------------------->			
		<cfset MondayStart = "NULL">
		<cfset MondayEnd = "NULL">
		<cfset TuesdayStart = "NULL">
		<cfset TuesdayEnd = "NULL">
		<cfset WednesdayStart = "NULL">
		<cfset WednesdayEnd = "NULL">
		<cfset ThursdayStart = "NULL">
		<cfset ThursdayEnd = "NULL">
		<cfset FridayStart = "NULL">
		<cfset FridayEnd = "NULL">
		<cfset SaturdayStart = "NULL">
		<cfset SaturdayEnd = "NULL">
		<cfset SundayStart = "NULL">
		<cfset SundayEnd = "NULL">
		
		<!--- Monday --->
		<cfif IsDefined("form.AccessMonday")>
			<cfif form.AccessMondayStartAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessMondayStartHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 12></cfcase>
				</cfswitch>
			<cfelseif form.AccessMondayStartAMPM EQ "AM" AND trim(form.AccessMondayStartHour) EQ 12>
				<cfset hour = 00>	
			<cfelse>
				<cfset hour = form.AccessMondayStartHour>
			</cfif>	
			<cfset mondayStartHour = hour>		
			<cfset MondayStart = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessMondayStartMinute) ,00))>
			
			<cfif form.AccessMondayEndAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessMondayEndHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 12></cfcase>
				</cfswitch>
			<cfelseif form.AccessMondayEndAMPM EQ "AM" AND trim(form.AccessMondayEndHour) EQ 12>
				<cfset hour = 00>	
			<cfelse>
				<cfset hour = form.AccessMondayEndHour>
			</cfif>		
			<cfset mondayEndHour = hour>		
			
			<!---<cfif trim(form.AccessMondayStartAMPM) EQ trim(form.AccessMondayEndAMPM) AND trim(mondayStartHour) EQ trim(mondayEndHour) AND trim(form.AccessMondayStartMinute) EQ trim(form.AccessMondayEndMinute)>
				
			</cfif>--->
			
			<cfset MondayEnd = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessMondayEndMinute) ,00))>			
		
		</cfif>
			
		<!--- Tuesday --->
		<cfif IsDefined("form.AccessTuesday")>
			<cfif form.AccessTuesdayStartAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessTuesdayStartHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 12></cfcase>
				</cfswitch>
			<cfelseif form.AccessTuesdayStartAMPM EQ "AM" AND trim(form.AccessTuesdayStartHour) EQ 12>
				<cfset hour = 00>	
			<cfelse>
				<cfset hour = form.AccessTuesdayStartHour>
			</cfif>			
			<cfset TuesdayStart = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessTuesdayStartMinute) ,00))>
			
			<cfif form.AccessTuesdayEndAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessTuesdayEndHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 12></cfcase>
				</cfswitch>
			<cfelseif form.AccessTuesdayEndAMPM EQ "AM" AND trim(form.AccessTuesdayEndHour) EQ 12>
				<cfset hour = 00>	
			<cfelse>
				<cfset hour = form.AccessTuesdayEndHour>
			</cfif>			
			<cfset TuesdayEnd = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessTuesdayEndMinute) ,00))>			
		</cfif>
		
		<!--- Wednesday --->
		<cfif IsDefined("form.AccessWednesday")>
			<cfif form.AccessWednesdayStartAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessWednesdayStartHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 12></cfcase>
				</cfswitch>
			<cfelseif form.AccessWednesdayStartAMPM EQ "AM" AND trim(form.AccessWednesdayStartHour) EQ 12>
				<cfset hour = 00>	
			<cfelse>
				<cfset hour = form.AccessWednesdayStartHour>
			</cfif>			
			<cfset WednesdayStart = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessWednesdayStartMinute) ,00))>
			
			<cfif form.AccessWednesdayEndAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessWednesdayEndHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 12></cfcase>
				</cfswitch>
			<cfelseif form.AccessWednesdayEndAMPM EQ "AM" AND trim(form.AccessWednesdayEndHour) EQ 12>
				<cfset hour = 00>	
			<cfelse>
				<cfset hour = form.AccessWednesdayEndHour>
			</cfif>			
			<cfset WednesdayEnd = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessWednesdayEndMinute) ,00))>			
		</cfif>
		
		<!--- Thursday --->
		<cfif IsDefined("form.AccessThursday")>
			<cfif form.AccessThursdayStartAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessThursdayStartHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 12></cfcase>
				</cfswitch>
			<cfelseif form.AccessThursdayStartAMPM EQ "AM" AND trim(form.AccessThursdayStartHour) EQ 12>
				<cfset hour = 00>	
			<cfelse>
				<cfset hour = form.AccessThursdayStartHour>
			</cfif>			
			<cfset ThursdayStart = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessThursdayStartMinute) ,00))>
			
			<cfif form.AccessThursdayEndAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessThursdayEndHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 12></cfcase>
				</cfswitch>
			<cfelseif form.AccessThursdayEndAMPM EQ "AM" AND trim(form.AccessThursdayEndHour) EQ 12>
				<cfset hour = 00>	
			<cfelse>
				<cfset hour = form.AccessThursdayEndHour>
			</cfif>			
			<cfset ThursdayEnd = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessThursdayEndMinute) ,00))>			
		</cfif>
		
		<!--- Friday --->
		<cfif IsDefined("form.AccessFriday")>
			<cfif form.AccessFridayStartAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessFridayStartHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 12></cfcase>
				</cfswitch>
			<cfelseif form.AccessFridayStartAMPM EQ "AM" AND trim(form.AccessFridayStartHour) EQ 12>
				<cfset hour = 00>	
			<cfelse>
				<cfset hour = form.AccessFridayStartHour>
			</cfif>			
			<cfset FridayStart = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessFridayStartMinute) ,00))>
			
			<cfif form.AccessFridayEndAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessFridayEndHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 12></cfcase>
				</cfswitch>
			<cfelseif form.AccessFridayEndAMPM EQ "AM" AND trim(form.AccessFridayEndHour) EQ 12>
				<cfset hour = 00>	
			<cfelse>
				<cfset hour = form.AccessFridayEndHour>
			</cfif>			
			<cfset FridayEnd = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessFridayEndMinute) ,00))>			
		</cfif>
		
		<!--- Saturday --->
		<cfif IsDefined("form.AccessSaturday")>
			<cfif form.AccessSaturdayStartAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessSaturdayStartHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 12></cfcase>
				</cfswitch>
			<cfelseif form.AccessSaturdayStartAMPM EQ "AM" AND trim(form.AccessSaturdayStartHour) EQ 12>
				<cfset hour = 00>	
			<cfelse>
				<cfset hour = form.AccessSaturdayStartHour>
			</cfif>			
			<cfset SaturdayStart = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessSaturdayStartMinute) ,00))>
			
			<cfif form.AccessSaturdayEndAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessSaturdayEndHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 12></cfcase>
				</cfswitch>
			<cfelseif form.AccessSaturdayEndAMPM EQ "AM" AND trim(form.AccessSaturdayEndHour) EQ 12>
				<cfset hour = 00>	
			<cfelse>
				<cfset hour = form.AccessSaturdayEndHour>
			</cfif>			
			<cfset SaturdayEnd = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessSaturdayEndMinute) ,00))>			
		</cfif>
		
		<!--- Sunday --->
		<cfif IsDefined("form.AccessSunday")>
			<cfif form.AccessSundayStartAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessSundayStartHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 12></cfcase>
				</cfswitch>
			<cfelseif form.AccessSundayStartAMPM EQ "AM" AND trim(form.AccessSundayStartHour) EQ 12>
				<cfset hour = 00>	
			<cfelse>
				<cfset hour = form.AccessSundayStartHour>
			</cfif>			
			<cfset SundayStart = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessSundayStartMinute) ,00))>
			
			<cfif form.AccessSundayEndAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessSundayEndHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 12></cfcase>
				</cfswitch>
			<cfelseif form.AccessSundayEndAMPM EQ "AM" AND trim(form.AccessSundayEndHour) EQ 12>
				<cfset hour = 00>	
			<cfelse>
				<cfset hour = form.AccessSundayEndHour>
			</cfif>			
			<cfset SundayEnd = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessSundayEndMinute) ,00))>			
		</cfif>
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- UYpdate the record.                                                            --->
		<!-------------------------------------------------------------------------------------->		
		<cfquery name="updateWorkGroup" datasource="#trim(request.datasource)#">
			UPDATE WorkGroup
			SET WorkGroupName = '#trim(form.WorkGroupName)#',
			Description = '#trim(form.Description)#',								
			MondayStart = #MondayStart#,
			MondayEnd = #MondayEnd#,
			TuesdayStart = #TuesdayStart#,
			TuesdayEnd = #TuesdayEnd#,
			WednesdayStart = #WednesdayStart#,
			WednesdayEnd = #WednesdayEnd#,
			ThursdayStart = #ThursdayStart#,
			ThursdayEnd = #ThursdayEnd#,
			FridayStart = #FridayStart#,
			FridayEnd = #FridayEnd#,
			SaturdayStart = #SaturdayStart#,
			SaturdayEnd = #SaturdayEnd#,
			SundayStart = #SundayStart#, 
			SundayEnd = #SundayEnd#
			WHERE WorkGroupID = #trim(WorkGroupID)#
		</cfquery>
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- relocate back to the work groups                                               --->
		<!-------------------------------------------------------------------------------------->
			<cflocation addtoken="No" url="appAdminWorkGroupsManage.cfm">		
			
	
	
	</cfif>		