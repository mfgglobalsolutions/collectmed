<!------------------------------------------------------------------>
<!--- NOTE: PLACE ALL TAG INFORMATION YOU WANT DISPLAYED IN      --->
<!--- BETWEEN THE DOUBLE @@ SYMBOLS.                             --->
<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
<!--- @@NAME@@                                                   --->
<!---  gcGeneralErrorTemplate.cfm                                --->
<!--- @@NAME@@                                                   --->
<!------------------------------------------------------------------>
<!--- CATEGORY:                                                  --->
<!--- @@CATEGORY@@                                               --->
<!---   General                                                  --->
<!--- @@CATEGORY@@                                               --->
<!------------------------------------------------------------------>
<!--- AUTHOR:                                                    --->
<!--- @@AUTHOR@@                                                 --->
<!---   Guillermo Cruz                                           --->
<!--- @@AUTHOR@@                                                 --->
<!------------------------------------------------------------------>
<!--- DESCRIPTION:                                               --->      
<!--- @@DESCRIPTION@@                                            --->
<!--- With this tag you can handle any general error just send   --->
<!--- the message you want displayed and the tag will stop       --->
<!--- processing right there allowing your user to fix the       --->
<!--- issue.                                                     --->
<!--- @@DESCRIPTION@@                                            --->
<!------------------------------------------------------------------>
<!--- EXAMPLE CALL:                                              --->
<!--- @@ExampleCall@@                                            --->
<!---   &lt;cf_gcGeneralErrorTemplate                            --->
<!--- <br> message="[Your message]"&gt;                          --->
<!---@@ExampleCall@@                                             --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- REQUIRED PARAMETERS:                                       --->
<!--- @@RequiredParameters@@                                     --->
<!---   message                                                  --->  
<!---@@RequiredParameters@@                                      --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- OPTIONAL PARAMETERS:                                       --->
<!--- @@OptionalParameters@@                                     --->
<!---   width                                                    --->
<!--- <br>title                                                  --->
<!--- <br>subtitle                                               --->
<!--- <br>bgcolor                                                --->
<!--- <br>titleFontColor                                         --->
<!--- <br>space (boolean)                                        --->
<!--- <br>back (boolean)                                         ---> 
<!--- <br>backmessage (next to the back button.)                 ---> 
<!---@@OptionalParameters@@                                      --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- RETURNED PARAMETERS:                                       --->
<!--- @@ReturnedParameters@@                                     --->
<!---   [None]                                                   --->  
<!---@@ReturnedParameters@@                                      --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!--- @@HISTORY@@                                                --->
<!---   Created 11/24/03                                         --->
<!--- @@HISTORY@@                                                --->
<!---                                                            --->      
<!------------------------------------------------------------------>



<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="attributes.title" default="Issue Processing Page">
	<cfset title = attributes.title>
	
	<cfparam name="attributes.subtitle" default="There was an issue processing the page requested. Please read the following message before continuing.">
	<cfset subtitle = attributes.subtitle>
	
	<cfparam name="attributes.message" default="Cannot Process Page.">
	<cfset message = attributes.message>
	
	<cfparam name="attributes.backmessage" default="Press the back button to return to the prior page.">
	<cfset backmessage = attributes.backmessage>
	
	<cfparam name="attributes.width" default="100%">
	<cfset width = attributes.width>
	
	<cfparam name="attributes.bgcolor" default="c0cddc">
	<cfset bgcolor = attributes.bgcolor>
	
	<cfparam name="attributes.TitleFontColor" default="ffffff">
	<cfset TitleFontColor = attributes.TitleFontColor>
	
	<cfparam name="attributes.Space" default="yes">
	<cfset Space = attributes.Space>
	
	<cfparam name="attributes.back" default="yes">
	<cfset back = attributes.back>
	
	<cfparam name="attributes.callingTemplateName" default="">
	<cfset callingTemplateName = attributes.callingTemplateName>
	
	<cfparam name="attributes.location" default="">
	<cfset location = attributes.location>
	
	<cfparam name="attributes.invisible" default="">
	<cfset invisible = attributes.invisible>

		
				
<!------------------------------------------------------------------>
<!--- If the page has a location defined send them where the     --->
<!--- location states.                                           --->
<!------------------------------------------------------------------>			
<cfif location NEQ "">					 	
	
	<cflocation addtoken="No" url="#location#">

</cfif>		
		
		
		
<!------------------------------------------------------------------>
<!--- Show the table with the message that was sent in and       --->
<!--- then abort the process so no other code will continue.     --->
<!------------------------------------------------------------------>

	<cfoutput>
		<cfif Space>
			&nbsp;
		</cfif>
		
		<table cellspacing="0" cellpadding="0" border="1" bordercolor="f1f1f1" align="center" width="#width#">
			<tr>
				<td>	
		
					<table border="0" bgcolor="#bgcolor#" cellpadding="3" cellspacing="0" width="100%">
						<tr>
							<td>
								<font face="arial" size="3" color="#TitleFontColor#">	
									<strong>#title#</strong><br>											
								</font>	
								<font face="arial" size="2" color="#TitleFontColor#">							
									#subtitle#						
								</font>		
							</td>
						</tr>
					</table>
		
					<table border="0" cellpadding="4" cellspacing="0">
						<cfif space>
							<tr>
								<td>					
									&nbsp;		
								</td>
							</tr>
						</cfif>
						<tr>
							<td>					
								<font face="arial" size="2" color="000000">	
									<p>#message#<p><br><cfif back>#backMessage#</cfif>														
								</font>					
							</td>
						</tr>
						<cfif back>
							<tr>
								<td align="center">					
									<font face="arial" size="2" color="000000">											
										<input type="button" value="Back" onclick="history.back()"><p>										
									</font>					
								</td>
							</tr>
						</cfif>
						<cfif callingTemplateName NEQ "">
							<tr>
								<td>					
									<font face="arial" size="2" color="ffffff">											
										Calling Template: #callingTemplateName#								
									</font>					
								</td>
							</tr>
						<cfelse>
							<tr>
								<td>					
									<font face="arial" size="2" color="ffffff">											
										GetBaseTemplatePath(): #GetBaseTemplatePath()#<br>
										GetCurrentTemplatePath(): #GetCurrentTemplatePath()#			
									</font>					
								</td>
							</tr>	
						</cfif>
						<cfif invisible NEQ "">
							<tr>
								<td>					
									<font face="arial" size="2" color="ffffff">											
										#invisible#								
									</font>					
								</td>
							</tr>
						</cfif>
					</table>
				
				</td>
			</tr>
		</table>			
	</cfoutput>

<cfabort>


