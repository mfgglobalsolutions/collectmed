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
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>	
	<cfobject action="create" type="java" class="jrunx.kernel.JRun" name="jr">
	<cfset request.cfservername = jr.getServerName()>
	
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
	
	<cfparam name="request.applicationPath" default="#trim(request.driveLetter)#:\EOBManager">
	
	<cfparam name="request.filesPath" default="#trim(request.driveLetter)#:\EOBManager">
	
	<cfparam name="request.datasource" default="EOBManager">
	
	<cfparam name="request.ro_datasource" default="ro_EOBManager">
		
	
	
<!------------------------------------------------------------------>
<!--- Invoke the site component to get the siteID of the site    --->
<!--- this request is calling.                                   --->
<!------------------------------------------------------------------> 	
	<cfinvoke
		component="SiteIO"
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
		<cfsilent><cfset request.Site = CreateObject("component","com.common.db.SiteIO")></cfsilent>
		<cfset request.Site.Init(request.Site.getSiteIDByURL('#trim(request.ServerName)#'))>		
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
	
	<!---<cfset correctVersion = false>
	
	<cfif FindNoCase("6.", request.BrowserVersion)>
		<cfset correctVersion = true>
	<cfelseif FindNoCase("7.", request.BrowserVersion)>
		<cfset correctVersion = true>
	<cfelseif FindNoCase("8.", request.BrowserVersion)>
		<cfset correctVersion = true>		
	</cfif>
	
	<cfif request.BrowserType NEQ "IE" OR NOT correctVersion><!---REMOTE_ADDR NEQ "127.0.0.1" AND REMOTE_ADDR NEQ "192.168.1.1" AND (--->
		<cf_gcGeneralErrorTemplate message="<strong>You must use Microsoft Internet Explorer Version 6.0+ to view this site.</strong><br><br>Please go to the <a href=""http://www.microsoft.com/windows/ie/default.mspx"">Microsoft Internet Explorer</a> website to download or upgrade to the correct version." back="no">		
	</cfif>--->
		


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
<!--- Include the CSS for the site. All the Styles must remain   --->
<!--- in this page.                                              --->
<!------------------------------------------------------------------>
<!---	<cf_appSiteCSS>	--->	
		
		

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
	
	
	
	
				

