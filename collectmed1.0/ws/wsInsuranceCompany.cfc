

<cfcomponent>
		
	<cffunction name="wsInsuranceCompany" access="remote" returntype="string" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="An ID" required="true">
		
		<cfset ClientID = Data1>
		<cfset InsuranceCompanyID = Data2>
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
						
			<cfinvoke 
				component="com.common.InsuranceCompany" 
				method="getInsuranceCompany" 
				clientID="#trim(ClientID)#"
				insurancecompanyid="#trim(InsuranceCompanyID)#"
				returnvariable="InsuranceCompany">
									
			<cfif InsuranceCompany NEQ "">				
				<cfreturn InsuranceCompany>
			<cfelse>
				<cfreturn false>	
			</cfif>
								
			<cfcatch type="Any">				
			
				<cfreturn "#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
				
				<cf_gcGeneralErrorTemplate message="#CFCATCH.TYPE#|#cfcatch.message#|#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 

	<cffunction name="wsInsuranceCompanyXML" access="remote" returntype="xml" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="An ID" required="true">
		
		<cfset variables.ClientID = Data1>
		<cfset variables.InsuranceCompanyID = Data2>
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfset variables.objXMLFunc = application.beanFactory.getBean("old_xmlFunctions")>
			<cfset variables.objToXML = application.beanFactory.getBean("old_toXML")>
			<cfset variables.objIC = createObject("component", "com.common.InsuranceCompany")>
			<cfset variables.objwsEntity = createObject("component", "wsEntity")>
			
			<cfset variables.InsuranceCompany = variables.objIC.getInsuranceCompany(clientID: variables.ClientID, insurancecompanyid: variables.InsuranceCompanyID)>						
			<cfset variables.AddressesPhones =  variables.objwsEntity.wsGetEntityAddPhoXML(data1: variables.ClientID, data2: variables.InsuranceCompany.EntityID)>
				
			<cfset variables.xmlInsuranceCompany = variables.objToXML.queryToXML(data: variables.InsuranceCompany, rootelement: "ROOT", itemelement: "INSURANCECOMPANY")>
				
			<cfset variables.arrayEntityElement = XMLSearch(variables.AddressesPhones, "//ENTITY")>
			<cfset variables.arrayInsuranceCompanyElement = XMLSearch(variables.xmlInsuranceCompany, "//INSURANCECOMPANY")>
					
			<cfset variables.temp = variables.objXMLFunc.xmlAppend(variables.arrayInsuranceCompanyElement[1], variables.arrayEntityElement[1]) />

			<cfset variables.xmlReturn = variables.objToXML.stringToXML(data: variables.temp, rootelement: "ROOT", itemelement: "ITEMS")>
				
			<cfreturn variables.xmlReturn>
											
			<cfcatch type="Any">				
			
				<cfreturn "<?xml version=""1.0"" encoding=""UTF-8""?><error>#CFCATCH.TYPE#|#cfcatch.message#</error>">				
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
		
	<cffunction name="wsInsuranceCompaniesAutoSuggestXML" access="remote" returntype="xml" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		<cfargument name="Data2" type="string" hint="Search String" required="true">
		<cfargument name="Data3" type="string" hint="Number of records to return" required="false" default="0">
		
		<cfset variables.ClientID = Data1>
		<cfset variables.searchStr = Data2>
		<cfset variables.count = Data3>
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
				<cfset wsInsuranceCompaniesAutoSuggestXMLNew(variables.ClientID)>		
			<!-------------------------------------------------------------------------------------->
			<!--- If this is the first run put this large query in the application scope.        --->
			<!-------------------------------------------------------------------------------------->			
			<cfif IsDefined("application.wsInsuranceCompaniesAutoSuggestXML_#trim(variables.ClientID)#") and variables.count EQ 0>				
				<cfreturn "application.wsInsuranceCompaniesAutoSuggestXML_#trim(variables.ClientID)#">			
			</cfif>
			
				
			<cfset variables.objXMLFunc = application.beanFactory.getBean("old_xmlFunctions")>
			<cfset variables.objToXML = application.beanFactory.getBean("old_toXML")>
			<cfset variables.objIC = createObject("component", "com.common.InsuranceCompany")>
			<cfset variables.objwsEntity = createObject("component", "wsEntity")>	
		
			<cfset variables.searchStr = Replace(variables.searchStr, '%20', ' ', 'ALL')>			
						
			<cfset variables.qInsuranceCompany = variables.objIC.getInsuranceCompaniesAutoSuggest(method: "getInsuranceCompaniesAutoSuggest", clientID: trim(variables.ClientID), count: variables.count, searchstr: variables.searchStr)> <!---DO NOT TRIM SearchSTR--->
									
			<cfif NOT IsQuery(variables.qInsuranceCompany)>
				<cfset variables.qInsuranceCompany = querynew("InsuranceCompanyID,InsuranceCompanyName")>
			</cfif>			
	
			<cfset variables.finalString = "<?xml version=""1.0"" encoding=""UTF-8""?><INSURANCECOMPANIES>" />
							
			<cfloop query="variables.qInsuranceCompany">
				<cfset variables.InsuranceCompany = variables.objIC.getInsuranceCompany(clientID: variables.ClientID, insurancecompanyid: variables.qInsuranceCompany.InsuranceCompanyID) />						
				<cfset variables.AddressesPhones =  variables.objwsEntity.wsGetEntityAddPhoXML(data1: variables.ClientID, data2: variables.InsuranceCompany.EntityID) />					
				<cfset variables.xmlInsuranceCompany = variables.objToXML.queryToXML(data: variables.InsuranceCompany, rootelement: "IC", itemelement: "INSURANCECOMPANY") />
				<cfset variables.arrayEntityElement = XMLSearch(variables.AddressesPhones, "//ENTITY") />
				<cfset variables.arrayInsuranceCompanyElement = XMLSearch(variables.xmlInsuranceCompany, "//INSURANCECOMPANY") />
				<cfset variables.temp = variables.objXMLFunc.xmlAppend(variables.arrayInsuranceCompanyElement[1], variables.arrayEntityElement[1]) />						
				<cfset variables.thisData = Replace(variables.temp[1], '<?xml version="1.0" encoding="UTF-8"?>', '', 'ALL')>
				<cfset variables.finalString = variables.finalString & variables.thisData>
			</cfloop>
			
			<cfset variables.xmlInsuranceCompanies = variables.finalString & "</INSURANCECOMPANIES>">
																			
			<cfif variables.xmlInsuranceCompanies NEQ "">	
				<cfset "application.wsInsuranceCompaniesAutoSuggestXML_#trim(variables.ClientID)#" = trim(variables.xmlInsuranceCompanies)>	
				<cfreturn variables.xmlInsuranceCompanies>
			<cfelse>
				<cfreturn "<?xml version=""1.0"" encoding=""UTF-8""?><records>no records found</records>">		
			</cfif>
								
			<cfcatch type="Any">				
			
				<cfreturn "<?xml version=""1.0"" encoding=""UTF-8""?><error>#CFCATCH.TYPE#|#cfcatch.message#</error>">				
									
			</cfcatch>
			
		</cftry>
		
	</cffunction> 
	
	
	
	<cffunction name="wsInsuranceCompaniesAutoSuggestXMLNew" access="remote" returntype="xml" output="no">
		
		<cfargument name="Data1" type="string" hint="Client" required="true">
		
		<cfset variables.ClientID = Data1>
						
		<!--------------------------------------------------------------------------------------->
		<!--- Always write this code because of dev debug.                                    --->
		<!--------------------------------------------------------------------------------------->				
		<cfsetting showdebugoutput="No">
		
		<cftry>
			
			<cfset variables.objXMLFunc = application.beanFactory.getBean("old_xmlFunctions")>
			<cfset variables.objToXML = application.beanFactory.getBean("old_toXML")>
			<cfset variables.objIC = createObject("component", "com.common.InsuranceCompany")>

			<cfset variables.qInsuranceCompanies = variables.objIC.getInsuranceCompanies(clientID: variables.ClientID)>	

			<cfset variables.finalString = "<?xml version=""1.0"" encoding=""UTF-8""?><INSURANCECOMPANIES>" />
			<cfset variables.InsuranceCompanyNameAddressFormatted = "">
			
			<cfloop query="variables.qInsuranceCompanies">				
				
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

	