
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->		
	<cfparam name="attributes.formName" default="PhoneInformationForm">
	<cfset formName = attributes.formName>
	
	
				
<!------------------------------------------------------------------>
<!--- Verify that the needed parameters have been sent in.       --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="phoneID"
		fieldnames="Phone ID"
		datatypes="numeric">



<!-------------------------------------------------------------------------------------->
<!--- Process the deletion                                                           --->
<!-------------------------------------------------------------------------------------->
	<cfset phoneDataAccess = createObject("component", "phoneDAO")>
	<cfset phoneDataAccess.archivePhone(ds: '#trim(request.datasource)#', phoneID: trim(PhoneID))>	
				
	<cfoutput>
		<form name="#trim(formName)#" method="post">
		<input type="Hidden" name="action" value="processed">
		<input type="Hidden" name="tab" value="phone">
		</form>
		<script language="JavaScript">
			#trim(formName)#.submit();			
		</script>	
	</cfoutput>