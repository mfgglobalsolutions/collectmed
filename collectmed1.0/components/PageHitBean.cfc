 	


<cfcomponent name="pagehitBean" output="false" alias="pagehitBean" extends="PageHitDAO">

	<cfproperty name="PageHitID" type="numeric" default="0" />
	<cfproperty name="PageID" type="numeric" default="" />
	<cfproperty name="SiteID" type="numeric" default="" />
	<cfproperty name="UsersID" type="numeric" default="" />
	<cfproperty name="IPAddress" type="string" default="" />
	<cfproperty name="BrowserType" type="string" default="" />
	<cfproperty name="BrowserVersion" type="string" default="" />
	<cfproperty name="OperatingSystem" type="string" default="" />
	<cfproperty name="Active" type="string" default="" />
	<cfproperty name="InactiveCode" type="numeric" default="" />
	<cfproperty name="DateCreated" type="datetime" default="" />
	<cfproperty name="DateModified" type="datetime" default="" /> 	

	
	<!-------------------------------------------------------------------------------------->
	<!--- Initialize the CFC with the default properties values.                         --->
	<!-------------------------------------------------------------------------------------->
	<cfscript>
		variables.changedVariables = "";
		variables.PageHitID = 0;
		variables.PageID = "";
		variables.SiteID = "";
		variables.UsersID = "";
		variables.IPAddress = "";
		variables.BrowserType = "";
		variables.BrowserVersion = "";
		variables.OperatingSystem = "";
		variables.Active = "";
		variables.InactiveCode = "";
		variables.DateCreated = "";
		variables.DateModified = ""; 	
	</cfscript> 

	<!-------------------------------------------------------------------------------------->
	<!--- Init function returns this object type.                                        --->
	<!-------------------------------------------------------------------------------------->	
	<cffunction name="init" output="false" returntype="pagehitBean">
		<cfargument name="ds" required="true" type="string" />
		<cfargument name="stValues" required="false" type="struct">
		<cfif isDefined("arguments.stValues")>
			<cfif StructKeyExists(stValues, "PageHitID") AND stValues.PageHitID NEQ 0>
				<cfquery name="qGetPageHit" datasource="#trim(arguments.ds)#">
			  		SELECT PageHitID,PageID,SiteID,UsersID,IPAddress,BrowserType,BrowserVersion,OperatingSystem,Active,InactiveCode,DateCreated,DateModified
					FROM PageHit  
					WHERE PageHitID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#stValues.PageHitID#" /> 
				</cfquery>		
				<cfif qGetPageHit.Recordcount LTE 0>
					<cfthrow message="Could not initialize the object the record was not found." />		
				</cfif>
				<cfscript>
					variables.PageID = qGetPageHit.PageID;
					variables.SiteID = qGetPageHit.SiteID;
					variables.UsersID = qGetPageHit.UsersID;
					variables.IPAddress = qGetPageHit.IPAddress;
					variables.BrowserType = qGetPageHit.BrowserType;
					variables.BrowserVersion = qGetPageHit.BrowserVersion;
					variables.OperatingSystem = qGetPageHit.OperatingSystem;
					variables.Active = qGetPageHit.Active;
					variables.InactiveCode = qGetPageHit.InactiveCode;
					variables.DateModified = qGetPageHit.DateModified;
				</cfscript>
			</cfif>
			<cfif StructKeyExists(stValues, "PageHitID")><cfset variables.PageHitID = stValues.PageHitID /></cfif>
			<cfif StructKeyExists(stValues, "PageID")><cfset variables.PageID = stValues.PageID /></cfif>
			<cfif StructKeyExists(stValues, "SiteID")><cfset variables.SiteID = stValues.SiteID /></cfif>
			<cfif StructKeyExists(stValues, "UsersID")><cfset variables.UsersID = stValues.UsersID /></cfif>
			<cfif StructKeyExists(stValues, "IPAddress")><cfset variables.IPAddress = stValues.IPAddress /></cfif>
			<cfif StructKeyExists(stValues, "BrowserType")><cfset variables.BrowserType = stValues.BrowserType /></cfif>
			<cfif StructKeyExists(stValues, "BrowserVersion")><cfset variables.BrowserVersion = stValues.BrowserVersion /></cfif>
			<cfif StructKeyExists(stValues, "OperatingSystem")><cfset variables.OperatingSystem = stValues.OperatingSystem /></cfif>
			<cfif StructKeyExists(stValues, "Active")><cfset variables.Active = stValues.Active /></cfif>
			<cfif StructKeyExists(stValues, "InactiveCode")><cfset variables.InactiveCode = stValues.InactiveCode /></cfif>
			<cfif StructKeyExists(stValues, "DateCreated")><cfset variables.DateCreated = stValues.DateCreated /></cfif>
			<cfif StructKeyExists(stValues, "DateModified")><cfset variables.DateModified = stValues.DateModified /></cfif>		
		</cfif>
		<cfreturn this>
	</cffunction>
	
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for PageHitID.                                             --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getPageHitID" acess="public" output="false" returntype="any">
		<cfreturn variables.PageHitID>
	</cffunction>
	
	<cffunction name="setPageHitID" acess="public" output="false" returntype="boolean">
		
		<cfargument name="PageHitID" required="true" type="any" />
			
		<cfif IsNumeric(trim(arguments.PageHitID)) OR trim(arguments.PageHitID) EQ "">
			<cfset variables.PageHitID = arguments.PageHitID />
		<cfelse>
			<cfthrow message="PageHitID (#arguments.PageHitID#) is not a valid data type" />
		</cfif>					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "PageHitID") />		
		
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
	<!--- GET and SET methods for BrowserType.                                           --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getBrowserType" acess="public" output="false" returntype="any">
		<cfreturn variables.BrowserType>
	</cffunction>
	
	<cffunction name="setBrowserType" acess="public" output="false" returntype="boolean">
		
		<cfargument name="BrowserType" required="true" type="any" />
			
		<cfset variables.BrowserType = arguments.BrowserType />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "BrowserType") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for BrowserVersion.                                        --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getBrowserVersion" acess="public" output="false" returntype="any">
		<cfreturn variables.BrowserVersion>
	</cffunction>
	
	<cffunction name="setBrowserVersion" acess="public" output="false" returntype="boolean">
		
		<cfargument name="BrowserVersion" required="true" type="any" />
			
		<cfset variables.BrowserVersion = arguments.BrowserVersion />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "BrowserVersion") />		
		
		<cfreturn true>
		
	</cffunction>
	
	<!-------------------------------------------------------------------------------------->
	<!--- GET and SET methods for OperatingSystem.                                       --->
	<!-------------------------------------------------------------------------------------->
	<cffunction name="getOperatingSystem" acess="public" output="false" returntype="any">
		<cfreturn variables.OperatingSystem>
	</cffunction>
	
	<cffunction name="setOperatingSystem" acess="public" output="false" returntype="boolean">
		
		<cfargument name="OperatingSystem" required="true" type="any" />
			
		<cfset variables.OperatingSystem = arguments.OperatingSystem />					
		<cfset variables.changedVariables = ListAppend(variables.changedVariables, "OperatingSystem") />		
		
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


