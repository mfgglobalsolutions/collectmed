 	


<cfcomponent name="pageroleBean" output="false" alias="pageroleBean" extends="PageRoleDAO">

	<cfproperty name="PageRoleID" type="numeric" default="0" />
	<cfproperty name="PageID" type="numeric" default="" />
	<cfproperty name="RoleID" type="numeric" default="" />
	<cfproperty name="SiteID" type="numeric" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.PageRoleID = 0;
		variables.PageID = "";
		variables.RoleID = "";
		variables.SiteID = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="pageroleBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "PageRoleID") AND stValues.PageRoleID NEQ 0>
				<cfquery name="qGetPageRole" datasource="#trim(arguments.ds)#">
			  		SELECT PageRoleID,PageID,RoleID,SiteID,Active,InactiveCode,DateCreated,DateModified
					FROM PageRole  
					WHERE PageRoleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.PageRoleID#" /> 
				</cfquery>		
				<cfif qGetPageRole.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.PageID = qGetPageRole.PageID;
					variables.RoleID = qGetPageRole.RoleID;
					variables.SiteID = qGetPageRole.SiteID;
					variables.Active = qGetPageRole.Active;
					variables.InactiveCode = qGetPageRole.InactiveCode;
					variables.DateModified = qGetPageRole.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "PageRoleID")><cfset variables.PageRoleID = stValues.PageRoleID /></cfif>
			<cfif StructKeyExists(stValues, "PageID")><cfset variables.PageID = stValues.PageID /></cfif>
			<cfif StructKeyExists(stValues, "RoleID")><cfset variables.RoleID = stValues.RoleID /></cfif>
			<cfif StructKeyExists(stValues, "SiteID")><cfset variables.SiteID = stValues.SiteID /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PageRoleID.                                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPageRoleID" acess="public" output="false" returntype="any">
		<cfreturn variables.PageRoleID>
	</cffunction>
	
	<cffunction name="setPageRoleID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PageRoleID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.PageRoleID)) OR trim(arguments.PageRoleID) EQ "">
			<cfset variables.PageRoleID = arguments.PageRoleID />
		<cfelse>
			<cfthrow message="PageRoleID (#arguments.PageRoleID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PageRoleID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PageID.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPageID" acess="public" output="false" returntype="any">
		<cfreturn variables.PageID>
	</cffunction>
	
	<cffunction name="setPageID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PageID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.PageID)) OR trim(arguments.PageID) EQ "">
			<cfset variables.PageID = arguments.PageID />
		<cfelse>
			<cfthrow message="PageID (#arguments.PageID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PageID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for RoleID.                                                --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getRoleID" acess="public" output="false" returntype="any">
		<cfreturn variables.RoleID>
	</cffunction>
	
	<cffunction name="setRoleID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="RoleID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.RoleID)) OR trim(arguments.RoleID) EQ "">
			<cfset variables.RoleID = arguments.RoleID />
		<cfelse>
			<cfthrow message="RoleID (#arguments.RoleID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "RoleID") />		
		
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


