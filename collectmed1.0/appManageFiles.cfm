<!---- appManageFiles.cfm ---->



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.msg" default="">
	<cfset msg = attributes.msg>
	
	<cfif IsDefined("form.msg") AND form.msg NEQ "">
		<cfset msg = form.msg>
	<cfelseif IsDefined("url.msg") AND url.msg NEQ "">
		<cfset msg = url.msg>	
	</cfif>



<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	
	<!-------------------------------------------------------------------------------------->
	<!--- If there is a message sent display it.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cfif msg NEQ "">
		<cfoutput>
			&nbsp;<p><font face="Arial" size="4" color="c0c0c0">#trim(msg)#</font></p>			
		</cfoutput>
	</cfif>	
	
	<br>
	
	<cf_gcBorderedTable title="Manage Files" tablealign="center" tablewidth="50%">
		
		<table border="0" width="100%">		
			<tr>
				<td class="SiteLabel">									
					<a href="appUpload835File.cfm">Upload&nbsp;MEDICAID&nbsp;835&nbsp;File</a>						
				</td>								
			</tr>	
			<tr>
				<td class="SiteLabel">									
					<a href="appUploadMedicare835File.cfm">Upload&nbsp;MEDICARE&nbsp;835&nbsp;File</a>						
				</td>								
			</tr>	
		</table>
				
	</cf_gcBorderedTable>
	
