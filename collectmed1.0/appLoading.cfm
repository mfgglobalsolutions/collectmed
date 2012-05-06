<!---- appLoading.cfm ---->


<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.gotopage" default="">
	<cfset gotopage = attributes.gotopage>
	
	<cfif IsDefined("form.gotopage") AND form.gotopage NEQ "">
		<cfset gotopage = form.gotopage>
	<cfelseif IsDefined("url.gotopage") AND url.gotopage NEQ "">
		<cfset gotopage = url.gotopage>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="gotopage"
		fieldnames="Go To Page">	

	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the display of this page.                                                --->
<!-------------------------------------------------------------------------------------->	
	<cfoutput>
		<font color=red>Loading...</font>
		<script>
			location='#trim(gotopage)#'			
		</script>	
	</cfoutput>
	
	