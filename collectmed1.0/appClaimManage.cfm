<!---- appWorkItemManage.cfm ---->

	<cfoutput>&nbsp;<br><br>
		<cf_gcBorderedTable	title="Manage&nbsp;Claims&nbsp;&nbsp;&nbsp;&nbsp;" tablealign="center">			
			<table align="center" border="0" cellpadding="4" cellspacing="0">
				
				<!---
				<cfif ListContains(session.User.getRoleIDs(), "8")>
					<tr>
						<td class="SiteLabel">		
							<a href="appClaimAutoAssign.cfm">Auto&nbsp;Assign&nbsp;Claims</a>
						</td>
					</tr>		
				</cfif>			
				--->
				<cfset str = "This is a link to search all claims based on  parameters you choose.">
				<tr>			
					<td class="SiteLabel" nowrap><a href="appClaimSearch.cfm" onMouseOver="showPopupLayer('#str#')" onMouseOut="hidePopupLayer()">Search&nbsp;Claims</a></td>				
				</tr>			
			</table>
			<br><br>
		</cf_gcBorderedTable>
	</cfoutput>
	
	
