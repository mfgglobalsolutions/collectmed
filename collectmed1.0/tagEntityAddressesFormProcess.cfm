

<!-------------------------------------------------------------------------------------->
<!--- Initialize all tag variables.                                                  --->      
<!-------------------------------------------------------------------------------------->
	<cfparam name="attributes.addressIDList" default="">
	<cfset addressIDList = attributes.addressIDList>



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
		<cfset AddressDBIDs = "">
		<cfset EntityAddressObj = CreateObject("component", "com.common.Entity")>
		<cfset AddressObj = CreateObject("component", "com.common.Address")>
		
		<cftransaction>		
			
			<!-------------------------------------------------------------------------------------->
			<!--- The Addresses the user inputs.                                                 --->
			<!-------------------------------------------------------------------------------------->							
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
			<cfset EntityAddressObj.archiveEntityAddressAttachments(clientID: trim(session.clientID), entityID: trim(EntityID), trim(AddressDBIDs))>
			
			
										
			<!-------------------------------------------------------------------------------------->
			<!--- Start looping the array and either insert or update the address.               --->
			<!-------------------------------------------------------------------------------------->			
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
					
					
				<!-------------------------------------------------------------------------------------->
				<!--- INSERT address if the dbid is not numeric.                                     --->
				<!-------------------------------------------------------------------------------------->											
				<cfif NOT IsNumeric(AddressDBID)> 					
					
					<cfset AddressObj.reset()>
					<cfset AddressObj.setAddressTypeID(trim(AddressTypeID))>
					<cfset AddressObj.setAddressLine1(trim(AddressLine1))>
					<cfset AddressObj.setAddressLine2(trim(AddressLine2))>
					<cfset AddressObj.setCity(trim(City))>
					<cfset AddressObj.setStateID(trim(StateID))>
					<cfset AddressObj.setZipCode(trim(ZipCode))>
					<cfset addressID = AddressObj.commit()>
																
				<!-------------------------------------------------------------------------------------->
				<!--- UPDATE the dbid is present.                                                    --->
				<!-------------------------------------------------------------------------------------->												
				<cfelse>
					
					<cfset AddressObj.reset()>
					<cfset AddressObj.init(trim(AddressDBID))>
					<cfset AddressObj.setAddressTypeID(trim(AddressTypeID))>
					<cfset AddressObj.setAddressLine1(trim(AddressLine1))>
					<cfset AddressObj.setAddressLine2(trim(AddressLine2))>
					<cfset AddressObj.setCity(trim(City))>
					<cfset AddressObj.setStateID(trim(StateID))>
					<cfset AddressObj.setZipCode(trim(ZipCode))>
					<cfset AddressObj.commit()>										
					<cfset addressID = trim(AddressDBID)>							
					
				</cfif>
								
				<!-------------------------------------------------------------------------------------->
				<!--- Bind the Entity to this address or update the IsDefualt.                       --->
				<!-------------------------------------------------------------------------------------->																
				<cfset EntityAddressObj.bindEntityAddress(clientID: trim(session.clientID), entityID: trim(EntityID), addressID: trim(AddressID), isDefault: trim(IsDefault))>
										
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
							

