
<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="userValidated" default="no">
		
	<cfparam name="attributes.PageRequested" default="index.cfm">
	<cfset PageRequested = attributes.PageRequested>
	
	<cfif IsDefined("url.pageRequested") AND url.pageRequested NEQ "">
		<cfset pageRequested = url.pageRequested>
	<cfelseif IsDefined("form.pageRequested") AND form.pageRequested NEQ "">
		<cfset pageRequested = url.pageRequested>
	</cfif>
	

			
<!------------------------------------------------------------------>
<!--- Verify the needed fields exist.                            --->
<!------------------------------------------------------------------>			
	<cf_gcVerifyFields
		fields="form.username,form.password"
		fieldnames="Username,Password">
		
		
		
<!------------------------------------------------------------------>
<!--- Check the Flash Player the user has on there computer.     --->
<!------------------------------------------------------------------>	
	<cfif IsDefined("form.flashVersion")>
		<cfset session.flashVersion = form.flashVersion>	
	</cfif>		

			
			
<!------------------------------------------------------------------>
<!--- If the code below returns back a valid record it will      --->
<!--- setup the users page access and group access prior to      --->
<!--- coming back here. Know that validating the user calls      --->
<!--- extra code to accomplish this.                             --->
<!------------------------------------------------------------------>
	<cfset userValidated = application.beanFactory.getBean("old_gcAuthenticateUser").AuthenticateUser(ds: trim(request.datasource), entry: trim(form.username), entrypoint: trim(form.password)) />
	

		
<!------------------------------------------------------------------>
<!--- All is okay continue the users variables have been set.    --->
<!------------------------------------------------------------------>
	<cfif userValidated.RecordCount EQ 1>
		
		<!-------------------------------------------------------------------------------------->
		<!--- Create the objects to be used.                                                 --->
		<!-------------------------------------------------------------------------------------->
		<cfset session.User = application.beanFactory.getBean("User")>
			
		<!-------------------------------------------------------------------------------------->
		<!--- Check that the user logging in right now has the authority to at the           --->
		<!--- current time.                                                                  --->
		<!-------------------------------------------------------------------------------------->
		<cfset UserSuspend = session.User.UserSuspend(usersID: trim(userValidated.usersID))>
		<cfif UserSuspend EQ 1>
			<cfset message ="Your account has been suspended. <br>Please contact an adminsitrator for more information.">
			<cflocation addtoken="No" url="appSiteLogin.cfm?msg=#URLEncodedFormat(message)#">		
		</cfif>	
				
		<!-------------------------------------------------------------------------------------->
		<!--- Check that the user logging in right now has the authority to at the           --->
		<!--- current time.                                                                  --->
		<!-------------------------------------------------------------------------------------->
		<cfset UserValidLoginTime = session.User.UserValidLoginTime(clientID: trim(userValidated.ClientID), usersID: trim(userValidated.usersID))>
		<!---<cfinvoke component="com.common.User" method="UserValidLoginTime" clientID="#trim(userValidated.ClientID)#" usersID="#trim(userValidated.usersID)#" returnvariable="UserValidLoginTime"> --->
		<cfif ListFirst(UserValidLoginTime, "|") EQ 0>
			<cfset message ="The username and/or password you provided cannot login at the current time. <br>You must contact your adminsitrator to change your settings to be able to login at the current time.">
			<cflocation addtoken="No" url="appSiteLogin.cfm?msg=#URLEncodedFormat(message)#">		
		</cfif>


		<!-------------------------------------------------------------------------------------->
		<!--- Changing the configBean ??                                                     --->
		<!-------------------------------------------------------------------------------------->
		<cfset application.beanFactory.getBean("configBean").getDSN().client = "paclient_#trim(userValidated.ClientID)#" />


		<cfset datasourceSingleton = application.beanFactory.getBean('old_Datasource')>
		<cfset datasourceSingleton.setDSName("PAClient_#userValidated.ClientID#")>
				
		<cfset request.datasource = "PAClient_#userValidated.ClientID#">
		<cfset request.ro_datasource = "ro_PACLient_#userValidated.ClientID#">
				
			
		<cfset session.User.InitUserIO(userValidated.usersID)>	
		<cfset session.User.setUsersSessionIdentification('#session.User.CreateUserSessionID(userValidated.usersID)#')>		
		<cfset session.User.SetUsersPagesAccess(usersID: trim(session.User.getUsersID()), clientID: userValidated.ClientID)>
		<cfset session.User.setIPAddress('#trim(CGI.REMOTE_ADDR)#')>
		<cfset session.User.setEndLoginTime(ListLast(UserValidLoginTime, "|"))>
				
		
		<!-------------------------------------------------------------------------------------->
		<!--- Create the user object that will be populated or read into memory. Depending   --->
		<!--- on the action taken                                                            --->
		<!-------------------------------------------------------------------------------------->
		<cfset session.Entity = application.beanFactory.getBean('EntityIO') />
		<cfset session.Entity.initEntityIO(session.user.getEntityID()) />
		<cfset session.ClientID = session.Entity.getClientID() />

		
		<!-------------------------------------------------------------------------------------->
		<!--- Now that we have the users client ID we can set that client in a session key.  --->
		<!-------------------------------------------------------------------------------------->			
		<cfset session.client = application.beanFactory.getBean('Client').initClientIO(session.ClientID)>
		
				
		<!-------------------------------------------------------------------------------------->
		<!--- Everytime a user enters there will be a session ID set for this visit. This    --->
		<!--- has to be entered for tracking purposes.                                       --->
		<!-------------------------------------------------------------------------------------->			
		<cfset temp = application.beanFactory.getBean('UserSessionInsert').Process(
																					usersID: trim(session.User.getUsersID()), 
																					UsersSessionIdentification: trim(session.User.getUsersSessionIdentification()), 
																				  	IPAddress: trim(CGI.REMOTE_ADDR))>
		
		<!-------------------------------------------------------------------------------------->
		<!--- This might be able to be handled by simply updating the users prior sessions   --->
		<!--- to inactive in a query instead of a stored proc with logic in it. I say this   --->
		<!--- after spending time creating a function that may contain more than needed.     --->
		<!--- If you find that the users prior sessions can be invalidated during login      --->
		<!--- process then just do a query here. I had this functionality in the userIO.cfc  --->
		<!--- then in the User.cfc but this is the page that always gets run via a login so  --->
		<!--- the query to update prior sessions should go here.                             --->
		<!--------------------------------------------------------------------------------------> 		
		<cfset session.User.invalidateUsersPriorSessions(userValidated.usersID)>	
				
		<cfset userValidated = true>
	
	
	<!------------------------------------------------------------------>
	<!--- If the record is not found then dont tell them why just    --->
	<!--- have them login again. Because of hackers                  --->
	<!------------------------------------------------------------------>	
	<cfelseif userValidated.RecordCount LT 1>
		
		<cfset message ="The username and/or password you provided cannot be found. <br>Click <a href=""appRetrieveUp.cfm"">here</a> to retrieve your username/password.">
		<cflocation addtoken="No" url="appsiteLogin.cfm?msg=#URLEncodedFormat(message)#">
			
	<!------------------------------------------------------------------>
	<!--- If the database shows more than one record then            --->
	<!--- something went wrong.                                      --->
	<!------------------------------------------------------------------>
	<cfelseif userValidated.RecordCount GT 1>
				
		<cfset message ="There was an issue with the username and/or password you provided. Notify an administrator of this message. Please email #request.Site.getAdministratorEmail()# for help on this issue.">
		<cflocation addtoken="No" url="appSiteLogin.cfm?msg=#URLEncodedFormat(message)#">	
				
	</cfif>

	
<!------------------------------------------------------------------>
<!--- If the user is an admin by having a groupID of 1 then      --->
<!--- push the user to the admin reporting page.                 --->
<!------------------------------------------------------------------>
<cfif trim(userValidated) AND ListContains(session.User.getRoleIDs(), "8")>		
	
	<cflocation 
		url="appMyDesktop.cfm?hlink=1">
	
<!------------------------------------------------------------------>
<!--- If the user is validated and not an admin then they are    --->
<!--- a regular client so push them to the my account page or    --->
<!--- the page requested remember that through the location tag  --->
<!--- the page requested will be verifified for entrance.        --->
<!------------------------------------------------------------------>	
<cfelseif userValidated>
	
	<cflocation 
		url="appMyDesktop.cfm?hlink=1" 
		addtoken="no">
	<!---<cflocation 
		url="#PageRequested#" 
		addtoken="no">--->
		    
</cfif>

