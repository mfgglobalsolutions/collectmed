<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.debug" default="false">
	<cfset debug = attributes.debug>
	
	<cfparam name="attributes.randRange" default="#randRange(1001, 2252)#">
	<cfset randRange = attributes.randRange>
	

	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the process of this page with a try catch.                               --->
<!-------------------------------------------------------------------------------------->	
	<cftry>
		
		
				
			<!-------------------------------------------------------------------------------------->
			<!--- Start by checking to see if the client name is not taken.                      --->
			<!-------------------------------------------------------------------------------------->			
			<cfquery name="checkExistsClient" datasource="#trim(request.datasource)#">
				SELECT clientID
				FROM pa_master.client  
				WHERE ClientName = '#trim(form.clientName)#'
			</cfquery>
			
			<cfif checkExistsClient.RecordCount GTE 1>
				<cfthrow message="This client name ('#trim(form.clientName)#') already exists.">
			</cfif>
			
						
			<!-------------------------------------------------------------------------------------->
			<!--- Insert the client information. Place a temporary entityID until you can build  --->
			<!--- the datebase and enter an enitity.                                             --->
			<!-------------------------------------------------------------------------------------->			
			<cfquery name="insertClient" datasource="#trim(request.datasource)#">
				INSERT INTO pa_master.client  (ClientName, ClientDBA, EntityID, ProviderID)
				VALUES('#trim(form.clientName)#', '#trim(form.clientDBA)#', 5555, '#trim(form.medicareProviderID)#');
				SELECT LAST_INSERT_ID() AS clientID 
			</cfquery>	
				
			<cfset clientID = insertClient.clientID>
			
			<!---9727839573---><!---2148684746--->
			<!-------------------------------------------------------------------------------------->
			<!--- Create the database that will house this clients records.                      --->
			<!-------------------------------------------------------------------------------------->			
			<cf_gcCreateEOBClientDB
				ClientID="#trim(clientID)#">
			
								
			<!-------------------------------------------------------------------------------------->
			<!--- Create the datasource for this client.                                         --->
			<!-------------------------------------------------------------------------------------->				
			<cfset DSname = "PAClient_#trim(ClientID)#">

			<cfscript>
			   adminObj = createObject("component","cfide.adminapi.administrator");
			   adminObj.login("eobmanagernet");
			  
			   myObj = createObject("component","cfide.adminapi.datasource");   
			   myObj.setMSSQL(driver="MSSQLServer", 
			      name="#trim(DSname)#", host = "127.0.0.1", port = "1433",
			      database = "#trim(DSname)#", username = "eobmanager", password="eobmanagernet", login_timeout = "30",
				  timeout = "20", interval = 7, buffer = "64000", blob_buffer = "64000", setStringParameterAsUnicode = "false",
			      description = "", pooling = true, maxpooledstatements = 1000, enableMaxConnections = "true",
			      maxConnections = "300", enable_clob = true, enable_blob = true, disable = false, storedProc = true,
			      alter = false, grant = true, select = true, update = true, create = true, delete = true, drop = false, 
				  revoke = false );
			</cfscript>	
				
				
			
			<!-------------------------------------------------------------------------------------->
			<!--- Create a entity account for this client. This entity account will be used to   --->
			<!--- store the phones addresses and other client items.                             --->
			<!-------------------------------------------------------------------------------------->			
			<cfquery name="createEntityRecord" datasource="PAClient_#trim(ClientID)#">
				INSERT INTO entity  (SiteID, ObjectTypeID, ClientID)
				VALUES(#trim(request.Site.getSiteID())#, 1, #trim(ClientID)#);
				SELECT LAST_INSERT_ID() AS entityID 
			</cfquery>
			
			<cfset EntityID = createEntityRecord.EntityID>	
			
			
			
												
			<!-------------------------------------------------------------------------------------->
			<!--- The addresses the user inputs will be 1 to many. So we have to parse out the   --->
			<!--- billing and the corporate address and any other address they might send.       --->
			<!-------------------------------------------------------------------------------------->											
			<cfquery name="insertAddress" datasource="PAClient_#trim(ClientID)#">
				INSERT INTO address  (AddressTypeID, AddressLine1, AddressLine2, City, StateID, ZipCode)
				VALUES(#trim(AddressTypeID)#, '#trim(AddressLine1)#', '#trim(AddressLine2)#', '#trim(AddressCity)#', #trim(AddressStateID)#, '#trim(AddressZipCode)#');
				SELECT LAST_INSERT_ID() AS addressID 
			</cfquery>
			
			<cfset addressID = insertAddress.addressID>
			
			<cfquery name="insertEntityAddress" datasource="PAClient_#trim(ClientID)#">
				INSERT INTO entityaddress  (EntityID, AddressID, IsDefault)
				VALUES(#trim(EntityID)#, #trim(AddressID)#, 1)					
			</cfquery>
					
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Insert the client main phone number.                                           --->
			<!-------------------------------------------------------------------------------------->			
			<cfset clientMainPhoneNumber = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(form.clientMainPhoneNumber)) />
			
			<cfif form.clientMainPhoneNumberExtension GT "">
				<cfset form.clientMainPhoneNumberExtension = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(form.clientMainPhoneNumberExtension)) />
			</cfif>
			
			<cfquery name="insertMainPhone" datasource="PAClient_#trim(ClientID)#">
				INSERT INTO phone  (phoneNumber, phoneExtension, PhoneTypeID)
				VALUES('#trim(clientMainPhoneNumber)#', '#trim(form.clientMainPhoneNumberExtension)#', 74);
				SELECT LAST_INSERT_ID() AS phoneID 
			</cfquery>
			
			<cfset corporateMainPhoneID = insertMainPhone.phoneID>
			
			<cfquery name="insertMainEntityPhone" datasource="PAClient_#trim(ClientID)#">
				INSERT INTO entityphone  (EntityID, PhoneID, IsDefault)
				VALUES(#trim(EntityID)#, #trim(corporateMainPhoneID)#, 1)				
			</cfquery>
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Start the insert of the administrator account.                                 --->
			<!-------------------------------------------------------------------------------------->
			<cfquery name="insertAdministrator" datasource="PAClient_#trim(ClientID)#">
				INSERT INTO entity  (SiteID, ClientID, FName, MName, LName, ObjectTypeID)
				VALUES(#trim(request.Site.getSiteID())#, '#trim(clientID)#', '#trim(form.administratorFName)#', '#trim(form.administratorMName)#', '#trim(form.administratorLName)#', 2);
				SELECT LAST_INSERT_ID() AS adminID 
			</cfquery>			
			
			<cfset administratorID = insertAdministrator.adminID>
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Create a user account for the adminstrator. Giving the admin the admin role.   --->
			<!-------------------------------------------------------------------------------------->			
			<cfquery name="getWord" datasource="#request.datasource#">
				SELECT word 
				FROM pa_master.randomword  
				WHERE randomwordid = #trim(randRange)#
			</cfquery>
				
			<cfset initialEntryPoint = getWord.word & administratorID> 
			
			<cfset Entry = application.beanFactory.getBean('globalFooter').GlobalFooterE(lcase(trim(form.administratorEmailAddress))) />
			<cfset EntryPoint = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(initialEntryPoint)) />
						
			<cfquery name="insertAdministratorUserAccount" datasource="pa_master">
				INSERT INTO users  (SiteID, ClientID, EntityID, Entry, EntryPoint)
				VALUES(#trim(request.Site.getSiteID())#, #trim(ClientID)#, '#trim(administratorID)#', '#trim(Entry)#', '#trim(EntryPoint)#');
				SELECT LAST_INSERT_ID() AS usersID 
			</cfquery>		
			
			<!-------------------------------------------------------------------------------------->
			<!--- Give the administrator the Site administrator Role.                            --->
			<!-------------------------------------------------------------------------------------->				
			<cfquery name="insertSiteAdministratorUserRole" datasource="pa_master">
				INSERT INTO usersrole  (UsersID, SiteID, RoleID)
				VALUES(#trim(insertAdministratorUserAccount.UsersID)#, #trim(request.Site.getSiteID())#, 1)
			</cfquery>		
			
			<!-------------------------------------------------------------------------------------->
			<!--- Give the administrator an EOB administrator Role.                              --->
			<!-------------------------------------------------------------------------------------->				
			<cfquery name="insertAdministratorUserRole" datasource="pa_master">
				INSERT INTO usersrole  (UsersID, SiteID, RoleID)
				VALUES(#trim(insertAdministratorUserAccount.UsersID)#, #trim(request.Site.getSiteID())#, 8)
			</cfquery>		
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Insert the admin email address and get an ID back.                             --->
			<!-------------------------------------------------------------------------------------->
			<cfset administratorEmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterE(lcase(trim(form.administratorEmailAddress))) />
						
			<cfquery name="checkEmailAddress" datasource="PAClient_#trim(ClientID)#">
				SELECT Email
				FROM emailaddress  
				WHERE Email = '#trim(administratorEmailAddress)#'
			</cfquery>
			
			<cfif checkEmailAddress.RecordCount GTE 1>
				<cfthrow message="The administrator email address already exists.">
			</cfif>
						
			<cfquery name="insertAdministratorEmail" datasource="PAClient_#trim(ClientID)#">
				INSERT INTO emailaddress  (EntityID, EmailTypeID, Email, IsDefault)
				VALUES(#trim(administratorID)#, 82, '#trim(administratorEmailAddress)#', 1);
				SELECT LAST_INSERT_ID() AS emailID 
			</cfquery>
			
			<cfset administratorEmailID = insertAdministratorEmail.emailID>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Update the Client table witht he email id of the administrator.                --->
			<!-------------------------------------------------------------------------------------->			
			<cfquery name="updateClientRecord" datasource="pa_master">
				UPDATE client  
				SET supportEmailID = #trim(administratorEmailID)#, EntityID = #trim(EntityID)#
				WHERE ClientID = #trim(ClientID)#
			</cfquery>
			
			<cfset administratorPhoneNumber = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(form.administratorPhoneNumber)) />
			
			<cfif trim(form.administratorPhoneNumberExtension) GT "">
				<cfset form.administratorPhoneNumberExtension = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(form.administratorPhoneNumberExtension)) />
			</cfif>
			
			<cfquery name="insertAdministratorPhone" datasource="PAClient_#trim(ClientID)#">
				INSERT INTO phone  (phoneNumber, phoneExtension, PhoneTypeID)
				VALUES('#trim(administratorPhoneNumber)#', '#trim(form.administratorPhoneNumberExtension)#', 74);
				SELECT LAST_INSERT_ID() AS phoneID 
			</cfquery>
			
			<cfset administratorPhoneID = insertAdministratorPhone.phoneID>	
			
			<cfquery name="insertAdministratorEntityPhone" datasource="PAClient_#trim(ClientID)#">
				INSERT INTO entityphone  (EntityID, PhoneID, IsDefault)
				VALUES(#trim(EntityID)#, #trim(administratorPhoneID)#, 1)				
			</cfquery>
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Insert the default Site Administrator group to be used to reassing intakes.    --->
			<!-------------------------------------------------------------------------------------->						
	 		<cfquery name="insertAdminWorkGroup" datasource="PAClient_#trim(ClientID)#">
				INSERT INTO workgroup  (WorkGroupName, Description, MondayStart, MondayEnd, TuesdayStart, TuesdayEnd, WednesdayStart, WednesdayEnd, ThursdayStart, ThursdayEnd, FridayStart, FridayEnd, SaturdayStart, SaturdayEnd, SundayStart, SundayEnd)
				VALUES('Site Administrator', 'Administrator 24 hour 7 day a week access.', '1/1/1970 12:01:00 AM', '1/1/1970 11:59:00 PM', '1/1/1970 12:01:00 AM', '1/1/1970 11:59:00 PM', '1/1/1970 12:01:00 AM', '1/1/1970 11:59:00 PM', '1/1/1970 12:01:00 AM', '1/1/1970 11:59:00 PM', '1/1/1970 12:01:00 AM', '1/1/1970 11:59:00 PM', '1/1/1970 12:01:00 AM', '1/1/1970 11:59:00 PM', '1/1/1970 12:01:00 AM', '1/1/1970 11:59:00 PM');				
				SELECT LAST_INSERT_ID() AS AdminWorkGroupID 
			</cfquery>	
			
			<!-------------------------------------------------------------------------------------->
			<!--- Give the administrator the admin workgroup for time access.                    --->
			<!-------------------------------------------------------------------------------------->				
			<cfquery name="insertUserWorkGroup" datasource="PAClient_#trim(ClientID)#">
				INSERT INTO usersworkgroup  (UsersID, WorkGroupID)
				VALUES(#trim(insertAdministratorUserAccount.UsersID)#, #trim(insertAdminWorkGroup.AdminWorkGroupID)#)
			</cfquery>					
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Insert the default intake managers group to be used to reassing intakes.       --->
			<!-------------------------------------------------------------------------------------->						
	 		<cfquery name="insertWorkGroup" datasource="PAClient_#trim(ClientID)#">
				INSERT INTO workgroup  (WorkGroupName, Description, MondayStart, MondayEnd, TuesdayStart, TuesdayEnd, WednesdayStart, WednesdayEnd, ThursdayStart, ThursdayEnd, FridayStart, FridayEnd, SaturdayStart, SaturdayEnd, SundayStart, SundayEnd)
				VALUES('Intake Manager', 'Intke Managers who deal with administrative tasks of intakes.', '1/1/1970 7:00:00 AM', '1/1/1970 7:30:00 PM', '1/1/1970 7:00:00 AM', '1/1/1970 7:30:00 PM', '1/1/1970 7:00:00 AM', '1/1/1970 7:30:00 PM', '1/1/1970 7:00:00 AM', '1/1/1970 7:30:00 PM', '1/1/1970 7:00:00 AM', '1/1/1970 7:30:00 PM', '1/1/1970 7:00:00 AM', '1/1/1970 7:30:00 PM', '1/1/1970 7:00:00 AM', '1/1/1970 7:30:00 PM')				
			</cfquery>	
						
	 					
			<!-------------------------------------------------------------------------------------->
			<!--- Send an email to the administrator showing them their new password and         --->
			<!--- username so they can instantly login.                                          --->
			<!-------------------------------------------------------------------------------------->			
			<cf_gcSendemail 
				to="#lcase(trim(form.administratorEmailAddress))#" 
				from="autoreply@eobmanager.net" 
				subject="Account has been created." 
				type="HTML" 
				message="<font face=Verdana><p><font size=3 color=990000><strong>Your account has been created.</strong></font></p><p><font color=990000>NOTE: Case Sensitive</font><br><strong>Username:</strong> #lcase(trim(form.administratorEmailAddress))#<br><strong>Password:</strong> #trim(initialEntryPoint)#</p>#session.receipt#</font>">
				
			
		

			<cfset msg = "<br><br><font face=Verdana><font size=3 color=990000><strong>Congratulations! </strong></font> <strong>The account has been created.</strong> <font size=2><p>The username and password have been sent to the email provided.<br>Once received they may login from the home page.</p><p>#trim(initialEntryPoint)#</p></font></font>">
			
			<!-------------------------------------------------------------------------------------->
			<!--- Locate the user back to the admin users screen with a message.                 --->
			<!-------------------------------------------------------------------------------------->
			<cflocation addtoken="No" url="index.cfm?msg=#URLEncodedFormat(trim(msg))#">
		
		
		
		
		
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

	
	
	
	
	
	
	
	
	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Show all debugs                                                                --->
<!-------------------------------------------------------------------------------------->
	<cfif debug>	
		
		<cfoutput><p><font face=Verdana><font color=990000>NOTE: Case Sensitive</font><br><strong>Username:</strong> #lcase(trim(form.administratorEmailAddress))#<br><strong>Password:</strong> #trim(initialEntryPoint)#</font></p></cfoutput>
		
		<cfdump var="#variables#" expand="no">
		
		<cfdump var="#insertClient#" expand="no">
		
		<cfdump var="#qAddresses#" expand="no">
		
	</cfif>	















