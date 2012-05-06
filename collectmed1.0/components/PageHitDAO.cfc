 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="PageHitBean" />
		
		<cfset var qCreatePageHit = "" />		
		
		<cfset var localPageID = arguments.bean.getPageID() />
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localIPAddress = arguments.bean.getIPAddress() />
		<cfset var localBrowserType = arguments.bean.getBrowserType() />
		<cfset var localBrowserVersion = arguments.bean.getBrowserVersion() />
		<cfset var localOperatingSystem = arguments.bean.getOperatingSystem() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreatePageHit" datasource="#trim(arguments.ds)#">
				INSERT INTO PageHit (PageID,SiteID,UsersID,IPAddress,BrowserType,BrowserVersion,OperatingSystem,Active,InactiveCode)
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
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
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
			arguments.bean.setPageHitID(qCreatePageHit.PageHitID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="PageHitBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="PageHitID" required="yes" type="numeric" />		
		<cfset var qGetPageHit = "" />		
		
		<cfset qGetPageHit = getPageHit(trim(arguments.ds), trim(PageHitID)) />
				
		<cfif qGetPageHit.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objPageHit = createObject("component", "PageHitBean").init(arguments.ds);
			objPageHit.setPageHitID(qGetPageHit.PageHitID);
			objPageHit.setPageID(qGetPageHit.PageID);
			objPageHit.setSiteID(qGetPageHit.SiteID);
			objPageHit.setUsersID(qGetPageHit.UsersID);
			objPageHit.setIPAddress(qGetPageHit.IPAddress);
			objPageHit.setBrowserType(qGetPageHit.BrowserType);
			objPageHit.setBrowserVersion(qGetPageHit.BrowserVersion);
			objPageHit.setOperatingSystem(qGetPageHit.OperatingSystem);
			objPageHit.setActive(qGetPageHit.Active);
			objPageHit.setInactiveCode(qGetPageHit.InactiveCode);
			objPageHit.setDateCreated(qGetPageHit.DateCreated);
			objPageHit.setDateModified(qGetPageHit.DateModified);				
			return objPageHit;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="PageHitBean" />
		<cfset var qUpdatePageHit = "" />
		<cfset var localPageID = arguments.bean.getPageID() />
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localUsersID = arguments.bean.getUsersID() />
		<cfset var localIPAddress = arguments.bean.getIPAddress() />
		<cfset var localBrowserType = arguments.bean.getBrowserType() />
		<cfset var localBrowserVersion = arguments.bean.getBrowserVersion() />
		<cfset var localOperatingSystem = arguments.bean.getOperatingSystem() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdatePageHit" datasource="#trim(arguments.ds)#">
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
				WHERE PageHitID = <cfqueryparam value="#trim(arguments.bean.getPageHitID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="PageHitBean" />
		<cfset var qDeletePageHit = "">

		<cfquery name="qDeletePageHit" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM PageHit
			WHERE PageHitID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getPageHitID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getPageHit" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="PageHitID" required="yes" type="numeric" />		
		<cfset var qGetPageHit = "" />		
	
		<cfquery name="qGetPageHit" datasource="#trim(arguments.ds)#">
	  		SELECT PageHitID,PageID,SiteID,UsersID,IPAddress,BrowserType,BrowserVersion,OperatingSystem,Active,InactiveCode,DateCreated,DateModified
			FROM PageHit  
			WHERE PageHitID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.PageHitID)#" /> 
		</cfquery>
		
		<cfreturn qGetPageHit>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


