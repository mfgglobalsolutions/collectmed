<!---- appInsuranceCompanyCreate_Process.cfm ---->



<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.debug" default="false">
	<cfset debug = attributes.debug>
	
	<cfparam name="attributes.randRange" default="#randRange(1001, 2252)#">
	<cfset randRange = attributes.randRange>
	
	<cfparam name="attributes.insurancecompanyname" default="Boston's Mutual Insurance Co.">
	<cfset insurancecompanyname = attributes.insurancecompanyname>
	
	<cfparam name="attributes.insurancecompanydba" default="BMIC">
	<cfset insurancecompanydba = attributes.insurancecompanydba>
	
	<cfparam name="attributes.AddressTypeID" default="">
	<cfset AddressTypeID = attributes.AddressTypeID>	

	<cfparam name="attributes.AddressLine1" default="">
	<cfset AddressLine1 = attributes.AddressLine1>

	<cfparam name="attributes.AddressLine2" default="">
	<cfset AddressLine2 = attributes.AddressLine2>
	
	<cfparam name="attributes.AddressCity" default="">
	<cfset AddressCity = attributes.AddressCity>
	
	<cfparam name="attributes.AddressStateID" default="">
	<cfset AddressStateID = attributes.AddressStateID>
	
	<cfparam name="attributes.AddressZipCode" default="">
	<cfset AddressZipCode = attributes.AddressZipCode>
	
	<cfparam name="attributes.PhoneTypeID" default="">
	<cfset PhoneTypeID = attributes.PhoneTypeID>
	
	<cfparam name="attributes.PhoneNumber" default="">
	<cfset PhoneNumber = attributes.PhoneNumber>
	
	<cfparam name="attributes.PhoneExtension" default="">
	<cfset PhoneExtension = attributes.PhoneExtension>

	
	
	
	

<cfset request.InsuranceCompany = CreateObject("component", "com.common.InsuranceCompany")>
<cfset insuranceCompanyID = request.InsuranceCompany.addInsuranceCompany(session.client.getClientID(), session.client.getSupportEmailID(), insurancecompanyname, insurancecompanydba, AddressTypeID, AddressLine1, AddressLine2, AddressCity, AddressStateID, AddressZipCode, PhoneTypeID, PhoneNumber, PhoneExtension)>


<cfoutput>#trim(insuranceCompanyID)#</cfoutput>

	