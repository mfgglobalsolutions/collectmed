 	


<cfcomponent name="standardlistActive" output="false" alias="standardlistActive">

	<cfproperty name="StandardListID" type="numeric" default="0" />
	<cfproperty name="SiteID" type="numeric" default="" />
	<cfproperty name="ListName" type="string" default="" />
	<cfproperty name="ListDescription" type="string" default="" />
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
		variables.StandardListID = 0;
		variables.SiteID = "";
		variables.ListName = "";
		variables.ListDescription = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="standardlistActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "StandardListID") AND stValues.StandardListID NEQ 0>
				<cfquery name="qGetStandardList" datasource="#trim(variables.ds)#">
			  		SELECT StandardListID,SiteID,ListName,ListDescription,Active,InactiveCode,DateCreated,DateModified
					FROM standardlist  
					WHERE StandardListID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.StandardListID#" /> 
				</cfquery>		
				<cfif qGetStandardList.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.SiteID = qGetStandardList.SiteID;
					variables.ListName = qGetStandardList.ListName;
					variables.ListDescription = qGetStandardList.ListDescription;
					variables.Active = qGetStandardList.Active;
					variables.InactiveCode = qGetStandardList.InactiveCode;
					variables.DateModified = qGetStandardList.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "StandardListID")><cfset variables.StandardListID = stValues.StandardListID /></cfif>
			<cfif StructKeyExists(stValues, "SiteID")><cfset variables.SiteID = stValues.SiteID /></cfif>
			<cfif StructKeyExists(stValues, "ListName")><cfset variables.ListName = stValues.ListName /></cfif>
			<cfif StructKeyExists(stValues, "ListDescription")><cfset variables.ListDescription = stValues.ListDescription /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for StandardListID.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getStandardListID" acess="public" output="false" returntype="any">
		<cfreturn variables.StandardListID>
	</cffunction>
	
	<cffunction name="setStandardListID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="StandardListID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.StandardListID)) OR trim(arguments.StandardListID) EQ "">
			<cfset variables.StandardListID = arguments.StandardListID />
		<cfelse>
			<cfthrow message="StandardListID (#arguments.StandardListID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "StandardListID") />		
		
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
	<!--- GET and SET methods for ListName.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getListName" acess="public" output="false" returntype="any">
		<cfreturn variables.ListName>
	</cffunction>
	
	<cffunction name="setListName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ListName" required="true" type="any" />
			
		<cfset variables.ListName = arguments.ListName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ListName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ListDescription.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getListDescription" acess="public" output="false" returntype="any">
		<cfreturn variables.ListDescription>
	</cffunction>
	
	<cffunction name="setListDescription" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ListDescription" required="true" type="any" />
			
		<cfset variables.ListDescription = arguments.ListDescription />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ListDescription") />		
		
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
				 		
		<cfif this.getStandardListID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getStandardListID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getStandardList" output="false" access="public" returntype="query">
				
		<cfargument name="StandardListID" required="yes" type="numeric" />		
		<cfset var qGetStandardList = "" />		
	
		<cfquery name="qGetStandardList" datasource="#trim(variables.ds)#">
	  		SELECT StandardListID,SiteID,ListName,ListDescription,Active,InactiveCode,DateCreated,DateModified
			FROM standardlist  
			WHERE StandardListID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.StandardListID)#" /> 
		</cfquery>
		
		<cfreturn qGetStandardList>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="StandardListActive" />
		
		<cfset var qCreateStandardList = "" />		
		
		<cfset var localSiteID = arguments.obj.getSiteID() />
		<cfset var localListName = arguments.obj.getListName() />
		<cfset var localListDescription = arguments.obj.getListDescription() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateStandardList" datasource="#trim(variables.ds)#">
				INSERT INTO standardlist (SiteID,ListName,ListDescription,InactiveCode)
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
			read(qCreateStandardList.StandardListID);
			arguments.obj.setStandardListID(qCreateStandardList.StandardListID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="StandardListActive">
				
		<cfargument name="StandardListID" required="yes" type="numeric" />		
		<cfset var qGetStandardList = "" />		
		
		<cfset qGetStandardList = getStandardList(trim(StandardListID)) />
				
		<cfif qGetStandardList.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setStandardListID(qGetStandardList.StandardListID);
			this.setSiteID(qGetStandardList.SiteID);
			this.setListName(qGetStandardList.ListName);
			this.setListDescription(qGetStandardList.ListDescription);
			this.setActive(qGetStandardList.Active);
			this.setInactiveCode(qGetStandardList.InactiveCode);
			this.setDateCreated(qGetStandardList.DateCreated);
			this.setDateModified(qGetStandardList.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="StandardListActive" />
		<cfset var qUpdateStandardList = "" />
		<cfset var localSiteID = arguments.obj.getSiteID() />
		<cfset var localListName = arguments.obj.getListName() />
		<cfset var localListDescription = arguments.obj.getListDescription() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateStandardList" datasource="#trim(variables.ds)#">
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
				WHERE StandardListID = <cfqueryparam value="#trim(arguments.obj.getStandardListID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="StandardListActive" />
		<cfset var qDeleteStandardList = "">

		<cfquery name="qDeleteStandardList" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM standardlist
			WHERE StandardListID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getStandardListID())#" /> 
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





