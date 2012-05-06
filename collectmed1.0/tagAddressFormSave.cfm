
	

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->		
	<cfparam name="attributes.formName" default="AddressInformationForm">
	<cfset formName = attributes.formName>
	
	<cfparam name="attributes.entityID" default="">
	<cfset entityID = attributes.entityID>
	


<cfif IsDefined("form.addressID")>
	<cfset addressGate = createObject("component", "addressGateway")>
	<cfset address = createObject("component", "AddressBean").init('#trim(request.datasource)#', form)>				
	<cfset addressSave = addressGate.save('#trim(request.datasource)#', address)>	
	<cfif IsNumeric(entityID)>		
		<cfset addressDataAccess = createObject("component", "addressDAO")>
		<cfset addressDataAccess.bindAddressEntity(ds: '#trim(request.datasource)#', entityID: trim(entityID), addressID: trim(addressSave.getAddressID()))>
	</cfif>
</cfif>


<cfoutput>
	<form name="#trim(formName)#" method="post">
	<input type="Hidden" name="action" value="processed">
	<input type="Hidden" name="tab" value="address">
	</form>
	<script language="JavaScript">
		#trim(formName)#.submit();			
	</script>	
</cfoutput>