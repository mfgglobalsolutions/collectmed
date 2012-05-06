<!---- appAdminUsersEditProcess.cfm ---->

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->			
	<cfparam name="attributes.msg" default="">
	<cfset msg = attributes.msg>
	
	<cfparam name="attributes.EntityID" default="">
	<cfset EntityID = attributes.EntityID>
	
	<cfif IsDefined("form.EntityID") AND form.EntityID NEQ "">
		<cfset EntityID = form.EntityID>
	<cfelseif IsDefined("url.EntityID") AND url.EntityID NEQ "">
		<cfset EntityID = url.EntityID>	
	</cfif>
	
	
<!------------------------------------------------------------------>
<!--- Verify that the needed parameters have been sent in.       --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="EntityID"
		fieldnames="User ID"
		datatypes="numeric">	
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Get the users ID from the Users Table                                          --->
<!-------------------------------------------------------------------------------------->
	<cfquery name="getUserID" datasource="#trim(request.datasource)#">
		SELECT UsersID FROM pa_master.users   WHERE EntityID = #trim(EntityID)# 
	</cfquery>				
	
	<cfset usersID = getUserID.UsersID>

<!------------------------------------------------------------------>
<!--- Verify that the needed parameters have been sent in.       --->
<!------------------------------------------------------------------>
	<cf_gcVerifyFields
		fields="usersID"
		fieldnames="User Account ID"
		datatypes="numeric">	
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- All the queries and process must go in a transaction to asure they get done.   --->
<!-------------------------------------------------------------------------------------->
<cftransaction>		
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Update the username and the password.                                          --->
		<!-------------------------------------------------------------------------------------->		
		<cfset Entry = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(form.username)) />
		<cfset EntryPoint = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(form.password)) />
		
		<cfquery name="updateUsers" datasource="#trim(request.datasource)#">
			UPDATE pa_master.Users 
			SET Entry = '#trim(Entry)#', EntryPoint = '#trim(EntryPoint)#'
			WHERE EntityID = #trim(EntityID)#
		</cfquery>
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- Give the user their roles.                                                     --->
		<!-------------------------------------------------------------------------------------->				
		<cfquery name="deleteUserRoles_MASTER" datasource="#trim(request.datasource)#">
			DELETE FROM pa_master.UsersRole  WHERE usersID = #trim(usersID)# 
		</cfquery>		
		<cfquery name="deleteUserRoles" datasource="#trim(request.datasource)#">
			DELETE FROM UsersRole  WHERE usersID = #trim(usersID)# 
		</cfquery>		
		
		<cfquery name="getAllMASTERRoles" datasource="#trim(request.datasource)#">
			SELECT RoleID
			FROM pa_master.[Role]					
		</cfquery>	
		<cfset masterRoles = valueList(getAllMASTERRoles.RoleID)>
		
		<cfquery name="getAllCLIENTRoles" datasource="#trim(request.datasource)#">
			SELECT RoleID
			FROM Role					
		</cfquery>							
		<cfset clientRoles = valueList(getAllCLIENTRoles.RoleID)>
		
		<cfloop list="#form.RolesToAssociate#" index="i">
			
			<cfif ListFind(clientRoles, trim(i))>
				
				<cfquery name="insertAdministratorUserRole" datasource="#trim(request.datasource)#">
					INSERT INTO UsersRole  (UsersID, SiteID, RoleID)
					VALUES(#trim(usersID)#, #trim(request.Site.getSiteID())#, #trim(i)#)
				</cfquery>	
					
			<cfelseif ListFind(masterRoles, trim(i))>
				
				<cfquery name="insertAdministratorUserRole" datasource="#trim(request.datasource)#">
					INSERT INTO pa_master.[UsersRole]  (UsersID, SiteID, RoleID)
					VALUES(#trim(usersID)#, #trim(request.Site.getSiteID())#, #trim(i)#)
				</cfquery>	
				
			</cfif> 			
		
		</cfloop>
			
				
		<!-------------------------------------------------------------------------------------->
		<!--- The addresses the user inputs.                                                 --->
		<!-------------------------------------------------------------------------------------->				
		<cfset AddressDBIDs = "">
		
		<cfloop list="#trim(form.addresses)#" index="i">					
			<cfif IsNumeric(ListGetAt(i, 2, "|"))>
				<cfset AddressDBIDs = ListAppend(AddressDBIDs, ListGetAt(i, 2, "|"))>
			</cfif>			
		</cfloop>
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- In order to delete an address we really dont delete it. What happens is that   --->
		<!--- the agent deletes it from the array and since it does not come in inserted     --->
		<!--- into the array then we archive any address attached to this entity. We dont    --->
		<!--- delete the address from the DB is because it is part of history.               --->
		<!-------------------------------------------------------------------------------------->						
		<cfset EntityAddressObj = CreateObject("component", "com.common.Entity")>
		<cfset EntityAddressObj.archiveEntityAddressAttachments(clientID: trim(session.clientID), entityID: trim(EntityID), AddressIDNotIn: trim(AddressDBIDs))>
				
		
		<cfloop list="#trim(form.addresses)#" index="i">
			
			<cfset id = ListGetAt(i, 1, "|")>
			
			<cfif ListGetAt(i, 2, "|") EQ "@@">
				<cfset AddressDBID = "">
			<cfelse>
				<cfset AddressDBID = ListGetAt(i, 2, "|")>	
			</cfif>
			
			<cfset AddressTypeID = ListGetAt(i, 3, "|")>			
			<cfset IsDefault = ListGetAt(i, 4, "|")>
			<cfset AddressLine1 = ListGetAt(i, 5, "|")>
			
			<cfif ListGetAt(i, 6, "|") EQ "@@">
				<cfset AddressLine2 = "">
			<cfelse>
				<cfset AddressLine2 = ListGetAt(i, 6, "|")>	
			</cfif>
			
			<cfset AddressCity = ListGetAt(i, 7, "|")>
			<cfset AddressStateID = ListGetAt(i, 8, "|")>
			<cfset AddressZipCode = ListGetAt(i, 9, "|")>
			
			
			<cfif NOT IsNumeric(AddressDBID)> 						
			
				<cfset request.Address = CreateObject("component","com.common.Address")>	
				<cfset request.Address.new(EntityID: trim(EntityID), AddressTypeID: trim(AddressTypeID), AddressLine1: trim(AddressLine1), AddressLine2: trim(AddressLine2), City: trim(AddressCity), StateID: trim(AddressStateID), ZipCode: trim(AddressZipCode), IsDefault: trim(IsDefault))>	
				<cfset addressID = request.Address.commit()>		
				
				<cfset request.EntityAddress = CreateObject("component","com.common.db.EntityAddressIO")>
				<cfset request.EntityAddress.new(AddressID: trim(addressID), EntityID: trim(EntityID), IsDefault: trim(IsDefault))>					
				<cfset EntityAddressID = request.EntityAddress.commit()>					
							
			<cfelse>
				
				<cfset request.Address = CreateObject("component","com.common.Address")>								
				<cfset request.Address.setAddressTypeID(trim(AddressTypeID))>			
				<cfset request.Address.setAddressLine1(trim(AddressLine1))>		
				<cfset request.Address.setAddressLine2(trim(AddressLine2))>
				<cfset request.Address.setCity(trim(AddressCity))>
				<cfset request.Address.setStateID(trim(AddressStateID))>			
				<cfset request.Address.setZipCode(trim(AddressZipCode))>					
				<cfset request.Address.Commit()>	
							
				<cfset request.EntityAddress = CreateObject("component","com.common.db.EntityAddressIO")>				
				<cfset request.EntityAddress.setAddressID(trim(AddressDBID))>
				<cfset request.EntityAddress.setEntityID(trim(EntityID))>
				<cfset request.EntityAddress.setIsDefault(trim(IsDefault))>									
				<cfset request.EntityAddress.Commit()>	
				
			</cfif>
			
											
		</cfloop>
			
			
			
		
			
		<!-------------------------------------------------------------------------------------->
		<!--- The phone numbers the user inputs.                                             --->
		<!-------------------------------------------------------------------------------------->				
		<cfset request.Phone = CreateObject("component","com.common.Phone")>	
		<cfset request.PhoneAddress = CreateObject("component","com.common.db.EntityAddressIO")>	
		
		<cfset phonenumberDBIDs = "">
		
		<cfloop list="#trim(form.phonenumbers)#" index="i">					
			<cfif IsNumeric(ListGetAt(i, 2, "|"))>
				<cfset phonenumberDBIDs = ListAppend(phonenumberDBIDs, ListGetAt(i, 2, "|"))>
			</cfif>			
		</cfloop>
				
		
		<cfset EntityAddressObj.archiveEntityPhoneAttachments(clientID: trim(session.clientID), EntityID: trim(EntityID), PhoneIDNotIn: trim(phonenumberDBIDs))>
		
		
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
			
			<cfif ListLen(i) EQ 6>
				<cfset PhoneExtension = ListGetAt(i, 6, "|")>
			<cfelse>	
				<cfset PhoneExtension = "">
			</cfif>
			
			<cfset PhoneNumberE = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(PhoneNumber)) />
			<cfset PhoneExtensionE = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(PhoneExtension)) />
					
			<cfif NOT IsNumeric(phoneDBID)> 						
													
				<cfquery name="insertPhoneNumber" datasource="#trim(request.datasource)#">
					INSERT INTO Phone  (PhoneTypeID, PhoneNumber, PhoneExtension)
					VALUES(#trim(PhoneTypeID)#, '#trim(PhoneNumberE)#', '#trim(PhoneExtensionE)#');
					SELECT LAST_INSERT_ID() AS phoneID 
				</cfquery>
				
				<cfset phoneID = insertPhoneNumber.phoneID>
				
				<!-------------------------------------------------------------------------------------->
				<!--- Bind the Entity to this Phone or update the IsDefualt.                         --->
				<!-------------------------------------------------------------------------------------->																
				<cfset EntityAddressObj.bindEntityPhone(clientID: session.clientID, entityID: trim(EntityID), phoneID: trim(phoneID), IsDefault: trim(IsDefault))>
					
							
			<cfelse>
			
				<cfquery name="updatePhoneNumber" datasource="#trim(request.datasource)#">
					UPDATE Phone 
					SET 
						PhoneTypeID = #trim(PhoneTypeID)#, 
						PhoneNumber = '#trim(PhoneNumberE)#', 
						PhoneExtension = '#trim(PhoneExtensionE)#'
					WHERE PhoneID = #trim(phoneDBID)#					
				</cfquery>
				
				<cfset PhoneID = trim(phoneDBID)>
				
			</cfif>
			
											
		</cfloop>
			
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- The email addresses the user inputs.                                           --->
		<!-------------------------------------------------------------------------------------->	
		<cfset emailAddressDBIDs = "">
		
		<cfloop list="#trim(form.emailaddresses)#" index="i">					
			<cfif IsNumeric(ListGetAt(i, 2, "|"))>
				<cfset emailAddressDBIDs = ListAppend(emailAddressDBIDs, ListGetAt(i, 2, "|"))>
			</cfif>			
		</cfloop>
					
		<cfquery name="deleteOldEmailAddresses" datasource="#trim(request.datasource)#">
			DELETE FROM EmailAddress 
			WHERE EntityID = #trim(EntityID)# <cfif emailAddressDBIDs NEQ ""> AND EmailAddressID NOT IN(#trim(emailAddressDBIDs)#)</cfif>	
		</cfquery>
		
		
		<cfloop list="#trim(form.emailaddresses)#" index="i">
			
			<cfset id = ListGetAt(i, 1, "|")>
			
			<cfif ListGetAt(i, 2, "|") EQ "@@">
				<cfset emailAddressDBID = "">
			<cfelse>
				<cfset emailAddressDBID = ListGetAt(i, 2, "|")>	
			</cfif>
			
			<cfset EmailTypeID = ListGetAt(i, 3, "|")>			
			<cfset IsDefault = ListGetAt(i, 4, "|")>					
			<cfset Email = ListGetAt(i, 5, "|")>
			
			<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterE(lcase(trim(Email))) />
					
			<cfif NOT IsNumeric(emailAddressDBID)> 						
																
				<cfquery name="insertEmailAddress" datasource="#trim(request.datasource)#">
					INSERT INTO EmailAddress  (EntityID, EmailTypeID, Email, IsDefault)
					VALUES(#trim(EntityID)#, #trim(EmailTypeID)#, '#trim(EmailAddress)#', #trim(IsDefault)#);
					SELECT LAST_INSERT_ID() AS emailaddressID 
				</cfquery>
				
				<cfset emailaddressID = insertEmailAddress.emailaddressID>
							
			<cfelse>
			
				<cfquery name="updateEmailAddress" datasource="#trim(request.datasource)#">
					UPDATE EmailAddress 
					SET EntityID = #trim(EntityID)#, EmailTypeID = #trim(EmailTypeID)#, Email = '#trim(EmailAddress)#', IsDefault = #trim(IsDefault)# 
					WHERE EmailAddressID = #trim(emailAddressDBID)#					
				</cfquery>
				
				<cfset addressID = trim(AddressDBID)>
				
			</cfif>
			
											
		</cfloop>
			
			
				
			
		<!-------------------------------------------------------------------------------------->
		<!--- The user has been edited. In order for the changes to take effect you must     --->
		<!--- log them out and force them to log back in.                                    --->
		<!-------------------------------------------------------------------------------------->
		<cfquery name="invalidateUsersCurrentLoginsession" datasource="#trim(request.datasource)#">
			UPDATE usersSession 
			SET Active = 0, InactiveCode = 68
			WHERE usersID = #trim(usersID)# 
		</cfquery>

		
			
	</cftransaction>


<!-------------------------------------------------------------------------------------->
<!--- If we get here all ran successfully so go ahead and set the message to be sent.--->
<!-------------------------------------------------------------------------------------->
<cfset msg = "User was updated successfully.">

<!-------------------------------------------------------------------------------------->
<!--- Locate the user back to the admin users screen with a message.                 --->
<!-------------------------------------------------------------------------------------->
<cflocation addtoken="No" url="appAdminUsers.cfm?msg=#URLEncodedFormat(trim(msg))#">

	
