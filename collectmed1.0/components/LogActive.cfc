 	


<cfcomponent name="logActive" output="false" alias="logActive">

	<cfproperty name="LogID" type="numeric" default="0" />
	<cfproperty name="Code" type="numeric" default="" />
	<cfproperty name="IPaddress" type="string" default="" />
	<cfproperty name="LogText" type="string" default="" />
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
		variables.LogID = 0;
		variables.Code = "";
		variables.IPaddress = "";
		variables.LogText = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="logActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "LogID") AND stValues.LogID NEQ 0>
				<cfquery name="qGetLog" datasource="#trim(variables.ds)#">
			  		SELECT LogID,Code,IPaddress,LogText,Active,InactiveCode,DateCreated,DateModified
					FROM log  
					WHERE LogID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.LogID#" /> 
				</cfquery>		
				<cfif qGetLog.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.Code = qGetLog.Code;
					variables.IPaddress = qGetLog.IPaddress;
					variables.LogText = qGetLog.LogText;
					variables.Active = qGetLog.Active;
					variables.InactiveCode = qGetLog.InactiveCode;
					variables.DateModified = qGetLog.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "LogID")><cfset variables.LogID = stValues.LogID /></cfif>
			<cfif StructKeyExists(stValues, "Code")><cfset variables.Code = stValues.Code /></cfif>
			<cfif StructKeyExists(stValues, "IPaddress")><cfset variables.IPaddress = stValues.IPaddress /></cfif>
			<cfif StructKeyExists(stValues, "LogText")><cfset variables.LogText = stValues.LogText /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LogID.                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLogID" acess="public" output="false" returntype="any">
		<cfreturn variables.LogID>
	</cffunction>
	
	<cffunction name="setLogID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LogID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.LogID)) OR trim(arguments.LogID) EQ "">
			<cfset variables.LogID = arguments.LogID />
		<cfelse>
			<cfthrow message="LogID (#arguments.LogID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LogID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Code.                                                  --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getCode" acess="public" output="false" returntype="any">
		<cfreturn variables.Code>
	</cffunction>
	
	<cffunction name="setCode" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Code" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.Code)) OR trim(arguments.Code) EQ "">
			<cfset variables.Code = arguments.Code />
		<cfelse>
			<cfthrow message="Code (#arguments.Code#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Code") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for IPaddress.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getIPaddress" acess="public" output="false" returntype="any">
		<cfreturn variables.IPaddress>
	</cffunction>
	
	<cffunction name="setIPaddress" acess="public" output="false" returntype="boolean">
		
		<cfargument name="IPaddress" required="true" type="any" />
			
		<cfset variables.IPaddress = arguments.IPaddress />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "IPaddress") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for LogText.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getLogText" acess="public" output="false" returntype="any">
		<cfreturn variables.LogText>
	</cffunction>
	
	<cffunction name="setLogText" acess="public" output="false" returntype="boolean">
		
		<cfargument name="LogText" required="true" type="any" />
			
		<cfset variables.LogText = arguments.LogText />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "LogText") />		
		
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
				 		
		<cfif this.getLogID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getLogID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getLog" output="false" access="public" returntype="query">
				
		<cfargument name="LogID" required="yes" type="numeric" />		
		<cfset var qGetLog = "" />		
	
		<cfquery name="qGetLog" datasource="#trim(variables.ds)#">
	  		SELECT LogID,Code,IPaddress,LogText,Active,InactiveCode,DateCreated,DateModified
			FROM log  
			WHERE LogID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.LogID)#" /> 
		</cfquery>
		
		<cfreturn qGetLog>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="LogActive" />
		
		<cfset var qCreateLog = "" />		
		
		<cfset var localCode = arguments.obj.getCode() />
		<cfset var localIPaddress = arguments.obj.getIPaddress() />
		<cfset var localLogText = arguments.obj.getLogText() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateLog" datasource="#trim(variables.ds)#">
				INSERT INTO log (Code,IPaddress,LogText,InactiveCode)
				VALUES (				
					<cfif IsNumeric(trim(localCode))>						
						<cfqueryparam value="#trim(localCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,	
					<cfif trim(localIPaddress) NEQ "" AND trim(localIPaddress) NEQ "@@" AND trim(localIPaddress) NEQ "NULL">						
						<cfqueryparam value="#trim(localIPaddress)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,	
					<cfif trim(localLogText) NEQ "" AND trim(localLogText) NEQ "@@" AND trim(localLogText) NEQ "NULL">						
						<cfqueryparam value="#trim(localLogText)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS LogID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateLog.LogID);
			arguments.obj.setLogID(qCreateLog.LogID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="LogActive">
				
		<cfargument name="LogID" required="yes" type="numeric" />		
		<cfset var qGetLog = "" />		
		
		<cfset qGetLog = getLog(trim(LogID)) />
				
		<cfif qGetLog.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setLogID(qGetLog.LogID);
			this.setCode(qGetLog.Code);
			this.setIPaddress(qGetLog.IPaddress);
			this.setLogText(qGetLog.LogText);
			this.setActive(qGetLog.Active);
			this.setInactiveCode(qGetLog.InactiveCode);
			this.setDateCreated(qGetLog.DateCreated);
			this.setDateModified(qGetLog.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="LogActive" />
		<cfset var qUpdateLog = "" />
		<cfset var localCode = arguments.obj.getCode() />
		<cfset var localIPaddress = arguments.obj.getIPaddress() />
		<cfset var localLogText = arguments.obj.getLogText() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateLog" datasource="#trim(variables.ds)#">
				UPDATE log  SET
					
					Code =				
					<cfif IsNumeric(trim(localCode))>						
						<cfqueryparam value="#trim(localCode)#" cfsqltype="CF_SQL_INTEGER" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>,
					
					IPaddress =	
					<cfif trim(localIPaddress) NEQ "" AND trim(localIPaddress) NEQ "@@" AND trim(localIPaddress) NEQ "NULL">						
						<cfqueryparam value="#trim(localIPaddress)#" cfsqltype="CF_SQL_VARCHAR" />	
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,
					
					LogText =	
					<cfif trim(localLogText) NEQ "" AND trim(localLogText) NEQ "@@" AND trim(localLogText) NEQ "NULL">						
						<cfqueryparam value="#trim(localLogText)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE LogID = <cfqueryparam value="#trim(arguments.obj.getLogID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="LogActive" />
		<cfset var qDeleteLog = "">

		<cfquery name="qDeleteLog" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM log
			WHERE LogID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getLogID())#" /> 
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





