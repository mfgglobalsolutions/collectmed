 	


<cfcomponent name="userssessionActive" output="false" alias="userssessionActive">

	<cfproperty name="UsersSessionID" type="numeric" default="0" />
	<cfproperty name="UsersSessionIdentification" type="string" default="" />
	<cfproperty name="UsersID" type="numeric" default="" />
	<cfproperty name="IPAddress" type="string" default="" />
	<cfproperty name="SiteID" type="numeric" default="" />
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
		variables.UsersSessionID = 0;
		variables.UsersSessionIdentification = "";
		variables.UsersID = "";
		variables.IPAddress = "";
		variables.SiteID = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="userssessionActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "UsersSessionID") AND stValues.UsersSessionID NEQ 0>
				<cfquery name="qGetUsersSession" datasource="#trim(variables.ds)#">
			  		SELECT UsersSessionID,UsersSessionIdentification,UsersID,IPAddress,SiteID,Active,InactiveCode,DateCreated,DateModified
					FROM UsersSession  
					WHERE UsersSessionID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.UsersSessionID#" /> 
				</cfquery>		
				<cfif qGetUsersSession.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.UsersSessionIdentification = qGetUsersSession.UsersSessionIdentification;
					variables.UsersID = qGetUsersSession.UsersID;
					variables.IPAddress = qGetUsersSession.IPAddress;
					variables.SiteID = qGetUsersSession.SiteID;
					variables.Active = qGetUsersSession.Active;
					variables.InactiveCode = qGetUsersSession.InactiveCode;
					variables.DateModified = qGetUsersSession.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "UsersSessionID")><cfset variables.UsersSessionID = stValues.UsersSessionID /></cfif>
			<cfif StructKeyExists(stValues, "UsersSessionIdentification")><cfset variables.UsersSessionIdentification = stValues.UsersSessionIdentification /></cfif>
			<cfif StructKeyExists(stValues, "UsersID")><cfset variables.UsersID = stValues.UsersID /></cfif>
			<cfif StructKeyExists(stValues, "IPAddress")><cfset variables.IPAddress = stValues.IPAddress /></cfif>
			<cfif StructKeyExists(stValues, "SiteID")><cfset variables.SiteID = stValues.SiteID /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for UsersSessionID.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getUsersSessionID" acess="public" output="false" returntype="any">
		<cfreturn variables.UsersSessionID>
	</cffunction>
	
	<cffunction name="setUsersSessionID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="UsersSessionID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.UsersSessionID)) OR trim(arguments.UsersSessionID) EQ "">
			<cfset variables.UsersSessionID = arguments.UsersSessionID />
		<cfelse>
			<cfthrow message="UsersSessionID (#arguments.UsersSessionID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "UsersSessionID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for UsersSessionIdentification.                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getUsersSessionIdentification" acess="public" output="false" returntype="any">
		<cfreturn variables.UsersSessionIdentification>
	</cffunction>
	
	<cffunction name="setUsersSessionIdentification" acess="public" output="false" returntype="boolean">
		
		<cfargument name="UsersSessionIdentification" required="true" type="any" />
			
		<cfset variables.UsersSessionIdentification = arguments.UsersSessionIdentification />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "UsersSessionIdentification") />		
		
		<cfreturn true>
		
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
	<!--- GET and SET methods for IPAddress.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getIPAddress" acess="public" output="false" returntype="any">
		<cfreturn variables.IPAddress>
	</cffunction>
	
	<cffunction name="setIPAddress" acess="public" output="false" returntype="boolean">
		
		<cfargument name="IPAddress" required="true" type="any" />
			
		<cfset variables.IPAddress = arguments.IPAddress />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "IPAddress") />		
		
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
				 		
		<cfif this.getUsersSessionID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getUsersSessionID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getUsersSession" output="false" access="public" returntype="query">
				
		<cfargument name="UsersSessionID" required="yes" type="numeric" />		
		<cfset var qGetUsersSession = "" />		
	
		<cfquery name="qGetUsersSession" datasource="#trim(variables.ds)#">
	  		SELECT UsersSessionID,UsersSessionIdentification,UsersID,IPAddress,SiteID,Active,InactiveCode,DateCreated,DateModified
			FROM UsersSession  
			WHERE UsersSessionID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.UsersSessionID)#" /> 
		</cfquery>
		
		<cfreturn qGetUsersSession>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="UsersSessionActive" />
		
		<cfset var qCreateUsersSession = "" />		
		
		<cfset var localUsersSessionIdentification = arguments.obj.getUsersSessionIdentification() />
		<cfset var localUsersID = arguments.obj.getUsersID() />
		<cfset var localIPAddress = arguments.obj.getIPAddress() />
		<cfset var localSiteID = arguments.obj.getSiteID() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateUsersSession" datasource="#trim(variables.ds)#">
				INSERT INTO UsersSession (UsersSessionIdentification,UsersID,IPAddress,SiteID,InactiveCode)
				VALUES (	
					<cfif trim(localUsersSessionIdentification) NEQ "" AND trim(localUsersSessionIdentification) NEQ "@@" AND trim(localUsersSessionIdentification) NEQ "NULL">						
						<cfqueryparam value="#trim(localUsersSessionIdentification)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,	
					<cfif trim(localIPAddress) NEQ "" AND trim(localIPAddress) NEQ "@@" AND trim(localIPAddress) NEQ "NULL">						
						<cfqueryparam value="#trim(localIPAddress)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS UsersSessionID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateUsersSession.UsersSessionID);
			arguments.obj.setUsersSessionID(qCreateUsersSession.UsersSessionID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="UsersSessionActive">
				
		<cfargument name="UsersSessionID" required="yes" type="numeric" />		
		<cfset var qGetUsersSession = "" />		
		
		<cfset qGetUsersSession = getUsersSession(trim(UsersSessionID)) />
				
		<cfif qGetUsersSession.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setUsersSessionID(qGetUsersSession.UsersSessionID);
			this.setUsersSessionIdentification(qGetUsersSession.UsersSessionIdentification);
			this.setUsersID(qGetUsersSession.UsersID);
			this.setIPAddress(qGetUsersSession.IPAddress);
			this.setSiteID(qGetUsersSession.SiteID);
			this.setActive(qGetUsersSession.Active);
			this.setInactiveCode(qGetUsersSession.InactiveCode);
			this.setDateCreated(qGetUsersSession.DateCreated);
			this.setDateModified(qGetUsersSession.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="UsersSessionActive" />
		<cfset var qUpdateUsersSession = "" />
		<cfset var localUsersSessionIdentification = arguments.obj.getUsersSessionIdentification() />
		<cfset var localUsersID = arguments.obj.getUsersID() />
		<cfset var localIPAddress = arguments.obj.getIPAddress() />
		<cfset var localSiteID = arguments.obj.getSiteID() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateUsersSession" datasource="#trim(variables.ds)#">
				UPDATE UsersSession  SET
					
					UsersSessionIdentification =	
					<cfif trim(localUsersSessionIdentification) NEQ "" AND trim(localUsersSessionIdentification) NEQ "@@" AND trim(localUsersSessionIdentification) NEQ "NULL">						
						<cfqueryparam value="#trim(localUsersSessionIdentification)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					UsersID =						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					IPAddress =	
					<cfif trim(localIPAddress) NEQ "" AND trim(localIPAddress) NEQ "@@" AND trim(localIPAddress) NEQ "NULL">						
						<cfqueryparam value="#trim(localIPAddress)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					SiteID =						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
				WHERE UsersSessionID = <cfqueryparam value="#trim(arguments.obj.getUsersSessionID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="UsersSessionActive" />
		<cfset var qDeleteUsersSession = "">

		<cfquery name="qDeleteUsersSession" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM UsersSession
			WHERE UsersSessionID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getUsersSessionID())#" /> 
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


