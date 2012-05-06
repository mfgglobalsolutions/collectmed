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
	
	<cfset request.datasource = "EOBManager">
	
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
	
	<cfparam name="request.applicationPathMainFolder" default="EOBManager">
	
	<cfparam name="request.fmsPathMainFolder" default="EOBManager">
	
	<cfparam name="request.applicationPath" default="#trim(request.driveLetter)#:\#trim(request.applicationPathMainFolder)#">
	
	<cfparam name="request.filesPath" default="#trim(request.driveLetterFMS)#:\#trim(request.fmsPathMainFolder)#">
	
	<cfparam name="request.fmsPath" default="#trim(request.driveLetterFMS)#:\#trim(request.fmsPathMainFolder)#\#trim(request.fmsVirtualDirectory)#">
	
	<cfparam name="request.tempDocsURL" default="#trim(request.urlProtocol)##trim(request.urlHost)#.#trim(request.urlDomain)#.#trim(request.urlHighLevelDomain)#/#trim(request.fmsVirtualDirectory)#">
	
	<cfparam name="request.ediURL" default="https://secure.nationaledi.com">
