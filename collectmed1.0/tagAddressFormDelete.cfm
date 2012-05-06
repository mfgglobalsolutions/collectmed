
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->		
	<cfparam name="attributes.formName" default="AddressInformationForm">
	<cfset formName = attributes.formName>
	
	
				
<!------------------------------------------------------------------>
<!--- Verify that the needed parameters have been sent in.       --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="addressID"
		fieldnames="Address ID"
		datatypes="numeric">



<!-------------------------------------------------------------------------------------->
<!--- Process the deletion                                                           --->
<!-------------------------------------------------------------------------------------->
	<cfset addressDataAccess = createObject("component", "addressDAO")>
	<cfset addressDataAccess.archiveAddress(ds: '#trim(request.datasource)#', addressID: trim(AddressID))>	
				
	<cfoutput>
		<form name="#trim(formName)#" method="post">
		<input type="Hidden" name="action" value="processed">
		<input type="Hidden" name="tab" value="address">
		</form>
		<script language="JavaScript">
			#trim(formName)#.submit();			
		</script>	
	</cfoutput>