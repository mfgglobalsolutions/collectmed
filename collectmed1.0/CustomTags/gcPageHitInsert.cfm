<!------------------------------------------------------------------>
<!--- NAME: ewPageHitInsert.cfm                                  --->
<!------------------------------------------------------------------>
<!--- PURPOSE:                                                   --->      
<!--- This tag was created to create a way of logging the        --->
<!--- pages that are hit by users.                               --->
<!---                                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!--- Created 10/28/02 GCruz                                     --->
<!---                                                            --->
<!---                                                            --->      
<!------------------------------------------------------------------>


<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="request.SiteVariable.datasource" default="#request.SiteVariable.datasource#">
	<cfset datasource = request.SiteVariable.datasource>

	<cfparam name="attributes.PageID" default="">
	<cfset PageID = attributes.PageID>
	
	<cfparam name="attributes.SiteID" default="#Request.SiteID#">
	<cfset SiteID = attributes.SiteID>
		
	<cfparam name="attributes.IPAddress" default="#CGI.REMOTE_ADDR#">
	<cfset IPAddress = attributes.IPAddress>
	
	<cfparam name="attributes.BrowserType" default="#request.BrowserType#">
	<cfset BrowserType = attributes.BrowserType>
	
	<cfparam name="attributes.BrowserVersion" default="#request.BrowserVersion#">
	<cfset BrowserVersion = attributes.BrowserVersion>
	
	<cfparam name="attributes.OperatingSystem" default="#request.OperatingSystem#">
	<cfset OperatingSystem = attributes.OperatingSystem>
	
	<cfparam name="UsersID" default="NULL">
	
	<cfif IsDefined("Session.UsersID") AND Session.UsersID NEQ "">
		<cfset UsersID = Session.UsersID>
	</cfif>
	
	
<!------------------------------------------------------------------>
<!--- Create the query that will insert the page hit. Remember   --->
<!--- the page hit is inserted because the user has clicked on   --->
<!--- the page regardless of refresh or anything else.           --->
<!------------------------------------------------------------------>
	<cfquery name="PageHitInsert" datasource="#datasource#">
		INSERT INTO gcPageHit(PageID,SiteID,UsersID,IPAddress,BrowserType,BrowserVersion,OperatingSystem)
		VALUES(#PageID#,#SiteID#,#UsersID#,'#IPAddress#','#BrowserType#','#BrowserVersion#','#OperatingSystem#')
	</cfquery>
			
		