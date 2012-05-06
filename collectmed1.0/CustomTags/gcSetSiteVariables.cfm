<!------------------------------------------------------------------>
<!--- NAME: gcSetSiteVariables.cfm                               --->
<!------------------------------------------------------------------>
<!--- PURPOSE:                                                   --->      
<!--- This tag will create the sites variables in order          --->
<!--- of the Site variable names in the database.                --->
<!---                                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!---                                                            --->
<!---                                                            --->      
<!------------------------------------------------------------------>



<!------------------------------------------------------------------>
<!--- Get the sites wddx variables and place them in             --->
<!--- this query.                                                --->
<!------------------------------------------------------------------>
	<cf_gcSiteGet 
		queryname="getVariables" 
		SiteID="#request.SiteID#" 
		Fields="Directory,wddxSiteVariables">
	
	
		
<!------------------------------------------------------------------>
<!--- Set site the variables by looping through them.            --->
<!------------------------------------------------------------------>				 		 	
	
	<cfif IsDefined("getVariables.wddxSiteVariables") AND getVariables.wddxSiteVariables NEQ "">
	
		<cfwddx 
			action="wddx2cfml" 
			input="#getVariables.wddxSiteVariables#" 
			output="cfmlSiteVariables">
		
		<cfloop query="cfmlSiteVariables">							
			<cfif VariableName NEQ "">
				<cfset Variables_name = "request.SiteVariable.#Replace(VariableName, " ", "", "ALL")#">	
				<cfset '#Variables_name#' = #trim(VariableValue)#>
			</cfif>
		</cfloop>
	
	<cfelse>
		
		<cf_gcGeneralErrorTemplate
			message="The wddx site variables do not exist.">
		
	</cfif>
	
	
