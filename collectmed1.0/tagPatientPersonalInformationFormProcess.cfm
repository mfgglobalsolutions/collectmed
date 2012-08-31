<!--- tagPatientPersonalInformationFormProcess.cfm --->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.entityCommit" default="0">
	<cfset entityCommit = attributes.entityCommit>

	<cfparam name="attributes.patientCommit" default="0">
	<cfset patientCommit = attributes.patientCommit>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create the patient object.                                                     --->
<!-------------------------------------------------------------------------------------->
	<cfset request.Patient = application.beanFactory.getBean("Patient").initPatientIO(patientID)>
		
	<cfif IsDefined("form.patientAccountNumber") AND COMPARE(request.Patient.getAccountNumber(), form.patientAccountNumber) NEQ 0>
		<cfset request.Patient.setAccountNumber(form.patientAccountNumber)>
		<cfset patientCommit = 1>
	</cfif>	
	
	<cfif patientCommit>
		<cfset request.Patient.commit()>
	</cfif>
	

<!-------------------------------------------------------------------------------------->
<!--- Create the Entity object.                                                     --->
<!-------------------------------------------------------------------------------------->
	<cfset request.Entity = application.beanFactory.getBean("Entity").initEntityIO(request.Patient.getEntityID())>
	
	<cfif IsDefined("form.EntityFName") AND COMPARE(request.Entity.getFName(), form.EntityFName) NEQ 0>
		<cfset request.Entity.setFName(form.EntityFName)>
		<cfset entityCommit = 1>
	</cfif>	
	
	<cfif IsDefined("form.EntityMName") AND COMPARE(request.Entity.getMName(), form.EntityMName) NEQ 0>
		<cfif form.EntityMName EQ "">
			<cfset form.EntityMName = "NULL">
		</cfif>		
		<cfset request.Entity.setMName(form.EntityMName)>
		<cfset entityCommit = 1> 
	</cfif>
	
	<cfif IsDefined("form.EntityLName") AND COMPARE(request.Entity.getLName(), form.EntityLName) NEQ 0>
		<cfset request.Entity.setLName(form.EntityLName)>
		<cfset entityCommit = 1> 
	</cfif>
	
	<cfif IsDefined("form.EntityDOB") AND IsDate(form.EntityDOB) AND request.Entity.getDOB() NEQ form.EntityDOB>
		<cfset request.Entity.setDOB(form.EntityDOB)>
		<cfset entityCommit = 1> 
	</cfif>
	
	<cfif IsDefined("form.EntitySex") AND request.Entity.getSex() NEQ form.EntitySex>
		<cfset request.Entity.setSex(form.EntitySex)>
		<cfset entityCommit = 1> 
	</cfif>
	
	<cfif IsDefined("form.entitySSN") AND request.Entity.getSSN() NEQ form.entitySSN>
		<cfset request.Entity.setSSN(application.beanFactory.getBean("globalFooter").GlobalFooterE(trim(form.entitySSN)))>
		<cfset entityCommit = 1> 
	</cfif>
	
	<cfif IsDefined("form.Language") AND request.Entity.getLanguages() NEQ form.Language>
		<cfset request.Entity.setLanguages(form.Language)>
		<cfset entityCommit = 1> 
	</cfif>
	
	<cfif IsDefined("form.selectMaritalStatus") AND request.Entity.getMaritalStatus() NEQ form.selectMaritalStatus>
		<cfset request.Entity.setMaritalStatus(form.selectMaritalStatus)>
		<cfset entityCommit = 1> 
	<cfelseif IsDefined("form.selectMaritalStatus") AND trim(form.selectMaritalStatus) EQ "">
		<cfset request.Entity.setMaritalStatus("@@")>
		<cfset entityCommit = 1> 
	</cfif>
	
	<cfif IsDefined("form.patientWeight") AND request.Entity.getWeight() NEQ form.patientWeight>
		<cfset request.Entity.setWeight(form.patientWeight)>
		<cfset entityCommit = 1> 
	<cfelseif IsDefined("form.patientWeight") AND trim(form.patientWeight) EQ "">
		<cfset request.Entity.setWeight("@@")>
		<cfset entityCommit = 1> 	
	</cfif>
	
	<cfif IsDefined("form.patientHeightInInches") AND request.Entity.getHeightInInches() NEQ form.patientHeightInInches>
		<cfset request.Entity.setHeightInInches(form.patientHeightInInches)>
		<cfset entityCommit = 1> 
	<cfelseif IsDefined("form.patientHeightInInches") AND trim(form.patientHeightInInches) EQ "">
		<cfset request.Entity.setHeightInInches("@@")>
		<cfset entityCommit = 1> 		
	</cfif>
	
	
	
<!--- EMPLOYER START --->	
	<cfif IsDefined("form.employerName") AND COMPARE(form.employerName, form.HIDDEN_employerName) NEQ 0>
		
		<cfset employerPhone = request.cleanNumericString(form.employerPhoneNumber)>
		<cfset employerPhoneNumber = request.parsePhoneUS(trim(employerPhone),1)> 
		<cfset employerPhoneExtension = request.parsePhoneUS(trim(employerPhone),2)>     
			
		<cfset request.Employer = application.beanFactory.getBean("Employer") />		
		<cfset employerID = request.Employer.addEmployer(SupportEmailAddressID: session.client.getSupportEmailID(), employername: form.employername, AddressTypeID: 13, AddressLine1: form.employerAddressLine1, AddressLine2: form.employerAddressLine2, AddressCity: form.employerAddressCity, AddressStateID: form.employerAddressStateID, AddressZipCode: form.employerAddressZipCode, PhoneTypeID: 74, PhoneNumber: employerPhoneNumber, PhoneExtension: employerPhoneExtension)>
		<cfset request.Entity.setEmployerID(trim(employerID))>
		<cfset entityCommit = 1> 		
	</cfif>
		
	<cfif IsNumeric(form.HIDDEN_employerAddressID)>
		
		<cfset request.Address = application.beanFactory.getBean("old_Address").initAddressIO(trim(form.HIDDEN_employerAddressID))>				
		<cfset request.Address.setAddressLine1('#trim(form.employerAddressLine1)#')> 
		<cfset request.Address.setAddressLine2('#trim(form.employerAddressLine2)#')> 
		<cfset request.Address.setCity('#trim(form.employerAddressCity)#')>  
		<cfset request.Address.setStateID(#trim(form.employerAddressStateID)#)>  
		<cfset request.Address.setZipCode('#trim(form.employerAddressZipCode)#')>
		<cfset request.Address.commit()>
				
	<cfelseif IsNumeric(form.HIDDEN_EmployerID)>
		
		<cfset request.Employer = application.beanFactory.getBean("Employer").initEmployerIO(form.HIDDEN_EmployerID)>	
		<cfset request.Address = application.beanFactory.getBean("old_Address") />
		<cfset request.Address.new(EntityID: trim(request.Employer.getEntityID()), AddressTypeID: 12, AddressLine1: REQUEST.mssqlReplaceSingleQuote(trim(form.employerAddressLine1)), AddressLine2: REQUEST.mssqlReplaceSingleQuote(trim(form.employerAddressLine2)), City: REQUEST.mssqlReplaceSingleQuote(trim(form.employerAddressCity)), StateID: trim(form.employerAddressStateID), ZipCode: REQUEST.mssqlReplaceSingleQuote(trim(form.employerAddressZipCode)))>	
		<cfset employerAddressID = request.Address.commit()>	
		
		<cfif IsDefined("request.Entity") AND IsObject(request.Entity)>
			<cfset request.Entity.bindEntityAddress(clientID: trim(session.clientID), entityID: trim(request.Employer.getEntityID()), addressID: trim(employerAddressID), isDefault: 1)>
		</cfif>
							
	</cfif>	
		
	<cfif IsNumeric(form.HIDDEN_employerPhoneID)>
		
		<cfif trim(form.employerPhoneNumber) GT "">
			<cfset PhoneNumberEncrypted = application.beanFactory.getBean('globalFooter').GlobalFooterE(request.cleanNumericString(trim(form.employerPhoneNumber))) />
		<cfelse>
			<cfset PhoneNumberEncrypted = "NULL">
		</cfif>		
				
		<cfset request.EmployerPhone = application.beanFactory.getBean("Phone").initPhoneIO(trim(form.HIDDEN_employerPhoneID))>				
		<cfset request.EmployerPhone.setPhoneNumber('#trim(PhoneNumberEncrypted)#')> 		
		<cfset request.EmployerPhone.commit()>	
	
	<cfelseif IsNumeric(form.HIDDEN_EmployerID) AND trim(form.employerPhoneNumber) NEQ "">
		
		<cfset PhoneNumberEncrypted = application.beanFactory.getBean('globalFooter').GlobalFooterE(request.cleanNumericString(trim(form.employerPhoneNumber))) />		
		<cfset request.Employer = application.beanFactory.getBean("Employer").initEmployerIO(form.HIDDEN_EmployerID)>	
		<cfset request.EmployerPhone = application.beanFactory.getBean("old_Phone") />	
		<cfset request.EmployerPhone.new(EntityID: trim(request.Employer.getEntityID()), PhoneTypeID: 74, PhoneNumber: '#trim(PhoneNumberEncrypted)#')>	
		<cfset employerPhoneID = request.EmployerPhone.commit()>	
		
		<cfif IsDefined("request.Entity") AND IsObject(request.Entity)>
			<cfset request.Entity.bindEntityPhone(clientID: trim(session.clientID), entityID: trim(request.Employer.getEntityID()), phoneID: trim(employerPhoneID), isDefault: 1)>
		</cfif>
							
	</cfif>
	
<!--- EMPLOYER END --->		

	
	<cfif entityCommit>
		<cfset request.Entity.commit()>
	</cfif>