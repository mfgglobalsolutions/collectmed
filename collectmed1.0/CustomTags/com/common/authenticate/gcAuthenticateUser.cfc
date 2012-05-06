
<cfcomponent name="gcAuthenticateUser">

	<cfset variables.instance.user = '' />
	
	<cffunction name="AuthenticateUser" access="public" returntype="query" output="No" hint="This function will authenticate a user to a site.">

		<cfargument name="entry" required="true" type="string">
		<cfargument name="entrypoint" required="true" type="string">
		<cfargument name="ds" required="false" default="" type="string">

		<cfset request.entry = application.beanFactory.getBean('globalFooter').GlobalFooterE(lcase(trim(arguments.entry)))>
		<cfset request.entryPoint = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(arguments.entryPoint))>

		<cfset request.accesscontrol = variables.instance.user.getUsersQuery(Entry: '#trim(request.entry)#', EntryPoint: '#trim(request.entryPoint)#', Active: '1') />

		<cfreturn request.accesscontrol>		
	
	</cffunction>	
	
	
	<cffunction name="setUser">
		<cfargument name="user" type="any" required="true">
		
		<cfset variables.instance.user = arguments.user />
		
	</cffunction>
		

</cfcomponent>

	