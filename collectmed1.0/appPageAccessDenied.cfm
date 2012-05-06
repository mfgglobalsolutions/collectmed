<!---- appPageAccessDenied.cfm ---->



<cf_gcBorderedTable title="Page access denied" tablewidth="width=75%">				
	<cfoutput>
		<font face="#request.Site.getFont#" size="#request.Site.getFontSize()#" color="#request.Site.getFontColor()#">		
			You do not have the authority to view this page. If you feel this is a mistake contact the site adminitrator at <a href="mailto:#request.Site.getAdministratorEmailID()#">#request.Site.getAdministratorEmailID()#</a><p>							
			<div align="center"><input type="button" value="Back" onclick="history.back()"></div>
		</font>			
	</cfoutput>
</cf_gcBorderedTable>


