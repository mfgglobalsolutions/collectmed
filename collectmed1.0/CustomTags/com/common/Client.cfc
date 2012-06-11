


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
				FROM entity e LEFT JOIN pa_master.users u ON e.EntityID = u.EntityID
				<cfif haveRoleList NEQ "">
					LEFT JOIN usersrole ur ON u.UsersID = ur.UsersID
					LEFT JOIN pa_master.usersrole mur ON u.UsersID = mur.UsersID
				</cfif>
				WHERE e.EntityID IN (SELECT EntityID FROM entity WHERE ClientID = #trim(clientID)#) AND ObjectTypeID = 2
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
				FROM entity e LEFT JOIN pa_master.Users u ON e.EntityID = u.EntityID
				<cfif haveRoleList NEQ "">
					LEFT JOIN UsersRole ur ON u.UsersID = ur.UsersID
				</cfif>
				WHERE e.EntityID IN (SELECT EntityID FROM entity WHERE ClientID = #trim(clientID)#) AND ObjectTypeID = 2
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
			
			<cfquery name="getEntityID" datasource="pa_master">
				SELECT EntityID 
				FROM client	
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
					DELETE FROM note WHERE clientID = #trim(ClientID)#
				</cfquery>
				
				<cfquery name="delFileProcess" datasource="#trim(request.datasource)#">
					DELETE FROM fileprocess WHERE FileID IN( SELECT FileID FROM File WHERE clientID = #trim(ClientID)# )
				</cfquery>
				
				<cfquery name="delFile" datasource="#trim(request.datasource)#">
					DELETE FROM file WHERE clientID = #trim(ClientID)#
				</cfquery>
				
				<cfquery name="delInterchange" datasource="#trim(request.datasource)#">
					DELETE FROM interchange WHERE clientID = #trim(ClientID)#
				</cfquery>
				
				<cfquery name="delProcedureOpenClose" datasource="#trim(request.datasource)#">
					DELETE FROM procedureopenclose WHERE ProcedureID IN( SELECT procedureid FROM [Procedure] WHERE ClaimID IN ( SELECT ClaimID FROM claim WHERE clientID = #trim(ClientID)# ) )
				</cfquery>
				
				<cfquery name="delProcedureEOPScode" datasource="#trim(request.datasource)#">
					DELETE FROM procedureeopscode WHERE ProcedureID IN( SELECT procedureid FROM [Procedure] WHERE ClaimID IN ( SELECT ClaimID FROM claim WHERE clientID = #trim(ClientID)# ) )
				</cfquery>
				
				<cfquery name="delProcedureEOBcode" datasource="#trim(request.datasource)#">
					DELETE FROM procedureeobcode WHERE ProcedureID IN( SELECT procedureid FROM [Procedure] WHERE ClaimID IN ( SELECT ClaimID FROM claim WHERE clientID = #trim(ClientID)# ) )
				</cfquery>
				
				<cfquery name="delProcedure" datasource="#trim(request.datasource)#">
					DELETE FROM [procedure] WHERE ClaimID IN ( SELECT ClaimID FROM claim WHERE clientID = #trim(ClientID)# )
				</cfquery>
				
				<cfquery name="delClaimAssignment" datasource="#trim(request.datasource)#">
					DELETE FROM claimassignment WHERE ClaimID IN( SELECT ClaimID FROM claim WHERE clientID = #trim(ClientID)# )
				</cfquery>
				
				<cfquery name="delClaim" datasource="#trim(request.datasource)#">
					DELETE FROM claim WHERE ClientID = #trim(ClientID)#
				</cfquery>
				
				<cfquery name="delEntityRS" datasource="#trim(request.datasource)#">
					DELETE FROM entityrs
					WHERE EntityID IN(Select EntityID FROM entity WHERE ClientID = #trim(ClientID)#)
				</cfquery>
				
				<cfquery name="delEntitySS" datasource="#trim(request.datasource)#">
					DELETE FROM entityss
					WHERE EntityID IN(Select EntityID FROM entity WHERE ClientID = #trim(ClientID)#)
				</cfquery>
				
				<cfquery name="delEntityTS" datasource="#trim(request.datasource)#">
					DELETE FROM entityts
					WHERE EntityID IN(Select EntityID FROM entity WHERE ClientID = #trim(ClientID)#)
				</cfquery>
				
				<cfquery name="delEntityAddress" datasource="#trim(request.datasource)#">
					DELETE FROM entityaddress
					WHERE EntityID IN(Select EntityID FROM entity WHERE ClientID = #trim(ClientID)#)
				</cfquery>
				
				<cfquery name="delAddress" datasource="#trim(request.datasource)#">
					Delete FROM address
					WHERE AddressID IN(	Select AddressID FROM entityaddress WHERE EntityID IN( Select EntityID FROM entity WHERE ClientID = #trim(ClientID)# ) )
				</cfquery>
				
				<cfquery name="delEntityPhone" datasource="#trim(request.datasource)#">
					DELETE FROM entityphone
					WHERE EntityID IN(Select EntityID FROM entity WHERE ClientID = #trim(ClientID)#)
				</cfquery>
				
				<cfquery name="delPhone" datasource="#trim(request.datasource)#">
					Delete FROM phone 
					WHERE PhoneID IN( Select PhoneID FROM entityphone WHERE EntityID IN( Select EntityID FROM entity WHERE ClientID = #trim(ClientID)# ) )
				</cfquery>
				
				<cfquery name="delEmailAddress" datasource="#trim(request.datasource)#">
					DELETE FROM emailaddress
					WHERE EntityID IN(Select EntityID FROM entity WHERE ClientID = #trim(ClientID)#)
				</cfquery>
				
				<cfquery name="delReminder" datasource="#trim(request.datasource)#">
					DELETE FROM reminder
					WHERE UsersID IN(Select UsersID FROM entity WHERE ClientID = #trim(ClientID)#)
				</cfquery>
				
				<cfquery name="delPatient" datasource="#trim(request.datasource)#">
					DELETE FROM patient
					WHERE EntityID IN(Select EntityID FROM entity WHERE ClientID = #trim(ClientID)#)
				</cfquery>
				
				<cfquery name="delUsersWorkGroup" datasource="#trim(request.datasource)#">
					DELETE FROM usersworkgroup
					WHERE UsersID IN(SELECT UsersID FROM pa_master.users WHERE EntityID IN(Select EntityID FROM entity WHERE ClientID = #trim(ClientID)#))
				</cfquery>
				
				<cfquery name="delUsersSession" datasource="#trim(request.datasource)#">
					DELETE FROM userssession
					WHERE UsersID IN(SELECT UsersID FROM pa_master.users WHERE EntityID IN(Select EntityID FROM entity WHERE ClientID = #trim(ClientID)#))
				</cfquery>
				
				<cfquery name="delUsersRole" datasource="#trim(request.datasource)#">
					DELETE FROM usersrole
					WHERE UsersID IN(SELECT UsersID FROM pa_master.users WHERE EntityID IN(Select EntityID FROM entity WHERE ClientID = #trim(ClientID)#))
				</cfquery>
				
				<cfquery name="delUsers" datasource="#trim(request.datasource)#">
					DELETE FROM pa_master.users
					WHERE ClientID = #trim(ClientID)#
				</cfquery>
				
				<cfquery name="delEntity" datasource="#trim(request.datasource)#">
					DELETE FROM entity
					WHERE EntityID = (SELECT EntityID FROM pa_master.client WHERE ClientID = #trim(ClientID)#) OR ClientID = #trim(ClientID)#
				</cfquery>
				
				<cfquery name="delClient" datasource="#trim(request.datasource)#">
					DELETE FROM pa_master.client WHERE ClientID = #trim(ClientID)#
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
			
			<cfquery name="getEmail" datasource="pa_master">
				SELECT SupportEmailID
				FROM client  
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
			
			<cfquery name="getEmail" datasource="pa_master">
				SELECT SupportEmailID
				FROM client  
				WHERE ClientID = #trim(ClientID)#
			</cfquery>
									
			<cfif IsDefined("getEmail.SupportEmailID") AND IsNumeric(getEmail.SupportEmailID)>
				
				<cfquery name="getEmailAddress" datasource="PAClient_#trim(ClientID)#">
					SELECT Email
					FROM emailaddress  
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
			
			<cfquery name="getXML" datasource="pa_master">
				SELECT SettingsXML
				FROM client	
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

	

