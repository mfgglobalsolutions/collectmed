

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.phoneIDList" default="">
	<cfset phoneIDList = attributes.phoneIDList>



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
		
		<cfset Count = 1>
		<cfset PhoneDBIDs = "">
		<cfset EntityPhoneObj = CreateObject("component", "com.common.Entity")>
		<cfset PhoneObj = CreateObject("component", "com.common.Phone")>
		
		<cftransaction>		
			
			<!-------------------------------------------------------------------------------------->
			<!--- The Phones the user inputs.                                                    --->
			<!-------------------------------------------------------------------------------------->							
			<cfloop list="#trim(form.phones)#" index="i">					
				<cfif IsNumeric(ListGetAt(i, 2, "|"))>
					<cfset PhoneDBIDs = ListAppend(PhoneDBIDs, ListGetAt(i, 2, "|"))>
				</cfif>			
			</cfloop>
			
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- In order to delete a phone we really dont delete it. What happens is that      --->
			<!--- the agent deletes it from the array and since it does not come in inserted     --->
			<!--- into the array then we archive any phone attached to this entity. We dont      --->
			<!--- delete the phone from the DB is because it is part of history.                 --->
			<!-------------------------------------------------------------------------------------->						
			<cfset EntityPhoneObj.archiveEntityPhoneAttachments(clientID: trim(session.clientID), trim(EntityID), trim(PhoneDBIDs))>
			
				
										
			<!-------------------------------------------------------------------------------------->
			<!--- Start looping the array and either insert or update the phone.                 --->
			<!-------------------------------------------------------------------------------------->			
			<cfloop list="#trim(form.Phones)#" index="i">
								
				<cfset id = ListGetAt(i, 1, "|")>
				
				<cfif ListGetAt(i, 2, "|") EQ "@@">
					<cfset PhoneDBID = "">
				<cfelse>
					<cfset PhoneDBID = ListGetAt(i, 2, "|")>	
				</cfif>
				
				<cfset PhoneTypeID = ListGetAt(i, 3, "|")>			
				<cfset IsDefault = ListGetAt(i, 4, "|")>					
				<cfset PhoneNumber = ListGetAt(i, 5, "|")>
				<cfset PhoneExtension = ListGetAt(i, 6, "|")>
									
				
				<cfset PhoneNumberE = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(request.cleanNumericString(trim(PhoneNumber)))) />
				<cfset PhoneExtensionE = application.beanFactory.getBean('globalFooter').GlobalFooterE(trim(request.cleanNumericString(trim(PhoneExtension)))) />	
					
					
				<!-------------------------------------------------------------------------------------->
				<!--- INSERT phone if the dbid is not numeric.                                       --->
				<!-------------------------------------------------------------------------------------->											
				<cfif NOT IsNumeric(PhoneDBID)> 					
														
					<cfset PhoneObj.reset()>
					<cfset PhoneObj.setPhoneTypeID(trim(PhoneTypeID))>
					<cfset PhoneObj.setPhoneNumber(trim(PhoneNumberE))>
					<cfset PhoneObj.setPhoneExtension(trim(PhoneExtensionE))>					
					<cfset phoneID = PhoneObj.commit()>
																
				<!-------------------------------------------------------------------------------------->
				<!--- UPDATE the dbid is present.                                                    --->
				<!-------------------------------------------------------------------------------------->												
				<cfelse>
														
					<cfset PhoneObj.reset()>
					<cfset PhoneObj.init(trim(PhoneDBID))>
					<cfset PhoneObj.setPhoneTypeID(trim(PhoneTypeID))>
					<cfset PhoneObj.setPhoneNumber(trim(PhoneNumberE))>
					<cfset PhoneObj.setPhoneExtension(trim(PhoneExtensionE))>					
					<cfset PhoneObj.commit()>										
					<cfset phoneID = trim(PhoneDBID)>							
					
				</cfif>
								
				<!-------------------------------------------------------------------------------------->
				<!--- Bind the Entity to this phone or update the IsDefualt.                         --->
				<!-------------------------------------------------------------------------------------->																
				<cfset EntityPhoneObj.bindEntityPhone(clientID: trim(session.clientID), entityID: trim(EntityID), PhoneID: trim(PhoneID), IsDefault: trim(IsDefault))>
										
				<cfset Count = Count + 1>	
																				
			</cfloop>		
		
		
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
							

