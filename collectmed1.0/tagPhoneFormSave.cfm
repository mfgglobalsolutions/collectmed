
	

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->		
	<cfparam name="attributes.formName" default="PhoneInformationForm">
	<cfset formName = attributes.formName>
	
	<cfparam name="attributes.entityID" default="">
	<cfset entityID = attributes.entityID>	


<cfif IsDefined("form.phoneID")>
	
	<cfset form.PhoneNumber = trim(application.beanFactory.getBean('globalFooter').GlobalFooterE(form.PhoneNumber))>	
	<cfif form.PhoneExtension NEQ "">		
		<cfset form.PhoneExtension = trim(application.beanFactory.getBean('globalFooter').GlobalFooterE(form.PhoneExtension))>	
	</cfif>		
	
	<cfset phoneGate = createObject("component", "phoneGateway")>
	<cfset phone = createObject("component", "PhoneBean").init('#trim(request.datasource)#', form)>			
	<cfset phoneSave = phoneGate.save('#trim(request.datasource)#', phone)>
	<cfif IsNumeric(entityID)>		
		<cfset phoneDataAccess = createObject("component", "phoneDAO")>
		<cfset phoneDataAccess.bindPhoneEntity(ds: '#trim(request.datasource)#', entityID: trim(entityID), phoneID: trim(phoneSave.getPhoneID()))>
	</cfif>
</cfif>


<cfoutput>
	<form name="#trim(formName)#" method="post">
	<input type="Hidden" name="action" value="processed">
	<input type="Hidden" name="tab" value="phone">
	</form>
	<script language="JavaScript">
		#trim(formName)#.submit();			
	</script>	
</cfoutput>