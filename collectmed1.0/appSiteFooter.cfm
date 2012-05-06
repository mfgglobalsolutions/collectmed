<!------------------------------------------------------------------>
<!--- NAME: appSiteFooter.cfm                                    --->
<!------------------------------------------------------------------>
<!--- PURPOSE:                                                   --->      
<!---                                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!---                                                            --->
<!---                                                            --->      
<!------------------------------------------------------------------>


	
	<cfoutput>
		<table align="center" cellspacing="0" cellpadding="0" border="0" width="750">
			<!---<tr>
			    <td colspan="2">					
					<map name="Menu Map">
						<area alt="Home" coords="1,0,170,16" href="#trim(request.Site.FullHttpHost)#/index.cfm" shape="RECT">
						<area alt="Products" coords="171,0,250,16" href="#trim(request.Site.FullHttpHost)#/appProducts.cfm" shape="RECT">
						<area alt="Ordering Info" coords="251,0,355,16" href="#trim(request.Site.FullHttpHost)#/appOrder.cfm" shape="RECT">
						<area alt="FAQ's" coords="356,0,550,16" href="#trim(request.Site.FullHttpHost)#/appFAQ.cfm" shape="RECT">
						<area alt="Contact Us" coords="551,0,730,16" href="#trim(request.Site.FullHttpHost)#/appContactUs.cfm" shape="RECT">
					</map>
					<img src="images/footer_menu.jpg" width="730" height="15" border="0" alt="" usemap="##Menu Map"><br><img src="images/footer_left.gif" border="0" alt=""><img src="images/footer_right.gif" border="0" alt=""></td></tr>
			<tr>--->
				<td>
					<font face="Arial" size="1">
						<br><br>Site Design By <a href="http://www.thirteenthfloorstudio.com/home.html" target="_blank">Thirteenth Floor Studio</a><br><br>
					</font>
				</td>
				<td align="right">
					<font face="Arial" size="1">
						<br><br>best viewed with <a href="http://www.microsoft.com/windows/ie/downloads/default.asp" target="_blank">IE 5+</a> or <a href="http://www.netscape.com/download/index.html" target="_blank">NS 6+</a>&nbsp;<br><br>
					</font>
				</td>
			</tr>
			<cfif isDefined("request.User.UsersID") AND request.User.UsersID EQ "1" AND request.FindOccurrences(trim(request.Site.FullHttpHost),"dev") GTE 1>	
				<tr>
					<td>
						<br>
						<!---<a href="javascript:VerifyDeleteAction('appEndearingWicksReload.cfm?Reload=yes','Are you sure you want to reload?');">--->
						<a href="#trim(request.Site.FullHttpHost)#/appSiteReload.cfm?Reload=yes" target="_blank">
							<font size="1">
								Reload #request.Site.getSiteName()#
							</font>
						</a>
						<br>
					</td>
				</tr>
			</cfif>
		</table>
	</cfoutput>


