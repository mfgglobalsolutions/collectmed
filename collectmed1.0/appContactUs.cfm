<!------------------------------------------------------------------>
<!--- NAME: tagContactUs.cfm                                     --->
<!------------------------------------------------------------------>
<!--- PURPOSE:                                                   --->      
<!---                                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!---                                                            --->
<!---                                                            --->      
<!------------------------------------------------------------------>




<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="Submitted" default="no">
	
	
		
<!------------------------------------------------------------------>
<!--- Create the javascript that handles issues on this page.    --->
<!------------------------------------------------------------------>

	<script language="JavaScript">
		
		function CheckForm(form){
					
			if (form.FirstName.value == ""){
				alert("You must provide a first name prior to submitting your inquiry.");
				return false;
			}
			
			if (form.LastName.value == ""){
				alert("You must provide a last name prior to submitting your inquiry.");
				return false;
			}	
									
			if (form.PhoneArea.value == ""){
				alert("You must provide valid phone area code prior to submitting your inquiry.");
				return false;
			}											
			
			if (form.phoneNumber.value == ""){
				alert("You must provide valid phone prior to submitting your inquiry.");
				return false;
			}	
			
			return true;
		}
		
		
		function CheckEntry(Element){					
			if (isNaN(Element.value) == true){					
				alert("'" + Element.value + "'"  + " is not a valid number. Enter only numbers.");	
				//Element.value = "";			
				Element.focus();
				Element.select();				
				return false;
			}					
		}	
		
	</script>
	
	
	
	
<!------------------------------------------------------------------>
<!--- Add a spacer from the header file.                         --->
<!------------------------------------------------------------------>

	<cfoutput>
		<table border="0" cellpadding="2" cellspacing="0" width="100%">				
			<tr><td colspan="2"><img src="images/transparent.gif" width="2" height="10" border="0"></td></tr>	
		</table>
	</cfoutput>		
		




<!------------------------------------------------------------------>
<!--- Start the display of the Contact us form.                  --->
<!------------------------------------------------------------------>

	<cfoutput>	
		
		<cfif NOT Submitted>	
			
			<!---Outer Border Table--->
			<table border="1" bordercolor="f1f1f1" cellpadding="0" cellspacing="0" width="75%" align="center">				
				<tr>
					<td>
			<!---Outer Border Table--->
						
						<form name="contactUsForm" method="POST" onsubmit="return CheckForm(this);">
							<table border="0" cellpadding="2" cellspacing="0" width="100%">				
								
								<!---Company Header--->
								<tr>
									<td colspan="2" bgcolor="c0cddc" valign="top">			   
							   			<font face="Verdana" size="2" color="000000">
											<strong>Company Information:</strong>
										</font>
									</td>
								</tr>
								<tr><td colspan="2"><img src="images/transparent.gif" width="2" height="10" border="0"></td></tr>
								<tr>
									<td bgcolor="FFFFFF" colspan="2" align="center">			   
							   			<font face="Verdana" size="2" color="000000">
											Collect Med<br>																				
											<table cellspacing="4" cellpadding="1" border="0" align="center">												
												<tr>												   										   
													<td align="center">
														<font face="Verdana" size="1" color="000000">
															<a href="mailto:gcruz@eobmanager.net?subject=Information">Email</a>
														</font>
													</td>	
												</tr>												
											</table>								
										</font>
									</td>									
								</tr>								
																
								<tr><td colspan="2"><img src="images/transparent.gif" width="2" height="10" border="0"></td></tr>						
								<!---Form Header--->
								<tr>
									<td colspan="2" bgcolor="c0cddc" valign="top">			   
							   			<font face="Verdana" size="2" color="000000">
											<strong>Contact Form:</strong>
										</font>
									</td>
								</tr>
								<tr><td colspan="2"><img src="images/transparent.gif" width="2" height="10" border="0"></td></tr>
								
								<!---First Name--->
								<tr>
									<td bgcolor="FFFFFF" width="20%">			   
							   			<font face="Verdana" size="1" color="000000">
											First&nbsp;Name:&nbsp;<font size="2" color="FF0000">*</font>
										</font>
									</td>
									<td>
										<font face="Verdana" size="1" color="000000">
											<input class="SiteTextbox" type="Text" name="FirstName" size="20" maxlength="50">
										</font>
									</td>
								</tr>
								
								<!---Last Name--->						
								<tr>
									<td bgcolor="FFFFFF" width="20%">			   
							   			<font face="Verdana" size="1" color="000000">
											Last&nbsp;Name:&nbsp;<font size="2" color="FF0000">*</font>
										</font>
									</td>
									<td>
										<font face="Verdana" size="1" color="000000">
											<input class="SiteTextbox" type="Text" name="LastName" size="20" maxlength="50">
										</font>
									</td>
								</tr>
								
								<!---Email Address--->
								<tr>
									<td bgcolor="FFFFFF" width="20%">			   
							   			<font face="Verdana" size="1" color="000000">
											Email&nbsp;Address:
										</font>
									</td>
									<td>
										<font face="Verdana" size="1" color="000000">
											<input class="SiteTextbox" type="Text" name="Email" size="20" maxlength="50">
										</font>
									</td>
								</tr>								
								
								<!---Phone Number--->
								<tr>
									<td bgcolor="FFFFFF" width="20%">			   
							   			<font face="Verdana" size="1" color="000000">
											Phone&nbsp;Number:&nbsp;<font size="2" color="FF0000">*</font>
										</font>
									</td>
									<td>
										<font face="Verdana" size="1" color="000000">
											(&nbsp;<input class="SiteTextbox" type="text" name="PhoneArea" size="3" maxlength="3" onblur="return CheckEntry(this);">&nbsp;)&nbsp;&nbsp;<input class="SiteTextbox" type="text" name="phoneNumber" size="12" maxlength="8">&nbsp;&nbsp;Ext.<input class="SiteTextbox" type="text" name="PhoneExt" size="5" maxlength="5" onblur="return CheckEntry(this);">
										</font>
									</td>
								</tr>	
								
								<!---Fax Number--->
								<tr>
									<td bgcolor="FFFFFF" width="20%">			   
							   			<font face="Verdana" size="1" color="000000">
											Fax&nbsp;Number:
										</font>
									</td>
									<td>
										<font face="Verdana" size="1" color="000000">
											(&nbsp;<input class="SiteTextbox" type="text" name="FaxArea" size="3" maxlength="3" onblur="return CheckEntry(this);">&nbsp;)&nbsp;&nbsp;<input class="SiteTextbox" type="text" name="FaxNumber" size="12" maxlength="8">
										</font>
									</td>
								</tr>
								
								<!--- Best Time to Call --->
								<tr>
									<td bgcolor="FFFFFF" width="20%">			   
							   			<font face="Verdana" size="1" color="000000">
											Best&nbsp;Time&nbsp;to&nbsp;Call:
										</font>
									</td>
									<td>
										<font face="Verdana" size="1" color="000000">
											<input class="SiteTextbox" type="Text" name="BestTimeToCall" size="20" maxlength="50">
										</font>
									</td>
								</tr>
								
								<!--- Comments --->
								<tr>
									<td bgcolor="FFFFFF" width="20%">			   
							   			<font face="Verdana" size="1" color="000000">
											Comments:
										</font>
									</td>
									<td>
										<font face="Verdana" size="1" color="000000">
											<textarea class="SiteTextArea" name="Comments" cols="40" rows="5"></textarea>
										</font>
									</td>
								</tr>				
														
								<!---Submit Button--->
								<tr><td colspan="2"><img src="images/transparent.gif" width="2" height="10" border="0"></td></tr>
								<tr>			    
								    <td colspan="2" align="center"><cf_gcSubmitButton value="Submit Inquiry">&nbsp;&nbsp;<cf_gcSubmitButton value="Cancel" onclick="history.back()"></td>
								</tr>
								<tr><td colspan="2"><img src="images/transparent.gif" width="2" height="10" border="0"></td></tr>		
							</table>	
							<input type="Hidden" name="Submitted" value="yes">				
						</form>
						
			<!---Outer Border Table--->		
					</td>
				</tr>
			</table>	
			<!---Outer Border Table--->	
			
									
		<cfelse>
			
			<cfsavecontent variable="mailMessage">					
				<font face="Verdana" size="1" color="000000">
					Message Time: #DateFormat( now(), 'm/d/yyyy' )# #TimeFormat( now() )#<p>					
					First Name: #form.FirstName#<br>
					Last Name: #form.LastName#<br>
					Email: #form.Email#<br>
					Phone: (#form.phoneArea#) #form.phoneNumber# ext: #form.phoneExt#<br>
					Fax: <cfif form.FaxArea NEQ "" AND form.FaxNumber NEQ "">(#form.FaxArea#) #form.FaxNumber#</cfif><br>
					Best Time To Call: #form.BestTimeToCall#<p>
					Comments: #form.Comments#									
				</font>									
			</cfsavecontent>
			
			<cfmail from="gcruz@eobmanager.net" to="gcruz@eobmanager.net" subject="Contact Us Form Inquiry - #DateFormat( now(), 'm/d/yyyy' )# #TimeFormat( now() )#" type="HTML">
				#mailMessage#
			</cfmail>
			
			<cf_gcBorderedTable title="Contact Form Sent Succesfully" tablealign="center" tableWidth="width=75%">							
				<table border="0" cellpadding="4" cellspacing="0">
					<tr>
						<td>		
							<font face="Verdana" size="2" color="000000">		
								Thank you for contacting us. A representative will get back to you within one business day.<p>
								#mailMessage#
							</font>		
						</td>										
					</tr>
				</table>								
			</cf_gcBorderedTable>	
						
		</cfif>	
	
	<br><br>				
	</cfoutput>	
	
	
	
	



		