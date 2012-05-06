
<!---
	
	
<!------------------------------------------------------------------>
<!--- Initialize page variables.                                 --->
<!------------------------------------------------------------------>	
	<cfparam name="showdebugoutputVariable" default="no">
	
	<cfparam name="request.ServerName" default="#CGI.SERVER_NAME#">
	<cfset ServerName = request.ServerName>
	
	
	
<!------------------------------------------------------------------>		
<!--- Depending on the site you can set the variable to show     --->
<!--- debug output.                                              --->	
<!------------------------------------------------------------------>	
	<cfif FindNoCase("dev",ServerName)>		
		
		<cfset showdebugoutputVariable = "yes">
		
	</cfif>	
	


<!------------------------------------------------------------------>
<!--- This is where the page ends in any page that is            --->
<!--- sent in.                                                   --->
<!------------------------------------------------------------------>
	<cfif FindNoCase("dev",ServerName)>	
		
		<cfoutput>	
			<p>
			<div align="center">
				<table border="2" cellpadding="2" cellspacing="4" bordercolor="ff0000">
					<tr>
						<td bgcolor="c0cddc">
							<font face="Arial Black" size="3" color="FFFFFF">DEBUG BEGINS</font>
						</font>		
					</td>
					</tr>
					<tr>
						<td>		
						<font face="arial" size="1" color="000000">	
							<cfif isDefined("session.User.UsersID")>
								If defined session.User.UsersID: #session.User.UsersID#<br>
							</cfif>
						</font>		
					</td>
					</tr>
					<tr>
						<td>		
						<font face="arial" size="1" color="000000">	
							Logged In: <cfif IsDefined("session.User.usersID") AND IsNumeric(session.User.usersID)> Yes<cfelse> NO</cfif><br>
						</font>		
					</td>
					</tr>
					<tr>
						<td>		
						<font face="arial" size="1" color="000000">	
							Request Variables<br>
							<cfdump expand="no" var="#request#"><br>
						</font>		
					</td>
					</tr>					
					<tr>
						<td>		
						<font face="arial" size="1" color="000000">	
							Form Variables<br>
							<cfdump expand="no" var="#form#">	
						</font>		
					</td>
					</tr>		
					<tr>
						<td>		
						<font face="arial" size="1" color="000000">	
							URL Variables<br>
							<cfdump expand="no" var="#URL#">	
						</font>		
					</td>
					</tr>	
					<tr>
						<td>		
						<font face="arial" size="1" color="000000">	
							Session Variables<br>
							<cfdump expand="no" var="#session#">	
						</font>		
					</td>
					</tr>	
					<tr>
						<td>		
						<font face="arial" size="1" color="000000">	
							Application Variables<br>
							<cfdump expand="no" var="#application#">	
						</font>		
					</td>
					</tr>
					<tr>
						<td>		
						<font face="arial" size="1" color="000000">	
							CGI Variables<br>
							<cfdump expand="no" var="#CGI#">	
						</font>		
					</td>
					</tr>				
				</table>			
			</div>	
		</cfoutput>

			
		<!------------------------------------------------------------------>
		<!--- If the logged in user is the main admin then show          --->
		<!--- debug output.                                              --->
		<!------------------------------------------------------------------>	
		<cfset showdebugoutputVariable = "yes">
		
		
	</cfif>
	
	
				
<!------------------------------------------------------------------>
<!--- Decide whether the debug out put will be shown.            --->
<!--- By typing in a variable called                             --->
<!--- showdebugoutputVariable in the URL                         --->
<!------------------------------------------------------------------>
	<cfsetting showdebugoutput="#showdebugoutputVariable#">
	

	
<!------------------------------------------------------------------>
<!--- Clear the request struct each time.                        --->
<!------------------------------------------------------------------>	
	<cfset temp = StructClear(request)>
	
		--->