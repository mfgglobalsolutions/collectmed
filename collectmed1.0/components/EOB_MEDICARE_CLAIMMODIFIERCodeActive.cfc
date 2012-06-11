 	


<cfcomponent name="eob_medicare_claimmodifiercodeActive" output="false" alias="eob_medicare_claimmodifiercodeActive">

	<cfproperty name="RecordID" type="numeric" default="0" />
	<cfproperty name="StandardListItemID" type="numeric" default="" />
	<cfproperty name="Modifier" type="string" default="" />
	<cfproperty name="Description" type="string" default="" />
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
		variables.RecordID = 0;
		variables.StandardListItemID = "";
		variables.Modifier = "";
		variables.Description = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="eob_medicare_claimmodifiercodeActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "RecordID") AND stValues.RecordID NEQ 0>
				<cfquery name="qGetEOB_MEDICARE_CLAIMMODIFIERCode" datasource="#trim(variables.ds)#">
			  		SELECT RecordID,StandardListItemID,Modifier,Description,Active,InactiveCode,DateCreated,DateModified
					FROM eob_medicare_claimmodifiercode  
					WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.RecordID#" /> 
				</cfquery>		
				<cfif qGetEOB_MEDICARE_CLAIMMODIFIERCode.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.StandardListItemID = qGetEOB_MEDICARE_CLAIMMODIFIERCode.StandardListItemID;
					variables.Modifier = qGetEOB_MEDICARE_CLAIMMODIFIERCode.Modifier;
					variables.Description = qGetEOB_MEDICARE_CLAIMMODIFIERCode.Description;
					variables.Active = qGetEOB_MEDICARE_CLAIMMODIFIERCode.Active;
					variables.InactiveCode = qGetEOB_MEDICARE_CLAIMMODIFIERCode.InactiveCode;
					variables.DateModified = qGetEOB_MEDICARE_CLAIMMODIFIERCode.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "RecordID")><cfset variables.RecordID = stValues.RecordID /></cfif>
			<cfif StructKeyExists(stValues, "StandardListItemID")><cfset variables.StandardListItemID = stValues.StandardListItemID /></cfif>
			<cfif StructKeyExists(stValues, "Modifier")><cfset variables.Modifier = stValues.Modifier /></cfif>
			<cfif StructKeyExists(stValues, "Description")><cfset variables.Description = stValues.Description /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for RecordID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getRecordID" acess="public" output="false" returntype="any">
		<cfreturn variables.RecordID>
	</cffunction>
	
	<cffunction name="setRecordID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="RecordID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.RecordID)) OR trim(arguments.RecordID) EQ "">
			<cfset variables.RecordID = arguments.RecordID />
		<cfelse>
			<cfthrow message="RecordID (#arguments.RecordID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "RecordID") />		
		
		<cfreturn true>
		
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
	<!--- GET and SET methods for Modifier.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getModifier" acess="public" output="false" returntype="any">
		<cfreturn variables.Modifier>
	</cffunction>
	
	<cffunction name="setModifier" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Modifier" required="true" type="any" />
			
		<cfset variables.Modifier = arguments.Modifier />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Modifier") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Description.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDescription" acess="public" output="false" returntype="any">
		<cfreturn variables.Description>
	</cffunction>
	
	<cffunction name="setDescription" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Description" required="true" type="any" />
			
		<cfset variables.Description = arguments.Description />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Description") />		
		
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
				 		
		<cfif this.getRecordID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getRecordID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getEOB_MEDICARE_CLAIMMODIFIERCode" output="false" access="public" returntype="query">
				
		<cfargument name="RecordID" required="yes" type="numeric" />		
		<cfset var qGetEOB_MEDICARE_CLAIMMODIFIERCode = "" />		
	
		<cfquery name="qGetEOB_MEDICARE_CLAIMMODIFIERCode" datasource="#trim(variables.ds)#">
	  		SELECT RecordID,StandardListItemID,Modifier,Description,Active,InactiveCode,DateCreated,DateModified
			FROM eob_medicare_claimmodifiercode  
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.RecordID)#" /> 
		</cfquery>
		
		<cfreturn qGetEOB_MEDICARE_CLAIMMODIFIERCode>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="EOB_MEDICARE_CLAIMMODIFIERCodeActive" />
		
		<cfset var qCreateEOB_MEDICARE_CLAIMMODIFIERCode = "" />		
		
		<cfset var localStandardListItemID = arguments.obj.getStandardListItemID() />
		<cfset var localModifier = arguments.obj.getModifier() />
		<cfset var localDescription = arguments.obj.getDescription() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateEOB_MEDICARE_CLAIMMODIFIERCode" datasource="#trim(variables.ds)#">
				INSERT INTO eob_medicare_claimmodifiercode (StandardListItemID,Modifier,Description,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localStandardListItemID)#" cfsqltype="CF_SQL_INTEGER" />,						
						<cfqueryparam value="#trim(localModifier)#" cfsqltype="CF_SQL_VARCHAR" />,	
					<cfif trim(localDescription) NEQ "" AND trim(localDescription) NEQ "@@" AND trim(localDescription) NEQ "NULL">						
						<cfqueryparam value="#trim(localDescription)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS RecordID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateEOB_MEDICARE_CLAIMMODIFIERCode.RecordID);
			arguments.obj.setRecordID(qCreateEOB_MEDICARE_CLAIMMODIFIERCode.RecordID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="EOB_MEDICARE_CLAIMMODIFIERCodeActive">
				
		<cfargument name="RecordID" required="yes" type="numeric" />		
		<cfset var qGetEOB_MEDICARE_CLAIMMODIFIERCode = "" />		
		
		<cfset qGetEOB_MEDICARE_CLAIMMODIFIERCode = getEOB_MEDICARE_CLAIMMODIFIERCode(trim(RecordID)) />
				
		<cfif qGetEOB_MEDICARE_CLAIMMODIFIERCode.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setRecordID(qGetEOB_MEDICARE_CLAIMMODIFIERCode.RecordID);
			this.setStandardListItemID(qGetEOB_MEDICARE_CLAIMMODIFIERCode.StandardListItemID);
			this.setModifier(qGetEOB_MEDICARE_CLAIMMODIFIERCode.Modifier);
			this.setDescription(qGetEOB_MEDICARE_CLAIMMODIFIERCode.Description);
			this.setActive(qGetEOB_MEDICARE_CLAIMMODIFIERCode.Active);
			this.setInactiveCode(qGetEOB_MEDICARE_CLAIMMODIFIERCode.InactiveCode);
			this.setDateCreated(qGetEOB_MEDICARE_CLAIMMODIFIERCode.DateCreated);
			this.setDateModified(qGetEOB_MEDICARE_CLAIMMODIFIERCode.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="EOB_MEDICARE_CLAIMMODIFIERCodeActive" />
		<cfset var qUpdateEOB_MEDICARE_CLAIMMODIFIERCode = "" />
		<cfset var localStandardListItemID = arguments.obj.getStandardListItemID() />
		<cfset var localModifier = arguments.obj.getModifier() />
		<cfset var localDescription = arguments.obj.getDescription() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateEOB_MEDICARE_CLAIMMODIFIERCode" datasource="#trim(variables.ds)#">
				UPDATE eob_medicare_claimmodifiercode  SET
					
					StandardListItemID =						
						<cfqueryparam value="#trim(localStandardListItemID)#" cfsqltype="CF_SQL_INTEGER" />,
					
					Modifier =						
						<cfqueryparam value="#trim(localModifier)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					Description =	
					<cfif trim(localDescription) NEQ "" AND trim(localDescription) NEQ "@@" AND trim(localDescription) NEQ "NULL">						
						<cfqueryparam value="#trim(localDescription)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE RecordID = <cfqueryparam value="#trim(arguments.obj.getRecordID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="EOB_MEDICARE_CLAIMMODIFIERCodeActive" />
		<cfset var qDeleteEOB_MEDICARE_CLAIMMODIFIERCode = "">

		<cfquery name="qDeleteEOB_MEDICARE_CLAIMMODIFIERCode" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM eob_medicare_claimmodifiercode
			WHERE RecordID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getRecordID())#" /> 
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





