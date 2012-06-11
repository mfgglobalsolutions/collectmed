 	


<cfcomponent name="logBean" output="false" alias="logBean" extends="LogDAO">

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
	<cffunction name="init" output="false" returntype="logBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "LogID") AND stValues.LogID NEQ 0>
				<cfquery name="qGetLog" datasource="#trim(arguments.ds)#">
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
		

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>



