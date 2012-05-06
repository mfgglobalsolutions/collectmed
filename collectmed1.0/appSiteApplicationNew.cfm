<!------------------------------------------------------------------>
<!--- NAME: appSiteApplication.cfm                               --->
<!------------------------------------------------------------------>
<!--- PURPOSE:                                                   --->
<!--- This page will create the beginning of the page that       --->
<!--- will be sent in. This is where any page starts             --->
<!--- its display.                                               --->      
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!---                                                            --->
<!---                                                            --->      
<!------------------------------------------------------------------>


		
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
	


	
<!------------------------------------------------------------------>
<!--- This is where the actual page display actually happens     --->
<!--- for any page being displayed via EOBManager.               --->
<!------------------------------------------------------------------>	
	<cfoutput>
		<!DOCTYPE html>
			<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
			<head>					

			    <meta http-equiv="Content-Language" content="en-us" />
			    <meta name="description" content="Collect Med"/>
			    <meta name="keywords" content="Collect Med" />	
			    <meta http-equiv="content-type" content="text/html; charset=utf-8" />			
				
				<!-------------------------------------------------------------------------------------->
				<!--- Link to style sheet.                                                           --->
				<!-------------------------------------------------------------------------------------->	
				<link rel="stylesheet" type="text/css" media="all" href="styles/style.css" />	
				<link type="text/css" href="includes/jquery/themes/base/jquery.ui.all.css" rel="stylesheet" />
				<link type="text/css" href="includes/jquery/css/custom-theme/jquery-ui-1.8.2.custom.css" rel="stylesheet" />												
					
				<!-------------------------------------------------------------------------------------->	
				<!--- Call the Javascript funtions page containing general site Javascripts.         --->	
				<!-------------------------------------------------------------------------------------->	
				<script type="text/javascript" src="includes/jquery/js/jquery-1.4.2.min.js"></script>
				<script type="text/javascript" src="includes/jquery/js/jquery-ui-1.8.2.custom.min.js"></script>	
											
				<script type="text/javascript" src="includes/dw_event.js"></script>
				<script type="text/javascript" src="includes/dw_viewport.js"></script>
				<script type="text/javascript" src="includes/dw_tooltip.js"></script>
								
				<script type="text/javascript" src="eiJavascripts.js" language="JavaScript"></script>						
				<script type="text/javascript" src="scripts/JScriptIncludes.js" language="JavaScript"></script>					
									
				
				<title>
					#request.Page.getTitle()#
				</title>
				
				<style type="text/css">
					body{				    	
						width: 100%;
						border: 1px dashed red;
					}
					.center{
						margin:auto;
						width: 100%;
						/*background-color:##b0e0e6;*/
					}
					###mainID#{
						width: 875px;
						border: 1px dashed green;
						float: center;
					}
				</style>
				

				
			</head>			
			<body  bgcolor="#request.Site.getBGcolor()#" leftmargin="0" topmargin="0" marginwidth="0" onload="Tooltip.init()"><!---style="margin:0" onLoad="writeMenus()" onResize="if (isNS4) nsResizeHandler()"--->				
				
				<div id="#mainID#" class="center">
					
					<div id="siteHeader" class="center">
						<cfinclude template="#request.Site.getHeaderFileName()#">
					</div>
					
					<table align="#request.Site.getAlign()#" width="875" border="0" cellspacing="0" cellpadding="0">			
						<!---<tr align="left" valign="top"><td colspan="4"><img src="images/Test800.gif" width="800" height="5" border="0" alt=""></td></tr>--->
						<!--- <cfif trim(request.Site.getHeaderFileName()) NEQ "" AND trim(request.Page.getHeader()) EQ "Y">
							<tr><td bgcolor="ffffff" colspan="#trim(hfColspan)#"><table border="0" cellpadding="0" cellspacing="0" width="100%"><tr valign="top"><cfif trim(request.Page.getRightNavigation()) EQ "Y"><td bgcolor="#trim(request.Site.getLeftNavigationBorderColor())#" width="1"></td></cfif><td><cfinclude template="#request.Site.getHeaderFileName()#"></td><cfif trim(request.Page.getLeftNavigation()) EQ "Y"><td bgcolor="#trim(request.Site.getRightNavigationBorderColor())#" width="1"></td></cfif></tr></table></td></tr>
						</cfif>	 --->									
						<tr align="left" valign="top">
							<!------------------------------------------------------------------>
							<!--- Code for the left tree navigation being displayed.         --->
							<!------------------------------------------------------------------>
						   
							<td valign="top" align="left" colspan="1">													
								
								<cfoutput>
									<table border="0" cellpadding="0" cellspacing="0" align="left" bgcolor="ffffff">
										<tr valign="top">			
											
											<cfif trim(request.Page.getLeftNavigation()) EQ "Y">
												<cfset lineLeftBGColor = trim(request.Site.getLeftNavigationBorderColor())>																
											</cfif>
											
											<td bgcolor="#trim(lineLeftBGColor)#" width="1" height="1000"></td>
											
											<cfif trim(request.Page.getLeftNavigation()) EQ "Y">
												<td valign="top">					
													 <cfinclude template="#request.Site.getLeftTemplateFileName()#">
												</td>
											</cfif>
											
										</tr>
									</table> 		
								</cfoutput>							
																
							</td>
												
							
							<!------------------------------------------------------------------>
							<!--- Code for the main center page being displayed.             --->
							<!------------------------------------------------------------------>    
							<td valign="top" align="center" colspan="#trim(middleColspan)#">
								
								<cftry>
									
									<cfinclude template="#request.PageName#">
									
									<cfcatch type="any">
				
										<p><strong>#cfcatch.type#</strong><br>
										#cfcatch.message# #cfcatch.detail#<br>
										<cfabort>									
									</cfcatch>
									
									
								</cftry>
								
							</td>
							
							<!------------------------------------------------------------------>
							<!--- Code for the far right navigation page bieng displayed.    --->
							<!------------------------------------------------------------------>					   
							
							<td valign="top" align="right" colspan="1"> 				
								
								<table border="0" cellpadding="0" cellspacing="0">			
									<tr valign="top">
										<cfif trim(request.Page.getRightNavigation()) EQ "Y">
											<td>
												<cfinclude template="#request.Site.getRightTemplateFileName()#">										
											</td>	
										</cfif>	
										
										
										<cfif trim(request.Page.getRightNavigation()) EQ "Y">
											<cfset lineRightBGColor = trim(request.Site.getLeftNavigationBorderColor())>																
										</cfif>
										
										<td bgcolor="#trim(lineRightBGColor)#" width="1" height="1000"><img src="images/transparent.gif" width="1" height="1" border="0" alt=""></td>					
													
									</tr>
								</table> 	
																																				
							</td>
								
						</tr>												
						
						<!------------------------------------------------------------------>
						<!--- Finish the page being loaded with closing the page.        --->
						<!------------------------------------------------------------------>
						<cfif trim(request.Site.getFooterFileName()) NEQ "" AND trim(request.Page.getFooter()) EQ "Y">
							<tr>
							    <td colspan="#trim(hfColspan)#" align="center">
									
									<cftry>
									
										<cfinclude template="#request.Site.getFooterFileName()#">
										
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
	<!---<cfif runOnRequestEnd>
		<cf_gcOnRequestEnd>
	</cfif>--->
		
	<cfif ListFindNoCase("dev,sta", request.cfservername) OR (Isdefined("url.prefill") AND url.prefill EQ "yes") OR (Isdefined("session.prefill") AND session.prefill)>
		<cfset session.prefill = true>	       
		<cfinclude template="prefill.cfm">
	</cfif>	
	
			
<!------------------------------------------------------------------>
<!--- This CFABORT tag is needed here so that the page does      --->
<!--- not get loaded up twice. The processing of the page        --->
<!--- actually happens by CFINLCUDE                              --->
<!------------------------------------------------------------------>	
	<cfabort>


