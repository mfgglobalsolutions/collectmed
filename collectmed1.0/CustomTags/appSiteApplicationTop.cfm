
		
<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="middleColspan" default="1">
	
	<cfparam name="hfColspan" default="3">
	
	<cfset lineLeftBGColor = "FFFFFF">
	
	<cfset lineRightBGColor = "FFFFFF">
	
	<cfset runOnRequestEnd = "yes">
	
	<cfset noBorderPages = "appCalendar.cfm,appReminder.cfm">
		
	<cfset mainID = "siteMainContainer">	
	
	<cfif ListFindNocase(noBorderPages, trim(request.PageName))>
		<cfset mainID = "siteMainCont">	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Link to style sheet.                                                           --->
<!-------------------------------------------------------------------------------------->	
	<link rel="stylesheet" type="text/css" media="all" href="styles/style.css" />	
    <meta http-equiv="Content-Language" content="en-us" />
    <meta name="description" content="Collect Med"/>
    <meta name="keywords" content="Collect Med" />

	
	
<!------------------------------------------------------------------>	
<!--- Call the Javascript funtions page containing general site  --->
<!--- Javascripts.                                               --->	
<!------------------------------------------------------------------>	
	<link type="text/css" href="includes/jquery/themes/base/jquery.ui.all.css" rel="stylesheet" />
	<link type="text/css" href="includes/jquery/css/custom-theme/jquery-ui-1.8.2.custom.css" rel="stylesheet" />	
	<script type="text/javascript" src="includes/jquery/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="includes/jquery/js/jquery-ui-1.8.2.custom.min.js"></script>
	
	
	<script src="includes/dw_event.js" type="text/javascript"></script>
	<script src="includes/dw_viewport.js" type="text/javascript"></script>
	<script src="includes/dw_tooltip.js" type="text/javascript"></script>
	
	<script language="JavaScript" src="eiJavascripts.js"></script>	
	<script type="text/javascript" src="scripts/JScriptIncludes.js" language="JavaScript"></script>				
			
	
	
													
<!------------------------------------------------------------------>
<!--- Start the display of the page if allowed.                  --->
<!------------------------------------------------------------------>	

	<!------------------------------------------------------------------>
	<!--- Determine the colspan the center page will span.           --->
	<!------------------------------------------------------------------>
	<!---<cfif trim(request.Page.getLeftNavigation()) EQ "Y">--->
		<!---<cfset hfColspan = evaluate(hfColspan + 1)>
		<cfset middleColspan = evaluate(middleColspan - 1)>--->
	<!---</cfif>	--->
	
	<!---<cfif trim(request.Page.getRightNavigation()) EQ "Y">
		<cfset hfColspan = evaluate(hfColspan + 1)>
		<cfset middleColspan = evaluate(middleColspan - 1)>
	</cfif>--->
		
	<!---<cfoutput>
		[trim(request.Page.getHeader()): #trim(request.Page.getHeader())#]<br>
		[trim(request.Page.getFooter()): #trim(request.Page.getFooter())#]<br>
		[trim(request.Page.getLeftNavigation()): #trim(request.Page.getLeftNavigation())#]<br>
		[trim(request.Page.getRightNavigation()): #trim(request.Page.getRightNavigation())#]<br>
		[hfColspan: #hfColspan#]<br>
		[middleColspan: #middleColspan#]
	</cfoutput>--->

	
<!------------------------------------------------------------------>
<!--- This is where the actual page display actually happens     --->
<!--- for any page being displayed via EOBManager.               --->
<!------------------------------------------------------------------>	
	<cfoutput>
		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
			<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
			<head>	
				<meta http-equiv="content-type" content="text/html; charset=utf-8" />			
				<title>
					#request.Page.getTitle()#
				</title>
			</head>			
			<body leftmargin="0" topmargin="0" marginwidth="0" onload="Tooltip.init()">
				
				<div id="#mainID#">
				
					<table align="center" width="875" border="0" cellspacing="0" cellpadding="0" bgcolor="ffffff">			
						<tr>
							<td bgcolor="ffffff" colspan="#trim(hfColspan)#">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tr valign="top">
										<cfif trim(request.Page.getRightNavigation()) EQ "Y">
											<td width="1"></td>
										</cfif>
										<td>
											<cfinclude template="/collectmed1.0/appHeader.cfm">
										</td>
										<cfif trim(request.Page.getLeftNavigation()) EQ "Y">
											<td width="1"></td>
										</cfif>
									</tr>
								</table>
							</td>
						</tr>
																
						<tr align="left" valign="top">
							<!------------------------------------------------------------------>
							<!--- Code for the left tree navigation being displayed.         --->
							<!------------------------------------------------------------------>
						   
							<td valign="top" align="left" colspan="1">													
								
								<cfoutput>
									<table border="0" cellpadding="0" cellspacing="0" align="left" bgcolor="ffffff">
										<tr valign="top">																						
											<td width="1" height="1000"></td>																				
										</tr>
									</table> 		
								</cfoutput>							
																
							</td>
												
							
							<!------------------------------------------------------------------>
							<!--- Code for the main center page being displayed.             --->
							<!------------------------------------------------------------------>    
							<td valign="top" align="center" colspan="#trim(middleColspan)#">
								
	</cfoutput>							