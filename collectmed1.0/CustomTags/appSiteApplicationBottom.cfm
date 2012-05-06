<cfoutput>
								
							</td>
							
							<!------------------------------------------------------------------>
							<!--- Code for the far right navigation page bieng displayed.    --->
							<!------------------------------------------------------------------>					   
							
							<td valign="top" align="right" colspan="1"> 				
								
								<table border="0" cellpadding="0" cellspacing="0">			
									<tr valign="top">										
										<td width="1" height="1000"><img src="images/transparent.gif" width="1" height="1" border="0" alt=""></td>
									</tr>
								</table> 	
																																				
							</td>
								
						</tr>												
						
						<!------------------------------------------------------------------>
						<!--- Finish the page being loaded with closing the page.        --->
						<!------------------------------------------------------------------>
						<cfif trim(request.Page.getFooter()) EQ "Y">
							<tr>
							    <td colspan="#trim(hfColspan)#" align="center">
									
									<cftry>
																		
										<cfinclude template="/collectmed1.0/appFooter.cfm">
										
										<cfcatch type="any">											
											
											<p><strong>#cfcatch.type#</strong><br>
											#cfcatch.message# #cfcatch.detail#<br>
											<cfabort>
																											
										</cfcatch>
									
									</cftry>							
																		
								</td>
							</tr>
						</cfif>
					</table>						
				
				</div>	
								
			</body>
		</html>		
	</cfoutput>

	
	
	
<!------------------------------------------------------------------>
<!--- Call this for debugging the site you will see the debug    --->
<!--- in the dev site only.                                      --->
<!------------------------------------------------------------------>
	<cfif ListFindNoCase("dev,sta", request.cfservername) OR (Isdefined("url.prefill") AND url.prefill EQ "yes") OR (Isdefined("session.prefill") AND session.prefill)>
		<cfset session.prefill = true>	       
		<cfinclude template="prefill.cfm">
	</cfif>	
	
			



