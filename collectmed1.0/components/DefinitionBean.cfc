 	


<cfcomponent name="definitionBean" output="false" alias="definitionBean" extends="DefinitionDAO">

	<cfproperty name="DefinitionID" type="numeric" default="0" />
	<cfproperty name="Title" type="string" default="" />
	<cfproperty name="Definition" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.DefinitionID = 0;
		variables.Title = "";
		variables.Definition = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="definitionBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "DefinitionID") AND stValues.DefinitionID NEQ 0>
				<cfquery name="qGetDefinition" datasource="#trim(arguments.ds)#">
			  		SELECT DefinitionID,Title,Definition,Active,InactiveCode,DateCreated,DateModified
					FROM Definition  
					WHERE DefinitionID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.DefinitionID#" /> 
				</cfquery>		
				<cfif qGetDefinition.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.Title = qGetDefinition.Title;
					variables.Definition = qGetDefinition.Definition;
					variables.Active = qGetDefinition.Active;
					variables.InactiveCode = qGetDefinition.InactiveCode;
					variables.DateModified = qGetDefinition.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "DefinitionID")><cfset variables.DefinitionID = stValues.DefinitionID /></cfif>
			<cfif StructKeyExists(stValues, "Title")><cfset variables.Title = stValues.Title /></cfif>
			<cfif StructKeyExists(stValues, "Definition")><cfset variables.Definition = stValues.Definition /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for DefinitionID.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDefinitionID" acess="public" output="false" returntype="any">
		<cfreturn variables.DefinitionID>
	</cffunction>
	
	<cffunction name="setDefinitionID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="DefinitionID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.DefinitionID)) OR trim(arguments.DefinitionID) EQ "">
			<cfset variables.DefinitionID = arguments.DefinitionID />
		<cfelse>
			<cfthrow message="DefinitionID (#arguments.DefinitionID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "DefinitionID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Title.                                                 --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getTitle" acess="public" output="false" returntype="any">
		<cfreturn variables.Title>
	</cffunction>
	
	<cffunction name="setTitle" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Title" required="true" type="any" />
			
		<cfset variables.Title = arguments.Title />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Title") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for Definition.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getDefinition" acess="public" output="false" returntype="any">
		<cfreturn variables.Definition>
	</cffunction>
	
	<cffunction name="setDefinition" acess="public" output="false" returntype="boolean">
		
		<cfargument name="Definition" required="true" type="any" />
			
		<cfset variables.Definition = arguments.Definition />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "Definition") />		
		
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


