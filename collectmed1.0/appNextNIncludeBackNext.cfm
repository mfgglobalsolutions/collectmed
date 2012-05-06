
<!--- Provide Next/Back links --->
<cfoutput>
	 
	 <!--- Show link for Back, if appropriate --->
	 <cfif startRowBack gt 0>
	 	<a href="#CGI.script_name#?startRow=#startRowBack#"><span class="SiteRequiredLabel">< Back</span></a>
	 </cfif>
	 
	 <!--- Show link for Next, if appropriate --->
	 <cfif startRowNext lte totalRows>
	 	<a href="#CGI.script_name#?startRow=#startRowNext#"><span class="SiteRequiredLabel">Next ></span></a>
	 </cfif>
 
</cfoutput>


