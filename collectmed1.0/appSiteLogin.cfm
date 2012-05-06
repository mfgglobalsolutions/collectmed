
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.cancel" default="yes">
	<cfset cancel = attributes.cancel>
	
	<cfparam name="attributes.msg" default="">
	<cfset msg = attributes.msg>
	
	<cfif IsDefined("form.msg") AND form.msg NEQ "">
		<cfset msg = form.msg>
	<cfelseif IsDefined("url.msg") AND url.msg NEQ "">
		<cfset msg = url.msg>	
	</cfif>





<cfscript>
	include template="/collectmed1.0/CustomTags/appSiteApplicationTop.cfm";
</cfscript>





	
<!------------------------------------------------------------------>
<!--- Start the display of the page.                             --->
<!------------------------------------------------------------------>
	
	<cfoutput>
		
		<style type="text/css">
			div.siteLogin{					
				width: 200px;
			};
		</style>
		
		<script type="text/javascript"> 			 		 
			
			function validateLoginForm(){
				if (document.LoginForm.userName.value == ""){
					alert("You must type in a username.");
					document.LoginForm.userName.focus();
					return false;
				}
				
				if (document.LoginForm.password.value == ""){
					alert("You must type in a password.");
					document.LoginForm.password.focus();
					return false;
				}
				
				return true;
			}
		</script>
	</cfoutput>		
	


<!-------------------------------------------------------------------------------------->
<!--- If the inccoming message is set display it.                                    --->
<!-------------------------------------------------------------------------------------->
	<cfif msg NEQ "">
		<cfoutput>
			<p><font face="Verdana" size="3" color="FF0000">#trim(msg)#</font></p>			
		</cfoutput>
	</cfif>
	
		
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!--------------------------------------------------------------------------------------> 
	<cfoutput>
		<br>
		
		<div class="siteLogin">
			
			<cf_gcBorderedTable title="Log&nbsp;in" tablealign="center">	
			
				<table cellspacing="0" cellpadding="0" border="0" align="center">					
					<tr valign="top" align="left">
						<td valign="top" align="left">				
							<form method="post" action="appSiteLoginProcess.cfm" name="LoginForm" onsubmit="return validateLoginForm();">
								<input type="hidden" name="flashVersion" value="">			
								<tr valign="top">
									<td>		
										<div class="SiteTextboxText">Username:</div>							
									</td>
								</tr>
								<tr>	
									<td>		
										<input id="user" type="Text" name="userName" size="25" maxlength="50" value="" class="SiteTextbox">								
									</td>
								</tr>
								<tr>
								    <td>		
										<div class="SiteTextboxText">Password:</div>							
									</td>
								</tr>
								<tr>	
								    <td>		
										<input id="pass" type="Password" name="password" size="25" maxlength="50" value="" class="SiteTextbox">						
									</td>
								</tr>
								<tr><td></td></tr>
								<tr><td>&nbsp;</td></tr>
								<tr>			    
								    <td align="center" nowrap>
										<cf_gcSubmitButton value="Login">
										<cfif cancel>
										&nbsp;&nbsp;
										<input type="button" value="Cancel" class="SiteSubmitbox" onclick="window.close();"><!---location.href='index.cfm--->
										</cfif>
									</td>
								</tr>
								<tr>
									<td valign="bottom" align="center">
										<table cellpadding="3"><tr><td><a href="appRetrieveUp.cfm"><font face="#request.Site.getFont#" size="1">forgot&nbsp;your&nbsp;password?<br><br></font></td></tr></table></a>
									</td>
								</tr>									
							</form>
						</td>
					</tr>
				</table>
			
			</cf_gcBorderedTable>
		
		</div>	
		
	</cfoutput>
	
	
	
<!------------------------------------------------------------------>
<!--- Set the focus on this form to the highest editable field.  --->
<!------------------------------------------------------------------>					
	<cf_gcSetFormFocus
		fieldname="userName"
		formname="LoginForm">	
	
	


	
	
<cfif ListFindNoCase("dev,sta", session.environment)>
	
	<br><br>

	<!-------------------------------------------------------------------------------------->
	<!--- Get the administrator information.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cfquery name="getAllClients" datasource="#trim(application.beanFactory.getBean('configBean').getDsn().master)#">
		SHOW Databases
	</cfquery>
		
	<cfset clientList = "">
	<cfloop query="getAllClients">
		<cfif findNoCase("paclient_", DATABASE)>
			<cfset clientList = ListAppend(clientList, DATABASE)>
		</cfif>
	</cfloop>
	
	<cfadmin action="getDatasources" type="web" password="collectmednet" returnVariable="request.datasources">
	
	<cfset request.datasourcesList = valueList(request.datasources.name)>
	
	<cfloop list="#clientList#" index="thisDS">
	
		<cfif ListFindNoCase(request.datasourcesList, thisDS)>
	
			<cftry>
				
				<cfquery name="tempGet" datasource="#trim(thisDS)#">
					SELECT u.usersid, u.entry, u.entrypoint, u.entryresponse, u.Active, e.clientID, e.entityID, e.fname, e.lname, c.clientName
					FROM pa_master.users u
					LEFT JOIN #trim(thisDS)#.Entity e ON u.entityID = e.EntityID 
					JOIN pa_master.Client c ON e.clientID = c.clientID
					WHERE e.objectTypeID = 2 and u.active = 1
				</cfquery>		
				<cfif tempGet.recordCount GTE 1>
					<cfoutput>				
						<table border="1" cellpadding="4" cellspacing="0">
							<tr><th class="SiteLabel" nowrap bgcolor="DCE3EB">Client Name</th><th class="SiteLabel" nowrap bgcolor="DCE3EB">UsersID</th><th class="SiteLabel" nowrap bgcolor="DCE3EB">Name</th> </tr>
							<cfloop query="tempGet">									
								
								<cfset globalFoot = application.beanFactory.getBean('globalFooter')>
								<cfset Entry1 = globalFoot.GlobalFooterD(trim(entry))>
								<cfset EntryPoint1 = globalFoot.GlobalFooterD(trim(EntryPoint))>
								<cfset EntryResponse1 = globalFoot.GlobalFooterD(trim(EntryResponse))>							
														    	
								<tr>
									<td nowrap class="SiteLabel">#ClientName#</td>
									<td class="SiteLabel" title="#entityID#" nowrap>#UsersID#</td>
									<td onclick="setUser('#trim(Entry1)#','#trim(EntryPoint1)#')" class="SiteLabel" nowrap>#fname# #lname#</td> 									
								</tr>
							</cfloop>					
						</table>				
					</cfoutput>
					<br><br>		
				</cfif>
			
				<cfcatch>
					<cfoutput>					
						<p>Caught an exception, type = #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#</p>			
					</cfoutput>				
				</cfcatch>
			</cftry>
		
		</cfif>
	
	</cfloop>
		

	<script language="JavaScript">
		function setUser(user, pass){
			document.getElementById("user").value = user;
			document.getElementById("pass").value = pass;
		}
	</script>
	
</cfif>		







<cfscript>
	include template="/collectmed1.0/CustomTags/appSiteApplicationBottom.cfm";
</cfscript>




	