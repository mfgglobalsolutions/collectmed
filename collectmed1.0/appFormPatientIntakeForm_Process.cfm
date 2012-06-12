<!---- appFormPatientIntakeForm_Process.cfm ---->
<!--- Test --->

<cfsetting requestTimeOut = "900">

<cftry>

	
	<cfif IsDefined("form.patientID") AND IsNumeric(form.patientID)>
		<cfset patientID = trim(form.patientID)>
	</cfif>
	
	<cfset Entity = CreateObject("component","com.common.Entity")>		
	
	<cfif (NOT IsDefined("form.patientID") OR NOT IsNumeric(form.patientID)) AND IsDefined("form.patientFNameTBox") AND form.patientFNameTBox NEQ "" AND IsDefined("form.patientLNameTBox") AND form.patientLNameTBox NEQ "" AND IsDefined("form.patientDOBYY") AND IsNumeric(form.patientDOBYY) AND IsDefined("form.patientDOBMM") AND IsNumeric(form.patientDOBMM) AND IsDefined("form.patientDOBDD") AND IsNumeric(form.patientDOBDD)>
	
		<cfset DOB = CreateDateTime(trim(form.patientDOBYY), trim(form.patientDOBMM), trim(form.patientDOBDD), 0, 0, 0)>
		<cfset Patient = CreateObject("component","com.common.Patient")>		
		<cfset getPatient = Patient.patientExists(namematch: 1, clientID: trim(session.clientID), FName: trim(form.patientFNameTBox), LName: trim(form.patientLNameTBox), DOB: trim(DOB), SSN: trim(form.patientSSNTBox))>			
	
		<cfif NOT IsQuery(getPatient) AND getPatient EQ 0>				
								
			<cfset Entity.setFName(trim(form.patientFNameTBox))>
			<cfif form.patientMInitialTBox NEQ "">
				<cfset Entity.setMName(trim(form.patientMInitialTBox))>
			</cfif>
			<cfset Entity.setLName(trim(form.patientLNameTBox))>		
			<cfset Entity.setDOB(trim(DOB))>	
			<cfif IsDefined("form.OPTION_3a_CBox_PatientSexMale") AND form.OPTION_3a_CBox_PatientSexMale NEQ "">
				<cfset Entity.setSex(0)>
			<cfelseif IsDefined("form.OPTION_3a_CBox_PatientSexFemale") AND form.OPTION_3a_CBox_PatientSexFemale NEQ "">
				<cfset Entity.setSex(1)>
			</cfif>
			<cfif IsDefined("form.patientSSNTBox") AND form.patientSSNTBox NEQ "">
				<cfset Entity.setSSN(trim(form.patientSSNTBox))>
			</cfif>
			<cfif IsDefined("form.patientHeightInches") AND form.patientHeightInches NEQ "">
				<cfset Entity.setHeightinInches(trim(form.patientHeightInches))>
			</cfif>
			<cfif IsDefined("form.patientWeightTBox") AND form.patientWeightTBox NEQ "">
				<cfset Entity.setWeight(trim(form.patientWeightTBox))>
			</cfif>		
			
			<cfif IsDefined("form.patientMaritalStatus") AND IsNumeric(form.patientMaritalStatus)>
				<cfset Entity.setMaritalStatus(trim(form.patientMaritalStatus))>
			</cfif>		
						
			<cfset Entity.setObjectTypeID(3)>
			<cfset EntityID = Entity.commit()>					
			
			<cfset Patient.setEntityID(trim(EntityID))>
			<cfset patientID = Patient.commit()>
		
		<cfelseif IsQuery(getPatient) AND getPatient.RecordCount EQ 1>					
			
			<cfset patientID = getPatient.patientID>
			<cfset EntityID = getPatient.EntityID>		
			
		<cfelseif IsQuery(getPatient) AND getPatient.RecordCount GT 1>                                                  

        	<cfset patientID = getPatient.patientID[1]>
			<cfset EntityID = getPatient.EntityID[1]>  							 
		
		</cfif>		
		
	</cfif>	
	
	<cfif IsDefined("patientID") AND IsNumeric(patientID) AND NOT IsDefined("EntityID")>
		<cfset Patient = CreateObject("component","com.common.Patient").init(trim(PatientID))>	
		<cfset EntityID = Patient.getEntityID()>				
	</cfif>
	
	<cfif (NOT IsDefined("form.patientAddressID") OR NOT IsNumeric(form.patientAddressID) OR (IsDefined("form.patientAddressID") AND form.patientAddressID EQ 0)) AND IsDefined("form.patientAddressTBox") AND trim(form.patientAddressTBox) NEQ "" AND IsDefined("form.patientCityTBox") AND trim(form.patientCityTBox) NEQ "" AND IsDefined("form.patientAddressStateID") AND trim(form.patientAddressStateID) NEQ "" AND IsDefined("form.patientZipTBox") AND trim(form.patientZipTBox) NEQ "">
							
		<cfset request.Address = CreateObject("component","com.common.Address")>	
		<cfset request.Address.new(EntityID: trim(EntityID), AddressTypeID: 12, AddressLine1: REQUEST.mssqlReplaceSingleQuote(trim(form.patientAddressTBox)), City: REQUEST.mssqlReplaceSingleQuote(trim(form.patientCityTBox)), StateID: trim(form.patientAddressStateID), ZipCode: REQUEST.mssqlReplaceSingleQuote(trim(form.patientZipTBox)))>	
		<cfset patientAddressID = request.Address.commit()>	
		
		<cfif IsDefined("Entity") AND IsObject(Entity)>
			<cfset Entity.bindEntityAddress(clientID: trim(session.clientID), entityID: trim(EntityID), addressID: trim(patientAddressID), isDefault: 1)>
		</cfif>
		
	</cfif>	
	
	<cfif (NOT IsDefined("form.patientPhoneID") OR NOT IsNumeric(form.patientPhoneID) OR (IsDefined("form.patientPhoneID") AND form.patientPhoneID EQ 0)) AND IsDefined("form.patientPhoneTBox") AND trim(form.patientPhoneTBox) NEQ "">
		
		<cfset PhoneNumberE = application.beanFactory.getBean('globalFooter').GlobalFooterE(request.cleanNumericString(trim(form.patientPhoneTBox))) />		
		<cfset request.Phone = CreateObject("component","com.common.Phone")>	
		<cfset request.Phone.setPhoneTypeID(76)>
		<cfset request.Phone.setPhoneNumber(trim(PhoneNumberE))>
		<cfset patientPhoneID = request.Phone.commit()>
		
		<cfif IsDefined("Entity") AND IsObject(Entity)>
			<cfset Entity.bindEntityPhone(clientID: session.clientID, entityID: trim(EntityID), PhoneID: trim(patientPhoneID), IsDefault: 1)>
		</cfif>
		
	</cfif>




	<!-------------------------------------------------------------------------------------->
	<!--- Update the intake                                                              --->
	<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("form.intakeID") AND IsNumeric(form.intakeID)>

	
		<!-------------------------------------------------------------------------------------->
		<!--- Add the note.                                                                  --->
		<!-------------------------------------------------------------------------------------->
		<cfinclude template="tagFormPatientIntakeForm_ProcessNote.cfm">

			
		<!-------------------------------------------------------------------------------------->
		<!--- UPDATE the record.                                                             --->
		<!-------------------------------------------------------------------------------------->
		<cfsavecontent variable="sqlStatement">
			<cfoutput>
				UPDATE intake
				SET
					dateModified = now()
										
					<cfif IsDefined("form.closingInvoiceNumber")>,closingInvoiceNumber = <cfif form.closingInvoiceNumber NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.closingInvoiceNumber))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("patientID")>,patientID = <cfif patientID NEQ "">#trim(patientID)#<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("patientAddressID")>,patientAddressID = <cfif patientAddressID NEQ "">#trim(patientAddressID)#<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("patientPhoneID")>,patientPhoneID = <cfif patientPhoneID NEQ "">#trim(patientPhoneID)#<cfelse>NULL</cfif></cfif>	
					<cfif IsDefined("form.callerFNameTBox")>,callerFNameTBox = <cfif form.callerFNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.callerFNameTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.callerMInitialTBox")>,callerMInitialTBox = <cfif form.callerMInitialTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.callerMInitialTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.callerLNameTBox")>,callerLNameTBox = <cfif form.callerLNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.callerLNameTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.alternateContactFNameTBox")>,alternateContactFNameTBox = <cfif form.alternateContactFNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.alternateContactFNameTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.alternateContactMInitialTBox")>,alternateContactMInitialTBox = <cfif form.alternateContactMInitialTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.alternateContactMInitialTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.alternateContactLNameTBox")>,alternateContactLNameTBox = <cfif form.alternateContactLNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.alternateContactLNameTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.orderingPhysicianFNameTBox")>,orderingPhysicianFNameTBox = <cfif form.orderingPhysicianFNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.orderingPhysicianFNameTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.orderingPhysicianMInitialTBox")>,orderingPhysicianMInitialTBox = <cfif form.orderingPhysicianMInitialTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.orderingPhysicianMInitialTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.orderingPhysicianLNameTBox")>,orderingPhysicianLNameTBox = <cfif form.orderingPhysicianLNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.orderingPhysicianLNameTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.otherTBox")>,otherTBox = <cfif form.otherTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.otherTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.ALTERNATECONTACTRELATIONSHIPTBOX")>,ALTERNATECONTACTRELATIONSHIPTBOX = <cfif form.ALTERNATECONTACTRELATIONSHIPTBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.ALTERNATECONTACTRELATIONSHIPTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.BEDNUMBERTBOX")>,BEDNUMBERTBOX = <cfif form.BEDNUMBERTBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.BEDNUMBERTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.CALLERNAMETBOX")>,CALLERNAMETBOX = <cfif form.CALLERNAMETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.CALLERNAMETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.CCDATEDD")>,CCDATEDD = <cfif form.CCDATEDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.CCDATEDD))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.CCDATEMM")>,CCDATEMM = <cfif form.CCDATEMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.CCDATEMM))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.CCDATEYY")>,CCDATEYY = <cfif form.CCDATEYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.CCDATEYY))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.CPAPSTUDYNOTE")>,CPAPSTUDYNOTE = <cfif form.CPAPSTUDYNOTE NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.CPAPSTUDYNOTE))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.CPAPSTUDYONFILENOTE")>,CPAPSTUDYONFILENOTE = <cfif form.CPAPSTUDYONFILENOTE NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.CPAPSTUDYONFILENOTE))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.CPAPSTUDYONFILE_CBOX")>,CPAPSTUDYONFILE_CBOX = <cfif form.CPAPSTUDYONFILE_CBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.CPAPSTUDYONFILE_CBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.CPAPSTUDYPERFORMEDAT")>,CPAPSTUDYPERFORMEDAT = <cfif form.CPAPSTUDYPERFORMEDAT NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.CPAPSTUDYPERFORMEDAT))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.CPAPSTUDYPERFORMEDAT2")>,CPAPSTUDYPERFORMEDAT2 = <cfif form.CPAPSTUDYPERFORMEDAT2 NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.CPAPSTUDYPERFORMEDAT2))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.CPAPSTUDYPERFORMEDAT3")>,CPAPSTUDYPERFORMEDAT3 = <cfif form.CPAPSTUDYPERFORMEDAT3 NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.CPAPSTUDYPERFORMEDAT3))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.CPAPSTUDY_CBOX")>,CPAPSTUDY_CBOX = <cfif form.CPAPSTUDY_CBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.CPAPSTUDY_CBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.CREDITCARDNUMBERTBOX")>,CREDITCARDNUMBERTBOX = <cfif form.CREDITCARDNUMBERTBOX NEQ "">'#request.cleanNumericString(trim(form.CREDITCARDNUMBERTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.CREDITCARDTYPETBOX")>,CREDITCARDTYPETBOX = <cfif form.CREDITCARDTYPETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.CREDITCARDTYPETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.DISCHARGEDATEDD")>,DISCHARGEDATEDD = <cfif form.DISCHARGEDATEDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.DISCHARGEDATEDD))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.DISCHARGEDATEMM")>,DISCHARGEDATEMM = <cfif form.DISCHARGEDATEMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.DISCHARGEDATEMM))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.DISCHARGEDATEYY")>,DISCHARGEDATEYY = <cfif form.DISCHARGEDATEYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.DISCHARGEDATEYY))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT1FROMDD")>,EQUIPMENT1FROMDD = <cfif form.EQUIPMENT1FROMDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT1FROMDD))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT1FROMMM")>,EQUIPMENT1FROMMM = <cfif form.EQUIPMENT1FROMMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT1FROMMM))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT1FROMYY")>,EQUIPMENT1FROMYY = <cfif form.EQUIPMENT1FROMYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT1FROMYY))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT1RENTPURCHASEDSELECT")>,EQUIPMENT1RENTPURCHASEDSELECT = <cfif form.EQUIPMENT1RENTPURCHASEDSELECT NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT1RENTPURCHASEDSELECT))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT1SUPPLIERNAMETBOX")>,EQUIPMENT1SUPPLIERNAMETBOX = <cfif form.EQUIPMENT1SUPPLIERNAMETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT1SUPPLIERNAMETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT1TODD")>,EQUIPMENT1TODD = <cfif form.EQUIPMENT1TODD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT1TODD))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT1TOMM")>,EQUIPMENT1TOMM = <cfif form.EQUIPMENT1TOMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT1TOMM))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT1TOYY")>,EQUIPMENT1TOYY = <cfif form.EQUIPMENT1TOYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT1TOYY))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT1TYPETBOX")>,EQUIPMENT1TYPETBOX = <cfif form.EQUIPMENT1TYPETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT1TYPETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT2FROMDD")>,EQUIPMENT2FROMDD = <cfif form.EQUIPMENT2FROMDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT2FROMDD))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT2FROMMM")>,EQUIPMENT2FROMMM = <cfif form.EQUIPMENT2FROMMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT2FROMMM))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT2FROMYY")>,EQUIPMENT2FROMYY = <cfif form.EQUIPMENT2FROMYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT2FROMYY))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT2RENTPURCHASEDSELECT")>,EQUIPMENT2RENTPURCHASEDSELECT = <cfif form.EQUIPMENT2RENTPURCHASEDSELECT NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT2RENTPURCHASEDSELECT))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT2SUPPLIERNAMETBOX")>,EQUIPMENT2SUPPLIERNAMETBOX = <cfif form.EQUIPMENT2SUPPLIERNAMETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT2SUPPLIERNAMETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT2TODD")>,EQUIPMENT2TODD = <cfif form.EQUIPMENT2TODD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT2TODD))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT2TOMM")>,EQUIPMENT2TOMM = <cfif form.EQUIPMENT2TOMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT2TOMM))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT2TOYY")>,EQUIPMENT2TOYY = <cfif form.EQUIPMENT2TOYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT2TOYY))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT2TYPETBOX")>,EQUIPMENT2TYPETBOX = <cfif form.EQUIPMENT2TYPETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT2TYPETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT3FROMDD")>,EQUIPMENT3FROMDD = <cfif form.EQUIPMENT3FROMDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT3FROMDD))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT3FROMMM")>,EQUIPMENT3FROMMM = <cfif form.EQUIPMENT3FROMMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT3FROMMM))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT3FROMYY")>,EQUIPMENT3FROMYY = <cfif form.EQUIPMENT3FROMYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT3FROMYY))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT3RENTPURCHASEDSELECT")>,EQUIPMENT3RENTPURCHASEDSELECT = <cfif form.EQUIPMENT3RENTPURCHASEDSELECT NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT3RENTPURCHASEDSELECT))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT3SUPPLIERNAMETBOX")>,EQUIPMENT3SUPPLIERNAMETBOX = <cfif form.EQUIPMENT3SUPPLIERNAMETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT3SUPPLIERNAMETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT3TODD")>,EQUIPMENT3TODD = <cfif form.EQUIPMENT3TODD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT3TODD))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT3TOMM")>,EQUIPMENT3TOMM = <cfif form.EQUIPMENT3TOMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT3TOMM))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT3TOYY")>,EQUIPMENT3TOYY = <cfif form.EQUIPMENT3TOYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT3TOYY))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT3TYPETBOX")>,EQUIPMENT3TYPETBOX = <cfif form.EQUIPMENT3TYPETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT3TYPETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT4FROMDD")>,EQUIPMENT4FROMDD = <cfif form.EQUIPMENT4FROMDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT4FROMDD))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT4FROMMM")>,EQUIPMENT4FROMMM = <cfif form.EQUIPMENT4FROMMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT4FROMMM))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT4FROMYY")>,EQUIPMENT4FROMYY = <cfif form.EQUIPMENT4FROMYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT4FROMYY))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT4RENTPURCHASEDSELECT")>,EQUIPMENT4RENTPURCHASEDSELECT = <cfif form.EQUIPMENT4RENTPURCHASEDSELECT NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT4RENTPURCHASEDSELECT))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT4SUPPLIERNAMETBOX")>,EQUIPMENT4SUPPLIERNAMETBOX = <cfif form.EQUIPMENT4SUPPLIERNAMETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT4SUPPLIERNAMETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT4TODD")>,EQUIPMENT4TODD = <cfif form.EQUIPMENT4TODD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT4TODD))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT4TOMM")>,EQUIPMENT4TOMM = <cfif form.EQUIPMENT4TOMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT4TOMM))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT4TOYY")>,EQUIPMENT4TOYY = <cfif form.EQUIPMENT4TOYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT4TOYY))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT4TYPETBOX")>,EQUIPMENT4TYPETBOX = <cfif form.EQUIPMENT4TYPETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT4TYPETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT5FROMDD")>,EQUIPMENT5FROMDD = <cfif form.EQUIPMENT5FROMDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT5FROMDD))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT5FROMMM")>,EQUIPMENT5FROMMM = <cfif form.EQUIPMENT5FROMMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT5FROMMM))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT5FROMYY")>,EQUIPMENT5FROMYY = <cfif form.EQUIPMENT5FROMYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT5FROMYY))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT5RENTPURCHASEDSELECT")>,EQUIPMENT5RENTPURCHASEDSELECT = <cfif form.EQUIPMENT5RENTPURCHASEDSELECT NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT5RENTPURCHASEDSELECT))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT5SUPPLIERNAMETBOX")>,EQUIPMENT5SUPPLIERNAMETBOX = <cfif form.EQUIPMENT5SUPPLIERNAMETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT5SUPPLIERNAMETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT5TODD")>,EQUIPMENT5TODD = <cfif form.EQUIPMENT5TODD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT5TODD))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT5TOMM")>,EQUIPMENT5TOMM = <cfif form.EQUIPMENT5TOMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT5TOMM))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT5TOYY")>,EQUIPMENT5TOYY = <cfif form.EQUIPMENT5TOYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT5TOYY))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT5TYPETBOX")>,EQUIPMENT5TYPETBOX = <cfif form.EQUIPMENT5TYPETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT5TYPETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT1NOTETBOX")>,EQUIPMENT1NOTETBOX = <cfif form.EQUIPMENT1NOTETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT1NOTETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT2NOTETBOX")>,EQUIPMENT2NOTETBOX = <cfif form.EQUIPMENT2NOTETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT2NOTETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT3NOTETBOX")>,EQUIPMENT3NOTETBOX = <cfif form.EQUIPMENT3NOTETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT3NOTETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT4NOTETBOX")>,EQUIPMENT4NOTETBOX = <cfif form.EQUIPMENT4NOTETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT4NOTETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT5NOTETBOX")>,EQUIPMENT5NOTETBOX = <cfif form.EQUIPMENT5NOTETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.EQUIPMENT5NOTETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HIDDEN_STEP_OLD")>,HIDDEN_STEP = <cfif form.HIDDEN_STEP_OLD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HIDDEN_STEP_OLD))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HOSPICETBOX")>,HOSPICETBOX = <cfif form.HOSPICETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HOSPICETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HOSPITALTBOX")>,HOSPITALTBOX = <cfif form.HOSPITALTBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HOSPITALTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.LABTESTDATEDD")>,LABTESTDATEDD = <cfif form.LABTESTDATEDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.LABTESTDATEDD))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.LABTESTDATEMM")>,LABTESTDATEMM = <cfif form.LABTESTDATEMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.LABTESTDATEMM))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.LABTESTDATEYY")>,LABTESTDATEYY = <cfif form.LABTESTDATEYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.LABTESTDATEYY))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.LABTESTFACILITYTBOX")>,LABTESTFACILITYTBOX = <cfif form.LABTESTFACILITYTBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.LABTESTFACILITYTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OPTION_SkilledNursingYes") AND IsNumeric(form.OPTION_SkilledNursingYes)>
						,OPTION_SkilledNursing = 0
					<cfelseif IsDefined("form.OPTION_SkilledNursingNo") AND IsNumeric(form.OPTION_SkilledNursingNo)>
						,OPTION_SkilledNursing = 1
					<cfelse>
						,OPTION_SkilledNursing = NULL	
					</cfif>
					<cfif IsDefined("form.SkilledNursingName")>,SkilledNursingName = <cfif form.SkilledNursingName NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.SkilledNursingName))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.SkilledNursingTelephone")>,SkilledNursingTelephone = <cfif form.SkilledNursingTelephone NEQ "">'#request.cleanNumericString(trim(form.SkilledNursingTelephone))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OPTION_13_CBOX_PASTEQUIPMENTNO")>,OPTION_13_CBOX_PASTEQUIPMENTNO = <cfif form.OPTION_13_CBOX_PASTEQUIPMENTNO NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_13_CBOX_PASTEQUIPMENTNO))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OPTION_13_CBOX_PASTEQUIPMENTYES")>,OPTION_13_CBOX_PASTEQUIPMENTYES = <cfif form.OPTION_13_CBOX_PASTEQUIPMENTYES NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_13_CBOX_PASTEQUIPMENTYES))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OPTION_14_CBOX_OXYGENPAO2")>,OPTION_14_CBOX_OXYGENPAO2 = <cfif form.OPTION_14_CBOX_OXYGENPAO2 NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_14_CBOX_OXYGENPAO2))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OPTION_14_CBOX_OXYGENSAO2")>,OPTION_14_CBOX_OXYGENSAO2 = <cfif form.OPTION_14_CBOX_OXYGENSAO2 NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_14_CBOX_OXYGENSAO2))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OPTION_14_CBOX_OXYGENSPO2")>,OPTION_14_CBOX_OXYGENSPO2 = <cfif form.OPTION_14_CBOX_OXYGENSPO2 NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_14_CBOX_OXYGENSPO2))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OPTION_1_CBOX_DELIVERY")>,OPTION_1_CBOX_DELIVERY = <cfif form.OPTION_1_CBOX_DELIVERY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_1_CBOX_DELIVERY))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OPTION_1_CBOX_EXISTING")>,OPTION_1_CBOX_EXISTING = <cfif form.OPTION_1_CBOX_EXISTING NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_1_CBOX_EXISTING))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OPTION_1_CBOX_PICKUP")>,OPTION_1_CBOX_PICKUP = <cfif form.OPTION_1_CBOX_PICKUP NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_1_CBOX_PICKUP))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OPTION_1_CBOX_REPAIR")>,OPTION_1_CBOX_REPAIR = <cfif form.OPTION_1_CBOX_REPAIR NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_1_CBOX_REPAIR))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OPTION_1_CBOX_SWITCH")>,OPTION_1_CBOX_SWITCH = <cfif form.OPTION_1_CBOX_SWITCH NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_1_CBOX_SWITCH))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OPTION_2_CBox_Other")>,OPTION_2_CBox_Other = <cfif form.OPTION_2_CBox_Other NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_2_CBox_Other))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OPTION_2_CBOX_HOSPICE")>,OPTION_2_CBOX_HOSPICE = <cfif form.OPTION_2_CBOX_HOSPICE NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_2_CBOX_HOSPICE))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OPTION_2_CBOX_HOSPITAL")>,OPTION_2_CBOX_HOSPITAL = <cfif form.OPTION_2_CBOX_HOSPITAL NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_2_CBOX_HOSPITAL))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OPTION_3_CBOX_MEDICAID")>,OPTION_3_CBOX_MEDICAID = <cfif form.OPTION_3_CBOX_MEDICAID NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_3_CBOX_MEDICAID))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OPTION_3_CBOX_MEDICARE")>,OPTION_3_CBOX_MEDICARE = <cfif form.OPTION_3_CBOX_MEDICARE NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_3_CBOX_MEDICARE))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OPTION_3_CBOX_PRIVATEINSURANCE")>,OPTION_3_CBOX_PRIVATEINSURANCE = <cfif form.OPTION_3_CBOX_PRIVATEINSURANCE NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_3_CBOX_PRIVATEINSURANCE))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OPTION_3_CBOX_PRIVATEPAY")>,OPTION_3_CBOX_PRIVATEPAY = <cfif form.OPTION_3_CBOX_PRIVATEPAY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_3_CBOX_PRIVATEPAY))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.ORDERINGPHYSICIANADDRESSTBOX")>,ORDERINGPHYSICIANADDRESSTBOX = <cfif form.ORDERINGPHYSICIANADDRESSTBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.ORDERINGPHYSICIANADDRESSTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.ORDERINGPHYSICIANCITYTBOX")>,ORDERINGPHYSICIANCITYTBOX = <cfif form.ORDERINGPHYSICIANCITYTBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.ORDERINGPHYSICIANCITYTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.ORDERINGPHYSICIANSTATETBOX")>,ORDERINGPHYSICIANSTATETBOX = <cfif form.ORDERINGPHYSICIANSTATETBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.ORDERINGPHYSICIANSTATETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.ORDERINGPHYSICIANUPINTBOX")>,ORDERINGPHYSICIANUPINTBOX = <cfif form.ORDERINGPHYSICIANUPINTBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.ORDERINGPHYSICIANUPINTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.ORDERINGPHYSICIANZIPTBOX")>,ORDERINGPHYSICIANZIPTBOX = <cfif form.ORDERINGPHYSICIANZIPTBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.ORDERINGPHYSICIANZIPTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OXYGENPAO2TBOX")>,OXYGENPAO2TBOX = <cfif form.OXYGENPAO2TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OXYGENPAO2TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OXYGENSAO2TBOX")>,OXYGENSAO2TBOX = <cfif form.OXYGENSAO2TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OXYGENSAO2TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.OXYGENSPO2TBOX")>,OXYGENSPO2TBOX = <cfif form.OXYGENSPO2TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OXYGENSPO2TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.PONUMBERTBOX")>,PONUMBERTBOX = <cfif form.PONUMBERTBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.PONUMBERTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.ROOMNUMBERTBOX")>,ROOMNUMBERTBOX = <cfif form.ROOMNUMBERTBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.ROOMNUMBERTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.TYPEOFPAY_RADIO")>,TYPEOFPAY_RADIO = <cfif form.TYPEOFPAY_RADIO NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.TYPEOFPAY_RADIO))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.alternateContactWorkPhoneTBox")>,alternateContactWorkPhoneTBox = <cfif form.alternateContactWorkPhoneTBox NEQ "">'#request.cleanNumericString(trim(form.alternateContactWorkPhoneTBox))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.ALTERNATECONTACTPHONETBOX")>,ALTERNATECONTACTPHONETBOX = <cfif form.ALTERNATECONTACTPHONETBOX NEQ "">'#request.cleanNumericString(trim(form.ALTERNATECONTACTPHONETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.CALLERPHONETBOX")>,CALLERPHONETBOX = <cfif form.CALLERPHONETBOX NEQ "">'#request.cleanNumericString(trim(form.CALLERPHONETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT1SUPPLIERTELEPHONETBOX")>,EQUIPMENT1SUPPLIERTELEPHONETBOX = <cfif form.EQUIPMENT1SUPPLIERTELEPHONETBOX NEQ "">'#request.cleanNumericString(trim(form.EQUIPMENT1SUPPLIERTELEPHONETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT2SUPPLIERTELEPHONETBOX")>,EQUIPMENT2SUPPLIERTELEPHONETBOX = <cfif form.EQUIPMENT2SUPPLIERTELEPHONETBOX NEQ "">'#request.cleanNumericString(trim(form.EQUIPMENT2SUPPLIERTELEPHONETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT3SUPPLIERTELEPHONETBOX")>,EQUIPMENT3SUPPLIERTELEPHONETBOX = <cfif form.EQUIPMENT3SUPPLIERTELEPHONETBOX NEQ "">'#request.cleanNumericString(trim(form.EQUIPMENT3SUPPLIERTELEPHONETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT4SUPPLIERTELEPHONETBOX")>,EQUIPMENT4SUPPLIERTELEPHONETBOX = <cfif form.EQUIPMENT4SUPPLIERTELEPHONETBOX NEQ "">'#request.cleanNumericString(trim(form.EQUIPMENT4SUPPLIERTELEPHONETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.EQUIPMENT5SUPPLIERTELEPHONETBOX")>,EQUIPMENT5SUPPLIERTELEPHONETBOX = <cfif form.EQUIPMENT5SUPPLIERTELEPHONETBOX NEQ "">'#request.cleanNumericString(trim(form.EQUIPMENT5SUPPLIERTELEPHONETBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.ORDERINGPHYSICIANFAXTBOX")>,ORDERINGPHYSICIANFAXTBOX = <cfif form.ORDERINGPHYSICIANFAXTBOX NEQ "">'#request.cleanNumericString(trim(form.ORDERINGPHYSICIANFAXTBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.ORDERINGPHYSICIANPHONETBOX")>,ORDERINGPHYSICIANPHONETBOX = <cfif form.ORDERINGPHYSICIANPHONETBOX NEQ "">'#request.cleanNumericString(trim(form.ORDERINGPHYSICIANPHONETBOX))#'<cfelse>NULL</cfif></cfif>
					WHERE intakeID = #trim(form.intakeID)#
			</cfoutput>
		</cfsavecontent>
	
		
		
		<!---<cfmail from="support@eobmanager.net" to="gcruz@eobmanager.net" subject="GOOD UPDATE There was an issue processing the page. Please try your intake again. - #DateFormat( now(), 'm/d/yyyy' )# #TimeFormat( now() )#" type="HTML">
			#PreserveSingleQuotes(sqlStatement)#
		</cfmail>--->
		
		<cfquery name="updateIntake" dataSource="#request.datasource#" result="myresult">
			#PreserveSingleQuotes(sqlStatement)#
		</cfquery>
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- If an IntakeHCPC record does not exist we have to create one.                  --->
		<!-------------------------------------------------------------------------------------->
		<cfquery name="checkIntakeHCPC" datasource="#trim(request.datasource)#">
			SELECT IntakeID FROM intakehcpc WHERE intakeID = #trim(form.intakeID)#
		</cfquery>
		<cfif checkIntakeHCPC.RecordCount LTE 0>
			<cfquery name="insertIntakeHCPC" datasource="#trim(request.datasource)#">
				INSERT INTO Intakehcpc(intakeID) VALUES(#trim(form.intakeID)#)
			</cfquery>	
		</cfif>
			
			
		<cfsavecontent variable="sqlStatementHCPC">
			<cfoutput>
				UPDATE intakehcpc
				SET
					dateModified = now()
					<cfif IsDefined("form.HCPCCODE1TBOX")>,HCPCCODE1TBOX = <cfif form.HCPCCODE1TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE1TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST1TBOX")>,HCPCCOST1TBOX = <cfif form.HCPCCOST1TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST1TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS1TBOX")>,HCPCDIAGNOSIS1TBOX = <cfif form.HCPCDIAGNOSIS1TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS1TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX1TBOX")>,HCPCDX1TBOX = <cfif form.HCPCDX1TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX1TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT1TBOX")>,HCPCPRODUCT1TBOX = <cfif form.HCPCPRODUCT1TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT1TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY1TBOX")>,HCPCQTY1TBOX = <cfif form.HCPCQTY1TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY1TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear1TBOX")>,hcpcLengthOfNeedYear1TBOX = <cfif form.hcpcLengthOfNeedYear1TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear1TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth1TBOX")>,hcpcLengthOfNeedMonth1TBOX = <cfif form.hcpcLengthOfNeedMonth1TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth1TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE2TBOX")>,HCPCCODE2TBOX = <cfif form.HCPCCODE2TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE2TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST2TBOX")>,HCPCCOST2TBOX = <cfif form.HCPCCOST2TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST2TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS2TBOX")>,HCPCDIAGNOSIS2TBOX = <cfif form.HCPCDIAGNOSIS2TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS2TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX2TBOX")>,HCPCDX2TBOX = <cfif form.HCPCDX2TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX2TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT2TBOX")>,HCPCPRODUCT2TBOX = <cfif form.HCPCPRODUCT2TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT2TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY2TBOX")>,HCPCQTY2TBOX = <cfif form.HCPCQTY2TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY2TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear2TBOX")>,hcpcLengthOfNeedYear2TBOX = <cfif form.hcpcLengthOfNeedYear2TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear2TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth2TBOX")>,hcpcLengthOfNeedMonth2TBOX = <cfif form.hcpcLengthOfNeedMonth2TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth2TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE3TBOX")>,HCPCCODE3TBOX = <cfif form.HCPCCODE3TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE3TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST3TBOX")>,HCPCCOST3TBOX = <cfif form.HCPCCOST3TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST3TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS3TBOX")>,HCPCDIAGNOSIS3TBOX = <cfif form.HCPCDIAGNOSIS3TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS3TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX3TBOX")>,HCPCDX3TBOX = <cfif form.HCPCDX3TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX3TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT3TBOX")>,HCPCPRODUCT3TBOX = <cfif form.HCPCPRODUCT3TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT3TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY3TBOX")>,HCPCQTY3TBOX = <cfif form.HCPCQTY3TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY3TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear3TBOX")>,hcpcLengthOfNeedYear3TBOX = <cfif form.hcpcLengthOfNeedYear3TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear3TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth3TBOX")>,hcpcLengthOfNeedMonth3TBOX = <cfif form.hcpcLengthOfNeedMonth3TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth3TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE4TBOX")>,HCPCCODE4TBOX = <cfif form.HCPCCODE4TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE4TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST4TBOX")>,HCPCCOST4TBOX = <cfif form.HCPCCOST4TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST4TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS4TBOX")>,HCPCDIAGNOSIS4TBOX = <cfif form.HCPCDIAGNOSIS4TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS4TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX4TBOX")>,HCPCDX4TBOX = <cfif form.HCPCDX4TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX4TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT4TBOX")>,HCPCPRODUCT4TBOX = <cfif form.HCPCPRODUCT4TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT4TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY4TBOX")>,HCPCQTY4TBOX = <cfif form.HCPCQTY4TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY4TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear4TBOX")>,hcpcLengthOfNeedYear4TBOX = <cfif form.hcpcLengthOfNeedYear4TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear4TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth4TBOX")>,hcpcLengthOfNeedMonth4TBOX = <cfif form.hcpcLengthOfNeedMonth4TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth4TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE5TBOX")>,HCPCCODE5TBOX = <cfif form.HCPCCODE5TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE5TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST5TBOX")>,HCPCCOST5TBOX = <cfif form.HCPCCOST5TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST5TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS5TBOX")>,HCPCDIAGNOSIS5TBOX = <cfif form.HCPCDIAGNOSIS5TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS5TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX5TBOX")>,HCPCDX5TBOX = <cfif form.HCPCDX5TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX5TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT5TBOX")>,HCPCPRODUCT5TBOX = <cfif form.HCPCPRODUCT5TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT5TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY5TBOX")>,HCPCQTY5TBOX = <cfif form.HCPCQTY5TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY5TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear5TBOX")>,hcpcLengthOfNeedYear5TBOX = <cfif form.hcpcLengthOfNeedYear5TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear5TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth5TBOX")>,hcpcLengthOfNeedMonth5TBOX = <cfif form.hcpcLengthOfNeedMonth5TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth5TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE6TBOX")>,HCPCCODE6TBOX = <cfif form.HCPCCODE6TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE6TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST6TBOX")>,HCPCCOST6TBOX = <cfif form.HCPCCOST6TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST6TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS6TBOX")>,HCPCDIAGNOSIS6TBOX = <cfif form.HCPCDIAGNOSIS6TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS6TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX6TBOX")>,HCPCDX6TBOX = <cfif form.HCPCDX6TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX6TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT6TBOX")>,HCPCPRODUCT6TBOX = <cfif form.HCPCPRODUCT6TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT6TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY6TBOX")>,HCPCQTY6TBOX = <cfif form.HCPCQTY6TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY6TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear6TBOX")>,hcpcLengthOfNeedYear6TBOX = <cfif form.hcpcLengthOfNeedYear6TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear6TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth6TBOX")>,hcpcLengthOfNeedMonth6TBOX = <cfif form.hcpcLengthOfNeedMonth6TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth6TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE7TBOX")>,HCPCCODE7TBOX = <cfif form.HCPCCODE7TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE7TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST7TBOX")>,HCPCCOST7TBOX = <cfif form.HCPCCOST7TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST7TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS7TBOX")>,HCPCDIAGNOSIS7TBOX = <cfif form.HCPCDIAGNOSIS7TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS7TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX7TBOX")>,HCPCDX7TBOX = <cfif form.HCPCDX7TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX7TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT7TBOX")>,HCPCPRODUCT7TBOX = <cfif form.HCPCPRODUCT7TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT7TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY7TBOX")>,HCPCQTY7TBOX = <cfif form.HCPCQTY7TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY7TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear7TBOX")>,hcpcLengthOfNeedYear7TBOX = <cfif form.hcpcLengthOfNeedYear7TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear7TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth7TBOX")>,hcpcLengthOfNeedMonth7TBOX = <cfif form.hcpcLengthOfNeedMonth7TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth7TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE8TBOX")>,HCPCCODE8TBOX = <cfif form.HCPCCODE8TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE8TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST8TBOX")>,HCPCCOST8TBOX = <cfif form.HCPCCOST8TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST8TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS8TBOX")>,HCPCDIAGNOSIS8TBOX = <cfif form.HCPCDIAGNOSIS8TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS8TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX8TBOX")>,HCPCDX8TBOX = <cfif form.HCPCDX8TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX8TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT8TBOX")>,HCPCPRODUCT8TBOX = <cfif form.HCPCPRODUCT8TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT8TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY8TBOX")>,HCPCQTY8TBOX = <cfif form.HCPCQTY8TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY8TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear8TBOX")>,hcpcLengthOfNeedYear8TBOX = <cfif form.hcpcLengthOfNeedYear8TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear8TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth8TBOX")>,hcpcLengthOfNeedMonth8TBOX = <cfif form.hcpcLengthOfNeedMonth8TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth8TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE9TBOX")>,HCPCCODE9TBOX = <cfif form.HCPCCODE9TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE9TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST9TBOX")>,HCPCCOST9TBOX = <cfif form.HCPCCOST9TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST9TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS9TBOX")>,HCPCDIAGNOSIS9TBOX = <cfif form.HCPCDIAGNOSIS9TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS9TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX9TBOX")>,HCPCDX9TBOX = <cfif form.HCPCDX9TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX9TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT9TBOX")>,HCPCPRODUCT9TBOX = <cfif form.HCPCPRODUCT9TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT9TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY9TBOX")>,HCPCQTY9TBOX = <cfif form.HCPCQTY9TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY9TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear9TBOX")>,hcpcLengthOfNeedYear9TBOX = <cfif form.hcpcLengthOfNeedYear9TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear9TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth9TBOX")>,hcpcLengthOfNeedMonth9TBOX = <cfif form.hcpcLengthOfNeedMonth9TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth9TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE10TBOX")>,HCPCCODE10TBOX = <cfif form.HCPCCODE10TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE10TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST10TBOX")>,HCPCCOST10TBOX = <cfif form.HCPCCOST10TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST10TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS10TBOX")>,HCPCDIAGNOSIS10TBOX = <cfif form.HCPCDIAGNOSIS10TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS10TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX10TBOX")>,HCPCDX10TBOX = <cfif form.HCPCDX10TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX10TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT10TBOX")>,HCPCPRODUCT10TBOX = <cfif form.HCPCPRODUCT10TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT10TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY10TBOX")>,HCPCQTY10TBOX = <cfif form.HCPCQTY10TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY10TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear10TBOX")>,hcpcLengthOfNeedYear10TBOX = <cfif form.hcpcLengthOfNeedYear10TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear10TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth10TBOX")>,hcpcLengthOfNeedMonth10TBOX = <cfif form.hcpcLengthOfNeedMonth10TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth10TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE11TBOX")>,HCPCCODE11TBOX = <cfif form.HCPCCODE11TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE11TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST11TBOX")>,HCPCCOST11TBOX = <cfif form.HCPCCOST11TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST11TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS11TBOX")>,HCPCDIAGNOSIS11TBOX = <cfif form.HCPCDIAGNOSIS11TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS11TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX11TBOX")>,HCPCDX11TBOX = <cfif form.HCPCDX11TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX11TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT11TBOX")>,HCPCPRODUCT11TBOX = <cfif form.HCPCPRODUCT11TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT11TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY11TBOX")>,HCPCQTY11TBOX = <cfif form.HCPCQTY11TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY11TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear11TBOX")>,hcpcLengthOfNeedYear11TBOX = <cfif form.hcpcLengthOfNeedYear11TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear11TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth11TBOX")>,hcpcLengthOfNeedMonth11TBOX = <cfif form.hcpcLengthOfNeedMonth11TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth11TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE12TBOX")>,HCPCCODE12TBOX = <cfif form.HCPCCODE12TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE12TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST12TBOX")>,HCPCCOST12TBOX = <cfif form.HCPCCOST12TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST12TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS12TBOX")>,HCPCDIAGNOSIS12TBOX = <cfif form.HCPCDIAGNOSIS12TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS12TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX12TBOX")>,HCPCDX12TBOX = <cfif form.HCPCDX12TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX12TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT12TBOX")>,HCPCPRODUCT12TBOX = <cfif form.HCPCPRODUCT12TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT12TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY12TBOX")>,HCPCQTY12TBOX = <cfif form.HCPCQTY12TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY12TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear12TBOX")>,hcpcLengthOfNeedYear12TBOX = <cfif form.hcpcLengthOfNeedYear12TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear12TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth12TBOX")>,hcpcLengthOfNeedMonth12TBOX = <cfif form.hcpcLengthOfNeedMonth12TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth12TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE13TBOX")>,HCPCCODE13TBOX = <cfif form.HCPCCODE13TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE13TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST13TBOX")>,HCPCCOST13TBOX = <cfif form.HCPCCOST13TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST13TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS13TBOX")>,HCPCDIAGNOSIS13TBOX = <cfif form.HCPCDIAGNOSIS13TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS13TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX13TBOX")>,HCPCDX13TBOX = <cfif form.HCPCDX13TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX13TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT13TBOX")>,HCPCPRODUCT13TBOX = <cfif form.HCPCPRODUCT13TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT13TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY13TBOX")>,HCPCQTY13TBOX = <cfif form.HCPCQTY13TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY13TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear13TBOX")>,hcpcLengthOfNeedYear13TBOX = <cfif form.hcpcLengthOfNeedYear13TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear13TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth13TBOX")>,hcpcLengthOfNeedMonth13TBOX = <cfif form.hcpcLengthOfNeedMonth13TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth13TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE14TBOX")>,HCPCCODE14TBOX = <cfif form.HCPCCODE14TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE14TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST14TBOX")>,HCPCCOST14TBOX = <cfif form.HCPCCOST14TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST14TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS14TBOX")>,HCPCDIAGNOSIS14TBOX = <cfif form.HCPCDIAGNOSIS14TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS14TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX14TBOX")>,HCPCDX14TBOX = <cfif form.HCPCDX14TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX14TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT14TBOX")>,HCPCPRODUCT14TBOX = <cfif form.HCPCPRODUCT14TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT14TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY14TBOX")>,HCPCQTY14TBOX = <cfif form.HCPCQTY14TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY14TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear14TBOX")>,hcpcLengthOfNeedYear14TBOX = <cfif form.hcpcLengthOfNeedYear14TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear14TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth14TBOX")>,hcpcLengthOfNeedMonth14TBOX = <cfif form.hcpcLengthOfNeedMonth14TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth14TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE15TBOX")>,HCPCCODE15TBOX = <cfif form.HCPCCODE15TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE15TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST15TBOX")>,HCPCCOST15TBOX = <cfif form.HCPCCOST15TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST15TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS15TBOX")>,HCPCDIAGNOSIS15TBOX = <cfif form.HCPCDIAGNOSIS15TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS15TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX15TBOX")>,HCPCDX15TBOX = <cfif form.HCPCDX15TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX15TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT15TBOX")>,HCPCPRODUCT15TBOX = <cfif form.HCPCPRODUCT15TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT15TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY15TBOX")>,HCPCQTY15TBOX = <cfif form.HCPCQTY15TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY15TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear15TBOX")>,hcpcLengthOfNeedYear15TBOX = <cfif form.hcpcLengthOfNeedYear15TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear15TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth15TBOX")>,hcpcLengthOfNeedMonth15TBOX = <cfif form.hcpcLengthOfNeedMonth15TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth15TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE16TBOX")>,HCPCCODE16TBOX = <cfif form.HCPCCODE16TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE16TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST16TBOX")>,HCPCCOST16TBOX = <cfif form.HCPCCOST16TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST16TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS16TBOX")>,HCPCDIAGNOSIS16TBOX = <cfif form.HCPCDIAGNOSIS16TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS16TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX16TBOX")>,HCPCDX16TBOX = <cfif form.HCPCDX16TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX16TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT16TBOX")>,HCPCPRODUCT16TBOX = <cfif form.HCPCPRODUCT16TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT16TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY16TBOX")>,HCPCQTY16TBOX = <cfif form.HCPCQTY16TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY16TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear16TBOX")>,hcpcLengthOfNeedYear16TBOX = <cfif form.hcpcLengthOfNeedYear16TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear16TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth16TBOX")>,hcpcLengthOfNeedMonth16TBOX = <cfif form.hcpcLengthOfNeedMonth16TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth16TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE17TBOX")>,HCPCCODE17TBOX = <cfif form.HCPCCODE17TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE17TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST17TBOX")>,HCPCCOST17TBOX = <cfif form.HCPCCOST17TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST17TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS17TBOX")>,HCPCDIAGNOSIS17TBOX = <cfif form.HCPCDIAGNOSIS17TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS17TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX17TBOX")>,HCPCDX17TBOX = <cfif form.HCPCDX17TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX17TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT17TBOX")>,HCPCPRODUCT17TBOX = <cfif form.HCPCPRODUCT17TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT17TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY17TBOX")>,HCPCQTY17TBOX = <cfif form.HCPCQTY17TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY17TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear17TBOX")>,hcpcLengthOfNeedYear17TBOX = <cfif form.hcpcLengthOfNeedYear17TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear17TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth17TBOX")>,hcpcLengthOfNeedMonth17TBOX = <cfif form.hcpcLengthOfNeedMonth17TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth17TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE18TBOX")>,HCPCCODE18TBOX = <cfif form.HCPCCODE18TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE18TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST18TBOX")>,HCPCCOST18TBOX = <cfif form.HCPCCOST18TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST18TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS18TBOX")>,HCPCDIAGNOSIS18TBOX = <cfif form.HCPCDIAGNOSIS18TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS18TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX18TBOX")>,HCPCDX18TBOX = <cfif form.HCPCDX18TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX18TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT18TBOX")>,HCPCPRODUCT18TBOX = <cfif form.HCPCPRODUCT18TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT18TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY18TBOX")>,HCPCQTY18TBOX = <cfif form.HCPCQTY18TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY18TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear18TBOX")>,hcpcLengthOfNeedYear18TBOX = <cfif form.hcpcLengthOfNeedYear18TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear18TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth18TBOX")>,hcpcLengthOfNeedMonth18TBOX = <cfif form.hcpcLengthOfNeedMonth18TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth18TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE19TBOX")>,HCPCCODE19TBOX = <cfif form.HCPCCODE19TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE19TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST19TBOX")>,HCPCCOST19TBOX = <cfif form.HCPCCOST19TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST19TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS19TBOX")>,HCPCDIAGNOSIS19TBOX = <cfif form.HCPCDIAGNOSIS19TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS19TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX19TBOX")>,HCPCDX19TBOX = <cfif form.HCPCDX19TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX19TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT19TBOX")>,HCPCPRODUCT19TBOX = <cfif form.HCPCPRODUCT19TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT19TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY19TBOX")>,HCPCQTY19TBOX = <cfif form.HCPCQTY19TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY19TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear19TBOX")>,hcpcLengthOfNeedYear19TBOX = <cfif form.hcpcLengthOfNeedYear19TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear19TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth19TBOX")>,hcpcLengthOfNeedMonth19TBOX = <cfif form.hcpcLengthOfNeedMonth19TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth19TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE20TBOX")>,HCPCCODE20TBOX = <cfif form.HCPCCODE20TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE20TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST20TBOX")>,HCPCCOST20TBOX = <cfif form.HCPCCOST20TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST20TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS20TBOX")>,HCPCDIAGNOSIS20TBOX = <cfif form.HCPCDIAGNOSIS20TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS20TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX20TBOX")>,HCPCDX20TBOX = <cfif form.HCPCDX20TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX20TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT20TBOX")>,HCPCPRODUCT20TBOX = <cfif form.HCPCPRODUCT20TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT20TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY20TBOX")>,HCPCQTY20TBOX = <cfif form.HCPCQTY20TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY20TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear20TBOX")>,hcpcLengthOfNeedYear20TBOX = <cfif form.hcpcLengthOfNeedYear20TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear20TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth20TBOX")>,hcpcLengthOfNeedMonth20TBOX = <cfif form.hcpcLengthOfNeedMonth20TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth20TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE21TBOX")>,HCPCCODE21TBOX = <cfif form.HCPCCODE21TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE21TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST21TBOX")>,HCPCCOST21TBOX = <cfif form.HCPCCOST21TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST21TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS21TBOX")>,HCPCDIAGNOSIS21TBOX = <cfif form.HCPCDIAGNOSIS21TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS21TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX21TBOX")>,HCPCDX21TBOX = <cfif form.HCPCDX21TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX21TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT21TBOX")>,HCPCPRODUCT21TBOX = <cfif form.HCPCPRODUCT21TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT21TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY21TBOX")>,HCPCQTY21TBOX = <cfif form.HCPCQTY21TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY21TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear21TBOX")>,hcpcLengthOfNeedYear21TBOX = <cfif form.hcpcLengthOfNeedYear21TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear21TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth21TBOX")>,hcpcLengthOfNeedMonth21TBOX = <cfif form.hcpcLengthOfNeedMonth21TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth21TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE22TBOX")>,HCPCCODE22TBOX = <cfif form.HCPCCODE22TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE22TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST22TBOX")>,HCPCCOST22TBOX = <cfif form.HCPCCOST22TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST22TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS22TBOX")>,HCPCDIAGNOSIS22TBOX = <cfif form.HCPCDIAGNOSIS22TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS22TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX22TBOX")>,HCPCDX22TBOX = <cfif form.HCPCDX22TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX22TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT22TBOX")>,HCPCPRODUCT22TBOX = <cfif form.HCPCPRODUCT22TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT22TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY22TBOX")>,HCPCQTY22TBOX = <cfif form.HCPCQTY22TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY22TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear22TBOX")>,hcpcLengthOfNeedYear22TBOX = <cfif form.hcpcLengthOfNeedYear22TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear22TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth22TBOX")>,hcpcLengthOfNeedMonth22TBOX = <cfif form.hcpcLengthOfNeedMonth22TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth22TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE23TBOX")>,HCPCCODE23TBOX = <cfif form.HCPCCODE23TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE23TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST23TBOX")>,HCPCCOST23TBOX = <cfif form.HCPCCOST23TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST23TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS23TBOX")>,HCPCDIAGNOSIS23TBOX = <cfif form.HCPCDIAGNOSIS23TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS23TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX23TBOX")>,HCPCDX23TBOX = <cfif form.HCPCDX23TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX23TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT23TBOX")>,HCPCPRODUCT23TBOX = <cfif form.HCPCPRODUCT23TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT23TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY23TBOX")>,HCPCQTY23TBOX = <cfif form.HCPCQTY23TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY23TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear23TBOX")>,hcpcLengthOfNeedYear23TBOX = <cfif form.hcpcLengthOfNeedYear23TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear23TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth23TBOX")>,hcpcLengthOfNeedMonth23TBOX = <cfif form.hcpcLengthOfNeedMonth23TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth23TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE24TBOX")>,HCPCCODE24TBOX = <cfif form.HCPCCODE24TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE24TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST24TBOX")>,HCPCCOST24TBOX = <cfif form.HCPCCOST24TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST24TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS24TBOX")>,HCPCDIAGNOSIS24TBOX = <cfif form.HCPCDIAGNOSIS24TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS24TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX24TBOX")>,HCPCDX24TBOX = <cfif form.HCPCDX24TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX24TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT24TBOX")>,HCPCPRODUCT24TBOX = <cfif form.HCPCPRODUCT24TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT24TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY24TBOX")>,HCPCQTY24TBOX = <cfif form.HCPCQTY24TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY24TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear24TBOX")>,hcpcLengthOfNeedYear24TBOX = <cfif form.hcpcLengthOfNeedYear24TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear24TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth24TBOX")>,hcpcLengthOfNeedMonth24TBOX = <cfif form.hcpcLengthOfNeedMonth24TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth24TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE25TBOX")>,HCPCCODE25TBOX = <cfif form.HCPCCODE25TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE25TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST25TBOX")>,HCPCCOST25TBOX = <cfif form.HCPCCOST25TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST25TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS25TBOX")>,HCPCDIAGNOSIS25TBOX = <cfif form.HCPCDIAGNOSIS25TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS25TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX25TBOX")>,HCPCDX25TBOX = <cfif form.HCPCDX25TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX25TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT25TBOX")>,HCPCPRODUCT25TBOX = <cfif form.HCPCPRODUCT25TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT25TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY25TBOX")>,HCPCQTY25TBOX = <cfif form.HCPCQTY25TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY25TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear25TBOX")>,hcpcLengthOfNeedYear25TBOX = <cfif form.hcpcLengthOfNeedYear25TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear25TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth25TBOX")>,hcpcLengthOfNeedMonth25TBOX = <cfif form.hcpcLengthOfNeedMonth25TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth25TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE26TBOX")>,HCPCCODE26TBOX = <cfif form.HCPCCODE26TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE26TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST26TBOX")>,HCPCCOST26TBOX = <cfif form.HCPCCOST26TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST26TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS26TBOX")>,HCPCDIAGNOSIS26TBOX = <cfif form.HCPCDIAGNOSIS26TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS26TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX26TBOX")>,HCPCDX26TBOX = <cfif form.HCPCDX26TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX26TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT26TBOX")>,HCPCPRODUCT26TBOX = <cfif form.HCPCPRODUCT26TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT26TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY26TBOX")>,HCPCQTY26TBOX = <cfif form.HCPCQTY26TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY26TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear26TBOX")>,hcpcLengthOfNeedYear26TBOX = <cfif form.hcpcLengthOfNeedYear26TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear26TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth26TBOX")>,hcpcLengthOfNeedMonth26TBOX = <cfif form.hcpcLengthOfNeedMonth26TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth26TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE27TBOX")>,HCPCCODE27TBOX = <cfif form.HCPCCODE27TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE27TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST27TBOX")>,HCPCCOST27TBOX = <cfif form.HCPCCOST27TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST27TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS27TBOX")>,HCPCDIAGNOSIS27TBOX = <cfif form.HCPCDIAGNOSIS27TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS27TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX27TBOX")>,HCPCDX27TBOX = <cfif form.HCPCDX27TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX27TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT27TBOX")>,HCPCPRODUCT27TBOX = <cfif form.HCPCPRODUCT27TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT27TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY27TBOX")>,HCPCQTY27TBOX = <cfif form.HCPCQTY27TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY27TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear27TBOX")>,hcpcLengthOfNeedYear27TBOX = <cfif form.hcpcLengthOfNeedYear27TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear27TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth27TBOX")>,hcpcLengthOfNeedMonth27TBOX = <cfif form.hcpcLengthOfNeedMonth27TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth27TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE28TBOX")>,HCPCCODE28TBOX = <cfif form.HCPCCODE28TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE28TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST28TBOX")>,HCPCCOST28TBOX = <cfif form.HCPCCOST28TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST28TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS28TBOX")>,HCPCDIAGNOSIS28TBOX = <cfif form.HCPCDIAGNOSIS28TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS28TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX28TBOX")>,HCPCDX28TBOX = <cfif form.HCPCDX28TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX28TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT28TBOX")>,HCPCPRODUCT28TBOX = <cfif form.HCPCPRODUCT28TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT28TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY28TBOX")>,HCPCQTY28TBOX = <cfif form.HCPCQTY28TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY28TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear28TBOX")>,hcpcLengthOfNeedYear28TBOX = <cfif form.hcpcLengthOfNeedYear28TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear28TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth28TBOX")>,hcpcLengthOfNeedMonth28TBOX = <cfif form.hcpcLengthOfNeedMonth28TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth28TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE29TBOX")>,HCPCCODE29TBOX = <cfif form.HCPCCODE29TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE29TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST29TBOX")>,HCPCCOST29TBOX = <cfif form.HCPCCOST29TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST29TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS29TBOX")>,HCPCDIAGNOSIS29TBOX = <cfif form.HCPCDIAGNOSIS29TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS29TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX29TBOX")>,HCPCDX29TBOX = <cfif form.HCPCDX29TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX29TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT29TBOX")>,HCPCPRODUCT29TBOX = <cfif form.HCPCPRODUCT29TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT29TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY29TBOX")>,HCPCQTY29TBOX = <cfif form.HCPCQTY29TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY29TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear29TBOX")>,hcpcLengthOfNeedYear29TBOX = <cfif form.hcpcLengthOfNeedYear29TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear29TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth29TBOX")>,hcpcLengthOfNeedMonth29TBOX = <cfif form.hcpcLengthOfNeedMonth29TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth29TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE30TBOX")>,HCPCCODE30TBOX = <cfif form.HCPCCODE30TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE30TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST30TBOX")>,HCPCCOST30TBOX = <cfif form.HCPCCOST30TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST30TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS30TBOX")>,HCPCDIAGNOSIS30TBOX = <cfif form.HCPCDIAGNOSIS30TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS30TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX30TBOX")>,HCPCDX30TBOX = <cfif form.HCPCDX30TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX30TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT30TBOX")>,HCPCPRODUCT30TBOX = <cfif form.HCPCPRODUCT30TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT30TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY30TBOX")>,HCPCQTY30TBOX = <cfif form.HCPCQTY30TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY30TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear30TBOX")>,hcpcLengthOfNeedYear30TBOX = <cfif form.hcpcLengthOfNeedYear30TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear30TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth30TBOX")>,hcpcLengthOfNeedMonth30TBOX = <cfif form.hcpcLengthOfNeedMonth30TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth30TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE31TBOX")>,HCPCCODE31TBOX = <cfif form.HCPCCODE31TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE31TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST31TBOX")>,HCPCCOST31TBOX = <cfif form.HCPCCOST31TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST31TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS31TBOX")>,HCPCDIAGNOSIS31TBOX = <cfif form.HCPCDIAGNOSIS31TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS31TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX31TBOX")>,HCPCDX31TBOX = <cfif form.HCPCDX31TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX31TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT31TBOX")>,HCPCPRODUCT31TBOX = <cfif form.HCPCPRODUCT31TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT31TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY31TBOX")>,HCPCQTY31TBOX = <cfif form.HCPCQTY31TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY31TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear31TBOX")>,hcpcLengthOfNeedYear31TBOX = <cfif form.hcpcLengthOfNeedYear31TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear31TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth31TBOX")>,hcpcLengthOfNeedMonth31TBOX = <cfif form.hcpcLengthOfNeedMonth31TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth31TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE32TBOX")>,HCPCCODE32TBOX = <cfif form.HCPCCODE32TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE32TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST32TBOX")>,HCPCCOST32TBOX = <cfif form.HCPCCOST32TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST32TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS32TBOX")>,HCPCDIAGNOSIS32TBOX = <cfif form.HCPCDIAGNOSIS32TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS32TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX32TBOX")>,HCPCDX32TBOX = <cfif form.HCPCDX32TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX32TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT32TBOX")>,HCPCPRODUCT32TBOX = <cfif form.HCPCPRODUCT32TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT32TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY32TBOX")>,HCPCQTY32TBOX = <cfif form.HCPCQTY32TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY32TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear32TBOX")>,hcpcLengthOfNeedYear32TBOX = <cfif form.hcpcLengthOfNeedYear32TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear32TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth32TBOX")>,hcpcLengthOfNeedMonth32TBOX = <cfif form.hcpcLengthOfNeedMonth32TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth32TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE33TBOX")>,HCPCCODE33TBOX = <cfif form.HCPCCODE33TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE33TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST33TBOX")>,HCPCCOST33TBOX = <cfif form.HCPCCOST33TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST33TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS33TBOX")>,HCPCDIAGNOSIS33TBOX = <cfif form.HCPCDIAGNOSIS33TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS33TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX33TBOX")>,HCPCDX33TBOX = <cfif form.HCPCDX33TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX33TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT33TBOX")>,HCPCPRODUCT33TBOX = <cfif form.HCPCPRODUCT33TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT33TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY33TBOX")>,HCPCQTY33TBOX = <cfif form.HCPCQTY33TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY33TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear33TBOX")>,hcpcLengthOfNeedYear33TBOX = <cfif form.hcpcLengthOfNeedYear33TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear33TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth33TBOX")>,hcpcLengthOfNeedMonth33TBOX = <cfif form.hcpcLengthOfNeedMonth33TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth33TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE34TBOX")>,HCPCCODE34TBOX = <cfif form.HCPCCODE34TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE34TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST34TBOX")>,HCPCCOST34TBOX = <cfif form.HCPCCOST34TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST34TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS34TBOX")>,HCPCDIAGNOSIS34TBOX = <cfif form.HCPCDIAGNOSIS34TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS34TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX34TBOX")>,HCPCDX34TBOX = <cfif form.HCPCDX34TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX34TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT34TBOX")>,HCPCPRODUCT34TBOX = <cfif form.HCPCPRODUCT34TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT34TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY34TBOX")>,HCPCQTY34TBOX = <cfif form.HCPCQTY34TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY34TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear34TBOX")>,hcpcLengthOfNeedYear34TBOX = <cfif form.hcpcLengthOfNeedYear34TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear34TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth34TBOX")>,hcpcLengthOfNeedMonth34TBOX = <cfif form.hcpcLengthOfNeedMonth34TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth34TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE35TBOX")>,HCPCCODE35TBOX = <cfif form.HCPCCODE35TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE35TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST35TBOX")>,HCPCCOST35TBOX = <cfif form.HCPCCOST35TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST35TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS35TBOX")>,HCPCDIAGNOSIS35TBOX = <cfif form.HCPCDIAGNOSIS35TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS35TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX35TBOX")>,HCPCDX35TBOX = <cfif form.HCPCDX35TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX35TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT35TBOX")>,HCPCPRODUCT35TBOX = <cfif form.HCPCPRODUCT35TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT35TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY35TBOX")>,HCPCQTY35TBOX = <cfif form.HCPCQTY35TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY35TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear35TBOX")>,hcpcLengthOfNeedYear35TBOX = <cfif form.hcpcLengthOfNeedYear35TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear35TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth35TBOX")>,hcpcLengthOfNeedMonth35TBOX = <cfif form.hcpcLengthOfNeedMonth35TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth35TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE36TBOX")>,HCPCCODE36TBOX = <cfif form.HCPCCODE36TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE36TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST36TBOX")>,HCPCCOST36TBOX = <cfif form.HCPCCOST36TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST36TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS36TBOX")>,HCPCDIAGNOSIS36TBOX = <cfif form.HCPCDIAGNOSIS36TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS36TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX36TBOX")>,HCPCDX36TBOX = <cfif form.HCPCDX36TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX36TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT36TBOX")>,HCPCPRODUCT36TBOX = <cfif form.HCPCPRODUCT36TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT36TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY36TBOX")>,HCPCQTY36TBOX = <cfif form.HCPCQTY36TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY36TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear36TBOX")>,hcpcLengthOfNeedYear36TBOX = <cfif form.hcpcLengthOfNeedYear36TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear36TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth36TBOX")>,hcpcLengthOfNeedMonth36TBOX = <cfif form.hcpcLengthOfNeedMonth36TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth36TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE37TBOX")>,HCPCCODE37TBOX = <cfif form.HCPCCODE37TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE37TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST37TBOX")>,HCPCCOST37TBOX = <cfif form.HCPCCOST37TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST37TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS37TBOX")>,HCPCDIAGNOSIS37TBOX = <cfif form.HCPCDIAGNOSIS37TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS37TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX37TBOX")>,HCPCDX37TBOX = <cfif form.HCPCDX37TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX37TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT37TBOX")>,HCPCPRODUCT37TBOX = <cfif form.HCPCPRODUCT37TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT37TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY37TBOX")>,HCPCQTY37TBOX = <cfif form.HCPCQTY37TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY37TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear37TBOX")>,hcpcLengthOfNeedYear37TBOX = <cfif form.hcpcLengthOfNeedYear37TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear37TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth37TBOX")>,hcpcLengthOfNeedMonth37TBOX = <cfif form.hcpcLengthOfNeedMonth37TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth37TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE38TBOX")>,HCPCCODE38TBOX = <cfif form.HCPCCODE38TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE38TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST38TBOX")>,HCPCCOST38TBOX = <cfif form.HCPCCOST38TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST38TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS38TBOX")>,HCPCDIAGNOSIS38TBOX = <cfif form.HCPCDIAGNOSIS38TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS38TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX38TBOX")>,HCPCDX38TBOX = <cfif form.HCPCDX38TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX38TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT38TBOX")>,HCPCPRODUCT38TBOX = <cfif form.HCPCPRODUCT38TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT38TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY38TBOX")>,HCPCQTY38TBOX = <cfif form.HCPCQTY38TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY38TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear38TBOX")>,hcpcLengthOfNeedYear38TBOX = <cfif form.hcpcLengthOfNeedYear38TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear38TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth38TBOX")>,hcpcLengthOfNeedMonth38TBOX = <cfif form.hcpcLengthOfNeedMonth38TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth38TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE39TBOX")>,HCPCCODE39TBOX = <cfif form.HCPCCODE39TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE39TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST39TBOX")>,HCPCCOST39TBOX = <cfif form.HCPCCOST39TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST39TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS39TBOX")>,HCPCDIAGNOSIS39TBOX = <cfif form.HCPCDIAGNOSIS39TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS39TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX39TBOX")>,HCPCDX39TBOX = <cfif form.HCPCDX39TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX39TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT39TBOX")>,HCPCPRODUCT39TBOX = <cfif form.HCPCPRODUCT39TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT39TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY39TBOX")>,HCPCQTY39TBOX = <cfif form.HCPCQTY39TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY39TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear39TBOX")>,hcpcLengthOfNeedYear39TBOX = <cfif form.hcpcLengthOfNeedYear39TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear39TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth39TBOX")>,hcpcLengthOfNeedMonth39TBOX = <cfif form.hcpcLengthOfNeedMonth39TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth39TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCODE40TBOX")>,HCPCCODE40TBOX = <cfif form.HCPCCODE40TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCODE40TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCCOST40TBOX")>,HCPCCOST40TBOX = <cfif form.HCPCCOST40TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCCOST40TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDIAGNOSIS40TBOX")>,HCPCDIAGNOSIS40TBOX = <cfif form.HCPCDIAGNOSIS40TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDIAGNOSIS40TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCDX40TBOX")>,HCPCDX40TBOX = <cfif form.HCPCDX40TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCDX40TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCPRODUCT40TBOX")>,HCPCPRODUCT40TBOX = <cfif form.HCPCPRODUCT40TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCPRODUCT40TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.HCPCQTY40TBOX")>,HCPCQTY40TBOX = <cfif form.HCPCQTY40TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.HCPCQTY40TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear40TBOX")>,hcpcLengthOfNeedYear40TBOX = <cfif form.hcpcLengthOfNeedYear40TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear40TBOX))#'<cfelse>NULL</cfif></cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth40TBOX")>,hcpcLengthOfNeedMonth40TBOX = <cfif form.hcpcLengthOfNeedMonth40TBOX NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth40TBOX))#'<cfelse>NULL</cfif></cfif>
				WHERE IntakeID = #trim(form.IntakeID)#
			</cfoutput>
		</cfsavecontent>

		<!---<cfmail from="support@eobmanager.net" to="gcruz@eobmanager.net" subject="[PreserveSingleQuotes(sqlStatementHCPC)] UPDATE There was an issue processing the page. Please try your intake again. - #DateFormat( now(), 'm/d/yyyy' )# #TimeFormat( now() )#" type="HTML">
			#PreserveSingleQuotes(sqlStatementHCPC)#
		</cfmail>--->
		
		
		<cfquery name="updateIntakeHCPC" dataSource="#request.datasource#">
			#PreserveSingleQuotes(sqlStatementHCPC)#
		</cfquery>	

		<cfset msg = "Intake #trim(form.intakeID)# has been Updated.">
	 	<!---<cfset msg = "Intake <span style=cursor:hand onclick=location.href='appPatientIntakeEdit.cfm?intakeID=#trim(form.intakeID)#'>(ID: <u>#trim(form.intakeID)#</u>)</span> has been Updated.">--->

		<cfif IsDefined("form.closingInvoiceNumber") AND form.closingInvoiceNumber NEQ "">
			<cfset msg = "Intake (ID: #trim(form.intakeID)#) has been updated and closed.">
		</cfif>
		


	<!-------------------------------------------------------------------------------------->
	<!--- Insert the intake                                                              --->
	<!-------------------------------------------------------------------------------------->
	<cfelse>
		
		
		
		<cfsavecontent variable="sqlStatement">
			<cfoutput>
			INSERT INTO intake(
		 		DateModified,
				ClientID,
				hidden_Step,
				hidden_UsersID,
				AssignedToUserID,
				
				<cfif (IsDefined("form.OPTION_SkilledNursingYes") AND IsNumeric(form.OPTION_SkilledNursingYes)) OR (IsDefined("form.OPTION_SkilledNursingNo") AND IsNumeric(form.OPTION_SkilledNursingNo))>OPTION_SkilledNursing,</cfif>
				<cfif IsDefined("form.SkilledNursingName") AND form.SkilledNursingName NEQ "">SkilledNursingName,</cfif>
				<cfif IsDefined("form.SkilledNursingTelephone") AND form.SkilledNursingTelephone NEQ "">SkilledNursingTelephone,</cfif>
				<cfif IsDefined("patientID") AND IsNumeric(patientID)>patientID,</cfif>
				<cfif IsDefined("patientAddressID") AND IsNumeric(patientAddressID)>patientAddressID,</cfif>
				<cfif IsDefined("patientPhoneID") AND IsNumeric(patientPhoneID)>patientPhoneID,</cfif>					
				<cfif IsDefined("form.callerFNameTBox") AND form.callerFNameTBox NEQ "">callerFNameTBox,</cfif>
				<cfif IsDefined("form.callerMInitialTBox") AND form.callerMInitialTBox NEQ "">callerMInitialTBox,</cfif>
				<cfif IsDefined("form.callerLNameTBox") AND form.callerLNameTBox NEQ "">callerLNameTBox,</cfif>			
				<cfif IsDefined("form.alternateContactFNameTBox") AND form.alternateContactFNameTBox NEQ "">alternateContactFNameTBox,</cfif>
				<cfif IsDefined("form.alternateContactMInitialTBox") AND form.alternateContactMInitialTBox NEQ "">alternateContactMInitialTBox,</cfif>
				<cfif IsDefined("form.alternateContactLNameTBox") AND form.alternateContactLNameTBox NEQ "">alternateContactLNameTBox,</cfif>
				<cfif IsDefined("form.alternateContactWorkPhoneTBox") AND form.alternateContactWorkPhoneTBox NEQ "">alternateContactWorkPhoneTBox,</cfif>
				<cfif IsDefined("form.orderingPhysicianFNameTBox") AND form.orderingPhysicianFNameTBox NEQ "">orderingPhysicianFNameTBox,</cfif>
				<cfif IsDefined("form.orderingPhysicianMInitialTBox") AND form.orderingPhysicianMInitialTBox NEQ "">orderingPhysicianMInitialTBox,</cfif>
				<cfif IsDefined("form.orderingPhysicianLNameTBox") AND form.orderingPhysicianLNameTBox NEQ "">orderingPhysicianLNameTBox,</cfif>
				<cfif IsDefined("form.OPTION_1_CBox_Delivery") AND form.OPTION_1_CBox_Delivery NEQ "">OPTION_1_CBox_Delivery,</cfif>
				<cfif IsDefined("form.OPTION_1_CBox_Pickup") AND form.OPTION_1_CBox_Pickup NEQ "">OPTION_1_CBox_Pickup,</cfif>
				<cfif IsDefined("form.OPTION_1_CBox_Repair") AND form.OPTION_1_CBox_Repair NEQ "">OPTION_1_CBox_Repair,</cfif>
				<cfif IsDefined("form.OPTION_1_CBox_Switch") AND form.OPTION_1_CBox_Switch NEQ "">OPTION_1_CBox_Switch,</cfif>
				<cfif IsDefined("form.OPTION_1_CBox_Existing") AND form.OPTION_1_CBox_Existing NEQ "">OPTION_1_CBox_Existing,</cfif>
				<cfif IsDefined("form.OPTION_2_CBox_Other") AND form.OPTION_2_CBox_Other NEQ "">OPTION_2_CBox_Other,</cfif>
				<cfif IsDefined("form.OPTION_2_CBox_Hospice") AND form.OPTION_2_CBox_Hospice NEQ "">OPTION_2_CBox_Hospice,</cfif>
				<cfif IsDefined("form.OPTION_2_CBox_Hospital") AND form.OPTION_2_CBox_Hospital NEQ "">OPTION_2_CBox_Hospital,</cfif>
				<cfif IsDefined("form.otherTBox") AND form.otherTBox NEQ "">otherTBox,</cfif>
				<cfif IsDefined("form.hospiceTBox") AND form.hospiceTBox NEQ "">hospiceTBox,</cfif>
				<cfif IsDefined("form.OPTION_3_CBox_Medicare") AND form.OPTION_3_CBox_Medicare NEQ "">OPTION_3_CBox_Medicare,</cfif>
				<cfif IsDefined("form.OPTION_3_CBox_PrivateInsurance") AND form.OPTION_3_CBox_PrivateInsurance NEQ "">OPTION_3_CBox_PrivateInsurance,</cfif>
				<cfif IsDefined("form.OPTION_3_CBox_Medicaid") AND form.OPTION_3_CBox_Medicaid NEQ "">OPTION_3_CBox_Medicaid,</cfif>
				<cfif IsDefined("form.OPTION_3_CBox_PrivatePay") AND form.OPTION_3_CBox_PrivatePay NEQ "">OPTION_3_CBox_PrivatePay,</cfif>
				<cfif IsDefined("form.hospitalTBox") AND form.hospitalTBox NEQ "">hospitalTBox,</cfif>
				<cfif IsDefined("form.DischargeDateMM") AND form.DischargeDateMM NEQ "">DischargeDateMM,</cfif>
				<cfif IsDefined("form.DischargeDateDD") AND form.DischargeDateDD NEQ "">DischargeDateDD,</cfif>
				<cfif IsDefined("form.DischargeDateYY") AND form.DischargeDateYY NEQ "">DischargeDateYY,</cfif>
				<cfif IsDefined("form.typeOfPay_Radio") AND form.typeOfPay_Radio NEQ "">typeOfPay_Radio,</cfif>
				<cfif IsDefined("form.callerNameTBox") AND form.callerNameTBox NEQ "">callerNameTBox,</cfif>
				<cfif IsDefined("form.callerPhoneTBox") AND form.callerPhoneTBox NEQ "">callerPhoneTBox,</cfif>
				<cfif IsDefined("form.roomNumberTBox") AND form.roomNumberTBox NEQ "">roomNumberTBox,</cfif>
				<cfif IsDefined("form.bedNumberTBox") AND form.bedNumberTBox NEQ "">bedNumberTBox,</cfif>				
				<cfif IsDefined("form.alternateContactRelationshipTBox") AND form.alternateContactRelationshipTBox NEQ "">alternateContactRelationshipTBox,</cfif>
				<cfif IsDefined("form.alternateContactPhoneTBox") AND form.alternateContactPhoneTBox NEQ "">alternateContactPhoneTBox,</cfif>
				<cfif IsDefined("form.poNumberTBox") AND form.poNumberTBox NEQ "">poNumberTBox,</cfif>
				<cfif IsDefined("form.creditCardTypeTBox") AND form.creditCardTypeTBox NEQ "">creditCardTypeTBox,</cfif>
				<cfif IsDefined("form.creditCardNumberTBox") AND form.creditCardNumberTBox NEQ "">creditCardNumberTBox,</cfif>
				<cfif IsDefined("form.ccDateMM") AND form.ccDateMM NEQ "">ccDateMM,</cfif>
				<cfif IsDefined("form.ccDateDD") AND form.ccDateDD NEQ "">ccDateDD,</cfif>
				<cfif IsDefined("form.ccDateYY") AND form.ccDateYY NEQ "">ccDateYY,</cfif>
				<cfif IsDefined("form.orderingPhysicianPhoneTBox") AND form.orderingPhysicianPhoneTBox NEQ "">orderingPhysicianPhoneTBox,</cfif>
				<cfif IsDefined("form.orderingPhysicianUPINTBox") AND form.orderingPhysicianUPINTBox NEQ "">orderingPhysicianUPINTBox,</cfif>
				<cfif IsDefined("form.orderingPhysicianFaxTBox") AND form.orderingPhysicianFaxTBox NEQ "">orderingPhysicianFaxTBox,</cfif>
				<cfif IsDefined("form.orderingPhysicianAddressTBox") AND form.orderingPhysicianAddressTBox NEQ "">orderingPhysicianAddressTBox,</cfif>
				<cfif IsDefined("form.orderingPhysicianCityTBox") AND form.orderingPhysicianCityTBox NEQ "">orderingPhysicianCityTBox,</cfif>
				<cfif IsDefined("form.orderingPhysicianStateTBox") AND form.orderingPhysicianStateTBox NEQ "">orderingPhysicianStateTBox,</cfif>
				<cfif IsDefined("form.orderingPhysicianZipTBox") AND form.orderingPhysicianZipTBox NEQ "">orderingPhysicianZipTBox,</cfif>
				<cfif IsDefined("form.OPTION_13_CBox_PastEquipmentYes") AND form.OPTION_13_CBox_PastEquipmentYes NEQ "">OPTION_13_CBox_PastEquipmentYes,</cfif>
				<cfif IsDefined("form.OPTION_13_CBox_PastEquipmentNo") AND form.OPTION_13_CBox_PastEquipmentNo NEQ "">OPTION_13_CBox_PastEquipmentNo,</cfif>
				<cfif IsDefined("form.Equipment1TypeTBox") AND form.Equipment1TypeTBox NEQ "">Equipment1TypeTBox,</cfif>
				<cfif IsDefined("form.Equipment1RentPurchasedSelect") AND form.Equipment1RentPurchasedSelect NEQ "">Equipment1RentPurchasedSelect,</cfif>
				<cfif IsDefined("form.Equipment1FromMM") AND form.Equipment1FromMM NEQ "">Equipment1FromMM,</cfif>
				<cfif IsDefined("form.Equipment1FromDD") AND form.Equipment1FromDD NEQ "">Equipment1FromDD,</cfif>
				<cfif IsDefined("form.Equipment1FromYY") AND form.Equipment1FromYY NEQ "">Equipment1FromYY,</cfif>
				<cfif IsDefined("form.Equipment1ToMM") AND form.Equipment1ToMM NEQ "">Equipment1ToMM,</cfif>
				<cfif IsDefined("form.Equipment1ToDD") AND form.Equipment1ToDD NEQ "">Equipment1ToDD,</cfif>
				<cfif IsDefined("form.Equipment1ToYY") AND form.Equipment1ToYY NEQ "">Equipment1ToYY,</cfif>
				<cfif IsDefined("form.Equipment1SupplierNameTBox") AND form.Equipment1SupplierNameTBox NEQ "">Equipment1SupplierNameTBox,</cfif>
				<cfif IsDefined("form.Equipment1SupplierTelephoneTBox") AND form.Equipment1SupplierTelephoneTBox NEQ "">Equipment1SupplierTelephoneTBox,</cfif>
				<cfif IsDefined("form.Equipment2TypeTBox") AND form.Equipment2TypeTBox NEQ "">Equipment2TypeTBox,</cfif>
				<cfif IsDefined("form.Equipment2RentPurchasedSelect") AND form.Equipment2RentPurchasedSelect NEQ "">Equipment2RentPurchasedSelect,</cfif>
				<cfif IsDefined("form.Equipment2FromMM") AND form.Equipment2FromMM NEQ "">Equipment2FromMM,</cfif>
				<cfif IsDefined("form.Equipment2FromDD") AND form.Equipment2FromDD NEQ "">Equipment2FromDD,</cfif>
				<cfif IsDefined("form.Equipment2FromYY") AND form.Equipment2FromYY NEQ "">Equipment2FromYY,</cfif>
				<cfif IsDefined("form.Equipment2ToMM") AND form.Equipment2ToMM NEQ "">Equipment2ToMM,</cfif>
				<cfif IsDefined("form.Equipment2ToDD") AND form.Equipment2ToDD NEQ "">Equipment2ToDD,</cfif>
				<cfif IsDefined("form.Equipment2ToYY") AND form.Equipment2ToYY NEQ "">Equipment2ToYY,</cfif>
				<cfif IsDefined("form.Equipment2SupplierNameTBox") AND form.Equipment2SupplierNameTBox NEQ "">Equipment2SupplierNameTBox,</cfif>
				<cfif IsDefined("form.Equipment2SupplierTelephoneTBox") AND form.Equipment2SupplierTelephoneTBox NEQ "">Equipment2SupplierTelephoneTBox,</cfif>
				<cfif IsDefined("form.Equipment3TypeTBox") AND form.Equipment3TypeTBox NEQ "">Equipment3TypeTBox,</cfif>
				<cfif IsDefined("form.Equipment3RentPurchasedSelect") AND form.Equipment3RentPurchasedSelect NEQ "">Equipment3RentPurchasedSelect,</cfif>
				<cfif IsDefined("form.Equipment3FromMM") AND form.Equipment3FromMM NEQ "">Equipment3FromMM,</cfif>
				<cfif IsDefined("form.Equipment3FromDD") AND form.Equipment3FromDD NEQ "">Equipment3FromDD,</cfif>
				<cfif IsDefined("form.Equipment3FromYY") AND form.Equipment3FromYY NEQ "">Equipment3FromYY,</cfif>
				<cfif IsDefined("form.Equipment3ToMM") AND form.Equipment3ToMM NEQ "">Equipment3ToMM,</cfif>
				<cfif IsDefined("form.Equipment3ToDD") AND form.Equipment3ToDD NEQ "">Equipment3ToDD,</cfif>
				<cfif IsDefined("form.Equipment3ToYY") AND form.Equipment3ToYY NEQ "">Equipment3ToYY,</cfif>
				<cfif IsDefined("form.Equipment3SupplierNameTBox") AND form.Equipment3SupplierNameTBox NEQ "">Equipment3SupplierNameTBox,</cfif>
				<cfif IsDefined("form.Equipment3SupplierTelephoneTBox") AND form.Equipment3SupplierTelephoneTBox NEQ "">Equipment3SupplierTelephoneTBox,</cfif>
				<cfif IsDefined("form.Equipment4TypeTBox") AND form.Equipment4TypeTBox NEQ "">Equipment4TypeTBox,</cfif>
				<cfif IsDefined("form.Equipment4RentPurchasedSelect") AND form.Equipment4RentPurchasedSelect NEQ "">Equipment4RentPurchasedSelect,</cfif>
				<cfif IsDefined("form.Equipment4FromMM") AND form.Equipment4FromMM NEQ "">Equipment4FromMM,</cfif>
				<cfif IsDefined("form.Equipment4FromDD") AND form.Equipment4FromDD NEQ "">Equipment4FromDD,</cfif>
				<cfif IsDefined("form.Equipment4FromYY") AND form.Equipment4FromYY NEQ "">Equipment4FromYY,</cfif>
				<cfif IsDefined("form.Equipment4ToMM") AND form.Equipment4ToMM NEQ "">Equipment4ToMM,</cfif>
				<cfif IsDefined("form.Equipment4ToDD") AND form.Equipment4ToDD NEQ "">Equipment4ToDD,</cfif>
				<cfif IsDefined("form.Equipment4ToYY") AND form.Equipment4ToYY NEQ "">Equipment4ToYY,</cfif>
				<cfif IsDefined("form.Equipment4SupplierNameTBox") AND form.Equipment4SupplierNameTBox NEQ "">Equipment4SupplierNameTBox,</cfif>
				<cfif IsDefined("form.Equipment4SupplierTelephoneTBox") AND form.Equipment4SupplierTelephoneTBox NEQ "">Equipment4SupplierTelephoneTBox,</cfif>
				<cfif IsDefined("form.Equipment5TypeTBox") AND form.Equipment5TypeTBox NEQ "">Equipment5TypeTBox,</cfif>
				<cfif IsDefined("form.Equipment1NoteTBox") AND form.Equipment1NoteTBox NEQ "">Equipment1NoteTBox,</cfif>
				<cfif IsDefined("form.Equipment2NoteTBox") AND form.Equipment2NoteTBox NEQ "">Equipment2NoteTBox,</cfif>
				<cfif IsDefined("form.Equipment3NoteTBox") AND form.Equipment3NoteTBox NEQ "">Equipment3NoteTBox,</cfif>
				<cfif IsDefined("form.Equipment4NoteTBox") AND form.Equipment4NoteTBox NEQ "">Equipment4NoteTBox,</cfif>
				<cfif IsDefined("form.Equipment5NoteTBox") AND form.Equipment5NoteTBox NEQ "">Equipment5NoteTBox,</cfif>
				<cfif IsDefined("form.Equipment5RentPurchasedSelect") AND form.Equipment5RentPurchasedSelect NEQ "">Equipment5RentPurchasedSelect,</cfif>
				<cfif IsDefined("form.Equipment5FromMM") AND form.Equipment5FromMM NEQ "">Equipment5FromMM,</cfif>
				<cfif IsDefined("form.Equipment5FromDD") AND form.Equipment5FromDD NEQ "">Equipment5FromDD,</cfif>
				<cfif IsDefined("form.Equipment5FromYY") AND form.Equipment5FromYY NEQ "">Equipment5FromYY,</cfif>
				<cfif IsDefined("form.Equipment5ToMM") AND form.Equipment5ToMM NEQ "">Equipment5ToMM,</cfif>
				<cfif IsDefined("form.Equipment5ToDD") AND form.Equipment5ToDD NEQ "">Equipment5ToDD,</cfif>
				<cfif IsDefined("form.Equipment5ToYY") AND form.Equipment5ToYY NEQ "">Equipment5ToYY,</cfif>
				<cfif IsDefined("form.Equipment5SupplierNameTBox") AND form.Equipment5SupplierNameTBox NEQ "">Equipment5SupplierNameTBox,</cfif>
				<cfif IsDefined("form.Equipment5SupplierTelephoneTBox") AND form.Equipment5SupplierTelephoneTBox NEQ "">Equipment5SupplierTelephoneTBox,</cfif>
				<cfif IsDefined("form.OPTION_14_CBox_OxygenPAo2") AND form.OPTION_14_CBox_OxygenPAo2 NEQ "">OPTION_14_CBox_OxygenPAo2,</cfif>
				<cfif IsDefined("form.OPTION_14_CBox_OxygenSAo2") AND form.OPTION_14_CBox_OxygenSAo2 NEQ "">OPTION_14_CBox_OxygenSAo2,</cfif>
				<cfif IsDefined("form.OPTION_14_CBox_OxygenSPo2") AND form.OPTION_14_CBox_OxygenSPo2 NEQ "">OPTION_14_CBox_OxygenSPo2,</cfif>
				<cfif IsDefined("form.OxygenPAO2TBox") AND form.OxygenPAO2TBox NEQ "">OxygenPAO2TBox,</cfif>
				<cfif IsDefined("form.OxygenSAO2TBox") AND form.OxygenSAO2TBox NEQ "">OxygenSAO2TBox,</cfif>
				<cfif IsDefined("form.CPAPStudy_CBox") AND form.CPAPStudy_CBox NEQ "">CPAPStudy_CBox,</cfif>
				<cfif IsDefined("form.CPAPStudyNote") AND form.CPAPStudyNote NEQ "">CPAPStudyNote,</cfif>
				<cfif IsDefined("form.OxygenSPO2TBox") AND form.OxygenSPO2TBox NEQ "">OxygenSPO2TBox,</cfif>
				<cfif IsDefined("form.CPAPStudyOnFile_CBox") AND form.CPAPStudyOnFile_CBox NEQ "">CPAPStudyOnFile_CBox,</cfif>
				<cfif IsDefined("form.CPAPStudyOnFileNote") AND form.CPAPStudyOnFileNote NEQ "">CPAPStudyOnFileNote,</cfif>
				<cfif IsDefined("form.LabTestDateMM") AND form.LabTestDateMM NEQ "">LabTestDateMM,</cfif>
				<cfif IsDefined("form.LabTestDateDD") AND form.LabTestDateDD NEQ "">LabTestDateDD,</cfif>
				<cfif IsDefined("form.LabTestDateYY") AND form.LabTestDateYY NEQ "">LabTestDateYY,</cfif>
				<cfif IsDefined("form.CPAPStudyPerformedAt") AND form.CPAPStudyPerformedAt NEQ "">CPAPStudyPerformedAt,</cfif>
				<cfif IsDefined("form.LabTestFacilityTBox") AND form.LabTestFacilityTBox NEQ "">LabTestFacilityTBox,</cfif>
				<cfif IsDefined("form.CPAPStudyPerformedAt2") AND form.CPAPStudyPerformedAt2 NEQ "">CPAPStudyPerformedAt2,</cfif>
				<cfif IsDefined("form.CPAPStudyPerformedAt3") AND form.CPAPStudyPerformedAt3 NEQ "">CPAPStudyPerformedAt3,</cfif>
				hidden_TimeStart
		 	)
			VALUES(
				NOW(),
				#trim(session.ClientID)#,
				'#trim(form.hidden_Step_OLD)#',
				'#trim(form.hidden_UsersID)#',
				'#trim(form.hidden_UsersID)#',
				
				<cfif IsDefined("form.OPTION_SkilledNursingYes") AND IsNumeric(form.OPTION_SkilledNursingYes)>0,<cfelseif IsDefined("form.OPTION_SkilledNursingNo") AND IsNumeric(form.OPTION_SkilledNursingNo)>1,</cfif>								
				<cfif IsDefined("form.SkilledNursingName") AND form.SkilledNursingName NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.SkilledNursingName))#',</cfif>
				<cfif IsDefined("form.SkilledNursingTelephone") AND form.SkilledNursingTelephone NEQ "">'#request.cleanNumericString(trim(form.SkilledNursingTelephone))#',</cfif>
				<cfif IsDefined("patientID") AND IsNumeric(patientID)>#trim(patientID)#,</cfif>
				<cfif IsDefined("patientAddressID") AND IsNumeric(patientAddressID)>#trim(patientAddressID)#,</cfif>
				<cfif IsDefined("patientPhoneID") AND IsNumeric(patientPhoneID)>#trim(patientPhoneID)#,</cfif>	
				<cfif IsDefined("form.callerFNameTBox") AND form.callerFNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.callerFNameTBox))#',</cfif>
				<cfif IsDefined("form.callerMInitialTBox") AND form.callerMInitialTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.callerMInitialTBox))#',</cfif>
				<cfif IsDefined("form.callerLNameTBox") AND form.callerLNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.callerLNameTBox))#',</cfif>
				<cfif IsDefined("form.alternateContactFNameTBox") AND form.alternateContactFNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.alternateContactFNameTBox))#',</cfif>
				<cfif IsDefined("form.alternateContactMInitialTBox") AND form.alternateContactMInitialTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.alternateContactMInitialTBox))#',</cfif>
				<cfif IsDefined("form.alternateContactLNameTBox") AND form.alternateContactLNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.alternateContactLNameTBox))#',</cfif>
				<cfif IsDefined("form.alternateContactWorkPhoneTBox") AND form.alternateContactWorkPhoneTBox NEQ "">'#request.cleanNumericString(trim(form.alternateContactWorkPhoneTBox))#',</cfif>
				<cfif IsDefined("form.orderingPhysicianFNameTBox") AND form.orderingPhysicianFNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.orderingPhysicianFNameTBox))#',</cfif>
				<cfif IsDefined("form.orderingPhysicianMInitialTBox") AND form.orderingPhysicianMInitialTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.orderingPhysicianMInitialTBox))#',</cfif>
				<cfif IsDefined("form.orderingPhysicianLNameTBox") AND form.orderingPhysicianLNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.orderingPhysicianLNameTBox))#',</cfif>
				<cfif IsDefined("form.OPTION_1_CBox_Delivery") AND form.OPTION_1_CBox_Delivery NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_1_CBox_Delivery))#',</cfif>
				<cfif IsDefined("form.OPTION_1_CBox_Pickup") AND form.OPTION_1_CBox_Pickup NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_1_CBox_Pickup))#',</cfif>
				<cfif IsDefined("form.OPTION_1_CBox_Repair") AND form.OPTION_1_CBox_Repair NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_1_CBox_Repair))#',</cfif>
				<cfif IsDefined("form.OPTION_1_CBox_Switch") AND form.OPTION_1_CBox_Switch NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_1_CBox_Switch))#',</cfif>
				<cfif IsDefined("form.OPTION_1_CBox_Existing") AND form.OPTION_1_CBox_Existing NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_1_CBox_Existing))#',</cfif>
				<cfif IsDefined("form.OPTION_2_CBox_Other") AND form.OPTION_2_CBox_Other NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_2_CBox_Other))#',</cfif>
				<cfif IsDefined("form.OPTION_2_CBox_Hospice") AND form.OPTION_2_CBox_Hospice NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_2_CBox_Hospice))#',</cfif>
				<cfif IsDefined("form.OPTION_2_CBox_Hospital") AND form.OPTION_2_CBox_Hospital NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_2_CBox_Hospital))#',</cfif>
				<cfif IsDefined("form.otherTBox") AND form.otherTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.otherTBox))#',</cfif>
				<cfif IsDefined("form.hospiceTBox") AND form.hospiceTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hospiceTBox))#',</cfif>
				<cfif IsDefined("form.OPTION_3_CBox_Medicare") AND form.OPTION_3_CBox_Medicare NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_3_CBox_Medicare))#',</cfif>
				<cfif IsDefined("form.OPTION_3_CBox_PrivateInsurance") AND form.OPTION_3_CBox_PrivateInsurance NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_3_CBox_PrivateInsurance))#',</cfif>
				<cfif IsDefined("form.OPTION_3_CBox_Medicaid") AND form.OPTION_3_CBox_Medicaid NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_3_CBox_Medicaid))#',</cfif>
				<cfif IsDefined("form.OPTION_3_CBox_PrivatePay") AND form.OPTION_3_CBox_PrivatePay NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_3_CBox_PrivatePay))#',</cfif>
				<cfif IsDefined("form.hospitalTBox") AND form.hospitalTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.hospitalTBox))#',</cfif>
				<cfif IsDefined("form.DischargeDateMM") AND form.DischargeDateMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.DischargeDateMM))#',</cfif>
				<cfif IsDefined("form.DischargeDateDD") AND form.DischargeDateDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.DischargeDateDD))#',</cfif>
				<cfif IsDefined("form.DischargeDateYY") AND form.DischargeDateYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.DischargeDateYY))#',</cfif>
				<cfif IsDefined("form.typeOfPay_Radio") AND form.typeOfPay_Radio NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.typeOfPay_Radio))#',</cfif>
				<cfif IsDefined("form.callerNameTBox") AND form.callerNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.callerNameTBox))#',</cfif>
				<cfif IsDefined("form.callerPhoneTBox") AND form.callerPhoneTBox NEQ "">'#request.cleanNumericString(trim(form.callerPhoneTBox))#',</cfif>
				<cfif IsDefined("form.roomNumberTBox") AND form.roomNumberTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.roomNumberTBox))#',</cfif>
				<cfif IsDefined("form.bedNumberTBox") AND form.bedNumberTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.bedNumberTBox))#',</cfif>
				<cfif IsDefined("form.alternateContactRelationshipTBox") AND form.alternateContactRelationshipTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.alternateContactRelationshipTBox))#',</cfif>
				<cfif IsDefined("form.alternateContactPhoneTBox") AND form.alternateContactPhoneTBox NEQ "">'#request.cleanNumericString(trim(form.alternateContactPhoneTBox))#',</cfif>
				<cfif IsDefined("form.poNumberTBox") AND form.poNumberTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.poNumberTBox))#',</cfif>
				<cfif IsDefined("form.creditCardTypeTBox") AND form.creditCardTypeTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.creditCardTypeTBox))#',</cfif>
				<cfif IsDefined("form.creditCardNumberTBox") AND form.creditCardNumberTBox NEQ "">'#REQUEST.cleanNumericString(trim(form.creditCardNumberTBox))#',</cfif>
				<cfif IsDefined("form.ccDateMM") AND form.ccDateMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.ccDateMM))#',</cfif>
				<cfif IsDefined("form.ccDateDD") AND form.ccDateDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.ccDateDD))#',</cfif>
				<cfif IsDefined("form.ccDateYY") AND form.ccDateYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.ccDateYY))#',</cfif>
				<cfif IsDefined("form.orderingPhysicianPhoneTBox") AND form.orderingPhysicianPhoneTBox NEQ "">'#request.cleanNumericString(trim(form.orderingPhysicianPhoneTBox))#',</cfif>
				<cfif IsDefined("form.orderingPhysicianUPINTBox") AND form.orderingPhysicianUPINTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.orderingPhysicianUPINTBox))#',</cfif>
				<cfif IsDefined("form.orderingPhysicianFaxTBox") AND form.orderingPhysicianFaxTBox NEQ "">'#request.cleanNumericString(trim(form.orderingPhysicianFaxTBox))#',</cfif>
				<cfif IsDefined("form.orderingPhysicianAddressTBox") AND form.orderingPhysicianAddressTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.orderingPhysicianAddressTBox))#',</cfif>
				<cfif IsDefined("form.orderingPhysicianCityTBox") AND form.orderingPhysicianCityTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.orderingPhysicianCityTBox))#',</cfif>
				<cfif IsDefined("form.orderingPhysicianStateTBox") AND form.orderingPhysicianStateTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.orderingPhysicianStateTBox))#',</cfif>
				<cfif IsDefined("form.orderingPhysicianZipTBox") AND form.orderingPhysicianZipTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.orderingPhysicianZipTBox))#',</cfif>
				<cfif IsDefined("form.OPTION_13_CBox_PastEquipmentYes") AND form.OPTION_13_CBox_PastEquipmentYes NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_13_CBox_PastEquipmentYes))#',</cfif>
				<cfif IsDefined("form.OPTION_13_CBox_PastEquipmentNo") AND form.OPTION_13_CBox_PastEquipmentNo NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_13_CBox_PastEquipmentNo))#',</cfif>
				<cfif IsDefined("form.Equipment1TypeTBox") AND form.Equipment1TypeTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment1TypeTBox))#',</cfif>
				<cfif IsDefined("form.Equipment1RentPurchasedSelect") AND form.Equipment1RentPurchasedSelect NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment1RentPurchasedSelect))#',</cfif>
				<cfif IsDefined("form.Equipment1FromMM") AND form.Equipment1FromMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment1FromMM))#',</cfif>
				<cfif IsDefined("form.Equipment1FromDD") AND form.Equipment1FromDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment1FromDD))#',</cfif>
				<cfif IsDefined("form.Equipment1FromYY") AND form.Equipment1FromYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment1FromYY))#',</cfif>
				<cfif IsDefined("form.Equipment1ToMM") AND form.Equipment1ToMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment1ToMM))#',</cfif>
				<cfif IsDefined("form.Equipment1ToDD") AND form.Equipment1ToDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment1ToDD))#',</cfif>
				<cfif IsDefined("form.Equipment1ToYY") AND form.Equipment1ToYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment1ToYY))#',</cfif>
				<cfif IsDefined("form.Equipment1SupplierNameTBox") AND form.Equipment1SupplierNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment1SupplierNameTBox))#',</cfif>
				<cfif IsDefined("form.Equipment1SupplierTelephoneTBox") AND form.Equipment1SupplierTelephoneTBox NEQ "">'#request.cleanNumericString(trim(form.Equipment1SupplierTelephoneTBox))#',</cfif>
				<cfif IsDefined("form.Equipment2TypeTBox") AND form.Equipment2TypeTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment2TypeTBox))#',</cfif>
				<cfif IsDefined("form.Equipment2RentPurchasedSelect") AND form.Equipment2RentPurchasedSelect NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment2RentPurchasedSelect))#',</cfif>
				<cfif IsDefined("form.Equipment2FromMM") AND form.Equipment2FromMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment2FromMM))#',</cfif>
				<cfif IsDefined("form.Equipment2FromDD") AND form.Equipment2FromDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment2FromDD))#',</cfif>
				<cfif IsDefined("form.Equipment2FromYY") AND form.Equipment2FromYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment2FromYY))#',</cfif>
				<cfif IsDefined("form.Equipment2ToMM") AND form.Equipment2ToMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment2ToMM))#',</cfif>
				<cfif IsDefined("form.Equipment2ToDD") AND form.Equipment2ToDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment2ToDD))#',</cfif>
				<cfif IsDefined("form.Equipment2ToYY") AND form.Equipment2ToYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment2ToYY))#',</cfif>
				<cfif IsDefined("form.Equipment2SupplierNameTBox") AND form.Equipment2SupplierNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment2SupplierNameTBox))#',</cfif>
				<cfif IsDefined("form.Equipment2SupplierTelephoneTBox") AND form.Equipment2SupplierTelephoneTBox NEQ "">'#request.cleanNumericString(trim(form.Equipment2SupplierTelephoneTBox))#',</cfif>
				<cfif IsDefined("form.Equipment3TypeTBox") AND form.Equipment3TypeTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment3TypeTBox))#',</cfif>
				<cfif IsDefined("form.Equipment3RentPurchasedSelect") AND form.Equipment3RentPurchasedSelect NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment3RentPurchasedSelect))#',</cfif>
				<cfif IsDefined("form.Equipment3FromMM") AND form.Equipment3FromMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment3FromMM))#',</cfif>
				<cfif IsDefined("form.Equipment3FromDD") AND form.Equipment3FromDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment3FromDD))#',</cfif>
				<cfif IsDefined("form.Equipment3FromYY") AND form.Equipment3FromYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment3FromYY))#',</cfif>
				<cfif IsDefined("form.Equipment3ToMM") AND form.Equipment3ToMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment3ToMM))#',</cfif>
				<cfif IsDefined("form.Equipment3ToDD") AND form.Equipment3ToDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment3ToDD))#',</cfif>
				<cfif IsDefined("form.Equipment3ToYY") AND form.Equipment3ToYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment3ToYY))#',</cfif>
				<cfif IsDefined("form.Equipment3SupplierNameTBox") AND form.Equipment3SupplierNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment3SupplierNameTBox))#',</cfif>
				<cfif IsDefined("form.Equipment3SupplierTelephoneTBox") AND form.Equipment3SupplierTelephoneTBox NEQ "">'#request.cleanNumericString(trim(form.Equipment3SupplierTelephoneTBox))#',</cfif>
				<cfif IsDefined("form.Equipment4TypeTBox") AND form.Equipment4TypeTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment4TypeTBox))#',</cfif>
				<cfif IsDefined("form.Equipment4RentPurchasedSelect") AND form.Equipment4RentPurchasedSelect NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment4RentPurchasedSelect))#',</cfif>
				<cfif IsDefined("form.Equipment4FromMM") AND form.Equipment4FromMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment4FromMM))#',</cfif>
				<cfif IsDefined("form.Equipment4FromDD") AND form.Equipment4FromDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment4FromDD))#',</cfif>
				<cfif IsDefined("form.Equipment4FromYY") AND form.Equipment4FromYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment4FromYY))#',</cfif>
				<cfif IsDefined("form.Equipment4ToMM") AND form.Equipment4ToMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment4ToMM))#',</cfif>
				<cfif IsDefined("form.Equipment4ToDD") AND form.Equipment4ToDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment4ToDD))#',</cfif>
				<cfif IsDefined("form.Equipment4ToYY") AND form.Equipment4ToYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment4ToYY))#',</cfif>
				<cfif IsDefined("form.Equipment4SupplierNameTBox") AND form.Equipment4SupplierNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment4SupplierNameTBox))#',</cfif>
				<cfif IsDefined("form.Equipment4SupplierTelephoneTBox") AND form.Equipment4SupplierTelephoneTBox NEQ "">'#request.cleanNumericString(trim(form.Equipment4SupplierTelephoneTBox))#',</cfif>
				<cfif IsDefined("form.Equipment5TypeTBox") AND form.Equipment5TypeTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment5TypeTBox))#',</cfif>
				<cfif IsDefined("form.Equipment1NoteTBox") AND form.Equipment1NoteTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment1NoteTBox))#',</cfif>
				<cfif IsDefined("form.Equipment2NoteTBox") AND form.Equipment2NoteTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment2NoteTBox))#',</cfif>
				<cfif IsDefined("form.Equipment3NoteTBox") AND form.Equipment3NoteTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment3NoteTBox))#',</cfif>
				<cfif IsDefined("form.Equipment4NoteTBox") AND form.Equipment4NoteTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment4NoteTBox))#',</cfif>
				<cfif IsDefined("form.Equipment5NoteTBox") AND form.Equipment5NoteTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment5NoteTBox))#',</cfif>
				<cfif IsDefined("form.Equipment5RentPurchasedSelect") AND form.Equipment5RentPurchasedSelect NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment5RentPurchasedSelect))#',</cfif>
				<cfif IsDefined("form.Equipment5FromMM") AND form.Equipment5FromMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment5FromMM))#',</cfif>
				<cfif IsDefined("form.Equipment5FromDD") AND form.Equipment5FromDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment5FromDD))#',</cfif>
				<cfif IsDefined("form.Equipment5FromYY") AND form.Equipment5FromYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment5FromYY))#',</cfif>
				<cfif IsDefined("form.Equipment5ToMM") AND form.Equipment5ToMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment5ToMM))#',</cfif>
				<cfif IsDefined("form.Equipment5ToDD") AND form.Equipment5ToDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment5ToDD))#',</cfif>
				<cfif IsDefined("form.Equipment5ToYY") AND form.Equipment5ToYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment5ToYY))#',</cfif>
				<cfif IsDefined("form.Equipment5SupplierNameTBox") AND form.Equipment5SupplierNameTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.Equipment5SupplierNameTBox))#',</cfif>
				<cfif IsDefined("form.Equipment5SupplierTelephoneTBox") AND form.Equipment5SupplierTelephoneTBox NEQ "">'#request.cleanNumericString(trim(form.Equipment5SupplierTelephoneTBox))#',</cfif>
				<cfif IsDefined("form.OPTION_14_CBox_OxygenPAo2") AND form.OPTION_14_CBox_OxygenPAo2 NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_14_CBox_OxygenPAo2))#',</cfif>
				<cfif IsDefined("form.OPTION_14_CBox_OxygenSAo2") AND form.OPTION_14_CBox_OxygenSAo2 NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_14_CBox_OxygenSAo2))#',</cfif>
				<cfif IsDefined("form.OPTION_14_CBox_OxygenSPo2") AND form.OPTION_14_CBox_OxygenSPo2 NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OPTION_14_CBox_OxygenSPo2))#',</cfif>
				<cfif IsDefined("form.OxygenPAO2TBox") AND form.OxygenPAO2TBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OxygenPAO2TBox))#',</cfif>
				<cfif IsDefined("form.OxygenSAO2TBox") AND form.OxygenSAO2TBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OxygenSAO2TBox))#',</cfif>
				<cfif IsDefined("form.CPAPStudy_CBox") AND form.CPAPStudy_CBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.CPAPStudy_CBox))#',</cfif>
				<cfif IsDefined("form.CPAPStudyNote") AND form.CPAPStudyNote NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.CPAPStudyNote))#',</cfif>
				<cfif IsDefined("form.OxygenSPO2TBox") AND form.OxygenSPO2TBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.OxygenSPO2TBox))#',</cfif>
				<cfif IsDefined("form.CPAPStudyOnFile_CBox") AND form.CPAPStudyOnFile_CBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.CPAPStudyOnFile_CBox))#',</cfif>
				<cfif IsDefined("form.CPAPStudyOnFileNote") AND form.CPAPStudyOnFileNote NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.CPAPStudyOnFileNote))#',</cfif>
				<cfif IsDefined("form.LabTestDateMM") AND form.LabTestDateMM NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.LabTestDateMM))#',</cfif>
				<cfif IsDefined("form.LabTestDateDD") AND form.LabTestDateDD NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.LabTestDateDD))#',</cfif>
				<cfif IsDefined("form.LabTestDateYY") AND form.LabTestDateYY NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.LabTestDateYY))#',</cfif>
				<cfif IsDefined("form.CPAPStudyPerformedAt") AND form.CPAPStudyPerformedAt NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.CPAPStudyPerformedAt))#',</cfif>
				<cfif IsDefined("form.LabTestFacilityTBox") AND form.LabTestFacilityTBox NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.LabTestFacilityTBox))#',</cfif>
				<cfif IsDefined("form.CPAPStudyPerformedAt2") AND form.CPAPStudyPerformedAt2 NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.CPAPStudyPerformedAt2))#',</cfif>
				<cfif IsDefined("form.CPAPStudyPerformedAt3") AND form.CPAPStudyPerformedAt3 NEQ "">'#REQUEST.mssqlReplaceSingleQuote(trim(form.CPAPStudyPerformedAt3))#',</cfif>
				'#trim(form.hidden_TimeStart)#'
			);
			SELECT LAST_INSERT_ID() AS intakeID 
			</cfoutput>
		</cfsavecontent>
		
		
		<cfmail from="support@eobmanager.net" to="support@eobmanager.net" subject="GOOD INSERT There was an issue processing the page. Please try your intake again. - #DateFormat( now(), 'm/d/yyyy' )# #TimeFormat( now() )#" type="HTML">
			#PreserveSingleQuotes(sqlStatement)#
		</cfmail>

		<!-------------------------------------------------------------------------------------->
		<!--- Run the query that was just built.                                             --->
		<!-------------------------------------------------------------------------------------->
		<cfquery name="insertIntake" datasource="#trim(request.datasource)#">
			#PreserveSingleQuotes(sqlStatement)#
		</cfquery>

		<!-------------------------------------------------------------------------------------->
		<!--- Set the intakeID                                                               --->
		<!-------------------------------------------------------------------------------------->
		<cfset intakeID = insertIntake.intakeID>
		
		
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Save the HCPC codes.                                                           --->
		<!-------------------------------------------------------------------------------------->		
		<cfsavecontent variable="sqlStatementHCPC">
			<cfoutput>
				INSERT INTO IntakeHCPC(
			 		IntakeID					 
					<cfif IsDefined("form.hcpcCost1TBox") AND form.hcpcCost1TBox NEQ "">,hcpcCost1TBox</cfif>
					<cfif IsDefined("form.hcpcCode1TBox") AND form.hcpcCode1TBox NEQ "">,hcpcCode1TBox</cfif>
					<cfif IsDefined("form.hcpcQty1TBox") AND form.hcpcQty1TBox NEQ "">,hcpcQty1TBox</cfif>
					<cfif IsDefined("form.hcpcProduct1TBox") AND form.hcpcProduct1TBox NEQ "">,hcpcProduct1TBox</cfif>
					<cfif IsDefined("form.hcpcDX1TBox") AND form.hcpcDX1TBox NEQ "">,hcpcDX1TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis1TBox") AND form.hcpcDiagnosis1TBox NEQ "">,hcpcDiagnosis1TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear1TBox") AND form.hcpcLengthOfNeedYear1TBox NEQ "">,hcpcLengthOfNeedYear1TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth1TBox") AND form.hcpcLengthOfNeedMonth1TBox NEQ "">,hcpcLengthOfNeedMonth1TBox</cfif>
					<cfif IsDefined("form.hcpcCost2TBox") AND form.hcpcCost2TBox NEQ "">,hcpcCost2TBox</cfif>
					<cfif IsDefined("form.hcpcCode2TBox") AND form.hcpcCode2TBox NEQ "">,hcpcCode2TBox</cfif>
					<cfif IsDefined("form.hcpcQty2TBox") AND form.hcpcQty2TBox NEQ "">,hcpcQty2TBox</cfif>
					<cfif IsDefined("form.hcpcProduct2TBox") AND form.hcpcProduct2TBox NEQ "">,hcpcProduct2TBox</cfif>
					<cfif IsDefined("form.hcpcDX2TBox") AND form.hcpcDX2TBox NEQ "">,hcpcDX2TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis2TBox") AND form.hcpcDiagnosis2TBox NEQ "">,hcpcDiagnosis2TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear2TBox") AND form.hcpcLengthOfNeedYear2TBox NEQ "">,hcpcLengthOfNeedYear2TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth2TBox") AND form.hcpcLengthOfNeedMonth2TBox NEQ "">,hcpcLengthOfNeedMonth2TBox</cfif>
					<cfif IsDefined("form.hcpcCost3TBox") AND form.hcpcCost3TBox NEQ "">,hcpcCost3TBox</cfif>
					<cfif IsDefined("form.hcpcCode3TBox") AND form.hcpcCode3TBox NEQ "">,hcpcCode3TBox</cfif>
					<cfif IsDefined("form.hcpcQty3TBox") AND form.hcpcQty3TBox NEQ "">,hcpcQty3TBox</cfif>
					<cfif IsDefined("form.hcpcProduct3TBox") AND form.hcpcProduct3TBox NEQ "">,hcpcProduct3TBox</cfif>
					<cfif IsDefined("form.hcpcDX3TBox") AND form.hcpcDX3TBox NEQ "">,hcpcDX3TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis3TBox") AND form.hcpcDiagnosis3TBox NEQ "">,hcpcDiagnosis3TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear3TBox") AND form.hcpcLengthOfNeedYear3TBox NEQ "">,hcpcLengthOfNeedYear3TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth3TBox") AND form.hcpcLengthOfNeedMonth3TBox NEQ "">,hcpcLengthOfNeedMonth3TBox</cfif>
					<cfif IsDefined("form.hcpcCost4TBox") AND form.hcpcCost4TBox NEQ "">,hcpcCost4TBox</cfif>
					<cfif IsDefined("form.hcpcCode4TBox") AND form.hcpcCode4TBox NEQ "">,hcpcCode4TBox</cfif>
					<cfif IsDefined("form.hcpcQty4TBox") AND form.hcpcQty4TBox NEQ "">,hcpcQty4TBox</cfif>
					<cfif IsDefined("form.hcpcProduct4TBox") AND form.hcpcProduct4TBox NEQ "">,hcpcProduct4TBox</cfif>
					<cfif IsDefined("form.hcpcDX4TBox") AND form.hcpcDX4TBox NEQ "">,hcpcDX4TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis4TBox") AND form.hcpcDiagnosis4TBox NEQ "">,hcpcDiagnosis4TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear4TBox") AND form.hcpcLengthOfNeedYear4TBox NEQ "">,hcpcLengthOfNeedYear4TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth4TBox") AND form.hcpcLengthOfNeedMonth4TBox NEQ "">,hcpcLengthOfNeedMonth4TBox</cfif>
					<cfif IsDefined("form.hcpcCost5TBox") AND form.hcpcCost5TBox NEQ "">,hcpcCost5TBox</cfif>
					<cfif IsDefined("form.hcpcCode5TBox") AND form.hcpcCode5TBox NEQ "">,hcpcCode5TBox</cfif>
					<cfif IsDefined("form.hcpcQty5TBox") AND form.hcpcQty5TBox NEQ "">,hcpcQty5TBox</cfif>
					<cfif IsDefined("form.hcpcProduct5TBox") AND form.hcpcProduct5TBox NEQ "">,hcpcProduct5TBox</cfif>
					<cfif IsDefined("form.hcpcDX5TBox") AND form.hcpcDX5TBox NEQ "">,hcpcDX5TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis5TBox") AND form.hcpcDiagnosis5TBox NEQ "">,hcpcDiagnosis5TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear5TBox") AND form.hcpcLengthOfNeedYear5TBox NEQ "">,hcpcLengthOfNeedYear5TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth5TBox") AND form.hcpcLengthOfNeedMonth5TBox NEQ "">,hcpcLengthOfNeedMonth5TBox</cfif>
					<cfif IsDefined("form.hcpcCost6TBox") AND form.hcpcCost6TBox NEQ "">,hcpcCost6TBox</cfif>
					<cfif IsDefined("form.hcpcCode6TBox") AND form.hcpcCode6TBox NEQ "">,hcpcCode6TBox</cfif>
					<cfif IsDefined("form.hcpcQty6TBox") AND form.hcpcQty6TBox NEQ "">,hcpcQty6TBox</cfif>
					<cfif IsDefined("form.hcpcProduct6TBox") AND form.hcpcProduct6TBox NEQ "">,hcpcProduct6TBox</cfif>
					<cfif IsDefined("form.hcpcDX6TBox") AND form.hcpcDX6TBox NEQ "">,hcpcDX6TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis6TBox") AND form.hcpcDiagnosis6TBox NEQ "">,hcpcDiagnosis6TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear6TBox") AND form.hcpcLengthOfNeedYear6TBox NEQ "">,hcpcLengthOfNeedYear6TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth6TBox") AND form.hcpcLengthOfNeedMonth6TBox NEQ "">,hcpcLengthOfNeedMonth6TBox</cfif>
					<cfif IsDefined("form.hcpcCost7TBox") AND form.hcpcCost7TBox NEQ "">,hcpcCost7TBox</cfif>
					<cfif IsDefined("form.hcpcCode7TBox") AND form.hcpcCode7TBox NEQ "">,hcpcCode7TBox</cfif>
					<cfif IsDefined("form.hcpcQty7TBox") AND form.hcpcQty7TBox NEQ "">,hcpcQty7TBox</cfif>
					<cfif IsDefined("form.hcpcProduct7TBox") AND form.hcpcProduct7TBox NEQ "">,hcpcProduct7TBox</cfif>
					<cfif IsDefined("form.hcpcDX7TBox") AND form.hcpcDX7TBox NEQ "">,hcpcDX7TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis7TBox") AND form.hcpcDiagnosis7TBox NEQ "">,hcpcDiagnosis7TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear7TBox") AND form.hcpcLengthOfNeedYear7TBox NEQ "">,hcpcLengthOfNeedYear7TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth7TBox") AND form.hcpcLengthOfNeedMonth7TBox NEQ "">,hcpcLengthOfNeedMonth7TBox</cfif>
					<cfif IsDefined("form.hcpcCost8TBox") AND form.hcpcCost8TBox NEQ "">,hcpcCost8TBox</cfif>
					<cfif IsDefined("form.hcpcCode8TBox") AND form.hcpcCode8TBox NEQ "">,hcpcCode8TBox</cfif>
					<cfif IsDefined("form.hcpcQty8TBox") AND form.hcpcQty8TBox NEQ "">,hcpcQty8TBox</cfif>
					<cfif IsDefined("form.hcpcProduct8TBox") AND form.hcpcProduct8TBox NEQ "">,hcpcProduct8TBox</cfif>
					<cfif IsDefined("form.hcpcDX8TBox") AND form.hcpcDX8TBox NEQ "">,hcpcDX8TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis8TBox") AND form.hcpcDiagnosis8TBox NEQ "">,hcpcDiagnosis8TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear8TBox") AND form.hcpcLengthOfNeedYear8TBox NEQ "">,hcpcLengthOfNeedYear8TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth8TBox") AND form.hcpcLengthOfNeedMonth8TBox NEQ "">,hcpcLengthOfNeedMonth8TBox</cfif>
					<cfif IsDefined("form.hcpcCost9TBox") AND form.hcpcCost9TBox NEQ "">,hcpcCost9TBox</cfif>
					<cfif IsDefined("form.hcpcCode9TBox") AND form.hcpcCode9TBox NEQ "">,hcpcCode9TBox</cfif>
					<cfif IsDefined("form.hcpcQty9TBox") AND form.hcpcQty9TBox NEQ "">,hcpcQty9TBox</cfif>
					<cfif IsDefined("form.hcpcProduct9TBox") AND form.hcpcProduct9TBox NEQ "">,hcpcProduct9TBox</cfif>
					<cfif IsDefined("form.hcpcDX9TBox") AND form.hcpcDX9TBox NEQ "">,hcpcDX9TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis9TBox") AND form.hcpcDiagnosis9TBox NEQ "">,hcpcDiagnosis9TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear9TBox") AND form.hcpcLengthOfNeedYear9TBox NEQ "">,hcpcLengthOfNeedYear9TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth9TBox") AND form.hcpcLengthOfNeedMonth9TBox NEQ "">,hcpcLengthOfNeedMonth9TBox</cfif>
					<cfif IsDefined("form.hcpcCost10TBox") AND form.hcpcCost10TBox NEQ "">,hcpcCost10TBox</cfif>
					<cfif IsDefined("form.hcpcCode10TBox") AND form.hcpcCode10TBox NEQ "">,hcpcCode10TBox</cfif>
					<cfif IsDefined("form.hcpcQty10TBox") AND form.hcpcQty10TBox NEQ "">,hcpcQty10TBox</cfif>
					<cfif IsDefined("form.hcpcProduct10TBox") AND form.hcpcProduct10TBox NEQ "">,hcpcProduct10TBox</cfif>
					<cfif IsDefined("form.hcpcDX10TBox") AND form.hcpcDX10TBox NEQ "">,hcpcDX10TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis10TBox") AND form.hcpcDiagnosis10TBox NEQ "">,hcpcDiagnosis10TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear10TBox") AND form.hcpcLengthOfNeedYear10TBox NEQ "">,hcpcLengthOfNeedYear10TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth10TBox") AND form.hcpcLengthOfNeedMonth10TBox NEQ "">,hcpcLengthOfNeedMonth10TBox</cfif>
					<cfif IsDefined("form.hcpcCost11TBox") AND form.hcpcCost11TBox NEQ "">,hcpcCost11TBox</cfif>
					<cfif IsDefined("form.hcpcCode11TBox") AND form.hcpcCode11TBox NEQ "">,hcpcCode11TBox</cfif>
					<cfif IsDefined("form.hcpcQty11TBox") AND form.hcpcQty11TBox NEQ "">,hcpcQty11TBox</cfif>
					<cfif IsDefined("form.hcpcProduct11TBox") AND form.hcpcProduct11TBox NEQ "">,hcpcProduct11TBox</cfif>
					<cfif IsDefined("form.hcpcDX11TBox") AND form.hcpcDX11TBox NEQ "">,hcpcDX11TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis11TBox") AND form.hcpcDiagnosis11TBox NEQ "">,hcpcDiagnosis11TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear11TBox") AND form.hcpcLengthOfNeedYear11TBox NEQ "">,hcpcLengthOfNeedYear11TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth11TBox") AND form.hcpcLengthOfNeedMonth11TBox NEQ "">,hcpcLengthOfNeedMonth11TBox</cfif>
					<cfif IsDefined("form.hcpcCost12TBox") AND form.hcpcCost12TBox NEQ "">,hcpcCost12TBox</cfif>
					<cfif IsDefined("form.hcpcCode12TBox") AND form.hcpcCode12TBox NEQ "">,hcpcCode12TBox</cfif>
					<cfif IsDefined("form.hcpcQty12TBox") AND form.hcpcQty12TBox NEQ "">,hcpcQty12TBox</cfif>
					<cfif IsDefined("form.hcpcProduct12TBox") AND form.hcpcProduct12TBox NEQ "">,hcpcProduct12TBox</cfif>
					<cfif IsDefined("form.hcpcDX12TBox") AND form.hcpcDX12TBox NEQ "">,hcpcDX12TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis12TBox") AND form.hcpcDiagnosis12TBox NEQ "">,hcpcDiagnosis12TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear12TBox") AND form.hcpcLengthOfNeedYear12TBox NEQ "">,hcpcLengthOfNeedYear12TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth12TBox") AND form.hcpcLengthOfNeedMonth12TBox NEQ "">,hcpcLengthOfNeedMonth12TBox</cfif>
					<cfif IsDefined("form.hcpcCost13TBox") AND form.hcpcCost13TBox NEQ "">,hcpcCost13TBox</cfif>
					<cfif IsDefined("form.hcpcCode13TBox") AND form.hcpcCode13TBox NEQ "">,hcpcCode13TBox</cfif>
					<cfif IsDefined("form.hcpcQty13TBox") AND form.hcpcQty13TBox NEQ "">,hcpcQty13TBox</cfif>
					<cfif IsDefined("form.hcpcProduct13TBox") AND form.hcpcProduct13TBox NEQ "">,hcpcProduct13TBox</cfif>
					<cfif IsDefined("form.hcpcDX13TBox") AND form.hcpcDX13TBox NEQ "">,hcpcDX13TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis13TBox") AND form.hcpcDiagnosis13TBox NEQ "">,hcpcDiagnosis13TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear13TBox") AND form.hcpcLengthOfNeedYear13TBox NEQ "">,hcpcLengthOfNeedYear13TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth13TBox") AND form.hcpcLengthOfNeedMonth13TBox NEQ "">,hcpcLengthOfNeedMonth13TBox</cfif>
					<cfif IsDefined("form.hcpcCost14TBox") AND form.hcpcCost14TBox NEQ "">,hcpcCost14TBox</cfif>
					<cfif IsDefined("form.hcpcCode14TBox") AND form.hcpcCode14TBox NEQ "">,hcpcCode14TBox</cfif>
					<cfif IsDefined("form.hcpcQty14TBox") AND form.hcpcQty14TBox NEQ "">,hcpcQty14TBox</cfif>
					<cfif IsDefined("form.hcpcProduct14TBox") AND form.hcpcProduct14TBox NEQ "">,hcpcProduct14TBox</cfif>
					<cfif IsDefined("form.hcpcDX14TBox") AND form.hcpcDX14TBox NEQ "">,hcpcDX14TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis14TBox") AND form.hcpcDiagnosis14TBox NEQ "">,hcpcDiagnosis14TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear14TBox") AND form.hcpcLengthOfNeedYear14TBox NEQ "">,hcpcLengthOfNeedYear14TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth14TBox") AND form.hcpcLengthOfNeedMonth14TBox NEQ "">,hcpcLengthOfNeedMonth14TBox</cfif>
					<cfif IsDefined("form.hcpcCost15TBox") AND form.hcpcCost15TBox NEQ "">,hcpcCost15TBox</cfif>
					<cfif IsDefined("form.hcpcCode15TBox") AND form.hcpcCode15TBox NEQ "">,hcpcCode15TBox</cfif>
					<cfif IsDefined("form.hcpcQty15TBox") AND form.hcpcQty15TBox NEQ "">,hcpcQty15TBox</cfif>
					<cfif IsDefined("form.hcpcProduct15TBox") AND form.hcpcProduct15TBox NEQ "">,hcpcProduct15TBox</cfif>
					<cfif IsDefined("form.hcpcDX15TBox") AND form.hcpcDX15TBox NEQ "">,hcpcDX15TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis15TBox") AND form.hcpcDiagnosis15TBox NEQ "">,hcpcDiagnosis15TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear15TBox") AND form.hcpcLengthOfNeedYear15TBox NEQ "">,hcpcLengthOfNeedYear15TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth15TBox") AND form.hcpcLengthOfNeedMonth15TBox NEQ "">,hcpcLengthOfNeedMonth15TBox</cfif>
					<cfif IsDefined("form.hcpcCost16TBox") AND form.hcpcCost16TBox NEQ "">,hcpcCost16TBox</cfif>
					<cfif IsDefined("form.hcpcCode16TBox") AND form.hcpcCode16TBox NEQ "">,hcpcCode16TBox</cfif>
					<cfif IsDefined("form.hcpcQty16TBox") AND form.hcpcQty16TBox NEQ "">,hcpcQty16TBox</cfif>
					<cfif IsDefined("form.hcpcProduct16TBox") AND form.hcpcProduct16TBox NEQ "">,hcpcProduct16TBox</cfif>
					<cfif IsDefined("form.hcpcDX16TBox") AND form.hcpcDX16TBox NEQ "">,hcpcDX16TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis16TBox") AND form.hcpcDiagnosis16TBox NEQ "">,hcpcDiagnosis16TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear16TBox") AND form.hcpcLengthOfNeedYear16TBox NEQ "">,hcpcLengthOfNeedYear16TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth16TBox") AND form.hcpcLengthOfNeedMonth16TBox NEQ "">,hcpcLengthOfNeedMonth16TBox</cfif>
					<cfif IsDefined("form.hcpcCost17TBox") AND form.hcpcCost17TBox NEQ "">,hcpcCost17TBox</cfif>
					<cfif IsDefined("form.hcpcCode17TBox") AND form.hcpcCode17TBox NEQ "">,hcpcCode17TBox</cfif>
					<cfif IsDefined("form.hcpcQty17TBox") AND form.hcpcQty17TBox NEQ "">,hcpcQty17TBox</cfif>
					<cfif IsDefined("form.hcpcProduct17TBox") AND form.hcpcProduct17TBox NEQ "">,hcpcProduct17TBox</cfif>
					<cfif IsDefined("form.hcpcDX17TBox") AND form.hcpcDX17TBox NEQ "">,hcpcDX17TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis17TBox") AND form.hcpcDiagnosis17TBox NEQ "">,hcpcDiagnosis17TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear17TBox") AND form.hcpcLengthOfNeedYear17TBox NEQ "">,hcpcLengthOfNeedYear17TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth17TBox") AND form.hcpcLengthOfNeedMonth17TBox NEQ "">,hcpcLengthOfNeedMonth17TBox</cfif>
					<cfif IsDefined("form.hcpcCost18TBox") AND form.hcpcCost18TBox NEQ "">,hcpcCost18TBox</cfif>
					<cfif IsDefined("form.hcpcCode18TBox") AND form.hcpcCode18TBox NEQ "">,hcpcCode18TBox</cfif>
					<cfif IsDefined("form.hcpcQty18TBox") AND form.hcpcQty18TBox NEQ "">,hcpcQty18TBox</cfif>
					<cfif IsDefined("form.hcpcProduct18TBox") AND form.hcpcProduct18TBox NEQ "">,hcpcProduct18TBox</cfif>
					<cfif IsDefined("form.hcpcDX18TBox") AND form.hcpcDX18TBox NEQ "">,hcpcDX18TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis18TBox") AND form.hcpcDiagnosis18TBox NEQ "">,hcpcDiagnosis18TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear18TBox") AND form.hcpcLengthOfNeedYear18TBox NEQ "">,hcpcLengthOfNeedYear18TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth18TBox") AND form.hcpcLengthOfNeedMonth18TBox NEQ "">,hcpcLengthOfNeedMonth18TBox</cfif>
					<cfif IsDefined("form.hcpcCost19TBox") AND form.hcpcCost19TBox NEQ "">,hcpcCost19TBox</cfif>
					<cfif IsDefined("form.hcpcCode19TBox") AND form.hcpcCode19TBox NEQ "">,hcpcCode19TBox</cfif>
					<cfif IsDefined("form.hcpcQty19TBox") AND form.hcpcQty19TBox NEQ "">,hcpcQty19TBox</cfif>
					<cfif IsDefined("form.hcpcProduct19TBox") AND form.hcpcProduct19TBox NEQ "">,hcpcProduct19TBox</cfif>
					<cfif IsDefined("form.hcpcDX19TBox") AND form.hcpcDX19TBox NEQ "">,hcpcDX19TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis19TBox") AND form.hcpcDiagnosis19TBox NEQ "">,hcpcDiagnosis19TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear19TBox") AND form.hcpcLengthOfNeedYear19TBox NEQ "">,hcpcLengthOfNeedYear19TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth19TBox") AND form.hcpcLengthOfNeedMonth19TBox NEQ "">,hcpcLengthOfNeedMonth19TBox</cfif>
					<cfif IsDefined("form.hcpcCost20TBox") AND form.hcpcCost20TBox NEQ "">,hcpcCost20TBox</cfif>
					<cfif IsDefined("form.hcpcCode20TBox") AND form.hcpcCode20TBox NEQ "">,hcpcCode20TBox</cfif>
					<cfif IsDefined("form.hcpcQty20TBox") AND form.hcpcQty20TBox NEQ "">,hcpcQty20TBox</cfif>
					<cfif IsDefined("form.hcpcProduct20TBox") AND form.hcpcProduct20TBox NEQ "">,hcpcProduct20TBox</cfif>
					<cfif IsDefined("form.hcpcDX20TBox") AND form.hcpcDX20TBox NEQ "">,hcpcDX20TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis20TBox") AND form.hcpcDiagnosis20TBox NEQ "">,hcpcDiagnosis20TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear20TBox") AND form.hcpcLengthOfNeedYear20TBox NEQ "">,hcpcLengthOfNeedYear20TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth20TBox") AND form.hcpcLengthOfNeedMonth20TBox NEQ "">,hcpcLengthOfNeedMonth20TBox</cfif>
					<cfif IsDefined("form.hcpcCost21TBox") AND form.hcpcCost21TBox NEQ "">,hcpcCost21TBox</cfif>
					<cfif IsDefined("form.hcpcCode21TBox") AND form.hcpcCode21TBox NEQ "">,hcpcCode21TBox</cfif>
					<cfif IsDefined("form.hcpcQty21TBox") AND form.hcpcQty21TBox NEQ "">,hcpcQty21TBox</cfif>
					<cfif IsDefined("form.hcpcProduct21TBox") AND form.hcpcProduct21TBox NEQ "">,hcpcProduct21TBox</cfif>
					<cfif IsDefined("form.hcpcDX21TBox") AND form.hcpcDX21TBox NEQ "">,hcpcDX21TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis21TBox") AND form.hcpcDiagnosis21TBox NEQ "">,hcpcDiagnosis21TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear21TBox") AND form.hcpcLengthOfNeedYear21TBox NEQ "">,hcpcLengthOfNeedYear21TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth21TBox") AND form.hcpcLengthOfNeedMonth21TBox NEQ "">,hcpcLengthOfNeedMonth21TBox</cfif>
					<cfif IsDefined("form.hcpcCost22TBox") AND form.hcpcCost22TBox NEQ "">,hcpcCost22TBox</cfif>
					<cfif IsDefined("form.hcpcCode22TBox") AND form.hcpcCode22TBox NEQ "">,hcpcCode22TBox</cfif>
					<cfif IsDefined("form.hcpcQty22TBox") AND form.hcpcQty22TBox NEQ "">,hcpcQty22TBox</cfif>
					<cfif IsDefined("form.hcpcProduct22TBox") AND form.hcpcProduct22TBox NEQ "">,hcpcProduct22TBox</cfif>
					<cfif IsDefined("form.hcpcDX22TBox") AND form.hcpcDX22TBox NEQ "">,hcpcDX22TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis22TBox") AND form.hcpcDiagnosis22TBox NEQ "">,hcpcDiagnosis22TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear22TBox") AND form.hcpcLengthOfNeedYear22TBox NEQ "">,hcpcLengthOfNeedYear22TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth22TBox") AND form.hcpcLengthOfNeedMonth22TBox NEQ "">,hcpcLengthOfNeedMonth22TBox</cfif>
					<cfif IsDefined("form.hcpcCost23TBox") AND form.hcpcCost23TBox NEQ "">,hcpcCost23TBox</cfif>
					<cfif IsDefined("form.hcpcCode23TBox") AND form.hcpcCode23TBox NEQ "">,hcpcCode23TBox</cfif>
					<cfif IsDefined("form.hcpcQty23TBox") AND form.hcpcQty23TBox NEQ "">,hcpcQty23TBox</cfif>
					<cfif IsDefined("form.hcpcProduct23TBox") AND form.hcpcProduct23TBox NEQ "">,hcpcProduct23TBox</cfif>
					<cfif IsDefined("form.hcpcDX23TBox") AND form.hcpcDX23TBox NEQ "">,hcpcDX23TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis23TBox") AND form.hcpcDiagnosis23TBox NEQ "">,hcpcDiagnosis23TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear23TBox") AND form.hcpcLengthOfNeedYear23TBox NEQ "">,hcpcLengthOfNeedYear23TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth23TBox") AND form.hcpcLengthOfNeedMonth23TBox NEQ "">,hcpcLengthOfNeedMonth23TBox</cfif>
					<cfif IsDefined("form.hcpcCost24TBox") AND form.hcpcCost24TBox NEQ "">,hcpcCost24TBox</cfif>
					<cfif IsDefined("form.hcpcCode24TBox") AND form.hcpcCode24TBox NEQ "">,hcpcCode24TBox</cfif>
					<cfif IsDefined("form.hcpcQty24TBox") AND form.hcpcQty24TBox NEQ "">,hcpcQty24TBox</cfif>
					<cfif IsDefined("form.hcpcProduct24TBox") AND form.hcpcProduct24TBox NEQ "">,hcpcProduct24TBox</cfif>
					<cfif IsDefined("form.hcpcDX24TBox") AND form.hcpcDX24TBox NEQ "">,hcpcDX24TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis24TBox") AND form.hcpcDiagnosis24TBox NEQ "">,hcpcDiagnosis24TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear24TBox") AND form.hcpcLengthOfNeedYear24TBox NEQ "">,hcpcLengthOfNeedYear24TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth24TBox") AND form.hcpcLengthOfNeedMonth24TBox NEQ "">,hcpcLengthOfNeedMonth24TBox</cfif>
					<cfif IsDefined("form.hcpcCost25TBox") AND form.hcpcCost25TBox NEQ "">,hcpcCost25TBox</cfif>
					<cfif IsDefined("form.hcpcCode25TBox") AND form.hcpcCode25TBox NEQ "">,hcpcCode25TBox</cfif>
					<cfif IsDefined("form.hcpcQty25TBox") AND form.hcpcQty25TBox NEQ "">,hcpcQty25TBox</cfif>
					<cfif IsDefined("form.hcpcProduct25TBox") AND form.hcpcProduct25TBox NEQ "">,hcpcProduct25TBox</cfif>
					<cfif IsDefined("form.hcpcDX25TBox") AND form.hcpcDX25TBox NEQ "">,hcpcDX25TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis25TBox") AND form.hcpcDiagnosis25TBox NEQ "">,hcpcDiagnosis25TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear25TBox") AND form.hcpcLengthOfNeedYear25TBox NEQ "">,hcpcLengthOfNeedYear25TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth25TBox") AND form.hcpcLengthOfNeedMonth25TBox NEQ "">,hcpcLengthOfNeedMonth25TBox</cfif>
					<cfif IsDefined("form.hcpcCost26TBox") AND form.hcpcCost26TBox NEQ "">,hcpcCost26TBox</cfif>
					<cfif IsDefined("form.hcpcCode26TBox") AND form.hcpcCode26TBox NEQ "">,hcpcCode26TBox</cfif>
					<cfif IsDefined("form.hcpcQty26TBox") AND form.hcpcQty26TBox NEQ "">,hcpcQty26TBox</cfif>
					<cfif IsDefined("form.hcpcProduct26TBox") AND form.hcpcProduct26TBox NEQ "">,hcpcProduct26TBox</cfif>
					<cfif IsDefined("form.hcpcDX26TBox") AND form.hcpcDX26TBox NEQ "">,hcpcDX26TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis26TBox") AND form.hcpcDiagnosis26TBox NEQ "">,hcpcDiagnosis26TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear26TBox") AND form.hcpcLengthOfNeedYear26TBox NEQ "">,hcpcLengthOfNeedYear26TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth26TBox") AND form.hcpcLengthOfNeedMonth26TBox NEQ "">,hcpcLengthOfNeedMonth26TBox</cfif>
					<cfif IsDefined("form.hcpcCost27TBox") AND form.hcpcCost27TBox NEQ "">,hcpcCost27TBox</cfif>
					<cfif IsDefined("form.hcpcCode27TBox") AND form.hcpcCode27TBox NEQ "">,hcpcCode27TBox</cfif>
					<cfif IsDefined("form.hcpcQty27TBox") AND form.hcpcQty27TBox NEQ "">,hcpcQty27TBox</cfif>
					<cfif IsDefined("form.hcpcProduct27TBox") AND form.hcpcProduct27TBox NEQ "">,hcpcProduct27TBox</cfif>
					<cfif IsDefined("form.hcpcDX27TBox") AND form.hcpcDX27TBox NEQ "">,hcpcDX27TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis27TBox") AND form.hcpcDiagnosis27TBox NEQ "">,hcpcDiagnosis27TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear27TBox") AND form.hcpcLengthOfNeedYear27TBox NEQ "">,hcpcLengthOfNeedYear27TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth27TBox") AND form.hcpcLengthOfNeedMonth27TBox NEQ "">,hcpcLengthOfNeedMonth27TBox</cfif>
					<cfif IsDefined("form.hcpcCost28TBox") AND form.hcpcCost28TBox NEQ "">,hcpcCost28TBox</cfif>
					<cfif IsDefined("form.hcpcCode28TBox") AND form.hcpcCode28TBox NEQ "">,hcpcCode28TBox</cfif>
					<cfif IsDefined("form.hcpcQty28TBox") AND form.hcpcQty28TBox NEQ "">,hcpcQty28TBox</cfif>
					<cfif IsDefined("form.hcpcProduct28TBox") AND form.hcpcProduct28TBox NEQ "">,hcpcProduct28TBox</cfif>
					<cfif IsDefined("form.hcpcDX28TBox") AND form.hcpcDX28TBox NEQ "">,hcpcDX28TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis28TBox") AND form.hcpcDiagnosis28TBox NEQ "">,hcpcDiagnosis28TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear28TBox") AND form.hcpcLengthOfNeedYear28TBox NEQ "">,hcpcLengthOfNeedYear28TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth28TBox") AND form.hcpcLengthOfNeedMonth28TBox NEQ "">,hcpcLengthOfNeedMonth28TBox</cfif>
					<cfif IsDefined("form.hcpcCost29TBox") AND form.hcpcCost29TBox NEQ "">,hcpcCost29TBox</cfif>
					<cfif IsDefined("form.hcpcCode29TBox") AND form.hcpcCode29TBox NEQ "">,hcpcCode29TBox</cfif>
					<cfif IsDefined("form.hcpcQty29TBox") AND form.hcpcQty29TBox NEQ "">,hcpcQty29TBox</cfif>
					<cfif IsDefined("form.hcpcProduct29TBox") AND form.hcpcProduct29TBox NEQ "">,hcpcProduct29TBox</cfif>
					<cfif IsDefined("form.hcpcDX29TBox") AND form.hcpcDX29TBox NEQ "">,hcpcDX29TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis29TBox") AND form.hcpcDiagnosis29TBox NEQ "">,hcpcDiagnosis29TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear29TBox") AND form.hcpcLengthOfNeedYear29TBox NEQ "">,hcpcLengthOfNeedYear29TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth29TBox") AND form.hcpcLengthOfNeedMonth29TBox NEQ "">,hcpcLengthOfNeedMonth29TBox</cfif>
					<cfif IsDefined("form.hcpcCost30TBox") AND form.hcpcCost30TBox NEQ "">,hcpcCost30TBox</cfif>
					<cfif IsDefined("form.hcpcCode30TBox") AND form.hcpcCode30TBox NEQ "">,hcpcCode30TBox</cfif>
					<cfif IsDefined("form.hcpcQty30TBox") AND form.hcpcQty30TBox NEQ "">,hcpcQty30TBox</cfif>
					<cfif IsDefined("form.hcpcProduct30TBox") AND form.hcpcProduct30TBox NEQ "">,hcpcProduct30TBox</cfif>
					<cfif IsDefined("form.hcpcDX30TBox") AND form.hcpcDX30TBox NEQ "">,hcpcDX30TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis30TBox") AND form.hcpcDiagnosis30TBox NEQ "">,hcpcDiagnosis30TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear30TBox") AND form.hcpcLengthOfNeedYear30TBox NEQ "">,hcpcLengthOfNeedYear30TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth30TBox") AND form.hcpcLengthOfNeedMonth30TBox NEQ "">,hcpcLengthOfNeedMonth30TBox</cfif>
					<cfif IsDefined("form.hcpcCost31TBox") AND form.hcpcCost31TBox NEQ "">,hcpcCost31TBox</cfif>
					<cfif IsDefined("form.hcpcCode31TBox") AND form.hcpcCode31TBox NEQ "">,hcpcCode31TBox</cfif>
					<cfif IsDefined("form.hcpcQty31TBox") AND form.hcpcQty31TBox NEQ "">,hcpcQty31TBox</cfif>
					<cfif IsDefined("form.hcpcProduct31TBox") AND form.hcpcProduct31TBox NEQ "">,hcpcProduct31TBox</cfif>
					<cfif IsDefined("form.hcpcDX31TBox") AND form.hcpcDX31TBox NEQ "">,hcpcDX31TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis31TBox") AND form.hcpcDiagnosis31TBox NEQ "">,hcpcDiagnosis31TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear31TBox") AND form.hcpcLengthOfNeedYear31TBox NEQ "">,hcpcLengthOfNeedYear31TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth31TBox") AND form.hcpcLengthOfNeedMonth31TBox NEQ "">,hcpcLengthOfNeedMonth31TBox</cfif>
					<cfif IsDefined("form.hcpcCost32TBox") AND form.hcpcCost32TBox NEQ "">,hcpcCost32TBox</cfif>
					<cfif IsDefined("form.hcpcCode32TBox") AND form.hcpcCode32TBox NEQ "">,hcpcCode32TBox</cfif>
					<cfif IsDefined("form.hcpcQty32TBox") AND form.hcpcQty32TBox NEQ "">,hcpcQty32TBox</cfif>
					<cfif IsDefined("form.hcpcProduct32TBox") AND form.hcpcProduct32TBox NEQ "">,hcpcProduct32TBox</cfif>
					<cfif IsDefined("form.hcpcDX32TBox") AND form.hcpcDX32TBox NEQ "">,hcpcDX32TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis32TBox") AND form.hcpcDiagnosis32TBox NEQ "">,hcpcDiagnosis32TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear32TBox") AND form.hcpcLengthOfNeedYear32TBox NEQ "">,hcpcLengthOfNeedYear32TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth32TBox") AND form.hcpcLengthOfNeedMonth32TBox NEQ "">,hcpcLengthOfNeedMonth32TBox</cfif>
					<cfif IsDefined("form.hcpcCost33TBox") AND form.hcpcCost33TBox NEQ "">,hcpcCost33TBox</cfif>
					<cfif IsDefined("form.hcpcCode33TBox") AND form.hcpcCode33TBox NEQ "">,hcpcCode33TBox</cfif>
					<cfif IsDefined("form.hcpcQty33TBox") AND form.hcpcQty33TBox NEQ "">,hcpcQty33TBox</cfif>
					<cfif IsDefined("form.hcpcProduct33TBox") AND form.hcpcProduct33TBox NEQ "">,hcpcProduct33TBox</cfif>
					<cfif IsDefined("form.hcpcDX33TBox") AND form.hcpcDX33TBox NEQ "">,hcpcDX33TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis33TBox") AND form.hcpcDiagnosis33TBox NEQ "">,hcpcDiagnosis33TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear33TBox") AND form.hcpcLengthOfNeedYear33TBox NEQ "">,hcpcLengthOfNeedYear33TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth33TBox") AND form.hcpcLengthOfNeedMonth33TBox NEQ "">,hcpcLengthOfNeedMonth33TBox</cfif>
					<cfif IsDefined("form.hcpcCost34TBox") AND form.hcpcCost34TBox NEQ "">,hcpcCost34TBox</cfif>
					<cfif IsDefined("form.hcpcCode34TBox") AND form.hcpcCode34TBox NEQ "">,hcpcCode34TBox</cfif>
					<cfif IsDefined("form.hcpcQty34TBox") AND form.hcpcQty34TBox NEQ "">,hcpcQty34TBox</cfif>
					<cfif IsDefined("form.hcpcProduct34TBox") AND form.hcpcProduct34TBox NEQ "">,hcpcProduct34TBox</cfif>
					<cfif IsDefined("form.hcpcDX34TBox") AND form.hcpcDX34TBox NEQ "">,hcpcDX34TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis34TBox") AND form.hcpcDiagnosis34TBox NEQ "">,hcpcDiagnosis34TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear34TBox") AND form.hcpcLengthOfNeedYear34TBox NEQ "">,hcpcLengthOfNeedYear34TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth34TBox") AND form.hcpcLengthOfNeedMonth34TBox NEQ "">,hcpcLengthOfNeedMonth34TBox</cfif>
					<cfif IsDefined("form.hcpcCost35TBox") AND form.hcpcCost35TBox NEQ "">,hcpcCost35TBox</cfif>
					<cfif IsDefined("form.hcpcCode35TBox") AND form.hcpcCode35TBox NEQ "">,hcpcCode35TBox</cfif>
					<cfif IsDefined("form.hcpcQty35TBox") AND form.hcpcQty35TBox NEQ "">,hcpcQty35TBox</cfif>
					<cfif IsDefined("form.hcpcProduct35TBox") AND form.hcpcProduct35TBox NEQ "">,hcpcProduct35TBox</cfif>
					<cfif IsDefined("form.hcpcDX35TBox") AND form.hcpcDX35TBox NEQ "">,hcpcDX35TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis35TBox") AND form.hcpcDiagnosis35TBox NEQ "">,hcpcDiagnosis35TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear35TBox") AND form.hcpcLengthOfNeedYear35TBox NEQ "">,hcpcLengthOfNeedYear35TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth35TBox") AND form.hcpcLengthOfNeedMonth35TBox NEQ "">,hcpcLengthOfNeedMonth35TBox</cfif>
					<cfif IsDefined("form.hcpcCost36TBox") AND form.hcpcCost36TBox NEQ "">,hcpcCost36TBox</cfif>
					<cfif IsDefined("form.hcpcCode36TBox") AND form.hcpcCode36TBox NEQ "">,hcpcCode36TBox</cfif>
					<cfif IsDefined("form.hcpcQty36TBox") AND form.hcpcQty36TBox NEQ "">,hcpcQty36TBox</cfif>
					<cfif IsDefined("form.hcpcProduct36TBox") AND form.hcpcProduct36TBox NEQ "">,hcpcProduct36TBox</cfif>
					<cfif IsDefined("form.hcpcDX36TBox") AND form.hcpcDX36TBox NEQ "">,hcpcDX36TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis36TBox") AND form.hcpcDiagnosis36TBox NEQ "">,hcpcDiagnosis36TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear36TBox") AND form.hcpcLengthOfNeedYear36TBox NEQ "">,hcpcLengthOfNeedYear36TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth36TBox") AND form.hcpcLengthOfNeedMonth36TBox NEQ "">,hcpcLengthOfNeedMonth36TBox</cfif>
					<cfif IsDefined("form.hcpcCost37TBox") AND form.hcpcCost37TBox NEQ "">,hcpcCost37TBox</cfif>
					<cfif IsDefined("form.hcpcCode37TBox") AND form.hcpcCode37TBox NEQ "">,hcpcCode37TBox</cfif>
					<cfif IsDefined("form.hcpcQty37TBox") AND form.hcpcQty37TBox NEQ "">,hcpcQty37TBox</cfif>
					<cfif IsDefined("form.hcpcProduct37TBox") AND form.hcpcProduct37TBox NEQ "">,hcpcProduct37TBox</cfif>
					<cfif IsDefined("form.hcpcDX37TBox") AND form.hcpcDX37TBox NEQ "">,hcpcDX37TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis37TBox") AND form.hcpcDiagnosis37TBox NEQ "">,hcpcDiagnosis37TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear37TBox") AND form.hcpcLengthOfNeedYear37TBox NEQ "">,hcpcLengthOfNeedYear37TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth37TBox") AND form.hcpcLengthOfNeedMonth37TBox NEQ "">,hcpcLengthOfNeedMonth37TBox</cfif>
					<cfif IsDefined("form.hcpcCost38TBox") AND form.hcpcCost38TBox NEQ "">,hcpcCost38TBox</cfif>
					<cfif IsDefined("form.hcpcCode38TBox") AND form.hcpcCode38TBox NEQ "">,hcpcCode38TBox</cfif>
					<cfif IsDefined("form.hcpcQty38TBox") AND form.hcpcQty38TBox NEQ "">,hcpcQty38TBox</cfif>
					<cfif IsDefined("form.hcpcProduct38TBox") AND form.hcpcProduct38TBox NEQ "">,hcpcProduct38TBox</cfif>
					<cfif IsDefined("form.hcpcDX38TBox") AND form.hcpcDX38TBox NEQ "">,hcpcDX38TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis38TBox") AND form.hcpcDiagnosis38TBox NEQ "">,hcpcDiagnosis38TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear38TBox") AND form.hcpcLengthOfNeedYear38TBox NEQ "">,hcpcLengthOfNeedYear38TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth38TBox") AND form.hcpcLengthOfNeedMonth38TBox NEQ "">,hcpcLengthOfNeedMonth38TBox</cfif>
					<cfif IsDefined("form.hcpcCost39TBox") AND form.hcpcCost39TBox NEQ "">,hcpcCost39TBox</cfif>
					<cfif IsDefined("form.hcpcCode39TBox") AND form.hcpcCode39TBox NEQ "">,hcpcCode39TBox</cfif>
					<cfif IsDefined("form.hcpcQty39TBox") AND form.hcpcQty39TBox NEQ "">,hcpcQty39TBox</cfif>
					<cfif IsDefined("form.hcpcProduct39TBox") AND form.hcpcProduct39TBox NEQ "">,hcpcProduct39TBox</cfif>
					<cfif IsDefined("form.hcpcDX39TBox") AND form.hcpcDX39TBox NEQ "">,hcpcDX39TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis39TBox") AND form.hcpcDiagnosis39TBox NEQ "">,hcpcDiagnosis39TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear39TBox") AND form.hcpcLengthOfNeedYear39TBox NEQ "">,hcpcLengthOfNeedYear39TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth39TBox") AND form.hcpcLengthOfNeedMonth39TBox NEQ "">,hcpcLengthOfNeedMonth39TBox</cfif>
					<cfif IsDefined("form.hcpcCost40TBox") AND form.hcpcCost40TBox NEQ "">,hcpcCost40TBox</cfif>
					<cfif IsDefined("form.hcpcCode40TBox") AND form.hcpcCode40TBox NEQ "">,hcpcCode40TBox</cfif>
					<cfif IsDefined("form.hcpcQty40TBox") AND form.hcpcQty40TBox NEQ "">,hcpcQty40TBox</cfif>
					<cfif IsDefined("form.hcpcProduct40TBox") AND form.hcpcProduct40TBox NEQ "">,hcpcProduct40TBox</cfif>
					<cfif IsDefined("form.hcpcDX40TBox") AND form.hcpcDX40TBox NEQ "">,hcpcDX40TBox</cfif>
					<cfif IsDefined("form.hcpcDiagnosis40TBox") AND form.hcpcDiagnosis40TBox NEQ "">,hcpcDiagnosis40TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear40TBox") AND form.hcpcLengthOfNeedYear40TBox NEQ "">,hcpcLengthOfNeedYear40TBox</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth40TBox") AND form.hcpcLengthOfNeedMonth40TBox NEQ "">,hcpcLengthOfNeedMonth40TBox</cfif>		
			 	)
				VALUES(
					#trim(IntakeID)#					 
					<cfif IsDefined("form.hcpcCost1TBox") AND form.hcpcCost1TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost1TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode1TBox") AND form.hcpcCode1TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode1TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty1TBox") AND form.hcpcQty1TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty1TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct1TBox") AND form.hcpcProduct1TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct1TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX1TBox") AND form.hcpcDX1TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX1TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis1TBox") AND form.hcpcDiagnosis1TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis1TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear1TBox") AND form.hcpcLengthOfNeedYear1TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear1TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth1TBox") AND form.hcpcLengthOfNeedMonth1TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth1TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost2TBox") AND form.hcpcCost2TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost2TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode2TBox") AND form.hcpcCode2TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode2TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty2TBox") AND form.hcpcQty2TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty2TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct2TBox") AND form.hcpcProduct2TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct2TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX2TBox") AND form.hcpcDX2TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX2TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis2TBox") AND form.hcpcDiagnosis2TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis2TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear2TBox") AND form.hcpcLengthOfNeedYear2TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear2TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth2TBox") AND form.hcpcLengthOfNeedMonth2TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth2TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost3TBox") AND form.hcpcCost3TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost3TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode3TBox") AND form.hcpcCode3TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode3TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty3TBox") AND form.hcpcQty3TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty3TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct3TBox") AND form.hcpcProduct3TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct3TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX3TBox") AND form.hcpcDX3TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX3TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis3TBox") AND form.hcpcDiagnosis3TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis3TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear3TBox") AND form.hcpcLengthOfNeedYear3TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear3TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth3TBox") AND form.hcpcLengthOfNeedMonth3TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth3TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost4TBox") AND form.hcpcCost4TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost4TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode4TBox") AND form.hcpcCode4TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode4TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty4TBox") AND form.hcpcQty4TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty4TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct4TBox") AND form.hcpcProduct4TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct4TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX4TBox") AND form.hcpcDX4TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX4TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis4TBox") AND form.hcpcDiagnosis4TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis4TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear4TBox") AND form.hcpcLengthOfNeedYear4TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear4TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth4TBox") AND form.hcpcLengthOfNeedMonth4TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth4TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost5TBox") AND form.hcpcCost5TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost5TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode5TBox") AND form.hcpcCode5TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode5TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty5TBox") AND form.hcpcQty5TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty5TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct5TBox") AND form.hcpcProduct5TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct5TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX5TBox") AND form.hcpcDX5TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX5TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis5TBox") AND form.hcpcDiagnosis5TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis5TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear5TBox") AND form.hcpcLengthOfNeedYear5TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear5TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth5TBox") AND form.hcpcLengthOfNeedMonth5TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth5TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost6TBox") AND form.hcpcCost6TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost6TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode6TBox") AND form.hcpcCode6TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode6TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty6TBox") AND form.hcpcQty6TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty6TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct6TBox") AND form.hcpcProduct6TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct6TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX6TBox") AND form.hcpcDX6TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX6TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis6TBox") AND form.hcpcDiagnosis6TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis6TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear6TBox") AND form.hcpcLengthOfNeedYear6TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear6TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth6TBox") AND form.hcpcLengthOfNeedMonth6TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth6TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost7TBox") AND form.hcpcCost7TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost7TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode7TBox") AND form.hcpcCode7TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode7TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty7TBox") AND form.hcpcQty7TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty7TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct7TBox") AND form.hcpcProduct7TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct7TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX7TBox") AND form.hcpcDX7TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX7TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis7TBox") AND form.hcpcDiagnosis7TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis7TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear7TBox") AND form.hcpcLengthOfNeedYear7TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear7TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth7TBox") AND form.hcpcLengthOfNeedMonth7TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth7TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost8TBox") AND form.hcpcCost8TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost8TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode8TBox") AND form.hcpcCode8TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode8TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty8TBox") AND form.hcpcQty8TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty8TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct8TBox") AND form.hcpcProduct8TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct8TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX8TBox") AND form.hcpcDX8TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX8TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis8TBox") AND form.hcpcDiagnosis8TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis8TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear8TBox") AND form.hcpcLengthOfNeedYear8TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear8TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth8TBox") AND form.hcpcLengthOfNeedMonth8TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth8TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost9TBox") AND form.hcpcCost9TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost9TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode9TBox") AND form.hcpcCode9TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode9TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty9TBox") AND form.hcpcQty9TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty9TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct9TBox") AND form.hcpcProduct9TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct9TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX9TBox") AND form.hcpcDX9TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX9TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis9TBox") AND form.hcpcDiagnosis9TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis9TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear9TBox") AND form.hcpcLengthOfNeedYear9TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear9TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth9TBox") AND form.hcpcLengthOfNeedMonth9TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth9TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost10TBox") AND form.hcpcCost10TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost10TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode10TBox") AND form.hcpcCode10TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode10TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty10TBox") AND form.hcpcQty10TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty10TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct10TBox") AND form.hcpcProduct10TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct10TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX10TBox") AND form.hcpcDX10TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX10TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis10TBox") AND form.hcpcDiagnosis10TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis10TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear10TBox") AND form.hcpcLengthOfNeedYear10TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear10TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth10TBox") AND form.hcpcLengthOfNeedMonth10TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth10TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost11TBox") AND form.hcpcCost11TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost11TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode11TBox") AND form.hcpcCode11TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode11TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty11TBox") AND form.hcpcQty11TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty11TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct11TBox") AND form.hcpcProduct11TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct11TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX11TBox") AND form.hcpcDX11TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX11TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis11TBox") AND form.hcpcDiagnosis11TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis11TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear11TBox") AND form.hcpcLengthOfNeedYear11TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear11TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth11TBox") AND form.hcpcLengthOfNeedMonth11TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth11TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost12TBox") AND form.hcpcCost12TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost12TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode12TBox") AND form.hcpcCode12TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode12TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty12TBox") AND form.hcpcQty12TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty12TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct12TBox") AND form.hcpcProduct12TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct12TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX12TBox") AND form.hcpcDX12TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX12TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis12TBox") AND form.hcpcDiagnosis12TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis12TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear12TBox") AND form.hcpcLengthOfNeedYear12TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear12TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth12TBox") AND form.hcpcLengthOfNeedMonth12TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth12TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost13TBox") AND form.hcpcCost13TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost13TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode13TBox") AND form.hcpcCode13TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode13TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty13TBox") AND form.hcpcQty13TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty13TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct13TBox") AND form.hcpcProduct13TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct13TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX13TBox") AND form.hcpcDX13TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX13TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis13TBox") AND form.hcpcDiagnosis13TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis13TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear13TBox") AND form.hcpcLengthOfNeedYear13TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear13TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth13TBox") AND form.hcpcLengthOfNeedMonth13TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth13TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost14TBox") AND form.hcpcCost14TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost14TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode14TBox") AND form.hcpcCode14TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode14TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty14TBox") AND form.hcpcQty14TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty14TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct14TBox") AND form.hcpcProduct14TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct14TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX14TBox") AND form.hcpcDX14TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX14TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis14TBox") AND form.hcpcDiagnosis14TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis14TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear14TBox") AND form.hcpcLengthOfNeedYear14TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear14TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth14TBox") AND form.hcpcLengthOfNeedMonth14TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth14TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost15TBox") AND form.hcpcCost15TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost15TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode15TBox") AND form.hcpcCode15TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode15TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty15TBox") AND form.hcpcQty15TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty15TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct15TBox") AND form.hcpcProduct15TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct15TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX15TBox") AND form.hcpcDX15TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX15TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis15TBox") AND form.hcpcDiagnosis15TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis15TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear15TBox") AND form.hcpcLengthOfNeedYear15TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear15TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth15TBox") AND form.hcpcLengthOfNeedMonth15TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth15TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost16TBox") AND form.hcpcCost16TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost16TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode16TBox") AND form.hcpcCode16TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode16TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty16TBox") AND form.hcpcQty16TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty16TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct16TBox") AND form.hcpcProduct16TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct16TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX16TBox") AND form.hcpcDX16TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX16TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis16TBox") AND form.hcpcDiagnosis16TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis16TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear16TBox") AND form.hcpcLengthOfNeedYear16TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear16TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth16TBox") AND form.hcpcLengthOfNeedMonth16TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth16TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost17TBox") AND form.hcpcCost17TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost17TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode17TBox") AND form.hcpcCode17TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode17TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty17TBox") AND form.hcpcQty17TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty17TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct17TBox") AND form.hcpcProduct17TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct17TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX17TBox") AND form.hcpcDX17TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX17TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis17TBox") AND form.hcpcDiagnosis17TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis17TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear17TBox") AND form.hcpcLengthOfNeedYear17TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear17TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth17TBox") AND form.hcpcLengthOfNeedMonth17TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth17TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost18TBox") AND form.hcpcCost18TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost18TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode18TBox") AND form.hcpcCode18TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode18TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty18TBox") AND form.hcpcQty18TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty18TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct18TBox") AND form.hcpcProduct18TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct18TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX18TBox") AND form.hcpcDX18TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX18TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis18TBox") AND form.hcpcDiagnosis18TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis18TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear18TBox") AND form.hcpcLengthOfNeedYear18TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear18TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth18TBox") AND form.hcpcLengthOfNeedMonth18TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth18TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost19TBox") AND form.hcpcCost19TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost19TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode19TBox") AND form.hcpcCode19TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode19TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty19TBox") AND form.hcpcQty19TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty19TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct19TBox") AND form.hcpcProduct19TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct19TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX19TBox") AND form.hcpcDX19TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX19TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis19TBox") AND form.hcpcDiagnosis19TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis19TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear19TBox") AND form.hcpcLengthOfNeedYear19TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear19TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth19TBox") AND form.hcpcLengthOfNeedMonth19TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth19TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost20TBox") AND form.hcpcCost20TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost20TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode20TBox") AND form.hcpcCode20TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode20TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty20TBox") AND form.hcpcQty20TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty20TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct20TBox") AND form.hcpcProduct20TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct20TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX20TBox") AND form.hcpcDX20TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX20TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis20TBox") AND form.hcpcDiagnosis20TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis20TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear20TBox") AND form.hcpcLengthOfNeedYear20TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear20TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth20TBox") AND form.hcpcLengthOfNeedMonth20TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth20TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost21TBox") AND form.hcpcCost21TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost21TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode21TBox") AND form.hcpcCode21TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode21TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty21TBox") AND form.hcpcQty21TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty21TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct21TBox") AND form.hcpcProduct21TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct21TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX21TBox") AND form.hcpcDX21TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX21TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis21TBox") AND form.hcpcDiagnosis21TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis21TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear21TBox") AND form.hcpcLengthOfNeedYear21TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear21TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth21TBox") AND form.hcpcLengthOfNeedMonth21TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth21TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost22TBox") AND form.hcpcCost22TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost22TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode22TBox") AND form.hcpcCode22TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode22TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty22TBox") AND form.hcpcQty22TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty22TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct22TBox") AND form.hcpcProduct22TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct22TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX22TBox") AND form.hcpcDX22TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX22TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis22TBox") AND form.hcpcDiagnosis22TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis22TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear22TBox") AND form.hcpcLengthOfNeedYear22TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear22TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth22TBox") AND form.hcpcLengthOfNeedMonth22TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth22TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost23TBox") AND form.hcpcCost23TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost23TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode23TBox") AND form.hcpcCode23TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode23TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty23TBox") AND form.hcpcQty23TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty23TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct23TBox") AND form.hcpcProduct23TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct23TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX23TBox") AND form.hcpcDX23TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX23TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis23TBox") AND form.hcpcDiagnosis23TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis23TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear23TBox") AND form.hcpcLengthOfNeedYear23TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear23TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth23TBox") AND form.hcpcLengthOfNeedMonth23TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth23TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost24TBox") AND form.hcpcCost24TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost24TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode24TBox") AND form.hcpcCode24TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode24TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty24TBox") AND form.hcpcQty24TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty24TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct24TBox") AND form.hcpcProduct24TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct24TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX24TBox") AND form.hcpcDX24TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX24TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis24TBox") AND form.hcpcDiagnosis24TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis24TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear24TBox") AND form.hcpcLengthOfNeedYear24TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear24TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth24TBox") AND form.hcpcLengthOfNeedMonth24TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth24TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost25TBox") AND form.hcpcCost25TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost25TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode25TBox") AND form.hcpcCode25TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode25TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty25TBox") AND form.hcpcQty25TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty25TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct25TBox") AND form.hcpcProduct25TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct25TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX25TBox") AND form.hcpcDX25TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX25TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis25TBox") AND form.hcpcDiagnosis25TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis25TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear25TBox") AND form.hcpcLengthOfNeedYear25TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear25TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth25TBox") AND form.hcpcLengthOfNeedMonth25TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth25TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost26TBox") AND form.hcpcCost26TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost26TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode26TBox") AND form.hcpcCode26TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode26TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty26TBox") AND form.hcpcQty26TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty26TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct26TBox") AND form.hcpcProduct26TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct26TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX26TBox") AND form.hcpcDX26TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX26TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis26TBox") AND form.hcpcDiagnosis26TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis26TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear26TBox") AND form.hcpcLengthOfNeedYear26TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear26TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth26TBox") AND form.hcpcLengthOfNeedMonth26TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth26TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost27TBox") AND form.hcpcCost27TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost27TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode27TBox") AND form.hcpcCode27TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode27TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty27TBox") AND form.hcpcQty27TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty27TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct27TBox") AND form.hcpcProduct27TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct27TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX27TBox") AND form.hcpcDX27TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX27TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis27TBox") AND form.hcpcDiagnosis27TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis27TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear27TBox") AND form.hcpcLengthOfNeedYear27TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear27TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth27TBox") AND form.hcpcLengthOfNeedMonth27TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth27TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost28TBox") AND form.hcpcCost28TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost28TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode28TBox") AND form.hcpcCode28TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode28TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty28TBox") AND form.hcpcQty28TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty28TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct28TBox") AND form.hcpcProduct28TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct28TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX28TBox") AND form.hcpcDX28TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX28TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis28TBox") AND form.hcpcDiagnosis28TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis28TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear28TBox") AND form.hcpcLengthOfNeedYear28TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear28TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth28TBox") AND form.hcpcLengthOfNeedMonth28TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth28TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost29TBox") AND form.hcpcCost29TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost29TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode29TBox") AND form.hcpcCode29TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode29TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty29TBox") AND form.hcpcQty29TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty29TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct29TBox") AND form.hcpcProduct29TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct29TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX29TBox") AND form.hcpcDX29TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX29TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis29TBox") AND form.hcpcDiagnosis29TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis29TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear29TBox") AND form.hcpcLengthOfNeedYear29TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear29TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth29TBox") AND form.hcpcLengthOfNeedMonth29TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth29TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost30TBox") AND form.hcpcCost30TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost30TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode30TBox") AND form.hcpcCode30TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode30TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty30TBox") AND form.hcpcQty30TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty30TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct30TBox") AND form.hcpcProduct30TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct30TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX30TBox") AND form.hcpcDX30TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX30TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis30TBox") AND form.hcpcDiagnosis30TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis30TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear30TBox") AND form.hcpcLengthOfNeedYear30TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear30TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth30TBox") AND form.hcpcLengthOfNeedMonth30TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth30TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost31TBox") AND form.hcpcCost31TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost31TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode31TBox") AND form.hcpcCode31TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode31TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty31TBox") AND form.hcpcQty31TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty31TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct31TBox") AND form.hcpcProduct31TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct31TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX31TBox") AND form.hcpcDX31TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX31TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis31TBox") AND form.hcpcDiagnosis31TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis31TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear31TBox") AND form.hcpcLengthOfNeedYear31TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear31TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth31TBox") AND form.hcpcLengthOfNeedMonth31TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth31TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost32TBox") AND form.hcpcCost32TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost32TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode32TBox") AND form.hcpcCode32TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode32TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty32TBox") AND form.hcpcQty32TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty32TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct32TBox") AND form.hcpcProduct32TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct32TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX32TBox") AND form.hcpcDX32TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX32TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis32TBox") AND form.hcpcDiagnosis32TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis32TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear32TBox") AND form.hcpcLengthOfNeedYear32TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear32TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth32TBox") AND form.hcpcLengthOfNeedMonth32TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth32TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost33TBox") AND form.hcpcCost33TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost33TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode33TBox") AND form.hcpcCode33TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode33TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty33TBox") AND form.hcpcQty33TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty33TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct33TBox") AND form.hcpcProduct33TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct33TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX33TBox") AND form.hcpcDX33TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX33TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis33TBox") AND form.hcpcDiagnosis33TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis33TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear33TBox") AND form.hcpcLengthOfNeedYear33TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear33TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth33TBox") AND form.hcpcLengthOfNeedMonth33TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth33TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost34TBox") AND form.hcpcCost34TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost34TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode34TBox") AND form.hcpcCode34TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode34TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty34TBox") AND form.hcpcQty34TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty34TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct34TBox") AND form.hcpcProduct34TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct34TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX34TBox") AND form.hcpcDX34TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX34TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis34TBox") AND form.hcpcDiagnosis34TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis34TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear34TBox") AND form.hcpcLengthOfNeedYear34TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear34TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth34TBox") AND form.hcpcLengthOfNeedMonth34TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth34TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost35TBox") AND form.hcpcCost35TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost35TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode35TBox") AND form.hcpcCode35TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode35TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty35TBox") AND form.hcpcQty35TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty35TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct35TBox") AND form.hcpcProduct35TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct35TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX35TBox") AND form.hcpcDX35TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX35TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis35TBox") AND form.hcpcDiagnosis35TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis35TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear35TBox") AND form.hcpcLengthOfNeedYear35TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear35TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth35TBox") AND form.hcpcLengthOfNeedMonth35TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth35TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost36TBox") AND form.hcpcCost36TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost36TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode36TBox") AND form.hcpcCode36TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode36TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty36TBox") AND form.hcpcQty36TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty36TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct36TBox") AND form.hcpcProduct36TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct36TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX36TBox") AND form.hcpcDX36TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX36TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis36TBox") AND form.hcpcDiagnosis36TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis36TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear36TBox") AND form.hcpcLengthOfNeedYear36TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear36TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth36TBox") AND form.hcpcLengthOfNeedMonth36TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth36TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost37TBox") AND form.hcpcCost37TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost37TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode37TBox") AND form.hcpcCode37TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode37TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty37TBox") AND form.hcpcQty37TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty37TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct37TBox") AND form.hcpcProduct37TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct37TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX37TBox") AND form.hcpcDX37TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX37TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis37TBox") AND form.hcpcDiagnosis37TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis37TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear37TBox") AND form.hcpcLengthOfNeedYear37TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear37TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth37TBox") AND form.hcpcLengthOfNeedMonth37TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth37TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost38TBox") AND form.hcpcCost38TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost38TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode38TBox") AND form.hcpcCode38TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode38TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty38TBox") AND form.hcpcQty38TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty38TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct38TBox") AND form.hcpcProduct38TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct38TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX38TBox") AND form.hcpcDX38TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX38TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis38TBox") AND form.hcpcDiagnosis38TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis38TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear38TBox") AND form.hcpcLengthOfNeedYear38TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear38TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth38TBox") AND form.hcpcLengthOfNeedMonth38TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth38TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost39TBox") AND form.hcpcCost39TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost39TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode39TBox") AND form.hcpcCode39TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode39TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty39TBox") AND form.hcpcQty39TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty39TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct39TBox") AND form.hcpcProduct39TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct39TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX39TBox") AND form.hcpcDX39TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX39TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis39TBox") AND form.hcpcDiagnosis39TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis39TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear39TBox") AND form.hcpcLengthOfNeedYear39TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear39TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth39TBox") AND form.hcpcLengthOfNeedMonth39TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth39TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCost40TBox") AND form.hcpcCost40TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCost40TBox))#'</cfif>
					<cfif IsDefined("form.hcpcCode40TBox") AND form.hcpcCode40TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcCode40TBox))#'</cfif>
					<cfif IsDefined("form.hcpcQty40TBox") AND form.hcpcQty40TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcQty40TBox))#'</cfif>
					<cfif IsDefined("form.hcpcProduct40TBox") AND form.hcpcProduct40TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcProduct40TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDX40TBox") AND form.hcpcDX40TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDX40TBox))#'</cfif>
					<cfif IsDefined("form.hcpcDiagnosis40TBox") AND form.hcpcDiagnosis40TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcDiagnosis40TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedYear40TBox") AND form.hcpcLengthOfNeedYear40TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedYear40TBox))#'</cfif>
					<cfif IsDefined("form.hcpcLengthOfNeedMonth40TBox") AND form.hcpcLengthOfNeedMonth40TBox NEQ "">,'#REQUEST.mssqlReplaceSingleQuote(trim(form.hcpcLengthOfNeedMonth40TBox))#'</cfif>				
				);
				SELECT LAST_INSERT_ID() AS IntakeHCPCID 
			</cfoutput>
		</cfsavecontent>
		
		
		<!---<cfmail from="support@eobmanager.net" to="gcruz@eobmanager.net" subject="[PreserveSingleQuotes(sqlStatementHCPC)] INSERT There was an issue processing the page. Please try your intake again. - #DateFormat( now(), 'm/d/yyyy' )# #TimeFormat( now() )#" type="HTML">
			#PreserveSingleQuotes(sqlStatementHCPC)#
		</cfmail>--->
		
		<!-------------------------------------------------------------------------------------->
		<!--- Run the query that was just built.                                             --->
		<!-------------------------------------------------------------------------------------->
		<cfquery name="insertIntakeHCPC" datasource="#trim(request.datasource)#">
			#PreserveSingleQuotes(sqlStatementHCPC)#
		</cfquery>
		

		<!-------------------------------------------------------------------------------------->
		<!--- Put the note in if sent in.                                                    --->
		<!-------------------------------------------------------------------------------------->
		<cfif IsDefined("form.Note") AND form.Note NEQ "">

			<cfset request.NoteXML = CreateObject("component","com.common.Note")>
			<cfset noteID = request.NoteXML.addNote(clientID: trim(session.clientID), objectID: 8, instanceID: trim(insertIntake.intakeID))>
			<cfset request.NoteXML.addNoteEntry(clientID: trim(session.clientID), NoteID: noteID, noteEntry: '#trim(form.note)#', userID: #trim(session.user.getUsersID())#, userFName: '#trim(session.user.getFName())#', userLName: '#trim(session.user.getLName())#')>

		</cfif>


		<!-------------------------------------------------------------------------------------->
		<!--- Create the message.                                                            --->
		<!-------------------------------------------------------------------------------------->
		<cfset msg = "Intake #trim(insertIntake.intakeID)# has been Created.">
		<!---<cfset msg = "Intake <span style=cursor:hand onclick=location.href='appPatientIntakeEdit.cfm?intakeID=#trim(insertIntake.intakeID)#'>(ID: <u>#insertIntake.intakeID#</u>)</span> has been Created.">--->


	</cfif>

	
	
	<!-------------------------------------------------------------------------------------->
	<!--- If the insurance information save the insurance company.                       --->
	<!-------------------------------------------------------------------------------------->		
	<cfif isDefined("form.hidden_primary_AutoSuggestInsuranceID") AND isNumeric(form.hidden_primary_AutoSuggestInsuranceID)>
		
		<cfset primaryInsuranceCompanyID = form.hidden_primary_AutoSuggestInsuranceID>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Save the Primary Patient Insurance Company.                                    --->
		<!-------------------------------------------------------------------------------------->	
		<cfif IsDefined("form.primaryPolicyNumberTBox") AND form.primaryPolicyNumberTBox NEQ "" AND IsDefined("primaryInsuranceCompanyID") AND IsNumeric(primaryInsuranceCompanyID)>
	
			<cf_tagPatientInsuranceSave
				action="create"
				newRecordIdentity="primaryPICID"
				insuranceCompanyID="#primaryInsuranceCompanyID#" 
				patientID="#trim(patientID)#"		
				PrimSecTer="1"
				policyNumber="#trim(form.primaryPolicyNumberTBox)#"
				GroupNumberTBox="#trim(form.primaryGroupNumberTBox)#"
				PolicyHoldersFirstName="#trim(form.primaryPolicyHolderFNameTBox)#"
				PolicyHoldersMiddleInitial="#trim(form.primaryPolicyHolderMInitialTBox)#"
				PolicyHoldersLastName="#trim(form.primaryPolicyHolderLNameTBox)#"		
				PolicyHoldersDOBMM="#trim(form.primaryHoldersDOBMM)#"
				PolicyHoldersDOBDD="#trim(form.primaryHoldersDOBDD)#"
				PolicyHoldersDOBYY="#trim(form.primaryHoldersDOBYY)#"		
				PolicyHoldersEmployerSchoolNameTBox="#trim(form.primaryPolicyHolderEmployerTBox)#">
							
			<cfif IsDefined("form.primaryNoteTBox") AND form.primaryNoteTBox NEQ "">								
				<cfset request.Note = CreateObject("component", "com.common.Note")>
				<cfset noteID = request.Note.getNoteID(clientID: session.ClientID, objectID: 4, instanceID: primaryPICID)>
				<cfif NOT IsNumeric(noteID)>
					<cfset noteID = request.Note.addNote(clientID: session.ClientID, objectID: 4, instanceID: primaryPICID)>
				</cfif>
				<cfset request.Note.addNoteEntry(noteID: noteID, userID:session.User.getUsersID(), userFName: trim(session.user.getFName()), userLName: trim(session.user.getLName()), noteEntry: '#trim(form.primaryNoteTBox)#', clientID: session.ClientID)>
			</cfif>							
						
		</cfif>
		
		
	<cfelseif IsDefined("form.primaryInsuranceNameTBox") AND form.primaryInsuranceNameTBox NEQ "" AND (NOT IsDefined("form.hidden_primaryInsuranceID") OR NOT IsNumeric(form.hidden_primaryInsuranceID))>					
		
		<cfset request.primaryICEntity = CreateObject("component","com.common.Entity")>		
		<cfset request.primaryICEntity.setObjectTypeID(4)>
		<cfset primaryICEntityID = request.primaryICEntity.commit()>		
		
		<cfset request.primaryInsuranceCompany = CreateObject("component", "com.common.db.InsuranceCompanyIO")>			
		<cfset request.primaryInsuranceCompany.setInsuranceCompanyName(form.primaryInsuranceNameTBox)>				
		<cfset request.primaryInsuranceCompany.setEntityID(primaryICEntityID)>				
		<cfset primaryInsuranceCompanyID = request.primaryInsuranceCompany.commit()>	
		
		<cfif IsDefined("primaryICEntityID") AND IsNumeric(primaryICEntityID) AND IsDefined("form.primarySendToAddress1TBox") AND form.primarySendToAddress1TBox NEQ "" AND IsDefined("form.primarySendToCityTBox") AND form.primarySendToCityTBox NEQ "">				
			<cfset request.primaryICAddress = CreateObject("component","com.common.Address")>	
			<cfset request.primaryICAddress.new(EntityID: trim(primaryICEntityID), AddressTypeID: 12, AddressLine1: REQUEST.mssqlReplaceSingleQuote(trim(form.primarySendToAddress1TBox)), AddressLine2: REQUEST.mssqlReplaceSingleQuote(trim(form.primarySendToAddress2TBox)), City: REQUEST.mssqlReplaceSingleQuote(trim(form.primarySendToCityTBox)), StateID: trim(form.primarySendToStateTBox), ZipCode: REQUEST.mssqlReplaceSingleQuote(trim(form.primarySendToZipCodeTBox)))>	
			<cfset primaryICAddressID = request.primaryICAddress.commit()>				
			<cfif IsDefined("request.primaryICEntity") AND IsObject(request.primaryICEntity)>
				<cfset request.primaryICEntity.bindEntityAddress(clientID: trim(session.clientID), entityID: trim(primaryICEntityID), addressid: trim(primaryICAddressID), isdefault: 1)>
			</cfif>				
		</cfif>
				
		<cfif IsDefined("primaryICEntityID") AND IsNumeric(primaryICEntityID) AND IsDefined("form.primaryPhoneNumberTBox") AND trim(form.primaryPhoneNumberTBox) NEQ "">				
			<cfset primaryICPhoneNumberE = application.beanFactory.getBean('globalFooter').GlobalFooterE(request.cleanNumericString(trim(form.primaryPhoneNumberTBox))) />
			<cfset request.primaryICPhone = CreateObject("component","com.common.Phone")>	
			<cfset request.primaryICPhone.setPhoneTypeID(74)>
			<cfset request.primaryICPhone.setPhoneNumber(trim(primaryICPhoneNumberE))>
			<cfset primaryICPhoneID = request.primaryICPhone.commit()>				
			<cfif IsDefined("request.primaryICEntity") AND IsObject(request.primaryICEntity)>
				<cfset request.primaryICEntity.bindEntityPhone(clientID: session.clientID, entityID: trim(primaryICEntityID), PhoneID: trim(primaryICPhoneID), IsDefault: 1)>
			</cfif>							
		</cfif>
					
		<cfif IsDefined("primaryICEntityID") AND IsNumeric(primaryICEntityID) AND IsDefined("form.primaryFaxNumberTBox") AND trim(form.primaryFaxNumberTBox) NEQ "">				
			<cfset primaryICFaxNumberE = application.beanFactory.getBean('globalFooter').GlobalFooterE(request.cleanNumericString(trim(form.primaryFaxNumberTBox))) />
			<cfset request.primaryICFax = CreateObject("component","com.common.Phone")>	
			<cfset request.primaryICFax.setPhoneTypeID(87)>
			<cfset request.primaryICFax.setPhoneNumber(trim(primaryICFaxNumberE))>
			<cfset primaryICFaxID = request.primaryICFax.commit()>				
			<cfif IsDefined("request.primaryICEntity") AND IsObject(request.primaryICEntity)>
				<cfset request.primaryICEntity.bindEntityPhone(clientID: session.clientID, entityID: trim(primaryICEntityID), phoneID: trim(primaryICFaxID), IsDefault: 1)>
			</cfif>					
		</cfif>
		
		<!-------------------------------------------------------------------------------------->
		<!--- Save the Primary Patient Insurance Company.                                    --->
		<!-------------------------------------------------------------------------------------->	
		<cfif IsDefined("form.primaryPolicyNumberTBox") AND form.primaryPolicyNumberTBox NEQ "" AND IsDefined("primaryInsuranceCompanyID") AND IsNumeric(primaryInsuranceCompanyID)>
	
			<cf_tagPatientInsuranceSave
				action="create"
				newRecordIdentity="primaryPICID"
				insuranceCompanyID="#primaryInsuranceCompanyID#" 
				patientID="#trim(patientID)#"		
				PrimSecTer="1"
				policyNumber="#trim(form.primaryPolicyNumberTBox)#"
				GroupNumberTBox="#trim(form.primaryGroupNumberTBox)#"
				PolicyHoldersFirstName="#trim(form.primaryPolicyHolderFNameTBox)#"
				PolicyHoldersMiddleInitial="#trim(form.primaryPolicyHolderMInitialTBox)#"
				PolicyHoldersLastName="#trim(form.primaryPolicyHolderLNameTBox)#"		
				PolicyHoldersDOBMM="#trim(form.primaryHoldersDOBMM)#"
				PolicyHoldersDOBDD="#trim(form.primaryHoldersDOBDD)#"
				PolicyHoldersDOBYY="#trim(form.primaryHoldersDOBYY)#"		
				PolicyHoldersEmployerSchoolNameTBox="#trim(form.primaryPolicyHolderEmployerTBox)#">
							
			<cfif IsDefined("form.primaryNoteTBox") AND form.primaryNoteTBox NEQ "">								
				<cfset request.Note = CreateObject("component", "com.common.Note")>
				<cfset noteID = request.Note.getNoteID(clientID: session.ClientID, objectID: 4, instanceID: primaryPICID)>
				<cfif NOT IsNumeric(noteID)>
					<cfset noteID = request.Note.addNote(clientID: session.ClientID, objectID: 4, instanceID: primaryPICID)>
				</cfif>
				<cfset request.Note.addNoteEntry(noteID: noteID, userID:session.User.getUsersID(), userFName: trim(session.user.getFName()), userLName: trim(session.user.getLName()), noteEntry: '#trim(form.primaryNoteTBox)#', clientID: session.ClientID)>
			</cfif>							
						
		</cfif>
	
	<cfelseif IsDefined("form.hidden_primaryPICID") AND IsNumeric(form.hidden_primaryPICID)>					
		
		<cfset primaryPICID = form.hidden_primaryPICID>		
					
	</cfif>
			
	
	<!-------------------------------------------------------------------------------------->
	<!--- Save the verification if enough of the information is there.                   --->
	<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("primaryPICID") AND IsNumeric(primaryPICID) AND trim(primaryVerificationID) EQ "" AND form.primaryVerificationRepFNameTBox NEQ "" AND form.primaryVerificationRepLNameTBox NEQ "">
		
		<cfset request.primaryVerificationPIC = CreateObject("component","com.common.VerificationPIC")>
		<cfset request.primaryVerificationPIC.setpicID(primaryPICID)>
		<cfset request.primaryVerificationPIC.setUsersID(session.User.getUsersID())>
		<cfset request.primaryVerificationPIC.setVerificationRepFName(form.primaryVerificationRepFNameTBox)>
		<cfset request.primaryVerificationPIC.setVerificationRepLName(form.primaryVerificationRepLNameTBox)>
		<cfset request.primaryVerificationPIC.setVerificationTime(form.primaryVerificationTimeTBox)>
		<cfset request.primaryVerificationPIC.setVerificationDeductibleAmount(form.primaryVerificationDeductibleAmountTBox)>
		<cfset request.primaryVerificationPIC.setVerificationDeductibleAmountMet(form.primaryVerificationDeductibleAmountMetTBox)>
		<cfset request.primaryVerificationPIC.setVerificationPercentagePayAfterDeductible(form.primaryVerificationPercentagePayAfterDeductibleTBox)>
		<cfset request.primaryVerificationPIC.setVerificationAuthNumber(form.primaryVerificationAuthNumberTBox)>
		<cfset request.primaryVerificationPIC.setVerificationAuthPhoneNumber(request.cleanNumericString(form.primaryVerificationAuthPhoneNumberTBox))>
		<cfset request.primaryVerificationPIC.setVerificationTypeBasePlan(form.primaryVerificationTypeBasePlanTBox)>	
		<cfset VerificationDate = "#trim(form.primaryVerificationDateMM)#/#trim(form.primaryVerificationDateDD)#/#trim(form.primaryVerificationDateYY)#">
		<cfif IsDate(VerificationDate)>	
			<cfset request.primaryVerificationPIC.setVerificationDate(VerificationDate)>
		</cfif>
		<cfset VerificationHaveInsFromDate = "#trim(form.primaryVerificationHaveInsFromMM)#/#trim(form.primaryVerificationHaveInsFromDD)#/#trim(form.primaryVerificationHaveInsFromYY)#">
		<cfif IsDate(VerificationHaveInsFromDate)>	
			<cfset request.primaryVerificationPIC.setVerificationHaveInsFromDate(VerificationHaveInsFromDate)>
		</cfif>
		<cfset VerificationHaveInsToDate = "#trim(form.primaryVerificationHaveInsToMM)#/#trim(form.primaryVerificationHaveInsToDD)#/#trim(form.primaryVerificationHaveInsToYY)#">
		<cfif IsDate(VerificationHaveInsToDate)>		
			<cfset request.primaryVerificationPIC.setVerificationHaveInsToDate(VerificationHaveInsToDate)>
		</cfif>
		<cfif IsNumeric(form.primaryVerificationHaveInsYes)>
			<cfset request.primaryVerificationPIC.setVerificationHaveIns(0)>
		<cfelseif IsNumeric(form.primaryVerificationHaveInsNo)>
			<cfset request.primaryVerificationPIC.setVerificationHaveIns(1)>
		</cfif> 
		<cfif IsNumeric(form.primaryVerificationHaveDMECovYes)>
			<cfset request.primaryVerificationPIC.setVerificationHaveDMECov(0)>
		<cfelseif IsNumeric(form.primaryVerificationHaveDMECovNo)>
			<cfset request.primaryVerificationPIC.setVerificationHaveDMECov(1)>
		</cfif>	
		<cfif IsNumeric(form.primaryVerificationDeductibleYes)>
			<cfset request.primaryVerificationPIC.setVerificationDeductible(0)>
		<cfelseif IsNumeric(form.primaryVerificationDeductibleNo)>
			<cfset request.primaryVerificationPIC.setVerificationDeductible(1)>	
		</cfif>
		<cfif IsNumeric(form.primaryVerificationPPOPolicyYes)>
			<cfset request.primaryVerificationPIC.setVerificationPPOPolicy(0)>
		<cfelseif IsNumeric(form.primaryVerificationPPOPolicyNo)>
			<cfset request.primaryVerificationPIC.setVerificationPPOPolicy(1)>	
		</cfif>
		<cfif IsNumeric(form.primaryVerificationPriorAuthYes)>
			<cfset request.primaryVerificationPIC.setVerificationPriorAuth(0)>
		<cfelseif IsNumeric(form.primaryVerificationPriorAuthNo)>
			<cfset request.primaryVerificationPIC.setVerificationPriorAuth(1)>
		</cfif>
		<cfif IsNumeric(form.primaryVerificationLifetimeBenefitMetYes)>
			<cfset request.primaryVerificationPIC.setVerificationLifetimeBenefitMet(0)>
		<cfelseif IsNumeric(form.primaryVerificationLifetimeBenefitMetNo)>	
			<cfset request.primaryVerificationPIC.setVerificationLifetimeBenefitMet(1)>
		</cfif>
		<cfif IsNumeric(form.primaryMedicareSupplementYes)>	
			<cfset request.primaryVerificationPIC.setVerificationMedicareSupplement(0)>
		<cfelseif IsNumeric(form.primaryMedicareSupplementNo)>	
			<cfset request.primaryVerificationPIC.setVerificationMedicareSupplement(1)>
		</cfif>		
		<cfif IsNumeric(form.primaryCoordinateBenefitsYes)>	
			<cfset request.primaryVerificationPIC.setVerificationCoordinateBenefits(0)>
		<cfelseif IsNumeric(form.primaryCoordinateBenefitsNo)>	
			<cfset request.primaryVerificationPIC.setVerificationCoordinateBenefits(1)>
		</cfif>			
		<cfif IsNumeric(form.primaryPaidMedicareDeductibleYes)>	
			<cfset request.primaryVerificationPIC.setVerificationPaidMedicareDeductible(0)>
		<cfelseif IsNumeric(form.primaryPaidMedicareDeductibleNo)>	
			<cfset request.primaryVerificationPIC.setVerificationPaidMedicareDeductible(1)>
		</cfif>		
		<cfif IsNumeric(form.primaryVerificationMedicaidPlanMQMB)>	
			<cfset request.primaryVerificationPIC.setVerificationMedicaidPlan(0)>
		<cfelseif IsNumeric(form.primaryVerificationMedicaidPlanQMB)>	
			<cfset request.primaryVerificationPIC.setVerificationMedicaidPlan(1)>
		<cfelseif IsNumeric(form.primaryVerificationMedicaidPlanTraditional)>	
			<cfset request.primaryVerificationPIC.setVerificationMedicaidPlan(2)>	
		</cfif>	
	
		<cfset primaryVerificationPatientInsuranceID = request.primaryVerificationPIC.commit()>
	
	</cfif>
	

	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- If the insurance information save the insurance company.                       --->
	<!-------------------------------------------------------------------------------------->		
	<cfif isDefined("form.hidden_secondary_AutoSuggestInsuranceID") AND isNumeric(form.hidden_secondary_AutoSuggestInsuranceID)>
		
		<cfset secondaryInsuranceCompanyID = form.hidden_secondary_AutoSuggestInsuranceID>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Save the secondary Patient Insurance Company.                                  --->
		<!-------------------------------------------------------------------------------------->	
		<cfif IsDefined("form.secondaryPolicyNumberTBox") AND form.secondaryPolicyNumberTBox NEQ "" AND IsDefined("secondaryInsuranceCompanyID") AND IsNumeric(secondaryInsuranceCompanyID)>
	
			<cf_tagPatientInsuranceSave
				action="create"
				newRecordIdentity="secondaryPICID"
				insuranceCompanyID="#secondaryInsuranceCompanyID#" 
				patientID="#trim(patientID)#"		
				PrimSecTer="1"
				policyNumber="#trim(form.secondaryPolicyNumberTBox)#"
				GroupNumberTBox="#trim(form.secondaryGroupNumberTBox)#"
				PolicyHoldersFirstName="#trim(form.secondaryPolicyHolderFNameTBox)#"
				PolicyHoldersMiddleInitial="#trim(form.secondaryPolicyHolderMInitialTBox)#"
				PolicyHoldersLastName="#trim(form.secondaryPolicyHolderLNameTBox)#"		
				PolicyHoldersDOBMM="#trim(form.secondaryHoldersDOBMM)#"
				PolicyHoldersDOBDD="#trim(form.secondaryHoldersDOBDD)#"
				PolicyHoldersDOBYY="#trim(form.secondaryHoldersDOBYY)#"		
				PolicyHoldersEmployerSchoolNameTBox="#trim(form.secondaryPolicyHolderEmployerTBox)#">
							
			<cfif IsDefined("form.secondaryNoteTBox") AND form.secondaryNoteTBox NEQ "">								
				<cfset request.Note = CreateObject("component", "com.common.Note")>
				<cfset noteID = request.Note.getNoteID(clientID: session.ClientID, objectID: 4, instanceID: secondaryPICID)>
				<cfif NOT IsNumeric(noteID)>
					<cfset noteID = request.Note.addNote(clientID: session.ClientID, objectID: 4, instanceID: secondaryPICID)>
				</cfif>
				<cfset request.Note.addNoteEntry(noteID: noteID, userID:session.User.getUsersID(), userFName: trim(session.user.getFName()), userLName: trim(session.user.getLName()), noteEntry: '#trim(form.secondaryNoteTBox)#', clientID: session.ClientID)>
			</cfif>							
						
		</cfif>
		
	<cfelseif IsDefined("form.secondaryInsuranceNameTBox") AND form.secondaryInsuranceNameTBox NEQ "" AND (NOT IsDefined("form.hidden_secondaryInsuranceID") OR NOT IsNumeric(form.hidden_secondaryInsuranceID))>					
		
		<cfset request.secondaryICEntity = CreateObject("component","com.common.Entity")>		
		<cfset request.secondaryICEntity.setObjectTypeID(4)>
		<cfset secondaryICEntityID = request.secondaryICEntity.commit()>		
		
		<cfset request.secondaryInsuranceCompany = CreateObject("component", "com.common.db.InsuranceCompanyIO")>			
		<cfset request.secondaryInsuranceCompany.setInsuranceCompanyName(form.secondaryInsuranceNameTBox)>				
		<cfset request.secondaryInsuranceCompany.setEntityID(secondaryICEntityID)>				
		<cfset secondaryInsuranceCompanyID = request.secondaryInsuranceCompany.commit()>	
		
		<cfif IsDefined("secondaryICEntityID") AND IsNumeric(secondaryICEntityID) AND IsDefined("form.secondarySendToAddress1TBox") AND form.secondarySendToAddress1TBox NEQ "" AND IsDefined("form.secondarySendToCityTBox") AND form.secondarySendToCityTBox NEQ "">				
			<cfset request.secondaryICAddress = CreateObject("component","com.common.Address")>	
			<cfset request.secondaryICAddress.new(EntityID: trim(secondaryICEntityID), AddressTypeID: 12, AddressLine1: REQUEST.mssqlReplaceSingleQuote(trim(form.secondarySendToAddress1TBox)), AddressLine2: REQUEST.mssqlReplaceSingleQuote(trim(form.secondarySendToAddress2TBox)), City: REQUEST.mssqlReplaceSingleQuote(trim(form.secondarySendToCityTBox)), StateID: trim(form.secondarySendToStateTBox), ZipCode: REQUEST.mssqlReplaceSingleQuote(trim(form.secondarySendToZipCodeTBox)))>	
			<cfset secondaryICAddressID = request.secondaryICAddress.commit()>				
			<cfif IsDefined("request.secondaryICEntity") AND IsObject(request.secondaryICEntity)>
				<cfset request.secondaryICEntity.bindEntityAddress(clientID: trim(session.clientID), entityID: trim(secondaryICEntityID), addressID: trim(secondaryICAddressID), isDefault: 1)>
			</cfif>				
		</cfif>
				
		<cfif IsDefined("secondaryICEntityID") AND IsNumeric(secondaryICEntityID) AND IsDefined("form.secondaryPhoneNumberTBox") AND trim(form.secondaryPhoneNumberTBox) NEQ "">				
			<cfset secondaryICPhoneNumberE = application.beanFactory.getBean('globalFooter').GlobalFooterE(request.cleanNumericString(trim(form.secondaryPhoneNumberTBox))) />
			<cfset request.secondaryICPhone = CreateObject("component","com.common.Phone")>	
			<cfset request.secondaryICPhone.setPhoneTypeID(74)>
			<cfset request.secondaryICPhone.setPhoneNumber(trim(secondaryICPhoneNumberE))>
			<cfset secondaryICPhoneID = request.secondaryICPhone.commit()>				
			<cfif IsDefined("request.secondaryICEntity") AND IsObject(request.secondaryICEntity)>
				<cfset request.secondaryICEntity.bindEntityPhone(clientID: session.clientID, entityID: trim(secondaryICEntityID), PhoneID: trim(secondaryICPhoneID), IsDefault: 1)>
			</cfif>							
		</cfif>
					
		<cfif IsDefined("secondaryICEntityID") AND IsNumeric(secondaryICEntityID) AND IsDefined("form.secondaryFaxNumberTBox") AND trim(form.secondaryFaxNumberTBox) NEQ "">				
			<cfset secondaryICFaxNumberE = application.beanFactory.getBean('globalFooter').GlobalFooterE(request.cleanNumericString(trim(form.secondaryFaxNumberTBox))) />
			<cfset request.secondaryICFax = CreateObject("component","com.common.Phone")>	
			<cfset request.secondaryICFax.setPhoneTypeID(87)>
			<cfset request.secondaryICFax.setPhoneNumber(trim(secondaryICFaxNumberE))>
			<cfset secondaryICFaxID = request.secondaryICFax.commit()>				
			<cfif IsDefined("request.secondaryICEntity") AND IsObject(request.secondaryICEntity)>
				<cfset request.secondaryICEntity.bindEntityPhone(clientID: session.clientID, entityID: trim(secondaryICEntityID), phoneID: trim(secondaryICFaxID), IsDefault: 1)>
			</cfif>					
		</cfif>
		
		<!-------------------------------------------------------------------------------------->
		<!--- Save the secondary Patient Insurance Company.                                  --->
		<!-------------------------------------------------------------------------------------->	
		<cfif IsDefined("form.secondaryPolicyNumberTBox") AND form.secondaryPolicyNumberTBox NEQ "" AND IsDefined("secondaryInsuranceCompanyID") AND IsNumeric(secondaryInsuranceCompanyID)>
	
			<cf_tagPatientInsuranceSave
				action="create"
				newRecordIdentity="secondaryPICID"
				insuranceCompanyID="#secondaryInsuranceCompanyID#" 
				patientID="#trim(patientID)#"		
				PrimSecTer="1"
				policyNumber="#trim(form.secondaryPolicyNumberTBox)#"
				GroupNumberTBox="#trim(form.secondaryGroupNumberTBox)#"
				PolicyHoldersFirstName="#trim(form.secondaryPolicyHolderFNameTBox)#"
				PolicyHoldersMiddleInitial="#trim(form.secondaryPolicyHolderMInitialTBox)#"
				PolicyHoldersLastName="#trim(form.secondaryPolicyHolderLNameTBox)#"		
				PolicyHoldersDOBMM="#trim(form.secondaryHoldersDOBMM)#"
				PolicyHoldersDOBDD="#trim(form.secondaryHoldersDOBDD)#"
				PolicyHoldersDOBYY="#trim(form.secondaryHoldersDOBYY)#"		
				PolicyHoldersEmployerSchoolNameTBox="#trim(form.secondaryPolicyHolderEmployerTBox)#">
							
			<cfif IsDefined("form.secondaryNoteTBox") AND form.secondaryNoteTBox NEQ "">								
				<cfset request.Note = CreateObject("component", "com.common.Note")>
				<cfset noteID = request.Note.getNoteID(clientID: session.ClientID, objectID: 4, instanceID: secondaryPICID)>
				<cfif NOT IsNumeric(noteID)>
					<cfset noteID = request.Note.addNote(clientID: session.ClientID, objectID: 4, instanceID: secondaryPICID)>
				</cfif>
				<cfset request.Note.addNoteEntry(noteID: noteID, userID:session.User.getUsersID(), userFName: trim(session.user.getFName()), userLName: trim(session.user.getLName()), noteEntry: '#trim(form.secondaryNoteTBox)#', clientID: session.ClientID)>
			</cfif>							
						
		</cfif>
	
	<cfelseif IsDefined("form.hidden_secondaryPICID") AND IsNumeric(form.hidden_secondaryPICID)>				
		
		<cfset secondaryPICID = form.hidden_secondaryPICID>		
	
	</cfif>
			
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Save the verification if enough of the information is there.                   --->
	<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("secondaryPICID") AND IsNumeric(secondaryPICID) AND trim(secondaryVerificationID) EQ "" AND form.secondaryVerificationRepFNameTBox NEQ "" AND form.secondaryVerificationRepLNameTBox NEQ "">
		
		<cfset request.secondaryVerificationPIC = CreateObject("component","com.common.VerificationPIC")>
		<cfset request.secondaryVerificationPIC.setpicID(secondaryPICID)>
		<cfset request.secondaryVerificationPIC.setUsersID(session.User.getUsersID())>
		<cfset request.secondaryVerificationPIC.setVerificationRepFName(form.secondaryVerificationRepFNameTBox)>
		<cfset request.secondaryVerificationPIC.setVerificationRepLName(form.secondaryVerificationRepLNameTBox)>
		<cfset request.secondaryVerificationPIC.setVerificationTime(form.secondaryVerificationTimeTBox)>
		<cfset request.secondaryVerificationPIC.setVerificationDeductibleAmount(form.secondaryVerificationDeductibleAmountTBox)>
		<cfset request.secondaryVerificationPIC.setVerificationDeductibleAmountMet(form.secondaryVerificationDeductibleAmountMetTBox)>
		<cfset request.secondaryVerificationPIC.setVerificationPercentagePayAfterDeductible(form.secondaryVerificationPercentagePayAfterDeductibleTBox)>
		<cfset request.secondaryVerificationPIC.setVerificationAuthNumber(form.secondaryVerificationAuthNumberTBox)>
		<cfset request.secondaryVerificationPIC.setVerificationAuthPhoneNumber(request.cleanNumericString(form.secondaryVerificationAuthPhoneNumberTBox))>
		<cfset request.secondaryVerificationPIC.setVerificationTypeBasePlan(form.secondaryVerificationTypeBasePlanTBox)>	
		<cfset VerificationDate = "#trim(form.secondaryVerificationDateMM)#/#trim(form.secondaryVerificationDateDD)#/#trim(form.secondaryVerificationDateYY)#">
		<cfif IsDate(VerificationDate)>	
			<cfset request.secondaryVerificationPIC.setVerificationDate(VerificationDate)>
		</cfif>
		<cfset VerificationHaveInsFromDate = "#trim(form.secondaryVerificationHaveInsFromMM)#/#trim(form.secondaryVerificationHaveInsFromDD)#/#trim(form.secondaryVerificationHaveInsFromYY)#">
		<cfif IsDate(VerificationHaveInsFromDate)>	
			<cfset request.secondaryVerificationPIC.setVerificationHaveInsFromDate(VerificationHaveInsFromDate)>
		</cfif>
		<cfset VerificationHaveInsToDate = "#trim(form.secondaryVerificationHaveInsToMM)#/#trim(form.secondaryVerificationHaveInsToDD)#/#trim(form.secondaryVerificationHaveInsToYY)#">
		<cfif IsDate(VerificationHaveInsToDate)>		
			<cfset request.secondaryVerificationPIC.setVerificationHaveInsToDate(VerificationHaveInsToDate)>
		</cfif>
		<cfif IsNumeric(form.secondaryVerificationHaveInsYes)>
			<cfset request.secondaryVerificationPIC.setVerificationHaveIns(0)>
		<cfelseif IsNumeric(form.secondaryVerificationHaveInsNo)>
			<cfset request.secondaryVerificationPIC.setVerificationHaveIns(1)>
		</cfif> 
		<cfif IsNumeric(form.secondaryVerificationHaveDMECovYes)>
			<cfset request.secondaryVerificationPIC.setVerificationHaveDMECov(0)>
		<cfelseif IsNumeric(form.secondaryVerificationHaveDMECovNo)>
			<cfset request.secondaryVerificationPIC.setVerificationHaveDMECov(1)>
		</cfif>	
		<cfif IsNumeric(form.secondaryVerificationDeductibleYes)>
			<cfset request.secondaryVerificationPIC.setVerificationDeductible(0)>
		<cfelseif IsNumeric(form.secondaryVerificationDeductibleNo)>
			<cfset request.secondaryVerificationPIC.setVerificationDeductible(1)>	
		</cfif>
		<cfif IsNumeric(form.secondaryVerificationPPOPolicyYes)>
			<cfset request.secondaryVerificationPIC.setVerificationPPOPolicy(0)>
		<cfelseif IsNumeric(form.secondaryVerificationPPOPolicyNo)>
			<cfset request.secondaryVerificationPIC.setVerificationPPOPolicy(1)>	
		</cfif>
		<cfif IsNumeric(form.secondaryVerificationPriorAuthYes)>
			<cfset request.secondaryVerificationPIC.setVerificationPriorAuth(0)>
		<cfelseif IsNumeric(form.secondaryVerificationPriorAuthNo)>
			<cfset request.secondaryVerificationPIC.setVerificationPriorAuth(1)>
		</cfif>
		<cfif IsNumeric(form.secondaryVerificationLifetimeBenefitMetYes)>
			<cfset request.secondaryVerificationPIC.setVerificationLifetimeBenefitMet(0)>
		<cfelseif IsNumeric(form.secondaryVerificationLifetimeBenefitMetNo)>	
			<cfset request.secondaryVerificationPIC.setVerificationLifetimeBenefitMet(1)>
		</cfif>
		<cfif IsNumeric(form.secondaryMedicareSupplementYes)>	
			<cfset request.secondaryVerificationPIC.setVerificationMedicareSupplement(0)>
		<cfelseif IsNumeric(form.secondaryMedicareSupplementNo)>	
			<cfset request.secondaryVerificationPIC.setVerificationMedicareSupplement(1)>
		</cfif>		
		<cfif IsNumeric(form.secondaryCoordinateBenefitsYes)>	
			<cfset request.secondaryVerificationPIC.setVerificationCoordinateBenefits(0)>
		<cfelseif IsNumeric(form.secondaryCoordinateBenefitsNo)>	
			<cfset request.secondaryVerificationPIC.setVerificationCoordinateBenefits(1)>
		</cfif>			
		<cfif IsNumeric(form.secondaryPaidMedicareDeductibleYes)>	
			<cfset request.secondaryVerificationPIC.setVerificationPaidMedicareDeductible(0)>
		<cfelseif IsNumeric(form.secondaryPaidMedicareDeductibleNo)>	
			<cfset request.secondaryVerificationPIC.setVerificationPaidMedicareDeductible(1)>
		</cfif>		
		<cfif IsNumeric(form.secondaryVerificationMedicaidPlanMQMB)>	
			<cfset request.secondaryVerificationPIC.setVerificationMedicaidPlan(0)>
		<cfelseif IsNumeric(form.secondaryVerificationMedicaidPlanQMB)>	
			<cfset request.secondaryVerificationPIC.setVerificationMedicaidPlan(1)>
		<cfelseif IsNumeric(form.secondaryVerificationMedicaidPlanTraditional)>	
			<cfset request.secondaryVerificationPIC.setVerificationMedicaidPlan(2)>	
		</cfif>	
	
		<cfset secondaryVerificationPatientInsuranceID = request.secondaryVerificationPIC.commit()>
	
	</cfif>
	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- If the insurance information save the insurance company.                       --->
	<!-------------------------------------------------------------------------------------->		
	<cfif isDefined("form.hidden_tertiary_AutoSuggestInsuranceID") AND isNumeric(form.hidden_tertiary_AutoSuggestInsuranceID)>
		
		<cfset tertiaryInsuranceCompanyID = form.hidden_tertiary_AutoSuggestInsuranceID>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Save the tertiary Patient Insurance Company.                                   --->
		<!-------------------------------------------------------------------------------------->	
		<cfif IsDefined("form.tertiaryPolicyNumberTBox") AND form.tertiaryPolicyNumberTBox NEQ "" AND IsDefined("tertiaryInsuranceCompanyID") AND IsNumeric(tertiaryInsuranceCompanyID)>
	
			<cf_tagPatientInsuranceSave
				action="create"
				newRecordIdentity="tertiaryPICID"
				insuranceCompanyID="#tertiaryInsuranceCompanyID#" 
				patientID="#trim(patientID)#"		
				PrimSecTer="1"
				policyNumber="#trim(form.tertiaryPolicyNumberTBox)#"
				GroupNumberTBox="#trim(form.tertiaryGroupNumberTBox)#"
				PolicyHoldersFirstName="#trim(form.tertiaryPolicyHolderFNameTBox)#"
				PolicyHoldersMiddleInitial="#trim(form.tertiaryPolicyHolderMInitialTBox)#"
				PolicyHoldersLastName="#trim(form.tertiaryPolicyHolderLNameTBox)#"		
				PolicyHoldersDOBMM="#trim(form.tertiaryHoldersDOBMM)#"
				PolicyHoldersDOBDD="#trim(form.tertiaryHoldersDOBDD)#"
				PolicyHoldersDOBYY="#trim(form.tertiaryHoldersDOBYY)#"		
				PolicyHoldersEmployerSchoolNameTBox="#trim(form.tertiaryPolicyHolderEmployerTBox)#">
							
			<cfif IsDefined("form.tertiaryNoteTBox") AND form.tertiaryNoteTBox NEQ "">								
				<cfset request.Note = CreateObject("component", "com.common.Note")>
				<cfset noteID = request.Note.getNoteID(clientID: session.ClientID, objectID: 4, instanceID: tertiaryPICID)>
				<cfif NOT IsNumeric(noteID)>
					<cfset noteID = request.Note.addNote(clientID: session.ClientID, objectID: 4, instanceID: tertiaryPICID)>
				</cfif>
				<cfset request.Note.addNoteEntry(noteID: noteID, userID:session.User.getUsersID(), userFName: trim(session.user.getFName()), userLName: trim(session.user.getLName()), noteEntry: '#trim(form.tertiaryNoteTBox)#', clientID: session.ClientID)>
			</cfif>							
						
		</cfif>
		
	<cfelseif IsDefined("form.tertiaryInsuranceNameTBox") AND form.tertiaryInsuranceNameTBox NEQ "" AND (NOT IsDefined("form.hidden_tertiaryInsuranceID") OR NOT IsNumeric(form.hidden_tertiaryInsuranceID))>					
		
		<cfset request.tertiaryICEntity = CreateObject("component","com.common.Entity")>		
		<cfset request.tertiaryICEntity.setObjectTypeID(4)>
		<cfset tertiaryICEntityID = request.tertiaryICEntity.commit()>		
		
		<cfset request.tertiaryInsuranceCompany = CreateObject("component", "com.common.db.InsuranceCompanyIO")>			
		<cfset request.tertiaryInsuranceCompany.setInsuranceCompanyName(form.tertiaryInsuranceNameTBox)>				
		<cfset request.tertiaryInsuranceCompany.setEntityID(tertiaryICEntityID)>				
		<cfset tertiaryInsuranceCompanyID = request.tertiaryInsuranceCompany.commit()>	
		
		<cfif IsDefined("tertiaryICEntityID") AND IsNumeric(tertiaryICEntityID) AND IsDefined("form.tertiarySendToAddress1TBox") AND form.tertiarySendToAddress1TBox NEQ "" AND IsDefined("form.tertiarySendToCityTBox") AND form.tertiarySendToCityTBox NEQ "">				
			<cfset request.tertiaryICAddress = CreateObject("component","com.common.Address")>	
			<cfset request.tertiaryICAddress.new(EntityID: trim(tertiaryICEntityID), AddressTypeID: 12, AddressLine1: REQUEST.mssqlReplaceSingleQuote(trim(form.tertiarySendToAddress1TBox)), AddressLine2: REQUEST.mssqlReplaceSingleQuote(trim(form.tertiarySendToAddress2TBox)), City: REQUEST.mssqlReplaceSingleQuote(trim(form.tertiarySendToCityTBox)), StateID: trim(form.tertiarySendToStateTBox), ZipCode: REQUEST.mssqlReplaceSingleQuote(trim(form.tertiarySendToZipCodeTBox)))>	
			<cfset tertiaryICAddressID = request.tertiaryICAddress.commit()>				
			<cfif IsDefined("request.tertiaryICEntity") AND IsObject(request.tertiaryICEntity)>
				<cfset request.tertiaryICEntity.bindEntityAddress(clientID: trim(session.clientID), entityID: trim(tertiaryICEntityID), addressID: trim(tertiaryICAddressID), isDefault: 1)>
			</cfif>				
		</cfif>
				
		<cfif IsDefined("tertiaryICEntityID") AND IsNumeric(tertiaryICEntityID) AND IsDefined("form.tertiaryPhoneNumberTBox") AND trim(form.tertiaryPhoneNumberTBox) NEQ "">				
			<cfset tertiaryICPhoneNumberE = application.beanFactory.getBean('globalFooter').GlobalFooterE(request.cleanNumericString(trim(form.tertiaryPhoneNumberTBox))) />
			<cfset request.tertiaryICPhone = CreateObject("component","com.common.Phone")>	
			<cfset request.tertiaryICPhone.setPhoneTypeID(74)>
			<cfset request.tertiaryICPhone.setPhoneNumber(trim(tertiaryICPhoneNumberE))>
			<cfset tertiaryICPhoneID = request.tertiaryICPhone.commit()>				
			<cfif IsDefined("request.tertiaryICEntity") AND IsObject(request.tertiaryICEntity)>
				<cfset request.tertiaryICEntity.bindEntityPhone(clientID: trim(session.clientID), entityID: trim(tertiaryICEntityID), PhoneID: trim(tertiaryICPhoneID), IsDefault: 1)>
			</cfif>							
		</cfif>
					
		<cfif IsDefined("tertiaryICEntityID") AND IsNumeric(tertiaryICEntityID) AND IsDefined("form.tertiaryFaxNumberTBox") AND trim(form.tertiaryFaxNumberTBox) NEQ "">				
			<cfset tertiaryICFaxNumberE = application.beanFactory.getBean('globalFooter').GlobalFooterE(request.cleanNumericString(trim(form.tertiaryFaxNumberTBox))) />
			<cfset request.tertiaryICFax = CreateObject("component","com.common.Phone")>	
			<cfset request.tertiaryICFax.setPhoneTypeID(87)>
			<cfset request.tertiaryICFax.setPhoneNumber(trim(tertiaryICFaxNumberE))>
			<cfset tertiaryICFaxID = request.tertiaryICFax.commit()>				
			<cfif IsDefined("request.tertiaryICEntity") AND IsObject(request.tertiaryICEntity)>
				<cfset request.tertiaryICEntity.bindEntityPhone(clientID: trim(session.clientID), entityID: trim(tertiaryICEntityID), PhoneID: trim(tertiaryICFaxID), IsDefault: 1)>
			</cfif>					
		</cfif>
		
		<!-------------------------------------------------------------------------------------->
		<!--- Save the tertiary Patient Insurance Company.                                   --->
		<!-------------------------------------------------------------------------------------->	
		<cfif IsDefined("form.tertiaryPolicyNumberTBox") AND form.tertiaryPolicyNumberTBox NEQ "" AND IsDefined("tertiaryInsuranceCompanyID") AND IsNumeric(tertiaryInsuranceCompanyID)>
	
			<cf_tagPatientInsuranceSave
				action="create"
				newRecordIdentity="tertiaryPICID"
				insuranceCompanyID="#tertiaryInsuranceCompanyID#" 
				patientID="#trim(patientID)#"		
				PrimSecTer="1"
				policyNumber="#trim(form.tertiaryPolicyNumberTBox)#"
				GroupNumberTBox="#trim(form.tertiaryGroupNumberTBox)#"
				PolicyHoldersFirstName="#trim(form.tertiaryPolicyHolderFNameTBox)#"
				PolicyHoldersMiddleInitial="#trim(form.tertiaryPolicyHolderMInitialTBox)#"
				PolicyHoldersLastName="#trim(form.tertiaryPolicyHolderLNameTBox)#"		
				PolicyHoldersDOBMM="#trim(form.tertiaryHoldersDOBMM)#"
				PolicyHoldersDOBDD="#trim(form.tertiaryHoldersDOBDD)#"
				PolicyHoldersDOBYY="#trim(form.tertiaryHoldersDOBYY)#"		
				PolicyHoldersEmployerSchoolNameTBox="#trim(form.tertiaryPolicyHolderEmployerTBox)#">
							
			<cfif IsDefined("form.tertiaryNoteTBox") AND form.tertiaryNoteTBox NEQ "">								
				<cfset request.Note = CreateObject("component", "com.common.Note")>
				<cfset noteID = request.Note.getNoteID(clientID: session.ClientID, objectID: 4, instanceID: tertiaryPICID)>
				<cfif NOT IsNumeric(noteID)>
					<cfset noteID = request.Note.addNote(clientID: session.ClientID, objectID: 4, instanceID: tertiaryPICID)>
				</cfif>
				<cfset request.Note.addNoteEntry(noteID: noteID, userID:session.User.getUsersID(), userFName: trim(session.user.getFName()), userLName: trim(session.user.getLName()), noteEntry: '#trim(form.tertiaryNoteTBox)#', clientID: session.ClientID)>
			</cfif>							
						
		</cfif>
	
	<cfelseif IsDefined("form.hidden_tertiaryPICID") AND IsNumeric(form.hidden_tertiaryPICID)>					
		
		<cfset tertiaryPICID = form.hidden_tertiaryPICID>		
				
	</cfif>
			
	
	<!-------------------------------------------------------------------------------------->
	<!--- Save the verification if enough of the information is there.                   --->
	<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("tertiaryPICID") AND IsNumeric(tertiaryPICID) AND trim(tertiaryVerificationID) EQ "" AND form.tertiaryVerificationRepFNameTBox NEQ "" AND form.tertiaryVerificationRepLNameTBox NEQ "">
		
		<cfset request.tertiaryVerificationPIC = CreateObject("component","com.common.VerificationPIC")>
		<cfset request.tertiaryVerificationPIC.setpicID(tertiaryPICID)>
		<cfset request.tertiaryVerificationPIC.setUsersID(session.User.getUsersID())>
		<cfset request.tertiaryVerificationPIC.setVerificationRepFName(form.tertiaryVerificationRepFNameTBox)>
		<cfset request.tertiaryVerificationPIC.setVerificationRepLName(form.tertiaryVerificationRepLNameTBox)>
		<cfset request.tertiaryVerificationPIC.setVerificationTime(form.tertiaryVerificationTimeTBox)>
		<cfset request.tertiaryVerificationPIC.setVerificationDeductibleAmount(form.tertiaryVerificationDeductibleAmountTBox)>
		<cfset request.tertiaryVerificationPIC.setVerificationDeductibleAmountMet(form.tertiaryVerificationDeductibleAmountMetTBox)>
		<cfset request.tertiaryVerificationPIC.setVerificationPercentagePayAfterDeductible(form.tertiaryVerificationPercentagePayAfterDeductibleTBox)>
		<cfset request.tertiaryVerificationPIC.setVerificationAuthNumber(form.tertiaryVerificationAuthNumberTBox)>
		<cfset request.tertiaryVerificationPIC.setVerificationAuthPhoneNumber(request.cleanNumericString(form.tertiaryVerificationAuthPhoneNumberTBox))>
		<cfset request.tertiaryVerificationPIC.setVerificationTypeBasePlan(form.tertiaryVerificationTypeBasePlanTBox)>	
		<cfset VerificationDate = "#trim(form.tertiaryVerificationDateMM)#/#trim(form.tertiaryVerificationDateDD)#/#trim(form.tertiaryVerificationDateYY)#">
		<cfif IsDate(VerificationDate)>	
			<cfset request.tertiaryVerificationPIC.setVerificationDate(VerificationDate)>
		</cfif>
		<cfset VerificationHaveInsFromDate = "#trim(form.tertiaryVerificationHaveInsFromMM)#/#trim(form.tertiaryVerificationHaveInsFromDD)#/#trim(form.tertiaryVerificationHaveInsFromYY)#">
		<cfif IsDate(VerificationHaveInsFromDate)>	
			<cfset request.tertiaryVerificationPIC.setVerificationHaveInsFromDate(VerificationHaveInsFromDate)>
		</cfif>
		<cfset VerificationHaveInsToDate = "#trim(form.tertiaryVerificationHaveInsToMM)#/#trim(form.tertiaryVerificationHaveInsToDD)#/#trim(form.tertiaryVerificationHaveInsToYY)#">
		<cfif IsDate(VerificationHaveInsToDate)>		
			<cfset request.tertiaryVerificationPIC.setVerificationHaveInsToDate(VerificationHaveInsToDate)>
		</cfif>
		<cfif IsNumeric(form.tertiaryVerificationHaveInsYes)>
			<cfset request.tertiaryVerificationPIC.setVerificationHaveIns(0)>
		<cfelseif IsNumeric(form.tertiaryVerificationHaveInsNo)>
			<cfset request.tertiaryVerificationPIC.setVerificationHaveIns(1)>
		</cfif> 
		<cfif IsNumeric(form.tertiaryVerificationHaveDMECovYes)>
			<cfset request.tertiaryVerificationPIC.setVerificationHaveDMECov(0)>
		<cfelseif IsNumeric(form.tertiaryVerificationHaveDMECovNo)>
			<cfset request.tertiaryVerificationPIC.setVerificationHaveDMECov(1)>
		</cfif>	
		<cfif IsNumeric(form.tertiaryVerificationDeductibleYes)>
			<cfset request.tertiaryVerificationPIC.setVerificationDeductible(0)>
		<cfelseif IsNumeric(form.tertiaryVerificationDeductibleNo)>
			<cfset request.tertiaryVerificationPIC.setVerificationDeductible(1)>	
		</cfif>
		<cfif IsNumeric(form.tertiaryVerificationPPOPolicyYes)>
			<cfset request.tertiaryVerificationPIC.setVerificationPPOPolicy(0)>
		<cfelseif IsNumeric(form.tertiaryVerificationPPOPolicyNo)>
			<cfset request.tertiaryVerificationPIC.setVerificationPPOPolicy(1)>	
		</cfif>
		<cfif IsNumeric(form.tertiaryVerificationPriorAuthYes)>
			<cfset request.tertiaryVerificationPIC.setVerificationPriorAuth(0)>
		<cfelseif IsNumeric(form.tertiaryVerificationPriorAuthNo)>
			<cfset request.tertiaryVerificationPIC.setVerificationPriorAuth(1)>
		</cfif>
		<cfif IsNumeric(form.tertiaryVerificationLifetimeBenefitMetYes)>
			<cfset request.tertiaryVerificationPIC.setVerificationLifetimeBenefitMet(0)>
		<cfelseif IsNumeric(form.tertiaryVerificationLifetimeBenefitMetNo)>	
			<cfset request.tertiaryVerificationPIC.setVerificationLifetimeBenefitMet(1)>
		</cfif>
		<cfif IsNumeric(form.tertiaryMedicareSupplementYes)>	
			<cfset request.tertiaryVerificationPIC.setVerificationMedicareSupplement(0)>
		<cfelseif IsNumeric(form.tertiaryMedicareSupplementNo)>	
			<cfset request.tertiaryVerificationPIC.setVerificationMedicareSupplement(1)>
		</cfif>		
		<cfif IsNumeric(form.tertiaryCoordinateBenefitsYes)>	
			<cfset request.tertiaryVerificationPIC.setVerificationCoordinateBenefits(0)>
		<cfelseif IsNumeric(form.tertiaryCoordinateBenefitsNo)>	
			<cfset request.tertiaryVerificationPIC.setVerificationCoordinateBenefits(1)>
		</cfif>			
		<cfif IsNumeric(form.tertiaryPaidMedicareDeductibleYes)>	
			<cfset request.tertiaryVerificationPIC.setVerificationPaidMedicareDeductible(0)>
		<cfelseif IsNumeric(form.tertiaryPaidMedicareDeductibleNo)>	
			<cfset request.tertiaryVerificationPIC.setVerificationPaidMedicareDeductible(1)>
		</cfif>		
		<cfif IsNumeric(form.tertiaryVerificationMedicaidPlanMQMB)>	
			<cfset request.tertiaryVerificationPIC.setVerificationMedicaidPlan(0)>
		<cfelseif IsNumeric(form.tertiaryVerificationMedicaidPlanQMB)>	
			<cfset request.tertiaryVerificationPIC.setVerificationMedicaidPlan(1)>
		<cfelseif IsNumeric(form.tertiaryVerificationMedicaidPlanTraditional)>	
			<cfset request.tertiaryVerificationPIC.setVerificationMedicaidPlan(2)>	
		</cfif>	
	
		<cfset tertiaryVerificationPatientInsuranceID = request.tertiaryVerificationPIC.commit()>
	
	</cfif>
	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Now that all is in the database whether it is an update or an insert check to  --->
	<!--- make sure all the necessary data is there to release from PENDING.             --->
	<!-------------------------------------------------------------------------------------->
	<cfif IsDefined("intakeID") AND IsNumeric(intakeID)>

		<cfset upgrade = 1>
		<cfset optionsList = "otherTBox,hospiceTBox,hospitalTBox,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo,OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing,OPTION_2_CBox_Other,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital,OPTION_3_CBox_Medicare,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay">
		<!---OPTION_3a_CBox_PatientSexMale,OPTION_3a_CBox_PatientSexFemale,--->
		<cfset list1 = "otherTBox,hospiceTBox,hospitalTBox">
		<cfset list2 = "OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo">
		<cfset list3 = ""><!---OPTION_3a_CBox_PatientSexMale,OPTION_3a_CBox_PatientSexFemale--->
		<cfset list4 = "OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing">
		<cfset list5 = "OPTION_2_CBox_Other,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital">
		<cfset list6 = "OPTION_3_CBox_Medicare,OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay">

		<cfquery name="getThisIntake" datasource="#trim(request.datasource)#">
			SELECT otherTBox,hospiceTBox,hospitalTBox,OPTION_13_CBox_PastEquipmentYes,OPTION_13_CBox_PastEquipmentNo,
			OPTION_1_CBox_Delivery,OPTION_1_CBox_Pickup,OPTION_1_CBox_Repair,OPTION_1_CBox_Switch,OPTION_1_CBox_Existing,
			OPTION_2_CBox_Other,OPTION_2_CBox_Hospice,OPTION_2_CBox_Hospital,OPTION_3_CBox_Medicare,
			OPTION_3_CBox_PrivateInsurance,OPTION_3_CBox_Medicaid,OPTION_3_CBox_PrivatePay,
			callerFNameTBox,callerLNameTBox,callerPhoneTBox,
			PatientID,PatientAddressID,patientPhoneID,			
			alternateContactFNameTBox,alternateContactLNameTBox,alternateContactRelationshipTBox,alternateContactPhoneTBox,
			orderingPhysicianFNameTBox,orderingPhysicianLNameTBox,orderingPhysicianPhoneTBox,orderingPhysicianUPINTBox,
			orderingPhysicianFaxTBox,orderingPhysicianAddressTBox,orderingPhysicianCityTBox,orderingPhysicianStateTBox,
			orderingPhysicianZipTBox
			FROM intake
			WHERE IntakeID = #trim(intakeID)#
		</cfquery>
		
		<!---
		,primaryInsuranceNameTBox,primaryPolicyNumberTBox,primaryPhoneNumberTBox,
			primaryEffectiveDateMM,primaryEffectiveDateDD,primaryEffectiveDateYY,primaryPolicyHolderFNameTBox,
			primaryPolicyHolderLNameTBox,primaryHoldersDOBMM,primaryHoldersDOBDD,primaryHoldersDOBYY
		OPTION_3a_CBox_PatientSexMale,OPTION_3a_CBox_PatientSexFemale,
			patientFNameTBox,patientLNameTBox,
			patientSSNTBox,patientAddressTBox,patientCityTBox,patientStateTBox,patientZipTBox,
			patientPhoneTBox,patientDOBMM,patientDOBDD,patientDOBYY,patientHeightInches,patientWeightTBox,
		--->


		<cfloop list="#getThisIntake.ColumnList#" index="i_col">
			<cfif NOT ListFindNoCase(optionsList, trim(i_col))>
				<cfset column = "getThisIntake.#i_col#">
				<cfif evaluate(column) EQ "">
					<cfset upgrade = 0>
					<cfbreak>
				</cfif>
			</cfif>
		</cfloop>

		<cfif upgrade>
			<cfset upgrade = 0>
			<cfloop list="#list1#" index="i">
				<cfset column = "getThisIntake.#trim(i)#"><cfif evaluate(column) NEQ ""><cfset upgrade = 1><cfbreak></cfif>
			</cfloop>
		</cfif>
		<cfif upgrade>
			<cfset upgrade = 0>
			<cfloop list="#list2#" index="i">
				<cfset column = "getThisIntake.#trim(i)#"><cfif evaluate(column) NEQ ""><cfset upgrade = 1><cfbreak></cfif>
			</cfloop>
		</cfif>
		<!---<cfif upgrade>
			<cfset upgrade = 0>
			<cfloop list="#list3#" index="i">
				<cfset column = "getThisIntake.#trim(i)#"><cfif evaluate(column) NEQ ""><cfset upgrade = 1><cfbreak></cfif>
			</cfloop>
		</cfif>--->
		<cfif upgrade>
			<cfset upgrade = 0>
			<cfloop list="#list4#" index="i">
				<cfset column = "getThisIntake.#trim(i)#"><cfif evaluate(column) NEQ ""><cfset upgrade = 1><cfbreak></cfif>
			</cfloop>
		</cfif>
		<cfif upgrade>
			<cfset upgrade = 0>
			<cfloop list="#list5#" index="i">
				<cfset column = "getThisIntake.#trim(i)#"><cfif evaluate(column) NEQ ""><cfset upgrade = 1><cfbreak></cfif>
			</cfloop>
		</cfif>
		<cfif upgrade>
			<cfset upgrade = 0>
			<cfloop list="#list6#" index="i">
				<cfset column = "getThisIntake.#trim(i)#"><cfif evaluate(column) NEQ ""><cfset upgrade = 1><cfbreak></cfif>
			</cfloop>
		</cfif>


		<cfif upgrade>
			<cfquery name="updateThisIntake" datasource="#trim(request.datasource)#">
				UPDATE intake SET InactiveCode = NULL
				WHERE IntakeID = #trim(intakeID)#
			</cfquery>
		</cfif>

		<!---<cfset msg = "[#upgrade#] " & msg>--->

	</cfif>



	<!-------------------------------------------------------------------------------------->
	<!--- Forward the user.                                                              --->
	<!-------------------------------------------------------------------------------------->
	<!---<cfif ListContains(session.User.getRoleIDs(), "5") OR ListContains(session.User.getRoleIDs(), "6")>
 		<cflocation addtoken="No" url="appPatientIntakeSearch.cfm?msg=#URLEncodedFormat(trim(msg))#">
	<cfelse>
 		<cflocation addtoken="No" url="appMyDesktop.cfm?msg=#URLEncodedFormat(trim(msg))#">
	</cfif>--->
	<cflocation addtoken="No" url="appPatientIntakeEdit.cfm?intakeID=#trim(intakeID)#&msg=#URLEncodedFormat(trim(msg))#">


	<!--- CFCATCH QUERY ERRORS--->
	<cfcatch type="Any">
		
		<cfmail from="support@eobmanager.net" to="gcruz@eobmanager.net" subject="There was an issue processing the page. Please try your intake again. - #DateFormat( now(), 'm/d/yyyy' )# #TimeFormat( now() )#" type="HTML">
			<cfif IsDefined("FORM.fieldnames")>
				<cfloop list="#trim(form.FieldNames)#" index="i">
					form.#trim(i)# = #trim(evaluate(i))#<br />
				</cfloop>		
			</cfif>
		</cfmail>

		<cfset message = "There was an issue processing the page. Please try your intake again. If you continue to see this message please contact your site administrator.">

		<cf_gcGatewayLogger
			datasource="#trim(request.datasource)#"
			code="115"
			logtext="<p>Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p> #PreserveSingleQuotes(sqlStatement)#">

		<cfset intakeIDNote = "">	
		<cfif IsDefined("intakeID") AND IsNumeric(intakeID)>
			<cfset intakeIDNote = "[intakeID: #intakeID#]">
		</cfif>	
		
		<cf_gcSendEmail	from="support@eobmanager.net" to="support@eobmanager.net" bcc="gcruz@eobmanager.net" 
			subject="IMMEDIATE ATTENTION REQUIRED. User attempted to insert/UPDATE intake failed."
			message="#intakeIDNote#<p><strong>User was sent:</strong> <br>#trim(message)#</p><p><strong>Admin Note:</strong><p>Caught an exception, type = #CFCATCH.TYPE#</p><p>#cfcatch.message# #cfcatch.detail#</p></p>">

		<cf_gcGeneralErrorTemplate
			message="#trim(message)#"
			width="75%">

		<cfabort>

	</cfcatch>


</cftry>





