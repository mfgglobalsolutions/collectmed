<!------------------------------------------------------------------>
<!--- NAME: gcPagesGet.cfm                                       --->
<!------------------------------------------------------------------>
<!--- PURPOSE:                                                   --->      
<!---                                                            --->
<!---                                                            --->
<!------------------------------------------------------------------>
<!--- HISTORY:                                                   --->
<!---                                                            --->
<!---                                                            --->      
<!------------------------------------------------------------------>



<!------------------------------------------------------------------>
<!--- Initialize tag variables and verify required fields        --->      
<!------------------------------------------------------------------>	
	<cfparam Name="Attributes.Fields" Default="*">
	<cfset Fields = Attributes.Fields>
	
	<cfparam Name="Attributes.QueryName" Default="gcPages">
	<cfset QueryName = Attributes.QueryName>
	
	<cfparam Name="Attributes.OrderBy" Default="">
	<cfset OrderBy = Attributes.OrderBy>
	
	<cfparam name="attributes.PageID" default="">
	<cfset PageID = attributes.PageID>
	
	<cfparam name="attributes.SiteID" default="1">	
	<cfset SiteID = attributes.SiteID>	
	
	<cfparam name="attributes.PageName" default="">
	<cfset PageName = attributes.PageName>
	
	<cfparam name="attributes.Title" default="">
	<cfset Title = attributes.Title>
	
	<cfparam name="attributes.Security" default="">
	<cfset Security = attributes.Security>	
	
	<cfparam name="attributes.Active" default="1">
	<cfset Active = attributes.Active>
	
	<cfparam name="attributes.ShowPageLink" default="">
	<cfset ShowPageLink = attributes.ShowPageLink>

	<cfparam name="attributes.CategoryID" default="">
	<cfset CategoryID = attributes.CategoryID>
	
	<cfparam name="attributes.CategoryIDNotIn" default="">
	<cfset CategoryIDNotIn = attributes.CategoryIDNotIn>
	
	<cfparam name="attributes.PageIDNotIn" default="">
	<cfset PageIDNotIn = attributes.PageIDNotIn>
	
	
	
<!------------------------------------------------------------------>
<!--- Complete the tag and build the query based on the          --->
<!--- variables from above.                                      --->
<!------------------------------------------------------------------>

	<cfquery Name="caller.#QueryName#" datasource="pa_master" cachedwithin="#CreateTimeSpan(0,0,0,0)#">
		SELECT #Fields#
		FROM Page
		WHERE 1=1
			<cfif PageID NEQ ""> AND PageID IN(#PageID#)</cfif>
			<cfif PageIDNotIn NEQ ""> AND PageID NOT IN(#PageIDNotIn#)</cfif>			
			<cfif SiteID NEQ ""> AND SiteID = #SiteID#</cfif>
			<cfif PageName NEQ ""> AND PageName = '#PageName#'</cfif>
			<cfif Title NEQ ""> AND Title = '#Title#'</cfif>
			<cfif CategoryID NEQ ""> AND CategoryID IN(#CategoryID#)</cfif>
			<cfif CategoryIDNotIn NEQ ""> AND CategoryID NOT IN(#CategoryIDNotIn#)</cfif>
			<cfif ShowPageLink NEQ ""> AND ShowPageLink = '#ShowPageLink#'</cfif>
			<cfif Security NEQ ""> AND Security = '#Security#'</cfif>
			<cfif Active NEQ ""> AND Active = '#Active#'</cfif>			
		<cfif OrderBy NEQ "">
			ORDER BY #OrderBy#
		</cfif>
	</cfquery>
	
	