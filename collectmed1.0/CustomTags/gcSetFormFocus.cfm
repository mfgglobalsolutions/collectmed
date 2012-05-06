<!------------------------------------------------------------------>
<!--- NAME:                                                      --->
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
<!--- Initialize all tag variables.                              --->      
<!------------------------------------------------------------------>

	<cfparam name="attributes.formname" default="">
	<cfset formname=attributes.formname>
	
	<cfparam name="attributes.fieldname" default="">
	<cfset fieldname=attributes.fieldname>

	
	
<!------------------------------------------------------------------>
<!--- Verify the user has sent in the correct parameters to      --->
<!--- this page.                                                 --->
<!------------------------------------------------------------------>	
	
	<cf_gcVerifyFields    
	   fields="formname,fieldname"
	   fieldnames="Form Name,Field Name">
	   
	   
	   
	   
<!------------------------------------------------------------------>
<!--- Output the necessary code to set the focus on the field    --->
<!--- specified.                                                 --->
<!------------------------------------------------------------------>	   
   
	<cfoutput>
		<script language="JavaScript">
			<!--- set the focus on the form--->
			if ( typeof( document.forms.#trim(formname)#.#fieldname# ) == "object" ){
				document.forms.#trim(formname)#.#fieldname#.focus();
			}
		</script>
	</cfoutput>
	
	
