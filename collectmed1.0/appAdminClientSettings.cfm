<!---- appAdminClientSettings.cfm ---->


<!------------------------------------------------------------------>
<!--- Start the display of this page.                            --->
<!------------------------------------------------------------------>
	<br>	
	<table cellspacing="0" cellpadding="4" border="0">
		<tr>
		    <td rowspan="2" valign="top">
				
				<cf_gcBorderedTable title="Client&nbsp;Settings" tablealign="center">
				
					<table border="0" cellpadding="2" cellspacing="0" width="100%">
																							
						<cfif ListContains(session.User.getRoleIDs(), "8")>
							<tr>
								<td class="SiteLabel">		
									<a href="appAdminReporting.cfm">Login IP Addresses</a>
								</td>
							</tr>		
						</cfif>		
														
					</table>
						
				</cf_gcBorderedTable>
			
			</td>		   
		</tr>
	
	</table>
	
	