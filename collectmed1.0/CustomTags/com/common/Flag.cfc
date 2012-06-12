<!-------------------------------------------------------------------------------------------------------->
<!--- FLAG STATUSES                                                                                    --->
<!--- 168      Created   The flag is initially created.                                                --->
<!--- 169      Opened   The Flag has been looked at by assigned user.                                  --->
<!--- 170      Commented   The flag has been looked at and has been commented by the assigned user.    --->
<!--- 171      Re-Assigned   The flag has been sent to another user for processing.                    --->
<!--- 172      On-Hold   The flag has been suspended.                                                  --->
<!--- 173      Re-Opened   The flag has been re-opened by someone                                      --->
<!--- 174      Closed   The flag has been closed by the assigned user.                                 --->
<!--- 175      Archive   The flag has been marked for archive into the history system.                 --->
<!-------------------------------------------------------------------------------------------------------->



<cfcomponent name="Flag" extends="com.common.db.FlagIO">	


	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to reassign a flag.                               --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="assignFlag" hint="Assign the flag">		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="assignorID" required="yes" type="numeric">
		<cfargument name="usersID" required="yes" type="numeric">
		<cfargument name="flagID" required="yes" type="numeric">
		<cfargument name="note" required="no" default="">
		
		<cfquery name="getFlagClientID" datasource="#trim(request.datasource)#">
			SELECT ClientID 
			FROM Flag  
			WHERE FlagID = #trim(FlagID)#
		</cfquery>
		
		
		<cfif getFlagClientID.Recordcount EQ 1 AND getFlagClientID.ClientID EQ clientID> 
		
			<cfquery name="insertAssignment" datasource="#trim(request.datasource)#">
				INSERT INTO FlagAssignment  (FlagID, UsersID, AssignorID, Note)
				VALUES(#trim(FlagID)#, #trim(UsersID)#, #trim(assignorID)#, '#trim(Note)#')				
			</cfquery>		
			
			<cfset UpdateFlagAssignedToUserID(FlagID: FlagID)>
						
		</cfif>
		
												
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to update the assigned to id of a Flag.          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="UpdateFlagAssignedToUserID" hint="This function will be called to update the assigned to id of a Flag.">		
		
		<cfargument name="FlagID" required="yes" type="numeric">
		
		<cfstoredproc procedure="sp_UpdateFlagAssignedToUsersID" datasource="#trim(request.datasource)#">
			<cfprocparam type="IN" cfsqltype="CF_SQL_INTEGER" value="#trim(FlagID)#" dbvarname="@FlagID">			
		</cfstoredproc>	
									
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the FlagID.                                --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="updateFlagStatus" hint="Change the status of the flag in the database table.">		
				
		<cfargument name="flagID" required="yes" type="numeric">
		<cfargument name="statusID" required="yes" type="numeric">
		<cfargument name="usersID" required="yes" type="numeric">		
		<cfargument name="note" required="no" default="">
				
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Flag parameters form the Database.                                     --->
		<!-------------------------------------------------------------------------------------->	
		<cfquery name="getFlag" datasource="#trim(request.datasource)#">
			INSERT INTO FlagStatus(FlagID, StatusID, UsersID, Note)
			VALUES(#trim(flagID)#, #trim(Arguments.statusID)#, #trim(Arguments.usersID)#, '#trim(Arguments.note)#')		
		</cfquery>
		
		<cfset UpdateFlagStatusID(FlagID: FlagID)>
																		
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to update the status id of a Flag.  Called by     --->
	<!--- function updateFlagStatus.                                                     --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="UpdateFlagStatusID" hint="This function will be called to update the status id of a Flag.">		
		
		<cfargument name="FlagID" required="yes" type="numeric">
		
		<cfstoredproc procedure="sp_UpdateFlagStatus" datasource="#trim(request.datasource)#">
			<cfprocparam type="IN" cfsqltype="CF_SQL_INTEGER" value="#trim(FlagID)#" dbvarname="@FlagID">			
		</cfstoredproc>	
									
	</cffunction>
	
	
		
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the Flag parameters.                       --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getFlagDB" returntype="query" hint="get the flags parameters from database.">		
		
		<cfargument name="flagID" required="yes" type="numeric">
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Flag parameters form the Database.                                     --->
		<!-------------------------------------------------------------------------------------->	
		<cfset getFlagQuery = this.getFlagQuery(fields: 'FlagID, ClientID, ObjectID, InstanceID, Note, Active, DateCreated', FlagID: trim(FlagID))>
					
		<!-------------------------------------------------------------------------------------->
		<!--- return the flag query.                                                         --->
		<!-------------------------------------------------------------------------------------->				
		<cfreturn getFlagQuery>		
														
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the Flag parameters.                       --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="addFlagEntry" hint="Add an entry to a flag.">		
		
		<cfargument name="flagID" required="yes" type="numeric">
		<cfargument name="userID" required="yes" type="numeric">
		<cfargument name="userFName" required="yes" type="string">
		<cfargument name="userLName" required="yes" type="string">
		<cfargument name="flagEntry" required="yes" type="string">	
				
		<cfset getFlag = getFlagXML(flagID)>
	
		<cfif getFlag EQ "">
			<cfscript>
				getFlag = XmlNew();
				getFlag.xmlRoot = XmlElemNew(getFlag,"flag");
			</cfscript>
		</cfif>
		
				
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Flag parameters form the Database.                                     --->
		<!-------------------------------------------------------------------------------------->	
		<cfscript>				
			addFlag = XmlElemNew(getFlag, "entry");	  
		  	addFlag["UserID"] = XmlElemNew(getFlag, "UserID");
		  	addFlag["UserID"].xmlText = "#trim(userID)#";
		  	addFlag["UserFName"] = XmlElemNew(getFlag, "UserFName");
		  	addFlag["UserFName"].xmlText = "#trim(userFName)#";
		  	addFlag["UserLName"] = XmlElemNew(getFlag, "UserLName");
		  	addFlag["UserLName"].xmlText = "#trim(userLName)#";
		  	addFlag["EntryDate"] = XmlElemNew(getFlag, "EntryDate");
		  	addFlag["EntryDate"].xmlText = "#DateFormat(NOW(), 'mm/dd/yyyy')#";
		  	addFlag["EntryTime"] = XmlElemNew(getFlag, "EntryTime");
		  	addFlag["EntryTime"].xmlText = "#TimeFormat(NOW(), 'hh:mm:ss tt')#"; 	  
		  	addFlag["EntryFlag"] = XmlElemNew(getFlag, "EntryFlag");
		  	addFlag["EntryFlag"].xmlText = "#trim(flagEntry)#"; 			  	
			ArrayAppend(getFlag["Flag"].xmlChildren, addFlag);		   
		</cfscript>
			
		<cfquery name="updateFlag" datasource="#trim(request.datasource)#">
			UPDATE FLAG SET Note = '#trim(getFlag)#'
			WHERE flagID = #trim(FlagID)#
		</cfquery>	
														
	</cffunction>	
	
		 
		 
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called toget the Flag in XML Format.                     --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getFlagXML" hint="Get the flags of this flagId in an CF XML object">		
		
		<cfargument name="flagID" required="yes" type="numeric">
				
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Flag query.                                                            --->
		<!-------------------------------------------------------------------------------------->	
		<cfset getFlagXML = getFlagDB(flagID)>
			
		<!-------------------------------------------------------------------------------------->
		<!--- Create the full XML Node from the XML in Database.                             --->
		<!-------------------------------------------------------------------------------------->	
		<cfif getFlagXML.Note EQ "">
			<cfset flagXML = "">
		<cfelse>	
			<cfset flagXML = XMLParse(getFlagXML.Note)>		
		</cfif>
		
		<cfreturn flagXML>		
														
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the FlagID.                                --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getFlagID" hint="get the flags DBID database table.">		
		
		<cfargument name="objectID" required="yes" type="numeric">
		<cfargument name="instanceID" required="yes" type="numeric">
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Flag parameters form the Database.                                     --->
		<!-------------------------------------------------------------------------------------->	
		<cfquery name="getFlag" datasource="#trim(request.datasource)#">
			SELECT FlagID
			FROM Flag  
			WHERE objectID = #trim(objectID)# AND instanceID = #trim(instanceID)#		
		</cfquery>
			
		<!-------------------------------------------------------------------------------------->
		<!--- return the flag query.                                                         --->
		<!-------------------------------------------------------------------------------------->				
		<cfreturn getFlag.FlagID>		
														
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the FlagID.                                --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="flagHasBeenViewed" hint="get the flags DBID database table.">		
		
		<cfargument name="usersID" required="yes" type="numeric">		
		<cfargument name="flagID" required="yes" type="numeric">		
		<cfparam name="hasBeenViewed" default="0">		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Flag parameters form the Database.                                     --->
		<!-------------------------------------------------------------------------------------->	
		<cfquery name="getFlag" datasource="#trim(request.datasource)#">
			SELECT StatusID	
			FROM FlagStatus
			WHERE FlagID = #trim(flagID)# AND usersID = #trim(usersID)#		
		</cfquery>
		
		<cfif getFlag.RecordCount GTE 1 AND ListFind(ValueList(getFlag.StatusID), 169)>
			<cfset hasBeenViewed = 1>
		</cfif>
			
		<!-------------------------------------------------------------------------------------->
		<!--- return the flag query.                                                         --->
		<!-------------------------------------------------------------------------------------->				
		<cfreturn trim(hasBeenViewed)>		
														
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the Flag Statuses.                         --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="flagStatuses" hint="Get the flags statuses in the database table.">		
					
		<cfargument name="flagID" required="yes" type="numeric">		
		<cfparam name="orderby" default="DESC">		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Get the Flag parameters form the Database.                                     --->
		<!-------------------------------------------------------------------------------------->	
		<cfquery name="getFlagStatus" datasource="#trim(request.datasource)#">
			SELECT  sli.ItemNameDisplay, CONCAT(vuap.FName, ' ', vuap.LName) AS Fullname, fs.note, fs.dateCreated
			FROM FlagStatus fs JOIN view_useraccountparameters vuap ON fs.UsersID = vuap.UsersID
			LEFT JOIN pa_master.standardlistitem sli ON fs.statusID = sli.StandardListItemID
			WHERE fs.flagID = #trim(flagID)#
			ORDER BY  fs.DateCreated #trim(orderby)#	
		</cfquery>		
					
		<!-------------------------------------------------------------------------------------->
		<!--- return the flag statuses query.                                                --->
		<!-------------------------------------------------------------------------------------->				
		<cfreturn getFlagStatus>		
														
	</cffunction>
	
	
	
	
</cfcomponent>

	