

<cfcomponent extends="cmComponents.com.common.db.EmployerIO">		
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to check if an insurance company exists already.  --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="checkEmployerExists">		
				
		<cfargument name="EmployerName" required="yes">
							
		<cftry>			
			
			<cfquery name="checkExistsEmployer" datasource="#trim(request.datasource)#">
				SELECT em.EmployerID
				FROM employer em
				WHERE em.EmployerName = '#trim(EmployerName)#'
			</cfquery>
						
			<cfreturn checkExistsEmployer>
						
			<cfcatch type="Any">
			
				<cfthrow message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">			
				
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
		
		
		
		
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to add an insurance company.                      --->
	<!-------------------------------------------------------------------------------------->				
	<cffunction name="addEmployer">		
				
		<cfargument name="SupportEmailAddressID" required="Yes" type="numeric">
		
		<cfargument name="employername" required="yes">
		<cfargument name="employerdba" required="no" default="">
		
		<cfargument name="AddressTypeID" required="no">
		<cfargument name="Attention" required="no">
		<cfargument name="AddressLine1" required="no" default="">
		<cfargument name="AddressLine2" required="no" default="">
		<cfargument name="AddressCity" required="no" default="">
		<cfargument name="AddressStateID" required="no">
		<cfargument name="AddressZipCode" required="no" default="">
		
		<cfargument name="PhoneTypeID" required="no">
		<cfargument name="PhoneNumber" required="no" default="">
		<cfargument name="PhoneExtension" required="no" default="">
		
		<cfargument name="employerURL" required="no" default="">
		
		<cfargument name="employerVerify" required="no" default="yes">
		
		<cftry>
			
			<cftransaction>			
							
				<!-------------------------------------------------------------------------------------->
				<!--- Start by checking to see if the insurance company name is not taken.           --->
				<!-------------------------------------------------------------------------------------->			
				<cfif employerVerify>	
					
					<cfset tempQuery = checkEmployerExists(trim(EmployerName))>
					
					<cfif tempQuery.RecordCount EQ 1>
						<cfreturn tempQuery.EmployerID>
					<cfelseif tempQuery.RecordCount GT 1>
						<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
						<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
						<cfset message = "There are multiples of this Employer: '#trim(EmployerName)#'">
						<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="multiple of the same Employer. IMMEDIATE ATTENTION REQUIRED." message="<p><strong>User was sent:</strong> <br>CFTHROW</p><p><strong>Admin Note:</strong><br>#trim(message)#</p>">	
						<cf_gcGatewayLogger	code="115" logtext="<p><strong>User was sent:</strong> <br>#trim(message)#</p>#GetBaseTemplatePath()#">	
						<cfthrow message="#trim(message)#">
					</cfif>
						
				</cfif>
						
				
				<!-------------------------------------------------------------------------------------->
				<!--- Create a entity account for this Employer. This entity account will            --->
				<!--- be used to store the phones addresses and other Employer items.                --->
				<!-------------------------------------------------------------------------------------->		
				<cfset request.thisEntity = application.beanFactory.getBean("Entity") />
				<cfset request.thisEntity.setObjectTypeID(8)>
				<cfset EntityID = request.thisEntity.commit()>			
				
				<!-------------------------------------------------------------------------------------->
				<!--- Insert the Employer information.                                               --->
				<!-------------------------------------------------------------------------------------->					
				<cfset this.setEmployerName(trim(EmployerName))>
				<cfset this.setEmployerDBA(trim(EmployerDBA))>
				<cfset this.setEmployerURL(trim(EmployerURL))>
				<cfset this.setEntityID(trim(EntityID))>
				<cfset EmployerID = this.commit()>			
				
				<!-------------------------------------------------------------------------------------->
				<!--- Insert the Employer address                                                    --->
				<!-------------------------------------------------------------------------------------->			
				<cfif AddressLine1 NEQ "" AND AddressLine1 NEQ "NULL">
					
					<cfset request.thisAddress = application.beanFactory.getBean("old_Address") />	
					<cfset request.thisAddress.setAddressTypeID(trim(AddressTypeID))>
					<cfset request.thisAddress.setAddressLine1(trim(AddressLine1))>
					<cfset request.thisAddress.setAddressLine2(trim(AddressLine2))>
					<cfset request.thisAddress.setCity(trim(AddressCity))>
					<cfset request.thisAddress.setStateID(trim(AddressStateID))>
					<cfset request.thisAddress.setZipCode(trim(AddressZipCode))>
					<cfset addressID = request.thisAddress.commit()>
								
					<!-------------------------------------------------------------------------------------->
					<!--- Insert the record that will tie the Employer entity to an address              --->
					<!-------------------------------------------------------------------------------------->			
					<cfset request.thisEntity.bindEntityAddress(clientID: trim(session.clientID), EntityID: trim(EntityID), AddressID: trim(AddressID))>				
				
				</cfif>
				
					
					
				<!-------------------------------------------------------------------------------------->
				<!--- Insert the Employer Phone                                                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfif PhoneNumber NEQ "" AND PhoneNumber NEQ "NULL"> 
					
					<cfset PhoneNumberEncrypted = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(PhoneNumber)) />
					
					<cfif PhoneExtension GT "" AND PhoneExtension NEQ "NULL">
						<cfset PhoneExtensionEncrypted = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(PhoneExtension)) />
					<cfelse>
						<cfset PhoneExtensionEncrypted = "NULL">
					</cfif>			
					
					<cfset request.thisPhone = application.beanFactory.getBean("old_Phone") />	
					<cfset request.thisPhone.setPhoneTypeID(trim(PhoneTypeID))>
					<cfset request.thisPhone.setPhoneNumber(trim(PhoneNumberEncrypted))>
					<cfif PhoneExtension GT "">
						<cfset request.thisPhone.setPhoneExtension(trim(PhoneExtensionEncrypted))>
					</cfif>
					<cfset PhoneID = request.thisPhone.commit()>
								
					<!-------------------------------------------------------------------------------------->
					<!--- Insert the record that will tie the Employer entity to an address     --->
					<!-------------------------------------------------------------------------------------->			
					<cfset request.thisEntity.bindEntityPhone(clientID: trim(session.clientID), EntityID: trim(EntityID), PhoneID: trim(PhoneID))>	
				
				</cfif>
				
				
				<!-------------------------------------------------------------------------------------->
				<!--- The Insurance company has been created now go ahead and return the ID.         --->
				<!-------------------------------------------------------------------------------------->				
				<cfreturn trim(EmployerID)>
								
			</cftransaction>		
		
			<cfcatch type="Any">
			
				<cfoutput>
					
					<cfset message = "#CFCATCH.TYPE#<br>#cfcatch.message#<br>#cfcatch.detail#">
					
					<cfreturn message>
										
				</cfoutput>
				
			</cfcatch>
		
		</cftry>	
		
	</cffunction>				
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get all employer.                              --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getEmployer" hint="This function will be called to get all employer.">		
							
		<cftry>			
			
			<cfquery name="getEmployer" datasource="#trim(request.datasource)#">
				SELECT EmployerID, EmployerName, EmployerDBA, EntityID
				FROM employer
				WHERE Active = 1
			</cfquery>
						
			<cfreturn getEmployer>
						
			<cfcatch type="Any">
			
				<cfthrow message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">			
				
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
		
	
		
		
</cfcomponent>
	
		
		
		
		
		
<!--- 
Quickly create employer for testing.
<cfset SupportEmailAddressID = 50>
<cfset employername = "Medicare Insurance">
<cfset employerdba = "">
<cfset AddressTypeID = "13">
<cfset AddressLine1 = "1600 Pennsylvania Ave">
<cfset AddressLine2 = "">
<cfset AddressCity = "Wachington D.C.">
<cfset AddressStateID = "63">
<cfset AddressZipCode = "85262">
<cfset PhoneTypeID = "74">
<cfset PhoneNumber = "8003331600">
<cfset PhoneExtension = "789">	
<cfset EmployerURL = "http://www.MedicareInsurance.com">
<cfset request.Employer = CreateObject("component", "com.common.Employer")>
<cfset employerID = request.Employer.addEmployer(SupportEmailAddressID: session.client.getSupportEmailID(), employername: employername, employerdba: employerdba, AddressTypeID: AddressTypeID, AddressLine1: AddressLine1, AddressLine2: AddressLine2, AddressCity: AddressCity, AddressStateID: AddressStateID, AddressZipCode: AddressZipCode, PhoneTypeID: PhoneTypeID, PhoneNumber: PhoneNumber, PhoneExtension: PhoneExtension, EmployerURL: EmployerURL)>

--->		
