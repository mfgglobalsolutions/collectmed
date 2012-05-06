 	

<cfcomponent output="false">

		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="StandardListItemBean" />
		
		<cfset var qCreateStandardListItem = "" />		
		
		<cfset var localExternalListItemID = arguments.bean.getExternalListItemID() />
		<cfset var localItemNameDisplay = arguments.bean.getItemNameDisplay() />
		<cfset var localItemDescription = arguments.bean.getItemDescription() />
		<cfset var localListID = arguments.bean.getListID() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateStandardListItem" datasource="#trim(arguments.ds)#">
				INSERT INTO StandardListItem (ExternalListItemID,ItemNameDisplay,ItemDescription,ListID,Active,InactiveCode)
				VALUES (	
					<cfif trim(localExternalListItemID) NEQ "" AND trim(localExternalListItemID) NEQ "@@" AND trim(localExternalListItemID) NEQ "NULL">						
						<cfqueryparam value="#trim(localExternalListItemID)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(localItemNameDisplay)#" cfsqltype="CF_SQL_VARCHAR" />,	
					<cfif trim(localItemDescription) NEQ "" AND trim(localItemDescription) NEQ "@@" AND trim(localItemDescription) NEQ "NULL">						
						<cfqueryparam value="#trim(localItemDescription)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,						
						<cfqueryparam value="#trim(localListID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localActive)#" cfsqltype="CF_SQL_VARCHAR" />,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS StandardListItemID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			arguments.bean.setStandardListItemID(qCreateStandardListItem.StandardListItemID);
		</cfscript>
		
		<cfreturn arguments.bean />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="StandardListItemBean">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="StandardListItemID" required="yes" type="numeric" />		
		<cfset var qGetStandardListItem = "" />		
		
		<cfset qGetStandardListItem = getStandardListItem(trim(arguments.ds), trim(StandardListItemID)) />
				
		<cfif qGetStandardListItem.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			objStandardListItem = createObject("component", "StandardListItemBean").init(arguments.ds);
			objStandardListItem.setStandardListItemID(qGetStandardListItem.StandardListItemID);
			objStandardListItem.setExternalListItemID(qGetStandardListItem.ExternalListItemID);
			objStandardListItem.setItemNameDisplay(qGetStandardListItem.ItemNameDisplay);
			objStandardListItem.setItemDescription(qGetStandardListItem.ItemDescription);
			objStandardListItem.setListID(qGetStandardListItem.ListID);
			objStandardListItem.setActive(qGetStandardListItem.Active);
			objStandardListItem.setInactiveCode(qGetStandardListItem.InactiveCode);
			objStandardListItem.setDateCreated(qGetStandardListItem.DateCreated);
			objStandardListItem.setDateModified(qGetStandardListItem.DateModified);				
			return objStandardListItem;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="StandardListItemBean" />
		<cfset var qUpdateStandardListItem = "" />
		<cfset var localExternalListItemID = arguments.bean.getExternalListItemID() />
		<cfset var localItemNameDisplay = arguments.bean.getItemNameDisplay() />
		<cfset var localItemDescription = arguments.bean.getItemDescription() />
		<cfset var localListID = arguments.bean.getListID() />
		<cfset var localActive = arguments.bean.getActive() />
		<cfset var localInactiveCode = arguments.bean.getInactiveCode() />
		<cfset var localDateModified = arguments.bean.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateStandardListItem" datasource="#trim(arguments.ds)#">
				UPDATE StandardListItem  SET
					
					ExternalListItemID =	
					<cfif trim(localExternalListItemID) NEQ "" AND trim(localExternalListItemID) NEQ "@@" AND trim(localExternalListItemID) NEQ "NULL">						
						<cfqueryparam value="#trim(localExternalListItemID)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ItemNameDisplay =						
						<cfqueryparam value="#trim(localItemNameDisplay)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					ItemDescription =	
					<cfif trim(localItemDescription) NEQ "" AND trim(localItemDescription) NEQ "@@" AND trim(localItemDescription) NEQ "NULL">						
						<cfqueryparam value="#trim(localItemDescription)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					ListID =						
						<cfqueryparam value="#trim(localListID)#" cfsqltype="CF_SQL_INTEGER" />,
					
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
				WHERE StandardListItemID = <cfqueryparam value="#trim(arguments.bean.getStandardListItemID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.bean />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="bean" required="true" type="StandardListItemBean" />
		<cfset var qDeleteStandardListItem = "">

		<cfquery name="qDeleteStandardListItem" datasource="#trim(arguments.ds)#" result="status">
			DELETE
			FROM StandardListItem
			WHERE StandardListItemID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(bean.getStandardListItemID())#" /> 
		</cfquery>

	</cffunction>




	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getStandardListItem" output="false" access="public" returntype="query">
		
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="StandardListItemID" required="yes" type="numeric" />		
		<cfset var qGetStandardListItem = "" />		
	
		<cfquery name="qGetStandardListItem" datasource="#trim(arguments.ds)#">
	  		SELECT StandardListItemID,ExternalListItemID,ItemNameDisplay,ItemDescription,ListID,Active,InactiveCode,DateCreated,DateModified
			FROM StandardListItem  
			WHERE StandardListItemID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.StandardListItemID)#" /> 
		</cfquery>
		
		<cfreturn qGetStandardListItem>
		
	</cffunction>	
	

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
	
</cfcomponent>


