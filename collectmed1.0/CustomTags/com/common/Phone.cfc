


<cfcomponent extends="com.common.db.PhoneIO">		
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get a phone by phoneID.                        --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getPhone">		
		
		<cfargument name="clientID" required="yes" type="string">
		<cfargument name="phoneID" required="yes" type="string">									
		
		<cftry>			
			
			<cfquery name="getPhone" datasource="PAClient_#trim(ClientID)#">
				SELECT PhoneID,PhoneTypeID, PhoneNumber, PhoneExtension
				FROM phone 
				WHERE PhoneID = #trim(PhoneID)#			
			</cfquery>
			
			<cfif getPhone.RecordCount EQ 1>
				<cfset PhoneD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(getPhone.PhoneNumber)) />
				<cfset PhoneExtD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(getPhone.PhoneExtension)) />
				<cfreturn "#trim(PhoneID)#|#trim(getPhone.PhoneTypeID)#|#trim(PhoneD)#|#trim(PhoneExtD)#">
			<cfelse>
				<cfreturn "ERROR: Phone not found">	
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
	<!--- This function will be called to delete an Phone from the db.                   --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="deletePhone">		
		
		<cfargument name="PhoneID" required="yes" type="numeric">
							
		<cftry>			
			
			<cfquery name="deleteEntityPhone" datasource="#trim(request.datasource)#">
				DELETE FROM entityphone 
				WHERE PhoneID = #trim(PhoneID)#	
			</cfquery>	
					
			<cfquery name="deletePhone" datasource="#trim(request.datasource)#">
				DELETE FROM phone 
				WHERE PhoneID = #trim(PhoneID)#	
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
	<!--- This function will be called to ARCHIVE an Phone from the db.                  --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="archivePhone">		
		
		<cfargument name="PhoneID" required="yes" type="numeric">
							
		<cftry>
			
						
			<cfquery name="archiveEntityPhone" datasource="#trim(request.datasource)#">
				UPDATE entityphone 
				SET Active = 0, InactiveCode = 68
				WHERE PhoneID = #trim(PhoneID)#	
			</cfquery>	
					
			<cfquery name="archivePhone" datasource="#trim(request.datasource)#">
				UPDATE phone 
				SET Active = 0, InactiveCode = 68
				WHERE PhoneID = #trim(PhoneID)#	
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
	<!--- This function will be called to ARCHIVE an entities Phone from the db.         --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="archivePhoneAttachment" hint="This function can be used to archive a users Phonees they are attached to.">		
		
		<cfargument name="EntityID" required="yes" type="numeric">
		<cfargument name="PhoneID" type="string" default="">
		<cfargument name="PhoneIDNotIn" type="string" default="">
							
		<cftry>										
			
			<cfif Len(PhoneID) LTE 0 AND Len(PhoneIDNotIn) LTE 0>
				<cfthrow message="You must provide an PhoneID to archive.">
			</cfif>
			
			<cfif Len(PhoneID) GTE 1>
			
				<cfloop list="#trim(PhoneID)#" index="i">
					
					<cfquery name="archiveEntityPhone" datasource="#trim(request.datasource)#">
						UPDATE entityphone 
						SET Active = 0, InactiveCode = 68
						WHERE EntityID = #trim(EntityID)# AND PhoneID = #trim(PhoneID)#	
					</cfquery>	
								
				</cfloop>
			
			</cfif>
			
			<cfif Len(PhoneIDNotIn) GTE 1>				
					
				<cfquery name="archiveEntityPhone" datasource="#trim(request.datasource)#">
					UPDATE entityphone 
					SET Active = 0, InactiveCode = 68
					WHERE EntityID = #trim(EntityID)# AND PhoneID NOT IN(#trim(PhoneIDNotIn)#)
				</cfquery>					
			
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
	<!--- This function will be called to bind a phone to an entity.                     --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="bindPhone">		
		
		<cfargument name="EntityID" required="yes" type="numeric">
		<cfargument name="PhoneID" required="yes" type="numeric">
							
		<cftry>			
			
			<cfquery name="insertEntityPhone" datasource="#trim(request.datasource)#">
				INSERT INTO entityphone  (EntityID, PhoneID)
				VALUES(#trim(EntityID)#, #trim(PhoneID)#)					
			</cfquery>
						
					
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
			
		
			
		
		
</cfcomponent>

	



