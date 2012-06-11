 	


<cfcomponent name="usersActive" output="false" alias="usersActive">

	<cfproperty name="UsersID" type="numeric" default="0" />
	<cfproperty name="SiteID" type="numeric" default="" />
	<cfproperty name="ClientID" type="numeric" default="" />
	<cfproperty name="EntityID" type="numeric" default="" />
	<cfproperty name="Entry" type="string" default="" />
	<cfproperty name="EntryPoint" type="string" default="" />
	<cfproperty name="EntryQID" type="numeric" default="" />
	<cfproperty name="EntryResponse" type="string" default="" />
	<cfproperty name="ChangedPassword" type="string" default="" />
	<cfproperty name="LastOpenedClaimID" type="numeric" default="" />
	<cfproperty name="Suspend" type="string" default="" />
	<cfproperty name="LoginStart" type="datetime" default="" />
	<cfproperty name="LoginEnd" type="datetime" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.ds = "";
		variables.changedVariables = "";
		variables.UsersID = 0;
		variables.SiteID = "";
		variables.ClientID = "";
		variables.EntityID = "";
		variables.Entry = "";
		variables.EntryPoint = "";
		variables.EntryQID = "";
		variables.EntryResponse = "";
		variables.ChangedPassword = "";
		variables.LastOpenedClaimID = "";
		variables.Suspend = "";
		variables.LoginStart = "";
		variables.LoginEnd = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="usersActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "UsersID") AND stValues.UsersID NEQ 0>
				<cfquery name="qGetUsers" datasource="#trim(variables.ds)#">
			  		SELECT UsersID,SiteID,ClientID,EntityID,Entry,EntryPoint,EntryQID,EntryResponse,ChangedPassword,LastOpenedClaimID,Suspend,LoginStart,LoginEnd,Active,InactiveCode,DateCreated,DateModified
					FROM users  
					WHERE UsersID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.UsersID#" /> 
				</cfquery>		
				<cfif qGetUsers.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.SiteID = qGetUsers.SiteID;
					variables.ClientID = qGetUsers.ClientID;
					variables.EntityID = qGetUsers.EntityID;
					variables.Entry = qGetUsers.Entry;
					variables.EntryPoint = qGetUsers.EntryPoint;
					variables.EntryQID = qGetUsers.EntryQID;
					variables.EntryResponse = qGetUsers.EntryResponse;
					variables.ChangedPassword = qGetUsers.ChangedPassword;
					variables.LastOpenedClaimID = qGetUsers.LastOpenedClaimID;
					variables.Suspend = qGetUsers.Suspend;
					variables.LoginStart = qGetUsers.LoginStart;
					variables.LoginEnd = qGetUsers.LoginEnd;
					variables.Active = qGetUsers.Active;
					variables.InactiveCode = qGetUsers.InactiveCode;
					variables.DateModified = qGetUsers.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "UsersID")><cfset variables.UsersID = stValues.UsersID /></cfif>
			<cfif StructKeyExists(stValues, "SiteID")><cfset variables.SiteID = stValues.SiteID /></cfif>
			<cfif StructKeyExists(stValues, "ClientID")><cfset variables.ClientID = stValues.ClientID /></cfif>
			<cfif StructKeyExists(stValues, "EntityID")><cfset variables.EntityID = stValues.EntityID /></cfif>
			<cfif StructKeyExists(stValues, "Entry")><cfset variables.Entry = stValues.Entry /></cfif>
			<cfif StructKeyExists(stValues, "EntryPoint")><cfset variables.EntryPoint = stValues.EntryPoint /></cfif>
			<cfif StructKeyExists(stValues, "EntryQID")><cfset variables.EntryQID = stValues.EntryQID /></cfif>
			<cfif StructKeyExists(stValues, "EntryResponse")><cfset variables.EntryResponse = stValues.EntryResponse /></cfif>
			<cfif StructKeyExists(stValues, "ChangedPassword")><cfset variables.ChangedPassword = stValues.ChangedPassword /></cfif>
			<cfif StructKeyExists(stValues, "LastOpenedClaimID")><cfset variables.LastOpenedClaimID = stValues.LastOpenedClaimID /></cfif>
			<cfif StructKeyExists(stValues, "Suspend")><cfset variables.Suspend = stValues.Suspend /></cfif>
			<cfif StructKeyExists(stValues, "LoginStart")><cfset variables.LoginStart = stValues.LoginStart /></cfif>
			<cfif StructKeyExists(stValues, "LoginEnd")><cfset variables.LoginEnd = stValues.LoginEnd /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for UsersID.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getUsersID" acess="public" output="false" returntype="any">
		<cfreturn variables.UsersID>
	</cffunction>
	
	<cffunction name="setUsersID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="UsersID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.UsersID)) OR trim(arguments.UsersID) EQ "">
			<cfset variables.UsersID = arguments.UsersID />
		<cfelse>
			<cfthrow message="UsersID (#arguments.UsersID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "UsersID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for SiteID.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSiteID" acess="public" output="false" returntype="any">
		<cfreturn variables.SiteID>
	</cffunction>
	
	<cffunction name="setSiteID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="SiteID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.SiteID)) OR trim(arguments.SiteID) EQ "">
			<cfset variables.SiteID = arguments.SiteID />
		<cfelse>
			<cfthrow message="SiteID (#arguments.SiteID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "SiteID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ClientID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getClientID" acess="public" output="false" returntype="any">
		<cfreturn variables.ClientID>
	</cffunction>
	
	<cffunction name="setClientID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ClientID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ClientID)) OR trim(arguments.ClientID) EQ "">
			<cfset variables.ClientID = arguments.ClientID />
		<cfelse>
			<cfthrow message="ClientID (#arguments.ClientID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ClientID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EntityID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEntityID" acess="public" output="false" returntype="any">
		<cfreturn variables.EntityID>
	</cffunction>
	
	<cffunction name="setEntityID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EntityID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EntityID)) OR trim(arguments.EntityID) EQ "">
			<cfset variables.EntityID = arguments.EntityID />
		<cfelse>
			<cfthrow message="EntityID (#arguments.EntityID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EntityID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Entry.                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEntry" acess="public" output="false" returntype="any">
		<cfreturn variables.Entry>
	</cffunction>
	
	<cffunction name="setEntry" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Entry" required="true" type="any" />
			
		<cfset variables.Entry = arguments.Entry />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Entry") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EntryPoint.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEntryPoint" acess="public" output="false" returntype="any">
		<cfreturn variables.EntryPoint>
	</cffunction>
	
	<cffunction name="setEntryPoint" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EntryPoint" required="true" type="any" />
			
		<cfset variables.EntryPoint = arguments.EntryPoint />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EntryPoint") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EntryQID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEntryQID" acess="public" output="false" returntype="any">
		<cfreturn variables.EntryQID>
	</cffunction>
	
	<cffunction name="setEntryQID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EntryQID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EntryQID)) OR trim(arguments.EntryQID) EQ "">
			<cfset variables.EntryQID = arguments.EntryQID />
		<cfelse>
			<cfthrow message="EntryQID (#arguments.EntryQID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EntryQID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EntryResponse.                                         --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEntryResponse" acess="public" output="false" returntype="any">
		<cfreturn variables.EntryResponse>
	</cffunction>
	
	<cffunction name="setEntryResponse" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EntryResponse" required="true" type="any" />
			
		<cfset variables.EntryResponse = arguments.EntryResponse />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EntryResponse") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ChangedPassword.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getChangedPassword" acess="public" output="false" returntype="any">
		<cfreturn variables.ChangedPassword>
	</cffunction>
	
	<cffunction name="setChangedPassword" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ChangedPassword" required="true" type="any" />
			
		<cfset variables.ChangedPassword = arguments.ChangedPassword />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ChangedPassword") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LastOpenedClaimID.                                     --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLastOpenedClaimID" acess="public" output="false" returntype="any">
		<cfreturn variables.LastOpenedClaimID>
	</cffunction>
	
	<cffunction name="setLastOpenedClaimID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LastOpenedClaimID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.LastOpenedClaimID)) OR trim(arguments.LastOpenedClaimID) EQ "">
			<cfset variables.LastOpenedClaimID = arguments.LastOpenedClaimID />
		<cfelse>
			<cfthrow message="LastOpenedClaimID (#arguments.LastOpenedClaimID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LastOpenedClaimID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Suspend.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getSuspend" acess="public" output="false" returntype="any">
		<cfreturn variables.Suspend>
	</cffunction>
	
	<cffunction name="setSuspend" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Suspend" required="true" type="any" />
			
		<cfset variables.Suspend = arguments.Suspend />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Suspend") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LoginStart.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLoginStart" acess="public" output="false" returntype="any">
		<cfreturn variables.LoginStart>
	</cffunction>
	
	<cffunction name="setLoginStart" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LoginStart" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.LoginStart)) OR trim(arguments.LoginStart) EQ "">
			<cfset variables.LoginStart = arguments.LoginStart />
		<cfelse>
			<cfthrow message="LoginStart (#arguments.LoginStart#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LoginStart") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LoginEnd.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLoginEnd" acess="public" output="false" returntype="any">
		<cfreturn variables.LoginEnd>
	</cffunction>
	
	<cffunction name="setLoginEnd" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LoginEnd" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.LoginEnd)) OR trim(arguments.LoginEnd) EQ "">
			<cfset variables.LoginEnd = arguments.LoginEnd />
		<cfelse>
			<cfthrow message="LoginEnd (#arguments.LoginEnd#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LoginEnd") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Active.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getActive" acess="public" output="false" returntype="any">
		<cfreturn variables.Active>
	</cffunction>
	
	<cffunction name="setActive" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Active" required="true" type="any" />
			
		<cfset variables.Active = arguments.Active />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Active") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for InactiveCode.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getInactiveCode" acess="public" output="false" returntype="any">
		<cfreturn variables.InactiveCode>
	</cffunction>
	
	<cffunction name="setInactiveCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="InactiveCode" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.InactiveCode)) OR trim(arguments.InactiveCode) EQ "">
			<cfset variables.InactiveCode = arguments.InactiveCode />
		<cfelse>
			<cfthrow message="InactiveCode (#arguments.InactiveCode#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "InactiveCode") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateCreated.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateCreated" acess="public" output="false" returntype="any">
		<cfreturn variables.DateCreated>
	</cffunction>
	
	<cffunction name="setDateCreated" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateCreated" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateCreated)) OR trim(arguments.DateCreated) EQ "">
			<cfset variables.DateCreated = arguments.DateCreated />
		<cfelse>
			<cfthrow message="DateCreated (#arguments.DateCreated#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateCreated") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DateModified.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDateModified" acess="public" output="false" returntype="any">
		<cfreturn variables.DateModified>
	</cffunction>
	
	<cffunction name="setDateModified" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DateModified" required="true" type="any" />
			
		<cfif IsDate(trim(arguments.DateModified)) OR trim(arguments.DateModified) EQ "">
			<cfset variables.DateModified = arguments.DateModified />
		<cfelse>
			<cfthrow message="DateModified (#arguments.DateModified#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DateModified") />		
		
		<cfreturn true>
		
	</cffunction>
		

	<!-------------------------------------------------------------------------------------->
	<!--- Use this function save a record by an ID.                                      --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="save" output="false" access="remote">
				 		
		<cfif this.getUsersID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getUsersID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUsers" output="false" access="public" returntype="query">
				
		<cfargument name="UsersID" required="yes" type="numeric" />		
		<cfset var qGetUsers = "" />		
	
		<cfquery name="qGetUsers" datasource="#trim(variables.ds)#">
	  		SELECT UsersID,SiteID,ClientID,EntityID,Entry,EntryPoint,EntryQID,EntryResponse,ChangedPassword,LastOpenedClaimID,Suspend,LoginStart,LoginEnd,Active,InactiveCode,DateCreated,DateModified
			FROM users  
			WHERE UsersID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.UsersID)#" /> 
		</cfquery>
		
		<cfreturn qGetUsers>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="UsersActive" />
		
		<cfset var qCreateUsers = "" />		
		
		<cfset var localSiteID = arguments.obj.getSiteID() />
		<cfset var localClientID = arguments.obj.getClientID() />
		<cfset var localEntityID = arguments.obj.getEntityID() />
		<cfset var localEntry = arguments.obj.getEntry() />
		<cfset var localEntryPoint = arguments.obj.getEntryPoint() />
		<cfset var localEntryQID = arguments.obj.getEntryQID() />
		<cfset var localEntryResponse = arguments.obj.getEntryResponse() />
		<cfset var localChangedPassword = arguments.obj.getChangedPassword() />
		<cfset var localLastOpenedClaimID = arguments.obj.getLastOpenedClaimID() />
		<cfset var localSuspend = arguments.obj.getSuspend() />
		<cfset var localLoginStart = arguments.obj.getLoginStart() />
		<cfset var localLoginEnd = arguments.obj.getLoginEnd() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateUsers" datasource="#trim(variables.ds)#">
				INSERT INTO users (SiteID,ClientID,EntityID,Entry,EntryPoint,EntryQID,EntryResponse,LastOpenedClaimID,LoginStart,LoginEnd,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />,	
					<cfif trim(localEntry) NEQ "" AND trim(localEntry) NEQ "@@" AND trim(localEntry) NEQ "NULL">						
						<cfqueryparam value="#trim(localEntry)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localEntryPoint) NEQ "" AND trim(localEntryPoint) NEQ "@@" AND trim(localEntryPoint) NEQ "NULL">						
						<cfqueryparam value="#trim(localEntryPoint)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localEntryQID))>						
						<cfqueryparam value="#trim(localEntryQID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localEntryResponse) NEQ "" AND trim(localEntryResponse) NEQ "@@" AND trim(localEntryResponse) NEQ "NULL">						
						<cfqueryparam value="#trim(localEntryResponse)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localLastOpenedClaimID))>						
						<cfqueryparam value="#trim(localLastOpenedClaimID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif IsDate(trim(localLoginStart))>						
						<cfqueryparam value="#trim(localLoginStart)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,	
					<cfif IsDate(trim(localLoginEnd))>						
						<cfqueryparam value="#trim(localLoginEnd)#" cfsqltype="CF_SQL_TIMESTAMP" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS UsersID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateUsers.UsersID);
			arguments.obj.setUsersID(qCreateUsers.UsersID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="UsersActive">
				
		<cfargument name="UsersID" required="yes" type="numeric" />		
		<cfset var qGetUsers = "" />		
		
		<cfset qGetUsers = getUsers(trim(UsersID)) />
				
		<cfif qGetUsers.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setUsersID(qGetUsers.UsersID);
			this.setSiteID(qGetUsers.SiteID);
			this.setClientID(qGetUsers.ClientID);
			this.setEntityID(qGetUsers.EntityID);
			this.setEntry(qGetUsers.Entry);
			this.setEntryPoint(qGetUsers.EntryPoint);
			this.setEntryQID(qGetUsers.EntryQID);
			this.setEntryResponse(qGetUsers.EntryResponse);
			this.setChangedPassword(qGetUsers.ChangedPassword);
			this.setLastOpenedClaimID(qGetUsers.LastOpenedClaimID);
			this.setSuspend(qGetUsers.Suspend);
			this.setLoginStart(qGetUsers.LoginStart);
			this.setLoginEnd(qGetUsers.LoginEnd);
			this.setActive(qGetUsers.Active);
			this.setInactiveCode(qGetUsers.InactiveCode);
			this.setDateCreated(qGetUsers.DateCreated);
			this.setDateModified(qGetUsers.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="UsersActive" />
		<cfset var qUpdateUsers = "" />
		<cfset var localSiteID = arguments.obj.getSiteID() />
		<cfset var localClientID = arguments.obj.getClientID() />
		<cfset var localEntityID = arguments.obj.getEntityID() />
		<cfset var localEntry = arguments.obj.getEntry() />
		<cfset var localEntryPoint = arguments.obj.getEntryPoint() />
		<cfset var localEntryQID = arguments.obj.getEntryQID() />
		<cfset var localEntryResponse = arguments.obj.getEntryResponse() />
		<cfset var localChangedPassword = arguments.obj.getChangedPassword() />
		<cfset var localLastOpenedClaimID = arguments.obj.getLastOpenedClaimID() />
		<cfset var localSuspend = arguments.obj.getSuspend() />
		<cfset var localLoginStart = arguments.obj.getLoginStart() />
		<cfset var localLoginEnd = arguments.obj.getLoginEnd() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateUsers" datasource="#trim(variables.ds)#">
				UPDATE users  SET
					
					SiteID =				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ClientID =						
						<cfqueryparam value="#trim(localClientID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					EntityID =						
						<cfqueryparam value="#trim(localEntityID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					Entry =	
					<cfif trim(localEntry) NEQ "" AND trim(localEntry) NEQ "@@" AND trim(localEntry) NEQ "NULL">						
						<cfqueryparam value="#trim(localEntry)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					EntryPoint =	
					<cfif trim(localEntryPoint) NEQ "" AND trim(localEntryPoint) NEQ "@@" AND trim(localEntryPoint) NEQ "NULL">						
						<cfqueryparam value="#trim(localEntryPoint)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					EntryQID =				
					<cfif IsNumeric(trim(localEntryQID))>						
						<cfqueryparam value="#trim(localEntryQID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					EntryResponse =	
					<cfif trim(localEntryResponse) NEQ "" AND trim(localEntryResponse) NEQ "@@" AND trim(localEntryResponse) NEQ "NULL">						
						<cfqueryparam value="#trim(localEntryResponse)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ChangedPassword =						
						<cfqueryparam value="#trim(localChangedPassword)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					LastOpenedClaimID =				
					<cfif IsNumeric(trim(localLastOpenedClaimID))>						
						<cfqueryparam value="#trim(localLastOpenedClaimID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					Suspend =						
						<cfqueryparam value="#trim(localSuspend)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					LoginStart =	
					<cfif IsDate(trim(localLoginStart))>						
						<cfqueryparam value="#trim(localLoginStart)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					LoginEnd =	
					<cfif IsDate(trim(localLoginEnd))>						
						<cfqueryparam value="#trim(localLoginEnd)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>,
					
					Active =						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					InactiveCode =				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					DateModified =	
					<cfif IsDate(trim(localDateModified))>						
						<cfqueryparam value="#trim(localDateModified)#" cfsqltype="CF_SQL_TIMESTAMP" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_TIMESTAMP" />
					</cfif>					
				WHERE UsersID = <cfqueryparam value="#trim(arguments.obj.getUsersID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="UsersActive" />
		<cfset var qDeleteUsers = "">

		<cfquery name="qDeleteUsers" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM users
			WHERE UsersID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getUsersID())#" /> 
		</cfquery>

	</cffunction>



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>




