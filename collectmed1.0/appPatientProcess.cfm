<!---- appPatientProcess.cfm ---->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.PatientID" default="">
	<cfset PatientID = attributes.PatientID>
	
	<cfif IsDefined("form.PatientID") AND form.PatientID NEQ "">
		<cfset PatientID = form.PatientID>
	<cfelseif IsDefined("url.PatientID") AND url.PatientID NEQ "">
		<cfset PatientID = url.PatientID>	
	</cfif>
	
	<cfparam name="attributes.reload" default="">
	<cfset reload = attributes.reload>
		
	<cfif IsDefined("form.reload") AND form.reload NEQ "">
		<cfset reload = form.reload>
	<cfelseif IsDefined("url.reload") AND url.reload NEQ "">
		<cfset reload = url.reload>	
	</cfif>
	
	<cfparam name="attributes.func" default="">
	<cfset func = attributes.func>
		
	<cfif IsDefined("form.func") AND form.func NEQ "">
		<cfset func = form.func>
	<cfelseif IsDefined("url.func") AND url.func NEQ "">
		<cfset func = url.func>	
	</cfif>
	
	<cfparam name="attributes.resetA" default="">
	<cfset resetA = attributes.resetA>
	
	<cfif IsDefined("form.resetA") AND form.resetA NEQ "">
		<cfset resetA = form.resetA>
	<cfelseif IsDefined("url.resetA") AND url.resetA NEQ "">
		<cfset resetA = url.resetA>	
	</cfif>	
	
	<cfparam name="attributes.resetP" default="">
	<cfset resetP = attributes.resetP>
	
	<cfif IsDefined("form.resetP") AND form.resetP NEQ "">
		<cfset resetP = form.resetP>
	<cfelseif IsDefined("url.resetP") AND url.resetP NEQ "">
		<cfset resetP = url.resetP>	
	</cfif>	
	
	

<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="PatientID"
		fieldnames="Patient ID"
		datatypes="numeric">	
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Depending on the form submitted we will save the different information.        --->
<!-------------------------------------------------------------------------------------->		
<cfif IsDefined("form.formName") AND form.formName EQ "insuranceForm">	
		
	<cf_tagPatientInsuranceFormProcess>			
		
</cfif>		

<cfif IsDefined("form.formName") AND form.formName EQ "PerosnalInformationForm">

	<cf_tagPatientPersonalInformationFormProcess>		

</cfif>
	
<cfif IsDefined("form.formName") AND form.formName EQ "AddressInformationForm">

	<cf_tagEntityAddressesFormProcess>

</cfif>		
		
<cfif IsDefined("form.formName") AND form.formName EQ "PhoneInformationForm">

	<cf_tagEntityPhonesFormProcess>

</cfif>		
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Locate to the original page.                                                   --->
<!-------------------------------------------------------------------------------------->	
	<cfset msg = "Patient information saved successfully.">
	<cflocation addtoken="No" url="appPatient.cfm?patientID=#trim(patientID)#&resetA=#trim(resetA)#&resetP=#trim(resetP)#&reload=#trim(reload)#&func=#trim(func)#&msg=#msg#">
	
	