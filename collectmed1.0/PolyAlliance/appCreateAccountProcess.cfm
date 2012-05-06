<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->	
	<cfparam name="attributes.debug" default="false">
	<cfset debug = attributes.debug>
	
	<cfparam name="attributes.randRange" default="#randRange(1001, 2252)#">
	<cfset randRange = attributes.randRange>
	
	<cfparam name="attributes.fontFace" default="arial">
	<cfset fontFace = attributes.fontFace> 
	
	<cfparam name="attributes.fontSize" default="10">
	<cfset fontSize = attributes.fontSize>
	
	<cfparam name="attributes.fontColor" default="000000">
	<cfset fontColor = attributes.fontColor>
	
	

<!-------------------------------------------------------------------------------------->
<!--- Some styles for this page.                                                     --->
<!-------------------------------------------------------------------------------------->
	<style>
		.companyInformation{			
			padding: 0 0 0 0;
			width: 475px;
		}
		fieldset{							
			float: left;
			clear: left;
			width: 100%;
			margin: 20;
			padding: 0;
			background-color: #f5f5f5;
			position: relative;
		}
		legend{
			margin-left: 10px;
			color: #000000;			
			font: 14px "Verdana","Arial", "Helvetica";	
			font-weight: bold;
			padding: 0 0 0 0;
			position: relative;
			left: -7px;
			top: -0.75em;
		}
		fieldset ol{						
			padding: 0;
			list-style: none;			
		}
		fieldset li{
			float: left;
			clear: left;
			width: 100%;
			padding: 4 2;
			text-align: left;
			font: normal 12px "Verdana","Arial", "Helvetica";			
			color: ##000000; 
			list-style: none;			
		}	
		label{			
			float: left;
			width: 10em;
			margin-right: 1em;
		}		
	</style>	
	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Save into a variable what the user will see and send to next page for email.   --->
<!-------------------------------------------------------------------------------------->
<cfsavecontent variable="session.receipt">	
	<cfoutput>	

			<div align="center">	
					
				<cf_gcBorderedTable title="New Customer Information" tablealign="center" width="75%">						
					<br>
					<font size="3" face="#trim(fontFace)#" color="FF0000">
						<strong>#UCASE('Please confirm all the submitted information')#</strong>
					</font>
												
					<div class="companyInformation">						
						<fieldset>
							<legend>&nbsp;Company Information&nbsp;</legend>
							<ol>
								<li>
									<label for="Name">Name:</label>						
									<font face="#trim(fontFace)#" color="990000">#form.ClientName#</font>
								</li>
								<li>
									<label for="dba">DBA:</label>
									<font face="#trim(fontFace)#" color="990000">#form.dba#</font>
								</li>
								<li>
									<label for="concurrentUsers">Concurrent Users:</label>
									<font face="#trim(fontFace)#" color="990000">#form.concurrentUsers#</font>
								</li>													
							</ol>
						</fieldset>				
											
						<fieldset>
							<legend>&nbsp;Administrator Information&nbsp;</legend>
							<ol>
								<li>
									<label for="Name">Admin Name:</label>						
									First:&nbsp;<font face="#trim(fontFace)#" color="990000">#form.AdministratorFName#</font>&nbsp;&nbsp;&nbsp;
									M:&nbsp;<font face="#trim(fontFace)#" color="990000">#form.AdministratorMName#</font>&nbsp;&nbsp;&nbsp;
									Last:&nbsp;<font face="#trim(fontFace)#" color="990000">#form.AdministratorLName#</font>
								</li>
								<li>
									<label for="AdminPhone">Admin Phone:</label>
									<font face="#trim(fontFace)#" color="990000">#form.AdministratorPhoneNumber#</font>
									ext. <font face="#trim(fontFace)#" color="990000">#form.AdministratorPhoneExtension#</font>&nbsp;	
								</li>	
								<li>
									<label for="concurrentUsers">Admin Email:</label>
									<font face="#trim(fontFace)#" color="990000">#form.AdministratorEmailAddress#</font>
								</li>	
								<li><label for="email"></label><font size="1" face="#trim(fontFace)#" color="000000">(username / password will be emailed)</font></li>													
							</ol>
						</fieldset>								
												
						<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="3" active="1" returnvariable="getAllPhoneTypes">										
						<fieldset>
							<legend>&nbsp;Company Phone Information&nbsp;</legend>
							
							<ol>							
								<li>
									<label for="Attention">Phone 1:</label>
									<font face="#trim(fontFace)#" color="990000">#form.PhoneNumber_1#</font>
									ext. <font face="#trim(fontFace)#" color="990000">#form.PhoneExtension_1#</font>&nbsp;&nbsp;													
									<cfloop query="getAllPhoneTypes">
										<cfif StandardListItemID EQ form.PhoneTypeID_1><font face="#trim(fontFace)#" color="990000">#ItemNameDisplay#</font></cfif>
									</cfloop>								
								</li>		
								<li>
									<label for="Attention">Phone 2:</label>
									<font face="#trim(fontFace)#" color="990000">#form.PhoneNumber_2#</font>
									ext. <font face="#trim(fontFace)#" color="990000">#form.PhoneExtension_2#</font>&nbsp;&nbsp;													
									<cfloop query="getAllPhoneTypes">
										<cfif StandardListItemID EQ form.PhoneTypeID_2><font face="#trim(fontFace)#" color="990000">#ItemNameDisplay#</font></cfif>
									</cfloop>								
								</li>		
								<li>
									<label for="Attention">Phone 3:</label>
									<font face="#trim(fontFace)#" color="990000">#form.PhoneNumber_3#</font>
									ext. <font face="#trim(fontFace)#" color="990000">#form.PhoneExtension_3#</font>&nbsp;&nbsp;													
									<cfloop query="getAllPhoneTypes">
										<cfif StandardListItemID EQ form.PhoneTypeID_3><font face="#trim(fontFace)#" color="990000">#ItemNameDisplay#</font></cfif>
									</cfloop>								
								</li>																														
							</ol>
							
						</fieldset>								
						
						<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="3" active="1" returnvariable="getAllAddressTypes">
						<cfinvoke component="com.common.db.StandardListItemIO" method="getStandardListItemQuery" listid="4" active="1" returnvariable="getAllStates">
						<fieldset>
							<legend>&nbsp;Company Address Information&nbsp;</legend>
							
							<ol>									
								
								<li>
									<label for="address"><font color="FF0000">Address 1</font><br><hr></label>										
								</li>
								<li>
									<label for="Attention_1">Address Type:</label>										
									<cfloop query="getAllAddressTypes">
										<cfif StandardListItemID EQ form.AddressTypeID_1><font face="#trim(fontFace)#" color="990000">#ItemNameDisplay#</font></cfif>
									</cfloop>									
								</li>
								<li>
									<label for="Attention_1">Attention:</label>
									<font face="#trim(fontFace)#" color="990000">#form.Attention_1#</font>					
								</li>
								<li>
									<label for="AddressLine1_1">Address Line 1:</label>
									<font face="#trim(fontFace)#" color="990000">#form.AddressLine1_1#</font>
								</li>
								<li>
									<label for="AddressLine2_1">Address Line 2:</label>
									<font face="#trim(fontFace)#" color="990000">#form.AddressLine2_1#</font>
								</li>
								<li>
									<label for="City_1">City, State Zip:</label>
									<font face="#trim(fontFace)#" color="990000">#form.City_1#</font>,&nbsp;
									<cfloop query="getAllStates">
										<cfif StandardListItemID eq form.StateID_1><font face="#trim(fontFace)#" color="990000">#ItemNameDisplay#</font></cfif>
									</cfloop>									
									&nbsp;<font face="#trim(fontFace)#" color="990000">#form.ZipCode_1#</font>				
								</li>
								
								<li>
									<label for="address"><font color="FF0000">Address 2</font><br><hr></label>										
								</li>
								<li>
									<label for="Attention_2">Address Type:</label>										
									<cfloop query="getAllAddressTypes">
										<cfif StandardListItemID EQ form.AddressTypeID_2><font face="#trim(fontFace)#" color="990000">#ItemNameDisplay#</font></cfif>
									</cfloop>									
								</li>
								<li>
									<label for="Attention_2">Attention:</label>
									<font face="#trim(fontFace)#" color="990000">#form.Attention_2#</font>						
								</li>
								<li>
									<label for="AddressLine1_2">Address Line 1:</label>
									<font face="#trim(fontFace)#" color="990000">#form.AddressLine1_2#</font>
								</li>
								<li>
									<label for="AddressLine2_2">Address Line 2:</label>
									<font face="#trim(fontFace)#" color="990000">#form.AddressLine2_2#</font>
								</li>
								<li>
									<label for="City_2">City, State Zip:</label>
									<font face="#trim(fontFace)#" color="990000">#form.City_2#</font>,&nbsp;
									<cfloop query="getAllStates">
										<cfif StandardListItemID eq form.StateID_2><font face="#trim(fontFace)#" color="990000">#ItemNameDisplay#</font></cfif>
									</cfloop>									
									&nbsp;<font face="#trim(fontFace)#" color="990000">#form.ZipCode_2#</font>				
								</li>	
								
								<li>
										<label for="address"><font color="FF0000">Address 3</font><br><hr></label>										
									</li>
									<li>
										<label for="Attention_3">Address Type:</label>										
										<cfloop query="getAllAddressTypes">
											<cfif StandardListItemID EQ form.AddressTypeID_3><font face="#trim(fontFace)#" color="990000">#ItemNameDisplay#</font></cfif>
										</cfloop>									
									</li>
									<li>
										<label for="Attention_3">Attention:</label>
										<font face="#trim(fontFace)#" color="990000">#form.Attention_3#</font>						
									</li>
									<li>
										<label for="AddressLine1_3">Address Line 1:</label>
										<font face="#trim(fontFace)#" color="990000">#form.AddressLine1_3#</font>
									</li>
									<li>
										<label for="AddressLine2_3">Address Line 2:</label>
										<font face="#trim(fontFace)#" color="990000">#form.AddressLine2_3#</font>
									</li>
									<li>
										<label for="City_3">City, State Zip:</label>
										<font face="#trim(fontFace)#" color="990000">#form.City_3#</font>,&nbsp;
										<cfloop query="getAllStates">
											<cfif StandardListItemID eq form.StateID_3><font face="#trim(fontFace)#" color="990000">#ItemNameDisplay#</font></cfif>
										</cfloop>									
										&nbsp;<font face="#trim(fontFace)#" color="990000">#form.ZipCode_3#</font>				
									</li>
																																		
							</ol>
							
						</fieldset>		
						
						<br><br>				
																
					</div>					
								
				</cf_gcBorderedTable>					
					
			</div>			
		
	</cfoutput>		
	
</cfsavecontent>		

	
	
<!-------------------------------------------------------------------------------------->
<!--- Start the process of this page with a try catch.                               --->
<!-------------------------------------------------------------------------------------->	
	<cftry>
					
			<!-------------------------------------------------------------------------------------->
			<!--- Create the obejcts that are needed to run this page.                           --->
			<!-------------------------------------------------------------------------------------->		
			<cfset request.Client = Createobject("component", "ClientActive").init('PA_Master')>
		
									
			<!-------------------------------------------------------------------------------------->
			<!--- Start by checking to see if the client name is not taken.                      --->
			<!-------------------------------------------------------------------------------------->				
			<cfif request.Client.ClientExists('PA_Master', trim(form.clientName))>
				<cfthrow message="This client name ('#trim(form.clientName)#') already exists.">
			</cfif>
						
					
			<!-------------------------------------------------------------------------------------->
			<!--- Insert the client information. Place a temporary entityID until you can build  --->
			<!--- the datebase and enter an enitity.                                             --->
			<!-------------------------------------------------------------------------------------->			
			<cfset request.Client.setClientName(trim(form.clientName)) />
			<cfset request.Client.setClientDba(trim(form.dba)) />
			<cfset request.Client.create(obj: request.Client)>					
						
			<cfif NOT IsNumeric(request.Client.getClientID())>
				<cfthrow message="The client could not be created correctly. [39]">
			</cfif>
			
			<cfset clientDatasource = "PAClient_" & trim(request.Client.getClientID())>

		
			<!-------------------------------------------------------------------------------------->
			<!--- Create the database that will house this clients records.                      --->
			<!-------------------------------------------------------------------------------------->				
			<cfset request.Client.CreateClientDB(trim(clientDatasource)) />
			<cfset request.Client.CreateClientCFDatasource(trim(clientDatasource)) />
	

			<!-------------------------------------------------------------------------------------->
			<!--- Create a entity account for this client. This entity account will be used to   --->
			<!--- store the phones addresses and other client items.                             --->
			<!-------------------------------------------------------------------------------------->			
			<cfset request.EntityClient = Createobject("component", "EntityActive").init(trim(clientDatasource))>
			<cfset request.EntityClient.setObjectTypeID(1) />
			<cfset request.EntityClient.setClientID(trim(request.Client.getClientID())) />
			<cfset request.EntityClient.create(obj: request.EntityClient)>				

		
			<!-------------------------------------------------------------------------------------->
			<!--- Save the addresses                                                             --->
			<!-------------------------------------------------------------------------------------->						
			<cfif trim(form.AddressTypeID_1) NEQ "" AND trim(form.AddressLine1_1) NEQ "" AND trim(form.City_1) NEQ "" AND trim(form.StateID_1) NEQ "" AND trim(form.ZipCode_1) NEQ "">
				<cfset request.Address_1 = createObject("component", "AddressActive")>		
				<cfset stAddress_1 = structNew()>
				<cfset stAddress_1.AddressID = 0>			
				<cfset stAddress_1.AddressTypeID = trim(form.AddressTypeID_1)>
				<cfset stAddress_1.Attention = trim(form.Attention_1)>
				<cfset stAddress_1.AddressLine1 = trim(form.AddressLine1_1)>
				<cfset stAddress_1.AddressLine2 = trim(form.AddressLine2_1)>
				<cfset stAddress_1.City = trim(form.City_1)>
				<cfset stAddress_1.StateID = trim(form.StateID_1)>
				<cfset stAddress_1.ZipCode = trim(form.ZipCode_1)>				
				<cfset request.Address_1.init(trim(clientDatasource), stAddress_1)>				
				<cfset request.Address_1.save(request.Address_1)>	
				<cfset request.Address_1.bindAddressEntity(entityID: trim(request.EntityClient.getEntityID()), addressID: trim(request.Address_1.getAddressID()))>
			</cfif>

			<!-------------------------------------------------------------------------------------->
			<!--- Save the addresses                                                             --->
			<!-------------------------------------------------------------------------------------->						
			<cfif trim(form.AddressTypeID_2) NEQ "" AND trim(form.AddressLine1_2) NEQ "" AND trim(form.City_2) NEQ "" AND trim(form.StateID_2) NEQ "" AND trim(form.ZipCode_2) NEQ "">
				<cfset request.Address_2 = createObject("component", "AddressActive")>		
				<cfset stAddress_2 = structNew()>
				<cfset stAddress_2.AddressID = 0>			
				<cfset stAddress_2.AddressTypeID = trim(form.AddressTypeID_2)>
				<cfset stAddress_2.Attention = trim(form.Attention_2)>
				<cfset stAddress_2.AddressLine1 = trim(form.AddressLine1_2)>
				<cfset stAddress_2.AddressLine2 = trim(form.AddressLine2_2)>
				<cfset stAddress_2.City = trim(form.City_2)>
				<cfset stAddress_2.StateID = trim(form.StateID_2)>
				<cfset stAddress_2.ZipCode = trim(form.ZipCode_2)>				
				<cfset request.Address_2.init(trim(clientDatasource), stAddress_2)>				
				<cfset request.Address_2.save(request.Address_2)>	
				<cfset request.Address_2.bindAddressEntity(entityID: trim(request.EntityClient.getEntityID()), addressID: trim(request.Address_2.getAddressID()))>
			</cfif>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Save the addresses                                                             --->
			<!-------------------------------------------------------------------------------------->						
			<cfif trim(form.AddressTypeID_3) NEQ "" AND trim(form.AddressLine1_3) NEQ "" AND trim(form.City_3) NEQ "" AND trim(form.StateID_3) NEQ "" AND trim(form.ZipCode_3) NEQ "">
				<cfset request.Address_3 = createObject("component", "AddressActive")>		
				<cfset stAddress_3 = structNew()>
				<cfset stAddress_3.AddressID = 0>			
				<cfset stAddress_3.AddressTypeID = trim(form.AddressTypeID_3)>
				<cfset stAddress_3.Attention = trim(form.Attention_3)>
				<cfset stAddress_3.AddressLine1 = trim(form.AddressLine1_3)>
				<cfset stAddress_3.AddressLine2 = trim(form.AddressLine2_3)>
				<cfset stAddress_3.City = trim(form.City_3)>
				<cfset stAddress_3.StateID = trim(form.StateID_3)>
				<cfset stAddress_3.ZipCode = trim(form.ZipCode_3)>				
				<cfset request.Address_3.init(trim(clientDatasource), stAddress_3)>				
				<cfset request.Address_3.save(request.Address_3)>	
				<cfset request.Address_3.bindAddressEntity(entityID: trim(request.EntityClient.getEntityID()), addressID: trim(request.Address_3.getAddressID()))>
			</cfif>

			
			<!-------------------------------------------------------------------------------------->
			<!--- Save the Phones                                                                --->
			<!-------------------------------------------------------------------------------------->					
			<cfif trim(form.PhoneNumber_1) NEQ "" AND trim(form.PhoneTypeID_1) NEQ "">
				<cfset PhoneNumberE_1 = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(form.PhoneNumber_1))>
				<cfset PhoneExtensionE_1 = "">
				<cfif trim(form.PhoneExtension_1) NEQ "">
					<cfset PhoneExtensionE_1 = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(form.PhoneExtension_1))>
				</cfif>
				<cfset request.Phone_1 = createObject("component", "PhoneActive")>		
				<cfset stPhone_1 = structNew()>
				<cfset stPhone_1.PhoneID = 0>			
				<cfset stPhone_1.PhoneTypeID = trim(form.PhoneTypeID_1)>
				<cfset stPhone_1.PhoneNumber = trim(PhoneNumberE_1)>	
				<cfset stPhone_1.PhoneExtension = trim(PhoneExtensionE_1)>			
				<cfset request.Phone_1.init(trim(clientDatasource), stPhone_1)>				
				<cfset request.Phone_1.save(request.Phone_1)>	
				<cfset request.Phone_1.bindPhoneEntity(entityID: trim(request.EntityClient.getEntityID()), PhoneID: trim(request.Phone_1.getPhoneID()))>
			</cfif>
			
			<cfif trim(form.PhoneNumber_2) NEQ "" AND trim(form.PhoneTypeID_2) NEQ "">
				<cfset PhoneNumberE_2 = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(form.PhoneNumber_2))>
				<cfset PhoneExtensionE_2 = "">
				<cfif trim(form.PhoneExtension_2) NEQ "">
					<cfset PhoneExtensionE_2 = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(form.PhoneExtension_2))>
				</cfif>
				<cfset request.Phone_2 = createObject("component", "PhoneActive")>		
				<cfset stPhone_2 = structNew()>
				<cfset stPhone_2.PhoneID = 0>			
				<cfset stPhone_2.PhoneTypeID = trim(form.PhoneTypeID_2)>
				<cfset stPhone_2.PhoneNumber = trim(PhoneNumberE_2)>	
				<cfset stPhone_2.PhoneExtension = trim(PhoneExtensionE_2)>			
				<cfset request.Phone_2.init(trim(clientDatasource), stPhone_2)>				
				<cfset request.Phone_2.save(request.Phone_2)>	
				<cfset request.Phone_2.bindPhoneEntity(entityID: trim(request.EntityClient.getEntityID()), PhoneID: trim(request.Phone_2.getPhoneID()))>
			</cfif>
			
			<cfif trim(form.PhoneNumber_3) NEQ "" AND trim(form.PhoneTypeID_3) NEQ "">
				<cfset PhoneNumberE_3 = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(form.PhoneNumber_3))>
				<cfset PhoneExtensionE_3 = "">
				<cfif trim(form.PhoneExtension_3) NEQ "">
					<cfset PhoneExtensionE_3 = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(form.PhoneExtension_3))>
				</cfif>
				<cfset request.Phone_3 = createObject("component", "PhoneActive")>		
				<cfset stPhone_3 = structNew()>
				<cfset stPhone_3.PhoneID = 0>			
				<cfset stPhone_3.PhoneTypeID = trim(form.PhoneTypeID_3)>
				<cfset stPhone_3.PhoneNumber = trim(PhoneNumberE_3)>	
				<cfset stPhone_3.PhoneExtension = trim(PhoneExtensionE_3)>			
				<cfset request.Phone_3.init(trim(clientDatasource), stPhone_3)>				
				<cfset request.Phone_3.save(request.Phone_3)>	
				<cfset request.Phone_3.bindPhoneEntity(entityID: trim(request.EntityClient.getEntityID()), PhoneID: trim(request.Phone_3.getPhoneID()))>
			</cfif>

			
			<!-------------------------------------------------------------------------------------->
			<!--- Insert the Administrator.                                                      --->
			<!-------------------------------------------------------------------------------------->				
			<cfset request.AdministratorEntity = Createobject("component", "EntityActive").init(trim(clientDatasource))>
			<cfset request.AdministratorEntity.setObjectTypeID(2) />
			<cfset request.AdministratorEntity.setClientID(trim(request.Client.getClientID())) />
			<cfset request.AdministratorEntity.setFName(trim(form.AdministratorFName)) />
			<cfset request.AdministratorEntity.setMName(trim(form.AdministratorMName)) />
			<cfset request.AdministratorEntity.setLName(trim(form.AdministratorLName)) />
			<cfset request.AdministratorEntity.create(obj: request.AdministratorEntity)>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Create a user account for the adminstrator. Giving the admin the admin role.   --->
			<!-------------------------------------------------------------------------------------->			
			<cfset request.objRandomWord = Createobject("component", "RandomWordActive").init('PA_Master')>
			<cfset randWord = request.objRandomWord.getRandomWord(randRange) />		
				
			<cfset initialEntryPoint = randWord.word & request.AdministratorEntity.getEntityID()> 	
			
			<!-------------------------------------------------------------------------------------->
			<!--- Insert the Administrator user account.                                         --->
			<!-------------------------------------------------------------------------------------->				
			<cfset Entry = application.beanFactory.getBean('globalFooter').GlobalFooterE(lcase(trim(form.administratorEmailAddress))) />
			<cfset EntryPoint = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(initialEntryPoint)) />
						
			<cfset request.AdminUserAccount = Createobject("component", "UsersActive").init('PA_Master')>
			<cfset request.AdminUserAccount.setClientID(trim(request.Client.getClientID())) />
			<cfset request.AdminUserAccount.setEntityID(trim(request.AdministratorEntity.getEntityID())) />
			<cfset request.AdminUserAccount.setEntry(trim(Entry)) />
			<cfset request.AdminUserAccount.setEntryPoint(trim(EntryPoint)) />
			<cfset request.AdminUserAccount.create(obj: request.AdminUserAccount)>	
						
			
			<!-------------------------------------------------------------------------------------->
			<!--- Give the administrator the Site administrator Role.                            --->
			<!-------------------------------------------------------------------------------------->				
			<cfset request.AdminRole1 = Createobject("component", "UsersRoleActive").init('PA_Master')>
			<cfset request.AdminRole1.setUsersID(trim(request.AdminUserAccount.getUsersID())) />
			<cfset request.AdminRole1.setRoleID(1) />			
			<cfset request.AdminRole1.create(obj: request.AdminRole1)>	
						
			<!-------------------------------------------------------------------------------------->
			<!--- Give the administrator an EOB administrator Role.                              --->
			<!-------------------------------------------------------------------------------------->							
			<cfset request.AdminRole8 = Createobject("component", "UsersRoleActive").init('PA_Master')>
			<cfset request.AdminRole8.setUsersID(trim(request.AdminUserAccount.getUsersID())) />
			<cfset request.AdminRole8.setRoleID(8) />			
			<cfset request.AdminRole8.create(obj: request.AdminRole8)>				
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Insert the admin email address and get an ID back.                             --->
			<!-------------------------------------------------------------------------------------->
			<cfset EmailAddressE = application.beanFactory.getBean('globalFooter').GlobalFooterE(lcase(trim(form.administratorEmailAddress))) />
			<cfset request.AdminEmailAddress = Createobject("component", "EmailAddressActive").init(trim(clientDatasource))>
			<cfset request.AdminEmailAddress.setEmail(lcase(trim(EmailAddressE)))>
			<cfset request.AdminEmailAddress.setEntityID(trim(request.AdministratorEntity.getEntityID())) />
			<cfset request.AdminEmailAddress.setEmailTypeID(82) />
			<cfset request.AdminEmailAddress.setIsDefault(1) />			
			<cfif request.AdminEmailAddress.emailExists() GTE 1>
				<cfthrow message="The administrator email address already exists.">
			</cfif>			
			<cfset request.AdminEmailAddress.create(obj: request.AdminEmailAddress)>	
		
		
			
			<!-------------------------------------------------------------------------------------->
			<!--- Update the Client table.                                                       --->
			<!-------------------------------------------------------------------------------------->						
			<cfset request.Client.setSupportEmailID(trim(request.AdminEmailAddress.getEmailAddressID())) />
			<cfset request.Client.setEntityID(trim(request.EntityClient.getEntityID())) />
			<cfset request.Client.setAdministratorEntityID(trim(request.AdministratorEntity.getEntityID())) />
			<cfset request.Client.update(obj: request.Client)>	
			
			
	
			<!-------------------------------------------------------------------------------------->
			<!--- Enter the Admins Phone.                                                        --->
			<!-------------------------------------------------------------------------------------->			
			<cfset administratorPhoneNumberE = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(form.administratorPhoneNumber)) />
			<cfset administratorPhoneExtensionE = "">
			<cfif trim(form.administratorPhoneExtension) GT "">
				<cfset administratorPhoneExtensionE = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(form.administratorPhoneExtension)) />
			</cfif>
			<cfset request.PhoneAdministrator = createObject("component", "PhoneActive")>		
			<cfset stPhoneAdministrator = structNew()>
			<cfset stPhoneAdministrator.PhoneID = 0>			
			<cfset stPhoneAdministrator.PhoneTypeID = 74>
			<cfset stPhoneAdministrator.PhoneNumber = trim(administratorPhoneNumberE)>	
			<cfset stPhoneAdministrator.PhoneExtension = trim(administratorPhoneExtensionE)>			
			<cfset request.PhoneAdministrator.init(trim(clientDatasource), stPhoneAdministrator)>				
			<cfset request.PhoneAdministrator.save(request.PhoneAdministrator)>	
			<cfset request.PhoneAdministrator.bindPhoneEntity(entityID: trim(request.AdministratorEntity.getEntityID()), PhoneID: trim(request.PhoneAdministrator.getPhoneID()), IsDefault: 1)>
			
						
			<!-------------------------------------------------------------------------------------->
			<!--- Insert the default Site Administrator group to be used to reassign intakes.    --->
			<!-------------------------------------------------------------------------------------->	
			<cfset request.AdminWorkGroup = createObject("component", "WorkGroupActive")>		
			<cfset stAdminWorkGroup = structNew()>
			<cfset stAdminWorkGroup.WorkGroupName = "Site Administrator">
			<cfset stAdminWorkGroup.Description = "Administrator 24 hour 7 day a week access.">
			<cfset stAdminWorkGroup.MondayStart = "1/1/1970 12:01:00 AM">
			<cfset stAdminWorkGroup.MondayEnd = "1/1/1970 11:59:00 PM">
			<cfset stAdminWorkGroup.TuesdayStart = "1/1/1970 12:01:00 AM">
			<cfset stAdminWorkGroup.TuesdayEnd = "1/1/1970 11:59:00 PM">
			<cfset stAdminWorkGroup.WednesdayStart = "1/1/1970 12:01:00 AM">
			<cfset stAdminWorkGroup.WednesdayEnd = "1/1/1970 11:59:00 PM">
			<cfset stAdminWorkGroup.ThursdayStart = "1/1/1970 12:01:00 AM">
			<cfset stAdminWorkGroup.ThursdayEnd = "1/1/1970 11:59:00 PM">
			<cfset stAdminWorkGroup.FridayStart = "1/1/1970 12:01:00 AM">
			<cfset stAdminWorkGroup.FridayEnd = "1/1/1970 11:59:00 PM">
			<cfset stAdminWorkGroup.SaturdayStart = "1/1/1970 12:01:00 AM">
			<cfset stAdminWorkGroup.SaturdayEnd = "1/1/1970 11:59:00 PM">
			<cfset stAdminWorkGroup.SundayStart = "1/1/1970 12:01:00 AM">
			<cfset stAdminWorkGroup.SundayEnd = "1/1/1970 11:59:00 PM">
			<cfset request.AdminWorkGroup.init(trim(clientDatasource), stAdminWorkGroup)>					
			<cfset request.AdminWorkGroup.save(request.AdminWorkGroup)>	
			
		
			<!-------------------------------------------------------------------------------------->
			<!--- Give the administrator the admin workgroup for time access.                    --->
			<!-------------------------------------------------------------------------------------->			
			<cfset request.AdminUsersWorkGroup = createObject("component", "UsersWorkGroupActive")>		
			<cfset stAdminUsersWorkGroup = structNew()>
			<cfset stAdminUsersWorkGroup.UsersID = trim(request.AdminUserAccount.getUsersID())>
			<cfset stAdminUsersWorkGroup.WorkGroupID = request.AdminWorkGroup.getWorkGroupID()>		
			<cfset request.AdminUsersWorkGroup.init(trim(clientDatasource), stAdminUsersWorkGroup)>					
			<cfset request.AdminUsersWorkGroup.save(request.AdminUsersWorkGroup)>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Insert the default Site Administrator group to be used to reassign intakes.    --->
			<!-------------------------------------------------------------------------------------->	
			<cfset request.AdminWorkGroup = createObject("component", "WorkGroupActive")>		
			<cfset stAdminWorkGroup = structNew()>
			<cfset stAdminWorkGroup.WorkGroupName = "Intake Manager">
			<cfset stAdminWorkGroup.Description = "Intke Managers who deal with administrative tasks of intakes.">
			<cfset stAdminWorkGroup.MondayStart = "1/1/1970 7:00:00 AM">
			<cfset stAdminWorkGroup.MondayEnd = "1/1/1970 7:30:00 PM">
			<cfset stAdminWorkGroup.TuesdayStart = "1/1/1970 7:00:00 AM">
			<cfset stAdminWorkGroup.TuesdayEnd = "1/1/1970 7:30:00 PM">
			<cfset stAdminWorkGroup.WednesdayStart = "1/1/1970 7:00:00 AM">
			<cfset stAdminWorkGroup.WednesdayEnd = "1/1/1970 7:30:00 PM">
			<cfset stAdminWorkGroup.ThursdayStart = "1/1/1970 7:00:00 AM">
			<cfset stAdminWorkGroup.ThursdayEnd = "1/1/1970 7:30:00 PM">
			<cfset stAdminWorkGroup.FridayStart = "1/1/1970 7:00:00 AM">
			<cfset stAdminWorkGroup.FridayEnd = "1/1/1970 7:30:00 PM">
			<cfset stAdminWorkGroup.SaturdayStart = "1/1/1970 7:00:00 AM">
			<cfset stAdminWorkGroup.SaturdayEnd = "1/1/1970 7:30:00 PM">
			<cfset stAdminWorkGroup.SundayStart = "1/1/1970 7:00:00 AM">
			<cfset stAdminWorkGroup.SundayEnd = "1/1/1970 7:30:00 PM">
			<cfset request.AdminWorkGroup.init(trim(clientDatasource), stAdminWorkGroup)>					
			<cfset request.AdminWorkGroup.save(request.AdminWorkGroup)>			
			
	 					
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
