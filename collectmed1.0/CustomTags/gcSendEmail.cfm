<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@Name@@                                                   --->
<!--- gcSendEmail.cfm                                            --->
<!--- @@Name@@                                                   --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- CATEGORY:                                                  --->
<!--- @@CATEGORY@@                                               --->
<!--- General                                                    --->
<!--- @@CATEGORY@@                                               --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- AUTHOR:                                                    --->
<!--- @@AUTHOR@@                                                 --->
<!--- Guillermo Cruz                                             --->
<!--- @@AUTHOR@@                                                 --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- DESCRIPTION:                                               --->
<!--- @@DESCRIPTION@@                                            --->
<!--- This tag will send an email to a recepient.                --->
<!--- @@DESCRIPTION@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@ExampleCall@@                                            --->
<!--- &lt;cf_gcSendEmail<br>                                     --->
<!--- subject="subject line."<br>                                --->
<!--- message="There was an issue."&gt;                          --->
<!--- @@ExampleCall@@                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- REQUIRED PARAMETERS:                                       --->
<!--- @@RequiredParameters@@                                     --->
<!--- to<br>                                                     --->
<!--- from<br>                                                   --->
<!--- subject<br>                                                --->
<!--- message                                                    --->
<!--- @@RequiredParameters@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- OPTIONAL PARAMETERS:                                       --->
<!--- @@OptionalParameters@@                                     --->
<!--- cc                                                         --->
<!--- @@OptionalParameters@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- RETURNED PARAMETERS:                                       --->
<!--- @@ReturnedParameters@@                                     --->
<!--- [None]                                                     --->
<!--- @@ReturnedParameters@@                                     --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!--- @@HISTORY@@                                                --->
<!---  Created 08/05/2004                                        --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->
<!------------------------------------------------------------------>



<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->
<!------------------------------------------------------------------>
	<cfparam name="attributes.subject" default="">
	<cfset subject = attributes.subject>

	<cfparam name="attributes.message" default="">
	<cfset message = attributes.message>
	
	<cfparam name="attributes.type" default="HTML">
	<cfset type = attributes.type>
			
	<cfparam name="attributes.from" default="">
	<cfset from = attributes.from>

	<cfparam name="attributes.to" default="">
	<cfset to = attributes.to>

	<cfparam name="attributes.cc" default="">
	<cfset cc = attributes.cc>
	
	<cfparam name="attributes.bcc" default="">
	<cfset bcc = attributes.bcc>
	
	<cfparam name="attributes.debug" default="false">
	<cfset debug = attributes.debug>
	
	<cfparam name="attributes.sendErrorToCaller" default="yes">
	<cfset sendErrorToCaller = attributes.sendErrorToCaller>
	
	
	
<!------------------------------------------------------------------>
<!--- make sure that mandatory variables have been passed in.    --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="subject,message"
		fieldnames="Subject,Message"
		sendErrorToCaller="yes">
	
	<cfif IsDefined("errorMessage") AND errorMessage NEQ "">
		<cfthrow message = "Verify fields issue. TAG: gcSendEmail.cfm <p>#trim(errorMessage)#</p> <p>An email was not sent out. the context of the email is as follows</p> <p>to=#trim(to)#<br> from=#trim(from)#<br> subject=#trim(subject)#<br> message=#trim(message)#</p>">
	</cfif>
	
	
	
<!------------------------------------------------------------------>
<!--- Verify that the sent in email addresses are formatted      --->
<!--- correctly.                                                 --->
<!------------------------------------------------------------------>
	<cf_gcIsValidEmailAddress email="#trim(to)#">
	
	<cfif IsDefined("validEmail") AND NOT validEmail>
		<cfthrow message = "The email address (to: #trim(to)#) is not formatted correctly. gcSendEmail.cfm <p>An email was not sent out. the context of the email is as follows</p> <p>to=#trim(to)#<br> from=#trim(from)#<br> subject=#trim(subject)#<br> message=#trim(message)#</p>">
	</cfif>

	<cf_gcIsValidEmailAddress email="#trim(from)#">

	<cfif IsDefined("validEmail") AND NOT validEmail>
		<cfthrow message = "The email address (from: #trim(from)#) is not formatted correctly. gcSendEmail.cfm <p>An email was not sent out. the context of the email is as follows</p> <p>to=#trim(to)#<br> from=#trim(from)#<br> subject=#trim(subject)#<br> message=#trim(message)#</p>">
	</cfif>
	
	<cfif Len(cc) GTE 5>
		<cf_gcIsValidEmailAddress email="#trim(cc)#">
		<cfif IsDefined("validEmail") AND NOT validEmail>
			<cfthrow message = "The email address (cc: #trim(cc)#) is not formatted correctly. gcSendEmail.cfm <p>An email was not sent out. the context of the email is as follows</p> <p>to=#trim(to)#<br> from=#trim(from)#<br> subject=#trim(subject)#<br> message=#trim(message)#</p>">
		</cfif>
	</cfif>

	<cfif Len(bcc) GTE 5>
		<cf_gcIsValidEmailAddress email="#trim(bcc)#">
		<cfif IsDefined("validEmail") AND NOT validEmail>
			<cfthrow message = "The email address (bcc: #trim(bcc)#) is not formatted correctly. gcSendEmail.cfm <p>An email was not sent out. the context of the email is as follows</p> <p>to=#trim(to)#<br> from=#trim(from)#<br> subject=#trim(subject)#<br> message=#trim(message)#</p>">
		</cfif>
	</cfif>



<!------------------------------------------------------------------>
<!--- Mail the site administrator that there has been an issue.  --->
<!--- The email consists of the parameters sent.                 --->
<!------------------------------------------------------------------>
	<cfif Len(cc) GTE 5>
		<cfset ccReceipient = "#trim(cc)#">
	<cfelse>
		<cfset ccReceipient = "">
	</cfif>
	
	<cfif Len(bcc) GTE 5>
		<cfset bccReceipient = "#trim(bcc)#">
	<cfelse>
		<cfset bccReceipient = "">
	</cfif>
	

	
	
<!-------------------------------------------------------------------------------------->
<!--- Testing purposes                                                               --->
<!-------------------------------------------------------------------------------------->			
	<cfif trim(to) EQ "phillip@eobmanager.net">
		<cfset bccReceipient = "gcruz@eobmanager.net">
		<cfset from = "support@collectmed.net">
	</cfif>
	
	<cfif FindNoCase("test", trim(to))>	
		<cfset subject = subject & " [to changed: #trim(to)#]">	
		<cfset to = "gcruz@eobmanager.net,phillip@eobmanager.net">			
	</cfif>			
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- send the email                                                                 --->
<!-------------------------------------------------------------------------------------->	
	<cfmail to="#trim(to)#" from="#trim(from)#" cc="#trim(ccReceipient)#" bcc="#trim(bccReceipient)#" subject="#trim(subject)#" type="#trim(type)#">
		
		<font face="arial" size="2">
			
			<cfif from EQ "autoreply@eobmanager.net">
				<p>This is automatically generated email. Please do not respond to this email address. Contact your site administrator.</p>
			</cfif>
			
			#trim(message)#<p>
			
			<cfif debug>
				<font color="FFFFFF">
					IP: #CGI.REMOTE_ADDR#<br>
					Date Stamp: #DateFormat(NOW(), "mm/dd/yyyy")# #TimeFormat(NOW())#<br>
					Page Name: #CGI.SCRIPT_NAME#<br>
				</font>
			</cfif>
			
		</font>
		
	</cfmail>

	
