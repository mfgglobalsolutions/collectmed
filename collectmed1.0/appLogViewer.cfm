<!---- appLogViewer.cfm ---->



<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfoutput>			
			
		<cfset ListItem = CreateObject("component", "com.common.db.LogIO")>
		<cfset listItemQuery = listItem.getLogQuery(fields: "LogID,Code,IPaddress,LogText,DateCreated")>

		<span width="100%" class="EOBclaimTableBody">
		
			<table cellspacing="0" cellpadding="4" border="1" width="750">
				<tr>
				    <td nowrap class="SiteLabel" bgcolor="c0c0c0"><strong>ID</strong></td>
				    <td nowrap class="SiteLabel" bgcolor="c0c0c0"><strong>Code</strong></td>
				    <td nowrap class="SiteLabel" bgcolor="c0c0c0">Date</td>
					<td nowrap class="SiteLabel" bgcolor="c0c0c0">Text</td>
				</tr>
				<cfloop query="listItemQuery">
					<tr>
					    <td nowrap class="SiteLabel">#trim(LogID)#</td>
					    <td nowrap class="SiteLabel">#trim(Code)#</td>
					    <td nowrap class="SiteLabel">#DateFormat(trim(DateCreated), 'mm/dd/yyyy')# #TimeFormat(trim(DateCreated), 'hh:mm:ss')#</td>
						<td nowrap class="SiteLabel">#trim(LogText)#</td>
					</tr>
				</cfloop>
			</table>

		<span width="100%" class="EOBclaimTableBody">
				
	</cfoutput>
	
	
	