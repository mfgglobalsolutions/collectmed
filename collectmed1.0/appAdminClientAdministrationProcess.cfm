<!---- appAdminClientAdministrationProcess.cfm ---->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.addressIDList" default="">
	<cfset addressIDList = attributes.addressIDList>
	
	<cfparam name="attributes.EntityID" default="">
	<cfset EntityID = attributes.EntityID>

	<cfif IsDefined("form.EntityID") AND form.EntityID NEQ "">
		<cfset EntityID = form.EntityID>
	<cfelseif IsDefined("url.EntityID") AND url.EntityID NEQ "">
		<cfset EntityID = url.EntityID>	
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Verify that the needed parameters have been sent in.                           --->
<!-------------------------------------------------------------------------------------->
	<cf_gcVerifyFields
		fields="EntityID"
		fieldnames="Entity ID"
		datatypes="numeric">	
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Start the process of this page with a try catch.                               --->
<!-------------------------------------------------------------------------------------->	
	<cftry>
		
		<cftransaction>
						
			<!-------------------------------------------------------------------------------------->
			<!--- The phone numbers the user inputs.                                             --->
			<!-------------------------------------------------------------------------------------->	
			<cfset phonenumberDBIDs = "">
			
			<cfloop list="#trim(form.phonenumbers)#" index="i">					
				<cfif IsNumeric(ListGetAt(i, 2, "|"))>
					<cfset phonenumberDBIDs = ListAppend(phonenumberDBIDs, ListGetAt(i, 2, "|"))>
				</cfif>			
			</cfloop>
						
			<cfquery name="archiveOldPhoneNumbers" datasource="#trim(request.datasource)#">
				UPDATE EntityPhone 
				SET Active = 0, InactiveCode = 68
				WHERE EntityID = #trim(EntityID)# <cfif phonenumberDBIDs NEQ ""> AND PhoneID NOT IN(#trim(phonenumberDBIDs)#)</cfif>	
			</cfquery>
			
			
			<cfloop list="#trim(form.phonenumbers)#" index="i">
				
				<cfset id = ListGetAt(i, 1, "|")>
				
				<cfif ListGetAt(i, 2, "|") EQ "@@">
					<cfset phoneDBID = "">
				<cfelse>
					<cfset phoneDBID = ListGetAt(i, 2, "|")>	
				</cfif>
				
				<cfset PhoneTypeID = ListGetAt(i, 3, "|")>			
				<cfset IsDefault = ListGetAt(i, 4, "|")>								
				<cfset PhoneNumber = ListGetAt(i, 5, "|")>
				
				<cfif ListLen(i, "|") EQ 6>
					<cfset PhoneExtension = ListGetAt(i, 6, "|")>
				<cfelse>	
					<cfset PhoneExtension = "">
				</cfif>
				
				<cfset PhoneNumberE = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(PhoneNumber)) />
				<cfset PhoneExtensionE = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(PhoneExtension)) />
						
				<cfif NOT IsNumeric(phoneDBID)> 						
																	
					<cfquery name="insertPhoneNumber" datasource="#trim(request.datasource)#">
						INSERT INTO Phone  (EntityID, PhoneTypeID, PhoneNumber, PhoneExtension)
						VALUES(#trim(EntityID)#, #trim(PhoneTypeID)#, '#trim(PhoneNumberE)#', '#trim(PhoneExtensionE)#');
						SELECT LAST_INSERT_ID() AS phoneID 
					</cfquery>
									
					<cfquery name="insertEntityPhoneRecord" datasource="#trim(request.datasource)#">
						INSERT INTO EntityPhone  (EntityID, PhoneID, IsDefault)
						VALUES(#trim(EntityID)#, #trim(phoneID)#, #trim(IsDefault)#);
						SELECT LAST_INSERT_ID() AS phoneID 
					</cfquery>				
					
					<cfset phoneID = insertEntityPhoneRecord.phoneID>			
								
				<cfelse>
				
					<cfquery name="updatePhoneNumber" datasource="#trim(request.datasource)#">
						UPDATE Phone 
						SET PhoneTypeID = #trim(PhoneTypeID)#, PhoneNumber = '#trim(PhoneNumberE)#', PhoneExtension = '#trim(PhoneExtensionE)#' 
						WHERE PhoneID = #trim(phoneDBID)#					
					</cfquery>		
					
					<cfset phoneID = phoneDBID>		
					
				</cfif>
				
				
				<cfif IsDefault EQ 1>
					<cfset MainPhoneID = phoneID>
				</cfif>
												
			</cfloop>
			
			<!--- End Phone section--->		
		
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- The Email Addresses the user inputs.                                           --->
			<!-------------------------------------------------------------------------------------->	
			<cfset emailaddressDBIDs = "">
			
			<cfloop list="#trim(form.emailaddresses)#" index="i">					
				<cfif IsNumeric(ListGetAt(i, 2, "|"))>
					<cfset emailaddressDBIDs = ListAppend(emailaddressDBIDs, ListGetAt(i, 2, "|"))>
				</cfif>			
			</cfloop>
			
			<cfquery name="archiveOldEmailAddresses" datasource="#trim(request.datasource)#">
				UPDATE EmailAddress 
				SET Active = 0, InactiveCode = 68
				WHERE EntityID = #trim(EntityID)# <cfif emailaddressDBIDs NEQ ""> AND EmailAddressID NOT IN(#trim(emailaddressDBIDs)#)</cfif>	
			</cfquery>
			
						
			<cfloop list="#trim(form.emailaddresses)#" index="i">
				
				<cfset id = ListGetAt(i, 1, "|")>
				
				<cfif ListGetAt(i, 2, "|") EQ "@@">
					<cfset emailaddressDBID = "">
				<cfelse>
					<cfset emailaddressDBID = ListGetAt(i, 2, "|")>	
				</cfif>
				
				<cfset EmailTypeID = ListGetAt(i, 3, "|")>			
				<cfset IsDefault = ListGetAt(i, 4, "|")>							
				<cfset EmailAddress = ListGetAt(i, 5, "|")>
				
				<cfset EmailAddressE = application.beanFactory.getBean('globalFooter').GlobalFooterE(lcase(trim(EmailAddress))) />	
								
				<cfif NOT IsNumeric(emailaddressDBID)> 					
												
					<cfquery name="checkEmailAddress" datasource="#request.datasource#">
						SELECT Email
						FROM EmailAddress  
						WHERE Email = '#trim(EmailAddressE)#'
					</cfquery>
					
					<cfif checkEmailAddress.RecordCount GTE 1>
						<cfthrow message="The email address already exists.">
					</cfif>
						
								
					<cfquery name="insertEmailAddress" datasource="#trim(request.datasource)#">
						INSERT INTO EmailAddress  (EntityID, EmailTypeID, Email, IsDefault)
						VALUES(#trim(EntityID)#, #trim(EmailTypeID)#, '#trim(EmailAddressE)#', #trim(IsDefault)#);
						SELECT LAST_INSERT_ID() AS emailID 
					</cfquery>
					
					<cfset emailID = insertEmailAddress.emailID>
																	
				<cfelse>
				
					<cfquery name="updateEmailAddress" datasource="#trim(request.datasource)#">
						UPDATE EmailAddress 
						SET EmailTypeID = #trim(EmailTypeID)#, Email = '#trim(EmailAddressE)#'
						WHERE EmailAddressID = #trim(emailaddressDBID)#					
					</cfquery>
					
					<cfset emailID = trim(emailaddressDBID)>
									
				</cfif>
				
				<cfif IsDefault EQ 1>
					<cfset SupportEmailID = emailID>
				</cfif>
				
												
			</cfloop>
			<!--- End Email section--->
			
			
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- The Addresses the user inputs.                                                 --->
			<!-------------------------------------------------------------------------------------->	
			<cfset AddressDBIDs = "">
			
			<cfloop list="#trim(form.addresses)#" index="i">					
				<cfif IsNumeric(ListGetAt(i, 2, "|"))>
					<cfset AddressDBIDs = ListAppend(AddressDBIDs, ListGetAt(i, 2, "|"))>
				</cfif>			
			</cfloop>
			
			<cfquery name="archiveOldAddresses" datasource="#trim(request.datasource)#">
				UPDATE EntityAddress 
				SET Active = 0, InactiveCode = 68
				WHERE EntityID = #trim(EntityID)# <cfif addressDBIDs NEQ ""> AND AddressID NOT IN(#trim(AddressDBIDs)#)</cfif>	
			</cfquery>
				
					
			<cfset Count = 1>
			
			<cfloop list="#trim(form.Addresses)#" index="i">
								
				<cfset id = ListGetAt(i, 1, "|")>
				
				<cfif ListGetAt(i, 2, "|") EQ "@@">
					<cfset AddressDBID = "">
				<cfelse>
					<cfset AddressDBID = ListGetAt(i, 2, "|")>	
				</cfif>
				
				<cfset AddressTypeID = ListGetAt(i, 3, "|")>			
				<cfset IsDefault = ListGetAt(i, 4, "|")>					
				<cfset AddressLine1 = ListGetAt(i, 5, "|")>
				<cfset AddressLine2 = ListGetAt(i, 6, "|")>
				<cfset City = ListGetAt(i, 7, "|")>
				<cfset StateID = ListGetAt(i, 8, "|")>
				<cfset ZipCode = ListGetAt(i, 9, "|")>
											
				<cfif NOT IsNumeric(AddressDBID)> 					
												
					<cfquery name="insertAddress" datasource="#trim(request.datasource)#">
						INSERT INTO Address  (AddressTypeID, AddressLine1, AddressLine2, City, StateID, ZipCode)
						VALUES(#trim(AddressTypeID)#, '#trim(AddressLine1)#', '#trim(AddressLine2)#', '#trim(City)#', #trim(StateID)#, '#trim(ZipCode)#');
						SELECT LAST_INSERT_ID() AS addressID 
					</cfquery>
														
					<cfquery name="insertEntityAddress" datasource="#trim(request.datasource)#">
						INSERT INTO EntityAddress  (EntityID, AddressID, IsDefault)
						VALUES(#trim(EntityID)#, #trim(insertAddress.AddressID)#, #trim(IsDefault)#)						
					</cfquery>
					
					<cfset addressID = insertAddress.addressID>
												
				<cfelse>
				
					<cfquery name="updateAddress" datasource="#trim(request.datasource)#">
						UPDATE Address 
						SET AddressTypeID = #trim(AddressTypeID)#, AddressLine1 = '#trim(AddressLine1)#', AddressLine2 = '#trim(AddressLine2)#', City = '#trim(City)#', StateID = #trim(StateID)#, ZipCode = '#trim(ZipCode)#'
						WHERE AddressID = #trim(AddressDBID)#					
					</cfquery>
					
					<cfset addressID = trim(AddressDBID)>							
					
				</cfif>
				
				
				<cfset addressIDList = ListAppend(addressIDList, addressID)>
				
								
				<cfif IsDefault EQ 1>
					<cfset SupportAddressID = addressID>
				</cfif>		
				
								
				<!-------------------------------------------------------------------------------------->
				<!--- If the address is being added and the payment preference address is set then   --->
				<!--- we need that addressID.                                                        --->
				<!-------------------------------------------------------------------------------------->				
				<!---<cfif IsDefined("form.PaymentPreference") AND form.PaymentPreference EQ 8 AND FIND("@@", form.checkBillingAddressID_Hidden) AND form.checkBillingAddressID EQ Count>
					<cfset form.checkBillingAddressID_Hidden = addressID>
				<!---<cfelseif IsDefined("form.PaymentPreference") AND form.PaymentPreference EQ 7 AND form.checkBillingAddressID_Hidden EQ "@@" AND form.checkBillingAddressID EQ Count>
					<cfset form.checkBillingAddressID_Hidden = addressID>	--->
				</cfif>--->
				
				<cfset Count = Count + 1>	
				
												
			</cfloop>
			
			
			
			<!--- End Address section--->
			
			
			
			
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- The Credit Cards the user inputs.                                              --->
			<!-------------------------------------------------------------------------------------->	
			<!---<cfif IsDefined("form.ccards") AND trim(form.ccards) NEQ "">
			
				<cfset CreditCardDBIDs = "">
				
				<cfloop list="#trim(form.ccards)#" index="i">					
					<cfif IsNumeric(ListGetAt(i, 2, "|"))>
						<cfset CreditCardDBIDs = ListAppend(CreditCardDBIDs, ListGetAt(i, 2, "|"))>
					</cfif>			
				</cfloop>
				
				<cfquery name="archiveOldCreditCards" datasource="#trim(request.datasource)#">
					UPDATE EntityRS 
					SET Active = 0, InactiveCode = 68
					WHERE EntityID = #trim(EntityID)# <cfif CreditCardDBIDs NEQ ""> AND EntityRSID NOT IN(#trim(CreditCardDBIDs)#)</cfif>	
				</cfquery>
				
				
				<cfset ccCount = 1>
				
				<cfloop list="#trim(form.ccards)#" index="i">
												
					<cfset id = ListGetAt(i, 1, "|")>
					
					<cfif ListGetAt(i, 2, "|") EQ "@@">
						<cfset ccDBID = "">
					<cfelse>
						<cfset ccDBID = ListGetAt(i, 2, "|")>	
					</cfif>
					
					<cfset ccCreditCardTypeID = ListGetAt(i, 3, "|")>			
					<cfset ccCardHolderName = ListGetAt(i, 4, "|")>					
					<cfset ccCardNumber = ListGetAt(i, 5, "|")>
					<cfset ccExpirationMonth = ListGetAt(i, 6, "|")>
					<cfset ccExpirationYear = ListGetAt(i, 7, "|")>
					<cfset ccVerificationNumber = ListGetAt(i, 8, "|")>
					
					<!---<cfset ccBillingAddressID = ListGetAt(i, 9, "|")>--->
					<cfif FIND("@@", ListGetAt(i, 9, "|"))>
						<cfset temp = ListGetAt(i, 9, "|")>
						<cfset temp1 = ListGetAt(temp, 2, "_")>
						<cfset ccBillingAddressID = ListGetAt(addressIDList, temp1)>
						
						<cf_db_Insert_debugTable
							referenceid="445"
							note="addressIDList: #addressIDList# - temp: #temp# - temp1: #temp1# - ccDBID: #ccDBID#">	
						
					<cfelse>
						<cfset ccBillingAddressID = ListGetAt(i, 9, "|")>	
					</cfif>
					
					<cfset ccIsDefault = ListGetAt(i, 10, "|")>
					
					
					
					
					<cfset Entry1 = application.beanFactory.getBean('globalFooter').GlobalFooterlistE(trim(ccCreditCardTypeID)#|#trim(ccCardHolderName)#|#trim(ccCardNumber)#|#trim(ccExpirationMonth)#|#trim(ccExpirationYear)#|#trim(ccVerificationNumber)#|#trim(ccBillingAddressID)) />	
					<cfset EccCreditCardTypeID = ListGetAt(Entry1, 1, "|")>					
					<cfset EccCardHolderName = ListGetAt(Entry1, 2, "|")>		
					<cfset EccCardNumber = ListGetAt(Entry1, 3, "|")>					
					<cfset EccExpirationMonth = ListGetAt(Entry1, 4, "|")>
					<cfset EccExpirationYear = ListGetAt(Entry1, 5, "|")>				
					<cfset EccVerificationNumber = ListGetAt(Entry1, 6, "|")>
					<cfset EccBillingAddressID = ListGetAt(Entry1, 7, "|")>			
							
												
					<cfif NOT IsNumeric(ccDBID)> 					
																						
						<cfquery name="insertEntityRS" datasource="#trim(request.datasource)#">
							INSERT INTO EntityRS  (EntityID, ColM, ColE, ColL, ColI, ColA, ColC, ColR, IsDefault)
							VALUES(#trim(EntityID)#, '#trim(EccCreditCardTypeID)#', '#trim(EccCardHolderName)#', '#trim(EccCardNumber)#', '#trim(EccExpirationMonth)#', '#trim(EccExpirationYear)#', '#trim(EccVerificationNumber)#', '#trim(EccBillingAddressID)#', #trim(ccIsDefault)#);
							SELECT LAST_INSERT_ID() AS EntityRSID 
						</cfquery>						
													
					<cfelse>				
						
						<cfquery name="updateEntityRS" datasource="#trim(request.datasource)#">
							UPDATE EntityRS 
							SET ColM = '#trim(EccCreditCardTypeID)#', ColE = '#trim(EccCardHolderName)#', ColL = '#trim(EccCardNumber)#', ColI = '#trim(EccExpirationMonth)#', ColA = '#trim(EccExpirationYear)#', ColC = '#trim(EccVerificationNumber)#', ColR = '#trim(EccBillingAddressID)#', IsDefault = #trim(ccIsDefault)#						
							WHERE EntityRSID = #trim(ccDBID)#					
						</cfquery>	
						
					</cfif>
					
					<cfset cccount =  ccCount + 1>
													
				</cfloop>
				
			</cfif>--->
			
			
						
			<!-------------------------------------------------------------------------------------->
			<!--- If the user shose check debiting and all the fields are available save them    --->
			<!-------------------------------------------------------------------------------------->			
			<!---<cfif IsDefined("form.PaymentPreference") AND form.PaymentPreference EQ 8>
				
				<cfif form.BankRoutingCode EQ "" OR form.BankAccountNumber EQ "" OR NOT IsNumeric(form.checkBillingAddressID_Hidden)>
					<cfthrow message="There is missing information for check debiting please re-enter the information.">
				</cfif>
				
				<cfset Cols = application.beanFactory.getBean('globalFooter').GlobalFooterListE(trim(form.BankRoutingCode)#|#trim(form.BankAccountNumber)#|#trim(form.checkBillingAddressID_Hidden)) />
				
				<cfquery name="getEntitySSID" datasource="#trim(request.datasource)#">
					SELECT EntitySSID
					FROM EntitySS  
					WHERE EntityID = #trim(EntityID)#
				</cfquery> 
				
				<cfif getEntitySSID.RecordCount EQ 1>
							
					<cfquery name="insertEntitySS" datasource="#trim(request.datasource)#">
						UPDATE EntitySS  
						SET ColM = '#ListGetAt(Cols, 1, "|")#', ColE = '#ListGetAt(Cols, 2, "|")#', ColR = '#ListGetAt(Cols, 3, "|")#'						
						WHERE EntityID = #trim(EntityID)#
					</cfquery>
				
				<cfelseif getEntitySSID.RecordCount GT 1>
				
					<cfset message = "There is an issue with your account please contact an administrator.">
													
					<cfinvoke
						component="com.common.db.EmailAddressIO" 
						method="getEmailAddressQuery"
						returnVariable="EAQuery"
						fields="Email"
						EmailAddressID="#request.Site.getSupportEmailAddressID()#">
										
					<cf_gcSendEmail
						from="#trim(EAQuery.Email)#"
						to="#trim(EAQuery.Email)#"
						subject="Mulitple entries in EntitySS."
						message="#trim(Message)#">	
						
					<cfthrow message="#trim(message)#">	
				
				<cfelse>
					
					<cfquery name="insertEntitySS" datasource="#trim(request.datasource)#">
						INSERT INTO EntitySS  (EntityID, ColM, ColE, ColR, IsDefault)
						VALUES(#trim(EntityID)#, '#ListGetAt(Cols, 1, "|")#', '#ListGetAt(Cols, 2, "|")#', '#ListGetAt(Cols, 3, "|")#', 1);
						SELECT LAST_INSERT_ID() AS EntitySSID 
					</cfquery>
				
				</cfif>
			
			
			
			
			</cfif>--->
			
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Insert the client information.                                                 --->
			<!-------------------------------------------------------------------------------------->
			<cfif trim(form.clientName) EQ "">
				<cfthrow message="The client name cannot be left blank">
			</cfif>
									
			<cfquery name="updateClient" datasource="#trim(request.datasource)#">
				UPDATE pa_master.Client 
				SET ClientName = '#trim(form.clientName)#', SupportEmailID = #trim(SupportEmailID)#, MainPhoneID = #trim(MainPhoneID)#, ClientDBA = <cfif trim(form.clientDBA) EQ "">NULL<cfelse>'#trim(form.clientDBA)#'</cfif>
				WHERE EntityID = #trim(EntityID)#
			</cfquery>		

			
			
			
			
			
		
		</cftransaction>
			
			
			<cfcatch type="Any">
			
				<cfoutput>
					
					<p>Caught an exception, type = #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>	       
			        The contents of the tag stack are:<br>
			        <cfdump var="#cfcatch.tagcontext#">  
	
				</cfoutput>
				<cfabort>
				
			</cfcatch>
		
	</cftry>	
	
		
		
<!-------------------------------------------------------------------------------------->
<!--- Locate the user back to the admin screen with a message.                       --->
<!-------------------------------------------------------------------------------------->
	<cfset msg = "<font size=3 face=Verdana color=990000><strong>Your account has been updated.</strong></font>">
	<!---<cfdump var="#form#"> <cfabort>--->
	<cflocation addtoken="No" url="appAdminClientAdministration.cfm?msg=#URLEncodedFormat(trim(msg))#">		
	
	