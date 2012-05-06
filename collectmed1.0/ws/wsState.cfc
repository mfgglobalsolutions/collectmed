

<cfcomponent>

	<cffunction name="wsGetState" access="remote" returntype="string" output="no">
		
		<cfargument name="id" type="string" hint="A valid state id" required="true">
		
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfinvoke component="com.common.State" method="getStateName" stateid="#trim(id)#" returnvariable="State">
				
			<cfif State NEQ "">
				<cfreturn State>
			<cfelse>
				<cfreturn false>	
			</cfif>
								
			<cfcatch type="Any">
				
				<cfreturn false>
				
				<cf_gcGeneralErrorTemplate
					message="#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 

</cfcomponent>

	