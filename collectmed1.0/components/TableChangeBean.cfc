 	


<cfcomponent name="tablechangeBean" output="false" alias="tablechangeBean" extends="TableChangeDAO">

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
	<cffunction name="init" output="false" returntype="tablechangeBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "ChangeID") AND stValues.ChangeID NEQ 0>
				<cfquery name="qGetTableChange" datasource="#trim(arguments.ds)#">
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
		

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>


