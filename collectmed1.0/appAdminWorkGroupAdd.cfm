<!---- appAdminWorkGroupAdd.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="Submitted" default="no">
	
	<cfparam name="attributes.formName" default="AccessFrom">
	<cfset formName = attributes.formName>
	
		
	
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
			<cf_gcBorderedTable	title="Create a Work Group" tablewidth="50%" tablealign="center">		
					
				 
				<!------------------------------------------------------------------>
				<!--- Output the form that the admin will use to                 --->
				<!--- create the page.                                           --->
				<!------------------------------------------------------------------>
				<cfoutput>
					
					<form name="#trim(formName)#" method="post" onsubmit="return validateForm();">
						
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
								<td align="right" nowrap>		
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
										Work Group Name:
									</font>								
								</td>
								<td nowrap>		
									<input type="Text" class="SiteTextbox" name="WorkGroupName" size="20" maxlength="119">		
								</td>
							</tr>	
							<tr>
								<td align="right">		
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
										Description
									</font>								
								</td>
								<td nowrap>		
									<textarea class="SiteTextArea" name="description" cols="40" rows="5"></textarea>
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
										<tr>
										    <td nowrap><input type="Checkbox" name="accessMonday" checked></td>										    
											<td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													<strong>Monday</strong>
												</font>
											</td>
										    <td nowrap>&nbsp;</td>
											<td nowrap>
												<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
													Start:
												</font>
											</td>											
										    <td nowrap>
												<select class="SiteSelectBox" name="accessMondayStartHour">
													<option value="01">01<option value="02">02<option value="03">03<option value="04">04<option value="05">05<option value="06">06<option value="07" SELECTED>07<option value="08">08<option value="09">09<option value="10">10<option value="11">11<option value="12">12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessMondayStartMinute">
													<option value="00" SELECTED>00<option value="05">05<option value="10">10<option value="15">15<option value="20">20<option value="25">25<option value="30">30<option value="35">35<option value="40">40<option value="45">45<option value="50">50<option value="55">55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessMondayStartAMPM">
													<option value="AM" SELECTED>AM<option value="PM">PM																							
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
													<option value="01">01<option value="02">02<option value="03">03<option value="04">04<option value="05" SELECTED>05<option value="06">06<option value="07">07<option value="08">08<option value="09">09<option value="10">10<option value="11">11<option value="12">12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessMondayEndMinute">
													<option value="00">00<option value="05">05<option value="10">10<option value="15">15<option value="20">20<option value="25">25<option value="30" SELECTED>30<option value="35">35<option value="40">40<option value="45">45<option value="50">50<option value="55">55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessMondayEndAMPM">
													<option value="AM">AM<option value="PM" SELECTED>PM																							
												</select>
											</td>
											 <td nowrap>
											 	<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="ff0000">
											 		<span id="accessMondaySP"></span>
												</font>
											</td>
										</tr>
										
										<!--- Tue --->
										<tr bgcolor="lightgrey">
										    <td nowrap><input type="Checkbox" name="accessTuesday" checked></td>										    
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
													<option value="01">01<option value="02">02<option value="03">03<option value="04">04<option value="05">05<option value="06">06<option value="07" SELECTED>07<option value="08">08<option value="09">09<option value="10">10<option value="11">11<option value="12">12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessTuesdayStartMinute">
													<option value="00" SELECTED>00<option value="05">05<option value="10">10<option value="15">15<option value="20">20<option value="25">25<option value="30">30<option value="35">35<option value="40">40<option value="45">45<option value="50">50<option value="55">55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessTuesdayStartAMPM">
													<option value="AM" SELECTED>AM<option value="PM">PM																							
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
													<option value="01">01<option value="02">02<option value="03">03<option value="04">04<option value="05" SELECTED>05<option value="06">06<option value="07">07<option value="08">08<option value="09">09<option value="10">10<option value="11">11<option value="12">12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessTuesdayEndMinute">
													<option value="00">00<option value="05">05<option value="10">10<option value="15">15<option value="20">20<option value="25">25<option value="30" SELECTED>30<option value="35">35<option value="40">40<option value="45">45<option value="50">50<option value="55">55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessTuesdayEndAMPM">
													<option value="AM">AM<option value="PM" SELECTED>PM																							
												</select>
											</td>
											 <td nowrap>
											 	<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="ff0000">
											 		<span id="accessTuesdaySP"></span>
												</font>
											</td>
										</tr>
																				
										<!--- Wed --->
										<tr>
										    <td nowrap><input type="Checkbox" name="accessWednesday" checked></td>										    
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
													<option value="01">01<option value="02">02<option value="03">03<option value="04">04<option value="05">05<option value="06">06<option value="07" SELECTED>07<option value="08">08<option value="09">09<option value="10">10<option value="11">11<option value="12">12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessWednesdayStartMinute">
													<option value="00" SELECTED>00<option value="05">05<option value="10">10<option value="15">15<option value="20">20<option value="25">25<option value="30">30<option value="35">35<option value="40">40<option value="45">45<option value="50">50<option value="55">55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessWednesdayStartAMPM">
													<option value="AM" SELECTED>AM<option value="PM">PM																							
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
													<option value="01">01<option value="02">02<option value="03">03<option value="04">04<option value="05" SELECTED>05<option value="06">06<option value="07">07<option value="08">08<option value="09">09<option value="10">10<option value="11">11<option value="12">12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessWednesdayEndMinute">
													<option value="00">00<option value="05">05<option value="10">10<option value="15">15<option value="20">20<option value="25">25<option value="30" SELECTED>30<option value="35">35<option value="40">40<option value="45">45<option value="50">50<option value="55">55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessWednesdayEndAMPM">
													<option value="AM">AM<option value="PM" SELECTED>PM																							
												</select>
											</td>
											 <td nowrap>
											 	<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="ff0000">
											 		<span id="accessWednesdaySP"></span>
												</font>
											</td>
										</tr>
																				
										<!---Thu--->
										<tr bgcolor="lightgrey">
										    <td nowrap><input type="Checkbox" name="accessThursday" checked></td>										    
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
													<option value="01">01<option value="02">02<option value="03">03<option value="04">04<option value="05">05<option value="06">06<option value="07" SELECTED>07<option value="08">08<option value="09">09<option value="10">10<option value="11">11<option value="12">12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessThursdayStartMinute">
													<option value="00" SELECTED>00<option value="05">05<option value="10">10<option value="15">15<option value="20">20<option value="25">25<option value="30">30<option value="35">35<option value="40">40<option value="45">45<option value="50">50<option value="55">55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessThursdayStartAMPM">
													<option value="AM" SELECTED>AM<option value="PM">PM																							
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
													<option value="01">01<option value="02">02<option value="03">03<option value="04">04<option value="05" SELECTED>05<option value="06">06<option value="07">07<option value="08">08<option value="09">09<option value="10">10<option value="11">11<option value="12">12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessThursdayEndMinute">
													<option value="00">00<option value="05">05<option value="10">10<option value="15">15<option value="20">20<option value="25">25<option value="30" SELECTED>30<option value="35">35<option value="40">40<option value="45">45<option value="50">50<option value="55">55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessThursdayEndAMPM">
													<option value="AM">AM<option value="PM" SELECTED>PM																							
												</select>
											</td>
											 <td nowrap>
											 	<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="ff0000">
											 		<span id="accessThursdaySP"></span>
												</font>
											</td>
										</tr>
										
										<!--- Fri--->
										<tr>
										    <td nowrap><input type="Checkbox" name="accessFriday" checked></td>										    
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
													<option value="01">01<option value="02">02<option value="03">03<option value="04">04<option value="05">05<option value="06">06<option value="07" SELECTED>07<option value="08">08<option value="09">09<option value="10">10<option value="11">11<option value="12">12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessFridayStartMinute">
													<option value="00" SELECTED>00<option value="05">05<option value="10">10<option value="15">15<option value="20">20<option value="25">25<option value="30">30<option value="35">35<option value="40">40<option value="45">45<option value="50">50<option value="55">55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessFridayStartAMPM">
													<option value="AM" SELECTED>AM<option value="PM">PM																							
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
													<option value="01">01<option value="02">02<option value="03">03<option value="04">04<option value="05" SELECTED>05<option value="06">06<option value="07">07<option value="08">08<option value="09">09<option value="10">10<option value="11">11<option value="12">12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessFridayEndMinute">
													<option value="00">00<option value="05">05<option value="10">10<option value="15">15<option value="20">20<option value="25">25<option value="30" SELECTED>30<option value="35">35<option value="40">40<option value="45">45<option value="50">50<option value="55">55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessFridayEndAMPM">
													<option value="AM">AM<option value="PM" SELECTED>PM																							
												</select>
											</td>
											 <td nowrap>
											 	<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="ff0000">
											 		<span id="accessFridaySP"></span>
												</font>
											</td>
										</tr>
										
										<!--- Sat --->
										<tr bgcolor="lightgrey">
										    <td nowrap><input type="Checkbox" name="accessSaturday"></td>										    
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
													<option value="01">01<option value="02">02<option value="03">03<option value="04">04<option value="05">05<option value="06">06<option value="07">07<option value="08" SELECTED>08<option value="09">09<option value="10">10<option value="11">11<option value="12">12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessSaturdayStartMinute">
													<option value="00" SELECTED>00<option value="05">05<option value="10">10<option value="15">15<option value="20">20<option value="25">25<option value="30">30<option value="35">35<option value="40">40<option value="45">45<option value="50">50<option value="55">55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessSaturdayStartAMPM">
													<option value="AM" SELECTED>AM<option value="PM">PM																							
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
													<option value="01">01<option value="02">02<option value="03">03<option value="04">04<option value="05" SELECTED>05<option value="06">06<option value="07">07<option value="08">08<option value="09">09<option value="10">10<option value="11">11<option value="12">12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessSaturdayEndMinute">
													<option value="00">00<option value="05">05<option value="10">10<option value="15">15<option value="20">20<option value="25">25<option value="30" SELECTED>30<option value="35">35<option value="40">40<option value="45">45<option value="50">50<option value="55">55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessSaturdayEndAMPM">
													<option value="AM">AM<option value="PM" SELECTED>PM																							
												</select>
											</td>
											 <td nowrap>
											 	<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="ff0000">
											 		<span id="accessSaturdaySP"></span>
												</font>
											</td>
										</tr>
										
										<!--- Sun --->
										<tr>
										    <td nowrap><input type="Checkbox" name="accessSunday"></td>										    
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
													<option value="01">01<option value="02">02<option value="03">03<option value="04">04<option value="05">05<option value="06">06<option value="07">07<option value="08" SELECTED>08<option value="09">09<option value="10">10<option value="11">11<option value="12">12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessSundayStartMinute">
													<option value="00" SELECTED>00<option value="05">05<option value="10">10<option value="15">15<option value="20">20<option value="25">25<option value="30">30<option value="35">35<option value="40">40<option value="45">45<option value="50">50<option value="55">55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessSundayStartAMPM">
													<option value="AM" SELECTED>AM<option value="PM">PM																							
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
													<option value="01">01<option value="02">02<option value="03">03<option value="04">04<option value="05" SELECTED>05<option value="06">06<option value="07">07<option value="08">08<option value="09">09<option value="10">10<option value="11">11<option value="12">12													
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td>
												<select class="SiteSelectBox" name="accessSundayEndMinute">
													<option value="00">00<option value="05">05<option value="10">10<option value="15">15<option value="20">20<option value="25">25<option value="30" SELECTED>30<option value="35">35<option value="40">40<option value="45">45<option value="50">50<option value="55">55																								
												</select>
											</td>
										    <td nowrap><strong>:</strong></td>
										    <td nowrap>
												<select class="SiteSelectBox" name="accessSundayEndAMPM">
													<option value="AM">AM<option value="PM" SELECTED>PM																							
												</select>
											</td>
											<td nowrap>
											 	<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="ff0000">
											 		<span id="accessSundaySP"></span>
												</font>
											</td>
										</tr>
										
									</table>

								</td>
							</tr>												
							<tr>
								<td align="center" colspan="2">	<br><br>	
									<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
										<cf_gcSubmitButton value="Save">
										<input type="hidden" name="Submitted" value="yes">									
									</font>		
								</td>
							</tr>														
						</table>
					</form>
					
					<!--------------------------------------------------------------------------------------->
					<!--- When you have a validate form and the msg is not black this function will have  --->
					<!--- to be called below the gcSubmitButton custom tag. This tag will set             --->
					<!--- caller.submitButtonID allowing this code to work.                               --->
					<!--------------------------------------------------------------------------------------->
					<script language="JavaScript">
						function resetSubmitButtons(){
							document.#formName#.SubmitButton#trim(submitButtonID)#.style.display='inline';
							spSubmitButton#trim(submitButtonID)#.innerText='';
						};
					</script>
					
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
			fields="form.WorkGroupName"
			fieldnames="Work Group Name">
				

		<!-------------------------------------------------------------------------------------->
		<!--- Check to make sure that the work group does not already exist.                 --->
		<!-------------------------------------------------------------------------------------->								
		<cfquery name="getWorkGroupName" datasource="#trim(request.datasource)#">
			SELECT WorkGroupID
			FROM workgroup
			WHERE WorkGroupName = '#trim(form.WorkGroupName)#'
		</cfquery>		
			
		<cfif getWorkGroupName.RecordCount GTE 1>
			<cf_gcGeneralErrorTemplate				
				message="The Work Group already exists. Please go back and provide another Work Group name.">
		</cfif>	
		
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- Insert the record                                                              --->
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
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 24></cfcase>
				</cfswitch>
			<cfelse>
				<cfset hour = form.AccessMondayStartHour>
			</cfif>
			<cfset MondayStart = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessMondayStartMinute) ,00))>
			
			<cfif form.AccessMondayEndAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessMondayEndHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 24></cfcase>
				</cfswitch>
			<cfelse>
				<cfset hour = form.AccessMondayEndHour>
			</cfif>
			<cfset MondayEnd = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessMondayEndMinute) ,00))>			
		</cfif>
			
		<!--- Tuesday --->
		<cfif IsDefined("form.AccessTuesday")>
			<cfif form.AccessTuesdayStartAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessTuesdayStartHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 24></cfcase>
				</cfswitch>
			<cfelse>
				<cfset hour = form.AccessTuesdayStartHour>
			</cfif>
			<cfset TuesdayStart = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessTuesdayStartMinute) ,00))>
			
			<cfif form.AccessTuesdayEndAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessTuesdayEndHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 24></cfcase>
				</cfswitch>
			<cfelse>
				<cfset hour = form.AccessTuesdayEndHour>
			</cfif>
			<cfset TuesdayEnd = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessTuesdayEndMinute) ,00))>			
		</cfif>
		
		<!--- Wednesday --->
		<cfif IsDefined("form.AccessWednesday")>
			<cfif form.AccessWednesdayStartAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessWednesdayStartHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 24></cfcase>
				</cfswitch>
			<cfelse>
				<cfset hour = form.AccessWednesdayStartHour>
			</cfif>
			<cfset WednesdayStart = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessWednesdayStartMinute) ,00))>
			
			<cfif form.AccessWednesdayEndAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessWednesdayEndHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 24></cfcase>
				</cfswitch>
			<cfelse>
				<cfset hour = form.AccessWednesdayEndHour>
			</cfif>
			<cfset WednesdayEnd = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessWednesdayEndMinute) ,00))>			
		</cfif>
		
		<!--- Thursday --->
		<cfif IsDefined("form.AccessThursday")>
			<cfif form.AccessThursdayStartAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessThursdayStartHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 24></cfcase>
				</cfswitch>
			<cfelse>
				<cfset hour = form.AccessThursdayStartHour>
			</cfif>
			<cfset ThursdayStart = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessThursdayStartMinute) ,00))>
			
			<cfif form.AccessThursdayEndAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessThursdayEndHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 24></cfcase>
				</cfswitch>
			<cfelse>
				<cfset hour = form.AccessThursdayEndHour>
			</cfif>
			<cfset ThursdayEnd = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessThursdayEndMinute) ,00))>			
		</cfif>
		
		<!--- Friday --->
		<cfif IsDefined("form.AccessFriday")>
			<cfif form.AccessFridayStartAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessFridayStartHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 24></cfcase>
				</cfswitch>
			<cfelse>
				<cfset hour = form.AccessFridayStartHour>
			</cfif>
			<cfset FridayStart = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessFridayStartMinute) ,00))>
			
			<cfif form.AccessFridayEndAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessFridayEndHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 24></cfcase>
				</cfswitch>
			<cfelse>
				<cfset hour = form.AccessFridayEndHour>
			</cfif>
			<cfset FridayEnd = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessFridayEndMinute) ,00))>			
		</cfif>
		
		<!--- Saturday --->
		<cfif IsDefined("form.AccessSaturday")>
			<cfif form.AccessSaturdayStartAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessSaturdayStartHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 24></cfcase>
				</cfswitch>
			<cfelse>
				<cfset hour = form.AccessSaturdayStartHour>
			</cfif>
			<cfset SaturdayStart = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessSaturdayStartMinute) ,00))>
			
			<cfif form.AccessSaturdayEndAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessSaturdayEndHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 24></cfcase>
				</cfswitch>
			<cfelse>
				<cfset hour = form.AccessSaturdayEndHour>
			</cfif>
			<cfset SaturdayEnd = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessSaturdayEndMinute) ,00))>			
		</cfif>
		
		<!---Sunday --->
		<cfif IsDefined("form.AccessSunday")>
			<cfif form.AccessSundayStartAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessSundayStartHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 24></cfcase>
				</cfswitch>
			<cfelse>
				<cfset hour = form.AccessSundayStartHour>
			</cfif>
			<cfset SundayStart = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessSundayStartMinute) ,00))>
			
			<cfif form.AccessSundayEndAMPM EQ "PM">
				<cfswitch expression="#trim(form.AccessSundayEndHour)#">
					<cfcase value="01"><cfset hour = 13></cfcase><cfcase value="02"><cfset hour = 14></cfcase><cfcase value="03"><cfset hour = 15></cfcase><cfcase value="04"><cfset hour = 16></cfcase><cfcase value="05"><cfset hour = 17></cfcase><cfcase value="06"><cfset hour = 18></cfcase><cfcase value="07"><cfset hour = 19></cfcase><cfcase value="08"><cfset hour = 20></cfcase><cfcase value="09"><cfset hour = 21></cfcase><cfcase value="10"><cfset hour = 22></cfcase><cfcase value="11"><cfset hour = 23></cfcase><cfcase value="12"><cfset hour = 24></cfcase>
				</cfswitch>
			<cfelse>
				<cfset hour = form.AccessSundayEndHour>
			</cfif>
			<cfset SundayEnd = CreateODBCDateTime(CreateDateTime(1970, 1, 1, trim(hour), trim(form.AccessSundayEndMinute) ,00))>			
		</cfif>
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Insert the record.                                                             --->
		<!-------------------------------------------------------------------------------------->		
		<cfquery name="insertWorkGroup" datasource="#trim(request.datasource)#">
			INSERT INTO WorkGroup(				
				WorkGroupName, 
				Description,				
				MondayStart,
				MondayEnd,
				TuesdayStart,
				TuesdayEnd,
				WednesdayStart,
				WednesdayEnd,
				ThursdayStart,
				ThursdayEnd,
				FridayStart,
				FridayEnd,
				SaturdayStart,
				SaturdayEnd,
				SundayStart,
				SundayEnd
			)
			VALUES(
				'#trim(form.WorkGroupName)#', 
				'#trim(form.Description)#',					
				#MondayStart#,
				#MondayEnd#,
				#TuesdayStart#,
				#TuesdayEnd#,
				#WednesdayStart#,
				#WednesdayEnd#,
				#ThursdayStart#,
				#ThursdayEnd#,
				#FridayStart#,
				#FridayEnd#,
				#SaturdayStart#,
				#SaturdayEnd#,
				#SundayStart#,
				#SundayEnd#
			)
		</cfquery>
			
		
		<!-------------------------------------------------------------------------------------->
		<!--- relocate back to the work groups                                               --->
		<!-------------------------------------------------------------------------------------->
		<cflocation addtoken="No" url="appAdminWorkGroupsManage.cfm">
			
	
	
	</cfif>		
