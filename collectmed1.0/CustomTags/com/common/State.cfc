


<cfcomponent name="State">		
	
	
	<cffunction name="getStateID" access="remote" returntype="string" output="no">
		
		<cfargument name="state" type="string" hint="A State Name or Abbreviation" required="true">
		
		<cfif LEN(state) EQ "">
			<cfreturn false>
		</cfif>
		
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfif LEN(state) EQ 2>
				<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" active="1" fields="StandardListItemID" returnvariable="getState" itemdescription="#trim(state)#">
			<cfelse>
				<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" active="1" fields="StandardListItemID" returnvariable="getState" itemnamedisplay="#trim(state)#">
			</cfif>						
			
			<cfif getState.RecordCount EQ 1>
				<cfreturn getState.StandardListItemID>
			<cfelse>
				<cfreturn false>	
			</cfif>
								
			<cfcatch type="Any">
				
				<cfreturn false>
				
				<cf_gcGeneralErrorTemplate message="#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 
	
	
	
	
	<cffunction name="getStateAbbr" access="remote" returntype="string" output="no">
		
		<cfargument name="stateID" type="string" hint="A State Name or Abbreviation" required="true">
		
		<cfif LEN(stateID) EQ "">
			<cfreturn false>
		</cfif>
		
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfif LEN(stateID) EQ 2>
				<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" active="1" fields="ItemDescription" returnvariable="getState" standardlistitemid="#trim(stateID)#">
			<cfelse>
				<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" active="1" fields="ItemDescription" returnvariable="getState" standardlistitemid="#trim(stateID)#">
			</cfif>						
			
			<cfif getState.RecordCount EQ 1>
				<cfreturn getState.ItemDescription>
			<cfelse>
				<cfreturn false>	
			</cfif>
								
			<cfcatch type="Any">
				
				<cfreturn false>
				
				<cf_gcGeneralErrorTemplate message="#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
	
	
	
	<cffunction name="getStateName" access="remote" returntype="string" output="no">
		
		<cfargument name="stateID" type="string" hint="A State Name or Abbreviation" required="true">
		
		<cfif LEN(stateID) EQ "">
			<cfreturn false>
		</cfif>
		
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfif LEN(stateID) EQ 2>
				<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" active="1" fields="ItemNameDisplay" returnvariable="getState" standardlistitemid="#trim(stateID)#">
			<cfelse>
				<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" active="1" fields="ItemNameDisplay" returnvariable="getState" standardlistitemid="#trim(stateID)#">
			</cfif>						
			
			<cfif getState.RecordCount EQ 1>
				<cfreturn getState.ItemNameDisplay>
			<cfelse>
				<cfreturn false>	
			</cfif>
								
			<cfcatch type="Any">
				
				<cfreturn false>
				
				<cf_gcGeneralErrorTemplate message="#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
</cfcomponent>

