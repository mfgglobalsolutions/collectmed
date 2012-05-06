


<!------------------------------------------------------------------>
<!--- Start the display of this page.                            --->
<!------------------------------------------------------------------>
	
	
	<!---<cfoutput>
		<cfif FindNoCase("secure.", trim(CGI.SERVER_NAME))>			
			<table border="0" cellspacing="0" cellpadding="0" align="left">
				<tr>		
					<td align="right" class="siteLabel">
						<span onclick="verifySealFooter();" style="cursor: hand; color:blue" onmouseover="doTooltip(1, this, event, 'Session Secured with <strong>#trim(CGI.HTTPS_KEYSIZE)#</strong> Bit Encryption. <br><br>Click on the lock image to verify Collect Med\'s certificate. <br><br>Collect Med online application operates using the maximum level of encryption supported by your browser. Encryption is used to protect communications from eavesdropping, tampering, or message forgery over the Internet. It is a mathematical process that transforms a message so its meaning is concealed from everyone except the intended recipient. Encryption technology is used in many online applications for such things as securely transmitting account information over the Internet.');" onmouseout="hideTip(this);"><img border="0" height="20" width="16" align="absmiddle" src="/images/iconLock.gif">&nbsp;secure application</span>	
					</td>
				</tr>		
			</table>
		</cfif>
	</cfoutput>--->
	
	<!---<cfoutput>
		<cfif FindNoCase("secure.", trim(CGI.SERVER_NAME))>		
			<table border="0" cellpadding="0" cellspacing="0" align="left">
				<tr>
					<td align="left">					
						<script language="JavaScript">
							<!--
								document.write('<img height="60" title="Session Secured with #trim(CGI.HTTPS_KEYSIZE)# Bit Encryption" style="cursor:pointer;cursor:hand" src="https://secure.collectmed.com/images/sslsecured.gif" onclick="verifySeal();">');
													
								function verifySeal(){
									var url = 'https://seal.godaddy.com:443/verifySeal?sealID=2060726648065c1de3a1271089bad249a17c700513654440';		
									window.open(url,'SealVerfication','location=yes,status=yes,resizable=yes,scrollbars=yes,width=650,height=450');
								}
							// -->
						</script>					
					</td>
				</tr>
			</table> 	
		</cfif>					
	</cfoutput>--->
	
	<!---Working placement took out when adding ssl image.
	<cfoutput>
		<table border="" cellpadding="0" cellspacing="0" width="100%">			
			<tr valign="top">
				<cfif trim(request.Page.getRightNavigation()) EQ "Y">
					<td bgcolor="#trim(request.Site.getLeftNavigationBorderColor())#" width="1"></td>
				</cfif>
				<td>
					<div align="center"><img src="images/TempBanner_750x82.gif" width="750" height="82" alt="" border="0"></div>
				</td>	
				<cfif trim(request.Page.getLeftNavigation()) EQ "Y">
					<td bgcolor="#trim(request.Site.getRightNavigationBorderColor())#" width="1"></td>
				</cfif>					
			</tr>
			<tr valign="top">
				<cfif trim(request.Page.getRightNavigation()) EQ "Y">
					<td bgcolor="#trim(request.Site.getLeftNavigationBorderColor())#" width="1"></td>
				</cfif>
				<td bgcolor="#trim(request.Site.getLeftNavigationBorderColor())#"></td>				
				<cfif trim(request.Page.getLeftNavigation()) EQ "Y">
					<td bgcolor="#trim(request.Site.getRightNavigationBorderColor())#" width="1"></td>
				</cfif>					
			</tr>
		</table> 		
	</cfoutput>--->


	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	