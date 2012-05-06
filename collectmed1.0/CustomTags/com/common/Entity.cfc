



<cfcomponent extends="com.common.db.EntityIO">		
			
			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Get the Entity record Information.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEntityMetadata">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="EntityID" required="yes" type="numeric">			
	
			<cftry>
				
				<cfquery name="getEntityInformation" datasource="PAClient_#trim(ClientID)#">
					SELECT *
					FROM Entity  
					WHERE EntityID = #trim(EntityID)#
				</cfquery>
				
				<cfreturn getEntityInformation>						
					
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get email addresses belonging to an entity.    --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getEntityEmailAddresses">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="EntityID" required="yes" type="numeric">
		<cfargument name="Active" required="no" default="1">
											
		<cftry>			
			
			<cfquery name="getEmailAddresses" datasource="PAClient_#trim(ClientID)#">
				SELECT EmailAddressID, EmailTypeID, Email, IsDefault
				FROM EmailAddress
				WHERE EntityID = #trim(EntityID)# 
				<cfif IsNumeric(Active)>
					AND Active = #trim(Active)#	
				</cfif>				
			</cfquery>
						
			<cfreturn getEmailAddresses>						
					
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
			
				
		
		
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get addresses belonging to an entity.          --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getEntityAddresses">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="EntityID" required="yes" type="numeric">
		<cfargument name="Active" required="no" default="">
											
		<cftry>			
			
			<cfquery name="getAddresses" datasource="PAClient_#trim(ClientID)#">
				SELECT ea.IsDefault, a.AddressID, a.attention, a.SiteID, a.AddressTypeID, a.AddressLine1, a.AddressLine2, a.City, a.StateID, 
				a.ZipCode, a.CountryID, a.Active, a.DateCreated, sli2.ItemNameDisplay AS AddressType,
				sli.ItemNameDisplay AS StateFull, sli.ItemDescription AS StateAbbr
				FROM EntityAddress ea INNER JOIN Address a ON ea.AddressID = a.AddressID
				INNER JOIN pa_master.StandardListItem sli	ON a.stateID = sli.StandardListItemID		
				INNER JOIN pa_master.StandardListItem sli2 ON a.AddressTypeID = sli2.StandardListItemID 				
				WHERE ea.EntityID = #trim(EntityID)# 				
				<cfif IsNumeric(Active)>
					AND ea.Active = #trim(Active)#	
				</cfif>		
				Order BY ea.IsDefault DESC		
			</cfquery>
						
			<cfreturn getAddresses>						
					
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
			
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the Entities default address.              --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getEntityDefaultAddress">		
		
		<cfargument name="clientID" required="yes" type="numeric">		
		<cfargument name="EntityID" required="yes" type="numeric">
													
		<cftry>			
			
			<cfquery name="getDefaultAddress" datasource="PAClient_#trim(ClientID)#">
				SELECT a.AddressID
				FROM EntityAddress ea INNER JOIN Address a ON ea.AddressID = a.AddressID 				
				WHERE ea.EntityID = #trim(EntityID)# AND ea.Active = 1 AND ea.IsDefault = 1				
			</cfquery>
						
			<cfreturn getDefaultAddress>						
					
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the Entities default address.              --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getEntityDefaultFullAddress">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="EntityID" required="yes" type="numeric">
													
		<cftry>			
			
			<cfquery name="getDefaultAddress" datasource="PAClient_#trim(ClientID)#">
				SELECT ea.IsDefault, a.AddressID, a.AddressTypeID, sli2.ItemNameDisplay AS AddressType, a.AddressLine1, a.AddressLine2, a.City, a.StateID, sli.ItemNameDisplay AS StateFull, sli.ItemDescription AS StateAbbr, a.ZipCode, a.CountryID 
				FROM EntityAddress ea 
				INNER JOIN Address a ON ea.AddressID = a.AddressID 	
				INNER JOIN pa_master.StandardListItem sli	ON a.stateID = sli.StandardListItemID		
				INNER JOIN pa_master.StandardListItem sli2 ON a.AddressTypeID = sli2.StandardListItemID	
				WHERE ea.EntityID = #trim(EntityID)# AND ea.Active = 1		
				Order BY ea.IsDefault DESC	
				LIMIT 1	
			</cfquery>
								
			<cfreturn getDefaultAddress>						
					
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>
			
			
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to bind an address to an entity.                  --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="bindEntityAddress">		
				
		<cfargument name="clientID" required="yes" type="numeric">		 
		<cfargument name="EntityID" required="yes" type="numeric">
		<cfargument name="AddressID" required="yes" type="numeric">
		<cfargument name="IsDefault" required="no" default="">
									
		<cftry>			
			
			<cfset EntityAddressObj = CreateObject("component", "com.common.db.EntityAddressIO")>
					
			<cfset tempQuery = EntityAddressObj.getEntityAddressQuery(fields: 'RecordID', EntityID: trim(EntityID), AddressID: trim(AddressID))>
			
			<cfif tempQuery.RecordCount LTE 0>
			
				<cfset EntityAddressObj.setEntityID(trim(EntityID))>
				<cfset EntityAddressObj.setAddressID(trim(AddressID))>
				<cfset EntityAddressObj.setIsDefault(trim(IsDefault))>		
				<cfset EntityAddressObj.commit()>
					
			<cfelseif tempQuery.RecordCount EQ 1>
				
				<cfset EntityAddressObj.reset()>
				<cfset EntityAddressObj.init(trim(tempQuery.RecordID))>
				<cfset EntityAddressObj.setEntityID(trim(EntityID))>
				<cfset EntityAddressObj.setAddressID(trim(AddressID))>
				<cfset EntityAddressObj.setIsDefault(trim(IsDefault))>		
				<cfset EntityAddressObj.commit()>				
			
			<cfelse>
				
				<cfthrow message="There are duplicate records in the Entity Address Table. #trim(EntityID)# #trim(AddressID)#">			
			
			</cfif>
			
			
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>			
	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to ARCHIVE an entity address db.                  --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="archiveEntityAddress">		
		
		<cfargument name="clientID" required="yes" type="numeric">		
		<cfargument name="EntityID" required="yes" type="numeric">
		<cfargument name="AddressID" required="yes" type="numeric">
							
		<cftry>
												
			<cfquery name="archiveEntityAddress" datasource="PAClient_#trim(ClientID)#">
				UPDATE EntityAddress 
				SET Active = 0, InactiveCode = 68
				WHERE EntityID = #trim(EntityID)# AND AddressID = #trim(AddressID)#	
			</cfquery>	
					
						
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
		
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to ARCHIVE an entities address from the db.       --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="archiveEntityAddressAttachments" hint="This function can be used to archive a users addresses they are attached to.">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="EntityID" required="yes" type="numeric">		
		<cfargument name="AddressIDNotIn" type="string" default="">
							
		<cftry>
				
			<cfquery name="archiveEntityAddress" datasource="PAClient_#trim(ClientID)#">
				UPDATE EntityAddress 
				SET Active = 0, InactiveCode = 68
				WHERE EntityID = #trim(EntityID)#
				<cfif AddressIDNotIn NEQ "">
					AND AddressID NOT IN(#trim(AddressIDNotIn)#)
				</cfif> 	
			</cfquery>	
			
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
			
		</cftry>
		
	</cffunction>		
		
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get phones belonging to an entity.             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getEntityPhones">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="EntityID" required="yes" type="numeric">
		<cfargument name="Active" required="no" default="">
											
		<cftry>			
			
			<cfquery name="getPhones" datasource="PAClient_#trim(ClientID)#">
				SELECT ep.IsDefault, p.PhoneID, p.SiteID, p.PhoneTypeID, p.PhoneNumber, p.PhoneExtension, p.Active			
				FROM EntityPhone ep INNER JOIN Phone p ON ep.PhoneID = p.PhoneID 				
				WHERE ep.EntityID = #trim(EntityID)# 
				<cfif IsNumeric(Active)>
					AND ep.Active = #trim(Active)#	
				</cfif>		
			</cfquery>
						
			<cfreturn getPhones>						
					
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
			
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the Entities default phone.                --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getEntityDefaultPhone">		
		
		<cfargument name="clientID" required="yes" type="numeric"> 
		<cfargument name="EntityID" required="yes" type="numeric">
													
		<cftry>			
			
			<cfquery name="getDefaultPhone" datasource="PAClient_#trim(ClientID)#">
				SELECT p.PhoneID
				FROM EntityPhone ep INNER JOIN Phone p ON ep.PhoneID = p.PhoneID 										
				WHERE ep.EntityID = #trim(EntityID)# AND ep.Active = 1
				ORDER BY ep.IsDefault
				LIMIT 1	
			</cfquery>
						
			<cfreturn getDefaultPhone>						
					
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the Entities default phone decrypted.      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getEntityDefaultPhoneFull">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="EntityID" required="yes" type="numeric">
															
		<cftry>			
			
			<cfset PhoneExtensionD = "">
			
			<cfquery name="getDefaultPhone" datasource="PAClient_#trim(ClientID)#">
				SELECT p.PhoneID, p.PhoneNumber, p.phoneExtension 
				FROM EntityPhone ep INNER JOIN Phone p ON ep.PhoneID = p.PhoneID 										
				WHERE ep.EntityID = #trim(EntityID)# AND ep.Active = 1
				ORDER BY ep.IsDefault DESC	
				LIMIT 1
			</cfquery>
			
			<cfset PhoneD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(getDefaultPhone.PhoneNumber)) />	
			<cfif trim(getDefaultPhone.phoneExtension) NEQ "">
				<cfset PhoneExtensionD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(getDefaultPhone.PhoneExtension)) />
			</cfif>							
			
			<cfreturn PhoneD & PhoneExtensionD>						
					
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the Entities default phone decrypted.      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getEntityFaxPhoneFull">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="EntityID" required="yes" type="numeric">
													
		<cftry>			
			
			<cfset PhoneExtensionD = "">
			
			<cfquery name="getDefaultPhone" datasource="PAClient_#trim(ClientID)#">
				SELECT p.PhoneID, p.PhoneNumber, p.phoneExtension 
				FROM EntityPhone ep INNER JOIN Phone p ON ep.PhoneID = p.PhoneID 										
				WHERE ep.EntityID = #trim(EntityID)# AND ep.Active = 1 AND p.PhoneTypeID = 87
				ORDER BY ep.IsDefault
				LIMIT 1	
			</cfquery>
			
			<cfset PhoneD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(getDefaultPhone.PhoneNumber)) />
			<cfif trim(getDefaultPhone.phoneExtension) NEQ "">
				<cfset PhoneExtensionD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(getDefaultPhone.PhoneExtension)) />
			</cfif>							
			
			<cfreturn PhoneD & PhoneExtensionD>						
					
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>
			
			
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to bind an address to an entity.                  --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="bindEntityPhone">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="EntityID" required="yes" type="numeric">
		<cfargument name="PhoneID" required="yes" type="numeric">
		<cfargument name="IsDefault" required="no" default="">
									
		<cftry>			
			
			<cfset EntityPhoneObj = CreateObject("component", "com.common.db.EntityPhoneIO")>
					
			<cfset tempQuery = EntityPhoneObj.getEntityPhoneQuery(fields: 'RecordID', EntityID: trim(EntityID), PhoneID: trim(PhoneID))>
			
			<cfif tempQuery.RecordCount LTE 0>
			
				<cfset EntityPhoneObj.setEntityID(trim(EntityID))>
				<cfset EntityPhoneObj.setPhoneID(trim(PhoneID))>
				<cfset EntityPhoneObj.setIsDefault(trim(IsDefault))>		
				<cfset EntityPhoneObj.commit()>
					
			<cfelseif tempQuery.RecordCount EQ 1>
				
				<cfset EntityPhoneObj.reset()>
				<cfset EntityPhoneObj.init(trim(tempQuery.RecordID))>
				<cfset EntityPhoneObj.setEntityID(trim(EntityID))>
				<cfset EntityPhoneObj.setPhoneID(trim(PhoneID))>
				<cfset EntityPhoneObj.setIsDefault(trim(IsDefault))>		
				<cfset EntityPhoneObj.commit()>				
			
			<cfelse>
				
				<cfthrow message="There are duplicate records in the Entity Phone Table. #trim(EntityID)# #trim(PhoneID)#">			
			
			</cfif>
			
			
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>			
	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to ARCHIVE an entity address db.                  --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="archiveEntityPhone">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="EntityID" required="yes" type="numeric">
		<cfargument name="PhoneID" required="yes" type="numeric">
							
		<cftry>
												
			<cfquery name="archiveEntityPhone" datasource="PAClient_#trim(ClientID)#">
				UPDATE EntityPhone 
				SET Active = 0, InactiveCode = 68
				WHERE EntityID = #trim(EntityID)# AND PhoneID = #trim(PhoneID)#	
			</cfquery>	
					
						
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
		
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to ARCHIVE an entities address from the db.       --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="archiveEntityPhoneAttachments" hint="This function can be used to archive a users phones they are attached to.">		
		
		<cfargument name="clientID" required="yes" type="numeric">		
		<cfargument name="EntityID" required="yes" type="numeric">		
		<cfargument name="PhoneIDNotIn" type="string" default="">
							
		<cftry>
				
			<cfquery name="archiveEntityPhone" datasource="PAClient_#trim(ClientID)#">
				UPDATE EntityPhone 
				SET Active = 0, InactiveCode = 68
				WHERE EntityID = #trim(EntityID)#
				<cfif PhoneIDNotIn NEQ "">
					AND PhoneID NOT IN(#trim(PhoneIDNotIn)#)
				</cfif> 	
			</cfquery>	
			
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
			
		</cftry>
		
	</cffunction>		

	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Call this function to get the default Address, Phone in string format.         --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getEntityAddressPhoneString" hint="Call this function to get the default Address, Phone in string format.">
		
		<cfargument name="clientID" required="yes" type="numeric">		
		<cfargument name="EntityID" required="yes" type="numeric">		
		
		<cfset address = getEntityDefaultFullAddress(clientID: clientID, entityID: EntityID)>
				
		<cfif IsQuery(Address)>
			<cfset retString = "#trim(address.IsDefault)#|#trim(address.AddressID)#|#trim(address.AddressTypeID)#|#trim(address.AddressType)#|#trim(address.AddressLine1)#|#trim(address.AddressLine2)#|#trim(address.City)#|#trim(address.StateID)#|#trim(address.StateFull)#|#trim(address.StateAbbr)#|#trim(address.ZipCode)#|#trim(address.CountryID)#"> 
		</cfif>				
		
		<cfset retString = retString & "|" & trim(getEntityDefaultPhoneFull(clientID: clientID, entityID: EntityID)) & "|" & trim(getEntityFaxPhoneFull(clientID: clientID, entityID: EntityID))> 
						
		<cfset retString = Replace(retString, CHR(9), CHR(124), "ALL")>
		<cfset retString = Replace(retString, "||", "|@@|", "ALL")>
		<cfset retString = Replace(retString, "|""", CHR(124), "ALL")>
		<cfset retString = Replace(retString, """|", CHR(124), "ALL")>
		
		<cfif Left(retString, 1) EQ "|">
			<cfset retString = retString & "@@">
		</cfif>				
		<cfif Right(retString, 1) EQ "|">
			<cfset retString = retString & "@@">
		</cfif>		
		
		<cfreturn retString>
		
	</cffunction>
	
	
	
		
</cfcomponent>

		