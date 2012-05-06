 	


<cfcomponent name="standardlistitemActive" output="false" alias="standardlistitemActive">

	<cfproperty name="StandardListItemID" type="numeric" default="0" />
	<cfproperty name="ExternalListItemID" type="string" default="" />
	<cfproperty name="ItemNameDisplay" type="string" default="" />
	<cfproperty name="ItemDescription" type="string" default="" />
	<cfproperty name="ListID" type="numeric" default="" />
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
		variables.StandardListItemID = 0;
		variables.ExternalListItemID = "";
		variables.ItemNameDisplay = "";
		variables.ItemDescription = "";
		variables.ListID = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="standardlistitemActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "StandardListItemID") AND stValues.StandardListItemID NEQ 0>
				<cfquery name="qGetStandardListItem" datasource="#trim(variables.ds)#">
			  		SELECT StandardListItemID,ExternalListItemID,ItemNameDisplay,ItemDescription,ListID,Active,InactiveCode,DateCreated,DateModified
					FROM StandardListItem  
					WHERE StandardListItemID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.StandardListItemID#" /> 
				</cfquery>		
				<cfif qGetStandardListItem.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.ExternalListItemID = qGetStandardListItem.ExternalListItemID;
					variables.ItemNameDisplay = qGetStandardListItem.ItemNameDisplay;
					variables.ItemDescription = qGetStandardListItem.ItemDescription;
					variables.ListID = qGetStandardListItem.ListID;
					variables.Active = qGetStandardListItem.Active;
					variables.InactiveCode = qGetStandardListItem.InactiveCode;
					variables.DateModified = qGetStandardListItem.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "StandardListItemID")><cfset variables.StandardListItemID = stValues.StandardListItemID /></cfif>
			<cfif StructKeyExists(stValues, "ExternalListItemID")><cfset variables.ExternalListItemID = stValues.ExternalListItemID /></cfif>
			<cfif StructKeyExists(stValues, "ItemNameDisplay")><cfset variables.ItemNameDisplay = stValues.ItemNameDisplay /></cfif>
			<cfif StructKeyExists(stValues, "ItemDescription")><cfset variables.ItemDescription = stValues.ItemDescription /></cfif>
			<cfif StructKeyExists(stValues, "ListID")><cfset variables.ListID = stValues.ListID /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for StandardListItemID.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getStandardListItemID" acess="public" output="false" returntype="any">
		<cfreturn variables.StandardListItemID>
	</cffunction>
	
	<cffunction name="setStandardListItemID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="StandardListItemID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.StandardListItemID)) OR trim(arguments.StandardListItemID) EQ "">
			<cfset variables.StandardListItemID = arguments.StandardListItemID />
		<cfelse>
			<cfthrow message="StandardListItemID (#arguments.StandardListItemID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "StandardListItemID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ExternalListItemID.                                    --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getExternalListItemID" acess="public" output="false" returntype="any">
		<cfreturn variables.ExternalListItemID>
	</cffunction>
	
	<cffunction name="setExternalListItemID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ExternalListItemID" required="true" type="any" />
			
		<cfset variables.ExternalListItemID = arguments.ExternalListItemID />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ExternalListItemID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ItemNameDisplay.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getItemNameDisplay" acess="public" output="false" returntype="any">
		<cfreturn variables.ItemNameDisplay>
	</cffunction>
	
	<cffunction name="setItemNameDisplay" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ItemNameDisplay" required="true" type="any" />
			
		<cfset variables.ItemNameDisplay = arguments.ItemNameDisplay />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ItemNameDisplay") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ItemDescription.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getItemDescription" acess="public" output="false" returntype="any">
		<cfreturn variables.ItemDescription>
	</cffunction>
	
	<cffunction name="setItemDescription" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ItemDescription" required="true" type="any" />
			
		<cfset variables.ItemDescription = arguments.ItemDescription />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ItemDescription") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ListID.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getListID" acess="public" output="false" returntype="any">
		<cfreturn variables.ListID>
	</cffunction>
	
	<cffunction name="setListID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ListID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ListID)) OR trim(arguments.ListID) EQ "">
			<cfset variables.ListID = arguments.ListID />
		<cfelse>
			<cfthrow message="ListID (#arguments.ListID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ListID") />		
		
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
				 		
		<cfif this.getStandardListItemID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getStandardListItemID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getStandardListItem" output="false" access="public" returntype="query">
				
		<cfargument name="StandardListItemID" required="yes" type="numeric" />		
		<cfset var qGetStandardListItem = "" />		
	
		<cfquery name="qGetStandardListItem" datasource="#trim(variables.ds)#">
	  		SELECT StandardListItemID,ExternalListItemID,ItemNameDisplay,ItemDescription,ListID,Active,InactiveCode,DateCreated,DateModified
			FROM StandardListItem  
			WHERE StandardListItemID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.StandardListItemID)#" /> 
		</cfquery>
		
		<cfreturn qGetStandardListItem>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="StandardListItemActive" />
		
		<cfset var qCreateStandardListItem = "" />		
		
		<cfset var localExternalListItemID = arguments.obj.getExternalListItemID() />
		<cfset var localItemNameDisplay = arguments.obj.getItemNameDisplay() />
		<cfset var localItemDescription = arguments.obj.getItemDescription() />
		<cfset var localListID = arguments.obj.getListID() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateStandardListItem" datasource="#trim(variables.ds)#">
				INSERT INTO StandardListItem (ExternalListItemID,ItemNameDisplay,ItemDescription,ListID,InactiveCode)
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
			read(qCreateStandardListItem.StandardListItemID);
			arguments.obj.setStandardListItemID(qCreateStandardListItem.StandardListItemID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="StandardListItemActive">
				
		<cfargument name="StandardListItemID" required="yes" type="numeric" />		
		<cfset var qGetStandardListItem = "" />		
		
		<cfset qGetStandardListItem = getStandardListItem(trim(StandardListItemID)) />
				
		<cfif qGetStandardListItem.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setStandardListItemID(qGetStandardListItem.StandardListItemID);
			this.setExternalListItemID(qGetStandardListItem.ExternalListItemID);
			this.setItemNameDisplay(qGetStandardListItem.ItemNameDisplay);
			this.setItemDescription(qGetStandardListItem.ItemDescription);
			this.setListID(qGetStandardListItem.ListID);
			this.setActive(qGetStandardListItem.Active);
			this.setInactiveCode(qGetStandardListItem.InactiveCode);
			this.setDateCreated(qGetStandardListItem.DateCreated);
			this.setDateModified(qGetStandardListItem.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="StandardListItemActive" />
		<cfset var qUpdateStandardListItem = "" />
		<cfset var localExternalListItemID = arguments.obj.getExternalListItemID() />
		<cfset var localItemNameDisplay = arguments.obj.getItemNameDisplay() />
		<cfset var localItemDescription = arguments.obj.getItemDescription() />
		<cfset var localListID = arguments.obj.getListID() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateStandardListItem" datasource="#trim(variables.ds)#">
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
				WHERE StandardListItemID = <cfqueryparam value="#trim(arguments.obj.getStandardListItemID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="StandardListItemActive" />
		<cfset var qDeleteStandardListItem = "">

		<cfquery name="qDeleteStandardListItem" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM StandardListItem
			WHERE StandardListItemID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getStandardListItemID())#" /> 
		</cfquery>

	</cffunction>



<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		<!-------------------------------------------------------------------------------------->
		<!--- This function will be called to get addresses belonging to an entity.          --->
		<!-------------------------------------------------------------------------------------->		
		<cffunction name="getStateByDescriptionORDisplay" output="false" access="public" returntype="string">		
			
			<cfargument name="clientID" required="yes" type="numeric">
			<cfargument name="Description" required="no" default="" type="string">
			<cfargument name="Display" required="no" default="" type="string">
												
			<cftry>			
				
				<cfquery name="getState" datasource="#trim(variables.ds)#">
					SELECT StandardListItemID
					FROM StandardListItem
					WHERE ItemDescription = <cfqueryparam value="#trim(arguments.Description)#" cfsqltype="CF_SQL_VARCHAR" /> 
					OR ItemNameDisplay = <cfqueryparam value="#trim(arguments.Display)#" cfsqltype="CF_SQL_VARCHAR" /> 
				</cfquery>
									
				<cfif getState.RecordCount EQ 1>
					<cfreturn getState.StandardListItemID>
				<cfelse>
					<cfreturn "">	
				</cfif>   								
										
						
				<cfcatch type="Any">				
					<cfthrow message="Caught Exception: #CFCATCH.TYPE# #cfcatch.message# #cfcatch.detail#">						
				</cfcatch>
				
			</cftry>
			
		</cffunction>
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>


