


<cfcomponent name="User" extends="cmComponents.com.common.db.UsersIO">		
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Creat instance variables for each of the column names                          --->
	<!--- that will have a GET and SET method.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.instance.UsersSessionIdentification = "";		
		variables.instance.usersID = "";		
		variables.instance.RoleIDs = "";		
		variables.instance.CategoryIDs = "";		
		variables.instance.UserPages = "";		
		variables.instance.IPAddress = "";
		variables.instance.EmailAddress = "";	
		variables.instance.fName = "";
		variables.instance.lName = "";
		variables.instance.datasource = "";	
		
		variables.instance.PageIO = '';	 
		variables.instance.PageRoleIO = '';	 
	</cfscript>
	
	
	<cffunction name="init" return="any">
		<cfargument name="PageIO" type="any" required="true">
		<cfargument name="PageRoleIO" type="any" required="true">
		
		<cfset variables.instance.PageIO = arguments.PageIO>
		<cfset variables.instance.PageRoleIO = arguments.PageRoleIO>
		
		<cfreturn this>
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Get the users datasource.                                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="setDatasource">
		<cfset variables.instance.datasource = "PAClient_" & variables.instance.ClientID>			
	</cffunction>
	
	<cffunction name="getDatasource" access="public" output="No">
  		<cfset setDatasource()>		
		<cfreturn variables.instance.datasource>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Get the users first name.                                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="setFName">
		<cfargument name="EntityID" type="numeric" required="true">
		<cfset Entity = application.beanFactory.getBean('EntityIO')>
		<cfset Entity.initEntityIO(EntityID)>
		<cfset variables.instance.fName = Entity.getFName()>			
	</cffunction>
	
	<cffunction name="getFName" access="public" output="No">
  		<cfset setFName(getEntityID())>		
		<cfreturn variables.instance.fName>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Get the users first name.                                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="setLName">
		<cfargument name="EntityID" type="numeric" required="true">
		<cfset EntityLName = application.beanFactory.getBean('EntityIO')>
		<cfset EntityLName.initEntityIO(EntityID)>
		<cfset variables.instance.lName = EntityLName.getLName()>
	</cffunction>
	
	<cffunction name="getLName" access="public" output="No">		  		
		<cfset setLName(getEntityID())>
		<cfreturn variables.instance.LName>
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- Get the users full name.                                                       --->
	<!-------------------------------------------------------------------------------------->			
	<cffunction name="getFullName" access="public" output="No">
  		<cfset setFName(getEntityID())>
		<cfset setLName(getEntityID())>
		<cfreturn variables.instance.fName & " " & variables.instance.lName>
	</cffunction>
	
	
	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for EmailAddress.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="setEmailAddress">
		<cfargument name="EmailAddressID" type="numeric" required="true">
		<!--- <cfset EmailAddress = CreateObject("component", "com.common.db.EmailAddressIO")> --->
		<cfset EmailAddress = application.beanFactory.getBean('EmailAddressIO')>
		<cfset EmailAddress.initEmailAddressIO(EmailAddressID)>
	</cffunction>
	
	<cffunction name="getEmailAddress" access="public" output="No">
  		<cfreturn variables.instance.EmailAddress>
	</cffunction>
	
		
	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for UsersSessionIdentification.                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUsersSessionIdentification" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.UsersSessionIdentification>
	</cffunction>
	 
	<cffunction name="setUsersSessionIdentification" access="public" returntype="boolean" output="No">
 		
		<cfargument name="UsersSessionIdentification" required="Yes" type="String">
				
 		<cfset variables.instance.UsersSessionIdentification = arguments.UsersSessionIdentification>			
		<cfreturn true>
		
	</cffunction>
	
	
	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for RoleIDs.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getRoleIDs" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.RoleIDs>
	</cffunction>
	 
	<cffunction name="setRoleIDs" access="public" returntype="boolean" output="No">
 		
		<cfargument name="RoleIDs" required="Yes" type="String">
				
 		<cfset variables.instance.RoleIDs = arguments.RoleIDs>			
		<cfreturn true>
		
	</cffunction>
	
	
	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for CategoryIDs.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getCategoryIDs" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.CategoryIDs>
	</cffunction>
	 
	<cffunction name="setCategoryIDs" access="public" returntype="boolean" output="No">
 		
		<cfargument name="CategoryIDs" required="Yes" type="String">
				
 		<cfset variables.instance.CategoryIDs = arguments.CategoryIDs>			
		<cfreturn true>
		
	</cffunction>
	
	
	
	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for UserPages.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUserPages" access="public" returntype="query" output="No">
  		<cfreturn variables.instance.UserPages>
	</cffunction>
	 
	<cffunction name="setUserPages" access="public" returntype="boolean" output="No">
 		
		<cfargument name="UserPages" required="Yes" type="query">
				
 		<cfset variables.instance.UserPages = arguments.UserPages>			
		<cfreturn true>
		
	</cffunction>
	
	
	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for IPAddress.                                              --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getIPAddress" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.IPAddress>
	</cffunction>
	 
	<cffunction name="setIPAddress" access="public" returntype="boolean" output="No">
 		
		<cfargument name="IPAddress" required="Yes" type="String">
				
 		<cfset variables.instance.IPAddress = arguments.IPAddress>			
		<cfreturn true>
		
	</cffunction>
	
	
	
	<!------------------------------------------------------------------>
	<!--- PURPOSE:                                                   --->   
	<!--- When a page is created the page (ewPages) is associated    --->
	<!--- with a Category (ewPageCategories).                        --->
	<!---                                                            --->
	<!--- When a user (Users) is created they are associated to      --->
	<!--- a role or roles (Role).                                    --->
	<!---                                                            --->
	<!--- Basically when a page is created it gets associated to a   --->
	<!--- role and most of the time the role will be the public      --->
	<!--- role or if it is an admin page then the page is            --->
	<!--- associated to the administrator role.                      --->
	<!---                                                            --->
	<!--- NOTE: The CategoryID in the Page table has nothing to do   --->
	<!--- with the way that users access pages. Security on pages    --->
	<!--- depends on what roless the user belongs to and whether     --->
	<!--- or not the role has access to that page.                   --->
	<!---                                                            --->
	<!---                                                            --->
	<!------------------------------------------------------------------>	
	<cffunction name="SetUsersPagesAccess" output="no">
		
		<!------------------------------------------------------------------>
		<!--- Arguments needed for this method.                          --->
		<!------------------------------------------------------------------>	
		<cfargument name="usersID" required="true" type="numeric">
		<cfargument name="clientID" required="true" type="numeric">
		
		 
		<!--- <cfset setRoleIDs(getUserRoles(usersID: trim(arguments.usersID), clientID: trim(arguments.clientID)))> --->
				
		<cfset UserPageIDs = variables.instance.PageRoleIO.getPageRoleQuery(RoleID_IN: '#trim(getRoleIDs())#', Active: '1')>
			
		<cfif valuelist(UserPageIDs.PageID) EQ "">
			<cfset request.PageIDs = "5555555555">	
		<cfelse>	
			<cfset request.PageIDs = valuelist(UserPageIDs.PageID)>	
		</cfif>
		
		<!------------------------------------------------------------------>
		<!--- Set up the users pages that they are able to see.          --->
		<!------------------------------------------------------------------>			 
		<cfset setUserPages(variables.instance.PageIO.getPageQuery(fields: 'PageID,PageName', pageID_IN: '#trim(request.PageIDs)#', Active: '1'))>
			
			
		<!------------------------------------------------------------------>
		<!--- Depending on the users roles will determine what page      --->
		<!--- categories they will get to see on their member homepage.  --->
		<!--- For example if the user logged on has an administrator     --->
		<!--- role then they will see the Admin category.                --->
		<!------------------------------------------------------------------>		
		<cfset setCategoryIDs('1,3')>	
		
		<!--- If the user is an Admin add the admin category --->
		<cfif ListContains(getRoleIDs(), "1")>
			
			<cfset setCategoryIDs('#ListAppend(session.User.getCategoryIDs(),"2")#')>
		
		<!--- If the user is a member add the member category --->	
		<cfelseif ListContains(session.User.getRoleIDs(), "4")>
			
			<cfset setCategoryIDs('#ListAppend(session.User.getCategoryIDs(),"4")#')>
		
		</cfif>	
					
	</cffunction>	
	
	
	
	
	<!------------------------------------------------------------------>
	<!--- Create a random SID for the User to be logged in on.       --->
	<!--- This tag will create that SID for you.                     --->
	<!------------------------------------------------------------------>		
	<cffunction name="CreateUserSessionID" returntype="string" output="No" hint="Create a random SID for the User to be logged in on. This tag will create that SID for you.">

		<!------------------------------------------------------------------>
		<!--- Arguments needed for this method.                          --->
		<!------------------------------------------------------------------>	
		<cfargument name="usersID" required="true" type="numeric">
		<cfargument name="appendTokeyString" required="false" type="string" default="">
		<cfargument name="KeyString" required="false" type="string" default="">
		<cfargument name="RandomString" required="false" type="string" default="">
		<cfset AsciiList ="48,49,50,51,52,53,54,55,56,57,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122">
				
		<!------------------------------------------------------------------>
		<!--- This code will create a ramdom String that will be         --->
		<!--- attached to the sid string to make a unique string.        --->
		<!------------------------------------------------------------------>			
		<cfloop from="1" to="30" index="i">
			<cfset RandomNumber = RandRange(1,62)>			
			<cfset aNumber = ListGetAt(AsciiList, trim(RandomNumber))>			
			<cfset appendTokeyString = trim(appendTokeyString) & chr(aNumber)>				
		</cfloop>
		
		<cfset appendTokeyString = trim(appendTokeyString) & trim(usersID)>
			
		<cfif IsDefined("session.CFID")>
			<cfset appendTokeyString = trim(appendTokeyString) & trim(session.CFID)>
			<cfset FinalString = trim(appendTokeyString) & trim(session.CFTOKEN)>							
		<cfelse>
			<cfset FinalString = trim(appendTokeyString) & Replace(trim(CGI.REMOTE_ADDR), ".", "", "ALL")>
		</cfif>
		
		<cfreturn UCase(trim(FinalString))>		
					
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Any user in the system may contain multiple logins but only the current login  --->
	<!--- is valid. This function will be called to clear those prior sessions.          --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="invalidateUsersPriorSessions" hint="This function will be called to clear users prior sessions.">		
		
		<cfargument name="usersID" required="yes" type="numeric">
		
		<cfset var excludedID = "">
		
		<!--- 
		Select the users records where the mofied date is null because that means that the user just logged in but 
		never navigated in the site. this would be the latest record and that is the record their session is based on. 
		--->
		<cfquery name="getUsersSessionID" datasource="#trim(request.datasource)#">
			SELECT UsersSessionID 
			FROM userssession 
			WHERE usersID = #arguments.usersID# 
			AND DateModified IS NULL 
			ORDER BY DATECreated DESC
			LIMIT 1
		</cfquery>
		
		<!--- If a record was found it means that the users other records must be updated. --->
		<cfif getUsersSessionID.RecordCount GTE 1> 
		    <cfset excludedID = getUsersSessionID.UsersSessionID>		    
		<!--- If no records were found with a null DateModified then we must get the last record ID that was inserted. --->
		<cfelseif getUsersSessionID.RecordCount LT 1> 
			<cfquery name="setExcludedID" datasource="#trim(request.datasource)#">
				SELECT UsersSessionID 
				FROM userssession 
				WHERE usersID = #arguments.usersID#
				ORDER BY DATEMODIFIED DESC
				LIMIT 1
			</cfquery>	
			<cfset excludedID = setExcludedID.UsersSessionID>	
		</cfif>
		
		<cfquery name="updateUsersSessionID" datasource="#trim(request.datasource)#">
			UPDATE userssession
			SET Active = 0, InactiveCode = 68
			WHERE usersID = #arguments.usersID# 
			AND UsersSessionID != #excludedID#
		</cfquery>		
									
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to get the users prior session.                   --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getUserLastLogin" hint="Get the users last login">		
		
		<cfargument name="usersID" required="yes" type="numeric">

		<!--- 
		DECLARE @lastLogin datetime
		11/24/2005 9:40:53 AM
		Get the users last login before the current one. 
		--->
			<cfquery name="getLastLogin" datasource="#trim(request.datasource)#">
				SELECT DateCreated
				FROM userssession 
				WHERE UsersID = #arguments.usersID#
				AND DateCreated < (SELECT max(DateCreated) FROM userssession   WHERE UsersID = #arguments.usersID#)
				ORDER BY DateCreated DESC
				LIMIT 1 		
			</cfquery>

		<cfreturn getLastLogin.DateCreated> 
									
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Get the time stamp of the users last login modified time.                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="getUserCurrentLoginModifiedTime" hint="Get the time stamp of the users last login modified time.">		
		
		<cfargument name="usersID" required="yes" type="numeric">
		
		<cfquery name="getUsersLastRecord" datasource="#trim(request.datasource)#">
			SELECT DateCreated, DateModified, usersSessionID
			FROM userssession  
			WHERE UsersID = #trim(usersID)# 
			ORDER BY DateCreated DESC	
			LIMIT 1		
		</cfquery>
		
		<cfif getUsersLastRecord.recordCount EQ 1>
			<cfif IsDate(getUsersLastRecord.DateModified)>
				<cfreturn getUsersLastRecord.DateModified>
			<cfelse>
				<cfreturn getUsersLastRecord.DateCreated>
			</cfif>
		<cfelseif getUsersLastRecord.recordCount GTE 2>
			<cfreturn "There was an issues with the users session records (2)">
		<cfelseif getUsersLastRecord.recordCount LTE 0>
			<cfreturn "Session not found (0)">
		</cfif>	
													
	</cffunction>
	
	
		
	<!-------------------------------------------------------------------------------------->
	<!--- This function will be called to set the users last opened claim.               --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="setUsersLastOpenedClaimID" hint="Set the users last opened claim">		
		
		<cfargument name="usersID" required="yes" type="numeric">
		<cfargument name="claimID" required="yes" type="numeric">
		
		<cfquery name="setUsersLastRecord" datasource="pa_master">
			UPDATE users
			SET LastOpenedClaimID = #trim(claimID)#
			WHERE UsersID = #trim(usersID)#
		</cfquery>
													
	</cffunction>
	


	<!-------------------------------------------------------------------------------------->
	<!--- Get the roles that a user currently has.                                       --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUserRoles" returntype="string" output="No" hint="This function will return a list of the roles that this user is tied to.">
		
		<cfargument name="usersID" required="true" type="numeric">
		<cfargument name="clientID" required="yes" type="numeric">
				
		<cfquery name="qGetUserRoles" datasource="PAClient_#trim(clientID)#">	
			SELECT RoleID
			FROM pa_master.usersrole
			WHERE usersID = #trim(usersID)#
			UNION
			SELECT RoleID
			FROM usersrole
			WHERE usersID = #trim(usersID)#
		</cfquery>	
		
		<!------------------------------------------------------------------>
		<!--- Valuelist the users roles ID's                             --->
		<!------------------------------------------------------------------>				
		<cfif qGetUserRoles.RecordCount LTE 0>
			
			<cf_gcSendEmail
				to="gcruz@collectmed.net"
				from="autoreply@collectmed.net"
				subject="The user has not been associated to a role properly: #usersID#"
				message="This user is not associated to a role. please give immediate attention: #usersID#">
				
			<cf_gcGeneralErrorTemplate	
				title="User Account Issue."
				subtitle=""
				width="75%"
				message="<p><strong>There was an issue trying to retrieve your account.</strong> Please contact your site administrator.</p>">	
						
		</cfif>
				
		<cfset UsersRoleIDs = valuelist(qGetUserRoles.RoleID)>		
		
		<cfreturn UsersRoleIDs>
		
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Get user login info.                                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUserAccountInformation">
		
		
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="EntityID" required="yes" type="numeric">			
	
			<cftry>
				
				<cfquery name="getEntityInformation" datasource="PAClient_#trim(clientID)#">
					SELECT Entry, EntryPoint, EntryQID, EntryResponse, UsersID
					FROM pa_master.users  
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
	<!--- Get user login info.                                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUsersID_Temp">
				
		<cfargument name="clientID" required="yes" type="numeric">
		<cfargument name="entityID" required="yes" type="numeric">			
	
			<cftry>
				
				<cfset qUsers = getUserAccountInformation(clientID: trim(clientID), entityID: trim(entityID))>
				
				<cfif qUsers.RecordCount LTE 0>				
			
					<cf_gcSendEmail
						to="gcruz@eobmanager.net"
						from="autoreply@eobmanager.net"
						subject="User cannot be found    clientID: #trim(clientID)#, entityID: #trim(entityID)#"
						message="This user is not in the database. please give immediate attention: #usersID#">
						
					<cf_gcGeneralErrorTemplate	
						title="User Account Issue."
						subtitle=""
						width="75%"
						message="<p><strong>There was an issue trying to retrieve your account.</strong> Please contact your site administrator. 473</p>">	
								
				</cfif>
				
				<cfreturn qUsers.UsersID>						
					
			<cfcatch type="Any">
			
				<cfoutput>
					<p><strong>Caught Exception:</strong> #CFCATCH.TYPE#</p>
					<p>#cfcatch.message# #cfcatch.detail#</p>			
				</cfoutput>				
			
			</cfcatch>
			
		</cftry>		
		
	</cffunction>
	
		
	<cffunction name="UserValidLoginTime" access="public" returntype="string" output="No" hint="This function will authenticate a user availiability to login based on their Group and Specific login times.">
		<!-------------------------------------------------------------------------------------->
		<!--- ClientID is no longer needed because the PA_MASTER table is being looked at    --->
		<!--- to get the users account info.   01/09/2008                                    --->
		<!--------------------------------------------------------------------------------------> 	
		<!------------------------------------------------------------------>
		<!--- Arguments needed for this method.                          --->
		<!------------------------------------------------------------------>	
		<cfargument name="clientID" required="true" type="numeric">
		<cfargument name="UsersID" required="true" type="string">
							
		<!------------------------------------------------------------------>
		<!--- Return.                                                    --->
		<!------------------------------------------------------------------>
		<cfreturn sp_UserValidLoginTime(arguments.clientID, arguments.UsersID)>		
	
	</cffunction>	

	
	<cffunction name="UserSuspend" access="public" returntype="string" output="No" hint="This function will return the suspend attribute on a users account. 1=suspended 0=not suspended">
		<!------------------------------------------------------------------>
		<!--- Arguments needed for this method.                          --->
		<!------------------------------------------------------------------>	
		<cfargument name="UsersID" required="true" type="string">
						
		<cfquery name="getSuspendUser" datasource="pa_master">
			SELECT suspend
			FROM users  			
			WHERE UsersID = #trim(arguments.UsersID)#
		</cfquery>	
							
		<!------------------------------------------------------------------>
		<!--- Return.                                                    --->
		<!------------------------------------------------------------------>
		<cfif getSuspendUser.RecordCount EQ 1>
			<cfreturn getSuspendUser.suspend>		
		<cfelse>
			<cfreturn 1>
		</cfif>
		
	</cffunction>	
	

	<cffunction name="sp_UserValidLoginTime" output="true">
		<cfargument name="clientID" required="true" type="numeric">	
		<cfargument name="usersID" required="true" type="numeric">
	
	 	<cfscript>
			var WorkGroupIDs = "";		
			var getColStart = "";
			var getColEnd = "";
			var CurrentStart = "";
			var CurrentEnd = "";
			var ValidLogin = '0|0';	
			var DayNumber = DayOfWeek(now());
			var CurrentHour = "";
			var CurrentHourStart = "";
			var CurrentHourEnd = "";
					
			switch(DayNumber){
				case 1:{getColStart = 'SundayStart';break;}
				case 2:{getColStart = 'MondayStart';break;}
				case 3:{getColStart = 'TuesdayStart';break;}
				case 4:{getColStart = 'WednesdayStart';break;}
				case 5:{getColStart = 'ThursdayStart';break;}
				case 6:{getColStart = 'FridayStart';break;}
				case 7:{getColStart = 'SaturdayStart';break;}
			}				
			
			switch(DayNumber){
				case 1:{getColEnd = 'SundayEnd';break;}
				case 2:{getColEnd = 'MondayEnd';break;}
				case 3:{getColEnd = 'TuesdayEnd';break;}
				case 4:{getColEnd = 'WednesdayEnd';break;}
				case 5:{getColEnd = 'ThursdayEnd';break;}
				case 6:{getColEnd = 'FridayEnd';break;}
				case 7:{getColEnd = 'SaturdayEnd';break;}
			}		
						
		</cfscript>
	
	
		<cfquery name="getWorkGroupStartEnd" datasource="PAClient_#trim(arguments.ClientID)#">
			SELECT #getColStart# AS StartTime, #getColEnd# AS EndTime
			FROM workgroup 
			WHERE WorkGroupID IN(SELECT WorkGroupID FROM usersworkgroup WHERE usersID = #arguments.usersID#)	
		</cfquery>
	 
		<cfloop query="getWorkGroupStartEnd">
			
			<cfif NOT IsDate(CurrentStart)>			
	 			<cfset CurrentStart = StartTime>
	        <cfelseif IsDate(CurrentStart)>
				<cfif CurrentStart GT StartTime>
	            	<cfset CurrentStart = StartTime>        
	            </cfif>
	        </cfif>
					
			<cfif NOT IsDate(CurrentEnd)>
				<cfset CurrentEnd = EndTime>
	       	<cfelseif IsDate(CurrentEnd)>            
				<cfif CurrentEnd LT EndTime>
					<cfset CurrentEnd = EndTime> 
				</cfif>            
			</cfif>	
			
		</cfloop>

	
		<!-------------------------------------------------------------------------------------------------->
		<!--- After checking the groups for their allowed login time check the users allowed login time. --->
		<!-------------------------------------------------------------------------------------------------->
		<cfquery name="getUserStartEnd" datasource="PAClient_#trim(arguments.ClientID)#">
			SELECT LoginStart AS UsersLoginStart, LoginEnd AS UsersLoginEnd
			FROM  pa_master.users
			WHERE UsersID = #trim(arguments.UsersID)#
		</cfquery>
			
		<cfloop query="getUserStartEnd">
			
			<cfif isDate(UsersLoginStart)>
				<cfif NOT IsDate(CurrentStart)>
					<cfset CurrentStart = UsersLoginStart /> 
				<cfelseif IsDate(CurrentStart)> 
					<cfif CurrentStart GT UsersLoginStart>
				    	<cfset CurrentStart = UsersLoginStart />
				    </cfif>
				</cfif> 
		 	</cfif> 
		 	
		 	<cfif isDate(UsersLoginEnd)>
				<cfif NOT IsDate(CurrentEnd)>
					<cfset CurrentEnd = UsersLoginEnd>
				<cfelseif IsDate(CurrentEnd)>
					<cfif CurrentEnd LT UsersLoginEnd>              
				    	<cfset CurrentEnd = UsersLoginEnd>
					</cfif>
				</cfif>   
			</cfif>
			
		</cfloop>
		

		<!-------------------------------------------------------------------------------------------------->
		<!--- We have the final dates we have to check that the current time is within the dates.        --->
		<!-------------------------------------------------------------------------------------------------->
		<cfif IsDate(CurrentStart) AND IsDate(CurrentEnd)>
			
			<cfset CurrentHour = hour(now()) />
			<cfset CurrentHourStart = hour(CurrentStart) />
			<cfset CurrentHourEnd = hour(CurrentEnd) />
			<cfset CurrentHourMinute = minute(now()) />
			<cfset CurrentHourStartMinute = minute(CurrentStart) />
			<cfset CurrentHourEndMinute = minute(CurrentEnd) />
			<cfset tempYear = YEAR(now()) />
			<cfset tempMonth = MONTH(now()) />
			<cfset tempDay = DAY(now()) />
	
			<cfset tempStart = CreateDateTime(tempYear, tempMonth, tempDay, CurrentHourStart, CurrentHourStartMinute, '59') />
	        <cfset tempEnd = CreateDateTime(tempYear, tempMonth, tempDay, CurrentHourEnd, CurrentHourEndMinute, '59') />		
				
			
			<!-------------------------------------------------------------------------------------------------->
			<!--- If the dates match it means that it is a 24 hour access.                                   --->
			<!-------------------------------------------------------------------------------------------------->
			<cfif tempStart EQ tempEnd>			
				<cfset tempEnd = CreateDateTime(YEAR(now()), MONTH(now()), DAY(now()), 23, 59, 59)  />
				<cfset ValidLogin = '1|' & tempEnd />		
			<cfelseif (DateCompare(now(), tempStart) GTE 0 AND DateCompare(now(), tempEnd) LTE 0)>					
				<cfset ValidLogin = '1|' & tempEnd />
			</cfif>
			
							
		</cfif>
	
		<cfreturn ValidLogin />
	 
	</cffunction>

	
</cfcomponent>







