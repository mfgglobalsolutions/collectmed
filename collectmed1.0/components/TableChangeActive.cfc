 	


<cfcomponent name="tablechangeActive" output="false" alias="tablechangeActive">

	<cfproperty name="ChangeID" type="numeric" default="0" />
	<cfproperty name="Datasource" type="string" default="" />
	<cfproperty name="Tablename" type="string" default="" />
	<cfproperty name="ColumnName" type="string" default="" />
	<cfproperty name="ChangeScript" type="string" default="" />
	<cfproperty name="Error" type="string" default="" />
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
		variables.ChangeID = 0;
		variables.Datasource = "";
		variables.Tablename = "";
		variables.ColumnName = "";
		variables.ChangeScript = "";
		variables.Error = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="tablechangeActive">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		
		<cfset variables.ds = arguments.ds>
		
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "ChangeID") AND stValues.ChangeID NEQ 0>
				<cfquery name="qGetTableChange" datasource="#trim(variables.ds)#">
			  		SELECT ChangeID,Datasource,Tablename,ColumnName,ChangeScript,Error,Active,InactiveCode,DateCreated,DateModified
					FROM TableChange  
					WHERE ChangeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.ChangeID#" /> 
				</cfquery>		
				<cfif qGetTableChange.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.Datasource = qGetTableChange.Datasource;
					variables.Tablename = qGetTableChange.Tablename;
					variables.ColumnName = qGetTableChange.ColumnName;
					variables.ChangeScript = qGetTableChange.ChangeScript;
					variables.Error = qGetTableChange.Error;
					variables.Active = qGetTableChange.Active;
					variables.InactiveCode = qGetTableChange.InactiveCode;
					variables.DateModified = qGetTableChange.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "ChangeID")><cfset variables.ChangeID = stValues.ChangeID /></cfif>
			<cfif StructKeyExists(stValues, "Datasource")><cfset variables.Datasource = stValues.Datasource /></cfif>
			<cfif StructKeyExists(stValues, "Tablename")><cfset variables.Tablename = stValues.Tablename /></cfif>
			<cfif StructKeyExists(stValues, "ColumnName")><cfset variables.ColumnName = stValues.ColumnName /></cfif>
			<cfif StructKeyExists(stValues, "ChangeScript")><cfset variables.ChangeScript = stValues.ChangeScript /></cfif>
			<cfif StructKeyExists(stValues, "Error")><cfset variables.Error = stValues.Error /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ChangeID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getChangeID" acess="public" output="false" returntype="any">
		<cfreturn variables.ChangeID>
	</cffunction>
	
	<cffunction name="setChangeID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ChangeID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.ChangeID)) OR trim(arguments.ChangeID) EQ "">
			<cfset variables.ChangeID = arguments.ChangeID />
		<cfelse>
			<cfthrow message="ChangeID (#arguments.ChangeID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ChangeID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Datasource.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDatasource" acess="public" output="false" returntype="any">
		<cfreturn variables.Datasource>
	</cffunction>
	
	<cffunction name="setDatasource" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Datasource" required="true" type="any" />
			
		<cfset variables.Datasource = arguments.Datasource />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Datasource") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Tablename.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTablename" acess="public" output="false" returntype="any">
		<cfreturn variables.Tablename>
	</cffunction>
	
	<cffunction name="setTablename" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Tablename" required="true" type="any" />
			
		<cfset variables.Tablename = arguments.Tablename />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Tablename") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ColumnName.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getColumnName" acess="public" output="false" returntype="any">
		<cfreturn variables.ColumnName>
	</cffunction>
	
	<cffunction name="setColumnName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ColumnName" required="true" type="any" />
			
		<cfset variables.ColumnName = arguments.ColumnName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ColumnName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for ChangeScript.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getChangeScript" acess="public" output="false" returntype="any">
		<cfreturn variables.ChangeScript>
	</cffunction>
	
	<cffunction name="setChangeScript" acess="public" output="false" returntype="boolean">
		
		<cfargument name="ChangeScript" required="true" type="any" />
			
		<cfset variables.ChangeScript = arguments.ChangeScript />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "ChangeScript") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Error.                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getError" acess="public" output="false" returntype="any">
		<cfreturn variables.Error>
	</cffunction>
	
	<cffunction name="setError" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Error" required="true" type="any" />
			
		<cfset variables.Error = arguments.Error />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Error") />		
		
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
				 		
		<cfif this.getChangeID() EQ 0>
			<cfset create(this)>			
		<cfelse>
			<cfset update(this)>
		</cfif>
		
		<cfreturn this.getChangeID()>	
				
	</cffunction>


	<!-------------------------------------------------------------------------------------->
	<!--- Use this function get a record into an object.                                 --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="getTableChange" output="false" access="public" returntype="query">
				
		<cfargument name="ChangeID" required="yes" type="numeric" />		
		<cfset var qGetTableChange = "" />		
	
		<cfquery name="qGetTableChange" datasource="#trim(variables.ds)#">
	  		SELECT ChangeID,Datasource,Tablename,ColumnName,ChangeScript,Error,Active,InactiveCode,DateCreated,DateModified
			FROM TableChange  
			WHERE ChangeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(arguments.ChangeID)#" /> 
		</cfquery>
		
		<cfreturn qGetTableChange>
		
	</cffunction>	
		
	
	<!-------------------------------------------------------------------------------------->
	<!--- Use this function create a record.                                             --->
	<!-------------------------------------------------------------------------------------->		
	<cffunction name="create" output="false" access="public">
				
		<cfargument name="obj" required="true" type="TableChangeActive" />
		
		<cfset var qCreateTableChange = "" />		
		
		<cfset var localDatasource = arguments.obj.getDatasource() />
		<cfset var localTablename = arguments.obj.getTablename() />
		<cfset var localColumnName = arguments.obj.getColumnName() />
		<cfset var localChangeScript = arguments.obj.getChangeScript() />
		<cfset var localError = arguments.obj.getError() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />	
						
		<cftransaction isolation="read_committed">
			
			<cfquery name="qCreateTableChange" datasource="#trim(variables.ds)#">
				INSERT INTO TableChange (Datasource,Tablename,ColumnName,ChangeScript,Error,InactiveCode)
				VALUES (						
						<cfqueryparam value="#trim(localDatasource)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localTablename)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localColumnName)#" cfsqltype="CF_SQL_VARCHAR" />,						
						<cfqueryparam value="#trim(localChangeScript)#" cfsqltype="CF_SQL_VARCHAR" />,	
					<cfif trim(localError) NEQ "" AND trim(localError) NEQ "@@" AND trim(localError) NEQ "NULL">						
						<cfqueryparam value="#trim(localError)#" cfsqltype="CF_SQL_VARCHAR" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_VARCHAR" />
					</cfif>,				
					<cfif IsNumeric(trim(localInactiveCode))>						
						<cfqueryparam value="#trim(localInactiveCode)#" cfsqltype="CF_SQL_INTEGER" />							
					<cfelse>
						 <cfqueryparam null="true" cfsqltype="CF_SQL_INTEGER" />
					</cfif>	
				);
				SELECT LAST_INSERT_ID() AS ChangeID 
			</cfquery>
			
		</cftransaction>	
			
		<cfscript>
			read(qCreateTableChange.ChangeID);
			arguments.obj.setChangeID(qCreateTableChange.ChangeID);
		</cfscript>
		
		<cfreturn arguments.obj />
		
	</cffunction>		
	



	<!-------------------------------------------------------------------------------------->
	<!--- Use this function read a record into an object.                                --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="read" output="false" access="public" returntype="TableChangeActive">
				
		<cfargument name="ChangeID" required="yes" type="numeric" />		
		<cfset var qGetTableChange = "" />		
		
		<cfset qGetTableChange = getTableChange(trim(ChangeID)) />
				
		<cfif qGetTableChange.Recordcount LTE 0>
			<cfthrow message="Could not initialize the object the record was not found." />		
		</cfif>		
		
		<!-------------------------------------------------------------------------------------->
		<!--- Initialize the OBJ with the current values from DB.                            --->
		<!-------------------------------------------------------------------------------------->			
		<cfscript>
			this.setChangeID(qGetTableChange.ChangeID);
			this.setDatasource(qGetTableChange.Datasource);
			this.setTablename(qGetTableChange.Tablename);
			this.setColumnName(qGetTableChange.ColumnName);
			this.setChangeScript(qGetTableChange.ChangeScript);
			this.setError(qGetTableChange.Error);
			this.setActive(qGetTableChange.Active);
			this.setInactiveCode(qGetTableChange.InactiveCode);
			this.setDateCreated(qGetTableChange.DateCreated);
			this.setDateModified(qGetTableChange.DateModified);				
			return this;
		</cfscript>
	 
	</cffunction>		
	
	

	<cffunction name="update" output="false" access="public">
				
		<cfargument name="obj" required="true" type="TableChangeActive" />
		<cfset var qUpdateTableChange = "" />
		<cfset var localDatasource = arguments.obj.getDatasource() />
		<cfset var localTablename = arguments.obj.getTablename() />
		<cfset var localColumnName = arguments.obj.getColumnName() />
		<cfset var localChangeScript = arguments.obj.getChangeScript() />
		<cfset var localError = arguments.obj.getError() />
		<cfset var localActive = arguments.obj.getActive() />
		<cfset var localInactiveCode = arguments.obj.getInactiveCode() />
		<cfset var localDateModified = arguments.obj.getDateModified() />
			
		<cftry>
				
			<!-------------------------------------------------------------------------------------->
			<!--- The dateModified must get updated with the current date and time.              --->
			<!-------------------------------------------------------------------------------------->				
			<cfset localDateModified = NOW() />		
				
			<cfquery name="qUpdateTableChange" datasource="#trim(variables.ds)#">
				UPDATE TableChange  SET
					
					Datasource =						
						<cfqueryparam value="#trim(localDatasource)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					Tablename =						
						<cfqueryparam value="#trim(localTablename)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					ColumnName =						
						<cfqueryparam value="#trim(localColumnName)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					ChangeScript =						
						<cfqueryparam value="#trim(localChangeScript)#" cfsqltype="CF_SQL_VARCHAR" />,
					
					Error =	
					<cfif trim(localError) NEQ "" AND trim(localError) NEQ "@@" AND trim(localError) NEQ "NULL">						
						<cfqueryparam value="#trim(localError)#" cfsqltype="CF_SQL_VARCHAR" />	
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
				WHERE ChangeID = <cfqueryparam value="#trim(arguments.obj.getChangeID())#" cfsqltype="CF_SQL_INTEGER">
			</cfquery>		
		
			<cfcatch type="any">				
				<cfthrow message="The error that occurred was (This is a caught error):	[type: #cfcatch.type#] [message: #cfcatch.message#] [detail: #cfcatch.detail#">					
			</cfcatch>
		
		</cftry>
		
		<cfreturn arguments.obj />
		
	</cffunction>


	

	<cffunction name="delete" output="false" access="public" returntype="void">
		
		<cfargument name="obj" required="true" type="TableChangeActive" />
		<cfset var qDeleteTableChange = "">

		<cfquery name="qDeleteTableChange" datasource="#trim(variables.ds)#" result="status">
			DELETE
			FROM TableChange
			WHERE ChangeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#trim(obj.getChangeID())#" /> 
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


