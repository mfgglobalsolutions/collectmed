
<cfcomponent displayname="Datasource" output="false" hint="I am the Datasource Class.">

	<cfproperty name="DSName" type="string" default="" />
	<cfproperty name="username" type="string" default="" />
	<cfproperty name="password" type="string" default="" />

	<!-------------------------------------------------------------------------------------->
	<!--- Pseudo-constructor                                                             --->
	<!-------------------------------------------------------------------------------------->
	<cfset variables.instance.DSName = '' />
	<cfset variables.instance.username = '' />
	<cfset variables.instance.password = '' />

	<cffunction name="init" access="public" output="false" returntype="any" hint="I am the constructor method for the Datasource Class.">
		<cfargument name="DSName" required="false" type="String" default="fakeDSN" hint="I am the name of the datasource." />
		<cfargument name="username" required="false" type="String" default="" hint="I am the username required to access the datasource." />
		<cfargument name="password" required="false" type="String" default="" hint="I am the password required to access the datasource." />

		<cfscript>
			setDSName(arguments.DSName);
			setUsername(arguments.username);
			setPassword(arguments.password);
		</cfscript>
		
		<cfreturn this />
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- getters / accessors                                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDSName" access="public" output="false" hint="I return the name of the datasource.">
		<cfreturn variables.instance.DSName />
	</cffunction>
	
	<cffunction name="setDSName" access="public" hint="Setter for Datasource" output="false" returnType="void">
		<cfargument name="DSName" hint="" required="yes" type="string" />
		<cfset variables.instance.DSName = arguments.DSName />
	</cffunction>		

	<cffunction name="getUsername" access="public" output="false" hint="I return the username required to access the datasource.">
		<cfreturn variables.instance.username />
	</cffunction>
	
	<cffunction name="setUsername" access="public" hint="Setter for Username" output="false" returnType="void">
		<cfargument name="Username" hint="" required="yes" type="string" />
		<cfset variables.instance.Username = arguments.Username />
	</cffunction>	

	<cffunction name="getPassword" access="public" output="false" hint="I return the password required to access the datasource.">
		<cfreturn variables.instance.password />
	</cffunction>
	
	<cffunction name="setPassword" access="public" hint="Setter for Password" output="false" returnType="void">
		<cfargument name="Password" hint="" required="yes" type="string" />
		<cfset variables.instance.Password = arguments.Password />
	</cffunction>	

	<cffunction name="getMemento" access="public" returntype="struct" output="false" >
		<cfreturn variables.instance />
	</cffunction>
	
</cfcomponent>