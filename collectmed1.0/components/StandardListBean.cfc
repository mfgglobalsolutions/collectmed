 	


<cfcomponent name="standardlistBean" output="false" alias="standardlistBean" extends="StandardListDAO">

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
	<cffunction name="init" output="false" returntype="standardlistBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "StandardListID") AND stValues.StandardListID NEQ 0>
				<cfquery name="qGetStandardList" datasource="#trim(arguments.ds)#">
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
		

<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
<!--- NOTE: ANYTHING YOU PLACE BETWEEN THE COMMENTS "Start_Custom_Functions" AND "END_Custom_Functions" WILL BE COPIED WHEN  --->
<!--- THE TAG gcCreateDatabaseTableCFCFile.cfm IS RUN AGAINST THIS TABLE. THIS ALLOWS YOU TO CREATE CUSTOM FUNCTIONS FOR     --->
<!--- THIS TABLE AND KNOW THAT THEY WILL BE COPIED WHEN gcCreateDatabaseTableCFCFile.cfm IS RERUN.                           --->   	
<!---@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--->	
	
	<!---Start_Custom_Functions--->

		
	
	<!---End_Custom_Functions--->		
		
		
</cfcomponent>



