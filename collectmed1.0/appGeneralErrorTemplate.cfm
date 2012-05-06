
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.message" default="Error">
	<cfset message = attributes.message>

	<cfif IsDefined("form.message") AND form.message NEQ "">
		<cfset message = form.message>
	<cfelseif IsDefined("url.message") AND url.message NEQ "">
		<cfset message = url.message>	
	</cfif>




<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->
	<cf_gcGeneralErrorTemplate message="#url.message#">


