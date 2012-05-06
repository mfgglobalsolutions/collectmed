
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.msg" default="">
	<cfset msg = attributes.msg>
	
	<cfif IsDefined("form.msg") AND form.msg NEQ "">
		<cfset msg = form.msg>
	<cfelseif IsDefined("url.msg") AND url.msg NEQ "">
		<cfset msg = url.msg>	
	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Start the processing of this page.                                             --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<script language="JavaScript">
			
			function validateRetrievePassForm(){
				if (document.RetrievePass.UserName.value == ""){
					alert("You must type in a user name.");
					document.RetrievePass.UserName.focus();
					return false;
				}
				
				if (document.RetrievePass.FName.value == ""){
					alert("You must type in a first name.");
					document.RetrievePass.FName.focus();
					return false;
				}
				
				if (document.RetrievePass.LName.value == ""){
					alert("You must type in a last name.");
					document.RetrievePass.LName.focus();
					return false;
				}	
							
				return true;
			}
			
		</script>
		<br>
	</cfoutput>	

	<br><br>
	<table cellspacing="0" cellpadding="0" border="0" align="center" width="75%">					
		<tr>									
			
			<td align="center">	
				<cfif msg NEQ "">
					<cfoutput>
						<p><font face="Verdana" size="4" color="FF0000">#trim(msg)#</font></p>			
					</cfoutput>
				</cfif>
				<!--- Retrieve Password --->
				<cf_gcBorderedTable titleFontcolor="white" titlefontsize="3" title="<strong>Retrieve Password</strong>" tablealign="center">	
					<cfoutput>						
						<table cellspacing="0" cellpadding="2" border="0" align="center">					
							<tr valign="top">									
								<td valign="top">	
									<table cellspacing="5" cellpadding="0" border="0">				
										<form method="post" action="appRetrieveQID.cfm" name="RetrievePass" onsubmit="return validateRetrievePassForm();">
											<tr valign="top">
												<td align="right" nowrap>		
													<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
														<div class="SiteRequiredLabel">User Name:</div>
													</font>		
												</td>										
												<td>&nbsp;</td>
												<td align="left" nowrap>		
													<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
														<input type="Text" name="UserName" size="25" maxlength="50" value="" class="SiteTextbox">
													</font>		
												</td>
											</tr>	
											
											<tr valign="top">
												<td align="right" nowrap>		
													<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
														<div class="SiteRequiredLabel">First Name:</div>
													</font>		
												</td>										
												<td>&nbsp;</td>
												<td align="left" nowrap>		
													<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
														<input type="Text" name="FName" size="25" maxlength="50" value="" class="SiteTextbox">
													</font>		
												</td>
											</tr>										
											<tr>
											    <td align="right" nowrap>		
													<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">
														<div class="SiteRequiredLabel">Last Name:</div>
													</font>		
												</td>										
											   	<td>&nbsp;</td>
											    <td align="left" nowrap>		
													<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">	
														<input type="Text" name="LName" size="25" maxlength="50" value="" class="SiteTextbox">
													</font>		
												</td>
											</tr>										
																													
											<tr>			    
											    <td align="center" colspan="3">
													<br><cf_gcSubmitButton value="Submit">											
												</td>
											</tr>														
										</form>
									</table>
								</td>
							</tr>				
						</table>					
					</cfoutput>
				</cf_gcBorderedTable>
			
			</td>
		</tr>
	</table>		
	
		
