

<cfcomponent extends="cmComponents.com.common.db.InsuranceCompanyIO">		
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to check if an insurance company exists already.  --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="checkInsuranceCompanyExists">		
		
		<cfargument name="clientID" required="Yes" type="numeric">		
		<cfargument name="InsuranceCompanyName" required="yes">
							
		<cftry>			
			
			<cfquery name="checkExistsInsuranceCompany" datasource="PAClient_#trim(ClientID)#">
				SELECT InsuranceCompanyID
				FROM insurancecompany
				WHERE clientID = #trim(clientID)# AND InsuranceCompanyName = '#trim(InsuranceCompanyName)#'
			</cfquery>
						
			<cfreturn checkExistsInsuranceCompany>
						
			<cfcatch type="Any">
			
				<cfthrow message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">			
				
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
		
		
		
		
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to add an insurance company.                      --->
	<!-------------------------------------------------------------------------------------->				
	<cffunction name="addInsuranceCompany">		
		
		<cfargument name="SiteID" required="Yes" type="numeric">
		<cfargument name="clientID" required="Yes" type="numeric">		
		<cfargument name="SupportEmailAddressID" required="Yes" type="numeric">		
		<cfargument name="OCNANumber" required="no" default="">
		<cfargument name="insurancecompanyname" required="yes">
		<cfargument name="insurancecompanydba" required="no" default="">		
		<cfargument name="AddressTypeID" required="no">		
		<cfargument name="AddressLine1" required="no" default="">
		<cfargument name="AddressLine2" required="no" default="">
		<cfargument name="AddressCity" required="no" default="">
		<cfargument name="AddressStateID" required="no">
		<cfargument name="AddressZipCode" required="no" default="">		
		<cfargument name="PhoneTypeID" required="no">
		<cfargument name="PhoneNumber" required="no" default="">
		<cfargument name="PhoneExtension" required="no" default="">		
		<cfargument name="insurancecompanyURL" required="no" default="">		
		<cfargument name="insurancecompanyVerify" required="no" default="no">
		
		<cftry>
			
			<cftransaction>			
							
				<!-------------------------------------------------------------------------------------->
				<!--- Start by checking to see if the insurance company name is not taken.           --->
				<!-------------------------------------------------------------------------------------->			
				<cfif insurancecompanyVerify>	
					
					<cfset tempQuery = checkInsuranceCompanyExists(clientID: trim(clientID), InsuranceCompanyName: trim(InsuranceCompanyName))>
					
					<cfif tempQuery.RecordCount EQ 1>
						<cfreturn tempQuery.InsuranceCompanyID>
					<cfelseif tempQuery.RecordCount GT 1>
						<cfinvoke component="com.common.db.EmailAddressIO" method="getEmailAddressQuery" returnVariable="EAQuery" fields="Email" EmailAddressID="#trim(SupportEmailAddressID)#">
						<cfset EmailAddress = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(EAQuery.Email)) />
						<cfset message = "There are multiples of this Insurance Company: '#trim(InsuranceCompanyName)#'">
						<cf_gcSendEmail	from="#trim(EmailAddress)#" to="#trim(EmailAddress)#" subject="multiple of the same Insurance Company. IMMEDIATE ATTENTION REQUIRED." message="<p><strong>User was sent:</strong> <br>CFTHROW</p><p><strong>Admin Note:</strong><br>#trim(message)#</p>">	
						<cf_gcGatewayLogger	code="115" logtext="<p><strong>User was sent:</strong> <br>#trim(message)#</p>#GetBaseTemplatePath()#">	
						<cfthrow message="#trim(message)#">
					</cfif>
						
				</cfif>
						
				
				<!-------------------------------------------------------------------------------------->
				<!--- Create a entity account for this InsuranceCompany. This entity account will    --->
				<!--- be used to store the phones addresses and other InsuranceCompany items.        --->
				<!-------------------------------------------------------------------------------------->		
				<cfset request.thisEntity = CreateObject("component","com.common.Entity")>				
				<cfset request.thisEntity.setSiteID(trim(SiteID))>
				<cfset request.thisEntity.setObjectTypeID(4)>
				<cfset EntityID = request.thisEntity.commit()>			
				
				<!-------------------------------------------------------------------------------------->
				<!--- Insert the InsuranceCompany information.                                       --->
				<!-------------------------------------------------------------------------------------->			
				<cfset this.setClientID(trim(ClientID))>
				<cfset this.setOCNANumber(trim(OCNANumber))>
				<cfset this.setInsuranceCompanyName(trim(InsuranceCompanyName))>
				<cfset this.setInsuranceCompanyDBA(trim(InsuranceCompanyDBA))>
				<cfset this.setInsuranceCompanyURL(trim(InsuranceCompanyURL))>
				<cfset this.setEntityID(trim(EntityID))>
				<cfset InsuranceCompanyID = this.commit()>			
				
				<!-------------------------------------------------------------------------------------->
				<!--- Insert the Insurance Company address                                           --->
				<!-------------------------------------------------------------------------------------->			
				<cfif AddressLine1 NEQ "" AND AddressLine1 NEQ "NULL">
					
					<cfset request.thisAddress = CreateObject("component","com.common.Address")>	
					<cfset request.thisAddress.setAddressTypeID(trim(AddressTypeID))>
					<cfset request.thisAddress.setAddressLine1(trim(AddressLine1))>
					<cfset request.thisAddress.setAddressLine2(trim(AddressLine2))>
					<cfset request.thisAddress.setCity(trim(AddressCity))>
					<cfset request.thisAddress.setStateID(trim(AddressStateID))>
					<cfset request.thisAddress.setZipCode(trim(AddressZipCode))>
					<cfset addressID = request.thisAddress.commit()>
								
					<!-------------------------------------------------------------------------------------->
					<!--- Insert the record that will tie the Insurance Company entity to an address     --->
					<!-------------------------------------------------------------------------------------->			
					<cfset request.thisEntity.bindEntityAddress(EntityID: trim(EntityID), AddressID: trim(AddressID))>				
				
				</cfif>
				
					
					
				<!-------------------------------------------------------------------------------------->
				<!--- Insert the Insurance Company Phone                                             --->
				<!-------------------------------------------------------------------------------------->			
				<cfif PhoneNumber NEQ "" AND PhoneNumber NEQ "NULL">
					
					<cfset PhoneNumberEncrypted = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(PhoneNumber)) />
					
					<cfif PhoneExtension GT "" AND PhoneExtension NEQ "NULL">
						<cfset PhoneExtensionEncrypted = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(PhoneExtension)) />
					<cfelse>
						<cfset PhoneExtensionEncrypted = "">
					</cfif>			
					
					<cfset request.thisPhone = CreateObject("component","com.common.Phone")>	
					<cfset request.thisPhone.setPhoneTypeID(trim(PhoneTypeID))>
					<cfset request.thisPhone.setPhoneNumber(trim(PhoneNumberEncrypted))>
					<cfif PhoneExtension GT "">
						<cfset request.thisPhone.setPhoneExtension(trim(PhoneExtensionEncrypted))>
					</cfif>
					<cfset PhoneID = request.thisPhone.commit()>
								
					<!-------------------------------------------------------------------------------------->
					<!--- Insert the record that will tie the Insurance Company entity to an address     --->
					<!-------------------------------------------------------------------------------------->			
					<cfset request.thisEntity.bindEntityPhone(EntityID: trim(EntityID), PhoneID: trim(PhoneID))>	
				
				</cfif>
				
				
				<!-------------------------------------------------------------------------------------->
				<!--- The Insurance company has been created now go ahead and return the ID.         --->
				<!-------------------------------------------------------------------------------------->				
				<cfreturn trim(InsuranceCompanyID)>
								
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
	<!--- This function will be called to get all insurance companies.                   --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getInsuranceCompanies" hint="This function will be called to get all insurance companies. Alogn with their Addresses and Phones if any.">		
		
		<cfargument name="clientID" required="Yes" type="numeric">
							
		<cftry>			
			
			<cfquery name="getInsuranceCompanies" datasource="PAClient_#trim(arguments.ClientID)#">								
				SELECT ic.InsuranceCompanyID, ic.InsuranceCompanyName, ic.InsuranceCompanyDBA, ic.EntityID, ic.OCNANumber, ic.InsuranceCompanyURL, 
				a.AddressID, a.SiteID, a.AddressTypeID, a.AddressLine1, a.AddressLine2, a.City, a.StateID, a.ZipCode, a.CountryID, a.Active, a.DateCreated, 
				sli2.ItemNameDisplay AS AddressType, sli.ItemNameDisplay AS StateFull, sli.ItemDescription AS StateAbbr
				FROM insurancecompany ic 
				LEFT JOIN entityAddress ea ON ic.EntityID = ea.EntityID AND ea.Active = 1		
				LEFT JOIN Address a ON ea.AddressID = a.AddressID AND a.Active = 1		
				LEFT JOIN pa_master.standardlistitem sli ON a.stateID = sli.StandardListItemID 		
				LEFT JOIN pa_master.standardlistitem sli2 ON a.AddressTypeID = sli2.StandardListItemID 		
				WHERE ic.Active = 1			
				Order BY ic.InsuranceCompanyID, ea.IsDefault DESC		
			</cfquery>
												
			<cfreturn getInsuranceCompanies>
						
			<cfcatch type="Any">
			
				<cfthrow message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">			
				
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
		
		
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get all insurance companies.                   --->
	<!--- IF YOU CHANGE THIS QUERY YOU NEED TO MAKE SURE YOU CHANGE IT IN THE WEB        --->
	<!--- SERVICE wsInsuranceCompany.                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInsuranceCompany" hint="This function will be called to get an insurance company.">		
		
		<cfargument name="clientID" required="Yes" type="numeric">
		<cfargument name="InsuranceCompanyID" required="Yes" type="numeric">
							
		<cftry>			
												
			<cfquery name="getInsuranceCompany" datasource="PAClient_#trim(arguments.ClientID)#">								
				SELECT InsuranceCompanyID, InsuranceCompanyName, InsuranceCompanyDBA, EntityID, OCNANumber, InsuranceCompanyURL				
				FROM insurancecompany 
				WHERE InsuranceCompanyID = #trim(arguments.InsuranceCompanyID)# AND Active = 1					
			</cfquery>
						
			<cfreturn getInsuranceCompany>			
						
			<cfcatch type="Any">
			
				<cfthrow message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">			
				
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
	
		
		
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get all insurance companies based on an        --->
	<!--- auto-suggest method.                                                           --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getInsuranceCompaniesAutoSuggest" hint="This function will be called to get all insurance companies based on a auto-suggest method.">		
		
		<cfargument name="clientID" required="Yes" type="numeric">
		<cfargument name="searchSTR" required="no" type="string" default="">
		<cfargument name="count" required="no" type="numeric" default="25">
							
		<cftry>			
			
			<cfquery name="getInsuranceCompanies" datasource="PAClient_#trim(ClientID)#">								
				SELECT <cfif isNumeric(arguments.count) AND arguments.count GT 0>TOP #arguments.count#</cfif> ic.InsuranceCompanyName, ic.InsuranceCompanyID
				FROM insurancecompany ic
				WHERE 1 = 1
				<cfif arguments.searchSTR NEQ "">AND ic.insuranceCompanyName LIKE '%#arguments.searchSTR#%'</cfif> 
				AND ic.Active = 1	
				ORDER BY ic.InsuranceCompanyName				
			</cfquery>
												
			<cfreturn getInsuranceCompanies>
						
			<cfcatch type="Any">
			
				<cfthrow message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">			
				
			</cfcatch>
			
		</cftry>
		
	</cffunction>		
	
	
	
	<cffunction name="InsuranceCompaniesAddressXML" returntype="xml" output="no">
		
		<cfargument name="clientID" required="Yes" type="numeric">
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<!--- <cfsetting showdebugoutput="No"> --->
		
		<cftry>
		
			<cfset variables.qInsuranceCompanies = getInsuranceCompanies(clientID: arguments.ClientID)>	

			<cfset variables.finalString = "<?xml version=""1.0"" encoding=""UTF-8""?><INSURANCECOMPANIES>" />
			<cfset variables.InsuranceCompanyNameAddressFormatted = "">
			
			<cfloop query="variables.qInsuranceCompanies">				
				
				<cfset variables.InsuranceCompanyNameAddressFormatted = "">
				
				<cfif trim(AddressLine1) NEQ ""> 
					<cfset variables.InsuranceCompanyNameAddressFormatted = trim(AddressLine1)>				
					<cfif trim(AddressLine2) NEQ "">
						<cfset variables.InsuranceCompanyNameAddressFormatted = variables.InsuranceCompanyNameAddressFormatted & " " & trim(AddressLine2)>
					</cfif>
					<cfset variables.InsuranceCompanyNameAddressFormatted = variables.InsuranceCompanyNameAddressFormatted & " " & trim(City) & ", " & trim(StateAbbr) & " " & trim(ZipCode)>
				</cfif>	
							
				<cfset variables.finalString = variables.finalString &  "<INSURANCECOMPANY><INSURANCECOMPANYID>#trim(InsuranceCompanyID)#</INSURANCECOMPANYID><INSURANCECOMPANYNAME>#XmlFormat(trim(InsuranceCompanyName))#</INSURANCECOMPANYNAME><INSURANCECOMPANYADDRESS>#XmlFormat(variables.InsuranceCompanyNameAddressFormatted)#</INSURANCECOMPANYADDRESS></INSURANCECOMPANY>">
				
			</cfloop>

			<cfset variables.xmlInsuranceCompanies = variables.finalString & "</INSURANCECOMPANIES>">
															
			<cfif variables.xmlInsuranceCompanies NEQ "">					
				<cfreturn variables.xmlInsuranceCompanies>
			<cfelse>
				<cfreturn "<?xml version=""1.0"" encoding=""UTF-8""?><records>no records found</records>">		
			</cfif>
								
			<cfcatch type="Any">				
			
				<cfreturn "<?xml version=""1.0"" encoding=""UTF-8""?><error>#CFCATCH.TYPE#|#cfcatch.message#</error>">				
									
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
		
		
</cfcomponent>
	
		
		
		
		
		
		
		
		
		
		
<!--- Quickly create insurance companies for testing.

<cfset SupportEmailAddressID = 50>
<cfset insurancecompanyname = "Medicare Insurance2">
<cfset OCNANumber = "1111144-9">
<cfset insurancecompanydba = "">
<cfset AddressTypeID = "13">
<cfset AddressLine1 = "1680 Pennsylvania Ave">
<cfset AddressLine2 = "">
<cfset AddressCity = "Wachington D.C.">
<cfset AddressStateID = "63">
<cfset AddressZipCode = "95125">
<cfset PhoneTypeID = "74">
<cfset PhoneNumber = "8667668500">
<cfset PhoneExtension = "789">	
<cfset InsuranceCompanyURL = "http://www.MedicareInsurance2.com">
<cfset request.InsuranceCompany = CreateObject("component", "com.common.InsuranceCompany")>
<cfset insuranceCompanyID = request.InsuranceCompany.addInsuranceCompany(clientID: session.Client.getClientID(), SupportEmailAddressID: session.client.getSupportEmailID(), OCNANumber: OCNANumber, insurancecompanyname: insurancecompanyname, insurancecompanydba: insurancecompanydba, AddressTypeID: AddressTypeID, AddressLine1: AddressLine1, AddressLine2: AddressLine2, AddressCity: AddressCity, AddressStateID: AddressStateID, AddressZipCode: AddressZipCode, PhoneTypeID: PhoneTypeID, PhoneNumber: PhoneNumber, PhoneExtension: PhoneExtension, insurancecompanyURL: InsuranceCompanyURL)>

--->	

	
