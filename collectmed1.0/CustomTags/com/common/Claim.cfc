<!-------------------------------------------------------------------------------------->
<!--- CLAIM STATUSES                                                                 --->
<!--- 193      Created                                                               --->
<!--- 194      Assigned                                                              --->
<!--- 195      Re-Assigned                                                           --->
<!--- 196      Opened                                                                --->
<!--- 197      Re-Opened                                                             --->
<!--- 198      Working                                                               --->
<!--- 199      Completed                                                             --->
<!--- 200      Escalated                                                             --->
<!--- 201      Closed                                                                --->
<!--- 202      Archive                                                               --->
<!-------------------------------------------------------------------------------------->	


<cfcomponent name="Claim" extends="com.common.db.ClaimIO">		
	
	 
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to reassign a claim.                              --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="assignClaim" hint="assign a claim">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="assignorID" required="yes" type="numeric">
		<cfargument name="usersID" required="yes" type="numeric">
		<cfargument name="claimID" required="yes" type="numeric">
		<cfargument name="note" required="no" default="">
		
		<cfquery name="getClaimClientID" datasource="#trim(request.datasource)#">
			SELECT ClientID, statusID 
			FROM claim 
			WHERE ClaimID = #trim(ClaimID)#
		</cfquery>
		
		<!-------------------------------------------------------------------------------------->
		<!--- If the statusID is NULL it has never been assigned.                            --->
		<!-------------------------------------------------------------------------------------->		
		<cfif NOT IsNumeric(getClaimClientID.statusID)>
			<cfquery name="updateClaim" datasource="#trim(request.datasource)#">
				UPDATE claim 
				SET statusID = 194
				WHERE ClaimID = #trim(ClaimID)#
			</cfquery>			
		</cfif>
		
		
		<cfif getClaimClientID.Recordcount EQ 1 AND getClaimClientID.ClientID EQ clientID> 
		
			<cfquery name="insertAssignment" datasource="#trim(request.datasource)#">
				INSERT INTO claimassignment  (ClaimID, UserID, AssignorID, Note)
				VALUES(#trim(ClaimID)#, #trim(UsersID)#, #trim(assignorID)#, '#trim(Note)#')				
			</cfquery>		
			
			<cfset UpdateClaimAssignedToUserID(claimID: claimID)>
						
		</cfif>		
												
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to update the assigned to id of a claim.          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="UpdateClaimAssignedToUserID" hint="This function will be called to update the assigned to id of a claim.">		
		<cfargument name="claimID" required="yes" type="numeric">
		
		<cfquery name="getClaimAssignedToUsersID" datasource="#trim(request.datasource)#">
			SELECT UserID
			FROM claimassignment 
			WHERE claimID = #arguments.claimID# 
			ORDER BY DateCreated DESC
			LIMIT 1
		</cfquery>
		
		<cfquery name="UpdateClaimAssignedToUsersID" datasource="#trim(request.datasource)#">	
			UPDATE claim 
			SET AssignedToUserID = #getClaimAssignedToUsersID.UserID#
			WHERE ClaimID = #arguments.claimID#
		</cfquery>
									
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This tag will be called to get a query of the claims procedures and decide if  --->
	<!--- this claim is eligible for closure.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="eligibleForClosure" hint="This tag will be called to get a query of the claims procedures and decide if this claim is eligible for closure.">
	
		<cfargument name="claimID" required="yes" type="numeric">
		
		<cfset eligible = 1>
		
		<cfset tempQ = getClaimProcduresOpenClose(claimID)>
		
		<cfloop query="tempQ">
			<cfif OpenClose EQ 0>
				<cfset eligible = 0>
				<cfbreak>
			</cfif>
		</cfloop>
					
		<cfreturn eligible>				
		
	</cffunction>
	
		
	<!-------------------------------------------------------------------------------------->
	<!--- This tag will be called to get a query of the claims procedures and whether    --->
	<!--- they are closed or open in s string format.                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimProcduresOpenCloseString" hint="This tag will be called to get a query of the claims procedures and whether they are closed or open in s string format.">
	
		<cfargument name="claimID" required="yes" type="numeric">
		
		<cfset closed = 0>
		
		<cfset tempQ = getClaimProcduresOpenClose(claimID)>
		
		<cfloop query="tempQ">
			<cfif OpenClose GT 0>
				<cfset closed = closed + 1>
			</cfif>
		</cfloop>
		
		<cfset retString = closed & "/" & tempQ.Recordcount>				 
		
		<cfreturn retString>				
		
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This tag will be called to get a query of the claims procedures and whether    --->
	<!--- they are closed or open.                                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClaimProcduresOpenClose" hint="">
	
		<cfargument name="claimID" required="yes" type="numeric">
		
		<cfquery name="getProcOpenClose" datasource="#request.datasource#">
			SELECT cp.ProcedureID, cp.ProcedureCode, IFNULL(poc.ProcedureOpenCloseID, 0) AS OpenClose				
			FROM [Procedure] cp
			LEFT JOIN ProcedureOpenClose poc ON cp.ProcedureID = poc.procedureID
			WHERE cp.ClaimID = #trim(claimID)#
		</cfquery>
		
		<cfreturn getProcOpenClose>
	
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the ClaimID.                               --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="updateClaimStatus" hint="Change the status of the Claim in the database table.">		
				
		<cfargument name="ClaimID" required="yes" type="numeric">
		<cfargument name="statusID" required="yes" type="numeric">
		<cfargument name="usersID" required="yes" type="numeric">		
		<cfargument name="note" required="no" default="">
					
								
		<!-------------------------------------------------------------------------------------->
		<!--- Automatically set the note if not sent in based on the id.                     --->
		<!-------------------------------------------------------------------------------------->			
		<cfif Len(note) LTE 0>
			<cfswitch expression="#trim(statusID)#">
				<cfcase value="193"><cfset note = "System Note: Initial Claim Creation."></cfcase>
				<cfcase value="194"><cfset note = "System Note: Claim has been assigned."></cfcase>
				<cfcase value="195"><cfset note = "System Note: Claim has been assigned."></cfcase>
				<cfcase value="196"><cfset note = "System Note: User Viewed Claim."></cfcase>
				<cfcase value="197"><cfset note = "System Note: Claim has been re-opened."></cfcase>
				<cfcase value="198"><cfset note = "System Note: Claim is being worked on."></cfcase>
				<cfcase value="199"><cfset note = "System Note: Marked as Completed."></cfcase>
				<cfcase value="200"><cfset note = "System Note: Claim Escalated"></cfcase>
				<cfcase value="201"><cfset note = "System Note: Claim Closed"></cfcase>
				<cfcase value="202"><cfset note = "System Note: Ready for Archive"></cfcase>			
			</cfswitch>
		</cfif>
				
				
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Claim parameters form the Database.                                    --->
		<!-------------------------------------------------------------------------------------->	
		<cfset temp = CreateObject("component", "com.common.db.ClaimStatusIO")>
		<cfset temp.new(ClaimID: trim(ClaimID), StatusID: trim(Arguments.statusID), UsersID: trim(Arguments.usersID), Note: trim(Arguments.note))>
		<cfset temp.commit()>
		
		<cfset UpdateClaimStatusID(ClaimID: ClaimID)>
																		
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to update the status id of a Claim.  Called by    --->
	<!--- function updateClaimStatus.                                                    --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="UpdateClaimStatusID" hint="This function will be called to update the status id of a Claim.">		
		<cfargument name="ClaimID" required="yes" type="numeric">
		
		<cfquery name="getStatusID" datasource="#trim(request.datasource)#">	
			SELECT statusID
			FROM claimstatus
			WHERE ClaimID = #arguments.ClaimID# 
			ORDER BY DateCreated DESC
			LIMIT 1
		</cfquery>
		
		<cfquery name="UpdateClaim" datasource="#trim(request.datasource)#">		 
			UPDATE claim
			SET statusID = #getStatusID.statusID#
			WHERE ClaimID = #arguments.ClaimID#
		</cfquery>	
									
	</cffunction>

	
		
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the ClaimID.                               --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="ClaimHasBeenViewed" hint="Get the Claims DBID database table.">		
		
		<cfargument name="usersID" required="yes" type="numeric">		
		<cfargument name="ClaimID" required="yes" type="numeric">		
		<cfargument name="hasBeenViewed" default="0">		
		<cfparam name="newList" default="">
				
		<cfquery name="getClaim" datasource="#trim(request.datasource)#">
			SELECT StatusID	
			FROM claimstatus
			WHERE ClaimID = #trim(ClaimID)# AND usersID = #trim(usersID)#		
			Order by DateCreated DESC
		</cfquery>
												
		<cfif getClaim.RecordCount GTE 1>										
		
			<cfset statusList = ValueList(getClaim.StatusID)>
			
			<cfif ListContains(statusList, "195")>
				<cfloop list="#trim(statusList)#" index="i">
					<cfset newList = ListAppend(newList, i)>
					<cfif i EQ 195>
						<cfbreak>
					</cfif>
				</cfloop>
			<cfelseif ListContains(statusList, "196")>
				<cfset hasBeenViewed = 1>	
			</cfif>
			
			<cfif ListLen(newList) GTE 1 AND ListContains(newList, "196")>
				<cfset hasBeenViewed = 1>
			</cfif>
					
		</cfif>
					
		<cfreturn trim(hasBeenViewed)>		
														
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the Claim Statuses.                        --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="ClaimStatuses" hint="Get the Claims statuses in the database table.">		
					
		<cfargument name="ClaimID" required="yes" type="numeric">		
		<cfparam name="orderby" default="DESC">		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Claim parameters form the Database.                                    --->
		<!-------------------------------------------------------------------------------------->	
		<cfquery name="getClaimStatus" datasource="#trim(request.datasource)#">
			SELECT  sli.ItemNameDisplay, CONCAT(vuap.FName, ' ', vuap.LName) AS Fullname, fs.note, fs.dateCreated
			FROM claimstatus fs JOIN view_UserAccountParameters vuap ON fs.UsersID = vuap.UsersID
			LEFT JOIN pa_master.StandardListItem sli ON fs.statusID = sli.StandardListItemID
			WHERE fs.ClaimID = #trim(ClaimID)#
			ORDER BY  fs.DateCreated #trim(orderby)#	
		</cfquery>		
					
		<!-------------------------------------------------------------------------------------->
		<!--- return the Claim statuses query.                                               --->
		<!-------------------------------------------------------------------------------------->				
		<cfreturn getClaimStatus>		
														
	</cffunction>
	
		
</cfcomponent>

	


