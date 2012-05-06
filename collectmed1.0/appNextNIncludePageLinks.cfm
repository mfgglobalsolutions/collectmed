
<!--- Simple "Page" counter, starting at first "Page" --->
<cfset thisPage = 1>

<cfif NOT URL.showAll AND totalRows GT rowsPerPage><cfoutput><span class="SiteRequiredLabel"><a href="#CGI.script_name#?&showAll=Yes">Show&nbsp;All</a>&nbsp;</span></cfoutput></cfif> 

<!--- Loop thru row numbers, in increments of RowsPerPage --->
<cfloop from="1" to="#totalRows#" step="#rowsPerPage#" index="pageRow">
 
	<!--- Detect whether this "Page" currently being viewed --->
	<cfset isCurrentPage = (pageRow gte URL.startRow) and (pageRow lte endRow)>
	
	<!--- If this "Page" is current page, show without link --->
	<cfif isCurrentPage>
	
	<cfif NOT URL.showAll AND totalRows GT rowsPerPage><cfoutput><span class="SiteRequiredLabel"><b>#thisPage#</b></span></cfoutput></cfif> 
	
	<!--- Otherwise, show with link so user can go to page ---> 
	<cfelse>
	
	 <cfoutput>
	 	<a href="#CGI.script_name#?startRow=#pageRow#"><span class="SiteRequiredLabel">#thisPage#</span></a>
	 </cfoutput> 
	 
	</cfif>
	
	<!--- Increment ThisPage variable --->
	<cfset thisPage = thisPage + 1>
	
</cfloop>

	
