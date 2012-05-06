<!---- appReportMain.cfm ---->



<!-------------------------------------------------------------------------------------->
<!--- Javascript neede to push the window.                                           --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>
		<script language="JavaScript">
			function showReport(reportID, top, left, urlAppend){				
				reportWindow=window.open('appReportShow.cfm?id=' + reportID + '&' + urlAppend, 'reportWindow', 'dependent=yes,directories=no,hotkeys=no,location=no,copyhistory=no,scrollbars=yes,toolbar=no,menubar=no,resizable=yes,width=#trim(session.screenWidth)#,height=#trim(session.screenHeight)#,left='+left+',top='+top); reportWindow.focus(0);
			};	
		</script>			
	</cfoutput>



<!------------------------------------------------------------------------------------------>
<!--- If the url contains a specific variable then we need a specific report to show.    --->
<!------------------------------------------------------------------------------------------>
	<cfset reportSeries = "ClaimStatuses">
	
	<cfif IsDefined("url.series") AND ListFindNoCase(reportSeries, trim(url.series))>
		<cfoutput>
			<script language="JavaScript">
				showReport('2a', 1, 50, 'item=#trim(url.item)#');
			</script>
		</cfoutput>
	</cfif>



	<cfoutput>&nbsp;<br><br></cfoutput>
	<cf_gcBorderedTable	title="Available&nbsp;Reports&nbsp;&nbsp;&nbsp;&nbsp;" tablealign="center">			
		<table align="center" border="0" cellpadding="4" cellspacing="0">
			<tr>			
				<td class="SiteLabel" nowrap>					
					<span class="sitelabel" style="cursor:hand" onclick="showReport('1a', 1, 50, '');">
						<u>Current&nbsp;Claim&nbsp;Statuses</u>
					</span>
				</td>				
			</tr>
			<tr>			
				<td class="SiteLabel" nowrap>					
					<span class="sitelabel" style="cursor:hand" onclick="showReport('1b', 1, 50, '');">
						<u>Denial&nbsp;Procedure&nbsp;Codes</u>
					</span>
				</td>				
			</tr>
			<tr>			
				<td class="SiteLabel" nowrap>					
					<span class="sitelabel" style="cursor:hand" onclick="showReport('1d', 1, 50, '');">
						<u>Claim&nbsp;Summary&nbsp;By&nbsp;Procedure&nbsp;Code</u>
					</span>
				</td>				
			</tr>	
			<tr>			
				<td class="SiteLabel" nowrap>					
					<span class="sitelabel" style="cursor:hand" onclick="showReport('1c', 1, 50, '');">
						<u>Claim&nbsp;Summary&nbsp;By&nbsp;Reason&nbsp;Code</u>
					</span>
				</td>				
			</tr>						
		</table>
		<br><br>
	</cf_gcBorderedTable>
	
	