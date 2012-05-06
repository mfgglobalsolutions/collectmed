


<cfcomponent name="Client" extends="cmComponents.com.common.db.ClientIO">		
		
	<!-------------------------------------------------------------------------------------->
	<!--- This function will get the clients available users.                            --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getClientsUsers" returntype="query">		
		
		<cfargument name="ClientID" required="yes" type="numeric">
		<cfargument name="NotInUsersIDList" required="no" default="">
		<cfargument name="InUsersIDList" required="no" default="">
		<cfargument name="Active" required="no" default="yes">
		<cfargument name="InActive" required="no" default="no">
		<cfargument name="ActiveInActive" required="no" default="no">
		<cfargument name="haveRoleList" required="no" default="">
		<cfargument name="DISTINCT" required="no" default="no">
													
		<cftry>	
		
			<!-------------------------------------------------------------------------------------->
			<!--- Get all the entitys that are from this client.                                 --->
			<!-------------------------------------------------------------------------------------->
			<cfquery name="getClientsEntities" datasource="#trim(request.datasource)#">
				SELECT <cfif distinct>DISTINCT</cfif> e.EntityID, CONCAT(e.FName, ' ', e.LName) AS Fullname, u.UsersID, u.active
				FROM Entity e LEFT JOIN pa_master.Users u ON e.EntityID = u.EntityID
				<cfif haveRoleList NEQ "">
					LEFT JOIN UsersRole ur ON u.UsersID = ur.UsersID
					LEFT JOIN pa_master.UsersRole mur ON u.UsersID = mur.UsersID
				</cfif>
				WHERE e.EntityID IN (SELECT EntityID FROM Entity WHERE ClientID = #trim(clientID)#) AND ObjectTypeID = 2
				<cfif haveRoleList NEQ "">					
					AND (ur.RoleID IN(#trim(haveRoleList)#) OR mur.RoleID IN(#trim(haveRoleList)#))  
				</cfif>
				<cfif NotInUsersIDList NEQ "">
					AND u.UsersID NOT IN (#trim(NotInUsersIDList)#)
				</cfif>
				<cfif InUsersIDList NEQ "">
					AND u.UsersID IN (#trim(InUsersIDList)#)
				</cfif>	
				<cfif NOT ActiveInactive>
					<cfif Active>
						AND u.Active = 1
					</cfif>
					<cfif InActive>
						AND u.Active = 0
					</cfif>
				</cfif>
			</cfquery>
			<!---<cfquery name="getClientsEntities" datasource="#trim(request.datasource)#">
				SELECT <cfif distinct>DISTINCT</cfif> e.EntityID, CONCAT(e.FName, ' ', e.LName) AS Fullname, u.UsersID, u.active
				FROM Entity e LEFT JOIN pa_master.Users u ON e.EntityID = u.EntityID
				<cfif haveRoleList NEQ "">
					LEFT JOIN UsersRole ur ON u.UsersID = ur.UsersID
				</cfif>
				WHERE e.EntityID IN (SELECT EntityID FROM Entity WHERE ClientID = #trim(clientID)#) AND ObjectTypeID = 2
				<cfif haveRoleList NEQ "">
					AND ur.RoleID IN(#trim(haveRoleList)#) 
				</cfif>
				<cfif NotInUsersIDList NEQ "">
					AND u.UsersID NOT IN (#trim(NotInUsersIDList)#)
				</cfif>
				<cfif InUsersIDList NEQ "">
					AND u.UsersID IN (#trim(InUsersIDList)#)
				</cfif>	
				<cfif NOT ActiveInactive>
					<cfif Active>
						AND u.Active = 1
					</cfif>
					<cfif InActive>
						AND u.Active = 0
					</cfif>
				</cfif>
			</cfquery>--->	
			
			<cfreturn getClientsEntities>
			
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>
		
		
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the Client default address.                --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getClientDefaultAddress">		
		
		<cfargument name="ClientID" required="yes" type="numeric">
													
		<cftry>			
			
			<cfquery name="getEntityID" datasource="PA_Master">
				SELECT EntityID 
				FROM Client	
				WHERE ClientID = #trim(ClientID)#				
			</cfquery>
			
			<cfset tempEntity = Createobject("component", "com.common.Entity")>
						
			<cfset getDefaultAddress = tempEntity.getEntityDefaultFullAddress(clientID: trim(ClientID), entityID: trim(getEntityID.EntityID))>
									
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
	<!--- This function will be called to reassign a claim.                              --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="delClient">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="code" required="yes">
		
		<!--- Working Call
		<cfset request.tempClient = CreateObject("component","com.common.Client")>
		<cfset temp = request.tempClient.delClient(clientID: 1086, code: trim(request.datasource))>
		--->
		
		<cfif code NEQ request.datasource>
			<cfthrow message="There was an issue using this method.">
		</cfif>
		
		<cftry>
					
			<cftransaction>

				<cfquery name="delNote" datasource="#trim(request.datasource)#">
					DELETE FROM Note WHERE clientID = #trim(ClientID)#
				</cfquery>
				
				<cfquery name="delFileProcess" datasource="#trim(request.datasource)#">
					DELETE FROM FileProcess WHERE FileID IN( SELECT FileID FROM File WHERE clientID = #trim(ClientID)# )
				</cfquery>
				
				<cfquery name="delFile" datasource="#trim(request.datasource)#">
					DELETE FROM File WHERE clientID = #trim(ClientID)#
				</cfquery>
				
				<cfquery name="delInterchange" datasource="#trim(request.datasource)#">
					DELETE FROM Interchange WHERE clientID = #trim(ClientID)#
				</cfquery>
				
				<cfquery name="delProcedureOpenClose" datasource="#trim(request.datasource)#">
					DELETE FROM ProcedureOpenClose WHERE ProcedureID IN( SELECT ProcedureID FROM [Procedure] WHERE ClaimID IN ( SELECT ClaimID FROM Claim WHERE clientID = #trim(ClientID)# ) )
				</cfquery>
				
				<cfquery name="delProcedureEOPScode" datasource="#trim(request.datasource)#">
					DELETE FROM ProcedureEOPScode WHERE ProcedureID IN( SELECT ProcedureID FROM [Procedure] WHERE ClaimID IN ( SELECT ClaimID FROM Claim WHERE clientID = #trim(ClientID)# ) )
				</cfquery>
				
				<cfquery name="delProcedureEOBcode" datasource="#trim(request.datasource)#">
					DELETE FROM ProcedureEOBcode WHERE ProcedureID IN( SELECT ProcedureID FROM [Procedure] WHERE ClaimID IN ( SELECT ClaimID FROM Claim WHERE clientID = #trim(ClientID)# ) )
				</cfquery>
				
				<cfquery name="delProcedure" datasource="#trim(request.datasource)#">
					DELETE FROM [Procedure] WHERE ClaimID IN ( SELECT ClaimID FROM Claim WHERE clientID = #trim(ClientID)# )
				</cfquery>
				
				<cfquery name="delClaimAssignment" datasource="#trim(request.datasource)#">
					DELETE FROM ClaimAssignment WHERE ClaimID IN( SELECT ClaimID FROM Claim WHERE clientID = #trim(ClientID)# )
				</cfquery>
				
				<cfquery name="delClaim" datasource="#trim(request.datasource)#">
					DELETE FROM Claim WHERE ClientID = #trim(ClientID)#
				</cfquery>
				
				<cfquery name="delEntityRS" datasource="#trim(request.datasource)#">
					DELETE FROM EntityRS
					WHERE EntityID IN(Select EntityID FROM Entity WHERE ClientID = #trim(ClientID)#)
				</cfquery>
				
				<cfquery name="delEntitySS" datasource="#trim(request.datasource)#">
					DELETE FROM EntitySS
					WHERE EntityID IN(Select EntityID FROM Entity WHERE ClientID = #trim(ClientID)#)
				</cfquery>
				
				<cfquery name="delEntityTS" datasource="#trim(request.datasource)#">
					DELETE FROM EntityTS
					WHERE EntityID IN(Select EntityID FROM Entity WHERE ClientID = #trim(ClientID)#)
				</cfquery>
				
				<cfquery name="delEntityAddress" datasource="#trim(request.datasource)#">
					DELETE FROM EntityAddress
					WHERE EntityID IN(Select EntityID FROM Entity WHERE ClientID = #trim(ClientID)#)
				</cfquery>
				
				<cfquery name="delAddress" datasource="#trim(request.datasource)#">
					Delete FROM Address
					WHERE AddressID IN(	Select AddressID FROM EntityAddress WHERE EntityID IN( Select EntityID FROM Entity WHERE ClientID = #trim(ClientID)# ) )
				</cfquery>
				
				<cfquery name="delEntityPhone" datasource="#trim(request.datasource)#">
					DELETE FROM EntityPhone
					WHERE EntityID IN(Select EntityID FROM Entity WHERE ClientID = #trim(ClientID)#)
				</cfquery>
				
				<cfquery name="delPhone" datasource="#trim(request.datasource)#">
					Delete FROM Phone 
					WHERE PhoneID IN( Select PhoneID FROM EntityPhone WHERE EntityID IN( Select EntityID FROM Entity WHERE ClientID = #trim(ClientID)# ) )
				</cfquery>
				
				<cfquery name="delEmailAddress" datasource="#trim(request.datasource)#">
					DELETE FROM EmailAddress
					WHERE EntityID IN(Select EntityID FROM Entity WHERE ClientID = #trim(ClientID)#)
				</cfquery>
				
				<cfquery name="delReminder" datasource="#trim(request.datasource)#">
					DELETE FROM Reminder
					WHERE UsersID IN(Select UsersID FROM Entity WHERE ClientID = #trim(ClientID)#)
				</cfquery>
				
				<cfquery name="delPatient" datasource="#trim(request.datasource)#">
					DELETE FROM Patient
					WHERE EntityID IN(Select EntityID FROM Entity WHERE ClientID = #trim(ClientID)#)
				</cfquery>
				
				<cfquery name="delUsersWorkGroup" datasource="#trim(request.datasource)#">
					DELETE FROM UsersWorkGroup
					WHERE UsersID IN(SELECT UsersID FROM pa_master.Users WHERE EntityID IN(Select EntityID FROM Entity WHERE ClientID = #trim(ClientID)#))
				</cfquery>
				
				<cfquery name="delUsersSession" datasource="#trim(request.datasource)#">
					DELETE FROM UsersSession
					WHERE UsersID IN(SELECT UsersID FROM pa_master.Users WHERE EntityID IN(Select EntityID FROM Entity WHERE ClientID = #trim(ClientID)#))
				</cfquery>
				
				<cfquery name="delUsersRole" datasource="#trim(request.datasource)#">
					DELETE FROM UsersRole
					WHERE UsersID IN(SELECT UsersID FROM pa_master.Users WHERE EntityID IN(Select EntityID FROM Entity WHERE ClientID = #trim(ClientID)#))
				</cfquery>
				
				<cfquery name="delUsers" datasource="#trim(request.datasource)#">
					DELETE FROM pa_master.Users
					WHERE ClientID = #trim(ClientID)#
				</cfquery>
				
				<cfquery name="delEntity" datasource="#trim(request.datasource)#">
					DELETE FROM Entity
					WHERE EntityID = (SELECT EntityID FROM pa_master.Client WHERE ClientID = #trim(ClientID)#) OR ClientID = #trim(ClientID)#
				</cfquery>
				
				<cfquery name="delClient" datasource="#trim(request.datasource)#">
					DELETE FROM pa_master.Client WHERE ClientID = #trim(ClientID)#
				</cfquery>
				
				
			</cftransaction>
		
		
		
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>	
	
	
	
	
	<cffunction name="getClientSupportEmailAddressID" retruntype="numeric" output="no">
		
		<cfargument name="clientID" type="numeric" hint="Client ID" required="true">
				
		<cftry>
			
			<cfquery name="getEmail" datasource="PA_Master">
				SELECT SupportEmailID
				FROM Client  
				WHERE ClientID = #trim(ClientID)#
			</cfquery>
									
			<cfif IsDefined("getEmail.SupportEmailID") AND IsNumeric(getEmail.SupportEmailID)>				
				<cfreturn trim(getEmail.SupportEmailID)>								
			<cfelse>				
				<cfreturn 0>				
			</cfif>
			
		
			<cfcatch type="Any">
				
				<cf_gcGeneralErrorTemplate
					message="#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
	
	
	
	<cffunction name="getClientSupportEmailAddress" retruntype="string" output="no">
		
		<cfargument name="clientID" type="numeric" hint="Client ID" required="true">
				
		<cftry>
			
			<cfquery name="getEmail" datasource="PA_Master">
				SELECT SupportEmailID
				FROM Client  
				WHERE ClientID = #trim(ClientID)#
			</cfquery>
									
			<cfif IsDefined("getEmail.SupportEmailID") AND IsNumeric(getEmail.SupportEmailID)>
				
				<cfquery name="getEmailAddress" datasource="PAClient_#trim(ClientID)#">
					SELECT Email
					FROM EmailAddress  
					WHERE emailAddressID = #trim(getEmail.SupportEmailID)#
				</cfquery>	
				
				<cfset emailD = application.beanFactory.getBean('globalFooter').GlobalFooterD(trim(getEmailAddress.email)) />
																
				<cfreturn emailD>
				
			<cfelse>
				
				<cfreturn 0>	
			
			</cfif>
			
		
			<cfcatch type="Any">
				
				<cf_gcGeneralErrorTemplate
					message="#cfcatch.detail#">
					
			</cfcatch>
			
		</cftry>
		
	</cffunction> 
	
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the Client Settings XML.                   --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getClientSettingXML">		
		
		<cfargument name="ClientID" required="yes" type="numeric">
													
		<cftry>			
			
			<cfquery name="getXML" datasource="PA_Master">
				SELECT SettingsXML
				FROM Client	
				WHERE ClientID = #trim(ClientID)#				
			</cfquery>
			
								
			<cfreturn getXML.SettingsXML>						
					
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>
		
	</cffunction>
	
		
		
		
</cfcomponent>

	
