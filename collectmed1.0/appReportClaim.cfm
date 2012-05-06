<!---- appReportClaim.cfm ---->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.id" default="">
	<cfset id = attributes.id>
	
	<cfif IsDefined("form.id") AND form.id NEQ "">
		<cfset id = form.id>
	<cfelseif IsDefined("url.id") AND url.id NEQ "">
		<cfset id = url.id>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="id"
		fieldnames="Report ID"
		datatypes="numeric">
		
		
				
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	<cfif ID EQ 1>
		
		<cf_tagReportClaimStatuses>
		
	<cfelseif ID EQ 2 AND IsDefined("url.item") AND url.item EQ "Completed">
		
		<cf_tagReportClaimStatusCompleted item="#trim(url.item)#">	
	
	<cfelseif ID EQ 2 AND IsDefined("url.item") AND url.item EQ "Assigned">
		
		<cf_tagReportClaimStatusAssigned item="#trim(url.item)#">	
	
	</cfif>		
	
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td colspan="2" align="center" nowrap>			
				<br><div align="center"><input type="Button" class="SiteSubmitbox" value="Close&nbsp;Window" onclick="self.close();"></div>							
			</td>
		</tr>	
				
	</table>	
	
	