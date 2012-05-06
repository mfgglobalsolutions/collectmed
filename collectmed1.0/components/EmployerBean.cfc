 	


<cfcomponent name="employerBean" output="false" alias="employerBean" extends="EmployerDAO">

	<cfproperty name="EmployerID" type="numeric" default="0" />
	<cfproperty name="EmployerName" type="string" default="" />
	<cfproperty name="EmployerDBA" type="string" default="" />
	<cfproperty name="EntityID" type="numeric" default="" />
	<cfproperty name="EmployerURL" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.EmployerID = 0;
		variables.EmployerName = "";
		variables.EmployerDBA = "";
		variables.EntityID = "";
		variables.EmployerURL = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="employerBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "EmployerID") AND stValues.EmployerID NEQ 0>
				<cfquery name="qGetEmployer" datasource="#trim(arguments.ds)#">
			  		SELECT EmployerID,EmployerName,EmployerDBA,EntityID,EmployerURL,Active,InactiveCode,DateCreated,DateModified
					FROM Employer  
					WHERE EmployerID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.EmployerID#" /> 
				</cfquery>		
				<cfif qGetEmployer.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.EmployerName = qGetEmployer.EmployerName;
					variables.EmployerDBA = qGetEmployer.EmployerDBA;
					variables.EntityID = qGetEmployer.EntityID;
					variables.EmployerURL = qGetEmployer.EmployerURL;
					variables.Active = qGetEmployer.Active;
					variables.InactiveCode = qGetEmployer.InactiveCode;
					variables.DateModified = qGetEmployer.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "EmployerID")><cfset variables.EmployerID = stValues.EmployerID /></cfif>
			<cfif StructKeyExists(stValues, "EmployerName")><cfset variables.EmployerName = stValues.EmployerName /></cfif>
			<cfif StructKeyExists(stValues, "EmployerDBA")><cfset variables.EmployerDBA = stValues.EmployerDBA /></cfif>
			<cfif StructKeyExists(stValues, "EntityID")><cfset variables.EntityID = stValues.EntityID /></cfif>
			<cfif StructKeyExists(stValues, "EmployerURL")><cfset variables.EmployerURL = stValues.EmployerURL /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EmployerID.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEmployerID" acess="public" output="false" returntype="any">
		<cfreturn variables.EmployerID>
	</cffunction>
	
	<cffunction name="setEmployerID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EmployerID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EmployerID)) OR trim(arguments.EmployerID) EQ "">
			<cfset variables.EmployerID = arguments.EmployerID />
		<cfelse>
			<cfthrow message="EmployerID (#arguments.EmployerID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EmployerID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EmployerName.                                          --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEmployerName" acess="public" output="false" returntype="any">
		<cfreturn variables.EmployerName>
	</cffunction>
	
	<cffunction name="setEmployerName" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EmployerName" required="true" type="any" />
			
		<cfset variables.EmployerName = arguments.EmployerName />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EmployerName") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EmployerDBA.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEmployerDBA" acess="public" output="false" returntype="any">
		<cfreturn variables.EmployerDBA>
	</cffunction>
	
	<cffunction name="setEmployerDBA" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EmployerDBA" required="true" type="any" />
			
		<cfset variables.EmployerDBA = arguments.EmployerDBA />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EmployerDBA") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EntityID.                                              --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEntityID" acess="public" output="false" returntype="any">
		<cfreturn variables.EntityID>
	</cffunction>
	
	<cffunction name="setEntityID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EntityID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.EntityID)) OR trim(arguments.EntityID) EQ "">
			<cfset variables.EntityID = arguments.EntityID />
		<cfelse>
			<cfthrow message="EntityID (#arguments.EntityID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EntityID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for EmployerURL.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getEmployerURL" acess="public" output="false" returntype="any">
		<cfreturn variables.EmployerURL>
	</cffunction>
	
	<cffunction name="setEmployerURL" acess="public" output="false" returntype="boolean">
		
		<cfargument name="EmployerURL" required="true" type="any" />
			
		<cfset variables.EmployerURL = arguments.EmployerURL />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "EmployerURL") />		
		
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


