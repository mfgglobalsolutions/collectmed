<!------------------------------------------------------------------>
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>
	<cfparam name="attributes.datasource" default="#trim(request.datasource)#">
	<cfset datasource = attributes.datasource>
		
	<cfparam name="attributes.clientID" default="">
	<cfset clientID = attributes.clientID>
	
	<cfif IsDefined("form.clientID") AND form.clientID NEQ "">
		<cfset clientID = form.clientID>
	<cfelseif IsDefined("url.clientID") AND url.clientID NEQ "">
		<cfset clientID = url.clientID>	
	</cfif>
	
	<cfparam name="attributes.fileID" default="">
	<cfset fileID = attributes.fileID>
	
	<cfif IsDefined("form.fileID") AND form.fileID NEQ "">
		<cfset fileID = form.fileID>
	<cfelseif IsDefined("url.fileID") AND url.fileID NEQ "">
		<cfset fileID = url.fileID>	
	</cfif>
	
	<cfparam name="attributes.SupportEmailAddressID" default="">
	<cfset SupportEmailAddressID = attributes.SupportEmailAddressID>
	
	<cfif IsDefined("form.SupportEmailAddressID") AND form.SupportEmailAddressID NEQ "">
		<cfset SupportEmailAddressID = form.SupportEmailAddressID>
	<cfelseif IsDefined("url.SupportEmailAddressID") AND url.SupportEmailAddressID NEQ "">
		<cfset SupportEmailAddressID = url.SupportEmailAddressID>	
	</cfif>

	
<!------------------------------------------------------------------>
<!--- Start the processing of this tag.                          --->
<!------------------------------------------------------------------>
<cfscript>	   
   structParameters = structNew();	    
   structParameters.datasource = #trim(datasource)#;
   structParameters.siteID = #trim(request.Site.getSiteID())#;	 
   structParameters.clientID = #trim(clientID)#;    	
   structParameters.fileID = #trim(fileID)#;  
   structParameters.SupportEmailAddressID = #trim(SupportEmailAddressID)#; 	  	   
   structParameters.applicationPath = #trim(request.applicationPath)#; 	  	   
</cfscript>	
	
	


<!-------------------------------------------------------------------------------------->
<!--- Create the object that will help us build the XML                              --->
<!-------------------------------------------------------------------------------------->
<cfset HealthCareClaimPaymentAdvice835 = CreateObject("component", "com.common.HealthCareClaimPaymentAdvice835")>
<cfset xmlString835 = HealthCareClaimPaymentAdvice835.ProcessFileToDB(structParameters)>	

	
	
	
<!---	<cfset status = SendGatewayMessage("CreateFile835ToXML", structParameters)>--->
	
	