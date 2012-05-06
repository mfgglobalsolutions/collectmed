<!------------------------------------------------------------------>
<!--- NAME: application.cfm                                      --->
<!------------------------------------------------------------------>
<!--- PURPOSE:                                                   --->      
<!---                                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!---                                                            --->
<!---                                                            --->      
<!------------------------------------------------------------------>



<!------------------------------------------------------------------>
<!--- Set the Error they will see.                               --->
<!------------------------------------------------------------------>
	<cferror type="REQUEST" template="error.cfm" mailto="support@collectmed.net">
	

<!------------------------------------------------------------------>
<!--- If a web service call we need not to include some output.  --->
<!--- But we still want to use security logic.                   --->
<!------------------------------------------------------------------>
	<cfset variables.webServiceCall = false>
	<cfif FindNoCase("\ws\", trim(CGI.CF_TEMPLATE_PATH)) OR FindNoCase("/ws/", trim(CGI.CF_TEMPLATE_PATH))>
		<cfset variables.webServiceCall = true>
	</cfif>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Common ColdFusion functions.                                                   --->
<!-------------------------------------------------------------------------------------->	
	<cf_gcCFScriptIncludes>
		
	
<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>	
	<cftry>
		
		<cfobject action="create" type="java" class="jrunx.kernel.JRun" name="jr">
		<cfset request.cfservername = jr.getServerName()>
		
		<cfcatch>
			<cfset request.cfservername = ReplaceNoCase(getContextRoot(), "/", "", "ALL")>
		</cfcatch>

	</cftry>	
	
	<cfparam name="request.ServerName" default="#trim(CGI.SERVER_NAME)#">
	<cfset ServerName = request.ServerName>
	
	<cfparam name="request.PageName" default="#trim(CGI.SCRIPT_NAME)#">
		
	<cfparam name="PageName" default="#trim(CGI.SCRIPT_NAME)#">
	
	<cfparam name="request.validPageCall" default="0"> 
	
	<cfif CGI.SERVER_PORT EQ 443> 
		<cfset request.urlProtocol = "https://">
	<cfelse>
		<cfset request.urlProtocol = "http://">
	</cfif>
	
	<cfparam name="request.urlHost" default="#ListGetAt(trim(ServerName), 1, ".")#">
	
	<cfparam name="request.urlDomain" default="#ListGetAt(trim(ServerName), 2, ".")#">
	
	<cfparam name="request.urlHighLevelDomain" default="#ListGetAt(trim(ServerName), 3, ".")#">
		
	<cfset request.urlReconstructed = "#trim(request.urlProtocol)##trim(request.urlHost)#.#trim(request.urlDomain)#.#trim(request.urlHighLevelDomain)#">	
		
	<cfparam name="request.driveLetter" default="C">
	
	<cfparam name="request.driveLetterFMS" default="C">
	
	<cfparam name="request.tempDocsFolder" default="temp">
	
	<cfparam name="request.fmsVirtualDirectory" default="pafms">
	
	<cfparam name="request.applicationPathMainFolder" default="CollectMed">
	
	<cfparam name="request.fmsPathMainFolder" default="CollectMed">
	
	<cfparam name="request.applicationPath" default="#trim(request.driveLetter)#:\#trim(request.applicationPathMainFolder)#">
	
	<cfparam name="request.filesPath" default="#trim(request.driveLetterFMS)#:\#trim(request.fmsPathMainFolder)#">

	<cfparam name="request.fmsPathTop" default="#trim(request.driveLetterFMS)#:\#trim(request.fmsPathMainFolder)#\#trim(request.fmsVirtualDirectory)#">	
	
	<cfparam name="request.fmsPath" default="#trim(request.driveLetterFMS)#:\#trim(request.fmsPathMainFolder)#\#trim(request.fmsVirtualDirectory)#">
	
	<cfparam name="request.tempDocsURL" default="#trim(request.urlProtocol)##trim(request.urlHost)#.#trim(request.urlDomain)#.#trim(request.urlHighLevelDomain)#/#trim(request.fmsVirtualDirectory)#">
	
	<cfparam name="request.ediURL" default="https://www.mfgedi.com">
	
	<cfset coldspringConfig = "#trim(request.applicationPath)#\frameworks\coldspring\coldspring.xml" />  
	
	<cfset request.masterDatasource = "PA_Master">	
	
	<!--- <cfset request.mySQLPath = "C:\Program Files\MySQL\MySQL Server 5.1\bin">
	<cfset request.mySQLIpAddress = "127.0.0.1">
	<cfset request.mySQLPort = "3306">
	<cfset request.mySQLUser = "root">
	<cfset request.mySQLPass = "eobmanagernet">
	<cfset request.dbBackupPath = "C:\CollectMed\DBbackup\"> --->
		
		
	<cfset beanFactory = createObject("component","coldspring.beans.DefaultXmlBeanFactory") /> 					
			<cfdump var="#beanFactory#">			
	
<!--- >MUST HAVE MAPPING 
/coldspring   C:\CollectMed\frameworks\coldspring 
--->



<!------------------------------------------------------------------>
<!--- Invoke the site component to get the siteID of the site    --->
<!--- this request is calling.                                   --->
<!------------------------------------------------------------------> 	
	<cfinvoke
		component="com.common.db.SiteIO"
		fields="siteid"
		method="getSiteQuery"
		URLDomains_LIKE="#trim(request.ServerName)#"
		returnvariable="getSiteID">

	<cfif NOT IsDefined("getSiteID.siteID") OR NOT Isnumeric(getSiteID.siteID)>
		<cf_gcGeneralErrorTemplate				
			message="Could not initialize the object, the record was not found.">	
	</cfif>
	
	<cfset request.SiteID = trim(getSiteID.siteID)>
	
	
	
<!------------------------------------------------------------------>
<!--- If the request.Siteid is not present then go ahead and     --->
<!--- setup the request structure for this site.                 --->
<!------------------------------------------------------------------>
	<cfif NOT IsDefined("request.Site")>
		<cfset request.Site = CreateObject("component","com.common.db.SiteIO")>	
		<cfset request.Site.Init(request.Site.getSiteIDByURL(trim(request.ServerName)))>		
	</cfif>
	
	
			
<!------------------------------------------------------------------>
<!--- Set the application scope here so that the session can     --->
<!--- be initialized.                                            --->
<!------------------------------------------------------------------>
	<cfapplication 
		name="#trim(request.Site.getApplicationName())#" 
		sessionmanagement="Yes" 		
		sessiontimeout="#CreateTimeSpan(0, 0, trim(request.Site.getSessiontimeout()), 0)#">
		
		

<!-------------------------------------------------------------------------------------->
<!--- Initialize ColdSpring.                                                         --->
<!-------------------------------------------------------------------------------------->		
	<cfif structKeyExists(url,"reinit") and url.reinit eq "complete" and structKeyExists(application,"ApplicationName")>			
		<cflock name="#application.applicationname#_reinit" type="exclusive" timeout="30">
			<cfloop collection="#application#" item="i">
				<cfif i neq "ApplicationName">
					<cfset StructDelete(application,i) />
				</cfif>
			</cfloop>
			<!---<cfset OnApplicationStart() />--->
			<cflocation url="#cgi.script_name#" addtoken="false" />
		</cflock>	
	</cfif>
	
	<cfif structKeyExists(application,"ApplicationName")>
		<cfif not structKeyExists(application,"beanFactory")>
			<cfset local.environmentProperties = createObject("component","com.utility.PropertiesLoader").loadEnvironmentalVariables() />							
			<cflock name="#application.applicationname#beanFactory" type="exclusive" timeout="30">
				<cfif not structKeyExists(application,"beanFactory")> 					
					<cfset application.beanFactory = createObject("component","coldspring.beans.DefaultXmlBeanFactory").init(structNew(), local.environmentProperties)/> 					
					<cfset application.beanFactory.loadBeans(coldspringConfig)/>
				</cfif>
			</cflock>
		</cfif>
	</cfif> 		
		

<!--- TODO Only for Development --->
<!--- <cfset local.environmentProperties = createObject("component","com.utility.PropertiesLoader").loadEnvironmentalVariables() />	
<cfdump var="#local.environmentProperties#">						
<cflock name="#application.applicationname#beanFactory" type="exclusive" timeout="30">				
	<cfset application.beanFactory = createObject("component","coldspring.beans.DefaultXmlBeanFactory").init(structNew(), local.environmentProperties) /> 					
	<cfset application.beanFactory.loadBeans(coldspringConfig) />
</cflock>  --->



<!-------------------------------------------------------------------------------------->
<!--- setup the environment                                                          --->
<!-------------------------------------------------------------------------------------->	
	<cfset session.environment = application.beanFactory.getBean('configBean').getDomain().environment>
	
				
<!-------------------------------------------------------------------------------------->
<!--- Session-Tracker Code                                                           --->
<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("session.User") AND IsDefined("session.ClientID") AND IsNumeric(session.ClientID)>
		<cflock name="#APPLICATION.applicationName#" type="Exclusive" timeout="20" throwontimeout="Yes">
			
			<!-------------------------------------------------------------------------------------->
			<!--- If Session-Tracker does not exist, generate it by using cfparam                --->
			<!-------------------------------------------------------------------------------------->
		   	<cfparam name="APPLICATION.SessionTracker_#session.ClientID#" default="#StructNew()#">
			<cfset request.structName = "APPLICATION.SessionTracker_#session.ClientID#">		
		  	<cfset StructInsert(evaluate(request.structName), session.User.getUsersID(), Now(), true)>  
		
		</cflock>
	</cfif>		
		


<!-------------------------------------------------------------------------------------->
<!--- If the clientID is available set the path.                                     --->
<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("session.ClientID") AND IsNumeric(session.ClientID)>	
		<cfset request.fmsPath = request.fmsPath & "\" & trim(session.ClientID)>		
		<cfset request.tempDocsURL = trim(request.tempDocsURL )& "/#trim(session.Client.getClientID())#/" & trim(request.tempDocsFolder)>
	</cfif>		
		


<!-------------------------------------------------------------------------------------->
<!--- If the user is defined we need to make sure they are in the correct database.  --->
<!-------------------------------------------------------------------------------------->		
	<cfif IsDefined("session.User")>			
		<cfset request.datasource = session.user.getDatasource()>
		<cfset request.ro_datasource = "ro_" & session.user.getDatasource()>		
	<cfelse>			
		<cfset request.datasource = "PA_Master">
		<cfset request.ro_datasource = "ro_PAMaster">		
	</cfif>		
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Set the users screen width and height to use in placing bordered tables.       --->
<!-------------------------------------------------------------------------------------->
	<cfif NOT IsDefined("session.screenWidth") OR NOT IsDefined("session.screenHeight")>
	
		<cfobject type="JAVA" action="Create" name="tk" class="java.awt.Toolkit">	 	
		<cfset session.screenWidth = tk.getDefaultToolkit().getScreenSize().width>
		<cfset session.screenHeight = tk.getDefaultToolkit().getScreenSize().height>
		
	</cfif>
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- We need to have the users browser type to be able to display the frequency     --->
<!--- code that will be used.                                                        --->
<!--------------------------------------------------------------------------------------> 
	<cf_gcTagBrowserType>
	
	<cfset correctVersion = false>
	
	<cfif FindNoCase("6.", request.BrowserVersion)>
		<cfset correctVersion = true>
	<cfelseif FindNoCase("7.", request.BrowserVersion)>
		<cfset correctVersion = true>	
	<cfelseif FindNoCase("8.", request.BrowserVersion)>
		<cfset correctVersion = true>
	<cfelseif FindNoCase("Firefox", request.BrowserVersion)>
		<cfset correctVersion = true>						
	</cfif>
	
	<cfif NOT ListFindNoCase("NS,IE", request.BrowserType) OR NOT correctVersion>
		<!--- <cflog file="Testing" text="request.BrowserVersion: [#request.BrowserVersion#]"> --->
		<cf_gcGeneralErrorTemplate message="<strong>You must use Microsoft Internet Explorer Version 6.0+ to view this site.</strong><br><br>Please go to the <a href=""http://www.microsoft.com/windows/ie/default.mspx"">Microsoft Internet Explorer</a> website to download or upgrade to the correct version." back="no">		
	</cfif>
		
		

<!-------------------------------------------------------------------------------------->
<!--- Create all the objects that all users will share but need to be created once.  --->
<!-------------------------------------------------------------------------------------->

	<!-------------------------------------------------------------------------------------->
	<!--- Create a session manager object.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cflock scope="application" timeout="4" type="EXCLUSIVE">
		<cfif NOT IsDefined("application.sessionManager")>
			<cfset application.sessionManager = CreateObject("component", "com.common.gcUserSessionInsert")>
		</cfif>	
	</cflock>		
		
		
		
<!------------------------------------------------------------------>
<!--- Set the Full URL that will be appended to locate on        --->
<!--- this site.                                                 --->
<!------------------------------------------------------------------>				
	<cfif FindNoCase("www.", trim(ServerName))>			
		<cfset request.Site.FullHttpHost = "http://www." & trim(request.urlDomain) & "." & trim(request.urlHighLevelDomain)>
		<cfset request.Site.loginURL = "http://www." & trim(request.urlDomain) & "." & trim(request.urlHighLevelDomain)>		
	<cfelseif FindNoCase("secure.", trim(ServerName))>		
		<cfset request.Site.FullHttpHost = "http://secure." & trim(request.urlDomain) & "." & trim(request.urlHighLevelDomain)>
		<cfset request.Site.loginURL = "http://secure." & trim(request.urlDomain) & "." & trim(request.urlHighLevelDomain)>		
	</cfif>
		
		
									
<!------------------------------------------------------------------>
<!--- Here we are trying to set the page name that is the        --->
<!--- last thing in the URL after the last forward slash.        --->
<!------------------------------------------------------------------>		
	<cfif FindNoCase("/", PageName)>		
		<cfset request.pageName = ListLast(PageName, "/")>			
	<cfelse>
		<cfset request.pageName = PageName>		
	</cfif>
	
	

<!------------------------------------------------------------------>
<!--- If this variable is present it means that the page this    --->
<!--- user wants is one that we have put a direct link to. So    --->
<!--- we set the session variable allowing them to go to any     --->
<!--- page they want on the site.                                --->
<!------------------------------------------------------------------>			
	<cfif IsDefined("url.ValidatedSiteEntrance") AND url.ValidatedSiteEntrance EQ "Yes">
		<cfset session.ValidatedSiteEntrance = true>
	</cfif> 		
		
		
	
<!------------------------------------------------------------------>
<!--- When someone comes into the site and they have not gone    --->
<!--- through the index.cfm page then you have to redirect       --->
<!--- them this way because it could be that the user came in    --->
<!--- form a spider link that calls a page that might need a     --->
<!--- variable and you dont want them to get an error. the       --->
<!--- last variable is one that will be passed to allow          --->
<!--- individuals to bypass this code in case we set up an       --->
<!--- entrance to the site that allows them to go to a           --->
<!--- speciifc page.                                             --->
<!------------------------------------------------------------------>		
	<cfset validatedPages = "appSiteLogin.cfm,appSiteReload.cfm,appGeneralErrorTemplate.cfm">
	<cfif request.PageName EQ "index.cfm" OR ListFind(validatedPages, trim(request.PageName))>
		<cfset session.ValidatedSiteEntrance = "true">
	</cfif>
	
	<cfif NOT IsDefined("session.ValidatedSiteEntrance")>
		<cflocation addtoken="No" url="index.cfm">
	</cfif>			
	
	
		
<!------------------------------------------------------------------>
<!--- Get the information of the page that the user has chosen   --->
<!--- to view.                                                   --->
<!------------------------------------------------------------------>	
	<cfset request.Page = CreateObject("component","com.common.db.PageIO")>	
	<cfset thisPageID = request.Page.getPageIDByName(trim(request.pageName))>
	
	<cfif NOT isNumeric(thisPageID)>		
		<cf_gcGeneralErrorTemplate message="No page exists">		
	</cfif>
	
	<cfset request.Page.Init(thisPageID)>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Check to see if the the page requested is a secure page and that the user is   --->
<!--- logged in.                                                                     --->
<!-------------------------------------------------------------------------------------->
	<cfif request.Page.getSecurity() EQ 1 AND NOT IsDefined("session.User")>		
	
		<cfset message = "You must login before viewing a secure page.">
		<cflocation url="appSiteLogin.cfm?URLPage=#trim(request.PageName)#&message=#URLEncodedFormat(trim(message))#" addtoken="No">			
		
	</cfif>	
	
	
				
<!-------------------------------------------------------------------------------------->
<!--- If the page is a secure page and the user is defined we need to check their    --->
<!--- pages the Ipaddress and insert their session visit.                            --->
<!-------------------------------------------------------------------------------------->	
	<cfif request.Page.getSecurity() EQ 1 AND IsDefined("session.User") AND request.Page.getPageName() NEQ "appSiteLogin.cfm">
		
				
		<!-------------------------------------------------------------------------------------->
		<!--- If the user has reached their final time of the day that they can be           --->
		<!--- logged in log them out.                                                        --->
		<!-------------------------------------------------------------------------------------->	
		<cfif session.User.EndLoginTime LT NOW()>			
			<cf_gcLogUserOutClearScopes>
			<cfset message ="Your account cannot stay logged in past the current time. <br>You must contact your administrator to change your settings to be able to login at the current time.">
			<cflocation addtoken="No" url="appSiteLogin.cfm?msg=#URLEncodedFormat(message)#">			
		</cfif>
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- If the user is logged in and the current IP address is not the one in the      --->
		<!--- users session record then let them know that they are logged in elsewhere.     --->
		<!-------------------------------------------------------------------------------------->
		<cfinvoke
			component="UsersSessionIO"
			fields="IPAddress,UsersSessionIdentification"
			method="getUsersSessionQuery"
			UsersSessionIdentification="#session.user.getUsersSessionIdentification()#"
			active="1"
			returnvariable="SessionIPaddress">		
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- Only log them out if they have logged in before this will keep new accounts    --->
		<!--- from processing tis code.                                                      --->
		<!-------------------------------------------------------------------------------------->		
		<cfif trim(session.User.getChangedPassword()) NEQ 0>
			
			<cfif SessionIPaddress.Recordcount GT 1>
				
				<cfset adminNotification = "Users account has more than one active UserSession. IMMEDIATE attention required.">
				
				<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#request.Site.getSupportEmailAddressID()#">
				
				<cf_gcGatewayLogger
					datasource="#trim(request.datasource)#" 
					code="115"
					logtext = "#trim(adminNotification)#">	
									
				<cf_gcSendEmail
					from="#trim(EAQuery.Email)#"
					to="#trim(EAQuery.Email)#"
					subject="IMMEDIATE attention required."
					message="#trim(adminNotification)#">
				
				<cfset message = "There was an issue with your account. An administrator has been notified.">					
				<cflocation url="appGeneralErrorTemplate.cfm?message=""#UrlEncodedFormat(trim(message))#""" addtoken="No">
				
			
			<cfelseif SessionIPaddress.Recordcount LTE 0 AND (trim(session.user.getUsersSessionIdentification()) NEQ trim(SessionIPaddress.UsersSessionIdentification))>			
				
				<cfset message = "Your account appears to be logged in on another Session Identification.">					
				<cflocation url="appSiteLogout.cfm?msg=""#UrlEncodedFormat(trim(message))#""" addtoken="No">
				
			<cfelseif SessionIPaddress.Recordcount LTE 0 AND (trim(SessionIPaddress.ipaddress) NEQ trim(CGI.Remote_Addr))>			
				
				<cfset message = "Your account appears to be logged in on another IP Address.">					
				<cflocation url="appSiteLogout.cfm?msg=""#UrlEncodedFormat(trim(message))#""" addtoken="No">
				
			<cfelseif SessionIPaddress.Recordcount LTE 0>
			 				
				<cfset tempvariable = StructClear(session)>
				<cfset message = "Your session does not appear to be valid please login again.">					
				<cflocation url="appSiteLogout.cfm?msg=""#UrlEncodedFormat(trim(message))#""" addtoken="No">
			
			</cfif>
		
		</cfif>
		
				
		<!-------------------------------------------------------------------------------------->
		<!--- Set the users pages they are able to view.                                     --->
		<!-------------------------------------------------------------------------------------->		
		<cfset tempQuery = session.user.getUserPages()>
		<cfset request.currentUserPages = valuelist(tempQuery.pageid)>
	
		<!-------------------------------------------------------------------------------------->
		<!--- Find out if the pagename that the user is looking for is in their list of      --->
		<!--- pages that they are able to view.                                              --->
		<!-------------------------------------------------------------------------------------->
		<cfif ListFindNoCase(request.currentUserPages, request.Page.getPageID()) LTE 0>
			
			<cfset message = "Your account is not enabled to view this page please contact a site administrator. #trim(request.Page.getPageID())#">					
			<cflocation url="appGeneralErrorTemplate.cfm?message=""#UrlEncodedFormat(trim(message))#""" addtoken="No">
		
		</cfif>		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Everytime a user enters there will be a session ID set for this visit. This    --->
		<!--- has to be entered for tracking purposes.                                       --->
		<!-------------------------------------------------------------------------------------->			
		<cfset temp = application.sessionManager.Process(usersID: trim(session.User.getUsersID()), UsersSessionIdentification: trim(session.User.getUsersSessionIdentification()), siteid: trim(request.Site.getSiteID()), IPAddress: trim(CGI.REMOTE_ADDR))>
				
						
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- If the user has not yet changed their password for the first time they must.   --->
<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("session.User") AND trim(session.User.getChangedPassword()) EQ 0 AND request.Page.getPageName() NEQ "appChangePassword.cfm" AND request.Page.getPageName() NEQ "appChangePasswordProcess.cfm" AND request.Page.getPageName() NEQ "appSiteLogout.cfm">
		
		<cflocation 
			url="appChangePassword.cfm" 
			addtoken="no">
	
	</cfif>			
	
	
	






	
				
<!-------------------------------------------------------------------------------------->
<!--- MUST CHANGE THIS TO GO SOMEWHERE ELSE!!!!!!!!!!!!!!!!!!!                       --->
<!-------------------------------------------------------------------------------------->
<cfset request.TXMedicaidRetrievalTime_Interval = 60>
<cfset request.TXMedicaidRetrieval = false />	
<cfif (NOT IsDefined("application.TXMedicaidRetrievalTime")) OR (DateCompare(application.TXMedicaidRetrievalTime, NOW(), 'd') LT 0)>
	<cflock name="#APPLICATION.applicationName#_TXMedicaidRetrievalTime" type="Exclusive" timeout="5" throwontimeout="Yes">
	  	<cfset application.TXMedicaidRetrievalTime = CreateDateTime(year(Now()), month(Now()), day(Now()), hour(Now()), minute(Now()), 00) />  	
	</cflock>	
</cfif>
	
<cfset request.currentTimeToCompare = CreateDateTime(year(Now()), month(Now()), day(Now()), hour(Now()), minute(Now()), 00) />  		
<cfif DateDiff("n", application.TXMedicaidRetrievalTime, request.currentTimeToCompare) GTE request.TXMedicaidRetrievalTime_Interval>
	<cflock name="#APPLICATION.applicationName#_TXMedicaidRetrievalTime" type="Exclusive" timeout="5" throwontimeout="Yes">
		<cfset application.TXMedicaidRetrievalTime = DateAdd('n', request.TXMedicaidRetrievalTime_Interval, application.TXMedicaidRetrievalTime) />  	
  		<cfset request.TXMedicaidRetrieval = true />
	</cflock>	
</cfif>		

<!--- <cfif NOT FindNoCase('imchat', request.pageName)>
<cfset request.TXMedicaidRetrieval = true />
</cfif> --->
	
<cfif request.TXMedicaidRetrieval and session.environment neq "Development">
	
	<cfscript>	   
	   data = structNew();	    
	   data.datasource = trim(request.datasource);
	   data.ediWSPath = "#trim(request.ediURL)#/TX/Medicaid/External_Edi.cfc?wsdl";  
	   data.Medicaid_271_X12ToXmlWSPath = "#trim(request.ediURL)#/TX/Medicaid/Edi_Tx_Medicaid_271_X12ToXml.cfc?wsdl"; 
	   data.stripWhiteSpaceXSLTPATH = "#trim(request.applicationPath)#\collectmed1.0\includes\xml\xslt\StripWhiteSpace.xslt";   
	</cfscript>	
	
	<!--- 
	<cfset status = SendGatewayMessage("ICFileRetrievalMedicaid_Texas", data)>
	<cfdump var="#status#">
	<cfdump var="#data#"> 
	--->
	
	<cfscript>
	   structParameters = structNew();	    
	   structParameters.data = data;
	</cfscript>	 	
	<cfset variables.objInsuranceCompanyFileRetrieval = CreateObject("component", "CustomTags.com.common.gateway.InsuranceCompanyFileRetrievalMedicaid_Texas")>
	<cfset variables.objInsuranceCompanyFileRetrieval.OnIncomingMessage(structParameters)>		
	
	<cflog file="testing" text="COMPLETE: #Now()# - page: #request.pagename#">	
	
</cfif>

	







	
	
<!------------------------------------------------------------------>
<!--- Call this page to log the page visited by this user. Pass  --->
<!--- in the pageid and the tag will log the visit in the        --->
<!--- PageHit table.                                             --->
<!------------------------------------------------------------------>	
<!---	<cfset request.PageHit = CreateObject("component","com.common.db.PageHitIO")>	
	<cfset request.PageHit.setPageID(request.Page.getPageID())>
	<cfset request.PageHit.setSiteID(request.Site.getSiteID())>			
	<cfset request.PageHit.setIPAddress(trim(CGI.REMOTE_ADDR))>		
	<cfset request.PageHit.setBrowserType(trim(request.BrowserType))>
	<cfset request.PageHit.setBrowserVersion(trim(request.BrowserVersion))>
	<cfset request.PageHit.setOperatingSystem(trim(request.OperatingSystem))>			
	<cfif IsDefined("session.User") AND session.User.getUsersID() NEQ "">
		<cfset request.PageHit.setUsersID(trim(session.User.getUsersID()))>
	</cfif>	
	
	<cfset request.PageHit.Commit()>	--->		
		
	
			
<!------------------------------------------------------------------>
<!--- Make sure that this code gets processed to let the         --->
<!--- users session go once the user has closed                  --->
<!--- their browser.                                             --->
<!------------------------------------------------------------------>
	<cflock scope="SESSION" timeout="60" type="EXCLUSIVE">
		<cfif IsDefined("Cookie.CFID") AND IsDefined("Cookie.CFTOKEN")> 
			<cfset cfid_local = Cookie.CFID> 
			<cfset cftoken_local = Cookie.CFTOKEN>
			<cfcookie name="CFID" value="#cfid_local#">
			<cfcookie name="CFTOKEN" value="#cftoken_local#">
		</cfif>
	</cflock> 	
	


<!------------------------------------------------------------------>
<!--- Start the initialization process of the whole site by      --->
<!--- running the variables in the following page. This is       --->
<!--- where all the site specific action takes place.            --->
<!------------------------------------------------------------------>		
	<cfif NOT variables.webServiceCall>
		<cfif trim(request.pagename) EQ "appVerifications1.cfm">
			<cf_appSiteApplicationNew>
		<cfelse>	
		<cf_appSiteApplication>
	</cfif>
	</cfif>
	
	
