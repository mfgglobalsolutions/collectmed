
	
<cfcomponent displayname="configBean" output="false">


	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.DSN = '' />
	<cfset variables.instance.Domain = '' />
	<cfset variables.instance.Database = '' />
	
	<cffunction name="init" access="public" returntype="any" hint="Constructor">			
		<cfreturn this />		
	</cffunction>
	
	<cffunction name="getDSN" access="public" returntype="struct" output="false" hint="Datasources">
		<cfreturn variables.instance.DSN />
	</cffunction>
		
	<cffunction name="setDSN" access="public" returntype="void" output="false" hint="Datasources">
		<cfargument name="DSN" type="struct" required="true" hint="DSN" />
		<cfset variables.instance.DSN = arguments.DSN />
	</cffunction>

	<cffunction name="getDomain" access="public" returntype="struct" output="false" hint="Domain">
		<cfreturn variables.instance.Domain />
	</cffunction>
		
	<cffunction name="setDomain" access="public" returntype="void" output="false" hint="Domain">
		<cfargument name="Domain" type="struct" required="true" hint="Domain" />
		<cfset variables.instance.Domain = arguments.Domain />
	</cffunction>

	<cffunction name="getDatabase" access="public" returntype="struct" output="false" hint="Database">
		<cfreturn variables.instance.Database />
	</cffunction>
		
	<cffunction name="setDatabase" access="public" returntype="void" output="false" hint="Database">
		<cfargument name="Database" type="struct" required="true" hint="Database" />
		<cfset variables.instance.Database = arguments.Database />
	</cffunction>
		
</cfcomponent>