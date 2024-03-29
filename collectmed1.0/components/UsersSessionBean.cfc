 	


<cfcomponent name="userssessionBean" output="false" alias="userssessionBean" extends="UsersSessionDAO">

	<cfproperty name="UsersSessionID" type="numeric" default="0" />
	<cfproperty name="UsersSessionIdentification" type="string" default="" />
	<cfproperty name="UsersID" type="numeric" default="" />
	<cfproperty name="IPAddress" type="string" default="" />
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
		variables.UsersSessionID = 0;
		variables.UsersSessionIdentification = "";
		variables.UsersID = "";
		variables.IPAddress = "";
		variables.SiteID = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="userssessionBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "UsersSessionID") AND stValues.UsersSessionID NEQ 0>
				<cfquery name="qGetUsersSession" datasource="#trim(arguments.ds)#">
			  		SELECT UsersSessionID,UsersSessionIdentification,UsersID,IPAddress,SiteID,Active,InactiveCode,DateCreated,DateModified
					FROM userssession  
					WHERE UsersSessionID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.UsersSessionID#" /> 
				</cfquery>		
				<cfif qGetUsersSession.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.UsersSessionIdentification = qGetUsersSession.UsersSessionIdentification;
					variables.UsersID = qGetUsersSession.UsersID;
					variables.IPAddress = qGetUsersSession.IPAddress;
					variables.SiteID = qGetUsersSession.SiteID;
					variables.Active = qGetUsersSession.Active;
					variables.InactiveCode = qGetUsersSession.InactiveCode;
					variables.DateModified = qGetUsersSession.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "UsersSessionID")><cfset variables.UsersSessionID = stValues.UsersSessionID /></cfif>
			<cfif StructKeyExists(stValues, "UsersSessionIdentification")><cfset variables.UsersSessionIdentification = stValues.UsersSessionIdentification /></cfif>
			<cfif StructKeyExists(stValues, "UsersID")><cfset variables.UsersID = stValues.UsersID /></cfif>
			<cfif StructKeyExists(stValues, "IPAddress")><cfset variables.IPAddress = stValues.IPAddress /></cfif>
			<cfif StructKeyExists(stValues, "SiteID")><cfset variables.SiteID = stValues.SiteID /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for UsersSessionID.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getUsersSessionID" acess="public" output="false" returntype="any">
		<cfreturn variables.UsersSessionID>
	</cffunction>
	
	<cffunction name="setUsersSessionID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="UsersSessionID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.UsersSessionID)) OR trim(arguments.UsersSessionID) EQ "">
			<cfset variables.UsersSessionID = arguments.UsersSessionID />
		<cfelse>
			<cfthrow message="UsersSessionID (#arguments.UsersSessionID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "UsersSessionID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for UsersSessionIdentification.                            --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getUsersSessionIdentification" acess="public" output="false" returntype="any">
		<cfreturn variables.UsersSessionIdentification>
	</cffunction>
	
	<cffunction name="setUsersSessionIdentification" acess="public" output="false" returntype="boolean">
		
		<cfargument name="UsersSessionIdentification" required="true" type="any" />
			
		<cfset variables.UsersSessionIdentification = arguments.UsersSessionIdentification />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "UsersSessionIdentification") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for UsersID.                                               --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getUsersID" acess="public" output="false" returntype="any">
		<cfreturn variables.UsersID>
	</cffunction>
	
	<cffunction name="setUsersID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="UsersID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.UsersID)) OR trim(arguments.UsersID) EQ "">
			<cfset variables.UsersID = arguments.UsersID />
		<cfelse>
			<cfthrow message="UsersID (#arguments.UsersID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "UsersID") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for IPAddress.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getIPAddress" acess="public" output="false" returntype="any">
		<cfreturn variables.IPAddress>
	</cffunction>
	
	<cffunction name="setIPAddress" acess="public" output="false" returntype="boolean">
		
		<cfargument name="IPAddress" required="true" type="any" />
			
		<cfset variables.IPAddress = arguments.IPAddress />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "IPAddress") />		
		
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



