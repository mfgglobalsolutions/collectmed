 	


<cfcomponent name="pagehitActive" output="false" alias="pagehitActive">

	<cfproperty name="PageHitID" type="numeric" default="0" />
	<cfproperty name="PageID" type="numeric" default="" />
	<cfproperty name="SiteID" type="numeric" default="" />
	<cfproperty name="UsersID" type="numeric" default="" />
	<cfproperty name="IPAddress" type="string" default="" />
	<cfproperty name="BrowserType" type="string" default="" />
	<cfproperty name="BrowserVersion" type="string" default="" />
	<cfproperty name="OperatingSystem" type="string" default="" />
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
		variables.PageHitID = 0;
		variables.PageID = "";
		variables.SiteID = "";
		variables.UsersID = "";
		variables.IPAddress = "";
		variables.BrowserType = "";
		variables.BrowserVersion = "";
		variables.OperatingSystem = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="pagehitActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "PageHitID") AND stValues.PageHitID NEQ 0>
				<cfquery name="qGetPageHit" datasource="#trim(variables.ds)#">
			  		SELECT PageHitID,PageID,SiteID,UsersID,IPAddress,BrowserType,BrowserVersion,OperatingSystem,Active,InactiveCode,DateCreated,DateModified
					FROM PageHit  
					WHERE PageHitID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.PageHitID#" /> 
				</cfquery>		
				<cfif qGetPageHit.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.PageID = qGetPageHit.PageID;
					variables.SiteID = qGetPageHit.SiteID;
					variables.UsersID = qGetPageHit.UsersID;
					variables.IPAddress = qGetPageHit.IPAddress;
					variables.BrowserType = qGetPageHit.BrowserType;
					variables.BrowserVersion = qGetPageHit.BrowserVersion;
					variables.OperatingSystem = qGetPageHit.OperatingSystem;
					variables.Active = qGetPageHit.Active;
					variables.InactiveCode = qGetPageHit.InactiveCode;
					variables.DateModified = qGetPageHit.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "PageHitID")><cfset variables.PageHitID = stValues.PageHitID /></cfif>
			<cfif StructKeyExists(stValues, "PageID")><cfset variables.PageID = stValues.PageID /></cfif>
			<cfif StructKeyExists(stValues, "SiteID")><cfset variables.SiteID = stValues.SiteID /></cfif>
			<cfif StructKeyExists(stValues, "UsersID")><cfset variables.UsersID = stValues.UsersID /></cfif>
			<cfif StructKeyExists(stValues, "IPAddress")><cfset variables.IPAddress = stValues.IPAddress /></cfif>
			<cfif StructKeyExists(stValues, "BrowserType")><cfset variables.BrowserType = stValues.BrowserType /></cfif>
			<cfif StructKeyExists(stValues, "BrowserVersion")><cfset variables.BrowserVersion = stValues.BrowserVersion /></cfif>
			<cfif StructKeyExists(stValues, "OperatingSystem")><cfset variables.OperatingSystem = stValues.OperatingSystem /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PageHitID.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPageHitID" acess="public" output="false" returntype="any">
		<cfreturn variables.PageHitID>
	</cffunction>
	
	<cffunction name="setPageHitID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PageHitID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.PageHitID)) OR trim(arguments.PageHitID) EQ "">
			<cfset variables.PageHitID = arguments.PageHitID />
		<cfelse>
			<cfthrow message="PageHitID (#arguments.PageHitID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PageHitID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PageID.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPageID" acess="public" output="false" returntype="any">
		<cfreturn variables.PageID>
	</cffunction>
	
	<cffunction name="setPageID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PageID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.PageID)) OR trim(arguments.PageID) EQ "">
			<cfset variables.PageID = arguments.PageID />
		<cfelse>
			<cfthrow message="PageID (#arguments.PageID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PageID") />		
		
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
	<!--- GET and SET methods for BrowserType.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getBrowserType" acess="public" output="false" returntype="any">
		<cfreturn variables.BrowserType>
	</cffunction>
	
	<cffunction name="setBrowserType" acess="public" output="false" returntype="boolean">
		
		<cfargument name="BrowserType" required="true" type="any" />
			
		<cfset variables.BrowserType = arguments.BrowserType />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "BrowserType") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for BrowserVersion.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getBrowserVersion" acess="public" output="false" returntype="any">
		<cfreturn variables.BrowserVersion>
	</cffunction>
	
	<cffunction name="setBrowserVersion" acess="public" output="false" returntype="boolean">
		
		<cfargument name="BrowserVersion" required="true" type="any" />
			
		<cfset variables.BrowserVersion = arguments.BrowserVersion />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "BrowserVersion") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OperatingSystem.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOperatingSystem" acess="public" output="false" returntype="any">
		<cfreturn variables.OperatingSystem>
	</cffunction>
	
	<cffunction name="setOperatingSystem" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OperatingSystem" required="true" type="any" />
			
		<cfset variables.OperatingSystem = arguments.OperatingSystem />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OperatingSystem") />		
		
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
				 		
		<cfif this.getPageHitID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getPageHitID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPageHit" output="false" access="public" returntype="query">
				
		<cfargument name="PageHitID" required="yes" type="numeric" />		
		<cfset var qGetPageHit = "" />		
	
		<cfquery name="qGetPageHit" datasource="#trim(variables.ds)#">
	  		SELECT PageHitID,PageID,SiteID,UsersID,IPAddress,BrowserType,BrowserVersion,OperatingSystem,Active,InactiveCode,DateCreated,DateModified
			FROM PageHit  
			WHERE PageHitID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.PageHitID)#" /> 
		</cfquery>
		
		<cfreturn qGetPageHit>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="PageHitActive" />
		
		<cfset var qCreatePageHit = "" />		
		
		<cfset var localPageID = arguments.obj.getPageID() />
		<cfset var localSiteID = arguments.obj.getSiteID() />
		<cfset var localUsersID = arguments.obj.getUsersID() />
		<cfset var localIPAddress = arguments.obj.getIPAddress() />
		<cfset var localBrowserType = arguments.obj.getBrowserType() />
		<cfset var localBrowserVersion = arguments.obj.getBrowserVersion() />
		<cfset var localOperatingSystem = arguments.obj.getOperatingSystem() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreatePageHit" datasource="#trim(variables.ds)#">
				INSERT INTO PageHit (PageID,SiteID,UsersID,IPAddress,BrowserType,BrowserVersion,OperatingSystem,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(localPageID))>						
						<cfqueryparam value="#trim(localPageID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,				
					<cfif IsNumeric(trim(localUsersID))>						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localIPAddress) NEQ "" AND trim(localIPAddress) NEQ "@@" AND trim(localIPAddress) NEQ "NULL">						
						<cfqueryparam value="#trim(localIPAddress)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localBrowserType) NEQ "" AND trim(localBrowserType) NEQ "@@" AND trim(localBrowserType) NEQ "NULL">						
						<cfqueryparam value="#trim(localBrowserType)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localBrowserVersion) NEQ "" AND trim(localBrowserVersion) NEQ "@@" AND trim(localBrowserVersion) NEQ "NULL">						
						<cfqueryparam value="#trim(localBrowserVersion)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localOperatingSystem) NEQ "" AND trim(localOperatingSystem) NEQ "@@" AND trim(localOperatingSystem) NEQ "NULL">						
						<cfqueryparam value="#trim(localOperatingSystem)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS PageHitID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreatePageHit.PageHitID);
			arguments.obj.setPageHitID(qCreatePageHit.PageHitID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="PageHitActive">
				
		<cfargument name="PageHitID" required="yes" type="numeric" />		
		<cfset var qGetPageHit = "" />		
		
		<cfset qGetPageHit = getPageHit(trim(PageHitID)) />
				
		<cfif qGetPageHit.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setPageHitID(qGetPageHit.PageHitID);
			this.setPageID(qGetPageHit.PageID);
			this.setSiteID(qGetPageHit.SiteID);
			this.setUsersID(qGetPageHit.UsersID);
			this.setIPAddress(qGetPageHit.IPAddress);
			this.setBrowserType(qGetPageHit.BrowserType);
			this.setBrowserVersion(qGetPageHit.BrowserVersion);
			this.setOperatingSystem(qGetPageHit.OperatingSystem);
			this.setActive(qGetPageHit.Active);
			this.setInactiveCode(qGetPageHit.InactiveCode);
			this.setDateCreated(qGetPageHit.DateCreated);
			this.setDateModified(qGetPageHit.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="PageHitActive" />
		<cfset var qUpdatePageHit = "" />
		<cfset var localPageID = arguments.obj.getPageID() />
		<cfset var localSiteID = arguments.obj.getSiteID() />
		<cfset var localUsersID = arguments.obj.getUsersID() />
		<cfset var localIPAddress = arguments.obj.getIPAddress() />
		<cfset var localBrowserType = arguments.obj.getBrowserType() />
		<cfset var localBrowserVersion = arguments.obj.getBrowserVersion() />
		<cfset var localOperatingSystem = arguments.obj.getOperatingSystem() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdatePageHit" datasource="#trim(variables.ds)#">
				UPDATE PageHit  SET
					
					PageID =				
					<cfif IsNumeric(trim(localPageID))>						
						<cfqueryparam value="#trim(localPageID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					SiteID =				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					UsersID =				
					<cfif IsNumeric(trim(localUsersID))>						
						<cfqueryparam value="#trim(localUsersID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					IPAddress =	
					<cfif trim(localIPAddress) NEQ "" AND trim(localIPAddress) NEQ "@@" AND trim(localIPAddress) NEQ "NULL">						
						<cfqueryparam value="#trim(localIPAddress)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					BrowserType =	
					<cfif trim(localBrowserType) NEQ "" AND trim(localBrowserType) NEQ "@@" AND trim(localBrowserType) NEQ "NULL">						
						<cfqueryparam value="#trim(localBrowserType)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					BrowserVersion =	
					<cfif trim(localBrowserVersion) NEQ "" AND trim(localBrowserVersion) NEQ "@@" AND trim(localBrowserVersion) NEQ "NULL">						
						<cfqueryparam value="#trim(localBrowserVersion)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					OperatingSystem =	
					<cfif trim(localOperatingSystem) NEQ "" AND trim(localOperatingSystem) NEQ "@@" AND trim(localOperatingSystem) NEQ "NULL">						
						<cfqueryparam value="#trim(localOperatingSystem)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
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
				WHERE PageHitID = <cfqueryparam value="#trim(arguments.obj.getPageHitID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="PageHitActive" />
		<cfset var qDeletePageHit = "">

		<cfquery name="qDeletePageHit" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM PageHit
			WHERE PageHitID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getPageHitID())#" /> 
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


