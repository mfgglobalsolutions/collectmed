<!---- appAdminStandardLists.cfm ---->



<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cfset List = CreateObject("component", "com.common.db.StandardListIO")>
	<cfset listClaim = list.getStandardListQuery(fields: "StandardListID, ListName, ListDescription")>
	
	<cfoutput>	&nbsp;
		<p>
			<select name="listID" class="SiteSelectBox" onchange="location='#CGI.script_name#?slid='+this.options.value;">
				<cfloop query="listClaim">
					<option value="#StandardListID#" <cfif IsDefined("url.slid") AND url.slid EQ StandardListID>SELECTED</cfif> > #ListName#
				</cfloop>
			</select>
		</p>
		
		<cfif IsDefined("url.slid")>
			
			<cfset ListItem = CreateObject("component", "com.common.db.StandardListItemIO")>
			<cfset listItemQuery = listItem.getStandardListItemQuery(ListID: url.slid, fields: "StandardListItemID, ItemNameDisplay, ItemDescription")>
	
			<span width="100%" class="EOBclaimTableBody">
			
				<table cellspacing="0" cellpadding="4" border="1" width="750">
					<tr>
					    <td nowrap class="SiteLabel" bgcolor="c0c0c0"><strong>ID</strong></td>
					    <td nowrap class="SiteLabel" bgcolor="c0c0c0"><strong>Display Name</strong></td>
					    <td nowrap class="SiteLabel" bgcolor="c0c0c0"><strong>Description</strong></td>
					</tr>
					<cfloop query="listItemQuery">
						<tr>
						    <td nowrap class="SiteLabel">#trim(StandardListItemID)#</td>
						    <td nowrap class="SiteLabel">#trim(ItemNameDisplay)#</td>
						    <td class="SiteLabel"><cfif ItemDescription EQ "">&nbsp;<cfelse>#trim(ItemDescription)#</cfif></td>
						</tr>
					</cfloop>
				</table>
	
			<span width="100%" class="EOBclaimTableBody">
		
		</cfif>
		
		
	</cfoutput>
	
	
	