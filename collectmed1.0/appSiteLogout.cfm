


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.interval" default="5">
	<cfset interval = attributes.interval>
	
	<cfparam name="attributes.msg" default="You have been successfully logged out.">
	<cfset msg = attributes.msg>	
	
	<cfif IsDefined("form.msg") AND form.msg NEQ "">
		<cfset msg = form.msg>
	<cfelseif IsDefined("url.msg") AND url.msg NEQ "">
		<cfset msg = url.msg>	
	</cfif>


	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- If there is a message sent display it.                                         --->
	<!-------------------------------------------------------------------------------------->
		<cfif msg NEQ "">
			<cfoutput>						
				<br>				
				<div align="center">
					<table border="0" width="500" cellpadding="0" cellspacing="10">
						<tr>
							<td>
								<cf_gcBorderedTable	title="Logged Out Successfully" tableWidth="100%">	
									&nbsp;<br><br><p><font size="2" color="000000"><p><strong>#trim(msg)#</strong></p><p>This window will now close.</p></font></p>&nbsp;<br><br>
								</cf_gcBorderedTable>
							</td>
						</tr>
					</table>	
				</div>									
				
			</cfoutput>
		</cfif>	
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Clear the users session from the application structure.                        --->
<!--- Once the user has chosen to logout this code will end the session variables    --->
<!--- on the server.                                                                 --->
<!-------------------------------------------------------------------------------------->	
	<cf_gcLogUserOutClearScopes>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Pause the page to let them know they have been logged out.                     --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		
		<script language="JavaScript">
			<!--								
			window.location = 'http://www.collectmed.net';						
			// -->
			
			/*<!--					
			self.setTimeout('winClose()', 1500) 					
			function winClose(){
				self.close();
			};							
			// -->*/
			
		</script>
						
	</cfoutput>
	
			
