
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.randRange" default="#randRange(1001, 2252)#">
	<cfset randRange = attributes.randRange>
	
	<cfparam name="attributes.formname" default="PasswordForm">
	<cfset formname = attributes.formname>
	
	<cfparam name="attributes.fontFace" default="#request.Site.getFont()#">
	<cfset fontFace = attributes.fontFace> 
	
	<cfparam name="attributes.fontSize" default="#request.Site.getFontSize()#">
	<cfset fontSize = attributes.fontSize>
	
	<cfparam name="attributes.fontColor" default="#request.Site.getFontColor()#">
	<cfset fontColor = attributes.fontColor>	

	<cfparam name="attributes.UsersID" default="">
	<cfset UsersID = attributes.UsersID>		
	
	<cfif IsDefined("form.UsersID") AND form.UsersID NEQ "">
		<cfset UsersID = form.UsersID>
	<cfelseif IsDefined("url.UsersID") AND url.UsersID NEQ "">
		<cfset UsersID = url.UsersID>	
	</cfif>
	
	
		
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="UsersID, EntryResponse"
		fieldnames="Users ID, Retrieval Answer">
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Start the processing of this page.                                             --->
<!-------------------------------------------------------------------------------------->			
			
		<!-------------------------------------------------------------------------------------->
		<!--- Create an global Footer varaible converted.                                    --->
		<!-------------------------------------------------------------------------------------->
		<cfset EntryResponse = application.beanFactory.getBean('globalFooter').GlobalFooterE(lcase(trim(EntryResponse))) />
				
			
		<!------------------------------------------------------------------>
		<!--- Query database for matching username and password          --->
		<!------------------------------------------------------------------>		
		<cfinvoke component="com.common.User" method="getUsersQuery" siteid="#trim(request.Site.getSiteID())#" Active="1" entryresponse="#trim(EntryResponse)#" Usersid="#trim(UsersID)#" returnvariable="accesscontrol">
		
		<cfif accesscontrol.RecordCount LT 1>
			
			<cfset message ="Please try again. There was an issue retreiving your information.<p>If you continue to see this message contact your administrator.</p>">
			<cflocation addtoken="No" url="appRetrieveUp.cfm?msg=#URLEncodedFormat(message)#">	
			
		</cfif>	
	
		
		<!-------------------------------------------------------------------------------------->
		<!--- get the users email addresses.                                                 --->
		<!-------------------------------------------------------------------------------------->
		<cfquery name="getUserEmailAddresses" datasource="#trim(request.datasource)#">
			SELECT EmailAddressID, EmailTypeID, Email, IsDefault
			FROM EmailAddress
			WHERE EntityID = #trim(accesscontrol.EntityID)#
		</cfquery>		
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- If the user has no email address then there is an issue because we cannot      --->
		<!--- notify them. In this case make the user call their administrator.              --->
		<!-------------------------------------------------------------------------------------->	
		<cfif getUserEmailAddresses.RecordCount LT 1>
		
			<cfset message ="The account is not eligible for password retrieval.<br>Please contact your administrator.  79">
			<cflocation addtoken="No" url="appRetrieveUp.cfm?msg=#URLEncodedFormat(message)#">
			
		</cfif>
	
	
		<!-------------------------------------------------------------------------------------->
		<!--- Create a user account for the adminstrator. Giving the admin the admin role.   --->
		<!-------------------------------------------------------------------------------------->			
		<cfquery name="getWord" datasource="#request.datasource#">
			SELECT word 
			FROM randomword  
			WHERE randomwordid = #trim(randRange)#
		</cfquery>
			
		<cfset newEntryPoint = getWord.word & UsersID> 
		
		<cfset EntryPoint = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(newEntryPoint))>
					
		<cfquery name="updateUsersAccount" datasource="#trim(request.datasource)#">
			UPDATE Users  
			SET EntryPoint = '#trim(EntryPoint)#', ChangedPassword = 0
			WHERE UsersID = #trim(UsersID)#
		</cfquery>		

		<cfset toList = "">
		<cfset ccList = "">
		
		<cfloop query="getUserEmailAddresses">
			
			<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(Email))>
					
			<cfif IsDefault EQ 1>
				<cfset toList = ListAppend(toList, trim(EmailAddress))>
			<cfelse>
				<cfset ccList = ListAppend(ccList, trim(EmailAddress))>	
			</cfif> 
			
		</cfloop> 
		
		<!-------------------------------------------------------------------------------------->
		<!--- Send an email to the administrator showing them their new password and         --->
		<!--- username so they can instantly login.                                          --->
		<!-------------------------------------------------------------------------------------->			
		<cf_gcSendemail 
			to="#trim(toList)#"
			cclist="#trim(ccList)#" 
			bcc="gcruz@eobmanager.net"
			from="autoreply@eobmanager.net" 
			subject="Information Requested." 
			type="HTML" 
			message="<font face=Verdana><p><font size=3 color=990000><strong>Your account password has been reset.</strong></font></p><p><font size=2 color=990000>If you did not request your password be changed please contact your site administrator immediately.</font></p><p><font color=990000>NOTE: Case Sensitive</font><br><strong>Your new temporary password:</strong> #trim(newEntryPoint)#</p></font>"
			debug="true">
			
			
		<cfset msg = "<font size=2 face=Verdana><p>An email has been sent to the default email address on the account.</p></font>">
			
		<cf_gcBorderedTable topSpace="yes" tableAlign="center" titlesize="2" titleFont="#trim(fontFace)#" backgroundColor="c0cddc" title="User&nbsp;Account&nbsp;Changed" tableWidth="80%">
	
			<cfoutput>
				<p>#trim(msg)#</p>
				<p><font face=Verdana><p><font size=3 color=990000><strong>Your account password has been reset.</strong></font></p><p><font color=990000>NOTE: Case Sensitive</font><br><strong>Your new temporary password:</strong> #trim(newEntryPoint)#</p></font></p>
			</cfoutput>
		
		</cf_gcBorderedTable>
		
		