       
    <cfparam name="request.BrowserType" default="">
    <cfparam name="request.BrowserVersion" default="">
    <cfparam name="request.OperatingSystem" default="">
    <cfparam name="bv" default="">
    <cfparam name="bv1" default="">
	
   
    <cfif HTTP_USER_AGENT CONTAINS "MSIE">
    	<cfset request.BrowserType = "IE">
    <cfelseif HTTP_USER_AGENT DOES NOT CONTAIN "compatible;">
    	<cfset request.BrowserType = "NS">
    <cfelseif HTTP_USER_AGENT CONTAINS "Opera">
    	<cfset request.BrowserType = "OPERA">
    </cfif>
	
    <!--- Find OperatingSystem with IE--->
    <cfif request.BrowserType EQ "IE">
	   
	    <cfif HTTP_USER_AGENT CONTAINS "Windows NT)" OR HTTP_USER_AGENT CONTAINS "Windows NT 4.0)">
	    	<cfset request.OperatingSystem = "WinNT">
	    <cfelseif HTTP_USER_AGENT CONTAINS "95">
	   		<cfset request.OperatingSystem = "Win95">
	    <cfelseif HTTP_USER_AGENT CONTAINS "98">
	    	<cfset request.OperatingSystem = "Win98">
	    <cfelseif HTTP_USER_AGENT CONTAINS "9x">
	    	<cfset request.OperatingSystem = "WinME">
		<cfelseif HTTP_USER_AGENT CONTAINS "Windows NT 5.2">
	    	<cfset request.OperatingSystem = "Win2003">	
	    <cfelseif HTTP_USER_AGENT CONTAINS "Windows NT 5.0">
	    	<cfset request.OperatingSystem = "Win2k">
	    <cfelseif HTTP_USER_AGENT CONTAINS "Windows NT 5.1">
	    	<cfset request.OperatingSystem = "WinXP">
	    <cfelseif HTTP_USER_AGENT CONTAINS "Windows NT 6.1">
	    	<cfset request.OperatingSystem = "Win7">
	    <cfelseif HTTP_USER_AGENT CONTAINS "Linux">
	    	<cfset request.OperatingSystem = "Linux">
	    <cfelseif HTTP_USER_AGENT CONTAINS "apple">
	    	<cfset request.OperatingSystem = "Apple">
	    <cfelseif HTTP_USER_AGENT CONTAINS "mac">
	    	<cfset request.OperatingSystem = "Mac">
	    <cfelse>
	    	<cfset request.OperatingSystem = "UnKnown">
	    </cfif>
   
    <cfelseif request.BrowserType EQ "NS">
	   
	    <cfif HTTP_USER_AGENT CONTAINS "WinNT; I)">
	    	<cfset request.OperatingSystem = "WinNT">
	    <cfelseif HTTP_USER_AGENT CONTAINS "95">
	    	<cfset request.OperatingSystem = "Win95">
	    <cfelseif HTTP_USER_AGENT CONTAINS "98">
	    	<cfset request.OperatingSystem = "Win98">
		<cfelseif HTTP_USER_AGENT CONTAINS "Windows NT 5.2">
	    	<cfset request.OperatingSystem = "Win2003">	
	    <cfelseif HTTP_USER_AGENT CONTAINS "Windows NT 5.0; I)">
	    	<cfset request.OperatingSystem = "Win2k">
	    <cfelseif HTTP_USER_AGENT CONTAINS "Windows NT 5.1">
	    	<cfset request.OperatingSystem = "WinXP">
	    <cfelseif HTTP_USER_AGENT CONTAINS "Windows NT 6.1">
	    	<cfset request.OperatingSystem = "Win7">	
	    <cfelseif HTTP_USER_AGENT CONTAINS "Linux">
	    	<cfset request.OperatingSystem = "Linux">
	    <cfelseif HTTP_USER_AGENT CONTAINS "apple">
	    	<cfset request.OperatingSystem = "Apple">
	    <cfelseif HTTP_USER_AGENT CONTAINS "mac">
	    	<cfset request.OperatingSystem = "Mac">
	    <cfelse>
	    	<cfset request.OperatingSystem = "UnKnown">
	    </cfif>
   
    </cfif>
    <!--- End Operating System Lookup --->
	
    <!--- Get the Browser Version --->
    <!--- IE Version On NT 4--->
    <cfif request.BrowserType EQ "IE" AND request.OperatingSystem EQ "winNT">
    	<cfset bv = #RemoveChars(HTTP_USER_AGENT, 1, 30)#>
    	<cfset bv1 = Findoneof(';', bv , 1)>
    	<cfset request.BrowserVersion = #RemoveChars(bv,bv1, 30)#>
    </cfif>
    <!--- IE Version on 95 and 98 --->
    <cfif request.BrowserType EQ "IE" AND request.OperatingSystem CONTAINS "win9">
    	<cfset bv = #RemoveChars(HTTP_USER_AGENT, 1, 30)#>
    	<cfset bv1 = Findoneof(';', bv , 1)>
    	<cfset request.BrowserVersion = #RemoveChars(bv,bv1, 40)#>
    </cfif>
    <!--- IE version on Win2k --->
    <cfif request.BrowserType EQ "IE" AND request.OperatingSystem EQ "win2k">
    	<cfset bv = #RemoveChars(HTTP_USER_AGENT, 1, 30)#>
    	<cfset bv1 = Findoneof(';', bv , 1)>
    	<cfset request.BrowserVersion = #RemoveChars(bv,bv1, 50)#>
    </cfif>
	 <!--- IE version on Win2003 --->
    <cfif request.BrowserType EQ "IE" AND request.OperatingSystem EQ "win2003">    	
		<cfset bv = #RemoveChars(HTTP_USER_AGENT, 1, 30)#>
    	<cfset bv1 = Findoneof(';', bv , 1)>
    	<cfset request.BrowserVersion = #RemoveChars(bv,bv1, len(bv))#>		
    </cfif>	
	
    <!--- IE version on WinXP --->
    <cfif request.BrowserType EQ "IE" AND request.OperatingSystem EQ "WinXP">
    	<cfset bv = #RemoveChars(HTTP_USER_AGENT, 1, 30)#>
    	<cfset bv1 = Findoneof(';', bv , 1)>
    	<cfset request.BrowserVersion = #RemoveChars(bv,bv1, 50)#>
    </cfif>
		
	<!--- IE version on Win7 --->
    <cfif request.BrowserType EQ "IE" AND request.OperatingSystem EQ "Win7">
    	<cfset bv = #RemoveChars(HTTP_USER_AGENT, 1, 30)#>
    	<cfset bv1 = Findoneof(';', bv , 1)>
    	<cfset request.BrowserVersion = #RemoveChars(bv,bv1, 50)#>
    </cfif>
	
	
    <!--- NS Version --->
    <cfif request.BrowserType EQ "NS">
    	<cfset bv = #RemoveChars(HTTP_USER_AGENT, 1, 8)#>
    	<cfset request.BrowserVersion = #RemoveChars(bv,5, 60)#>
    </cfif>
    <!--- Opera Version --->
    <cfif request.BrowserType EQ "Opera">
    	<cfset bv = #RemoveChars(HTTP_USER_AGENT, 1, 39)#>
    	<cfset request.BrowserVersion = #RemoveChars(bv,4, 30)#>
    </cfif>
    <!--- End BrowserVersion Lookup--->
	
