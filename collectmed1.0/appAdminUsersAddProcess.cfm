
<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.debug" default="true">
	<cfset debug = attributes.debug>
	
	<cfparam name="attributes.randRange" default="#randRange(1001, 2252)#">
	<cfset randRange = attributes.randRange>
	


<!-------------------------------------------------------------------------------------->
<!--- Check the information coming in first.                                         --->
<!-------------------------------------------------------------------------------------->
	<cfif form.NewUsersHiddenAddressTypeID EQ "" OR form.NewUsersHiddenAddressLine1 EQ "" OR form.NewUsersHiddenAddressCity EQ "" OR form.NewUsersHiddenAddressStateID EQ "" OR form.NewUsersHiddenAddressZipCode EQ "">
		<cf_gcGeneralErrorTemplate				
			message="The address sent in is not complete. Please go back and re-enter the address">	
	</cfif>
	
	
	

<!-------------------------------------------------------------------------------------->
<!--- Verify that the sent in email addresses are formatted correctly.               --->
<!-------------------------------------------------------------------------------------->
	<cf_gcIsValidEmailAddress
		email="#trim(form.NewUserEmailAddress)#"
		handleError="true">	
		
		
		
<!-------------------------------------------------------------------------------------->
<!--- Check the phone number coming in.                                              --->
<!-------------------------------------------------------------------------------------->		
	<cfif form.NewUserPhoneNumber EQ "" OR Len(form.NewUserPhoneNumber) LT 10>
		<cf_gcGeneralErrorTemplate				
			message="The phone number provided is either missing or not long enough to qualify as a valid phone. Please go babk and re-enter the phone number">	
	</cfif>
	
	
<!--------------------------------------------------------------------------------------->
<!--- Check the roles that the user has been associated to there must be at least one --->
<!--------------------------------------------------------------------------------------->
	<cfif form.RolesToAssociate EQ "">
		<cf_gcGeneralErrorTemplate				
			message="The new user must be associated to at least one role.">
	</cfif>
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the process of this page with a try catch.                               --->
<!-------------------------------------------------------------------------------------->	
	<cftry>
		
		<cftransaction>	
		
			<!-------------------------------------------------------------------------------------->
			<!--- Start the insert of the new user account.                                      --->
			<!-------------------------------------------------------------------------------------->
			<cfquery name="insertNewUser" datasource="#trim(request.datasource)#">
				INSERT INTO Entity  (SiteID, ClientID, ObjectTypeID, FName, MName, LName)
				VALUES(#trim(request.Site.getSiteID())#, '#trim(session.clientID)#', 2, '#trim(form.NewUserFName)#', '#trim(form.NewUserMName)#', '#trim(form.NewUserLName)#');
				SELECT LAST_INSERT_ID() AS newUserID 
			</cfquery>			
			
			<cfset newUserID = insertNewUser.newUserID>	
			
			
			<cfquery name="insertAddress" datasource="#trim(request.datasource)#">
				INSERT INTO Address  (AddressTypeID, AddressLine1, AddressLine2, City, StateID, ZipCode)
				VALUES(#trim(form.NewUsersHiddenAddressTypeID)#, '#trim(form.NewUsersHiddenAddressLine1)#', '#trim(form.NewUsersHiddenAddressLine2)#', '#trim(form.NewUsersHiddenAddressCity)#', #trim(form.NewUsersHiddenAddressStateID)#, '#trim(form.NewUsersHiddenAddressZipCode)#');
				SELECT LAST_INSERT_ID() AS addressID 
			</cfquery>
		
			<cfset addressID = insertAddress.addressID>
			
			<cfquery name="insertEntityAddress" datasource="#trim(request.datasource)#">
				INSERT INTO EntityAddress  (EntityID, AddressID, IsDefault)
				VALUES(#trim(newUserID)#, '#trim(addressID)#', 1)				
			</cfquery>	
			
			<!-------------------------------------------------------------------------------------->
			<!--- Create a user account for the adminstrator. Giving the admin the admin role.   --->
			<!-------------------------------------------------------------------------------------->			
			<cfquery name="getWord" datasource="#request.datasource#">
				SELECT word 
				FROM pa_master.randomword  
				WHERE randomwordid = #trim(randRange)#
			</cfquery>
				
			<cfset initialEntryPoint = getWord.word & newUserID> 
			<!---Lowercase entry is not needed they will receive the username as typed.--->	
			<cfset Entry = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(form.NewUserEmailAddress)) />
			<cfset EntryPoint = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(initialEntryPoint)) />
						
			<cfquery name="insertNewUserAccount" datasource="#trim(request.datasource)#">
				INSERT INTO pa_master.Users  (SiteID, ClientID, EntityID, Entry, EntryPoint)
				VALUES(#trim(request.Site.getSiteID())#, #trim(session.clientID)#, '#trim(newUserID)#', '#trim(Entry)#', '#trim(EntryPoint)#');
				SELECT LAST_INSERT_ID() AS usersID 
			</cfquery>		
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Give the user their roles.                                                     --->
			<!-------------------------------------------------------------------------------------->				
			<cfloop list="#form.RolesToAssociate#" index="i">
				
				<cfquery name="insertAdministratorUserRole" datasource="#trim(request.datasource)#">
					INSERT INTO UsersRole  (UsersID, SiteID, RoleID)
					VALUES(#trim(insertNewUserAccount.usersID)#, #trim(request.Site.getSiteID())#, #trim(i)#)
				</cfquery>		
			
				<cfquery name="insertAdministratorUserRole_MASTER" datasource="#trim(request.datasource)#">
					INSERT INTO pa_master.UsersRole  (UsersID, SiteID, RoleID)
					VALUES(#trim(insertNewUserAccount.usersID)#, #trim(request.Site.getSiteID())#, #trim(i)#)
				</cfquery>	
				
			</cfloop>
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Loop the form fields and add the records back as stated.                       --->
			<!-------------------------------------------------------------------------------------->					
			<cfloop list="#form.FieldNames#" index="i">		
											
				<cfif FindNoCase("GroupCheckbox_", i) NEQ 0 AND IsNumeric(ListLast(i, "_"))>
					
					<cfset thisGroupID = ListLast(i, "_")>
					
					<cfquery name="insertRecord" datasource="#trim(request.datasource)#">
						INSERT INTO UsersWorkGroup (UsersID, WorkGroupID)
						VALUES(#trim(insertNewUserAccount.usersID)#, #trim(thisGroupID)#)
					</cfquery>							
					
				</cfif> 
				
			</cfloop>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Insert the admin email address and get an ID back.                             --->
			<!-------------------------------------------------------------------------------------->
			<cfset NewUserEmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterE(lcase(trim(form.NewUserEmailAddress))) />
			
			<cfquery name="checkEmailAddress" datasource="#request.datasource#">
				SELECT Email
				FROM EmailAddress  
				WHERE Email = '#trim(NewUserEmailAddress)#'
			</cfquery>
			
			<cfif checkEmailAddress.RecordCount GTE 1>
				<cfthrow message="The email address already exists.">
			</cfif>
						
			<cfquery name="insertNewUserEmail" datasource="#trim(request.datasource)#">
				INSERT INTO EmailAddress  (EntityID, EmailTypeID, Email, IsDefault)
				VALUES(#trim(newUserID)#, 82, '#trim(NewUserEmailAddress)#', 1);
				SELECT LAST_INSERT_ID() AS emailID 
			</cfquery>
			
			<cfset newUserEmailID = insertNewUserEmail.emailID>
				
				
			<!-------------------------------------------------------------------------------------->
			<!--- Start inserting the new phone number for this user.                            --->
			<!-------------------------------------------------------------------------------------->		
			<cfset NewUserPhoneNumber = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(form.NewUserPhoneNumber)) />	
			
			<cfif trim(form.NewUserPhoneNumberExtension) GT "">
				<cfset form.NewUserPhoneNumberExtension = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(form.NewUserPhoneNumberExtension)) />
			</cfif>
			
			<cfquery name="insertNewUserPhone" datasource="#trim(request.datasource)#">
				INSERT INTO Phone  (phoneNumber, phoneExtension, PhoneTypeID)
				VALUES('#trim(NewUserPhoneNumber)#', '#trim(form.NewUserPhoneNumberExtension)#', 74);
				SELECT LAST_INSERT_ID() AS phoneID 
			</cfquery>
			
			<cfset newUserPhoneID = insertNewUserPhone.phoneID>	
			
			<cfquery name="insertNewUserEntityPhone" datasource="#trim(request.datasource)#">
				INSERT INTO EntityPhone  (EntityID, PhoneID, IsDefault)
				VALUES(#trim(newUserID)#, '#trim(newUserPhoneID)#', 1)				
			</cfquery>
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Send an email to the administrator showing them their new password and         --->
			<!--- username so they can instantly login.                                          --->
			<!-------------------------------------------------------------------------------------->			
			<cf_gcSendemail 
				to="#lcase(trim(form.NewUserEmailAddress))#" 
				bcc="gcruz@eobmanager.net"
				from="autoreply@eobmanager.net" 
				subject="Account has been created." 
				type="HTML" 
				message="<font face=Verdana><p><font size=3 color=990000><strong>Your account has been created.</strong></font></p><p><font color=990000>NOTE: Case Sensitive</font><br><strong>Username:</strong> #lcase(trim(form.NewUserEmailAddress))#<br><strong>Password:</strong> #trim(initialEntryPoint)#</p></font>"
				debug="true">
				
				
			<cfset msg = "<font size=2 face=Verdana><font size=3 color=990000><strong>Congratulations!</strong></font> <strong>The new users account has been created.</strong> <p>The username and password have been sent to the email provided.</p></font>">
	
		</cftransaction>
		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Locate the user back to the admin users screen with a message.                 --->
		<!-------------------------------------------------------------------------------------->
		<cflocation addtoken="No" url="appAdminUsers.cfm?msg=#URLEncodedFormat(trim(msg))#">



		
		
		
		<cfcatch type="Any">
		
			<cfoutput>
				
				<p>Caught an exception, type = #CFCATCH.TYPE#</p>
				<p>#cfcatch.message# #cfcatch.detail#</p>	       
		        The contents of the tag stack are:<br>
		        <cfdump var="#cfcatch.tagcontext#">  
				<cfabort>
			</cfoutput>
			
		</cfcatch>
	
	</cftry>	
		
	
			