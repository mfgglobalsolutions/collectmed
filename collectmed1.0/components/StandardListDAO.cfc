 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="StandardListBean" />
		
		<cfset var qCreateStandardList = "" />		
		
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localListName = arguments.bean.getListName() />
		<cfset var localListDescription = arguments.bean.getListDescription() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateStandardList" datasource="#trim(arguments.ds)#">
				INSERT INTO standardlist (SiteID,ListName,ListDescription,Active,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,						
						<cfqueryparam value="#trim(localListName)#" cfsqltype="CF_SQL_VARCHAR" />,	
					<cfif trim(localListDescription) NEQ "" AND trim(localListDescription) NEQ "@@" AND trim(localListDescription) NEQ "NULL">						
						<cfqueryparam value="#trim(localListDescription)#" cfsqltype="CF_SQL_VARCHAR" />							
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
				SELECT LAST_INSERT_ID() AS StandardListID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setStandardListID(qCreateStandardList.StandardListID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="StandardListBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="StandardListID" required="yes" type="numeric" />		
		<cfset var qGetStandardList = "" />		
		
		<cfset qGetStandardList = getStandardList(trim(arguments.ds), trim(StandardListID)) />
				
		<cfif qGetStandardList.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objStandardList = createObject("component", "StandardListBean").init(arguments.ds);
			objStandardList.setStandardListID(qGetStandardList.StandardListID);
			objStandardList.setSiteID(qGetStandardList.SiteID);
			objStandardList.setListName(qGetStandardList.ListName);
			objStandardList.setListDescription(qGetStandardList.ListDescription);
			objStandardList.setActive(qGetStandardList.Active);
			objStandardList.setInactiveCode(qGetStandardList.InactiveCode);
			objStandardList.setDateCreated(qGetStandardList.DateCreated);
			objStandardList.setDateModified(qGetStandardList.DateModified);				
			return objStandardList;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="StandardListBean" />
		<cfset var qUpdateStandardList = "" />
		<cfset var localSiteID = arguments.bean.getSiteID() />
		<cfset var localListName = arguments.bean.getListName() />
		<cfset var localListDescription = arguments.bean.getListDescription() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateStandardList" datasource="#trim(arguments.ds)#">
				UPDATE standardlist  SET
					
					SiteID =				
					<cfif IsNumeric(trim(localSiteID))>						
						<cfqueryparam value="#trim(localSiteID)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					ListName =						
						<cfqueryparam value="#trim(localListName)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					ListDescription =	
					<cfif trim(localListDescription) NEQ "" AND trim(localListDescription) NEQ "@@" AND trim(localListDescription) NEQ "NULL">						
						<cfqueryparam value="#trim(localListDescription)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE StandardListID = <cfqueryparam value="#trim(arguments.bean.getStandardListID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="StandardListBean" />
		<cfset var qDeleteStandardList = "">

		<cfquery name="qDeleteStandardList" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM standardlist
			WHERE StandardListID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getStandardListID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getStandardList" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="StandardListID" required="yes" type="numeric" />		
		<cfset var qGetStandardList = "" />		
	
		<cfquery name="qGetStandardList" datasource="#trim(arguments.ds)#">
	  		SELECT StandardListID,SiteID,ListName,ListDescription,Active,InactiveCode,DateCreated,DateModified
			FROM standardlist  
			WHERE StandardListID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.StandardListID)#" /> 
		</cfquery>
		
		<cfreturn qGetStandardList>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>





