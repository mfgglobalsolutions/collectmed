<!---- appChangePasswordProcess.cfm ---->



<!-------------------------------------------------------------------------------------->
<!--- If the variable data 1 is not present or does not equal the logged in user     --->
<!--- something is very wrong.                                                       --->
<!-------------------------------------------------------------------------------------->
	<cfif NOT IsDefined("url.data1") OR trim(url.data1) NEQ trim(session.User.getUsersID())>
		
		<cfset errorMessage = "PASSWORD CHANGE ISSUE POSSIBLE HACK [NOT IsDefined(url.data1) OR trim(url.data1) NEQ #trim(session.User.getUsersID())#   IP: #CGI.REMOTE_ADDR#]">
						
		<cf_gcGatewayLogger			
			datasource="#trim(request.datasource)#" 
			code="115"
			logtext="#trim(errorMessage)#">	
			
		<cf_gcGeneralErrorTemplate
			message="There was an issue processing the page. If you continue to see this message please contact your site administrator. V1"
			width="75%">			
			
	</cfif>
	
	
	
	<cfif NOT IsDefined("form.password") OR trim(form.password) EQ "" OR trim(form.password) NEQ trim(form.passwordConfirm)>
						
		<cf_gcGeneralErrorTemplate
			message="The password sent in is blank or does not match"
			width="75%">			
			
	</cfif>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the processing of this page.                                             --->
<!-------------------------------------------------------------------------------------->
<cftry>
	
	<cftransaction>
		
		<!-------------------------------------------------------------------------------------->
		<!--- Update the password.                                                           --->
		<!-------------------------------------------------------------------------------------->
		<cfset EntryPoint = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(form.password)) />
				
		<cfif IsDefined("form.EntryResponse") AND form.EntryResponse NEQ "" AND IsDefined("form.EntryQID") AND form.EntryQID NEQ "">
			<cfset EntryResponse = application.beanFactory.getBean('globalFooter').GlobalFooterE(lcase(trim(form.EntryResponse))) />
		</cfif>
		
		<cfquery name="updateUsers" datasource="#trim(request.datasource)#">
			UPDATE pa_master.Users 
			SET EntryPoint = '#trim(EntryPoint)#', ChangedPassword = 1
			<cfif IsDefined("form.EntryQID") AND form.EntryQID NEQ "" AND IsDefined("form.EntryResponse") AND form.EntryResponse NEQ "">, EntryQID = '#trim(form.EntryQID)#'</cfif>
			<cfif IsDefined("form.EntryResponse") AND form.EntryResponse NEQ "" AND IsDefined("form.EntryQID") AND form.EntryQID NEQ "">, EntryResponse = '#trim(EntryResponse)#'</cfif>
			WHERE usersID = #trim(session.User.getUsersID())#
		</cfquery>
		
		<cfset session.User.setChangedPassword(1)>
	
	</cftransaction>

	<cfcatch type="Any">
		
		<cf_gcGeneralErrorTemplate
			message="There was an issue processing the page. If you continue to see this message please contact your site administrator. V2">
		<cfabort>
				
	</cfcatch>

</cftry>	


<!-------------------------------------------------------------------------------------->
<!--- Start the display of this pGE.                                                 --->
<!-------------------------------------------------------------------------------------->
	<br>	
	<cfoutput>
		<p>
			<font face="Verdana" size="4" color="990000">
				Congratulations! Your password has been successfully changed.
				<p>
					The next time you log on you will need to use your new password.
				</p>
				<p>
					<script language="JavaScript">					
						self.setTimeout('winChange()', 3500) 					
						function winChange(){
							window.location.href = 'appMyDesktop.cfm';
						};					
					</script>
				</p>
			</font>
			<span class="siteLabel">
				<a href="appMyDesktop.cfm">Click here</a> if you are not forwarded to the login page.
			</span>
		</p>			
	</cfoutput>
	

	

