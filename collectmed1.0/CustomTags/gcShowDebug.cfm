	
<!------------------------------------------------------------------>
<!--- Initialize page variables.                                 --->
<!------------------------------------------------------------------>		
	<cfparam name="session.showDebug" default="yes">
		

	
<!------------------------------------------------------------------>
<!--- This is where the page ends in any page that is            --->
<!--- sent in.                                                   --->
<!------------------------------------------------------------------>

	<cfif session.showDebug>
		
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
						<font face="Arial" size="2" color="blue">	
							Request Variables<br>
							<cfdump expand="no" var="#request#"><br>
						</font>		
					</td>
					</tr>					
					<tr>
						<td>		
						<font face="Arial" size="2" color="blue">	
							Form Variables<br>
							<cfdump expand="no" var="#form#">	
						</font>		
					</td>
					</tr>		
					<tr>
						<td>		
						<font face="Arial" size="2" color="blue">	
							URL Variables<br>
							<cfdump expand="no" var="#URL#">	
						</font>		
					</td>
					</tr>	
					<tr>
						<td>		
						<font face="Arial" size="2" color="blue">	
							Session Variables<br>
							<cfdump expand="no" var="#session#">	
						</font>		
					</td>
					</tr>	
					<tr>
						<td>		
						<font face="Arial" size="2" color="blue">	
							Application Variables<br>
							<cfdump expand="no" var="#application#">	
						</font>		
					</td>
					</tr>
					<tr>
						<td>		
						<font face="Arial" size="2" color="blue">	
							CGI Variables<br>
							<cfdump expand="no" var="#CGI#">	
						</font>		
					</td>
					</tr>			
				</table>			
			</div>	
		</cfoutput>
		
		
	</cfif>
	
	
