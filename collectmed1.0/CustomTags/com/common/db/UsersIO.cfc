
<cfcomponent name="UsersIO">

	<cfset reset()>
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function when creating the obejct and anytime you need to clear the   --->
	<!--- object to work with another instance while using the same object.              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="reset" access="public" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- Creat instance variables for each of the column names                          --->
		<!--- that will have a GET and SET method.                                           --->
		<!-------------------------------------------------------------------------------------->
		<cfscript>
			variables.instance.changedVariables = "";
			variables.instance.UsersID = "NULL";
			variables.instance.SiteID = "NULL";
			variables.instance.ClientID = "NULL";
			variables.instance.EntityID = "NULL";
			variables.instance.Entry = "";
			variables.instance.EntryPoint = "";
			variables.instance.EntryQID = "NULL";
			variables.instance.EntryResponse = "";
			variables.instance.ChangedPassword = "";
			variables.instance.LastOpenedClaimID = "NULL";
			variables.instance.Suspend = "";
			variables.instance.LoginStart = "";
			variables.instance.LoginEnd = "";
			variables.instance.Active = "";
			variables.instance.InactiveCode = "NULL";
			variables.instance.DateCreated = "";
			variables.instance.DateModified = "";		
		</cfscript>
		
	</cffunction>	
	
	
<!-------------------------------------------------------------------------------------->
<!--- Create a query that will hold the defualt values of the                        --->
<!--- columns in the table.                                                          --->
<!-------------------------------------------------------------------------------------->
	<cfset defaultsQuery = QueryNew("COLUMN_NAME,IS_NULLABLE,COLUMN_DEFAULT,DATA_TYPE")>
	<cfset temp = QueryAddRow(defaultsQuery, 17)>
	
	
<!-------------------------------------------------------------------------------------->
<!--- Set the cells in the query.                                                    --->
<!-------------------------------------------------------------------------------------->
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "USERSID", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 1)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 1)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SITEID", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 2)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 2)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CLIENTID", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 3)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 3)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ENTITYID", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 4)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 4)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ENTRY", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 5)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 5)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ENTRYPOINT", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 6)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 6)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ENTRYQID", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 7)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 7)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ENTRYRESPONSE", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 8)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "varchar", 8)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "CHANGEDPASSWORD", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "0", 9)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 9)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LASTOPENEDCLAIMID", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 10)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 10)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "SUSPEND", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "0", 11)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 11)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LOGINSTART", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 12)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 12)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "LOGINEND", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 13)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 13)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "ACTIVE", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "1", 14)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "char", 14)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "INACTIVECODE", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 15)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "int", 15)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATECREATED", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "No", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "NOW()", 16)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 16)>
	
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_NAME", "DATEMODIFIED", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "IS_NULLABLE", "YES", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "COLUMN_DEFAULT", "", 17)>
	<cfset temp = QuerySetCell(defaultsQuery, "DATA_TYPE", "datetime", 17)>
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for UsersID.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUsersID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.UsersID>
	</cffunction>
	 
	<cffunction name="setUsersID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="UsersID" required="Yes" type="String">
		
		<cfif UsersID NEQ "NULL">	
			
			<cfif arguments.UsersID EQ "@@" OR arguments.UsersID EQ "">
				
				<cfset arguments.UsersID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(UsersID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>UsersID</strong> (#UsersID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.UsersID = arguments.UsersID>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for SiteID.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSiteID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.SiteID>
	</cffunction>
	 
	<cffunction name="setSiteID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="SiteID" required="Yes" type="String">
		
		<cfif SiteID NEQ "NULL">	
			
			<cfif arguments.SiteID EQ "@@" OR arguments.SiteID EQ "">
				
				<cfset arguments.SiteID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(SiteID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>SiteID</strong> (#SiteID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.SiteID = arguments.SiteID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "SiteID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ClientID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getClientID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ClientID>
	</cffunction>
	 
	<cffunction name="setClientID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ClientID" required="Yes" type="String">
		
		<cfif ClientID NEQ "NULL">	
			
			<cfif arguments.ClientID EQ "@@" OR arguments.ClientID EQ "">
				
				<cfset arguments.ClientID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(ClientID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ClientID</strong> (#ClientID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ClientID = arguments.ClientID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ClientID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for EntityID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEntityID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.EntityID>
	</cffunction>
	 
	<cffunction name="setEntityID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="EntityID" required="Yes" type="String">
		
		<cfif EntityID NEQ "NULL">	
			
			<cfif arguments.EntityID EQ "@@" OR arguments.EntityID EQ "">
				
				<cfset arguments.EntityID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(EntityID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>EntityID</strong> (#EntityID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.EntityID = arguments.EntityID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "EntityID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Entry.                                                  --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEntry" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Entry>
	</cffunction>
	 
	<cffunction name="setEntry" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Entry" required="Yes" type="String">
		
		<cfif Entry NEQ "NULL">	
			
			<cfif arguments.Entry EQ "@@" OR arguments.Entry EQ "">
				
				<cfset arguments.Entry = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(Entry)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Entry</strong> (#Entry#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(Entry) GT 120>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Entry</strong> cannot be greater than 120 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Entry = arguments.Entry>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Entry")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for EntryPoint.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEntryPoint" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.EntryPoint>
	</cffunction>
	 
	<cffunction name="setEntryPoint" access="public" returntype="boolean" output="No">
 		
		<cfargument name="EntryPoint" required="Yes" type="String">
		
		<cfif EntryPoint NEQ "NULL">	
			
			<cfif arguments.EntryPoint EQ "@@" OR arguments.EntryPoint EQ "">
				
				<cfset arguments.EntryPoint = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(EntryPoint)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>EntryPoint</strong> (#EntryPoint#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(EntryPoint) GT 120>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>EntryPoint</strong> cannot be greater than 120 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.EntryPoint = arguments.EntryPoint>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "EntryPoint")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for EntryQID.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEntryQID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.EntryQID>
	</cffunction>
	 
	<cffunction name="setEntryQID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="EntryQID" required="Yes" type="String">
		
		<cfif EntryQID NEQ "NULL">	
			
			<cfif arguments.EntryQID EQ "@@" OR arguments.EntryQID EQ "">
				
				<cfset arguments.EntryQID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(EntryQID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>EntryQID</strong> (#EntryQID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.EntryQID = arguments.EntryQID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "EntryQID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for EntryResponse.                                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEntryResponse" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.EntryResponse>
	</cffunction>
	 
	<cffunction name="setEntryResponse" access="public" returntype="boolean" output="No">
 		
		<cfargument name="EntryResponse" required="Yes" type="String">
		
		<cfif EntryResponse NEQ "NULL">	
			
			<cfif arguments.EntryResponse EQ "@@" OR arguments.EntryResponse EQ "">
				
				<cfset arguments.EntryResponse = "NULL">
						
			<cfelseif NOT REQUEST.isvarcharDataType(EntryResponse)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>EntryResponse</strong> (#EntryResponse#) is not of type <strong>varchar</strong>.">	
			<cfelseif len(EntryResponse) GT 100>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>EntryResponse</strong> cannot be greater than 100 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.EntryResponse = arguments.EntryResponse>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "EntryResponse")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for ChangedPassword.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getChangedPassword" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.ChangedPassword>
	</cffunction>
	 
	<cffunction name="setChangedPassword" access="public" returntype="boolean" output="No">
 		
		<cfargument name="ChangedPassword" required="Yes" type="String">
		
		<cfif ChangedPassword NEQ "NULL">	
			
			<cfif arguments.ChangedPassword EQ "@@" OR arguments.ChangedPassword EQ "">
				
				<cfset arguments.ChangedPassword = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(ChangedPassword)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>ChangedPassword</strong> (#ChangedPassword#) is not of type <strong>char</strong>.">	
			<cfelseif len(ChangedPassword) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>ChangedPassword</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.ChangedPassword = arguments.ChangedPassword>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "ChangedPassword")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LastOpenedClaimID.                                      --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLastOpenedClaimID" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LastOpenedClaimID>
	</cffunction>
	 
	<cffunction name="setLastOpenedClaimID" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LastOpenedClaimID" required="Yes" type="String">
		
		<cfif LastOpenedClaimID NEQ "NULL">	
			
			<cfif arguments.LastOpenedClaimID EQ "@@" OR arguments.LastOpenedClaimID EQ "">
				
				<cfset arguments.LastOpenedClaimID = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(LastOpenedClaimID)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LastOpenedClaimID</strong> (#LastOpenedClaimID#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LastOpenedClaimID = arguments.LastOpenedClaimID>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LastOpenedClaimID")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Suspend.                                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getSuspend" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Suspend>
	</cffunction>
	 
	<cffunction name="setSuspend" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Suspend" required="Yes" type="String">
		
		<cfif Suspend NEQ "NULL">	
			
			<cfif arguments.Suspend EQ "@@" OR arguments.Suspend EQ "">
				
				<cfset arguments.Suspend = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(Suspend)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Suspend</strong> (#Suspend#) is not of type <strong>char</strong>.">	
			<cfelseif len(Suspend) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Suspend</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Suspend = arguments.Suspend>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Suspend")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LoginStart.                                             --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLoginStart" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LoginStart>
	</cffunction>
	 
	<cffunction name="setLoginStart" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LoginStart" required="Yes" type="String">
		
		<cfif LoginStart NEQ "NULL" AND LoginStart NEQ "NOW">	
			
			<cfif arguments.LoginStart EQ "@@" OR arguments.LoginStart EQ "">
				
				<cfset arguments.LoginStart = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(LoginStart)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LoginStart</strong> (#LoginStart#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LoginStart = arguments.LoginStart>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LoginStart")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for LoginEnd.                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLoginEnd" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.LoginEnd>
	</cffunction>
	 
	<cffunction name="setLoginEnd" access="public" returntype="boolean" output="No">
 		
		<cfargument name="LoginEnd" required="Yes" type="String">
		
		<cfif LoginEnd NEQ "NULL" AND LoginEnd NEQ "NOW">	
			
			<cfif arguments.LoginEnd EQ "@@" OR arguments.LoginEnd EQ "">
				
				<cfset arguments.LoginEnd = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(LoginEnd)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>LoginEnd</strong> (#LoginEnd#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.LoginEnd = arguments.LoginEnd>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "LoginEnd")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for Active.                                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getActive" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.Active>
	</cffunction>
	 
	<cffunction name="setActive" access="public" returntype="boolean" output="No">
 		
		<cfargument name="Active" required="Yes" type="String">
		
		<cfif Active NEQ "NULL">	
			
			<cfif arguments.Active EQ "@@" OR arguments.Active EQ "">
				
				<cfset arguments.Active = "NULL">
						
			<cfelseif NOT REQUEST.ischarDataType(Active)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>Active</strong> (#Active#) is not of type <strong>char</strong>.">	
			<cfelseif len(Active) GT 1>
				<cf_gcGeneralErrorTemplate
					message="The field <strong>Active</strong> cannot be greater than 1 character(s).">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.Active = arguments.Active>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "Active")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for InactiveCode.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getInactiveCode" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.InactiveCode>
	</cffunction>
	 
	<cffunction name="setInactiveCode" access="public" returntype="boolean" output="No">
 		
		<cfargument name="InactiveCode" required="Yes" type="String">
		
		<cfif InactiveCode NEQ "NULL">	
			
			<cfif arguments.InactiveCode EQ "@@" OR arguments.InactiveCode EQ "">
				
				<cfset arguments.InactiveCode = "NULL">
						
			<cfelseif NOT REQUEST.isintDataType(InactiveCode)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>InactiveCode</strong> (#InactiveCode#) is not of type <strong>int</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.InactiveCode = arguments.InactiveCode>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "InactiveCode")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateCreated.                                            --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateCreated" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateCreated>
	</cffunction>
	 
	<cffunction name="setDateCreated" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateCreated" required="Yes" type="String">
		
		<cfif DateCreated NEQ "NULL" AND DateCreated NEQ "NOW">	
			
			<cfif arguments.DateCreated EQ "@@" OR arguments.DateCreated EQ "">
				
				<cfset arguments.DateCreated = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateCreated)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateCreated</strong> (#DateCreated#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateCreated = arguments.DateCreated>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateCreated")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!--------------------------------------------------------------------------------------> 	
	<!--- GET and SET method for DateModified.                                           --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getDateModified" access="public" returntype="String" output="No">
  		<cfreturn variables.instance.DateModified>
	</cffunction>
	 
	<cffunction name="setDateModified" access="public" returntype="boolean" output="No">
 		
		<cfargument name="DateModified" required="Yes" type="String">
		
		<cfif DateModified NEQ "NULL" AND DateModified NEQ "NOW">	
			
			<cfif arguments.DateModified EQ "@@" OR arguments.DateModified EQ "">
				
				<cfset arguments.DateModified = "NULL">
						
			<cfelseif NOT REQUEST.isdatetimeDataType(DateModified)>
				<cf_gcGeneralErrorTemplate				
					message="<strong>DateModified</strong> (#DateModified#) is not of type <strong>datetime</strong>.">
			</cfif>
						
		</cfif>	
			
 		<cfset variables.instance.DateModified = arguments.DateModified>					
		<cfset variables.instance.changedVariables = ListAppend(variables.instance.changedVariables, "DateModified")>			
		<cfreturn true>
		
	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to instantiate a record you can then                         --->
	<!--- use the commit function to create the record which will                        --->
	<!--- return the recordID.                                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="new" access="public" output="no">

		<cfargument name="SiteID" required="No" type="String" default="">
		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="EntityID" required="No" type="String" default="">
		<cfargument name="Entry" required="No" type="String" default="">
		<cfargument name="EntryPoint" required="No" type="String" default="">
		<cfargument name="EntryQID" required="No" type="String" default="">
		<cfargument name="EntryResponse" required="No" type="String" default="">
		<cfargument name="ChangedPassword" required="No" type="String" default="">
		<cfargument name="LastOpenedClaimID" required="No" type="String" default="">
		<cfargument name="Suspend" required="No" type="String" default="">
		<cfargument name="LoginStart" required="No" type="String" default="">
		<cfargument name="LoginEnd" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">

		<cfset variables.instance.SiteID = arguments.SiteID>
		<cfset variables.instance.ClientID = arguments.ClientID>
		<cfset variables.instance.EntityID = arguments.EntityID>
		<cfset variables.instance.Entry = arguments.Entry>
		<cfset variables.instance.EntryPoint = arguments.EntryPoint>
		<cfset variables.instance.EntryQID = arguments.EntryQID>
		<cfset variables.instance.EntryResponse = arguments.EntryResponse>
		<cfset variables.instance.ChangedPassword = arguments.ChangedPassword>
		<cfset variables.instance.LastOpenedClaimID = arguments.LastOpenedClaimID>
		<cfset variables.instance.Suspend = arguments.Suspend>
		<cfset variables.instance.LoginStart = arguments.LoginStart>
		<cfset variables.instance.LoginEnd = arguments.LoginEnd>
		<cfset variables.instance.Active = arguments.Active>
		<cfset variables.instance.InactiveCode = arguments.InactiveCode>
		<cfset variables.instance.DateCreated = arguments.DateCreated>
		<cfset variables.instance.DateModified = arguments.DateModified>

	</cffunction>
	
	

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function initialize a record into an object.                          --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="InitUserIO" access="public" returntype="UsersIO" output="No">
		
		<cfargument name="UsersID" required="yes" type="numeric">		
		<cfset var qGetUsers = "">
		
		<cfset preInit(UsersID)>
	
		<cfquery name="qGetUsers" datasource="pa_master">
	  		SELECT UsersID,SiteID,ClientID,EntityID,Entry,EntryPoint,EntryQID,EntryResponse,ChangedPassword,LastOpenedClaimID,Suspend,LoginStart,LoginEnd,Active,InactiveCode,DateCreated,DateModified
			FROM Users  
			WHERE UsersID = #trim(arguments.UsersID)# 
		</cfquery>
		
		<cfif qGetUsers.Recordcount LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="Could not initialize the object the record was not found.">		
		</cfif>
		
		
		<cfscript>
			IF(qGetUsers.UsersID EQ "" OR qGetUsers.UsersID EQ "NULL") 
				variables.instance.UsersID = "NULL"; 
			ELSE 
				variables.instance.UsersID = qGetUsers.UsersID;
				
			IF(qGetUsers.SiteID EQ "" OR qGetUsers.SiteID EQ "NULL") 
				variables.instance.SiteID = "NULL"; 
			ELSE 
				variables.instance.SiteID = qGetUsers.SiteID;
				
			IF(qGetUsers.ClientID EQ "" OR qGetUsers.ClientID EQ "NULL") 
				variables.instance.ClientID = "NULL"; 
			ELSE 
				variables.instance.ClientID = qGetUsers.ClientID;
				
			IF(qGetUsers.EntityID EQ "" OR qGetUsers.EntityID EQ "NULL") 
				variables.instance.EntityID = "NULL"; 
			ELSE 
				variables.instance.EntityID = qGetUsers.EntityID;
							
				variables.instance.Entry = qGetUsers.Entry;
							
				variables.instance.EntryPoint = qGetUsers.EntryPoint;
				
			IF(qGetUsers.EntryQID EQ "" OR qGetUsers.EntryQID EQ "NULL") 
				variables.instance.EntryQID = "NULL"; 
			ELSE 
				variables.instance.EntryQID = qGetUsers.EntryQID;
							
				variables.instance.EntryResponse = qGetUsers.EntryResponse;
							
				variables.instance.ChangedPassword = qGetUsers.ChangedPassword;
				
			IF(qGetUsers.LastOpenedClaimID EQ "" OR qGetUsers.LastOpenedClaimID EQ "NULL") 
				variables.instance.LastOpenedClaimID = "NULL"; 
			ELSE 
				variables.instance.LastOpenedClaimID = qGetUsers.LastOpenedClaimID;
							
				variables.instance.Suspend = qGetUsers.Suspend;
							
				variables.instance.LoginStart = qGetUsers.LoginStart;
							
				variables.instance.LoginEnd = qGetUsers.LoginEnd;
							
				variables.instance.Active = qGetUsers.Active;
				
			IF(qGetUsers.InactiveCode EQ "" OR qGetUsers.InactiveCode EQ "NULL") 
				variables.instance.InactiveCode = "NULL"; 
			ELSE 
				variables.instance.InactiveCode = qGetUsers.InactiveCode;
							
				variables.instance.DateCreated = qGetUsers.DateCreated;
							
				variables.instance.DateModified = qGetUsers.DateModified;
				
		</cfscript>		
		  
		<cfset postInit(UsersID)>
				
		<cfreturn this>
	 
	</cffunction>

			
			
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function to be able to either add a record or                         --->
	<!--- update a record.                                                               --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="Commit" access="public" returntype="Boolean">
				
	 	<cfset var qCommitUsers = "">
		
		<cfset preUpdateCommit()>
	 	
		<cfif IsNumeric(variables.instance.UsersID) AND variables.instance.UsersID  GT 0>	  		
			
			<cfif ListLen(trim(variables.instance.changedVariables)) GTE 1>
			
				<cfset sqlStatement = preUpdateDataCheck()>				
				
				<cfquery name="qUpdateCommitUsers" datasource="pa_master">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>
							
				<cfset postUpdateCommit()>
			
			</cfif>
			
		<cfelse>
			
			<cfset preInsertCommit()>
			
			<cfset sqlStatement = preInsertDataCheck()>				
			
			<cfif Find("Error:", sqlStatement)>
			
				<cf_gcGeneralErrorTemplate message="#trim(sqlStatement)#">
			
			<cfelse>
			
				<cfquery name="qInsertCommitUsers" datasource="pa_master">
		   			#PreserveSingleQuotes(sqlStatement)#
		   		</cfquery>		
		 					
				<cfset postInsertCommit()>
				
				<cfset variables.instance.UsersID = qInsertCommitUsers.UsersID>
				
				<cfreturn qInsertCommitUsers.UsersID>
			
			</cfif>	
			
		</cfif>
	 	
		<cfreturn true>
	
	</cffunction>
	

	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic update statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preUpdateDataCheck" output="no">
	
		<!-------------------------------------------------------------------------------------->
		<!--- List all the table columns.                                                    --->
		<!-------------------------------------------------------------------------------------->	
			<cfset tableColumns = "UsersID,SiteID,ClientID,EntityID,Entry,EntryPoint,EntryQID,EntryResponse,ChangedPassword,LastOpenedClaimID,Suspend,LoginStart,LoginEnd,Active,InactiveCode,DateCreated,DateModified">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "Entry,EntryPoint,EntryResponse,ChangedPassword,Suspend,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "LoginStart,LoginEnd,DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToUpdate = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="#variables.instance.changedVariables#" index="currentVar">				
				
				<!-------------------------------------------------------------------------------------->
				<!--- Only put the colunm if it is not already there.                                --->
				<!-------------------------------------------------------------------------------------->				
				<cfif NOT FindNoCase("#currentVar# =", columnsToUpdate)>
				
					<!-------------------------------------------------------------------------------------->
					<!--- Include the column in the query only if there is a value.                      --->
					<!-------------------------------------------------------------------------------------->			
					<cfset currentrecord = "variables.instance.#currentVar#">								
					<cfif evaluate(currentRecord) NEQ "">				
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value came in with the value of null we must see                        --->
						<!--- if the column has a default value. If there is a default                       --->
						<!--- value that is what must go into the database.                                  --->
						<!-------------------------------------------------------------------------------------->
						<cfif evaluate(currentRecord) EQ "NULL"> 
							<cfquery name="getColumnDefault" dbtype="query">
								SELECT IS_NULLABLE, COLUMN_DEFAULT
								FROM defaultsQuery
								WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
							</cfquery>
						</cfif>
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
							
							<!-------------------------------------------------------------------------------------->
							<!--- If the value cannot be evaluated to a date error out.                          --->
							<!-------------------------------------------------------------------------------------->					
							<cfif NOT IsDate(evaluate(currentRecord))>						
								<cf_gcGeneralErrorTemplate				
									message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
							</cfif>		
							
							<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #CreateODBCDateTime(currentDate)#">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the column is a datetime datatype then we must give                         --->
						<!--- it a format that will safely go into the db.                                   --->
						<!-------------------------------------------------------------------------------------->				
						<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = NOW()">
							
						<!-------------------------------------------------------------------------------------->
						<!--- If the current column is a string then add the single                          --->
						<!--- quotes allowing to safely enter the dB.                                        --->
						<!-------------------------------------------------------------------------------------->				 
						<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = '#Replace(evaluate(currentRecord), "'", "''", "ALL")#'">
						
						<!-------------------------------------------------------------------------------------->
						<!--- When you send in a value of null and there is a default                        --->
						<!--- value for that column then add it to the query.                                --->
						<!-------------------------------------------------------------------------------------->			
						<cfelseif evaluate(currentRecord) EQ "NULL" AND IsDefined("getColumnDefault.COLUMN_DEFAULT") AND getColumnDefault.COLUMN_DEFAULT NEQ ""> 
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #getColumnDefault.COLUMN_DEFAULT#">						
						<cfelse>
							<cfset columnsToUpdate = columnsToUpdate & ", #currentVar# = #evaluate(currentRecord)#">						
						</cfif>				  
					
					</cfif>
				
				</cfif>
			
			</cfloop>	
			
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "UPDATE Users  SET #columnsToUpdate# WHERE UsersID = #trim(variables.instance.UsersID)#">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase("SET ,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", "SET ,", "SET ", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>


	
	
	<!-------------------------------------------------------------------------------------->
	<!--- This function will create the dynamic insert statement                         --->
	<!--- that will be passed to the Commit function.                                    --->
	<!--------------------------------------------------------------------------------------> 	
	<cffunction name="preInsertDataCheck" output="no">		
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset stringTableColumns = "Entry,EntryPoint,EntryResponse,ChangedPassword,Suspend,Active">	
			
		<!-------------------------------------------------------------------------------------->
		<!--- Denote the column names that need single quotes (strings).                     --->
		<!-------------------------------------------------------------------------------------->
			<cfset nTableColumns = "">			
			
		<!-------------------------------------------------------------------------------------->
		<!--- What columns are Date datatype.                                                --->
		<!-------------------------------------------------------------------------------------->
			<cfset dateColumnList = "LoginStart,LoginEnd,DateCreated,DateModified">

		<!-------------------------------------------------------------------------------------->
		<!--- Append to list the columns that qualify for an update.                         --->
		<!-------------------------------------------------------------------------------------->			
			<cfset columnsToInsert = "">
			<cfset columnsToInsertValues = "">
			
		<!-------------------------------------------------------------------------------------->
		<!--- Loop the list of variables that have been changed and                          --->
		<!--- append it to the update statement.                                             --->
		<!-------------------------------------------------------------------------------------->					
			<cfloop list="SiteID,ClientID,EntityID,Entry,EntryPoint,EntryQID,EntryResponse,ChangedPassword,LastOpenedClaimID,Suspend,LoginStart,LoginEnd,Active,InactiveCode,DateCreated,DateModified" index="currentVar">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Include the column in the query only if there is a value.                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfset currentrecord = "variables.instance.#currentVar#">
				
				<!-------------------------------------------------------------------------------------->
				<!--- Check each column against the defaults query                                   --->
				<!--- (use UCASE() to find column) and see if there is a                             --->
				<!--- default on any column coming in as a blank and throw                           --->
				<!--- error on those that do not allow a blank.                                      --->
				<!-------------------------------------------------------------------------------------->			
				<cfquery name="getColumnDefault" dbtype="query">
					SELECT IS_NULLABLE, COLUMN_DEFAULT
					FROM defaultsQuery
					WHERE COLUMN_NAME = '#UCASE(trim(currentVar))#'
				</cfquery>
				
				<cfif evaluate(currentRecord) EQ "" AND getColumnDefault.IS_NULLABLE EQ "No" AND getColumnDefault.COLUMN_DEFAULT EQ ""> 
					<cfset message="Error: The parameter (""#CurrentVar#"") cannot be blank.">
					<cfreturn message>
				</cfif>
				
				<!-------------------------------------------------------------------------------------->
				<!--- If the column is not blank check to make sure the value                        --->
				<!--- is a valid one.                                                                --->
				<!-------------------------------------------------------------------------------------->
				<cfif evaluate(currentRecord) NEQ "" AND evaluate(currentRecord) NEQ "NULL">				
										
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) NEQ "NULL" AND evaluate(currentRecord) NEQ "NOW">							
						
						<!-------------------------------------------------------------------------------------->
						<!--- If the value cannot be evaluated to a date error out.                          --->
						<!-------------------------------------------------------------------------------------->					
						<cfif NOT IsDate(evaluate(currentRecord))>						
							<cf_gcGeneralErrorTemplate				
								message="The date (#evaluate(currentVar)#) you entered is not recognized as a valid date.">							
						</cfif>		
						
						<cfset currentDate = Year(evaluate(currentRecord)) & "-" & Month(evaluate(currentRecord)) & "-" & Day(evaluate(currentRecord)) & " " & Hour(evaluate(currentRecord)) & ":" & Minute(evaluate(currentRecord)) & ":" & SECOND(evaluate(currentRecord))>
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#CreateODBCDateTime(currentDate)#")>
												
					<!-------------------------------------------------------------------------------------->
					<!--- If the column is a datetime datatype then we must give                         --->
					<!--- it a format that will safely go into the db.                                   --->
					<!-------------------------------------------------------------------------------------->				
					<cfelseif ListFindNoCase(dateColumnList,currentVar) AND evaluate(currentRecord) EQ "NOW">
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "NOW()")>
						
					<!-------------------------------------------------------------------------------------->
					<!--- If the current column is a string then add the single                          --->
					<!--- quotes allowing to safely enter the dB.                                        --->
					<!-------------------------------------------------------------------------------------->				 
					<cfelseif (ListFindNoCase(stringTableColumns,currentVar) OR ListFindNoCase(nTableColumns,currentVar)) AND evaluate(currentRecord) NEQ "NULL">				
						
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "'#Replace(evaluate(currentRecord), "'", "''", "ALL")#'")>
										
					<!-------------------------------------------------------------------------------------->
                    <!--- When you send in a value of null and there is a default                        --->
                    <!--- value for that column then add it to the query.                                --->
                    <!-------------------------------------------------------------------------------------->                  
                    <cfelseif evaluate(currentRecord) NEQ "NULL" OR evaluate(currentRecord) NEQ "">
                    	
						<cfset columnsToInsert = ListAppend(columnsToInsert, "#currentVar#")>
						<cfset columnsToInsertValues = ListAppend(columnsToInsertValues, "#evaluate(currentRecord)#")>  
						                                         
                    </cfif>    				
							  
				
				</cfif>
			
			</cfloop>	
			
			<!-------------------------------------------------------------------------------------->
			<!--- If for some reason the list do not come out the same                           --->
			<!--- lengths or there is an issue throw back an error.                              --->
			<!-------------------------------------------------------------------------------------->			
			<cfif ListLen(columnsToInsert) EQ 0 OR ListLen(columnsToInsertValues) EQ 0><!--- OR ListLen(columnsToInsert) NEQ ListLen(columnsToInsertValues)--->
				<cfset message="Error: The elements in the Columns and the Values do match please check the variables.">
				<cfreturn message>		
			</cfif>
			
			<!-------------------------------------------------------------------------------------->
			<!--- Build the SQL statement.                                                       --->
			<!-------------------------------------------------------------------------------------->	
				<cfset sqlStatement = "INSERT INTO Users  (#trim(columnsToInsert)#) VALUES(#trim(columnsToInsertValues)#); SELECT LAST_INSERT_ID() AS UsersID ">
				
			<!-------------------------------------------------------------------------------------->
			<!--- If the user sent in one column to update the initial                           --->
			<!--- comma must be taken out to allow the tag to process.                           --->
			<!-------------------------------------------------------------------------------------->
				<cfif FindNoCase(" (,", sqlStatement) NEQ 0>
					<cfset sqlStatement = ReplaceNoCase("#sqlStatement#", " (,", " (", "ALL")>	
				</cfif>					
				
			<!-------------------------------------------------------------------------------------->
			<!--- Return the fully qulified update statement that will be                        --->
			<!--- run with the PreserveSingleQuotes() function.                                  --->
			<!-------------------------------------------------------------------------------------->				
				<cfreturn sqlStatement>				
				
	
	</cffunction>
	
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- Call this object by appending to the where clause the                          --->
	<!--- columns that match your search criteria returning a                            --->
	<!--- query.                                                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getUsersQuery" returntype="query" hint="Call this object by appending to the where clause the columns that match your search criteria returning a query.">
		
		<cfargument name="QueryName" required="No" type="String" default="getUsersQuery">						
		<cfargument name="Fields" required="No" type="String" default="UsersID,SiteID,ClientID,EntityID,Entry,EntryPoint,EntryQID,EntryResponse,ChangedPassword,LastOpenedClaimID,Suspend,LoginStart,LoginEnd,Active,InactiveCode,DateCreated,DateModified">	
		<cfargument name="OrderBy" required="No" type="String" default="">
		<cfargument name="GroupBy" required="No" type="String" default="">
		<cfargument name="top1" required="No" type="String" default="no">
		<cfargument name="UsersID" required="No" type="String" default="">
		<cfargument name="UsersID_IN" required="No" type="String" default="">
		<cfargument name="UsersID_LIKE" required="No" type="String" default="">
		<cfargument name="SiteID" required="No" type="String" default="">
		<cfargument name="SiteID_IN" required="No" type="String" default="">
		<cfargument name="SiteID_LIKE" required="No" type="String" default="">
		<cfargument name="ClientID" required="No" type="String" default="">
		<cfargument name="ClientID_IN" required="No" type="String" default="">
		<cfargument name="ClientID_LIKE" required="No" type="String" default="">
		<cfargument name="EntityID" required="No" type="String" default="">
		<cfargument name="EntityID_IN" required="No" type="String" default="">
		<cfargument name="EntityID_LIKE" required="No" type="String" default="">
		<cfargument name="Entry" required="No" type="String" default="">
		<cfargument name="Entry_IN" required="No" type="String" default="">
		<cfargument name="Entry_LIKE" required="No" type="String" default="">
		<cfargument name="EntryPoint" required="No" type="String" default="">
		<cfargument name="EntryPoint_IN" required="No" type="String" default="">
		<cfargument name="EntryPoint_LIKE" required="No" type="String" default="">
		<cfargument name="EntryQID" required="No" type="String" default="">
		<cfargument name="EntryQID_IN" required="No" type="String" default="">
		<cfargument name="EntryQID_LIKE" required="No" type="String" default="">
		<cfargument name="EntryResponse" required="No" type="String" default="">
		<cfargument name="EntryResponse_IN" required="No" type="String" default="">
		<cfargument name="EntryResponse_LIKE" required="No" type="String" default="">
		<cfargument name="ChangedPassword" required="No" type="String" default="">
		<cfargument name="ChangedPassword_IN" required="No" type="String" default="">
		<cfargument name="ChangedPassword_LIKE" required="No" type="String" default="">
		<cfargument name="LastOpenedClaimID" required="No" type="String" default="">
		<cfargument name="LastOpenedClaimID_IN" required="No" type="String" default="">
		<cfargument name="LastOpenedClaimID_LIKE" required="No" type="String" default="">
		<cfargument name="Suspend" required="No" type="String" default="">
		<cfargument name="Suspend_IN" required="No" type="String" default="">
		<cfargument name="Suspend_LIKE" required="No" type="String" default="">
		<cfargument name="LoginStart" required="No" type="String" default="">
		<cfargument name="LoginStart_IN" required="No" type="String" default="">
		<cfargument name="LoginStart_LIKE" required="No" type="String" default="">
		<cfargument name="LoginEnd" required="No" type="String" default="">
		<cfargument name="LoginEnd_IN" required="No" type="String" default="">
		<cfargument name="LoginEnd_LIKE" required="No" type="String" default="">
		<cfargument name="Active" required="No" type="String" default="">
		<cfargument name="Active_IN" required="No" type="String" default="">
		<cfargument name="Active_LIKE" required="No" type="String" default="">
		<cfargument name="InactiveCode" required="No" type="String" default="">
		<cfargument name="InactiveCode_IN" required="No" type="String" default="">
		<cfargument name="InactiveCode_LIKE" required="No" type="String" default="">
		<cfargument name="DateCreated" required="No" type="String" default="">
		<cfargument name="DateCreated_IN" required="No" type="String" default="">
		<cfargument name="DateCreated_LIKE" required="No" type="String" default="">
		<cfargument name="DateModified" required="No" type="String" default="">
		<cfargument name="DateModified_IN" required="No" type="String" default="">
		<cfargument name="DateModified_LIKE" required="No" type="String" default="">

		
		<!-------------------------------------------------------------------------------------->
		<!--- The fields string cannot be blank.                                             --->
		<!-------------------------------------------------------------------------------------->
		<cfif listLen(Fields) LTE 0>
			<cf_gcGeneralErrorTemplate				
				message="The parameter fields used is not valid. The parameter is empty.">
		</cfif>
				
		
		<!-------------------------------------------------------------------------------------->
		<!--- List the columns and loop through the arguments                                --->
		<!--- structure to make sure that the arguments that have                            --->
		<!--- been defined are available in this CFC. Although there are                     --->
		<!--- exceptions. If the argument being sent in contains "_IN"                       --->
		<!--- or "_LIKE" (case sensitive) then let it pass through.                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfset availableColumns = "UsersID,UsersID_IN,UsersID_LIKE,SiteID,SiteID_IN,SiteID_LIKE,ClientID,ClientID_IN,ClientID_LIKE,EntityID,EntityID_IN,EntityID_LIKE,Entry,Entry_IN,Entry_LIKE,EntryPoint,EntryPoint_IN,EntryPoint_LIKE,EntryQID,EntryQID_IN,EntryQID_LIKE,EntryResponse,EntryResponse_IN,EntryResponse_LIKE,ChangedPassword,ChangedPassword_IN,ChangedPassword_LIKE,LastOpenedClaimID,LastOpenedClaimID_IN,LastOpenedClaimID_LIKE,Suspend,Suspend_IN,Suspend_LIKE,LoginStart,LoginStart_IN,LoginStart_LIKE,LoginEnd,LoginEnd_IN,LoginEnd_LIKE,Active,Active_IN,Active_LIKE,InactiveCode,InactiveCode_IN,InactiveCode_LIKE,DateCreated,DateCreated_IN,DateCreated_LIKE,DateModified,DateModified_IN,DateModified_LIKE,top1">
				
			<cfset keysToStruct = StructKeyArray(arguments)>
		  					
			<cfloop from="1" to="#ArrayLen(keysToStruct)#" index="i">
				
				<cfif NOT ListFindNoCase("QueryName|Fields|OrderBy|GroupBy", keysToStruct[i], "|") AND Find("_IN", keysToStruct[i]) EQ 0 AND Find("_LIKE", keysToStruct[i]) EQ 0>
					
					<cfif NOT ListFindNoCase(availableColumns, keysToStruct[i])>
						<cf_gcGeneralErrorTemplate				
							invisible="Users"
							message="The parameter ""#keysToStruct[i]#"" used is not valid. The value of the parameter is ""#arguments[keysToStruct[i]]#"".">
					</cfif>				
				
					<cfif StructFind(arguments, keysToStruct[i]) NEQ "">
						
						<cfquery name="getThisDataType" dbtype="query">
							SELECT DATA_TYPE
							FROM defaultsQuery
							WHERE COLUMN_NAME = '#keysToStruct[i]#'
						</cfquery>						
						
						<cfswitch expression="#trim(getThisDataType.DATA_TYPE)#">
							<cfcase value="binary,varbinary,image,char,varchar,nchar,nvarchar">
								<cfset thisDateType = "String">
							</cfcase> 
							<cfcase value="ntextdatetime,smalldatetime,datetime">
								<cfset thisDateType = "Date">
							</cfcase> 						
							<cfcase value="bigint,Int,smallint,tinyint,bit,numeric,money,smallmoney,decimal,float,real">
								<cfset thisDateType = "Numeric">
							</cfcase>	
						    <cfdefaultcase>
								<cfset thisDateType = "String">
						    </cfdefaultcase>
						</cfswitch>	
									
						
						<cfif thisDateType EQ "Date">
							
							<cfif NOT IsDate(StructFind(arguments, keysToStruct[i]))>
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be a date. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
						
						<cfelseif thisDateType EQ "Numeric">					
							
							<cfif NOT IsNumeric(StructFind(arguments, keysToStruct[i]))>						
								<cf_gcGeneralErrorTemplate				
									message="The parameter ""#keysToStruct[i]#"" must be numeric. The value of the parameter currently is ""#arguments[keysToStruct[i]]#"".">
							</cfif>
									
						</cfif> 
						
					</cfif>		
				
				</cfif>
				
			</cfloop>	
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- We must change the Group BY.                                                   --->
		<!-------------------------------------------------------------------------------------->
 		<cfif GroupBy NEQ "">
			
			<cfset GroupBy1 = "">
			
			<cfloop list="#trim(GroupBy)#" index="g">
				
				<cfif ListFindNoCase(fields, trim(g))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(g))>
				</cfif> 
			
			</cfloop>
			
			<cfloop list="#trim(fields)#" index="f">
				
				<cfif NOT ListFindNoCase(GroupBy, trim(f))>
					<cfset GroupBy1 = ListAppend(GroupBy1, trim(f))>
				</cfif> 
			
			</cfloop>		
			
		</cfif>			
			
			
		<!-------------------------------------------------------------------------------------->
		<!--- Complete the tag and build the query based on the                              --->
		<!--- variables from above.                                                          --->
		<!-------------------------------------------------------------------------------------->			
			<cfquery Name="getUsersQuery" datasource="pa_master">
				SELECT #trim(Fields)#
				FROM Users   
				WHERE 1=1
					<cfif UsersID NEQ "" AND IsNumeric(UsersID)>AND UsersID = #UsersID#</cfif>
					<cfif UsersID_IN NEQ "">AND UsersID IN(#trim(UsersID_IN)#)</cfif>
					<cfif UsersID_LIKE NEQ "">AND UsersID LIKE '%#trim(UsersID_LIKE)#%'</cfif>
					<cfif SiteID NEQ "" AND IsNumeric(SiteID)>AND SiteID = #SiteID#</cfif>
					<cfif SiteID_IN NEQ "">AND SiteID IN(#trim(SiteID_IN)#)</cfif>
					<cfif SiteID_LIKE NEQ "">AND SiteID LIKE '%#trim(SiteID_LIKE)#%'</cfif>
					<cfif ClientID NEQ "" AND IsNumeric(ClientID)>AND ClientID = #ClientID#</cfif>
					<cfif ClientID_IN NEQ "">AND ClientID IN(#trim(ClientID_IN)#)</cfif>
					<cfif ClientID_LIKE NEQ "">AND ClientID LIKE '%#trim(ClientID_LIKE)#%'</cfif>
					<cfif EntityID NEQ "" AND IsNumeric(EntityID)>AND EntityID = #EntityID#</cfif>
					<cfif EntityID_IN NEQ "">AND EntityID IN(#trim(EntityID_IN)#)</cfif>
					<cfif EntityID_LIKE NEQ "">AND EntityID LIKE '%#trim(EntityID_LIKE)#%'</cfif>
					<cfif Entry NEQ "">AND Entry = '#Entry#'</cfif>
					<cfif Entry_IN NEQ "">AND Entry IN(#trim(Entry_IN)#)</cfif>
					<cfif Entry_LIKE NEQ "">AND Entry LIKE '%#trim(Entry_LIKE)#%'</cfif>
					<cfif EntryPoint NEQ "">AND EntryPoint = '#EntryPoint#'</cfif>
					<cfif EntryPoint_IN NEQ "">AND EntryPoint IN(#trim(EntryPoint_IN)#)</cfif>
					<cfif EntryPoint_LIKE NEQ "">AND EntryPoint LIKE '%#trim(EntryPoint_LIKE)#%'</cfif>
					<cfif EntryQID NEQ "" AND IsNumeric(EntryQID)>AND EntryQID = #EntryQID#</cfif>
					<cfif EntryQID_IN NEQ "">AND EntryQID IN(#trim(EntryQID_IN)#)</cfif>
					<cfif EntryQID_LIKE NEQ "">AND EntryQID LIKE '%#trim(EntryQID_LIKE)#%'</cfif>
					<cfif EntryResponse NEQ "">AND EntryResponse = '#EntryResponse#'</cfif>
					<cfif EntryResponse_IN NEQ "">AND EntryResponse IN(#trim(EntryResponse_IN)#)</cfif>
					<cfif EntryResponse_LIKE NEQ "">AND EntryResponse LIKE '%#trim(EntryResponse_LIKE)#%'</cfif>
					<cfif ChangedPassword NEQ "">AND ChangedPassword = '#ChangedPassword#'</cfif>
					<cfif ChangedPassword_IN NEQ "">AND ChangedPassword IN(#trim(ChangedPassword_IN)#)</cfif>
					<cfif ChangedPassword_LIKE NEQ "">AND ChangedPassword LIKE '%#trim(ChangedPassword_LIKE)#%'</cfif>
					<cfif LastOpenedClaimID NEQ "" AND IsNumeric(LastOpenedClaimID)>AND LastOpenedClaimID = #LastOpenedClaimID#</cfif>
					<cfif LastOpenedClaimID_IN NEQ "">AND LastOpenedClaimID IN(#trim(LastOpenedClaimID_IN)#)</cfif>
					<cfif LastOpenedClaimID_LIKE NEQ "">AND LastOpenedClaimID LIKE '%#trim(LastOpenedClaimID_LIKE)#%'</cfif>
					<cfif Suspend NEQ "">AND Suspend = '#Suspend#'</cfif>
					<cfif Suspend_IN NEQ "">AND Suspend IN(#trim(Suspend_IN)#)</cfif>
					<cfif Suspend_LIKE NEQ "">AND Suspend LIKE '%#trim(Suspend_LIKE)#%'</cfif>
					<cfif LoginStart NEQ "">AND LoginStart = '#LoginStart#'</cfif>
					<cfif LoginStart_IN NEQ "">AND LoginStart IN(#trim(LoginStart_IN)#)</cfif>
					<cfif LoginStart_LIKE NEQ "">AND LoginStart LIKE '%#trim(LoginStart_LIKE)#%'</cfif>
					<cfif LoginEnd NEQ "">AND LoginEnd = '#LoginEnd#'</cfif>
					<cfif LoginEnd_IN NEQ "">AND LoginEnd IN(#trim(LoginEnd_IN)#)</cfif>
					<cfif LoginEnd_LIKE NEQ "">AND LoginEnd LIKE '%#trim(LoginEnd_LIKE)#%'</cfif>
					<cfif Active NEQ "">AND Active = '#Active#'</cfif>
					<cfif Active_IN NEQ "">AND Active IN(#trim(Active_IN)#)</cfif>
					<cfif Active_LIKE NEQ "">AND Active LIKE '%#trim(Active_LIKE)#%'</cfif>
					<cfif InactiveCode NEQ "" AND IsNumeric(InactiveCode)>AND InactiveCode = #InactiveCode#</cfif>
					<cfif InactiveCode_IN NEQ "">AND InactiveCode IN(#trim(InactiveCode_IN)#)</cfif>
					<cfif InactiveCode_LIKE NEQ "">AND InactiveCode LIKE '%#trim(InactiveCode_LIKE)#%'</cfif>
					<cfif DateCreated NEQ "">AND DateCreated = '#DateCreated#'</cfif>
					<cfif DateCreated_IN NEQ "">AND DateCreated IN(#trim(DateCreated_IN)#)</cfif>
					<cfif DateCreated_LIKE NEQ "">AND DateCreated LIKE '%#trim(DateCreated_LIKE)#%'</cfif>
					<cfif DateModified NEQ "">AND DateModified = '#DateModified#'</cfif>
					<cfif DateModified_IN NEQ "">AND DateModified IN(#trim(DateModified_IN)#)</cfif>
					<cfif DateModified_LIKE NEQ "">AND DateModified LIKE '%#trim(DateModified_LIKE)#%'</cfif>	
				<cfif OrderBy NEQ "">
					ORDER BY #trim(OrderBy)#
				</cfif>
				<cfif IsDefined("GroupBy1") AND GroupBy1 NEQ "" AND top1 EQ "no" AND (ListLen(fields) EQ ListLen(GroupBy1))>
					GROUP BY #trim(GroupBy1)#
				</cfif>
				<cfif top1 NEQ "no">LIMIT 1</cfif> 
			</cfquery>
			
			<cfreturn getUsersQuery>
		
	</cffunction>
	
	
		
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->	
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any Init to a record. If nothing is created in this   --->
		<!--- function then it just goes on.                                                 --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInit" hint="Called automatically before an Init occurs.">		
		</cffunction>
		
		<cffunction name="postInit" hint="Called automatically after an Init occurs.">		
		</cffunction>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any update to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!-------------------------------------------------------------------------------------->  
		<cffunction name="preUpdateCommit" hint="Called automatically before an update commit occurs.">		
		</cffunction>
		
		<cffunction name="postUpdateCommit" hint="Called automatically after an update commit occurs.">		
		</cffunction>
				
		<!-------------------------------------------------------------------------------------->
		<!--- This will be called upon any insert to a record. If nothing is created in      --->
		<!--- this function then it just goes on.                                            --->
		<!--------------------------------------------------------------------------------------> 
		<cffunction name="preInsertCommit" hint="Called automatically before an insert commit occurs.">		
		</cffunction>
		
		<cffunction name="postInsertCommit" hint="Called automatically after an insert commit occurs.">		
		</cffunction>
	
	<!---End_Custom_Functions--->


	
</cfcomponent>


