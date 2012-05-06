
<cfcomponent output="false">
	
	<cfscript>
		this.name = "PolyAlliance";
		this.applicationTimeout = createTimeSpan(0,2,0,0);
		this.clientManagement = true;
		this.clientStorage = "cookie";
		this.loginStorage = "session";
		this.sessionManagement = true;
		this.sessionTimeout = createTimeSpan(0,0,0,10);
		this.setClientCookies = true;
		this.setDomainCookies = false;
		this.scriptProtect = false;
	</cfscript>

	<cffunction name="onApplicationStart" output="false">
	
		<cfscript>
			// create default SiteStatistics structure and pre-request values
			application.SiteStatistics = structNew();
			application.SiteStatistics.started = now();
			application.SiteStatistics.thisHit = now();
			application.SiteStatistics.hits = 0;
			application.SiteStatistics.sessions = 0;
		</cfscript>

	</cffunction>


	<cffunction name="onSessionStart" output="false">
		
		<cfscript>			
			session.SiteStatistics.started = now();
			session.SiteStatistics.thisHit = now();
			session.SiteStatistics.hits = 0;			
			application.SiteStatistics.sessions = application.SiteStatistics.sessions + 1;
			// create an instance of the [NEEDED] objects class
			//session.user = createObject("component", "user").init();		
		</cfscript>
		
		<cfobject action="create" type="java" class="jrunx.kernel.JRun" name="session.jr">
		
	</cffunction>

	<cffunction name="onRequestStart" output="false">
		
		<cfargument name="thePage" type="string" required="true">
		
		<cfscript>			
			application.SiteStatistics.lastHit = application.SiteStatistics.thisHit;
			application.SiteStatistics.thisHit = now();
			application.SiteStatistics.hits = application.SiteStatistics.hits + 1;
			session.SiteStatistics.lastHit = session.SiteStatistics.thisHit;
			session.SiteStatistics.thisHit = now();
			session.SiteStatistics.hits = session.SiteStatistics.hits + 1;			
		</cfscript>
		
		<cf_gcCFScriptIncludes>
		<cf_gcJScriptIncludes>	
		
		<cfif trim(CGI.SERVER_PORT) EQ 443> 
			<cfset request.urlProtocol = "https://">
		<cfelse>
			<cfset request.urlProtocol = "http://">
		</cfif>		
		<cfset request.cfservername = session.jr.getServerName()>		
		<cfset request.ServerName = trim(CGI.SERVER_NAME)>		
		<cfset request.PageName = trim(CGI.SCRIPT_NAME)>			
		<cfset PageName = trim(CGI.SCRIPT_NAME)>		
		<cfset request.validPageCall = 0>			
		<cfset request.urlHost = ListGetAt(trim(request.ServerName), 1, ".")>		
		<cfset request.urlDomain = ListGetAt(trim(request.ServerName), 2, ".")>		
		<cfset request.urlHighLevelDomain = ListGetAt(trim(request.ServerName), 3, ".")>			
		<cfset request.urlReconstructed = "#trim(request.urlProtocol)##trim(request.urlHost)#.#trim(request.urlDomain)#.#trim(request.urlHighLevelDomain)#">				
		<cfset request.driveLetter = "C">		
		<cfset request.driveLetterFMS ="C">
		<cfset request.tempDocsFolder = "temp">		
		<cfset fmsVirtualDirectory = "pafms">		
		<cfset request.applicationPathMainFolder = "EOBManager">		
		<cfset request.fmsPathMainFolder = "EOBManager">		
		<cfset request.applicationPath = "#trim(request.driveLetter)#:\#trim(request.applicationPathMainFolder)#">		
		<cfset request.filesPath = "#trim(request.driveLetterFMS)#:\#trim(request.fmsPathMainFolder)#">		
		<cfset request.fmsPath = "#trim(request.driveLetterFMS)#:\#trim(request.fmsPathMainFolder)#\#trim(fmsVirtualDirectory)#">		
		<cfset request.tempDocsURL = "#trim(request.urlProtocol)##trim(request.urlHost)#.#trim(request.urlDomain)#.#trim(request.urlHighLevelDomain)#/#trim(fmsVirtualDirectory)#">
				
	</cffunction>

	
	<cffunction name="onRequestEnd" returnType="void" output="false">
		<cfargument name="thePage" type="string" required="true">
	</cffunction>

	<cffunction name="onApplicationEnd" returnType="void" output="false">
		<cfargument name="applicationScope" required="true">
	</cffunction>

	<cffunction name="onSessionEnd" returnType="void" output="false">
		
		<cfargument name="SessionScope" type="struct" required="true">
		<cfargument name="ApplicationScope" type="struct" required="false">
		
		<cfscript>
			// NOTE: You must use the variable scope below to acces the appliation structure inside this method.
			arguments.ApplicationScope.SiteStatistics.sessions = arguments.ApplicationScope.SiteStatistics.sessions - 1;
		</cfscript>
		
		<cflock scope="SESSION" timeout="60" type="EXCLUSIVE">
			<cfif IsDefined("Cookie.CFID") AND IsDefined("Cookie.CFTOKEN")> 
				<cfset cfid_local = Cookie.CFID> 
				<cfset cftoken_local = Cookie.CFTOKEN>
				<cfcookie name="CFID" value="#cfid_local#">
				<cfcookie name="CFTOKEN" value="#cftoken_local#">
			</cfif>
		</cflock> 	
		
	</cffunction>

	<cffunction name="onError" returnType="void" output="true">
		
		<cfargument name="exception" required="true">
		<cfargument name="eventname" type="string" required="true">
		
		<cfif arguments.eventName NEQ "2">
			<cfdump var="#arguments.exception#" label="Application core exception">
		<cfelse>
			<cfdump var="#arguments.exception#" label="Application exception">
		</cfif>	
			
	</cffunction>
	

</cfcomponent>

