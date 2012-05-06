





<cfscript>
	include template="/collectmed1.0/CustomTags/appSiteApplicationTop.cfm";
</cfscript>

	
	
	
	
<cfif IsDefined("url.view") AND url.view EQ "claims">



	
<!---- appMyDesktop.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Code for tabs to work.                                                         --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>	
		<script type="text/javascript" src="includes/tabber.js"></script>
		<link rel="stylesheet" href="styles/tabber.css" TYPE="text/css" MEDIA="screen">
		
		<script type="text/javascript">
			document.write('<style type="text/css">.tabber{display:none;}<\/style>');
		</script>	
	</cfoutput>


	
<!------------------------------------------------------------------>
<!--- Start the display of this page.                            --->
<!------------------------------------------------------------------>
	<br>	
	<table cellspacing="4" cellpadding="2" border="0" align="center">	
		<tr>		   
		    <td valign="top" align="right">
			<!---<div align="center">		
				<IFRAME name="IFrameName" src="appClaimMyDisplay.cfm" frameborder="no" width="338" height="600" scrolling="no"></IFRAME>			
			</div>--->
			<cfinclude template="appClaimMyDisplay.cfm">	
			</td>
			<td align="left" valign="top">				
				<table cellspacing="0" cellpadding="2" border="0">
					<tr>
						<td>
							<cf_gcBorderedTable	title="Tasks" tableWidth="100%">	
								<cfinclude template="appTaskDisplay.cfm">							  												
							</cf_gcBorderedTable>	
						</td>
					</tr>					
					
					<tr>
					    <td>
							<cf_gcBorderedTable	title="Messages" tableWidth="100%">	
								<cfinclude template="appSystemMessageDisplay.cfm">
							</cf_gcBorderedTable>	
						</td>
					</tr>					
					<tr>
					    <td>
							<cf_gcBorderedTable	title="Reminders" tableWidth="100%">	
								<cfinclude template="appReminderDisplay.cfm">
							</cf_gcBorderedTable>				
						</td>
					</tr>
				</table>				
			</td>
		</tr>			
	</table>












<cfelse>

	
	
	<!---- appMyDesktop.cfm ---->


	<!-------------------------------------------------------------------------------------->
	<!--- Code for tabs to work.                                                         --->
	<!-------------------------------------------------------------------------------------->
		<cfoutput>	
			<script type="text/javascript" src="includes/tabber.js"></script>
			<link rel="stylesheet" href="styles/tabber.css" TYPE="text/css" MEDIA="screen">
			
			<script type="text/javascript">
				document.write('<style type="text/css">.tabber{display:none;}<\/style>');
			</script>	
			
			<style>
				.container { position: relative; left: 1px; top: 1px; color: ##666; }
				.text { position: absolute; left: -1px; top: -1px; color: ##000;} 
				.box { float: left; width: 430px; height: 100px; }
				##boxContent { border: none; background: ffffff; } 
			</style>
		</cfoutput>
	
		
	
	<!------------------------------------------------------------------>
	<!--- Start the display of this page.                            --->
	<!------------------------------------------------------------------>
		<br>	
		<table cellspacing="0" cellpadding="2" border="0" width="100%">					
			<!---<cfif ListContains(session.User.getRoleIDs(), "5") Or ListContains(session.User.getRoleIDs(), "6") OR ListContains(session.User.getRoleIDs(), "7")></cfif>--->
			<tr>		   
			    <td valign="top">			
					<table>
						<tr>
							<td>
								<!---<div class="box" id="boxContainer">
								<div class="box" id="boxContent">--->
	
								<cf_gcBorderedTable	title="Intakes" tableWidth="100%">	
									<cfinclude template="appIntakeDisplay.cfm">				 
								</cf_gcBorderedTable>
							</td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>
								<cf_gcBorderedTable	title="Tasks" tableWidth="100%">	
									<cfinclude template="appTaskDisplay.cfm">							  												
								</cf_gcBorderedTable>	
							</td>
						</tr>	
						
						<!---<tr>
							<td>
								<cf_gcBorderedTableNew title="Tasks" spanLink="yes" spanLinkTitle="Add&nbsp;Claim&nbsp;Note" onclick="alert('alt')">							
									<cfinclude template="appTaskDisplay.cfm">							  												
								</cf_gcBorderedTableNew>	
							</td>
						</tr>--->
															
					</table>					
				</td>
				<td align="left" valign="top">
					<table cellspacing="2" cellpadding="2" border="0">
						<tr>
						    <td>
								<cf_gcBorderedTable	title="Quotes" tableWidth="100%">	
									<cfinclude template="appQuoteDisplay.cfm">				   
								</cf_gcBorderedTable>
							</td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
						    <td>
								<cf_gcBorderedTable	title="Messages" tableWidth="100%">	
									<cfinclude template="appSystemMessageDisplay.cfm">
								</cf_gcBorderedTable>	
							</td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
						    <td>
								<cf_gcBorderedTable	title="Reminders" tableWidth="100%">	
									<cfinclude template="appReminderDisplay.cfm">
								</cf_gcBorderedTable>				
							</td>
						</tr>
					</table>					
				</td>
			</tr>							
		</table>
		
			
</cfif>








<cfscript>
	include template="/collectmed1.0/CustomTags/appSiteApplicationBottom.cfm";
</cfscript>





















	
	
	
	
	
	
	
	
	
	
	
	